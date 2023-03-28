Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AD5C6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 16:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8C210E082;
	Tue, 28 Mar 2023 16:17:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7DB9F10E082;
 Tue, 28 Mar 2023 16:17:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 79A6CA7DFF;
 Tue, 28 Mar 2023 16:17:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Tue, 28 Mar 2023 16:17:46 -0000
Message-ID: <168002026649.29055.17667867716952040077@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230328161021.669017-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230328161021.669017-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Start_k?=
 =?utf-8?q?illing_xe=5Fmacros=2E?=
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

Series: Start killing xe_macros.
URL   : https://patchwork.freedesktop.org/series/115740/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[16:16:35] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:16:39] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[16:17:00] Starting KUnit Kernel (1/1)...
[16:17:00] ============================================================
[16:17:00] ==================== xe_bo (2 subtests) ====================
[16:17:00] [SKIPPED] xe_ccs_migrate_kunit
[16:17:00] [SKIPPED] xe_bo_evict_kunit
[16:17:00] ===================== [SKIPPED] xe_bo ======================
[16:17:00] ================== xe_dma_buf (1 subtest) ==================
[16:17:00] [SKIPPED] xe_dma_buf_kunit
[16:17:00] =================== [SKIPPED] xe_dma_buf ===================
[16:17:00] ================== xe_migrate (1 subtest) ==================
[16:17:00] [SKIPPED] xe_migrate_sanity_kunit
[16:17:00] =================== [SKIPPED] xe_migrate ===================
[16:17:00] ============================================================
[16:17:00] Testing complete. Ran 4 tests: skipped: 4
[16:17:00] Elapsed time: 25.875s total, 4.187s configuring, 21.569s building, 0.091s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[16:17:01] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:17:02] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[16:17:20] Starting KUnit Kernel (1/1)...
[16:17:20] ============================================================
[16:17:20] ============ drm_test_pick_cmdline (2 subtests) ============
[16:17:20] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[16:17:20] =============== drm_test_pick_cmdline_named  ===============
[16:17:20] [PASSED] NTSC
[16:17:20] [PASSED] NTSC-J
[16:17:20] [PASSED] PAL
[16:17:20] [PASSED] PAL-M
[16:17:20] =========== [PASSED] drm_test_pick_cmdline_named ===========
[16:17:20] ============== [PASSED] drm_test_pick_cmdline ==============
[16:17:20] ================== drm_buddy (6 subtests) ==================
[16:17:20] [PASSED] drm_test_buddy_alloc_limit
[16:17:20] [PASSED] drm_test_buddy_alloc_range
[16:17:20] [PASSED] drm_test_buddy_alloc_optimistic
[16:17:20] [PASSED] drm_test_buddy_alloc_pessimistic
[16:17:20] [PASSED] drm_test_buddy_alloc_smoke
[16:17:20] [PASSED] drm_test_buddy_alloc_pathological
[16:17:20] ==================== [PASSED] drm_buddy ====================
[16:17:20] ============= drm_cmdline_parser (40 subtests) =============
[16:17:20] [PASSED] drm_test_cmdline_force_d_only
[16:17:20] [PASSED] drm_test_cmdline_force_D_only_dvi
[16:17:20] [PASSED] drm_test_cmdline_force_D_only_hdmi
[16:17:20] [PASSED] drm_test_cmdline_force_D_only_not_digital
[16:17:20] [PASSED] drm_test_cmdline_force_e_only
[16:17:20] [PASSED] drm_test_cmdline_res
[16:17:20] [PASSED] drm_test_cmdline_res_vesa
[16:17:20] [PASSED] drm_test_cmdline_res_vesa_rblank
[16:17:20] [PASSED] drm_test_cmdline_res_rblank
[16:17:20] [PASSED] drm_test_cmdline_res_bpp
[16:17:20] [PASSED] drm_test_cmdline_res_refresh
[16:17:20] [PASSED] drm_test_cmdline_res_bpp_refresh
[16:17:20] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[16:17:20] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[16:17:20] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[16:17:20] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[16:17:20] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[16:17:20] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[16:17:20] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[16:17:20] [PASSED] drm_test_cmdline_res_margins_force_on
[16:17:20] [PASSED] drm_test_cmdline_res_vesa_margins
[16:17:20] [PASSED] drm_test_cmdline_name
[16:17:20] [PASSED] drm_test_cmdline_name_bpp
[16:17:20] [PASSED] drm_test_cmdline_name_option
[16:17:20] [PASSED] drm_test_cmdline_name_bpp_option
[16:17:20] [PASSED] drm_test_cmdline_rotate_0
[16:17:20] [PASSED] drm_test_cmdline_rotate_90
[16:17:20] [PASSED] drm_test_cmdline_rotate_180
[16:17:20] [PASSED] drm_test_cmdline_rotate_270
[16:17:20] [PASSED] drm_test_cmdline_hmirror
[16:17:20] [PASSED] drm_test_cmdline_vmirror
[16:17:20] [PASSED] drm_test_cmdline_margin_options
[16:17:20] [PASSED] drm_test_cmdline_multiple_options
[16:17:20] [PASSED] drm_test_cmdline_bpp_extra_and_option
[16:17:20] [PASSED] drm_test_cmdline_extra_and_option
[16:17:20] [PASSED] drm_test_cmdline_freestanding_options
[16:17:20] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[16:17:20] [PASSED] drm_test_cmdline_panel_orientation
[16:17:20] ================ drm_test_cmdline_invalid  =================
[16:17:20] [PASSED] margin_only
[16:17:20] [PASSED] interlace_only
[16:17:20] [PASSED] res_missing_x
[16:17:20] [PASSED] res_missing_y
[16:17:20] [PASSED] res_bad_y
[16:17:20] [PASSED] res_missing_y_bpp
[16:17:20] [PASSED] res_bad_bpp
[16:17:20] [PASSED] res_bad_refresh
[16:17:20] [PASSED] res_bpp_refresh_force_on_off
[16:17:20] [PASSED] res_invalid_mode
[16:17:20] [PASSED] res_bpp_wrong_place_mode
[16:17:20] [PASSED] name_bpp_refresh
[16:17:20] [PASSED] name_refresh
[16:17:20] [PASSED] name_refresh_wrong_mode
[16:17:20] [PASSED] name_refresh_invalid_mode
[16:17:20] [PASSED] rotate_multiple
[16:17:20] [PASSED] rotate_invalid_val
[16:17:20] [PASSED] rotate_truncated
[16:17:20] [PASSED] invalid_option
[16:17:20] [PASSED] invalid_tv_option
[16:17:20] [PASSED] truncated_tv_option
[16:17:20] ============ [PASSED] drm_test_cmdline_invalid =============
[16:17:20] =============== drm_test_cmdline_tv_options  ===============
[16:17:20] [PASSED] NTSC
[16:17:20] [PASSED] NTSC_443
[16:17:20] [PASSED] NTSC_J
[16:17:20] [PASSED] PAL
[16:17:20] [PASSED] PAL_M
[16:17:20] [PASSED] PAL_N
[16:17:20] [PASSED] SECAM
[16:17:20] =========== [PASSED] drm_test_cmdline_tv_options ===========
[16:17:20] =============== [PASSED] drm_cmdline_parser ================
[16:17:20] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[16:17:20] ========== drm_test_get_tv_mode_from_name_valid  ===========
[16:17:20] [PASSED] NTSC
[16:17:20] [PASSED] NTSC-443
[16:17:20] [PASSED] NTSC-J
[16:17:20] [PASSED] PAL
[16:17:20] [PASSED] PAL-M
[16:17:20] [PASSED] PAL-N
[16:17:20] [PASSED] SECAM
[16:17:20] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[16:17:20] [PASSED] drm_test_get_tv_mode_from_name_truncated
[16:17:20] ============ [PASSED] drm_get_tv_mode_from_name ============
[16:17:20] ============= drm_damage_helper (21 subtests) ==============
[16:17:20] [PASSED] drm_test_damage_iter_no_damage
[16:17:20] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[16:17:20] [PASSED] drm_test_damage_iter_no_damage_src_moved
[16:17:20] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[16:17:20] [PASSED] drm_test_damage_iter_no_damage_not_visible
[16:17:20] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[16:17:20] [PASSED] drm_test_damage_iter_no_damage_no_fb
[16:17:20] [PASSED] drm_test_damage_iter_simple_damage
[16:17:20] [PASSED] drm_test_damage_iter_single_damage
[16:17:20] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[16:17:20] [PASSED] drm_test_damage_iter_single_damage_outside_src
[16:17:20] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[16:17:20] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[16:17:20] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[16:17:20] [PASSED] drm_test_damage_iter_single_damage_src_moved
[16:17:20] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[16:17:20] [PASSED] drm_test_damage_iter_damage
[16:17:20] [PASSED] drm_test_damage_iter_damage_one_intersect
[16:17:20] [PASSED] drm_test_damage_iter_damage_one_outside
[16:17:20] [PASSED] drm_test_damage_iter_damage_src_moved
[16:17:20] [PASSED] drm_test_damage_iter_damage_not_visible
[16:17:20] ================ [PASSED] drm_damage_helper ================
[16:17:20] ============== drm_dp_mst_helper (2 subtests) ==============
[16:17:20] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[16:17:20] [PASSED] Clock 154000 BPP 30 DSC disabled
[16:17:20] [PASSED] Clock 234000 BPP 30 DSC disabled
[16:17:20] [PASSED] Clock 297000 BPP 24 DSC disabled
[16:17:20] [PASSED] Clock 332880 BPP 24 DSC enabled
[16:17:20] [PASSED] Clock 324540 BPP 24 DSC enabled
[16:17:20] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[16:17:20] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[16:17:20] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[16:17:20] [PASSED] DP_POWER_UP_PHY with port number
[16:17:20] [PASSED] DP_POWER_DOWN_PHY with port number
[16:17:20] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[16:17:20] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[16:17:20] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[16:17:20] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[16:17:20] [PASSED] DP_QUERY_PAYLOAD with port number
[16:17:20] [PASSED] DP_QUERY_PAYLOAD with VCPI
[16:17:20] [PASSED] DP_REMOTE_DPCD_READ with port number
[16:17:20] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[16:17:20] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[16:17:20] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[16:17:20] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[16:17:20] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[16:17:20] [PASSED] DP_REMOTE_I2C_READ with port number
[16:17:20] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[16:17:20] [PASSED] DP_REMOTE_I2C_READ with transactions array
[16:17:20] [PASSED] DP_REMOTE_I2C_WRITE with port number
[16:17:20] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[16:17:20] [PASSED] DP_REMOTE_I2C_WRITE with data array
[16:17:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[16:17:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[16:17:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[16:17:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[16:17:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[16:17:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[16:17:20] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[16:17:20] ================ [PASSED] drm_dp_mst_helper ================
[16:17:20] =========== drm_format_helper_test (10 subtests) ===========
[16:17:20] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[16:17:20] [PASSED] single_pixel_source_buffer
[16:17:20] [PASSED] single_pixel_clip_rectangle
[16:17:20] [PASSED] well_known_colors
[16:17:20] [PASSED] destination_pitch
[16:17:20] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[16:17:20] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[16:17:20] [PASSED] single_pixel_source_buffer
[16:17:20] [PASSED] single_pixel_clip_rectangle
[16:17:20] [PASSED] well_known_colors
[16:17:20] [PASSED] destination_pitch
[16:17:20] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[16:17:20] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[16:17:20] [PASSED] single_pixel_source_buffer
[16:17:20] [PASSED] single_pixel_clip_rectangle
[16:17:20] [PASSED] well_known_colors
[16:17:20] [PASSED] destination_pitch
[16:17:20] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[16:17:20] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[16:17:20] [PASSED] single_pixel_source_buffer
[16:17:20] [PASSED] single_pixel_clip_rectangle
[16:17:20] [PASSED] well_known_colors
[16:17:20] [PASSED] destination_pitch
[16:17:20] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[16:17:20] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[16:17:20] [PASSED] single_pixel_source_buffer
[16:17:20] [PASSED] single_pixel_clip_rectangle
[16:17:20] [PASSED] well_known_colors
[16:17:20] [PASSED] destination_pitch
[16:17:20] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[16:17:20] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[16:17:20] [PASSED] single_pixel_source_buffer
[16:17:20] [PASSED] single_pixel_clip_rectangle
[16:17:20] [PASSED] well_known_colors
[16:17:20] [PASSED] destination_pitch
[16:17:20] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[16:17:20] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[16:17:20] [PASSED] single_pixel_source_buffer
[16:17:20] [PASSED] single_pixel_clip_rectangle
[16:17:20] [PASSED] well_known_colors
[16:17:20] [PASSED] destination_pitch
[16:17:20] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[16:17:20] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[16:17:20] [PASSED] single_pixel_source_buffer
[16:17:20] [PASSED] single_pixel_clip_rectangle
[16:17:20] [PASSED] well_known_colors
[16:17:20] [PASSED] destination_pitch
[16:17:20] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[16:17:20] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[16:17:20] [PASSED] single_pixel_source_buffer
[16:17:20] [PASSED] single_pixel_clip_rectangle
[16:17:20] [PASSED] well_known_colors
[16:17:20] [PASSED] destination_pitch
[16:17:20] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[16:17:20] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[16:17:20] [PASSED] single_pixel_source_buffer
[16:17:20] [PASSED] single_pixel_clip_rectangle
[16:17:20] [PASSED] well_known_colors
[16:17:20] [PASSED] destination_pitch
[16:17:20] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[16:17:20] ============= [PASSED] drm_format_helper_test ==============
[16:17:20] ================= drm_format (18 subtests) =================
[16:17:20] [PASSED] drm_test_format_block_width_invalid
[16:17:20] [PASSED] drm_test_format_block_width_one_plane
[16:17:20] [PASSED] drm_test_format_block_width_two_plane
[16:17:20] [PASSED] drm_test_format_block_width_three_plane
[16:17:20] [PASSED] drm_test_format_block_width_tiled
[16:17:20] [PASSED] drm_test_format_block_height_invalid
[16:17:20] [PASSED] drm_test_format_block_height_one_plane
[16:17:20] [PASSED] drm_test_format_block_height_two_plane
[16:17:20] [PASSED] drm_test_format_block_height_three_plane
[16:17:20] [PASSED] drm_test_format_block_height_tiled
[16:17:20] [PASSED] drm_test_format_min_pitch_invalid
[16:17:20] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[16:17:20] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[16:17:20] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[16:17:20] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[16:17:20] [PASSED] drm_test_format_min_pitch_two_plane
[16:17:20] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[16:17:20] [PASSED] drm_test_format_min_pitch_tiled
[16:17:20] =================== [PASSED] drm_format ====================
[16:17:20] =============== drm_framebuffer (1 subtest) ================
[16:17:20] =============== drm_test_framebuffer_create  ===============
[16:17:20] [PASSED] ABGR8888 normal sizes
[16:17:20] [PASSED] ABGR8888 max sizes
[16:17:20] [PASSED] ABGR8888 pitch greater than min required
[16:17:20] [PASSED] ABGR8888 pitch less than min required
[16:17:20] [PASSED] ABGR8888 Invalid width
[16:17:20] [PASSED] ABGR8888 Invalid buffer handle
[16:17:20] [PASSED] No pixel format
[16:17:20] [PASSED] ABGR8888 Width 0
[16:17:20] [PASSED] ABGR8888 Height 0
[16:17:20] [PASSED] ABGR8888 Out of bound height * pitch combination
[16:17:20] [PASSED] ABGR8888 Large buffer offset
[16:17:20] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[16:17:20] [PASSED] ABGR8888 Valid buffer modifier
[16:17:20] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[16:17:20] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[16:17:20] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[16:17:20] [PASSED] NV12 Normal sizes
[16:17:20] [PASSED] NV12 Max sizes
[16:17:20] [PASSED] NV12 Invalid pitch
[16:17:20] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[16:17:20] [PASSED] NV12 different  modifier per-plane
[16:17:20] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[16:17:20] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[16:17:20] [PASSED] NV12 Modifier for inexistent plane
[16:17:20] [PASSED] NV12 Handle for inexistent plane
[16:17:20] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[16:17:20] [PASSED] YVU420 Normal sizes
[16:17:20] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[16:17:20] [PASSED] YVU420 Max sizes
[16:17:20] [PASSED] YVU420 Invalid pitch
[16:17:20] [PASSED] YVU420 Different pitches
[16:17:20] [PASSED] YVU420 Different buffer offsets/pitches
[16:17:20] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[16:17:20] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[16:17:20] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[16:17:20] [PASSED] YVU420 Valid modifier
[16:17:20] [PASSED] YVU420 Different modifiers per plane
[16:17:20] [PASSED] YVU420 Modifier for inexistent plane
[16:17:20] [PASSED] X0L2 Normal sizes
[16:17:20] [PASSED] X0L2 Max sizes
[16:17:20] [PASSED] X0L2 Invalid pitch
[16:17:20] [PASSED] X0L2 Pitch greater than minimum required
[16:17:20] [PASSED] X0L2 Handle for inexistent plane
[16:17:20] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[16:17:20] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[16:17:20] [PASSED] X0L2 Valid modifier
[16:17:20] [PASSED] X0L2 Modifier for inexistent plane
stty: 'standard input': Inappropriate ioctl for device
[16:17:20] =========== [PASSED] drm_test_framebuffer_create ===========
[16:17:20] ================= [PASSED] drm_framebuffer =================
[16:17:20] =============== drm-test-managed (1 subtest) ===============
[16:17:20] [PASSED] drm_test_managed_run_action
[16:17:20] ================ [PASSED] drm-test-managed =================
[16:17:20] =================== drm_mm (19 subtests) ===================
[16:17:20] [PASSED] drm_test_mm_init
[16:17:21] [PASSED] drm_test_mm_debug
[16:17:30] [PASSED] drm_test_mm_reserve
[16:17:40] [PASSED] drm_test_mm_insert
[16:17:41] [PASSED] drm_test_mm_replace
[16:17:41] [PASSED] drm_test_mm_insert_range
[16:17:41] [PASSED] drm_test_mm_frag
[16:17:41] [PASSED] drm_test_mm_align
[16:17:41] [PASSED] drm_test_mm_align32
[16:17:42] [PASSED] drm_test_mm_align64
[16:17:42] [PASSED] drm_test_mm_evict
[16:17:42] [PASSED] drm_test_mm_evict_range
[16:17:42] [PASSED] drm_test_mm_topdown
[16:17:42] [PASSED] drm_test_mm_bottomup
[16:17:42] [PASSED] drm_test_mm_lowest
[16:17:42] [PASSED] drm_test_mm_highest
[16:17:43] [PASSED] drm_test_mm_color
[16:17:43] [PASSED] drm_test_mm_color_evict
[16:17:43] [PASSED] drm_test_mm_color_evict_range
[16:17:43] ===================== [PASSED] drm_mm ======================
[16:17:43] ============= drm_modes_analog_tv (4 subtests) =============
[16:17:43] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[16:17:43] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[16:17:43] [PASSED] drm_test_modes_analog_tv_pal_576i
[16:17:43] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[16:17:43] =============== [PASSED] drm_modes_analog_tv ===============
[16:17:43] ============== drm_plane_helper (2 subtests) ===============
[16:17:43] =============== drm_test_check_plane_state  ================
[16:17:43] [PASSED] clipping_simple
[16:17:43] [PASSED] clipping_rotate_reflect
[16:17:43] [PASSED] positioning_simple
[16:17:43] [PASSED] upscaling
[16:17:43] [PASSED] downscaling
[16:17:43] [PASSED] rounding1
[16:17:43] [PASSED] rounding2
[16:17:43] [PASSED] rounding3
[16:17:43] [PASSED] rounding4
[16:17:43] =========== [PASSED] drm_test_check_plane_state ============
[16:17:43] =========== drm_test_check_invalid_plane_state  ============
[16:17:43] [PASSED] positioning_invalid
[16:17:43] [PASSED] upscaling_invalid
[16:17:43] [PASSED] downscaling_invalid
[16:17:43] ======= [PASSED] drm_test_check_invalid_plane_state ========
[16:17:43] ================ [PASSED] drm_plane_helper =================
[16:17:43] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[16:17:43] ====== drm_test_connector_helper_tv_get_modes_check  =======
[16:17:43] [PASSED] None
[16:17:43] [PASSED] PAL
[16:17:43] [PASSED] NTSC
[16:17:43] [PASSED] Both, NTSC Default
[16:17:43] [PASSED] Both, PAL Default
[16:17:43] [PASSED] Both, NTSC Default, with PAL on command-line
[16:17:43] [PASSED] Both, PAL Default, with NTSC on command-line
[16:17:43] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[16:17:43] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[16:17:43] ================== drm_rect (4 subtests) ===================
[16:17:43] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[16:17:43] [PASSED] drm_test_rect_clip_scaled_not_clipped
[16:17:43] [PASSED] drm_test_rect_clip_scaled_clipped
[16:17:43] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[16:17:43] ==================== [PASSED] drm_rect =====================
[16:17:43] ============================================================
[16:17:43] Testing complete. Ran 290 tests: passed: 290
[16:17:43] Elapsed time: 42.702s total, 1.639s configuring, 18.185s building, 22.835s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


