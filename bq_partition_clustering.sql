CREATE OR REPLACE TABLE
  partition_demo.normal_table AS
SELECT
  id,
  title,
  body,
  accepted_answer_id,
  answer_count,
  comment_count,
  community_owned_date,
  creation_date,
  favorite_count,
  last_activity_date,
  last_edit_date,
  last_editor_user_id,
  owner_display_name,
  owner_user_id,
  parent_id,
  post_type_id,
  score,
  tags,
  view_count
FROM
  `bigquery-public-data.stackoverflow.stackoverflow_posts` ;
  

SELECT id, title, accepted_answer_id, creation_date, answer_count , comment_count , favorite_count, view_count 
FROM  gcp-trainering-ss.partition_demo.normal_table 
WHERE creation_date BETWEEN '2018-01-01' AND '2018-02-01'
AND tags = 'android';




CREATE OR REPLACE TABLE
  partition_demo.partition_table
PARTITION BY
  DATE(creation_date) AS
SELECT
  id,
  title,
  body,
  accepted_answer_id,
  answer_count,
  comment_count,
  community_owned_date,
  creation_date,
  favorite_count,
  last_activity_date,
  last_edit_date,
  last_editor_user_id,
  owner_display_name,
  owner_user_id,
  parent_id,
  post_type_id,
  score,
  tags,
  view_count
FROM
  `bigquery-public-data.stackoverflow.stackoverflow_posts`

SELECT id, title, accepted_answer_id, creation_date, answer_count , comment_count , favorite_count, view_count 
FROM  gcp-trainering-ss.partition_demo.partition_table 
WHERE creation_date BETWEEN '2018-01-01' AND '2018-02-01'
AND tags = 'android';


  
  
CREATE OR REPLACE TABLE
partition_demo.partition_custered_table
PARTITION BY
  DATE(creation_date)
CLUSTER BY
  tags AS
SELECT
  id,
  title,
  accepted_answer_id,
  creation_date,
  answer_count,
  comment_count,
  favorite_count,
  view_count,
  tags
FROM
  `bigquery-public-data.stackoverflow.posts_questions`


SELECT id, title, accepted_answer_id, creation_date, answer_count , comment_count , favorite_count, view_count 
FROM  gcp-trainering-ss.partition_demo.partition_custered_table 
WHERE creation_date BETWEEN '2018-01-01' AND '2018-02-01'
AND tags = 'android';