import React, { useState, useEffect } from 'react'
import axios from 'axios'
import QuestionCard from '../molecules/QuestionCard'

export default function QuestionIndexPage(){
  const [questions, setQuestions] = useState([])

  async function getQuestions(){
    try{
      const res = await axios.get(`/api/v1/questions`)
      setQuestions(res.data)
    }catch(error){
    }
  }

  useEffect(() => {
    getQuestions()
  }, [])

  return(
    <>
      <ul>
        {questions.map(question =>
          <li key={question.id}>
            <QuestionCard question={question} />
          </li>
        )}
      </ul>
    </>
  )
}

