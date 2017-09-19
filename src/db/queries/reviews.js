const db = require('../../config/db.js').db

const getThreeReviews = () => {
  return db.many(`
    SELECT reviews.id, content, user_id, album_id, date_created, name, title, artist FROM reviews
      JOIN users
        ON reviews.user_id = users.id
      JOIN albums
        ON reviews.album_id = albums.id
      ORDER BY date_created DESC
      LIMIT 3;
    `)
}

const create = (content, userId, albumId) => {
  return db.none(`
    INSERT INTO reviews
      (content, user_id, album_id)
    VALUES
      ($1, $2, $3)
    `, [content, userId, albumId])
    .catch((error) => {
      console.error('\nError in queries/reviews.new\n')
      throw error
    })
}

module.exports = {
  getThreeReviews,
  create,
}
