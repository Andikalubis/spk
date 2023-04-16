<?php $this->load->view('layouts/header_admin'); ?>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><i class="fas fa-fw fa-calculator"></i> Data Perhitungan AHP SMART</h1>
</div>

<div class="alert alert-danger text-justify">
	Bobot kriteria didapatkan dari perhitungan menggunakan metode <b>AHP</b>. Silahkan menuju ke halaman <a href="<?= base_url('')?>Kriteria/prioritas" class="btn btn-info">Kriteria</a> untuk melihat proses perhitungan.
</div>

<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-success"><i class="fa fa-table"></i> Bobot Kriteria Preferensi (Wj)</h6>
    </div>

    <div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" width="100%" cellspacing="0">
				<thead class="bg-success text-white">
					<tr align="center">
						<?php foreach ($kriteria as $key): ?>
						<th><?= $key->kode_kriteria ?> (<?= $key->jenis ?>)</th>
						<?php endforeach ?>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<?php foreach ($kriteria as $key): ?>
						<td>
						<?php 
						echo $key->bobot;
						?>
						</td>
						<?php endforeach ?>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-success"><i class="fa fa-table"></i> Matrix Keputusan (X)</h6>
    </div>

    <div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" width="100%" cellspacing="0">
				<thead class="bg-success text-white">
					<tr align="center">
						<th width="5%">No</th>
						<th>Alternatif</th>
						<?php foreach ($kriteria as $key): ?>
						<th><?= $key->kode_kriteria ?></th>
						<?php endforeach ?>
					</tr>
				</thead>
				<tbody>
					<?php 
						$no=1;
						foreach ($alternatif as $keys): ?>
					<tr align="center">
						<td><?= $no; ?></td>
						<td align="left"><?= $keys->nama ?></td>
						<?php foreach ($kriteria as $key): ?>
						<td>
						<?php 
							$data_pencocokan = $this->Perhitungan_model->data_nilai($keys->id_alternatif,$key->id_kriteria);
							echo $data_pencocokan['nilai'];
						?>
						</td>
						<?php endforeach ?>
					</tr>
					<?php
						$no++;
						endforeach
					?>
					<tr align="center" class="bg-light">
						<th colspan="2">Nilai Min</th>
						<?php foreach ($kriteria as $key): ?>
						<th>
						<?php 
							$min_max=$this->Perhitungan_model->get_max_min($key->id_kriteria);
							echo $min_max['min'];
						?>
						</th>
						<?php endforeach ?>
					</tr>
					<tr align="center" class="bg-light">
						<th colspan="2">Nilai Max</th>
						<?php foreach ($kriteria as $key): ?>
						<th>
						<?php 
							$min_max=$this->Perhitungan_model->get_max_min($key->id_kriteria);
							echo $min_max['max'];
						?>
						</th>
						<?php endforeach ?>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-success"><i class="fa fa-table"></i> Nilai Utility (Ui)</h6>
    </div>

    <div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" width="100%" cellspacing="0">
				<thead class="bg-success text-white">
					<tr align="center">
						<th width="5%">No</th>
						<th>Alternatif</th>
						<?php foreach ($kriteria as $key): ?>
						<th><?= $key->kode_kriteria ?></th>
						<?php endforeach ?>
					</tr>
				</thead>
				<tbody>
					<?php 
						$no=1;
						foreach ($alternatif as $keys): ?>
					<tr align="center">
						<td><?= $no; ?></td>
						<td align="left"><?= $keys->nama ?></td>
						<?php foreach ($kriteria as $key): ?>
						<td>
						<?php 
							$data_pencocokan = $this->Perhitungan_model->data_nilai($keys->id_alternatif,$key->id_kriteria);
							$min_max=$this->Perhitungan_model->get_max_min($key->id_kriteria);
							if ($key->jenis == "Benefit") {
								echo @(round(($data_pencocokan['nilai']-$min_max['min'])/($min_max['max']-$min_max['min'])*100,4));
							}else {
								echo @(round(($min_max['max']-$data_pencocokan['nilai'])/($min_max['max']-$min_max['min'])*100,4));
							}
						?>
						</td>
						<?php endforeach ?>
					</tr>
					<?php
						$no++;
						endforeach
					?>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-success"><i class="fa fa-table"></i> Perhitungan SMART</h6>
    </div>

    <div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" width="100%" cellspacing="0">
				<thead class="bg-success text-white">
					<tr align="center">
						<th width="5%">No</th>
						<th>Alternatif</th>
						<th>Perhitungan SMART</th>
						<th width="15%">Total Nilai</th>
					</tr>
				</thead>
				<tbody>
					<?php
						$this->Perhitungan_model->hapus_hasil();
						$no=1;
						foreach ($alternatif as $keys): ?>
					<tr align="center">
						<td><?= $no; ?></td>
						<td align="left"><?= $keys->nama ?></td>
						<td>SUM
						<?php 
						$nilai_total = 0;
						foreach ($kriteria as $key){ ?>
						<?php 
							$total_bobot=$this->Perhitungan_model->get_total_kriteria();
							$data_pencocokan = $this->Perhitungan_model->data_nilai($keys->id_alternatif,$key->id_kriteria);
							$min_max=$this->Perhitungan_model->get_max_min($key->id_kriteria);
							
							$bobot = $key->bobot;
							if ($key->jenis == "Benefit") {
								$nilai_utility = @(round(($data_pencocokan['nilai']-$min_max['min'])/($min_max['max']-$min_max['min'])*100,4));
							}else {
								$nilai_utility = @(round(($min_max['max']-$data_pencocokan['nilai'])/($min_max['max']-$min_max['min'])*100,4));
							}
							
							$nilai_total += $bobot*$nilai_utility;
							
							echo "(".$bobot."x".$nilai_utility.") ";
						}
						$hasil_akhir = [
							'id_alternatif' => $keys->id_alternatif,
							'nilai' => round($nilai_total,2)
						];
						$result = $this->Perhitungan_model->insert_nilai_hasil($hasil_akhir);
						?>
						</td>
						<td>
						<?= round($nilai_total,2); ?>
						</td>
					</tr>
					<?php
						$no++;
						endforeach ?>
				</tbody>
			</table>
		</div>
	</div>
</div>

<?php
$this->load->view('layouts/footer_admin');
?>