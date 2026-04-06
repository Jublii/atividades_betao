import turtle

screen = turtle.Screen()
screen.bgcolor("black")
screen.title("Surpresa")

t = turtle.Turtle()
t.color("red")
t.fillcolor("red")
t.speed(2)
t.begin_fill()

t.left(140)
t.forward(180)
t.circle(-90, 200)
t.setheading(60)
t.circle(-90, 200)
t.forward(180)
t.end_fill()

t.up()
t.goto(0, -150)
t.down()
t.color("white")
t.write("EU TE AMO", align="center", font=("Verdana", 24, "bold"))

t.hideturtle()
screen.mainloop()