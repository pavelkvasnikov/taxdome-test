import React from "react"
import {BASE_URL} from "../constants/constants";
import Task from "./Task";
export default class Article extends React.Component {

  deleteArticle = () => {
    fetch(`${BASE_URL}/articles/${this.props.article.id}`, { method: 'DELETE'})
  }

  handleChange = (event) => {
    this.setState({value: event.target.value});
  }

  addNewTask = () => {
    fetch(`${BASE_URL}/tasks?${new URLSearchParams({
        title: this.state.value,
        article_id: this.props.article.id
    })}`,
      {
        method: 'POST'
      })
  }

  render() {
    return (
      <div className="article-container">
         <span className="article-title">{this.props.article.name} <button onClick={this.deleteArticle}>X</button></span>
         <div>
           {this.props.article.tasks.map((task) => <Task article={this.props.article} articles={this.props.articles} key={task.id} task={task} /> )}
         </div>
         <div>
           <label>Add new task</label>
           <input onChange={this.handleChange} />
           <button onClick={this.addNewTask}>Add</button>
         </div>
      </div>
    )
  }
}
