Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA87C4706F
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 04:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF3410E385;
	Thu,  4 Jan 2024 04:53:53 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FBF10E034;
 Thu,  4 Jan 2024 04:53:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/display=3A_fix_type_of_?=
 =?utf-8?q?intel=5Funcore=5Fread*=28=29_functions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Coelho, Luciano" <luciano.coelho@intel.com>
Date: Thu, 04 Jan 2024 04:53:51 -0000
Message-ID: <170434403134.1840.17574150949786937215@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20231228110526.383245-1-luciano.coelho@intel.com>
In-Reply-To: <20231228110526.383245-1-luciano.coelho@intel.com>
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

Series: drm/xe/display: fix type of intel_uncore_read*() functions
URL   : https://patchwork.freedesktop.org/series/128054/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[04:52:59] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:53:03] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[04:53:27] Starting KUnit Kernel (1/1)...
[04:53:27] ============================================================
[04:53:27] ========================= guc_dbm  =========================
[04:53:27] [PASSED] test_empty
[04:53:27] [PASSED] test_default
[04:53:27] ======================== test_size  ========================
[04:53:27] [PASSED] 4
[04:53:27] [PASSED] 8
[04:53:27] [PASSED] 32
[04:53:27] [PASSED] 256
[04:53:27] ==================== [PASSED] test_size ====================
[04:53:27] ======================= test_reuse  ========================
[04:53:27] [PASSED] 4
[04:53:27] [PASSED] 8
[04:53:27] [PASSED] 32
[04:53:27] [PASSED] 256
[04:53:27] =================== [PASSED] test_reuse ====================
[04:53:27] =================== test_range_overlap  ====================
[04:53:27] [PASSED] 4
[04:53:27] [PASSED] 8
[04:53:27] [PASSED] 32
[04:53:27] [PASSED] 256
[04:53:27] =============== [PASSED] test_range_overlap ================
[04:53:27] =================== test_range_compact  ====================
[04:53:27] [PASSED] 4
[04:53:27] [PASSED] 8
[04:53:27] [PASSED] 32
[04:53:27] [PASSED] 256
[04:53:27] =============== [PASSED] test_range_compact ================
[04:53:27] ==================== test_range_spare  =====================
[04:53:27] [PASSED] 4
[04:53:27] [PASSED] 8
[04:53:27] [PASSED] 32
[04:53:27] [PASSED] 256
[04:53:27] ================ [PASSED] test_range_spare =================
[04:53:27] ===================== [PASSED] guc_dbm =====================
[04:53:27] ========================== lmtt  ===========================
[04:53:27] ======================== test_ops  =========================
[04:53:27] [PASSED] 2-level
[04:53:27] [PASSED] multi-level
[04:53:27] ==================== [PASSED] test_ops =====================
[04:53:27] ====================== [PASSED] lmtt =======================
[04:53:27] ========================== xe_bo  ==========================
[04:53:27] [SKIPPED] xe_ccs_migrate_kunit
[04:53:27] [SKIPPED] xe_bo_evict_kunit
[04:53:27] ===================== [SKIPPED] xe_bo ======================
[04:53:27] ======================= xe_dma_buf  ========================
[04:53:27] [SKIPPED] xe_dma_buf_kunit
[04:53:27] =================== [SKIPPED] xe_dma_buf ===================
[04:53:27] ======================= xe_migrate  ========================
[04:53:27] [SKIPPED] xe_migrate_sanity_kunit
[04:53:27] =================== [SKIPPED] xe_migrate ===================
[04:53:27] ========================= xe_mocs  =========================
[04:53:27] [SKIPPED] xe_live_mocs_kernel_kunit
[04:53:27] ==================== [SKIPPED] xe_mocs =====================
[04:53:27] ========================= xe_pci  ==========================
[04:53:27] [PASSED] xe_gmdid_graphics_ip
[04:53:27] [PASSED] xe_gmdid_media_ip
[04:53:27] ===================== [PASSED] xe_pci ======================
[04:53:27] ========================= xe_rtp  ==========================
[04:53:27] ================== xe_rtp_process_tests  ===================
[04:53:27] [PASSED] coalesce-same-reg
[04:53:27] [PASSED] no-match-no-add
[04:53:27] [PASSED] no-match-no-add-multiple-rules
[04:53:27] [PASSED] two-regs-two-entries
[04:53:27] [PASSED] clr-one-set-other
[04:53:27] [PASSED] set-field
[04:53:27] [PASSED] conflict-duplicate
[04:53:27] [PASSED] conflict-not-disjoint
[04:53:27] [PASSED] conflict-reg-type
[04:53:27] ============== [PASSED] xe_rtp_process_tests ===============
[04:53:27] ===================== [PASSED] xe_rtp ======================
[04:53:27] ========================== xe_wa  ==========================
[04:53:27] ======================== xe_wa_gt  =========================
[04:53:27] [PASSED] TIGERLAKE (B0)
[04:53:27] [PASSED] DG1 (A0)
[04:53:27] [PASSED] DG1 (B0)
[04:53:27] [PASSED] ALDERLAKE_S (A0)
[04:53:27] [PASSED] ALDERLAKE_S (B0)
[04:53:27] [PASSED] ALDERLAKE_S (C0)
[04:53:27] [PASSED] ALDERLAKE_S (D0)
[04:53:27] [PASSED] ALDERLAKE_P (A0)
[04:53:27] [PASSED] ALDERLAKE_P (B0)
[04:53:27] [PASSED] ALDERLAKE_P (C0)
[04:53:27] [PASSED] ALDERLAKE_S_RPLS (D0)
[04:53:27] [PASSED] ALDERLAKE_P_RPLU (E0)
[04:53:27] [PASSED] DG2_G10 (A0)
[04:53:27] [PASSED] DG2_G10 (A1)
[04:53:27] [PASSED] DG2_G10 (B0)
[04:53:27] [PASSED] DG2_G10 (C0)
[04:53:27] [PASSED] DG2_G11 (A0)
[04:53:27] [PASSED] DG2_G11 (B0)
[04:53:27] [PASSED] DG2_G11 (B1)
[04:53:27] [PASSED] DG2_G12 (A0)
[04:53:27] [PASSED] DG2_G12 (A1)
[04:53:27] [PASSED] PVC (B0)
[04:53:27] [PASSED] PVC (B1)
[04:53:27] [PASSED] PVC (C0)
[04:53:27] [PASSED] METEORLAKE (g:A0, m:A0)
[04:53:27] [PASSED] METEORLAKE (g:A0, m:A0)
[04:53:27] [PASSED] LUNARLAKE (g:A0, m:A0)
[04:53:27] [PASSED] LUNARLAKE (g:B0, m:A0)
[04:53:27] ==================== [PASSED] xe_wa_gt =====================
[04:53:27] ====================== [PASSED] xe_wa ======================
[04:53:27] ============================================================
[04:53:27] Testing complete. Ran 68 tests: passed: 63, skipped: 5
[04:53:27] Elapsed time: 27.594s total, 4.146s configuring, 23.228s building, 0.178s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[04:53:27] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:53:29] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[04:53:48] Starting KUnit Kernel (1/1)...
[04:53:48] ============================================================
[04:53:49] ================== drm_test_pick_cmdline  ==================
[04:53:49] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[04:53:49] =============== drm_test_pick_cmdline_named  ===============
[04:53:49] [PASSED] NTSC
[04:53:49] [PASSED] NTSC-J
[04:53:49] [PASSED] PAL
[04:53:49] [PASSED] PAL-M
[04:53:49] =========== [PASSED] drm_test_pick_cmdline_named ===========
[04:53:49] ============== [PASSED] drm_test_pick_cmdline ==============
[04:53:49] ======================== drm_buddy  ========================
[04:53:49] [PASSED] drm_test_buddy_alloc_limit
[04:53:49] [PASSED] drm_test_buddy_alloc_optimistic
[04:53:49] [PASSED] drm_test_buddy_alloc_pessimistic
[04:53:49] [PASSED] drm_test_buddy_alloc_pathological
[04:53:49] ==================== [PASSED] drm_buddy ====================
[04:53:49] =================== drm_cmdline_parser  ====================
[04:53:49] [PASSED] drm_test_cmdline_force_d_only
[04:53:49] [PASSED] drm_test_cmdline_force_D_only_dvi
[04:53:49] [PASSED] drm_test_cmdline_force_D_only_hdmi
[04:53:49] [PASSED] drm_test_cmdline_force_D_only_not_digital
[04:53:49] [PASSED] drm_test_cmdline_force_e_only
[04:53:49] [PASSED] drm_test_cmdline_res
[04:53:49] [PASSED] drm_test_cmdline_res_vesa
[04:53:49] [PASSED] drm_test_cmdline_res_vesa_rblank
[04:53:49] [PASSED] drm_test_cmdline_res_rblank
[04:53:49] [PASSED] drm_test_cmdline_res_bpp
[04:53:49] [PASSED] drm_test_cmdline_res_refresh
[04:53:49] [PASSED] drm_test_cmdline_res_bpp_refresh
[04:53:49] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[04:53:49] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[04:53:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[04:53:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[04:53:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[04:53:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[04:53:49] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[04:53:49] [PASSED] drm_test_cmdline_res_margins_force_on
[04:53:49] [PASSED] drm_test_cmdline_res_vesa_margins
[04:53:49] [PASSED] drm_test_cmdline_name
[04:53:49] [PASSED] drm_test_cmdline_name_bpp
[04:53:49] [PASSED] drm_test_cmdline_name_option
[04:53:49] [PASSED] drm_test_cmdline_name_bpp_option
[04:53:49] [PASSED] drm_test_cmdline_rotate_0
[04:53:49] [PASSED] drm_test_cmdline_rotate_90
[04:53:49] [PASSED] drm_test_cmdline_rotate_180
[04:53:49] [PASSED] drm_test_cmdline_rotate_270
[04:53:49] [PASSED] drm_test_cmdline_hmirror
[04:53:49] [PASSED] drm_test_cmdline_vmirror
[04:53:49] [PASSED] drm_test_cmdline_margin_options
[04:53:49] [PASSED] drm_test_cmdline_multiple_options
[04:53:49] [PASSED] drm_test_cmdline_bpp_extra_and_option
[04:53:49] [PASSED] drm_test_cmdline_extra_and_option
[04:53:49] [PASSED] drm_test_cmdline_freestanding_options
[04:53:49] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[04:53:49] [PASSED] drm_test_cmdline_panel_orientation
[04:53:49] ================ drm_test_cmdline_invalid  =================
[04:53:49] [PASSED] margin_only
[04:53:49] [PASSED] interlace_only
[04:53:49] [PASSED] res_missing_x
[04:53:49] [PASSED] res_missing_y
[04:53:49] [PASSED] res_bad_y
[04:53:49] [PASSED] res_missing_y_bpp
[04:53:49] [PASSED] res_bad_bpp
[04:53:49] [PASSED] res_bad_refresh
[04:53:49] [PASSED] res_bpp_refresh_force_on_off
[04:53:49] [PASSED] res_invalid_mode
[04:53:49] [PASSED] res_bpp_wrong_place_mode
[04:53:49] [PASSED] name_bpp_refresh
[04:53:49] [PASSED] name_refresh
[04:53:49] [PASSED] name_refresh_wrong_mode
[04:53:49] [PASSED] name_refresh_invalid_mode
[04:53:49] [PASSED] rotate_multiple
[04:53:49] [PASSED] rotate_invalid_val
[04:53:49] [PASSED] rotate_truncated
[04:53:49] [PASSED] invalid_option
[04:53:49] [PASSED] invalid_tv_option
[04:53:49] [PASSED] truncated_tv_option
[04:53:49] ============ [PASSED] drm_test_cmdline_invalid =============
[04:53:49] =============== drm_test_cmdline_tv_options  ===============
[04:53:49] [PASSED] NTSC
[04:53:49] [PASSED] NTSC_443
[04:53:49] [PASSED] NTSC_J
[04:53:49] [PASSED] PAL
[04:53:49] [PASSED] PAL_M
[04:53:49] [PASSED] PAL_N
[04:53:49] [PASSED] SECAM
[04:53:49] =========== [PASSED] drm_test_cmdline_tv_options ===========
[04:53:49] =============== [PASSED] drm_cmdline_parser ================
[04:53:49] ================ drm_get_tv_mode_from_name  ================
[04:53:49] ========== drm_test_get_tv_mode_from_name_valid  ===========
[04:53:49] [PASSED] NTSC
[04:53:49] [PASSED] NTSC-443
[04:53:49] [PASSED] NTSC-J
[04:53:49] [PASSED] PAL
[04:53:49] [PASSED] PAL-M
[04:53:49] [PASSED] PAL-N
[04:53:49] [PASSED] SECAM
[04:53:49] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[04:53:49] [PASSED] drm_test_get_tv_mode_from_name_truncated
[04:53:49] ============ [PASSED] drm_get_tv_mode_from_name ============
[04:53:49] ==================== drm_damage_helper  ====================
[04:53:49] [PASSED] drm_test_damage_iter_no_damage
[04:53:49] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[04:53:49] [PASSED] drm_test_damage_iter_no_damage_src_moved
[04:53:49] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[04:53:49] [PASSED] drm_test_damage_iter_no_damage_not_visible
[04:53:49] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[04:53:49] [PASSED] drm_test_damage_iter_no_damage_no_fb
[04:53:49] [PASSED] drm_test_damage_iter_simple_damage
[04:53:49] [PASSED] drm_test_damage_iter_single_damage
[04:53:49] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[04:53:49] [PASSED] drm_test_damage_iter_single_damage_outside_src
[04:53:49] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[04:53:49] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[04:53:49] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[04:53:49] [PASSED] drm_test_damage_iter_single_damage_src_moved
[04:53:49] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[04:53:49] [PASSED] drm_test_damage_iter_damage
[04:53:49] [PASSED] drm_test_damage_iter_damage_one_intersect
[04:53:49] [PASSED] drm_test_damage_iter_damage_one_outside
[04:53:49] [PASSED] drm_test_damage_iter_damage_src_moved
[04:53:49] [PASSED] drm_test_damage_iter_damage_not_visible
[04:53:49] ================ [PASSED] drm_damage_helper ================
[04:53:49] ==================== drm_dp_mst_helper  ====================
[04:53:49] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[04:53:49] [PASSED] Clock 154000 BPP 30 DSC disabled
[04:53:49] [PASSED] Clock 234000 BPP 30 DSC disabled
[04:53:49] [PASSED] Clock 297000 BPP 24 DSC disabled
[04:53:49] [PASSED] Clock 332880 BPP 24 DSC enabled
[04:53:49] [PASSED] Clock 324540 BPP 24 DSC enabled
[04:53:49] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[04:53:49] ============== drm_test_dp_mst_calc_pbn_div  ===============
[04:53:49] [PASSED] Link rate 2000000 lane count 4
[04:53:49] [PASSED] Link rate 2000000 lane count 2
[04:53:49] [PASSED] Link rate 2000000 lane count 1
[04:53:49] [PASSED] Link rate 1350000 lane count 4
[04:53:49] [PASSED] Link rate 1350000 lane count 2
[04:53:49] [PASSED] Link rate 1350000 lane count 1
[04:53:49] [PASSED] Link rate 1000000 lane count 4
[04:53:49] [PASSED] Link rate 1000000 lane count 2
[04:53:49] [PASSED] Link rate 1000000 lane count 1
[04:53:49] [PASSED] Link rate 810000 lane count 4
[04:53:49] [PASSED] Link rate 810000 lane count 2
[04:53:49] [PASSED] Link rate 810000 lane count 1
[04:53:49] [PASSED] Link rate 540000 lane count 4
[04:53:49] [PASSED] Link rate 540000 lane count 2
[04:53:49] [PASSED] Link rate 540000 lane count 1
[04:53:49] [PASSED] Link rate 270000 lane count 4
[04:53:49] [PASSED] Link rate 270000 lane count 2
[04:53:49] [PASSED] Link rate 270000 lane count 1
[04:53:49] [PASSED] Link rate 162000 lane count 4
[04:53:49] [PASSED] Link rate 162000 lane count 2
[04:53:49] [PASSED] Link rate 162000 lane count 1
[04:53:49] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[04:53:49] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[04:53:49] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[04:53:49] [PASSED] DP_POWER_UP_PHY with port number
[04:53:49] [PASSED] DP_POWER_DOWN_PHY with port number
[04:53:49] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[04:53:49] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[04:53:49] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[04:53:49] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[04:53:49] [PASSED] DP_QUERY_PAYLOAD with port number
[04:53:49] [PASSED] DP_QUERY_PAYLOAD with VCPI
[04:53:49] [PASSED] DP_REMOTE_DPCD_READ with port number
[04:53:49] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[04:53:49] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[04:53:49] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[04:53:49] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[04:53:49] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[04:53:49] [PASSED] DP_REMOTE_I2C_READ with port number
[04:53:49] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[04:53:49] [PASSED] DP_REMOTE_I2C_READ with transactions array
[04:53:49] [PASSED] DP_REMOTE_I2C_WRITE with port number
[04:53:49] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[04:53:49] [PASSED] DP_REMOTE_I2C_WRITE with data array
[04:53:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[04:53:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[04:53:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[04:53:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[04:53:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[04:53:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[04:53:49] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[04:53:49] ================ [PASSED] drm_dp_mst_helper ================
[04:53:49] ======================== drm_exec  =========================
[04:53:49] [PASSED] sanitycheck
[04:53:49] [PASSED] test_lock
[04:53:49] [PASSED] test_lock_unlock
[04:53:49] [PASSED] test_duplicates
[04:53:49] [PASSED] test_prepare
[04:53:49] [PASSED] test_prepare_array
[04:53:49] [PASSED] test_multiple_loops
[04:53:49] ==================== [PASSED] drm_exec =====================
[04:53:49] ================= drm_format_helper_test  ==================
[04:53:49] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[04:53:49] [PASSED] single_pixel_source_buffer
[04:53:49] [PASSED] single_pixel_clip_rectangle
[04:53:49] [PASSED] well_known_colors
[04:53:49] [PASSED] destination_pitch
[04:53:49] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[04:53:49] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[04:53:49] [PASSED] single_pixel_source_buffer
[04:53:49] [PASSED] single_pixel_clip_rectangle
[04:53:49] [PASSED] well_known_colors
[04:53:49] [PASSED] destination_pitch
[04:53:49] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[04:53:49] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[04:53:49] [PASSED] single_pixel_source_buffer
[04:53:49] [PASSED] single_pixel_clip_rectangle
[04:53:49] [PASSED] well_known_colors
[04:53:49] [PASSED] destination_pitch
[04:53:49] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[04:53:49] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[04:53:49] [PASSED] single_pixel_source_buffer
[04:53:49] [PASSED] single_pixel_clip_rectangle
[04:53:49] [PASSED] well_known_colors
[04:53:49] [PASSED] destination_pitch
[04:53:49] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[04:53:49] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[04:53:49] [PASSED] single_pixel_source_buffer
[04:53:49] [PASSED] single_pixel_clip_rectangle
[04:53:49] [PASSED] well_known_colors
[04:53:49] [PASSED] destination_pitch
[04:53:49] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[04:53:49] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[04:53:49] [PASSED] single_pixel_source_buffer
[04:53:49] [PASSED] single_pixel_clip_rectangle
[04:53:49] [PASSED] well_known_colors
[04:53:49] [PASSED] destination_pitch
[04:53:49] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[04:53:49] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[04:53:49] [PASSED] single_pixel_source_buffer
[04:53:49] [PASSED] single_pixel_clip_rectangle
[04:53:49] [PASSED] well_known_colors
[04:53:49] [PASSED] destination_pitch
[04:53:49] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[04:53:49] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[04:53:49] [PASSED] single_pixel_source_buffer
[04:53:49] [PASSED] single_pixel_clip_rectangle
[04:53:49] [PASSED] well_known_colors
[04:53:49] [PASSED] destination_pitch
[04:53:49] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[04:53:49] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[04:53:49] [PASSED] single_pixel_source_buffer
[04:53:49] [PASSED] single_pixel_clip_rectangle
[04:53:49] [PASSED] well_known_colors
[04:53:49] [PASSED] destination_pitch
[04:53:49] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[04:53:49] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[04:53:49] [PASSED] single_pixel_source_buffer
[04:53:49] [PASSED] single_pixel_clip_rectangle
[04:53:49] [PASSED] well_known_colors
[04:53:49] [PASSED] destination_pitch
[04:53:49] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[04:53:49] ============== drm_test_fb_xrgb8888_to_mono  ===============
[04:53:49] [PASSED] single_pixel_source_buffer
[04:53:49] [PASSED] single_pixel_clip_rectangle
[04:53:49] [PASSED] well_known_colors
[04:53:49] [PASSED] destination_pitch
[04:53:49] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[04:53:49] ==================== drm_test_fb_swab  =====================
[04:53:49] [PASSED] single_pixel_source_buffer
[04:53:49] [PASSED] single_pixel_clip_rectangle
[04:53:49] [PASSED] well_known_colors
[04:53:49] [PASSED] destination_pitch
[04:53:49] ================ [PASSED] drm_test_fb_swab =================
[04:53:49] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[04:53:49] [PASSED] single_pixel_source_buffer
[04:53:49] [PASSED] single_pixel_clip_rectangle
[04:53:49] [PASSED] well_known_colors
[04:53:49] [PASSED] destination_pitch
[04:53:49] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[04:53:49] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[04:53:49] [PASSED] single_pixel_source_buffer
[04:53:49] [PASSED] single_pixel_clip_rectangle
[04:53:49] [PASSED] well_known_colors
[04:53:49] [PASSED] destination_pitch
[04:53:49] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[04:53:49] ================= drm_test_fb_clip_offset  =================
[04:53:49] [PASSED] pass through
[04:53:49] [PASSED] horizontal offset
[04:53:49] [PASSED] vertical offset
[04:53:49] [PASSED] horizontal and vertical offset
[04:53:49] [PASSED] horizontal offset (custom pitch)
[04:53:49] [PASSED] vertical offset (custom pitch)
[04:53:49] [PASSED] horizontal and vertical offset (custom pitch)
[04:53:49] ============= [PASSED] drm_test_fb_clip_offset =============
[04:53:49] ============== drm_test_fb_build_fourcc_list  ==============
[04:53:49] [PASSED] no native formats
[04:53:49] [PASSED] XRGB8888 as native format
[04:53:49] [PASSED] remove duplicates
[04:53:49] [PASSED] convert alpha formats
[04:53:49] [PASSED] random formats
[04:53:49] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[04:53:49] =================== drm_test_fb_memcpy  ====================
[04:53:49] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[04:53:49] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[04:53:49] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[04:53:49] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[04:53:49] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[04:53:49] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[04:53:49] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[04:53:49] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[04:53:49] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[04:53:49] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[04:53:49] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[04:53:49] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[04:53:49] =============== [PASSED] drm_test_fb_memcpy ================
[04:53:49] ============= [PASSED] drm_format_helper_test ==============
[04:53:49] ======================= drm_format  ========================
[04:53:49] [PASSED] drm_test_format_block_width_invalid
[04:53:49] [PASSED] drm_test_format_block_width_one_plane
[04:53:49] [PASSED] drm_test_format_block_width_two_plane
[04:53:49] [PASSED] drm_test_format_block_width_three_plane
[04:53:49] [PASSED] drm_test_format_block_width_tiled
[04:53:49] [PASSED] drm_test_format_block_height_invalid
[04:53:49] [PASSED] drm_test_format_block_height_one_plane
[04:53:49] [PASSED] drm_test_format_block_height_two_plane
[04:53:49] [PASSED] drm_test_format_block_height_three_plane
[04:53:49] [PASSED] drm_test_format_block_height_tiled
[04:53:49] [PASSED] drm_test_format_min_pitch_invalid
[04:53:49] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[04:53:49] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[04:53:49] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[04:53:49] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[04:53:49] [PASSED] drm_test_format_min_pitch_two_plane
[04:53:49] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[04:53:49] [PASSED] drm_test_format_min_pitch_tiled
[04:53:49] =================== [PASSED] drm_format ====================
[04:53:49] ===================== drm_framebuffer  =====================
[04:53:49] =============== drm_test_framebuffer_create  ===============
[04:53:49] [PASSED] ABGR8888 normal sizes
[04:53:49] [PASSED] ABGR8888 max sizes
[04:53:49] [PASSED] ABGR8888 pitch greater than min required
[04:53:49] [PASSED] ABGR8888 pitch less than min required
[04:53:49] [PASSED] ABGR8888 Invalid width
[04:53:49] [PASSED] ABGR8888 Invalid buffer handle
[04:53:49] [PASSED] No pixel format
[04:53:49] [PASSED] ABGR8888 Width 0
[04:53:49] [PASSED] ABGR8888 Height 0
[04:53:49] [PASSED] ABGR8888 Out of bound height * pitch combination
[04:53:49] [PASSED] ABGR8888 Large buffer offset
[04:53:49] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[04:53:49] [PASSED] ABGR8888 Valid buffer modifier
[04:53:49] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[04:53:49] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[04:53:49] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[04:53:49] [PASSED] NV12 Normal sizes
[04:53:49] [PASSED] NV12 Max sizes
[04:53:49] [PASSED] NV12 Invalid pitch
[04:53:49] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[04:53:49] [PASSED] NV12 different  modifier per-plane
[04:53:49] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[04:53:49] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[04:53:49] [PASSED] NV12 Modifier for inexistent plane
[04:53:49] [PASSED] NV12 Handle for inexistent plane
[04:53:49] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[04:53:49] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[04:53:49] [PASSED] YVU420 Normal sizes
[04:53:49] [PASSED] YVU420 Max sizes
[04:53:49] [PASSED] YVU420 Invalid pitch
[04:53:49] [PASSED] YVU420 Different pitches
[04:53:49] [PASSED] YVU420 Different buffer offsets/pitches
[04:53:49] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[04:53:49] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[04:53:49] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[04:53:49] [PASSED] YVU420 Valid modifier
[04:53:49] [PASSED] YVU420 Different modifiers per plane
[04:53:49] [PASSED] YVU420 Modifier for inexistent plane
[04:53:49] [PASSED] X0L2 Normal sizes
[04:53:49] [PASSED] X0L2 Max sizes
[04:53:49] [PASSED] X0L2 Invalid pitch
[04:53:49] [PASSED] X0L2 Pitch greater than minimum required
[04:53:49] [PASSED] X0L2 Handle for inexistent plane
[04:53:49] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[04:53:49] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[04:53:49] [PASSED] X0L2 Valid modifier
[04:53:49] [PASSED] X0L2 Modifier for inexistent plane
[04:53:49] =========== [PASSED] drm_test_framebuffer_create ===========
[04:53:49] ================= [PASSED] drm_framebuffer =================
[04:53:49] ====================== drm_gem_shmem  ======================
[04:53:49] [PASSED] drm_gem_shmem_test_obj_create
[04:53:49] [PASSED] drm_gem_shmem_test_obj_create_private
[04:53:49] [PASSED] drm_gem_shmem_test_pin_pages
[04:53:49] [PASSED] drm_gem_shmem_test_vmap
[04:53:49] [PASSED] drm_gem_shmem_test_get_pages_sgt
[04:53:49] [PASSED] drm_gem_shmem_test_get_sg_table
[04:53:49] [PASSED] drm_gem_shmem_test_madvise
[04:53:49] [PASSED] drm_gem_shmem_test_purge
[04:53:49] ================== [PASSED] drm_gem_shmem ==================
[04:53:49] ==================== drm-test-managed  =====================
[04:53:49] [PASSED] drm_test_managed_run_action
[04:53:49] ================ [PASSED] drm-test-managed =================
[04:53:49] ========================= drm_mm  ==========================
[04:53:49] [PASSED] drm_test_mm_init
[04:53:49] [PASSED] drm_test_mm_debug
[04:53:49] [PASSED] drm_test_mm_align32
[04:53:49] [PASSED] drm_test_mm_align64
[04:53:49] [PASSED] drm_test_mm_lowest
[04:53:49] [PASSED] drm_test_mm_highest
[04:53:49] ===================== [PASSED] drm_mm ======================
[04:53:49] =================== drm_modes_analog_tv  ===================
[04:53:49] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[04:53:49] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[04:53:49] [PASSED] drm_test_modes_analog_tv_pal_576i
[04:53:49] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[04:53:49] =============== [PASSED] drm_modes_analog_tv ===============
[04:53:49] ==================== drm_plane_helper  =====================
[04:53:49] =============== drm_test_check_plane_state  ================
[04:53:49] [PASSED] clipping_simple
[04:53:49] [PASSED] clipping_rotate_reflect
[04:53:49] [PASSED] positioning_simple
[04:53:49] [PASSED] upscaling
[04:53:49] [PASSED] downscaling
[04:53:49] [PASSED] rounding1
[04:53:49] [PASSED] rounding2
[04:53:49] [PASSED] rounding3
[04:53:49] [PASSED] rounding4
[04:53:49] =========== [PASSED] drm_test_check_plane_state ============
[04:53:49] =========== drm_test_check_invalid_plane_state  ============
[04:53:49] [PASSED] positioning_invalid
[04:53:49] [PASSED] upscaling_invalid
[04:53:49] [PASSED] downscaling_invalid
[04:53:49] ======= [PASSED] drm_test_check_invalid_plane_state ========
[04:53:49] ================ [PASSED] drm_plane_helper =================
[04:53:49] ============ drm_connector_helper_tv_get_modes  ============
[04:53:49] ====== drm_test_connector_helper_tv_get_modes_check  =======
[04:53:49] [PASSED] None
[04:53:49] [PASSED] PAL
[04:53:49] [PASSED] NTSC
[04:53:49] [PASSED] Both, NTSC Default
[04:53:49] [PASSED] Both, PAL Default
[04:53:49] [PASSED] Both, NTSC Default, with PAL on command-line
[04:53:49] [PASSED] Both, PAL Default, with NTSC on command-line
[04:53:49] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[04:53:49] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[04:53:49] ======================== drm_rect  =========================
[04:53:49] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[04:53:49] [PASSED] drm_test_rect_clip_scaled_not_clipped
[04:53:49] [PASSED] drm_test_rect_clip_scaled_clipped
[04:53:49] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[04:53:49] ================= drm_test_rect_intersect  =================
[04:53:49] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[04:53:49] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
stty: 'standard input': Inappropriate ioctl for device
[04:53:49] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[04:53:49] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[04:53:49] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[04:53:49] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[04:53:49] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[04:53:49] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[04:53:49] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[04:53:49] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[04:53:49] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[04:53:49] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[04:53:49] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[04:53:49] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[04:53:49] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[04:53:49] ============= [PASSED] drm_test_rect_intersect =============
[04:53:49] ================ drm_test_rect_calc_hscale  ================
[04:53:49] [PASSED] normal use
[04:53:49] [PASSED] out of max range
[04:53:49] [PASSED] out of min range
[04:53:49] [PASSED] zero dst
[04:53:49] [PASSED] negative src
[04:53:49] [PASSED] negative dst
[04:53:49] ============ [PASSED] drm_test_rect_calc_hscale ============
[04:53:49] ================ drm_test_rect_calc_vscale  ================
[04:53:49] [PASSED] normal use
[04:53:49] [PASSED] out of max range
[04:53:49] [PASSED] out of min range
[04:53:49] [PASSED] zero dst
[04:53:49] [PASSED] negative src
[04:53:49] [PASSED] negative dst
[04:53:49] ============ [PASSED] drm_test_rect_calc_vscale ============
[04:53:49] ================== drm_test_rect_rotate  ===================
[04:53:49] [PASSED] reflect-x
[04:53:49] [PASSED] reflect-y
[04:53:49] [PASSED] rotate-0
[04:53:49] [PASSED] rotate-90
[04:53:49] [PASSED] rotate-180
[04:53:49] [PASSED] rotate-270
[04:53:49] ============== [PASSED] drm_test_rect_rotate ===============
[04:53:49] ================ drm_test_rect_rotate_inv  =================
[04:53:49] [PASSED] reflect-x
[04:53:49] [PASSED] reflect-y
[04:53:49] [PASSED] rotate-0
[04:53:49] [PASSED] rotate-90
[04:53:49] [PASSED] rotate-180
[04:53:49] [PASSED] rotate-270
[04:53:49] ============ [PASSED] drm_test_rect_rotate_inv =============
[04:53:49] ==================== [PASSED] drm_rect =====================
[04:53:49] ============================================================
[04:53:49] Testing complete. Ran 390 tests: passed: 390
[04:53:49] Elapsed time: 21.662s total, 1.678s configuring, 19.815s building, 0.161s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


