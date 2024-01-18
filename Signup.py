import mysql.connector
import re
alphabets = ["N", "M", "L", "K", "J", "I", "H", "G", "F", "E", "D", "C", "B", "A", ]
arr_seat_names = []
normal_seat_cost = 0

def validate_email(email):
    if re.match(r"[^@]+@[^@]+\.[^@]+", email):
        return True
    return False

def db_connect(str_query):
    try:
        mycon = mysql.connector.connect(host="localhost", user="root", password="DarKKing4", database="quickbook")
        cursor = mycon.cursor()
        cursor.execute(str_query)
        mycon.commit()
        mycon.close()
        return True
    except  mysql.connector.Error as err:
        print("Oops, something went wrong!", err.errno)
        print(err.msg)
        return False

def get_last_insert_id(str_query):
    try:
        print(str_query)
        mycon = mysql.connector.connect(host="localhost", user="root", password="DarKKing4", database="quickbook")
        cursor = mycon.cursor()
        cursor.execute(str_query)
        last_insert_id = cursor.lastrowid
        mycon.commit()
        mycon.close()
        return last_insert_id
    except  mysql.connector.Error as err:
        print("Oops, something went wrong!", err.errno)
        print(err.msg)
        return 0

def execute_query(str_query):
    mycon = mysql.connector.connect(host="localhost", user="root", password="DarKKing4", database="quickbook")
    cursor = mycon.cursor()
    cursor.execute(str_query)
    query_detail = cursor.fetchall()
    return query_detail

def login(first_attempt):
    print("\nFor logging in, please enter your username and password")
    user_name = input("Enter your username: ")
    pass_word = input("Enter your password: ")
    login_query = "select first_name, last_name,email_id, username from user_detail where username='"+user_name+"' and password= '"+pass_word+"'"
    login_detail = execute_query(login_query)
    if len(login_detail) > 0:
        print("Successfully logged in!\n")
        print("Select the city from where you would like to watch your movie")
        print("Please write the number assigned to the respective city")
        chose_city()
    else:
        if first_attempt < 3:
            first_attempt += 1
            print("Invalid Username & Password! Please try again")
            login(first_attempt)
        else:
            print("You've reached the maximum number of attempts, please try again")

def signup():
    bln_insert = True
    print("\nSignup Process")
    print("\nPlease fill the following details")
    first_name = input("Enter your first name: ")
    last_name = input("Enter your last name: ")
    email_id = input("Enter your email id: ")
    while True:
        if validate_email(email_id):
            break
        else:
            print("Invalid email address")
            email_id = input("Enter your email id: ")
    username = input("Enter your username: ")
    password = input("Enter your password: ")
    while True:
        if len(username) <= 30 and len(password) <= 30 and len(username) >= 6 and len(password) >= 6:
            if (username != password):
                break
            else:
                print("Username and Password should not be empty and username and password should not be same!")
                username = input("Enter your username: ")
                password = input("Enter your password")
        else:
            print("Username and Password should contain minimum 6 characters and maximum 30 characters !")
            username = input("Enter your username: ")
            password = input("Enter your password: ")

    check_user_exists_query = "select first_name, last_name,email_id, username from user_detail where username='" + username + "'"
    check_user_exists_detail = execute_query(check_user_exists_query)
    if len(check_user_exists_detail) <= 0:
        str_query = "insert into user_detail (first_name,last_name,email_id,username,password) values ('{}','{}','{}','{}','{}')".format(first_name,last_name,email_id,username,password)
        bln_insert = db_connect(str_query)
        if bln_insert==True:
            print("You have successfully registered with us, please proceed to login.")
            login(1)
        else:
            signup()
    else:
        print("User already exists please try with some other username")
        signup()
def chose_city():
    city_query = "select city_id, city_name from city_detail order by city_id"
    city_detail = execute_query(city_query)
    if len(city_detail) > 0:
        for city_det in city_detail:
            print(str(city_det[0]) +". "+city_det[1])
    while True:
         try:
             chosen_city = int(input("Choose your desired option: "))
             break
         except ValueError:
             print("Please enter numerical value only...")

    city_query = "select city_id, city_name from city_detail where city_id = "+ str(chosen_city)
    city_detail = execute_query(city_query)
    if len(city_detail) > 0:
        print("\nSelect the theatre from where you would like to watch your movie")
        print("Please write the number assigned to the respective theatre")
        chose_theater(chosen_city)
    else:
        print("\nYou have entered a wrong choice, please enter a valid number")
        chose_city()


def chose_theater(chosen_city):
    theatre_query = "select theatre_id, theatre_name from theatre_detail where city_id = "+ str(chosen_city)+ " order by theatre_id"
    theatre_detail = execute_query(theatre_query)
    if len(theatre_detail) > 0:
        for theatre_det in theatre_detail:
            print(str(theatre_det[0])+". "+theatre_det[1])
        print("0. Back")

    while True:
        try:
             chosen_theater = int(input("Choose your desired option: "))
             break
        except ValueError:
             print("Please enter numeric value only...")

    if chosen_theater == 0:
        print("\nSelect the theatre from where you would like to watch your movie")
        print("Please write the number assigned to the respective theatre")
        chose_city()
    else:
        theatre_query = "select theatre_id, theatre_name from theatre_detail where theatre_id = " + str(chosen_theater)+ " and city_id = "+str(chosen_city)
        theatre_detail = execute_query(theatre_query)
        if len(theatre_detail) > 0:
            print("\nSelect the movie that you want to watch")
            print("Please write the number assigned to the respective movie")
            chose_movies(chosen_city,chosen_theater)
        else:
            print("\nYou have entered a wrong choice, please enter a valid number")
            chose_theater(chosen_city)

def chose_movies(chosen_city,chosen_theater):
    movies_query = "select movie_id, movie_name from movie_detail where theatre_id = "+ str(chosen_theater)+ " order by movie_id"
    movies_detail = execute_query(movies_query)
    if len(movies_detail) > 0:
        for movie_det in movies_detail:
            print(str(movie_det[0])+". "+movie_det[1])
        print("0. Back")

    while True:
        try:
             chosen_movie = int(input("Choose your desired option: "))
             break
        except ValueError:
             print("Please enter numeric value only...")

    if chosen_movie == 0:
        print("\nSelect the theatre from where you would like to watch your movie")
        print("Please write the number assigned to the respective theatre")
        chose_theater(chosen_city)
    else:
        movies_query = "select movie_id, movie_name, ticket_amount from movie_detail where movie_id = "+ str(chosen_movie)+ " and theatre_id = "+str(chosen_theater)
        movies_detail = execute_query(movies_query)
        if len(movies_detail) > 0:
            print("\nSelect the screen in which you want to watch")
            print("Please write the number assigned to the respective screen")
            theater_screens(chosen_city,chosen_theater,chosen_movie)
        else:
            print("\nYou have entered a wrong choice, please enter a valid number")
            chose_movies(chosen_city,chosen_theater)

def theater_screens(chosen_city,chosen_theater,chosen_movie):
    screen_query = "select distinct sd.screen_id, sd.screen_name from quickbook.screen_detail sd join quickbook.timing_detail td on (sd.screen_id = td.screen_id and td.movie_id = "+str(chosen_movie)+") order by screen_id"
    screen_detail = execute_query(screen_query)
    if len(screen_detail) > 0:
        for screen_det in screen_detail:
            print(str(screen_det[0])+". "+screen_det[1])
        print("0. Back")

    while True:
        try:
             chosen_screen = int(input("Choose your desired option: "))
             break
        except ValueError:
             print("Please enter numeric value only...")

    if chosen_screen == 0:
        print("\nSelect the movie that you want to watch")
        print("Please write the number assigned to the respective movie")
        chose_movies(chosen_city,chosen_theater)
    else:
        screen_query = "select distinct sd.screen_id, sd.screen_name from screen_detail sd join timing_detail td on (sd.screen_id = td.screen_id and td.movie_id = " + str(chosen_movie) + ") where sd.screen_id= "+str(chosen_screen)+" order by screen_id"
        screen_detail = execute_query(screen_query)
        if len(screen_detail) > 0:
            print("\nPlease choose your comfortable time: ")
            print("Please write the number assigned to the respective timing")
            chose_timing(chosen_city, chosen_theater, chosen_movie, chosen_screen)
        else:
            print("\nYou have entered a wrong choice, please enter a valid number")
            theater_screens(chosen_city,chosen_theater, chosen_movie)

def chose_timing(chosen_city, chosen_theater, chosen_movie, chosen_screen):
    timing_query = "select timing_id, timing from timing_detail where movie_id = "+str(chosen_movie)+" and screen_id = "+str(chosen_screen)+" order by timing_id"
    timing_detail = execute_query(timing_query)
    if len(timing_detail) > 0:
        for timing_det in timing_detail:
            print(str(timing_det[0])+". "+timing_det[1])
        print("0. Back")

    while True:
        try:
             chosen_timing = int(input("Choose your desired option: "))
             break
        except ValueError:
             print("Please enter numeric value only...")

    if chosen_timing == 0:
        print("\nSelect the screen in which you want to watch")
        print("Please write the number assigned to the respective screen")
        theater_screens(chosen_city, chosen_theater, chosen_movie)
    else:
        timing_query = "select timing_id, timing from timing_detail where movie_id = "+str(chosen_movie)+" and screen_id = "+str(chosen_screen)+" and timing_id = "+str(chosen_timing)+" order by timing_id"
        timing_detail = execute_query(timing_query)
        if len(timing_detail) > 0:
            normal_seat_cost = 0
            movies_query = "select movie_id, movie_name, ticket_amount from movie_detail where movie_id = " + str(chosen_movie) + " and theatre_id = " + str(chosen_theater)
            movies_detail = execute_query(movies_query)
            if len(movies_detail) > 0:
                for movie_det in movies_detail:
                    normal_seat_cost = movie_det[2]
            while True:
                try:
                    print(f"\nTicket price ₹{normal_seat_cost}")
                    no_of_tickets = int(input("Please enter the number of tickets you would like to buy: "))
                    if no_of_tickets > 20:
                        print("You cannot book more than 20 tickets at once")
                        continue
                    else:
                        price = no_of_tickets * normal_seat_cost
                        seat_no = display(no_of_tickets)
                        booking_details(chosen_timing, price, no_of_tickets, seat_no)
                        break
                except ValueError:
                    print("Please enter numeric value only...")
        else:
            print("\nYou have entered a wrong choice, please enter a valid number")
            chose_timing(chosen_city, chosen_theater, chosen_movie, chosen_screen)

def seat(start_index, no_of_rows):
    k = 1
    j = start_index
    str_row_name = ""
    while j<no_of_rows:
        while k<=10:
            if k<10:
                str_row_name += "  " + alphabets[j] + str(k) + " , "
                rowname1 = alphabets[j] + str(k)
                arr_seat_names.append(rowname1)
            elif j == (no_of_rows-1):
                str_row_name += "  " + alphabets[j] + str(k) + "\n\n"
                rowname1 = alphabets[j] + str(k)
                arr_seat_names.append(rowname1)
            else:
                str_row_name += "  " + alphabets[j] + str(k) + "\n"
                rowname1 = alphabets[j] + str(k)
                arr_seat_names.append(rowname1)
            k += 1
        k = 1
        j += 1
    print(str_row_name)

def display(no_of_tickets):
    print(" \n Please choose" , no_of_tickets  , "tickets" )
    seat(0,5)
    seat(5,14)
    print("\n------------------------------- Screen --------------------------------")
    seat_no = []
    str_seat_no = ""
    for i in range(no_of_tickets):
        seat_choice = input(" \nPlease enter the seat number from where you want to watch your movie: ")
        seat_choice = seat_choice.upper().strip()

        if seat_choice in arr_seat_names:
            seat_no.append(seat_choice)

    if len(seat_no) != no_of_tickets:
        print("Please choose appropriate seat numbers")
        seat_no = []
        return display(no_of_tickets)
    else:
        return seat_no

def booking_details(chosen_timing, price, no_of_tickets, seat_no):
    user_id = 1
    str_seat_no = str(seat_no).replace("'","''")
    booking_query = "insert into booking_detail (timing_id, user_id, no_of_tickets, ticket_amount, seat_no) values ('{}','{}','{}','{}','{}')".format(chosen_timing, user_id, no_of_tickets, price, str_seat_no)
    last_insert_id = get_last_insert_id(booking_query)
    if last_insert_id > 0:
        booking_detail_query = "SELECT bd.booking_id, bd.timing_id, bd.no_of_tickets, bd.ticket_amount, bd.seat_no, td.timing, md.movie_name, sd.screen_name, th.theatre_name, cd.city_name FROM quickbook.booking_detail bd join quickbook.timing_detail td on (bd.timing_id = td.timing_id) join quickbook.movie_detail md on (md.movie_id = td.movie_id) join quickbook.screen_detail sd on (sd.screen_id = td.screen_id) join quickbook.theatre_detail th on (md.theatre_id = th.theatre_id) join quickbook.city_detail cd on (cd.city_id = th.city_id) where booking_id = "+str(last_insert_id)
        booking_detail = execute_query(booking_detail_query)
        if len(booking_detail) > 0:
            for booking_det in booking_detail:
                print("\n\nBooking successful! Below is your booking details\n")
                print("#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#\n")
                print("Booking id: " + str(booking_det[0]))
                print("City: " + str(booking_det[9]))
                print("Movie Name: " + str(booking_det[6]))
                print("Number of tickets booked: " + str(booking_det[2]))
                print("Cost: " + "₹" + str(booking_det[3]))
                print("Theater: " + str(booking_det[8]))
                print("Screen: " + str(booking_det[7]))
                print("Timing: " + str(booking_det[5]))
                print("Seat No.: " , str(booking_det[4]))
                print("\n#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#\n")
                with open("G:\Vishal\Python_Programs\Thankyou_message.txt", "r", encoding="utf-8") as Thankyou_message:
                    print(Thankyou_message.read())


def signup_login():
    while True:
        try:
            chosen_logintype = int(input("Please enter 1 for SIGNUP and 2 for LOGIN: "))
            break
        except ValueError:
            print("\nPlease enter numerical value only...")
    if chosen_logintype==1:
        signup()
    elif chosen_logintype==2:
        login(1)
    else:
        print("\nPlease enter a correct option")
        signup_login()

if __name__ == '__main__':
    with open("G:\Vishal\Python_Programs\Welcome_message.txt", "r", encoding="utf-8") as Welcome_message:
        print(Welcome_message.read())
    print("If you've already created an account, please proceed to login; otherwise, please start the sign-up process.")
    print("1.SIGNUP \n2.LOGIN")
    signup_login()