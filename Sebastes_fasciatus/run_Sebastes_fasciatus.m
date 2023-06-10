close all;
global pets

pets = {'Sebastes_fasciatus'};
check_my_pet(pets);

estim_options('default');
estim_options('max_step_number', 5e2); %change 5e2 to 5e3 so that it does more iterations
estim_options('max_fun_evals',5e3);

estim_options('pars_init_method', 2); %change 2 to 1 and with one everytime you do it it uses the last estimation to estimate again
estim_options('results_output', 3);
estim_options('method', 'no'); %either do nm or no, no does not do estimation, nm does the 500 steps to estimate parameter so they can freely change

estim_pars;


%changed to 1 ran it 3 times than changed it to 5000 and ran it 3 times
