clear

load mse_ricker_data
[d21_mean,d21_std]=mse_compute_ricker([2,1],1e5,sx1,sx2,theta);
[d23_mean,d23_std]=mse_compute_ricker([2,3],1e5,sx1,sx2,theta);

