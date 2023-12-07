Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F39C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 19:46:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679C010E95F;
	Thu,  7 Dec 2023 19:46:42 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A25BD10E0C8;
 Thu,  7 Dec 2023 19:46:39 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9E603AADD8;
 Thu,  7 Dec 2023 19:46:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Adjust_to_DRM_GPUVM_?=
 =?utf-8?q?changes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 07 Dec 2023 19:46:39 -0000
Message-ID: <170197839964.28720.5495683000193712313@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Adjust to DRM GPUVM changes
URL   : https://patchwork.freedesktop.org/series/127496/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[19:45:28] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:45:32] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[19:45:53] Starting KUnit Kernel (1/1)...
[19:45:53] ============================================================
[19:45:53] ========================== lmtt  ===========================
[19:45:53] ======================== test_ops  =========================
[19:45:53] [PASSED] 2-level
[19:45:53] [PASSED] multi-level
[19:45:53] ==================== [PASSED] test_ops =====================
[19:45:53] ====================== [PASSED] lmtt =======================
[19:45:53] ========================== xe_bo  ==========================
[19:45:53] [SKIPPED] xe_ccs_migrate_kunit
[19:45:53] [SKIPPED] xe_bo_evict_kunit
[19:45:53] ===================== [SKIPPED] xe_bo ======================
[19:45:53] ======================= xe_dma_buf  ========================
[19:45:53] [SKIPPED] xe_dma_buf_kunit
[19:45:53] =================== [SKIPPED] xe_dma_buf ===================
[19:45:53] ======================= xe_migrate  ========================
[19:45:53] [SKIPPED] xe_migrate_sanity_kunit
[19:45:53] =================== [SKIPPED] xe_migrate ===================
[19:45:53] ========================= xe_mocs  =========================
[19:45:53] [SKIPPED] xe_live_mocs_kernel_kunit
[19:45:53] ==================== [SKIPPED] xe_mocs =====================
[19:45:53] ========================= xe_pci  ==========================
[19:45:53] [PASSED] xe_gmdid_graphics_ip
[19:45:53] [PASSED] xe_gmdid_media_ip
[19:45:53] ===================== [PASSED] xe_pci ======================
[19:45:53] ========================= xe_rtp  ==========================
[19:45:53] ================== xe_rtp_process_tests  ===================
[19:45:53] [PASSED] coalesce-same-reg
[19:45:53] [PASSED] no-match-no-add
[19:45:53] [PASSED] no-match-no-add-multiple-rules
[19:45:53] [PASSED] two-regs-two-entries
[19:45:53] [PASSED] clr-one-set-other
[19:45:53] [PASSED] set-field
[19:45:53] [PASSED] conflict-duplicate
[19:45:53] [PASSED] conflict-not-disjoint
[19:45:53] [PASSED] conflict-reg-type
[19:45:53] ============== [PASSED] xe_rtp_process_tests ===============
[19:45:53] ===================== [PASSED] xe_rtp ======================
[19:45:53] ========================== xe_wa  ==========================
[19:45:53] ======================== xe_wa_gt  =========================
[19:45:53] [PASSED] TIGERLAKE (B0)
[19:45:53] [PASSED] DG1 (A0)
[19:45:53] [PASSED] DG1 (B0)
[19:45:53] [PASSED] ALDERLAKE_S (A0)
[19:45:53] [PASSED] ALDERLAKE_S (B0)
[19:45:53] [PASSED] ALDERLAKE_S (C0)
[19:45:53] [PASSED] ALDERLAKE_S (D0)
[19:45:53] [PASSED] ALDERLAKE_P (A0)
[19:45:53] [PASSED] ALDERLAKE_P (B0)
[19:45:53] [PASSED] ALDERLAKE_P (C0)
[19:45:53] [PASSED] ALDERLAKE_S_RPLS (D0)
[19:45:53] [PASSED] ALDERLAKE_P_RPLU (E0)
[19:45:53] [PASSED] DG2_G10 (A0)
[19:45:53] [PASSED] DG2_G10 (A1)
[19:45:53] [PASSED] DG2_G10 (B0)
[19:45:53] [PASSED] DG2_G10 (C0)
[19:45:53] [PASSED] DG2_G11 (A0)
[19:45:53] [PASSED] DG2_G11 (B0)
[19:45:53] [PASSED] DG2_G11 (B1)
[19:45:53] [PASSED] DG2_G12 (A0)
[19:45:53] [PASSED] DG2_G12 (A1)
[19:45:53] [PASSED] PVC (B0)
[19:45:53] [PASSED] PVC (B1)
[19:45:53] [PASSED] PVC (C0)
[19:45:53] [PASSED] METEORLAKE (g:A0, m:A0)
[19:45:53] [PASSED] METEORLAKE (g:A0, m:A0)
[19:45:53] [PASSED] LUNARLAKE (g:A0, m:A0)
[19:45:53] [PASSED] LUNARLAKE (g:B0, m:A0)
[19:45:53] ==================== [PASSED] xe_wa_gt =====================
[19:45:53] ====================== [PASSED] xe_wa ======================
[19:45:53] ============================================================
[19:45:53] Testing complete. Ran 46 tests: passed: 41, skipped: 5
[19:45:53] Elapsed time: 25.116s total, 4.229s configuring, 20.768s building, 0.099s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[19:45:53] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:45:54] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[19:46:14] Starting KUnit Kernel (1/1)...
[19:46:14] ============================================================
[19:46:14] ================== drm_test_pick_cmdline  ==================
[19:46:14] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[19:46:14] =============== drm_test_pick_cmdline_named  ===============
[19:46:14] [PASSED] NTSC
[19:46:14] [PASSED] NTSC-J
[19:46:14] [PASSED] PAL
[19:46:14] [PASSED] PAL-M
[19:46:14] =========== [PASSED] drm_test_pick_cmdline_named ===========
[19:46:14] ============== [PASSED] drm_test_pick_cmdline ==============
[19:46:14] ======================== drm_buddy  ========================
[19:46:14] [PASSED] drm_test_buddy_alloc_limit
[19:46:14] [PASSED] drm_test_buddy_alloc_range
[19:46:14] [PASSED] drm_test_buddy_alloc_optimistic
[19:46:14] [PASSED] drm_test_buddy_alloc_pessimistic
[19:46:14] [PASSED] drm_test_buddy_alloc_smoke
[19:46:14] [PASSED] drm_test_buddy_alloc_pathological
[19:46:14] ==================== [PASSED] drm_buddy ====================
[19:46:14] =================== drm_cmdline_parser  ====================
[19:46:14] [PASSED] drm_test_cmdline_force_d_only
[19:46:14] [PASSED] drm_test_cmdline_force_D_only_dvi
[19:46:14] [PASSED] drm_test_cmdline_force_D_only_hdmi
[19:46:14] [PASSED] drm_test_cmdline_force_D_only_not_digital
[19:46:14] [PASSED] drm_test_cmdline_force_e_only
[19:46:14] [PASSED] drm_test_cmdline_res
[19:46:14] [PASSED] drm_test_cmdline_res_vesa
[19:46:14] [PASSED] drm_test_cmdline_res_vesa_rblank
[19:46:14] [PASSED] drm_test_cmdline_res_rblank
[19:46:14] [PASSED] drm_test_cmdline_res_bpp
[19:46:14] [PASSED] drm_test_cmdline_res_refresh
[19:46:14] [PASSED] drm_test_cmdline_res_bpp_refresh
[19:46:14] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[19:46:14] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[19:46:14] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[19:46:14] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[19:46:14] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[19:46:14] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[19:46:14] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[19:46:14] [PASSED] drm_test_cmdline_res_margins_force_on
[19:46:14] [PASSED] drm_test_cmdline_res_vesa_margins
[19:46:14] [PASSED] drm_test_cmdline_name
[19:46:14] [PASSED] drm_test_cmdline_name_bpp
[19:46:14] [PASSED] drm_test_cmdline_name_option
[19:46:14] [PASSED] drm_test_cmdline_name_bpp_option
[19:46:14] [PASSED] drm_test_cmdline_rotate_0
[19:46:14] [PASSED] drm_test_cmdline_rotate_90
[19:46:14] [PASSED] drm_test_cmdline_rotate_180
[19:46:14] [PASSED] drm_test_cmdline_rotate_270
[19:46:14] [PASSED] drm_test_cmdline_hmirror
[19:46:14] [PASSED] drm_test_cmdline_vmirror
[19:46:14] [PASSED] drm_test_cmdline_margin_options
[19:46:14] [PASSED] drm_test_cmdline_multiple_options
[19:46:14] [PASSED] drm_test_cmdline_bpp_extra_and_option
[19:46:14] [PASSED] drm_test_cmdline_extra_and_option
[19:46:14] [PASSED] drm_test_cmdline_freestanding_options
[19:46:14] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[19:46:14] [PASSED] drm_test_cmdline_panel_orientation
[19:46:14] ================ drm_test_cmdline_invalid  =================
[19:46:14] [PASSED] margin_only
[19:46:14] [PASSED] interlace_only
[19:46:14] [PASSED] res_missing_x
[19:46:14] [PASSED] res_missing_y
[19:46:14] [PASSED] res_bad_y
[19:46:14] [PASSED] res_missing_y_bpp
[19:46:14] [PASSED] res_bad_bpp
[19:46:14] [PASSED] res_bad_refresh
[19:46:14] [PASSED] res_bpp_refresh_force_on_off
[19:46:14] [PASSED] res_invalid_mode
[19:46:14] [PASSED] res_bpp_wrong_place_mode
[19:46:14] [PASSED] name_bpp_refresh
[19:46:14] [PASSED] name_refresh
[19:46:14] [PASSED] name_refresh_wrong_mode
[19:46:14] [PASSED] name_refresh_invalid_mode
[19:46:14] [PASSED] rotate_multiple
[19:46:14] [PASSED] rotate_invalid_val
[19:46:14] [PASSED] rotate_truncated
[19:46:14] [PASSED] invalid_option
[19:46:14] [PASSED] invalid_tv_option
[19:46:14] [PASSED] truncated_tv_option
[19:46:14] ============ [PASSED] drm_test_cmdline_invalid =============
[19:46:14] =============== drm_test_cmdline_tv_options  ===============
[19:46:14] [PASSED] NTSC
[19:46:14] [PASSED] NTSC_443
[19:46:14] [PASSED] NTSC_J
[19:46:14] [PASSED] PAL
[19:46:14] [PASSED] PAL_M
[19:46:14] [PASSED] PAL_N
[19:46:14] [PASSED] SECAM
[19:46:14] =========== [PASSED] drm_test_cmdline_tv_options ===========
[19:46:14] =============== [PASSED] drm_cmdline_parser ================
[19:46:14] ================ drm_get_tv_mode_from_name  ================
[19:46:14] ========== drm_test_get_tv_mode_from_name_valid  ===========
[19:46:14] [PASSED] NTSC
[19:46:14] [PASSED] NTSC-443
[19:46:14] [PASSED] NTSC-J
[19:46:14] [PASSED] PAL
[19:46:14] [PASSED] PAL-M
[19:46:14] [PASSED] PAL-N
[19:46:14] [PASSED] SECAM
[19:46:14] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[19:46:14] [PASSED] drm_test_get_tv_mode_from_name_truncated
[19:46:14] ============ [PASSED] drm_get_tv_mode_from_name ============
[19:46:14] ==================== drm_damage_helper  ====================
[19:46:14] [PASSED] drm_test_damage_iter_no_damage
[19:46:14] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[19:46:14] [PASSED] drm_test_damage_iter_no_damage_src_moved
[19:46:14] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[19:46:14] [PASSED] drm_test_damage_iter_no_damage_not_visible
[19:46:14] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[19:46:14] [PASSED] drm_test_damage_iter_no_damage_no_fb
[19:46:14] [PASSED] drm_test_damage_iter_simple_damage
[19:46:14] [PASSED] drm_test_damage_iter_single_damage
[19:46:14] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[19:46:14] [PASSED] drm_test_damage_iter_single_damage_outside_src
[19:46:14] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[19:46:14] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[19:46:14] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[19:46:14] [PASSED] drm_test_damage_iter_single_damage_src_moved
[19:46:14] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[19:46:14] [PASSED] drm_test_damage_iter_damage
[19:46:14] [PASSED] drm_test_damage_iter_damage_one_intersect
[19:46:14] [PASSED] drm_test_damage_iter_damage_one_outside
[19:46:14] [PASSED] drm_test_damage_iter_damage_src_moved
[19:46:14] [PASSED] drm_test_damage_iter_damage_not_visible
[19:46:14] ================ [PASSED] drm_damage_helper ================
[19:46:14] ==================== drm_dp_mst_helper  ====================
[19:46:14] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[19:46:14] [PASSED] Clock 154000 BPP 30 DSC disabled
[19:46:14] [PASSED] Clock 234000 BPP 30 DSC disabled
[19:46:14] [PASSED] Clock 297000 BPP 24 DSC disabled
[19:46:14] [PASSED] Clock 332880 BPP 24 DSC enabled
[19:46:14] [PASSED] Clock 324540 BPP 24 DSC enabled
[19:46:14] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[19:46:14] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[19:46:14] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[19:46:14] [PASSED] DP_POWER_UP_PHY with port number
[19:46:14] [PASSED] DP_POWER_DOWN_PHY with port number
[19:46:14] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[19:46:14] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[19:46:14] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[19:46:14] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[19:46:14] [PASSED] DP_QUERY_PAYLOAD with port number
[19:46:14] [PASSED] DP_QUERY_PAYLOAD with VCPI
[19:46:14] [PASSED] DP_REMOTE_DPCD_READ with port number
[19:46:14] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[19:46:14] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[19:46:14] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[19:46:14] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[19:46:14] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[19:46:14] [PASSED] DP_REMOTE_I2C_READ with port number
[19:46:14] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[19:46:14] [PASSED] DP_REMOTE_I2C_READ with transactions array
[19:46:14] [PASSED] DP_REMOTE_I2C_WRITE with port number
[19:46:14] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[19:46:14] [PASSED] DP_REMOTE_I2C_WRITE with data array
[19:46:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[19:46:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[19:46:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[19:46:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[19:46:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[19:46:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[19:46:14] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[19:46:14] ================ [PASSED] drm_dp_mst_helper ================
[19:46:14] ================= drm_format_helper_test  ==================
[19:46:14] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[19:46:14] [PASSED] single_pixel_source_buffer
[19:46:14] [PASSED] single_pixel_clip_rectangle
[19:46:14] [PASSED] well_known_colors
[19:46:14] [PASSED] destination_pitch
[19:46:14] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[19:46:14] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[19:46:14] [PASSED] single_pixel_source_buffer
[19:46:14] [PASSED] single_pixel_clip_rectangle
[19:46:14] [PASSED] well_known_colors
[19:46:14] [PASSED] destination_pitch
[19:46:14] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[19:46:14] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[19:46:14] [PASSED] single_pixel_source_buffer
[19:46:14] [PASSED] single_pixel_clip_rectangle
[19:46:14] [PASSED] well_known_colors
[19:46:14] [PASSED] destination_pitch
[19:46:14] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[19:46:14] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[19:46:14] [PASSED] single_pixel_source_buffer
[19:46:14] [PASSED] single_pixel_clip_rectangle
[19:46:14] [PASSED] well_known_colors
[19:46:14] [PASSED] destination_pitch
[19:46:14] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[19:46:14] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[19:46:14] [PASSED] single_pixel_source_buffer
[19:46:14] [PASSED] single_pixel_clip_rectangle
[19:46:14] [PASSED] well_known_colors
[19:46:14] [PASSED] destination_pitch
[19:46:14] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[19:46:14] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[19:46:14] [PASSED] single_pixel_source_buffer
[19:46:14] [PASSED] single_pixel_clip_rectangle
[19:46:14] [PASSED] well_known_colors
[19:46:14] [PASSED] destination_pitch
[19:46:14] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[19:46:14] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[19:46:14] [PASSED] single_pixel_source_buffer
[19:46:14] [PASSED] single_pixel_clip_rectangle
[19:46:14] [PASSED] well_known_colors
[19:46:14] [PASSED] destination_pitch
[19:46:14] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[19:46:14] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[19:46:14] [PASSED] single_pixel_source_buffer
[19:46:14] [PASSED] single_pixel_clip_rectangle
[19:46:14] [PASSED] well_known_colors
[19:46:14] [PASSED] destination_pitch
[19:46:14] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[19:46:14] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[19:46:14] [PASSED] single_pixel_source_buffer
[19:46:14] [PASSED] single_pixel_clip_rectangle
[19:46:14] [PASSED] well_known_colors
[19:46:14] [PASSED] destination_pitch
[19:46:14] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[19:46:14] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[19:46:14] [PASSED] single_pixel_source_buffer
[19:46:14] [PASSED] single_pixel_clip_rectangle
[19:46:14] [PASSED] well_known_colors
[19:46:14] [PASSED] destination_pitch
[19:46:14] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[19:46:14] ============== drm_test_fb_xrgb8888_to_mono  ===============
[19:46:14] [PASSED] single_pixel_source_buffer
[19:46:14] [PASSED] single_pixel_clip_rectangle
[19:46:14] [PASSED] well_known_colors
[19:46:14] [PASSED] destination_pitch
[19:46:14] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[19:46:14] ==================== drm_test_fb_swab  =====================
[19:46:14] [PASSED] single_pixel_source_buffer
[19:46:14] [PASSED] single_pixel_clip_rectangle
[19:46:14] [PASSED] well_known_colors
[19:46:14] [PASSED] destination_pitch
[19:46:14] ================ [PASSED] drm_test_fb_swab =================
[19:46:14] ================= drm_test_fb_clip_offset  =================
[19:46:14] [PASSED] pass through
[19:46:14] [PASSED] horizontal offset
[19:46:14] [PASSED] vertical offset
[19:46:14] [PASSED] horizontal and vertical offset
[19:46:14] [PASSED] horizontal offset (custom pitch)
[19:46:14] [PASSED] vertical offset (custom pitch)
[19:46:14] [PASSED] horizontal and vertical offset (custom pitch)
[19:46:14] ============= [PASSED] drm_test_fb_clip_offset =============
[19:46:14] ============== drm_test_fb_build_fourcc_list  ==============
[19:46:14] [PASSED] no native formats
[19:46:14] [PASSED] XRGB8888 as native format
[19:46:14] [PASSED] remove duplicates
[19:46:14] [PASSED] convert alpha formats
[19:46:14] [PASSED] random formats
[19:46:14] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[19:46:14] =================== drm_test_fb_memcpy  ====================
[19:46:14] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[19:46:14] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[19:46:14] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[19:46:14] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[19:46:14] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[19:46:14] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[19:46:14] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[19:46:14] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[19:46:14] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[19:46:14] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[19:46:14] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[19:46:14] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[19:46:14] =============== [PASSED] drm_test_fb_memcpy ================
[19:46:14] ============= [PASSED] drm_format_helper_test ==============
[19:46:14] ======================= drm_format  ========================
[19:46:14] [PASSED] drm_test_format_block_width_invalid
[19:46:14] [PASSED] drm_test_format_block_width_one_plane
[19:46:14] [PASSED] drm_test_format_block_width_two_plane
[19:46:14] [PASSED] drm_test_format_block_width_three_plane
[19:46:14] [PASSED] drm_test_format_block_width_tiled
[19:46:14] [PASSED] drm_test_format_block_height_invalid
[19:46:14] [PASSED] drm_test_format_block_height_one_plane
[19:46:14] [PASSED] drm_test_format_block_height_two_plane
[19:46:14] [PASSED] drm_test_format_block_height_three_plane
[19:46:14] [PASSED] drm_test_format_block_height_tiled
[19:46:14] [PASSED] drm_test_format_min_pitch_invalid
[19:46:14] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[19:46:14] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[19:46:14] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[19:46:14] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[19:46:14] [PASSED] drm_test_format_min_pitch_two_plane
[19:46:14] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[19:46:14] [PASSED] drm_test_format_min_pitch_tiled
[19:46:14] =================== [PASSED] drm_format ====================
[19:46:14] ===================== drm_framebuffer  =====================
[19:46:14] =============== drm_test_framebuffer_create  ===============
[19:46:14] [PASSED] ABGR8888 normal sizes
[19:46:14] [PASSED] ABGR8888 max sizes
[19:46:14] [PASSED] ABGR8888 pitch greater than min required
[19:46:14] [PASSED] ABGR8888 pitch less than min required
[19:46:14] [PASSED] ABGR8888 Invalid width
[19:46:14] [PASSED] ABGR8888 Invalid buffer handle
[19:46:14] [PASSED] No pixel format
[19:46:14] [PASSED] ABGR8888 Width 0
[19:46:14] [PASSED] ABGR8888 Height 0
[19:46:14] [PASSED] ABGR8888 Out of bound height * pitch combination
[19:46:14] [PASSED] ABGR8888 Large buffer offset
[19:46:14] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[19:46:14] [PASSED] ABGR8888 Valid buffer modifier
[19:46:14] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[19:46:14] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[19:46:14] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[19:46:14] [PASSED] NV12 Normal sizes
[19:46:14] [PASSED] NV12 Max sizes
[19:46:14] [PASSED] NV12 Invalid pitch
[19:46:14] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[19:46:14] [PASSED] NV12 different  modifier per-plane
[19:46:14] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[19:46:14] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[19:46:14] [PASSED] NV12 Modifier for inexistent plane
[19:46:14] [PASSED] NV12 Handle for inexistent plane
[19:46:14] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[19:46:14] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[19:46:14] [PASSED] YVU420 Normal sizes
[19:46:14] [PASSED] YVU420 Max sizes
[19:46:14] [PASSED] YVU420 Invalid pitch
[19:46:14] [PASSED] YVU420 Different pitches
[19:46:14] [PASSED] YVU420 Different buffer offsets/pitches
[19:46:14] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[19:46:14] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[19:46:14] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[19:46:14] [PASSED] YVU420 Valid modifier
[19:46:14] [PASSED] YVU420 Different modifiers per plane
[19:46:14] [PASSED] YVU420 Modifier for inexistent plane
[19:46:14] [PASSED] X0L2 Normal sizes
[19:46:14] [PASSED] X0L2 Max sizes
[19:46:14] [PASSED] X0L2 Invalid pitch
[19:46:14] [PASSED] X0L2 Pitch greater than minimum required
[19:46:14] [PASSED] X0L2 Handle for inexistent plane
[19:46:14] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[19:46:14] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[19:46:14] [PASSED] X0L2 Valid modifier
[19:46:14] [PASSED] X0L2 Modifier for inexistent plane
[19:46:14] =========== [PASSED] drm_test_framebuffer_create ===========
[19:46:14] ================= [PASSED] drm_framebuffer =================
[19:46:14] ==================== drm-test-managed  =====================
[19:46:14] [PASSED] drm_test_managed_run_action
[19:46:14] ================ [PASSED] drm-test-managed =================
[19:46:14] ========================= drm_mm  ==========================
[19:46:14] [PASSED] drm_test_mm_init
[19:46:14] [PASSED] drm_test_mm_debug
[19:46:24] [PASSED] drm_test_mm_reserve
[19:46:34] [PASSED] drm_test_mm_insert
[19:46:35] [PASSED] drm_test_mm_replace
[19:46:35] [PASSED] drm_test_mm_insert_range
[19:46:35] [PASSED] drm_test_mm_frag
[19:46:35] [PASSED] drm_test_mm_align
[19:46:35] [PASSED] drm_test_mm_align32
[19:46:36] [PASSED] drm_test_mm_align64
[19:46:36] [PASSED] drm_test_mm_evict
[19:46:36] [PASSED] drm_test_mm_evict_range
[19:46:36] [PASSED] drm_test_mm_topdown
[19:46:36] [PASSED] drm_test_mm_bottomup
[19:46:36] [PASSED] drm_test_mm_lowest
[19:46:36] [PASSED] drm_test_mm_highest
[19:46:37] [PASSED] drm_test_mm_color
[19:46:37] [PASSED] drm_test_mm_color_evict
[19:46:37] [PASSED] drm_test_mm_color_evict_range
[19:46:37] ===================== [PASSED] drm_mm ======================
[19:46:37] =================== drm_modes_analog_tv  ===================
[19:46:37] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[19:46:37] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[19:46:37] [PASSED] drm_test_modes_analog_tv_pal_576i
[19:46:37] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[19:46:37] =============== [PASSED] drm_modes_analog_tv ===============
[19:46:37] ==================== drm_plane_helper  =====================
[19:46:37] =============== drm_test_check_plane_state  ================
[19:46:37] [PASSED] clipping_simple
[19:46:37] [PASSED] clipping_rotate_reflect
[19:46:37] [PASSED] positioning_simple
[19:46:37] [PASSED] upscaling
[19:46:37] [PASSED] downscaling
[19:46:37] [PASSED] rounding1
[19:46:37] [PASSED] rounding2
[19:46:37] [PASSED] rounding3
[19:46:37] [PASSED] rounding4
[19:46:37] =========== [PASSED] drm_test_check_plane_state ============
[19:46:37] =========== drm_test_check_invalid_plane_state  ============
[19:46:37] [PASSED] positioning_invalid
[19:46:37] [PASSED] upscaling_invalid
[19:46:37] [PASSED] downscaling_invalid
[19:46:37] ======= [PASSED] drm_test_check_invalid_plane_state ========
[19:46:37] ================ [PASSED] drm_plane_helper =================
[19:46:37] ============ drm_connector_helper_tv_get_modes  ============
[19:46:37] ====== drm_test_connector_helper_tv_get_modes_check  =======
[19:46:37] [PASSED] None
[19:46:37] [PASSED] PAL
[19:46:37] [PASSED] NTSC
[19:46:37] [PASSED] Both, NTSC Default
[19:46:37] [PASSED] Both, PAL Default
[19:46:37] [PASSED] Both, NTSC Default, with PAL on command-line
[19:46:37] [PASSED] Both, PAL Default, with NTSC on command-line
[19:46:37] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[19:46:37] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[19:46:37] ======================== drm_rect  =========================
[19:46:37] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[19:46:37] [PASSED] drm_test_rect_clip_scaled_not_clipped
[19:46:37] [PASSED] drm_test_rect_clip_scaled_clipped
[19:46:37] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[19:46:37] ================= drm_test_rect_intersect  =================
[19:46:37] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[19:46:37] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[19:46:37] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[19:46:37] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[19:46:37] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[19:46:37] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[19:46:37] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[19:46:37] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[19:46:37] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[19:46:37] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[19:46:37] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[19:46:37] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[19:46:37] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[19:46:37] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[19:46:37] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[19:46:37] ============= [PASSED] drm_test_rect_intersect =============
[19:46:37] ================ drm_test_rect_calc_hscale  ================
[19:46:37] [PASSED] normal use
[19:46:37] [PASSED] out of max range
[19:46:37] [PASSED] out of min range
[19:46:37] [PASSED] zero dst
[19:46:37] [PASSED] negative src
[19:46:37] [PASSED] negative dst
[19:46:37] ============ [PASSED] drm_test_rect_calc_hscale ============
[19:46:37] ================ drm_test_rect_calc_vscale  ================
[19:46:37] [PASSED] normal use
[19:46:37] [PASSED] out of max range
[19:46:37] [PASSED] out of min range
[19:46:37] [PASSED] zero dst
[19:46:37] [PASSED] negative src
[19:46:37] [PASSED] negative dst
[19:46:37] ============ [PASSED] drm_test_rect_calc_vscale ============
[19:46:37] ================== drm_test_rect_rotate  ===================
[19:46:37] [PASSED] reflect-x
[19:46:37] [PASSED] reflect-y
[19:46:37] [PASSED] rotate-0
[19:46:37] [PASSED] rotate-90
[19:46:37] [PASSED] rotate-180
[19:46:37] [PASSED] rotate-270
[19:46:37] ============== [PASSED] drm_test_rect_rotate ===============
[19:46:37] ================ drm_test_rect_rotate_inv  =================
[19:46:37] [PASSED] reflect-x
[19:46:37] [PASSED] reflect-y
[19:46:37] [PASSED] rotate-0
[19:46:37] [PASSED] rotate-90
[19:46:37] [PASSED] rotate-180
[19:46:37] [PASSED] rotate-270
[19:46:37] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[19:46:37] ==================== [PASSED] drm_rect =====================
[19:46:37] ======================== drm_exec  =========================
[19:46:37] [PASSED] sanitycheck
[19:46:37] [PASSED] test_lock
[19:46:37] [PASSED] test_lock_unlock
[19:46:37] [PASSED] test_duplicates
[19:46:37] [PASSED] test_prepare
[19:46:37] [PASSED] test_prepare_array
[19:46:37] [PASSED] test_multiple_loops
[19:46:37] ==================== [PASSED] drm_exec =====================
[19:46:37] ============================================================
[19:46:37] Testing complete. Ran 368 tests: passed: 368
[19:46:37] Elapsed time: 44.424s total, 1.671s configuring, 19.374s building, 23.354s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


