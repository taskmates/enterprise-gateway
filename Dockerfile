FROM elyra/enterprise-gateway:3.2.3

ENV EG_PORT=10100

#RUN mamba install --quiet --yes \
#    cffi \
#    send2trash \
#    requests \
#    future \
#    pycryptodomex && \
#    conda clean --all && \
#    fix-permissions $CONDA_DIR && \
#    fix-permissions /home/$NB_USER

#USER root
#
#RUN apt update && apt install -yq curl openjdk-8-jdk
#
## Install Enterprise Gateway wheel and kernelspecs
#COPY jupyter_enterprise_gateway*.whl /tmp/
#RUN pip install /tmp/jupyter_enterprise_gateway*.whl && \
#	rm -f /tmp/jupyter_enterprise_gateway*.whl
#
#ADD jupyter_enterprise_gateway_kernelspecs*.tar.gz /usr/local/share/jupyter/kernels/
#ADD jupyter_enterprise_gateway_kernel_image_files*.tar.gz /usr/local/bin/
#
#COPY start-enterprise-gateway.sh /usr/local/bin/
#
#RUN chown jovyan:users /usr/local/bin/start-enterprise-gateway.sh && \
#	chmod 0755 /usr/local/bin/start-enterprise-gateway.sh && \
#	touch /usr/local/share/jupyter/enterprise-gateway.log && \
#	chown -R jovyan:users /usr/local/share/jupyter /usr/local/bin/kernel-launchers && \
#	chmod 0666 /usr/local/share/jupyter/enterprise-gateway.log && \
#	rm -f /usr/local/bin/bootstrap-kernel.sh

#COPY README.md .

#COPY pyproject.toml .

#RUN pip3 install .

RUN pip install pillow==10.1.0
RUN pip install pyarrow==16.0.0
RUN pip install --user google-api-python-client==2.111.0
RUN pip install --user ipytest==0.14.2
RUN pip install --user matplotlib==3.8.3
RUN pip install --user numpy==1.26.2
RUN pip install --user pandas==2.1.4
RUN pip install --user pypdf==3.17.4

USER jovyan

CMD ["/usr/local/bin/start-enterprise-gateway.sh"]

EXPOSE 10100

WORKDIR /usr/local/bin
