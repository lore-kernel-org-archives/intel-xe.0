Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EEFC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 14:12:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71FA10E736;
	Wed,  6 Dec 2023 14:12:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7322010E736;
 Wed,  6 Dec 2023 14:12:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6FC91AADF2;
 Wed,  6 Dec 2023 14:12:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 06 Dec 2023 14:12:30 -0000
Message-ID: <170187195045.26423.8343552427122105537@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231206125818.4164-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231206125818.4164-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_series_?=
 =?utf-8?q?starting_with_=5BCI=2C01/17=5D_drm/gpuvm=3A_convert_WARN=28=29_?=
 =?utf-8?q?to_drm=5FWARN=28=29_variants?=
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

Series: series starting with [CI,01/17] drm/gpuvm: convert WARN() to drm_WARN() variants
URL   : https://patchwork.freedesktop.org/series/127431/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[14:11:18] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:11:23] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[14:11:43] Starting KUnit Kernel (1/1)...
[14:11:43] ============================================================
[14:11:43] ========================== xe_bo  ==========================
[14:11:43] [SKIPPED] xe_ccs_migrate_kunit
[14:11:43] [SKIPPED] xe_bo_evict_kunit
[14:11:43] ===================== [SKIPPED] xe_bo ======================
[14:11:43] ======================= xe_dma_buf  ========================
[14:11:43] [SKIPPED] xe_dma_buf_kunit
[14:11:43] =================== [SKIPPED] xe_dma_buf ===================
[14:11:43] ======================= xe_migrate  ========================
[14:11:43] [SKIPPED] xe_migrate_sanity_kunit
[14:11:43] =================== [SKIPPED] xe_migrate ===================
[14:11:43] ========================= xe_mocs  =========================
[14:11:43] [SKIPPED] xe_live_mocs_kernel_kunit
[14:11:43] ==================== [SKIPPED] xe_mocs =====================
[14:11:43] ========================= xe_pci  ==========================
[14:11:43] [PASSED] xe_gmdid_graphics_ip
[14:11:43] [PASSED] xe_gmdid_media_ip
[14:11:43] ===================== [PASSED] xe_pci ======================
[14:11:43] ========================= xe_rtp  ==========================
[14:11:43] ================== xe_rtp_process_tests  ===================
[14:11:43] [PASSED] coalesce-same-reg
[14:11:43] [PASSED] no-match-no-add
[14:11:43] [PASSED] no-match-no-add-multiple-rules
[14:11:43] [PASSED] two-regs-two-entries
[14:11:43] [PASSED] clr-one-set-other
[14:11:43] [PASSED] set-field
[14:11:43] [PASSED] conflict-duplicate
[14:11:43] [PASSED] conflict-not-disjoint
[14:11:43] [PASSED] conflict-reg-type
[14:11:43] ============== [PASSED] xe_rtp_process_tests ===============
[14:11:43] ===================== [PASSED] xe_rtp ======================
[14:11:43] ========================== xe_wa  ==========================
[14:11:43] ======================== xe_wa_gt  =========================
[14:11:43] [PASSED] TIGERLAKE (B0)
[14:11:43] [PASSED] DG1 (A0)
[14:11:43] [PASSED] DG1 (B0)
[14:11:43] [PASSED] ALDERLAKE_S (A0)
[14:11:43] [PASSED] ALDERLAKE_S (B0)
[14:11:43] [PASSED] ALDERLAKE_S (C0)
[14:11:43] [PASSED] ALDERLAKE_S (D0)
[14:11:43] [PASSED] ALDERLAKE_P (A0)
[14:11:43] [PASSED] ALDERLAKE_P (B0)
[14:11:43] [PASSED] ALDERLAKE_P (C0)
[14:11:43] [PASSED] ALDERLAKE_S_RPLS (D0)
[14:11:43] [PASSED] ALDERLAKE_P_RPLU (E0)
[14:11:43] [PASSED] DG2_G10 (A0)
[14:11:43] [PASSED] DG2_G10 (A1)
[14:11:43] [PASSED] DG2_G10 (B0)
[14:11:43] [PASSED] DG2_G10 (C0)
[14:11:43] [PASSED] DG2_G11 (A0)
[14:11:43] [PASSED] DG2_G11 (B0)
[14:11:43] [PASSED] DG2_G11 (B1)
[14:11:43] [PASSED] DG2_G12 (A0)
[14:11:43] [PASSED] DG2_G12 (A1)
[14:11:43] [PASSED] PVC (B0)
[14:11:43] [PASSED] PVC (B1)
[14:11:43] [PASSED] PVC (C0)
[14:11:43] [PASSED] METEORLAKE (g:A0, m:A0)
[14:11:43] [PASSED] METEORLAKE (g:A0, m:A0)
[14:11:43] [PASSED] LUNARLAKE (g:A0, m:A0)
[14:11:43] [PASSED] LUNARLAKE (g:B0, m:A0)
[14:11:43] ==================== [PASSED] xe_wa_gt =====================
[14:11:43] ====================== [PASSED] xe_wa ======================
[14:11:43] ============================================================
[14:11:43] Testing complete. Ran 44 tests: passed: 39, skipped: 5
[14:11:43] Elapsed time: 24.767s total, 4.248s configuring, 20.351s building, 0.143s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[14:11:43] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:11:45] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[14:12:04] Starting KUnit Kernel (1/1)...
[14:12:04] ============================================================
[14:12:04] ================== drm_test_pick_cmdline  ==================
[14:12:04] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[14:12:04] =============== drm_test_pick_cmdline_named  ===============
[14:12:04] [PASSED] NTSC
[14:12:04] [PASSED] NTSC-J
[14:12:04] [PASSED] PAL
[14:12:04] [PASSED] PAL-M
[14:12:04] =========== [PASSED] drm_test_pick_cmdline_named ===========
[14:12:04] ============== [PASSED] drm_test_pick_cmdline ==============
[14:12:04] ======================== drm_buddy  ========================
[14:12:04] [PASSED] drm_test_buddy_alloc_limit
[14:12:04] [PASSED] drm_test_buddy_alloc_range
[14:12:04] [PASSED] drm_test_buddy_alloc_optimistic
[14:12:04] [PASSED] drm_test_buddy_alloc_pessimistic
[14:12:04] [PASSED] drm_test_buddy_alloc_smoke
[14:12:04] [PASSED] drm_test_buddy_alloc_pathological
[14:12:04] ==================== [PASSED] drm_buddy ====================
[14:12:04] =================== drm_cmdline_parser  ====================
[14:12:04] [PASSED] drm_test_cmdline_force_d_only
[14:12:04] [PASSED] drm_test_cmdline_force_D_only_dvi
[14:12:04] [PASSED] drm_test_cmdline_force_D_only_hdmi
[14:12:04] [PASSED] drm_test_cmdline_force_D_only_not_digital
[14:12:04] [PASSED] drm_test_cmdline_force_e_only
[14:12:04] [PASSED] drm_test_cmdline_res
[14:12:04] [PASSED] drm_test_cmdline_res_vesa
[14:12:04] [PASSED] drm_test_cmdline_res_vesa_rblank
[14:12:04] [PASSED] drm_test_cmdline_res_rblank
[14:12:04] [PASSED] drm_test_cmdline_res_bpp
[14:12:04] [PASSED] drm_test_cmdline_res_refresh
[14:12:04] [PASSED] drm_test_cmdline_res_bpp_refresh
[14:12:04] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[14:12:04] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[14:12:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[14:12:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[14:12:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[14:12:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[14:12:04] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[14:12:04] [PASSED] drm_test_cmdline_res_margins_force_on
[14:12:04] [PASSED] drm_test_cmdline_res_vesa_margins
[14:12:04] [PASSED] drm_test_cmdline_name
[14:12:04] [PASSED] drm_test_cmdline_name_bpp
[14:12:04] [PASSED] drm_test_cmdline_name_option
[14:12:04] [PASSED] drm_test_cmdline_name_bpp_option
[14:12:04] [PASSED] drm_test_cmdline_rotate_0
[14:12:04] [PASSED] drm_test_cmdline_rotate_90
[14:12:04] [PASSED] drm_test_cmdline_rotate_180
[14:12:04] [PASSED] drm_test_cmdline_rotate_270
[14:12:04] [PASSED] drm_test_cmdline_hmirror
[14:12:04] [PASSED] drm_test_cmdline_vmirror
[14:12:04] [PASSED] drm_test_cmdline_margin_options
[14:12:04] [PASSED] drm_test_cmdline_multiple_options
[14:12:04] [PASSED] drm_test_cmdline_bpp_extra_and_option
[14:12:04] [PASSED] drm_test_cmdline_extra_and_option
[14:12:04] [PASSED] drm_test_cmdline_freestanding_options
[14:12:04] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[14:12:04] [PASSED] drm_test_cmdline_panel_orientation
[14:12:04] ================ drm_test_cmdline_invalid  =================
[14:12:04] [PASSED] margin_only
[14:12:04] [PASSED] interlace_only
[14:12:04] [PASSED] res_missing_x
[14:12:04] [PASSED] res_missing_y
[14:12:04] [PASSED] res_bad_y
[14:12:04] [PASSED] res_missing_y_bpp
[14:12:04] [PASSED] res_bad_bpp
[14:12:04] [PASSED] res_bad_refresh
[14:12:04] [PASSED] res_bpp_refresh_force_on_off
[14:12:04] [PASSED] res_invalid_mode
[14:12:04] [PASSED] res_bpp_wrong_place_mode
[14:12:04] [PASSED] name_bpp_refresh
[14:12:04] [PASSED] name_refresh
[14:12:04] [PASSED] name_refresh_wrong_mode
[14:12:04] [PASSED] name_refresh_invalid_mode
[14:12:04] [PASSED] rotate_multiple
[14:12:04] [PASSED] rotate_invalid_val
[14:12:04] [PASSED] rotate_truncated
[14:12:04] [PASSED] invalid_option
[14:12:04] [PASSED] invalid_tv_option
[14:12:04] [PASSED] truncated_tv_option
[14:12:04] ============ [PASSED] drm_test_cmdline_invalid =============
[14:12:04] =============== drm_test_cmdline_tv_options  ===============
[14:12:04] [PASSED] NTSC
[14:12:04] [PASSED] NTSC_443
[14:12:04] [PASSED] NTSC_J
[14:12:04] [PASSED] PAL
[14:12:04] [PASSED] PAL_M
[14:12:04] [PASSED] PAL_N
[14:12:04] [PASSED] SECAM
[14:12:04] =========== [PASSED] drm_test_cmdline_tv_options ===========
[14:12:04] =============== [PASSED] drm_cmdline_parser ================
[14:12:04] ================ drm_get_tv_mode_from_name  ================
[14:12:04] ========== drm_test_get_tv_mode_from_name_valid  ===========
[14:12:04] [PASSED] NTSC
[14:12:04] [PASSED] NTSC-443
[14:12:04] [PASSED] NTSC-J
[14:12:04] [PASSED] PAL
[14:12:04] [PASSED] PAL-M
[14:12:04] [PASSED] PAL-N
[14:12:04] [PASSED] SECAM
[14:12:04] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[14:12:04] [PASSED] drm_test_get_tv_mode_from_name_truncated
[14:12:04] ============ [PASSED] drm_get_tv_mode_from_name ============
[14:12:04] ==================== drm_damage_helper  ====================
[14:12:04] [PASSED] drm_test_damage_iter_no_damage
[14:12:04] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[14:12:04] [PASSED] drm_test_damage_iter_no_damage_src_moved
[14:12:04] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[14:12:04] [PASSED] drm_test_damage_iter_no_damage_not_visible
[14:12:04] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[14:12:04] [PASSED] drm_test_damage_iter_no_damage_no_fb
[14:12:04] [PASSED] drm_test_damage_iter_simple_damage
[14:12:04] [PASSED] drm_test_damage_iter_single_damage
[14:12:04] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[14:12:04] [PASSED] drm_test_damage_iter_single_damage_outside_src
[14:12:04] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[14:12:04] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[14:12:04] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[14:12:04] [PASSED] drm_test_damage_iter_single_damage_src_moved
[14:12:04] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[14:12:04] [PASSED] drm_test_damage_iter_damage
[14:12:04] [PASSED] drm_test_damage_iter_damage_one_intersect
[14:12:04] [PASSED] drm_test_damage_iter_damage_one_outside
[14:12:04] [PASSED] drm_test_damage_iter_damage_src_moved
[14:12:04] [PASSED] drm_test_damage_iter_damage_not_visible
[14:12:04] ================ [PASSED] drm_damage_helper ================
[14:12:04] ==================== drm_dp_mst_helper  ====================
[14:12:04] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[14:12:04] [PASSED] Clock 154000 BPP 30 DSC disabled
[14:12:04] [PASSED] Clock 234000 BPP 30 DSC disabled
[14:12:04] [PASSED] Clock 297000 BPP 24 DSC disabled
[14:12:04] [PASSED] Clock 332880 BPP 24 DSC enabled
[14:12:04] [PASSED] Clock 324540 BPP 24 DSC enabled
[14:12:04] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[14:12:04] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[14:12:04] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[14:12:04] [PASSED] DP_POWER_UP_PHY with port number
[14:12:04] [PASSED] DP_POWER_DOWN_PHY with port number
[14:12:04] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[14:12:04] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[14:12:04] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[14:12:04] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[14:12:04] [PASSED] DP_QUERY_PAYLOAD with port number
[14:12:04] [PASSED] DP_QUERY_PAYLOAD with VCPI
[14:12:04] [PASSED] DP_REMOTE_DPCD_READ with port number
[14:12:04] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[14:12:04] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[14:12:04] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[14:12:04] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[14:12:04] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[14:12:04] [PASSED] DP_REMOTE_I2C_READ with port number
[14:12:04] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[14:12:04] [PASSED] DP_REMOTE_I2C_READ with transactions array
[14:12:04] [PASSED] DP_REMOTE_I2C_WRITE with port number
[14:12:04] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[14:12:04] [PASSED] DP_REMOTE_I2C_WRITE with data array
[14:12:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[14:12:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[14:12:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[14:12:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[14:12:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[14:12:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[14:12:04] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[14:12:04] ================ [PASSED] drm_dp_mst_helper ================
[14:12:04] ================= drm_format_helper_test  ==================
[14:12:04] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[14:12:04] [PASSED] single_pixel_source_buffer
[14:12:04] [PASSED] single_pixel_clip_rectangle
[14:12:04] [PASSED] well_known_colors
[14:12:04] [PASSED] destination_pitch
[14:12:04] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[14:12:04] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[14:12:04] [PASSED] single_pixel_source_buffer
[14:12:04] [PASSED] single_pixel_clip_rectangle
[14:12:04] [PASSED] well_known_colors
[14:12:04] [PASSED] destination_pitch
[14:12:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[14:12:04] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[14:12:04] [PASSED] single_pixel_source_buffer
[14:12:04] [PASSED] single_pixel_clip_rectangle
[14:12:04] [PASSED] well_known_colors
[14:12:04] [PASSED] destination_pitch
[14:12:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[14:12:04] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[14:12:04] [PASSED] single_pixel_source_buffer
[14:12:04] [PASSED] single_pixel_clip_rectangle
[14:12:04] [PASSED] well_known_colors
[14:12:04] [PASSED] destination_pitch
[14:12:04] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[14:12:04] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[14:12:04] [PASSED] single_pixel_source_buffer
[14:12:04] [PASSED] single_pixel_clip_rectangle
[14:12:04] [PASSED] well_known_colors
[14:12:04] [PASSED] destination_pitch
[14:12:04] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[14:12:04] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[14:12:04] [PASSED] single_pixel_source_buffer
[14:12:04] [PASSED] single_pixel_clip_rectangle
[14:12:04] [PASSED] well_known_colors
[14:12:04] [PASSED] destination_pitch
[14:12:04] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[14:12:04] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[14:12:04] [PASSED] single_pixel_source_buffer
[14:12:04] [PASSED] single_pixel_clip_rectangle
[14:12:04] [PASSED] well_known_colors
[14:12:04] [PASSED] destination_pitch
[14:12:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[14:12:04] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[14:12:04] [PASSED] single_pixel_source_buffer
[14:12:04] [PASSED] single_pixel_clip_rectangle
[14:12:04] [PASSED] well_known_colors
[14:12:04] [PASSED] destination_pitch
[14:12:04] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[14:12:04] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[14:12:04] [PASSED] single_pixel_source_buffer
[14:12:04] [PASSED] single_pixel_clip_rectangle
[14:12:04] [PASSED] well_known_colors
[14:12:04] [PASSED] destination_pitch
[14:12:04] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[14:12:04] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[14:12:04] [PASSED] single_pixel_source_buffer
[14:12:04] [PASSED] single_pixel_clip_rectangle
[14:12:04] [PASSED] well_known_colors
[14:12:04] [PASSED] destination_pitch
[14:12:04] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[14:12:04] ============== drm_test_fb_xrgb8888_to_mono  ===============
[14:12:04] [PASSED] single_pixel_source_buffer
[14:12:04] [PASSED] single_pixel_clip_rectangle
[14:12:04] [PASSED] well_known_colors
[14:12:04] [PASSED] destination_pitch
[14:12:04] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[14:12:04] ==================== drm_test_fb_swab  =====================
[14:12:04] [PASSED] single_pixel_source_buffer
[14:12:04] [PASSED] single_pixel_clip_rectangle
[14:12:04] [PASSED] well_known_colors
[14:12:04] [PASSED] destination_pitch
[14:12:04] ================ [PASSED] drm_test_fb_swab =================
[14:12:04] ================= drm_test_fb_clip_offset  =================
[14:12:04] [PASSED] pass through
[14:12:04] [PASSED] horizontal offset
[14:12:04] [PASSED] vertical offset
[14:12:04] [PASSED] horizontal and vertical offset
[14:12:04] [PASSED] horizontal offset (custom pitch)
[14:12:04] [PASSED] vertical offset (custom pitch)
[14:12:04] [PASSED] horizontal and vertical offset (custom pitch)
[14:12:04] ============= [PASSED] drm_test_fb_clip_offset =============
[14:12:04] ============== drm_test_fb_build_fourcc_list  ==============
[14:12:04] [PASSED] no native formats
[14:12:04] [PASSED] XRGB8888 as native format
[14:12:04] [PASSED] remove duplicates
[14:12:04] [PASSED] convert alpha formats
[14:12:04] [PASSED] random formats
[14:12:04] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[14:12:04] =================== drm_test_fb_memcpy  ====================
[14:12:04] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[14:12:04] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[14:12:04] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[14:12:04] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[14:12:04] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[14:12:04] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[14:12:04] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[14:12:04] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[14:12:04] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[14:12:04] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[14:12:04] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[14:12:04] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[14:12:04] =============== [PASSED] drm_test_fb_memcpy ================
[14:12:04] ============= [PASSED] drm_format_helper_test ==============
[14:12:04] ======================= drm_format  ========================
[14:12:04] [PASSED] drm_test_format_block_width_invalid
[14:12:04] [PASSED] drm_test_format_block_width_one_plane
[14:12:04] [PASSED] drm_test_format_block_width_two_plane
[14:12:04] [PASSED] drm_test_format_block_width_three_plane
[14:12:04] [PASSED] drm_test_format_block_width_tiled
[14:12:04] [PASSED] drm_test_format_block_height_invalid
[14:12:04] [PASSED] drm_test_format_block_height_one_plane
[14:12:04] [PASSED] drm_test_format_block_height_two_plane
[14:12:04] [PASSED] drm_test_format_block_height_three_plane
[14:12:04] [PASSED] drm_test_format_block_height_tiled
[14:12:04] [PASSED] drm_test_format_min_pitch_invalid
[14:12:04] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[14:12:04] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[14:12:04] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[14:12:04] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[14:12:04] [PASSED] drm_test_format_min_pitch_two_plane
[14:12:04] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[14:12:04] [PASSED] drm_test_format_min_pitch_tiled
[14:12:04] =================== [PASSED] drm_format ====================
[14:12:04] ===================== drm_framebuffer  =====================
[14:12:04] =============== drm_test_framebuffer_create  ===============
[14:12:04] [PASSED] ABGR8888 normal sizes
[14:12:04] [PASSED] ABGR8888 max sizes
[14:12:04] [PASSED] ABGR8888 pitch greater than min required
[14:12:04] [PASSED] ABGR8888 pitch less than min required
[14:12:04] [PASSED] ABGR8888 Invalid width
[14:12:04] [PASSED] ABGR8888 Invalid buffer handle
[14:12:04] [PASSED] No pixel format
[14:12:04] [PASSED] ABGR8888 Width 0
[14:12:04] [PASSED] ABGR8888 Height 0
[14:12:04] [PASSED] ABGR8888 Out of bound height * pitch combination
[14:12:04] [PASSED] ABGR8888 Large buffer offset
[14:12:04] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[14:12:04] [PASSED] ABGR8888 Valid buffer modifier
[14:12:04] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[14:12:04] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[14:12:04] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[14:12:04] [PASSED] NV12 Normal sizes
[14:12:04] [PASSED] NV12 Max sizes
[14:12:04] [PASSED] NV12 Invalid pitch
[14:12:04] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[14:12:04] [PASSED] NV12 different  modifier per-plane
[14:12:04] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[14:12:04] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[14:12:04] [PASSED] NV12 Modifier for inexistent plane
[14:12:04] [PASSED] NV12 Handle for inexistent plane
[14:12:04] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[14:12:04] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[14:12:04] [PASSED] YVU420 Normal sizes
[14:12:04] [PASSED] YVU420 Max sizes
[14:12:04] [PASSED] YVU420 Invalid pitch
[14:12:04] [PASSED] YVU420 Different pitches
[14:12:04] [PASSED] YVU420 Different buffer offsets/pitches
[14:12:04] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[14:12:04] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[14:12:04] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[14:12:04] [PASSED] YVU420 Valid modifier
[14:12:04] [PASSED] YVU420 Different modifiers per plane
[14:12:04] [PASSED] YVU420 Modifier for inexistent plane
[14:12:04] [PASSED] X0L2 Normal sizes
[14:12:04] [PASSED] X0L2 Max sizes
[14:12:04] [PASSED] X0L2 Invalid pitch
[14:12:04] [PASSED] X0L2 Pitch greater than minimum required
[14:12:04] [PASSED] X0L2 Handle for inexistent plane
[14:12:04] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[14:12:04] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[14:12:04] [PASSED] X0L2 Valid modifier
[14:12:04] [PASSED] X0L2 Modifier for inexistent plane
[14:12:04] =========== [PASSED] drm_test_framebuffer_create ===========
[14:12:04] ================= [PASSED] drm_framebuffer =================
[14:12:04] ==================== drm-test-managed  =====================
[14:12:04] [PASSED] drm_test_managed_run_action
[14:12:04] ================ [PASSED] drm-test-managed =================
[14:12:04] ========================= drm_mm  ==========================
[14:12:04] [PASSED] drm_test_mm_init
[14:12:04] [PASSED] drm_test_mm_debug
[14:12:15] [PASSED] drm_test_mm_reserve
[14:12:25] [PASSED] drm_test_mm_insert
[14:12:25] [PASSED] drm_test_mm_replace
[14:12:25] [PASSED] drm_test_mm_insert_range
[14:12:26] [PASSED] drm_test_mm_frag
[14:12:26] [PASSED] drm_test_mm_align
[14:12:26] [PASSED] drm_test_mm_align32
[14:12:26] [PASSED] drm_test_mm_align64
[14:12:26] [PASSED] drm_test_mm_evict
[14:12:26] [PASSED] drm_test_mm_evict_range
[14:12:26] [PASSED] drm_test_mm_topdown
[14:12:26] [PASSED] drm_test_mm_bottomup
[14:12:26] [PASSED] drm_test_mm_lowest
[14:12:26] [PASSED] drm_test_mm_highest
[14:12:27] [PASSED] drm_test_mm_color
[14:12:28] [PASSED] drm_test_mm_color_evict
[14:12:28] [PASSED] drm_test_mm_color_evict_range
[14:12:28] ===================== [PASSED] drm_mm ======================
[14:12:28] =================== drm_modes_analog_tv  ===================
[14:12:28] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[14:12:28] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[14:12:28] [PASSED] drm_test_modes_analog_tv_pal_576i
[14:12:28] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[14:12:28] =============== [PASSED] drm_modes_analog_tv ===============
[14:12:28] ==================== drm_plane_helper  =====================
[14:12:28] =============== drm_test_check_plane_state  ================
[14:12:28] [PASSED] clipping_simple
[14:12:28] [PASSED] clipping_rotate_reflect
[14:12:28] [PASSED] positioning_simple
[14:12:28] [PASSED] upscaling
[14:12:28] [PASSED] downscaling
[14:12:28] [PASSED] rounding1
[14:12:28] [PASSED] rounding2
[14:12:28] [PASSED] rounding3
[14:12:28] [PASSED] rounding4
[14:12:28] =========== [PASSED] drm_test_check_plane_state ============
[14:12:28] =========== drm_test_check_invalid_plane_state  ============
[14:12:28] [PASSED] positioning_invalid
[14:12:28] [PASSED] upscaling_invalid
[14:12:28] [PASSED] downscaling_invalid
[14:12:28] ======= [PASSED] drm_test_check_invalid_plane_state ========
[14:12:28] ================ [PASSED] drm_plane_helper =================
[14:12:28] ============ drm_connector_helper_tv_get_modes  ============
[14:12:28] ====== drm_test_connector_helper_tv_get_modes_check  =======
[14:12:28] [PASSED] None
[14:12:28] [PASSED] PAL
[14:12:28] [PASSED] NTSC
[14:12:28] [PASSED] Both, NTSC Default
[14:12:28] [PASSED] Both, PAL Default
[14:12:28] [PASSED] Both, NTSC Default, with PAL on command-line
[14:12:28] [PASSED] Both, PAL Default, with NTSC on command-line
[14:12:28] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[14:12:28] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[14:12:28] ======================== drm_rect  =========================
[14:12:28] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[14:12:28] [PASSED] drm_test_rect_clip_scaled_not_clipped
[14:12:28] [PASSED] drm_test_rect_clip_scaled_clipped
[14:12:28] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[14:12:28] ================= drm_test_rect_intersect  =================
[14:12:28] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[14:12:28] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[14:12:28] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[14:12:28] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[14:12:28] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[14:12:28] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[14:12:28] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[14:12:28] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[14:12:28] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[14:12:28] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[14:12:28] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[14:12:28] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[14:12:28] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[14:12:28] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[14:12:28] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[14:12:28] ============= [PASSED] drm_test_rect_intersect =============
[14:12:28] ================ drm_test_rect_calc_hscale  ================
[14:12:28] [PASSED] normal use
[14:12:28] [PASSED] out of max range
[14:12:28] [PASSED] out of min range
[14:12:28] [PASSED] zero dst
[14:12:28] [PASSED] negative src
[14:12:28] [PASSED] negative dst
[14:12:28] ============ [PASSED] drm_test_rect_calc_hscale ============
[14:12:28] ================ drm_test_rect_calc_vscale  ================
[14:12:28] [PASSED] normal use
[14:12:28] [PASSED] out of max range
[14:12:28] [PASSED] out of min range
[14:12:28] [PASSED] zero dst
[14:12:28] [PASSED] negative src
[14:12:28] [PASSED] negative dst
[14:12:28] ============ [PASSED] drm_test_rect_calc_vscale ============
[14:12:28] ================== drm_test_rect_rotate  ===================
[14:12:28] [PASSED] reflect-x
[14:12:28] [PASSED] reflect-y
[14:12:28] [PASSED] rotate-0
[14:12:28] [PASSED] rotate-90
[14:12:28] [PASSED] rotate-180
[14:12:28] [PASSED] rotate-270
[14:12:28] ============== [PASSED] drm_test_rect_rotate ===============
[14:12:28] ================ drm_test_rect_rotate_inv  =================
[14:12:28] [PASSED] reflect-x
[14:12:28] [PASSED] reflect-y
[14:12:28] [PASSED] rotate-0
[14:12:28] [PASSED] rotate-90
[14:12:28] [PASSED] rotate-180
[14:12:28] [PASSED] rotate-270
[14:12:28] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[14:12:28] ==================== [PASSED] drm_rect =====================
[14:12:28] ======================== drm_exec  =========================
[14:12:28] [PASSED] sanitycheck
[14:12:28] [PASSED] test_lock
[14:12:28] [PASSED] test_lock_unlock
[14:12:28] [PASSED] test_duplicates
[14:12:28] [PASSED] test_prepare
[14:12:28] [PASSED] test_prepare_array
[14:12:28] [PASSED] test_multiple_loops
[14:12:28] ==================== [PASSED] drm_exec =====================
[14:12:28] ============================================================
[14:12:28] Testing complete. Ran 368 tests: passed: 368
[14:12:28] Elapsed time: 44.250s total, 1.661s configuring, 19.259s building, 23.321s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


