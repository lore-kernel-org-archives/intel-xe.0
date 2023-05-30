Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B1FC77B73
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC19010E134;
	Tue, 30 May 2023 10:51:20 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id F098310E134;
 Tue, 30 May 2023 10:51:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EC249AADE8;
 Tue, 30 May 2023 10:51:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Tue, 30 May 2023 10:51:18 -0000
Message-ID: <168544387896.18935.5955767163046456242@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230530104713.2570554-1-jouni.hogander@intel.com>
In-Reply-To: <20230530104713.2570554-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Clean-u?=
 =?utf-8?q?p_Xe_FBC_additions_=28rev2=29?=
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

Series: Clean-up Xe FBC additions (rev2)
URL   : https://patchwork.freedesktop.org/series/118560/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[10:50:07] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:50:11] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[10:50:33] Starting KUnit Kernel (1/1)...
[10:50:33] ============================================================
[10:50:33] ==================== xe_bo (2 subtests) ====================
[10:50:33] [SKIPPED] xe_ccs_migrate_kunit
[10:50:33] [SKIPPED] xe_bo_evict_kunit
[10:50:33] ===================== [SKIPPED] xe_bo ======================
[10:50:33] ================== xe_dma_buf (1 subtest) ==================
[10:50:33] [SKIPPED] xe_dma_buf_kunit
[10:50:33] =================== [SKIPPED] xe_dma_buf ===================
[10:50:33] ================== xe_migrate (1 subtest) ==================
[10:50:33] [SKIPPED] xe_migrate_sanity_kunit
[10:50:33] =================== [SKIPPED] xe_migrate ===================
[10:50:33] =================== xe_pci (2 subtests) ====================
[10:50:33] [PASSED] xe_gmdid_graphics_ip
[10:50:33] [PASSED] xe_gmdid_media_ip
[10:50:33] ===================== [PASSED] xe_pci ======================
[10:50:33] ==================== xe_rtp (1 subtest) ====================
[10:50:33] ================== xe_rtp_process_tests  ===================
[10:50:33] [PASSED] coalesce-same-reg
[10:50:33] [PASSED] no-match-no-add
[10:50:33] [PASSED] no-match-no-add-multiple-rules
[10:50:33] [PASSED] two-regs-two-entries
[10:50:33] [PASSED] clr-one-set-other
[10:50:33] [PASSED] set-field
[10:50:33] [PASSED] conflict-duplicate
[10:50:33] [PASSED] conflict-not-disjoint
[10:50:33] [PASSED] conflict-reg-type
[10:50:33] ============== [PASSED] xe_rtp_process_tests ===============
[10:50:33] ===================== [PASSED] xe_rtp ======================
[10:50:33] ==================== xe_wa (1 subtest) =====================
[10:50:33] ======================== xe_wa_gt  =========================
[10:50:33] [PASSED] TIGERLAKE (B0)
[10:50:33] [PASSED] DG1 (A0)
[10:50:33] [PASSED] DG1 (B0)
[10:50:33] [PASSED] ALDERLAKE_S (A0)
[10:50:33] [PASSED] ALDERLAKE_S (B0)
[10:50:33] [PASSED] ALDERLAKE_S (C0)
[10:50:33] [PASSED] ALDERLAKE_S (D0)
[10:50:33] [PASSED] DG2_G10 (A0)
[10:50:33] [PASSED] DG2_G10 (A1)
[10:50:33] [PASSED] DG2_G10 (B0)
[10:50:33] [PASSED] DG2_G10 (C0)
[10:50:33] [PASSED] DG2_G11 (A0)
[10:50:33] [PASSED] DG2_G11 (B0)
[10:50:33] [PASSED] DG2_G11 (B1)
[10:50:33] [PASSED] DG2_G12 (A0)
[10:50:33] [PASSED] DG2_G12 (A1)
[10:50:33] [PASSED] PVC (B0)
[10:50:33] [PASSED] PVC (B1)
[10:50:33] [PASSED] PVC (C0)
[10:50:33] ==================== [PASSED] xe_wa_gt =====================
[10:50:33] ====================== [PASSED] xe_wa ======================
[10:50:33] ============================================================
[10:50:33] Testing complete. Ran 34 tests: passed: 30, skipped: 4
[10:50:33] Elapsed time: 26.138s total, 4.187s configuring, 21.833s building, 0.095s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[10:50:33] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:50:35] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[10:50:54] Starting KUnit Kernel (1/1)...
[10:50:54] ============================================================
[10:50:54] ============ drm_test_pick_cmdline (2 subtests) ============
[10:50:54] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[10:50:54] =============== drm_test_pick_cmdline_named  ===============
[10:50:54] [PASSED] NTSC
[10:50:54] [PASSED] NTSC-J
[10:50:54] [PASSED] PAL
[10:50:54] [PASSED] PAL-M
[10:50:54] =========== [PASSED] drm_test_pick_cmdline_named ===========
[10:50:54] ============== [PASSED] drm_test_pick_cmdline ==============
[10:50:54] ================== drm_buddy (6 subtests) ==================
[10:50:54] [PASSED] drm_test_buddy_alloc_limit
[10:50:54] [PASSED] drm_test_buddy_alloc_range
[10:50:54] [PASSED] drm_test_buddy_alloc_optimistic
[10:50:54] [PASSED] drm_test_buddy_alloc_pessimistic
[10:50:54] [PASSED] drm_test_buddy_alloc_smoke
[10:50:54] [PASSED] drm_test_buddy_alloc_pathological
[10:50:54] ==================== [PASSED] drm_buddy ====================
[10:50:54] ============= drm_cmdline_parser (40 subtests) =============
[10:50:54] [PASSED] drm_test_cmdline_force_d_only
[10:50:54] [PASSED] drm_test_cmdline_force_D_only_dvi
[10:50:54] [PASSED] drm_test_cmdline_force_D_only_hdmi
[10:50:54] [PASSED] drm_test_cmdline_force_D_only_not_digital
[10:50:54] [PASSED] drm_test_cmdline_force_e_only
[10:50:54] [PASSED] drm_test_cmdline_res
[10:50:54] [PASSED] drm_test_cmdline_res_vesa
[10:50:54] [PASSED] drm_test_cmdline_res_vesa_rblank
[10:50:54] [PASSED] drm_test_cmdline_res_rblank
[10:50:54] [PASSED] drm_test_cmdline_res_bpp
[10:50:54] [PASSED] drm_test_cmdline_res_refresh
[10:50:54] [PASSED] drm_test_cmdline_res_bpp_refresh
[10:50:54] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[10:50:54] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[10:50:54] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[10:50:54] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[10:50:54] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[10:50:54] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[10:50:54] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[10:50:54] [PASSED] drm_test_cmdline_res_margins_force_on
[10:50:54] [PASSED] drm_test_cmdline_res_vesa_margins
[10:50:54] [PASSED] drm_test_cmdline_name
[10:50:54] [PASSED] drm_test_cmdline_name_bpp
[10:50:54] [PASSED] drm_test_cmdline_name_option
[10:50:54] [PASSED] drm_test_cmdline_name_bpp_option
[10:50:54] [PASSED] drm_test_cmdline_rotate_0
[10:50:54] [PASSED] drm_test_cmdline_rotate_90
[10:50:54] [PASSED] drm_test_cmdline_rotate_180
[10:50:54] [PASSED] drm_test_cmdline_rotate_270
[10:50:54] [PASSED] drm_test_cmdline_hmirror
[10:50:54] [PASSED] drm_test_cmdline_vmirror
[10:50:54] [PASSED] drm_test_cmdline_margin_options
[10:50:54] [PASSED] drm_test_cmdline_multiple_options
[10:50:54] [PASSED] drm_test_cmdline_bpp_extra_and_option
[10:50:54] [PASSED] drm_test_cmdline_extra_and_option
[10:50:54] [PASSED] drm_test_cmdline_freestanding_options
[10:50:54] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[10:50:54] [PASSED] drm_test_cmdline_panel_orientation
[10:50:54] ================ drm_test_cmdline_invalid  =================
[10:50:54] [PASSED] margin_only
[10:50:54] [PASSED] interlace_only
[10:50:54] [PASSED] res_missing_x
[10:50:54] [PASSED] res_missing_y
[10:50:54] [PASSED] res_bad_y
[10:50:54] [PASSED] res_missing_y_bpp
[10:50:54] [PASSED] res_bad_bpp
[10:50:54] [PASSED] res_bad_refresh
[10:50:54] [PASSED] res_bpp_refresh_force_on_off
[10:50:54] [PASSED] res_invalid_mode
[10:50:54] [PASSED] res_bpp_wrong_place_mode
[10:50:54] [PASSED] name_bpp_refresh
[10:50:54] [PASSED] name_refresh
[10:50:54] [PASSED] name_refresh_wrong_mode
[10:50:54] [PASSED] name_refresh_invalid_mode
[10:50:54] [PASSED] rotate_multiple
[10:50:54] [PASSED] rotate_invalid_val
[10:50:54] [PASSED] rotate_truncated
[10:50:54] [PASSED] invalid_option
[10:50:54] [PASSED] invalid_tv_option
[10:50:54] [PASSED] truncated_tv_option
[10:50:54] ============ [PASSED] drm_test_cmdline_invalid =============
[10:50:54] =============== drm_test_cmdline_tv_options  ===============
[10:50:54] [PASSED] NTSC
[10:50:54] [PASSED] NTSC_443
[10:50:54] [PASSED] NTSC_J
[10:50:54] [PASSED] PAL
[10:50:54] [PASSED] PAL_M
[10:50:54] [PASSED] PAL_N
[10:50:54] [PASSED] SECAM
[10:50:54] =========== [PASSED] drm_test_cmdline_tv_options ===========
[10:50:54] =============== [PASSED] drm_cmdline_parser ================
[10:50:54] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[10:50:54] ========== drm_test_get_tv_mode_from_name_valid  ===========
[10:50:54] [PASSED] NTSC
[10:50:54] [PASSED] NTSC-443
[10:50:54] [PASSED] NTSC-J
[10:50:54] [PASSED] PAL
[10:50:54] [PASSED] PAL-M
[10:50:54] [PASSED] PAL-N
[10:50:54] [PASSED] SECAM
[10:50:54] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[10:50:54] [PASSED] drm_test_get_tv_mode_from_name_truncated
[10:50:54] ============ [PASSED] drm_get_tv_mode_from_name ============
[10:50:54] ============= drm_damage_helper (21 subtests) ==============
[10:50:54] [PASSED] drm_test_damage_iter_no_damage
[10:50:54] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[10:50:54] [PASSED] drm_test_damage_iter_no_damage_src_moved
[10:50:54] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[10:50:54] [PASSED] drm_test_damage_iter_no_damage_not_visible
[10:50:54] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[10:50:54] [PASSED] drm_test_damage_iter_no_damage_no_fb
[10:50:54] [PASSED] drm_test_damage_iter_simple_damage
[10:50:54] [PASSED] drm_test_damage_iter_single_damage
[10:50:54] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[10:50:54] [PASSED] drm_test_damage_iter_single_damage_outside_src
[10:50:54] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[10:50:54] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[10:50:54] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[10:50:54] [PASSED] drm_test_damage_iter_single_damage_src_moved
[10:50:54] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[10:50:54] [PASSED] drm_test_damage_iter_damage
[10:50:54] [PASSED] drm_test_damage_iter_damage_one_intersect
[10:50:54] [PASSED] drm_test_damage_iter_damage_one_outside
[10:50:54] [PASSED] drm_test_damage_iter_damage_src_moved
[10:50:54] [PASSED] drm_test_damage_iter_damage_not_visible
[10:50:54] ================ [PASSED] drm_damage_helper ================
[10:50:54] ============== drm_dp_mst_helper (2 subtests) ==============
[10:50:54] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[10:50:54] [PASSED] Clock 154000 BPP 30 DSC disabled
[10:50:54] [PASSED] Clock 234000 BPP 30 DSC disabled
[10:50:54] [PASSED] Clock 297000 BPP 24 DSC disabled
[10:50:54] [PASSED] Clock 332880 BPP 24 DSC enabled
[10:50:54] [PASSED] Clock 324540 BPP 24 DSC enabled
[10:50:54] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[10:50:54] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[10:50:54] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[10:50:54] [PASSED] DP_POWER_UP_PHY with port number
[10:50:54] [PASSED] DP_POWER_DOWN_PHY with port number
[10:50:54] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[10:50:54] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[10:50:54] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[10:50:54] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[10:50:54] [PASSED] DP_QUERY_PAYLOAD with port number
[10:50:54] [PASSED] DP_QUERY_PAYLOAD with VCPI
[10:50:54] [PASSED] DP_REMOTE_DPCD_READ with port number
[10:50:54] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[10:50:54] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[10:50:54] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[10:50:54] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[10:50:54] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[10:50:54] [PASSED] DP_REMOTE_I2C_READ with port number
[10:50:54] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[10:50:54] [PASSED] DP_REMOTE_I2C_READ with transactions array
[10:50:54] [PASSED] DP_REMOTE_I2C_WRITE with port number
[10:50:54] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[10:50:54] [PASSED] DP_REMOTE_I2C_WRITE with data array
[10:50:54] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[10:50:54] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[10:50:54] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[10:50:54] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[10:50:54] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[10:50:54] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[10:50:54] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[10:50:54] ================ [PASSED] drm_dp_mst_helper ================
[10:50:54] =========== drm_format_helper_test (11 subtests) ===========
[10:50:54] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[10:50:54] [PASSED] single_pixel_source_buffer
[10:50:54] [PASSED] single_pixel_clip_rectangle
[10:50:54] [PASSED] well_known_colors
[10:50:54] [PASSED] destination_pitch
[10:50:54] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[10:50:54] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[10:50:54] [PASSED] single_pixel_source_buffer
[10:50:54] [PASSED] single_pixel_clip_rectangle
[10:50:54] [PASSED] well_known_colors
[10:50:54] [PASSED] destination_pitch
[10:50:54] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[10:50:54] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[10:50:54] [PASSED] single_pixel_source_buffer
[10:50:54] [PASSED] single_pixel_clip_rectangle
[10:50:54] [PASSED] well_known_colors
[10:50:54] [PASSED] destination_pitch
[10:50:54] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[10:50:54] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[10:50:54] [PASSED] single_pixel_source_buffer
[10:50:54] [PASSED] single_pixel_clip_rectangle
[10:50:54] [PASSED] well_known_colors
[10:50:54] [PASSED] destination_pitch
[10:50:54] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[10:50:54] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[10:50:54] [PASSED] single_pixel_source_buffer
[10:50:54] [PASSED] single_pixel_clip_rectangle
[10:50:54] [PASSED] well_known_colors
[10:50:54] [PASSED] destination_pitch
[10:50:54] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[10:50:54] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[10:50:54] [PASSED] single_pixel_source_buffer
[10:50:54] [PASSED] single_pixel_clip_rectangle
[10:50:54] [PASSED] well_known_colors
[10:50:54] [PASSED] destination_pitch
[10:50:54] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[10:50:54] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[10:50:54] [PASSED] single_pixel_source_buffer
[10:50:54] [PASSED] single_pixel_clip_rectangle
[10:50:54] [PASSED] well_known_colors
[10:50:54] [PASSED] destination_pitch
[10:50:54] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[10:50:54] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[10:50:54] [PASSED] single_pixel_source_buffer
[10:50:54] [PASSED] single_pixel_clip_rectangle
[10:50:54] [PASSED] well_known_colors
[10:50:54] [PASSED] destination_pitch
[10:50:54] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[10:50:54] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[10:50:54] [PASSED] single_pixel_source_buffer
[10:50:54] [PASSED] single_pixel_clip_rectangle
[10:50:54] [PASSED] well_known_colors
[10:50:54] [PASSED] destination_pitch
[10:50:54] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[10:50:54] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[10:50:54] [PASSED] single_pixel_source_buffer
[10:50:54] [PASSED] single_pixel_clip_rectangle
[10:50:54] [PASSED] well_known_colors
[10:50:54] [PASSED] destination_pitch
[10:50:54] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[10:50:54] ============== drm_test_fb_xrgb8888_to_mono  ===============
[10:50:54] [PASSED] single_pixel_source_buffer
[10:50:54] [PASSED] single_pixel_clip_rectangle
[10:50:54] [PASSED] well_known_colors
[10:50:54] [PASSED] destination_pitch
[10:50:54] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[10:50:54] ============= [PASSED] drm_format_helper_test ==============
[10:50:54] ================= drm_format (18 subtests) =================
[10:50:54] [PASSED] drm_test_format_block_width_invalid
[10:50:54] [PASSED] drm_test_format_block_width_one_plane
[10:50:54] [PASSED] drm_test_format_block_width_two_plane
[10:50:54] [PASSED] drm_test_format_block_width_three_plane
[10:50:54] [PASSED] drm_test_format_block_width_tiled
[10:50:54] [PASSED] drm_test_format_block_height_invalid
[10:50:54] [PASSED] drm_test_format_block_height_one_plane
[10:50:54] [PASSED] drm_test_format_block_height_two_plane
[10:50:54] [PASSED] drm_test_format_block_height_three_plane
[10:50:54] [PASSED] drm_test_format_block_height_tiled
[10:50:54] [PASSED] drm_test_format_min_pitch_invalid
[10:50:54] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[10:50:54] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[10:50:54] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[10:50:54] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[10:50:54] [PASSED] drm_test_format_min_pitch_two_plane
[10:50:54] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[10:50:54] [PASSED] drm_test_format_min_pitch_tiled
[10:50:54] =================== [PASSED] drm_format ====================
[10:50:54] =============== drm_framebuffer (1 subtest) ================
[10:50:54] =============== drm_test_framebuffer_create  ===============
[10:50:54] [PASSED] ABGR8888 normal sizes
[10:50:54] [PASSED] ABGR8888 max sizes
[10:50:54] [PASSED] ABGR8888 pitch greater than min required
[10:50:54] [PASSED] ABGR8888 pitch less than min required
[10:50:54] [PASSED] ABGR8888 Invalid width
[10:50:54] [PASSED] ABGR8888 Invalid buffer handle
[10:50:54] [PASSED] No pixel format
[10:50:54] [PASSED] ABGR8888 Width 0
[10:50:54] [PASSED] ABGR8888 Height 0
[10:50:54] [PASSED] ABGR8888 Out of bound height * pitch combination
[10:50:54] [PASSED] ABGR8888 Large buffer offset
[10:50:54] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[10:50:54] [PASSED] ABGR8888 Valid buffer modifier
[10:50:54] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[10:50:54] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[10:50:54] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[10:50:54] [PASSED] NV12 Normal sizes
[10:50:54] [PASSED] NV12 Max sizes
[10:50:54] [PASSED] NV12 Invalid pitch
[10:50:54] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[10:50:54] [PASSED] NV12 different  modifier per-plane
[10:50:54] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[10:50:54] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[10:50:54] [PASSED] NV12 Modifier for inexistent plane
[10:50:54] [PASSED] NV12 Handle for inexistent plane
[10:50:54] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[10:50:54] [PASSED] YVU420 Normal sizes
[10:50:54] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[10:50:54] [PASSED] YVU420 Max sizes
[10:50:54] [PASSED] YVU420 Invalid pitch
[10:50:54] [PASSED] YVU420 Different pitches
[10:50:54] [PASSED] YVU420 Different buffer offsets/pitches
[10:50:54] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[10:50:54] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[10:50:54] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[10:50:54] [PASSED] YVU420 Valid modifier
[10:50:54] [PASSED] YVU420 Different modifiers per plane
[10:50:54] [PASSED] YVU420 Modifier for inexistent plane
[10:50:54] [PASSED] X0L2 Normal sizes
[10:50:54] [PASSED] X0L2 Max sizes
[10:50:54] [PASSED] X0L2 Invalid pitch
[10:50:54] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[10:50:54] [PASSED] X0L2 Handle for inexistent plane
[10:50:54] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[10:50:54] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[10:50:54] [PASSED] X0L2 Valid modifier
[10:50:54] [PASSED] X0L2 Modifier for inexistent plane
[10:50:54] =========== [PASSED] drm_test_framebuffer_create ===========
[10:50:54] ================= [PASSED] drm_framebuffer =================
[10:50:54] =============== drm-test-managed (1 subtest) ===============
[10:50:54] [PASSED] drm_test_managed_run_action
[10:50:54] ================ [PASSED] drm-test-managed =================
[10:50:54] =================== drm_mm (19 subtests) ===================
[10:50:54] [PASSED] drm_test_mm_init
[10:50:54] [PASSED] drm_test_mm_debug
[10:51:04] [PASSED] drm_test_mm_reserve
[10:51:14] [PASSED] drm_test_mm_insert
[10:51:14] [PASSED] drm_test_mm_replace
[10:51:14] [PASSED] drm_test_mm_insert_range
[10:51:14] [PASSED] drm_test_mm_frag
[10:51:14] [PASSED] drm_test_mm_align
[10:51:14] [PASSED] drm_test_mm_align32
[10:51:15] [PASSED] drm_test_mm_align64
[10:51:15] [PASSED] drm_test_mm_evict
[10:51:15] [PASSED] drm_test_mm_evict_range
[10:51:15] [PASSED] drm_test_mm_topdown
[10:51:15] [PASSED] drm_test_mm_bottomup
[10:51:15] [PASSED] drm_test_mm_lowest
[10:51:15] [PASSED] drm_test_mm_highest
[10:51:16] [PASSED] drm_test_mm_color
[10:51:16] [PASSED] drm_test_mm_color_evict
[10:51:16] [PASSED] drm_test_mm_color_evict_range
[10:51:16] ===================== [PASSED] drm_mm ======================
[10:51:16] ============= drm_modes_analog_tv (4 subtests) =============
[10:51:16] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[10:51:16] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[10:51:16] [PASSED] drm_test_modes_analog_tv_pal_576i
[10:51:16] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[10:51:16] =============== [PASSED] drm_modes_analog_tv ===============
[10:51:16] ============== drm_plane_helper (2 subtests) ===============
[10:51:16] =============== drm_test_check_plane_state  ================
[10:51:16] [PASSED] clipping_simple
[10:51:16] [PASSED] clipping_rotate_reflect
[10:51:16] [PASSED] positioning_simple
[10:51:16] [PASSED] upscaling
[10:51:16] [PASSED] downscaling
[10:51:16] [PASSED] rounding1
[10:51:16] [PASSED] rounding2
[10:51:16] [PASSED] rounding3
[10:51:16] [PASSED] rounding4
[10:51:16] =========== [PASSED] drm_test_check_plane_state ============
[10:51:16] =========== drm_test_check_invalid_plane_state  ============
[10:51:16] [PASSED] positioning_invalid
[10:51:16] [PASSED] upscaling_invalid
[10:51:16] [PASSED] downscaling_invalid
[10:51:16] ======= [PASSED] drm_test_check_invalid_plane_state ========
[10:51:16] ================ [PASSED] drm_plane_helper =================
[10:51:16] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[10:51:16] ====== drm_test_connector_helper_tv_get_modes_check  =======
[10:51:16] [PASSED] None
[10:51:16] [PASSED] PAL
[10:51:16] [PASSED] NTSC
[10:51:16] [PASSED] Both, NTSC Default
[10:51:16] [PASSED] Both, PAL Default
[10:51:16] [PASSED] Both, NTSC Default, with PAL on command-line
[10:51:16] [PASSED] Both, PAL Default, with NTSC on command-line
[10:51:16] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[10:51:16] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[10:51:16] ================== drm_rect (9 subtests) ===================
[10:51:16] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[10:51:16] [PASSED] drm_test_rect_clip_scaled_not_clipped
[10:51:16] [PASSED] drm_test_rect_clip_scaled_clipped
[10:51:16] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[10:51:16] ================= drm_test_rect_intersect  =================
[10:51:16] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[10:51:16] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[10:51:16] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[10:51:16] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[10:51:16] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[10:51:16] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[10:51:16] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[10:51:16] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[10:51:16] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[10:51:16] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[10:51:16] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[10:51:16] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[10:51:16] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[10:51:16] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[10:51:16] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[10:51:16] ============= [PASSED] drm_test_rect_intersect =============
[10:51:16] ================ drm_test_rect_calc_hscale  ================
[10:51:16] [PASSED] normal use
[10:51:16] [PASSED] out of max range
[10:51:16] [PASSED] out of min range
[10:51:16] [PASSED] zero dst
[10:51:16] [PASSED] negative src
[10:51:16] [PASSED] negative dst
[10:51:16] ============ [PASSED] drm_test_rect_calc_hscale ============
[10:51:16] ================ drm_test_rect_calc_vscale  ================
[10:51:16] [PASSED] normal use
[10:51:16] [PASSED] out of max range
[10:51:16] [PASSED] out of min range
[10:51:16] [PASSED] zero dst
[10:51:16] [PASSED] negative src
[10:51:16] [PASSED] negative dst
[10:51:16] ============ [PASSED] drm_test_rect_calc_vscale ============
[10:51:16] ================== drm_test_rect_rotate  ===================
[10:51:16] [PASSED] reflect-x
[10:51:16] [PASSED] reflect-y
[10:51:16] [PASSED] rotate-0
[10:51:16] [PASSED] rotate-90
[10:51:16] [PASSED] rotate-180
[10:51:16] [PASSED] rotate-270
[10:51:16] ============== [PASSED] drm_test_rect_rotate ===============
[10:51:16] ================ drm_test_rect_rotate_inv  =================
[10:51:16] [PASSED] reflect-x
[10:51:16] [PASSED] reflect-y
[10:51:16] [PASSED] rotate-0
[10:51:16] [PASSED] rotate-90
[10:51:16] [PASSED] rotate-180
[10:51:16] [PASSED] rotate-270
[10:51:16] ============ [PASSED] drm_test_rect_rotate_inv =============
[10:51:16] ==================== [PASSED] drm_rect =====================
[10:51:16] ============================================================
[10:51:16] Testing complete. Ran 333 tests: passed: 333
[10:51:16] Elapsed time: 43.233s total, 1.688s configuring, 18.664s building, 22.878s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


