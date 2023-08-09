Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF45EB64DD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 12:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0524110E42E;
	Wed,  9 Aug 2023 12:37:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id F3F1C10E42E;
 Wed,  9 Aug 2023 12:37:03 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F00CEA00E8;
 Wed,  9 Aug 2023 12:37:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kumar Vodapalli" <ravi.kumar.vodapalli@intel.com>
Date: Wed, 09 Aug 2023 12:37:03 -0000
Message-ID: <169158462398.10296.14267657536023129357@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230809120730.383981-1-ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20230809120730.383981-1-ravi.kumar.vodapalli@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Differe?=
 =?utf-8?q?nt_platforms_has_different_PAT_encoding_in_PTE_and_PDE_format?=
 =?utf-8?q?=2C_add_correct_PAT_encoding_for_pre-Xe2_platforms_=28XELP=2C_X?=
 =?utf-8?q?EHPC=2C_XELPG=29=2E?=
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

Series: Different platforms has different PAT encoding in PTE and PDE format, add correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).
URL   : https://patchwork.freedesktop.org/series/122222/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[12:35:51] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:35:56] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[12:36:15] Starting KUnit Kernel (1/1)...
[12:36:15] ============================================================
[12:36:15] ==================== xe_bo (2 subtests) ====================
[12:36:15] [SKIPPED] xe_ccs_migrate_kunit
[12:36:15] [SKIPPED] xe_bo_evict_kunit
[12:36:15] ===================== [SKIPPED] xe_bo ======================
[12:36:15] ================== xe_dma_buf (1 subtest) ==================
[12:36:15] [SKIPPED] xe_dma_buf_kunit
[12:36:15] =================== [SKIPPED] xe_dma_buf ===================
[12:36:15] ================== xe_migrate (1 subtest) ==================
[12:36:15] [SKIPPED] xe_migrate_sanity_kunit
[12:36:15] =================== [SKIPPED] xe_migrate ===================
[12:36:15] =================== xe_pci (2 subtests) ====================
[12:36:15] [PASSED] xe_gmdid_graphics_ip
[12:36:15] [PASSED] xe_gmdid_media_ip
[12:36:15] ===================== [PASSED] xe_pci ======================
[12:36:15] ==================== xe_rtp (1 subtest) ====================
[12:36:15] ================== xe_rtp_process_tests  ===================
[12:36:15] [PASSED] coalesce-same-reg
[12:36:15] [PASSED] no-match-no-add
[12:36:15] [PASSED] no-match-no-add-multiple-rules
[12:36:15] [PASSED] two-regs-two-entries
[12:36:15] [PASSED] clr-one-set-other
[12:36:15] [PASSED] set-field
[12:36:15] [PASSED] conflict-duplicate
[12:36:15] [PASSED] conflict-not-disjoint
[12:36:15] [PASSED] conflict-reg-type
[12:36:15] ============== [PASSED] xe_rtp_process_tests ===============
[12:36:15] ===================== [PASSED] xe_rtp ======================
[12:36:15] ==================== xe_wa (1 subtest) =====================
[12:36:15] ======================== xe_wa_gt  =========================
[12:36:15] [PASSED] TIGERLAKE (B0)
[12:36:15] [PASSED] DG1 (A0)
[12:36:15] [PASSED] DG1 (B0)
[12:36:15] [PASSED] ALDERLAKE_S (A0)
[12:36:15] [PASSED] ALDERLAKE_S (B0)
[12:36:15] [PASSED] ALDERLAKE_S (C0)
[12:36:15] [PASSED] ALDERLAKE_S (D0)
[12:36:15] [PASSED] ALDERLAKE_P (A0)
[12:36:15] [PASSED] ALDERLAKE_P (B0)
[12:36:15] [PASSED] ALDERLAKE_P (C0)
[12:36:15] [PASSED] DG2_G10 (A0)
[12:36:15] [PASSED] DG2_G10 (A1)
[12:36:15] [PASSED] DG2_G10 (B0)
[12:36:15] [PASSED] DG2_G10 (C0)
[12:36:15] [PASSED] DG2_G11 (A0)
[12:36:15] [PASSED] DG2_G11 (B0)
[12:36:15] [PASSED] DG2_G11 (B1)
[12:36:15] [PASSED] DG2_G12 (A0)
[12:36:15] [PASSED] DG2_G12 (A1)
[12:36:15] [PASSED] PVC (B0)
[12:36:15] [PASSED] PVC (B1)
[12:36:15] [PASSED] PVC (C0)
[12:36:15] ==================== [PASSED] xe_wa_gt =====================
[12:36:15] ====================== [PASSED] xe_wa ======================
[12:36:15] ============================================================
[12:36:15] Testing complete. Ran 37 tests: passed: 33, skipped: 4
[12:36:15] Elapsed time: 23.855s total, 4.198s configuring, 19.488s building, 0.136s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[12:36:15] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:36:17] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[12:36:36] Starting KUnit Kernel (1/1)...
[12:36:36] ============================================================
[12:36:36] ============ drm_test_pick_cmdline (2 subtests) ============
[12:36:36] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[12:36:36] =============== drm_test_pick_cmdline_named  ===============
[12:36:36] [PASSED] NTSC
[12:36:36] [PASSED] NTSC-J
[12:36:36] [PASSED] PAL
[12:36:36] [PASSED] PAL-M
[12:36:36] =========== [PASSED] drm_test_pick_cmdline_named ===========
[12:36:36] ============== [PASSED] drm_test_pick_cmdline ==============
[12:36:36] ================== drm_buddy (6 subtests) ==================
[12:36:36] [PASSED] drm_test_buddy_alloc_limit
[12:36:36] [PASSED] drm_test_buddy_alloc_range
[12:36:36] [PASSED] drm_test_buddy_alloc_optimistic
[12:36:36] [PASSED] drm_test_buddy_alloc_pessimistic
[12:36:36] [PASSED] drm_test_buddy_alloc_smoke
[12:36:36] [PASSED] drm_test_buddy_alloc_pathological
[12:36:36] ==================== [PASSED] drm_buddy ====================
[12:36:36] ============= drm_cmdline_parser (40 subtests) =============
[12:36:36] [PASSED] drm_test_cmdline_force_d_only
[12:36:36] [PASSED] drm_test_cmdline_force_D_only_dvi
[12:36:36] [PASSED] drm_test_cmdline_force_D_only_hdmi
[12:36:36] [PASSED] drm_test_cmdline_force_D_only_not_digital
[12:36:36] [PASSED] drm_test_cmdline_force_e_only
[12:36:36] [PASSED] drm_test_cmdline_res
[12:36:36] [PASSED] drm_test_cmdline_res_vesa
[12:36:36] [PASSED] drm_test_cmdline_res_vesa_rblank
[12:36:36] [PASSED] drm_test_cmdline_res_rblank
[12:36:36] [PASSED] drm_test_cmdline_res_bpp
[12:36:36] [PASSED] drm_test_cmdline_res_refresh
[12:36:36] [PASSED] drm_test_cmdline_res_bpp_refresh
[12:36:36] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[12:36:36] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[12:36:36] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[12:36:36] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[12:36:36] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[12:36:36] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[12:36:36] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[12:36:36] [PASSED] drm_test_cmdline_res_margins_force_on
[12:36:36] [PASSED] drm_test_cmdline_res_vesa_margins
[12:36:36] [PASSED] drm_test_cmdline_name
[12:36:36] [PASSED] drm_test_cmdline_name_bpp
[12:36:36] [PASSED] drm_test_cmdline_name_option
[12:36:36] [PASSED] drm_test_cmdline_name_bpp_option
[12:36:36] [PASSED] drm_test_cmdline_rotate_0
[12:36:36] [PASSED] drm_test_cmdline_rotate_90
[12:36:36] [PASSED] drm_test_cmdline_rotate_180
[12:36:36] [PASSED] drm_test_cmdline_rotate_270
[12:36:36] [PASSED] drm_test_cmdline_hmirror
[12:36:36] [PASSED] drm_test_cmdline_vmirror
[12:36:36] [PASSED] drm_test_cmdline_margin_options
[12:36:36] [PASSED] drm_test_cmdline_multiple_options
[12:36:36] [PASSED] drm_test_cmdline_bpp_extra_and_option
[12:36:36] [PASSED] drm_test_cmdline_extra_and_option
[12:36:36] [PASSED] drm_test_cmdline_freestanding_options
[12:36:36] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[12:36:36] [PASSED] drm_test_cmdline_panel_orientation
[12:36:36] ================ drm_test_cmdline_invalid  =================
[12:36:36] [PASSED] margin_only
[12:36:36] [PASSED] interlace_only
[12:36:36] [PASSED] res_missing_x
[12:36:36] [PASSED] res_missing_y
[12:36:36] [PASSED] res_bad_y
[12:36:36] [PASSED] res_missing_y_bpp
[12:36:36] [PASSED] res_bad_bpp
[12:36:36] [PASSED] res_bad_refresh
[12:36:36] [PASSED] res_bpp_refresh_force_on_off
[12:36:36] [PASSED] res_invalid_mode
[12:36:36] [PASSED] res_bpp_wrong_place_mode
[12:36:36] [PASSED] name_bpp_refresh
[12:36:36] [PASSED] name_refresh
[12:36:36] [PASSED] name_refresh_wrong_mode
[12:36:36] [PASSED] name_refresh_invalid_mode
[12:36:36] [PASSED] rotate_multiple
[12:36:36] [PASSED] rotate_invalid_val
[12:36:36] [PASSED] rotate_truncated
[12:36:36] [PASSED] invalid_option
[12:36:36] [PASSED] invalid_tv_option
[12:36:36] [PASSED] truncated_tv_option
[12:36:36] ============ [PASSED] drm_test_cmdline_invalid =============
[12:36:36] =============== drm_test_cmdline_tv_options  ===============
[12:36:36] [PASSED] NTSC
[12:36:36] [PASSED] NTSC_443
[12:36:36] [PASSED] NTSC_J
[12:36:36] [PASSED] PAL
[12:36:36] [PASSED] PAL_M
[12:36:36] [PASSED] PAL_N
[12:36:36] [PASSED] SECAM
[12:36:36] =========== [PASSED] drm_test_cmdline_tv_options ===========
[12:36:36] =============== [PASSED] drm_cmdline_parser ================
[12:36:36] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[12:36:36] ========== drm_test_get_tv_mode_from_name_valid  ===========
[12:36:36] [PASSED] NTSC
[12:36:36] [PASSED] NTSC-443
[12:36:36] [PASSED] NTSC-J
[12:36:36] [PASSED] PAL
[12:36:36] [PASSED] PAL-M
[12:36:36] [PASSED] PAL-N
[12:36:36] [PASSED] SECAM
[12:36:36] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[12:36:36] [PASSED] drm_test_get_tv_mode_from_name_truncated
[12:36:36] ============ [PASSED] drm_get_tv_mode_from_name ============
[12:36:36] ============= drm_damage_helper (21 subtests) ==============
[12:36:36] [PASSED] drm_test_damage_iter_no_damage
[12:36:36] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[12:36:36] [PASSED] drm_test_damage_iter_no_damage_src_moved
[12:36:36] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[12:36:36] [PASSED] drm_test_damage_iter_no_damage_not_visible
[12:36:36] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[12:36:36] [PASSED] drm_test_damage_iter_no_damage_no_fb
[12:36:36] [PASSED] drm_test_damage_iter_simple_damage
[12:36:36] [PASSED] drm_test_damage_iter_single_damage
[12:36:36] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[12:36:36] [PASSED] drm_test_damage_iter_single_damage_outside_src
[12:36:36] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[12:36:36] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[12:36:36] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[12:36:36] [PASSED] drm_test_damage_iter_single_damage_src_moved
[12:36:36] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[12:36:36] [PASSED] drm_test_damage_iter_damage
[12:36:36] [PASSED] drm_test_damage_iter_damage_one_intersect
[12:36:36] [PASSED] drm_test_damage_iter_damage_one_outside
[12:36:36] [PASSED] drm_test_damage_iter_damage_src_moved
[12:36:36] [PASSED] drm_test_damage_iter_damage_not_visible
[12:36:36] ================ [PASSED] drm_damage_helper ================
[12:36:36] ============== drm_dp_mst_helper (2 subtests) ==============
[12:36:36] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[12:36:36] [PASSED] Clock 154000 BPP 30 DSC disabled
[12:36:36] [PASSED] Clock 234000 BPP 30 DSC disabled
[12:36:36] [PASSED] Clock 297000 BPP 24 DSC disabled
[12:36:36] [PASSED] Clock 332880 BPP 24 DSC enabled
[12:36:36] [PASSED] Clock 324540 BPP 24 DSC enabled
[12:36:36] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[12:36:36] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[12:36:36] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[12:36:36] [PASSED] DP_POWER_UP_PHY with port number
[12:36:36] [PASSED] DP_POWER_DOWN_PHY with port number
[12:36:36] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[12:36:36] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[12:36:36] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[12:36:36] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[12:36:36] [PASSED] DP_QUERY_PAYLOAD with port number
[12:36:36] [PASSED] DP_QUERY_PAYLOAD with VCPI
[12:36:36] [PASSED] DP_REMOTE_DPCD_READ with port number
[12:36:36] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[12:36:36] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[12:36:36] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[12:36:36] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[12:36:36] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[12:36:36] [PASSED] DP_REMOTE_I2C_READ with port number
[12:36:36] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[12:36:36] [PASSED] DP_REMOTE_I2C_READ with transactions array
[12:36:36] [PASSED] DP_REMOTE_I2C_WRITE with port number
[12:36:36] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[12:36:36] [PASSED] DP_REMOTE_I2C_WRITE with data array
[12:36:36] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[12:36:36] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[12:36:36] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[12:36:36] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[12:36:36] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[12:36:36] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[12:36:36] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[12:36:36] ================ [PASSED] drm_dp_mst_helper ================
[12:36:36] =========== drm_format_helper_test (11 subtests) ===========
[12:36:36] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[12:36:36] [PASSED] single_pixel_source_buffer
[12:36:36] [PASSED] single_pixel_clip_rectangle
[12:36:36] [PASSED] well_known_colors
[12:36:36] [PASSED] destination_pitch
[12:36:36] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[12:36:36] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[12:36:36] [PASSED] single_pixel_source_buffer
[12:36:36] [PASSED] single_pixel_clip_rectangle
[12:36:36] [PASSED] well_known_colors
[12:36:36] [PASSED] destination_pitch
[12:36:36] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[12:36:36] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[12:36:36] [PASSED] single_pixel_source_buffer
[12:36:36] [PASSED] single_pixel_clip_rectangle
[12:36:36] [PASSED] well_known_colors
[12:36:36] [PASSED] destination_pitch
[12:36:36] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[12:36:36] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[12:36:36] [PASSED] single_pixel_source_buffer
[12:36:36] [PASSED] single_pixel_clip_rectangle
[12:36:36] [PASSED] well_known_colors
[12:36:36] [PASSED] destination_pitch
[12:36:36] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[12:36:36] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[12:36:36] [PASSED] single_pixel_source_buffer
[12:36:36] [PASSED] single_pixel_clip_rectangle
[12:36:36] [PASSED] well_known_colors
[12:36:36] [PASSED] destination_pitch
[12:36:36] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[12:36:36] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[12:36:36] [PASSED] single_pixel_source_buffer
[12:36:36] [PASSED] single_pixel_clip_rectangle
[12:36:36] [PASSED] well_known_colors
[12:36:36] [PASSED] destination_pitch
[12:36:36] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[12:36:36] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[12:36:36] [PASSED] single_pixel_source_buffer
[12:36:36] [PASSED] single_pixel_clip_rectangle
[12:36:36] [PASSED] well_known_colors
[12:36:36] [PASSED] destination_pitch
[12:36:36] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[12:36:36] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[12:36:36] [PASSED] single_pixel_source_buffer
[12:36:36] [PASSED] single_pixel_clip_rectangle
[12:36:36] [PASSED] well_known_colors
[12:36:36] [PASSED] destination_pitch
[12:36:36] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[12:36:36] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[12:36:36] [PASSED] single_pixel_source_buffer
[12:36:36] [PASSED] single_pixel_clip_rectangle
[12:36:36] [PASSED] well_known_colors
[12:36:36] [PASSED] destination_pitch
[12:36:36] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[12:36:36] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[12:36:36] [PASSED] single_pixel_source_buffer
[12:36:36] [PASSED] single_pixel_clip_rectangle
[12:36:36] [PASSED] well_known_colors
[12:36:36] [PASSED] destination_pitch
[12:36:36] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[12:36:36] ============== drm_test_fb_xrgb8888_to_mono  ===============
[12:36:36] [PASSED] single_pixel_source_buffer
[12:36:36] [PASSED] single_pixel_clip_rectangle
[12:36:36] [PASSED] well_known_colors
[12:36:36] [PASSED] destination_pitch
[12:36:36] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[12:36:36] ============= [PASSED] drm_format_helper_test ==============
[12:36:36] ================= drm_format (18 subtests) =================
[12:36:36] [PASSED] drm_test_format_block_width_invalid
[12:36:36] [PASSED] drm_test_format_block_width_one_plane
[12:36:36] [PASSED] drm_test_format_block_width_two_plane
[12:36:36] [PASSED] drm_test_format_block_width_three_plane
[12:36:36] [PASSED] drm_test_format_block_width_tiled
[12:36:36] [PASSED] drm_test_format_block_height_invalid
[12:36:36] [PASSED] drm_test_format_block_height_one_plane
[12:36:36] [PASSED] drm_test_format_block_height_two_plane
[12:36:36] [PASSED] drm_test_format_block_height_three_plane
[12:36:36] [PASSED] drm_test_format_block_height_tiled
[12:36:36] [PASSED] drm_test_format_min_pitch_invalid
[12:36:36] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[12:36:36] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[12:36:36] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[12:36:36] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[12:36:36] [PASSED] drm_test_format_min_pitch_two_plane
[12:36:36] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[12:36:36] [PASSED] drm_test_format_min_pitch_tiled
[12:36:36] =================== [PASSED] drm_format ====================
[12:36:36] =============== drm_framebuffer (1 subtest) ================
[12:36:36] =============== drm_test_framebuffer_create  ===============
[12:36:36] [PASSED] ABGR8888 normal sizes
[12:36:36] [PASSED] ABGR8888 max sizes
[12:36:36] [PASSED] ABGR8888 pitch greater than min required
[12:36:36] [PASSED] ABGR8888 pitch less than min required
[12:36:36] [PASSED] ABGR8888 Invalid width
[12:36:36] [PASSED] ABGR8888 Invalid buffer handle
[12:36:36] [PASSED] No pixel format
[12:36:36] [PASSED] ABGR8888 Width 0
[12:36:36] [PASSED] ABGR8888 Height 0
[12:36:36] [PASSED] ABGR8888 Out of bound height * pitch combination
[12:36:36] [PASSED] ABGR8888 Large buffer offset
[12:36:36] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[12:36:36] [PASSED] ABGR8888 Valid buffer modifier
[12:36:36] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[12:36:36] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[12:36:36] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[12:36:36] [PASSED] NV12 Normal sizes
[12:36:36] [PASSED] NV12 Max sizes
[12:36:36] [PASSED] NV12 Invalid pitch
[12:36:36] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[12:36:36] [PASSED] NV12 different  modifier per-plane
[12:36:36] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[12:36:36] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[12:36:36] [PASSED] NV12 Modifier for inexistent plane
[12:36:36] [PASSED] NV12 Handle for inexistent plane
[12:36:36] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[12:36:36] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[12:36:36] [PASSED] YVU420 Normal sizes
[12:36:36] [PASSED] YVU420 Max sizes
[12:36:36] [PASSED] YVU420 Invalid pitch
[12:36:36] [PASSED] YVU420 Different pitches
[12:36:36] [PASSED] YVU420 Different buffer offsets/pitches
[12:36:36] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[12:36:36] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[12:36:36] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[12:36:36] [PASSED] YVU420 Valid modifier
[12:36:36] [PASSED] YVU420 Different modifiers per plane
[12:36:36] [PASSED] YVU420 Modifier for inexistent plane
[12:36:36] [PASSED] X0L2 Normal sizes
[12:36:36] [PASSED] X0L2 Max sizes
[12:36:36] [PASSED] X0L2 Invalid pitch
[12:36:36] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[12:36:36] [PASSED] X0L2 Handle for inexistent plane
[12:36:36] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[12:36:36] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[12:36:36] [PASSED] X0L2 Valid modifier
[12:36:36] [PASSED] X0L2 Modifier for inexistent plane
[12:36:36] =========== [PASSED] drm_test_framebuffer_create ===========
[12:36:36] ================= [PASSED] drm_framebuffer =================
[12:36:36] =============== drm-test-managed (1 subtest) ===============
[12:36:36] [PASSED] drm_test_managed_run_action
[12:36:36] ================ [PASSED] drm-test-managed =================
[12:36:36] =================== drm_mm (19 subtests) ===================
[12:36:36] [PASSED] drm_test_mm_init
[12:36:36] [PASSED] drm_test_mm_debug
[12:36:46] [PASSED] drm_test_mm_reserve
[12:36:55] [PASSED] drm_test_mm_insert
[12:36:56] [PASSED] drm_test_mm_replace
[12:36:56] [PASSED] drm_test_mm_insert_range
[12:36:56] [PASSED] drm_test_mm_frag
[12:36:56] [PASSED] drm_test_mm_align
[12:36:56] [PASSED] drm_test_mm_align32
[12:36:57] [PASSED] drm_test_mm_align64
[12:36:57] [PASSED] drm_test_mm_evict
[12:36:57] [PASSED] drm_test_mm_evict_range
[12:36:57] [PASSED] drm_test_mm_topdown
[12:36:57] [PASSED] drm_test_mm_bottomup
[12:36:57] [PASSED] drm_test_mm_lowest
[12:36:57] [PASSED] drm_test_mm_highest
[12:36:58] [PASSED] drm_test_mm_color
[12:36:58] [PASSED] drm_test_mm_color_evict
[12:36:58] [PASSED] drm_test_mm_color_evict_range
[12:36:58] ===================== [PASSED] drm_mm ======================
[12:36:58] ============= drm_modes_analog_tv (4 subtests) =============
[12:36:58] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[12:36:58] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[12:36:58] [PASSED] drm_test_modes_analog_tv_pal_576i
[12:36:58] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[12:36:58] =============== [PASSED] drm_modes_analog_tv ===============
[12:36:58] ============== drm_plane_helper (2 subtests) ===============
[12:36:58] =============== drm_test_check_plane_state  ================
[12:36:58] [PASSED] clipping_simple
[12:36:58] [PASSED] clipping_rotate_reflect
[12:36:58] [PASSED] positioning_simple
[12:36:58] [PASSED] upscaling
[12:36:58] [PASSED] downscaling
[12:36:58] [PASSED] rounding1
[12:36:58] [PASSED] rounding2
[12:36:58] [PASSED] rounding3
[12:36:58] [PASSED] rounding4
[12:36:58] =========== [PASSED] drm_test_check_plane_state ============
[12:36:58] =========== drm_test_check_invalid_plane_state  ============
[12:36:58] [PASSED] positioning_invalid
[12:36:58] [PASSED] upscaling_invalid
[12:36:58] [PASSED] downscaling_invalid
[12:36:58] ======= [PASSED] drm_test_check_invalid_plane_state ========
[12:36:58] ================ [PASSED] drm_plane_helper =================
[12:36:58] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[12:36:58] ====== drm_test_connector_helper_tv_get_modes_check  =======
[12:36:58] [PASSED] None
[12:36:58] [PASSED] PAL
[12:36:58] [PASSED] NTSC
[12:36:58] [PASSED] Both, NTSC Default
[12:36:58] [PASSED] Both, PAL Default
[12:36:58] [PASSED] Both, NTSC Default, with PAL on command-line
[12:36:58] [PASSED] Both, PAL Default, with NTSC on command-line
[12:36:58] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[12:36:58] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[12:36:58] ================== drm_rect (9 subtests) ===================
[12:36:58] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[12:36:58] [PASSED] drm_test_rect_clip_scaled_not_clipped
[12:36:58] [PASSED] drm_test_rect_clip_scaled_clipped
[12:36:58] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[12:36:58] ================= drm_test_rect_intersect  =================
[12:36:58] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[12:36:58] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[12:36:58] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[12:36:58] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[12:36:58] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[12:36:58] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[12:36:58] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[12:36:58] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[12:36:58] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[12:36:58] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[12:36:58] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[12:36:58] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[12:36:58] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[12:36:58] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[12:36:58] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[12:36:58] ============= [PASSED] drm_test_rect_intersect =============
[12:36:58] ================ drm_test_rect_calc_hscale  ================
[12:36:58] [PASSED] normal use
[12:36:58] [PASSED] out of max range
[12:36:58] [PASSED] out of min range
[12:36:58] [PASSED] zero dst
[12:36:58] [PASSED] negative src
[12:36:58] [PASSED] negative dst
[12:36:58] ============ [PASSED] drm_test_rect_calc_hscale ============
[12:36:58] ================ drm_test_rect_calc_vscale  ================
[12:36:58] [PASSED] normal use
[12:36:58] [PASSED] out of max range
[12:36:58] [PASSED] out of min range
[12:36:58] [PASSED] zero dst
[12:36:58] [PASSED] negative src
[12:36:58] [PASSED] negative dst
[12:36:58] ============ [PASSED] drm_test_rect_calc_vscale ============
[12:36:58] ================== drm_test_rect_rotate  ===================
[12:36:58] [PASSED] reflect-x
[12:36:58] [PASSED] reflect-y
[12:36:58] [PASSED] rotate-0
[12:36:58] [PASSED] rotate-90
[12:36:58] [PASSED] rotate-180
[12:36:58] [PASSED] rotate-270
[12:36:58] ============== [PASSED] drm_test_rect_rotate ===============
[12:36:58] ================ drm_test_rect_rotate_inv  =================
[12:36:58] [PASSED] reflect-x
[12:36:58] [PASSED] reflect-y
[12:36:58] [PASSED] rotate-0
[12:36:58] [PASSED] rotate-90
[12:36:58] [PASSED] rotate-180
[12:36:58] [PASSED] rotate-270
[12:36:58] ============ [PASSED] drm_test_rect_rotate_inv =============
[12:36:58] ==================== [PASSED] drm_rect =====================
[12:36:58] ============================================================
[12:36:58] Testing complete. Ran 333 tests: passed: 333
[12:36:58] Elapsed time: 43.014s total, 1.697s configuring, 18.688s building, 22.599s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


