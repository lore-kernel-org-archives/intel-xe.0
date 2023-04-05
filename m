Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7AAC761A6
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 22:51:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861DB10E2F4;
	Wed,  5 Apr 2023 22:51:40 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id EBD9910E4D8;
 Wed,  5 Apr 2023 22:51:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E7169A9932;
 Wed,  5 Apr 2023 22:51:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 05 Apr 2023 22:51:37 -0000
Message-ID: <168073509794.14699.8432721596890719662@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230405224725.1993719-1-lucas.demarchi@intel.com>
In-Reply-To: <20230405224725.1993719-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe?=
 =?utf-8?q?=3A_Always_log_GuC/HuC_firmware_versions?=
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

Series: drm/xe: Always log GuC/HuC firmware versions
URL   : https://patchwork.freedesktop.org/series/116170/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[22:50:25] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:50:30] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[22:50:51] Starting KUnit Kernel (1/1)...
[22:50:51] ============================================================
[22:50:51] ==================== xe_bo (2 subtests) ====================
[22:50:51] [SKIPPED] xe_ccs_migrate_kunit
[22:50:51] [SKIPPED] xe_bo_evict_kunit
[22:50:51] ===================== [SKIPPED] xe_bo ======================
[22:50:51] ================== xe_dma_buf (1 subtest) ==================
[22:50:51] [SKIPPED] xe_dma_buf_kunit
[22:50:51] =================== [SKIPPED] xe_dma_buf ===================
[22:50:51] ================== xe_migrate (1 subtest) ==================
[22:50:51] [SKIPPED] xe_migrate_sanity_kunit
[22:50:51] =================== [SKIPPED] xe_migrate ===================
[22:50:51] ==================== xe_rtp (1 subtest) ====================
[22:50:51] ================== xe_rtp_process_tests  ===================
[22:50:51] [PASSED] coalesce-same-reg
[22:50:51] [PASSED] no-match-no-add
[22:50:51] [PASSED] no-match-no-add-multiple-rules
[22:50:51] [PASSED] two-regs-two-entries
[22:50:51] [PASSED] clr-one-set-other
[22:50:51] [PASSED] set-field
[22:50:51] [PASSED] conflict-duplicate
[22:50:51] [PASSED] conflict-not-disjoint
[22:50:51] [PASSED] conflict-reg-type
[22:50:51] ============== [PASSED] xe_rtp_process_tests ===============
[22:50:51] ===================== [PASSED] xe_rtp ======================
[22:50:51] ==================== xe_wa (1 subtest) =====================
[22:50:51] ======================== xe_wa_gt  =========================
[22:50:51] [PASSED] TIGERLAKE (B0)
[22:50:51] [PASSED] DG1 (A0)
[22:50:51] [PASSED] DG1 (B0)
[22:50:51] [PASSED] ALDERLAKE_S (A0)
[22:50:51] [PASSED] ALDERLAKE_S (B0)
[22:50:51] [PASSED] ALDERLAKE_S (C0)
[22:50:51] [PASSED] ALDERLAKE_S (D0)
[22:50:51] [PASSED] DG2_G10 (A0)
[22:50:51] [PASSED] DG2_G10 (A1)
[22:50:51] [PASSED] DG2_G10 (B0)
[22:50:51] [PASSED] DG2_G10 (C0)
[22:50:51] [PASSED] DG2_G11 (A0)
[22:50:51] [PASSED] DG2_G11 (B0)
[22:50:51] [PASSED] DG2_G11 (B1)
[22:50:51] [PASSED] DG2_G12 (A0)
[22:50:51] [PASSED] DG2_G12 (A1)
[22:50:51] [PASSED] PVC (B0)
[22:50:51] [PASSED] PVC (B1)
[22:50:51] [PASSED] PVC (C0)
[22:50:51] ==================== [PASSED] xe_wa_gt =====================
[22:50:51] ====================== [PASSED] xe_wa ======================
[22:50:51] ============================================================
[22:50:51] Testing complete. Ran 32 tests: passed: 28, skipped: 4
[22:50:52] Elapsed time: 26.053s total, 4.201s configuring, 21.732s building, 0.098s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[22:50:52] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:50:53] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[22:51:12] Starting KUnit Kernel (1/1)...
[22:51:12] ============================================================
[22:51:12] ============ drm_test_pick_cmdline (2 subtests) ============
[22:51:12] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[22:51:12] =============== drm_test_pick_cmdline_named  ===============
[22:51:12] [PASSED] NTSC
[22:51:12] [PASSED] NTSC-J
[22:51:12] [PASSED] PAL
[22:51:12] [PASSED] PAL-M
[22:51:12] =========== [PASSED] drm_test_pick_cmdline_named ===========
[22:51:12] ============== [PASSED] drm_test_pick_cmdline ==============
[22:51:12] ================== drm_buddy (6 subtests) ==================
[22:51:12] [PASSED] drm_test_buddy_alloc_limit
[22:51:12] [PASSED] drm_test_buddy_alloc_range
[22:51:12] [PASSED] drm_test_buddy_alloc_optimistic
[22:51:12] [PASSED] drm_test_buddy_alloc_pessimistic
[22:51:12] [PASSED] drm_test_buddy_alloc_smoke
[22:51:12] [PASSED] drm_test_buddy_alloc_pathological
[22:51:12] ==================== [PASSED] drm_buddy ====================
[22:51:12] ============= drm_cmdline_parser (40 subtests) =============
[22:51:12] [PASSED] drm_test_cmdline_force_d_only
[22:51:12] [PASSED] drm_test_cmdline_force_D_only_dvi
[22:51:12] [PASSED] drm_test_cmdline_force_D_only_hdmi
[22:51:12] [PASSED] drm_test_cmdline_force_D_only_not_digital
[22:51:12] [PASSED] drm_test_cmdline_force_e_only
[22:51:12] [PASSED] drm_test_cmdline_res
[22:51:12] [PASSED] drm_test_cmdline_res_vesa
[22:51:12] [PASSED] drm_test_cmdline_res_vesa_rblank
[22:51:12] [PASSED] drm_test_cmdline_res_rblank
[22:51:12] [PASSED] drm_test_cmdline_res_bpp
[22:51:12] [PASSED] drm_test_cmdline_res_refresh
[22:51:12] [PASSED] drm_test_cmdline_res_bpp_refresh
[22:51:12] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[22:51:12] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[22:51:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[22:51:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[22:51:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[22:51:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[22:51:12] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[22:51:12] [PASSED] drm_test_cmdline_res_margins_force_on
[22:51:12] [PASSED] drm_test_cmdline_res_vesa_margins
[22:51:12] [PASSED] drm_test_cmdline_name
[22:51:12] [PASSED] drm_test_cmdline_name_bpp
[22:51:12] [PASSED] drm_test_cmdline_name_option
[22:51:12] [PASSED] drm_test_cmdline_name_bpp_option
[22:51:12] [PASSED] drm_test_cmdline_rotate_0
[22:51:12] [PASSED] drm_test_cmdline_rotate_90
[22:51:12] [PASSED] drm_test_cmdline_rotate_180
[22:51:12] [PASSED] drm_test_cmdline_rotate_270
[22:51:12] [PASSED] drm_test_cmdline_hmirror
[22:51:12] [PASSED] drm_test_cmdline_vmirror
[22:51:12] [PASSED] drm_test_cmdline_margin_options
[22:51:12] [PASSED] drm_test_cmdline_multiple_options
[22:51:12] [PASSED] drm_test_cmdline_bpp_extra_and_option
[22:51:12] [PASSED] drm_test_cmdline_extra_and_option
[22:51:12] [PASSED] drm_test_cmdline_freestanding_options
[22:51:12] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[22:51:12] [PASSED] drm_test_cmdline_panel_orientation
[22:51:12] ================ drm_test_cmdline_invalid  =================
[22:51:12] [PASSED] margin_only
[22:51:12] [PASSED] interlace_only
[22:51:12] [PASSED] res_missing_x
[22:51:12] [PASSED] res_missing_y
[22:51:12] [PASSED] res_bad_y
[22:51:12] [PASSED] res_missing_y_bpp
[22:51:12] [PASSED] res_bad_bpp
[22:51:12] [PASSED] res_bad_refresh
[22:51:12] [PASSED] res_bpp_refresh_force_on_off
[22:51:12] [PASSED] res_invalid_mode
[22:51:12] [PASSED] res_bpp_wrong_place_mode
[22:51:12] [PASSED] name_bpp_refresh
[22:51:12] [PASSED] name_refresh
[22:51:12] [PASSED] name_refresh_wrong_mode
[22:51:12] [PASSED] name_refresh_invalid_mode
[22:51:12] [PASSED] rotate_multiple
[22:51:12] [PASSED] rotate_invalid_val
[22:51:12] [PASSED] rotate_truncated
[22:51:12] [PASSED] invalid_option
[22:51:12] [PASSED] invalid_tv_option
[22:51:12] [PASSED] truncated_tv_option
[22:51:12] ============ [PASSED] drm_test_cmdline_invalid =============
[22:51:12] =============== drm_test_cmdline_tv_options  ===============
[22:51:12] [PASSED] NTSC
[22:51:12] [PASSED] NTSC_443
[22:51:12] [PASSED] NTSC_J
[22:51:12] [PASSED] PAL
[22:51:12] [PASSED] PAL_M
[22:51:12] [PASSED] PAL_N
[22:51:12] [PASSED] SECAM
[22:51:12] =========== [PASSED] drm_test_cmdline_tv_options ===========
[22:51:12] =============== [PASSED] drm_cmdline_parser ================
[22:51:12] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[22:51:12] ========== drm_test_get_tv_mode_from_name_valid  ===========
[22:51:12] [PASSED] NTSC
[22:51:12] [PASSED] NTSC-443
[22:51:12] [PASSED] NTSC-J
[22:51:12] [PASSED] PAL
[22:51:12] [PASSED] PAL-M
[22:51:12] [PASSED] PAL-N
[22:51:12] [PASSED] SECAM
[22:51:12] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[22:51:12] [PASSED] drm_test_get_tv_mode_from_name_truncated
[22:51:12] ============ [PASSED] drm_get_tv_mode_from_name ============
[22:51:12] ============= drm_damage_helper (21 subtests) ==============
[22:51:12] [PASSED] drm_test_damage_iter_no_damage
[22:51:12] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[22:51:12] [PASSED] drm_test_damage_iter_no_damage_src_moved
[22:51:12] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[22:51:12] [PASSED] drm_test_damage_iter_no_damage_not_visible
[22:51:12] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[22:51:12] [PASSED] drm_test_damage_iter_no_damage_no_fb
[22:51:12] [PASSED] drm_test_damage_iter_simple_damage
[22:51:12] [PASSED] drm_test_damage_iter_single_damage
[22:51:12] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[22:51:12] [PASSED] drm_test_damage_iter_single_damage_outside_src
[22:51:12] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[22:51:12] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[22:51:12] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[22:51:12] [PASSED] drm_test_damage_iter_single_damage_src_moved
[22:51:12] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[22:51:12] [PASSED] drm_test_damage_iter_damage
[22:51:12] [PASSED] drm_test_damage_iter_damage_one_intersect
[22:51:12] [PASSED] drm_test_damage_iter_damage_one_outside
[22:51:12] [PASSED] drm_test_damage_iter_damage_src_moved
[22:51:12] [PASSED] drm_test_damage_iter_damage_not_visible
[22:51:12] ================ [PASSED] drm_damage_helper ================
[22:51:12] ============== drm_dp_mst_helper (2 subtests) ==============
[22:51:12] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[22:51:12] [PASSED] Clock 154000 BPP 30 DSC disabled
[22:51:12] [PASSED] Clock 234000 BPP 30 DSC disabled
[22:51:12] [PASSED] Clock 297000 BPP 24 DSC disabled
[22:51:12] [PASSED] Clock 332880 BPP 24 DSC enabled
[22:51:12] [PASSED] Clock 324540 BPP 24 DSC enabled
[22:51:12] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[22:51:12] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[22:51:12] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[22:51:12] [PASSED] DP_POWER_UP_PHY with port number
[22:51:12] [PASSED] DP_POWER_DOWN_PHY with port number
[22:51:12] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[22:51:12] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[22:51:12] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[22:51:12] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[22:51:12] [PASSED] DP_QUERY_PAYLOAD with port number
[22:51:12] [PASSED] DP_QUERY_PAYLOAD with VCPI
[22:51:12] [PASSED] DP_REMOTE_DPCD_READ with port number
[22:51:12] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[22:51:12] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[22:51:12] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[22:51:12] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[22:51:12] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[22:51:12] [PASSED] DP_REMOTE_I2C_READ with port number
[22:51:12] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[22:51:12] [PASSED] DP_REMOTE_I2C_READ with transactions array
[22:51:12] [PASSED] DP_REMOTE_I2C_WRITE with port number
[22:51:12] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[22:51:12] [PASSED] DP_REMOTE_I2C_WRITE with data array
[22:51:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[22:51:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[22:51:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[22:51:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[22:51:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[22:51:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[22:51:12] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[22:51:12] ================ [PASSED] drm_dp_mst_helper ================
[22:51:12] =========== drm_format_helper_test (11 subtests) ===========
[22:51:12] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[22:51:12] [PASSED] single_pixel_source_buffer
[22:51:12] [PASSED] single_pixel_clip_rectangle
[22:51:12] [PASSED] well_known_colors
[22:51:12] [PASSED] destination_pitch
[22:51:12] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[22:51:12] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[22:51:12] [PASSED] single_pixel_source_buffer
[22:51:12] [PASSED] single_pixel_clip_rectangle
[22:51:12] [PASSED] well_known_colors
[22:51:12] [PASSED] destination_pitch
[22:51:12] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[22:51:12] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[22:51:12] [PASSED] single_pixel_source_buffer
[22:51:12] [PASSED] single_pixel_clip_rectangle
[22:51:12] [PASSED] well_known_colors
[22:51:12] [PASSED] destination_pitch
[22:51:12] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[22:51:12] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[22:51:12] [PASSED] single_pixel_source_buffer
[22:51:12] [PASSED] single_pixel_clip_rectangle
[22:51:12] [PASSED] well_known_colors
[22:51:12] [PASSED] destination_pitch
[22:51:12] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[22:51:12] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[22:51:12] [PASSED] single_pixel_source_buffer
[22:51:12] [PASSED] single_pixel_clip_rectangle
[22:51:12] [PASSED] well_known_colors
[22:51:12] [PASSED] destination_pitch
[22:51:12] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[22:51:12] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[22:51:12] [PASSED] single_pixel_source_buffer
[22:51:12] [PASSED] single_pixel_clip_rectangle
[22:51:12] [PASSED] well_known_colors
[22:51:12] [PASSED] destination_pitch
[22:51:12] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[22:51:12] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[22:51:12] [PASSED] single_pixel_source_buffer
[22:51:12] [PASSED] single_pixel_clip_rectangle
[22:51:12] [PASSED] well_known_colors
[22:51:12] [PASSED] destination_pitch
[22:51:12] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[22:51:12] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[22:51:12] [PASSED] single_pixel_source_buffer
[22:51:12] [PASSED] single_pixel_clip_rectangle
[22:51:12] [PASSED] well_known_colors
[22:51:12] [PASSED] destination_pitch
[22:51:12] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[22:51:12] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[22:51:12] [PASSED] single_pixel_source_buffer
[22:51:12] [PASSED] single_pixel_clip_rectangle
[22:51:12] [PASSED] well_known_colors
[22:51:12] [PASSED] destination_pitch
[22:51:12] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[22:51:12] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[22:51:12] [PASSED] single_pixel_source_buffer
[22:51:12] [PASSED] single_pixel_clip_rectangle
[22:51:12] [PASSED] well_known_colors
[22:51:12] [PASSED] destination_pitch
[22:51:12] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[22:51:12] ============== drm_test_fb_xrgb8888_to_mono  ===============
[22:51:12] [PASSED] single_pixel_source_buffer
[22:51:12] [PASSED] single_pixel_clip_rectangle
[22:51:12] [PASSED] well_known_colors
[22:51:12] [PASSED] destination_pitch
[22:51:12] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[22:51:12] ============= [PASSED] drm_format_helper_test ==============
[22:51:12] ================= drm_format (18 subtests) =================
[22:51:12] [PASSED] drm_test_format_block_width_invalid
[22:51:12] [PASSED] drm_test_format_block_width_one_plane
[22:51:12] [PASSED] drm_test_format_block_width_two_plane
[22:51:12] [PASSED] drm_test_format_block_width_three_plane
[22:51:12] [PASSED] drm_test_format_block_width_tiled
[22:51:12] [PASSED] drm_test_format_block_height_invalid
[22:51:12] [PASSED] drm_test_format_block_height_one_plane
[22:51:12] [PASSED] drm_test_format_block_height_two_plane
[22:51:12] [PASSED] drm_test_format_block_height_three_plane
[22:51:12] [PASSED] drm_test_format_block_height_tiled
[22:51:12] [PASSED] drm_test_format_min_pitch_invalid
[22:51:12] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[22:51:12] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[22:51:12] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[22:51:12] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[22:51:12] [PASSED] drm_test_format_min_pitch_two_plane
[22:51:12] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[22:51:12] [PASSED] drm_test_format_min_pitch_tiled
[22:51:12] =================== [PASSED] drm_format ====================
[22:51:12] =============== drm_framebuffer (1 subtest) ================
[22:51:12] =============== drm_test_framebuffer_create  ===============
[22:51:12] [PASSED] ABGR8888 normal sizes
[22:51:12] [PASSED] ABGR8888 max sizes
[22:51:12] [PASSED] ABGR8888 pitch greater than min required
[22:51:12] [PASSED] ABGR8888 pitch less than min required
[22:51:12] [PASSED] ABGR8888 Invalid width
[22:51:12] [PASSED] ABGR8888 Invalid buffer handle
[22:51:12] [PASSED] No pixel format
[22:51:12] [PASSED] ABGR8888 Width 0
[22:51:12] [PASSED] ABGR8888 Height 0
[22:51:12] [PASSED] ABGR8888 Out of bound height * pitch combination
[22:51:12] [PASSED] ABGR8888 Large buffer offset
[22:51:12] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[22:51:12] [PASSED] ABGR8888 Valid buffer modifier
[22:51:12] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[22:51:12] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[22:51:12] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[22:51:12] [PASSED] NV12 Normal sizes
[22:51:12] [PASSED] NV12 Max sizes
[22:51:12] [PASSED] NV12 Invalid pitch
[22:51:12] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[22:51:12] [PASSED] NV12 different  modifier per-plane
[22:51:12] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[22:51:12] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[22:51:12] [PASSED] NV12 Modifier for inexistent plane
[22:51:12] [PASSED] NV12 Handle for inexistent plane
[22:51:12] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[22:51:12] [PASSED] YVU420 Normal sizes
[22:51:12] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[22:51:12] [PASSED] YVU420 Max sizes
[22:51:12] [PASSED] YVU420 Invalid pitch
[22:51:12] [PASSED] YVU420 Different pitches
[22:51:12] [PASSED] YVU420 Different buffer offsets/pitches
[22:51:12] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[22:51:12] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[22:51:12] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[22:51:12] [PASSED] YVU420 Valid modifier
[22:51:12] [PASSED] YVU420 Different modifiers per plane
[22:51:12] [PASSED] YVU420 Modifier for inexistent plane
[22:51:12] [PASSED] X0L2 Normal sizes
[22:51:12] [PASSED] X0L2 Max sizes
[22:51:12] [PASSED] X0L2 Invalid pitch
[22:51:12] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[22:51:12] [PASSED] X0L2 Handle for inexistent plane
[22:51:12] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[22:51:12] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[22:51:12] [PASSED] X0L2 Valid modifier
[22:51:12] [PASSED] X0L2 Modifier for inexistent plane
[22:51:12] =========== [PASSED] drm_test_framebuffer_create ===========
[22:51:12] ================= [PASSED] drm_framebuffer =================
[22:51:12] =============== drm-test-managed (1 subtest) ===============
[22:51:12] [PASSED] drm_test_managed_run_action
[22:51:12] ================ [PASSED] drm-test-managed =================
[22:51:12] =================== drm_mm (19 subtests) ===================
[22:51:12] [PASSED] drm_test_mm_init
[22:51:12] [PASSED] drm_test_mm_debug
[22:51:22] [PASSED] drm_test_mm_reserve
[22:51:33] [PASSED] drm_test_mm_insert
[22:51:33] [PASSED] drm_test_mm_replace
[22:51:33] [PASSED] drm_test_mm_insert_range
[22:51:33] [PASSED] drm_test_mm_frag
[22:51:33] [PASSED] drm_test_mm_align
[22:51:33] [PASSED] drm_test_mm_align32
[22:51:34] [PASSED] drm_test_mm_align64
[22:51:34] [PASSED] drm_test_mm_evict
[22:51:34] [PASSED] drm_test_mm_evict_range
[22:51:34] [PASSED] drm_test_mm_topdown
[22:51:34] [PASSED] drm_test_mm_bottomup
[22:51:34] [PASSED] drm_test_mm_lowest
[22:51:34] [PASSED] drm_test_mm_highest
[22:51:35] [PASSED] drm_test_mm_color
[22:51:35] [PASSED] drm_test_mm_color_evict
[22:51:35] [PASSED] drm_test_mm_color_evict_range
[22:51:35] ===================== [PASSED] drm_mm ======================
[22:51:35] ============= drm_modes_analog_tv (4 subtests) =============
[22:51:35] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[22:51:35] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[22:51:35] [PASSED] drm_test_modes_analog_tv_pal_576i
[22:51:35] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[22:51:35] =============== [PASSED] drm_modes_analog_tv ===============
[22:51:35] ============== drm_plane_helper (2 subtests) ===============
[22:51:35] =============== drm_test_check_plane_state  ================
[22:51:35] [PASSED] clipping_simple
[22:51:35] [PASSED] clipping_rotate_reflect
[22:51:35] [PASSED] positioning_simple
[22:51:35] [PASSED] upscaling
[22:51:35] [PASSED] downscaling
[22:51:35] [PASSED] rounding1
[22:51:35] [PASSED] rounding2
[22:51:35] [PASSED] rounding3
[22:51:35] [PASSED] rounding4
[22:51:35] =========== [PASSED] drm_test_check_plane_state ============
[22:51:35] =========== drm_test_check_invalid_plane_state  ============
[22:51:35] [PASSED] positioning_invalid
[22:51:35] [PASSED] upscaling_invalid
[22:51:35] [PASSED] downscaling_invalid
[22:51:35] ======= [PASSED] drm_test_check_invalid_plane_state ========
[22:51:35] ================ [PASSED] drm_plane_helper =================
[22:51:35] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[22:51:35] ====== drm_test_connector_helper_tv_get_modes_check  =======
[22:51:35] [PASSED] None
[22:51:35] [PASSED] PAL
[22:51:35] [PASSED] NTSC
[22:51:35] [PASSED] Both, NTSC Default
[22:51:35] [PASSED] Both, PAL Default
[22:51:35] [PASSED] Both, NTSC Default, with PAL on command-line
[22:51:35] [PASSED] Both, PAL Default, with NTSC on command-line
[22:51:35] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[22:51:35] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[22:51:35] ================== drm_rect (4 subtests) ===================
[22:51:35] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[22:51:35] [PASSED] drm_test_rect_clip_scaled_not_clipped
[22:51:35] [PASSED] drm_test_rect_clip_scaled_clipped
[22:51:35] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[22:51:35] ==================== [PASSED] drm_rect =====================
[22:51:35] ============================================================
[22:51:35] Testing complete. Ran 294 tests: passed: 294
[22:51:35] Elapsed time: 43.863s total, 1.689s configuring, 18.741s building, 23.415s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


