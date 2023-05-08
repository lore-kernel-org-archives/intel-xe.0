Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB22C77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 06:31:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09ACB10E11D;
	Mon,  8 May 2023 06:31:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 124CD10E110;
 Mon,  8 May 2023 06:31:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0E9A3A7E03;
 Mon,  8 May 2023 06:31:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Mon, 08 May 2023 06:31:32 -0000
Message-ID: <168352749205.22736.12349940977739893549@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230508062730.1509-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230508062730.1509-1-niranjana.vishwanathapura@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe?=
 =?utf-8?q?=3A_Handle_-EDEADLK_case_in_preempt_worker?=
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

Series: drm/xe: Handle -EDEADLK case in preempt worker
URL   : https://patchwork.freedesktop.org/series/117440/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[06:30:20] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:30:24] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[06:30:46] Starting KUnit Kernel (1/1)...
[06:30:46] ============================================================
[06:30:46] ==================== xe_bo (2 subtests) ====================
[06:30:46] [SKIPPED] xe_ccs_migrate_kunit
[06:30:46] [SKIPPED] xe_bo_evict_kunit
[06:30:46] ===================== [SKIPPED] xe_bo ======================
[06:30:46] ================== xe_dma_buf (1 subtest) ==================
[06:30:46] [SKIPPED] xe_dma_buf_kunit
[06:30:46] =================== [SKIPPED] xe_dma_buf ===================
[06:30:46] ================== xe_migrate (1 subtest) ==================
[06:30:46] [SKIPPED] xe_migrate_sanity_kunit
[06:30:46] =================== [SKIPPED] xe_migrate ===================
[06:30:46] =================== xe_pci (2 subtests) ====================
[06:30:46] [PASSED] xe_gmdid_graphics_ip
[06:30:46] [PASSED] xe_gmdid_media_ip
[06:30:46] ===================== [PASSED] xe_pci ======================
[06:30:46] ==================== xe_rtp (1 subtest) ====================
[06:30:46] ================== xe_rtp_process_tests  ===================
[06:30:46] [PASSED] coalesce-same-reg
[06:30:46] [PASSED] no-match-no-add
[06:30:46] [PASSED] no-match-no-add-multiple-rules
[06:30:46] [PASSED] two-regs-two-entries
[06:30:46] [PASSED] clr-one-set-other
[06:30:46] [PASSED] set-field
[06:30:46] [PASSED] conflict-duplicate
[06:30:46] [PASSED] conflict-not-disjoint
[06:30:46] [PASSED] conflict-reg-type
[06:30:46] ============== [PASSED] xe_rtp_process_tests ===============
[06:30:46] ===================== [PASSED] xe_rtp ======================
[06:30:46] ==================== xe_wa (1 subtest) =====================
[06:30:46] ======================== xe_wa_gt  =========================
[06:30:46] [PASSED] TIGERLAKE (B0)
[06:30:46] [PASSED] DG1 (A0)
[06:30:46] [PASSED] DG1 (B0)
[06:30:46] [PASSED] ALDERLAKE_S (A0)
[06:30:46] [PASSED] ALDERLAKE_S (B0)
[06:30:46] [PASSED] ALDERLAKE_S (C0)
[06:30:46] [PASSED] ALDERLAKE_S (D0)
[06:30:46] [PASSED] DG2_G10 (A0)
[06:30:46] [PASSED] DG2_G10 (A1)
[06:30:46] [PASSED] DG2_G10 (B0)
[06:30:46] [PASSED] DG2_G10 (C0)
[06:30:46] [PASSED] DG2_G11 (A0)
[06:30:46] [PASSED] DG2_G11 (B0)
[06:30:46] [PASSED] DG2_G11 (B1)
[06:30:46] [PASSED] DG2_G12 (A0)
[06:30:46] [PASSED] DG2_G12 (A1)
[06:30:46] [PASSED] PVC (B0)
[06:30:46] [PASSED] PVC (B1)
[06:30:46] [PASSED] PVC (C0)
[06:30:46] ==================== [PASSED] xe_wa_gt =====================
[06:30:46] ====================== [PASSED] xe_wa ======================
[06:30:46] ============================================================
[06:30:46] Testing complete. Ran 34 tests: passed: 30, skipped: 4
[06:30:46] Elapsed time: 26.113s total, 4.182s configuring, 21.812s building, 0.100s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[06:30:46] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:30:48] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[06:31:06] Starting KUnit Kernel (1/1)...
[06:31:06] ============================================================
[06:31:06] ============ drm_test_pick_cmdline (2 subtests) ============
[06:31:06] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[06:31:06] =============== drm_test_pick_cmdline_named  ===============
[06:31:06] [PASSED] NTSC
[06:31:06] [PASSED] NTSC-J
[06:31:06] [PASSED] PAL
[06:31:06] [PASSED] PAL-M
[06:31:06] =========== [PASSED] drm_test_pick_cmdline_named ===========
[06:31:06] ============== [PASSED] drm_test_pick_cmdline ==============
[06:31:06] ================== drm_buddy (6 subtests) ==================
[06:31:06] [PASSED] drm_test_buddy_alloc_limit
[06:31:06] [PASSED] drm_test_buddy_alloc_range
[06:31:06] [PASSED] drm_test_buddy_alloc_optimistic
[06:31:06] [PASSED] drm_test_buddy_alloc_pessimistic
[06:31:06] [PASSED] drm_test_buddy_alloc_smoke
[06:31:06] [PASSED] drm_test_buddy_alloc_pathological
[06:31:06] ==================== [PASSED] drm_buddy ====================
[06:31:06] ============= drm_cmdline_parser (40 subtests) =============
[06:31:06] [PASSED] drm_test_cmdline_force_d_only
[06:31:06] [PASSED] drm_test_cmdline_force_D_only_dvi
[06:31:06] [PASSED] drm_test_cmdline_force_D_only_hdmi
[06:31:06] [PASSED] drm_test_cmdline_force_D_only_not_digital
[06:31:06] [PASSED] drm_test_cmdline_force_e_only
[06:31:06] [PASSED] drm_test_cmdline_res
[06:31:06] [PASSED] drm_test_cmdline_res_vesa
[06:31:06] [PASSED] drm_test_cmdline_res_vesa_rblank
[06:31:06] [PASSED] drm_test_cmdline_res_rblank
[06:31:06] [PASSED] drm_test_cmdline_res_bpp
[06:31:06] [PASSED] drm_test_cmdline_res_refresh
[06:31:06] [PASSED] drm_test_cmdline_res_bpp_refresh
[06:31:06] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[06:31:06] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[06:31:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[06:31:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[06:31:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[06:31:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[06:31:06] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[06:31:06] [PASSED] drm_test_cmdline_res_margins_force_on
[06:31:06] [PASSED] drm_test_cmdline_res_vesa_margins
[06:31:06] [PASSED] drm_test_cmdline_name
[06:31:06] [PASSED] drm_test_cmdline_name_bpp
[06:31:06] [PASSED] drm_test_cmdline_name_option
[06:31:06] [PASSED] drm_test_cmdline_name_bpp_option
[06:31:06] [PASSED] drm_test_cmdline_rotate_0
[06:31:06] [PASSED] drm_test_cmdline_rotate_90
[06:31:06] [PASSED] drm_test_cmdline_rotate_180
[06:31:06] [PASSED] drm_test_cmdline_rotate_270
[06:31:06] [PASSED] drm_test_cmdline_hmirror
[06:31:06] [PASSED] drm_test_cmdline_vmirror
[06:31:06] [PASSED] drm_test_cmdline_margin_options
[06:31:06] [PASSED] drm_test_cmdline_multiple_options
[06:31:06] [PASSED] drm_test_cmdline_bpp_extra_and_option
[06:31:06] [PASSED] drm_test_cmdline_extra_and_option
[06:31:06] [PASSED] drm_test_cmdline_freestanding_options
[06:31:06] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[06:31:06] [PASSED] drm_test_cmdline_panel_orientation
[06:31:06] ================ drm_test_cmdline_invalid  =================
[06:31:06] [PASSED] margin_only
[06:31:06] [PASSED] interlace_only
[06:31:06] [PASSED] res_missing_x
[06:31:06] [PASSED] res_missing_y
[06:31:06] [PASSED] res_bad_y
[06:31:06] [PASSED] res_missing_y_bpp
[06:31:06] [PASSED] res_bad_bpp
[06:31:06] [PASSED] res_bad_refresh
[06:31:06] [PASSED] res_bpp_refresh_force_on_off
[06:31:06] [PASSED] res_invalid_mode
[06:31:06] [PASSED] res_bpp_wrong_place_mode
[06:31:06] [PASSED] name_bpp_refresh
[06:31:06] [PASSED] name_refresh
[06:31:06] [PASSED] name_refresh_wrong_mode
[06:31:06] [PASSED] name_refresh_invalid_mode
[06:31:06] [PASSED] rotate_multiple
[06:31:06] [PASSED] rotate_invalid_val
[06:31:06] [PASSED] rotate_truncated
[06:31:06] [PASSED] invalid_option
[06:31:06] [PASSED] invalid_tv_option
[06:31:06] [PASSED] truncated_tv_option
[06:31:06] ============ [PASSED] drm_test_cmdline_invalid =============
[06:31:06] =============== drm_test_cmdline_tv_options  ===============
[06:31:06] [PASSED] NTSC
[06:31:06] [PASSED] NTSC_443
[06:31:06] [PASSED] NTSC_J
[06:31:06] [PASSED] PAL
[06:31:06] [PASSED] PAL_M
[06:31:06] [PASSED] PAL_N
[06:31:06] [PASSED] SECAM
[06:31:06] =========== [PASSED] drm_test_cmdline_tv_options ===========
[06:31:06] =============== [PASSED] drm_cmdline_parser ================
[06:31:06] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[06:31:06] ========== drm_test_get_tv_mode_from_name_valid  ===========
[06:31:06] [PASSED] NTSC
[06:31:06] [PASSED] NTSC-443
[06:31:06] [PASSED] NTSC-J
[06:31:06] [PASSED] PAL
[06:31:06] [PASSED] PAL-M
[06:31:06] [PASSED] PAL-N
[06:31:06] [PASSED] SECAM
[06:31:06] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[06:31:06] [PASSED] drm_test_get_tv_mode_from_name_truncated
[06:31:06] ============ [PASSED] drm_get_tv_mode_from_name ============
[06:31:06] ============= drm_damage_helper (21 subtests) ==============
[06:31:06] [PASSED] drm_test_damage_iter_no_damage
[06:31:06] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[06:31:06] [PASSED] drm_test_damage_iter_no_damage_src_moved
[06:31:06] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[06:31:06] [PASSED] drm_test_damage_iter_no_damage_not_visible
[06:31:06] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[06:31:06] [PASSED] drm_test_damage_iter_no_damage_no_fb
[06:31:06] [PASSED] drm_test_damage_iter_simple_damage
[06:31:06] [PASSED] drm_test_damage_iter_single_damage
[06:31:06] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[06:31:06] [PASSED] drm_test_damage_iter_single_damage_outside_src
[06:31:06] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[06:31:06] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[06:31:06] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[06:31:06] [PASSED] drm_test_damage_iter_single_damage_src_moved
[06:31:06] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[06:31:06] [PASSED] drm_test_damage_iter_damage
[06:31:06] [PASSED] drm_test_damage_iter_damage_one_intersect
[06:31:06] [PASSED] drm_test_damage_iter_damage_one_outside
[06:31:06] [PASSED] drm_test_damage_iter_damage_src_moved
[06:31:06] [PASSED] drm_test_damage_iter_damage_not_visible
[06:31:06] ================ [PASSED] drm_damage_helper ================
[06:31:06] ============== drm_dp_mst_helper (2 subtests) ==============
[06:31:06] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[06:31:06] [PASSED] Clock 154000 BPP 30 DSC disabled
[06:31:06] [PASSED] Clock 234000 BPP 30 DSC disabled
[06:31:06] [PASSED] Clock 297000 BPP 24 DSC disabled
[06:31:06] [PASSED] Clock 332880 BPP 24 DSC enabled
[06:31:06] [PASSED] Clock 324540 BPP 24 DSC enabled
[06:31:06] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[06:31:06] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[06:31:06] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[06:31:06] [PASSED] DP_POWER_UP_PHY with port number
[06:31:06] [PASSED] DP_POWER_DOWN_PHY with port number
[06:31:06] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[06:31:06] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[06:31:06] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[06:31:06] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[06:31:06] [PASSED] DP_QUERY_PAYLOAD with port number
[06:31:06] [PASSED] DP_QUERY_PAYLOAD with VCPI
[06:31:06] [PASSED] DP_REMOTE_DPCD_READ with port number
[06:31:06] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[06:31:06] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[06:31:06] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[06:31:06] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[06:31:06] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[06:31:06] [PASSED] DP_REMOTE_I2C_READ with port number
[06:31:06] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[06:31:06] [PASSED] DP_REMOTE_I2C_READ with transactions array
[06:31:06] [PASSED] DP_REMOTE_I2C_WRITE with port number
[06:31:06] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[06:31:06] [PASSED] DP_REMOTE_I2C_WRITE with data array
[06:31:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[06:31:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[06:31:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[06:31:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[06:31:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[06:31:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[06:31:06] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[06:31:06] ================ [PASSED] drm_dp_mst_helper ================
[06:31:06] =========== drm_format_helper_test (11 subtests) ===========
[06:31:06] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[06:31:06] [PASSED] single_pixel_source_buffer
[06:31:06] [PASSED] single_pixel_clip_rectangle
[06:31:06] [PASSED] well_known_colors
[06:31:06] [PASSED] destination_pitch
[06:31:06] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[06:31:06] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[06:31:06] [PASSED] single_pixel_source_buffer
[06:31:06] [PASSED] single_pixel_clip_rectangle
[06:31:06] [PASSED] well_known_colors
[06:31:06] [PASSED] destination_pitch
[06:31:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[06:31:06] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[06:31:06] [PASSED] single_pixel_source_buffer
[06:31:06] [PASSED] single_pixel_clip_rectangle
[06:31:06] [PASSED] well_known_colors
[06:31:06] [PASSED] destination_pitch
[06:31:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[06:31:06] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[06:31:06] [PASSED] single_pixel_source_buffer
[06:31:06] [PASSED] single_pixel_clip_rectangle
[06:31:06] [PASSED] well_known_colors
[06:31:06] [PASSED] destination_pitch
[06:31:06] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[06:31:06] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[06:31:06] [PASSED] single_pixel_source_buffer
[06:31:06] [PASSED] single_pixel_clip_rectangle
[06:31:06] [PASSED] well_known_colors
[06:31:06] [PASSED] destination_pitch
[06:31:06] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[06:31:06] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[06:31:06] [PASSED] single_pixel_source_buffer
[06:31:06] [PASSED] single_pixel_clip_rectangle
[06:31:06] [PASSED] well_known_colors
[06:31:06] [PASSED] destination_pitch
[06:31:06] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[06:31:07] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[06:31:07] [PASSED] single_pixel_source_buffer
[06:31:07] [PASSED] single_pixel_clip_rectangle
[06:31:07] [PASSED] well_known_colors
[06:31:07] [PASSED] destination_pitch
[06:31:07] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[06:31:07] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[06:31:07] [PASSED] single_pixel_source_buffer
[06:31:07] [PASSED] single_pixel_clip_rectangle
[06:31:07] [PASSED] well_known_colors
[06:31:07] [PASSED] destination_pitch
[06:31:07] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[06:31:07] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[06:31:07] [PASSED] single_pixel_source_buffer
[06:31:07] [PASSED] single_pixel_clip_rectangle
[06:31:07] [PASSED] well_known_colors
[06:31:07] [PASSED] destination_pitch
[06:31:07] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[06:31:07] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[06:31:07] [PASSED] single_pixel_source_buffer
[06:31:07] [PASSED] single_pixel_clip_rectangle
[06:31:07] [PASSED] well_known_colors
[06:31:07] [PASSED] destination_pitch
[06:31:07] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[06:31:07] ============== drm_test_fb_xrgb8888_to_mono  ===============
[06:31:07] [PASSED] single_pixel_source_buffer
[06:31:07] [PASSED] single_pixel_clip_rectangle
[06:31:07] [PASSED] well_known_colors
[06:31:07] [PASSED] destination_pitch
[06:31:07] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[06:31:07] ============= [PASSED] drm_format_helper_test ==============
[06:31:07] ================= drm_format (18 subtests) =================
[06:31:07] [PASSED] drm_test_format_block_width_invalid
[06:31:07] [PASSED] drm_test_format_block_width_one_plane
[06:31:07] [PASSED] drm_test_format_block_width_two_plane
[06:31:07] [PASSED] drm_test_format_block_width_three_plane
[06:31:07] [PASSED] drm_test_format_block_width_tiled
[06:31:07] [PASSED] drm_test_format_block_height_invalid
[06:31:07] [PASSED] drm_test_format_block_height_one_plane
[06:31:07] [PASSED] drm_test_format_block_height_two_plane
[06:31:07] [PASSED] drm_test_format_block_height_three_plane
[06:31:07] [PASSED] drm_test_format_block_height_tiled
[06:31:07] [PASSED] drm_test_format_min_pitch_invalid
[06:31:07] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[06:31:07] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[06:31:07] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[06:31:07] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[06:31:07] [PASSED] drm_test_format_min_pitch_two_plane
[06:31:07] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[06:31:07] [PASSED] drm_test_format_min_pitch_tiled
[06:31:07] =================== [PASSED] drm_format ====================
[06:31:07] =============== drm_framebuffer (1 subtest) ================
[06:31:07] =============== drm_test_framebuffer_create  ===============
[06:31:07] [PASSED] ABGR8888 normal sizes
[06:31:07] [PASSED] ABGR8888 max sizes
[06:31:07] [PASSED] ABGR8888 pitch greater than min required
[06:31:07] [PASSED] ABGR8888 pitch less than min required
[06:31:07] [PASSED] ABGR8888 Invalid width
[06:31:07] [PASSED] ABGR8888 Invalid buffer handle
[06:31:07] [PASSED] No pixel format
[06:31:07] [PASSED] ABGR8888 Width 0
[06:31:07] [PASSED] ABGR8888 Height 0
[06:31:07] [PASSED] ABGR8888 Out of bound height * pitch combination
[06:31:07] [PASSED] ABGR8888 Large buffer offset
[06:31:07] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[06:31:07] [PASSED] ABGR8888 Valid buffer modifier
[06:31:07] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[06:31:07] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[06:31:07] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[06:31:07] [PASSED] NV12 Normal sizes
[06:31:07] [PASSED] NV12 Max sizes
[06:31:07] [PASSED] NV12 Invalid pitch
[06:31:07] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[06:31:07] [PASSED] NV12 different  modifier per-plane
[06:31:07] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[06:31:07] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[06:31:07] [PASSED] NV12 Modifier for inexistent plane
[06:31:07] [PASSED] NV12 Handle for inexistent plane
[06:31:07] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[06:31:07] [PASSED] YVU420 Normal sizes
[06:31:07] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[06:31:07] [PASSED] YVU420 Max sizes
[06:31:07] [PASSED] YVU420 Invalid pitch
[06:31:07] [PASSED] YVU420 Different pitches
[06:31:07] [PASSED] YVU420 Different buffer offsets/pitches
[06:31:07] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[06:31:07] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[06:31:07] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[06:31:07] [PASSED] YVU420 Valid modifier
[06:31:07] [PASSED] YVU420 Different modifiers per plane
[06:31:07] [PASSED] YVU420 Modifier for inexistent plane
[06:31:07] [PASSED] X0L2 Normal sizes
[06:31:07] [PASSED] X0L2 Max sizes
[06:31:07] [PASSED] X0L2 Invalid pitch
[06:31:07] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[06:31:07] [PASSED] X0L2 Handle for inexistent plane
[06:31:07] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[06:31:07] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[06:31:07] [PASSED] X0L2 Valid modifier
[06:31:07] [PASSED] X0L2 Modifier for inexistent plane
[06:31:07] =========== [PASSED] drm_test_framebuffer_create ===========
[06:31:07] ================= [PASSED] drm_framebuffer =================
[06:31:07] =============== drm-test-managed (1 subtest) ===============
[06:31:07] [PASSED] drm_test_managed_run_action
[06:31:07] ================ [PASSED] drm-test-managed =================
[06:31:07] =================== drm_mm (19 subtests) ===================
[06:31:07] [PASSED] drm_test_mm_init
[06:31:07] [PASSED] drm_test_mm_debug
[06:31:16] [PASSED] drm_test_mm_reserve
[06:31:26] [PASSED] drm_test_mm_insert
[06:31:27] [PASSED] drm_test_mm_replace
[06:31:27] [PASSED] drm_test_mm_insert_range
[06:31:27] [PASSED] drm_test_mm_frag
[06:31:27] [PASSED] drm_test_mm_align
[06:31:27] [PASSED] drm_test_mm_align32
[06:31:27] [PASSED] drm_test_mm_align64
[06:31:27] [PASSED] drm_test_mm_evict
[06:31:27] [PASSED] drm_test_mm_evict_range
[06:31:27] [PASSED] drm_test_mm_topdown
[06:31:27] [PASSED] drm_test_mm_bottomup
[06:31:27] [PASSED] drm_test_mm_lowest
[06:31:27] [PASSED] drm_test_mm_highest
[06:31:28] [PASSED] drm_test_mm_color
[06:31:29] [PASSED] drm_test_mm_color_evict
[06:31:29] [PASSED] drm_test_mm_color_evict_range
[06:31:29] ===================== [PASSED] drm_mm ======================
[06:31:29] ============= drm_modes_analog_tv (4 subtests) =============
[06:31:29] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[06:31:29] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[06:31:29] [PASSED] drm_test_modes_analog_tv_pal_576i
[06:31:29] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[06:31:29] =============== [PASSED] drm_modes_analog_tv ===============
[06:31:29] ============== drm_plane_helper (2 subtests) ===============
[06:31:29] =============== drm_test_check_plane_state  ================
[06:31:29] [PASSED] clipping_simple
[06:31:29] [PASSED] clipping_rotate_reflect
[06:31:29] [PASSED] positioning_simple
[06:31:29] [PASSED] upscaling
[06:31:29] [PASSED] downscaling
[06:31:29] [PASSED] rounding1
[06:31:29] [PASSED] rounding2
[06:31:29] [PASSED] rounding3
[06:31:29] [PASSED] rounding4
[06:31:29] =========== [PASSED] drm_test_check_plane_state ============
[06:31:29] =========== drm_test_check_invalid_plane_state  ============
[06:31:29] [PASSED] positioning_invalid
[06:31:29] [PASSED] upscaling_invalid
[06:31:29] [PASSED] downscaling_invalid
[06:31:29] ======= [PASSED] drm_test_check_invalid_plane_state ========
[06:31:29] ================ [PASSED] drm_plane_helper =================
[06:31:29] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[06:31:29] ====== drm_test_connector_helper_tv_get_modes_check  =======
[06:31:29] [PASSED] None
[06:31:29] [PASSED] PAL
[06:31:29] [PASSED] NTSC
[06:31:29] [PASSED] Both, NTSC Default
[06:31:29] [PASSED] Both, PAL Default
[06:31:29] [PASSED] Both, NTSC Default, with PAL on command-line
[06:31:29] [PASSED] Both, PAL Default, with NTSC on command-line
[06:31:29] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[06:31:29] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[06:31:29] ================== drm_rect (9 subtests) ===================
[06:31:29] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[06:31:29] [PASSED] drm_test_rect_clip_scaled_not_clipped
[06:31:29] [PASSED] drm_test_rect_clip_scaled_clipped
[06:31:29] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[06:31:29] ================= drm_test_rect_intersect  =================
[06:31:29] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[06:31:29] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[06:31:29] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[06:31:29] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[06:31:29] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[06:31:29] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[06:31:29] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[06:31:29] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[06:31:29] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[06:31:29] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[06:31:29] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[06:31:29] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[06:31:29] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[06:31:29] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[06:31:29] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[06:31:29] ============= [PASSED] drm_test_rect_intersect =============
[06:31:29] ================ drm_test_rect_calc_hscale  ================
[06:31:29] [PASSED] normal use
[06:31:29] [PASSED] out of max range
[06:31:29] [PASSED] out of min range
[06:31:29] [PASSED] zero dst
[06:31:29] [PASSED] negative src
[06:31:29] [PASSED] negative dst
[06:31:29] ============ [PASSED] drm_test_rect_calc_hscale ============
[06:31:29] ================ drm_test_rect_calc_vscale  ================
[06:31:29] [PASSED] normal use
[06:31:29] [PASSED] out of max range
[06:31:29] [PASSED] out of min range
[06:31:29] [PASSED] zero dst
[06:31:29] [PASSED] negative src
[06:31:29] [PASSED] negative dst
[06:31:29] ============ [PASSED] drm_test_rect_calc_vscale ============
[06:31:29] ================== drm_test_rect_rotate  ===================
[06:31:29] [PASSED] reflect-x
[06:31:29] [PASSED] reflect-y
[06:31:29] [PASSED] rotate-0
[06:31:29] [PASSED] rotate-90
[06:31:29] [PASSED] rotate-180
[06:31:29] [PASSED] rotate-270
[06:31:29] ============== [PASSED] drm_test_rect_rotate ===============
[06:31:29] ================ drm_test_rect_rotate_inv  =================
[06:31:29] [PASSED] reflect-x
[06:31:29] [PASSED] reflect-y
[06:31:29] [PASSED] rotate-0
[06:31:29] [PASSED] rotate-90
[06:31:29] [PASSED] rotate-180
[06:31:29] [PASSED] rotate-270
[06:31:29] ============ [PASSED] drm_test_rect_rotate_inv =============
[06:31:29] ==================== [PASSED] drm_rect =====================
[06:31:29] ============================================================
[06:31:29] Testing complete. Ran 333 tests: passed: 333
[06:31:29] Elapsed time: 42.549s total, 1.705s configuring, 18.416s building, 22.399s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


