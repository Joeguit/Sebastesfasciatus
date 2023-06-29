close all;
global pets 

pets = {'Sebastes_fasciatus_individual'};

estim_options('default');
estim_options('max_step_number', 5e3);
estim_options('max_fun_evals',6e3);

estim_options('pars_init_method', 1);
estim_options('results_output', 3);
estim_options('method', 'nm');

estim_pars;

% prt_elas([],1)
 prt_report_AmPtox 

% DO NOT DELETE the code here below: 
% it is needed for initializing pars init from scratch
% par.z = 6.2479;       free.z     = 0;   units.z = '-';            label.z = 'zoom factor population'; 
% for i = 1:n_ind
%     fldName = ['z',num2str(i)];
% par.(fldName) = 6.2479; free.(fldName)   = 1;   units.(fldName) = '-'; label.(fldName) = 'zoom factor for individual'; 
% end