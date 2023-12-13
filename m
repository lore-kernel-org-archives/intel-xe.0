Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE21C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 21:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005E010E861;
	Wed, 13 Dec 2023 21:49:35 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 75DD910E861;
 Wed, 13 Dec 2023 21:49:33 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 71814A0169;
 Wed, 13 Dec 2023 21:49:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Add_support_for_XeLink_device_?=
 =?utf-8?q?=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David Kershner" <david.kershner@intel.com>
Date: Wed, 13 Dec 2023 21:49:33 -0000
Message-ID: <170250417345.10260.2676875108493059186@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231213214525.2584729-1-david.kershner@intel.com>
In-Reply-To: <20231213214525.2584729-1-david.kershner@intel.com>
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

Series: Add support for XeLink device (rev5)
URL   : https://patchwork.freedesktop.org/series/122168/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[21:48:21] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:48:26] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[21:48:46] Starting KUnit Kernel (1/1)...
[21:48:46] ============================================================
[21:48:46] ========================== lmtt  ===========================
[21:48:46] ======================== test_ops  =========================
[21:48:46] [PASSED] 2-level
[21:48:46] [PASSED] multi-level
[21:48:46] ==================== [PASSED] test_ops =====================
[21:48:46] ====================== [PASSED] lmtt =======================
[21:48:46] ========================== xe_bo  ==========================
[21:48:46] [SKIPPED] xe_ccs_migrate_kunit
[21:48:46] [SKIPPED] xe_bo_evict_kunit
[21:48:46] ===================== [SKIPPED] xe_bo ======================
[21:48:46] ======================= xe_dma_buf  ========================
[21:48:46] [SKIPPED] xe_dma_buf_kunit
[21:48:46] =================== [SKIPPED] xe_dma_buf ===================
[21:48:46] ======================= xe_migrate  ========================
[21:48:46] [SKIPPED] xe_migrate_sanity_kunit
[21:48:46] =================== [SKIPPED] xe_migrate ===================
[21:48:46] ========================= xe_mocs  =========================
[21:48:46] [SKIPPED] xe_live_mocs_kernel_kunit
[21:48:46] ==================== [SKIPPED] xe_mocs =====================
[21:48:46] ========================= xe_pci  ==========================
[21:48:46] [PASSED] xe_gmdid_graphics_ip
[21:48:46] [PASSED] xe_gmdid_media_ip
[21:48:46] ===================== [PASSED] xe_pci ======================
[21:48:46] ========================= xe_rtp  ==========================
[21:48:46] ================== xe_rtp_process_tests  ===================
[21:48:46] [PASSED] coalesce-same-reg
[21:48:46] [PASSED] no-match-no-add
[21:48:46] [PASSED] no-match-no-add-multiple-rules
[21:48:46] [PASSED] two-regs-two-entries
[21:48:46] [PASSED] clr-one-set-other
[21:48:46] [PASSED] set-field
[21:48:46] [PASSED] conflict-duplicate
[21:48:46] [PASSED] conflict-not-disjoint
[21:48:46] [PASSED] conflict-reg-type
[21:48:46] ============== [PASSED] xe_rtp_process_tests ===============
[21:48:46] ===================== [PASSED] xe_rtp ======================
[21:48:46] ========================== xe_wa  ==========================
[21:48:46] ======================== xe_wa_gt  =========================
[21:48:46] [PASSED] TIGERLAKE (B0)
[21:48:46] [PASSED] DG1 (A0)
[21:48:46] [PASSED] DG1 (B0)
[21:48:46] [PASSED] ALDERLAKE_S (A0)
[21:48:46] [PASSED] ALDERLAKE_S (B0)
[21:48:46] [PASSED] ALDERLAKE_S (C0)
[21:48:46] [PASSED] ALDERLAKE_S (D0)
[21:48:46] [PASSED] ALDERLAKE_P (A0)
[21:48:46] [PASSED] ALDERLAKE_P (B0)
[21:48:46] [PASSED] ALDERLAKE_P (C0)
[21:48:46] [PASSED] ALDERLAKE_S_RPLS (D0)
[21:48:46] [PASSED] ALDERLAKE_P_RPLU (E0)
[21:48:46] [PASSED] DG2_G10 (A0)
[21:48:46] [PASSED] DG2_G10 (A1)
[21:48:46] [PASSED] DG2_G10 (B0)
[21:48:46] [PASSED] DG2_G10 (C0)
[21:48:46] [PASSED] DG2_G11 (A0)
[21:48:46] [PASSED] DG2_G11 (B0)
[21:48:46] [PASSED] DG2_G11 (B1)
[21:48:46] [PASSED] DG2_G12 (A0)
[21:48:46] [PASSED] DG2_G12 (A1)
[21:48:46] [PASSED] PVC (B0)
[21:48:46] [PASSED] PVC (B1)
[21:48:46] [PASSED] PVC (C0)
[21:48:46] [PASSED] METEORLAKE (g:A0, m:A0)
[21:48:46] [PASSED] METEORLAKE (g:A0, m:A0)
[21:48:46] [PASSED] LUNARLAKE (g:A0, m:A0)
[21:48:46] [PASSED] LUNARLAKE (g:B0, m:A0)
[21:48:46] ==================== [PASSED] xe_wa_gt =====================
[21:48:46] ====================== [PASSED] xe_wa ======================
[21:48:46] ============================================================
[21:48:46] Testing complete. Ran 46 tests: passed: 41, skipped: 5
[21:48:46] Elapsed time: 24.720s total, 4.166s configuring, 20.384s building, 0.140s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[21:48:46] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:48:48] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[21:49:07] Starting KUnit Kernel (1/1)...
[21:49:07] ============================================================
[21:49:07] ================== drm_test_pick_cmdline  ==================
[21:49:07] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[21:49:07] =============== drm_test_pick_cmdline_named  ===============
[21:49:07] [PASSED] NTSC
[21:49:07] [PASSED] NTSC-J
[21:49:07] [PASSED] PAL
[21:49:07] [PASSED] PAL-M
[21:49:07] =========== [PASSED] drm_test_pick_cmdline_named ===========
[21:49:07] ============== [PASSED] drm_test_pick_cmdline ==============
[21:49:07] ======================== drm_buddy  ========================
[21:49:07] [PASSED] drm_test_buddy_alloc_limit
[21:49:07] [PASSED] drm_test_buddy_alloc_range
[21:49:07] [PASSED] drm_test_buddy_alloc_optimistic
[21:49:07] [PASSED] drm_test_buddy_alloc_pessimistic
[21:49:07] [PASSED] drm_test_buddy_alloc_smoke
[21:49:07] [PASSED] drm_test_buddy_alloc_pathological
[21:49:07] ==================== [PASSED] drm_buddy ====================
[21:49:07] =================== drm_cmdline_parser  ====================
[21:49:07] [PASSED] drm_test_cmdline_force_d_only
[21:49:07] [PASSED] drm_test_cmdline_force_D_only_dvi
[21:49:07] [PASSED] drm_test_cmdline_force_D_only_hdmi
[21:49:07] [PASSED] drm_test_cmdline_force_D_only_not_digital
[21:49:07] [PASSED] drm_test_cmdline_force_e_only
[21:49:07] [PASSED] drm_test_cmdline_res
[21:49:07] [PASSED] drm_test_cmdline_res_vesa
[21:49:07] [PASSED] drm_test_cmdline_res_vesa_rblank
[21:49:07] [PASSED] drm_test_cmdline_res_rblank
[21:49:07] [PASSED] drm_test_cmdline_res_bpp
[21:49:07] [PASSED] drm_test_cmdline_res_refresh
[21:49:07] [PASSED] drm_test_cmdline_res_bpp_refresh
[21:49:07] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[21:49:07] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[21:49:07] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[21:49:07] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[21:49:07] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[21:49:07] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[21:49:07] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[21:49:07] [PASSED] drm_test_cmdline_res_margins_force_on
[21:49:07] [PASSED] drm_test_cmdline_res_vesa_margins
[21:49:07] [PASSED] drm_test_cmdline_name
[21:49:07] [PASSED] drm_test_cmdline_name_bpp
[21:49:07] [PASSED] drm_test_cmdline_name_option
[21:49:07] [PASSED] drm_test_cmdline_name_bpp_option
[21:49:07] [PASSED] drm_test_cmdline_rotate_0
[21:49:07] [PASSED] drm_test_cmdline_rotate_90
[21:49:07] [PASSED] drm_test_cmdline_rotate_180
[21:49:07] [PASSED] drm_test_cmdline_rotate_270
[21:49:07] [PASSED] drm_test_cmdline_hmirror
[21:49:07] [PASSED] drm_test_cmdline_vmirror
[21:49:07] [PASSED] drm_test_cmdline_margin_options
[21:49:07] [PASSED] drm_test_cmdline_multiple_options
[21:49:07] [PASSED] drm_test_cmdline_bpp_extra_and_option
[21:49:07] [PASSED] drm_test_cmdline_extra_and_option
[21:49:07] [PASSED] drm_test_cmdline_freestanding_options
[21:49:07] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[21:49:07] [PASSED] drm_test_cmdline_panel_orientation
[21:49:07] ================ drm_test_cmdline_invalid  =================
[21:49:07] [PASSED] margin_only
[21:49:07] [PASSED] interlace_only
[21:49:07] [PASSED] res_missing_x
[21:49:07] [PASSED] res_missing_y
[21:49:07] [PASSED] res_bad_y
[21:49:07] [PASSED] res_missing_y_bpp
[21:49:07] [PASSED] res_bad_bpp
[21:49:07] [PASSED] res_bad_refresh
[21:49:07] [PASSED] res_bpp_refresh_force_on_off
[21:49:07] [PASSED] res_invalid_mode
[21:49:07] [PASSED] res_bpp_wrong_place_mode
[21:49:07] [PASSED] name_bpp_refresh
[21:49:07] [PASSED] name_refresh
[21:49:07] [PASSED] name_refresh_wrong_mode
[21:49:07] [PASSED] name_refresh_invalid_mode
[21:49:07] [PASSED] rotate_multiple
[21:49:07] [PASSED] rotate_invalid_val
[21:49:07] [PASSED] rotate_truncated
[21:49:07] [PASSED] invalid_option
[21:49:07] [PASSED] invalid_tv_option
[21:49:07] [PASSED] truncated_tv_option
[21:49:07] ============ [PASSED] drm_test_cmdline_invalid =============
[21:49:07] =============== drm_test_cmdline_tv_options  ===============
[21:49:07] [PASSED] NTSC
[21:49:07] [PASSED] NTSC_443
[21:49:07] [PASSED] NTSC_J
[21:49:07] [PASSED] PAL
[21:49:07] [PASSED] PAL_M
[21:49:07] [PASSED] PAL_N
[21:49:07] [PASSED] SECAM
[21:49:07] =========== [PASSED] drm_test_cmdline_tv_options ===========
[21:49:07] =============== [PASSED] drm_cmdline_parser ================
[21:49:07] ================ drm_get_tv_mode_from_name  ================
[21:49:07] ========== drm_test_get_tv_mode_from_name_valid  ===========
[21:49:07] [PASSED] NTSC
[21:49:07] [PASSED] NTSC-443
[21:49:07] [PASSED] NTSC-J
[21:49:07] [PASSED] PAL
[21:49:07] [PASSED] PAL-M
[21:49:07] [PASSED] PAL-N
[21:49:07] [PASSED] SECAM
[21:49:07] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[21:49:07] [PASSED] drm_test_get_tv_mode_from_name_truncated
[21:49:07] ============ [PASSED] drm_get_tv_mode_from_name ============
[21:49:07] ==================== drm_damage_helper  ====================
[21:49:07] [PASSED] drm_test_damage_iter_no_damage
[21:49:07] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[21:49:07] [PASSED] drm_test_damage_iter_no_damage_src_moved
[21:49:07] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[21:49:07] [PASSED] drm_test_damage_iter_no_damage_not_visible
[21:49:07] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[21:49:07] [PASSED] drm_test_damage_iter_no_damage_no_fb
[21:49:07] [PASSED] drm_test_damage_iter_simple_damage
[21:49:07] [PASSED] drm_test_damage_iter_single_damage
[21:49:07] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[21:49:07] [PASSED] drm_test_damage_iter_single_damage_outside_src
[21:49:07] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[21:49:07] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[21:49:07] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[21:49:07] [PASSED] drm_test_damage_iter_single_damage_src_moved
[21:49:07] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[21:49:07] [PASSED] drm_test_damage_iter_damage
[21:49:07] [PASSED] drm_test_damage_iter_damage_one_intersect
[21:49:07] [PASSED] drm_test_damage_iter_damage_one_outside
[21:49:07] [PASSED] drm_test_damage_iter_damage_src_moved
[21:49:07] [PASSED] drm_test_damage_iter_damage_not_visible
[21:49:07] ================ [PASSED] drm_damage_helper ================
[21:49:07] ==================== drm_dp_mst_helper  ====================
[21:49:07] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[21:49:07] [PASSED] Clock 154000 BPP 30 DSC disabled
[21:49:07] [PASSED] Clock 234000 BPP 30 DSC disabled
[21:49:07] [PASSED] Clock 297000 BPP 24 DSC disabled
[21:49:07] [PASSED] Clock 332880 BPP 24 DSC enabled
[21:49:07] [PASSED] Clock 324540 BPP 24 DSC enabled
[21:49:07] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[21:49:07] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[21:49:07] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[21:49:07] [PASSED] DP_POWER_UP_PHY with port number
[21:49:07] [PASSED] DP_POWER_DOWN_PHY with port number
[21:49:07] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[21:49:07] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[21:49:07] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[21:49:07] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[21:49:07] [PASSED] DP_QUERY_PAYLOAD with port number
[21:49:07] [PASSED] DP_QUERY_PAYLOAD with VCPI
[21:49:07] [PASSED] DP_REMOTE_DPCD_READ with port number
[21:49:07] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[21:49:07] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[21:49:07] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[21:49:07] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[21:49:07] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[21:49:07] [PASSED] DP_REMOTE_I2C_READ with port number
[21:49:07] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[21:49:07] [PASSED] DP_REMOTE_I2C_READ with transactions array
[21:49:07] [PASSED] DP_REMOTE_I2C_WRITE with port number
[21:49:07] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[21:49:07] [PASSED] DP_REMOTE_I2C_WRITE with data array
[21:49:07] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[21:49:07] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[21:49:07] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[21:49:07] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[21:49:07] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[21:49:07] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[21:49:07] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[21:49:07] ================ [PASSED] drm_dp_mst_helper ================
[21:49:07] ================= drm_format_helper_test  ==================
[21:49:07] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[21:49:07] [PASSED] single_pixel_source_buffer
[21:49:07] [PASSED] single_pixel_clip_rectangle
[21:49:07] [PASSED] well_known_colors
[21:49:07] [PASSED] destination_pitch
[21:49:07] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[21:49:07] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[21:49:07] [PASSED] single_pixel_source_buffer
[21:49:07] [PASSED] single_pixel_clip_rectangle
[21:49:07] [PASSED] well_known_colors
[21:49:07] [PASSED] destination_pitch
[21:49:07] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[21:49:07] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[21:49:07] [PASSED] single_pixel_source_buffer
[21:49:07] [PASSED] single_pixel_clip_rectangle
[21:49:07] [PASSED] well_known_colors
[21:49:07] [PASSED] destination_pitch
[21:49:07] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[21:49:07] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[21:49:07] [PASSED] single_pixel_source_buffer
[21:49:07] [PASSED] single_pixel_clip_rectangle
[21:49:07] [PASSED] well_known_colors
[21:49:07] [PASSED] destination_pitch
[21:49:07] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[21:49:07] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[21:49:07] [PASSED] single_pixel_source_buffer
[21:49:07] [PASSED] single_pixel_clip_rectangle
[21:49:07] [PASSED] well_known_colors
[21:49:07] [PASSED] destination_pitch
[21:49:07] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[21:49:07] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[21:49:07] [PASSED] single_pixel_source_buffer
[21:49:07] [PASSED] single_pixel_clip_rectangle
[21:49:07] [PASSED] well_known_colors
[21:49:07] [PASSED] destination_pitch
[21:49:07] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[21:49:07] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[21:49:07] [PASSED] single_pixel_source_buffer
[21:49:07] [PASSED] single_pixel_clip_rectangle
[21:49:07] [PASSED] well_known_colors
[21:49:07] [PASSED] destination_pitch
[21:49:07] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[21:49:07] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[21:49:07] [PASSED] single_pixel_source_buffer
[21:49:07] [PASSED] single_pixel_clip_rectangle
[21:49:07] [PASSED] well_known_colors
[21:49:07] [PASSED] destination_pitch
[21:49:07] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[21:49:07] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[21:49:07] [PASSED] single_pixel_source_buffer
[21:49:07] [PASSED] single_pixel_clip_rectangle
[21:49:07] [PASSED] well_known_colors
[21:49:07] [PASSED] destination_pitch
[21:49:07] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[21:49:07] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[21:49:07] [PASSED] single_pixel_source_buffer
[21:49:07] [PASSED] single_pixel_clip_rectangle
[21:49:07] [PASSED] well_known_colors
[21:49:07] [PASSED] destination_pitch
[21:49:07] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[21:49:07] ============== drm_test_fb_xrgb8888_to_mono  ===============
[21:49:07] [PASSED] single_pixel_source_buffer
[21:49:07] [PASSED] single_pixel_clip_rectangle
[21:49:07] [PASSED] well_known_colors
[21:49:07] [PASSED] destination_pitch
[21:49:07] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[21:49:07] ==================== drm_test_fb_swab  =====================
[21:49:07] [PASSED] single_pixel_source_buffer
[21:49:07] [PASSED] single_pixel_clip_rectangle
[21:49:07] [PASSED] well_known_colors
[21:49:07] [PASSED] destination_pitch
[21:49:07] ================ [PASSED] drm_test_fb_swab =================
[21:49:07] ================= drm_test_fb_clip_offset  =================
[21:49:07] [PASSED] pass through
[21:49:07] [PASSED] horizontal offset
[21:49:07] [PASSED] vertical offset
[21:49:07] [PASSED] horizontal and vertical offset
[21:49:07] [PASSED] horizontal offset (custom pitch)
[21:49:07] [PASSED] vertical offset (custom pitch)
[21:49:07] [PASSED] horizontal and vertical offset (custom pitch)
[21:49:07] ============= [PASSED] drm_test_fb_clip_offset =============
[21:49:07] ============== drm_test_fb_build_fourcc_list  ==============
[21:49:07] [PASSED] no native formats
[21:49:07] [PASSED] XRGB8888 as native format
[21:49:07] [PASSED] remove duplicates
[21:49:07] [PASSED] convert alpha formats
[21:49:07] [PASSED] random formats
[21:49:07] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[21:49:07] =================== drm_test_fb_memcpy  ====================
[21:49:07] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[21:49:07] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[21:49:07] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[21:49:07] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[21:49:07] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[21:49:07] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[21:49:07] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[21:49:07] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[21:49:07] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[21:49:07] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[21:49:07] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[21:49:07] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[21:49:07] =============== [PASSED] drm_test_fb_memcpy ================
[21:49:07] ============= [PASSED] drm_format_helper_test ==============
[21:49:07] ======================= drm_format  ========================
[21:49:07] [PASSED] drm_test_format_block_width_invalid
[21:49:07] [PASSED] drm_test_format_block_width_one_plane
[21:49:07] [PASSED] drm_test_format_block_width_two_plane
[21:49:07] [PASSED] drm_test_format_block_width_three_plane
[21:49:07] [PASSED] drm_test_format_block_width_tiled
[21:49:07] [PASSED] drm_test_format_block_height_invalid
[21:49:07] [PASSED] drm_test_format_block_height_one_plane
[21:49:07] [PASSED] drm_test_format_block_height_two_plane
[21:49:07] [PASSED] drm_test_format_block_height_three_plane
[21:49:07] [PASSED] drm_test_format_block_height_tiled
[21:49:07] [PASSED] drm_test_format_min_pitch_invalid
[21:49:07] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[21:49:07] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[21:49:07] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[21:49:07] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[21:49:07] [PASSED] drm_test_format_min_pitch_two_plane
[21:49:07] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[21:49:07] [PASSED] drm_test_format_min_pitch_tiled
[21:49:07] =================== [PASSED] drm_format ====================
[21:49:07] ===================== drm_framebuffer  =====================
[21:49:07] =============== drm_test_framebuffer_create  ===============
[21:49:07] [PASSED] ABGR8888 normal sizes
[21:49:07] [PASSED] ABGR8888 max sizes
[21:49:07] [PASSED] ABGR8888 pitch greater than min required
[21:49:07] [PASSED] ABGR8888 pitch less than min required
[21:49:07] [PASSED] ABGR8888 Invalid width
[21:49:07] [PASSED] ABGR8888 Invalid buffer handle
[21:49:07] [PASSED] No pixel format
[21:49:07] [PASSED] ABGR8888 Width 0
[21:49:07] [PASSED] ABGR8888 Height 0
[21:49:07] [PASSED] ABGR8888 Out of bound height * pitch combination
[21:49:07] [PASSED] ABGR8888 Large buffer offset
[21:49:07] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[21:49:07] [PASSED] ABGR8888 Valid buffer modifier
[21:49:07] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[21:49:07] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[21:49:07] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[21:49:07] [PASSED] NV12 Normal sizes
[21:49:07] [PASSED] NV12 Max sizes
[21:49:07] [PASSED] NV12 Invalid pitch
[21:49:07] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[21:49:07] [PASSED] NV12 different  modifier per-plane
[21:49:07] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[21:49:07] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[21:49:07] [PASSED] NV12 Modifier for inexistent plane
[21:49:07] [PASSED] NV12 Handle for inexistent plane
[21:49:07] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[21:49:07] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[21:49:07] [PASSED] YVU420 Normal sizes
[21:49:07] [PASSED] YVU420 Max sizes
[21:49:07] [PASSED] YVU420 Invalid pitch
[21:49:07] [PASSED] YVU420 Different pitches
[21:49:07] [PASSED] YVU420 Different buffer offsets/pitches
[21:49:07] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[21:49:07] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[21:49:07] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[21:49:07] [PASSED] YVU420 Valid modifier
[21:49:07] [PASSED] YVU420 Different modifiers per plane
[21:49:07] [PASSED] YVU420 Modifier for inexistent plane
[21:49:07] [PASSED] X0L2 Normal sizes
[21:49:07] [PASSED] X0L2 Max sizes
[21:49:07] [PASSED] X0L2 Invalid pitch
[21:49:07] [PASSED] X0L2 Pitch greater than minimum required
[21:49:07] [PASSED] X0L2 Handle for inexistent plane
[21:49:07] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[21:49:07] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[21:49:07] [PASSED] X0L2 Valid modifier
[21:49:07] [PASSED] X0L2 Modifier for inexistent plane
[21:49:07] =========== [PASSED] drm_test_framebuffer_create ===========
[21:49:07] ================= [PASSED] drm_framebuffer =================
[21:49:07] ==================== drm-test-managed  =====================
[21:49:07] [PASSED] drm_test_managed_run_action
[21:49:07] ================ [PASSED] drm-test-managed =================
[21:49:07] ========================= drm_mm  ==========================
[21:49:07] [PASSED] drm_test_mm_init
[21:49:07] [PASSED] drm_test_mm_debug
[21:49:17] [PASSED] drm_test_mm_reserve
[21:49:28] [PASSED] drm_test_mm_insert
[21:49:28] [PASSED] drm_test_mm_replace
[21:49:28] [PASSED] drm_test_mm_insert_range
[21:49:28] [PASSED] drm_test_mm_frag
[21:49:28] [PASSED] drm_test_mm_align
[21:49:28] [PASSED] drm_test_mm_align32
[21:49:29] [PASSED] drm_test_mm_align64
[21:49:29] [PASSED] drm_test_mm_evict
[21:49:29] [PASSED] drm_test_mm_evict_range
[21:49:29] [PASSED] drm_test_mm_topdown
[21:49:29] [PASSED] drm_test_mm_bottomup
[21:49:29] [PASSED] drm_test_mm_lowest
[21:49:29] [PASSED] drm_test_mm_highest
[21:49:30] [PASSED] drm_test_mm_color
[21:49:30] [PASSED] drm_test_mm_color_evict
[21:49:30] [PASSED] drm_test_mm_color_evict_range
[21:49:30] ===================== [PASSED] drm_mm ======================
[21:49:30] =================== drm_modes_analog_tv  ===================
[21:49:30] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[21:49:30] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[21:49:30] [PASSED] drm_test_modes_analog_tv_pal_576i
[21:49:30] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[21:49:30] =============== [PASSED] drm_modes_analog_tv ===============
[21:49:30] ==================== drm_plane_helper  =====================
[21:49:30] =============== drm_test_check_plane_state  ================
[21:49:30] [PASSED] clipping_simple
[21:49:30] [PASSED] clipping_rotate_reflect
[21:49:30] [PASSED] positioning_simple
[21:49:30] [PASSED] upscaling
[21:49:30] [PASSED] downscaling
[21:49:30] [PASSED] rounding1
[21:49:30] [PASSED] rounding2
[21:49:30] [PASSED] rounding3
[21:49:30] [PASSED] rounding4
[21:49:30] =========== [PASSED] drm_test_check_plane_state ============
[21:49:30] =========== drm_test_check_invalid_plane_state  ============
[21:49:30] [PASSED] positioning_invalid
[21:49:30] [PASSED] upscaling_invalid
[21:49:30] [PASSED] downscaling_invalid
[21:49:30] ======= [PASSED] drm_test_check_invalid_plane_state ========
[21:49:30] ================ [PASSED] drm_plane_helper =================
[21:49:30] ============ drm_connector_helper_tv_get_modes  ============
[21:49:30] ====== drm_test_connector_helper_tv_get_modes_check  =======
[21:49:30] [PASSED] None
[21:49:30] [PASSED] PAL
[21:49:30] [PASSED] NTSC
[21:49:30] [PASSED] Both, NTSC Default
[21:49:30] [PASSED] Both, PAL Default
[21:49:30] [PASSED] Both, NTSC Default, with PAL on command-line
[21:49:30] [PASSED] Both, PAL Default, with NTSC on command-line
[21:49:30] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[21:49:30] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[21:49:30] ======================== drm_rect  =========================
[21:49:30] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[21:49:30] [PASSED] drm_test_rect_clip_scaled_not_clipped
[21:49:30] [PASSED] drm_test_rect_clip_scaled_clipped
[21:49:30] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[21:49:30] ================= drm_test_rect_intersect  =================
[21:49:30] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[21:49:30] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[21:49:30] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[21:49:30] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[21:49:30] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[21:49:30] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[21:49:30] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[21:49:30] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[21:49:30] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[21:49:30] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[21:49:30] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[21:49:30] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[21:49:30] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[21:49:30] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[21:49:30] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[21:49:30] ============= [PASSED] drm_test_rect_intersect =============
[21:49:30] ================ drm_test_rect_calc_hscale  ================
[21:49:30] [PASSED] normal use
[21:49:30] [PASSED] out of max range
[21:49:30] [PASSED] out of min range
[21:49:30] [PASSED] zero dst
[21:49:30] [PASSED] negative src
[21:49:30] [PASSED] negative dst
[21:49:30] ============ [PASSED] drm_test_rect_calc_hscale ============
[21:49:30] ================ drm_test_rect_calc_vscale  ================
[21:49:30] [PASSED] normal use
[21:49:30] [PASSED] out of max range
[21:49:30] [PASSED] out of min range
[21:49:30] [PASSED] zero dst
[21:49:30] [PASSED] negative src
[21:49:30] [PASSED] negative dst
[21:49:30] ============ [PASSED] drm_test_rect_calc_vscale ============
[21:49:30] ================== drm_test_rect_rotate  ===================
[21:49:30] [PASSED] reflect-x
[21:49:30] [PASSED] reflect-y
[21:49:30] [PASSED] rotate-0
[21:49:30] [PASSED] rotate-90
[21:49:30] [PASSED] rotate-180
[21:49:30] [PASSED] rotate-270
[21:49:30] ============== [PASSED] drm_test_rect_rotate ===============
[21:49:30] ================ drm_test_rect_rotate_inv  =================
[21:49:30] [PASSED] reflect-x
[21:49:30] [PASSED] reflect-y
[21:49:30] [PASSED] rotate-0
[21:49:30] [PASSED] rotate-90
[21:49:30] [PASSED] rotate-180
[21:49:30] [PASSED] rotate-270
[21:49:30] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[21:49:30] ==================== [PASSED] drm_rect =====================
[21:49:30] ======================== drm_exec  =========================
[21:49:30] [PASSED] sanitycheck
[21:49:30] [PASSED] test_lock
[21:49:30] [PASSED] test_lock_unlock
[21:49:30] [PASSED] test_duplicates
[21:49:30] [PASSED] test_prepare
[21:49:30] [PASSED] test_prepare_array
[21:49:30] [PASSED] test_multiple_loops
[21:49:30] ==================== [PASSED] drm_exec =====================
[21:49:30] ============================================================
[21:49:30] Testing complete. Ran 368 tests: passed: 368
[21:49:31] Elapsed time: 44.245s total, 1.686s configuring, 19.127s building, 23.427s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


