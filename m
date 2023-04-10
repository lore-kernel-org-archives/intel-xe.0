Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0D6C77B61
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 18:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED60610E1E2;
	Mon, 10 Apr 2023 18:37:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 67C8E10E220;
 Mon, 10 Apr 2023 18:37:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 63AB7AADE6;
 Mon, 10 Apr 2023 18:37:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Mon, 10 Apr 2023 18:37:17 -0000
Message-ID: <168115183740.22958.10392173629123348635@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230410181438.147117-1-jose.souza@intel.com>
In-Reply-To: <20230410181438.147117-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_series_?=
 =?utf-8?q?starting_with_=5B1/2=5D_drm/i915=3A_Initialize_dkl=5Fphy_spin_l?=
 =?utf-8?q?ock_from_display_code_path?=
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

Series: series starting with [1/2] drm/i915: Initialize dkl_phy spin lock from display code path
URL   : https://patchwork.freedesktop.org/series/116273/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[18:36:05] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:36:09] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[18:36:31] Starting KUnit Kernel (1/1)...
[18:36:31] ============================================================
[18:36:31] ==================== xe_bo (2 subtests) ====================
[18:36:31] [SKIPPED] xe_ccs_migrate_kunit
[18:36:31] [SKIPPED] xe_bo_evict_kunit
[18:36:31] ===================== [SKIPPED] xe_bo ======================
[18:36:31] ================== xe_dma_buf (1 subtest) ==================
[18:36:31] [SKIPPED] xe_dma_buf_kunit
[18:36:31] =================== [SKIPPED] xe_dma_buf ===================
[18:36:31] ================== xe_migrate (1 subtest) ==================
[18:36:31] [SKIPPED] xe_migrate_sanity_kunit
[18:36:31] =================== [SKIPPED] xe_migrate ===================
[18:36:31] =================== xe_pci (2 subtests) ====================
[18:36:31] [PASSED] xe_gmdid_graphics_ip
[18:36:31] [PASSED] xe_gmdid_media_ip
[18:36:31] ===================== [PASSED] xe_pci ======================
[18:36:31] ==================== xe_rtp (1 subtest) ====================
[18:36:31] ================== xe_rtp_process_tests  ===================
[18:36:31] [PASSED] coalesce-same-reg
[18:36:31] [PASSED] no-match-no-add
[18:36:31] [PASSED] no-match-no-add-multiple-rules
[18:36:31] [PASSED] two-regs-two-entries
[18:36:31] [PASSED] clr-one-set-other
[18:36:31] [PASSED] set-field
[18:36:31] [PASSED] conflict-duplicate
[18:36:31] [PASSED] conflict-not-disjoint
[18:36:31] [PASSED] conflict-reg-type
[18:36:31] ============== [PASSED] xe_rtp_process_tests ===============
[18:36:31] ===================== [PASSED] xe_rtp ======================
[18:36:31] ==================== xe_wa (1 subtest) =====================
[18:36:31] ======================== xe_wa_gt  =========================
[18:36:31] [PASSED] TIGERLAKE (B0)
[18:36:31] [PASSED] DG1 (A0)
[18:36:31] [PASSED] DG1 (B0)
[18:36:31] [PASSED] ALDERLAKE_S (A0)
[18:36:31] [PASSED] ALDERLAKE_S (B0)
[18:36:31] [PASSED] ALDERLAKE_S (C0)
[18:36:31] [PASSED] ALDERLAKE_S (D0)
[18:36:31] [PASSED] DG2_G10 (A0)
[18:36:31] [PASSED] DG2_G10 (A1)
[18:36:31] [PASSED] DG2_G10 (B0)
[18:36:31] [PASSED] DG2_G10 (C0)
[18:36:31] [PASSED] DG2_G11 (A0)
[18:36:31] [PASSED] DG2_G11 (B0)
[18:36:31] [PASSED] DG2_G11 (B1)
[18:36:31] [PASSED] DG2_G12 (A0)
[18:36:31] [PASSED] DG2_G12 (A1)
[18:36:31] [PASSED] PVC (B0)
[18:36:31] [PASSED] PVC (B1)
[18:36:31] [PASSED] PVC (C0)
[18:36:31] ==================== [PASSED] xe_wa_gt =====================
[18:36:31] ====================== [PASSED] xe_wa ======================
[18:36:31] ============================================================
[18:36:31] Testing complete. Ran 34 tests: passed: 30, skipped: 4
[18:36:31] Elapsed time: 25.974s total, 4.191s configuring, 21.664s building, 0.099s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[18:36:31] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:36:33] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[18:36:52] Starting KUnit Kernel (1/1)...
[18:36:52] ============================================================
[18:36:52] ============ drm_test_pick_cmdline (2 subtests) ============
[18:36:52] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[18:36:52] =============== drm_test_pick_cmdline_named  ===============
[18:36:52] [PASSED] NTSC
[18:36:52] [PASSED] NTSC-J
[18:36:52] [PASSED] PAL
[18:36:52] [PASSED] PAL-M
[18:36:52] =========== [PASSED] drm_test_pick_cmdline_named ===========
[18:36:52] ============== [PASSED] drm_test_pick_cmdline ==============
[18:36:52] ================== drm_buddy (6 subtests) ==================
[18:36:52] [PASSED] drm_test_buddy_alloc_limit
[18:36:52] [PASSED] drm_test_buddy_alloc_range
[18:36:52] [PASSED] drm_test_buddy_alloc_optimistic
[18:36:52] [PASSED] drm_test_buddy_alloc_pessimistic
[18:36:52] [PASSED] drm_test_buddy_alloc_smoke
[18:36:52] [PASSED] drm_test_buddy_alloc_pathological
[18:36:52] ==================== [PASSED] drm_buddy ====================
[18:36:52] ============= drm_cmdline_parser (40 subtests) =============
[18:36:52] [PASSED] drm_test_cmdline_force_d_only
[18:36:52] [PASSED] drm_test_cmdline_force_D_only_dvi
[18:36:52] [PASSED] drm_test_cmdline_force_D_only_hdmi
[18:36:52] [PASSED] drm_test_cmdline_force_D_only_not_digital
[18:36:52] [PASSED] drm_test_cmdline_force_e_only
[18:36:52] [PASSED] drm_test_cmdline_res
[18:36:52] [PASSED] drm_test_cmdline_res_vesa
[18:36:52] [PASSED] drm_test_cmdline_res_vesa_rblank
[18:36:52] [PASSED] drm_test_cmdline_res_rblank
[18:36:52] [PASSED] drm_test_cmdline_res_bpp
[18:36:52] [PASSED] drm_test_cmdline_res_refresh
[18:36:52] [PASSED] drm_test_cmdline_res_bpp_refresh
[18:36:52] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[18:36:52] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[18:36:52] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[18:36:52] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[18:36:52] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[18:36:52] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[18:36:52] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[18:36:52] [PASSED] drm_test_cmdline_res_margins_force_on
[18:36:52] [PASSED] drm_test_cmdline_res_vesa_margins
[18:36:52] [PASSED] drm_test_cmdline_name
[18:36:52] [PASSED] drm_test_cmdline_name_bpp
[18:36:52] [PASSED] drm_test_cmdline_name_option
[18:36:52] [PASSED] drm_test_cmdline_name_bpp_option
[18:36:52] [PASSED] drm_test_cmdline_rotate_0
[18:36:52] [PASSED] drm_test_cmdline_rotate_90
[18:36:52] [PASSED] drm_test_cmdline_rotate_180
[18:36:52] [PASSED] drm_test_cmdline_rotate_270
[18:36:52] [PASSED] drm_test_cmdline_hmirror
[18:36:52] [PASSED] drm_test_cmdline_vmirror
[18:36:52] [PASSED] drm_test_cmdline_margin_options
[18:36:52] [PASSED] drm_test_cmdline_multiple_options
[18:36:52] [PASSED] drm_test_cmdline_bpp_extra_and_option
[18:36:52] [PASSED] drm_test_cmdline_extra_and_option
[18:36:52] [PASSED] drm_test_cmdline_freestanding_options
[18:36:52] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[18:36:52] [PASSED] drm_test_cmdline_panel_orientation
[18:36:52] ================ drm_test_cmdline_invalid  =================
[18:36:52] [PASSED] margin_only
[18:36:52] [PASSED] interlace_only
[18:36:52] [PASSED] res_missing_x
[18:36:52] [PASSED] res_missing_y
[18:36:52] [PASSED] res_bad_y
[18:36:52] [PASSED] res_missing_y_bpp
[18:36:52] [PASSED] res_bad_bpp
[18:36:52] [PASSED] res_bad_refresh
[18:36:52] [PASSED] res_bpp_refresh_force_on_off
[18:36:52] [PASSED] res_invalid_mode
[18:36:52] [PASSED] res_bpp_wrong_place_mode
[18:36:52] [PASSED] name_bpp_refresh
[18:36:52] [PASSED] name_refresh
[18:36:52] [PASSED] name_refresh_wrong_mode
[18:36:52] [PASSED] name_refresh_invalid_mode
[18:36:52] [PASSED] rotate_multiple
[18:36:52] [PASSED] rotate_invalid_val
[18:36:52] [PASSED] rotate_truncated
[18:36:52] [PASSED] invalid_option
[18:36:52] [PASSED] invalid_tv_option
[18:36:52] [PASSED] truncated_tv_option
[18:36:52] ============ [PASSED] drm_test_cmdline_invalid =============
[18:36:52] =============== drm_test_cmdline_tv_options  ===============
[18:36:52] [PASSED] NTSC
[18:36:52] [PASSED] NTSC_443
[18:36:52] [PASSED] NTSC_J
[18:36:52] [PASSED] PAL
[18:36:52] [PASSED] PAL_M
[18:36:52] [PASSED] PAL_N
[18:36:52] [PASSED] SECAM
[18:36:52] =========== [PASSED] drm_test_cmdline_tv_options ===========
[18:36:52] =============== [PASSED] drm_cmdline_parser ================
[18:36:52] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[18:36:52] ========== drm_test_get_tv_mode_from_name_valid  ===========
[18:36:52] [PASSED] NTSC
[18:36:52] [PASSED] NTSC-443
[18:36:52] [PASSED] NTSC-J
[18:36:52] [PASSED] PAL
[18:36:52] [PASSED] PAL-M
[18:36:52] [PASSED] PAL-N
[18:36:52] [PASSED] SECAM
[18:36:52] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[18:36:52] [PASSED] drm_test_get_tv_mode_from_name_truncated
[18:36:52] ============ [PASSED] drm_get_tv_mode_from_name ============
[18:36:52] ============= drm_damage_helper (21 subtests) ==============
[18:36:52] [PASSED] drm_test_damage_iter_no_damage
[18:36:52] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[18:36:52] [PASSED] drm_test_damage_iter_no_damage_src_moved
[18:36:52] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[18:36:52] [PASSED] drm_test_damage_iter_no_damage_not_visible
[18:36:52] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[18:36:52] [PASSED] drm_test_damage_iter_no_damage_no_fb
[18:36:52] [PASSED] drm_test_damage_iter_simple_damage
[18:36:52] [PASSED] drm_test_damage_iter_single_damage
[18:36:52] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[18:36:52] [PASSED] drm_test_damage_iter_single_damage_outside_src
[18:36:52] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[18:36:52] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[18:36:52] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[18:36:52] [PASSED] drm_test_damage_iter_single_damage_src_moved
[18:36:52] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[18:36:52] [PASSED] drm_test_damage_iter_damage
[18:36:52] [PASSED] drm_test_damage_iter_damage_one_intersect
[18:36:52] [PASSED] drm_test_damage_iter_damage_one_outside
[18:36:52] [PASSED] drm_test_damage_iter_damage_src_moved
[18:36:52] [PASSED] drm_test_damage_iter_damage_not_visible
[18:36:52] ================ [PASSED] drm_damage_helper ================
[18:36:52] ============== drm_dp_mst_helper (2 subtests) ==============
[18:36:52] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[18:36:52] [PASSED] Clock 154000 BPP 30 DSC disabled
[18:36:52] [PASSED] Clock 234000 BPP 30 DSC disabled
[18:36:52] [PASSED] Clock 297000 BPP 24 DSC disabled
[18:36:52] [PASSED] Clock 332880 BPP 24 DSC enabled
[18:36:52] [PASSED] Clock 324540 BPP 24 DSC enabled
[18:36:52] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[18:36:52] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[18:36:52] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[18:36:52] [PASSED] DP_POWER_UP_PHY with port number
[18:36:52] [PASSED] DP_POWER_DOWN_PHY with port number
[18:36:52] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[18:36:52] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[18:36:52] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[18:36:52] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[18:36:52] [PASSED] DP_QUERY_PAYLOAD with port number
[18:36:52] [PASSED] DP_QUERY_PAYLOAD with VCPI
[18:36:52] [PASSED] DP_REMOTE_DPCD_READ with port number
[18:36:52] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[18:36:52] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[18:36:52] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[18:36:52] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[18:36:52] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[18:36:52] [PASSED] DP_REMOTE_I2C_READ with port number
[18:36:52] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[18:36:52] [PASSED] DP_REMOTE_I2C_READ with transactions array
[18:36:52] [PASSED] DP_REMOTE_I2C_WRITE with port number
[18:36:52] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[18:36:52] [PASSED] DP_REMOTE_I2C_WRITE with data array
[18:36:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[18:36:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[18:36:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[18:36:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[18:36:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[18:36:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[18:36:52] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[18:36:52] ================ [PASSED] drm_dp_mst_helper ================
[18:36:52] =========== drm_format_helper_test (11 subtests) ===========
[18:36:52] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[18:36:52] [PASSED] single_pixel_source_buffer
[18:36:52] [PASSED] single_pixel_clip_rectangle
[18:36:52] [PASSED] well_known_colors
[18:36:52] [PASSED] destination_pitch
[18:36:52] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[18:36:52] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[18:36:52] [PASSED] single_pixel_source_buffer
[18:36:52] [PASSED] single_pixel_clip_rectangle
[18:36:52] [PASSED] well_known_colors
[18:36:52] [PASSED] destination_pitch
[18:36:52] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[18:36:52] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[18:36:52] [PASSED] single_pixel_source_buffer
[18:36:52] [PASSED] single_pixel_clip_rectangle
[18:36:52] [PASSED] well_known_colors
[18:36:52] [PASSED] destination_pitch
[18:36:52] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[18:36:52] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[18:36:52] [PASSED] single_pixel_source_buffer
[18:36:52] [PASSED] single_pixel_clip_rectangle
[18:36:52] [PASSED] well_known_colors
[18:36:52] [PASSED] destination_pitch
[18:36:52] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[18:36:52] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[18:36:52] [PASSED] single_pixel_source_buffer
[18:36:52] [PASSED] single_pixel_clip_rectangle
[18:36:52] [PASSED] well_known_colors
[18:36:52] [PASSED] destination_pitch
[18:36:52] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[18:36:52] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[18:36:52] [PASSED] single_pixel_source_buffer
[18:36:52] [PASSED] single_pixel_clip_rectangle
[18:36:52] [PASSED] well_known_colors
[18:36:52] [PASSED] destination_pitch
[18:36:52] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[18:36:52] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[18:36:52] [PASSED] single_pixel_source_buffer
[18:36:52] [PASSED] single_pixel_clip_rectangle
[18:36:52] [PASSED] well_known_colors
[18:36:52] [PASSED] destination_pitch
[18:36:52] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[18:36:52] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[18:36:52] [PASSED] single_pixel_source_buffer
[18:36:52] [PASSED] single_pixel_clip_rectangle
[18:36:52] [PASSED] well_known_colors
[18:36:52] [PASSED] destination_pitch
[18:36:52] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[18:36:52] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[18:36:52] [PASSED] single_pixel_source_buffer
[18:36:52] [PASSED] single_pixel_clip_rectangle
[18:36:52] [PASSED] well_known_colors
[18:36:52] [PASSED] destination_pitch
[18:36:52] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[18:36:52] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[18:36:52] [PASSED] single_pixel_source_buffer
[18:36:52] [PASSED] single_pixel_clip_rectangle
[18:36:52] [PASSED] well_known_colors
[18:36:52] [PASSED] destination_pitch
[18:36:52] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[18:36:52] ============== drm_test_fb_xrgb8888_to_mono  ===============
[18:36:52] [PASSED] single_pixel_source_buffer
[18:36:52] [PASSED] single_pixel_clip_rectangle
[18:36:52] [PASSED] well_known_colors
[18:36:52] [PASSED] destination_pitch
[18:36:52] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[18:36:52] ============= [PASSED] drm_format_helper_test ==============
[18:36:52] ================= drm_format (18 subtests) =================
[18:36:52] [PASSED] drm_test_format_block_width_invalid
[18:36:52] [PASSED] drm_test_format_block_width_one_plane
[18:36:52] [PASSED] drm_test_format_block_width_two_plane
[18:36:52] [PASSED] drm_test_format_block_width_three_plane
[18:36:52] [PASSED] drm_test_format_block_width_tiled
[18:36:52] [PASSED] drm_test_format_block_height_invalid
[18:36:52] [PASSED] drm_test_format_block_height_one_plane
[18:36:52] [PASSED] drm_test_format_block_height_two_plane
[18:36:52] [PASSED] drm_test_format_block_height_three_plane
[18:36:52] [PASSED] drm_test_format_block_height_tiled
[18:36:52] [PASSED] drm_test_format_min_pitch_invalid
[18:36:52] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[18:36:52] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[18:36:52] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[18:36:52] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[18:36:52] [PASSED] drm_test_format_min_pitch_two_plane
[18:36:52] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[18:36:52] [PASSED] drm_test_format_min_pitch_tiled
[18:36:52] =================== [PASSED] drm_format ====================
[18:36:52] =============== drm_framebuffer (1 subtest) ================
[18:36:52] =============== drm_test_framebuffer_create  ===============
[18:36:52] [PASSED] ABGR8888 normal sizes
[18:36:52] [PASSED] ABGR8888 max sizes
[18:36:52] [PASSED] ABGR8888 pitch greater than min required
[18:36:52] [PASSED] ABGR8888 pitch less than min required
[18:36:52] [PASSED] ABGR8888 Invalid width
[18:36:52] [PASSED] ABGR8888 Invalid buffer handle
[18:36:52] [PASSED] No pixel format
[18:36:52] [PASSED] ABGR8888 Width 0
[18:36:52] [PASSED] ABGR8888 Height 0
[18:36:52] [PASSED] ABGR8888 Out of bound height * pitch combination
[18:36:52] [PASSED] ABGR8888 Large buffer offset
[18:36:52] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[18:36:52] [PASSED] ABGR8888 Valid buffer modifier
[18:36:52] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[18:36:52] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[18:36:52] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[18:36:52] [PASSED] NV12 Normal sizes
[18:36:52] [PASSED] NV12 Max sizes
[18:36:52] [PASSED] NV12 Invalid pitch
[18:36:52] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[18:36:52] [PASSED] NV12 different  modifier per-plane
[18:36:52] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[18:36:52] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[18:36:52] [PASSED] NV12 Modifier for inexistent plane
[18:36:52] [PASSED] NV12 Handle for inexistent plane
[18:36:52] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[18:36:52] [PASSED] YVU420 Normal sizes
[18:36:52] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[18:36:52] [PASSED] YVU420 Max sizes
[18:36:52] [PASSED] YVU420 Invalid pitch
[18:36:52] [PASSED] YVU420 Different pitches
[18:36:52] [PASSED] YVU420 Different buffer offsets/pitches
[18:36:52] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[18:36:52] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[18:36:52] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[18:36:52] [PASSED] YVU420 Valid modifier
[18:36:52] [PASSED] YVU420 Different modifiers per plane
[18:36:52] [PASSED] YVU420 Modifier for inexistent plane
[18:36:52] [PASSED] X0L2 Normal sizes
[18:36:52] [PASSED] X0L2 Max sizes
[18:36:52] [PASSED] X0L2 Invalid pitch
[18:36:52] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[18:36:52] [PASSED] X0L2 Handle for inexistent plane
[18:36:52] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[18:36:52] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[18:36:52] [PASSED] X0L2 Valid modifier
[18:36:52] [PASSED] X0L2 Modifier for inexistent plane
[18:36:52] =========== [PASSED] drm_test_framebuffer_create ===========
[18:36:52] ================= [PASSED] drm_framebuffer =================
[18:36:52] =============== drm-test-managed (1 subtest) ===============
[18:36:52] [PASSED] drm_test_managed_run_action
[18:36:52] ================ [PASSED] drm-test-managed =================
[18:36:52] =================== drm_mm (19 subtests) ===================
[18:36:52] [PASSED] drm_test_mm_init
[18:36:52] [PASSED] drm_test_mm_debug
[18:37:02] [PASSED] drm_test_mm_reserve
[18:37:11] [PASSED] drm_test_mm_insert
[18:37:12] [PASSED] drm_test_mm_replace
[18:37:12] [PASSED] drm_test_mm_insert_range
[18:37:12] [PASSED] drm_test_mm_frag
[18:37:12] [PASSED] drm_test_mm_align
[18:37:12] [PASSED] drm_test_mm_align32
[18:37:13] [PASSED] drm_test_mm_align64
[18:37:13] [PASSED] drm_test_mm_evict
[18:37:13] [PASSED] drm_test_mm_evict_range
[18:37:13] [PASSED] drm_test_mm_topdown
[18:37:13] [PASSED] drm_test_mm_bottomup
[18:37:13] [PASSED] drm_test_mm_lowest
[18:37:13] [PASSED] drm_test_mm_highest
[18:37:14] [PASSED] drm_test_mm_color
[18:37:14] [PASSED] drm_test_mm_color_evict
[18:37:14] [PASSED] drm_test_mm_color_evict_range
[18:37:14] ===================== [PASSED] drm_mm ======================
[18:37:14] ============= drm_modes_analog_tv (4 subtests) =============
[18:37:14] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[18:37:14] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[18:37:14] [PASSED] drm_test_modes_analog_tv_pal_576i
[18:37:14] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[18:37:14] =============== [PASSED] drm_modes_analog_tv ===============
[18:37:14] ============== drm_plane_helper (2 subtests) ===============
[18:37:14] =============== drm_test_check_plane_state  ================
[18:37:14] [PASSED] clipping_simple
[18:37:14] [PASSED] clipping_rotate_reflect
[18:37:14] [PASSED] positioning_simple
[18:37:14] [PASSED] upscaling
[18:37:14] [PASSED] downscaling
[18:37:14] [PASSED] rounding1
[18:37:14] [PASSED] rounding2
[18:37:14] [PASSED] rounding3
[18:37:14] [PASSED] rounding4
[18:37:14] =========== [PASSED] drm_test_check_plane_state ============
[18:37:14] =========== drm_test_check_invalid_plane_state  ============
[18:37:14] [PASSED] positioning_invalid
[18:37:14] [PASSED] upscaling_invalid
[18:37:14] [PASSED] downscaling_invalid
[18:37:14] ======= [PASSED] drm_test_check_invalid_plane_state ========
[18:37:14] ================ [PASSED] drm_plane_helper =================
[18:37:14] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[18:37:14] ====== drm_test_connector_helper_tv_get_modes_check  =======
[18:37:14] [PASSED] None
[18:37:14] [PASSED] PAL
[18:37:14] [PASSED] NTSC
[18:37:14] [PASSED] Both, NTSC Default
[18:37:14] [PASSED] Both, PAL Default
[18:37:14] [PASSED] Both, NTSC Default, with PAL on command-line
[18:37:14] [PASSED] Both, PAL Default, with NTSC on command-line
[18:37:14] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[18:37:14] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[18:37:14] ================== drm_rect (4 subtests) ===================
[18:37:14] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[18:37:14] [PASSED] drm_test_rect_clip_scaled_not_clipped
[18:37:14] [PASSED] drm_test_rect_clip_scaled_clipped
[18:37:14] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[18:37:14] ==================== [PASSED] drm_rect =====================
[18:37:14] ============================================================
[18:37:14] Testing complete. Ran 294 tests: passed: 294
[18:37:14] Elapsed time: 43.069s total, 1.698s configuring, 18.641s building, 22.727s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


