Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFE9C77B75
	for <intel-xe@archiver.kernel.org>; Tue, 18 Apr 2023 20:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F71610E88F;
	Tue, 18 Apr 2023 20:17:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 473F710E88F;
 Tue, 18 Apr 2023 20:17:36 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 43CAEA73C7;
 Tue, 18 Apr 2023 20:17:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Date: Tue, 18 Apr 2023 20:17:36 -0000
Message-ID: <168184905627.17885.281078249222775961@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230418201403.289184-1-matthew.s.atwood@intel.com>
In-Reply-To: <20230418201403.289184-1-matthew.s.atwood@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_series_?=
 =?utf-8?q?starting_with_=5Bv2=2C1/2=5D_drm/xe=3A_add_infrastructure_for_p?=
 =?utf-8?q?er_engine_tuning?=
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

Series: series starting with [v2,1/2] drm/xe: add infrastructure for per engine tuning
URL   : https://patchwork.freedesktop.org/series/116670/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[20:16:23] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:16:27] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[20:16:49] Starting KUnit Kernel (1/1)...
[20:16:49] ============================================================
[20:16:49] ==================== xe_bo (2 subtests) ====================
[20:16:49] [SKIPPED] xe_ccs_migrate_kunit
[20:16:49] [SKIPPED] xe_bo_evict_kunit
[20:16:49] ===================== [SKIPPED] xe_bo ======================
[20:16:49] ================== xe_dma_buf (1 subtest) ==================
[20:16:49] [SKIPPED] xe_dma_buf_kunit
[20:16:49] =================== [SKIPPED] xe_dma_buf ===================
[20:16:49] ================== xe_migrate (1 subtest) ==================
[20:16:49] [SKIPPED] xe_migrate_sanity_kunit
[20:16:49] =================== [SKIPPED] xe_migrate ===================
[20:16:49] =================== xe_pci (2 subtests) ====================
[20:16:49] [PASSED] xe_gmdid_graphics_ip
[20:16:49] [PASSED] xe_gmdid_media_ip
[20:16:49] ===================== [PASSED] xe_pci ======================
[20:16:49] ==================== xe_rtp (1 subtest) ====================
[20:16:49] ================== xe_rtp_process_tests  ===================
[20:16:49] [PASSED] coalesce-same-reg
[20:16:49] [PASSED] no-match-no-add
[20:16:49] [PASSED] no-match-no-add-multiple-rules
[20:16:49] [PASSED] two-regs-two-entries
[20:16:49] [PASSED] clr-one-set-other
[20:16:49] [PASSED] set-field
[20:16:49] [PASSED] conflict-duplicate
[20:16:49] [PASSED] conflict-not-disjoint
[20:16:49] [PASSED] conflict-reg-type
[20:16:49] ============== [PASSED] xe_rtp_process_tests ===============
[20:16:49] ===================== [PASSED] xe_rtp ======================
[20:16:49] ==================== xe_wa (1 subtest) =====================
[20:16:49] ======================== xe_wa_gt  =========================
[20:16:49] [PASSED] TIGERLAKE (B0)
[20:16:49] [PASSED] DG1 (A0)
[20:16:49] [PASSED] DG1 (B0)
[20:16:49] [PASSED] ALDERLAKE_S (A0)
[20:16:49] [PASSED] ALDERLAKE_S (B0)
[20:16:49] [PASSED] ALDERLAKE_S (C0)
[20:16:49] [PASSED] ALDERLAKE_S (D0)
[20:16:49] [PASSED] DG2_G10 (A0)
[20:16:49] [PASSED] DG2_G10 (A1)
[20:16:49] [PASSED] DG2_G10 (B0)
[20:16:49] [PASSED] DG2_G10 (C0)
[20:16:49] [PASSED] DG2_G11 (A0)
[20:16:49] [PASSED] DG2_G11 (B0)
[20:16:49] [PASSED] DG2_G11 (B1)
[20:16:49] [PASSED] DG2_G12 (A0)
[20:16:49] [PASSED] DG2_G12 (A1)
[20:16:49] [PASSED] PVC (B0)
[20:16:49] [PASSED] PVC (B1)
[20:16:49] [PASSED] PVC (C0)
[20:16:49] ==================== [PASSED] xe_wa_gt =====================
[20:16:49] ====================== [PASSED] xe_wa ======================
[20:16:49] ============================================================
[20:16:49] Testing complete. Ran 34 tests: passed: 30, skipped: 4
[20:16:49] Elapsed time: 26.055s total, 4.194s configuring, 21.743s building, 0.096s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[20:16:49] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:16:51] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[20:17:09] Starting KUnit Kernel (1/1)...
[20:17:09] ============================================================
[20:17:09] ============ drm_test_pick_cmdline (2 subtests) ============
[20:17:09] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[20:17:09] =============== drm_test_pick_cmdline_named  ===============
[20:17:09] [PASSED] NTSC
[20:17:09] [PASSED] NTSC-J
[20:17:09] [PASSED] PAL
[20:17:09] [PASSED] PAL-M
[20:17:09] =========== [PASSED] drm_test_pick_cmdline_named ===========
[20:17:09] ============== [PASSED] drm_test_pick_cmdline ==============
[20:17:09] ================== drm_buddy (6 subtests) ==================
[20:17:09] [PASSED] drm_test_buddy_alloc_limit
[20:17:09] [PASSED] drm_test_buddy_alloc_range
[20:17:09] [PASSED] drm_test_buddy_alloc_optimistic
[20:17:09] [PASSED] drm_test_buddy_alloc_pessimistic
[20:17:09] [PASSED] drm_test_buddy_alloc_smoke
[20:17:09] [PASSED] drm_test_buddy_alloc_pathological
[20:17:09] ==================== [PASSED] drm_buddy ====================
[20:17:09] ============= drm_cmdline_parser (40 subtests) =============
[20:17:09] [PASSED] drm_test_cmdline_force_d_only
[20:17:09] [PASSED] drm_test_cmdline_force_D_only_dvi
[20:17:09] [PASSED] drm_test_cmdline_force_D_only_hdmi
[20:17:09] [PASSED] drm_test_cmdline_force_D_only_not_digital
[20:17:09] [PASSED] drm_test_cmdline_force_e_only
[20:17:09] [PASSED] drm_test_cmdline_res
[20:17:09] [PASSED] drm_test_cmdline_res_vesa
[20:17:09] [PASSED] drm_test_cmdline_res_vesa_rblank
[20:17:09] [PASSED] drm_test_cmdline_res_rblank
[20:17:09] [PASSED] drm_test_cmdline_res_bpp
[20:17:09] [PASSED] drm_test_cmdline_res_refresh
[20:17:09] [PASSED] drm_test_cmdline_res_bpp_refresh
[20:17:09] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[20:17:09] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[20:17:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[20:17:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[20:17:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[20:17:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[20:17:09] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[20:17:09] [PASSED] drm_test_cmdline_res_margins_force_on
[20:17:09] [PASSED] drm_test_cmdline_res_vesa_margins
[20:17:09] [PASSED] drm_test_cmdline_name
[20:17:09] [PASSED] drm_test_cmdline_name_bpp
[20:17:09] [PASSED] drm_test_cmdline_name_option
[20:17:09] [PASSED] drm_test_cmdline_name_bpp_option
[20:17:09] [PASSED] drm_test_cmdline_rotate_0
[20:17:09] [PASSED] drm_test_cmdline_rotate_90
[20:17:09] [PASSED] drm_test_cmdline_rotate_180
[20:17:09] [PASSED] drm_test_cmdline_rotate_270
[20:17:09] [PASSED] drm_test_cmdline_hmirror
[20:17:09] [PASSED] drm_test_cmdline_vmirror
[20:17:09] [PASSED] drm_test_cmdline_margin_options
[20:17:09] [PASSED] drm_test_cmdline_multiple_options
[20:17:09] [PASSED] drm_test_cmdline_bpp_extra_and_option
[20:17:09] [PASSED] drm_test_cmdline_extra_and_option
[20:17:09] [PASSED] drm_test_cmdline_freestanding_options
[20:17:09] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[20:17:09] [PASSED] drm_test_cmdline_panel_orientation
[20:17:09] ================ drm_test_cmdline_invalid  =================
[20:17:09] [PASSED] margin_only
[20:17:09] [PASSED] interlace_only
[20:17:09] [PASSED] res_missing_x
[20:17:09] [PASSED] res_missing_y
[20:17:09] [PASSED] res_bad_y
[20:17:09] [PASSED] res_missing_y_bpp
[20:17:09] [PASSED] res_bad_bpp
[20:17:09] [PASSED] res_bad_refresh
[20:17:09] [PASSED] res_bpp_refresh_force_on_off
[20:17:09] [PASSED] res_invalid_mode
[20:17:09] [PASSED] res_bpp_wrong_place_mode
[20:17:09] [PASSED] name_bpp_refresh
[20:17:09] [PASSED] name_refresh
[20:17:09] [PASSED] name_refresh_wrong_mode
[20:17:09] [PASSED] name_refresh_invalid_mode
[20:17:09] [PASSED] rotate_multiple
[20:17:09] [PASSED] rotate_invalid_val
[20:17:09] [PASSED] rotate_truncated
[20:17:09] [PASSED] invalid_option
[20:17:09] [PASSED] invalid_tv_option
[20:17:09] [PASSED] truncated_tv_option
[20:17:09] ============ [PASSED] drm_test_cmdline_invalid =============
[20:17:09] =============== drm_test_cmdline_tv_options  ===============
[20:17:09] [PASSED] NTSC
[20:17:09] [PASSED] NTSC_443
[20:17:09] [PASSED] NTSC_J
[20:17:09] [PASSED] PAL
[20:17:09] [PASSED] PAL_M
[20:17:09] [PASSED] PAL_N
[20:17:09] [PASSED] SECAM
[20:17:09] =========== [PASSED] drm_test_cmdline_tv_options ===========
[20:17:09] =============== [PASSED] drm_cmdline_parser ================
[20:17:09] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[20:17:09] ========== drm_test_get_tv_mode_from_name_valid  ===========
[20:17:09] [PASSED] NTSC
[20:17:09] [PASSED] NTSC-443
[20:17:09] [PASSED] NTSC-J
[20:17:09] [PASSED] PAL
[20:17:09] [PASSED] PAL-M
[20:17:09] [PASSED] PAL-N
[20:17:09] [PASSED] SECAM
[20:17:09] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[20:17:09] [PASSED] drm_test_get_tv_mode_from_name_truncated
[20:17:09] ============ [PASSED] drm_get_tv_mode_from_name ============
[20:17:09] ============= drm_damage_helper (21 subtests) ==============
[20:17:09] [PASSED] drm_test_damage_iter_no_damage
[20:17:09] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[20:17:09] [PASSED] drm_test_damage_iter_no_damage_src_moved
[20:17:09] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[20:17:09] [PASSED] drm_test_damage_iter_no_damage_not_visible
[20:17:09] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[20:17:09] [PASSED] drm_test_damage_iter_no_damage_no_fb
[20:17:09] [PASSED] drm_test_damage_iter_simple_damage
[20:17:09] [PASSED] drm_test_damage_iter_single_damage
[20:17:09] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[20:17:09] [PASSED] drm_test_damage_iter_single_damage_outside_src
[20:17:09] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[20:17:09] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[20:17:09] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[20:17:09] [PASSED] drm_test_damage_iter_single_damage_src_moved
[20:17:09] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[20:17:09] [PASSED] drm_test_damage_iter_damage
[20:17:09] [PASSED] drm_test_damage_iter_damage_one_intersect
[20:17:09] [PASSED] drm_test_damage_iter_damage_one_outside
[20:17:09] [PASSED] drm_test_damage_iter_damage_src_moved
[20:17:09] [PASSED] drm_test_damage_iter_damage_not_visible
[20:17:09] ================ [PASSED] drm_damage_helper ================
[20:17:09] ============== drm_dp_mst_helper (2 subtests) ==============
[20:17:09] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[20:17:09] [PASSED] Clock 154000 BPP 30 DSC disabled
[20:17:09] [PASSED] Clock 234000 BPP 30 DSC disabled
[20:17:09] [PASSED] Clock 297000 BPP 24 DSC disabled
[20:17:09] [PASSED] Clock 332880 BPP 24 DSC enabled
[20:17:09] [PASSED] Clock 324540 BPP 24 DSC enabled
[20:17:09] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[20:17:09] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[20:17:09] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[20:17:09] [PASSED] DP_POWER_UP_PHY with port number
[20:17:09] [PASSED] DP_POWER_DOWN_PHY with port number
[20:17:09] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[20:17:09] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[20:17:09] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[20:17:09] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[20:17:09] [PASSED] DP_QUERY_PAYLOAD with port number
[20:17:09] [PASSED] DP_QUERY_PAYLOAD with VCPI
[20:17:09] [PASSED] DP_REMOTE_DPCD_READ with port number
[20:17:09] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[20:17:09] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[20:17:09] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[20:17:09] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[20:17:09] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[20:17:09] [PASSED] DP_REMOTE_I2C_READ with port number
[20:17:09] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[20:17:09] [PASSED] DP_REMOTE_I2C_READ with transactions array
[20:17:09] [PASSED] DP_REMOTE_I2C_WRITE with port number
[20:17:09] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[20:17:09] [PASSED] DP_REMOTE_I2C_WRITE with data array
[20:17:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[20:17:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[20:17:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[20:17:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[20:17:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[20:17:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[20:17:09] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[20:17:09] ================ [PASSED] drm_dp_mst_helper ================
[20:17:09] =========== drm_format_helper_test (11 subtests) ===========
[20:17:09] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[20:17:09] [PASSED] single_pixel_source_buffer
[20:17:09] [PASSED] single_pixel_clip_rectangle
[20:17:09] [PASSED] well_known_colors
[20:17:09] [PASSED] destination_pitch
[20:17:09] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[20:17:09] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[20:17:09] [PASSED] single_pixel_source_buffer
[20:17:09] [PASSED] single_pixel_clip_rectangle
[20:17:09] [PASSED] well_known_colors
[20:17:09] [PASSED] destination_pitch
[20:17:09] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[20:17:09] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[20:17:09] [PASSED] single_pixel_source_buffer
[20:17:09] [PASSED] single_pixel_clip_rectangle
[20:17:09] [PASSED] well_known_colors
[20:17:09] [PASSED] destination_pitch
[20:17:09] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[20:17:09] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[20:17:09] [PASSED] single_pixel_source_buffer
[20:17:09] [PASSED] single_pixel_clip_rectangle
[20:17:09] [PASSED] well_known_colors
[20:17:09] [PASSED] destination_pitch
[20:17:09] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[20:17:09] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[20:17:09] [PASSED] single_pixel_source_buffer
[20:17:09] [PASSED] single_pixel_clip_rectangle
[20:17:09] [PASSED] well_known_colors
[20:17:09] [PASSED] destination_pitch
[20:17:09] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[20:17:09] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[20:17:09] [PASSED] single_pixel_source_buffer
[20:17:09] [PASSED] single_pixel_clip_rectangle
[20:17:09] [PASSED] well_known_colors
[20:17:09] [PASSED] destination_pitch
[20:17:09] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[20:17:09] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[20:17:09] [PASSED] single_pixel_source_buffer
[20:17:09] [PASSED] single_pixel_clip_rectangle
[20:17:09] [PASSED] well_known_colors
[20:17:09] [PASSED] destination_pitch
[20:17:09] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[20:17:09] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[20:17:09] [PASSED] single_pixel_source_buffer
[20:17:09] [PASSED] single_pixel_clip_rectangle
[20:17:09] [PASSED] well_known_colors
[20:17:09] [PASSED] destination_pitch
[20:17:09] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[20:17:09] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[20:17:09] [PASSED] single_pixel_source_buffer
[20:17:09] [PASSED] single_pixel_clip_rectangle
[20:17:09] [PASSED] well_known_colors
[20:17:09] [PASSED] destination_pitch
[20:17:09] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[20:17:09] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[20:17:09] [PASSED] single_pixel_source_buffer
[20:17:09] [PASSED] single_pixel_clip_rectangle
[20:17:09] [PASSED] well_known_colors
[20:17:09] [PASSED] destination_pitch
[20:17:09] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[20:17:09] ============== drm_test_fb_xrgb8888_to_mono  ===============
[20:17:09] [PASSED] single_pixel_source_buffer
[20:17:09] [PASSED] single_pixel_clip_rectangle
[20:17:09] [PASSED] well_known_colors
[20:17:09] [PASSED] destination_pitch
[20:17:09] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[20:17:09] ============= [PASSED] drm_format_helper_test ==============
[20:17:09] ================= drm_format (18 subtests) =================
[20:17:09] [PASSED] drm_test_format_block_width_invalid
[20:17:09] [PASSED] drm_test_format_block_width_one_plane
[20:17:09] [PASSED] drm_test_format_block_width_two_plane
[20:17:09] [PASSED] drm_test_format_block_width_three_plane
[20:17:09] [PASSED] drm_test_format_block_width_tiled
[20:17:09] [PASSED] drm_test_format_block_height_invalid
[20:17:09] [PASSED] drm_test_format_block_height_one_plane
[20:17:09] [PASSED] drm_test_format_block_height_two_plane
[20:17:09] [PASSED] drm_test_format_block_height_three_plane
[20:17:09] [PASSED] drm_test_format_block_height_tiled
[20:17:09] [PASSED] drm_test_format_min_pitch_invalid
[20:17:09] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[20:17:09] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[20:17:09] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[20:17:09] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[20:17:09] [PASSED] drm_test_format_min_pitch_two_plane
[20:17:09] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[20:17:09] [PASSED] drm_test_format_min_pitch_tiled
[20:17:09] =================== [PASSED] drm_format ====================
[20:17:09] =============== drm_framebuffer (1 subtest) ================
[20:17:09] =============== drm_test_framebuffer_create  ===============
[20:17:09] [PASSED] ABGR8888 normal sizes
[20:17:09] [PASSED] ABGR8888 max sizes
[20:17:09] [PASSED] ABGR8888 pitch greater than min required
[20:17:09] [PASSED] ABGR8888 pitch less than min required
[20:17:09] [PASSED] ABGR8888 Invalid width
[20:17:09] [PASSED] ABGR8888 Invalid buffer handle
[20:17:09] [PASSED] No pixel format
[20:17:09] [PASSED] ABGR8888 Width 0
[20:17:09] [PASSED] ABGR8888 Height 0
[20:17:09] [PASSED] ABGR8888 Out of bound height * pitch combination
[20:17:09] [PASSED] ABGR8888 Large buffer offset
[20:17:09] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[20:17:09] [PASSED] ABGR8888 Valid buffer modifier
[20:17:09] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[20:17:09] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[20:17:09] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[20:17:09] [PASSED] NV12 Normal sizes
[20:17:09] [PASSED] NV12 Max sizes
[20:17:09] [PASSED] NV12 Invalid pitch
[20:17:09] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[20:17:09] [PASSED] NV12 different  modifier per-plane
[20:17:09] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[20:17:09] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[20:17:09] [PASSED] NV12 Modifier for inexistent plane
[20:17:09] [PASSED] NV12 Handle for inexistent plane
[20:17:09] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[20:17:09] [PASSED] YVU420 Normal sizes
[20:17:09] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[20:17:09] [PASSED] YVU420 Max sizes
[20:17:09] [PASSED] YVU420 Invalid pitch
[20:17:09] [PASSED] YVU420 Different pitches
[20:17:09] [PASSED] YVU420 Different buffer offsets/pitches
[20:17:09] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[20:17:09] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[20:17:09] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[20:17:09] [PASSED] YVU420 Valid modifier
[20:17:09] [PASSED] YVU420 Different modifiers per plane
[20:17:09] [PASSED] YVU420 Modifier for inexistent plane
[20:17:09] [PASSED] X0L2 Normal sizes
[20:17:09] [PASSED] X0L2 Max sizes
[20:17:09] [PASSED] X0L2 Invalid pitch
[20:17:09] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[20:17:09] [PASSED] X0L2 Handle for inexistent plane
[20:17:09] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[20:17:09] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[20:17:09] [PASSED] X0L2 Valid modifier
[20:17:09] [PASSED] X0L2 Modifier for inexistent plane
[20:17:09] =========== [PASSED] drm_test_framebuffer_create ===========
[20:17:09] ================= [PASSED] drm_framebuffer =================
[20:17:09] =============== drm-test-managed (1 subtest) ===============
[20:17:09] [PASSED] drm_test_managed_run_action
[20:17:09] ================ [PASSED] drm-test-managed =================
[20:17:09] =================== drm_mm (19 subtests) ===================
[20:17:09] [PASSED] drm_test_mm_init
[20:17:10] [PASSED] drm_test_mm_debug
[20:17:19] [PASSED] drm_test_mm_reserve
[20:17:29] [PASSED] drm_test_mm_insert
[20:17:30] [PASSED] drm_test_mm_replace
[20:17:30] [PASSED] drm_test_mm_insert_range
[20:17:30] [PASSED] drm_test_mm_frag
[20:17:30] [PASSED] drm_test_mm_align
[20:17:30] [PASSED] drm_test_mm_align32
[20:17:31] [PASSED] drm_test_mm_align64
[20:17:31] [PASSED] drm_test_mm_evict
[20:17:31] [PASSED] drm_test_mm_evict_range
[20:17:31] [PASSED] drm_test_mm_topdown
[20:17:31] [PASSED] drm_test_mm_bottomup
[20:17:31] [PASSED] drm_test_mm_lowest
[20:17:31] [PASSED] drm_test_mm_highest
[20:17:32] [PASSED] drm_test_mm_color
[20:17:32] [PASSED] drm_test_mm_color_evict
[20:17:32] [PASSED] drm_test_mm_color_evict_range
[20:17:32] ===================== [PASSED] drm_mm ======================
[20:17:32] ============= drm_modes_analog_tv (4 subtests) =============
[20:17:32] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[20:17:32] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[20:17:32] [PASSED] drm_test_modes_analog_tv_pal_576i
[20:17:32] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[20:17:32] =============== [PASSED] drm_modes_analog_tv ===============
[20:17:32] ============== drm_plane_helper (2 subtests) ===============
[20:17:32] =============== drm_test_check_plane_state  ================
[20:17:32] [PASSED] clipping_simple
[20:17:32] [PASSED] clipping_rotate_reflect
[20:17:32] [PASSED] positioning_simple
[20:17:32] [PASSED] upscaling
[20:17:32] [PASSED] downscaling
[20:17:32] [PASSED] rounding1
[20:17:32] [PASSED] rounding2
[20:17:32] [PASSED] rounding3
[20:17:32] [PASSED] rounding4
[20:17:32] =========== [PASSED] drm_test_check_plane_state ============
[20:17:32] =========== drm_test_check_invalid_plane_state  ============
[20:17:32] [PASSED] positioning_invalid
[20:17:32] [PASSED] upscaling_invalid
[20:17:32] [PASSED] downscaling_invalid
[20:17:32] ======= [PASSED] drm_test_check_invalid_plane_state ========
[20:17:32] ================ [PASSED] drm_plane_helper =================
[20:17:32] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[20:17:32] ====== drm_test_connector_helper_tv_get_modes_check  =======
[20:17:32] [PASSED] None
[20:17:32] [PASSED] PAL
[20:17:32] [PASSED] NTSC
[20:17:32] [PASSED] Both, NTSC Default
[20:17:32] [PASSED] Both, PAL Default
[20:17:32] [PASSED] Both, NTSC Default, with PAL on command-line
[20:17:32] [PASSED] Both, PAL Default, with NTSC on command-line
[20:17:32] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[20:17:32] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[20:17:32] ================== drm_rect (4 subtests) ===================
[20:17:32] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[20:17:32] [PASSED] drm_test_rect_clip_scaled_not_clipped
[20:17:32] [PASSED] drm_test_rect_clip_scaled_clipped
[20:17:32] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[20:17:32] ==================== [PASSED] drm_rect =====================
[20:17:32] ============================================================
[20:17:32] Testing complete. Ran 294 tests: passed: 294
[20:17:32] Elapsed time: 43.041s total, 1.698s configuring, 18.414s building, 22.908s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


