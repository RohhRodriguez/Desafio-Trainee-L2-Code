count = 0

def plus_one():
    global count
    algoc_out.write('PLUSONE\n')
    count += 1

def minus_one():
    global count
    algoc_out.write('MINUSONE\n')
    count -= 1

def inc():
    global count
    algoc_out.write('INC\n')
    count = count + 1 if count > 0 else count - 1

def dup():
    global count
    algoc_out.write('DUP\n')
    count = count * 2

def num_is_not_zero(num):
    if num == 0:
        return False
    algoc_out.write('Constant %d\n' % num)
    return True

def num_is_supported(num):
    if num > 32767 or num < -32768:
        algoc_out.write('NUMBER_NOT_SUPPORTED\n')
        return False
    return True

def plus_or_minus(num):
    if num > 0:
        plus_one()
    else:
        minus_one()

algoc_in = open('algoc.in', 'r')
algoc_out = open('algoc.out', 'w')

for line in algoc_in.readlines():
    count = 0
    num = int(line.strip('\n'))
    if num_is_not_zero(num) and num_is_supported(num):
        plus_or_minus(num) # se for positivo printa PLUSONE e coloca 1 no contador, se for negativo o contrário
        while count != num:
            if num % 2 == 0: #par
                while num / 2 != count:
                    if count > 0 and count * 2 > num / 2 or count < 0 and count * 2 < num / 2:
                        inc()
                    else:
                        dup()
                dup()
            else: #impar
                while num > 0 and num - 1 > count or num < 0 and num + 1 < count:
                    if count > 0 and count * 2 > num - 1 or count < 0 and count * 2 < num + 1:
                        inc()
                    elif count % 2 == 0 and not \
                            (num > 0 and count * 2 >= num - 1 or num < 0 and count * 2 <= num + 1):
                        inc()
                    else:
                        dup()
                inc()
            break
    algoc_out.write('\n')

algoc_in.close()
algoc_out.close()
