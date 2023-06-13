close all;
global pets n_ind

pets = {'Sebastes_fasciatus_individual'};

n_ind = 12; % # of individuals for the estimation

estim_options('default');
estim_options('max_step_number', 5e3);
estim_options('max_fun_evals',5e3);

estim_options('pars_init_method', 1);
estim_options('results_output', 3);
estim_options('method', 'nm');

estim_pars;

prt_elas([],1)
% prt_report_AmPtox 