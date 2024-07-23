FROM i53051287x/farhad-base:1

COPY requirements.txt /app/requirements.txt
RUN /py/bin/pip install -r /app/requirements.txt

COPY . /app
WORKDIR /app
EXPOSE 8000

ENV PATH="/py/bin:$PATH"

RUN chmod +x /app/wait-for-it.sh /app/entrypoint.sh

CMD ["/app/wait-for-it.sh", "db:5432", "--", "/app/entrypoint.sh"]
