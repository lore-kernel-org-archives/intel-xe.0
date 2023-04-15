Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEACC7619A
	for <intel-xe@archiver.kernel.org>; Sat, 15 Apr 2023 04:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC8210E21D;
	Sat, 15 Apr 2023 04:12:37 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1652710E06B;
 Sat, 15 Apr 2023 04:12:36 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 130D2AADE0;
 Sat, 15 Apr 2023 04:12:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Sat, 15 Apr 2023 04:12:36 -0000
Message-ID: <168153195607.19223.10220169992277924961@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230415040906.13230-1-jose.souza@intel.com>
In-Reply-To: <20230415040906.13230-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_series_?=
 =?utf-8?q?starting_with_=5B1/2=5D_drm/xe=3A_Set_default_MOCS_value_for_cs?=
 =?utf-8?q?_instructions?=
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

Series: series starting with [1/2] drm/xe: Set default MOCS value for cs instructions
URL   : https://patchwork.freedesktop.org/series/116520/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[04:11:24] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:11:28] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[04:11:50] Starting KUnit Kernel (1/1)...
[04:11:50] ============================================================
[04:11:50] ==================== xe_bo (2 subtests) ====================
[04:11:50] [SKIPPED] xe_ccs_migrate_kunit
[04:11:50] [SKIPPED] xe_bo_evict_kunit
[04:11:50] ===================== [SKIPPED] xe_bo ======================
[04:11:50] ================== xe_dma_buf (1 subtest) ==================
[04:11:50] [SKIPPED] xe_dma_buf_kunit
[04:11:50] =================== [SKIPPED] xe_dma_buf ===================
[04:11:50] ================== xe_migrate (1 subtest) ==================
[04:11:50] [SKIPPED] xe_migrate_sanity_kunit
[04:11:50] =================== [SKIPPED] xe_migrate ===================
[04:11:50] =================== xe_pci (2 subtests) ====================
[04:11:50] [PASSED] xe_gmdid_graphics_ip
[04:11:50] [PASSED] xe_gmdid_media_ip
[04:11:50] ===================== [PASSED] xe_pci ======================
[04:11:50] ==================== xe_rtp (1 subtest) ====================
[04:11:50] ================== xe_rtp_process_tests  ===================
[04:11:50] [PASSED] coalesce-same-reg
[04:11:50] [PASSED] no-match-no-add
[04:11:50] [PASSED] no-match-no-add-multiple-rules
[04:11:50] [PASSED] two-regs-two-entries
[04:11:50] [PASSED] clr-one-set-other
[04:11:50] [PASSED] set-field
[04:11:50] [PASSED] conflict-duplicate
[04:11:50] [PASSED] conflict-not-disjoint
[04:11:50] [PASSED] conflict-reg-type
[04:11:50] ============== [PASSED] xe_rtp_process_tests ===============
[04:11:50] ===================== [PASSED] xe_rtp ======================
[04:11:50] ==================== xe_wa (1 subtest) =====================
[04:11:50] ======================== xe_wa_gt  =========================
[04:11:50] [PASSED] TIGERLAKE (B0)
[04:11:50] [PASSED] DG1 (A0)
[04:11:50] [PASSED] DG1 (B0)
[04:11:50] [PASSED] ALDERLAKE_S (A0)
[04:11:50] [PASSED] ALDERLAKE_S (B0)
[04:11:50] [PASSED] ALDERLAKE_S (C0)
[04:11:50] [PASSED] ALDERLAKE_S (D0)
[04:11:50] [PASSED] DG2_G10 (A0)
[04:11:50] [PASSED] DG2_G10 (A1)
[04:11:50] [PASSED] DG2_G10 (B0)
[04:11:50] [PASSED] DG2_G10 (C0)
[04:11:50] [PASSED] DG2_G11 (A0)
[04:11:50] [PASSED] DG2_G11 (B0)
[04:11:50] [PASSED] DG2_G11 (B1)
[04:11:50] [PASSED] DG2_G12 (A0)
[04:11:50] [PASSED] DG2_G12 (A1)
[04:11:50] [PASSED] PVC (B0)
[04:11:50] [PASSED] PVC (B1)
[04:11:50] [PASSED] PVC (C0)
[04:11:50] ==================== [PASSED] xe_wa_gt =====================
[04:11:50] ====================== [PASSED] xe_wa ======================
[04:11:50] ============================================================
[04:11:50] Testing complete. Ran 34 tests: passed: 30, skipped: 4
[04:11:50] Elapsed time: 26.048s total, 4.171s configuring, 21.757s building, 0.098s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[04:11:50] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:11:52] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[04:12:10] Starting KUnit Kernel (1/1)...
[04:12:10] ============================================================
[04:12:10] ============ drm_test_pick_cmdline (2 subtests) ============
[04:12:10] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[04:12:10] =============== drm_test_pick_cmdline_named  ===============
[04:12:10] [PASSED] NTSC
[04:12:10] [PASSED] NTSC-J
[04:12:10] [PASSED] PAL
[04:12:10] [PASSED] PAL-M
[04:12:10] =========== [PASSED] drm_test_pick_cmdline_named ===========
[04:12:10] ============== [PASSED] drm_test_pick_cmdline ==============
[04:12:10] ================== drm_buddy (6 subtests) ==================
[04:12:10] [PASSED] drm_test_buddy_alloc_limit
[04:12:10] [PASSED] drm_test_buddy_alloc_range
[04:12:10] [PASSED] drm_test_buddy_alloc_optimistic
[04:12:10] [PASSED] drm_test_buddy_alloc_pessimistic
[04:12:10] [PASSED] drm_test_buddy_alloc_smoke
[04:12:10] [PASSED] drm_test_buddy_alloc_pathological
[04:12:10] ==================== [PASSED] drm_buddy ====================
[04:12:10] ============= drm_cmdline_parser (40 subtests) =============
[04:12:10] [PASSED] drm_test_cmdline_force_d_only
[04:12:10] [PASSED] drm_test_cmdline_force_D_only_dvi
[04:12:10] [PASSED] drm_test_cmdline_force_D_only_hdmi
[04:12:10] [PASSED] drm_test_cmdline_force_D_only_not_digital
[04:12:10] [PASSED] drm_test_cmdline_force_e_only
[04:12:10] [PASSED] drm_test_cmdline_res
[04:12:10] [PASSED] drm_test_cmdline_res_vesa
[04:12:10] [PASSED] drm_test_cmdline_res_vesa_rblank
[04:12:10] [PASSED] drm_test_cmdline_res_rblank
[04:12:10] [PASSED] drm_test_cmdline_res_bpp
[04:12:10] [PASSED] drm_test_cmdline_res_refresh
[04:12:10] [PASSED] drm_test_cmdline_res_bpp_refresh
[04:12:10] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[04:12:10] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[04:12:10] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[04:12:10] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[04:12:10] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[04:12:10] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[04:12:10] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[04:12:10] [PASSED] drm_test_cmdline_res_margins_force_on
[04:12:10] [PASSED] drm_test_cmdline_res_vesa_margins
[04:12:10] [PASSED] drm_test_cmdline_name
[04:12:10] [PASSED] drm_test_cmdline_name_bpp
[04:12:10] [PASSED] drm_test_cmdline_name_option
[04:12:10] [PASSED] drm_test_cmdline_name_bpp_option
[04:12:10] [PASSED] drm_test_cmdline_rotate_0
[04:12:10] [PASSED] drm_test_cmdline_rotate_90
[04:12:10] [PASSED] drm_test_cmdline_rotate_180
[04:12:10] [PASSED] drm_test_cmdline_rotate_270
[04:12:10] [PASSED] drm_test_cmdline_hmirror
[04:12:10] [PASSED] drm_test_cmdline_vmirror
[04:12:10] [PASSED] drm_test_cmdline_margin_options
[04:12:10] [PASSED] drm_test_cmdline_multiple_options
[04:12:10] [PASSED] drm_test_cmdline_bpp_extra_and_option
[04:12:10] [PASSED] drm_test_cmdline_extra_and_option
[04:12:10] [PASSED] drm_test_cmdline_freestanding_options
[04:12:10] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[04:12:10] [PASSED] drm_test_cmdline_panel_orientation
[04:12:10] ================ drm_test_cmdline_invalid  =================
[04:12:10] [PASSED] margin_only
[04:12:10] [PASSED] interlace_only
[04:12:10] [PASSED] res_missing_x
[04:12:10] [PASSED] res_missing_y
[04:12:10] [PASSED] res_bad_y
[04:12:10] [PASSED] res_missing_y_bpp
[04:12:10] [PASSED] res_bad_bpp
[04:12:10] [PASSED] res_bad_refresh
[04:12:10] [PASSED] res_bpp_refresh_force_on_off
[04:12:10] [PASSED] res_invalid_mode
[04:12:10] [PASSED] res_bpp_wrong_place_mode
[04:12:10] [PASSED] name_bpp_refresh
[04:12:10] [PASSED] name_refresh
[04:12:10] [PASSED] name_refresh_wrong_mode
[04:12:10] [PASSED] name_refresh_invalid_mode
[04:12:10] [PASSED] rotate_multiple
[04:12:10] [PASSED] rotate_invalid_val
[04:12:10] [PASSED] rotate_truncated
[04:12:10] [PASSED] invalid_option
[04:12:10] [PASSED] invalid_tv_option
[04:12:10] [PASSED] truncated_tv_option
[04:12:10] ============ [PASSED] drm_test_cmdline_invalid =============
[04:12:10] =============== drm_test_cmdline_tv_options  ===============
[04:12:10] [PASSED] NTSC
[04:12:10] [PASSED] NTSC_443
[04:12:10] [PASSED] NTSC_J
[04:12:10] [PASSED] PAL
[04:12:10] [PASSED] PAL_M
[04:12:10] [PASSED] PAL_N
[04:12:10] [PASSED] SECAM
[04:12:10] =========== [PASSED] drm_test_cmdline_tv_options ===========
[04:12:10] =============== [PASSED] drm_cmdline_parser ================
[04:12:10] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[04:12:10] ========== drm_test_get_tv_mode_from_name_valid  ===========
[04:12:10] [PASSED] NTSC
[04:12:10] [PASSED] NTSC-443
[04:12:10] [PASSED] NTSC-J
[04:12:10] [PASSED] PAL
[04:12:10] [PASSED] PAL-M
[04:12:10] [PASSED] PAL-N
[04:12:10] [PASSED] SECAM
[04:12:10] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[04:12:10] [PASSED] drm_test_get_tv_mode_from_name_truncated
[04:12:10] ============ [PASSED] drm_get_tv_mode_from_name ============
[04:12:10] ============= drm_damage_helper (21 subtests) ==============
[04:12:10] [PASSED] drm_test_damage_iter_no_damage
[04:12:10] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[04:12:10] [PASSED] drm_test_damage_iter_no_damage_src_moved
[04:12:10] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[04:12:10] [PASSED] drm_test_damage_iter_no_damage_not_visible
[04:12:10] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[04:12:10] [PASSED] drm_test_damage_iter_no_damage_no_fb
[04:12:10] [PASSED] drm_test_damage_iter_simple_damage
[04:12:10] [PASSED] drm_test_damage_iter_single_damage
[04:12:10] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[04:12:10] [PASSED] drm_test_damage_iter_single_damage_outside_src
[04:12:10] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[04:12:10] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[04:12:10] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[04:12:10] [PASSED] drm_test_damage_iter_single_damage_src_moved
[04:12:10] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[04:12:10] [PASSED] drm_test_damage_iter_damage
[04:12:10] [PASSED] drm_test_damage_iter_damage_one_intersect
[04:12:10] [PASSED] drm_test_damage_iter_damage_one_outside
[04:12:10] [PASSED] drm_test_damage_iter_damage_src_moved
[04:12:10] [PASSED] drm_test_damage_iter_damage_not_visible
[04:12:10] ================ [PASSED] drm_damage_helper ================
[04:12:10] ============== drm_dp_mst_helper (2 subtests) ==============
[04:12:10] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[04:12:10] [PASSED] Clock 154000 BPP 30 DSC disabled
[04:12:10] [PASSED] Clock 234000 BPP 30 DSC disabled
[04:12:10] [PASSED] Clock 297000 BPP 24 DSC disabled
[04:12:10] [PASSED] Clock 332880 BPP 24 DSC enabled
[04:12:10] [PASSED] Clock 324540 BPP 24 DSC enabled
[04:12:10] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[04:12:10] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[04:12:10] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[04:12:10] [PASSED] DP_POWER_UP_PHY with port number
[04:12:10] [PASSED] DP_POWER_DOWN_PHY with port number
[04:12:10] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[04:12:10] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[04:12:10] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[04:12:10] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[04:12:10] [PASSED] DP_QUERY_PAYLOAD with port number
[04:12:10] [PASSED] DP_QUERY_PAYLOAD with VCPI
[04:12:10] [PASSED] DP_REMOTE_DPCD_READ with port number
[04:12:10] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[04:12:10] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[04:12:10] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[04:12:10] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[04:12:10] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[04:12:10] [PASSED] DP_REMOTE_I2C_READ with port number
[04:12:10] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[04:12:10] [PASSED] DP_REMOTE_I2C_READ with transactions array
[04:12:10] [PASSED] DP_REMOTE_I2C_WRITE with port number
[04:12:10] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[04:12:10] [PASSED] DP_REMOTE_I2C_WRITE with data array
[04:12:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[04:12:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[04:12:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[04:12:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[04:12:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[04:12:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[04:12:10] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[04:12:10] ================ [PASSED] drm_dp_mst_helper ================
[04:12:10] =========== drm_format_helper_test (11 subtests) ===========
[04:12:10] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[04:12:10] [PASSED] single_pixel_source_buffer
[04:12:10] [PASSED] single_pixel_clip_rectangle
[04:12:10] [PASSED] well_known_colors
[04:12:10] [PASSED] destination_pitch
[04:12:10] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[04:12:10] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[04:12:10] [PASSED] single_pixel_source_buffer
[04:12:10] [PASSED] single_pixel_clip_rectangle
[04:12:10] [PASSED] well_known_colors
[04:12:10] [PASSED] destination_pitch
[04:12:10] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[04:12:10] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[04:12:10] [PASSED] single_pixel_source_buffer
[04:12:10] [PASSED] single_pixel_clip_rectangle
[04:12:10] [PASSED] well_known_colors
[04:12:10] [PASSED] destination_pitch
[04:12:10] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[04:12:10] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[04:12:10] [PASSED] single_pixel_source_buffer
[04:12:10] [PASSED] single_pixel_clip_rectangle
[04:12:10] [PASSED] well_known_colors
[04:12:10] [PASSED] destination_pitch
[04:12:10] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[04:12:10] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[04:12:10] [PASSED] single_pixel_source_buffer
[04:12:10] [PASSED] single_pixel_clip_rectangle
[04:12:10] [PASSED] well_known_colors
[04:12:10] [PASSED] destination_pitch
[04:12:10] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[04:12:10] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[04:12:10] [PASSED] single_pixel_source_buffer
[04:12:10] [PASSED] single_pixel_clip_rectangle
[04:12:10] [PASSED] well_known_colors
[04:12:10] [PASSED] destination_pitch
[04:12:10] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[04:12:10] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[04:12:10] [PASSED] single_pixel_source_buffer
[04:12:10] [PASSED] single_pixel_clip_rectangle
[04:12:10] [PASSED] well_known_colors
[04:12:10] [PASSED] destination_pitch
[04:12:10] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[04:12:10] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[04:12:10] [PASSED] single_pixel_source_buffer
[04:12:10] [PASSED] single_pixel_clip_rectangle
[04:12:10] [PASSED] well_known_colors
[04:12:10] [PASSED] destination_pitch
[04:12:10] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[04:12:10] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[04:12:10] [PASSED] single_pixel_source_buffer
[04:12:10] [PASSED] single_pixel_clip_rectangle
[04:12:10] [PASSED] well_known_colors
[04:12:10] [PASSED] destination_pitch
[04:12:10] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[04:12:10] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[04:12:10] [PASSED] single_pixel_source_buffer
[04:12:10] [PASSED] single_pixel_clip_rectangle
[04:12:10] [PASSED] well_known_colors
[04:12:10] [PASSED] destination_pitch
[04:12:10] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[04:12:10] ============== drm_test_fb_xrgb8888_to_mono  ===============
[04:12:10] [PASSED] single_pixel_source_buffer
[04:12:10] [PASSED] single_pixel_clip_rectangle
[04:12:10] [PASSED] well_known_colors
[04:12:10] [PASSED] destination_pitch
[04:12:10] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[04:12:10] ============= [PASSED] drm_format_helper_test ==============
[04:12:10] ================= drm_format (18 subtests) =================
[04:12:10] [PASSED] drm_test_format_block_width_invalid
[04:12:10] [PASSED] drm_test_format_block_width_one_plane
[04:12:10] [PASSED] drm_test_format_block_width_two_plane
[04:12:10] [PASSED] drm_test_format_block_width_three_plane
[04:12:10] [PASSED] drm_test_format_block_width_tiled
[04:12:10] [PASSED] drm_test_format_block_height_invalid
[04:12:10] [PASSED] drm_test_format_block_height_one_plane
[04:12:10] [PASSED] drm_test_format_block_height_two_plane
[04:12:10] [PASSED] drm_test_format_block_height_three_plane
[04:12:10] [PASSED] drm_test_format_block_height_tiled
[04:12:10] [PASSED] drm_test_format_min_pitch_invalid
[04:12:10] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[04:12:10] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[04:12:10] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[04:12:10] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[04:12:10] [PASSED] drm_test_format_min_pitch_two_plane
[04:12:10] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[04:12:10] [PASSED] drm_test_format_min_pitch_tiled
[04:12:10] =================== [PASSED] drm_format ====================
[04:12:10] =============== drm_framebuffer (1 subtest) ================
[04:12:10] =============== drm_test_framebuffer_create  ===============
[04:12:10] [PASSED] ABGR8888 normal sizes
[04:12:10] [PASSED] ABGR8888 max sizes
[04:12:10] [PASSED] ABGR8888 pitch greater than min required
[04:12:10] [PASSED] ABGR8888 pitch less than min required
[04:12:10] [PASSED] ABGR8888 Invalid width
[04:12:10] [PASSED] ABGR8888 Invalid buffer handle
[04:12:10] [PASSED] No pixel format
[04:12:10] [PASSED] ABGR8888 Width 0
[04:12:10] [PASSED] ABGR8888 Height 0
[04:12:10] [PASSED] ABGR8888 Out of bound height * pitch combination
[04:12:10] [PASSED] ABGR8888 Large buffer offset
[04:12:10] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[04:12:10] [PASSED] ABGR8888 Valid buffer modifier
[04:12:10] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[04:12:10] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[04:12:10] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[04:12:10] [PASSED] NV12 Normal sizes
[04:12:10] [PASSED] NV12 Max sizes
[04:12:10] [PASSED] NV12 Invalid pitch
[04:12:10] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[04:12:10] [PASSED] NV12 different  modifier per-plane
[04:12:10] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[04:12:10] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[04:12:10] [PASSED] NV12 Modifier for inexistent plane
[04:12:10] [PASSED] NV12 Handle for inexistent plane
[04:12:10] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[04:12:10] [PASSED] YVU420 Normal sizes
[04:12:10] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[04:12:10] [PASSED] YVU420 Max sizes
[04:12:10] [PASSED] YVU420 Invalid pitch
[04:12:10] [PASSED] YVU420 Different pitches
[04:12:10] [PASSED] YVU420 Different buffer offsets/pitches
[04:12:10] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[04:12:10] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[04:12:10] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[04:12:10] [PASSED] YVU420 Valid modifier
[04:12:10] [PASSED] YVU420 Different modifiers per plane
[04:12:10] [PASSED] YVU420 Modifier for inexistent plane
[04:12:10] [PASSED] X0L2 Normal sizes
[04:12:10] [PASSED] X0L2 Max sizes
[04:12:10] [PASSED] X0L2 Invalid pitch
[04:12:10] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[04:12:10] [PASSED] X0L2 Handle for inexistent plane
[04:12:10] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[04:12:10] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[04:12:10] [PASSED] X0L2 Valid modifier
[04:12:10] [PASSED] X0L2 Modifier for inexistent plane
[04:12:10] =========== [PASSED] drm_test_framebuffer_create ===========
[04:12:10] ================= [PASSED] drm_framebuffer =================
[04:12:10] =============== drm-test-managed (1 subtest) ===============
[04:12:10] [PASSED] drm_test_managed_run_action
[04:12:10] ================ [PASSED] drm-test-managed =================
[04:12:10] =================== drm_mm (19 subtests) ===================
[04:12:10] [PASSED] drm_test_mm_init
[04:12:10] [PASSED] drm_test_mm_debug
[04:12:20] [PASSED] drm_test_mm_reserve
[04:12:30] [PASSED] drm_test_mm_insert
[04:12:31] [PASSED] drm_test_mm_replace
[04:12:31] [PASSED] drm_test_mm_insert_range
[04:12:31] [PASSED] drm_test_mm_frag
[04:12:31] [PASSED] drm_test_mm_align
[04:12:31] [PASSED] drm_test_mm_align32
[04:12:32] [PASSED] drm_test_mm_align64
[04:12:32] [PASSED] drm_test_mm_evict
[04:12:32] [PASSED] drm_test_mm_evict_range
[04:12:32] [PASSED] drm_test_mm_topdown
[04:12:32] [PASSED] drm_test_mm_bottomup
[04:12:32] [PASSED] drm_test_mm_lowest
[04:12:32] [PASSED] drm_test_mm_highest
[04:12:33] [PASSED] drm_test_mm_color
[04:12:33] [PASSED] drm_test_mm_color_evict
[04:12:33] [PASSED] drm_test_mm_color_evict_range
[04:12:33] ===================== [PASSED] drm_mm ======================
[04:12:33] ============= drm_modes_analog_tv (4 subtests) =============
[04:12:33] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[04:12:33] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[04:12:33] [PASSED] drm_test_modes_analog_tv_pal_576i
[04:12:33] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[04:12:33] =============== [PASSED] drm_modes_analog_tv ===============
[04:12:33] ============== drm_plane_helper (2 subtests) ===============
[04:12:33] =============== drm_test_check_plane_state  ================
[04:12:33] [PASSED] clipping_simple
[04:12:33] [PASSED] clipping_rotate_reflect
[04:12:33] [PASSED] positioning_simple
[04:12:33] [PASSED] upscaling
[04:12:33] [PASSED] downscaling
[04:12:33] [PASSED] rounding1
[04:12:33] [PASSED] rounding2
[04:12:33] [PASSED] rounding3
[04:12:33] [PASSED] rounding4
[04:12:33] =========== [PASSED] drm_test_check_plane_state ============
[04:12:33] =========== drm_test_check_invalid_plane_state  ============
[04:12:33] [PASSED] positioning_invalid
[04:12:33] [PASSED] upscaling_invalid
[04:12:33] [PASSED] downscaling_invalid
[04:12:33] ======= [PASSED] drm_test_check_invalid_plane_state ========
[04:12:33] ================ [PASSED] drm_plane_helper =================
[04:12:33] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[04:12:33] ====== drm_test_connector_helper_tv_get_modes_check  =======
[04:12:33] [PASSED] None
[04:12:33] [PASSED] PAL
[04:12:33] [PASSED] NTSC
[04:12:33] [PASSED] Both, NTSC Default
[04:12:33] [PASSED] Both, PAL Default
[04:12:33] [PASSED] Both, NTSC Default, with PAL on command-line
[04:12:33] [PASSED] Both, PAL Default, with NTSC on command-line
[04:12:33] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[04:12:33] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[04:12:33] ================== drm_rect (4 subtests) ===================
[04:12:33] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[04:12:33] [PASSED] drm_test_rect_clip_scaled_not_clipped
[04:12:33] [PASSED] drm_test_rect_clip_scaled_clipped
[04:12:33] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[04:12:33] ==================== [PASSED] drm_rect =====================
[04:12:33] ============================================================
[04:12:33] Testing complete. Ran 294 tests: passed: 294
[04:12:33] Elapsed time: 43.174s total, 1.699s configuring, 18.285s building, 23.183s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


