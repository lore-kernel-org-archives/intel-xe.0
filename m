Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB06AEB64DD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 03:31:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE9910E307;
	Tue,  1 Aug 2023 03:31:44 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A44010E306;
 Tue,  1 Aug 2023 03:31:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 84314AA3D8;
 Tue,  1 Aug 2023 03:31:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 01 Aug 2023 03:31:41 -0000
Message-ID: <169086070153.10129.15794856148702585535@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230801032748.434509-1-matthew.brost@intel.com>
In-Reply-To: <20230801032748.434509-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_DRM_sch?=
 =?utf-8?q?eduler_changes_for_upstream?=
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

Series: DRM scheduler changes for upstream
URL   : https://patchwork.freedesktop.org/series/121654/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[03:30:29] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[03:30:33] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[03:30:52] Starting KUnit Kernel (1/1)...
[03:30:52] ============================================================
[03:30:52] ==================== xe_bo (2 subtests) ====================
[03:30:52] [SKIPPED] xe_ccs_migrate_kunit
[03:30:52] [SKIPPED] xe_bo_evict_kunit
[03:30:52] ===================== [SKIPPED] xe_bo ======================
[03:30:52] ================== xe_dma_buf (1 subtest) ==================
[03:30:52] [SKIPPED] xe_dma_buf_kunit
[03:30:52] =================== [SKIPPED] xe_dma_buf ===================
[03:30:52] ================== xe_migrate (1 subtest) ==================
[03:30:52] [SKIPPED] xe_migrate_sanity_kunit
[03:30:52] =================== [SKIPPED] xe_migrate ===================
[03:30:52] =================== xe_pci (2 subtests) ====================
[03:30:52] [PASSED] xe_gmdid_graphics_ip
[03:30:52] [PASSED] xe_gmdid_media_ip
[03:30:52] ===================== [PASSED] xe_pci ======================
[03:30:52] ==================== xe_rtp (1 subtest) ====================
[03:30:52] ================== xe_rtp_process_tests  ===================
[03:30:52] [PASSED] coalesce-same-reg
[03:30:52] [PASSED] no-match-no-add
[03:30:52] [PASSED] no-match-no-add-multiple-rules
[03:30:52] [PASSED] two-regs-two-entries
[03:30:52] [PASSED] clr-one-set-other
[03:30:52] [PASSED] set-field
[03:30:52] [PASSED] conflict-duplicate
[03:30:52] [PASSED] conflict-not-disjoint
[03:30:52] [PASSED] conflict-reg-type
[03:30:52] ============== [PASSED] xe_rtp_process_tests ===============
[03:30:52] ===================== [PASSED] xe_rtp ======================
[03:30:52] ==================== xe_wa (1 subtest) =====================
[03:30:52] ======================== xe_wa_gt  =========================
[03:30:52] [PASSED] TIGERLAKE (B0)
[03:30:52] [PASSED] DG1 (A0)
[03:30:52] [PASSED] DG1 (B0)
[03:30:52] [PASSED] ALDERLAKE_S (A0)
[03:30:52] [PASSED] ALDERLAKE_S (B0)
[03:30:52] [PASSED] ALDERLAKE_S (C0)
[03:30:52] [PASSED] ALDERLAKE_S (D0)
[03:30:52] [PASSED] ALDERLAKE_P (A0)
[03:30:52] [PASSED] ALDERLAKE_P (B0)
[03:30:52] [PASSED] ALDERLAKE_P (C0)
[03:30:52] [PASSED] DG2_G10 (A0)
[03:30:52] [PASSED] DG2_G10 (A1)
[03:30:52] [PASSED] DG2_G10 (B0)
[03:30:52] [PASSED] DG2_G10 (C0)
[03:30:52] [PASSED] DG2_G11 (A0)
[03:30:52] [PASSED] DG2_G11 (B0)
[03:30:52] [PASSED] DG2_G11 (B1)
[03:30:52] [PASSED] DG2_G12 (A0)
[03:30:52] [PASSED] DG2_G12 (A1)
[03:30:52] [PASSED] PVC (B0)
[03:30:52] [PASSED] PVC (B1)
[03:30:52] [PASSED] PVC (C0)
[03:30:52] ==================== [PASSED] xe_wa_gt =====================
[03:30:52] ====================== [PASSED] xe_wa ======================
[03:30:52] ============================================================
[03:30:52] Testing complete. Ran 37 tests: passed: 33, skipped: 4
[03:30:52] Elapsed time: 23.448s total, 4.280s configuring, 18.999s building, 0.148s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[03:30:52] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[03:30:54] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[03:31:12] Starting KUnit Kernel (1/1)...
[03:31:12] ============================================================
[03:31:12] ============ drm_test_pick_cmdline (2 subtests) ============
[03:31:12] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[03:31:12] =============== drm_test_pick_cmdline_named  ===============
[03:31:12] [PASSED] NTSC
[03:31:12] [PASSED] NTSC-J
[03:31:12] [PASSED] PAL
[03:31:12] [PASSED] PAL-M
[03:31:12] =========== [PASSED] drm_test_pick_cmdline_named ===========
[03:31:12] ============== [PASSED] drm_test_pick_cmdline ==============
[03:31:12] ================== drm_buddy (6 subtests) ==================
[03:31:12] [PASSED] drm_test_buddy_alloc_limit
[03:31:12] [PASSED] drm_test_buddy_alloc_range
[03:31:12] [PASSED] drm_test_buddy_alloc_optimistic
[03:31:13] [PASSED] drm_test_buddy_alloc_pessimistic
[03:31:13] [PASSED] drm_test_buddy_alloc_smoke
[03:31:13] [PASSED] drm_test_buddy_alloc_pathological
[03:31:13] ==================== [PASSED] drm_buddy ====================
[03:31:13] ============= drm_cmdline_parser (40 subtests) =============
[03:31:13] [PASSED] drm_test_cmdline_force_d_only
[03:31:13] [PASSED] drm_test_cmdline_force_D_only_dvi
[03:31:13] [PASSED] drm_test_cmdline_force_D_only_hdmi
[03:31:13] [PASSED] drm_test_cmdline_force_D_only_not_digital
[03:31:13] [PASSED] drm_test_cmdline_force_e_only
[03:31:13] [PASSED] drm_test_cmdline_res
[03:31:13] [PASSED] drm_test_cmdline_res_vesa
[03:31:13] [PASSED] drm_test_cmdline_res_vesa_rblank
[03:31:13] [PASSED] drm_test_cmdline_res_rblank
[03:31:13] [PASSED] drm_test_cmdline_res_bpp
[03:31:13] [PASSED] drm_test_cmdline_res_refresh
[03:31:13] [PASSED] drm_test_cmdline_res_bpp_refresh
[03:31:13] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[03:31:13] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[03:31:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[03:31:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[03:31:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[03:31:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[03:31:13] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[03:31:13] [PASSED] drm_test_cmdline_res_margins_force_on
[03:31:13] [PASSED] drm_test_cmdline_res_vesa_margins
[03:31:13] [PASSED] drm_test_cmdline_name
[03:31:13] [PASSED] drm_test_cmdline_name_bpp
[03:31:13] [PASSED] drm_test_cmdline_name_option
[03:31:13] [PASSED] drm_test_cmdline_name_bpp_option
[03:31:13] [PASSED] drm_test_cmdline_rotate_0
[03:31:13] [PASSED] drm_test_cmdline_rotate_90
[03:31:13] [PASSED] drm_test_cmdline_rotate_180
[03:31:13] [PASSED] drm_test_cmdline_rotate_270
[03:31:13] [PASSED] drm_test_cmdline_hmirror
[03:31:13] [PASSED] drm_test_cmdline_vmirror
[03:31:13] [PASSED] drm_test_cmdline_margin_options
[03:31:13] [PASSED] drm_test_cmdline_multiple_options
[03:31:13] [PASSED] drm_test_cmdline_bpp_extra_and_option
[03:31:13] [PASSED] drm_test_cmdline_extra_and_option
[03:31:13] [PASSED] drm_test_cmdline_freestanding_options
[03:31:13] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[03:31:13] [PASSED] drm_test_cmdline_panel_orientation
[03:31:13] ================ drm_test_cmdline_invalid  =================
[03:31:13] [PASSED] margin_only
[03:31:13] [PASSED] interlace_only
[03:31:13] [PASSED] res_missing_x
[03:31:13] [PASSED] res_missing_y
[03:31:13] [PASSED] res_bad_y
[03:31:13] [PASSED] res_missing_y_bpp
[03:31:13] [PASSED] res_bad_bpp
[03:31:13] [PASSED] res_bad_refresh
[03:31:13] [PASSED] res_bpp_refresh_force_on_off
[03:31:13] [PASSED] res_invalid_mode
[03:31:13] [PASSED] res_bpp_wrong_place_mode
[03:31:13] [PASSED] name_bpp_refresh
[03:31:13] [PASSED] name_refresh
[03:31:13] [PASSED] name_refresh_wrong_mode
[03:31:13] [PASSED] name_refresh_invalid_mode
[03:31:13] [PASSED] rotate_multiple
[03:31:13] [PASSED] rotate_invalid_val
[03:31:13] [PASSED] rotate_truncated
[03:31:13] [PASSED] invalid_option
[03:31:13] [PASSED] invalid_tv_option
[03:31:13] [PASSED] truncated_tv_option
[03:31:13] ============ [PASSED] drm_test_cmdline_invalid =============
[03:31:13] =============== drm_test_cmdline_tv_options  ===============
[03:31:13] [PASSED] NTSC
[03:31:13] [PASSED] NTSC_443
[03:31:13] [PASSED] NTSC_J
[03:31:13] [PASSED] PAL
[03:31:13] [PASSED] PAL_M
[03:31:13] [PASSED] PAL_N
[03:31:13] [PASSED] SECAM
[03:31:13] =========== [PASSED] drm_test_cmdline_tv_options ===========
[03:31:13] =============== [PASSED] drm_cmdline_parser ================
[03:31:13] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[03:31:13] ========== drm_test_get_tv_mode_from_name_valid  ===========
[03:31:13] [PASSED] NTSC
[03:31:13] [PASSED] NTSC-443
[03:31:13] [PASSED] NTSC-J
[03:31:13] [PASSED] PAL
[03:31:13] [PASSED] PAL-M
[03:31:13] [PASSED] PAL-N
[03:31:13] [PASSED] SECAM
[03:31:13] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[03:31:13] [PASSED] drm_test_get_tv_mode_from_name_truncated
[03:31:13] ============ [PASSED] drm_get_tv_mode_from_name ============
[03:31:13] ============= drm_damage_helper (21 subtests) ==============
[03:31:13] [PASSED] drm_test_damage_iter_no_damage
[03:31:13] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[03:31:13] [PASSED] drm_test_damage_iter_no_damage_src_moved
[03:31:13] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[03:31:13] [PASSED] drm_test_damage_iter_no_damage_not_visible
[03:31:13] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[03:31:13] [PASSED] drm_test_damage_iter_no_damage_no_fb
[03:31:13] [PASSED] drm_test_damage_iter_simple_damage
[03:31:13] [PASSED] drm_test_damage_iter_single_damage
[03:31:13] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[03:31:13] [PASSED] drm_test_damage_iter_single_damage_outside_src
[03:31:13] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[03:31:13] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[03:31:13] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[03:31:13] [PASSED] drm_test_damage_iter_single_damage_src_moved
[03:31:13] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[03:31:13] [PASSED] drm_test_damage_iter_damage
[03:31:13] [PASSED] drm_test_damage_iter_damage_one_intersect
[03:31:13] [PASSED] drm_test_damage_iter_damage_one_outside
[03:31:13] [PASSED] drm_test_damage_iter_damage_src_moved
[03:31:13] [PASSED] drm_test_damage_iter_damage_not_visible
[03:31:13] ================ [PASSED] drm_damage_helper ================
[03:31:13] ============== drm_dp_mst_helper (2 subtests) ==============
[03:31:13] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[03:31:13] [PASSED] Clock 154000 BPP 30 DSC disabled
[03:31:13] [PASSED] Clock 234000 BPP 30 DSC disabled
[03:31:13] [PASSED] Clock 297000 BPP 24 DSC disabled
[03:31:13] [PASSED] Clock 332880 BPP 24 DSC enabled
[03:31:13] [PASSED] Clock 324540 BPP 24 DSC enabled
[03:31:13] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[03:31:13] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[03:31:13] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[03:31:13] [PASSED] DP_POWER_UP_PHY with port number
[03:31:13] [PASSED] DP_POWER_DOWN_PHY with port number
[03:31:13] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[03:31:13] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[03:31:13] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[03:31:13] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[03:31:13] [PASSED] DP_QUERY_PAYLOAD with port number
[03:31:13] [PASSED] DP_QUERY_PAYLOAD with VCPI
[03:31:13] [PASSED] DP_REMOTE_DPCD_READ with port number
[03:31:13] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[03:31:13] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[03:31:13] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[03:31:13] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[03:31:13] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[03:31:13] [PASSED] DP_REMOTE_I2C_READ with port number
[03:31:13] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[03:31:13] [PASSED] DP_REMOTE_I2C_READ with transactions array
[03:31:13] [PASSED] DP_REMOTE_I2C_WRITE with port number
[03:31:13] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[03:31:13] [PASSED] DP_REMOTE_I2C_WRITE with data array
[03:31:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[03:31:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[03:31:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[03:31:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[03:31:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[03:31:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[03:31:13] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[03:31:13] ================ [PASSED] drm_dp_mst_helper ================
[03:31:13] =========== drm_format_helper_test (11 subtests) ===========
[03:31:13] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[03:31:13] [PASSED] single_pixel_source_buffer
[03:31:13] [PASSED] single_pixel_clip_rectangle
[03:31:13] [PASSED] well_known_colors
[03:31:13] [PASSED] destination_pitch
[03:31:13] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[03:31:13] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[03:31:13] [PASSED] single_pixel_source_buffer
[03:31:13] [PASSED] single_pixel_clip_rectangle
[03:31:13] [PASSED] well_known_colors
[03:31:13] [PASSED] destination_pitch
[03:31:13] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[03:31:13] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[03:31:13] [PASSED] single_pixel_source_buffer
[03:31:13] [PASSED] single_pixel_clip_rectangle
[03:31:13] [PASSED] well_known_colors
[03:31:13] [PASSED] destination_pitch
[03:31:13] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[03:31:13] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[03:31:13] [PASSED] single_pixel_source_buffer
[03:31:13] [PASSED] single_pixel_clip_rectangle
[03:31:13] [PASSED] well_known_colors
[03:31:13] [PASSED] destination_pitch
[03:31:13] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[03:31:13] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[03:31:13] [PASSED] single_pixel_source_buffer
[03:31:13] [PASSED] single_pixel_clip_rectangle
[03:31:13] [PASSED] well_known_colors
[03:31:13] [PASSED] destination_pitch
[03:31:13] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[03:31:13] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[03:31:13] [PASSED] single_pixel_source_buffer
[03:31:13] [PASSED] single_pixel_clip_rectangle
[03:31:13] [PASSED] well_known_colors
[03:31:13] [PASSED] destination_pitch
[03:31:13] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[03:31:13] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[03:31:13] [PASSED] single_pixel_source_buffer
[03:31:13] [PASSED] single_pixel_clip_rectangle
[03:31:13] [PASSED] well_known_colors
[03:31:13] [PASSED] destination_pitch
[03:31:13] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[03:31:13] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[03:31:13] [PASSED] single_pixel_source_buffer
[03:31:13] [PASSED] single_pixel_clip_rectangle
[03:31:13] [PASSED] well_known_colors
[03:31:13] [PASSED] destination_pitch
[03:31:13] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[03:31:13] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[03:31:13] [PASSED] single_pixel_source_buffer
[03:31:13] [PASSED] single_pixel_clip_rectangle
[03:31:13] [PASSED] well_known_colors
[03:31:13] [PASSED] destination_pitch
[03:31:13] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[03:31:13] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[03:31:13] [PASSED] single_pixel_source_buffer
[03:31:13] [PASSED] single_pixel_clip_rectangle
[03:31:13] [PASSED] well_known_colors
[03:31:13] [PASSED] destination_pitch
[03:31:13] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[03:31:13] ============== drm_test_fb_xrgb8888_to_mono  ===============
[03:31:13] [PASSED] single_pixel_source_buffer
[03:31:13] [PASSED] single_pixel_clip_rectangle
[03:31:13] [PASSED] well_known_colors
[03:31:13] [PASSED] destination_pitch
[03:31:13] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[03:31:13] ============= [PASSED] drm_format_helper_test ==============
[03:31:13] ================= drm_format (18 subtests) =================
[03:31:13] [PASSED] drm_test_format_block_width_invalid
[03:31:13] [PASSED] drm_test_format_block_width_one_plane
[03:31:13] [PASSED] drm_test_format_block_width_two_plane
[03:31:13] [PASSED] drm_test_format_block_width_three_plane
[03:31:13] [PASSED] drm_test_format_block_width_tiled
[03:31:13] [PASSED] drm_test_format_block_height_invalid
[03:31:13] [PASSED] drm_test_format_block_height_one_plane
[03:31:13] [PASSED] drm_test_format_block_height_two_plane
[03:31:13] [PASSED] drm_test_format_block_height_three_plane
[03:31:13] [PASSED] drm_test_format_block_height_tiled
[03:31:13] [PASSED] drm_test_format_min_pitch_invalid
[03:31:13] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[03:31:13] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[03:31:13] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[03:31:13] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[03:31:13] [PASSED] drm_test_format_min_pitch_two_plane
[03:31:13] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[03:31:13] [PASSED] drm_test_format_min_pitch_tiled
[03:31:13] =================== [PASSED] drm_format ====================
[03:31:13] =============== drm_framebuffer (1 subtest) ================
[03:31:13] =============== drm_test_framebuffer_create  ===============
[03:31:13] [PASSED] ABGR8888 normal sizes
[03:31:13] [PASSED] ABGR8888 max sizes
[03:31:13] [PASSED] ABGR8888 pitch greater than min required
[03:31:13] [PASSED] ABGR8888 pitch less than min required
[03:31:13] [PASSED] ABGR8888 Invalid width
[03:31:13] [PASSED] ABGR8888 Invalid buffer handle
[03:31:13] [PASSED] No pixel format
[03:31:13] [PASSED] ABGR8888 Width 0
[03:31:13] [PASSED] ABGR8888 Height 0
[03:31:13] [PASSED] ABGR8888 Out of bound height * pitch combination
[03:31:13] [PASSED] ABGR8888 Large buffer offset
[03:31:13] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[03:31:13] [PASSED] ABGR8888 Valid buffer modifier
[03:31:13] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[03:31:13] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[03:31:13] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[03:31:13] [PASSED] NV12 Normal sizes
[03:31:13] [PASSED] NV12 Max sizes
[03:31:13] [PASSED] NV12 Invalid pitch
[03:31:13] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[03:31:13] [PASSED] NV12 different  modifier per-plane
[03:31:13] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[03:31:13] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[03:31:13] [PASSED] NV12 Modifier for inexistent plane
[03:31:13] [PASSED] NV12 Handle for inexistent plane
[03:31:13] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[03:31:13] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[03:31:13] [PASSED] YVU420 Normal sizes
[03:31:13] [PASSED] YVU420 Max sizes
[03:31:13] [PASSED] YVU420 Invalid pitch
[03:31:13] [PASSED] YVU420 Different pitches
[03:31:13] [PASSED] YVU420 Different buffer offsets/pitches
[03:31:13] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[03:31:13] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[03:31:13] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[03:31:13] [PASSED] YVU420 Valid modifier
[03:31:13] [PASSED] YVU420 Different modifiers per plane
[03:31:13] [PASSED] YVU420 Modifier for inexistent plane
[03:31:13] [PASSED] X0L2 Normal sizes
[03:31:13] [PASSED] X0L2 Max sizes
[03:31:13] [PASSED] X0L2 Invalid pitch
[03:31:13] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[03:31:13] [PASSED] X0L2 Handle for inexistent plane
[03:31:13] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[03:31:13] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[03:31:13] [PASSED] X0L2 Valid modifier
[03:31:13] [PASSED] X0L2 Modifier for inexistent plane
[03:31:13] =========== [PASSED] drm_test_framebuffer_create ===========
[03:31:13] ================= [PASSED] drm_framebuffer =================
[03:31:13] =============== drm-test-managed (1 subtest) ===============
[03:31:13] [PASSED] drm_test_managed_run_action
[03:31:13] ================ [PASSED] drm-test-managed =================
[03:31:13] =================== drm_mm (19 subtests) ===================
[03:31:13] [PASSED] drm_test_mm_init
[03:31:13] [PASSED] drm_test_mm_debug
[03:31:23] [PASSED] drm_test_mm_reserve
[03:31:33] [PASSED] drm_test_mm_insert
[03:31:34] [PASSED] drm_test_mm_replace
[03:31:34] [PASSED] drm_test_mm_insert_range
[03:31:34] [PASSED] drm_test_mm_frag
[03:31:34] [PASSED] drm_test_mm_align
[03:31:34] [PASSED] drm_test_mm_align32
[03:31:34] [PASSED] drm_test_mm_align64
[03:31:34] [PASSED] drm_test_mm_evict
[03:31:34] [PASSED] drm_test_mm_evict_range
[03:31:34] [PASSED] drm_test_mm_topdown
[03:31:34] [PASSED] drm_test_mm_bottomup
[03:31:34] [PASSED] drm_test_mm_lowest
[03:31:34] [PASSED] drm_test_mm_highest
[03:31:35] [PASSED] drm_test_mm_color
[03:31:36] [PASSED] drm_test_mm_color_evict
[03:31:36] [PASSED] drm_test_mm_color_evict_range
[03:31:36] ===================== [PASSED] drm_mm ======================
[03:31:36] ============= drm_modes_analog_tv (4 subtests) =============
[03:31:36] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[03:31:36] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[03:31:36] [PASSED] drm_test_modes_analog_tv_pal_576i
[03:31:36] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[03:31:36] =============== [PASSED] drm_modes_analog_tv ===============
[03:31:36] ============== drm_plane_helper (2 subtests) ===============
[03:31:36] =============== drm_test_check_plane_state  ================
[03:31:36] [PASSED] clipping_simple
[03:31:36] [PASSED] clipping_rotate_reflect
[03:31:36] [PASSED] positioning_simple
[03:31:36] [PASSED] upscaling
[03:31:36] [PASSED] downscaling
[03:31:36] [PASSED] rounding1
[03:31:36] [PASSED] rounding2
[03:31:36] [PASSED] rounding3
[03:31:36] [PASSED] rounding4
[03:31:36] =========== [PASSED] drm_test_check_plane_state ============
[03:31:36] =========== drm_test_check_invalid_plane_state  ============
[03:31:36] [PASSED] positioning_invalid
[03:31:36] [PASSED] upscaling_invalid
[03:31:36] [PASSED] downscaling_invalid
[03:31:36] ======= [PASSED] drm_test_check_invalid_plane_state ========
[03:31:36] ================ [PASSED] drm_plane_helper =================
[03:31:36] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[03:31:36] ====== drm_test_connector_helper_tv_get_modes_check  =======
[03:31:36] [PASSED] None
[03:31:36] [PASSED] PAL
[03:31:36] [PASSED] NTSC
[03:31:36] [PASSED] Both, NTSC Default
[03:31:36] [PASSED] Both, PAL Default
[03:31:36] [PASSED] Both, NTSC Default, with PAL on command-line
[03:31:36] [PASSED] Both, PAL Default, with NTSC on command-line
[03:31:36] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[03:31:36] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[03:31:36] ================== drm_rect (9 subtests) ===================
[03:31:36] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[03:31:36] [PASSED] drm_test_rect_clip_scaled_not_clipped
[03:31:36] [PASSED] drm_test_rect_clip_scaled_clipped
[03:31:36] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[03:31:36] ================= drm_test_rect_intersect  =================
[03:31:36] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[03:31:36] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[03:31:36] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[03:31:36] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[03:31:36] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[03:31:36] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[03:31:36] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[03:31:36] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[03:31:36] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[03:31:36] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[03:31:36] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[03:31:36] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[03:31:36] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[03:31:36] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[03:31:36] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[03:31:36] ============= [PASSED] drm_test_rect_intersect =============
[03:31:36] ================ drm_test_rect_calc_hscale  ================
[03:31:36] [PASSED] normal use
[03:31:36] [PASSED] out of max range
[03:31:36] [PASSED] out of min range
[03:31:36] [PASSED] zero dst
[03:31:36] [PASSED] negative src
[03:31:36] [PASSED] negative dst
[03:31:36] ============ [PASSED] drm_test_rect_calc_hscale ============
[03:31:36] ================ drm_test_rect_calc_vscale  ================
[03:31:36] [PASSED] normal use
[03:31:36] [PASSED] out of max range
[03:31:36] [PASSED] out of min range
[03:31:36] [PASSED] zero dst
[03:31:36] [PASSED] negative src
[03:31:36] [PASSED] negative dst
[03:31:36] ============ [PASSED] drm_test_rect_calc_vscale ============
[03:31:36] ================== drm_test_rect_rotate  ===================
[03:31:36] [PASSED] reflect-x
[03:31:36] [PASSED] reflect-y
[03:31:36] [PASSED] rotate-0
[03:31:36] [PASSED] rotate-90
[03:31:36] [PASSED] rotate-180
[03:31:36] [PASSED] rotate-270
[03:31:36] ============== [PASSED] drm_test_rect_rotate ===============
[03:31:36] ================ drm_test_rect_rotate_inv  =================
[03:31:36] [PASSED] reflect-x
[03:31:36] [PASSED] reflect-y
[03:31:36] [PASSED] rotate-0
[03:31:36] [PASSED] rotate-90
[03:31:36] [PASSED] rotate-180
[03:31:36] [PASSED] rotate-270
[03:31:36] ============ [PASSED] drm_test_rect_rotate_inv =============
[03:31:36] ==================== [PASSED] drm_rect =====================
[03:31:36] ============================================================
[03:31:36] Testing complete. Ran 333 tests: passed: 333
[03:31:36] Elapsed time: 43.495s total, 1.691s configuring, 18.272s building, 23.458s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


