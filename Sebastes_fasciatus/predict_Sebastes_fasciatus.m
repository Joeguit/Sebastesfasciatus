function [prdData, info] = predict_Sebastes_fasciatus(par, data, auxData)
% file generated by prt_predict

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData);

% compute temperature correction factors
pars_T = T_A;
TC_ab = tempcorr(temp.ab, T_ref, pars_T);
TC_am = tempcorr(temp.am, T_ref, pars_T);
TC_Ri = tempcorr(temp.Ri, T_ref, pars_T);
TC_10 = tempcorr(temp.WJO10, T_ref, pars_T);
% TC_7 = tempcorr(temp.WJO7, T_ref, pars_T);
% TC_5 = tempcorr(temp.WJO5, T_ref, pars_T);
% TC_2 = tempcorr(temp.WJO2, T_ref, pars_T);


% life cycle
pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
[tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

if info == 0
  prdData = []; return;
end


% hatch
pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
[U_H aUL] = ode45(@dget_aul, [0; U_Hh], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
Lw_h = aUL(end,3)/ del_M; % cm, physical length at hatch

% birth
L_b = L_m * l_b;                  % cm, structural length at birth
a_b = t_0 + tau_b/ k_M/ TC_ab;    % d, age at birth
Lw_b = L_b/ del_M;                % cm, physical length at birth

% puberty
L_p = L_m * l_p; % cm, structural length at puberty
Lw_p = L_p/ del_M; % cm, physical length at puberty

% ultimate
L_i = L_m * l_i; % cm, ultimate structural length
Lw_i = l_i * L_m/ del_M; % cm, ultimate physical length
pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector
tau_m = get_tm_s(pars_tm, f, l_b); % -, scaled mean life span
a_m = tau_m/ k_M/ TC_am; % d, mean life span

% reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
R_i = TC_Ri * reprod_rate_j(L_i, f, pars_R); % #/d, ultimate reproduction rate

% males
p_Am_m = z_m * p_M/ kap; % J/d.cm^2, {p_Am} spec assimilation flux
E_m_m = p_Am_m/ v; % J/cm^3, reserve capacity [E_m]
g_m = E_G/ (kap* E_m_m); % -, energy investment ratio
m_Em_m = y_E_V * E_m_m/ E_G; % mol/mol, reserve capacity
% ome_m = m_Em_m * w_E/ w_V; % -, contribution of reserve to weight
if ~exist('v_Hpm','var'); v_Hpm = v_Hp; end; pars_tjm = [g_m k l_T v_Hb v_Hj v_Hpm];
[tau_jm, tau_pm, tau_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
L_mm = v/ k_M/ g_m; % cm, max structural length
L_im = l_im * L_mm;  % cm, ultimate structural length
Lw_im = L_im/ del_M; % cm, ultimate physical length
pars_tpm = [g_m k l_T v_Hb v_Hpm]; % pars for males
[tau_pm, tau_bm, l_pm] = get_tp(pars_tpm, f); % - , scaled time, length
L_pm = L_mm * l_pm; % cm, structural length at puberty
Lw_pm = L_pm/ del_M; % cm, physical at puberty

% pack to output
prdData.ab = a_b;
prdData.am = a_m;
prdData.Lh = Lw_h;
prdData.Lb = Lw_b;
prdData.Lp = Lw_p;
prdData.Lpm = Lw_pm;
prdData.Li = Lw_i;
prdData.Ri = R_i;

% uni-varate data

 EW80 = (LW80(:,1)* del_M).^3 * (1 + ome * f); % g, wet weight

 
 f = f10; 
 [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  rT_B = rho_B * TC_10 * k_M;  % 1/d, von Bert growth rate
  L_i  = l_i * L_m;
  L0 = Lwstart.tL10 * del_M; % cm, intitial structural length  
  L = L_i - (L_i - L0) .* exp( - rT_B .* tL10(:,1)); 
  ELw10 = L/ del_M; % cm, physical length
  EWw10 = L.^3 * (1 + ome * f);
  
  L = (WJO10(:,1)./ (1 + ome * f)).^(1/3);
  [Lsort, ai, ci] = unique(L);
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size
  pACSJGRD = p_ref * scaled_power_j(Lsort, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - TC_10 * (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O10 = - J_M(3,ci)';            % mol/d O2 consumption 

  

% pack to output
prdData.LW80 = EW80;
prdData.tL10 = ELw10; 
prdData.tW10 = EWw10; 
prdData.WJO10 = EJT_O10; 
