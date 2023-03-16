Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59271C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 06:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA5610EA42;
	Thu, 16 Mar 2023 06:29:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3CD6E10EA38;
 Thu, 16 Mar 2023 06:29:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 38866A66C9;
 Thu, 16 Mar 2023 06:29:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Thu, 16 Mar 2023 06:29:46 -0000
Message-ID: <167894818622.19095.14781905224362940318@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230316062554.3206639-1-lucas.demarchi@intel.com>
In-Reply-To: <20230316062554.3206639-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe?=
 =?utf-8?q?=3A_Add_basic_unit_tests_for_rtp?=
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

Series: drm/xe: Add basic unit tests for rtp
URL   : https://patchwork.freedesktop.org/series/115235/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[06:28:33] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:28:37] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[06:28:59] Starting KUnit Kernel (1/1)...
[06:28:59] ============================================================
[06:28:59] ==================== xe_bo (2 subtests) ====================
[06:28:59] [SKIPPED] xe_ccs_migrate_kunit
[06:28:59] [SKIPPED] xe_bo_evict_kunit
[06:28:59] ===================== [SKIPPED] xe_bo ======================
[06:28:59] ================== xe_dma_buf (1 subtest) ==================
[06:28:59] [SKIPPED] xe_dma_buf_kunit
[06:28:59] =================== [SKIPPED] xe_dma_buf ===================
[06:28:59] ================== xe_migrate (1 subtest) ==================
[06:28:59] [SKIPPED] xe_migrate_sanity_kunit
[06:28:59] =================== [SKIPPED] xe_migrate ===================
[06:28:59] ==================== xe_rtp (1 subtest) ====================
[06:28:59] [PASSED] xe_rtp_process_basic
[06:28:59] ===================== [PASSED] xe_rtp ======================
[06:28:59] ============================================================
[06:28:59] Testing complete. Ran 5 tests: passed: 1, skipped: 4
[06:28:59] Elapsed time: 25.800s total, 4.123s configuring, 21.557s building, 0.091s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[06:28:59] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:29:01] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[06:29:19] Starting KUnit Kernel (1/1)...
[06:29:19] ============================================================
[06:29:19] ============ drm_test_pick_cmdline (2 subtests) ============
[06:29:19] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[06:29:19] =============== drm_test_pick_cmdline_named ================
[06:29:19] [PASSED] NTSC
[06:29:19] [PASSED] NTSC-J
[06:29:19] [PASSED] PAL
[06:29:19] [PASSED] PAL-M
[06:29:19] =========== [PASSED] drm_test_pick_cmdline_named ===========
[06:29:19] ============== [PASSED] drm_test_pick_cmdline ==============
[06:29:19] ================== drm_buddy (6 subtests) ==================
[06:29:19] [PASSED] drm_test_buddy_alloc_limit
[06:29:19] [PASSED] drm_test_buddy_alloc_range
[06:29:19] [PASSED] drm_test_buddy_alloc_optimistic
[06:29:19] [PASSED] drm_test_buddy_alloc_pessimistic
[06:29:19] [PASSED] drm_test_buddy_alloc_smoke
[06:29:19] [PASSED] drm_test_buddy_alloc_pathological
[06:29:19] ==================== [PASSED] drm_buddy ====================
[06:29:19] ============= drm_cmdline_parser (40 subtests) =============
[06:29:19] [PASSED] drm_test_cmdline_force_d_only
[06:29:19] [PASSED] drm_test_cmdline_force_D_only_dvi
[06:29:19] [PASSED] drm_test_cmdline_force_D_only_hdmi
[06:29:19] [PASSED] drm_test_cmdline_force_D_only_not_digital
[06:29:19] [PASSED] drm_test_cmdline_force_e_only
[06:29:19] [PASSED] drm_test_cmdline_res
[06:29:19] [PASSED] drm_test_cmdline_res_vesa
[06:29:19] [PASSED] drm_test_cmdline_res_vesa_rblank
[06:29:19] [PASSED] drm_test_cmdline_res_rblank
[06:29:19] [PASSED] drm_test_cmdline_res_bpp
[06:29:19] [PASSED] drm_test_cmdline_res_refresh
[06:29:19] [PASSED] drm_test_cmdline_res_bpp_refresh
[06:29:19] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[06:29:19] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[06:29:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[06:29:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[06:29:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[06:29:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[06:29:19] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[06:29:19] [PASSED] drm_test_cmdline_res_margins_force_on
[06:29:19] [PASSED] drm_test_cmdline_res_vesa_margins
[06:29:19] [PASSED] drm_test_cmdline_name
[06:29:19] [PASSED] drm_test_cmdline_name_bpp
[06:29:19] [PASSED] drm_test_cmdline_name_option
[06:29:19] [PASSED] drm_test_cmdline_name_bpp_option
[06:29:19] [PASSED] drm_test_cmdline_rotate_0
[06:29:19] [PASSED] drm_test_cmdline_rotate_90
[06:29:19] [PASSED] drm_test_cmdline_rotate_180
[06:29:19] [PASSED] drm_test_cmdline_rotate_270
[06:29:19] [PASSED] drm_test_cmdline_hmirror
[06:29:19] [PASSED] drm_test_cmdline_vmirror
[06:29:19] [PASSED] drm_test_cmdline_margin_options
[06:29:19] [PASSED] drm_test_cmdline_multiple_options
[06:29:19] [PASSED] drm_test_cmdline_bpp_extra_and_option
[06:29:19] [PASSED] drm_test_cmdline_extra_and_option
[06:29:19] [PASSED] drm_test_cmdline_freestanding_options
[06:29:19] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[06:29:19] [PASSED] drm_test_cmdline_panel_orientation
[06:29:19] ================= drm_test_cmdline_invalid =================
[06:29:19] [PASSED] margin_only
[06:29:19] [PASSED] interlace_only
[06:29:19] [PASSED] res_missing_x
[06:29:19] [PASSED] res_missing_y
[06:29:19] [PASSED] res_bad_y
[06:29:19] [PASSED] res_missing_y_bpp
[06:29:19] [PASSED] res_bad_bpp
[06:29:19] [PASSED] res_bad_refresh
[06:29:19] [PASSED] res_bpp_refresh_force_on_off
[06:29:19] [PASSED] res_invalid_mode
[06:29:19] [PASSED] res_bpp_wrong_place_mode
[06:29:19] [PASSED] name_bpp_refresh
[06:29:19] [PASSED] name_refresh
[06:29:19] [PASSED] name_refresh_wrong_mode
[06:29:19] [PASSED] name_refresh_invalid_mode
[06:29:19] [PASSED] rotate_multiple
[06:29:19] [PASSED] rotate_invalid_val
[06:29:19] [PASSED] rotate_truncated
[06:29:19] [PASSED] invalid_option
[06:29:19] [PASSED] invalid_tv_option
[06:29:19] [PASSED] truncated_tv_option
[06:29:19] ============ [PASSED] drm_test_cmdline_invalid =============
[06:29:19] =============== drm_test_cmdline_tv_options ================
[06:29:19] [PASSED] NTSC
[06:29:19] [PASSED] NTSC_443
[06:29:19] [PASSED] NTSC_J
[06:29:19] [PASSED] PAL
[06:29:19] [PASSED] PAL_M
[06:29:19] [PASSED] PAL_N
[06:29:19] [PASSED] SECAM
[06:29:19] =========== [PASSED] drm_test_cmdline_tv_options ===========
[06:29:19] =============== [PASSED] drm_cmdline_parser ================
[06:29:19] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[06:29:19] =========== drm_test_get_tv_mode_from_name_valid ===========
[06:29:19] [PASSED] NTSC
[06:29:19] [PASSED] NTSC-443
[06:29:19] [PASSED] NTSC-J
[06:29:19] [PASSED] PAL
[06:29:19] [PASSED] PAL-M
[06:29:19] [PASSED] PAL-N
[06:29:19] [PASSED] SECAM
[06:29:19] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[06:29:19] [PASSED] drm_test_get_tv_mode_from_name_truncated
[06:29:19] ============ [PASSED] drm_get_tv_mode_from_name ============
[06:29:19] ============= drm_damage_helper (21 subtests) ==============
[06:29:19] [PASSED] drm_test_damage_iter_no_damage
[06:29:19] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[06:29:19] [PASSED] drm_test_damage_iter_no_damage_src_moved
[06:29:19] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[06:29:19] [PASSED] drm_test_damage_iter_no_damage_not_visible
[06:29:19] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[06:29:19] [PASSED] drm_test_damage_iter_no_damage_no_fb
[06:29:19] [PASSED] drm_test_damage_iter_simple_damage
[06:29:19] [PASSED] drm_test_damage_iter_single_damage
[06:29:19] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[06:29:19] [PASSED] drm_test_damage_iter_single_damage_outside_src
[06:29:19] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[06:29:19] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[06:29:19] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[06:29:19] [PASSED] drm_test_damage_iter_single_damage_src_moved
[06:29:19] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[06:29:19] [PASSED] drm_test_damage_iter_damage
[06:29:19] [PASSED] drm_test_damage_iter_damage_one_intersect
[06:29:19] [PASSED] drm_test_damage_iter_damage_one_outside
[06:29:19] [PASSED] drm_test_damage_iter_damage_src_moved
[06:29:19] [PASSED] drm_test_damage_iter_damage_not_visible
[06:29:19] ================ [PASSED] drm_damage_helper ================
[06:29:19] ============== drm_dp_mst_helper (2 subtests) ==============
[06:29:19] ============== drm_test_dp_mst_calc_pbn_mode ===============
[06:29:19] [PASSED] Clock 154000 BPP 30 DSC disabled
[06:29:19] [PASSED] Clock 234000 BPP 30 DSC disabled
[06:29:19] [PASSED] Clock 297000 BPP 24 DSC disabled
[06:29:19] [PASSED] Clock 332880 BPP 24 DSC enabled
[06:29:19] [PASSED] Clock 324540 BPP 24 DSC enabled
[06:29:19] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[06:29:19] ========= drm_test_dp_mst_sideband_msg_req_decode ==========
[06:29:19] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[06:29:19] [PASSED] DP_POWER_UP_PHY with port number
[06:29:19] [PASSED] DP_POWER_DOWN_PHY with port number
[06:29:19] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[06:29:19] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[06:29:19] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[06:29:19] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[06:29:19] [PASSED] DP_QUERY_PAYLOAD with port number
[06:29:19] [PASSED] DP_QUERY_PAYLOAD with VCPI
[06:29:19] [PASSED] DP_REMOTE_DPCD_READ with port number
[06:29:19] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[06:29:19] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[06:29:19] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[06:29:19] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[06:29:19] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[06:29:19] [PASSED] DP_REMOTE_I2C_READ with port number
[06:29:19] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[06:29:19] [PASSED] DP_REMOTE_I2C_READ with transactions array
[06:29:19] [PASSED] DP_REMOTE_I2C_WRITE with port number
[06:29:19] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[06:29:19] [PASSED] DP_REMOTE_I2C_WRITE with data array
[06:29:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[06:29:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[06:29:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[06:29:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[06:29:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[06:29:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[06:29:19] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[06:29:19] ================ [PASSED] drm_dp_mst_helper ================
[06:29:19] =========== drm_format_helper_test (5 subtests) ============
[06:29:19] ============== drm_test_fb_xrgb8888_to_gray8 ===============
[06:29:19] [PASSED] single_pixel_source_buffer
[06:29:19] [PASSED] single_pixel_clip_rectangle
[06:29:19] [PASSED] well_known_colors
[06:29:19] [PASSED] destination_pitch
[06:29:19] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[06:29:19] ============== drm_test_fb_xrgb8888_to_rgb332 ==============
[06:29:19] [PASSED] single_pixel_source_buffer
[06:29:19] [PASSED] single_pixel_clip_rectangle
[06:29:19] [PASSED] well_known_colors
[06:29:19] [PASSED] destination_pitch
[06:29:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[06:29:19] ============== drm_test_fb_xrgb8888_to_rgb565 ==============
[06:29:19] [PASSED] single_pixel_source_buffer
[06:29:19] [PASSED] single_pixel_clip_rectangle
[06:29:19] [PASSED] well_known_colors
[06:29:19] [PASSED] destination_pitch
[06:29:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[06:29:19] ============== drm_test_fb_xrgb8888_to_rgb888 ==============
[06:29:19] [PASSED] single_pixel_source_buffer
[06:29:19] [PASSED] single_pixel_clip_rectangle
[06:29:19] [PASSED] well_known_colors
[06:29:19] [PASSED] destination_pitch
[06:29:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[06:29:19] =========== drm_test_fb_xrgb8888_to_xrgb2101010 ============
[06:29:19] [PASSED] single_pixel_source_buffer
[06:29:19] [PASSED] single_pixel_clip_rectangle
[06:29:19] [PASSED] well_known_colors
[06:29:19] [PASSED] destination_pitch
[06:29:19] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[06:29:19] ============= [PASSED] drm_format_helper_test ==============
[06:29:19] ================= drm_format (18 subtests) =================
[06:29:19] [PASSED] drm_test_format_block_width_invalid
[06:29:19] [PASSED] drm_test_format_block_width_one_plane
[06:29:19] [PASSED] drm_test_format_block_width_two_plane
[06:29:19] [PASSED] drm_test_format_block_width_three_plane
[06:29:19] [PASSED] drm_test_format_block_width_tiled
[06:29:19] [PASSED] drm_test_format_block_height_invalid
[06:29:19] [PASSED] drm_test_format_block_height_one_plane
[06:29:19] [PASSED] drm_test_format_block_height_two_plane
[06:29:19] [PASSED] drm_test_format_block_height_three_plane
[06:29:19] [PASSED] drm_test_format_block_height_tiled
[06:29:19] [PASSED] drm_test_format_min_pitch_invalid
[06:29:19] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[06:29:19] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[06:29:19] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[06:29:19] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[06:29:19] [PASSED] drm_test_format_min_pitch_two_plane
[06:29:19] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[06:29:19] [PASSED] drm_test_format_min_pitch_tiled
[06:29:19] =================== [PASSED] drm_format ====================
[06:29:19] =============== drm_framebuffer (1 subtest) ================
[06:29:19] =============== drm_test_framebuffer_create ================
[06:29:19] [PASSED] ABGR8888 normal sizes
[06:29:19] [PASSED] ABGR8888 max sizes
[06:29:19] [PASSED] ABGR8888 pitch greater than min required
[06:29:19] [PASSED] ABGR8888 pitch less than min required
[06:29:19] [PASSED] ABGR8888 Invalid width
[06:29:19] [PASSED] ABGR8888 Invalid buffer handle
[06:29:19] [PASSED] No pixel format
[06:29:19] [PASSED] ABGR8888 Width 0
[06:29:19] [PASSED] ABGR8888 Height 0
[06:29:19] [PASSED] ABGR8888 Out of bound height * pitch combination
[06:29:19] [PASSED] ABGR8888 Large buffer offset
[06:29:19] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[06:29:19] [PASSED] ABGR8888 Valid buffer modifier
[06:29:19] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[06:29:19] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[06:29:19] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[06:29:19] [PASSED] NV12 Normal sizes
[06:29:19] [PASSED] NV12 Max sizes
[06:29:19] [PASSED] NV12 Invalid pitch
[06:29:19] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[06:29:19] [PASSED] NV12 different  modifier per-plane
[06:29:19] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[06:29:19] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[06:29:19] [PASSED] NV12 Modifier for inexistent plane
[06:29:19] [PASSED] NV12 Handle for inexistent plane
[06:29:19] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[06:29:19] [PASSED] YVU420 Normal sizes
[06:29:19] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[06:29:19] [PASSED] YVU420 Max sizes
[06:29:19] [PASSED] YVU420 Invalid pitch
[06:29:19] [PASSED] YVU420 Different pitches
[06:29:19] [PASSED] YVU420 Different buffer offsets/pitches
[06:29:19] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[06:29:19] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[06:29:19] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[06:29:19] [PASSED] YVU420 Valid modifier
[06:29:19] [PASSED] YVU420 Different modifiers per plane
[06:29:19] [PASSED] YVU420 Modifier for inexistent plane
[06:29:19] [PASSED] X0L2 Normal sizes
[06:29:19] [PASSED] X0L2 Max sizes
[06:29:19] [PASSED] X0L2 Invalid pitch
[06:29:19] [PASSED] X0L2 Pitch greater than minimum required
[06:29:19] [PASSED] X0L2 Handle for inexistent plane
[06:29:19] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[06:29:19] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[06:29:19] [PASSED] X0L2 Valid modifier
[06:29:19] [PASSED] X0L2 Modifier for inexistent plane
[06:29:19] =========== [PASSED] drm_test_framebuffer_create ===========
[06:29:19] ================= [PASSED] drm_framebuffer =================
[06:29:19] =============== drm-test-managed (1 subtest) ===============
[06:29:19] [PASSED] drm_test_managed_run_action
[06:29:19] ================ [PASSED] drm-test-managed =================
[06:29:19] =================== drm_mm (19 subtests) ===================
[06:29:19] [PASSED] drm_test_mm_init
[06:29:19] [PASSED] drm_test_mm_debug
[06:29:29] [PASSED] drm_test_mm_reserve
[06:29:39] [PASSED] drm_test_mm_insert
[06:29:39] [PASSED] drm_test_mm_replace
[06:29:39] [PASSED] drm_test_mm_insert_range
[06:29:39] [PASSED] drm_test_mm_frag
[06:29:39] [PASSED] drm_test_mm_align
[06:29:39] [PASSED] drm_test_mm_align32
[06:29:40] [PASSED] drm_test_mm_align64
[06:29:40] [PASSED] drm_test_mm_evict
[06:29:40] [PASSED] drm_test_mm_evict_range
[06:29:40] [PASSED] drm_test_mm_topdown
[06:29:40] [PASSED] drm_test_mm_bottomup
[06:29:40] [PASSED] drm_test_mm_lowest
[06:29:40] [PASSED] drm_test_mm_highest
[06:29:41] [PASSED] drm_test_mm_color
[06:29:41] [PASSED] drm_test_mm_color_evict
[06:29:41] [PASSED] drm_test_mm_color_evict_range
[06:29:41] ===================== [PASSED] drm_mm ======================
[06:29:41] ============= drm_modes_analog_tv (4 subtests) =============
[06:29:41] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[06:29:41] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[06:29:41] [PASSED] drm_test_modes_analog_tv_pal_576i
[06:29:41] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
stty: 'standard input': Inappropriate ioctl for device
[06:29:41] =============== [PASSED] drm_modes_analog_tv ===============
[06:29:41] ============== drm_plane_helper (2 subtests) ===============
[06:29:41] ================ drm_test_check_plane_state ================
[06:29:41] [PASSED] clipping_simple
[06:29:41] [PASSED] clipping_rotate_reflect
[06:29:41] [PASSED] positioning_simple
[06:29:41] [PASSED] upscaling
[06:29:41] [PASSED] downscaling
[06:29:41] [PASSED] rounding1
[06:29:41] [PASSED] rounding2
[06:29:41] [PASSED] rounding3
[06:29:41] [PASSED] rounding4
[06:29:41] =========== [PASSED] drm_test_check_plane_state ============
[06:29:41] ============ drm_test_check_invalid_plane_state ============
[06:29:41] [PASSED] positioning_invalid
[06:29:41] [PASSED] upscaling_invalid
[06:29:41] [PASSED] downscaling_invalid
[06:29:41] ======= [PASSED] drm_test_check_invalid_plane_state ========
[06:29:41] ================ [PASSED] drm_plane_helper =================
[06:29:41] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[06:29:41] ======= drm_test_connector_helper_tv_get_modes_check =======
[06:29:41] [PASSED] None
[06:29:41] [PASSED] PAL
[06:29:41] [PASSED] NTSC
[06:29:41] [PASSED] Both, NTSC Default
[06:29:41] [PASSED] Both, PAL Default
[06:29:41] [PASSED] Both, NTSC Default, with PAL on command-line
[06:29:41] [PASSED] Both, PAL Default, with NTSC on command-line
[06:29:41] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[06:29:41] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[06:29:41] ================== drm_rect (4 subtests) ===================
[06:29:41] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[06:29:41] [PASSED] drm_test_rect_clip_scaled_not_clipped
[06:29:41] [PASSED] drm_test_rect_clip_scaled_clipped
[06:29:41] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[06:29:41] ==================== [PASSED] drm_rect =====================
[06:29:41] ============================================================
[06:29:41] Testing complete. Ran 270 tests: passed: 270
[06:29:41] Elapsed time: 42.222s total, 1.636s configuring, 18.003s building, 22.541s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


