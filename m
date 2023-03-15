Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9817EC6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 09:42:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685BF10E985;
	Wed, 15 Mar 2023 09:42:55 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 00A5510E985;
 Wed, 15 Mar 2023 09:42:53 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F0E64ACC20;
 Wed, 15 Mar 2023 09:42:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mauro Carvalho Chehab" <mauro.chehab@linux.intel.com>
Date: Wed, 15 Mar 2023 09:42:52 -0000
Message-ID: <167887337298.19840.11035809730451345869@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <25959b6c92cae10f414e3fcbc881c4b2e272f3d8.1678873128.git.mchehab@kernel.org>
In-Reply-To: <25959b6c92cae10f414e3fcbc881c4b2e272f3d8.1678873128.git.mchehab@kernel.org>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/?=
 =?utf-8?q?xe-pci=3A_print_a_message_when_probing_a_device?=
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

Series: drm/xe/xe-pci: print a message when probing a device
URL   : https://patchwork.freedesktop.org/series/115177/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[09:41:41] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:41:45] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[09:42:07] Starting KUnit Kernel (1/1)...
[09:42:07] ============================================================
[09:42:07] ==================== xe_bo (2 subtests) ====================
[09:42:07] [SKIPPED] xe_ccs_migrate_kunit
[09:42:07] [SKIPPED] xe_bo_evict_kunit
[09:42:07] ===================== [SKIPPED] xe_bo ======================
[09:42:07] ================== xe_dma_buf (1 subtest) ==================
[09:42:07] [SKIPPED] xe_dma_buf_kunit
[09:42:07] =================== [SKIPPED] xe_dma_buf ===================
[09:42:07] ================== xe_migrate (1 subtest) ==================
[09:42:07] [SKIPPED] xe_migrate_sanity_kunit
[09:42:07] =================== [SKIPPED] xe_migrate ===================
[09:42:07] ============================================================
[09:42:07] Testing complete. Ran 4 tests: skipped: 4
[09:42:07] Elapsed time: 25.866s total, 4.153s configuring, 21.544s building, 0.131s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[09:42:07] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:42:09] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[09:42:27] Starting KUnit Kernel (1/1)...
[09:42:27] ============================================================
[09:42:27] ============ drm_test_pick_cmdline (2 subtests) ============
[09:42:27] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[09:42:27] =============== drm_test_pick_cmdline_named ================
[09:42:27] [PASSED] NTSC
[09:42:27] [PASSED] NTSC-J
[09:42:27] [PASSED] PAL
[09:42:27] [PASSED] PAL-M
[09:42:27] =========== [PASSED] drm_test_pick_cmdline_named ===========
[09:42:27] ============== [PASSED] drm_test_pick_cmdline ==============
[09:42:27] ================== drm_buddy (6 subtests) ==================
[09:42:27] [PASSED] drm_test_buddy_alloc_limit
[09:42:27] [PASSED] drm_test_buddy_alloc_range
[09:42:27] [PASSED] drm_test_buddy_alloc_optimistic
[09:42:27] [PASSED] drm_test_buddy_alloc_pessimistic
[09:42:27] [PASSED] drm_test_buddy_alloc_smoke
[09:42:27] [PASSED] drm_test_buddy_alloc_pathological
[09:42:27] ==================== [PASSED] drm_buddy ====================
[09:42:27] ============= drm_cmdline_parser (40 subtests) =============
[09:42:27] [PASSED] drm_test_cmdline_force_d_only
[09:42:27] [PASSED] drm_test_cmdline_force_D_only_dvi
[09:42:27] [PASSED] drm_test_cmdline_force_D_only_hdmi
[09:42:27] [PASSED] drm_test_cmdline_force_D_only_not_digital
[09:42:27] [PASSED] drm_test_cmdline_force_e_only
[09:42:27] [PASSED] drm_test_cmdline_res
[09:42:27] [PASSED] drm_test_cmdline_res_vesa
[09:42:27] [PASSED] drm_test_cmdline_res_vesa_rblank
[09:42:27] [PASSED] drm_test_cmdline_res_rblank
[09:42:27] [PASSED] drm_test_cmdline_res_bpp
[09:42:27] [PASSED] drm_test_cmdline_res_refresh
[09:42:27] [PASSED] drm_test_cmdline_res_bpp_refresh
[09:42:27] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[09:42:27] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[09:42:27] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[09:42:27] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[09:42:27] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[09:42:27] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[09:42:27] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[09:42:27] [PASSED] drm_test_cmdline_res_margins_force_on
[09:42:27] [PASSED] drm_test_cmdline_res_vesa_margins
[09:42:27] [PASSED] drm_test_cmdline_name
[09:42:27] [PASSED] drm_test_cmdline_name_bpp
[09:42:27] [PASSED] drm_test_cmdline_name_option
[09:42:27] [PASSED] drm_test_cmdline_name_bpp_option
[09:42:27] [PASSED] drm_test_cmdline_rotate_0
[09:42:27] [PASSED] drm_test_cmdline_rotate_90
[09:42:27] [PASSED] drm_test_cmdline_rotate_180
[09:42:27] [PASSED] drm_test_cmdline_rotate_270
[09:42:27] [PASSED] drm_test_cmdline_hmirror
[09:42:27] [PASSED] drm_test_cmdline_vmirror
[09:42:27] [PASSED] drm_test_cmdline_margin_options
[09:42:27] [PASSED] drm_test_cmdline_multiple_options
[09:42:27] [PASSED] drm_test_cmdline_bpp_extra_and_option
[09:42:27] [PASSED] drm_test_cmdline_extra_and_option
[09:42:27] [PASSED] drm_test_cmdline_freestanding_options
[09:42:27] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[09:42:27] [PASSED] drm_test_cmdline_panel_orientation
[09:42:27] ================= drm_test_cmdline_invalid =================
[09:42:27] [PASSED] margin_only
[09:42:27] [PASSED] interlace_only
[09:42:27] [PASSED] res_missing_x
[09:42:27] [PASSED] res_missing_y
[09:42:27] [PASSED] res_bad_y
[09:42:27] [PASSED] res_missing_y_bpp
[09:42:27] [PASSED] res_bad_bpp
[09:42:27] [PASSED] res_bad_refresh
[09:42:27] [PASSED] res_bpp_refresh_force_on_off
[09:42:27] [PASSED] res_invalid_mode
[09:42:27] [PASSED] res_bpp_wrong_place_mode
[09:42:27] [PASSED] name_bpp_refresh
[09:42:27] [PASSED] name_refresh
[09:42:27] [PASSED] name_refresh_wrong_mode
[09:42:27] [PASSED] name_refresh_invalid_mode
[09:42:27] [PASSED] rotate_multiple
[09:42:27] [PASSED] rotate_invalid_val
[09:42:27] [PASSED] rotate_truncated
[09:42:27] [PASSED] invalid_option
[09:42:27] [PASSED] invalid_tv_option
[09:42:27] [PASSED] truncated_tv_option
[09:42:27] ============ [PASSED] drm_test_cmdline_invalid =============
[09:42:27] =============== drm_test_cmdline_tv_options ================
[09:42:27] [PASSED] NTSC
[09:42:27] [PASSED] NTSC_443
[09:42:27] [PASSED] NTSC_J
[09:42:27] [PASSED] PAL
[09:42:27] [PASSED] PAL_M
[09:42:27] [PASSED] PAL_N
[09:42:27] [PASSED] SECAM
[09:42:27] =========== [PASSED] drm_test_cmdline_tv_options ===========
[09:42:27] =============== [PASSED] drm_cmdline_parser ================
[09:42:27] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[09:42:27] =========== drm_test_get_tv_mode_from_name_valid ===========
[09:42:27] [PASSED] NTSC
[09:42:27] [PASSED] NTSC-443
[09:42:27] [PASSED] NTSC-J
[09:42:27] [PASSED] PAL
[09:42:27] [PASSED] PAL-M
[09:42:27] [PASSED] PAL-N
[09:42:27] [PASSED] SECAM
[09:42:27] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[09:42:27] [PASSED] drm_test_get_tv_mode_from_name_truncated
[09:42:27] ============ [PASSED] drm_get_tv_mode_from_name ============
[09:42:27] ============= drm_damage_helper (21 subtests) ==============
[09:42:27] [PASSED] drm_test_damage_iter_no_damage
[09:42:27] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[09:42:27] [PASSED] drm_test_damage_iter_no_damage_src_moved
[09:42:27] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[09:42:27] [PASSED] drm_test_damage_iter_no_damage_not_visible
[09:42:27] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[09:42:27] [PASSED] drm_test_damage_iter_no_damage_no_fb
[09:42:27] [PASSED] drm_test_damage_iter_simple_damage
[09:42:27] [PASSED] drm_test_damage_iter_single_damage
[09:42:27] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[09:42:27] [PASSED] drm_test_damage_iter_single_damage_outside_src
[09:42:27] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[09:42:27] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[09:42:27] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[09:42:27] [PASSED] drm_test_damage_iter_single_damage_src_moved
[09:42:27] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[09:42:27] [PASSED] drm_test_damage_iter_damage
[09:42:27] [PASSED] drm_test_damage_iter_damage_one_intersect
[09:42:27] [PASSED] drm_test_damage_iter_damage_one_outside
[09:42:27] [PASSED] drm_test_damage_iter_damage_src_moved
[09:42:27] [PASSED] drm_test_damage_iter_damage_not_visible
[09:42:27] ================ [PASSED] drm_damage_helper ================
[09:42:27] ============== drm_dp_mst_helper (2 subtests) ==============
[09:42:27] ============== drm_test_dp_mst_calc_pbn_mode ===============
[09:42:27] [PASSED] Clock 154000 BPP 30 DSC disabled
[09:42:27] [PASSED] Clock 234000 BPP 30 DSC disabled
[09:42:27] [PASSED] Clock 297000 BPP 24 DSC disabled
[09:42:27] [PASSED] Clock 332880 BPP 24 DSC enabled
[09:42:27] [PASSED] Clock 324540 BPP 24 DSC enabled
[09:42:27] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[09:42:27] ========= drm_test_dp_mst_sideband_msg_req_decode ==========
[09:42:27] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[09:42:27] [PASSED] DP_POWER_UP_PHY with port number
[09:42:27] [PASSED] DP_POWER_DOWN_PHY with port number
[09:42:27] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[09:42:27] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[09:42:27] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[09:42:27] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[09:42:27] [PASSED] DP_QUERY_PAYLOAD with port number
[09:42:27] [PASSED] DP_QUERY_PAYLOAD with VCPI
[09:42:27] [PASSED] DP_REMOTE_DPCD_READ with port number
[09:42:27] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[09:42:27] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[09:42:27] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[09:42:27] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[09:42:27] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[09:42:27] [PASSED] DP_REMOTE_I2C_READ with port number
[09:42:27] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[09:42:27] [PASSED] DP_REMOTE_I2C_READ with transactions array
[09:42:27] [PASSED] DP_REMOTE_I2C_WRITE with port number
[09:42:27] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[09:42:27] [PASSED] DP_REMOTE_I2C_WRITE with data array
[09:42:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[09:42:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[09:42:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[09:42:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[09:42:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[09:42:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[09:42:27] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[09:42:27] ================ [PASSED] drm_dp_mst_helper ================
[09:42:27] =========== drm_format_helper_test (5 subtests) ============
[09:42:27] ============== drm_test_fb_xrgb8888_to_gray8 ===============
[09:42:27] [PASSED] single_pixel_source_buffer
[09:42:27] [PASSED] single_pixel_clip_rectangle
[09:42:27] [PASSED] well_known_colors
[09:42:27] [PASSED] destination_pitch
[09:42:27] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[09:42:27] ============== drm_test_fb_xrgb8888_to_rgb332 ==============
[09:42:27] [PASSED] single_pixel_source_buffer
[09:42:27] [PASSED] single_pixel_clip_rectangle
[09:42:27] [PASSED] well_known_colors
[09:42:27] [PASSED] destination_pitch
[09:42:27] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[09:42:27] ============== drm_test_fb_xrgb8888_to_rgb565 ==============
[09:42:27] [PASSED] single_pixel_source_buffer
[09:42:27] [PASSED] single_pixel_clip_rectangle
[09:42:27] [PASSED] well_known_colors
[09:42:27] [PASSED] destination_pitch
[09:42:27] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[09:42:27] ============== drm_test_fb_xrgb8888_to_rgb888 ==============
[09:42:27] [PASSED] single_pixel_source_buffer
[09:42:27] [PASSED] single_pixel_clip_rectangle
[09:42:27] [PASSED] well_known_colors
[09:42:27] [PASSED] destination_pitch
[09:42:27] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[09:42:27] =========== drm_test_fb_xrgb8888_to_xrgb2101010 ============
[09:42:27] [PASSED] single_pixel_source_buffer
[09:42:27] [PASSED] single_pixel_clip_rectangle
[09:42:27] [PASSED] well_known_colors
[09:42:27] [PASSED] destination_pitch
[09:42:27] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[09:42:27] ============= [PASSED] drm_format_helper_test ==============
[09:42:27] ================= drm_format (18 subtests) =================
[09:42:27] [PASSED] drm_test_format_block_width_invalid
[09:42:27] [PASSED] drm_test_format_block_width_one_plane
[09:42:27] [PASSED] drm_test_format_block_width_two_plane
[09:42:27] [PASSED] drm_test_format_block_width_three_plane
[09:42:27] [PASSED] drm_test_format_block_width_tiled
[09:42:27] [PASSED] drm_test_format_block_height_invalid
[09:42:27] [PASSED] drm_test_format_block_height_one_plane
[09:42:27] [PASSED] drm_test_format_block_height_two_plane
[09:42:27] [PASSED] drm_test_format_block_height_three_plane
[09:42:27] [PASSED] drm_test_format_block_height_tiled
[09:42:27] [PASSED] drm_test_format_min_pitch_invalid
[09:42:27] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[09:42:27] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[09:42:27] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[09:42:27] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[09:42:27] [PASSED] drm_test_format_min_pitch_two_plane
[09:42:27] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[09:42:27] [PASSED] drm_test_format_min_pitch_tiled
[09:42:27] =================== [PASSED] drm_format ====================
[09:42:27] =============== drm_framebuffer (1 subtest) ================
[09:42:27] =============== drm_test_framebuffer_create ================
[09:42:27] [PASSED] ABGR8888 normal sizes
[09:42:27] [PASSED] ABGR8888 max sizes
[09:42:27] [PASSED] ABGR8888 pitch greater than min required
[09:42:27] [PASSED] ABGR8888 pitch less than min required
[09:42:27] [PASSED] ABGR8888 Invalid width
[09:42:27] [PASSED] ABGR8888 Invalid buffer handle
[09:42:27] [PASSED] No pixel format
[09:42:27] [PASSED] ABGR8888 Width 0
[09:42:27] [PASSED] ABGR8888 Height 0
[09:42:27] [PASSED] ABGR8888 Out of bound height * pitch combination
[09:42:27] [PASSED] ABGR8888 Large buffer offset
[09:42:27] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[09:42:27] [PASSED] ABGR8888 Valid buffer modifier
[09:42:27] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[09:42:27] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[09:42:27] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[09:42:27] [PASSED] NV12 Normal sizes
[09:42:27] [PASSED] NV12 Max sizes
[09:42:27] [PASSED] NV12 Invalid pitch
[09:42:27] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[09:42:27] [PASSED] NV12 different  modifier per-plane
[09:42:27] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[09:42:27] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[09:42:27] [PASSED] NV12 Modifier for inexistent plane
[09:42:27] [PASSED] NV12 Handle for inexistent plane
[09:42:27] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[09:42:27] [PASSED] YVU420 Normal sizes
[09:42:27] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[09:42:27] [PASSED] YVU420 Max sizes
[09:42:27] [PASSED] YVU420 Invalid pitch
[09:42:27] [PASSED] YVU420 Different pitches
[09:42:27] [PASSED] YVU420 Different buffer offsets/pitches
[09:42:27] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[09:42:27] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[09:42:27] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[09:42:27] [PASSED] YVU420 Valid modifier
[09:42:27] [PASSED] YVU420 Different modifiers per plane
[09:42:27] [PASSED] YVU420 Modifier for inexistent plane
[09:42:27] [PASSED] X0L2 Normal sizes
[09:42:27] [PASSED] X0L2 Max sizes
[09:42:27] [PASSED] X0L2 Invalid pitch
[09:42:27] [PASSED] X0L2 Pitch greater than minimum required
[09:42:27] [PASSED] X0L2 Handle for inexistent plane
[09:42:27] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[09:42:27] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[09:42:27] [PASSED] X0L2 Valid modifier
[09:42:27] [PASSED] X0L2 Modifier for inexistent plane
[09:42:27] =========== [PASSED] drm_test_framebuffer_create ===========
[09:42:27] ================= [PASSED] drm_framebuffer =================
[09:42:27] =============== drm-test-managed (1 subtest) ===============
[09:42:27] [PASSED] drm_test_managed_run_action
[09:42:27] ================ [PASSED] drm-test-managed =================
[09:42:27] =================== drm_mm (19 subtests) ===================
[09:42:27] [PASSED] drm_test_mm_init
[09:42:28] [PASSED] drm_test_mm_debug
[09:42:37] [PASSED] drm_test_mm_reserve
[09:42:47] [PASSED] drm_test_mm_insert
[09:42:48] [PASSED] drm_test_mm_replace
[09:42:48] [PASSED] drm_test_mm_insert_range
[09:42:48] [PASSED] drm_test_mm_frag
[09:42:48] [PASSED] drm_test_mm_align
[09:42:48] [PASSED] drm_test_mm_align32
[09:42:48] [PASSED] drm_test_mm_align64
[09:42:49] [PASSED] drm_test_mm_evict
[09:42:49] [PASSED] drm_test_mm_evict_range
[09:42:49] [PASSED] drm_test_mm_topdown
[09:42:49] [PASSED] drm_test_mm_bottomup
[09:42:49] [PASSED] drm_test_mm_lowest
[09:42:49] [PASSED] drm_test_mm_highest
[09:42:49] [PASSED] drm_test_mm_color
[09:42:50] [PASSED] drm_test_mm_color_evict
[09:42:50] [PASSED] drm_test_mm_color_evict_range
[09:42:50] ===================== [PASSED] drm_mm ======================
[09:42:50] ============= drm_modes_analog_tv (4 subtests) =============
[09:42:50] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[09:42:50] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[09:42:50] [PASSED] drm_test_modes_analog_tv_pal_576i
[09:42:50] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
stty: 'standard input': Inappropriate ioctl for device
[09:42:50] =============== [PASSED] drm_modes_analog_tv ===============
[09:42:50] ============== drm_plane_helper (2 subtests) ===============
[09:42:50] ================ drm_test_check_plane_state ================
[09:42:50] [PASSED] clipping_simple
[09:42:50] [PASSED] clipping_rotate_reflect
[09:42:50] [PASSED] positioning_simple
[09:42:50] [PASSED] upscaling
[09:42:50] [PASSED] downscaling
[09:42:50] [PASSED] rounding1
[09:42:50] [PASSED] rounding2
[09:42:50] [PASSED] rounding3
[09:42:50] [PASSED] rounding4
[09:42:50] =========== [PASSED] drm_test_check_plane_state ============
[09:42:50] ============ drm_test_check_invalid_plane_state ============
[09:42:50] [PASSED] positioning_invalid
[09:42:50] [PASSED] upscaling_invalid
[09:42:50] [PASSED] downscaling_invalid
[09:42:50] ======= [PASSED] drm_test_check_invalid_plane_state ========
[09:42:50] ================ [PASSED] drm_plane_helper =================
[09:42:50] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[09:42:50] ======= drm_test_connector_helper_tv_get_modes_check =======
[09:42:50] [PASSED] None
[09:42:50] [PASSED] PAL
[09:42:50] [PASSED] NTSC
[09:42:50] [PASSED] Both, NTSC Default
[09:42:50] [PASSED] Both, PAL Default
[09:42:50] [PASSED] Both, NTSC Default, with PAL on command-line
[09:42:50] [PASSED] Both, PAL Default, with NTSC on command-line
[09:42:50] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[09:42:50] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[09:42:50] ================== drm_rect (4 subtests) ===================
[09:42:50] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[09:42:50] [PASSED] drm_test_rect_clip_scaled_not_clipped
[09:42:50] [PASSED] drm_test_rect_clip_scaled_clipped
[09:42:50] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[09:42:50] ==================== [PASSED] drm_rect =====================
[09:42:50] ============================================================
[09:42:50] Testing complete. Ran 270 tests: passed: 270
[09:42:50] Elapsed time: 42.907s total, 1.625s configuring, 18.452s building, 22.801s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


