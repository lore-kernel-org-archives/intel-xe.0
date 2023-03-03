Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535A6C678D4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 13:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D22610E045;
	Fri,  3 Mar 2023 13:22:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id DC34310E045;
 Fri,  3 Mar 2023 13:22:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D785FA03D2;
 Fri,  3 Mar 2023 13:22:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Fri, 03 Mar 2023 13:22:29 -0000
Message-ID: <167784974987.9997.8862520140111765452@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230303101610.21520-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230303101610.21520-1-niranjana.vishwanathapura@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/?=
 =?utf-8?q?migrate=3A_Some_cleanups_and_fixes_=28rev3=29?=
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

Series: drm/xe/migrate: Some cleanups and fixes (rev3)
URL   : https://patchwork.freedesktop.org/series/114240/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[13:21:18] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:21:22] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[13:21:44] Starting KUnit Kernel (1/1)...
[13:21:44] ============================================================
[13:21:44] ==================== xe_bo (2 subtests) ====================
[13:21:44] [SKIPPED] xe_ccs_migrate_kunit
[13:21:44] [SKIPPED] xe_bo_evict_kunit
[13:21:44] ===================== [SKIPPED] xe_bo ======================
[13:21:44] ================== xe_dma_buf (1 subtest) ==================
[13:21:44] [SKIPPED] xe_dma_buf_kunit
[13:21:44] =================== [SKIPPED] xe_dma_buf ===================
[13:21:44] ================== xe_migrate (1 subtest) ==================
[13:21:44] [SKIPPED] xe_migrate_sanity_kunit
[13:21:44] =================== [SKIPPED] xe_migrate ===================
[13:21:44] ============================================================
[13:21:44] Testing complete. Ran 4 tests: skipped: 4
[13:21:44] Elapsed time: 25.846s total, 4.155s configuring, 21.571s building, 0.091s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[13:21:44] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:21:45] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[13:22:04] Starting KUnit Kernel (1/1)...
[13:22:04] ============================================================
[13:22:04] ============ drm_test_pick_cmdline (2 subtests) ============
[13:22:04] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[13:22:04] =============== drm_test_pick_cmdline_named ================
[13:22:04] [PASSED] NTSC
[13:22:04] [PASSED] NTSC-J
[13:22:04] [PASSED] PAL
[13:22:04] [PASSED] PAL-M
[13:22:04] =========== [PASSED] drm_test_pick_cmdline_named ===========
[13:22:04] ============== [PASSED] drm_test_pick_cmdline ==============
[13:22:04] ================== drm_buddy (6 subtests) ==================
[13:22:04] [PASSED] drm_test_buddy_alloc_limit
[13:22:04] [PASSED] drm_test_buddy_alloc_range
[13:22:04] [PASSED] drm_test_buddy_alloc_optimistic
[13:22:04] [PASSED] drm_test_buddy_alloc_pessimistic
[13:22:04] [PASSED] drm_test_buddy_alloc_smoke
[13:22:04] [PASSED] drm_test_buddy_alloc_pathological
[13:22:04] ==================== [PASSED] drm_buddy ====================
[13:22:04] ============= drm_cmdline_parser (40 subtests) =============
[13:22:04] [PASSED] drm_test_cmdline_force_d_only
[13:22:04] [PASSED] drm_test_cmdline_force_D_only_dvi
[13:22:04] [PASSED] drm_test_cmdline_force_D_only_hdmi
[13:22:04] [PASSED] drm_test_cmdline_force_D_only_not_digital
[13:22:04] [PASSED] drm_test_cmdline_force_e_only
[13:22:04] [PASSED] drm_test_cmdline_res
[13:22:04] [PASSED] drm_test_cmdline_res_vesa
[13:22:04] [PASSED] drm_test_cmdline_res_vesa_rblank
[13:22:04] [PASSED] drm_test_cmdline_res_rblank
[13:22:04] [PASSED] drm_test_cmdline_res_bpp
[13:22:04] [PASSED] drm_test_cmdline_res_refresh
[13:22:04] [PASSED] drm_test_cmdline_res_bpp_refresh
[13:22:04] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[13:22:04] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[13:22:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[13:22:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[13:22:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[13:22:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[13:22:04] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[13:22:04] [PASSED] drm_test_cmdline_res_margins_force_on
[13:22:04] [PASSED] drm_test_cmdline_res_vesa_margins
[13:22:04] [PASSED] drm_test_cmdline_name
[13:22:04] [PASSED] drm_test_cmdline_name_bpp
[13:22:04] [PASSED] drm_test_cmdline_name_option
[13:22:04] [PASSED] drm_test_cmdline_name_bpp_option
[13:22:04] [PASSED] drm_test_cmdline_rotate_0
[13:22:04] [PASSED] drm_test_cmdline_rotate_90
[13:22:04] [PASSED] drm_test_cmdline_rotate_180
[13:22:04] [PASSED] drm_test_cmdline_rotate_270
[13:22:04] [PASSED] drm_test_cmdline_hmirror
[13:22:04] [PASSED] drm_test_cmdline_vmirror
[13:22:04] [PASSED] drm_test_cmdline_margin_options
[13:22:04] [PASSED] drm_test_cmdline_multiple_options
[13:22:04] [PASSED] drm_test_cmdline_bpp_extra_and_option
[13:22:04] [PASSED] drm_test_cmdline_extra_and_option
[13:22:04] [PASSED] drm_test_cmdline_freestanding_options
[13:22:04] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[13:22:04] [PASSED] drm_test_cmdline_panel_orientation
[13:22:04] ================= drm_test_cmdline_invalid =================
[13:22:04] [PASSED] margin_only
[13:22:04] [PASSED] interlace_only
[13:22:04] [PASSED] res_missing_x
[13:22:04] [PASSED] res_missing_y
[13:22:04] [PASSED] res_bad_y
[13:22:04] [PASSED] res_missing_y_bpp
[13:22:04] [PASSED] res_bad_bpp
[13:22:04] [PASSED] res_bad_refresh
[13:22:04] [PASSED] res_bpp_refresh_force_on_off
[13:22:04] [PASSED] res_invalid_mode
[13:22:04] [PASSED] res_bpp_wrong_place_mode
[13:22:04] [PASSED] name_bpp_refresh
[13:22:04] [PASSED] name_refresh
[13:22:04] [PASSED] name_refresh_wrong_mode
[13:22:04] [PASSED] name_refresh_invalid_mode
[13:22:04] [PASSED] rotate_multiple
[13:22:04] [PASSED] rotate_invalid_val
[13:22:04] [PASSED] rotate_truncated
[13:22:04] [PASSED] invalid_option
[13:22:04] [PASSED] invalid_tv_option
[13:22:04] [PASSED] truncated_tv_option
[13:22:04] ============ [PASSED] drm_test_cmdline_invalid =============
[13:22:04] =============== drm_test_cmdline_tv_options ================
[13:22:04] [PASSED] NTSC
[13:22:04] [PASSED] NTSC_443
[13:22:04] [PASSED] NTSC_J
[13:22:04] [PASSED] PAL
[13:22:04] [PASSED] PAL_M
[13:22:04] [PASSED] PAL_N
[13:22:04] [PASSED] SECAM
[13:22:04] =========== [PASSED] drm_test_cmdline_tv_options ===========
[13:22:04] =============== [PASSED] drm_cmdline_parser ================
[13:22:04] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[13:22:04] =========== drm_test_get_tv_mode_from_name_valid ===========
[13:22:04] [PASSED] NTSC
[13:22:04] [PASSED] NTSC-443
[13:22:04] [PASSED] NTSC-J
[13:22:04] [PASSED] PAL
[13:22:04] [PASSED] PAL-M
[13:22:04] [PASSED] PAL-N
[13:22:04] [PASSED] SECAM
[13:22:04] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[13:22:04] [PASSED] drm_test_get_tv_mode_from_name_truncated
[13:22:04] ============ [PASSED] drm_get_tv_mode_from_name ============
[13:22:04] ============= drm_damage_helper (21 subtests) ==============
[13:22:04] [PASSED] drm_test_damage_iter_no_damage
[13:22:04] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[13:22:04] [PASSED] drm_test_damage_iter_no_damage_src_moved
[13:22:04] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[13:22:04] [PASSED] drm_test_damage_iter_no_damage_not_visible
[13:22:04] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[13:22:04] [PASSED] drm_test_damage_iter_no_damage_no_fb
[13:22:04] [PASSED] drm_test_damage_iter_simple_damage
[13:22:04] [PASSED] drm_test_damage_iter_single_damage
[13:22:04] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[13:22:04] [PASSED] drm_test_damage_iter_single_damage_outside_src
[13:22:04] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[13:22:04] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[13:22:04] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[13:22:04] [PASSED] drm_test_damage_iter_single_damage_src_moved
[13:22:04] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[13:22:04] [PASSED] drm_test_damage_iter_damage
[13:22:04] [PASSED] drm_test_damage_iter_damage_one_intersect
[13:22:04] [PASSED] drm_test_damage_iter_damage_one_outside
[13:22:04] [PASSED] drm_test_damage_iter_damage_src_moved
[13:22:04] [PASSED] drm_test_damage_iter_damage_not_visible
[13:22:04] ================ [PASSED] drm_damage_helper ================
[13:22:04] ============== drm_dp_mst_helper (2 subtests) ==============
[13:22:04] ============== drm_test_dp_mst_calc_pbn_mode ===============
[13:22:04] [PASSED] Clock 154000 BPP 30 DSC disabled
[13:22:04] [PASSED] Clock 234000 BPP 30 DSC disabled
[13:22:04] [PASSED] Clock 297000 BPP 24 DSC disabled
[13:22:04] [PASSED] Clock 332880 BPP 24 DSC enabled
[13:22:04] [PASSED] Clock 324540 BPP 24 DSC enabled
[13:22:04] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[13:22:04] ========= drm_test_dp_mst_sideband_msg_req_decode ==========
[13:22:04] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[13:22:04] [PASSED] DP_POWER_UP_PHY with port number
[13:22:04] [PASSED] DP_POWER_DOWN_PHY with port number
[13:22:04] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[13:22:04] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[13:22:04] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[13:22:04] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[13:22:04] [PASSED] DP_QUERY_PAYLOAD with port number
[13:22:04] [PASSED] DP_QUERY_PAYLOAD with VCPI
[13:22:04] [PASSED] DP_REMOTE_DPCD_READ with port number
[13:22:04] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[13:22:04] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[13:22:04] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[13:22:04] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[13:22:04] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[13:22:04] [PASSED] DP_REMOTE_I2C_READ with port number
[13:22:04] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[13:22:04] [PASSED] DP_REMOTE_I2C_READ with transactions array
[13:22:04] [PASSED] DP_REMOTE_I2C_WRITE with port number
[13:22:04] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[13:22:04] [PASSED] DP_REMOTE_I2C_WRITE with data array
[13:22:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[13:22:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[13:22:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[13:22:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[13:22:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[13:22:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[13:22:04] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[13:22:04] ================ [PASSED] drm_dp_mst_helper ================
[13:22:04] =========== drm_format_helper_test (5 subtests) ============
[13:22:04] ============== drm_test_fb_xrgb8888_to_gray8 ===============
[13:22:04] [PASSED] single_pixel_source_buffer
[13:22:04] [PASSED] single_pixel_clip_rectangle
[13:22:04] [PASSED] well_known_colors
[13:22:04] [PASSED] destination_pitch
[13:22:04] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[13:22:04] ============== drm_test_fb_xrgb8888_to_rgb332 ==============
[13:22:04] [PASSED] single_pixel_source_buffer
[13:22:04] [PASSED] single_pixel_clip_rectangle
[13:22:04] [PASSED] well_known_colors
[13:22:04] [PASSED] destination_pitch
[13:22:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[13:22:04] ============== drm_test_fb_xrgb8888_to_rgb565 ==============
[13:22:04] [PASSED] single_pixel_source_buffer
[13:22:04] [PASSED] single_pixel_clip_rectangle
[13:22:04] [PASSED] well_known_colors
[13:22:04] [PASSED] destination_pitch
[13:22:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[13:22:04] ============== drm_test_fb_xrgb8888_to_rgb888 ==============
[13:22:04] [PASSED] single_pixel_source_buffer
[13:22:04] [PASSED] single_pixel_clip_rectangle
[13:22:04] [PASSED] well_known_colors
[13:22:04] [PASSED] destination_pitch
[13:22:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[13:22:04] =========== drm_test_fb_xrgb8888_to_xrgb2101010 ============
[13:22:04] [PASSED] single_pixel_source_buffer
[13:22:04] [PASSED] single_pixel_clip_rectangle
[13:22:04] [PASSED] well_known_colors
[13:22:04] [PASSED] destination_pitch
[13:22:04] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[13:22:04] ============= [PASSED] drm_format_helper_test ==============
[13:22:04] ================= drm_format (18 subtests) =================
[13:22:04] [PASSED] drm_test_format_block_width_invalid
[13:22:04] [PASSED] drm_test_format_block_width_one_plane
[13:22:04] [PASSED] drm_test_format_block_width_two_plane
[13:22:04] [PASSED] drm_test_format_block_width_three_plane
[13:22:04] [PASSED] drm_test_format_block_width_tiled
[13:22:04] [PASSED] drm_test_format_block_height_invalid
[13:22:04] [PASSED] drm_test_format_block_height_one_plane
[13:22:04] [PASSED] drm_test_format_block_height_two_plane
[13:22:04] [PASSED] drm_test_format_block_height_three_plane
[13:22:04] [PASSED] drm_test_format_block_height_tiled
[13:22:04] [PASSED] drm_test_format_min_pitch_invalid
[13:22:04] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[13:22:04] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[13:22:04] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[13:22:04] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[13:22:04] [PASSED] drm_test_format_min_pitch_two_plane
[13:22:04] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[13:22:04] [PASSED] drm_test_format_min_pitch_tiled
[13:22:04] =================== [PASSED] drm_format ====================
[13:22:04] =============== drm_framebuffer (1 subtest) ================
[13:22:04] =============== drm_test_framebuffer_create ================
[13:22:04] [PASSED] ABGR8888 normal sizes
[13:22:04] [PASSED] ABGR8888 max sizes
[13:22:04] [PASSED] ABGR8888 pitch greater than min required
[13:22:04] [PASSED] ABGR8888 pitch less than min required
[13:22:04] [PASSED] ABGR8888 Invalid width
[13:22:04] [PASSED] ABGR8888 Invalid buffer handle
[13:22:04] [PASSED] No pixel format
[13:22:04] [PASSED] ABGR8888 Width 0
[13:22:04] [PASSED] ABGR8888 Height 0
[13:22:04] [PASSED] ABGR8888 Out of bound height * pitch combination
[13:22:04] [PASSED] ABGR8888 Large buffer offset
[13:22:04] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[13:22:04] [PASSED] ABGR8888 Valid buffer modifier
[13:22:04] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[13:22:04] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[13:22:04] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[13:22:04] [PASSED] NV12 Normal sizes
[13:22:04] [PASSED] NV12 Max sizes
[13:22:04] [PASSED] NV12 Invalid pitch
[13:22:04] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[13:22:04] [PASSED] NV12 different  modifier per-plane
[13:22:04] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[13:22:04] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[13:22:04] [PASSED] NV12 Modifier for inexistent plane
[13:22:04] [PASSED] NV12 Handle for inexistent plane
[13:22:04] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[13:22:04] [PASSED] YVU420 Normal sizes
[13:22:04] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[13:22:04] [PASSED] YVU420 Max sizes
[13:22:04] [PASSED] YVU420 Invalid pitch
[13:22:04] [PASSED] YVU420 Different pitches
[13:22:04] [PASSED] YVU420 Different buffer offsets/pitches
[13:22:04] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[13:22:04] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[13:22:04] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[13:22:04] [PASSED] YVU420 Valid modifier
[13:22:04] [PASSED] YVU420 Different modifiers per plane
[13:22:04] [PASSED] YVU420 Modifier for inexistent plane
[13:22:04] [PASSED] X0L2 Normal sizes
[13:22:04] [PASSED] X0L2 Max sizes
[13:22:04] [PASSED] X0L2 Invalid pitch
[13:22:04] [PASSED] X0L2 Pitch greater than minimum required
[13:22:04] [PASSED] X0L2 Handle for inexistent plane
[13:22:04] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[13:22:04] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[13:22:04] [PASSED] X0L2 Valid modifier
[13:22:04] [PASSED] X0L2 Modifier for inexistent plane
[13:22:04] =========== [PASSED] drm_test_framebuffer_create ===========
[13:22:04] ================= [PASSED] drm_framebuffer =================
[13:22:04] =============== drm-test-managed (1 subtest) ===============
[13:22:04] [PASSED] drm_test_managed_run_action
[13:22:04] ================ [PASSED] drm-test-managed =================
[13:22:04] =================== drm_mm (19 subtests) ===================
[13:22:04] [PASSED] drm_test_mm_init
[13:22:04] [PASSED] drm_test_mm_debug
[13:22:14] [PASSED] drm_test_mm_reserve
[13:22:24] [PASSED] drm_test_mm_insert
[13:22:24] [PASSED] drm_test_mm_replace
[13:22:24] [PASSED] drm_test_mm_insert_range
[13:22:24] [PASSED] drm_test_mm_frag
[13:22:24] [PASSED] drm_test_mm_align
[13:22:24] [PASSED] drm_test_mm_align32
[13:22:25] [PASSED] drm_test_mm_align64
[13:22:25] [PASSED] drm_test_mm_evict
[13:22:25] [PASSED] drm_test_mm_evict_range
[13:22:25] [PASSED] drm_test_mm_topdown
[13:22:25] [PASSED] drm_test_mm_bottomup
[13:22:25] [PASSED] drm_test_mm_lowest
[13:22:25] [PASSED] drm_test_mm_highest
[13:22:26] [PASSED] drm_test_mm_color
[13:22:27] [PASSED] drm_test_mm_color_evict
[13:22:27] [PASSED] drm_test_mm_color_evict_range
[13:22:27] ===================== [PASSED] drm_mm ======================
[13:22:27] ============= drm_modes_analog_tv (4 subtests) =============
[13:22:27] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[13:22:27] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[13:22:27] [PASSED] drm_test_modes_analog_tv_pal_576i
[13:22:27] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
stty: 'standard input': Inappropriate ioctl for device
[13:22:27] =============== [PASSED] drm_modes_analog_tv ===============
[13:22:27] ============== drm_plane_helper (2 subtests) ===============
[13:22:27] ================ drm_test_check_plane_state ================
[13:22:27] [PASSED] clipping_simple
[13:22:27] [PASSED] clipping_rotate_reflect
[13:22:27] [PASSED] positioning_simple
[13:22:27] [PASSED] upscaling
[13:22:27] [PASSED] downscaling
[13:22:27] [PASSED] rounding1
[13:22:27] [PASSED] rounding2
[13:22:27] [PASSED] rounding3
[13:22:27] [PASSED] rounding4
[13:22:27] =========== [PASSED] drm_test_check_plane_state ============
[13:22:27] ============ drm_test_check_invalid_plane_state ============
[13:22:27] [PASSED] positioning_invalid
[13:22:27] [PASSED] upscaling_invalid
[13:22:27] [PASSED] downscaling_invalid
[13:22:27] ======= [PASSED] drm_test_check_invalid_plane_state ========
[13:22:27] ================ [PASSED] drm_plane_helper =================
[13:22:27] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[13:22:27] ======= drm_test_connector_helper_tv_get_modes_check =======
[13:22:27] [PASSED] None
[13:22:27] [PASSED] PAL
[13:22:27] [PASSED] NTSC
[13:22:27] [PASSED] Both, NTSC Default
[13:22:27] [PASSED] Both, PAL Default
[13:22:27] [PASSED] Both, NTSC Default, with PAL on command-line
[13:22:27] [PASSED] Both, PAL Default, with NTSC on command-line
[13:22:27] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[13:22:27] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[13:22:27] ================== drm_rect (4 subtests) ===================
[13:22:27] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[13:22:27] [PASSED] drm_test_rect_clip_scaled_not_clipped
[13:22:27] [PASSED] drm_test_rect_clip_scaled_clipped
[13:22:27] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[13:22:27] ==================== [PASSED] drm_rect =====================
[13:22:27] ============================================================
[13:22:27] Testing complete. Ran 270 tests: passed: 270
[13:22:27] Elapsed time: 42.813s total, 1.620s configuring, 18.264s building, 22.908s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


