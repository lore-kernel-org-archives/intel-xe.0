Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B204AC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 02:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A48510E248;
	Fri,  8 Dec 2023 02:37:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4427810E248;
 Fri,  8 Dec 2023 02:37:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4044CA7DFF;
 Fri,  8 Dec 2023 02:37:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/xe2=3A_Add_workaround_1?=
 =?utf-8?q?6020183090?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Fri, 08 Dec 2023 02:37:05 -0000
Message-ID: <170200302525.7325.13386697064763823060@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231207175117.2334022-1-lucas.demarchi@intel.com>
In-Reply-To: <20231207175117.2334022-1-lucas.demarchi@intel.com>
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

Series: drm/xe/xe2: Add workaround 16020183090
URL   : https://patchwork.freedesktop.org/series/127519/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[02:35:53] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:35:58] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[02:36:18] Starting KUnit Kernel (1/1)...
[02:36:18] ============================================================
[02:36:18] ========================== lmtt  ===========================
[02:36:18] ======================== test_ops  =========================
[02:36:18] [PASSED] 2-level
[02:36:18] [PASSED] multi-level
[02:36:18] ==================== [PASSED] test_ops =====================
[02:36:18] ====================== [PASSED] lmtt =======================
[02:36:18] ========================== xe_bo  ==========================
[02:36:18] [SKIPPED] xe_ccs_migrate_kunit
[02:36:18] [SKIPPED] xe_bo_evict_kunit
[02:36:18] ===================== [SKIPPED] xe_bo ======================
[02:36:18] ======================= xe_dma_buf  ========================
[02:36:18] [SKIPPED] xe_dma_buf_kunit
[02:36:18] =================== [SKIPPED] xe_dma_buf ===================
[02:36:18] ======================= xe_migrate  ========================
[02:36:18] [SKIPPED] xe_migrate_sanity_kunit
[02:36:18] =================== [SKIPPED] xe_migrate ===================
[02:36:18] ========================= xe_mocs  =========================
[02:36:18] [SKIPPED] xe_live_mocs_kernel_kunit
[02:36:18] ==================== [SKIPPED] xe_mocs =====================
[02:36:18] ========================= xe_pci  ==========================
[02:36:18] [PASSED] xe_gmdid_graphics_ip
[02:36:18] [PASSED] xe_gmdid_media_ip
[02:36:18] ===================== [PASSED] xe_pci ======================
[02:36:18] ========================= xe_rtp  ==========================
[02:36:18] ================== xe_rtp_process_tests  ===================
[02:36:18] [PASSED] coalesce-same-reg
[02:36:18] [PASSED] no-match-no-add
[02:36:18] [PASSED] no-match-no-add-multiple-rules
[02:36:18] [PASSED] two-regs-two-entries
[02:36:18] [PASSED] clr-one-set-other
[02:36:18] [PASSED] set-field
[02:36:18] [PASSED] conflict-duplicate
[02:36:18] [PASSED] conflict-not-disjoint
[02:36:18] [PASSED] conflict-reg-type
[02:36:18] ============== [PASSED] xe_rtp_process_tests ===============
[02:36:18] ===================== [PASSED] xe_rtp ======================
[02:36:18] ========================== xe_wa  ==========================
[02:36:18] ======================== xe_wa_gt  =========================
[02:36:18] [PASSED] TIGERLAKE (B0)
[02:36:18] [PASSED] DG1 (A0)
[02:36:18] [PASSED] DG1 (B0)
[02:36:18] [PASSED] ALDERLAKE_S (A0)
[02:36:18] [PASSED] ALDERLAKE_S (B0)
[02:36:18] [PASSED] ALDERLAKE_S (C0)
[02:36:18] [PASSED] ALDERLAKE_S (D0)
[02:36:18] [PASSED] ALDERLAKE_P (A0)
[02:36:18] [PASSED] ALDERLAKE_P (B0)
[02:36:18] [PASSED] ALDERLAKE_P (C0)
[02:36:18] [PASSED] ALDERLAKE_S_RPLS (D0)
[02:36:18] [PASSED] ALDERLAKE_P_RPLU (E0)
[02:36:18] [PASSED] DG2_G10 (A0)
[02:36:18] [PASSED] DG2_G10 (A1)
[02:36:18] [PASSED] DG2_G10 (B0)
[02:36:18] [PASSED] DG2_G10 (C0)
[02:36:18] [PASSED] DG2_G11 (A0)
[02:36:18] [PASSED] DG2_G11 (B0)
[02:36:18] [PASSED] DG2_G11 (B1)
[02:36:18] [PASSED] DG2_G12 (A0)
[02:36:18] [PASSED] DG2_G12 (A1)
[02:36:18] [PASSED] PVC (B0)
[02:36:18] [PASSED] PVC (B1)
[02:36:18] [PASSED] PVC (C0)
[02:36:18] [PASSED] METEORLAKE (g:A0, m:A0)
[02:36:18] [PASSED] METEORLAKE (g:A0, m:A0)
[02:36:18] [PASSED] LUNARLAKE (g:A0, m:A0)
[02:36:18] [PASSED] LUNARLAKE (g:B0, m:A0)
[02:36:18] ==================== [PASSED] xe_wa_gt =====================
[02:36:18] ====================== [PASSED] xe_wa ======================
[02:36:18] ============================================================
[02:36:18] Testing complete. Ran 46 tests: passed: 41, skipped: 5
[02:36:18] Elapsed time: 24.921s total, 4.244s configuring, 20.508s building, 0.146s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[02:36:18] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:36:20] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[02:36:39] Starting KUnit Kernel (1/1)...
[02:36:39] ============================================================
[02:36:39] ================== drm_test_pick_cmdline  ==================
[02:36:39] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[02:36:39] =============== drm_test_pick_cmdline_named  ===============
[02:36:39] [PASSED] NTSC
[02:36:39] [PASSED] NTSC-J
[02:36:39] [PASSED] PAL
[02:36:39] [PASSED] PAL-M
[02:36:39] =========== [PASSED] drm_test_pick_cmdline_named ===========
[02:36:39] ============== [PASSED] drm_test_pick_cmdline ==============
[02:36:39] ======================== drm_buddy  ========================
[02:36:39] [PASSED] drm_test_buddy_alloc_limit
[02:36:39] [PASSED] drm_test_buddy_alloc_range
[02:36:39] [PASSED] drm_test_buddy_alloc_optimistic
[02:36:39] [PASSED] drm_test_buddy_alloc_pessimistic
[02:36:39] [PASSED] drm_test_buddy_alloc_smoke
[02:36:39] [PASSED] drm_test_buddy_alloc_pathological
[02:36:39] ==================== [PASSED] drm_buddy ====================
[02:36:39] =================== drm_cmdline_parser  ====================
[02:36:39] [PASSED] drm_test_cmdline_force_d_only
[02:36:39] [PASSED] drm_test_cmdline_force_D_only_dvi
[02:36:39] [PASSED] drm_test_cmdline_force_D_only_hdmi
[02:36:39] [PASSED] drm_test_cmdline_force_D_only_not_digital
[02:36:39] [PASSED] drm_test_cmdline_force_e_only
[02:36:39] [PASSED] drm_test_cmdline_res
[02:36:39] [PASSED] drm_test_cmdline_res_vesa
[02:36:39] [PASSED] drm_test_cmdline_res_vesa_rblank
[02:36:39] [PASSED] drm_test_cmdline_res_rblank
[02:36:39] [PASSED] drm_test_cmdline_res_bpp
[02:36:39] [PASSED] drm_test_cmdline_res_refresh
[02:36:39] [PASSED] drm_test_cmdline_res_bpp_refresh
[02:36:39] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[02:36:39] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[02:36:39] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[02:36:39] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[02:36:39] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[02:36:39] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[02:36:39] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[02:36:39] [PASSED] drm_test_cmdline_res_margins_force_on
[02:36:39] [PASSED] drm_test_cmdline_res_vesa_margins
[02:36:39] [PASSED] drm_test_cmdline_name
[02:36:39] [PASSED] drm_test_cmdline_name_bpp
[02:36:39] [PASSED] drm_test_cmdline_name_option
[02:36:39] [PASSED] drm_test_cmdline_name_bpp_option
[02:36:39] [PASSED] drm_test_cmdline_rotate_0
[02:36:39] [PASSED] drm_test_cmdline_rotate_90
[02:36:39] [PASSED] drm_test_cmdline_rotate_180
[02:36:39] [PASSED] drm_test_cmdline_rotate_270
[02:36:39] [PASSED] drm_test_cmdline_hmirror
[02:36:39] [PASSED] drm_test_cmdline_vmirror
[02:36:39] [PASSED] drm_test_cmdline_margin_options
[02:36:39] [PASSED] drm_test_cmdline_multiple_options
[02:36:39] [PASSED] drm_test_cmdline_bpp_extra_and_option
[02:36:39] [PASSED] drm_test_cmdline_extra_and_option
[02:36:39] [PASSED] drm_test_cmdline_freestanding_options
[02:36:39] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[02:36:39] [PASSED] drm_test_cmdline_panel_orientation
[02:36:39] ================ drm_test_cmdline_invalid  =================
[02:36:39] [PASSED] margin_only
[02:36:39] [PASSED] interlace_only
[02:36:39] [PASSED] res_missing_x
[02:36:39] [PASSED] res_missing_y
[02:36:39] [PASSED] res_bad_y
[02:36:39] [PASSED] res_missing_y_bpp
[02:36:39] [PASSED] res_bad_bpp
[02:36:39] [PASSED] res_bad_refresh
[02:36:39] [PASSED] res_bpp_refresh_force_on_off
[02:36:39] [PASSED] res_invalid_mode
[02:36:39] [PASSED] res_bpp_wrong_place_mode
[02:36:39] [PASSED] name_bpp_refresh
[02:36:39] [PASSED] name_refresh
[02:36:39] [PASSED] name_refresh_wrong_mode
[02:36:39] [PASSED] name_refresh_invalid_mode
[02:36:39] [PASSED] rotate_multiple
[02:36:39] [PASSED] rotate_invalid_val
[02:36:39] [PASSED] rotate_truncated
[02:36:39] [PASSED] invalid_option
[02:36:39] [PASSED] invalid_tv_option
[02:36:39] [PASSED] truncated_tv_option
[02:36:39] ============ [PASSED] drm_test_cmdline_invalid =============
[02:36:39] =============== drm_test_cmdline_tv_options  ===============
[02:36:39] [PASSED] NTSC
[02:36:39] [PASSED] NTSC_443
[02:36:39] [PASSED] NTSC_J
[02:36:39] [PASSED] PAL
[02:36:39] [PASSED] PAL_M
[02:36:39] [PASSED] PAL_N
[02:36:39] [PASSED] SECAM
[02:36:39] =========== [PASSED] drm_test_cmdline_tv_options ===========
[02:36:39] =============== [PASSED] drm_cmdline_parser ================
[02:36:39] ================ drm_get_tv_mode_from_name  ================
[02:36:39] ========== drm_test_get_tv_mode_from_name_valid  ===========
[02:36:39] [PASSED] NTSC
[02:36:39] [PASSED] NTSC-443
[02:36:39] [PASSED] NTSC-J
[02:36:39] [PASSED] PAL
[02:36:39] [PASSED] PAL-M
[02:36:39] [PASSED] PAL-N
[02:36:39] [PASSED] SECAM
[02:36:39] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[02:36:39] [PASSED] drm_test_get_tv_mode_from_name_truncated
[02:36:39] ============ [PASSED] drm_get_tv_mode_from_name ============
[02:36:39] ==================== drm_damage_helper  ====================
[02:36:39] [PASSED] drm_test_damage_iter_no_damage
[02:36:39] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[02:36:39] [PASSED] drm_test_damage_iter_no_damage_src_moved
[02:36:39] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[02:36:39] [PASSED] drm_test_damage_iter_no_damage_not_visible
[02:36:39] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[02:36:39] [PASSED] drm_test_damage_iter_no_damage_no_fb
[02:36:39] [PASSED] drm_test_damage_iter_simple_damage
[02:36:39] [PASSED] drm_test_damage_iter_single_damage
[02:36:39] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[02:36:39] [PASSED] drm_test_damage_iter_single_damage_outside_src
[02:36:39] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[02:36:39] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[02:36:39] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[02:36:39] [PASSED] drm_test_damage_iter_single_damage_src_moved
[02:36:39] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[02:36:39] [PASSED] drm_test_damage_iter_damage
[02:36:39] [PASSED] drm_test_damage_iter_damage_one_intersect
[02:36:39] [PASSED] drm_test_damage_iter_damage_one_outside
[02:36:39] [PASSED] drm_test_damage_iter_damage_src_moved
[02:36:39] [PASSED] drm_test_damage_iter_damage_not_visible
[02:36:39] ================ [PASSED] drm_damage_helper ================
[02:36:39] ==================== drm_dp_mst_helper  ====================
[02:36:39] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[02:36:39] [PASSED] Clock 154000 BPP 30 DSC disabled
[02:36:39] [PASSED] Clock 234000 BPP 30 DSC disabled
[02:36:39] [PASSED] Clock 297000 BPP 24 DSC disabled
[02:36:39] [PASSED] Clock 332880 BPP 24 DSC enabled
[02:36:39] [PASSED] Clock 324540 BPP 24 DSC enabled
[02:36:39] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[02:36:39] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[02:36:39] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[02:36:39] [PASSED] DP_POWER_UP_PHY with port number
[02:36:39] [PASSED] DP_POWER_DOWN_PHY with port number
[02:36:39] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[02:36:39] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[02:36:39] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[02:36:39] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[02:36:39] [PASSED] DP_QUERY_PAYLOAD with port number
[02:36:39] [PASSED] DP_QUERY_PAYLOAD with VCPI
[02:36:39] [PASSED] DP_REMOTE_DPCD_READ with port number
[02:36:39] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[02:36:39] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[02:36:39] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[02:36:39] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[02:36:39] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[02:36:39] [PASSED] DP_REMOTE_I2C_READ with port number
[02:36:39] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[02:36:39] [PASSED] DP_REMOTE_I2C_READ with transactions array
[02:36:39] [PASSED] DP_REMOTE_I2C_WRITE with port number
[02:36:39] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[02:36:39] [PASSED] DP_REMOTE_I2C_WRITE with data array
[02:36:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[02:36:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[02:36:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[02:36:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[02:36:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[02:36:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[02:36:39] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[02:36:39] ================ [PASSED] drm_dp_mst_helper ================
[02:36:39] ================= drm_format_helper_test  ==================
[02:36:39] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[02:36:39] [PASSED] single_pixel_source_buffer
[02:36:39] [PASSED] single_pixel_clip_rectangle
[02:36:39] [PASSED] well_known_colors
[02:36:39] [PASSED] destination_pitch
[02:36:39] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[02:36:39] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[02:36:39] [PASSED] single_pixel_source_buffer
[02:36:39] [PASSED] single_pixel_clip_rectangle
[02:36:39] [PASSED] well_known_colors
[02:36:39] [PASSED] destination_pitch
[02:36:39] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[02:36:39] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[02:36:39] [PASSED] single_pixel_source_buffer
[02:36:39] [PASSED] single_pixel_clip_rectangle
[02:36:39] [PASSED] well_known_colors
[02:36:39] [PASSED] destination_pitch
[02:36:39] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[02:36:39] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[02:36:39] [PASSED] single_pixel_source_buffer
[02:36:39] [PASSED] single_pixel_clip_rectangle
[02:36:39] [PASSED] well_known_colors
[02:36:39] [PASSED] destination_pitch
[02:36:39] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[02:36:39] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[02:36:39] [PASSED] single_pixel_source_buffer
[02:36:39] [PASSED] single_pixel_clip_rectangle
[02:36:39] [PASSED] well_known_colors
[02:36:39] [PASSED] destination_pitch
[02:36:39] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[02:36:39] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[02:36:39] [PASSED] single_pixel_source_buffer
[02:36:39] [PASSED] single_pixel_clip_rectangle
[02:36:39] [PASSED] well_known_colors
[02:36:39] [PASSED] destination_pitch
[02:36:39] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[02:36:39] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[02:36:39] [PASSED] single_pixel_source_buffer
[02:36:39] [PASSED] single_pixel_clip_rectangle
[02:36:39] [PASSED] well_known_colors
[02:36:39] [PASSED] destination_pitch
[02:36:39] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[02:36:39] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[02:36:39] [PASSED] single_pixel_source_buffer
[02:36:39] [PASSED] single_pixel_clip_rectangle
[02:36:39] [PASSED] well_known_colors
[02:36:39] [PASSED] destination_pitch
[02:36:39] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[02:36:39] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[02:36:39] [PASSED] single_pixel_source_buffer
[02:36:39] [PASSED] single_pixel_clip_rectangle
[02:36:39] [PASSED] well_known_colors
[02:36:39] [PASSED] destination_pitch
[02:36:39] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[02:36:39] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[02:36:39] [PASSED] single_pixel_source_buffer
[02:36:39] [PASSED] single_pixel_clip_rectangle
[02:36:39] [PASSED] well_known_colors
[02:36:39] [PASSED] destination_pitch
[02:36:39] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[02:36:39] ============== drm_test_fb_xrgb8888_to_mono  ===============
[02:36:39] [PASSED] single_pixel_source_buffer
[02:36:39] [PASSED] single_pixel_clip_rectangle
[02:36:39] [PASSED] well_known_colors
[02:36:39] [PASSED] destination_pitch
[02:36:39] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[02:36:39] ==================== drm_test_fb_swab  =====================
[02:36:39] [PASSED] single_pixel_source_buffer
[02:36:39] [PASSED] single_pixel_clip_rectangle
[02:36:39] [PASSED] well_known_colors
[02:36:39] [PASSED] destination_pitch
[02:36:39] ================ [PASSED] drm_test_fb_swab =================
[02:36:39] ================= drm_test_fb_clip_offset  =================
[02:36:39] [PASSED] pass through
[02:36:39] [PASSED] horizontal offset
[02:36:39] [PASSED] vertical offset
[02:36:39] [PASSED] horizontal and vertical offset
[02:36:39] [PASSED] horizontal offset (custom pitch)
[02:36:39] [PASSED] vertical offset (custom pitch)
[02:36:39] [PASSED] horizontal and vertical offset (custom pitch)
[02:36:39] ============= [PASSED] drm_test_fb_clip_offset =============
[02:36:39] ============== drm_test_fb_build_fourcc_list  ==============
[02:36:39] [PASSED] no native formats
[02:36:39] [PASSED] XRGB8888 as native format
[02:36:39] [PASSED] remove duplicates
[02:36:39] [PASSED] convert alpha formats
[02:36:39] [PASSED] random formats
[02:36:39] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[02:36:39] =================== drm_test_fb_memcpy  ====================
[02:36:39] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[02:36:39] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[02:36:39] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[02:36:39] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[02:36:39] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[02:36:39] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[02:36:39] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[02:36:39] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[02:36:39] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[02:36:39] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[02:36:39] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[02:36:39] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[02:36:39] =============== [PASSED] drm_test_fb_memcpy ================
[02:36:39] ============= [PASSED] drm_format_helper_test ==============
[02:36:39] ======================= drm_format  ========================
[02:36:39] [PASSED] drm_test_format_block_width_invalid
[02:36:39] [PASSED] drm_test_format_block_width_one_plane
[02:36:39] [PASSED] drm_test_format_block_width_two_plane
[02:36:39] [PASSED] drm_test_format_block_width_three_plane
[02:36:39] [PASSED] drm_test_format_block_width_tiled
[02:36:39] [PASSED] drm_test_format_block_height_invalid
[02:36:39] [PASSED] drm_test_format_block_height_one_plane
[02:36:39] [PASSED] drm_test_format_block_height_two_plane
[02:36:39] [PASSED] drm_test_format_block_height_three_plane
[02:36:39] [PASSED] drm_test_format_block_height_tiled
[02:36:39] [PASSED] drm_test_format_min_pitch_invalid
[02:36:39] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[02:36:39] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[02:36:39] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[02:36:39] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[02:36:39] [PASSED] drm_test_format_min_pitch_two_plane
[02:36:39] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[02:36:39] [PASSED] drm_test_format_min_pitch_tiled
[02:36:39] =================== [PASSED] drm_format ====================
[02:36:39] ===================== drm_framebuffer  =====================
[02:36:39] =============== drm_test_framebuffer_create  ===============
[02:36:39] [PASSED] ABGR8888 normal sizes
[02:36:39] [PASSED] ABGR8888 max sizes
[02:36:39] [PASSED] ABGR8888 pitch greater than min required
[02:36:39] [PASSED] ABGR8888 pitch less than min required
[02:36:39] [PASSED] ABGR8888 Invalid width
[02:36:39] [PASSED] ABGR8888 Invalid buffer handle
[02:36:39] [PASSED] No pixel format
[02:36:39] [PASSED] ABGR8888 Width 0
[02:36:39] [PASSED] ABGR8888 Height 0
[02:36:39] [PASSED] ABGR8888 Out of bound height * pitch combination
[02:36:39] [PASSED] ABGR8888 Large buffer offset
[02:36:39] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[02:36:39] [PASSED] ABGR8888 Valid buffer modifier
[02:36:39] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[02:36:39] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[02:36:39] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[02:36:39] [PASSED] NV12 Normal sizes
[02:36:39] [PASSED] NV12 Max sizes
[02:36:39] [PASSED] NV12 Invalid pitch
[02:36:39] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[02:36:39] [PASSED] NV12 different  modifier per-plane
[02:36:39] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[02:36:39] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[02:36:39] [PASSED] NV12 Modifier for inexistent plane
[02:36:39] [PASSED] NV12 Handle for inexistent plane
[02:36:39] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[02:36:39] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[02:36:39] [PASSED] YVU420 Normal sizes
[02:36:39] [PASSED] YVU420 Max sizes
[02:36:39] [PASSED] YVU420 Invalid pitch
[02:36:39] [PASSED] YVU420 Different pitches
[02:36:39] [PASSED] YVU420 Different buffer offsets/pitches
[02:36:39] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[02:36:39] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[02:36:39] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[02:36:39] [PASSED] YVU420 Valid modifier
[02:36:39] [PASSED] YVU420 Different modifiers per plane
[02:36:39] [PASSED] YVU420 Modifier for inexistent plane
[02:36:39] [PASSED] X0L2 Normal sizes
[02:36:39] [PASSED] X0L2 Max sizes
[02:36:39] [PASSED] X0L2 Invalid pitch
[02:36:39] [PASSED] X0L2 Pitch greater than minimum required
[02:36:39] [PASSED] X0L2 Handle for inexistent plane
[02:36:39] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[02:36:39] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[02:36:39] [PASSED] X0L2 Valid modifier
[02:36:39] [PASSED] X0L2 Modifier for inexistent plane
[02:36:39] =========== [PASSED] drm_test_framebuffer_create ===========
[02:36:39] ================= [PASSED] drm_framebuffer =================
[02:36:39] ==================== drm-test-managed  =====================
[02:36:39] [PASSED] drm_test_managed_run_action
[02:36:39] ================ [PASSED] drm-test-managed =================
[02:36:39] ========================= drm_mm  ==========================
[02:36:39] [PASSED] drm_test_mm_init
[02:36:39] [PASSED] drm_test_mm_debug
[02:36:49] [PASSED] drm_test_mm_reserve
[02:37:00] [PASSED] drm_test_mm_insert
[02:37:00] [PASSED] drm_test_mm_replace
[02:37:00] [PASSED] drm_test_mm_insert_range
[02:37:00] [PASSED] drm_test_mm_frag
[02:37:00] [PASSED] drm_test_mm_align
[02:37:00] [PASSED] drm_test_mm_align32
[02:37:01] [PASSED] drm_test_mm_align64
[02:37:01] [PASSED] drm_test_mm_evict
[02:37:01] [PASSED] drm_test_mm_evict_range
[02:37:01] [PASSED] drm_test_mm_topdown
[02:37:01] [PASSED] drm_test_mm_bottomup
[02:37:01] [PASSED] drm_test_mm_lowest
[02:37:01] [PASSED] drm_test_mm_highest
[02:37:02] [PASSED] drm_test_mm_color
[02:37:02] [PASSED] drm_test_mm_color_evict
[02:37:02] [PASSED] drm_test_mm_color_evict_range
[02:37:02] ===================== [PASSED] drm_mm ======================
[02:37:02] =================== drm_modes_analog_tv  ===================
[02:37:02] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[02:37:02] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[02:37:02] [PASSED] drm_test_modes_analog_tv_pal_576i
[02:37:02] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[02:37:02] =============== [PASSED] drm_modes_analog_tv ===============
[02:37:02] ==================== drm_plane_helper  =====================
[02:37:02] =============== drm_test_check_plane_state  ================
[02:37:02] [PASSED] clipping_simple
[02:37:02] [PASSED] clipping_rotate_reflect
[02:37:02] [PASSED] positioning_simple
[02:37:02] [PASSED] upscaling
[02:37:02] [PASSED] downscaling
[02:37:02] [PASSED] rounding1
[02:37:02] [PASSED] rounding2
[02:37:02] [PASSED] rounding3
[02:37:02] [PASSED] rounding4
[02:37:02] =========== [PASSED] drm_test_check_plane_state ============
[02:37:02] =========== drm_test_check_invalid_plane_state  ============
[02:37:02] [PASSED] positioning_invalid
[02:37:02] [PASSED] upscaling_invalid
[02:37:02] [PASSED] downscaling_invalid
[02:37:02] ======= [PASSED] drm_test_check_invalid_plane_state ========
[02:37:02] ================ [PASSED] drm_plane_helper =================
[02:37:02] ============ drm_connector_helper_tv_get_modes  ============
[02:37:02] ====== drm_test_connector_helper_tv_get_modes_check  =======
[02:37:02] [PASSED] None
[02:37:02] [PASSED] PAL
[02:37:02] [PASSED] NTSC
[02:37:02] [PASSED] Both, NTSC Default
[02:37:02] [PASSED] Both, PAL Default
[02:37:02] [PASSED] Both, NTSC Default, with PAL on command-line
[02:37:02] [PASSED] Both, PAL Default, with NTSC on command-line
[02:37:02] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[02:37:02] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[02:37:02] ======================== drm_rect  =========================
[02:37:02] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[02:37:02] [PASSED] drm_test_rect_clip_scaled_not_clipped
[02:37:02] [PASSED] drm_test_rect_clip_scaled_clipped
[02:37:02] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[02:37:02] ================= drm_test_rect_intersect  =================
[02:37:02] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[02:37:02] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[02:37:02] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[02:37:02] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[02:37:02] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[02:37:02] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[02:37:02] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[02:37:02] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[02:37:02] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[02:37:02] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[02:37:02] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[02:37:02] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[02:37:02] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[02:37:02] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[02:37:02] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[02:37:02] ============= [PASSED] drm_test_rect_intersect =============
[02:37:02] ================ drm_test_rect_calc_hscale  ================
[02:37:02] [PASSED] normal use
[02:37:02] [PASSED] out of max range
[02:37:02] [PASSED] out of min range
[02:37:02] [PASSED] zero dst
[02:37:02] [PASSED] negative src
[02:37:02] [PASSED] negative dst
[02:37:02] ============ [PASSED] drm_test_rect_calc_hscale ============
[02:37:02] ================ drm_test_rect_calc_vscale  ================
[02:37:02] [PASSED] normal use
[02:37:02] [PASSED] out of max range
[02:37:02] [PASSED] out of min range
[02:37:02] [PASSED] zero dst
[02:37:02] [PASSED] negative src
[02:37:02] [PASSED] negative dst
[02:37:02] ============ [PASSED] drm_test_rect_calc_vscale ============
[02:37:02] ================== drm_test_rect_rotate  ===================
[02:37:02] [PASSED] reflect-x
[02:37:02] [PASSED] reflect-y
[02:37:02] [PASSED] rotate-0
[02:37:02] [PASSED] rotate-90
[02:37:02] [PASSED] rotate-180
[02:37:02] [PASSED] rotate-270
[02:37:02] ============== [PASSED] drm_test_rect_rotate ===============
[02:37:02] ================ drm_test_rect_rotate_inv  =================
[02:37:02] [PASSED] reflect-x
[02:37:02] [PASSED] reflect-y
[02:37:02] [PASSED] rotate-0
[02:37:02] [PASSED] rotate-90
[02:37:02] [PASSED] rotate-180
[02:37:02] [PASSED] rotate-270
[02:37:02] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[02:37:02] ==================== [PASSED] drm_rect =====================
[02:37:02] ======================== drm_exec  =========================
[02:37:02] [PASSED] sanitycheck
[02:37:02] [PASSED] test_lock
[02:37:02] [PASSED] test_lock_unlock
[02:37:02] [PASSED] test_duplicates
[02:37:02] [PASSED] test_prepare
[02:37:02] [PASSED] test_prepare_array
[02:37:02] [PASSED] test_multiple_loops
[02:37:02] ==================== [PASSED] drm_exec =====================
[02:37:02] ============================================================
[02:37:02] Testing complete. Ran 368 tests: passed: 368
[02:37:02] Elapsed time: 44.107s total, 1.692s configuring, 19.034s building, 23.358s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


