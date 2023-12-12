Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D170C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 04:32:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F094410E06C;
	Tue, 12 Dec 2023 04:32:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B0D6110E06C;
 Tue, 12 Dec 2023 04:32:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A4352AA915;
 Tue, 12 Dec 2023 04:32:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_series_starting_with_=5B1/2=5D?=
 =?utf-8?q?_fixup!_fixup!_drm/xe=3A_Introduce_a_new_DRM_driver_for_Intel_GPU?=
 =?utf-8?q?s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Tue, 12 Dec 2023 04:32:49 -0000
Message-ID: <170235556966.31292.18361932215894445459@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231212031907.1120896-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231212031907.1120896-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/2] fixup! fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
URL   : https://patchwork.freedesktop.org/series/127661/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[04:31:38] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:31:42] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[04:32:02] Starting KUnit Kernel (1/1)...
[04:32:02] ============================================================
[04:32:02] ========================== lmtt  ===========================
[04:32:02] ======================== test_ops  =========================
[04:32:02] [PASSED] 2-level
[04:32:02] [PASSED] multi-level
[04:32:02] ==================== [PASSED] test_ops =====================
[04:32:02] ====================== [PASSED] lmtt =======================
[04:32:02] ========================== xe_bo  ==========================
[04:32:02] [SKIPPED] xe_ccs_migrate_kunit
[04:32:02] [SKIPPED] xe_bo_evict_kunit
[04:32:02] ===================== [SKIPPED] xe_bo ======================
[04:32:02] ======================= xe_dma_buf  ========================
[04:32:02] [SKIPPED] xe_dma_buf_kunit
[04:32:02] =================== [SKIPPED] xe_dma_buf ===================
[04:32:02] ======================= xe_migrate  ========================
[04:32:02] [SKIPPED] xe_migrate_sanity_kunit
[04:32:02] =================== [SKIPPED] xe_migrate ===================
[04:32:02] ========================= xe_mocs  =========================
[04:32:02] [SKIPPED] xe_live_mocs_kernel_kunit
[04:32:02] ==================== [SKIPPED] xe_mocs =====================
[04:32:02] ========================= xe_pci  ==========================
[04:32:02] [PASSED] xe_gmdid_graphics_ip
[04:32:02] [PASSED] xe_gmdid_media_ip
[04:32:02] ===================== [PASSED] xe_pci ======================
[04:32:02] ========================= xe_rtp  ==========================
[04:32:02] ================== xe_rtp_process_tests  ===================
[04:32:02] [PASSED] coalesce-same-reg
[04:32:02] [PASSED] no-match-no-add
[04:32:02] [PASSED] no-match-no-add-multiple-rules
[04:32:02] [PASSED] two-regs-two-entries
[04:32:02] [PASSED] clr-one-set-other
[04:32:02] [PASSED] set-field
[04:32:02] [PASSED] conflict-duplicate
[04:32:02] [PASSED] conflict-not-disjoint
[04:32:02] [PASSED] conflict-reg-type
[04:32:02] ============== [PASSED] xe_rtp_process_tests ===============
[04:32:02] ===================== [PASSED] xe_rtp ======================
[04:32:02] ========================== xe_wa  ==========================
[04:32:02] ======================== xe_wa_gt  =========================
[04:32:02] [PASSED] TIGERLAKE (B0)
[04:32:02] [PASSED] DG1 (A0)
[04:32:02] [PASSED] DG1 (B0)
[04:32:02] [PASSED] ALDERLAKE_S (A0)
[04:32:02] [PASSED] ALDERLAKE_S (B0)
[04:32:02] [PASSED] ALDERLAKE_S (C0)
[04:32:02] [PASSED] ALDERLAKE_S (D0)
[04:32:02] [PASSED] ALDERLAKE_P (A0)
[04:32:02] [PASSED] ALDERLAKE_P (B0)
[04:32:02] [PASSED] ALDERLAKE_P (C0)
[04:32:02] [PASSED] ALDERLAKE_S_RPLS (D0)
[04:32:02] [PASSED] ALDERLAKE_P_RPLU (E0)
[04:32:02] [PASSED] DG2_G10 (A0)
[04:32:02] [PASSED] DG2_G10 (A1)
[04:32:02] [PASSED] DG2_G10 (B0)
[04:32:02] [PASSED] DG2_G10 (C0)
[04:32:02] [PASSED] DG2_G11 (A0)
[04:32:02] [PASSED] DG2_G11 (B0)
[04:32:02] [PASSED] DG2_G11 (B1)
[04:32:02] [PASSED] DG2_G12 (A0)
[04:32:02] [PASSED] DG2_G12 (A1)
[04:32:02] [PASSED] PVC (B0)
[04:32:02] [PASSED] PVC (B1)
[04:32:02] [PASSED] PVC (C0)
[04:32:02] [PASSED] METEORLAKE (g:A0, m:A0)
[04:32:02] [PASSED] METEORLAKE (g:A0, m:A0)
[04:32:02] [PASSED] LUNARLAKE (g:A0, m:A0)
[04:32:02] [PASSED] LUNARLAKE (g:B0, m:A0)
[04:32:02] ==================== [PASSED] xe_wa_gt =====================
[04:32:02] ====================== [PASSED] xe_wa ======================
[04:32:02] ============================================================
[04:32:02] Testing complete. Ran 46 tests: passed: 41, skipped: 5
[04:32:02] Elapsed time: 24.612s total, 4.176s configuring, 20.316s building, 0.100s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[04:32:02] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:32:04] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[04:32:23] Starting KUnit Kernel (1/1)...
[04:32:23] ============================================================
[04:32:23] ================== drm_test_pick_cmdline  ==================
[04:32:23] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[04:32:23] =============== drm_test_pick_cmdline_named  ===============
[04:32:23] [PASSED] NTSC
[04:32:23] [PASSED] NTSC-J
[04:32:23] [PASSED] PAL
[04:32:23] [PASSED] PAL-M
[04:32:23] =========== [PASSED] drm_test_pick_cmdline_named ===========
[04:32:23] ============== [PASSED] drm_test_pick_cmdline ==============
[04:32:23] ======================== drm_buddy  ========================
[04:32:23] [PASSED] drm_test_buddy_alloc_limit
[04:32:23] [PASSED] drm_test_buddy_alloc_range
[04:32:23] [PASSED] drm_test_buddy_alloc_optimistic
[04:32:23] [PASSED] drm_test_buddy_alloc_pessimistic
[04:32:23] [PASSED] drm_test_buddy_alloc_smoke
[04:32:23] [PASSED] drm_test_buddy_alloc_pathological
[04:32:23] ==================== [PASSED] drm_buddy ====================
[04:32:23] =================== drm_cmdline_parser  ====================
[04:32:23] [PASSED] drm_test_cmdline_force_d_only
[04:32:23] [PASSED] drm_test_cmdline_force_D_only_dvi
[04:32:23] [PASSED] drm_test_cmdline_force_D_only_hdmi
[04:32:23] [PASSED] drm_test_cmdline_force_D_only_not_digital
[04:32:23] [PASSED] drm_test_cmdline_force_e_only
[04:32:23] [PASSED] drm_test_cmdline_res
[04:32:23] [PASSED] drm_test_cmdline_res_vesa
[04:32:23] [PASSED] drm_test_cmdline_res_vesa_rblank
[04:32:23] [PASSED] drm_test_cmdline_res_rblank
[04:32:23] [PASSED] drm_test_cmdline_res_bpp
[04:32:23] [PASSED] drm_test_cmdline_res_refresh
[04:32:23] [PASSED] drm_test_cmdline_res_bpp_refresh
[04:32:23] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[04:32:23] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[04:32:23] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[04:32:23] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[04:32:23] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[04:32:23] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[04:32:23] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[04:32:23] [PASSED] drm_test_cmdline_res_margins_force_on
[04:32:23] [PASSED] drm_test_cmdline_res_vesa_margins
[04:32:23] [PASSED] drm_test_cmdline_name
[04:32:23] [PASSED] drm_test_cmdline_name_bpp
[04:32:23] [PASSED] drm_test_cmdline_name_option
[04:32:23] [PASSED] drm_test_cmdline_name_bpp_option
[04:32:23] [PASSED] drm_test_cmdline_rotate_0
[04:32:23] [PASSED] drm_test_cmdline_rotate_90
[04:32:23] [PASSED] drm_test_cmdline_rotate_180
[04:32:23] [PASSED] drm_test_cmdline_rotate_270
[04:32:23] [PASSED] drm_test_cmdline_hmirror
[04:32:23] [PASSED] drm_test_cmdline_vmirror
[04:32:23] [PASSED] drm_test_cmdline_margin_options
[04:32:23] [PASSED] drm_test_cmdline_multiple_options
[04:32:23] [PASSED] drm_test_cmdline_bpp_extra_and_option
[04:32:23] [PASSED] drm_test_cmdline_extra_and_option
[04:32:23] [PASSED] drm_test_cmdline_freestanding_options
[04:32:23] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[04:32:23] [PASSED] drm_test_cmdline_panel_orientation
[04:32:23] ================ drm_test_cmdline_invalid  =================
[04:32:23] [PASSED] margin_only
[04:32:23] [PASSED] interlace_only
[04:32:23] [PASSED] res_missing_x
[04:32:23] [PASSED] res_missing_y
[04:32:23] [PASSED] res_bad_y
[04:32:23] [PASSED] res_missing_y_bpp
[04:32:23] [PASSED] res_bad_bpp
[04:32:23] [PASSED] res_bad_refresh
[04:32:23] [PASSED] res_bpp_refresh_force_on_off
[04:32:23] [PASSED] res_invalid_mode
[04:32:23] [PASSED] res_bpp_wrong_place_mode
[04:32:23] [PASSED] name_bpp_refresh
[04:32:23] [PASSED] name_refresh
[04:32:23] [PASSED] name_refresh_wrong_mode
[04:32:23] [PASSED] name_refresh_invalid_mode
[04:32:23] [PASSED] rotate_multiple
[04:32:23] [PASSED] rotate_invalid_val
[04:32:23] [PASSED] rotate_truncated
[04:32:23] [PASSED] invalid_option
[04:32:23] [PASSED] invalid_tv_option
[04:32:23] [PASSED] truncated_tv_option
[04:32:23] ============ [PASSED] drm_test_cmdline_invalid =============
[04:32:23] =============== drm_test_cmdline_tv_options  ===============
[04:32:23] [PASSED] NTSC
[04:32:23] [PASSED] NTSC_443
[04:32:23] [PASSED] NTSC_J
[04:32:23] [PASSED] PAL
[04:32:23] [PASSED] PAL_M
[04:32:23] [PASSED] PAL_N
[04:32:23] [PASSED] SECAM
[04:32:23] =========== [PASSED] drm_test_cmdline_tv_options ===========
[04:32:23] =============== [PASSED] drm_cmdline_parser ================
[04:32:23] ================ drm_get_tv_mode_from_name  ================
[04:32:23] ========== drm_test_get_tv_mode_from_name_valid  ===========
[04:32:23] [PASSED] NTSC
[04:32:23] [PASSED] NTSC-443
[04:32:23] [PASSED] NTSC-J
[04:32:23] [PASSED] PAL
[04:32:23] [PASSED] PAL-M
[04:32:23] [PASSED] PAL-N
[04:32:23] [PASSED] SECAM
[04:32:23] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[04:32:23] [PASSED] drm_test_get_tv_mode_from_name_truncated
[04:32:23] ============ [PASSED] drm_get_tv_mode_from_name ============
[04:32:23] ==================== drm_damage_helper  ====================
[04:32:23] [PASSED] drm_test_damage_iter_no_damage
[04:32:23] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[04:32:23] [PASSED] drm_test_damage_iter_no_damage_src_moved
[04:32:23] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[04:32:23] [PASSED] drm_test_damage_iter_no_damage_not_visible
[04:32:23] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[04:32:23] [PASSED] drm_test_damage_iter_no_damage_no_fb
[04:32:23] [PASSED] drm_test_damage_iter_simple_damage
[04:32:23] [PASSED] drm_test_damage_iter_single_damage
[04:32:23] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[04:32:23] [PASSED] drm_test_damage_iter_single_damage_outside_src
[04:32:23] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[04:32:23] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[04:32:23] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[04:32:23] [PASSED] drm_test_damage_iter_single_damage_src_moved
[04:32:23] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[04:32:23] [PASSED] drm_test_damage_iter_damage
[04:32:23] [PASSED] drm_test_damage_iter_damage_one_intersect
[04:32:23] [PASSED] drm_test_damage_iter_damage_one_outside
[04:32:23] [PASSED] drm_test_damage_iter_damage_src_moved
[04:32:23] [PASSED] drm_test_damage_iter_damage_not_visible
[04:32:23] ================ [PASSED] drm_damage_helper ================
[04:32:23] ==================== drm_dp_mst_helper  ====================
[04:32:23] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[04:32:23] [PASSED] Clock 154000 BPP 30 DSC disabled
[04:32:23] [PASSED] Clock 234000 BPP 30 DSC disabled
[04:32:23] [PASSED] Clock 297000 BPP 24 DSC disabled
[04:32:23] [PASSED] Clock 332880 BPP 24 DSC enabled
[04:32:23] [PASSED] Clock 324540 BPP 24 DSC enabled
[04:32:23] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[04:32:23] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[04:32:23] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[04:32:23] [PASSED] DP_POWER_UP_PHY with port number
[04:32:23] [PASSED] DP_POWER_DOWN_PHY with port number
[04:32:23] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[04:32:23] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[04:32:23] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[04:32:23] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[04:32:23] [PASSED] DP_QUERY_PAYLOAD with port number
[04:32:23] [PASSED] DP_QUERY_PAYLOAD with VCPI
[04:32:23] [PASSED] DP_REMOTE_DPCD_READ with port number
[04:32:23] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[04:32:23] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[04:32:23] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[04:32:23] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[04:32:23] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[04:32:23] [PASSED] DP_REMOTE_I2C_READ with port number
[04:32:23] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[04:32:23] [PASSED] DP_REMOTE_I2C_READ with transactions array
[04:32:23] [PASSED] DP_REMOTE_I2C_WRITE with port number
[04:32:23] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[04:32:23] [PASSED] DP_REMOTE_I2C_WRITE with data array
[04:32:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[04:32:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[04:32:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[04:32:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[04:32:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[04:32:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[04:32:23] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[04:32:23] ================ [PASSED] drm_dp_mst_helper ================
[04:32:23] ================= drm_format_helper_test  ==================
[04:32:23] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[04:32:23] [PASSED] single_pixel_source_buffer
[04:32:23] [PASSED] single_pixel_clip_rectangle
[04:32:23] [PASSED] well_known_colors
[04:32:23] [PASSED] destination_pitch
[04:32:23] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[04:32:23] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[04:32:23] [PASSED] single_pixel_source_buffer
[04:32:23] [PASSED] single_pixel_clip_rectangle
[04:32:23] [PASSED] well_known_colors
[04:32:23] [PASSED] destination_pitch
[04:32:23] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[04:32:23] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[04:32:23] [PASSED] single_pixel_source_buffer
[04:32:23] [PASSED] single_pixel_clip_rectangle
[04:32:23] [PASSED] well_known_colors
[04:32:23] [PASSED] destination_pitch
[04:32:23] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[04:32:23] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[04:32:23] [PASSED] single_pixel_source_buffer
[04:32:23] [PASSED] single_pixel_clip_rectangle
[04:32:23] [PASSED] well_known_colors
[04:32:23] [PASSED] destination_pitch
[04:32:23] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[04:32:23] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[04:32:23] [PASSED] single_pixel_source_buffer
[04:32:23] [PASSED] single_pixel_clip_rectangle
[04:32:23] [PASSED] well_known_colors
[04:32:23] [PASSED] destination_pitch
[04:32:23] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[04:32:23] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[04:32:23] [PASSED] single_pixel_source_buffer
[04:32:23] [PASSED] single_pixel_clip_rectangle
[04:32:23] [PASSED] well_known_colors
[04:32:23] [PASSED] destination_pitch
[04:32:23] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[04:32:23] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[04:32:23] [PASSED] single_pixel_source_buffer
[04:32:23] [PASSED] single_pixel_clip_rectangle
[04:32:23] [PASSED] well_known_colors
[04:32:23] [PASSED] destination_pitch
[04:32:23] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[04:32:23] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[04:32:23] [PASSED] single_pixel_source_buffer
[04:32:23] [PASSED] single_pixel_clip_rectangle
[04:32:23] [PASSED] well_known_colors
[04:32:23] [PASSED] destination_pitch
[04:32:23] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[04:32:23] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[04:32:23] [PASSED] single_pixel_source_buffer
[04:32:23] [PASSED] single_pixel_clip_rectangle
[04:32:23] [PASSED] well_known_colors
[04:32:23] [PASSED] destination_pitch
[04:32:23] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[04:32:23] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[04:32:23] [PASSED] single_pixel_source_buffer
[04:32:23] [PASSED] single_pixel_clip_rectangle
[04:32:23] [PASSED] well_known_colors
[04:32:23] [PASSED] destination_pitch
[04:32:23] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[04:32:23] ============== drm_test_fb_xrgb8888_to_mono  ===============
[04:32:23] [PASSED] single_pixel_source_buffer
[04:32:23] [PASSED] single_pixel_clip_rectangle
[04:32:23] [PASSED] well_known_colors
[04:32:23] [PASSED] destination_pitch
[04:32:23] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[04:32:23] ==================== drm_test_fb_swab  =====================
[04:32:23] [PASSED] single_pixel_source_buffer
[04:32:23] [PASSED] single_pixel_clip_rectangle
[04:32:23] [PASSED] well_known_colors
[04:32:23] [PASSED] destination_pitch
[04:32:23] ================ [PASSED] drm_test_fb_swab =================
[04:32:23] ================= drm_test_fb_clip_offset  =================
[04:32:23] [PASSED] pass through
[04:32:23] [PASSED] horizontal offset
[04:32:23] [PASSED] vertical offset
[04:32:23] [PASSED] horizontal and vertical offset
[04:32:23] [PASSED] horizontal offset (custom pitch)
[04:32:23] [PASSED] vertical offset (custom pitch)
[04:32:23] [PASSED] horizontal and vertical offset (custom pitch)
[04:32:23] ============= [PASSED] drm_test_fb_clip_offset =============
[04:32:23] ============== drm_test_fb_build_fourcc_list  ==============
[04:32:23] [PASSED] no native formats
[04:32:23] [PASSED] XRGB8888 as native format
[04:32:23] [PASSED] remove duplicates
[04:32:23] [PASSED] convert alpha formats
[04:32:23] [PASSED] random formats
[04:32:23] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[04:32:23] =================== drm_test_fb_memcpy  ====================
[04:32:23] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[04:32:23] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[04:32:23] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[04:32:23] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[04:32:23] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[04:32:23] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[04:32:23] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[04:32:23] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[04:32:23] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[04:32:23] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[04:32:23] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[04:32:23] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[04:32:23] =============== [PASSED] drm_test_fb_memcpy ================
[04:32:23] ============= [PASSED] drm_format_helper_test ==============
[04:32:23] ======================= drm_format  ========================
[04:32:23] [PASSED] drm_test_format_block_width_invalid
[04:32:23] [PASSED] drm_test_format_block_width_one_plane
[04:32:23] [PASSED] drm_test_format_block_width_two_plane
[04:32:23] [PASSED] drm_test_format_block_width_three_plane
[04:32:23] [PASSED] drm_test_format_block_width_tiled
[04:32:23] [PASSED] drm_test_format_block_height_invalid
[04:32:23] [PASSED] drm_test_format_block_height_one_plane
[04:32:23] [PASSED] drm_test_format_block_height_two_plane
[04:32:23] [PASSED] drm_test_format_block_height_three_plane
[04:32:23] [PASSED] drm_test_format_block_height_tiled
[04:32:23] [PASSED] drm_test_format_min_pitch_invalid
[04:32:23] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[04:32:23] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[04:32:23] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[04:32:23] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[04:32:23] [PASSED] drm_test_format_min_pitch_two_plane
[04:32:23] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[04:32:23] [PASSED] drm_test_format_min_pitch_tiled
[04:32:23] =================== [PASSED] drm_format ====================
[04:32:23] ===================== drm_framebuffer  =====================
[04:32:23] =============== drm_test_framebuffer_create  ===============
[04:32:23] [PASSED] ABGR8888 normal sizes
[04:32:23] [PASSED] ABGR8888 max sizes
[04:32:23] [PASSED] ABGR8888 pitch greater than min required
[04:32:23] [PASSED] ABGR8888 pitch less than min required
[04:32:23] [PASSED] ABGR8888 Invalid width
[04:32:23] [PASSED] ABGR8888 Invalid buffer handle
[04:32:23] [PASSED] No pixel format
[04:32:23] [PASSED] ABGR8888 Width 0
[04:32:23] [PASSED] ABGR8888 Height 0
[04:32:23] [PASSED] ABGR8888 Out of bound height * pitch combination
[04:32:23] [PASSED] ABGR8888 Large buffer offset
[04:32:23] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[04:32:23] [PASSED] ABGR8888 Valid buffer modifier
[04:32:23] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[04:32:23] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[04:32:23] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[04:32:23] [PASSED] NV12 Normal sizes
[04:32:23] [PASSED] NV12 Max sizes
[04:32:23] [PASSED] NV12 Invalid pitch
[04:32:23] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[04:32:23] [PASSED] NV12 different  modifier per-plane
[04:32:23] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[04:32:23] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[04:32:23] [PASSED] NV12 Modifier for inexistent plane
[04:32:23] [PASSED] NV12 Handle for inexistent plane
[04:32:23] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[04:32:23] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[04:32:23] [PASSED] YVU420 Normal sizes
[04:32:23] [PASSED] YVU420 Max sizes
[04:32:23] [PASSED] YVU420 Invalid pitch
[04:32:23] [PASSED] YVU420 Different pitches
[04:32:23] [PASSED] YVU420 Different buffer offsets/pitches
[04:32:23] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[04:32:23] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[04:32:23] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[04:32:23] [PASSED] YVU420 Valid modifier
[04:32:23] [PASSED] YVU420 Different modifiers per plane
[04:32:23] [PASSED] YVU420 Modifier for inexistent plane
[04:32:23] [PASSED] X0L2 Normal sizes
[04:32:23] [PASSED] X0L2 Max sizes
[04:32:23] [PASSED] X0L2 Invalid pitch
[04:32:23] [PASSED] X0L2 Pitch greater than minimum required
[04:32:23] [PASSED] X0L2 Handle for inexistent plane
[04:32:23] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[04:32:23] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[04:32:23] [PASSED] X0L2 Valid modifier
[04:32:23] [PASSED] X0L2 Modifier for inexistent plane
[04:32:23] =========== [PASSED] drm_test_framebuffer_create ===========
[04:32:23] ================= [PASSED] drm_framebuffer =================
[04:32:23] ==================== drm-test-managed  =====================
[04:32:23] [PASSED] drm_test_managed_run_action
[04:32:23] ================ [PASSED] drm-test-managed =================
[04:32:23] ========================= drm_mm  ==========================
[04:32:23] [PASSED] drm_test_mm_init
[04:32:23] [PASSED] drm_test_mm_debug
[04:32:33] [PASSED] drm_test_mm_reserve
[04:32:44] [PASSED] drm_test_mm_insert
[04:32:44] [PASSED] drm_test_mm_replace
[04:32:44] [PASSED] drm_test_mm_insert_range
[04:32:44] [PASSED] drm_test_mm_frag
[04:32:44] [PASSED] drm_test_mm_align
[04:32:44] [PASSED] drm_test_mm_align32
[04:32:45] [PASSED] drm_test_mm_align64
[04:32:45] [PASSED] drm_test_mm_evict
[04:32:45] [PASSED] drm_test_mm_evict_range
[04:32:45] [PASSED] drm_test_mm_topdown
[04:32:45] [PASSED] drm_test_mm_bottomup
[04:32:45] [PASSED] drm_test_mm_lowest
[04:32:45] [PASSED] drm_test_mm_highest
[04:32:46] [PASSED] drm_test_mm_color
[04:32:46] [PASSED] drm_test_mm_color_evict
[04:32:46] [PASSED] drm_test_mm_color_evict_range
[04:32:46] ===================== [PASSED] drm_mm ======================
[04:32:46] =================== drm_modes_analog_tv  ===================
[04:32:46] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[04:32:46] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[04:32:46] [PASSED] drm_test_modes_analog_tv_pal_576i
[04:32:46] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[04:32:46] =============== [PASSED] drm_modes_analog_tv ===============
[04:32:46] ==================== drm_plane_helper  =====================
[04:32:46] =============== drm_test_check_plane_state  ================
[04:32:46] [PASSED] clipping_simple
[04:32:46] [PASSED] clipping_rotate_reflect
[04:32:46] [PASSED] positioning_simple
[04:32:46] [PASSED] upscaling
[04:32:46] [PASSED] downscaling
[04:32:46] [PASSED] rounding1
[04:32:46] [PASSED] rounding2
[04:32:46] [PASSED] rounding3
[04:32:46] [PASSED] rounding4
[04:32:46] =========== [PASSED] drm_test_check_plane_state ============
[04:32:46] =========== drm_test_check_invalid_plane_state  ============
[04:32:46] [PASSED] positioning_invalid
[04:32:46] [PASSED] upscaling_invalid
[04:32:46] [PASSED] downscaling_invalid
[04:32:46] ======= [PASSED] drm_test_check_invalid_plane_state ========
[04:32:46] ================ [PASSED] drm_plane_helper =================
[04:32:46] ============ drm_connector_helper_tv_get_modes  ============
[04:32:46] ====== drm_test_connector_helper_tv_get_modes_check  =======
[04:32:46] [PASSED] None
[04:32:46] [PASSED] PAL
[04:32:46] [PASSED] NTSC
[04:32:46] [PASSED] Both, NTSC Default
[04:32:46] [PASSED] Both, PAL Default
[04:32:46] [PASSED] Both, NTSC Default, with PAL on command-line
[04:32:46] [PASSED] Both, PAL Default, with NTSC on command-line
[04:32:46] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[04:32:46] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[04:32:46] ======================== drm_rect  =========================
[04:32:46] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[04:32:46] [PASSED] drm_test_rect_clip_scaled_not_clipped
[04:32:46] [PASSED] drm_test_rect_clip_scaled_clipped
[04:32:46] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[04:32:46] ================= drm_test_rect_intersect  =================
[04:32:46] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[04:32:46] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[04:32:46] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[04:32:46] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[04:32:46] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[04:32:46] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[04:32:46] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[04:32:46] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[04:32:46] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[04:32:46] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[04:32:46] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[04:32:46] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[04:32:46] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[04:32:46] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[04:32:46] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[04:32:46] ============= [PASSED] drm_test_rect_intersect =============
[04:32:46] ================ drm_test_rect_calc_hscale  ================
[04:32:46] [PASSED] normal use
[04:32:46] [PASSED] out of max range
[04:32:46] [PASSED] out of min range
[04:32:46] [PASSED] zero dst
[04:32:46] [PASSED] negative src
[04:32:46] [PASSED] negative dst
[04:32:46] ============ [PASSED] drm_test_rect_calc_hscale ============
[04:32:46] ================ drm_test_rect_calc_vscale  ================
[04:32:46] [PASSED] normal use
[04:32:46] [PASSED] out of max range
[04:32:46] [PASSED] out of min range
[04:32:46] [PASSED] zero dst
[04:32:46] [PASSED] negative src
[04:32:46] [PASSED] negative dst
[04:32:46] ============ [PASSED] drm_test_rect_calc_vscale ============
[04:32:46] ================== drm_test_rect_rotate  ===================
[04:32:46] [PASSED] reflect-x
[04:32:46] [PASSED] reflect-y
[04:32:46] [PASSED] rotate-0
[04:32:46] [PASSED] rotate-90
[04:32:46] [PASSED] rotate-180
[04:32:46] [PASSED] rotate-270
[04:32:46] ============== [PASSED] drm_test_rect_rotate ===============
[04:32:46] ================ drm_test_rect_rotate_inv  =================
[04:32:46] [PASSED] reflect-x
[04:32:46] [PASSED] reflect-y
[04:32:46] [PASSED] rotate-0
[04:32:46] [PASSED] rotate-90
[04:32:46] [PASSED] rotate-180
[04:32:46] [PASSED] rotate-270
[04:32:46] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[04:32:46] ==================== [PASSED] drm_rect =====================
[04:32:46] ======================== drm_exec  =========================
[04:32:46] [PASSED] sanitycheck
[04:32:46] [PASSED] test_lock
[04:32:46] [PASSED] test_lock_unlock
[04:32:46] [PASSED] test_duplicates
[04:32:46] [PASSED] test_prepare
[04:32:46] [PASSED] test_prepare_array
[04:32:46] [PASSED] test_multiple_loops
[04:32:46] ==================== [PASSED] drm_exec =====================
[04:32:46] ============================================================
[04:32:46] Testing complete. Ran 368 tests: passed: 368
[04:32:46] Elapsed time: 44.015s total, 1.645s configuring, 19.089s building, 23.246s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


