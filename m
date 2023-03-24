Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A29C74A5B
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 01:53:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00F310E157;
	Fri, 24 Mar 2023 01:53:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7E18110E157;
 Fri, 24 Mar 2023 01:53:36 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 79D32A7DFF;
 Fri, 24 Mar 2023 01:53:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Fri, 24 Mar 2023 01:53:36 -0000
Message-ID: <167962281649.30852.9232121419125517746@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230324012329.1195977-1-matthew.brost@intel.com>
In-Reply-To: <20230324012329.1195977-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe?=
 =?utf-8?q?=3A_Use_fast_virtual_copy_engine_for_migrate_engine_on_PVC_=28r?=
 =?utf-8?q?ev2=29?=
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

Series: drm/xe: Use fast virtual copy engine for migrate engine on PVC (rev2)
URL   : https://patchwork.freedesktop.org/series/115575/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[01:52:24] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:52:29] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[01:52:50] Starting KUnit Kernel (1/1)...
[01:52:50] ============================================================
[01:52:50] ==================== xe_bo (2 subtests) ====================
[01:52:50] [SKIPPED] xe_ccs_migrate_kunit
[01:52:50] [SKIPPED] xe_bo_evict_kunit
[01:52:50] ===================== [SKIPPED] xe_bo ======================
[01:52:50] ================== xe_dma_buf (1 subtest) ==================
[01:52:50] [SKIPPED] xe_dma_buf_kunit
[01:52:50] =================== [SKIPPED] xe_dma_buf ===================
[01:52:50] ================== xe_migrate (1 subtest) ==================
[01:52:50] [SKIPPED] xe_migrate_sanity_kunit
[01:52:50] =================== [SKIPPED] xe_migrate ===================
[01:52:50] ============================================================
[01:52:50] Testing complete. Ran 4 tests: skipped: 4
[01:52:50] Elapsed time: 25.709s total, 4.144s configuring, 21.396s building, 0.143s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[01:52:50] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:52:52] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[01:53:10] Starting KUnit Kernel (1/1)...
[01:53:10] ============================================================
[01:53:10] ============ drm_test_pick_cmdline (2 subtests) ============
[01:53:10] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[01:53:10] =============== drm_test_pick_cmdline_named  ===============
[01:53:10] [PASSED] NTSC
[01:53:10] [PASSED] NTSC-J
[01:53:10] [PASSED] PAL
[01:53:10] [PASSED] PAL-M
[01:53:10] =========== [PASSED] drm_test_pick_cmdline_named ===========
[01:53:10] ============== [PASSED] drm_test_pick_cmdline ==============
[01:53:10] ================== drm_buddy (6 subtests) ==================
[01:53:10] [PASSED] drm_test_buddy_alloc_limit
[01:53:10] [PASSED] drm_test_buddy_alloc_range
[01:53:10] [PASSED] drm_test_buddy_alloc_optimistic
[01:53:10] [PASSED] drm_test_buddy_alloc_pessimistic
[01:53:10] [PASSED] drm_test_buddy_alloc_smoke
[01:53:10] [PASSED] drm_test_buddy_alloc_pathological
[01:53:10] ==================== [PASSED] drm_buddy ====================
[01:53:10] ============= drm_cmdline_parser (40 subtests) =============
[01:53:10] [PASSED] drm_test_cmdline_force_d_only
[01:53:10] [PASSED] drm_test_cmdline_force_D_only_dvi
[01:53:10] [PASSED] drm_test_cmdline_force_D_only_hdmi
[01:53:10] [PASSED] drm_test_cmdline_force_D_only_not_digital
[01:53:10] [PASSED] drm_test_cmdline_force_e_only
[01:53:10] [PASSED] drm_test_cmdline_res
[01:53:10] [PASSED] drm_test_cmdline_res_vesa
[01:53:10] [PASSED] drm_test_cmdline_res_vesa_rblank
[01:53:10] [PASSED] drm_test_cmdline_res_rblank
[01:53:10] [PASSED] drm_test_cmdline_res_bpp
[01:53:10] [PASSED] drm_test_cmdline_res_refresh
[01:53:10] [PASSED] drm_test_cmdline_res_bpp_refresh
[01:53:10] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[01:53:10] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[01:53:10] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[01:53:10] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[01:53:10] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[01:53:10] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[01:53:10] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[01:53:10] [PASSED] drm_test_cmdline_res_margins_force_on
[01:53:10] [PASSED] drm_test_cmdline_res_vesa_margins
[01:53:10] [PASSED] drm_test_cmdline_name
[01:53:10] [PASSED] drm_test_cmdline_name_bpp
[01:53:10] [PASSED] drm_test_cmdline_name_option
[01:53:10] [PASSED] drm_test_cmdline_name_bpp_option
[01:53:10] [PASSED] drm_test_cmdline_rotate_0
[01:53:10] [PASSED] drm_test_cmdline_rotate_90
[01:53:10] [PASSED] drm_test_cmdline_rotate_180
[01:53:10] [PASSED] drm_test_cmdline_rotate_270
[01:53:10] [PASSED] drm_test_cmdline_hmirror
[01:53:10] [PASSED] drm_test_cmdline_vmirror
[01:53:10] [PASSED] drm_test_cmdline_margin_options
[01:53:10] [PASSED] drm_test_cmdline_multiple_options
[01:53:10] [PASSED] drm_test_cmdline_bpp_extra_and_option
[01:53:10] [PASSED] drm_test_cmdline_extra_and_option
[01:53:10] [PASSED] drm_test_cmdline_freestanding_options
[01:53:10] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[01:53:10] [PASSED] drm_test_cmdline_panel_orientation
[01:53:10] ================ drm_test_cmdline_invalid  =================
[01:53:10] [PASSED] margin_only
[01:53:10] [PASSED] interlace_only
[01:53:10] [PASSED] res_missing_x
[01:53:10] [PASSED] res_missing_y
[01:53:10] [PASSED] res_bad_y
[01:53:10] [PASSED] res_missing_y_bpp
[01:53:10] [PASSED] res_bad_bpp
[01:53:10] [PASSED] res_bad_refresh
[01:53:10] [PASSED] res_bpp_refresh_force_on_off
[01:53:10] [PASSED] res_invalid_mode
[01:53:10] [PASSED] res_bpp_wrong_place_mode
[01:53:10] [PASSED] name_bpp_refresh
[01:53:10] [PASSED] name_refresh
[01:53:10] [PASSED] name_refresh_wrong_mode
[01:53:10] [PASSED] name_refresh_invalid_mode
[01:53:10] [PASSED] rotate_multiple
[01:53:10] [PASSED] rotate_invalid_val
[01:53:10] [PASSED] rotate_truncated
[01:53:10] [PASSED] invalid_option
[01:53:10] [PASSED] invalid_tv_option
[01:53:10] [PASSED] truncated_tv_option
[01:53:10] ============ [PASSED] drm_test_cmdline_invalid =============
[01:53:10] =============== drm_test_cmdline_tv_options  ===============
[01:53:10] [PASSED] NTSC
[01:53:10] [PASSED] NTSC_443
[01:53:10] [PASSED] NTSC_J
[01:53:10] [PASSED] PAL
[01:53:10] [PASSED] PAL_M
[01:53:10] [PASSED] PAL_N
[01:53:10] [PASSED] SECAM
[01:53:10] =========== [PASSED] drm_test_cmdline_tv_options ===========
[01:53:10] =============== [PASSED] drm_cmdline_parser ================
[01:53:10] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[01:53:10] ========== drm_test_get_tv_mode_from_name_valid  ===========
[01:53:10] [PASSED] NTSC
[01:53:10] [PASSED] NTSC-443
[01:53:10] [PASSED] NTSC-J
[01:53:10] [PASSED] PAL
[01:53:10] [PASSED] PAL-M
[01:53:10] [PASSED] PAL-N
[01:53:10] [PASSED] SECAM
[01:53:10] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[01:53:10] [PASSED] drm_test_get_tv_mode_from_name_truncated
[01:53:10] ============ [PASSED] drm_get_tv_mode_from_name ============
[01:53:10] ============= drm_damage_helper (21 subtests) ==============
[01:53:10] [PASSED] drm_test_damage_iter_no_damage
[01:53:10] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[01:53:10] [PASSED] drm_test_damage_iter_no_damage_src_moved
[01:53:10] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[01:53:10] [PASSED] drm_test_damage_iter_no_damage_not_visible
[01:53:10] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[01:53:10] [PASSED] drm_test_damage_iter_no_damage_no_fb
[01:53:10] [PASSED] drm_test_damage_iter_simple_damage
[01:53:10] [PASSED] drm_test_damage_iter_single_damage
[01:53:10] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[01:53:10] [PASSED] drm_test_damage_iter_single_damage_outside_src
[01:53:10] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[01:53:10] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[01:53:10] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[01:53:10] [PASSED] drm_test_damage_iter_single_damage_src_moved
[01:53:10] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[01:53:10] [PASSED] drm_test_damage_iter_damage
[01:53:10] [PASSED] drm_test_damage_iter_damage_one_intersect
[01:53:10] [PASSED] drm_test_damage_iter_damage_one_outside
[01:53:10] [PASSED] drm_test_damage_iter_damage_src_moved
[01:53:10] [PASSED] drm_test_damage_iter_damage_not_visible
[01:53:10] ================ [PASSED] drm_damage_helper ================
[01:53:10] ============== drm_dp_mst_helper (2 subtests) ==============
[01:53:10] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[01:53:10] [PASSED] Clock 154000 BPP 30 DSC disabled
[01:53:10] [PASSED] Clock 234000 BPP 30 DSC disabled
[01:53:10] [PASSED] Clock 297000 BPP 24 DSC disabled
[01:53:10] [PASSED] Clock 332880 BPP 24 DSC enabled
[01:53:10] [PASSED] Clock 324540 BPP 24 DSC enabled
[01:53:10] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[01:53:10] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[01:53:10] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[01:53:10] [PASSED] DP_POWER_UP_PHY with port number
[01:53:10] [PASSED] DP_POWER_DOWN_PHY with port number
[01:53:10] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[01:53:10] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[01:53:10] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[01:53:10] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[01:53:10] [PASSED] DP_QUERY_PAYLOAD with port number
[01:53:10] [PASSED] DP_QUERY_PAYLOAD with VCPI
[01:53:10] [PASSED] DP_REMOTE_DPCD_READ with port number
[01:53:10] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[01:53:10] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[01:53:10] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[01:53:10] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[01:53:10] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[01:53:10] [PASSED] DP_REMOTE_I2C_READ with port number
[01:53:10] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[01:53:10] [PASSED] DP_REMOTE_I2C_READ with transactions array
[01:53:10] [PASSED] DP_REMOTE_I2C_WRITE with port number
[01:53:10] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[01:53:10] [PASSED] DP_REMOTE_I2C_WRITE with data array
[01:53:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[01:53:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[01:53:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[01:53:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[01:53:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[01:53:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[01:53:10] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[01:53:10] ================ [PASSED] drm_dp_mst_helper ================
[01:53:10] =========== drm_format_helper_test (10 subtests) ===========
[01:53:10] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[01:53:10] [PASSED] single_pixel_source_buffer
[01:53:10] [PASSED] single_pixel_clip_rectangle
[01:53:10] [PASSED] well_known_colors
[01:53:10] [PASSED] destination_pitch
[01:53:10] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[01:53:10] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[01:53:10] [PASSED] single_pixel_source_buffer
[01:53:10] [PASSED] single_pixel_clip_rectangle
[01:53:10] [PASSED] well_known_colors
[01:53:10] [PASSED] destination_pitch
[01:53:10] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[01:53:10] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[01:53:10] [PASSED] single_pixel_source_buffer
[01:53:10] [PASSED] single_pixel_clip_rectangle
[01:53:10] [PASSED] well_known_colors
[01:53:10] [PASSED] destination_pitch
[01:53:10] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[01:53:10] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[01:53:10] [PASSED] single_pixel_source_buffer
[01:53:10] [PASSED] single_pixel_clip_rectangle
[01:53:10] [PASSED] well_known_colors
[01:53:10] [PASSED] destination_pitch
[01:53:10] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[01:53:10] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[01:53:10] [PASSED] single_pixel_source_buffer
[01:53:10] [PASSED] single_pixel_clip_rectangle
[01:53:10] [PASSED] well_known_colors
[01:53:10] [PASSED] destination_pitch
[01:53:10] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[01:53:10] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[01:53:10] [PASSED] single_pixel_source_buffer
[01:53:10] [PASSED] single_pixel_clip_rectangle
[01:53:10] [PASSED] well_known_colors
[01:53:10] [PASSED] destination_pitch
[01:53:10] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[01:53:10] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[01:53:10] [PASSED] single_pixel_source_buffer
[01:53:10] [PASSED] single_pixel_clip_rectangle
[01:53:10] [PASSED] well_known_colors
[01:53:10] [PASSED] destination_pitch
[01:53:10] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[01:53:10] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[01:53:10] [PASSED] single_pixel_source_buffer
[01:53:10] [PASSED] single_pixel_clip_rectangle
[01:53:10] [PASSED] well_known_colors
[01:53:10] [PASSED] destination_pitch
[01:53:10] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[01:53:10] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[01:53:10] [PASSED] single_pixel_source_buffer
[01:53:10] [PASSED] single_pixel_clip_rectangle
[01:53:10] [PASSED] well_known_colors
[01:53:10] [PASSED] destination_pitch
[01:53:10] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[01:53:10] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[01:53:10] [PASSED] single_pixel_source_buffer
[01:53:10] [PASSED] single_pixel_clip_rectangle
[01:53:10] [PASSED] well_known_colors
[01:53:10] [PASSED] destination_pitch
[01:53:10] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[01:53:10] ============= [PASSED] drm_format_helper_test ==============
[01:53:10] ================= drm_format (18 subtests) =================
[01:53:10] [PASSED] drm_test_format_block_width_invalid
[01:53:10] [PASSED] drm_test_format_block_width_one_plane
[01:53:10] [PASSED] drm_test_format_block_width_two_plane
[01:53:10] [PASSED] drm_test_format_block_width_three_plane
[01:53:10] [PASSED] drm_test_format_block_width_tiled
[01:53:10] [PASSED] drm_test_format_block_height_invalid
[01:53:10] [PASSED] drm_test_format_block_height_one_plane
[01:53:10] [PASSED] drm_test_format_block_height_two_plane
[01:53:10] [PASSED] drm_test_format_block_height_three_plane
[01:53:10] [PASSED] drm_test_format_block_height_tiled
[01:53:10] [PASSED] drm_test_format_min_pitch_invalid
[01:53:10] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[01:53:10] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[01:53:10] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[01:53:10] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[01:53:10] [PASSED] drm_test_format_min_pitch_two_plane
[01:53:10] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[01:53:10] [PASSED] drm_test_format_min_pitch_tiled
[01:53:10] =================== [PASSED] drm_format ====================
[01:53:10] =============== drm_framebuffer (1 subtest) ================
[01:53:10] =============== drm_test_framebuffer_create  ===============
[01:53:10] [PASSED] ABGR8888 normal sizes
[01:53:10] [PASSED] ABGR8888 max sizes
[01:53:10] [PASSED] ABGR8888 pitch greater than min required
[01:53:10] [PASSED] ABGR8888 pitch less than min required
[01:53:10] [PASSED] ABGR8888 Invalid width
[01:53:10] [PASSED] ABGR8888 Invalid buffer handle
[01:53:10] [PASSED] No pixel format
[01:53:10] [PASSED] ABGR8888 Width 0
[01:53:10] [PASSED] ABGR8888 Height 0
[01:53:10] [PASSED] ABGR8888 Out of bound height * pitch combination
[01:53:10] [PASSED] ABGR8888 Large buffer offset
[01:53:10] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[01:53:10] [PASSED] ABGR8888 Valid buffer modifier
[01:53:10] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[01:53:10] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[01:53:10] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[01:53:10] [PASSED] NV12 Normal sizes
[01:53:10] [PASSED] NV12 Max sizes
[01:53:10] [PASSED] NV12 Invalid pitch
[01:53:10] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[01:53:10] [PASSED] NV12 different  modifier per-plane
[01:53:10] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[01:53:10] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[01:53:10] [PASSED] NV12 Modifier for inexistent plane
[01:53:10] [PASSED] NV12 Handle for inexistent plane
[01:53:10] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[01:53:10] [PASSED] YVU420 Normal sizes
[01:53:10] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[01:53:10] [PASSED] YVU420 Max sizes
[01:53:10] [PASSED] YVU420 Invalid pitch
[01:53:10] [PASSED] YVU420 Different pitches
[01:53:10] [PASSED] YVU420 Different buffer offsets/pitches
[01:53:10] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[01:53:10] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[01:53:10] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[01:53:10] [PASSED] YVU420 Valid modifier
[01:53:10] [PASSED] YVU420 Different modifiers per plane
[01:53:10] [PASSED] YVU420 Modifier for inexistent plane
[01:53:10] [PASSED] X0L2 Normal sizes
[01:53:10] [PASSED] X0L2 Max sizes
[01:53:10] [PASSED] X0L2 Invalid pitch
[01:53:10] [PASSED] X0L2 Pitch greater than minimum required
[01:53:10] [PASSED] X0L2 Handle for inexistent plane
[01:53:10] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[01:53:10] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[01:53:10] [PASSED] X0L2 Valid modifier
[01:53:10] [PASSED] X0L2 Modifier for inexistent plane
stty: 'standard input': Inappropriate ioctl for device
[01:53:10] =========== [PASSED] drm_test_framebuffer_create ===========
[01:53:10] ================= [PASSED] drm_framebuffer =================
[01:53:10] =============== drm-test-managed (1 subtest) ===============
[01:53:10] [PASSED] drm_test_managed_run_action
[01:53:10] ================ [PASSED] drm-test-managed =================
[01:53:10] =================== drm_mm (19 subtests) ===================
[01:53:10] [PASSED] drm_test_mm_init
[01:53:10] [PASSED] drm_test_mm_debug
[01:53:20] [PASSED] drm_test_mm_reserve
[01:53:30] [PASSED] drm_test_mm_insert
[01:53:30] [PASSED] drm_test_mm_replace
[01:53:30] [PASSED] drm_test_mm_insert_range
[01:53:30] [PASSED] drm_test_mm_frag
[01:53:30] [PASSED] drm_test_mm_align
[01:53:30] [PASSED] drm_test_mm_align32
[01:53:31] [PASSED] drm_test_mm_align64
[01:53:31] [PASSED] drm_test_mm_evict
[01:53:31] [PASSED] drm_test_mm_evict_range
[01:53:31] [PASSED] drm_test_mm_topdown
[01:53:31] [PASSED] drm_test_mm_bottomup
[01:53:31] [PASSED] drm_test_mm_lowest
[01:53:31] [PASSED] drm_test_mm_highest
[01:53:32] [PASSED] drm_test_mm_color
[01:53:33] [PASSED] drm_test_mm_color_evict
[01:53:33] [PASSED] drm_test_mm_color_evict_range
[01:53:33] ===================== [PASSED] drm_mm ======================
[01:53:33] ============= drm_modes_analog_tv (4 subtests) =============
[01:53:33] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[01:53:33] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[01:53:33] [PASSED] drm_test_modes_analog_tv_pal_576i
[01:53:33] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[01:53:33] =============== [PASSED] drm_modes_analog_tv ===============
[01:53:33] ============== drm_plane_helper (2 subtests) ===============
[01:53:33] =============== drm_test_check_plane_state  ================
[01:53:33] [PASSED] clipping_simple
[01:53:33] [PASSED] clipping_rotate_reflect
[01:53:33] [PASSED] positioning_simple
[01:53:33] [PASSED] upscaling
[01:53:33] [PASSED] downscaling
[01:53:33] [PASSED] rounding1
[01:53:33] [PASSED] rounding2
[01:53:33] [PASSED] rounding3
[01:53:33] [PASSED] rounding4
[01:53:33] =========== [PASSED] drm_test_check_plane_state ============
[01:53:33] =========== drm_test_check_invalid_plane_state  ============
[01:53:33] [PASSED] positioning_invalid
[01:53:33] [PASSED] upscaling_invalid
[01:53:33] [PASSED] downscaling_invalid
[01:53:33] ======= [PASSED] drm_test_check_invalid_plane_state ========
[01:53:33] ================ [PASSED] drm_plane_helper =================
[01:53:33] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[01:53:33] ====== drm_test_connector_helper_tv_get_modes_check  =======
[01:53:33] [PASSED] None
[01:53:33] [PASSED] PAL
[01:53:33] [PASSED] NTSC
[01:53:33] [PASSED] Both, NTSC Default
[01:53:33] [PASSED] Both, PAL Default
[01:53:33] [PASSED] Both, NTSC Default, with PAL on command-line
[01:53:33] [PASSED] Both, PAL Default, with NTSC on command-line
[01:53:33] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[01:53:33] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[01:53:33] ================== drm_rect (4 subtests) ===================
[01:53:33] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[01:53:33] [PASSED] drm_test_rect_clip_scaled_not_clipped
[01:53:33] [PASSED] drm_test_rect_clip_scaled_clipped
[01:53:33] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[01:53:33] ==================== [PASSED] drm_rect =====================
[01:53:33] ============================================================
[01:53:33] Testing complete. Ran 290 tests: passed: 290
[01:53:33] Elapsed time: 42.283s total, 1.654s configuring, 18.051s building, 22.566s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


