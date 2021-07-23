FROM jupyter/datascience-notebook:65761486d5d3

RUN pip install torch torchvision torchsummary

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
ENV NVIDIA_REQUIRE_CUDA "cuda>=9.0"
