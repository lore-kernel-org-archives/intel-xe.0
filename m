Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2AEC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 14:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8C510E319;
	Wed,  3 Jan 2024 14:20:22 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DB610E319;
 Wed,  3 Jan 2024 14:20:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Refactor_xe=5Fexec=5Fqueue=5Fc?=
 =?utf-8?q?reate_to_fix_user_extensions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Welty" <brian.welty@intel.com>
Date: Wed, 03 Jan 2024 14:20:21 -0000
Message-ID: <170429162132.151.1975578891336030509@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240102211731.6720-1-brian.welty@intel.com>
In-Reply-To: <20240102211731.6720-1-brian.welty@intel.com>
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

Series: Refactor xe_exec_queue_create to fix user extensions
URL   : https://patchwork.freedesktop.org/series/128128/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[14:19:29] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:19:33] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[14:19:56] Starting KUnit Kernel (1/1)...
[14:19:56] ============================================================
[14:19:57] ========================= guc_dbm  =========================
[14:19:57] [PASSED] test_empty
[14:19:57] [PASSED] test_default
[14:19:57] ======================== test_size  ========================
[14:19:57] [PASSED] 4
[14:19:57] [PASSED] 8
[14:19:57] [PASSED] 32
[14:19:57] [PASSED] 256
[14:19:57] ==================== [PASSED] test_size ====================
[14:19:57] ======================= test_reuse  ========================
[14:19:57] [PASSED] 4
[14:19:57] [PASSED] 8
[14:19:57] [PASSED] 32
[14:19:57] [PASSED] 256
[14:19:57] =================== [PASSED] test_reuse ====================
[14:19:57] =================== test_range_overlap  ====================
[14:19:57] [PASSED] 4
[14:19:57] [PASSED] 8
[14:19:57] [PASSED] 32
[14:19:57] [PASSED] 256
[14:19:57] =============== [PASSED] test_range_overlap ================
[14:19:57] =================== test_range_compact  ====================
[14:19:57] [PASSED] 4
[14:19:57] [PASSED] 8
[14:19:57] [PASSED] 32
[14:19:57] [PASSED] 256
[14:19:57] =============== [PASSED] test_range_compact ================
[14:19:57] ==================== test_range_spare  =====================
[14:19:57] [PASSED] 4
[14:19:57] [PASSED] 8
[14:19:57] [PASSED] 32
[14:19:57] [PASSED] 256
[14:19:57] ================ [PASSED] test_range_spare =================
[14:19:57] ===================== [PASSED] guc_dbm =====================
[14:19:57] ========================== lmtt  ===========================
[14:19:57] ======================== test_ops  =========================
[14:19:57] [PASSED] 2-level
[14:19:57] [PASSED] multi-level
[14:19:57] ==================== [PASSED] test_ops =====================
[14:19:57] ====================== [PASSED] lmtt =======================
[14:19:57] ========================== xe_bo  ==========================
[14:19:57] [SKIPPED] xe_ccs_migrate_kunit
[14:19:57] [SKIPPED] xe_bo_evict_kunit
[14:19:57] ===================== [SKIPPED] xe_bo ======================
[14:19:57] ======================= xe_dma_buf  ========================
[14:19:57] [SKIPPED] xe_dma_buf_kunit
[14:19:57] =================== [SKIPPED] xe_dma_buf ===================
[14:19:57] ======================= xe_migrate  ========================
[14:19:57] [SKIPPED] xe_migrate_sanity_kunit
[14:19:57] =================== [SKIPPED] xe_migrate ===================
[14:19:57] ========================= xe_mocs  =========================
[14:19:57] [SKIPPED] xe_live_mocs_kernel_kunit
[14:19:57] ==================== [SKIPPED] xe_mocs =====================
[14:19:57] ========================= xe_pci  ==========================
[14:19:57] [PASSED] xe_gmdid_graphics_ip
[14:19:57] [PASSED] xe_gmdid_media_ip
[14:19:57] ===================== [PASSED] xe_pci ======================
[14:19:57] ========================= xe_rtp  ==========================
[14:19:57] ================== xe_rtp_process_tests  ===================
[14:19:57] [PASSED] coalesce-same-reg
[14:19:57] [PASSED] no-match-no-add
[14:19:57] [PASSED] no-match-no-add-multiple-rules
[14:19:57] [PASSED] two-regs-two-entries
[14:19:57] [PASSED] clr-one-set-other
[14:19:57] [PASSED] set-field
[14:19:57] [PASSED] conflict-duplicate
[14:19:57] [PASSED] conflict-not-disjoint
[14:19:57] [PASSED] conflict-reg-type
[14:19:57] ============== [PASSED] xe_rtp_process_tests ===============
[14:19:57] ===================== [PASSED] xe_rtp ======================
[14:19:57] ========================== xe_wa  ==========================
[14:19:57] ======================== xe_wa_gt  =========================
[14:19:57] [PASSED] TIGERLAKE (B0)
[14:19:57] [PASSED] DG1 (A0)
[14:19:57] [PASSED] DG1 (B0)
[14:19:57] [PASSED] ALDERLAKE_S (A0)
[14:19:57] [PASSED] ALDERLAKE_S (B0)
[14:19:57] [PASSED] ALDERLAKE_S (C0)
[14:19:57] [PASSED] ALDERLAKE_S (D0)
[14:19:57] [PASSED] ALDERLAKE_P (A0)
[14:19:57] [PASSED] ALDERLAKE_P (B0)
[14:19:57] [PASSED] ALDERLAKE_P (C0)
[14:19:57] [PASSED] ALDERLAKE_S_RPLS (D0)
[14:19:57] [PASSED] ALDERLAKE_P_RPLU (E0)
[14:19:57] [PASSED] DG2_G10 (A0)
[14:19:57] [PASSED] DG2_G10 (A1)
[14:19:57] [PASSED] DG2_G10 (B0)
[14:19:57] [PASSED] DG2_G10 (C0)
[14:19:57] [PASSED] DG2_G11 (A0)
[14:19:57] [PASSED] DG2_G11 (B0)
[14:19:57] [PASSED] DG2_G11 (B1)
[14:19:57] [PASSED] DG2_G12 (A0)
[14:19:57] [PASSED] DG2_G12 (A1)
[14:19:57] [PASSED] PVC (B0)
[14:19:57] [PASSED] PVC (B1)
[14:19:57] [PASSED] PVC (C0)
[14:19:57] [PASSED] METEORLAKE (g:A0, m:A0)
[14:19:57] [PASSED] METEORLAKE (g:A0, m:A0)
[14:19:57] [PASSED] LUNARLAKE (g:A0, m:A0)
[14:19:57] [PASSED] LUNARLAKE (g:B0, m:A0)
[14:19:57] ==================== [PASSED] xe_wa_gt =====================
[14:19:57] ====================== [PASSED] xe_wa ======================
[14:19:57] ============================================================
[14:19:57] Testing complete. Ran 68 tests: passed: 63, skipped: 5
[14:19:57] Elapsed time: 27.673s total, 4.201s configuring, 23.253s building, 0.193s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[14:19:57] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:19:58] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[14:20:18] Starting KUnit Kernel (1/1)...
[14:20:18] ============================================================
[14:20:19] ================== drm_test_pick_cmdline  ==================
[14:20:19] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[14:20:19] =============== drm_test_pick_cmdline_named  ===============
[14:20:19] [PASSED] NTSC
[14:20:19] [PASSED] NTSC-J
[14:20:19] [PASSED] PAL
[14:20:19] [PASSED] PAL-M
[14:20:19] =========== [PASSED] drm_test_pick_cmdline_named ===========
[14:20:19] ============== [PASSED] drm_test_pick_cmdline ==============
[14:20:19] ======================== drm_buddy  ========================
[14:20:19] [PASSED] drm_test_buddy_alloc_limit
[14:20:19] [PASSED] drm_test_buddy_alloc_optimistic
[14:20:19] [PASSED] drm_test_buddy_alloc_pessimistic
[14:20:19] [PASSED] drm_test_buddy_alloc_pathological
[14:20:19] ==================== [PASSED] drm_buddy ====================
[14:20:19] =================== drm_cmdline_parser  ====================
[14:20:19] [PASSED] drm_test_cmdline_force_d_only
[14:20:19] [PASSED] drm_test_cmdline_force_D_only_dvi
[14:20:19] [PASSED] drm_test_cmdline_force_D_only_hdmi
[14:20:19] [PASSED] drm_test_cmdline_force_D_only_not_digital
[14:20:19] [PASSED] drm_test_cmdline_force_e_only
[14:20:19] [PASSED] drm_test_cmdline_res
[14:20:19] [PASSED] drm_test_cmdline_res_vesa
[14:20:19] [PASSED] drm_test_cmdline_res_vesa_rblank
[14:20:19] [PASSED] drm_test_cmdline_res_rblank
[14:20:19] [PASSED] drm_test_cmdline_res_bpp
[14:20:19] [PASSED] drm_test_cmdline_res_refresh
[14:20:19] [PASSED] drm_test_cmdline_res_bpp_refresh
[14:20:19] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[14:20:19] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[14:20:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[14:20:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[14:20:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[14:20:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[14:20:19] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[14:20:19] [PASSED] drm_test_cmdline_res_margins_force_on
[14:20:19] [PASSED] drm_test_cmdline_res_vesa_margins
[14:20:19] [PASSED] drm_test_cmdline_name
[14:20:19] [PASSED] drm_test_cmdline_name_bpp
[14:20:19] [PASSED] drm_test_cmdline_name_option
[14:20:19] [PASSED] drm_test_cmdline_name_bpp_option
[14:20:19] [PASSED] drm_test_cmdline_rotate_0
[14:20:19] [PASSED] drm_test_cmdline_rotate_90
[14:20:19] [PASSED] drm_test_cmdline_rotate_180
[14:20:19] [PASSED] drm_test_cmdline_rotate_270
[14:20:19] [PASSED] drm_test_cmdline_hmirror
[14:20:19] [PASSED] drm_test_cmdline_vmirror
[14:20:19] [PASSED] drm_test_cmdline_margin_options
[14:20:19] [PASSED] drm_test_cmdline_multiple_options
[14:20:19] [PASSED] drm_test_cmdline_bpp_extra_and_option
[14:20:19] [PASSED] drm_test_cmdline_extra_and_option
[14:20:19] [PASSED] drm_test_cmdline_freestanding_options
[14:20:19] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[14:20:19] [PASSED] drm_test_cmdline_panel_orientation
[14:20:19] ================ drm_test_cmdline_invalid  =================
[14:20:19] [PASSED] margin_only
[14:20:19] [PASSED] interlace_only
[14:20:19] [PASSED] res_missing_x
[14:20:19] [PASSED] res_missing_y
[14:20:19] [PASSED] res_bad_y
[14:20:19] [PASSED] res_missing_y_bpp
[14:20:19] [PASSED] res_bad_bpp
[14:20:19] [PASSED] res_bad_refresh
[14:20:19] [PASSED] res_bpp_refresh_force_on_off
[14:20:19] [PASSED] res_invalid_mode
[14:20:19] [PASSED] res_bpp_wrong_place_mode
[14:20:19] [PASSED] name_bpp_refresh
[14:20:19] [PASSED] name_refresh
[14:20:19] [PASSED] name_refresh_wrong_mode
[14:20:19] [PASSED] name_refresh_invalid_mode
[14:20:19] [PASSED] rotate_multiple
[14:20:19] [PASSED] rotate_invalid_val
[14:20:19] [PASSED] rotate_truncated
[14:20:19] [PASSED] invalid_option
[14:20:19] [PASSED] invalid_tv_option
[14:20:19] [PASSED] truncated_tv_option
[14:20:19] ============ [PASSED] drm_test_cmdline_invalid =============
[14:20:19] =============== drm_test_cmdline_tv_options  ===============
[14:20:19] [PASSED] NTSC
[14:20:19] [PASSED] NTSC_443
[14:20:19] [PASSED] NTSC_J
[14:20:19] [PASSED] PAL
[14:20:19] [PASSED] PAL_M
[14:20:19] [PASSED] PAL_N
[14:20:19] [PASSED] SECAM
[14:20:19] =========== [PASSED] drm_test_cmdline_tv_options ===========
[14:20:19] =============== [PASSED] drm_cmdline_parser ================
[14:20:19] ================ drm_get_tv_mode_from_name  ================
[14:20:19] ========== drm_test_get_tv_mode_from_name_valid  ===========
[14:20:19] [PASSED] NTSC
[14:20:19] [PASSED] NTSC-443
[14:20:19] [PASSED] NTSC-J
[14:20:19] [PASSED] PAL
[14:20:19] [PASSED] PAL-M
[14:20:19] [PASSED] PAL-N
[14:20:19] [PASSED] SECAM
[14:20:19] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[14:20:19] [PASSED] drm_test_get_tv_mode_from_name_truncated
[14:20:19] ============ [PASSED] drm_get_tv_mode_from_name ============
[14:20:19] ==================== drm_damage_helper  ====================
[14:20:19] [PASSED] drm_test_damage_iter_no_damage
[14:20:19] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[14:20:19] [PASSED] drm_test_damage_iter_no_damage_src_moved
[14:20:19] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[14:20:19] [PASSED] drm_test_damage_iter_no_damage_not_visible
[14:20:19] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[14:20:19] [PASSED] drm_test_damage_iter_no_damage_no_fb
[14:20:19] [PASSED] drm_test_damage_iter_simple_damage
[14:20:19] [PASSED] drm_test_damage_iter_single_damage
[14:20:19] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[14:20:19] [PASSED] drm_test_damage_iter_single_damage_outside_src
[14:20:19] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[14:20:19] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[14:20:19] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[14:20:19] [PASSED] drm_test_damage_iter_single_damage_src_moved
[14:20:19] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[14:20:19] [PASSED] drm_test_damage_iter_damage
[14:20:19] [PASSED] drm_test_damage_iter_damage_one_intersect
[14:20:19] [PASSED] drm_test_damage_iter_damage_one_outside
[14:20:19] [PASSED] drm_test_damage_iter_damage_src_moved
[14:20:19] [PASSED] drm_test_damage_iter_damage_not_visible
[14:20:19] ================ [PASSED] drm_damage_helper ================
[14:20:19] ==================== drm_dp_mst_helper  ====================
[14:20:19] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[14:20:19] [PASSED] Clock 154000 BPP 30 DSC disabled
[14:20:19] [PASSED] Clock 234000 BPP 30 DSC disabled
[14:20:19] [PASSED] Clock 297000 BPP 24 DSC disabled
[14:20:19] [PASSED] Clock 332880 BPP 24 DSC enabled
[14:20:19] [PASSED] Clock 324540 BPP 24 DSC enabled
[14:20:19] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[14:20:19] ============== drm_test_dp_mst_calc_pbn_div  ===============
[14:20:19] [PASSED] Link rate 2000000 lane count 4
[14:20:19] [PASSED] Link rate 2000000 lane count 2
[14:20:19] [PASSED] Link rate 2000000 lane count 1
[14:20:19] [PASSED] Link rate 1350000 lane count 4
[14:20:19] [PASSED] Link rate 1350000 lane count 2
[14:20:19] [PASSED] Link rate 1350000 lane count 1
[14:20:19] [PASSED] Link rate 1000000 lane count 4
[14:20:19] [PASSED] Link rate 1000000 lane count 2
[14:20:19] [PASSED] Link rate 1000000 lane count 1
[14:20:19] [PASSED] Link rate 810000 lane count 4
[14:20:19] [PASSED] Link rate 810000 lane count 2
[14:20:19] [PASSED] Link rate 810000 lane count 1
[14:20:19] [PASSED] Link rate 540000 lane count 4
[14:20:19] [PASSED] Link rate 540000 lane count 2
[14:20:19] [PASSED] Link rate 540000 lane count 1
[14:20:19] [PASSED] Link rate 270000 lane count 4
[14:20:19] [PASSED] Link rate 270000 lane count 2
[14:20:19] [PASSED] Link rate 270000 lane count 1
[14:20:19] [PASSED] Link rate 162000 lane count 4
[14:20:19] [PASSED] Link rate 162000 lane count 2
[14:20:19] [PASSED] Link rate 162000 lane count 1
[14:20:19] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[14:20:19] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[14:20:19] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[14:20:19] [PASSED] DP_POWER_UP_PHY with port number
[14:20:19] [PASSED] DP_POWER_DOWN_PHY with port number
[14:20:19] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[14:20:19] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[14:20:19] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[14:20:19] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[14:20:19] [PASSED] DP_QUERY_PAYLOAD with port number
[14:20:19] [PASSED] DP_QUERY_PAYLOAD with VCPI
[14:20:19] [PASSED] DP_REMOTE_DPCD_READ with port number
[14:20:19] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[14:20:19] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[14:20:19] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[14:20:19] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[14:20:19] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[14:20:19] [PASSED] DP_REMOTE_I2C_READ with port number
[14:20:19] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[14:20:19] [PASSED] DP_REMOTE_I2C_READ with transactions array
[14:20:19] [PASSED] DP_REMOTE_I2C_WRITE with port number
[14:20:19] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[14:20:19] [PASSED] DP_REMOTE_I2C_WRITE with data array
[14:20:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[14:20:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[14:20:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[14:20:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[14:20:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[14:20:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[14:20:19] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[14:20:19] ================ [PASSED] drm_dp_mst_helper ================
[14:20:19] ======================== drm_exec  =========================
[14:20:19] [PASSED] sanitycheck
[14:20:19] [PASSED] test_lock
[14:20:19] [PASSED] test_lock_unlock
[14:20:19] [PASSED] test_duplicates
[14:20:19] [PASSED] test_prepare
[14:20:19] [PASSED] test_prepare_array
[14:20:19] [PASSED] test_multiple_loops
[14:20:19] ==================== [PASSED] drm_exec =====================
[14:20:19] ================= drm_format_helper_test  ==================
[14:20:19] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[14:20:19] [PASSED] single_pixel_source_buffer
[14:20:19] [PASSED] single_pixel_clip_rectangle
[14:20:19] [PASSED] well_known_colors
[14:20:19] [PASSED] destination_pitch
[14:20:19] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[14:20:19] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[14:20:19] [PASSED] single_pixel_source_buffer
[14:20:19] [PASSED] single_pixel_clip_rectangle
[14:20:19] [PASSED] well_known_colors
[14:20:19] [PASSED] destination_pitch
[14:20:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[14:20:19] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[14:20:19] [PASSED] single_pixel_source_buffer
[14:20:19] [PASSED] single_pixel_clip_rectangle
[14:20:19] [PASSED] well_known_colors
[14:20:19] [PASSED] destination_pitch
[14:20:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[14:20:19] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[14:20:19] [PASSED] single_pixel_source_buffer
[14:20:19] [PASSED] single_pixel_clip_rectangle
[14:20:19] [PASSED] well_known_colors
[14:20:19] [PASSED] destination_pitch
[14:20:19] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[14:20:19] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[14:20:19] [PASSED] single_pixel_source_buffer
[14:20:19] [PASSED] single_pixel_clip_rectangle
[14:20:19] [PASSED] well_known_colors
[14:20:19] [PASSED] destination_pitch
[14:20:19] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[14:20:19] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[14:20:19] [PASSED] single_pixel_source_buffer
[14:20:19] [PASSED] single_pixel_clip_rectangle
[14:20:19] [PASSED] well_known_colors
[14:20:19] [PASSED] destination_pitch
[14:20:19] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[14:20:19] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[14:20:19] [PASSED] single_pixel_source_buffer
[14:20:19] [PASSED] single_pixel_clip_rectangle
[14:20:19] [PASSED] well_known_colors
[14:20:19] [PASSED] destination_pitch
[14:20:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[14:20:19] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[14:20:19] [PASSED] single_pixel_source_buffer
[14:20:19] [PASSED] single_pixel_clip_rectangle
[14:20:19] [PASSED] well_known_colors
[14:20:19] [PASSED] destination_pitch
[14:20:19] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[14:20:19] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[14:20:19] [PASSED] single_pixel_source_buffer
[14:20:19] [PASSED] single_pixel_clip_rectangle
[14:20:19] [PASSED] well_known_colors
[14:20:19] [PASSED] destination_pitch
[14:20:19] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[14:20:19] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[14:20:19] [PASSED] single_pixel_source_buffer
[14:20:19] [PASSED] single_pixel_clip_rectangle
[14:20:19] [PASSED] well_known_colors
[14:20:19] [PASSED] destination_pitch
[14:20:19] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[14:20:19] ============== drm_test_fb_xrgb8888_to_mono  ===============
[14:20:19] [PASSED] single_pixel_source_buffer
[14:20:19] [PASSED] single_pixel_clip_rectangle
[14:20:19] [PASSED] well_known_colors
[14:20:19] [PASSED] destination_pitch
[14:20:19] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[14:20:19] ==================== drm_test_fb_swab  =====================
[14:20:19] [PASSED] single_pixel_source_buffer
[14:20:19] [PASSED] single_pixel_clip_rectangle
[14:20:19] [PASSED] well_known_colors
[14:20:19] [PASSED] destination_pitch
[14:20:19] ================ [PASSED] drm_test_fb_swab =================
[14:20:19] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[14:20:19] [PASSED] single_pixel_source_buffer
[14:20:19] [PASSED] single_pixel_clip_rectangle
[14:20:19] [PASSED] well_known_colors
[14:20:19] [PASSED] destination_pitch
[14:20:19] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[14:20:19] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[14:20:19] [PASSED] single_pixel_source_buffer
[14:20:19] [PASSED] single_pixel_clip_rectangle
[14:20:19] [PASSED] well_known_colors
[14:20:19] [PASSED] destination_pitch
[14:20:19] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[14:20:19] ================= drm_test_fb_clip_offset  =================
[14:20:19] [PASSED] pass through
[14:20:19] [PASSED] horizontal offset
[14:20:19] [PASSED] vertical offset
[14:20:19] [PASSED] horizontal and vertical offset
[14:20:19] [PASSED] horizontal offset (custom pitch)
[14:20:19] [PASSED] vertical offset (custom pitch)
[14:20:19] [PASSED] horizontal and vertical offset (custom pitch)
[14:20:19] ============= [PASSED] drm_test_fb_clip_offset =============
[14:20:19] ============== drm_test_fb_build_fourcc_list  ==============
[14:20:19] [PASSED] no native formats
[14:20:19] [PASSED] XRGB8888 as native format
[14:20:19] [PASSED] remove duplicates
[14:20:19] [PASSED] convert alpha formats
[14:20:19] [PASSED] random formats
[14:20:19] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[14:20:19] =================== drm_test_fb_memcpy  ====================
[14:20:19] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[14:20:19] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[14:20:19] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[14:20:19] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[14:20:19] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[14:20:19] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[14:20:19] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[14:20:19] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[14:20:19] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[14:20:19] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[14:20:19] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[14:20:19] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[14:20:19] =============== [PASSED] drm_test_fb_memcpy ================
[14:20:19] ============= [PASSED] drm_format_helper_test ==============
[14:20:19] ======================= drm_format  ========================
[14:20:19] [PASSED] drm_test_format_block_width_invalid
[14:20:19] [PASSED] drm_test_format_block_width_one_plane
[14:20:19] [PASSED] drm_test_format_block_width_two_plane
[14:20:19] [PASSED] drm_test_format_block_width_three_plane
[14:20:19] [PASSED] drm_test_format_block_width_tiled
[14:20:19] [PASSED] drm_test_format_block_height_invalid
[14:20:19] [PASSED] drm_test_format_block_height_one_plane
[14:20:19] [PASSED] drm_test_format_block_height_two_plane
[14:20:19] [PASSED] drm_test_format_block_height_three_plane
[14:20:19] [PASSED] drm_test_format_block_height_tiled
[14:20:19] [PASSED] drm_test_format_min_pitch_invalid
[14:20:19] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[14:20:19] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[14:20:19] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[14:20:19] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[14:20:19] [PASSED] drm_test_format_min_pitch_two_plane
[14:20:19] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[14:20:19] [PASSED] drm_test_format_min_pitch_tiled
[14:20:19] =================== [PASSED] drm_format ====================
[14:20:19] ===================== drm_framebuffer  =====================
[14:20:19] =============== drm_test_framebuffer_create  ===============
[14:20:19] [PASSED] ABGR8888 normal sizes
[14:20:19] [PASSED] ABGR8888 max sizes
[14:20:19] [PASSED] ABGR8888 pitch greater than min required
[14:20:19] [PASSED] ABGR8888 pitch less than min required
[14:20:19] [PASSED] ABGR8888 Invalid width
[14:20:19] [PASSED] ABGR8888 Invalid buffer handle
[14:20:19] [PASSED] No pixel format
[14:20:19] [PASSED] ABGR8888 Width 0
[14:20:19] [PASSED] ABGR8888 Height 0
[14:20:19] [PASSED] ABGR8888 Out of bound height * pitch combination
[14:20:19] [PASSED] ABGR8888 Large buffer offset
[14:20:19] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[14:20:19] [PASSED] ABGR8888 Valid buffer modifier
[14:20:19] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[14:20:19] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[14:20:19] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[14:20:19] [PASSED] NV12 Normal sizes
[14:20:19] [PASSED] NV12 Max sizes
[14:20:19] [PASSED] NV12 Invalid pitch
[14:20:19] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[14:20:19] [PASSED] NV12 different  modifier per-plane
[14:20:19] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[14:20:19] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[14:20:19] [PASSED] NV12 Modifier for inexistent plane
[14:20:19] [PASSED] NV12 Handle for inexistent plane
[14:20:19] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[14:20:19] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[14:20:19] [PASSED] YVU420 Normal sizes
[14:20:19] [PASSED] YVU420 Max sizes
[14:20:19] [PASSED] YVU420 Invalid pitch
[14:20:19] [PASSED] YVU420 Different pitches
[14:20:19] [PASSED] YVU420 Different buffer offsets/pitches
[14:20:19] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[14:20:19] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[14:20:19] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[14:20:19] [PASSED] YVU420 Valid modifier
[14:20:19] [PASSED] YVU420 Different modifiers per plane
[14:20:19] [PASSED] YVU420 Modifier for inexistent plane
[14:20:19] [PASSED] X0L2 Normal sizes
[14:20:19] [PASSED] X0L2 Max sizes
[14:20:19] [PASSED] X0L2 Invalid pitch
[14:20:19] [PASSED] X0L2 Pitch greater than minimum required
[14:20:19] [PASSED] X0L2 Handle for inexistent plane
[14:20:19] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[14:20:19] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[14:20:19] [PASSED] X0L2 Valid modifier
[14:20:19] [PASSED] X0L2 Modifier for inexistent plane
[14:20:19] =========== [PASSED] drm_test_framebuffer_create ===========
[14:20:19] ================= [PASSED] drm_framebuffer =================
[14:20:19] ====================== drm_gem_shmem  ======================
[14:20:19] [PASSED] drm_gem_shmem_test_obj_create
[14:20:19] [PASSED] drm_gem_shmem_test_obj_create_private
[14:20:19] [PASSED] drm_gem_shmem_test_pin_pages
[14:20:19] [PASSED] drm_gem_shmem_test_vmap
[14:20:19] [PASSED] drm_gem_shmem_test_get_pages_sgt
[14:20:19] [PASSED] drm_gem_shmem_test_get_sg_table
[14:20:19] [PASSED] drm_gem_shmem_test_madvise
[14:20:19] [PASSED] drm_gem_shmem_test_purge
[14:20:19] ================== [PASSED] drm_gem_shmem ==================
[14:20:19] ==================== drm-test-managed  =====================
[14:20:19] [PASSED] drm_test_managed_run_action
[14:20:19] ================ [PASSED] drm-test-managed =================
[14:20:19] ========================= drm_mm  ==========================
[14:20:19] [PASSED] drm_test_mm_init
[14:20:19] [PASSED] drm_test_mm_debug
[14:20:19] [PASSED] drm_test_mm_align32
[14:20:19] [PASSED] drm_test_mm_align64
[14:20:19] [PASSED] drm_test_mm_lowest
[14:20:19] [PASSED] drm_test_mm_highest
[14:20:19] ===================== [PASSED] drm_mm ======================
[14:20:19] =================== drm_modes_analog_tv  ===================
[14:20:19] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[14:20:19] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[14:20:19] [PASSED] drm_test_modes_analog_tv_pal_576i
[14:20:19] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[14:20:19] =============== [PASSED] drm_modes_analog_tv ===============
[14:20:19] ==================== drm_plane_helper  =====================
[14:20:19] =============== drm_test_check_plane_state  ================
[14:20:19] [PASSED] clipping_simple
[14:20:19] [PASSED] clipping_rotate_reflect
[14:20:19] [PASSED] positioning_simple
[14:20:19] [PASSED] upscaling
[14:20:19] [PASSED] downscaling
[14:20:19] [PASSED] rounding1
[14:20:19] [PASSED] rounding2
[14:20:19] [PASSED] rounding3
[14:20:19] [PASSED] rounding4
[14:20:19] =========== [PASSED] drm_test_check_plane_state ============
[14:20:19] =========== drm_test_check_invalid_plane_state  ============
[14:20:19] [PASSED] positioning_invalid
[14:20:19] [PASSED] upscaling_invalid
[14:20:19] [PASSED] downscaling_invalid
[14:20:19] ======= [PASSED] drm_test_check_invalid_plane_state ========
[14:20:19] ================ [PASSED] drm_plane_helper =================
[14:20:19] ============ drm_connector_helper_tv_get_modes  ============
[14:20:19] ====== drm_test_connector_helper_tv_get_modes_check  =======
[14:20:19] [PASSED] None
[14:20:19] [PASSED] PAL
[14:20:19] [PASSED] NTSC
[14:20:19] [PASSED] Both, NTSC Default
[14:20:19] [PASSED] Both, PAL Default
[14:20:19] [PASSED] Both, NTSC Default, with PAL on command-line
[14:20:19] [PASSED] Both, PAL Default, with NTSC on command-line
[14:20:19] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[14:20:19] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[14:20:19] ======================== drm_rect  =========================
[14:20:19] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[14:20:19] [PASSED] drm_test_rect_clip_scaled_not_clipped
[14:20:19] [PASSED] drm_test_rect_clip_scaled_clipped
[14:20:19] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[14:20:19] ================= drm_test_rect_intersect  =================
[14:20:19] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[14:20:19] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
stty: 'standard input': Inappropriate ioctl for device
[14:20:19] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[14:20:19] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[14:20:19] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[14:20:19] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[14:20:19] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[14:20:19] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[14:20:19] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[14:20:19] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[14:20:19] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[14:20:19] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[14:20:19] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[14:20:19] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[14:20:19] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[14:20:19] ============= [PASSED] drm_test_rect_intersect =============
[14:20:19] ================ drm_test_rect_calc_hscale  ================
[14:20:19] [PASSED] normal use
[14:20:19] [PASSED] out of max range
[14:20:19] [PASSED] out of min range
[14:20:19] [PASSED] zero dst
[14:20:19] [PASSED] negative src
[14:20:19] [PASSED] negative dst
[14:20:19] ============ [PASSED] drm_test_rect_calc_hscale ============
[14:20:19] ================ drm_test_rect_calc_vscale  ================
[14:20:19] [PASSED] normal use
[14:20:19] [PASSED] out of max range
[14:20:19] [PASSED] out of min range
[14:20:19] [PASSED] zero dst
[14:20:19] [PASSED] negative src
[14:20:19] [PASSED] negative dst
[14:20:19] ============ [PASSED] drm_test_rect_calc_vscale ============
[14:20:19] ================== drm_test_rect_rotate  ===================
[14:20:19] [PASSED] reflect-x
[14:20:19] [PASSED] reflect-y
[14:20:19] [PASSED] rotate-0
[14:20:19] [PASSED] rotate-90
[14:20:19] [PASSED] rotate-180
[14:20:19] [PASSED] rotate-270
[14:20:19] ============== [PASSED] drm_test_rect_rotate ===============
[14:20:19] ================ drm_test_rect_rotate_inv  =================
[14:20:19] [PASSED] reflect-x
[14:20:19] [PASSED] reflect-y
[14:20:19] [PASSED] rotate-0
[14:20:19] [PASSED] rotate-90
[14:20:19] [PASSED] rotate-180
[14:20:19] [PASSED] rotate-270
[14:20:19] ============ [PASSED] drm_test_rect_rotate_inv =============
[14:20:19] ==================== [PASSED] drm_rect =====================
[14:20:19] ============================================================
[14:20:19] Testing complete. Ran 390 tests: passed: 390
[14:20:19] Elapsed time: 21.741s total, 1.678s configuring, 19.894s building, 0.163s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


