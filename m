Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75056C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 22:36:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B2E10E85F;
	Wed, 13 Dec 2023 22:36:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 636CF10E160;
 Wed, 13 Dec 2023 22:36:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5E8B2A0093;
 Wed, 13 Dec 2023 22:36:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/uapi=3A_Uniform_async_v?=
 =?utf-8?q?s_sync_handling_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 13 Dec 2023 22:36:27 -0000
Message-ID: <170250698738.10265.7558263566917913761@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231213222957.624515-1-matthew.brost@intel.com>
In-Reply-To: <20231213222957.624515-1-matthew.brost@intel.com>
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

Series: drm/xe/uapi: Uniform async vs sync handling (rev3)
URL   : https://patchwork.freedesktop.org/series/127442/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[22:35:15] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:35:20] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[22:35:40] Starting KUnit Kernel (1/1)...
[22:35:40] ============================================================
[22:35:40] ========================== lmtt  ===========================
[22:35:40] ======================== test_ops  =========================
[22:35:40] [PASSED] 2-level
[22:35:40] [PASSED] multi-level
[22:35:40] ==================== [PASSED] test_ops =====================
[22:35:40] ====================== [PASSED] lmtt =======================
[22:35:40] ========================== xe_bo  ==========================
[22:35:40] [SKIPPED] xe_ccs_migrate_kunit
[22:35:40] [SKIPPED] xe_bo_evict_kunit
[22:35:40] ===================== [SKIPPED] xe_bo ======================
[22:35:40] ======================= xe_dma_buf  ========================
[22:35:40] [SKIPPED] xe_dma_buf_kunit
[22:35:40] =================== [SKIPPED] xe_dma_buf ===================
[22:35:40] ======================= xe_migrate  ========================
[22:35:40] [SKIPPED] xe_migrate_sanity_kunit
[22:35:40] =================== [SKIPPED] xe_migrate ===================
[22:35:40] ========================= xe_mocs  =========================
[22:35:40] [SKIPPED] xe_live_mocs_kernel_kunit
[22:35:40] ==================== [SKIPPED] xe_mocs =====================
[22:35:40] ========================= xe_pci  ==========================
[22:35:40] [PASSED] xe_gmdid_graphics_ip
[22:35:40] [PASSED] xe_gmdid_media_ip
[22:35:40] ===================== [PASSED] xe_pci ======================
[22:35:40] ========================= xe_rtp  ==========================
[22:35:40] ================== xe_rtp_process_tests  ===================
[22:35:40] [PASSED] coalesce-same-reg
[22:35:40] [PASSED] no-match-no-add
[22:35:40] [PASSED] no-match-no-add-multiple-rules
[22:35:40] [PASSED] two-regs-two-entries
[22:35:40] [PASSED] clr-one-set-other
[22:35:40] [PASSED] set-field
[22:35:40] [PASSED] conflict-duplicate
[22:35:40] [PASSED] conflict-not-disjoint
[22:35:40] [PASSED] conflict-reg-type
[22:35:40] ============== [PASSED] xe_rtp_process_tests ===============
[22:35:40] ===================== [PASSED] xe_rtp ======================
[22:35:40] ========================== xe_wa  ==========================
[22:35:40] ======================== xe_wa_gt  =========================
[22:35:40] [PASSED] TIGERLAKE (B0)
[22:35:40] [PASSED] DG1 (A0)
[22:35:40] [PASSED] DG1 (B0)
[22:35:40] [PASSED] ALDERLAKE_S (A0)
[22:35:40] [PASSED] ALDERLAKE_S (B0)
[22:35:40] [PASSED] ALDERLAKE_S (C0)
[22:35:40] [PASSED] ALDERLAKE_S (D0)
[22:35:40] [PASSED] ALDERLAKE_P (A0)
[22:35:40] [PASSED] ALDERLAKE_P (B0)
[22:35:40] [PASSED] ALDERLAKE_P (C0)
[22:35:40] [PASSED] ALDERLAKE_S_RPLS (D0)
[22:35:40] [PASSED] ALDERLAKE_P_RPLU (E0)
[22:35:40] [PASSED] DG2_G10 (A0)
[22:35:40] [PASSED] DG2_G10 (A1)
[22:35:40] [PASSED] DG2_G10 (B0)
[22:35:40] [PASSED] DG2_G10 (C0)
[22:35:40] [PASSED] DG2_G11 (A0)
[22:35:40] [PASSED] DG2_G11 (B0)
[22:35:40] [PASSED] DG2_G11 (B1)
[22:35:40] [PASSED] DG2_G12 (A0)
[22:35:40] [PASSED] DG2_G12 (A1)
[22:35:40] [PASSED] PVC (B0)
[22:35:40] [PASSED] PVC (B1)
[22:35:40] [PASSED] PVC (C0)
[22:35:40] [PASSED] METEORLAKE (g:A0, m:A0)
[22:35:40] [PASSED] METEORLAKE (g:A0, m:A0)
[22:35:40] [PASSED] LUNARLAKE (g:A0, m:A0)
[22:35:40] [PASSED] LUNARLAKE (g:B0, m:A0)
[22:35:40] ==================== [PASSED] xe_wa_gt =====================
[22:35:40] ====================== [PASSED] xe_wa ======================
[22:35:40] ============================================================
[22:35:40] Testing complete. Ran 46 tests: passed: 41, skipped: 5
[22:35:40] Elapsed time: 25.015s total, 4.272s configuring, 20.573s building, 0.145s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[22:35:41] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:35:42] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[22:36:01] Starting KUnit Kernel (1/1)...
[22:36:01] ============================================================
[22:36:01] ================== drm_test_pick_cmdline  ==================
[22:36:01] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[22:36:01] =============== drm_test_pick_cmdline_named  ===============
[22:36:01] [PASSED] NTSC
[22:36:01] [PASSED] NTSC-J
[22:36:01] [PASSED] PAL
[22:36:01] [PASSED] PAL-M
[22:36:01] =========== [PASSED] drm_test_pick_cmdline_named ===========
[22:36:01] ============== [PASSED] drm_test_pick_cmdline ==============
[22:36:01] ======================== drm_buddy  ========================
[22:36:01] [PASSED] drm_test_buddy_alloc_limit
[22:36:01] [PASSED] drm_test_buddy_alloc_range
[22:36:01] [PASSED] drm_test_buddy_alloc_optimistic
[22:36:01] [PASSED] drm_test_buddy_alloc_pessimistic
[22:36:01] [PASSED] drm_test_buddy_alloc_smoke
[22:36:01] [PASSED] drm_test_buddy_alloc_pathological
[22:36:01] ==================== [PASSED] drm_buddy ====================
[22:36:01] =================== drm_cmdline_parser  ====================
[22:36:01] [PASSED] drm_test_cmdline_force_d_only
[22:36:01] [PASSED] drm_test_cmdline_force_D_only_dvi
[22:36:01] [PASSED] drm_test_cmdline_force_D_only_hdmi
[22:36:01] [PASSED] drm_test_cmdline_force_D_only_not_digital
[22:36:01] [PASSED] drm_test_cmdline_force_e_only
[22:36:01] [PASSED] drm_test_cmdline_res
[22:36:01] [PASSED] drm_test_cmdline_res_vesa
[22:36:01] [PASSED] drm_test_cmdline_res_vesa_rblank
[22:36:01] [PASSED] drm_test_cmdline_res_rblank
[22:36:01] [PASSED] drm_test_cmdline_res_bpp
[22:36:01] [PASSED] drm_test_cmdline_res_refresh
[22:36:01] [PASSED] drm_test_cmdline_res_bpp_refresh
[22:36:01] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[22:36:01] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[22:36:01] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[22:36:01] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[22:36:01] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[22:36:01] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[22:36:01] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[22:36:01] [PASSED] drm_test_cmdline_res_margins_force_on
[22:36:01] [PASSED] drm_test_cmdline_res_vesa_margins
[22:36:01] [PASSED] drm_test_cmdline_name
[22:36:01] [PASSED] drm_test_cmdline_name_bpp
[22:36:01] [PASSED] drm_test_cmdline_name_option
[22:36:01] [PASSED] drm_test_cmdline_name_bpp_option
[22:36:01] [PASSED] drm_test_cmdline_rotate_0
[22:36:01] [PASSED] drm_test_cmdline_rotate_90
[22:36:01] [PASSED] drm_test_cmdline_rotate_180
[22:36:01] [PASSED] drm_test_cmdline_rotate_270
[22:36:01] [PASSED] drm_test_cmdline_hmirror
[22:36:01] [PASSED] drm_test_cmdline_vmirror
[22:36:01] [PASSED] drm_test_cmdline_margin_options
[22:36:01] [PASSED] drm_test_cmdline_multiple_options
[22:36:01] [PASSED] drm_test_cmdline_bpp_extra_and_option
[22:36:01] [PASSED] drm_test_cmdline_extra_and_option
[22:36:01] [PASSED] drm_test_cmdline_freestanding_options
[22:36:01] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[22:36:01] [PASSED] drm_test_cmdline_panel_orientation
[22:36:01] ================ drm_test_cmdline_invalid  =================
[22:36:01] [PASSED] margin_only
[22:36:01] [PASSED] interlace_only
[22:36:01] [PASSED] res_missing_x
[22:36:01] [PASSED] res_missing_y
[22:36:01] [PASSED] res_bad_y
[22:36:01] [PASSED] res_missing_y_bpp
[22:36:01] [PASSED] res_bad_bpp
[22:36:01] [PASSED] res_bad_refresh
[22:36:01] [PASSED] res_bpp_refresh_force_on_off
[22:36:01] [PASSED] res_invalid_mode
[22:36:01] [PASSED] res_bpp_wrong_place_mode
[22:36:01] [PASSED] name_bpp_refresh
[22:36:01] [PASSED] name_refresh
[22:36:01] [PASSED] name_refresh_wrong_mode
[22:36:01] [PASSED] name_refresh_invalid_mode
[22:36:01] [PASSED] rotate_multiple
[22:36:01] [PASSED] rotate_invalid_val
[22:36:01] [PASSED] rotate_truncated
[22:36:01] [PASSED] invalid_option
[22:36:01] [PASSED] invalid_tv_option
[22:36:01] [PASSED] truncated_tv_option
[22:36:01] ============ [PASSED] drm_test_cmdline_invalid =============
[22:36:01] =============== drm_test_cmdline_tv_options  ===============
[22:36:01] [PASSED] NTSC
[22:36:01] [PASSED] NTSC_443
[22:36:01] [PASSED] NTSC_J
[22:36:01] [PASSED] PAL
[22:36:01] [PASSED] PAL_M
[22:36:01] [PASSED] PAL_N
[22:36:01] [PASSED] SECAM
[22:36:01] =========== [PASSED] drm_test_cmdline_tv_options ===========
[22:36:01] =============== [PASSED] drm_cmdline_parser ================
[22:36:01] ================ drm_get_tv_mode_from_name  ================
[22:36:01] ========== drm_test_get_tv_mode_from_name_valid  ===========
[22:36:01] [PASSED] NTSC
[22:36:01] [PASSED] NTSC-443
[22:36:01] [PASSED] NTSC-J
[22:36:01] [PASSED] PAL
[22:36:01] [PASSED] PAL-M
[22:36:01] [PASSED] PAL-N
[22:36:01] [PASSED] SECAM
[22:36:01] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[22:36:01] [PASSED] drm_test_get_tv_mode_from_name_truncated
[22:36:01] ============ [PASSED] drm_get_tv_mode_from_name ============
[22:36:01] ==================== drm_damage_helper  ====================
[22:36:01] [PASSED] drm_test_damage_iter_no_damage
[22:36:01] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[22:36:01] [PASSED] drm_test_damage_iter_no_damage_src_moved
[22:36:01] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[22:36:01] [PASSED] drm_test_damage_iter_no_damage_not_visible
[22:36:01] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[22:36:01] [PASSED] drm_test_damage_iter_no_damage_no_fb
[22:36:01] [PASSED] drm_test_damage_iter_simple_damage
[22:36:01] [PASSED] drm_test_damage_iter_single_damage
[22:36:01] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[22:36:01] [PASSED] drm_test_damage_iter_single_damage_outside_src
[22:36:01] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[22:36:01] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[22:36:01] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[22:36:01] [PASSED] drm_test_damage_iter_single_damage_src_moved
[22:36:01] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[22:36:01] [PASSED] drm_test_damage_iter_damage
[22:36:01] [PASSED] drm_test_damage_iter_damage_one_intersect
[22:36:01] [PASSED] drm_test_damage_iter_damage_one_outside
[22:36:01] [PASSED] drm_test_damage_iter_damage_src_moved
[22:36:01] [PASSED] drm_test_damage_iter_damage_not_visible
[22:36:01] ================ [PASSED] drm_damage_helper ================
[22:36:01] ==================== drm_dp_mst_helper  ====================
[22:36:01] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[22:36:01] [PASSED] Clock 154000 BPP 30 DSC disabled
[22:36:01] [PASSED] Clock 234000 BPP 30 DSC disabled
[22:36:01] [PASSED] Clock 297000 BPP 24 DSC disabled
[22:36:01] [PASSED] Clock 332880 BPP 24 DSC enabled
[22:36:01] [PASSED] Clock 324540 BPP 24 DSC enabled
[22:36:01] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[22:36:01] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[22:36:01] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[22:36:01] [PASSED] DP_POWER_UP_PHY with port number
[22:36:01] [PASSED] DP_POWER_DOWN_PHY with port number
[22:36:01] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[22:36:01] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[22:36:01] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[22:36:01] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[22:36:01] [PASSED] DP_QUERY_PAYLOAD with port number
[22:36:01] [PASSED] DP_QUERY_PAYLOAD with VCPI
[22:36:01] [PASSED] DP_REMOTE_DPCD_READ with port number
[22:36:01] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[22:36:01] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[22:36:01] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[22:36:01] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[22:36:01] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[22:36:01] [PASSED] DP_REMOTE_I2C_READ with port number
[22:36:01] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[22:36:01] [PASSED] DP_REMOTE_I2C_READ with transactions array
[22:36:01] [PASSED] DP_REMOTE_I2C_WRITE with port number
[22:36:01] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[22:36:01] [PASSED] DP_REMOTE_I2C_WRITE with data array
[22:36:01] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[22:36:01] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[22:36:01] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[22:36:01] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[22:36:01] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[22:36:01] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[22:36:01] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[22:36:01] ================ [PASSED] drm_dp_mst_helper ================
[22:36:01] ================= drm_format_helper_test  ==================
[22:36:01] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[22:36:01] [PASSED] single_pixel_source_buffer
[22:36:01] [PASSED] single_pixel_clip_rectangle
[22:36:01] [PASSED] well_known_colors
[22:36:01] [PASSED] destination_pitch
[22:36:01] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[22:36:01] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[22:36:01] [PASSED] single_pixel_source_buffer
[22:36:01] [PASSED] single_pixel_clip_rectangle
[22:36:01] [PASSED] well_known_colors
[22:36:01] [PASSED] destination_pitch
[22:36:01] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[22:36:01] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[22:36:01] [PASSED] single_pixel_source_buffer
[22:36:01] [PASSED] single_pixel_clip_rectangle
[22:36:01] [PASSED] well_known_colors
[22:36:01] [PASSED] destination_pitch
[22:36:01] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[22:36:01] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[22:36:01] [PASSED] single_pixel_source_buffer
[22:36:01] [PASSED] single_pixel_clip_rectangle
[22:36:01] [PASSED] well_known_colors
[22:36:01] [PASSED] destination_pitch
[22:36:01] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[22:36:01] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[22:36:01] [PASSED] single_pixel_source_buffer
[22:36:01] [PASSED] single_pixel_clip_rectangle
[22:36:01] [PASSED] well_known_colors
[22:36:01] [PASSED] destination_pitch
[22:36:01] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[22:36:01] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[22:36:01] [PASSED] single_pixel_source_buffer
[22:36:01] [PASSED] single_pixel_clip_rectangle
[22:36:01] [PASSED] well_known_colors
[22:36:01] [PASSED] destination_pitch
[22:36:01] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[22:36:01] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[22:36:01] [PASSED] single_pixel_source_buffer
[22:36:01] [PASSED] single_pixel_clip_rectangle
[22:36:01] [PASSED] well_known_colors
[22:36:01] [PASSED] destination_pitch
[22:36:01] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[22:36:01] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[22:36:01] [PASSED] single_pixel_source_buffer
[22:36:01] [PASSED] single_pixel_clip_rectangle
[22:36:01] [PASSED] well_known_colors
[22:36:01] [PASSED] destination_pitch
[22:36:01] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[22:36:01] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[22:36:01] [PASSED] single_pixel_source_buffer
[22:36:01] [PASSED] single_pixel_clip_rectangle
[22:36:01] [PASSED] well_known_colors
[22:36:01] [PASSED] destination_pitch
[22:36:01] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[22:36:01] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[22:36:01] [PASSED] single_pixel_source_buffer
[22:36:01] [PASSED] single_pixel_clip_rectangle
[22:36:01] [PASSED] well_known_colors
[22:36:01] [PASSED] destination_pitch
[22:36:01] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[22:36:01] ============== drm_test_fb_xrgb8888_to_mono  ===============
[22:36:01] [PASSED] single_pixel_source_buffer
[22:36:01] [PASSED] single_pixel_clip_rectangle
[22:36:01] [PASSED] well_known_colors
[22:36:01] [PASSED] destination_pitch
[22:36:01] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[22:36:01] ==================== drm_test_fb_swab  =====================
[22:36:01] [PASSED] single_pixel_source_buffer
[22:36:01] [PASSED] single_pixel_clip_rectangle
[22:36:01] [PASSED] well_known_colors
[22:36:01] [PASSED] destination_pitch
[22:36:01] ================ [PASSED] drm_test_fb_swab =================
[22:36:01] ================= drm_test_fb_clip_offset  =================
[22:36:01] [PASSED] pass through
[22:36:01] [PASSED] horizontal offset
[22:36:01] [PASSED] vertical offset
[22:36:01] [PASSED] horizontal and vertical offset
[22:36:01] [PASSED] horizontal offset (custom pitch)
[22:36:01] [PASSED] vertical offset (custom pitch)
[22:36:01] [PASSED] horizontal and vertical offset (custom pitch)
[22:36:01] ============= [PASSED] drm_test_fb_clip_offset =============
[22:36:01] ============== drm_test_fb_build_fourcc_list  ==============
[22:36:01] [PASSED] no native formats
[22:36:01] [PASSED] XRGB8888 as native format
[22:36:01] [PASSED] remove duplicates
[22:36:01] [PASSED] convert alpha formats
[22:36:01] [PASSED] random formats
[22:36:01] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[22:36:01] =================== drm_test_fb_memcpy  ====================
[22:36:01] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[22:36:01] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[22:36:01] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[22:36:01] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[22:36:01] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[22:36:01] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[22:36:01] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[22:36:01] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[22:36:01] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[22:36:01] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[22:36:01] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[22:36:01] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[22:36:01] =============== [PASSED] drm_test_fb_memcpy ================
[22:36:01] ============= [PASSED] drm_format_helper_test ==============
[22:36:01] ======================= drm_format  ========================
[22:36:01] [PASSED] drm_test_format_block_width_invalid
[22:36:01] [PASSED] drm_test_format_block_width_one_plane
[22:36:01] [PASSED] drm_test_format_block_width_two_plane
[22:36:01] [PASSED] drm_test_format_block_width_three_plane
[22:36:01] [PASSED] drm_test_format_block_width_tiled
[22:36:01] [PASSED] drm_test_format_block_height_invalid
[22:36:01] [PASSED] drm_test_format_block_height_one_plane
[22:36:01] [PASSED] drm_test_format_block_height_two_plane
[22:36:01] [PASSED] drm_test_format_block_height_three_plane
[22:36:01] [PASSED] drm_test_format_block_height_tiled
[22:36:01] [PASSED] drm_test_format_min_pitch_invalid
[22:36:01] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[22:36:01] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[22:36:01] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[22:36:01] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[22:36:01] [PASSED] drm_test_format_min_pitch_two_plane
[22:36:01] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[22:36:01] [PASSED] drm_test_format_min_pitch_tiled
[22:36:01] =================== [PASSED] drm_format ====================
[22:36:01] ===================== drm_framebuffer  =====================
[22:36:01] =============== drm_test_framebuffer_create  ===============
[22:36:01] [PASSED] ABGR8888 normal sizes
[22:36:01] [PASSED] ABGR8888 max sizes
[22:36:01] [PASSED] ABGR8888 pitch greater than min required
[22:36:01] [PASSED] ABGR8888 pitch less than min required
[22:36:01] [PASSED] ABGR8888 Invalid width
[22:36:01] [PASSED] ABGR8888 Invalid buffer handle
[22:36:01] [PASSED] No pixel format
[22:36:01] [PASSED] ABGR8888 Width 0
[22:36:01] [PASSED] ABGR8888 Height 0
[22:36:01] [PASSED] ABGR8888 Out of bound height * pitch combination
[22:36:01] [PASSED] ABGR8888 Large buffer offset
[22:36:01] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[22:36:01] [PASSED] ABGR8888 Valid buffer modifier
[22:36:01] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[22:36:01] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[22:36:01] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[22:36:01] [PASSED] NV12 Normal sizes
[22:36:01] [PASSED] NV12 Max sizes
[22:36:01] [PASSED] NV12 Invalid pitch
[22:36:01] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[22:36:01] [PASSED] NV12 different  modifier per-plane
[22:36:01] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[22:36:01] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[22:36:01] [PASSED] NV12 Modifier for inexistent plane
[22:36:01] [PASSED] NV12 Handle for inexistent plane
[22:36:01] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[22:36:01] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[22:36:01] [PASSED] YVU420 Normal sizes
[22:36:01] [PASSED] YVU420 Max sizes
[22:36:01] [PASSED] YVU420 Invalid pitch
[22:36:01] [PASSED] YVU420 Different pitches
[22:36:01] [PASSED] YVU420 Different buffer offsets/pitches
[22:36:01] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[22:36:01] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[22:36:01] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[22:36:01] [PASSED] YVU420 Valid modifier
[22:36:01] [PASSED] YVU420 Different modifiers per plane
[22:36:01] [PASSED] YVU420 Modifier for inexistent plane
[22:36:01] [PASSED] X0L2 Normal sizes
[22:36:01] [PASSED] X0L2 Max sizes
[22:36:01] [PASSED] X0L2 Invalid pitch
[22:36:01] [PASSED] X0L2 Pitch greater than minimum required
[22:36:01] [PASSED] X0L2 Handle for inexistent plane
[22:36:01] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[22:36:01] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[22:36:01] [PASSED] X0L2 Valid modifier
[22:36:01] [PASSED] X0L2 Modifier for inexistent plane
[22:36:01] =========== [PASSED] drm_test_framebuffer_create ===========
[22:36:01] ================= [PASSED] drm_framebuffer =================
[22:36:01] ==================== drm-test-managed  =====================
[22:36:01] [PASSED] drm_test_managed_run_action
[22:36:01] ================ [PASSED] drm-test-managed =================
[22:36:01] ========================= drm_mm  ==========================
[22:36:01] [PASSED] drm_test_mm_init
[22:36:02] [PASSED] drm_test_mm_debug
[22:36:12] [PASSED] drm_test_mm_reserve
[22:36:22] [PASSED] drm_test_mm_insert
[22:36:23] [PASSED] drm_test_mm_replace
[22:36:23] [PASSED] drm_test_mm_insert_range
[22:36:23] [PASSED] drm_test_mm_frag
[22:36:23] [PASSED] drm_test_mm_align
[22:36:23] [PASSED] drm_test_mm_align32
[22:36:23] [PASSED] drm_test_mm_align64
[22:36:23] [PASSED] drm_test_mm_evict
[22:36:23] [PASSED] drm_test_mm_evict_range
[22:36:23] [PASSED] drm_test_mm_topdown
[22:36:23] [PASSED] drm_test_mm_bottomup
[22:36:23] [PASSED] drm_test_mm_lowest
[22:36:23] [PASSED] drm_test_mm_highest
[22:36:24] [PASSED] drm_test_mm_color
[22:36:25] [PASSED] drm_test_mm_color_evict
[22:36:25] [PASSED] drm_test_mm_color_evict_range
[22:36:25] ===================== [PASSED] drm_mm ======================
[22:36:25] =================== drm_modes_analog_tv  ===================
[22:36:25] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[22:36:25] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[22:36:25] [PASSED] drm_test_modes_analog_tv_pal_576i
[22:36:25] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[22:36:25] =============== [PASSED] drm_modes_analog_tv ===============
[22:36:25] ==================== drm_plane_helper  =====================
[22:36:25] =============== drm_test_check_plane_state  ================
[22:36:25] [PASSED] clipping_simple
[22:36:25] [PASSED] clipping_rotate_reflect
[22:36:25] [PASSED] positioning_simple
[22:36:25] [PASSED] upscaling
[22:36:25] [PASSED] downscaling
[22:36:25] [PASSED] rounding1
[22:36:25] [PASSED] rounding2
[22:36:25] [PASSED] rounding3
[22:36:25] [PASSED] rounding4
[22:36:25] =========== [PASSED] drm_test_check_plane_state ============
[22:36:25] =========== drm_test_check_invalid_plane_state  ============
[22:36:25] [PASSED] positioning_invalid
[22:36:25] [PASSED] upscaling_invalid
[22:36:25] [PASSED] downscaling_invalid
[22:36:25] ======= [PASSED] drm_test_check_invalid_plane_state ========
[22:36:25] ================ [PASSED] drm_plane_helper =================
[22:36:25] ============ drm_connector_helper_tv_get_modes  ============
[22:36:25] ====== drm_test_connector_helper_tv_get_modes_check  =======
[22:36:25] [PASSED] None
[22:36:25] [PASSED] PAL
[22:36:25] [PASSED] NTSC
[22:36:25] [PASSED] Both, NTSC Default
[22:36:25] [PASSED] Both, PAL Default
[22:36:25] [PASSED] Both, NTSC Default, with PAL on command-line
[22:36:25] [PASSED] Both, PAL Default, with NTSC on command-line
[22:36:25] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[22:36:25] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[22:36:25] ======================== drm_rect  =========================
[22:36:25] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[22:36:25] [PASSED] drm_test_rect_clip_scaled_not_clipped
[22:36:25] [PASSED] drm_test_rect_clip_scaled_clipped
[22:36:25] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[22:36:25] ================= drm_test_rect_intersect  =================
[22:36:25] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[22:36:25] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[22:36:25] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[22:36:25] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[22:36:25] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[22:36:25] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[22:36:25] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[22:36:25] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[22:36:25] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[22:36:25] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[22:36:25] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[22:36:25] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[22:36:25] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[22:36:25] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[22:36:25] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[22:36:25] ============= [PASSED] drm_test_rect_intersect =============
[22:36:25] ================ drm_test_rect_calc_hscale  ================
[22:36:25] [PASSED] normal use
[22:36:25] [PASSED] out of max range
[22:36:25] [PASSED] out of min range
[22:36:25] [PASSED] zero dst
[22:36:25] [PASSED] negative src
[22:36:25] [PASSED] negative dst
[22:36:25] ============ [PASSED] drm_test_rect_calc_hscale ============
[22:36:25] ================ drm_test_rect_calc_vscale  ================
[22:36:25] [PASSED] normal use
[22:36:25] [PASSED] out of max range
[22:36:25] [PASSED] out of min range
[22:36:25] [PASSED] zero dst
[22:36:25] [PASSED] negative src
[22:36:25] [PASSED] negative dst
[22:36:25] ============ [PASSED] drm_test_rect_calc_vscale ============
[22:36:25] ================== drm_test_rect_rotate  ===================
[22:36:25] [PASSED] reflect-x
[22:36:25] [PASSED] reflect-y
[22:36:25] [PASSED] rotate-0
[22:36:25] [PASSED] rotate-90
[22:36:25] [PASSED] rotate-180
[22:36:25] [PASSED] rotate-270
[22:36:25] ============== [PASSED] drm_test_rect_rotate ===============
[22:36:25] ================ drm_test_rect_rotate_inv  =================
[22:36:25] [PASSED] reflect-x
[22:36:25] [PASSED] reflect-y
[22:36:25] [PASSED] rotate-0
[22:36:25] [PASSED] rotate-90
[22:36:25] [PASSED] rotate-180
[22:36:25] [PASSED] rotate-270
[22:36:25] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[22:36:25] ==================== [PASSED] drm_rect =====================
[22:36:25] ======================== drm_exec  =========================
[22:36:25] [PASSED] sanitycheck
[22:36:25] [PASSED] test_lock
[22:36:25] [PASSED] test_lock_unlock
[22:36:25] [PASSED] test_duplicates
[22:36:25] [PASSED] test_prepare
[22:36:25] [PASSED] test_prepare_array
[22:36:25] [PASSED] test_multiple_loops
[22:36:25] ==================== [PASSED] drm_exec =====================
[22:36:25] ============================================================
[22:36:25] Testing complete. Ran 368 tests: passed: 368
[22:36:25] Elapsed time: 44.295s total, 1.674s configuring, 19.140s building, 23.474s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


