package com.st.tt.user.controller;


import com.st.tt.user.entity.PageResult;
import com.st.tt.user.entity.Result;
import com.st.tt.user.entity.StatusCode;
import com.st.tt.user.pojo.Article;
import com.st.tt.user.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 控制器层
 * @author Administrator
 *
 */
@RestController
@CrossOrigin
@RequestMapping("/article")
public class ArticleController {


	@Autowired
	private ArticleService articleService;

	/**
	 *
	 * @param
	 * @return
	 */
	@RequestMapping("/hostArticle")
	public Result findHotArticle(){
		return new Result(true,StatusCode.OK,"查询成功",articleService.hotArticle());
	}

	@RequestMapping(value = "/examine/{id}",method = RequestMethod.PUT)
	public Result examine(@PathVariable String id){
		articleService.updataState(id);
		return new Result(true, StatusCode.OK,"审核成功");
	}

	@RequestMapping(value = "/visitsup",method = RequestMethod.PUT)
	public Result updateVisitsup( String id){
		articleService.addVisits(id);
		return new Result(true, StatusCode.OK,"添加访问量成功");
	}
	
	/**
	 * 查询全部数据
	 * @return
	 */
	@RequestMapping(method= RequestMethod.GET)
	public Result findAll(){
		return new Result(true, StatusCode.OK,"查询成功",articleService.findAll());
	}
	
	/**
	 * 根据ID查询
	 * @param id ID
	 * @return
	 */
	@RequestMapping(value = "/findById",method= RequestMethod.GET)
	public Result findById(@RequestParam("id") String id){
		System.out.println("##################################################################################");
		return new Result(true, StatusCode.OK,"查询成功",articleService.findById(id));
	}


	/**
	 * 分页+多条件查询
	 * @param searchMap 查询条件封装
	 * @param page 页码
	 * @param size 页大小
	 * @return 分页结果
	 */
	@RequestMapping(value="/search/{page}/{size}",method= RequestMethod.POST)
	public Result findSearch(@RequestBody Map searchMap , @PathVariable int page, @PathVariable int size){
		Page<Article> pageList = articleService.findSearch(searchMap, page, size);
		return  new Result(true, StatusCode.OK,"查询成功",  new PageResult<Article>(pageList.getTotalElements(), pageList.getContent()) );
	}

	/**
     * 根据条件查询
     * @param searchMap
     * @return
     */
    @RequestMapping(value="/search",method = RequestMethod.POST)
    public Result findSearch(@RequestBody Map searchMap){
		System.out.println("--------------"+searchMap.get("keywords"));
		return new Result(true, StatusCode.OK,"查询成功",articleService.findSearch(searchMap));
    }
	
	/**
	 * 增加
	 * @param article
	 */
	@RequestMapping(method= RequestMethod.POST)
	public Result add(@RequestBody Article article  ){
		articleService.add(article);
		return new Result(true, StatusCode.OK,"增加成功");
	}
	
	/**
	 * 修改
	 * @param article
	 */
	@RequestMapping(value="/{id}",method= RequestMethod.PUT)
	public Result update(@RequestBody Article article, @PathVariable String id ){
		article.setId(id);
		articleService.update(article);		
		return new Result(true, StatusCode.OK,"修改成功");
	}
	
	/**
	 * 删除
	 * @param id
	 */
	@RequestMapping(value="/{id}",method= RequestMethod.DELETE)
	public Result delete(@PathVariable String id ){
		articleService.deleteById(id);
		return new Result(true, StatusCode.OK,"删除成功");
	}
	
}
