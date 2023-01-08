# Parameter file for auto
# Dimension of the system 
NDIM =   5
# Type of problem (Here following point)
IPS =   1
# Where to restart computation (Here new pb)
IRS =   0
# Detection of fold
 ILP =   1
# Continuation parameter
ICP =  [1,2,4,5,6,7,8,31,32,33,34,35,80]
# mesh interval
NTST=  100
# Collocation point
NCOL=   5
# Mesh adaptation
IAD =   3
# Bifurcation detection
ISP =   2
# Branch switching
ISW = 1
# Selection of principal measure (0 is L2)
IPLT= 0
# Number of boundary condition
NBC= 0
# Number of integral condition
NINT= 0
# Number maximum of step
NMX=  200000
# Parameter interval
RL0= 0
RL1= 1.5
# Number of step before saving
NPR=  5000
# Maximum number of bifurcation to be treated
MXBF=  1
# Control diagnosis output
IID =   4
# Maxmum number of iteration to find special solutions
ITMX= 8
# Maximum number of correction step
ITNW= 5
# Number of Full Newton correction step
NWTN= 6
# User defined derivatives
JAC= 0
# Precision parameters
EPSL= 1e-06, EPSU = 1e-06, EPSS = 1e-04
# Start step size (sign matter)
DS  =   1e-6
# Min Step Size
DSMIN= 1e-10
# Max Step Size
DSMAX=   1e-02
# Number of adaptation between step size
IADS=   1
# Number max of parameters
NPAR=   80
#Output Control
#unames = {1:'R', 2:'c', 3:'ct', 4:'h', 5:'p'}
parnames = {1:'V_plc', 2:'V_pkc'}  
# Special weights
THL =  {}, THU =  {}
# special values of output
UZR =  {}
UZSTOP={}
