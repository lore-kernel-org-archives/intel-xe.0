Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25669C6FA8F
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 09:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD96510E1AA;
	Tue, 29 Aug 2023 09:07:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E841A10E1AA;
 Tue, 29 Aug 2023 09:07:21 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E3CFBAADDD;
 Tue, 29 Aug 2023 09:07:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Tue, 29 Aug 2023 09:07:21 -0000
Message-ID: <169330004192.16746.14385601382290836604@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230829080429.4024-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230829080429.4024-1-niranjana.vishwanathapura@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_fixup!_?=
 =?utf-8?q?drm/xe/pvc=3A_Use_fast_copy_engines_as_migrate_engine_on_PVC?=
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

Series: fixup! drm/xe/pvc: Use fast copy engines as migrate engine on PVC
URL   : https://patchwork.freedesktop.org/series/122998/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[09:06:10] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:06:14] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[09:06:34] Starting KUnit Kernel (1/1)...
[09:06:34] ============================================================
[09:06:34] ==================== xe_bo (2 subtests) ====================
[09:06:34] [SKIPPED] xe_ccs_migrate_kunit
[09:06:34] [SKIPPED] xe_bo_evict_kunit
[09:06:34] ===================== [SKIPPED] xe_bo ======================
[09:06:34] ================== xe_dma_buf (1 subtest) ==================
[09:06:34] [SKIPPED] xe_dma_buf_kunit
[09:06:34] =================== [SKIPPED] xe_dma_buf ===================
[09:06:34] ================== xe_migrate (1 subtest) ==================
[09:06:34] [SKIPPED] xe_migrate_sanity_kunit
[09:06:34] =================== [SKIPPED] xe_migrate ===================
[09:06:34] =================== xe_pci (2 subtests) ====================
[09:06:34] [PASSED] xe_gmdid_graphics_ip
[09:06:34] [PASSED] xe_gmdid_media_ip
[09:06:34] ===================== [PASSED] xe_pci ======================
[09:06:34] ==================== xe_rtp (1 subtest) ====================
[09:06:34] ================== xe_rtp_process_tests  ===================
[09:06:34] [PASSED] coalesce-same-reg
[09:06:34] [PASSED] no-match-no-add
[09:06:34] [PASSED] no-match-no-add-multiple-rules
[09:06:34] [PASSED] two-regs-two-entries
[09:06:34] [PASSED] clr-one-set-other
[09:06:34] [PASSED] set-field
[09:06:34] [PASSED] conflict-duplicate
[09:06:34] [PASSED] conflict-not-disjoint
[09:06:34] [PASSED] conflict-reg-type
[09:06:34] ============== [PASSED] xe_rtp_process_tests ===============
[09:06:34] ===================== [PASSED] xe_rtp ======================
[09:06:34] ==================== xe_wa (1 subtest) =====================
[09:06:34] ======================== xe_wa_gt  =========================
[09:06:34] [PASSED] TIGERLAKE (B0)
[09:06:34] [PASSED] DG1 (A0)
[09:06:34] [PASSED] DG1 (B0)
[09:06:34] [PASSED] ALDERLAKE_S (A0)
[09:06:34] [PASSED] ALDERLAKE_S (B0)
[09:06:34] [PASSED] ALDERLAKE_S (C0)
[09:06:34] [PASSED] ALDERLAKE_S (D0)
[09:06:34] [PASSED] ALDERLAKE_P (A0)
[09:06:34] [PASSED] ALDERLAKE_P (B0)
[09:06:34] [PASSED] ALDERLAKE_P (C0)
[09:06:34] [PASSED] DG2_G10 (A0)
[09:06:34] [PASSED] DG2_G10 (A1)
[09:06:34] [PASSED] DG2_G10 (B0)
[09:06:34] [PASSED] DG2_G10 (C0)
[09:06:34] [PASSED] DG2_G11 (A0)
[09:06:34] [PASSED] DG2_G11 (B0)
[09:06:34] [PASSED] DG2_G11 (B1)
[09:06:34] [PASSED] DG2_G12 (A0)
[09:06:34] [PASSED] DG2_G12 (A1)
[09:06:34] [PASSED] PVC (B0)
[09:06:34] [PASSED] PVC (B1)
[09:06:34] [PASSED] PVC (C0)
[09:06:34] ==================== [PASSED] xe_wa_gt =====================
[09:06:34] ====================== [PASSED] xe_wa ======================
[09:06:34] ============================================================
[09:06:34] Testing complete. Ran 37 tests: passed: 33, skipped: 4
[09:06:34] Elapsed time: 24.289s total, 4.223s configuring, 19.947s building, 0.095s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[09:06:34] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:06:36] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[09:06:55] Starting KUnit Kernel (1/1)...
[09:06:55] ============================================================
[09:06:55] ============ drm_test_pick_cmdline (2 subtests) ============
[09:06:55] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[09:06:55] =============== drm_test_pick_cmdline_named  ===============
[09:06:55] [PASSED] NTSC
[09:06:55] [PASSED] NTSC-J
[09:06:55] [PASSED] PAL
[09:06:55] [PASSED] PAL-M
[09:06:55] =========== [PASSED] drm_test_pick_cmdline_named ===========
[09:06:55] ============== [PASSED] drm_test_pick_cmdline ==============
[09:06:55] ================== drm_buddy (6 subtests) ==================
[09:06:55] [PASSED] drm_test_buddy_alloc_limit
[09:06:55] [PASSED] drm_test_buddy_alloc_range
[09:06:55] [PASSED] drm_test_buddy_alloc_optimistic
[09:06:55] [PASSED] drm_test_buddy_alloc_pessimistic
[09:06:55] [PASSED] drm_test_buddy_alloc_smoke
[09:06:55] [PASSED] drm_test_buddy_alloc_pathological
[09:06:55] ==================== [PASSED] drm_buddy ====================
[09:06:55] ============= drm_cmdline_parser (40 subtests) =============
[09:06:55] [PASSED] drm_test_cmdline_force_d_only
[09:06:55] [PASSED] drm_test_cmdline_force_D_only_dvi
[09:06:55] [PASSED] drm_test_cmdline_force_D_only_hdmi
[09:06:55] [PASSED] drm_test_cmdline_force_D_only_not_digital
[09:06:55] [PASSED] drm_test_cmdline_force_e_only
[09:06:55] [PASSED] drm_test_cmdline_res
[09:06:55] [PASSED] drm_test_cmdline_res_vesa
[09:06:55] [PASSED] drm_test_cmdline_res_vesa_rblank
[09:06:55] [PASSED] drm_test_cmdline_res_rblank
[09:06:55] [PASSED] drm_test_cmdline_res_bpp
[09:06:55] [PASSED] drm_test_cmdline_res_refresh
[09:06:55] [PASSED] drm_test_cmdline_res_bpp_refresh
[09:06:55] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[09:06:55] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[09:06:55] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[09:06:55] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[09:06:55] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[09:06:55] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[09:06:55] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[09:06:55] [PASSED] drm_test_cmdline_res_margins_force_on
[09:06:55] [PASSED] drm_test_cmdline_res_vesa_margins
[09:06:55] [PASSED] drm_test_cmdline_name
[09:06:55] [PASSED] drm_test_cmdline_name_bpp
[09:06:55] [PASSED] drm_test_cmdline_name_option
[09:06:55] [PASSED] drm_test_cmdline_name_bpp_option
[09:06:55] [PASSED] drm_test_cmdline_rotate_0
[09:06:55] [PASSED] drm_test_cmdline_rotate_90
[09:06:55] [PASSED] drm_test_cmdline_rotate_180
[09:06:55] [PASSED] drm_test_cmdline_rotate_270
[09:06:55] [PASSED] drm_test_cmdline_hmirror
[09:06:55] [PASSED] drm_test_cmdline_vmirror
[09:06:55] [PASSED] drm_test_cmdline_margin_options
[09:06:55] [PASSED] drm_test_cmdline_multiple_options
[09:06:55] [PASSED] drm_test_cmdline_bpp_extra_and_option
[09:06:55] [PASSED] drm_test_cmdline_extra_and_option
[09:06:55] [PASSED] drm_test_cmdline_freestanding_options
[09:06:55] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[09:06:55] [PASSED] drm_test_cmdline_panel_orientation
[09:06:55] ================ drm_test_cmdline_invalid  =================
[09:06:55] [PASSED] margin_only
[09:06:55] [PASSED] interlace_only
[09:06:55] [PASSED] res_missing_x
[09:06:55] [PASSED] res_missing_y
[09:06:55] [PASSED] res_bad_y
[09:06:55] [PASSED] res_missing_y_bpp
[09:06:55] [PASSED] res_bad_bpp
[09:06:55] [PASSED] res_bad_refresh
[09:06:55] [PASSED] res_bpp_refresh_force_on_off
[09:06:55] [PASSED] res_invalid_mode
[09:06:55] [PASSED] res_bpp_wrong_place_mode
[09:06:55] [PASSED] name_bpp_refresh
[09:06:55] [PASSED] name_refresh
[09:06:55] [PASSED] name_refresh_wrong_mode
[09:06:55] [PASSED] name_refresh_invalid_mode
[09:06:55] [PASSED] rotate_multiple
[09:06:55] [PASSED] rotate_invalid_val
[09:06:55] [PASSED] rotate_truncated
[09:06:55] [PASSED] invalid_option
[09:06:55] [PASSED] invalid_tv_option
[09:06:55] [PASSED] truncated_tv_option
[09:06:55] ============ [PASSED] drm_test_cmdline_invalid =============
[09:06:55] =============== drm_test_cmdline_tv_options  ===============
[09:06:55] [PASSED] NTSC
[09:06:55] [PASSED] NTSC_443
[09:06:55] [PASSED] NTSC_J
[09:06:55] [PASSED] PAL
[09:06:55] [PASSED] PAL_M
[09:06:55] [PASSED] PAL_N
[09:06:55] [PASSED] SECAM
[09:06:55] =========== [PASSED] drm_test_cmdline_tv_options ===========
[09:06:55] =============== [PASSED] drm_cmdline_parser ================
[09:06:55] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[09:06:55] ========== drm_test_get_tv_mode_from_name_valid  ===========
[09:06:55] [PASSED] NTSC
[09:06:55] [PASSED] NTSC-443
[09:06:55] [PASSED] NTSC-J
[09:06:55] [PASSED] PAL
[09:06:55] [PASSED] PAL-M
[09:06:55] [PASSED] PAL-N
[09:06:55] [PASSED] SECAM
[09:06:55] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[09:06:55] [PASSED] drm_test_get_tv_mode_from_name_truncated
[09:06:55] ============ [PASSED] drm_get_tv_mode_from_name ============
[09:06:55] ============= drm_damage_helper (21 subtests) ==============
[09:06:55] [PASSED] drm_test_damage_iter_no_damage
[09:06:55] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[09:06:55] [PASSED] drm_test_damage_iter_no_damage_src_moved
[09:06:55] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[09:06:55] [PASSED] drm_test_damage_iter_no_damage_not_visible
[09:06:55] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[09:06:55] [PASSED] drm_test_damage_iter_no_damage_no_fb
[09:06:55] [PASSED] drm_test_damage_iter_simple_damage
[09:06:55] [PASSED] drm_test_damage_iter_single_damage
[09:06:55] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[09:06:55] [PASSED] drm_test_damage_iter_single_damage_outside_src
[09:06:55] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[09:06:55] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[09:06:55] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[09:06:55] [PASSED] drm_test_damage_iter_single_damage_src_moved
[09:06:55] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[09:06:55] [PASSED] drm_test_damage_iter_damage
[09:06:55] [PASSED] drm_test_damage_iter_damage_one_intersect
[09:06:55] [PASSED] drm_test_damage_iter_damage_one_outside
[09:06:55] [PASSED] drm_test_damage_iter_damage_src_moved
[09:06:55] [PASSED] drm_test_damage_iter_damage_not_visible
[09:06:55] ================ [PASSED] drm_damage_helper ================
[09:06:55] ============== drm_dp_mst_helper (2 subtests) ==============
[09:06:55] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[09:06:55] [PASSED] Clock 154000 BPP 30 DSC disabled
[09:06:55] [PASSED] Clock 234000 BPP 30 DSC disabled
[09:06:55] [PASSED] Clock 297000 BPP 24 DSC disabled
[09:06:55] [PASSED] Clock 332880 BPP 24 DSC enabled
[09:06:55] [PASSED] Clock 324540 BPP 24 DSC enabled
[09:06:55] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[09:06:55] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[09:06:55] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[09:06:55] [PASSED] DP_POWER_UP_PHY with port number
[09:06:55] [PASSED] DP_POWER_DOWN_PHY with port number
[09:06:55] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[09:06:55] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[09:06:55] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[09:06:55] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[09:06:55] [PASSED] DP_QUERY_PAYLOAD with port number
[09:06:55] [PASSED] DP_QUERY_PAYLOAD with VCPI
[09:06:55] [PASSED] DP_REMOTE_DPCD_READ with port number
[09:06:55] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[09:06:55] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[09:06:55] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[09:06:55] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[09:06:55] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[09:06:55] [PASSED] DP_REMOTE_I2C_READ with port number
[09:06:55] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[09:06:55] [PASSED] DP_REMOTE_I2C_READ with transactions array
[09:06:55] [PASSED] DP_REMOTE_I2C_WRITE with port number
[09:06:55] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[09:06:55] [PASSED] DP_REMOTE_I2C_WRITE with data array
[09:06:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[09:06:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[09:06:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[09:06:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[09:06:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[09:06:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[09:06:55] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[09:06:55] ================ [PASSED] drm_dp_mst_helper ================
[09:06:55] =========== drm_format_helper_test (11 subtests) ===========
[09:06:55] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[09:06:55] [PASSED] single_pixel_source_buffer
[09:06:55] [PASSED] single_pixel_clip_rectangle
[09:06:55] [PASSED] well_known_colors
[09:06:55] [PASSED] destination_pitch
[09:06:55] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[09:06:55] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[09:06:55] [PASSED] single_pixel_source_buffer
[09:06:55] [PASSED] single_pixel_clip_rectangle
[09:06:55] [PASSED] well_known_colors
[09:06:55] [PASSED] destination_pitch
[09:06:55] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[09:06:55] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[09:06:55] [PASSED] single_pixel_source_buffer
[09:06:55] [PASSED] single_pixel_clip_rectangle
[09:06:55] [PASSED] well_known_colors
[09:06:55] [PASSED] destination_pitch
[09:06:55] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[09:06:55] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[09:06:55] [PASSED] single_pixel_source_buffer
[09:06:55] [PASSED] single_pixel_clip_rectangle
[09:06:55] [PASSED] well_known_colors
[09:06:55] [PASSED] destination_pitch
[09:06:55] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[09:06:55] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[09:06:55] [PASSED] single_pixel_source_buffer
[09:06:55] [PASSED] single_pixel_clip_rectangle
[09:06:55] [PASSED] well_known_colors
[09:06:55] [PASSED] destination_pitch
[09:06:55] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[09:06:55] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[09:06:55] [PASSED] single_pixel_source_buffer
[09:06:55] [PASSED] single_pixel_clip_rectangle
[09:06:55] [PASSED] well_known_colors
[09:06:55] [PASSED] destination_pitch
[09:06:55] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[09:06:55] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[09:06:55] [PASSED] single_pixel_source_buffer
[09:06:55] [PASSED] single_pixel_clip_rectangle
[09:06:55] [PASSED] well_known_colors
[09:06:55] [PASSED] destination_pitch
[09:06:55] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[09:06:55] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[09:06:55] [PASSED] single_pixel_source_buffer
[09:06:55] [PASSED] single_pixel_clip_rectangle
[09:06:55] [PASSED] well_known_colors
[09:06:55] [PASSED] destination_pitch
[09:06:55] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[09:06:55] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[09:06:55] [PASSED] single_pixel_source_buffer
[09:06:55] [PASSED] single_pixel_clip_rectangle
[09:06:55] [PASSED] well_known_colors
[09:06:55] [PASSED] destination_pitch
[09:06:55] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[09:06:55] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[09:06:55] [PASSED] single_pixel_source_buffer
[09:06:55] [PASSED] single_pixel_clip_rectangle
[09:06:55] [PASSED] well_known_colors
[09:06:55] [PASSED] destination_pitch
[09:06:55] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[09:06:55] ============== drm_test_fb_xrgb8888_to_mono  ===============
[09:06:55] [PASSED] single_pixel_source_buffer
[09:06:55] [PASSED] single_pixel_clip_rectangle
[09:06:55] [PASSED] well_known_colors
[09:06:55] [PASSED] destination_pitch
[09:06:55] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[09:06:55] ============= [PASSED] drm_format_helper_test ==============
[09:06:55] ================= drm_format (18 subtests) =================
[09:06:55] [PASSED] drm_test_format_block_width_invalid
[09:06:55] [PASSED] drm_test_format_block_width_one_plane
[09:06:55] [PASSED] drm_test_format_block_width_two_plane
[09:06:55] [PASSED] drm_test_format_block_width_three_plane
[09:06:55] [PASSED] drm_test_format_block_width_tiled
[09:06:55] [PASSED] drm_test_format_block_height_invalid
[09:06:55] [PASSED] drm_test_format_block_height_one_plane
[09:06:55] [PASSED] drm_test_format_block_height_two_plane
[09:06:55] [PASSED] drm_test_format_block_height_three_plane
[09:06:55] [PASSED] drm_test_format_block_height_tiled
[09:06:55] [PASSED] drm_test_format_min_pitch_invalid
[09:06:55] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[09:06:55] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[09:06:55] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[09:06:55] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[09:06:55] [PASSED] drm_test_format_min_pitch_two_plane
[09:06:55] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[09:06:55] [PASSED] drm_test_format_min_pitch_tiled
[09:06:55] =================== [PASSED] drm_format ====================
[09:06:55] =============== drm_framebuffer (1 subtest) ================
[09:06:55] =============== drm_test_framebuffer_create  ===============
[09:06:55] [PASSED] ABGR8888 normal sizes
[09:06:55] [PASSED] ABGR8888 max sizes
[09:06:55] [PASSED] ABGR8888 pitch greater than min required
[09:06:55] [PASSED] ABGR8888 pitch less than min required
[09:06:55] [PASSED] ABGR8888 Invalid width
[09:06:55] [PASSED] ABGR8888 Invalid buffer handle
[09:06:55] [PASSED] No pixel format
[09:06:55] [PASSED] ABGR8888 Width 0
[09:06:55] [PASSED] ABGR8888 Height 0
[09:06:55] [PASSED] ABGR8888 Out of bound height * pitch combination
[09:06:55] [PASSED] ABGR8888 Large buffer offset
[09:06:55] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[09:06:55] [PASSED] ABGR8888 Valid buffer modifier
[09:06:55] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[09:06:55] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[09:06:55] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[09:06:55] [PASSED] NV12 Normal sizes
[09:06:55] [PASSED] NV12 Max sizes
[09:06:55] [PASSED] NV12 Invalid pitch
[09:06:55] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[09:06:55] [PASSED] NV12 different  modifier per-plane
[09:06:55] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[09:06:55] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[09:06:55] [PASSED] NV12 Modifier for inexistent plane
[09:06:55] [PASSED] NV12 Handle for inexistent plane
[09:06:55] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[09:06:55] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[09:06:55] [PASSED] YVU420 Normal sizes
[09:06:55] [PASSED] YVU420 Max sizes
[09:06:55] [PASSED] YVU420 Invalid pitch
[09:06:55] [PASSED] YVU420 Different pitches
[09:06:55] [PASSED] YVU420 Different buffer offsets/pitches
[09:06:55] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[09:06:55] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[09:06:55] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[09:06:55] [PASSED] YVU420 Valid modifier
[09:06:55] [PASSED] YVU420 Different modifiers per plane
[09:06:55] [PASSED] YVU420 Modifier for inexistent plane
[09:06:55] [PASSED] X0L2 Normal sizes
[09:06:55] [PASSED] X0L2 Max sizes
[09:06:55] [PASSED] X0L2 Invalid pitch
[09:06:55] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[09:06:55] [PASSED] X0L2 Handle for inexistent plane
[09:06:55] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[09:06:55] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[09:06:55] [PASSED] X0L2 Valid modifier
[09:06:55] [PASSED] X0L2 Modifier for inexistent plane
[09:06:55] =========== [PASSED] drm_test_framebuffer_create ===========
[09:06:55] ================= [PASSED] drm_framebuffer =================
[09:06:55] =============== drm-test-managed (1 subtest) ===============
[09:06:55] [PASSED] drm_test_managed_run_action
[09:06:55] ================ [PASSED] drm-test-managed =================
[09:06:55] =================== drm_mm (19 subtests) ===================
[09:06:55] [PASSED] drm_test_mm_init
[09:06:55] [PASSED] drm_test_mm_debug
[09:07:05] [PASSED] drm_test_mm_reserve
[09:07:15] [PASSED] drm_test_mm_insert
[09:07:16] [PASSED] drm_test_mm_replace
[09:07:16] [PASSED] drm_test_mm_insert_range
[09:07:16] [PASSED] drm_test_mm_frag
[09:07:16] [PASSED] drm_test_mm_align
[09:07:16] [PASSED] drm_test_mm_align32
[09:07:16] [PASSED] drm_test_mm_align64
[09:07:16] [PASSED] drm_test_mm_evict
[09:07:16] [PASSED] drm_test_mm_evict_range
[09:07:16] [PASSED] drm_test_mm_topdown
[09:07:16] [PASSED] drm_test_mm_bottomup
[09:07:16] [PASSED] drm_test_mm_lowest
[09:07:17] [PASSED] drm_test_mm_highest
[09:07:17] [PASSED] drm_test_mm_color
[09:07:18] [PASSED] drm_test_mm_color_evict
[09:07:18] [PASSED] drm_test_mm_color_evict_range
[09:07:18] ===================== [PASSED] drm_mm ======================
[09:07:18] ============= drm_modes_analog_tv (4 subtests) =============
[09:07:18] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[09:07:18] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[09:07:18] [PASSED] drm_test_modes_analog_tv_pal_576i
[09:07:18] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[09:07:18] =============== [PASSED] drm_modes_analog_tv ===============
[09:07:18] ============== drm_plane_helper (2 subtests) ===============
[09:07:18] =============== drm_test_check_plane_state  ================
[09:07:18] [PASSED] clipping_simple
[09:07:18] [PASSED] clipping_rotate_reflect
[09:07:18] [PASSED] positioning_simple
[09:07:18] [PASSED] upscaling
[09:07:18] [PASSED] downscaling
[09:07:18] [PASSED] rounding1
[09:07:18] [PASSED] rounding2
[09:07:18] [PASSED] rounding3
[09:07:18] [PASSED] rounding4
[09:07:18] =========== [PASSED] drm_test_check_plane_state ============
[09:07:18] =========== drm_test_check_invalid_plane_state  ============
[09:07:18] [PASSED] positioning_invalid
[09:07:18] [PASSED] upscaling_invalid
[09:07:18] [PASSED] downscaling_invalid
[09:07:18] ======= [PASSED] drm_test_check_invalid_plane_state ========
[09:07:18] ================ [PASSED] drm_plane_helper =================
[09:07:18] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[09:07:18] ====== drm_test_connector_helper_tv_get_modes_check  =======
[09:07:18] [PASSED] None
[09:07:18] [PASSED] PAL
[09:07:18] [PASSED] NTSC
[09:07:18] [PASSED] Both, NTSC Default
[09:07:18] [PASSED] Both, PAL Default
[09:07:18] [PASSED] Both, NTSC Default, with PAL on command-line
[09:07:18] [PASSED] Both, PAL Default, with NTSC on command-line
[09:07:18] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[09:07:18] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[09:07:18] ================== drm_rect (9 subtests) ===================
[09:07:18] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[09:07:18] [PASSED] drm_test_rect_clip_scaled_not_clipped
[09:07:18] [PASSED] drm_test_rect_clip_scaled_clipped
[09:07:18] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[09:07:18] ================= drm_test_rect_intersect  =================
[09:07:18] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[09:07:18] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[09:07:18] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[09:07:18] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[09:07:18] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[09:07:18] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[09:07:18] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[09:07:18] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[09:07:18] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[09:07:18] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[09:07:18] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[09:07:18] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[09:07:18] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[09:07:18] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[09:07:18] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[09:07:18] ============= [PASSED] drm_test_rect_intersect =============
[09:07:18] ================ drm_test_rect_calc_hscale  ================
[09:07:18] [PASSED] normal use
[09:07:18] [PASSED] out of max range
[09:07:18] [PASSED] out of min range
[09:07:18] [PASSED] zero dst
[09:07:18] [PASSED] negative src
[09:07:18] [PASSED] negative dst
[09:07:18] ============ [PASSED] drm_test_rect_calc_hscale ============
[09:07:18] ================ drm_test_rect_calc_vscale  ================
[09:07:18] [PASSED] normal use
[09:07:18] [PASSED] out of max range
[09:07:18] [PASSED] out of min range
[09:07:18] [PASSED] zero dst
[09:07:18] [PASSED] negative src
[09:07:18] [PASSED] negative dst
[09:07:18] ============ [PASSED] drm_test_rect_calc_vscale ============
[09:07:18] ================== drm_test_rect_rotate  ===================
[09:07:18] [PASSED] reflect-x
[09:07:18] [PASSED] reflect-y
[09:07:18] [PASSED] rotate-0
[09:07:18] [PASSED] rotate-90
[09:07:18] [PASSED] rotate-180
[09:07:18] [PASSED] rotate-270
[09:07:18] ============== [PASSED] drm_test_rect_rotate ===============
[09:07:18] ================ drm_test_rect_rotate_inv  =================
[09:07:18] [PASSED] reflect-x
[09:07:18] [PASSED] reflect-y
[09:07:18] [PASSED] rotate-0
[09:07:18] [PASSED] rotate-90
[09:07:18] [PASSED] rotate-180
[09:07:18] [PASSED] rotate-270
[09:07:18] ============ [PASSED] drm_test_rect_rotate_inv =============
[09:07:18] ==================== [PASSED] drm_rect =====================
[09:07:18] ================== drm_exec (7 subtests) ===================
[09:07:18] [PASSED] sanitycheck
[09:07:18] [PASSED] test_lock
[09:07:18] [PASSED] test_lock_unlock
[09:07:18] [PASSED] test_duplicates
[09:07:18] [PASSED] test_prepare
[09:07:18] [PASSED] test_prepare_array
[09:07:18] [PASSED] test_multiple_loops
[09:07:18] ==================== [PASSED] drm_exec =====================
[09:07:18] ============================================================
[09:07:18] Testing complete. Ran 340 tests: passed: 340
[09:07:18] Elapsed time: 43.454s total, 1.671s configuring, 18.799s building, 22.981s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


