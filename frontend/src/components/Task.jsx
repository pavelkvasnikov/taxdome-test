import React from "react"
import {BASE_URL} from "../constants/constants";

export default class Task extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      value: this.props.task.title
    }
  }

  deleteTask = () => {
     fetch(`${BASE_URL}/tasks/${this.props.task.id}`, { method: 'DELETE'})
  }

  updateTask = (params) => {
    fetch(`${BASE_URL}/tasks/${this.props.task.id}?${new URLSearchParams({
        id: this.props.task.id,
        article_id: this.props.article.id,
        title: this.state.value
    })}`,
      { method: 'PUT'})
  }

  onChange = (e) => {
    let article_id = e.target.value;
    if (article_id !=='none') {
      this.updateTask(article_id)
    }
  };

  handleChange = (event) => {
    this.setState({value: event.target.value});
  }

  render() {
    if (this.props)
    return (
      <div className="task-container">
        <div>
          <label>
            Task title:
            <input type="text" value={this.state.value} onChange={this.handleChange}/>
            <button onClick={this.updateTask}>Update title</button>
          </label>

        </div>
        <div>
          <label>
            Change column
            <select onChange={this.onChange}>
              <option key={'none'} value={'none'}>Default</option>
              {this.props.articles.map((article) =>
                <option key={article.id} value={article.id}>{article.name}</option>
              )}
            </select>
          </label>
        </div>
        <button onClick={this.deleteTask}>Delete Task</button>
      </div>
    )
  }
}
