<!DOCTYPE html>
<html>
<head>
	<title>Sistem Pendukung Keputusan Metode AHP SMART</title>
</head>
<style>
    table {
        border-collapse: collapse;
    }
    table, th, td {
        border: 1px solid black;
    }
</style>
<body>
	<img src="assets/img/logo1.png" width="100px" style="position:absolute;">
	<div style="text-align:center;">
		<h3>
		PEMERINTAHAN KABUPATEN CIREBON
		<br> KECAMATAN Gebang
		<br> Jl.Pangeran Sutajaya No.76 Telp (0231) 662 800	
		</h3>
	</div>
	<hr class="line-title">
	<div style="text-align:center;">
		Pemilihan Desa Terbaik Kecamatan Gebang
		<br> Kabupaten Cirebon
		<br> Jawa Barat
	</div>		
<table border="1" width="100%">
	<thead>
		<tr align="center">
			<th>Kode Alternatif</th>
			<th>Alternatif</th>
			<th width="15%">Ranking</th>
		</tr>
	</thead>
	<tbody>
		<?php
			$no=1;
			foreach ($hasil as $keys): ?>
		<tr align="center">
			<td> 
				<?php
				$nama_alternatif = $this->Perhitungan_model->get_hasil_alternatif($keys->id_alternatif);
				echo $nama_alternatif['kode_alternatif'];
				?> 
			</td>
			<td>
			<?php
				$nama_alternatif = $this->Perhitungan_model->get_hasil_alternatif($keys->id_alternatif);
				echo $nama_alternatif['nama'];
			?>
			</td>
			<td><?= $no; ?></td>
		</tr>
		<?php
			$no++;
			endforeach ?>
	</tbody>
</table>
</body>
</html>