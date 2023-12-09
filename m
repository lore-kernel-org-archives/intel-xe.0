Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4F2C4167B
	for <intel-xe@archiver.kernel.org>; Sat,  9 Dec 2023 01:22:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0E510E166;
	Sat,  9 Dec 2023 01:22:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id D1E4F10E16B;
 Sat,  9 Dec 2023 01:22:03 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CE345AADEA;
 Sat,  9 Dec 2023 01:22:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/pmu/uapi=3A_Remove_PMU_?=
 =?utf-8?q?group_busyness_events_from_uapi_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Sat, 09 Dec 2023 01:22:03 -0000
Message-ID: <170208492384.20046.16986964657097518614@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231209000233.2577418-1-ashutosh.dixit@intel.com>
In-Reply-To: <20231209000233.2577418-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/pmu/uapi: Remove PMU group busyness events from uapi (rev2)
URL   : https://patchwork.freedesktop.org/series/127590/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[01:20:52] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:20:56] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[01:21:17] Starting KUnit Kernel (1/1)...
[01:21:17] ============================================================
[01:21:17] ========================== lmtt  ===========================
[01:21:17] ======================== test_ops  =========================
[01:21:17] [PASSED] 2-level
[01:21:17] [PASSED] multi-level
[01:21:17] ==================== [PASSED] test_ops =====================
[01:21:17] ====================== [PASSED] lmtt =======================
[01:21:17] ========================== xe_bo  ==========================
[01:21:17] [SKIPPED] xe_ccs_migrate_kunit
[01:21:17] [SKIPPED] xe_bo_evict_kunit
[01:21:17] ===================== [SKIPPED] xe_bo ======================
[01:21:17] ======================= xe_dma_buf  ========================
[01:21:17] [SKIPPED] xe_dma_buf_kunit
[01:21:17] =================== [SKIPPED] xe_dma_buf ===================
[01:21:17] ======================= xe_migrate  ========================
[01:21:17] [SKIPPED] xe_migrate_sanity_kunit
[01:21:17] =================== [SKIPPED] xe_migrate ===================
[01:21:17] ========================= xe_mocs  =========================
[01:21:17] [SKIPPED] xe_live_mocs_kernel_kunit
[01:21:17] ==================== [SKIPPED] xe_mocs =====================
[01:21:17] ========================= xe_pci  ==========================
[01:21:17] [PASSED] xe_gmdid_graphics_ip
[01:21:17] [PASSED] xe_gmdid_media_ip
[01:21:17] ===================== [PASSED] xe_pci ======================
[01:21:17] ========================= xe_rtp  ==========================
[01:21:17] ================== xe_rtp_process_tests  ===================
[01:21:17] [PASSED] coalesce-same-reg
[01:21:17] [PASSED] no-match-no-add
[01:21:17] [PASSED] no-match-no-add-multiple-rules
[01:21:17] [PASSED] two-regs-two-entries
[01:21:17] [PASSED] clr-one-set-other
[01:21:17] [PASSED] set-field
[01:21:17] [PASSED] conflict-duplicate
[01:21:17] [PASSED] conflict-not-disjoint
[01:21:17] [PASSED] conflict-reg-type
[01:21:17] ============== [PASSED] xe_rtp_process_tests ===============
[01:21:17] ===================== [PASSED] xe_rtp ======================
[01:21:17] ========================== xe_wa  ==========================
[01:21:17] ======================== xe_wa_gt  =========================
[01:21:17] [PASSED] TIGERLAKE (B0)
[01:21:17] [PASSED] DG1 (A0)
[01:21:17] [PASSED] DG1 (B0)
[01:21:17] [PASSED] ALDERLAKE_S (A0)
[01:21:17] [PASSED] ALDERLAKE_S (B0)
[01:21:17] [PASSED] ALDERLAKE_S (C0)
[01:21:17] [PASSED] ALDERLAKE_S (D0)
[01:21:17] [PASSED] ALDERLAKE_P (A0)
[01:21:17] [PASSED] ALDERLAKE_P (B0)
[01:21:17] [PASSED] ALDERLAKE_P (C0)
[01:21:17] [PASSED] ALDERLAKE_S_RPLS (D0)
[01:21:17] [PASSED] ALDERLAKE_P_RPLU (E0)
[01:21:17] [PASSED] DG2_G10 (A0)
[01:21:17] [PASSED] DG2_G10 (A1)
[01:21:17] [PASSED] DG2_G10 (B0)
[01:21:17] [PASSED] DG2_G10 (C0)
[01:21:17] [PASSED] DG2_G11 (A0)
[01:21:17] [PASSED] DG2_G11 (B0)
[01:21:17] [PASSED] DG2_G11 (B1)
[01:21:17] [PASSED] DG2_G12 (A0)
[01:21:17] [PASSED] DG2_G12 (A1)
[01:21:17] [PASSED] PVC (B0)
[01:21:17] [PASSED] PVC (B1)
[01:21:17] [PASSED] PVC (C0)
[01:21:17] [PASSED] METEORLAKE (g:A0, m:A0)
[01:21:17] [PASSED] METEORLAKE (g:A0, m:A0)
[01:21:17] [PASSED] LUNARLAKE (g:A0, m:A0)
[01:21:17] [PASSED] LUNARLAKE (g:B0, m:A0)
[01:21:17] ==================== [PASSED] xe_wa_gt =====================
[01:21:17] ====================== [PASSED] xe_wa ======================
[01:21:17] ============================================================
[01:21:17] Testing complete. Ran 46 tests: passed: 41, skipped: 5
[01:21:17] Elapsed time: 24.708s total, 4.207s configuring, 20.382s building, 0.101s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[01:21:17] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:21:18] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[01:21:38] Starting KUnit Kernel (1/1)...
[01:21:38] ============================================================
[01:21:38] ================== drm_test_pick_cmdline  ==================
[01:21:38] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[01:21:38] =============== drm_test_pick_cmdline_named  ===============
[01:21:38] [PASSED] NTSC
[01:21:38] [PASSED] NTSC-J
[01:21:38] [PASSED] PAL
[01:21:38] [PASSED] PAL-M
[01:21:38] =========== [PASSED] drm_test_pick_cmdline_named ===========
[01:21:38] ============== [PASSED] drm_test_pick_cmdline ==============
[01:21:38] ======================== drm_buddy  ========================
[01:21:38] [PASSED] drm_test_buddy_alloc_limit
[01:21:38] [PASSED] drm_test_buddy_alloc_range
[01:21:38] [PASSED] drm_test_buddy_alloc_optimistic
[01:21:38] [PASSED] drm_test_buddy_alloc_pessimistic
[01:21:38] [PASSED] drm_test_buddy_alloc_smoke
[01:21:38] [PASSED] drm_test_buddy_alloc_pathological
[01:21:38] ==================== [PASSED] drm_buddy ====================
[01:21:38] =================== drm_cmdline_parser  ====================
[01:21:38] [PASSED] drm_test_cmdline_force_d_only
[01:21:38] [PASSED] drm_test_cmdline_force_D_only_dvi
[01:21:38] [PASSED] drm_test_cmdline_force_D_only_hdmi
[01:21:38] [PASSED] drm_test_cmdline_force_D_only_not_digital
[01:21:38] [PASSED] drm_test_cmdline_force_e_only
[01:21:38] [PASSED] drm_test_cmdline_res
[01:21:38] [PASSED] drm_test_cmdline_res_vesa
[01:21:38] [PASSED] drm_test_cmdline_res_vesa_rblank
[01:21:38] [PASSED] drm_test_cmdline_res_rblank
[01:21:38] [PASSED] drm_test_cmdline_res_bpp
[01:21:38] [PASSED] drm_test_cmdline_res_refresh
[01:21:38] [PASSED] drm_test_cmdline_res_bpp_refresh
[01:21:38] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[01:21:38] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[01:21:38] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[01:21:38] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[01:21:38] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[01:21:38] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[01:21:38] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[01:21:38] [PASSED] drm_test_cmdline_res_margins_force_on
[01:21:38] [PASSED] drm_test_cmdline_res_vesa_margins
[01:21:38] [PASSED] drm_test_cmdline_name
[01:21:38] [PASSED] drm_test_cmdline_name_bpp
[01:21:38] [PASSED] drm_test_cmdline_name_option
[01:21:38] [PASSED] drm_test_cmdline_name_bpp_option
[01:21:38] [PASSED] drm_test_cmdline_rotate_0
[01:21:38] [PASSED] drm_test_cmdline_rotate_90
[01:21:38] [PASSED] drm_test_cmdline_rotate_180
[01:21:38] [PASSED] drm_test_cmdline_rotate_270
[01:21:38] [PASSED] drm_test_cmdline_hmirror
[01:21:38] [PASSED] drm_test_cmdline_vmirror
[01:21:38] [PASSED] drm_test_cmdline_margin_options
[01:21:38] [PASSED] drm_test_cmdline_multiple_options
[01:21:38] [PASSED] drm_test_cmdline_bpp_extra_and_option
[01:21:38] [PASSED] drm_test_cmdline_extra_and_option
[01:21:38] [PASSED] drm_test_cmdline_freestanding_options
[01:21:38] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[01:21:38] [PASSED] drm_test_cmdline_panel_orientation
[01:21:38] ================ drm_test_cmdline_invalid  =================
[01:21:38] [PASSED] margin_only
[01:21:38] [PASSED] interlace_only
[01:21:38] [PASSED] res_missing_x
[01:21:38] [PASSED] res_missing_y
[01:21:38] [PASSED] res_bad_y
[01:21:38] [PASSED] res_missing_y_bpp
[01:21:38] [PASSED] res_bad_bpp
[01:21:38] [PASSED] res_bad_refresh
[01:21:38] [PASSED] res_bpp_refresh_force_on_off
[01:21:38] [PASSED] res_invalid_mode
[01:21:38] [PASSED] res_bpp_wrong_place_mode
[01:21:38] [PASSED] name_bpp_refresh
[01:21:38] [PASSED] name_refresh
[01:21:38] [PASSED] name_refresh_wrong_mode
[01:21:38] [PASSED] name_refresh_invalid_mode
[01:21:38] [PASSED] rotate_multiple
[01:21:38] [PASSED] rotate_invalid_val
[01:21:38] [PASSED] rotate_truncated
[01:21:38] [PASSED] invalid_option
[01:21:38] [PASSED] invalid_tv_option
[01:21:38] [PASSED] truncated_tv_option
[01:21:38] ============ [PASSED] drm_test_cmdline_invalid =============
[01:21:38] =============== drm_test_cmdline_tv_options  ===============
[01:21:38] [PASSED] NTSC
[01:21:38] [PASSED] NTSC_443
[01:21:38] [PASSED] NTSC_J
[01:21:38] [PASSED] PAL
[01:21:38] [PASSED] PAL_M
[01:21:38] [PASSED] PAL_N
[01:21:38] [PASSED] SECAM
[01:21:38] =========== [PASSED] drm_test_cmdline_tv_options ===========
[01:21:38] =============== [PASSED] drm_cmdline_parser ================
[01:21:38] ================ drm_get_tv_mode_from_name  ================
[01:21:38] ========== drm_test_get_tv_mode_from_name_valid  ===========
[01:21:38] [PASSED] NTSC
[01:21:38] [PASSED] NTSC-443
[01:21:38] [PASSED] NTSC-J
[01:21:38] [PASSED] PAL
[01:21:38] [PASSED] PAL-M
[01:21:38] [PASSED] PAL-N
[01:21:38] [PASSED] SECAM
[01:21:38] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[01:21:38] [PASSED] drm_test_get_tv_mode_from_name_truncated
[01:21:38] ============ [PASSED] drm_get_tv_mode_from_name ============
[01:21:38] ==================== drm_damage_helper  ====================
[01:21:38] [PASSED] drm_test_damage_iter_no_damage
[01:21:38] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[01:21:38] [PASSED] drm_test_damage_iter_no_damage_src_moved
[01:21:38] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[01:21:38] [PASSED] drm_test_damage_iter_no_damage_not_visible
[01:21:38] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[01:21:38] [PASSED] drm_test_damage_iter_no_damage_no_fb
[01:21:38] [PASSED] drm_test_damage_iter_simple_damage
[01:21:38] [PASSED] drm_test_damage_iter_single_damage
[01:21:38] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[01:21:38] [PASSED] drm_test_damage_iter_single_damage_outside_src
[01:21:38] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[01:21:38] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[01:21:38] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[01:21:38] [PASSED] drm_test_damage_iter_single_damage_src_moved
[01:21:38] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[01:21:38] [PASSED] drm_test_damage_iter_damage
[01:21:38] [PASSED] drm_test_damage_iter_damage_one_intersect
[01:21:38] [PASSED] drm_test_damage_iter_damage_one_outside
[01:21:38] [PASSED] drm_test_damage_iter_damage_src_moved
[01:21:38] [PASSED] drm_test_damage_iter_damage_not_visible
[01:21:38] ================ [PASSED] drm_damage_helper ================
[01:21:38] ==================== drm_dp_mst_helper  ====================
[01:21:38] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[01:21:38] [PASSED] Clock 154000 BPP 30 DSC disabled
[01:21:38] [PASSED] Clock 234000 BPP 30 DSC disabled
[01:21:38] [PASSED] Clock 297000 BPP 24 DSC disabled
[01:21:38] [PASSED] Clock 332880 BPP 24 DSC enabled
[01:21:38] [PASSED] Clock 324540 BPP 24 DSC enabled
[01:21:38] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[01:21:38] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[01:21:38] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[01:21:38] [PASSED] DP_POWER_UP_PHY with port number
[01:21:38] [PASSED] DP_POWER_DOWN_PHY with port number
[01:21:38] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[01:21:38] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[01:21:38] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[01:21:38] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[01:21:38] [PASSED] DP_QUERY_PAYLOAD with port number
[01:21:38] [PASSED] DP_QUERY_PAYLOAD with VCPI
[01:21:38] [PASSED] DP_REMOTE_DPCD_READ with port number
[01:21:38] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[01:21:38] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[01:21:38] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[01:21:38] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[01:21:38] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[01:21:38] [PASSED] DP_REMOTE_I2C_READ with port number
[01:21:38] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[01:21:38] [PASSED] DP_REMOTE_I2C_READ with transactions array
[01:21:38] [PASSED] DP_REMOTE_I2C_WRITE with port number
[01:21:38] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[01:21:38] [PASSED] DP_REMOTE_I2C_WRITE with data array
[01:21:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[01:21:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[01:21:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[01:21:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[01:21:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[01:21:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[01:21:38] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[01:21:38] ================ [PASSED] drm_dp_mst_helper ================
[01:21:38] ================= drm_format_helper_test  ==================
[01:21:38] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[01:21:38] [PASSED] single_pixel_source_buffer
[01:21:38] [PASSED] single_pixel_clip_rectangle
[01:21:38] [PASSED] well_known_colors
[01:21:38] [PASSED] destination_pitch
[01:21:38] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[01:21:38] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[01:21:38] [PASSED] single_pixel_source_buffer
[01:21:38] [PASSED] single_pixel_clip_rectangle
[01:21:38] [PASSED] well_known_colors
[01:21:38] [PASSED] destination_pitch
[01:21:38] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[01:21:38] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[01:21:38] [PASSED] single_pixel_source_buffer
[01:21:38] [PASSED] single_pixel_clip_rectangle
[01:21:38] [PASSED] well_known_colors
[01:21:38] [PASSED] destination_pitch
[01:21:38] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[01:21:38] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[01:21:38] [PASSED] single_pixel_source_buffer
[01:21:38] [PASSED] single_pixel_clip_rectangle
[01:21:38] [PASSED] well_known_colors
[01:21:38] [PASSED] destination_pitch
[01:21:38] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[01:21:38] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[01:21:38] [PASSED] single_pixel_source_buffer
[01:21:38] [PASSED] single_pixel_clip_rectangle
[01:21:38] [PASSED] well_known_colors
[01:21:38] [PASSED] destination_pitch
[01:21:38] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[01:21:38] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[01:21:38] [PASSED] single_pixel_source_buffer
[01:21:38] [PASSED] single_pixel_clip_rectangle
[01:21:38] [PASSED] well_known_colors
[01:21:38] [PASSED] destination_pitch
[01:21:38] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[01:21:38] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[01:21:38] [PASSED] single_pixel_source_buffer
[01:21:38] [PASSED] single_pixel_clip_rectangle
[01:21:38] [PASSED] well_known_colors
[01:21:38] [PASSED] destination_pitch
[01:21:38] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[01:21:38] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[01:21:38] [PASSED] single_pixel_source_buffer
[01:21:38] [PASSED] single_pixel_clip_rectangle
[01:21:38] [PASSED] well_known_colors
[01:21:38] [PASSED] destination_pitch
[01:21:38] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[01:21:38] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[01:21:38] [PASSED] single_pixel_source_buffer
[01:21:38] [PASSED] single_pixel_clip_rectangle
[01:21:38] [PASSED] well_known_colors
[01:21:38] [PASSED] destination_pitch
[01:21:38] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[01:21:38] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[01:21:38] [PASSED] single_pixel_source_buffer
[01:21:38] [PASSED] single_pixel_clip_rectangle
[01:21:38] [PASSED] well_known_colors
[01:21:38] [PASSED] destination_pitch
[01:21:38] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[01:21:38] ============== drm_test_fb_xrgb8888_to_mono  ===============
[01:21:38] [PASSED] single_pixel_source_buffer
[01:21:38] [PASSED] single_pixel_clip_rectangle
[01:21:38] [PASSED] well_known_colors
[01:21:38] [PASSED] destination_pitch
[01:21:38] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[01:21:38] ==================== drm_test_fb_swab  =====================
[01:21:38] [PASSED] single_pixel_source_buffer
[01:21:38] [PASSED] single_pixel_clip_rectangle
[01:21:38] [PASSED] well_known_colors
[01:21:38] [PASSED] destination_pitch
[01:21:38] ================ [PASSED] drm_test_fb_swab =================
[01:21:38] ================= drm_test_fb_clip_offset  =================
[01:21:38] [PASSED] pass through
[01:21:38] [PASSED] horizontal offset
[01:21:38] [PASSED] vertical offset
[01:21:38] [PASSED] horizontal and vertical offset
[01:21:38] [PASSED] horizontal offset (custom pitch)
[01:21:38] [PASSED] vertical offset (custom pitch)
[01:21:38] [PASSED] horizontal and vertical offset (custom pitch)
[01:21:38] ============= [PASSED] drm_test_fb_clip_offset =============
[01:21:38] ============== drm_test_fb_build_fourcc_list  ==============
[01:21:38] [PASSED] no native formats
[01:21:38] [PASSED] XRGB8888 as native format
[01:21:38] [PASSED] remove duplicates
[01:21:38] [PASSED] convert alpha formats
[01:21:38] [PASSED] random formats
[01:21:38] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[01:21:38] =================== drm_test_fb_memcpy  ====================
[01:21:38] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[01:21:38] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[01:21:38] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[01:21:38] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[01:21:38] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[01:21:38] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[01:21:38] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[01:21:38] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[01:21:38] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[01:21:38] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[01:21:38] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[01:21:38] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[01:21:38] =============== [PASSED] drm_test_fb_memcpy ================
[01:21:38] ============= [PASSED] drm_format_helper_test ==============
[01:21:38] ======================= drm_format  ========================
[01:21:38] [PASSED] drm_test_format_block_width_invalid
[01:21:38] [PASSED] drm_test_format_block_width_one_plane
[01:21:38] [PASSED] drm_test_format_block_width_two_plane
[01:21:38] [PASSED] drm_test_format_block_width_three_plane
[01:21:38] [PASSED] drm_test_format_block_width_tiled
[01:21:38] [PASSED] drm_test_format_block_height_invalid
[01:21:38] [PASSED] drm_test_format_block_height_one_plane
[01:21:38] [PASSED] drm_test_format_block_height_two_plane
[01:21:38] [PASSED] drm_test_format_block_height_three_plane
[01:21:38] [PASSED] drm_test_format_block_height_tiled
[01:21:38] [PASSED] drm_test_format_min_pitch_invalid
[01:21:38] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[01:21:38] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[01:21:38] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[01:21:38] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[01:21:38] [PASSED] drm_test_format_min_pitch_two_plane
[01:21:38] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[01:21:38] [PASSED] drm_test_format_min_pitch_tiled
[01:21:38] =================== [PASSED] drm_format ====================
[01:21:38] ===================== drm_framebuffer  =====================
[01:21:38] =============== drm_test_framebuffer_create  ===============
[01:21:38] [PASSED] ABGR8888 normal sizes
[01:21:38] [PASSED] ABGR8888 max sizes
[01:21:38] [PASSED] ABGR8888 pitch greater than min required
[01:21:38] [PASSED] ABGR8888 pitch less than min required
[01:21:38] [PASSED] ABGR8888 Invalid width
[01:21:38] [PASSED] ABGR8888 Invalid buffer handle
[01:21:38] [PASSED] No pixel format
[01:21:38] [PASSED] ABGR8888 Width 0
[01:21:38] [PASSED] ABGR8888 Height 0
[01:21:38] [PASSED] ABGR8888 Out of bound height * pitch combination
[01:21:38] [PASSED] ABGR8888 Large buffer offset
[01:21:38] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[01:21:38] [PASSED] ABGR8888 Valid buffer modifier
[01:21:38] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[01:21:38] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[01:21:38] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[01:21:38] [PASSED] NV12 Normal sizes
[01:21:38] [PASSED] NV12 Max sizes
[01:21:38] [PASSED] NV12 Invalid pitch
[01:21:38] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[01:21:38] [PASSED] NV12 different  modifier per-plane
[01:21:38] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[01:21:38] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[01:21:38] [PASSED] NV12 Modifier for inexistent plane
[01:21:38] [PASSED] NV12 Handle for inexistent plane
[01:21:38] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[01:21:38] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[01:21:38] [PASSED] YVU420 Normal sizes
[01:21:38] [PASSED] YVU420 Max sizes
[01:21:38] [PASSED] YVU420 Invalid pitch
[01:21:38] [PASSED] YVU420 Different pitches
[01:21:38] [PASSED] YVU420 Different buffer offsets/pitches
[01:21:38] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[01:21:38] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[01:21:38] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[01:21:38] [PASSED] YVU420 Valid modifier
[01:21:38] [PASSED] YVU420 Different modifiers per plane
[01:21:38] [PASSED] YVU420 Modifier for inexistent plane
[01:21:38] [PASSED] X0L2 Normal sizes
[01:21:38] [PASSED] X0L2 Max sizes
[01:21:38] [PASSED] X0L2 Invalid pitch
[01:21:38] [PASSED] X0L2 Pitch greater than minimum required
[01:21:38] [PASSED] X0L2 Handle for inexistent plane
[01:21:38] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[01:21:38] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[01:21:38] [PASSED] X0L2 Valid modifier
[01:21:38] [PASSED] X0L2 Modifier for inexistent plane
[01:21:38] =========== [PASSED] drm_test_framebuffer_create ===========
[01:21:38] ================= [PASSED] drm_framebuffer =================
[01:21:38] ==================== drm-test-managed  =====================
[01:21:38] [PASSED] drm_test_managed_run_action
[01:21:38] ================ [PASSED] drm-test-managed =================
[01:21:38] ========================= drm_mm  ==========================
[01:21:38] [PASSED] drm_test_mm_init
[01:21:38] [PASSED] drm_test_mm_debug
[01:21:48] [PASSED] drm_test_mm_reserve
[01:21:58] [PASSED] drm_test_mm_insert
[01:21:59] [PASSED] drm_test_mm_replace
[01:21:59] [PASSED] drm_test_mm_insert_range
[01:21:59] [PASSED] drm_test_mm_frag
[01:21:59] [PASSED] drm_test_mm_align
[01:21:59] [PASSED] drm_test_mm_align32
[01:22:00] [PASSED] drm_test_mm_align64
[01:22:00] [PASSED] drm_test_mm_evict
[01:22:00] [PASSED] drm_test_mm_evict_range
[01:22:00] [PASSED] drm_test_mm_topdown
[01:22:00] [PASSED] drm_test_mm_bottomup
[01:22:00] [PASSED] drm_test_mm_lowest
[01:22:00] [PASSED] drm_test_mm_highest
[01:22:01] [PASSED] drm_test_mm_color
[01:22:01] [PASSED] drm_test_mm_color_evict
[01:22:01] [PASSED] drm_test_mm_color_evict_range
[01:22:01] ===================== [PASSED] drm_mm ======================
[01:22:01] =================== drm_modes_analog_tv  ===================
[01:22:01] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[01:22:01] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[01:22:01] [PASSED] drm_test_modes_analog_tv_pal_576i
[01:22:01] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[01:22:01] =============== [PASSED] drm_modes_analog_tv ===============
[01:22:01] ==================== drm_plane_helper  =====================
[01:22:01] =============== drm_test_check_plane_state  ================
[01:22:01] [PASSED] clipping_simple
[01:22:01] [PASSED] clipping_rotate_reflect
[01:22:01] [PASSED] positioning_simple
[01:22:01] [PASSED] upscaling
[01:22:01] [PASSED] downscaling
[01:22:01] [PASSED] rounding1
[01:22:01] [PASSED] rounding2
[01:22:01] [PASSED] rounding3
[01:22:01] [PASSED] rounding4
[01:22:01] =========== [PASSED] drm_test_check_plane_state ============
[01:22:01] =========== drm_test_check_invalid_plane_state  ============
[01:22:01] [PASSED] positioning_invalid
[01:22:01] [PASSED] upscaling_invalid
[01:22:01] [PASSED] downscaling_invalid
[01:22:01] ======= [PASSED] drm_test_check_invalid_plane_state ========
[01:22:01] ================ [PASSED] drm_plane_helper =================
[01:22:01] ============ drm_connector_helper_tv_get_modes  ============
[01:22:01] ====== drm_test_connector_helper_tv_get_modes_check  =======
[01:22:01] [PASSED] None
[01:22:01] [PASSED] PAL
[01:22:01] [PASSED] NTSC
[01:22:01] [PASSED] Both, NTSC Default
[01:22:01] [PASSED] Both, PAL Default
[01:22:01] [PASSED] Both, NTSC Default, with PAL on command-line
[01:22:01] [PASSED] Both, PAL Default, with NTSC on command-line
[01:22:01] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[01:22:01] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[01:22:01] ======================== drm_rect  =========================
[01:22:01] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[01:22:01] [PASSED] drm_test_rect_clip_scaled_not_clipped
[01:22:01] [PASSED] drm_test_rect_clip_scaled_clipped
[01:22:01] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[01:22:01] ================= drm_test_rect_intersect  =================
[01:22:01] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[01:22:01] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[01:22:01] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[01:22:01] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[01:22:01] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[01:22:01] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[01:22:01] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[01:22:01] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[01:22:01] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[01:22:01] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[01:22:01] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[01:22:01] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[01:22:01] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[01:22:01] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[01:22:01] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[01:22:01] ============= [PASSED] drm_test_rect_intersect =============
[01:22:01] ================ drm_test_rect_calc_hscale  ================
[01:22:01] [PASSED] normal use
[01:22:01] [PASSED] out of max range
[01:22:01] [PASSED] out of min range
[01:22:01] [PASSED] zero dst
[01:22:01] [PASSED] negative src
[01:22:01] [PASSED] negative dst
[01:22:01] ============ [PASSED] drm_test_rect_calc_hscale ============
[01:22:01] ================ drm_test_rect_calc_vscale  ================
[01:22:01] [PASSED] normal use
[01:22:01] [PASSED] out of max range
[01:22:01] [PASSED] out of min range
[01:22:01] [PASSED] zero dst
[01:22:01] [PASSED] negative src
[01:22:01] [PASSED] negative dst
[01:22:01] ============ [PASSED] drm_test_rect_calc_vscale ============
[01:22:01] ================== drm_test_rect_rotate  ===================
[01:22:01] [PASSED] reflect-x
[01:22:01] [PASSED] reflect-y
[01:22:01] [PASSED] rotate-0
[01:22:01] [PASSED] rotate-90
[01:22:01] [PASSED] rotate-180
[01:22:01] [PASSED] rotate-270
[01:22:01] ============== [PASSED] drm_test_rect_rotate ===============
[01:22:01] ================ drm_test_rect_rotate_inv  =================
[01:22:01] [PASSED] reflect-x
[01:22:01] [PASSED] reflect-y
[01:22:01] [PASSED] rotate-0
[01:22:01] [PASSED] rotate-90
[01:22:01] [PASSED] rotate-180
[01:22:01] [PASSED] rotate-270
[01:22:01] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[01:22:01] ==================== [PASSED] drm_rect =====================
[01:22:01] ======================== drm_exec  =========================
[01:22:01] [PASSED] sanitycheck
[01:22:01] [PASSED] test_lock
[01:22:01] [PASSED] test_lock_unlock
[01:22:01] [PASSED] test_duplicates
[01:22:01] [PASSED] test_prepare
[01:22:01] [PASSED] test_prepare_array
[01:22:01] [PASSED] test_multiple_loops
[01:22:01] ==================== [PASSED] drm_exec =====================
[01:22:01] ============================================================
[01:22:01] Testing complete. Ran 368 tests: passed: 368
[01:22:01] Elapsed time: 44.646s total, 1.684s configuring, 19.283s building, 23.664s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


