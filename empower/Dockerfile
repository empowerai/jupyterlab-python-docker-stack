FROM jupyterlab/cuda/python/scipy:latest

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    cmake \
    libncurses5-dev \
    libncursesw5-dev \
    tesseract-ocr \
    espeak-ng \
    ffmpeg \
    pkg-config \
    gcc \
    g++ \
    libpoppler-cpp-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir torch torchvision torchaudio torchviz --extra-index-url https://download.pytorch.org/whl/cu118

RUN pip install --no-cache-dir git+https://github.com/facebookresearch/detectron2.git pytesseract
RUN pip install --no-cache-dir "itsdangerous<2.1.0"
RUN pip install --no-cache-dir \
    transformers \
    datasets \
    accelerate \
    bitsandbytes \
    optuna \ 
    tensorboard \
    pillow \
    python-poppler \
    scikit-learn \
    pyodbc \
    plotly \
    nltk \
    fuzzywuzzy \
    python-Levenshtein \
    polyfuzz \
    boto3 \
    gpt-index \
    pymupdf \
    chromadb \
    markdown \ 
    nlptest

# RUN pip install --no-cache-dir mlflow Hold until SHAP/NUMBA dependancy updated for python 3.11, should be done in april

RUN touch /home/${NB_USER}/firstrun
COPY ./forcepopulate.sh /usr/local/bin/before-notebook.d/ 
RUN chmod 755 /usr/local/bin/before-notebook.d/forcepopulate.sh

USER ${NB_USER}

