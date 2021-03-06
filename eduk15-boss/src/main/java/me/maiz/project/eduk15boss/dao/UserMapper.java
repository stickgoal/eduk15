package me.maiz.project.eduk15boss.dao;

import java.util.List;
import me.maiz.project.eduk15boss.model.User;
import me.maiz.project.eduk15boss.model.UserExample;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rkt_user
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    long countByExample(UserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rkt_user
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    int deleteByExample(UserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rkt_user
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    int deleteByPrimaryKey(Integer userId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rkt_user
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    int insert(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rkt_user
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    int insertSelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rkt_user
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    List<User> selectByExample(UserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rkt_user
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    User selectByPrimaryKey(Integer userId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rkt_user
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rkt_user
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rkt_user
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    int updateByPrimaryKeySelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rkt_user
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    int updateByPrimaryKey(User record);
}