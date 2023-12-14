Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F2DC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 17:28:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB76010E920;
	Thu, 14 Dec 2023 17:28:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2092410E254;
 Thu, 14 Dec 2023 17:28:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A1693AA915;
 Thu, 14 Dec 2023 17:28:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/uapi=3A_Remove_sync_bin?=
 =?utf-8?q?ds_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 14 Dec 2023 17:28:28 -0000
Message-ID: <170257490865.19956.1359572721646772844@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231214170714.648790-1-matthew.brost@intel.com>
In-Reply-To: <20231214170714.648790-1-matthew.brost@intel.com>
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

Series: drm/xe/uapi: Remove sync binds (rev3)
URL   : https://patchwork.freedesktop.org/series/127780/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[17:27:17] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:27:21] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[17:27:41] Starting KUnit Kernel (1/1)...
[17:27:41] ============================================================
[17:27:41] ========================== lmtt  ===========================
[17:27:41] ======================== test_ops  =========================
[17:27:41] [PASSED] 2-level
[17:27:41] [PASSED] multi-level
[17:27:41] ==================== [PASSED] test_ops =====================
[17:27:41] ====================== [PASSED] lmtt =======================
[17:27:41] ========================== xe_bo  ==========================
[17:27:41] [SKIPPED] xe_ccs_migrate_kunit
[17:27:41] [SKIPPED] xe_bo_evict_kunit
[17:27:41] ===================== [SKIPPED] xe_bo ======================
[17:27:41] ======================= xe_dma_buf  ========================
[17:27:41] [SKIPPED] xe_dma_buf_kunit
[17:27:41] =================== [SKIPPED] xe_dma_buf ===================
[17:27:41] ======================= xe_migrate  ========================
[17:27:41] [SKIPPED] xe_migrate_sanity_kunit
[17:27:41] =================== [SKIPPED] xe_migrate ===================
[17:27:41] ========================= xe_mocs  =========================
[17:27:41] [SKIPPED] xe_live_mocs_kernel_kunit
[17:27:41] ==================== [SKIPPED] xe_mocs =====================
[17:27:41] ========================= xe_pci  ==========================
[17:27:41] [PASSED] xe_gmdid_graphics_ip
[17:27:41] [PASSED] xe_gmdid_media_ip
[17:27:41] ===================== [PASSED] xe_pci ======================
[17:27:41] ========================= xe_rtp  ==========================
[17:27:41] ================== xe_rtp_process_tests  ===================
[17:27:41] [PASSED] coalesce-same-reg
[17:27:41] [PASSED] no-match-no-add
[17:27:41] [PASSED] no-match-no-add-multiple-rules
[17:27:41] [PASSED] two-regs-two-entries
[17:27:41] [PASSED] clr-one-set-other
[17:27:41] [PASSED] set-field
[17:27:41] [PASSED] conflict-duplicate
[17:27:41] [PASSED] conflict-not-disjoint
[17:27:41] [PASSED] conflict-reg-type
[17:27:41] ============== [PASSED] xe_rtp_process_tests ===============
[17:27:41] ===================== [PASSED] xe_rtp ======================
[17:27:41] ========================== xe_wa  ==========================
[17:27:41] ======================== xe_wa_gt  =========================
[17:27:41] [PASSED] TIGERLAKE (B0)
[17:27:41] [PASSED] DG1 (A0)
[17:27:41] [PASSED] DG1 (B0)
[17:27:41] [PASSED] ALDERLAKE_S (A0)
[17:27:41] [PASSED] ALDERLAKE_S (B0)
[17:27:41] [PASSED] ALDERLAKE_S (C0)
[17:27:41] [PASSED] ALDERLAKE_S (D0)
[17:27:41] [PASSED] ALDERLAKE_P (A0)
[17:27:41] [PASSED] ALDERLAKE_P (B0)
[17:27:41] [PASSED] ALDERLAKE_P (C0)
[17:27:41] [PASSED] ALDERLAKE_S_RPLS (D0)
[17:27:41] [PASSED] ALDERLAKE_P_RPLU (E0)
[17:27:41] [PASSED] DG2_G10 (A0)
[17:27:41] [PASSED] DG2_G10 (A1)
[17:27:41] [PASSED] DG2_G10 (B0)
[17:27:41] [PASSED] DG2_G10 (C0)
[17:27:41] [PASSED] DG2_G11 (A0)
[17:27:41] [PASSED] DG2_G11 (B0)
[17:27:41] [PASSED] DG2_G11 (B1)
[17:27:41] [PASSED] DG2_G12 (A0)
[17:27:41] [PASSED] DG2_G12 (A1)
[17:27:41] [PASSED] PVC (B0)
[17:27:41] [PASSED] PVC (B1)
[17:27:41] [PASSED] PVC (C0)
[17:27:41] [PASSED] METEORLAKE (g:A0, m:A0)
[17:27:41] [PASSED] METEORLAKE (g:A0, m:A0)
[17:27:41] [PASSED] LUNARLAKE (g:A0, m:A0)
[17:27:41] [PASSED] LUNARLAKE (g:B0, m:A0)
[17:27:41] ==================== [PASSED] xe_wa_gt =====================
[17:27:41] ====================== [PASSED] xe_wa ======================
[17:27:41] ============================================================
[17:27:41] Testing complete. Ran 46 tests: passed: 41, skipped: 5
[17:27:41] Elapsed time: 24.710s total, 4.180s configuring, 20.360s building, 0.141s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[17:27:41] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:27:43] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[17:28:02] Starting KUnit Kernel (1/1)...
[17:28:02] ============================================================
[17:28:02] ================== drm_test_pick_cmdline  ==================
[17:28:02] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[17:28:02] =============== drm_test_pick_cmdline_named  ===============
[17:28:02] [PASSED] NTSC
[17:28:02] [PASSED] NTSC-J
[17:28:02] [PASSED] PAL
[17:28:02] [PASSED] PAL-M
[17:28:02] =========== [PASSED] drm_test_pick_cmdline_named ===========
[17:28:02] ============== [PASSED] drm_test_pick_cmdline ==============
[17:28:02] ======================== drm_buddy  ========================
[17:28:02] [PASSED] drm_test_buddy_alloc_limit
[17:28:02] [PASSED] drm_test_buddy_alloc_range
[17:28:02] [PASSED] drm_test_buddy_alloc_optimistic
[17:28:02] [PASSED] drm_test_buddy_alloc_pessimistic
[17:28:02] [PASSED] drm_test_buddy_alloc_smoke
[17:28:02] [PASSED] drm_test_buddy_alloc_pathological
[17:28:02] ==================== [PASSED] drm_buddy ====================
[17:28:02] =================== drm_cmdline_parser  ====================
[17:28:02] [PASSED] drm_test_cmdline_force_d_only
[17:28:02] [PASSED] drm_test_cmdline_force_D_only_dvi
[17:28:02] [PASSED] drm_test_cmdline_force_D_only_hdmi
[17:28:02] [PASSED] drm_test_cmdline_force_D_only_not_digital
[17:28:02] [PASSED] drm_test_cmdline_force_e_only
[17:28:02] [PASSED] drm_test_cmdline_res
[17:28:02] [PASSED] drm_test_cmdline_res_vesa
[17:28:02] [PASSED] drm_test_cmdline_res_vesa_rblank
[17:28:02] [PASSED] drm_test_cmdline_res_rblank
[17:28:02] [PASSED] drm_test_cmdline_res_bpp
[17:28:02] [PASSED] drm_test_cmdline_res_refresh
[17:28:02] [PASSED] drm_test_cmdline_res_bpp_refresh
[17:28:02] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[17:28:02] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[17:28:02] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[17:28:02] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[17:28:02] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[17:28:02] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[17:28:02] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[17:28:02] [PASSED] drm_test_cmdline_res_margins_force_on
[17:28:02] [PASSED] drm_test_cmdline_res_vesa_margins
[17:28:02] [PASSED] drm_test_cmdline_name
[17:28:02] [PASSED] drm_test_cmdline_name_bpp
[17:28:02] [PASSED] drm_test_cmdline_name_option
[17:28:02] [PASSED] drm_test_cmdline_name_bpp_option
[17:28:02] [PASSED] drm_test_cmdline_rotate_0
[17:28:02] [PASSED] drm_test_cmdline_rotate_90
[17:28:02] [PASSED] drm_test_cmdline_rotate_180
[17:28:02] [PASSED] drm_test_cmdline_rotate_270
[17:28:02] [PASSED] drm_test_cmdline_hmirror
[17:28:02] [PASSED] drm_test_cmdline_vmirror
[17:28:02] [PASSED] drm_test_cmdline_margin_options
[17:28:02] [PASSED] drm_test_cmdline_multiple_options
[17:28:02] [PASSED] drm_test_cmdline_bpp_extra_and_option
[17:28:02] [PASSED] drm_test_cmdline_extra_and_option
[17:28:02] [PASSED] drm_test_cmdline_freestanding_options
[17:28:02] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[17:28:02] [PASSED] drm_test_cmdline_panel_orientation
[17:28:02] ================ drm_test_cmdline_invalid  =================
[17:28:02] [PASSED] margin_only
[17:28:02] [PASSED] interlace_only
[17:28:02] [PASSED] res_missing_x
[17:28:02] [PASSED] res_missing_y
[17:28:02] [PASSED] res_bad_y
[17:28:02] [PASSED] res_missing_y_bpp
[17:28:02] [PASSED] res_bad_bpp
[17:28:02] [PASSED] res_bad_refresh
[17:28:02] [PASSED] res_bpp_refresh_force_on_off
[17:28:02] [PASSED] res_invalid_mode
[17:28:02] [PASSED] res_bpp_wrong_place_mode
[17:28:02] [PASSED] name_bpp_refresh
[17:28:02] [PASSED] name_refresh
[17:28:02] [PASSED] name_refresh_wrong_mode
[17:28:02] [PASSED] name_refresh_invalid_mode
[17:28:02] [PASSED] rotate_multiple
[17:28:02] [PASSED] rotate_invalid_val
[17:28:02] [PASSED] rotate_truncated
[17:28:02] [PASSED] invalid_option
[17:28:02] [PASSED] invalid_tv_option
[17:28:02] [PASSED] truncated_tv_option
[17:28:02] ============ [PASSED] drm_test_cmdline_invalid =============
[17:28:02] =============== drm_test_cmdline_tv_options  ===============
[17:28:02] [PASSED] NTSC
[17:28:02] [PASSED] NTSC_443
[17:28:02] [PASSED] NTSC_J
[17:28:02] [PASSED] PAL
[17:28:02] [PASSED] PAL_M
[17:28:02] [PASSED] PAL_N
[17:28:02] [PASSED] SECAM
[17:28:02] =========== [PASSED] drm_test_cmdline_tv_options ===========
[17:28:02] =============== [PASSED] drm_cmdline_parser ================
[17:28:02] ================ drm_get_tv_mode_from_name  ================
[17:28:02] ========== drm_test_get_tv_mode_from_name_valid  ===========
[17:28:02] [PASSED] NTSC
[17:28:02] [PASSED] NTSC-443
[17:28:02] [PASSED] NTSC-J
[17:28:02] [PASSED] PAL
[17:28:02] [PASSED] PAL-M
[17:28:02] [PASSED] PAL-N
[17:28:02] [PASSED] SECAM
[17:28:02] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[17:28:02] [PASSED] drm_test_get_tv_mode_from_name_truncated
[17:28:02] ============ [PASSED] drm_get_tv_mode_from_name ============
[17:28:02] ==================== drm_damage_helper  ====================
[17:28:02] [PASSED] drm_test_damage_iter_no_damage
[17:28:02] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[17:28:02] [PASSED] drm_test_damage_iter_no_damage_src_moved
[17:28:02] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[17:28:02] [PASSED] drm_test_damage_iter_no_damage_not_visible
[17:28:02] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[17:28:02] [PASSED] drm_test_damage_iter_no_damage_no_fb
[17:28:02] [PASSED] drm_test_damage_iter_simple_damage
[17:28:02] [PASSED] drm_test_damage_iter_single_damage
[17:28:02] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[17:28:02] [PASSED] drm_test_damage_iter_single_damage_outside_src
[17:28:02] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[17:28:02] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[17:28:02] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[17:28:02] [PASSED] drm_test_damage_iter_single_damage_src_moved
[17:28:02] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[17:28:02] [PASSED] drm_test_damage_iter_damage
[17:28:02] [PASSED] drm_test_damage_iter_damage_one_intersect
[17:28:02] [PASSED] drm_test_damage_iter_damage_one_outside
[17:28:02] [PASSED] drm_test_damage_iter_damage_src_moved
[17:28:02] [PASSED] drm_test_damage_iter_damage_not_visible
[17:28:02] ================ [PASSED] drm_damage_helper ================
[17:28:02] ==================== drm_dp_mst_helper  ====================
[17:28:02] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[17:28:02] [PASSED] Clock 154000 BPP 30 DSC disabled
[17:28:02] [PASSED] Clock 234000 BPP 30 DSC disabled
[17:28:02] [PASSED] Clock 297000 BPP 24 DSC disabled
[17:28:02] [PASSED] Clock 332880 BPP 24 DSC enabled
[17:28:02] [PASSED] Clock 324540 BPP 24 DSC enabled
[17:28:02] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[17:28:02] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[17:28:02] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[17:28:02] [PASSED] DP_POWER_UP_PHY with port number
[17:28:02] [PASSED] DP_POWER_DOWN_PHY with port number
[17:28:02] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[17:28:02] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[17:28:02] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[17:28:02] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[17:28:02] [PASSED] DP_QUERY_PAYLOAD with port number
[17:28:02] [PASSED] DP_QUERY_PAYLOAD with VCPI
[17:28:02] [PASSED] DP_REMOTE_DPCD_READ with port number
[17:28:02] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[17:28:02] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[17:28:02] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[17:28:02] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[17:28:02] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[17:28:02] [PASSED] DP_REMOTE_I2C_READ with port number
[17:28:02] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[17:28:02] [PASSED] DP_REMOTE_I2C_READ with transactions array
[17:28:02] [PASSED] DP_REMOTE_I2C_WRITE with port number
[17:28:02] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[17:28:02] [PASSED] DP_REMOTE_I2C_WRITE with data array
[17:28:02] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[17:28:02] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[17:28:02] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[17:28:02] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[17:28:02] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[17:28:02] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[17:28:02] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[17:28:02] ================ [PASSED] drm_dp_mst_helper ================
[17:28:02] ================= drm_format_helper_test  ==================
[17:28:02] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[17:28:02] [PASSED] single_pixel_source_buffer
[17:28:02] [PASSED] single_pixel_clip_rectangle
[17:28:02] [PASSED] well_known_colors
[17:28:02] [PASSED] destination_pitch
[17:28:02] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[17:28:02] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[17:28:02] [PASSED] single_pixel_source_buffer
[17:28:02] [PASSED] single_pixel_clip_rectangle
[17:28:02] [PASSED] well_known_colors
[17:28:02] [PASSED] destination_pitch
[17:28:02] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[17:28:02] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[17:28:02] [PASSED] single_pixel_source_buffer
[17:28:02] [PASSED] single_pixel_clip_rectangle
[17:28:02] [PASSED] well_known_colors
[17:28:02] [PASSED] destination_pitch
[17:28:02] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[17:28:02] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[17:28:02] [PASSED] single_pixel_source_buffer
[17:28:02] [PASSED] single_pixel_clip_rectangle
[17:28:02] [PASSED] well_known_colors
[17:28:02] [PASSED] destination_pitch
[17:28:02] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[17:28:02] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[17:28:02] [PASSED] single_pixel_source_buffer
[17:28:02] [PASSED] single_pixel_clip_rectangle
[17:28:02] [PASSED] well_known_colors
[17:28:02] [PASSED] destination_pitch
[17:28:02] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[17:28:02] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[17:28:02] [PASSED] single_pixel_source_buffer
[17:28:02] [PASSED] single_pixel_clip_rectangle
[17:28:02] [PASSED] well_known_colors
[17:28:02] [PASSED] destination_pitch
[17:28:02] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[17:28:02] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[17:28:02] [PASSED] single_pixel_source_buffer
[17:28:02] [PASSED] single_pixel_clip_rectangle
[17:28:02] [PASSED] well_known_colors
[17:28:02] [PASSED] destination_pitch
[17:28:02] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[17:28:02] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[17:28:02] [PASSED] single_pixel_source_buffer
[17:28:02] [PASSED] single_pixel_clip_rectangle
[17:28:02] [PASSED] well_known_colors
[17:28:02] [PASSED] destination_pitch
[17:28:02] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[17:28:02] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[17:28:02] [PASSED] single_pixel_source_buffer
[17:28:02] [PASSED] single_pixel_clip_rectangle
[17:28:02] [PASSED] well_known_colors
[17:28:02] [PASSED] destination_pitch
[17:28:02] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[17:28:02] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[17:28:02] [PASSED] single_pixel_source_buffer
[17:28:02] [PASSED] single_pixel_clip_rectangle
[17:28:02] [PASSED] well_known_colors
[17:28:02] [PASSED] destination_pitch
[17:28:02] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[17:28:02] ============== drm_test_fb_xrgb8888_to_mono  ===============
[17:28:02] [PASSED] single_pixel_source_buffer
[17:28:02] [PASSED] single_pixel_clip_rectangle
[17:28:02] [PASSED] well_known_colors
[17:28:02] [PASSED] destination_pitch
[17:28:02] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[17:28:02] ==================== drm_test_fb_swab  =====================
[17:28:02] [PASSED] single_pixel_source_buffer
[17:28:02] [PASSED] single_pixel_clip_rectangle
[17:28:02] [PASSED] well_known_colors
[17:28:02] [PASSED] destination_pitch
[17:28:02] ================ [PASSED] drm_test_fb_swab =================
[17:28:02] ================= drm_test_fb_clip_offset  =================
[17:28:02] [PASSED] pass through
[17:28:02] [PASSED] horizontal offset
[17:28:02] [PASSED] vertical offset
[17:28:02] [PASSED] horizontal and vertical offset
[17:28:02] [PASSED] horizontal offset (custom pitch)
[17:28:02] [PASSED] vertical offset (custom pitch)
[17:28:02] [PASSED] horizontal and vertical offset (custom pitch)
[17:28:02] ============= [PASSED] drm_test_fb_clip_offset =============
[17:28:02] ============== drm_test_fb_build_fourcc_list  ==============
[17:28:02] [PASSED] no native formats
[17:28:02] [PASSED] XRGB8888 as native format
[17:28:02] [PASSED] remove duplicates
[17:28:02] [PASSED] convert alpha formats
[17:28:02] [PASSED] random formats
[17:28:02] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[17:28:02] =================== drm_test_fb_memcpy  ====================
[17:28:02] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[17:28:02] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[17:28:02] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[17:28:02] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[17:28:02] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[17:28:02] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[17:28:02] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[17:28:02] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[17:28:02] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[17:28:02] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[17:28:02] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[17:28:02] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[17:28:02] =============== [PASSED] drm_test_fb_memcpy ================
[17:28:02] ============= [PASSED] drm_format_helper_test ==============
[17:28:02] ======================= drm_format  ========================
[17:28:02] [PASSED] drm_test_format_block_width_invalid
[17:28:02] [PASSED] drm_test_format_block_width_one_plane
[17:28:02] [PASSED] drm_test_format_block_width_two_plane
[17:28:02] [PASSED] drm_test_format_block_width_three_plane
[17:28:02] [PASSED] drm_test_format_block_width_tiled
[17:28:02] [PASSED] drm_test_format_block_height_invalid
[17:28:02] [PASSED] drm_test_format_block_height_one_plane
[17:28:02] [PASSED] drm_test_format_block_height_two_plane
[17:28:02] [PASSED] drm_test_format_block_height_three_plane
[17:28:02] [PASSED] drm_test_format_block_height_tiled
[17:28:02] [PASSED] drm_test_format_min_pitch_invalid
[17:28:02] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[17:28:02] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[17:28:02] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[17:28:02] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[17:28:02] [PASSED] drm_test_format_min_pitch_two_plane
[17:28:02] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[17:28:02] [PASSED] drm_test_format_min_pitch_tiled
[17:28:02] =================== [PASSED] drm_format ====================
[17:28:02] ===================== drm_framebuffer  =====================
[17:28:02] =============== drm_test_framebuffer_create  ===============
[17:28:02] [PASSED] ABGR8888 normal sizes
[17:28:02] [PASSED] ABGR8888 max sizes
[17:28:02] [PASSED] ABGR8888 pitch greater than min required
[17:28:02] [PASSED] ABGR8888 pitch less than min required
[17:28:02] [PASSED] ABGR8888 Invalid width
[17:28:02] [PASSED] ABGR8888 Invalid buffer handle
[17:28:02] [PASSED] No pixel format
[17:28:02] [PASSED] ABGR8888 Width 0
[17:28:02] [PASSED] ABGR8888 Height 0
[17:28:02] [PASSED] ABGR8888 Out of bound height * pitch combination
[17:28:02] [PASSED] ABGR8888 Large buffer offset
[17:28:02] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[17:28:02] [PASSED] ABGR8888 Valid buffer modifier
[17:28:02] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[17:28:02] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[17:28:02] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[17:28:02] [PASSED] NV12 Normal sizes
[17:28:02] [PASSED] NV12 Max sizes
[17:28:02] [PASSED] NV12 Invalid pitch
[17:28:02] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[17:28:02] [PASSED] NV12 different  modifier per-plane
[17:28:02] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[17:28:02] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[17:28:02] [PASSED] NV12 Modifier for inexistent plane
[17:28:02] [PASSED] NV12 Handle for inexistent plane
[17:28:03] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[17:28:03] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[17:28:03] [PASSED] YVU420 Normal sizes
[17:28:03] [PASSED] YVU420 Max sizes
[17:28:03] [PASSED] YVU420 Invalid pitch
[17:28:03] [PASSED] YVU420 Different pitches
[17:28:03] [PASSED] YVU420 Different buffer offsets/pitches
[17:28:03] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[17:28:03] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[17:28:03] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[17:28:03] [PASSED] YVU420 Valid modifier
[17:28:03] [PASSED] YVU420 Different modifiers per plane
[17:28:03] [PASSED] YVU420 Modifier for inexistent plane
[17:28:03] [PASSED] X0L2 Normal sizes
[17:28:03] [PASSED] X0L2 Max sizes
[17:28:03] [PASSED] X0L2 Invalid pitch
[17:28:03] [PASSED] X0L2 Pitch greater than minimum required
[17:28:03] [PASSED] X0L2 Handle for inexistent plane
[17:28:03] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[17:28:03] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[17:28:03] [PASSED] X0L2 Valid modifier
[17:28:03] [PASSED] X0L2 Modifier for inexistent plane
[17:28:03] =========== [PASSED] drm_test_framebuffer_create ===========
[17:28:03] ================= [PASSED] drm_framebuffer =================
[17:28:03] ==================== drm-test-managed  =====================
[17:28:03] [PASSED] drm_test_managed_run_action
[17:28:03] ================ [PASSED] drm-test-managed =================
[17:28:03] ========================= drm_mm  ==========================
[17:28:03] [PASSED] drm_test_mm_init
[17:28:03] [PASSED] drm_test_mm_debug
[17:28:13] [PASSED] drm_test_mm_reserve
[17:28:23] [PASSED] drm_test_mm_insert
[17:28:24] [PASSED] drm_test_mm_replace
[17:28:24] [PASSED] drm_test_mm_insert_range
[17:28:24] [PASSED] drm_test_mm_frag
[17:28:24] [PASSED] drm_test_mm_align
[17:28:24] [PASSED] drm_test_mm_align32
[17:28:24] [PASSED] drm_test_mm_align64
[17:28:24] [PASSED] drm_test_mm_evict
[17:28:24] [PASSED] drm_test_mm_evict_range
[17:28:24] [PASSED] drm_test_mm_topdown
[17:28:24] [PASSED] drm_test_mm_bottomup
[17:28:24] [PASSED] drm_test_mm_lowest
[17:28:24] [PASSED] drm_test_mm_highest
[17:28:25] [PASSED] drm_test_mm_color
[17:28:26] [PASSED] drm_test_mm_color_evict
[17:28:26] [PASSED] drm_test_mm_color_evict_range
[17:28:26] ===================== [PASSED] drm_mm ======================
[17:28:26] =================== drm_modes_analog_tv  ===================
[17:28:26] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[17:28:26] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[17:28:26] [PASSED] drm_test_modes_analog_tv_pal_576i
[17:28:26] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[17:28:26] =============== [PASSED] drm_modes_analog_tv ===============
[17:28:26] ==================== drm_plane_helper  =====================
[17:28:26] =============== drm_test_check_plane_state  ================
[17:28:26] [PASSED] clipping_simple
[17:28:26] [PASSED] clipping_rotate_reflect
[17:28:26] [PASSED] positioning_simple
[17:28:26] [PASSED] upscaling
[17:28:26] [PASSED] downscaling
[17:28:26] [PASSED] rounding1
[17:28:26] [PASSED] rounding2
[17:28:26] [PASSED] rounding3
[17:28:26] [PASSED] rounding4
[17:28:26] =========== [PASSED] drm_test_check_plane_state ============
[17:28:26] =========== drm_test_check_invalid_plane_state  ============
[17:28:26] [PASSED] positioning_invalid
[17:28:26] [PASSED] upscaling_invalid
[17:28:26] [PASSED] downscaling_invalid
[17:28:26] ======= [PASSED] drm_test_check_invalid_plane_state ========
[17:28:26] ================ [PASSED] drm_plane_helper =================
[17:28:26] ============ drm_connector_helper_tv_get_modes  ============
[17:28:26] ====== drm_test_connector_helper_tv_get_modes_check  =======
[17:28:26] [PASSED] None
[17:28:26] [PASSED] PAL
[17:28:26] [PASSED] NTSC
[17:28:26] [PASSED] Both, NTSC Default
[17:28:26] [PASSED] Both, PAL Default
[17:28:26] [PASSED] Both, NTSC Default, with PAL on command-line
[17:28:26] [PASSED] Both, PAL Default, with NTSC on command-line
[17:28:26] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[17:28:26] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[17:28:26] ======================== drm_rect  =========================
[17:28:26] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[17:28:26] [PASSED] drm_test_rect_clip_scaled_not_clipped
[17:28:26] [PASSED] drm_test_rect_clip_scaled_clipped
[17:28:26] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[17:28:26] ================= drm_test_rect_intersect  =================
[17:28:26] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[17:28:26] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[17:28:26] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[17:28:26] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[17:28:26] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[17:28:26] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[17:28:26] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[17:28:26] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[17:28:26] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[17:28:26] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[17:28:26] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[17:28:26] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[17:28:26] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[17:28:26] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[17:28:26] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[17:28:26] ============= [PASSED] drm_test_rect_intersect =============
[17:28:26] ================ drm_test_rect_calc_hscale  ================
[17:28:26] [PASSED] normal use
[17:28:26] [PASSED] out of max range
[17:28:26] [PASSED] out of min range
[17:28:26] [PASSED] zero dst
[17:28:26] [PASSED] negative src
[17:28:26] [PASSED] negative dst
[17:28:26] ============ [PASSED] drm_test_rect_calc_hscale ============
[17:28:26] ================ drm_test_rect_calc_vscale  ================
[17:28:26] [PASSED] normal use
[17:28:26] [PASSED] out of max range
[17:28:26] [PASSED] out of min range
[17:28:26] [PASSED] zero dst
[17:28:26] [PASSED] negative src
[17:28:26] [PASSED] negative dst
[17:28:26] ============ [PASSED] drm_test_rect_calc_vscale ============
[17:28:26] ================== drm_test_rect_rotate  ===================
[17:28:26] [PASSED] reflect-x
[17:28:26] [PASSED] reflect-y
[17:28:26] [PASSED] rotate-0
[17:28:26] [PASSED] rotate-90
[17:28:26] [PASSED] rotate-180
[17:28:26] [PASSED] rotate-270
[17:28:26] ============== [PASSED] drm_test_rect_rotate ===============
[17:28:26] ================ drm_test_rect_rotate_inv  =================
[17:28:26] [PASSED] reflect-x
[17:28:26] [PASSED] reflect-y
[17:28:26] [PASSED] rotate-0
[17:28:26] [PASSED] rotate-90
[17:28:26] [PASSED] rotate-180
[17:28:26] [PASSED] rotate-270
[17:28:26] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[17:28:26] ==================== [PASSED] drm_rect =====================
[17:28:26] ======================== drm_exec  =========================
[17:28:26] [PASSED] sanitycheck
[17:28:26] [PASSED] test_lock
[17:28:26] [PASSED] test_lock_unlock
[17:28:26] [PASSED] test_duplicates
[17:28:26] [PASSED] test_prepare
[17:28:26] [PASSED] test_prepare_array
[17:28:26] [PASSED] test_multiple_loops
[17:28:26] ==================== [PASSED] drm_exec =====================
[17:28:26] ============================================================
[17:28:26] Testing complete. Ran 368 tests: passed: 368
[17:28:26] Elapsed time: 44.249s total, 1.672s configuring, 19.243s building, 23.319s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


