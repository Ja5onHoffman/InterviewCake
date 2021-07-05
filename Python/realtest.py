
a = [1, 2, 3, 4, 4, 5, 5]
b = [1, 2, 1, 3, 4, 3, 5, 1, 2]


def solution(A):
    a = list(reversed(sorted(A)))
    c = 1
    d = 1
    last = -1000
    
    for i in range(len(a)):
        n = l(a[i], i, a)
        if n > c:
            c = n
        if c > 1:
            last = i

    for j in range(last, len(a)):
        n = l(a[j], j, a)
        if n > d:
            d = n

        
    return c + d


def l(n, index, arr):
    c = 0
    for i in range(index, len(arr)):
        if arr[i] == n:
            c += 1
        else:
            break
    return c




print(solution(b))