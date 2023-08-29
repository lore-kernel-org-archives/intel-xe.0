Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9E6C71153
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 18:42:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38E110E479;
	Tue, 29 Aug 2023 18:42:20 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D08DD10E479;
 Tue, 29 Aug 2023 18:42:19 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CC6F4A02F0;
 Tue, 29 Aug 2023 18:42:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pallavi Mishra" <pallavi.mishra@intel.com>
Date: Tue, 29 Aug 2023 18:42:19 -0000
Message-ID: <169333453983.16745.15876019645898329233@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230829181335.779696-1-pallavi.mishra@intel.com>
In-Reply-To: <20230829181335.779696-1-pallavi.mishra@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe?=
 =?utf-8?q?=3A_Prevent_return_with_locked_vm?=
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

Series: drm/xe: Prevent return with locked vm
URL   : https://patchwork.freedesktop.org/series/123031/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[18:41:08] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:41:12] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[18:41:32] Starting KUnit Kernel (1/1)...
[18:41:32] ============================================================
[18:41:32] ==================== xe_bo (2 subtests) ====================
[18:41:32] [SKIPPED] xe_ccs_migrate_kunit
[18:41:32] [SKIPPED] xe_bo_evict_kunit
[18:41:32] ===================== [SKIPPED] xe_bo ======================
[18:41:32] ================== xe_dma_buf (1 subtest) ==================
[18:41:32] [SKIPPED] xe_dma_buf_kunit
[18:41:32] =================== [SKIPPED] xe_dma_buf ===================
[18:41:32] ================== xe_migrate (1 subtest) ==================
[18:41:32] [SKIPPED] xe_migrate_sanity_kunit
[18:41:32] =================== [SKIPPED] xe_migrate ===================
[18:41:32] =================== xe_pci (2 subtests) ====================
[18:41:32] [PASSED] xe_gmdid_graphics_ip
[18:41:32] [PASSED] xe_gmdid_media_ip
[18:41:32] ===================== [PASSED] xe_pci ======================
[18:41:32] ==================== xe_rtp (1 subtest) ====================
[18:41:32] ================== xe_rtp_process_tests  ===================
[18:41:32] [PASSED] coalesce-same-reg
[18:41:32] [PASSED] no-match-no-add
[18:41:32] [PASSED] no-match-no-add-multiple-rules
[18:41:32] [PASSED] two-regs-two-entries
[18:41:32] [PASSED] clr-one-set-other
[18:41:32] [PASSED] set-field
[18:41:32] [PASSED] conflict-duplicate
[18:41:32] [PASSED] conflict-not-disjoint
[18:41:32] [PASSED] conflict-reg-type
[18:41:32] ============== [PASSED] xe_rtp_process_tests ===============
[18:41:32] ===================== [PASSED] xe_rtp ======================
[18:41:32] ==================== xe_wa (1 subtest) =====================
[18:41:32] ======================== xe_wa_gt  =========================
[18:41:32] [PASSED] TIGERLAKE (B0)
[18:41:32] [PASSED] DG1 (A0)
[18:41:32] [PASSED] DG1 (B0)
[18:41:32] [PASSED] ALDERLAKE_S (A0)
[18:41:32] [PASSED] ALDERLAKE_S (B0)
[18:41:32] [PASSED] ALDERLAKE_S (C0)
[18:41:32] [PASSED] ALDERLAKE_S (D0)
[18:41:32] [PASSED] ALDERLAKE_P (A0)
[18:41:32] [PASSED] ALDERLAKE_P (B0)
[18:41:32] [PASSED] ALDERLAKE_P (C0)
[18:41:32] [PASSED] DG2_G10 (A0)
[18:41:32] [PASSED] DG2_G10 (A1)
[18:41:32] [PASSED] DG2_G10 (B0)
[18:41:32] [PASSED] DG2_G10 (C0)
[18:41:32] [PASSED] DG2_G11 (A0)
[18:41:32] [PASSED] DG2_G11 (B0)
[18:41:32] [PASSED] DG2_G11 (B1)
[18:41:32] [PASSED] DG2_G12 (A0)
[18:41:32] [PASSED] DG2_G12 (A1)
[18:41:32] [PASSED] PVC (B0)
[18:41:32] [PASSED] PVC (B1)
[18:41:32] [PASSED] PVC (C0)
[18:41:32] ==================== [PASSED] xe_wa_gt =====================
[18:41:32] ====================== [PASSED] xe_wa ======================
[18:41:32] ============================================================
[18:41:32] Testing complete. Ran 37 tests: passed: 33, skipped: 4
[18:41:32] Elapsed time: 24.094s total, 4.245s configuring, 19.730s building, 0.097s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[18:41:32] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:41:34] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[18:41:53] Starting KUnit Kernel (1/1)...
[18:41:53] ============================================================
[18:41:53] ============ drm_test_pick_cmdline (2 subtests) ============
[18:41:53] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[18:41:53] =============== drm_test_pick_cmdline_named  ===============
[18:41:53] [PASSED] NTSC
[18:41:53] [PASSED] NTSC-J
[18:41:53] [PASSED] PAL
[18:41:53] [PASSED] PAL-M
[18:41:53] =========== [PASSED] drm_test_pick_cmdline_named ===========
[18:41:53] ============== [PASSED] drm_test_pick_cmdline ==============
[18:41:53] ================== drm_buddy (6 subtests) ==================
[18:41:53] [PASSED] drm_test_buddy_alloc_limit
[18:41:53] [PASSED] drm_test_buddy_alloc_range
[18:41:53] [PASSED] drm_test_buddy_alloc_optimistic
[18:41:53] [PASSED] drm_test_buddy_alloc_pessimistic
[18:41:53] [PASSED] drm_test_buddy_alloc_smoke
[18:41:53] [PASSED] drm_test_buddy_alloc_pathological
[18:41:53] ==================== [PASSED] drm_buddy ====================
[18:41:53] ============= drm_cmdline_parser (40 subtests) =============
[18:41:53] [PASSED] drm_test_cmdline_force_d_only
[18:41:53] [PASSED] drm_test_cmdline_force_D_only_dvi
[18:41:53] [PASSED] drm_test_cmdline_force_D_only_hdmi
[18:41:53] [PASSED] drm_test_cmdline_force_D_only_not_digital
[18:41:53] [PASSED] drm_test_cmdline_force_e_only
[18:41:53] [PASSED] drm_test_cmdline_res
[18:41:53] [PASSED] drm_test_cmdline_res_vesa
[18:41:53] [PASSED] drm_test_cmdline_res_vesa_rblank
[18:41:53] [PASSED] drm_test_cmdline_res_rblank
[18:41:53] [PASSED] drm_test_cmdline_res_bpp
[18:41:53] [PASSED] drm_test_cmdline_res_refresh
[18:41:53] [PASSED] drm_test_cmdline_res_bpp_refresh
[18:41:53] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[18:41:53] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[18:41:53] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[18:41:53] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[18:41:53] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[18:41:53] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[18:41:53] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[18:41:53] [PASSED] drm_test_cmdline_res_margins_force_on
[18:41:53] [PASSED] drm_test_cmdline_res_vesa_margins
[18:41:53] [PASSED] drm_test_cmdline_name
[18:41:53] [PASSED] drm_test_cmdline_name_bpp
[18:41:53] [PASSED] drm_test_cmdline_name_option
[18:41:53] [PASSED] drm_test_cmdline_name_bpp_option
[18:41:53] [PASSED] drm_test_cmdline_rotate_0
[18:41:53] [PASSED] drm_test_cmdline_rotate_90
[18:41:53] [PASSED] drm_test_cmdline_rotate_180
[18:41:53] [PASSED] drm_test_cmdline_rotate_270
[18:41:53] [PASSED] drm_test_cmdline_hmirror
[18:41:53] [PASSED] drm_test_cmdline_vmirror
[18:41:53] [PASSED] drm_test_cmdline_margin_options
[18:41:53] [PASSED] drm_test_cmdline_multiple_options
[18:41:53] [PASSED] drm_test_cmdline_bpp_extra_and_option
[18:41:53] [PASSED] drm_test_cmdline_extra_and_option
[18:41:53] [PASSED] drm_test_cmdline_freestanding_options
[18:41:53] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[18:41:53] [PASSED] drm_test_cmdline_panel_orientation
[18:41:53] ================ drm_test_cmdline_invalid  =================
[18:41:53] [PASSED] margin_only
[18:41:53] [PASSED] interlace_only
[18:41:53] [PASSED] res_missing_x
[18:41:53] [PASSED] res_missing_y
[18:41:53] [PASSED] res_bad_y
[18:41:53] [PASSED] res_missing_y_bpp
[18:41:53] [PASSED] res_bad_bpp
[18:41:53] [PASSED] res_bad_refresh
[18:41:53] [PASSED] res_bpp_refresh_force_on_off
[18:41:53] [PASSED] res_invalid_mode
[18:41:53] [PASSED] res_bpp_wrong_place_mode
[18:41:53] [PASSED] name_bpp_refresh
[18:41:53] [PASSED] name_refresh
[18:41:53] [PASSED] name_refresh_wrong_mode
[18:41:53] [PASSED] name_refresh_invalid_mode
[18:41:53] [PASSED] rotate_multiple
[18:41:53] [PASSED] rotate_invalid_val
[18:41:53] [PASSED] rotate_truncated
[18:41:53] [PASSED] invalid_option
[18:41:53] [PASSED] invalid_tv_option
[18:41:53] [PASSED] truncated_tv_option
[18:41:53] ============ [PASSED] drm_test_cmdline_invalid =============
[18:41:53] =============== drm_test_cmdline_tv_options  ===============
[18:41:53] [PASSED] NTSC
[18:41:53] [PASSED] NTSC_443
[18:41:53] [PASSED] NTSC_J
[18:41:53] [PASSED] PAL
[18:41:53] [PASSED] PAL_M
[18:41:53] [PASSED] PAL_N
[18:41:53] [PASSED] SECAM
[18:41:53] =========== [PASSED] drm_test_cmdline_tv_options ===========
[18:41:53] =============== [PASSED] drm_cmdline_parser ================
[18:41:53] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[18:41:53] ========== drm_test_get_tv_mode_from_name_valid  ===========
[18:41:53] [PASSED] NTSC
[18:41:53] [PASSED] NTSC-443
[18:41:53] [PASSED] NTSC-J
[18:41:53] [PASSED] PAL
[18:41:53] [PASSED] PAL-M
[18:41:53] [PASSED] PAL-N
[18:41:53] [PASSED] SECAM
[18:41:53] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[18:41:53] [PASSED] drm_test_get_tv_mode_from_name_truncated
[18:41:53] ============ [PASSED] drm_get_tv_mode_from_name ============
[18:41:53] ============= drm_damage_helper (21 subtests) ==============
[18:41:53] [PASSED] drm_test_damage_iter_no_damage
[18:41:53] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[18:41:53] [PASSED] drm_test_damage_iter_no_damage_src_moved
[18:41:53] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[18:41:53] [PASSED] drm_test_damage_iter_no_damage_not_visible
[18:41:53] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[18:41:53] [PASSED] drm_test_damage_iter_no_damage_no_fb
[18:41:53] [PASSED] drm_test_damage_iter_simple_damage
[18:41:53] [PASSED] drm_test_damage_iter_single_damage
[18:41:53] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[18:41:53] [PASSED] drm_test_damage_iter_single_damage_outside_src
[18:41:53] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[18:41:53] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[18:41:53] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[18:41:53] [PASSED] drm_test_damage_iter_single_damage_src_moved
[18:41:53] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[18:41:53] [PASSED] drm_test_damage_iter_damage
[18:41:53] [PASSED] drm_test_damage_iter_damage_one_intersect
[18:41:53] [PASSED] drm_test_damage_iter_damage_one_outside
[18:41:53] [PASSED] drm_test_damage_iter_damage_src_moved
[18:41:53] [PASSED] drm_test_damage_iter_damage_not_visible
[18:41:53] ================ [PASSED] drm_damage_helper ================
[18:41:53] ============== drm_dp_mst_helper (2 subtests) ==============
[18:41:53] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[18:41:53] [PASSED] Clock 154000 BPP 30 DSC disabled
[18:41:53] [PASSED] Clock 234000 BPP 30 DSC disabled
[18:41:53] [PASSED] Clock 297000 BPP 24 DSC disabled
[18:41:53] [PASSED] Clock 332880 BPP 24 DSC enabled
[18:41:53] [PASSED] Clock 324540 BPP 24 DSC enabled
[18:41:53] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[18:41:53] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[18:41:53] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[18:41:53] [PASSED] DP_POWER_UP_PHY with port number
[18:41:53] [PASSED] DP_POWER_DOWN_PHY with port number
[18:41:53] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[18:41:53] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[18:41:53] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[18:41:53] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[18:41:53] [PASSED] DP_QUERY_PAYLOAD with port number
[18:41:53] [PASSED] DP_QUERY_PAYLOAD with VCPI
[18:41:53] [PASSED] DP_REMOTE_DPCD_READ with port number
[18:41:53] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[18:41:53] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[18:41:53] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[18:41:53] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[18:41:53] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[18:41:53] [PASSED] DP_REMOTE_I2C_READ with port number
[18:41:53] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[18:41:53] [PASSED] DP_REMOTE_I2C_READ with transactions array
[18:41:53] [PASSED] DP_REMOTE_I2C_WRITE with port number
[18:41:53] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[18:41:53] [PASSED] DP_REMOTE_I2C_WRITE with data array
[18:41:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[18:41:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[18:41:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[18:41:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[18:41:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[18:41:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[18:41:53] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[18:41:53] ================ [PASSED] drm_dp_mst_helper ================
[18:41:53] =========== drm_format_helper_test (11 subtests) ===========
[18:41:53] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[18:41:53] [PASSED] single_pixel_source_buffer
[18:41:53] [PASSED] single_pixel_clip_rectangle
[18:41:53] [PASSED] well_known_colors
[18:41:53] [PASSED] destination_pitch
[18:41:53] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[18:41:53] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[18:41:53] [PASSED] single_pixel_source_buffer
[18:41:53] [PASSED] single_pixel_clip_rectangle
[18:41:53] [PASSED] well_known_colors
[18:41:53] [PASSED] destination_pitch
[18:41:53] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[18:41:53] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[18:41:53] [PASSED] single_pixel_source_buffer
[18:41:53] [PASSED] single_pixel_clip_rectangle
[18:41:53] [PASSED] well_known_colors
[18:41:53] [PASSED] destination_pitch
[18:41:53] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[18:41:53] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[18:41:53] [PASSED] single_pixel_source_buffer
[18:41:53] [PASSED] single_pixel_clip_rectangle
[18:41:53] [PASSED] well_known_colors
[18:41:53] [PASSED] destination_pitch
[18:41:53] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[18:41:53] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[18:41:53] [PASSED] single_pixel_source_buffer
[18:41:53] [PASSED] single_pixel_clip_rectangle
[18:41:53] [PASSED] well_known_colors
[18:41:53] [PASSED] destination_pitch
[18:41:53] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[18:41:53] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[18:41:53] [PASSED] single_pixel_source_buffer
[18:41:53] [PASSED] single_pixel_clip_rectangle
[18:41:53] [PASSED] well_known_colors
[18:41:53] [PASSED] destination_pitch
[18:41:53] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[18:41:53] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[18:41:53] [PASSED] single_pixel_source_buffer
[18:41:53] [PASSED] single_pixel_clip_rectangle
[18:41:53] [PASSED] well_known_colors
[18:41:53] [PASSED] destination_pitch
[18:41:53] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[18:41:53] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[18:41:53] [PASSED] single_pixel_source_buffer
[18:41:53] [PASSED] single_pixel_clip_rectangle
[18:41:53] [PASSED] well_known_colors
[18:41:53] [PASSED] destination_pitch
[18:41:53] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[18:41:53] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[18:41:53] [PASSED] single_pixel_source_buffer
[18:41:53] [PASSED] single_pixel_clip_rectangle
[18:41:53] [PASSED] well_known_colors
[18:41:53] [PASSED] destination_pitch
[18:41:53] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[18:41:53] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[18:41:53] [PASSED] single_pixel_source_buffer
[18:41:53] [PASSED] single_pixel_clip_rectangle
[18:41:53] [PASSED] well_known_colors
[18:41:53] [PASSED] destination_pitch
[18:41:53] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[18:41:53] ============== drm_test_fb_xrgb8888_to_mono  ===============
[18:41:53] [PASSED] single_pixel_source_buffer
[18:41:53] [PASSED] single_pixel_clip_rectangle
[18:41:53] [PASSED] well_known_colors
[18:41:53] [PASSED] destination_pitch
[18:41:53] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[18:41:53] ============= [PASSED] drm_format_helper_test ==============
[18:41:53] ================= drm_format (18 subtests) =================
[18:41:53] [PASSED] drm_test_format_block_width_invalid
[18:41:53] [PASSED] drm_test_format_block_width_one_plane
[18:41:53] [PASSED] drm_test_format_block_width_two_plane
[18:41:53] [PASSED] drm_test_format_block_width_three_plane
[18:41:53] [PASSED] drm_test_format_block_width_tiled
[18:41:53] [PASSED] drm_test_format_block_height_invalid
[18:41:53] [PASSED] drm_test_format_block_height_one_plane
[18:41:53] [PASSED] drm_test_format_block_height_two_plane
[18:41:53] [PASSED] drm_test_format_block_height_three_plane
[18:41:53] [PASSED] drm_test_format_block_height_tiled
[18:41:53] [PASSED] drm_test_format_min_pitch_invalid
[18:41:53] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[18:41:53] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[18:41:53] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[18:41:53] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[18:41:53] [PASSED] drm_test_format_min_pitch_two_plane
[18:41:53] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[18:41:53] [PASSED] drm_test_format_min_pitch_tiled
[18:41:53] =================== [PASSED] drm_format ====================
[18:41:53] =============== drm_framebuffer (1 subtest) ================
[18:41:53] =============== drm_test_framebuffer_create  ===============
[18:41:53] [PASSED] ABGR8888 normal sizes
[18:41:53] [PASSED] ABGR8888 max sizes
[18:41:53] [PASSED] ABGR8888 pitch greater than min required
[18:41:53] [PASSED] ABGR8888 pitch less than min required
[18:41:53] [PASSED] ABGR8888 Invalid width
[18:41:53] [PASSED] ABGR8888 Invalid buffer handle
[18:41:53] [PASSED] No pixel format
[18:41:53] [PASSED] ABGR8888 Width 0
[18:41:53] [PASSED] ABGR8888 Height 0
[18:41:53] [PASSED] ABGR8888 Out of bound height * pitch combination
[18:41:53] [PASSED] ABGR8888 Large buffer offset
[18:41:53] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[18:41:53] [PASSED] ABGR8888 Valid buffer modifier
[18:41:53] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[18:41:53] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[18:41:53] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[18:41:53] [PASSED] NV12 Normal sizes
[18:41:53] [PASSED] NV12 Max sizes
[18:41:53] [PASSED] NV12 Invalid pitch
[18:41:53] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[18:41:53] [PASSED] NV12 different  modifier per-plane
[18:41:53] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[18:41:53] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[18:41:53] [PASSED] NV12 Modifier for inexistent plane
[18:41:53] [PASSED] NV12 Handle for inexistent plane
[18:41:53] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[18:41:53] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[18:41:53] [PASSED] YVU420 Normal sizes
[18:41:53] [PASSED] YVU420 Max sizes
[18:41:53] [PASSED] YVU420 Invalid pitch
[18:41:53] [PASSED] YVU420 Different pitches
[18:41:53] [PASSED] YVU420 Different buffer offsets/pitches
[18:41:53] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[18:41:53] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[18:41:53] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[18:41:53] [PASSED] YVU420 Valid modifier
[18:41:53] [PASSED] YVU420 Different modifiers per plane
[18:41:53] [PASSED] YVU420 Modifier for inexistent plane
[18:41:53] [PASSED] X0L2 Normal sizes
[18:41:53] [PASSED] X0L2 Max sizes
[18:41:53] [PASSED] X0L2 Invalid pitch
[18:41:53] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[18:41:53] [PASSED] X0L2 Handle for inexistent plane
[18:41:53] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[18:41:53] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[18:41:53] [PASSED] X0L2 Valid modifier
[18:41:53] [PASSED] X0L2 Modifier for inexistent plane
[18:41:53] =========== [PASSED] drm_test_framebuffer_create ===========
[18:41:53] ================= [PASSED] drm_framebuffer =================
[18:41:53] =============== drm-test-managed (1 subtest) ===============
[18:41:53] [PASSED] drm_test_managed_run_action
[18:41:53] ================ [PASSED] drm-test-managed =================
[18:41:53] =================== drm_mm (19 subtests) ===================
[18:41:53] [PASSED] drm_test_mm_init
[18:41:53] [PASSED] drm_test_mm_debug
[18:42:03] [PASSED] drm_test_mm_reserve
[18:42:13] [PASSED] drm_test_mm_insert
[18:42:14] [PASSED] drm_test_mm_replace
[18:42:14] [PASSED] drm_test_mm_insert_range
[18:42:14] [PASSED] drm_test_mm_frag
[18:42:14] [PASSED] drm_test_mm_align
[18:42:14] [PASSED] drm_test_mm_align32
[18:42:14] [PASSED] drm_test_mm_align64
[18:42:15] [PASSED] drm_test_mm_evict
[18:42:15] [PASSED] drm_test_mm_evict_range
[18:42:15] [PASSED] drm_test_mm_topdown
[18:42:15] [PASSED] drm_test_mm_bottomup
[18:42:15] [PASSED] drm_test_mm_lowest
[18:42:15] [PASSED] drm_test_mm_highest
[18:42:15] [PASSED] drm_test_mm_color
[18:42:16] [PASSED] drm_test_mm_color_evict
[18:42:16] [PASSED] drm_test_mm_color_evict_range
[18:42:16] ===================== [PASSED] drm_mm ======================
[18:42:16] ============= drm_modes_analog_tv (4 subtests) =============
[18:42:16] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[18:42:16] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[18:42:16] [PASSED] drm_test_modes_analog_tv_pal_576i
[18:42:16] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[18:42:16] =============== [PASSED] drm_modes_analog_tv ===============
[18:42:16] ============== drm_plane_helper (2 subtests) ===============
[18:42:16] =============== drm_test_check_plane_state  ================
[18:42:16] [PASSED] clipping_simple
[18:42:16] [PASSED] clipping_rotate_reflect
[18:42:16] [PASSED] positioning_simple
[18:42:16] [PASSED] upscaling
[18:42:16] [PASSED] downscaling
[18:42:16] [PASSED] rounding1
[18:42:16] [PASSED] rounding2
[18:42:16] [PASSED] rounding3
[18:42:16] [PASSED] rounding4
[18:42:16] =========== [PASSED] drm_test_check_plane_state ============
[18:42:16] =========== drm_test_check_invalid_plane_state  ============
[18:42:16] [PASSED] positioning_invalid
[18:42:16] [PASSED] upscaling_invalid
[18:42:16] [PASSED] downscaling_invalid
[18:42:16] ======= [PASSED] drm_test_check_invalid_plane_state ========
[18:42:16] ================ [PASSED] drm_plane_helper =================
[18:42:16] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[18:42:16] ====== drm_test_connector_helper_tv_get_modes_check  =======
[18:42:16] [PASSED] None
[18:42:16] [PASSED] PAL
[18:42:16] [PASSED] NTSC
[18:42:16] [PASSED] Both, NTSC Default
[18:42:16] [PASSED] Both, PAL Default
[18:42:16] [PASSED] Both, NTSC Default, with PAL on command-line
[18:42:16] [PASSED] Both, PAL Default, with NTSC on command-line
[18:42:16] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[18:42:16] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[18:42:16] ================== drm_rect (9 subtests) ===================
[18:42:16] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[18:42:16] [PASSED] drm_test_rect_clip_scaled_not_clipped
[18:42:16] [PASSED] drm_test_rect_clip_scaled_clipped
[18:42:16] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[18:42:16] ================= drm_test_rect_intersect  =================
[18:42:16] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[18:42:16] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[18:42:16] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[18:42:16] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[18:42:16] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[18:42:16] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[18:42:16] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[18:42:16] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[18:42:16] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[18:42:16] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[18:42:16] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[18:42:16] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[18:42:16] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[18:42:16] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[18:42:16] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[18:42:16] ============= [PASSED] drm_test_rect_intersect =============
[18:42:16] ================ drm_test_rect_calc_hscale  ================
[18:42:16] [PASSED] normal use
[18:42:16] [PASSED] out of max range
[18:42:16] [PASSED] out of min range
[18:42:16] [PASSED] zero dst
[18:42:16] [PASSED] negative src
[18:42:16] [PASSED] negative dst
[18:42:16] ============ [PASSED] drm_test_rect_calc_hscale ============
[18:42:16] ================ drm_test_rect_calc_vscale  ================
[18:42:16] [PASSED] normal use
[18:42:16] [PASSED] out of max range
[18:42:16] [PASSED] out of min range
[18:42:16] [PASSED] zero dst
[18:42:16] [PASSED] negative src
[18:42:16] [PASSED] negative dst
[18:42:16] ============ [PASSED] drm_test_rect_calc_vscale ============
[18:42:16] ================== drm_test_rect_rotate  ===================
[18:42:16] [PASSED] reflect-x
[18:42:16] [PASSED] reflect-y
[18:42:16] [PASSED] rotate-0
[18:42:16] [PASSED] rotate-90
[18:42:16] [PASSED] rotate-180
[18:42:16] [PASSED] rotate-270
[18:42:16] ============== [PASSED] drm_test_rect_rotate ===============
[18:42:16] ================ drm_test_rect_rotate_inv  =================
[18:42:16] [PASSED] reflect-x
[18:42:16] [PASSED] reflect-y
[18:42:16] [PASSED] rotate-0
[18:42:16] [PASSED] rotate-90
[18:42:16] [PASSED] rotate-180
[18:42:16] [PASSED] rotate-270
[18:42:16] ============ [PASSED] drm_test_rect_rotate_inv =============
[18:42:16] ==================== [PASSED] drm_rect =====================
[18:42:16] ================== drm_exec (7 subtests) ===================
[18:42:16] [PASSED] sanitycheck
[18:42:16] [PASSED] test_lock
[18:42:16] [PASSED] test_lock_unlock
[18:42:16] [PASSED] test_duplicates
[18:42:16] [PASSED] test_prepare
[18:42:16] [PASSED] test_prepare_array
[18:42:16] [PASSED] test_multiple_loops
[18:42:16] ==================== [PASSED] drm_exec =====================
[18:42:16] ============================================================
[18:42:16] Testing complete. Ran 340 tests: passed: 340
[18:42:16] Elapsed time: 43.928s total, 1.668s configuring, 18.879s building, 23.355s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


