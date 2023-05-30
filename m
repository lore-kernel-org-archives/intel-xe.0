Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469B9C77B73
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 21:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB3D10E428;
	Tue, 30 May 2023 21:21:14 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 00AA410E428;
 Tue, 30 May 2023 21:21:12 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F0F9CAADDD;
 Tue, 30 May 2023 21:21:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Tue, 30 May 2023 21:21:11 -0000
Message-ID: <168548167198.18935.11876238440239871203@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
In-Reply-To: <20230530211549.2632538-1-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Separat?=
 =?utf-8?q?e_GT_and_tile_=28rev4=29?=
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

Series: Separate GT and tile (rev4)
URL   : https://patchwork.freedesktop.org/series/117614/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[21:19:59] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:20:03] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[21:20:25] Starting KUnit Kernel (1/1)...
[21:20:25] ============================================================
[21:20:25] ==================== xe_bo (2 subtests) ====================
[21:20:25] [SKIPPED] xe_ccs_migrate_kunit
[21:20:25] [SKIPPED] xe_bo_evict_kunit
[21:20:25] ===================== [SKIPPED] xe_bo ======================
[21:20:25] ================== xe_dma_buf (1 subtest) ==================
[21:20:25] [SKIPPED] xe_dma_buf_kunit
[21:20:25] =================== [SKIPPED] xe_dma_buf ===================
[21:20:25] ================== xe_migrate (1 subtest) ==================
[21:20:25] [SKIPPED] xe_migrate_sanity_kunit
[21:20:25] =================== [SKIPPED] xe_migrate ===================
[21:20:25] =================== xe_pci (2 subtests) ====================
[21:20:25] [PASSED] xe_gmdid_graphics_ip
[21:20:25] [PASSED] xe_gmdid_media_ip
[21:20:25] ===================== [PASSED] xe_pci ======================
[21:20:25] ==================== xe_rtp (1 subtest) ====================
[21:20:25] ================== xe_rtp_process_tests  ===================
[21:20:25] [PASSED] coalesce-same-reg
[21:20:25] [PASSED] no-match-no-add
[21:20:25] [PASSED] no-match-no-add-multiple-rules
[21:20:25] [PASSED] two-regs-two-entries
[21:20:25] [PASSED] clr-one-set-other
[21:20:25] [PASSED] set-field
[21:20:25] [PASSED] conflict-duplicate
[21:20:25] [PASSED] conflict-not-disjoint
[21:20:25] [PASSED] conflict-reg-type
[21:20:25] ============== [PASSED] xe_rtp_process_tests ===============
[21:20:25] ===================== [PASSED] xe_rtp ======================
[21:20:25] ==================== xe_wa (1 subtest) =====================
[21:20:25] ======================== xe_wa_gt  =========================
[21:20:25] [PASSED] TIGERLAKE (B0)
[21:20:25] [PASSED] DG1 (A0)
[21:20:25] [PASSED] DG1 (B0)
[21:20:25] [PASSED] ALDERLAKE_S (A0)
[21:20:25] [PASSED] ALDERLAKE_S (B0)
[21:20:25] [PASSED] ALDERLAKE_S (C0)
[21:20:25] [PASSED] ALDERLAKE_S (D0)
[21:20:25] [PASSED] DG2_G10 (A0)
[21:20:25] [ERROR] Test: xe_wa_gt: missing subtest result line!
[21:20:25] 
[21:20:25] Pid: 39, comm: kunit_try_catch Tainted: G        W        N 6.3.0
[21:20:25] RIP: 0033:klist_put+0x14/0x90
[21:20:25] RSP: 00000000a187be90  EFLAGS: 00010246
[21:20:25] RAX: 0000000000000000 RBX: 0000000061e48810 RCX: 0000000060709a48
[21:20:25] RDX: 000000006002acd0 RSI: 0000000000000001 RDI: 0000000061ec0120
[21:20:25] RBP: 0000000061ec0120 R08: 0000000000000001 R09: 000000006017739e
[21:20:25] R10: 0000000000000006 R11: 000000006205e000 R12: 0000000061e48890
[21:20:25] R13: 000000006062e320 R14: 00000000604449e0 R15: 0000000000000000
[21:20:25] Kernel panic - not syncing: Segfault with no mm
[21:20:25] ==================== [CRASHED] xe_wa_gt ====================
[21:20:25] [ERROR] Test: xe_wa: missing subtest result line!
[21:20:25] ===================== [CRASHED] xe_wa ======================
[21:20:25] ============================================================
[21:20:25] Testing complete. Ran 23 tests: passed: 19, skipped: 4, errors: 2
[21:20:25] Elapsed time: 26.544s total, 4.209s configuring, 22.014s building, 0.320s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[21:20:25] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:20:27] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[21:20:45] Starting KUnit Kernel (1/1)...
[21:20:45] ============================================================
[21:20:45] ============ drm_test_pick_cmdline (2 subtests) ============
[21:20:45] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[21:20:45] =============== drm_test_pick_cmdline_named  ===============
[21:20:45] [PASSED] NTSC
[21:20:45] [PASSED] NTSC-J
[21:20:45] [PASSED] PAL
[21:20:45] [PASSED] PAL-M
[21:20:45] =========== [PASSED] drm_test_pick_cmdline_named ===========
[21:20:45] ============== [PASSED] drm_test_pick_cmdline ==============
[21:20:45] ================== drm_buddy (6 subtests) ==================
[21:20:45] [PASSED] drm_test_buddy_alloc_limit
[21:20:45] [PASSED] drm_test_buddy_alloc_range
[21:20:45] [PASSED] drm_test_buddy_alloc_optimistic
[21:20:45] [PASSED] drm_test_buddy_alloc_pessimistic
[21:20:45] [PASSED] drm_test_buddy_alloc_smoke
[21:20:45] [PASSED] drm_test_buddy_alloc_pathological
[21:20:45] ==================== [PASSED] drm_buddy ====================
[21:20:45] ============= drm_cmdline_parser (40 subtests) =============
[21:20:45] [PASSED] drm_test_cmdline_force_d_only
[21:20:45] [PASSED] drm_test_cmdline_force_D_only_dvi
[21:20:45] [PASSED] drm_test_cmdline_force_D_only_hdmi
[21:20:45] [PASSED] drm_test_cmdline_force_D_only_not_digital
[21:20:45] [PASSED] drm_test_cmdline_force_e_only
[21:20:45] [PASSED] drm_test_cmdline_res
[21:20:45] [PASSED] drm_test_cmdline_res_vesa
[21:20:45] [PASSED] drm_test_cmdline_res_vesa_rblank
[21:20:45] [PASSED] drm_test_cmdline_res_rblank
[21:20:45] [PASSED] drm_test_cmdline_res_bpp
[21:20:45] [PASSED] drm_test_cmdline_res_refresh
[21:20:45] [PASSED] drm_test_cmdline_res_bpp_refresh
[21:20:45] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[21:20:45] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[21:20:45] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[21:20:45] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[21:20:45] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[21:20:45] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[21:20:45] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[21:20:45] [PASSED] drm_test_cmdline_res_margins_force_on
[21:20:45] [PASSED] drm_test_cmdline_res_vesa_margins
[21:20:45] [PASSED] drm_test_cmdline_name
[21:20:45] [PASSED] drm_test_cmdline_name_bpp
[21:20:45] [PASSED] drm_test_cmdline_name_option
[21:20:45] [PASSED] drm_test_cmdline_name_bpp_option
[21:20:45] [PASSED] drm_test_cmdline_rotate_0
[21:20:45] [PASSED] drm_test_cmdline_rotate_90
[21:20:45] [PASSED] drm_test_cmdline_rotate_180
[21:20:45] [PASSED] drm_test_cmdline_rotate_270
[21:20:45] [PASSED] drm_test_cmdline_hmirror
[21:20:45] [PASSED] drm_test_cmdline_vmirror
[21:20:45] [PASSED] drm_test_cmdline_margin_options
[21:20:45] [PASSED] drm_test_cmdline_multiple_options
[21:20:45] [PASSED] drm_test_cmdline_bpp_extra_and_option
[21:20:45] [PASSED] drm_test_cmdline_extra_and_option
[21:20:45] [PASSED] drm_test_cmdline_freestanding_options
[21:20:45] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[21:20:45] [PASSED] drm_test_cmdline_panel_orientation
[21:20:45] ================ drm_test_cmdline_invalid  =================
[21:20:45] [PASSED] margin_only
[21:20:45] [PASSED] interlace_only
[21:20:45] [PASSED] res_missing_x
[21:20:45] [PASSED] res_missing_y
[21:20:45] [PASSED] res_bad_y
[21:20:45] [PASSED] res_missing_y_bpp
[21:20:45] [PASSED] res_bad_bpp
[21:20:45] [PASSED] res_bad_refresh
[21:20:45] [PASSED] res_bpp_refresh_force_on_off
[21:20:45] [PASSED] res_invalid_mode
[21:20:45] [PASSED] res_bpp_wrong_place_mode
[21:20:45] [PASSED] name_bpp_refresh
[21:20:45] [PASSED] name_refresh
[21:20:45] [PASSED] name_refresh_wrong_mode
[21:20:45] [PASSED] name_refresh_invalid_mode
[21:20:45] [PASSED] rotate_multiple
[21:20:45] [PASSED] rotate_invalid_val
[21:20:45] [PASSED] rotate_truncated
[21:20:45] [PASSED] invalid_option
[21:20:45] [PASSED] invalid_tv_option
[21:20:45] [PASSED] truncated_tv_option
[21:20:45] ============ [PASSED] drm_test_cmdline_invalid =============
[21:20:45] =============== drm_test_cmdline_tv_options  ===============
[21:20:45] [PASSED] NTSC
[21:20:45] [PASSED] NTSC_443
[21:20:45] [PASSED] NTSC_J
[21:20:45] [PASSED] PAL
[21:20:45] [PASSED] PAL_M
[21:20:45] [PASSED] PAL_N
[21:20:45] [PASSED] SECAM
[21:20:45] =========== [PASSED] drm_test_cmdline_tv_options ===========
[21:20:45] =============== [PASSED] drm_cmdline_parser ================
[21:20:45] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[21:20:45] ========== drm_test_get_tv_mode_from_name_valid  ===========
[21:20:45] [PASSED] NTSC
[21:20:45] [PASSED] NTSC-443
[21:20:45] [PASSED] NTSC-J
[21:20:45] [PASSED] PAL
[21:20:45] [PASSED] PAL-M
[21:20:45] [PASSED] PAL-N
[21:20:45] [PASSED] SECAM
[21:20:45] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[21:20:45] [PASSED] drm_test_get_tv_mode_from_name_truncated
[21:20:45] ============ [PASSED] drm_get_tv_mode_from_name ============
[21:20:45] ============= drm_damage_helper (21 subtests) ==============
[21:20:45] [PASSED] drm_test_damage_iter_no_damage
[21:20:45] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[21:20:45] [PASSED] drm_test_damage_iter_no_damage_src_moved
[21:20:45] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[21:20:45] [PASSED] drm_test_damage_iter_no_damage_not_visible
[21:20:45] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[21:20:45] [PASSED] drm_test_damage_iter_no_damage_no_fb
[21:20:45] [PASSED] drm_test_damage_iter_simple_damage
[21:20:45] [PASSED] drm_test_damage_iter_single_damage
[21:20:45] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[21:20:45] [PASSED] drm_test_damage_iter_single_damage_outside_src
[21:20:45] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[21:20:45] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[21:20:45] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[21:20:45] [PASSED] drm_test_damage_iter_single_damage_src_moved
[21:20:45] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[21:20:45] [PASSED] drm_test_damage_iter_damage
[21:20:45] [PASSED] drm_test_damage_iter_damage_one_intersect
[21:20:45] [PASSED] drm_test_damage_iter_damage_one_outside
[21:20:45] [PASSED] drm_test_damage_iter_damage_src_moved
[21:20:45] [PASSED] drm_test_damage_iter_damage_not_visible
[21:20:45] ================ [PASSED] drm_damage_helper ================
[21:20:45] ============== drm_dp_mst_helper (2 subtests) ==============
[21:20:45] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[21:20:45] [PASSED] Clock 154000 BPP 30 DSC disabled
[21:20:45] [PASSED] Clock 234000 BPP 30 DSC disabled
[21:20:45] [PASSED] Clock 297000 BPP 24 DSC disabled
[21:20:45] [PASSED] Clock 332880 BPP 24 DSC enabled
[21:20:45] [PASSED] Clock 324540 BPP 24 DSC enabled
[21:20:45] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[21:20:45] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[21:20:45] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[21:20:45] [PASSED] DP_POWER_UP_PHY with port number
[21:20:45] [PASSED] DP_POWER_DOWN_PHY with port number
[21:20:45] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[21:20:45] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[21:20:45] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[21:20:45] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[21:20:45] [PASSED] DP_QUERY_PAYLOAD with port number
[21:20:45] [PASSED] DP_QUERY_PAYLOAD with VCPI
[21:20:45] [PASSED] DP_REMOTE_DPCD_READ with port number
[21:20:45] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[21:20:45] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[21:20:45] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[21:20:45] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[21:20:45] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[21:20:45] [PASSED] DP_REMOTE_I2C_READ with port number
[21:20:45] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[21:20:45] [PASSED] DP_REMOTE_I2C_READ with transactions array
[21:20:45] [PASSED] DP_REMOTE_I2C_WRITE with port number
[21:20:45] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[21:20:45] [PASSED] DP_REMOTE_I2C_WRITE with data array
[21:20:45] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[21:20:45] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[21:20:45] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[21:20:45] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[21:20:45] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[21:20:45] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[21:20:45] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[21:20:45] ================ [PASSED] drm_dp_mst_helper ================
[21:20:45] =========== drm_format_helper_test (11 subtests) ===========
[21:20:45] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[21:20:45] [PASSED] single_pixel_source_buffer
[21:20:45] [PASSED] single_pixel_clip_rectangle
[21:20:45] [PASSED] well_known_colors
[21:20:45] [PASSED] destination_pitch
[21:20:45] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[21:20:45] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[21:20:45] [PASSED] single_pixel_source_buffer
[21:20:45] [PASSED] single_pixel_clip_rectangle
[21:20:45] [PASSED] well_known_colors
[21:20:45] [PASSED] destination_pitch
[21:20:45] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[21:20:45] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[21:20:45] [PASSED] single_pixel_source_buffer
[21:20:45] [PASSED] single_pixel_clip_rectangle
[21:20:45] [PASSED] well_known_colors
[21:20:45] [PASSED] destination_pitch
[21:20:45] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[21:20:45] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[21:20:45] [PASSED] single_pixel_source_buffer
[21:20:45] [PASSED] single_pixel_clip_rectangle
[21:20:45] [PASSED] well_known_colors
[21:20:45] [PASSED] destination_pitch
[21:20:45] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[21:20:45] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[21:20:45] [PASSED] single_pixel_source_buffer
[21:20:45] [PASSED] single_pixel_clip_rectangle
[21:20:45] [PASSED] well_known_colors
[21:20:45] [PASSED] destination_pitch
[21:20:45] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[21:20:45] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[21:20:45] [PASSED] single_pixel_source_buffer
[21:20:45] [PASSED] single_pixel_clip_rectangle
[21:20:45] [PASSED] well_known_colors
[21:20:45] [PASSED] destination_pitch
[21:20:45] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[21:20:45] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[21:20:45] [PASSED] single_pixel_source_buffer
[21:20:45] [PASSED] single_pixel_clip_rectangle
[21:20:45] [PASSED] well_known_colors
[21:20:45] [PASSED] destination_pitch
[21:20:45] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[21:20:45] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[21:20:45] [PASSED] single_pixel_source_buffer
[21:20:45] [PASSED] single_pixel_clip_rectangle
[21:20:45] [PASSED] well_known_colors
[21:20:45] [PASSED] destination_pitch
[21:20:45] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[21:20:45] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[21:20:45] [PASSED] single_pixel_source_buffer
[21:20:45] [PASSED] single_pixel_clip_rectangle
[21:20:45] [PASSED] well_known_colors
[21:20:45] [PASSED] destination_pitch
[21:20:45] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[21:20:45] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[21:20:45] [PASSED] single_pixel_source_buffer
[21:20:45] [PASSED] single_pixel_clip_rectangle
[21:20:45] [PASSED] well_known_colors
[21:20:45] [PASSED] destination_pitch
[21:20:45] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[21:20:45] ============== drm_test_fb_xrgb8888_to_mono  ===============
[21:20:45] [PASSED] single_pixel_source_buffer
[21:20:45] [PASSED] single_pixel_clip_rectangle
[21:20:45] [PASSED] well_known_colors
[21:20:45] [PASSED] destination_pitch
[21:20:45] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[21:20:45] ============= [PASSED] drm_format_helper_test ==============
[21:20:45] ================= drm_format (18 subtests) =================
[21:20:45] [PASSED] drm_test_format_block_width_invalid
[21:20:45] [PASSED] drm_test_format_block_width_one_plane
[21:20:45] [PASSED] drm_test_format_block_width_two_plane
[21:20:45] [PASSED] drm_test_format_block_width_three_plane
[21:20:45] [PASSED] drm_test_format_block_width_tiled
[21:20:45] [PASSED] drm_test_format_block_height_invalid
[21:20:45] [PASSED] drm_test_format_block_height_one_plane
[21:20:45] [PASSED] drm_test_format_block_height_two_plane
[21:20:45] [PASSED] drm_test_format_block_height_three_plane
[21:20:45] [PASSED] drm_test_format_block_height_tiled
[21:20:45] [PASSED] drm_test_format_min_pitch_invalid
[21:20:45] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[21:20:45] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[21:20:45] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[21:20:45] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[21:20:45] [PASSED] drm_test_format_min_pitch_two_plane
[21:20:45] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[21:20:45] [PASSED] drm_test_format_min_pitch_tiled
[21:20:45] =================== [PASSED] drm_format ====================
[21:20:45] =============== drm_framebuffer (1 subtest) ================
[21:20:45] =============== drm_test_framebuffer_create  ===============
[21:20:45] [PASSED] ABGR8888 normal sizes
[21:20:45] [PASSED] ABGR8888 max sizes
[21:20:45] [PASSED] ABGR8888 pitch greater than min required
[21:20:45] [PASSED] ABGR8888 pitch less than min required
[21:20:45] [PASSED] ABGR8888 Invalid width
[21:20:45] [PASSED] ABGR8888 Invalid buffer handle
[21:20:45] [PASSED] No pixel format
[21:20:45] [PASSED] ABGR8888 Width 0
[21:20:45] [PASSED] ABGR8888 Height 0
[21:20:45] [PASSED] ABGR8888 Out of bound height * pitch combination
[21:20:45] [PASSED] ABGR8888 Large buffer offset
[21:20:45] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[21:20:45] [PASSED] ABGR8888 Valid buffer modifier
[21:20:45] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[21:20:45] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[21:20:45] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[21:20:45] [PASSED] NV12 Normal sizes
[21:20:45] [PASSED] NV12 Max sizes
[21:20:45] [PASSED] NV12 Invalid pitch
[21:20:45] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[21:20:45] [PASSED] NV12 different  modifier per-plane
[21:20:45] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[21:20:45] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[21:20:45] [PASSED] NV12 Modifier for inexistent plane
[21:20:45] [PASSED] NV12 Handle for inexistent plane
[21:20:45] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[21:20:45] [PASSED] YVU420 Normal sizes
[21:20:45] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[21:20:45] [PASSED] YVU420 Max sizes
[21:20:45] [PASSED] YVU420 Invalid pitch
[21:20:45] [PASSED] YVU420 Different pitches
[21:20:45] [PASSED] YVU420 Different buffer offsets/pitches
[21:20:45] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[21:20:45] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[21:20:45] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[21:20:45] [PASSED] YVU420 Valid modifier
[21:20:45] [PASSED] YVU420 Different modifiers per plane
[21:20:45] [PASSED] YVU420 Modifier for inexistent plane
[21:20:45] [PASSED] X0L2 Normal sizes
[21:20:45] [PASSED] X0L2 Max sizes
[21:20:45] [PASSED] X0L2 Invalid pitch
[21:20:45] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[21:20:45] [PASSED] X0L2 Handle for inexistent plane
[21:20:45] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[21:20:45] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[21:20:45] [PASSED] X0L2 Valid modifier
[21:20:45] [PASSED] X0L2 Modifier for inexistent plane
[21:20:45] =========== [PASSED] drm_test_framebuffer_create ===========
[21:20:45] ================= [PASSED] drm_framebuffer =================
[21:20:45] =============== drm-test-managed (1 subtest) ===============
[21:20:45] [PASSED] drm_test_managed_run_action
[21:20:45] ================ [PASSED] drm-test-managed =================
[21:20:45] =================== drm_mm (19 subtests) ===================
[21:20:45] [PASSED] drm_test_mm_init
[21:20:45] [PASSED] drm_test_mm_debug
[21:20:55] [PASSED] drm_test_mm_reserve
[21:21:05] [PASSED] drm_test_mm_insert
[21:21:06] [PASSED] drm_test_mm_replace
[21:21:06] [PASSED] drm_test_mm_insert_range
[21:21:06] [PASSED] drm_test_mm_frag
[21:21:06] [PASSED] drm_test_mm_align
[21:21:06] [PASSED] drm_test_mm_align32
[21:21:07] [PASSED] drm_test_mm_align64
[21:21:07] [PASSED] drm_test_mm_evict
[21:21:07] [PASSED] drm_test_mm_evict_range
[21:21:07] [PASSED] drm_test_mm_topdown
[21:21:07] [PASSED] drm_test_mm_bottomup
[21:21:07] [PASSED] drm_test_mm_lowest
[21:21:07] [PASSED] drm_test_mm_highest
[21:21:08] [PASSED] drm_test_mm_color
[21:21:08] [PASSED] drm_test_mm_color_evict
[21:21:08] [PASSED] drm_test_mm_color_evict_range
[21:21:08] ===================== [PASSED] drm_mm ======================
[21:21:08] ============= drm_modes_analog_tv (4 subtests) =============
[21:21:08] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[21:21:08] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[21:21:08] [PASSED] drm_test_modes_analog_tv_pal_576i
[21:21:08] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[21:21:08] =============== [PASSED] drm_modes_analog_tv ===============
[21:21:08] ============== drm_plane_helper (2 subtests) ===============
[21:21:08] =============== drm_test_check_plane_state  ================
[21:21:08] [PASSED] clipping_simple
[21:21:08] [PASSED] clipping_rotate_reflect
[21:21:08] [PASSED] positioning_simple
[21:21:08] [PASSED] upscaling
[21:21:08] [PASSED] downscaling
[21:21:08] [PASSED] rounding1
[21:21:08] [PASSED] rounding2
[21:21:08] [PASSED] rounding3
[21:21:08] [PASSED] rounding4
[21:21:08] =========== [PASSED] drm_test_check_plane_state ============
[21:21:08] =========== drm_test_check_invalid_plane_state  ============
[21:21:08] [PASSED] positioning_invalid
[21:21:08] [PASSED] upscaling_invalid
[21:21:08] [PASSED] downscaling_invalid
[21:21:08] ======= [PASSED] drm_test_check_invalid_plane_state ========
[21:21:08] ================ [PASSED] drm_plane_helper =================
[21:21:08] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[21:21:08] ====== drm_test_connector_helper_tv_get_modes_check  =======
[21:21:08] [PASSED] None
[21:21:08] [PASSED] PAL
[21:21:08] [PASSED] NTSC
[21:21:08] [PASSED] Both, NTSC Default
[21:21:08] [PASSED] Both, PAL Default
[21:21:08] [PASSED] Both, NTSC Default, with PAL on command-line
[21:21:08] [PASSED] Both, PAL Default, with NTSC on command-line
[21:21:08] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[21:21:08] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[21:21:08] ================== drm_rect (9 subtests) ===================
[21:21:08] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[21:21:08] [PASSED] drm_test_rect_clip_scaled_not_clipped
[21:21:08] [PASSED] drm_test_rect_clip_scaled_clipped
[21:21:08] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[21:21:08] ================= drm_test_rect_intersect  =================
[21:21:08] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[21:21:08] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[21:21:08] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[21:21:08] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[21:21:08] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[21:21:08] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[21:21:08] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[21:21:08] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[21:21:08] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[21:21:08] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[21:21:08] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[21:21:08] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[21:21:08] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[21:21:08] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[21:21:08] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[21:21:08] ============= [PASSED] drm_test_rect_intersect =============
[21:21:08] ================ drm_test_rect_calc_hscale  ================
[21:21:08] [PASSED] normal use
[21:21:08] [PASSED] out of max range
[21:21:08] [PASSED] out of min range
[21:21:08] [PASSED] zero dst
[21:21:08] [PASSED] negative src
[21:21:08] [PASSED] negative dst
[21:21:08] ============ [PASSED] drm_test_rect_calc_hscale ============
[21:21:08] ================ drm_test_rect_calc_vscale  ================
[21:21:08] [PASSED] normal use
[21:21:08] [PASSED] out of max range
[21:21:08] [PASSED] out of min range
[21:21:08] [PASSED] zero dst
[21:21:08] [PASSED] negative src
[21:21:08] [PASSED] negative dst
[21:21:08] ============ [PASSED] drm_test_rect_calc_vscale ============
[21:21:08] ================== drm_test_rect_rotate  ===================
[21:21:08] [PASSED] reflect-x
[21:21:08] [PASSED] reflect-y
[21:21:08] [PASSED] rotate-0
[21:21:08] [PASSED] rotate-90
[21:21:08] [PASSED] rotate-180
[21:21:08] [PASSED] rotate-270
[21:21:08] ============== [PASSED] drm_test_rect_rotate ===============
[21:21:08] ================ drm_test_rect_rotate_inv  =================
[21:21:08] [PASSED] reflect-x
[21:21:08] [PASSED] reflect-y
[21:21:08] [PASSED] rotate-0
[21:21:08] [PASSED] rotate-90
[21:21:08] [PASSED] rotate-180
[21:21:08] [PASSED] rotate-270
[21:21:08] ============ [PASSED] drm_test_rect_rotate_inv =============
[21:21:08] ==================== [PASSED] drm_rect =====================
[21:21:08] ============================================================
[21:21:08] Testing complete. Ran 333 tests: passed: 333
[21:21:08] Elapsed time: 43.074s total, 1.697s configuring, 18.347s building, 22.996s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


