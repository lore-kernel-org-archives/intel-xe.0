Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6F0C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 02:10:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0B010E147;
	Tue, 12 Dec 2023 02:10:15 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C555610E147;
 Tue, 12 Dec 2023 02:10:13 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B5FFCAADFA;
 Tue, 12 Dec 2023 02:10:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Remove_vram_size_inf?=
 =?utf-8?q?o_from_sysfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Tue, 12 Dec 2023 02:10:13 -0000
Message-ID: <170234701374.31293.14221485262582264366@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231212002058.1105898-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231212002058.1105898-1-rodrigo.vivi@intel.com>
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

Series: drm/xe: Remove vram size info from sysfs
URL   : https://patchwork.freedesktop.org/series/127652/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[02:09:01] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:09:05] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[02:09:26] Starting KUnit Kernel (1/1)...
[02:09:26] ============================================================
[02:09:26] ========================== lmtt  ===========================
[02:09:26] ======================== test_ops  =========================
[02:09:26] [PASSED] 2-level
[02:09:26] [PASSED] multi-level
[02:09:26] ==================== [PASSED] test_ops =====================
[02:09:26] ====================== [PASSED] lmtt =======================
[02:09:26] ========================== xe_bo  ==========================
[02:09:26] [SKIPPED] xe_ccs_migrate_kunit
[02:09:26] [SKIPPED] xe_bo_evict_kunit
[02:09:26] ===================== [SKIPPED] xe_bo ======================
[02:09:26] ======================= xe_dma_buf  ========================
[02:09:26] [SKIPPED] xe_dma_buf_kunit
[02:09:26] =================== [SKIPPED] xe_dma_buf ===================
[02:09:26] ======================= xe_migrate  ========================
[02:09:26] [SKIPPED] xe_migrate_sanity_kunit
[02:09:26] =================== [SKIPPED] xe_migrate ===================
[02:09:26] ========================= xe_mocs  =========================
[02:09:26] [SKIPPED] xe_live_mocs_kernel_kunit
[02:09:26] ==================== [SKIPPED] xe_mocs =====================
[02:09:26] ========================= xe_pci  ==========================
[02:09:26] [PASSED] xe_gmdid_graphics_ip
[02:09:26] [PASSED] xe_gmdid_media_ip
[02:09:26] ===================== [PASSED] xe_pci ======================
[02:09:26] ========================= xe_rtp  ==========================
[02:09:26] ================== xe_rtp_process_tests  ===================
[02:09:26] [PASSED] coalesce-same-reg
[02:09:26] [PASSED] no-match-no-add
[02:09:26] [PASSED] no-match-no-add-multiple-rules
[02:09:26] [PASSED] two-regs-two-entries
[02:09:26] [PASSED] clr-one-set-other
[02:09:26] [PASSED] set-field
[02:09:26] [PASSED] conflict-duplicate
[02:09:26] [PASSED] conflict-not-disjoint
[02:09:26] [PASSED] conflict-reg-type
[02:09:26] ============== [PASSED] xe_rtp_process_tests ===============
[02:09:26] ===================== [PASSED] xe_rtp ======================
[02:09:26] ========================== xe_wa  ==========================
[02:09:26] ======================== xe_wa_gt  =========================
[02:09:26] [PASSED] TIGERLAKE (B0)
[02:09:26] [PASSED] DG1 (A0)
[02:09:26] [PASSED] DG1 (B0)
[02:09:26] [PASSED] ALDERLAKE_S (A0)
[02:09:26] [PASSED] ALDERLAKE_S (B0)
[02:09:26] [PASSED] ALDERLAKE_S (C0)
[02:09:26] [PASSED] ALDERLAKE_S (D0)
[02:09:26] [PASSED] ALDERLAKE_P (A0)
[02:09:26] [PASSED] ALDERLAKE_P (B0)
[02:09:26] [PASSED] ALDERLAKE_P (C0)
[02:09:26] [PASSED] ALDERLAKE_S_RPLS (D0)
[02:09:26] [PASSED] ALDERLAKE_P_RPLU (E0)
[02:09:26] [PASSED] DG2_G10 (A0)
[02:09:26] [PASSED] DG2_G10 (A1)
[02:09:26] [PASSED] DG2_G10 (B0)
[02:09:26] [PASSED] DG2_G10 (C0)
[02:09:26] [PASSED] DG2_G11 (A0)
[02:09:26] [PASSED] DG2_G11 (B0)
[02:09:26] [PASSED] DG2_G11 (B1)
[02:09:26] [PASSED] DG2_G12 (A0)
[02:09:26] [PASSED] DG2_G12 (A1)
[02:09:26] [PASSED] PVC (B0)
[02:09:26] [PASSED] PVC (B1)
[02:09:26] [PASSED] PVC (C0)
[02:09:26] [PASSED] METEORLAKE (g:A0, m:A0)
[02:09:26] [PASSED] METEORLAKE (g:A0, m:A0)
[02:09:26] [PASSED] LUNARLAKE (g:A0, m:A0)
[02:09:26] [PASSED] LUNARLAKE (g:B0, m:A0)
[02:09:26] ==================== [PASSED] xe_wa_gt =====================
[02:09:26] ====================== [PASSED] xe_wa ======================
[02:09:26] ============================================================
[02:09:26] Testing complete. Ran 46 tests: passed: 41, skipped: 5
[02:09:26] Elapsed time: 24.924s total, 4.177s configuring, 20.577s building, 0.143s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[02:09:26] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:09:28] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[02:09:48] Starting KUnit Kernel (1/1)...
[02:09:48] ============================================================
[02:09:48] ================== drm_test_pick_cmdline  ==================
[02:09:48] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[02:09:48] =============== drm_test_pick_cmdline_named  ===============
[02:09:48] [PASSED] NTSC
[02:09:48] [PASSED] NTSC-J
[02:09:48] [PASSED] PAL
[02:09:48] [PASSED] PAL-M
[02:09:48] =========== [PASSED] drm_test_pick_cmdline_named ===========
[02:09:48] ============== [PASSED] drm_test_pick_cmdline ==============
[02:09:48] ======================== drm_buddy  ========================
[02:09:48] [PASSED] drm_test_buddy_alloc_limit
[02:09:48] [PASSED] drm_test_buddy_alloc_range
[02:09:48] [PASSED] drm_test_buddy_alloc_optimistic
[02:09:48] [PASSED] drm_test_buddy_alloc_pessimistic
[02:09:48] [PASSED] drm_test_buddy_alloc_smoke
[02:09:48] [PASSED] drm_test_buddy_alloc_pathological
[02:09:48] ==================== [PASSED] drm_buddy ====================
[02:09:48] =================== drm_cmdline_parser  ====================
[02:09:48] [PASSED] drm_test_cmdline_force_d_only
[02:09:48] [PASSED] drm_test_cmdline_force_D_only_dvi
[02:09:48] [PASSED] drm_test_cmdline_force_D_only_hdmi
[02:09:48] [PASSED] drm_test_cmdline_force_D_only_not_digital
[02:09:48] [PASSED] drm_test_cmdline_force_e_only
[02:09:48] [PASSED] drm_test_cmdline_res
[02:09:48] [PASSED] drm_test_cmdline_res_vesa
[02:09:48] [PASSED] drm_test_cmdline_res_vesa_rblank
[02:09:48] [PASSED] drm_test_cmdline_res_rblank
[02:09:48] [PASSED] drm_test_cmdline_res_bpp
[02:09:48] [PASSED] drm_test_cmdline_res_refresh
[02:09:48] [PASSED] drm_test_cmdline_res_bpp_refresh
[02:09:48] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[02:09:48] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[02:09:48] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[02:09:48] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[02:09:48] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[02:09:48] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[02:09:48] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[02:09:48] [PASSED] drm_test_cmdline_res_margins_force_on
[02:09:48] [PASSED] drm_test_cmdline_res_vesa_margins
[02:09:48] [PASSED] drm_test_cmdline_name
[02:09:48] [PASSED] drm_test_cmdline_name_bpp
[02:09:48] [PASSED] drm_test_cmdline_name_option
[02:09:48] [PASSED] drm_test_cmdline_name_bpp_option
[02:09:48] [PASSED] drm_test_cmdline_rotate_0
[02:09:48] [PASSED] drm_test_cmdline_rotate_90
[02:09:48] [PASSED] drm_test_cmdline_rotate_180
[02:09:48] [PASSED] drm_test_cmdline_rotate_270
[02:09:48] [PASSED] drm_test_cmdline_hmirror
[02:09:48] [PASSED] drm_test_cmdline_vmirror
[02:09:48] [PASSED] drm_test_cmdline_margin_options
[02:09:48] [PASSED] drm_test_cmdline_multiple_options
[02:09:48] [PASSED] drm_test_cmdline_bpp_extra_and_option
[02:09:48] [PASSED] drm_test_cmdline_extra_and_option
[02:09:48] [PASSED] drm_test_cmdline_freestanding_options
[02:09:48] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[02:09:48] [PASSED] drm_test_cmdline_panel_orientation
[02:09:48] ================ drm_test_cmdline_invalid  =================
[02:09:48] [PASSED] margin_only
[02:09:48] [PASSED] interlace_only
[02:09:48] [PASSED] res_missing_x
[02:09:48] [PASSED] res_missing_y
[02:09:48] [PASSED] res_bad_y
[02:09:48] [PASSED] res_missing_y_bpp
[02:09:48] [PASSED] res_bad_bpp
[02:09:48] [PASSED] res_bad_refresh
[02:09:48] [PASSED] res_bpp_refresh_force_on_off
[02:09:48] [PASSED] res_invalid_mode
[02:09:48] [PASSED] res_bpp_wrong_place_mode
[02:09:48] [PASSED] name_bpp_refresh
[02:09:48] [PASSED] name_refresh
[02:09:48] [PASSED] name_refresh_wrong_mode
[02:09:48] [PASSED] name_refresh_invalid_mode
[02:09:48] [PASSED] rotate_multiple
[02:09:48] [PASSED] rotate_invalid_val
[02:09:48] [PASSED] rotate_truncated
[02:09:48] [PASSED] invalid_option
[02:09:48] [PASSED] invalid_tv_option
[02:09:48] [PASSED] truncated_tv_option
[02:09:48] ============ [PASSED] drm_test_cmdline_invalid =============
[02:09:48] =============== drm_test_cmdline_tv_options  ===============
[02:09:48] [PASSED] NTSC
[02:09:48] [PASSED] NTSC_443
[02:09:48] [PASSED] NTSC_J
[02:09:48] [PASSED] PAL
[02:09:48] [PASSED] PAL_M
[02:09:48] [PASSED] PAL_N
[02:09:48] [PASSED] SECAM
[02:09:48] =========== [PASSED] drm_test_cmdline_tv_options ===========
[02:09:48] =============== [PASSED] drm_cmdline_parser ================
[02:09:48] ================ drm_get_tv_mode_from_name  ================
[02:09:48] ========== drm_test_get_tv_mode_from_name_valid  ===========
[02:09:48] [PASSED] NTSC
[02:09:48] [PASSED] NTSC-443
[02:09:48] [PASSED] NTSC-J
[02:09:48] [PASSED] PAL
[02:09:48] [PASSED] PAL-M
[02:09:48] [PASSED] PAL-N
[02:09:48] [PASSED] SECAM
[02:09:48] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[02:09:48] [PASSED] drm_test_get_tv_mode_from_name_truncated
[02:09:48] ============ [PASSED] drm_get_tv_mode_from_name ============
[02:09:48] ==================== drm_damage_helper  ====================
[02:09:48] [PASSED] drm_test_damage_iter_no_damage
[02:09:48] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[02:09:48] [PASSED] drm_test_damage_iter_no_damage_src_moved
[02:09:48] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[02:09:48] [PASSED] drm_test_damage_iter_no_damage_not_visible
[02:09:48] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[02:09:48] [PASSED] drm_test_damage_iter_no_damage_no_fb
[02:09:48] [PASSED] drm_test_damage_iter_simple_damage
[02:09:48] [PASSED] drm_test_damage_iter_single_damage
[02:09:48] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[02:09:48] [PASSED] drm_test_damage_iter_single_damage_outside_src
[02:09:48] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[02:09:48] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[02:09:48] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[02:09:48] [PASSED] drm_test_damage_iter_single_damage_src_moved
[02:09:48] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[02:09:48] [PASSED] drm_test_damage_iter_damage
[02:09:48] [PASSED] drm_test_damage_iter_damage_one_intersect
[02:09:48] [PASSED] drm_test_damage_iter_damage_one_outside
[02:09:48] [PASSED] drm_test_damage_iter_damage_src_moved
[02:09:48] [PASSED] drm_test_damage_iter_damage_not_visible
[02:09:48] ================ [PASSED] drm_damage_helper ================
[02:09:48] ==================== drm_dp_mst_helper  ====================
[02:09:48] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[02:09:48] [PASSED] Clock 154000 BPP 30 DSC disabled
[02:09:48] [PASSED] Clock 234000 BPP 30 DSC disabled
[02:09:48] [PASSED] Clock 297000 BPP 24 DSC disabled
[02:09:48] [PASSED] Clock 332880 BPP 24 DSC enabled
[02:09:48] [PASSED] Clock 324540 BPP 24 DSC enabled
[02:09:48] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[02:09:48] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[02:09:48] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[02:09:48] [PASSED] DP_POWER_UP_PHY with port number
[02:09:48] [PASSED] DP_POWER_DOWN_PHY with port number
[02:09:48] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[02:09:48] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[02:09:48] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[02:09:48] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[02:09:48] [PASSED] DP_QUERY_PAYLOAD with port number
[02:09:48] [PASSED] DP_QUERY_PAYLOAD with VCPI
[02:09:48] [PASSED] DP_REMOTE_DPCD_READ with port number
[02:09:48] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[02:09:48] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[02:09:48] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[02:09:48] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[02:09:48] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[02:09:48] [PASSED] DP_REMOTE_I2C_READ with port number
[02:09:48] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[02:09:48] [PASSED] DP_REMOTE_I2C_READ with transactions array
[02:09:48] [PASSED] DP_REMOTE_I2C_WRITE with port number
[02:09:48] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[02:09:48] [PASSED] DP_REMOTE_I2C_WRITE with data array
[02:09:48] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[02:09:48] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[02:09:48] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[02:09:48] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[02:09:48] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[02:09:48] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[02:09:48] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[02:09:48] ================ [PASSED] drm_dp_mst_helper ================
[02:09:48] ================= drm_format_helper_test  ==================
[02:09:48] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[02:09:48] [PASSED] single_pixel_source_buffer
[02:09:48] [PASSED] single_pixel_clip_rectangle
[02:09:48] [PASSED] well_known_colors
[02:09:48] [PASSED] destination_pitch
[02:09:48] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[02:09:48] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[02:09:48] [PASSED] single_pixel_source_buffer
[02:09:48] [PASSED] single_pixel_clip_rectangle
[02:09:48] [PASSED] well_known_colors
[02:09:48] [PASSED] destination_pitch
[02:09:48] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[02:09:48] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[02:09:48] [PASSED] single_pixel_source_buffer
[02:09:48] [PASSED] single_pixel_clip_rectangle
[02:09:48] [PASSED] well_known_colors
[02:09:48] [PASSED] destination_pitch
[02:09:48] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[02:09:48] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[02:09:48] [PASSED] single_pixel_source_buffer
[02:09:48] [PASSED] single_pixel_clip_rectangle
[02:09:48] [PASSED] well_known_colors
[02:09:48] [PASSED] destination_pitch
[02:09:48] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[02:09:48] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[02:09:48] [PASSED] single_pixel_source_buffer
[02:09:48] [PASSED] single_pixel_clip_rectangle
[02:09:48] [PASSED] well_known_colors
[02:09:48] [PASSED] destination_pitch
[02:09:48] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[02:09:48] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[02:09:48] [PASSED] single_pixel_source_buffer
[02:09:48] [PASSED] single_pixel_clip_rectangle
[02:09:48] [PASSED] well_known_colors
[02:09:48] [PASSED] destination_pitch
[02:09:48] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[02:09:48] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[02:09:48] [PASSED] single_pixel_source_buffer
[02:09:48] [PASSED] single_pixel_clip_rectangle
[02:09:48] [PASSED] well_known_colors
[02:09:48] [PASSED] destination_pitch
[02:09:48] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[02:09:48] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[02:09:48] [PASSED] single_pixel_source_buffer
[02:09:48] [PASSED] single_pixel_clip_rectangle
[02:09:48] [PASSED] well_known_colors
[02:09:48] [PASSED] destination_pitch
[02:09:48] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[02:09:48] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[02:09:48] [PASSED] single_pixel_source_buffer
[02:09:48] [PASSED] single_pixel_clip_rectangle
[02:09:48] [PASSED] well_known_colors
[02:09:48] [PASSED] destination_pitch
[02:09:48] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[02:09:48] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[02:09:48] [PASSED] single_pixel_source_buffer
[02:09:48] [PASSED] single_pixel_clip_rectangle
[02:09:48] [PASSED] well_known_colors
[02:09:48] [PASSED] destination_pitch
[02:09:48] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[02:09:48] ============== drm_test_fb_xrgb8888_to_mono  ===============
[02:09:48] [PASSED] single_pixel_source_buffer
[02:09:48] [PASSED] single_pixel_clip_rectangle
[02:09:48] [PASSED] well_known_colors
[02:09:48] [PASSED] destination_pitch
[02:09:48] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[02:09:48] ==================== drm_test_fb_swab  =====================
[02:09:48] [PASSED] single_pixel_source_buffer
[02:09:48] [PASSED] single_pixel_clip_rectangle
[02:09:48] [PASSED] well_known_colors
[02:09:48] [PASSED] destination_pitch
[02:09:48] ================ [PASSED] drm_test_fb_swab =================
[02:09:48] ================= drm_test_fb_clip_offset  =================
[02:09:48] [PASSED] pass through
[02:09:48] [PASSED] horizontal offset
[02:09:48] [PASSED] vertical offset
[02:09:48] [PASSED] horizontal and vertical offset
[02:09:48] [PASSED] horizontal offset (custom pitch)
[02:09:48] [PASSED] vertical offset (custom pitch)
[02:09:48] [PASSED] horizontal and vertical offset (custom pitch)
[02:09:48] ============= [PASSED] drm_test_fb_clip_offset =============
[02:09:48] ============== drm_test_fb_build_fourcc_list  ==============
[02:09:48] [PASSED] no native formats
[02:09:48] [PASSED] XRGB8888 as native format
[02:09:48] [PASSED] remove duplicates
[02:09:48] [PASSED] convert alpha formats
[02:09:48] [PASSED] random formats
[02:09:48] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[02:09:48] =================== drm_test_fb_memcpy  ====================
[02:09:48] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[02:09:48] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[02:09:48] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[02:09:48] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[02:09:48] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[02:09:48] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[02:09:48] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[02:09:48] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[02:09:48] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[02:09:48] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[02:09:48] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[02:09:48] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[02:09:48] =============== [PASSED] drm_test_fb_memcpy ================
[02:09:48] ============= [PASSED] drm_format_helper_test ==============
[02:09:48] ======================= drm_format  ========================
[02:09:48] [PASSED] drm_test_format_block_width_invalid
[02:09:48] [PASSED] drm_test_format_block_width_one_plane
[02:09:48] [PASSED] drm_test_format_block_width_two_plane
[02:09:48] [PASSED] drm_test_format_block_width_three_plane
[02:09:48] [PASSED] drm_test_format_block_width_tiled
[02:09:48] [PASSED] drm_test_format_block_height_invalid
[02:09:48] [PASSED] drm_test_format_block_height_one_plane
[02:09:48] [PASSED] drm_test_format_block_height_two_plane
[02:09:48] [PASSED] drm_test_format_block_height_three_plane
[02:09:48] [PASSED] drm_test_format_block_height_tiled
[02:09:48] [PASSED] drm_test_format_min_pitch_invalid
[02:09:48] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[02:09:48] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[02:09:48] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[02:09:48] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[02:09:48] [PASSED] drm_test_format_min_pitch_two_plane
[02:09:48] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[02:09:48] [PASSED] drm_test_format_min_pitch_tiled
[02:09:48] =================== [PASSED] drm_format ====================
[02:09:48] ===================== drm_framebuffer  =====================
[02:09:48] =============== drm_test_framebuffer_create  ===============
[02:09:48] [PASSED] ABGR8888 normal sizes
[02:09:48] [PASSED] ABGR8888 max sizes
[02:09:48] [PASSED] ABGR8888 pitch greater than min required
[02:09:48] [PASSED] ABGR8888 pitch less than min required
[02:09:48] [PASSED] ABGR8888 Invalid width
[02:09:48] [PASSED] ABGR8888 Invalid buffer handle
[02:09:48] [PASSED] No pixel format
[02:09:48] [PASSED] ABGR8888 Width 0
[02:09:48] [PASSED] ABGR8888 Height 0
[02:09:48] [PASSED] ABGR8888 Out of bound height * pitch combination
[02:09:48] [PASSED] ABGR8888 Large buffer offset
[02:09:48] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[02:09:48] [PASSED] ABGR8888 Valid buffer modifier
[02:09:48] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[02:09:48] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[02:09:48] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[02:09:48] [PASSED] NV12 Normal sizes
[02:09:48] [PASSED] NV12 Max sizes
[02:09:48] [PASSED] NV12 Invalid pitch
[02:09:48] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[02:09:48] [PASSED] NV12 different  modifier per-plane
[02:09:48] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[02:09:48] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[02:09:48] [PASSED] NV12 Modifier for inexistent plane
[02:09:48] [PASSED] NV12 Handle for inexistent plane
[02:09:48] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[02:09:48] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[02:09:48] [PASSED] YVU420 Normal sizes
[02:09:48] [PASSED] YVU420 Max sizes
[02:09:48] [PASSED] YVU420 Invalid pitch
[02:09:48] [PASSED] YVU420 Different pitches
[02:09:48] [PASSED] YVU420 Different buffer offsets/pitches
[02:09:48] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[02:09:48] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[02:09:48] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[02:09:48] [PASSED] YVU420 Valid modifier
[02:09:48] [PASSED] YVU420 Different modifiers per plane
[02:09:48] [PASSED] YVU420 Modifier for inexistent plane
[02:09:48] [PASSED] X0L2 Normal sizes
[02:09:48] [PASSED] X0L2 Max sizes
[02:09:48] [PASSED] X0L2 Invalid pitch
[02:09:48] [PASSED] X0L2 Pitch greater than minimum required
[02:09:48] [PASSED] X0L2 Handle for inexistent plane
[02:09:48] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[02:09:48] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[02:09:48] [PASSED] X0L2 Valid modifier
[02:09:48] [PASSED] X0L2 Modifier for inexistent plane
[02:09:48] =========== [PASSED] drm_test_framebuffer_create ===========
[02:09:48] ================= [PASSED] drm_framebuffer =================
[02:09:48] ==================== drm-test-managed  =====================
[02:09:48] [PASSED] drm_test_managed_run_action
[02:09:48] ================ [PASSED] drm-test-managed =================
[02:09:48] ========================= drm_mm  ==========================
[02:09:48] [PASSED] drm_test_mm_init
[02:09:48] [PASSED] drm_test_mm_debug
[02:09:58] [PASSED] drm_test_mm_reserve
[02:10:08] [PASSED] drm_test_mm_insert
[02:10:09] [PASSED] drm_test_mm_replace
[02:10:09] [PASSED] drm_test_mm_insert_range
[02:10:09] [PASSED] drm_test_mm_frag
[02:10:09] [PASSED] drm_test_mm_align
[02:10:09] [PASSED] drm_test_mm_align32
[02:10:10] [PASSED] drm_test_mm_align64
[02:10:10] [PASSED] drm_test_mm_evict
[02:10:10] [PASSED] drm_test_mm_evict_range
[02:10:10] [PASSED] drm_test_mm_topdown
[02:10:10] [PASSED] drm_test_mm_bottomup
[02:10:10] [PASSED] drm_test_mm_lowest
[02:10:10] [PASSED] drm_test_mm_highest
[02:10:11] [PASSED] drm_test_mm_color
[02:10:11] [PASSED] drm_test_mm_color_evict
[02:10:11] [PASSED] drm_test_mm_color_evict_range
[02:10:11] ===================== [PASSED] drm_mm ======================
[02:10:11] =================== drm_modes_analog_tv  ===================
[02:10:11] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[02:10:11] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[02:10:11] [PASSED] drm_test_modes_analog_tv_pal_576i
[02:10:11] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[02:10:11] =============== [PASSED] drm_modes_analog_tv ===============
[02:10:11] ==================== drm_plane_helper  =====================
[02:10:11] =============== drm_test_check_plane_state  ================
[02:10:11] [PASSED] clipping_simple
[02:10:11] [PASSED] clipping_rotate_reflect
[02:10:11] [PASSED] positioning_simple
[02:10:11] [PASSED] upscaling
[02:10:11] [PASSED] downscaling
[02:10:11] [PASSED] rounding1
[02:10:11] [PASSED] rounding2
[02:10:11] [PASSED] rounding3
[02:10:11] [PASSED] rounding4
[02:10:11] =========== [PASSED] drm_test_check_plane_state ============
[02:10:11] =========== drm_test_check_invalid_plane_state  ============
[02:10:11] [PASSED] positioning_invalid
[02:10:11] [PASSED] upscaling_invalid
[02:10:11] [PASSED] downscaling_invalid
[02:10:11] ======= [PASSED] drm_test_check_invalid_plane_state ========
[02:10:11] ================ [PASSED] drm_plane_helper =================
[02:10:11] ============ drm_connector_helper_tv_get_modes  ============
[02:10:11] ====== drm_test_connector_helper_tv_get_modes_check  =======
[02:10:11] [PASSED] None
[02:10:11] [PASSED] PAL
[02:10:11] [PASSED] NTSC
[02:10:11] [PASSED] Both, NTSC Default
[02:10:11] [PASSED] Both, PAL Default
[02:10:11] [PASSED] Both, NTSC Default, with PAL on command-line
[02:10:11] [PASSED] Both, PAL Default, with NTSC on command-line
[02:10:11] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[02:10:11] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[02:10:11] ======================== drm_rect  =========================
[02:10:11] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[02:10:11] [PASSED] drm_test_rect_clip_scaled_not_clipped
[02:10:11] [PASSED] drm_test_rect_clip_scaled_clipped
[02:10:11] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[02:10:11] ================= drm_test_rect_intersect  =================
[02:10:11] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[02:10:11] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[02:10:11] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[02:10:11] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[02:10:11] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[02:10:11] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[02:10:11] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[02:10:11] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[02:10:11] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[02:10:11] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[02:10:11] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[02:10:11] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[02:10:11] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[02:10:11] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[02:10:11] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[02:10:11] ============= [PASSED] drm_test_rect_intersect =============
[02:10:11] ================ drm_test_rect_calc_hscale  ================
[02:10:11] [PASSED] normal use
[02:10:11] [PASSED] out of max range
[02:10:11] [PASSED] out of min range
[02:10:11] [PASSED] zero dst
[02:10:11] [PASSED] negative src
[02:10:11] [PASSED] negative dst
[02:10:11] ============ [PASSED] drm_test_rect_calc_hscale ============
[02:10:11] ================ drm_test_rect_calc_vscale  ================
[02:10:11] [PASSED] normal use
[02:10:11] [PASSED] out of max range
[02:10:11] [PASSED] out of min range
[02:10:11] [PASSED] zero dst
[02:10:11] [PASSED] negative src
[02:10:11] [PASSED] negative dst
[02:10:11] ============ [PASSED] drm_test_rect_calc_vscale ============
[02:10:11] ================== drm_test_rect_rotate  ===================
[02:10:11] [PASSED] reflect-x
[02:10:11] [PASSED] reflect-y
[02:10:11] [PASSED] rotate-0
[02:10:11] [PASSED] rotate-90
[02:10:11] [PASSED] rotate-180
[02:10:11] [PASSED] rotate-270
[02:10:11] ============== [PASSED] drm_test_rect_rotate ===============
[02:10:11] ================ drm_test_rect_rotate_inv  =================
[02:10:11] [PASSED] reflect-x
[02:10:11] [PASSED] reflect-y
[02:10:11] [PASSED] rotate-0
[02:10:11] [PASSED] rotate-90
[02:10:11] [PASSED] rotate-180
[02:10:11] [PASSED] rotate-270
[02:10:11] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[02:10:11] ==================== [PASSED] drm_rect =====================
[02:10:11] ======================== drm_exec  =========================
[02:10:11] [PASSED] sanitycheck
[02:10:11] [PASSED] test_lock
[02:10:11] [PASSED] test_lock_unlock
[02:10:11] [PASSED] test_duplicates
[02:10:11] [PASSED] test_prepare
[02:10:11] [PASSED] test_prepare_array
[02:10:11] [PASSED] test_multiple_loops
[02:10:11] ==================== [PASSED] drm_exec =====================
[02:10:11] ============================================================
[02:10:11] Testing complete. Ran 368 tests: passed: 368
[02:10:11] Elapsed time: 45.207s total, 1.682s configuring, 19.689s building, 23.782s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


