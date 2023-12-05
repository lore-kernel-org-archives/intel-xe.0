Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170DDC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 20:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D714A10E620;
	Tue,  5 Dec 2023 20:45:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 886C610E620;
 Tue,  5 Dec 2023 20:45:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 838DDAADF1;
 Tue,  5 Dec 2023 20:45:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 05 Dec 2023 20:45:47 -0000
Message-ID: <170180914753.24284.6704610625127621052@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231205155820.2133813-1-lucas.demarchi@intel.com>
In-Reply-To: <20231205155820.2133813-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe?=
 =?utf-8?q?=3A_Expand_XE=5FREG=5FOPTION=5FMASKED_documentation?=
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

Series: drm/xe: Expand XE_REG_OPTION_MASKED documentation
URL   : https://patchwork.freedesktop.org/series/127370/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[20:44:36] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:44:40] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[20:45:00] Starting KUnit Kernel (1/1)...
[20:45:00] ============================================================
[20:45:00] ========================== xe_bo  ==========================
[20:45:00] [SKIPPED] xe_ccs_migrate_kunit
[20:45:00] [SKIPPED] xe_bo_evict_kunit
[20:45:00] ===================== [SKIPPED] xe_bo ======================
[20:45:00] ======================= xe_dma_buf  ========================
[20:45:00] [SKIPPED] xe_dma_buf_kunit
[20:45:00] =================== [SKIPPED] xe_dma_buf ===================
[20:45:00] ======================= xe_migrate  ========================
[20:45:00] [SKIPPED] xe_migrate_sanity_kunit
[20:45:00] =================== [SKIPPED] xe_migrate ===================
[20:45:00] ========================= xe_mocs  =========================
[20:45:00] [SKIPPED] xe_live_mocs_kernel_kunit
[20:45:00] ==================== [SKIPPED] xe_mocs =====================
[20:45:00] ========================= xe_pci  ==========================
[20:45:00] [PASSED] xe_gmdid_graphics_ip
[20:45:00] [PASSED] xe_gmdid_media_ip
[20:45:00] ===================== [PASSED] xe_pci ======================
[20:45:00] ========================= xe_rtp  ==========================
[20:45:00] ================== xe_rtp_process_tests  ===================
[20:45:00] [PASSED] coalesce-same-reg
[20:45:00] [PASSED] no-match-no-add
[20:45:00] [PASSED] no-match-no-add-multiple-rules
[20:45:00] [PASSED] two-regs-two-entries
[20:45:00] [PASSED] clr-one-set-other
[20:45:00] [PASSED] set-field
[20:45:00] [PASSED] conflict-duplicate
[20:45:00] [PASSED] conflict-not-disjoint
[20:45:00] [PASSED] conflict-reg-type
[20:45:00] ============== [PASSED] xe_rtp_process_tests ===============
[20:45:00] ===================== [PASSED] xe_rtp ======================
[20:45:00] ========================== xe_wa  ==========================
[20:45:00] ======================== xe_wa_gt  =========================
[20:45:00] [PASSED] TIGERLAKE (B0)
[20:45:00] [PASSED] DG1 (A0)
[20:45:00] [PASSED] DG1 (B0)
[20:45:00] [PASSED] ALDERLAKE_S (A0)
[20:45:00] [PASSED] ALDERLAKE_S (B0)
[20:45:00] [PASSED] ALDERLAKE_S (C0)
[20:45:00] [PASSED] ALDERLAKE_S (D0)
[20:45:00] [PASSED] ALDERLAKE_P (A0)
[20:45:00] [PASSED] ALDERLAKE_P (B0)
[20:45:00] [PASSED] ALDERLAKE_P (C0)
[20:45:00] [PASSED] ALDERLAKE_S_RPLS (D0)
[20:45:00] [PASSED] ALDERLAKE_P_RPLU (E0)
[20:45:00] [PASSED] DG2_G10 (A0)
[20:45:00] [PASSED] DG2_G10 (A1)
[20:45:00] [PASSED] DG2_G10 (B0)
[20:45:00] [PASSED] DG2_G10 (C0)
[20:45:00] [PASSED] DG2_G11 (A0)
[20:45:00] [PASSED] DG2_G11 (B0)
[20:45:00] [PASSED] DG2_G11 (B1)
[20:45:00] [PASSED] DG2_G12 (A0)
[20:45:00] [PASSED] DG2_G12 (A1)
[20:45:00] [PASSED] PVC (B0)
[20:45:00] [PASSED] PVC (B1)
[20:45:00] [PASSED] PVC (C0)
[20:45:00] ==================== [PASSED] xe_wa_gt =====================
[20:45:00] ====================== [PASSED] xe_wa ======================
[20:45:00] ============================================================
[20:45:00] Testing complete. Ran 40 tests: passed: 35, skipped: 5
[20:45:00] Elapsed time: 24.516s total, 4.229s configuring, 20.168s building, 0.099s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[20:45:00] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:45:02] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[20:45:21] Starting KUnit Kernel (1/1)...
[20:45:21] ============================================================
[20:45:21] ================== drm_test_pick_cmdline  ==================
[20:45:21] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[20:45:21] =============== drm_test_pick_cmdline_named  ===============
[20:45:21] [PASSED] NTSC
[20:45:21] [PASSED] NTSC-J
[20:45:21] [PASSED] PAL
[20:45:21] [PASSED] PAL-M
[20:45:21] =========== [PASSED] drm_test_pick_cmdline_named ===========
[20:45:21] ============== [PASSED] drm_test_pick_cmdline ==============
[20:45:21] ======================== drm_buddy  ========================
[20:45:21] [PASSED] drm_test_buddy_alloc_limit
[20:45:21] [PASSED] drm_test_buddy_alloc_range
[20:45:21] [PASSED] drm_test_buddy_alloc_optimistic
[20:45:22] [PASSED] drm_test_buddy_alloc_pessimistic
[20:45:22] [PASSED] drm_test_buddy_alloc_smoke
[20:45:22] [PASSED] drm_test_buddy_alloc_pathological
[20:45:22] ==================== [PASSED] drm_buddy ====================
[20:45:22] =================== drm_cmdline_parser  ====================
[20:45:22] [PASSED] drm_test_cmdline_force_d_only
[20:45:22] [PASSED] drm_test_cmdline_force_D_only_dvi
[20:45:22] [PASSED] drm_test_cmdline_force_D_only_hdmi
[20:45:22] [PASSED] drm_test_cmdline_force_D_only_not_digital
[20:45:22] [PASSED] drm_test_cmdline_force_e_only
[20:45:22] [PASSED] drm_test_cmdline_res
[20:45:22] [PASSED] drm_test_cmdline_res_vesa
[20:45:22] [PASSED] drm_test_cmdline_res_vesa_rblank
[20:45:22] [PASSED] drm_test_cmdline_res_rblank
[20:45:22] [PASSED] drm_test_cmdline_res_bpp
[20:45:22] [PASSED] drm_test_cmdline_res_refresh
[20:45:22] [PASSED] drm_test_cmdline_res_bpp_refresh
[20:45:22] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[20:45:22] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[20:45:22] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[20:45:22] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[20:45:22] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[20:45:22] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[20:45:22] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[20:45:22] [PASSED] drm_test_cmdline_res_margins_force_on
[20:45:22] [PASSED] drm_test_cmdline_res_vesa_margins
[20:45:22] [PASSED] drm_test_cmdline_name
[20:45:22] [PASSED] drm_test_cmdline_name_bpp
[20:45:22] [PASSED] drm_test_cmdline_name_option
[20:45:22] [PASSED] drm_test_cmdline_name_bpp_option
[20:45:22] [PASSED] drm_test_cmdline_rotate_0
[20:45:22] [PASSED] drm_test_cmdline_rotate_90
[20:45:22] [PASSED] drm_test_cmdline_rotate_180
[20:45:22] [PASSED] drm_test_cmdline_rotate_270
[20:45:22] [PASSED] drm_test_cmdline_hmirror
[20:45:22] [PASSED] drm_test_cmdline_vmirror
[20:45:22] [PASSED] drm_test_cmdline_margin_options
[20:45:22] [PASSED] drm_test_cmdline_multiple_options
[20:45:22] [PASSED] drm_test_cmdline_bpp_extra_and_option
[20:45:22] [PASSED] drm_test_cmdline_extra_and_option
[20:45:22] [PASSED] drm_test_cmdline_freestanding_options
[20:45:22] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[20:45:22] [PASSED] drm_test_cmdline_panel_orientation
[20:45:22] ================ drm_test_cmdline_invalid  =================
[20:45:22] [PASSED] margin_only
[20:45:22] [PASSED] interlace_only
[20:45:22] [PASSED] res_missing_x
[20:45:22] [PASSED] res_missing_y
[20:45:22] [PASSED] res_bad_y
[20:45:22] [PASSED] res_missing_y_bpp
[20:45:22] [PASSED] res_bad_bpp
[20:45:22] [PASSED] res_bad_refresh
[20:45:22] [PASSED] res_bpp_refresh_force_on_off
[20:45:22] [PASSED] res_invalid_mode
[20:45:22] [PASSED] res_bpp_wrong_place_mode
[20:45:22] [PASSED] name_bpp_refresh
[20:45:22] [PASSED] name_refresh
[20:45:22] [PASSED] name_refresh_wrong_mode
[20:45:22] [PASSED] name_refresh_invalid_mode
[20:45:22] [PASSED] rotate_multiple
[20:45:22] [PASSED] rotate_invalid_val
[20:45:22] [PASSED] rotate_truncated
[20:45:22] [PASSED] invalid_option
[20:45:22] [PASSED] invalid_tv_option
[20:45:22] [PASSED] truncated_tv_option
[20:45:22] ============ [PASSED] drm_test_cmdline_invalid =============
[20:45:22] =============== drm_test_cmdline_tv_options  ===============
[20:45:22] [PASSED] NTSC
[20:45:22] [PASSED] NTSC_443
[20:45:22] [PASSED] NTSC_J
[20:45:22] [PASSED] PAL
[20:45:22] [PASSED] PAL_M
[20:45:22] [PASSED] PAL_N
[20:45:22] [PASSED] SECAM
[20:45:22] =========== [PASSED] drm_test_cmdline_tv_options ===========
[20:45:22] =============== [PASSED] drm_cmdline_parser ================
[20:45:22] ================ drm_get_tv_mode_from_name  ================
[20:45:22] ========== drm_test_get_tv_mode_from_name_valid  ===========
[20:45:22] [PASSED] NTSC
[20:45:22] [PASSED] NTSC-443
[20:45:22] [PASSED] NTSC-J
[20:45:22] [PASSED] PAL
[20:45:22] [PASSED] PAL-M
[20:45:22] [PASSED] PAL-N
[20:45:22] [PASSED] SECAM
[20:45:22] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[20:45:22] [PASSED] drm_test_get_tv_mode_from_name_truncated
[20:45:22] ============ [PASSED] drm_get_tv_mode_from_name ============
[20:45:22] ==================== drm_damage_helper  ====================
[20:45:22] [PASSED] drm_test_damage_iter_no_damage
[20:45:22] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[20:45:22] [PASSED] drm_test_damage_iter_no_damage_src_moved
[20:45:22] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[20:45:22] [PASSED] drm_test_damage_iter_no_damage_not_visible
[20:45:22] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[20:45:22] [PASSED] drm_test_damage_iter_no_damage_no_fb
[20:45:22] [PASSED] drm_test_damage_iter_simple_damage
[20:45:22] [PASSED] drm_test_damage_iter_single_damage
[20:45:22] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[20:45:22] [PASSED] drm_test_damage_iter_single_damage_outside_src
[20:45:22] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[20:45:22] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[20:45:22] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[20:45:22] [PASSED] drm_test_damage_iter_single_damage_src_moved
[20:45:22] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[20:45:22] [PASSED] drm_test_damage_iter_damage
[20:45:22] [PASSED] drm_test_damage_iter_damage_one_intersect
[20:45:22] [PASSED] drm_test_damage_iter_damage_one_outside
[20:45:22] [PASSED] drm_test_damage_iter_damage_src_moved
[20:45:22] [PASSED] drm_test_damage_iter_damage_not_visible
[20:45:22] ================ [PASSED] drm_damage_helper ================
[20:45:22] ==================== drm_dp_mst_helper  ====================
[20:45:22] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[20:45:22] [PASSED] Clock 154000 BPP 30 DSC disabled
[20:45:22] [PASSED] Clock 234000 BPP 30 DSC disabled
[20:45:22] [PASSED] Clock 297000 BPP 24 DSC disabled
[20:45:22] [PASSED] Clock 332880 BPP 24 DSC enabled
[20:45:22] [PASSED] Clock 324540 BPP 24 DSC enabled
[20:45:22] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[20:45:22] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[20:45:22] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[20:45:22] [PASSED] DP_POWER_UP_PHY with port number
[20:45:22] [PASSED] DP_POWER_DOWN_PHY with port number
[20:45:22] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[20:45:22] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[20:45:22] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[20:45:22] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[20:45:22] [PASSED] DP_QUERY_PAYLOAD with port number
[20:45:22] [PASSED] DP_QUERY_PAYLOAD with VCPI
[20:45:22] [PASSED] DP_REMOTE_DPCD_READ with port number
[20:45:22] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[20:45:22] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[20:45:22] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[20:45:22] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[20:45:22] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[20:45:22] [PASSED] DP_REMOTE_I2C_READ with port number
[20:45:22] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[20:45:22] [PASSED] DP_REMOTE_I2C_READ with transactions array
[20:45:22] [PASSED] DP_REMOTE_I2C_WRITE with port number
[20:45:22] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[20:45:22] [PASSED] DP_REMOTE_I2C_WRITE with data array
[20:45:22] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[20:45:22] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[20:45:22] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[20:45:22] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[20:45:22] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[20:45:22] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[20:45:22] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[20:45:22] ================ [PASSED] drm_dp_mst_helper ================
[20:45:22] ================= drm_format_helper_test  ==================
[20:45:22] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[20:45:22] [PASSED] single_pixel_source_buffer
[20:45:22] [PASSED] single_pixel_clip_rectangle
[20:45:22] [PASSED] well_known_colors
[20:45:22] [PASSED] destination_pitch
[20:45:22] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[20:45:22] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[20:45:22] [PASSED] single_pixel_source_buffer
[20:45:22] [PASSED] single_pixel_clip_rectangle
[20:45:22] [PASSED] well_known_colors
[20:45:22] [PASSED] destination_pitch
[20:45:22] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[20:45:22] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[20:45:22] [PASSED] single_pixel_source_buffer
[20:45:22] [PASSED] single_pixel_clip_rectangle
[20:45:22] [PASSED] well_known_colors
[20:45:22] [PASSED] destination_pitch
[20:45:22] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[20:45:22] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[20:45:22] [PASSED] single_pixel_source_buffer
[20:45:22] [PASSED] single_pixel_clip_rectangle
[20:45:22] [PASSED] well_known_colors
[20:45:22] [PASSED] destination_pitch
[20:45:22] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[20:45:22] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[20:45:22] [PASSED] single_pixel_source_buffer
[20:45:22] [PASSED] single_pixel_clip_rectangle
[20:45:22] [PASSED] well_known_colors
[20:45:22] [PASSED] destination_pitch
[20:45:22] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[20:45:22] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[20:45:22] [PASSED] single_pixel_source_buffer
[20:45:22] [PASSED] single_pixel_clip_rectangle
[20:45:22] [PASSED] well_known_colors
[20:45:22] [PASSED] destination_pitch
[20:45:22] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[20:45:22] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[20:45:22] [PASSED] single_pixel_source_buffer
[20:45:22] [PASSED] single_pixel_clip_rectangle
[20:45:22] [PASSED] well_known_colors
[20:45:22] [PASSED] destination_pitch
[20:45:22] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[20:45:22] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[20:45:22] [PASSED] single_pixel_source_buffer
[20:45:22] [PASSED] single_pixel_clip_rectangle
[20:45:22] [PASSED] well_known_colors
[20:45:22] [PASSED] destination_pitch
[20:45:22] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[20:45:22] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[20:45:22] [PASSED] single_pixel_source_buffer
[20:45:22] [PASSED] single_pixel_clip_rectangle
[20:45:22] [PASSED] well_known_colors
[20:45:22] [PASSED] destination_pitch
[20:45:22] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[20:45:22] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[20:45:22] [PASSED] single_pixel_source_buffer
[20:45:22] [PASSED] single_pixel_clip_rectangle
[20:45:22] [PASSED] well_known_colors
[20:45:22] [PASSED] destination_pitch
[20:45:22] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[20:45:22] ============== drm_test_fb_xrgb8888_to_mono  ===============
[20:45:22] [PASSED] single_pixel_source_buffer
[20:45:22] [PASSED] single_pixel_clip_rectangle
[20:45:22] [PASSED] well_known_colors
[20:45:22] [PASSED] destination_pitch
[20:45:22] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[20:45:22] ==================== drm_test_fb_swab  =====================
[20:45:22] [PASSED] single_pixel_source_buffer
[20:45:22] [PASSED] single_pixel_clip_rectangle
[20:45:22] [PASSED] well_known_colors
[20:45:22] [PASSED] destination_pitch
[20:45:22] ================ [PASSED] drm_test_fb_swab =================
[20:45:22] ================= drm_test_fb_clip_offset  =================
[20:45:22] [PASSED] pass through
[20:45:22] [PASSED] horizontal offset
[20:45:22] [PASSED] vertical offset
[20:45:22] [PASSED] horizontal and vertical offset
[20:45:22] [PASSED] horizontal offset (custom pitch)
[20:45:22] [PASSED] vertical offset (custom pitch)
[20:45:22] [PASSED] horizontal and vertical offset (custom pitch)
[20:45:22] ============= [PASSED] drm_test_fb_clip_offset =============
[20:45:22] ============== drm_test_fb_build_fourcc_list  ==============
[20:45:22] [PASSED] no native formats
[20:45:22] [PASSED] XRGB8888 as native format
[20:45:22] [PASSED] remove duplicates
[20:45:22] [PASSED] convert alpha formats
[20:45:22] [PASSED] random formats
[20:45:22] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[20:45:22] =================== drm_test_fb_memcpy  ====================
[20:45:22] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[20:45:22] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[20:45:22] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[20:45:22] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[20:45:22] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[20:45:22] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[20:45:22] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[20:45:22] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[20:45:22] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[20:45:22] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[20:45:22] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[20:45:22] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[20:45:22] =============== [PASSED] drm_test_fb_memcpy ================
[20:45:22] ============= [PASSED] drm_format_helper_test ==============
[20:45:22] ======================= drm_format  ========================
[20:45:22] [PASSED] drm_test_format_block_width_invalid
[20:45:22] [PASSED] drm_test_format_block_width_one_plane
[20:45:22] [PASSED] drm_test_format_block_width_two_plane
[20:45:22] [PASSED] drm_test_format_block_width_three_plane
[20:45:22] [PASSED] drm_test_format_block_width_tiled
[20:45:22] [PASSED] drm_test_format_block_height_invalid
[20:45:22] [PASSED] drm_test_format_block_height_one_plane
[20:45:22] [PASSED] drm_test_format_block_height_two_plane
[20:45:22] [PASSED] drm_test_format_block_height_three_plane
[20:45:22] [PASSED] drm_test_format_block_height_tiled
[20:45:22] [PASSED] drm_test_format_min_pitch_invalid
[20:45:22] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[20:45:22] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[20:45:22] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[20:45:22] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[20:45:22] [PASSED] drm_test_format_min_pitch_two_plane
[20:45:22] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[20:45:22] [PASSED] drm_test_format_min_pitch_tiled
[20:45:22] =================== [PASSED] drm_format ====================
[20:45:22] ===================== drm_framebuffer  =====================
[20:45:22] =============== drm_test_framebuffer_create  ===============
[20:45:22] [PASSED] ABGR8888 normal sizes
[20:45:22] [PASSED] ABGR8888 max sizes
[20:45:22] [PASSED] ABGR8888 pitch greater than min required
[20:45:22] [PASSED] ABGR8888 pitch less than min required
[20:45:22] [PASSED] ABGR8888 Invalid width
[20:45:22] [PASSED] ABGR8888 Invalid buffer handle
[20:45:22] [PASSED] No pixel format
[20:45:22] [PASSED] ABGR8888 Width 0
[20:45:22] [PASSED] ABGR8888 Height 0
[20:45:22] [PASSED] ABGR8888 Out of bound height * pitch combination
[20:45:22] [PASSED] ABGR8888 Large buffer offset
[20:45:22] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[20:45:22] [PASSED] ABGR8888 Valid buffer modifier
[20:45:22] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[20:45:22] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[20:45:22] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[20:45:22] [PASSED] NV12 Normal sizes
[20:45:22] [PASSED] NV12 Max sizes
[20:45:22] [PASSED] NV12 Invalid pitch
[20:45:22] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[20:45:22] [PASSED] NV12 different  modifier per-plane
[20:45:22] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[20:45:22] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[20:45:22] [PASSED] NV12 Modifier for inexistent plane
[20:45:22] [PASSED] NV12 Handle for inexistent plane
[20:45:22] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[20:45:22] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[20:45:22] [PASSED] YVU420 Normal sizes
[20:45:22] [PASSED] YVU420 Max sizes
[20:45:22] [PASSED] YVU420 Invalid pitch
[20:45:22] [PASSED] YVU420 Different pitches
[20:45:22] [PASSED] YVU420 Different buffer offsets/pitches
[20:45:22] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[20:45:22] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[20:45:22] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[20:45:22] [PASSED] YVU420 Valid modifier
[20:45:22] [PASSED] YVU420 Different modifiers per plane
[20:45:22] [PASSED] YVU420 Modifier for inexistent plane
[20:45:22] [PASSED] X0L2 Normal sizes
[20:45:22] [PASSED] X0L2 Max sizes
[20:45:22] [PASSED] X0L2 Invalid pitch
[20:45:22] [PASSED] X0L2 Pitch greater than minimum required
[20:45:22] [PASSED] X0L2 Handle for inexistent plane
[20:45:22] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[20:45:22] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[20:45:22] [PASSED] X0L2 Valid modifier
[20:45:22] [PASSED] X0L2 Modifier for inexistent plane
[20:45:22] =========== [PASSED] drm_test_framebuffer_create ===========
[20:45:22] ================= [PASSED] drm_framebuffer =================
[20:45:22] ==================== drm-test-managed  =====================
[20:45:22] [PASSED] drm_test_managed_run_action
[20:45:22] ================ [PASSED] drm-test-managed =================
[20:45:22] ========================= drm_mm  ==========================
[20:45:22] [PASSED] drm_test_mm_init
[20:45:22] [PASSED] drm_test_mm_debug
[20:45:32] [PASSED] drm_test_mm_reserve
[20:45:42] [PASSED] drm_test_mm_insert
[20:45:43] [PASSED] drm_test_mm_replace
[20:45:43] [PASSED] drm_test_mm_insert_range
[20:45:43] [PASSED] drm_test_mm_frag
[20:45:43] [PASSED] drm_test_mm_align
[20:45:43] [PASSED] drm_test_mm_align32
[20:45:43] [PASSED] drm_test_mm_align64
[20:45:44] [PASSED] drm_test_mm_evict
[20:45:44] [PASSED] drm_test_mm_evict_range
[20:45:44] [PASSED] drm_test_mm_topdown
[20:45:44] [PASSED] drm_test_mm_bottomup
[20:45:44] [PASSED] drm_test_mm_lowest
[20:45:44] [PASSED] drm_test_mm_highest
[20:45:44] [PASSED] drm_test_mm_color
[20:45:45] [PASSED] drm_test_mm_color_evict
[20:45:45] [PASSED] drm_test_mm_color_evict_range
[20:45:45] ===================== [PASSED] drm_mm ======================
[20:45:45] =================== drm_modes_analog_tv  ===================
[20:45:45] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[20:45:45] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[20:45:45] [PASSED] drm_test_modes_analog_tv_pal_576i
[20:45:45] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[20:45:45] =============== [PASSED] drm_modes_analog_tv ===============
[20:45:45] ==================== drm_plane_helper  =====================
[20:45:45] =============== drm_test_check_plane_state  ================
[20:45:45] [PASSED] clipping_simple
[20:45:45] [PASSED] clipping_rotate_reflect
[20:45:45] [PASSED] positioning_simple
[20:45:45] [PASSED] upscaling
[20:45:45] [PASSED] downscaling
[20:45:45] [PASSED] rounding1
[20:45:45] [PASSED] rounding2
[20:45:45] [PASSED] rounding3
[20:45:45] [PASSED] rounding4
[20:45:45] =========== [PASSED] drm_test_check_plane_state ============
[20:45:45] =========== drm_test_check_invalid_plane_state  ============
[20:45:45] [PASSED] positioning_invalid
[20:45:45] [PASSED] upscaling_invalid
[20:45:45] [PASSED] downscaling_invalid
[20:45:45] ======= [PASSED] drm_test_check_invalid_plane_state ========
[20:45:45] ================ [PASSED] drm_plane_helper =================
[20:45:45] ============ drm_connector_helper_tv_get_modes  ============
[20:45:45] ====== drm_test_connector_helper_tv_get_modes_check  =======
[20:45:45] [PASSED] None
[20:45:45] [PASSED] PAL
[20:45:45] [PASSED] NTSC
[20:45:45] [PASSED] Both, NTSC Default
[20:45:45] [PASSED] Both, PAL Default
[20:45:45] [PASSED] Both, NTSC Default, with PAL on command-line
[20:45:45] [PASSED] Both, PAL Default, with NTSC on command-line
[20:45:45] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[20:45:45] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[20:45:45] ======================== drm_rect  =========================
[20:45:45] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[20:45:45] [PASSED] drm_test_rect_clip_scaled_not_clipped
[20:45:45] [PASSED] drm_test_rect_clip_scaled_clipped
[20:45:45] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[20:45:45] ================= drm_test_rect_intersect  =================
[20:45:45] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[20:45:45] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[20:45:45] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[20:45:45] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[20:45:45] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[20:45:45] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[20:45:45] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[20:45:45] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[20:45:45] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[20:45:45] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[20:45:45] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[20:45:45] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[20:45:45] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[20:45:45] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[20:45:45] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[20:45:45] ============= [PASSED] drm_test_rect_intersect =============
[20:45:45] ================ drm_test_rect_calc_hscale  ================
[20:45:45] [PASSED] normal use
[20:45:45] [PASSED] out of max range
[20:45:45] [PASSED] out of min range
[20:45:45] [PASSED] zero dst
[20:45:45] [PASSED] negative src
[20:45:45] [PASSED] negative dst
[20:45:45] ============ [PASSED] drm_test_rect_calc_hscale ============
[20:45:45] ================ drm_test_rect_calc_vscale  ================
[20:45:45] [PASSED] normal use
[20:45:45] [PASSED] out of max range
[20:45:45] [PASSED] out of min range
[20:45:45] [PASSED] zero dst
[20:45:45] [PASSED] negative src
[20:45:45] [PASSED] negative dst
[20:45:45] ============ [PASSED] drm_test_rect_calc_vscale ============
[20:45:45] ================== drm_test_rect_rotate  ===================
[20:45:45] [PASSED] reflect-x
[20:45:45] [PASSED] reflect-y
[20:45:45] [PASSED] rotate-0
[20:45:45] [PASSED] rotate-90
[20:45:45] [PASSED] rotate-180
[20:45:45] [PASSED] rotate-270
[20:45:45] ============== [PASSED] drm_test_rect_rotate ===============
[20:45:45] ================ drm_test_rect_rotate_inv  =================
[20:45:45] [PASSED] reflect-x
[20:45:45] [PASSED] reflect-y
[20:45:45] [PASSED] rotate-0
[20:45:45] [PASSED] rotate-90
[20:45:45] [PASSED] rotate-180
[20:45:45] [PASSED] rotate-270
[20:45:45] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[20:45:45] ==================== [PASSED] drm_rect =====================
[20:45:45] ======================== drm_exec  =========================
[20:45:45] [PASSED] sanitycheck
[20:45:45] [PASSED] test_lock
[20:45:45] [PASSED] test_lock_unlock
[20:45:45] [PASSED] test_duplicates
[20:45:45] [PASSED] test_prepare
[20:45:45] [PASSED] test_prepare_array
[20:45:45] [PASSED] test_multiple_loops
[20:45:45] ==================== [PASSED] drm_exec =====================
[20:45:45] ============================================================
[20:45:45] Testing complete. Ran 368 tests: passed: 368
[20:45:45] Elapsed time: 44.909s total, 1.676s configuring, 19.347s building, 23.862s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


