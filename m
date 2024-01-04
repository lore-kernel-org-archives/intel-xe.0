Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969C3C47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 09:36:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5465110E3D3;
	Thu,  4 Jan 2024 09:36:05 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C262E10E3EA;
 Thu,  4 Jan 2024 09:36:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Check_skip=5Fguc=5Fp?=
 =?utf-8?q?c_before_setting_SLPC_flag?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Date: Thu, 04 Jan 2024 09:36:03 -0000
Message-ID: <170436096379.1840.6265821990411577398@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20231222210109.533215-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20231222210109.533215-1-vinay.belgaumkar@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Check skip_guc_pc before setting SLPC flag
URL   : https://patchwork.freedesktop.org/series/128001/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[09:35:12] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:35:16] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[09:35:39] Starting KUnit Kernel (1/1)...
[09:35:39] ============================================================
[09:35:39] ========================= guc_dbm  =========================
[09:35:39] [PASSED] test_empty
[09:35:39] [PASSED] test_default
[09:35:39] ======================== test_size  ========================
[09:35:39] [PASSED] 4
[09:35:39] [PASSED] 8
[09:35:39] [PASSED] 32
[09:35:39] [PASSED] 256
[09:35:39] ==================== [PASSED] test_size ====================
[09:35:39] ======================= test_reuse  ========================
[09:35:39] [PASSED] 4
[09:35:39] [PASSED] 8
[09:35:39] [PASSED] 32
[09:35:39] [PASSED] 256
[09:35:39] =================== [PASSED] test_reuse ====================
[09:35:39] =================== test_range_overlap  ====================
[09:35:39] [PASSED] 4
[09:35:39] [PASSED] 8
[09:35:39] [PASSED] 32
[09:35:39] [PASSED] 256
[09:35:39] =============== [PASSED] test_range_overlap ================
[09:35:39] =================== test_range_compact  ====================
[09:35:39] [PASSED] 4
[09:35:39] [PASSED] 8
[09:35:39] [PASSED] 32
[09:35:39] [PASSED] 256
[09:35:39] =============== [PASSED] test_range_compact ================
[09:35:39] ==================== test_range_spare  =====================
[09:35:39] [PASSED] 4
[09:35:39] [PASSED] 8
[09:35:39] [PASSED] 32
[09:35:39] [PASSED] 256
[09:35:39] ================ [PASSED] test_range_spare =================
[09:35:39] ===================== [PASSED] guc_dbm =====================
[09:35:39] ========================== lmtt  ===========================
[09:35:39] ======================== test_ops  =========================
[09:35:39] [PASSED] 2-level
[09:35:39] [PASSED] multi-level
[09:35:39] ==================== [PASSED] test_ops =====================
[09:35:39] ====================== [PASSED] lmtt =======================
[09:35:39] ========================== xe_bo  ==========================
[09:35:39] [SKIPPED] xe_ccs_migrate_kunit
[09:35:39] [SKIPPED] xe_bo_evict_kunit
[09:35:39] ===================== [SKIPPED] xe_bo ======================
[09:35:39] ======================= xe_dma_buf  ========================
[09:35:39] [SKIPPED] xe_dma_buf_kunit
[09:35:39] =================== [SKIPPED] xe_dma_buf ===================
[09:35:39] ======================= xe_migrate  ========================
[09:35:39] [SKIPPED] xe_migrate_sanity_kunit
[09:35:39] =================== [SKIPPED] xe_migrate ===================
[09:35:39] ========================= xe_mocs  =========================
[09:35:39] [SKIPPED] xe_live_mocs_kernel_kunit
[09:35:39] ==================== [SKIPPED] xe_mocs =====================
[09:35:39] ========================= xe_pci  ==========================
[09:35:39] [PASSED] xe_gmdid_graphics_ip
[09:35:39] [PASSED] xe_gmdid_media_ip
[09:35:39] ===================== [PASSED] xe_pci ======================
[09:35:39] ========================= xe_rtp  ==========================
[09:35:39] ================== xe_rtp_process_tests  ===================
[09:35:39] [PASSED] coalesce-same-reg
[09:35:39] [PASSED] no-match-no-add
[09:35:39] [PASSED] no-match-no-add-multiple-rules
[09:35:39] [PASSED] two-regs-two-entries
[09:35:39] [PASSED] clr-one-set-other
[09:35:39] [PASSED] set-field
[09:35:39] [PASSED] conflict-duplicate
[09:35:39] [PASSED] conflict-not-disjoint
[09:35:39] [PASSED] conflict-reg-type
[09:35:39] ============== [PASSED] xe_rtp_process_tests ===============
[09:35:39] ===================== [PASSED] xe_rtp ======================
[09:35:39] ========================== xe_wa  ==========================
[09:35:39] ======================== xe_wa_gt  =========================
[09:35:39] [PASSED] TIGERLAKE (B0)
[09:35:39] [PASSED] DG1 (A0)
[09:35:39] [PASSED] DG1 (B0)
[09:35:39] [PASSED] ALDERLAKE_S (A0)
[09:35:39] [PASSED] ALDERLAKE_S (B0)
[09:35:39] [PASSED] ALDERLAKE_S (C0)
[09:35:39] [PASSED] ALDERLAKE_S (D0)
[09:35:39] [PASSED] ALDERLAKE_P (A0)
[09:35:39] [PASSED] ALDERLAKE_P (B0)
[09:35:39] [PASSED] ALDERLAKE_P (C0)
[09:35:39] [PASSED] ALDERLAKE_S_RPLS (D0)
[09:35:39] [PASSED] ALDERLAKE_P_RPLU (E0)
[09:35:39] [PASSED] DG2_G10 (A0)
[09:35:39] [PASSED] DG2_G10 (A1)
[09:35:39] [PASSED] DG2_G10 (B0)
[09:35:39] [PASSED] DG2_G10 (C0)
[09:35:39] [PASSED] DG2_G11 (A0)
[09:35:39] [PASSED] DG2_G11 (B0)
[09:35:39] [PASSED] DG2_G11 (B1)
[09:35:39] [PASSED] DG2_G12 (A0)
[09:35:39] [PASSED] DG2_G12 (A1)
[09:35:39] [PASSED] PVC (B0)
[09:35:39] [PASSED] PVC (B1)
[09:35:39] [PASSED] PVC (C0)
[09:35:39] [PASSED] METEORLAKE (g:A0, m:A0)
[09:35:39] [PASSED] METEORLAKE (g:A0, m:A0)
[09:35:39] [PASSED] LUNARLAKE (g:A0, m:A0)
[09:35:39] [PASSED] LUNARLAKE (g:B0, m:A0)
[09:35:39] ==================== [PASSED] xe_wa_gt =====================
[09:35:39] ====================== [PASSED] xe_wa ======================
[09:35:39] ============================================================
[09:35:39] Testing complete. Ran 68 tests: passed: 63, skipped: 5
[09:35:39] Elapsed time: 27.602s total, 4.202s configuring, 23.180s building, 0.185s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[09:35:39] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:35:41] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[09:36:01] Starting KUnit Kernel (1/1)...
[09:36:01] ============================================================
[09:36:01] ================== drm_test_pick_cmdline  ==================
[09:36:01] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[09:36:01] =============== drm_test_pick_cmdline_named  ===============
[09:36:01] [PASSED] NTSC
[09:36:01] [PASSED] NTSC-J
[09:36:01] [PASSED] PAL
[09:36:01] [PASSED] PAL-M
[09:36:01] =========== [PASSED] drm_test_pick_cmdline_named ===========
[09:36:01] ============== [PASSED] drm_test_pick_cmdline ==============
[09:36:01] ======================== drm_buddy  ========================
[09:36:01] [PASSED] drm_test_buddy_alloc_limit
[09:36:01] [PASSED] drm_test_buddy_alloc_optimistic
[09:36:01] [PASSED] drm_test_buddy_alloc_pessimistic
[09:36:01] [PASSED] drm_test_buddy_alloc_pathological
[09:36:01] ==================== [PASSED] drm_buddy ====================
[09:36:01] =================== drm_cmdline_parser  ====================
[09:36:01] [PASSED] drm_test_cmdline_force_d_only
[09:36:01] [PASSED] drm_test_cmdline_force_D_only_dvi
[09:36:01] [PASSED] drm_test_cmdline_force_D_only_hdmi
[09:36:01] [PASSED] drm_test_cmdline_force_D_only_not_digital
[09:36:01] [PASSED] drm_test_cmdline_force_e_only
[09:36:01] [PASSED] drm_test_cmdline_res
[09:36:01] [PASSED] drm_test_cmdline_res_vesa
[09:36:01] [PASSED] drm_test_cmdline_res_vesa_rblank
[09:36:01] [PASSED] drm_test_cmdline_res_rblank
[09:36:01] [PASSED] drm_test_cmdline_res_bpp
[09:36:01] [PASSED] drm_test_cmdline_res_refresh
[09:36:01] [PASSED] drm_test_cmdline_res_bpp_refresh
[09:36:01] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[09:36:01] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[09:36:01] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[09:36:01] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[09:36:01] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[09:36:01] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[09:36:01] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[09:36:01] [PASSED] drm_test_cmdline_res_margins_force_on
[09:36:01] [PASSED] drm_test_cmdline_res_vesa_margins
[09:36:01] [PASSED] drm_test_cmdline_name
[09:36:01] [PASSED] drm_test_cmdline_name_bpp
[09:36:01] [PASSED] drm_test_cmdline_name_option
[09:36:01] [PASSED] drm_test_cmdline_name_bpp_option
[09:36:01] [PASSED] drm_test_cmdline_rotate_0
[09:36:01] [PASSED] drm_test_cmdline_rotate_90
[09:36:01] [PASSED] drm_test_cmdline_rotate_180
[09:36:01] [PASSED] drm_test_cmdline_rotate_270
[09:36:01] [PASSED] drm_test_cmdline_hmirror
[09:36:01] [PASSED] drm_test_cmdline_vmirror
[09:36:01] [PASSED] drm_test_cmdline_margin_options
[09:36:01] [PASSED] drm_test_cmdline_multiple_options
[09:36:01] [PASSED] drm_test_cmdline_bpp_extra_and_option
[09:36:01] [PASSED] drm_test_cmdline_extra_and_option
[09:36:01] [PASSED] drm_test_cmdline_freestanding_options
[09:36:01] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[09:36:01] [PASSED] drm_test_cmdline_panel_orientation
[09:36:01] ================ drm_test_cmdline_invalid  =================
[09:36:01] [PASSED] margin_only
[09:36:01] [PASSED] interlace_only
[09:36:01] [PASSED] res_missing_x
[09:36:01] [PASSED] res_missing_y
[09:36:01] [PASSED] res_bad_y
[09:36:01] [PASSED] res_missing_y_bpp
[09:36:01] [PASSED] res_bad_bpp
[09:36:01] [PASSED] res_bad_refresh
[09:36:01] [PASSED] res_bpp_refresh_force_on_off
[09:36:01] [PASSED] res_invalid_mode
[09:36:01] [PASSED] res_bpp_wrong_place_mode
[09:36:01] [PASSED] name_bpp_refresh
[09:36:01] [PASSED] name_refresh
[09:36:01] [PASSED] name_refresh_wrong_mode
[09:36:01] [PASSED] name_refresh_invalid_mode
[09:36:01] [PASSED] rotate_multiple
[09:36:01] [PASSED] rotate_invalid_val
[09:36:01] [PASSED] rotate_truncated
[09:36:01] [PASSED] invalid_option
[09:36:01] [PASSED] invalid_tv_option
[09:36:01] [PASSED] truncated_tv_option
[09:36:01] ============ [PASSED] drm_test_cmdline_invalid =============
[09:36:01] =============== drm_test_cmdline_tv_options  ===============
[09:36:01] [PASSED] NTSC
[09:36:01] [PASSED] NTSC_443
[09:36:01] [PASSED] NTSC_J
[09:36:01] [PASSED] PAL
[09:36:01] [PASSED] PAL_M
[09:36:01] [PASSED] PAL_N
[09:36:01] [PASSED] SECAM
[09:36:01] =========== [PASSED] drm_test_cmdline_tv_options ===========
[09:36:01] =============== [PASSED] drm_cmdline_parser ================
[09:36:01] ================ drm_get_tv_mode_from_name  ================
[09:36:01] ========== drm_test_get_tv_mode_from_name_valid  ===========
[09:36:01] [PASSED] NTSC
[09:36:01] [PASSED] NTSC-443
[09:36:01] [PASSED] NTSC-J
[09:36:01] [PASSED] PAL
[09:36:01] [PASSED] PAL-M
[09:36:01] [PASSED] PAL-N
[09:36:01] [PASSED] SECAM
[09:36:01] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[09:36:01] [PASSED] drm_test_get_tv_mode_from_name_truncated
[09:36:01] ============ [PASSED] drm_get_tv_mode_from_name ============
[09:36:01] ==================== drm_damage_helper  ====================
[09:36:01] [PASSED] drm_test_damage_iter_no_damage
[09:36:01] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[09:36:01] [PASSED] drm_test_damage_iter_no_damage_src_moved
[09:36:01] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[09:36:01] [PASSED] drm_test_damage_iter_no_damage_not_visible
[09:36:01] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[09:36:01] [PASSED] drm_test_damage_iter_no_damage_no_fb
[09:36:01] [PASSED] drm_test_damage_iter_simple_damage
[09:36:01] [PASSED] drm_test_damage_iter_single_damage
[09:36:01] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[09:36:01] [PASSED] drm_test_damage_iter_single_damage_outside_src
[09:36:01] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[09:36:01] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[09:36:01] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[09:36:01] [PASSED] drm_test_damage_iter_single_damage_src_moved
[09:36:01] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[09:36:01] [PASSED] drm_test_damage_iter_damage
[09:36:01] [PASSED] drm_test_damage_iter_damage_one_intersect
[09:36:01] [PASSED] drm_test_damage_iter_damage_one_outside
[09:36:01] [PASSED] drm_test_damage_iter_damage_src_moved
[09:36:01] [PASSED] drm_test_damage_iter_damage_not_visible
[09:36:01] ================ [PASSED] drm_damage_helper ================
[09:36:01] ==================== drm_dp_mst_helper  ====================
[09:36:01] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[09:36:01] [PASSED] Clock 154000 BPP 30 DSC disabled
[09:36:01] [PASSED] Clock 234000 BPP 30 DSC disabled
[09:36:01] [PASSED] Clock 297000 BPP 24 DSC disabled
[09:36:01] [PASSED] Clock 332880 BPP 24 DSC enabled
[09:36:01] [PASSED] Clock 324540 BPP 24 DSC enabled
[09:36:01] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[09:36:01] ============== drm_test_dp_mst_calc_pbn_div  ===============
[09:36:01] [PASSED] Link rate 2000000 lane count 4
[09:36:01] [PASSED] Link rate 2000000 lane count 2
[09:36:01] [PASSED] Link rate 2000000 lane count 1
[09:36:01] [PASSED] Link rate 1350000 lane count 4
[09:36:01] [PASSED] Link rate 1350000 lane count 2
[09:36:01] [PASSED] Link rate 1350000 lane count 1
[09:36:01] [PASSED] Link rate 1000000 lane count 4
[09:36:01] [PASSED] Link rate 1000000 lane count 2
[09:36:01] [PASSED] Link rate 1000000 lane count 1
[09:36:01] [PASSED] Link rate 810000 lane count 4
[09:36:01] [PASSED] Link rate 810000 lane count 2
[09:36:01] [PASSED] Link rate 810000 lane count 1
[09:36:01] [PASSED] Link rate 540000 lane count 4
[09:36:01] [PASSED] Link rate 540000 lane count 2
[09:36:01] [PASSED] Link rate 540000 lane count 1
[09:36:01] [PASSED] Link rate 270000 lane count 4
[09:36:01] [PASSED] Link rate 270000 lane count 2
[09:36:01] [PASSED] Link rate 270000 lane count 1
[09:36:01] [PASSED] Link rate 162000 lane count 4
[09:36:01] [PASSED] Link rate 162000 lane count 2
[09:36:01] [PASSED] Link rate 162000 lane count 1
[09:36:01] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[09:36:01] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[09:36:01] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[09:36:01] [PASSED] DP_POWER_UP_PHY with port number
[09:36:01] [PASSED] DP_POWER_DOWN_PHY with port number
[09:36:01] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[09:36:01] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[09:36:01] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[09:36:01] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[09:36:01] [PASSED] DP_QUERY_PAYLOAD with port number
[09:36:01] [PASSED] DP_QUERY_PAYLOAD with VCPI
[09:36:01] [PASSED] DP_REMOTE_DPCD_READ with port number
[09:36:01] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[09:36:01] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[09:36:01] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[09:36:01] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[09:36:01] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[09:36:01] [PASSED] DP_REMOTE_I2C_READ with port number
[09:36:01] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[09:36:01] [PASSED] DP_REMOTE_I2C_READ with transactions array
[09:36:01] [PASSED] DP_REMOTE_I2C_WRITE with port number
[09:36:01] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[09:36:01] [PASSED] DP_REMOTE_I2C_WRITE with data array
[09:36:01] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[09:36:01] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[09:36:01] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[09:36:01] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[09:36:01] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[09:36:01] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[09:36:01] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[09:36:01] ================ [PASSED] drm_dp_mst_helper ================
[09:36:01] ======================== drm_exec  =========================
[09:36:01] [PASSED] sanitycheck
[09:36:01] [PASSED] test_lock
[09:36:01] [PASSED] test_lock_unlock
[09:36:01] [PASSED] test_duplicates
[09:36:01] [PASSED] test_prepare
[09:36:01] [PASSED] test_prepare_array
[09:36:01] [PASSED] test_multiple_loops
[09:36:01] ==================== [PASSED] drm_exec =====================
[09:36:01] ================= drm_format_helper_test  ==================
[09:36:01] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[09:36:01] [PASSED] single_pixel_source_buffer
[09:36:01] [PASSED] single_pixel_clip_rectangle
[09:36:01] [PASSED] well_known_colors
[09:36:01] [PASSED] destination_pitch
[09:36:01] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[09:36:01] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[09:36:01] [PASSED] single_pixel_source_buffer
[09:36:01] [PASSED] single_pixel_clip_rectangle
[09:36:01] [PASSED] well_known_colors
[09:36:01] [PASSED] destination_pitch
[09:36:01] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[09:36:01] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[09:36:01] [PASSED] single_pixel_source_buffer
[09:36:01] [PASSED] single_pixel_clip_rectangle
[09:36:01] [PASSED] well_known_colors
[09:36:01] [PASSED] destination_pitch
[09:36:01] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[09:36:01] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[09:36:01] [PASSED] single_pixel_source_buffer
[09:36:01] [PASSED] single_pixel_clip_rectangle
[09:36:01] [PASSED] well_known_colors
[09:36:01] [PASSED] destination_pitch
[09:36:01] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[09:36:01] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[09:36:01] [PASSED] single_pixel_source_buffer
[09:36:01] [PASSED] single_pixel_clip_rectangle
[09:36:01] [PASSED] well_known_colors
[09:36:01] [PASSED] destination_pitch
[09:36:01] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[09:36:01] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[09:36:01] [PASSED] single_pixel_source_buffer
[09:36:01] [PASSED] single_pixel_clip_rectangle
[09:36:01] [PASSED] well_known_colors
[09:36:01] [PASSED] destination_pitch
[09:36:01] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[09:36:01] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[09:36:01] [PASSED] single_pixel_source_buffer
[09:36:01] [PASSED] single_pixel_clip_rectangle
[09:36:01] [PASSED] well_known_colors
[09:36:01] [PASSED] destination_pitch
[09:36:01] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[09:36:01] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[09:36:01] [PASSED] single_pixel_source_buffer
[09:36:01] [PASSED] single_pixel_clip_rectangle
[09:36:01] [PASSED] well_known_colors
[09:36:01] [PASSED] destination_pitch
[09:36:01] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[09:36:01] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[09:36:01] [PASSED] single_pixel_source_buffer
[09:36:01] [PASSED] single_pixel_clip_rectangle
[09:36:01] [PASSED] well_known_colors
[09:36:01] [PASSED] destination_pitch
[09:36:01] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[09:36:01] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[09:36:01] [PASSED] single_pixel_source_buffer
[09:36:01] [PASSED] single_pixel_clip_rectangle
[09:36:01] [PASSED] well_known_colors
[09:36:01] [PASSED] destination_pitch
[09:36:01] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[09:36:01] ============== drm_test_fb_xrgb8888_to_mono  ===============
[09:36:01] [PASSED] single_pixel_source_buffer
[09:36:01] [PASSED] single_pixel_clip_rectangle
[09:36:01] [PASSED] well_known_colors
[09:36:01] [PASSED] destination_pitch
[09:36:01] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[09:36:01] ==================== drm_test_fb_swab  =====================
[09:36:01] [PASSED] single_pixel_source_buffer
[09:36:01] [PASSED] single_pixel_clip_rectangle
[09:36:01] [PASSED] well_known_colors
[09:36:01] [PASSED] destination_pitch
[09:36:01] ================ [PASSED] drm_test_fb_swab =================
[09:36:01] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[09:36:01] [PASSED] single_pixel_source_buffer
[09:36:01] [PASSED] single_pixel_clip_rectangle
[09:36:01] [PASSED] well_known_colors
[09:36:01] [PASSED] destination_pitch
[09:36:01] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[09:36:01] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[09:36:01] [PASSED] single_pixel_source_buffer
[09:36:01] [PASSED] single_pixel_clip_rectangle
[09:36:01] [PASSED] well_known_colors
[09:36:01] [PASSED] destination_pitch
[09:36:01] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[09:36:01] ================= drm_test_fb_clip_offset  =================
[09:36:01] [PASSED] pass through
[09:36:01] [PASSED] horizontal offset
[09:36:01] [PASSED] vertical offset
[09:36:01] [PASSED] horizontal and vertical offset
[09:36:01] [PASSED] horizontal offset (custom pitch)
[09:36:01] [PASSED] vertical offset (custom pitch)
[09:36:01] [PASSED] horizontal and vertical offset (custom pitch)
[09:36:01] ============= [PASSED] drm_test_fb_clip_offset =============
[09:36:01] ============== drm_test_fb_build_fourcc_list  ==============
[09:36:01] [PASSED] no native formats
[09:36:01] [PASSED] XRGB8888 as native format
[09:36:01] [PASSED] remove duplicates
[09:36:01] [PASSED] convert alpha formats
[09:36:01] [PASSED] random formats
[09:36:01] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[09:36:01] =================== drm_test_fb_memcpy  ====================
[09:36:01] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[09:36:01] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[09:36:01] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[09:36:01] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[09:36:01] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[09:36:01] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[09:36:01] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[09:36:01] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[09:36:01] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[09:36:01] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[09:36:01] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[09:36:01] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[09:36:01] =============== [PASSED] drm_test_fb_memcpy ================
[09:36:01] ============= [PASSED] drm_format_helper_test ==============
[09:36:01] ======================= drm_format  ========================
[09:36:01] [PASSED] drm_test_format_block_width_invalid
[09:36:01] [PASSED] drm_test_format_block_width_one_plane
[09:36:01] [PASSED] drm_test_format_block_width_two_plane
[09:36:01] [PASSED] drm_test_format_block_width_three_plane
[09:36:01] [PASSED] drm_test_format_block_width_tiled
[09:36:01] [PASSED] drm_test_format_block_height_invalid
[09:36:01] [PASSED] drm_test_format_block_height_one_plane
[09:36:01] [PASSED] drm_test_format_block_height_two_plane
[09:36:01] [PASSED] drm_test_format_block_height_three_plane
[09:36:01] [PASSED] drm_test_format_block_height_tiled
[09:36:01] [PASSED] drm_test_format_min_pitch_invalid
[09:36:01] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[09:36:01] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[09:36:01] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[09:36:01] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[09:36:01] [PASSED] drm_test_format_min_pitch_two_plane
[09:36:01] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[09:36:01] [PASSED] drm_test_format_min_pitch_tiled
[09:36:01] =================== [PASSED] drm_format ====================
[09:36:01] ===================== drm_framebuffer  =====================
[09:36:01] =============== drm_test_framebuffer_create  ===============
[09:36:01] [PASSED] ABGR8888 normal sizes
[09:36:01] [PASSED] ABGR8888 max sizes
[09:36:01] [PASSED] ABGR8888 pitch greater than min required
[09:36:01] [PASSED] ABGR8888 pitch less than min required
[09:36:01] [PASSED] ABGR8888 Invalid width
[09:36:01] [PASSED] ABGR8888 Invalid buffer handle
[09:36:01] [PASSED] No pixel format
[09:36:01] [PASSED] ABGR8888 Width 0
[09:36:01] [PASSED] ABGR8888 Height 0
[09:36:01] [PASSED] ABGR8888 Out of bound height * pitch combination
[09:36:01] [PASSED] ABGR8888 Large buffer offset
[09:36:01] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[09:36:01] [PASSED] ABGR8888 Valid buffer modifier
[09:36:01] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[09:36:01] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[09:36:01] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[09:36:01] [PASSED] NV12 Normal sizes
[09:36:01] [PASSED] NV12 Max sizes
[09:36:01] [PASSED] NV12 Invalid pitch
[09:36:01] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[09:36:01] [PASSED] NV12 different  modifier per-plane
[09:36:01] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[09:36:01] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[09:36:01] [PASSED] NV12 Modifier for inexistent plane
[09:36:01] [PASSED] NV12 Handle for inexistent plane
[09:36:01] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[09:36:01] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[09:36:01] [PASSED] YVU420 Normal sizes
[09:36:01] [PASSED] YVU420 Max sizes
[09:36:01] [PASSED] YVU420 Invalid pitch
[09:36:01] [PASSED] YVU420 Different pitches
[09:36:01] [PASSED] YVU420 Different buffer offsets/pitches
[09:36:01] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[09:36:01] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[09:36:01] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[09:36:01] [PASSED] YVU420 Valid modifier
[09:36:01] [PASSED] YVU420 Different modifiers per plane
[09:36:01] [PASSED] YVU420 Modifier for inexistent plane
[09:36:01] [PASSED] X0L2 Normal sizes
[09:36:01] [PASSED] X0L2 Max sizes
[09:36:01] [PASSED] X0L2 Invalid pitch
[09:36:01] [PASSED] X0L2 Pitch greater than minimum required
[09:36:01] [PASSED] X0L2 Handle for inexistent plane
[09:36:01] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[09:36:01] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[09:36:01] [PASSED] X0L2 Valid modifier
[09:36:01] [PASSED] X0L2 Modifier for inexistent plane
[09:36:01] =========== [PASSED] drm_test_framebuffer_create ===========
[09:36:01] ================= [PASSED] drm_framebuffer =================
[09:36:01] ====================== drm_gem_shmem  ======================
[09:36:01] [PASSED] drm_gem_shmem_test_obj_create
[09:36:01] [PASSED] drm_gem_shmem_test_obj_create_private
[09:36:01] [PASSED] drm_gem_shmem_test_pin_pages
[09:36:01] [PASSED] drm_gem_shmem_test_vmap
[09:36:01] [PASSED] drm_gem_shmem_test_get_pages_sgt
[09:36:01] [PASSED] drm_gem_shmem_test_get_sg_table
[09:36:01] [PASSED] drm_gem_shmem_test_madvise
[09:36:01] [PASSED] drm_gem_shmem_test_purge
[09:36:01] ================== [PASSED] drm_gem_shmem ==================
[09:36:01] ==================== drm-test-managed  =====================
[09:36:01] [PASSED] drm_test_managed_run_action
[09:36:01] ================ [PASSED] drm-test-managed =================
[09:36:01] ========================= drm_mm  ==========================
[09:36:01] [PASSED] drm_test_mm_init
[09:36:01] [PASSED] drm_test_mm_debug
[09:36:01] [PASSED] drm_test_mm_align32
[09:36:01] [PASSED] drm_test_mm_align64
[09:36:01] [PASSED] drm_test_mm_lowest
[09:36:01] [PASSED] drm_test_mm_highest
[09:36:01] ===================== [PASSED] drm_mm ======================
[09:36:01] =================== drm_modes_analog_tv  ===================
[09:36:01] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[09:36:01] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[09:36:01] [PASSED] drm_test_modes_analog_tv_pal_576i
[09:36:01] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[09:36:01] =============== [PASSED] drm_modes_analog_tv ===============
[09:36:01] ==================== drm_plane_helper  =====================
[09:36:01] =============== drm_test_check_plane_state  ================
[09:36:01] [PASSED] clipping_simple
[09:36:01] [PASSED] clipping_rotate_reflect
[09:36:01] [PASSED] positioning_simple
[09:36:01] [PASSED] upscaling
[09:36:01] [PASSED] downscaling
[09:36:01] [PASSED] rounding1
[09:36:01] [PASSED] rounding2
[09:36:01] [PASSED] rounding3
[09:36:01] [PASSED] rounding4
[09:36:01] =========== [PASSED] drm_test_check_plane_state ============
[09:36:01] =========== drm_test_check_invalid_plane_state  ============
[09:36:01] [PASSED] positioning_invalid
[09:36:01] [PASSED] upscaling_invalid
[09:36:01] [PASSED] downscaling_invalid
[09:36:01] ======= [PASSED] drm_test_check_invalid_plane_state ========
[09:36:01] ================ [PASSED] drm_plane_helper =================
[09:36:01] ============ drm_connector_helper_tv_get_modes  ============
[09:36:01] ====== drm_test_connector_helper_tv_get_modes_check  =======
[09:36:01] [PASSED] None
[09:36:01] [PASSED] PAL
[09:36:01] [PASSED] NTSC
[09:36:01] [PASSED] Both, NTSC Default
[09:36:01] [PASSED] Both, PAL Default
[09:36:01] [PASSED] Both, NTSC Default, with PAL on command-line
[09:36:01] [PASSED] Both, PAL Default, with NTSC on command-line
[09:36:01] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[09:36:01] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[09:36:01] ======================== drm_rect  =========================
[09:36:01] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[09:36:01] [PASSED] drm_test_rect_clip_scaled_not_clipped
[09:36:01] [PASSED] drm_test_rect_clip_scaled_clipped
[09:36:01] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[09:36:01] ================= drm_test_rect_intersect  =================
[09:36:01] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[09:36:01] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
stty: 'standard input': Inappropriate ioctl for device
[09:36:01] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[09:36:01] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[09:36:01] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[09:36:01] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[09:36:01] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[09:36:01] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[09:36:01] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[09:36:01] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[09:36:01] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[09:36:01] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[09:36:01] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[09:36:01] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[09:36:01] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[09:36:01] ============= [PASSED] drm_test_rect_intersect =============
[09:36:01] ================ drm_test_rect_calc_hscale  ================
[09:36:01] [PASSED] normal use
[09:36:01] [PASSED] out of max range
[09:36:01] [PASSED] out of min range
[09:36:01] [PASSED] zero dst
[09:36:01] [PASSED] negative src
[09:36:01] [PASSED] negative dst
[09:36:01] ============ [PASSED] drm_test_rect_calc_hscale ============
[09:36:01] ================ drm_test_rect_calc_vscale  ================
[09:36:01] [PASSED] normal use
[09:36:01] [PASSED] out of max range
[09:36:01] [PASSED] out of min range
[09:36:01] [PASSED] zero dst
[09:36:01] [PASSED] negative src
[09:36:01] [PASSED] negative dst
[09:36:01] ============ [PASSED] drm_test_rect_calc_vscale ============
[09:36:01] ================== drm_test_rect_rotate  ===================
[09:36:01] [PASSED] reflect-x
[09:36:01] [PASSED] reflect-y
[09:36:01] [PASSED] rotate-0
[09:36:01] [PASSED] rotate-90
[09:36:01] [PASSED] rotate-180
[09:36:01] [PASSED] rotate-270
[09:36:01] ============== [PASSED] drm_test_rect_rotate ===============
[09:36:01] ================ drm_test_rect_rotate_inv  =================
[09:36:01] [PASSED] reflect-x
[09:36:01] [PASSED] reflect-y
[09:36:01] [PASSED] rotate-0
[09:36:01] [PASSED] rotate-90
[09:36:01] [PASSED] rotate-180
[09:36:01] [PASSED] rotate-270
[09:36:01] ============ [PASSED] drm_test_rect_rotate_inv =============
[09:36:01] ==================== [PASSED] drm_rect =====================
[09:36:01] ============================================================
[09:36:01] Testing complete. Ran 390 tests: passed: 390
[09:36:01] Elapsed time: 21.759s total, 1.664s configuring, 19.969s building, 0.124s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


