Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FC3E936EC
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 00:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1DF10E14B;
	Thu,  5 Oct 2023 00:33:10 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9D47410E14B;
 Thu,  5 Oct 2023 00:33:08 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9B9ABAADE8;
 Thu,  5 Oct 2023 00:33:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Date: Thu, 05 Oct 2023 00:33:08 -0000
Message-ID: <169646598863.7514.398073112655068970@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231004234721.2076190-1-fei.yang@intel.com>
In-Reply-To: <20231004234721.2076190-1-fei.yang@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe?=
 =?utf-8?q?=3A_don=27t_repin_a_userptr_if_mm_is_closed?=
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

Series: drm/xe: don't repin a userptr if mm is closed
URL   : https://patchwork.freedesktop.org/series/124643/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[00:31:57] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:32:01] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[00:32:21] Starting KUnit Kernel (1/1)...
[00:32:21] ============================================================
[00:32:21] ========================== xe_bo  ==========================
[00:32:21] [SKIPPED] xe_ccs_migrate_kunit
[00:32:21] [SKIPPED] xe_bo_evict_kunit
[00:32:21] ===================== [SKIPPED] xe_bo ======================
[00:32:21] ======================= xe_dma_buf  ========================
[00:32:21] [SKIPPED] xe_dma_buf_kunit
[00:32:21] =================== [SKIPPED] xe_dma_buf ===================
[00:32:21] ======================= xe_migrate  ========================
[00:32:21] [SKIPPED] xe_migrate_sanity_kunit
[00:32:21] =================== [SKIPPED] xe_migrate ===================
[00:32:21] ========================= xe_pci  ==========================
[00:32:21] [PASSED] xe_gmdid_graphics_ip
[00:32:21] [PASSED] xe_gmdid_media_ip
[00:32:21] ===================== [PASSED] xe_pci ======================
[00:32:21] ========================= xe_rtp  ==========================
[00:32:21] ================== xe_rtp_process_tests  ===================
[00:32:21] [PASSED] coalesce-same-reg
[00:32:21] [PASSED] no-match-no-add
[00:32:21] [PASSED] no-match-no-add-multiple-rules
[00:32:21] [PASSED] two-regs-two-entries
[00:32:21] [PASSED] clr-one-set-other
[00:32:21] [PASSED] set-field
[00:32:21] [PASSED] conflict-duplicate
[00:32:21] [PASSED] conflict-not-disjoint
[00:32:21] [PASSED] conflict-reg-type
[00:32:21] ============== [PASSED] xe_rtp_process_tests ===============
[00:32:21] ===================== [PASSED] xe_rtp ======================
[00:32:21] ========================== xe_wa  ==========================
[00:32:21] ======================== xe_wa_gt  =========================
[00:32:21] [PASSED] TIGERLAKE (B0)
[00:32:21] [PASSED] DG1 (A0)
[00:32:21] [PASSED] DG1 (B0)
[00:32:21] [PASSED] ALDERLAKE_S (A0)
[00:32:21] [PASSED] ALDERLAKE_S (B0)
[00:32:21] [PASSED] ALDERLAKE_S (C0)
[00:32:21] [PASSED] ALDERLAKE_S (D0)
[00:32:21] [PASSED] ALDERLAKE_P (A0)
[00:32:21] [PASSED] ALDERLAKE_P (B0)
[00:32:21] [PASSED] ALDERLAKE_P (C0)
[00:32:21] [PASSED] DG2_G10 (A0)
[00:32:21] [PASSED] DG2_G10 (A1)
[00:32:21] [PASSED] DG2_G10 (B0)
[00:32:21] [PASSED] DG2_G10 (C0)
[00:32:21] [PASSED] DG2_G11 (A0)
[00:32:21] [PASSED] DG2_G11 (B0)
[00:32:21] [PASSED] DG2_G11 (B1)
[00:32:21] [PASSED] DG2_G12 (A0)
[00:32:21] [PASSED] DG2_G12 (A1)
[00:32:21] [PASSED] PVC (B0)
[00:32:21] [PASSED] PVC (B1)
[00:32:21] [PASSED] PVC (C0)
[00:32:21] ==================== [PASSED] xe_wa_gt =====================
[00:32:21] ====================== [PASSED] xe_wa ======================
[00:32:21] ============================================================
[00:32:21] Testing complete. Ran 37 tests: passed: 33, skipped: 4
[00:32:21] Elapsed time: 24.254s total, 4.219s configuring, 19.915s building, 0.100s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[00:32:21] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:32:23] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[00:32:42] Starting KUnit Kernel (1/1)...
[00:32:42] ============================================================
[00:32:42] ================== drm_test_pick_cmdline  ==================
[00:32:42] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[00:32:42] =============== drm_test_pick_cmdline_named  ===============
[00:32:42] [PASSED] NTSC
[00:32:42] [PASSED] NTSC-J
[00:32:42] [PASSED] PAL
[00:32:42] [PASSED] PAL-M
[00:32:42] =========== [PASSED] drm_test_pick_cmdline_named ===========
[00:32:42] ============== [PASSED] drm_test_pick_cmdline ==============
[00:32:42] ======================== drm_buddy  ========================
[00:32:42] [PASSED] drm_test_buddy_alloc_limit
[00:32:42] [PASSED] drm_test_buddy_alloc_range
[00:32:42] [PASSED] drm_test_buddy_alloc_optimistic
[00:32:42] [PASSED] drm_test_buddy_alloc_pessimistic
[00:32:42] [PASSED] drm_test_buddy_alloc_smoke
[00:32:42] [PASSED] drm_test_buddy_alloc_pathological
[00:32:42] ==================== [PASSED] drm_buddy ====================
[00:32:42] =================== drm_cmdline_parser  ====================
[00:32:42] [PASSED] drm_test_cmdline_force_d_only
[00:32:42] [PASSED] drm_test_cmdline_force_D_only_dvi
[00:32:42] [PASSED] drm_test_cmdline_force_D_only_hdmi
[00:32:42] [PASSED] drm_test_cmdline_force_D_only_not_digital
[00:32:42] [PASSED] drm_test_cmdline_force_e_only
[00:32:42] [PASSED] drm_test_cmdline_res
[00:32:42] [PASSED] drm_test_cmdline_res_vesa
[00:32:42] [PASSED] drm_test_cmdline_res_vesa_rblank
[00:32:42] [PASSED] drm_test_cmdline_res_rblank
[00:32:42] [PASSED] drm_test_cmdline_res_bpp
[00:32:42] [PASSED] drm_test_cmdline_res_refresh
[00:32:42] [PASSED] drm_test_cmdline_res_bpp_refresh
[00:32:42] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[00:32:42] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[00:32:42] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[00:32:42] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[00:32:42] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[00:32:42] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[00:32:42] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[00:32:42] [PASSED] drm_test_cmdline_res_margins_force_on
[00:32:42] [PASSED] drm_test_cmdline_res_vesa_margins
[00:32:42] [PASSED] drm_test_cmdline_name
[00:32:42] [PASSED] drm_test_cmdline_name_bpp
[00:32:42] [PASSED] drm_test_cmdline_name_option
[00:32:42] [PASSED] drm_test_cmdline_name_bpp_option
[00:32:42] [PASSED] drm_test_cmdline_rotate_0
[00:32:42] [PASSED] drm_test_cmdline_rotate_90
[00:32:42] [PASSED] drm_test_cmdline_rotate_180
[00:32:42] [PASSED] drm_test_cmdline_rotate_270
[00:32:42] [PASSED] drm_test_cmdline_hmirror
[00:32:42] [PASSED] drm_test_cmdline_vmirror
[00:32:42] [PASSED] drm_test_cmdline_margin_options
[00:32:42] [PASSED] drm_test_cmdline_multiple_options
[00:32:42] [PASSED] drm_test_cmdline_bpp_extra_and_option
[00:32:42] [PASSED] drm_test_cmdline_extra_and_option
[00:32:42] [PASSED] drm_test_cmdline_freestanding_options
[00:32:42] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[00:32:42] [PASSED] drm_test_cmdline_panel_orientation
[00:32:42] ================ drm_test_cmdline_invalid  =================
[00:32:42] [PASSED] margin_only
[00:32:42] [PASSED] interlace_only
[00:32:42] [PASSED] res_missing_x
[00:32:42] [PASSED] res_missing_y
[00:32:42] [PASSED] res_bad_y
[00:32:42] [PASSED] res_missing_y_bpp
[00:32:42] [PASSED] res_bad_bpp
[00:32:42] [PASSED] res_bad_refresh
[00:32:42] [PASSED] res_bpp_refresh_force_on_off
[00:32:42] [PASSED] res_invalid_mode
[00:32:42] [PASSED] res_bpp_wrong_place_mode
[00:32:42] [PASSED] name_bpp_refresh
[00:32:42] [PASSED] name_refresh
[00:32:42] [PASSED] name_refresh_wrong_mode
[00:32:42] [PASSED] name_refresh_invalid_mode
[00:32:42] [PASSED] rotate_multiple
[00:32:42] [PASSED] rotate_invalid_val
[00:32:42] [PASSED] rotate_truncated
[00:32:42] [PASSED] invalid_option
[00:32:42] [PASSED] invalid_tv_option
[00:32:42] [PASSED] truncated_tv_option
[00:32:42] ============ [PASSED] drm_test_cmdline_invalid =============
[00:32:42] =============== drm_test_cmdline_tv_options  ===============
[00:32:42] [PASSED] NTSC
[00:32:42] [PASSED] NTSC_443
[00:32:42] [PASSED] NTSC_J
[00:32:42] [PASSED] PAL
[00:32:42] [PASSED] PAL_M
[00:32:42] [PASSED] PAL_N
[00:32:42] [PASSED] SECAM
[00:32:42] =========== [PASSED] drm_test_cmdline_tv_options ===========
[00:32:42] =============== [PASSED] drm_cmdline_parser ================
[00:32:42] ================ drm_get_tv_mode_from_name  ================
[00:32:42] ========== drm_test_get_tv_mode_from_name_valid  ===========
[00:32:42] [PASSED] NTSC
[00:32:42] [PASSED] NTSC-443
[00:32:42] [PASSED] NTSC-J
[00:32:42] [PASSED] PAL
[00:32:42] [PASSED] PAL-M
[00:32:42] [PASSED] PAL-N
[00:32:42] [PASSED] SECAM
[00:32:42] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[00:32:42] [PASSED] drm_test_get_tv_mode_from_name_truncated
[00:32:42] ============ [PASSED] drm_get_tv_mode_from_name ============
[00:32:42] ==================== drm_damage_helper  ====================
[00:32:42] [PASSED] drm_test_damage_iter_no_damage
[00:32:42] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[00:32:42] [PASSED] drm_test_damage_iter_no_damage_src_moved
[00:32:42] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[00:32:42] [PASSED] drm_test_damage_iter_no_damage_not_visible
[00:32:42] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[00:32:42] [PASSED] drm_test_damage_iter_no_damage_no_fb
[00:32:42] [PASSED] drm_test_damage_iter_simple_damage
[00:32:42] [PASSED] drm_test_damage_iter_single_damage
[00:32:42] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[00:32:42] [PASSED] drm_test_damage_iter_single_damage_outside_src
[00:32:42] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[00:32:42] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[00:32:42] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[00:32:42] [PASSED] drm_test_damage_iter_single_damage_src_moved
[00:32:42] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[00:32:42] [PASSED] drm_test_damage_iter_damage
[00:32:42] [PASSED] drm_test_damage_iter_damage_one_intersect
[00:32:42] [PASSED] drm_test_damage_iter_damage_one_outside
[00:32:42] [PASSED] drm_test_damage_iter_damage_src_moved
[00:32:42] [PASSED] drm_test_damage_iter_damage_not_visible
[00:32:42] ================ [PASSED] drm_damage_helper ================
[00:32:42] ==================== drm_dp_mst_helper  ====================
[00:32:42] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[00:32:42] [PASSED] Clock 154000 BPP 30 DSC disabled
[00:32:42] [PASSED] Clock 234000 BPP 30 DSC disabled
[00:32:42] [PASSED] Clock 297000 BPP 24 DSC disabled
[00:32:42] [PASSED] Clock 332880 BPP 24 DSC enabled
[00:32:42] [PASSED] Clock 324540 BPP 24 DSC enabled
[00:32:42] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[00:32:42] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[00:32:42] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[00:32:42] [PASSED] DP_POWER_UP_PHY with port number
[00:32:42] [PASSED] DP_POWER_DOWN_PHY with port number
[00:32:42] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[00:32:42] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[00:32:42] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[00:32:42] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[00:32:42] [PASSED] DP_QUERY_PAYLOAD with port number
[00:32:42] [PASSED] DP_QUERY_PAYLOAD with VCPI
[00:32:42] [PASSED] DP_REMOTE_DPCD_READ with port number
[00:32:42] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[00:32:42] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[00:32:42] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[00:32:42] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[00:32:42] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[00:32:42] [PASSED] DP_REMOTE_I2C_READ with port number
[00:32:42] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[00:32:42] [PASSED] DP_REMOTE_I2C_READ with transactions array
[00:32:42] [PASSED] DP_REMOTE_I2C_WRITE with port number
[00:32:42] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[00:32:42] [PASSED] DP_REMOTE_I2C_WRITE with data array
[00:32:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[00:32:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[00:32:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[00:32:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[00:32:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[00:32:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[00:32:42] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[00:32:42] ================ [PASSED] drm_dp_mst_helper ================
[00:32:42] ================= drm_format_helper_test  ==================
[00:32:42] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[00:32:42] [PASSED] single_pixel_source_buffer
[00:32:42] [PASSED] single_pixel_clip_rectangle
[00:32:42] [PASSED] well_known_colors
[00:32:42] [PASSED] destination_pitch
[00:32:42] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[00:32:42] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[00:32:42] [PASSED] single_pixel_source_buffer
[00:32:42] [PASSED] single_pixel_clip_rectangle
[00:32:42] [PASSED] well_known_colors
[00:32:42] [PASSED] destination_pitch
[00:32:42] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[00:32:42] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[00:32:42] [PASSED] single_pixel_source_buffer
[00:32:42] [PASSED] single_pixel_clip_rectangle
[00:32:42] [PASSED] well_known_colors
[00:32:42] [PASSED] destination_pitch
[00:32:42] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[00:32:42] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[00:32:42] [PASSED] single_pixel_source_buffer
[00:32:42] [PASSED] single_pixel_clip_rectangle
[00:32:42] [PASSED] well_known_colors
[00:32:42] [PASSED] destination_pitch
[00:32:42] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[00:32:42] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[00:32:42] [PASSED] single_pixel_source_buffer
[00:32:42] [PASSED] single_pixel_clip_rectangle
[00:32:42] [PASSED] well_known_colors
[00:32:42] [PASSED] destination_pitch
[00:32:42] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[00:32:42] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[00:32:42] [PASSED] single_pixel_source_buffer
[00:32:42] [PASSED] single_pixel_clip_rectangle
[00:32:42] [PASSED] well_known_colors
[00:32:42] [PASSED] destination_pitch
[00:32:42] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[00:32:42] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[00:32:42] [PASSED] single_pixel_source_buffer
[00:32:42] [PASSED] single_pixel_clip_rectangle
[00:32:42] [PASSED] well_known_colors
[00:32:42] [PASSED] destination_pitch
[00:32:42] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[00:32:42] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[00:32:42] [PASSED] single_pixel_source_buffer
[00:32:42] [PASSED] single_pixel_clip_rectangle
[00:32:42] [PASSED] well_known_colors
[00:32:42] [PASSED] destination_pitch
[00:32:42] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[00:32:42] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[00:32:42] [PASSED] single_pixel_source_buffer
[00:32:42] [PASSED] single_pixel_clip_rectangle
[00:32:42] [PASSED] well_known_colors
[00:32:42] [PASSED] destination_pitch
[00:32:42] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[00:32:42] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[00:32:42] [PASSED] single_pixel_source_buffer
[00:32:42] [PASSED] single_pixel_clip_rectangle
[00:32:42] [PASSED] well_known_colors
[00:32:42] [PASSED] destination_pitch
[00:32:42] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[00:32:42] ============== drm_test_fb_xrgb8888_to_mono  ===============
[00:32:42] [PASSED] single_pixel_source_buffer
[00:32:42] [PASSED] single_pixel_clip_rectangle
[00:32:42] [PASSED] well_known_colors
[00:32:42] [PASSED] destination_pitch
[00:32:42] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[00:32:42] ==================== drm_test_fb_swab  =====================
[00:32:42] [PASSED] single_pixel_source_buffer
[00:32:42] [PASSED] single_pixel_clip_rectangle
[00:32:42] [PASSED] well_known_colors
[00:32:42] [PASSED] destination_pitch
[00:32:42] ================ [PASSED] drm_test_fb_swab =================
[00:32:42] ================= drm_test_fb_clip_offset  =================
[00:32:42] [PASSED] pass through
[00:32:42] [PASSED] horizontal offset
[00:32:42] [PASSED] vertical offset
[00:32:42] [PASSED] horizontal and vertical offset
[00:32:42] [PASSED] horizontal offset (custom pitch)
[00:32:42] [PASSED] vertical offset (custom pitch)
[00:32:42] [PASSED] horizontal and vertical offset (custom pitch)
[00:32:42] ============= [PASSED] drm_test_fb_clip_offset =============
[00:32:42] ============== drm_test_fb_build_fourcc_list  ==============
[00:32:42] [PASSED] no native formats
[00:32:42] [PASSED] XRGB8888 as native format
[00:32:42] [PASSED] remove duplicates
[00:32:42] [PASSED] convert alpha formats
[00:32:42] [PASSED] random formats
[00:32:42] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[00:32:42] =================== drm_test_fb_memcpy  ====================
[00:32:42] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[00:32:42] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[00:32:42] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[00:32:42] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[00:32:42] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[00:32:42] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[00:32:42] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[00:32:42] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[00:32:42] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[00:32:42] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[00:32:42] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[00:32:42] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[00:32:42] =============== [PASSED] drm_test_fb_memcpy ================
[00:32:42] ============= [PASSED] drm_format_helper_test ==============
[00:32:42] ======================= drm_format  ========================
[00:32:42] [PASSED] drm_test_format_block_width_invalid
[00:32:42] [PASSED] drm_test_format_block_width_one_plane
[00:32:42] [PASSED] drm_test_format_block_width_two_plane
[00:32:42] [PASSED] drm_test_format_block_width_three_plane
[00:32:42] [PASSED] drm_test_format_block_width_tiled
[00:32:42] [PASSED] drm_test_format_block_height_invalid
[00:32:42] [PASSED] drm_test_format_block_height_one_plane
[00:32:42] [PASSED] drm_test_format_block_height_two_plane
[00:32:42] [PASSED] drm_test_format_block_height_three_plane
[00:32:42] [PASSED] drm_test_format_block_height_tiled
[00:32:42] [PASSED] drm_test_format_min_pitch_invalid
[00:32:42] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[00:32:42] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[00:32:42] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[00:32:42] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[00:32:42] [PASSED] drm_test_format_min_pitch_two_plane
[00:32:42] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[00:32:42] [PASSED] drm_test_format_min_pitch_tiled
[00:32:42] =================== [PASSED] drm_format ====================
[00:32:42] ===================== drm_framebuffer  =====================
[00:32:42] =============== drm_test_framebuffer_create  ===============
[00:32:42] [PASSED] ABGR8888 normal sizes
[00:32:42] [PASSED] ABGR8888 max sizes
[00:32:42] [PASSED] ABGR8888 pitch greater than min required
[00:32:42] [PASSED] ABGR8888 pitch less than min required
[00:32:42] [PASSED] ABGR8888 Invalid width
[00:32:42] [PASSED] ABGR8888 Invalid buffer handle
[00:32:42] [PASSED] No pixel format
[00:32:42] [PASSED] ABGR8888 Width 0
[00:32:42] [PASSED] ABGR8888 Height 0
[00:32:42] [PASSED] ABGR8888 Out of bound height * pitch combination
[00:32:42] [PASSED] ABGR8888 Large buffer offset
[00:32:42] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[00:32:42] [PASSED] ABGR8888 Valid buffer modifier
[00:32:42] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[00:32:42] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[00:32:42] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[00:32:42] [PASSED] NV12 Normal sizes
[00:32:42] [PASSED] NV12 Max sizes
[00:32:42] [PASSED] NV12 Invalid pitch
[00:32:42] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[00:32:42] [PASSED] NV12 different  modifier per-plane
[00:32:42] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[00:32:42] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[00:32:42] [PASSED] NV12 Modifier for inexistent plane
[00:32:42] [PASSED] NV12 Handle for inexistent plane
[00:32:42] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[00:32:42] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[00:32:42] [PASSED] YVU420 Normal sizes
[00:32:42] [PASSED] YVU420 Max sizes
[00:32:42] [PASSED] YVU420 Invalid pitch
[00:32:42] [PASSED] YVU420 Different pitches
[00:32:42] [PASSED] YVU420 Different buffer offsets/pitches
[00:32:42] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[00:32:42] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[00:32:42] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[00:32:42] [PASSED] YVU420 Valid modifier
[00:32:42] [PASSED] YVU420 Different modifiers per plane
[00:32:42] [PASSED] YVU420 Modifier for inexistent plane
[00:32:42] [PASSED] X0L2 Normal sizes
[00:32:42] [PASSED] X0L2 Max sizes
[00:32:42] [PASSED] X0L2 Invalid pitch
[00:32:42] [PASSED] X0L2 Pitch greater than minimum required
[00:32:42] [PASSED] X0L2 Handle for inexistent plane
[00:32:42] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[00:32:42] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[00:32:42] [PASSED] X0L2 Valid modifier
[00:32:42] [PASSED] X0L2 Modifier for inexistent plane
[00:32:42] =========== [PASSED] drm_test_framebuffer_create ===========
[00:32:42] ================= [PASSED] drm_framebuffer =================
[00:32:42] ==================== drm-test-managed  =====================
[00:32:42] [PASSED] drm_test_managed_run_action
[00:32:42] ================ [PASSED] drm-test-managed =================
[00:32:42] ========================= drm_mm  ==========================
[00:32:42] [PASSED] drm_test_mm_init
[00:32:42] [PASSED] drm_test_mm_debug
[00:32:52] [PASSED] drm_test_mm_reserve
[00:33:02] [PASSED] drm_test_mm_insert
[00:33:03] [PASSED] drm_test_mm_replace
[00:33:03] [PASSED] drm_test_mm_insert_range
[00:33:03] [PASSED] drm_test_mm_frag
[00:33:03] [PASSED] drm_test_mm_align
[00:33:03] [PASSED] drm_test_mm_align32
[00:33:04] [PASSED] drm_test_mm_align64
[00:33:04] [PASSED] drm_test_mm_evict
[00:33:04] [PASSED] drm_test_mm_evict_range
[00:33:04] [PASSED] drm_test_mm_topdown
[00:33:04] [PASSED] drm_test_mm_bottomup
[00:33:04] [PASSED] drm_test_mm_lowest
[00:33:04] [PASSED] drm_test_mm_highest
[00:33:05] [PASSED] drm_test_mm_color
[00:33:05] [PASSED] drm_test_mm_color_evict
[00:33:05] [PASSED] drm_test_mm_color_evict_range
[00:33:05] ===================== [PASSED] drm_mm ======================
[00:33:05] =================== drm_modes_analog_tv  ===================
[00:33:05] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[00:33:05] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[00:33:05] [PASSED] drm_test_modes_analog_tv_pal_576i
[00:33:05] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[00:33:05] =============== [PASSED] drm_modes_analog_tv ===============
[00:33:05] ==================== drm_plane_helper  =====================
[00:33:05] =============== drm_test_check_plane_state  ================
[00:33:05] [PASSED] clipping_simple
[00:33:05] [PASSED] clipping_rotate_reflect
[00:33:05] [PASSED] positioning_simple
[00:33:05] [PASSED] upscaling
[00:33:05] [PASSED] downscaling
[00:33:05] [PASSED] rounding1
[00:33:05] [PASSED] rounding2
[00:33:05] [PASSED] rounding3
[00:33:05] [PASSED] rounding4
[00:33:05] =========== [PASSED] drm_test_check_plane_state ============
[00:33:05] =========== drm_test_check_invalid_plane_state  ============
[00:33:05] [PASSED] positioning_invalid
[00:33:05] [PASSED] upscaling_invalid
[00:33:05] [PASSED] downscaling_invalid
[00:33:05] ======= [PASSED] drm_test_check_invalid_plane_state ========
[00:33:05] ================ [PASSED] drm_plane_helper =================
[00:33:05] ============ drm_connector_helper_tv_get_modes  ============
[00:33:05] ====== drm_test_connector_helper_tv_get_modes_check  =======
[00:33:05] [PASSED] None
[00:33:05] [PASSED] PAL
[00:33:05] [PASSED] NTSC
[00:33:05] [PASSED] Both, NTSC Default
[00:33:05] [PASSED] Both, PAL Default
[00:33:05] [PASSED] Both, NTSC Default, with PAL on command-line
[00:33:05] [PASSED] Both, PAL Default, with NTSC on command-line
[00:33:05] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[00:33:05] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[00:33:05] ======================== drm_rect  =========================
[00:33:05] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[00:33:05] [PASSED] drm_test_rect_clip_scaled_not_clipped
[00:33:05] [PASSED] drm_test_rect_clip_scaled_clipped
[00:33:05] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[00:33:05] ================= drm_test_rect_intersect  =================
[00:33:05] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[00:33:05] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[00:33:05] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[00:33:05] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[00:33:05] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[00:33:05] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[00:33:05] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[00:33:05] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[00:33:05] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[00:33:05] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[00:33:05] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[00:33:05] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[00:33:05] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[00:33:05] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[00:33:05] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[00:33:05] ============= [PASSED] drm_test_rect_intersect =============
[00:33:05] ================ drm_test_rect_calc_hscale  ================
[00:33:05] [PASSED] normal use
[00:33:05] [PASSED] out of max range
[00:33:05] [PASSED] out of min range
[00:33:05] [PASSED] zero dst
[00:33:05] [PASSED] negative src
[00:33:05] [PASSED] negative dst
[00:33:05] ============ [PASSED] drm_test_rect_calc_hscale ============
[00:33:05] ================ drm_test_rect_calc_vscale  ================
[00:33:05] [PASSED] normal use
[00:33:05] [PASSED] out of max range
[00:33:05] [PASSED] out of min range
[00:33:05] [PASSED] zero dst
[00:33:05] [PASSED] negative src
[00:33:05] [PASSED] negative dst
[00:33:05] ============ [PASSED] drm_test_rect_calc_vscale ============
[00:33:05] ================== drm_test_rect_rotate  ===================
[00:33:05] [PASSED] reflect-x
[00:33:05] [PASSED] reflect-y
[00:33:05] [PASSED] rotate-0
[00:33:05] [PASSED] rotate-90
[00:33:05] [PASSED] rotate-180
[00:33:05] [PASSED] rotate-270
[00:33:05] ============== [PASSED] drm_test_rect_rotate ===============
[00:33:05] ================ drm_test_rect_rotate_inv  =================
[00:33:05] [PASSED] reflect-x
[00:33:05] [PASSED] reflect-y
[00:33:05] [PASSED] rotate-0
[00:33:05] [PASSED] rotate-90
[00:33:05] [PASSED] rotate-180
[00:33:05] [PASSED] rotate-270
[00:33:05] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[00:33:05] ==================== [PASSED] drm_rect =====================
[00:33:05] ======================== drm_exec  =========================
[00:33:05] [PASSED] sanitycheck
[00:33:05] [PASSED] test_lock
[00:33:05] [PASSED] test_lock_unlock
[00:33:05] [PASSED] test_duplicates
[00:33:05] [PASSED] test_prepare
[00:33:05] [PASSED] test_prepare_array
[00:33:05] [PASSED] test_multiple_loops
[00:33:05] ==================== [PASSED] drm_exec =====================
[00:33:05] ============================================================
[00:33:05] Testing complete. Ran 368 tests: passed: 368
[00:33:05] Elapsed time: 44.411s total, 1.683s configuring, 19.347s building, 23.363s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


