Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F92C7EE25
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 05:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C9410E576;
	Thu,  8 Jun 2023 05:07:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A93EC10E576;
 Thu,  8 Jun 2023 05:07:21 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 983BEA0BA8;
 Thu,  8 Jun 2023 05:07:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 08 Jun 2023 05:07:21 -0000
Message-ID: <168620084161.18386.8924410567906380123@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230608050333.37581-1-matthew.brost@intel.com>
In-Reply-To: <20230608050333.37581-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_NULL_bi?=
 =?utf-8?q?ndings_aka_sparse_bindings?=
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

Series: NULL bindings aka sparse bindings
URL   : https://patchwork.freedesktop.org/series/119048/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[05:06:05] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:06:09] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[05:06:31] Starting KUnit Kernel (1/1)...
[05:06:31] ============================================================
[05:06:32] ==================== xe_bo (2 subtests) ====================
[05:06:32] [SKIPPED] xe_ccs_migrate_kunit
[05:06:32] [SKIPPED] xe_bo_evict_kunit
[05:06:32] ===================== [SKIPPED] xe_bo ======================
[05:06:32] ================== xe_dma_buf (1 subtest) ==================
[05:06:32] [SKIPPED] xe_dma_buf_kunit
[05:06:32] =================== [SKIPPED] xe_dma_buf ===================
[05:06:32] ================== xe_migrate (1 subtest) ==================
[05:06:32] [SKIPPED] xe_migrate_sanity_kunit
[05:06:32] =================== [SKIPPED] xe_migrate ===================
[05:06:32] =================== xe_pci (2 subtests) ====================
[05:06:32] [PASSED] xe_gmdid_graphics_ip
[05:06:32] [PASSED] xe_gmdid_media_ip
[05:06:32] ===================== [PASSED] xe_pci ======================
[05:06:32] ==================== xe_rtp (1 subtest) ====================
[05:06:32] ================== xe_rtp_process_tests  ===================
[05:06:32] [PASSED] coalesce-same-reg
[05:06:32] [PASSED] no-match-no-add
[05:06:32] [PASSED] no-match-no-add-multiple-rules
[05:06:32] [PASSED] two-regs-two-entries
[05:06:32] [PASSED] clr-one-set-other
[05:06:32] [PASSED] set-field
[05:06:32] [PASSED] conflict-duplicate
[05:06:32] [PASSED] conflict-not-disjoint
[05:06:32] [PASSED] conflict-reg-type
[05:06:32] ============== [PASSED] xe_rtp_process_tests ===============
[05:06:32] ===================== [PASSED] xe_rtp ======================
[05:06:32] ==================== xe_wa (1 subtest) =====================
[05:06:32] ======================== xe_wa_gt  =========================
[05:06:32] [PASSED] TIGERLAKE (B0)
[05:06:32] [PASSED] DG1 (A0)
[05:06:32] [PASSED] DG1 (B0)
[05:06:32] [PASSED] ALDERLAKE_S (A0)
[05:06:32] [PASSED] ALDERLAKE_S (B0)
[05:06:32] [PASSED] ALDERLAKE_S (C0)
[05:06:32] [PASSED] ALDERLAKE_S (D0)
[05:06:32] [PASSED] DG2_G10 (A0)
[05:06:32] [PASSED] DG2_G10 (A1)
[05:06:32] [PASSED] DG2_G10 (B0)
[05:06:32] [PASSED] DG2_G10 (C0)
[05:06:32] [PASSED] DG2_G11 (A0)
[05:06:32] [PASSED] DG2_G11 (B0)
[05:06:32] [PASSED] DG2_G11 (B1)
[05:06:32] [PASSED] DG2_G12 (A0)
[05:06:32] [PASSED] DG2_G12 (A1)
[05:06:32] [PASSED] PVC (B0)
[05:06:32] [PASSED] PVC (B1)
[05:06:32] [PASSED] PVC (C0)
[05:06:32] ==================== [PASSED] xe_wa_gt =====================
[05:06:32] ====================== [PASSED] xe_wa ======================
[05:06:32] ============================================================
[05:06:32] Testing complete. Ran 34 tests: passed: 30, skipped: 4
[05:06:32] Elapsed time: 26.466s total, 4.252s configuring, 22.045s building, 0.153s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[05:06:32] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:06:33] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[05:06:52] Starting KUnit Kernel (1/1)...
[05:06:52] ============================================================
[05:06:52] ============ drm_test_pick_cmdline (2 subtests) ============
[05:06:52] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[05:06:52] =============== drm_test_pick_cmdline_named  ===============
[05:06:52] [PASSED] NTSC
[05:06:52] [PASSED] NTSC-J
[05:06:52] [PASSED] PAL
[05:06:52] [PASSED] PAL-M
[05:06:52] =========== [PASSED] drm_test_pick_cmdline_named ===========
[05:06:52] ============== [PASSED] drm_test_pick_cmdline ==============
[05:06:52] ================== drm_buddy (6 subtests) ==================
[05:06:52] [PASSED] drm_test_buddy_alloc_limit
[05:06:52] [PASSED] drm_test_buddy_alloc_range
[05:06:52] [PASSED] drm_test_buddy_alloc_optimistic
[05:06:52] [PASSED] drm_test_buddy_alloc_pessimistic
[05:06:52] [PASSED] drm_test_buddy_alloc_smoke
[05:06:52] [PASSED] drm_test_buddy_alloc_pathological
[05:06:52] ==================== [PASSED] drm_buddy ====================
[05:06:52] ============= drm_cmdline_parser (40 subtests) =============
[05:06:52] [PASSED] drm_test_cmdline_force_d_only
[05:06:52] [PASSED] drm_test_cmdline_force_D_only_dvi
[05:06:52] [PASSED] drm_test_cmdline_force_D_only_hdmi
[05:06:52] [PASSED] drm_test_cmdline_force_D_only_not_digital
[05:06:52] [PASSED] drm_test_cmdline_force_e_only
[05:06:52] [PASSED] drm_test_cmdline_res
[05:06:52] [PASSED] drm_test_cmdline_res_vesa
[05:06:52] [PASSED] drm_test_cmdline_res_vesa_rblank
[05:06:52] [PASSED] drm_test_cmdline_res_rblank
[05:06:52] [PASSED] drm_test_cmdline_res_bpp
[05:06:52] [PASSED] drm_test_cmdline_res_refresh
[05:06:52] [PASSED] drm_test_cmdline_res_bpp_refresh
[05:06:52] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[05:06:52] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[05:06:52] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[05:06:52] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[05:06:52] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[05:06:52] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[05:06:52] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[05:06:52] [PASSED] drm_test_cmdline_res_margins_force_on
[05:06:52] [PASSED] drm_test_cmdline_res_vesa_margins
[05:06:52] [PASSED] drm_test_cmdline_name
[05:06:52] [PASSED] drm_test_cmdline_name_bpp
[05:06:52] [PASSED] drm_test_cmdline_name_option
[05:06:52] [PASSED] drm_test_cmdline_name_bpp_option
[05:06:52] [PASSED] drm_test_cmdline_rotate_0
[05:06:52] [PASSED] drm_test_cmdline_rotate_90
[05:06:52] [PASSED] drm_test_cmdline_rotate_180
[05:06:52] [PASSED] drm_test_cmdline_rotate_270
[05:06:52] [PASSED] drm_test_cmdline_hmirror
[05:06:52] [PASSED] drm_test_cmdline_vmirror
[05:06:52] [PASSED] drm_test_cmdline_margin_options
[05:06:52] [PASSED] drm_test_cmdline_multiple_options
[05:06:52] [PASSED] drm_test_cmdline_bpp_extra_and_option
[05:06:52] [PASSED] drm_test_cmdline_extra_and_option
[05:06:52] [PASSED] drm_test_cmdline_freestanding_options
[05:06:52] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[05:06:52] [PASSED] drm_test_cmdline_panel_orientation
[05:06:52] ================ drm_test_cmdline_invalid  =================
[05:06:52] [PASSED] margin_only
[05:06:52] [PASSED] interlace_only
[05:06:52] [PASSED] res_missing_x
[05:06:52] [PASSED] res_missing_y
[05:06:52] [PASSED] res_bad_y
[05:06:52] [PASSED] res_missing_y_bpp
[05:06:52] [PASSED] res_bad_bpp
[05:06:52] [PASSED] res_bad_refresh
[05:06:52] [PASSED] res_bpp_refresh_force_on_off
[05:06:52] [PASSED] res_invalid_mode
[05:06:52] [PASSED] res_bpp_wrong_place_mode
[05:06:52] [PASSED] name_bpp_refresh
[05:06:52] [PASSED] name_refresh
[05:06:52] [PASSED] name_refresh_wrong_mode
[05:06:52] [PASSED] name_refresh_invalid_mode
[05:06:52] [PASSED] rotate_multiple
[05:06:52] [PASSED] rotate_invalid_val
[05:06:52] [PASSED] rotate_truncated
[05:06:52] [PASSED] invalid_option
[05:06:52] [PASSED] invalid_tv_option
[05:06:52] [PASSED] truncated_tv_option
[05:06:52] ============ [PASSED] drm_test_cmdline_invalid =============
[05:06:52] =============== drm_test_cmdline_tv_options  ===============
[05:06:52] [PASSED] NTSC
[05:06:52] [PASSED] NTSC_443
[05:06:52] [PASSED] NTSC_J
[05:06:52] [PASSED] PAL
[05:06:52] [PASSED] PAL_M
[05:06:52] [PASSED] PAL_N
[05:06:52] [PASSED] SECAM
[05:06:52] =========== [PASSED] drm_test_cmdline_tv_options ===========
[05:06:52] =============== [PASSED] drm_cmdline_parser ================
[05:06:52] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[05:06:52] ========== drm_test_get_tv_mode_from_name_valid  ===========
[05:06:52] [PASSED] NTSC
[05:06:52] [PASSED] NTSC-443
[05:06:52] [PASSED] NTSC-J
[05:06:52] [PASSED] PAL
[05:06:52] [PASSED] PAL-M
[05:06:52] [PASSED] PAL-N
[05:06:52] [PASSED] SECAM
[05:06:52] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[05:06:52] [PASSED] drm_test_get_tv_mode_from_name_truncated
[05:06:52] ============ [PASSED] drm_get_tv_mode_from_name ============
[05:06:52] ============= drm_damage_helper (21 subtests) ==============
[05:06:52] [PASSED] drm_test_damage_iter_no_damage
[05:06:52] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[05:06:52] [PASSED] drm_test_damage_iter_no_damage_src_moved
[05:06:52] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[05:06:52] [PASSED] drm_test_damage_iter_no_damage_not_visible
[05:06:52] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[05:06:52] [PASSED] drm_test_damage_iter_no_damage_no_fb
[05:06:52] [PASSED] drm_test_damage_iter_simple_damage
[05:06:52] [PASSED] drm_test_damage_iter_single_damage
[05:06:52] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[05:06:52] [PASSED] drm_test_damage_iter_single_damage_outside_src
[05:06:52] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[05:06:52] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[05:06:52] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[05:06:52] [PASSED] drm_test_damage_iter_single_damage_src_moved
[05:06:52] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[05:06:52] [PASSED] drm_test_damage_iter_damage
[05:06:52] [PASSED] drm_test_damage_iter_damage_one_intersect
[05:06:52] [PASSED] drm_test_damage_iter_damage_one_outside
[05:06:52] [PASSED] drm_test_damage_iter_damage_src_moved
[05:06:52] [PASSED] drm_test_damage_iter_damage_not_visible
[05:06:52] ================ [PASSED] drm_damage_helper ================
[05:06:52] ============== drm_dp_mst_helper (2 subtests) ==============
[05:06:52] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[05:06:52] [PASSED] Clock 154000 BPP 30 DSC disabled
[05:06:52] [PASSED] Clock 234000 BPP 30 DSC disabled
[05:06:52] [PASSED] Clock 297000 BPP 24 DSC disabled
[05:06:52] [PASSED] Clock 332880 BPP 24 DSC enabled
[05:06:52] [PASSED] Clock 324540 BPP 24 DSC enabled
[05:06:52] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[05:06:52] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[05:06:52] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[05:06:52] [PASSED] DP_POWER_UP_PHY with port number
[05:06:52] [PASSED] DP_POWER_DOWN_PHY with port number
[05:06:52] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[05:06:52] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[05:06:52] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[05:06:52] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[05:06:52] [PASSED] DP_QUERY_PAYLOAD with port number
[05:06:52] [PASSED] DP_QUERY_PAYLOAD with VCPI
[05:06:52] [PASSED] DP_REMOTE_DPCD_READ with port number
[05:06:52] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[05:06:52] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[05:06:52] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[05:06:52] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[05:06:52] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[05:06:52] [PASSED] DP_REMOTE_I2C_READ with port number
[05:06:52] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[05:06:52] [PASSED] DP_REMOTE_I2C_READ with transactions array
[05:06:52] [PASSED] DP_REMOTE_I2C_WRITE with port number
[05:06:52] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[05:06:52] [PASSED] DP_REMOTE_I2C_WRITE with data array
[05:06:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[05:06:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[05:06:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[05:06:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[05:06:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[05:06:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[05:06:52] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[05:06:52] ================ [PASSED] drm_dp_mst_helper ================
[05:06:52] =========== drm_format_helper_test (11 subtests) ===========
[05:06:52] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[05:06:52] [PASSED] single_pixel_source_buffer
[05:06:52] [PASSED] single_pixel_clip_rectangle
[05:06:52] [PASSED] well_known_colors
[05:06:52] [PASSED] destination_pitch
[05:06:52] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[05:06:52] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[05:06:52] [PASSED] single_pixel_source_buffer
[05:06:52] [PASSED] single_pixel_clip_rectangle
[05:06:52] [PASSED] well_known_colors
[05:06:52] [PASSED] destination_pitch
[05:06:52] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[05:06:52] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[05:06:52] [PASSED] single_pixel_source_buffer
[05:06:52] [PASSED] single_pixel_clip_rectangle
[05:06:52] [PASSED] well_known_colors
[05:06:52] [PASSED] destination_pitch
[05:06:52] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[05:06:52] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[05:06:52] [PASSED] single_pixel_source_buffer
[05:06:52] [PASSED] single_pixel_clip_rectangle
[05:06:52] [PASSED] well_known_colors
[05:06:52] [PASSED] destination_pitch
[05:06:52] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[05:06:52] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[05:06:52] [PASSED] single_pixel_source_buffer
[05:06:52] [PASSED] single_pixel_clip_rectangle
[05:06:52] [PASSED] well_known_colors
[05:06:52] [PASSED] destination_pitch
[05:06:52] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[05:06:52] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[05:06:52] [PASSED] single_pixel_source_buffer
[05:06:52] [PASSED] single_pixel_clip_rectangle
[05:06:52] [PASSED] well_known_colors
[05:06:52] [PASSED] destination_pitch
[05:06:52] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[05:06:52] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[05:06:52] [PASSED] single_pixel_source_buffer
[05:06:52] [PASSED] single_pixel_clip_rectangle
[05:06:52] [PASSED] well_known_colors
[05:06:52] [PASSED] destination_pitch
[05:06:52] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[05:06:52] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[05:06:52] [PASSED] single_pixel_source_buffer
[05:06:52] [PASSED] single_pixel_clip_rectangle
[05:06:52] [PASSED] well_known_colors
[05:06:52] [PASSED] destination_pitch
[05:06:52] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[05:06:52] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[05:06:52] [PASSED] single_pixel_source_buffer
[05:06:52] [PASSED] single_pixel_clip_rectangle
[05:06:52] [PASSED] well_known_colors
[05:06:52] [PASSED] destination_pitch
[05:06:52] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[05:06:52] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[05:06:52] [PASSED] single_pixel_source_buffer
[05:06:52] [PASSED] single_pixel_clip_rectangle
[05:06:52] [PASSED] well_known_colors
[05:06:52] [PASSED] destination_pitch
[05:06:52] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[05:06:52] ============== drm_test_fb_xrgb8888_to_mono  ===============
[05:06:52] [PASSED] single_pixel_source_buffer
[05:06:52] [PASSED] single_pixel_clip_rectangle
[05:06:52] [PASSED] well_known_colors
[05:06:52] [PASSED] destination_pitch
[05:06:52] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[05:06:52] ============= [PASSED] drm_format_helper_test ==============
[05:06:52] ================= drm_format (18 subtests) =================
[05:06:52] [PASSED] drm_test_format_block_width_invalid
[05:06:52] [PASSED] drm_test_format_block_width_one_plane
[05:06:52] [PASSED] drm_test_format_block_width_two_plane
[05:06:52] [PASSED] drm_test_format_block_width_three_plane
[05:06:52] [PASSED] drm_test_format_block_width_tiled
[05:06:52] [PASSED] drm_test_format_block_height_invalid
[05:06:52] [PASSED] drm_test_format_block_height_one_plane
[05:06:52] [PASSED] drm_test_format_block_height_two_plane
[05:06:52] [PASSED] drm_test_format_block_height_three_plane
[05:06:52] [PASSED] drm_test_format_block_height_tiled
[05:06:52] [PASSED] drm_test_format_min_pitch_invalid
[05:06:52] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[05:06:52] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[05:06:52] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[05:06:52] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[05:06:52] [PASSED] drm_test_format_min_pitch_two_plane
[05:06:52] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[05:06:52] [PASSED] drm_test_format_min_pitch_tiled
[05:06:52] =================== [PASSED] drm_format ====================
[05:06:52] =============== drm_framebuffer (1 subtest) ================
[05:06:52] =============== drm_test_framebuffer_create  ===============
[05:06:52] [PASSED] ABGR8888 normal sizes
[05:06:52] [PASSED] ABGR8888 max sizes
[05:06:52] [PASSED] ABGR8888 pitch greater than min required
[05:06:52] [PASSED] ABGR8888 pitch less than min required
[05:06:52] [PASSED] ABGR8888 Invalid width
[05:06:52] [PASSED] ABGR8888 Invalid buffer handle
[05:06:52] [PASSED] No pixel format
[05:06:52] [PASSED] ABGR8888 Width 0
[05:06:52] [PASSED] ABGR8888 Height 0
[05:06:52] [PASSED] ABGR8888 Out of bound height * pitch combination
[05:06:52] [PASSED] ABGR8888 Large buffer offset
[05:06:52] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[05:06:52] [PASSED] ABGR8888 Valid buffer modifier
[05:06:52] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[05:06:52] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[05:06:52] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[05:06:52] [PASSED] NV12 Normal sizes
[05:06:52] [PASSED] NV12 Max sizes
[05:06:52] [PASSED] NV12 Invalid pitch
[05:06:52] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[05:06:52] [PASSED] NV12 different  modifier per-plane
[05:06:52] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[05:06:52] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[05:06:52] [PASSED] NV12 Modifier for inexistent plane
[05:06:52] [PASSED] NV12 Handle for inexistent plane
[05:06:52] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[05:06:52] [PASSED] YVU420 Normal sizes
[05:06:52] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[05:06:52] [PASSED] YVU420 Max sizes
[05:06:52] [PASSED] YVU420 Invalid pitch
[05:06:52] [PASSED] YVU420 Different pitches
[05:06:52] [PASSED] YVU420 Different buffer offsets/pitches
[05:06:52] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[05:06:52] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[05:06:52] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[05:06:52] [PASSED] YVU420 Valid modifier
[05:06:52] [PASSED] YVU420 Different modifiers per plane
[05:06:52] [PASSED] YVU420 Modifier for inexistent plane
[05:06:52] [PASSED] X0L2 Normal sizes
[05:06:52] [PASSED] X0L2 Max sizes
[05:06:52] [PASSED] X0L2 Invalid pitch
[05:06:52] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[05:06:52] [PASSED] X0L2 Handle for inexistent plane
[05:06:52] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[05:06:52] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[05:06:52] [PASSED] X0L2 Valid modifier
[05:06:52] [PASSED] X0L2 Modifier for inexistent plane
[05:06:52] =========== [PASSED] drm_test_framebuffer_create ===========
[05:06:52] ================= [PASSED] drm_framebuffer =================
[05:06:52] =============== drm-test-managed (1 subtest) ===============
[05:06:52] [PASSED] drm_test_managed_run_action
[05:06:52] ================ [PASSED] drm-test-managed =================
[05:06:52] =================== drm_mm (19 subtests) ===================
[05:06:52] [PASSED] drm_test_mm_init
[05:06:52] [PASSED] drm_test_mm_debug
[05:07:03] [PASSED] drm_test_mm_reserve
[05:07:13] [PASSED] drm_test_mm_insert
[05:07:14] [PASSED] drm_test_mm_replace
[05:07:14] [PASSED] drm_test_mm_insert_range
[05:07:14] [PASSED] drm_test_mm_frag
[05:07:14] [PASSED] drm_test_mm_align
[05:07:14] [PASSED] drm_test_mm_align32
[05:07:14] [PASSED] drm_test_mm_align64
[05:07:14] [PASSED] drm_test_mm_evict
[05:07:14] [PASSED] drm_test_mm_evict_range
[05:07:14] [PASSED] drm_test_mm_topdown
[05:07:14] [PASSED] drm_test_mm_bottomup
[05:07:14] [PASSED] drm_test_mm_lowest
[05:07:14] [PASSED] drm_test_mm_highest
[05:07:15] [PASSED] drm_test_mm_color
[05:07:16] [PASSED] drm_test_mm_color_evict
[05:07:16] [PASSED] drm_test_mm_color_evict_range
[05:07:16] ===================== [PASSED] drm_mm ======================
[05:07:16] ============= drm_modes_analog_tv (4 subtests) =============
[05:07:16] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[05:07:16] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[05:07:16] [PASSED] drm_test_modes_analog_tv_pal_576i
[05:07:16] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[05:07:16] =============== [PASSED] drm_modes_analog_tv ===============
[05:07:16] ============== drm_plane_helper (2 subtests) ===============
[05:07:16] =============== drm_test_check_plane_state  ================
[05:07:16] [PASSED] clipping_simple
[05:07:16] [PASSED] clipping_rotate_reflect
[05:07:16] [PASSED] positioning_simple
[05:07:16] [PASSED] upscaling
[05:07:16] [PASSED] downscaling
[05:07:16] [PASSED] rounding1
[05:07:16] [PASSED] rounding2
[05:07:16] [PASSED] rounding3
[05:07:16] [PASSED] rounding4
[05:07:16] =========== [PASSED] drm_test_check_plane_state ============
[05:07:16] =========== drm_test_check_invalid_plane_state  ============
[05:07:16] [PASSED] positioning_invalid
[05:07:16] [PASSED] upscaling_invalid
[05:07:16] [PASSED] downscaling_invalid
[05:07:16] ======= [PASSED] drm_test_check_invalid_plane_state ========
[05:07:16] ================ [PASSED] drm_plane_helper =================
[05:07:16] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[05:07:16] ====== drm_test_connector_helper_tv_get_modes_check  =======
[05:07:16] [PASSED] None
[05:07:16] [PASSED] PAL
[05:07:16] [PASSED] NTSC
[05:07:16] [PASSED] Both, NTSC Default
[05:07:16] [PASSED] Both, PAL Default
[05:07:16] [PASSED] Both, NTSC Default, with PAL on command-line
[05:07:16] [PASSED] Both, PAL Default, with NTSC on command-line
[05:07:16] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[05:07:16] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[05:07:16] ================== drm_rect (9 subtests) ===================
[05:07:16] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[05:07:16] [PASSED] drm_test_rect_clip_scaled_not_clipped
[05:07:16] [PASSED] drm_test_rect_clip_scaled_clipped
[05:07:16] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[05:07:16] ================= drm_test_rect_intersect  =================
[05:07:16] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[05:07:16] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[05:07:16] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[05:07:16] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[05:07:16] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[05:07:16] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[05:07:16] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[05:07:16] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[05:07:16] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[05:07:16] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[05:07:16] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[05:07:16] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[05:07:16] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[05:07:16] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[05:07:16] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[05:07:16] ============= [PASSED] drm_test_rect_intersect =============
[05:07:16] ================ drm_test_rect_calc_hscale  ================
[05:07:16] [PASSED] normal use
[05:07:16] [PASSED] out of max range
[05:07:16] [PASSED] out of min range
[05:07:16] [PASSED] zero dst
[05:07:16] [PASSED] negative src
[05:07:16] [PASSED] negative dst
[05:07:16] ============ [PASSED] drm_test_rect_calc_hscale ============
[05:07:16] ================ drm_test_rect_calc_vscale  ================
[05:07:16] [PASSED] normal use
[05:07:16] [PASSED] out of max range
[05:07:16] [PASSED] out of min range
[05:07:16] [PASSED] zero dst
[05:07:16] [PASSED] negative src
[05:07:16] [PASSED] negative dst
[05:07:16] ============ [PASSED] drm_test_rect_calc_vscale ============
[05:07:16] ================== drm_test_rect_rotate  ===================
[05:07:16] [PASSED] reflect-x
[05:07:16] [PASSED] reflect-y
[05:07:16] [PASSED] rotate-0
[05:07:16] [PASSED] rotate-90
[05:07:16] [PASSED] rotate-180
[05:07:16] [PASSED] rotate-270
[05:07:16] ============== [PASSED] drm_test_rect_rotate ===============
[05:07:16] ================ drm_test_rect_rotate_inv  =================
[05:07:16] [PASSED] reflect-x
[05:07:16] [PASSED] reflect-y
[05:07:16] [PASSED] rotate-0
[05:07:16] [PASSED] rotate-90
[05:07:16] [PASSED] rotate-180
[05:07:16] [PASSED] rotate-270
[05:07:16] ============ [PASSED] drm_test_rect_rotate_inv =============
[05:07:16] ==================== [PASSED] drm_rect =====================
[05:07:16] ============================================================
[05:07:16] Testing complete. Ran 333 tests: passed: 333
[05:07:16] Elapsed time: 44.277s total, 1.687s configuring, 18.506s building, 24.048s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


