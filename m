Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED824C3DA6E
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 02:28:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA65210E2D9;
	Thu,  4 Jan 2024 02:28:02 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D80210E2D9;
 Thu,  4 Jan 2024 02:28:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/debugfs=3A_Add_support_?=
 =?utf-8?q?for_gt_synchronous_force_reset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
Date: Thu, 04 Jan 2024 02:28:01 -0000
Message-ID: <170433528164.1406.1653240580376533989@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20231231144733.568481-1-karthik.poosa@intel.com>
In-Reply-To: <20231231144733.568481-1-karthik.poosa@intel.com>
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

Series: drm/xe/debugfs: Add support for gt synchronous force reset
URL   : https://patchwork.freedesktop.org/series/128088/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[02:27:09] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:27:14] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[02:27:37] Starting KUnit Kernel (1/1)...
[02:27:37] ============================================================
[02:27:37] ========================= guc_dbm  =========================
[02:27:37] [PASSED] test_empty
[02:27:37] [PASSED] test_default
[02:27:37] ======================== test_size  ========================
[02:27:37] [PASSED] 4
[02:27:37] [PASSED] 8
[02:27:37] [PASSED] 32
[02:27:37] [PASSED] 256
[02:27:37] ==================== [PASSED] test_size ====================
[02:27:37] ======================= test_reuse  ========================
[02:27:37] [PASSED] 4
[02:27:37] [PASSED] 8
[02:27:37] [PASSED] 32
[02:27:37] [PASSED] 256
[02:27:37] =================== [PASSED] test_reuse ====================
[02:27:37] =================== test_range_overlap  ====================
[02:27:37] [PASSED] 4
[02:27:37] [PASSED] 8
[02:27:37] [PASSED] 32
[02:27:37] [PASSED] 256
[02:27:37] =============== [PASSED] test_range_overlap ================
[02:27:37] =================== test_range_compact  ====================
[02:27:37] [PASSED] 4
[02:27:37] [PASSED] 8
[02:27:37] [PASSED] 32
[02:27:37] [PASSED] 256
[02:27:37] =============== [PASSED] test_range_compact ================
[02:27:37] ==================== test_range_spare  =====================
[02:27:37] [PASSED] 4
[02:27:37] [PASSED] 8
[02:27:37] [PASSED] 32
[02:27:37] [PASSED] 256
[02:27:37] ================ [PASSED] test_range_spare =================
[02:27:37] ===================== [PASSED] guc_dbm =====================
[02:27:37] ========================== lmtt  ===========================
[02:27:37] ======================== test_ops  =========================
[02:27:37] [PASSED] 2-level
[02:27:37] [PASSED] multi-level
[02:27:37] ==================== [PASSED] test_ops =====================
[02:27:37] ====================== [PASSED] lmtt =======================
[02:27:37] ========================== xe_bo  ==========================
[02:27:37] [SKIPPED] xe_ccs_migrate_kunit
[02:27:37] [SKIPPED] xe_bo_evict_kunit
[02:27:37] ===================== [SKIPPED] xe_bo ======================
[02:27:37] ======================= xe_dma_buf  ========================
[02:27:37] [SKIPPED] xe_dma_buf_kunit
[02:27:37] =================== [SKIPPED] xe_dma_buf ===================
[02:27:37] ======================= xe_migrate  ========================
[02:27:37] [SKIPPED] xe_migrate_sanity_kunit
[02:27:37] =================== [SKIPPED] xe_migrate ===================
[02:27:37] ========================= xe_mocs  =========================
[02:27:37] [SKIPPED] xe_live_mocs_kernel_kunit
[02:27:37] ==================== [SKIPPED] xe_mocs =====================
[02:27:37] ========================= xe_pci  ==========================
[02:27:37] [PASSED] xe_gmdid_graphics_ip
[02:27:37] [PASSED] xe_gmdid_media_ip
[02:27:37] ===================== [PASSED] xe_pci ======================
[02:27:37] ========================= xe_rtp  ==========================
[02:27:37] ================== xe_rtp_process_tests  ===================
[02:27:37] [PASSED] coalesce-same-reg
[02:27:37] [PASSED] no-match-no-add
[02:27:37] [PASSED] no-match-no-add-multiple-rules
[02:27:37] [PASSED] two-regs-two-entries
[02:27:37] [PASSED] clr-one-set-other
[02:27:37] [PASSED] set-field
[02:27:37] [PASSED] conflict-duplicate
[02:27:37] [PASSED] conflict-not-disjoint
[02:27:37] [PASSED] conflict-reg-type
[02:27:37] ============== [PASSED] xe_rtp_process_tests ===============
[02:27:37] ===================== [PASSED] xe_rtp ======================
[02:27:37] ========================== xe_wa  ==========================
[02:27:37] ======================== xe_wa_gt  =========================
[02:27:37] [PASSED] TIGERLAKE (B0)
[02:27:37] [PASSED] DG1 (A0)
[02:27:37] [PASSED] DG1 (B0)
[02:27:37] [PASSED] ALDERLAKE_S (A0)
[02:27:37] [PASSED] ALDERLAKE_S (B0)
[02:27:37] [PASSED] ALDERLAKE_S (C0)
[02:27:37] [PASSED] ALDERLAKE_S (D0)
[02:27:37] [PASSED] ALDERLAKE_P (A0)
[02:27:37] [PASSED] ALDERLAKE_P (B0)
[02:27:37] [PASSED] ALDERLAKE_P (C0)
[02:27:37] [PASSED] ALDERLAKE_S_RPLS (D0)
[02:27:37] [PASSED] ALDERLAKE_P_RPLU (E0)
[02:27:37] [PASSED] DG2_G10 (A0)
[02:27:37] [PASSED] DG2_G10 (A1)
[02:27:37] [PASSED] DG2_G10 (B0)
[02:27:37] [PASSED] DG2_G10 (C0)
[02:27:37] [PASSED] DG2_G11 (A0)
[02:27:37] [PASSED] DG2_G11 (B0)
[02:27:37] [PASSED] DG2_G11 (B1)
[02:27:37] [PASSED] DG2_G12 (A0)
[02:27:37] [PASSED] DG2_G12 (A1)
[02:27:37] [PASSED] PVC (B0)
[02:27:37] [PASSED] PVC (B1)
[02:27:37] [PASSED] PVC (C0)
[02:27:37] [PASSED] METEORLAKE (g:A0, m:A0)
[02:27:37] [PASSED] METEORLAKE (g:A0, m:A0)
[02:27:37] [PASSED] LUNARLAKE (g:A0, m:A0)
[02:27:37] [PASSED] LUNARLAKE (g:B0, m:A0)
[02:27:37] ==================== [PASSED] xe_wa_gt =====================
[02:27:37] ====================== [PASSED] xe_wa ======================
[02:27:37] ============================================================
[02:27:37] Testing complete. Ran 68 tests: passed: 63, skipped: 5
[02:27:37] Elapsed time: 27.670s total, 4.208s configuring, 23.242s building, 0.165s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[02:27:37] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:27:39] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[02:27:59] Starting KUnit Kernel (1/1)...
[02:27:59] ============================================================
[02:27:59] ================== drm_test_pick_cmdline  ==================
[02:27:59] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[02:27:59] =============== drm_test_pick_cmdline_named  ===============
[02:27:59] [PASSED] NTSC
[02:27:59] [PASSED] NTSC-J
[02:27:59] [PASSED] PAL
[02:27:59] [PASSED] PAL-M
[02:27:59] =========== [PASSED] drm_test_pick_cmdline_named ===========
[02:27:59] ============== [PASSED] drm_test_pick_cmdline ==============
[02:27:59] ======================== drm_buddy  ========================
[02:27:59] [PASSED] drm_test_buddy_alloc_limit
[02:27:59] [PASSED] drm_test_buddy_alloc_optimistic
[02:27:59] [PASSED] drm_test_buddy_alloc_pessimistic
[02:27:59] [PASSED] drm_test_buddy_alloc_pathological
[02:27:59] ==================== [PASSED] drm_buddy ====================
[02:27:59] =================== drm_cmdline_parser  ====================
[02:27:59] [PASSED] drm_test_cmdline_force_d_only
[02:27:59] [PASSED] drm_test_cmdline_force_D_only_dvi
[02:27:59] [PASSED] drm_test_cmdline_force_D_only_hdmi
[02:27:59] [PASSED] drm_test_cmdline_force_D_only_not_digital
[02:27:59] [PASSED] drm_test_cmdline_force_e_only
[02:27:59] [PASSED] drm_test_cmdline_res
[02:27:59] [PASSED] drm_test_cmdline_res_vesa
[02:27:59] [PASSED] drm_test_cmdline_res_vesa_rblank
[02:27:59] [PASSED] drm_test_cmdline_res_rblank
[02:27:59] [PASSED] drm_test_cmdline_res_bpp
[02:27:59] [PASSED] drm_test_cmdline_res_refresh
[02:27:59] [PASSED] drm_test_cmdline_res_bpp_refresh
[02:27:59] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[02:27:59] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[02:27:59] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[02:27:59] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[02:27:59] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[02:27:59] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[02:27:59] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[02:27:59] [PASSED] drm_test_cmdline_res_margins_force_on
[02:27:59] [PASSED] drm_test_cmdline_res_vesa_margins
[02:27:59] [PASSED] drm_test_cmdline_name
[02:27:59] [PASSED] drm_test_cmdline_name_bpp
[02:27:59] [PASSED] drm_test_cmdline_name_option
[02:27:59] [PASSED] drm_test_cmdline_name_bpp_option
[02:27:59] [PASSED] drm_test_cmdline_rotate_0
[02:27:59] [PASSED] drm_test_cmdline_rotate_90
[02:27:59] [PASSED] drm_test_cmdline_rotate_180
[02:27:59] [PASSED] drm_test_cmdline_rotate_270
[02:27:59] [PASSED] drm_test_cmdline_hmirror
[02:27:59] [PASSED] drm_test_cmdline_vmirror
[02:27:59] [PASSED] drm_test_cmdline_margin_options
[02:27:59] [PASSED] drm_test_cmdline_multiple_options
[02:27:59] [PASSED] drm_test_cmdline_bpp_extra_and_option
[02:27:59] [PASSED] drm_test_cmdline_extra_and_option
[02:27:59] [PASSED] drm_test_cmdline_freestanding_options
[02:27:59] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[02:27:59] [PASSED] drm_test_cmdline_panel_orientation
[02:27:59] ================ drm_test_cmdline_invalid  =================
[02:27:59] [PASSED] margin_only
[02:27:59] [PASSED] interlace_only
[02:27:59] [PASSED] res_missing_x
[02:27:59] [PASSED] res_missing_y
[02:27:59] [PASSED] res_bad_y
[02:27:59] [PASSED] res_missing_y_bpp
[02:27:59] [PASSED] res_bad_bpp
[02:27:59] [PASSED] res_bad_refresh
[02:27:59] [PASSED] res_bpp_refresh_force_on_off
[02:27:59] [PASSED] res_invalid_mode
[02:27:59] [PASSED] res_bpp_wrong_place_mode
[02:27:59] [PASSED] name_bpp_refresh
[02:27:59] [PASSED] name_refresh
[02:27:59] [PASSED] name_refresh_wrong_mode
[02:27:59] [PASSED] name_refresh_invalid_mode
[02:27:59] [PASSED] rotate_multiple
[02:27:59] [PASSED] rotate_invalid_val
[02:27:59] [PASSED] rotate_truncated
[02:27:59] [PASSED] invalid_option
[02:27:59] [PASSED] invalid_tv_option
[02:27:59] [PASSED] truncated_tv_option
[02:27:59] ============ [PASSED] drm_test_cmdline_invalid =============
[02:27:59] =============== drm_test_cmdline_tv_options  ===============
[02:27:59] [PASSED] NTSC
[02:27:59] [PASSED] NTSC_443
[02:27:59] [PASSED] NTSC_J
[02:27:59] [PASSED] PAL
[02:27:59] [PASSED] PAL_M
[02:27:59] [PASSED] PAL_N
[02:27:59] [PASSED] SECAM
[02:27:59] =========== [PASSED] drm_test_cmdline_tv_options ===========
[02:27:59] =============== [PASSED] drm_cmdline_parser ================
[02:27:59] ================ drm_get_tv_mode_from_name  ================
[02:27:59] ========== drm_test_get_tv_mode_from_name_valid  ===========
[02:27:59] [PASSED] NTSC
[02:27:59] [PASSED] NTSC-443
[02:27:59] [PASSED] NTSC-J
[02:27:59] [PASSED] PAL
[02:27:59] [PASSED] PAL-M
[02:27:59] [PASSED] PAL-N
[02:27:59] [PASSED] SECAM
[02:27:59] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[02:27:59] [PASSED] drm_test_get_tv_mode_from_name_truncated
[02:27:59] ============ [PASSED] drm_get_tv_mode_from_name ============
[02:27:59] ==================== drm_damage_helper  ====================
[02:27:59] [PASSED] drm_test_damage_iter_no_damage
[02:27:59] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[02:27:59] [PASSED] drm_test_damage_iter_no_damage_src_moved
[02:27:59] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[02:27:59] [PASSED] drm_test_damage_iter_no_damage_not_visible
[02:27:59] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[02:27:59] [PASSED] drm_test_damage_iter_no_damage_no_fb
[02:27:59] [PASSED] drm_test_damage_iter_simple_damage
[02:27:59] [PASSED] drm_test_damage_iter_single_damage
[02:27:59] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[02:27:59] [PASSED] drm_test_damage_iter_single_damage_outside_src
[02:27:59] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[02:27:59] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[02:27:59] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[02:27:59] [PASSED] drm_test_damage_iter_single_damage_src_moved
[02:27:59] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[02:27:59] [PASSED] drm_test_damage_iter_damage
[02:27:59] [PASSED] drm_test_damage_iter_damage_one_intersect
[02:27:59] [PASSED] drm_test_damage_iter_damage_one_outside
[02:27:59] [PASSED] drm_test_damage_iter_damage_src_moved
[02:27:59] [PASSED] drm_test_damage_iter_damage_not_visible
[02:27:59] ================ [PASSED] drm_damage_helper ================
[02:27:59] ==================== drm_dp_mst_helper  ====================
[02:27:59] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[02:27:59] [PASSED] Clock 154000 BPP 30 DSC disabled
[02:27:59] [PASSED] Clock 234000 BPP 30 DSC disabled
[02:27:59] [PASSED] Clock 297000 BPP 24 DSC disabled
[02:27:59] [PASSED] Clock 332880 BPP 24 DSC enabled
[02:27:59] [PASSED] Clock 324540 BPP 24 DSC enabled
[02:27:59] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[02:27:59] ============== drm_test_dp_mst_calc_pbn_div  ===============
[02:27:59] [PASSED] Link rate 2000000 lane count 4
[02:27:59] [PASSED] Link rate 2000000 lane count 2
[02:27:59] [PASSED] Link rate 2000000 lane count 1
[02:27:59] [PASSED] Link rate 1350000 lane count 4
[02:27:59] [PASSED] Link rate 1350000 lane count 2
[02:27:59] [PASSED] Link rate 1350000 lane count 1
[02:27:59] [PASSED] Link rate 1000000 lane count 4
[02:27:59] [PASSED] Link rate 1000000 lane count 2
[02:27:59] [PASSED] Link rate 1000000 lane count 1
[02:27:59] [PASSED] Link rate 810000 lane count 4
[02:27:59] [PASSED] Link rate 810000 lane count 2
[02:27:59] [PASSED] Link rate 810000 lane count 1
[02:27:59] [PASSED] Link rate 540000 lane count 4
[02:27:59] [PASSED] Link rate 540000 lane count 2
[02:27:59] [PASSED] Link rate 540000 lane count 1
[02:27:59] [PASSED] Link rate 270000 lane count 4
[02:27:59] [PASSED] Link rate 270000 lane count 2
[02:27:59] [PASSED] Link rate 270000 lane count 1
[02:27:59] [PASSED] Link rate 162000 lane count 4
[02:27:59] [PASSED] Link rate 162000 lane count 2
[02:27:59] [PASSED] Link rate 162000 lane count 1
[02:27:59] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[02:27:59] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[02:27:59] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[02:27:59] [PASSED] DP_POWER_UP_PHY with port number
[02:27:59] [PASSED] DP_POWER_DOWN_PHY with port number
[02:27:59] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[02:27:59] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[02:27:59] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[02:27:59] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[02:27:59] [PASSED] DP_QUERY_PAYLOAD with port number
[02:27:59] [PASSED] DP_QUERY_PAYLOAD with VCPI
[02:27:59] [PASSED] DP_REMOTE_DPCD_READ with port number
[02:27:59] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[02:27:59] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[02:27:59] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[02:27:59] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[02:27:59] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[02:27:59] [PASSED] DP_REMOTE_I2C_READ with port number
[02:27:59] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[02:27:59] [PASSED] DP_REMOTE_I2C_READ with transactions array
[02:27:59] [PASSED] DP_REMOTE_I2C_WRITE with port number
[02:27:59] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[02:27:59] [PASSED] DP_REMOTE_I2C_WRITE with data array
[02:27:59] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[02:27:59] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[02:27:59] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[02:27:59] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[02:27:59] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[02:27:59] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[02:27:59] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[02:27:59] ================ [PASSED] drm_dp_mst_helper ================
[02:27:59] ======================== drm_exec  =========================
[02:27:59] [PASSED] sanitycheck
[02:27:59] [PASSED] test_lock
[02:27:59] [PASSED] test_lock_unlock
[02:27:59] [PASSED] test_duplicates
[02:27:59] [PASSED] test_prepare
[02:27:59] [PASSED] test_prepare_array
[02:27:59] [PASSED] test_multiple_loops
[02:27:59] ==================== [PASSED] drm_exec =====================
[02:27:59] ================= drm_format_helper_test  ==================
[02:27:59] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[02:27:59] [PASSED] single_pixel_source_buffer
[02:27:59] [PASSED] single_pixel_clip_rectangle
[02:27:59] [PASSED] well_known_colors
[02:27:59] [PASSED] destination_pitch
[02:27:59] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[02:27:59] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[02:27:59] [PASSED] single_pixel_source_buffer
[02:27:59] [PASSED] single_pixel_clip_rectangle
[02:27:59] [PASSED] well_known_colors
[02:27:59] [PASSED] destination_pitch
[02:27:59] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[02:27:59] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[02:27:59] [PASSED] single_pixel_source_buffer
[02:27:59] [PASSED] single_pixel_clip_rectangle
[02:27:59] [PASSED] well_known_colors
[02:27:59] [PASSED] destination_pitch
[02:27:59] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[02:27:59] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[02:27:59] [PASSED] single_pixel_source_buffer
[02:27:59] [PASSED] single_pixel_clip_rectangle
[02:27:59] [PASSED] well_known_colors
[02:27:59] [PASSED] destination_pitch
[02:27:59] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[02:27:59] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[02:27:59] [PASSED] single_pixel_source_buffer
[02:27:59] [PASSED] single_pixel_clip_rectangle
[02:27:59] [PASSED] well_known_colors
[02:27:59] [PASSED] destination_pitch
[02:27:59] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[02:27:59] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[02:27:59] [PASSED] single_pixel_source_buffer
[02:27:59] [PASSED] single_pixel_clip_rectangle
[02:27:59] [PASSED] well_known_colors
[02:27:59] [PASSED] destination_pitch
[02:27:59] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[02:27:59] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[02:27:59] [PASSED] single_pixel_source_buffer
[02:27:59] [PASSED] single_pixel_clip_rectangle
[02:27:59] [PASSED] well_known_colors
[02:27:59] [PASSED] destination_pitch
[02:27:59] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[02:27:59] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[02:27:59] [PASSED] single_pixel_source_buffer
[02:27:59] [PASSED] single_pixel_clip_rectangle
[02:27:59] [PASSED] well_known_colors
[02:27:59] [PASSED] destination_pitch
[02:27:59] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[02:27:59] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[02:27:59] [PASSED] single_pixel_source_buffer
[02:27:59] [PASSED] single_pixel_clip_rectangle
[02:27:59] [PASSED] well_known_colors
[02:27:59] [PASSED] destination_pitch
[02:27:59] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[02:27:59] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[02:27:59] [PASSED] single_pixel_source_buffer
[02:27:59] [PASSED] single_pixel_clip_rectangle
[02:27:59] [PASSED] well_known_colors
[02:27:59] [PASSED] destination_pitch
[02:27:59] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[02:27:59] ============== drm_test_fb_xrgb8888_to_mono  ===============
[02:27:59] [PASSED] single_pixel_source_buffer
[02:27:59] [PASSED] single_pixel_clip_rectangle
[02:27:59] [PASSED] well_known_colors
[02:27:59] [PASSED] destination_pitch
[02:27:59] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[02:27:59] ==================== drm_test_fb_swab  =====================
[02:27:59] [PASSED] single_pixel_source_buffer
[02:27:59] [PASSED] single_pixel_clip_rectangle
[02:27:59] [PASSED] well_known_colors
[02:27:59] [PASSED] destination_pitch
[02:27:59] ================ [PASSED] drm_test_fb_swab =================
[02:27:59] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[02:27:59] [PASSED] single_pixel_source_buffer
[02:27:59] [PASSED] single_pixel_clip_rectangle
[02:27:59] [PASSED] well_known_colors
[02:27:59] [PASSED] destination_pitch
[02:27:59] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[02:27:59] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[02:27:59] [PASSED] single_pixel_source_buffer
[02:27:59] [PASSED] single_pixel_clip_rectangle
[02:27:59] [PASSED] well_known_colors
[02:27:59] [PASSED] destination_pitch
[02:27:59] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[02:27:59] ================= drm_test_fb_clip_offset  =================
[02:27:59] [PASSED] pass through
[02:27:59] [PASSED] horizontal offset
[02:27:59] [PASSED] vertical offset
[02:27:59] [PASSED] horizontal and vertical offset
[02:27:59] [PASSED] horizontal offset (custom pitch)
[02:27:59] [PASSED] vertical offset (custom pitch)
[02:27:59] [PASSED] horizontal and vertical offset (custom pitch)
[02:27:59] ============= [PASSED] drm_test_fb_clip_offset =============
[02:27:59] ============== drm_test_fb_build_fourcc_list  ==============
[02:27:59] [PASSED] no native formats
[02:27:59] [PASSED] XRGB8888 as native format
[02:27:59] [PASSED] remove duplicates
[02:27:59] [PASSED] convert alpha formats
[02:27:59] [PASSED] random formats
[02:27:59] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[02:27:59] =================== drm_test_fb_memcpy  ====================
[02:27:59] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[02:27:59] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[02:27:59] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[02:27:59] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[02:27:59] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[02:27:59] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[02:27:59] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[02:27:59] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[02:27:59] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[02:27:59] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[02:27:59] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[02:27:59] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[02:27:59] =============== [PASSED] drm_test_fb_memcpy ================
[02:27:59] ============= [PASSED] drm_format_helper_test ==============
[02:27:59] ======================= drm_format  ========================
[02:27:59] [PASSED] drm_test_format_block_width_invalid
[02:27:59] [PASSED] drm_test_format_block_width_one_plane
[02:27:59] [PASSED] drm_test_format_block_width_two_plane
[02:27:59] [PASSED] drm_test_format_block_width_three_plane
[02:27:59] [PASSED] drm_test_format_block_width_tiled
[02:27:59] [PASSED] drm_test_format_block_height_invalid
[02:27:59] [PASSED] drm_test_format_block_height_one_plane
[02:27:59] [PASSED] drm_test_format_block_height_two_plane
[02:27:59] [PASSED] drm_test_format_block_height_three_plane
[02:27:59] [PASSED] drm_test_format_block_height_tiled
[02:27:59] [PASSED] drm_test_format_min_pitch_invalid
[02:27:59] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[02:27:59] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[02:27:59] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[02:27:59] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[02:27:59] [PASSED] drm_test_format_min_pitch_two_plane
[02:27:59] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[02:27:59] [PASSED] drm_test_format_min_pitch_tiled
[02:27:59] =================== [PASSED] drm_format ====================
[02:27:59] ===================== drm_framebuffer  =====================
[02:27:59] =============== drm_test_framebuffer_create  ===============
[02:27:59] [PASSED] ABGR8888 normal sizes
[02:27:59] [PASSED] ABGR8888 max sizes
[02:27:59] [PASSED] ABGR8888 pitch greater than min required
[02:27:59] [PASSED] ABGR8888 pitch less than min required
[02:27:59] [PASSED] ABGR8888 Invalid width
[02:27:59] [PASSED] ABGR8888 Invalid buffer handle
[02:27:59] [PASSED] No pixel format
[02:27:59] [PASSED] ABGR8888 Width 0
[02:27:59] [PASSED] ABGR8888 Height 0
[02:27:59] [PASSED] ABGR8888 Out of bound height * pitch combination
[02:27:59] [PASSED] ABGR8888 Large buffer offset
[02:27:59] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[02:27:59] [PASSED] ABGR8888 Valid buffer modifier
[02:27:59] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[02:27:59] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[02:27:59] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[02:27:59] [PASSED] NV12 Normal sizes
[02:27:59] [PASSED] NV12 Max sizes
[02:27:59] [PASSED] NV12 Invalid pitch
[02:27:59] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[02:27:59] [PASSED] NV12 different  modifier per-plane
[02:27:59] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[02:27:59] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[02:27:59] [PASSED] NV12 Modifier for inexistent plane
[02:27:59] [PASSED] NV12 Handle for inexistent plane
[02:27:59] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[02:27:59] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[02:27:59] [PASSED] YVU420 Normal sizes
[02:27:59] [PASSED] YVU420 Max sizes
[02:27:59] [PASSED] YVU420 Invalid pitch
[02:27:59] [PASSED] YVU420 Different pitches
[02:27:59] [PASSED] YVU420 Different buffer offsets/pitches
[02:27:59] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[02:27:59] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[02:27:59] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[02:27:59] [PASSED] YVU420 Valid modifier
[02:27:59] [PASSED] YVU420 Different modifiers per plane
[02:27:59] [PASSED] YVU420 Modifier for inexistent plane
[02:27:59] [PASSED] X0L2 Normal sizes
[02:27:59] [PASSED] X0L2 Max sizes
[02:27:59] [PASSED] X0L2 Invalid pitch
[02:27:59] [PASSED] X0L2 Pitch greater than minimum required
[02:27:59] [PASSED] X0L2 Handle for inexistent plane
[02:27:59] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[02:27:59] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[02:27:59] [PASSED] X0L2 Valid modifier
[02:27:59] [PASSED] X0L2 Modifier for inexistent plane
[02:27:59] =========== [PASSED] drm_test_framebuffer_create ===========
[02:27:59] ================= [PASSED] drm_framebuffer =================
[02:27:59] ====================== drm_gem_shmem  ======================
[02:27:59] [PASSED] drm_gem_shmem_test_obj_create
[02:27:59] [PASSED] drm_gem_shmem_test_obj_create_private
[02:27:59] [PASSED] drm_gem_shmem_test_pin_pages
[02:27:59] [PASSED] drm_gem_shmem_test_vmap
[02:27:59] [PASSED] drm_gem_shmem_test_get_pages_sgt
[02:27:59] [PASSED] drm_gem_shmem_test_get_sg_table
[02:27:59] [PASSED] drm_gem_shmem_test_madvise
[02:27:59] [PASSED] drm_gem_shmem_test_purge
[02:27:59] ================== [PASSED] drm_gem_shmem ==================
[02:27:59] ==================== drm-test-managed  =====================
[02:27:59] [PASSED] drm_test_managed_run_action
[02:27:59] ================ [PASSED] drm-test-managed =================
[02:27:59] ========================= drm_mm  ==========================
[02:27:59] [PASSED] drm_test_mm_init
[02:27:59] [PASSED] drm_test_mm_debug
[02:27:59] [PASSED] drm_test_mm_align32
[02:27:59] [PASSED] drm_test_mm_align64
[02:27:59] [PASSED] drm_test_mm_lowest
[02:27:59] [PASSED] drm_test_mm_highest
[02:27:59] ===================== [PASSED] drm_mm ======================
[02:27:59] =================== drm_modes_analog_tv  ===================
[02:27:59] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[02:27:59] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[02:27:59] [PASSED] drm_test_modes_analog_tv_pal_576i
[02:27:59] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[02:27:59] =============== [PASSED] drm_modes_analog_tv ===============
[02:27:59] ==================== drm_plane_helper  =====================
[02:27:59] =============== drm_test_check_plane_state  ================
[02:27:59] [PASSED] clipping_simple
[02:27:59] [PASSED] clipping_rotate_reflect
[02:27:59] [PASSED] positioning_simple
[02:27:59] [PASSED] upscaling
[02:27:59] [PASSED] downscaling
[02:27:59] [PASSED] rounding1
[02:27:59] [PASSED] rounding2
[02:27:59] [PASSED] rounding3
[02:27:59] [PASSED] rounding4
[02:27:59] =========== [PASSED] drm_test_check_plane_state ============
[02:27:59] =========== drm_test_check_invalid_plane_state  ============
[02:27:59] [PASSED] positioning_invalid
[02:27:59] [PASSED] upscaling_invalid
[02:27:59] [PASSED] downscaling_invalid
[02:27:59] ======= [PASSED] drm_test_check_invalid_plane_state ========
[02:27:59] ================ [PASSED] drm_plane_helper =================
[02:27:59] ============ drm_connector_helper_tv_get_modes  ============
[02:27:59] ====== drm_test_connector_helper_tv_get_modes_check  =======
[02:27:59] [PASSED] None
[02:27:59] [PASSED] PAL
[02:27:59] [PASSED] NTSC
[02:27:59] [PASSED] Both, NTSC Default
[02:27:59] [PASSED] Both, PAL Default
[02:27:59] [PASSED] Both, NTSC Default, with PAL on command-line
[02:27:59] [PASSED] Both, PAL Default, with NTSC on command-line
[02:27:59] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[02:27:59] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[02:27:59] ======================== drm_rect  =========================
[02:27:59] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[02:27:59] [PASSED] drm_test_rect_clip_scaled_not_clipped
[02:27:59] [PASSED] drm_test_rect_clip_scaled_clipped
[02:27:59] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[02:27:59] ================= drm_test_rect_intersect  =================
[02:27:59] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[02:27:59] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
stty: 'standard input': Inappropriate ioctl for device
[02:27:59] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[02:27:59] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[02:27:59] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[02:27:59] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[02:27:59] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[02:27:59] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[02:27:59] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[02:27:59] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[02:27:59] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[02:27:59] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[02:27:59] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[02:27:59] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[02:27:59] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[02:27:59] ============= [PASSED] drm_test_rect_intersect =============
[02:27:59] ================ drm_test_rect_calc_hscale  ================
[02:27:59] [PASSED] normal use
[02:27:59] [PASSED] out of max range
[02:27:59] [PASSED] out of min range
[02:27:59] [PASSED] zero dst
[02:27:59] [PASSED] negative src
[02:27:59] [PASSED] negative dst
[02:27:59] ============ [PASSED] drm_test_rect_calc_hscale ============
[02:27:59] ================ drm_test_rect_calc_vscale  ================
[02:27:59] [PASSED] normal use
[02:27:59] [PASSED] out of max range
[02:27:59] [PASSED] out of min range
[02:27:59] [PASSED] zero dst
[02:27:59] [PASSED] negative src
[02:27:59] [PASSED] negative dst
[02:27:59] ============ [PASSED] drm_test_rect_calc_vscale ============
[02:27:59] ================== drm_test_rect_rotate  ===================
[02:27:59] [PASSED] reflect-x
[02:27:59] [PASSED] reflect-y
[02:27:59] [PASSED] rotate-0
[02:27:59] [PASSED] rotate-90
[02:27:59] [PASSED] rotate-180
[02:27:59] [PASSED] rotate-270
[02:27:59] ============== [PASSED] drm_test_rect_rotate ===============
[02:27:59] ================ drm_test_rect_rotate_inv  =================
[02:27:59] [PASSED] reflect-x
[02:27:59] [PASSED] reflect-y
[02:27:59] [PASSED] rotate-0
[02:27:59] [PASSED] rotate-90
[02:27:59] [PASSED] rotate-180
[02:27:59] [PASSED] rotate-270
[02:27:59] ============ [PASSED] drm_test_rect_rotate_inv =============
[02:27:59] ==================== [PASSED] drm_rect =====================
[02:27:59] ============================================================
[02:27:59] Testing complete. Ran 390 tests: passed: 390
[02:27:59] Elapsed time: 22.021s total, 1.685s configuring, 20.214s building, 0.118s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


