﻿using LibraryManagement.DAL;
using LibraryManagement.DTO;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace LibraryManagement.BUS
{
    internal class HoSoBUS
    {

        private HoSoDAO hoSoDAO = new HoSoDAO();

        public ArrayList getAllProfile()
        {
            ArrayList hoSoQuanLyDTOs = new ArrayList();
            DataTable profiles = hoSoDAO.getAllProfile();
            if(profiles==null || profiles.Rows.Count<=0)
            {
                return hoSoQuanLyDTOs;
            }
            foreach (DataRow dr in profiles.Rows)
            {
                HoSoQuanLyDTO hoSoQuanLyDTO = new HoSoQuanLyDTO();
                hoSoQuanLyDTO.Id = Convert.ToInt32(dr["id"]);  
                hoSoQuanLyDTO.TenDangNhap = dr["tenDangNhap"].ToString();
                hoSoQuanLyDTO.VaiTro = dr["vaiTro"].ToString();
                hoSoQuanLyDTO.Ten = dr["ten"].ToString();
                hoSoQuanLyDTO.Ho = dr["ho"].ToString();
                hoSoQuanLyDTO.Diachi = dr["diachi"].ToString();
                hoSoQuanLyDTO.SoDT = dr["SoDT"].ToString();
                hoSoQuanLyDTO.Email = dr["email"].ToString();
                hoSoQuanLyDTO.GioiTinh = Convert.ToInt32(dr["gioitinh"]);
                Object luong = dr["luong"];
                if (luong != DBNull.Value)
                {
                    hoSoQuanLyDTO.Luong = Convert.ToInt32(dr["luong"]);
                }
                
                hoSoQuanLyDTO.Ngaysinh = (DateTime) dr["ngaySinh"];
                hoSoQuanLyDTO.TrangThai = Convert.ToInt32(dr["trangThai"]);
                hoSoQuanLyDTOs.Add(hoSoQuanLyDTO);
            }
            return hoSoQuanLyDTOs;
        }

        internal int getIdByUsername(string username)
        {
            return hoSoDAO.getIdByUsername(username);
        }

        public HoSoQuanLyDTO getProfileById(int profileId)
        {
            DataTable profile = hoSoDAO.getProfileById(profileId);
            DataRow dr = profile.Rows[0];
            
            HoSoQuanLyDTO hoSoQuanLyDTO = new HoSoQuanLyDTO();
            hoSoQuanLyDTO.Id = Convert.ToInt32(dr["id"]);
            hoSoQuanLyDTO.TenDangNhap = dr["tenDangNhap"].ToString();
            hoSoQuanLyDTO.VaiTro = dr["vaiTro"].ToString();
            hoSoQuanLyDTO.Ten = dr["ten"].ToString();
            hoSoQuanLyDTO.Ho = dr["ho"].ToString();
            hoSoQuanLyDTO.Diachi = dr["diachi"].ToString();
            hoSoQuanLyDTO.SoDT = dr["SoDT"].ToString();
            hoSoQuanLyDTO.Email = dr["email"].ToString();
            hoSoQuanLyDTO.Hinhanh = dr["hinhanh"].ToString();
            if (Convert.ToInt32(dr["trangThai"]) == 1)
            {
                hoSoQuanLyDTO.TrangThai = 1;
            }
            else
            {
                hoSoQuanLyDTO.TrangThai = 0;
            }
            
            Object luong = dr["luong"];
            if (luong != DBNull.Value)
            {
                hoSoQuanLyDTO.Luong = Convert.ToInt32(dr["luong"]);
            }
            hoSoQuanLyDTO.GioiTinh = Convert.ToInt32(dr["gioitinh"]);
            hoSoQuanLyDTO.Ngaysinh = (DateTime)dr["ngaySinh"];
            hoSoQuanLyDTO.TrangThai = Convert.ToInt32(dr["trangThai"]);
            return hoSoQuanLyDTO;
        }

        internal int saveImage(string hinhanh, int id)
        {
           return hoSoDAO.saveImage(hinhanh, id);
        }


        public int updateInfo(HoSoQuanLyDTO hoSoQuanLyDTO)
        {
            return hoSoDAO.updateInfo(hoSoQuanLyDTO);
        }

        public int saveInfo(HoSoQuanLyDTO hoSoQuanLyDTO)
        {
           return hoSoDAO.saveInfo(hoSoQuanLyDTO);
        }

        internal int updateBasicInfo(HoSoQuanLyDTO hoSoQuanLyDTO)
        {
            return hoSoDAO.updateBasicInfo(hoSoQuanLyDTO);
        }
    }
}
