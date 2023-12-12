Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880F6C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 14:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFF010E5E5;
	Tue, 12 Dec 2023 14:24:33 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id F097C10E628;
 Tue, 12 Dec 2023 14:24:31 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id ECD1BAADE4;
 Tue, 12 Dec 2023 14:24:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_series_starting_with_=5B1/2=5D?=
 =?utf-8?q?_fixup!_drm/xe/uc=3A_Store_firmware_binary_in_system-memory_backe?=
 =?utf-8?q?d_BO?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Date: Tue, 12 Dec 2023 14:24:31 -0000
Message-ID: <170239107196.31293.5921717187747860591@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231212142045.22182-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231212142045.22182-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [1/2] fixup! drm/xe/uc: Store firmware binary in system-memory backed BO
URL   : https://patchwork.freedesktop.org/series/127688/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[14:23:20] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:23:24] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[14:23:45] Starting KUnit Kernel (1/1)...
[14:23:45] ============================================================
[14:23:45] ========================== lmtt  ===========================
[14:23:45] ======================== test_ops  =========================
[14:23:45] [PASSED] 2-level
[14:23:45] [PASSED] multi-level
[14:23:45] ==================== [PASSED] test_ops =====================
[14:23:45] ====================== [PASSED] lmtt =======================
[14:23:45] ========================== xe_bo  ==========================
[14:23:45] [SKIPPED] xe_ccs_migrate_kunit
[14:23:45] [SKIPPED] xe_bo_evict_kunit
[14:23:45] ===================== [SKIPPED] xe_bo ======================
[14:23:45] ======================= xe_dma_buf  ========================
[14:23:45] [SKIPPED] xe_dma_buf_kunit
[14:23:45] =================== [SKIPPED] xe_dma_buf ===================
[14:23:45] ======================= xe_migrate  ========================
[14:23:45] [SKIPPED] xe_migrate_sanity_kunit
[14:23:45] =================== [SKIPPED] xe_migrate ===================
[14:23:45] ========================= xe_mocs  =========================
[14:23:45] [SKIPPED] xe_live_mocs_kernel_kunit
[14:23:45] ==================== [SKIPPED] xe_mocs =====================
[14:23:45] ========================= xe_pci  ==========================
[14:23:45] [PASSED] xe_gmdid_graphics_ip
[14:23:45] [PASSED] xe_gmdid_media_ip
[14:23:45] ===================== [PASSED] xe_pci ======================
[14:23:45] ========================= xe_rtp  ==========================
[14:23:45] ================== xe_rtp_process_tests  ===================
[14:23:45] [PASSED] coalesce-same-reg
[14:23:45] [PASSED] no-match-no-add
[14:23:45] [PASSED] no-match-no-add-multiple-rules
[14:23:45] [PASSED] two-regs-two-entries
[14:23:45] [PASSED] clr-one-set-other
[14:23:45] [PASSED] set-field
[14:23:45] [PASSED] conflict-duplicate
[14:23:45] [PASSED] conflict-not-disjoint
[14:23:45] [PASSED] conflict-reg-type
[14:23:45] ============== [PASSED] xe_rtp_process_tests ===============
[14:23:45] ===================== [PASSED] xe_rtp ======================
[14:23:45] ========================== xe_wa  ==========================
[14:23:45] ======================== xe_wa_gt  =========================
[14:23:45] [PASSED] TIGERLAKE (B0)
[14:23:45] [PASSED] DG1 (A0)
[14:23:45] [PASSED] DG1 (B0)
[14:23:45] [PASSED] ALDERLAKE_S (A0)
[14:23:45] [PASSED] ALDERLAKE_S (B0)
[14:23:45] [PASSED] ALDERLAKE_S (C0)
[14:23:45] [PASSED] ALDERLAKE_S (D0)
[14:23:45] [PASSED] ALDERLAKE_P (A0)
[14:23:45] [PASSED] ALDERLAKE_P (B0)
[14:23:45] [PASSED] ALDERLAKE_P (C0)
[14:23:45] [PASSED] ALDERLAKE_S_RPLS (D0)
[14:23:45] [PASSED] ALDERLAKE_P_RPLU (E0)
[14:23:45] [PASSED] DG2_G10 (A0)
[14:23:45] [PASSED] DG2_G10 (A1)
[14:23:45] [PASSED] DG2_G10 (B0)
[14:23:45] [PASSED] DG2_G10 (C0)
[14:23:45] [PASSED] DG2_G11 (A0)
[14:23:45] [PASSED] DG2_G11 (B0)
[14:23:45] [PASSED] DG2_G11 (B1)
[14:23:45] [PASSED] DG2_G12 (A0)
[14:23:45] [PASSED] DG2_G12 (A1)
[14:23:45] [PASSED] PVC (B0)
[14:23:45] [PASSED] PVC (B1)
[14:23:45] [PASSED] PVC (C0)
[14:23:45] [PASSED] METEORLAKE (g:A0, m:A0)
[14:23:45] [PASSED] METEORLAKE (g:A0, m:A0)
[14:23:45] [PASSED] LUNARLAKE (g:A0, m:A0)
[14:23:45] [PASSED] LUNARLAKE (g:B0, m:A0)
[14:23:45] ==================== [PASSED] xe_wa_gt =====================
[14:23:45] ====================== [PASSED] xe_wa ======================
[14:23:45] ============================================================
[14:23:45] Testing complete. Ran 46 tests: passed: 41, skipped: 5
[14:23:45] Elapsed time: 24.901s total, 4.207s configuring, 20.524s building, 0.143s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[14:23:45] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:23:47] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[14:24:06] Starting KUnit Kernel (1/1)...
[14:24:06] ============================================================
[14:24:06] ================== drm_test_pick_cmdline  ==================
[14:24:06] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[14:24:06] =============== drm_test_pick_cmdline_named  ===============
[14:24:06] [PASSED] NTSC
[14:24:06] [PASSED] NTSC-J
[14:24:06] [PASSED] PAL
[14:24:06] [PASSED] PAL-M
[14:24:06] =========== [PASSED] drm_test_pick_cmdline_named ===========
[14:24:06] ============== [PASSED] drm_test_pick_cmdline ==============
[14:24:06] ======================== drm_buddy  ========================
[14:24:06] [PASSED] drm_test_buddy_alloc_limit
[14:24:06] [PASSED] drm_test_buddy_alloc_range
[14:24:06] [PASSED] drm_test_buddy_alloc_optimistic
[14:24:06] [PASSED] drm_test_buddy_alloc_pessimistic
[14:24:06] [PASSED] drm_test_buddy_alloc_smoke
[14:24:06] [PASSED] drm_test_buddy_alloc_pathological
[14:24:06] ==================== [PASSED] drm_buddy ====================
[14:24:06] =================== drm_cmdline_parser  ====================
[14:24:06] [PASSED] drm_test_cmdline_force_d_only
[14:24:06] [PASSED] drm_test_cmdline_force_D_only_dvi
[14:24:06] [PASSED] drm_test_cmdline_force_D_only_hdmi
[14:24:06] [PASSED] drm_test_cmdline_force_D_only_not_digital
[14:24:06] [PASSED] drm_test_cmdline_force_e_only
[14:24:06] [PASSED] drm_test_cmdline_res
[14:24:06] [PASSED] drm_test_cmdline_res_vesa
[14:24:06] [PASSED] drm_test_cmdline_res_vesa_rblank
[14:24:06] [PASSED] drm_test_cmdline_res_rblank
[14:24:06] [PASSED] drm_test_cmdline_res_bpp
[14:24:06] [PASSED] drm_test_cmdline_res_refresh
[14:24:06] [PASSED] drm_test_cmdline_res_bpp_refresh
[14:24:06] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[14:24:06] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[14:24:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[14:24:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[14:24:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[14:24:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[14:24:06] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[14:24:06] [PASSED] drm_test_cmdline_res_margins_force_on
[14:24:06] [PASSED] drm_test_cmdline_res_vesa_margins
[14:24:06] [PASSED] drm_test_cmdline_name
[14:24:06] [PASSED] drm_test_cmdline_name_bpp
[14:24:06] [PASSED] drm_test_cmdline_name_option
[14:24:06] [PASSED] drm_test_cmdline_name_bpp_option
[14:24:06] [PASSED] drm_test_cmdline_rotate_0
[14:24:06] [PASSED] drm_test_cmdline_rotate_90
[14:24:06] [PASSED] drm_test_cmdline_rotate_180
[14:24:06] [PASSED] drm_test_cmdline_rotate_270
[14:24:06] [PASSED] drm_test_cmdline_hmirror
[14:24:06] [PASSED] drm_test_cmdline_vmirror
[14:24:06] [PASSED] drm_test_cmdline_margin_options
[14:24:06] [PASSED] drm_test_cmdline_multiple_options
[14:24:06] [PASSED] drm_test_cmdline_bpp_extra_and_option
[14:24:06] [PASSED] drm_test_cmdline_extra_and_option
[14:24:06] [PASSED] drm_test_cmdline_freestanding_options
[14:24:06] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[14:24:06] [PASSED] drm_test_cmdline_panel_orientation
[14:24:06] ================ drm_test_cmdline_invalid  =================
[14:24:06] [PASSED] margin_only
[14:24:06] [PASSED] interlace_only
[14:24:06] [PASSED] res_missing_x
[14:24:06] [PASSED] res_missing_y
[14:24:06] [PASSED] res_bad_y
[14:24:06] [PASSED] res_missing_y_bpp
[14:24:06] [PASSED] res_bad_bpp
[14:24:06] [PASSED] res_bad_refresh
[14:24:06] [PASSED] res_bpp_refresh_force_on_off
[14:24:06] [PASSED] res_invalid_mode
[14:24:06] [PASSED] res_bpp_wrong_place_mode
[14:24:06] [PASSED] name_bpp_refresh
[14:24:06] [PASSED] name_refresh
[14:24:06] [PASSED] name_refresh_wrong_mode
[14:24:06] [PASSED] name_refresh_invalid_mode
[14:24:06] [PASSED] rotate_multiple
[14:24:06] [PASSED] rotate_invalid_val
[14:24:06] [PASSED] rotate_truncated
[14:24:06] [PASSED] invalid_option
[14:24:06] [PASSED] invalid_tv_option
[14:24:06] [PASSED] truncated_tv_option
[14:24:06] ============ [PASSED] drm_test_cmdline_invalid =============
[14:24:06] =============== drm_test_cmdline_tv_options  ===============
[14:24:06] [PASSED] NTSC
[14:24:06] [PASSED] NTSC_443
[14:24:06] [PASSED] NTSC_J
[14:24:06] [PASSED] PAL
[14:24:06] [PASSED] PAL_M
[14:24:06] [PASSED] PAL_N
[14:24:06] [PASSED] SECAM
[14:24:06] =========== [PASSED] drm_test_cmdline_tv_options ===========
[14:24:06] =============== [PASSED] drm_cmdline_parser ================
[14:24:06] ================ drm_get_tv_mode_from_name  ================
[14:24:06] ========== drm_test_get_tv_mode_from_name_valid  ===========
[14:24:06] [PASSED] NTSC
[14:24:06] [PASSED] NTSC-443
[14:24:06] [PASSED] NTSC-J
[14:24:06] [PASSED] PAL
[14:24:06] [PASSED] PAL-M
[14:24:06] [PASSED] PAL-N
[14:24:06] [PASSED] SECAM
[14:24:06] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[14:24:06] [PASSED] drm_test_get_tv_mode_from_name_truncated
[14:24:06] ============ [PASSED] drm_get_tv_mode_from_name ============
[14:24:06] ==================== drm_damage_helper  ====================
[14:24:06] [PASSED] drm_test_damage_iter_no_damage
[14:24:06] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[14:24:06] [PASSED] drm_test_damage_iter_no_damage_src_moved
[14:24:06] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[14:24:06] [PASSED] drm_test_damage_iter_no_damage_not_visible
[14:24:06] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[14:24:06] [PASSED] drm_test_damage_iter_no_damage_no_fb
[14:24:06] [PASSED] drm_test_damage_iter_simple_damage
[14:24:06] [PASSED] drm_test_damage_iter_single_damage
[14:24:06] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[14:24:06] [PASSED] drm_test_damage_iter_single_damage_outside_src
[14:24:06] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[14:24:06] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[14:24:06] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[14:24:06] [PASSED] drm_test_damage_iter_single_damage_src_moved
[14:24:06] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[14:24:06] [PASSED] drm_test_damage_iter_damage
[14:24:06] [PASSED] drm_test_damage_iter_damage_one_intersect
[14:24:06] [PASSED] drm_test_damage_iter_damage_one_outside
[14:24:06] [PASSED] drm_test_damage_iter_damage_src_moved
[14:24:06] [PASSED] drm_test_damage_iter_damage_not_visible
[14:24:06] ================ [PASSED] drm_damage_helper ================
[14:24:06] ==================== drm_dp_mst_helper  ====================
[14:24:06] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[14:24:06] [PASSED] Clock 154000 BPP 30 DSC disabled
[14:24:06] [PASSED] Clock 234000 BPP 30 DSC disabled
[14:24:06] [PASSED] Clock 297000 BPP 24 DSC disabled
[14:24:06] [PASSED] Clock 332880 BPP 24 DSC enabled
[14:24:06] [PASSED] Clock 324540 BPP 24 DSC enabled
[14:24:06] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[14:24:06] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[14:24:06] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[14:24:06] [PASSED] DP_POWER_UP_PHY with port number
[14:24:06] [PASSED] DP_POWER_DOWN_PHY with port number
[14:24:06] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[14:24:06] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[14:24:06] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[14:24:06] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[14:24:06] [PASSED] DP_QUERY_PAYLOAD with port number
[14:24:06] [PASSED] DP_QUERY_PAYLOAD with VCPI
[14:24:06] [PASSED] DP_REMOTE_DPCD_READ with port number
[14:24:06] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[14:24:06] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[14:24:06] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[14:24:06] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[14:24:06] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[14:24:06] [PASSED] DP_REMOTE_I2C_READ with port number
[14:24:06] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[14:24:06] [PASSED] DP_REMOTE_I2C_READ with transactions array
[14:24:06] [PASSED] DP_REMOTE_I2C_WRITE with port number
[14:24:06] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[14:24:06] [PASSED] DP_REMOTE_I2C_WRITE with data array
[14:24:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[14:24:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[14:24:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[14:24:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[14:24:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[14:24:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[14:24:06] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[14:24:06] ================ [PASSED] drm_dp_mst_helper ================
[14:24:06] ================= drm_format_helper_test  ==================
[14:24:06] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[14:24:06] [PASSED] single_pixel_source_buffer
[14:24:06] [PASSED] single_pixel_clip_rectangle
[14:24:06] [PASSED] well_known_colors
[14:24:06] [PASSED] destination_pitch
[14:24:06] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[14:24:06] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[14:24:06] [PASSED] single_pixel_source_buffer
[14:24:06] [PASSED] single_pixel_clip_rectangle
[14:24:06] [PASSED] well_known_colors
[14:24:06] [PASSED] destination_pitch
[14:24:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[14:24:06] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[14:24:06] [PASSED] single_pixel_source_buffer
[14:24:06] [PASSED] single_pixel_clip_rectangle
[14:24:06] [PASSED] well_known_colors
[14:24:06] [PASSED] destination_pitch
[14:24:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[14:24:06] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[14:24:06] [PASSED] single_pixel_source_buffer
[14:24:06] [PASSED] single_pixel_clip_rectangle
[14:24:06] [PASSED] well_known_colors
[14:24:06] [PASSED] destination_pitch
[14:24:06] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[14:24:06] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[14:24:06] [PASSED] single_pixel_source_buffer
[14:24:06] [PASSED] single_pixel_clip_rectangle
[14:24:06] [PASSED] well_known_colors
[14:24:06] [PASSED] destination_pitch
[14:24:06] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[14:24:06] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[14:24:06] [PASSED] single_pixel_source_buffer
[14:24:06] [PASSED] single_pixel_clip_rectangle
[14:24:06] [PASSED] well_known_colors
[14:24:06] [PASSED] destination_pitch
[14:24:06] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[14:24:06] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[14:24:06] [PASSED] single_pixel_source_buffer
[14:24:06] [PASSED] single_pixel_clip_rectangle
[14:24:06] [PASSED] well_known_colors
[14:24:06] [PASSED] destination_pitch
[14:24:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[14:24:06] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[14:24:06] [PASSED] single_pixel_source_buffer
[14:24:06] [PASSED] single_pixel_clip_rectangle
[14:24:06] [PASSED] well_known_colors
[14:24:06] [PASSED] destination_pitch
[14:24:06] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[14:24:06] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[14:24:06] [PASSED] single_pixel_source_buffer
[14:24:06] [PASSED] single_pixel_clip_rectangle
[14:24:06] [PASSED] well_known_colors
[14:24:06] [PASSED] destination_pitch
[14:24:06] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[14:24:06] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[14:24:06] [PASSED] single_pixel_source_buffer
[14:24:06] [PASSED] single_pixel_clip_rectangle
[14:24:06] [PASSED] well_known_colors
[14:24:06] [PASSED] destination_pitch
[14:24:06] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[14:24:06] ============== drm_test_fb_xrgb8888_to_mono  ===============
[14:24:06] [PASSED] single_pixel_source_buffer
[14:24:06] [PASSED] single_pixel_clip_rectangle
[14:24:06] [PASSED] well_known_colors
[14:24:06] [PASSED] destination_pitch
[14:24:06] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[14:24:06] ==================== drm_test_fb_swab  =====================
[14:24:06] [PASSED] single_pixel_source_buffer
[14:24:06] [PASSED] single_pixel_clip_rectangle
[14:24:06] [PASSED] well_known_colors
[14:24:06] [PASSED] destination_pitch
[14:24:06] ================ [PASSED] drm_test_fb_swab =================
[14:24:06] ================= drm_test_fb_clip_offset  =================
[14:24:06] [PASSED] pass through
[14:24:06] [PASSED] horizontal offset
[14:24:06] [PASSED] vertical offset
[14:24:06] [PASSED] horizontal and vertical offset
[14:24:06] [PASSED] horizontal offset (custom pitch)
[14:24:06] [PASSED] vertical offset (custom pitch)
[14:24:06] [PASSED] horizontal and vertical offset (custom pitch)
[14:24:06] ============= [PASSED] drm_test_fb_clip_offset =============
[14:24:06] ============== drm_test_fb_build_fourcc_list  ==============
[14:24:06] [PASSED] no native formats
[14:24:06] [PASSED] XRGB8888 as native format
[14:24:06] [PASSED] remove duplicates
[14:24:06] [PASSED] convert alpha formats
[14:24:06] [PASSED] random formats
[14:24:06] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[14:24:06] =================== drm_test_fb_memcpy  ====================
[14:24:06] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[14:24:06] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[14:24:06] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[14:24:06] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[14:24:06] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[14:24:06] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[14:24:06] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[14:24:06] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[14:24:06] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[14:24:06] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[14:24:06] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[14:24:06] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[14:24:06] =============== [PASSED] drm_test_fb_memcpy ================
[14:24:06] ============= [PASSED] drm_format_helper_test ==============
[14:24:06] ======================= drm_format  ========================
[14:24:06] [PASSED] drm_test_format_block_width_invalid
[14:24:06] [PASSED] drm_test_format_block_width_one_plane
[14:24:06] [PASSED] drm_test_format_block_width_two_plane
[14:24:06] [PASSED] drm_test_format_block_width_three_plane
[14:24:06] [PASSED] drm_test_format_block_width_tiled
[14:24:06] [PASSED] drm_test_format_block_height_invalid
[14:24:06] [PASSED] drm_test_format_block_height_one_plane
[14:24:06] [PASSED] drm_test_format_block_height_two_plane
[14:24:06] [PASSED] drm_test_format_block_height_three_plane
[14:24:06] [PASSED] drm_test_format_block_height_tiled
[14:24:06] [PASSED] drm_test_format_min_pitch_invalid
[14:24:06] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[14:24:06] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[14:24:06] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[14:24:06] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[14:24:06] [PASSED] drm_test_format_min_pitch_two_plane
[14:24:06] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[14:24:06] [PASSED] drm_test_format_min_pitch_tiled
[14:24:06] =================== [PASSED] drm_format ====================
[14:24:06] ===================== drm_framebuffer  =====================
[14:24:06] =============== drm_test_framebuffer_create  ===============
[14:24:06] [PASSED] ABGR8888 normal sizes
[14:24:06] [PASSED] ABGR8888 max sizes
[14:24:06] [PASSED] ABGR8888 pitch greater than min required
[14:24:06] [PASSED] ABGR8888 pitch less than min required
[14:24:06] [PASSED] ABGR8888 Invalid width
[14:24:06] [PASSED] ABGR8888 Invalid buffer handle
[14:24:06] [PASSED] No pixel format
[14:24:06] [PASSED] ABGR8888 Width 0
[14:24:06] [PASSED] ABGR8888 Height 0
[14:24:06] [PASSED] ABGR8888 Out of bound height * pitch combination
[14:24:06] [PASSED] ABGR8888 Large buffer offset
[14:24:06] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[14:24:06] [PASSED] ABGR8888 Valid buffer modifier
[14:24:06] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[14:24:06] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[14:24:06] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[14:24:06] [PASSED] NV12 Normal sizes
[14:24:06] [PASSED] NV12 Max sizes
[14:24:06] [PASSED] NV12 Invalid pitch
[14:24:06] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[14:24:06] [PASSED] NV12 different  modifier per-plane
[14:24:06] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[14:24:06] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[14:24:06] [PASSED] NV12 Modifier for inexistent plane
[14:24:06] [PASSED] NV12 Handle for inexistent plane
[14:24:06] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[14:24:06] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[14:24:06] [PASSED] YVU420 Normal sizes
[14:24:06] [PASSED] YVU420 Max sizes
[14:24:06] [PASSED] YVU420 Invalid pitch
[14:24:06] [PASSED] YVU420 Different pitches
[14:24:06] [PASSED] YVU420 Different buffer offsets/pitches
[14:24:06] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[14:24:06] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[14:24:06] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[14:24:06] [PASSED] YVU420 Valid modifier
[14:24:06] [PASSED] YVU420 Different modifiers per plane
[14:24:06] [PASSED] YVU420 Modifier for inexistent plane
[14:24:06] [PASSED] X0L2 Normal sizes
[14:24:06] [PASSED] X0L2 Max sizes
[14:24:06] [PASSED] X0L2 Invalid pitch
[14:24:06] [PASSED] X0L2 Pitch greater than minimum required
[14:24:06] [PASSED] X0L2 Handle for inexistent plane
[14:24:06] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[14:24:06] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[14:24:06] [PASSED] X0L2 Valid modifier
[14:24:06] [PASSED] X0L2 Modifier for inexistent plane
[14:24:06] =========== [PASSED] drm_test_framebuffer_create ===========
[14:24:06] ================= [PASSED] drm_framebuffer =================
[14:24:06] ==================== drm-test-managed  =====================
[14:24:06] [PASSED] drm_test_managed_run_action
[14:24:06] ================ [PASSED] drm-test-managed =================
[14:24:06] ========================= drm_mm  ==========================
[14:24:06] [PASSED] drm_test_mm_init
[14:24:06] [PASSED] drm_test_mm_debug
[14:24:16] [PASSED] drm_test_mm_reserve
[14:24:27] [PASSED] drm_test_mm_insert
[14:24:28] [PASSED] drm_test_mm_replace
[14:24:28] [PASSED] drm_test_mm_insert_range
[14:24:28] [PASSED] drm_test_mm_frag
[14:24:28] [PASSED] drm_test_mm_align
[14:24:28] [PASSED] drm_test_mm_align32
[14:24:28] [PASSED] drm_test_mm_align64
[14:24:28] [PASSED] drm_test_mm_evict
[14:24:28] [PASSED] drm_test_mm_evict_range
[14:24:28] [PASSED] drm_test_mm_topdown
[14:24:28] [PASSED] drm_test_mm_bottomup
[14:24:28] [PASSED] drm_test_mm_lowest
[14:24:28] [PASSED] drm_test_mm_highest
[14:24:29] [PASSED] drm_test_mm_color
[14:24:30] [PASSED] drm_test_mm_color_evict
[14:24:30] [PASSED] drm_test_mm_color_evict_range
[14:24:30] ===================== [PASSED] drm_mm ======================
[14:24:30] =================== drm_modes_analog_tv  ===================
[14:24:30] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[14:24:30] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[14:24:30] [PASSED] drm_test_modes_analog_tv_pal_576i
[14:24:30] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[14:24:30] =============== [PASSED] drm_modes_analog_tv ===============
[14:24:30] ==================== drm_plane_helper  =====================
[14:24:30] =============== drm_test_check_plane_state  ================
[14:24:30] [PASSED] clipping_simple
[14:24:30] [PASSED] clipping_rotate_reflect
[14:24:30] [PASSED] positioning_simple
[14:24:30] [PASSED] upscaling
[14:24:30] [PASSED] downscaling
[14:24:30] [PASSED] rounding1
[14:24:30] [PASSED] rounding2
[14:24:30] [PASSED] rounding3
[14:24:30] [PASSED] rounding4
[14:24:30] =========== [PASSED] drm_test_check_plane_state ============
[14:24:30] =========== drm_test_check_invalid_plane_state  ============
[14:24:30] [PASSED] positioning_invalid
[14:24:30] [PASSED] upscaling_invalid
[14:24:30] [PASSED] downscaling_invalid
[14:24:30] ======= [PASSED] drm_test_check_invalid_plane_state ========
[14:24:30] ================ [PASSED] drm_plane_helper =================
[14:24:30] ============ drm_connector_helper_tv_get_modes  ============
[14:24:30] ====== drm_test_connector_helper_tv_get_modes_check  =======
[14:24:30] [PASSED] None
[14:24:30] [PASSED] PAL
[14:24:30] [PASSED] NTSC
[14:24:30] [PASSED] Both, NTSC Default
[14:24:30] [PASSED] Both, PAL Default
[14:24:30] [PASSED] Both, NTSC Default, with PAL on command-line
[14:24:30] [PASSED] Both, PAL Default, with NTSC on command-line
[14:24:30] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[14:24:30] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[14:24:30] ======================== drm_rect  =========================
[14:24:30] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[14:24:30] [PASSED] drm_test_rect_clip_scaled_not_clipped
[14:24:30] [PASSED] drm_test_rect_clip_scaled_clipped
[14:24:30] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[14:24:30] ================= drm_test_rect_intersect  =================
[14:24:30] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[14:24:30] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[14:24:30] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[14:24:30] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[14:24:30] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[14:24:30] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[14:24:30] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[14:24:30] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[14:24:30] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[14:24:30] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[14:24:30] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[14:24:30] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[14:24:30] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[14:24:30] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[14:24:30] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[14:24:30] ============= [PASSED] drm_test_rect_intersect =============
[14:24:30] ================ drm_test_rect_calc_hscale  ================
[14:24:30] [PASSED] normal use
[14:24:30] [PASSED] out of max range
[14:24:30] [PASSED] out of min range
[14:24:30] [PASSED] zero dst
[14:24:30] [PASSED] negative src
[14:24:30] [PASSED] negative dst
[14:24:30] ============ [PASSED] drm_test_rect_calc_hscale ============
[14:24:30] ================ drm_test_rect_calc_vscale  ================
[14:24:30] [PASSED] normal use
[14:24:30] [PASSED] out of max range
[14:24:30] [PASSED] out of min range
[14:24:30] [PASSED] zero dst
[14:24:30] [PASSED] negative src
[14:24:30] [PASSED] negative dst
[14:24:30] ============ [PASSED] drm_test_rect_calc_vscale ============
[14:24:30] ================== drm_test_rect_rotate  ===================
[14:24:30] [PASSED] reflect-x
[14:24:30] [PASSED] reflect-y
[14:24:30] [PASSED] rotate-0
[14:24:30] [PASSED] rotate-90
[14:24:30] [PASSED] rotate-180
[14:24:30] [PASSED] rotate-270
[14:24:30] ============== [PASSED] drm_test_rect_rotate ===============
[14:24:30] ================ drm_test_rect_rotate_inv  =================
[14:24:30] [PASSED] reflect-x
[14:24:30] [PASSED] reflect-y
[14:24:30] [PASSED] rotate-0
[14:24:30] [PASSED] rotate-90
[14:24:30] [PASSED] rotate-180
[14:24:30] [PASSED] rotate-270
[14:24:30] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[14:24:30] ==================== [PASSED] drm_rect =====================
[14:24:30] ======================== drm_exec  =========================
[14:24:30] [PASSED] sanitycheck
[14:24:30] [PASSED] test_lock
[14:24:30] [PASSED] test_lock_unlock
[14:24:30] [PASSED] test_duplicates
[14:24:30] [PASSED] test_prepare
[14:24:30] [PASSED] test_prepare_array
[14:24:30] [PASSED] test_multiple_loops
[14:24:30] ==================== [PASSED] drm_exec =====================
[14:24:30] ============================================================
[14:24:30] Testing complete. Ran 368 tests: passed: 368
[14:24:30] Elapsed time: 44.767s total, 1.663s configuring, 19.321s building, 23.763s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


