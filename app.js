const app = require('express')();
const mysql = require('mysql');
const cors = require('cors');
require('dotenv').config()

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'schizumy_bengkelprint',
});

connection.connect()

app.use(cors())

app.get('/', (req, res) => {
  res.send('Bengkel Print Indonesia API')
})

app.get('/pesanan', (req, res) => {
  connection.query(
      `SELECT pesanan_mesin.serial_number, pesanan_mesin.email_user, jenis_mesin.nama_mesin FROM pesanan_mesin
      JOIN jenis_mesin ON pesanan_mesin.id_mesin = jenis_mesin.id_mesin`, 
    (err, rows, fields) => {
    if (err) return res.send(err)
    res.json(rows)
  })
})

app.get('/mesin', (req, res) => {
  connection.query(
      `SELECT * FROM jenis_mesin`, 
    (err, rows, fields) => {
    if (err) return res.send(err)
    res.json(rows)
  })
})

app.get('/perbaikan/:serialNumber', (req, res) => {
  connection.query(
    `SELECT log_perbaikan.nama_sparepart, log_perbaikan.tanggal_perbaikan, teknisi_perbaikan.kota_teknisi, log_perbaikan.jumlah_sparepart, log_perbaikan.status_perbaikan FROM log_perbaikan
    JOIN teknisi_perbaikan ON teknisi_perbaikan.id_teknisi = log_perbaikan.id_teknisi
    WHERE log_perbaikan.serial_number LIKE '${req.params.serialNumber}'`, 
    (err, rows, fields) => {
    if (err) return res.send(err)
    res.json(rows)
  })
})


app.get('/perbaikan/', (req, res) => {
  connection.query(
    `SELECT log_perbaikan.serial_number, log_perbaikan.nama_sparepart, log_perbaikan.tanggal_perbaikan, teknisi_perbaikan.kota_teknisi, log_perbaikan.jumlah_sparepart, log_perbaikan.status_perbaikan FROM log_perbaikan
    JOIN teknisi_perbaikan ON teknisi_perbaikan.id_teknisi = log_perbaikan.id_teknisi`, 
    (err, rows, fields) => {
    if (err) return res.send(err)
    res.json(rows)
  })
})

app.listen(process.env.PORT || 5000, () => {
  console.log('connected to server')
})