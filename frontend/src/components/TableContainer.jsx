import React from "react"
import { observer } from "mobx-react"
import {
  Switch,
  Route,
  NavLink,
} from "react-router-dom";
import Board from "./Board";
import {BASE_URL} from "../constants/constants";

class TableContainer extends React.Component {

  constructor(props) {
    super(props)
    let socket = new WebSocket("ws://"+window.location.hostname+":3006");
    socket.onmessage = (event) => {
        this.setState({boards: []})
        this.initialLoad();
    };
    this.state = {
      value: '',
      boards: []
    }
  }

  initialLoad = () => {
    fetch(`${BASE_URL}/boards`)
    .then(response =>
      response.json()
    )
    .then(result => {
      this.setState({boards: result.boards})
    })
  }

  componentDidMount() {
    this.initialLoad();
  }

  addBoard = () => {
    fetch(`${BASE_URL}/boards?${new URLSearchParams({name: this.state.value})}`,
      {
        method: 'POST'
      })
  }

  handleChange = (event) => {
    this.setState({value: event.target.value});
  }

  render() {
    if (this.state.boards.length === 0) return null;
    return  (
      <div>
        <div>Welcome to Trello 2.0 beta!</div>
        <div>
          <span>Add new Board</span>
          <label>
            Board name
          <input type="text" onChange={this.handleChange} value={this.state.value} />
          </label>
          <button onClick={this.addBoard}>Add</button>
        </div>

        <div className="links">
          {this.state.boards.map((board) =>
            <NavLink activeClassName="selected" key={board.id} to={`/boards/${board.link}`}>{board.name}</NavLink>  )
          }
        </div>
          <Switch>
            {this.state.boards.map((board) =>
              <Route key={board.id} exact path={`/boards/${board.link}`}>
                <Board board={board} />
              </Route>)
            }
          </Switch>

      </div>
    )
  }
}
export default observer(TableContainer);
