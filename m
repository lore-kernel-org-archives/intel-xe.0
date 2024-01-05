Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2231EC3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 05:34:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA9A10E56A;
	Fri,  5 Jan 2024 05:33:59 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF18210E17B;
 Fri,  5 Jan 2024 05:33:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_xe/xe=5Fbo=5Fmove=3A_Enhance_x?=
 =?utf-8?q?e=5Fbo=5Fmove_trace_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Date: Fri, 05 Jan 2024 05:33:57 -0000
Message-ID: <170443283797.20654.17268886668074977710@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240105052420.2389969-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20240105052420.2389969-1-priyanka.dandamudi@intel.com>
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

Series: xe/xe_bo_move: Enhance xe_bo_move trace (rev3)
URL   : https://patchwork.freedesktop.org/series/128151/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[05:33:06] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:33:10] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[05:33:33] Starting KUnit Kernel (1/1)...
[05:33:33] ============================================================
[05:33:33] ========================= guc_dbm  =========================
[05:33:33] [PASSED] test_empty
[05:33:33] [PASSED] test_default
[05:33:33] ======================== test_size  ========================
[05:33:33] [PASSED] 4
[05:33:33] [PASSED] 8
[05:33:33] [PASSED] 32
[05:33:33] [PASSED] 256
[05:33:33] ==================== [PASSED] test_size ====================
[05:33:33] ======================= test_reuse  ========================
[05:33:33] [PASSED] 4
[05:33:33] [PASSED] 8
[05:33:33] [PASSED] 32
[05:33:33] [PASSED] 256
[05:33:33] =================== [PASSED] test_reuse ====================
[05:33:33] =================== test_range_overlap  ====================
[05:33:33] [PASSED] 4
[05:33:33] [PASSED] 8
[05:33:33] [PASSED] 32
[05:33:33] [PASSED] 256
[05:33:33] =============== [PASSED] test_range_overlap ================
[05:33:33] =================== test_range_compact  ====================
[05:33:33] [PASSED] 4
[05:33:33] [PASSED] 8
[05:33:33] [PASSED] 32
[05:33:33] [PASSED] 256
[05:33:33] =============== [PASSED] test_range_compact ================
[05:33:33] ==================== test_range_spare  =====================
[05:33:33] [PASSED] 4
[05:33:33] [PASSED] 8
[05:33:33] [PASSED] 32
[05:33:33] [PASSED] 256
[05:33:33] ================ [PASSED] test_range_spare =================
[05:33:33] ===================== [PASSED] guc_dbm =====================
[05:33:33] ========================== lmtt  ===========================
[05:33:33] ======================== test_ops  =========================
[05:33:33] [PASSED] 2-level
[05:33:33] [PASSED] multi-level
[05:33:33] ==================== [PASSED] test_ops =====================
[05:33:33] ====================== [PASSED] lmtt =======================
[05:33:33] ========================== xe_bo  ==========================
[05:33:33] [SKIPPED] xe_ccs_migrate_kunit
[05:33:33] [SKIPPED] xe_bo_evict_kunit
[05:33:33] ===================== [SKIPPED] xe_bo ======================
[05:33:33] ======================= xe_dma_buf  ========================
[05:33:33] [SKIPPED] xe_dma_buf_kunit
[05:33:33] =================== [SKIPPED] xe_dma_buf ===================
[05:33:33] ======================= xe_migrate  ========================
[05:33:33] [SKIPPED] xe_migrate_sanity_kunit
[05:33:33] =================== [SKIPPED] xe_migrate ===================
[05:33:33] ========================= xe_mocs  =========================
[05:33:33] [SKIPPED] xe_live_mocs_kernel_kunit
[05:33:33] ==================== [SKIPPED] xe_mocs =====================
[05:33:33] ========================= xe_pci  ==========================
[05:33:33] [PASSED] xe_gmdid_graphics_ip
[05:33:33] [PASSED] xe_gmdid_media_ip
[05:33:33] ===================== [PASSED] xe_pci ======================
[05:33:33] ========================= xe_rtp  ==========================
[05:33:33] ================== xe_rtp_process_tests  ===================
[05:33:33] [PASSED] coalesce-same-reg
[05:33:33] [PASSED] no-match-no-add
[05:33:33] [PASSED] no-match-no-add-multiple-rules
[05:33:33] [PASSED] two-regs-two-entries
[05:33:33] [PASSED] clr-one-set-other
[05:33:33] [PASSED] set-field
[05:33:33] [PASSED] conflict-duplicate
[05:33:33] [PASSED] conflict-not-disjoint
[05:33:33] [PASSED] conflict-reg-type
[05:33:33] ============== [PASSED] xe_rtp_process_tests ===============
[05:33:33] ===================== [PASSED] xe_rtp ======================
[05:33:33] ========================== xe_wa  ==========================
[05:33:33] ======================== xe_wa_gt  =========================
[05:33:33] [PASSED] TIGERLAKE (B0)
[05:33:33] [PASSED] DG1 (A0)
[05:33:33] [PASSED] DG1 (B0)
[05:33:33] [PASSED] ALDERLAKE_S (A0)
[05:33:33] [PASSED] ALDERLAKE_S (B0)
[05:33:33] [PASSED] ALDERLAKE_S (C0)
[05:33:33] [PASSED] ALDERLAKE_S (D0)
[05:33:33] [PASSED] ALDERLAKE_P (A0)
[05:33:33] [PASSED] ALDERLAKE_P (B0)
[05:33:33] [PASSED] ALDERLAKE_P (C0)
[05:33:33] [PASSED] ALDERLAKE_S_RPLS (D0)
[05:33:33] [PASSED] ALDERLAKE_P_RPLU (E0)
[05:33:33] [PASSED] DG2_G10 (A0)
[05:33:33] [PASSED] DG2_G10 (A1)
[05:33:33] [PASSED] DG2_G10 (B0)
[05:33:33] [PASSED] DG2_G10 (C0)
[05:33:33] [PASSED] DG2_G11 (A0)
[05:33:33] [PASSED] DG2_G11 (B0)
[05:33:33] [PASSED] DG2_G11 (B1)
[05:33:33] [PASSED] DG2_G12 (A0)
[05:33:33] [PASSED] DG2_G12 (A1)
[05:33:33] [PASSED] PVC (B0)
[05:33:33] [PASSED] PVC (B1)
[05:33:33] [PASSED] PVC (C0)
[05:33:33] [PASSED] METEORLAKE (g:A0, m:A0)
[05:33:33] [PASSED] METEORLAKE (g:A0, m:A0)
[05:33:33] [PASSED] LUNARLAKE (g:A0, m:A0)
[05:33:33] [PASSED] LUNARLAKE (g:B0, m:A0)
[05:33:33] ==================== [PASSED] xe_wa_gt =====================
[05:33:33] ====================== [PASSED] xe_wa ======================
[05:33:33] ============================================================
[05:33:33] Testing complete. Ran 68 tests: passed: 63, skipped: 5
[05:33:33] Elapsed time: 27.494s total, 4.168s configuring, 23.106s building, 0.167s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[05:33:33] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:33:35] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[05:33:55] Starting KUnit Kernel (1/1)...
[05:33:55] ============================================================
[05:33:55] ================== drm_test_pick_cmdline  ==================
[05:33:55] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[05:33:55] =============== drm_test_pick_cmdline_named  ===============
[05:33:55] [PASSED] NTSC
[05:33:55] [PASSED] NTSC-J
[05:33:55] [PASSED] PAL
[05:33:55] [PASSED] PAL-M
[05:33:55] =========== [PASSED] drm_test_pick_cmdline_named ===========
[05:33:55] ============== [PASSED] drm_test_pick_cmdline ==============
[05:33:55] ======================== drm_buddy  ========================
[05:33:55] [PASSED] drm_test_buddy_alloc_limit
[05:33:55] [PASSED] drm_test_buddy_alloc_optimistic
[05:33:55] [PASSED] drm_test_buddy_alloc_pessimistic
[05:33:55] [PASSED] drm_test_buddy_alloc_pathological
[05:33:55] ==================== [PASSED] drm_buddy ====================
[05:33:55] =================== drm_cmdline_parser  ====================
[05:33:55] [PASSED] drm_test_cmdline_force_d_only
[05:33:55] [PASSED] drm_test_cmdline_force_D_only_dvi
[05:33:55] [PASSED] drm_test_cmdline_force_D_only_hdmi
[05:33:55] [PASSED] drm_test_cmdline_force_D_only_not_digital
[05:33:55] [PASSED] drm_test_cmdline_force_e_only
[05:33:55] [PASSED] drm_test_cmdline_res
[05:33:55] [PASSED] drm_test_cmdline_res_vesa
[05:33:55] [PASSED] drm_test_cmdline_res_vesa_rblank
[05:33:55] [PASSED] drm_test_cmdline_res_rblank
[05:33:55] [PASSED] drm_test_cmdline_res_bpp
[05:33:55] [PASSED] drm_test_cmdline_res_refresh
[05:33:55] [PASSED] drm_test_cmdline_res_bpp_refresh
[05:33:55] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[05:33:55] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[05:33:55] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[05:33:55] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[05:33:55] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[05:33:55] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[05:33:55] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[05:33:55] [PASSED] drm_test_cmdline_res_margins_force_on
[05:33:55] [PASSED] drm_test_cmdline_res_vesa_margins
[05:33:55] [PASSED] drm_test_cmdline_name
[05:33:55] [PASSED] drm_test_cmdline_name_bpp
[05:33:55] [PASSED] drm_test_cmdline_name_option
[05:33:55] [PASSED] drm_test_cmdline_name_bpp_option
[05:33:55] [PASSED] drm_test_cmdline_rotate_0
[05:33:55] [PASSED] drm_test_cmdline_rotate_90
[05:33:55] [PASSED] drm_test_cmdline_rotate_180
[05:33:55] [PASSED] drm_test_cmdline_rotate_270
[05:33:55] [PASSED] drm_test_cmdline_hmirror
[05:33:55] [PASSED] drm_test_cmdline_vmirror
[05:33:55] [PASSED] drm_test_cmdline_margin_options
[05:33:55] [PASSED] drm_test_cmdline_multiple_options
[05:33:55] [PASSED] drm_test_cmdline_bpp_extra_and_option
[05:33:55] [PASSED] drm_test_cmdline_extra_and_option
[05:33:55] [PASSED] drm_test_cmdline_freestanding_options
[05:33:55] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[05:33:55] [PASSED] drm_test_cmdline_panel_orientation
[05:33:55] ================ drm_test_cmdline_invalid  =================
[05:33:55] [PASSED] margin_only
[05:33:55] [PASSED] interlace_only
[05:33:55] [PASSED] res_missing_x
[05:33:55] [PASSED] res_missing_y
[05:33:55] [PASSED] res_bad_y
[05:33:55] [PASSED] res_missing_y_bpp
[05:33:55] [PASSED] res_bad_bpp
[05:33:55] [PASSED] res_bad_refresh
[05:33:55] [PASSED] res_bpp_refresh_force_on_off
[05:33:55] [PASSED] res_invalid_mode
[05:33:55] [PASSED] res_bpp_wrong_place_mode
[05:33:55] [PASSED] name_bpp_refresh
[05:33:55] [PASSED] name_refresh
[05:33:55] [PASSED] name_refresh_wrong_mode
[05:33:55] [PASSED] name_refresh_invalid_mode
[05:33:55] [PASSED] rotate_multiple
[05:33:55] [PASSED] rotate_invalid_val
[05:33:55] [PASSED] rotate_truncated
[05:33:55] [PASSED] invalid_option
[05:33:55] [PASSED] invalid_tv_option
[05:33:55] [PASSED] truncated_tv_option
[05:33:55] ============ [PASSED] drm_test_cmdline_invalid =============
[05:33:55] =============== drm_test_cmdline_tv_options  ===============
[05:33:55] [PASSED] NTSC
[05:33:55] [PASSED] NTSC_443
[05:33:55] [PASSED] NTSC_J
[05:33:55] [PASSED] PAL
[05:33:55] [PASSED] PAL_M
[05:33:55] [PASSED] PAL_N
[05:33:55] [PASSED] SECAM
[05:33:55] =========== [PASSED] drm_test_cmdline_tv_options ===========
[05:33:55] =============== [PASSED] drm_cmdline_parser ================
[05:33:55] ================ drm_get_tv_mode_from_name  ================
[05:33:55] ========== drm_test_get_tv_mode_from_name_valid  ===========
[05:33:55] [PASSED] NTSC
[05:33:55] [PASSED] NTSC-443
[05:33:55] [PASSED] NTSC-J
[05:33:55] [PASSED] PAL
[05:33:55] [PASSED] PAL-M
[05:33:55] [PASSED] PAL-N
[05:33:55] [PASSED] SECAM
[05:33:55] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[05:33:55] [PASSED] drm_test_get_tv_mode_from_name_truncated
[05:33:55] ============ [PASSED] drm_get_tv_mode_from_name ============
[05:33:55] ==================== drm_damage_helper  ====================
[05:33:55] [PASSED] drm_test_damage_iter_no_damage
[05:33:55] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[05:33:55] [PASSED] drm_test_damage_iter_no_damage_src_moved
[05:33:55] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[05:33:55] [PASSED] drm_test_damage_iter_no_damage_not_visible
[05:33:55] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[05:33:55] [PASSED] drm_test_damage_iter_no_damage_no_fb
[05:33:55] [PASSED] drm_test_damage_iter_simple_damage
[05:33:55] [PASSED] drm_test_damage_iter_single_damage
[05:33:55] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[05:33:55] [PASSED] drm_test_damage_iter_single_damage_outside_src
[05:33:55] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[05:33:55] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[05:33:55] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[05:33:55] [PASSED] drm_test_damage_iter_single_damage_src_moved
[05:33:55] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[05:33:55] [PASSED] drm_test_damage_iter_damage
[05:33:55] [PASSED] drm_test_damage_iter_damage_one_intersect
[05:33:55] [PASSED] drm_test_damage_iter_damage_one_outside
[05:33:55] [PASSED] drm_test_damage_iter_damage_src_moved
[05:33:55] [PASSED] drm_test_damage_iter_damage_not_visible
[05:33:55] ================ [PASSED] drm_damage_helper ================
[05:33:55] ==================== drm_dp_mst_helper  ====================
[05:33:55] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[05:33:55] [PASSED] Clock 154000 BPP 30 DSC disabled
[05:33:55] [PASSED] Clock 234000 BPP 30 DSC disabled
[05:33:55] [PASSED] Clock 297000 BPP 24 DSC disabled
[05:33:55] [PASSED] Clock 332880 BPP 24 DSC enabled
[05:33:55] [PASSED] Clock 324540 BPP 24 DSC enabled
[05:33:55] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[05:33:55] ============== drm_test_dp_mst_calc_pbn_div  ===============
[05:33:55] [PASSED] Link rate 2000000 lane count 4
[05:33:55] [PASSED] Link rate 2000000 lane count 2
[05:33:55] [PASSED] Link rate 2000000 lane count 1
[05:33:55] [PASSED] Link rate 1350000 lane count 4
[05:33:55] [PASSED] Link rate 1350000 lane count 2
[05:33:55] [PASSED] Link rate 1350000 lane count 1
[05:33:55] [PASSED] Link rate 1000000 lane count 4
[05:33:55] [PASSED] Link rate 1000000 lane count 2
[05:33:55] [PASSED] Link rate 1000000 lane count 1
[05:33:55] [PASSED] Link rate 810000 lane count 4
[05:33:55] [PASSED] Link rate 810000 lane count 2
[05:33:55] [PASSED] Link rate 810000 lane count 1
[05:33:55] [PASSED] Link rate 540000 lane count 4
[05:33:55] [PASSED] Link rate 540000 lane count 2
[05:33:55] [PASSED] Link rate 540000 lane count 1
[05:33:55] [PASSED] Link rate 270000 lane count 4
[05:33:55] [PASSED] Link rate 270000 lane count 2
[05:33:55] [PASSED] Link rate 270000 lane count 1
[05:33:55] [PASSED] Link rate 162000 lane count 4
[05:33:55] [PASSED] Link rate 162000 lane count 2
[05:33:55] [PASSED] Link rate 162000 lane count 1
[05:33:55] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[05:33:55] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[05:33:55] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[05:33:55] [PASSED] DP_POWER_UP_PHY with port number
[05:33:55] [PASSED] DP_POWER_DOWN_PHY with port number
[05:33:55] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[05:33:55] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[05:33:55] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[05:33:55] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[05:33:55] [PASSED] DP_QUERY_PAYLOAD with port number
[05:33:55] [PASSED] DP_QUERY_PAYLOAD with VCPI
[05:33:55] [PASSED] DP_REMOTE_DPCD_READ with port number
[05:33:55] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[05:33:55] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[05:33:55] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[05:33:55] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[05:33:55] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[05:33:55] [PASSED] DP_REMOTE_I2C_READ with port number
[05:33:55] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[05:33:55] [PASSED] DP_REMOTE_I2C_READ with transactions array
[05:33:55] [PASSED] DP_REMOTE_I2C_WRITE with port number
[05:33:55] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[05:33:55] [PASSED] DP_REMOTE_I2C_WRITE with data array
[05:33:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[05:33:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[05:33:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[05:33:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[05:33:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[05:33:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[05:33:55] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[05:33:55] ================ [PASSED] drm_dp_mst_helper ================
[05:33:55] ======================== drm_exec  =========================
[05:33:55] [PASSED] sanitycheck
[05:33:55] [PASSED] test_lock
[05:33:55] [PASSED] test_lock_unlock
[05:33:55] [PASSED] test_duplicates
[05:33:55] [PASSED] test_prepare
[05:33:55] [PASSED] test_prepare_array
[05:33:55] [PASSED] test_multiple_loops
[05:33:55] ==================== [PASSED] drm_exec =====================
[05:33:55] ================= drm_format_helper_test  ==================
[05:33:55] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[05:33:55] [PASSED] single_pixel_source_buffer
[05:33:55] [PASSED] single_pixel_clip_rectangle
[05:33:55] [PASSED] well_known_colors
[05:33:55] [PASSED] destination_pitch
[05:33:55] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[05:33:55] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[05:33:55] [PASSED] single_pixel_source_buffer
[05:33:55] [PASSED] single_pixel_clip_rectangle
[05:33:55] [PASSED] well_known_colors
[05:33:55] [PASSED] destination_pitch
[05:33:55] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[05:33:55] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[05:33:55] [PASSED] single_pixel_source_buffer
[05:33:55] [PASSED] single_pixel_clip_rectangle
[05:33:55] [PASSED] well_known_colors
[05:33:55] [PASSED] destination_pitch
[05:33:55] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[05:33:55] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[05:33:55] [PASSED] single_pixel_source_buffer
[05:33:55] [PASSED] single_pixel_clip_rectangle
[05:33:55] [PASSED] well_known_colors
[05:33:55] [PASSED] destination_pitch
[05:33:55] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[05:33:55] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[05:33:55] [PASSED] single_pixel_source_buffer
[05:33:55] [PASSED] single_pixel_clip_rectangle
[05:33:55] [PASSED] well_known_colors
[05:33:55] [PASSED] destination_pitch
[05:33:55] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[05:33:55] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[05:33:55] [PASSED] single_pixel_source_buffer
[05:33:55] [PASSED] single_pixel_clip_rectangle
[05:33:55] [PASSED] well_known_colors
[05:33:55] [PASSED] destination_pitch
[05:33:55] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[05:33:55] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[05:33:55] [PASSED] single_pixel_source_buffer
[05:33:55] [PASSED] single_pixel_clip_rectangle
[05:33:55] [PASSED] well_known_colors
[05:33:55] [PASSED] destination_pitch
[05:33:55] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[05:33:55] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[05:33:55] [PASSED] single_pixel_source_buffer
[05:33:55] [PASSED] single_pixel_clip_rectangle
[05:33:55] [PASSED] well_known_colors
[05:33:55] [PASSED] destination_pitch
[05:33:55] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[05:33:55] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[05:33:55] [PASSED] single_pixel_source_buffer
[05:33:55] [PASSED] single_pixel_clip_rectangle
[05:33:55] [PASSED] well_known_colors
[05:33:55] [PASSED] destination_pitch
[05:33:55] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[05:33:55] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[05:33:55] [PASSED] single_pixel_source_buffer
[05:33:55] [PASSED] single_pixel_clip_rectangle
[05:33:55] [PASSED] well_known_colors
[05:33:55] [PASSED] destination_pitch
[05:33:55] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[05:33:55] ============== drm_test_fb_xrgb8888_to_mono  ===============
[05:33:55] [PASSED] single_pixel_source_buffer
[05:33:55] [PASSED] single_pixel_clip_rectangle
[05:33:55] [PASSED] well_known_colors
[05:33:55] [PASSED] destination_pitch
[05:33:55] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[05:33:55] ==================== drm_test_fb_swab  =====================
[05:33:55] [PASSED] single_pixel_source_buffer
[05:33:55] [PASSED] single_pixel_clip_rectangle
[05:33:55] [PASSED] well_known_colors
[05:33:55] [PASSED] destination_pitch
[05:33:55] ================ [PASSED] drm_test_fb_swab =================
[05:33:55] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[05:33:55] [PASSED] single_pixel_source_buffer
[05:33:55] [PASSED] single_pixel_clip_rectangle
[05:33:55] [PASSED] well_known_colors
[05:33:55] [PASSED] destination_pitch
[05:33:55] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[05:33:55] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[05:33:55] [PASSED] single_pixel_source_buffer
[05:33:55] [PASSED] single_pixel_clip_rectangle
[05:33:55] [PASSED] well_known_colors
[05:33:55] [PASSED] destination_pitch
[05:33:55] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[05:33:55] ================= drm_test_fb_clip_offset  =================
[05:33:55] [PASSED] pass through
[05:33:55] [PASSED] horizontal offset
[05:33:55] [PASSED] vertical offset
[05:33:55] [PASSED] horizontal and vertical offset
[05:33:55] [PASSED] horizontal offset (custom pitch)
[05:33:55] [PASSED] vertical offset (custom pitch)
[05:33:55] [PASSED] horizontal and vertical offset (custom pitch)
[05:33:55] ============= [PASSED] drm_test_fb_clip_offset =============
[05:33:55] ============== drm_test_fb_build_fourcc_list  ==============
[05:33:55] [PASSED] no native formats
[05:33:55] [PASSED] XRGB8888 as native format
[05:33:55] [PASSED] remove duplicates
[05:33:55] [PASSED] convert alpha formats
[05:33:55] [PASSED] random formats
[05:33:55] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[05:33:55] =================== drm_test_fb_memcpy  ====================
[05:33:55] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[05:33:55] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[05:33:55] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[05:33:55] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[05:33:55] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[05:33:55] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[05:33:55] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[05:33:55] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[05:33:55] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[05:33:55] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[05:33:55] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[05:33:55] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[05:33:55] =============== [PASSED] drm_test_fb_memcpy ================
[05:33:55] ============= [PASSED] drm_format_helper_test ==============
[05:33:55] ======================= drm_format  ========================
[05:33:55] [PASSED] drm_test_format_block_width_invalid
[05:33:55] [PASSED] drm_test_format_block_width_one_plane
[05:33:55] [PASSED] drm_test_format_block_width_two_plane
[05:33:55] [PASSED] drm_test_format_block_width_three_plane
[05:33:55] [PASSED] drm_test_format_block_width_tiled
[05:33:55] [PASSED] drm_test_format_block_height_invalid
[05:33:55] [PASSED] drm_test_format_block_height_one_plane
[05:33:55] [PASSED] drm_test_format_block_height_two_plane
[05:33:55] [PASSED] drm_test_format_block_height_three_plane
[05:33:55] [PASSED] drm_test_format_block_height_tiled
[05:33:55] [PASSED] drm_test_format_min_pitch_invalid
[05:33:55] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[05:33:55] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[05:33:55] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[05:33:55] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[05:33:55] [PASSED] drm_test_format_min_pitch_two_plane
[05:33:55] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[05:33:55] [PASSED] drm_test_format_min_pitch_tiled
[05:33:55] =================== [PASSED] drm_format ====================
[05:33:55] ===================== drm_framebuffer  =====================
[05:33:55] =============== drm_test_framebuffer_create  ===============
[05:33:55] [PASSED] ABGR8888 normal sizes
[05:33:55] [PASSED] ABGR8888 max sizes
[05:33:55] [PASSED] ABGR8888 pitch greater than min required
[05:33:55] [PASSED] ABGR8888 pitch less than min required
[05:33:55] [PASSED] ABGR8888 Invalid width
[05:33:55] [PASSED] ABGR8888 Invalid buffer handle
[05:33:55] [PASSED] No pixel format
[05:33:55] [PASSED] ABGR8888 Width 0
[05:33:55] [PASSED] ABGR8888 Height 0
[05:33:55] [PASSED] ABGR8888 Out of bound height * pitch combination
[05:33:55] [PASSED] ABGR8888 Large buffer offset
[05:33:55] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[05:33:55] [PASSED] ABGR8888 Valid buffer modifier
[05:33:55] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[05:33:55] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[05:33:55] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[05:33:55] [PASSED] NV12 Normal sizes
[05:33:55] [PASSED] NV12 Max sizes
[05:33:55] [PASSED] NV12 Invalid pitch
[05:33:55] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[05:33:55] [PASSED] NV12 different  modifier per-plane
[05:33:55] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[05:33:55] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[05:33:55] [PASSED] NV12 Modifier for inexistent plane
[05:33:55] [PASSED] NV12 Handle for inexistent plane
[05:33:55] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[05:33:55] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[05:33:55] [PASSED] YVU420 Normal sizes
[05:33:55] [PASSED] YVU420 Max sizes
[05:33:55] [PASSED] YVU420 Invalid pitch
[05:33:55] [PASSED] YVU420 Different pitches
[05:33:55] [PASSED] YVU420 Different buffer offsets/pitches
[05:33:55] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[05:33:55] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[05:33:55] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[05:33:55] [PASSED] YVU420 Valid modifier
[05:33:55] [PASSED] YVU420 Different modifiers per plane
[05:33:55] [PASSED] YVU420 Modifier for inexistent plane
[05:33:55] [PASSED] X0L2 Normal sizes
[05:33:55] [PASSED] X0L2 Max sizes
[05:33:55] [PASSED] X0L2 Invalid pitch
[05:33:55] [PASSED] X0L2 Pitch greater than minimum required
[05:33:55] [PASSED] X0L2 Handle for inexistent plane
[05:33:55] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[05:33:55] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[05:33:55] [PASSED] X0L2 Valid modifier
[05:33:55] [PASSED] X0L2 Modifier for inexistent plane
[05:33:55] =========== [PASSED] drm_test_framebuffer_create ===========
[05:33:55] ================= [PASSED] drm_framebuffer =================
[05:33:55] ====================== drm_gem_shmem  ======================
[05:33:55] [PASSED] drm_gem_shmem_test_obj_create
[05:33:55] [PASSED] drm_gem_shmem_test_obj_create_private
[05:33:55] [PASSED] drm_gem_shmem_test_pin_pages
[05:33:55] [PASSED] drm_gem_shmem_test_vmap
[05:33:55] [PASSED] drm_gem_shmem_test_get_pages_sgt
[05:33:55] [PASSED] drm_gem_shmem_test_get_sg_table
[05:33:55] [PASSED] drm_gem_shmem_test_madvise
[05:33:55] [PASSED] drm_gem_shmem_test_purge
[05:33:55] ================== [PASSED] drm_gem_shmem ==================
[05:33:55] ==================== drm-test-managed  =====================
[05:33:55] [PASSED] drm_test_managed_run_action
[05:33:55] ================ [PASSED] drm-test-managed =================
[05:33:55] ========================= drm_mm  ==========================
[05:33:55] [PASSED] drm_test_mm_init
[05:33:55] [PASSED] drm_test_mm_debug
[05:33:55] [PASSED] drm_test_mm_align32
[05:33:55] [PASSED] drm_test_mm_align64
[05:33:55] [PASSED] drm_test_mm_lowest
[05:33:55] [PASSED] drm_test_mm_highest
[05:33:55] ===================== [PASSED] drm_mm ======================
[05:33:55] =================== drm_modes_analog_tv  ===================
[05:33:55] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[05:33:55] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[05:33:55] [PASSED] drm_test_modes_analog_tv_pal_576i
[05:33:55] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[05:33:55] =============== [PASSED] drm_modes_analog_tv ===============
[05:33:55] ==================== drm_plane_helper  =====================
[05:33:55] =============== drm_test_check_plane_state  ================
[05:33:55] [PASSED] clipping_simple
[05:33:55] [PASSED] clipping_rotate_reflect
[05:33:55] [PASSED] positioning_simple
[05:33:55] [PASSED] upscaling
[05:33:55] [PASSED] downscaling
[05:33:55] [PASSED] rounding1
[05:33:55] [PASSED] rounding2
[05:33:55] [PASSED] rounding3
[05:33:55] [PASSED] rounding4
[05:33:55] =========== [PASSED] drm_test_check_plane_state ============
[05:33:55] =========== drm_test_check_invalid_plane_state  ============
[05:33:55] [PASSED] positioning_invalid
[05:33:55] [PASSED] upscaling_invalid
[05:33:55] [PASSED] downscaling_invalid
[05:33:55] ======= [PASSED] drm_test_check_invalid_plane_state ========
[05:33:55] ================ [PASSED] drm_plane_helper =================
[05:33:55] ============ drm_connector_helper_tv_get_modes  ============
[05:33:55] ====== drm_test_connector_helper_tv_get_modes_check  =======
[05:33:55] [PASSED] None
[05:33:55] [PASSED] PAL
[05:33:55] [PASSED] NTSC
[05:33:55] [PASSED] Both, NTSC Default
[05:33:55] [PASSED] Both, PAL Default
[05:33:55] [PASSED] Both, NTSC Default, with PAL on command-line
[05:33:55] [PASSED] Both, PAL Default, with NTSC on command-line
[05:33:55] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[05:33:55] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[05:33:55] ======================== drm_rect  =========================
[05:33:55] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[05:33:55] [PASSED] drm_test_rect_clip_scaled_not_clipped
[05:33:55] [PASSED] drm_test_rect_clip_scaled_clipped
[05:33:55] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[05:33:55] ================= drm_test_rect_intersect  =================
[05:33:55] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[05:33:55] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
stty: 'standard input': Inappropriate ioctl for device
[05:33:55] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[05:33:55] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[05:33:55] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[05:33:55] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[05:33:55] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[05:33:55] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[05:33:55] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[05:33:55] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[05:33:55] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[05:33:55] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[05:33:55] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[05:33:55] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[05:33:55] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[05:33:55] ============= [PASSED] drm_test_rect_intersect =============
[05:33:55] ================ drm_test_rect_calc_hscale  ================
[05:33:55] [PASSED] normal use
[05:33:55] [PASSED] out of max range
[05:33:55] [PASSED] out of min range
[05:33:55] [PASSED] zero dst
[05:33:55] [PASSED] negative src
[05:33:55] [PASSED] negative dst
[05:33:55] ============ [PASSED] drm_test_rect_calc_hscale ============
[05:33:55] ================ drm_test_rect_calc_vscale  ================
[05:33:55] [PASSED] normal use
[05:33:55] [PASSED] out of max range
[05:33:55] [PASSED] out of min range
[05:33:55] [PASSED] zero dst
[05:33:55] [PASSED] negative src
[05:33:55] [PASSED] negative dst
[05:33:55] ============ [PASSED] drm_test_rect_calc_vscale ============
[05:33:55] ================== drm_test_rect_rotate  ===================
[05:33:55] [PASSED] reflect-x
[05:33:55] [PASSED] reflect-y
[05:33:55] [PASSED] rotate-0
[05:33:55] [PASSED] rotate-90
[05:33:55] [PASSED] rotate-180
[05:33:55] [PASSED] rotate-270
[05:33:55] ============== [PASSED] drm_test_rect_rotate ===============
[05:33:55] ================ drm_test_rect_rotate_inv  =================
[05:33:55] [PASSED] reflect-x
[05:33:55] [PASSED] reflect-y
[05:33:55] [PASSED] rotate-0
[05:33:55] [PASSED] rotate-90
[05:33:55] [PASSED] rotate-180
[05:33:55] [PASSED] rotate-270
[05:33:55] ============ [PASSED] drm_test_rect_rotate_inv =============
[05:33:55] ==================== [PASSED] drm_rect =====================
[05:33:55] ============================================================
[05:33:55] Testing complete. Ran 390 tests: passed: 390
[05:33:55] Elapsed time: 22.057s total, 1.665s configuring, 20.214s building, 0.175s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


