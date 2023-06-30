create stage district_court_stage
    url='s3://snowflake/etl_files/'
    credentials={aws_key_id='***', aws_secrect_key='***'}

create pipe district_court_pipe
    auto_ingest = True
as
copy into city_db.public.district_court_table
FROM @city_db.publc.district_court_stage
    file_format = {type='json'}
