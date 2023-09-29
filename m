Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E5AE77347
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 23:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0404410E0F7;
	Fri, 29 Sep 2023 23:11:14 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2C69110E0F7;
 Fri, 29 Sep 2023 23:11:12 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 29F36AADDD;
 Fri, 29 Sep 2023 23:11:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Fri, 29 Sep 2023 23:11:12 -0000
Message-ID: <169602907216.19496.10704097661678790536@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230929210130.1203203-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230929210130.1203203-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_series_?=
 =?utf-8?q?starting_with_=5B1/3=5D_drm/xe=3A_Kill_xe=5Fbo=5Fdoc=2Eh?=
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

Series: series starting with [1/3] drm/xe: Kill xe_bo_doc.h
URL   : https://patchwork.freedesktop.org/series/124476/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[23:10:00] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:10:04] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[23:10:24] Starting KUnit Kernel (1/1)...
[23:10:24] ============================================================
[23:10:24] ========================== xe_bo  ==========================
[23:10:24] [SKIPPED] xe_ccs_migrate_kunit
[23:10:24] [SKIPPED] xe_bo_evict_kunit
[23:10:24] ===================== [SKIPPED] xe_bo ======================
[23:10:24] ======================= xe_dma_buf  ========================
[23:10:24] [SKIPPED] xe_dma_buf_kunit
[23:10:24] =================== [SKIPPED] xe_dma_buf ===================
[23:10:24] ======================= xe_migrate  ========================
[23:10:24] [SKIPPED] xe_migrate_sanity_kunit
[23:10:24] =================== [SKIPPED] xe_migrate ===================
[23:10:24] ========================= xe_pci  ==========================
[23:10:24] [PASSED] xe_gmdid_graphics_ip
[23:10:24] [PASSED] xe_gmdid_media_ip
[23:10:24] ===================== [PASSED] xe_pci ======================
[23:10:24] ========================= xe_rtp  ==========================
[23:10:24] ================== xe_rtp_process_tests  ===================
[23:10:24] [PASSED] coalesce-same-reg
[23:10:24] [PASSED] no-match-no-add
[23:10:24] [PASSED] no-match-no-add-multiple-rules
[23:10:24] [PASSED] two-regs-two-entries
[23:10:24] [PASSED] clr-one-set-other
[23:10:24] [PASSED] set-field
[23:10:24] [PASSED] conflict-duplicate
[23:10:24] [PASSED] conflict-not-disjoint
[23:10:24] [PASSED] conflict-reg-type
[23:10:24] ============== [PASSED] xe_rtp_process_tests ===============
[23:10:24] ===================== [PASSED] xe_rtp ======================
[23:10:24] ========================== xe_wa  ==========================
[23:10:24] ======================== xe_wa_gt  =========================
[23:10:24] [PASSED] TIGERLAKE (B0)
[23:10:24] [PASSED] DG1 (A0)
[23:10:24] [PASSED] DG1 (B0)
[23:10:24] [PASSED] ALDERLAKE_S (A0)
[23:10:24] [PASSED] ALDERLAKE_S (B0)
[23:10:24] [PASSED] ALDERLAKE_S (C0)
[23:10:24] [PASSED] ALDERLAKE_S (D0)
[23:10:24] [PASSED] ALDERLAKE_P (A0)
[23:10:24] [PASSED] ALDERLAKE_P (B0)
[23:10:24] [PASSED] ALDERLAKE_P (C0)
[23:10:24] [PASSED] DG2_G10 (A0)
[23:10:24] [PASSED] DG2_G10 (A1)
[23:10:24] [PASSED] DG2_G10 (B0)
[23:10:24] [PASSED] DG2_G10 (C0)
[23:10:24] [PASSED] DG2_G11 (A0)
[23:10:24] [PASSED] DG2_G11 (B0)
[23:10:24] [PASSED] DG2_G11 (B1)
[23:10:24] [PASSED] DG2_G12 (A0)
[23:10:24] [PASSED] DG2_G12 (A1)
[23:10:24] [PASSED] PVC (B0)
[23:10:24] [PASSED] PVC (B1)
[23:10:24] [PASSED] PVC (C0)
[23:10:24] ==================== [PASSED] xe_wa_gt =====================
[23:10:24] ====================== [PASSED] xe_wa ======================
[23:10:24] ============================================================
[23:10:24] Testing complete. Ran 37 tests: passed: 33, skipped: 4
[23:10:24] Elapsed time: 24.314s total, 4.188s configuring, 19.956s building, 0.138s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[23:10:25] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:10:26] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[23:10:45] Starting KUnit Kernel (1/1)...
[23:10:45] ============================================================
[23:10:45] ================== drm_test_pick_cmdline  ==================
[23:10:45] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[23:10:45] =============== drm_test_pick_cmdline_named  ===============
[23:10:45] [PASSED] NTSC
[23:10:45] [PASSED] NTSC-J
[23:10:45] [PASSED] PAL
[23:10:45] [PASSED] PAL-M
[23:10:45] =========== [PASSED] drm_test_pick_cmdline_named ===========
[23:10:45] ============== [PASSED] drm_test_pick_cmdline ==============
[23:10:45] ======================== drm_buddy  ========================
[23:10:45] [PASSED] drm_test_buddy_alloc_limit
[23:10:45] [PASSED] drm_test_buddy_alloc_range
[23:10:45] [PASSED] drm_test_buddy_alloc_optimistic
[23:10:45] [PASSED] drm_test_buddy_alloc_pessimistic
[23:10:45] [PASSED] drm_test_buddy_alloc_smoke
[23:10:45] [PASSED] drm_test_buddy_alloc_pathological
[23:10:45] ==================== [PASSED] drm_buddy ====================
[23:10:45] =================== drm_cmdline_parser  ====================
[23:10:45] [PASSED] drm_test_cmdline_force_d_only
[23:10:45] [PASSED] drm_test_cmdline_force_D_only_dvi
[23:10:45] [PASSED] drm_test_cmdline_force_D_only_hdmi
[23:10:45] [PASSED] drm_test_cmdline_force_D_only_not_digital
[23:10:45] [PASSED] drm_test_cmdline_force_e_only
[23:10:45] [PASSED] drm_test_cmdline_res
[23:10:45] [PASSED] drm_test_cmdline_res_vesa
[23:10:45] [PASSED] drm_test_cmdline_res_vesa_rblank
[23:10:45] [PASSED] drm_test_cmdline_res_rblank
[23:10:45] [PASSED] drm_test_cmdline_res_bpp
[23:10:45] [PASSED] drm_test_cmdline_res_refresh
[23:10:45] [PASSED] drm_test_cmdline_res_bpp_refresh
[23:10:45] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[23:10:45] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[23:10:45] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[23:10:45] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[23:10:45] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[23:10:45] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[23:10:45] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[23:10:45] [PASSED] drm_test_cmdline_res_margins_force_on
[23:10:45] [PASSED] drm_test_cmdline_res_vesa_margins
[23:10:45] [PASSED] drm_test_cmdline_name
[23:10:45] [PASSED] drm_test_cmdline_name_bpp
[23:10:45] [PASSED] drm_test_cmdline_name_option
[23:10:45] [PASSED] drm_test_cmdline_name_bpp_option
[23:10:45] [PASSED] drm_test_cmdline_rotate_0
[23:10:45] [PASSED] drm_test_cmdline_rotate_90
[23:10:45] [PASSED] drm_test_cmdline_rotate_180
[23:10:45] [PASSED] drm_test_cmdline_rotate_270
[23:10:45] [PASSED] drm_test_cmdline_hmirror
[23:10:46] [PASSED] drm_test_cmdline_vmirror
[23:10:46] [PASSED] drm_test_cmdline_margin_options
[23:10:46] [PASSED] drm_test_cmdline_multiple_options
[23:10:46] [PASSED] drm_test_cmdline_bpp_extra_and_option
[23:10:46] [PASSED] drm_test_cmdline_extra_and_option
[23:10:46] [PASSED] drm_test_cmdline_freestanding_options
[23:10:46] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[23:10:46] [PASSED] drm_test_cmdline_panel_orientation
[23:10:46] ================ drm_test_cmdline_invalid  =================
[23:10:46] [PASSED] margin_only
[23:10:46] [PASSED] interlace_only
[23:10:46] [PASSED] res_missing_x
[23:10:46] [PASSED] res_missing_y
[23:10:46] [PASSED] res_bad_y
[23:10:46] [PASSED] res_missing_y_bpp
[23:10:46] [PASSED] res_bad_bpp
[23:10:46] [PASSED] res_bad_refresh
[23:10:46] [PASSED] res_bpp_refresh_force_on_off
[23:10:46] [PASSED] res_invalid_mode
[23:10:46] [PASSED] res_bpp_wrong_place_mode
[23:10:46] [PASSED] name_bpp_refresh
[23:10:46] [PASSED] name_refresh
[23:10:46] [PASSED] name_refresh_wrong_mode
[23:10:46] [PASSED] name_refresh_invalid_mode
[23:10:46] [PASSED] rotate_multiple
[23:10:46] [PASSED] rotate_invalid_val
[23:10:46] [PASSED] rotate_truncated
[23:10:46] [PASSED] invalid_option
[23:10:46] [PASSED] invalid_tv_option
[23:10:46] [PASSED] truncated_tv_option
[23:10:46] ============ [PASSED] drm_test_cmdline_invalid =============
[23:10:46] =============== drm_test_cmdline_tv_options  ===============
[23:10:46] [PASSED] NTSC
[23:10:46] [PASSED] NTSC_443
[23:10:46] [PASSED] NTSC_J
[23:10:46] [PASSED] PAL
[23:10:46] [PASSED] PAL_M
[23:10:46] [PASSED] PAL_N
[23:10:46] [PASSED] SECAM
[23:10:46] =========== [PASSED] drm_test_cmdline_tv_options ===========
[23:10:46] =============== [PASSED] drm_cmdline_parser ================
[23:10:46] ================ drm_get_tv_mode_from_name  ================
[23:10:46] ========== drm_test_get_tv_mode_from_name_valid  ===========
[23:10:46] [PASSED] NTSC
[23:10:46] [PASSED] NTSC-443
[23:10:46] [PASSED] NTSC-J
[23:10:46] [PASSED] PAL
[23:10:46] [PASSED] PAL-M
[23:10:46] [PASSED] PAL-N
[23:10:46] [PASSED] SECAM
[23:10:46] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[23:10:46] [PASSED] drm_test_get_tv_mode_from_name_truncated
[23:10:46] ============ [PASSED] drm_get_tv_mode_from_name ============
[23:10:46] ==================== drm_damage_helper  ====================
[23:10:46] [PASSED] drm_test_damage_iter_no_damage
[23:10:46] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[23:10:46] [PASSED] drm_test_damage_iter_no_damage_src_moved
[23:10:46] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[23:10:46] [PASSED] drm_test_damage_iter_no_damage_not_visible
[23:10:46] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[23:10:46] [PASSED] drm_test_damage_iter_no_damage_no_fb
[23:10:46] [PASSED] drm_test_damage_iter_simple_damage
[23:10:46] [PASSED] drm_test_damage_iter_single_damage
[23:10:46] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[23:10:46] [PASSED] drm_test_damage_iter_single_damage_outside_src
[23:10:46] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[23:10:46] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[23:10:46] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[23:10:46] [PASSED] drm_test_damage_iter_single_damage_src_moved
[23:10:46] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[23:10:46] [PASSED] drm_test_damage_iter_damage
[23:10:46] [PASSED] drm_test_damage_iter_damage_one_intersect
[23:10:46] [PASSED] drm_test_damage_iter_damage_one_outside
[23:10:46] [PASSED] drm_test_damage_iter_damage_src_moved
[23:10:46] [PASSED] drm_test_damage_iter_damage_not_visible
[23:10:46] ================ [PASSED] drm_damage_helper ================
[23:10:46] ==================== drm_dp_mst_helper  ====================
[23:10:46] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[23:10:46] [PASSED] Clock 154000 BPP 30 DSC disabled
[23:10:46] [PASSED] Clock 234000 BPP 30 DSC disabled
[23:10:46] [PASSED] Clock 297000 BPP 24 DSC disabled
[23:10:46] [PASSED] Clock 332880 BPP 24 DSC enabled
[23:10:46] [PASSED] Clock 324540 BPP 24 DSC enabled
[23:10:46] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[23:10:46] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[23:10:46] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[23:10:46] [PASSED] DP_POWER_UP_PHY with port number
[23:10:46] [PASSED] DP_POWER_DOWN_PHY with port number
[23:10:46] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[23:10:46] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[23:10:46] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[23:10:46] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[23:10:46] [PASSED] DP_QUERY_PAYLOAD with port number
[23:10:46] [PASSED] DP_QUERY_PAYLOAD with VCPI
[23:10:46] [PASSED] DP_REMOTE_DPCD_READ with port number
[23:10:46] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[23:10:46] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[23:10:46] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[23:10:46] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[23:10:46] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[23:10:46] [PASSED] DP_REMOTE_I2C_READ with port number
[23:10:46] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[23:10:46] [PASSED] DP_REMOTE_I2C_READ with transactions array
[23:10:46] [PASSED] DP_REMOTE_I2C_WRITE with port number
[23:10:46] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[23:10:46] [PASSED] DP_REMOTE_I2C_WRITE with data array
[23:10:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[23:10:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[23:10:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[23:10:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[23:10:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[23:10:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[23:10:46] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[23:10:46] ================ [PASSED] drm_dp_mst_helper ================
[23:10:46] ================= drm_format_helper_test  ==================
[23:10:46] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[23:10:46] [PASSED] single_pixel_source_buffer
[23:10:46] [PASSED] single_pixel_clip_rectangle
[23:10:46] [PASSED] well_known_colors
[23:10:46] [PASSED] destination_pitch
[23:10:46] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[23:10:46] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[23:10:46] [PASSED] single_pixel_source_buffer
[23:10:46] [PASSED] single_pixel_clip_rectangle
[23:10:46] [PASSED] well_known_colors
[23:10:46] [PASSED] destination_pitch
[23:10:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[23:10:46] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[23:10:46] [PASSED] single_pixel_source_buffer
[23:10:46] [PASSED] single_pixel_clip_rectangle
[23:10:46] [PASSED] well_known_colors
[23:10:46] [PASSED] destination_pitch
[23:10:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[23:10:46] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[23:10:46] [PASSED] single_pixel_source_buffer
[23:10:46] [PASSED] single_pixel_clip_rectangle
[23:10:46] [PASSED] well_known_colors
[23:10:46] [PASSED] destination_pitch
[23:10:46] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[23:10:46] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[23:10:46] [PASSED] single_pixel_source_buffer
[23:10:46] [PASSED] single_pixel_clip_rectangle
[23:10:46] [PASSED] well_known_colors
[23:10:46] [PASSED] destination_pitch
[23:10:46] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[23:10:46] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[23:10:46] [PASSED] single_pixel_source_buffer
[23:10:46] [PASSED] single_pixel_clip_rectangle
[23:10:46] [PASSED] well_known_colors
[23:10:46] [PASSED] destination_pitch
[23:10:46] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[23:10:46] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[23:10:46] [PASSED] single_pixel_source_buffer
[23:10:46] [PASSED] single_pixel_clip_rectangle
[23:10:46] [PASSED] well_known_colors
[23:10:46] [PASSED] destination_pitch
[23:10:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[23:10:46] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[23:10:46] [PASSED] single_pixel_source_buffer
[23:10:46] [PASSED] single_pixel_clip_rectangle
[23:10:46] [PASSED] well_known_colors
[23:10:46] [PASSED] destination_pitch
[23:10:46] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[23:10:46] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[23:10:46] [PASSED] single_pixel_source_buffer
[23:10:46] [PASSED] single_pixel_clip_rectangle
[23:10:46] [PASSED] well_known_colors
[23:10:46] [PASSED] destination_pitch
[23:10:46] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[23:10:46] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[23:10:46] [PASSED] single_pixel_source_buffer
[23:10:46] [PASSED] single_pixel_clip_rectangle
[23:10:46] [PASSED] well_known_colors
[23:10:46] [PASSED] destination_pitch
[23:10:46] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[23:10:46] ============== drm_test_fb_xrgb8888_to_mono  ===============
[23:10:46] [PASSED] single_pixel_source_buffer
[23:10:46] [PASSED] single_pixel_clip_rectangle
[23:10:46] [PASSED] well_known_colors
[23:10:46] [PASSED] destination_pitch
[23:10:46] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[23:10:46] ==================== drm_test_fb_swab  =====================
[23:10:46] [PASSED] single_pixel_source_buffer
[23:10:46] [PASSED] single_pixel_clip_rectangle
[23:10:46] [PASSED] well_known_colors
[23:10:46] [PASSED] destination_pitch
[23:10:46] ================ [PASSED] drm_test_fb_swab =================
[23:10:46] ================= drm_test_fb_clip_offset  =================
[23:10:46] [PASSED] pass through
[23:10:46] [PASSED] horizontal offset
[23:10:46] [PASSED] vertical offset
[23:10:46] [PASSED] horizontal and vertical offset
[23:10:46] [PASSED] horizontal offset (custom pitch)
[23:10:46] [PASSED] vertical offset (custom pitch)
[23:10:46] [PASSED] horizontal and vertical offset (custom pitch)
[23:10:46] ============= [PASSED] drm_test_fb_clip_offset =============
[23:10:46] ============== drm_test_fb_build_fourcc_list  ==============
[23:10:46] [PASSED] no native formats
[23:10:46] [PASSED] XRGB8888 as native format
[23:10:46] [PASSED] remove duplicates
[23:10:46] [PASSED] convert alpha formats
[23:10:46] [PASSED] random formats
[23:10:46] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[23:10:46] =================== drm_test_fb_memcpy  ====================
[23:10:46] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[23:10:46] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[23:10:46] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[23:10:46] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[23:10:46] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[23:10:46] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[23:10:46] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[23:10:46] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[23:10:46] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[23:10:46] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[23:10:46] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[23:10:46] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[23:10:46] =============== [PASSED] drm_test_fb_memcpy ================
[23:10:46] ============= [PASSED] drm_format_helper_test ==============
[23:10:46] ======================= drm_format  ========================
[23:10:46] [PASSED] drm_test_format_block_width_invalid
[23:10:46] [PASSED] drm_test_format_block_width_one_plane
[23:10:46] [PASSED] drm_test_format_block_width_two_plane
[23:10:46] [PASSED] drm_test_format_block_width_three_plane
[23:10:46] [PASSED] drm_test_format_block_width_tiled
[23:10:46] [PASSED] drm_test_format_block_height_invalid
[23:10:46] [PASSED] drm_test_format_block_height_one_plane
[23:10:46] [PASSED] drm_test_format_block_height_two_plane
[23:10:46] [PASSED] drm_test_format_block_height_three_plane
[23:10:46] [PASSED] drm_test_format_block_height_tiled
[23:10:46] [PASSED] drm_test_format_min_pitch_invalid
[23:10:46] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[23:10:46] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[23:10:46] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[23:10:46] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[23:10:46] [PASSED] drm_test_format_min_pitch_two_plane
[23:10:46] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[23:10:46] [PASSED] drm_test_format_min_pitch_tiled
[23:10:46] =================== [PASSED] drm_format ====================
[23:10:46] ===================== drm_framebuffer  =====================
[23:10:46] =============== drm_test_framebuffer_create  ===============
[23:10:46] [PASSED] ABGR8888 normal sizes
[23:10:46] [PASSED] ABGR8888 max sizes
[23:10:46] [PASSED] ABGR8888 pitch greater than min required
[23:10:46] [PASSED] ABGR8888 pitch less than min required
[23:10:46] [PASSED] ABGR8888 Invalid width
[23:10:46] [PASSED] ABGR8888 Invalid buffer handle
[23:10:46] [PASSED] No pixel format
[23:10:46] [PASSED] ABGR8888 Width 0
[23:10:46] [PASSED] ABGR8888 Height 0
[23:10:46] [PASSED] ABGR8888 Out of bound height * pitch combination
[23:10:46] [PASSED] ABGR8888 Large buffer offset
[23:10:46] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[23:10:46] [PASSED] ABGR8888 Valid buffer modifier
[23:10:46] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[23:10:46] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[23:10:46] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[23:10:46] [PASSED] NV12 Normal sizes
[23:10:46] [PASSED] NV12 Max sizes
[23:10:46] [PASSED] NV12 Invalid pitch
[23:10:46] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[23:10:46] [PASSED] NV12 different  modifier per-plane
[23:10:46] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[23:10:46] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[23:10:46] [PASSED] NV12 Modifier for inexistent plane
[23:10:46] [PASSED] NV12 Handle for inexistent plane
[23:10:46] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[23:10:46] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[23:10:46] [PASSED] YVU420 Normal sizes
[23:10:46] [PASSED] YVU420 Max sizes
[23:10:46] [PASSED] YVU420 Invalid pitch
[23:10:46] [PASSED] YVU420 Different pitches
[23:10:46] [PASSED] YVU420 Different buffer offsets/pitches
[23:10:46] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[23:10:46] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[23:10:46] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[23:10:46] [PASSED] YVU420 Valid modifier
[23:10:46] [PASSED] YVU420 Different modifiers per plane
[23:10:46] [PASSED] YVU420 Modifier for inexistent plane
[23:10:46] [PASSED] X0L2 Normal sizes
[23:10:46] [PASSED] X0L2 Max sizes
[23:10:46] [PASSED] X0L2 Invalid pitch
[23:10:46] [PASSED] X0L2 Pitch greater than minimum required
[23:10:46] [PASSED] X0L2 Handle for inexistent plane
[23:10:46] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[23:10:46] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[23:10:46] [PASSED] X0L2 Valid modifier
[23:10:46] [PASSED] X0L2 Modifier for inexistent plane
[23:10:46] =========== [PASSED] drm_test_framebuffer_create ===========
[23:10:46] ================= [PASSED] drm_framebuffer =================
[23:10:46] ==================== drm-test-managed  =====================
[23:10:46] [PASSED] drm_test_managed_run_action
[23:10:46] ================ [PASSED] drm-test-managed =================
[23:10:46] ========================= drm_mm  ==========================
[23:10:46] [PASSED] drm_test_mm_init
[23:10:46] [PASSED] drm_test_mm_debug
[23:10:56] [PASSED] drm_test_mm_reserve
[23:11:06] [PASSED] drm_test_mm_insert
[23:11:07] [PASSED] drm_test_mm_replace
[23:11:07] [PASSED] drm_test_mm_insert_range
[23:11:07] [PASSED] drm_test_mm_frag
[23:11:07] [PASSED] drm_test_mm_align
[23:11:07] [PASSED] drm_test_mm_align32
[23:11:08] [PASSED] drm_test_mm_align64
[23:11:08] [PASSED] drm_test_mm_evict
[23:11:08] [PASSED] drm_test_mm_evict_range
[23:11:08] [PASSED] drm_test_mm_topdown
[23:11:08] [PASSED] drm_test_mm_bottomup
[23:11:08] [PASSED] drm_test_mm_lowest
[23:11:08] [PASSED] drm_test_mm_highest
[23:11:09] [PASSED] drm_test_mm_color
[23:11:09] [PASSED] drm_test_mm_color_evict
[23:11:09] [PASSED] drm_test_mm_color_evict_range
[23:11:09] ===================== [PASSED] drm_mm ======================
[23:11:09] =================== drm_modes_analog_tv  ===================
[23:11:09] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[23:11:09] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[23:11:09] [PASSED] drm_test_modes_analog_tv_pal_576i
[23:11:09] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[23:11:09] =============== [PASSED] drm_modes_analog_tv ===============
[23:11:09] ==================== drm_plane_helper  =====================
[23:11:09] =============== drm_test_check_plane_state  ================
[23:11:09] [PASSED] clipping_simple
[23:11:09] [PASSED] clipping_rotate_reflect
[23:11:09] [PASSED] positioning_simple
[23:11:09] [PASSED] upscaling
[23:11:09] [PASSED] downscaling
[23:11:09] [PASSED] rounding1
[23:11:09] [PASSED] rounding2
[23:11:09] [PASSED] rounding3
[23:11:09] [PASSED] rounding4
[23:11:09] =========== [PASSED] drm_test_check_plane_state ============
[23:11:09] =========== drm_test_check_invalid_plane_state  ============
[23:11:09] [PASSED] positioning_invalid
[23:11:09] [PASSED] upscaling_invalid
[23:11:09] [PASSED] downscaling_invalid
[23:11:09] ======= [PASSED] drm_test_check_invalid_plane_state ========
[23:11:09] ================ [PASSED] drm_plane_helper =================
[23:11:09] ============ drm_connector_helper_tv_get_modes  ============
[23:11:09] ====== drm_test_connector_helper_tv_get_modes_check  =======
[23:11:09] [PASSED] None
[23:11:09] [PASSED] PAL
[23:11:09] [PASSED] NTSC
[23:11:09] [PASSED] Both, NTSC Default
[23:11:09] [PASSED] Both, PAL Default
[23:11:09] [PASSED] Both, NTSC Default, with PAL on command-line
[23:11:09] [PASSED] Both, PAL Default, with NTSC on command-line
[23:11:09] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[23:11:09] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[23:11:09] ======================== drm_rect  =========================
[23:11:09] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[23:11:09] [PASSED] drm_test_rect_clip_scaled_not_clipped
[23:11:09] [PASSED] drm_test_rect_clip_scaled_clipped
[23:11:09] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[23:11:09] ================= drm_test_rect_intersect  =================
[23:11:09] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[23:11:09] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[23:11:09] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[23:11:09] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[23:11:09] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[23:11:09] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[23:11:09] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[23:11:09] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[23:11:09] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[23:11:09] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[23:11:09] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[23:11:09] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[23:11:09] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[23:11:09] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[23:11:09] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[23:11:09] ============= [PASSED] drm_test_rect_intersect =============
[23:11:09] ================ drm_test_rect_calc_hscale  ================
[23:11:09] [PASSED] normal use
[23:11:09] [PASSED] out of max range
[23:11:09] [PASSED] out of min range
[23:11:09] [PASSED] zero dst
[23:11:09] [PASSED] negative src
[23:11:09] [PASSED] negative dst
[23:11:09] ============ [PASSED] drm_test_rect_calc_hscale ============
[23:11:09] ================ drm_test_rect_calc_vscale  ================
[23:11:09] [PASSED] normal use
[23:11:09] [PASSED] out of max range
[23:11:09] [PASSED] out of min range
[23:11:09] [PASSED] zero dst
[23:11:09] [PASSED] negative src
[23:11:09] [PASSED] negative dst
[23:11:09] ============ [PASSED] drm_test_rect_calc_vscale ============
[23:11:09] ================== drm_test_rect_rotate  ===================
[23:11:09] [PASSED] reflect-x
[23:11:09] [PASSED] reflect-y
[23:11:09] [PASSED] rotate-0
[23:11:09] [PASSED] rotate-90
[23:11:09] [PASSED] rotate-180
[23:11:09] [PASSED] rotate-270
[23:11:09] ============== [PASSED] drm_test_rect_rotate ===============
[23:11:09] ================ drm_test_rect_rotate_inv  =================
[23:11:09] [PASSED] reflect-x
[23:11:09] [PASSED] reflect-y
[23:11:09] [PASSED] rotate-0
[23:11:09] [PASSED] rotate-90
[23:11:09] [PASSED] rotate-180
[23:11:09] [PASSED] rotate-270
[23:11:09] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[23:11:09] ==================== [PASSED] drm_rect =====================
[23:11:09] ======================== drm_exec  =========================
[23:11:09] [PASSED] sanitycheck
[23:11:09] [PASSED] test_lock
[23:11:09] [PASSED] test_lock_unlock
[23:11:09] [PASSED] test_duplicates
[23:11:09] [PASSED] test_prepare
[23:11:09] [PASSED] test_prepare_array
[23:11:09] [PASSED] test_multiple_loops
[23:11:09] ==================== [PASSED] drm_exec =====================
[23:11:09] ============================================================
[23:11:09] Testing complete. Ran 368 tests: passed: 368
[23:11:09] Elapsed time: 44.689s total, 1.676s configuring, 19.131s building, 23.853s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


