Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEBEC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 16:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A397B10E2B2;
	Wed,  3 Jan 2024 16:53:21 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F5C10E08E;
 Wed,  3 Jan 2024 16:53:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Check_skip=5Fguc=5Fp?=
 =?utf-8?q?c_before_setting_SLPC_flag_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Date: Wed, 03 Jan 2024 16:53:19 -0000
Message-ID: <170430079967.82.1535558241033376394@5338d5abeb45>
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

Series: drm/xe: Check skip_guc_pc before setting SLPC flag (rev2)
URL   : https://patchwork.freedesktop.org/series/128001/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[16:52:27] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:52:31] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[16:52:55] Starting KUnit Kernel (1/1)...
[16:52:55] ============================================================
[16:52:55] ========================= guc_dbm  =========================
[16:52:55] [PASSED] test_empty
[16:52:55] [PASSED] test_default
[16:52:55] ======================== test_size  ========================
[16:52:55] [PASSED] 4
[16:52:55] [PASSED] 8
[16:52:55] [PASSED] 32
[16:52:55] [PASSED] 256
[16:52:55] ==================== [PASSED] test_size ====================
[16:52:55] ======================= test_reuse  ========================
[16:52:55] [PASSED] 4
[16:52:55] [PASSED] 8
[16:52:55] [PASSED] 32
[16:52:55] [PASSED] 256
[16:52:55] =================== [PASSED] test_reuse ====================
[16:52:55] =================== test_range_overlap  ====================
[16:52:55] [PASSED] 4
[16:52:55] [PASSED] 8
[16:52:55] [PASSED] 32
[16:52:55] [PASSED] 256
[16:52:55] =============== [PASSED] test_range_overlap ================
[16:52:55] =================== test_range_compact  ====================
[16:52:55] [PASSED] 4
[16:52:55] [PASSED] 8
[16:52:55] [PASSED] 32
[16:52:55] [PASSED] 256
[16:52:55] =============== [PASSED] test_range_compact ================
[16:52:55] ==================== test_range_spare  =====================
[16:52:55] [PASSED] 4
[16:52:55] [PASSED] 8
[16:52:55] [PASSED] 32
[16:52:55] [PASSED] 256
[16:52:55] ================ [PASSED] test_range_spare =================
[16:52:55] ===================== [PASSED] guc_dbm =====================
[16:52:55] ========================== lmtt  ===========================
[16:52:55] ======================== test_ops  =========================
[16:52:55] [PASSED] 2-level
[16:52:55] [PASSED] multi-level
[16:52:55] ==================== [PASSED] test_ops =====================
[16:52:55] ====================== [PASSED] lmtt =======================
[16:52:55] ========================== xe_bo  ==========================
[16:52:55] [SKIPPED] xe_ccs_migrate_kunit
[16:52:55] [SKIPPED] xe_bo_evict_kunit
[16:52:55] ===================== [SKIPPED] xe_bo ======================
[16:52:55] ======================= xe_dma_buf  ========================
[16:52:55] [SKIPPED] xe_dma_buf_kunit
[16:52:55] =================== [SKIPPED] xe_dma_buf ===================
[16:52:55] ======================= xe_migrate  ========================
[16:52:55] [SKIPPED] xe_migrate_sanity_kunit
[16:52:55] =================== [SKIPPED] xe_migrate ===================
[16:52:55] ========================= xe_mocs  =========================
[16:52:55] [SKIPPED] xe_live_mocs_kernel_kunit
[16:52:55] ==================== [SKIPPED] xe_mocs =====================
[16:52:55] ========================= xe_pci  ==========================
[16:52:55] [PASSED] xe_gmdid_graphics_ip
[16:52:55] [PASSED] xe_gmdid_media_ip
[16:52:55] ===================== [PASSED] xe_pci ======================
[16:52:55] ========================= xe_rtp  ==========================
[16:52:55] ================== xe_rtp_process_tests  ===================
[16:52:55] [PASSED] coalesce-same-reg
[16:52:55] [PASSED] no-match-no-add
[16:52:55] [PASSED] no-match-no-add-multiple-rules
[16:52:55] [PASSED] two-regs-two-entries
[16:52:55] [PASSED] clr-one-set-other
[16:52:55] [PASSED] set-field
[16:52:55] [PASSED] conflict-duplicate
[16:52:55] [PASSED] conflict-not-disjoint
[16:52:55] [PASSED] conflict-reg-type
[16:52:55] ============== [PASSED] xe_rtp_process_tests ===============
[16:52:55] ===================== [PASSED] xe_rtp ======================
[16:52:55] ========================== xe_wa  ==========================
[16:52:55] ======================== xe_wa_gt  =========================
[16:52:55] [PASSED] TIGERLAKE (B0)
[16:52:55] [PASSED] DG1 (A0)
[16:52:55] [PASSED] DG1 (B0)
[16:52:55] [PASSED] ALDERLAKE_S (A0)
[16:52:55] [PASSED] ALDERLAKE_S (B0)
[16:52:55] [PASSED] ALDERLAKE_S (C0)
[16:52:55] [PASSED] ALDERLAKE_S (D0)
[16:52:55] [PASSED] ALDERLAKE_P (A0)
[16:52:55] [PASSED] ALDERLAKE_P (B0)
[16:52:55] [PASSED] ALDERLAKE_P (C0)
[16:52:55] [PASSED] ALDERLAKE_S_RPLS (D0)
[16:52:55] [PASSED] ALDERLAKE_P_RPLU (E0)
[16:52:55] [PASSED] DG2_G10 (A0)
[16:52:55] [PASSED] DG2_G10 (A1)
[16:52:55] [PASSED] DG2_G10 (B0)
[16:52:55] [PASSED] DG2_G10 (C0)
[16:52:55] [PASSED] DG2_G11 (A0)
[16:52:55] [PASSED] DG2_G11 (B0)
[16:52:55] [PASSED] DG2_G11 (B1)
[16:52:55] [PASSED] DG2_G12 (A0)
[16:52:55] [PASSED] DG2_G12 (A1)
[16:52:55] [PASSED] PVC (B0)
[16:52:55] [PASSED] PVC (B1)
[16:52:55] [PASSED] PVC (C0)
[16:52:55] [PASSED] METEORLAKE (g:A0, m:A0)
[16:52:55] [PASSED] METEORLAKE (g:A0, m:A0)
[16:52:55] [PASSED] LUNARLAKE (g:A0, m:A0)
[16:52:55] [PASSED] LUNARLAKE (g:B0, m:A0)
[16:52:55] ==================== [PASSED] xe_wa_gt =====================
[16:52:55] ====================== [PASSED] xe_wa ======================
[16:52:55] ============================================================
[16:52:55] Testing complete. Ran 68 tests: passed: 63, skipped: 5
[16:52:55] Elapsed time: 27.769s total, 4.196s configuring, 23.354s building, 0.177s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[16:52:55] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:52:57] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[16:53:17] Starting KUnit Kernel (1/1)...
[16:53:17] ============================================================
[16:53:17] ================== drm_test_pick_cmdline  ==================
[16:53:17] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[16:53:17] =============== drm_test_pick_cmdline_named  ===============
[16:53:17] [PASSED] NTSC
[16:53:17] [PASSED] NTSC-J
[16:53:17] [PASSED] PAL
[16:53:17] [PASSED] PAL-M
[16:53:17] =========== [PASSED] drm_test_pick_cmdline_named ===========
[16:53:17] ============== [PASSED] drm_test_pick_cmdline ==============
[16:53:17] ======================== drm_buddy  ========================
[16:53:17] [PASSED] drm_test_buddy_alloc_limit
[16:53:17] [PASSED] drm_test_buddy_alloc_optimistic
[16:53:17] [PASSED] drm_test_buddy_alloc_pessimistic
[16:53:17] [PASSED] drm_test_buddy_alloc_pathological
[16:53:17] ==================== [PASSED] drm_buddy ====================
[16:53:17] =================== drm_cmdline_parser  ====================
[16:53:17] [PASSED] drm_test_cmdline_force_d_only
[16:53:17] [PASSED] drm_test_cmdline_force_D_only_dvi
[16:53:17] [PASSED] drm_test_cmdline_force_D_only_hdmi
[16:53:17] [PASSED] drm_test_cmdline_force_D_only_not_digital
[16:53:17] [PASSED] drm_test_cmdline_force_e_only
[16:53:17] [PASSED] drm_test_cmdline_res
[16:53:17] [PASSED] drm_test_cmdline_res_vesa
[16:53:17] [PASSED] drm_test_cmdline_res_vesa_rblank
[16:53:17] [PASSED] drm_test_cmdline_res_rblank
[16:53:17] [PASSED] drm_test_cmdline_res_bpp
[16:53:17] [PASSED] drm_test_cmdline_res_refresh
[16:53:17] [PASSED] drm_test_cmdline_res_bpp_refresh
[16:53:17] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[16:53:17] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[16:53:17] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[16:53:17] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[16:53:17] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[16:53:17] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[16:53:17] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[16:53:17] [PASSED] drm_test_cmdline_res_margins_force_on
[16:53:17] [PASSED] drm_test_cmdline_res_vesa_margins
[16:53:17] [PASSED] drm_test_cmdline_name
[16:53:17] [PASSED] drm_test_cmdline_name_bpp
[16:53:17] [PASSED] drm_test_cmdline_name_option
[16:53:17] [PASSED] drm_test_cmdline_name_bpp_option
[16:53:17] [PASSED] drm_test_cmdline_rotate_0
[16:53:17] [PASSED] drm_test_cmdline_rotate_90
[16:53:17] [PASSED] drm_test_cmdline_rotate_180
[16:53:17] [PASSED] drm_test_cmdline_rotate_270
[16:53:17] [PASSED] drm_test_cmdline_hmirror
[16:53:17] [PASSED] drm_test_cmdline_vmirror
[16:53:17] [PASSED] drm_test_cmdline_margin_options
[16:53:17] [PASSED] drm_test_cmdline_multiple_options
[16:53:17] [PASSED] drm_test_cmdline_bpp_extra_and_option
[16:53:17] [PASSED] drm_test_cmdline_extra_and_option
[16:53:17] [PASSED] drm_test_cmdline_freestanding_options
[16:53:17] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[16:53:17] [PASSED] drm_test_cmdline_panel_orientation
[16:53:17] ================ drm_test_cmdline_invalid  =================
[16:53:17] [PASSED] margin_only
[16:53:17] [PASSED] interlace_only
[16:53:17] [PASSED] res_missing_x
[16:53:17] [PASSED] res_missing_y
[16:53:17] [PASSED] res_bad_y
[16:53:17] [PASSED] res_missing_y_bpp
[16:53:17] [PASSED] res_bad_bpp
[16:53:17] [PASSED] res_bad_refresh
[16:53:17] [PASSED] res_bpp_refresh_force_on_off
[16:53:17] [PASSED] res_invalid_mode
[16:53:17] [PASSED] res_bpp_wrong_place_mode
[16:53:17] [PASSED] name_bpp_refresh
[16:53:17] [PASSED] name_refresh
[16:53:17] [PASSED] name_refresh_wrong_mode
[16:53:17] [PASSED] name_refresh_invalid_mode
[16:53:17] [PASSED] rotate_multiple
[16:53:17] [PASSED] rotate_invalid_val
[16:53:17] [PASSED] rotate_truncated
[16:53:17] [PASSED] invalid_option
[16:53:17] [PASSED] invalid_tv_option
[16:53:17] [PASSED] truncated_tv_option
[16:53:17] ============ [PASSED] drm_test_cmdline_invalid =============
[16:53:17] =============== drm_test_cmdline_tv_options  ===============
[16:53:17] [PASSED] NTSC
[16:53:17] [PASSED] NTSC_443
[16:53:17] [PASSED] NTSC_J
[16:53:17] [PASSED] PAL
[16:53:17] [PASSED] PAL_M
[16:53:17] [PASSED] PAL_N
[16:53:17] [PASSED] SECAM
[16:53:17] =========== [PASSED] drm_test_cmdline_tv_options ===========
[16:53:17] =============== [PASSED] drm_cmdline_parser ================
[16:53:17] ================ drm_get_tv_mode_from_name  ================
[16:53:17] ========== drm_test_get_tv_mode_from_name_valid  ===========
[16:53:17] [PASSED] NTSC
[16:53:17] [PASSED] NTSC-443
[16:53:17] [PASSED] NTSC-J
[16:53:17] [PASSED] PAL
[16:53:17] [PASSED] PAL-M
[16:53:17] [PASSED] PAL-N
[16:53:17] [PASSED] SECAM
[16:53:17] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[16:53:17] [PASSED] drm_test_get_tv_mode_from_name_truncated
[16:53:17] ============ [PASSED] drm_get_tv_mode_from_name ============
[16:53:17] ==================== drm_damage_helper  ====================
[16:53:17] [PASSED] drm_test_damage_iter_no_damage
[16:53:17] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[16:53:17] [PASSED] drm_test_damage_iter_no_damage_src_moved
[16:53:17] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[16:53:17] [PASSED] drm_test_damage_iter_no_damage_not_visible
[16:53:17] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[16:53:17] [PASSED] drm_test_damage_iter_no_damage_no_fb
[16:53:17] [PASSED] drm_test_damage_iter_simple_damage
[16:53:17] [PASSED] drm_test_damage_iter_single_damage
[16:53:17] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[16:53:17] [PASSED] drm_test_damage_iter_single_damage_outside_src
[16:53:17] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[16:53:17] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[16:53:17] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[16:53:17] [PASSED] drm_test_damage_iter_single_damage_src_moved
[16:53:17] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[16:53:17] [PASSED] drm_test_damage_iter_damage
[16:53:17] [PASSED] drm_test_damage_iter_damage_one_intersect
[16:53:17] [PASSED] drm_test_damage_iter_damage_one_outside
[16:53:17] [PASSED] drm_test_damage_iter_damage_src_moved
[16:53:17] [PASSED] drm_test_damage_iter_damage_not_visible
[16:53:17] ================ [PASSED] drm_damage_helper ================
[16:53:17] ==================== drm_dp_mst_helper  ====================
[16:53:17] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[16:53:17] [PASSED] Clock 154000 BPP 30 DSC disabled
[16:53:17] [PASSED] Clock 234000 BPP 30 DSC disabled
[16:53:17] [PASSED] Clock 297000 BPP 24 DSC disabled
[16:53:17] [PASSED] Clock 332880 BPP 24 DSC enabled
[16:53:17] [PASSED] Clock 324540 BPP 24 DSC enabled
[16:53:17] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[16:53:17] ============== drm_test_dp_mst_calc_pbn_div  ===============
[16:53:17] [PASSED] Link rate 2000000 lane count 4
[16:53:17] [PASSED] Link rate 2000000 lane count 2
[16:53:17] [PASSED] Link rate 2000000 lane count 1
[16:53:17] [PASSED] Link rate 1350000 lane count 4
[16:53:17] [PASSED] Link rate 1350000 lane count 2
[16:53:17] [PASSED] Link rate 1350000 lane count 1
[16:53:17] [PASSED] Link rate 1000000 lane count 4
[16:53:17] [PASSED] Link rate 1000000 lane count 2
[16:53:17] [PASSED] Link rate 1000000 lane count 1
[16:53:17] [PASSED] Link rate 810000 lane count 4
[16:53:17] [PASSED] Link rate 810000 lane count 2
[16:53:17] [PASSED] Link rate 810000 lane count 1
[16:53:17] [PASSED] Link rate 540000 lane count 4
[16:53:17] [PASSED] Link rate 540000 lane count 2
[16:53:17] [PASSED] Link rate 540000 lane count 1
[16:53:17] [PASSED] Link rate 270000 lane count 4
[16:53:17] [PASSED] Link rate 270000 lane count 2
[16:53:17] [PASSED] Link rate 270000 lane count 1
[16:53:17] [PASSED] Link rate 162000 lane count 4
[16:53:17] [PASSED] Link rate 162000 lane count 2
[16:53:17] [PASSED] Link rate 162000 lane count 1
[16:53:17] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[16:53:17] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[16:53:17] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[16:53:17] [PASSED] DP_POWER_UP_PHY with port number
[16:53:17] [PASSED] DP_POWER_DOWN_PHY with port number
[16:53:17] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[16:53:17] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[16:53:17] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[16:53:17] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[16:53:17] [PASSED] DP_QUERY_PAYLOAD with port number
[16:53:17] [PASSED] DP_QUERY_PAYLOAD with VCPI
[16:53:17] [PASSED] DP_REMOTE_DPCD_READ with port number
[16:53:17] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[16:53:17] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[16:53:17] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[16:53:17] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[16:53:17] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[16:53:17] [PASSED] DP_REMOTE_I2C_READ with port number
[16:53:17] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[16:53:17] [PASSED] DP_REMOTE_I2C_READ with transactions array
[16:53:17] [PASSED] DP_REMOTE_I2C_WRITE with port number
[16:53:17] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[16:53:17] [PASSED] DP_REMOTE_I2C_WRITE with data array
[16:53:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[16:53:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[16:53:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[16:53:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[16:53:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[16:53:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[16:53:17] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[16:53:17] ================ [PASSED] drm_dp_mst_helper ================
[16:53:17] ======================== drm_exec  =========================
[16:53:17] [PASSED] sanitycheck
[16:53:17] [PASSED] test_lock
[16:53:17] [PASSED] test_lock_unlock
[16:53:17] [PASSED] test_duplicates
[16:53:17] [PASSED] test_prepare
[16:53:17] [PASSED] test_prepare_array
[16:53:17] [PASSED] test_multiple_loops
[16:53:17] ==================== [PASSED] drm_exec =====================
[16:53:17] ================= drm_format_helper_test  ==================
[16:53:17] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[16:53:17] [PASSED] single_pixel_source_buffer
[16:53:17] [PASSED] single_pixel_clip_rectangle
[16:53:17] [PASSED] well_known_colors
[16:53:17] [PASSED] destination_pitch
[16:53:17] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[16:53:17] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[16:53:17] [PASSED] single_pixel_source_buffer
[16:53:17] [PASSED] single_pixel_clip_rectangle
[16:53:17] [PASSED] well_known_colors
[16:53:17] [PASSED] destination_pitch
[16:53:17] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[16:53:17] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[16:53:17] [PASSED] single_pixel_source_buffer
[16:53:17] [PASSED] single_pixel_clip_rectangle
[16:53:17] [PASSED] well_known_colors
[16:53:17] [PASSED] destination_pitch
[16:53:17] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[16:53:17] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[16:53:17] [PASSED] single_pixel_source_buffer
[16:53:17] [PASSED] single_pixel_clip_rectangle
[16:53:17] [PASSED] well_known_colors
[16:53:17] [PASSED] destination_pitch
[16:53:17] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[16:53:17] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[16:53:17] [PASSED] single_pixel_source_buffer
[16:53:17] [PASSED] single_pixel_clip_rectangle
[16:53:17] [PASSED] well_known_colors
[16:53:17] [PASSED] destination_pitch
[16:53:17] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[16:53:17] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[16:53:17] [PASSED] single_pixel_source_buffer
[16:53:17] [PASSED] single_pixel_clip_rectangle
[16:53:17] [PASSED] well_known_colors
[16:53:17] [PASSED] destination_pitch
[16:53:17] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[16:53:17] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[16:53:17] [PASSED] single_pixel_source_buffer
[16:53:17] [PASSED] single_pixel_clip_rectangle
[16:53:17] [PASSED] well_known_colors
[16:53:17] [PASSED] destination_pitch
[16:53:17] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[16:53:17] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[16:53:17] [PASSED] single_pixel_source_buffer
[16:53:17] [PASSED] single_pixel_clip_rectangle
[16:53:17] [PASSED] well_known_colors
[16:53:17] [PASSED] destination_pitch
[16:53:17] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[16:53:17] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[16:53:17] [PASSED] single_pixel_source_buffer
[16:53:17] [PASSED] single_pixel_clip_rectangle
[16:53:17] [PASSED] well_known_colors
[16:53:17] [PASSED] destination_pitch
[16:53:17] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[16:53:17] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[16:53:17] [PASSED] single_pixel_source_buffer
[16:53:17] [PASSED] single_pixel_clip_rectangle
[16:53:17] [PASSED] well_known_colors
[16:53:17] [PASSED] destination_pitch
[16:53:17] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[16:53:17] ============== drm_test_fb_xrgb8888_to_mono  ===============
[16:53:17] [PASSED] single_pixel_source_buffer
[16:53:17] [PASSED] single_pixel_clip_rectangle
[16:53:17] [PASSED] well_known_colors
[16:53:17] [PASSED] destination_pitch
[16:53:17] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[16:53:17] ==================== drm_test_fb_swab  =====================
[16:53:17] [PASSED] single_pixel_source_buffer
[16:53:17] [PASSED] single_pixel_clip_rectangle
[16:53:17] [PASSED] well_known_colors
[16:53:17] [PASSED] destination_pitch
[16:53:17] ================ [PASSED] drm_test_fb_swab =================
[16:53:17] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[16:53:17] [PASSED] single_pixel_source_buffer
[16:53:17] [PASSED] single_pixel_clip_rectangle
[16:53:17] [PASSED] well_known_colors
[16:53:17] [PASSED] destination_pitch
[16:53:17] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[16:53:17] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[16:53:17] [PASSED] single_pixel_source_buffer
[16:53:17] [PASSED] single_pixel_clip_rectangle
[16:53:17] [PASSED] well_known_colors
[16:53:17] [PASSED] destination_pitch
[16:53:17] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[16:53:17] ================= drm_test_fb_clip_offset  =================
[16:53:17] [PASSED] pass through
[16:53:17] [PASSED] horizontal offset
[16:53:17] [PASSED] vertical offset
[16:53:17] [PASSED] horizontal and vertical offset
[16:53:17] [PASSED] horizontal offset (custom pitch)
[16:53:17] [PASSED] vertical offset (custom pitch)
[16:53:17] [PASSED] horizontal and vertical offset (custom pitch)
[16:53:17] ============= [PASSED] drm_test_fb_clip_offset =============
[16:53:17] ============== drm_test_fb_build_fourcc_list  ==============
[16:53:17] [PASSED] no native formats
[16:53:17] [PASSED] XRGB8888 as native format
[16:53:17] [PASSED] remove duplicates
[16:53:17] [PASSED] convert alpha formats
[16:53:17] [PASSED] random formats
[16:53:17] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[16:53:17] =================== drm_test_fb_memcpy  ====================
[16:53:17] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[16:53:17] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[16:53:17] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[16:53:17] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[16:53:17] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[16:53:17] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[16:53:17] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[16:53:17] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[16:53:17] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[16:53:17] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[16:53:17] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[16:53:17] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[16:53:17] =============== [PASSED] drm_test_fb_memcpy ================
[16:53:17] ============= [PASSED] drm_format_helper_test ==============
[16:53:17] ======================= drm_format  ========================
[16:53:17] [PASSED] drm_test_format_block_width_invalid
[16:53:17] [PASSED] drm_test_format_block_width_one_plane
[16:53:17] [PASSED] drm_test_format_block_width_two_plane
[16:53:17] [PASSED] drm_test_format_block_width_three_plane
[16:53:17] [PASSED] drm_test_format_block_width_tiled
[16:53:17] [PASSED] drm_test_format_block_height_invalid
[16:53:17] [PASSED] drm_test_format_block_height_one_plane
[16:53:17] [PASSED] drm_test_format_block_height_two_plane
[16:53:17] [PASSED] drm_test_format_block_height_three_plane
[16:53:17] [PASSED] drm_test_format_block_height_tiled
[16:53:17] [PASSED] drm_test_format_min_pitch_invalid
[16:53:17] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[16:53:17] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[16:53:17] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[16:53:17] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[16:53:17] [PASSED] drm_test_format_min_pitch_two_plane
[16:53:17] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[16:53:17] [PASSED] drm_test_format_min_pitch_tiled
[16:53:17] =================== [PASSED] drm_format ====================
[16:53:17] ===================== drm_framebuffer  =====================
[16:53:17] =============== drm_test_framebuffer_create  ===============
[16:53:17] [PASSED] ABGR8888 normal sizes
[16:53:17] [PASSED] ABGR8888 max sizes
[16:53:17] [PASSED] ABGR8888 pitch greater than min required
[16:53:17] [PASSED] ABGR8888 pitch less than min required
[16:53:17] [PASSED] ABGR8888 Invalid width
[16:53:17] [PASSED] ABGR8888 Invalid buffer handle
[16:53:17] [PASSED] No pixel format
[16:53:17] [PASSED] ABGR8888 Width 0
[16:53:17] [PASSED] ABGR8888 Height 0
[16:53:17] [PASSED] ABGR8888 Out of bound height * pitch combination
[16:53:17] [PASSED] ABGR8888 Large buffer offset
[16:53:17] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[16:53:17] [PASSED] ABGR8888 Valid buffer modifier
[16:53:17] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[16:53:17] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[16:53:17] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[16:53:17] [PASSED] NV12 Normal sizes
[16:53:17] [PASSED] NV12 Max sizes
[16:53:17] [PASSED] NV12 Invalid pitch
[16:53:17] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[16:53:17] [PASSED] NV12 different  modifier per-plane
[16:53:17] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[16:53:17] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[16:53:17] [PASSED] NV12 Modifier for inexistent plane
[16:53:17] [PASSED] NV12 Handle for inexistent plane
[16:53:17] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[16:53:17] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[16:53:17] [PASSED] YVU420 Normal sizes
[16:53:17] [PASSED] YVU420 Max sizes
[16:53:17] [PASSED] YVU420 Invalid pitch
[16:53:17] [PASSED] YVU420 Different pitches
[16:53:17] [PASSED] YVU420 Different buffer offsets/pitches
[16:53:17] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[16:53:17] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[16:53:17] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[16:53:17] [PASSED] YVU420 Valid modifier
[16:53:17] [PASSED] YVU420 Different modifiers per plane
[16:53:17] [PASSED] YVU420 Modifier for inexistent plane
[16:53:17] [PASSED] X0L2 Normal sizes
[16:53:17] [PASSED] X0L2 Max sizes
[16:53:17] [PASSED] X0L2 Invalid pitch
[16:53:17] [PASSED] X0L2 Pitch greater than minimum required
[16:53:17] [PASSED] X0L2 Handle for inexistent plane
[16:53:17] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[16:53:17] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[16:53:17] [PASSED] X0L2 Valid modifier
[16:53:17] [PASSED] X0L2 Modifier for inexistent plane
[16:53:17] =========== [PASSED] drm_test_framebuffer_create ===========
[16:53:17] ================= [PASSED] drm_framebuffer =================
[16:53:17] ====================== drm_gem_shmem  ======================
[16:53:17] [PASSED] drm_gem_shmem_test_obj_create
[16:53:17] [PASSED] drm_gem_shmem_test_obj_create_private
[16:53:17] [PASSED] drm_gem_shmem_test_pin_pages
[16:53:17] [PASSED] drm_gem_shmem_test_vmap
[16:53:17] [PASSED] drm_gem_shmem_test_get_pages_sgt
[16:53:17] [PASSED] drm_gem_shmem_test_get_sg_table
[16:53:17] [PASSED] drm_gem_shmem_test_madvise
[16:53:17] [PASSED] drm_gem_shmem_test_purge
[16:53:17] ================== [PASSED] drm_gem_shmem ==================
[16:53:17] ==================== drm-test-managed  =====================
[16:53:17] [PASSED] drm_test_managed_run_action
[16:53:17] ================ [PASSED] drm-test-managed =================
[16:53:17] ========================= drm_mm  ==========================
[16:53:17] [PASSED] drm_test_mm_init
[16:53:17] [PASSED] drm_test_mm_debug
[16:53:17] [PASSED] drm_test_mm_align32
[16:53:17] [PASSED] drm_test_mm_align64
[16:53:17] [PASSED] drm_test_mm_lowest
[16:53:17] [PASSED] drm_test_mm_highest
[16:53:17] ===================== [PASSED] drm_mm ======================
[16:53:17] =================== drm_modes_analog_tv  ===================
[16:53:17] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[16:53:17] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[16:53:17] [PASSED] drm_test_modes_analog_tv_pal_576i
[16:53:17] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[16:53:17] =============== [PASSED] drm_modes_analog_tv ===============
[16:53:17] ==================== drm_plane_helper  =====================
[16:53:17] =============== drm_test_check_plane_state  ================
[16:53:17] [PASSED] clipping_simple
[16:53:17] [PASSED] clipping_rotate_reflect
[16:53:17] [PASSED] positioning_simple
[16:53:17] [PASSED] upscaling
[16:53:17] [PASSED] downscaling
[16:53:17] [PASSED] rounding1
[16:53:17] [PASSED] rounding2
[16:53:17] [PASSED] rounding3
[16:53:17] [PASSED] rounding4
[16:53:17] =========== [PASSED] drm_test_check_plane_state ============
[16:53:17] =========== drm_test_check_invalid_plane_state  ============
[16:53:17] [PASSED] positioning_invalid
[16:53:17] [PASSED] upscaling_invalid
[16:53:17] [PASSED] downscaling_invalid
[16:53:17] ======= [PASSED] drm_test_check_invalid_plane_state ========
[16:53:17] ================ [PASSED] drm_plane_helper =================
[16:53:17] ============ drm_connector_helper_tv_get_modes  ============
[16:53:17] ====== drm_test_connector_helper_tv_get_modes_check  =======
[16:53:17] [PASSED] None
[16:53:17] [PASSED] PAL
[16:53:17] [PASSED] NTSC
[16:53:17] [PASSED] Both, NTSC Default
[16:53:17] [PASSED] Both, PAL Default
[16:53:17] [PASSED] Both, NTSC Default, with PAL on command-line
[16:53:17] [PASSED] Both, PAL Default, with NTSC on command-line
[16:53:17] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[16:53:17] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[16:53:17] ======================== drm_rect  =========================
[16:53:17] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[16:53:17] [PASSED] drm_test_rect_clip_scaled_not_clipped
[16:53:17] [PASSED] drm_test_rect_clip_scaled_clipped
[16:53:17] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[16:53:17] ================= drm_test_rect_intersect  =================
[16:53:17] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[16:53:17] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
stty: 'standard input': Inappropriate ioctl for device
[16:53:17] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[16:53:17] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[16:53:17] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[16:53:17] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[16:53:17] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[16:53:17] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[16:53:17] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[16:53:17] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[16:53:17] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[16:53:17] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[16:53:17] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[16:53:17] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[16:53:17] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[16:53:17] ============= [PASSED] drm_test_rect_intersect =============
[16:53:17] ================ drm_test_rect_calc_hscale  ================
[16:53:17] [PASSED] normal use
[16:53:17] [PASSED] out of max range
[16:53:17] [PASSED] out of min range
[16:53:17] [PASSED] zero dst
[16:53:17] [PASSED] negative src
[16:53:17] [PASSED] negative dst
[16:53:17] ============ [PASSED] drm_test_rect_calc_hscale ============
[16:53:17] ================ drm_test_rect_calc_vscale  ================
[16:53:17] [PASSED] normal use
[16:53:17] [PASSED] out of max range
[16:53:17] [PASSED] out of min range
[16:53:17] [PASSED] zero dst
[16:53:17] [PASSED] negative src
[16:53:17] [PASSED] negative dst
[16:53:17] ============ [PASSED] drm_test_rect_calc_vscale ============
[16:53:17] ================== drm_test_rect_rotate  ===================
[16:53:17] [PASSED] reflect-x
[16:53:17] [PASSED] reflect-y
[16:53:17] [PASSED] rotate-0
[16:53:17] [PASSED] rotate-90
[16:53:17] [PASSED] rotate-180
[16:53:17] [PASSED] rotate-270
[16:53:17] ============== [PASSED] drm_test_rect_rotate ===============
[16:53:17] ================ drm_test_rect_rotate_inv  =================
[16:53:17] [PASSED] reflect-x
[16:53:17] [PASSED] reflect-y
[16:53:17] [PASSED] rotate-0
[16:53:17] [PASSED] rotate-90
[16:53:17] [PASSED] rotate-180
[16:53:17] [PASSED] rotate-270
[16:53:17] ============ [PASSED] drm_test_rect_rotate_inv =============
[16:53:17] ==================== [PASSED] drm_rect =====================
[16:53:17] ============================================================
[16:53:17] Testing complete. Ran 390 tests: passed: 390
[16:53:17] Elapsed time: 21.711s total, 1.657s configuring, 19.885s building, 0.163s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


