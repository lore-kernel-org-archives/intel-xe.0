Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CC3C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 10:21:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E21110E859;
	Thu,  7 Dec 2023 10:21:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B163B10E859;
 Thu,  7 Dec 2023 10:21:39 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id ADED5ACC20;
 Thu,  7 Dec 2023 10:21:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Enable_compression_handling_on?=
 =?utf-8?q?_LNL=2E_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Thu, 07 Dec 2023 10:21:39 -0000
Message-ID: <170194449970.28719.2223991266668191765@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
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

Series: Enable compression handling on LNL. (rev7)
URL   : https://patchwork.freedesktop.org/series/126704/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[10:20:28] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:20:32] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[10:20:52] Starting KUnit Kernel (1/1)...
[10:20:52] ============================================================
[10:20:52] ========================== xe_bo  ==========================
[10:20:52] [SKIPPED] xe_ccs_migrate_kunit
[10:20:52] [SKIPPED] xe_bo_evict_kunit
[10:20:52] ===================== [SKIPPED] xe_bo ======================
[10:20:52] ======================= xe_dma_buf  ========================
[10:20:52] [SKIPPED] xe_dma_buf_kunit
[10:20:52] =================== [SKIPPED] xe_dma_buf ===================
[10:20:52] ======================= xe_migrate  ========================
[10:20:52] [SKIPPED] xe_migrate_sanity_kunit
[10:20:52] =================== [SKIPPED] xe_migrate ===================
[10:20:52] ========================= xe_mocs  =========================
[10:20:52] [SKIPPED] xe_live_mocs_kernel_kunit
[10:20:52] ==================== [SKIPPED] xe_mocs =====================
[10:20:52] ========================= xe_pci  ==========================
[10:20:52] [PASSED] xe_gmdid_graphics_ip
[10:20:52] [PASSED] xe_gmdid_media_ip
[10:20:52] ===================== [PASSED] xe_pci ======================
[10:20:52] ========================= xe_rtp  ==========================
[10:20:52] ================== xe_rtp_process_tests  ===================
[10:20:52] [PASSED] coalesce-same-reg
[10:20:52] [PASSED] no-match-no-add
[10:20:52] [PASSED] no-match-no-add-multiple-rules
[10:20:52] [PASSED] two-regs-two-entries
[10:20:52] [PASSED] clr-one-set-other
[10:20:52] [PASSED] set-field
[10:20:52] [PASSED] conflict-duplicate
[10:20:52] [PASSED] conflict-not-disjoint
[10:20:52] [PASSED] conflict-reg-type
[10:20:52] ============== [PASSED] xe_rtp_process_tests ===============
[10:20:52] ===================== [PASSED] xe_rtp ======================
[10:20:52] ========================== xe_wa  ==========================
[10:20:52] ======================== xe_wa_gt  =========================
[10:20:52] [PASSED] TIGERLAKE (B0)
[10:20:52] [PASSED] DG1 (A0)
[10:20:52] [PASSED] DG1 (B0)
[10:20:52] [PASSED] ALDERLAKE_S (A0)
[10:20:52] [PASSED] ALDERLAKE_S (B0)
[10:20:52] [PASSED] ALDERLAKE_S (C0)
[10:20:52] [PASSED] ALDERLAKE_S (D0)
[10:20:52] [PASSED] ALDERLAKE_P (A0)
[10:20:52] [PASSED] ALDERLAKE_P (B0)
[10:20:52] [PASSED] ALDERLAKE_P (C0)
[10:20:52] [PASSED] ALDERLAKE_S_RPLS (D0)
[10:20:52] [PASSED] ALDERLAKE_P_RPLU (E0)
[10:20:52] [PASSED] DG2_G10 (A0)
[10:20:52] [PASSED] DG2_G10 (A1)
[10:20:52] [PASSED] DG2_G10 (B0)
[10:20:52] [PASSED] DG2_G10 (C0)
[10:20:52] [PASSED] DG2_G11 (A0)
[10:20:52] [PASSED] DG2_G11 (B0)
[10:20:52] [PASSED] DG2_G11 (B1)
[10:20:52] [PASSED] DG2_G12 (A0)
[10:20:52] [PASSED] DG2_G12 (A1)
[10:20:52] [PASSED] PVC (B0)
[10:20:52] [PASSED] PVC (B1)
[10:20:52] [PASSED] PVC (C0)
[10:20:52] [PASSED] METEORLAKE (g:A0, m:A0)
[10:20:52] [PASSED] METEORLAKE (g:A0, m:A0)
[10:20:52] [PASSED] LUNARLAKE (g:A0, m:A0)
[10:20:52] [PASSED] LUNARLAKE (g:B0, m:A0)
[10:20:52] ==================== [PASSED] xe_wa_gt =====================
[10:20:52] ====================== [PASSED] xe_wa ======================
[10:20:52] ============================================================
[10:20:52] Testing complete. Ran 44 tests: passed: 39, skipped: 5
[10:20:52] Elapsed time: 24.460s total, 4.175s configuring, 20.166s building, 0.097s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[10:20:52] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:20:54] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[10:21:13] Starting KUnit Kernel (1/1)...
[10:21:13] ============================================================
[10:21:14] ================== drm_test_pick_cmdline  ==================
[10:21:14] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[10:21:14] =============== drm_test_pick_cmdline_named  ===============
[10:21:14] [PASSED] NTSC
[10:21:14] [PASSED] NTSC-J
[10:21:14] [PASSED] PAL
[10:21:14] [PASSED] PAL-M
[10:21:14] =========== [PASSED] drm_test_pick_cmdline_named ===========
[10:21:14] ============== [PASSED] drm_test_pick_cmdline ==============
[10:21:14] ======================== drm_buddy  ========================
[10:21:14] [PASSED] drm_test_buddy_alloc_limit
[10:21:14] [PASSED] drm_test_buddy_alloc_range
[10:21:14] [PASSED] drm_test_buddy_alloc_optimistic
[10:21:14] [PASSED] drm_test_buddy_alloc_pessimistic
[10:21:14] [PASSED] drm_test_buddy_alloc_smoke
[10:21:14] [PASSED] drm_test_buddy_alloc_pathological
[10:21:14] ==================== [PASSED] drm_buddy ====================
[10:21:14] =================== drm_cmdline_parser  ====================
[10:21:14] [PASSED] drm_test_cmdline_force_d_only
[10:21:14] [PASSED] drm_test_cmdline_force_D_only_dvi
[10:21:14] [PASSED] drm_test_cmdline_force_D_only_hdmi
[10:21:14] [PASSED] drm_test_cmdline_force_D_only_not_digital
[10:21:14] [PASSED] drm_test_cmdline_force_e_only
[10:21:14] [PASSED] drm_test_cmdline_res
[10:21:14] [PASSED] drm_test_cmdline_res_vesa
[10:21:14] [PASSED] drm_test_cmdline_res_vesa_rblank
[10:21:14] [PASSED] drm_test_cmdline_res_rblank
[10:21:14] [PASSED] drm_test_cmdline_res_bpp
[10:21:14] [PASSED] drm_test_cmdline_res_refresh
[10:21:14] [PASSED] drm_test_cmdline_res_bpp_refresh
[10:21:14] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[10:21:14] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[10:21:14] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[10:21:14] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[10:21:14] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[10:21:14] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[10:21:14] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[10:21:14] [PASSED] drm_test_cmdline_res_margins_force_on
[10:21:14] [PASSED] drm_test_cmdline_res_vesa_margins
[10:21:14] [PASSED] drm_test_cmdline_name
[10:21:14] [PASSED] drm_test_cmdline_name_bpp
[10:21:14] [PASSED] drm_test_cmdline_name_option
[10:21:14] [PASSED] drm_test_cmdline_name_bpp_option
[10:21:14] [PASSED] drm_test_cmdline_rotate_0
[10:21:14] [PASSED] drm_test_cmdline_rotate_90
[10:21:14] [PASSED] drm_test_cmdline_rotate_180
[10:21:14] [PASSED] drm_test_cmdline_rotate_270
[10:21:14] [PASSED] drm_test_cmdline_hmirror
[10:21:14] [PASSED] drm_test_cmdline_vmirror
[10:21:14] [PASSED] drm_test_cmdline_margin_options
[10:21:14] [PASSED] drm_test_cmdline_multiple_options
[10:21:14] [PASSED] drm_test_cmdline_bpp_extra_and_option
[10:21:14] [PASSED] drm_test_cmdline_extra_and_option
[10:21:14] [PASSED] drm_test_cmdline_freestanding_options
[10:21:14] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[10:21:14] [PASSED] drm_test_cmdline_panel_orientation
[10:21:14] ================ drm_test_cmdline_invalid  =================
[10:21:14] [PASSED] margin_only
[10:21:14] [PASSED] interlace_only
[10:21:14] [PASSED] res_missing_x
[10:21:14] [PASSED] res_missing_y
[10:21:14] [PASSED] res_bad_y
[10:21:14] [PASSED] res_missing_y_bpp
[10:21:14] [PASSED] res_bad_bpp
[10:21:14] [PASSED] res_bad_refresh
[10:21:14] [PASSED] res_bpp_refresh_force_on_off
[10:21:14] [PASSED] res_invalid_mode
[10:21:14] [PASSED] res_bpp_wrong_place_mode
[10:21:14] [PASSED] name_bpp_refresh
[10:21:14] [PASSED] name_refresh
[10:21:14] [PASSED] name_refresh_wrong_mode
[10:21:14] [PASSED] name_refresh_invalid_mode
[10:21:14] [PASSED] rotate_multiple
[10:21:14] [PASSED] rotate_invalid_val
[10:21:14] [PASSED] rotate_truncated
[10:21:14] [PASSED] invalid_option
[10:21:14] [PASSED] invalid_tv_option
[10:21:14] [PASSED] truncated_tv_option
[10:21:14] ============ [PASSED] drm_test_cmdline_invalid =============
[10:21:14] =============== drm_test_cmdline_tv_options  ===============
[10:21:14] [PASSED] NTSC
[10:21:14] [PASSED] NTSC_443
[10:21:14] [PASSED] NTSC_J
[10:21:14] [PASSED] PAL
[10:21:14] [PASSED] PAL_M
[10:21:14] [PASSED] PAL_N
[10:21:14] [PASSED] SECAM
[10:21:14] =========== [PASSED] drm_test_cmdline_tv_options ===========
[10:21:14] =============== [PASSED] drm_cmdline_parser ================
[10:21:14] ================ drm_get_tv_mode_from_name  ================
[10:21:14] ========== drm_test_get_tv_mode_from_name_valid  ===========
[10:21:14] [PASSED] NTSC
[10:21:14] [PASSED] NTSC-443
[10:21:14] [PASSED] NTSC-J
[10:21:14] [PASSED] PAL
[10:21:14] [PASSED] PAL-M
[10:21:14] [PASSED] PAL-N
[10:21:14] [PASSED] SECAM
[10:21:14] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[10:21:14] [PASSED] drm_test_get_tv_mode_from_name_truncated
[10:21:14] ============ [PASSED] drm_get_tv_mode_from_name ============
[10:21:14] ==================== drm_damage_helper  ====================
[10:21:14] [PASSED] drm_test_damage_iter_no_damage
[10:21:14] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[10:21:14] [PASSED] drm_test_damage_iter_no_damage_src_moved
[10:21:14] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[10:21:14] [PASSED] drm_test_damage_iter_no_damage_not_visible
[10:21:14] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[10:21:14] [PASSED] drm_test_damage_iter_no_damage_no_fb
[10:21:14] [PASSED] drm_test_damage_iter_simple_damage
[10:21:14] [PASSED] drm_test_damage_iter_single_damage
[10:21:14] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[10:21:14] [PASSED] drm_test_damage_iter_single_damage_outside_src
[10:21:14] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[10:21:14] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[10:21:14] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[10:21:14] [PASSED] drm_test_damage_iter_single_damage_src_moved
[10:21:14] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[10:21:14] [PASSED] drm_test_damage_iter_damage
[10:21:14] [PASSED] drm_test_damage_iter_damage_one_intersect
[10:21:14] [PASSED] drm_test_damage_iter_damage_one_outside
[10:21:14] [PASSED] drm_test_damage_iter_damage_src_moved
[10:21:14] [PASSED] drm_test_damage_iter_damage_not_visible
[10:21:14] ================ [PASSED] drm_damage_helper ================
[10:21:14] ==================== drm_dp_mst_helper  ====================
[10:21:14] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[10:21:14] [PASSED] Clock 154000 BPP 30 DSC disabled
[10:21:14] [PASSED] Clock 234000 BPP 30 DSC disabled
[10:21:14] [PASSED] Clock 297000 BPP 24 DSC disabled
[10:21:14] [PASSED] Clock 332880 BPP 24 DSC enabled
[10:21:14] [PASSED] Clock 324540 BPP 24 DSC enabled
[10:21:14] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[10:21:14] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[10:21:14] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[10:21:14] [PASSED] DP_POWER_UP_PHY with port number
[10:21:14] [PASSED] DP_POWER_DOWN_PHY with port number
[10:21:14] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[10:21:14] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[10:21:14] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[10:21:14] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[10:21:14] [PASSED] DP_QUERY_PAYLOAD with port number
[10:21:14] [PASSED] DP_QUERY_PAYLOAD with VCPI
[10:21:14] [PASSED] DP_REMOTE_DPCD_READ with port number
[10:21:14] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[10:21:14] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[10:21:14] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[10:21:14] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[10:21:14] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[10:21:14] [PASSED] DP_REMOTE_I2C_READ with port number
[10:21:14] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[10:21:14] [PASSED] DP_REMOTE_I2C_READ with transactions array
[10:21:14] [PASSED] DP_REMOTE_I2C_WRITE with port number
[10:21:14] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[10:21:14] [PASSED] DP_REMOTE_I2C_WRITE with data array
[10:21:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[10:21:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[10:21:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[10:21:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[10:21:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[10:21:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[10:21:14] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[10:21:14] ================ [PASSED] drm_dp_mst_helper ================
[10:21:14] ================= drm_format_helper_test  ==================
[10:21:14] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[10:21:14] [PASSED] single_pixel_source_buffer
[10:21:14] [PASSED] single_pixel_clip_rectangle
[10:21:14] [PASSED] well_known_colors
[10:21:14] [PASSED] destination_pitch
[10:21:14] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[10:21:14] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[10:21:14] [PASSED] single_pixel_source_buffer
[10:21:14] [PASSED] single_pixel_clip_rectangle
[10:21:14] [PASSED] well_known_colors
[10:21:14] [PASSED] destination_pitch
[10:21:14] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[10:21:14] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[10:21:14] [PASSED] single_pixel_source_buffer
[10:21:14] [PASSED] single_pixel_clip_rectangle
[10:21:14] [PASSED] well_known_colors
[10:21:14] [PASSED] destination_pitch
[10:21:14] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[10:21:14] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[10:21:14] [PASSED] single_pixel_source_buffer
[10:21:14] [PASSED] single_pixel_clip_rectangle
[10:21:14] [PASSED] well_known_colors
[10:21:14] [PASSED] destination_pitch
[10:21:14] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[10:21:14] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[10:21:14] [PASSED] single_pixel_source_buffer
[10:21:14] [PASSED] single_pixel_clip_rectangle
[10:21:14] [PASSED] well_known_colors
[10:21:14] [PASSED] destination_pitch
[10:21:14] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[10:21:14] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[10:21:14] [PASSED] single_pixel_source_buffer
[10:21:14] [PASSED] single_pixel_clip_rectangle
[10:21:14] [PASSED] well_known_colors
[10:21:14] [PASSED] destination_pitch
[10:21:14] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[10:21:14] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[10:21:14] [PASSED] single_pixel_source_buffer
[10:21:14] [PASSED] single_pixel_clip_rectangle
[10:21:14] [PASSED] well_known_colors
[10:21:14] [PASSED] destination_pitch
[10:21:14] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[10:21:14] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[10:21:14] [PASSED] single_pixel_source_buffer
[10:21:14] [PASSED] single_pixel_clip_rectangle
[10:21:14] [PASSED] well_known_colors
[10:21:14] [PASSED] destination_pitch
[10:21:14] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[10:21:14] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[10:21:14] [PASSED] single_pixel_source_buffer
[10:21:14] [PASSED] single_pixel_clip_rectangle
[10:21:14] [PASSED] well_known_colors
[10:21:14] [PASSED] destination_pitch
[10:21:14] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[10:21:14] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[10:21:14] [PASSED] single_pixel_source_buffer
[10:21:14] [PASSED] single_pixel_clip_rectangle
[10:21:14] [PASSED] well_known_colors
[10:21:14] [PASSED] destination_pitch
[10:21:14] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[10:21:14] ============== drm_test_fb_xrgb8888_to_mono  ===============
[10:21:14] [PASSED] single_pixel_source_buffer
[10:21:14] [PASSED] single_pixel_clip_rectangle
[10:21:14] [PASSED] well_known_colors
[10:21:14] [PASSED] destination_pitch
[10:21:14] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[10:21:14] ==================== drm_test_fb_swab  =====================
[10:21:14] [PASSED] single_pixel_source_buffer
[10:21:14] [PASSED] single_pixel_clip_rectangle
[10:21:14] [PASSED] well_known_colors
[10:21:14] [PASSED] destination_pitch
[10:21:14] ================ [PASSED] drm_test_fb_swab =================
[10:21:14] ================= drm_test_fb_clip_offset  =================
[10:21:14] [PASSED] pass through
[10:21:14] [PASSED] horizontal offset
[10:21:14] [PASSED] vertical offset
[10:21:14] [PASSED] horizontal and vertical offset
[10:21:14] [PASSED] horizontal offset (custom pitch)
[10:21:14] [PASSED] vertical offset (custom pitch)
[10:21:14] [PASSED] horizontal and vertical offset (custom pitch)
[10:21:14] ============= [PASSED] drm_test_fb_clip_offset =============
[10:21:14] ============== drm_test_fb_build_fourcc_list  ==============
[10:21:14] [PASSED] no native formats
[10:21:14] [PASSED] XRGB8888 as native format
[10:21:14] [PASSED] remove duplicates
[10:21:14] [PASSED] convert alpha formats
[10:21:14] [PASSED] random formats
[10:21:14] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[10:21:14] =================== drm_test_fb_memcpy  ====================
[10:21:14] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[10:21:14] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[10:21:14] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[10:21:14] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[10:21:14] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[10:21:14] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[10:21:14] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[10:21:14] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[10:21:14] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[10:21:14] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[10:21:14] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[10:21:14] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[10:21:14] =============== [PASSED] drm_test_fb_memcpy ================
[10:21:14] ============= [PASSED] drm_format_helper_test ==============
[10:21:14] ======================= drm_format  ========================
[10:21:14] [PASSED] drm_test_format_block_width_invalid
[10:21:14] [PASSED] drm_test_format_block_width_one_plane
[10:21:14] [PASSED] drm_test_format_block_width_two_plane
[10:21:14] [PASSED] drm_test_format_block_width_three_plane
[10:21:14] [PASSED] drm_test_format_block_width_tiled
[10:21:14] [PASSED] drm_test_format_block_height_invalid
[10:21:14] [PASSED] drm_test_format_block_height_one_plane
[10:21:14] [PASSED] drm_test_format_block_height_two_plane
[10:21:14] [PASSED] drm_test_format_block_height_three_plane
[10:21:14] [PASSED] drm_test_format_block_height_tiled
[10:21:14] [PASSED] drm_test_format_min_pitch_invalid
[10:21:14] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[10:21:14] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[10:21:14] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[10:21:14] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[10:21:14] [PASSED] drm_test_format_min_pitch_two_plane
[10:21:14] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[10:21:14] [PASSED] drm_test_format_min_pitch_tiled
[10:21:14] =================== [PASSED] drm_format ====================
[10:21:14] ===================== drm_framebuffer  =====================
[10:21:14] =============== drm_test_framebuffer_create  ===============
[10:21:14] [PASSED] ABGR8888 normal sizes
[10:21:14] [PASSED] ABGR8888 max sizes
[10:21:14] [PASSED] ABGR8888 pitch greater than min required
[10:21:14] [PASSED] ABGR8888 pitch less than min required
[10:21:14] [PASSED] ABGR8888 Invalid width
[10:21:14] [PASSED] ABGR8888 Invalid buffer handle
[10:21:14] [PASSED] No pixel format
[10:21:14] [PASSED] ABGR8888 Width 0
[10:21:14] [PASSED] ABGR8888 Height 0
[10:21:14] [PASSED] ABGR8888 Out of bound height * pitch combination
[10:21:14] [PASSED] ABGR8888 Large buffer offset
[10:21:14] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[10:21:14] [PASSED] ABGR8888 Valid buffer modifier
[10:21:14] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[10:21:14] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[10:21:14] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[10:21:14] [PASSED] NV12 Normal sizes
[10:21:14] [PASSED] NV12 Max sizes
[10:21:14] [PASSED] NV12 Invalid pitch
[10:21:14] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[10:21:14] [PASSED] NV12 different  modifier per-plane
[10:21:14] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[10:21:14] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[10:21:14] [PASSED] NV12 Modifier for inexistent plane
[10:21:14] [PASSED] NV12 Handle for inexistent plane
[10:21:14] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[10:21:14] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[10:21:14] [PASSED] YVU420 Normal sizes
[10:21:14] [PASSED] YVU420 Max sizes
[10:21:14] [PASSED] YVU420 Invalid pitch
[10:21:14] [PASSED] YVU420 Different pitches
[10:21:14] [PASSED] YVU420 Different buffer offsets/pitches
[10:21:14] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[10:21:14] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[10:21:14] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[10:21:14] [PASSED] YVU420 Valid modifier
[10:21:14] [PASSED] YVU420 Different modifiers per plane
[10:21:14] [PASSED] YVU420 Modifier for inexistent plane
[10:21:14] [PASSED] X0L2 Normal sizes
[10:21:14] [PASSED] X0L2 Max sizes
[10:21:14] [PASSED] X0L2 Invalid pitch
[10:21:14] [PASSED] X0L2 Pitch greater than minimum required
[10:21:14] [PASSED] X0L2 Handle for inexistent plane
[10:21:14] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[10:21:14] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[10:21:14] [PASSED] X0L2 Valid modifier
[10:21:14] [PASSED] X0L2 Modifier for inexistent plane
[10:21:14] =========== [PASSED] drm_test_framebuffer_create ===========
[10:21:14] ================= [PASSED] drm_framebuffer =================
[10:21:14] ==================== drm-test-managed  =====================
[10:21:14] [PASSED] drm_test_managed_run_action
[10:21:14] ================ [PASSED] drm-test-managed =================
[10:21:14] ========================= drm_mm  ==========================
[10:21:14] [PASSED] drm_test_mm_init
[10:21:14] [PASSED] drm_test_mm_debug
[10:21:24] [PASSED] drm_test_mm_reserve
[10:21:34] [PASSED] drm_test_mm_insert
[10:21:35] [PASSED] drm_test_mm_replace
[10:21:35] [PASSED] drm_test_mm_insert_range
[10:21:35] [PASSED] drm_test_mm_frag
[10:21:35] [PASSED] drm_test_mm_align
[10:21:35] [PASSED] drm_test_mm_align32
[10:21:35] [PASSED] drm_test_mm_align64
[10:21:35] [PASSED] drm_test_mm_evict
[10:21:35] [PASSED] drm_test_mm_evict_range
[10:21:35] [PASSED] drm_test_mm_topdown
[10:21:35] [PASSED] drm_test_mm_bottomup
[10:21:35] [PASSED] drm_test_mm_lowest
[10:21:35] [PASSED] drm_test_mm_highest
[10:21:36] [PASSED] drm_test_mm_color
[10:21:37] [PASSED] drm_test_mm_color_evict
[10:21:37] [PASSED] drm_test_mm_color_evict_range
[10:21:37] ===================== [PASSED] drm_mm ======================
[10:21:37] =================== drm_modes_analog_tv  ===================
[10:21:37] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[10:21:37] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[10:21:37] [PASSED] drm_test_modes_analog_tv_pal_576i
[10:21:37] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[10:21:37] =============== [PASSED] drm_modes_analog_tv ===============
[10:21:37] ==================== drm_plane_helper  =====================
[10:21:37] =============== drm_test_check_plane_state  ================
[10:21:37] [PASSED] clipping_simple
[10:21:37] [PASSED] clipping_rotate_reflect
[10:21:37] [PASSED] positioning_simple
[10:21:37] [PASSED] upscaling
[10:21:37] [PASSED] downscaling
[10:21:37] [PASSED] rounding1
[10:21:37] [PASSED] rounding2
[10:21:37] [PASSED] rounding3
[10:21:37] [PASSED] rounding4
[10:21:37] =========== [PASSED] drm_test_check_plane_state ============
[10:21:37] =========== drm_test_check_invalid_plane_state  ============
[10:21:37] [PASSED] positioning_invalid
[10:21:37] [PASSED] upscaling_invalid
[10:21:37] [PASSED] downscaling_invalid
[10:21:37] ======= [PASSED] drm_test_check_invalid_plane_state ========
[10:21:37] ================ [PASSED] drm_plane_helper =================
[10:21:37] ============ drm_connector_helper_tv_get_modes  ============
[10:21:37] ====== drm_test_connector_helper_tv_get_modes_check  =======
[10:21:37] [PASSED] None
[10:21:37] [PASSED] PAL
[10:21:37] [PASSED] NTSC
[10:21:37] [PASSED] Both, NTSC Default
[10:21:37] [PASSED] Both, PAL Default
[10:21:37] [PASSED] Both, NTSC Default, with PAL on command-line
[10:21:37] [PASSED] Both, PAL Default, with NTSC on command-line
[10:21:37] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[10:21:37] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[10:21:37] ======================== drm_rect  =========================
[10:21:37] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[10:21:37] [PASSED] drm_test_rect_clip_scaled_not_clipped
[10:21:37] [PASSED] drm_test_rect_clip_scaled_clipped
[10:21:37] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[10:21:37] ================= drm_test_rect_intersect  =================
[10:21:37] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[10:21:37] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[10:21:37] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[10:21:37] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[10:21:37] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[10:21:37] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[10:21:37] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[10:21:37] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[10:21:37] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[10:21:37] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[10:21:37] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[10:21:37] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[10:21:37] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[10:21:37] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[10:21:37] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[10:21:37] ============= [PASSED] drm_test_rect_intersect =============
[10:21:37] ================ drm_test_rect_calc_hscale  ================
[10:21:37] [PASSED] normal use
[10:21:37] [PASSED] out of max range
[10:21:37] [PASSED] out of min range
[10:21:37] [PASSED] zero dst
[10:21:37] [PASSED] negative src
[10:21:37] [PASSED] negative dst
[10:21:37] ============ [PASSED] drm_test_rect_calc_hscale ============
[10:21:37] ================ drm_test_rect_calc_vscale  ================
[10:21:37] [PASSED] normal use
[10:21:37] [PASSED] out of max range
[10:21:37] [PASSED] out of min range
[10:21:37] [PASSED] zero dst
[10:21:37] [PASSED] negative src
[10:21:37] [PASSED] negative dst
[10:21:37] ============ [PASSED] drm_test_rect_calc_vscale ============
[10:21:37] ================== drm_test_rect_rotate  ===================
[10:21:37] [PASSED] reflect-x
[10:21:37] [PASSED] reflect-y
[10:21:37] [PASSED] rotate-0
[10:21:37] [PASSED] rotate-90
[10:21:37] [PASSED] rotate-180
[10:21:37] [PASSED] rotate-270
[10:21:37] ============== [PASSED] drm_test_rect_rotate ===============
[10:21:37] ================ drm_test_rect_rotate_inv  =================
[10:21:37] [PASSED] reflect-x
[10:21:37] [PASSED] reflect-y
[10:21:37] [PASSED] rotate-0
[10:21:37] [PASSED] rotate-90
[10:21:37] [PASSED] rotate-180
[10:21:37] [PASSED] rotate-270
[10:21:37] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[10:21:37] ==================== [PASSED] drm_rect =====================
[10:21:37] ======================== drm_exec  =========================
[10:21:37] [PASSED] sanitycheck
[10:21:37] [PASSED] test_lock
[10:21:37] [PASSED] test_lock_unlock
[10:21:37] [PASSED] test_duplicates
[10:21:37] [PASSED] test_prepare
[10:21:37] [PASSED] test_prepare_array
[10:21:37] [PASSED] test_multiple_loops
[10:21:37] ==================== [PASSED] drm_exec =====================
[10:21:37] ============================================================
[10:21:37] Testing complete. Ran 368 tests: passed: 368
[10:21:37] Elapsed time: 44.438s total, 1.700s configuring, 19.503s building, 23.232s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


