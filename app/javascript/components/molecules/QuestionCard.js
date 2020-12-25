import React from 'react'
import { BrowserRouter as Router, Link } from 'react-router-dom'
import { makeStyles } from '@material-ui/core/styles'
import Card from '@material-ui/core/Card'
import CardActionArea from '@material-ui/core/CardActionArea'
import CardContent from '@material-ui/core/CardContent'
import Typography from '@material-ui/core/Typography'

const useStyles = makeStyles({
  root: {
    maxWidth: 600,
    margin: '0 auto',
    marginBottom: 20
  },
  questionDescription: {
    paddingBottom: 10
  }
})

export default function QuestionCard({question}) {
  const classes = useStyles()

  return (
    <Card className={classes.root}>
      <CardActionArea>
        <CardContent>
          <Typography gutterBottom variant="h5" component="h2">
            <Link to={`/questions/${question.id}`}> {question.title} </Link>
          </Typography>
          {question.description &&
            <Typography className={classes.questionDescription} variant="body2" color="textSecondary" component="p">
              {question.description}
            </Typography>
          }
          <Typography variant="body2" color="textSecondary" component="p">
            {question.userName} {question.updatedAt}
          </Typography>
        </CardContent>
      </CardActionArea>
    </Card>
  )
}

