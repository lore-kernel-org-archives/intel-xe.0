Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDD5EB8FAF
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 10:50:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73F510E5FA;
	Wed,  6 Sep 2023 10:50:07 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id BF18910E5FA;
 Wed,  6 Sep 2023 10:50:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AB1C9A02F0;
 Wed,  6 Sep 2023 10:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 06 Sep 2023 10:50:05 -0000
Message-ID: <169399740569.17390.5709257082277484975@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230906095039.3320-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230906095039.3320-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/drm?=
 =?utf-8?q?=5Fexec=2C_drm/tests=3A_Fix_/_WA_for_uaf_and_lock_alloc_trackin?=
 =?utf-8?q?g?=
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

Series: drm/drm_exec, drm/tests: Fix / WA for uaf and lock alloc tracking
URL   : https://patchwork.freedesktop.org/series/123322/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[10:48:54] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:48:58] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[10:49:18] Starting KUnit Kernel (1/1)...
[10:49:18] ============================================================
[10:49:18] ==================== xe_bo (2 subtests) ====================
[10:49:18] [SKIPPED] xe_ccs_migrate_kunit
[10:49:18] [SKIPPED] xe_bo_evict_kunit
[10:49:18] ===================== [SKIPPED] xe_bo ======================
[10:49:18] ================== xe_dma_buf (1 subtest) ==================
[10:49:18] [SKIPPED] xe_dma_buf_kunit
[10:49:18] =================== [SKIPPED] xe_dma_buf ===================
[10:49:18] ================== xe_migrate (1 subtest) ==================
[10:49:18] [SKIPPED] xe_migrate_sanity_kunit
[10:49:18] =================== [SKIPPED] xe_migrate ===================
[10:49:18] =================== xe_pci (2 subtests) ====================
[10:49:18] [PASSED] xe_gmdid_graphics_ip
[10:49:18] [PASSED] xe_gmdid_media_ip
[10:49:18] ===================== [PASSED] xe_pci ======================
[10:49:18] ==================== xe_rtp (1 subtest) ====================
[10:49:18] ================== xe_rtp_process_tests  ===================
[10:49:18] [PASSED] coalesce-same-reg
[10:49:18] [PASSED] no-match-no-add
[10:49:18] [PASSED] no-match-no-add-multiple-rules
[10:49:18] [PASSED] two-regs-two-entries
[10:49:18] [PASSED] clr-one-set-other
[10:49:18] [PASSED] set-field
[10:49:18] [PASSED] conflict-duplicate
[10:49:18] [PASSED] conflict-not-disjoint
[10:49:18] [PASSED] conflict-reg-type
[10:49:18] ============== [PASSED] xe_rtp_process_tests ===============
[10:49:18] ===================== [PASSED] xe_rtp ======================
[10:49:18] ==================== xe_wa (1 subtest) =====================
[10:49:18] ======================== xe_wa_gt  =========================
[10:49:18] [PASSED] TIGERLAKE (B0)
[10:49:18] [PASSED] DG1 (A0)
[10:49:18] [PASSED] DG1 (B0)
[10:49:18] [PASSED] ALDERLAKE_S (A0)
[10:49:18] [PASSED] ALDERLAKE_S (B0)
[10:49:18] [PASSED] ALDERLAKE_S (C0)
[10:49:18] [PASSED] ALDERLAKE_S (D0)
[10:49:18] [PASSED] ALDERLAKE_P (A0)
[10:49:18] [PASSED] ALDERLAKE_P (B0)
[10:49:18] [PASSED] ALDERLAKE_P (C0)
[10:49:18] [PASSED] DG2_G10 (A0)
[10:49:18] [PASSED] DG2_G10 (A1)
[10:49:18] [PASSED] DG2_G10 (B0)
[10:49:18] [PASSED] DG2_G10 (C0)
[10:49:18] [PASSED] DG2_G11 (A0)
[10:49:18] [PASSED] DG2_G11 (B0)
[10:49:18] [PASSED] DG2_G11 (B1)
[10:49:18] [PASSED] DG2_G12 (A0)
[10:49:18] [PASSED] DG2_G12 (A1)
[10:49:18] [PASSED] PVC (B0)
[10:49:18] [PASSED] PVC (B1)
[10:49:18] [PASSED] PVC (C0)
[10:49:18] ==================== [PASSED] xe_wa_gt =====================
[10:49:18] ====================== [PASSED] xe_wa ======================
[10:49:18] ============================================================
[10:49:18] Testing complete. Ran 37 tests: passed: 33, skipped: 4
[10:49:18] Elapsed time: 24.292s total, 4.205s configuring, 19.968s building, 0.098s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[10:49:18] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:49:20] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[10:49:39] Starting KUnit Kernel (1/1)...
[10:49:39] ============================================================
[10:49:39] ============ drm_test_pick_cmdline (2 subtests) ============
[10:49:39] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[10:49:39] =============== drm_test_pick_cmdline_named  ===============
[10:49:39] [PASSED] NTSC
[10:49:39] [PASSED] NTSC-J
[10:49:39] [PASSED] PAL
[10:49:39] [PASSED] PAL-M
[10:49:39] =========== [PASSED] drm_test_pick_cmdline_named ===========
[10:49:39] ============== [PASSED] drm_test_pick_cmdline ==============
[10:49:39] ================== drm_buddy (6 subtests) ==================
[10:49:39] [PASSED] drm_test_buddy_alloc_limit
[10:49:39] [PASSED] drm_test_buddy_alloc_range
[10:49:39] [PASSED] drm_test_buddy_alloc_optimistic
[10:49:39] [PASSED] drm_test_buddy_alloc_pessimistic
[10:49:39] [PASSED] drm_test_buddy_alloc_smoke
[10:49:39] [PASSED] drm_test_buddy_alloc_pathological
[10:49:39] ==================== [PASSED] drm_buddy ====================
[10:49:39] ============= drm_cmdline_parser (40 subtests) =============
[10:49:39] [PASSED] drm_test_cmdline_force_d_only
[10:49:39] [PASSED] drm_test_cmdline_force_D_only_dvi
[10:49:39] [PASSED] drm_test_cmdline_force_D_only_hdmi
[10:49:39] [PASSED] drm_test_cmdline_force_D_only_not_digital
[10:49:39] [PASSED] drm_test_cmdline_force_e_only
[10:49:39] [PASSED] drm_test_cmdline_res
[10:49:39] [PASSED] drm_test_cmdline_res_vesa
[10:49:39] [PASSED] drm_test_cmdline_res_vesa_rblank
[10:49:39] [PASSED] drm_test_cmdline_res_rblank
[10:49:39] [PASSED] drm_test_cmdline_res_bpp
[10:49:39] [PASSED] drm_test_cmdline_res_refresh
[10:49:39] [PASSED] drm_test_cmdline_res_bpp_refresh
[10:49:39] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[10:49:39] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[10:49:39] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[10:49:39] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[10:49:39] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[10:49:39] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[10:49:39] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[10:49:39] [PASSED] drm_test_cmdline_res_margins_force_on
[10:49:39] [PASSED] drm_test_cmdline_res_vesa_margins
[10:49:39] [PASSED] drm_test_cmdline_name
[10:49:39] [PASSED] drm_test_cmdline_name_bpp
[10:49:39] [PASSED] drm_test_cmdline_name_option
[10:49:39] [PASSED] drm_test_cmdline_name_bpp_option
[10:49:39] [PASSED] drm_test_cmdline_rotate_0
[10:49:39] [PASSED] drm_test_cmdline_rotate_90
[10:49:39] [PASSED] drm_test_cmdline_rotate_180
[10:49:39] [PASSED] drm_test_cmdline_rotate_270
[10:49:39] [PASSED] drm_test_cmdline_hmirror
[10:49:39] [PASSED] drm_test_cmdline_vmirror
[10:49:39] [PASSED] drm_test_cmdline_margin_options
[10:49:39] [PASSED] drm_test_cmdline_multiple_options
[10:49:39] [PASSED] drm_test_cmdline_bpp_extra_and_option
[10:49:39] [PASSED] drm_test_cmdline_extra_and_option
[10:49:39] [PASSED] drm_test_cmdline_freestanding_options
[10:49:39] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[10:49:39] [PASSED] drm_test_cmdline_panel_orientation
[10:49:39] ================ drm_test_cmdline_invalid  =================
[10:49:39] [PASSED] margin_only
[10:49:39] [PASSED] interlace_only
[10:49:39] [PASSED] res_missing_x
[10:49:39] [PASSED] res_missing_y
[10:49:39] [PASSED] res_bad_y
[10:49:39] [PASSED] res_missing_y_bpp
[10:49:39] [PASSED] res_bad_bpp
[10:49:39] [PASSED] res_bad_refresh
[10:49:39] [PASSED] res_bpp_refresh_force_on_off
[10:49:39] [PASSED] res_invalid_mode
[10:49:39] [PASSED] res_bpp_wrong_place_mode
[10:49:39] [PASSED] name_bpp_refresh
[10:49:39] [PASSED] name_refresh
[10:49:39] [PASSED] name_refresh_wrong_mode
[10:49:39] [PASSED] name_refresh_invalid_mode
[10:49:39] [PASSED] rotate_multiple
[10:49:39] [PASSED] rotate_invalid_val
[10:49:39] [PASSED] rotate_truncated
[10:49:39] [PASSED] invalid_option
[10:49:39] [PASSED] invalid_tv_option
[10:49:39] [PASSED] truncated_tv_option
[10:49:39] ============ [PASSED] drm_test_cmdline_invalid =============
[10:49:39] =============== drm_test_cmdline_tv_options  ===============
[10:49:39] [PASSED] NTSC
[10:49:39] [PASSED] NTSC_443
[10:49:39] [PASSED] NTSC_J
[10:49:39] [PASSED] PAL
[10:49:39] [PASSED] PAL_M
[10:49:39] [PASSED] PAL_N
[10:49:39] [PASSED] SECAM
[10:49:39] =========== [PASSED] drm_test_cmdline_tv_options ===========
[10:49:39] =============== [PASSED] drm_cmdline_parser ================
[10:49:39] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[10:49:39] ========== drm_test_get_tv_mode_from_name_valid  ===========
[10:49:39] [PASSED] NTSC
[10:49:39] [PASSED] NTSC-443
[10:49:39] [PASSED] NTSC-J
[10:49:39] [PASSED] PAL
[10:49:39] [PASSED] PAL-M
[10:49:39] [PASSED] PAL-N
[10:49:39] [PASSED] SECAM
[10:49:39] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[10:49:39] [PASSED] drm_test_get_tv_mode_from_name_truncated
[10:49:39] ============ [PASSED] drm_get_tv_mode_from_name ============
[10:49:39] ============= drm_damage_helper (21 subtests) ==============
[10:49:39] [PASSED] drm_test_damage_iter_no_damage
[10:49:39] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[10:49:39] [PASSED] drm_test_damage_iter_no_damage_src_moved
[10:49:39] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[10:49:39] [PASSED] drm_test_damage_iter_no_damage_not_visible
[10:49:39] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[10:49:39] [PASSED] drm_test_damage_iter_no_damage_no_fb
[10:49:39] [PASSED] drm_test_damage_iter_simple_damage
[10:49:39] [PASSED] drm_test_damage_iter_single_damage
[10:49:39] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[10:49:39] [PASSED] drm_test_damage_iter_single_damage_outside_src
[10:49:39] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[10:49:39] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[10:49:39] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[10:49:39] [PASSED] drm_test_damage_iter_single_damage_src_moved
[10:49:39] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[10:49:39] [PASSED] drm_test_damage_iter_damage
[10:49:39] [PASSED] drm_test_damage_iter_damage_one_intersect
[10:49:39] [PASSED] drm_test_damage_iter_damage_one_outside
[10:49:39] [PASSED] drm_test_damage_iter_damage_src_moved
[10:49:39] [PASSED] drm_test_damage_iter_damage_not_visible
[10:49:39] ================ [PASSED] drm_damage_helper ================
[10:49:39] ============== drm_dp_mst_helper (2 subtests) ==============
[10:49:39] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[10:49:39] [PASSED] Clock 154000 BPP 30 DSC disabled
[10:49:39] [PASSED] Clock 234000 BPP 30 DSC disabled
[10:49:39] [PASSED] Clock 297000 BPP 24 DSC disabled
[10:49:39] [PASSED] Clock 332880 BPP 24 DSC enabled
[10:49:39] [PASSED] Clock 324540 BPP 24 DSC enabled
[10:49:39] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[10:49:39] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[10:49:39] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[10:49:39] [PASSED] DP_POWER_UP_PHY with port number
[10:49:39] [PASSED] DP_POWER_DOWN_PHY with port number
[10:49:39] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[10:49:39] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[10:49:39] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[10:49:39] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[10:49:39] [PASSED] DP_QUERY_PAYLOAD with port number
[10:49:39] [PASSED] DP_QUERY_PAYLOAD with VCPI
[10:49:39] [PASSED] DP_REMOTE_DPCD_READ with port number
[10:49:39] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[10:49:39] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[10:49:39] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[10:49:39] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[10:49:39] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[10:49:39] [PASSED] DP_REMOTE_I2C_READ with port number
[10:49:39] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[10:49:39] [PASSED] DP_REMOTE_I2C_READ with transactions array
[10:49:39] [PASSED] DP_REMOTE_I2C_WRITE with port number
[10:49:39] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[10:49:39] [PASSED] DP_REMOTE_I2C_WRITE with data array
[10:49:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[10:49:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[10:49:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[10:49:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[10:49:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[10:49:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[10:49:39] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[10:49:39] ================ [PASSED] drm_dp_mst_helper ================
[10:49:39] =========== drm_format_helper_test (11 subtests) ===========
[10:49:39] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[10:49:39] [PASSED] single_pixel_source_buffer
[10:49:39] [PASSED] single_pixel_clip_rectangle
[10:49:39] [PASSED] well_known_colors
[10:49:39] [PASSED] destination_pitch
[10:49:39] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[10:49:39] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[10:49:39] [PASSED] single_pixel_source_buffer
[10:49:39] [PASSED] single_pixel_clip_rectangle
[10:49:39] [PASSED] well_known_colors
[10:49:39] [PASSED] destination_pitch
[10:49:39] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[10:49:39] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[10:49:39] [PASSED] single_pixel_source_buffer
[10:49:39] [PASSED] single_pixel_clip_rectangle
[10:49:39] [PASSED] well_known_colors
[10:49:39] [PASSED] destination_pitch
[10:49:39] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[10:49:39] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[10:49:39] [PASSED] single_pixel_source_buffer
[10:49:39] [PASSED] single_pixel_clip_rectangle
[10:49:39] [PASSED] well_known_colors
[10:49:39] [PASSED] destination_pitch
[10:49:39] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[10:49:39] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[10:49:39] [PASSED] single_pixel_source_buffer
[10:49:39] [PASSED] single_pixel_clip_rectangle
[10:49:39] [PASSED] well_known_colors
[10:49:39] [PASSED] destination_pitch
[10:49:39] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[10:49:39] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[10:49:39] [PASSED] single_pixel_source_buffer
[10:49:39] [PASSED] single_pixel_clip_rectangle
[10:49:39] [PASSED] well_known_colors
[10:49:39] [PASSED] destination_pitch
[10:49:39] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[10:49:39] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[10:49:39] [PASSED] single_pixel_source_buffer
[10:49:39] [PASSED] single_pixel_clip_rectangle
[10:49:39] [PASSED] well_known_colors
[10:49:39] [PASSED] destination_pitch
[10:49:39] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[10:49:39] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[10:49:39] [PASSED] single_pixel_source_buffer
[10:49:39] [PASSED] single_pixel_clip_rectangle
[10:49:39] [PASSED] well_known_colors
[10:49:39] [PASSED] destination_pitch
[10:49:39] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[10:49:39] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[10:49:39] [PASSED] single_pixel_source_buffer
[10:49:39] [PASSED] single_pixel_clip_rectangle
[10:49:39] [PASSED] well_known_colors
[10:49:39] [PASSED] destination_pitch
[10:49:39] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[10:49:39] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[10:49:39] [PASSED] single_pixel_source_buffer
[10:49:39] [PASSED] single_pixel_clip_rectangle
[10:49:39] [PASSED] well_known_colors
[10:49:39] [PASSED] destination_pitch
[10:49:39] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[10:49:39] ============== drm_test_fb_xrgb8888_to_mono  ===============
[10:49:39] [PASSED] single_pixel_source_buffer
[10:49:39] [PASSED] single_pixel_clip_rectangle
[10:49:39] [PASSED] well_known_colors
[10:49:39] [PASSED] destination_pitch
[10:49:39] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[10:49:39] ============= [PASSED] drm_format_helper_test ==============
[10:49:39] ================= drm_format (18 subtests) =================
[10:49:39] [PASSED] drm_test_format_block_width_invalid
[10:49:39] [PASSED] drm_test_format_block_width_one_plane
[10:49:39] [PASSED] drm_test_format_block_width_two_plane
[10:49:39] [PASSED] drm_test_format_block_width_three_plane
[10:49:39] [PASSED] drm_test_format_block_width_tiled
[10:49:39] [PASSED] drm_test_format_block_height_invalid
[10:49:39] [PASSED] drm_test_format_block_height_one_plane
[10:49:39] [PASSED] drm_test_format_block_height_two_plane
[10:49:39] [PASSED] drm_test_format_block_height_three_plane
[10:49:39] [PASSED] drm_test_format_block_height_tiled
[10:49:39] [PASSED] drm_test_format_min_pitch_invalid
[10:49:39] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[10:49:39] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[10:49:39] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[10:49:39] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[10:49:39] [PASSED] drm_test_format_min_pitch_two_plane
[10:49:39] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[10:49:39] [PASSED] drm_test_format_min_pitch_tiled
[10:49:39] =================== [PASSED] drm_format ====================
[10:49:39] =============== drm_framebuffer (1 subtest) ================
[10:49:39] =============== drm_test_framebuffer_create  ===============
[10:49:39] [PASSED] ABGR8888 normal sizes
[10:49:39] [PASSED] ABGR8888 max sizes
[10:49:39] [PASSED] ABGR8888 pitch greater than min required
[10:49:39] [PASSED] ABGR8888 pitch less than min required
[10:49:39] [PASSED] ABGR8888 Invalid width
[10:49:39] [PASSED] ABGR8888 Invalid buffer handle
[10:49:39] [PASSED] No pixel format
[10:49:39] [PASSED] ABGR8888 Width 0
[10:49:39] [PASSED] ABGR8888 Height 0
[10:49:39] [PASSED] ABGR8888 Out of bound height * pitch combination
[10:49:39] [PASSED] ABGR8888 Large buffer offset
[10:49:39] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[10:49:39] [PASSED] ABGR8888 Valid buffer modifier
[10:49:39] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[10:49:39] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[10:49:39] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[10:49:39] [PASSED] NV12 Normal sizes
[10:49:39] [PASSED] NV12 Max sizes
[10:49:39] [PASSED] NV12 Invalid pitch
[10:49:39] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[10:49:39] [PASSED] NV12 different  modifier per-plane
[10:49:39] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[10:49:39] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[10:49:39] [PASSED] NV12 Modifier for inexistent plane
[10:49:39] [PASSED] NV12 Handle for inexistent plane
[10:49:39] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[10:49:39] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[10:49:39] [PASSED] YVU420 Normal sizes
[10:49:39] [PASSED] YVU420 Max sizes
[10:49:39] [PASSED] YVU420 Invalid pitch
[10:49:39] [PASSED] YVU420 Different pitches
[10:49:39] [PASSED] YVU420 Different buffer offsets/pitches
[10:49:39] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[10:49:39] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[10:49:39] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[10:49:39] [PASSED] YVU420 Valid modifier
[10:49:39] [PASSED] YVU420 Different modifiers per plane
[10:49:39] [PASSED] YVU420 Modifier for inexistent plane
[10:49:39] [PASSED] X0L2 Normal sizes
[10:49:39] [PASSED] X0L2 Max sizes
[10:49:39] [PASSED] X0L2 Invalid pitch
[10:49:39] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[10:49:39] [PASSED] X0L2 Handle for inexistent plane
[10:49:39] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[10:49:39] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[10:49:39] [PASSED] X0L2 Valid modifier
[10:49:39] [PASSED] X0L2 Modifier for inexistent plane
[10:49:39] =========== [PASSED] drm_test_framebuffer_create ===========
[10:49:39] ================= [PASSED] drm_framebuffer =================
[10:49:39] =============== drm-test-managed (1 subtest) ===============
[10:49:39] [PASSED] drm_test_managed_run_action
[10:49:39] ================ [PASSED] drm-test-managed =================
[10:49:39] =================== drm_mm (19 subtests) ===================
[10:49:39] [PASSED] drm_test_mm_init
[10:49:39] [PASSED] drm_test_mm_debug
[10:49:49] [PASSED] drm_test_mm_reserve
[10:49:59] [PASSED] drm_test_mm_insert
[10:50:00] [PASSED] drm_test_mm_replace
[10:50:00] [PASSED] drm_test_mm_insert_range
[10:50:00] [PASSED] drm_test_mm_frag
[10:50:00] [PASSED] drm_test_mm_align
[10:50:00] [PASSED] drm_test_mm_align32
[10:50:00] [PASSED] drm_test_mm_align64
[10:50:00] [PASSED] drm_test_mm_evict
[10:50:00] [PASSED] drm_test_mm_evict_range
[10:50:00] [PASSED] drm_test_mm_topdown
[10:50:00] [PASSED] drm_test_mm_bottomup
[10:50:00] [PASSED] drm_test_mm_lowest
[10:50:00] [PASSED] drm_test_mm_highest
[10:50:01] [PASSED] drm_test_mm_color
[10:50:02] [PASSED] drm_test_mm_color_evict
[10:50:02] [PASSED] drm_test_mm_color_evict_range
[10:50:02] ===================== [PASSED] drm_mm ======================
[10:50:02] ============= drm_modes_analog_tv (4 subtests) =============
[10:50:02] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[10:50:02] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[10:50:02] [PASSED] drm_test_modes_analog_tv_pal_576i
[10:50:02] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[10:50:02] =============== [PASSED] drm_modes_analog_tv ===============
[10:50:02] ============== drm_plane_helper (2 subtests) ===============
[10:50:02] =============== drm_test_check_plane_state  ================
[10:50:02] [PASSED] clipping_simple
[10:50:02] [PASSED] clipping_rotate_reflect
[10:50:02] [PASSED] positioning_simple
[10:50:02] [PASSED] upscaling
[10:50:02] [PASSED] downscaling
[10:50:02] [PASSED] rounding1
[10:50:02] [PASSED] rounding2
[10:50:02] [PASSED] rounding3
[10:50:02] [PASSED] rounding4
[10:50:02] =========== [PASSED] drm_test_check_plane_state ============
[10:50:02] =========== drm_test_check_invalid_plane_state  ============
[10:50:02] [PASSED] positioning_invalid
[10:50:02] [PASSED] upscaling_invalid
[10:50:02] [PASSED] downscaling_invalid
[10:50:02] ======= [PASSED] drm_test_check_invalid_plane_state ========
[10:50:02] ================ [PASSED] drm_plane_helper =================
[10:50:02] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[10:50:02] ====== drm_test_connector_helper_tv_get_modes_check  =======
[10:50:02] [PASSED] None
[10:50:02] [PASSED] PAL
[10:50:02] [PASSED] NTSC
[10:50:02] [PASSED] Both, NTSC Default
[10:50:02] [PASSED] Both, PAL Default
[10:50:02] [PASSED] Both, NTSC Default, with PAL on command-line
[10:50:02] [PASSED] Both, PAL Default, with NTSC on command-line
[10:50:02] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[10:50:02] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[10:50:02] ================== drm_rect (9 subtests) ===================
[10:50:02] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[10:50:02] [PASSED] drm_test_rect_clip_scaled_not_clipped
[10:50:02] [PASSED] drm_test_rect_clip_scaled_clipped
[10:50:02] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[10:50:02] ================= drm_test_rect_intersect  =================
[10:50:02] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[10:50:02] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[10:50:02] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[10:50:02] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[10:50:02] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[10:50:02] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[10:50:02] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[10:50:02] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[10:50:02] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[10:50:02] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[10:50:02] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[10:50:02] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[10:50:02] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[10:50:02] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[10:50:02] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[10:50:02] ============= [PASSED] drm_test_rect_intersect =============
[10:50:02] ================ drm_test_rect_calc_hscale  ================
[10:50:02] [PASSED] normal use
[10:50:02] [PASSED] out of max range
[10:50:02] [PASSED] out of min range
[10:50:02] [PASSED] zero dst
[10:50:02] [PASSED] negative src
[10:50:02] [PASSED] negative dst
[10:50:02] ============ [PASSED] drm_test_rect_calc_hscale ============
[10:50:02] ================ drm_test_rect_calc_vscale  ================
[10:50:02] [PASSED] normal use
[10:50:02] [PASSED] out of max range
[10:50:02] [PASSED] out of min range
[10:50:02] [PASSED] zero dst
[10:50:02] [PASSED] negative src
[10:50:02] [PASSED] negative dst
[10:50:02] ============ [PASSED] drm_test_rect_calc_vscale ============
[10:50:02] ================== drm_test_rect_rotate  ===================
[10:50:02] [PASSED] reflect-x
[10:50:02] [PASSED] reflect-y
[10:50:02] [PASSED] rotate-0
[10:50:02] [PASSED] rotate-90
[10:50:02] [PASSED] rotate-180
[10:50:02] [PASSED] rotate-270
[10:50:02] ============== [PASSED] drm_test_rect_rotate ===============
[10:50:02] ================ drm_test_rect_rotate_inv  =================
[10:50:02] [PASSED] reflect-x
[10:50:02] [PASSED] reflect-y
[10:50:02] [PASSED] rotate-0
[10:50:02] [PASSED] rotate-90
[10:50:02] [PASSED] rotate-180
[10:50:02] [PASSED] rotate-270
[10:50:02] ============ [PASSED] drm_test_rect_rotate_inv =============
[10:50:02] ==================== [PASSED] drm_rect =====================
[10:50:02] ================== drm_exec (8 subtests) ===================
[10:50:02] [PASSED] sanitycheck
[10:50:02] [PASSED] test_lock
[10:50:02] [PASSED] test_lock_unlock
[10:50:02] [PASSED] test_duplicates
[10:50:02] [PASSED] test_prepare
[10:50:02] [PASSED] test_prepare_array
[10:50:02] [PASSED] test_multiple_loops
[10:50:02] [PASSED] test_early_put
[10:50:02] ==================== [PASSED] drm_exec =====================
[10:50:02] ============================================================
[10:50:02] Testing complete. Ran 341 tests: passed: 341
[10:50:02] Elapsed time: 43.745s total, 1.669s configuring, 19.044s building, 23.021s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


