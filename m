Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BACC46CA2
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 18:04:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D1310E08A;
	Mon, 18 Dec 2023 18:04:52 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E5EC110E08A;
 Mon, 18 Dec 2023 18:04:50 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E1EA1AADD6;
 Mon, 18 Dec 2023 18:04:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/guc=3A_Use_FAST=5FREQUE?=
 =?utf-8?q?ST_for_non-blocking_H2G_messages_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Mon, 18 Dec 2023 18:04:50 -0000
Message-ID: <170292269092.12106.16409267378016949224@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231206211441.3092072-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231206211441.3092072-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe/guc: Use FAST_REQUEST for non-blocking H2G messages (rev4)
URL   : https://patchwork.freedesktop.org/series/126495/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[18:04:01] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:04:05] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[18:04:26] Starting KUnit Kernel (1/1)...
[18:04:26] ============================================================
[18:04:26] ========================== lmtt  ===========================
[18:04:26] ======================== test_ops  =========================
[18:04:26] [PASSED] 2-level
[18:04:26] [PASSED] multi-level
[18:04:26] ==================== [PASSED] test_ops =====================
[18:04:26] ====================== [PASSED] lmtt =======================
[18:04:26] ========================== xe_bo  ==========================
[18:04:26] [SKIPPED] xe_ccs_migrate_kunit
[18:04:26] [SKIPPED] xe_bo_evict_kunit
[18:04:26] ===================== [SKIPPED] xe_bo ======================
[18:04:26] ======================= xe_dma_buf  ========================
[18:04:26] [SKIPPED] xe_dma_buf_kunit
[18:04:26] =================== [SKIPPED] xe_dma_buf ===================
[18:04:26] ======================= xe_migrate  ========================
[18:04:26] [SKIPPED] xe_migrate_sanity_kunit
[18:04:26] =================== [SKIPPED] xe_migrate ===================
[18:04:26] ========================= xe_mocs  =========================
[18:04:26] [SKIPPED] xe_live_mocs_kernel_kunit
[18:04:26] ==================== [SKIPPED] xe_mocs =====================
[18:04:26] ========================= xe_pci  ==========================
[18:04:26] [PASSED] xe_gmdid_graphics_ip
[18:04:26] [PASSED] xe_gmdid_media_ip
[18:04:26] ===================== [PASSED] xe_pci ======================
[18:04:26] ========================= xe_rtp  ==========================
[18:04:26] ================== xe_rtp_process_tests  ===================
[18:04:26] [PASSED] coalesce-same-reg
[18:04:26] [PASSED] no-match-no-add
[18:04:26] [PASSED] no-match-no-add-multiple-rules
[18:04:26] [PASSED] two-regs-two-entries
[18:04:26] [PASSED] clr-one-set-other
[18:04:26] [PASSED] set-field
[18:04:26] [PASSED] conflict-duplicate
[18:04:26] [PASSED] conflict-not-disjoint
[18:04:26] [PASSED] conflict-reg-type
[18:04:26] ============== [PASSED] xe_rtp_process_tests ===============
[18:04:26] ===================== [PASSED] xe_rtp ======================
[18:04:26] ========================== xe_wa  ==========================
[18:04:26] ======================== xe_wa_gt  =========================
[18:04:26] [PASSED] TIGERLAKE (B0)
[18:04:26] [PASSED] DG1 (A0)
[18:04:26] [PASSED] DG1 (B0)
[18:04:26] [PASSED] ALDERLAKE_S (A0)
[18:04:26] [PASSED] ALDERLAKE_S (B0)
[18:04:26] [PASSED] ALDERLAKE_S (C0)
[18:04:26] [PASSED] ALDERLAKE_S (D0)
[18:04:26] [PASSED] ALDERLAKE_P (A0)
[18:04:26] [PASSED] ALDERLAKE_P (B0)
[18:04:26] [PASSED] ALDERLAKE_P (C0)
[18:04:26] [PASSED] ALDERLAKE_S_RPLS (D0)
[18:04:26] [PASSED] ALDERLAKE_P_RPLU (E0)
[18:04:26] [PASSED] DG2_G10 (A0)
[18:04:26] [PASSED] DG2_G10 (A1)
[18:04:26] [PASSED] DG2_G10 (B0)
[18:04:26] [PASSED] DG2_G10 (C0)
[18:04:26] [PASSED] DG2_G11 (A0)
[18:04:26] [PASSED] DG2_G11 (B0)
[18:04:26] [PASSED] DG2_G11 (B1)
[18:04:26] [PASSED] DG2_G12 (A0)
[18:04:26] [PASSED] DG2_G12 (A1)
[18:04:26] [PASSED] PVC (B0)
[18:04:26] [PASSED] PVC (B1)
[18:04:26] [PASSED] PVC (C0)
[18:04:26] [PASSED] METEORLAKE (g:A0, m:A0)
[18:04:26] [PASSED] METEORLAKE (g:A0, m:A0)
[18:04:26] [PASSED] LUNARLAKE (g:A0, m:A0)
[18:04:26] [PASSED] LUNARLAKE (g:B0, m:A0)
[18:04:26] ==================== [PASSED] xe_wa_gt =====================
[18:04:26] ====================== [PASSED] xe_wa ======================
[18:04:26] ============================================================
[18:04:26] Testing complete. Ran 46 tests: passed: 41, skipped: 5
[18:04:26] Elapsed time: 24.991s total, 4.222s configuring, 20.650s building, 0.100s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[18:04:26] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:04:28] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[18:04:47] Starting KUnit Kernel (1/1)...
[18:04:47] ============================================================
[18:04:47] ================== drm_test_pick_cmdline  ==================
[18:04:47] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[18:04:47] =============== drm_test_pick_cmdline_named  ===============
[18:04:47] [PASSED] NTSC
[18:04:47] [PASSED] NTSC-J
[18:04:47] [PASSED] PAL
[18:04:47] [PASSED] PAL-M
[18:04:47] =========== [PASSED] drm_test_pick_cmdline_named ===========
[18:04:47] ============== [PASSED] drm_test_pick_cmdline ==============
[18:04:47] ======================== drm_buddy  ========================
[18:04:47] [PASSED] drm_test_buddy_alloc_limit
[18:04:47] [PASSED] drm_test_buddy_alloc_optimistic
[18:04:47] [PASSED] drm_test_buddy_alloc_pessimistic
[18:04:47] [PASSED] drm_test_buddy_alloc_pathological
[18:04:47] ==================== [PASSED] drm_buddy ====================
[18:04:47] =================== drm_cmdline_parser  ====================
[18:04:47] [PASSED] drm_test_cmdline_force_d_only
[18:04:47] [PASSED] drm_test_cmdline_force_D_only_dvi
[18:04:47] [PASSED] drm_test_cmdline_force_D_only_hdmi
[18:04:47] [PASSED] drm_test_cmdline_force_D_only_not_digital
[18:04:47] [PASSED] drm_test_cmdline_force_e_only
[18:04:47] [PASSED] drm_test_cmdline_res
[18:04:47] [PASSED] drm_test_cmdline_res_vesa
[18:04:47] [PASSED] drm_test_cmdline_res_vesa_rblank
[18:04:47] [PASSED] drm_test_cmdline_res_rblank
[18:04:47] [PASSED] drm_test_cmdline_res_bpp
[18:04:47] [PASSED] drm_test_cmdline_res_refresh
[18:04:47] [PASSED] drm_test_cmdline_res_bpp_refresh
[18:04:47] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[18:04:47] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[18:04:47] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[18:04:47] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[18:04:47] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[18:04:47] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[18:04:47] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[18:04:47] [PASSED] drm_test_cmdline_res_margins_force_on
[18:04:47] [PASSED] drm_test_cmdline_res_vesa_margins
[18:04:47] [PASSED] drm_test_cmdline_name
[18:04:47] [PASSED] drm_test_cmdline_name_bpp
[18:04:47] [PASSED] drm_test_cmdline_name_option
[18:04:47] [PASSED] drm_test_cmdline_name_bpp_option
[18:04:47] [PASSED] drm_test_cmdline_rotate_0
[18:04:47] [PASSED] drm_test_cmdline_rotate_90
[18:04:47] [PASSED] drm_test_cmdline_rotate_180
[18:04:47] [PASSED] drm_test_cmdline_rotate_270
[18:04:47] [PASSED] drm_test_cmdline_hmirror
[18:04:47] [PASSED] drm_test_cmdline_vmirror
[18:04:47] [PASSED] drm_test_cmdline_margin_options
[18:04:47] [PASSED] drm_test_cmdline_multiple_options
[18:04:47] [PASSED] drm_test_cmdline_bpp_extra_and_option
[18:04:47] [PASSED] drm_test_cmdline_extra_and_option
[18:04:47] [PASSED] drm_test_cmdline_freestanding_options
[18:04:47] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[18:04:47] [PASSED] drm_test_cmdline_panel_orientation
[18:04:47] ================ drm_test_cmdline_invalid  =================
[18:04:47] [PASSED] margin_only
[18:04:47] [PASSED] interlace_only
[18:04:47] [PASSED] res_missing_x
[18:04:47] [PASSED] res_missing_y
[18:04:47] [PASSED] res_bad_y
[18:04:47] [PASSED] res_missing_y_bpp
[18:04:47] [PASSED] res_bad_bpp
[18:04:47] [PASSED] res_bad_refresh
[18:04:47] [PASSED] res_bpp_refresh_force_on_off
[18:04:47] [PASSED] res_invalid_mode
[18:04:47] [PASSED] res_bpp_wrong_place_mode
[18:04:47] [PASSED] name_bpp_refresh
[18:04:47] [PASSED] name_refresh
[18:04:47] [PASSED] name_refresh_wrong_mode
[18:04:47] [PASSED] name_refresh_invalid_mode
[18:04:47] [PASSED] rotate_multiple
[18:04:47] [PASSED] rotate_invalid_val
[18:04:47] [PASSED] rotate_truncated
[18:04:47] [PASSED] invalid_option
[18:04:47] [PASSED] invalid_tv_option
[18:04:47] [PASSED] truncated_tv_option
[18:04:47] ============ [PASSED] drm_test_cmdline_invalid =============
[18:04:47] =============== drm_test_cmdline_tv_options  ===============
[18:04:47] [PASSED] NTSC
[18:04:47] [PASSED] NTSC_443
[18:04:47] [PASSED] NTSC_J
[18:04:47] [PASSED] PAL
[18:04:47] [PASSED] PAL_M
[18:04:47] [PASSED] PAL_N
[18:04:47] [PASSED] SECAM
[18:04:47] =========== [PASSED] drm_test_cmdline_tv_options ===========
[18:04:47] =============== [PASSED] drm_cmdline_parser ================
[18:04:47] ================ drm_get_tv_mode_from_name  ================
[18:04:47] ========== drm_test_get_tv_mode_from_name_valid  ===========
[18:04:47] [PASSED] NTSC
[18:04:47] [PASSED] NTSC-443
[18:04:47] [PASSED] NTSC-J
[18:04:47] [PASSED] PAL
[18:04:47] [PASSED] PAL-M
[18:04:47] [PASSED] PAL-N
[18:04:47] [PASSED] SECAM
[18:04:47] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[18:04:47] [PASSED] drm_test_get_tv_mode_from_name_truncated
[18:04:47] ============ [PASSED] drm_get_tv_mode_from_name ============
[18:04:47] ==================== drm_damage_helper  ====================
[18:04:47] [PASSED] drm_test_damage_iter_no_damage
[18:04:47] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[18:04:47] [PASSED] drm_test_damage_iter_no_damage_src_moved
[18:04:47] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[18:04:47] [PASSED] drm_test_damage_iter_no_damage_not_visible
[18:04:47] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[18:04:47] [PASSED] drm_test_damage_iter_no_damage_no_fb
[18:04:47] [PASSED] drm_test_damage_iter_simple_damage
[18:04:47] [PASSED] drm_test_damage_iter_single_damage
[18:04:47] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[18:04:47] [PASSED] drm_test_damage_iter_single_damage_outside_src
[18:04:47] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[18:04:47] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[18:04:47] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[18:04:47] [PASSED] drm_test_damage_iter_single_damage_src_moved
[18:04:47] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[18:04:47] [PASSED] drm_test_damage_iter_damage
[18:04:47] [PASSED] drm_test_damage_iter_damage_one_intersect
[18:04:47] [PASSED] drm_test_damage_iter_damage_one_outside
[18:04:47] [PASSED] drm_test_damage_iter_damage_src_moved
[18:04:47] [PASSED] drm_test_damage_iter_damage_not_visible
[18:04:47] ================ [PASSED] drm_damage_helper ================
[18:04:47] ==================== drm_dp_mst_helper  ====================
[18:04:47] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[18:04:47] [PASSED] Clock 154000 BPP 30 DSC disabled
[18:04:47] [PASSED] Clock 234000 BPP 30 DSC disabled
[18:04:47] [PASSED] Clock 297000 BPP 24 DSC disabled
[18:04:47] [PASSED] Clock 332880 BPP 24 DSC enabled
[18:04:47] [PASSED] Clock 324540 BPP 24 DSC enabled
[18:04:47] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[18:04:47] ============== drm_test_dp_mst_calc_pbn_div  ===============
[18:04:47] [PASSED] Link rate 2000000 lane count 4
[18:04:47] [PASSED] Link rate 2000000 lane count 2
[18:04:47] [PASSED] Link rate 2000000 lane count 1
[18:04:47] [PASSED] Link rate 1350000 lane count 4
[18:04:47] [PASSED] Link rate 1350000 lane count 2
[18:04:47] [PASSED] Link rate 1350000 lane count 1
[18:04:47] [PASSED] Link rate 1000000 lane count 4
[18:04:47] [PASSED] Link rate 1000000 lane count 2
[18:04:47] [PASSED] Link rate 1000000 lane count 1
[18:04:47] [PASSED] Link rate 810000 lane count 4
[18:04:47] [PASSED] Link rate 810000 lane count 2
[18:04:47] [PASSED] Link rate 810000 lane count 1
[18:04:47] [PASSED] Link rate 540000 lane count 4
[18:04:47] [PASSED] Link rate 540000 lane count 2
[18:04:47] [PASSED] Link rate 540000 lane count 1
[18:04:47] [PASSED] Link rate 270000 lane count 4
[18:04:47] [PASSED] Link rate 270000 lane count 2
[18:04:47] [PASSED] Link rate 270000 lane count 1
[18:04:47] [PASSED] Link rate 162000 lane count 4
[18:04:47] [PASSED] Link rate 162000 lane count 2
[18:04:47] [PASSED] Link rate 162000 lane count 1
[18:04:47] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[18:04:47] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[18:04:47] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[18:04:47] [PASSED] DP_POWER_UP_PHY with port number
[18:04:47] [PASSED] DP_POWER_DOWN_PHY with port number
[18:04:47] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[18:04:47] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[18:04:47] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[18:04:47] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[18:04:47] [PASSED] DP_QUERY_PAYLOAD with port number
[18:04:47] [PASSED] DP_QUERY_PAYLOAD with VCPI
[18:04:47] [PASSED] DP_REMOTE_DPCD_READ with port number
[18:04:47] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[18:04:47] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[18:04:47] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[18:04:47] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[18:04:47] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[18:04:47] [PASSED] DP_REMOTE_I2C_READ with port number
[18:04:47] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[18:04:47] [PASSED] DP_REMOTE_I2C_READ with transactions array
[18:04:47] [PASSED] DP_REMOTE_I2C_WRITE with port number
[18:04:47] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[18:04:47] [PASSED] DP_REMOTE_I2C_WRITE with data array
[18:04:47] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[18:04:47] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[18:04:47] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[18:04:47] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[18:04:47] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[18:04:47] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[18:04:47] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[18:04:47] ================ [PASSED] drm_dp_mst_helper ================
[18:04:47] ======================== drm_exec  =========================
[18:04:47] [PASSED] sanitycheck
[18:04:47] [PASSED] test_lock
[18:04:47] [PASSED] test_lock_unlock
[18:04:47] [PASSED] test_duplicates
[18:04:47] [PASSED] test_prepare
[18:04:47] [PASSED] test_prepare_array
[18:04:47] [PASSED] test_multiple_loops
[18:04:47] ==================== [PASSED] drm_exec =====================
[18:04:47] ================= drm_format_helper_test  ==================
[18:04:47] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[18:04:47] [PASSED] single_pixel_source_buffer
[18:04:47] [PASSED] single_pixel_clip_rectangle
[18:04:47] [PASSED] well_known_colors
[18:04:47] [PASSED] destination_pitch
[18:04:47] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[18:04:47] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[18:04:47] [PASSED] single_pixel_source_buffer
[18:04:47] [PASSED] single_pixel_clip_rectangle
[18:04:47] [PASSED] well_known_colors
[18:04:47] [PASSED] destination_pitch
[18:04:47] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[18:04:47] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[18:04:47] [PASSED] single_pixel_source_buffer
[18:04:47] [PASSED] single_pixel_clip_rectangle
[18:04:47] [PASSED] well_known_colors
[18:04:47] [PASSED] destination_pitch
[18:04:47] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[18:04:47] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[18:04:47] [PASSED] single_pixel_source_buffer
[18:04:47] [PASSED] single_pixel_clip_rectangle
[18:04:47] [PASSED] well_known_colors
[18:04:47] [PASSED] destination_pitch
[18:04:47] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[18:04:47] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[18:04:47] [PASSED] single_pixel_source_buffer
[18:04:47] [PASSED] single_pixel_clip_rectangle
[18:04:47] [PASSED] well_known_colors
[18:04:47] [PASSED] destination_pitch
[18:04:47] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[18:04:47] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[18:04:47] [PASSED] single_pixel_source_buffer
[18:04:47] [PASSED] single_pixel_clip_rectangle
[18:04:47] [PASSED] well_known_colors
[18:04:47] [PASSED] destination_pitch
[18:04:47] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[18:04:47] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[18:04:47] [PASSED] single_pixel_source_buffer
[18:04:47] [PASSED] single_pixel_clip_rectangle
[18:04:47] [PASSED] well_known_colors
[18:04:47] [PASSED] destination_pitch
[18:04:47] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[18:04:47] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[18:04:47] [PASSED] single_pixel_source_buffer
[18:04:47] [PASSED] single_pixel_clip_rectangle
[18:04:47] [PASSED] well_known_colors
[18:04:47] [PASSED] destination_pitch
[18:04:47] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[18:04:47] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[18:04:47] [PASSED] single_pixel_source_buffer
[18:04:47] [PASSED] single_pixel_clip_rectangle
[18:04:47] [PASSED] well_known_colors
[18:04:47] [PASSED] destination_pitch
[18:04:47] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[18:04:47] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[18:04:47] [PASSED] single_pixel_source_buffer
[18:04:47] [PASSED] single_pixel_clip_rectangle
[18:04:47] [PASSED] well_known_colors
[18:04:47] [PASSED] destination_pitch
[18:04:47] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[18:04:47] ============== drm_test_fb_xrgb8888_to_mono  ===============
[18:04:47] [PASSED] single_pixel_source_buffer
[18:04:47] [PASSED] single_pixel_clip_rectangle
[18:04:47] [PASSED] well_known_colors
[18:04:47] [PASSED] destination_pitch
[18:04:47] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[18:04:47] ==================== drm_test_fb_swab  =====================
[18:04:47] [PASSED] single_pixel_source_buffer
[18:04:47] [PASSED] single_pixel_clip_rectangle
[18:04:47] [PASSED] well_known_colors
[18:04:47] [PASSED] destination_pitch
[18:04:47] ================ [PASSED] drm_test_fb_swab =================
[18:04:47] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[18:04:47] [PASSED] single_pixel_source_buffer
[18:04:47] [PASSED] single_pixel_clip_rectangle
[18:04:47] [PASSED] well_known_colors
[18:04:47] [PASSED] destination_pitch
[18:04:47] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[18:04:47] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[18:04:47] [PASSED] single_pixel_source_buffer
[18:04:47] [PASSED] single_pixel_clip_rectangle
[18:04:47] [PASSED] well_known_colors
[18:04:47] [PASSED] destination_pitch
[18:04:47] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[18:04:47] ================= drm_test_fb_clip_offset  =================
[18:04:47] [PASSED] pass through
[18:04:47] [PASSED] horizontal offset
[18:04:47] [PASSED] vertical offset
[18:04:47] [PASSED] horizontal and vertical offset
[18:04:47] [PASSED] horizontal offset (custom pitch)
[18:04:47] [PASSED] vertical offset (custom pitch)
[18:04:47] [PASSED] horizontal and vertical offset (custom pitch)
[18:04:47] ============= [PASSED] drm_test_fb_clip_offset =============
[18:04:47] ============== drm_test_fb_build_fourcc_list  ==============
[18:04:47] [PASSED] no native formats
[18:04:47] [PASSED] XRGB8888 as native format
[18:04:47] [PASSED] remove duplicates
[18:04:47] [PASSED] convert alpha formats
[18:04:47] [PASSED] random formats
[18:04:47] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[18:04:47] =================== drm_test_fb_memcpy  ====================
[18:04:47] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[18:04:47] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[18:04:47] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[18:04:47] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[18:04:47] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[18:04:47] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[18:04:47] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[18:04:47] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[18:04:47] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[18:04:47] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[18:04:47] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[18:04:47] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[18:04:47] =============== [PASSED] drm_test_fb_memcpy ================
[18:04:47] ============= [PASSED] drm_format_helper_test ==============
[18:04:47] ======================= drm_format  ========================
[18:04:47] [PASSED] drm_test_format_block_width_invalid
[18:04:47] [PASSED] drm_test_format_block_width_one_plane
[18:04:47] [PASSED] drm_test_format_block_width_two_plane
[18:04:47] [PASSED] drm_test_format_block_width_three_plane
[18:04:47] [PASSED] drm_test_format_block_width_tiled
[18:04:47] [PASSED] drm_test_format_block_height_invalid
[18:04:47] [PASSED] drm_test_format_block_height_one_plane
[18:04:47] [PASSED] drm_test_format_block_height_two_plane
[18:04:47] [PASSED] drm_test_format_block_height_three_plane
[18:04:47] [PASSED] drm_test_format_block_height_tiled
[18:04:47] [PASSED] drm_test_format_min_pitch_invalid
[18:04:47] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[18:04:47] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[18:04:47] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[18:04:47] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[18:04:47] [PASSED] drm_test_format_min_pitch_two_plane
[18:04:47] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[18:04:47] [PASSED] drm_test_format_min_pitch_tiled
[18:04:47] =================== [PASSED] drm_format ====================
[18:04:47] ===================== drm_framebuffer  =====================
[18:04:47] =============== drm_test_framebuffer_create  ===============
[18:04:47] [PASSED] ABGR8888 normal sizes
[18:04:47] [PASSED] ABGR8888 max sizes
[18:04:47] [PASSED] ABGR8888 pitch greater than min required
[18:04:47] [PASSED] ABGR8888 pitch less than min required
[18:04:47] [PASSED] ABGR8888 Invalid width
[18:04:47] [PASSED] ABGR8888 Invalid buffer handle
[18:04:47] [PASSED] No pixel format
[18:04:47] [PASSED] ABGR8888 Width 0
[18:04:47] [PASSED] ABGR8888 Height 0
[18:04:47] [PASSED] ABGR8888 Out of bound height * pitch combination
[18:04:47] [PASSED] ABGR8888 Large buffer offset
[18:04:47] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[18:04:47] [PASSED] ABGR8888 Valid buffer modifier
[18:04:47] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[18:04:47] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[18:04:47] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[18:04:47] [PASSED] NV12 Normal sizes
[18:04:47] [PASSED] NV12 Max sizes
[18:04:47] [PASSED] NV12 Invalid pitch
[18:04:47] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[18:04:47] [PASSED] NV12 different  modifier per-plane
[18:04:47] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[18:04:47] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[18:04:47] [PASSED] NV12 Modifier for inexistent plane
[18:04:47] [PASSED] NV12 Handle for inexistent plane
[18:04:47] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[18:04:47] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[18:04:47] [PASSED] YVU420 Normal sizes
[18:04:47] [PASSED] YVU420 Max sizes
[18:04:47] [PASSED] YVU420 Invalid pitch
[18:04:47] [PASSED] YVU420 Different pitches
[18:04:47] [PASSED] YVU420 Different buffer offsets/pitches
[18:04:47] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[18:04:47] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[18:04:47] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[18:04:47] [PASSED] YVU420 Valid modifier
[18:04:47] [PASSED] YVU420 Different modifiers per plane
[18:04:47] [PASSED] YVU420 Modifier for inexistent plane
[18:04:47] [PASSED] X0L2 Normal sizes
[18:04:47] [PASSED] X0L2 Max sizes
[18:04:47] [PASSED] X0L2 Invalid pitch
[18:04:47] [PASSED] X0L2 Pitch greater than minimum required
[18:04:47] [PASSED] X0L2 Handle for inexistent plane
[18:04:47] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[18:04:47] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[18:04:47] [PASSED] X0L2 Valid modifier
[18:04:47] [PASSED] X0L2 Modifier for inexistent plane
[18:04:47] =========== [PASSED] drm_test_framebuffer_create ===========
[18:04:47] ================= [PASSED] drm_framebuffer =================
[18:04:47] ====================== drm_gem_shmem  ======================
[18:04:47] [PASSED] drm_gem_shmem_test_obj_create
[18:04:47] [PASSED] drm_gem_shmem_test_obj_create_private
[18:04:47] [PASSED] drm_gem_shmem_test_pin_pages
[18:04:47] [PASSED] drm_gem_shmem_test_vmap
[18:04:47] [PASSED] drm_gem_shmem_test_get_pages_sgt
[18:04:47] [PASSED] drm_gem_shmem_test_get_sg_table
[18:04:47] [PASSED] drm_gem_shmem_test_madvise
[18:04:47] [PASSED] drm_gem_shmem_test_purge
[18:04:47] ================== [PASSED] drm_gem_shmem ==================
[18:04:47] ==================== drm-test-managed  =====================
[18:04:47] [PASSED] drm_test_managed_run_action
[18:04:47] ================ [PASSED] drm-test-managed =================
[18:04:47] ========================= drm_mm  ==========================
[18:04:47] [PASSED] drm_test_mm_init
[18:04:47] [PASSED] drm_test_mm_debug
[18:04:47] [PASSED] drm_test_mm_align32
[18:04:47] [PASSED] drm_test_mm_align64
[18:04:47] [PASSED] drm_test_mm_lowest
[18:04:47] [PASSED] drm_test_mm_highest
[18:04:47] ===================== [PASSED] drm_mm ======================
[18:04:47] =================== drm_modes_analog_tv  ===================
[18:04:47] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[18:04:47] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[18:04:47] [PASSED] drm_test_modes_analog_tv_pal_576i
[18:04:47] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[18:04:47] =============== [PASSED] drm_modes_analog_tv ===============
[18:04:47] ==================== drm_plane_helper  =====================
[18:04:47] =============== drm_test_check_plane_state  ================
[18:04:47] [PASSED] clipping_simple
[18:04:47] [PASSED] clipping_rotate_reflect
[18:04:47] [PASSED] positioning_simple
[18:04:47] [PASSED] upscaling
[18:04:47] [PASSED] downscaling
[18:04:47] [PASSED] rounding1
[18:04:47] [PASSED] rounding2
[18:04:47] [PASSED] rounding3
[18:04:47] [PASSED] rounding4
[18:04:47] =========== [PASSED] drm_test_check_plane_state ============
[18:04:47] =========== drm_test_check_invalid_plane_state  ============
[18:04:47] [PASSED] positioning_invalid
[18:04:47] [PASSED] upscaling_invalid
[18:04:47] [PASSED] downscaling_invalid
[18:04:47] ======= [PASSED] drm_test_check_invalid_plane_state ========
[18:04:47] ================ [PASSED] drm_plane_helper =================
[18:04:47] ============ drm_connector_helper_tv_get_modes  ============
[18:04:47] ====== drm_test_connector_helper_tv_get_modes_check  =======
[18:04:47] [PASSED] None
[18:04:47] [PASSED] PAL
[18:04:47] [PASSED] NTSC
[18:04:47] [PASSED] Both, NTSC Default
[18:04:47] [PASSED] Both, PAL Default
[18:04:47] [PASSED] Both, NTSC Default, with PAL on command-line
[18:04:47] [PASSED] Both, PAL Default, with NTSC on command-line
[18:04:47] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[18:04:47] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[18:04:47] ======================== drm_rect  =========================
[18:04:47] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[18:04:47] [PASSED] drm_test_rect_clip_scaled_not_clipped
[18:04:47] [PASSED] drm_test_rect_clip_scaled_clipped
[18:04:47] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[18:04:47] ================= drm_test_rect_intersect  =================
[18:04:47] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[18:04:47] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
stty: 'standard input': Inappropriate ioctl for device
[18:04:47] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[18:04:47] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[18:04:47] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[18:04:47] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[18:04:47] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[18:04:47] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[18:04:47] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[18:04:47] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[18:04:47] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[18:04:47] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[18:04:47] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[18:04:47] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[18:04:47] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[18:04:47] ============= [PASSED] drm_test_rect_intersect =============
[18:04:47] ================ drm_test_rect_calc_hscale  ================
[18:04:47] [PASSED] normal use
[18:04:47] [PASSED] out of max range
[18:04:47] [PASSED] out of min range
[18:04:47] [PASSED] zero dst
[18:04:47] [PASSED] negative src
[18:04:47] [PASSED] negative dst
[18:04:47] ============ [PASSED] drm_test_rect_calc_hscale ============
[18:04:47] ================ drm_test_rect_calc_vscale  ================
[18:04:47] [PASSED] normal use
[18:04:47] [PASSED] out of max range
[18:04:47] [PASSED] out of min range
[18:04:47] [PASSED] zero dst
[18:04:47] [PASSED] negative src
[18:04:47] [PASSED] negative dst
[18:04:47] ============ [PASSED] drm_test_rect_calc_vscale ============
[18:04:47] ================== drm_test_rect_rotate  ===================
[18:04:47] [PASSED] reflect-x
[18:04:47] [PASSED] reflect-y
[18:04:47] [PASSED] rotate-0
[18:04:47] [PASSED] rotate-90
[18:04:47] [PASSED] rotate-180
[18:04:47] [PASSED] rotate-270
[18:04:47] ============== [PASSED] drm_test_rect_rotate ===============
[18:04:47] ================ drm_test_rect_rotate_inv  =================
[18:04:47] [PASSED] reflect-x
[18:04:47] [PASSED] reflect-y
[18:04:47] [PASSED] rotate-0
[18:04:47] [PASSED] rotate-90
[18:04:47] [PASSED] rotate-180
[18:04:47] [PASSED] rotate-270
[18:04:47] ============ [PASSED] drm_test_rect_rotate_inv =============
[18:04:47] ==================== [PASSED] drm_rect =====================
[18:04:47] ============================================================
[18:04:47] Testing complete. Ran 390 tests: passed: 390
[18:04:47] Elapsed time: 21.315s total, 1.649s configuring, 19.497s building, 0.163s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


