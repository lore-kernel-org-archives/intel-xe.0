Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17BCC25B70
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 08:46:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CA310E956;
	Fri, 27 Oct 2023 08:46:17 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id BB94010E956;
 Fri, 27 Oct 2023 08:46:15 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B7266A0169;
 Fri, 27 Oct 2023 08:46:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 27 Oct 2023 08:46:15 -0000
Message-ID: <169839637574.19709.1935251257494410885@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231027081552.5321-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231027081552.5321-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_series_?=
 =?utf-8?q?starting_with_=5BCI=2C01/10=5D_drm/gpuvm=3A_convert_WARN=28=29_?=
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

Series: series starting with [CI,01/10] drm/gpuvm: convert WARN() to drm_WARN() variants
URL   : https://patchwork.freedesktop.org/series/125672/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[08:45:04] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:45:08] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[08:45:28] Starting KUnit Kernel (1/1)...
[08:45:28] ============================================================
[08:45:28] ========================== xe_bo  ==========================
[08:45:28] [SKIPPED] xe_ccs_migrate_kunit
[08:45:28] [SKIPPED] xe_bo_evict_kunit
[08:45:28] ===================== [SKIPPED] xe_bo ======================
[08:45:28] ======================= xe_dma_buf  ========================
[08:45:28] [SKIPPED] xe_dma_buf_kunit
[08:45:28] =================== [SKIPPED] xe_dma_buf ===================
[08:45:28] ======================= xe_migrate  ========================
[08:45:28] [SKIPPED] xe_migrate_sanity_kunit
[08:45:28] =================== [SKIPPED] xe_migrate ===================
[08:45:28] ========================= xe_pci  ==========================
[08:45:28] [PASSED] xe_gmdid_graphics_ip
[08:45:28] [PASSED] xe_gmdid_media_ip
[08:45:28] ===================== [PASSED] xe_pci ======================
[08:45:28] ========================= xe_rtp  ==========================
[08:45:28] ================== xe_rtp_process_tests  ===================
[08:45:28] [PASSED] coalesce-same-reg
[08:45:28] [PASSED] no-match-no-add
[08:45:28] [PASSED] no-match-no-add-multiple-rules
[08:45:28] [PASSED] two-regs-two-entries
[08:45:28] [PASSED] clr-one-set-other
[08:45:28] [PASSED] set-field
[08:45:28] [PASSED] conflict-duplicate
[08:45:28] [PASSED] conflict-not-disjoint
[08:45:28] [PASSED] conflict-reg-type
[08:45:28] ============== [PASSED] xe_rtp_process_tests ===============
[08:45:28] ===================== [PASSED] xe_rtp ======================
[08:45:28] ========================== xe_wa  ==========================
[08:45:28] ======================== xe_wa_gt  =========================
[08:45:28] [PASSED] TIGERLAKE (B0)
[08:45:28] [PASSED] DG1 (A0)
[08:45:28] [PASSED] DG1 (B0)
[08:45:28] [PASSED] ALDERLAKE_S (A0)
[08:45:28] [PASSED] ALDERLAKE_S (B0)
[08:45:28] [PASSED] ALDERLAKE_S (C0)
[08:45:28] [PASSED] ALDERLAKE_S (D0)
[08:45:28] [PASSED] ALDERLAKE_P (A0)
[08:45:28] [PASSED] ALDERLAKE_P (B0)
[08:45:28] [PASSED] ALDERLAKE_P (C0)
[08:45:28] [PASSED] ALDERLAKE_S_RPLS (D0)
[08:45:28] [PASSED] ALDERLAKE_P_RPLU (E0)
[08:45:28] [PASSED] DG2_G10 (A0)
[08:45:28] [PASSED] DG2_G10 (A1)
[08:45:28] [PASSED] DG2_G10 (B0)
[08:45:28] [PASSED] DG2_G10 (C0)
[08:45:28] [PASSED] DG2_G11 (A0)
[08:45:28] [PASSED] DG2_G11 (B0)
[08:45:28] [PASSED] DG2_G11 (B1)
[08:45:28] [PASSED] DG2_G12 (A0)
[08:45:28] [PASSED] DG2_G12 (A1)
[08:45:28] [PASSED] PVC (B0)
[08:45:28] [PASSED] PVC (B1)
[08:45:28] [PASSED] PVC (C0)
[08:45:28] ==================== [PASSED] xe_wa_gt =====================
[08:45:28] ====================== [PASSED] xe_wa ======================
[08:45:28] ============================================================
[08:45:28] Testing complete. Ran 39 tests: passed: 35, skipped: 4
[08:45:28] Elapsed time: 24.630s total, 4.173s configuring, 20.287s building, 0.139s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[08:45:28] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:45:30] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[08:45:49] Starting KUnit Kernel (1/1)...
[08:45:49] ============================================================
[08:45:49] ================== drm_test_pick_cmdline  ==================
[08:45:49] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[08:45:49] =============== drm_test_pick_cmdline_named  ===============
[08:45:49] [PASSED] NTSC
[08:45:49] [PASSED] NTSC-J
[08:45:49] [PASSED] PAL
[08:45:49] [PASSED] PAL-M
[08:45:49] =========== [PASSED] drm_test_pick_cmdline_named ===========
[08:45:49] ============== [PASSED] drm_test_pick_cmdline ==============
[08:45:49] ======================== drm_buddy  ========================
[08:45:49] [PASSED] drm_test_buddy_alloc_limit
[08:45:49] [PASSED] drm_test_buddy_alloc_range
[08:45:49] [PASSED] drm_test_buddy_alloc_optimistic
[08:45:49] [PASSED] drm_test_buddy_alloc_pessimistic
[08:45:49] [PASSED] drm_test_buddy_alloc_smoke
[08:45:49] [PASSED] drm_test_buddy_alloc_pathological
[08:45:49] ==================== [PASSED] drm_buddy ====================
[08:45:49] =================== drm_cmdline_parser  ====================
[08:45:49] [PASSED] drm_test_cmdline_force_d_only
[08:45:49] [PASSED] drm_test_cmdline_force_D_only_dvi
[08:45:49] [PASSED] drm_test_cmdline_force_D_only_hdmi
[08:45:49] [PASSED] drm_test_cmdline_force_D_only_not_digital
[08:45:49] [PASSED] drm_test_cmdline_force_e_only
[08:45:49] [PASSED] drm_test_cmdline_res
[08:45:49] [PASSED] drm_test_cmdline_res_vesa
[08:45:49] [PASSED] drm_test_cmdline_res_vesa_rblank
[08:45:49] [PASSED] drm_test_cmdline_res_rblank
[08:45:49] [PASSED] drm_test_cmdline_res_bpp
[08:45:49] [PASSED] drm_test_cmdline_res_refresh
[08:45:49] [PASSED] drm_test_cmdline_res_bpp_refresh
[08:45:49] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[08:45:49] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[08:45:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[08:45:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[08:45:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[08:45:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[08:45:49] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[08:45:49] [PASSED] drm_test_cmdline_res_margins_force_on
[08:45:49] [PASSED] drm_test_cmdline_res_vesa_margins
[08:45:49] [PASSED] drm_test_cmdline_name
[08:45:49] [PASSED] drm_test_cmdline_name_bpp
[08:45:49] [PASSED] drm_test_cmdline_name_option
[08:45:49] [PASSED] drm_test_cmdline_name_bpp_option
[08:45:49] [PASSED] drm_test_cmdline_rotate_0
[08:45:49] [PASSED] drm_test_cmdline_rotate_90
[08:45:49] [PASSED] drm_test_cmdline_rotate_180
[08:45:49] [PASSED] drm_test_cmdline_rotate_270
[08:45:49] [PASSED] drm_test_cmdline_hmirror
[08:45:49] [PASSED] drm_test_cmdline_vmirror
[08:45:49] [PASSED] drm_test_cmdline_margin_options
[08:45:49] [PASSED] drm_test_cmdline_multiple_options
[08:45:49] [PASSED] drm_test_cmdline_bpp_extra_and_option
[08:45:49] [PASSED] drm_test_cmdline_extra_and_option
[08:45:49] [PASSED] drm_test_cmdline_freestanding_options
[08:45:49] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[08:45:49] [PASSED] drm_test_cmdline_panel_orientation
[08:45:49] ================ drm_test_cmdline_invalid  =================
[08:45:49] [PASSED] margin_only
[08:45:49] [PASSED] interlace_only
[08:45:49] [PASSED] res_missing_x
[08:45:49] [PASSED] res_missing_y
[08:45:49] [PASSED] res_bad_y
[08:45:49] [PASSED] res_missing_y_bpp
[08:45:49] [PASSED] res_bad_bpp
[08:45:49] [PASSED] res_bad_refresh
[08:45:49] [PASSED] res_bpp_refresh_force_on_off
[08:45:49] [PASSED] res_invalid_mode
[08:45:49] [PASSED] res_bpp_wrong_place_mode
[08:45:49] [PASSED] name_bpp_refresh
[08:45:49] [PASSED] name_refresh
[08:45:49] [PASSED] name_refresh_wrong_mode
[08:45:49] [PASSED] name_refresh_invalid_mode
[08:45:49] [PASSED] rotate_multiple
[08:45:49] [PASSED] rotate_invalid_val
[08:45:49] [PASSED] rotate_truncated
[08:45:49] [PASSED] invalid_option
[08:45:49] [PASSED] invalid_tv_option
[08:45:49] [PASSED] truncated_tv_option
[08:45:49] ============ [PASSED] drm_test_cmdline_invalid =============
[08:45:49] =============== drm_test_cmdline_tv_options  ===============
[08:45:49] [PASSED] NTSC
[08:45:49] [PASSED] NTSC_443
[08:45:49] [PASSED] NTSC_J
[08:45:49] [PASSED] PAL
[08:45:49] [PASSED] PAL_M
[08:45:49] [PASSED] PAL_N
[08:45:49] [PASSED] SECAM
[08:45:49] =========== [PASSED] drm_test_cmdline_tv_options ===========
[08:45:49] =============== [PASSED] drm_cmdline_parser ================
[08:45:49] ================ drm_get_tv_mode_from_name  ================
[08:45:49] ========== drm_test_get_tv_mode_from_name_valid  ===========
[08:45:49] [PASSED] NTSC
[08:45:49] [PASSED] NTSC-443
[08:45:49] [PASSED] NTSC-J
[08:45:49] [PASSED] PAL
[08:45:49] [PASSED] PAL-M
[08:45:49] [PASSED] PAL-N
[08:45:49] [PASSED] SECAM
[08:45:49] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[08:45:49] [PASSED] drm_test_get_tv_mode_from_name_truncated
[08:45:49] ============ [PASSED] drm_get_tv_mode_from_name ============
[08:45:49] ==================== drm_damage_helper  ====================
[08:45:49] [PASSED] drm_test_damage_iter_no_damage
[08:45:49] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[08:45:49] [PASSED] drm_test_damage_iter_no_damage_src_moved
[08:45:49] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[08:45:49] [PASSED] drm_test_damage_iter_no_damage_not_visible
[08:45:49] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[08:45:49] [PASSED] drm_test_damage_iter_no_damage_no_fb
[08:45:49] [PASSED] drm_test_damage_iter_simple_damage
[08:45:49] [PASSED] drm_test_damage_iter_single_damage
[08:45:49] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[08:45:49] [PASSED] drm_test_damage_iter_single_damage_outside_src
[08:45:49] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[08:45:49] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[08:45:49] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[08:45:49] [PASSED] drm_test_damage_iter_single_damage_src_moved
[08:45:49] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[08:45:49] [PASSED] drm_test_damage_iter_damage
[08:45:49] [PASSED] drm_test_damage_iter_damage_one_intersect
[08:45:49] [PASSED] drm_test_damage_iter_damage_one_outside
[08:45:49] [PASSED] drm_test_damage_iter_damage_src_moved
[08:45:49] [PASSED] drm_test_damage_iter_damage_not_visible
[08:45:49] ================ [PASSED] drm_damage_helper ================
[08:45:49] ==================== drm_dp_mst_helper  ====================
[08:45:49] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[08:45:49] [PASSED] Clock 154000 BPP 30 DSC disabled
[08:45:49] [PASSED] Clock 234000 BPP 30 DSC disabled
[08:45:49] [PASSED] Clock 297000 BPP 24 DSC disabled
[08:45:49] [PASSED] Clock 332880 BPP 24 DSC enabled
[08:45:49] [PASSED] Clock 324540 BPP 24 DSC enabled
[08:45:49] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[08:45:49] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[08:45:49] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[08:45:49] [PASSED] DP_POWER_UP_PHY with port number
[08:45:49] [PASSED] DP_POWER_DOWN_PHY with port number
[08:45:49] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[08:45:49] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[08:45:49] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[08:45:49] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[08:45:49] [PASSED] DP_QUERY_PAYLOAD with port number
[08:45:49] [PASSED] DP_QUERY_PAYLOAD with VCPI
[08:45:49] [PASSED] DP_REMOTE_DPCD_READ with port number
[08:45:49] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[08:45:49] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[08:45:49] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[08:45:49] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[08:45:49] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[08:45:49] [PASSED] DP_REMOTE_I2C_READ with port number
[08:45:49] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[08:45:49] [PASSED] DP_REMOTE_I2C_READ with transactions array
[08:45:49] [PASSED] DP_REMOTE_I2C_WRITE with port number
[08:45:49] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[08:45:49] [PASSED] DP_REMOTE_I2C_WRITE with data array
[08:45:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[08:45:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[08:45:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[08:45:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[08:45:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[08:45:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[08:45:49] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[08:45:49] ================ [PASSED] drm_dp_mst_helper ================
[08:45:49] ================= drm_format_helper_test  ==================
[08:45:49] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[08:45:49] [PASSED] single_pixel_source_buffer
[08:45:49] [PASSED] single_pixel_clip_rectangle
[08:45:49] [PASSED] well_known_colors
[08:45:49] [PASSED] destination_pitch
[08:45:49] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[08:45:49] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[08:45:49] [PASSED] single_pixel_source_buffer
[08:45:49] [PASSED] single_pixel_clip_rectangle
[08:45:49] [PASSED] well_known_colors
[08:45:49] [PASSED] destination_pitch
[08:45:49] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[08:45:49] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[08:45:49] [PASSED] single_pixel_source_buffer
[08:45:49] [PASSED] single_pixel_clip_rectangle
[08:45:49] [PASSED] well_known_colors
[08:45:49] [PASSED] destination_pitch
[08:45:49] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[08:45:49] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[08:45:49] [PASSED] single_pixel_source_buffer
[08:45:49] [PASSED] single_pixel_clip_rectangle
[08:45:49] [PASSED] well_known_colors
[08:45:49] [PASSED] destination_pitch
[08:45:49] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[08:45:49] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[08:45:49] [PASSED] single_pixel_source_buffer
[08:45:49] [PASSED] single_pixel_clip_rectangle
[08:45:49] [PASSED] well_known_colors
[08:45:49] [PASSED] destination_pitch
[08:45:49] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[08:45:49] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[08:45:49] [PASSED] single_pixel_source_buffer
[08:45:49] [PASSED] single_pixel_clip_rectangle
[08:45:49] [PASSED] well_known_colors
[08:45:49] [PASSED] destination_pitch
[08:45:49] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[08:45:49] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[08:45:49] [PASSED] single_pixel_source_buffer
[08:45:49] [PASSED] single_pixel_clip_rectangle
[08:45:49] [PASSED] well_known_colors
[08:45:49] [PASSED] destination_pitch
[08:45:49] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[08:45:49] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[08:45:49] [PASSED] single_pixel_source_buffer
[08:45:49] [PASSED] single_pixel_clip_rectangle
[08:45:49] [PASSED] well_known_colors
[08:45:49] [PASSED] destination_pitch
[08:45:49] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[08:45:49] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[08:45:49] [PASSED] single_pixel_source_buffer
[08:45:49] [PASSED] single_pixel_clip_rectangle
[08:45:49] [PASSED] well_known_colors
[08:45:49] [PASSED] destination_pitch
[08:45:49] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[08:45:49] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[08:45:49] [PASSED] single_pixel_source_buffer
[08:45:49] [PASSED] single_pixel_clip_rectangle
[08:45:49] [PASSED] well_known_colors
[08:45:49] [PASSED] destination_pitch
[08:45:49] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[08:45:49] ============== drm_test_fb_xrgb8888_to_mono  ===============
[08:45:49] [PASSED] single_pixel_source_buffer
[08:45:49] [PASSED] single_pixel_clip_rectangle
[08:45:49] [PASSED] well_known_colors
[08:45:49] [PASSED] destination_pitch
[08:45:49] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[08:45:49] ==================== drm_test_fb_swab  =====================
[08:45:49] [PASSED] single_pixel_source_buffer
[08:45:49] [PASSED] single_pixel_clip_rectangle
[08:45:49] [PASSED] well_known_colors
[08:45:49] [PASSED] destination_pitch
[08:45:49] ================ [PASSED] drm_test_fb_swab =================
[08:45:49] ================= drm_test_fb_clip_offset  =================
[08:45:49] [PASSED] pass through
[08:45:49] [PASSED] horizontal offset
[08:45:49] [PASSED] vertical offset
[08:45:49] [PASSED] horizontal and vertical offset
[08:45:49] [PASSED] horizontal offset (custom pitch)
[08:45:49] [PASSED] vertical offset (custom pitch)
[08:45:49] [PASSED] horizontal and vertical offset (custom pitch)
[08:45:49] ============= [PASSED] drm_test_fb_clip_offset =============
[08:45:49] ============== drm_test_fb_build_fourcc_list  ==============
[08:45:49] [PASSED] no native formats
[08:45:49] [PASSED] XRGB8888 as native format
[08:45:49] [PASSED] remove duplicates
[08:45:49] [PASSED] convert alpha formats
[08:45:49] [PASSED] random formats
[08:45:49] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[08:45:49] =================== drm_test_fb_memcpy  ====================
[08:45:49] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[08:45:49] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[08:45:49] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[08:45:49] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[08:45:49] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[08:45:49] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[08:45:49] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[08:45:49] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[08:45:49] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[08:45:49] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[08:45:49] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[08:45:49] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[08:45:49] =============== [PASSED] drm_test_fb_memcpy ================
[08:45:49] ============= [PASSED] drm_format_helper_test ==============
[08:45:49] ======================= drm_format  ========================
[08:45:49] [PASSED] drm_test_format_block_width_invalid
[08:45:49] [PASSED] drm_test_format_block_width_one_plane
[08:45:49] [PASSED] drm_test_format_block_width_two_plane
[08:45:49] [PASSED] drm_test_format_block_width_three_plane
[08:45:49] [PASSED] drm_test_format_block_width_tiled
[08:45:49] [PASSED] drm_test_format_block_height_invalid
[08:45:49] [PASSED] drm_test_format_block_height_one_plane
[08:45:49] [PASSED] drm_test_format_block_height_two_plane
[08:45:49] [PASSED] drm_test_format_block_height_three_plane
[08:45:49] [PASSED] drm_test_format_block_height_tiled
[08:45:49] [PASSED] drm_test_format_min_pitch_invalid
[08:45:49] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[08:45:49] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[08:45:49] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[08:45:49] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[08:45:49] [PASSED] drm_test_format_min_pitch_two_plane
[08:45:49] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[08:45:49] [PASSED] drm_test_format_min_pitch_tiled
[08:45:49] =================== [PASSED] drm_format ====================
[08:45:49] ===================== drm_framebuffer  =====================
[08:45:49] =============== drm_test_framebuffer_create  ===============
[08:45:49] [PASSED] ABGR8888 normal sizes
[08:45:49] [PASSED] ABGR8888 max sizes
[08:45:49] [PASSED] ABGR8888 pitch greater than min required
[08:45:49] [PASSED] ABGR8888 pitch less than min required
[08:45:49] [PASSED] ABGR8888 Invalid width
[08:45:49] [PASSED] ABGR8888 Invalid buffer handle
[08:45:49] [PASSED] No pixel format
[08:45:49] [PASSED] ABGR8888 Width 0
[08:45:49] [PASSED] ABGR8888 Height 0
[08:45:49] [PASSED] ABGR8888 Out of bound height * pitch combination
[08:45:49] [PASSED] ABGR8888 Large buffer offset
[08:45:49] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[08:45:49] [PASSED] ABGR8888 Valid buffer modifier
[08:45:49] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[08:45:49] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[08:45:49] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[08:45:49] [PASSED] NV12 Normal sizes
[08:45:49] [PASSED] NV12 Max sizes
[08:45:49] [PASSED] NV12 Invalid pitch
[08:45:49] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[08:45:49] [PASSED] NV12 different  modifier per-plane
[08:45:49] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[08:45:49] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[08:45:49] [PASSED] NV12 Modifier for inexistent plane
[08:45:49] [PASSED] NV12 Handle for inexistent plane
[08:45:49] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[08:45:49] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[08:45:49] [PASSED] YVU420 Normal sizes
[08:45:49] [PASSED] YVU420 Max sizes
[08:45:49] [PASSED] YVU420 Invalid pitch
[08:45:49] [PASSED] YVU420 Different pitches
[08:45:49] [PASSED] YVU420 Different buffer offsets/pitches
[08:45:49] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[08:45:49] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[08:45:49] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[08:45:49] [PASSED] YVU420 Valid modifier
[08:45:49] [PASSED] YVU420 Different modifiers per plane
[08:45:49] [PASSED] YVU420 Modifier for inexistent plane
[08:45:49] [PASSED] X0L2 Normal sizes
[08:45:49] [PASSED] X0L2 Max sizes
[08:45:49] [PASSED] X0L2 Invalid pitch
[08:45:49] [PASSED] X0L2 Pitch greater than minimum required
[08:45:49] [PASSED] X0L2 Handle for inexistent plane
[08:45:49] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[08:45:49] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[08:45:49] [PASSED] X0L2 Valid modifier
[08:45:49] [PASSED] X0L2 Modifier for inexistent plane
[08:45:49] =========== [PASSED] drm_test_framebuffer_create ===========
[08:45:49] ================= [PASSED] drm_framebuffer =================
[08:45:49] ==================== drm-test-managed  =====================
[08:45:49] [PASSED] drm_test_managed_run_action
[08:45:49] ================ [PASSED] drm-test-managed =================
[08:45:49] ========================= drm_mm  ==========================
[08:45:49] [PASSED] drm_test_mm_init
[08:45:49] [PASSED] drm_test_mm_debug
[08:46:00] [PASSED] drm_test_mm_reserve
[08:46:10] [PASSED] drm_test_mm_insert
[08:46:11] [PASSED] drm_test_mm_replace
[08:46:11] [PASSED] drm_test_mm_insert_range
[08:46:11] [PASSED] drm_test_mm_frag
[08:46:11] [PASSED] drm_test_mm_align
[08:46:11] [PASSED] drm_test_mm_align32
[08:46:11] [PASSED] drm_test_mm_align64
[08:46:11] [PASSED] drm_test_mm_evict
[08:46:11] [PASSED] drm_test_mm_evict_range
[08:46:11] [PASSED] drm_test_mm_topdown
[08:46:11] [PASSED] drm_test_mm_bottomup
[08:46:11] [PASSED] drm_test_mm_lowest
[08:46:11] [PASSED] drm_test_mm_highest
[08:46:12] [PASSED] drm_test_mm_color
[08:46:13] [PASSED] drm_test_mm_color_evict
[08:46:13] [PASSED] drm_test_mm_color_evict_range
[08:46:13] ===================== [PASSED] drm_mm ======================
[08:46:13] =================== drm_modes_analog_tv  ===================
[08:46:13] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[08:46:13] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[08:46:13] [PASSED] drm_test_modes_analog_tv_pal_576i
[08:46:13] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[08:46:13] =============== [PASSED] drm_modes_analog_tv ===============
[08:46:13] ==================== drm_plane_helper  =====================
[08:46:13] =============== drm_test_check_plane_state  ================
[08:46:13] [PASSED] clipping_simple
[08:46:13] [PASSED] clipping_rotate_reflect
[08:46:13] [PASSED] positioning_simple
[08:46:13] [PASSED] upscaling
[08:46:13] [PASSED] downscaling
[08:46:13] [PASSED] rounding1
[08:46:13] [PASSED] rounding2
[08:46:13] [PASSED] rounding3
[08:46:13] [PASSED] rounding4
[08:46:13] =========== [PASSED] drm_test_check_plane_state ============
[08:46:13] =========== drm_test_check_invalid_plane_state  ============
[08:46:13] [PASSED] positioning_invalid
[08:46:13] [PASSED] upscaling_invalid
[08:46:13] [PASSED] downscaling_invalid
[08:46:13] ======= [PASSED] drm_test_check_invalid_plane_state ========
[08:46:13] ================ [PASSED] drm_plane_helper =================
[08:46:13] ============ drm_connector_helper_tv_get_modes  ============
[08:46:13] ====== drm_test_connector_helper_tv_get_modes_check  =======
[08:46:13] [PASSED] None
[08:46:13] [PASSED] PAL
[08:46:13] [PASSED] NTSC
[08:46:13] [PASSED] Both, NTSC Default
[08:46:13] [PASSED] Both, PAL Default
[08:46:13] [PASSED] Both, NTSC Default, with PAL on command-line
[08:46:13] [PASSED] Both, PAL Default, with NTSC on command-line
[08:46:13] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[08:46:13] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[08:46:13] ======================== drm_rect  =========================
[08:46:13] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[08:46:13] [PASSED] drm_test_rect_clip_scaled_not_clipped
[08:46:13] [PASSED] drm_test_rect_clip_scaled_clipped
[08:46:13] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[08:46:13] ================= drm_test_rect_intersect  =================
[08:46:13] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[08:46:13] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[08:46:13] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[08:46:13] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[08:46:13] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[08:46:13] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[08:46:13] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[08:46:13] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[08:46:13] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[08:46:13] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[08:46:13] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[08:46:13] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[08:46:13] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[08:46:13] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[08:46:13] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[08:46:13] ============= [PASSED] drm_test_rect_intersect =============
[08:46:13] ================ drm_test_rect_calc_hscale  ================
[08:46:13] [PASSED] normal use
[08:46:13] [PASSED] out of max range
[08:46:13] [PASSED] out of min range
[08:46:13] [PASSED] zero dst
[08:46:13] [PASSED] negative src
[08:46:13] [PASSED] negative dst
[08:46:13] ============ [PASSED] drm_test_rect_calc_hscale ============
[08:46:13] ================ drm_test_rect_calc_vscale  ================
[08:46:13] [PASSED] normal use
[08:46:13] [PASSED] out of max range
[08:46:13] [PASSED] out of min range
[08:46:13] [PASSED] zero dst
[08:46:13] [PASSED] negative src
[08:46:13] [PASSED] negative dst
[08:46:13] ============ [PASSED] drm_test_rect_calc_vscale ============
[08:46:13] ================== drm_test_rect_rotate  ===================
[08:46:13] [PASSED] reflect-x
[08:46:13] [PASSED] reflect-y
[08:46:13] [PASSED] rotate-0
[08:46:13] [PASSED] rotate-90
[08:46:13] [PASSED] rotate-180
[08:46:13] [PASSED] rotate-270
[08:46:13] ============== [PASSED] drm_test_rect_rotate ===============
[08:46:13] ================ drm_test_rect_rotate_inv  =================
[08:46:13] [PASSED] reflect-x
[08:46:13] [PASSED] reflect-y
[08:46:13] [PASSED] rotate-0
[08:46:13] [PASSED] rotate-90
[08:46:13] [PASSED] rotate-180
[08:46:13] [PASSED] rotate-270
[08:46:13] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[08:46:13] ==================== [PASSED] drm_rect =====================
[08:46:13] ======================== drm_exec  =========================
[08:46:13] [PASSED] sanitycheck
[08:46:13] [PASSED] test_lock
[08:46:13] [PASSED] test_lock_unlock
[08:46:13] [PASSED] test_duplicates
[08:46:13] [PASSED] test_prepare
[08:46:13] [PASSED] test_prepare_array
[08:46:13] [PASSED] test_multiple_loops
[08:46:13] ==================== [PASSED] drm_exec =====================
[08:46:13] ============================================================
[08:46:13] Testing complete. Ran 368 tests: passed: 368
[08:46:13] Elapsed time: 44.449s total, 1.664s configuring, 19.041s building, 23.741s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


