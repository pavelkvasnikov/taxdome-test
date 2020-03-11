import React from "react"
import Article from "./Article";
import {BASE_URL} from "../constants/constants";

export default class Board extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      value: '',
      articles: []
    }
  }

  componentDidMount() {
    this.getArticles(this.props.board.link)
  }

  getArticles(params) {
    fetch(`${BASE_URL}/boards/${new URLSearchParams({link: params})}?${new URLSearchParams({link: params})}`)
    .then(response =>
       response.json()
    )
    .then(result => {
          this.setState({articles: result.board.articles})
    })
  }

  addColumn = () => {
    fetch(`${BASE_URL}/articles?${new URLSearchParams({name: this.state.value, board_id: this.props.board.id})}`,
      {
        method: 'POST'
      })
  }

  handleChange = (event) => {
    this.setState({value: event.target.value});
  }

  render() {

    return (
      <div>
         <div className="board-title">Welcome to Board {this.props.board.name} !</div>
        <div>
          <label>
            Add column
            <input type="text" onChange={this.handleChange} value={this.state.value} />
          </label>
          <button onClick={this.addColumn}>Add</button>
        </div>
        {this.state.articles.length !== 0 && (<div className="board-container">
           {this.state.articles.map((article) =>
             <Article key={article.id} article={article} articles={this.state.articles}  />
           )}
         </div>)}
      </div>
    )
  }
}
