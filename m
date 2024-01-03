Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5746EC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 19:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6B410E358;
	Wed,  3 Jan 2024 19:25:49 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6139910E2D2;
 Wed,  3 Jan 2024 19:25:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/xe2=3A_Use_XE=5FCACHE?=
 =?utf-8?q?=5FWB_pat_index_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Date: Wed, 03 Jan 2024 19:25:48 -0000
Message-ID: <170430994839.82.265327442261648557@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240102165142.853141-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240102165142.853141-1-himal.prasad.ghimiray@intel.com>
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

Series: drm/xe/xe2: Use XE_CACHE_WB pat index (rev2)
URL   : https://patchwork.freedesktop.org/series/128110/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[19:24:56] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:25:00] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[19:25:23] Starting KUnit Kernel (1/1)...
[19:25:23] ============================================================
[19:25:24] ========================= guc_dbm  =========================
[19:25:24] [PASSED] test_empty
[19:25:24] [PASSED] test_default
[19:25:24] ======================== test_size  ========================
[19:25:24] [PASSED] 4
[19:25:24] [PASSED] 8
[19:25:24] [PASSED] 32
[19:25:24] [PASSED] 256
[19:25:24] ==================== [PASSED] test_size ====================
[19:25:24] ======================= test_reuse  ========================
[19:25:24] [PASSED] 4
[19:25:24] [PASSED] 8
[19:25:24] [PASSED] 32
[19:25:24] [PASSED] 256
[19:25:24] =================== [PASSED] test_reuse ====================
[19:25:24] =================== test_range_overlap  ====================
[19:25:24] [PASSED] 4
[19:25:24] [PASSED] 8
[19:25:24] [PASSED] 32
[19:25:24] [PASSED] 256
[19:25:24] =============== [PASSED] test_range_overlap ================
[19:25:24] =================== test_range_compact  ====================
[19:25:24] [PASSED] 4
[19:25:24] [PASSED] 8
[19:25:24] [PASSED] 32
[19:25:24] [PASSED] 256
[19:25:24] =============== [PASSED] test_range_compact ================
[19:25:24] ==================== test_range_spare  =====================
[19:25:24] [PASSED] 4
[19:25:24] [PASSED] 8
[19:25:24] [PASSED] 32
[19:25:24] [PASSED] 256
[19:25:24] ================ [PASSED] test_range_spare =================
[19:25:24] ===================== [PASSED] guc_dbm =====================
[19:25:24] ========================== lmtt  ===========================
[19:25:24] ======================== test_ops  =========================
[19:25:24] [PASSED] 2-level
[19:25:24] [PASSED] multi-level
[19:25:24] ==================== [PASSED] test_ops =====================
[19:25:24] ====================== [PASSED] lmtt =======================
[19:25:24] ========================== xe_bo  ==========================
[19:25:24] [SKIPPED] xe_ccs_migrate_kunit
[19:25:24] [SKIPPED] xe_bo_evict_kunit
[19:25:24] ===================== [SKIPPED] xe_bo ======================
[19:25:24] ======================= xe_dma_buf  ========================
[19:25:24] [SKIPPED] xe_dma_buf_kunit
[19:25:24] =================== [SKIPPED] xe_dma_buf ===================
[19:25:24] ======================= xe_migrate  ========================
[19:25:24] [SKIPPED] xe_migrate_sanity_kunit
[19:25:24] =================== [SKIPPED] xe_migrate ===================
[19:25:24] ========================= xe_mocs  =========================
[19:25:24] [SKIPPED] xe_live_mocs_kernel_kunit
[19:25:24] ==================== [SKIPPED] xe_mocs =====================
[19:25:24] ========================= xe_pci  ==========================
[19:25:24] [PASSED] xe_gmdid_graphics_ip
[19:25:24] [PASSED] xe_gmdid_media_ip
[19:25:24] ===================== [PASSED] xe_pci ======================
[19:25:24] ========================= xe_rtp  ==========================
[19:25:24] ================== xe_rtp_process_tests  ===================
[19:25:24] [PASSED] coalesce-same-reg
[19:25:24] [PASSED] no-match-no-add
[19:25:24] [PASSED] no-match-no-add-multiple-rules
[19:25:24] [PASSED] two-regs-two-entries
[19:25:24] [PASSED] clr-one-set-other
[19:25:24] [PASSED] set-field
[19:25:24] [PASSED] conflict-duplicate
[19:25:24] [PASSED] conflict-not-disjoint
[19:25:24] [PASSED] conflict-reg-type
[19:25:24] ============== [PASSED] xe_rtp_process_tests ===============
[19:25:24] ===================== [PASSED] xe_rtp ======================
[19:25:24] ========================== xe_wa  ==========================
[19:25:24] ======================== xe_wa_gt  =========================
[19:25:24] [PASSED] TIGERLAKE (B0)
[19:25:24] [PASSED] DG1 (A0)
[19:25:24] [PASSED] DG1 (B0)
[19:25:24] [PASSED] ALDERLAKE_S (A0)
[19:25:24] [PASSED] ALDERLAKE_S (B0)
[19:25:24] [PASSED] ALDERLAKE_S (C0)
[19:25:24] [PASSED] ALDERLAKE_S (D0)
[19:25:24] [PASSED] ALDERLAKE_P (A0)
[19:25:24] [PASSED] ALDERLAKE_P (B0)
[19:25:24] [PASSED] ALDERLAKE_P (C0)
[19:25:24] [PASSED] ALDERLAKE_S_RPLS (D0)
[19:25:24] [PASSED] ALDERLAKE_P_RPLU (E0)
[19:25:24] [PASSED] DG2_G10 (A0)
[19:25:24] [PASSED] DG2_G10 (A1)
[19:25:24] [PASSED] DG2_G10 (B0)
[19:25:24] [PASSED] DG2_G10 (C0)
[19:25:24] [PASSED] DG2_G11 (A0)
[19:25:24] [PASSED] DG2_G11 (B0)
[19:25:24] [PASSED] DG2_G11 (B1)
[19:25:24] [PASSED] DG2_G12 (A0)
[19:25:24] [PASSED] DG2_G12 (A1)
[19:25:24] [PASSED] PVC (B0)
[19:25:24] [PASSED] PVC (B1)
[19:25:24] [PASSED] PVC (C0)
[19:25:24] [PASSED] METEORLAKE (g:A0, m:A0)
[19:25:24] [PASSED] METEORLAKE (g:A0, m:A0)
[19:25:24] [PASSED] LUNARLAKE (g:A0, m:A0)
[19:25:24] [PASSED] LUNARLAKE (g:B0, m:A0)
[19:25:24] ==================== [PASSED] xe_wa_gt =====================
[19:25:24] ====================== [PASSED] xe_wa ======================
[19:25:24] ============================================================
[19:25:24] Testing complete. Ran 68 tests: passed: 63, skipped: 5
[19:25:24] Elapsed time: 27.438s total, 4.193s configuring, 23.024s building, 0.182s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[19:25:24] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:25:25] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[19:25:46] Starting KUnit Kernel (1/1)...
[19:25:46] ============================================================
[19:25:46] ================== drm_test_pick_cmdline  ==================
[19:25:46] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[19:25:46] =============== drm_test_pick_cmdline_named  ===============
[19:25:46] [PASSED] NTSC
[19:25:46] [PASSED] NTSC-J
[19:25:46] [PASSED] PAL
[19:25:46] [PASSED] PAL-M
[19:25:46] =========== [PASSED] drm_test_pick_cmdline_named ===========
[19:25:46] ============== [PASSED] drm_test_pick_cmdline ==============
[19:25:46] ======================== drm_buddy  ========================
[19:25:46] [PASSED] drm_test_buddy_alloc_limit
[19:25:46] [PASSED] drm_test_buddy_alloc_optimistic
[19:25:46] [PASSED] drm_test_buddy_alloc_pessimistic
[19:25:46] [PASSED] drm_test_buddy_alloc_pathological
[19:25:46] ==================== [PASSED] drm_buddy ====================
[19:25:46] =================== drm_cmdline_parser  ====================
[19:25:46] [PASSED] drm_test_cmdline_force_d_only
[19:25:46] [PASSED] drm_test_cmdline_force_D_only_dvi
[19:25:46] [PASSED] drm_test_cmdline_force_D_only_hdmi
[19:25:46] [PASSED] drm_test_cmdline_force_D_only_not_digital
[19:25:46] [PASSED] drm_test_cmdline_force_e_only
[19:25:46] [PASSED] drm_test_cmdline_res
[19:25:46] [PASSED] drm_test_cmdline_res_vesa
[19:25:46] [PASSED] drm_test_cmdline_res_vesa_rblank
[19:25:46] [PASSED] drm_test_cmdline_res_rblank
[19:25:46] [PASSED] drm_test_cmdline_res_bpp
[19:25:46] [PASSED] drm_test_cmdline_res_refresh
[19:25:46] [PASSED] drm_test_cmdline_res_bpp_refresh
[19:25:46] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[19:25:46] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[19:25:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[19:25:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[19:25:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[19:25:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[19:25:46] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[19:25:46] [PASSED] drm_test_cmdline_res_margins_force_on
[19:25:46] [PASSED] drm_test_cmdline_res_vesa_margins
[19:25:46] [PASSED] drm_test_cmdline_name
[19:25:46] [PASSED] drm_test_cmdline_name_bpp
[19:25:46] [PASSED] drm_test_cmdline_name_option
[19:25:46] [PASSED] drm_test_cmdline_name_bpp_option
[19:25:46] [PASSED] drm_test_cmdline_rotate_0
[19:25:46] [PASSED] drm_test_cmdline_rotate_90
[19:25:46] [PASSED] drm_test_cmdline_rotate_180
[19:25:46] [PASSED] drm_test_cmdline_rotate_270
[19:25:46] [PASSED] drm_test_cmdline_hmirror
[19:25:46] [PASSED] drm_test_cmdline_vmirror
[19:25:46] [PASSED] drm_test_cmdline_margin_options
[19:25:46] [PASSED] drm_test_cmdline_multiple_options
[19:25:46] [PASSED] drm_test_cmdline_bpp_extra_and_option
[19:25:46] [PASSED] drm_test_cmdline_extra_and_option
[19:25:46] [PASSED] drm_test_cmdline_freestanding_options
[19:25:46] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[19:25:46] [PASSED] drm_test_cmdline_panel_orientation
[19:25:46] ================ drm_test_cmdline_invalid  =================
[19:25:46] [PASSED] margin_only
[19:25:46] [PASSED] interlace_only
[19:25:46] [PASSED] res_missing_x
[19:25:46] [PASSED] res_missing_y
[19:25:46] [PASSED] res_bad_y
[19:25:46] [PASSED] res_missing_y_bpp
[19:25:46] [PASSED] res_bad_bpp
[19:25:46] [PASSED] res_bad_refresh
[19:25:46] [PASSED] res_bpp_refresh_force_on_off
[19:25:46] [PASSED] res_invalid_mode
[19:25:46] [PASSED] res_bpp_wrong_place_mode
[19:25:46] [PASSED] name_bpp_refresh
[19:25:46] [PASSED] name_refresh
[19:25:46] [PASSED] name_refresh_wrong_mode
[19:25:46] [PASSED] name_refresh_invalid_mode
[19:25:46] [PASSED] rotate_multiple
[19:25:46] [PASSED] rotate_invalid_val
[19:25:46] [PASSED] rotate_truncated
[19:25:46] [PASSED] invalid_option
[19:25:46] [PASSED] invalid_tv_option
[19:25:46] [PASSED] truncated_tv_option
[19:25:46] ============ [PASSED] drm_test_cmdline_invalid =============
[19:25:46] =============== drm_test_cmdline_tv_options  ===============
[19:25:46] [PASSED] NTSC
[19:25:46] [PASSED] NTSC_443
[19:25:46] [PASSED] NTSC_J
[19:25:46] [PASSED] PAL
[19:25:46] [PASSED] PAL_M
[19:25:46] [PASSED] PAL_N
[19:25:46] [PASSED] SECAM
[19:25:46] =========== [PASSED] drm_test_cmdline_tv_options ===========
[19:25:46] =============== [PASSED] drm_cmdline_parser ================
[19:25:46] ================ drm_get_tv_mode_from_name  ================
[19:25:46] ========== drm_test_get_tv_mode_from_name_valid  ===========
[19:25:46] [PASSED] NTSC
[19:25:46] [PASSED] NTSC-443
[19:25:46] [PASSED] NTSC-J
[19:25:46] [PASSED] PAL
[19:25:46] [PASSED] PAL-M
[19:25:46] [PASSED] PAL-N
[19:25:46] [PASSED] SECAM
[19:25:46] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[19:25:46] [PASSED] drm_test_get_tv_mode_from_name_truncated
[19:25:46] ============ [PASSED] drm_get_tv_mode_from_name ============
[19:25:46] ==================== drm_damage_helper  ====================
[19:25:46] [PASSED] drm_test_damage_iter_no_damage
[19:25:46] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[19:25:46] [PASSED] drm_test_damage_iter_no_damage_src_moved
[19:25:46] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[19:25:46] [PASSED] drm_test_damage_iter_no_damage_not_visible
[19:25:46] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[19:25:46] [PASSED] drm_test_damage_iter_no_damage_no_fb
[19:25:46] [PASSED] drm_test_damage_iter_simple_damage
[19:25:46] [PASSED] drm_test_damage_iter_single_damage
[19:25:46] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[19:25:46] [PASSED] drm_test_damage_iter_single_damage_outside_src
[19:25:46] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[19:25:46] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[19:25:46] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[19:25:46] [PASSED] drm_test_damage_iter_single_damage_src_moved
[19:25:46] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[19:25:46] [PASSED] drm_test_damage_iter_damage
[19:25:46] [PASSED] drm_test_damage_iter_damage_one_intersect
[19:25:46] [PASSED] drm_test_damage_iter_damage_one_outside
[19:25:46] [PASSED] drm_test_damage_iter_damage_src_moved
[19:25:46] [PASSED] drm_test_damage_iter_damage_not_visible
[19:25:46] ================ [PASSED] drm_damage_helper ================
[19:25:46] ==================== drm_dp_mst_helper  ====================
[19:25:46] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[19:25:46] [PASSED] Clock 154000 BPP 30 DSC disabled
[19:25:46] [PASSED] Clock 234000 BPP 30 DSC disabled
[19:25:46] [PASSED] Clock 297000 BPP 24 DSC disabled
[19:25:46] [PASSED] Clock 332880 BPP 24 DSC enabled
[19:25:46] [PASSED] Clock 324540 BPP 24 DSC enabled
[19:25:46] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[19:25:46] ============== drm_test_dp_mst_calc_pbn_div  ===============
[19:25:46] [PASSED] Link rate 2000000 lane count 4
[19:25:46] [PASSED] Link rate 2000000 lane count 2
[19:25:46] [PASSED] Link rate 2000000 lane count 1
[19:25:46] [PASSED] Link rate 1350000 lane count 4
[19:25:46] [PASSED] Link rate 1350000 lane count 2
[19:25:46] [PASSED] Link rate 1350000 lane count 1
[19:25:46] [PASSED] Link rate 1000000 lane count 4
[19:25:46] [PASSED] Link rate 1000000 lane count 2
[19:25:46] [PASSED] Link rate 1000000 lane count 1
[19:25:46] [PASSED] Link rate 810000 lane count 4
[19:25:46] [PASSED] Link rate 810000 lane count 2
[19:25:46] [PASSED] Link rate 810000 lane count 1
[19:25:46] [PASSED] Link rate 540000 lane count 4
[19:25:46] [PASSED] Link rate 540000 lane count 2
[19:25:46] [PASSED] Link rate 540000 lane count 1
[19:25:46] [PASSED] Link rate 270000 lane count 4
[19:25:46] [PASSED] Link rate 270000 lane count 2
[19:25:46] [PASSED] Link rate 270000 lane count 1
[19:25:46] [PASSED] Link rate 162000 lane count 4
[19:25:46] [PASSED] Link rate 162000 lane count 2
[19:25:46] [PASSED] Link rate 162000 lane count 1
[19:25:46] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[19:25:46] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[19:25:46] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[19:25:46] [PASSED] DP_POWER_UP_PHY with port number
[19:25:46] [PASSED] DP_POWER_DOWN_PHY with port number
[19:25:46] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[19:25:46] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[19:25:46] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[19:25:46] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[19:25:46] [PASSED] DP_QUERY_PAYLOAD with port number
[19:25:46] [PASSED] DP_QUERY_PAYLOAD with VCPI
[19:25:46] [PASSED] DP_REMOTE_DPCD_READ with port number
[19:25:46] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[19:25:46] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[19:25:46] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[19:25:46] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[19:25:46] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[19:25:46] [PASSED] DP_REMOTE_I2C_READ with port number
[19:25:46] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[19:25:46] [PASSED] DP_REMOTE_I2C_READ with transactions array
[19:25:46] [PASSED] DP_REMOTE_I2C_WRITE with port number
[19:25:46] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[19:25:46] [PASSED] DP_REMOTE_I2C_WRITE with data array
[19:25:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[19:25:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[19:25:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[19:25:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[19:25:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[19:25:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[19:25:46] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[19:25:46] ================ [PASSED] drm_dp_mst_helper ================
[19:25:46] ======================== drm_exec  =========================
[19:25:46] [PASSED] sanitycheck
[19:25:46] [PASSED] test_lock
[19:25:46] [PASSED] test_lock_unlock
[19:25:46] [PASSED] test_duplicates
[19:25:46] [PASSED] test_prepare
[19:25:46] [PASSED] test_prepare_array
[19:25:46] [PASSED] test_multiple_loops
[19:25:46] ==================== [PASSED] drm_exec =====================
[19:25:46] ================= drm_format_helper_test  ==================
[19:25:46] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[19:25:46] [PASSED] single_pixel_source_buffer
[19:25:46] [PASSED] single_pixel_clip_rectangle
[19:25:46] [PASSED] well_known_colors
[19:25:46] [PASSED] destination_pitch
[19:25:46] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[19:25:46] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[19:25:46] [PASSED] single_pixel_source_buffer
[19:25:46] [PASSED] single_pixel_clip_rectangle
[19:25:46] [PASSED] well_known_colors
[19:25:46] [PASSED] destination_pitch
[19:25:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[19:25:46] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[19:25:46] [PASSED] single_pixel_source_buffer
[19:25:46] [PASSED] single_pixel_clip_rectangle
[19:25:46] [PASSED] well_known_colors
[19:25:46] [PASSED] destination_pitch
[19:25:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[19:25:46] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[19:25:46] [PASSED] single_pixel_source_buffer
[19:25:46] [PASSED] single_pixel_clip_rectangle
[19:25:46] [PASSED] well_known_colors
[19:25:46] [PASSED] destination_pitch
[19:25:46] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[19:25:46] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[19:25:46] [PASSED] single_pixel_source_buffer
[19:25:46] [PASSED] single_pixel_clip_rectangle
[19:25:46] [PASSED] well_known_colors
[19:25:46] [PASSED] destination_pitch
[19:25:46] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[19:25:46] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[19:25:46] [PASSED] single_pixel_source_buffer
[19:25:46] [PASSED] single_pixel_clip_rectangle
[19:25:46] [PASSED] well_known_colors
[19:25:46] [PASSED] destination_pitch
[19:25:46] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[19:25:46] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[19:25:46] [PASSED] single_pixel_source_buffer
[19:25:46] [PASSED] single_pixel_clip_rectangle
[19:25:46] [PASSED] well_known_colors
[19:25:46] [PASSED] destination_pitch
[19:25:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[19:25:46] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[19:25:46] [PASSED] single_pixel_source_buffer
[19:25:46] [PASSED] single_pixel_clip_rectangle
[19:25:46] [PASSED] well_known_colors
[19:25:46] [PASSED] destination_pitch
[19:25:46] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[19:25:46] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[19:25:46] [PASSED] single_pixel_source_buffer
[19:25:46] [PASSED] single_pixel_clip_rectangle
[19:25:46] [PASSED] well_known_colors
[19:25:46] [PASSED] destination_pitch
[19:25:46] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[19:25:46] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[19:25:46] [PASSED] single_pixel_source_buffer
[19:25:46] [PASSED] single_pixel_clip_rectangle
[19:25:46] [PASSED] well_known_colors
[19:25:46] [PASSED] destination_pitch
[19:25:46] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[19:25:46] ============== drm_test_fb_xrgb8888_to_mono  ===============
[19:25:46] [PASSED] single_pixel_source_buffer
[19:25:46] [PASSED] single_pixel_clip_rectangle
[19:25:46] [PASSED] well_known_colors
[19:25:46] [PASSED] destination_pitch
[19:25:46] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[19:25:46] ==================== drm_test_fb_swab  =====================
[19:25:46] [PASSED] single_pixel_source_buffer
[19:25:46] [PASSED] single_pixel_clip_rectangle
[19:25:46] [PASSED] well_known_colors
[19:25:46] [PASSED] destination_pitch
[19:25:46] ================ [PASSED] drm_test_fb_swab =================
[19:25:46] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[19:25:46] [PASSED] single_pixel_source_buffer
[19:25:46] [PASSED] single_pixel_clip_rectangle
[19:25:46] [PASSED] well_known_colors
[19:25:46] [PASSED] destination_pitch
[19:25:46] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[19:25:46] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[19:25:46] [PASSED] single_pixel_source_buffer
[19:25:46] [PASSED] single_pixel_clip_rectangle
[19:25:46] [PASSED] well_known_colors
[19:25:46] [PASSED] destination_pitch
[19:25:46] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[19:25:46] ================= drm_test_fb_clip_offset  =================
[19:25:46] [PASSED] pass through
[19:25:46] [PASSED] horizontal offset
[19:25:46] [PASSED] vertical offset
[19:25:46] [PASSED] horizontal and vertical offset
[19:25:46] [PASSED] horizontal offset (custom pitch)
[19:25:46] [PASSED] vertical offset (custom pitch)
[19:25:46] [PASSED] horizontal and vertical offset (custom pitch)
[19:25:46] ============= [PASSED] drm_test_fb_clip_offset =============
[19:25:46] ============== drm_test_fb_build_fourcc_list  ==============
[19:25:46] [PASSED] no native formats
[19:25:46] [PASSED] XRGB8888 as native format
[19:25:46] [PASSED] remove duplicates
[19:25:46] [PASSED] convert alpha formats
[19:25:46] [PASSED] random formats
[19:25:46] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[19:25:46] =================== drm_test_fb_memcpy  ====================
[19:25:46] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[19:25:46] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[19:25:46] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[19:25:46] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[19:25:46] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[19:25:46] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[19:25:46] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[19:25:46] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[19:25:46] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[19:25:46] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[19:25:46] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[19:25:46] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[19:25:46] =============== [PASSED] drm_test_fb_memcpy ================
[19:25:46] ============= [PASSED] drm_format_helper_test ==============
[19:25:46] ======================= drm_format  ========================
[19:25:46] [PASSED] drm_test_format_block_width_invalid
[19:25:46] [PASSED] drm_test_format_block_width_one_plane
[19:25:46] [PASSED] drm_test_format_block_width_two_plane
[19:25:46] [PASSED] drm_test_format_block_width_three_plane
[19:25:46] [PASSED] drm_test_format_block_width_tiled
[19:25:46] [PASSED] drm_test_format_block_height_invalid
[19:25:46] [PASSED] drm_test_format_block_height_one_plane
[19:25:46] [PASSED] drm_test_format_block_height_two_plane
[19:25:46] [PASSED] drm_test_format_block_height_three_plane
[19:25:46] [PASSED] drm_test_format_block_height_tiled
[19:25:46] [PASSED] drm_test_format_min_pitch_invalid
[19:25:46] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[19:25:46] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[19:25:46] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[19:25:46] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[19:25:46] [PASSED] drm_test_format_min_pitch_two_plane
[19:25:46] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[19:25:46] [PASSED] drm_test_format_min_pitch_tiled
[19:25:46] =================== [PASSED] drm_format ====================
[19:25:46] ===================== drm_framebuffer  =====================
[19:25:46] =============== drm_test_framebuffer_create  ===============
[19:25:46] [PASSED] ABGR8888 normal sizes
[19:25:46] [PASSED] ABGR8888 max sizes
[19:25:46] [PASSED] ABGR8888 pitch greater than min required
[19:25:46] [PASSED] ABGR8888 pitch less than min required
[19:25:46] [PASSED] ABGR8888 Invalid width
[19:25:46] [PASSED] ABGR8888 Invalid buffer handle
[19:25:46] [PASSED] No pixel format
[19:25:46] [PASSED] ABGR8888 Width 0
[19:25:46] [PASSED] ABGR8888 Height 0
[19:25:46] [PASSED] ABGR8888 Out of bound height * pitch combination
[19:25:46] [PASSED] ABGR8888 Large buffer offset
[19:25:46] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[19:25:46] [PASSED] ABGR8888 Valid buffer modifier
[19:25:46] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[19:25:46] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[19:25:46] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[19:25:46] [PASSED] NV12 Normal sizes
[19:25:46] [PASSED] NV12 Max sizes
[19:25:46] [PASSED] NV12 Invalid pitch
[19:25:46] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[19:25:46] [PASSED] NV12 different  modifier per-plane
[19:25:46] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[19:25:46] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[19:25:46] [PASSED] NV12 Modifier for inexistent plane
[19:25:46] [PASSED] NV12 Handle for inexistent plane
[19:25:46] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[19:25:46] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[19:25:46] [PASSED] YVU420 Normal sizes
[19:25:46] [PASSED] YVU420 Max sizes
[19:25:46] [PASSED] YVU420 Invalid pitch
[19:25:46] [PASSED] YVU420 Different pitches
[19:25:46] [PASSED] YVU420 Different buffer offsets/pitches
[19:25:46] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[19:25:46] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[19:25:46] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[19:25:46] [PASSED] YVU420 Valid modifier
[19:25:46] [PASSED] YVU420 Different modifiers per plane
[19:25:46] [PASSED] YVU420 Modifier for inexistent plane
[19:25:46] [PASSED] X0L2 Normal sizes
[19:25:46] [PASSED] X0L2 Max sizes
[19:25:46] [PASSED] X0L2 Invalid pitch
[19:25:46] [PASSED] X0L2 Pitch greater than minimum required
[19:25:46] [PASSED] X0L2 Handle for inexistent plane
[19:25:46] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[19:25:46] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[19:25:46] [PASSED] X0L2 Valid modifier
[19:25:46] [PASSED] X0L2 Modifier for inexistent plane
[19:25:46] =========== [PASSED] drm_test_framebuffer_create ===========
[19:25:46] ================= [PASSED] drm_framebuffer =================
[19:25:46] ====================== drm_gem_shmem  ======================
[19:25:46] [PASSED] drm_gem_shmem_test_obj_create
[19:25:46] [PASSED] drm_gem_shmem_test_obj_create_private
[19:25:46] [PASSED] drm_gem_shmem_test_pin_pages
[19:25:46] [PASSED] drm_gem_shmem_test_vmap
[19:25:46] [PASSED] drm_gem_shmem_test_get_pages_sgt
[19:25:46] [PASSED] drm_gem_shmem_test_get_sg_table
[19:25:46] [PASSED] drm_gem_shmem_test_madvise
[19:25:46] [PASSED] drm_gem_shmem_test_purge
[19:25:46] ================== [PASSED] drm_gem_shmem ==================
[19:25:46] ==================== drm-test-managed  =====================
[19:25:46] [PASSED] drm_test_managed_run_action
[19:25:46] ================ [PASSED] drm-test-managed =================
[19:25:46] ========================= drm_mm  ==========================
[19:25:46] [PASSED] drm_test_mm_init
[19:25:46] [PASSED] drm_test_mm_debug
[19:25:46] [PASSED] drm_test_mm_align32
[19:25:46] [PASSED] drm_test_mm_align64
[19:25:46] [PASSED] drm_test_mm_lowest
[19:25:46] [PASSED] drm_test_mm_highest
[19:25:46] ===================== [PASSED] drm_mm ======================
[19:25:46] =================== drm_modes_analog_tv  ===================
[19:25:46] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[19:25:46] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[19:25:46] [PASSED] drm_test_modes_analog_tv_pal_576i
[19:25:46] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[19:25:46] =============== [PASSED] drm_modes_analog_tv ===============
[19:25:46] ==================== drm_plane_helper  =====================
[19:25:46] =============== drm_test_check_plane_state  ================
[19:25:46] [PASSED] clipping_simple
[19:25:46] [PASSED] clipping_rotate_reflect
[19:25:46] [PASSED] positioning_simple
[19:25:46] [PASSED] upscaling
[19:25:46] [PASSED] downscaling
[19:25:46] [PASSED] rounding1
[19:25:46] [PASSED] rounding2
[19:25:46] [PASSED] rounding3
[19:25:46] [PASSED] rounding4
[19:25:46] =========== [PASSED] drm_test_check_plane_state ============
[19:25:46] =========== drm_test_check_invalid_plane_state  ============
[19:25:46] [PASSED] positioning_invalid
[19:25:46] [PASSED] upscaling_invalid
[19:25:46] [PASSED] downscaling_invalid
[19:25:46] ======= [PASSED] drm_test_check_invalid_plane_state ========
[19:25:46] ================ [PASSED] drm_plane_helper =================
[19:25:46] ============ drm_connector_helper_tv_get_modes  ============
[19:25:46] ====== drm_test_connector_helper_tv_get_modes_check  =======
[19:25:46] [PASSED] None
[19:25:46] [PASSED] PAL
[19:25:46] [PASSED] NTSC
[19:25:46] [PASSED] Both, NTSC Default
[19:25:46] [PASSED] Both, PAL Default
[19:25:46] [PASSED] Both, NTSC Default, with PAL on command-line
[19:25:46] [PASSED] Both, PAL Default, with NTSC on command-line
[19:25:46] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[19:25:46] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[19:25:46] ======================== drm_rect  =========================
[19:25:46] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[19:25:46] [PASSED] drm_test_rect_clip_scaled_not_clipped
[19:25:46] [PASSED] drm_test_rect_clip_scaled_clipped
[19:25:46] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[19:25:46] ================= drm_test_rect_intersect  =================
[19:25:46] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[19:25:46] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
stty: 'standard input': Inappropriate ioctl for device
[19:25:46] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[19:25:46] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[19:25:46] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[19:25:46] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[19:25:46] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[19:25:46] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[19:25:46] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[19:25:46] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[19:25:46] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[19:25:46] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[19:25:46] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[19:25:46] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[19:25:46] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[19:25:46] ============= [PASSED] drm_test_rect_intersect =============
[19:25:46] ================ drm_test_rect_calc_hscale  ================
[19:25:46] [PASSED] normal use
[19:25:46] [PASSED] out of max range
[19:25:46] [PASSED] out of min range
[19:25:46] [PASSED] zero dst
[19:25:46] [PASSED] negative src
[19:25:46] [PASSED] negative dst
[19:25:46] ============ [PASSED] drm_test_rect_calc_hscale ============
[19:25:46] ================ drm_test_rect_calc_vscale  ================
[19:25:46] [PASSED] normal use
[19:25:46] [PASSED] out of max range
[19:25:46] [PASSED] out of min range
[19:25:46] [PASSED] zero dst
[19:25:46] [PASSED] negative src
[19:25:46] [PASSED] negative dst
[19:25:46] ============ [PASSED] drm_test_rect_calc_vscale ============
[19:25:46] ================== drm_test_rect_rotate  ===================
[19:25:46] [PASSED] reflect-x
[19:25:46] [PASSED] reflect-y
[19:25:46] [PASSED] rotate-0
[19:25:46] [PASSED] rotate-90
[19:25:46] [PASSED] rotate-180
[19:25:46] [PASSED] rotate-270
[19:25:46] ============== [PASSED] drm_test_rect_rotate ===============
[19:25:46] ================ drm_test_rect_rotate_inv  =================
[19:25:46] [PASSED] reflect-x
[19:25:46] [PASSED] reflect-y
[19:25:46] [PASSED] rotate-0
[19:25:46] [PASSED] rotate-90
[19:25:46] [PASSED] rotate-180
[19:25:46] [PASSED] rotate-270
[19:25:46] ============ [PASSED] drm_test_rect_rotate_inv =============
[19:25:46] ==================== [PASSED] drm_rect =====================
[19:25:46] ============================================================
[19:25:46] Testing complete. Ran 390 tests: passed: 390
[19:25:46] Elapsed time: 22.060s total, 1.670s configuring, 20.267s building, 0.121s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


