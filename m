Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4755FC761A6
	for <intel-xe@archiver.kernel.org>; Mon, 27 Mar 2023 12:52:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBBA10E5A0;
	Mon, 27 Mar 2023 12:52:48 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 69F0010E5A0;
 Mon, 27 Mar 2023 12:52:45 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6611CAADD7;
 Mon, 27 Mar 2023 12:52:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 27 Mar 2023 12:52:45 -0000
Message-ID: <167992156541.32630.15602089653413436298@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230327124807.54459-1-matthew.auld@intel.com>
In-Reply-To: <20230327124807.54459-1-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_uAPI_bi?=
 =?utf-8?q?ts_for_small-bar_=28rev3=29?=
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

Series: uAPI bits for small-bar (rev3)
URL   : https://patchwork.freedesktop.org/series/115515/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[12:51:33] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:51:38] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[12:51:59] Starting KUnit Kernel (1/1)...
[12:51:59] ============================================================
[12:51:59] ==================== xe_bo (2 subtests) ====================
[12:51:59] [SKIPPED] xe_ccs_migrate_kunit
[12:51:59] [SKIPPED] xe_bo_evict_kunit
[12:51:59] ===================== [SKIPPED] xe_bo ======================
[12:51:59] ================== xe_dma_buf (1 subtest) ==================
[12:51:59] [SKIPPED] xe_dma_buf_kunit
[12:51:59] =================== [SKIPPED] xe_dma_buf ===================
[12:51:59] ================== xe_migrate (1 subtest) ==================
[12:51:59] [SKIPPED] xe_migrate_sanity_kunit
[12:51:59] =================== [SKIPPED] xe_migrate ===================
[12:51:59] ============================================================
[12:51:59] Testing complete. Ran 4 tests: skipped: 4
[12:51:59] Elapsed time: 25.922s total, 4.175s configuring, 21.628s building, 0.092s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[12:51:59] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:52:01] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[12:52:20] Starting KUnit Kernel (1/1)...
[12:52:20] ============================================================
[12:52:20] ============ drm_test_pick_cmdline (2 subtests) ============
[12:52:20] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[12:52:20] =============== drm_test_pick_cmdline_named  ===============
[12:52:20] [PASSED] NTSC
[12:52:20] [PASSED] NTSC-J
[12:52:20] [PASSED] PAL
[12:52:20] [PASSED] PAL-M
[12:52:20] =========== [PASSED] drm_test_pick_cmdline_named ===========
[12:52:20] ============== [PASSED] drm_test_pick_cmdline ==============
[12:52:20] ================== drm_buddy (6 subtests) ==================
[12:52:20] [PASSED] drm_test_buddy_alloc_limit
[12:52:20] [PASSED] drm_test_buddy_alloc_range
[12:52:20] [PASSED] drm_test_buddy_alloc_optimistic
[12:52:20] [PASSED] drm_test_buddy_alloc_pessimistic
[12:52:20] [PASSED] drm_test_buddy_alloc_smoke
[12:52:20] [PASSED] drm_test_buddy_alloc_pathological
[12:52:20] ==================== [PASSED] drm_buddy ====================
[12:52:20] ============= drm_cmdline_parser (40 subtests) =============
[12:52:20] [PASSED] drm_test_cmdline_force_d_only
[12:52:20] [PASSED] drm_test_cmdline_force_D_only_dvi
[12:52:20] [PASSED] drm_test_cmdline_force_D_only_hdmi
[12:52:20] [PASSED] drm_test_cmdline_force_D_only_not_digital
[12:52:20] [PASSED] drm_test_cmdline_force_e_only
[12:52:20] [PASSED] drm_test_cmdline_res
[12:52:20] [PASSED] drm_test_cmdline_res_vesa
[12:52:20] [PASSED] drm_test_cmdline_res_vesa_rblank
[12:52:20] [PASSED] drm_test_cmdline_res_rblank
[12:52:20] [PASSED] drm_test_cmdline_res_bpp
[12:52:20] [PASSED] drm_test_cmdline_res_refresh
[12:52:20] [PASSED] drm_test_cmdline_res_bpp_refresh
[12:52:20] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[12:52:20] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[12:52:20] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[12:52:20] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[12:52:20] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[12:52:20] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[12:52:20] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[12:52:20] [PASSED] drm_test_cmdline_res_margins_force_on
[12:52:20] [PASSED] drm_test_cmdline_res_vesa_margins
[12:52:20] [PASSED] drm_test_cmdline_name
[12:52:20] [PASSED] drm_test_cmdline_name_bpp
[12:52:20] [PASSED] drm_test_cmdline_name_option
[12:52:20] [PASSED] drm_test_cmdline_name_bpp_option
[12:52:20] [PASSED] drm_test_cmdline_rotate_0
[12:52:20] [PASSED] drm_test_cmdline_rotate_90
[12:52:20] [PASSED] drm_test_cmdline_rotate_180
[12:52:20] [PASSED] drm_test_cmdline_rotate_270
[12:52:20] [PASSED] drm_test_cmdline_hmirror
[12:52:20] [PASSED] drm_test_cmdline_vmirror
[12:52:20] [PASSED] drm_test_cmdline_margin_options
[12:52:20] [PASSED] drm_test_cmdline_multiple_options
[12:52:20] [PASSED] drm_test_cmdline_bpp_extra_and_option
[12:52:20] [PASSED] drm_test_cmdline_extra_and_option
[12:52:20] [PASSED] drm_test_cmdline_freestanding_options
[12:52:20] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[12:52:20] [PASSED] drm_test_cmdline_panel_orientation
[12:52:20] ================ drm_test_cmdline_invalid  =================
[12:52:20] [PASSED] margin_only
[12:52:20] [PASSED] interlace_only
[12:52:20] [PASSED] res_missing_x
[12:52:20] [PASSED] res_missing_y
[12:52:20] [PASSED] res_bad_y
[12:52:20] [PASSED] res_missing_y_bpp
[12:52:20] [PASSED] res_bad_bpp
[12:52:20] [PASSED] res_bad_refresh
[12:52:20] [PASSED] res_bpp_refresh_force_on_off
[12:52:20] [PASSED] res_invalid_mode
[12:52:20] [PASSED] res_bpp_wrong_place_mode
[12:52:20] [PASSED] name_bpp_refresh
[12:52:20] [PASSED] name_refresh
[12:52:20] [PASSED] name_refresh_wrong_mode
[12:52:20] [PASSED] name_refresh_invalid_mode
[12:52:20] [PASSED] rotate_multiple
[12:52:20] [PASSED] rotate_invalid_val
[12:52:20] [PASSED] rotate_truncated
[12:52:20] [PASSED] invalid_option
[12:52:20] [PASSED] invalid_tv_option
[12:52:20] [PASSED] truncated_tv_option
[12:52:20] ============ [PASSED] drm_test_cmdline_invalid =============
[12:52:20] =============== drm_test_cmdline_tv_options  ===============
[12:52:20] [PASSED] NTSC
[12:52:20] [PASSED] NTSC_443
[12:52:20] [PASSED] NTSC_J
[12:52:20] [PASSED] PAL
[12:52:20] [PASSED] PAL_M
[12:52:20] [PASSED] PAL_N
[12:52:20] [PASSED] SECAM
[12:52:20] =========== [PASSED] drm_test_cmdline_tv_options ===========
[12:52:20] =============== [PASSED] drm_cmdline_parser ================
[12:52:20] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[12:52:20] ========== drm_test_get_tv_mode_from_name_valid  ===========
[12:52:20] [PASSED] NTSC
[12:52:20] [PASSED] NTSC-443
[12:52:20] [PASSED] NTSC-J
[12:52:20] [PASSED] PAL
[12:52:20] [PASSED] PAL-M
[12:52:20] [PASSED] PAL-N
[12:52:20] [PASSED] SECAM
[12:52:20] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[12:52:20] [PASSED] drm_test_get_tv_mode_from_name_truncated
[12:52:20] ============ [PASSED] drm_get_tv_mode_from_name ============
[12:52:20] ============= drm_damage_helper (21 subtests) ==============
[12:52:20] [PASSED] drm_test_damage_iter_no_damage
[12:52:20] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[12:52:20] [PASSED] drm_test_damage_iter_no_damage_src_moved
[12:52:20] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[12:52:20] [PASSED] drm_test_damage_iter_no_damage_not_visible
[12:52:20] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[12:52:20] [PASSED] drm_test_damage_iter_no_damage_no_fb
[12:52:20] [PASSED] drm_test_damage_iter_simple_damage
[12:52:20] [PASSED] drm_test_damage_iter_single_damage
[12:52:20] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[12:52:20] [PASSED] drm_test_damage_iter_single_damage_outside_src
[12:52:20] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[12:52:20] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[12:52:20] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[12:52:20] [PASSED] drm_test_damage_iter_single_damage_src_moved
[12:52:20] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[12:52:20] [PASSED] drm_test_damage_iter_damage
[12:52:20] [PASSED] drm_test_damage_iter_damage_one_intersect
[12:52:20] [PASSED] drm_test_damage_iter_damage_one_outside
[12:52:20] [PASSED] drm_test_damage_iter_damage_src_moved
[12:52:20] [PASSED] drm_test_damage_iter_damage_not_visible
[12:52:20] ================ [PASSED] drm_damage_helper ================
[12:52:20] ============== drm_dp_mst_helper (2 subtests) ==============
[12:52:20] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[12:52:20] [PASSED] Clock 154000 BPP 30 DSC disabled
[12:52:20] [PASSED] Clock 234000 BPP 30 DSC disabled
[12:52:20] [PASSED] Clock 297000 BPP 24 DSC disabled
[12:52:20] [PASSED] Clock 332880 BPP 24 DSC enabled
[12:52:20] [PASSED] Clock 324540 BPP 24 DSC enabled
[12:52:20] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[12:52:20] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[12:52:20] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[12:52:20] [PASSED] DP_POWER_UP_PHY with port number
[12:52:20] [PASSED] DP_POWER_DOWN_PHY with port number
[12:52:20] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[12:52:20] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[12:52:20] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[12:52:20] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[12:52:20] [PASSED] DP_QUERY_PAYLOAD with port number
[12:52:20] [PASSED] DP_QUERY_PAYLOAD with VCPI
[12:52:20] [PASSED] DP_REMOTE_DPCD_READ with port number
[12:52:20] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[12:52:20] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[12:52:20] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[12:52:20] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[12:52:20] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[12:52:20] [PASSED] DP_REMOTE_I2C_READ with port number
[12:52:20] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[12:52:20] [PASSED] DP_REMOTE_I2C_READ with transactions array
[12:52:20] [PASSED] DP_REMOTE_I2C_WRITE with port number
[12:52:20] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[12:52:20] [PASSED] DP_REMOTE_I2C_WRITE with data array
[12:52:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[12:52:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[12:52:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[12:52:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[12:52:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[12:52:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[12:52:20] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[12:52:20] ================ [PASSED] drm_dp_mst_helper ================
[12:52:20] =========== drm_format_helper_test (10 subtests) ===========
[12:52:20] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[12:52:20] [PASSED] single_pixel_source_buffer
[12:52:20] [PASSED] single_pixel_clip_rectangle
[12:52:20] [PASSED] well_known_colors
[12:52:20] [PASSED] destination_pitch
[12:52:20] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[12:52:20] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[12:52:20] [PASSED] single_pixel_source_buffer
[12:52:20] [PASSED] single_pixel_clip_rectangle
[12:52:20] [PASSED] well_known_colors
[12:52:20] [PASSED] destination_pitch
[12:52:20] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[12:52:20] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[12:52:20] [PASSED] single_pixel_source_buffer
[12:52:20] [PASSED] single_pixel_clip_rectangle
[12:52:20] [PASSED] well_known_colors
[12:52:20] [PASSED] destination_pitch
[12:52:20] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[12:52:20] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[12:52:20] [PASSED] single_pixel_source_buffer
[12:52:20] [PASSED] single_pixel_clip_rectangle
[12:52:20] [PASSED] well_known_colors
[12:52:20] [PASSED] destination_pitch
[12:52:20] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[12:52:20] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[12:52:20] [PASSED] single_pixel_source_buffer
[12:52:20] [PASSED] single_pixel_clip_rectangle
[12:52:20] [PASSED] well_known_colors
[12:52:20] [PASSED] destination_pitch
[12:52:20] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[12:52:20] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[12:52:20] [PASSED] single_pixel_source_buffer
[12:52:20] [PASSED] single_pixel_clip_rectangle
[12:52:20] [PASSED] well_known_colors
[12:52:20] [PASSED] destination_pitch
[12:52:20] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[12:52:20] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[12:52:20] [PASSED] single_pixel_source_buffer
[12:52:20] [PASSED] single_pixel_clip_rectangle
[12:52:20] [PASSED] well_known_colors
[12:52:20] [PASSED] destination_pitch
[12:52:20] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[12:52:20] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[12:52:20] [PASSED] single_pixel_source_buffer
[12:52:20] [PASSED] single_pixel_clip_rectangle
[12:52:20] [PASSED] well_known_colors
[12:52:20] [PASSED] destination_pitch
[12:52:20] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[12:52:20] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[12:52:20] [PASSED] single_pixel_source_buffer
[12:52:20] [PASSED] single_pixel_clip_rectangle
[12:52:20] [PASSED] well_known_colors
[12:52:20] [PASSED] destination_pitch
[12:52:20] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[12:52:20] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[12:52:20] [PASSED] single_pixel_source_buffer
[12:52:20] [PASSED] single_pixel_clip_rectangle
[12:52:20] [PASSED] well_known_colors
[12:52:20] [PASSED] destination_pitch
[12:52:20] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[12:52:20] ============= [PASSED] drm_format_helper_test ==============
[12:52:20] ================= drm_format (18 subtests) =================
[12:52:20] [PASSED] drm_test_format_block_width_invalid
[12:52:20] [PASSED] drm_test_format_block_width_one_plane
[12:52:20] [PASSED] drm_test_format_block_width_two_plane
[12:52:20] [PASSED] drm_test_format_block_width_three_plane
[12:52:20] [PASSED] drm_test_format_block_width_tiled
[12:52:20] [PASSED] drm_test_format_block_height_invalid
[12:52:20] [PASSED] drm_test_format_block_height_one_plane
[12:52:20] [PASSED] drm_test_format_block_height_two_plane
[12:52:20] [PASSED] drm_test_format_block_height_three_plane
[12:52:20] [PASSED] drm_test_format_block_height_tiled
[12:52:20] [PASSED] drm_test_format_min_pitch_invalid
[12:52:20] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[12:52:20] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[12:52:20] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[12:52:20] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[12:52:20] [PASSED] drm_test_format_min_pitch_two_plane
[12:52:20] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[12:52:20] [PASSED] drm_test_format_min_pitch_tiled
[12:52:20] =================== [PASSED] drm_format ====================
[12:52:20] =============== drm_framebuffer (1 subtest) ================
[12:52:20] =============== drm_test_framebuffer_create  ===============
[12:52:20] [PASSED] ABGR8888 normal sizes
[12:52:20] [PASSED] ABGR8888 max sizes
[12:52:20] [PASSED] ABGR8888 pitch greater than min required
[12:52:20] [PASSED] ABGR8888 pitch less than min required
[12:52:20] [PASSED] ABGR8888 Invalid width
[12:52:20] [PASSED] ABGR8888 Invalid buffer handle
[12:52:20] [PASSED] No pixel format
[12:52:20] [PASSED] ABGR8888 Width 0
[12:52:20] [PASSED] ABGR8888 Height 0
[12:52:20] [PASSED] ABGR8888 Out of bound height * pitch combination
[12:52:20] [PASSED] ABGR8888 Large buffer offset
[12:52:20] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[12:52:20] [PASSED] ABGR8888 Valid buffer modifier
[12:52:20] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[12:52:20] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[12:52:20] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[12:52:20] [PASSED] NV12 Normal sizes
[12:52:20] [PASSED] NV12 Max sizes
[12:52:20] [PASSED] NV12 Invalid pitch
[12:52:20] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[12:52:20] [PASSED] NV12 different  modifier per-plane
[12:52:20] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[12:52:20] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[12:52:20] [PASSED] NV12 Modifier for inexistent plane
[12:52:20] [PASSED] NV12 Handle for inexistent plane
[12:52:20] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[12:52:20] [PASSED] YVU420 Normal sizes
[12:52:20] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[12:52:20] [PASSED] YVU420 Max sizes
[12:52:20] [PASSED] YVU420 Invalid pitch
[12:52:20] [PASSED] YVU420 Different pitches
[12:52:20] [PASSED] YVU420 Different buffer offsets/pitches
[12:52:20] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[12:52:20] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[12:52:20] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[12:52:20] [PASSED] YVU420 Valid modifier
[12:52:20] [PASSED] YVU420 Different modifiers per plane
[12:52:20] [PASSED] YVU420 Modifier for inexistent plane
[12:52:20] [PASSED] X0L2 Normal sizes
[12:52:20] [PASSED] X0L2 Max sizes
[12:52:20] [PASSED] X0L2 Invalid pitch
[12:52:20] [PASSED] X0L2 Pitch greater than minimum required
[12:52:20] [PASSED] X0L2 Handle for inexistent plane
[12:52:20] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[12:52:20] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[12:52:20] [PASSED] X0L2 Valid modifier
[12:52:20] [PASSED] X0L2 Modifier for inexistent plane
stty: 'standard input': Inappropriate ioctl for device
[12:52:20] =========== [PASSED] drm_test_framebuffer_create ===========
[12:52:20] ================= [PASSED] drm_framebuffer =================
[12:52:20] =============== drm-test-managed (1 subtest) ===============
[12:52:20] [PASSED] drm_test_managed_run_action
[12:52:20] ================ [PASSED] drm-test-managed =================
[12:52:20] =================== drm_mm (19 subtests) ===================
[12:52:20] [PASSED] drm_test_mm_init
[12:52:20] [PASSED] drm_test_mm_debug
[12:52:30] [PASSED] drm_test_mm_reserve
[12:52:39] [PASSED] drm_test_mm_insert
[12:52:40] [PASSED] drm_test_mm_replace
[12:52:40] [PASSED] drm_test_mm_insert_range
[12:52:40] [PASSED] drm_test_mm_frag
[12:52:40] [PASSED] drm_test_mm_align
[12:52:40] [PASSED] drm_test_mm_align32
[12:52:40] [PASSED] drm_test_mm_align64
[12:52:41] [PASSED] drm_test_mm_evict
[12:52:41] [PASSED] drm_test_mm_evict_range
[12:52:41] [PASSED] drm_test_mm_topdown
[12:52:41] [PASSED] drm_test_mm_bottomup
[12:52:41] [PASSED] drm_test_mm_lowest
[12:52:41] [PASSED] drm_test_mm_highest
[12:52:41] [PASSED] drm_test_mm_color
[12:52:42] [PASSED] drm_test_mm_color_evict
[12:52:42] [PASSED] drm_test_mm_color_evict_range
[12:52:42] ===================== [PASSED] drm_mm ======================
[12:52:42] ============= drm_modes_analog_tv (4 subtests) =============
[12:52:42] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[12:52:42] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[12:52:42] [PASSED] drm_test_modes_analog_tv_pal_576i
[12:52:42] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[12:52:42] =============== [PASSED] drm_modes_analog_tv ===============
[12:52:42] ============== drm_plane_helper (2 subtests) ===============
[12:52:42] =============== drm_test_check_plane_state  ================
[12:52:42] [PASSED] clipping_simple
[12:52:42] [PASSED] clipping_rotate_reflect
[12:52:42] [PASSED] positioning_simple
[12:52:42] [PASSED] upscaling
[12:52:42] [PASSED] downscaling
[12:52:42] [PASSED] rounding1
[12:52:42] [PASSED] rounding2
[12:52:42] [PASSED] rounding3
[12:52:42] [PASSED] rounding4
[12:52:42] =========== [PASSED] drm_test_check_plane_state ============
[12:52:42] =========== drm_test_check_invalid_plane_state  ============
[12:52:42] [PASSED] positioning_invalid
[12:52:42] [PASSED] upscaling_invalid
[12:52:42] [PASSED] downscaling_invalid
[12:52:42] ======= [PASSED] drm_test_check_invalid_plane_state ========
[12:52:42] ================ [PASSED] drm_plane_helper =================
[12:52:42] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[12:52:42] ====== drm_test_connector_helper_tv_get_modes_check  =======
[12:52:42] [PASSED] None
[12:52:42] [PASSED] PAL
[12:52:42] [PASSED] NTSC
[12:52:42] [PASSED] Both, NTSC Default
[12:52:42] [PASSED] Both, PAL Default
[12:52:42] [PASSED] Both, NTSC Default, with PAL on command-line
[12:52:42] [PASSED] Both, PAL Default, with NTSC on command-line
[12:52:42] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[12:52:42] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[12:52:42] ================== drm_rect (4 subtests) ===================
[12:52:42] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[12:52:42] [PASSED] drm_test_rect_clip_scaled_not_clipped
[12:52:42] [PASSED] drm_test_rect_clip_scaled_clipped
[12:52:42] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[12:52:42] ==================== [PASSED] drm_rect =====================
[12:52:42] ============================================================
[12:52:42] Testing complete. Ran 290 tests: passed: 290
[12:52:42] Elapsed time: 42.651s total, 1.672s configuring, 18.551s building, 22.407s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


