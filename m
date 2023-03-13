Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5FBC6FD19
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 23:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B9E10E668;
	Mon, 13 Mar 2023 23:14:54 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4FD4010E08D;
 Mon, 13 Mar 2023 23:14:53 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4D270AADD5;
 Mon, 13 Mar 2023 23:14:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anusha Srivatsa" <anusha.srivatsa@intel.com>
Date: Mon, 13 Mar 2023 23:14:53 -0000
Message-ID: <167874929331.1030.3297660879828484534@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230313231120.319346-1-anusha.srivatsa@intel.com>
In-Reply-To: <20230313231120.319346-1-anusha.srivatsa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/?=
 =?utf-8?q?huc=3A_Load_HuC_on_Alderlake_P_and_Alderlake_S?=
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

Series: drm/xe/huc: Load HuC on Alderlake P and Alderlake S
URL   : https://patchwork.freedesktop.org/series/115085/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[23:13:41] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:13:45] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[23:14:07] Starting KUnit Kernel (1/1)...
[23:14:07] ============================================================
[23:14:07] ==================== xe_bo (2 subtests) ====================
[23:14:07] [SKIPPED] xe_ccs_migrate_kunit
[23:14:07] [SKIPPED] xe_bo_evict_kunit
[23:14:07] ===================== [SKIPPED] xe_bo ======================
[23:14:07] ================== xe_dma_buf (1 subtest) ==================
[23:14:07] [SKIPPED] xe_dma_buf_kunit
[23:14:07] =================== [SKIPPED] xe_dma_buf ===================
[23:14:07] ================== xe_migrate (1 subtest) ==================
[23:14:07] [SKIPPED] xe_migrate_sanity_kunit
[23:14:07] =================== [SKIPPED] xe_migrate ===================
[23:14:07] ============================================================
[23:14:07] Testing complete. Ran 4 tests: skipped: 4
[23:14:07] Elapsed time: 25.602s total, 4.138s configuring, 21.293s building, 0.131s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[23:14:07] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:14:09] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[23:14:27] Starting KUnit Kernel (1/1)...
[23:14:27] ============================================================
[23:14:27] ============ drm_test_pick_cmdline (2 subtests) ============
[23:14:27] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[23:14:27] =============== drm_test_pick_cmdline_named ================
[23:14:27] [PASSED] NTSC
[23:14:27] [PASSED] NTSC-J
[23:14:27] [PASSED] PAL
[23:14:27] [PASSED] PAL-M
[23:14:27] =========== [PASSED] drm_test_pick_cmdline_named ===========
[23:14:27] ============== [PASSED] drm_test_pick_cmdline ==============
[23:14:27] ================== drm_buddy (6 subtests) ==================
[23:14:27] [PASSED] drm_test_buddy_alloc_limit
[23:14:27] [PASSED] drm_test_buddy_alloc_range
[23:14:27] [PASSED] drm_test_buddy_alloc_optimistic
[23:14:27] [PASSED] drm_test_buddy_alloc_pessimistic
[23:14:27] [PASSED] drm_test_buddy_alloc_smoke
[23:14:27] [PASSED] drm_test_buddy_alloc_pathological
[23:14:27] ==================== [PASSED] drm_buddy ====================
[23:14:27] ============= drm_cmdline_parser (40 subtests) =============
[23:14:27] [PASSED] drm_test_cmdline_force_d_only
[23:14:27] [PASSED] drm_test_cmdline_force_D_only_dvi
[23:14:27] [PASSED] drm_test_cmdline_force_D_only_hdmi
[23:14:27] [PASSED] drm_test_cmdline_force_D_only_not_digital
[23:14:27] [PASSED] drm_test_cmdline_force_e_only
[23:14:27] [PASSED] drm_test_cmdline_res
[23:14:27] [PASSED] drm_test_cmdline_res_vesa
[23:14:27] [PASSED] drm_test_cmdline_res_vesa_rblank
[23:14:27] [PASSED] drm_test_cmdline_res_rblank
[23:14:27] [PASSED] drm_test_cmdline_res_bpp
[23:14:27] [PASSED] drm_test_cmdline_res_refresh
[23:14:27] [PASSED] drm_test_cmdline_res_bpp_refresh
[23:14:27] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[23:14:27] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[23:14:27] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[23:14:27] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[23:14:27] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[23:14:27] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[23:14:27] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[23:14:27] [PASSED] drm_test_cmdline_res_margins_force_on
[23:14:27] [PASSED] drm_test_cmdline_res_vesa_margins
[23:14:27] [PASSED] drm_test_cmdline_name
[23:14:27] [PASSED] drm_test_cmdline_name_bpp
[23:14:27] [PASSED] drm_test_cmdline_name_option
[23:14:27] [PASSED] drm_test_cmdline_name_bpp_option
[23:14:27] [PASSED] drm_test_cmdline_rotate_0
[23:14:27] [PASSED] drm_test_cmdline_rotate_90
[23:14:27] [PASSED] drm_test_cmdline_rotate_180
[23:14:27] [PASSED] drm_test_cmdline_rotate_270
[23:14:27] [PASSED] drm_test_cmdline_hmirror
[23:14:27] [PASSED] drm_test_cmdline_vmirror
[23:14:27] [PASSED] drm_test_cmdline_margin_options
[23:14:27] [PASSED] drm_test_cmdline_multiple_options
[23:14:27] [PASSED] drm_test_cmdline_bpp_extra_and_option
[23:14:27] [PASSED] drm_test_cmdline_extra_and_option
[23:14:27] [PASSED] drm_test_cmdline_freestanding_options
[23:14:27] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[23:14:27] [PASSED] drm_test_cmdline_panel_orientation
[23:14:27] ================= drm_test_cmdline_invalid =================
[23:14:27] [PASSED] margin_only
[23:14:27] [PASSED] interlace_only
[23:14:27] [PASSED] res_missing_x
[23:14:27] [PASSED] res_missing_y
[23:14:27] [PASSED] res_bad_y
[23:14:27] [PASSED] res_missing_y_bpp
[23:14:27] [PASSED] res_bad_bpp
[23:14:27] [PASSED] res_bad_refresh
[23:14:27] [PASSED] res_bpp_refresh_force_on_off
[23:14:27] [PASSED] res_invalid_mode
[23:14:27] [PASSED] res_bpp_wrong_place_mode
[23:14:27] [PASSED] name_bpp_refresh
[23:14:27] [PASSED] name_refresh
[23:14:27] [PASSED] name_refresh_wrong_mode
[23:14:27] [PASSED] name_refresh_invalid_mode
[23:14:27] [PASSED] rotate_multiple
[23:14:27] [PASSED] rotate_invalid_val
[23:14:27] [PASSED] rotate_truncated
[23:14:27] [PASSED] invalid_option
[23:14:27] [PASSED] invalid_tv_option
[23:14:27] [PASSED] truncated_tv_option
[23:14:27] ============ [PASSED] drm_test_cmdline_invalid =============
[23:14:27] =============== drm_test_cmdline_tv_options ================
[23:14:27] [PASSED] NTSC
[23:14:27] [PASSED] NTSC_443
[23:14:27] [PASSED] NTSC_J
[23:14:27] [PASSED] PAL
[23:14:27] [PASSED] PAL_M
[23:14:27] [PASSED] PAL_N
[23:14:27] [PASSED] SECAM
[23:14:27] =========== [PASSED] drm_test_cmdline_tv_options ===========
[23:14:27] =============== [PASSED] drm_cmdline_parser ================
[23:14:27] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[23:14:27] =========== drm_test_get_tv_mode_from_name_valid ===========
[23:14:27] [PASSED] NTSC
[23:14:27] [PASSED] NTSC-443
[23:14:27] [PASSED] NTSC-J
[23:14:27] [PASSED] PAL
[23:14:27] [PASSED] PAL-M
[23:14:27] [PASSED] PAL-N
[23:14:27] [PASSED] SECAM
[23:14:27] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[23:14:27] [PASSED] drm_test_get_tv_mode_from_name_truncated
[23:14:27] ============ [PASSED] drm_get_tv_mode_from_name ============
[23:14:27] ============= drm_damage_helper (21 subtests) ==============
[23:14:27] [PASSED] drm_test_damage_iter_no_damage
[23:14:27] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[23:14:27] [PASSED] drm_test_damage_iter_no_damage_src_moved
[23:14:27] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[23:14:27] [PASSED] drm_test_damage_iter_no_damage_not_visible
[23:14:27] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[23:14:27] [PASSED] drm_test_damage_iter_no_damage_no_fb
[23:14:27] [PASSED] drm_test_damage_iter_simple_damage
[23:14:27] [PASSED] drm_test_damage_iter_single_damage
[23:14:27] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[23:14:27] [PASSED] drm_test_damage_iter_single_damage_outside_src
[23:14:27] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[23:14:27] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[23:14:27] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[23:14:27] [PASSED] drm_test_damage_iter_single_damage_src_moved
[23:14:27] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[23:14:27] [PASSED] drm_test_damage_iter_damage
[23:14:27] [PASSED] drm_test_damage_iter_damage_one_intersect
[23:14:27] [PASSED] drm_test_damage_iter_damage_one_outside
[23:14:27] [PASSED] drm_test_damage_iter_damage_src_moved
[23:14:27] [PASSED] drm_test_damage_iter_damage_not_visible
[23:14:27] ================ [PASSED] drm_damage_helper ================
[23:14:27] ============== drm_dp_mst_helper (2 subtests) ==============
[23:14:27] ============== drm_test_dp_mst_calc_pbn_mode ===============
[23:14:27] [PASSED] Clock 154000 BPP 30 DSC disabled
[23:14:27] [PASSED] Clock 234000 BPP 30 DSC disabled
[23:14:27] [PASSED] Clock 297000 BPP 24 DSC disabled
[23:14:27] [PASSED] Clock 332880 BPP 24 DSC enabled
[23:14:27] [PASSED] Clock 324540 BPP 24 DSC enabled
[23:14:27] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[23:14:27] ========= drm_test_dp_mst_sideband_msg_req_decode ==========
[23:14:27] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[23:14:27] [PASSED] DP_POWER_UP_PHY with port number
[23:14:27] [PASSED] DP_POWER_DOWN_PHY with port number
[23:14:27] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[23:14:27] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[23:14:27] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[23:14:27] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[23:14:27] [PASSED] DP_QUERY_PAYLOAD with port number
[23:14:27] [PASSED] DP_QUERY_PAYLOAD with VCPI
[23:14:27] [PASSED] DP_REMOTE_DPCD_READ with port number
[23:14:27] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[23:14:27] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[23:14:27] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[23:14:27] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[23:14:27] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[23:14:27] [PASSED] DP_REMOTE_I2C_READ with port number
[23:14:27] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[23:14:27] [PASSED] DP_REMOTE_I2C_READ with transactions array
[23:14:27] [PASSED] DP_REMOTE_I2C_WRITE with port number
[23:14:27] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[23:14:27] [PASSED] DP_REMOTE_I2C_WRITE with data array
[23:14:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[23:14:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[23:14:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[23:14:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[23:14:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[23:14:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[23:14:27] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[23:14:27] ================ [PASSED] drm_dp_mst_helper ================
[23:14:27] =========== drm_format_helper_test (5 subtests) ============
[23:14:27] ============== drm_test_fb_xrgb8888_to_gray8 ===============
[23:14:27] [PASSED] single_pixel_source_buffer
[23:14:27] [PASSED] single_pixel_clip_rectangle
[23:14:27] [PASSED] well_known_colors
[23:14:27] [PASSED] destination_pitch
[23:14:27] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[23:14:27] ============== drm_test_fb_xrgb8888_to_rgb332 ==============
[23:14:27] [PASSED] single_pixel_source_buffer
[23:14:27] [PASSED] single_pixel_clip_rectangle
[23:14:27] [PASSED] well_known_colors
[23:14:27] [PASSED] destination_pitch
[23:14:27] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[23:14:27] ============== drm_test_fb_xrgb8888_to_rgb565 ==============
[23:14:27] [PASSED] single_pixel_source_buffer
[23:14:27] [PASSED] single_pixel_clip_rectangle
[23:14:27] [PASSED] well_known_colors
[23:14:27] [PASSED] destination_pitch
[23:14:27] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[23:14:27] ============== drm_test_fb_xrgb8888_to_rgb888 ==============
[23:14:27] [PASSED] single_pixel_source_buffer
[23:14:27] [PASSED] single_pixel_clip_rectangle
[23:14:27] [PASSED] well_known_colors
[23:14:27] [PASSED] destination_pitch
[23:14:27] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[23:14:27] =========== drm_test_fb_xrgb8888_to_xrgb2101010 ============
[23:14:27] [PASSED] single_pixel_source_buffer
[23:14:27] [PASSED] single_pixel_clip_rectangle
[23:14:27] [PASSED] well_known_colors
[23:14:27] [PASSED] destination_pitch
[23:14:27] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[23:14:27] ============= [PASSED] drm_format_helper_test ==============
[23:14:27] ================= drm_format (18 subtests) =================
[23:14:27] [PASSED] drm_test_format_block_width_invalid
[23:14:27] [PASSED] drm_test_format_block_width_one_plane
[23:14:27] [PASSED] drm_test_format_block_width_two_plane
[23:14:27] [PASSED] drm_test_format_block_width_three_plane
[23:14:27] [PASSED] drm_test_format_block_width_tiled
[23:14:27] [PASSED] drm_test_format_block_height_invalid
[23:14:27] [PASSED] drm_test_format_block_height_one_plane
[23:14:27] [PASSED] drm_test_format_block_height_two_plane
[23:14:27] [PASSED] drm_test_format_block_height_three_plane
[23:14:27] [PASSED] drm_test_format_block_height_tiled
[23:14:27] [PASSED] drm_test_format_min_pitch_invalid
[23:14:27] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[23:14:27] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[23:14:27] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[23:14:27] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[23:14:27] [PASSED] drm_test_format_min_pitch_two_plane
[23:14:27] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[23:14:27] [PASSED] drm_test_format_min_pitch_tiled
[23:14:27] =================== [PASSED] drm_format ====================
[23:14:27] =============== drm_framebuffer (1 subtest) ================
[23:14:27] =============== drm_test_framebuffer_create ================
[23:14:27] [PASSED] ABGR8888 normal sizes
[23:14:27] [PASSED] ABGR8888 max sizes
[23:14:27] [PASSED] ABGR8888 pitch greater than min required
[23:14:27] [PASSED] ABGR8888 pitch less than min required
[23:14:27] [PASSED] ABGR8888 Invalid width
[23:14:27] [PASSED] ABGR8888 Invalid buffer handle
[23:14:27] [PASSED] No pixel format
[23:14:27] [PASSED] ABGR8888 Width 0
[23:14:27] [PASSED] ABGR8888 Height 0
[23:14:27] [PASSED] ABGR8888 Out of bound height * pitch combination
[23:14:27] [PASSED] ABGR8888 Large buffer offset
[23:14:27] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[23:14:27] [PASSED] ABGR8888 Valid buffer modifier
[23:14:27] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[23:14:27] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[23:14:27] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[23:14:27] [PASSED] NV12 Normal sizes
[23:14:27] [PASSED] NV12 Max sizes
[23:14:27] [PASSED] NV12 Invalid pitch
[23:14:27] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[23:14:27] [PASSED] NV12 different  modifier per-plane
[23:14:27] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[23:14:27] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[23:14:27] [PASSED] NV12 Modifier for inexistent plane
[23:14:27] [PASSED] NV12 Handle for inexistent plane
[23:14:27] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[23:14:27] [PASSED] YVU420 Normal sizes
[23:14:27] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[23:14:27] [PASSED] YVU420 Max sizes
[23:14:27] [PASSED] YVU420 Invalid pitch
[23:14:27] [PASSED] YVU420 Different pitches
[23:14:27] [PASSED] YVU420 Different buffer offsets/pitches
[23:14:27] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[23:14:27] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[23:14:27] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[23:14:27] [PASSED] YVU420 Valid modifier
[23:14:27] [PASSED] YVU420 Different modifiers per plane
[23:14:27] [PASSED] YVU420 Modifier for inexistent plane
[23:14:27] [PASSED] X0L2 Normal sizes
[23:14:27] [PASSED] X0L2 Max sizes
[23:14:27] [PASSED] X0L2 Invalid pitch
[23:14:27] [PASSED] X0L2 Pitch greater than minimum required
[23:14:27] [PASSED] X0L2 Handle for inexistent plane
[23:14:27] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[23:14:27] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[23:14:27] [PASSED] X0L2 Valid modifier
[23:14:27] [PASSED] X0L2 Modifier for inexistent plane
[23:14:27] =========== [PASSED] drm_test_framebuffer_create ===========
[23:14:27] ================= [PASSED] drm_framebuffer =================
[23:14:27] =============== drm-test-managed (1 subtest) ===============
[23:14:27] [PASSED] drm_test_managed_run_action
[23:14:27] ================ [PASSED] drm-test-managed =================
[23:14:27] =================== drm_mm (19 subtests) ===================
[23:14:27] [PASSED] drm_test_mm_init
[23:14:27] [PASSED] drm_test_mm_debug
[23:14:37] [PASSED] drm_test_mm_reserve
[23:14:47] [PASSED] drm_test_mm_insert
[23:14:48] [PASSED] drm_test_mm_replace
[23:14:48] [PASSED] drm_test_mm_insert_range
[23:14:48] [PASSED] drm_test_mm_frag
[23:14:48] [PASSED] drm_test_mm_align
[23:14:48] [PASSED] drm_test_mm_align32
[23:14:48] [PASSED] drm_test_mm_align64
[23:14:48] [PASSED] drm_test_mm_evict
[23:14:48] [PASSED] drm_test_mm_evict_range
[23:14:48] [PASSED] drm_test_mm_topdown
[23:14:48] [PASSED] drm_test_mm_bottomup
[23:14:48] [PASSED] drm_test_mm_lowest
[23:14:48] [PASSED] drm_test_mm_highest
[23:14:49] [PASSED] drm_test_mm_color
[23:14:50] [PASSED] drm_test_mm_color_evict
[23:14:50] [PASSED] drm_test_mm_color_evict_range
[23:14:50] ===================== [PASSED] drm_mm ======================
[23:14:50] ============= drm_modes_analog_tv (4 subtests) =============
[23:14:50] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[23:14:50] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[23:14:50] [PASSED] drm_test_modes_analog_tv_pal_576i
[23:14:50] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
stty: 'standard input': Inappropriate ioctl for device
[23:14:50] =============== [PASSED] drm_modes_analog_tv ===============
[23:14:50] ============== drm_plane_helper (2 subtests) ===============
[23:14:50] ================ drm_test_check_plane_state ================
[23:14:50] [PASSED] clipping_simple
[23:14:50] [PASSED] clipping_rotate_reflect
[23:14:50] [PASSED] positioning_simple
[23:14:50] [PASSED] upscaling
[23:14:50] [PASSED] downscaling
[23:14:50] [PASSED] rounding1
[23:14:50] [PASSED] rounding2
[23:14:50] [PASSED] rounding3
[23:14:50] [PASSED] rounding4
[23:14:50] =========== [PASSED] drm_test_check_plane_state ============
[23:14:50] ============ drm_test_check_invalid_plane_state ============
[23:14:50] [PASSED] positioning_invalid
[23:14:50] [PASSED] upscaling_invalid
[23:14:50] [PASSED] downscaling_invalid
[23:14:50] ======= [PASSED] drm_test_check_invalid_plane_state ========
[23:14:50] ================ [PASSED] drm_plane_helper =================
[23:14:50] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[23:14:50] ======= drm_test_connector_helper_tv_get_modes_check =======
[23:14:50] [PASSED] None
[23:14:50] [PASSED] PAL
[23:14:50] [PASSED] NTSC
[23:14:50] [PASSED] Both, NTSC Default
[23:14:50] [PASSED] Both, PAL Default
[23:14:50] [PASSED] Both, NTSC Default, with PAL on command-line
[23:14:50] [PASSED] Both, PAL Default, with NTSC on command-line
[23:14:50] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[23:14:50] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[23:14:50] ================== drm_rect (4 subtests) ===================
[23:14:50] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[23:14:50] [PASSED] drm_test_rect_clip_scaled_not_clipped
[23:14:50] [PASSED] drm_test_rect_clip_scaled_clipped
[23:14:50] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[23:14:50] ==================== [PASSED] drm_rect =====================
[23:14:50] ============================================================
[23:14:50] Testing complete. Ran 270 tests: passed: 270
[23:14:50] Elapsed time: 42.964s total, 1.643s configuring, 18.341s building, 22.949s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


