/* 18. 데이터 셋 조합히기  */
    
  
      -- * user별 영화 장르 선호도 데이터 셋 
        
	    -- A. with문 활용 하지 않음 
        
	    select * 
	    from rating r 
	    inner join 
	    (
	     select m.movieid , m.title_nm , m.realse_year
	         , case when m.genres_nm like '%Action%'      then 1 else 0 end action_yn
	         , case when m.genres_nm like '%Adventure%'   then 1 else 0 end Adventure_yn
	         , case when m.genres_nm like '%Animation%'   then 1 else 0 end Animation_yn
	         , case when m.genres_nm like '%Children%'    then 1 else 0 end Children_yn
	         , case when m.genres_nm like '%Comedy%'      then 1 else 0 end Comedy_yn
	         , case when m.genres_nm like '%Crime%'       then 1 else 0 end Crime_yn
	         , case when m.genres_nm like '%Documentary%' then 1 else 0 end Documentary_yn
	         , case when m.genres_nm like '%Drama%'       then 1 else 0 end Drama_yn
	         , case when m.genres_nm like '%Fantasy%'     then 1 else 0 end Fantasy_yn
	         , case when m.genres_nm like '%Film-Noir%'   then 1 else 0 end Film_Noir_yn
	         , case when m.genres_nm like '%Horror%'      then 1 else 0 end Horror_yn
	         , case when m.genres_nm like '%Musical%'     then 1 else 0 end Musical_yn
	         , case when m.genres_nm like '%Mystery%'     then 1 else 0 end Mystery_yn
	         , case when m.genres_nm like '%Romance%'     then 1 else 0 end Romance_yn
	         , case when m.genres_nm like '%Sci-Fi%'      then 1 else 0 end Sci_Fi_yn       
	         , case when m.genres_nm like '%Thriller%'    then 1 else 0 end Thriller_yn
	         , case when m.genres_nm like '%War%'         then 1 else 0 end War_yn
	         , case when m.genres_nm like '%Western%'     then 1 else 0 end Western_yn
	     from movie m
	    ) m on r.movieid = m.movieid
	    ;
	    
	   
       -- B. with문  사용
         	   
	    with movie as 
	    (
	       select m.movieid , m.title_nm , m.realse_year
	         , case when m.genres_nm like '%Action%'      then 1 else 0 end action_yn
	         , case when m.genres_nm like '%Adventure%'   then 1 else 0 end Adventure_yn
	         , case when m.genres_nm like '%Animation%'   then 1 else 0 end Animation_yn
	         , case when m.genres_nm like '%Children%'    then 1 else 0 end Children_yn
	         , case when m.genres_nm like '%Comedy%'      then 1 else 0 end Comedy_yn
	         , case when m.genres_nm like '%Crime%'       then 1 else 0 end Crime_yn
	         , case when m.genres_nm like '%Documentary%' then 1 else 0 end Documentary_yn
	         , case when m.genres_nm like '%Drama%'       then 1 else 0 end Drama_yn
	         , case when m.genres_nm like '%Fantasy%'     then 1 else 0 end Fantasy_yn
	         , case when m.genres_nm like '%Film-Noir%'   then 1 else 0 end Film_Noir_yn
	         , case when m.genres_nm like '%Horror%'      then 1 else 0 end Horror_yn
	         , case when m.genres_nm like '%Musical%'     then 1 else 0 end Musical_yn
	         , case when m.genres_nm like '%Mystery%'     then 1 else 0 end Mystery_yn
	         , case when m.genres_nm like '%Romance%'     then 1 else 0 end Romance_yn
	         , case when m.genres_nm like '%Sci-Fi%'      then 1 else 0 end Sci_Fi_yn       
	         , case when m.genres_nm like '%Thriller%'    then 1 else 0 end Thriller_yn
	         , case when m.genres_nm like '%War%'         then 1 else 0 end War_yn
	         , case when m.genres_nm like '%Western%'     then 1 else 0 end Western_yn
	     from movie m
	    )
	    
	    
	   select  u.userid 
	         , u.gender
	         , u.age
	         , u.occupation
	         , avg_rating_pnt
	         , action_rating_pnt 	* 1.0 	/  case when action_cnt = 0 	then 1 else action_cnt 		end  action_prefer  	/* a */
	         , Adventure_rating_pnt * 1.0 	/  case when Adventure_cnt = 0 	then 1 else Adventure_cnt 	end  Adventure_prefer 	/* b */       
	         , Animation_rating_pnt * 1.0 	/  case when Animation_cnt = 0 	then 1 else Animation_cnt 	end  Animation_prefer  	/* c */
	         , Children_rating_pnt 	* 1.0 	/  case when Children_cnt = 0 	then 1 else Children_cnt 	end  Children_prefer  	/* d */					
	         , Comedy_rating_pnt 	* 1.0 	/  case when Comedy_cnt = 0 	then 1 else Comedy_cnt 		end  Comedy_prefer  	/* e */
	         , Crime_rating_pnt 	* 1.0 	/  case when Crime_cnt = 0 		then 1 else Crime_cnt 		end  Crime_prefer  		/* f */         
	         , Documentary_rating_pnt * 1.0 /  case when Documentary_cnt = 0 then 1 else Documentary_cnt end Documentary_prefer  /* g */						
	         , Drama_rating_pnt 	* 1.0 	/  case when Drama_cnt = 0 		then 1 else Drama_cnt 		end  Drama_prefer  /* h */					
	         , Fantasy_rating_pnt 	* 1.0 	/  case when Fantasy_cnt = 0 	then 1 else Fantasy_cnt 	end  Fantasy_prefer  /* i */					
	         , Film_Noir_rating_pnt * 1.0 	/  case when Film_Noir_cnt = 0 	then 1 else Film_Noir_cnt 	end  Film_Noir_prefer  /* j */					
			 , Horror_rating_pnt 	* 1.0 	/  case when Horror_cnt = 0 	then 1 else Horror_cnt 		end  Horror_prefer  /* k  */
			 , Musical_rating_pnt 	* 1.0 	/  case when Musical_cnt = 0 	then 1 else Musical_cnt 	end  Musical_prefer  /* l */
			 , Mystery_rating_pnt 	* 1.0 	/  case when Mystery_cnt = 0 	then 1 else Mystery_cnt 	end  Mystery_prefer  /* m */
			 , Romance_rating_pnt 	* 1.0 	/  case when Romance_cnt = 0 	then 1 else Romance_cnt 	end  Romance_prefer  /* n */
			 , Sci_Fi_rating_pnt 	* 1.0 	/  case when Sci_Fi_cnt = 0 	then 1 else Sci_Fi_cnt 		end  Sci_Fi_prefer   /* o */
			 , Thriller_rating_pnt 	* 1.0 	/  case when Thriller_cnt = 0 	then 1 else Thriller_cnt 	end  Thriller_prefer  /* p */
			 , War_rating_pnt 		* 1.0 	/  case when War_cnt = 0 		then 1 else War_cnt 		end  War_prefer      /* q */
			 , Western_rating_pnt 	* 1.0 	/  case when Western_cnt = 0 	then 1 else Western_cnt 	end  Western_prefer  /* r */
	   from 
	    (
	    select r.userid,
	            count(*) movie_cnt 
	          , avg( r.rating_pnt) avg_rating_pnt   
	          , sum(case when action_yn = 1 	then r.rating_pnt end) action_rating_pnt 	, count(case when action_yn = 1 then r.movieid end ) action_cnt
	          , sum(case when Adventure_yn = 1 	then r.rating_pnt end) Adventure_rating_pnt , count(case when Adventure_yn = 1 then r.movieid end ) Adventure_cnt	          
	          , sum(case when Animation_yn = 1 	then r.rating_pnt end) Animation_rating_pnt , count(case when Animation_yn = 1 then r.movieid end ) Animation_cnt	  
	          , sum(case when Children_yn = 1 	then r.rating_pnt end) Children_rating_pnt 	, count(case when Children_yn = 1 then r.movieid end ) Children_cnt						
	          , sum(case when Comedy_yn = 1   	then r.rating_pnt end) Comedy_rating_pnt 	, count(case when Comedy_yn = 1 then r.movieid end ) Comedy_cnt
	          , sum(case when Crime_yn = 1   	then r.rating_pnt end) Crime_rating_pnt 	, count(case when Crime_yn = 1 then r.movieid end ) Crime_cnt	          
	          , sum(case when Documentary_yn = 1  then r.rating_pnt end) Documentary_rating_pnt , count(case when Documentary_yn = 1 then r.movieid end ) Documentary_cnt	 						
	          , sum(case when Drama_yn = 1   	then r.rating_pnt end) Drama_rating_pnt 	, count(case when Drama_yn = 1 then r.movieid end ) Drama_cnt						
	          , sum(case when Fantasy_yn = 1   	then r.rating_pnt end) Fantasy_rating_pnt 	, count(case when Fantasy_yn = 1 then r.movieid end ) Fantasy_cnt						
	          , sum(case when Film_Noir_yn = 1  then r.rating_pnt end) Film_Noir_rating_pnt , count(case when Film_Noir_yn = 1 then r.movieid end ) Film_Noir_cnt						
			  , sum(case when Horror_yn = 1   	then r.rating_pnt end) Horror_rating_pnt 	, count(case when Horror_yn = 1 then r.movieid end ) Horror_cnt
			  , sum(case when Musical_yn = 1   	then r.rating_pnt end) Musical_rating_pnt 	, count(case when Musical_yn = 1 then r.movieid end ) Musical_cnt
			  , sum(case when Mystery_yn = 1   	then r.rating_pnt end) Mystery_rating_pnt 	, count(case when Mystery_yn = 1 then r.movieid end ) Mystery_cnt
			  , sum(case when Romance_yn = 1   	then r.rating_pnt end) Romance_rating_pnt 	, count(case when Romance_yn = 1 then r.movieid end ) Romance_cnt
			  , sum(case when Sci_Fi_yn = 1   	then r.rating_pnt end) Sci_Fi_rating_pnt 	, count(case when Sci_Fi_yn = 1 then r.movieid end ) Sci_Fi_cnt
			  , sum(case when Thriller_yn = 1   then r.rating_pnt end) Thriller_rating_pnt 	, count(case when Thriller_yn = 1 then r.movieid end ) Thriller_cnt
			  , sum(case when War_yn = 1   		then r.rating_pnt end) War_rating_pnt 		, count(case when War_yn = 1 then r.movieid end ) War_cnt
			  , sum(case when Western_yn = 1   	then r.rating_pnt end) Western_rating_pnt 	, count(case when Western_yn = 1 then r.movieid end ) Western_cnt
		 from rating r inner join movie m on r.movieid = m.movieid
	    group by r.userid 
	   )  r inner join users u on r.userid = u.userid   
	  ;
	      
	 
     
    