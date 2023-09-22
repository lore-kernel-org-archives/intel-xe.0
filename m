Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF88BE7D0D6
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 07:13:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8E910E61E;
	Fri, 22 Sep 2023 07:13:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9B15C10E61E;
 Fri, 22 Sep 2023 07:13:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 971D2AADDD;
 Fri, 22 Sep 2023 07:13:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Fri, 22 Sep 2023 07:13:16 -0000
Message-ID: <169536679661.5197.3469707260587937035@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230921115002.22884-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230921115002.22884-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe?=
 =?utf-8?q?=3A_fdinfo_memory_stats_=28rev7=29?=
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

Series: drm/xe: fdinfo memory stats (rev7)
URL   : https://patchwork.freedesktop.org/series/123102/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[07:12:05] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:12:09] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[07:12:28] Starting KUnit Kernel (1/1)...
[07:12:28] ============================================================
[07:12:28] ==================== xe_bo (2 subtests) ====================
[07:12:28] [SKIPPED] xe_ccs_migrate_kunit
[07:12:28] [SKIPPED] xe_bo_evict_kunit
[07:12:28] ===================== [SKIPPED] xe_bo ======================
[07:12:28] ================== xe_dma_buf (1 subtest) ==================
[07:12:28] [SKIPPED] xe_dma_buf_kunit
[07:12:28] =================== [SKIPPED] xe_dma_buf ===================
[07:12:28] ================== xe_migrate (1 subtest) ==================
[07:12:28] [SKIPPED] xe_migrate_sanity_kunit
[07:12:28] =================== [SKIPPED] xe_migrate ===================
[07:12:28] =================== xe_pci (2 subtests) ====================
[07:12:28] [PASSED] xe_gmdid_graphics_ip
[07:12:28] [PASSED] xe_gmdid_media_ip
[07:12:28] ===================== [PASSED] xe_pci ======================
[07:12:28] ==================== xe_rtp (1 subtest) ====================
[07:12:28] ================== xe_rtp_process_tests  ===================
[07:12:28] [PASSED] coalesce-same-reg
[07:12:28] [PASSED] no-match-no-add
[07:12:28] [PASSED] no-match-no-add-multiple-rules
[07:12:28] [PASSED] two-regs-two-entries
[07:12:28] [PASSED] clr-one-set-other
[07:12:28] [PASSED] set-field
[07:12:28] [PASSED] conflict-duplicate
[07:12:28] [PASSED] conflict-not-disjoint
[07:12:28] [PASSED] conflict-reg-type
[07:12:28] ============== [PASSED] xe_rtp_process_tests ===============
[07:12:28] ===================== [PASSED] xe_rtp ======================
[07:12:28] ==================== xe_wa (1 subtest) =====================
[07:12:28] ======================== xe_wa_gt  =========================
[07:12:28] [PASSED] TIGERLAKE (B0)
[07:12:28] [PASSED] DG1 (A0)
[07:12:28] [PASSED] DG1 (B0)
[07:12:28] [PASSED] ALDERLAKE_S (A0)
[07:12:28] [PASSED] ALDERLAKE_S (B0)
[07:12:28] [PASSED] ALDERLAKE_S (C0)
[07:12:28] [PASSED] ALDERLAKE_S (D0)
[07:12:28] [PASSED] ALDERLAKE_P (A0)
[07:12:28] [PASSED] ALDERLAKE_P (B0)
[07:12:28] [PASSED] ALDERLAKE_P (C0)
[07:12:28] [PASSED] DG2_G10 (A0)
[07:12:28] [PASSED] DG2_G10 (A1)
[07:12:28] [PASSED] DG2_G10 (B0)
[07:12:28] [PASSED] DG2_G10 (C0)
[07:12:28] [PASSED] DG2_G11 (A0)
[07:12:28] [PASSED] DG2_G11 (B0)
[07:12:28] [PASSED] DG2_G11 (B1)
[07:12:28] [PASSED] DG2_G12 (A0)
[07:12:28] [PASSED] DG2_G12 (A1)
[07:12:28] [PASSED] PVC (B0)
[07:12:28] [PASSED] PVC (B1)
[07:12:28] [PASSED] PVC (C0)
[07:12:28] ==================== [PASSED] xe_wa_gt =====================
[07:12:28] ====================== [PASSED] xe_wa ======================
[07:12:28] ============================================================
[07:12:28] Testing complete. Ran 37 tests: passed: 33, skipped: 4
[07:12:29] Elapsed time: 23.874s total, 4.183s configuring, 19.572s building, 0.097s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[07:12:29] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:12:30] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[07:12:50] Starting KUnit Kernel (1/1)...
[07:12:50] ============================================================
[07:12:50] ============ drm_test_pick_cmdline (2 subtests) ============
[07:12:50] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[07:12:50] =============== drm_test_pick_cmdline_named  ===============
[07:12:50] [PASSED] NTSC
[07:12:50] [PASSED] NTSC-J
[07:12:50] [PASSED] PAL
[07:12:50] [PASSED] PAL-M
[07:12:50] =========== [PASSED] drm_test_pick_cmdline_named ===========
[07:12:50] ============== [PASSED] drm_test_pick_cmdline ==============
[07:12:50] ================== drm_buddy (6 subtests) ==================
[07:12:50] [PASSED] drm_test_buddy_alloc_limit
[07:12:50] [PASSED] drm_test_buddy_alloc_range
[07:12:50] [PASSED] drm_test_buddy_alloc_optimistic
[07:12:50] [PASSED] drm_test_buddy_alloc_pessimistic
[07:12:50] [PASSED] drm_test_buddy_alloc_smoke
[07:12:50] [PASSED] drm_test_buddy_alloc_pathological
[07:12:50] ==================== [PASSED] drm_buddy ====================
[07:12:50] ============= drm_cmdline_parser (40 subtests) =============
[07:12:50] [PASSED] drm_test_cmdline_force_d_only
[07:12:50] [PASSED] drm_test_cmdline_force_D_only_dvi
[07:12:50] [PASSED] drm_test_cmdline_force_D_only_hdmi
[07:12:50] [PASSED] drm_test_cmdline_force_D_only_not_digital
[07:12:50] [PASSED] drm_test_cmdline_force_e_only
[07:12:50] [PASSED] drm_test_cmdline_res
[07:12:50] [PASSED] drm_test_cmdline_res_vesa
[07:12:50] [PASSED] drm_test_cmdline_res_vesa_rblank
[07:12:50] [PASSED] drm_test_cmdline_res_rblank
[07:12:50] [PASSED] drm_test_cmdline_res_bpp
[07:12:50] [PASSED] drm_test_cmdline_res_refresh
[07:12:50] [PASSED] drm_test_cmdline_res_bpp_refresh
[07:12:50] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[07:12:50] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[07:12:50] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[07:12:50] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[07:12:50] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[07:12:50] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[07:12:50] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[07:12:50] [PASSED] drm_test_cmdline_res_margins_force_on
[07:12:50] [PASSED] drm_test_cmdline_res_vesa_margins
[07:12:50] [PASSED] drm_test_cmdline_name
[07:12:50] [PASSED] drm_test_cmdline_name_bpp
[07:12:50] [PASSED] drm_test_cmdline_name_option
[07:12:50] [PASSED] drm_test_cmdline_name_bpp_option
[07:12:50] [PASSED] drm_test_cmdline_rotate_0
[07:12:50] [PASSED] drm_test_cmdline_rotate_90
[07:12:50] [PASSED] drm_test_cmdline_rotate_180
[07:12:50] [PASSED] drm_test_cmdline_rotate_270
[07:12:50] [PASSED] drm_test_cmdline_hmirror
[07:12:50] [PASSED] drm_test_cmdline_vmirror
[07:12:50] [PASSED] drm_test_cmdline_margin_options
[07:12:50] [PASSED] drm_test_cmdline_multiple_options
[07:12:50] [PASSED] drm_test_cmdline_bpp_extra_and_option
[07:12:50] [PASSED] drm_test_cmdline_extra_and_option
[07:12:50] [PASSED] drm_test_cmdline_freestanding_options
[07:12:50] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[07:12:50] [PASSED] drm_test_cmdline_panel_orientation
[07:12:50] ================ drm_test_cmdline_invalid  =================
[07:12:50] [PASSED] margin_only
[07:12:50] [PASSED] interlace_only
[07:12:50] [PASSED] res_missing_x
[07:12:50] [PASSED] res_missing_y
[07:12:50] [PASSED] res_bad_y
[07:12:50] [PASSED] res_missing_y_bpp
[07:12:50] [PASSED] res_bad_bpp
[07:12:50] [PASSED] res_bad_refresh
[07:12:50] [PASSED] res_bpp_refresh_force_on_off
[07:12:50] [PASSED] res_invalid_mode
[07:12:50] [PASSED] res_bpp_wrong_place_mode
[07:12:50] [PASSED] name_bpp_refresh
[07:12:50] [PASSED] name_refresh
[07:12:50] [PASSED] name_refresh_wrong_mode
[07:12:50] [PASSED] name_refresh_invalid_mode
[07:12:50] [PASSED] rotate_multiple
[07:12:50] [PASSED] rotate_invalid_val
[07:12:50] [PASSED] rotate_truncated
[07:12:50] [PASSED] invalid_option
[07:12:50] [PASSED] invalid_tv_option
[07:12:50] [PASSED] truncated_tv_option
[07:12:50] ============ [PASSED] drm_test_cmdline_invalid =============
[07:12:50] =============== drm_test_cmdline_tv_options  ===============
[07:12:50] [PASSED] NTSC
[07:12:50] [PASSED] NTSC_443
[07:12:50] [PASSED] NTSC_J
[07:12:50] [PASSED] PAL
[07:12:50] [PASSED] PAL_M
[07:12:50] [PASSED] PAL_N
[07:12:50] [PASSED] SECAM
[07:12:50] =========== [PASSED] drm_test_cmdline_tv_options ===========
[07:12:50] =============== [PASSED] drm_cmdline_parser ================
[07:12:50] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[07:12:50] ========== drm_test_get_tv_mode_from_name_valid  ===========
[07:12:50] [PASSED] NTSC
[07:12:50] [PASSED] NTSC-443
[07:12:50] [PASSED] NTSC-J
[07:12:50] [PASSED] PAL
[07:12:50] [PASSED] PAL-M
[07:12:50] [PASSED] PAL-N
[07:12:50] [PASSED] SECAM
[07:12:50] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[07:12:50] [PASSED] drm_test_get_tv_mode_from_name_truncated
[07:12:50] ============ [PASSED] drm_get_tv_mode_from_name ============
[07:12:50] ============= drm_damage_helper (21 subtests) ==============
[07:12:50] [PASSED] drm_test_damage_iter_no_damage
[07:12:50] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[07:12:50] [PASSED] drm_test_damage_iter_no_damage_src_moved
[07:12:50] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[07:12:50] [PASSED] drm_test_damage_iter_no_damage_not_visible
[07:12:50] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[07:12:50] [PASSED] drm_test_damage_iter_no_damage_no_fb
[07:12:50] [PASSED] drm_test_damage_iter_simple_damage
[07:12:50] [PASSED] drm_test_damage_iter_single_damage
[07:12:50] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[07:12:50] [PASSED] drm_test_damage_iter_single_damage_outside_src
[07:12:50] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[07:12:50] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[07:12:50] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[07:12:50] [PASSED] drm_test_damage_iter_single_damage_src_moved
[07:12:50] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[07:12:50] [PASSED] drm_test_damage_iter_damage
[07:12:50] [PASSED] drm_test_damage_iter_damage_one_intersect
[07:12:50] [PASSED] drm_test_damage_iter_damage_one_outside
[07:12:50] [PASSED] drm_test_damage_iter_damage_src_moved
[07:12:50] [PASSED] drm_test_damage_iter_damage_not_visible
[07:12:50] ================ [PASSED] drm_damage_helper ================
[07:12:50] ============== drm_dp_mst_helper (2 subtests) ==============
[07:12:50] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[07:12:50] [PASSED] Clock 154000 BPP 30 DSC disabled
[07:12:50] [PASSED] Clock 234000 BPP 30 DSC disabled
[07:12:50] [PASSED] Clock 297000 BPP 24 DSC disabled
[07:12:50] [PASSED] Clock 332880 BPP 24 DSC enabled
[07:12:50] [PASSED] Clock 324540 BPP 24 DSC enabled
[07:12:50] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[07:12:50] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[07:12:50] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[07:12:50] [PASSED] DP_POWER_UP_PHY with port number
[07:12:50] [PASSED] DP_POWER_DOWN_PHY with port number
[07:12:50] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[07:12:50] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[07:12:50] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[07:12:50] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[07:12:50] [PASSED] DP_QUERY_PAYLOAD with port number
[07:12:50] [PASSED] DP_QUERY_PAYLOAD with VCPI
[07:12:50] [PASSED] DP_REMOTE_DPCD_READ with port number
[07:12:50] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[07:12:50] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[07:12:50] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[07:12:50] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[07:12:50] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[07:12:50] [PASSED] DP_REMOTE_I2C_READ with port number
[07:12:50] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[07:12:50] [PASSED] DP_REMOTE_I2C_READ with transactions array
[07:12:50] [PASSED] DP_REMOTE_I2C_WRITE with port number
[07:12:50] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[07:12:50] [PASSED] DP_REMOTE_I2C_WRITE with data array
[07:12:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[07:12:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[07:12:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[07:12:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[07:12:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[07:12:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[07:12:50] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[07:12:50] ================ [PASSED] drm_dp_mst_helper ================
[07:12:50] =========== drm_format_helper_test (11 subtests) ===========
[07:12:50] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[07:12:50] [PASSED] single_pixel_source_buffer
[07:12:50] [PASSED] single_pixel_clip_rectangle
[07:12:50] [PASSED] well_known_colors
[07:12:50] [PASSED] destination_pitch
[07:12:50] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[07:12:50] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[07:12:50] [PASSED] single_pixel_source_buffer
[07:12:50] [PASSED] single_pixel_clip_rectangle
[07:12:50] [PASSED] well_known_colors
[07:12:50] [PASSED] destination_pitch
[07:12:50] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[07:12:50] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[07:12:50] [PASSED] single_pixel_source_buffer
[07:12:50] [PASSED] single_pixel_clip_rectangle
[07:12:50] [PASSED] well_known_colors
[07:12:50] [PASSED] destination_pitch
[07:12:50] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[07:12:50] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[07:12:50] [PASSED] single_pixel_source_buffer
[07:12:50] [PASSED] single_pixel_clip_rectangle
[07:12:50] [PASSED] well_known_colors
[07:12:50] [PASSED] destination_pitch
[07:12:50] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[07:12:50] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[07:12:50] [PASSED] single_pixel_source_buffer
[07:12:50] [PASSED] single_pixel_clip_rectangle
[07:12:50] [PASSED] well_known_colors
[07:12:50] [PASSED] destination_pitch
[07:12:50] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[07:12:50] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[07:12:50] [PASSED] single_pixel_source_buffer
[07:12:50] [PASSED] single_pixel_clip_rectangle
[07:12:50] [PASSED] well_known_colors
[07:12:50] [PASSED] destination_pitch
[07:12:50] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[07:12:50] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[07:12:50] [PASSED] single_pixel_source_buffer
[07:12:50] [PASSED] single_pixel_clip_rectangle
[07:12:50] [PASSED] well_known_colors
[07:12:50] [PASSED] destination_pitch
[07:12:50] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[07:12:50] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[07:12:50] [PASSED] single_pixel_source_buffer
[07:12:50] [PASSED] single_pixel_clip_rectangle
[07:12:50] [PASSED] well_known_colors
[07:12:50] [PASSED] destination_pitch
[07:12:50] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[07:12:50] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[07:12:50] [PASSED] single_pixel_source_buffer
[07:12:50] [PASSED] single_pixel_clip_rectangle
[07:12:50] [PASSED] well_known_colors
[07:12:50] [PASSED] destination_pitch
[07:12:50] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[07:12:50] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[07:12:50] [PASSED] single_pixel_source_buffer
[07:12:50] [PASSED] single_pixel_clip_rectangle
[07:12:50] [PASSED] well_known_colors
[07:12:50] [PASSED] destination_pitch
[07:12:50] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[07:12:50] ============== drm_test_fb_xrgb8888_to_mono  ===============
[07:12:50] [PASSED] single_pixel_source_buffer
[07:12:50] [PASSED] single_pixel_clip_rectangle
[07:12:50] [PASSED] well_known_colors
[07:12:50] [PASSED] destination_pitch
[07:12:50] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[07:12:50] ============= [PASSED] drm_format_helper_test ==============
[07:12:50] ================= drm_format (18 subtests) =================
[07:12:50] [PASSED] drm_test_format_block_width_invalid
[07:12:50] [PASSED] drm_test_format_block_width_one_plane
[07:12:50] [PASSED] drm_test_format_block_width_two_plane
[07:12:50] [PASSED] drm_test_format_block_width_three_plane
[07:12:50] [PASSED] drm_test_format_block_width_tiled
[07:12:50] [PASSED] drm_test_format_block_height_invalid
[07:12:50] [PASSED] drm_test_format_block_height_one_plane
[07:12:50] [PASSED] drm_test_format_block_height_two_plane
[07:12:50] [PASSED] drm_test_format_block_height_three_plane
[07:12:50] [PASSED] drm_test_format_block_height_tiled
[07:12:50] [PASSED] drm_test_format_min_pitch_invalid
[07:12:50] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[07:12:50] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[07:12:50] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[07:12:50] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[07:12:50] [PASSED] drm_test_format_min_pitch_two_plane
[07:12:50] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[07:12:50] [PASSED] drm_test_format_min_pitch_tiled
[07:12:50] =================== [PASSED] drm_format ====================
[07:12:50] =============== drm_framebuffer (1 subtest) ================
[07:12:50] =============== drm_test_framebuffer_create  ===============
[07:12:50] [PASSED] ABGR8888 normal sizes
[07:12:50] [PASSED] ABGR8888 max sizes
[07:12:50] [PASSED] ABGR8888 pitch greater than min required
[07:12:50] [PASSED] ABGR8888 pitch less than min required
[07:12:50] [PASSED] ABGR8888 Invalid width
[07:12:50] [PASSED] ABGR8888 Invalid buffer handle
[07:12:50] [PASSED] No pixel format
[07:12:50] [PASSED] ABGR8888 Width 0
[07:12:50] [PASSED] ABGR8888 Height 0
[07:12:50] [PASSED] ABGR8888 Out of bound height * pitch combination
[07:12:50] [PASSED] ABGR8888 Large buffer offset
[07:12:50] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[07:12:50] [PASSED] ABGR8888 Valid buffer modifier
[07:12:50] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[07:12:50] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[07:12:50] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[07:12:50] [PASSED] NV12 Normal sizes
[07:12:50] [PASSED] NV12 Max sizes
[07:12:50] [PASSED] NV12 Invalid pitch
[07:12:50] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[07:12:50] [PASSED] NV12 different  modifier per-plane
[07:12:50] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[07:12:50] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[07:12:50] [PASSED] NV12 Modifier for inexistent plane
[07:12:50] [PASSED] NV12 Handle for inexistent plane
[07:12:50] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[07:12:50] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[07:12:50] [PASSED] YVU420 Normal sizes
[07:12:50] [PASSED] YVU420 Max sizes
[07:12:50] [PASSED] YVU420 Invalid pitch
[07:12:50] [PASSED] YVU420 Different pitches
[07:12:50] [PASSED] YVU420 Different buffer offsets/pitches
[07:12:50] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[07:12:50] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[07:12:50] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[07:12:50] [PASSED] YVU420 Valid modifier
[07:12:50] [PASSED] YVU420 Different modifiers per plane
[07:12:50] [PASSED] YVU420 Modifier for inexistent plane
[07:12:50] [PASSED] X0L2 Normal sizes
[07:12:50] [PASSED] X0L2 Max sizes
[07:12:50] [PASSED] X0L2 Invalid pitch
[07:12:50] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[07:12:50] [PASSED] X0L2 Handle for inexistent plane
[07:12:50] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[07:12:50] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[07:12:50] [PASSED] X0L2 Valid modifier
[07:12:50] [PASSED] X0L2 Modifier for inexistent plane
[07:12:50] =========== [PASSED] drm_test_framebuffer_create ===========
[07:12:50] ================= [PASSED] drm_framebuffer =================
[07:12:50] =============== drm-test-managed (1 subtest) ===============
[07:12:50] [PASSED] drm_test_managed_run_action
[07:12:50] ================ [PASSED] drm-test-managed =================
[07:12:50] =================== drm_mm (19 subtests) ===================
[07:12:50] [PASSED] drm_test_mm_init
[07:12:50] [PASSED] drm_test_mm_debug
[07:13:00] [PASSED] drm_test_mm_reserve
[07:13:10] [PASSED] drm_test_mm_insert
[07:13:11] [PASSED] drm_test_mm_replace
[07:13:11] [PASSED] drm_test_mm_insert_range
[07:13:11] [PASSED] drm_test_mm_frag
[07:13:11] [PASSED] drm_test_mm_align
[07:13:11] [PASSED] drm_test_mm_align32
[07:13:11] [PASSED] drm_test_mm_align64
[07:13:11] [PASSED] drm_test_mm_evict
[07:13:11] [PASSED] drm_test_mm_evict_range
[07:13:11] [PASSED] drm_test_mm_topdown
[07:13:11] [PASSED] drm_test_mm_bottomup
[07:13:11] [PASSED] drm_test_mm_lowest
[07:13:11] [PASSED] drm_test_mm_highest
[07:13:12] [PASSED] drm_test_mm_color
[07:13:13] [PASSED] drm_test_mm_color_evict
[07:13:13] [PASSED] drm_test_mm_color_evict_range
[07:13:13] ===================== [PASSED] drm_mm ======================
[07:13:13] ============= drm_modes_analog_tv (4 subtests) =============
[07:13:13] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[07:13:13] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[07:13:13] [PASSED] drm_test_modes_analog_tv_pal_576i
[07:13:13] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[07:13:13] =============== [PASSED] drm_modes_analog_tv ===============
[07:13:13] ============== drm_plane_helper (2 subtests) ===============
[07:13:13] =============== drm_test_check_plane_state  ================
[07:13:13] [PASSED] clipping_simple
[07:13:13] [PASSED] clipping_rotate_reflect
[07:13:13] [PASSED] positioning_simple
[07:13:13] [PASSED] upscaling
[07:13:13] [PASSED] downscaling
[07:13:13] [PASSED] rounding1
[07:13:13] [PASSED] rounding2
[07:13:13] [PASSED] rounding3
[07:13:13] [PASSED] rounding4
[07:13:13] =========== [PASSED] drm_test_check_plane_state ============
[07:13:13] =========== drm_test_check_invalid_plane_state  ============
[07:13:13] [PASSED] positioning_invalid
[07:13:13] [PASSED] upscaling_invalid
[07:13:13] [PASSED] downscaling_invalid
[07:13:13] ======= [PASSED] drm_test_check_invalid_plane_state ========
[07:13:13] ================ [PASSED] drm_plane_helper =================
[07:13:13] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[07:13:13] ====== drm_test_connector_helper_tv_get_modes_check  =======
[07:13:13] [PASSED] None
[07:13:13] [PASSED] PAL
[07:13:13] [PASSED] NTSC
[07:13:13] [PASSED] Both, NTSC Default
[07:13:13] [PASSED] Both, PAL Default
[07:13:13] [PASSED] Both, NTSC Default, with PAL on command-line
[07:13:13] [PASSED] Both, PAL Default, with NTSC on command-line
[07:13:13] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[07:13:13] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[07:13:13] ================== drm_rect (9 subtests) ===================
[07:13:13] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[07:13:13] [PASSED] drm_test_rect_clip_scaled_not_clipped
[07:13:13] [PASSED] drm_test_rect_clip_scaled_clipped
[07:13:13] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[07:13:13] ================= drm_test_rect_intersect  =================
[07:13:13] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[07:13:13] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[07:13:13] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[07:13:13] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[07:13:13] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[07:13:13] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[07:13:13] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[07:13:13] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[07:13:13] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[07:13:13] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[07:13:13] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[07:13:13] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[07:13:13] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[07:13:13] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[07:13:13] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[07:13:13] ============= [PASSED] drm_test_rect_intersect =============
[07:13:13] ================ drm_test_rect_calc_hscale  ================
[07:13:13] [PASSED] normal use
[07:13:13] [PASSED] out of max range
[07:13:13] [PASSED] out of min range
[07:13:13] [PASSED] zero dst
[07:13:13] [PASSED] negative src
[07:13:13] [PASSED] negative dst
[07:13:13] ============ [PASSED] drm_test_rect_calc_hscale ============
[07:13:13] ================ drm_test_rect_calc_vscale  ================
[07:13:13] [PASSED] normal use
[07:13:13] [PASSED] out of max range
[07:13:13] [PASSED] out of min range
[07:13:13] [PASSED] zero dst
[07:13:13] [PASSED] negative src
[07:13:13] [PASSED] negative dst
[07:13:13] ============ [PASSED] drm_test_rect_calc_vscale ============
[07:13:13] ================== drm_test_rect_rotate  ===================
[07:13:13] [PASSED] reflect-x
[07:13:13] [PASSED] reflect-y
[07:13:13] [PASSED] rotate-0
[07:13:13] [PASSED] rotate-90
[07:13:13] [PASSED] rotate-180
[07:13:13] [PASSED] rotate-270
[07:13:13] ============== [PASSED] drm_test_rect_rotate ===============
[07:13:13] ================ drm_test_rect_rotate_inv  =================
[07:13:13] [PASSED] reflect-x
[07:13:13] [PASSED] reflect-y
[07:13:13] [PASSED] rotate-0
[07:13:13] [PASSED] rotate-90
[07:13:13] [PASSED] rotate-180
[07:13:13] [PASSED] rotate-270
[07:13:13] ============ [PASSED] drm_test_rect_rotate_inv =============
[07:13:13] ==================== [PASSED] drm_rect =====================
[07:13:13] ================== drm_exec (7 subtests) ===================
[07:13:13] [PASSED] sanitycheck
[07:13:13] [PASSED] test_lock
[07:13:13] [PASSED] test_lock_unlock
[07:13:13] [PASSED] test_duplicates
[07:13:13] [PASSED] test_prepare
[07:13:13] [PASSED] test_prepare_array
[07:13:13] [PASSED] test_multiple_loops
[07:13:13] ==================== [PASSED] drm_exec =====================
[07:13:13] ============================================================
[07:13:13] Testing complete. Ran 340 tests: passed: 340
[07:13:13] Elapsed time: 44.154s total, 1.656s configuring, 19.568s building, 22.917s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


