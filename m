Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E081C4167B
	for <intel-xe@archiver.kernel.org>; Sun, 10 Dec 2023 18:54:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F85C10E036;
	Sun, 10 Dec 2023 18:54:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C638E10E036;
 Sun, 10 Dec 2023 18:54:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C32B7AADD6;
 Sun, 10 Dec 2023 18:54:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Introduce_GuC_Doorbells_Manage?=
 =?utf-8?q?r?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Sun, 10 Dec 2023 18:54:29 -0000
Message-ID: <170223446979.19110.4277752532673995042@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231210180659.1615-1-michal.wajdeczko@intel.com>
In-Reply-To: <20231210180659.1615-1-michal.wajdeczko@intel.com>
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

Series: Introduce GuC Doorbells Manager
URL   : https://patchwork.freedesktop.org/series/127608/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[18:53:18] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:53:22] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[18:53:43] Starting KUnit Kernel (1/1)...
[18:53:43] ============================================================
[18:53:43] ========================= guc_dbm  =========================
[18:53:43] [PASSED] test_empty
[18:53:43] [PASSED] test_default
[18:53:43] ======================== test_size  ========================
[18:53:43] [PASSED] 4
[18:53:43] [PASSED] 8
[18:53:43] [PASSED] 32
[18:53:43] [PASSED] 256
[18:53:43] ==================== [PASSED] test_size ====================
[18:53:43] ======================= test_reuse  ========================
[18:53:43] [PASSED] 4
[18:53:43] [PASSED] 8
[18:53:43] [PASSED] 32
[18:53:43] [PASSED] 256
[18:53:43] =================== [PASSED] test_reuse ====================
[18:53:43] =================== test_range_overlap  ====================
[18:53:43] [PASSED] 4
[18:53:43] [PASSED] 8
[18:53:43] [PASSED] 32
[18:53:43] [PASSED] 256
[18:53:43] =============== [PASSED] test_range_overlap ================
[18:53:43] =================== test_range_compact  ====================
[18:53:43] [PASSED] 4
[18:53:43] [PASSED] 8
[18:53:43] [PASSED] 32
[18:53:43] [PASSED] 256
[18:53:43] =============== [PASSED] test_range_compact ================
[18:53:43] ==================== test_range_spare  =====================
[18:53:43] [PASSED] 4
[18:53:43] [PASSED] 8
[18:53:43] [PASSED] 32
[18:53:43] [PASSED] 256
[18:53:43] ================ [PASSED] test_range_spare =================
[18:53:43] ===================== [PASSED] guc_dbm =====================
[18:53:43] ========================== lmtt  ===========================
[18:53:43] ======================== test_ops  =========================
[18:53:43] [PASSED] 2-level
[18:53:43] [PASSED] multi-level
[18:53:43] ==================== [PASSED] test_ops =====================
[18:53:43] ====================== [PASSED] lmtt =======================
[18:53:43] ========================== xe_bo  ==========================
[18:53:43] [SKIPPED] xe_ccs_migrate_kunit
[18:53:43] [SKIPPED] xe_bo_evict_kunit
[18:53:43] ===================== [SKIPPED] xe_bo ======================
[18:53:43] ======================= xe_dma_buf  ========================
[18:53:43] [SKIPPED] xe_dma_buf_kunit
[18:53:43] =================== [SKIPPED] xe_dma_buf ===================
[18:53:43] ======================= xe_migrate  ========================
[18:53:43] [SKIPPED] xe_migrate_sanity_kunit
[18:53:43] =================== [SKIPPED] xe_migrate ===================
[18:53:43] ========================= xe_mocs  =========================
[18:53:43] [SKIPPED] xe_live_mocs_kernel_kunit
[18:53:43] ==================== [SKIPPED] xe_mocs =====================
[18:53:43] ========================= xe_pci  ==========================
[18:53:43] [PASSED] xe_gmdid_graphics_ip
[18:53:43] [PASSED] xe_gmdid_media_ip
[18:53:43] ===================== [PASSED] xe_pci ======================
[18:53:43] ========================= xe_rtp  ==========================
[18:53:43] ================== xe_rtp_process_tests  ===================
[18:53:43] [PASSED] coalesce-same-reg
[18:53:43] [PASSED] no-match-no-add
[18:53:43] [PASSED] no-match-no-add-multiple-rules
[18:53:43] [PASSED] two-regs-two-entries
[18:53:43] [PASSED] clr-one-set-other
[18:53:43] [PASSED] set-field
[18:53:43] [PASSED] conflict-duplicate
[18:53:43] [PASSED] conflict-not-disjoint
[18:53:43] [PASSED] conflict-reg-type
[18:53:43] ============== [PASSED] xe_rtp_process_tests ===============
[18:53:43] ===================== [PASSED] xe_rtp ======================
[18:53:43] ========================== xe_wa  ==========================
[18:53:43] ======================== xe_wa_gt  =========================
[18:53:43] [PASSED] TIGERLAKE (B0)
[18:53:43] [PASSED] DG1 (A0)
[18:53:43] [PASSED] DG1 (B0)
[18:53:43] [PASSED] ALDERLAKE_S (A0)
[18:53:43] [PASSED] ALDERLAKE_S (B0)
[18:53:43] [PASSED] ALDERLAKE_S (C0)
[18:53:43] [PASSED] ALDERLAKE_S (D0)
[18:53:43] [PASSED] ALDERLAKE_P (A0)
[18:53:43] [PASSED] ALDERLAKE_P (B0)
[18:53:43] [PASSED] ALDERLAKE_P (C0)
[18:53:43] [PASSED] ALDERLAKE_S_RPLS (D0)
[18:53:43] [PASSED] ALDERLAKE_P_RPLU (E0)
[18:53:43] [PASSED] DG2_G10 (A0)
[18:53:43] [PASSED] DG2_G10 (A1)
[18:53:43] [PASSED] DG2_G10 (B0)
[18:53:43] [PASSED] DG2_G10 (C0)
[18:53:43] [PASSED] DG2_G11 (A0)
[18:53:43] [PASSED] DG2_G11 (B0)
[18:53:43] [PASSED] DG2_G11 (B1)
[18:53:43] [PASSED] DG2_G12 (A0)
[18:53:43] [PASSED] DG2_G12 (A1)
[18:53:43] [PASSED] PVC (B0)
[18:53:43] [PASSED] PVC (B1)
[18:53:43] [PASSED] PVC (C0)
[18:53:43] [PASSED] METEORLAKE (g:A0, m:A0)
[18:53:43] [PASSED] METEORLAKE (g:A0, m:A0)
[18:53:43] [PASSED] LUNARLAKE (g:A0, m:A0)
[18:53:43] [PASSED] LUNARLAKE (g:B0, m:A0)
[18:53:43] ==================== [PASSED] xe_wa_gt =====================
[18:53:43] ====================== [PASSED] xe_wa ======================
[18:53:43] ============================================================
[18:53:43] Testing complete. Ran 68 tests: passed: 63, skipped: 5
[18:53:43] Elapsed time: 25.015s total, 4.164s configuring, 20.682s building, 0.145s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[18:53:43] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:53:45] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[18:54:04] Starting KUnit Kernel (1/1)...
[18:54:04] ============================================================
[18:54:04] ================== drm_test_pick_cmdline  ==================
[18:54:04] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[18:54:04] =============== drm_test_pick_cmdline_named  ===============
[18:54:04] [PASSED] NTSC
[18:54:04] [PASSED] NTSC-J
[18:54:04] [PASSED] PAL
[18:54:04] [PASSED] PAL-M
[18:54:04] =========== [PASSED] drm_test_pick_cmdline_named ===========
[18:54:04] ============== [PASSED] drm_test_pick_cmdline ==============
[18:54:04] ======================== drm_buddy  ========================
[18:54:04] [PASSED] drm_test_buddy_alloc_limit
[18:54:04] [PASSED] drm_test_buddy_alloc_range
[18:54:04] [PASSED] drm_test_buddy_alloc_optimistic
[18:54:04] [PASSED] drm_test_buddy_alloc_pessimistic
[18:54:04] [PASSED] drm_test_buddy_alloc_smoke
[18:54:04] [PASSED] drm_test_buddy_alloc_pathological
[18:54:04] ==================== [PASSED] drm_buddy ====================
[18:54:04] =================== drm_cmdline_parser  ====================
[18:54:04] [PASSED] drm_test_cmdline_force_d_only
[18:54:04] [PASSED] drm_test_cmdline_force_D_only_dvi
[18:54:04] [PASSED] drm_test_cmdline_force_D_only_hdmi
[18:54:04] [PASSED] drm_test_cmdline_force_D_only_not_digital
[18:54:04] [PASSED] drm_test_cmdline_force_e_only
[18:54:04] [PASSED] drm_test_cmdline_res
[18:54:04] [PASSED] drm_test_cmdline_res_vesa
[18:54:04] [PASSED] drm_test_cmdline_res_vesa_rblank
[18:54:04] [PASSED] drm_test_cmdline_res_rblank
[18:54:04] [PASSED] drm_test_cmdline_res_bpp
[18:54:04] [PASSED] drm_test_cmdline_res_refresh
[18:54:04] [PASSED] drm_test_cmdline_res_bpp_refresh
[18:54:04] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[18:54:04] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[18:54:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[18:54:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[18:54:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[18:54:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[18:54:04] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[18:54:04] [PASSED] drm_test_cmdline_res_margins_force_on
[18:54:04] [PASSED] drm_test_cmdline_res_vesa_margins
[18:54:04] [PASSED] drm_test_cmdline_name
[18:54:04] [PASSED] drm_test_cmdline_name_bpp
[18:54:04] [PASSED] drm_test_cmdline_name_option
[18:54:04] [PASSED] drm_test_cmdline_name_bpp_option
[18:54:04] [PASSED] drm_test_cmdline_rotate_0
[18:54:04] [PASSED] drm_test_cmdline_rotate_90
[18:54:04] [PASSED] drm_test_cmdline_rotate_180
[18:54:04] [PASSED] drm_test_cmdline_rotate_270
[18:54:04] [PASSED] drm_test_cmdline_hmirror
[18:54:04] [PASSED] drm_test_cmdline_vmirror
[18:54:04] [PASSED] drm_test_cmdline_margin_options
[18:54:04] [PASSED] drm_test_cmdline_multiple_options
[18:54:04] [PASSED] drm_test_cmdline_bpp_extra_and_option
[18:54:04] [PASSED] drm_test_cmdline_extra_and_option
[18:54:04] [PASSED] drm_test_cmdline_freestanding_options
[18:54:04] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[18:54:04] [PASSED] drm_test_cmdline_panel_orientation
[18:54:04] ================ drm_test_cmdline_invalid  =================
[18:54:04] [PASSED] margin_only
[18:54:04] [PASSED] interlace_only
[18:54:04] [PASSED] res_missing_x
[18:54:04] [PASSED] res_missing_y
[18:54:04] [PASSED] res_bad_y
[18:54:04] [PASSED] res_missing_y_bpp
[18:54:04] [PASSED] res_bad_bpp
[18:54:04] [PASSED] res_bad_refresh
[18:54:04] [PASSED] res_bpp_refresh_force_on_off
[18:54:04] [PASSED] res_invalid_mode
[18:54:04] [PASSED] res_bpp_wrong_place_mode
[18:54:04] [PASSED] name_bpp_refresh
[18:54:04] [PASSED] name_refresh
[18:54:04] [PASSED] name_refresh_wrong_mode
[18:54:04] [PASSED] name_refresh_invalid_mode
[18:54:04] [PASSED] rotate_multiple
[18:54:04] [PASSED] rotate_invalid_val
[18:54:04] [PASSED] rotate_truncated
[18:54:04] [PASSED] invalid_option
[18:54:04] [PASSED] invalid_tv_option
[18:54:04] [PASSED] truncated_tv_option
[18:54:04] ============ [PASSED] drm_test_cmdline_invalid =============
[18:54:04] =============== drm_test_cmdline_tv_options  ===============
[18:54:04] [PASSED] NTSC
[18:54:04] [PASSED] NTSC_443
[18:54:04] [PASSED] NTSC_J
[18:54:04] [PASSED] PAL
[18:54:04] [PASSED] PAL_M
[18:54:04] [PASSED] PAL_N
[18:54:04] [PASSED] SECAM
[18:54:04] =========== [PASSED] drm_test_cmdline_tv_options ===========
[18:54:04] =============== [PASSED] drm_cmdline_parser ================
[18:54:04] ================ drm_get_tv_mode_from_name  ================
[18:54:04] ========== drm_test_get_tv_mode_from_name_valid  ===========
[18:54:04] [PASSED] NTSC
[18:54:04] [PASSED] NTSC-443
[18:54:04] [PASSED] NTSC-J
[18:54:04] [PASSED] PAL
[18:54:04] [PASSED] PAL-M
[18:54:04] [PASSED] PAL-N
[18:54:04] [PASSED] SECAM
[18:54:04] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[18:54:04] [PASSED] drm_test_get_tv_mode_from_name_truncated
[18:54:04] ============ [PASSED] drm_get_tv_mode_from_name ============
[18:54:04] ==================== drm_damage_helper  ====================
[18:54:04] [PASSED] drm_test_damage_iter_no_damage
[18:54:04] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[18:54:04] [PASSED] drm_test_damage_iter_no_damage_src_moved
[18:54:04] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[18:54:04] [PASSED] drm_test_damage_iter_no_damage_not_visible
[18:54:04] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[18:54:04] [PASSED] drm_test_damage_iter_no_damage_no_fb
[18:54:04] [PASSED] drm_test_damage_iter_simple_damage
[18:54:04] [PASSED] drm_test_damage_iter_single_damage
[18:54:04] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[18:54:04] [PASSED] drm_test_damage_iter_single_damage_outside_src
[18:54:04] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[18:54:04] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[18:54:04] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[18:54:04] [PASSED] drm_test_damage_iter_single_damage_src_moved
[18:54:04] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[18:54:04] [PASSED] drm_test_damage_iter_damage
[18:54:04] [PASSED] drm_test_damage_iter_damage_one_intersect
[18:54:04] [PASSED] drm_test_damage_iter_damage_one_outside
[18:54:04] [PASSED] drm_test_damage_iter_damage_src_moved
[18:54:04] [PASSED] drm_test_damage_iter_damage_not_visible
[18:54:04] ================ [PASSED] drm_damage_helper ================
[18:54:04] ==================== drm_dp_mst_helper  ====================
[18:54:04] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[18:54:04] [PASSED] Clock 154000 BPP 30 DSC disabled
[18:54:04] [PASSED] Clock 234000 BPP 30 DSC disabled
[18:54:04] [PASSED] Clock 297000 BPP 24 DSC disabled
[18:54:04] [PASSED] Clock 332880 BPP 24 DSC enabled
[18:54:04] [PASSED] Clock 324540 BPP 24 DSC enabled
[18:54:04] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[18:54:04] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[18:54:04] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[18:54:04] [PASSED] DP_POWER_UP_PHY with port number
[18:54:04] [PASSED] DP_POWER_DOWN_PHY with port number
[18:54:04] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[18:54:04] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[18:54:04] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[18:54:04] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[18:54:04] [PASSED] DP_QUERY_PAYLOAD with port number
[18:54:04] [PASSED] DP_QUERY_PAYLOAD with VCPI
[18:54:04] [PASSED] DP_REMOTE_DPCD_READ with port number
[18:54:04] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[18:54:04] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[18:54:04] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[18:54:04] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[18:54:04] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[18:54:04] [PASSED] DP_REMOTE_I2C_READ with port number
[18:54:04] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[18:54:04] [PASSED] DP_REMOTE_I2C_READ with transactions array
[18:54:04] [PASSED] DP_REMOTE_I2C_WRITE with port number
[18:54:04] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[18:54:04] [PASSED] DP_REMOTE_I2C_WRITE with data array
[18:54:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[18:54:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[18:54:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[18:54:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[18:54:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[18:54:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[18:54:04] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[18:54:04] ================ [PASSED] drm_dp_mst_helper ================
[18:54:04] ================= drm_format_helper_test  ==================
[18:54:04] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[18:54:04] [PASSED] single_pixel_source_buffer
[18:54:04] [PASSED] single_pixel_clip_rectangle
[18:54:04] [PASSED] well_known_colors
[18:54:04] [PASSED] destination_pitch
[18:54:04] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[18:54:04] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[18:54:04] [PASSED] single_pixel_source_buffer
[18:54:04] [PASSED] single_pixel_clip_rectangle
[18:54:04] [PASSED] well_known_colors
[18:54:04] [PASSED] destination_pitch
[18:54:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[18:54:04] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[18:54:04] [PASSED] single_pixel_source_buffer
[18:54:04] [PASSED] single_pixel_clip_rectangle
[18:54:04] [PASSED] well_known_colors
[18:54:04] [PASSED] destination_pitch
[18:54:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[18:54:04] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[18:54:04] [PASSED] single_pixel_source_buffer
[18:54:04] [PASSED] single_pixel_clip_rectangle
[18:54:04] [PASSED] well_known_colors
[18:54:04] [PASSED] destination_pitch
[18:54:04] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[18:54:04] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[18:54:04] [PASSED] single_pixel_source_buffer
[18:54:04] [PASSED] single_pixel_clip_rectangle
[18:54:04] [PASSED] well_known_colors
[18:54:04] [PASSED] destination_pitch
[18:54:04] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[18:54:04] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[18:54:04] [PASSED] single_pixel_source_buffer
[18:54:04] [PASSED] single_pixel_clip_rectangle
[18:54:04] [PASSED] well_known_colors
[18:54:04] [PASSED] destination_pitch
[18:54:04] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[18:54:04] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[18:54:04] [PASSED] single_pixel_source_buffer
[18:54:04] [PASSED] single_pixel_clip_rectangle
[18:54:04] [PASSED] well_known_colors
[18:54:04] [PASSED] destination_pitch
[18:54:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[18:54:04] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[18:54:04] [PASSED] single_pixel_source_buffer
[18:54:04] [PASSED] single_pixel_clip_rectangle
[18:54:04] [PASSED] well_known_colors
[18:54:04] [PASSED] destination_pitch
[18:54:04] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[18:54:04] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[18:54:04] [PASSED] single_pixel_source_buffer
[18:54:04] [PASSED] single_pixel_clip_rectangle
[18:54:04] [PASSED] well_known_colors
[18:54:04] [PASSED] destination_pitch
[18:54:04] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[18:54:04] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[18:54:04] [PASSED] single_pixel_source_buffer
[18:54:04] [PASSED] single_pixel_clip_rectangle
[18:54:04] [PASSED] well_known_colors
[18:54:04] [PASSED] destination_pitch
[18:54:04] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[18:54:04] ============== drm_test_fb_xrgb8888_to_mono  ===============
[18:54:04] [PASSED] single_pixel_source_buffer
[18:54:04] [PASSED] single_pixel_clip_rectangle
[18:54:04] [PASSED] well_known_colors
[18:54:04] [PASSED] destination_pitch
[18:54:04] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[18:54:04] ==================== drm_test_fb_swab  =====================
[18:54:04] [PASSED] single_pixel_source_buffer
[18:54:04] [PASSED] single_pixel_clip_rectangle
[18:54:04] [PASSED] well_known_colors
[18:54:04] [PASSED] destination_pitch
[18:54:04] ================ [PASSED] drm_test_fb_swab =================
[18:54:04] ================= drm_test_fb_clip_offset  =================
[18:54:04] [PASSED] pass through
[18:54:04] [PASSED] horizontal offset
[18:54:04] [PASSED] vertical offset
[18:54:04] [PASSED] horizontal and vertical offset
[18:54:04] [PASSED] horizontal offset (custom pitch)
[18:54:04] [PASSED] vertical offset (custom pitch)
[18:54:04] [PASSED] horizontal and vertical offset (custom pitch)
[18:54:04] ============= [PASSED] drm_test_fb_clip_offset =============
[18:54:04] ============== drm_test_fb_build_fourcc_list  ==============
[18:54:04] [PASSED] no native formats
[18:54:04] [PASSED] XRGB8888 as native format
[18:54:04] [PASSED] remove duplicates
[18:54:04] [PASSED] convert alpha formats
[18:54:04] [PASSED] random formats
[18:54:04] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[18:54:04] =================== drm_test_fb_memcpy  ====================
[18:54:04] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[18:54:04] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[18:54:04] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[18:54:04] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[18:54:04] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[18:54:04] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[18:54:04] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[18:54:04] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[18:54:04] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[18:54:04] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[18:54:04] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[18:54:04] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[18:54:04] =============== [PASSED] drm_test_fb_memcpy ================
[18:54:04] ============= [PASSED] drm_format_helper_test ==============
[18:54:04] ======================= drm_format  ========================
[18:54:04] [PASSED] drm_test_format_block_width_invalid
[18:54:04] [PASSED] drm_test_format_block_width_one_plane
[18:54:04] [PASSED] drm_test_format_block_width_two_plane
[18:54:04] [PASSED] drm_test_format_block_width_three_plane
[18:54:04] [PASSED] drm_test_format_block_width_tiled
[18:54:04] [PASSED] drm_test_format_block_height_invalid
[18:54:04] [PASSED] drm_test_format_block_height_one_plane
[18:54:04] [PASSED] drm_test_format_block_height_two_plane
[18:54:04] [PASSED] drm_test_format_block_height_three_plane
[18:54:04] [PASSED] drm_test_format_block_height_tiled
[18:54:04] [PASSED] drm_test_format_min_pitch_invalid
[18:54:04] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[18:54:04] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[18:54:04] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[18:54:04] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[18:54:04] [PASSED] drm_test_format_min_pitch_two_plane
[18:54:04] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[18:54:04] [PASSED] drm_test_format_min_pitch_tiled
[18:54:04] =================== [PASSED] drm_format ====================
[18:54:04] ===================== drm_framebuffer  =====================
[18:54:04] =============== drm_test_framebuffer_create  ===============
[18:54:04] [PASSED] ABGR8888 normal sizes
[18:54:04] [PASSED] ABGR8888 max sizes
[18:54:04] [PASSED] ABGR8888 pitch greater than min required
[18:54:04] [PASSED] ABGR8888 pitch less than min required
[18:54:04] [PASSED] ABGR8888 Invalid width
[18:54:04] [PASSED] ABGR8888 Invalid buffer handle
[18:54:04] [PASSED] No pixel format
[18:54:04] [PASSED] ABGR8888 Width 0
[18:54:04] [PASSED] ABGR8888 Height 0
[18:54:04] [PASSED] ABGR8888 Out of bound height * pitch combination
[18:54:04] [PASSED] ABGR8888 Large buffer offset
[18:54:04] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[18:54:04] [PASSED] ABGR8888 Valid buffer modifier
[18:54:04] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[18:54:04] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[18:54:04] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[18:54:04] [PASSED] NV12 Normal sizes
[18:54:04] [PASSED] NV12 Max sizes
[18:54:04] [PASSED] NV12 Invalid pitch
[18:54:04] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[18:54:04] [PASSED] NV12 different  modifier per-plane
[18:54:04] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[18:54:04] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[18:54:04] [PASSED] NV12 Modifier for inexistent plane
[18:54:04] [PASSED] NV12 Handle for inexistent plane
[18:54:04] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[18:54:04] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[18:54:04] [PASSED] YVU420 Normal sizes
[18:54:04] [PASSED] YVU420 Max sizes
[18:54:04] [PASSED] YVU420 Invalid pitch
[18:54:04] [PASSED] YVU420 Different pitches
[18:54:04] [PASSED] YVU420 Different buffer offsets/pitches
[18:54:04] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[18:54:04] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[18:54:04] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[18:54:04] [PASSED] YVU420 Valid modifier
[18:54:04] [PASSED] YVU420 Different modifiers per plane
[18:54:04] [PASSED] YVU420 Modifier for inexistent plane
[18:54:04] [PASSED] X0L2 Normal sizes
[18:54:04] [PASSED] X0L2 Max sizes
[18:54:04] [PASSED] X0L2 Invalid pitch
[18:54:04] [PASSED] X0L2 Pitch greater than minimum required
[18:54:04] [PASSED] X0L2 Handle for inexistent plane
[18:54:04] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[18:54:04] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[18:54:04] [PASSED] X0L2 Valid modifier
[18:54:04] [PASSED] X0L2 Modifier for inexistent plane
[18:54:04] =========== [PASSED] drm_test_framebuffer_create ===========
[18:54:04] ================= [PASSED] drm_framebuffer =================
[18:54:04] ==================== drm-test-managed  =====================
[18:54:04] [PASSED] drm_test_managed_run_action
[18:54:04] ================ [PASSED] drm-test-managed =================
[18:54:04] ========================= drm_mm  ==========================
[18:54:04] [PASSED] drm_test_mm_init
[18:54:04] [PASSED] drm_test_mm_debug
[18:54:14] [PASSED] drm_test_mm_reserve
[18:54:24] [PASSED] drm_test_mm_insert
[18:54:25] [PASSED] drm_test_mm_replace
[18:54:25] [PASSED] drm_test_mm_insert_range
[18:54:25] [PASSED] drm_test_mm_frag
[18:54:25] [PASSED] drm_test_mm_align
[18:54:25] [PASSED] drm_test_mm_align32
[18:54:25] [PASSED] drm_test_mm_align64
[18:54:26] [PASSED] drm_test_mm_evict
[18:54:26] [PASSED] drm_test_mm_evict_range
[18:54:26] [PASSED] drm_test_mm_topdown
[18:54:26] [PASSED] drm_test_mm_bottomup
[18:54:26] [PASSED] drm_test_mm_lowest
[18:54:26] [PASSED] drm_test_mm_highest
[18:54:26] [PASSED] drm_test_mm_color
[18:54:27] [PASSED] drm_test_mm_color_evict
[18:54:27] [PASSED] drm_test_mm_color_evict_range
[18:54:27] ===================== [PASSED] drm_mm ======================
[18:54:27] =================== drm_modes_analog_tv  ===================
[18:54:27] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[18:54:27] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[18:54:27] [PASSED] drm_test_modes_analog_tv_pal_576i
[18:54:27] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[18:54:27] =============== [PASSED] drm_modes_analog_tv ===============
[18:54:27] ==================== drm_plane_helper  =====================
[18:54:27] =============== drm_test_check_plane_state  ================
[18:54:27] [PASSED] clipping_simple
[18:54:27] [PASSED] clipping_rotate_reflect
[18:54:27] [PASSED] positioning_simple
[18:54:27] [PASSED] upscaling
[18:54:27] [PASSED] downscaling
[18:54:27] [PASSED] rounding1
[18:54:27] [PASSED] rounding2
[18:54:27] [PASSED] rounding3
[18:54:27] [PASSED] rounding4
[18:54:27] =========== [PASSED] drm_test_check_plane_state ============
[18:54:27] =========== drm_test_check_invalid_plane_state  ============
[18:54:27] [PASSED] positioning_invalid
[18:54:27] [PASSED] upscaling_invalid
[18:54:27] [PASSED] downscaling_invalid
[18:54:27] ======= [PASSED] drm_test_check_invalid_plane_state ========
[18:54:27] ================ [PASSED] drm_plane_helper =================
[18:54:27] ============ drm_connector_helper_tv_get_modes  ============
[18:54:27] ====== drm_test_connector_helper_tv_get_modes_check  =======
[18:54:27] [PASSED] None
[18:54:27] [PASSED] PAL
[18:54:27] [PASSED] NTSC
[18:54:27] [PASSED] Both, NTSC Default
[18:54:27] [PASSED] Both, PAL Default
[18:54:27] [PASSED] Both, NTSC Default, with PAL on command-line
[18:54:27] [PASSED] Both, PAL Default, with NTSC on command-line
[18:54:27] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[18:54:27] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[18:54:27] ======================== drm_rect  =========================
[18:54:27] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[18:54:27] [PASSED] drm_test_rect_clip_scaled_not_clipped
[18:54:27] [PASSED] drm_test_rect_clip_scaled_clipped
[18:54:27] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[18:54:27] ================= drm_test_rect_intersect  =================
[18:54:27] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[18:54:27] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[18:54:27] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[18:54:27] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[18:54:27] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[18:54:27] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[18:54:27] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[18:54:27] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[18:54:27] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[18:54:27] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[18:54:27] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[18:54:27] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[18:54:27] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[18:54:27] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[18:54:27] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[18:54:27] ============= [PASSED] drm_test_rect_intersect =============
[18:54:27] ================ drm_test_rect_calc_hscale  ================
[18:54:27] [PASSED] normal use
[18:54:27] [PASSED] out of max range
[18:54:27] [PASSED] out of min range
[18:54:27] [PASSED] zero dst
[18:54:27] [PASSED] negative src
[18:54:27] [PASSED] negative dst
[18:54:27] ============ [PASSED] drm_test_rect_calc_hscale ============
[18:54:27] ================ drm_test_rect_calc_vscale  ================
[18:54:27] [PASSED] normal use
[18:54:27] [PASSED] out of max range
[18:54:27] [PASSED] out of min range
[18:54:27] [PASSED] zero dst
[18:54:27] [PASSED] negative src
[18:54:27] [PASSED] negative dst
[18:54:27] ============ [PASSED] drm_test_rect_calc_vscale ============
[18:54:27] ================== drm_test_rect_rotate  ===================
[18:54:27] [PASSED] reflect-x
[18:54:27] [PASSED] reflect-y
[18:54:27] [PASSED] rotate-0
[18:54:27] [PASSED] rotate-90
[18:54:27] [PASSED] rotate-180
[18:54:27] [PASSED] rotate-270
[18:54:27] ============== [PASSED] drm_test_rect_rotate ===============
[18:54:27] ================ drm_test_rect_rotate_inv  =================
[18:54:27] [PASSED] reflect-x
[18:54:27] [PASSED] reflect-y
[18:54:27] [PASSED] rotate-0
[18:54:27] [PASSED] rotate-90
[18:54:27] [PASSED] rotate-180
[18:54:27] [PASSED] rotate-270
[18:54:27] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[18:54:27] ==================== [PASSED] drm_rect =====================
[18:54:27] ======================== drm_exec  =========================
[18:54:27] [PASSED] sanitycheck
[18:54:27] [PASSED] test_lock
[18:54:27] [PASSED] test_lock_unlock
[18:54:27] [PASSED] test_duplicates
[18:54:27] [PASSED] test_prepare
[18:54:27] [PASSED] test_prepare_array
[18:54:27] [PASSED] test_multiple_loops
[18:54:27] ==================== [PASSED] drm_exec =====================
[18:54:27] ============================================================
[18:54:27] Testing complete. Ran 368 tests: passed: 368
[18:54:27] Elapsed time: 43.953s total, 1.640s configuring, 19.031s building, 23.252s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


