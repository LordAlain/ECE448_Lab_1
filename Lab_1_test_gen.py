import io

rst = clk = mode = start = 0
a = b = y = z = done = 0
textFile = ""


def test():
    global rst, clk, mode, start
    global a, b, y, z, done
    global textFile
    # Generate test statement
    in_status = (rst * 8) + (clk * 4) + (mode * 2) + start
    in_vector = (a * 8) + b
    out_vector = y
    out_status = (z * 2) + done

    test_statement = '(x"{0:b}", o"{1:o}", o"{2:o}", "{3:o}"),'.format(
        in_status, in_vector, out_vector, out_status)
    textFile = textFile + "\n" + test_statement
    # print(test_statement)


PrimeList = [1, 2, 3, 5, 7, 11, 13, 17, 19,
             23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
Div8_List = [1, 8, 16, 32, 40, 48, 56, 64]
Div13_List = [1, 13, 26, 39, 52, 65]
Triangle_List = [0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66]
Square_List = [0, 1, 4, 9, 16, 25, 36, 49, 64]
Pentagonal_List = [1, 5, 12, 22, 35, 51, 70]
Hexagonal_List = [1, 6, 15, 28, 45, 66]
Heptagonal_List = [1, 7, 18, 34, 55, 81]
combo_Lists = [PrimeList, Div8_List, Div13_List, Triangle_List,
               Square_List, Pentagonal_List, Hexagonal_List, Heptagonal_List]


def Combo_mode():
    global a, b, y, z, done
    y = 0
    done = 1
    z = 0
    # print("b = ", b, "combolists[b] = ", combo_Lists[b])
    for ans in combo_Lists[b]:
        if a == ans:
            z = 1
            break


def Seq_mode():
    global a, b, y, z, done
    z = 0
    y = (a ** b) % 64
    done = 1


def printList():
    txt = "constant Prime_List: List := ("
    for val in PrimeList:
        Listprint = 'o"{0:o}", '.format(val)
        txt = txt + Listprint

    txt += "); \nconstant Div8_List: List := ("
    for val in Div8_List:
        Listprint = 'o"{0:o}", '.format(val)
        txt = txt + Listprint

    txt += "); \nconstant Div13_List: List := ("
    for val in Div13_List:
        Listprint = 'o"{0:o}", '.format(val)
        txt = txt + Listprint

    txt += "); \nconstant Triangle_List: List := ("
    for val in Triangle_List:
        Listprint = 'o"{0:o}", '.format(val)
        txt = txt + Listprint

    txt += "); \nconstant Square_List: List := ("
    for val in Square_List:
        Listprint = 'o"{0:o}", '.format(val)
        txt = txt + Listprint

    txt += "); \nconstant Pentagonal_List: List := ("
    for val in Pentagonal_List:
        Listprint = 'o"{0:o}", '.format(val)
        txt = txt + Listprint

    txt += "); \nconstant Hexagonal_List: List := ("
    for val in Hexagonal_List:
        Listprint = 'o"{0:o}", '.format(val)
        txt = txt + Listprint

    txt += "); \nconstant Heptagonal_List: List := ("
    for val in Heptagonal_List:
        Listprint = 'o"{0:o}", '.format(val)
        txt = txt + Listprint

    txt += "); \n"
    f = open("Lists.txt", "w")
    f.write(txt)
    f.close()


printList()

for mode in range(2):
    for b in range(8):
        for a in range(64):
            # Combinational Mode
            if mode == 0:
                Combo_mode()
            # Sequential Mode
            elif mode == 1:
                Seq_mode()

            # Test and Iterate
            test()

# f = open("TestbenchTests.txt", "w")
# f.write(textFile)
# f.close()
