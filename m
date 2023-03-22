Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD394C74A5B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 14:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9599510E965;
	Wed, 22 Mar 2023 14:23:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7C10910E965;
 Wed, 22 Mar 2023 14:23:50 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 780B1A0169;
 Wed, 22 Mar 2023 14:23:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Wed, 22 Mar 2023 14:23:50 -0000
Message-ID: <167949503048.13421.13699646426424943619@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230322141936.297612-1-matthew.auld@intel.com>
In-Reply-To: <20230322141936.297612-1-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_uAPI_bi?=
 =?utf-8?q?ts_for_small-bar?=
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

Series: uAPI bits for small-bar
URL   : https://patchwork.freedesktop.org/series/115515/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[14:22:38] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:22:42] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[14:23:03] Starting KUnit Kernel (1/1)...
[14:23:03] ============================================================
[14:23:03] ==================== xe_bo (2 subtests) ====================
[14:23:03] [SKIPPED] xe_ccs_migrate_kunit
[14:23:03] [SKIPPED] xe_bo_evict_kunit
[14:23:03] ===================== [SKIPPED] xe_bo ======================
[14:23:03] ================== xe_dma_buf (1 subtest) ==================
[14:23:03] [SKIPPED] xe_dma_buf_kunit
[14:23:03] =================== [SKIPPED] xe_dma_buf ===================
[14:23:03] ================== xe_migrate (1 subtest) ==================
[14:23:03] [SKIPPED] xe_migrate_sanity_kunit
[14:23:03] =================== [SKIPPED] xe_migrate ===================
[14:23:03] ============================================================
[14:23:03] Testing complete. Ran 4 tests: skipped: 4
[14:23:03] Elapsed time: 25.883s total, 4.183s configuring, 21.580s building, 0.092s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[14:23:03] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:23:05] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[14:23:24] Starting KUnit Kernel (1/1)...
[14:23:24] ============================================================
[14:23:24] ============ drm_test_pick_cmdline (2 subtests) ============
[14:23:24] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[14:23:24] =============== drm_test_pick_cmdline_named  ===============
[14:23:24] [PASSED] NTSC
[14:23:24] [PASSED] NTSC-J
[14:23:24] [PASSED] PAL
[14:23:24] [PASSED] PAL-M
[14:23:24] =========== [PASSED] drm_test_pick_cmdline_named ===========
[14:23:24] ============== [PASSED] drm_test_pick_cmdline ==============
[14:23:24] ================== drm_buddy (6 subtests) ==================
[14:23:24] [PASSED] drm_test_buddy_alloc_limit
[14:23:24] [PASSED] drm_test_buddy_alloc_range
[14:23:24] [PASSED] drm_test_buddy_alloc_optimistic
[14:23:24] [PASSED] drm_test_buddy_alloc_pessimistic
[14:23:24] [PASSED] drm_test_buddy_alloc_smoke
[14:23:24] [PASSED] drm_test_buddy_alloc_pathological
[14:23:24] ==================== [PASSED] drm_buddy ====================
[14:23:24] ============= drm_cmdline_parser (40 subtests) =============
[14:23:24] [PASSED] drm_test_cmdline_force_d_only
[14:23:24] [PASSED] drm_test_cmdline_force_D_only_dvi
[14:23:24] [PASSED] drm_test_cmdline_force_D_only_hdmi
[14:23:24] [PASSED] drm_test_cmdline_force_D_only_not_digital
[14:23:24] [PASSED] drm_test_cmdline_force_e_only
[14:23:24] [PASSED] drm_test_cmdline_res
[14:23:24] [PASSED] drm_test_cmdline_res_vesa
[14:23:24] [PASSED] drm_test_cmdline_res_vesa_rblank
[14:23:24] [PASSED] drm_test_cmdline_res_rblank
[14:23:24] [PASSED] drm_test_cmdline_res_bpp
[14:23:24] [PASSED] drm_test_cmdline_res_refresh
[14:23:24] [PASSED] drm_test_cmdline_res_bpp_refresh
[14:23:24] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[14:23:24] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[14:23:24] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[14:23:24] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[14:23:24] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[14:23:24] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[14:23:24] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[14:23:24] [PASSED] drm_test_cmdline_res_margins_force_on
[14:23:24] [PASSED] drm_test_cmdline_res_vesa_margins
[14:23:24] [PASSED] drm_test_cmdline_name
[14:23:24] [PASSED] drm_test_cmdline_name_bpp
[14:23:24] [PASSED] drm_test_cmdline_name_option
[14:23:24] [PASSED] drm_test_cmdline_name_bpp_option
[14:23:24] [PASSED] drm_test_cmdline_rotate_0
[14:23:24] [PASSED] drm_test_cmdline_rotate_90
[14:23:24] [PASSED] drm_test_cmdline_rotate_180
[14:23:24] [PASSED] drm_test_cmdline_rotate_270
[14:23:24] [PASSED] drm_test_cmdline_hmirror
[14:23:24] [PASSED] drm_test_cmdline_vmirror
[14:23:24] [PASSED] drm_test_cmdline_margin_options
[14:23:24] [PASSED] drm_test_cmdline_multiple_options
[14:23:24] [PASSED] drm_test_cmdline_bpp_extra_and_option
[14:23:24] [PASSED] drm_test_cmdline_extra_and_option
[14:23:24] [PASSED] drm_test_cmdline_freestanding_options
[14:23:24] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[14:23:24] [PASSED] drm_test_cmdline_panel_orientation
[14:23:24] ================ drm_test_cmdline_invalid  =================
[14:23:24] [PASSED] margin_only
[14:23:24] [PASSED] interlace_only
[14:23:24] [PASSED] res_missing_x
[14:23:24] [PASSED] res_missing_y
[14:23:24] [PASSED] res_bad_y
[14:23:24] [PASSED] res_missing_y_bpp
[14:23:24] [PASSED] res_bad_bpp
[14:23:24] [PASSED] res_bad_refresh
[14:23:24] [PASSED] res_bpp_refresh_force_on_off
[14:23:24] [PASSED] res_invalid_mode
[14:23:24] [PASSED] res_bpp_wrong_place_mode
[14:23:24] [PASSED] name_bpp_refresh
[14:23:24] [PASSED] name_refresh
[14:23:24] [PASSED] name_refresh_wrong_mode
[14:23:24] [PASSED] name_refresh_invalid_mode
[14:23:24] [PASSED] rotate_multiple
[14:23:24] [PASSED] rotate_invalid_val
[14:23:24] [PASSED] rotate_truncated
[14:23:24] [PASSED] invalid_option
[14:23:24] [PASSED] invalid_tv_option
[14:23:24] [PASSED] truncated_tv_option
[14:23:24] ============ [PASSED] drm_test_cmdline_invalid =============
[14:23:24] =============== drm_test_cmdline_tv_options  ===============
[14:23:24] [PASSED] NTSC
[14:23:24] [PASSED] NTSC_443
[14:23:24] [PASSED] NTSC_J
[14:23:24] [PASSED] PAL
[14:23:24] [PASSED] PAL_M
[14:23:24] [PASSED] PAL_N
[14:23:24] [PASSED] SECAM
[14:23:24] =========== [PASSED] drm_test_cmdline_tv_options ===========
[14:23:24] =============== [PASSED] drm_cmdline_parser ================
[14:23:24] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[14:23:24] ========== drm_test_get_tv_mode_from_name_valid  ===========
[14:23:24] [PASSED] NTSC
[14:23:24] [PASSED] NTSC-443
[14:23:24] [PASSED] NTSC-J
[14:23:24] [PASSED] PAL
[14:23:24] [PASSED] PAL-M
[14:23:24] [PASSED] PAL-N
[14:23:24] [PASSED] SECAM
[14:23:24] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[14:23:24] [PASSED] drm_test_get_tv_mode_from_name_truncated
[14:23:24] ============ [PASSED] drm_get_tv_mode_from_name ============
[14:23:24] ============= drm_damage_helper (21 subtests) ==============
[14:23:24] [PASSED] drm_test_damage_iter_no_damage
[14:23:24] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[14:23:24] [PASSED] drm_test_damage_iter_no_damage_src_moved
[14:23:24] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[14:23:24] [PASSED] drm_test_damage_iter_no_damage_not_visible
[14:23:24] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[14:23:24] [PASSED] drm_test_damage_iter_no_damage_no_fb
[14:23:24] [PASSED] drm_test_damage_iter_simple_damage
[14:23:24] [PASSED] drm_test_damage_iter_single_damage
[14:23:24] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[14:23:24] [PASSED] drm_test_damage_iter_single_damage_outside_src
[14:23:24] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[14:23:24] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[14:23:24] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[14:23:24] [PASSED] drm_test_damage_iter_single_damage_src_moved
[14:23:24] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[14:23:24] [PASSED] drm_test_damage_iter_damage
[14:23:24] [PASSED] drm_test_damage_iter_damage_one_intersect
[14:23:24] [PASSED] drm_test_damage_iter_damage_one_outside
[14:23:24] [PASSED] drm_test_damage_iter_damage_src_moved
[14:23:24] [PASSED] drm_test_damage_iter_damage_not_visible
[14:23:24] ================ [PASSED] drm_damage_helper ================
[14:23:24] ============== drm_dp_mst_helper (2 subtests) ==============
[14:23:24] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[14:23:24] [PASSED] Clock 154000 BPP 30 DSC disabled
[14:23:24] [PASSED] Clock 234000 BPP 30 DSC disabled
[14:23:24] [PASSED] Clock 297000 BPP 24 DSC disabled
[14:23:24] [PASSED] Clock 332880 BPP 24 DSC enabled
[14:23:24] [PASSED] Clock 324540 BPP 24 DSC enabled
[14:23:24] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[14:23:24] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[14:23:24] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[14:23:24] [PASSED] DP_POWER_UP_PHY with port number
[14:23:24] [PASSED] DP_POWER_DOWN_PHY with port number
[14:23:24] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[14:23:24] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[14:23:24] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[14:23:24] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[14:23:24] [PASSED] DP_QUERY_PAYLOAD with port number
[14:23:24] [PASSED] DP_QUERY_PAYLOAD with VCPI
[14:23:24] [PASSED] DP_REMOTE_DPCD_READ with port number
[14:23:24] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[14:23:24] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[14:23:24] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[14:23:24] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[14:23:24] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[14:23:24] [PASSED] DP_REMOTE_I2C_READ with port number
[14:23:24] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[14:23:24] [PASSED] DP_REMOTE_I2C_READ with transactions array
[14:23:24] [PASSED] DP_REMOTE_I2C_WRITE with port number
[14:23:24] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[14:23:24] [PASSED] DP_REMOTE_I2C_WRITE with data array
[14:23:24] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[14:23:24] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[14:23:24] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[14:23:24] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[14:23:24] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[14:23:24] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[14:23:24] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[14:23:24] ================ [PASSED] drm_dp_mst_helper ================
[14:23:24] =========== drm_format_helper_test (10 subtests) ===========
[14:23:24] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[14:23:24] [PASSED] single_pixel_source_buffer
[14:23:24] [PASSED] single_pixel_clip_rectangle
[14:23:24] [PASSED] well_known_colors
[14:23:24] [PASSED] destination_pitch
[14:23:24] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[14:23:24] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[14:23:24] [PASSED] single_pixel_source_buffer
[14:23:24] [PASSED] single_pixel_clip_rectangle
[14:23:24] [PASSED] well_known_colors
[14:23:24] [PASSED] destination_pitch
[14:23:24] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[14:23:24] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[14:23:24] [PASSED] single_pixel_source_buffer
[14:23:24] [PASSED] single_pixel_clip_rectangle
[14:23:24] [PASSED] well_known_colors
[14:23:24] [PASSED] destination_pitch
[14:23:24] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[14:23:24] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[14:23:24] [PASSED] single_pixel_source_buffer
[14:23:24] [PASSED] single_pixel_clip_rectangle
[14:23:24] [PASSED] well_known_colors
[14:23:24] [PASSED] destination_pitch
[14:23:24] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[14:23:24] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[14:23:24] [PASSED] single_pixel_source_buffer
[14:23:24] [PASSED] single_pixel_clip_rectangle
[14:23:24] [PASSED] well_known_colors
[14:23:24] [PASSED] destination_pitch
[14:23:24] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[14:23:24] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[14:23:24] [PASSED] single_pixel_source_buffer
[14:23:24] [PASSED] single_pixel_clip_rectangle
[14:23:24] [PASSED] well_known_colors
[14:23:24] [PASSED] destination_pitch
[14:23:24] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[14:23:24] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[14:23:24] [PASSED] single_pixel_source_buffer
[14:23:24] [PASSED] single_pixel_clip_rectangle
[14:23:24] [PASSED] well_known_colors
[14:23:24] [PASSED] destination_pitch
[14:23:24] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[14:23:24] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[14:23:24] [PASSED] single_pixel_source_buffer
[14:23:24] [PASSED] single_pixel_clip_rectangle
[14:23:24] [PASSED] well_known_colors
[14:23:24] [PASSED] destination_pitch
[14:23:24] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[14:23:24] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[14:23:24] [PASSED] single_pixel_source_buffer
[14:23:24] [PASSED] single_pixel_clip_rectangle
[14:23:24] [PASSED] well_known_colors
[14:23:24] [PASSED] destination_pitch
[14:23:24] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[14:23:24] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[14:23:24] [PASSED] single_pixel_source_buffer
[14:23:24] [PASSED] single_pixel_clip_rectangle
[14:23:24] [PASSED] well_known_colors
[14:23:24] [PASSED] destination_pitch
[14:23:24] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[14:23:24] ============= [PASSED] drm_format_helper_test ==============
[14:23:24] ================= drm_format (18 subtests) =================
[14:23:24] [PASSED] drm_test_format_block_width_invalid
[14:23:24] [PASSED] drm_test_format_block_width_one_plane
[14:23:24] [PASSED] drm_test_format_block_width_two_plane
[14:23:24] [PASSED] drm_test_format_block_width_three_plane
[14:23:24] [PASSED] drm_test_format_block_width_tiled
[14:23:24] [PASSED] drm_test_format_block_height_invalid
[14:23:24] [PASSED] drm_test_format_block_height_one_plane
[14:23:24] [PASSED] drm_test_format_block_height_two_plane
[14:23:24] [PASSED] drm_test_format_block_height_three_plane
[14:23:24] [PASSED] drm_test_format_block_height_tiled
[14:23:24] [PASSED] drm_test_format_min_pitch_invalid
[14:23:24] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[14:23:24] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[14:23:24] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[14:23:24] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[14:23:24] [PASSED] drm_test_format_min_pitch_two_plane
[14:23:24] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[14:23:24] [PASSED] drm_test_format_min_pitch_tiled
[14:23:24] =================== [PASSED] drm_format ====================
[14:23:24] =============== drm_framebuffer (1 subtest) ================
[14:23:24] =============== drm_test_framebuffer_create  ===============
[14:23:24] [PASSED] ABGR8888 normal sizes
[14:23:24] [PASSED] ABGR8888 max sizes
[14:23:24] [PASSED] ABGR8888 pitch greater than min required
[14:23:24] [PASSED] ABGR8888 pitch less than min required
[14:23:24] [PASSED] ABGR8888 Invalid width
[14:23:24] [PASSED] ABGR8888 Invalid buffer handle
[14:23:24] [PASSED] No pixel format
[14:23:24] [PASSED] ABGR8888 Width 0
[14:23:24] [PASSED] ABGR8888 Height 0
[14:23:24] [PASSED] ABGR8888 Out of bound height * pitch combination
[14:23:24] [PASSED] ABGR8888 Large buffer offset
[14:23:24] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[14:23:24] [PASSED] ABGR8888 Valid buffer modifier
[14:23:24] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[14:23:24] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[14:23:24] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[14:23:24] [PASSED] NV12 Normal sizes
[14:23:24] [PASSED] NV12 Max sizes
[14:23:24] [PASSED] NV12 Invalid pitch
[14:23:24] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[14:23:24] [PASSED] NV12 different  modifier per-plane
[14:23:24] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[14:23:24] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[14:23:24] [PASSED] NV12 Modifier for inexistent plane
[14:23:24] [PASSED] NV12 Handle for inexistent plane
[14:23:24] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[14:23:24] [PASSED] YVU420 Normal sizes
[14:23:24] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[14:23:24] [PASSED] YVU420 Max sizes
[14:23:24] [PASSED] YVU420 Invalid pitch
[14:23:24] [PASSED] YVU420 Different pitches
[14:23:24] [PASSED] YVU420 Different buffer offsets/pitches
[14:23:24] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[14:23:24] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[14:23:24] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[14:23:24] [PASSED] YVU420 Valid modifier
[14:23:24] [PASSED] YVU420 Different modifiers per plane
[14:23:24] [PASSED] YVU420 Modifier for inexistent plane
[14:23:24] [PASSED] X0L2 Normal sizes
[14:23:24] [PASSED] X0L2 Max sizes
[14:23:24] [PASSED] X0L2 Invalid pitch
[14:23:24] [PASSED] X0L2 Pitch greater than minimum required
[14:23:24] [PASSED] X0L2 Handle for inexistent plane
[14:23:24] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[14:23:24] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[14:23:24] [PASSED] X0L2 Valid modifier
[14:23:24] [PASSED] X0L2 Modifier for inexistent plane
stty: 'standard input': Inappropriate ioctl for device
[14:23:24] =========== [PASSED] drm_test_framebuffer_create ===========
[14:23:24] ================= [PASSED] drm_framebuffer =================
[14:23:24] =============== drm-test-managed (1 subtest) ===============
[14:23:24] [PASSED] drm_test_managed_run_action
[14:23:24] ================ [PASSED] drm-test-managed =================
[14:23:24] =================== drm_mm (19 subtests) ===================
[14:23:24] [PASSED] drm_test_mm_init
[14:23:24] [PASSED] drm_test_mm_debug
[14:23:34] [PASSED] drm_test_mm_reserve
[14:23:44] [PASSED] drm_test_mm_insert
[14:23:44] [PASSED] drm_test_mm_replace
[14:23:44] [PASSED] drm_test_mm_insert_range
[14:23:44] [PASSED] drm_test_mm_frag
[14:23:44] [PASSED] drm_test_mm_align
[14:23:44] [PASSED] drm_test_mm_align32
[14:23:45] [PASSED] drm_test_mm_align64
[14:23:45] [PASSED] drm_test_mm_evict
[14:23:45] [PASSED] drm_test_mm_evict_range
[14:23:45] [PASSED] drm_test_mm_topdown
[14:23:45] [PASSED] drm_test_mm_bottomup
[14:23:45] [PASSED] drm_test_mm_lowest
[14:23:45] [PASSED] drm_test_mm_highest
[14:23:46] [PASSED] drm_test_mm_color
[14:23:46] [PASSED] drm_test_mm_color_evict
[14:23:46] [PASSED] drm_test_mm_color_evict_range
[14:23:46] ===================== [PASSED] drm_mm ======================
[14:23:46] ============= drm_modes_analog_tv (4 subtests) =============
[14:23:46] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[14:23:46] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[14:23:46] [PASSED] drm_test_modes_analog_tv_pal_576i
[14:23:46] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[14:23:46] =============== [PASSED] drm_modes_analog_tv ===============
[14:23:46] ============== drm_plane_helper (2 subtests) ===============
[14:23:46] =============== drm_test_check_plane_state  ================
[14:23:46] [PASSED] clipping_simple
[14:23:46] [PASSED] clipping_rotate_reflect
[14:23:46] [PASSED] positioning_simple
[14:23:46] [PASSED] upscaling
[14:23:46] [PASSED] downscaling
[14:23:46] [PASSED] rounding1
[14:23:46] [PASSED] rounding2
[14:23:46] [PASSED] rounding3
[14:23:46] [PASSED] rounding4
[14:23:46] =========== [PASSED] drm_test_check_plane_state ============
[14:23:46] =========== drm_test_check_invalid_plane_state  ============
[14:23:46] [PASSED] positioning_invalid
[14:23:46] [PASSED] upscaling_invalid
[14:23:46] [PASSED] downscaling_invalid
[14:23:46] ======= [PASSED] drm_test_check_invalid_plane_state ========
[14:23:46] ================ [PASSED] drm_plane_helper =================
[14:23:46] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[14:23:46] ====== drm_test_connector_helper_tv_get_modes_check  =======
[14:23:46] [PASSED] None
[14:23:46] [PASSED] PAL
[14:23:46] [PASSED] NTSC
[14:23:46] [PASSED] Both, NTSC Default
[14:23:46] [PASSED] Both, PAL Default
[14:23:46] [PASSED] Both, NTSC Default, with PAL on command-line
[14:23:46] [PASSED] Both, PAL Default, with NTSC on command-line
[14:23:46] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[14:23:46] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[14:23:46] ================== drm_rect (4 subtests) ===================
[14:23:46] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[14:23:46] [PASSED] drm_test_rect_clip_scaled_not_clipped
[14:23:46] [PASSED] drm_test_rect_clip_scaled_clipped
[14:23:46] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[14:23:46] ==================== [PASSED] drm_rect =====================
[14:23:46] ============================================================
[14:23:46] Testing complete. Ran 290 tests: passed: 290
[14:23:47] Elapsed time: 43.022s total, 1.655s configuring, 18.589s building, 22.749s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


