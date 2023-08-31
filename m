Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC13C83F10
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 11:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC1C10E02B;
	Thu, 31 Aug 2023 11:26:13 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1D6A510E02B;
 Thu, 31 Aug 2023 11:26:12 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1943FAADE0;
 Thu, 31 Aug 2023 11:26:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Thu, 31 Aug 2023 11:26:12 -0000
Message-ID: <169348117209.12507.17102846727475206428@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230824160444.494648-2-matthew.auld@intel.com>
In-Reply-To: <20230824160444.494648-2-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe?=
 =?utf-8?q?=3A_nuke_GuC_on_unload_=28rev4=29?=
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

Series: drm/xe: nuke GuC on unload (rev4)
URL   : https://patchwork.freedesktop.org/series/122851/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[11:25:00] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:25:04] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[11:25:24] Starting KUnit Kernel (1/1)...
[11:25:24] ============================================================
[11:25:24] ==================== xe_bo (2 subtests) ====================
[11:25:24] [SKIPPED] xe_ccs_migrate_kunit
[11:25:24] [SKIPPED] xe_bo_evict_kunit
[11:25:24] ===================== [SKIPPED] xe_bo ======================
[11:25:24] ================== xe_dma_buf (1 subtest) ==================
[11:25:24] [SKIPPED] xe_dma_buf_kunit
[11:25:24] =================== [SKIPPED] xe_dma_buf ===================
[11:25:24] ================== xe_migrate (1 subtest) ==================
[11:25:24] [SKIPPED] xe_migrate_sanity_kunit
[11:25:24] =================== [SKIPPED] xe_migrate ===================
[11:25:24] =================== xe_pci (2 subtests) ====================
[11:25:24] [PASSED] xe_gmdid_graphics_ip
[11:25:24] [PASSED] xe_gmdid_media_ip
[11:25:24] ===================== [PASSED] xe_pci ======================
[11:25:24] ==================== xe_rtp (1 subtest) ====================
[11:25:24] ================== xe_rtp_process_tests  ===================
[11:25:24] [PASSED] coalesce-same-reg
[11:25:24] [PASSED] no-match-no-add
[11:25:24] [PASSED] no-match-no-add-multiple-rules
[11:25:24] [PASSED] two-regs-two-entries
[11:25:24] [PASSED] clr-one-set-other
[11:25:24] [PASSED] set-field
[11:25:24] [PASSED] conflict-duplicate
[11:25:24] [PASSED] conflict-not-disjoint
[11:25:24] [PASSED] conflict-reg-type
[11:25:24] ============== [PASSED] xe_rtp_process_tests ===============
[11:25:24] ===================== [PASSED] xe_rtp ======================
[11:25:24] ==================== xe_wa (1 subtest) =====================
[11:25:24] ======================== xe_wa_gt  =========================
[11:25:24] [PASSED] TIGERLAKE (B0)
[11:25:24] [PASSED] DG1 (A0)
[11:25:24] [PASSED] DG1 (B0)
[11:25:24] [PASSED] ALDERLAKE_S (A0)
[11:25:24] [PASSED] ALDERLAKE_S (B0)
[11:25:24] [PASSED] ALDERLAKE_S (C0)
[11:25:24] [PASSED] ALDERLAKE_S (D0)
[11:25:24] [PASSED] ALDERLAKE_P (A0)
[11:25:24] [PASSED] ALDERLAKE_P (B0)
[11:25:24] [PASSED] ALDERLAKE_P (C0)
[11:25:24] [PASSED] DG2_G10 (A0)
[11:25:24] [PASSED] DG2_G10 (A1)
[11:25:24] [PASSED] DG2_G10 (B0)
[11:25:24] [PASSED] DG2_G10 (C0)
[11:25:24] [PASSED] DG2_G11 (A0)
[11:25:24] [PASSED] DG2_G11 (B0)
[11:25:24] [PASSED] DG2_G11 (B1)
[11:25:24] [PASSED] DG2_G12 (A0)
[11:25:24] [PASSED] DG2_G12 (A1)
[11:25:24] [PASSED] PVC (B0)
[11:25:24] [PASSED] PVC (B1)
[11:25:24] [PASSED] PVC (C0)
[11:25:24] ==================== [PASSED] xe_wa_gt =====================
[11:25:24] ====================== [PASSED] xe_wa ======================
[11:25:24] ============================================================
[11:25:24] Testing complete. Ran 37 tests: passed: 33, skipped: 4
[11:25:24] Elapsed time: 23.996s total, 4.205s configuring, 19.672s building, 0.102s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[11:25:24] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:25:26] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[11:25:45] Starting KUnit Kernel (1/1)...
[11:25:45] ============================================================
[11:25:45] ============ drm_test_pick_cmdline (2 subtests) ============
[11:25:45] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[11:25:45] =============== drm_test_pick_cmdline_named  ===============
[11:25:45] [PASSED] NTSC
[11:25:45] [PASSED] NTSC-J
[11:25:45] [PASSED] PAL
[11:25:45] [PASSED] PAL-M
[11:25:45] =========== [PASSED] drm_test_pick_cmdline_named ===========
[11:25:45] ============== [PASSED] drm_test_pick_cmdline ==============
[11:25:45] ================== drm_buddy (6 subtests) ==================
[11:25:45] [PASSED] drm_test_buddy_alloc_limit
[11:25:45] [PASSED] drm_test_buddy_alloc_range
[11:25:45] [PASSED] drm_test_buddy_alloc_optimistic
[11:25:45] [PASSED] drm_test_buddy_alloc_pessimistic
[11:25:45] [PASSED] drm_test_buddy_alloc_smoke
[11:25:45] [PASSED] drm_test_buddy_alloc_pathological
[11:25:45] ==================== [PASSED] drm_buddy ====================
[11:25:45] ============= drm_cmdline_parser (40 subtests) =============
[11:25:45] [PASSED] drm_test_cmdline_force_d_only
[11:25:45] [PASSED] drm_test_cmdline_force_D_only_dvi
[11:25:45] [PASSED] drm_test_cmdline_force_D_only_hdmi
[11:25:45] [PASSED] drm_test_cmdline_force_D_only_not_digital
[11:25:45] [PASSED] drm_test_cmdline_force_e_only
[11:25:45] [PASSED] drm_test_cmdline_res
[11:25:45] [PASSED] drm_test_cmdline_res_vesa
[11:25:45] [PASSED] drm_test_cmdline_res_vesa_rblank
[11:25:45] [PASSED] drm_test_cmdline_res_rblank
[11:25:45] [PASSED] drm_test_cmdline_res_bpp
[11:25:45] [PASSED] drm_test_cmdline_res_refresh
[11:25:45] [PASSED] drm_test_cmdline_res_bpp_refresh
[11:25:45] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[11:25:45] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[11:25:45] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[11:25:45] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[11:25:45] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[11:25:45] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[11:25:45] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[11:25:45] [PASSED] drm_test_cmdline_res_margins_force_on
[11:25:45] [PASSED] drm_test_cmdline_res_vesa_margins
[11:25:45] [PASSED] drm_test_cmdline_name
[11:25:45] [PASSED] drm_test_cmdline_name_bpp
[11:25:45] [PASSED] drm_test_cmdline_name_option
[11:25:45] [PASSED] drm_test_cmdline_name_bpp_option
[11:25:45] [PASSED] drm_test_cmdline_rotate_0
[11:25:45] [PASSED] drm_test_cmdline_rotate_90
[11:25:45] [PASSED] drm_test_cmdline_rotate_180
[11:25:45] [PASSED] drm_test_cmdline_rotate_270
[11:25:45] [PASSED] drm_test_cmdline_hmirror
[11:25:45] [PASSED] drm_test_cmdline_vmirror
[11:25:45] [PASSED] drm_test_cmdline_margin_options
[11:25:45] [PASSED] drm_test_cmdline_multiple_options
[11:25:45] [PASSED] drm_test_cmdline_bpp_extra_and_option
[11:25:45] [PASSED] drm_test_cmdline_extra_and_option
[11:25:45] [PASSED] drm_test_cmdline_freestanding_options
[11:25:45] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[11:25:45] [PASSED] drm_test_cmdline_panel_orientation
[11:25:45] ================ drm_test_cmdline_invalid  =================
[11:25:45] [PASSED] margin_only
[11:25:45] [PASSED] interlace_only
[11:25:45] [PASSED] res_missing_x
[11:25:45] [PASSED] res_missing_y
[11:25:45] [PASSED] res_bad_y
[11:25:45] [PASSED] res_missing_y_bpp
[11:25:45] [PASSED] res_bad_bpp
[11:25:45] [PASSED] res_bad_refresh
[11:25:45] [PASSED] res_bpp_refresh_force_on_off
[11:25:45] [PASSED] res_invalid_mode
[11:25:45] [PASSED] res_bpp_wrong_place_mode
[11:25:45] [PASSED] name_bpp_refresh
[11:25:45] [PASSED] name_refresh
[11:25:45] [PASSED] name_refresh_wrong_mode
[11:25:45] [PASSED] name_refresh_invalid_mode
[11:25:45] [PASSED] rotate_multiple
[11:25:45] [PASSED] rotate_invalid_val
[11:25:45] [PASSED] rotate_truncated
[11:25:45] [PASSED] invalid_option
[11:25:45] [PASSED] invalid_tv_option
[11:25:45] [PASSED] truncated_tv_option
[11:25:45] ============ [PASSED] drm_test_cmdline_invalid =============
[11:25:45] =============== drm_test_cmdline_tv_options  ===============
[11:25:45] [PASSED] NTSC
[11:25:45] [PASSED] NTSC_443
[11:25:45] [PASSED] NTSC_J
[11:25:45] [PASSED] PAL
[11:25:45] [PASSED] PAL_M
[11:25:45] [PASSED] PAL_N
[11:25:45] [PASSED] SECAM
[11:25:45] =========== [PASSED] drm_test_cmdline_tv_options ===========
[11:25:45] =============== [PASSED] drm_cmdline_parser ================
[11:25:45] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[11:25:45] ========== drm_test_get_tv_mode_from_name_valid  ===========
[11:25:45] [PASSED] NTSC
[11:25:45] [PASSED] NTSC-443
[11:25:45] [PASSED] NTSC-J
[11:25:45] [PASSED] PAL
[11:25:45] [PASSED] PAL-M
[11:25:45] [PASSED] PAL-N
[11:25:45] [PASSED] SECAM
[11:25:45] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[11:25:45] [PASSED] drm_test_get_tv_mode_from_name_truncated
[11:25:45] ============ [PASSED] drm_get_tv_mode_from_name ============
[11:25:45] ============= drm_damage_helper (21 subtests) ==============
[11:25:45] [PASSED] drm_test_damage_iter_no_damage
[11:25:45] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[11:25:45] [PASSED] drm_test_damage_iter_no_damage_src_moved
[11:25:45] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[11:25:45] [PASSED] drm_test_damage_iter_no_damage_not_visible
[11:25:45] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[11:25:45] [PASSED] drm_test_damage_iter_no_damage_no_fb
[11:25:45] [PASSED] drm_test_damage_iter_simple_damage
[11:25:45] [PASSED] drm_test_damage_iter_single_damage
[11:25:45] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[11:25:45] [PASSED] drm_test_damage_iter_single_damage_outside_src
[11:25:45] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[11:25:45] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[11:25:45] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[11:25:45] [PASSED] drm_test_damage_iter_single_damage_src_moved
[11:25:45] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[11:25:45] [PASSED] drm_test_damage_iter_damage
[11:25:45] [PASSED] drm_test_damage_iter_damage_one_intersect
[11:25:45] [PASSED] drm_test_damage_iter_damage_one_outside
[11:25:45] [PASSED] drm_test_damage_iter_damage_src_moved
[11:25:45] [PASSED] drm_test_damage_iter_damage_not_visible
[11:25:45] ================ [PASSED] drm_damage_helper ================
[11:25:45] ============== drm_dp_mst_helper (2 subtests) ==============
[11:25:45] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[11:25:45] [PASSED] Clock 154000 BPP 30 DSC disabled
[11:25:45] [PASSED] Clock 234000 BPP 30 DSC disabled
[11:25:45] [PASSED] Clock 297000 BPP 24 DSC disabled
[11:25:45] [PASSED] Clock 332880 BPP 24 DSC enabled
[11:25:45] [PASSED] Clock 324540 BPP 24 DSC enabled
[11:25:45] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[11:25:45] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[11:25:45] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[11:25:45] [PASSED] DP_POWER_UP_PHY with port number
[11:25:45] [PASSED] DP_POWER_DOWN_PHY with port number
[11:25:45] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[11:25:45] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[11:25:45] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[11:25:45] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[11:25:45] [PASSED] DP_QUERY_PAYLOAD with port number
[11:25:45] [PASSED] DP_QUERY_PAYLOAD with VCPI
[11:25:45] [PASSED] DP_REMOTE_DPCD_READ with port number
[11:25:45] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[11:25:45] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[11:25:45] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[11:25:45] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[11:25:45] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[11:25:45] [PASSED] DP_REMOTE_I2C_READ with port number
[11:25:45] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[11:25:45] [PASSED] DP_REMOTE_I2C_READ with transactions array
[11:25:45] [PASSED] DP_REMOTE_I2C_WRITE with port number
[11:25:45] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[11:25:45] [PASSED] DP_REMOTE_I2C_WRITE with data array
[11:25:45] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[11:25:45] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[11:25:45] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[11:25:45] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[11:25:45] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[11:25:45] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[11:25:45] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[11:25:45] ================ [PASSED] drm_dp_mst_helper ================
[11:25:45] =========== drm_format_helper_test (11 subtests) ===========
[11:25:45] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[11:25:45] [PASSED] single_pixel_source_buffer
[11:25:45] [PASSED] single_pixel_clip_rectangle
[11:25:45] [PASSED] well_known_colors
[11:25:45] [PASSED] destination_pitch
[11:25:45] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[11:25:45] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[11:25:45] [PASSED] single_pixel_source_buffer
[11:25:45] [PASSED] single_pixel_clip_rectangle
[11:25:45] [PASSED] well_known_colors
[11:25:45] [PASSED] destination_pitch
[11:25:45] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[11:25:45] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[11:25:45] [PASSED] single_pixel_source_buffer
[11:25:45] [PASSED] single_pixel_clip_rectangle
[11:25:45] [PASSED] well_known_colors
[11:25:45] [PASSED] destination_pitch
[11:25:45] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[11:25:45] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[11:25:45] [PASSED] single_pixel_source_buffer
[11:25:45] [PASSED] single_pixel_clip_rectangle
[11:25:45] [PASSED] well_known_colors
[11:25:45] [PASSED] destination_pitch
[11:25:45] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[11:25:45] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[11:25:45] [PASSED] single_pixel_source_buffer
[11:25:45] [PASSED] single_pixel_clip_rectangle
[11:25:45] [PASSED] well_known_colors
[11:25:45] [PASSED] destination_pitch
[11:25:45] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[11:25:45] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[11:25:45] [PASSED] single_pixel_source_buffer
[11:25:45] [PASSED] single_pixel_clip_rectangle
[11:25:45] [PASSED] well_known_colors
[11:25:45] [PASSED] destination_pitch
[11:25:45] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[11:25:45] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[11:25:45] [PASSED] single_pixel_source_buffer
[11:25:45] [PASSED] single_pixel_clip_rectangle
[11:25:45] [PASSED] well_known_colors
[11:25:45] [PASSED] destination_pitch
[11:25:45] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[11:25:45] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[11:25:45] [PASSED] single_pixel_source_buffer
[11:25:45] [PASSED] single_pixel_clip_rectangle
[11:25:45] [PASSED] well_known_colors
[11:25:45] [PASSED] destination_pitch
[11:25:45] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[11:25:45] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[11:25:45] [PASSED] single_pixel_source_buffer
[11:25:45] [PASSED] single_pixel_clip_rectangle
[11:25:45] [PASSED] well_known_colors
[11:25:45] [PASSED] destination_pitch
[11:25:45] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[11:25:45] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[11:25:45] [PASSED] single_pixel_source_buffer
[11:25:45] [PASSED] single_pixel_clip_rectangle
[11:25:45] [PASSED] well_known_colors
[11:25:45] [PASSED] destination_pitch
[11:25:45] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[11:25:45] ============== drm_test_fb_xrgb8888_to_mono  ===============
[11:25:45] [PASSED] single_pixel_source_buffer
[11:25:45] [PASSED] single_pixel_clip_rectangle
[11:25:45] [PASSED] well_known_colors
[11:25:45] [PASSED] destination_pitch
[11:25:45] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[11:25:45] ============= [PASSED] drm_format_helper_test ==============
[11:25:45] ================= drm_format (18 subtests) =================
[11:25:45] [PASSED] drm_test_format_block_width_invalid
[11:25:45] [PASSED] drm_test_format_block_width_one_plane
[11:25:45] [PASSED] drm_test_format_block_width_two_plane
[11:25:45] [PASSED] drm_test_format_block_width_three_plane
[11:25:45] [PASSED] drm_test_format_block_width_tiled
[11:25:45] [PASSED] drm_test_format_block_height_invalid
[11:25:45] [PASSED] drm_test_format_block_height_one_plane
[11:25:45] [PASSED] drm_test_format_block_height_two_plane
[11:25:45] [PASSED] drm_test_format_block_height_three_plane
[11:25:45] [PASSED] drm_test_format_block_height_tiled
[11:25:45] [PASSED] drm_test_format_min_pitch_invalid
[11:25:45] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[11:25:45] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[11:25:45] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[11:25:45] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[11:25:45] [PASSED] drm_test_format_min_pitch_two_plane
[11:25:45] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[11:25:45] [PASSED] drm_test_format_min_pitch_tiled
[11:25:45] =================== [PASSED] drm_format ====================
[11:25:45] =============== drm_framebuffer (1 subtest) ================
[11:25:45] =============== drm_test_framebuffer_create  ===============
[11:25:45] [PASSED] ABGR8888 normal sizes
[11:25:45] [PASSED] ABGR8888 max sizes
[11:25:45] [PASSED] ABGR8888 pitch greater than min required
[11:25:45] [PASSED] ABGR8888 pitch less than min required
[11:25:45] [PASSED] ABGR8888 Invalid width
[11:25:45] [PASSED] ABGR8888 Invalid buffer handle
[11:25:45] [PASSED] No pixel format
[11:25:45] [PASSED] ABGR8888 Width 0
[11:25:45] [PASSED] ABGR8888 Height 0
[11:25:45] [PASSED] ABGR8888 Out of bound height * pitch combination
[11:25:45] [PASSED] ABGR8888 Large buffer offset
[11:25:45] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[11:25:45] [PASSED] ABGR8888 Valid buffer modifier
[11:25:45] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[11:25:45] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[11:25:45] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[11:25:45] [PASSED] NV12 Normal sizes
[11:25:45] [PASSED] NV12 Max sizes
[11:25:45] [PASSED] NV12 Invalid pitch
[11:25:45] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[11:25:45] [PASSED] NV12 different  modifier per-plane
[11:25:45] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[11:25:45] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[11:25:45] [PASSED] NV12 Modifier for inexistent plane
[11:25:45] [PASSED] NV12 Handle for inexistent plane
[11:25:45] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[11:25:45] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[11:25:45] [PASSED] YVU420 Normal sizes
[11:25:45] [PASSED] YVU420 Max sizes
[11:25:45] [PASSED] YVU420 Invalid pitch
[11:25:45] [PASSED] YVU420 Different pitches
[11:25:45] [PASSED] YVU420 Different buffer offsets/pitches
[11:25:45] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[11:25:45] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[11:25:45] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[11:25:45] [PASSED] YVU420 Valid modifier
[11:25:45] [PASSED] YVU420 Different modifiers per plane
[11:25:45] [PASSED] YVU420 Modifier for inexistent plane
[11:25:45] [PASSED] X0L2 Normal sizes
[11:25:45] [PASSED] X0L2 Max sizes
[11:25:45] [PASSED] X0L2 Invalid pitch
[11:25:45] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[11:25:45] [PASSED] X0L2 Handle for inexistent plane
[11:25:45] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[11:25:45] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[11:25:45] [PASSED] X0L2 Valid modifier
[11:25:45] [PASSED] X0L2 Modifier for inexistent plane
[11:25:45] =========== [PASSED] drm_test_framebuffer_create ===========
[11:25:45] ================= [PASSED] drm_framebuffer =================
[11:25:45] =============== drm-test-managed (1 subtest) ===============
[11:25:45] [PASSED] drm_test_managed_run_action
[11:25:45] ================ [PASSED] drm-test-managed =================
[11:25:45] =================== drm_mm (19 subtests) ===================
[11:25:45] [PASSED] drm_test_mm_init
[11:25:45] [PASSED] drm_test_mm_debug
[11:25:56] [PASSED] drm_test_mm_reserve
[11:26:06] [PASSED] drm_test_mm_insert
[11:26:07] [PASSED] drm_test_mm_replace
[11:26:07] [PASSED] drm_test_mm_insert_range
[11:26:07] [PASSED] drm_test_mm_frag
[11:26:07] [PASSED] drm_test_mm_align
[11:26:07] [PASSED] drm_test_mm_align32
[11:26:07] [PASSED] drm_test_mm_align64
[11:26:07] [PASSED] drm_test_mm_evict
[11:26:07] [PASSED] drm_test_mm_evict_range
[11:26:07] [PASSED] drm_test_mm_topdown
[11:26:07] [PASSED] drm_test_mm_bottomup
[11:26:07] [PASSED] drm_test_mm_lowest
[11:26:07] [PASSED] drm_test_mm_highest
[11:26:08] [PASSED] drm_test_mm_color
[11:26:09] [PASSED] drm_test_mm_color_evict
[11:26:09] [PASSED] drm_test_mm_color_evict_range
[11:26:09] ===================== [PASSED] drm_mm ======================
[11:26:09] ============= drm_modes_analog_tv (4 subtests) =============
[11:26:09] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[11:26:09] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[11:26:09] [PASSED] drm_test_modes_analog_tv_pal_576i
[11:26:09] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[11:26:09] =============== [PASSED] drm_modes_analog_tv ===============
[11:26:09] ============== drm_plane_helper (2 subtests) ===============
[11:26:09] =============== drm_test_check_plane_state  ================
[11:26:09] [PASSED] clipping_simple
[11:26:09] [PASSED] clipping_rotate_reflect
[11:26:09] [PASSED] positioning_simple
[11:26:09] [PASSED] upscaling
[11:26:09] [PASSED] downscaling
[11:26:09] [PASSED] rounding1
[11:26:09] [PASSED] rounding2
[11:26:09] [PASSED] rounding3
[11:26:09] [PASSED] rounding4
[11:26:09] =========== [PASSED] drm_test_check_plane_state ============
[11:26:09] =========== drm_test_check_invalid_plane_state  ============
[11:26:09] [PASSED] positioning_invalid
[11:26:09] [PASSED] upscaling_invalid
[11:26:09] [PASSED] downscaling_invalid
[11:26:09] ======= [PASSED] drm_test_check_invalid_plane_state ========
[11:26:09] ================ [PASSED] drm_plane_helper =================
[11:26:09] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[11:26:09] ====== drm_test_connector_helper_tv_get_modes_check  =======
[11:26:09] [PASSED] None
[11:26:09] [PASSED] PAL
[11:26:09] [PASSED] NTSC
[11:26:09] [PASSED] Both, NTSC Default
[11:26:09] [PASSED] Both, PAL Default
[11:26:09] [PASSED] Both, NTSC Default, with PAL on command-line
[11:26:09] [PASSED] Both, PAL Default, with NTSC on command-line
[11:26:09] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[11:26:09] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[11:26:09] ================== drm_rect (9 subtests) ===================
[11:26:09] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[11:26:09] [PASSED] drm_test_rect_clip_scaled_not_clipped
[11:26:09] [PASSED] drm_test_rect_clip_scaled_clipped
[11:26:09] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[11:26:09] ================= drm_test_rect_intersect  =================
[11:26:09] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[11:26:09] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[11:26:09] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[11:26:09] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[11:26:09] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[11:26:09] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[11:26:09] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[11:26:09] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[11:26:09] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[11:26:09] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[11:26:09] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[11:26:09] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[11:26:09] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[11:26:09] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[11:26:09] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[11:26:09] ============= [PASSED] drm_test_rect_intersect =============
[11:26:09] ================ drm_test_rect_calc_hscale  ================
[11:26:09] [PASSED] normal use
[11:26:09] [PASSED] out of max range
[11:26:09] [PASSED] out of min range
[11:26:09] [PASSED] zero dst
[11:26:09] [PASSED] negative src
[11:26:09] [PASSED] negative dst
[11:26:09] ============ [PASSED] drm_test_rect_calc_hscale ============
[11:26:09] ================ drm_test_rect_calc_vscale  ================
[11:26:09] [PASSED] normal use
[11:26:09] [PASSED] out of max range
[11:26:09] [PASSED] out of min range
[11:26:09] [PASSED] zero dst
[11:26:09] [PASSED] negative src
[11:26:09] [PASSED] negative dst
[11:26:09] ============ [PASSED] drm_test_rect_calc_vscale ============
[11:26:09] ================== drm_test_rect_rotate  ===================
[11:26:09] [PASSED] reflect-x
[11:26:09] [PASSED] reflect-y
[11:26:09] [PASSED] rotate-0
[11:26:09] [PASSED] rotate-90
[11:26:09] [PASSED] rotate-180
[11:26:09] [PASSED] rotate-270
[11:26:09] ============== [PASSED] drm_test_rect_rotate ===============
[11:26:09] ================ drm_test_rect_rotate_inv  =================
[11:26:09] [PASSED] reflect-x
[11:26:09] [PASSED] reflect-y
[11:26:09] [PASSED] rotate-0
[11:26:09] [PASSED] rotate-90
[11:26:09] [PASSED] rotate-180
[11:26:09] [PASSED] rotate-270
[11:26:09] ============ [PASSED] drm_test_rect_rotate_inv =============
[11:26:09] ==================== [PASSED] drm_rect =====================
[11:26:09] ================== drm_exec (7 subtests) ===================
[11:26:09] [PASSED] sanitycheck
[11:26:09] [PASSED] test_lock
[11:26:09] [PASSED] test_lock_unlock
[11:26:09] [PASSED] test_duplicates
[11:26:09] [PASSED] test_prepare
[11:26:09] [PASSED] test_prepare_array
[11:26:09] [PASSED] test_multiple_loops
[11:26:09] ==================== [PASSED] drm_exec =====================
[11:26:09] ============================================================
[11:26:09] Testing complete. Ran 340 tests: passed: 340
[11:26:09] Elapsed time: 44.316s total, 1.672s configuring, 19.214s building, 23.411s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


