!--------------------------------------------------------------------------------------
!--------------------------------------------------------------------------------------
!			Receptor phosphorylation model. Ka, V_pkc and V_plc as parameters
!--------------------------------------------------------------------------------------
!--------------------------------------------------------------------------------------

        SUBROUTINE FUNC(NDIM,U,ICP,PAR,IJAC,F,DFDU,DFDP)
        -------------------------------------------

        IMPLICIT NONE
        INTEGER, INTENT(IN) :: NDIM, ICP(*), IJAC
        DOUBLE PRECISION, INTENT(IN) :: U(NDIM), PAR(*)
        DOUBLE PRECISION, INTENT(OUT) :: F(NDIM)
        DOUBLE PRECISION, INTENT(INOUT) :: DFDU(NDIM,NDIM), DFDP(NDIM,*)


        DOUBLE PRECISION R, c, ct ,h ,p
        DOUBLE PRECISION Ka, A, K1, K3
        DOUBLE PRECISION k2, k_2, k4, k_4
        DOUBLE PRECISION Kf, Kc, Kp, Kb
        DOUBLE PRECISION tau_max, Ktau, Kh
        DOUBLE PRECISION Vs, Kbar, Ks
        DOUBLE PRECISION Vpm, Kpm, alpha0, alpha1, Kce
        DOUBLE PRECISION delta, gamma, ce
        DOUBLE PRECISION V_pkc, V_D, Kplc, Vp, Kpkc, V_plc
        DOUBLE PRECISION rho_d, rho_p
        DOUBLE PRECISION phi_c, phi_p, phi_p_down, h_inf, tau
        DOUBLE PRECISION beta, alpha, Po, PLC, PKC
        DOUBLE PRECISION Jipr, Jserca, Jin, Jpm


        R=U(1)
        c=U(2)
        ct=U(3)
        h=U(4)
        p=U(5)


        ! Receptor
        
        Ka = PAR(1);
        A = 5;
        K1 = 0.05;
        K3 = 5;
        k2 = 10;
        k_2 = 0.05;
        k4 = 0.05;
        k_4 = 10;

        ! IPR

        Kf = 10;
        Kc = 0.2;
        Kp = 0.2;
        Kb = 0.4;
        Kh = 0.08;

        ! H

        tau_max = 100;
        Ktau = 0.09;

        ! Serca

        Vs = 0.9;
        Kbar = 1.957e-5;
        Ks = 0.2;

        ! PM Membrane

        Vpm = 0.11;
        Kpm = 0.3;
        alpha0 = 0.0027;
        alpha1 = 0.015;
        Kce = 14;

        ! Calcium

        delta = 2.5;
        gamma = 5.5;

        ! Feedbacks

        V_plc = PAR(3);
                Kplc = 0.1;
                V_pkc = PAR(2);
        V_D = 0.5;
        Vp = 0.2;
        Kpkc = 0.118;

        ! Functions

        rho_d = k4/(1+K3) + k_2/(1+(1/K3))
        rho_p = k_4/(1+(1/K1)) + k2/(1+K1)

        ce = gamma*(ct-c)

        phi_c = c**4/(c**4+Kc**4)
        phi_p = p**2/(p**2+Kp**2)
        phi_p_down = Kp**2/(p**2+Kp**2)
        h_inf = Kh**4/(c**4+Kh**4)
        tau = tau_max*Ktau**4/(c**4+Ktau**4)

        beta = phi_c*phi_p*h
        alpha = phi_p_down*(1-phi_c*h_inf)

        Po = beta/(beta+Kb*(beta+alpha))

        PLC = V_plc*c**2/(c**2+Kplc**2)
        PKC = V_D*c**2/(c**2+Kpkc**2)

        Jipr = Kf*Po*(ce-c)
        Jserca = Vs*(c**2-Kbar*ce**2)/(c**2+Ks**2)
        Jin = alpha0 + alpha1*Kce**4/(ce**4+Kce**4)
        Jpm = Vpm*c**2/(c**2+Kpm**2)

        ! ODE's

        F(1) = Ka*A*(1-R)*rho_d - R*(V_pkc*PKC*rho_p + PLC/(1+K1))
        F(2) = Jipr - Jserca + delta*(Jin-Jpm)
        F(3) = delta*(Jin-Jpm)
        F(4) = (h_inf-h)/tau
        F(5) = R*PLC - p
        
        END SUBROUTINE FUNC

        SUBROUTINE STPNT(NDIM,U,PAR,T)
        ---------------------------

        IMPLICIT NONE
        INTEGER, INTENT(IN) :: NDIM
        DOUBLE PRECISION, INTENT(INOUT) :: U(NDIM),PAR(*)
        DOUBLE PRECISION, INTENT(IN) :: T

        ! Initial conditions

        U(1) = 1e-10
        U(2) = 0.07800382
        U(3) = 3.2839616
        U(4) = 0.525247
        U(5) = 1e-10
        PAR(1) = 0
        PAR(2) = 0
        PAR(3) = 0.5

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
        PAR(4)=GETP('MAX',1,U)

        ! Set PAR(5) equal to the maximum of U(2)
        PAR(5)=GETP('MAX',2,U)

        ! Set PAR(6) equal to the maximum of U(3)
        PAR(6)=GETP('MAX',3,U)   

        ! Set PAR(7) equal to the maximum of U(4)
        PAR(7)=GETP('MAX',4,U)

        ! Set PAR(8) equal to the maximum of U(5)
        PAR(8)=GETP('MAX',5,U)  

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
        
        ! Set PAR(80) equal to the real part of the first floquet multipliers
        PAR(80)=GETP('STA',0,U)


		END SUBROUTINE PVLS
		
