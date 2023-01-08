!-------------------------------------------------------
!-------------------------------------------------------
!    Fixed h model for critical manifold
! -------------------------------------------------------
! -------------------------------------------------------

      SUBROUTINE FUNC(NDIM,U,ICP,PAR,IJAC,F,DFDU,DFDP) 
!     ---------- ---- 

      IMPLICIT NONE
      INTEGER, INTENT(IN) :: NDIM, ICP(*), IJAC
      DOUBLE PRECISION, INTENT(IN) :: U(NDIM), PAR(*)
      DOUBLE PRECISION, INTENT(OUT) :: F(NDIM)
      DOUBLE PRECISION, INTENT(INOUT) :: DFDU(NDIM,NDIM), DFDP(NDIM,*)


   DOUBLE PRECISION c,p
   DOUBLE PRECISION ce, gamma, ct
   DOUBLE PRECISION Kc, Kp, Kh, h, Kb, Kf
   DOUBLE PRECISION Vs, Kbar, Ks
   DOUBLE PRECISION R_act, K_PLC, tau_p
   DOUBLE PRECISION phi_c, phi_p, phi_p_down, h_inf
   DOUBLE PRECISION beta, alpha, Po
   DOUBLE PRECISION Jipr, Jserca, PLC

   c=U(1)
   p=U(2)


   ! Calcium
   gamma = 5.5;
   ct = PAR(1);
   
   ! IPR
   Kc = 0.2;
   Kp = 0.2;
   Kh = 0.08;
   h = PAR(2);
   Kb = 0.4;
   Kf = 10;

   ! Serca
   Vs = 0.9;
   Kbar = 0.00001957;
   Ks = 0.2;
   
   ! IP3
   R_act = 0.51;
   K_PLC = 0.1;
   tau_p = 1;

   ! FUNCTIONS

   ce = gamma*(ct-c)
   
   phi_c = c**4/(c**4+Kc**4)
   phi_p = p**2/(p**2+Kp**2)
   phi_p_down = Kp**2/(p**2+Kp**2)
   h_inf = Kh**4/(c**4+Kh**4)

   beta = phi_p*phi_c*h
   alpha = phi_p_down*(1-phi_c*h_inf)

   Po = beta/(beta+Kb*(beta+alpha))
   Jipr = Kf*Po*(ce-c)

   Jserca = Vs*(c**2-Kbar*ce**2)/(c**2+Ks**2)
   PLC = R_act*c**2/(c**2+K_PLC**2)


   F(1) = Jipr - Jserca
   F(2) = tau_p*(PLC-p)
   !WRITE(*,*)F

 END SUBROUTINE FUNC

 SUBROUTINE STPNT(NDIM,U,PAR,T)
 !-------------------------------------------------------
 
   IMPLICIT NONE
   INTEGER, INTENT(IN) :: NDIM
   DOUBLE PRECISION, INTENT(INOUT) :: U(NDIM),PAR(*)
   DOUBLE PRECISION, INTENT(IN) :: T

   ! Initial Conditions
   U(1) = 0.0023753 
   U(2) = 0.00028758
   PAR(1) = 0.1
   PAR(2) = 0.001

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

     ! Set PAR(7) equal to the minimum of U(1)
      PAR(7)=GETP('MIN',1,U)   

     ! Set PAR(5) equal to the minimum of U(2)
      PAR(8)=GETP('MIN',2,U) 

     ! Set PAR(20) equal to the real part of the first floquet multipliers
      PAR(80)=GETP('STA',0,U)


      END SUBROUTINE PVLS
