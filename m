Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3202AC7618D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 23:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F8310EA78;
	Wed,  5 Apr 2023 23:39:21 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D99D10EA78;
 Wed,  5 Apr 2023 23:39:20 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 49F2BAADDC;
 Wed,  5 Apr 2023 23:39:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 05 Apr 2023 23:39:20 -0000
Message-ID: <168073796029.14695.5386032567392366356@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230405233403.151088-1-matthew.brost@intel.com>
In-Reply-To: <20230405233403.151088-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Try_to_?=
 =?utf-8?q?fix_driver_load_=28again=29?=
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

Series: Try to fix driver load (again)
URL   : https://patchwork.freedesktop.org/series/116171/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[23:38:08] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:38:12] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[23:38:34] Starting KUnit Kernel (1/1)...
[23:38:34] ============================================================
[23:38:34] ==================== xe_bo (2 subtests) ====================
[23:38:34] [SKIPPED] xe_ccs_migrate_kunit
[23:38:34] [SKIPPED] xe_bo_evict_kunit
[23:38:34] ===================== [SKIPPED] xe_bo ======================
[23:38:34] ================== xe_dma_buf (1 subtest) ==================
[23:38:34] [SKIPPED] xe_dma_buf_kunit
[23:38:34] =================== [SKIPPED] xe_dma_buf ===================
[23:38:34] ================== xe_migrate (1 subtest) ==================
[23:38:34] [SKIPPED] xe_migrate_sanity_kunit
[23:38:34] =================== [SKIPPED] xe_migrate ===================
[23:38:34] ==================== xe_rtp (1 subtest) ====================
[23:38:34] ================== xe_rtp_process_tests  ===================
[23:38:34] [PASSED] coalesce-same-reg
[23:38:34] [PASSED] no-match-no-add
[23:38:34] [PASSED] no-match-no-add-multiple-rules
[23:38:34] [PASSED] two-regs-two-entries
[23:38:34] [PASSED] clr-one-set-other
[23:38:34] [PASSED] set-field
[23:38:34] [PASSED] conflict-duplicate
[23:38:34] [PASSED] conflict-not-disjoint
[23:38:34] [PASSED] conflict-reg-type
[23:38:34] ============== [PASSED] xe_rtp_process_tests ===============
[23:38:34] ===================== [PASSED] xe_rtp ======================
[23:38:34] ==================== xe_wa (1 subtest) =====================
[23:38:34] ======================== xe_wa_gt  =========================
[23:38:34] [PASSED] TIGERLAKE (B0)
[23:38:34] [PASSED] DG1 (A0)
[23:38:34] [PASSED] DG1 (B0)
[23:38:34] [PASSED] ALDERLAKE_S (A0)
[23:38:34] [PASSED] ALDERLAKE_S (B0)
[23:38:34] [PASSED] ALDERLAKE_S (C0)
[23:38:34] [PASSED] ALDERLAKE_S (D0)
[23:38:34] [PASSED] DG2_G10 (A0)
[23:38:34] [PASSED] DG2_G10 (A1)
[23:38:34] [PASSED] DG2_G10 (B0)
[23:38:34] [PASSED] DG2_G10 (C0)
[23:38:34] [PASSED] DG2_G11 (A0)
[23:38:34] [PASSED] DG2_G11 (B0)
[23:38:34] [PASSED] DG2_G11 (B1)
[23:38:34] [PASSED] DG2_G12 (A0)
[23:38:34] [PASSED] DG2_G12 (A1)
[23:38:34] [PASSED] PVC (B0)
[23:38:34] [PASSED] PVC (B1)
[23:38:34] [PASSED] PVC (C0)
[23:38:34] ==================== [PASSED] xe_wa_gt =====================
[23:38:34] ====================== [PASSED] xe_wa ======================
[23:38:34] ============================================================
[23:38:34] Testing complete. Ran 32 tests: passed: 28, skipped: 4
[23:38:34] Elapsed time: 25.929s total, 4.233s configuring, 21.577s building, 0.097s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[23:38:34] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:38:36] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[23:38:54] Starting KUnit Kernel (1/1)...
[23:38:54] ============================================================
[23:38:54] ============ drm_test_pick_cmdline (2 subtests) ============
[23:38:54] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[23:38:54] =============== drm_test_pick_cmdline_named  ===============
[23:38:54] [PASSED] NTSC
[23:38:54] [PASSED] NTSC-J
[23:38:54] [PASSED] PAL
[23:38:54] [PASSED] PAL-M
[23:38:54] =========== [PASSED] drm_test_pick_cmdline_named ===========
[23:38:54] ============== [PASSED] drm_test_pick_cmdline ==============
[23:38:54] ================== drm_buddy (6 subtests) ==================
[23:38:54] [PASSED] drm_test_buddy_alloc_limit
[23:38:54] [PASSED] drm_test_buddy_alloc_range
[23:38:54] [PASSED] drm_test_buddy_alloc_optimistic
[23:38:54] [PASSED] drm_test_buddy_alloc_pessimistic
[23:38:54] [PASSED] drm_test_buddy_alloc_smoke
[23:38:54] [PASSED] drm_test_buddy_alloc_pathological
[23:38:54] ==================== [PASSED] drm_buddy ====================
[23:38:54] ============= drm_cmdline_parser (40 subtests) =============
[23:38:54] [PASSED] drm_test_cmdline_force_d_only
[23:38:54] [PASSED] drm_test_cmdline_force_D_only_dvi
[23:38:54] [PASSED] drm_test_cmdline_force_D_only_hdmi
[23:38:54] [PASSED] drm_test_cmdline_force_D_only_not_digital
[23:38:54] [PASSED] drm_test_cmdline_force_e_only
[23:38:54] [PASSED] drm_test_cmdline_res
[23:38:54] [PASSED] drm_test_cmdline_res_vesa
[23:38:54] [PASSED] drm_test_cmdline_res_vesa_rblank
[23:38:54] [PASSED] drm_test_cmdline_res_rblank
[23:38:54] [PASSED] drm_test_cmdline_res_bpp
[23:38:54] [PASSED] drm_test_cmdline_res_refresh
[23:38:54] [PASSED] drm_test_cmdline_res_bpp_refresh
[23:38:54] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[23:38:54] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[23:38:54] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[23:38:54] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[23:38:54] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[23:38:54] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[23:38:54] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[23:38:54] [PASSED] drm_test_cmdline_res_margins_force_on
[23:38:54] [PASSED] drm_test_cmdline_res_vesa_margins
[23:38:54] [PASSED] drm_test_cmdline_name
[23:38:54] [PASSED] drm_test_cmdline_name_bpp
[23:38:54] [PASSED] drm_test_cmdline_name_option
[23:38:54] [PASSED] drm_test_cmdline_name_bpp_option
[23:38:54] [PASSED] drm_test_cmdline_rotate_0
[23:38:54] [PASSED] drm_test_cmdline_rotate_90
[23:38:54] [PASSED] drm_test_cmdline_rotate_180
[23:38:54] [PASSED] drm_test_cmdline_rotate_270
[23:38:54] [PASSED] drm_test_cmdline_hmirror
[23:38:54] [PASSED] drm_test_cmdline_vmirror
[23:38:54] [PASSED] drm_test_cmdline_margin_options
[23:38:54] [PASSED] drm_test_cmdline_multiple_options
[23:38:54] [PASSED] drm_test_cmdline_bpp_extra_and_option
[23:38:54] [PASSED] drm_test_cmdline_extra_and_option
[23:38:54] [PASSED] drm_test_cmdline_freestanding_options
[23:38:54] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[23:38:54] [PASSED] drm_test_cmdline_panel_orientation
[23:38:54] ================ drm_test_cmdline_invalid  =================
[23:38:54] [PASSED] margin_only
[23:38:54] [PASSED] interlace_only
[23:38:54] [PASSED] res_missing_x
[23:38:54] [PASSED] res_missing_y
[23:38:54] [PASSED] res_bad_y
[23:38:54] [PASSED] res_missing_y_bpp
[23:38:54] [PASSED] res_bad_bpp
[23:38:54] [PASSED] res_bad_refresh
[23:38:54] [PASSED] res_bpp_refresh_force_on_off
[23:38:54] [PASSED] res_invalid_mode
[23:38:54] [PASSED] res_bpp_wrong_place_mode
[23:38:54] [PASSED] name_bpp_refresh
[23:38:54] [PASSED] name_refresh
[23:38:54] [PASSED] name_refresh_wrong_mode
[23:38:54] [PASSED] name_refresh_invalid_mode
[23:38:54] [PASSED] rotate_multiple
[23:38:54] [PASSED] rotate_invalid_val
[23:38:54] [PASSED] rotate_truncated
[23:38:54] [PASSED] invalid_option
[23:38:54] [PASSED] invalid_tv_option
[23:38:54] [PASSED] truncated_tv_option
[23:38:54] ============ [PASSED] drm_test_cmdline_invalid =============
[23:38:54] =============== drm_test_cmdline_tv_options  ===============
[23:38:54] [PASSED] NTSC
[23:38:54] [PASSED] NTSC_443
[23:38:54] [PASSED] NTSC_J
[23:38:54] [PASSED] PAL
[23:38:54] [PASSED] PAL_M
[23:38:54] [PASSED] PAL_N
[23:38:54] [PASSED] SECAM
[23:38:54] =========== [PASSED] drm_test_cmdline_tv_options ===========
[23:38:54] =============== [PASSED] drm_cmdline_parser ================
[23:38:54] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[23:38:54] ========== drm_test_get_tv_mode_from_name_valid  ===========
[23:38:54] [PASSED] NTSC
[23:38:54] [PASSED] NTSC-443
[23:38:54] [PASSED] NTSC-J
[23:38:54] [PASSED] PAL
[23:38:54] [PASSED] PAL-M
[23:38:54] [PASSED] PAL-N
[23:38:54] [PASSED] SECAM
[23:38:54] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[23:38:54] [PASSED] drm_test_get_tv_mode_from_name_truncated
[23:38:54] ============ [PASSED] drm_get_tv_mode_from_name ============
[23:38:54] ============= drm_damage_helper (21 subtests) ==============
[23:38:54] [PASSED] drm_test_damage_iter_no_damage
[23:38:54] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[23:38:54] [PASSED] drm_test_damage_iter_no_damage_src_moved
[23:38:54] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[23:38:54] [PASSED] drm_test_damage_iter_no_damage_not_visible
[23:38:54] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[23:38:54] [PASSED] drm_test_damage_iter_no_damage_no_fb
[23:38:54] [PASSED] drm_test_damage_iter_simple_damage
[23:38:54] [PASSED] drm_test_damage_iter_single_damage
[23:38:54] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[23:38:54] [PASSED] drm_test_damage_iter_single_damage_outside_src
[23:38:54] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[23:38:54] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[23:38:54] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[23:38:54] [PASSED] drm_test_damage_iter_single_damage_src_moved
[23:38:54] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[23:38:54] [PASSED] drm_test_damage_iter_damage
[23:38:54] [PASSED] drm_test_damage_iter_damage_one_intersect
[23:38:54] [PASSED] drm_test_damage_iter_damage_one_outside
[23:38:54] [PASSED] drm_test_damage_iter_damage_src_moved
[23:38:54] [PASSED] drm_test_damage_iter_damage_not_visible
[23:38:54] ================ [PASSED] drm_damage_helper ================
[23:38:54] ============== drm_dp_mst_helper (2 subtests) ==============
[23:38:54] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[23:38:54] [PASSED] Clock 154000 BPP 30 DSC disabled
[23:38:54] [PASSED] Clock 234000 BPP 30 DSC disabled
[23:38:54] [PASSED] Clock 297000 BPP 24 DSC disabled
[23:38:54] [PASSED] Clock 332880 BPP 24 DSC enabled
[23:38:54] [PASSED] Clock 324540 BPP 24 DSC enabled
[23:38:54] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[23:38:54] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[23:38:54] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[23:38:54] [PASSED] DP_POWER_UP_PHY with port number
[23:38:54] [PASSED] DP_POWER_DOWN_PHY with port number
[23:38:54] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[23:38:54] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[23:38:54] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[23:38:54] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[23:38:54] [PASSED] DP_QUERY_PAYLOAD with port number
[23:38:54] [PASSED] DP_QUERY_PAYLOAD with VCPI
[23:38:54] [PASSED] DP_REMOTE_DPCD_READ with port number
[23:38:54] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[23:38:54] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[23:38:54] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[23:38:54] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[23:38:54] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[23:38:54] [PASSED] DP_REMOTE_I2C_READ with port number
[23:38:54] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[23:38:54] [PASSED] DP_REMOTE_I2C_READ with transactions array
[23:38:54] [PASSED] DP_REMOTE_I2C_WRITE with port number
[23:38:54] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[23:38:54] [PASSED] DP_REMOTE_I2C_WRITE with data array
[23:38:54] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[23:38:54] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[23:38:54] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[23:38:54] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[23:38:54] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[23:38:54] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[23:38:54] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[23:38:54] ================ [PASSED] drm_dp_mst_helper ================
[23:38:54] =========== drm_format_helper_test (11 subtests) ===========
[23:38:54] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[23:38:54] [PASSED] single_pixel_source_buffer
[23:38:54] [PASSED] single_pixel_clip_rectangle
[23:38:54] [PASSED] well_known_colors
[23:38:54] [PASSED] destination_pitch
[23:38:54] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[23:38:54] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[23:38:54] [PASSED] single_pixel_source_buffer
[23:38:54] [PASSED] single_pixel_clip_rectangle
[23:38:54] [PASSED] well_known_colors
[23:38:54] [PASSED] destination_pitch
[23:38:54] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[23:38:54] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[23:38:54] [PASSED] single_pixel_source_buffer
[23:38:54] [PASSED] single_pixel_clip_rectangle
[23:38:54] [PASSED] well_known_colors
[23:38:54] [PASSED] destination_pitch
[23:38:54] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[23:38:54] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[23:38:54] [PASSED] single_pixel_source_buffer
[23:38:54] [PASSED] single_pixel_clip_rectangle
[23:38:54] [PASSED] well_known_colors
[23:38:54] [PASSED] destination_pitch
[23:38:54] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[23:38:54] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[23:38:54] [PASSED] single_pixel_source_buffer
[23:38:54] [PASSED] single_pixel_clip_rectangle
[23:38:54] [PASSED] well_known_colors
[23:38:54] [PASSED] destination_pitch
[23:38:54] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[23:38:54] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[23:38:54] [PASSED] single_pixel_source_buffer
[23:38:54] [PASSED] single_pixel_clip_rectangle
[23:38:54] [PASSED] well_known_colors
[23:38:54] [PASSED] destination_pitch
[23:38:54] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[23:38:54] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[23:38:54] [PASSED] single_pixel_source_buffer
[23:38:54] [PASSED] single_pixel_clip_rectangle
[23:38:54] [PASSED] well_known_colors
[23:38:54] [PASSED] destination_pitch
[23:38:54] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[23:38:54] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[23:38:54] [PASSED] single_pixel_source_buffer
[23:38:54] [PASSED] single_pixel_clip_rectangle
[23:38:54] [PASSED] well_known_colors
[23:38:54] [PASSED] destination_pitch
[23:38:54] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[23:38:54] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[23:38:54] [PASSED] single_pixel_source_buffer
[23:38:54] [PASSED] single_pixel_clip_rectangle
[23:38:54] [PASSED] well_known_colors
[23:38:54] [PASSED] destination_pitch
[23:38:54] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[23:38:54] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[23:38:54] [PASSED] single_pixel_source_buffer
[23:38:54] [PASSED] single_pixel_clip_rectangle
[23:38:54] [PASSED] well_known_colors
[23:38:54] [PASSED] destination_pitch
[23:38:54] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[23:38:54] ============== drm_test_fb_xrgb8888_to_mono  ===============
[23:38:54] [PASSED] single_pixel_source_buffer
[23:38:54] [PASSED] single_pixel_clip_rectangle
[23:38:54] [PASSED] well_known_colors
[23:38:54] [PASSED] destination_pitch
[23:38:54] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[23:38:54] ============= [PASSED] drm_format_helper_test ==============
[23:38:54] ================= drm_format (18 subtests) =================
[23:38:54] [PASSED] drm_test_format_block_width_invalid
[23:38:54] [PASSED] drm_test_format_block_width_one_plane
[23:38:54] [PASSED] drm_test_format_block_width_two_plane
[23:38:54] [PASSED] drm_test_format_block_width_three_plane
[23:38:54] [PASSED] drm_test_format_block_width_tiled
[23:38:54] [PASSED] drm_test_format_block_height_invalid
[23:38:54] [PASSED] drm_test_format_block_height_one_plane
[23:38:54] [PASSED] drm_test_format_block_height_two_plane
[23:38:54] [PASSED] drm_test_format_block_height_three_plane
[23:38:54] [PASSED] drm_test_format_block_height_tiled
[23:38:54] [PASSED] drm_test_format_min_pitch_invalid
[23:38:54] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[23:38:54] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[23:38:54] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[23:38:54] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[23:38:54] [PASSED] drm_test_format_min_pitch_two_plane
[23:38:54] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[23:38:54] [PASSED] drm_test_format_min_pitch_tiled
[23:38:54] =================== [PASSED] drm_format ====================
[23:38:54] =============== drm_framebuffer (1 subtest) ================
[23:38:54] =============== drm_test_framebuffer_create  ===============
[23:38:54] [PASSED] ABGR8888 normal sizes
[23:38:54] [PASSED] ABGR8888 max sizes
[23:38:54] [PASSED] ABGR8888 pitch greater than min required
[23:38:54] [PASSED] ABGR8888 pitch less than min required
[23:38:54] [PASSED] ABGR8888 Invalid width
[23:38:54] [PASSED] ABGR8888 Invalid buffer handle
[23:38:54] [PASSED] No pixel format
[23:38:54] [PASSED] ABGR8888 Width 0
[23:38:54] [PASSED] ABGR8888 Height 0
[23:38:54] [PASSED] ABGR8888 Out of bound height * pitch combination
[23:38:54] [PASSED] ABGR8888 Large buffer offset
[23:38:54] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[23:38:54] [PASSED] ABGR8888 Valid buffer modifier
[23:38:54] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[23:38:54] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[23:38:54] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[23:38:54] [PASSED] NV12 Normal sizes
[23:38:54] [PASSED] NV12 Max sizes
[23:38:54] [PASSED] NV12 Invalid pitch
[23:38:54] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[23:38:54] [PASSED] NV12 different  modifier per-plane
[23:38:54] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[23:38:54] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[23:38:54] [PASSED] NV12 Modifier for inexistent plane
[23:38:54] [PASSED] NV12 Handle for inexistent plane
[23:38:54] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[23:38:54] [PASSED] YVU420 Normal sizes
[23:38:54] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[23:38:54] [PASSED] YVU420 Max sizes
[23:38:54] [PASSED] YVU420 Invalid pitch
[23:38:54] [PASSED] YVU420 Different pitches
[23:38:54] [PASSED] YVU420 Different buffer offsets/pitches
[23:38:54] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[23:38:54] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[23:38:54] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[23:38:54] [PASSED] YVU420 Valid modifier
[23:38:54] [PASSED] YVU420 Different modifiers per plane
[23:38:54] [PASSED] YVU420 Modifier for inexistent plane
[23:38:54] [PASSED] X0L2 Normal sizes
[23:38:54] [PASSED] X0L2 Max sizes
[23:38:54] [PASSED] X0L2 Invalid pitch
[23:38:54] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[23:38:54] [PASSED] X0L2 Handle for inexistent plane
[23:38:54] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[23:38:54] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[23:38:54] [PASSED] X0L2 Valid modifier
[23:38:54] [PASSED] X0L2 Modifier for inexistent plane
[23:38:54] =========== [PASSED] drm_test_framebuffer_create ===========
[23:38:54] ================= [PASSED] drm_framebuffer =================
[23:38:54] =============== drm-test-managed (1 subtest) ===============
[23:38:54] [PASSED] drm_test_managed_run_action
[23:38:54] ================ [PASSED] drm-test-managed =================
[23:38:54] =================== drm_mm (19 subtests) ===================
[23:38:54] [PASSED] drm_test_mm_init
[23:38:54] [PASSED] drm_test_mm_debug
[23:39:04] [PASSED] drm_test_mm_reserve
[23:39:14] [PASSED] drm_test_mm_insert
[23:39:15] [PASSED] drm_test_mm_replace
[23:39:15] [PASSED] drm_test_mm_insert_range
[23:39:15] [PASSED] drm_test_mm_frag
[23:39:15] [PASSED] drm_test_mm_align
[23:39:15] [PASSED] drm_test_mm_align32
[23:39:15] [PASSED] drm_test_mm_align64
[23:39:16] [PASSED] drm_test_mm_evict
[23:39:16] [PASSED] drm_test_mm_evict_range
[23:39:16] [PASSED] drm_test_mm_topdown
[23:39:16] [PASSED] drm_test_mm_bottomup
[23:39:16] [PASSED] drm_test_mm_lowest
[23:39:16] [PASSED] drm_test_mm_highest
[23:39:16] [PASSED] drm_test_mm_color
[23:39:17] [PASSED] drm_test_mm_color_evict
[23:39:17] [PASSED] drm_test_mm_color_evict_range
[23:39:17] ===================== [PASSED] drm_mm ======================
[23:39:17] ============= drm_modes_analog_tv (4 subtests) =============
[23:39:17] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[23:39:17] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[23:39:17] [PASSED] drm_test_modes_analog_tv_pal_576i
[23:39:17] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[23:39:17] =============== [PASSED] drm_modes_analog_tv ===============
[23:39:17] ============== drm_plane_helper (2 subtests) ===============
[23:39:17] =============== drm_test_check_plane_state  ================
[23:39:17] [PASSED] clipping_simple
[23:39:17] [PASSED] clipping_rotate_reflect
[23:39:17] [PASSED] positioning_simple
[23:39:17] [PASSED] upscaling
[23:39:17] [PASSED] downscaling
[23:39:17] [PASSED] rounding1
[23:39:17] [PASSED] rounding2
[23:39:17] [PASSED] rounding3
[23:39:17] [PASSED] rounding4
[23:39:17] =========== [PASSED] drm_test_check_plane_state ============
[23:39:17] =========== drm_test_check_invalid_plane_state  ============
[23:39:17] [PASSED] positioning_invalid
[23:39:17] [PASSED] upscaling_invalid
[23:39:17] [PASSED] downscaling_invalid
[23:39:17] ======= [PASSED] drm_test_check_invalid_plane_state ========
[23:39:17] ================ [PASSED] drm_plane_helper =================
[23:39:17] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[23:39:17] ====== drm_test_connector_helper_tv_get_modes_check  =======
[23:39:17] [PASSED] None
[23:39:17] [PASSED] PAL
[23:39:17] [PASSED] NTSC
[23:39:17] [PASSED] Both, NTSC Default
[23:39:17] [PASSED] Both, PAL Default
[23:39:17] [PASSED] Both, NTSC Default, with PAL on command-line
[23:39:17] [PASSED] Both, PAL Default, with NTSC on command-line
[23:39:17] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[23:39:17] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[23:39:17] ================== drm_rect (4 subtests) ===================
[23:39:17] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[23:39:17] [PASSED] drm_test_rect_clip_scaled_not_clipped
[23:39:17] [PASSED] drm_test_rect_clip_scaled_clipped
[23:39:17] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[23:39:17] ==================== [PASSED] drm_rect =====================
[23:39:17] ============================================================
[23:39:17] Testing complete. Ran 294 tests: passed: 294
[23:39:17] Elapsed time: 43.060s total, 1.694s configuring, 18.181s building, 23.131s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


