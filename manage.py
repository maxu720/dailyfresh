#!/usr/bin/env python
import os
import sys

try:
    reload(sys)
    sys.setdefaultencoding('utf-8')
except:
    pass

print(sys.path)


if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "dailyfresh_23.settings")

    from django.core.management import execute_from_command_line

    execute_from_command_line(sys.argv)

    # args = ['','runserver']


    # execute_from_command_line(args)
