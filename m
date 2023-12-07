Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB653C10F05
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 15:06:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A910E10E08D;
	Thu,  7 Dec 2023 15:06:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D16C410E08D;
 Thu,  7 Dec 2023 15:06:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CD55BAA3D8;
 Thu,  7 Dec 2023 15:06:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_series_starting_with_=5B1/2=5D?=
 =?utf-8?q?_Revert_=22FIXME=3A_drm/i915=3A_avoid_taking_the_uncore_lock_for_?=
 =?utf-8?q?xe=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Date: Thu, 07 Dec 2023 15:06:17 -0000
Message-ID: <170196157783.28722.7457366080452177589@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231207130106.1676807-1-luciano.coelho@intel.com>
In-Reply-To: <20231207130106.1676807-1-luciano.coelho@intel.com>
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

Series: series starting with [1/2] Revert "FIXME: drm/i915: avoid taking the uncore lock for xe"
URL   : https://patchwork.freedesktop.org/series/127494/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[15:05:06] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:05:10] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[15:05:30] Starting KUnit Kernel (1/1)...
[15:05:30] ============================================================
[15:05:30] ========================== xe_bo  ==========================
[15:05:30] [SKIPPED] xe_ccs_migrate_kunit
[15:05:30] [SKIPPED] xe_bo_evict_kunit
[15:05:30] ===================== [SKIPPED] xe_bo ======================
[15:05:30] ======================= xe_dma_buf  ========================
[15:05:30] [SKIPPED] xe_dma_buf_kunit
[15:05:30] =================== [SKIPPED] xe_dma_buf ===================
[15:05:30] ======================= xe_migrate  ========================
[15:05:30] [SKIPPED] xe_migrate_sanity_kunit
[15:05:30] =================== [SKIPPED] xe_migrate ===================
[15:05:30] ========================= xe_mocs  =========================
[15:05:30] [SKIPPED] xe_live_mocs_kernel_kunit
[15:05:30] ==================== [SKIPPED] xe_mocs =====================
[15:05:30] ========================= xe_pci  ==========================
[15:05:30] [PASSED] xe_gmdid_graphics_ip
[15:05:30] [PASSED] xe_gmdid_media_ip
[15:05:30] ===================== [PASSED] xe_pci ======================
[15:05:30] ========================= xe_rtp  ==========================
[15:05:30] ================== xe_rtp_process_tests  ===================
[15:05:30] [PASSED] coalesce-same-reg
[15:05:30] [PASSED] no-match-no-add
[15:05:30] [PASSED] no-match-no-add-multiple-rules
[15:05:30] [PASSED] two-regs-two-entries
[15:05:30] [PASSED] clr-one-set-other
[15:05:30] [PASSED] set-field
[15:05:30] [PASSED] conflict-duplicate
[15:05:30] [PASSED] conflict-not-disjoint
[15:05:30] [PASSED] conflict-reg-type
[15:05:30] ============== [PASSED] xe_rtp_process_tests ===============
[15:05:30] ===================== [PASSED] xe_rtp ======================
[15:05:30] ========================== xe_wa  ==========================
[15:05:30] ======================== xe_wa_gt  =========================
[15:05:30] [PASSED] TIGERLAKE (B0)
[15:05:30] [PASSED] DG1 (A0)
[15:05:30] [PASSED] DG1 (B0)
[15:05:30] [PASSED] ALDERLAKE_S (A0)
[15:05:30] [PASSED] ALDERLAKE_S (B0)
[15:05:30] [PASSED] ALDERLAKE_S (C0)
[15:05:30] [PASSED] ALDERLAKE_S (D0)
[15:05:30] [PASSED] ALDERLAKE_P (A0)
[15:05:30] [PASSED] ALDERLAKE_P (B0)
[15:05:30] [PASSED] ALDERLAKE_P (C0)
[15:05:30] [PASSED] ALDERLAKE_S_RPLS (D0)
[15:05:30] [PASSED] ALDERLAKE_P_RPLU (E0)
[15:05:30] [PASSED] DG2_G10 (A0)
[15:05:30] [PASSED] DG2_G10 (A1)
[15:05:30] [PASSED] DG2_G10 (B0)
[15:05:30] [PASSED] DG2_G10 (C0)
[15:05:30] [PASSED] DG2_G11 (A0)
[15:05:30] [PASSED] DG2_G11 (B0)
[15:05:30] [PASSED] DG2_G11 (B1)
[15:05:30] [PASSED] DG2_G12 (A0)
[15:05:30] [PASSED] DG2_G12 (A1)
[15:05:30] [PASSED] PVC (B0)
[15:05:30] [PASSED] PVC (B1)
[15:05:30] [PASSED] PVC (C0)
[15:05:30] [PASSED] METEORLAKE (g:A0, m:A0)
[15:05:30] [PASSED] METEORLAKE (g:A0, m:A0)
[15:05:30] [PASSED] LUNARLAKE (g:A0, m:A0)
[15:05:30] [PASSED] LUNARLAKE (g:B0, m:A0)
[15:05:30] ==================== [PASSED] xe_wa_gt =====================
[15:05:30] ====================== [PASSED] xe_wa ======================
[15:05:30] ============================================================
[15:05:30] Testing complete. Ran 44 tests: passed: 39, skipped: 5
[15:05:30] Elapsed time: 24.569s total, 4.193s configuring, 20.257s building, 0.101s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[15:05:30] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:05:32] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[15:05:51] Starting KUnit Kernel (1/1)...
[15:05:51] ============================================================
[15:05:52] ================== drm_test_pick_cmdline  ==================
[15:05:52] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[15:05:52] =============== drm_test_pick_cmdline_named  ===============
[15:05:52] [PASSED] NTSC
[15:05:52] [PASSED] NTSC-J
[15:05:52] [PASSED] PAL
[15:05:52] [PASSED] PAL-M
[15:05:52] =========== [PASSED] drm_test_pick_cmdline_named ===========
[15:05:52] ============== [PASSED] drm_test_pick_cmdline ==============
[15:05:52] ======================== drm_buddy  ========================
[15:05:52] [PASSED] drm_test_buddy_alloc_limit
[15:05:52] [PASSED] drm_test_buddy_alloc_range
[15:05:52] [PASSED] drm_test_buddy_alloc_optimistic
[15:05:52] [PASSED] drm_test_buddy_alloc_pessimistic
[15:05:52] [PASSED] drm_test_buddy_alloc_smoke
[15:05:52] [PASSED] drm_test_buddy_alloc_pathological
[15:05:52] ==================== [PASSED] drm_buddy ====================
[15:05:52] =================== drm_cmdline_parser  ====================
[15:05:52] [PASSED] drm_test_cmdline_force_d_only
[15:05:52] [PASSED] drm_test_cmdline_force_D_only_dvi
[15:05:52] [PASSED] drm_test_cmdline_force_D_only_hdmi
[15:05:52] [PASSED] drm_test_cmdline_force_D_only_not_digital
[15:05:52] [PASSED] drm_test_cmdline_force_e_only
[15:05:52] [PASSED] drm_test_cmdline_res
[15:05:52] [PASSED] drm_test_cmdline_res_vesa
[15:05:52] [PASSED] drm_test_cmdline_res_vesa_rblank
[15:05:52] [PASSED] drm_test_cmdline_res_rblank
[15:05:52] [PASSED] drm_test_cmdline_res_bpp
[15:05:52] [PASSED] drm_test_cmdline_res_refresh
[15:05:52] [PASSED] drm_test_cmdline_res_bpp_refresh
[15:05:52] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[15:05:52] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[15:05:52] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[15:05:52] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[15:05:52] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[15:05:52] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[15:05:52] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[15:05:52] [PASSED] drm_test_cmdline_res_margins_force_on
[15:05:52] [PASSED] drm_test_cmdline_res_vesa_margins
[15:05:52] [PASSED] drm_test_cmdline_name
[15:05:52] [PASSED] drm_test_cmdline_name_bpp
[15:05:52] [PASSED] drm_test_cmdline_name_option
[15:05:52] [PASSED] drm_test_cmdline_name_bpp_option
[15:05:52] [PASSED] drm_test_cmdline_rotate_0
[15:05:52] [PASSED] drm_test_cmdline_rotate_90
[15:05:52] [PASSED] drm_test_cmdline_rotate_180
[15:05:52] [PASSED] drm_test_cmdline_rotate_270
[15:05:52] [PASSED] drm_test_cmdline_hmirror
[15:05:52] [PASSED] drm_test_cmdline_vmirror
[15:05:52] [PASSED] drm_test_cmdline_margin_options
[15:05:52] [PASSED] drm_test_cmdline_multiple_options
[15:05:52] [PASSED] drm_test_cmdline_bpp_extra_and_option
[15:05:52] [PASSED] drm_test_cmdline_extra_and_option
[15:05:52] [PASSED] drm_test_cmdline_freestanding_options
[15:05:52] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[15:05:52] [PASSED] drm_test_cmdline_panel_orientation
[15:05:52] ================ drm_test_cmdline_invalid  =================
[15:05:52] [PASSED] margin_only
[15:05:52] [PASSED] interlace_only
[15:05:52] [PASSED] res_missing_x
[15:05:52] [PASSED] res_missing_y
[15:05:52] [PASSED] res_bad_y
[15:05:52] [PASSED] res_missing_y_bpp
[15:05:52] [PASSED] res_bad_bpp
[15:05:52] [PASSED] res_bad_refresh
[15:05:52] [PASSED] res_bpp_refresh_force_on_off
[15:05:52] [PASSED] res_invalid_mode
[15:05:52] [PASSED] res_bpp_wrong_place_mode
[15:05:52] [PASSED] name_bpp_refresh
[15:05:52] [PASSED] name_refresh
[15:05:52] [PASSED] name_refresh_wrong_mode
[15:05:52] [PASSED] name_refresh_invalid_mode
[15:05:52] [PASSED] rotate_multiple
[15:05:52] [PASSED] rotate_invalid_val
[15:05:52] [PASSED] rotate_truncated
[15:05:52] [PASSED] invalid_option
[15:05:52] [PASSED] invalid_tv_option
[15:05:52] [PASSED] truncated_tv_option
[15:05:52] ============ [PASSED] drm_test_cmdline_invalid =============
[15:05:52] =============== drm_test_cmdline_tv_options  ===============
[15:05:52] [PASSED] NTSC
[15:05:52] [PASSED] NTSC_443
[15:05:52] [PASSED] NTSC_J
[15:05:52] [PASSED] PAL
[15:05:52] [PASSED] PAL_M
[15:05:52] [PASSED] PAL_N
[15:05:52] [PASSED] SECAM
[15:05:52] =========== [PASSED] drm_test_cmdline_tv_options ===========
[15:05:52] =============== [PASSED] drm_cmdline_parser ================
[15:05:52] ================ drm_get_tv_mode_from_name  ================
[15:05:52] ========== drm_test_get_tv_mode_from_name_valid  ===========
[15:05:52] [PASSED] NTSC
[15:05:52] [PASSED] NTSC-443
[15:05:52] [PASSED] NTSC-J
[15:05:52] [PASSED] PAL
[15:05:52] [PASSED] PAL-M
[15:05:52] [PASSED] PAL-N
[15:05:52] [PASSED] SECAM
[15:05:52] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[15:05:52] [PASSED] drm_test_get_tv_mode_from_name_truncated
[15:05:52] ============ [PASSED] drm_get_tv_mode_from_name ============
[15:05:52] ==================== drm_damage_helper  ====================
[15:05:52] [PASSED] drm_test_damage_iter_no_damage
[15:05:52] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[15:05:52] [PASSED] drm_test_damage_iter_no_damage_src_moved
[15:05:52] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[15:05:52] [PASSED] drm_test_damage_iter_no_damage_not_visible
[15:05:52] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[15:05:52] [PASSED] drm_test_damage_iter_no_damage_no_fb
[15:05:52] [PASSED] drm_test_damage_iter_simple_damage
[15:05:52] [PASSED] drm_test_damage_iter_single_damage
[15:05:52] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[15:05:52] [PASSED] drm_test_damage_iter_single_damage_outside_src
[15:05:52] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[15:05:52] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[15:05:52] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[15:05:52] [PASSED] drm_test_damage_iter_single_damage_src_moved
[15:05:52] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[15:05:52] [PASSED] drm_test_damage_iter_damage
[15:05:52] [PASSED] drm_test_damage_iter_damage_one_intersect
[15:05:52] [PASSED] drm_test_damage_iter_damage_one_outside
[15:05:52] [PASSED] drm_test_damage_iter_damage_src_moved
[15:05:52] [PASSED] drm_test_damage_iter_damage_not_visible
[15:05:52] ================ [PASSED] drm_damage_helper ================
[15:05:52] ==================== drm_dp_mst_helper  ====================
[15:05:52] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[15:05:52] [PASSED] Clock 154000 BPP 30 DSC disabled
[15:05:52] [PASSED] Clock 234000 BPP 30 DSC disabled
[15:05:52] [PASSED] Clock 297000 BPP 24 DSC disabled
[15:05:52] [PASSED] Clock 332880 BPP 24 DSC enabled
[15:05:52] [PASSED] Clock 324540 BPP 24 DSC enabled
[15:05:52] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[15:05:52] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[15:05:52] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[15:05:52] [PASSED] DP_POWER_UP_PHY with port number
[15:05:52] [PASSED] DP_POWER_DOWN_PHY with port number
[15:05:52] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[15:05:52] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[15:05:52] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[15:05:52] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[15:05:52] [PASSED] DP_QUERY_PAYLOAD with port number
[15:05:52] [PASSED] DP_QUERY_PAYLOAD with VCPI
[15:05:52] [PASSED] DP_REMOTE_DPCD_READ with port number
[15:05:52] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[15:05:52] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[15:05:52] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[15:05:52] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[15:05:52] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[15:05:52] [PASSED] DP_REMOTE_I2C_READ with port number
[15:05:52] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[15:05:52] [PASSED] DP_REMOTE_I2C_READ with transactions array
[15:05:52] [PASSED] DP_REMOTE_I2C_WRITE with port number
[15:05:52] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[15:05:52] [PASSED] DP_REMOTE_I2C_WRITE with data array
[15:05:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[15:05:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[15:05:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[15:05:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[15:05:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[15:05:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[15:05:52] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[15:05:52] ================ [PASSED] drm_dp_mst_helper ================
[15:05:52] ================= drm_format_helper_test  ==================
[15:05:52] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[15:05:52] [PASSED] single_pixel_source_buffer
[15:05:52] [PASSED] single_pixel_clip_rectangle
[15:05:52] [PASSED] well_known_colors
[15:05:52] [PASSED] destination_pitch
[15:05:52] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[15:05:52] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[15:05:52] [PASSED] single_pixel_source_buffer
[15:05:52] [PASSED] single_pixel_clip_rectangle
[15:05:52] [PASSED] well_known_colors
[15:05:52] [PASSED] destination_pitch
[15:05:52] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[15:05:52] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[15:05:52] [PASSED] single_pixel_source_buffer
[15:05:52] [PASSED] single_pixel_clip_rectangle
[15:05:52] [PASSED] well_known_colors
[15:05:52] [PASSED] destination_pitch
[15:05:52] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[15:05:52] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[15:05:52] [PASSED] single_pixel_source_buffer
[15:05:52] [PASSED] single_pixel_clip_rectangle
[15:05:52] [PASSED] well_known_colors
[15:05:52] [PASSED] destination_pitch
[15:05:52] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[15:05:52] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[15:05:52] [PASSED] single_pixel_source_buffer
[15:05:52] [PASSED] single_pixel_clip_rectangle
[15:05:52] [PASSED] well_known_colors
[15:05:52] [PASSED] destination_pitch
[15:05:52] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[15:05:52] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[15:05:52] [PASSED] single_pixel_source_buffer
[15:05:52] [PASSED] single_pixel_clip_rectangle
[15:05:52] [PASSED] well_known_colors
[15:05:52] [PASSED] destination_pitch
[15:05:52] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[15:05:52] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[15:05:52] [PASSED] single_pixel_source_buffer
[15:05:52] [PASSED] single_pixel_clip_rectangle
[15:05:52] [PASSED] well_known_colors
[15:05:52] [PASSED] destination_pitch
[15:05:52] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[15:05:52] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[15:05:52] [PASSED] single_pixel_source_buffer
[15:05:52] [PASSED] single_pixel_clip_rectangle
[15:05:52] [PASSED] well_known_colors
[15:05:52] [PASSED] destination_pitch
[15:05:52] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[15:05:52] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[15:05:52] [PASSED] single_pixel_source_buffer
[15:05:52] [PASSED] single_pixel_clip_rectangle
[15:05:52] [PASSED] well_known_colors
[15:05:52] [PASSED] destination_pitch
[15:05:52] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[15:05:52] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[15:05:52] [PASSED] single_pixel_source_buffer
[15:05:52] [PASSED] single_pixel_clip_rectangle
[15:05:52] [PASSED] well_known_colors
[15:05:52] [PASSED] destination_pitch
[15:05:52] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[15:05:52] ============== drm_test_fb_xrgb8888_to_mono  ===============
[15:05:52] [PASSED] single_pixel_source_buffer
[15:05:52] [PASSED] single_pixel_clip_rectangle
[15:05:52] [PASSED] well_known_colors
[15:05:52] [PASSED] destination_pitch
[15:05:52] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[15:05:52] ==================== drm_test_fb_swab  =====================
[15:05:52] [PASSED] single_pixel_source_buffer
[15:05:52] [PASSED] single_pixel_clip_rectangle
[15:05:52] [PASSED] well_known_colors
[15:05:52] [PASSED] destination_pitch
[15:05:52] ================ [PASSED] drm_test_fb_swab =================
[15:05:52] ================= drm_test_fb_clip_offset  =================
[15:05:52] [PASSED] pass through
[15:05:52] [PASSED] horizontal offset
[15:05:52] [PASSED] vertical offset
[15:05:52] [PASSED] horizontal and vertical offset
[15:05:52] [PASSED] horizontal offset (custom pitch)
[15:05:52] [PASSED] vertical offset (custom pitch)
[15:05:52] [PASSED] horizontal and vertical offset (custom pitch)
[15:05:52] ============= [PASSED] drm_test_fb_clip_offset =============
[15:05:52] ============== drm_test_fb_build_fourcc_list  ==============
[15:05:52] [PASSED] no native formats
[15:05:52] [PASSED] XRGB8888 as native format
[15:05:52] [PASSED] remove duplicates
[15:05:52] [PASSED] convert alpha formats
[15:05:52] [PASSED] random formats
[15:05:52] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[15:05:52] =================== drm_test_fb_memcpy  ====================
[15:05:52] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[15:05:52] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[15:05:52] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[15:05:52] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[15:05:52] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[15:05:52] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[15:05:52] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[15:05:52] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[15:05:52] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[15:05:52] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[15:05:52] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[15:05:52] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[15:05:52] =============== [PASSED] drm_test_fb_memcpy ================
[15:05:52] ============= [PASSED] drm_format_helper_test ==============
[15:05:52] ======================= drm_format  ========================
[15:05:52] [PASSED] drm_test_format_block_width_invalid
[15:05:52] [PASSED] drm_test_format_block_width_one_plane
[15:05:52] [PASSED] drm_test_format_block_width_two_plane
[15:05:52] [PASSED] drm_test_format_block_width_three_plane
[15:05:52] [PASSED] drm_test_format_block_width_tiled
[15:05:52] [PASSED] drm_test_format_block_height_invalid
[15:05:52] [PASSED] drm_test_format_block_height_one_plane
[15:05:52] [PASSED] drm_test_format_block_height_two_plane
[15:05:52] [PASSED] drm_test_format_block_height_three_plane
[15:05:52] [PASSED] drm_test_format_block_height_tiled
[15:05:52] [PASSED] drm_test_format_min_pitch_invalid
[15:05:52] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[15:05:52] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[15:05:52] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[15:05:52] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[15:05:52] [PASSED] drm_test_format_min_pitch_two_plane
[15:05:52] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[15:05:52] [PASSED] drm_test_format_min_pitch_tiled
[15:05:52] =================== [PASSED] drm_format ====================
[15:05:52] ===================== drm_framebuffer  =====================
[15:05:52] =============== drm_test_framebuffer_create  ===============
[15:05:52] [PASSED] ABGR8888 normal sizes
[15:05:52] [PASSED] ABGR8888 max sizes
[15:05:52] [PASSED] ABGR8888 pitch greater than min required
[15:05:52] [PASSED] ABGR8888 pitch less than min required
[15:05:52] [PASSED] ABGR8888 Invalid width
[15:05:52] [PASSED] ABGR8888 Invalid buffer handle
[15:05:52] [PASSED] No pixel format
[15:05:52] [PASSED] ABGR8888 Width 0
[15:05:52] [PASSED] ABGR8888 Height 0
[15:05:52] [PASSED] ABGR8888 Out of bound height * pitch combination
[15:05:52] [PASSED] ABGR8888 Large buffer offset
[15:05:52] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[15:05:52] [PASSED] ABGR8888 Valid buffer modifier
[15:05:52] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[15:05:52] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[15:05:52] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[15:05:52] [PASSED] NV12 Normal sizes
[15:05:52] [PASSED] NV12 Max sizes
[15:05:52] [PASSED] NV12 Invalid pitch
[15:05:52] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[15:05:52] [PASSED] NV12 different  modifier per-plane
[15:05:52] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[15:05:52] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[15:05:52] [PASSED] NV12 Modifier for inexistent plane
[15:05:52] [PASSED] NV12 Handle for inexistent plane
[15:05:52] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[15:05:52] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[15:05:52] [PASSED] YVU420 Normal sizes
[15:05:52] [PASSED] YVU420 Max sizes
[15:05:52] [PASSED] YVU420 Invalid pitch
[15:05:52] [PASSED] YVU420 Different pitches
[15:05:52] [PASSED] YVU420 Different buffer offsets/pitches
[15:05:52] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[15:05:52] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[15:05:52] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[15:05:52] [PASSED] YVU420 Valid modifier
[15:05:52] [PASSED] YVU420 Different modifiers per plane
[15:05:52] [PASSED] YVU420 Modifier for inexistent plane
[15:05:52] [PASSED] X0L2 Normal sizes
[15:05:52] [PASSED] X0L2 Max sizes
[15:05:52] [PASSED] X0L2 Invalid pitch
[15:05:52] [PASSED] X0L2 Pitch greater than minimum required
[15:05:52] [PASSED] X0L2 Handle for inexistent plane
[15:05:52] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[15:05:52] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[15:05:52] [PASSED] X0L2 Valid modifier
[15:05:52] [PASSED] X0L2 Modifier for inexistent plane
[15:05:52] =========== [PASSED] drm_test_framebuffer_create ===========
[15:05:52] ================= [PASSED] drm_framebuffer =================
[15:05:52] ==================== drm-test-managed  =====================
[15:05:52] [PASSED] drm_test_managed_run_action
[15:05:52] ================ [PASSED] drm-test-managed =================
[15:05:52] ========================= drm_mm  ==========================
[15:05:52] [PASSED] drm_test_mm_init
[15:05:52] [PASSED] drm_test_mm_debug
[15:06:02] [PASSED] drm_test_mm_reserve
[15:06:12] [PASSED] drm_test_mm_insert
[15:06:13] [PASSED] drm_test_mm_replace
[15:06:13] [PASSED] drm_test_mm_insert_range
[15:06:13] [PASSED] drm_test_mm_frag
[15:06:13] [PASSED] drm_test_mm_align
[15:06:13] [PASSED] drm_test_mm_align32
[15:06:13] [PASSED] drm_test_mm_align64
[15:06:14] [PASSED] drm_test_mm_evict
[15:06:14] [PASSED] drm_test_mm_evict_range
[15:06:14] [PASSED] drm_test_mm_topdown
[15:06:14] [PASSED] drm_test_mm_bottomup
[15:06:14] [PASSED] drm_test_mm_lowest
[15:06:14] [PASSED] drm_test_mm_highest
[15:06:14] [PASSED] drm_test_mm_color
[15:06:15] [PASSED] drm_test_mm_color_evict
[15:06:15] [PASSED] drm_test_mm_color_evict_range
[15:06:15] ===================== [PASSED] drm_mm ======================
[15:06:15] =================== drm_modes_analog_tv  ===================
[15:06:15] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[15:06:15] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[15:06:15] [PASSED] drm_test_modes_analog_tv_pal_576i
[15:06:15] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[15:06:15] =============== [PASSED] drm_modes_analog_tv ===============
[15:06:15] ==================== drm_plane_helper  =====================
[15:06:15] =============== drm_test_check_plane_state  ================
[15:06:15] [PASSED] clipping_simple
[15:06:15] [PASSED] clipping_rotate_reflect
[15:06:15] [PASSED] positioning_simple
[15:06:15] [PASSED] upscaling
[15:06:15] [PASSED] downscaling
[15:06:15] [PASSED] rounding1
[15:06:15] [PASSED] rounding2
[15:06:15] [PASSED] rounding3
[15:06:15] [PASSED] rounding4
[15:06:15] =========== [PASSED] drm_test_check_plane_state ============
[15:06:15] =========== drm_test_check_invalid_plane_state  ============
[15:06:15] [PASSED] positioning_invalid
[15:06:15] [PASSED] upscaling_invalid
[15:06:15] [PASSED] downscaling_invalid
[15:06:15] ======= [PASSED] drm_test_check_invalid_plane_state ========
[15:06:15] ================ [PASSED] drm_plane_helper =================
[15:06:15] ============ drm_connector_helper_tv_get_modes  ============
[15:06:15] ====== drm_test_connector_helper_tv_get_modes_check  =======
[15:06:15] [PASSED] None
[15:06:15] [PASSED] PAL
[15:06:15] [PASSED] NTSC
[15:06:15] [PASSED] Both, NTSC Default
[15:06:15] [PASSED] Both, PAL Default
[15:06:15] [PASSED] Both, NTSC Default, with PAL on command-line
[15:06:15] [PASSED] Both, PAL Default, with NTSC on command-line
[15:06:15] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[15:06:15] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[15:06:15] ======================== drm_rect  =========================
[15:06:15] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[15:06:15] [PASSED] drm_test_rect_clip_scaled_not_clipped
[15:06:15] [PASSED] drm_test_rect_clip_scaled_clipped
[15:06:15] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[15:06:15] ================= drm_test_rect_intersect  =================
[15:06:15] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[15:06:15] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[15:06:15] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[15:06:15] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[15:06:15] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[15:06:15] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[15:06:15] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[15:06:15] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[15:06:15] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[15:06:15] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[15:06:15] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[15:06:15] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[15:06:15] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[15:06:15] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[15:06:15] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[15:06:15] ============= [PASSED] drm_test_rect_intersect =============
[15:06:15] ================ drm_test_rect_calc_hscale  ================
[15:06:15] [PASSED] normal use
[15:06:15] [PASSED] out of max range
[15:06:15] [PASSED] out of min range
[15:06:15] [PASSED] zero dst
[15:06:15] [PASSED] negative src
[15:06:15] [PASSED] negative dst
[15:06:15] ============ [PASSED] drm_test_rect_calc_hscale ============
[15:06:15] ================ drm_test_rect_calc_vscale  ================
[15:06:15] [PASSED] normal use
[15:06:15] [PASSED] out of max range
[15:06:15] [PASSED] out of min range
[15:06:15] [PASSED] zero dst
[15:06:15] [PASSED] negative src
[15:06:15] [PASSED] negative dst
[15:06:15] ============ [PASSED] drm_test_rect_calc_vscale ============
[15:06:15] ================== drm_test_rect_rotate  ===================
[15:06:15] [PASSED] reflect-x
[15:06:15] [PASSED] reflect-y
[15:06:15] [PASSED] rotate-0
[15:06:15] [PASSED] rotate-90
[15:06:15] [PASSED] rotate-180
[15:06:15] [PASSED] rotate-270
[15:06:15] ============== [PASSED] drm_test_rect_rotate ===============
[15:06:15] ================ drm_test_rect_rotate_inv  =================
[15:06:15] [PASSED] reflect-x
[15:06:15] [PASSED] reflect-y
[15:06:15] [PASSED] rotate-0
[15:06:15] [PASSED] rotate-90
[15:06:15] [PASSED] rotate-180
[15:06:15] [PASSED] rotate-270
[15:06:15] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[15:06:15] ==================== [PASSED] drm_rect =====================
[15:06:15] ======================== drm_exec  =========================
[15:06:15] [PASSED] sanitycheck
[15:06:15] [PASSED] test_lock
[15:06:15] [PASSED] test_lock_unlock
[15:06:15] [PASSED] test_duplicates
[15:06:15] [PASSED] test_prepare
[15:06:15] [PASSED] test_prepare_array
[15:06:15] [PASSED] test_multiple_loops
[15:06:15] ==================== [PASSED] drm_exec =====================
[15:06:15] ============================================================
[15:06:15] Testing complete. Ran 368 tests: passed: 368
[15:06:15] Elapsed time: 44.676s total, 1.690s configuring, 19.244s building, 23.706s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


