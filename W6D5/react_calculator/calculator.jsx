import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    //your code here
    this.state = { leftNum: "", rightNum: "", result: 0 };
    this.setLeftNum = this.setLeftNum.bind(this);
    this.setRightNum = this.setRightNum.bind(this);
    this.clear = this.clear.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
  }

  setLeftNum(e){
    this.setState({leftNum: parseInt(e.target.value)});
  }

  setRightNum(e){
    this.setState({rightNum: parseInt(e.target.value)});
  }

  clear(e) {
    e.preventDefault();
    this.setState({rightNum: "", leftNum: "", result: "0"});
  }
  
  add(e) {
    e.preventDefault();
    this.setState({result: this.state.leftNum + this.state.rightNum});
  }

  subtract(e) {
    e.preventDefault();
    this.setState({result: this.state.leftNum - this.state.rightNum});
  }
  
  multiply(e) {
    e.preventDefault();
    this.setState({result: this.state.leftNum * this.state.rightNum});
  }
  
  divide(e) {
    e.preventDefault();
    this.setState({result: this.state.leftNum / this.state.rightNum});
  }
  
  render(){
    let {leftNum, rightNum, result} = this.state;
    return (
      <div>
        <h1>{result}</h1>
        <input type="text" onChange={this.setLeftNum} value={leftNum}/>
        <input type="text" onChange={this.setRightNum} value={rightNum}/>
        <button onClick={this.clear}>Clear</button>
        <br/>
        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>
      </div>
    );
  }
}

export default Calculator;
