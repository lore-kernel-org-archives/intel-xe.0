Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7ADC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 22:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5418510E227;
	Mon, 13 Nov 2023 22:15:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 477D310E227;
 Mon, 13 Nov 2023 22:15:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 37570AADF1;
 Mon, 13 Nov 2023 22:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ruthuvikas Ravikumar" <ruthuvikas.ravikumar@intel.com>
Date: Mon, 13 Nov 2023 22:15:32 -0000
Message-ID: <169991373222.24210.6084315980816598547@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231113211938.2207870-1-ruthuvikas.ravikumar@intel.com>
In-Reply-To: <20231113211938.2207870-1-ruthuvikas.ravikumar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe?=
 =?utf-8?q?=3A_Add_mocs_kunit_=28rev12=29?=
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

Series: drm/xe: Add mocs kunit (rev12)
URL   : https://patchwork.freedesktop.org/series/124926/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[22:14:20] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:14:24] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[22:14:45] Starting KUnit Kernel (1/1)...
[22:14:45] ============================================================
[22:14:45] ========================== xe_bo  ==========================
[22:14:45] [SKIPPED] xe_ccs_migrate_kunit
[22:14:45] [SKIPPED] xe_bo_evict_kunit
[22:14:45] ===================== [SKIPPED] xe_bo ======================
[22:14:45] ======================= xe_dma_buf  ========================
[22:14:45] [SKIPPED] xe_dma_buf_kunit
[22:14:45] =================== [SKIPPED] xe_dma_buf ===================
[22:14:45] ======================= xe_migrate  ========================
[22:14:45] [SKIPPED] xe_migrate_sanity_kunit
[22:14:45] =================== [SKIPPED] xe_migrate ===================
[22:14:45] ========================= xe_mocs  =========================
[22:14:45] [SKIPPED] xe_live_mocs_kernel_kunit
[22:14:45] ==================== [SKIPPED] xe_mocs =====================
[22:14:45] ========================= xe_pci  ==========================
[22:14:45] [PASSED] xe_gmdid_graphics_ip
[22:14:45] [PASSED] xe_gmdid_media_ip
[22:14:45] ===================== [PASSED] xe_pci ======================
[22:14:45] ========================= xe_rtp  ==========================
[22:14:45] ================== xe_rtp_process_tests  ===================
[22:14:45] [PASSED] coalesce-same-reg
[22:14:45] [PASSED] no-match-no-add
[22:14:45] [PASSED] no-match-no-add-multiple-rules
[22:14:45] [PASSED] two-regs-two-entries
[22:14:45] [PASSED] clr-one-set-other
[22:14:45] [PASSED] set-field
[22:14:45] [PASSED] conflict-duplicate
[22:14:45] [PASSED] conflict-not-disjoint
[22:14:45] [PASSED] conflict-reg-type
[22:14:45] ============== [PASSED] xe_rtp_process_tests ===============
[22:14:45] ===================== [PASSED] xe_rtp ======================
[22:14:45] ========================== xe_wa  ==========================
[22:14:45] ======================== xe_wa_gt  =========================
[22:14:45] [PASSED] TIGERLAKE (B0)
[22:14:45] [PASSED] DG1 (A0)
[22:14:45] [PASSED] DG1 (B0)
[22:14:45] [PASSED] ALDERLAKE_S (A0)
[22:14:45] [PASSED] ALDERLAKE_S (B0)
[22:14:45] [PASSED] ALDERLAKE_S (C0)
[22:14:45] [PASSED] ALDERLAKE_S (D0)
[22:14:45] [PASSED] ALDERLAKE_P (A0)
[22:14:45] [PASSED] ALDERLAKE_P (B0)
[22:14:45] [PASSED] ALDERLAKE_P (C0)
[22:14:45] [PASSED] ALDERLAKE_S_RPLS (D0)
[22:14:45] [PASSED] ALDERLAKE_P_RPLU (E0)
[22:14:45] [PASSED] DG2_G10 (A0)
[22:14:45] [PASSED] DG2_G10 (A1)
[22:14:45] [PASSED] DG2_G10 (B0)
[22:14:45] [PASSED] DG2_G10 (C0)
[22:14:45] [PASSED] DG2_G11 (A0)
[22:14:45] [PASSED] DG2_G11 (B0)
[22:14:45] [PASSED] DG2_G11 (B1)
[22:14:45] [PASSED] DG2_G12 (A0)
[22:14:45] [PASSED] DG2_G12 (A1)
[22:14:45] [PASSED] PVC (B0)
[22:14:45] [PASSED] PVC (B1)
[22:14:45] [PASSED] PVC (C0)
[22:14:45] ==================== [PASSED] xe_wa_gt =====================
[22:14:45] ====================== [PASSED] xe_wa ======================
[22:14:45] ============================================================
[22:14:45] Testing complete. Ran 40 tests: passed: 35, skipped: 5
[22:14:45] Elapsed time: 24.506s total, 4.223s configuring, 20.113s building, 0.148s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[22:14:45] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:14:46] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[22:15:06] Starting KUnit Kernel (1/1)...
[22:15:06] ============================================================
[22:15:06] ================== drm_test_pick_cmdline  ==================
[22:15:06] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[22:15:06] =============== drm_test_pick_cmdline_named  ===============
[22:15:06] [PASSED] NTSC
[22:15:06] [PASSED] NTSC-J
[22:15:06] [PASSED] PAL
[22:15:06] [PASSED] PAL-M
[22:15:06] =========== [PASSED] drm_test_pick_cmdline_named ===========
[22:15:06] ============== [PASSED] drm_test_pick_cmdline ==============
[22:15:06] ======================== drm_buddy  ========================
[22:15:06] [PASSED] drm_test_buddy_alloc_limit
[22:15:06] [PASSED] drm_test_buddy_alloc_range
[22:15:06] [PASSED] drm_test_buddy_alloc_optimistic
[22:15:06] [PASSED] drm_test_buddy_alloc_pessimistic
[22:15:06] [PASSED] drm_test_buddy_alloc_smoke
[22:15:06] [PASSED] drm_test_buddy_alloc_pathological
[22:15:06] ==================== [PASSED] drm_buddy ====================
[22:15:06] =================== drm_cmdline_parser  ====================
[22:15:06] [PASSED] drm_test_cmdline_force_d_only
[22:15:06] [PASSED] drm_test_cmdline_force_D_only_dvi
[22:15:06] [PASSED] drm_test_cmdline_force_D_only_hdmi
[22:15:06] [PASSED] drm_test_cmdline_force_D_only_not_digital
[22:15:06] [PASSED] drm_test_cmdline_force_e_only
[22:15:06] [PASSED] drm_test_cmdline_res
[22:15:06] [PASSED] drm_test_cmdline_res_vesa
[22:15:06] [PASSED] drm_test_cmdline_res_vesa_rblank
[22:15:06] [PASSED] drm_test_cmdline_res_rblank
[22:15:06] [PASSED] drm_test_cmdline_res_bpp
[22:15:06] [PASSED] drm_test_cmdline_res_refresh
[22:15:06] [PASSED] drm_test_cmdline_res_bpp_refresh
[22:15:06] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[22:15:06] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[22:15:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[22:15:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[22:15:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[22:15:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[22:15:06] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[22:15:06] [PASSED] drm_test_cmdline_res_margins_force_on
[22:15:06] [PASSED] drm_test_cmdline_res_vesa_margins
[22:15:06] [PASSED] drm_test_cmdline_name
[22:15:06] [PASSED] drm_test_cmdline_name_bpp
[22:15:06] [PASSED] drm_test_cmdline_name_option
[22:15:06] [PASSED] drm_test_cmdline_name_bpp_option
[22:15:06] [PASSED] drm_test_cmdline_rotate_0
[22:15:06] [PASSED] drm_test_cmdline_rotate_90
[22:15:06] [PASSED] drm_test_cmdline_rotate_180
[22:15:06] [PASSED] drm_test_cmdline_rotate_270
[22:15:06] [PASSED] drm_test_cmdline_hmirror
[22:15:06] [PASSED] drm_test_cmdline_vmirror
[22:15:06] [PASSED] drm_test_cmdline_margin_options
[22:15:06] [PASSED] drm_test_cmdline_multiple_options
[22:15:06] [PASSED] drm_test_cmdline_bpp_extra_and_option
[22:15:06] [PASSED] drm_test_cmdline_extra_and_option
[22:15:06] [PASSED] drm_test_cmdline_freestanding_options
[22:15:06] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[22:15:06] [PASSED] drm_test_cmdline_panel_orientation
[22:15:06] ================ drm_test_cmdline_invalid  =================
[22:15:06] [PASSED] margin_only
[22:15:06] [PASSED] interlace_only
[22:15:06] [PASSED] res_missing_x
[22:15:06] [PASSED] res_missing_y
[22:15:06] [PASSED] res_bad_y
[22:15:06] [PASSED] res_missing_y_bpp
[22:15:06] [PASSED] res_bad_bpp
[22:15:06] [PASSED] res_bad_refresh
[22:15:06] [PASSED] res_bpp_refresh_force_on_off
[22:15:06] [PASSED] res_invalid_mode
[22:15:06] [PASSED] res_bpp_wrong_place_mode
[22:15:06] [PASSED] name_bpp_refresh
[22:15:06] [PASSED] name_refresh
[22:15:06] [PASSED] name_refresh_wrong_mode
[22:15:06] [PASSED] name_refresh_invalid_mode
[22:15:06] [PASSED] rotate_multiple
[22:15:06] [PASSED] rotate_invalid_val
[22:15:06] [PASSED] rotate_truncated
[22:15:06] [PASSED] invalid_option
[22:15:06] [PASSED] invalid_tv_option
[22:15:06] [PASSED] truncated_tv_option
[22:15:06] ============ [PASSED] drm_test_cmdline_invalid =============
[22:15:06] =============== drm_test_cmdline_tv_options  ===============
[22:15:06] [PASSED] NTSC
[22:15:06] [PASSED] NTSC_443
[22:15:06] [PASSED] NTSC_J
[22:15:06] [PASSED] PAL
[22:15:06] [PASSED] PAL_M
[22:15:06] [PASSED] PAL_N
[22:15:06] [PASSED] SECAM
[22:15:06] =========== [PASSED] drm_test_cmdline_tv_options ===========
[22:15:06] =============== [PASSED] drm_cmdline_parser ================
[22:15:06] ================ drm_get_tv_mode_from_name  ================
[22:15:06] ========== drm_test_get_tv_mode_from_name_valid  ===========
[22:15:06] [PASSED] NTSC
[22:15:06] [PASSED] NTSC-443
[22:15:06] [PASSED] NTSC-J
[22:15:06] [PASSED] PAL
[22:15:06] [PASSED] PAL-M
[22:15:06] [PASSED] PAL-N
[22:15:06] [PASSED] SECAM
[22:15:06] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[22:15:06] [PASSED] drm_test_get_tv_mode_from_name_truncated
[22:15:06] ============ [PASSED] drm_get_tv_mode_from_name ============
[22:15:06] ==================== drm_damage_helper  ====================
[22:15:06] [PASSED] drm_test_damage_iter_no_damage
[22:15:06] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[22:15:06] [PASSED] drm_test_damage_iter_no_damage_src_moved
[22:15:06] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[22:15:06] [PASSED] drm_test_damage_iter_no_damage_not_visible
[22:15:06] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[22:15:06] [PASSED] drm_test_damage_iter_no_damage_no_fb
[22:15:06] [PASSED] drm_test_damage_iter_simple_damage
[22:15:06] [PASSED] drm_test_damage_iter_single_damage
[22:15:06] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[22:15:06] [PASSED] drm_test_damage_iter_single_damage_outside_src
[22:15:06] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[22:15:06] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[22:15:06] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[22:15:06] [PASSED] drm_test_damage_iter_single_damage_src_moved
[22:15:06] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[22:15:06] [PASSED] drm_test_damage_iter_damage
[22:15:06] [PASSED] drm_test_damage_iter_damage_one_intersect
[22:15:06] [PASSED] drm_test_damage_iter_damage_one_outside
[22:15:06] [PASSED] drm_test_damage_iter_damage_src_moved
[22:15:06] [PASSED] drm_test_damage_iter_damage_not_visible
[22:15:06] ================ [PASSED] drm_damage_helper ================
[22:15:06] ==================== drm_dp_mst_helper  ====================
[22:15:06] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[22:15:06] [PASSED] Clock 154000 BPP 30 DSC disabled
[22:15:06] [PASSED] Clock 234000 BPP 30 DSC disabled
[22:15:06] [PASSED] Clock 297000 BPP 24 DSC disabled
[22:15:06] [PASSED] Clock 332880 BPP 24 DSC enabled
[22:15:06] [PASSED] Clock 324540 BPP 24 DSC enabled
[22:15:06] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[22:15:06] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[22:15:06] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[22:15:06] [PASSED] DP_POWER_UP_PHY with port number
[22:15:06] [PASSED] DP_POWER_DOWN_PHY with port number
[22:15:06] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[22:15:06] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[22:15:06] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[22:15:06] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[22:15:06] [PASSED] DP_QUERY_PAYLOAD with port number
[22:15:06] [PASSED] DP_QUERY_PAYLOAD with VCPI
[22:15:06] [PASSED] DP_REMOTE_DPCD_READ with port number
[22:15:06] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[22:15:06] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[22:15:06] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[22:15:06] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[22:15:06] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[22:15:06] [PASSED] DP_REMOTE_I2C_READ with port number
[22:15:06] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[22:15:06] [PASSED] DP_REMOTE_I2C_READ with transactions array
[22:15:06] [PASSED] DP_REMOTE_I2C_WRITE with port number
[22:15:06] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[22:15:06] [PASSED] DP_REMOTE_I2C_WRITE with data array
[22:15:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[22:15:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[22:15:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[22:15:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[22:15:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[22:15:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[22:15:06] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[22:15:06] ================ [PASSED] drm_dp_mst_helper ================
[22:15:06] ================= drm_format_helper_test  ==================
[22:15:06] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[22:15:06] [PASSED] single_pixel_source_buffer
[22:15:06] [PASSED] single_pixel_clip_rectangle
[22:15:06] [PASSED] well_known_colors
[22:15:06] [PASSED] destination_pitch
[22:15:06] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[22:15:06] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[22:15:06] [PASSED] single_pixel_source_buffer
[22:15:06] [PASSED] single_pixel_clip_rectangle
[22:15:06] [PASSED] well_known_colors
[22:15:06] [PASSED] destination_pitch
[22:15:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[22:15:06] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[22:15:06] [PASSED] single_pixel_source_buffer
[22:15:06] [PASSED] single_pixel_clip_rectangle
[22:15:06] [PASSED] well_known_colors
[22:15:06] [PASSED] destination_pitch
[22:15:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[22:15:06] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[22:15:06] [PASSED] single_pixel_source_buffer
[22:15:06] [PASSED] single_pixel_clip_rectangle
[22:15:06] [PASSED] well_known_colors
[22:15:06] [PASSED] destination_pitch
[22:15:06] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[22:15:06] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[22:15:06] [PASSED] single_pixel_source_buffer
[22:15:06] [PASSED] single_pixel_clip_rectangle
[22:15:06] [PASSED] well_known_colors
[22:15:06] [PASSED] destination_pitch
[22:15:06] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[22:15:06] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[22:15:06] [PASSED] single_pixel_source_buffer
[22:15:06] [PASSED] single_pixel_clip_rectangle
[22:15:06] [PASSED] well_known_colors
[22:15:06] [PASSED] destination_pitch
[22:15:06] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[22:15:06] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[22:15:06] [PASSED] single_pixel_source_buffer
[22:15:06] [PASSED] single_pixel_clip_rectangle
[22:15:06] [PASSED] well_known_colors
[22:15:06] [PASSED] destination_pitch
[22:15:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[22:15:06] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[22:15:06] [PASSED] single_pixel_source_buffer
[22:15:06] [PASSED] single_pixel_clip_rectangle
[22:15:06] [PASSED] well_known_colors
[22:15:06] [PASSED] destination_pitch
[22:15:06] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[22:15:06] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[22:15:06] [PASSED] single_pixel_source_buffer
[22:15:06] [PASSED] single_pixel_clip_rectangle
[22:15:06] [PASSED] well_known_colors
[22:15:06] [PASSED] destination_pitch
[22:15:06] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[22:15:06] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[22:15:06] [PASSED] single_pixel_source_buffer
[22:15:06] [PASSED] single_pixel_clip_rectangle
[22:15:06] [PASSED] well_known_colors
[22:15:06] [PASSED] destination_pitch
[22:15:06] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[22:15:06] ============== drm_test_fb_xrgb8888_to_mono  ===============
[22:15:06] [PASSED] single_pixel_source_buffer
[22:15:06] [PASSED] single_pixel_clip_rectangle
[22:15:06] [PASSED] well_known_colors
[22:15:06] [PASSED] destination_pitch
[22:15:06] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[22:15:06] ==================== drm_test_fb_swab  =====================
[22:15:06] [PASSED] single_pixel_source_buffer
[22:15:06] [PASSED] single_pixel_clip_rectangle
[22:15:06] [PASSED] well_known_colors
[22:15:06] [PASSED] destination_pitch
[22:15:06] ================ [PASSED] drm_test_fb_swab =================
[22:15:06] ================= drm_test_fb_clip_offset  =================
[22:15:06] [PASSED] pass through
[22:15:06] [PASSED] horizontal offset
[22:15:06] [PASSED] vertical offset
[22:15:06] [PASSED] horizontal and vertical offset
[22:15:06] [PASSED] horizontal offset (custom pitch)
[22:15:06] [PASSED] vertical offset (custom pitch)
[22:15:06] [PASSED] horizontal and vertical offset (custom pitch)
[22:15:06] ============= [PASSED] drm_test_fb_clip_offset =============
[22:15:06] ============== drm_test_fb_build_fourcc_list  ==============
[22:15:06] [PASSED] no native formats
[22:15:06] [PASSED] XRGB8888 as native format
[22:15:06] [PASSED] remove duplicates
[22:15:06] [PASSED] convert alpha formats
[22:15:06] [PASSED] random formats
[22:15:06] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[22:15:06] =================== drm_test_fb_memcpy  ====================
[22:15:06] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[22:15:06] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[22:15:06] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[22:15:06] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[22:15:06] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[22:15:06] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[22:15:06] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[22:15:06] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[22:15:06] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[22:15:06] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[22:15:06] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[22:15:06] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[22:15:06] =============== [PASSED] drm_test_fb_memcpy ================
[22:15:06] ============= [PASSED] drm_format_helper_test ==============
[22:15:06] ======================= drm_format  ========================
[22:15:06] [PASSED] drm_test_format_block_width_invalid
[22:15:06] [PASSED] drm_test_format_block_width_one_plane
[22:15:06] [PASSED] drm_test_format_block_width_two_plane
[22:15:06] [PASSED] drm_test_format_block_width_three_plane
[22:15:06] [PASSED] drm_test_format_block_width_tiled
[22:15:06] [PASSED] drm_test_format_block_height_invalid
[22:15:06] [PASSED] drm_test_format_block_height_one_plane
[22:15:06] [PASSED] drm_test_format_block_height_two_plane
[22:15:06] [PASSED] drm_test_format_block_height_three_plane
[22:15:06] [PASSED] drm_test_format_block_height_tiled
[22:15:06] [PASSED] drm_test_format_min_pitch_invalid
[22:15:06] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[22:15:06] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[22:15:06] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[22:15:06] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[22:15:06] [PASSED] drm_test_format_min_pitch_two_plane
[22:15:06] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[22:15:06] [PASSED] drm_test_format_min_pitch_tiled
[22:15:06] =================== [PASSED] drm_format ====================
[22:15:06] ===================== drm_framebuffer  =====================
[22:15:06] =============== drm_test_framebuffer_create  ===============
[22:15:06] [PASSED] ABGR8888 normal sizes
[22:15:06] [PASSED] ABGR8888 max sizes
[22:15:06] [PASSED] ABGR8888 pitch greater than min required
[22:15:06] [PASSED] ABGR8888 pitch less than min required
[22:15:06] [PASSED] ABGR8888 Invalid width
[22:15:06] [PASSED] ABGR8888 Invalid buffer handle
[22:15:06] [PASSED] No pixel format
[22:15:06] [PASSED] ABGR8888 Width 0
[22:15:06] [PASSED] ABGR8888 Height 0
[22:15:06] [PASSED] ABGR8888 Out of bound height * pitch combination
[22:15:06] [PASSED] ABGR8888 Large buffer offset
[22:15:06] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[22:15:06] [PASSED] ABGR8888 Valid buffer modifier
[22:15:06] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[22:15:06] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[22:15:06] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[22:15:06] [PASSED] NV12 Normal sizes
[22:15:06] [PASSED] NV12 Max sizes
[22:15:06] [PASSED] NV12 Invalid pitch
[22:15:06] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[22:15:06] [PASSED] NV12 different  modifier per-plane
[22:15:06] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[22:15:06] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[22:15:06] [PASSED] NV12 Modifier for inexistent plane
[22:15:06] [PASSED] NV12 Handle for inexistent plane
[22:15:06] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[22:15:06] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[22:15:06] [PASSED] YVU420 Normal sizes
[22:15:06] [PASSED] YVU420 Max sizes
[22:15:06] [PASSED] YVU420 Invalid pitch
[22:15:06] [PASSED] YVU420 Different pitches
[22:15:06] [PASSED] YVU420 Different buffer offsets/pitches
[22:15:06] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[22:15:06] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[22:15:06] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[22:15:06] [PASSED] YVU420 Valid modifier
[22:15:06] [PASSED] YVU420 Different modifiers per plane
[22:15:06] [PASSED] YVU420 Modifier for inexistent plane
[22:15:06] [PASSED] X0L2 Normal sizes
[22:15:06] [PASSED] X0L2 Max sizes
[22:15:06] [PASSED] X0L2 Invalid pitch
[22:15:06] [PASSED] X0L2 Pitch greater than minimum required
[22:15:06] [PASSED] X0L2 Handle for inexistent plane
[22:15:06] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[22:15:06] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[22:15:06] [PASSED] X0L2 Valid modifier
[22:15:06] [PASSED] X0L2 Modifier for inexistent plane
[22:15:06] =========== [PASSED] drm_test_framebuffer_create ===========
[22:15:06] ================= [PASSED] drm_framebuffer =================
[22:15:06] ==================== drm-test-managed  =====================
[22:15:06] [PASSED] drm_test_managed_run_action
[22:15:06] ================ [PASSED] drm-test-managed =================
[22:15:06] ========================= drm_mm  ==========================
[22:15:06] [PASSED] drm_test_mm_init
[22:15:06] [PASSED] drm_test_mm_debug
[22:15:16] [PASSED] drm_test_mm_reserve
[22:15:26] [PASSED] drm_test_mm_insert
[22:15:27] [PASSED] drm_test_mm_replace
[22:15:27] [PASSED] drm_test_mm_insert_range
[22:15:27] [PASSED] drm_test_mm_frag
[22:15:27] [PASSED] drm_test_mm_align
[22:15:27] [PASSED] drm_test_mm_align32
[22:15:28] [PASSED] drm_test_mm_align64
[22:15:28] [PASSED] drm_test_mm_evict
[22:15:28] [PASSED] drm_test_mm_evict_range
[22:15:28] [PASSED] drm_test_mm_topdown
[22:15:28] [PASSED] drm_test_mm_bottomup
[22:15:28] [PASSED] drm_test_mm_lowest
[22:15:28] [PASSED] drm_test_mm_highest
[22:15:29] [PASSED] drm_test_mm_color
[22:15:29] [PASSED] drm_test_mm_color_evict
[22:15:29] [PASSED] drm_test_mm_color_evict_range
[22:15:29] ===================== [PASSED] drm_mm ======================
[22:15:29] =================== drm_modes_analog_tv  ===================
[22:15:29] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[22:15:29] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[22:15:29] [PASSED] drm_test_modes_analog_tv_pal_576i
[22:15:29] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[22:15:29] =============== [PASSED] drm_modes_analog_tv ===============
[22:15:29] ==================== drm_plane_helper  =====================
[22:15:29] =============== drm_test_check_plane_state  ================
[22:15:29] [PASSED] clipping_simple
[22:15:29] [PASSED] clipping_rotate_reflect
[22:15:29] [PASSED] positioning_simple
[22:15:29] [PASSED] upscaling
[22:15:29] [PASSED] downscaling
[22:15:29] [PASSED] rounding1
[22:15:29] [PASSED] rounding2
[22:15:29] [PASSED] rounding3
[22:15:29] [PASSED] rounding4
[22:15:29] =========== [PASSED] drm_test_check_plane_state ============
[22:15:29] =========== drm_test_check_invalid_plane_state  ============
[22:15:29] [PASSED] positioning_invalid
[22:15:29] [PASSED] upscaling_invalid
[22:15:29] [PASSED] downscaling_invalid
[22:15:29] ======= [PASSED] drm_test_check_invalid_plane_state ========
[22:15:29] ================ [PASSED] drm_plane_helper =================
[22:15:29] ============ drm_connector_helper_tv_get_modes  ============
[22:15:29] ====== drm_test_connector_helper_tv_get_modes_check  =======
[22:15:29] [PASSED] None
[22:15:29] [PASSED] PAL
[22:15:29] [PASSED] NTSC
[22:15:29] [PASSED] Both, NTSC Default
[22:15:29] [PASSED] Both, PAL Default
[22:15:29] [PASSED] Both, NTSC Default, with PAL on command-line
[22:15:29] [PASSED] Both, PAL Default, with NTSC on command-line
[22:15:29] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[22:15:29] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[22:15:29] ======================== drm_rect  =========================
[22:15:29] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[22:15:29] [PASSED] drm_test_rect_clip_scaled_not_clipped
[22:15:29] [PASSED] drm_test_rect_clip_scaled_clipped
[22:15:29] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[22:15:29] ================= drm_test_rect_intersect  =================
[22:15:29] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[22:15:29] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[22:15:29] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[22:15:29] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[22:15:29] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[22:15:29] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[22:15:29] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[22:15:29] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[22:15:29] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[22:15:29] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[22:15:29] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[22:15:29] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[22:15:29] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[22:15:29] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[22:15:29] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[22:15:29] ============= [PASSED] drm_test_rect_intersect =============
[22:15:29] ================ drm_test_rect_calc_hscale  ================
[22:15:29] [PASSED] normal use
[22:15:29] [PASSED] out of max range
[22:15:29] [PASSED] out of min range
[22:15:29] [PASSED] zero dst
[22:15:29] [PASSED] negative src
[22:15:29] [PASSED] negative dst
[22:15:29] ============ [PASSED] drm_test_rect_calc_hscale ============
[22:15:29] ================ drm_test_rect_calc_vscale  ================
[22:15:29] [PASSED] normal use
[22:15:29] [PASSED] out of max range
[22:15:29] [PASSED] out of min range
[22:15:29] [PASSED] zero dst
[22:15:29] [PASSED] negative src
[22:15:29] [PASSED] negative dst
[22:15:29] ============ [PASSED] drm_test_rect_calc_vscale ============
[22:15:29] ================== drm_test_rect_rotate  ===================
[22:15:29] [PASSED] reflect-x
[22:15:29] [PASSED] reflect-y
[22:15:29] [PASSED] rotate-0
[22:15:29] [PASSED] rotate-90
[22:15:29] [PASSED] rotate-180
[22:15:29] [PASSED] rotate-270
[22:15:29] ============== [PASSED] drm_test_rect_rotate ===============
[22:15:29] ================ drm_test_rect_rotate_inv  =================
[22:15:29] [PASSED] reflect-x
[22:15:29] [PASSED] reflect-y
[22:15:29] [PASSED] rotate-0
[22:15:29] [PASSED] rotate-90
[22:15:29] [PASSED] rotate-180
[22:15:29] [PASSED] rotate-270
[22:15:29] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[22:15:29] ==================== [PASSED] drm_rect =====================
[22:15:29] ======================== drm_exec  =========================
[22:15:29] [PASSED] sanitycheck
[22:15:29] [PASSED] test_lock
[22:15:29] [PASSED] test_lock_unlock
[22:15:29] [PASSED] test_duplicates
[22:15:29] [PASSED] test_prepare
[22:15:29] [PASSED] test_prepare_array
[22:15:29] [PASSED] test_multiple_loops
[22:15:29] ==================== [PASSED] drm_exec =====================
[22:15:29] ============================================================
[22:15:29] Testing complete. Ran 368 tests: passed: 368
[22:15:29] Elapsed time: 44.514s total, 1.674s configuring, 19.060s building, 23.772s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


