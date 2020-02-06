FROM kbase/sdkbase2:python
MAINTAINER KBase Developer
# -----------------------------------------
# In this section, you can install any system dependencies required
# to run your App.  For instance, you could place an apt-get update or
# install line here, a git checkout to download code, or run any other
# installation scripts.

RUN apt-get update
RUN pip install --upgrade pip==19.3.1


RUN apt-get install --yes bwa bowtie2


RUN curl --location ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-2.1.0-Linux_x86_64.zip > hisat2.zip && \
unzip hisat2.zip && \
mv hisat2-2.1.0 /usr/local/bin/ && \
rm hisat2.zip

ENV PATH="${PATH}:/usr/local/bin/hisat2-2.1.0"

# -----------------------------------------

COPY ./ /kb/module
RUN mkdir -p /kb/module/work
RUN chmod -R a+rw /kb/module

WORKDIR /kb/module

RUN make all

ENTRYPOINT [ "./scripts/entrypoint.sh" ]

CMD [ ]
