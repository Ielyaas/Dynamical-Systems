!--------------------------------------------------------------------------------------
!--------------------------------------------------------------------------------------
!			PKC Receptor phosphorylation model. V_pkc and V_plc as parameters
!           Reduced model 
!--------------------------------------------------------------------------------------
!--------------------------------------------------------------------------------------

        SUBROUTINE FUNC(NDIM,U,ICP,PAR,IJAC,F,DFDU,DFDP)


        IMPLICIT NONE
        INTEGER, INTENT(IN) :: NDIM, ICP(*), IJAC
        DOUBLE PRECISION, INTENT(IN) :: U(NDIM), PAR(*)
        DOUBLE PRECISION, INTENT(OUT) :: F(NDIM)
        DOUBLE PRECISION, INTENT(INOUT) :: DFDU(NDIM,NDIM), DFDP(NDIM,*)


        DOUBLE PRECISION R1, R2, c, ct ,h ,p
        DOUBLE PRECISION A1, K1, K3
        DOUBLE PRECISION k12, k_12, k14, k_14
        DOUBLE PRECISION A2, K2, K4
        DOUBLE PRECISION k22, k_22, k24, k_24
        DOUBLE PRECISION Kf, Kc, Kp, Kb, Kp_tilde
        DOUBLE PRECISION tau_max, Ktau, Kh
        DOUBLE PRECISION Vs, Kbar, Ks
        DOUBLE PRECISION Vpm, Kpm, alpha0, alpha1, Kce
        DOUBLE PRECISION delta, gamma, ce, tau_c
        DOUBLE PRECISION V_pkc, Kplc, Kpkc, V_plc
        DOUBLE PRECISION kL, k_L, k_r, kmin, k_i
        DOUBLE PRECISION L_t, Q_t
        DOUBLE PRECISION rho1_d, rho1_p
        DOUBLE PRECISION rho2_d, rho2_p
        DOUBLE PRECISION kr, L, D, kplus1, kplus2, Q1, Q2, sw, in
        DOUBLE PRECISION phi_c, phi_p, phi_p_down, h_inf, tau
        DOUBLE PRECISION beta, alpha, Po, PLC, PKC
        DOUBLE PRECISION Jipr, Jserca, Jin, Jpm


        R1=U(1)
        R2=U(2)
        c=U(3)
        ct=U(4)
        h=U(5)
        p=U(6)


        ! Receptor
        
        A1 = 0.5;
        K1 = 0.5;
        K3 = 2;
        k12 = 0.5;
        k_12 = 0.05;
        k14 = 0.05;
        k_14 = 0.5;

        A2 = 0;
        K2 = 0.005;
        K4 = 200;
        k22 = 0.05;
        k_22 = 0.05;
        k24 = 0.05;
        k_24 = 0.05;

        ! IPR

        Kf = 40;
        Kc = 0.2;
        Kp = 0.3;
        Kb = 0.4;
        Kh = 0.1;

        ! H

        tau_max = 200;
        Ktau = 0.09;

        ! Serca

        Vs = 0.9;
        Kbar = 1.5e-5;
        Ks = 0.2;

        ! PM Membrane

        Vpm = PAR(5);
        Kpm = 0.3;
        alpha0 = 0.003;
        alpha1 = 0.01;
        Kce = 14;

        ! Calcium

        delta = 2.5;
        gamma = 5.5;
        tau_c = 2;

        ! Feedbacks

        V_plc = PAR(1);
        Kplc = 0.11;
        V_pkc = PAR(2);
        Kpkc = 0.3;
        kL = 0.5;
        k_L = 0.008;
        k_r = 0.167;
        kmin = 0.1;
        k_i = 2;

        ! Conservation

        L_t = 0.8;
        Q_t = 1.087;

        ! Switch

        sw = PAR(3);
        in = PAR(4);

        ! Functions

        rho1_d = k14/(1+K3) + k_12/(1+(1/K3))
        rho1_p = k_14*K1/(K1+A1) + k12*A1/(K1+A1)

        rho2_d = k24/(1+K4) + k_22/(1+(1/K4))
        rho2_p = k_24*K2/(K2+A2) + k22*A2/(K2+A2)

        ce = gamma*(ct-c)

        kr = (R1*A1/(K1+A1) + R2*A2/(K2+A2))*(V_plc*c**2/(c**2+Kplc**2))

        L = kr*L_t/(kr+k_r)
        D = kL*L/k_L

        Jin = in*(alpha0 + alpha1*Kce**4/(ce**4+Kce**4))
        kplus1 = V_pkc*D*(c**2/(c**2+Kpkc**2) + Jin**2/(Jin**2+Kpkc**2))
        kplus2 = V_pkc*D*c**2/(c**2+Kpkc**2)

        Q1 = kplus1*Q_t/(kplus1+kmin)
        Q2 = kplus2*Q_t/(kplus2+kmin)

        Kp_tilde = Kp*(1-sw*Q1)
        phi_c = c**4/(c**4+Kc**4)
        phi_p = p**2/(p**2+Kp_tilde**2)
        phi_p_down = Kp_tilde**2/(p**2+Kp_tilde**2)
        h_inf = Kh**4/(c**4+Kh**4)
        tau = tau_max*Ktau**4/(c**4+Ktau**4)

        beta = phi_c*phi_p*h
        alpha = phi_p_down*(1-phi_c*h_inf)

        Po = beta/(beta+Kb*(beta+alpha))

        Jipr = Kf*Po*(ce-c)
        Jserca = Vs*(c**2-Kbar*ce**2)/(c**2+Ks**2)
        Jpm = Vpm*c**2/(c**2+Kpm**2)

        ! ODE's
        WRITE(10,*) Kp_tilde
        F(1) = (1-R1)*rho1_d - R1*Q1*rho1_p
        F(2) = (1-R2)*rho2_d - R2*Q2*rho2_p
        F(3) = (Jipr - Jserca + delta*(Jin-Jpm))/tau_c
        F(4) = delta*(Jin-Jpm)
        F(5) = (h_inf-h)/tau
        F(6) = kL*L - k_i*p 
        
        END SUBROUTINE FUNC

        SUBROUTINE STPNT(NDIM,U,PAR,T)


        IMPLICIT NONE
        INTEGER, INTENT(IN) :: NDIM
        DOUBLE PRECISION, INTENT(INOUT) :: U(NDIM),PAR(*)
        DOUBLE PRECISION, INTENT(IN) :: T

        ! Initial conditions

        U(1) = 1
        U(2) = 1
        U(3) = 0.0805296
        U(4) = 3.861011
        U(5) = 0.70395
        U(6) = 1e-10
        PAR(1) = 0
        PAR(2) = 0.1
        PAR(3) = 1
        PAR(4) = 1
        PAR(5) = 0.07

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
        ! Set PAR(4) equal to the maximum of U(1)
        PAR(31)=GETP('MAX',1,U)

        ! Set PAR(5) equal to the maximum of U(2)
        PAR(32)=GETP('MAX',2,U)

        ! Set PAR(6) equal to the maximum of U(3)
        PAR(33)=GETP('MAX',3,U)   

        ! Set PAR(7) equal to the maximum of U(4)
        PAR(34)=GETP('MAX',4,U)

        ! Set PAR(8) equal to the maximum of U(5)
        PAR(35)=GETP('MAX',5,U)  

        ! Set PAR(8) equal to the maximum of U(6)
        PAR(36)=GETP('MAX',6,U)

        ! Set PAR(31) equal to the minimum of U(1)
        PAR(41)=GETP('MIN',1,U)   

        ! Set PAR(32) equal to the minimum of U(2)
        PAR(42)=GETP('MIN',2,U)

        ! Set PAR(33) equal to the minimum of U(3)
        PAR(43)=GETP('MIN',3,U)

        ! Set PAR(34) equal to the minimum of U(4)
        PAR(44)=GETP('MIN',4,U)

        ! Set PAR(35) equal to the minimum of U(5)
        PAR(45)=GETP('MIN',5,U)  
        
        ! Set PAR(35) equal to the minimum of U(6)
        PAR(46)=GETP('MIN',6,U)

        ! Set PAR(80) equal to the real part of the first floquet multipliers
        PAR(80)=GETP('STA',0,U)


		END SUBROUTINE PVLS

