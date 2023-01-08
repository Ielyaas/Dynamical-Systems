!---------------------------------------------------------------------- 
!---------------------------------------------------------------------- 
!   Closed cell hepatocyte model, h as parameter
!---------------------------------------------------------------------- 
!---------------------------------------------------------------------- 

      SUBROUTINE FUNC(NDIM,U,ICP,PAR,IJAC,F,DFDU,DFDP) 
!     ---------- ---- 

      IMPLICIT NONE
      INTEGER, INTENT(IN) :: NDIM, ICP(*), IJAC
      DOUBLE PRECISION, INTENT(IN) :: U(NDIM), PAR(*)
      DOUBLE PRECISION, INTENT(OUT) :: F(NDIM)
      DOUBLE PRECISION, INTENT(INOUT) :: DFDU(NDIM,NDIM), DFDP(NDIM,*)

      DOUBLE PRECISION c,ct,p
      DOUBLE PRECISION Kf, Kb, Kp, Kc, Kh, tauP
      DOUBLE PRECISION Vs, Kbar, Ks
      DOUBLE PRECISION gamma, h, ce, delta
      DOUBLE PRECISION tau_max, Ktau
      DOUBLE PRECISION Kplc, R_act
      DOUBLE PRECISION alpha0, alpha1, Kce, Vpm, Kpm
      DOUBLE PRECISION phi_c, h_inf, phi_p, phi_p_down
      DOUBLE PRECISION tau_h,beta,alpha,Po, PLC
      DOUBLE PRECISION Jserca, Jipr, Jin, Jpm

      c=U(1)
      ct=U(2)
      p=U(3)

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
      delta = 2.5;

      ! IP3
      Kplc = 0.1;
      R_act = 0.51;
      
      ! H
      h = PAR(1);
      tau_max = 100;
      Ktau = 0.09;

      phi_c=c**4/(c**4+Kc**4)
      h_inf=Kh**4/(Kh**4+c**4)
      phi_p=p**2/(Kp**2+p**2)
      phi_p_down=Kp**2/(p**2+Kp**2)
      tau_h = tau_max*(Ktau**4)/(Ktau**4+c**4)

      beta = phi_p*phi_c*h
      alpha = phi_p_down*(1-phi_c*h_inf)

      Po=beta/(beta + Kb*(beta+alpha))
      PLC = R_act*(c**2)/(Kplc**2+c**2)


      ce=gamma*(ct-c)

      Jserca=Vs*(c**2-Kbar*(ce**2))/(c**2+Ks**2)
      Jipr=Kf*Po*(ce-c)

      Jin=alpha0+alpha1*Kce**4/(ce**4+Kce**4)
      Jpm=Vpm*c**2/(c**2+Kpm**2)

      F(1)=Jipr-Jserca
      F(2)=delta*(Jin-Jpm)
      F(3)=tauP*(PLC-p)


      END SUBROUTINE FUNC

      SUBROUTINE STPNT(NDIM,U,PAR,T)
!     ---------- ----- 

      IMPLICIT NONE
      INTEGER, INTENT(IN) :: NDIM
      DOUBLE PRECISION, INTENT(INOUT) :: U(NDIM),PAR(*)
      DOUBLE PRECISION, INTENT(IN) :: T
     
      !start from 0.001
      U(1) = 0.078003826
      U(2) = 3.2839616267
      U(3) = 0.192926464
      PAR(1)=0.001

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

      ! Set PAR(8) equal to the minimum of U(1)
      PAR(8)=GETP('MIN',1,U)

     ! Set PAR(9) equal to the minimum of U(2)
      PAR(9)=GETP('MIN',2,U)

     ! Set PAR(10) equal to the minimum of U(3)
      PAR(10)=GETP('MIN',3,U)   

      ! Set PAR(80) equal to the real part of the first floquet multipliers
      PAR(80)=GETP('STA',0,U)


      END SUBROUTINE PVLS
