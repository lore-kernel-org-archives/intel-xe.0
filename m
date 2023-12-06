Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F3AC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 06:41:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A774610E678;
	Wed,  6 Dec 2023 06:41:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A84E710E678;
 Wed,  6 Dec 2023 06:41:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9CA2DAADF1;
 Wed,  6 Dec 2023 06:41:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Wed, 06 Dec 2023 06:41:22 -0000
Message-ID: <170184488263.26425.16569273760818815242@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231206000030.3061046-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231206000030.3061046-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Don=27t?=
 =?utf-8?q?_take_a_PM_ref_for_vm-less_permanent_queues?=
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

Series: Don't take a PM ref for vm-less permanent queues
URL   : https://patchwork.freedesktop.org/series/127400/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[06:40:11] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:40:15] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[06:40:35] Starting KUnit Kernel (1/1)...
[06:40:35] ============================================================
[06:40:35] ========================== xe_bo  ==========================
[06:40:35] [SKIPPED] xe_ccs_migrate_kunit
[06:40:35] [SKIPPED] xe_bo_evict_kunit
[06:40:35] ===================== [SKIPPED] xe_bo ======================
[06:40:35] ======================= xe_dma_buf  ========================
[06:40:35] [SKIPPED] xe_dma_buf_kunit
[06:40:35] =================== [SKIPPED] xe_dma_buf ===================
[06:40:35] ======================= xe_migrate  ========================
[06:40:35] [SKIPPED] xe_migrate_sanity_kunit
[06:40:35] =================== [SKIPPED] xe_migrate ===================
[06:40:35] ========================= xe_mocs  =========================
[06:40:35] [SKIPPED] xe_live_mocs_kernel_kunit
[06:40:35] ==================== [SKIPPED] xe_mocs =====================
[06:40:35] ========================= xe_pci  ==========================
[06:40:35] [PASSED] xe_gmdid_graphics_ip
[06:40:35] [PASSED] xe_gmdid_media_ip
[06:40:35] ===================== [PASSED] xe_pci ======================
[06:40:35] ========================= xe_rtp  ==========================
[06:40:35] ================== xe_rtp_process_tests  ===================
[06:40:35] [PASSED] coalesce-same-reg
[06:40:35] [PASSED] no-match-no-add
[06:40:35] [PASSED] no-match-no-add-multiple-rules
[06:40:35] [PASSED] two-regs-two-entries
[06:40:35] [PASSED] clr-one-set-other
[06:40:35] [PASSED] set-field
[06:40:35] [PASSED] conflict-duplicate
[06:40:35] [PASSED] conflict-not-disjoint
[06:40:35] [PASSED] conflict-reg-type
[06:40:35] ============== [PASSED] xe_rtp_process_tests ===============
[06:40:35] ===================== [PASSED] xe_rtp ======================
[06:40:35] ========================== xe_wa  ==========================
[06:40:35] ======================== xe_wa_gt  =========================
[06:40:35] [PASSED] TIGERLAKE (B0)
[06:40:35] [PASSED] DG1 (A0)
[06:40:35] [PASSED] DG1 (B0)
[06:40:35] [PASSED] ALDERLAKE_S (A0)
[06:40:35] [PASSED] ALDERLAKE_S (B0)
[06:40:35] [PASSED] ALDERLAKE_S (C0)
[06:40:35] [PASSED] ALDERLAKE_S (D0)
[06:40:35] [PASSED] ALDERLAKE_P (A0)
[06:40:35] [PASSED] ALDERLAKE_P (B0)
[06:40:35] [PASSED] ALDERLAKE_P (C0)
[06:40:35] [PASSED] ALDERLAKE_S_RPLS (D0)
[06:40:35] [PASSED] ALDERLAKE_P_RPLU (E0)
[06:40:35] [PASSED] DG2_G10 (A0)
[06:40:35] [PASSED] DG2_G10 (A1)
[06:40:35] [PASSED] DG2_G10 (B0)
[06:40:35] [PASSED] DG2_G10 (C0)
[06:40:35] [PASSED] DG2_G11 (A0)
[06:40:35] [PASSED] DG2_G11 (B0)
[06:40:35] [PASSED] DG2_G11 (B1)
[06:40:35] [PASSED] DG2_G12 (A0)
[06:40:35] [PASSED] DG2_G12 (A1)
[06:40:35] [PASSED] PVC (B0)
[06:40:35] [PASSED] PVC (B1)
[06:40:35] [PASSED] PVC (C0)
[06:40:35] [PASSED] METEORLAKE (g:A0, m:A0)
[06:40:35] [PASSED] METEORLAKE (g:A0, m:A0)
[06:40:35] [PASSED] LUNARLAKE (g:A0, m:A0)
[06:40:35] [PASSED] LUNARLAKE (g:B0, m:A0)
[06:40:35] ==================== [PASSED] xe_wa_gt =====================
[06:40:35] ====================== [PASSED] xe_wa ======================
[06:40:35] ============================================================
[06:40:35] Testing complete. Ran 44 tests: passed: 39, skipped: 5
[06:40:35] Elapsed time: 24.478s total, 4.203s configuring, 20.106s building, 0.148s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[06:40:35] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:40:37] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[06:40:56] Starting KUnit Kernel (1/1)...
[06:40:56] ============================================================
[06:40:56] ================== drm_test_pick_cmdline  ==================
[06:40:56] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[06:40:56] =============== drm_test_pick_cmdline_named  ===============
[06:40:56] [PASSED] NTSC
[06:40:56] [PASSED] NTSC-J
[06:40:56] [PASSED] PAL
[06:40:56] [PASSED] PAL-M
[06:40:56] =========== [PASSED] drm_test_pick_cmdline_named ===========
[06:40:56] ============== [PASSED] drm_test_pick_cmdline ==============
[06:40:56] ======================== drm_buddy  ========================
[06:40:56] [PASSED] drm_test_buddy_alloc_limit
[06:40:56] [PASSED] drm_test_buddy_alloc_range
[06:40:56] [PASSED] drm_test_buddy_alloc_optimistic
[06:40:56] [PASSED] drm_test_buddy_alloc_pessimistic
[06:40:56] [PASSED] drm_test_buddy_alloc_smoke
[06:40:56] [PASSED] drm_test_buddy_alloc_pathological
[06:40:56] ==================== [PASSED] drm_buddy ====================
[06:40:56] =================== drm_cmdline_parser  ====================
[06:40:56] [PASSED] drm_test_cmdline_force_d_only
[06:40:56] [PASSED] drm_test_cmdline_force_D_only_dvi
[06:40:56] [PASSED] drm_test_cmdline_force_D_only_hdmi
[06:40:56] [PASSED] drm_test_cmdline_force_D_only_not_digital
[06:40:56] [PASSED] drm_test_cmdline_force_e_only
[06:40:56] [PASSED] drm_test_cmdline_res
[06:40:56] [PASSED] drm_test_cmdline_res_vesa
[06:40:56] [PASSED] drm_test_cmdline_res_vesa_rblank
[06:40:56] [PASSED] drm_test_cmdline_res_rblank
[06:40:56] [PASSED] drm_test_cmdline_res_bpp
[06:40:56] [PASSED] drm_test_cmdline_res_refresh
[06:40:56] [PASSED] drm_test_cmdline_res_bpp_refresh
[06:40:56] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[06:40:56] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[06:40:56] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[06:40:56] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[06:40:56] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[06:40:56] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[06:40:56] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[06:40:56] [PASSED] drm_test_cmdline_res_margins_force_on
[06:40:56] [PASSED] drm_test_cmdline_res_vesa_margins
[06:40:56] [PASSED] drm_test_cmdline_name
[06:40:56] [PASSED] drm_test_cmdline_name_bpp
[06:40:56] [PASSED] drm_test_cmdline_name_option
[06:40:56] [PASSED] drm_test_cmdline_name_bpp_option
[06:40:56] [PASSED] drm_test_cmdline_rotate_0
[06:40:56] [PASSED] drm_test_cmdline_rotate_90
[06:40:56] [PASSED] drm_test_cmdline_rotate_180
[06:40:56] [PASSED] drm_test_cmdline_rotate_270
[06:40:56] [PASSED] drm_test_cmdline_hmirror
[06:40:56] [PASSED] drm_test_cmdline_vmirror
[06:40:56] [PASSED] drm_test_cmdline_margin_options
[06:40:56] [PASSED] drm_test_cmdline_multiple_options
[06:40:56] [PASSED] drm_test_cmdline_bpp_extra_and_option
[06:40:56] [PASSED] drm_test_cmdline_extra_and_option
[06:40:56] [PASSED] drm_test_cmdline_freestanding_options
[06:40:56] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[06:40:56] [PASSED] drm_test_cmdline_panel_orientation
[06:40:56] ================ drm_test_cmdline_invalid  =================
[06:40:56] [PASSED] margin_only
[06:40:56] [PASSED] interlace_only
[06:40:56] [PASSED] res_missing_x
[06:40:56] [PASSED] res_missing_y
[06:40:56] [PASSED] res_bad_y
[06:40:56] [PASSED] res_missing_y_bpp
[06:40:56] [PASSED] res_bad_bpp
[06:40:56] [PASSED] res_bad_refresh
[06:40:56] [PASSED] res_bpp_refresh_force_on_off
[06:40:56] [PASSED] res_invalid_mode
[06:40:56] [PASSED] res_bpp_wrong_place_mode
[06:40:56] [PASSED] name_bpp_refresh
[06:40:56] [PASSED] name_refresh
[06:40:56] [PASSED] name_refresh_wrong_mode
[06:40:56] [PASSED] name_refresh_invalid_mode
[06:40:56] [PASSED] rotate_multiple
[06:40:56] [PASSED] rotate_invalid_val
[06:40:56] [PASSED] rotate_truncated
[06:40:56] [PASSED] invalid_option
[06:40:56] [PASSED] invalid_tv_option
[06:40:56] [PASSED] truncated_tv_option
[06:40:56] ============ [PASSED] drm_test_cmdline_invalid =============
[06:40:56] =============== drm_test_cmdline_tv_options  ===============
[06:40:56] [PASSED] NTSC
[06:40:56] [PASSED] NTSC_443
[06:40:56] [PASSED] NTSC_J
[06:40:56] [PASSED] PAL
[06:40:56] [PASSED] PAL_M
[06:40:56] [PASSED] PAL_N
[06:40:56] [PASSED] SECAM
[06:40:56] =========== [PASSED] drm_test_cmdline_tv_options ===========
[06:40:56] =============== [PASSED] drm_cmdline_parser ================
[06:40:56] ================ drm_get_tv_mode_from_name  ================
[06:40:56] ========== drm_test_get_tv_mode_from_name_valid  ===========
[06:40:56] [PASSED] NTSC
[06:40:56] [PASSED] NTSC-443
[06:40:56] [PASSED] NTSC-J
[06:40:56] [PASSED] PAL
[06:40:56] [PASSED] PAL-M
[06:40:56] [PASSED] PAL-N
[06:40:56] [PASSED] SECAM
[06:40:56] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[06:40:56] [PASSED] drm_test_get_tv_mode_from_name_truncated
[06:40:56] ============ [PASSED] drm_get_tv_mode_from_name ============
[06:40:56] ==================== drm_damage_helper  ====================
[06:40:56] [PASSED] drm_test_damage_iter_no_damage
[06:40:56] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[06:40:56] [PASSED] drm_test_damage_iter_no_damage_src_moved
[06:40:56] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[06:40:56] [PASSED] drm_test_damage_iter_no_damage_not_visible
[06:40:56] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[06:40:56] [PASSED] drm_test_damage_iter_no_damage_no_fb
[06:40:56] [PASSED] drm_test_damage_iter_simple_damage
[06:40:56] [PASSED] drm_test_damage_iter_single_damage
[06:40:56] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[06:40:56] [PASSED] drm_test_damage_iter_single_damage_outside_src
[06:40:56] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[06:40:56] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[06:40:56] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[06:40:56] [PASSED] drm_test_damage_iter_single_damage_src_moved
[06:40:56] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[06:40:56] [PASSED] drm_test_damage_iter_damage
[06:40:56] [PASSED] drm_test_damage_iter_damage_one_intersect
[06:40:56] [PASSED] drm_test_damage_iter_damage_one_outside
[06:40:56] [PASSED] drm_test_damage_iter_damage_src_moved
[06:40:56] [PASSED] drm_test_damage_iter_damage_not_visible
[06:40:56] ================ [PASSED] drm_damage_helper ================
[06:40:56] ==================== drm_dp_mst_helper  ====================
[06:40:56] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[06:40:56] [PASSED] Clock 154000 BPP 30 DSC disabled
[06:40:56] [PASSED] Clock 234000 BPP 30 DSC disabled
[06:40:56] [PASSED] Clock 297000 BPP 24 DSC disabled
[06:40:56] [PASSED] Clock 332880 BPP 24 DSC enabled
[06:40:56] [PASSED] Clock 324540 BPP 24 DSC enabled
[06:40:56] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[06:40:56] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[06:40:56] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[06:40:56] [PASSED] DP_POWER_UP_PHY with port number
[06:40:56] [PASSED] DP_POWER_DOWN_PHY with port number
[06:40:56] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[06:40:56] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[06:40:56] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[06:40:56] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[06:40:56] [PASSED] DP_QUERY_PAYLOAD with port number
[06:40:56] [PASSED] DP_QUERY_PAYLOAD with VCPI
[06:40:56] [PASSED] DP_REMOTE_DPCD_READ with port number
[06:40:56] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[06:40:56] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[06:40:56] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[06:40:56] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[06:40:56] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[06:40:56] [PASSED] DP_REMOTE_I2C_READ with port number
[06:40:56] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[06:40:56] [PASSED] DP_REMOTE_I2C_READ with transactions array
[06:40:56] [PASSED] DP_REMOTE_I2C_WRITE with port number
[06:40:56] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[06:40:56] [PASSED] DP_REMOTE_I2C_WRITE with data array
[06:40:56] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[06:40:56] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[06:40:56] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[06:40:56] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[06:40:56] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[06:40:56] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[06:40:56] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[06:40:56] ================ [PASSED] drm_dp_mst_helper ================
[06:40:56] ================= drm_format_helper_test  ==================
[06:40:56] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[06:40:56] [PASSED] single_pixel_source_buffer
[06:40:56] [PASSED] single_pixel_clip_rectangle
[06:40:56] [PASSED] well_known_colors
[06:40:56] [PASSED] destination_pitch
[06:40:56] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[06:40:56] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[06:40:56] [PASSED] single_pixel_source_buffer
[06:40:56] [PASSED] single_pixel_clip_rectangle
[06:40:56] [PASSED] well_known_colors
[06:40:56] [PASSED] destination_pitch
[06:40:56] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[06:40:56] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[06:40:56] [PASSED] single_pixel_source_buffer
[06:40:56] [PASSED] single_pixel_clip_rectangle
[06:40:56] [PASSED] well_known_colors
[06:40:56] [PASSED] destination_pitch
[06:40:56] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[06:40:56] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[06:40:56] [PASSED] single_pixel_source_buffer
[06:40:56] [PASSED] single_pixel_clip_rectangle
[06:40:56] [PASSED] well_known_colors
[06:40:56] [PASSED] destination_pitch
[06:40:56] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[06:40:56] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[06:40:56] [PASSED] single_pixel_source_buffer
[06:40:56] [PASSED] single_pixel_clip_rectangle
[06:40:56] [PASSED] well_known_colors
[06:40:56] [PASSED] destination_pitch
[06:40:56] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[06:40:56] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[06:40:56] [PASSED] single_pixel_source_buffer
[06:40:56] [PASSED] single_pixel_clip_rectangle
[06:40:56] [PASSED] well_known_colors
[06:40:56] [PASSED] destination_pitch
[06:40:56] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[06:40:56] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[06:40:56] [PASSED] single_pixel_source_buffer
[06:40:56] [PASSED] single_pixel_clip_rectangle
[06:40:56] [PASSED] well_known_colors
[06:40:56] [PASSED] destination_pitch
[06:40:56] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[06:40:56] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[06:40:56] [PASSED] single_pixel_source_buffer
[06:40:56] [PASSED] single_pixel_clip_rectangle
[06:40:56] [PASSED] well_known_colors
[06:40:56] [PASSED] destination_pitch
[06:40:56] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[06:40:56] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[06:40:56] [PASSED] single_pixel_source_buffer
[06:40:56] [PASSED] single_pixel_clip_rectangle
[06:40:56] [PASSED] well_known_colors
[06:40:56] [PASSED] destination_pitch
[06:40:56] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[06:40:56] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[06:40:56] [PASSED] single_pixel_source_buffer
[06:40:56] [PASSED] single_pixel_clip_rectangle
[06:40:56] [PASSED] well_known_colors
[06:40:56] [PASSED] destination_pitch
[06:40:56] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[06:40:56] ============== drm_test_fb_xrgb8888_to_mono  ===============
[06:40:56] [PASSED] single_pixel_source_buffer
[06:40:56] [PASSED] single_pixel_clip_rectangle
[06:40:56] [PASSED] well_known_colors
[06:40:56] [PASSED] destination_pitch
[06:40:56] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[06:40:56] ==================== drm_test_fb_swab  =====================
[06:40:56] [PASSED] single_pixel_source_buffer
[06:40:56] [PASSED] single_pixel_clip_rectangle
[06:40:56] [PASSED] well_known_colors
[06:40:56] [PASSED] destination_pitch
[06:40:56] ================ [PASSED] drm_test_fb_swab =================
[06:40:56] ================= drm_test_fb_clip_offset  =================
[06:40:56] [PASSED] pass through
[06:40:56] [PASSED] horizontal offset
[06:40:56] [PASSED] vertical offset
[06:40:56] [PASSED] horizontal and vertical offset
[06:40:56] [PASSED] horizontal offset (custom pitch)
[06:40:56] [PASSED] vertical offset (custom pitch)
[06:40:56] [PASSED] horizontal and vertical offset (custom pitch)
[06:40:56] ============= [PASSED] drm_test_fb_clip_offset =============
[06:40:56] ============== drm_test_fb_build_fourcc_list  ==============
[06:40:56] [PASSED] no native formats
[06:40:56] [PASSED] XRGB8888 as native format
[06:40:56] [PASSED] remove duplicates
[06:40:56] [PASSED] convert alpha formats
[06:40:56] [PASSED] random formats
[06:40:56] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[06:40:56] =================== drm_test_fb_memcpy  ====================
[06:40:56] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[06:40:56] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[06:40:56] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[06:40:56] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[06:40:56] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[06:40:56] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[06:40:56] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[06:40:56] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[06:40:56] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[06:40:56] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[06:40:56] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[06:40:56] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[06:40:56] =============== [PASSED] drm_test_fb_memcpy ================
[06:40:56] ============= [PASSED] drm_format_helper_test ==============
[06:40:56] ======================= drm_format  ========================
[06:40:56] [PASSED] drm_test_format_block_width_invalid
[06:40:56] [PASSED] drm_test_format_block_width_one_plane
[06:40:56] [PASSED] drm_test_format_block_width_two_plane
[06:40:56] [PASSED] drm_test_format_block_width_three_plane
[06:40:56] [PASSED] drm_test_format_block_width_tiled
[06:40:56] [PASSED] drm_test_format_block_height_invalid
[06:40:56] [PASSED] drm_test_format_block_height_one_plane
[06:40:56] [PASSED] drm_test_format_block_height_two_plane
[06:40:56] [PASSED] drm_test_format_block_height_three_plane
[06:40:56] [PASSED] drm_test_format_block_height_tiled
[06:40:56] [PASSED] drm_test_format_min_pitch_invalid
[06:40:56] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[06:40:56] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[06:40:56] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[06:40:56] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[06:40:56] [PASSED] drm_test_format_min_pitch_two_plane
[06:40:56] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[06:40:56] [PASSED] drm_test_format_min_pitch_tiled
[06:40:56] =================== [PASSED] drm_format ====================
[06:40:56] ===================== drm_framebuffer  =====================
[06:40:56] =============== drm_test_framebuffer_create  ===============
[06:40:56] [PASSED] ABGR8888 normal sizes
[06:40:56] [PASSED] ABGR8888 max sizes
[06:40:56] [PASSED] ABGR8888 pitch greater than min required
[06:40:56] [PASSED] ABGR8888 pitch less than min required
[06:40:56] [PASSED] ABGR8888 Invalid width
[06:40:56] [PASSED] ABGR8888 Invalid buffer handle
[06:40:56] [PASSED] No pixel format
[06:40:56] [PASSED] ABGR8888 Width 0
[06:40:56] [PASSED] ABGR8888 Height 0
[06:40:56] [PASSED] ABGR8888 Out of bound height * pitch combination
[06:40:56] [PASSED] ABGR8888 Large buffer offset
[06:40:56] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[06:40:56] [PASSED] ABGR8888 Valid buffer modifier
[06:40:56] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[06:40:56] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[06:40:56] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[06:40:56] [PASSED] NV12 Normal sizes
[06:40:56] [PASSED] NV12 Max sizes
[06:40:56] [PASSED] NV12 Invalid pitch
[06:40:56] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[06:40:56] [PASSED] NV12 different  modifier per-plane
[06:40:56] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[06:40:56] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[06:40:56] [PASSED] NV12 Modifier for inexistent plane
[06:40:56] [PASSED] NV12 Handle for inexistent plane
[06:40:56] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[06:40:56] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[06:40:56] [PASSED] YVU420 Normal sizes
[06:40:56] [PASSED] YVU420 Max sizes
[06:40:56] [PASSED] YVU420 Invalid pitch
[06:40:56] [PASSED] YVU420 Different pitches
[06:40:56] [PASSED] YVU420 Different buffer offsets/pitches
[06:40:56] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[06:40:56] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[06:40:56] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[06:40:56] [PASSED] YVU420 Valid modifier
[06:40:56] [PASSED] YVU420 Different modifiers per plane
[06:40:56] [PASSED] YVU420 Modifier for inexistent plane
[06:40:56] [PASSED] X0L2 Normal sizes
[06:40:56] [PASSED] X0L2 Max sizes
[06:40:56] [PASSED] X0L2 Invalid pitch
[06:40:56] [PASSED] X0L2 Pitch greater than minimum required
[06:40:56] [PASSED] X0L2 Handle for inexistent plane
[06:40:56] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[06:40:56] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[06:40:56] [PASSED] X0L2 Valid modifier
[06:40:56] [PASSED] X0L2 Modifier for inexistent plane
[06:40:56] =========== [PASSED] drm_test_framebuffer_create ===========
[06:40:56] ================= [PASSED] drm_framebuffer =================
[06:40:56] ==================== drm-test-managed  =====================
[06:40:56] [PASSED] drm_test_managed_run_action
[06:40:56] ================ [PASSED] drm-test-managed =================
[06:40:56] ========================= drm_mm  ==========================
[06:40:56] [PASSED] drm_test_mm_init
[06:40:56] [PASSED] drm_test_mm_debug
[06:41:06] [PASSED] drm_test_mm_reserve
[06:41:17] [PASSED] drm_test_mm_insert
[06:41:17] [PASSED] drm_test_mm_replace
[06:41:17] [PASSED] drm_test_mm_insert_range
[06:41:17] [PASSED] drm_test_mm_frag
[06:41:17] [PASSED] drm_test_mm_align
[06:41:17] [PASSED] drm_test_mm_align32
[06:41:18] [PASSED] drm_test_mm_align64
[06:41:18] [PASSED] drm_test_mm_evict
[06:41:18] [PASSED] drm_test_mm_evict_range
[06:41:18] [PASSED] drm_test_mm_topdown
[06:41:18] [PASSED] drm_test_mm_bottomup
[06:41:18] [PASSED] drm_test_mm_lowest
[06:41:18] [PASSED] drm_test_mm_highest
[06:41:19] [PASSED] drm_test_mm_color
[06:41:19] [PASSED] drm_test_mm_color_evict
[06:41:19] [PASSED] drm_test_mm_color_evict_range
[06:41:19] ===================== [PASSED] drm_mm ======================
[06:41:19] =================== drm_modes_analog_tv  ===================
[06:41:19] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[06:41:19] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[06:41:19] [PASSED] drm_test_modes_analog_tv_pal_576i
[06:41:19] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[06:41:19] =============== [PASSED] drm_modes_analog_tv ===============
[06:41:19] ==================== drm_plane_helper  =====================
[06:41:19] =============== drm_test_check_plane_state  ================
[06:41:19] [PASSED] clipping_simple
[06:41:19] [PASSED] clipping_rotate_reflect
[06:41:19] [PASSED] positioning_simple
[06:41:19] [PASSED] upscaling
[06:41:19] [PASSED] downscaling
[06:41:19] [PASSED] rounding1
[06:41:19] [PASSED] rounding2
[06:41:19] [PASSED] rounding3
[06:41:19] [PASSED] rounding4
[06:41:19] =========== [PASSED] drm_test_check_plane_state ============
[06:41:19] =========== drm_test_check_invalid_plane_state  ============
[06:41:19] [PASSED] positioning_invalid
[06:41:19] [PASSED] upscaling_invalid
[06:41:19] [PASSED] downscaling_invalid
[06:41:19] ======= [PASSED] drm_test_check_invalid_plane_state ========
[06:41:19] ================ [PASSED] drm_plane_helper =================
[06:41:19] ============ drm_connector_helper_tv_get_modes  ============
[06:41:19] ====== drm_test_connector_helper_tv_get_modes_check  =======
[06:41:19] [PASSED] None
[06:41:19] [PASSED] PAL
[06:41:19] [PASSED] NTSC
[06:41:19] [PASSED] Both, NTSC Default
[06:41:19] [PASSED] Both, PAL Default
[06:41:19] [PASSED] Both, NTSC Default, with PAL on command-line
[06:41:19] [PASSED] Both, PAL Default, with NTSC on command-line
[06:41:19] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[06:41:19] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[06:41:19] ======================== drm_rect  =========================
[06:41:19] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[06:41:19] [PASSED] drm_test_rect_clip_scaled_not_clipped
[06:41:19] [PASSED] drm_test_rect_clip_scaled_clipped
[06:41:19] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[06:41:19] ================= drm_test_rect_intersect  =================
[06:41:19] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[06:41:19] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[06:41:19] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[06:41:19] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[06:41:19] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[06:41:19] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[06:41:19] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[06:41:19] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[06:41:19] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[06:41:19] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[06:41:19] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[06:41:19] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[06:41:19] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[06:41:19] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[06:41:19] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[06:41:19] ============= [PASSED] drm_test_rect_intersect =============
[06:41:19] ================ drm_test_rect_calc_hscale  ================
[06:41:19] [PASSED] normal use
[06:41:19] [PASSED] out of max range
[06:41:19] [PASSED] out of min range
[06:41:19] [PASSED] zero dst
[06:41:19] [PASSED] negative src
[06:41:19] [PASSED] negative dst
[06:41:19] ============ [PASSED] drm_test_rect_calc_hscale ============
[06:41:19] ================ drm_test_rect_calc_vscale  ================
[06:41:19] [PASSED] normal use
[06:41:19] [PASSED] out of max range
[06:41:19] [PASSED] out of min range
[06:41:19] [PASSED] zero dst
[06:41:19] [PASSED] negative src
[06:41:19] [PASSED] negative dst
[06:41:19] ============ [PASSED] drm_test_rect_calc_vscale ============
[06:41:19] ================== drm_test_rect_rotate  ===================
[06:41:19] [PASSED] reflect-x
[06:41:19] [PASSED] reflect-y
[06:41:19] [PASSED] rotate-0
[06:41:19] [PASSED] rotate-90
[06:41:19] [PASSED] rotate-180
[06:41:19] [PASSED] rotate-270
[06:41:19] ============== [PASSED] drm_test_rect_rotate ===============
[06:41:19] ================ drm_test_rect_rotate_inv  =================
[06:41:19] [PASSED] reflect-x
[06:41:19] [PASSED] reflect-y
[06:41:19] [PASSED] rotate-0
[06:41:19] [PASSED] rotate-90
[06:41:19] [PASSED] rotate-180
[06:41:19] [PASSED] rotate-270
[06:41:19] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[06:41:19] ==================== [PASSED] drm_rect =====================
[06:41:19] ======================== drm_exec  =========================
[06:41:19] [PASSED] sanitycheck
[06:41:19] [PASSED] test_lock
[06:41:19] [PASSED] test_lock_unlock
[06:41:19] [PASSED] test_duplicates
[06:41:19] [PASSED] test_prepare
[06:41:19] [PASSED] test_prepare_array
[06:41:19] [PASSED] test_multiple_loops
[06:41:19] ==================== [PASSED] drm_exec =====================
[06:41:19] ============================================================
[06:41:19] Testing complete. Ran 368 tests: passed: 368
[06:41:19] Elapsed time: 44.294s total, 1.697s configuring, 19.367s building, 23.218s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


