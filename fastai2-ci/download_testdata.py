"""
Downloads test data used in CI
"""
from fastai2.data.external import download_data, URLs
from fastai2.torch_core import parallel

urls = ['ADULT_SAMPLE','BIWI_SAMPLE','CAMVID_TINY','CIFAR','COCO_SAMPLE','COCO_TINY','IMDB','IMDB_SAMPLE',
        'ML_SAMPLE','MNIST','MNIST_SAMPLE','MNIST_TINY','PETS']
url_list = [URLs.__dict__[k] for k in urls]
parallel(download_data, url_list, progress=True)
