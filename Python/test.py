

# def solution(S, K):
#     # write your code in Python 3.6
#     new = list()
#     for i in reversed(S):
#         if i != '-':
#             new.append(i)
        
    
#     for c, j in enumerate(new):
#         j = j.upper()
#         if c+1 % K == 0:
#             new.insert(c, '-')
            
#     return ''.join(list(reversed(new)))


# def solution(S, K):
#     new = list()
#     for c, i in enumerate(reversed(S)):
#         if i != '-':
#             new.append(i.upper())
#         if c % K == 0 and c != 0:
#             new.append('-')
#     return ''.join(list(reversed(new)))


def solution(S, K):
    new = list()
    c = 0
    for i in reversed(range(len(S))):
        if S[i] == '-':
            continue
        if c != 0 and c % K == 0:
            new.append('-')
        c+=1
        new.append(S[i].upper())
    return ''.join(list(reversed(new)))


# public String licenseKeyFormatting(String S, int K) {
#     StringBuilder sb = new StringBuilder();
#  int count = 0;
#  char[] chars = S.toCharArray(); 
#  for(int i = chars.length-1; i >= 0; i--){
#   if(chars[i] == '-') continue;
#   if(count != 0 && count%K == 0) sb.append('-');
#   count++;
#   sb.append(Character.toUpperCase(chars[i]));
#  }
#  return sb.reverse().toString();     
# }



s = '2-4A0r7-4k'


print(solution(s, 4))