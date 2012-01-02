@pattern = /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
test = 'lksodingma.com'
p test =~ @pattern 
#p (/[a-z]{3,3}/ =~ '123idsa')

