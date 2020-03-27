from easydict import EasyDict as edict

# init
__C_NTU = edict()

cfg_data = __C_NTU

__C_NTU.STD_SIZE = (768,1024)
__C_NTU.TRAIN_SIZE = (576,768)
__C_NTU.DATA_PATH = 'datasets/NTU/processed_data'               

__C_NTU.MEAN_STD = ([0.452016860247, 0.447249650955, 0.431981861591],[0.23242045939, 0.224925786257, 0.221840232611])

__C_NTU.LABEL_FACTOR = 1
__C_NTU.LOG_PARA = 100.

__C_NTU.RESUME_MODEL = ''#model path
__C_NTU.TRAIN_BATCH_SIZE = 1 #imgs

__C_NTU.VAL_BATCH_SIZE = 1 # 


