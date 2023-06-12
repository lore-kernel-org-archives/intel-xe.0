Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31595C7EE25
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 11:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E729710E206;
	Mon, 12 Jun 2023 11:48:07 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4FAF510E206;
 Mon, 12 Jun 2023 11:48:07 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4C13FA0093;
 Mon, 12 Jun 2023 11:48:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Date: Mon, 12 Jun 2023 11:48:07 -0000
Message-ID: <168657048730.26646.14210699778410219246@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230609143815.302540-1-gustavo.sousa@intel.com>
In-Reply-To: <20230609143815.302540-1-gustavo.sousa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/?=
 =?utf-8?q?reg=5Fsr=3A_Apply_limit_to_register_whitelisting_=28rev3=29?=
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

Series: drm/xe/reg_sr: Apply limit to register whitelisting (rev3)
URL   : https://patchwork.freedesktop.org/series/118400/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[11:46:55] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:46:59] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[11:47:22] Starting KUnit Kernel (1/1)...
[11:47:22] ============================================================
[11:47:22] ==================== xe_bo (2 subtests) ====================
[11:47:22] [SKIPPED] xe_ccs_migrate_kunit
[11:47:22] [SKIPPED] xe_bo_evict_kunit
[11:47:22] ===================== [SKIPPED] xe_bo ======================
[11:47:22] ================== xe_dma_buf (1 subtest) ==================
[11:47:22] [SKIPPED] xe_dma_buf_kunit
[11:47:22] =================== [SKIPPED] xe_dma_buf ===================
[11:47:22] ================== xe_migrate (1 subtest) ==================
[11:47:22] [SKIPPED] xe_migrate_sanity_kunit
[11:47:22] =================== [SKIPPED] xe_migrate ===================
[11:47:22] =================== xe_pci (2 subtests) ====================
[11:47:22] [PASSED] xe_gmdid_graphics_ip
[11:47:22] [PASSED] xe_gmdid_media_ip
[11:47:22] ===================== [PASSED] xe_pci ======================
[11:47:22] ==================== xe_rtp (1 subtest) ====================
[11:47:22] ================== xe_rtp_process_tests  ===================
[11:47:22] [PASSED] coalesce-same-reg
[11:47:22] [PASSED] no-match-no-add
[11:47:22] [PASSED] no-match-no-add-multiple-rules
[11:47:22] [PASSED] two-regs-two-entries
[11:47:22] [PASSED] clr-one-set-other
[11:47:22] [PASSED] set-field
[11:47:22] [PASSED] conflict-duplicate
[11:47:22] [PASSED] conflict-not-disjoint
[11:47:22] [PASSED] conflict-reg-type
[11:47:22] ============== [PASSED] xe_rtp_process_tests ===============
[11:47:22] ===================== [PASSED] xe_rtp ======================
[11:47:22] ==================== xe_wa (1 subtest) =====================
[11:47:22] ======================== xe_wa_gt  =========================
[11:47:22] [PASSED] TIGERLAKE (B0)
[11:47:22] [PASSED] DG1 (A0)
[11:47:22] [PASSED] DG1 (B0)
[11:47:22] [PASSED] ALDERLAKE_S (A0)
[11:47:22] [PASSED] ALDERLAKE_S (B0)
[11:47:22] [PASSED] ALDERLAKE_S (C0)
[11:47:22] [PASSED] ALDERLAKE_S (D0)
[11:47:22] [PASSED] DG2_G10 (A0)
[11:47:22] [PASSED] DG2_G10 (A1)
[11:47:22] [PASSED] DG2_G10 (B0)
[11:47:22] [PASSED] DG2_G10 (C0)
[11:47:22] [PASSED] DG2_G11 (A0)
[11:47:22] [PASSED] DG2_G11 (B0)
[11:47:22] [PASSED] DG2_G11 (B1)
[11:47:22] [PASSED] DG2_G12 (A0)
[11:47:22] [PASSED] DG2_G12 (A1)
[11:47:22] [PASSED] PVC (B0)
[11:47:22] [PASSED] PVC (B1)
[11:47:22] [PASSED] PVC (C0)
[11:47:22] ==================== [PASSED] xe_wa_gt =====================
[11:47:22] ====================== [PASSED] xe_wa ======================
[11:47:22] ============================================================
[11:47:22] Testing complete. Ran 34 tests: passed: 30, skipped: 4
[11:47:22] Elapsed time: 26.386s total, 4.152s configuring, 22.065s building, 0.140s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[11:47:22] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:47:24] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[11:47:42] Starting KUnit Kernel (1/1)...
[11:47:42] ============================================================
[11:47:42] ============ drm_test_pick_cmdline (2 subtests) ============
[11:47:42] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[11:47:42] =============== drm_test_pick_cmdline_named  ===============
[11:47:42] [PASSED] NTSC
[11:47:42] [PASSED] NTSC-J
[11:47:42] [PASSED] PAL
[11:47:42] [PASSED] PAL-M
[11:47:42] =========== [PASSED] drm_test_pick_cmdline_named ===========
[11:47:42] ============== [PASSED] drm_test_pick_cmdline ==============
[11:47:42] ================== drm_buddy (6 subtests) ==================
[11:47:42] [PASSED] drm_test_buddy_alloc_limit
[11:47:42] [PASSED] drm_test_buddy_alloc_range
[11:47:42] [PASSED] drm_test_buddy_alloc_optimistic
[11:47:42] [PASSED] drm_test_buddy_alloc_pessimistic
[11:47:42] [PASSED] drm_test_buddy_alloc_smoke
[11:47:42] [PASSED] drm_test_buddy_alloc_pathological
[11:47:42] ==================== [PASSED] drm_buddy ====================
[11:47:42] ============= drm_cmdline_parser (40 subtests) =============
[11:47:42] [PASSED] drm_test_cmdline_force_d_only
[11:47:42] [PASSED] drm_test_cmdline_force_D_only_dvi
[11:47:42] [PASSED] drm_test_cmdline_force_D_only_hdmi
[11:47:42] [PASSED] drm_test_cmdline_force_D_only_not_digital
[11:47:42] [PASSED] drm_test_cmdline_force_e_only
[11:47:42] [PASSED] drm_test_cmdline_res
[11:47:42] [PASSED] drm_test_cmdline_res_vesa
[11:47:42] [PASSED] drm_test_cmdline_res_vesa_rblank
[11:47:42] [PASSED] drm_test_cmdline_res_rblank
[11:47:42] [PASSED] drm_test_cmdline_res_bpp
[11:47:42] [PASSED] drm_test_cmdline_res_refresh
[11:47:42] [PASSED] drm_test_cmdline_res_bpp_refresh
[11:47:42] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[11:47:42] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[11:47:42] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[11:47:42] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[11:47:42] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[11:47:42] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[11:47:42] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[11:47:42] [PASSED] drm_test_cmdline_res_margins_force_on
[11:47:42] [PASSED] drm_test_cmdline_res_vesa_margins
[11:47:42] [PASSED] drm_test_cmdline_name
[11:47:42] [PASSED] drm_test_cmdline_name_bpp
[11:47:42] [PASSED] drm_test_cmdline_name_option
[11:47:42] [PASSED] drm_test_cmdline_name_bpp_option
[11:47:42] [PASSED] drm_test_cmdline_rotate_0
[11:47:42] [PASSED] drm_test_cmdline_rotate_90
[11:47:42] [PASSED] drm_test_cmdline_rotate_180
[11:47:42] [PASSED] drm_test_cmdline_rotate_270
[11:47:42] [PASSED] drm_test_cmdline_hmirror
[11:47:42] [PASSED] drm_test_cmdline_vmirror
[11:47:42] [PASSED] drm_test_cmdline_margin_options
[11:47:42] [PASSED] drm_test_cmdline_multiple_options
[11:47:42] [PASSED] drm_test_cmdline_bpp_extra_and_option
[11:47:42] [PASSED] drm_test_cmdline_extra_and_option
[11:47:42] [PASSED] drm_test_cmdline_freestanding_options
[11:47:42] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[11:47:42] [PASSED] drm_test_cmdline_panel_orientation
[11:47:42] ================ drm_test_cmdline_invalid  =================
[11:47:42] [PASSED] margin_only
[11:47:42] [PASSED] interlace_only
[11:47:42] [PASSED] res_missing_x
[11:47:42] [PASSED] res_missing_y
[11:47:42] [PASSED] res_bad_y
[11:47:42] [PASSED] res_missing_y_bpp
[11:47:42] [PASSED] res_bad_bpp
[11:47:42] [PASSED] res_bad_refresh
[11:47:42] [PASSED] res_bpp_refresh_force_on_off
[11:47:42] [PASSED] res_invalid_mode
[11:47:42] [PASSED] res_bpp_wrong_place_mode
[11:47:42] [PASSED] name_bpp_refresh
[11:47:42] [PASSED] name_refresh
[11:47:42] [PASSED] name_refresh_wrong_mode
[11:47:42] [PASSED] name_refresh_invalid_mode
[11:47:42] [PASSED] rotate_multiple
[11:47:42] [PASSED] rotate_invalid_val
[11:47:42] [PASSED] rotate_truncated
[11:47:42] [PASSED] invalid_option
[11:47:42] [PASSED] invalid_tv_option
[11:47:42] [PASSED] truncated_tv_option
[11:47:42] ============ [PASSED] drm_test_cmdline_invalid =============
[11:47:42] =============== drm_test_cmdline_tv_options  ===============
[11:47:42] [PASSED] NTSC
[11:47:42] [PASSED] NTSC_443
[11:47:42] [PASSED] NTSC_J
[11:47:42] [PASSED] PAL
[11:47:42] [PASSED] PAL_M
[11:47:42] [PASSED] PAL_N
[11:47:42] [PASSED] SECAM
[11:47:42] =========== [PASSED] drm_test_cmdline_tv_options ===========
[11:47:42] =============== [PASSED] drm_cmdline_parser ================
[11:47:42] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[11:47:42] ========== drm_test_get_tv_mode_from_name_valid  ===========
[11:47:42] [PASSED] NTSC
[11:47:42] [PASSED] NTSC-443
[11:47:42] [PASSED] NTSC-J
[11:47:42] [PASSED] PAL
[11:47:42] [PASSED] PAL-M
[11:47:42] [PASSED] PAL-N
[11:47:42] [PASSED] SECAM
[11:47:42] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[11:47:42] [PASSED] drm_test_get_tv_mode_from_name_truncated
[11:47:42] ============ [PASSED] drm_get_tv_mode_from_name ============
[11:47:42] ============= drm_damage_helper (21 subtests) ==============
[11:47:42] [PASSED] drm_test_damage_iter_no_damage
[11:47:42] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[11:47:42] [PASSED] drm_test_damage_iter_no_damage_src_moved
[11:47:42] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[11:47:42] [PASSED] drm_test_damage_iter_no_damage_not_visible
[11:47:42] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[11:47:42] [PASSED] drm_test_damage_iter_no_damage_no_fb
[11:47:42] [PASSED] drm_test_damage_iter_simple_damage
[11:47:42] [PASSED] drm_test_damage_iter_single_damage
[11:47:42] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[11:47:42] [PASSED] drm_test_damage_iter_single_damage_outside_src
[11:47:42] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[11:47:42] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[11:47:42] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[11:47:42] [PASSED] drm_test_damage_iter_single_damage_src_moved
[11:47:42] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[11:47:42] [PASSED] drm_test_damage_iter_damage
[11:47:42] [PASSED] drm_test_damage_iter_damage_one_intersect
[11:47:42] [PASSED] drm_test_damage_iter_damage_one_outside
[11:47:42] [PASSED] drm_test_damage_iter_damage_src_moved
[11:47:42] [PASSED] drm_test_damage_iter_damage_not_visible
[11:47:42] ================ [PASSED] drm_damage_helper ================
[11:47:42] ============== drm_dp_mst_helper (2 subtests) ==============
[11:47:42] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[11:47:42] [PASSED] Clock 154000 BPP 30 DSC disabled
[11:47:42] [PASSED] Clock 234000 BPP 30 DSC disabled
[11:47:42] [PASSED] Clock 297000 BPP 24 DSC disabled
[11:47:42] [PASSED] Clock 332880 BPP 24 DSC enabled
[11:47:42] [PASSED] Clock 324540 BPP 24 DSC enabled
[11:47:42] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[11:47:42] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[11:47:42] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[11:47:42] [PASSED] DP_POWER_UP_PHY with port number
[11:47:42] [PASSED] DP_POWER_DOWN_PHY with port number
[11:47:42] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[11:47:42] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[11:47:42] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[11:47:42] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[11:47:42] [PASSED] DP_QUERY_PAYLOAD with port number
[11:47:42] [PASSED] DP_QUERY_PAYLOAD with VCPI
[11:47:42] [PASSED] DP_REMOTE_DPCD_READ with port number
[11:47:42] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[11:47:42] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[11:47:42] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[11:47:42] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[11:47:42] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[11:47:42] [PASSED] DP_REMOTE_I2C_READ with port number
[11:47:42] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[11:47:42] [PASSED] DP_REMOTE_I2C_READ with transactions array
[11:47:42] [PASSED] DP_REMOTE_I2C_WRITE with port number
[11:47:42] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[11:47:42] [PASSED] DP_REMOTE_I2C_WRITE with data array
[11:47:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[11:47:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[11:47:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[11:47:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[11:47:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[11:47:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[11:47:42] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[11:47:42] ================ [PASSED] drm_dp_mst_helper ================
[11:47:42] =========== drm_format_helper_test (11 subtests) ===========
[11:47:42] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[11:47:42] [PASSED] single_pixel_source_buffer
[11:47:42] [PASSED] single_pixel_clip_rectangle
[11:47:42] [PASSED] well_known_colors
[11:47:42] [PASSED] destination_pitch
[11:47:42] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[11:47:42] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[11:47:42] [PASSED] single_pixel_source_buffer
[11:47:42] [PASSED] single_pixel_clip_rectangle
[11:47:42] [PASSED] well_known_colors
[11:47:42] [PASSED] destination_pitch
[11:47:42] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[11:47:42] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[11:47:42] [PASSED] single_pixel_source_buffer
[11:47:42] [PASSED] single_pixel_clip_rectangle
[11:47:42] [PASSED] well_known_colors
[11:47:42] [PASSED] destination_pitch
[11:47:42] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[11:47:42] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[11:47:42] [PASSED] single_pixel_source_buffer
[11:47:42] [PASSED] single_pixel_clip_rectangle
[11:47:42] [PASSED] well_known_colors
[11:47:42] [PASSED] destination_pitch
[11:47:42] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[11:47:42] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[11:47:42] [PASSED] single_pixel_source_buffer
[11:47:42] [PASSED] single_pixel_clip_rectangle
[11:47:42] [PASSED] well_known_colors
[11:47:42] [PASSED] destination_pitch
[11:47:42] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[11:47:42] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[11:47:42] [PASSED] single_pixel_source_buffer
[11:47:42] [PASSED] single_pixel_clip_rectangle
[11:47:42] [PASSED] well_known_colors
[11:47:42] [PASSED] destination_pitch
[11:47:42] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[11:47:42] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[11:47:42] [PASSED] single_pixel_source_buffer
[11:47:42] [PASSED] single_pixel_clip_rectangle
[11:47:42] [PASSED] well_known_colors
[11:47:42] [PASSED] destination_pitch
[11:47:42] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[11:47:42] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[11:47:42] [PASSED] single_pixel_source_buffer
[11:47:42] [PASSED] single_pixel_clip_rectangle
[11:47:42] [PASSED] well_known_colors
[11:47:42] [PASSED] destination_pitch
[11:47:42] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[11:47:42] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[11:47:42] [PASSED] single_pixel_source_buffer
[11:47:42] [PASSED] single_pixel_clip_rectangle
[11:47:42] [PASSED] well_known_colors
[11:47:42] [PASSED] destination_pitch
[11:47:42] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[11:47:42] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[11:47:42] [PASSED] single_pixel_source_buffer
[11:47:42] [PASSED] single_pixel_clip_rectangle
[11:47:42] [PASSED] well_known_colors
[11:47:42] [PASSED] destination_pitch
[11:47:42] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[11:47:42] ============== drm_test_fb_xrgb8888_to_mono  ===============
[11:47:42] [PASSED] single_pixel_source_buffer
[11:47:42] [PASSED] single_pixel_clip_rectangle
[11:47:42] [PASSED] well_known_colors
[11:47:42] [PASSED] destination_pitch
[11:47:42] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[11:47:42] ============= [PASSED] drm_format_helper_test ==============
[11:47:42] ================= drm_format (18 subtests) =================
[11:47:42] [PASSED] drm_test_format_block_width_invalid
[11:47:42] [PASSED] drm_test_format_block_width_one_plane
[11:47:42] [PASSED] drm_test_format_block_width_two_plane
[11:47:42] [PASSED] drm_test_format_block_width_three_plane
[11:47:42] [PASSED] drm_test_format_block_width_tiled
[11:47:42] [PASSED] drm_test_format_block_height_invalid
[11:47:42] [PASSED] drm_test_format_block_height_one_plane
[11:47:42] [PASSED] drm_test_format_block_height_two_plane
[11:47:42] [PASSED] drm_test_format_block_height_three_plane
[11:47:42] [PASSED] drm_test_format_block_height_tiled
[11:47:42] [PASSED] drm_test_format_min_pitch_invalid
[11:47:42] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[11:47:42] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[11:47:42] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[11:47:42] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[11:47:42] [PASSED] drm_test_format_min_pitch_two_plane
[11:47:42] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[11:47:42] [PASSED] drm_test_format_min_pitch_tiled
[11:47:42] =================== [PASSED] drm_format ====================
[11:47:42] =============== drm_framebuffer (1 subtest) ================
[11:47:42] =============== drm_test_framebuffer_create  ===============
[11:47:42] [PASSED] ABGR8888 normal sizes
[11:47:42] [PASSED] ABGR8888 max sizes
[11:47:42] [PASSED] ABGR8888 pitch greater than min required
[11:47:42] [PASSED] ABGR8888 pitch less than min required
[11:47:42] [PASSED] ABGR8888 Invalid width
[11:47:42] [PASSED] ABGR8888 Invalid buffer handle
[11:47:42] [PASSED] No pixel format
[11:47:42] [PASSED] ABGR8888 Width 0
[11:47:42] [PASSED] ABGR8888 Height 0
[11:47:42] [PASSED] ABGR8888 Out of bound height * pitch combination
[11:47:42] [PASSED] ABGR8888 Large buffer offset
[11:47:42] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[11:47:42] [PASSED] ABGR8888 Valid buffer modifier
[11:47:42] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[11:47:42] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[11:47:42] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[11:47:42] [PASSED] NV12 Normal sizes
[11:47:42] [PASSED] NV12 Max sizes
[11:47:42] [PASSED] NV12 Invalid pitch
[11:47:42] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[11:47:42] [PASSED] NV12 different  modifier per-plane
[11:47:42] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[11:47:42] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[11:47:42] [PASSED] NV12 Modifier for inexistent plane
[11:47:42] [PASSED] NV12 Handle for inexistent plane
[11:47:42] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[11:47:42] [PASSED] YVU420 Normal sizes
[11:47:42] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[11:47:42] [PASSED] YVU420 Max sizes
[11:47:42] [PASSED] YVU420 Invalid pitch
[11:47:42] [PASSED] YVU420 Different pitches
[11:47:42] [PASSED] YVU420 Different buffer offsets/pitches
[11:47:42] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[11:47:42] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[11:47:42] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[11:47:42] [PASSED] YVU420 Valid modifier
[11:47:42] [PASSED] YVU420 Different modifiers per plane
[11:47:42] [PASSED] YVU420 Modifier for inexistent plane
[11:47:42] [PASSED] X0L2 Normal sizes
[11:47:42] [PASSED] X0L2 Max sizes
[11:47:42] [PASSED] X0L2 Invalid pitch
[11:47:42] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[11:47:42] [PASSED] X0L2 Handle for inexistent plane
[11:47:42] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[11:47:42] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[11:47:42] [PASSED] X0L2 Valid modifier
[11:47:42] [PASSED] X0L2 Modifier for inexistent plane
[11:47:42] =========== [PASSED] drm_test_framebuffer_create ===========
[11:47:42] ================= [PASSED] drm_framebuffer =================
[11:47:42] =============== drm-test-managed (1 subtest) ===============
[11:47:42] [PASSED] drm_test_managed_run_action
[11:47:42] ================ [PASSED] drm-test-managed =================
[11:47:42] =================== drm_mm (19 subtests) ===================
[11:47:42] [PASSED] drm_test_mm_init
[11:47:42] [PASSED] drm_test_mm_debug
[11:47:52] [PASSED] drm_test_mm_reserve
[11:48:02] [PASSED] drm_test_mm_insert
[11:48:03] [PASSED] drm_test_mm_replace
[11:48:03] [PASSED] drm_test_mm_insert_range
[11:48:03] [PASSED] drm_test_mm_frag
[11:48:03] [PASSED] drm_test_mm_align
[11:48:03] [PASSED] drm_test_mm_align32
[11:48:03] [PASSED] drm_test_mm_align64
[11:48:03] [PASSED] drm_test_mm_evict
[11:48:03] [PASSED] drm_test_mm_evict_range
[11:48:03] [PASSED] drm_test_mm_topdown
[11:48:03] [PASSED] drm_test_mm_bottomup
[11:48:03] [PASSED] drm_test_mm_lowest
[11:48:03] [PASSED] drm_test_mm_highest
[11:48:04] [PASSED] drm_test_mm_color
[11:48:05] [PASSED] drm_test_mm_color_evict
[11:48:05] [PASSED] drm_test_mm_color_evict_range
[11:48:05] ===================== [PASSED] drm_mm ======================
[11:48:05] ============= drm_modes_analog_tv (4 subtests) =============
[11:48:05] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[11:48:05] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[11:48:05] [PASSED] drm_test_modes_analog_tv_pal_576i
[11:48:05] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[11:48:05] =============== [PASSED] drm_modes_analog_tv ===============
[11:48:05] ============== drm_plane_helper (2 subtests) ===============
[11:48:05] =============== drm_test_check_plane_state  ================
[11:48:05] [PASSED] clipping_simple
[11:48:05] [PASSED] clipping_rotate_reflect
[11:48:05] [PASSED] positioning_simple
[11:48:05] [PASSED] upscaling
[11:48:05] [PASSED] downscaling
[11:48:05] [PASSED] rounding1
[11:48:05] [PASSED] rounding2
[11:48:05] [PASSED] rounding3
[11:48:05] [PASSED] rounding4
[11:48:05] =========== [PASSED] drm_test_check_plane_state ============
[11:48:05] =========== drm_test_check_invalid_plane_state  ============
[11:48:05] [PASSED] positioning_invalid
[11:48:05] [PASSED] upscaling_invalid
[11:48:05] [PASSED] downscaling_invalid
[11:48:05] ======= [PASSED] drm_test_check_invalid_plane_state ========
[11:48:05] ================ [PASSED] drm_plane_helper =================
[11:48:05] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[11:48:05] ====== drm_test_connector_helper_tv_get_modes_check  =======
[11:48:05] [PASSED] None
[11:48:05] [PASSED] PAL
[11:48:05] [PASSED] NTSC
[11:48:05] [PASSED] Both, NTSC Default
[11:48:05] [PASSED] Both, PAL Default
[11:48:05] [PASSED] Both, NTSC Default, with PAL on command-line
[11:48:05] [PASSED] Both, PAL Default, with NTSC on command-line
[11:48:05] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[11:48:05] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[11:48:05] ================== drm_rect (9 subtests) ===================
[11:48:05] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[11:48:05] [PASSED] drm_test_rect_clip_scaled_not_clipped
[11:48:05] [PASSED] drm_test_rect_clip_scaled_clipped
[11:48:05] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[11:48:05] ================= drm_test_rect_intersect  =================
[11:48:05] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[11:48:05] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[11:48:05] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[11:48:05] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[11:48:05] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[11:48:05] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[11:48:05] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[11:48:05] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[11:48:05] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[11:48:05] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[11:48:05] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[11:48:05] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[11:48:05] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[11:48:05] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[11:48:05] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[11:48:05] ============= [PASSED] drm_test_rect_intersect =============
[11:48:05] ================ drm_test_rect_calc_hscale  ================
[11:48:05] [PASSED] normal use
[11:48:05] [PASSED] out of max range
[11:48:05] [PASSED] out of min range
[11:48:05] [PASSED] zero dst
[11:48:05] [PASSED] negative src
[11:48:05] [PASSED] negative dst
[11:48:05] ============ [PASSED] drm_test_rect_calc_hscale ============
[11:48:05] ================ drm_test_rect_calc_vscale  ================
[11:48:05] [PASSED] normal use
[11:48:05] [PASSED] out of max range
[11:48:05] [PASSED] out of min range
[11:48:05] [PASSED] zero dst
[11:48:05] [PASSED] negative src
[11:48:05] [PASSED] negative dst
[11:48:05] ============ [PASSED] drm_test_rect_calc_vscale ============
[11:48:05] ================== drm_test_rect_rotate  ===================
[11:48:05] [PASSED] reflect-x
[11:48:05] [PASSED] reflect-y
[11:48:05] [PASSED] rotate-0
[11:48:05] [PASSED] rotate-90
[11:48:05] [PASSED] rotate-180
[11:48:05] [PASSED] rotate-270
[11:48:05] ============== [PASSED] drm_test_rect_rotate ===============
[11:48:05] ================ drm_test_rect_rotate_inv  =================
[11:48:05] [PASSED] reflect-x
[11:48:05] [PASSED] reflect-y
[11:48:05] [PASSED] rotate-0
[11:48:05] [PASSED] rotate-90
[11:48:05] [PASSED] rotate-180
[11:48:05] [PASSED] rotate-270
[11:48:05] ============ [PASSED] drm_test_rect_rotate_inv =============
[11:48:05] ==================== [PASSED] drm_rect =====================
[11:48:05] ============================================================
[11:48:05] Testing complete. Ran 333 tests: passed: 333
[11:48:05] Elapsed time: 43.035s total, 1.710s configuring, 18.346s building, 22.951s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


