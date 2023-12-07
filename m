Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238BEC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 11:21:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F7810E1F9;
	Thu,  7 Dec 2023 11:21:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 29B2C10E1F9;
 Thu,  7 Dec 2023 11:21:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 25A12A0169;
 Thu,  7 Dec 2023 11:21:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Handle_remaining_ifdefs_in_hac?=
 =?utf-8?q?k_patch?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Thu, 07 Dec 2023 11:21:35 -0000
Message-ID: <170194809514.28721.14432749601886636881@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231207111706.2293105-1-jouni.hogander@intel.com>
In-Reply-To: <20231207111706.2293105-1-jouni.hogander@intel.com>
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

Series: Handle remaining ifdefs in hack patch
URL   : https://patchwork.freedesktop.org/series/127488/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[11:20:23] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:20:27] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[11:20:48] Starting KUnit Kernel (1/1)...
[11:20:48] ============================================================
[11:20:48] ========================== xe_bo  ==========================
[11:20:48] [SKIPPED] xe_ccs_migrate_kunit
[11:20:48] [SKIPPED] xe_bo_evict_kunit
[11:20:48] ===================== [SKIPPED] xe_bo ======================
[11:20:48] ======================= xe_dma_buf  ========================
[11:20:48] [SKIPPED] xe_dma_buf_kunit
[11:20:48] =================== [SKIPPED] xe_dma_buf ===================
[11:20:48] ======================= xe_migrate  ========================
[11:20:48] [SKIPPED] xe_migrate_sanity_kunit
[11:20:48] =================== [SKIPPED] xe_migrate ===================
[11:20:48] ========================= xe_mocs  =========================
[11:20:48] [SKIPPED] xe_live_mocs_kernel_kunit
[11:20:48] ==================== [SKIPPED] xe_mocs =====================
[11:20:48] ========================= xe_pci  ==========================
[11:20:48] [PASSED] xe_gmdid_graphics_ip
[11:20:48] [PASSED] xe_gmdid_media_ip
[11:20:48] ===================== [PASSED] xe_pci ======================
[11:20:48] ========================= xe_rtp  ==========================
[11:20:48] ================== xe_rtp_process_tests  ===================
[11:20:48] [PASSED] coalesce-same-reg
[11:20:48] [PASSED] no-match-no-add
[11:20:48] [PASSED] no-match-no-add-multiple-rules
[11:20:48] [PASSED] two-regs-two-entries
[11:20:48] [PASSED] clr-one-set-other
[11:20:48] [PASSED] set-field
[11:20:48] [PASSED] conflict-duplicate
[11:20:48] [PASSED] conflict-not-disjoint
[11:20:48] [PASSED] conflict-reg-type
[11:20:48] ============== [PASSED] xe_rtp_process_tests ===============
[11:20:48] ===================== [PASSED] xe_rtp ======================
[11:20:48] ========================== xe_wa  ==========================
[11:20:48] ======================== xe_wa_gt  =========================
[11:20:48] [PASSED] TIGERLAKE (B0)
[11:20:48] [PASSED] DG1 (A0)
[11:20:48] [PASSED] DG1 (B0)
[11:20:48] [PASSED] ALDERLAKE_S (A0)
[11:20:48] [PASSED] ALDERLAKE_S (B0)
[11:20:48] [PASSED] ALDERLAKE_S (C0)
[11:20:48] [PASSED] ALDERLAKE_S (D0)
[11:20:48] [PASSED] ALDERLAKE_P (A0)
[11:20:48] [PASSED] ALDERLAKE_P (B0)
[11:20:48] [PASSED] ALDERLAKE_P (C0)
[11:20:48] [PASSED] ALDERLAKE_S_RPLS (D0)
[11:20:48] [PASSED] ALDERLAKE_P_RPLU (E0)
[11:20:48] [PASSED] DG2_G10 (A0)
[11:20:48] [PASSED] DG2_G10 (A1)
[11:20:48] [PASSED] DG2_G10 (B0)
[11:20:48] [PASSED] DG2_G10 (C0)
[11:20:48] [PASSED] DG2_G11 (A0)
[11:20:48] [PASSED] DG2_G11 (B0)
[11:20:48] [PASSED] DG2_G11 (B1)
[11:20:48] [PASSED] DG2_G12 (A0)
[11:20:48] [PASSED] DG2_G12 (A1)
[11:20:48] [PASSED] PVC (B0)
[11:20:48] [PASSED] PVC (B1)
[11:20:48] [PASSED] PVC (C0)
[11:20:48] [PASSED] METEORLAKE (g:A0, m:A0)
[11:20:48] [PASSED] METEORLAKE (g:A0, m:A0)
[11:20:48] [PASSED] LUNARLAKE (g:A0, m:A0)
[11:20:48] [PASSED] LUNARLAKE (g:B0, m:A0)
[11:20:48] ==================== [PASSED] xe_wa_gt =====================
[11:20:48] ====================== [PASSED] xe_wa ======================
[11:20:48] ============================================================
[11:20:48] Testing complete. Ran 44 tests: passed: 39, skipped: 5
[11:20:48] Elapsed time: 24.750s total, 4.233s configuring, 20.347s building, 0.138s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[11:20:48] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:20:50] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[11:21:09] Starting KUnit Kernel (1/1)...
[11:21:09] ============================================================
[11:21:09] ================== drm_test_pick_cmdline  ==================
[11:21:09] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[11:21:09] =============== drm_test_pick_cmdline_named  ===============
[11:21:09] [PASSED] NTSC
[11:21:09] [PASSED] NTSC-J
[11:21:09] [PASSED] PAL
[11:21:09] [PASSED] PAL-M
[11:21:09] =========== [PASSED] drm_test_pick_cmdline_named ===========
[11:21:09] ============== [PASSED] drm_test_pick_cmdline ==============
[11:21:09] ======================== drm_buddy  ========================
[11:21:09] [PASSED] drm_test_buddy_alloc_limit
[11:21:09] [PASSED] drm_test_buddy_alloc_range
[11:21:09] [PASSED] drm_test_buddy_alloc_optimistic
[11:21:09] [PASSED] drm_test_buddy_alloc_pessimistic
[11:21:09] [PASSED] drm_test_buddy_alloc_smoke
[11:21:09] [PASSED] drm_test_buddy_alloc_pathological
[11:21:09] ==================== [PASSED] drm_buddy ====================
[11:21:09] =================== drm_cmdline_parser  ====================
[11:21:09] [PASSED] drm_test_cmdline_force_d_only
[11:21:09] [PASSED] drm_test_cmdline_force_D_only_dvi
[11:21:09] [PASSED] drm_test_cmdline_force_D_only_hdmi
[11:21:09] [PASSED] drm_test_cmdline_force_D_only_not_digital
[11:21:09] [PASSED] drm_test_cmdline_force_e_only
[11:21:09] [PASSED] drm_test_cmdline_res
[11:21:09] [PASSED] drm_test_cmdline_res_vesa
[11:21:09] [PASSED] drm_test_cmdline_res_vesa_rblank
[11:21:09] [PASSED] drm_test_cmdline_res_rblank
[11:21:09] [PASSED] drm_test_cmdline_res_bpp
[11:21:09] [PASSED] drm_test_cmdline_res_refresh
[11:21:09] [PASSED] drm_test_cmdline_res_bpp_refresh
[11:21:09] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[11:21:09] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[11:21:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[11:21:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[11:21:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[11:21:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[11:21:09] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[11:21:09] [PASSED] drm_test_cmdline_res_margins_force_on
[11:21:09] [PASSED] drm_test_cmdline_res_vesa_margins
[11:21:09] [PASSED] drm_test_cmdline_name
[11:21:09] [PASSED] drm_test_cmdline_name_bpp
[11:21:09] [PASSED] drm_test_cmdline_name_option
[11:21:09] [PASSED] drm_test_cmdline_name_bpp_option
[11:21:09] [PASSED] drm_test_cmdline_rotate_0
[11:21:09] [PASSED] drm_test_cmdline_rotate_90
[11:21:09] [PASSED] drm_test_cmdline_rotate_180
[11:21:09] [PASSED] drm_test_cmdline_rotate_270
[11:21:09] [PASSED] drm_test_cmdline_hmirror
[11:21:09] [PASSED] drm_test_cmdline_vmirror
[11:21:09] [PASSED] drm_test_cmdline_margin_options
[11:21:09] [PASSED] drm_test_cmdline_multiple_options
[11:21:09] [PASSED] drm_test_cmdline_bpp_extra_and_option
[11:21:09] [PASSED] drm_test_cmdline_extra_and_option
[11:21:09] [PASSED] drm_test_cmdline_freestanding_options
[11:21:09] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[11:21:09] [PASSED] drm_test_cmdline_panel_orientation
[11:21:09] ================ drm_test_cmdline_invalid  =================
[11:21:09] [PASSED] margin_only
[11:21:09] [PASSED] interlace_only
[11:21:09] [PASSED] res_missing_x
[11:21:09] [PASSED] res_missing_y
[11:21:09] [PASSED] res_bad_y
[11:21:09] [PASSED] res_missing_y_bpp
[11:21:09] [PASSED] res_bad_bpp
[11:21:09] [PASSED] res_bad_refresh
[11:21:09] [PASSED] res_bpp_refresh_force_on_off
[11:21:09] [PASSED] res_invalid_mode
[11:21:09] [PASSED] res_bpp_wrong_place_mode
[11:21:09] [PASSED] name_bpp_refresh
[11:21:09] [PASSED] name_refresh
[11:21:09] [PASSED] name_refresh_wrong_mode
[11:21:09] [PASSED] name_refresh_invalid_mode
[11:21:09] [PASSED] rotate_multiple
[11:21:09] [PASSED] rotate_invalid_val
[11:21:09] [PASSED] rotate_truncated
[11:21:09] [PASSED] invalid_option
[11:21:09] [PASSED] invalid_tv_option
[11:21:09] [PASSED] truncated_tv_option
[11:21:09] ============ [PASSED] drm_test_cmdline_invalid =============
[11:21:09] =============== drm_test_cmdline_tv_options  ===============
[11:21:09] [PASSED] NTSC
[11:21:09] [PASSED] NTSC_443
[11:21:09] [PASSED] NTSC_J
[11:21:09] [PASSED] PAL
[11:21:09] [PASSED] PAL_M
[11:21:09] [PASSED] PAL_N
[11:21:09] [PASSED] SECAM
[11:21:09] =========== [PASSED] drm_test_cmdline_tv_options ===========
[11:21:09] =============== [PASSED] drm_cmdline_parser ================
[11:21:09] ================ drm_get_tv_mode_from_name  ================
[11:21:09] ========== drm_test_get_tv_mode_from_name_valid  ===========
[11:21:09] [PASSED] NTSC
[11:21:09] [PASSED] NTSC-443
[11:21:09] [PASSED] NTSC-J
[11:21:09] [PASSED] PAL
[11:21:09] [PASSED] PAL-M
[11:21:09] [PASSED] PAL-N
[11:21:09] [PASSED] SECAM
[11:21:09] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[11:21:09] [PASSED] drm_test_get_tv_mode_from_name_truncated
[11:21:09] ============ [PASSED] drm_get_tv_mode_from_name ============
[11:21:09] ==================== drm_damage_helper  ====================
[11:21:09] [PASSED] drm_test_damage_iter_no_damage
[11:21:09] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[11:21:09] [PASSED] drm_test_damage_iter_no_damage_src_moved
[11:21:09] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[11:21:09] [PASSED] drm_test_damage_iter_no_damage_not_visible
[11:21:09] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[11:21:09] [PASSED] drm_test_damage_iter_no_damage_no_fb
[11:21:09] [PASSED] drm_test_damage_iter_simple_damage
[11:21:09] [PASSED] drm_test_damage_iter_single_damage
[11:21:09] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[11:21:09] [PASSED] drm_test_damage_iter_single_damage_outside_src
[11:21:09] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[11:21:09] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[11:21:09] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[11:21:09] [PASSED] drm_test_damage_iter_single_damage_src_moved
[11:21:09] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[11:21:09] [PASSED] drm_test_damage_iter_damage
[11:21:09] [PASSED] drm_test_damage_iter_damage_one_intersect
[11:21:09] [PASSED] drm_test_damage_iter_damage_one_outside
[11:21:09] [PASSED] drm_test_damage_iter_damage_src_moved
[11:21:09] [PASSED] drm_test_damage_iter_damage_not_visible
[11:21:09] ================ [PASSED] drm_damage_helper ================
[11:21:09] ==================== drm_dp_mst_helper  ====================
[11:21:09] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[11:21:09] [PASSED] Clock 154000 BPP 30 DSC disabled
[11:21:09] [PASSED] Clock 234000 BPP 30 DSC disabled
[11:21:09] [PASSED] Clock 297000 BPP 24 DSC disabled
[11:21:09] [PASSED] Clock 332880 BPP 24 DSC enabled
[11:21:09] [PASSED] Clock 324540 BPP 24 DSC enabled
[11:21:09] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[11:21:09] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[11:21:09] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[11:21:09] [PASSED] DP_POWER_UP_PHY with port number
[11:21:09] [PASSED] DP_POWER_DOWN_PHY with port number
[11:21:09] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[11:21:09] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[11:21:09] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[11:21:09] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[11:21:09] [PASSED] DP_QUERY_PAYLOAD with port number
[11:21:09] [PASSED] DP_QUERY_PAYLOAD with VCPI
[11:21:09] [PASSED] DP_REMOTE_DPCD_READ with port number
[11:21:09] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[11:21:09] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[11:21:09] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[11:21:09] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[11:21:09] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[11:21:09] [PASSED] DP_REMOTE_I2C_READ with port number
[11:21:09] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[11:21:09] [PASSED] DP_REMOTE_I2C_READ with transactions array
[11:21:09] [PASSED] DP_REMOTE_I2C_WRITE with port number
[11:21:09] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[11:21:09] [PASSED] DP_REMOTE_I2C_WRITE with data array
[11:21:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[11:21:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[11:21:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[11:21:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[11:21:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[11:21:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[11:21:09] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[11:21:09] ================ [PASSED] drm_dp_mst_helper ================
[11:21:09] ================= drm_format_helper_test  ==================
[11:21:09] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[11:21:09] [PASSED] single_pixel_source_buffer
[11:21:09] [PASSED] single_pixel_clip_rectangle
[11:21:09] [PASSED] well_known_colors
[11:21:09] [PASSED] destination_pitch
[11:21:09] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[11:21:09] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[11:21:09] [PASSED] single_pixel_source_buffer
[11:21:09] [PASSED] single_pixel_clip_rectangle
[11:21:09] [PASSED] well_known_colors
[11:21:09] [PASSED] destination_pitch
[11:21:09] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[11:21:09] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[11:21:09] [PASSED] single_pixel_source_buffer
[11:21:09] [PASSED] single_pixel_clip_rectangle
[11:21:09] [PASSED] well_known_colors
[11:21:09] [PASSED] destination_pitch
[11:21:09] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[11:21:09] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[11:21:09] [PASSED] single_pixel_source_buffer
[11:21:09] [PASSED] single_pixel_clip_rectangle
[11:21:09] [PASSED] well_known_colors
[11:21:09] [PASSED] destination_pitch
[11:21:09] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[11:21:09] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[11:21:09] [PASSED] single_pixel_source_buffer
[11:21:09] [PASSED] single_pixel_clip_rectangle
[11:21:09] [PASSED] well_known_colors
[11:21:09] [PASSED] destination_pitch
[11:21:09] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[11:21:09] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[11:21:09] [PASSED] single_pixel_source_buffer
[11:21:09] [PASSED] single_pixel_clip_rectangle
[11:21:09] [PASSED] well_known_colors
[11:21:09] [PASSED] destination_pitch
[11:21:09] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[11:21:09] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[11:21:09] [PASSED] single_pixel_source_buffer
[11:21:09] [PASSED] single_pixel_clip_rectangle
[11:21:09] [PASSED] well_known_colors
[11:21:09] [PASSED] destination_pitch
[11:21:09] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[11:21:09] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[11:21:09] [PASSED] single_pixel_source_buffer
[11:21:09] [PASSED] single_pixel_clip_rectangle
[11:21:09] [PASSED] well_known_colors
[11:21:09] [PASSED] destination_pitch
[11:21:09] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[11:21:09] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[11:21:09] [PASSED] single_pixel_source_buffer
[11:21:09] [PASSED] single_pixel_clip_rectangle
[11:21:09] [PASSED] well_known_colors
[11:21:09] [PASSED] destination_pitch
[11:21:09] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[11:21:09] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[11:21:09] [PASSED] single_pixel_source_buffer
[11:21:09] [PASSED] single_pixel_clip_rectangle
[11:21:09] [PASSED] well_known_colors
[11:21:09] [PASSED] destination_pitch
[11:21:09] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[11:21:09] ============== drm_test_fb_xrgb8888_to_mono  ===============
[11:21:09] [PASSED] single_pixel_source_buffer
[11:21:09] [PASSED] single_pixel_clip_rectangle
[11:21:09] [PASSED] well_known_colors
[11:21:09] [PASSED] destination_pitch
[11:21:09] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[11:21:09] ==================== drm_test_fb_swab  =====================
[11:21:09] [PASSED] single_pixel_source_buffer
[11:21:09] [PASSED] single_pixel_clip_rectangle
[11:21:09] [PASSED] well_known_colors
[11:21:09] [PASSED] destination_pitch
[11:21:09] ================ [PASSED] drm_test_fb_swab =================
[11:21:09] ================= drm_test_fb_clip_offset  =================
[11:21:09] [PASSED] pass through
[11:21:09] [PASSED] horizontal offset
[11:21:09] [PASSED] vertical offset
[11:21:09] [PASSED] horizontal and vertical offset
[11:21:09] [PASSED] horizontal offset (custom pitch)
[11:21:09] [PASSED] vertical offset (custom pitch)
[11:21:09] [PASSED] horizontal and vertical offset (custom pitch)
[11:21:09] ============= [PASSED] drm_test_fb_clip_offset =============
[11:21:09] ============== drm_test_fb_build_fourcc_list  ==============
[11:21:09] [PASSED] no native formats
[11:21:09] [PASSED] XRGB8888 as native format
[11:21:09] [PASSED] remove duplicates
[11:21:09] [PASSED] convert alpha formats
[11:21:09] [PASSED] random formats
[11:21:09] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[11:21:09] =================== drm_test_fb_memcpy  ====================
[11:21:09] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[11:21:09] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[11:21:09] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[11:21:09] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[11:21:09] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[11:21:09] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[11:21:09] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[11:21:09] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[11:21:09] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[11:21:09] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[11:21:09] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[11:21:09] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[11:21:09] =============== [PASSED] drm_test_fb_memcpy ================
[11:21:09] ============= [PASSED] drm_format_helper_test ==============
[11:21:09] ======================= drm_format  ========================
[11:21:09] [PASSED] drm_test_format_block_width_invalid
[11:21:09] [PASSED] drm_test_format_block_width_one_plane
[11:21:09] [PASSED] drm_test_format_block_width_two_plane
[11:21:09] [PASSED] drm_test_format_block_width_three_plane
[11:21:09] [PASSED] drm_test_format_block_width_tiled
[11:21:09] [PASSED] drm_test_format_block_height_invalid
[11:21:09] [PASSED] drm_test_format_block_height_one_plane
[11:21:09] [PASSED] drm_test_format_block_height_two_plane
[11:21:09] [PASSED] drm_test_format_block_height_three_plane
[11:21:09] [PASSED] drm_test_format_block_height_tiled
[11:21:09] [PASSED] drm_test_format_min_pitch_invalid
[11:21:09] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[11:21:09] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[11:21:09] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[11:21:09] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[11:21:09] [PASSED] drm_test_format_min_pitch_two_plane
[11:21:09] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[11:21:09] [PASSED] drm_test_format_min_pitch_tiled
[11:21:09] =================== [PASSED] drm_format ====================
[11:21:09] ===================== drm_framebuffer  =====================
[11:21:09] =============== drm_test_framebuffer_create  ===============
[11:21:09] [PASSED] ABGR8888 normal sizes
[11:21:09] [PASSED] ABGR8888 max sizes
[11:21:09] [PASSED] ABGR8888 pitch greater than min required
[11:21:09] [PASSED] ABGR8888 pitch less than min required
[11:21:09] [PASSED] ABGR8888 Invalid width
[11:21:09] [PASSED] ABGR8888 Invalid buffer handle
[11:21:09] [PASSED] No pixel format
[11:21:09] [PASSED] ABGR8888 Width 0
[11:21:09] [PASSED] ABGR8888 Height 0
[11:21:09] [PASSED] ABGR8888 Out of bound height * pitch combination
[11:21:09] [PASSED] ABGR8888 Large buffer offset
[11:21:09] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[11:21:09] [PASSED] ABGR8888 Valid buffer modifier
[11:21:09] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[11:21:09] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[11:21:09] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[11:21:09] [PASSED] NV12 Normal sizes
[11:21:09] [PASSED] NV12 Max sizes
[11:21:09] [PASSED] NV12 Invalid pitch
[11:21:09] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[11:21:09] [PASSED] NV12 different  modifier per-plane
[11:21:09] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[11:21:09] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[11:21:09] [PASSED] NV12 Modifier for inexistent plane
[11:21:09] [PASSED] NV12 Handle for inexistent plane
[11:21:09] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[11:21:09] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[11:21:09] [PASSED] YVU420 Normal sizes
[11:21:09] [PASSED] YVU420 Max sizes
[11:21:09] [PASSED] YVU420 Invalid pitch
[11:21:09] [PASSED] YVU420 Different pitches
[11:21:09] [PASSED] YVU420 Different buffer offsets/pitches
[11:21:09] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[11:21:09] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[11:21:09] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[11:21:09] [PASSED] YVU420 Valid modifier
[11:21:09] [PASSED] YVU420 Different modifiers per plane
[11:21:09] [PASSED] YVU420 Modifier for inexistent plane
[11:21:09] [PASSED] X0L2 Normal sizes
[11:21:09] [PASSED] X0L2 Max sizes
[11:21:09] [PASSED] X0L2 Invalid pitch
[11:21:09] [PASSED] X0L2 Pitch greater than minimum required
[11:21:09] [PASSED] X0L2 Handle for inexistent plane
[11:21:09] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[11:21:09] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[11:21:09] [PASSED] X0L2 Valid modifier
[11:21:09] [PASSED] X0L2 Modifier for inexistent plane
[11:21:09] =========== [PASSED] drm_test_framebuffer_create ===========
[11:21:09] ================= [PASSED] drm_framebuffer =================
[11:21:09] ==================== drm-test-managed  =====================
[11:21:09] [PASSED] drm_test_managed_run_action
[11:21:09] ================ [PASSED] drm-test-managed =================
[11:21:09] ========================= drm_mm  ==========================
[11:21:09] [PASSED] drm_test_mm_init
[11:21:09] [PASSED] drm_test_mm_debug
[11:21:19] [PASSED] drm_test_mm_reserve
[11:21:30] [PASSED] drm_test_mm_insert
[11:21:30] [PASSED] drm_test_mm_replace
[11:21:30] [PASSED] drm_test_mm_insert_range
[11:21:30] [PASSED] drm_test_mm_frag
[11:21:30] [PASSED] drm_test_mm_align
[11:21:30] [PASSED] drm_test_mm_align32
[11:21:31] [PASSED] drm_test_mm_align64
[11:21:31] [PASSED] drm_test_mm_evict
[11:21:31] [PASSED] drm_test_mm_evict_range
[11:21:31] [PASSED] drm_test_mm_topdown
[11:21:31] [PASSED] drm_test_mm_bottomup
[11:21:31] [PASSED] drm_test_mm_lowest
[11:21:31] [PASSED] drm_test_mm_highest
[11:21:32] [PASSED] drm_test_mm_color
[11:21:32] [PASSED] drm_test_mm_color_evict
[11:21:32] [PASSED] drm_test_mm_color_evict_range
[11:21:32] ===================== [PASSED] drm_mm ======================
[11:21:32] =================== drm_modes_analog_tv  ===================
[11:21:32] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[11:21:32] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[11:21:32] [PASSED] drm_test_modes_analog_tv_pal_576i
[11:21:32] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[11:21:32] =============== [PASSED] drm_modes_analog_tv ===============
[11:21:32] ==================== drm_plane_helper  =====================
[11:21:32] =============== drm_test_check_plane_state  ================
[11:21:32] [PASSED] clipping_simple
[11:21:32] [PASSED] clipping_rotate_reflect
[11:21:32] [PASSED] positioning_simple
[11:21:32] [PASSED] upscaling
[11:21:32] [PASSED] downscaling
[11:21:32] [PASSED] rounding1
[11:21:32] [PASSED] rounding2
[11:21:32] [PASSED] rounding3
[11:21:32] [PASSED] rounding4
[11:21:32] =========== [PASSED] drm_test_check_plane_state ============
[11:21:32] =========== drm_test_check_invalid_plane_state  ============
[11:21:32] [PASSED] positioning_invalid
[11:21:32] [PASSED] upscaling_invalid
[11:21:32] [PASSED] downscaling_invalid
[11:21:32] ======= [PASSED] drm_test_check_invalid_plane_state ========
[11:21:32] ================ [PASSED] drm_plane_helper =================
[11:21:32] ============ drm_connector_helper_tv_get_modes  ============
[11:21:32] ====== drm_test_connector_helper_tv_get_modes_check  =======
[11:21:32] [PASSED] None
[11:21:32] [PASSED] PAL
[11:21:32] [PASSED] NTSC
[11:21:32] [PASSED] Both, NTSC Default
[11:21:32] [PASSED] Both, PAL Default
[11:21:32] [PASSED] Both, NTSC Default, with PAL on command-line
[11:21:32] [PASSED] Both, PAL Default, with NTSC on command-line
[11:21:32] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[11:21:32] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[11:21:32] ======================== drm_rect  =========================
[11:21:32] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[11:21:32] [PASSED] drm_test_rect_clip_scaled_not_clipped
[11:21:32] [PASSED] drm_test_rect_clip_scaled_clipped
[11:21:32] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[11:21:32] ================= drm_test_rect_intersect  =================
[11:21:32] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[11:21:32] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[11:21:32] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[11:21:32] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[11:21:32] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[11:21:32] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[11:21:32] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[11:21:32] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[11:21:32] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[11:21:32] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[11:21:32] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[11:21:32] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[11:21:32] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[11:21:32] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[11:21:32] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[11:21:32] ============= [PASSED] drm_test_rect_intersect =============
[11:21:32] ================ drm_test_rect_calc_hscale  ================
[11:21:32] [PASSED] normal use
[11:21:32] [PASSED] out of max range
[11:21:32] [PASSED] out of min range
[11:21:32] [PASSED] zero dst
[11:21:32] [PASSED] negative src
[11:21:32] [PASSED] negative dst
[11:21:32] ============ [PASSED] drm_test_rect_calc_hscale ============
[11:21:32] ================ drm_test_rect_calc_vscale  ================
[11:21:32] [PASSED] normal use
[11:21:32] [PASSED] out of max range
[11:21:32] [PASSED] out of min range
[11:21:32] [PASSED] zero dst
[11:21:32] [PASSED] negative src
[11:21:32] [PASSED] negative dst
[11:21:32] ============ [PASSED] drm_test_rect_calc_vscale ============
[11:21:32] ================== drm_test_rect_rotate  ===================
[11:21:32] [PASSED] reflect-x
[11:21:32] [PASSED] reflect-y
[11:21:32] [PASSED] rotate-0
[11:21:32] [PASSED] rotate-90
[11:21:32] [PASSED] rotate-180
[11:21:32] [PASSED] rotate-270
[11:21:32] ============== [PASSED] drm_test_rect_rotate ===============
[11:21:32] ================ drm_test_rect_rotate_inv  =================
[11:21:32] [PASSED] reflect-x
[11:21:32] [PASSED] reflect-y
[11:21:32] [PASSED] rotate-0
[11:21:32] [PASSED] rotate-90
[11:21:32] [PASSED] rotate-180
[11:21:32] [PASSED] rotate-270
[11:21:32] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[11:21:32] ==================== [PASSED] drm_rect =====================
[11:21:32] ======================== drm_exec  =========================
[11:21:32] [PASSED] sanitycheck
[11:21:32] [PASSED] test_lock
[11:21:32] [PASSED] test_lock_unlock
[11:21:32] [PASSED] test_duplicates
[11:21:32] [PASSED] test_prepare
[11:21:32] [PASSED] test_prepare_array
[11:21:32] [PASSED] test_multiple_loops
[11:21:32] ==================== [PASSED] drm_exec =====================
[11:21:32] ============================================================
[11:21:32] Testing complete. Ran 368 tests: passed: 368
[11:21:32] Elapsed time: 44.506s total, 1.641s configuring, 19.134s building, 23.696s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


