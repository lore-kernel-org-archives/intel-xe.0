Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929A8E92FD0
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 00:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D17910E4B1;
	Fri,  6 Oct 2023 00:50:07 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 762A810E085;
 Fri,  6 Oct 2023 00:50:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 60802AADF1;
 Fri,  6 Oct 2023 00:50:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anusha Srivatsa" <anusha.srivatsa@intel.com>
Date: Fri, 06 Oct 2023 00:50:04 -0000
Message-ID: <169655340438.6465.16728321192421848275@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231005205450.3177354-1-anusha.srivatsa@intel.com>
In-Reply-To: <20231005205450.3177354-1-anusha.srivatsa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Add_Rap?=
 =?utf-8?q?torlake_Support_=28rev4=29?=
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

Series: Add Raptorlake Support (rev4)
URL   : https://patchwork.freedesktop.org/series/123801/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[00:48:52] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:48:57] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[00:49:17] Starting KUnit Kernel (1/1)...
[00:49:17] ============================================================
[00:49:17] ========================== xe_bo  ==========================
[00:49:17] [SKIPPED] xe_ccs_migrate_kunit
[00:49:17] [SKIPPED] xe_bo_evict_kunit
[00:49:17] ===================== [SKIPPED] xe_bo ======================
[00:49:17] ======================= xe_dma_buf  ========================
[00:49:17] [SKIPPED] xe_dma_buf_kunit
[00:49:17] =================== [SKIPPED] xe_dma_buf ===================
[00:49:17] ======================= xe_migrate  ========================
[00:49:17] [SKIPPED] xe_migrate_sanity_kunit
[00:49:17] =================== [SKIPPED] xe_migrate ===================
[00:49:17] ========================= xe_pci  ==========================
[00:49:17] [PASSED] xe_gmdid_graphics_ip
[00:49:17] [PASSED] xe_gmdid_media_ip
[00:49:17] ===================== [PASSED] xe_pci ======================
[00:49:17] ========================= xe_rtp  ==========================
[00:49:17] ================== xe_rtp_process_tests  ===================
[00:49:17] [PASSED] coalesce-same-reg
[00:49:17] [PASSED] no-match-no-add
[00:49:17] [PASSED] no-match-no-add-multiple-rules
[00:49:17] [PASSED] two-regs-two-entries
[00:49:17] [PASSED] clr-one-set-other
[00:49:17] [PASSED] set-field
[00:49:17] [PASSED] conflict-duplicate
[00:49:17] [PASSED] conflict-not-disjoint
[00:49:17] [PASSED] conflict-reg-type
[00:49:17] ============== [PASSED] xe_rtp_process_tests ===============
[00:49:17] ===================== [PASSED] xe_rtp ======================
[00:49:17] ========================== xe_wa  ==========================
[00:49:17] ======================== xe_wa_gt  =========================
[00:49:17] [PASSED] TIGERLAKE (B0)
[00:49:17] [PASSED] DG1 (A0)
[00:49:17] [PASSED] DG1 (B0)
[00:49:17] [PASSED] ALDERLAKE_S (A0)
[00:49:17] [PASSED] ALDERLAKE_S (B0)
[00:49:17] [PASSED] ALDERLAKE_S (C0)
[00:49:17] [PASSED] ALDERLAKE_S (D0)
[00:49:17] [PASSED] ALDERLAKE_P (A0)
[00:49:17] [PASSED] ALDERLAKE_P (B0)
[00:49:17] [PASSED] ALDERLAKE_P (C0)
[00:49:17] [PASSED] ALDERLAKE_S_RPLS (D0)
[00:49:17] [PASSED] ALDERLAKE_P_RPLU (E0)
[00:49:17] [PASSED] DG2_G10 (A0)
[00:49:17] [PASSED] DG2_G10 (A1)
[00:49:17] [PASSED] DG2_G10 (B0)
[00:49:17] [PASSED] DG2_G10 (C0)
[00:49:17] [PASSED] DG2_G11 (A0)
[00:49:17] [PASSED] DG2_G11 (B0)
[00:49:17] [PASSED] DG2_G11 (B1)
[00:49:17] [PASSED] DG2_G12 (A0)
[00:49:17] [PASSED] DG2_G12 (A1)
[00:49:17] [PASSED] PVC (B0)
[00:49:17] [PASSED] PVC (B1)
[00:49:17] [PASSED] PVC (C0)
[00:49:17] ==================== [PASSED] xe_wa_gt =====================
[00:49:17] ====================== [PASSED] xe_wa ======================
[00:49:17] ============================================================
[00:49:17] Testing complete. Ran 39 tests: passed: 35, skipped: 4
[00:49:17] Elapsed time: 24.440s total, 4.208s configuring, 20.063s building, 0.151s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[00:49:17] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:49:19] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[00:49:38] Starting KUnit Kernel (1/1)...
[00:49:38] ============================================================
[00:49:38] ================== drm_test_pick_cmdline  ==================
[00:49:38] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[00:49:38] =============== drm_test_pick_cmdline_named  ===============
[00:49:38] [PASSED] NTSC
[00:49:38] [PASSED] NTSC-J
[00:49:38] [PASSED] PAL
[00:49:38] [PASSED] PAL-M
[00:49:38] =========== [PASSED] drm_test_pick_cmdline_named ===========
[00:49:38] ============== [PASSED] drm_test_pick_cmdline ==============
[00:49:38] ======================== drm_buddy  ========================
[00:49:38] [PASSED] drm_test_buddy_alloc_limit
[00:49:38] [PASSED] drm_test_buddy_alloc_range
[00:49:38] [PASSED] drm_test_buddy_alloc_optimistic
[00:49:38] [PASSED] drm_test_buddy_alloc_pessimistic
[00:49:38] [PASSED] drm_test_buddy_alloc_smoke
[00:49:38] [PASSED] drm_test_buddy_alloc_pathological
[00:49:38] ==================== [PASSED] drm_buddy ====================
[00:49:38] =================== drm_cmdline_parser  ====================
[00:49:38] [PASSED] drm_test_cmdline_force_d_only
[00:49:38] [PASSED] drm_test_cmdline_force_D_only_dvi
[00:49:38] [PASSED] drm_test_cmdline_force_D_only_hdmi
[00:49:38] [PASSED] drm_test_cmdline_force_D_only_not_digital
[00:49:38] [PASSED] drm_test_cmdline_force_e_only
[00:49:38] [PASSED] drm_test_cmdline_res
[00:49:38] [PASSED] drm_test_cmdline_res_vesa
[00:49:38] [PASSED] drm_test_cmdline_res_vesa_rblank
[00:49:38] [PASSED] drm_test_cmdline_res_rblank
[00:49:38] [PASSED] drm_test_cmdline_res_bpp
[00:49:38] [PASSED] drm_test_cmdline_res_refresh
[00:49:38] [PASSED] drm_test_cmdline_res_bpp_refresh
[00:49:38] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[00:49:38] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[00:49:38] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[00:49:38] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[00:49:38] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[00:49:38] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[00:49:38] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[00:49:38] [PASSED] drm_test_cmdline_res_margins_force_on
[00:49:38] [PASSED] drm_test_cmdline_res_vesa_margins
[00:49:38] [PASSED] drm_test_cmdline_name
[00:49:38] [PASSED] drm_test_cmdline_name_bpp
[00:49:38] [PASSED] drm_test_cmdline_name_option
[00:49:38] [PASSED] drm_test_cmdline_name_bpp_option
[00:49:38] [PASSED] drm_test_cmdline_rotate_0
[00:49:38] [PASSED] drm_test_cmdline_rotate_90
[00:49:38] [PASSED] drm_test_cmdline_rotate_180
[00:49:38] [PASSED] drm_test_cmdline_rotate_270
[00:49:38] [PASSED] drm_test_cmdline_hmirror
[00:49:38] [PASSED] drm_test_cmdline_vmirror
[00:49:38] [PASSED] drm_test_cmdline_margin_options
[00:49:38] [PASSED] drm_test_cmdline_multiple_options
[00:49:38] [PASSED] drm_test_cmdline_bpp_extra_and_option
[00:49:38] [PASSED] drm_test_cmdline_extra_and_option
[00:49:38] [PASSED] drm_test_cmdline_freestanding_options
[00:49:38] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[00:49:38] [PASSED] drm_test_cmdline_panel_orientation
[00:49:38] ================ drm_test_cmdline_invalid  =================
[00:49:38] [PASSED] margin_only
[00:49:38] [PASSED] interlace_only
[00:49:38] [PASSED] res_missing_x
[00:49:38] [PASSED] res_missing_y
[00:49:38] [PASSED] res_bad_y
[00:49:38] [PASSED] res_missing_y_bpp
[00:49:38] [PASSED] res_bad_bpp
[00:49:38] [PASSED] res_bad_refresh
[00:49:38] [PASSED] res_bpp_refresh_force_on_off
[00:49:38] [PASSED] res_invalid_mode
[00:49:38] [PASSED] res_bpp_wrong_place_mode
[00:49:38] [PASSED] name_bpp_refresh
[00:49:38] [PASSED] name_refresh
[00:49:38] [PASSED] name_refresh_wrong_mode
[00:49:38] [PASSED] name_refresh_invalid_mode
[00:49:38] [PASSED] rotate_multiple
[00:49:38] [PASSED] rotate_invalid_val
[00:49:38] [PASSED] rotate_truncated
[00:49:38] [PASSED] invalid_option
[00:49:38] [PASSED] invalid_tv_option
[00:49:38] [PASSED] truncated_tv_option
[00:49:38] ============ [PASSED] drm_test_cmdline_invalid =============
[00:49:38] =============== drm_test_cmdline_tv_options  ===============
[00:49:38] [PASSED] NTSC
[00:49:38] [PASSED] NTSC_443
[00:49:38] [PASSED] NTSC_J
[00:49:38] [PASSED] PAL
[00:49:38] [PASSED] PAL_M
[00:49:38] [PASSED] PAL_N
[00:49:38] [PASSED] SECAM
[00:49:38] =========== [PASSED] drm_test_cmdline_tv_options ===========
[00:49:38] =============== [PASSED] drm_cmdline_parser ================
[00:49:38] ================ drm_get_tv_mode_from_name  ================
[00:49:38] ========== drm_test_get_tv_mode_from_name_valid  ===========
[00:49:38] [PASSED] NTSC
[00:49:38] [PASSED] NTSC-443
[00:49:38] [PASSED] NTSC-J
[00:49:38] [PASSED] PAL
[00:49:38] [PASSED] PAL-M
[00:49:38] [PASSED] PAL-N
[00:49:38] [PASSED] SECAM
[00:49:38] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[00:49:38] [PASSED] drm_test_get_tv_mode_from_name_truncated
[00:49:38] ============ [PASSED] drm_get_tv_mode_from_name ============
[00:49:38] ==================== drm_damage_helper  ====================
[00:49:38] [PASSED] drm_test_damage_iter_no_damage
[00:49:38] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[00:49:38] [PASSED] drm_test_damage_iter_no_damage_src_moved
[00:49:38] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[00:49:38] [PASSED] drm_test_damage_iter_no_damage_not_visible
[00:49:38] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[00:49:38] [PASSED] drm_test_damage_iter_no_damage_no_fb
[00:49:38] [PASSED] drm_test_damage_iter_simple_damage
[00:49:38] [PASSED] drm_test_damage_iter_single_damage
[00:49:38] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[00:49:38] [PASSED] drm_test_damage_iter_single_damage_outside_src
[00:49:38] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[00:49:38] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[00:49:38] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[00:49:38] [PASSED] drm_test_damage_iter_single_damage_src_moved
[00:49:38] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[00:49:38] [PASSED] drm_test_damage_iter_damage
[00:49:38] [PASSED] drm_test_damage_iter_damage_one_intersect
[00:49:38] [PASSED] drm_test_damage_iter_damage_one_outside
[00:49:38] [PASSED] drm_test_damage_iter_damage_src_moved
[00:49:38] [PASSED] drm_test_damage_iter_damage_not_visible
[00:49:38] ================ [PASSED] drm_damage_helper ================
[00:49:38] ==================== drm_dp_mst_helper  ====================
[00:49:38] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[00:49:38] [PASSED] Clock 154000 BPP 30 DSC disabled
[00:49:38] [PASSED] Clock 234000 BPP 30 DSC disabled
[00:49:38] [PASSED] Clock 297000 BPP 24 DSC disabled
[00:49:38] [PASSED] Clock 332880 BPP 24 DSC enabled
[00:49:38] [PASSED] Clock 324540 BPP 24 DSC enabled
[00:49:38] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[00:49:38] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[00:49:38] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[00:49:38] [PASSED] DP_POWER_UP_PHY with port number
[00:49:38] [PASSED] DP_POWER_DOWN_PHY with port number
[00:49:38] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[00:49:38] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[00:49:38] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[00:49:38] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[00:49:38] [PASSED] DP_QUERY_PAYLOAD with port number
[00:49:38] [PASSED] DP_QUERY_PAYLOAD with VCPI
[00:49:38] [PASSED] DP_REMOTE_DPCD_READ with port number
[00:49:38] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[00:49:38] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[00:49:38] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[00:49:38] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[00:49:38] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[00:49:38] [PASSED] DP_REMOTE_I2C_READ with port number
[00:49:38] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[00:49:38] [PASSED] DP_REMOTE_I2C_READ with transactions array
[00:49:38] [PASSED] DP_REMOTE_I2C_WRITE with port number
[00:49:38] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[00:49:38] [PASSED] DP_REMOTE_I2C_WRITE with data array
[00:49:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[00:49:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[00:49:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[00:49:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[00:49:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[00:49:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[00:49:38] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[00:49:38] ================ [PASSED] drm_dp_mst_helper ================
[00:49:38] ================= drm_format_helper_test  ==================
[00:49:38] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[00:49:38] [PASSED] single_pixel_source_buffer
[00:49:38] [PASSED] single_pixel_clip_rectangle
[00:49:38] [PASSED] well_known_colors
[00:49:38] [PASSED] destination_pitch
[00:49:38] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[00:49:38] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[00:49:38] [PASSED] single_pixel_source_buffer
[00:49:38] [PASSED] single_pixel_clip_rectangle
[00:49:38] [PASSED] well_known_colors
[00:49:38] [PASSED] destination_pitch
[00:49:38] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[00:49:38] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[00:49:38] [PASSED] single_pixel_source_buffer
[00:49:38] [PASSED] single_pixel_clip_rectangle
[00:49:38] [PASSED] well_known_colors
[00:49:38] [PASSED] destination_pitch
[00:49:38] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[00:49:38] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[00:49:38] [PASSED] single_pixel_source_buffer
[00:49:38] [PASSED] single_pixel_clip_rectangle
[00:49:38] [PASSED] well_known_colors
[00:49:38] [PASSED] destination_pitch
[00:49:38] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[00:49:38] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[00:49:38] [PASSED] single_pixel_source_buffer
[00:49:38] [PASSED] single_pixel_clip_rectangle
[00:49:38] [PASSED] well_known_colors
[00:49:38] [PASSED] destination_pitch
[00:49:38] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[00:49:38] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[00:49:38] [PASSED] single_pixel_source_buffer
[00:49:38] [PASSED] single_pixel_clip_rectangle
[00:49:38] [PASSED] well_known_colors
[00:49:38] [PASSED] destination_pitch
[00:49:38] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[00:49:38] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[00:49:38] [PASSED] single_pixel_source_buffer
[00:49:38] [PASSED] single_pixel_clip_rectangle
[00:49:38] [PASSED] well_known_colors
[00:49:38] [PASSED] destination_pitch
[00:49:38] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[00:49:38] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[00:49:38] [PASSED] single_pixel_source_buffer
[00:49:38] [PASSED] single_pixel_clip_rectangle
[00:49:38] [PASSED] well_known_colors
[00:49:38] [PASSED] destination_pitch
[00:49:38] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[00:49:38] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[00:49:38] [PASSED] single_pixel_source_buffer
[00:49:38] [PASSED] single_pixel_clip_rectangle
[00:49:38] [PASSED] well_known_colors
[00:49:38] [PASSED] destination_pitch
[00:49:38] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[00:49:38] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[00:49:38] [PASSED] single_pixel_source_buffer
[00:49:38] [PASSED] single_pixel_clip_rectangle
[00:49:38] [PASSED] well_known_colors
[00:49:38] [PASSED] destination_pitch
[00:49:38] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[00:49:38] ============== drm_test_fb_xrgb8888_to_mono  ===============
[00:49:38] [PASSED] single_pixel_source_buffer
[00:49:38] [PASSED] single_pixel_clip_rectangle
[00:49:38] [PASSED] well_known_colors
[00:49:38] [PASSED] destination_pitch
[00:49:38] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[00:49:38] ==================== drm_test_fb_swab  =====================
[00:49:38] [PASSED] single_pixel_source_buffer
[00:49:38] [PASSED] single_pixel_clip_rectangle
[00:49:38] [PASSED] well_known_colors
[00:49:38] [PASSED] destination_pitch
[00:49:38] ================ [PASSED] drm_test_fb_swab =================
[00:49:38] ================= drm_test_fb_clip_offset  =================
[00:49:38] [PASSED] pass through
[00:49:38] [PASSED] horizontal offset
[00:49:38] [PASSED] vertical offset
[00:49:38] [PASSED] horizontal and vertical offset
[00:49:38] [PASSED] horizontal offset (custom pitch)
[00:49:38] [PASSED] vertical offset (custom pitch)
[00:49:38] [PASSED] horizontal and vertical offset (custom pitch)
[00:49:38] ============= [PASSED] drm_test_fb_clip_offset =============
[00:49:38] ============== drm_test_fb_build_fourcc_list  ==============
[00:49:38] [PASSED] no native formats
[00:49:38] [PASSED] XRGB8888 as native format
[00:49:38] [PASSED] remove duplicates
[00:49:38] [PASSED] convert alpha formats
[00:49:38] [PASSED] random formats
[00:49:38] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[00:49:38] =================== drm_test_fb_memcpy  ====================
[00:49:38] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[00:49:38] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[00:49:38] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[00:49:38] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[00:49:38] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[00:49:38] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[00:49:38] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[00:49:38] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[00:49:38] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[00:49:38] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[00:49:38] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[00:49:38] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[00:49:38] =============== [PASSED] drm_test_fb_memcpy ================
[00:49:38] ============= [PASSED] drm_format_helper_test ==============
[00:49:38] ======================= drm_format  ========================
[00:49:38] [PASSED] drm_test_format_block_width_invalid
[00:49:38] [PASSED] drm_test_format_block_width_one_plane
[00:49:38] [PASSED] drm_test_format_block_width_two_plane
[00:49:38] [PASSED] drm_test_format_block_width_three_plane
[00:49:38] [PASSED] drm_test_format_block_width_tiled
[00:49:38] [PASSED] drm_test_format_block_height_invalid
[00:49:38] [PASSED] drm_test_format_block_height_one_plane
[00:49:38] [PASSED] drm_test_format_block_height_two_plane
[00:49:38] [PASSED] drm_test_format_block_height_three_plane
[00:49:38] [PASSED] drm_test_format_block_height_tiled
[00:49:38] [PASSED] drm_test_format_min_pitch_invalid
[00:49:38] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[00:49:38] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[00:49:38] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[00:49:38] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[00:49:38] [PASSED] drm_test_format_min_pitch_two_plane
[00:49:38] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[00:49:38] [PASSED] drm_test_format_min_pitch_tiled
[00:49:38] =================== [PASSED] drm_format ====================
[00:49:38] ===================== drm_framebuffer  =====================
[00:49:38] =============== drm_test_framebuffer_create  ===============
[00:49:38] [PASSED] ABGR8888 normal sizes
[00:49:38] [PASSED] ABGR8888 max sizes
[00:49:38] [PASSED] ABGR8888 pitch greater than min required
[00:49:38] [PASSED] ABGR8888 pitch less than min required
[00:49:38] [PASSED] ABGR8888 Invalid width
[00:49:38] [PASSED] ABGR8888 Invalid buffer handle
[00:49:38] [PASSED] No pixel format
[00:49:38] [PASSED] ABGR8888 Width 0
[00:49:38] [PASSED] ABGR8888 Height 0
[00:49:38] [PASSED] ABGR8888 Out of bound height * pitch combination
[00:49:38] [PASSED] ABGR8888 Large buffer offset
[00:49:38] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[00:49:38] [PASSED] ABGR8888 Valid buffer modifier
[00:49:38] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[00:49:38] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[00:49:38] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[00:49:38] [PASSED] NV12 Normal sizes
[00:49:38] [PASSED] NV12 Max sizes
[00:49:38] [PASSED] NV12 Invalid pitch
[00:49:38] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[00:49:38] [PASSED] NV12 different  modifier per-plane
[00:49:38] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[00:49:38] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[00:49:38] [PASSED] NV12 Modifier for inexistent plane
[00:49:38] [PASSED] NV12 Handle for inexistent plane
[00:49:38] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[00:49:38] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[00:49:38] [PASSED] YVU420 Normal sizes
[00:49:38] [PASSED] YVU420 Max sizes
[00:49:38] [PASSED] YVU420 Invalid pitch
[00:49:38] [PASSED] YVU420 Different pitches
[00:49:38] [PASSED] YVU420 Different buffer offsets/pitches
[00:49:38] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[00:49:38] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[00:49:38] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[00:49:38] [PASSED] YVU420 Valid modifier
[00:49:38] [PASSED] YVU420 Different modifiers per plane
[00:49:38] [PASSED] YVU420 Modifier for inexistent plane
[00:49:38] [PASSED] X0L2 Normal sizes
[00:49:38] [PASSED] X0L2 Max sizes
[00:49:38] [PASSED] X0L2 Invalid pitch
[00:49:38] [PASSED] X0L2 Pitch greater than minimum required
[00:49:38] [PASSED] X0L2 Handle for inexistent plane
[00:49:38] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[00:49:38] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[00:49:38] [PASSED] X0L2 Valid modifier
[00:49:38] [PASSED] X0L2 Modifier for inexistent plane
[00:49:38] =========== [PASSED] drm_test_framebuffer_create ===========
[00:49:38] ================= [PASSED] drm_framebuffer =================
[00:49:38] ==================== drm-test-managed  =====================
[00:49:38] [PASSED] drm_test_managed_run_action
[00:49:38] ================ [PASSED] drm-test-managed =================
[00:49:38] ========================= drm_mm  ==========================
[00:49:38] [PASSED] drm_test_mm_init
[00:49:38] [PASSED] drm_test_mm_debug
[00:49:49] [PASSED] drm_test_mm_reserve
[00:49:59] [PASSED] drm_test_mm_insert
[00:50:00] [PASSED] drm_test_mm_replace
[00:50:00] [PASSED] drm_test_mm_insert_range
[00:50:00] [PASSED] drm_test_mm_frag
[00:50:00] [PASSED] drm_test_mm_align
[00:50:00] [PASSED] drm_test_mm_align32
[00:50:00] [PASSED] drm_test_mm_align64
[00:50:00] [PASSED] drm_test_mm_evict
[00:50:00] [PASSED] drm_test_mm_evict_range
[00:50:00] [PASSED] drm_test_mm_topdown
[00:50:00] [PASSED] drm_test_mm_bottomup
[00:50:00] [PASSED] drm_test_mm_lowest
[00:50:00] [PASSED] drm_test_mm_highest
[00:50:01] [PASSED] drm_test_mm_color
[00:50:02] [PASSED] drm_test_mm_color_evict
[00:50:02] [PASSED] drm_test_mm_color_evict_range
[00:50:02] ===================== [PASSED] drm_mm ======================
[00:50:02] =================== drm_modes_analog_tv  ===================
[00:50:02] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[00:50:02] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[00:50:02] [PASSED] drm_test_modes_analog_tv_pal_576i
[00:50:02] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[00:50:02] =============== [PASSED] drm_modes_analog_tv ===============
[00:50:02] ==================== drm_plane_helper  =====================
[00:50:02] =============== drm_test_check_plane_state  ================
[00:50:02] [PASSED] clipping_simple
[00:50:02] [PASSED] clipping_rotate_reflect
[00:50:02] [PASSED] positioning_simple
[00:50:02] [PASSED] upscaling
[00:50:02] [PASSED] downscaling
[00:50:02] [PASSED] rounding1
[00:50:02] [PASSED] rounding2
[00:50:02] [PASSED] rounding3
[00:50:02] [PASSED] rounding4
[00:50:02] =========== [PASSED] drm_test_check_plane_state ============
[00:50:02] =========== drm_test_check_invalid_plane_state  ============
[00:50:02] [PASSED] positioning_invalid
[00:50:02] [PASSED] upscaling_invalid
[00:50:02] [PASSED] downscaling_invalid
[00:50:02] ======= [PASSED] drm_test_check_invalid_plane_state ========
[00:50:02] ================ [PASSED] drm_plane_helper =================
[00:50:02] ============ drm_connector_helper_tv_get_modes  ============
[00:50:02] ====== drm_test_connector_helper_tv_get_modes_check  =======
[00:50:02] [PASSED] None
[00:50:02] [PASSED] PAL
[00:50:02] [PASSED] NTSC
[00:50:02] [PASSED] Both, NTSC Default
[00:50:02] [PASSED] Both, PAL Default
[00:50:02] [PASSED] Both, NTSC Default, with PAL on command-line
[00:50:02] [PASSED] Both, PAL Default, with NTSC on command-line
[00:50:02] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[00:50:02] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[00:50:02] ======================== drm_rect  =========================
[00:50:02] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[00:50:02] [PASSED] drm_test_rect_clip_scaled_not_clipped
[00:50:02] [PASSED] drm_test_rect_clip_scaled_clipped
[00:50:02] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[00:50:02] ================= drm_test_rect_intersect  =================
[00:50:02] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[00:50:02] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[00:50:02] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[00:50:02] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[00:50:02] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[00:50:02] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[00:50:02] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[00:50:02] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[00:50:02] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[00:50:02] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[00:50:02] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[00:50:02] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[00:50:02] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[00:50:02] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[00:50:02] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[00:50:02] ============= [PASSED] drm_test_rect_intersect =============
[00:50:02] ================ drm_test_rect_calc_hscale  ================
[00:50:02] [PASSED] normal use
[00:50:02] [PASSED] out of max range
[00:50:02] [PASSED] out of min range
[00:50:02] [PASSED] zero dst
[00:50:02] [PASSED] negative src
[00:50:02] [PASSED] negative dst
[00:50:02] ============ [PASSED] drm_test_rect_calc_hscale ============
[00:50:02] ================ drm_test_rect_calc_vscale  ================
[00:50:02] [PASSED] normal use
[00:50:02] [PASSED] out of max range
[00:50:02] [PASSED] out of min range
[00:50:02] [PASSED] zero dst
[00:50:02] [PASSED] negative src
[00:50:02] [PASSED] negative dst
[00:50:02] ============ [PASSED] drm_test_rect_calc_vscale ============
[00:50:02] ================== drm_test_rect_rotate  ===================
[00:50:02] [PASSED] reflect-x
[00:50:02] [PASSED] reflect-y
[00:50:02] [PASSED] rotate-0
[00:50:02] [PASSED] rotate-90
[00:50:02] [PASSED] rotate-180
[00:50:02] [PASSED] rotate-270
[00:50:02] ============== [PASSED] drm_test_rect_rotate ===============
[00:50:02] ================ drm_test_rect_rotate_inv  =================
[00:50:02] [PASSED] reflect-x
[00:50:02] [PASSED] reflect-y
[00:50:02] [PASSED] rotate-0
[00:50:02] [PASSED] rotate-90
[00:50:02] [PASSED] rotate-180
[00:50:02] [PASSED] rotate-270
[00:50:02] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[00:50:02] ==================== [PASSED] drm_rect =====================
[00:50:02] ======================== drm_exec  =========================
[00:50:02] [PASSED] sanitycheck
[00:50:02] [PASSED] test_lock
[00:50:02] [PASSED] test_lock_unlock
[00:50:02] [PASSED] test_duplicates
[00:50:02] [PASSED] test_prepare
[00:50:02] [PASSED] test_prepare_array
[00:50:02] [PASSED] test_multiple_loops
[00:50:02] ==================== [PASSED] drm_exec =====================
[00:50:02] ============================================================
[00:50:02] Testing complete. Ran 368 tests: passed: 368
[00:50:02] Elapsed time: 44.927s total, 1.671s configuring, 19.219s building, 24.035s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


