Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDE4C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 18:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77C310E2B9;
	Wed,  3 Jan 2024 18:38:09 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E241410E1A2;
 Wed,  3 Jan 2024 18:38:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_series_starting_with_=5Bv3=2C1?=
 =?utf-8?q?/2=5D_drm/xe=3A_add_a_new_debugfs_file_-_mmio?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koby Elbaz" <kelbaz@habana.ai>
Date: Wed, 03 Jan 2024 18:38:07 -0000
Message-ID: <170430708792.151.15012139657050420193@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240102205715.1831516-1-kelbaz@habana.ai>
In-Reply-To: <20240102205715.1831516-1-kelbaz@habana.ai>
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

Series: series starting with [v3,1/2] drm/xe: add a new debugfs file - mmio
URL   : https://patchwork.freedesktop.org/series/128127/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[18:37:16] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:37:20] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[18:37:43] Starting KUnit Kernel (1/1)...
[18:37:43] ============================================================
[18:37:43] ========================= guc_dbm  =========================
[18:37:43] [PASSED] test_empty
[18:37:43] [PASSED] test_default
[18:37:43] ======================== test_size  ========================
[18:37:43] [PASSED] 4
[18:37:43] [PASSED] 8
[18:37:43] [PASSED] 32
[18:37:43] [PASSED] 256
[18:37:43] ==================== [PASSED] test_size ====================
[18:37:43] ======================= test_reuse  ========================
[18:37:43] [PASSED] 4
[18:37:43] [PASSED] 8
[18:37:43] [PASSED] 32
[18:37:43] [PASSED] 256
[18:37:43] =================== [PASSED] test_reuse ====================
[18:37:43] =================== test_range_overlap  ====================
[18:37:43] [PASSED] 4
[18:37:43] [PASSED] 8
[18:37:43] [PASSED] 32
[18:37:43] [PASSED] 256
[18:37:43] =============== [PASSED] test_range_overlap ================
[18:37:43] =================== test_range_compact  ====================
[18:37:43] [PASSED] 4
[18:37:43] [PASSED] 8
[18:37:43] [PASSED] 32
[18:37:43] [PASSED] 256
[18:37:43] =============== [PASSED] test_range_compact ================
[18:37:43] ==================== test_range_spare  =====================
[18:37:43] [PASSED] 4
[18:37:43] [PASSED] 8
[18:37:43] [PASSED] 32
[18:37:43] [PASSED] 256
[18:37:43] ================ [PASSED] test_range_spare =================
[18:37:43] ===================== [PASSED] guc_dbm =====================
[18:37:43] ========================== lmtt  ===========================
[18:37:43] ======================== test_ops  =========================
[18:37:43] [PASSED] 2-level
[18:37:43] [PASSED] multi-level
[18:37:43] ==================== [PASSED] test_ops =====================
[18:37:43] ====================== [PASSED] lmtt =======================
[18:37:43] ========================== xe_bo  ==========================
[18:37:43] [SKIPPED] xe_ccs_migrate_kunit
[18:37:43] [SKIPPED] xe_bo_evict_kunit
[18:37:43] ===================== [SKIPPED] xe_bo ======================
[18:37:43] ======================= xe_dma_buf  ========================
[18:37:43] [SKIPPED] xe_dma_buf_kunit
[18:37:43] =================== [SKIPPED] xe_dma_buf ===================
[18:37:43] ======================= xe_migrate  ========================
[18:37:43] [SKIPPED] xe_migrate_sanity_kunit
[18:37:43] =================== [SKIPPED] xe_migrate ===================
[18:37:43] ========================= xe_mocs  =========================
[18:37:43] [SKIPPED] xe_live_mocs_kernel_kunit
[18:37:43] ==================== [SKIPPED] xe_mocs =====================
[18:37:43] ========================= xe_pci  ==========================
[18:37:43] [PASSED] xe_gmdid_graphics_ip
[18:37:43] [PASSED] xe_gmdid_media_ip
[18:37:43] ===================== [PASSED] xe_pci ======================
[18:37:43] ========================= xe_rtp  ==========================
[18:37:43] ================== xe_rtp_process_tests  ===================
[18:37:43] [PASSED] coalesce-same-reg
[18:37:43] [PASSED] no-match-no-add
[18:37:43] [PASSED] no-match-no-add-multiple-rules
[18:37:43] [PASSED] two-regs-two-entries
[18:37:43] [PASSED] clr-one-set-other
[18:37:43] [PASSED] set-field
[18:37:43] [PASSED] conflict-duplicate
[18:37:43] [PASSED] conflict-not-disjoint
[18:37:43] [PASSED] conflict-reg-type
[18:37:43] ============== [PASSED] xe_rtp_process_tests ===============
[18:37:43] ===================== [PASSED] xe_rtp ======================
[18:37:43] ========================== xe_wa  ==========================
[18:37:43] ======================== xe_wa_gt  =========================
[18:37:43] [PASSED] TIGERLAKE (B0)
[18:37:43] [PASSED] DG1 (A0)
[18:37:43] [PASSED] DG1 (B0)
[18:37:43] [PASSED] ALDERLAKE_S (A0)
[18:37:43] [PASSED] ALDERLAKE_S (B0)
[18:37:43] [PASSED] ALDERLAKE_S (C0)
[18:37:43] [PASSED] ALDERLAKE_S (D0)
[18:37:43] [PASSED] ALDERLAKE_P (A0)
[18:37:43] [PASSED] ALDERLAKE_P (B0)
[18:37:43] [PASSED] ALDERLAKE_P (C0)
[18:37:43] [PASSED] ALDERLAKE_S_RPLS (D0)
[18:37:43] [PASSED] ALDERLAKE_P_RPLU (E0)
[18:37:43] [PASSED] DG2_G10 (A0)
[18:37:43] [PASSED] DG2_G10 (A1)
[18:37:43] [PASSED] DG2_G10 (B0)
[18:37:43] [PASSED] DG2_G10 (C0)
[18:37:43] [PASSED] DG2_G11 (A0)
[18:37:43] [PASSED] DG2_G11 (B0)
[18:37:43] [PASSED] DG2_G11 (B1)
[18:37:43] [PASSED] DG2_G12 (A0)
[18:37:43] [PASSED] DG2_G12 (A1)
[18:37:43] [PASSED] PVC (B0)
[18:37:43] [PASSED] PVC (B1)
[18:37:43] [PASSED] PVC (C0)
[18:37:43] [PASSED] METEORLAKE (g:A0, m:A0)
[18:37:43] [PASSED] METEORLAKE (g:A0, m:A0)
[18:37:43] [PASSED] LUNARLAKE (g:A0, m:A0)
[18:37:43] [PASSED] LUNARLAKE (g:B0, m:A0)
[18:37:43] ==================== [PASSED] xe_wa_gt =====================
[18:37:43] ====================== [PASSED] xe_wa ======================
[18:37:43] ============================================================
[18:37:43] Testing complete. Ran 68 tests: passed: 63, skipped: 5
[18:37:43] Elapsed time: 27.527s total, 4.197s configuring, 23.110s building, 0.179s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[18:37:43] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:37:45] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[18:38:05] Starting KUnit Kernel (1/1)...
[18:38:05] ============================================================
[18:38:05] ================== drm_test_pick_cmdline  ==================
[18:38:05] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[18:38:05] =============== drm_test_pick_cmdline_named  ===============
[18:38:05] [PASSED] NTSC
[18:38:05] [PASSED] NTSC-J
[18:38:05] [PASSED] PAL
[18:38:05] [PASSED] PAL-M
[18:38:05] =========== [PASSED] drm_test_pick_cmdline_named ===========
[18:38:05] ============== [PASSED] drm_test_pick_cmdline ==============
[18:38:05] ======================== drm_buddy  ========================
[18:38:05] [PASSED] drm_test_buddy_alloc_limit
[18:38:05] [PASSED] drm_test_buddy_alloc_optimistic
[18:38:05] [PASSED] drm_test_buddy_alloc_pessimistic
[18:38:05] [PASSED] drm_test_buddy_alloc_pathological
[18:38:05] ==================== [PASSED] drm_buddy ====================
[18:38:05] =================== drm_cmdline_parser  ====================
[18:38:05] [PASSED] drm_test_cmdline_force_d_only
[18:38:05] [PASSED] drm_test_cmdline_force_D_only_dvi
[18:38:05] [PASSED] drm_test_cmdline_force_D_only_hdmi
[18:38:05] [PASSED] drm_test_cmdline_force_D_only_not_digital
[18:38:05] [PASSED] drm_test_cmdline_force_e_only
[18:38:05] [PASSED] drm_test_cmdline_res
[18:38:05] [PASSED] drm_test_cmdline_res_vesa
[18:38:05] [PASSED] drm_test_cmdline_res_vesa_rblank
[18:38:05] [PASSED] drm_test_cmdline_res_rblank
[18:38:05] [PASSED] drm_test_cmdline_res_bpp
[18:38:05] [PASSED] drm_test_cmdline_res_refresh
[18:38:05] [PASSED] drm_test_cmdline_res_bpp_refresh
[18:38:05] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[18:38:05] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[18:38:05] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[18:38:05] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[18:38:05] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[18:38:05] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[18:38:05] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[18:38:05] [PASSED] drm_test_cmdline_res_margins_force_on
[18:38:05] [PASSED] drm_test_cmdline_res_vesa_margins
[18:38:05] [PASSED] drm_test_cmdline_name
[18:38:05] [PASSED] drm_test_cmdline_name_bpp
[18:38:05] [PASSED] drm_test_cmdline_name_option
[18:38:05] [PASSED] drm_test_cmdline_name_bpp_option
[18:38:05] [PASSED] drm_test_cmdline_rotate_0
[18:38:05] [PASSED] drm_test_cmdline_rotate_90
[18:38:05] [PASSED] drm_test_cmdline_rotate_180
[18:38:05] [PASSED] drm_test_cmdline_rotate_270
[18:38:05] [PASSED] drm_test_cmdline_hmirror
[18:38:05] [PASSED] drm_test_cmdline_vmirror
[18:38:05] [PASSED] drm_test_cmdline_margin_options
[18:38:05] [PASSED] drm_test_cmdline_multiple_options
[18:38:05] [PASSED] drm_test_cmdline_bpp_extra_and_option
[18:38:05] [PASSED] drm_test_cmdline_extra_and_option
[18:38:05] [PASSED] drm_test_cmdline_freestanding_options
[18:38:05] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[18:38:05] [PASSED] drm_test_cmdline_panel_orientation
[18:38:05] ================ drm_test_cmdline_invalid  =================
[18:38:05] [PASSED] margin_only
[18:38:05] [PASSED] interlace_only
[18:38:05] [PASSED] res_missing_x
[18:38:05] [PASSED] res_missing_y
[18:38:05] [PASSED] res_bad_y
[18:38:05] [PASSED] res_missing_y_bpp
[18:38:05] [PASSED] res_bad_bpp
[18:38:05] [PASSED] res_bad_refresh
[18:38:05] [PASSED] res_bpp_refresh_force_on_off
[18:38:05] [PASSED] res_invalid_mode
[18:38:05] [PASSED] res_bpp_wrong_place_mode
[18:38:05] [PASSED] name_bpp_refresh
[18:38:05] [PASSED] name_refresh
[18:38:05] [PASSED] name_refresh_wrong_mode
[18:38:05] [PASSED] name_refresh_invalid_mode
[18:38:05] [PASSED] rotate_multiple
[18:38:05] [PASSED] rotate_invalid_val
[18:38:05] [PASSED] rotate_truncated
[18:38:05] [PASSED] invalid_option
[18:38:05] [PASSED] invalid_tv_option
[18:38:05] [PASSED] truncated_tv_option
[18:38:05] ============ [PASSED] drm_test_cmdline_invalid =============
[18:38:05] =============== drm_test_cmdline_tv_options  ===============
[18:38:05] [PASSED] NTSC
[18:38:05] [PASSED] NTSC_443
[18:38:05] [PASSED] NTSC_J
[18:38:05] [PASSED] PAL
[18:38:05] [PASSED] PAL_M
[18:38:05] [PASSED] PAL_N
[18:38:05] [PASSED] SECAM
[18:38:05] =========== [PASSED] drm_test_cmdline_tv_options ===========
[18:38:05] =============== [PASSED] drm_cmdline_parser ================
[18:38:05] ================ drm_get_tv_mode_from_name  ================
[18:38:05] ========== drm_test_get_tv_mode_from_name_valid  ===========
[18:38:05] [PASSED] NTSC
[18:38:05] [PASSED] NTSC-443
[18:38:05] [PASSED] NTSC-J
[18:38:05] [PASSED] PAL
[18:38:05] [PASSED] PAL-M
[18:38:05] [PASSED] PAL-N
[18:38:05] [PASSED] SECAM
[18:38:05] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[18:38:05] [PASSED] drm_test_get_tv_mode_from_name_truncated
[18:38:05] ============ [PASSED] drm_get_tv_mode_from_name ============
[18:38:05] ==================== drm_damage_helper  ====================
[18:38:05] [PASSED] drm_test_damage_iter_no_damage
[18:38:05] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[18:38:05] [PASSED] drm_test_damage_iter_no_damage_src_moved
[18:38:05] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[18:38:05] [PASSED] drm_test_damage_iter_no_damage_not_visible
[18:38:05] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[18:38:05] [PASSED] drm_test_damage_iter_no_damage_no_fb
[18:38:05] [PASSED] drm_test_damage_iter_simple_damage
[18:38:05] [PASSED] drm_test_damage_iter_single_damage
[18:38:05] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[18:38:05] [PASSED] drm_test_damage_iter_single_damage_outside_src
[18:38:05] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[18:38:05] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[18:38:05] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[18:38:05] [PASSED] drm_test_damage_iter_single_damage_src_moved
[18:38:05] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[18:38:05] [PASSED] drm_test_damage_iter_damage
[18:38:05] [PASSED] drm_test_damage_iter_damage_one_intersect
[18:38:05] [PASSED] drm_test_damage_iter_damage_one_outside
[18:38:05] [PASSED] drm_test_damage_iter_damage_src_moved
[18:38:05] [PASSED] drm_test_damage_iter_damage_not_visible
[18:38:05] ================ [PASSED] drm_damage_helper ================
[18:38:05] ==================== drm_dp_mst_helper  ====================
[18:38:05] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[18:38:05] [PASSED] Clock 154000 BPP 30 DSC disabled
[18:38:05] [PASSED] Clock 234000 BPP 30 DSC disabled
[18:38:05] [PASSED] Clock 297000 BPP 24 DSC disabled
[18:38:05] [PASSED] Clock 332880 BPP 24 DSC enabled
[18:38:05] [PASSED] Clock 324540 BPP 24 DSC enabled
[18:38:05] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[18:38:05] ============== drm_test_dp_mst_calc_pbn_div  ===============
[18:38:05] [PASSED] Link rate 2000000 lane count 4
[18:38:05] [PASSED] Link rate 2000000 lane count 2
[18:38:05] [PASSED] Link rate 2000000 lane count 1
[18:38:05] [PASSED] Link rate 1350000 lane count 4
[18:38:05] [PASSED] Link rate 1350000 lane count 2
[18:38:05] [PASSED] Link rate 1350000 lane count 1
[18:38:05] [PASSED] Link rate 1000000 lane count 4
[18:38:05] [PASSED] Link rate 1000000 lane count 2
[18:38:05] [PASSED] Link rate 1000000 lane count 1
[18:38:05] [PASSED] Link rate 810000 lane count 4
[18:38:05] [PASSED] Link rate 810000 lane count 2
[18:38:05] [PASSED] Link rate 810000 lane count 1
[18:38:05] [PASSED] Link rate 540000 lane count 4
[18:38:05] [PASSED] Link rate 540000 lane count 2
[18:38:05] [PASSED] Link rate 540000 lane count 1
[18:38:05] [PASSED] Link rate 270000 lane count 4
[18:38:05] [PASSED] Link rate 270000 lane count 2
[18:38:05] [PASSED] Link rate 270000 lane count 1
[18:38:05] [PASSED] Link rate 162000 lane count 4
[18:38:05] [PASSED] Link rate 162000 lane count 2
[18:38:05] [PASSED] Link rate 162000 lane count 1
[18:38:05] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[18:38:05] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[18:38:05] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[18:38:05] [PASSED] DP_POWER_UP_PHY with port number
[18:38:05] [PASSED] DP_POWER_DOWN_PHY with port number
[18:38:05] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[18:38:05] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[18:38:05] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[18:38:05] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[18:38:05] [PASSED] DP_QUERY_PAYLOAD with port number
[18:38:05] [PASSED] DP_QUERY_PAYLOAD with VCPI
[18:38:05] [PASSED] DP_REMOTE_DPCD_READ with port number
[18:38:05] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[18:38:05] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[18:38:05] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[18:38:05] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[18:38:05] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[18:38:05] [PASSED] DP_REMOTE_I2C_READ with port number
[18:38:05] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[18:38:05] [PASSED] DP_REMOTE_I2C_READ with transactions array
[18:38:05] [PASSED] DP_REMOTE_I2C_WRITE with port number
[18:38:05] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[18:38:05] [PASSED] DP_REMOTE_I2C_WRITE with data array
[18:38:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[18:38:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[18:38:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[18:38:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[18:38:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[18:38:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[18:38:05] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[18:38:05] ================ [PASSED] drm_dp_mst_helper ================
[18:38:05] ======================== drm_exec  =========================
[18:38:05] [PASSED] sanitycheck
[18:38:05] [PASSED] test_lock
[18:38:05] [PASSED] test_lock_unlock
[18:38:05] [PASSED] test_duplicates
[18:38:05] [PASSED] test_prepare
[18:38:05] [PASSED] test_prepare_array
[18:38:05] [PASSED] test_multiple_loops
[18:38:05] ==================== [PASSED] drm_exec =====================
[18:38:05] ================= drm_format_helper_test  ==================
[18:38:05] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[18:38:05] [PASSED] single_pixel_source_buffer
[18:38:05] [PASSED] single_pixel_clip_rectangle
[18:38:05] [PASSED] well_known_colors
[18:38:05] [PASSED] destination_pitch
[18:38:05] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[18:38:05] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[18:38:05] [PASSED] single_pixel_source_buffer
[18:38:05] [PASSED] single_pixel_clip_rectangle
[18:38:05] [PASSED] well_known_colors
[18:38:05] [PASSED] destination_pitch
[18:38:05] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[18:38:05] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[18:38:05] [PASSED] single_pixel_source_buffer
[18:38:05] [PASSED] single_pixel_clip_rectangle
[18:38:05] [PASSED] well_known_colors
[18:38:05] [PASSED] destination_pitch
[18:38:05] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[18:38:05] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[18:38:05] [PASSED] single_pixel_source_buffer
[18:38:05] [PASSED] single_pixel_clip_rectangle
[18:38:05] [PASSED] well_known_colors
[18:38:05] [PASSED] destination_pitch
[18:38:05] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[18:38:05] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[18:38:05] [PASSED] single_pixel_source_buffer
[18:38:05] [PASSED] single_pixel_clip_rectangle
[18:38:05] [PASSED] well_known_colors
[18:38:05] [PASSED] destination_pitch
[18:38:05] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[18:38:05] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[18:38:05] [PASSED] single_pixel_source_buffer
[18:38:05] [PASSED] single_pixel_clip_rectangle
[18:38:05] [PASSED] well_known_colors
[18:38:05] [PASSED] destination_pitch
[18:38:05] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[18:38:05] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[18:38:05] [PASSED] single_pixel_source_buffer
[18:38:05] [PASSED] single_pixel_clip_rectangle
[18:38:05] [PASSED] well_known_colors
[18:38:05] [PASSED] destination_pitch
[18:38:05] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[18:38:05] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[18:38:05] [PASSED] single_pixel_source_buffer
[18:38:05] [PASSED] single_pixel_clip_rectangle
[18:38:05] [PASSED] well_known_colors
[18:38:05] [PASSED] destination_pitch
[18:38:05] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[18:38:05] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[18:38:05] [PASSED] single_pixel_source_buffer
[18:38:05] [PASSED] single_pixel_clip_rectangle
[18:38:05] [PASSED] well_known_colors
[18:38:05] [PASSED] destination_pitch
[18:38:05] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[18:38:05] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[18:38:05] [PASSED] single_pixel_source_buffer
[18:38:05] [PASSED] single_pixel_clip_rectangle
[18:38:05] [PASSED] well_known_colors
[18:38:05] [PASSED] destination_pitch
[18:38:05] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[18:38:05] ============== drm_test_fb_xrgb8888_to_mono  ===============
[18:38:05] [PASSED] single_pixel_source_buffer
[18:38:05] [PASSED] single_pixel_clip_rectangle
[18:38:05] [PASSED] well_known_colors
[18:38:05] [PASSED] destination_pitch
[18:38:05] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[18:38:05] ==================== drm_test_fb_swab  =====================
[18:38:05] [PASSED] single_pixel_source_buffer
[18:38:05] [PASSED] single_pixel_clip_rectangle
[18:38:05] [PASSED] well_known_colors
[18:38:05] [PASSED] destination_pitch
[18:38:05] ================ [PASSED] drm_test_fb_swab =================
[18:38:05] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[18:38:05] [PASSED] single_pixel_source_buffer
[18:38:05] [PASSED] single_pixel_clip_rectangle
[18:38:05] [PASSED] well_known_colors
[18:38:05] [PASSED] destination_pitch
[18:38:05] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[18:38:05] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[18:38:05] [PASSED] single_pixel_source_buffer
[18:38:05] [PASSED] single_pixel_clip_rectangle
[18:38:05] [PASSED] well_known_colors
[18:38:05] [PASSED] destination_pitch
[18:38:05] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[18:38:05] ================= drm_test_fb_clip_offset  =================
[18:38:05] [PASSED] pass through
[18:38:05] [PASSED] horizontal offset
[18:38:05] [PASSED] vertical offset
[18:38:05] [PASSED] horizontal and vertical offset
[18:38:05] [PASSED] horizontal offset (custom pitch)
[18:38:05] [PASSED] vertical offset (custom pitch)
[18:38:05] [PASSED] horizontal and vertical offset (custom pitch)
[18:38:05] ============= [PASSED] drm_test_fb_clip_offset =============
[18:38:05] ============== drm_test_fb_build_fourcc_list  ==============
[18:38:05] [PASSED] no native formats
[18:38:05] [PASSED] XRGB8888 as native format
[18:38:05] [PASSED] remove duplicates
[18:38:05] [PASSED] convert alpha formats
[18:38:05] [PASSED] random formats
[18:38:05] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[18:38:05] =================== drm_test_fb_memcpy  ====================
[18:38:05] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[18:38:05] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[18:38:05] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[18:38:05] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[18:38:05] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[18:38:05] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[18:38:05] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[18:38:05] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[18:38:05] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[18:38:05] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[18:38:05] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[18:38:05] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[18:38:05] =============== [PASSED] drm_test_fb_memcpy ================
[18:38:05] ============= [PASSED] drm_format_helper_test ==============
[18:38:05] ======================= drm_format  ========================
[18:38:05] [PASSED] drm_test_format_block_width_invalid
[18:38:05] [PASSED] drm_test_format_block_width_one_plane
[18:38:05] [PASSED] drm_test_format_block_width_two_plane
[18:38:05] [PASSED] drm_test_format_block_width_three_plane
[18:38:05] [PASSED] drm_test_format_block_width_tiled
[18:38:05] [PASSED] drm_test_format_block_height_invalid
[18:38:05] [PASSED] drm_test_format_block_height_one_plane
[18:38:05] [PASSED] drm_test_format_block_height_two_plane
[18:38:05] [PASSED] drm_test_format_block_height_three_plane
[18:38:05] [PASSED] drm_test_format_block_height_tiled
[18:38:05] [PASSED] drm_test_format_min_pitch_invalid
[18:38:05] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[18:38:05] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[18:38:05] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[18:38:05] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[18:38:05] [PASSED] drm_test_format_min_pitch_two_plane
[18:38:05] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[18:38:05] [PASSED] drm_test_format_min_pitch_tiled
[18:38:05] =================== [PASSED] drm_format ====================
[18:38:05] ===================== drm_framebuffer  =====================
[18:38:05] =============== drm_test_framebuffer_create  ===============
[18:38:05] [PASSED] ABGR8888 normal sizes
[18:38:05] [PASSED] ABGR8888 max sizes
[18:38:05] [PASSED] ABGR8888 pitch greater than min required
[18:38:05] [PASSED] ABGR8888 pitch less than min required
[18:38:05] [PASSED] ABGR8888 Invalid width
[18:38:05] [PASSED] ABGR8888 Invalid buffer handle
[18:38:05] [PASSED] No pixel format
[18:38:05] [PASSED] ABGR8888 Width 0
[18:38:05] [PASSED] ABGR8888 Height 0
[18:38:05] [PASSED] ABGR8888 Out of bound height * pitch combination
[18:38:05] [PASSED] ABGR8888 Large buffer offset
[18:38:05] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[18:38:05] [PASSED] ABGR8888 Valid buffer modifier
[18:38:05] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[18:38:05] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[18:38:05] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[18:38:05] [PASSED] NV12 Normal sizes
[18:38:05] [PASSED] NV12 Max sizes
[18:38:05] [PASSED] NV12 Invalid pitch
[18:38:05] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[18:38:05] [PASSED] NV12 different  modifier per-plane
[18:38:05] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[18:38:05] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[18:38:05] [PASSED] NV12 Modifier for inexistent plane
[18:38:05] [PASSED] NV12 Handle for inexistent plane
[18:38:05] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[18:38:05] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[18:38:05] [PASSED] YVU420 Normal sizes
[18:38:05] [PASSED] YVU420 Max sizes
[18:38:05] [PASSED] YVU420 Invalid pitch
[18:38:05] [PASSED] YVU420 Different pitches
[18:38:05] [PASSED] YVU420 Different buffer offsets/pitches
[18:38:05] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[18:38:05] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[18:38:05] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[18:38:05] [PASSED] YVU420 Valid modifier
[18:38:05] [PASSED] YVU420 Different modifiers per plane
[18:38:05] [PASSED] YVU420 Modifier for inexistent plane
[18:38:05] [PASSED] X0L2 Normal sizes
[18:38:05] [PASSED] X0L2 Max sizes
[18:38:05] [PASSED] X0L2 Invalid pitch
[18:38:05] [PASSED] X0L2 Pitch greater than minimum required
[18:38:05] [PASSED] X0L2 Handle for inexistent plane
[18:38:05] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[18:38:05] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[18:38:05] [PASSED] X0L2 Valid modifier
[18:38:05] [PASSED] X0L2 Modifier for inexistent plane
[18:38:05] =========== [PASSED] drm_test_framebuffer_create ===========
[18:38:05] ================= [PASSED] drm_framebuffer =================
[18:38:05] ====================== drm_gem_shmem  ======================
[18:38:05] [PASSED] drm_gem_shmem_test_obj_create
[18:38:05] [PASSED] drm_gem_shmem_test_obj_create_private
[18:38:05] [PASSED] drm_gem_shmem_test_pin_pages
[18:38:05] [PASSED] drm_gem_shmem_test_vmap
[18:38:05] [PASSED] drm_gem_shmem_test_get_pages_sgt
[18:38:05] [PASSED] drm_gem_shmem_test_get_sg_table
[18:38:05] [PASSED] drm_gem_shmem_test_madvise
[18:38:05] [PASSED] drm_gem_shmem_test_purge
[18:38:05] ================== [PASSED] drm_gem_shmem ==================
[18:38:05] ==================== drm-test-managed  =====================
[18:38:05] [PASSED] drm_test_managed_run_action
[18:38:05] ================ [PASSED] drm-test-managed =================
[18:38:05] ========================= drm_mm  ==========================
[18:38:05] [PASSED] drm_test_mm_init
[18:38:05] [PASSED] drm_test_mm_debug
[18:38:05] [PASSED] drm_test_mm_align32
[18:38:05] [PASSED] drm_test_mm_align64
[18:38:05] [PASSED] drm_test_mm_lowest
[18:38:05] [PASSED] drm_test_mm_highest
[18:38:05] ===================== [PASSED] drm_mm ======================
[18:38:05] =================== drm_modes_analog_tv  ===================
[18:38:05] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[18:38:05] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[18:38:05] [PASSED] drm_test_modes_analog_tv_pal_576i
[18:38:05] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[18:38:05] =============== [PASSED] drm_modes_analog_tv ===============
[18:38:05] ==================== drm_plane_helper  =====================
[18:38:05] =============== drm_test_check_plane_state  ================
[18:38:05] [PASSED] clipping_simple
[18:38:05] [PASSED] clipping_rotate_reflect
[18:38:05] [PASSED] positioning_simple
[18:38:05] [PASSED] upscaling
[18:38:05] [PASSED] downscaling
[18:38:05] [PASSED] rounding1
[18:38:05] [PASSED] rounding2
[18:38:05] [PASSED] rounding3
[18:38:05] [PASSED] rounding4
[18:38:05] =========== [PASSED] drm_test_check_plane_state ============
[18:38:05] =========== drm_test_check_invalid_plane_state  ============
[18:38:05] [PASSED] positioning_invalid
[18:38:05] [PASSED] upscaling_invalid
[18:38:05] [PASSED] downscaling_invalid
[18:38:05] ======= [PASSED] drm_test_check_invalid_plane_state ========
[18:38:05] ================ [PASSED] drm_plane_helper =================
[18:38:05] ============ drm_connector_helper_tv_get_modes  ============
[18:38:05] ====== drm_test_connector_helper_tv_get_modes_check  =======
[18:38:05] [PASSED] None
[18:38:05] [PASSED] PAL
[18:38:05] [PASSED] NTSC
[18:38:05] [PASSED] Both, NTSC Default
[18:38:05] [PASSED] Both, PAL Default
[18:38:05] [PASSED] Both, NTSC Default, with PAL on command-line
[18:38:05] [PASSED] Both, PAL Default, with NTSC on command-line
[18:38:05] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[18:38:05] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[18:38:05] ======================== drm_rect  =========================
[18:38:05] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[18:38:05] [PASSED] drm_test_rect_clip_scaled_not_clipped
[18:38:05] [PASSED] drm_test_rect_clip_scaled_clipped
[18:38:05] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[18:38:05] ================= drm_test_rect_intersect  =================
[18:38:05] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[18:38:05] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
stty: 'standard input': Inappropriate ioctl for device
[18:38:05] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[18:38:05] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[18:38:05] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[18:38:05] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[18:38:05] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[18:38:05] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[18:38:05] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[18:38:05] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[18:38:05] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[18:38:05] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[18:38:05] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[18:38:05] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[18:38:05] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[18:38:05] ============= [PASSED] drm_test_rect_intersect =============
[18:38:05] ================ drm_test_rect_calc_hscale  ================
[18:38:05] [PASSED] normal use
[18:38:05] [PASSED] out of max range
[18:38:05] [PASSED] out of min range
[18:38:05] [PASSED] zero dst
[18:38:05] [PASSED] negative src
[18:38:05] [PASSED] negative dst
[18:38:05] ============ [PASSED] drm_test_rect_calc_hscale ============
[18:38:05] ================ drm_test_rect_calc_vscale  ================
[18:38:05] [PASSED] normal use
[18:38:05] [PASSED] out of max range
[18:38:05] [PASSED] out of min range
[18:38:05] [PASSED] zero dst
[18:38:05] [PASSED] negative src
[18:38:05] [PASSED] negative dst
[18:38:05] ============ [PASSED] drm_test_rect_calc_vscale ============
[18:38:05] ================== drm_test_rect_rotate  ===================
[18:38:05] [PASSED] reflect-x
[18:38:05] [PASSED] reflect-y
[18:38:05] [PASSED] rotate-0
[18:38:05] [PASSED] rotate-90
[18:38:05] [PASSED] rotate-180
[18:38:05] [PASSED] rotate-270
[18:38:05] ============== [PASSED] drm_test_rect_rotate ===============
[18:38:05] ================ drm_test_rect_rotate_inv  =================
[18:38:05] [PASSED] reflect-x
[18:38:05] [PASSED] reflect-y
[18:38:05] [PASSED] rotate-0
[18:38:05] [PASSED] rotate-90
[18:38:05] [PASSED] rotate-180
[18:38:05] [PASSED] rotate-270
[18:38:05] ============ [PASSED] drm_test_rect_rotate_inv =============
[18:38:05] ==================== [PASSED] drm_rect =====================
[18:38:05] ============================================================
[18:38:05] Testing complete. Ran 390 tests: passed: 390
[18:38:05] Elapsed time: 21.672s total, 1.661s configuring, 19.836s building, 0.172s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


