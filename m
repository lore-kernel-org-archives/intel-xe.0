Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB8CC61DA4
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 00:34:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0636510E6A7;
	Tue, 14 Mar 2023 00:34:56 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9DCCD10E6A7;
 Tue, 14 Mar 2023 00:34:54 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 998F6A66C9;
 Tue, 14 Mar 2023 00:34:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 14 Mar 2023 00:34:54 -0000
Message-ID: <167875409462.26415.2411849629662936304@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230314003012.2600353-1-lucas.demarchi@intel.com>
In-Reply-To: <20230314003012.2600353-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_DG2_+_P?=
 =?utf-8?q?VC_+_ADL_workarounds_and_infra?=
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

Series: DG2 + PVC + ADL workarounds and infra
URL   : https://patchwork.freedesktop.org/series/115089/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[00:33:43] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:33:47] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[00:34:08] Starting KUnit Kernel (1/1)...
[00:34:08] ============================================================
[00:34:08] ==================== xe_bo (2 subtests) ====================
[00:34:08] [SKIPPED] xe_ccs_migrate_kunit
[00:34:08] [SKIPPED] xe_bo_evict_kunit
[00:34:08] ===================== [SKIPPED] xe_bo ======================
[00:34:08] ================== xe_dma_buf (1 subtest) ==================
[00:34:08] [SKIPPED] xe_dma_buf_kunit
[00:34:08] =================== [SKIPPED] xe_dma_buf ===================
[00:34:08] ================== xe_migrate (1 subtest) ==================
[00:34:08] [SKIPPED] xe_migrate_sanity_kunit
[00:34:08] =================== [SKIPPED] xe_migrate ===================
[00:34:08] ============================================================
[00:34:08] Testing complete. Ran 4 tests: skipped: 4
[00:34:08] Elapsed time: 25.620s total, 4.146s configuring, 21.305s building, 0.143s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[00:34:08] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:34:10] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[00:34:29] Starting KUnit Kernel (1/1)...
[00:34:29] ============================================================
[00:34:29] ============ drm_test_pick_cmdline (2 subtests) ============
[00:34:29] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[00:34:29] =============== drm_test_pick_cmdline_named ================
[00:34:29] [PASSED] NTSC
[00:34:29] [PASSED] NTSC-J
[00:34:29] [PASSED] PAL
[00:34:29] [PASSED] PAL-M
[00:34:29] =========== [PASSED] drm_test_pick_cmdline_named ===========
[00:34:29] ============== [PASSED] drm_test_pick_cmdline ==============
[00:34:29] ================== drm_buddy (6 subtests) ==================
[00:34:29] [PASSED] drm_test_buddy_alloc_limit
[00:34:29] [PASSED] drm_test_buddy_alloc_range
[00:34:29] [PASSED] drm_test_buddy_alloc_optimistic
[00:34:29] [PASSED] drm_test_buddy_alloc_pessimistic
[00:34:29] [PASSED] drm_test_buddy_alloc_smoke
[00:34:29] [PASSED] drm_test_buddy_alloc_pathological
[00:34:29] ==================== [PASSED] drm_buddy ====================
[00:34:29] ============= drm_cmdline_parser (40 subtests) =============
[00:34:29] [PASSED] drm_test_cmdline_force_d_only
[00:34:29] [PASSED] drm_test_cmdline_force_D_only_dvi
[00:34:29] [PASSED] drm_test_cmdline_force_D_only_hdmi
[00:34:29] [PASSED] drm_test_cmdline_force_D_only_not_digital
[00:34:29] [PASSED] drm_test_cmdline_force_e_only
[00:34:29] [PASSED] drm_test_cmdline_res
[00:34:29] [PASSED] drm_test_cmdline_res_vesa
[00:34:29] [PASSED] drm_test_cmdline_res_vesa_rblank
[00:34:29] [PASSED] drm_test_cmdline_res_rblank
[00:34:29] [PASSED] drm_test_cmdline_res_bpp
[00:34:29] [PASSED] drm_test_cmdline_res_refresh
[00:34:29] [PASSED] drm_test_cmdline_res_bpp_refresh
[00:34:29] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[00:34:29] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[00:34:29] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[00:34:29] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[00:34:29] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[00:34:29] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[00:34:29] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[00:34:29] [PASSED] drm_test_cmdline_res_margins_force_on
[00:34:29] [PASSED] drm_test_cmdline_res_vesa_margins
[00:34:29] [PASSED] drm_test_cmdline_name
[00:34:29] [PASSED] drm_test_cmdline_name_bpp
[00:34:29] [PASSED] drm_test_cmdline_name_option
[00:34:29] [PASSED] drm_test_cmdline_name_bpp_option
[00:34:29] [PASSED] drm_test_cmdline_rotate_0
[00:34:29] [PASSED] drm_test_cmdline_rotate_90
[00:34:29] [PASSED] drm_test_cmdline_rotate_180
[00:34:29] [PASSED] drm_test_cmdline_rotate_270
[00:34:29] [PASSED] drm_test_cmdline_hmirror
[00:34:29] [PASSED] drm_test_cmdline_vmirror
[00:34:29] [PASSED] drm_test_cmdline_margin_options
[00:34:29] [PASSED] drm_test_cmdline_multiple_options
[00:34:29] [PASSED] drm_test_cmdline_bpp_extra_and_option
[00:34:29] [PASSED] drm_test_cmdline_extra_and_option
[00:34:29] [PASSED] drm_test_cmdline_freestanding_options
[00:34:29] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[00:34:29] [PASSED] drm_test_cmdline_panel_orientation
[00:34:29] ================= drm_test_cmdline_invalid =================
[00:34:29] [PASSED] margin_only
[00:34:29] [PASSED] interlace_only
[00:34:29] [PASSED] res_missing_x
[00:34:29] [PASSED] res_missing_y
[00:34:29] [PASSED] res_bad_y
[00:34:29] [PASSED] res_missing_y_bpp
[00:34:29] [PASSED] res_bad_bpp
[00:34:29] [PASSED] res_bad_refresh
[00:34:29] [PASSED] res_bpp_refresh_force_on_off
[00:34:29] [PASSED] res_invalid_mode
[00:34:29] [PASSED] res_bpp_wrong_place_mode
[00:34:29] [PASSED] name_bpp_refresh
[00:34:29] [PASSED] name_refresh
[00:34:29] [PASSED] name_refresh_wrong_mode
[00:34:29] [PASSED] name_refresh_invalid_mode
[00:34:29] [PASSED] rotate_multiple
[00:34:29] [PASSED] rotate_invalid_val
[00:34:29] [PASSED] rotate_truncated
[00:34:29] [PASSED] invalid_option
[00:34:29] [PASSED] invalid_tv_option
[00:34:29] [PASSED] truncated_tv_option
[00:34:29] ============ [PASSED] drm_test_cmdline_invalid =============
[00:34:29] =============== drm_test_cmdline_tv_options ================
[00:34:29] [PASSED] NTSC
[00:34:29] [PASSED] NTSC_443
[00:34:29] [PASSED] NTSC_J
[00:34:29] [PASSED] PAL
[00:34:29] [PASSED] PAL_M
[00:34:29] [PASSED] PAL_N
[00:34:29] [PASSED] SECAM
[00:34:29] =========== [PASSED] drm_test_cmdline_tv_options ===========
[00:34:29] =============== [PASSED] drm_cmdline_parser ================
[00:34:29] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[00:34:29] =========== drm_test_get_tv_mode_from_name_valid ===========
[00:34:29] [PASSED] NTSC
[00:34:29] [PASSED] NTSC-443
[00:34:29] [PASSED] NTSC-J
[00:34:29] [PASSED] PAL
[00:34:29] [PASSED] PAL-M
[00:34:29] [PASSED] PAL-N
[00:34:29] [PASSED] SECAM
[00:34:29] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[00:34:29] [PASSED] drm_test_get_tv_mode_from_name_truncated
[00:34:29] ============ [PASSED] drm_get_tv_mode_from_name ============
[00:34:29] ============= drm_damage_helper (21 subtests) ==============
[00:34:29] [PASSED] drm_test_damage_iter_no_damage
[00:34:29] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[00:34:29] [PASSED] drm_test_damage_iter_no_damage_src_moved
[00:34:29] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[00:34:29] [PASSED] drm_test_damage_iter_no_damage_not_visible
[00:34:29] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[00:34:29] [PASSED] drm_test_damage_iter_no_damage_no_fb
[00:34:29] [PASSED] drm_test_damage_iter_simple_damage
[00:34:29] [PASSED] drm_test_damage_iter_single_damage
[00:34:29] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[00:34:29] [PASSED] drm_test_damage_iter_single_damage_outside_src
[00:34:29] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[00:34:29] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[00:34:29] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[00:34:29] [PASSED] drm_test_damage_iter_single_damage_src_moved
[00:34:29] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[00:34:29] [PASSED] drm_test_damage_iter_damage
[00:34:29] [PASSED] drm_test_damage_iter_damage_one_intersect
[00:34:29] [PASSED] drm_test_damage_iter_damage_one_outside
[00:34:29] [PASSED] drm_test_damage_iter_damage_src_moved
[00:34:29] [PASSED] drm_test_damage_iter_damage_not_visible
[00:34:29] ================ [PASSED] drm_damage_helper ================
[00:34:29] ============== drm_dp_mst_helper (2 subtests) ==============
[00:34:29] ============== drm_test_dp_mst_calc_pbn_mode ===============
[00:34:29] [PASSED] Clock 154000 BPP 30 DSC disabled
[00:34:29] [PASSED] Clock 234000 BPP 30 DSC disabled
[00:34:29] [PASSED] Clock 297000 BPP 24 DSC disabled
[00:34:29] [PASSED] Clock 332880 BPP 24 DSC enabled
[00:34:29] [PASSED] Clock 324540 BPP 24 DSC enabled
[00:34:29] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[00:34:29] ========= drm_test_dp_mst_sideband_msg_req_decode ==========
[00:34:29] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[00:34:29] [PASSED] DP_POWER_UP_PHY with port number
[00:34:29] [PASSED] DP_POWER_DOWN_PHY with port number
[00:34:29] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[00:34:29] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[00:34:29] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[00:34:29] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[00:34:29] [PASSED] DP_QUERY_PAYLOAD with port number
[00:34:29] [PASSED] DP_QUERY_PAYLOAD with VCPI
[00:34:29] [PASSED] DP_REMOTE_DPCD_READ with port number
[00:34:29] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[00:34:29] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[00:34:29] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[00:34:29] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[00:34:29] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[00:34:29] [PASSED] DP_REMOTE_I2C_READ with port number
[00:34:29] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[00:34:29] [PASSED] DP_REMOTE_I2C_READ with transactions array
[00:34:29] [PASSED] DP_REMOTE_I2C_WRITE with port number
[00:34:29] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[00:34:29] [PASSED] DP_REMOTE_I2C_WRITE with data array
[00:34:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[00:34:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[00:34:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[00:34:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[00:34:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[00:34:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[00:34:29] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[00:34:29] ================ [PASSED] drm_dp_mst_helper ================
[00:34:29] =========== drm_format_helper_test (5 subtests) ============
[00:34:29] ============== drm_test_fb_xrgb8888_to_gray8 ===============
[00:34:29] [PASSED] single_pixel_source_buffer
[00:34:29] [PASSED] single_pixel_clip_rectangle
[00:34:29] [PASSED] well_known_colors
[00:34:29] [PASSED] destination_pitch
[00:34:29] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[00:34:29] ============== drm_test_fb_xrgb8888_to_rgb332 ==============
[00:34:29] [PASSED] single_pixel_source_buffer
[00:34:29] [PASSED] single_pixel_clip_rectangle
[00:34:29] [PASSED] well_known_colors
[00:34:29] [PASSED] destination_pitch
[00:34:29] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[00:34:29] ============== drm_test_fb_xrgb8888_to_rgb565 ==============
[00:34:29] [PASSED] single_pixel_source_buffer
[00:34:29] [PASSED] single_pixel_clip_rectangle
[00:34:29] [PASSED] well_known_colors
[00:34:29] [PASSED] destination_pitch
[00:34:29] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[00:34:29] ============== drm_test_fb_xrgb8888_to_rgb888 ==============
[00:34:29] [PASSED] single_pixel_source_buffer
[00:34:29] [PASSED] single_pixel_clip_rectangle
[00:34:29] [PASSED] well_known_colors
[00:34:29] [PASSED] destination_pitch
[00:34:29] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[00:34:29] =========== drm_test_fb_xrgb8888_to_xrgb2101010 ============
[00:34:29] [PASSED] single_pixel_source_buffer
[00:34:29] [PASSED] single_pixel_clip_rectangle
[00:34:29] [PASSED] well_known_colors
[00:34:29] [PASSED] destination_pitch
[00:34:29] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[00:34:29] ============= [PASSED] drm_format_helper_test ==============
[00:34:29] ================= drm_format (18 subtests) =================
[00:34:29] [PASSED] drm_test_format_block_width_invalid
[00:34:29] [PASSED] drm_test_format_block_width_one_plane
[00:34:29] [PASSED] drm_test_format_block_width_two_plane
[00:34:29] [PASSED] drm_test_format_block_width_three_plane
[00:34:29] [PASSED] drm_test_format_block_width_tiled
[00:34:29] [PASSED] drm_test_format_block_height_invalid
[00:34:29] [PASSED] drm_test_format_block_height_one_plane
[00:34:29] [PASSED] drm_test_format_block_height_two_plane
[00:34:29] [PASSED] drm_test_format_block_height_three_plane
[00:34:29] [PASSED] drm_test_format_block_height_tiled
[00:34:29] [PASSED] drm_test_format_min_pitch_invalid
[00:34:29] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[00:34:29] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[00:34:29] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[00:34:29] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[00:34:29] [PASSED] drm_test_format_min_pitch_two_plane
[00:34:29] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[00:34:29] [PASSED] drm_test_format_min_pitch_tiled
[00:34:29] =================== [PASSED] drm_format ====================
[00:34:29] =============== drm_framebuffer (1 subtest) ================
[00:34:29] =============== drm_test_framebuffer_create ================
[00:34:29] [PASSED] ABGR8888 normal sizes
[00:34:29] [PASSED] ABGR8888 max sizes
[00:34:29] [PASSED] ABGR8888 pitch greater than min required
[00:34:29] [PASSED] ABGR8888 pitch less than min required
[00:34:29] [PASSED] ABGR8888 Invalid width
[00:34:29] [PASSED] ABGR8888 Invalid buffer handle
[00:34:29] [PASSED] No pixel format
[00:34:29] [PASSED] ABGR8888 Width 0
[00:34:29] [PASSED] ABGR8888 Height 0
[00:34:29] [PASSED] ABGR8888 Out of bound height * pitch combination
[00:34:29] [PASSED] ABGR8888 Large buffer offset
[00:34:29] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[00:34:29] [PASSED] ABGR8888 Valid buffer modifier
[00:34:29] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[00:34:29] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[00:34:29] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[00:34:29] [PASSED] NV12 Normal sizes
[00:34:29] [PASSED] NV12 Max sizes
[00:34:29] [PASSED] NV12 Invalid pitch
[00:34:29] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[00:34:29] [PASSED] NV12 different  modifier per-plane
[00:34:29] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[00:34:29] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[00:34:29] [PASSED] NV12 Modifier for inexistent plane
[00:34:29] [PASSED] NV12 Handle for inexistent plane
[00:34:29] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[00:34:29] [PASSED] YVU420 Normal sizes
[00:34:29] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[00:34:29] [PASSED] YVU420 Max sizes
[00:34:29] [PASSED] YVU420 Invalid pitch
[00:34:29] [PASSED] YVU420 Different pitches
[00:34:29] [PASSED] YVU420 Different buffer offsets/pitches
[00:34:29] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[00:34:29] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[00:34:29] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[00:34:29] [PASSED] YVU420 Valid modifier
[00:34:29] [PASSED] YVU420 Different modifiers per plane
[00:34:29] [PASSED] YVU420 Modifier for inexistent plane
[00:34:29] [PASSED] X0L2 Normal sizes
[00:34:29] [PASSED] X0L2 Max sizes
[00:34:29] [PASSED] X0L2 Invalid pitch
[00:34:29] [PASSED] X0L2 Pitch greater than minimum required
[00:34:29] [PASSED] X0L2 Handle for inexistent plane
[00:34:29] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[00:34:29] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[00:34:29] [PASSED] X0L2 Valid modifier
[00:34:29] [PASSED] X0L2 Modifier for inexistent plane
[00:34:29] =========== [PASSED] drm_test_framebuffer_create ===========
[00:34:29] ================= [PASSED] drm_framebuffer =================
[00:34:29] =============== drm-test-managed (1 subtest) ===============
[00:34:29] [PASSED] drm_test_managed_run_action
[00:34:29] ================ [PASSED] drm-test-managed =================
[00:34:29] =================== drm_mm (19 subtests) ===================
[00:34:29] [PASSED] drm_test_mm_init
[00:34:29] [PASSED] drm_test_mm_debug
[00:34:39] [PASSED] drm_test_mm_reserve
[00:34:48] [PASSED] drm_test_mm_insert
[00:34:49] [PASSED] drm_test_mm_replace
[00:34:49] [PASSED] drm_test_mm_insert_range
[00:34:49] [PASSED] drm_test_mm_frag
[00:34:49] [PASSED] drm_test_mm_align
[00:34:49] [PASSED] drm_test_mm_align32
[00:34:49] [PASSED] drm_test_mm_align64
[00:34:50] [PASSED] drm_test_mm_evict
[00:34:50] [PASSED] drm_test_mm_evict_range
[00:34:50] [PASSED] drm_test_mm_topdown
[00:34:50] [PASSED] drm_test_mm_bottomup
[00:34:50] [PASSED] drm_test_mm_lowest
[00:34:50] [PASSED] drm_test_mm_highest
[00:34:50] [PASSED] drm_test_mm_color
[00:34:51] [PASSED] drm_test_mm_color_evict
[00:34:51] [PASSED] drm_test_mm_color_evict_range
[00:34:51] ===================== [PASSED] drm_mm ======================
[00:34:51] ============= drm_modes_analog_tv (4 subtests) =============
[00:34:51] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[00:34:51] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[00:34:51] [PASSED] drm_test_modes_analog_tv_pal_576i
[00:34:51] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
stty: 'standard input': Inappropriate ioctl for device
[00:34:51] =============== [PASSED] drm_modes_analog_tv ===============
[00:34:51] ============== drm_plane_helper (2 subtests) ===============
[00:34:51] ================ drm_test_check_plane_state ================
[00:34:51] [PASSED] clipping_simple
[00:34:51] [PASSED] clipping_rotate_reflect
[00:34:51] [PASSED] positioning_simple
[00:34:51] [PASSED] upscaling
[00:34:51] [PASSED] downscaling
[00:34:51] [PASSED] rounding1
[00:34:51] [PASSED] rounding2
[00:34:51] [PASSED] rounding3
[00:34:51] [PASSED] rounding4
[00:34:51] =========== [PASSED] drm_test_check_plane_state ============
[00:34:51] ============ drm_test_check_invalid_plane_state ============
[00:34:51] [PASSED] positioning_invalid
[00:34:51] [PASSED] upscaling_invalid
[00:34:51] [PASSED] downscaling_invalid
[00:34:51] ======= [PASSED] drm_test_check_invalid_plane_state ========
[00:34:51] ================ [PASSED] drm_plane_helper =================
[00:34:51] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[00:34:51] ======= drm_test_connector_helper_tv_get_modes_check =======
[00:34:51] [PASSED] None
[00:34:51] [PASSED] PAL
[00:34:51] [PASSED] NTSC
[00:34:51] [PASSED] Both, NTSC Default
[00:34:51] [PASSED] Both, PAL Default
[00:34:51] [PASSED] Both, NTSC Default, with PAL on command-line
[00:34:51] [PASSED] Both, PAL Default, with NTSC on command-line
[00:34:51] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[00:34:51] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[00:34:51] ================== drm_rect (4 subtests) ===================
[00:34:51] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[00:34:51] [PASSED] drm_test_rect_clip_scaled_not_clipped
[00:34:51] [PASSED] drm_test_rect_clip_scaled_clipped
[00:34:51] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[00:34:51] ==================== [PASSED] drm_rect =====================
[00:34:51] ============================================================
[00:34:51] Testing complete. Ran 270 tests: passed: 270
[00:34:51] Elapsed time: 42.755s total, 1.637s configuring, 18.590s building, 22.516s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


