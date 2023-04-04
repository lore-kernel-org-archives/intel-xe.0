Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB9DC761A6
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 20:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B248210E79F;
	Tue,  4 Apr 2023 20:11:00 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id F367810E79F;
 Tue,  4 Apr 2023 20:10:58 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DDFA1AADE3;
 Tue,  4 Apr 2023 20:10:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 04 Apr 2023 20:10:58 -0000
Message-ID: <168063905890.18900.2195045307340082676@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/ttm?=
 =?utf-8?q?=3A_Small_fixes_/_cleanups_in_prep_for_shrinking?=
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

Series: drm/ttm: Small fixes / cleanups in prep for shrinking
URL   : https://patchwork.freedesktop.org/series/116112/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[20:09:45] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:09:49] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[20:10:11] Starting KUnit Kernel (1/1)...
[20:10:11] ============================================================
[20:10:11] ==================== xe_bo (2 subtests) ====================
[20:10:11] [SKIPPED] xe_ccs_migrate_kunit
[20:10:11] [SKIPPED] xe_bo_evict_kunit
[20:10:11] ===================== [SKIPPED] xe_bo ======================
[20:10:11] ================== xe_dma_buf (1 subtest) ==================
[20:10:11] [SKIPPED] xe_dma_buf_kunit
[20:10:11] =================== [SKIPPED] xe_dma_buf ===================
[20:10:11] ================== xe_migrate (1 subtest) ==================
[20:10:11] [SKIPPED] xe_migrate_sanity_kunit
[20:10:11] =================== [SKIPPED] xe_migrate ===================
[20:10:11] ==================== xe_rtp (1 subtest) ====================
[20:10:11] ================== xe_rtp_process_tests  ===================
[20:10:11] [PASSED] coalesce-same-reg
[20:10:11] [PASSED] no-match-no-add
[20:10:11] [PASSED] no-match-no-add-multiple-rules
[20:10:11] [PASSED] two-regs-two-entries
[20:10:11] [PASSED] clr-one-set-other
[20:10:11] [PASSED] set-field
[20:10:11] [PASSED] conflict-duplicate
[20:10:11] [PASSED] conflict-not-disjoint
[20:10:11] [PASSED] conflict-reg-type
[20:10:11] ============== [PASSED] xe_rtp_process_tests ===============
[20:10:11] ===================== [PASSED] xe_rtp ======================
[20:10:11] ==================== xe_wa (1 subtest) =====================
[20:10:11] ======================== xe_wa_gt  =========================
[20:10:11] [PASSED] TIGERLAKE (B0)
[20:10:11] [PASSED] DG1 (A0)
[20:10:11] [PASSED] DG1 (B0)
[20:10:11] [PASSED] ALDERLAKE_S (A0)
[20:10:11] [PASSED] ALDERLAKE_S (B0)
[20:10:11] [PASSED] ALDERLAKE_S (C0)
[20:10:11] [PASSED] ALDERLAKE_S (D0)
[20:10:11] [PASSED] DG2_G10 (A0)
[20:10:11] [PASSED] DG2_G10 (A1)
[20:10:11] [PASSED] DG2_G10 (B0)
[20:10:11] [PASSED] DG2_G10 (C0)
[20:10:11] [PASSED] DG2_G11 (A0)
[20:10:11] [PASSED] DG2_G11 (B0)
[20:10:11] [PASSED] DG2_G11 (B1)
[20:10:11] [PASSED] DG2_G12 (A0)
[20:10:11] [PASSED] DG2_G12 (A1)
[20:10:11] [PASSED] PVC (B0)
[20:10:11] [PASSED] PVC (B1)
[20:10:11] [PASSED] PVC (C0)
[20:10:11] ==================== [PASSED] xe_wa_gt =====================
[20:10:11] ====================== [PASSED] xe_wa ======================
[20:10:11] ============================================================
[20:10:11] Testing complete. Ran 32 tests: passed: 28, skipped: 4
[20:10:11] Elapsed time: 26.111s total, 4.174s configuring, 21.817s building, 0.116s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[20:10:11] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:10:13] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[20:10:31] Starting KUnit Kernel (1/1)...
[20:10:31] ============================================================
[20:10:31] ============ drm_test_pick_cmdline (2 subtests) ============
[20:10:31] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[20:10:31] =============== drm_test_pick_cmdline_named  ===============
[20:10:31] [PASSED] NTSC
[20:10:31] [PASSED] NTSC-J
[20:10:31] [PASSED] PAL
[20:10:31] [PASSED] PAL-M
[20:10:31] =========== [PASSED] drm_test_pick_cmdline_named ===========
[20:10:31] ============== [PASSED] drm_test_pick_cmdline ==============
[20:10:31] ================== drm_buddy (6 subtests) ==================
[20:10:31] [PASSED] drm_test_buddy_alloc_limit
[20:10:31] [PASSED] drm_test_buddy_alloc_range
[20:10:31] [PASSED] drm_test_buddy_alloc_optimistic
[20:10:31] [PASSED] drm_test_buddy_alloc_pessimistic
[20:10:31] [PASSED] drm_test_buddy_alloc_smoke
[20:10:31] [PASSED] drm_test_buddy_alloc_pathological
[20:10:31] ==================== [PASSED] drm_buddy ====================
[20:10:31] ============= drm_cmdline_parser (40 subtests) =============
[20:10:31] [PASSED] drm_test_cmdline_force_d_only
[20:10:31] [PASSED] drm_test_cmdline_force_D_only_dvi
[20:10:31] [PASSED] drm_test_cmdline_force_D_only_hdmi
[20:10:31] [PASSED] drm_test_cmdline_force_D_only_not_digital
[20:10:31] [PASSED] drm_test_cmdline_force_e_only
[20:10:31] [PASSED] drm_test_cmdline_res
[20:10:31] [PASSED] drm_test_cmdline_res_vesa
[20:10:31] [PASSED] drm_test_cmdline_res_vesa_rblank
[20:10:31] [PASSED] drm_test_cmdline_res_rblank
[20:10:31] [PASSED] drm_test_cmdline_res_bpp
[20:10:31] [PASSED] drm_test_cmdline_res_refresh
[20:10:31] [PASSED] drm_test_cmdline_res_bpp_refresh
[20:10:31] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[20:10:31] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[20:10:31] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[20:10:31] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[20:10:31] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[20:10:31] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[20:10:31] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[20:10:31] [PASSED] drm_test_cmdline_res_margins_force_on
[20:10:31] [PASSED] drm_test_cmdline_res_vesa_margins
[20:10:31] [PASSED] drm_test_cmdline_name
[20:10:31] [PASSED] drm_test_cmdline_name_bpp
[20:10:31] [PASSED] drm_test_cmdline_name_option
[20:10:31] [PASSED] drm_test_cmdline_name_bpp_option
[20:10:31] [PASSED] drm_test_cmdline_rotate_0
[20:10:31] [PASSED] drm_test_cmdline_rotate_90
[20:10:31] [PASSED] drm_test_cmdline_rotate_180
[20:10:31] [PASSED] drm_test_cmdline_rotate_270
[20:10:31] [PASSED] drm_test_cmdline_hmirror
[20:10:31] [PASSED] drm_test_cmdline_vmirror
[20:10:31] [PASSED] drm_test_cmdline_margin_options
[20:10:31] [PASSED] drm_test_cmdline_multiple_options
[20:10:31] [PASSED] drm_test_cmdline_bpp_extra_and_option
[20:10:31] [PASSED] drm_test_cmdline_extra_and_option
[20:10:31] [PASSED] drm_test_cmdline_freestanding_options
[20:10:31] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[20:10:31] [PASSED] drm_test_cmdline_panel_orientation
[20:10:31] ================ drm_test_cmdline_invalid  =================
[20:10:31] [PASSED] margin_only
[20:10:31] [PASSED] interlace_only
[20:10:31] [PASSED] res_missing_x
[20:10:31] [PASSED] res_missing_y
[20:10:31] [PASSED] res_bad_y
[20:10:31] [PASSED] res_missing_y_bpp
[20:10:31] [PASSED] res_bad_bpp
[20:10:31] [PASSED] res_bad_refresh
[20:10:31] [PASSED] res_bpp_refresh_force_on_off
[20:10:31] [PASSED] res_invalid_mode
[20:10:31] [PASSED] res_bpp_wrong_place_mode
[20:10:31] [PASSED] name_bpp_refresh
[20:10:31] [PASSED] name_refresh
[20:10:31] [PASSED] name_refresh_wrong_mode
[20:10:31] [PASSED] name_refresh_invalid_mode
[20:10:31] [PASSED] rotate_multiple
[20:10:31] [PASSED] rotate_invalid_val
[20:10:31] [PASSED] rotate_truncated
[20:10:31] [PASSED] invalid_option
[20:10:31] [PASSED] invalid_tv_option
[20:10:31] [PASSED] truncated_tv_option
[20:10:31] ============ [PASSED] drm_test_cmdline_invalid =============
[20:10:31] =============== drm_test_cmdline_tv_options  ===============
[20:10:31] [PASSED] NTSC
[20:10:31] [PASSED] NTSC_443
[20:10:31] [PASSED] NTSC_J
[20:10:31] [PASSED] PAL
[20:10:31] [PASSED] PAL_M
[20:10:31] [PASSED] PAL_N
[20:10:31] [PASSED] SECAM
[20:10:31] =========== [PASSED] drm_test_cmdline_tv_options ===========
[20:10:31] =============== [PASSED] drm_cmdline_parser ================
[20:10:31] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[20:10:31] ========== drm_test_get_tv_mode_from_name_valid  ===========
[20:10:31] [PASSED] NTSC
[20:10:31] [PASSED] NTSC-443
[20:10:31] [PASSED] NTSC-J
[20:10:31] [PASSED] PAL
[20:10:31] [PASSED] PAL-M
[20:10:31] [PASSED] PAL-N
[20:10:31] [PASSED] SECAM
[20:10:31] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[20:10:31] [PASSED] drm_test_get_tv_mode_from_name_truncated
[20:10:31] ============ [PASSED] drm_get_tv_mode_from_name ============
[20:10:31] ============= drm_damage_helper (21 subtests) ==============
[20:10:31] [PASSED] drm_test_damage_iter_no_damage
[20:10:31] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[20:10:31] [PASSED] drm_test_damage_iter_no_damage_src_moved
[20:10:31] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[20:10:31] [PASSED] drm_test_damage_iter_no_damage_not_visible
[20:10:31] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[20:10:31] [PASSED] drm_test_damage_iter_no_damage_no_fb
[20:10:31] [PASSED] drm_test_damage_iter_simple_damage
[20:10:31] [PASSED] drm_test_damage_iter_single_damage
[20:10:31] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[20:10:31] [PASSED] drm_test_damage_iter_single_damage_outside_src
[20:10:31] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[20:10:31] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[20:10:31] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[20:10:31] [PASSED] drm_test_damage_iter_single_damage_src_moved
[20:10:31] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[20:10:31] [PASSED] drm_test_damage_iter_damage
[20:10:31] [PASSED] drm_test_damage_iter_damage_one_intersect
[20:10:31] [PASSED] drm_test_damage_iter_damage_one_outside
[20:10:31] [PASSED] drm_test_damage_iter_damage_src_moved
[20:10:31] [PASSED] drm_test_damage_iter_damage_not_visible
[20:10:31] ================ [PASSED] drm_damage_helper ================
[20:10:31] ============== drm_dp_mst_helper (2 subtests) ==============
[20:10:31] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[20:10:31] [PASSED] Clock 154000 BPP 30 DSC disabled
[20:10:31] [PASSED] Clock 234000 BPP 30 DSC disabled
[20:10:31] [PASSED] Clock 297000 BPP 24 DSC disabled
[20:10:31] [PASSED] Clock 332880 BPP 24 DSC enabled
[20:10:31] [PASSED] Clock 324540 BPP 24 DSC enabled
[20:10:31] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[20:10:31] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[20:10:31] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[20:10:31] [PASSED] DP_POWER_UP_PHY with port number
[20:10:31] [PASSED] DP_POWER_DOWN_PHY with port number
[20:10:31] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[20:10:31] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[20:10:31] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[20:10:31] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[20:10:31] [PASSED] DP_QUERY_PAYLOAD with port number
[20:10:31] [PASSED] DP_QUERY_PAYLOAD with VCPI
[20:10:31] [PASSED] DP_REMOTE_DPCD_READ with port number
[20:10:31] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[20:10:31] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[20:10:31] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[20:10:31] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[20:10:31] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[20:10:31] [PASSED] DP_REMOTE_I2C_READ with port number
[20:10:31] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[20:10:31] [PASSED] DP_REMOTE_I2C_READ with transactions array
[20:10:31] [PASSED] DP_REMOTE_I2C_WRITE with port number
[20:10:31] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[20:10:31] [PASSED] DP_REMOTE_I2C_WRITE with data array
[20:10:31] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[20:10:31] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[20:10:31] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[20:10:31] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[20:10:31] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[20:10:31] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[20:10:31] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[20:10:31] ================ [PASSED] drm_dp_mst_helper ================
[20:10:31] =========== drm_format_helper_test (11 subtests) ===========
[20:10:31] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[20:10:31] [PASSED] single_pixel_source_buffer
[20:10:31] [PASSED] single_pixel_clip_rectangle
[20:10:31] [PASSED] well_known_colors
[20:10:31] [PASSED] destination_pitch
[20:10:31] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[20:10:31] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[20:10:31] [PASSED] single_pixel_source_buffer
[20:10:31] [PASSED] single_pixel_clip_rectangle
[20:10:31] [PASSED] well_known_colors
[20:10:31] [PASSED] destination_pitch
[20:10:31] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[20:10:31] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[20:10:31] [PASSED] single_pixel_source_buffer
[20:10:31] [PASSED] single_pixel_clip_rectangle
[20:10:31] [PASSED] well_known_colors
[20:10:31] [PASSED] destination_pitch
[20:10:31] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[20:10:31] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[20:10:31] [PASSED] single_pixel_source_buffer
[20:10:31] [PASSED] single_pixel_clip_rectangle
[20:10:31] [PASSED] well_known_colors
[20:10:31] [PASSED] destination_pitch
[20:10:31] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[20:10:31] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[20:10:31] [PASSED] single_pixel_source_buffer
[20:10:31] [PASSED] single_pixel_clip_rectangle
[20:10:31] [PASSED] well_known_colors
[20:10:31] [PASSED] destination_pitch
[20:10:31] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[20:10:31] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[20:10:31] [PASSED] single_pixel_source_buffer
[20:10:31] [PASSED] single_pixel_clip_rectangle
[20:10:31] [PASSED] well_known_colors
[20:10:31] [PASSED] destination_pitch
[20:10:31] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[20:10:31] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[20:10:31] [PASSED] single_pixel_source_buffer
[20:10:31] [PASSED] single_pixel_clip_rectangle
[20:10:31] [PASSED] well_known_colors
[20:10:31] [PASSED] destination_pitch
[20:10:31] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[20:10:31] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[20:10:31] [PASSED] single_pixel_source_buffer
[20:10:31] [PASSED] single_pixel_clip_rectangle
[20:10:31] [PASSED] well_known_colors
[20:10:31] [PASSED] destination_pitch
[20:10:31] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[20:10:31] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[20:10:31] [PASSED] single_pixel_source_buffer
[20:10:31] [PASSED] single_pixel_clip_rectangle
[20:10:31] [PASSED] well_known_colors
[20:10:31] [PASSED] destination_pitch
[20:10:31] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[20:10:31] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[20:10:31] [PASSED] single_pixel_source_buffer
[20:10:31] [PASSED] single_pixel_clip_rectangle
[20:10:31] [PASSED] well_known_colors
[20:10:31] [PASSED] destination_pitch
[20:10:31] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[20:10:31] ============== drm_test_fb_xrgb8888_to_mono  ===============
[20:10:31] [PASSED] single_pixel_source_buffer
[20:10:31] [PASSED] single_pixel_clip_rectangle
[20:10:31] [PASSED] well_known_colors
[20:10:31] [PASSED] destination_pitch
[20:10:31] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[20:10:31] ============= [PASSED] drm_format_helper_test ==============
[20:10:31] ================= drm_format (18 subtests) =================
[20:10:31] [PASSED] drm_test_format_block_width_invalid
[20:10:31] [PASSED] drm_test_format_block_width_one_plane
[20:10:31] [PASSED] drm_test_format_block_width_two_plane
[20:10:31] [PASSED] drm_test_format_block_width_three_plane
[20:10:31] [PASSED] drm_test_format_block_width_tiled
[20:10:31] [PASSED] drm_test_format_block_height_invalid
[20:10:31] [PASSED] drm_test_format_block_height_one_plane
[20:10:31] [PASSED] drm_test_format_block_height_two_plane
[20:10:31] [PASSED] drm_test_format_block_height_three_plane
[20:10:31] [PASSED] drm_test_format_block_height_tiled
[20:10:31] [PASSED] drm_test_format_min_pitch_invalid
[20:10:31] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[20:10:31] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[20:10:31] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[20:10:31] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[20:10:31] [PASSED] drm_test_format_min_pitch_two_plane
[20:10:31] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[20:10:31] [PASSED] drm_test_format_min_pitch_tiled
[20:10:31] =================== [PASSED] drm_format ====================
[20:10:31] =============== drm_framebuffer (1 subtest) ================
[20:10:31] =============== drm_test_framebuffer_create  ===============
[20:10:31] [PASSED] ABGR8888 normal sizes
[20:10:31] [PASSED] ABGR8888 max sizes
[20:10:31] [PASSED] ABGR8888 pitch greater than min required
[20:10:31] [PASSED] ABGR8888 pitch less than min required
[20:10:31] [PASSED] ABGR8888 Invalid width
[20:10:31] [PASSED] ABGR8888 Invalid buffer handle
[20:10:31] [PASSED] No pixel format
[20:10:31] [PASSED] ABGR8888 Width 0
[20:10:31] [PASSED] ABGR8888 Height 0
[20:10:31] [PASSED] ABGR8888 Out of bound height * pitch combination
[20:10:31] [PASSED] ABGR8888 Large buffer offset
[20:10:31] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[20:10:31] [PASSED] ABGR8888 Valid buffer modifier
[20:10:31] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[20:10:31] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[20:10:31] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[20:10:31] [PASSED] NV12 Normal sizes
[20:10:31] [PASSED] NV12 Max sizes
[20:10:31] [PASSED] NV12 Invalid pitch
[20:10:31] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[20:10:31] [PASSED] NV12 different  modifier per-plane
[20:10:31] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[20:10:31] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[20:10:31] [PASSED] NV12 Modifier for inexistent plane
[20:10:31] [PASSED] NV12 Handle for inexistent plane
[20:10:31] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[20:10:31] [PASSED] YVU420 Normal sizes
[20:10:31] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[20:10:31] [PASSED] YVU420 Max sizes
[20:10:31] [PASSED] YVU420 Invalid pitch
[20:10:31] [PASSED] YVU420 Different pitches
[20:10:31] [PASSED] YVU420 Different buffer offsets/pitches
[20:10:31] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[20:10:31] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[20:10:31] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[20:10:31] [PASSED] YVU420 Valid modifier
[20:10:31] [PASSED] YVU420 Different modifiers per plane
[20:10:31] [PASSED] YVU420 Modifier for inexistent plane
[20:10:31] [PASSED] X0L2 Normal sizes
[20:10:31] [PASSED] X0L2 Max sizes
[20:10:31] [PASSED] X0L2 Invalid pitch
[20:10:31] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[20:10:31] [PASSED] X0L2 Handle for inexistent plane
[20:10:31] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[20:10:31] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[20:10:31] [PASSED] X0L2 Valid modifier
[20:10:31] [PASSED] X0L2 Modifier for inexistent plane
[20:10:31] =========== [PASSED] drm_test_framebuffer_create ===========
[20:10:31] ================= [PASSED] drm_framebuffer =================
[20:10:31] =============== drm-test-managed (1 subtest) ===============
[20:10:31] [PASSED] drm_test_managed_run_action
[20:10:31] ================ [PASSED] drm-test-managed =================
[20:10:31] =================== drm_mm (19 subtests) ===================
[20:10:31] [PASSED] drm_test_mm_init
[20:10:31] [PASSED] drm_test_mm_debug
[20:10:42] [PASSED] drm_test_mm_reserve
[20:10:52] [PASSED] drm_test_mm_insert
[20:10:53] [PASSED] drm_test_mm_replace
[20:10:53] [PASSED] drm_test_mm_insert_range
[20:10:53] [PASSED] drm_test_mm_frag
[20:10:53] [PASSED] drm_test_mm_align
[20:10:53] [PASSED] drm_test_mm_align32
[20:10:53] [PASSED] drm_test_mm_align64
[20:10:53] [PASSED] drm_test_mm_evict
[20:10:53] [PASSED] drm_test_mm_evict_range
[20:10:53] [PASSED] drm_test_mm_topdown
[20:10:53] [PASSED] drm_test_mm_bottomup
[20:10:53] [PASSED] drm_test_mm_lowest
[20:10:53] [PASSED] drm_test_mm_highest
[20:10:54] [PASSED] drm_test_mm_color
[20:10:55] [PASSED] drm_test_mm_color_evict
[20:10:55] [PASSED] drm_test_mm_color_evict_range
[20:10:55] ===================== [PASSED] drm_mm ======================
[20:10:55] ============= drm_modes_analog_tv (4 subtests) =============
[20:10:55] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[20:10:55] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[20:10:55] [PASSED] drm_test_modes_analog_tv_pal_576i
[20:10:55] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[20:10:55] =============== [PASSED] drm_modes_analog_tv ===============
[20:10:55] ============== drm_plane_helper (2 subtests) ===============
[20:10:55] =============== drm_test_check_plane_state  ================
[20:10:55] [PASSED] clipping_simple
[20:10:55] [PASSED] clipping_rotate_reflect
[20:10:55] [PASSED] positioning_simple
[20:10:55] [PASSED] upscaling
[20:10:55] [PASSED] downscaling
[20:10:55] [PASSED] rounding1
[20:10:55] [PASSED] rounding2
[20:10:55] [PASSED] rounding3
[20:10:55] [PASSED] rounding4
[20:10:55] =========== [PASSED] drm_test_check_plane_state ============
[20:10:55] =========== drm_test_check_invalid_plane_state  ============
[20:10:55] [PASSED] positioning_invalid
[20:10:55] [PASSED] upscaling_invalid
[20:10:55] [PASSED] downscaling_invalid
[20:10:55] ======= [PASSED] drm_test_check_invalid_plane_state ========
[20:10:55] ================ [PASSED] drm_plane_helper =================
[20:10:55] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[20:10:55] ====== drm_test_connector_helper_tv_get_modes_check  =======
[20:10:55] [PASSED] None
[20:10:55] [PASSED] PAL
[20:10:55] [PASSED] NTSC
[20:10:55] [PASSED] Both, NTSC Default
[20:10:55] [PASSED] Both, PAL Default
[20:10:55] [PASSED] Both, NTSC Default, with PAL on command-line
[20:10:55] [PASSED] Both, PAL Default, with NTSC on command-line
[20:10:55] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[20:10:55] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[20:10:55] ================== drm_rect (4 subtests) ===================
[20:10:55] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[20:10:55] [PASSED] drm_test_rect_clip_scaled_not_clipped
[20:10:55] [PASSED] drm_test_rect_clip_scaled_clipped
[20:10:55] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[20:10:55] ==================== [PASSED] drm_rect =====================
[20:10:55] ============================================================
[20:10:55] Testing complete. Ran 294 tests: passed: 294
[20:10:55] Elapsed time: 43.857s total, 1.705s configuring, 18.620s building, 23.494s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


