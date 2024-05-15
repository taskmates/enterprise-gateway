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

USER jovyan

CMD ["/usr/local/bin/start-enterprise-gateway.sh"]

EXPOSE 10100

WORKDIR /usr/local/bin
