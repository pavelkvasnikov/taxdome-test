import React from 'react';
import './App.css';
import TableContainer from "./components/TableContainer";
import {BrowserRouter as Router} from "react-router-dom";

function App() {
  return (
    <Router>
      <div className="App">
        <TableContainer />
      </div>
    </Router>
  );
}


export default App;
