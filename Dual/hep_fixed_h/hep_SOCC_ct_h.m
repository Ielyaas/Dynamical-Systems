function out = hep_SOCC_ct_h(~,in,param_ct)

% Model of Ca2+ dynamics during hormone stimulation
% using an open cell model with SOCE

c = in(1);
h = in(2);
ct = in(3);
p = in(4);
   
% Functions

ce = param_ct.gamma.*(ct - c);

PLC = param_ct.R_act.*c.^2./(param_ct.K_PLC^2 + c.^2);

phi_c = c.^4./(c.^4 + param_ct.Kc^4);
phi_p = p.^2./(p.^2 + param_ct.Kp^2);
phi_p_down = param_ct.Kp^2./(p.^2 + param_ct.Kp^2);

Jpm = param_ct.Vpm.*c.^2./(param_ct.Kpm^2 + c.^2);
Jin = param_ct.alpha0 + param_ct.alpha1.*(param_ct.Kce^4./(param_ct.Kce^4+ce.^4));

h_inf = param_ct.Kh^4./(param_ct.Kh^4 + c.^4);
tau = param_ct.tau_max.*param_ct.K_tau^4./(param_ct.K_tau^4 + c.^4);

Jserca = param_ct.Vs.*(c.^2 - param_ct.Kbar.*ce.^2)./(c.^2 + param_ct.Ks^2);

beta = phi_p.*phi_c.*h;
alpha = phi_p_down.*(1-phi_c.*h_inf);

Po = beta./(beta + param_ct.Kb.*(beta + alpha));

Jipr = param_ct.Kf.*Po.*(ce-c);

% DE's of the model

out(1) = Jipr - Jserca + param_ct.epsilon.*(param_ct.delta.*(Jin - Jpm));
out(2) = param_ct.epsilon.*((h_inf - h)./tau);
out(3) = param_ct.epsilon.*(param_ct.delta.*(Jin - Jpm));
out(4) = param_ct.tau_p.*(PLC - p);
out = out';


end