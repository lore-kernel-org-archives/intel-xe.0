Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E82C76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 02:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1944310E077;
	Wed,  5 Apr 2023 02:57:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id EE46810E077;
 Wed,  5 Apr 2023 02:57:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EA4C9AA3D8;
 Wed,  5 Apr 2023 02:57:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 05 Apr 2023 02:57:22 -0000
Message-ID: <168066344295.14700.12219942246512054972@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230405024036.3969996-1-matthew.brost@intel.com>
In-Reply-To: <20230405024036.3969996-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Fix_dri?=
 =?utf-8?q?ver_load_=28rev2=29?=
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

Series: Fix driver load (rev2)
URL   : https://patchwork.freedesktop.org/series/116123/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[02:56:11] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:56:15] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[02:56:37] Starting KUnit Kernel (1/1)...
[02:56:37] ============================================================
[02:56:37] ==================== xe_bo (2 subtests) ====================
[02:56:37] [SKIPPED] xe_ccs_migrate_kunit
[02:56:37] [SKIPPED] xe_bo_evict_kunit
[02:56:37] ===================== [SKIPPED] xe_bo ======================
[02:56:37] ================== xe_dma_buf (1 subtest) ==================
[02:56:37] [SKIPPED] xe_dma_buf_kunit
[02:56:37] =================== [SKIPPED] xe_dma_buf ===================
[02:56:37] ================== xe_migrate (1 subtest) ==================
[02:56:37] [SKIPPED] xe_migrate_sanity_kunit
[02:56:37] =================== [SKIPPED] xe_migrate ===================
[02:56:37] ==================== xe_rtp (1 subtest) ====================
[02:56:37] ================== xe_rtp_process_tests  ===================
[02:56:37] [PASSED] coalesce-same-reg
[02:56:37] [PASSED] no-match-no-add
[02:56:37] [PASSED] no-match-no-add-multiple-rules
[02:56:37] [PASSED] two-regs-two-entries
[02:56:37] [PASSED] clr-one-set-other
[02:56:37] [PASSED] set-field
[02:56:37] [PASSED] conflict-duplicate
[02:56:37] [PASSED] conflict-not-disjoint
[02:56:37] [PASSED] conflict-reg-type
[02:56:37] ============== [PASSED] xe_rtp_process_tests ===============
[02:56:37] ===================== [PASSED] xe_rtp ======================
[02:56:37] ==================== xe_wa (1 subtest) =====================
[02:56:37] ======================== xe_wa_gt  =========================
[02:56:37] [PASSED] TIGERLAKE (B0)
[02:56:37] [PASSED] DG1 (A0)
[02:56:37] [PASSED] DG1 (B0)
[02:56:37] [PASSED] ALDERLAKE_S (A0)
[02:56:37] [PASSED] ALDERLAKE_S (B0)
[02:56:37] [PASSED] ALDERLAKE_S (C0)
[02:56:37] [PASSED] ALDERLAKE_S (D0)
[02:56:37] [PASSED] DG2_G10 (A0)
[02:56:37] [PASSED] DG2_G10 (A1)
[02:56:37] [PASSED] DG2_G10 (B0)
[02:56:37] [PASSED] DG2_G10 (C0)
[02:56:37] [PASSED] DG2_G11 (A0)
[02:56:37] [PASSED] DG2_G11 (B0)
[02:56:37] [PASSED] DG2_G11 (B1)
[02:56:37] [PASSED] DG2_G12 (A0)
[02:56:37] [PASSED] DG2_G12 (A1)
[02:56:37] [PASSED] PVC (B0)
[02:56:37] [PASSED] PVC (B1)
[02:56:37] [PASSED] PVC (C0)
[02:56:37] ==================== [PASSED] xe_wa_gt =====================
[02:56:37] ====================== [PASSED] xe_wa ======================
[02:56:37] ============================================================
[02:56:37] Testing complete. Ran 32 tests: passed: 28, skipped: 4
[02:56:37] Elapsed time: 26.328s total, 4.198s configuring, 21.959s building, 0.135s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[02:56:37] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:56:39] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[02:56:57] Starting KUnit Kernel (1/1)...
[02:56:57] ============================================================
[02:56:58] ============ drm_test_pick_cmdline (2 subtests) ============
[02:56:58] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[02:56:58] =============== drm_test_pick_cmdline_named  ===============
[02:56:58] [PASSED] NTSC
[02:56:58] [PASSED] NTSC-J
[02:56:58] [PASSED] PAL
[02:56:58] [PASSED] PAL-M
[02:56:58] =========== [PASSED] drm_test_pick_cmdline_named ===========
[02:56:58] ============== [PASSED] drm_test_pick_cmdline ==============
[02:56:58] ================== drm_buddy (6 subtests) ==================
[02:56:58] [PASSED] drm_test_buddy_alloc_limit
[02:56:58] [PASSED] drm_test_buddy_alloc_range
[02:56:58] [PASSED] drm_test_buddy_alloc_optimistic
[02:56:58] [PASSED] drm_test_buddy_alloc_pessimistic
[02:56:58] [PASSED] drm_test_buddy_alloc_smoke
[02:56:58] [PASSED] drm_test_buddy_alloc_pathological
[02:56:58] ==================== [PASSED] drm_buddy ====================
[02:56:58] ============= drm_cmdline_parser (40 subtests) =============
[02:56:58] [PASSED] drm_test_cmdline_force_d_only
[02:56:58] [PASSED] drm_test_cmdline_force_D_only_dvi
[02:56:58] [PASSED] drm_test_cmdline_force_D_only_hdmi
[02:56:58] [PASSED] drm_test_cmdline_force_D_only_not_digital
[02:56:58] [PASSED] drm_test_cmdline_force_e_only
[02:56:58] [PASSED] drm_test_cmdline_res
[02:56:58] [PASSED] drm_test_cmdline_res_vesa
[02:56:58] [PASSED] drm_test_cmdline_res_vesa_rblank
[02:56:58] [PASSED] drm_test_cmdline_res_rblank
[02:56:58] [PASSED] drm_test_cmdline_res_bpp
[02:56:58] [PASSED] drm_test_cmdline_res_refresh
[02:56:58] [PASSED] drm_test_cmdline_res_bpp_refresh
[02:56:58] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[02:56:58] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[02:56:58] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[02:56:58] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[02:56:58] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[02:56:58] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[02:56:58] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[02:56:58] [PASSED] drm_test_cmdline_res_margins_force_on
[02:56:58] [PASSED] drm_test_cmdline_res_vesa_margins
[02:56:58] [PASSED] drm_test_cmdline_name
[02:56:58] [PASSED] drm_test_cmdline_name_bpp
[02:56:58] [PASSED] drm_test_cmdline_name_option
[02:56:58] [PASSED] drm_test_cmdline_name_bpp_option
[02:56:58] [PASSED] drm_test_cmdline_rotate_0
[02:56:58] [PASSED] drm_test_cmdline_rotate_90
[02:56:58] [PASSED] drm_test_cmdline_rotate_180
[02:56:58] [PASSED] drm_test_cmdline_rotate_270
[02:56:58] [PASSED] drm_test_cmdline_hmirror
[02:56:58] [PASSED] drm_test_cmdline_vmirror
[02:56:58] [PASSED] drm_test_cmdline_margin_options
[02:56:58] [PASSED] drm_test_cmdline_multiple_options
[02:56:58] [PASSED] drm_test_cmdline_bpp_extra_and_option
[02:56:58] [PASSED] drm_test_cmdline_extra_and_option
[02:56:58] [PASSED] drm_test_cmdline_freestanding_options
[02:56:58] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[02:56:58] [PASSED] drm_test_cmdline_panel_orientation
[02:56:58] ================ drm_test_cmdline_invalid  =================
[02:56:58] [PASSED] margin_only
[02:56:58] [PASSED] interlace_only
[02:56:58] [PASSED] res_missing_x
[02:56:58] [PASSED] res_missing_y
[02:56:58] [PASSED] res_bad_y
[02:56:58] [PASSED] res_missing_y_bpp
[02:56:58] [PASSED] res_bad_bpp
[02:56:58] [PASSED] res_bad_refresh
[02:56:58] [PASSED] res_bpp_refresh_force_on_off
[02:56:58] [PASSED] res_invalid_mode
[02:56:58] [PASSED] res_bpp_wrong_place_mode
[02:56:58] [PASSED] name_bpp_refresh
[02:56:58] [PASSED] name_refresh
[02:56:58] [PASSED] name_refresh_wrong_mode
[02:56:58] [PASSED] name_refresh_invalid_mode
[02:56:58] [PASSED] rotate_multiple
[02:56:58] [PASSED] rotate_invalid_val
[02:56:58] [PASSED] rotate_truncated
[02:56:58] [PASSED] invalid_option
[02:56:58] [PASSED] invalid_tv_option
[02:56:58] [PASSED] truncated_tv_option
[02:56:58] ============ [PASSED] drm_test_cmdline_invalid =============
[02:56:58] =============== drm_test_cmdline_tv_options  ===============
[02:56:58] [PASSED] NTSC
[02:56:58] [PASSED] NTSC_443
[02:56:58] [PASSED] NTSC_J
[02:56:58] [PASSED] PAL
[02:56:58] [PASSED] PAL_M
[02:56:58] [PASSED] PAL_N
[02:56:58] [PASSED] SECAM
[02:56:58] =========== [PASSED] drm_test_cmdline_tv_options ===========
[02:56:58] =============== [PASSED] drm_cmdline_parser ================
[02:56:58] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[02:56:58] ========== drm_test_get_tv_mode_from_name_valid  ===========
[02:56:58] [PASSED] NTSC
[02:56:58] [PASSED] NTSC-443
[02:56:58] [PASSED] NTSC-J
[02:56:58] [PASSED] PAL
[02:56:58] [PASSED] PAL-M
[02:56:58] [PASSED] PAL-N
[02:56:58] [PASSED] SECAM
[02:56:58] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[02:56:58] [PASSED] drm_test_get_tv_mode_from_name_truncated
[02:56:58] ============ [PASSED] drm_get_tv_mode_from_name ============
[02:56:58] ============= drm_damage_helper (21 subtests) ==============
[02:56:58] [PASSED] drm_test_damage_iter_no_damage
[02:56:58] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[02:56:58] [PASSED] drm_test_damage_iter_no_damage_src_moved
[02:56:58] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[02:56:58] [PASSED] drm_test_damage_iter_no_damage_not_visible
[02:56:58] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[02:56:58] [PASSED] drm_test_damage_iter_no_damage_no_fb
[02:56:58] [PASSED] drm_test_damage_iter_simple_damage
[02:56:58] [PASSED] drm_test_damage_iter_single_damage
[02:56:58] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[02:56:58] [PASSED] drm_test_damage_iter_single_damage_outside_src
[02:56:58] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[02:56:58] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[02:56:58] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[02:56:58] [PASSED] drm_test_damage_iter_single_damage_src_moved
[02:56:58] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[02:56:58] [PASSED] drm_test_damage_iter_damage
[02:56:58] [PASSED] drm_test_damage_iter_damage_one_intersect
[02:56:58] [PASSED] drm_test_damage_iter_damage_one_outside
[02:56:58] [PASSED] drm_test_damage_iter_damage_src_moved
[02:56:58] [PASSED] drm_test_damage_iter_damage_not_visible
[02:56:58] ================ [PASSED] drm_damage_helper ================
[02:56:58] ============== drm_dp_mst_helper (2 subtests) ==============
[02:56:58] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[02:56:58] [PASSED] Clock 154000 BPP 30 DSC disabled
[02:56:58] [PASSED] Clock 234000 BPP 30 DSC disabled
[02:56:58] [PASSED] Clock 297000 BPP 24 DSC disabled
[02:56:58] [PASSED] Clock 332880 BPP 24 DSC enabled
[02:56:58] [PASSED] Clock 324540 BPP 24 DSC enabled
[02:56:58] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[02:56:58] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[02:56:58] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[02:56:58] [PASSED] DP_POWER_UP_PHY with port number
[02:56:58] [PASSED] DP_POWER_DOWN_PHY with port number
[02:56:58] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[02:56:58] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[02:56:58] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[02:56:58] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[02:56:58] [PASSED] DP_QUERY_PAYLOAD with port number
[02:56:58] [PASSED] DP_QUERY_PAYLOAD with VCPI
[02:56:58] [PASSED] DP_REMOTE_DPCD_READ with port number
[02:56:58] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[02:56:58] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[02:56:58] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[02:56:58] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[02:56:58] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[02:56:58] [PASSED] DP_REMOTE_I2C_READ with port number
[02:56:58] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[02:56:58] [PASSED] DP_REMOTE_I2C_READ with transactions array
[02:56:58] [PASSED] DP_REMOTE_I2C_WRITE with port number
[02:56:58] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[02:56:58] [PASSED] DP_REMOTE_I2C_WRITE with data array
[02:56:58] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[02:56:58] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[02:56:58] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[02:56:58] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[02:56:58] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[02:56:58] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[02:56:58] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[02:56:58] ================ [PASSED] drm_dp_mst_helper ================
[02:56:58] =========== drm_format_helper_test (11 subtests) ===========
[02:56:58] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[02:56:58] [PASSED] single_pixel_source_buffer
[02:56:58] [PASSED] single_pixel_clip_rectangle
[02:56:58] [PASSED] well_known_colors
[02:56:58] [PASSED] destination_pitch
[02:56:58] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[02:56:58] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[02:56:58] [PASSED] single_pixel_source_buffer
[02:56:58] [PASSED] single_pixel_clip_rectangle
[02:56:58] [PASSED] well_known_colors
[02:56:58] [PASSED] destination_pitch
[02:56:58] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[02:56:58] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[02:56:58] [PASSED] single_pixel_source_buffer
[02:56:58] [PASSED] single_pixel_clip_rectangle
[02:56:58] [PASSED] well_known_colors
[02:56:58] [PASSED] destination_pitch
[02:56:58] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[02:56:58] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[02:56:58] [PASSED] single_pixel_source_buffer
[02:56:58] [PASSED] single_pixel_clip_rectangle
[02:56:58] [PASSED] well_known_colors
[02:56:58] [PASSED] destination_pitch
[02:56:58] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[02:56:58] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[02:56:58] [PASSED] single_pixel_source_buffer
[02:56:58] [PASSED] single_pixel_clip_rectangle
[02:56:58] [PASSED] well_known_colors
[02:56:58] [PASSED] destination_pitch
[02:56:58] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[02:56:58] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[02:56:58] [PASSED] single_pixel_source_buffer
[02:56:58] [PASSED] single_pixel_clip_rectangle
[02:56:58] [PASSED] well_known_colors
[02:56:58] [PASSED] destination_pitch
[02:56:58] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[02:56:58] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[02:56:58] [PASSED] single_pixel_source_buffer
[02:56:58] [PASSED] single_pixel_clip_rectangle
[02:56:58] [PASSED] well_known_colors
[02:56:58] [PASSED] destination_pitch
[02:56:58] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[02:56:58] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[02:56:58] [PASSED] single_pixel_source_buffer
[02:56:58] [PASSED] single_pixel_clip_rectangle
[02:56:58] [PASSED] well_known_colors
[02:56:58] [PASSED] destination_pitch
[02:56:58] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[02:56:58] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[02:56:58] [PASSED] single_pixel_source_buffer
[02:56:58] [PASSED] single_pixel_clip_rectangle
[02:56:58] [PASSED] well_known_colors
[02:56:58] [PASSED] destination_pitch
[02:56:58] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[02:56:58] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[02:56:58] [PASSED] single_pixel_source_buffer
[02:56:58] [PASSED] single_pixel_clip_rectangle
[02:56:58] [PASSED] well_known_colors
[02:56:58] [PASSED] destination_pitch
[02:56:58] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[02:56:58] ============== drm_test_fb_xrgb8888_to_mono  ===============
[02:56:58] [PASSED] single_pixel_source_buffer
[02:56:58] [PASSED] single_pixel_clip_rectangle
[02:56:58] [PASSED] well_known_colors
[02:56:58] [PASSED] destination_pitch
[02:56:58] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[02:56:58] ============= [PASSED] drm_format_helper_test ==============
[02:56:58] ================= drm_format (18 subtests) =================
[02:56:58] [PASSED] drm_test_format_block_width_invalid
[02:56:58] [PASSED] drm_test_format_block_width_one_plane
[02:56:58] [PASSED] drm_test_format_block_width_two_plane
[02:56:58] [PASSED] drm_test_format_block_width_three_plane
[02:56:58] [PASSED] drm_test_format_block_width_tiled
[02:56:58] [PASSED] drm_test_format_block_height_invalid
[02:56:58] [PASSED] drm_test_format_block_height_one_plane
[02:56:58] [PASSED] drm_test_format_block_height_two_plane
[02:56:58] [PASSED] drm_test_format_block_height_three_plane
[02:56:58] [PASSED] drm_test_format_block_height_tiled
[02:56:58] [PASSED] drm_test_format_min_pitch_invalid
[02:56:58] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[02:56:58] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[02:56:58] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[02:56:58] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[02:56:58] [PASSED] drm_test_format_min_pitch_two_plane
[02:56:58] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[02:56:58] [PASSED] drm_test_format_min_pitch_tiled
[02:56:58] =================== [PASSED] drm_format ====================
[02:56:58] =============== drm_framebuffer (1 subtest) ================
[02:56:58] =============== drm_test_framebuffer_create  ===============
[02:56:58] [PASSED] ABGR8888 normal sizes
[02:56:58] [PASSED] ABGR8888 max sizes
[02:56:58] [PASSED] ABGR8888 pitch greater than min required
[02:56:58] [PASSED] ABGR8888 pitch less than min required
[02:56:58] [PASSED] ABGR8888 Invalid width
[02:56:58] [PASSED] ABGR8888 Invalid buffer handle
[02:56:58] [PASSED] No pixel format
[02:56:58] [PASSED] ABGR8888 Width 0
[02:56:58] [PASSED] ABGR8888 Height 0
[02:56:58] [PASSED] ABGR8888 Out of bound height * pitch combination
[02:56:58] [PASSED] ABGR8888 Large buffer offset
[02:56:58] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[02:56:58] [PASSED] ABGR8888 Valid buffer modifier
[02:56:58] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[02:56:58] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[02:56:58] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[02:56:58] [PASSED] NV12 Normal sizes
[02:56:58] [PASSED] NV12 Max sizes
[02:56:58] [PASSED] NV12 Invalid pitch
[02:56:58] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[02:56:58] [PASSED] NV12 different  modifier per-plane
[02:56:58] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[02:56:58] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[02:56:58] [PASSED] NV12 Modifier for inexistent plane
[02:56:58] [PASSED] NV12 Handle for inexistent plane
[02:56:58] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[02:56:58] [PASSED] YVU420 Normal sizes
[02:56:58] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[02:56:58] [PASSED] YVU420 Max sizes
[02:56:58] [PASSED] YVU420 Invalid pitch
[02:56:58] [PASSED] YVU420 Different pitches
[02:56:58] [PASSED] YVU420 Different buffer offsets/pitches
[02:56:58] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[02:56:58] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[02:56:58] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[02:56:58] [PASSED] YVU420 Valid modifier
[02:56:58] [PASSED] YVU420 Different modifiers per plane
[02:56:58] [PASSED] YVU420 Modifier for inexistent plane
[02:56:58] [PASSED] X0L2 Normal sizes
[02:56:58] [PASSED] X0L2 Max sizes
[02:56:58] [PASSED] X0L2 Invalid pitch
[02:56:58] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[02:56:58] [PASSED] X0L2 Handle for inexistent plane
[02:56:58] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[02:56:58] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[02:56:58] [PASSED] X0L2 Valid modifier
[02:56:58] [PASSED] X0L2 Modifier for inexistent plane
[02:56:58] =========== [PASSED] drm_test_framebuffer_create ===========
[02:56:58] ================= [PASSED] drm_framebuffer =================
[02:56:58] =============== drm-test-managed (1 subtest) ===============
[02:56:58] [PASSED] drm_test_managed_run_action
[02:56:58] ================ [PASSED] drm-test-managed =================
[02:56:58] =================== drm_mm (19 subtests) ===================
[02:56:58] [PASSED] drm_test_mm_init
[02:56:58] [PASSED] drm_test_mm_debug
[02:57:08] [PASSED] drm_test_mm_reserve
[02:57:17] [PASSED] drm_test_mm_insert
[02:57:18] [PASSED] drm_test_mm_replace
[02:57:18] [PASSED] drm_test_mm_insert_range
[02:57:18] [PASSED] drm_test_mm_frag
[02:57:18] [PASSED] drm_test_mm_align
[02:57:18] [PASSED] drm_test_mm_align32
[02:57:19] [PASSED] drm_test_mm_align64
[02:57:19] [PASSED] drm_test_mm_evict
[02:57:19] [PASSED] drm_test_mm_evict_range
[02:57:19] [PASSED] drm_test_mm_topdown
[02:57:19] [PASSED] drm_test_mm_bottomup
[02:57:19] [PASSED] drm_test_mm_lowest
[02:57:19] [PASSED] drm_test_mm_highest
[02:57:20] [PASSED] drm_test_mm_color
[02:57:20] [PASSED] drm_test_mm_color_evict
[02:57:20] [PASSED] drm_test_mm_color_evict_range
[02:57:20] ===================== [PASSED] drm_mm ======================
[02:57:20] ============= drm_modes_analog_tv (4 subtests) =============
[02:57:20] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[02:57:20] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[02:57:20] [PASSED] drm_test_modes_analog_tv_pal_576i
[02:57:20] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[02:57:20] =============== [PASSED] drm_modes_analog_tv ===============
[02:57:20] ============== drm_plane_helper (2 subtests) ===============
[02:57:20] =============== drm_test_check_plane_state  ================
[02:57:20] [PASSED] clipping_simple
[02:57:20] [PASSED] clipping_rotate_reflect
[02:57:20] [PASSED] positioning_simple
[02:57:20] [PASSED] upscaling
[02:57:20] [PASSED] downscaling
[02:57:20] [PASSED] rounding1
[02:57:20] [PASSED] rounding2
[02:57:20] [PASSED] rounding3
[02:57:20] [PASSED] rounding4
[02:57:20] =========== [PASSED] drm_test_check_plane_state ============
[02:57:20] =========== drm_test_check_invalid_plane_state  ============
[02:57:20] [PASSED] positioning_invalid
[02:57:20] [PASSED] upscaling_invalid
[02:57:20] [PASSED] downscaling_invalid
[02:57:20] ======= [PASSED] drm_test_check_invalid_plane_state ========
[02:57:20] ================ [PASSED] drm_plane_helper =================
[02:57:20] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[02:57:20] ====== drm_test_connector_helper_tv_get_modes_check  =======
[02:57:20] [PASSED] None
[02:57:20] [PASSED] PAL
[02:57:20] [PASSED] NTSC
[02:57:20] [PASSED] Both, NTSC Default
[02:57:20] [PASSED] Both, PAL Default
[02:57:20] [PASSED] Both, NTSC Default, with PAL on command-line
[02:57:20] [PASSED] Both, PAL Default, with NTSC on command-line
[02:57:20] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[02:57:20] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[02:57:20] ================== drm_rect (4 subtests) ===================
[02:57:20] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[02:57:20] [PASSED] drm_test_rect_clip_scaled_not_clipped
[02:57:20] [PASSED] drm_test_rect_clip_scaled_clipped
[02:57:20] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[02:57:20] ==================== [PASSED] drm_rect =====================
[02:57:20] ============================================================
[02:57:20] Testing complete. Ran 294 tests: passed: 294
[02:57:20] Elapsed time: 42.905s total, 1.704s configuring, 18.424s building, 22.755s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


