require! {
  'mongodb' : {MongoClient}
  'nitroglycerin' : N
}


db = null
get-db = (done) ->
  return done db if db
  MongoClient.connect "mongodb://localhost:27017/space-tweet-tweets", N (mongo-db) ->
    db := mongo-db
    done db


module.exports = ->

  @set-default-timeout 1000


  @Before (_scenario, done) ->
    get-db (db) ->
      db.collection('tweets')?.drop!
      done!

  @After ->
    @exocomm?.close!
    @process?.close!


  @registerHandler 'AfterFeatures', (_event, done) ->
    get-db (db) ->
      db.collection('tweets')?.drop!
      db.close!
      done!
