Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B31CC77B61
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 11:04:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1481010E094;
	Tue, 25 Apr 2023 11:04:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B0A2910E094;
 Tue, 25 Apr 2023 11:04:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id ACCBCAADEB;
 Tue, 25 Apr 2023 11:04:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Date: Tue, 25 Apr 2023 11:04:27 -0000
Message-ID: <168242066770.24066.14786811589584019062@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230425110107.932366-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20230425110107.932366-1-balasubramani.vivekanandan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe?=
 =?utf-8?q?=3A_Keep_all_resize_bar_related_prints_inside_xe=5Fresize=5Fvra?=
 =?utf-8?b?bV9iYXIgKHJldjIp?=
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

Series: drm/xe: Keep all resize bar related prints inside xe_resize_vram_bar (rev2)
URL   : https://patchwork.freedesktop.org/series/116924/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[11:03:16] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:03:20] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[11:03:42] Starting KUnit Kernel (1/1)...
[11:03:42] ============================================================
[11:03:42] ==================== xe_bo (2 subtests) ====================
[11:03:42] [SKIPPED] xe_ccs_migrate_kunit
[11:03:42] [SKIPPED] xe_bo_evict_kunit
[11:03:42] ===================== [SKIPPED] xe_bo ======================
[11:03:42] ================== xe_dma_buf (1 subtest) ==================
[11:03:42] [SKIPPED] xe_dma_buf_kunit
[11:03:42] =================== [SKIPPED] xe_dma_buf ===================
[11:03:42] ================== xe_migrate (1 subtest) ==================
[11:03:42] [SKIPPED] xe_migrate_sanity_kunit
[11:03:42] =================== [SKIPPED] xe_migrate ===================
[11:03:42] =================== xe_pci (2 subtests) ====================
[11:03:42] [PASSED] xe_gmdid_graphics_ip
[11:03:42] [PASSED] xe_gmdid_media_ip
[11:03:42] ===================== [PASSED] xe_pci ======================
[11:03:42] ==================== xe_rtp (1 subtest) ====================
[11:03:42] ================== xe_rtp_process_tests  ===================
[11:03:42] [PASSED] coalesce-same-reg
[11:03:42] [PASSED] no-match-no-add
[11:03:42] [PASSED] no-match-no-add-multiple-rules
[11:03:42] [PASSED] two-regs-two-entries
[11:03:42] [PASSED] clr-one-set-other
[11:03:42] [PASSED] set-field
[11:03:42] [PASSED] conflict-duplicate
[11:03:42] [PASSED] conflict-not-disjoint
[11:03:42] [PASSED] conflict-reg-type
[11:03:42] ============== [PASSED] xe_rtp_process_tests ===============
[11:03:42] ===================== [PASSED] xe_rtp ======================
[11:03:42] ==================== xe_wa (1 subtest) =====================
[11:03:42] ======================== xe_wa_gt  =========================
[11:03:42] [PASSED] TIGERLAKE (B0)
[11:03:42] [PASSED] DG1 (A0)
[11:03:42] [PASSED] DG1 (B0)
[11:03:42] [PASSED] ALDERLAKE_S (A0)
[11:03:42] [PASSED] ALDERLAKE_S (B0)
[11:03:42] [PASSED] ALDERLAKE_S (C0)
[11:03:42] [PASSED] ALDERLAKE_S (D0)
[11:03:42] [PASSED] DG2_G10 (A0)
[11:03:42] [PASSED] DG2_G10 (A1)
[11:03:42] [PASSED] DG2_G10 (B0)
[11:03:42] [PASSED] DG2_G10 (C0)
[11:03:42] [PASSED] DG2_G11 (A0)
[11:03:42] [PASSED] DG2_G11 (B0)
[11:03:42] [PASSED] DG2_G11 (B1)
[11:03:42] [PASSED] DG2_G12 (A0)
[11:03:42] [PASSED] DG2_G12 (A1)
[11:03:42] [PASSED] PVC (B0)
[11:03:42] [PASSED] PVC (B1)
[11:03:42] [PASSED] PVC (C0)
[11:03:42] ==================== [PASSED] xe_wa_gt =====================
[11:03:42] ====================== [PASSED] xe_wa ======================
[11:03:42] ============================================================
[11:03:42] Testing complete. Ran 34 tests: passed: 30, skipped: 4
[11:03:42] Elapsed time: 26.211s total, 4.193s configuring, 21.848s building, 0.138s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[11:03:42] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:03:44] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[11:04:02] Starting KUnit Kernel (1/1)...
[11:04:02] ============================================================
[11:04:02] ============ drm_test_pick_cmdline (2 subtests) ============
[11:04:02] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[11:04:02] =============== drm_test_pick_cmdline_named  ===============
[11:04:02] [PASSED] NTSC
[11:04:02] [PASSED] NTSC-J
[11:04:02] [PASSED] PAL
[11:04:02] [PASSED] PAL-M
[11:04:02] =========== [PASSED] drm_test_pick_cmdline_named ===========
[11:04:02] ============== [PASSED] drm_test_pick_cmdline ==============
[11:04:02] ================== drm_buddy (6 subtests) ==================
[11:04:02] [PASSED] drm_test_buddy_alloc_limit
[11:04:02] [PASSED] drm_test_buddy_alloc_range
[11:04:02] [PASSED] drm_test_buddy_alloc_optimistic
[11:04:03] [PASSED] drm_test_buddy_alloc_pessimistic
[11:04:03] [PASSED] drm_test_buddy_alloc_smoke
[11:04:03] [PASSED] drm_test_buddy_alloc_pathological
[11:04:03] ==================== [PASSED] drm_buddy ====================
[11:04:03] ============= drm_cmdline_parser (40 subtests) =============
[11:04:03] [PASSED] drm_test_cmdline_force_d_only
[11:04:03] [PASSED] drm_test_cmdline_force_D_only_dvi
[11:04:03] [PASSED] drm_test_cmdline_force_D_only_hdmi
[11:04:03] [PASSED] drm_test_cmdline_force_D_only_not_digital
[11:04:03] [PASSED] drm_test_cmdline_force_e_only
[11:04:03] [PASSED] drm_test_cmdline_res
[11:04:03] [PASSED] drm_test_cmdline_res_vesa
[11:04:03] [PASSED] drm_test_cmdline_res_vesa_rblank
[11:04:03] [PASSED] drm_test_cmdline_res_rblank
[11:04:03] [PASSED] drm_test_cmdline_res_bpp
[11:04:03] [PASSED] drm_test_cmdline_res_refresh
[11:04:03] [PASSED] drm_test_cmdline_res_bpp_refresh
[11:04:03] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[11:04:03] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[11:04:03] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[11:04:03] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[11:04:03] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[11:04:03] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[11:04:03] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[11:04:03] [PASSED] drm_test_cmdline_res_margins_force_on
[11:04:03] [PASSED] drm_test_cmdline_res_vesa_margins
[11:04:03] [PASSED] drm_test_cmdline_name
[11:04:03] [PASSED] drm_test_cmdline_name_bpp
[11:04:03] [PASSED] drm_test_cmdline_name_option
[11:04:03] [PASSED] drm_test_cmdline_name_bpp_option
[11:04:03] [PASSED] drm_test_cmdline_rotate_0
[11:04:03] [PASSED] drm_test_cmdline_rotate_90
[11:04:03] [PASSED] drm_test_cmdline_rotate_180
[11:04:03] [PASSED] drm_test_cmdline_rotate_270
[11:04:03] [PASSED] drm_test_cmdline_hmirror
[11:04:03] [PASSED] drm_test_cmdline_vmirror
[11:04:03] [PASSED] drm_test_cmdline_margin_options
[11:04:03] [PASSED] drm_test_cmdline_multiple_options
[11:04:03] [PASSED] drm_test_cmdline_bpp_extra_and_option
[11:04:03] [PASSED] drm_test_cmdline_extra_and_option
[11:04:03] [PASSED] drm_test_cmdline_freestanding_options
[11:04:03] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[11:04:03] [PASSED] drm_test_cmdline_panel_orientation
[11:04:03] ================ drm_test_cmdline_invalid  =================
[11:04:03] [PASSED] margin_only
[11:04:03] [PASSED] interlace_only
[11:04:03] [PASSED] res_missing_x
[11:04:03] [PASSED] res_missing_y
[11:04:03] [PASSED] res_bad_y
[11:04:03] [PASSED] res_missing_y_bpp
[11:04:03] [PASSED] res_bad_bpp
[11:04:03] [PASSED] res_bad_refresh
[11:04:03] [PASSED] res_bpp_refresh_force_on_off
[11:04:03] [PASSED] res_invalid_mode
[11:04:03] [PASSED] res_bpp_wrong_place_mode
[11:04:03] [PASSED] name_bpp_refresh
[11:04:03] [PASSED] name_refresh
[11:04:03] [PASSED] name_refresh_wrong_mode
[11:04:03] [PASSED] name_refresh_invalid_mode
[11:04:03] [PASSED] rotate_multiple
[11:04:03] [PASSED] rotate_invalid_val
[11:04:03] [PASSED] rotate_truncated
[11:04:03] [PASSED] invalid_option
[11:04:03] [PASSED] invalid_tv_option
[11:04:03] [PASSED] truncated_tv_option
[11:04:03] ============ [PASSED] drm_test_cmdline_invalid =============
[11:04:03] =============== drm_test_cmdline_tv_options  ===============
[11:04:03] [PASSED] NTSC
[11:04:03] [PASSED] NTSC_443
[11:04:03] [PASSED] NTSC_J
[11:04:03] [PASSED] PAL
[11:04:03] [PASSED] PAL_M
[11:04:03] [PASSED] PAL_N
[11:04:03] [PASSED] SECAM
[11:04:03] =========== [PASSED] drm_test_cmdline_tv_options ===========
[11:04:03] =============== [PASSED] drm_cmdline_parser ================
[11:04:03] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[11:04:03] ========== drm_test_get_tv_mode_from_name_valid  ===========
[11:04:03] [PASSED] NTSC
[11:04:03] [PASSED] NTSC-443
[11:04:03] [PASSED] NTSC-J
[11:04:03] [PASSED] PAL
[11:04:03] [PASSED] PAL-M
[11:04:03] [PASSED] PAL-N
[11:04:03] [PASSED] SECAM
[11:04:03] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[11:04:03] [PASSED] drm_test_get_tv_mode_from_name_truncated
[11:04:03] ============ [PASSED] drm_get_tv_mode_from_name ============
[11:04:03] ============= drm_damage_helper (21 subtests) ==============
[11:04:03] [PASSED] drm_test_damage_iter_no_damage
[11:04:03] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[11:04:03] [PASSED] drm_test_damage_iter_no_damage_src_moved
[11:04:03] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[11:04:03] [PASSED] drm_test_damage_iter_no_damage_not_visible
[11:04:03] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[11:04:03] [PASSED] drm_test_damage_iter_no_damage_no_fb
[11:04:03] [PASSED] drm_test_damage_iter_simple_damage
[11:04:03] [PASSED] drm_test_damage_iter_single_damage
[11:04:03] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[11:04:03] [PASSED] drm_test_damage_iter_single_damage_outside_src
[11:04:03] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[11:04:03] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[11:04:03] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[11:04:03] [PASSED] drm_test_damage_iter_single_damage_src_moved
[11:04:03] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[11:04:03] [PASSED] drm_test_damage_iter_damage
[11:04:03] [PASSED] drm_test_damage_iter_damage_one_intersect
[11:04:03] [PASSED] drm_test_damage_iter_damage_one_outside
[11:04:03] [PASSED] drm_test_damage_iter_damage_src_moved
[11:04:03] [PASSED] drm_test_damage_iter_damage_not_visible
[11:04:03] ================ [PASSED] drm_damage_helper ================
[11:04:03] ============== drm_dp_mst_helper (2 subtests) ==============
[11:04:03] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[11:04:03] [PASSED] Clock 154000 BPP 30 DSC disabled
[11:04:03] [PASSED] Clock 234000 BPP 30 DSC disabled
[11:04:03] [PASSED] Clock 297000 BPP 24 DSC disabled
[11:04:03] [PASSED] Clock 332880 BPP 24 DSC enabled
[11:04:03] [PASSED] Clock 324540 BPP 24 DSC enabled
[11:04:03] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[11:04:03] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[11:04:03] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[11:04:03] [PASSED] DP_POWER_UP_PHY with port number
[11:04:03] [PASSED] DP_POWER_DOWN_PHY with port number
[11:04:03] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[11:04:03] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[11:04:03] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[11:04:03] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[11:04:03] [PASSED] DP_QUERY_PAYLOAD with port number
[11:04:03] [PASSED] DP_QUERY_PAYLOAD with VCPI
[11:04:03] [PASSED] DP_REMOTE_DPCD_READ with port number
[11:04:03] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[11:04:03] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[11:04:03] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[11:04:03] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[11:04:03] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[11:04:03] [PASSED] DP_REMOTE_I2C_READ with port number
[11:04:03] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[11:04:03] [PASSED] DP_REMOTE_I2C_READ with transactions array
[11:04:03] [PASSED] DP_REMOTE_I2C_WRITE with port number
[11:04:03] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[11:04:03] [PASSED] DP_REMOTE_I2C_WRITE with data array
[11:04:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[11:04:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[11:04:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[11:04:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[11:04:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[11:04:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[11:04:03] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[11:04:03] ================ [PASSED] drm_dp_mst_helper ================
[11:04:03] =========== drm_format_helper_test (11 subtests) ===========
[11:04:03] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[11:04:03] [PASSED] single_pixel_source_buffer
[11:04:03] [PASSED] single_pixel_clip_rectangle
[11:04:03] [PASSED] well_known_colors
[11:04:03] [PASSED] destination_pitch
[11:04:03] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[11:04:03] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[11:04:03] [PASSED] single_pixel_source_buffer
[11:04:03] [PASSED] single_pixel_clip_rectangle
[11:04:03] [PASSED] well_known_colors
[11:04:03] [PASSED] destination_pitch
[11:04:03] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[11:04:03] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[11:04:03] [PASSED] single_pixel_source_buffer
[11:04:03] [PASSED] single_pixel_clip_rectangle
[11:04:03] [PASSED] well_known_colors
[11:04:03] [PASSED] destination_pitch
[11:04:03] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[11:04:03] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[11:04:03] [PASSED] single_pixel_source_buffer
[11:04:03] [PASSED] single_pixel_clip_rectangle
[11:04:03] [PASSED] well_known_colors
[11:04:03] [PASSED] destination_pitch
[11:04:03] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[11:04:03] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[11:04:03] [PASSED] single_pixel_source_buffer
[11:04:03] [PASSED] single_pixel_clip_rectangle
[11:04:03] [PASSED] well_known_colors
[11:04:03] [PASSED] destination_pitch
[11:04:03] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[11:04:03] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[11:04:03] [PASSED] single_pixel_source_buffer
[11:04:03] [PASSED] single_pixel_clip_rectangle
[11:04:03] [PASSED] well_known_colors
[11:04:03] [PASSED] destination_pitch
[11:04:03] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[11:04:03] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[11:04:03] [PASSED] single_pixel_source_buffer
[11:04:03] [PASSED] single_pixel_clip_rectangle
[11:04:03] [PASSED] well_known_colors
[11:04:03] [PASSED] destination_pitch
[11:04:03] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[11:04:03] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[11:04:03] [PASSED] single_pixel_source_buffer
[11:04:03] [PASSED] single_pixel_clip_rectangle
[11:04:03] [PASSED] well_known_colors
[11:04:03] [PASSED] destination_pitch
[11:04:03] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[11:04:03] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[11:04:03] [PASSED] single_pixel_source_buffer
[11:04:03] [PASSED] single_pixel_clip_rectangle
[11:04:03] [PASSED] well_known_colors
[11:04:03] [PASSED] destination_pitch
[11:04:03] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[11:04:03] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[11:04:03] [PASSED] single_pixel_source_buffer
[11:04:03] [PASSED] single_pixel_clip_rectangle
[11:04:03] [PASSED] well_known_colors
[11:04:03] [PASSED] destination_pitch
[11:04:03] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[11:04:03] ============== drm_test_fb_xrgb8888_to_mono  ===============
[11:04:03] [PASSED] single_pixel_source_buffer
[11:04:03] [PASSED] single_pixel_clip_rectangle
[11:04:03] [PASSED] well_known_colors
[11:04:03] [PASSED] destination_pitch
[11:04:03] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[11:04:03] ============= [PASSED] drm_format_helper_test ==============
[11:04:03] ================= drm_format (18 subtests) =================
[11:04:03] [PASSED] drm_test_format_block_width_invalid
[11:04:03] [PASSED] drm_test_format_block_width_one_plane
[11:04:03] [PASSED] drm_test_format_block_width_two_plane
[11:04:03] [PASSED] drm_test_format_block_width_three_plane
[11:04:03] [PASSED] drm_test_format_block_width_tiled
[11:04:03] [PASSED] drm_test_format_block_height_invalid
[11:04:03] [PASSED] drm_test_format_block_height_one_plane
[11:04:03] [PASSED] drm_test_format_block_height_two_plane
[11:04:03] [PASSED] drm_test_format_block_height_three_plane
[11:04:03] [PASSED] drm_test_format_block_height_tiled
[11:04:03] [PASSED] drm_test_format_min_pitch_invalid
[11:04:03] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[11:04:03] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[11:04:03] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[11:04:03] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[11:04:03] [PASSED] drm_test_format_min_pitch_two_plane
[11:04:03] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[11:04:03] [PASSED] drm_test_format_min_pitch_tiled
[11:04:03] =================== [PASSED] drm_format ====================
[11:04:03] =============== drm_framebuffer (1 subtest) ================
[11:04:03] =============== drm_test_framebuffer_create  ===============
[11:04:03] [PASSED] ABGR8888 normal sizes
[11:04:03] [PASSED] ABGR8888 max sizes
[11:04:03] [PASSED] ABGR8888 pitch greater than min required
[11:04:03] [PASSED] ABGR8888 pitch less than min required
[11:04:03] [PASSED] ABGR8888 Invalid width
[11:04:03] [PASSED] ABGR8888 Invalid buffer handle
[11:04:03] [PASSED] No pixel format
[11:04:03] [PASSED] ABGR8888 Width 0
[11:04:03] [PASSED] ABGR8888 Height 0
[11:04:03] [PASSED] ABGR8888 Out of bound height * pitch combination
[11:04:03] [PASSED] ABGR8888 Large buffer offset
[11:04:03] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[11:04:03] [PASSED] ABGR8888 Valid buffer modifier
[11:04:03] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[11:04:03] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[11:04:03] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[11:04:03] [PASSED] NV12 Normal sizes
[11:04:03] [PASSED] NV12 Max sizes
[11:04:03] [PASSED] NV12 Invalid pitch
[11:04:03] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[11:04:03] [PASSED] NV12 different  modifier per-plane
[11:04:03] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[11:04:03] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[11:04:03] [PASSED] NV12 Modifier for inexistent plane
[11:04:03] [PASSED] NV12 Handle for inexistent plane
[11:04:03] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[11:04:03] [PASSED] YVU420 Normal sizes
[11:04:03] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[11:04:03] [PASSED] YVU420 Max sizes
[11:04:03] [PASSED] YVU420 Invalid pitch
[11:04:03] [PASSED] YVU420 Different pitches
[11:04:03] [PASSED] YVU420 Different buffer offsets/pitches
[11:04:03] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[11:04:03] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[11:04:03] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[11:04:03] [PASSED] YVU420 Valid modifier
[11:04:03] [PASSED] YVU420 Different modifiers per plane
[11:04:03] [PASSED] YVU420 Modifier for inexistent plane
[11:04:03] [PASSED] X0L2 Normal sizes
[11:04:03] [PASSED] X0L2 Max sizes
[11:04:03] [PASSED] X0L2 Invalid pitch
[11:04:03] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[11:04:03] [PASSED] X0L2 Handle for inexistent plane
[11:04:03] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[11:04:03] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[11:04:03] [PASSED] X0L2 Valid modifier
[11:04:03] [PASSED] X0L2 Modifier for inexistent plane
[11:04:03] =========== [PASSED] drm_test_framebuffer_create ===========
[11:04:03] ================= [PASSED] drm_framebuffer =================
[11:04:03] =============== drm-test-managed (1 subtest) ===============
[11:04:03] [PASSED] drm_test_managed_run_action
[11:04:03] ================ [PASSED] drm-test-managed =================
[11:04:03] =================== drm_mm (19 subtests) ===================
[11:04:03] [PASSED] drm_test_mm_init
[11:04:03] [PASSED] drm_test_mm_debug
[11:04:13] [PASSED] drm_test_mm_reserve
[11:04:22] [PASSED] drm_test_mm_insert
[11:04:23] [PASSED] drm_test_mm_replace
[11:04:23] [PASSED] drm_test_mm_insert_range
[11:04:23] [PASSED] drm_test_mm_frag
[11:04:23] [PASSED] drm_test_mm_align
[11:04:23] [PASSED] drm_test_mm_align32
[11:04:24] [PASSED] drm_test_mm_align64
[11:04:24] [PASSED] drm_test_mm_evict
[11:04:24] [PASSED] drm_test_mm_evict_range
[11:04:24] [PASSED] drm_test_mm_topdown
[11:04:24] [PASSED] drm_test_mm_bottomup
[11:04:24] [PASSED] drm_test_mm_lowest
[11:04:24] [PASSED] drm_test_mm_highest
[11:04:25] [PASSED] drm_test_mm_color
[11:04:25] [PASSED] drm_test_mm_color_evict
[11:04:25] [PASSED] drm_test_mm_color_evict_range
[11:04:25] ===================== [PASSED] drm_mm ======================
[11:04:25] ============= drm_modes_analog_tv (4 subtests) =============
[11:04:25] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[11:04:25] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[11:04:25] [PASSED] drm_test_modes_analog_tv_pal_576i
[11:04:25] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[11:04:25] =============== [PASSED] drm_modes_analog_tv ===============
[11:04:25] ============== drm_plane_helper (2 subtests) ===============
[11:04:25] =============== drm_test_check_plane_state  ================
[11:04:25] [PASSED] clipping_simple
[11:04:25] [PASSED] clipping_rotate_reflect
[11:04:25] [PASSED] positioning_simple
[11:04:25] [PASSED] upscaling
[11:04:25] [PASSED] downscaling
[11:04:25] [PASSED] rounding1
[11:04:25] [PASSED] rounding2
[11:04:25] [PASSED] rounding3
[11:04:25] [PASSED] rounding4
[11:04:25] =========== [PASSED] drm_test_check_plane_state ============
[11:04:25] =========== drm_test_check_invalid_plane_state  ============
[11:04:25] [PASSED] positioning_invalid
[11:04:25] [PASSED] upscaling_invalid
[11:04:25] [PASSED] downscaling_invalid
[11:04:25] ======= [PASSED] drm_test_check_invalid_plane_state ========
[11:04:25] ================ [PASSED] drm_plane_helper =================
[11:04:25] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[11:04:25] ====== drm_test_connector_helper_tv_get_modes_check  =======
[11:04:25] [PASSED] None
[11:04:25] [PASSED] PAL
[11:04:25] [PASSED] NTSC
[11:04:25] [PASSED] Both, NTSC Default
[11:04:25] [PASSED] Both, PAL Default
[11:04:25] [PASSED] Both, NTSC Default, with PAL on command-line
[11:04:25] [PASSED] Both, PAL Default, with NTSC on command-line
[11:04:25] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[11:04:25] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[11:04:25] ================== drm_rect (4 subtests) ===================
[11:04:25] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[11:04:25] [PASSED] drm_test_rect_clip_scaled_not_clipped
[11:04:25] [PASSED] drm_test_rect_clip_scaled_clipped
[11:04:25] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[11:04:25] ==================== [PASSED] drm_rect =====================
[11:04:25] ============================================================
[11:04:25] Testing complete. Ran 294 tests: passed: 294
[11:04:25] Elapsed time: 43.353s total, 1.682s configuring, 18.239s building, 23.386s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


