Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCD5C77B7A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 11:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E296110E4B2;
	Wed,  7 Jun 2023 11:16:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5806310E010;
 Wed,  7 Jun 2023 11:16:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5466CAADD7;
 Wed,  7 Jun 2023 11:16:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Date: Wed, 07 Jun 2023 11:16:29 -0000
Message-ID: <168613658934.21180.18332883404220857741@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230607110328.3739706-1-anshuman.gupta@intel.com>
In-Reply-To: <20230607110328.3739706-1-anshuman.gupta@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_D3Cold_?=
 =?utf-8?q?Policy_=28rev2=29?=
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

Series: D3Cold Policy (rev2)
URL   : https://patchwork.freedesktop.org/series/118035/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[11:15:17] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:15:22] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[11:15:43] Starting KUnit Kernel (1/1)...
[11:15:43] ============================================================
[11:15:44] ==================== xe_bo (2 subtests) ====================
[11:15:44] [SKIPPED] xe_ccs_migrate_kunit
[11:15:44] [SKIPPED] xe_bo_evict_kunit
[11:15:44] ===================== [SKIPPED] xe_bo ======================
[11:15:44] ================== xe_dma_buf (1 subtest) ==================
[11:15:44] [SKIPPED] xe_dma_buf_kunit
[11:15:44] =================== [SKIPPED] xe_dma_buf ===================
[11:15:44] ================== xe_migrate (1 subtest) ==================
[11:15:44] [SKIPPED] xe_migrate_sanity_kunit
[11:15:44] =================== [SKIPPED] xe_migrate ===================
[11:15:44] =================== xe_pci (2 subtests) ====================
[11:15:44] [PASSED] xe_gmdid_graphics_ip
[11:15:44] [PASSED] xe_gmdid_media_ip
[11:15:44] ===================== [PASSED] xe_pci ======================
[11:15:44] ==================== xe_rtp (1 subtest) ====================
[11:15:44] ================== xe_rtp_process_tests  ===================
[11:15:44] [PASSED] coalesce-same-reg
[11:15:44] [PASSED] no-match-no-add
[11:15:44] [PASSED] no-match-no-add-multiple-rules
[11:15:44] [PASSED] two-regs-two-entries
[11:15:44] [PASSED] clr-one-set-other
[11:15:44] [PASSED] set-field
[11:15:44] [PASSED] conflict-duplicate
[11:15:44] [PASSED] conflict-not-disjoint
[11:15:44] [PASSED] conflict-reg-type
[11:15:44] ============== [PASSED] xe_rtp_process_tests ===============
[11:15:44] ===================== [PASSED] xe_rtp ======================
[11:15:44] ==================== xe_wa (1 subtest) =====================
[11:15:44] ======================== xe_wa_gt  =========================
[11:15:44] [PASSED] TIGERLAKE (B0)
[11:15:44] [PASSED] DG1 (A0)
[11:15:44] [PASSED] DG1 (B0)
[11:15:44] [PASSED] ALDERLAKE_S (A0)
[11:15:44] [PASSED] ALDERLAKE_S (B0)
[11:15:44] [PASSED] ALDERLAKE_S (C0)
[11:15:44] [PASSED] ALDERLAKE_S (D0)
[11:15:44] [PASSED] DG2_G10 (A0)
[11:15:44] [PASSED] DG2_G10 (A1)
[11:15:44] [PASSED] DG2_G10 (B0)
[11:15:44] [PASSED] DG2_G10 (C0)
[11:15:44] [PASSED] DG2_G11 (A0)
[11:15:44] [PASSED] DG2_G11 (B0)
[11:15:44] [PASSED] DG2_G11 (B1)
[11:15:44] [PASSED] DG2_G12 (A0)
[11:15:44] [PASSED] DG2_G12 (A1)
[11:15:44] [PASSED] PVC (B0)
[11:15:44] [PASSED] PVC (B1)
[11:15:44] [PASSED] PVC (C0)
[11:15:44] ==================== [PASSED] xe_wa_gt =====================
[11:15:44] ====================== [PASSED] xe_wa ======================
[11:15:44] ============================================================
[11:15:44] Testing complete. Ran 34 tests: passed: 30, skipped: 4
[11:15:44] Elapsed time: 26.237s total, 4.206s configuring, 21.862s building, 0.151s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[11:15:44] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:15:45] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[11:16:04] Starting KUnit Kernel (1/1)...
[11:16:04] ============================================================
[11:16:04] ============ drm_test_pick_cmdline (2 subtests) ============
[11:16:04] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[11:16:04] =============== drm_test_pick_cmdline_named  ===============
[11:16:04] [PASSED] NTSC
[11:16:04] [PASSED] NTSC-J
[11:16:04] [PASSED] PAL
[11:16:04] [PASSED] PAL-M
[11:16:04] =========== [PASSED] drm_test_pick_cmdline_named ===========
[11:16:04] ============== [PASSED] drm_test_pick_cmdline ==============
[11:16:04] ================== drm_buddy (6 subtests) ==================
[11:16:04] [PASSED] drm_test_buddy_alloc_limit
[11:16:04] [PASSED] drm_test_buddy_alloc_range
[11:16:04] [PASSED] drm_test_buddy_alloc_optimistic
[11:16:04] [PASSED] drm_test_buddy_alloc_pessimistic
[11:16:04] [PASSED] drm_test_buddy_alloc_smoke
[11:16:04] [PASSED] drm_test_buddy_alloc_pathological
[11:16:04] ==================== [PASSED] drm_buddy ====================
[11:16:04] ============= drm_cmdline_parser (40 subtests) =============
[11:16:04] [PASSED] drm_test_cmdline_force_d_only
[11:16:04] [PASSED] drm_test_cmdline_force_D_only_dvi
[11:16:04] [PASSED] drm_test_cmdline_force_D_only_hdmi
[11:16:04] [PASSED] drm_test_cmdline_force_D_only_not_digital
[11:16:04] [PASSED] drm_test_cmdline_force_e_only
[11:16:04] [PASSED] drm_test_cmdline_res
[11:16:04] [PASSED] drm_test_cmdline_res_vesa
[11:16:04] [PASSED] drm_test_cmdline_res_vesa_rblank
[11:16:04] [PASSED] drm_test_cmdline_res_rblank
[11:16:04] [PASSED] drm_test_cmdline_res_bpp
[11:16:04] [PASSED] drm_test_cmdline_res_refresh
[11:16:04] [PASSED] drm_test_cmdline_res_bpp_refresh
[11:16:04] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[11:16:04] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[11:16:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[11:16:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[11:16:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[11:16:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[11:16:04] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[11:16:04] [PASSED] drm_test_cmdline_res_margins_force_on
[11:16:04] [PASSED] drm_test_cmdline_res_vesa_margins
[11:16:04] [PASSED] drm_test_cmdline_name
[11:16:04] [PASSED] drm_test_cmdline_name_bpp
[11:16:04] [PASSED] drm_test_cmdline_name_option
[11:16:04] [PASSED] drm_test_cmdline_name_bpp_option
[11:16:04] [PASSED] drm_test_cmdline_rotate_0
[11:16:04] [PASSED] drm_test_cmdline_rotate_90
[11:16:04] [PASSED] drm_test_cmdline_rotate_180
[11:16:04] [PASSED] drm_test_cmdline_rotate_270
[11:16:04] [PASSED] drm_test_cmdline_hmirror
[11:16:04] [PASSED] drm_test_cmdline_vmirror
[11:16:04] [PASSED] drm_test_cmdline_margin_options
[11:16:04] [PASSED] drm_test_cmdline_multiple_options
[11:16:04] [PASSED] drm_test_cmdline_bpp_extra_and_option
[11:16:04] [PASSED] drm_test_cmdline_extra_and_option
[11:16:04] [PASSED] drm_test_cmdline_freestanding_options
[11:16:04] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[11:16:04] [PASSED] drm_test_cmdline_panel_orientation
[11:16:04] ================ drm_test_cmdline_invalid  =================
[11:16:04] [PASSED] margin_only
[11:16:04] [PASSED] interlace_only
[11:16:04] [PASSED] res_missing_x
[11:16:04] [PASSED] res_missing_y
[11:16:04] [PASSED] res_bad_y
[11:16:04] [PASSED] res_missing_y_bpp
[11:16:04] [PASSED] res_bad_bpp
[11:16:04] [PASSED] res_bad_refresh
[11:16:04] [PASSED] res_bpp_refresh_force_on_off
[11:16:04] [PASSED] res_invalid_mode
[11:16:04] [PASSED] res_bpp_wrong_place_mode
[11:16:04] [PASSED] name_bpp_refresh
[11:16:04] [PASSED] name_refresh
[11:16:04] [PASSED] name_refresh_wrong_mode
[11:16:04] [PASSED] name_refresh_invalid_mode
[11:16:04] [PASSED] rotate_multiple
[11:16:04] [PASSED] rotate_invalid_val
[11:16:04] [PASSED] rotate_truncated
[11:16:04] [PASSED] invalid_option
[11:16:04] [PASSED] invalid_tv_option
[11:16:04] [PASSED] truncated_tv_option
[11:16:04] ============ [PASSED] drm_test_cmdline_invalid =============
[11:16:04] =============== drm_test_cmdline_tv_options  ===============
[11:16:04] [PASSED] NTSC
[11:16:04] [PASSED] NTSC_443
[11:16:04] [PASSED] NTSC_J
[11:16:04] [PASSED] PAL
[11:16:04] [PASSED] PAL_M
[11:16:04] [PASSED] PAL_N
[11:16:04] [PASSED] SECAM
[11:16:04] =========== [PASSED] drm_test_cmdline_tv_options ===========
[11:16:04] =============== [PASSED] drm_cmdline_parser ================
[11:16:04] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[11:16:04] ========== drm_test_get_tv_mode_from_name_valid  ===========
[11:16:04] [PASSED] NTSC
[11:16:04] [PASSED] NTSC-443
[11:16:04] [PASSED] NTSC-J
[11:16:04] [PASSED] PAL
[11:16:04] [PASSED] PAL-M
[11:16:04] [PASSED] PAL-N
[11:16:04] [PASSED] SECAM
[11:16:04] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[11:16:04] [PASSED] drm_test_get_tv_mode_from_name_truncated
[11:16:04] ============ [PASSED] drm_get_tv_mode_from_name ============
[11:16:04] ============= drm_damage_helper (21 subtests) ==============
[11:16:04] [PASSED] drm_test_damage_iter_no_damage
[11:16:04] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[11:16:04] [PASSED] drm_test_damage_iter_no_damage_src_moved
[11:16:04] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[11:16:04] [PASSED] drm_test_damage_iter_no_damage_not_visible
[11:16:04] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[11:16:04] [PASSED] drm_test_damage_iter_no_damage_no_fb
[11:16:04] [PASSED] drm_test_damage_iter_simple_damage
[11:16:04] [PASSED] drm_test_damage_iter_single_damage
[11:16:04] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[11:16:04] [PASSED] drm_test_damage_iter_single_damage_outside_src
[11:16:04] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[11:16:04] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[11:16:04] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[11:16:04] [PASSED] drm_test_damage_iter_single_damage_src_moved
[11:16:04] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[11:16:04] [PASSED] drm_test_damage_iter_damage
[11:16:04] [PASSED] drm_test_damage_iter_damage_one_intersect
[11:16:04] [PASSED] drm_test_damage_iter_damage_one_outside
[11:16:04] [PASSED] drm_test_damage_iter_damage_src_moved
[11:16:04] [PASSED] drm_test_damage_iter_damage_not_visible
[11:16:04] ================ [PASSED] drm_damage_helper ================
[11:16:04] ============== drm_dp_mst_helper (2 subtests) ==============
[11:16:04] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[11:16:04] [PASSED] Clock 154000 BPP 30 DSC disabled
[11:16:04] [PASSED] Clock 234000 BPP 30 DSC disabled
[11:16:04] [PASSED] Clock 297000 BPP 24 DSC disabled
[11:16:04] [PASSED] Clock 332880 BPP 24 DSC enabled
[11:16:04] [PASSED] Clock 324540 BPP 24 DSC enabled
[11:16:04] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[11:16:04] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[11:16:04] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[11:16:04] [PASSED] DP_POWER_UP_PHY with port number
[11:16:04] [PASSED] DP_POWER_DOWN_PHY with port number
[11:16:04] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[11:16:04] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[11:16:04] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[11:16:04] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[11:16:04] [PASSED] DP_QUERY_PAYLOAD with port number
[11:16:04] [PASSED] DP_QUERY_PAYLOAD with VCPI
[11:16:04] [PASSED] DP_REMOTE_DPCD_READ with port number
[11:16:04] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[11:16:04] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[11:16:04] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[11:16:04] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[11:16:04] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[11:16:04] [PASSED] DP_REMOTE_I2C_READ with port number
[11:16:04] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[11:16:04] [PASSED] DP_REMOTE_I2C_READ with transactions array
[11:16:04] [PASSED] DP_REMOTE_I2C_WRITE with port number
[11:16:04] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[11:16:04] [PASSED] DP_REMOTE_I2C_WRITE with data array
[11:16:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[11:16:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[11:16:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[11:16:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[11:16:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[11:16:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[11:16:04] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[11:16:04] ================ [PASSED] drm_dp_mst_helper ================
[11:16:04] =========== drm_format_helper_test (11 subtests) ===========
[11:16:04] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[11:16:04] [PASSED] single_pixel_source_buffer
[11:16:04] [PASSED] single_pixel_clip_rectangle
[11:16:04] [PASSED] well_known_colors
[11:16:04] [PASSED] destination_pitch
[11:16:04] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[11:16:04] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[11:16:04] [PASSED] single_pixel_source_buffer
[11:16:04] [PASSED] single_pixel_clip_rectangle
[11:16:04] [PASSED] well_known_colors
[11:16:04] [PASSED] destination_pitch
[11:16:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[11:16:04] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[11:16:04] [PASSED] single_pixel_source_buffer
[11:16:04] [PASSED] single_pixel_clip_rectangle
[11:16:04] [PASSED] well_known_colors
[11:16:04] [PASSED] destination_pitch
[11:16:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[11:16:04] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[11:16:04] [PASSED] single_pixel_source_buffer
[11:16:04] [PASSED] single_pixel_clip_rectangle
[11:16:04] [PASSED] well_known_colors
[11:16:04] [PASSED] destination_pitch
[11:16:04] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[11:16:04] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[11:16:04] [PASSED] single_pixel_source_buffer
[11:16:04] [PASSED] single_pixel_clip_rectangle
[11:16:04] [PASSED] well_known_colors
[11:16:04] [PASSED] destination_pitch
[11:16:04] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[11:16:04] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[11:16:04] [PASSED] single_pixel_source_buffer
[11:16:04] [PASSED] single_pixel_clip_rectangle
[11:16:04] [PASSED] well_known_colors
[11:16:04] [PASSED] destination_pitch
[11:16:04] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[11:16:04] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[11:16:04] [PASSED] single_pixel_source_buffer
[11:16:04] [PASSED] single_pixel_clip_rectangle
[11:16:04] [PASSED] well_known_colors
[11:16:04] [PASSED] destination_pitch
[11:16:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[11:16:04] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[11:16:04] [PASSED] single_pixel_source_buffer
[11:16:04] [PASSED] single_pixel_clip_rectangle
[11:16:04] [PASSED] well_known_colors
[11:16:04] [PASSED] destination_pitch
[11:16:04] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[11:16:04] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[11:16:04] [PASSED] single_pixel_source_buffer
[11:16:04] [PASSED] single_pixel_clip_rectangle
[11:16:04] [PASSED] well_known_colors
[11:16:04] [PASSED] destination_pitch
[11:16:04] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[11:16:04] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[11:16:04] [PASSED] single_pixel_source_buffer
[11:16:04] [PASSED] single_pixel_clip_rectangle
[11:16:04] [PASSED] well_known_colors
[11:16:04] [PASSED] destination_pitch
[11:16:04] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[11:16:04] ============== drm_test_fb_xrgb8888_to_mono  ===============
[11:16:04] [PASSED] single_pixel_source_buffer
[11:16:04] [PASSED] single_pixel_clip_rectangle
[11:16:04] [PASSED] well_known_colors
[11:16:04] [PASSED] destination_pitch
[11:16:04] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[11:16:04] ============= [PASSED] drm_format_helper_test ==============
[11:16:04] ================= drm_format (18 subtests) =================
[11:16:04] [PASSED] drm_test_format_block_width_invalid
[11:16:04] [PASSED] drm_test_format_block_width_one_plane
[11:16:04] [PASSED] drm_test_format_block_width_two_plane
[11:16:04] [PASSED] drm_test_format_block_width_three_plane
[11:16:04] [PASSED] drm_test_format_block_width_tiled
[11:16:04] [PASSED] drm_test_format_block_height_invalid
[11:16:04] [PASSED] drm_test_format_block_height_one_plane
[11:16:04] [PASSED] drm_test_format_block_height_two_plane
[11:16:04] [PASSED] drm_test_format_block_height_three_plane
[11:16:04] [PASSED] drm_test_format_block_height_tiled
[11:16:04] [PASSED] drm_test_format_min_pitch_invalid
[11:16:04] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[11:16:04] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[11:16:04] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[11:16:04] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[11:16:04] [PASSED] drm_test_format_min_pitch_two_plane
[11:16:04] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[11:16:04] [PASSED] drm_test_format_min_pitch_tiled
[11:16:04] =================== [PASSED] drm_format ====================
[11:16:04] =============== drm_framebuffer (1 subtest) ================
[11:16:04] =============== drm_test_framebuffer_create  ===============
[11:16:04] [PASSED] ABGR8888 normal sizes
[11:16:04] [PASSED] ABGR8888 max sizes
[11:16:04] [PASSED] ABGR8888 pitch greater than min required
[11:16:04] [PASSED] ABGR8888 pitch less than min required
[11:16:04] [PASSED] ABGR8888 Invalid width
[11:16:04] [PASSED] ABGR8888 Invalid buffer handle
[11:16:04] [PASSED] No pixel format
[11:16:04] [PASSED] ABGR8888 Width 0
[11:16:04] [PASSED] ABGR8888 Height 0
[11:16:04] [PASSED] ABGR8888 Out of bound height * pitch combination
[11:16:04] [PASSED] ABGR8888 Large buffer offset
[11:16:04] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[11:16:04] [PASSED] ABGR8888 Valid buffer modifier
[11:16:04] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[11:16:04] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[11:16:04] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[11:16:04] [PASSED] NV12 Normal sizes
[11:16:04] [PASSED] NV12 Max sizes
[11:16:04] [PASSED] NV12 Invalid pitch
[11:16:04] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[11:16:04] [PASSED] NV12 different  modifier per-plane
[11:16:04] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[11:16:04] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[11:16:04] [PASSED] NV12 Modifier for inexistent plane
[11:16:04] [PASSED] NV12 Handle for inexistent plane
[11:16:04] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[11:16:04] [PASSED] YVU420 Normal sizes
[11:16:04] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[11:16:04] [PASSED] YVU420 Max sizes
[11:16:04] [PASSED] YVU420 Invalid pitch
[11:16:04] [PASSED] YVU420 Different pitches
[11:16:04] [PASSED] YVU420 Different buffer offsets/pitches
[11:16:04] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[11:16:04] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[11:16:04] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[11:16:04] [PASSED] YVU420 Valid modifier
[11:16:04] [PASSED] YVU420 Different modifiers per plane
[11:16:04] [PASSED] YVU420 Modifier for inexistent plane
[11:16:04] [PASSED] X0L2 Normal sizes
[11:16:04] [PASSED] X0L2 Max sizes
[11:16:04] [PASSED] X0L2 Invalid pitch
[11:16:04] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[11:16:04] [PASSED] X0L2 Handle for inexistent plane
[11:16:04] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[11:16:04] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[11:16:04] [PASSED] X0L2 Valid modifier
[11:16:04] [PASSED] X0L2 Modifier for inexistent plane
[11:16:04] =========== [PASSED] drm_test_framebuffer_create ===========
[11:16:04] ================= [PASSED] drm_framebuffer =================
[11:16:04] =============== drm-test-managed (1 subtest) ===============
[11:16:04] [PASSED] drm_test_managed_run_action
[11:16:04] ================ [PASSED] drm-test-managed =================
[11:16:04] =================== drm_mm (19 subtests) ===================
[11:16:04] [PASSED] drm_test_mm_init
[11:16:04] [PASSED] drm_test_mm_debug
[11:16:14] [PASSED] drm_test_mm_reserve
[11:16:24] [PASSED] drm_test_mm_insert
[11:16:25] [PASSED] drm_test_mm_replace
[11:16:25] [PASSED] drm_test_mm_insert_range
[11:16:25] [PASSED] drm_test_mm_frag
[11:16:25] [PASSED] drm_test_mm_align
[11:16:25] [PASSED] drm_test_mm_align32
[11:16:25] [PASSED] drm_test_mm_align64
[11:16:25] [PASSED] drm_test_mm_evict
[11:16:25] [PASSED] drm_test_mm_evict_range
[11:16:25] [PASSED] drm_test_mm_topdown
[11:16:25] [PASSED] drm_test_mm_bottomup
[11:16:25] [PASSED] drm_test_mm_lowest
[11:16:25] [PASSED] drm_test_mm_highest
[11:16:26] [PASSED] drm_test_mm_color
[11:16:27] [PASSED] drm_test_mm_color_evict
[11:16:27] [PASSED] drm_test_mm_color_evict_range
[11:16:27] ===================== [PASSED] drm_mm ======================
[11:16:27] ============= drm_modes_analog_tv (4 subtests) =============
[11:16:27] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[11:16:27] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[11:16:27] [PASSED] drm_test_modes_analog_tv_pal_576i
[11:16:27] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[11:16:27] =============== [PASSED] drm_modes_analog_tv ===============
[11:16:27] ============== drm_plane_helper (2 subtests) ===============
[11:16:27] =============== drm_test_check_plane_state  ================
[11:16:27] [PASSED] clipping_simple
[11:16:27] [PASSED] clipping_rotate_reflect
[11:16:27] [PASSED] positioning_simple
[11:16:27] [PASSED] upscaling
[11:16:27] [PASSED] downscaling
[11:16:27] [PASSED] rounding1
[11:16:27] [PASSED] rounding2
[11:16:27] [PASSED] rounding3
[11:16:27] [PASSED] rounding4
[11:16:27] =========== [PASSED] drm_test_check_plane_state ============
[11:16:27] =========== drm_test_check_invalid_plane_state  ============
[11:16:27] [PASSED] positioning_invalid
[11:16:27] [PASSED] upscaling_invalid
[11:16:27] [PASSED] downscaling_invalid
[11:16:27] ======= [PASSED] drm_test_check_invalid_plane_state ========
[11:16:27] ================ [PASSED] drm_plane_helper =================
[11:16:27] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[11:16:27] ====== drm_test_connector_helper_tv_get_modes_check  =======
[11:16:27] [PASSED] None
[11:16:27] [PASSED] PAL
[11:16:27] [PASSED] NTSC
[11:16:27] [PASSED] Both, NTSC Default
[11:16:27] [PASSED] Both, PAL Default
[11:16:27] [PASSED] Both, NTSC Default, with PAL on command-line
[11:16:27] [PASSED] Both, PAL Default, with NTSC on command-line
[11:16:27] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[11:16:27] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[11:16:27] ================== drm_rect (9 subtests) ===================
[11:16:27] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[11:16:27] [PASSED] drm_test_rect_clip_scaled_not_clipped
[11:16:27] [PASSED] drm_test_rect_clip_scaled_clipped
[11:16:27] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[11:16:27] ================= drm_test_rect_intersect  =================
[11:16:27] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[11:16:27] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[11:16:27] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[11:16:27] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[11:16:27] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[11:16:27] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[11:16:27] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[11:16:27] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[11:16:27] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[11:16:27] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[11:16:27] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[11:16:27] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[11:16:27] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[11:16:27] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[11:16:27] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[11:16:27] ============= [PASSED] drm_test_rect_intersect =============
[11:16:27] ================ drm_test_rect_calc_hscale  ================
[11:16:27] [PASSED] normal use
[11:16:27] [PASSED] out of max range
[11:16:27] [PASSED] out of min range
[11:16:27] [PASSED] zero dst
[11:16:27] [PASSED] negative src
[11:16:27] [PASSED] negative dst
[11:16:27] ============ [PASSED] drm_test_rect_calc_hscale ============
[11:16:27] ================ drm_test_rect_calc_vscale  ================
[11:16:27] [PASSED] normal use
[11:16:27] [PASSED] out of max range
[11:16:27] [PASSED] out of min range
[11:16:27] [PASSED] zero dst
[11:16:27] [PASSED] negative src
[11:16:27] [PASSED] negative dst
[11:16:27] ============ [PASSED] drm_test_rect_calc_vscale ============
[11:16:27] ================== drm_test_rect_rotate  ===================
[11:16:27] [PASSED] reflect-x
[11:16:27] [PASSED] reflect-y
[11:16:27] [PASSED] rotate-0
[11:16:27] [PASSED] rotate-90
[11:16:27] [PASSED] rotate-180
[11:16:27] [PASSED] rotate-270
[11:16:27] ============== [PASSED] drm_test_rect_rotate ===============
[11:16:27] ================ drm_test_rect_rotate_inv  =================
[11:16:27] [PASSED] reflect-x
[11:16:27] [PASSED] reflect-y
[11:16:27] [PASSED] rotate-0
[11:16:27] [PASSED] rotate-90
[11:16:27] [PASSED] rotate-180
[11:16:27] [PASSED] rotate-270
[11:16:27] ============ [PASSED] drm_test_rect_rotate_inv =============
[11:16:27] ==================== [PASSED] drm_rect =====================
[11:16:27] ============================================================
[11:16:27] Testing complete. Ran 333 tests: passed: 333
[11:16:27] Elapsed time: 42.999s total, 1.696s configuring, 18.275s building, 23.019s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


