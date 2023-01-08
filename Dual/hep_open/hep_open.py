r1 = run(e='hep_open',c='hep_open.eq',NMX=10000,NPR=1000)
r2 = run(r1('HB1'), c='hep_open.per')


r2 = run(r1('HB1'), IPS=2, ISW=-1,ICP=[1,5,6,7,8,9])

#Matlab export
AUTO> save(r1,'Test')
Saving to b.Test, s.Test, and d.Test ... done
AUTO> cl
Deleting fort.* *.o *.exe *.*~ ... done
AUTO> exit
sc-math-354651:hep_open iclo003$ ls
b.Test		c.hep_open.eq	c.hep_open.per	d.Test		hep_open.f90	hep_open.py	s.Test		to_matlab.py
sc-math-354651:hep_open iclo003$ mkdir MatlabExport
sc-math-354651:hep_open iclo003$ ls
MatlabExport	b.Test		c.hep_open.eq	c.hep_open.per	d.Test		hep_open.f90	hep_open.py	s.Test		to_matlab.py
sc-math-354651:hep_open iclo003$ auto to_matlab.py Test ./MatlabExport/Test
AUTO Runtime Error: [Errno 2] No such file or directory: 'Test'
AUTO Runtime Error: [Errno 2] No such file or directory: './MatlabExport/Test'
sc-math-354651:hep_open iclo003$ autox to_matlab.py Test ./MatlabExport/Test
Test
Parsed file: b.Test
Parsed file: s.Test
7
sc-math-354651:hep_open iclo003$ ls
MatlabExport	b.Test		c.hep_open.eq	c.hep_open.per	d.Test		hep_open.f90	hep_open.py	s.Test		to_matlab.py
sc-math-354651:hep_open iclo003$ r1 = run(e='hep_open',c='hep_open.eq',NMX=10000,NPR=10000ICP=[1,10,80])
-bash: syntax error near unexpected token `('
sc-math-354651:hep_open iclo003$ r1 = run(e='hep_open',c='hep_open.eq',NMX=10000,NPR=10000ICP=[1,10,80])
-bash: syntax error near unexpected token `('
sc-math-354651:hep_open iclo003$ r1 = run(e='hep_open',c='hep_open.eq',NMX=10000,NPR=10000,ICP=[1,10,80])
-bash: syntax error near unexpected token `('
sc-math-354651:hep_open iclo003$ auto
Python 2.7.10 (default, Feb  7 2017, 00:08:15) 
[GCC 4.2.1 Compatible Apple LLVM 8.0.0 (clang-800.0.34)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
(AUTOInteractiveConsole)
AUTO> r1 = run(e='hep_open',c='hep_open.eq',NMX=10000,NPR=10000,ICP=[1,10,80])
gfortran -fopenmp -O -c hep_open.f90 -o hep_open.o
gfortran -fopenmp -O hep_open.o -o hep_open.exe /Users/Shared/auto/07p/lib/*.o
Starting hep_open ...

  BR    PT  TY  LAB     V_plc        L2-NORM          C             Ce            H             P          PAR(10)       PAR(80)    
   1     1  EP    1   0.00000E+00   1.86274E+01   8.23050E-02   1.86052E+01   9.05952E-01   0.00000E+00   9.05952E-01   4.00000E+00
   1   505  HB    2   1.42105E-01   1.99458E+01   1.11659E-01   1.99316E+01   7.39841E-01   7.88561E-02   7.39841E-01   4.00000E+00
   1  2419  HB    3   7.85811E-01   1.16959E+00   2.22929E-01   9.31265E-01   1.51810E-01   6.54178E-01   1.51810E-01   2.00000E+00
   1  2646  EP    4   2.00132E+00   2.64564E+00   5.95819E-01   1.68985E+00   3.49538E-03   1.94649E+00   3.49538E-03   4.00000E+00

 Total Time    0.228E+00
hep_open ... done
