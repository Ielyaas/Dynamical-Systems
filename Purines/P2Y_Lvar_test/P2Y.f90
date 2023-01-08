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


        DOUBLE PRECISION R, c, ct ,h ,p, L
        DOUBLE PRECISION A, K1, K3
        DOUBLE PRECISION k2, k_2, k4, k_4
        DOUBLE PRECISION Kf, Kc, Kp, Kb, Kc_tilde
        DOUBLE PRECISION tau_max, Ktau, Kh, Ktau_til
        DOUBLE PRECISION tau_max_til
        DOUBLE PRECISION Vs, Kbar, Ks
        DOUBLE PRECISION Vpm, Kpm, alpha0, alpha1, Kce
        DOUBLE PRECISION alpha0_til, alpha1_til
        DOUBLE PRECISION delta, gamma, ce, tau_c
        DOUBLE PRECISION V_pkc, Kplc, Kpkc, V_plc
        DOUBLE PRECISION V_5p, V_3k, K_3k
        DOUBLE PRECISION nu_deg, eta, tau_p
        DOUBLE PRECISION kL, k_L, k_r, kmin, k_i
        DOUBLE PRECISION L_t, Q_t1, Q_t2, Q_tilde
        DOUBLE PRECISION sigma, omega, lambda1, lambda2, lambda3
        DOUBLE PRECISION rho_d, rho_p
        DOUBLE PRECISION kr, D, kplus1, kplus2, Q1, Q2, sw
        DOUBLE PRECISION phi_c, phi_p, phi_p_down, h_inf, tau
        DOUBLE PRECISION beta, alpha, Po, PLC, PKC
        DOUBLE PRECISION Jipr, Jserca, Jin, Jpm


        R=U(1)
        c=U(2)
        ct=U(3)
        h=U(4)
        p=U(5)
        L=U(6)


        ! Receptor
        
        A = 0.5;
        K1 = 0.05;
        K3 = 20;
        k2 = 0.5;
        k_2 = 0.05;
        k4 = 0.05;
        k_4 = 0.5;

        ! IPR

        Kf = 40;
        Kc = 0.2;
        Kp = 0.3;
        Kb = 0.4;
        Kh = 0.1;

        ! H

        tau_max = PAR(6);
        Ktau = PAR(5);

        ! Serca

        Vs = 0.9;
        Kbar = 1.5e-5;
        Ks = 0.2;

        ! PM Membrane

        Vpm = 0.07;
        Kpm = 0.3;
        alpha0 = 0.003;
        alpha1 = 0.01;
        Kce = 14;

        ! Calcium

        delta = PAR(4);
        gamma = 5.5;
        tau_c = 2;
        ! lambda1 = 0;
        ! lambda2 = 0;
        lambda1 = 147;
        lambda2 = 0.36;
        lambda3 = 0.4;

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
        V_5p = 0.0001;
        V_3k = 0.05;
        K_3k = 0.4;

        ! PKC

        ! Change sigma and omega for each receptor!
        sigma = 1;
        omega = 1;

        ! Conservation

        L_t = 0.8;
        Q_t1 = 0.887;
        Q_t2 = 1.087;

        ! Switch

        sw = PAR(3)

        ! Functions

        alpha0_til = delta*alpha0
        alpha1_til = delta*alpha1

        rho_d = k4/(1+K3) + k_2/(1+(1/K3))
        rho_p = k_4*K1/(K1+A) + k2*A/(K1+A)

        ce = gamma*(ct-c)

        D = kL*L/k_L

        Jin = alpha0_til + alpha1_til*Kce**4/(ce**4+Kce**4)
        kplus1 = V_pkc*D*alpha1_til*Kce**4/(ce**4+Kce**4)
        kplus2 = V_pkc*D*c**2/(c**2+Kpkc**2)

        Q1 = kplus1*Q_t1/(kplus1+kmin)
        Q2 = kplus2*Q_t2/(kplus2+kmin)

        ! Change sigma and omega for each receptor!

        Q_tilde = sigma*Q1 + omega*Q2
        
        kr = (R*A/(K1+A))*(V_plc + lambda3*Q1)*c**2/(c**2+Kplc**2)

        Kc_tilde = Kc*(1-sw*Q2)
        Ktau_til = Ktau*(1-lambda1*Q1)
        tau_max_til = tau_max*(1-lambda2*delta)

        phi_c = c**4/(c**4+Kc_tilde**4)
        phi_p = p**2/(p**2+Kp**2)
        phi_p_down = Kp**2/(p**2+Kp**2)
        h_inf = Kh**4/(c**4+Kh**4)
        tau = tau_max_til*Ktau_til**4/(c**4+Ktau_til**4)

        beta = phi_c*phi_p*h
        alpha = phi_p_down*(1-phi_c*h_inf)

        Po = beta/(beta+Kb*(beta+alpha))

        eta = V_3k/(V_3k + V_5p)
        nu_deg = (Q1 + 1)*(eta*c**2/(c**2 + K_3k**2) - (1 - eta))
        tau_p = (Q1 + 1)/(V_3k + V_5p)

        Jipr = Kf*Po*(ce-c)
        Jserca = Vs*(c**2-Kbar*ce**2)/(c**2+Ks**2)
        Jpm = delta*Vpm*c**2/(c**2+Kpm**2)

        ! ODE's

        F(1) = (1-R)*rho_d - R*Q_tilde*rho_p
        F(2) = (Jipr - Jserca + Jin - Jpm)/tau_c
        F(3) = Jin - Jpm
        F(4) = (h_inf-h)/tau
        F(5) = (kL*L - nu_deg*p)/tau_p 
        F(6) = kr*(L_t - L) - k_r*L


        
        END SUBROUTINE FUNC

        SUBROUTINE STPNT(NDIM,U,PAR,T)


        IMPLICIT NONE
        INTEGER, INTENT(IN) :: NDIM
        DOUBLE PRECISION, INTENT(INOUT) :: U(NDIM),PAR(*)
        DOUBLE PRECISION, INTENT(IN) :: T

        ! Initial conditions

        U(1) = 1
        U(2) = 0.0805296
        U(3) = 3.861011
        U(4) = 0.70395
        U(5) = 1e-10
        U(6) = 0

        PAR(1) = 1e-10
        PAR(2) = 0.1
        PAR(3) = 1
        PAR(4) = 2.5     
        PAR(5) = 0.2
        PAR(6) = 2000

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
        ! Set PAR(21) equal to the maximum of U(1)
        PAR(21)=GETP('MAX',1,U)

        ! Set PAR(22) equal to the maximum of U(2)
        PAR(22)=GETP('MAX',2,U)

        ! Set PAR(23) equal to the maximum of U(3)
        PAR(23)=GETP('MAX',3,U)   

        ! Set PAR(24) equal to the maximum of U(4)
        PAR(24)=GETP('MAX',4,U)

        ! Set PAR(25) equal to the maximum of U(5)
        PAR(25)=GETP('MAX',5,U)

        ! Set PAR(26) equal to the maximum of U(6)
        PAR(26)=GETP('MAX',6,U)  

        ! Set PAR(31) equal to the minimum of U(1)
        PAR(31)=GETP('MIN',1,U)   

        ! Set PAR(32) equal to the minimum of U(2)
        PAR(32)=GETP('MIN',2,U)

        ! Set PAR(33) equal to the minimum of U(3)
        PAR(33)=GETP('MIN',3,U)

        ! Set PAR(34) equal to the minimum of U(4)
        PAR(34)=GETP('MIN',4,U)

        ! Set PAR(35) equal to the minimum of U(5)
        PAR(35)=GETP('MIN',5,U)

        ! Set PAR(36) equal to the minimum of U(6)
        PAR(36)=GETP('MIN',6,U)  
        
        ! Set PAR(80) equal to the real part of the first floquet multipliers
        PAR(80)=GETP('STA',0,U)


		END SUBROUTINE PVLS

