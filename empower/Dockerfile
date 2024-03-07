FROM jupyterlab/cuda/python/base:3.11.2
# FROM jupyterlab/python/base:3.11.2 

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

# RUN pip install --no-cache-dir torch+cu118 torchvision torchaudio torchviz --extra-index-url https://download.pytorch.org/whl/cu118
RUN pip install --no-cache-dir torch==2.1.2+cu118 torchvision torchaudio torchviz --extra-index-url https://download.pytorch.org/whl/cu118

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
    markdown

RUN pip install --no-cache-dir mlflow langchain

# RUN pip install --no-cache-dir mlflow Hold until SHAP/NUMBA dependancy updated for python 3.11, should be done in april

RUN touch /home/${NB_USER}/firstrun
COPY ./forcepopulate.sh /usr/local/bin/before-notebook.d/ 
RUN chmod 755 /usr/local/bin/before-notebook.d/forcepopulate.sh

RUN rm /usr/local/lib/python3.11/site-packages/jupyterlab/staging/yarn.lock

USER ${NB_USER}
USER root

RUN pip install --no-cache-dir --upgrade \
    transformers \
    datasets \
    accelerate \
    bitsandbytes \
    chromadb \
    sentence-transformers==2.2.2 \
    ipywidgets \
    InstructorEmbedding \
    einops \
    ragas \
    gritlm

RUN pip install --no-cache-dir --upgrade \
    llama-index-core \
    llama-index-readers-file \
    # llama-index-llms-ollama \
    # llama-index-embeddings-ollama \
    llama-index-embeddings-huggingface \
    llama-index-llms-huggingface \
    llama-index-tools-vector-db \ 
    llama-index-vector-stores-chroma \
    llama-index-readers-chroma \
    llama-index-readers-smart-pdf-loader \
    llama-index-llms-langchain \
    llama-index-embeddings-langchain \
    # llama-index-embeddings-text-embeddings-inference \
    # llama-index-embeddings-huggingface-optimum \
    # llama-index-embeddings-mistralai \
    llama-index-embeddings-instructor

    # buildkit

USER ${NB_USER}
