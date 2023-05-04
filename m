Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD85C77B78
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 19:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9381B10E071;
	Thu,  4 May 2023 19:05:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id EF3E710E071;
 Thu,  4 May 2023 19:05:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EB59AA66C9;
 Thu,  4 May 2023 19:05:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Thu, 04 May 2023 19:05:30 -0000
Message-ID: <168322713095.11433.16262398932477380401@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230504171115.89838-1-jose.souza@intel.com>
In-Reply-To: <20230504171115.89838-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_series_?=
 =?utf-8?q?starting_with_=5Bv5=2C1/2=5D_drm/xe=3A_Set_default_MOCS_value_f?=
 =?utf-8?q?or_cs_instructions_=28rev2=29?=
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

Series: series starting with [v5,1/2] drm/xe: Set default MOCS value for cs instructions (rev2)
URL   : https://patchwork.freedesktop.org/series/117345/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[19:04:19] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:04:23] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[19:04:45] Starting KUnit Kernel (1/1)...
[19:04:45] ============================================================
[19:04:45] ==================== xe_bo (2 subtests) ====================
[19:04:45] [SKIPPED] xe_ccs_migrate_kunit
[19:04:45] [SKIPPED] xe_bo_evict_kunit
[19:04:45] ===================== [SKIPPED] xe_bo ======================
[19:04:45] ================== xe_dma_buf (1 subtest) ==================
[19:04:45] [SKIPPED] xe_dma_buf_kunit
[19:04:45] =================== [SKIPPED] xe_dma_buf ===================
[19:04:45] ================== xe_migrate (1 subtest) ==================
[19:04:45] [SKIPPED] xe_migrate_sanity_kunit
[19:04:45] =================== [SKIPPED] xe_migrate ===================
[19:04:45] =================== xe_pci (2 subtests) ====================
[19:04:45] [PASSED] xe_gmdid_graphics_ip
[19:04:45] [PASSED] xe_gmdid_media_ip
[19:04:45] ===================== [PASSED] xe_pci ======================
[19:04:45] ==================== xe_rtp (1 subtest) ====================
[19:04:45] ================== xe_rtp_process_tests  ===================
[19:04:45] [PASSED] coalesce-same-reg
[19:04:45] [PASSED] no-match-no-add
[19:04:45] [PASSED] no-match-no-add-multiple-rules
[19:04:45] [PASSED] two-regs-two-entries
[19:04:45] [PASSED] clr-one-set-other
[19:04:45] [PASSED] set-field
[19:04:45] [PASSED] conflict-duplicate
[19:04:45] [PASSED] conflict-not-disjoint
[19:04:45] [PASSED] conflict-reg-type
[19:04:45] ============== [PASSED] xe_rtp_process_tests ===============
[19:04:45] ===================== [PASSED] xe_rtp ======================
[19:04:45] ==================== xe_wa (1 subtest) =====================
[19:04:45] ======================== xe_wa_gt  =========================
[19:04:45] [PASSED] TIGERLAKE (B0)
[19:04:45] [PASSED] DG1 (A0)
[19:04:45] [PASSED] DG1 (B0)
[19:04:45] [PASSED] ALDERLAKE_S (A0)
[19:04:45] [PASSED] ALDERLAKE_S (B0)
[19:04:45] [PASSED] ALDERLAKE_S (C0)
[19:04:45] [PASSED] ALDERLAKE_S (D0)
[19:04:45] [PASSED] DG2_G10 (A0)
[19:04:45] [PASSED] DG2_G10 (A1)
[19:04:45] [PASSED] DG2_G10 (B0)
[19:04:45] [PASSED] DG2_G10 (C0)
[19:04:45] [PASSED] DG2_G11 (A0)
[19:04:45] [PASSED] DG2_G11 (B0)
[19:04:45] [PASSED] DG2_G11 (B1)
[19:04:45] [PASSED] DG2_G12 (A0)
[19:04:45] [PASSED] DG2_G12 (A1)
[19:04:45] [PASSED] PVC (B0)
[19:04:45] [PASSED] PVC (B1)
[19:04:45] [PASSED] PVC (C0)
[19:04:45] ==================== [PASSED] xe_wa_gt =====================
[19:04:45] ====================== [PASSED] xe_wa ======================
[19:04:45] ============================================================
[19:04:45] Testing complete. Ran 34 tests: passed: 30, skipped: 4
[19:04:45] Elapsed time: 26.183s total, 4.224s configuring, 21.790s building, 0.137s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[19:04:45] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:04:47] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[19:05:06] Starting KUnit Kernel (1/1)...
[19:05:06] ============================================================
[19:05:06] ============ drm_test_pick_cmdline (2 subtests) ============
[19:05:06] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[19:05:06] =============== drm_test_pick_cmdline_named  ===============
[19:05:06] [PASSED] NTSC
[19:05:06] [PASSED] NTSC-J
[19:05:06] [PASSED] PAL
[19:05:06] [PASSED] PAL-M
[19:05:06] =========== [PASSED] drm_test_pick_cmdline_named ===========
[19:05:06] ============== [PASSED] drm_test_pick_cmdline ==============
[19:05:06] ================== drm_buddy (6 subtests) ==================
[19:05:06] [PASSED] drm_test_buddy_alloc_limit
[19:05:06] [PASSED] drm_test_buddy_alloc_range
[19:05:06] [PASSED] drm_test_buddy_alloc_optimistic
[19:05:06] [PASSED] drm_test_buddy_alloc_pessimistic
[19:05:06] [PASSED] drm_test_buddy_alloc_smoke
[19:05:06] [PASSED] drm_test_buddy_alloc_pathological
[19:05:06] ==================== [PASSED] drm_buddy ====================
[19:05:06] ============= drm_cmdline_parser (40 subtests) =============
[19:05:06] [PASSED] drm_test_cmdline_force_d_only
[19:05:06] [PASSED] drm_test_cmdline_force_D_only_dvi
[19:05:06] [PASSED] drm_test_cmdline_force_D_only_hdmi
[19:05:06] [PASSED] drm_test_cmdline_force_D_only_not_digital
[19:05:06] [PASSED] drm_test_cmdline_force_e_only
[19:05:06] [PASSED] drm_test_cmdline_res
[19:05:06] [PASSED] drm_test_cmdline_res_vesa
[19:05:06] [PASSED] drm_test_cmdline_res_vesa_rblank
[19:05:06] [PASSED] drm_test_cmdline_res_rblank
[19:05:06] [PASSED] drm_test_cmdline_res_bpp
[19:05:06] [PASSED] drm_test_cmdline_res_refresh
[19:05:06] [PASSED] drm_test_cmdline_res_bpp_refresh
[19:05:06] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[19:05:06] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[19:05:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[19:05:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[19:05:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[19:05:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[19:05:06] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[19:05:06] [PASSED] drm_test_cmdline_res_margins_force_on
[19:05:06] [PASSED] drm_test_cmdline_res_vesa_margins
[19:05:06] [PASSED] drm_test_cmdline_name
[19:05:06] [PASSED] drm_test_cmdline_name_bpp
[19:05:06] [PASSED] drm_test_cmdline_name_option
[19:05:06] [PASSED] drm_test_cmdline_name_bpp_option
[19:05:06] [PASSED] drm_test_cmdline_rotate_0
[19:05:06] [PASSED] drm_test_cmdline_rotate_90
[19:05:06] [PASSED] drm_test_cmdline_rotate_180
[19:05:06] [PASSED] drm_test_cmdline_rotate_270
[19:05:06] [PASSED] drm_test_cmdline_hmirror
[19:05:06] [PASSED] drm_test_cmdline_vmirror
[19:05:06] [PASSED] drm_test_cmdline_margin_options
[19:05:06] [PASSED] drm_test_cmdline_multiple_options
[19:05:06] [PASSED] drm_test_cmdline_bpp_extra_and_option
[19:05:06] [PASSED] drm_test_cmdline_extra_and_option
[19:05:06] [PASSED] drm_test_cmdline_freestanding_options
[19:05:06] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[19:05:06] [PASSED] drm_test_cmdline_panel_orientation
[19:05:06] ================ drm_test_cmdline_invalid  =================
[19:05:06] [PASSED] margin_only
[19:05:06] [PASSED] interlace_only
[19:05:06] [PASSED] res_missing_x
[19:05:06] [PASSED] res_missing_y
[19:05:06] [PASSED] res_bad_y
[19:05:06] [PASSED] res_missing_y_bpp
[19:05:06] [PASSED] res_bad_bpp
[19:05:06] [PASSED] res_bad_refresh
[19:05:06] [PASSED] res_bpp_refresh_force_on_off
[19:05:06] [PASSED] res_invalid_mode
[19:05:06] [PASSED] res_bpp_wrong_place_mode
[19:05:06] [PASSED] name_bpp_refresh
[19:05:06] [PASSED] name_refresh
[19:05:06] [PASSED] name_refresh_wrong_mode
[19:05:06] [PASSED] name_refresh_invalid_mode
[19:05:06] [PASSED] rotate_multiple
[19:05:06] [PASSED] rotate_invalid_val
[19:05:06] [PASSED] rotate_truncated
[19:05:06] [PASSED] invalid_option
[19:05:06] [PASSED] invalid_tv_option
[19:05:06] [PASSED] truncated_tv_option
[19:05:06] ============ [PASSED] drm_test_cmdline_invalid =============
[19:05:06] =============== drm_test_cmdline_tv_options  ===============
[19:05:06] [PASSED] NTSC
[19:05:06] [PASSED] NTSC_443
[19:05:06] [PASSED] NTSC_J
[19:05:06] [PASSED] PAL
[19:05:06] [PASSED] PAL_M
[19:05:06] [PASSED] PAL_N
[19:05:06] [PASSED] SECAM
[19:05:06] =========== [PASSED] drm_test_cmdline_tv_options ===========
[19:05:06] =============== [PASSED] drm_cmdline_parser ================
[19:05:06] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[19:05:06] ========== drm_test_get_tv_mode_from_name_valid  ===========
[19:05:06] [PASSED] NTSC
[19:05:06] [PASSED] NTSC-443
[19:05:06] [PASSED] NTSC-J
[19:05:06] [PASSED] PAL
[19:05:06] [PASSED] PAL-M
[19:05:06] [PASSED] PAL-N
[19:05:06] [PASSED] SECAM
[19:05:06] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[19:05:06] [PASSED] drm_test_get_tv_mode_from_name_truncated
[19:05:06] ============ [PASSED] drm_get_tv_mode_from_name ============
[19:05:06] ============= drm_damage_helper (21 subtests) ==============
[19:05:06] [PASSED] drm_test_damage_iter_no_damage
[19:05:06] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[19:05:06] [PASSED] drm_test_damage_iter_no_damage_src_moved
[19:05:06] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[19:05:06] [PASSED] drm_test_damage_iter_no_damage_not_visible
[19:05:06] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[19:05:06] [PASSED] drm_test_damage_iter_no_damage_no_fb
[19:05:06] [PASSED] drm_test_damage_iter_simple_damage
[19:05:06] [PASSED] drm_test_damage_iter_single_damage
[19:05:06] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[19:05:06] [PASSED] drm_test_damage_iter_single_damage_outside_src
[19:05:06] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[19:05:06] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[19:05:06] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[19:05:06] [PASSED] drm_test_damage_iter_single_damage_src_moved
[19:05:06] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[19:05:06] [PASSED] drm_test_damage_iter_damage
[19:05:06] [PASSED] drm_test_damage_iter_damage_one_intersect
[19:05:06] [PASSED] drm_test_damage_iter_damage_one_outside
[19:05:06] [PASSED] drm_test_damage_iter_damage_src_moved
[19:05:06] [PASSED] drm_test_damage_iter_damage_not_visible
[19:05:06] ================ [PASSED] drm_damage_helper ================
[19:05:06] ============== drm_dp_mst_helper (2 subtests) ==============
[19:05:06] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[19:05:06] [PASSED] Clock 154000 BPP 30 DSC disabled
[19:05:06] [PASSED] Clock 234000 BPP 30 DSC disabled
[19:05:06] [PASSED] Clock 297000 BPP 24 DSC disabled
[19:05:06] [PASSED] Clock 332880 BPP 24 DSC enabled
[19:05:06] [PASSED] Clock 324540 BPP 24 DSC enabled
[19:05:06] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[19:05:06] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[19:05:06] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[19:05:06] [PASSED] DP_POWER_UP_PHY with port number
[19:05:06] [PASSED] DP_POWER_DOWN_PHY with port number
[19:05:06] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[19:05:06] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[19:05:06] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[19:05:06] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[19:05:06] [PASSED] DP_QUERY_PAYLOAD with port number
[19:05:06] [PASSED] DP_QUERY_PAYLOAD with VCPI
[19:05:06] [PASSED] DP_REMOTE_DPCD_READ with port number
[19:05:06] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[19:05:06] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[19:05:06] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[19:05:06] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[19:05:06] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[19:05:06] [PASSED] DP_REMOTE_I2C_READ with port number
[19:05:06] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[19:05:06] [PASSED] DP_REMOTE_I2C_READ with transactions array
[19:05:06] [PASSED] DP_REMOTE_I2C_WRITE with port number
[19:05:06] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[19:05:06] [PASSED] DP_REMOTE_I2C_WRITE with data array
[19:05:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[19:05:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[19:05:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[19:05:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[19:05:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[19:05:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[19:05:06] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[19:05:06] ================ [PASSED] drm_dp_mst_helper ================
[19:05:06] =========== drm_format_helper_test (11 subtests) ===========
[19:05:06] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[19:05:06] [PASSED] single_pixel_source_buffer
[19:05:06] [PASSED] single_pixel_clip_rectangle
[19:05:06] [PASSED] well_known_colors
[19:05:06] [PASSED] destination_pitch
[19:05:06] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[19:05:06] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[19:05:06] [PASSED] single_pixel_source_buffer
[19:05:06] [PASSED] single_pixel_clip_rectangle
[19:05:06] [PASSED] well_known_colors
[19:05:06] [PASSED] destination_pitch
[19:05:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[19:05:06] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[19:05:06] [PASSED] single_pixel_source_buffer
[19:05:06] [PASSED] single_pixel_clip_rectangle
[19:05:06] [PASSED] well_known_colors
[19:05:06] [PASSED] destination_pitch
[19:05:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[19:05:06] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[19:05:06] [PASSED] single_pixel_source_buffer
[19:05:06] [PASSED] single_pixel_clip_rectangle
[19:05:06] [PASSED] well_known_colors
[19:05:06] [PASSED] destination_pitch
[19:05:06] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[19:05:06] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[19:05:06] [PASSED] single_pixel_source_buffer
[19:05:06] [PASSED] single_pixel_clip_rectangle
[19:05:06] [PASSED] well_known_colors
[19:05:06] [PASSED] destination_pitch
[19:05:06] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[19:05:06] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[19:05:06] [PASSED] single_pixel_source_buffer
[19:05:06] [PASSED] single_pixel_clip_rectangle
[19:05:06] [PASSED] well_known_colors
[19:05:06] [PASSED] destination_pitch
[19:05:06] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[19:05:06] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[19:05:06] [PASSED] single_pixel_source_buffer
[19:05:06] [PASSED] single_pixel_clip_rectangle
[19:05:06] [PASSED] well_known_colors
[19:05:06] [PASSED] destination_pitch
[19:05:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[19:05:06] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[19:05:06] [PASSED] single_pixel_source_buffer
[19:05:06] [PASSED] single_pixel_clip_rectangle
[19:05:06] [PASSED] well_known_colors
[19:05:06] [PASSED] destination_pitch
[19:05:06] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[19:05:06] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[19:05:06] [PASSED] single_pixel_source_buffer
[19:05:06] [PASSED] single_pixel_clip_rectangle
[19:05:06] [PASSED] well_known_colors
[19:05:06] [PASSED] destination_pitch
[19:05:06] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[19:05:06] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[19:05:06] [PASSED] single_pixel_source_buffer
[19:05:06] [PASSED] single_pixel_clip_rectangle
[19:05:06] [PASSED] well_known_colors
[19:05:06] [PASSED] destination_pitch
[19:05:06] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[19:05:06] ============== drm_test_fb_xrgb8888_to_mono  ===============
[19:05:06] [PASSED] single_pixel_source_buffer
[19:05:06] [PASSED] single_pixel_clip_rectangle
[19:05:06] [PASSED] well_known_colors
[19:05:06] [PASSED] destination_pitch
[19:05:06] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[19:05:06] ============= [PASSED] drm_format_helper_test ==============
[19:05:06] ================= drm_format (18 subtests) =================
[19:05:06] [PASSED] drm_test_format_block_width_invalid
[19:05:06] [PASSED] drm_test_format_block_width_one_plane
[19:05:06] [PASSED] drm_test_format_block_width_two_plane
[19:05:06] [PASSED] drm_test_format_block_width_three_plane
[19:05:06] [PASSED] drm_test_format_block_width_tiled
[19:05:06] [PASSED] drm_test_format_block_height_invalid
[19:05:06] [PASSED] drm_test_format_block_height_one_plane
[19:05:06] [PASSED] drm_test_format_block_height_two_plane
[19:05:06] [PASSED] drm_test_format_block_height_three_plane
[19:05:06] [PASSED] drm_test_format_block_height_tiled
[19:05:06] [PASSED] drm_test_format_min_pitch_invalid
[19:05:06] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[19:05:06] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[19:05:06] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[19:05:06] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[19:05:06] [PASSED] drm_test_format_min_pitch_two_plane
[19:05:06] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[19:05:06] [PASSED] drm_test_format_min_pitch_tiled
[19:05:06] =================== [PASSED] drm_format ====================
[19:05:06] =============== drm_framebuffer (1 subtest) ================
[19:05:06] =============== drm_test_framebuffer_create  ===============
[19:05:06] [PASSED] ABGR8888 normal sizes
[19:05:06] [PASSED] ABGR8888 max sizes
[19:05:06] [PASSED] ABGR8888 pitch greater than min required
[19:05:06] [PASSED] ABGR8888 pitch less than min required
[19:05:06] [PASSED] ABGR8888 Invalid width
[19:05:06] [PASSED] ABGR8888 Invalid buffer handle
[19:05:06] [PASSED] No pixel format
[19:05:06] [PASSED] ABGR8888 Width 0
[19:05:06] [PASSED] ABGR8888 Height 0
[19:05:06] [PASSED] ABGR8888 Out of bound height * pitch combination
[19:05:06] [PASSED] ABGR8888 Large buffer offset
[19:05:06] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[19:05:06] [PASSED] ABGR8888 Valid buffer modifier
[19:05:06] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[19:05:06] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[19:05:06] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[19:05:06] [PASSED] NV12 Normal sizes
[19:05:06] [PASSED] NV12 Max sizes
[19:05:06] [PASSED] NV12 Invalid pitch
[19:05:06] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[19:05:06] [PASSED] NV12 different  modifier per-plane
[19:05:06] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[19:05:06] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[19:05:06] [PASSED] NV12 Modifier for inexistent plane
[19:05:06] [PASSED] NV12 Handle for inexistent plane
[19:05:06] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[19:05:06] [PASSED] YVU420 Normal sizes
[19:05:06] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[19:05:06] [PASSED] YVU420 Max sizes
[19:05:06] [PASSED] YVU420 Invalid pitch
[19:05:06] [PASSED] YVU420 Different pitches
[19:05:06] [PASSED] YVU420 Different buffer offsets/pitches
[19:05:06] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[19:05:06] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[19:05:06] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[19:05:06] [PASSED] YVU420 Valid modifier
[19:05:06] [PASSED] YVU420 Different modifiers per plane
[19:05:06] [PASSED] YVU420 Modifier for inexistent plane
[19:05:06] [PASSED] X0L2 Normal sizes
[19:05:06] [PASSED] X0L2 Max sizes
[19:05:06] [PASSED] X0L2 Invalid pitch
[19:05:06] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[19:05:06] [PASSED] X0L2 Handle for inexistent plane
[19:05:06] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[19:05:06] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[19:05:06] [PASSED] X0L2 Valid modifier
[19:05:06] [PASSED] X0L2 Modifier for inexistent plane
[19:05:06] =========== [PASSED] drm_test_framebuffer_create ===========
[19:05:06] ================= [PASSED] drm_framebuffer =================
[19:05:06] =============== drm-test-managed (1 subtest) ===============
[19:05:06] [PASSED] drm_test_managed_run_action
[19:05:06] ================ [PASSED] drm-test-managed =================
[19:05:06] =================== drm_mm (19 subtests) ===================
[19:05:06] [PASSED] drm_test_mm_init
[19:05:06] [PASSED] drm_test_mm_debug
[19:05:15] [PASSED] drm_test_mm_reserve
[19:05:25] [PASSED] drm_test_mm_insert
[19:05:26] [PASSED] drm_test_mm_replace
[19:05:26] [PASSED] drm_test_mm_insert_range
[19:05:26] [PASSED] drm_test_mm_frag
[19:05:26] [PASSED] drm_test_mm_align
[19:05:26] [PASSED] drm_test_mm_align32
[19:05:26] [PASSED] drm_test_mm_align64
[19:05:26] [PASSED] drm_test_mm_evict
[19:05:26] [PASSED] drm_test_mm_evict_range
[19:05:26] [PASSED] drm_test_mm_topdown
[19:05:26] [PASSED] drm_test_mm_bottomup
[19:05:26] [PASSED] drm_test_mm_lowest
[19:05:27] [PASSED] drm_test_mm_highest
[19:05:27] [PASSED] drm_test_mm_color
[19:05:28] [PASSED] drm_test_mm_color_evict
[19:05:28] [PASSED] drm_test_mm_color_evict_range
[19:05:28] ===================== [PASSED] drm_mm ======================
[19:05:28] ============= drm_modes_analog_tv (4 subtests) =============
[19:05:28] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[19:05:28] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[19:05:28] [PASSED] drm_test_modes_analog_tv_pal_576i
[19:05:28] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[19:05:28] =============== [PASSED] drm_modes_analog_tv ===============
[19:05:28] ============== drm_plane_helper (2 subtests) ===============
[19:05:28] =============== drm_test_check_plane_state  ================
[19:05:28] [PASSED] clipping_simple
[19:05:28] [PASSED] clipping_rotate_reflect
[19:05:28] [PASSED] positioning_simple
[19:05:28] [PASSED] upscaling
[19:05:28] [PASSED] downscaling
[19:05:28] [PASSED] rounding1
[19:05:28] [PASSED] rounding2
[19:05:28] [PASSED] rounding3
[19:05:28] [PASSED] rounding4
[19:05:28] =========== [PASSED] drm_test_check_plane_state ============
[19:05:28] =========== drm_test_check_invalid_plane_state  ============
[19:05:28] [PASSED] positioning_invalid
[19:05:28] [PASSED] upscaling_invalid
[19:05:28] [PASSED] downscaling_invalid
[19:05:28] ======= [PASSED] drm_test_check_invalid_plane_state ========
[19:05:28] ================ [PASSED] drm_plane_helper =================
[19:05:28] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[19:05:28] ====== drm_test_connector_helper_tv_get_modes_check  =======
[19:05:28] [PASSED] None
[19:05:28] [PASSED] PAL
[19:05:28] [PASSED] NTSC
[19:05:28] [PASSED] Both, NTSC Default
[19:05:28] [PASSED] Both, PAL Default
[19:05:28] [PASSED] Both, NTSC Default, with PAL on command-line
[19:05:28] [PASSED] Both, PAL Default, with NTSC on command-line
[19:05:28] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[19:05:28] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[19:05:28] ================== drm_rect (4 subtests) ===================
[19:05:28] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[19:05:28] [PASSED] drm_test_rect_clip_scaled_not_clipped
[19:05:28] [PASSED] drm_test_rect_clip_scaled_clipped
[19:05:28] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[19:05:28] ==================== [PASSED] drm_rect =====================
[19:05:28] ============================================================
[19:05:28] Testing complete. Ran 294 tests: passed: 294
[19:05:28] Elapsed time: 42.686s total, 1.702s configuring, 18.656s building, 22.302s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


