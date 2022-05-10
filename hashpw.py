#!python3

import crypt
import sys

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('usage: hashpw.py [password]')
        sys.exit(1)
    pass_plain = sys.argv[1].strip()
    salt = crypt.mksalt(crypt.METHOD_SHA512)
    pass_crypt = crypt.crypt(pass_plain, salt)
    print(pass_crypt)