
def divide(x, y):

    if y > x:
        return 0

    q = divide(x, 2*y)
    testX = 2 * q * y
    print('x = ' + str(x) + ' y = ' + str(y) + ' q = ' + str(q) + ' testX = ' + str(testX))

    if ((x - testX) < y):
        return 2*q
    else:
        return (2*q) + 1

testXFast = 0

def divideFast(x, y):

    global testXFast

    if y > x:
        testXFast = 0
        return 0

    q = divideFast(x, 2*y)
    if q & 1:
        testXFast = testXFast + 2*y
    print('x = ' + str(x) + ' y = ' + str(y) + ' q = ' + str(q) + ' testX = ' + str(testXFast))

    if ((x - testXFast) < y):
        return 2*q
    else:
        return (2*q) + 1


a = divideFast(80, 3)
print('80 / 3 = ' + str(a))
