Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE65C2BB3F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 20:00:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38C610E0F4;
	Mon, 20 Nov 2023 20:00:13 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6D30210E0F4;
 Mon, 20 Nov 2023 20:00:12 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5BC13A03D2;
 Mon, 20 Nov 2023 20:00:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Haridhar Kalvala" <haridhar.kalvala@intel.com>
Date: Mon, 20 Nov 2023 20:00:12 -0000
Message-ID: <170051041237.29477.8816177948724577062@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231120065507.1543676-1-haridhar.kalvala@intel.com>
In-Reply-To: <20231120065507.1543676-1-haridhar.kalvala@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe?=
 =?utf-8?q?=3A_ATS-M_device_ID_update?=
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

Series: drm/xe: ATS-M device ID update
URL   : https://patchwork.freedesktop.org/series/126634/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[19:59:00] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:59:05] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[19:59:25] Starting KUnit Kernel (1/1)...
[19:59:25] ============================================================
[19:59:25] ========================== xe_bo  ==========================
[19:59:25] [SKIPPED] xe_ccs_migrate_kunit
[19:59:25] [SKIPPED] xe_bo_evict_kunit
[19:59:25] ===================== [SKIPPED] xe_bo ======================
[19:59:25] ======================= xe_dma_buf  ========================
[19:59:25] [SKIPPED] xe_dma_buf_kunit
[19:59:25] =================== [SKIPPED] xe_dma_buf ===================
[19:59:25] ======================= xe_migrate  ========================
[19:59:25] [SKIPPED] xe_migrate_sanity_kunit
[19:59:25] =================== [SKIPPED] xe_migrate ===================
[19:59:25] ========================= xe_pci  ==========================
[19:59:25] [PASSED] xe_gmdid_graphics_ip
[19:59:25] [PASSED] xe_gmdid_media_ip
[19:59:25] ===================== [PASSED] xe_pci ======================
[19:59:25] ========================= xe_rtp  ==========================
[19:59:25] ================== xe_rtp_process_tests  ===================
[19:59:25] [PASSED] coalesce-same-reg
[19:59:25] [PASSED] no-match-no-add
[19:59:25] [PASSED] no-match-no-add-multiple-rules
[19:59:25] [PASSED] two-regs-two-entries
[19:59:25] [PASSED] clr-one-set-other
[19:59:25] [PASSED] set-field
[19:59:25] [PASSED] conflict-duplicate
[19:59:25] [PASSED] conflict-not-disjoint
[19:59:25] [PASSED] conflict-reg-type
[19:59:25] ============== [PASSED] xe_rtp_process_tests ===============
[19:59:25] ===================== [PASSED] xe_rtp ======================
[19:59:25] ========================== xe_wa  ==========================
[19:59:25] ======================== xe_wa_gt  =========================
[19:59:25] [PASSED] TIGERLAKE (B0)
[19:59:25] [PASSED] DG1 (A0)
[19:59:25] [PASSED] DG1 (B0)
[19:59:25] [PASSED] ALDERLAKE_S (A0)
[19:59:25] [PASSED] ALDERLAKE_S (B0)
[19:59:25] [PASSED] ALDERLAKE_S (C0)
[19:59:25] [PASSED] ALDERLAKE_S (D0)
[19:59:25] [PASSED] ALDERLAKE_P (A0)
[19:59:25] [PASSED] ALDERLAKE_P (B0)
[19:59:25] [PASSED] ALDERLAKE_P (C0)
[19:59:25] [PASSED] ALDERLAKE_S_RPLS (D0)
[19:59:25] [PASSED] ALDERLAKE_P_RPLU (E0)
[19:59:25] [PASSED] DG2_G10 (A0)
[19:59:25] [PASSED] DG2_G10 (A1)
[19:59:25] [PASSED] DG2_G10 (B0)
[19:59:25] [PASSED] DG2_G10 (C0)
[19:59:25] [PASSED] DG2_G11 (A0)
[19:59:25] [PASSED] DG2_G11 (B0)
[19:59:25] [PASSED] DG2_G11 (B1)
[19:59:25] [PASSED] DG2_G12 (A0)
[19:59:25] [PASSED] DG2_G12 (A1)
[19:59:25] [PASSED] PVC (B0)
[19:59:25] [PASSED] PVC (B1)
[19:59:25] [PASSED] PVC (C0)
[19:59:25] ==================== [PASSED] xe_wa_gt =====================
[19:59:25] ====================== [PASSED] xe_wa ======================
[19:59:25] ============================================================
[19:59:25] Testing complete. Ran 39 tests: passed: 35, skipped: 4
[19:59:25] Elapsed time: 24.589s total, 4.224s configuring, 20.195s building, 0.151s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[19:59:25] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:59:27] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[19:59:46] Starting KUnit Kernel (1/1)...
[19:59:46] ============================================================
[19:59:46] ================== drm_test_pick_cmdline  ==================
[19:59:46] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[19:59:46] =============== drm_test_pick_cmdline_named  ===============
[19:59:46] [PASSED] NTSC
[19:59:46] [PASSED] NTSC-J
[19:59:46] [PASSED] PAL
[19:59:46] [PASSED] PAL-M
[19:59:46] =========== [PASSED] drm_test_pick_cmdline_named ===========
[19:59:46] ============== [PASSED] drm_test_pick_cmdline ==============
[19:59:46] ======================== drm_buddy  ========================
[19:59:46] [PASSED] drm_test_buddy_alloc_limit
[19:59:46] [PASSED] drm_test_buddy_alloc_range
[19:59:46] [PASSED] drm_test_buddy_alloc_optimistic
[19:59:46] [PASSED] drm_test_buddy_alloc_pessimistic
[19:59:46] [PASSED] drm_test_buddy_alloc_smoke
[19:59:46] [PASSED] drm_test_buddy_alloc_pathological
[19:59:46] ==================== [PASSED] drm_buddy ====================
[19:59:46] =================== drm_cmdline_parser  ====================
[19:59:46] [PASSED] drm_test_cmdline_force_d_only
[19:59:46] [PASSED] drm_test_cmdline_force_D_only_dvi
[19:59:46] [PASSED] drm_test_cmdline_force_D_only_hdmi
[19:59:46] [PASSED] drm_test_cmdline_force_D_only_not_digital
[19:59:46] [PASSED] drm_test_cmdline_force_e_only
[19:59:46] [PASSED] drm_test_cmdline_res
[19:59:46] [PASSED] drm_test_cmdline_res_vesa
[19:59:46] [PASSED] drm_test_cmdline_res_vesa_rblank
[19:59:46] [PASSED] drm_test_cmdline_res_rblank
[19:59:46] [PASSED] drm_test_cmdline_res_bpp
[19:59:46] [PASSED] drm_test_cmdline_res_refresh
[19:59:46] [PASSED] drm_test_cmdline_res_bpp_refresh
[19:59:46] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[19:59:46] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[19:59:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[19:59:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[19:59:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[19:59:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[19:59:46] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[19:59:46] [PASSED] drm_test_cmdline_res_margins_force_on
[19:59:46] [PASSED] drm_test_cmdline_res_vesa_margins
[19:59:46] [PASSED] drm_test_cmdline_name
[19:59:46] [PASSED] drm_test_cmdline_name_bpp
[19:59:46] [PASSED] drm_test_cmdline_name_option
[19:59:46] [PASSED] drm_test_cmdline_name_bpp_option
[19:59:46] [PASSED] drm_test_cmdline_rotate_0
[19:59:46] [PASSED] drm_test_cmdline_rotate_90
[19:59:46] [PASSED] drm_test_cmdline_rotate_180
[19:59:46] [PASSED] drm_test_cmdline_rotate_270
[19:59:46] [PASSED] drm_test_cmdline_hmirror
[19:59:46] [PASSED] drm_test_cmdline_vmirror
[19:59:46] [PASSED] drm_test_cmdline_margin_options
[19:59:46] [PASSED] drm_test_cmdline_multiple_options
[19:59:46] [PASSED] drm_test_cmdline_bpp_extra_and_option
[19:59:46] [PASSED] drm_test_cmdline_extra_and_option
[19:59:46] [PASSED] drm_test_cmdline_freestanding_options
[19:59:46] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[19:59:46] [PASSED] drm_test_cmdline_panel_orientation
[19:59:46] ================ drm_test_cmdline_invalid  =================
[19:59:46] [PASSED] margin_only
[19:59:46] [PASSED] interlace_only
[19:59:46] [PASSED] res_missing_x
[19:59:46] [PASSED] res_missing_y
[19:59:46] [PASSED] res_bad_y
[19:59:46] [PASSED] res_missing_y_bpp
[19:59:46] [PASSED] res_bad_bpp
[19:59:46] [PASSED] res_bad_refresh
[19:59:46] [PASSED] res_bpp_refresh_force_on_off
[19:59:46] [PASSED] res_invalid_mode
[19:59:46] [PASSED] res_bpp_wrong_place_mode
[19:59:46] [PASSED] name_bpp_refresh
[19:59:46] [PASSED] name_refresh
[19:59:46] [PASSED] name_refresh_wrong_mode
[19:59:46] [PASSED] name_refresh_invalid_mode
[19:59:46] [PASSED] rotate_multiple
[19:59:46] [PASSED] rotate_invalid_val
[19:59:46] [PASSED] rotate_truncated
[19:59:46] [PASSED] invalid_option
[19:59:46] [PASSED] invalid_tv_option
[19:59:46] [PASSED] truncated_tv_option
[19:59:46] ============ [PASSED] drm_test_cmdline_invalid =============
[19:59:46] =============== drm_test_cmdline_tv_options  ===============
[19:59:46] [PASSED] NTSC
[19:59:46] [PASSED] NTSC_443
[19:59:46] [PASSED] NTSC_J
[19:59:46] [PASSED] PAL
[19:59:46] [PASSED] PAL_M
[19:59:46] [PASSED] PAL_N
[19:59:46] [PASSED] SECAM
[19:59:46] =========== [PASSED] drm_test_cmdline_tv_options ===========
[19:59:46] =============== [PASSED] drm_cmdline_parser ================
[19:59:46] ================ drm_get_tv_mode_from_name  ================
[19:59:46] ========== drm_test_get_tv_mode_from_name_valid  ===========
[19:59:46] [PASSED] NTSC
[19:59:46] [PASSED] NTSC-443
[19:59:46] [PASSED] NTSC-J
[19:59:46] [PASSED] PAL
[19:59:46] [PASSED] PAL-M
[19:59:46] [PASSED] PAL-N
[19:59:46] [PASSED] SECAM
[19:59:46] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[19:59:46] [PASSED] drm_test_get_tv_mode_from_name_truncated
[19:59:46] ============ [PASSED] drm_get_tv_mode_from_name ============
[19:59:46] ==================== drm_damage_helper  ====================
[19:59:46] [PASSED] drm_test_damage_iter_no_damage
[19:59:46] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[19:59:46] [PASSED] drm_test_damage_iter_no_damage_src_moved
[19:59:46] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[19:59:46] [PASSED] drm_test_damage_iter_no_damage_not_visible
[19:59:46] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[19:59:46] [PASSED] drm_test_damage_iter_no_damage_no_fb
[19:59:46] [PASSED] drm_test_damage_iter_simple_damage
[19:59:46] [PASSED] drm_test_damage_iter_single_damage
[19:59:46] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[19:59:46] [PASSED] drm_test_damage_iter_single_damage_outside_src
[19:59:46] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[19:59:46] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[19:59:46] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[19:59:46] [PASSED] drm_test_damage_iter_single_damage_src_moved
[19:59:46] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[19:59:46] [PASSED] drm_test_damage_iter_damage
[19:59:46] [PASSED] drm_test_damage_iter_damage_one_intersect
[19:59:46] [PASSED] drm_test_damage_iter_damage_one_outside
[19:59:46] [PASSED] drm_test_damage_iter_damage_src_moved
[19:59:46] [PASSED] drm_test_damage_iter_damage_not_visible
[19:59:46] ================ [PASSED] drm_damage_helper ================
[19:59:46] ==================== drm_dp_mst_helper  ====================
[19:59:46] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[19:59:46] [PASSED] Clock 154000 BPP 30 DSC disabled
[19:59:46] [PASSED] Clock 234000 BPP 30 DSC disabled
[19:59:46] [PASSED] Clock 297000 BPP 24 DSC disabled
[19:59:46] [PASSED] Clock 332880 BPP 24 DSC enabled
[19:59:46] [PASSED] Clock 324540 BPP 24 DSC enabled
[19:59:46] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[19:59:46] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[19:59:46] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[19:59:46] [PASSED] DP_POWER_UP_PHY with port number
[19:59:46] [PASSED] DP_POWER_DOWN_PHY with port number
[19:59:46] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[19:59:46] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[19:59:46] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[19:59:46] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[19:59:46] [PASSED] DP_QUERY_PAYLOAD with port number
[19:59:46] [PASSED] DP_QUERY_PAYLOAD with VCPI
[19:59:46] [PASSED] DP_REMOTE_DPCD_READ with port number
[19:59:46] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[19:59:46] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[19:59:46] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[19:59:46] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[19:59:46] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[19:59:46] [PASSED] DP_REMOTE_I2C_READ with port number
[19:59:46] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[19:59:46] [PASSED] DP_REMOTE_I2C_READ with transactions array
[19:59:46] [PASSED] DP_REMOTE_I2C_WRITE with port number
[19:59:46] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[19:59:46] [PASSED] DP_REMOTE_I2C_WRITE with data array
[19:59:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[19:59:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[19:59:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[19:59:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[19:59:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[19:59:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[19:59:46] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[19:59:46] ================ [PASSED] drm_dp_mst_helper ================
[19:59:46] ================= drm_format_helper_test  ==================
[19:59:46] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[19:59:46] [PASSED] single_pixel_source_buffer
[19:59:46] [PASSED] single_pixel_clip_rectangle
[19:59:46] [PASSED] well_known_colors
[19:59:46] [PASSED] destination_pitch
[19:59:46] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[19:59:46] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[19:59:46] [PASSED] single_pixel_source_buffer
[19:59:46] [PASSED] single_pixel_clip_rectangle
[19:59:46] [PASSED] well_known_colors
[19:59:46] [PASSED] destination_pitch
[19:59:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[19:59:46] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[19:59:46] [PASSED] single_pixel_source_buffer
[19:59:46] [PASSED] single_pixel_clip_rectangle
[19:59:46] [PASSED] well_known_colors
[19:59:46] [PASSED] destination_pitch
[19:59:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[19:59:46] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[19:59:46] [PASSED] single_pixel_source_buffer
[19:59:46] [PASSED] single_pixel_clip_rectangle
[19:59:46] [PASSED] well_known_colors
[19:59:46] [PASSED] destination_pitch
[19:59:46] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[19:59:46] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[19:59:46] [PASSED] single_pixel_source_buffer
[19:59:46] [PASSED] single_pixel_clip_rectangle
[19:59:46] [PASSED] well_known_colors
[19:59:46] [PASSED] destination_pitch
[19:59:46] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[19:59:46] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[19:59:46] [PASSED] single_pixel_source_buffer
[19:59:46] [PASSED] single_pixel_clip_rectangle
[19:59:46] [PASSED] well_known_colors
[19:59:46] [PASSED] destination_pitch
[19:59:46] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[19:59:46] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[19:59:46] [PASSED] single_pixel_source_buffer
[19:59:46] [PASSED] single_pixel_clip_rectangle
[19:59:46] [PASSED] well_known_colors
[19:59:46] [PASSED] destination_pitch
[19:59:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[19:59:46] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[19:59:46] [PASSED] single_pixel_source_buffer
[19:59:46] [PASSED] single_pixel_clip_rectangle
[19:59:46] [PASSED] well_known_colors
[19:59:46] [PASSED] destination_pitch
[19:59:46] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[19:59:46] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[19:59:46] [PASSED] single_pixel_source_buffer
[19:59:46] [PASSED] single_pixel_clip_rectangle
[19:59:46] [PASSED] well_known_colors
[19:59:46] [PASSED] destination_pitch
[19:59:46] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[19:59:46] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[19:59:46] [PASSED] single_pixel_source_buffer
[19:59:46] [PASSED] single_pixel_clip_rectangle
[19:59:46] [PASSED] well_known_colors
[19:59:46] [PASSED] destination_pitch
[19:59:46] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[19:59:46] ============== drm_test_fb_xrgb8888_to_mono  ===============
[19:59:46] [PASSED] single_pixel_source_buffer
[19:59:46] [PASSED] single_pixel_clip_rectangle
[19:59:46] [PASSED] well_known_colors
[19:59:46] [PASSED] destination_pitch
[19:59:46] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[19:59:46] ==================== drm_test_fb_swab  =====================
[19:59:46] [PASSED] single_pixel_source_buffer
[19:59:46] [PASSED] single_pixel_clip_rectangle
[19:59:46] [PASSED] well_known_colors
[19:59:46] [PASSED] destination_pitch
[19:59:46] ================ [PASSED] drm_test_fb_swab =================
[19:59:46] ================= drm_test_fb_clip_offset  =================
[19:59:46] [PASSED] pass through
[19:59:46] [PASSED] horizontal offset
[19:59:46] [PASSED] vertical offset
[19:59:46] [PASSED] horizontal and vertical offset
[19:59:46] [PASSED] horizontal offset (custom pitch)
[19:59:46] [PASSED] vertical offset (custom pitch)
[19:59:46] [PASSED] horizontal and vertical offset (custom pitch)
[19:59:46] ============= [PASSED] drm_test_fb_clip_offset =============
[19:59:46] ============== drm_test_fb_build_fourcc_list  ==============
[19:59:46] [PASSED] no native formats
[19:59:46] [PASSED] XRGB8888 as native format
[19:59:46] [PASSED] remove duplicates
[19:59:46] [PASSED] convert alpha formats
[19:59:46] [PASSED] random formats
[19:59:46] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[19:59:46] =================== drm_test_fb_memcpy  ====================
[19:59:46] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[19:59:46] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[19:59:46] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[19:59:46] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[19:59:46] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[19:59:46] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[19:59:46] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[19:59:46] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[19:59:46] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[19:59:46] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[19:59:46] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[19:59:46] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[19:59:46] =============== [PASSED] drm_test_fb_memcpy ================
[19:59:46] ============= [PASSED] drm_format_helper_test ==============
[19:59:46] ======================= drm_format  ========================
[19:59:46] [PASSED] drm_test_format_block_width_invalid
[19:59:46] [PASSED] drm_test_format_block_width_one_plane
[19:59:46] [PASSED] drm_test_format_block_width_two_plane
[19:59:46] [PASSED] drm_test_format_block_width_three_plane
[19:59:46] [PASSED] drm_test_format_block_width_tiled
[19:59:46] [PASSED] drm_test_format_block_height_invalid
[19:59:46] [PASSED] drm_test_format_block_height_one_plane
[19:59:46] [PASSED] drm_test_format_block_height_two_plane
[19:59:46] [PASSED] drm_test_format_block_height_three_plane
[19:59:46] [PASSED] drm_test_format_block_height_tiled
[19:59:46] [PASSED] drm_test_format_min_pitch_invalid
[19:59:46] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[19:59:46] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[19:59:46] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[19:59:46] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[19:59:46] [PASSED] drm_test_format_min_pitch_two_plane
[19:59:46] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[19:59:46] [PASSED] drm_test_format_min_pitch_tiled
[19:59:46] =================== [PASSED] drm_format ====================
[19:59:46] ===================== drm_framebuffer  =====================
[19:59:46] =============== drm_test_framebuffer_create  ===============
[19:59:46] [PASSED] ABGR8888 normal sizes
[19:59:46] [PASSED] ABGR8888 max sizes
[19:59:46] [PASSED] ABGR8888 pitch greater than min required
[19:59:46] [PASSED] ABGR8888 pitch less than min required
[19:59:46] [PASSED] ABGR8888 Invalid width
[19:59:46] [PASSED] ABGR8888 Invalid buffer handle
[19:59:46] [PASSED] No pixel format
[19:59:46] [PASSED] ABGR8888 Width 0
[19:59:46] [PASSED] ABGR8888 Height 0
[19:59:46] [PASSED] ABGR8888 Out of bound height * pitch combination
[19:59:46] [PASSED] ABGR8888 Large buffer offset
[19:59:46] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[19:59:46] [PASSED] ABGR8888 Valid buffer modifier
[19:59:46] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[19:59:46] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[19:59:46] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[19:59:46] [PASSED] NV12 Normal sizes
[19:59:46] [PASSED] NV12 Max sizes
[19:59:46] [PASSED] NV12 Invalid pitch
[19:59:46] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[19:59:46] [PASSED] NV12 different  modifier per-plane
[19:59:46] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[19:59:46] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[19:59:46] [PASSED] NV12 Modifier for inexistent plane
[19:59:46] [PASSED] NV12 Handle for inexistent plane
[19:59:46] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[19:59:46] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[19:59:46] [PASSED] YVU420 Normal sizes
[19:59:46] [PASSED] YVU420 Max sizes
[19:59:46] [PASSED] YVU420 Invalid pitch
[19:59:46] [PASSED] YVU420 Different pitches
[19:59:46] [PASSED] YVU420 Different buffer offsets/pitches
[19:59:46] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[19:59:46] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[19:59:46] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[19:59:46] [PASSED] YVU420 Valid modifier
[19:59:46] [PASSED] YVU420 Different modifiers per plane
[19:59:46] [PASSED] YVU420 Modifier for inexistent plane
[19:59:46] [PASSED] X0L2 Normal sizes
[19:59:46] [PASSED] X0L2 Max sizes
[19:59:46] [PASSED] X0L2 Invalid pitch
[19:59:46] [PASSED] X0L2 Pitch greater than minimum required
[19:59:46] [PASSED] X0L2 Handle for inexistent plane
[19:59:46] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[19:59:46] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[19:59:46] [PASSED] X0L2 Valid modifier
[19:59:46] [PASSED] X0L2 Modifier for inexistent plane
[19:59:46] =========== [PASSED] drm_test_framebuffer_create ===========
[19:59:46] ================= [PASSED] drm_framebuffer =================
[19:59:46] ==================== drm-test-managed  =====================
[19:59:46] [PASSED] drm_test_managed_run_action
[19:59:46] ================ [PASSED] drm-test-managed =================
[19:59:46] ========================= drm_mm  ==========================
[19:59:46] [PASSED] drm_test_mm_init
[19:59:46] [PASSED] drm_test_mm_debug
[19:59:57] [PASSED] drm_test_mm_reserve
[20:00:07] [PASSED] drm_test_mm_insert
[20:00:08] [PASSED] drm_test_mm_replace
[20:00:08] [PASSED] drm_test_mm_insert_range
[20:00:08] [PASSED] drm_test_mm_frag
[20:00:08] [PASSED] drm_test_mm_align
[20:00:08] [PASSED] drm_test_mm_align32
[20:00:08] [PASSED] drm_test_mm_align64
[20:00:09] [PASSED] drm_test_mm_evict
[20:00:09] [PASSED] drm_test_mm_evict_range
[20:00:09] [PASSED] drm_test_mm_topdown
[20:00:09] [PASSED] drm_test_mm_bottomup
[20:00:09] [PASSED] drm_test_mm_lowest
[20:00:09] [PASSED] drm_test_mm_highest
[20:00:09] [PASSED] drm_test_mm_color
[20:00:10] [PASSED] drm_test_mm_color_evict
[20:00:10] [PASSED] drm_test_mm_color_evict_range
[20:00:10] ===================== [PASSED] drm_mm ======================
[20:00:10] =================== drm_modes_analog_tv  ===================
[20:00:10] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[20:00:10] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[20:00:10] [PASSED] drm_test_modes_analog_tv_pal_576i
[20:00:10] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[20:00:10] =============== [PASSED] drm_modes_analog_tv ===============
[20:00:10] ==================== drm_plane_helper  =====================
[20:00:10] =============== drm_test_check_plane_state  ================
[20:00:10] [PASSED] clipping_simple
[20:00:10] [PASSED] clipping_rotate_reflect
[20:00:10] [PASSED] positioning_simple
[20:00:10] [PASSED] upscaling
[20:00:10] [PASSED] downscaling
[20:00:10] [PASSED] rounding1
[20:00:10] [PASSED] rounding2
[20:00:10] [PASSED] rounding3
[20:00:10] [PASSED] rounding4
[20:00:10] =========== [PASSED] drm_test_check_plane_state ============
[20:00:10] =========== drm_test_check_invalid_plane_state  ============
[20:00:10] [PASSED] positioning_invalid
[20:00:10] [PASSED] upscaling_invalid
[20:00:10] [PASSED] downscaling_invalid
[20:00:10] ======= [PASSED] drm_test_check_invalid_plane_state ========
[20:00:10] ================ [PASSED] drm_plane_helper =================
[20:00:10] ============ drm_connector_helper_tv_get_modes  ============
[20:00:10] ====== drm_test_connector_helper_tv_get_modes_check  =======
[20:00:10] [PASSED] None
[20:00:10] [PASSED] PAL
[20:00:10] [PASSED] NTSC
[20:00:10] [PASSED] Both, NTSC Default
[20:00:10] [PASSED] Both, PAL Default
[20:00:10] [PASSED] Both, NTSC Default, with PAL on command-line
[20:00:10] [PASSED] Both, PAL Default, with NTSC on command-line
[20:00:10] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[20:00:10] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[20:00:10] ======================== drm_rect  =========================
[20:00:10] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[20:00:10] [PASSED] drm_test_rect_clip_scaled_not_clipped
[20:00:10] [PASSED] drm_test_rect_clip_scaled_clipped
[20:00:10] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[20:00:10] ================= drm_test_rect_intersect  =================
[20:00:10] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[20:00:10] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[20:00:10] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[20:00:10] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[20:00:10] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[20:00:10] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[20:00:10] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[20:00:10] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[20:00:10] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[20:00:10] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[20:00:10] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[20:00:10] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[20:00:10] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[20:00:10] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[20:00:10] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[20:00:10] ============= [PASSED] drm_test_rect_intersect =============
[20:00:10] ================ drm_test_rect_calc_hscale  ================
[20:00:10] [PASSED] normal use
[20:00:10] [PASSED] out of max range
[20:00:10] [PASSED] out of min range
[20:00:10] [PASSED] zero dst
[20:00:10] [PASSED] negative src
[20:00:10] [PASSED] negative dst
[20:00:10] ============ [PASSED] drm_test_rect_calc_hscale ============
[20:00:10] ================ drm_test_rect_calc_vscale  ================
[20:00:10] [PASSED] normal use
[20:00:10] [PASSED] out of max range
[20:00:10] [PASSED] out of min range
[20:00:10] [PASSED] zero dst
[20:00:10] [PASSED] negative src
[20:00:10] [PASSED] negative dst
[20:00:10] ============ [PASSED] drm_test_rect_calc_vscale ============
[20:00:10] ================== drm_test_rect_rotate  ===================
[20:00:10] [PASSED] reflect-x
[20:00:10] [PASSED] reflect-y
[20:00:10] [PASSED] rotate-0
[20:00:10] [PASSED] rotate-90
[20:00:10] [PASSED] rotate-180
[20:00:10] [PASSED] rotate-270
[20:00:10] ============== [PASSED] drm_test_rect_rotate ===============
[20:00:10] ================ drm_test_rect_rotate_inv  =================
[20:00:10] [PASSED] reflect-x
[20:00:10] [PASSED] reflect-y
[20:00:10] [PASSED] rotate-0
[20:00:10] [PASSED] rotate-90
[20:00:10] [PASSED] rotate-180
[20:00:10] [PASSED] rotate-270
[20:00:10] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[20:00:10] ==================== [PASSED] drm_rect =====================
[20:00:10] ======================== drm_exec  =========================
[20:00:10] [PASSED] sanitycheck
[20:00:10] [PASSED] test_lock
[20:00:10] [PASSED] test_lock_unlock
[20:00:10] [PASSED] test_duplicates
[20:00:10] [PASSED] test_prepare
[20:00:10] [PASSED] test_prepare_array
[20:00:10] [PASSED] test_multiple_loops
[20:00:10] ==================== [PASSED] drm_exec =====================
[20:00:10] ============================================================
[20:00:10] Testing complete. Ran 368 tests: passed: 368
[20:00:10] Elapsed time: 45.088s total, 1.683s configuring, 19.072s building, 24.328s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


