Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23622CDB483
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 07:51:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D778610E3BB;
	Wed, 18 Oct 2023 07:51:00 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 235D210E3C5;
 Wed, 18 Oct 2023 07:50:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 20DC8AA915;
 Wed, 18 Oct 2023 07:50:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Wed, 18 Oct 2023 07:50:59 -0000
Message-ID: <169761545912.15109.18391764911100893693@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231018075457.1806599-1-tejas.upadhyay@intel.com>
In-Reply-To: <20231018075457.1806599-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe?=
 =?utf-8?q?=3A_Count_and_report_low_level_driver_errors_=28rev8=29?=
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

Series: drm/xe: Count and report low level driver errors (rev8)
URL   : https://patchwork.freedesktop.org/series/124026/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[07:49:47] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:49:51] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[07:50:11] Starting KUnit Kernel (1/1)...
[07:50:11] ============================================================
[07:50:11] ========================== xe_bo  ==========================
[07:50:11] [SKIPPED] xe_ccs_migrate_kunit
[07:50:11] [SKIPPED] xe_bo_evict_kunit
[07:50:11] ===================== [SKIPPED] xe_bo ======================
[07:50:11] ======================= xe_dma_buf  ========================
[07:50:11] [SKIPPED] xe_dma_buf_kunit
[07:50:11] =================== [SKIPPED] xe_dma_buf ===================
[07:50:11] ======================= xe_migrate  ========================
[07:50:11] [SKIPPED] xe_migrate_sanity_kunit
[07:50:11] =================== [SKIPPED] xe_migrate ===================
[07:50:11] ========================= xe_pci  ==========================
[07:50:11] [PASSED] xe_gmdid_graphics_ip
[07:50:11] [PASSED] xe_gmdid_media_ip
[07:50:11] ===================== [PASSED] xe_pci ======================
[07:50:11] ========================= xe_rtp  ==========================
[07:50:11] ================== xe_rtp_process_tests  ===================
[07:50:11] [PASSED] coalesce-same-reg
[07:50:11] [PASSED] no-match-no-add
[07:50:11] [PASSED] no-match-no-add-multiple-rules
[07:50:11] [PASSED] two-regs-two-entries
[07:50:11] [PASSED] clr-one-set-other
[07:50:11] [PASSED] set-field
[07:50:11] [PASSED] conflict-duplicate
[07:50:11] [PASSED] conflict-not-disjoint
[07:50:11] [PASSED] conflict-reg-type
[07:50:11] ============== [PASSED] xe_rtp_process_tests ===============
[07:50:11] ===================== [PASSED] xe_rtp ======================
[07:50:11] ========================== xe_wa  ==========================
[07:50:11] ======================== xe_wa_gt  =========================
[07:50:11] [PASSED] TIGERLAKE (B0)
[07:50:11] [PASSED] DG1 (A0)
[07:50:11] [PASSED] DG1 (B0)
[07:50:11] [PASSED] ALDERLAKE_S (A0)
[07:50:11] [PASSED] ALDERLAKE_S (B0)
[07:50:11] [PASSED] ALDERLAKE_S (C0)
[07:50:11] [PASSED] ALDERLAKE_S (D0)
[07:50:11] [PASSED] ALDERLAKE_P (A0)
[07:50:11] [PASSED] ALDERLAKE_P (B0)
[07:50:11] [PASSED] ALDERLAKE_P (C0)
[07:50:11] [PASSED] ALDERLAKE_S_RPLS (D0)
[07:50:11] [PASSED] ALDERLAKE_P_RPLU (E0)
[07:50:11] [PASSED] DG2_G10 (A0)
[07:50:11] [PASSED] DG2_G10 (A1)
[07:50:11] [PASSED] DG2_G10 (B0)
[07:50:11] [PASSED] DG2_G10 (C0)
[07:50:11] [PASSED] DG2_G11 (A0)
[07:50:11] [PASSED] DG2_G11 (B0)
[07:50:11] [PASSED] DG2_G11 (B1)
[07:50:11] [PASSED] DG2_G12 (A0)
[07:50:11] [PASSED] DG2_G12 (A1)
[07:50:11] [PASSED] PVC (B0)
[07:50:11] [PASSED] PVC (B1)
[07:50:11] [PASSED] PVC (C0)
[07:50:11] ==================== [PASSED] xe_wa_gt =====================
[07:50:11] ====================== [PASSED] xe_wa ======================
[07:50:11] ============================================================
[07:50:11] Testing complete. Ran 39 tests: passed: 35, skipped: 4
[07:50:11] Elapsed time: 24.407s total, 4.195s configuring, 20.093s building, 0.100s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[07:50:12] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:50:13] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[07:50:32] Starting KUnit Kernel (1/1)...
[07:50:32] ============================================================
[07:50:32] ================== drm_test_pick_cmdline  ==================
[07:50:32] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[07:50:32] =============== drm_test_pick_cmdline_named  ===============
[07:50:32] [PASSED] NTSC
[07:50:32] [PASSED] NTSC-J
[07:50:32] [PASSED] PAL
[07:50:32] [PASSED] PAL-M
[07:50:32] =========== [PASSED] drm_test_pick_cmdline_named ===========
[07:50:32] ============== [PASSED] drm_test_pick_cmdline ==============
[07:50:32] ======================== drm_buddy  ========================
[07:50:32] [PASSED] drm_test_buddy_alloc_limit
[07:50:32] [PASSED] drm_test_buddy_alloc_range
[07:50:32] [PASSED] drm_test_buddy_alloc_optimistic
[07:50:32] [PASSED] drm_test_buddy_alloc_pessimistic
[07:50:32] [PASSED] drm_test_buddy_alloc_smoke
[07:50:32] [PASSED] drm_test_buddy_alloc_pathological
[07:50:32] ==================== [PASSED] drm_buddy ====================
[07:50:32] =================== drm_cmdline_parser  ====================
[07:50:32] [PASSED] drm_test_cmdline_force_d_only
[07:50:32] [PASSED] drm_test_cmdline_force_D_only_dvi
[07:50:32] [PASSED] drm_test_cmdline_force_D_only_hdmi
[07:50:32] [PASSED] drm_test_cmdline_force_D_only_not_digital
[07:50:32] [PASSED] drm_test_cmdline_force_e_only
[07:50:32] [PASSED] drm_test_cmdline_res
[07:50:32] [PASSED] drm_test_cmdline_res_vesa
[07:50:32] [PASSED] drm_test_cmdline_res_vesa_rblank
[07:50:32] [PASSED] drm_test_cmdline_res_rblank
[07:50:32] [PASSED] drm_test_cmdline_res_bpp
[07:50:32] [PASSED] drm_test_cmdline_res_refresh
[07:50:32] [PASSED] drm_test_cmdline_res_bpp_refresh
[07:50:32] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[07:50:32] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[07:50:32] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[07:50:32] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[07:50:32] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[07:50:32] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[07:50:32] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[07:50:32] [PASSED] drm_test_cmdline_res_margins_force_on
[07:50:32] [PASSED] drm_test_cmdline_res_vesa_margins
[07:50:32] [PASSED] drm_test_cmdline_name
[07:50:32] [PASSED] drm_test_cmdline_name_bpp
[07:50:32] [PASSED] drm_test_cmdline_name_option
[07:50:32] [PASSED] drm_test_cmdline_name_bpp_option
[07:50:32] [PASSED] drm_test_cmdline_rotate_0
[07:50:32] [PASSED] drm_test_cmdline_rotate_90
[07:50:32] [PASSED] drm_test_cmdline_rotate_180
[07:50:32] [PASSED] drm_test_cmdline_rotate_270
[07:50:32] [PASSED] drm_test_cmdline_hmirror
[07:50:32] [PASSED] drm_test_cmdline_vmirror
[07:50:32] [PASSED] drm_test_cmdline_margin_options
[07:50:32] [PASSED] drm_test_cmdline_multiple_options
[07:50:32] [PASSED] drm_test_cmdline_bpp_extra_and_option
[07:50:32] [PASSED] drm_test_cmdline_extra_and_option
[07:50:32] [PASSED] drm_test_cmdline_freestanding_options
[07:50:32] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[07:50:32] [PASSED] drm_test_cmdline_panel_orientation
[07:50:32] ================ drm_test_cmdline_invalid  =================
[07:50:32] [PASSED] margin_only
[07:50:32] [PASSED] interlace_only
[07:50:32] [PASSED] res_missing_x
[07:50:32] [PASSED] res_missing_y
[07:50:32] [PASSED] res_bad_y
[07:50:32] [PASSED] res_missing_y_bpp
[07:50:32] [PASSED] res_bad_bpp
[07:50:32] [PASSED] res_bad_refresh
[07:50:32] [PASSED] res_bpp_refresh_force_on_off
[07:50:32] [PASSED] res_invalid_mode
[07:50:32] [PASSED] res_bpp_wrong_place_mode
[07:50:32] [PASSED] name_bpp_refresh
[07:50:32] [PASSED] name_refresh
[07:50:32] [PASSED] name_refresh_wrong_mode
[07:50:32] [PASSED] name_refresh_invalid_mode
[07:50:32] [PASSED] rotate_multiple
[07:50:32] [PASSED] rotate_invalid_val
[07:50:32] [PASSED] rotate_truncated
[07:50:32] [PASSED] invalid_option
[07:50:32] [PASSED] invalid_tv_option
[07:50:32] [PASSED] truncated_tv_option
[07:50:32] ============ [PASSED] drm_test_cmdline_invalid =============
[07:50:32] =============== drm_test_cmdline_tv_options  ===============
[07:50:32] [PASSED] NTSC
[07:50:32] [PASSED] NTSC_443
[07:50:32] [PASSED] NTSC_J
[07:50:32] [PASSED] PAL
[07:50:32] [PASSED] PAL_M
[07:50:32] [PASSED] PAL_N
[07:50:32] [PASSED] SECAM
[07:50:32] =========== [PASSED] drm_test_cmdline_tv_options ===========
[07:50:32] =============== [PASSED] drm_cmdline_parser ================
[07:50:32] ================ drm_get_tv_mode_from_name  ================
[07:50:32] ========== drm_test_get_tv_mode_from_name_valid  ===========
[07:50:32] [PASSED] NTSC
[07:50:32] [PASSED] NTSC-443
[07:50:32] [PASSED] NTSC-J
[07:50:32] [PASSED] PAL
[07:50:32] [PASSED] PAL-M
[07:50:32] [PASSED] PAL-N
[07:50:32] [PASSED] SECAM
[07:50:32] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[07:50:32] [PASSED] drm_test_get_tv_mode_from_name_truncated
[07:50:32] ============ [PASSED] drm_get_tv_mode_from_name ============
[07:50:32] ==================== drm_damage_helper  ====================
[07:50:32] [PASSED] drm_test_damage_iter_no_damage
[07:50:32] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[07:50:32] [PASSED] drm_test_damage_iter_no_damage_src_moved
[07:50:32] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[07:50:32] [PASSED] drm_test_damage_iter_no_damage_not_visible
[07:50:32] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[07:50:32] [PASSED] drm_test_damage_iter_no_damage_no_fb
[07:50:32] [PASSED] drm_test_damage_iter_simple_damage
[07:50:32] [PASSED] drm_test_damage_iter_single_damage
[07:50:32] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[07:50:32] [PASSED] drm_test_damage_iter_single_damage_outside_src
[07:50:32] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[07:50:32] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[07:50:32] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[07:50:32] [PASSED] drm_test_damage_iter_single_damage_src_moved
[07:50:32] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[07:50:32] [PASSED] drm_test_damage_iter_damage
[07:50:32] [PASSED] drm_test_damage_iter_damage_one_intersect
[07:50:32] [PASSED] drm_test_damage_iter_damage_one_outside
[07:50:32] [PASSED] drm_test_damage_iter_damage_src_moved
[07:50:32] [PASSED] drm_test_damage_iter_damage_not_visible
[07:50:32] ================ [PASSED] drm_damage_helper ================
[07:50:32] ==================== drm_dp_mst_helper  ====================
[07:50:32] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[07:50:32] [PASSED] Clock 154000 BPP 30 DSC disabled
[07:50:32] [PASSED] Clock 234000 BPP 30 DSC disabled
[07:50:32] [PASSED] Clock 297000 BPP 24 DSC disabled
[07:50:32] [PASSED] Clock 332880 BPP 24 DSC enabled
[07:50:32] [PASSED] Clock 324540 BPP 24 DSC enabled
[07:50:32] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[07:50:32] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[07:50:32] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[07:50:32] [PASSED] DP_POWER_UP_PHY with port number
[07:50:32] [PASSED] DP_POWER_DOWN_PHY with port number
[07:50:32] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[07:50:32] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[07:50:32] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[07:50:32] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[07:50:32] [PASSED] DP_QUERY_PAYLOAD with port number
[07:50:32] [PASSED] DP_QUERY_PAYLOAD with VCPI
[07:50:32] [PASSED] DP_REMOTE_DPCD_READ with port number
[07:50:32] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[07:50:32] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[07:50:32] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[07:50:32] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[07:50:32] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[07:50:32] [PASSED] DP_REMOTE_I2C_READ with port number
[07:50:32] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[07:50:32] [PASSED] DP_REMOTE_I2C_READ with transactions array
[07:50:32] [PASSED] DP_REMOTE_I2C_WRITE with port number
[07:50:32] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[07:50:32] [PASSED] DP_REMOTE_I2C_WRITE with data array
[07:50:32] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[07:50:32] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[07:50:32] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[07:50:32] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[07:50:32] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[07:50:32] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[07:50:32] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[07:50:32] ================ [PASSED] drm_dp_mst_helper ================
[07:50:32] ================= drm_format_helper_test  ==================
[07:50:32] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[07:50:32] [PASSED] single_pixel_source_buffer
[07:50:32] [PASSED] single_pixel_clip_rectangle
[07:50:32] [PASSED] well_known_colors
[07:50:32] [PASSED] destination_pitch
[07:50:32] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[07:50:32] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[07:50:32] [PASSED] single_pixel_source_buffer
[07:50:32] [PASSED] single_pixel_clip_rectangle
[07:50:32] [PASSED] well_known_colors
[07:50:32] [PASSED] destination_pitch
[07:50:32] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[07:50:32] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[07:50:32] [PASSED] single_pixel_source_buffer
[07:50:32] [PASSED] single_pixel_clip_rectangle
[07:50:32] [PASSED] well_known_colors
[07:50:32] [PASSED] destination_pitch
[07:50:32] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[07:50:32] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[07:50:32] [PASSED] single_pixel_source_buffer
[07:50:32] [PASSED] single_pixel_clip_rectangle
[07:50:32] [PASSED] well_known_colors
[07:50:32] [PASSED] destination_pitch
[07:50:32] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[07:50:32] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[07:50:32] [PASSED] single_pixel_source_buffer
[07:50:32] [PASSED] single_pixel_clip_rectangle
[07:50:32] [PASSED] well_known_colors
[07:50:32] [PASSED] destination_pitch
[07:50:32] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[07:50:32] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[07:50:32] [PASSED] single_pixel_source_buffer
[07:50:32] [PASSED] single_pixel_clip_rectangle
[07:50:32] [PASSED] well_known_colors
[07:50:32] [PASSED] destination_pitch
[07:50:32] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[07:50:32] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[07:50:32] [PASSED] single_pixel_source_buffer
[07:50:32] [PASSED] single_pixel_clip_rectangle
[07:50:32] [PASSED] well_known_colors
[07:50:32] [PASSED] destination_pitch
[07:50:32] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[07:50:32] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[07:50:32] [PASSED] single_pixel_source_buffer
[07:50:32] [PASSED] single_pixel_clip_rectangle
[07:50:32] [PASSED] well_known_colors
[07:50:32] [PASSED] destination_pitch
[07:50:32] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[07:50:32] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[07:50:32] [PASSED] single_pixel_source_buffer
[07:50:32] [PASSED] single_pixel_clip_rectangle
[07:50:32] [PASSED] well_known_colors
[07:50:32] [PASSED] destination_pitch
[07:50:32] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[07:50:32] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[07:50:32] [PASSED] single_pixel_source_buffer
[07:50:32] [PASSED] single_pixel_clip_rectangle
[07:50:32] [PASSED] well_known_colors
[07:50:32] [PASSED] destination_pitch
[07:50:32] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[07:50:32] ============== drm_test_fb_xrgb8888_to_mono  ===============
[07:50:32] [PASSED] single_pixel_source_buffer
[07:50:32] [PASSED] single_pixel_clip_rectangle
[07:50:32] [PASSED] well_known_colors
[07:50:32] [PASSED] destination_pitch
[07:50:32] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[07:50:32] ==================== drm_test_fb_swab  =====================
[07:50:32] [PASSED] single_pixel_source_buffer
[07:50:32] [PASSED] single_pixel_clip_rectangle
[07:50:32] [PASSED] well_known_colors
[07:50:32] [PASSED] destination_pitch
[07:50:32] ================ [PASSED] drm_test_fb_swab =================
[07:50:32] ================= drm_test_fb_clip_offset  =================
[07:50:32] [PASSED] pass through
[07:50:32] [PASSED] horizontal offset
[07:50:32] [PASSED] vertical offset
[07:50:32] [PASSED] horizontal and vertical offset
[07:50:32] [PASSED] horizontal offset (custom pitch)
[07:50:32] [PASSED] vertical offset (custom pitch)
[07:50:32] [PASSED] horizontal and vertical offset (custom pitch)
[07:50:32] ============= [PASSED] drm_test_fb_clip_offset =============
[07:50:32] ============== drm_test_fb_build_fourcc_list  ==============
[07:50:32] [PASSED] no native formats
[07:50:32] [PASSED] XRGB8888 as native format
[07:50:32] [PASSED] remove duplicates
[07:50:32] [PASSED] convert alpha formats
[07:50:32] [PASSED] random formats
[07:50:32] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[07:50:32] =================== drm_test_fb_memcpy  ====================
[07:50:32] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[07:50:32] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[07:50:32] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[07:50:32] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[07:50:32] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[07:50:32] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[07:50:32] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[07:50:32] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[07:50:32] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[07:50:32] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[07:50:32] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[07:50:32] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[07:50:32] =============== [PASSED] drm_test_fb_memcpy ================
[07:50:32] ============= [PASSED] drm_format_helper_test ==============
[07:50:32] ======================= drm_format  ========================
[07:50:32] [PASSED] drm_test_format_block_width_invalid
[07:50:32] [PASSED] drm_test_format_block_width_one_plane
[07:50:32] [PASSED] drm_test_format_block_width_two_plane
[07:50:32] [PASSED] drm_test_format_block_width_three_plane
[07:50:32] [PASSED] drm_test_format_block_width_tiled
[07:50:32] [PASSED] drm_test_format_block_height_invalid
[07:50:32] [PASSED] drm_test_format_block_height_one_plane
[07:50:32] [PASSED] drm_test_format_block_height_two_plane
[07:50:32] [PASSED] drm_test_format_block_height_three_plane
[07:50:32] [PASSED] drm_test_format_block_height_tiled
[07:50:32] [PASSED] drm_test_format_min_pitch_invalid
[07:50:32] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[07:50:32] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[07:50:32] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[07:50:32] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[07:50:32] [PASSED] drm_test_format_min_pitch_two_plane
[07:50:32] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[07:50:32] [PASSED] drm_test_format_min_pitch_tiled
[07:50:32] =================== [PASSED] drm_format ====================
[07:50:32] ===================== drm_framebuffer  =====================
[07:50:32] =============== drm_test_framebuffer_create  ===============
[07:50:32] [PASSED] ABGR8888 normal sizes
[07:50:32] [PASSED] ABGR8888 max sizes
[07:50:32] [PASSED] ABGR8888 pitch greater than min required
[07:50:32] [PASSED] ABGR8888 pitch less than min required
[07:50:32] [PASSED] ABGR8888 Invalid width
[07:50:32] [PASSED] ABGR8888 Invalid buffer handle
[07:50:32] [PASSED] No pixel format
[07:50:32] [PASSED] ABGR8888 Width 0
[07:50:32] [PASSED] ABGR8888 Height 0
[07:50:32] [PASSED] ABGR8888 Out of bound height * pitch combination
[07:50:32] [PASSED] ABGR8888 Large buffer offset
[07:50:32] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[07:50:32] [PASSED] ABGR8888 Valid buffer modifier
[07:50:32] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[07:50:32] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[07:50:32] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[07:50:32] [PASSED] NV12 Normal sizes
[07:50:32] [PASSED] NV12 Max sizes
[07:50:32] [PASSED] NV12 Invalid pitch
[07:50:32] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[07:50:32] [PASSED] NV12 different  modifier per-plane
[07:50:32] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[07:50:32] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[07:50:32] [PASSED] NV12 Modifier for inexistent plane
[07:50:32] [PASSED] NV12 Handle for inexistent plane
[07:50:32] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[07:50:32] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[07:50:32] [PASSED] YVU420 Normal sizes
[07:50:32] [PASSED] YVU420 Max sizes
[07:50:32] [PASSED] YVU420 Invalid pitch
[07:50:32] [PASSED] YVU420 Different pitches
[07:50:32] [PASSED] YVU420 Different buffer offsets/pitches
[07:50:32] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[07:50:32] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[07:50:32] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[07:50:32] [PASSED] YVU420 Valid modifier
[07:50:32] [PASSED] YVU420 Different modifiers per plane
[07:50:32] [PASSED] YVU420 Modifier for inexistent plane
[07:50:32] [PASSED] X0L2 Normal sizes
[07:50:32] [PASSED] X0L2 Max sizes
[07:50:32] [PASSED] X0L2 Invalid pitch
[07:50:32] [PASSED] X0L2 Pitch greater than minimum required
[07:50:32] [PASSED] X0L2 Handle for inexistent plane
[07:50:32] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[07:50:32] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[07:50:32] [PASSED] X0L2 Valid modifier
[07:50:32] [PASSED] X0L2 Modifier for inexistent plane
[07:50:32] =========== [PASSED] drm_test_framebuffer_create ===========
[07:50:32] ================= [PASSED] drm_framebuffer =================
[07:50:32] ==================== drm-test-managed  =====================
[07:50:32] [PASSED] drm_test_managed_run_action
[07:50:32] ================ [PASSED] drm-test-managed =================
[07:50:32] ========================= drm_mm  ==========================
[07:50:32] [PASSED] drm_test_mm_init
[07:50:32] [PASSED] drm_test_mm_debug
[07:50:43] [PASSED] drm_test_mm_reserve
[07:50:53] [PASSED] drm_test_mm_insert
[07:50:54] [PASSED] drm_test_mm_replace
[07:50:54] [PASSED] drm_test_mm_insert_range
[07:50:54] [PASSED] drm_test_mm_frag
[07:50:54] [PASSED] drm_test_mm_align
[07:50:54] [PASSED] drm_test_mm_align32
[07:50:54] [PASSED] drm_test_mm_align64
[07:50:54] [PASSED] drm_test_mm_evict
[07:50:54] [PASSED] drm_test_mm_evict_range
[07:50:54] [PASSED] drm_test_mm_topdown
[07:50:54] [PASSED] drm_test_mm_bottomup
[07:50:54] [PASSED] drm_test_mm_lowest
[07:50:55] [PASSED] drm_test_mm_highest
[07:50:55] [PASSED] drm_test_mm_color
[07:50:56] [PASSED] drm_test_mm_color_evict
[07:50:56] [PASSED] drm_test_mm_color_evict_range
[07:50:56] ===================== [PASSED] drm_mm ======================
[07:50:56] =================== drm_modes_analog_tv  ===================
[07:50:56] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[07:50:56] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[07:50:56] [PASSED] drm_test_modes_analog_tv_pal_576i
[07:50:56] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[07:50:56] =============== [PASSED] drm_modes_analog_tv ===============
[07:50:56] ==================== drm_plane_helper  =====================
[07:50:56] =============== drm_test_check_plane_state  ================
[07:50:56] [PASSED] clipping_simple
[07:50:56] [PASSED] clipping_rotate_reflect
[07:50:56] [PASSED] positioning_simple
[07:50:56] [PASSED] upscaling
[07:50:56] [PASSED] downscaling
[07:50:56] [PASSED] rounding1
[07:50:56] [PASSED] rounding2
[07:50:56] [PASSED] rounding3
[07:50:56] [PASSED] rounding4
[07:50:56] =========== [PASSED] drm_test_check_plane_state ============
[07:50:56] =========== drm_test_check_invalid_plane_state  ============
[07:50:56] [PASSED] positioning_invalid
[07:50:56] [PASSED] upscaling_invalid
[07:50:56] [PASSED] downscaling_invalid
[07:50:56] ======= [PASSED] drm_test_check_invalid_plane_state ========
[07:50:56] ================ [PASSED] drm_plane_helper =================
[07:50:56] ============ drm_connector_helper_tv_get_modes  ============
[07:50:56] ====== drm_test_connector_helper_tv_get_modes_check  =======
[07:50:56] [PASSED] None
[07:50:56] [PASSED] PAL
[07:50:56] [PASSED] NTSC
[07:50:56] [PASSED] Both, NTSC Default
[07:50:56] [PASSED] Both, PAL Default
[07:50:56] [PASSED] Both, NTSC Default, with PAL on command-line
[07:50:56] [PASSED] Both, PAL Default, with NTSC on command-line
[07:50:56] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[07:50:56] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[07:50:56] ======================== drm_rect  =========================
[07:50:56] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[07:50:56] [PASSED] drm_test_rect_clip_scaled_not_clipped
[07:50:56] [PASSED] drm_test_rect_clip_scaled_clipped
[07:50:56] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[07:50:56] ================= drm_test_rect_intersect  =================
[07:50:56] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[07:50:56] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[07:50:56] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[07:50:56] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[07:50:56] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[07:50:56] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[07:50:56] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[07:50:56] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[07:50:56] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[07:50:56] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[07:50:56] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[07:50:56] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[07:50:56] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[07:50:56] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[07:50:56] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[07:50:56] ============= [PASSED] drm_test_rect_intersect =============
[07:50:56] ================ drm_test_rect_calc_hscale  ================
[07:50:56] [PASSED] normal use
[07:50:56] [PASSED] out of max range
[07:50:56] [PASSED] out of min range
[07:50:56] [PASSED] zero dst
[07:50:56] [PASSED] negative src
[07:50:56] [PASSED] negative dst
[07:50:56] ============ [PASSED] drm_test_rect_calc_hscale ============
[07:50:56] ================ drm_test_rect_calc_vscale  ================
[07:50:56] [PASSED] normal use
[07:50:56] [PASSED] out of max range
[07:50:56] [PASSED] out of min range
[07:50:56] [PASSED] zero dst
[07:50:56] [PASSED] negative src
[07:50:56] [PASSED] negative dst
[07:50:56] ============ [PASSED] drm_test_rect_calc_vscale ============
[07:50:56] ================== drm_test_rect_rotate  ===================
[07:50:56] [PASSED] reflect-x
[07:50:56] [PASSED] reflect-y
[07:50:56] [PASSED] rotate-0
[07:50:56] [PASSED] rotate-90
[07:50:56] [PASSED] rotate-180
[07:50:56] [PASSED] rotate-270
[07:50:56] ============== [PASSED] drm_test_rect_rotate ===============
[07:50:56] ================ drm_test_rect_rotate_inv  =================
[07:50:56] [PASSED] reflect-x
[07:50:56] [PASSED] reflect-y
[07:50:56] [PASSED] rotate-0
[07:50:56] [PASSED] rotate-90
[07:50:56] [PASSED] rotate-180
[07:50:56] [PASSED] rotate-270
[07:50:56] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[07:50:56] ==================== [PASSED] drm_rect =====================
[07:50:56] ======================== drm_exec  =========================
[07:50:56] [PASSED] sanitycheck
[07:50:56] [PASSED] test_lock
[07:50:56] [PASSED] test_lock_unlock
[07:50:56] [PASSED] test_duplicates
[07:50:56] [PASSED] test_prepare
[07:50:56] [PASSED] test_prepare_array
[07:50:56] [PASSED] test_multiple_loops
[07:50:56] ==================== [PASSED] drm_exec =====================
[07:50:56] ============================================================
[07:50:56] Testing complete. Ran 368 tests: passed: 368
[07:50:56] Elapsed time: 44.371s total, 1.655s configuring, 18.935s building, 23.777s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


