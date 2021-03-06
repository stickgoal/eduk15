package me.maiz.project.eduk15boss.dao;

import java.util.List;
import me.maiz.project.eduk15boss.model.RolePermission;
import me.maiz.project.eduk15boss.model.RolePermissionExample;
import org.apache.ibatis.annotations.Param;

public interface RolePermissionMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table boss_role_permission
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    long countByExample(RolePermissionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table boss_role_permission
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    int deleteByExample(RolePermissionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table boss_role_permission
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    int deleteByPrimaryKey(Integer rolePermId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table boss_role_permission
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    int insert(RolePermission record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table boss_role_permission
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    int insertSelective(RolePermission record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table boss_role_permission
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    List<RolePermission> selectByExample(RolePermissionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table boss_role_permission
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    RolePermission selectByPrimaryKey(Integer rolePermId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table boss_role_permission
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    int updateByExampleSelective(@Param("record") RolePermission record, @Param("example") RolePermissionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table boss_role_permission
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    int updateByExample(@Param("record") RolePermission record, @Param("example") RolePermissionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table boss_role_permission
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    int updateByPrimaryKeySelective(RolePermission record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table boss_role_permission
     *
     * @mbg.generated Mon May 31 16:20:22 CST 2021
     */
    int updateByPrimaryKey(RolePermission record);
}