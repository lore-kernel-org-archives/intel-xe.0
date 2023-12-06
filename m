Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3202C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 07:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D35910E695;
	Wed,  6 Dec 2023 07:35:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C2D9310E695;
 Wed,  6 Dec 2023 07:35:52 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A3912AADDD;
 Wed,  6 Dec 2023 07:35:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Date: Wed, 06 Dec 2023 07:35:51 -0000
Message-ID: <170184815166.26423.11258068066375633044@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231206034130.7897-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20231206034130.7897-1-krishnaiah.bommu@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_RFC=3A_?=
 =?utf-8?q?drm/xe/uapi=3A_Return_correct_error_code_for_xe=5Fwait=5Fuser?=
 =?utf-8?q?=5Ffence=5Fioctl_=28rev3=29?=
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

Series: RFC: drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl (rev3)
URL   : https://patchwork.freedesktop.org/series/127365/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[07:34:39] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:34:44] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[07:35:04] Starting KUnit Kernel (1/1)...
[07:35:04] ============================================================
[07:35:04] ========================== xe_bo  ==========================
[07:35:04] [SKIPPED] xe_ccs_migrate_kunit
[07:35:04] [SKIPPED] xe_bo_evict_kunit
[07:35:04] ===================== [SKIPPED] xe_bo ======================
[07:35:04] ======================= xe_dma_buf  ========================
[07:35:04] [SKIPPED] xe_dma_buf_kunit
[07:35:04] =================== [SKIPPED] xe_dma_buf ===================
[07:35:04] ======================= xe_migrate  ========================
[07:35:04] [SKIPPED] xe_migrate_sanity_kunit
[07:35:04] =================== [SKIPPED] xe_migrate ===================
[07:35:04] ========================= xe_mocs  =========================
[07:35:04] [SKIPPED] xe_live_mocs_kernel_kunit
[07:35:04] ==================== [SKIPPED] xe_mocs =====================
[07:35:04] ========================= xe_pci  ==========================
[07:35:04] [PASSED] xe_gmdid_graphics_ip
[07:35:04] [PASSED] xe_gmdid_media_ip
[07:35:04] ===================== [PASSED] xe_pci ======================
[07:35:04] ========================= xe_rtp  ==========================
[07:35:04] ================== xe_rtp_process_tests  ===================
[07:35:04] [PASSED] coalesce-same-reg
[07:35:04] [PASSED] no-match-no-add
[07:35:04] [PASSED] no-match-no-add-multiple-rules
[07:35:04] [PASSED] two-regs-two-entries
[07:35:04] [PASSED] clr-one-set-other
[07:35:04] [PASSED] set-field
[07:35:04] [PASSED] conflict-duplicate
[07:35:04] [PASSED] conflict-not-disjoint
[07:35:04] [PASSED] conflict-reg-type
[07:35:04] ============== [PASSED] xe_rtp_process_tests ===============
[07:35:04] ===================== [PASSED] xe_rtp ======================
[07:35:04] ========================== xe_wa  ==========================
[07:35:04] ======================== xe_wa_gt  =========================
[07:35:04] [PASSED] TIGERLAKE (B0)
[07:35:04] [PASSED] DG1 (A0)
[07:35:04] [PASSED] DG1 (B0)
[07:35:04] [PASSED] ALDERLAKE_S (A0)
[07:35:04] [PASSED] ALDERLAKE_S (B0)
[07:35:04] [PASSED] ALDERLAKE_S (C0)
[07:35:04] [PASSED] ALDERLAKE_S (D0)
[07:35:04] [PASSED] ALDERLAKE_P (A0)
[07:35:04] [PASSED] ALDERLAKE_P (B0)
[07:35:04] [PASSED] ALDERLAKE_P (C0)
[07:35:04] [PASSED] ALDERLAKE_S_RPLS (D0)
[07:35:04] [PASSED] ALDERLAKE_P_RPLU (E0)
[07:35:04] [PASSED] DG2_G10 (A0)
[07:35:04] [PASSED] DG2_G10 (A1)
[07:35:04] [PASSED] DG2_G10 (B0)
[07:35:04] [PASSED] DG2_G10 (C0)
[07:35:04] [PASSED] DG2_G11 (A0)
[07:35:04] [PASSED] DG2_G11 (B0)
[07:35:04] [PASSED] DG2_G11 (B1)
[07:35:04] [PASSED] DG2_G12 (A0)
[07:35:04] [PASSED] DG2_G12 (A1)
[07:35:04] [PASSED] PVC (B0)
[07:35:04] [PASSED] PVC (B1)
[07:35:04] [PASSED] PVC (C0)
[07:35:04] [PASSED] METEORLAKE (g:A0, m:A0)
[07:35:04] [PASSED] METEORLAKE (g:A0, m:A0)
[07:35:04] [PASSED] LUNARLAKE (g:A0, m:A0)
[07:35:04] [PASSED] LUNARLAKE (g:B0, m:A0)
[07:35:04] ==================== [PASSED] xe_wa_gt =====================
[07:35:04] ====================== [PASSED] xe_wa ======================
[07:35:04] ============================================================
[07:35:04] Testing complete. Ran 44 tests: passed: 39, skipped: 5
[07:35:04] Elapsed time: 24.506s total, 4.205s configuring, 20.182s building, 0.096s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[07:35:04] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:35:06] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[07:35:25] Starting KUnit Kernel (1/1)...
[07:35:25] ============================================================
[07:35:25] ================== drm_test_pick_cmdline  ==================
[07:35:25] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[07:35:25] =============== drm_test_pick_cmdline_named  ===============
[07:35:25] [PASSED] NTSC
[07:35:25] [PASSED] NTSC-J
[07:35:25] [PASSED] PAL
[07:35:25] [PASSED] PAL-M
[07:35:25] =========== [PASSED] drm_test_pick_cmdline_named ===========
[07:35:25] ============== [PASSED] drm_test_pick_cmdline ==============
[07:35:25] ======================== drm_buddy  ========================
[07:35:25] [PASSED] drm_test_buddy_alloc_limit
[07:35:25] [PASSED] drm_test_buddy_alloc_range
[07:35:25] [PASSED] drm_test_buddy_alloc_optimistic
[07:35:25] [PASSED] drm_test_buddy_alloc_pessimistic
[07:35:25] [PASSED] drm_test_buddy_alloc_smoke
[07:35:25] [PASSED] drm_test_buddy_alloc_pathological
[07:35:25] ==================== [PASSED] drm_buddy ====================
[07:35:25] =================== drm_cmdline_parser  ====================
[07:35:25] [PASSED] drm_test_cmdline_force_d_only
[07:35:25] [PASSED] drm_test_cmdline_force_D_only_dvi
[07:35:25] [PASSED] drm_test_cmdline_force_D_only_hdmi
[07:35:25] [PASSED] drm_test_cmdline_force_D_only_not_digital
[07:35:25] [PASSED] drm_test_cmdline_force_e_only
[07:35:25] [PASSED] drm_test_cmdline_res
[07:35:25] [PASSED] drm_test_cmdline_res_vesa
[07:35:25] [PASSED] drm_test_cmdline_res_vesa_rblank
[07:35:25] [PASSED] drm_test_cmdline_res_rblank
[07:35:25] [PASSED] drm_test_cmdline_res_bpp
[07:35:25] [PASSED] drm_test_cmdline_res_refresh
[07:35:25] [PASSED] drm_test_cmdline_res_bpp_refresh
[07:35:25] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[07:35:25] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[07:35:25] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[07:35:25] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[07:35:25] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[07:35:25] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[07:35:25] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[07:35:25] [PASSED] drm_test_cmdline_res_margins_force_on
[07:35:25] [PASSED] drm_test_cmdline_res_vesa_margins
[07:35:25] [PASSED] drm_test_cmdline_name
[07:35:25] [PASSED] drm_test_cmdline_name_bpp
[07:35:25] [PASSED] drm_test_cmdline_name_option
[07:35:25] [PASSED] drm_test_cmdline_name_bpp_option
[07:35:25] [PASSED] drm_test_cmdline_rotate_0
[07:35:25] [PASSED] drm_test_cmdline_rotate_90
[07:35:25] [PASSED] drm_test_cmdline_rotate_180
[07:35:25] [PASSED] drm_test_cmdline_rotate_270
[07:35:25] [PASSED] drm_test_cmdline_hmirror
[07:35:25] [PASSED] drm_test_cmdline_vmirror
[07:35:25] [PASSED] drm_test_cmdline_margin_options
[07:35:25] [PASSED] drm_test_cmdline_multiple_options
[07:35:25] [PASSED] drm_test_cmdline_bpp_extra_and_option
[07:35:25] [PASSED] drm_test_cmdline_extra_and_option
[07:35:25] [PASSED] drm_test_cmdline_freestanding_options
[07:35:25] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[07:35:25] [PASSED] drm_test_cmdline_panel_orientation
[07:35:25] ================ drm_test_cmdline_invalid  =================
[07:35:25] [PASSED] margin_only
[07:35:25] [PASSED] interlace_only
[07:35:25] [PASSED] res_missing_x
[07:35:25] [PASSED] res_missing_y
[07:35:25] [PASSED] res_bad_y
[07:35:25] [PASSED] res_missing_y_bpp
[07:35:25] [PASSED] res_bad_bpp
[07:35:25] [PASSED] res_bad_refresh
[07:35:25] [PASSED] res_bpp_refresh_force_on_off
[07:35:25] [PASSED] res_invalid_mode
[07:35:25] [PASSED] res_bpp_wrong_place_mode
[07:35:25] [PASSED] name_bpp_refresh
[07:35:25] [PASSED] name_refresh
[07:35:25] [PASSED] name_refresh_wrong_mode
[07:35:25] [PASSED] name_refresh_invalid_mode
[07:35:25] [PASSED] rotate_multiple
[07:35:25] [PASSED] rotate_invalid_val
[07:35:25] [PASSED] rotate_truncated
[07:35:25] [PASSED] invalid_option
[07:35:25] [PASSED] invalid_tv_option
[07:35:25] [PASSED] truncated_tv_option
[07:35:25] ============ [PASSED] drm_test_cmdline_invalid =============
[07:35:25] =============== drm_test_cmdline_tv_options  ===============
[07:35:25] [PASSED] NTSC
[07:35:25] [PASSED] NTSC_443
[07:35:25] [PASSED] NTSC_J
[07:35:25] [PASSED] PAL
[07:35:25] [PASSED] PAL_M
[07:35:25] [PASSED] PAL_N
[07:35:25] [PASSED] SECAM
[07:35:25] =========== [PASSED] drm_test_cmdline_tv_options ===========
[07:35:25] =============== [PASSED] drm_cmdline_parser ================
[07:35:25] ================ drm_get_tv_mode_from_name  ================
[07:35:25] ========== drm_test_get_tv_mode_from_name_valid  ===========
[07:35:25] [PASSED] NTSC
[07:35:25] [PASSED] NTSC-443
[07:35:25] [PASSED] NTSC-J
[07:35:25] [PASSED] PAL
[07:35:25] [PASSED] PAL-M
[07:35:25] [PASSED] PAL-N
[07:35:25] [PASSED] SECAM
[07:35:25] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[07:35:25] [PASSED] drm_test_get_tv_mode_from_name_truncated
[07:35:25] ============ [PASSED] drm_get_tv_mode_from_name ============
[07:35:25] ==================== drm_damage_helper  ====================
[07:35:25] [PASSED] drm_test_damage_iter_no_damage
[07:35:25] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[07:35:25] [PASSED] drm_test_damage_iter_no_damage_src_moved
[07:35:25] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[07:35:25] [PASSED] drm_test_damage_iter_no_damage_not_visible
[07:35:25] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[07:35:25] [PASSED] drm_test_damage_iter_no_damage_no_fb
[07:35:25] [PASSED] drm_test_damage_iter_simple_damage
[07:35:25] [PASSED] drm_test_damage_iter_single_damage
[07:35:25] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[07:35:25] [PASSED] drm_test_damage_iter_single_damage_outside_src
[07:35:25] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[07:35:25] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[07:35:25] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[07:35:25] [PASSED] drm_test_damage_iter_single_damage_src_moved
[07:35:25] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[07:35:25] [PASSED] drm_test_damage_iter_damage
[07:35:25] [PASSED] drm_test_damage_iter_damage_one_intersect
[07:35:25] [PASSED] drm_test_damage_iter_damage_one_outside
[07:35:25] [PASSED] drm_test_damage_iter_damage_src_moved
[07:35:25] [PASSED] drm_test_damage_iter_damage_not_visible
[07:35:25] ================ [PASSED] drm_damage_helper ================
[07:35:25] ==================== drm_dp_mst_helper  ====================
[07:35:25] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[07:35:25] [PASSED] Clock 154000 BPP 30 DSC disabled
[07:35:25] [PASSED] Clock 234000 BPP 30 DSC disabled
[07:35:25] [PASSED] Clock 297000 BPP 24 DSC disabled
[07:35:25] [PASSED] Clock 332880 BPP 24 DSC enabled
[07:35:25] [PASSED] Clock 324540 BPP 24 DSC enabled
[07:35:25] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[07:35:25] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[07:35:25] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[07:35:25] [PASSED] DP_POWER_UP_PHY with port number
[07:35:25] [PASSED] DP_POWER_DOWN_PHY with port number
[07:35:25] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[07:35:25] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[07:35:25] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[07:35:25] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[07:35:25] [PASSED] DP_QUERY_PAYLOAD with port number
[07:35:25] [PASSED] DP_QUERY_PAYLOAD with VCPI
[07:35:25] [PASSED] DP_REMOTE_DPCD_READ with port number
[07:35:25] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[07:35:25] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[07:35:25] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[07:35:25] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[07:35:25] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[07:35:25] [PASSED] DP_REMOTE_I2C_READ with port number
[07:35:25] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[07:35:25] [PASSED] DP_REMOTE_I2C_READ with transactions array
[07:35:25] [PASSED] DP_REMOTE_I2C_WRITE with port number
[07:35:25] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[07:35:25] [PASSED] DP_REMOTE_I2C_WRITE with data array
[07:35:25] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[07:35:25] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[07:35:25] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[07:35:25] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[07:35:25] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[07:35:25] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[07:35:25] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[07:35:25] ================ [PASSED] drm_dp_mst_helper ================
[07:35:25] ================= drm_format_helper_test  ==================
[07:35:25] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[07:35:25] [PASSED] single_pixel_source_buffer
[07:35:25] [PASSED] single_pixel_clip_rectangle
[07:35:25] [PASSED] well_known_colors
[07:35:25] [PASSED] destination_pitch
[07:35:25] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[07:35:25] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[07:35:25] [PASSED] single_pixel_source_buffer
[07:35:25] [PASSED] single_pixel_clip_rectangle
[07:35:25] [PASSED] well_known_colors
[07:35:25] [PASSED] destination_pitch
[07:35:25] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[07:35:25] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[07:35:25] [PASSED] single_pixel_source_buffer
[07:35:25] [PASSED] single_pixel_clip_rectangle
[07:35:25] [PASSED] well_known_colors
[07:35:25] [PASSED] destination_pitch
[07:35:25] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[07:35:25] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[07:35:25] [PASSED] single_pixel_source_buffer
[07:35:25] [PASSED] single_pixel_clip_rectangle
[07:35:25] [PASSED] well_known_colors
[07:35:25] [PASSED] destination_pitch
[07:35:25] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[07:35:25] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[07:35:25] [PASSED] single_pixel_source_buffer
[07:35:25] [PASSED] single_pixel_clip_rectangle
[07:35:25] [PASSED] well_known_colors
[07:35:25] [PASSED] destination_pitch
[07:35:25] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[07:35:25] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[07:35:25] [PASSED] single_pixel_source_buffer
[07:35:25] [PASSED] single_pixel_clip_rectangle
[07:35:25] [PASSED] well_known_colors
[07:35:25] [PASSED] destination_pitch
[07:35:25] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[07:35:25] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[07:35:25] [PASSED] single_pixel_source_buffer
[07:35:25] [PASSED] single_pixel_clip_rectangle
[07:35:25] [PASSED] well_known_colors
[07:35:25] [PASSED] destination_pitch
[07:35:25] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[07:35:25] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[07:35:25] [PASSED] single_pixel_source_buffer
[07:35:25] [PASSED] single_pixel_clip_rectangle
[07:35:25] [PASSED] well_known_colors
[07:35:25] [PASSED] destination_pitch
[07:35:25] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[07:35:25] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[07:35:25] [PASSED] single_pixel_source_buffer
[07:35:25] [PASSED] single_pixel_clip_rectangle
[07:35:25] [PASSED] well_known_colors
[07:35:25] [PASSED] destination_pitch
[07:35:25] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[07:35:25] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[07:35:25] [PASSED] single_pixel_source_buffer
[07:35:25] [PASSED] single_pixel_clip_rectangle
[07:35:25] [PASSED] well_known_colors
[07:35:25] [PASSED] destination_pitch
[07:35:25] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[07:35:25] ============== drm_test_fb_xrgb8888_to_mono  ===============
[07:35:25] [PASSED] single_pixel_source_buffer
[07:35:25] [PASSED] single_pixel_clip_rectangle
[07:35:25] [PASSED] well_known_colors
[07:35:25] [PASSED] destination_pitch
[07:35:25] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[07:35:25] ==================== drm_test_fb_swab  =====================
[07:35:25] [PASSED] single_pixel_source_buffer
[07:35:25] [PASSED] single_pixel_clip_rectangle
[07:35:25] [PASSED] well_known_colors
[07:35:25] [PASSED] destination_pitch
[07:35:25] ================ [PASSED] drm_test_fb_swab =================
[07:35:25] ================= drm_test_fb_clip_offset  =================
[07:35:25] [PASSED] pass through
[07:35:25] [PASSED] horizontal offset
[07:35:25] [PASSED] vertical offset
[07:35:25] [PASSED] horizontal and vertical offset
[07:35:25] [PASSED] horizontal offset (custom pitch)
[07:35:25] [PASSED] vertical offset (custom pitch)
[07:35:25] [PASSED] horizontal and vertical offset (custom pitch)
[07:35:25] ============= [PASSED] drm_test_fb_clip_offset =============
[07:35:25] ============== drm_test_fb_build_fourcc_list  ==============
[07:35:25] [PASSED] no native formats
[07:35:25] [PASSED] XRGB8888 as native format
[07:35:25] [PASSED] remove duplicates
[07:35:25] [PASSED] convert alpha formats
[07:35:25] [PASSED] random formats
[07:35:25] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[07:35:25] =================== drm_test_fb_memcpy  ====================
[07:35:25] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[07:35:25] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[07:35:25] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[07:35:25] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[07:35:25] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[07:35:25] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[07:35:25] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[07:35:25] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[07:35:25] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[07:35:25] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[07:35:25] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[07:35:25] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[07:35:25] =============== [PASSED] drm_test_fb_memcpy ================
[07:35:25] ============= [PASSED] drm_format_helper_test ==============
[07:35:25] ======================= drm_format  ========================
[07:35:25] [PASSED] drm_test_format_block_width_invalid
[07:35:25] [PASSED] drm_test_format_block_width_one_plane
[07:35:25] [PASSED] drm_test_format_block_width_two_plane
[07:35:25] [PASSED] drm_test_format_block_width_three_plane
[07:35:25] [PASSED] drm_test_format_block_width_tiled
[07:35:25] [PASSED] drm_test_format_block_height_invalid
[07:35:25] [PASSED] drm_test_format_block_height_one_plane
[07:35:25] [PASSED] drm_test_format_block_height_two_plane
[07:35:25] [PASSED] drm_test_format_block_height_three_plane
[07:35:25] [PASSED] drm_test_format_block_height_tiled
[07:35:25] [PASSED] drm_test_format_min_pitch_invalid
[07:35:25] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[07:35:25] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[07:35:25] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[07:35:25] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[07:35:25] [PASSED] drm_test_format_min_pitch_two_plane
[07:35:25] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[07:35:25] [PASSED] drm_test_format_min_pitch_tiled
[07:35:25] =================== [PASSED] drm_format ====================
[07:35:25] ===================== drm_framebuffer  =====================
[07:35:25] =============== drm_test_framebuffer_create  ===============
[07:35:25] [PASSED] ABGR8888 normal sizes
[07:35:25] [PASSED] ABGR8888 max sizes
[07:35:25] [PASSED] ABGR8888 pitch greater than min required
[07:35:25] [PASSED] ABGR8888 pitch less than min required
[07:35:25] [PASSED] ABGR8888 Invalid width
[07:35:25] [PASSED] ABGR8888 Invalid buffer handle
[07:35:25] [PASSED] No pixel format
[07:35:25] [PASSED] ABGR8888 Width 0
[07:35:25] [PASSED] ABGR8888 Height 0
[07:35:25] [PASSED] ABGR8888 Out of bound height * pitch combination
[07:35:25] [PASSED] ABGR8888 Large buffer offset
[07:35:25] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[07:35:25] [PASSED] ABGR8888 Valid buffer modifier
[07:35:25] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[07:35:25] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[07:35:25] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[07:35:25] [PASSED] NV12 Normal sizes
[07:35:25] [PASSED] NV12 Max sizes
[07:35:25] [PASSED] NV12 Invalid pitch
[07:35:25] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[07:35:25] [PASSED] NV12 different  modifier per-plane
[07:35:25] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[07:35:25] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[07:35:25] [PASSED] NV12 Modifier for inexistent plane
[07:35:25] [PASSED] NV12 Handle for inexistent plane
[07:35:25] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[07:35:25] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[07:35:25] [PASSED] YVU420 Normal sizes
[07:35:25] [PASSED] YVU420 Max sizes
[07:35:25] [PASSED] YVU420 Invalid pitch
[07:35:25] [PASSED] YVU420 Different pitches
[07:35:25] [PASSED] YVU420 Different buffer offsets/pitches
[07:35:25] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[07:35:25] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[07:35:25] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[07:35:25] [PASSED] YVU420 Valid modifier
[07:35:25] [PASSED] YVU420 Different modifiers per plane
[07:35:25] [PASSED] YVU420 Modifier for inexistent plane
[07:35:25] [PASSED] X0L2 Normal sizes
[07:35:25] [PASSED] X0L2 Max sizes
[07:35:25] [PASSED] X0L2 Invalid pitch
[07:35:25] [PASSED] X0L2 Pitch greater than minimum required
[07:35:25] [PASSED] X0L2 Handle for inexistent plane
[07:35:25] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[07:35:25] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[07:35:25] [PASSED] X0L2 Valid modifier
[07:35:25] [PASSED] X0L2 Modifier for inexistent plane
[07:35:25] =========== [PASSED] drm_test_framebuffer_create ===========
[07:35:25] ================= [PASSED] drm_framebuffer =================
[07:35:25] ==================== drm-test-managed  =====================
[07:35:25] [PASSED] drm_test_managed_run_action
[07:35:25] ================ [PASSED] drm-test-managed =================
[07:35:25] ========================= drm_mm  ==========================
[07:35:25] [PASSED] drm_test_mm_init
[07:35:25] [PASSED] drm_test_mm_debug
[07:35:35] [PASSED] drm_test_mm_reserve
[07:35:45] [PASSED] drm_test_mm_insert
[07:35:46] [PASSED] drm_test_mm_replace
[07:35:46] [PASSED] drm_test_mm_insert_range
[07:35:46] [PASSED] drm_test_mm_frag
[07:35:46] [PASSED] drm_test_mm_align
[07:35:46] [PASSED] drm_test_mm_align32
[07:35:47] [PASSED] drm_test_mm_align64
[07:35:47] [PASSED] drm_test_mm_evict
[07:35:47] [PASSED] drm_test_mm_evict_range
[07:35:47] [PASSED] drm_test_mm_topdown
[07:35:47] [PASSED] drm_test_mm_bottomup
[07:35:47] [PASSED] drm_test_mm_lowest
[07:35:47] [PASSED] drm_test_mm_highest
[07:35:48] [PASSED] drm_test_mm_color
[07:35:48] [PASSED] drm_test_mm_color_evict
[07:35:48] [PASSED] drm_test_mm_color_evict_range
[07:35:48] ===================== [PASSED] drm_mm ======================
[07:35:48] =================== drm_modes_analog_tv  ===================
[07:35:48] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[07:35:48] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[07:35:48] [PASSED] drm_test_modes_analog_tv_pal_576i
[07:35:48] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[07:35:48] =============== [PASSED] drm_modes_analog_tv ===============
[07:35:48] ==================== drm_plane_helper  =====================
[07:35:48] =============== drm_test_check_plane_state  ================
[07:35:48] [PASSED] clipping_simple
[07:35:48] [PASSED] clipping_rotate_reflect
[07:35:48] [PASSED] positioning_simple
[07:35:48] [PASSED] upscaling
[07:35:48] [PASSED] downscaling
[07:35:48] [PASSED] rounding1
[07:35:48] [PASSED] rounding2
[07:35:48] [PASSED] rounding3
[07:35:48] [PASSED] rounding4
[07:35:48] =========== [PASSED] drm_test_check_plane_state ============
[07:35:48] =========== drm_test_check_invalid_plane_state  ============
[07:35:48] [PASSED] positioning_invalid
[07:35:48] [PASSED] upscaling_invalid
[07:35:48] [PASSED] downscaling_invalid
[07:35:48] ======= [PASSED] drm_test_check_invalid_plane_state ========
[07:35:48] ================ [PASSED] drm_plane_helper =================
[07:35:48] ============ drm_connector_helper_tv_get_modes  ============
[07:35:48] ====== drm_test_connector_helper_tv_get_modes_check  =======
[07:35:48] [PASSED] None
[07:35:48] [PASSED] PAL
[07:35:48] [PASSED] NTSC
[07:35:48] [PASSED] Both, NTSC Default
[07:35:48] [PASSED] Both, PAL Default
[07:35:48] [PASSED] Both, NTSC Default, with PAL on command-line
[07:35:48] [PASSED] Both, PAL Default, with NTSC on command-line
[07:35:48] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[07:35:48] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[07:35:48] ======================== drm_rect  =========================
[07:35:48] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[07:35:48] [PASSED] drm_test_rect_clip_scaled_not_clipped
[07:35:48] [PASSED] drm_test_rect_clip_scaled_clipped
[07:35:48] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[07:35:48] ================= drm_test_rect_intersect  =================
[07:35:48] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[07:35:48] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[07:35:48] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[07:35:48] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[07:35:48] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[07:35:48] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[07:35:48] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[07:35:48] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[07:35:48] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[07:35:48] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[07:35:48] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[07:35:48] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[07:35:48] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[07:35:48] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[07:35:48] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[07:35:48] ============= [PASSED] drm_test_rect_intersect =============
[07:35:48] ================ drm_test_rect_calc_hscale  ================
[07:35:48] [PASSED] normal use
[07:35:48] [PASSED] out of max range
[07:35:48] [PASSED] out of min range
[07:35:48] [PASSED] zero dst
[07:35:48] [PASSED] negative src
[07:35:48] [PASSED] negative dst
[07:35:48] ============ [PASSED] drm_test_rect_calc_hscale ============
[07:35:48] ================ drm_test_rect_calc_vscale  ================
[07:35:48] [PASSED] normal use
[07:35:48] [PASSED] out of max range
[07:35:48] [PASSED] out of min range
[07:35:48] [PASSED] zero dst
[07:35:48] [PASSED] negative src
[07:35:48] [PASSED] negative dst
[07:35:48] ============ [PASSED] drm_test_rect_calc_vscale ============
[07:35:48] ================== drm_test_rect_rotate  ===================
[07:35:48] [PASSED] reflect-x
[07:35:48] [PASSED] reflect-y
[07:35:48] [PASSED] rotate-0
[07:35:48] [PASSED] rotate-90
[07:35:48] [PASSED] rotate-180
[07:35:48] [PASSED] rotate-270
[07:35:48] ============== [PASSED] drm_test_rect_rotate ===============
[07:35:48] ================ drm_test_rect_rotate_inv  =================
[07:35:48] [PASSED] reflect-x
[07:35:48] [PASSED] reflect-y
[07:35:48] [PASSED] rotate-0
[07:35:48] [PASSED] rotate-90
[07:35:48] [PASSED] rotate-180
[07:35:48] [PASSED] rotate-270
[07:35:48] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[07:35:48] ==================== [PASSED] drm_rect =====================
[07:35:48] ======================== drm_exec  =========================
[07:35:48] [PASSED] sanitycheck
[07:35:48] [PASSED] test_lock
[07:35:48] [PASSED] test_lock_unlock
[07:35:48] [PASSED] test_duplicates
[07:35:48] [PASSED] test_prepare
[07:35:48] [PASSED] test_prepare_array
[07:35:48] [PASSED] test_multiple_loops
[07:35:48] ==================== [PASSED] drm_exec =====================
[07:35:48] ============================================================
[07:35:48] Testing complete. Ran 368 tests: passed: 368
[07:35:48] Elapsed time: 44.277s total, 1.668s configuring, 19.277s building, 23.299s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


