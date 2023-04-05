Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8426AC76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 14:52:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE6010E9AC;
	Wed,  5 Apr 2023 14:52:33 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id BDCC410E9B9;
 Wed,  5 Apr 2023 14:52:31 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B9E5BA7E03;
 Wed,  5 Apr 2023 14:52:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 05 Apr 2023 14:52:31 -0000
Message-ID: <168070635175.14696.4202588786672617031@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230405143706.4063988-1-matthew.brost@intel.com>
In-Reply-To: <20230405143706.4063988-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe?=
 =?utf-8?q?=3A_Use_Xe_BO_pin_/_unpin_functions_for_FB_pin_=28rev2=29?=
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

Series: drm/xe: Use Xe BO pin / unpin functions for FB pin (rev2)
URL   : https://patchwork.freedesktop.org/series/116126/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[14:51:20] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:51:24] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[14:51:46] Starting KUnit Kernel (1/1)...
[14:51:46] ============================================================
[14:51:46] ==================== xe_bo (2 subtests) ====================
[14:51:46] [SKIPPED] xe_ccs_migrate_kunit
[14:51:46] [SKIPPED] xe_bo_evict_kunit
[14:51:46] ===================== [SKIPPED] xe_bo ======================
[14:51:46] ================== xe_dma_buf (1 subtest) ==================
[14:51:46] [SKIPPED] xe_dma_buf_kunit
[14:51:46] =================== [SKIPPED] xe_dma_buf ===================
[14:51:46] ================== xe_migrate (1 subtest) ==================
[14:51:46] [SKIPPED] xe_migrate_sanity_kunit
[14:51:46] =================== [SKIPPED] xe_migrate ===================
[14:51:46] ==================== xe_rtp (1 subtest) ====================
[14:51:46] ================== xe_rtp_process_tests  ===================
[14:51:46] [PASSED] coalesce-same-reg
[14:51:46] [PASSED] no-match-no-add
[14:51:46] [PASSED] no-match-no-add-multiple-rules
[14:51:46] [PASSED] two-regs-two-entries
[14:51:46] [PASSED] clr-one-set-other
[14:51:46] [PASSED] set-field
[14:51:46] [PASSED] conflict-duplicate
[14:51:46] [PASSED] conflict-not-disjoint
[14:51:46] [PASSED] conflict-reg-type
[14:51:46] ============== [PASSED] xe_rtp_process_tests ===============
[14:51:46] ===================== [PASSED] xe_rtp ======================
[14:51:46] ==================== xe_wa (1 subtest) =====================
[14:51:46] ======================== xe_wa_gt  =========================
[14:51:46] [PASSED] TIGERLAKE (B0)
[14:51:46] [PASSED] DG1 (A0)
[14:51:46] [PASSED] DG1 (B0)
[14:51:46] [PASSED] ALDERLAKE_S (A0)
[14:51:46] [PASSED] ALDERLAKE_S (B0)
[14:51:46] [PASSED] ALDERLAKE_S (C0)
[14:51:46] [PASSED] ALDERLAKE_S (D0)
[14:51:46] [PASSED] DG2_G10 (A0)
[14:51:46] [PASSED] DG2_G10 (A1)
[14:51:46] [PASSED] DG2_G10 (B0)
[14:51:46] [PASSED] DG2_G10 (C0)
[14:51:46] [PASSED] DG2_G11 (A0)
[14:51:46] [PASSED] DG2_G11 (B0)
[14:51:46] [PASSED] DG2_G11 (B1)
[14:51:46] [PASSED] DG2_G12 (A0)
[14:51:46] [PASSED] DG2_G12 (A1)
[14:51:46] [PASSED] PVC (B0)
[14:51:46] [PASSED] PVC (B1)
[14:51:46] [PASSED] PVC (C0)
[14:51:46] ==================== [PASSED] xe_wa_gt =====================
[14:51:46] ====================== [PASSED] xe_wa ======================
[14:51:46] ============================================================
[14:51:46] Testing complete. Ran 32 tests: passed: 28, skipped: 4
[14:51:46] Elapsed time: 25.856s total, 4.176s configuring, 21.561s building, 0.093s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[14:51:46] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:51:47] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[14:52:06] Starting KUnit Kernel (1/1)...
[14:52:06] ============================================================
[14:52:06] ============ drm_test_pick_cmdline (2 subtests) ============
[14:52:06] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[14:52:06] =============== drm_test_pick_cmdline_named  ===============
[14:52:06] [PASSED] NTSC
[14:52:06] [PASSED] NTSC-J
[14:52:06] [PASSED] PAL
[14:52:06] [PASSED] PAL-M
[14:52:06] =========== [PASSED] drm_test_pick_cmdline_named ===========
[14:52:06] ============== [PASSED] drm_test_pick_cmdline ==============
[14:52:06] ================== drm_buddy (6 subtests) ==================
[14:52:06] [PASSED] drm_test_buddy_alloc_limit
[14:52:06] [PASSED] drm_test_buddy_alloc_range
[14:52:06] [PASSED] drm_test_buddy_alloc_optimistic
[14:52:06] [PASSED] drm_test_buddy_alloc_pessimistic
[14:52:06] [PASSED] drm_test_buddy_alloc_smoke
[14:52:06] [PASSED] drm_test_buddy_alloc_pathological
[14:52:06] ==================== [PASSED] drm_buddy ====================
[14:52:06] ============= drm_cmdline_parser (40 subtests) =============
[14:52:06] [PASSED] drm_test_cmdline_force_d_only
[14:52:06] [PASSED] drm_test_cmdline_force_D_only_dvi
[14:52:06] [PASSED] drm_test_cmdline_force_D_only_hdmi
[14:52:06] [PASSED] drm_test_cmdline_force_D_only_not_digital
[14:52:06] [PASSED] drm_test_cmdline_force_e_only
[14:52:06] [PASSED] drm_test_cmdline_res
[14:52:06] [PASSED] drm_test_cmdline_res_vesa
[14:52:06] [PASSED] drm_test_cmdline_res_vesa_rblank
[14:52:06] [PASSED] drm_test_cmdline_res_rblank
[14:52:06] [PASSED] drm_test_cmdline_res_bpp
[14:52:06] [PASSED] drm_test_cmdline_res_refresh
[14:52:06] [PASSED] drm_test_cmdline_res_bpp_refresh
[14:52:06] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[14:52:06] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[14:52:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[14:52:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[14:52:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[14:52:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[14:52:06] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[14:52:06] [PASSED] drm_test_cmdline_res_margins_force_on
[14:52:06] [PASSED] drm_test_cmdline_res_vesa_margins
[14:52:06] [PASSED] drm_test_cmdline_name
[14:52:06] [PASSED] drm_test_cmdline_name_bpp
[14:52:06] [PASSED] drm_test_cmdline_name_option
[14:52:06] [PASSED] drm_test_cmdline_name_bpp_option
[14:52:06] [PASSED] drm_test_cmdline_rotate_0
[14:52:06] [PASSED] drm_test_cmdline_rotate_90
[14:52:06] [PASSED] drm_test_cmdline_rotate_180
[14:52:06] [PASSED] drm_test_cmdline_rotate_270
[14:52:06] [PASSED] drm_test_cmdline_hmirror
[14:52:06] [PASSED] drm_test_cmdline_vmirror
[14:52:06] [PASSED] drm_test_cmdline_margin_options
[14:52:06] [PASSED] drm_test_cmdline_multiple_options
[14:52:06] [PASSED] drm_test_cmdline_bpp_extra_and_option
[14:52:06] [PASSED] drm_test_cmdline_extra_and_option
[14:52:06] [PASSED] drm_test_cmdline_freestanding_options
[14:52:06] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[14:52:06] [PASSED] drm_test_cmdline_panel_orientation
[14:52:06] ================ drm_test_cmdline_invalid  =================
[14:52:06] [PASSED] margin_only
[14:52:06] [PASSED] interlace_only
[14:52:06] [PASSED] res_missing_x
[14:52:06] [PASSED] res_missing_y
[14:52:06] [PASSED] res_bad_y
[14:52:06] [PASSED] res_missing_y_bpp
[14:52:06] [PASSED] res_bad_bpp
[14:52:06] [PASSED] res_bad_refresh
[14:52:06] [PASSED] res_bpp_refresh_force_on_off
[14:52:06] [PASSED] res_invalid_mode
[14:52:06] [PASSED] res_bpp_wrong_place_mode
[14:52:06] [PASSED] name_bpp_refresh
[14:52:06] [PASSED] name_refresh
[14:52:06] [PASSED] name_refresh_wrong_mode
[14:52:06] [PASSED] name_refresh_invalid_mode
[14:52:06] [PASSED] rotate_multiple
[14:52:06] [PASSED] rotate_invalid_val
[14:52:06] [PASSED] rotate_truncated
[14:52:06] [PASSED] invalid_option
[14:52:06] [PASSED] invalid_tv_option
[14:52:06] [PASSED] truncated_tv_option
[14:52:06] ============ [PASSED] drm_test_cmdline_invalid =============
[14:52:06] =============== drm_test_cmdline_tv_options  ===============
[14:52:06] [PASSED] NTSC
[14:52:06] [PASSED] NTSC_443
[14:52:06] [PASSED] NTSC_J
[14:52:06] [PASSED] PAL
[14:52:06] [PASSED] PAL_M
[14:52:06] [PASSED] PAL_N
[14:52:06] [PASSED] SECAM
[14:52:06] =========== [PASSED] drm_test_cmdline_tv_options ===========
[14:52:06] =============== [PASSED] drm_cmdline_parser ================
[14:52:06] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[14:52:06] ========== drm_test_get_tv_mode_from_name_valid  ===========
[14:52:06] [PASSED] NTSC
[14:52:06] [PASSED] NTSC-443
[14:52:06] [PASSED] NTSC-J
[14:52:06] [PASSED] PAL
[14:52:06] [PASSED] PAL-M
[14:52:06] [PASSED] PAL-N
[14:52:06] [PASSED] SECAM
[14:52:06] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[14:52:06] [PASSED] drm_test_get_tv_mode_from_name_truncated
[14:52:06] ============ [PASSED] drm_get_tv_mode_from_name ============
[14:52:06] ============= drm_damage_helper (21 subtests) ==============
[14:52:06] [PASSED] drm_test_damage_iter_no_damage
[14:52:06] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[14:52:06] [PASSED] drm_test_damage_iter_no_damage_src_moved
[14:52:06] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[14:52:06] [PASSED] drm_test_damage_iter_no_damage_not_visible
[14:52:06] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[14:52:06] [PASSED] drm_test_damage_iter_no_damage_no_fb
[14:52:06] [PASSED] drm_test_damage_iter_simple_damage
[14:52:06] [PASSED] drm_test_damage_iter_single_damage
[14:52:06] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[14:52:06] [PASSED] drm_test_damage_iter_single_damage_outside_src
[14:52:06] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[14:52:06] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[14:52:06] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[14:52:06] [PASSED] drm_test_damage_iter_single_damage_src_moved
[14:52:06] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[14:52:06] [PASSED] drm_test_damage_iter_damage
[14:52:06] [PASSED] drm_test_damage_iter_damage_one_intersect
[14:52:06] [PASSED] drm_test_damage_iter_damage_one_outside
[14:52:06] [PASSED] drm_test_damage_iter_damage_src_moved
[14:52:06] [PASSED] drm_test_damage_iter_damage_not_visible
[14:52:06] ================ [PASSED] drm_damage_helper ================
[14:52:06] ============== drm_dp_mst_helper (2 subtests) ==============
[14:52:06] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[14:52:06] [PASSED] Clock 154000 BPP 30 DSC disabled
[14:52:06] [PASSED] Clock 234000 BPP 30 DSC disabled
[14:52:06] [PASSED] Clock 297000 BPP 24 DSC disabled
[14:52:06] [PASSED] Clock 332880 BPP 24 DSC enabled
[14:52:06] [PASSED] Clock 324540 BPP 24 DSC enabled
[14:52:06] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[14:52:06] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[14:52:06] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[14:52:06] [PASSED] DP_POWER_UP_PHY with port number
[14:52:06] [PASSED] DP_POWER_DOWN_PHY with port number
[14:52:06] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[14:52:06] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[14:52:06] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[14:52:06] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[14:52:06] [PASSED] DP_QUERY_PAYLOAD with port number
[14:52:06] [PASSED] DP_QUERY_PAYLOAD with VCPI
[14:52:06] [PASSED] DP_REMOTE_DPCD_READ with port number
[14:52:06] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[14:52:06] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[14:52:06] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[14:52:06] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[14:52:06] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[14:52:06] [PASSED] DP_REMOTE_I2C_READ with port number
[14:52:06] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[14:52:06] [PASSED] DP_REMOTE_I2C_READ with transactions array
[14:52:06] [PASSED] DP_REMOTE_I2C_WRITE with port number
[14:52:06] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[14:52:06] [PASSED] DP_REMOTE_I2C_WRITE with data array
[14:52:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[14:52:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[14:52:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[14:52:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[14:52:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[14:52:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[14:52:06] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[14:52:06] ================ [PASSED] drm_dp_mst_helper ================
[14:52:06] =========== drm_format_helper_test (11 subtests) ===========
[14:52:06] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[14:52:06] [PASSED] single_pixel_source_buffer
[14:52:06] [PASSED] single_pixel_clip_rectangle
[14:52:06] [PASSED] well_known_colors
[14:52:06] [PASSED] destination_pitch
[14:52:06] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[14:52:06] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[14:52:06] [PASSED] single_pixel_source_buffer
[14:52:06] [PASSED] single_pixel_clip_rectangle
[14:52:06] [PASSED] well_known_colors
[14:52:06] [PASSED] destination_pitch
[14:52:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[14:52:06] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[14:52:06] [PASSED] single_pixel_source_buffer
[14:52:06] [PASSED] single_pixel_clip_rectangle
[14:52:06] [PASSED] well_known_colors
[14:52:06] [PASSED] destination_pitch
[14:52:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[14:52:06] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[14:52:06] [PASSED] single_pixel_source_buffer
[14:52:06] [PASSED] single_pixel_clip_rectangle
[14:52:06] [PASSED] well_known_colors
[14:52:06] [PASSED] destination_pitch
[14:52:06] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[14:52:06] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[14:52:06] [PASSED] single_pixel_source_buffer
[14:52:06] [PASSED] single_pixel_clip_rectangle
[14:52:06] [PASSED] well_known_colors
[14:52:06] [PASSED] destination_pitch
[14:52:06] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[14:52:06] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[14:52:06] [PASSED] single_pixel_source_buffer
[14:52:06] [PASSED] single_pixel_clip_rectangle
[14:52:06] [PASSED] well_known_colors
[14:52:06] [PASSED] destination_pitch
[14:52:06] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[14:52:06] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[14:52:06] [PASSED] single_pixel_source_buffer
[14:52:06] [PASSED] single_pixel_clip_rectangle
[14:52:06] [PASSED] well_known_colors
[14:52:06] [PASSED] destination_pitch
[14:52:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[14:52:06] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[14:52:06] [PASSED] single_pixel_source_buffer
[14:52:06] [PASSED] single_pixel_clip_rectangle
[14:52:06] [PASSED] well_known_colors
[14:52:06] [PASSED] destination_pitch
[14:52:06] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[14:52:06] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[14:52:06] [PASSED] single_pixel_source_buffer
[14:52:06] [PASSED] single_pixel_clip_rectangle
[14:52:06] [PASSED] well_known_colors
[14:52:06] [PASSED] destination_pitch
[14:52:06] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[14:52:06] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[14:52:06] [PASSED] single_pixel_source_buffer
[14:52:06] [PASSED] single_pixel_clip_rectangle
[14:52:06] [PASSED] well_known_colors
[14:52:06] [PASSED] destination_pitch
[14:52:06] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[14:52:06] ============== drm_test_fb_xrgb8888_to_mono  ===============
[14:52:06] [PASSED] single_pixel_source_buffer
[14:52:06] [PASSED] single_pixel_clip_rectangle
[14:52:06] [PASSED] well_known_colors
[14:52:06] [PASSED] destination_pitch
[14:52:06] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[14:52:06] ============= [PASSED] drm_format_helper_test ==============
[14:52:06] ================= drm_format (18 subtests) =================
[14:52:06] [PASSED] drm_test_format_block_width_invalid
[14:52:06] [PASSED] drm_test_format_block_width_one_plane
[14:52:06] [PASSED] drm_test_format_block_width_two_plane
[14:52:06] [PASSED] drm_test_format_block_width_three_plane
[14:52:06] [PASSED] drm_test_format_block_width_tiled
[14:52:06] [PASSED] drm_test_format_block_height_invalid
[14:52:06] [PASSED] drm_test_format_block_height_one_plane
[14:52:06] [PASSED] drm_test_format_block_height_two_plane
[14:52:06] [PASSED] drm_test_format_block_height_three_plane
[14:52:06] [PASSED] drm_test_format_block_height_tiled
[14:52:06] [PASSED] drm_test_format_min_pitch_invalid
[14:52:06] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[14:52:06] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[14:52:06] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[14:52:06] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[14:52:06] [PASSED] drm_test_format_min_pitch_two_plane
[14:52:06] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[14:52:06] [PASSED] drm_test_format_min_pitch_tiled
[14:52:06] =================== [PASSED] drm_format ====================
[14:52:06] =============== drm_framebuffer (1 subtest) ================
[14:52:06] =============== drm_test_framebuffer_create  ===============
[14:52:06] [PASSED] ABGR8888 normal sizes
[14:52:06] [PASSED] ABGR8888 max sizes
[14:52:06] [PASSED] ABGR8888 pitch greater than min required
[14:52:06] [PASSED] ABGR8888 pitch less than min required
[14:52:06] [PASSED] ABGR8888 Invalid width
[14:52:06] [PASSED] ABGR8888 Invalid buffer handle
[14:52:06] [PASSED] No pixel format
[14:52:06] [PASSED] ABGR8888 Width 0
[14:52:06] [PASSED] ABGR8888 Height 0
[14:52:06] [PASSED] ABGR8888 Out of bound height * pitch combination
[14:52:06] [PASSED] ABGR8888 Large buffer offset
[14:52:06] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[14:52:06] [PASSED] ABGR8888 Valid buffer modifier
[14:52:06] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[14:52:06] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[14:52:06] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[14:52:06] [PASSED] NV12 Normal sizes
[14:52:06] [PASSED] NV12 Max sizes
[14:52:06] [PASSED] NV12 Invalid pitch
[14:52:06] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[14:52:06] [PASSED] NV12 different  modifier per-plane
[14:52:06] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[14:52:06] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[14:52:06] [PASSED] NV12 Modifier for inexistent plane
[14:52:06] [PASSED] NV12 Handle for inexistent plane
[14:52:06] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[14:52:06] [PASSED] YVU420 Normal sizes
[14:52:06] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[14:52:06] [PASSED] YVU420 Max sizes
[14:52:06] [PASSED] YVU420 Invalid pitch
[14:52:06] [PASSED] YVU420 Different pitches
[14:52:06] [PASSED] YVU420 Different buffer offsets/pitches
[14:52:06] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[14:52:06] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[14:52:06] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[14:52:06] [PASSED] YVU420 Valid modifier
[14:52:06] [PASSED] YVU420 Different modifiers per plane
[14:52:06] [PASSED] YVU420 Modifier for inexistent plane
[14:52:06] [PASSED] X0L2 Normal sizes
[14:52:06] [PASSED] X0L2 Max sizes
[14:52:06] [PASSED] X0L2 Invalid pitch
[14:52:06] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[14:52:06] [PASSED] X0L2 Handle for inexistent plane
[14:52:06] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[14:52:06] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[14:52:06] [PASSED] X0L2 Valid modifier
[14:52:06] [PASSED] X0L2 Modifier for inexistent plane
[14:52:06] =========== [PASSED] drm_test_framebuffer_create ===========
[14:52:06] ================= [PASSED] drm_framebuffer =================
[14:52:06] =============== drm-test-managed (1 subtest) ===============
[14:52:06] [PASSED] drm_test_managed_run_action
[14:52:06] ================ [PASSED] drm-test-managed =================
[14:52:06] =================== drm_mm (19 subtests) ===================
[14:52:06] [PASSED] drm_test_mm_init
[14:52:06] [PASSED] drm_test_mm_debug
[14:52:16] [PASSED] drm_test_mm_reserve
[14:52:26] [PASSED] drm_test_mm_insert
[14:52:26] [PASSED] drm_test_mm_replace
[14:52:26] [PASSED] drm_test_mm_insert_range
[14:52:26] [PASSED] drm_test_mm_frag
[14:52:26] [PASSED] drm_test_mm_align
[14:52:26] [PASSED] drm_test_mm_align32
[14:52:27] [PASSED] drm_test_mm_align64
[14:52:27] [PASSED] drm_test_mm_evict
[14:52:27] [PASSED] drm_test_mm_evict_range
[14:52:27] [PASSED] drm_test_mm_topdown
[14:52:27] [PASSED] drm_test_mm_bottomup
[14:52:27] [PASSED] drm_test_mm_lowest
[14:52:27] [PASSED] drm_test_mm_highest
[14:52:28] [PASSED] drm_test_mm_color
[14:52:28] [PASSED] drm_test_mm_color_evict
[14:52:28] [PASSED] drm_test_mm_color_evict_range
[14:52:28] ===================== [PASSED] drm_mm ======================
[14:52:28] ============= drm_modes_analog_tv (4 subtests) =============
[14:52:28] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[14:52:28] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[14:52:28] [PASSED] drm_test_modes_analog_tv_pal_576i
[14:52:28] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[14:52:28] =============== [PASSED] drm_modes_analog_tv ===============
[14:52:28] ============== drm_plane_helper (2 subtests) ===============
[14:52:28] =============== drm_test_check_plane_state  ================
[14:52:28] [PASSED] clipping_simple
[14:52:28] [PASSED] clipping_rotate_reflect
[14:52:28] [PASSED] positioning_simple
[14:52:28] [PASSED] upscaling
[14:52:28] [PASSED] downscaling
[14:52:28] [PASSED] rounding1
[14:52:28] [PASSED] rounding2
[14:52:28] [PASSED] rounding3
[14:52:28] [PASSED] rounding4
[14:52:28] =========== [PASSED] drm_test_check_plane_state ============
[14:52:28] =========== drm_test_check_invalid_plane_state  ============
[14:52:28] [PASSED] positioning_invalid
[14:52:28] [PASSED] upscaling_invalid
[14:52:28] [PASSED] downscaling_invalid
[14:52:28] ======= [PASSED] drm_test_check_invalid_plane_state ========
[14:52:28] ================ [PASSED] drm_plane_helper =================
[14:52:28] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[14:52:28] ====== drm_test_connector_helper_tv_get_modes_check  =======
[14:52:28] [PASSED] None
[14:52:28] [PASSED] PAL
[14:52:28] [PASSED] NTSC
[14:52:28] [PASSED] Both, NTSC Default
[14:52:28] [PASSED] Both, PAL Default
[14:52:28] [PASSED] Both, NTSC Default, with PAL on command-line
[14:52:28] [PASSED] Both, PAL Default, with NTSC on command-line
[14:52:28] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[14:52:28] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[14:52:28] ================== drm_rect (4 subtests) ===================
[14:52:28] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[14:52:28] [PASSED] drm_test_rect_clip_scaled_not_clipped
[14:52:28] [PASSED] drm_test_rect_clip_scaled_clipped
[14:52:28] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[14:52:28] ==================== [PASSED] drm_rect =====================
[14:52:28] ============================================================
[14:52:28] Testing complete. Ran 294 tests: passed: 294
[14:52:28] Elapsed time: 42.606s total, 1.707s configuring, 18.120s building, 22.765s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


