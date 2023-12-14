Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81655C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 23:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F8910E2FC;
	Thu, 14 Dec 2023 23:01:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 52D6510E2FC;
 Thu, 14 Dec 2023 23:01:31 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 40C46AADE4;
 Thu, 14 Dec 2023 23:01:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_series_starting_with_=5B1/3=5D?=
 =?utf-8?q?_drm/xe=3A_Return_error_if_drm=5Fbuddy=5Finit=28=29_fails?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Thu, 14 Dec 2023 23:01:31 -0000
Message-ID: <170259489125.19958.9567189038835873193@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231214213954.3223263-1-lucas.demarchi@intel.com>
In-Reply-To: <20231214213954.3223263-1-lucas.demarchi@intel.com>
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

Series: series starting with [1/3] drm/xe: Return error if drm_buddy_init() fails
URL   : https://patchwork.freedesktop.org/series/127845/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[23:00:19] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:00:23] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[23:00:44] Starting KUnit Kernel (1/1)...
[23:00:44] ============================================================
[23:00:44] ========================== lmtt  ===========================
[23:00:44] ======================== test_ops  =========================
[23:00:44] [PASSED] 2-level
[23:00:44] [PASSED] multi-level
[23:00:44] ==================== [PASSED] test_ops =====================
[23:00:44] ====================== [PASSED] lmtt =======================
[23:00:44] ========================== xe_bo  ==========================
[23:00:44] [SKIPPED] xe_ccs_migrate_kunit
[23:00:44] [SKIPPED] xe_bo_evict_kunit
[23:00:44] ===================== [SKIPPED] xe_bo ======================
[23:00:44] ======================= xe_dma_buf  ========================
[23:00:44] [SKIPPED] xe_dma_buf_kunit
[23:00:44] =================== [SKIPPED] xe_dma_buf ===================
[23:00:44] ======================= xe_migrate  ========================
[23:00:44] [SKIPPED] xe_migrate_sanity_kunit
[23:00:44] =================== [SKIPPED] xe_migrate ===================
[23:00:44] ========================= xe_mocs  =========================
[23:00:44] [SKIPPED] xe_live_mocs_kernel_kunit
[23:00:44] ==================== [SKIPPED] xe_mocs =====================
[23:00:44] ========================= xe_pci  ==========================
[23:00:44] [PASSED] xe_gmdid_graphics_ip
[23:00:44] [PASSED] xe_gmdid_media_ip
[23:00:44] ===================== [PASSED] xe_pci ======================
[23:00:44] ========================= xe_rtp  ==========================
[23:00:44] ================== xe_rtp_process_tests  ===================
[23:00:44] [PASSED] coalesce-same-reg
[23:00:44] [PASSED] no-match-no-add
[23:00:44] [PASSED] no-match-no-add-multiple-rules
[23:00:44] [PASSED] two-regs-two-entries
[23:00:44] [PASSED] clr-one-set-other
[23:00:44] [PASSED] set-field
[23:00:44] [PASSED] conflict-duplicate
[23:00:44] [PASSED] conflict-not-disjoint
[23:00:44] [PASSED] conflict-reg-type
[23:00:44] ============== [PASSED] xe_rtp_process_tests ===============
[23:00:44] ===================== [PASSED] xe_rtp ======================
[23:00:44] ========================== xe_wa  ==========================
[23:00:44] ======================== xe_wa_gt  =========================
[23:00:44] [PASSED] TIGERLAKE (B0)
[23:00:44] [PASSED] DG1 (A0)
[23:00:44] [PASSED] DG1 (B0)
[23:00:44] [PASSED] ALDERLAKE_S (A0)
[23:00:44] [PASSED] ALDERLAKE_S (B0)
[23:00:44] [PASSED] ALDERLAKE_S (C0)
[23:00:44] [PASSED] ALDERLAKE_S (D0)
[23:00:44] [PASSED] ALDERLAKE_P (A0)
[23:00:44] [PASSED] ALDERLAKE_P (B0)
[23:00:44] [PASSED] ALDERLAKE_P (C0)
[23:00:44] [PASSED] ALDERLAKE_S_RPLS (D0)
[23:00:44] [PASSED] ALDERLAKE_P_RPLU (E0)
[23:00:44] [PASSED] DG2_G10 (A0)
[23:00:44] [PASSED] DG2_G10 (A1)
[23:00:44] [PASSED] DG2_G10 (B0)
[23:00:44] [PASSED] DG2_G10 (C0)
[23:00:44] [PASSED] DG2_G11 (A0)
[23:00:44] [PASSED] DG2_G11 (B0)
[23:00:44] [PASSED] DG2_G11 (B1)
[23:00:44] [PASSED] DG2_G12 (A0)
[23:00:44] [PASSED] DG2_G12 (A1)
[23:00:44] [PASSED] PVC (B0)
[23:00:44] [PASSED] PVC (B1)
[23:00:44] [PASSED] PVC (C0)
[23:00:44] [PASSED] METEORLAKE (g:A0, m:A0)
[23:00:44] [PASSED] METEORLAKE (g:A0, m:A0)
[23:00:44] [PASSED] LUNARLAKE (g:A0, m:A0)
[23:00:44] [PASSED] LUNARLAKE (g:B0, m:A0)
[23:00:44] ==================== [PASSED] xe_wa_gt =====================
[23:00:44] ====================== [PASSED] xe_wa ======================
[23:00:44] ============================================================
[23:00:44] Testing complete. Ran 46 tests: passed: 41, skipped: 5
[23:00:44] Elapsed time: 24.940s total, 4.223s configuring, 20.548s building, 0.151s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[23:00:44] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:00:46] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[23:01:05] Starting KUnit Kernel (1/1)...
[23:01:05] ============================================================
[23:01:05] ================== drm_test_pick_cmdline  ==================
[23:01:05] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[23:01:05] =============== drm_test_pick_cmdline_named  ===============
[23:01:05] [PASSED] NTSC
[23:01:05] [PASSED] NTSC-J
[23:01:05] [PASSED] PAL
[23:01:05] [PASSED] PAL-M
[23:01:05] =========== [PASSED] drm_test_pick_cmdline_named ===========
[23:01:05] ============== [PASSED] drm_test_pick_cmdline ==============
[23:01:05] ======================== drm_buddy  ========================
[23:01:05] [PASSED] drm_test_buddy_alloc_limit
[23:01:05] [PASSED] drm_test_buddy_alloc_range
[23:01:05] [PASSED] drm_test_buddy_alloc_optimistic
[23:01:05] [PASSED] drm_test_buddy_alloc_pessimistic
[23:01:05] [PASSED] drm_test_buddy_alloc_smoke
[23:01:05] [PASSED] drm_test_buddy_alloc_pathological
[23:01:05] ==================== [PASSED] drm_buddy ====================
[23:01:05] =================== drm_cmdline_parser  ====================
[23:01:05] [PASSED] drm_test_cmdline_force_d_only
[23:01:05] [PASSED] drm_test_cmdline_force_D_only_dvi
[23:01:05] [PASSED] drm_test_cmdline_force_D_only_hdmi
[23:01:05] [PASSED] drm_test_cmdline_force_D_only_not_digital
[23:01:05] [PASSED] drm_test_cmdline_force_e_only
[23:01:05] [PASSED] drm_test_cmdline_res
[23:01:05] [PASSED] drm_test_cmdline_res_vesa
[23:01:05] [PASSED] drm_test_cmdline_res_vesa_rblank
[23:01:05] [PASSED] drm_test_cmdline_res_rblank
[23:01:05] [PASSED] drm_test_cmdline_res_bpp
[23:01:05] [PASSED] drm_test_cmdline_res_refresh
[23:01:05] [PASSED] drm_test_cmdline_res_bpp_refresh
[23:01:05] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[23:01:05] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[23:01:05] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[23:01:05] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[23:01:05] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[23:01:05] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[23:01:05] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[23:01:05] [PASSED] drm_test_cmdline_res_margins_force_on
[23:01:05] [PASSED] drm_test_cmdline_res_vesa_margins
[23:01:05] [PASSED] drm_test_cmdline_name
[23:01:05] [PASSED] drm_test_cmdline_name_bpp
[23:01:05] [PASSED] drm_test_cmdline_name_option
[23:01:05] [PASSED] drm_test_cmdline_name_bpp_option
[23:01:05] [PASSED] drm_test_cmdline_rotate_0
[23:01:05] [PASSED] drm_test_cmdline_rotate_90
[23:01:05] [PASSED] drm_test_cmdline_rotate_180
[23:01:05] [PASSED] drm_test_cmdline_rotate_270
[23:01:05] [PASSED] drm_test_cmdline_hmirror
[23:01:05] [PASSED] drm_test_cmdline_vmirror
[23:01:05] [PASSED] drm_test_cmdline_margin_options
[23:01:05] [PASSED] drm_test_cmdline_multiple_options
[23:01:05] [PASSED] drm_test_cmdline_bpp_extra_and_option
[23:01:05] [PASSED] drm_test_cmdline_extra_and_option
[23:01:05] [PASSED] drm_test_cmdline_freestanding_options
[23:01:05] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[23:01:05] [PASSED] drm_test_cmdline_panel_orientation
[23:01:05] ================ drm_test_cmdline_invalid  =================
[23:01:05] [PASSED] margin_only
[23:01:05] [PASSED] interlace_only
[23:01:05] [PASSED] res_missing_x
[23:01:05] [PASSED] res_missing_y
[23:01:05] [PASSED] res_bad_y
[23:01:05] [PASSED] res_missing_y_bpp
[23:01:05] [PASSED] res_bad_bpp
[23:01:05] [PASSED] res_bad_refresh
[23:01:05] [PASSED] res_bpp_refresh_force_on_off
[23:01:05] [PASSED] res_invalid_mode
[23:01:05] [PASSED] res_bpp_wrong_place_mode
[23:01:05] [PASSED] name_bpp_refresh
[23:01:05] [PASSED] name_refresh
[23:01:05] [PASSED] name_refresh_wrong_mode
[23:01:05] [PASSED] name_refresh_invalid_mode
[23:01:05] [PASSED] rotate_multiple
[23:01:05] [PASSED] rotate_invalid_val
[23:01:05] [PASSED] rotate_truncated
[23:01:05] [PASSED] invalid_option
[23:01:05] [PASSED] invalid_tv_option
[23:01:05] [PASSED] truncated_tv_option
[23:01:05] ============ [PASSED] drm_test_cmdline_invalid =============
[23:01:05] =============== drm_test_cmdline_tv_options  ===============
[23:01:05] [PASSED] NTSC
[23:01:05] [PASSED] NTSC_443
[23:01:05] [PASSED] NTSC_J
[23:01:05] [PASSED] PAL
[23:01:05] [PASSED] PAL_M
[23:01:05] [PASSED] PAL_N
[23:01:05] [PASSED] SECAM
[23:01:05] =========== [PASSED] drm_test_cmdline_tv_options ===========
[23:01:05] =============== [PASSED] drm_cmdline_parser ================
[23:01:05] ================ drm_get_tv_mode_from_name  ================
[23:01:05] ========== drm_test_get_tv_mode_from_name_valid  ===========
[23:01:05] [PASSED] NTSC
[23:01:05] [PASSED] NTSC-443
[23:01:05] [PASSED] NTSC-J
[23:01:05] [PASSED] PAL
[23:01:05] [PASSED] PAL-M
[23:01:05] [PASSED] PAL-N
[23:01:05] [PASSED] SECAM
[23:01:05] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[23:01:05] [PASSED] drm_test_get_tv_mode_from_name_truncated
[23:01:05] ============ [PASSED] drm_get_tv_mode_from_name ============
[23:01:05] ==================== drm_damage_helper  ====================
[23:01:05] [PASSED] drm_test_damage_iter_no_damage
[23:01:05] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[23:01:05] [PASSED] drm_test_damage_iter_no_damage_src_moved
[23:01:05] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[23:01:05] [PASSED] drm_test_damage_iter_no_damage_not_visible
[23:01:05] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[23:01:05] [PASSED] drm_test_damage_iter_no_damage_no_fb
[23:01:05] [PASSED] drm_test_damage_iter_simple_damage
[23:01:05] [PASSED] drm_test_damage_iter_single_damage
[23:01:05] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[23:01:05] [PASSED] drm_test_damage_iter_single_damage_outside_src
[23:01:05] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[23:01:05] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[23:01:05] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[23:01:05] [PASSED] drm_test_damage_iter_single_damage_src_moved
[23:01:05] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[23:01:05] [PASSED] drm_test_damage_iter_damage
[23:01:05] [PASSED] drm_test_damage_iter_damage_one_intersect
[23:01:05] [PASSED] drm_test_damage_iter_damage_one_outside
[23:01:05] [PASSED] drm_test_damage_iter_damage_src_moved
[23:01:05] [PASSED] drm_test_damage_iter_damage_not_visible
[23:01:05] ================ [PASSED] drm_damage_helper ================
[23:01:05] ==================== drm_dp_mst_helper  ====================
[23:01:05] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[23:01:05] [PASSED] Clock 154000 BPP 30 DSC disabled
[23:01:05] [PASSED] Clock 234000 BPP 30 DSC disabled
[23:01:05] [PASSED] Clock 297000 BPP 24 DSC disabled
[23:01:05] [PASSED] Clock 332880 BPP 24 DSC enabled
[23:01:05] [PASSED] Clock 324540 BPP 24 DSC enabled
[23:01:05] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[23:01:05] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[23:01:05] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[23:01:05] [PASSED] DP_POWER_UP_PHY with port number
[23:01:05] [PASSED] DP_POWER_DOWN_PHY with port number
[23:01:05] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[23:01:05] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[23:01:05] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[23:01:05] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[23:01:05] [PASSED] DP_QUERY_PAYLOAD with port number
[23:01:05] [PASSED] DP_QUERY_PAYLOAD with VCPI
[23:01:05] [PASSED] DP_REMOTE_DPCD_READ with port number
[23:01:05] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[23:01:05] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[23:01:05] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[23:01:05] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[23:01:05] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[23:01:05] [PASSED] DP_REMOTE_I2C_READ with port number
[23:01:05] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[23:01:05] [PASSED] DP_REMOTE_I2C_READ with transactions array
[23:01:05] [PASSED] DP_REMOTE_I2C_WRITE with port number
[23:01:05] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[23:01:05] [PASSED] DP_REMOTE_I2C_WRITE with data array
[23:01:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[23:01:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[23:01:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[23:01:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[23:01:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[23:01:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[23:01:05] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[23:01:05] ================ [PASSED] drm_dp_mst_helper ================
[23:01:05] ================= drm_format_helper_test  ==================
[23:01:05] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[23:01:05] [PASSED] single_pixel_source_buffer
[23:01:05] [PASSED] single_pixel_clip_rectangle
[23:01:05] [PASSED] well_known_colors
[23:01:05] [PASSED] destination_pitch
[23:01:05] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[23:01:05] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[23:01:05] [PASSED] single_pixel_source_buffer
[23:01:05] [PASSED] single_pixel_clip_rectangle
[23:01:05] [PASSED] well_known_colors
[23:01:05] [PASSED] destination_pitch
[23:01:05] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[23:01:05] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[23:01:05] [PASSED] single_pixel_source_buffer
[23:01:05] [PASSED] single_pixel_clip_rectangle
[23:01:05] [PASSED] well_known_colors
[23:01:05] [PASSED] destination_pitch
[23:01:05] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[23:01:05] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[23:01:05] [PASSED] single_pixel_source_buffer
[23:01:05] [PASSED] single_pixel_clip_rectangle
[23:01:05] [PASSED] well_known_colors
[23:01:05] [PASSED] destination_pitch
[23:01:05] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[23:01:05] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[23:01:05] [PASSED] single_pixel_source_buffer
[23:01:05] [PASSED] single_pixel_clip_rectangle
[23:01:05] [PASSED] well_known_colors
[23:01:05] [PASSED] destination_pitch
[23:01:05] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[23:01:05] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[23:01:05] [PASSED] single_pixel_source_buffer
[23:01:05] [PASSED] single_pixel_clip_rectangle
[23:01:05] [PASSED] well_known_colors
[23:01:05] [PASSED] destination_pitch
[23:01:05] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[23:01:05] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[23:01:05] [PASSED] single_pixel_source_buffer
[23:01:05] [PASSED] single_pixel_clip_rectangle
[23:01:05] [PASSED] well_known_colors
[23:01:05] [PASSED] destination_pitch
[23:01:05] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[23:01:05] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[23:01:05] [PASSED] single_pixel_source_buffer
[23:01:05] [PASSED] single_pixel_clip_rectangle
[23:01:05] [PASSED] well_known_colors
[23:01:05] [PASSED] destination_pitch
[23:01:05] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[23:01:05] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[23:01:05] [PASSED] single_pixel_source_buffer
[23:01:05] [PASSED] single_pixel_clip_rectangle
[23:01:05] [PASSED] well_known_colors
[23:01:05] [PASSED] destination_pitch
[23:01:05] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[23:01:05] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[23:01:05] [PASSED] single_pixel_source_buffer
[23:01:05] [PASSED] single_pixel_clip_rectangle
[23:01:05] [PASSED] well_known_colors
[23:01:05] [PASSED] destination_pitch
[23:01:05] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[23:01:05] ============== drm_test_fb_xrgb8888_to_mono  ===============
[23:01:05] [PASSED] single_pixel_source_buffer
[23:01:05] [PASSED] single_pixel_clip_rectangle
[23:01:05] [PASSED] well_known_colors
[23:01:05] [PASSED] destination_pitch
[23:01:05] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[23:01:05] ==================== drm_test_fb_swab  =====================
[23:01:05] [PASSED] single_pixel_source_buffer
[23:01:05] [PASSED] single_pixel_clip_rectangle
[23:01:05] [PASSED] well_known_colors
[23:01:05] [PASSED] destination_pitch
[23:01:05] ================ [PASSED] drm_test_fb_swab =================
[23:01:05] ================= drm_test_fb_clip_offset  =================
[23:01:05] [PASSED] pass through
[23:01:05] [PASSED] horizontal offset
[23:01:05] [PASSED] vertical offset
[23:01:05] [PASSED] horizontal and vertical offset
[23:01:05] [PASSED] horizontal offset (custom pitch)
[23:01:05] [PASSED] vertical offset (custom pitch)
[23:01:05] [PASSED] horizontal and vertical offset (custom pitch)
[23:01:05] ============= [PASSED] drm_test_fb_clip_offset =============
[23:01:05] ============== drm_test_fb_build_fourcc_list  ==============
[23:01:05] [PASSED] no native formats
[23:01:05] [PASSED] XRGB8888 as native format
[23:01:05] [PASSED] remove duplicates
[23:01:05] [PASSED] convert alpha formats
[23:01:05] [PASSED] random formats
[23:01:05] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[23:01:05] =================== drm_test_fb_memcpy  ====================
[23:01:05] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[23:01:05] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[23:01:05] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[23:01:05] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[23:01:05] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[23:01:05] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[23:01:05] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[23:01:05] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[23:01:05] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[23:01:05] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[23:01:05] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[23:01:05] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[23:01:05] =============== [PASSED] drm_test_fb_memcpy ================
[23:01:05] ============= [PASSED] drm_format_helper_test ==============
[23:01:05] ======================= drm_format  ========================
[23:01:05] [PASSED] drm_test_format_block_width_invalid
[23:01:05] [PASSED] drm_test_format_block_width_one_plane
[23:01:05] [PASSED] drm_test_format_block_width_two_plane
[23:01:05] [PASSED] drm_test_format_block_width_three_plane
[23:01:05] [PASSED] drm_test_format_block_width_tiled
[23:01:05] [PASSED] drm_test_format_block_height_invalid
[23:01:05] [PASSED] drm_test_format_block_height_one_plane
[23:01:05] [PASSED] drm_test_format_block_height_two_plane
[23:01:05] [PASSED] drm_test_format_block_height_three_plane
[23:01:05] [PASSED] drm_test_format_block_height_tiled
[23:01:05] [PASSED] drm_test_format_min_pitch_invalid
[23:01:05] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[23:01:05] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[23:01:05] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[23:01:05] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[23:01:05] [PASSED] drm_test_format_min_pitch_two_plane
[23:01:05] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[23:01:05] [PASSED] drm_test_format_min_pitch_tiled
[23:01:05] =================== [PASSED] drm_format ====================
[23:01:05] ===================== drm_framebuffer  =====================
[23:01:05] =============== drm_test_framebuffer_create  ===============
[23:01:05] [PASSED] ABGR8888 normal sizes
[23:01:05] [PASSED] ABGR8888 max sizes
[23:01:05] [PASSED] ABGR8888 pitch greater than min required
[23:01:05] [PASSED] ABGR8888 pitch less than min required
[23:01:05] [PASSED] ABGR8888 Invalid width
[23:01:05] [PASSED] ABGR8888 Invalid buffer handle
[23:01:05] [PASSED] No pixel format
[23:01:05] [PASSED] ABGR8888 Width 0
[23:01:05] [PASSED] ABGR8888 Height 0
[23:01:05] [PASSED] ABGR8888 Out of bound height * pitch combination
[23:01:05] [PASSED] ABGR8888 Large buffer offset
[23:01:05] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[23:01:05] [PASSED] ABGR8888 Valid buffer modifier
[23:01:05] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[23:01:05] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[23:01:05] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[23:01:05] [PASSED] NV12 Normal sizes
[23:01:05] [PASSED] NV12 Max sizes
[23:01:05] [PASSED] NV12 Invalid pitch
[23:01:05] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[23:01:05] [PASSED] NV12 different  modifier per-plane
[23:01:05] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[23:01:05] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[23:01:05] [PASSED] NV12 Modifier for inexistent plane
[23:01:05] [PASSED] NV12 Handle for inexistent plane
[23:01:05] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[23:01:05] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[23:01:05] [PASSED] YVU420 Normal sizes
[23:01:05] [PASSED] YVU420 Max sizes
[23:01:05] [PASSED] YVU420 Invalid pitch
[23:01:05] [PASSED] YVU420 Different pitches
[23:01:05] [PASSED] YVU420 Different buffer offsets/pitches
[23:01:05] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[23:01:05] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[23:01:05] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[23:01:05] [PASSED] YVU420 Valid modifier
[23:01:05] [PASSED] YVU420 Different modifiers per plane
[23:01:05] [PASSED] YVU420 Modifier for inexistent plane
[23:01:05] [PASSED] X0L2 Normal sizes
[23:01:05] [PASSED] X0L2 Max sizes
[23:01:05] [PASSED] X0L2 Invalid pitch
[23:01:05] [PASSED] X0L2 Pitch greater than minimum required
[23:01:05] [PASSED] X0L2 Handle for inexistent plane
[23:01:05] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[23:01:05] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[23:01:05] [PASSED] X0L2 Valid modifier
[23:01:05] [PASSED] X0L2 Modifier for inexistent plane
[23:01:05] =========== [PASSED] drm_test_framebuffer_create ===========
[23:01:05] ================= [PASSED] drm_framebuffer =================
[23:01:05] ==================== drm-test-managed  =====================
[23:01:05] [PASSED] drm_test_managed_run_action
[23:01:05] ================ [PASSED] drm-test-managed =================
[23:01:05] ========================= drm_mm  ==========================
[23:01:05] [PASSED] drm_test_mm_init
[23:01:05] [PASSED] drm_test_mm_debug
[23:01:15] [PASSED] drm_test_mm_reserve
[23:01:25] [PASSED] drm_test_mm_insert
[23:01:26] [PASSED] drm_test_mm_replace
[23:01:26] [PASSED] drm_test_mm_insert_range
[23:01:26] [PASSED] drm_test_mm_frag
[23:01:26] [PASSED] drm_test_mm_align
[23:01:26] [PASSED] drm_test_mm_align32
[23:01:27] [PASSED] drm_test_mm_align64
[23:01:27] [PASSED] drm_test_mm_evict
[23:01:27] [PASSED] drm_test_mm_evict_range
[23:01:27] [PASSED] drm_test_mm_topdown
[23:01:27] [PASSED] drm_test_mm_bottomup
[23:01:27] [PASSED] drm_test_mm_lowest
[23:01:27] [PASSED] drm_test_mm_highest
[23:01:28] [PASSED] drm_test_mm_color
[23:01:28] [PASSED] drm_test_mm_color_evict
[23:01:28] [PASSED] drm_test_mm_color_evict_range
[23:01:28] ===================== [PASSED] drm_mm ======================
[23:01:28] =================== drm_modes_analog_tv  ===================
[23:01:28] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[23:01:28] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[23:01:28] [PASSED] drm_test_modes_analog_tv_pal_576i
[23:01:28] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[23:01:28] =============== [PASSED] drm_modes_analog_tv ===============
[23:01:28] ==================== drm_plane_helper  =====================
[23:01:28] =============== drm_test_check_plane_state  ================
[23:01:28] [PASSED] clipping_simple
[23:01:28] [PASSED] clipping_rotate_reflect
[23:01:28] [PASSED] positioning_simple
[23:01:28] [PASSED] upscaling
[23:01:28] [PASSED] downscaling
[23:01:28] [PASSED] rounding1
[23:01:28] [PASSED] rounding2
[23:01:28] [PASSED] rounding3
[23:01:28] [PASSED] rounding4
[23:01:28] =========== [PASSED] drm_test_check_plane_state ============
[23:01:28] =========== drm_test_check_invalid_plane_state  ============
[23:01:28] [PASSED] positioning_invalid
[23:01:28] [PASSED] upscaling_invalid
[23:01:28] [PASSED] downscaling_invalid
[23:01:28] ======= [PASSED] drm_test_check_invalid_plane_state ========
[23:01:28] ================ [PASSED] drm_plane_helper =================
[23:01:28] ============ drm_connector_helper_tv_get_modes  ============
[23:01:28] ====== drm_test_connector_helper_tv_get_modes_check  =======
[23:01:28] [PASSED] None
[23:01:28] [PASSED] PAL
[23:01:28] [PASSED] NTSC
[23:01:28] [PASSED] Both, NTSC Default
[23:01:28] [PASSED] Both, PAL Default
[23:01:28] [PASSED] Both, NTSC Default, with PAL on command-line
[23:01:28] [PASSED] Both, PAL Default, with NTSC on command-line
[23:01:28] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[23:01:28] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[23:01:28] ======================== drm_rect  =========================
[23:01:28] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[23:01:28] [PASSED] drm_test_rect_clip_scaled_not_clipped
[23:01:28] [PASSED] drm_test_rect_clip_scaled_clipped
[23:01:28] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[23:01:28] ================= drm_test_rect_intersect  =================
[23:01:28] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[23:01:28] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[23:01:28] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[23:01:28] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[23:01:28] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[23:01:28] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[23:01:28] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[23:01:28] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[23:01:28] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[23:01:28] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[23:01:28] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[23:01:28] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[23:01:28] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[23:01:28] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[23:01:28] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[23:01:28] ============= [PASSED] drm_test_rect_intersect =============
[23:01:28] ================ drm_test_rect_calc_hscale  ================
[23:01:28] [PASSED] normal use
[23:01:28] [PASSED] out of max range
[23:01:28] [PASSED] out of min range
[23:01:28] [PASSED] zero dst
[23:01:28] [PASSED] negative src
[23:01:28] [PASSED] negative dst
[23:01:28] ============ [PASSED] drm_test_rect_calc_hscale ============
[23:01:28] ================ drm_test_rect_calc_vscale  ================
[23:01:28] [PASSED] normal use
[23:01:28] [PASSED] out of max range
[23:01:28] [PASSED] out of min range
[23:01:28] [PASSED] zero dst
[23:01:28] [PASSED] negative src
[23:01:28] [PASSED] negative dst
[23:01:28] ============ [PASSED] drm_test_rect_calc_vscale ============
[23:01:28] ================== drm_test_rect_rotate  ===================
[23:01:28] [PASSED] reflect-x
[23:01:28] [PASSED] reflect-y
[23:01:28] [PASSED] rotate-0
[23:01:28] [PASSED] rotate-90
[23:01:28] [PASSED] rotate-180
[23:01:28] [PASSED] rotate-270
[23:01:28] ============== [PASSED] drm_test_rect_rotate ===============
[23:01:28] ================ drm_test_rect_rotate_inv  =================
[23:01:28] [PASSED] reflect-x
[23:01:28] [PASSED] reflect-y
[23:01:28] [PASSED] rotate-0
[23:01:28] [PASSED] rotate-90
[23:01:28] [PASSED] rotate-180
[23:01:28] [PASSED] rotate-270
[23:01:28] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[23:01:28] ==================== [PASSED] drm_rect =====================
[23:01:28] ======================== drm_exec  =========================
[23:01:28] [PASSED] sanitycheck
[23:01:28] [PASSED] test_lock
[23:01:28] [PASSED] test_lock_unlock
[23:01:28] [PASSED] test_duplicates
[23:01:28] [PASSED] test_prepare
[23:01:28] [PASSED] test_prepare_array
[23:01:28] [PASSED] test_multiple_loops
[23:01:28] ==================== [PASSED] drm_exec =====================
[23:01:28] ============================================================
[23:01:28] Testing complete. Ran 368 tests: passed: 368
[23:01:28] Elapsed time: 44.103s total, 1.639s configuring, 19.132s building, 23.287s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


