#!/usr/local/bin/python


# This is an example of an 'expert' AUTO CLUI script.
# This script takes a set of AUTO data files and produces
# files which can be read into Matlab .
# For example, the command:
#
#   auto -x to_matlab.xauto foo bar
#
# will take the bifurcation diagram file b.foo and produce
# the file bar_bifur, and it will take the solution
# file s.foo and, for each solution in the file,
# produce a file bar_solution_??, where ?? is
# the solution label number.

# In expert scripts we need to explicitly import the
# AUTOclui library
from AUTOclui import *

# We also import a few general Python utility
# libraries.
import sys

# This function actually performs the decoding of the
# AUTO data files.
def to_matlab(filename,prefix):
    # First we parse the bifurcation diagram file.
    print(filename)
    try:
        data=dg(filename)
    # The Python object has a method for taking the
    # data and writing it out as columns, so
    # we use that here.
        data.writeRawFilename(prefix+'_bifur')
    except:
        print 'No bifurcation file'
    
    # Next, we write out the solutions by first
    # parsing the file.
    data=sl(filename)
    # The we iterate over each of the solutions in the file
    # using the loop.
    aux=1
    for solution in data:
        # Just like above, the Python object for solutions
        # has a method for taking the
        # data and writing it out as columns, so
        # we use that here.
        #solution.writeRawFilename(prefix+'_solution_'+`solution["Label"]`)
        solution.writeRawFilename(prefix+'_solution_'+str(aux))
        aux=aux+1
    print aux


# This is the Python syntax for making a script runnable    
if __name__ == '__main__':
    # The first argument is the name of the file that
    # you wish to parse.
    filename = sys.argv[1]
    # The second argument is the prefix to use for the
    # output files.
    prefix = sys.argv[2]
    to_matlab(filename,prefix)







