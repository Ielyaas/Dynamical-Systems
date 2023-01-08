# Parameter file for auto
# Dimension of the system 
NDIM =   3
# Type of problem (Here following point)
IPS =   1
# Where to restart computation (Here new pb)
IRS =   0
# Detection of fold
 ILP =   1
# Continuation parameter
ICP =  [1,2,3,5,6,7,8,9,10,80]
# mesh interval
NTST=  100
# Collocation point
NCOL=   4
# Mesh adaptation
IAD =   3
# Bifurcation detection
ISP =   1
# Branch switching
ISW = 1
# Selection of principal measure (0 is L2)
IPLT= 0
# Number of boundary condition
NBC= 0
# Number of integral condition
NINT= 0
# Number maximum of step
NMX=  2000
# Parameter interval

# Number of step before saving
NPR=  200
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
EPSL= 1e-08, EPSU = 1e-08, EPSS = 1e-06
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
#unames = {1:'C', 2:'H', 3:'P'}
parnames = {1: 'R_act',2:'ct',3:'K_PLC',4:'tau_max'}  
# Special weights
THL =  {}, THU =  {}
# special values of output
UZR =  {}
UZSTOP={}
