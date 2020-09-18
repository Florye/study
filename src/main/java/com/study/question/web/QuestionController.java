package com.study.question.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.study.basic.pojo.Classroom;
import com.study.basic.pojo.Cls;
import com.study.basic.pojo.UserInfo;
import com.study.question.pojo.Answer;
import com.study.question.pojo.Question;
import com.study.question.pojo.VoteHistory;
import com.study.question.service.IQuestionService;
import com.study.user.pojo.Teacher;

@Controller
@RequestMapping("/question")
public class QuestionController {
	@Autowired
	private IQuestionService questionService;

	@RequestMapping(path = "/questionlist/{typeId}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView questionMain(@PathVariable(value = "typeId") Integer typeId, HttpSession session)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("typeId", typeId);
		List<Question> questionList = questionService.listPageQuestionByTypeId(typeId);
		if (questionList.size() > 0) {
			mv.addObject("questionList", questionList);
		} else {
			mv.addObject("msg", "当前无数据");
		}
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping(path = "/answermain", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView answerMain(Integer id) throws Exception {
		ModelAndView mv = new ModelAndView();
		Question question = questionService.selectQuestionByQuestionId(id);
		question.setQuestionViewnum(question.getQuestionViewnum() + 1);
		questionService.updateQuestionByPrimaryKeySelective(question);
		Question questionAndAnswerList = questionService.selectQuestionByQuestionId(id);
		mv.addObject("questionAndAnswerList", questionAndAnswerList);
		mv.setViewName("questiondetails");
		return mv;
	}

	@RequestMapping(path = "/saveanswer", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView saveAnswer(Answer answer, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		answer.setAnswerContent(answer.getAnswerContent().replace("<p>", "").replace("</p>", ""));
		UserInfo userInfo = (UserInfo) session.getAttribute("user");
		answer.setUserInfo(userInfo);
		answer.setAnswerCreatetime(new Date());
		questionService.addAnswerSelective(answer);
		mv.setViewName("forward:/question/answermain?id=" + answer.getAnswerQuestionid());
		return mv;
	}

	@RequestMapping(path = "/putquestion", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView putQuestion(Integer typeId) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("typeId", typeId);
		mv.setViewName("ask");
		return mv;
	}

	@RequestMapping(path = "/savequestion", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView saveQuestion(Question question, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		question.setQuestionContent(question.getQuestionContent().replace("<p>", "").replace("</p>", ""));
		UserInfo userInfo = (UserInfo) session.getAttribute("user");
		question.setUserInfo(userInfo);
		question.setQuestionCreatetime(new Date());
		System.out.println(question);
		questionService.addQuestionSelective(question);
		mv.setViewName("forward:/question/questionlist/1");
		return mv;
	}

	@RequestMapping(path = "/questionconditionlist", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView questionConditionList(Integer typeId, String queryQuestionTitle) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("typeId", typeId);
		List<Question> questionList = questionService.listPageQuestionLikeQuestionTitle(queryQuestionTitle, typeId);
		if (questionList.size() > 0) {
			mv.addObject("questionList", questionList);
		} else {
			mv.addObject("msg", "当前无数据");
		}
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping(path = "/questionanswernumlist", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView questionAnswernumList(Integer typeId) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("typeId", typeId);
		List<Question> questionList = questionService.listPageQuestionByAnswernum(typeId);
		if (questionList.size() > 0) {
			mv.addObject("questionList", questionList);
		} else {
			mv.addObject("msg", "当前无数据");
		}
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping(path = "/questionviewnumlist", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView questionViewnumList(Integer typeId) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("typeId", typeId);
		List<Question> questionList = questionService.listPageQuestionOrderByViewnum(typeId);
		if (questionList.size() > 0) {
			mv.addObject("questionList", questionList);
		} else {
			mv.addObject("msg", "当前无数据");
		}
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping(path = "/answerlistorderbydate", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView answerListOrderByDate(Integer id) throws Exception {
		ModelAndView mv = new ModelAndView();
		Question questionAndAnswerList = questionService.selectQuestionByQuestionId(id);
		mv.addObject("typeId", questionAndAnswerList.getQuestionType().getQuestiontypeId());
		mv.addObject("questionAndAnswerList", questionAndAnswerList);
		mv.setViewName("questiondetails");
		return mv;
	}

	@RequestMapping(path = "/answerlistorderbyvote")
	public ModelAndView answerListOrderByVote(Integer id) throws Exception {
		ModelAndView mv = new ModelAndView();
		Question questionAndAnswerList = questionService.listPageQuestionOrderByAnswerVote(id);
		mv.addObject("typeId", questionAndAnswerList.getQuestionType().getQuestiontypeId());
		mv.addObject("questionAndAnswerList", questionAndAnswerList);
		mv.setViewName("questiondetails");
		return mv;
	}

	@RequestMapping(path = "/questionvote/{historyUserid}/{historyQuestionid}/{action}", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView questionvote(@PathVariable("historyUserid") Integer userId,
			@PathVariable("historyQuestionid") Integer questionId, @PathVariable("action") String action)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		VoteHistory voteHistory = questionService.selectVoteByQuestionIdAndUserId(questionId, userId);
		if (voteHistory == null) {
			VoteHistory newVoteHistory = new VoteHistory();
			newVoteHistory.setHistoryQuestionid(questionId);
			newVoteHistory.setHistoryUserid(userId);
			questionService.insertSelective(newVoteHistory);
			Question question = questionService.selectQuestionByQuestionId(questionId);
			if ("顶".equals(action)) {
				question.setQuestionVotenum(question.getQuestionVotenum() + 1);
				questionService.updateQuestionByPrimaryKeySelective(question);
			} else {
				question.setQuestionVotenum(question.getQuestionVotenum() - 1);
				questionService.updateQuestionByPrimaryKeySelective(question);
			}
		}
		mv.setViewName("forward:/question/answerlistorderbydate?id=" + questionId);
		return mv;
	}

	@RequestMapping(path = "/answervote/{historyUserid}/{answerid}/{action}", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView answervote(@PathVariable("historyUserid") Integer userId,
			@PathVariable("answerid") Integer answerid, @PathVariable("action") String action) throws Exception {
		ModelAndView mv = new ModelAndView();
		VoteHistory voteHistory = questionService.selectVoteByAnwserIdAndUserId(answerid, userId);
		if (voteHistory == null) {
			VoteHistory newVoteHistory = new VoteHistory();
			newVoteHistory.setHistoryAnswerid(answerid);
			newVoteHistory.setHistoryUserid(userId);
			questionService.insertSelective(newVoteHistory);
			Answer answer = questionService.selectAnswerByPrimaryKey(answerid);
			if ("顶".equals(action)) {
				answer.setAnswerVote(answer.getAnswerVote() + 1);
				questionService.updateAnswerByPrimaryKeySelective(answer);
			} else {
				answer.setAnswerVote(answer.getAnswerVote() - 1);
				questionService.updateAnswerByPrimaryKeySelective(answer);
			}
		}
		mv.setViewName("forward:/question/answerlistorderbydate?id="
				+ questionService.selectAnswerByPrimaryKey(answerid).getAnswerQuestionid());
		return mv;
	}

	@RequestMapping(path = "/questionmain", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView questionmain() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<Question> qlist = questionService.listAllQuestion();
		if (qlist.size() > 0) {
			mv.addObject("qlist", qlist);
		} else {
			mv.addObject("msg", "当前无数据");
		}
		mv.setViewName("back/question");
		return mv;
	}

	@RequestMapping(path = "/delquestion/{id}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deleteQuestion(@PathVariable("id") Integer id) throws Exception {
		ModelAndView mv = new ModelAndView();
		boolean b = questionService.deleteQuestionById(id);
		mv.setViewName("forward:/question/questionmain");
		return mv;
	}

}
