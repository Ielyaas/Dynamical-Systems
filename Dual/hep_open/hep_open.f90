!---------------------------------------------------------------------- 
!---------------------------------------------------------------------- 
!   Open cell hepatocyte model, V_plc, Kplc & delta as parameters
!---------------------------------------------------------------------- 
!---------------------------------------------------------------------- 

      SUBROUTINE FUNC(NDIM,U,ICP,PAR,IJAC,F,DFDU,DFDP) 
!     ---------- ---- 

      IMPLICIT NONE
      INTEGER, INTENT(IN) :: NDIM, ICP(*), IJAC
      DOUBLE PRECISION, INTENT(IN) :: U(NDIM), PAR(*)
      DOUBLE PRECISION, INTENT(OUT) :: F(NDIM)
      DOUBLE PRECISION, INTENT(INOUT) :: DFDU(NDIM,NDIM), DFDP(NDIM,*)


      DOUBLE PRECISION c,ce,h,p
      DOUBLE PRECISION Kf, Kb, Kp, Kc, Kh, tauP
      DOUBLE PRECISION Vs, Kbar, Ks
      DOUBLE PRECISION a0, a1, Kce, Vpm, Kpm
      DOUBLE PRECISION gamma, delta
      DOUBLE PRECISION Kplc,V_plc
      DOUBLE PRECISION tau_max, Ktau
      DOUBLE PRECISION m, h_inf, b, a
      DOUBLE PRECISION tau_h,beta,alpha,Po, PLC
      DOUBLE PRECISION Jserca, Jipr, Jin, Jpm

      c=U(1)
      ce=U(2)
      h=U(3)
      p=U(4)
      
       
      
      
      ! IPR
       Kf = 10;
       Kb = 0.4;
       Kp = 0.2;
       Kc = 0.2;
       Kh = 0.08;
       tauP = 1;

      ! Serca
       Vs = 0.9;
       Kbar = 0.00001957;
       Ks = 0.2;
      
      ! Calcium
       gamma = 5.5;
       delta = PAR(3);
       
      ! Membrane flux
       a0 = 0.0027
       a1 = 0.015
       Vpm = 0.11
       Kpm = 0.3
       Kce = 14

      ! IP3
       Kplc = PAR(2);
       V_plc = PAR(1);
      
      ! H
       tau_max = 100;
       Ktau = 0.1;


      m=c**4/(c**4+Kc**4)
      h_inf=Kh**4/(Kh**4+c**4)
      b=p**2/(Kp**2+p**2)
      a=1-b
      tau_h = tau_max*(Ktau**4)/(Ktau**4+c**4)

      beta = b*m*h
      alpha = a*(1-m*h_inf)

      Po=beta/(beta + Kb*(beta+alpha))
      PLC = V_plc*(c**2)/(Kplc**2+c**2)

      Jserca=Vs*(c**2-Kbar*(ce**2))/(c**2+Ks**2)
      Jipr=Kf*Po*(ce-c)
      Jin=a0+a1*(Kce**4/(Kce**4+ce**4))
      Jpm=Vpm*(c**2)/(Kpm**2+c**2)

      
      F(1) = Jipr-Jserca+delta*(Jin-Jpm)
      F(2) = gamma*(Jserca-Jipr)
      F(3) = (h_inf-h)/tau_h
      F(4) = tauP*(PLC - p)


      END SUBROUTINE FUNC

      SUBROUTINE STPNT(NDIM,U,PAR,T)
!     ---------- ----- 

      IMPLICIT NONE
      INTEGER, INTENT(IN) :: NDIM
      DOUBLE PRECISION, INTENT(INOUT) :: U(NDIM),PAR(*)
      DOUBLE PRECISION, INTENT(IN) :: T
     
!start from 0.001
      U(1) = 0.078
      U(2) = 17.63277
      U(3) = 0.525273
      U(4) = 0
      PAR(1)=0
      PAR(2)=0.1
      PAR(3)=2.5


      END SUBROUTINE STPNT

      SUBROUTINE BCND 
      END SUBROUTINE BCND

      SUBROUTINE ICND 
      END SUBROUTINE ICND

      SUBROUTINE FOPT 
      END SUBROUTINE FOPT

      SUBROUTINE PVLS(NDIM,U,PAR)
      
      IMPLICIT NONE
      INTEGER, INTENT(IN) :: NDIM
      DOUBLE PRECISION, INTENT(IN) :: U(NDIM)
      DOUBLE PRECISION, INTENT(INOUT) :: PAR(*)

      DOUBLE PRECISION, EXTERNAL :: GETP,GETU2
      INTEGER NDX,NCOL,NTST
     ! parameters set in this subroutine should be considered as ``solution 
     ! measures'' and be used for output purposes only.
     ! 
     ! they should never be used as `true'' continuation parameters. 
     !
     ! they may, however, be added as ``over-specified parameters'' in the 
     ! parameter list associated with the auto-constant nicp, in order to 
     ! print their values on the screen and in the ``p.xxx file.
     !
     ! they may also appear in the list associated with auto-constant nuzr.
     !
     !---------------------------------------------------------------------- 
     ! for algebraic problems the argument u is, as usual, the state vector.
     ! for differential equations the argument u represents the approximate 
     ! solution on the entire interval [0,1]. in this case its values must 
     ! be accessed indirectly by calls to getp, as illustrated below.
     !---------------------------------------------------------------------- 
     ! 
     ! Set PAR(5) equal to the maximum of U(1)
      PAR(5)=GETP('MAX',1,U)

     ! Set PAR(6) equal to the maximum of U(2)
      PAR(6)=GETP('MAX',2,U)

     ! Set PAR(7) equal to the maximum of U(3)
      PAR(7)=GETP('MAX',3,U)   

      ! Set PAR(5) equal to the maximum of U(1)
      PAR(8)=GETP('MAX',4,U)

     ! Set PAR(6) equal to the maximum of U(2)
      PAR(40)=GETP('MIN',1,U)

     ! Set PAR(7) equal to the maximum of U(3)
      PAR(41)=GETP('MIN',2,U)

        ! Set PAR(6) equal to the maximum of U(2)
        PAR(42)=GETP('MIN',3,U)

        ! Set PAR(7) equal to the maximum of U(3)
        PAR(43)=GETP('MIN',4,U)

      ! Set PAR(20) equal to the real part of the first floquet multipliers
      PAR(80)=GETP('STA',0,U)


      END SUBROUTINE PVLS
