# base-line image
FROM python:3.9.6-buster

# 프로젝트 clone
RUN git clone https://github.com/AgencyTeam/AgencyTeam_assignment.git

# 작업 디렉토리를 /AgencyTeam_assignment 으로 지정
WORKDIR /AgencyTeam_assignment

# pip install 실행
RUN pip install -r requirements.txt

# 호스트 OS의 포트를 80 이라고 선언
EXPOSE 80

# 환경변수 설정
ENV FLASK_APP transform
ENV TZ Asia/Seoul

# 업로드파일 폴더 생성
RUN mkdir upload_files

# DB 설정
RUN flask init-db

# entrypoint
ENTRYPOINT ["flask"]

# 컨테이너 실행 시 flask run --host 0.0.0.0 실행
# --port 포트번호 => 포트번호 설정가능 기본포트 5000
CMD ["run", "--host", "0.0.0.0"]