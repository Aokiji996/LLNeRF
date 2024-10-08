# *** Please replace /path/to/dataset with your dataset path
# and replace scene_name with your scene name.

# stage 1: decompositoin only, without enhancement.
python -m train \
--gin_configs=configs/llff_illunerf.gin \
--gin_bindings="Config.data_dir = '/home/ubuntu/hjw/Datasets/llnerf-dataset/path'" \
--gin_bindings="Config.checkpoint_dir = './nerf_results/llnerf/path'" \
--gin_bindings="Config.factor = 1" \
--gin_bindings="Config.batch_size = 1024" \
--gin_bindings="Config.checkpoint_every = 25000" \
--gin_bindings="Config.valid_steps = [5000, 25000]" \
--gin_bindings="Config.max_steps = 100000" \
--gin_bindings="Config.rawnerf_mode = False" \
--gin_bindings="Model.learned_exposure_scaling = False" \
--gin_bindings="Model.name = 'llnerf'" \
--gin_bindings="Config.logfile = 'logs/path.txt'" \
--logtostderr \
--gin_bindings="Config.data_loss_type = 'rawnerf'" \
--gin_bindings="NerfMLP.learn_gamma = True" \
--gin_bindings="NerfMLP.learned_gamma_nc = 3" \
--gin_bindings="NerfMLP.learn_alpha = True" \
--gin_bindings="NerfMLP.learned_alpha_nc = 1" \
--gin_bindings="Config.exposure_loss_mult = 0.1" \
--gin_bindings="Config.gamma_norm_loss_mult = 0.01" \
--gin_bindings="Config.sample_neighbor_num = 4" \
--gin_bindings="Config.alpha_ltv_loss_mult = 0.1" \
--gin_bindings="Config.gamma_ltv_loss_mult = 0.1" \
--gin_bindings="Config.gray_variance_bias = 0.5" \
--gin_bindings="Config.gray_loss_mult = 0.1" \
--gin_bindings="Config.fixed_exposure = 0.55" \
--gin_bindings="Config.disable_enhancement_loss = True"

# stage 2: enhancement
python -m train \
--gin_configs=configs/llff_illunerf.gin \
--gin_bindings="Config.data_dir = '/home/ubuntu/hjw/Datasets/llnerf-dataset/path'" \
--gin_bindings="Config.checkpoint_dir = './nerf_results/llnerf/path'" \
--gin_bindings="Config.factor = 1" \
--gin_bindings="Config.batch_size = 1024" \
--gin_bindings="Config.checkpoint_every = 25000" \
--gin_bindings="Config.valid_steps = [5000, 25000]" \
--gin_bindings="Config.max_steps = 100000" \
--gin_bindings="Config.rawnerf_mode = False" \
--gin_bindings="Model.learned_exposure_scaling = False" \
--gin_bindings="Model.name = 'llnerf'" \
--gin_bindings="Config.logfile = 'logs/path.txt'" \
--logtostderr \
--gin_bindings="Config.data_loss_type = 'rawnerf'" \
--gin_bindings="NerfMLP.learn_gamma = True" \
--gin_bindings="NerfMLP.learned_gamma_nc = 3" \
--gin_bindings="NerfMLP.learn_alpha = True" \
--gin_bindings="NerfMLP.learned_alpha_nc = 1" \
--gin_bindings="Config.exposure_loss_mult = 0.1" \
--gin_bindings="Config.gamma_norm_loss_mult = 0.01" \
--gin_bindings="Config.sample_neighbor_num = 4" \
--gin_bindings="Config.alpha_ltv_loss_mult = 0.1" \
--gin_bindings="Config.gamma_ltv_loss_mult = 0.1" \
--gin_bindings="Config.gray_variance_bias = 0.5" \
--gin_bindings="Config.gray_loss_mult = 0.1" \
--gin_bindings="Config.fixed_exposure = 0.55" \
--gin_bindings="Config.max_steps = 105000"

python -m render \
--gin_configs=configs/llff_illunerf.gin \
--gin_bindings="Config.data_dir = '/home/ubuntu/hjw/Datasets/llnerf-dataset/path'" \
--gin_bindings="Config.checkpoint_dir = './nerf_results/llnerf/path'" \
--gin_bindings="Config.render_path = True" \
--gin_bindings="Config.batch_size = 1024" \
--gin_bindings="Config.render_dir = './nerf_results/llnerf/path/render/'" \
--gin_bindings="Config.render_path_frames = 120" \
--gin_bindings="Config.render_video_fps = 30" \
--gin_bindings="Config.rawnerf_mode = False" \
--gin_bindings="Config.render_ckpt_step = None" \
--gin_bindings="Config.render_img_num = None" \
--logtostderr \
--gin_bindings="Config.data_loss_type = 'rawnerf'" \
--gin_bindings="NerfMLP.learn_gamma = True" \
--gin_bindings="NerfMLP.learned_gamma_nc = 3" \
--gin_bindings="NerfMLP.learn_alpha = True" \
--gin_bindings="NerfMLP.learned_alpha_nc = 1" \
--gin_bindings="Config.exposure_loss_mult = 0.1" \
--gin_bindings="Config.gamma_norm_loss_mult = 0.01" \
--gin_bindings="Config.sample_neighbor_num = 4" \
--gin_bindings="Config.ltv_loss_mult = 0" \
--gin_bindings="Config.alpha_ltv_loss_mult = 0.1" \
--gin_bindings="Config.gamma_ltv_loss_mult = 0.1" \
--gin_bindings="Config.gray_variance_bias = 0.5" \
--gin_bindings="Config.gray_loss_mult = 0.1" \
--gin_bindings="Config.fixed_exposure = 0.55"