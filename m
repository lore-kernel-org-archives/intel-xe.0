Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78575C4707B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 15:24:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FF310E614;
	Wed, 10 Jan 2024 15:24:28 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06BD10E614;
 Wed, 10 Jan 2024 15:24:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_PM_snippet?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 10 Jan 2024 15:24:26 -0000
Message-ID: <170490026691.216241.14037801222518505337@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240110152033.1414372-1-matthew.brost@intel.com>
In-Reply-To: <20240110152033.1414372-1-matthew.brost@intel.com>
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

Series: drm/xe: PM snippet
URL   : https://patchwork.freedesktop.org/series/128434/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[15:23:35] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:23:39] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[15:24:02] Starting KUnit Kernel (1/1)...
[15:24:02] ============================================================
[15:24:02] ========================= guc_dbm  =========================
[15:24:02] [PASSED] test_empty
[15:24:02] [PASSED] test_default
[15:24:02] ======================== test_size  ========================
[15:24:02] [PASSED] 4
[15:24:02] [PASSED] 8
[15:24:02] [PASSED] 32
[15:24:02] [PASSED] 256
[15:24:02] ==================== [PASSED] test_size ====================
[15:24:02] ======================= test_reuse  ========================
[15:24:02] [PASSED] 4
[15:24:02] [PASSED] 8
[15:24:02] [PASSED] 32
[15:24:02] [PASSED] 256
[15:24:02] =================== [PASSED] test_reuse ====================
[15:24:02] =================== test_range_overlap  ====================
[15:24:02] [PASSED] 4
[15:24:02] [PASSED] 8
[15:24:02] [PASSED] 32
[15:24:02] [PASSED] 256
[15:24:02] =============== [PASSED] test_range_overlap ================
[15:24:02] =================== test_range_compact  ====================
[15:24:02] [PASSED] 4
[15:24:02] [PASSED] 8
[15:24:02] [PASSED] 32
[15:24:02] [PASSED] 256
[15:24:02] =============== [PASSED] test_range_compact ================
[15:24:02] ==================== test_range_spare  =====================
[15:24:02] [PASSED] 4
[15:24:02] [PASSED] 8
[15:24:02] [PASSED] 32
[15:24:02] [PASSED] 256
[15:24:02] ================ [PASSED] test_range_spare =================
[15:24:02] ===================== [PASSED] guc_dbm =====================
[15:24:02] ======================== no_relay  =========================
[15:24:02] [PASSED] xe_drops_guc2pf_if_not_ready
[15:24:02] [PASSED] xe_drops_guc2vf_if_not_ready
[15:24:02] [PASSED] xe_rejects_send_if_not_ready
[15:24:02] ==================== [PASSED] no_relay =====================
[15:24:02] ======================== pf_relay  =========================
[15:24:02] [PASSED] pf_rejects_guc2pf_too_short
[15:24:02] [PASSED] pf_rejects_guc2pf_too_long
[15:24:02] [PASSED] pf_rejects_guc2pf_no_payload
[15:24:02] [PASSED] pf_fails_no_payload
[15:24:02] [PASSED] pf_fails_bad_origin
[15:24:02] [PASSED] pf_fails_bad_type
[15:24:02] [PASSED] pf_txn_reports_error
[15:24:02] [PASSED] pf_txn_sends_pf2guc
[15:24:02] [PASSED] pf_sends_pf2guc
[15:24:02] [SKIPPED] pf_loopback_nop
[15:24:02] [SKIPPED] pf_loopback_echo
[15:24:02] [SKIPPED] pf_loopback_fail
[15:24:02] [SKIPPED] pf_loopback_busy
[15:24:02] [SKIPPED] pf_loopback_retry
[15:24:02] ==================== [PASSED] pf_relay =====================
[15:24:02] ======================== vf_relay  =========================
[15:24:02] [PASSED] vf_rejects_guc2vf_too_short
[15:24:02] [PASSED] vf_rejects_guc2vf_too_long
[15:24:02] [PASSED] vf_rejects_guc2vf_no_payload
[15:24:02] ==================== [PASSED] vf_relay =====================
[15:24:02] ========================== lmtt  ===========================
[15:24:02] ======================== test_ops  =========================
[15:24:02] [PASSED] 2-level
[15:24:02] [PASSED] multi-level
[15:24:02] ==================== [PASSED] test_ops =====================
[15:24:02] ====================== [PASSED] lmtt =======================
[15:24:02] ========================== xe_bo  ==========================
[15:24:02] [SKIPPED] xe_ccs_migrate_kunit
[15:24:02] [SKIPPED] xe_bo_evict_kunit
[15:24:02] ===================== [SKIPPED] xe_bo ======================
[15:24:02] ======================= xe_dma_buf  ========================
[15:24:02] [SKIPPED] xe_dma_buf_kunit
[15:24:02] =================== [SKIPPED] xe_dma_buf ===================
[15:24:02] ======================= xe_migrate  ========================
[15:24:02] [SKIPPED] xe_migrate_sanity_kunit
[15:24:02] =================== [SKIPPED] xe_migrate ===================
[15:24:02] ========================= xe_mocs  =========================
[15:24:02] [SKIPPED] xe_live_mocs_kernel_kunit
[15:24:02] [SKIPPED] xe_live_mocs_reset_kunit
[15:24:02] ==================== [SKIPPED] xe_mocs =====================
[15:24:02] ========================= xe_pci  ==========================
[15:24:02] [PASSED] xe_gmdid_graphics_ip
[15:24:02] [PASSED] xe_gmdid_media_ip
[15:24:02] ===================== [PASSED] xe_pci ======================
[15:24:02] ========================= xe_rtp  ==========================
[15:24:02] ================== xe_rtp_process_tests  ===================
[15:24:02] [PASSED] coalesce-same-reg
[15:24:02] [PASSED] no-match-no-add
[15:24:02] [PASSED] no-match-no-add-multiple-rules
[15:24:02] [PASSED] two-regs-two-entries
[15:24:02] [PASSED] clr-one-set-other
[15:24:02] [PASSED] set-field
[15:24:02] [PASSED] conflict-duplicate
[15:24:02] [PASSED] conflict-not-disjoint
[15:24:02] [PASSED] conflict-reg-type
[15:24:02] ============== [PASSED] xe_rtp_process_tests ===============
[15:24:02] ===================== [PASSED] xe_rtp ======================
[15:24:02] ========================== xe_wa  ==========================
[15:24:02] ======================== xe_wa_gt  =========================
[15:24:02] [PASSED] TIGERLAKE (B0)
[15:24:02] [PASSED] DG1 (A0)
[15:24:02] [PASSED] DG1 (B0)
[15:24:02] [PASSED] ALDERLAKE_S (A0)
[15:24:02] [PASSED] ALDERLAKE_S (B0)
[15:24:02] [PASSED] ALDERLAKE_S (C0)
[15:24:02] [PASSED] ALDERLAKE_S (D0)
[15:24:02] [PASSED] ALDERLAKE_P (A0)
[15:24:02] [PASSED] ALDERLAKE_P (B0)
[15:24:02] [PASSED] ALDERLAKE_P (C0)
[15:24:02] [PASSED] ALDERLAKE_S_RPLS (D0)
[15:24:02] [PASSED] ALDERLAKE_P_RPLU (E0)
[15:24:02] [PASSED] DG2_G10 (C0)
[15:24:02] [PASSED] DG2_G11 (B1)
[15:24:02] [PASSED] DG2_G12 (A1)
[15:24:02] [PASSED] PVC (B0)
[15:24:02] [PASSED] PVC (B1)
[15:24:02] [PASSED] PVC (C0)
[15:24:02] [PASSED] METEORLAKE (g:A0, m:A0)
[15:24:02] [PASSED] METEORLAKE (g:A0, m:A0)
[15:24:02] [PASSED] LUNARLAKE (g:A0, m:A0)
[15:24:02] [PASSED] LUNARLAKE (g:B0, m:A0)
[15:24:02] ==================== [PASSED] xe_wa_gt =====================
[15:24:02] ====================== [PASSED] xe_wa ======================
[15:24:02] ============================================================
[15:24:02] Testing complete. Ran 83 tests: passed: 72, skipped: 11
[15:24:02] Elapsed time: 27.687s total, 4.185s configuring, 23.331s building, 0.147s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[15:24:02] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:24:04] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[15:24:24] Starting KUnit Kernel (1/1)...
[15:24:24] ============================================================
[15:24:24] ================== drm_test_pick_cmdline  ==================
[15:24:24] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[15:24:24] =============== drm_test_pick_cmdline_named  ===============
[15:24:24] [PASSED] NTSC
[15:24:24] [PASSED] NTSC-J
[15:24:24] [PASSED] PAL
[15:24:24] [PASSED] PAL-M
[15:24:24] =========== [PASSED] drm_test_pick_cmdline_named ===========
[15:24:24] ============== [PASSED] drm_test_pick_cmdline ==============
[15:24:24] ======================== drm_buddy  ========================
[15:24:24] [PASSED] drm_test_buddy_alloc_limit
[15:24:24] [PASSED] drm_test_buddy_alloc_optimistic
[15:24:24] [PASSED] drm_test_buddy_alloc_pessimistic
[15:24:24] [PASSED] drm_test_buddy_alloc_pathological
[15:24:24] ==================== [PASSED] drm_buddy ====================
[15:24:24] =================== drm_cmdline_parser  ====================
[15:24:24] [PASSED] drm_test_cmdline_force_d_only
[15:24:24] [PASSED] drm_test_cmdline_force_D_only_dvi
[15:24:24] [PASSED] drm_test_cmdline_force_D_only_hdmi
[15:24:24] [PASSED] drm_test_cmdline_force_D_only_not_digital
[15:24:24] [PASSED] drm_test_cmdline_force_e_only
[15:24:24] [PASSED] drm_test_cmdline_res
[15:24:24] [PASSED] drm_test_cmdline_res_vesa
[15:24:24] [PASSED] drm_test_cmdline_res_vesa_rblank
[15:24:24] [PASSED] drm_test_cmdline_res_rblank
[15:24:24] [PASSED] drm_test_cmdline_res_bpp
[15:24:24] [PASSED] drm_test_cmdline_res_refresh
[15:24:24] [PASSED] drm_test_cmdline_res_bpp_refresh
[15:24:24] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[15:24:24] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[15:24:24] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[15:24:24] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[15:24:24] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[15:24:24] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[15:24:24] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[15:24:24] [PASSED] drm_test_cmdline_res_margins_force_on
[15:24:24] [PASSED] drm_test_cmdline_res_vesa_margins
[15:24:24] [PASSED] drm_test_cmdline_name
[15:24:24] [PASSED] drm_test_cmdline_name_bpp
[15:24:24] [PASSED] drm_test_cmdline_name_option
[15:24:24] [PASSED] drm_test_cmdline_name_bpp_option
[15:24:24] [PASSED] drm_test_cmdline_rotate_0
[15:24:24] [PASSED] drm_test_cmdline_rotate_90
[15:24:24] [PASSED] drm_test_cmdline_rotate_180
[15:24:24] [PASSED] drm_test_cmdline_rotate_270
[15:24:24] [PASSED] drm_test_cmdline_hmirror
[15:24:24] [PASSED] drm_test_cmdline_vmirror
[15:24:24] [PASSED] drm_test_cmdline_margin_options
[15:24:24] [PASSED] drm_test_cmdline_multiple_options
[15:24:24] [PASSED] drm_test_cmdline_bpp_extra_and_option
[15:24:24] [PASSED] drm_test_cmdline_extra_and_option
[15:24:24] [PASSED] drm_test_cmdline_freestanding_options
[15:24:24] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[15:24:24] [PASSED] drm_test_cmdline_panel_orientation
[15:24:24] ================ drm_test_cmdline_invalid  =================
[15:24:24] [PASSED] margin_only
[15:24:24] [PASSED] interlace_only
[15:24:24] [PASSED] res_missing_x
[15:24:24] [PASSED] res_missing_y
[15:24:24] [PASSED] res_bad_y
[15:24:24] [PASSED] res_missing_y_bpp
[15:24:24] [PASSED] res_bad_bpp
[15:24:24] [PASSED] res_bad_refresh
[15:24:24] [PASSED] res_bpp_refresh_force_on_off
[15:24:24] [PASSED] res_invalid_mode
[15:24:24] [PASSED] res_bpp_wrong_place_mode
[15:24:24] [PASSED] name_bpp_refresh
[15:24:24] [PASSED] name_refresh
[15:24:24] [PASSED] name_refresh_wrong_mode
[15:24:24] [PASSED] name_refresh_invalid_mode
[15:24:24] [PASSED] rotate_multiple
[15:24:24] [PASSED] rotate_invalid_val
[15:24:24] [PASSED] rotate_truncated
[15:24:24] [PASSED] invalid_option
[15:24:24] [PASSED] invalid_tv_option
[15:24:24] [PASSED] truncated_tv_option
[15:24:24] ============ [PASSED] drm_test_cmdline_invalid =============
[15:24:24] =============== drm_test_cmdline_tv_options  ===============
[15:24:24] [PASSED] NTSC
[15:24:24] [PASSED] NTSC_443
[15:24:24] [PASSED] NTSC_J
[15:24:24] [PASSED] PAL
[15:24:24] [PASSED] PAL_M
[15:24:24] [PASSED] PAL_N
[15:24:24] [PASSED] SECAM
[15:24:24] =========== [PASSED] drm_test_cmdline_tv_options ===========
[15:24:24] =============== [PASSED] drm_cmdline_parser ================
[15:24:24] ================ drm_get_tv_mode_from_name  ================
[15:24:24] ========== drm_test_get_tv_mode_from_name_valid  ===========
[15:24:24] [PASSED] NTSC
[15:24:24] [PASSED] NTSC-443
[15:24:24] [PASSED] NTSC-J
[15:24:24] [PASSED] PAL
[15:24:24] [PASSED] PAL-M
[15:24:24] [PASSED] PAL-N
[15:24:24] [PASSED] SECAM
[15:24:24] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[15:24:24] [PASSED] drm_test_get_tv_mode_from_name_truncated
[15:24:24] ============ [PASSED] drm_get_tv_mode_from_name ============
[15:24:24] ==================== drm_damage_helper  ====================
[15:24:24] [PASSED] drm_test_damage_iter_no_damage
[15:24:24] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[15:24:24] [PASSED] drm_test_damage_iter_no_damage_src_moved
[15:24:24] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[15:24:24] [PASSED] drm_test_damage_iter_no_damage_not_visible
[15:24:24] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[15:24:24] [PASSED] drm_test_damage_iter_no_damage_no_fb
[15:24:24] [PASSED] drm_test_damage_iter_simple_damage
[15:24:24] [PASSED] drm_test_damage_iter_single_damage
[15:24:24] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[15:24:24] [PASSED] drm_test_damage_iter_single_damage_outside_src
[15:24:24] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[15:24:24] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[15:24:24] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[15:24:24] [PASSED] drm_test_damage_iter_single_damage_src_moved
[15:24:24] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[15:24:24] [PASSED] drm_test_damage_iter_damage
[15:24:24] [PASSED] drm_test_damage_iter_damage_one_intersect
[15:24:24] [PASSED] drm_test_damage_iter_damage_one_outside
[15:24:24] [PASSED] drm_test_damage_iter_damage_src_moved
[15:24:24] [PASSED] drm_test_damage_iter_damage_not_visible
[15:24:24] ================ [PASSED] drm_damage_helper ================
[15:24:24] ==================== drm_dp_mst_helper  ====================
[15:24:24] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[15:24:24] [PASSED] Clock 154000 BPP 30 DSC disabled
[15:24:24] [PASSED] Clock 234000 BPP 30 DSC disabled
[15:24:24] [PASSED] Clock 297000 BPP 24 DSC disabled
[15:24:24] [PASSED] Clock 332880 BPP 24 DSC enabled
[15:24:24] [PASSED] Clock 324540 BPP 24 DSC enabled
[15:24:24] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[15:24:24] ============== drm_test_dp_mst_calc_pbn_div  ===============
[15:24:24] [PASSED] Link rate 2000000 lane count 4
[15:24:24] [PASSED] Link rate 2000000 lane count 2
[15:24:24] [PASSED] Link rate 2000000 lane count 1
[15:24:24] [PASSED] Link rate 1350000 lane count 4
[15:24:24] [PASSED] Link rate 1350000 lane count 2
[15:24:24] [PASSED] Link rate 1350000 lane count 1
[15:24:24] [PASSED] Link rate 1000000 lane count 4
[15:24:24] [PASSED] Link rate 1000000 lane count 2
[15:24:24] [PASSED] Link rate 1000000 lane count 1
[15:24:24] [PASSED] Link rate 810000 lane count 4
[15:24:24] [PASSED] Link rate 810000 lane count 2
[15:24:24] [PASSED] Link rate 810000 lane count 1
[15:24:24] [PASSED] Link rate 540000 lane count 4
[15:24:24] [PASSED] Link rate 540000 lane count 2
[15:24:24] [PASSED] Link rate 540000 lane count 1
[15:24:24] [PASSED] Link rate 270000 lane count 4
[15:24:24] [PASSED] Link rate 270000 lane count 2
[15:24:24] [PASSED] Link rate 270000 lane count 1
[15:24:24] [PASSED] Link rate 162000 lane count 4
[15:24:24] [PASSED] Link rate 162000 lane count 2
[15:24:24] [PASSED] Link rate 162000 lane count 1
[15:24:24] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[15:24:24] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[15:24:24] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[15:24:24] [PASSED] DP_POWER_UP_PHY with port number
[15:24:24] [PASSED] DP_POWER_DOWN_PHY with port number
[15:24:24] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[15:24:24] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[15:24:24] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[15:24:24] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[15:24:24] [PASSED] DP_QUERY_PAYLOAD with port number
[15:24:24] [PASSED] DP_QUERY_PAYLOAD with VCPI
[15:24:24] [PASSED] DP_REMOTE_DPCD_READ with port number
[15:24:24] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[15:24:24] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[15:24:24] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[15:24:24] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[15:24:24] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[15:24:24] [PASSED] DP_REMOTE_I2C_READ with port number
[15:24:24] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[15:24:24] [PASSED] DP_REMOTE_I2C_READ with transactions array
[15:24:24] [PASSED] DP_REMOTE_I2C_WRITE with port number
[15:24:24] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[15:24:24] [PASSED] DP_REMOTE_I2C_WRITE with data array
[15:24:24] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[15:24:24] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[15:24:24] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[15:24:24] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[15:24:24] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[15:24:24] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[15:24:24] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[15:24:24] ================ [PASSED] drm_dp_mst_helper ================
[15:24:24] ======================== drm_exec  =========================
[15:24:24] [PASSED] sanitycheck
[15:24:24] [PASSED] test_lock
[15:24:24] [PASSED] test_lock_unlock
[15:24:24] [PASSED] test_duplicates
[15:24:24] [PASSED] test_prepare
[15:24:24] [PASSED] test_prepare_array
[15:24:24] [PASSED] test_multiple_loops
[15:24:24] ==================== [PASSED] drm_exec =====================
[15:24:24] ================= drm_format_helper_test  ==================
[15:24:24] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[15:24:24] [PASSED] single_pixel_source_buffer
[15:24:24] [PASSED] single_pixel_clip_rectangle
[15:24:24] [PASSED] well_known_colors
[15:24:24] [PASSED] destination_pitch
[15:24:24] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[15:24:24] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[15:24:24] [PASSED] single_pixel_source_buffer
[15:24:24] [PASSED] single_pixel_clip_rectangle
[15:24:24] [PASSED] well_known_colors
[15:24:24] [PASSED] destination_pitch
[15:24:24] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[15:24:24] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[15:24:24] [PASSED] single_pixel_source_buffer
[15:24:24] [PASSED] single_pixel_clip_rectangle
[15:24:24] [PASSED] well_known_colors
[15:24:24] [PASSED] destination_pitch
[15:24:24] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[15:24:24] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[15:24:24] [PASSED] single_pixel_source_buffer
[15:24:24] [PASSED] single_pixel_clip_rectangle
[15:24:24] [PASSED] well_known_colors
[15:24:24] [PASSED] destination_pitch
[15:24:24] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[15:24:24] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[15:24:24] [PASSED] single_pixel_source_buffer
[15:24:24] [PASSED] single_pixel_clip_rectangle
[15:24:24] [PASSED] well_known_colors
[15:24:24] [PASSED] destination_pitch
[15:24:24] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[15:24:24] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[15:24:24] [PASSED] single_pixel_source_buffer
[15:24:24] [PASSED] single_pixel_clip_rectangle
[15:24:24] [PASSED] well_known_colors
[15:24:24] [PASSED] destination_pitch
[15:24:24] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[15:24:24] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[15:24:24] [PASSED] single_pixel_source_buffer
[15:24:24] [PASSED] single_pixel_clip_rectangle
[15:24:24] [PASSED] well_known_colors
[15:24:24] [PASSED] destination_pitch
[15:24:24] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[15:24:24] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[15:24:24] [PASSED] single_pixel_source_buffer
[15:24:24] [PASSED] single_pixel_clip_rectangle
[15:24:24] [PASSED] well_known_colors
[15:24:24] [PASSED] destination_pitch
[15:24:24] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[15:24:24] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[15:24:24] [PASSED] single_pixel_source_buffer
[15:24:24] [PASSED] single_pixel_clip_rectangle
[15:24:24] [PASSED] well_known_colors
[15:24:24] [PASSED] destination_pitch
[15:24:24] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[15:24:24] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[15:24:24] [PASSED] single_pixel_source_buffer
[15:24:24] [PASSED] single_pixel_clip_rectangle
[15:24:24] [PASSED] well_known_colors
[15:24:24] [PASSED] destination_pitch
[15:24:24] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[15:24:24] ============== drm_test_fb_xrgb8888_to_mono  ===============
[15:24:24] [PASSED] single_pixel_source_buffer
[15:24:24] [PASSED] single_pixel_clip_rectangle
[15:24:24] [PASSED] well_known_colors
[15:24:24] [PASSED] destination_pitch
[15:24:24] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[15:24:24] ==================== drm_test_fb_swab  =====================
[15:24:24] [PASSED] single_pixel_source_buffer
[15:24:24] [PASSED] single_pixel_clip_rectangle
[15:24:24] [PASSED] well_known_colors
[15:24:24] [PASSED] destination_pitch
[15:24:24] ================ [PASSED] drm_test_fb_swab =================
[15:24:24] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[15:24:24] [PASSED] single_pixel_source_buffer
[15:24:24] [PASSED] single_pixel_clip_rectangle
[15:24:24] [PASSED] well_known_colors
[15:24:24] [PASSED] destination_pitch
[15:24:24] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[15:24:24] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[15:24:24] [PASSED] single_pixel_source_buffer
[15:24:24] [PASSED] single_pixel_clip_rectangle
[15:24:24] [PASSED] well_known_colors
[15:24:24] [PASSED] destination_pitch
[15:24:24] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[15:24:24] ================= drm_test_fb_clip_offset  =================
[15:24:24] [PASSED] pass through
[15:24:24] [PASSED] horizontal offset
[15:24:24] [PASSED] vertical offset
[15:24:24] [PASSED] horizontal and vertical offset
[15:24:24] [PASSED] horizontal offset (custom pitch)
[15:24:24] [PASSED] vertical offset (custom pitch)
[15:24:24] [PASSED] horizontal and vertical offset (custom pitch)
[15:24:24] ============= [PASSED] drm_test_fb_clip_offset =============
[15:24:24] ============== drm_test_fb_build_fourcc_list  ==============
[15:24:24] [PASSED] no native formats
[15:24:24] [PASSED] XRGB8888 as native format
[15:24:24] [PASSED] remove duplicates
[15:24:24] [PASSED] convert alpha formats
[15:24:24] [PASSED] random formats
[15:24:24] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[15:24:24] =================== drm_test_fb_memcpy  ====================
[15:24:24] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[15:24:24] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[15:24:24] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[15:24:24] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[15:24:24] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[15:24:24] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[15:24:24] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[15:24:24] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[15:24:24] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[15:24:24] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[15:24:24] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[15:24:24] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[15:24:24] =============== [PASSED] drm_test_fb_memcpy ================
[15:24:24] ============= [PASSED] drm_format_helper_test ==============
[15:24:24] ======================= drm_format  ========================
[15:24:24] [PASSED] drm_test_format_block_width_invalid
[15:24:24] [PASSED] drm_test_format_block_width_one_plane
[15:24:24] [PASSED] drm_test_format_block_width_two_plane
[15:24:24] [PASSED] drm_test_format_block_width_three_plane
[15:24:24] [PASSED] drm_test_format_block_width_tiled
[15:24:24] [PASSED] drm_test_format_block_height_invalid
[15:24:24] [PASSED] drm_test_format_block_height_one_plane
[15:24:24] [PASSED] drm_test_format_block_height_two_plane
[15:24:24] [PASSED] drm_test_format_block_height_three_plane
[15:24:24] [PASSED] drm_test_format_block_height_tiled
[15:24:24] [PASSED] drm_test_format_min_pitch_invalid
[15:24:24] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[15:24:24] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[15:24:24] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[15:24:24] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[15:24:24] [PASSED] drm_test_format_min_pitch_two_plane
[15:24:24] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[15:24:24] [PASSED] drm_test_format_min_pitch_tiled
[15:24:24] =================== [PASSED] drm_format ====================
[15:24:24] ===================== drm_framebuffer  =====================
[15:24:24] =============== drm_test_framebuffer_create  ===============
[15:24:24] [PASSED] ABGR8888 normal sizes
[15:24:24] [PASSED] ABGR8888 max sizes
[15:24:24] [PASSED] ABGR8888 pitch greater than min required
[15:24:24] [PASSED] ABGR8888 pitch less than min required
[15:24:24] [PASSED] ABGR8888 Invalid width
[15:24:24] [PASSED] ABGR8888 Invalid buffer handle
[15:24:24] [PASSED] No pixel format
[15:24:24] [PASSED] ABGR8888 Width 0
[15:24:24] [PASSED] ABGR8888 Height 0
[15:24:24] [PASSED] ABGR8888 Out of bound height * pitch combination
[15:24:24] [PASSED] ABGR8888 Large buffer offset
[15:24:24] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[15:24:24] [PASSED] ABGR8888 Valid buffer modifier
[15:24:24] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[15:24:24] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[15:24:24] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[15:24:24] [PASSED] NV12 Normal sizes
[15:24:24] [PASSED] NV12 Max sizes
[15:24:24] [PASSED] NV12 Invalid pitch
[15:24:24] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[15:24:24] [PASSED] NV12 different  modifier per-plane
[15:24:24] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[15:24:24] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[15:24:24] [PASSED] NV12 Modifier for inexistent plane
[15:24:24] [PASSED] NV12 Handle for inexistent plane
[15:24:24] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[15:24:24] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[15:24:24] [PASSED] YVU420 Normal sizes
[15:24:24] [PASSED] YVU420 Max sizes
[15:24:24] [PASSED] YVU420 Invalid pitch
[15:24:24] [PASSED] YVU420 Different pitches
[15:24:24] [PASSED] YVU420 Different buffer offsets/pitches
[15:24:24] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[15:24:24] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[15:24:24] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[15:24:24] [PASSED] YVU420 Valid modifier
[15:24:24] [PASSED] YVU420 Different modifiers per plane
[15:24:24] [PASSED] YVU420 Modifier for inexistent plane
[15:24:24] [PASSED] X0L2 Normal sizes
[15:24:24] [PASSED] X0L2 Max sizes
[15:24:24] [PASSED] X0L2 Invalid pitch
[15:24:24] [PASSED] X0L2 Pitch greater than minimum required
[15:24:24] [PASSED] X0L2 Handle for inexistent plane
[15:24:24] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[15:24:24] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[15:24:24] [PASSED] X0L2 Valid modifier
[15:24:24] [PASSED] X0L2 Modifier for inexistent plane
[15:24:24] =========== [PASSED] drm_test_framebuffer_create ===========
[15:24:24] ================= [PASSED] drm_framebuffer =================
[15:24:24] ====================== drm_gem_shmem  ======================
[15:24:24] [PASSED] drm_gem_shmem_test_obj_create
[15:24:24] [PASSED] drm_gem_shmem_test_obj_create_private
[15:24:24] [PASSED] drm_gem_shmem_test_pin_pages
[15:24:24] [PASSED] drm_gem_shmem_test_vmap
[15:24:24] [PASSED] drm_gem_shmem_test_get_pages_sgt
[15:24:24] [PASSED] drm_gem_shmem_test_get_sg_table
[15:24:24] [PASSED] drm_gem_shmem_test_madvise
[15:24:24] [PASSED] drm_gem_shmem_test_purge
[15:24:24] ================== [PASSED] drm_gem_shmem ==================
[15:24:24] ==================== drm-test-managed  =====================
[15:24:24] [PASSED] drm_test_managed_run_action
[15:24:24] ================ [PASSED] drm-test-managed =================
[15:24:24] ========================= drm_mm  ==========================
[15:24:24] [PASSED] drm_test_mm_init
[15:24:24] [PASSED] drm_test_mm_debug
[15:24:24] [PASSED] drm_test_mm_align32
[15:24:24] [PASSED] drm_test_mm_align64
[15:24:24] [PASSED] drm_test_mm_lowest
[15:24:24] [PASSED] drm_test_mm_highest
[15:24:24] ===================== [PASSED] drm_mm ======================
[15:24:24] =================== drm_modes_analog_tv  ===================
[15:24:24] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[15:24:24] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[15:24:24] [PASSED] drm_test_modes_analog_tv_pal_576i
[15:24:24] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[15:24:24] =============== [PASSED] drm_modes_analog_tv ===============
[15:24:24] ==================== drm_plane_helper  =====================
[15:24:24] =============== drm_test_check_plane_state  ================
[15:24:24] [PASSED] clipping_simple
[15:24:24] [PASSED] clipping_rotate_reflect
[15:24:24] [PASSED] positioning_simple
[15:24:24] [PASSED] upscaling
[15:24:24] [PASSED] downscaling
[15:24:24] [PASSED] rounding1
[15:24:24] [PASSED] rounding2
[15:24:24] [PASSED] rounding3
[15:24:24] [PASSED] rounding4
[15:24:24] =========== [PASSED] drm_test_check_plane_state ============
[15:24:24] =========== drm_test_check_invalid_plane_state  ============
[15:24:24] [PASSED] positioning_invalid
[15:24:24] [PASSED] upscaling_invalid
[15:24:24] [PASSED] downscaling_invalid
[15:24:24] ======= [PASSED] drm_test_check_invalid_plane_state ========
[15:24:24] ================ [PASSED] drm_plane_helper =================
[15:24:24] ============ drm_connector_helper_tv_get_modes  ============
[15:24:24] ====== drm_test_connector_helper_tv_get_modes_check  =======
[15:24:24] [PASSED] None
[15:24:24] [PASSED] PAL
[15:24:24] [PASSED] NTSC
[15:24:24] [PASSED] Both, NTSC Default
[15:24:24] [PASSED] Both, PAL Default
[15:24:24] [PASSED] Both, NTSC Default, with PAL on command-line
[15:24:24] [PASSED] Both, PAL Default, with NTSC on command-line
[15:24:24] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[15:24:24] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[15:24:24] ======================== drm_rect  =========================
[15:24:24] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[15:24:24] [PASSED] drm_test_rect_clip_scaled_not_clipped
[15:24:24] [PASSED] drm_test_rect_clip_scaled_clipped
[15:24:24] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[15:24:24] ================= drm_test_rect_intersect  =================
[15:24:24] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[15:24:24] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
stty: 'standard input': Inappropriate ioctl for device
[15:24:24] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[15:24:24] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[15:24:24] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[15:24:24] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[15:24:24] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[15:24:24] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[15:24:24] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[15:24:24] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[15:24:24] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[15:24:24] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[15:24:24] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[15:24:24] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[15:24:24] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[15:24:24] ============= [PASSED] drm_test_rect_intersect =============
[15:24:24] ================ drm_test_rect_calc_hscale  ================
[15:24:24] [PASSED] normal use
[15:24:24] [PASSED] out of max range
[15:24:24] [PASSED] out of min range
[15:24:24] [PASSED] zero dst
[15:24:24] [PASSED] negative src
[15:24:24] [PASSED] negative dst
[15:24:24] ============ [PASSED] drm_test_rect_calc_hscale ============
[15:24:24] ================ drm_test_rect_calc_vscale  ================
[15:24:24] [PASSED] normal use
[15:24:24] [PASSED] out of max range
[15:24:24] [PASSED] out of min range
[15:24:24] [PASSED] zero dst
[15:24:24] [PASSED] negative src
[15:24:24] [PASSED] negative dst
[15:24:24] ============ [PASSED] drm_test_rect_calc_vscale ============
[15:24:24] ================== drm_test_rect_rotate  ===================
[15:24:24] [PASSED] reflect-x
[15:24:24] [PASSED] reflect-y
[15:24:24] [PASSED] rotate-0
[15:24:24] [PASSED] rotate-90
[15:24:24] [PASSED] rotate-180
[15:24:24] [PASSED] rotate-270
[15:24:24] ============== [PASSED] drm_test_rect_rotate ===============
[15:24:24] ================ drm_test_rect_rotate_inv  =================
[15:24:24] [PASSED] reflect-x
[15:24:24] [PASSED] reflect-y
[15:24:24] [PASSED] rotate-0
[15:24:24] [PASSED] rotate-90
[15:24:24] [PASSED] rotate-180
[15:24:24] [PASSED] rotate-270
[15:24:24] ============ [PASSED] drm_test_rect_rotate_inv =============
[15:24:24] ==================== [PASSED] drm_rect =====================
[15:24:24] ============================================================
[15:24:24] Testing complete. Ran 390 tests: passed: 390
[15:24:24] Elapsed time: 21.565s total, 1.655s configuring, 19.739s building, 0.169s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


