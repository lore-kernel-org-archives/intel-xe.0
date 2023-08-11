Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E46C001B0
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 20:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3164710E6F7;
	Fri, 11 Aug 2023 20:33:00 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A886010E6F7;
 Fri, 11 Aug 2023 20:32:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A25C2AADD2;
 Fri, 11 Aug 2023 20:32:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Fri, 11 Aug 2023 20:32:57 -0000
Message-ID: <169178597766.3118.6868431112271363302@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230811202852.962-1-michal.wajdeczko@intel.com>
In-Reply-To: <20230811202852.962-1-michal.wajdeczko@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe?=
 =?utf-8?q?=3A_Introduce_Xe_assert_macros_=28rev2=29?=
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

Series: drm/xe: Introduce Xe assert macros (rev2)
URL   : https://patchwork.freedesktop.org/series/122240/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[20:31:45] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:31:49] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[20:32:08] Starting KUnit Kernel (1/1)...
[20:32:08] ============================================================
[20:32:09] ==================== xe_bo (2 subtests) ====================
[20:32:09] [SKIPPED] xe_ccs_migrate_kunit
[20:32:09] [SKIPPED] xe_bo_evict_kunit
[20:32:09] ===================== [SKIPPED] xe_bo ======================
[20:32:09] ================== xe_dma_buf (1 subtest) ==================
[20:32:09] [SKIPPED] xe_dma_buf_kunit
[20:32:09] =================== [SKIPPED] xe_dma_buf ===================
[20:32:09] ================== xe_migrate (1 subtest) ==================
[20:32:09] [SKIPPED] xe_migrate_sanity_kunit
[20:32:09] =================== [SKIPPED] xe_migrate ===================
[20:32:09] =================== xe_pci (2 subtests) ====================
[20:32:09] [PASSED] xe_gmdid_graphics_ip
[20:32:09] [PASSED] xe_gmdid_media_ip
[20:32:09] ===================== [PASSED] xe_pci ======================
[20:32:09] ==================== xe_rtp (1 subtest) ====================
[20:32:09] ================== xe_rtp_process_tests  ===================
[20:32:09] [PASSED] coalesce-same-reg
[20:32:09] [PASSED] no-match-no-add
[20:32:09] [PASSED] no-match-no-add-multiple-rules
[20:32:09] [PASSED] two-regs-two-entries
[20:32:09] [PASSED] clr-one-set-other
[20:32:09] [PASSED] set-field
[20:32:09] [PASSED] conflict-duplicate
[20:32:09] [PASSED] conflict-not-disjoint
[20:32:09] [PASSED] conflict-reg-type
[20:32:09] ============== [PASSED] xe_rtp_process_tests ===============
[20:32:09] ===================== [PASSED] xe_rtp ======================
[20:32:09] ==================== xe_wa (1 subtest) =====================
[20:32:09] ======================== xe_wa_gt  =========================
[20:32:09] [PASSED] TIGERLAKE (B0)
[20:32:09] [PASSED] DG1 (A0)
[20:32:09] [PASSED] DG1 (B0)
[20:32:09] [PASSED] ALDERLAKE_S (A0)
[20:32:09] [PASSED] ALDERLAKE_S (B0)
[20:32:09] [PASSED] ALDERLAKE_S (C0)
[20:32:09] [PASSED] ALDERLAKE_S (D0)
[20:32:09] [PASSED] ALDERLAKE_P (A0)
[20:32:09] [PASSED] ALDERLAKE_P (B0)
[20:32:09] [PASSED] ALDERLAKE_P (C0)
[20:32:09] [PASSED] DG2_G10 (A0)
[20:32:09] [PASSED] DG2_G10 (A1)
[20:32:09] [PASSED] DG2_G10 (B0)
[20:32:09] [PASSED] DG2_G10 (C0)
[20:32:09] [PASSED] DG2_G11 (A0)
[20:32:09] [PASSED] DG2_G11 (B0)
[20:32:09] [PASSED] DG2_G11 (B1)
[20:32:09] [PASSED] DG2_G12 (A0)
[20:32:09] [PASSED] DG2_G12 (A1)
[20:32:09] [PASSED] PVC (B0)
[20:32:09] [PASSED] PVC (B1)
[20:32:09] [PASSED] PVC (C0)
[20:32:09] ==================== [PASSED] xe_wa_gt =====================
[20:32:09] ====================== [PASSED] xe_wa ======================
[20:32:09] ============================================================
[20:32:09] Testing complete. Ran 37 tests: passed: 33, skipped: 4
[20:32:09] Elapsed time: 23.558s total, 4.231s configuring, 19.208s building, 0.101s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[20:32:09] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:32:10] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[20:32:29] Starting KUnit Kernel (1/1)...
[20:32:29] ============================================================
[20:32:29] ============ drm_test_pick_cmdline (2 subtests) ============
[20:32:29] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[20:32:29] =============== drm_test_pick_cmdline_named  ===============
[20:32:29] [PASSED] NTSC
[20:32:29] [PASSED] NTSC-J
[20:32:29] [PASSED] PAL
[20:32:29] [PASSED] PAL-M
[20:32:29] =========== [PASSED] drm_test_pick_cmdline_named ===========
[20:32:29] ============== [PASSED] drm_test_pick_cmdline ==============
[20:32:29] ================== drm_buddy (6 subtests) ==================
[20:32:29] [PASSED] drm_test_buddy_alloc_limit
[20:32:29] [PASSED] drm_test_buddy_alloc_range
[20:32:29] [PASSED] drm_test_buddy_alloc_optimistic
[20:32:29] [PASSED] drm_test_buddy_alloc_pessimistic
[20:32:29] [PASSED] drm_test_buddy_alloc_smoke
[20:32:29] [PASSED] drm_test_buddy_alloc_pathological
[20:32:29] ==================== [PASSED] drm_buddy ====================
[20:32:29] ============= drm_cmdline_parser (40 subtests) =============
[20:32:29] [PASSED] drm_test_cmdline_force_d_only
[20:32:29] [PASSED] drm_test_cmdline_force_D_only_dvi
[20:32:29] [PASSED] drm_test_cmdline_force_D_only_hdmi
[20:32:29] [PASSED] drm_test_cmdline_force_D_only_not_digital
[20:32:29] [PASSED] drm_test_cmdline_force_e_only
[20:32:29] [PASSED] drm_test_cmdline_res
[20:32:29] [PASSED] drm_test_cmdline_res_vesa
[20:32:29] [PASSED] drm_test_cmdline_res_vesa_rblank
[20:32:29] [PASSED] drm_test_cmdline_res_rblank
[20:32:29] [PASSED] drm_test_cmdline_res_bpp
[20:32:29] [PASSED] drm_test_cmdline_res_refresh
[20:32:29] [PASSED] drm_test_cmdline_res_bpp_refresh
[20:32:29] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[20:32:29] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[20:32:29] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[20:32:29] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[20:32:29] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[20:32:29] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[20:32:29] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[20:32:29] [PASSED] drm_test_cmdline_res_margins_force_on
[20:32:29] [PASSED] drm_test_cmdline_res_vesa_margins
[20:32:29] [PASSED] drm_test_cmdline_name
[20:32:29] [PASSED] drm_test_cmdline_name_bpp
[20:32:29] [PASSED] drm_test_cmdline_name_option
[20:32:29] [PASSED] drm_test_cmdline_name_bpp_option
[20:32:29] [PASSED] drm_test_cmdline_rotate_0
[20:32:29] [PASSED] drm_test_cmdline_rotate_90
[20:32:29] [PASSED] drm_test_cmdline_rotate_180
[20:32:29] [PASSED] drm_test_cmdline_rotate_270
[20:32:29] [PASSED] drm_test_cmdline_hmirror
[20:32:29] [PASSED] drm_test_cmdline_vmirror
[20:32:29] [PASSED] drm_test_cmdline_margin_options
[20:32:29] [PASSED] drm_test_cmdline_multiple_options
[20:32:29] [PASSED] drm_test_cmdline_bpp_extra_and_option
[20:32:29] [PASSED] drm_test_cmdline_extra_and_option
[20:32:29] [PASSED] drm_test_cmdline_freestanding_options
[20:32:29] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[20:32:29] [PASSED] drm_test_cmdline_panel_orientation
[20:32:29] ================ drm_test_cmdline_invalid  =================
[20:32:29] [PASSED] margin_only
[20:32:29] [PASSED] interlace_only
[20:32:29] [PASSED] res_missing_x
[20:32:29] [PASSED] res_missing_y
[20:32:29] [PASSED] res_bad_y
[20:32:29] [PASSED] res_missing_y_bpp
[20:32:29] [PASSED] res_bad_bpp
[20:32:29] [PASSED] res_bad_refresh
[20:32:29] [PASSED] res_bpp_refresh_force_on_off
[20:32:29] [PASSED] res_invalid_mode
[20:32:29] [PASSED] res_bpp_wrong_place_mode
[20:32:29] [PASSED] name_bpp_refresh
[20:32:29] [PASSED] name_refresh
[20:32:29] [PASSED] name_refresh_wrong_mode
[20:32:29] [PASSED] name_refresh_invalid_mode
[20:32:29] [PASSED] rotate_multiple
[20:32:29] [PASSED] rotate_invalid_val
[20:32:29] [PASSED] rotate_truncated
[20:32:29] [PASSED] invalid_option
[20:32:29] [PASSED] invalid_tv_option
[20:32:29] [PASSED] truncated_tv_option
[20:32:29] ============ [PASSED] drm_test_cmdline_invalid =============
[20:32:29] =============== drm_test_cmdline_tv_options  ===============
[20:32:29] [PASSED] NTSC
[20:32:29] [PASSED] NTSC_443
[20:32:29] [PASSED] NTSC_J
[20:32:29] [PASSED] PAL
[20:32:29] [PASSED] PAL_M
[20:32:29] [PASSED] PAL_N
[20:32:29] [PASSED] SECAM
[20:32:29] =========== [PASSED] drm_test_cmdline_tv_options ===========
[20:32:29] =============== [PASSED] drm_cmdline_parser ================
[20:32:29] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[20:32:29] ========== drm_test_get_tv_mode_from_name_valid  ===========
[20:32:29] [PASSED] NTSC
[20:32:29] [PASSED] NTSC-443
[20:32:29] [PASSED] NTSC-J
[20:32:29] [PASSED] PAL
[20:32:29] [PASSED] PAL-M
[20:32:29] [PASSED] PAL-N
[20:32:29] [PASSED] SECAM
[20:32:29] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[20:32:29] [PASSED] drm_test_get_tv_mode_from_name_truncated
[20:32:29] ============ [PASSED] drm_get_tv_mode_from_name ============
[20:32:29] ============= drm_damage_helper (21 subtests) ==============
[20:32:29] [PASSED] drm_test_damage_iter_no_damage
[20:32:29] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[20:32:29] [PASSED] drm_test_damage_iter_no_damage_src_moved
[20:32:29] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[20:32:29] [PASSED] drm_test_damage_iter_no_damage_not_visible
[20:32:29] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[20:32:29] [PASSED] drm_test_damage_iter_no_damage_no_fb
[20:32:29] [PASSED] drm_test_damage_iter_simple_damage
[20:32:29] [PASSED] drm_test_damage_iter_single_damage
[20:32:29] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[20:32:29] [PASSED] drm_test_damage_iter_single_damage_outside_src
[20:32:29] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[20:32:29] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[20:32:29] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[20:32:29] [PASSED] drm_test_damage_iter_single_damage_src_moved
[20:32:29] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[20:32:29] [PASSED] drm_test_damage_iter_damage
[20:32:29] [PASSED] drm_test_damage_iter_damage_one_intersect
[20:32:29] [PASSED] drm_test_damage_iter_damage_one_outside
[20:32:29] [PASSED] drm_test_damage_iter_damage_src_moved
[20:32:29] [PASSED] drm_test_damage_iter_damage_not_visible
[20:32:29] ================ [PASSED] drm_damage_helper ================
[20:32:29] ============== drm_dp_mst_helper (2 subtests) ==============
[20:32:29] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[20:32:29] [PASSED] Clock 154000 BPP 30 DSC disabled
[20:32:29] [PASSED] Clock 234000 BPP 30 DSC disabled
[20:32:29] [PASSED] Clock 297000 BPP 24 DSC disabled
[20:32:29] [PASSED] Clock 332880 BPP 24 DSC enabled
[20:32:29] [PASSED] Clock 324540 BPP 24 DSC enabled
[20:32:29] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[20:32:29] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[20:32:29] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[20:32:29] [PASSED] DP_POWER_UP_PHY with port number
[20:32:29] [PASSED] DP_POWER_DOWN_PHY with port number
[20:32:29] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[20:32:29] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[20:32:29] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[20:32:29] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[20:32:29] [PASSED] DP_QUERY_PAYLOAD with port number
[20:32:29] [PASSED] DP_QUERY_PAYLOAD with VCPI
[20:32:29] [PASSED] DP_REMOTE_DPCD_READ with port number
[20:32:29] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[20:32:29] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[20:32:29] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[20:32:29] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[20:32:29] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[20:32:29] [PASSED] DP_REMOTE_I2C_READ with port number
[20:32:29] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[20:32:29] [PASSED] DP_REMOTE_I2C_READ with transactions array
[20:32:29] [PASSED] DP_REMOTE_I2C_WRITE with port number
[20:32:29] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[20:32:29] [PASSED] DP_REMOTE_I2C_WRITE with data array
[20:32:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[20:32:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[20:32:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[20:32:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[20:32:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[20:32:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[20:32:29] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[20:32:29] ================ [PASSED] drm_dp_mst_helper ================
[20:32:29] =========== drm_format_helper_test (11 subtests) ===========
[20:32:29] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[20:32:29] [PASSED] single_pixel_source_buffer
[20:32:29] [PASSED] single_pixel_clip_rectangle
[20:32:29] [PASSED] well_known_colors
[20:32:29] [PASSED] destination_pitch
[20:32:29] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[20:32:29] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[20:32:29] [PASSED] single_pixel_source_buffer
[20:32:29] [PASSED] single_pixel_clip_rectangle
[20:32:29] [PASSED] well_known_colors
[20:32:29] [PASSED] destination_pitch
[20:32:29] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[20:32:29] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[20:32:29] [PASSED] single_pixel_source_buffer
[20:32:29] [PASSED] single_pixel_clip_rectangle
[20:32:29] [PASSED] well_known_colors
[20:32:29] [PASSED] destination_pitch
[20:32:29] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[20:32:29] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[20:32:29] [PASSED] single_pixel_source_buffer
[20:32:29] [PASSED] single_pixel_clip_rectangle
[20:32:29] [PASSED] well_known_colors
[20:32:29] [PASSED] destination_pitch
[20:32:29] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[20:32:29] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[20:32:29] [PASSED] single_pixel_source_buffer
[20:32:29] [PASSED] single_pixel_clip_rectangle
[20:32:29] [PASSED] well_known_colors
[20:32:29] [PASSED] destination_pitch
[20:32:29] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[20:32:29] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[20:32:29] [PASSED] single_pixel_source_buffer
[20:32:29] [PASSED] single_pixel_clip_rectangle
[20:32:29] [PASSED] well_known_colors
[20:32:29] [PASSED] destination_pitch
[20:32:29] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[20:32:29] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[20:32:29] [PASSED] single_pixel_source_buffer
[20:32:29] [PASSED] single_pixel_clip_rectangle
[20:32:29] [PASSED] well_known_colors
[20:32:29] [PASSED] destination_pitch
[20:32:29] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[20:32:29] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[20:32:29] [PASSED] single_pixel_source_buffer
[20:32:29] [PASSED] single_pixel_clip_rectangle
[20:32:29] [PASSED] well_known_colors
[20:32:29] [PASSED] destination_pitch
[20:32:29] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[20:32:29] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[20:32:29] [PASSED] single_pixel_source_buffer
[20:32:29] [PASSED] single_pixel_clip_rectangle
[20:32:29] [PASSED] well_known_colors
[20:32:29] [PASSED] destination_pitch
[20:32:29] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[20:32:29] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[20:32:29] [PASSED] single_pixel_source_buffer
[20:32:29] [PASSED] single_pixel_clip_rectangle
[20:32:29] [PASSED] well_known_colors
[20:32:29] [PASSED] destination_pitch
[20:32:29] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[20:32:29] ============== drm_test_fb_xrgb8888_to_mono  ===============
[20:32:29] [PASSED] single_pixel_source_buffer
[20:32:29] [PASSED] single_pixel_clip_rectangle
[20:32:29] [PASSED] well_known_colors
[20:32:29] [PASSED] destination_pitch
[20:32:29] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[20:32:29] ============= [PASSED] drm_format_helper_test ==============
[20:32:29] ================= drm_format (18 subtests) =================
[20:32:29] [PASSED] drm_test_format_block_width_invalid
[20:32:29] [PASSED] drm_test_format_block_width_one_plane
[20:32:29] [PASSED] drm_test_format_block_width_two_plane
[20:32:29] [PASSED] drm_test_format_block_width_three_plane
[20:32:29] [PASSED] drm_test_format_block_width_tiled
[20:32:29] [PASSED] drm_test_format_block_height_invalid
[20:32:29] [PASSED] drm_test_format_block_height_one_plane
[20:32:29] [PASSED] drm_test_format_block_height_two_plane
[20:32:29] [PASSED] drm_test_format_block_height_three_plane
[20:32:29] [PASSED] drm_test_format_block_height_tiled
[20:32:29] [PASSED] drm_test_format_min_pitch_invalid
[20:32:29] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[20:32:29] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[20:32:29] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[20:32:29] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[20:32:29] [PASSED] drm_test_format_min_pitch_two_plane
[20:32:29] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[20:32:29] [PASSED] drm_test_format_min_pitch_tiled
[20:32:29] =================== [PASSED] drm_format ====================
[20:32:29] =============== drm_framebuffer (1 subtest) ================
[20:32:29] =============== drm_test_framebuffer_create  ===============
[20:32:29] [PASSED] ABGR8888 normal sizes
[20:32:29] [PASSED] ABGR8888 max sizes
[20:32:29] [PASSED] ABGR8888 pitch greater than min required
[20:32:29] [PASSED] ABGR8888 pitch less than min required
[20:32:29] [PASSED] ABGR8888 Invalid width
[20:32:29] [PASSED] ABGR8888 Invalid buffer handle
[20:32:29] [PASSED] No pixel format
[20:32:29] [PASSED] ABGR8888 Width 0
[20:32:29] [PASSED] ABGR8888 Height 0
[20:32:29] [PASSED] ABGR8888 Out of bound height * pitch combination
[20:32:29] [PASSED] ABGR8888 Large buffer offset
[20:32:29] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[20:32:29] [PASSED] ABGR8888 Valid buffer modifier
[20:32:29] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[20:32:29] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[20:32:29] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[20:32:29] [PASSED] NV12 Normal sizes
[20:32:29] [PASSED] NV12 Max sizes
[20:32:29] [PASSED] NV12 Invalid pitch
[20:32:29] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[20:32:29] [PASSED] NV12 different  modifier per-plane
[20:32:29] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[20:32:29] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[20:32:29] [PASSED] NV12 Modifier for inexistent plane
[20:32:29] [PASSED] NV12 Handle for inexistent plane
[20:32:29] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[20:32:29] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[20:32:29] [PASSED] YVU420 Normal sizes
[20:32:29] [PASSED] YVU420 Max sizes
[20:32:29] [PASSED] YVU420 Invalid pitch
[20:32:29] [PASSED] YVU420 Different pitches
[20:32:29] [PASSED] YVU420 Different buffer offsets/pitches
[20:32:29] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[20:32:29] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[20:32:29] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[20:32:29] [PASSED] YVU420 Valid modifier
[20:32:29] [PASSED] YVU420 Different modifiers per plane
[20:32:29] [PASSED] YVU420 Modifier for inexistent plane
[20:32:29] [PASSED] X0L2 Normal sizes
[20:32:29] [PASSED] X0L2 Max sizes
[20:32:29] [PASSED] X0L2 Invalid pitch
[20:32:29] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[20:32:29] [PASSED] X0L2 Handle for inexistent plane
[20:32:29] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[20:32:29] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[20:32:29] [PASSED] X0L2 Valid modifier
[20:32:29] [PASSED] X0L2 Modifier for inexistent plane
[20:32:29] =========== [PASSED] drm_test_framebuffer_create ===========
[20:32:29] ================= [PASSED] drm_framebuffer =================
[20:32:29] =============== drm-test-managed (1 subtest) ===============
[20:32:29] [PASSED] drm_test_managed_run_action
[20:32:29] ================ [PASSED] drm-test-managed =================
[20:32:29] =================== drm_mm (19 subtests) ===================
[20:32:29] [PASSED] drm_test_mm_init
[20:32:30] [PASSED] drm_test_mm_debug
[20:32:39] [PASSED] drm_test_mm_reserve
[20:32:49] [PASSED] drm_test_mm_insert
[20:32:50] [PASSED] drm_test_mm_replace
[20:32:50] [PASSED] drm_test_mm_insert_range
[20:32:50] [PASSED] drm_test_mm_frag
[20:32:50] [PASSED] drm_test_mm_align
[20:32:50] [PASSED] drm_test_mm_align32
[20:32:50] [PASSED] drm_test_mm_align64
[20:32:50] [PASSED] drm_test_mm_evict
[20:32:50] [PASSED] drm_test_mm_evict_range
[20:32:50] [PASSED] drm_test_mm_topdown
[20:32:50] [PASSED] drm_test_mm_bottomup
[20:32:50] [PASSED] drm_test_mm_lowest
[20:32:51] [PASSED] drm_test_mm_highest
[20:32:51] [PASSED] drm_test_mm_color
[20:32:52] [PASSED] drm_test_mm_color_evict
[20:32:52] [PASSED] drm_test_mm_color_evict_range
[20:32:52] ===================== [PASSED] drm_mm ======================
[20:32:52] ============= drm_modes_analog_tv (4 subtests) =============
[20:32:52] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[20:32:52] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[20:32:52] [PASSED] drm_test_modes_analog_tv_pal_576i
[20:32:52] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[20:32:52] =============== [PASSED] drm_modes_analog_tv ===============
[20:32:52] ============== drm_plane_helper (2 subtests) ===============
[20:32:52] =============== drm_test_check_plane_state  ================
[20:32:52] [PASSED] clipping_simple
[20:32:52] [PASSED] clipping_rotate_reflect
[20:32:52] [PASSED] positioning_simple
[20:32:52] [PASSED] upscaling
[20:32:52] [PASSED] downscaling
[20:32:52] [PASSED] rounding1
[20:32:52] [PASSED] rounding2
[20:32:52] [PASSED] rounding3
[20:32:52] [PASSED] rounding4
[20:32:52] =========== [PASSED] drm_test_check_plane_state ============
[20:32:52] =========== drm_test_check_invalid_plane_state  ============
[20:32:52] [PASSED] positioning_invalid
[20:32:52] [PASSED] upscaling_invalid
[20:32:52] [PASSED] downscaling_invalid
[20:32:52] ======= [PASSED] drm_test_check_invalid_plane_state ========
[20:32:52] ================ [PASSED] drm_plane_helper =================
[20:32:52] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[20:32:52] ====== drm_test_connector_helper_tv_get_modes_check  =======
[20:32:52] [PASSED] None
[20:32:52] [PASSED] PAL
[20:32:52] [PASSED] NTSC
[20:32:52] [PASSED] Both, NTSC Default
[20:32:52] [PASSED] Both, PAL Default
[20:32:52] [PASSED] Both, NTSC Default, with PAL on command-line
[20:32:52] [PASSED] Both, PAL Default, with NTSC on command-line
[20:32:52] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[20:32:52] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[20:32:52] ================== drm_rect (9 subtests) ===================
[20:32:52] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[20:32:52] [PASSED] drm_test_rect_clip_scaled_not_clipped
[20:32:52] [PASSED] drm_test_rect_clip_scaled_clipped
[20:32:52] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[20:32:52] ================= drm_test_rect_intersect  =================
[20:32:52] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[20:32:52] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[20:32:52] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[20:32:52] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[20:32:52] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[20:32:52] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[20:32:52] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[20:32:52] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[20:32:52] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[20:32:52] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[20:32:52] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[20:32:52] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[20:32:52] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[20:32:52] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[20:32:52] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[20:32:52] ============= [PASSED] drm_test_rect_intersect =============
[20:32:52] ================ drm_test_rect_calc_hscale  ================
[20:32:52] [PASSED] normal use
[20:32:52] [PASSED] out of max range
[20:32:52] [PASSED] out of min range
[20:32:52] [PASSED] zero dst
[20:32:52] [PASSED] negative src
[20:32:52] [PASSED] negative dst
[20:32:52] ============ [PASSED] drm_test_rect_calc_hscale ============
[20:32:52] ================ drm_test_rect_calc_vscale  ================
[20:32:52] [PASSED] normal use
[20:32:52] [PASSED] out of max range
[20:32:52] [PASSED] out of min range
[20:32:52] [PASSED] zero dst
[20:32:52] [PASSED] negative src
[20:32:52] [PASSED] negative dst
[20:32:52] ============ [PASSED] drm_test_rect_calc_vscale ============
[20:32:52] ================== drm_test_rect_rotate  ===================
[20:32:52] [PASSED] reflect-x
[20:32:52] [PASSED] reflect-y
[20:32:52] [PASSED] rotate-0
[20:32:52] [PASSED] rotate-90
[20:32:52] [PASSED] rotate-180
[20:32:52] [PASSED] rotate-270
[20:32:52] ============== [PASSED] drm_test_rect_rotate ===============
[20:32:52] ================ drm_test_rect_rotate_inv  =================
[20:32:52] [PASSED] reflect-x
[20:32:52] [PASSED] reflect-y
[20:32:52] [PASSED] rotate-0
[20:32:52] [PASSED] rotate-90
[20:32:52] [PASSED] rotate-180
[20:32:52] [PASSED] rotate-270
[20:32:52] ============ [PASSED] drm_test_rect_rotate_inv =============
[20:32:52] ==================== [PASSED] drm_rect =====================
[20:32:52] ============================================================
[20:32:52] Testing complete. Ran 333 tests: passed: 333
[20:32:52] Elapsed time: 43.275s total, 1.736s configuring, 18.860s building, 22.637s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


