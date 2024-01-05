Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D347DC3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 10:00:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B7E10E5BD;
	Fri,  5 Jan 2024 10:00:23 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A2E10E5BD;
 Fri,  5 Jan 2024 10:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Add_mocs_reset_kunit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: janga.rahul.kumar@intel.com
Date: Fri, 05 Jan 2024 10:00:22 -0000
Message-ID: <170444882252.20654.708081580786037489@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20231222192352.927101-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20231222192352.927101-1-janga.rahul.kumar@intel.com>
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

Series: drm/xe: Add mocs reset kunit
URL   : https://patchwork.freedesktop.org/series/128000/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[09:59:31] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:59:35] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[09:59:58] Starting KUnit Kernel (1/1)...
[09:59:58] ============================================================
[09:59:58] ========================= guc_dbm  =========================
[09:59:58] [PASSED] test_empty
[09:59:58] [PASSED] test_default
[09:59:58] ======================== test_size  ========================
[09:59:58] [PASSED] 4
[09:59:58] [PASSED] 8
[09:59:58] [PASSED] 32
[09:59:58] [PASSED] 256
[09:59:58] ==================== [PASSED] test_size ====================
[09:59:58] ======================= test_reuse  ========================
[09:59:58] [PASSED] 4
[09:59:58] [PASSED] 8
[09:59:58] [PASSED] 32
[09:59:58] [PASSED] 256
[09:59:58] =================== [PASSED] test_reuse ====================
[09:59:58] =================== test_range_overlap  ====================
[09:59:58] [PASSED] 4
[09:59:58] [PASSED] 8
[09:59:58] [PASSED] 32
[09:59:58] [PASSED] 256
[09:59:58] =============== [PASSED] test_range_overlap ================
[09:59:58] =================== test_range_compact  ====================
[09:59:58] [PASSED] 4
[09:59:58] [PASSED] 8
[09:59:58] [PASSED] 32
[09:59:58] [PASSED] 256
[09:59:58] =============== [PASSED] test_range_compact ================
[09:59:58] ==================== test_range_spare  =====================
[09:59:58] [PASSED] 4
[09:59:58] [PASSED] 8
[09:59:58] [PASSED] 32
[09:59:58] [PASSED] 256
[09:59:58] ================ [PASSED] test_range_spare =================
[09:59:58] ===================== [PASSED] guc_dbm =====================
[09:59:58] ========================== lmtt  ===========================
[09:59:58] ======================== test_ops  =========================
[09:59:58] [PASSED] 2-level
[09:59:58] [PASSED] multi-level
[09:59:58] ==================== [PASSED] test_ops =====================
[09:59:58] ====================== [PASSED] lmtt =======================
[09:59:58] ========================== xe_bo  ==========================
[09:59:58] [SKIPPED] xe_ccs_migrate_kunit
[09:59:58] [SKIPPED] xe_bo_evict_kunit
[09:59:58] ===================== [SKIPPED] xe_bo ======================
[09:59:58] ======================= xe_dma_buf  ========================
[09:59:58] [SKIPPED] xe_dma_buf_kunit
[09:59:58] =================== [SKIPPED] xe_dma_buf ===================
[09:59:58] ======================= xe_migrate  ========================
[09:59:58] [SKIPPED] xe_migrate_sanity_kunit
[09:59:58] =================== [SKIPPED] xe_migrate ===================
[09:59:58] ========================= xe_mocs  =========================
[09:59:58] [SKIPPED] xe_live_mocs_kernel_kunit
[09:59:58] [SKIPPED] xe_live_mocs_reset_kunit
[09:59:58] ==================== [SKIPPED] xe_mocs =====================
[09:59:58] ========================= xe_pci  ==========================
[09:59:58] [PASSED] xe_gmdid_graphics_ip
[09:59:58] [PASSED] xe_gmdid_media_ip
[09:59:58] ===================== [PASSED] xe_pci ======================
[09:59:58] ========================= xe_rtp  ==========================
[09:59:58] ================== xe_rtp_process_tests  ===================
[09:59:58] [PASSED] coalesce-same-reg
[09:59:58] [PASSED] no-match-no-add
[09:59:58] [PASSED] no-match-no-add-multiple-rules
[09:59:58] [PASSED] two-regs-two-entries
[09:59:58] [PASSED] clr-one-set-other
[09:59:58] [PASSED] set-field
[09:59:58] [PASSED] conflict-duplicate
[09:59:58] [PASSED] conflict-not-disjoint
[09:59:58] [PASSED] conflict-reg-type
[09:59:58] ============== [PASSED] xe_rtp_process_tests ===============
[09:59:58] ===================== [PASSED] xe_rtp ======================
[09:59:58] ========================== xe_wa  ==========================
[09:59:58] ======================== xe_wa_gt  =========================
[09:59:58] [PASSED] TIGERLAKE (B0)
[09:59:58] [PASSED] DG1 (A0)
[09:59:58] [PASSED] DG1 (B0)
[09:59:58] [PASSED] ALDERLAKE_S (A0)
[09:59:58] [PASSED] ALDERLAKE_S (B0)
[09:59:58] [PASSED] ALDERLAKE_S (C0)
[09:59:58] [PASSED] ALDERLAKE_S (D0)
[09:59:58] [PASSED] ALDERLAKE_P (A0)
[09:59:58] [PASSED] ALDERLAKE_P (B0)
[09:59:58] [PASSED] ALDERLAKE_P (C0)
[09:59:58] [PASSED] ALDERLAKE_S_RPLS (D0)
[09:59:58] [PASSED] ALDERLAKE_P_RPLU (E0)
[09:59:58] [PASSED] DG2_G10 (A0)
[09:59:58] [PASSED] DG2_G10 (A1)
[09:59:58] [PASSED] DG2_G10 (B0)
[09:59:58] [PASSED] DG2_G10 (C0)
[09:59:58] [PASSED] DG2_G11 (A0)
[09:59:58] [PASSED] DG2_G11 (B0)
[09:59:58] [PASSED] DG2_G11 (B1)
[09:59:58] [PASSED] DG2_G12 (A0)
[09:59:58] [PASSED] DG2_G12 (A1)
[09:59:58] [PASSED] PVC (B0)
[09:59:58] [PASSED] PVC (B1)
[09:59:58] [PASSED] PVC (C0)
[09:59:58] [PASSED] METEORLAKE (g:A0, m:A0)
[09:59:58] [PASSED] METEORLAKE (g:A0, m:A0)
[09:59:58] [PASSED] LUNARLAKE (g:A0, m:A0)
[09:59:58] [PASSED] LUNARLAKE (g:B0, m:A0)
[09:59:58] ==================== [PASSED] xe_wa_gt =====================
[09:59:58] ====================== [PASSED] xe_wa ======================
[09:59:58] ============================================================
[09:59:58] Testing complete. Ran 69 tests: passed: 63, skipped: 6
[09:59:58] Elapsed time: 27.237s total, 4.197s configuring, 22.821s building, 0.176s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[09:59:58] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:00:00] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[10:00:19] Starting KUnit Kernel (1/1)...
[10:00:19] ============================================================
[10:00:19] ================== drm_test_pick_cmdline  ==================
[10:00:19] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[10:00:19] =============== drm_test_pick_cmdline_named  ===============
[10:00:19] [PASSED] NTSC
[10:00:19] [PASSED] NTSC-J
[10:00:19] [PASSED] PAL
[10:00:19] [PASSED] PAL-M
[10:00:19] =========== [PASSED] drm_test_pick_cmdline_named ===========
[10:00:19] ============== [PASSED] drm_test_pick_cmdline ==============
[10:00:19] ======================== drm_buddy  ========================
[10:00:19] [PASSED] drm_test_buddy_alloc_limit
[10:00:19] [PASSED] drm_test_buddy_alloc_optimistic
[10:00:19] [PASSED] drm_test_buddy_alloc_pessimistic
[10:00:19] [PASSED] drm_test_buddy_alloc_pathological
[10:00:19] ==================== [PASSED] drm_buddy ====================
[10:00:19] =================== drm_cmdline_parser  ====================
[10:00:19] [PASSED] drm_test_cmdline_force_d_only
[10:00:19] [PASSED] drm_test_cmdline_force_D_only_dvi
[10:00:19] [PASSED] drm_test_cmdline_force_D_only_hdmi
[10:00:19] [PASSED] drm_test_cmdline_force_D_only_not_digital
[10:00:19] [PASSED] drm_test_cmdline_force_e_only
[10:00:19] [PASSED] drm_test_cmdline_res
[10:00:19] [PASSED] drm_test_cmdline_res_vesa
[10:00:19] [PASSED] drm_test_cmdline_res_vesa_rblank
[10:00:19] [PASSED] drm_test_cmdline_res_rblank
[10:00:19] [PASSED] drm_test_cmdline_res_bpp
[10:00:19] [PASSED] drm_test_cmdline_res_refresh
[10:00:19] [PASSED] drm_test_cmdline_res_bpp_refresh
[10:00:19] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[10:00:19] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[10:00:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[10:00:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[10:00:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[10:00:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[10:00:19] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[10:00:19] [PASSED] drm_test_cmdline_res_margins_force_on
[10:00:19] [PASSED] drm_test_cmdline_res_vesa_margins
[10:00:19] [PASSED] drm_test_cmdline_name
[10:00:19] [PASSED] drm_test_cmdline_name_bpp
[10:00:19] [PASSED] drm_test_cmdline_name_option
[10:00:19] [PASSED] drm_test_cmdline_name_bpp_option
[10:00:19] [PASSED] drm_test_cmdline_rotate_0
[10:00:19] [PASSED] drm_test_cmdline_rotate_90
[10:00:19] [PASSED] drm_test_cmdline_rotate_180
[10:00:19] [PASSED] drm_test_cmdline_rotate_270
[10:00:19] [PASSED] drm_test_cmdline_hmirror
[10:00:19] [PASSED] drm_test_cmdline_vmirror
[10:00:19] [PASSED] drm_test_cmdline_margin_options
[10:00:19] [PASSED] drm_test_cmdline_multiple_options
[10:00:19] [PASSED] drm_test_cmdline_bpp_extra_and_option
[10:00:19] [PASSED] drm_test_cmdline_extra_and_option
[10:00:19] [PASSED] drm_test_cmdline_freestanding_options
[10:00:19] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[10:00:19] [PASSED] drm_test_cmdline_panel_orientation
[10:00:19] ================ drm_test_cmdline_invalid  =================
[10:00:19] [PASSED] margin_only
[10:00:19] [PASSED] interlace_only
[10:00:19] [PASSED] res_missing_x
[10:00:19] [PASSED] res_missing_y
[10:00:19] [PASSED] res_bad_y
[10:00:19] [PASSED] res_missing_y_bpp
[10:00:19] [PASSED] res_bad_bpp
[10:00:19] [PASSED] res_bad_refresh
[10:00:19] [PASSED] res_bpp_refresh_force_on_off
[10:00:19] [PASSED] res_invalid_mode
[10:00:19] [PASSED] res_bpp_wrong_place_mode
[10:00:19] [PASSED] name_bpp_refresh
[10:00:19] [PASSED] name_refresh
[10:00:19] [PASSED] name_refresh_wrong_mode
[10:00:19] [PASSED] name_refresh_invalid_mode
[10:00:19] [PASSED] rotate_multiple
[10:00:19] [PASSED] rotate_invalid_val
[10:00:19] [PASSED] rotate_truncated
[10:00:19] [PASSED] invalid_option
[10:00:19] [PASSED] invalid_tv_option
[10:00:19] [PASSED] truncated_tv_option
[10:00:19] ============ [PASSED] drm_test_cmdline_invalid =============
[10:00:19] =============== drm_test_cmdline_tv_options  ===============
[10:00:19] [PASSED] NTSC
[10:00:19] [PASSED] NTSC_443
[10:00:19] [PASSED] NTSC_J
[10:00:19] [PASSED] PAL
[10:00:19] [PASSED] PAL_M
[10:00:19] [PASSED] PAL_N
[10:00:19] [PASSED] SECAM
[10:00:19] =========== [PASSED] drm_test_cmdline_tv_options ===========
[10:00:19] =============== [PASSED] drm_cmdline_parser ================
[10:00:19] ================ drm_get_tv_mode_from_name  ================
[10:00:19] ========== drm_test_get_tv_mode_from_name_valid  ===========
[10:00:19] [PASSED] NTSC
[10:00:19] [PASSED] NTSC-443
[10:00:19] [PASSED] NTSC-J
[10:00:19] [PASSED] PAL
[10:00:19] [PASSED] PAL-M
[10:00:19] [PASSED] PAL-N
[10:00:19] [PASSED] SECAM
[10:00:19] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[10:00:19] [PASSED] drm_test_get_tv_mode_from_name_truncated
[10:00:19] ============ [PASSED] drm_get_tv_mode_from_name ============
[10:00:19] ==================== drm_damage_helper  ====================
[10:00:19] [PASSED] drm_test_damage_iter_no_damage
[10:00:19] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[10:00:19] [PASSED] drm_test_damage_iter_no_damage_src_moved
[10:00:19] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[10:00:19] [PASSED] drm_test_damage_iter_no_damage_not_visible
[10:00:19] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[10:00:19] [PASSED] drm_test_damage_iter_no_damage_no_fb
[10:00:19] [PASSED] drm_test_damage_iter_simple_damage
[10:00:19] [PASSED] drm_test_damage_iter_single_damage
[10:00:19] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[10:00:19] [PASSED] drm_test_damage_iter_single_damage_outside_src
[10:00:19] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[10:00:19] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[10:00:19] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[10:00:19] [PASSED] drm_test_damage_iter_single_damage_src_moved
[10:00:19] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[10:00:19] [PASSED] drm_test_damage_iter_damage
[10:00:19] [PASSED] drm_test_damage_iter_damage_one_intersect
[10:00:19] [PASSED] drm_test_damage_iter_damage_one_outside
[10:00:19] [PASSED] drm_test_damage_iter_damage_src_moved
[10:00:19] [PASSED] drm_test_damage_iter_damage_not_visible
[10:00:19] ================ [PASSED] drm_damage_helper ================
[10:00:19] ==================== drm_dp_mst_helper  ====================
[10:00:19] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[10:00:19] [PASSED] Clock 154000 BPP 30 DSC disabled
[10:00:19] [PASSED] Clock 234000 BPP 30 DSC disabled
[10:00:19] [PASSED] Clock 297000 BPP 24 DSC disabled
[10:00:19] [PASSED] Clock 332880 BPP 24 DSC enabled
[10:00:19] [PASSED] Clock 324540 BPP 24 DSC enabled
[10:00:19] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[10:00:19] ============== drm_test_dp_mst_calc_pbn_div  ===============
[10:00:19] [PASSED] Link rate 2000000 lane count 4
[10:00:19] [PASSED] Link rate 2000000 lane count 2
[10:00:19] [PASSED] Link rate 2000000 lane count 1
[10:00:19] [PASSED] Link rate 1350000 lane count 4
[10:00:19] [PASSED] Link rate 1350000 lane count 2
[10:00:19] [PASSED] Link rate 1350000 lane count 1
[10:00:19] [PASSED] Link rate 1000000 lane count 4
[10:00:19] [PASSED] Link rate 1000000 lane count 2
[10:00:19] [PASSED] Link rate 1000000 lane count 1
[10:00:19] [PASSED] Link rate 810000 lane count 4
[10:00:19] [PASSED] Link rate 810000 lane count 2
[10:00:19] [PASSED] Link rate 810000 lane count 1
[10:00:19] [PASSED] Link rate 540000 lane count 4
[10:00:19] [PASSED] Link rate 540000 lane count 2
[10:00:19] [PASSED] Link rate 540000 lane count 1
[10:00:19] [PASSED] Link rate 270000 lane count 4
[10:00:19] [PASSED] Link rate 270000 lane count 2
[10:00:19] [PASSED] Link rate 270000 lane count 1
[10:00:19] [PASSED] Link rate 162000 lane count 4
[10:00:19] [PASSED] Link rate 162000 lane count 2
[10:00:19] [PASSED] Link rate 162000 lane count 1
[10:00:19] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[10:00:19] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[10:00:19] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[10:00:19] [PASSED] DP_POWER_UP_PHY with port number
[10:00:19] [PASSED] DP_POWER_DOWN_PHY with port number
[10:00:19] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[10:00:19] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[10:00:19] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[10:00:19] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[10:00:19] [PASSED] DP_QUERY_PAYLOAD with port number
[10:00:19] [PASSED] DP_QUERY_PAYLOAD with VCPI
[10:00:19] [PASSED] DP_REMOTE_DPCD_READ with port number
[10:00:19] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[10:00:19] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[10:00:19] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[10:00:19] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[10:00:19] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[10:00:19] [PASSED] DP_REMOTE_I2C_READ with port number
[10:00:19] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[10:00:19] [PASSED] DP_REMOTE_I2C_READ with transactions array
[10:00:19] [PASSED] DP_REMOTE_I2C_WRITE with port number
[10:00:19] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[10:00:19] [PASSED] DP_REMOTE_I2C_WRITE with data array
[10:00:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[10:00:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[10:00:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[10:00:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[10:00:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[10:00:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[10:00:19] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[10:00:19] ================ [PASSED] drm_dp_mst_helper ================
[10:00:19] ======================== drm_exec  =========================
[10:00:19] [PASSED] sanitycheck
[10:00:19] [PASSED] test_lock
[10:00:19] [PASSED] test_lock_unlock
[10:00:19] [PASSED] test_duplicates
[10:00:19] [PASSED] test_prepare
[10:00:19] [PASSED] test_prepare_array
[10:00:19] [PASSED] test_multiple_loops
[10:00:19] ==================== [PASSED] drm_exec =====================
[10:00:19] ================= drm_format_helper_test  ==================
[10:00:19] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[10:00:19] [PASSED] single_pixel_source_buffer
[10:00:19] [PASSED] single_pixel_clip_rectangle
[10:00:19] [PASSED] well_known_colors
[10:00:19] [PASSED] destination_pitch
[10:00:19] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[10:00:19] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[10:00:19] [PASSED] single_pixel_source_buffer
[10:00:19] [PASSED] single_pixel_clip_rectangle
[10:00:19] [PASSED] well_known_colors
[10:00:19] [PASSED] destination_pitch
[10:00:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[10:00:19] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[10:00:19] [PASSED] single_pixel_source_buffer
[10:00:19] [PASSED] single_pixel_clip_rectangle
[10:00:19] [PASSED] well_known_colors
[10:00:19] [PASSED] destination_pitch
[10:00:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[10:00:19] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[10:00:19] [PASSED] single_pixel_source_buffer
[10:00:19] [PASSED] single_pixel_clip_rectangle
[10:00:19] [PASSED] well_known_colors
[10:00:19] [PASSED] destination_pitch
[10:00:19] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[10:00:19] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[10:00:19] [PASSED] single_pixel_source_buffer
[10:00:19] [PASSED] single_pixel_clip_rectangle
[10:00:19] [PASSED] well_known_colors
[10:00:19] [PASSED] destination_pitch
[10:00:19] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[10:00:19] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[10:00:19] [PASSED] single_pixel_source_buffer
[10:00:19] [PASSED] single_pixel_clip_rectangle
[10:00:19] [PASSED] well_known_colors
[10:00:19] [PASSED] destination_pitch
[10:00:19] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[10:00:19] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[10:00:19] [PASSED] single_pixel_source_buffer
[10:00:19] [PASSED] single_pixel_clip_rectangle
[10:00:19] [PASSED] well_known_colors
[10:00:19] [PASSED] destination_pitch
[10:00:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[10:00:19] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[10:00:19] [PASSED] single_pixel_source_buffer
[10:00:19] [PASSED] single_pixel_clip_rectangle
[10:00:19] [PASSED] well_known_colors
[10:00:19] [PASSED] destination_pitch
[10:00:19] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[10:00:19] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[10:00:19] [PASSED] single_pixel_source_buffer
[10:00:19] [PASSED] single_pixel_clip_rectangle
[10:00:19] [PASSED] well_known_colors
[10:00:19] [PASSED] destination_pitch
[10:00:19] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[10:00:19] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[10:00:19] [PASSED] single_pixel_source_buffer
[10:00:19] [PASSED] single_pixel_clip_rectangle
[10:00:19] [PASSED] well_known_colors
[10:00:19] [PASSED] destination_pitch
[10:00:19] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[10:00:19] ============== drm_test_fb_xrgb8888_to_mono  ===============
[10:00:19] [PASSED] single_pixel_source_buffer
[10:00:19] [PASSED] single_pixel_clip_rectangle
[10:00:19] [PASSED] well_known_colors
[10:00:19] [PASSED] destination_pitch
[10:00:19] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[10:00:19] ==================== drm_test_fb_swab  =====================
[10:00:19] [PASSED] single_pixel_source_buffer
[10:00:19] [PASSED] single_pixel_clip_rectangle
[10:00:19] [PASSED] well_known_colors
[10:00:19] [PASSED] destination_pitch
[10:00:19] ================ [PASSED] drm_test_fb_swab =================
[10:00:19] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[10:00:19] [PASSED] single_pixel_source_buffer
[10:00:19] [PASSED] single_pixel_clip_rectangle
[10:00:19] [PASSED] well_known_colors
[10:00:19] [PASSED] destination_pitch
[10:00:19] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[10:00:19] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[10:00:19] [PASSED] single_pixel_source_buffer
[10:00:19] [PASSED] single_pixel_clip_rectangle
[10:00:19] [PASSED] well_known_colors
[10:00:19] [PASSED] destination_pitch
[10:00:19] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[10:00:19] ================= drm_test_fb_clip_offset  =================
[10:00:19] [PASSED] pass through
[10:00:19] [PASSED] horizontal offset
[10:00:19] [PASSED] vertical offset
[10:00:19] [PASSED] horizontal and vertical offset
[10:00:19] [PASSED] horizontal offset (custom pitch)
[10:00:19] [PASSED] vertical offset (custom pitch)
[10:00:19] [PASSED] horizontal and vertical offset (custom pitch)
[10:00:19] ============= [PASSED] drm_test_fb_clip_offset =============
[10:00:19] ============== drm_test_fb_build_fourcc_list  ==============
[10:00:19] [PASSED] no native formats
[10:00:19] [PASSED] XRGB8888 as native format
[10:00:19] [PASSED] remove duplicates
[10:00:19] [PASSED] convert alpha formats
[10:00:19] [PASSED] random formats
[10:00:19] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[10:00:19] =================== drm_test_fb_memcpy  ====================
[10:00:19] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[10:00:19] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[10:00:19] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[10:00:19] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[10:00:19] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[10:00:19] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[10:00:19] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[10:00:19] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[10:00:19] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[10:00:19] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[10:00:19] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[10:00:19] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[10:00:19] =============== [PASSED] drm_test_fb_memcpy ================
[10:00:19] ============= [PASSED] drm_format_helper_test ==============
[10:00:19] ======================= drm_format  ========================
[10:00:19] [PASSED] drm_test_format_block_width_invalid
[10:00:19] [PASSED] drm_test_format_block_width_one_plane
[10:00:19] [PASSED] drm_test_format_block_width_two_plane
[10:00:19] [PASSED] drm_test_format_block_width_three_plane
[10:00:19] [PASSED] drm_test_format_block_width_tiled
[10:00:19] [PASSED] drm_test_format_block_height_invalid
[10:00:19] [PASSED] drm_test_format_block_height_one_plane
[10:00:19] [PASSED] drm_test_format_block_height_two_plane
[10:00:19] [PASSED] drm_test_format_block_height_three_plane
[10:00:19] [PASSED] drm_test_format_block_height_tiled
[10:00:19] [PASSED] drm_test_format_min_pitch_invalid
[10:00:19] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[10:00:19] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[10:00:19] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[10:00:19] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[10:00:19] [PASSED] drm_test_format_min_pitch_two_plane
[10:00:19] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[10:00:19] [PASSED] drm_test_format_min_pitch_tiled
[10:00:19] =================== [PASSED] drm_format ====================
[10:00:19] ===================== drm_framebuffer  =====================
[10:00:19] =============== drm_test_framebuffer_create  ===============
[10:00:19] [PASSED] ABGR8888 normal sizes
[10:00:19] [PASSED] ABGR8888 max sizes
[10:00:19] [PASSED] ABGR8888 pitch greater than min required
[10:00:19] [PASSED] ABGR8888 pitch less than min required
[10:00:19] [PASSED] ABGR8888 Invalid width
[10:00:19] [PASSED] ABGR8888 Invalid buffer handle
[10:00:19] [PASSED] No pixel format
[10:00:19] [PASSED] ABGR8888 Width 0
[10:00:19] [PASSED] ABGR8888 Height 0
[10:00:19] [PASSED] ABGR8888 Out of bound height * pitch combination
[10:00:19] [PASSED] ABGR8888 Large buffer offset
[10:00:19] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[10:00:19] [PASSED] ABGR8888 Valid buffer modifier
[10:00:19] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[10:00:19] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[10:00:19] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[10:00:19] [PASSED] NV12 Normal sizes
[10:00:19] [PASSED] NV12 Max sizes
[10:00:19] [PASSED] NV12 Invalid pitch
[10:00:19] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[10:00:19] [PASSED] NV12 different  modifier per-plane
[10:00:19] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[10:00:19] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[10:00:19] [PASSED] NV12 Modifier for inexistent plane
[10:00:19] [PASSED] NV12 Handle for inexistent plane
[10:00:19] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[10:00:19] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[10:00:19] [PASSED] YVU420 Normal sizes
[10:00:19] [PASSED] YVU420 Max sizes
[10:00:19] [PASSED] YVU420 Invalid pitch
[10:00:19] [PASSED] YVU420 Different pitches
[10:00:19] [PASSED] YVU420 Different buffer offsets/pitches
[10:00:19] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[10:00:19] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[10:00:19] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[10:00:19] [PASSED] YVU420 Valid modifier
[10:00:19] [PASSED] YVU420 Different modifiers per plane
[10:00:19] [PASSED] YVU420 Modifier for inexistent plane
[10:00:19] [PASSED] X0L2 Normal sizes
[10:00:19] [PASSED] X0L2 Max sizes
[10:00:19] [PASSED] X0L2 Invalid pitch
[10:00:19] [PASSED] X0L2 Pitch greater than minimum required
[10:00:19] [PASSED] X0L2 Handle for inexistent plane
[10:00:19] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[10:00:19] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[10:00:19] [PASSED] X0L2 Valid modifier
[10:00:19] [PASSED] X0L2 Modifier for inexistent plane
[10:00:19] =========== [PASSED] drm_test_framebuffer_create ===========
[10:00:19] ================= [PASSED] drm_framebuffer =================
[10:00:19] ====================== drm_gem_shmem  ======================
[10:00:19] [PASSED] drm_gem_shmem_test_obj_create
[10:00:19] [PASSED] drm_gem_shmem_test_obj_create_private
[10:00:19] [PASSED] drm_gem_shmem_test_pin_pages
[10:00:19] [PASSED] drm_gem_shmem_test_vmap
[10:00:19] [PASSED] drm_gem_shmem_test_get_pages_sgt
[10:00:19] [PASSED] drm_gem_shmem_test_get_sg_table
[10:00:19] [PASSED] drm_gem_shmem_test_madvise
[10:00:19] [PASSED] drm_gem_shmem_test_purge
[10:00:19] ================== [PASSED] drm_gem_shmem ==================
[10:00:19] ==================== drm-test-managed  =====================
[10:00:19] [PASSED] drm_test_managed_run_action
[10:00:19] ================ [PASSED] drm-test-managed =================
[10:00:19] ========================= drm_mm  ==========================
[10:00:19] [PASSED] drm_test_mm_init
[10:00:19] [PASSED] drm_test_mm_debug
[10:00:19] [PASSED] drm_test_mm_align32
[10:00:19] [PASSED] drm_test_mm_align64
[10:00:19] [PASSED] drm_test_mm_lowest
[10:00:19] [PASSED] drm_test_mm_highest
[10:00:19] ===================== [PASSED] drm_mm ======================
[10:00:19] =================== drm_modes_analog_tv  ===================
[10:00:19] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[10:00:19] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[10:00:19] [PASSED] drm_test_modes_analog_tv_pal_576i
[10:00:19] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[10:00:19] =============== [PASSED] drm_modes_analog_tv ===============
[10:00:19] ==================== drm_plane_helper  =====================
[10:00:19] =============== drm_test_check_plane_state  ================
[10:00:19] [PASSED] clipping_simple
[10:00:19] [PASSED] clipping_rotate_reflect
[10:00:19] [PASSED] positioning_simple
[10:00:19] [PASSED] upscaling
[10:00:19] [PASSED] downscaling
[10:00:19] [PASSED] rounding1
[10:00:19] [PASSED] rounding2
[10:00:19] [PASSED] rounding3
[10:00:19] [PASSED] rounding4
[10:00:19] =========== [PASSED] drm_test_check_plane_state ============
[10:00:19] =========== drm_test_check_invalid_plane_state  ============
[10:00:19] [PASSED] positioning_invalid
[10:00:19] [PASSED] upscaling_invalid
[10:00:19] [PASSED] downscaling_invalid
[10:00:19] ======= [PASSED] drm_test_check_invalid_plane_state ========
[10:00:19] ================ [PASSED] drm_plane_helper =================
[10:00:19] ============ drm_connector_helper_tv_get_modes  ============
[10:00:19] ====== drm_test_connector_helper_tv_get_modes_check  =======
[10:00:19] [PASSED] None
[10:00:19] [PASSED] PAL
[10:00:19] [PASSED] NTSC
[10:00:19] [PASSED] Both, NTSC Default
[10:00:19] [PASSED] Both, PAL Default
[10:00:19] [PASSED] Both, NTSC Default, with PAL on command-line
[10:00:19] [PASSED] Both, PAL Default, with NTSC on command-line
[10:00:19] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[10:00:19] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[10:00:19] ======================== drm_rect  =========================
[10:00:19] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[10:00:19] [PASSED] drm_test_rect_clip_scaled_not_clipped
[10:00:19] [PASSED] drm_test_rect_clip_scaled_clipped
[10:00:19] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[10:00:19] ================= drm_test_rect_intersect  =================
[10:00:19] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[10:00:19] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
stty: 'standard input': Inappropriate ioctl for device
[10:00:19] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[10:00:19] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[10:00:19] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[10:00:19] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[10:00:19] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[10:00:19] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[10:00:19] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[10:00:19] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[10:00:19] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[10:00:19] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[10:00:19] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[10:00:19] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[10:00:19] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[10:00:19] ============= [PASSED] drm_test_rect_intersect =============
[10:00:19] ================ drm_test_rect_calc_hscale  ================
[10:00:19] [PASSED] normal use
[10:00:19] [PASSED] out of max range
[10:00:19] [PASSED] out of min range
[10:00:19] [PASSED] zero dst
[10:00:19] [PASSED] negative src
[10:00:19] [PASSED] negative dst
[10:00:19] ============ [PASSED] drm_test_rect_calc_hscale ============
[10:00:19] ================ drm_test_rect_calc_vscale  ================
[10:00:19] [PASSED] normal use
[10:00:19] [PASSED] out of max range
[10:00:19] [PASSED] out of min range
[10:00:19] [PASSED] zero dst
[10:00:19] [PASSED] negative src
[10:00:19] [PASSED] negative dst
[10:00:19] ============ [PASSED] drm_test_rect_calc_vscale ============
[10:00:19] ================== drm_test_rect_rotate  ===================
[10:00:19] [PASSED] reflect-x
[10:00:19] [PASSED] reflect-y
[10:00:19] [PASSED] rotate-0
[10:00:19] [PASSED] rotate-90
[10:00:19] [PASSED] rotate-180
[10:00:19] [PASSED] rotate-270
[10:00:19] ============== [PASSED] drm_test_rect_rotate ===============
[10:00:19] ================ drm_test_rect_rotate_inv  =================
[10:00:19] [PASSED] reflect-x
[10:00:19] [PASSED] reflect-y
[10:00:19] [PASSED] rotate-0
[10:00:19] [PASSED] rotate-90
[10:00:19] [PASSED] rotate-180
[10:00:19] [PASSED] rotate-270
[10:00:19] ============ [PASSED] drm_test_rect_rotate_inv =============
[10:00:19] ==================== [PASSED] drm_rect =====================
[10:00:19] ============================================================
[10:00:19] Testing complete. Ran 390 tests: passed: 390
[10:00:19] Elapsed time: 21.575s total, 1.678s configuring, 19.771s building, 0.123s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


