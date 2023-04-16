<?php
    
    defined('BASEPATH') OR exit('No direct script access allowed');
    
    class Kategori_model extends CI_Model {

        public function tampil()
        {
            $query = $this->db->get('kategori');
            return $query->result();
        }

        public function insert($data = [])
        {
            $result = $this->db->insert('kategori', $data);
            return $result;
        }

        public function show($id_kategori)
        {
            $this->db->where('id_kategori', $id_kategori);
            $query = $this->db->get('kategori');
            return $query->row();
        } 

        public function update($id_kategori, $data = [])
        {
            $ubah = array(
                'nama_kategori'  => $data['nama_kategori'],
            );

            $this->db->where('id_kategori', $id_kategori);
            $this->db->update('kategori', $ubah);
        }


        public function delete($id_kategori)
        {
            $this->db->where('id_kategori', $id_kategori);
            $this->db->delete('kategori');
        }

        public function data_kategori($id_kriteria)
		{
			$query = $this->db->query("SELECT * FROM kategori WHERE id_kriteria='$id_kriteria';");
			return $query->result_array();
		}
    }