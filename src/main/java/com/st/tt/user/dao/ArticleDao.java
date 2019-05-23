package com.st.tt.user.dao;



import com.st.tt.user.pojo.Article;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * 数据访问接口
 * @author Administrator
 *
 */
public interface ArticleDao extends JpaRepository<Article,String>,JpaSpecificationExecutor<Article> {
    @Modifying
    @Query(value = "UPDATE tb_article SET state = 1 WHERE id = ?",nativeQuery = true)
	public void updataState(String id);

    @Modifying
    @Query(value = "UPDATE tb_article SET visits = visits+1 WHERE id = ?",nativeQuery = true)
    public void addVisits(String id);

    @Query(value = "select * from tb_article",nativeQuery = true)
    public Page<Article> articleList(Pageable pageable);
}
