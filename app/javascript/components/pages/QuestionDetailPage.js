import React, { useState, useEffect } from 'react'
import axios from 'axios'
import QuestionCard from '../molecules/QuestionCard'
import { useParams } from 'react-router-dom'

export default function QuestionDetailPage(){
  const [ question, setQuestion ] = useState({})
  const { id } = useParams()

  async function getQuestion(){
    try{
      const res = await axios.get(`/api/v1/questions/${id}`)
      setQuestion(res.data)
    }catch(error){
      console.dir(error)
    }
  }

  useEffect(() => {
    getQuestion()
  }, [])

  return(
    <>
      <QuestionCard question={question} />
    </>
  )
}

