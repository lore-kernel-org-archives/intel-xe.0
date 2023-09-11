Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2954EE7FF4
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 13:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21A710E2FF;
	Mon, 11 Sep 2023 13:51:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B493210E2FF;
 Mon, 11 Sep 2023 13:51:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B6275AADF3;
 Mon, 11 Sep 2023 13:51:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Date: Mon, 11 Sep 2023 13:51:49 -0000
Message-ID: <169444030974.31368.7913283466686763021@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230911130323.7037-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230911130323.7037-2-janusz.krzysztofik@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/tes?=
 =?utf-8?q?ts=3A_Fix_incorrect_argument_in_drm=5Ftest=5Fmm=5Finsert=5Frang?=
 =?utf-8?q?e?=
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

Series: drm/tests: Fix incorrect argument in drm_test_mm_insert_range
URL   : https://patchwork.freedesktop.org/series/123542/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[13:50:38] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:50:42] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[13:51:02] Starting KUnit Kernel (1/1)...
[13:51:02] ============================================================
[13:51:02] ==================== xe_bo (2 subtests) ====================
[13:51:02] [SKIPPED] xe_ccs_migrate_kunit
[13:51:02] [SKIPPED] xe_bo_evict_kunit
[13:51:02] ===================== [SKIPPED] xe_bo ======================
[13:51:02] ================== xe_dma_buf (1 subtest) ==================
[13:51:02] [SKIPPED] xe_dma_buf_kunit
[13:51:02] =================== [SKIPPED] xe_dma_buf ===================
[13:51:02] ================== xe_migrate (1 subtest) ==================
[13:51:02] [SKIPPED] xe_migrate_sanity_kunit
[13:51:02] =================== [SKIPPED] xe_migrate ===================
[13:51:02] =================== xe_pci (2 subtests) ====================
[13:51:02] [PASSED] xe_gmdid_graphics_ip
[13:51:02] [PASSED] xe_gmdid_media_ip
[13:51:02] ===================== [PASSED] xe_pci ======================
[13:51:02] ==================== xe_rtp (1 subtest) ====================
[13:51:02] ================== xe_rtp_process_tests  ===================
[13:51:02] [PASSED] coalesce-same-reg
[13:51:02] [PASSED] no-match-no-add
[13:51:02] [PASSED] no-match-no-add-multiple-rules
[13:51:02] [PASSED] two-regs-two-entries
[13:51:02] [PASSED] clr-one-set-other
[13:51:02] [PASSED] set-field
[13:51:02] [PASSED] conflict-duplicate
[13:51:02] [PASSED] conflict-not-disjoint
[13:51:02] [PASSED] conflict-reg-type
[13:51:02] ============== [PASSED] xe_rtp_process_tests ===============
[13:51:02] ===================== [PASSED] xe_rtp ======================
[13:51:02] ==================== xe_wa (1 subtest) =====================
[13:51:02] ======================== xe_wa_gt  =========================
[13:51:02] [PASSED] TIGERLAKE (B0)
[13:51:02] [PASSED] DG1 (A0)
[13:51:02] [PASSED] DG1 (B0)
[13:51:02] [PASSED] ALDERLAKE_S (A0)
[13:51:02] [PASSED] ALDERLAKE_S (B0)
[13:51:02] [PASSED] ALDERLAKE_S (C0)
[13:51:02] [PASSED] ALDERLAKE_S (D0)
[13:51:02] [PASSED] ALDERLAKE_P (A0)
[13:51:02] [PASSED] ALDERLAKE_P (B0)
[13:51:02] [PASSED] ALDERLAKE_P (C0)
[13:51:02] [PASSED] DG2_G10 (A0)
[13:51:02] [PASSED] DG2_G10 (A1)
[13:51:02] [PASSED] DG2_G10 (B0)
[13:51:02] [PASSED] DG2_G10 (C0)
[13:51:02] [PASSED] DG2_G11 (A0)
[13:51:02] [PASSED] DG2_G11 (B0)
[13:51:02] [PASSED] DG2_G11 (B1)
[13:51:02] [PASSED] DG2_G12 (A0)
[13:51:02] [PASSED] DG2_G12 (A1)
[13:51:02] [PASSED] PVC (B0)
[13:51:02] [PASSED] PVC (B1)
[13:51:02] [PASSED] PVC (C0)
[13:51:02] ==================== [PASSED] xe_wa_gt =====================
[13:51:02] ====================== [PASSED] xe_wa ======================
[13:51:02] ============================================================
[13:51:02] Testing complete. Ran 37 tests: passed: 33, skipped: 4
[13:51:02] Elapsed time: 24.037s total, 4.240s configuring, 19.678s building, 0.099s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[13:51:02] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:51:04] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[13:51:23] Starting KUnit Kernel (1/1)...
[13:51:23] ============================================================
[13:51:23] ============ drm_test_pick_cmdline (2 subtests) ============
[13:51:23] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[13:51:23] =============== drm_test_pick_cmdline_named  ===============
[13:51:23] [PASSED] NTSC
[13:51:23] [PASSED] NTSC-J
[13:51:23] [PASSED] PAL
[13:51:23] [PASSED] PAL-M
[13:51:23] =========== [PASSED] drm_test_pick_cmdline_named ===========
[13:51:23] ============== [PASSED] drm_test_pick_cmdline ==============
[13:51:23] ================== drm_buddy (6 subtests) ==================
[13:51:23] [PASSED] drm_test_buddy_alloc_limit
[13:51:23] [PASSED] drm_test_buddy_alloc_range
[13:51:23] [PASSED] drm_test_buddy_alloc_optimistic
[13:51:23] [PASSED] drm_test_buddy_alloc_pessimistic
[13:51:23] [PASSED] drm_test_buddy_alloc_smoke
[13:51:23] [PASSED] drm_test_buddy_alloc_pathological
[13:51:23] ==================== [PASSED] drm_buddy ====================
[13:51:23] ============= drm_cmdline_parser (40 subtests) =============
[13:51:23] [PASSED] drm_test_cmdline_force_d_only
[13:51:23] [PASSED] drm_test_cmdline_force_D_only_dvi
[13:51:23] [PASSED] drm_test_cmdline_force_D_only_hdmi
[13:51:23] [PASSED] drm_test_cmdline_force_D_only_not_digital
[13:51:23] [PASSED] drm_test_cmdline_force_e_only
[13:51:23] [PASSED] drm_test_cmdline_res
[13:51:23] [PASSED] drm_test_cmdline_res_vesa
[13:51:23] [PASSED] drm_test_cmdline_res_vesa_rblank
[13:51:23] [PASSED] drm_test_cmdline_res_rblank
[13:51:23] [PASSED] drm_test_cmdline_res_bpp
[13:51:23] [PASSED] drm_test_cmdline_res_refresh
[13:51:23] [PASSED] drm_test_cmdline_res_bpp_refresh
[13:51:23] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[13:51:23] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[13:51:23] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[13:51:23] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[13:51:23] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[13:51:23] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[13:51:23] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[13:51:23] [PASSED] drm_test_cmdline_res_margins_force_on
[13:51:23] [PASSED] drm_test_cmdline_res_vesa_margins
[13:51:23] [PASSED] drm_test_cmdline_name
[13:51:23] [PASSED] drm_test_cmdline_name_bpp
[13:51:23] [PASSED] drm_test_cmdline_name_option
[13:51:23] [PASSED] drm_test_cmdline_name_bpp_option
[13:51:23] [PASSED] drm_test_cmdline_rotate_0
[13:51:23] [PASSED] drm_test_cmdline_rotate_90
[13:51:23] [PASSED] drm_test_cmdline_rotate_180
[13:51:23] [PASSED] drm_test_cmdline_rotate_270
[13:51:23] [PASSED] drm_test_cmdline_hmirror
[13:51:23] [PASSED] drm_test_cmdline_vmirror
[13:51:23] [PASSED] drm_test_cmdline_margin_options
[13:51:23] [PASSED] drm_test_cmdline_multiple_options
[13:51:23] [PASSED] drm_test_cmdline_bpp_extra_and_option
[13:51:23] [PASSED] drm_test_cmdline_extra_and_option
[13:51:23] [PASSED] drm_test_cmdline_freestanding_options
[13:51:23] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[13:51:23] [PASSED] drm_test_cmdline_panel_orientation
[13:51:23] ================ drm_test_cmdline_invalid  =================
[13:51:23] [PASSED] margin_only
[13:51:23] [PASSED] interlace_only
[13:51:23] [PASSED] res_missing_x
[13:51:23] [PASSED] res_missing_y
[13:51:23] [PASSED] res_bad_y
[13:51:23] [PASSED] res_missing_y_bpp
[13:51:23] [PASSED] res_bad_bpp
[13:51:23] [PASSED] res_bad_refresh
[13:51:23] [PASSED] res_bpp_refresh_force_on_off
[13:51:23] [PASSED] res_invalid_mode
[13:51:23] [PASSED] res_bpp_wrong_place_mode
[13:51:23] [PASSED] name_bpp_refresh
[13:51:23] [PASSED] name_refresh
[13:51:23] [PASSED] name_refresh_wrong_mode
[13:51:23] [PASSED] name_refresh_invalid_mode
[13:51:23] [PASSED] rotate_multiple
[13:51:23] [PASSED] rotate_invalid_val
[13:51:23] [PASSED] rotate_truncated
[13:51:23] [PASSED] invalid_option
[13:51:23] [PASSED] invalid_tv_option
[13:51:23] [PASSED] truncated_tv_option
[13:51:23] ============ [PASSED] drm_test_cmdline_invalid =============
[13:51:23] =============== drm_test_cmdline_tv_options  ===============
[13:51:23] [PASSED] NTSC
[13:51:23] [PASSED] NTSC_443
[13:51:23] [PASSED] NTSC_J
[13:51:23] [PASSED] PAL
[13:51:23] [PASSED] PAL_M
[13:51:23] [PASSED] PAL_N
[13:51:23] [PASSED] SECAM
[13:51:23] =========== [PASSED] drm_test_cmdline_tv_options ===========
[13:51:23] =============== [PASSED] drm_cmdline_parser ================
[13:51:23] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[13:51:23] ========== drm_test_get_tv_mode_from_name_valid  ===========
[13:51:23] [PASSED] NTSC
[13:51:23] [PASSED] NTSC-443
[13:51:23] [PASSED] NTSC-J
[13:51:23] [PASSED] PAL
[13:51:23] [PASSED] PAL-M
[13:51:23] [PASSED] PAL-N
[13:51:23] [PASSED] SECAM
[13:51:23] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[13:51:23] [PASSED] drm_test_get_tv_mode_from_name_truncated
[13:51:23] ============ [PASSED] drm_get_tv_mode_from_name ============
[13:51:23] ============= drm_damage_helper (21 subtests) ==============
[13:51:23] [PASSED] drm_test_damage_iter_no_damage
[13:51:23] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[13:51:23] [PASSED] drm_test_damage_iter_no_damage_src_moved
[13:51:23] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[13:51:23] [PASSED] drm_test_damage_iter_no_damage_not_visible
[13:51:23] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[13:51:23] [PASSED] drm_test_damage_iter_no_damage_no_fb
[13:51:23] [PASSED] drm_test_damage_iter_simple_damage
[13:51:23] [PASSED] drm_test_damage_iter_single_damage
[13:51:23] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[13:51:23] [PASSED] drm_test_damage_iter_single_damage_outside_src
[13:51:23] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[13:51:23] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[13:51:23] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[13:51:23] [PASSED] drm_test_damage_iter_single_damage_src_moved
[13:51:23] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[13:51:23] [PASSED] drm_test_damage_iter_damage
[13:51:23] [PASSED] drm_test_damage_iter_damage_one_intersect
[13:51:23] [PASSED] drm_test_damage_iter_damage_one_outside
[13:51:23] [PASSED] drm_test_damage_iter_damage_src_moved
[13:51:23] [PASSED] drm_test_damage_iter_damage_not_visible
[13:51:23] ================ [PASSED] drm_damage_helper ================
[13:51:23] ============== drm_dp_mst_helper (2 subtests) ==============
[13:51:23] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[13:51:23] [PASSED] Clock 154000 BPP 30 DSC disabled
[13:51:23] [PASSED] Clock 234000 BPP 30 DSC disabled
[13:51:23] [PASSED] Clock 297000 BPP 24 DSC disabled
[13:51:23] [PASSED] Clock 332880 BPP 24 DSC enabled
[13:51:23] [PASSED] Clock 324540 BPP 24 DSC enabled
[13:51:23] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[13:51:23] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[13:51:23] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[13:51:23] [PASSED] DP_POWER_UP_PHY with port number
[13:51:23] [PASSED] DP_POWER_DOWN_PHY with port number
[13:51:23] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[13:51:23] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[13:51:23] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[13:51:23] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[13:51:23] [PASSED] DP_QUERY_PAYLOAD with port number
[13:51:23] [PASSED] DP_QUERY_PAYLOAD with VCPI
[13:51:23] [PASSED] DP_REMOTE_DPCD_READ with port number
[13:51:23] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[13:51:23] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[13:51:23] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[13:51:23] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[13:51:23] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[13:51:23] [PASSED] DP_REMOTE_I2C_READ with port number
[13:51:23] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[13:51:23] [PASSED] DP_REMOTE_I2C_READ with transactions array
[13:51:23] [PASSED] DP_REMOTE_I2C_WRITE with port number
[13:51:23] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[13:51:23] [PASSED] DP_REMOTE_I2C_WRITE with data array
[13:51:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[13:51:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[13:51:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[13:51:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[13:51:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[13:51:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[13:51:23] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[13:51:23] ================ [PASSED] drm_dp_mst_helper ================
[13:51:23] =========== drm_format_helper_test (11 subtests) ===========
[13:51:23] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[13:51:23] [PASSED] single_pixel_source_buffer
[13:51:23] [PASSED] single_pixel_clip_rectangle
[13:51:23] [PASSED] well_known_colors
[13:51:23] [PASSED] destination_pitch
[13:51:23] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[13:51:23] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[13:51:23] [PASSED] single_pixel_source_buffer
[13:51:23] [PASSED] single_pixel_clip_rectangle
[13:51:23] [PASSED] well_known_colors
[13:51:23] [PASSED] destination_pitch
[13:51:23] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[13:51:23] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[13:51:23] [PASSED] single_pixel_source_buffer
[13:51:23] [PASSED] single_pixel_clip_rectangle
[13:51:23] [PASSED] well_known_colors
[13:51:23] [PASSED] destination_pitch
[13:51:23] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[13:51:23] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[13:51:23] [PASSED] single_pixel_source_buffer
[13:51:23] [PASSED] single_pixel_clip_rectangle
[13:51:23] [PASSED] well_known_colors
[13:51:23] [PASSED] destination_pitch
[13:51:23] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[13:51:23] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[13:51:23] [PASSED] single_pixel_source_buffer
[13:51:23] [PASSED] single_pixel_clip_rectangle
[13:51:23] [PASSED] well_known_colors
[13:51:23] [PASSED] destination_pitch
[13:51:23] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[13:51:23] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[13:51:23] [PASSED] single_pixel_source_buffer
[13:51:23] [PASSED] single_pixel_clip_rectangle
[13:51:23] [PASSED] well_known_colors
[13:51:23] [PASSED] destination_pitch
[13:51:23] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[13:51:23] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[13:51:23] [PASSED] single_pixel_source_buffer
[13:51:23] [PASSED] single_pixel_clip_rectangle
[13:51:23] [PASSED] well_known_colors
[13:51:23] [PASSED] destination_pitch
[13:51:23] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[13:51:23] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[13:51:23] [PASSED] single_pixel_source_buffer
[13:51:23] [PASSED] single_pixel_clip_rectangle
[13:51:23] [PASSED] well_known_colors
[13:51:23] [PASSED] destination_pitch
[13:51:23] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[13:51:23] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[13:51:23] [PASSED] single_pixel_source_buffer
[13:51:23] [PASSED] single_pixel_clip_rectangle
[13:51:23] [PASSED] well_known_colors
[13:51:23] [PASSED] destination_pitch
[13:51:23] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[13:51:23] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[13:51:23] [PASSED] single_pixel_source_buffer
[13:51:23] [PASSED] single_pixel_clip_rectangle
[13:51:23] [PASSED] well_known_colors
[13:51:23] [PASSED] destination_pitch
[13:51:23] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[13:51:23] ============== drm_test_fb_xrgb8888_to_mono  ===============
[13:51:23] [PASSED] single_pixel_source_buffer
[13:51:23] [PASSED] single_pixel_clip_rectangle
[13:51:23] [PASSED] well_known_colors
[13:51:23] [PASSED] destination_pitch
[13:51:23] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[13:51:23] ============= [PASSED] drm_format_helper_test ==============
[13:51:23] ================= drm_format (18 subtests) =================
[13:51:23] [PASSED] drm_test_format_block_width_invalid
[13:51:23] [PASSED] drm_test_format_block_width_one_plane
[13:51:23] [PASSED] drm_test_format_block_width_two_plane
[13:51:23] [PASSED] drm_test_format_block_width_three_plane
[13:51:23] [PASSED] drm_test_format_block_width_tiled
[13:51:23] [PASSED] drm_test_format_block_height_invalid
[13:51:23] [PASSED] drm_test_format_block_height_one_plane
[13:51:23] [PASSED] drm_test_format_block_height_two_plane
[13:51:23] [PASSED] drm_test_format_block_height_three_plane
[13:51:23] [PASSED] drm_test_format_block_height_tiled
[13:51:23] [PASSED] drm_test_format_min_pitch_invalid
[13:51:23] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[13:51:23] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[13:51:23] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[13:51:23] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[13:51:23] [PASSED] drm_test_format_min_pitch_two_plane
[13:51:23] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[13:51:23] [PASSED] drm_test_format_min_pitch_tiled
[13:51:23] =================== [PASSED] drm_format ====================
[13:51:23] =============== drm_framebuffer (1 subtest) ================
[13:51:23] =============== drm_test_framebuffer_create  ===============
[13:51:23] [PASSED] ABGR8888 normal sizes
[13:51:23] [PASSED] ABGR8888 max sizes
[13:51:23] [PASSED] ABGR8888 pitch greater than min required
[13:51:23] [PASSED] ABGR8888 pitch less than min required
[13:51:23] [PASSED] ABGR8888 Invalid width
[13:51:23] [PASSED] ABGR8888 Invalid buffer handle
[13:51:23] [PASSED] No pixel format
[13:51:23] [PASSED] ABGR8888 Width 0
[13:51:23] [PASSED] ABGR8888 Height 0
[13:51:23] [PASSED] ABGR8888 Out of bound height * pitch combination
[13:51:23] [PASSED] ABGR8888 Large buffer offset
[13:51:23] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[13:51:23] [PASSED] ABGR8888 Valid buffer modifier
[13:51:23] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[13:51:23] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[13:51:23] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[13:51:23] [PASSED] NV12 Normal sizes
[13:51:23] [PASSED] NV12 Max sizes
[13:51:23] [PASSED] NV12 Invalid pitch
[13:51:23] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[13:51:23] [PASSED] NV12 different  modifier per-plane
[13:51:23] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[13:51:23] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[13:51:23] [PASSED] NV12 Modifier for inexistent plane
[13:51:23] [PASSED] NV12 Handle for inexistent plane
[13:51:23] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[13:51:23] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[13:51:23] [PASSED] YVU420 Normal sizes
[13:51:23] [PASSED] YVU420 Max sizes
[13:51:23] [PASSED] YVU420 Invalid pitch
[13:51:23] [PASSED] YVU420 Different pitches
[13:51:23] [PASSED] YVU420 Different buffer offsets/pitches
[13:51:23] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[13:51:23] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[13:51:23] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[13:51:23] [PASSED] YVU420 Valid modifier
[13:51:23] [PASSED] YVU420 Different modifiers per plane
[13:51:23] [PASSED] YVU420 Modifier for inexistent plane
[13:51:23] [PASSED] X0L2 Normal sizes
[13:51:23] [PASSED] X0L2 Max sizes
[13:51:23] [PASSED] X0L2 Invalid pitch
[13:51:23] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[13:51:23] [PASSED] X0L2 Handle for inexistent plane
[13:51:23] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[13:51:23] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[13:51:23] [PASSED] X0L2 Valid modifier
[13:51:23] [PASSED] X0L2 Modifier for inexistent plane
[13:51:23] =========== [PASSED] drm_test_framebuffer_create ===========
[13:51:23] ================= [PASSED] drm_framebuffer =================
[13:51:23] =============== drm-test-managed (1 subtest) ===============
[13:51:23] [PASSED] drm_test_managed_run_action
[13:51:23] ================ [PASSED] drm-test-managed =================
[13:51:23] =================== drm_mm (19 subtests) ===================
[13:51:23] [PASSED] drm_test_mm_init
[13:51:23] [PASSED] drm_test_mm_debug
[13:51:33] [PASSED] drm_test_mm_reserve
[13:51:42] [PASSED] drm_test_mm_insert
[13:51:43] [PASSED] drm_test_mm_replace
[13:51:43] [PASSED] drm_test_mm_insert_range
[13:51:43] [PASSED] drm_test_mm_frag
[13:51:43] [PASSED] drm_test_mm_align
[13:51:43] [PASSED] drm_test_mm_align32
[13:51:43] [PASSED] drm_test_mm_align64
[13:51:44] [PASSED] drm_test_mm_evict
[13:51:44] [PASSED] drm_test_mm_evict_range
[13:51:44] [PASSED] drm_test_mm_topdown
[13:51:44] [PASSED] drm_test_mm_bottomup
[13:51:44] [PASSED] drm_test_mm_lowest
[13:51:44] [PASSED] drm_test_mm_highest
[13:51:45] [PASSED] drm_test_mm_color
[13:51:45] [PASSED] drm_test_mm_color_evict
[13:51:45] [PASSED] drm_test_mm_color_evict_range
[13:51:45] ===================== [PASSED] drm_mm ======================
[13:51:45] ============= drm_modes_analog_tv (4 subtests) =============
[13:51:45] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[13:51:45] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[13:51:45] [PASSED] drm_test_modes_analog_tv_pal_576i
[13:51:45] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[13:51:45] =============== [PASSED] drm_modes_analog_tv ===============
[13:51:45] ============== drm_plane_helper (2 subtests) ===============
[13:51:45] =============== drm_test_check_plane_state  ================
[13:51:45] [PASSED] clipping_simple
[13:51:45] [PASSED] clipping_rotate_reflect
[13:51:45] [PASSED] positioning_simple
[13:51:45] [PASSED] upscaling
[13:51:45] [PASSED] downscaling
[13:51:45] [PASSED] rounding1
[13:51:45] [PASSED] rounding2
[13:51:45] [PASSED] rounding3
[13:51:45] [PASSED] rounding4
[13:51:45] =========== [PASSED] drm_test_check_plane_state ============
[13:51:45] =========== drm_test_check_invalid_plane_state  ============
[13:51:45] [PASSED] positioning_invalid
[13:51:45] [PASSED] upscaling_invalid
[13:51:45] [PASSED] downscaling_invalid
[13:51:45] ======= [PASSED] drm_test_check_invalid_plane_state ========
[13:51:45] ================ [PASSED] drm_plane_helper =================
[13:51:45] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[13:51:45] ====== drm_test_connector_helper_tv_get_modes_check  =======
[13:51:45] [PASSED] None
[13:51:45] [PASSED] PAL
[13:51:45] [PASSED] NTSC
[13:51:45] [PASSED] Both, NTSC Default
[13:51:45] [PASSED] Both, PAL Default
[13:51:45] [PASSED] Both, NTSC Default, with PAL on command-line
[13:51:45] [PASSED] Both, PAL Default, with NTSC on command-line
[13:51:45] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[13:51:45] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[13:51:45] ================== drm_rect (9 subtests) ===================
[13:51:45] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[13:51:45] [PASSED] drm_test_rect_clip_scaled_not_clipped
[13:51:45] [PASSED] drm_test_rect_clip_scaled_clipped
[13:51:45] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[13:51:45] ================= drm_test_rect_intersect  =================
[13:51:45] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[13:51:45] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[13:51:45] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[13:51:45] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[13:51:45] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[13:51:45] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[13:51:45] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[13:51:45] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[13:51:45] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[13:51:45] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[13:51:45] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[13:51:45] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[13:51:45] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[13:51:45] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[13:51:45] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[13:51:45] ============= [PASSED] drm_test_rect_intersect =============
[13:51:45] ================ drm_test_rect_calc_hscale  ================
[13:51:45] [PASSED] normal use
[13:51:45] [PASSED] out of max range
[13:51:45] [PASSED] out of min range
[13:51:45] [PASSED] zero dst
[13:51:45] [PASSED] negative src
[13:51:45] [PASSED] negative dst
[13:51:45] ============ [PASSED] drm_test_rect_calc_hscale ============
[13:51:45] ================ drm_test_rect_calc_vscale  ================
[13:51:45] [PASSED] normal use
[13:51:45] [PASSED] out of max range
[13:51:45] [PASSED] out of min range
[13:51:45] [PASSED] zero dst
[13:51:45] [PASSED] negative src
[13:51:45] [PASSED] negative dst
[13:51:45] ============ [PASSED] drm_test_rect_calc_vscale ============
[13:51:45] ================== drm_test_rect_rotate  ===================
[13:51:45] [PASSED] reflect-x
[13:51:45] [PASSED] reflect-y
[13:51:45] [PASSED] rotate-0
[13:51:45] [PASSED] rotate-90
[13:51:45] [PASSED] rotate-180
[13:51:45] [PASSED] rotate-270
[13:51:45] ============== [PASSED] drm_test_rect_rotate ===============
[13:51:45] ================ drm_test_rect_rotate_inv  =================
[13:51:45] [PASSED] reflect-x
[13:51:45] [PASSED] reflect-y
[13:51:45] [PASSED] rotate-0
[13:51:45] [PASSED] rotate-90
[13:51:45] [PASSED] rotate-180
[13:51:45] [PASSED] rotate-270
[13:51:45] ============ [PASSED] drm_test_rect_rotate_inv =============
[13:51:45] ==================== [PASSED] drm_rect =====================
[13:51:45] ================== drm_exec (7 subtests) ===================
[13:51:45] [PASSED] sanitycheck
[13:51:45] [PASSED] test_lock
[13:51:45] [PASSED] test_lock_unlock
[13:51:45] [PASSED] test_duplicates
[13:51:45] [PASSED] test_prepare
[13:51:45] [PASSED] test_prepare_array
[13:51:45] [PASSED] test_multiple_loops
[13:51:45] ==================== [PASSED] drm_exec =====================
[13:51:45] ============================================================
[13:51:45] Testing complete. Ran 340 tests: passed: 340
[13:51:45] Elapsed time: 43.306s total, 1.687s configuring, 19.190s building, 22.387s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


