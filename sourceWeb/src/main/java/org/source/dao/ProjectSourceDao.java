package org.source.dao;

import org.source.entity.ProjectSource;

import java.util.List;

/**
 * Created by yelei on 17-5-8.
 */
public interface ProjectSourceDao {
    public Integer addProjectUrl(ProjectSource projectSource);
    public ProjectSource selectMax();
    public List<ProjectSource> selectById(ProjectSource projectSource);
    public ProjectSource selectByProId(Integer id);
    public Integer deleteById(Integer id);
    public ProjectSource selectByProjectId(Integer id);
}
