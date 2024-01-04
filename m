Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B28C47074
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 20:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B028210E52C;
	Thu,  4 Jan 2024 20:23:11 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80CC10E52C;
 Thu,  4 Jan 2024 20:23:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_series_starting_with_=5Bv3=2C1?=
 =?utf-8?q?/2=5D_drm/i915=3A_Disable_DSB_in_Xe_KMD?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Thu, 04 Jan 2024 20:23:09 -0000
Message-ID: <170439978982.22406.8072227556694746340@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240104160557.48496-1-jose.souza@intel.com>
In-Reply-To: <20240104160557.48496-1-jose.souza@intel.com>
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

Series: series starting with [v3,1/2] drm/i915: Disable DSB in Xe KMD
URL   : https://patchwork.freedesktop.org/series/128213/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[20:22:18] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:22:22] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[20:22:45] Starting KUnit Kernel (1/1)...
[20:22:45] ============================================================
[20:22:45] ========================= guc_dbm  =========================
[20:22:45] [PASSED] test_empty
[20:22:45] [PASSED] test_default
[20:22:45] ======================== test_size  ========================
[20:22:45] [PASSED] 4
[20:22:45] [PASSED] 8
[20:22:45] [PASSED] 32
[20:22:45] [PASSED] 256
[20:22:45] ==================== [PASSED] test_size ====================
[20:22:45] ======================= test_reuse  ========================
[20:22:45] [PASSED] 4
[20:22:45] [PASSED] 8
[20:22:45] [PASSED] 32
[20:22:45] [PASSED] 256
[20:22:45] =================== [PASSED] test_reuse ====================
[20:22:45] =================== test_range_overlap  ====================
[20:22:45] [PASSED] 4
[20:22:45] [PASSED] 8
[20:22:45] [PASSED] 32
[20:22:45] [PASSED] 256
[20:22:45] =============== [PASSED] test_range_overlap ================
[20:22:45] =================== test_range_compact  ====================
[20:22:45] [PASSED] 4
[20:22:45] [PASSED] 8
[20:22:45] [PASSED] 32
[20:22:45] [PASSED] 256
[20:22:45] =============== [PASSED] test_range_compact ================
[20:22:45] ==================== test_range_spare  =====================
[20:22:45] [PASSED] 4
[20:22:45] [PASSED] 8
[20:22:45] [PASSED] 32
[20:22:45] [PASSED] 256
[20:22:45] ================ [PASSED] test_range_spare =================
[20:22:45] ===================== [PASSED] guc_dbm =====================
[20:22:45] ========================== lmtt  ===========================
[20:22:45] ======================== test_ops  =========================
[20:22:45] [PASSED] 2-level
[20:22:45] [PASSED] multi-level
[20:22:45] ==================== [PASSED] test_ops =====================
[20:22:45] ====================== [PASSED] lmtt =======================
[20:22:45] ========================== xe_bo  ==========================
[20:22:45] [SKIPPED] xe_ccs_migrate_kunit
[20:22:45] [SKIPPED] xe_bo_evict_kunit
[20:22:45] ===================== [SKIPPED] xe_bo ======================
[20:22:45] ======================= xe_dma_buf  ========================
[20:22:45] [SKIPPED] xe_dma_buf_kunit
[20:22:45] =================== [SKIPPED] xe_dma_buf ===================
[20:22:45] ======================= xe_migrate  ========================
[20:22:45] [SKIPPED] xe_migrate_sanity_kunit
[20:22:45] =================== [SKIPPED] xe_migrate ===================
[20:22:45] ========================= xe_mocs  =========================
[20:22:45] [SKIPPED] xe_live_mocs_kernel_kunit
[20:22:45] ==================== [SKIPPED] xe_mocs =====================
[20:22:45] ========================= xe_pci  ==========================
[20:22:45] [PASSED] xe_gmdid_graphics_ip
[20:22:45] [PASSED] xe_gmdid_media_ip
[20:22:45] ===================== [PASSED] xe_pci ======================
[20:22:45] ========================= xe_rtp  ==========================
[20:22:45] ================== xe_rtp_process_tests  ===================
[20:22:45] [PASSED] coalesce-same-reg
[20:22:45] [PASSED] no-match-no-add
[20:22:45] [PASSED] no-match-no-add-multiple-rules
[20:22:45] [PASSED] two-regs-two-entries
[20:22:45] [PASSED] clr-one-set-other
[20:22:45] [PASSED] set-field
[20:22:45] [PASSED] conflict-duplicate
[20:22:45] [PASSED] conflict-not-disjoint
[20:22:45] [PASSED] conflict-reg-type
[20:22:45] ============== [PASSED] xe_rtp_process_tests ===============
[20:22:45] ===================== [PASSED] xe_rtp ======================
[20:22:45] ========================== xe_wa  ==========================
[20:22:45] ======================== xe_wa_gt  =========================
[20:22:45] [PASSED] TIGERLAKE (B0)
[20:22:45] [PASSED] DG1 (A0)
[20:22:45] [PASSED] DG1 (B0)
[20:22:45] [PASSED] ALDERLAKE_S (A0)
[20:22:45] [PASSED] ALDERLAKE_S (B0)
[20:22:45] [PASSED] ALDERLAKE_S (C0)
[20:22:45] [PASSED] ALDERLAKE_S (D0)
[20:22:45] [PASSED] ALDERLAKE_P (A0)
[20:22:45] [PASSED] ALDERLAKE_P (B0)
[20:22:45] [PASSED] ALDERLAKE_P (C0)
[20:22:45] [PASSED] ALDERLAKE_S_RPLS (D0)
[20:22:45] [PASSED] ALDERLAKE_P_RPLU (E0)
[20:22:45] [PASSED] DG2_G10 (A0)
[20:22:45] [PASSED] DG2_G10 (A1)
[20:22:45] [PASSED] DG2_G10 (B0)
[20:22:45] [PASSED] DG2_G10 (C0)
[20:22:45] [PASSED] DG2_G11 (A0)
[20:22:45] [PASSED] DG2_G11 (B0)
[20:22:45] [PASSED] DG2_G11 (B1)
[20:22:45] [PASSED] DG2_G12 (A0)
[20:22:45] [PASSED] DG2_G12 (A1)
[20:22:45] [PASSED] PVC (B0)
[20:22:45] [PASSED] PVC (B1)
[20:22:45] [PASSED] PVC (C0)
[20:22:45] [PASSED] METEORLAKE (g:A0, m:A0)
[20:22:45] [PASSED] METEORLAKE (g:A0, m:A0)
[20:22:45] [PASSED] LUNARLAKE (g:A0, m:A0)
[20:22:45] [PASSED] LUNARLAKE (g:B0, m:A0)
[20:22:45] ==================== [PASSED] xe_wa_gt =====================
[20:22:45] ====================== [PASSED] xe_wa ======================
[20:22:45] ============================================================
[20:22:45] Testing complete. Ran 68 tests: passed: 63, skipped: 5
[20:22:45] Elapsed time: 27.517s total, 4.213s configuring, 23.083s building, 0.176s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[20:22:45] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:22:47] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[20:23:07] Starting KUnit Kernel (1/1)...
[20:23:07] ============================================================
[20:23:07] ================== drm_test_pick_cmdline  ==================
[20:23:07] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[20:23:07] =============== drm_test_pick_cmdline_named  ===============
[20:23:07] [PASSED] NTSC
[20:23:07] [PASSED] NTSC-J
[20:23:07] [PASSED] PAL
[20:23:07] [PASSED] PAL-M
[20:23:07] =========== [PASSED] drm_test_pick_cmdline_named ===========
[20:23:07] ============== [PASSED] drm_test_pick_cmdline ==============
[20:23:07] ======================== drm_buddy  ========================
[20:23:07] [PASSED] drm_test_buddy_alloc_limit
[20:23:07] [PASSED] drm_test_buddy_alloc_optimistic
[20:23:07] [PASSED] drm_test_buddy_alloc_pessimistic
[20:23:07] [PASSED] drm_test_buddy_alloc_pathological
[20:23:07] ==================== [PASSED] drm_buddy ====================
[20:23:07] =================== drm_cmdline_parser  ====================
[20:23:07] [PASSED] drm_test_cmdline_force_d_only
[20:23:07] [PASSED] drm_test_cmdline_force_D_only_dvi
[20:23:07] [PASSED] drm_test_cmdline_force_D_only_hdmi
[20:23:07] [PASSED] drm_test_cmdline_force_D_only_not_digital
[20:23:07] [PASSED] drm_test_cmdline_force_e_only
[20:23:07] [PASSED] drm_test_cmdline_res
[20:23:07] [PASSED] drm_test_cmdline_res_vesa
[20:23:07] [PASSED] drm_test_cmdline_res_vesa_rblank
[20:23:07] [PASSED] drm_test_cmdline_res_rblank
[20:23:07] [PASSED] drm_test_cmdline_res_bpp
[20:23:07] [PASSED] drm_test_cmdline_res_refresh
[20:23:07] [PASSED] drm_test_cmdline_res_bpp_refresh
[20:23:07] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[20:23:07] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[20:23:07] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[20:23:07] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[20:23:07] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[20:23:07] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[20:23:07] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[20:23:07] [PASSED] drm_test_cmdline_res_margins_force_on
[20:23:07] [PASSED] drm_test_cmdline_res_vesa_margins
[20:23:07] [PASSED] drm_test_cmdline_name
[20:23:07] [PASSED] drm_test_cmdline_name_bpp
[20:23:07] [PASSED] drm_test_cmdline_name_option
[20:23:07] [PASSED] drm_test_cmdline_name_bpp_option
[20:23:07] [PASSED] drm_test_cmdline_rotate_0
[20:23:07] [PASSED] drm_test_cmdline_rotate_90
[20:23:07] [PASSED] drm_test_cmdline_rotate_180
[20:23:07] [PASSED] drm_test_cmdline_rotate_270
[20:23:07] [PASSED] drm_test_cmdline_hmirror
[20:23:07] [PASSED] drm_test_cmdline_vmirror
[20:23:07] [PASSED] drm_test_cmdline_margin_options
[20:23:07] [PASSED] drm_test_cmdline_multiple_options
[20:23:07] [PASSED] drm_test_cmdline_bpp_extra_and_option
[20:23:07] [PASSED] drm_test_cmdline_extra_and_option
[20:23:07] [PASSED] drm_test_cmdline_freestanding_options
[20:23:07] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[20:23:07] [PASSED] drm_test_cmdline_panel_orientation
[20:23:07] ================ drm_test_cmdline_invalid  =================
[20:23:07] [PASSED] margin_only
[20:23:07] [PASSED] interlace_only
[20:23:07] [PASSED] res_missing_x
[20:23:07] [PASSED] res_missing_y
[20:23:07] [PASSED] res_bad_y
[20:23:07] [PASSED] res_missing_y_bpp
[20:23:07] [PASSED] res_bad_bpp
[20:23:07] [PASSED] res_bad_refresh
[20:23:07] [PASSED] res_bpp_refresh_force_on_off
[20:23:07] [PASSED] res_invalid_mode
[20:23:07] [PASSED] res_bpp_wrong_place_mode
[20:23:07] [PASSED] name_bpp_refresh
[20:23:07] [PASSED] name_refresh
[20:23:07] [PASSED] name_refresh_wrong_mode
[20:23:07] [PASSED] name_refresh_invalid_mode
[20:23:07] [PASSED] rotate_multiple
[20:23:07] [PASSED] rotate_invalid_val
[20:23:07] [PASSED] rotate_truncated
[20:23:07] [PASSED] invalid_option
[20:23:07] [PASSED] invalid_tv_option
[20:23:07] [PASSED] truncated_tv_option
[20:23:07] ============ [PASSED] drm_test_cmdline_invalid =============
[20:23:07] =============== drm_test_cmdline_tv_options  ===============
[20:23:07] [PASSED] NTSC
[20:23:07] [PASSED] NTSC_443
[20:23:07] [PASSED] NTSC_J
[20:23:07] [PASSED] PAL
[20:23:07] [PASSED] PAL_M
[20:23:07] [PASSED] PAL_N
[20:23:07] [PASSED] SECAM
[20:23:07] =========== [PASSED] drm_test_cmdline_tv_options ===========
[20:23:07] =============== [PASSED] drm_cmdline_parser ================
[20:23:07] ================ drm_get_tv_mode_from_name  ================
[20:23:07] ========== drm_test_get_tv_mode_from_name_valid  ===========
[20:23:07] [PASSED] NTSC
[20:23:07] [PASSED] NTSC-443
[20:23:07] [PASSED] NTSC-J
[20:23:07] [PASSED] PAL
[20:23:07] [PASSED] PAL-M
[20:23:07] [PASSED] PAL-N
[20:23:07] [PASSED] SECAM
[20:23:07] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[20:23:07] [PASSED] drm_test_get_tv_mode_from_name_truncated
[20:23:07] ============ [PASSED] drm_get_tv_mode_from_name ============
[20:23:07] ==================== drm_damage_helper  ====================
[20:23:07] [PASSED] drm_test_damage_iter_no_damage
[20:23:07] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[20:23:07] [PASSED] drm_test_damage_iter_no_damage_src_moved
[20:23:07] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[20:23:07] [PASSED] drm_test_damage_iter_no_damage_not_visible
[20:23:07] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[20:23:07] [PASSED] drm_test_damage_iter_no_damage_no_fb
[20:23:07] [PASSED] drm_test_damage_iter_simple_damage
[20:23:07] [PASSED] drm_test_damage_iter_single_damage
[20:23:07] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[20:23:07] [PASSED] drm_test_damage_iter_single_damage_outside_src
[20:23:07] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[20:23:07] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[20:23:07] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[20:23:07] [PASSED] drm_test_damage_iter_single_damage_src_moved
[20:23:07] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[20:23:07] [PASSED] drm_test_damage_iter_damage
[20:23:07] [PASSED] drm_test_damage_iter_damage_one_intersect
[20:23:07] [PASSED] drm_test_damage_iter_damage_one_outside
[20:23:07] [PASSED] drm_test_damage_iter_damage_src_moved
[20:23:07] [PASSED] drm_test_damage_iter_damage_not_visible
[20:23:07] ================ [PASSED] drm_damage_helper ================
[20:23:07] ==================== drm_dp_mst_helper  ====================
[20:23:07] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[20:23:07] [PASSED] Clock 154000 BPP 30 DSC disabled
[20:23:07] [PASSED] Clock 234000 BPP 30 DSC disabled
[20:23:07] [PASSED] Clock 297000 BPP 24 DSC disabled
[20:23:07] [PASSED] Clock 332880 BPP 24 DSC enabled
[20:23:07] [PASSED] Clock 324540 BPP 24 DSC enabled
[20:23:07] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[20:23:07] ============== drm_test_dp_mst_calc_pbn_div  ===============
[20:23:07] [PASSED] Link rate 2000000 lane count 4
[20:23:07] [PASSED] Link rate 2000000 lane count 2
[20:23:07] [PASSED] Link rate 2000000 lane count 1
[20:23:07] [PASSED] Link rate 1350000 lane count 4
[20:23:07] [PASSED] Link rate 1350000 lane count 2
[20:23:07] [PASSED] Link rate 1350000 lane count 1
[20:23:07] [PASSED] Link rate 1000000 lane count 4
[20:23:07] [PASSED] Link rate 1000000 lane count 2
[20:23:07] [PASSED] Link rate 1000000 lane count 1
[20:23:07] [PASSED] Link rate 810000 lane count 4
[20:23:07] [PASSED] Link rate 810000 lane count 2
[20:23:07] [PASSED] Link rate 810000 lane count 1
[20:23:07] [PASSED] Link rate 540000 lane count 4
[20:23:07] [PASSED] Link rate 540000 lane count 2
[20:23:07] [PASSED] Link rate 540000 lane count 1
[20:23:07] [PASSED] Link rate 270000 lane count 4
[20:23:07] [PASSED] Link rate 270000 lane count 2
[20:23:07] [PASSED] Link rate 270000 lane count 1
[20:23:07] [PASSED] Link rate 162000 lane count 4
[20:23:07] [PASSED] Link rate 162000 lane count 2
[20:23:07] [PASSED] Link rate 162000 lane count 1
[20:23:07] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[20:23:07] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[20:23:07] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[20:23:07] [PASSED] DP_POWER_UP_PHY with port number
[20:23:07] [PASSED] DP_POWER_DOWN_PHY with port number
[20:23:07] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[20:23:07] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[20:23:07] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[20:23:07] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[20:23:07] [PASSED] DP_QUERY_PAYLOAD with port number
[20:23:07] [PASSED] DP_QUERY_PAYLOAD with VCPI
[20:23:07] [PASSED] DP_REMOTE_DPCD_READ with port number
[20:23:07] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[20:23:07] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[20:23:07] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[20:23:07] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[20:23:07] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[20:23:07] [PASSED] DP_REMOTE_I2C_READ with port number
[20:23:07] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[20:23:07] [PASSED] DP_REMOTE_I2C_READ with transactions array
[20:23:07] [PASSED] DP_REMOTE_I2C_WRITE with port number
[20:23:07] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[20:23:07] [PASSED] DP_REMOTE_I2C_WRITE with data array
[20:23:07] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[20:23:07] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[20:23:07] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[20:23:07] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[20:23:07] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[20:23:07] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[20:23:07] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[20:23:07] ================ [PASSED] drm_dp_mst_helper ================
[20:23:07] ======================== drm_exec  =========================
[20:23:07] [PASSED] sanitycheck
[20:23:07] [PASSED] test_lock
[20:23:07] [PASSED] test_lock_unlock
[20:23:07] [PASSED] test_duplicates
[20:23:07] [PASSED] test_prepare
[20:23:07] [PASSED] test_prepare_array
[20:23:07] [PASSED] test_multiple_loops
[20:23:07] ==================== [PASSED] drm_exec =====================
[20:23:07] ================= drm_format_helper_test  ==================
[20:23:07] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[20:23:07] [PASSED] single_pixel_source_buffer
[20:23:07] [PASSED] single_pixel_clip_rectangle
[20:23:07] [PASSED] well_known_colors
[20:23:07] [PASSED] destination_pitch
[20:23:07] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[20:23:07] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[20:23:07] [PASSED] single_pixel_source_buffer
[20:23:07] [PASSED] single_pixel_clip_rectangle
[20:23:07] [PASSED] well_known_colors
[20:23:07] [PASSED] destination_pitch
[20:23:07] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[20:23:07] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[20:23:07] [PASSED] single_pixel_source_buffer
[20:23:07] [PASSED] single_pixel_clip_rectangle
[20:23:07] [PASSED] well_known_colors
[20:23:07] [PASSED] destination_pitch
[20:23:07] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[20:23:07] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[20:23:07] [PASSED] single_pixel_source_buffer
[20:23:07] [PASSED] single_pixel_clip_rectangle
[20:23:07] [PASSED] well_known_colors
[20:23:07] [PASSED] destination_pitch
[20:23:07] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[20:23:07] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[20:23:07] [PASSED] single_pixel_source_buffer
[20:23:07] [PASSED] single_pixel_clip_rectangle
[20:23:07] [PASSED] well_known_colors
[20:23:07] [PASSED] destination_pitch
[20:23:07] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[20:23:07] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[20:23:07] [PASSED] single_pixel_source_buffer
[20:23:07] [PASSED] single_pixel_clip_rectangle
[20:23:07] [PASSED] well_known_colors
[20:23:07] [PASSED] destination_pitch
[20:23:07] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[20:23:07] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[20:23:07] [PASSED] single_pixel_source_buffer
[20:23:07] [PASSED] single_pixel_clip_rectangle
[20:23:07] [PASSED] well_known_colors
[20:23:07] [PASSED] destination_pitch
[20:23:07] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[20:23:07] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[20:23:07] [PASSED] single_pixel_source_buffer
[20:23:07] [PASSED] single_pixel_clip_rectangle
[20:23:07] [PASSED] well_known_colors
[20:23:07] [PASSED] destination_pitch
[20:23:07] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[20:23:07] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[20:23:07] [PASSED] single_pixel_source_buffer
[20:23:07] [PASSED] single_pixel_clip_rectangle
[20:23:07] [PASSED] well_known_colors
[20:23:07] [PASSED] destination_pitch
[20:23:07] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[20:23:07] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[20:23:07] [PASSED] single_pixel_source_buffer
[20:23:07] [PASSED] single_pixel_clip_rectangle
[20:23:07] [PASSED] well_known_colors
[20:23:07] [PASSED] destination_pitch
[20:23:07] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[20:23:07] ============== drm_test_fb_xrgb8888_to_mono  ===============
[20:23:07] [PASSED] single_pixel_source_buffer
[20:23:07] [PASSED] single_pixel_clip_rectangle
[20:23:07] [PASSED] well_known_colors
[20:23:07] [PASSED] destination_pitch
[20:23:07] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[20:23:07] ==================== drm_test_fb_swab  =====================
[20:23:07] [PASSED] single_pixel_source_buffer
[20:23:07] [PASSED] single_pixel_clip_rectangle
[20:23:07] [PASSED] well_known_colors
[20:23:07] [PASSED] destination_pitch
[20:23:07] ================ [PASSED] drm_test_fb_swab =================
[20:23:07] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[20:23:07] [PASSED] single_pixel_source_buffer
[20:23:07] [PASSED] single_pixel_clip_rectangle
[20:23:07] [PASSED] well_known_colors
[20:23:07] [PASSED] destination_pitch
[20:23:07] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[20:23:07] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[20:23:07] [PASSED] single_pixel_source_buffer
[20:23:07] [PASSED] single_pixel_clip_rectangle
[20:23:07] [PASSED] well_known_colors
[20:23:07] [PASSED] destination_pitch
[20:23:07] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[20:23:07] ================= drm_test_fb_clip_offset  =================
[20:23:07] [PASSED] pass through
[20:23:07] [PASSED] horizontal offset
[20:23:07] [PASSED] vertical offset
[20:23:07] [PASSED] horizontal and vertical offset
[20:23:07] [PASSED] horizontal offset (custom pitch)
[20:23:07] [PASSED] vertical offset (custom pitch)
[20:23:07] [PASSED] horizontal and vertical offset (custom pitch)
[20:23:07] ============= [PASSED] drm_test_fb_clip_offset =============
[20:23:07] ============== drm_test_fb_build_fourcc_list  ==============
[20:23:07] [PASSED] no native formats
[20:23:07] [PASSED] XRGB8888 as native format
[20:23:07] [PASSED] remove duplicates
[20:23:07] [PASSED] convert alpha formats
[20:23:07] [PASSED] random formats
[20:23:07] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[20:23:07] =================== drm_test_fb_memcpy  ====================
[20:23:07] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[20:23:07] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[20:23:07] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[20:23:07] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[20:23:07] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[20:23:07] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[20:23:07] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[20:23:07] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[20:23:07] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[20:23:07] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[20:23:07] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[20:23:07] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[20:23:07] =============== [PASSED] drm_test_fb_memcpy ================
[20:23:07] ============= [PASSED] drm_format_helper_test ==============
[20:23:07] ======================= drm_format  ========================
[20:23:07] [PASSED] drm_test_format_block_width_invalid
[20:23:07] [PASSED] drm_test_format_block_width_one_plane
[20:23:07] [PASSED] drm_test_format_block_width_two_plane
[20:23:07] [PASSED] drm_test_format_block_width_three_plane
[20:23:07] [PASSED] drm_test_format_block_width_tiled
[20:23:07] [PASSED] drm_test_format_block_height_invalid
[20:23:07] [PASSED] drm_test_format_block_height_one_plane
[20:23:07] [PASSED] drm_test_format_block_height_two_plane
[20:23:07] [PASSED] drm_test_format_block_height_three_plane
[20:23:07] [PASSED] drm_test_format_block_height_tiled
[20:23:07] [PASSED] drm_test_format_min_pitch_invalid
[20:23:07] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[20:23:07] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[20:23:07] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[20:23:07] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[20:23:07] [PASSED] drm_test_format_min_pitch_two_plane
[20:23:07] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[20:23:07] [PASSED] drm_test_format_min_pitch_tiled
[20:23:07] =================== [PASSED] drm_format ====================
[20:23:07] ===================== drm_framebuffer  =====================
[20:23:07] =============== drm_test_framebuffer_create  ===============
[20:23:07] [PASSED] ABGR8888 normal sizes
[20:23:07] [PASSED] ABGR8888 max sizes
[20:23:07] [PASSED] ABGR8888 pitch greater than min required
[20:23:07] [PASSED] ABGR8888 pitch less than min required
[20:23:07] [PASSED] ABGR8888 Invalid width
[20:23:07] [PASSED] ABGR8888 Invalid buffer handle
[20:23:07] [PASSED] No pixel format
[20:23:07] [PASSED] ABGR8888 Width 0
[20:23:07] [PASSED] ABGR8888 Height 0
[20:23:07] [PASSED] ABGR8888 Out of bound height * pitch combination
[20:23:07] [PASSED] ABGR8888 Large buffer offset
[20:23:07] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[20:23:07] [PASSED] ABGR8888 Valid buffer modifier
[20:23:07] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[20:23:07] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[20:23:07] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[20:23:07] [PASSED] NV12 Normal sizes
[20:23:07] [PASSED] NV12 Max sizes
[20:23:07] [PASSED] NV12 Invalid pitch
[20:23:07] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[20:23:07] [PASSED] NV12 different  modifier per-plane
[20:23:07] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[20:23:07] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[20:23:07] [PASSED] NV12 Modifier for inexistent plane
[20:23:07] [PASSED] NV12 Handle for inexistent plane
[20:23:07] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[20:23:07] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[20:23:07] [PASSED] YVU420 Normal sizes
[20:23:07] [PASSED] YVU420 Max sizes
[20:23:07] [PASSED] YVU420 Invalid pitch
[20:23:07] [PASSED] YVU420 Different pitches
[20:23:07] [PASSED] YVU420 Different buffer offsets/pitches
[20:23:07] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[20:23:07] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[20:23:07] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[20:23:07] [PASSED] YVU420 Valid modifier
[20:23:07] [PASSED] YVU420 Different modifiers per plane
[20:23:07] [PASSED] YVU420 Modifier for inexistent plane
[20:23:07] [PASSED] X0L2 Normal sizes
[20:23:07] [PASSED] X0L2 Max sizes
[20:23:07] [PASSED] X0L2 Invalid pitch
[20:23:07] [PASSED] X0L2 Pitch greater than minimum required
[20:23:07] [PASSED] X0L2 Handle for inexistent plane
[20:23:07] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[20:23:07] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[20:23:07] [PASSED] X0L2 Valid modifier
[20:23:07] [PASSED] X0L2 Modifier for inexistent plane
[20:23:07] =========== [PASSED] drm_test_framebuffer_create ===========
[20:23:07] ================= [PASSED] drm_framebuffer =================
[20:23:07] ====================== drm_gem_shmem  ======================
[20:23:07] [PASSED] drm_gem_shmem_test_obj_create
[20:23:07] [PASSED] drm_gem_shmem_test_obj_create_private
[20:23:07] [PASSED] drm_gem_shmem_test_pin_pages
[20:23:07] [PASSED] drm_gem_shmem_test_vmap
[20:23:07] [PASSED] drm_gem_shmem_test_get_pages_sgt
[20:23:07] [PASSED] drm_gem_shmem_test_get_sg_table
[20:23:07] [PASSED] drm_gem_shmem_test_madvise
[20:23:07] [PASSED] drm_gem_shmem_test_purge
[20:23:07] ================== [PASSED] drm_gem_shmem ==================
[20:23:07] ==================== drm-test-managed  =====================
[20:23:07] [PASSED] drm_test_managed_run_action
[20:23:07] ================ [PASSED] drm-test-managed =================
[20:23:07] ========================= drm_mm  ==========================
[20:23:07] [PASSED] drm_test_mm_init
[20:23:07] [PASSED] drm_test_mm_debug
[20:23:07] [PASSED] drm_test_mm_align32
[20:23:07] [PASSED] drm_test_mm_align64
[20:23:07] [PASSED] drm_test_mm_lowest
[20:23:07] [PASSED] drm_test_mm_highest
[20:23:07] ===================== [PASSED] drm_mm ======================
[20:23:07] =================== drm_modes_analog_tv  ===================
[20:23:07] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[20:23:07] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[20:23:07] [PASSED] drm_test_modes_analog_tv_pal_576i
[20:23:07] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[20:23:07] =============== [PASSED] drm_modes_analog_tv ===============
[20:23:07] ==================== drm_plane_helper  =====================
[20:23:07] =============== drm_test_check_plane_state  ================
[20:23:07] [PASSED] clipping_simple
[20:23:07] [PASSED] clipping_rotate_reflect
[20:23:07] [PASSED] positioning_simple
[20:23:07] [PASSED] upscaling
[20:23:07] [PASSED] downscaling
[20:23:07] [PASSED] rounding1
[20:23:07] [PASSED] rounding2
[20:23:07] [PASSED] rounding3
[20:23:07] [PASSED] rounding4
[20:23:07] =========== [PASSED] drm_test_check_plane_state ============
[20:23:07] =========== drm_test_check_invalid_plane_state  ============
[20:23:07] [PASSED] positioning_invalid
[20:23:07] [PASSED] upscaling_invalid
[20:23:07] [PASSED] downscaling_invalid
[20:23:07] ======= [PASSED] drm_test_check_invalid_plane_state ========
[20:23:07] ================ [PASSED] drm_plane_helper =================
[20:23:07] ============ drm_connector_helper_tv_get_modes  ============
[20:23:07] ====== drm_test_connector_helper_tv_get_modes_check  =======
[20:23:07] [PASSED] None
[20:23:07] [PASSED] PAL
[20:23:07] [PASSED] NTSC
[20:23:07] [PASSED] Both, NTSC Default
[20:23:07] [PASSED] Both, PAL Default
[20:23:07] [PASSED] Both, NTSC Default, with PAL on command-line
[20:23:07] [PASSED] Both, PAL Default, with NTSC on command-line
[20:23:07] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[20:23:07] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[20:23:07] ======================== drm_rect  =========================
[20:23:07] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[20:23:07] [PASSED] drm_test_rect_clip_scaled_not_clipped
[20:23:07] [PASSED] drm_test_rect_clip_scaled_clipped
[20:23:07] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[20:23:07] ================= drm_test_rect_intersect  =================
[20:23:07] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[20:23:07] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
stty: 'standard input': Inappropriate ioctl for device
[20:23:07] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[20:23:07] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[20:23:07] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[20:23:07] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[20:23:07] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[20:23:07] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[20:23:07] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[20:23:07] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[20:23:07] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[20:23:07] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[20:23:07] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[20:23:07] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[20:23:07] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[20:23:07] ============= [PASSED] drm_test_rect_intersect =============
[20:23:07] ================ drm_test_rect_calc_hscale  ================
[20:23:07] [PASSED] normal use
[20:23:07] [PASSED] out of max range
[20:23:07] [PASSED] out of min range
[20:23:07] [PASSED] zero dst
[20:23:07] [PASSED] negative src
[20:23:07] [PASSED] negative dst
[20:23:07] ============ [PASSED] drm_test_rect_calc_hscale ============
[20:23:07] ================ drm_test_rect_calc_vscale  ================
[20:23:07] [PASSED] normal use
[20:23:07] [PASSED] out of max range
[20:23:07] [PASSED] out of min range
[20:23:07] [PASSED] zero dst
[20:23:07] [PASSED] negative src
[20:23:07] [PASSED] negative dst
[20:23:07] ============ [PASSED] drm_test_rect_calc_vscale ============
[20:23:07] ================== drm_test_rect_rotate  ===================
[20:23:07] [PASSED] reflect-x
[20:23:07] [PASSED] reflect-y
[20:23:07] [PASSED] rotate-0
[20:23:07] [PASSED] rotate-90
[20:23:07] [PASSED] rotate-180
[20:23:07] [PASSED] rotate-270
[20:23:07] ============== [PASSED] drm_test_rect_rotate ===============
[20:23:07] ================ drm_test_rect_rotate_inv  =================
[20:23:07] [PASSED] reflect-x
[20:23:07] [PASSED] reflect-y
[20:23:07] [PASSED] rotate-0
[20:23:07] [PASSED] rotate-90
[20:23:07] [PASSED] rotate-180
[20:23:07] [PASSED] rotate-270
[20:23:07] ============ [PASSED] drm_test_rect_rotate_inv =============
[20:23:07] ==================== [PASSED] drm_rect =====================
[20:23:07] ============================================================
[20:23:07] Testing complete. Ran 390 tests: passed: 390
[20:23:07] Elapsed time: 22.155s total, 1.648s configuring, 20.382s building, 0.122s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


