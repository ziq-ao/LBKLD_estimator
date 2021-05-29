# LBKLD_estimator

The code for the paper of "An approximate KLD based experimental design for models with intractable likelihoods"
(http://proceedings.mlr.press/v108/ao20a/ao20a.pdf).

## How to run: 
To see design results of the mathematical example, go to the directory `multi`, and run the script `multi_main.m`.

To see design results of Ricker model, go to the directory `ricker`, and run the script `Ricker_main.m`.
You can run the script `posterior_mean_vs_true_parameter.m` to see the scatter plot of the posterior means against the true values as well.
The quantitative results are provided by `mse_ricker.m`.

To see design results of aphid model, go to the directory `aphid`, and run the script `aphid_main_12d.m` and `aphid_main_34d.m`.
