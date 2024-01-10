Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96138C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 07:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7E010E0D8;
	Wed, 10 Jan 2024 07:03:30 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BBB10E0D2;
 Wed, 10 Jan 2024 07:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_series_starting_with_=5Bv2=2C1?=
 =?utf-8?q?/2=5D_drm/xe/xe2=5Flpg=3A_Introduce_performance_guide_changes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Date: Wed, 10 Jan 2024 07:03:28 -0000
Message-ID: <170487020859.240792.18290436488863087293@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240110061531.780038-1-shekhar.chauhan@intel.com>
In-Reply-To: <20240110061531.780038-1-shekhar.chauhan@intel.com>
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

Series: series starting with [v2,1/2] drm/xe/xe2_lpg: Introduce performance guide changes
URL   : https://patchwork.freedesktop.org/series/128412/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[07:02:36] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:02:40] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[07:03:03] Starting KUnit Kernel (1/1)...
[07:03:03] ============================================================
[07:03:03] ========================= guc_dbm  =========================
[07:03:03] [PASSED] test_empty
[07:03:03] [PASSED] test_default
[07:03:03] ======================== test_size  ========================
[07:03:03] [PASSED] 4
[07:03:03] [PASSED] 8
[07:03:03] [PASSED] 32
[07:03:03] [PASSED] 256
[07:03:03] ==================== [PASSED] test_size ====================
[07:03:03] ======================= test_reuse  ========================
[07:03:03] [PASSED] 4
[07:03:03] [PASSED] 8
[07:03:03] [PASSED] 32
[07:03:03] [PASSED] 256
[07:03:03] =================== [PASSED] test_reuse ====================
[07:03:03] =================== test_range_overlap  ====================
[07:03:03] [PASSED] 4
[07:03:03] [PASSED] 8
[07:03:03] [PASSED] 32
[07:03:03] [PASSED] 256
[07:03:03] =============== [PASSED] test_range_overlap ================
[07:03:03] =================== test_range_compact  ====================
[07:03:03] [PASSED] 4
[07:03:03] [PASSED] 8
[07:03:03] [PASSED] 32
[07:03:03] [PASSED] 256
[07:03:03] =============== [PASSED] test_range_compact ================
[07:03:03] ==================== test_range_spare  =====================
[07:03:03] [PASSED] 4
[07:03:03] [PASSED] 8
[07:03:03] [PASSED] 32
[07:03:03] [PASSED] 256
[07:03:03] ================ [PASSED] test_range_spare =================
[07:03:03] ===================== [PASSED] guc_dbm =====================
[07:03:03] ======================== no_relay  =========================
[07:03:03] [PASSED] xe_drops_guc2pf_if_not_ready
[07:03:03] [PASSED] xe_drops_guc2vf_if_not_ready
[07:03:03] [PASSED] xe_rejects_send_if_not_ready
[07:03:03] ==================== [PASSED] no_relay =====================
[07:03:03] ======================== pf_relay  =========================
[07:03:03] [PASSED] pf_rejects_guc2pf_too_short
[07:03:03] [PASSED] pf_rejects_guc2pf_too_long
[07:03:03] [PASSED] pf_rejects_guc2pf_no_payload
[07:03:03] [PASSED] pf_fails_no_payload
[07:03:03] [PASSED] pf_fails_bad_origin
[07:03:03] [PASSED] pf_fails_bad_type
[07:03:03] [PASSED] pf_txn_reports_error
[07:03:03] [PASSED] pf_txn_sends_pf2guc
[07:03:03] [PASSED] pf_sends_pf2guc
[07:03:03] [SKIPPED] pf_loopback_nop
[07:03:03] [SKIPPED] pf_loopback_echo
[07:03:03] [SKIPPED] pf_loopback_fail
[07:03:03] [SKIPPED] pf_loopback_busy
[07:03:03] [SKIPPED] pf_loopback_retry
[07:03:03] ==================== [PASSED] pf_relay =====================
[07:03:03] ======================== vf_relay  =========================
[07:03:03] [PASSED] vf_rejects_guc2vf_too_short
[07:03:03] [PASSED] vf_rejects_guc2vf_too_long
[07:03:03] [PASSED] vf_rejects_guc2vf_no_payload
[07:03:03] ==================== [PASSED] vf_relay =====================
[07:03:03] ========================== lmtt  ===========================
[07:03:03] ======================== test_ops  =========================
[07:03:03] [PASSED] 2-level
[07:03:03] [PASSED] multi-level
[07:03:03] ==================== [PASSED] test_ops =====================
[07:03:03] ====================== [PASSED] lmtt =======================
[07:03:03] ========================== xe_bo  ==========================
[07:03:03] [SKIPPED] xe_ccs_migrate_kunit
[07:03:03] [SKIPPED] xe_bo_evict_kunit
[07:03:03] ===================== [SKIPPED] xe_bo ======================
[07:03:03] ======================= xe_dma_buf  ========================
[07:03:03] [SKIPPED] xe_dma_buf_kunit
[07:03:03] =================== [SKIPPED] xe_dma_buf ===================
[07:03:03] ======================= xe_migrate  ========================
[07:03:03] [SKIPPED] xe_migrate_sanity_kunit
[07:03:03] =================== [SKIPPED] xe_migrate ===================
[07:03:03] ========================= xe_mocs  =========================
[07:03:03] [SKIPPED] xe_live_mocs_kernel_kunit
[07:03:03] [SKIPPED] xe_live_mocs_reset_kunit
[07:03:03] ==================== [SKIPPED] xe_mocs =====================
[07:03:03] ========================= xe_pci  ==========================
[07:03:03] [PASSED] xe_gmdid_graphics_ip
[07:03:03] [PASSED] xe_gmdid_media_ip
[07:03:03] ===================== [PASSED] xe_pci ======================
[07:03:03] ========================= xe_rtp  ==========================
[07:03:03] ================== xe_rtp_process_tests  ===================
[07:03:03] [PASSED] coalesce-same-reg
[07:03:03] [PASSED] no-match-no-add
[07:03:03] [PASSED] no-match-no-add-multiple-rules
[07:03:03] [PASSED] two-regs-two-entries
[07:03:03] [PASSED] clr-one-set-other
[07:03:03] [PASSED] set-field
[07:03:03] [PASSED] conflict-duplicate
[07:03:03] [PASSED] conflict-not-disjoint
[07:03:03] [PASSED] conflict-reg-type
[07:03:03] ============== [PASSED] xe_rtp_process_tests ===============
[07:03:03] ===================== [PASSED] xe_rtp ======================
[07:03:03] ========================== xe_wa  ==========================
[07:03:03] ======================== xe_wa_gt  =========================
[07:03:03] [PASSED] TIGERLAKE (B0)
[07:03:03] [PASSED] DG1 (A0)
[07:03:03] [PASSED] DG1 (B0)
[07:03:03] [PASSED] ALDERLAKE_S (A0)
[07:03:03] [PASSED] ALDERLAKE_S (B0)
[07:03:03] [PASSED] ALDERLAKE_S (C0)
[07:03:03] [PASSED] ALDERLAKE_S (D0)
[07:03:03] [PASSED] ALDERLAKE_P (A0)
[07:03:03] [PASSED] ALDERLAKE_P (B0)
[07:03:03] [PASSED] ALDERLAKE_P (C0)
[07:03:03] [PASSED] ALDERLAKE_S_RPLS (D0)
[07:03:03] [PASSED] ALDERLAKE_P_RPLU (E0)
[07:03:03] [PASSED] DG2_G10 (C0)
[07:03:03] [PASSED] DG2_G11 (B1)
[07:03:03] [PASSED] DG2_G12 (A1)
[07:03:03] [PASSED] PVC (B0)
[07:03:03] [PASSED] PVC (B1)
[07:03:03] [PASSED] PVC (C0)
[07:03:03] [PASSED] METEORLAKE (g:A0, m:A0)
[07:03:03] [PASSED] METEORLAKE (g:A0, m:A0)
[07:03:03] [PASSED] LUNARLAKE (g:A0, m:A0)
[07:03:03] [PASSED] LUNARLAKE (g:B0, m:A0)
[07:03:03] ==================== [PASSED] xe_wa_gt =====================
[07:03:03] ====================== [PASSED] xe_wa ======================
[07:03:03] ============================================================
[07:03:03] Testing complete. Ran 83 tests: passed: 72, skipped: 11
[07:03:03] Elapsed time: 27.912s total, 4.200s configuring, 23.491s building, 0.183s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[07:03:04] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:03:05] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[07:03:25] Starting KUnit Kernel (1/1)...
[07:03:25] ============================================================
[07:03:26] ================== drm_test_pick_cmdline  ==================
[07:03:26] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[07:03:26] =============== drm_test_pick_cmdline_named  ===============
[07:03:26] [PASSED] NTSC
[07:03:26] [PASSED] NTSC-J
[07:03:26] [PASSED] PAL
[07:03:26] [PASSED] PAL-M
[07:03:26] =========== [PASSED] drm_test_pick_cmdline_named ===========
[07:03:26] ============== [PASSED] drm_test_pick_cmdline ==============
[07:03:26] ======================== drm_buddy  ========================
[07:03:26] [PASSED] drm_test_buddy_alloc_limit
[07:03:26] [PASSED] drm_test_buddy_alloc_optimistic
[07:03:26] [PASSED] drm_test_buddy_alloc_pessimistic
[07:03:26] [PASSED] drm_test_buddy_alloc_pathological
[07:03:26] ==================== [PASSED] drm_buddy ====================
[07:03:26] =================== drm_cmdline_parser  ====================
[07:03:26] [PASSED] drm_test_cmdline_force_d_only
[07:03:26] [PASSED] drm_test_cmdline_force_D_only_dvi
[07:03:26] [PASSED] drm_test_cmdline_force_D_only_hdmi
[07:03:26] [PASSED] drm_test_cmdline_force_D_only_not_digital
[07:03:26] [PASSED] drm_test_cmdline_force_e_only
[07:03:26] [PASSED] drm_test_cmdline_res
[07:03:26] [PASSED] drm_test_cmdline_res_vesa
[07:03:26] [PASSED] drm_test_cmdline_res_vesa_rblank
[07:03:26] [PASSED] drm_test_cmdline_res_rblank
[07:03:26] [PASSED] drm_test_cmdline_res_bpp
[07:03:26] [PASSED] drm_test_cmdline_res_refresh
[07:03:26] [PASSED] drm_test_cmdline_res_bpp_refresh
[07:03:26] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[07:03:26] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[07:03:26] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[07:03:26] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[07:03:26] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[07:03:26] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[07:03:26] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[07:03:26] [PASSED] drm_test_cmdline_res_margins_force_on
[07:03:26] [PASSED] drm_test_cmdline_res_vesa_margins
[07:03:26] [PASSED] drm_test_cmdline_name
[07:03:26] [PASSED] drm_test_cmdline_name_bpp
[07:03:26] [PASSED] drm_test_cmdline_name_option
[07:03:26] [PASSED] drm_test_cmdline_name_bpp_option
[07:03:26] [PASSED] drm_test_cmdline_rotate_0
[07:03:26] [PASSED] drm_test_cmdline_rotate_90
[07:03:26] [PASSED] drm_test_cmdline_rotate_180
[07:03:26] [PASSED] drm_test_cmdline_rotate_270
[07:03:26] [PASSED] drm_test_cmdline_hmirror
[07:03:26] [PASSED] drm_test_cmdline_vmirror
[07:03:26] [PASSED] drm_test_cmdline_margin_options
[07:03:26] [PASSED] drm_test_cmdline_multiple_options
[07:03:26] [PASSED] drm_test_cmdline_bpp_extra_and_option
[07:03:26] [PASSED] drm_test_cmdline_extra_and_option
[07:03:26] [PASSED] drm_test_cmdline_freestanding_options
[07:03:26] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[07:03:26] [PASSED] drm_test_cmdline_panel_orientation
[07:03:26] ================ drm_test_cmdline_invalid  =================
[07:03:26] [PASSED] margin_only
[07:03:26] [PASSED] interlace_only
[07:03:26] [PASSED] res_missing_x
[07:03:26] [PASSED] res_missing_y
[07:03:26] [PASSED] res_bad_y
[07:03:26] [PASSED] res_missing_y_bpp
[07:03:26] [PASSED] res_bad_bpp
[07:03:26] [PASSED] res_bad_refresh
[07:03:26] [PASSED] res_bpp_refresh_force_on_off
[07:03:26] [PASSED] res_invalid_mode
[07:03:26] [PASSED] res_bpp_wrong_place_mode
[07:03:26] [PASSED] name_bpp_refresh
[07:03:26] [PASSED] name_refresh
[07:03:26] [PASSED] name_refresh_wrong_mode
[07:03:26] [PASSED] name_refresh_invalid_mode
[07:03:26] [PASSED] rotate_multiple
[07:03:26] [PASSED] rotate_invalid_val
[07:03:26] [PASSED] rotate_truncated
[07:03:26] [PASSED] invalid_option
[07:03:26] [PASSED] invalid_tv_option
[07:03:26] [PASSED] truncated_tv_option
[07:03:26] ============ [PASSED] drm_test_cmdline_invalid =============
[07:03:26] =============== drm_test_cmdline_tv_options  ===============
[07:03:26] [PASSED] NTSC
[07:03:26] [PASSED] NTSC_443
[07:03:26] [PASSED] NTSC_J
[07:03:26] [PASSED] PAL
[07:03:26] [PASSED] PAL_M
[07:03:26] [PASSED] PAL_N
[07:03:26] [PASSED] SECAM
[07:03:26] =========== [PASSED] drm_test_cmdline_tv_options ===========
[07:03:26] =============== [PASSED] drm_cmdline_parser ================
[07:03:26] ================ drm_get_tv_mode_from_name  ================
[07:03:26] ========== drm_test_get_tv_mode_from_name_valid  ===========
[07:03:26] [PASSED] NTSC
[07:03:26] [PASSED] NTSC-443
[07:03:26] [PASSED] NTSC-J
[07:03:26] [PASSED] PAL
[07:03:26] [PASSED] PAL-M
[07:03:26] [PASSED] PAL-N
[07:03:26] [PASSED] SECAM
[07:03:26] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[07:03:26] [PASSED] drm_test_get_tv_mode_from_name_truncated
[07:03:26] ============ [PASSED] drm_get_tv_mode_from_name ============
[07:03:26] ==================== drm_damage_helper  ====================
[07:03:26] [PASSED] drm_test_damage_iter_no_damage
[07:03:26] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[07:03:26] [PASSED] drm_test_damage_iter_no_damage_src_moved
[07:03:26] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[07:03:26] [PASSED] drm_test_damage_iter_no_damage_not_visible
[07:03:26] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[07:03:26] [PASSED] drm_test_damage_iter_no_damage_no_fb
[07:03:26] [PASSED] drm_test_damage_iter_simple_damage
[07:03:26] [PASSED] drm_test_damage_iter_single_damage
[07:03:26] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[07:03:26] [PASSED] drm_test_damage_iter_single_damage_outside_src
[07:03:26] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[07:03:26] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[07:03:26] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[07:03:26] [PASSED] drm_test_damage_iter_single_damage_src_moved
[07:03:26] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[07:03:26] [PASSED] drm_test_damage_iter_damage
[07:03:26] [PASSED] drm_test_damage_iter_damage_one_intersect
[07:03:26] [PASSED] drm_test_damage_iter_damage_one_outside
[07:03:26] [PASSED] drm_test_damage_iter_damage_src_moved
[07:03:26] [PASSED] drm_test_damage_iter_damage_not_visible
[07:03:26] ================ [PASSED] drm_damage_helper ================
[07:03:26] ==================== drm_dp_mst_helper  ====================
[07:03:26] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[07:03:26] [PASSED] Clock 154000 BPP 30 DSC disabled
[07:03:26] [PASSED] Clock 234000 BPP 30 DSC disabled
[07:03:26] [PASSED] Clock 297000 BPP 24 DSC disabled
[07:03:26] [PASSED] Clock 332880 BPP 24 DSC enabled
[07:03:26] [PASSED] Clock 324540 BPP 24 DSC enabled
[07:03:26] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[07:03:26] ============== drm_test_dp_mst_calc_pbn_div  ===============
[07:03:26] [PASSED] Link rate 2000000 lane count 4
[07:03:26] [PASSED] Link rate 2000000 lane count 2
[07:03:26] [PASSED] Link rate 2000000 lane count 1
[07:03:26] [PASSED] Link rate 1350000 lane count 4
[07:03:26] [PASSED] Link rate 1350000 lane count 2
[07:03:26] [PASSED] Link rate 1350000 lane count 1
[07:03:26] [PASSED] Link rate 1000000 lane count 4
[07:03:26] [PASSED] Link rate 1000000 lane count 2
[07:03:26] [PASSED] Link rate 1000000 lane count 1
[07:03:26] [PASSED] Link rate 810000 lane count 4
[07:03:26] [PASSED] Link rate 810000 lane count 2
[07:03:26] [PASSED] Link rate 810000 lane count 1
[07:03:26] [PASSED] Link rate 540000 lane count 4
[07:03:26] [PASSED] Link rate 540000 lane count 2
[07:03:26] [PASSED] Link rate 540000 lane count 1
[07:03:26] [PASSED] Link rate 270000 lane count 4
[07:03:26] [PASSED] Link rate 270000 lane count 2
[07:03:26] [PASSED] Link rate 270000 lane count 1
[07:03:26] [PASSED] Link rate 162000 lane count 4
[07:03:26] [PASSED] Link rate 162000 lane count 2
[07:03:26] [PASSED] Link rate 162000 lane count 1
[07:03:26] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[07:03:26] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[07:03:26] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[07:03:26] [PASSED] DP_POWER_UP_PHY with port number
[07:03:26] [PASSED] DP_POWER_DOWN_PHY with port number
[07:03:26] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[07:03:26] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[07:03:26] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[07:03:26] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[07:03:26] [PASSED] DP_QUERY_PAYLOAD with port number
[07:03:26] [PASSED] DP_QUERY_PAYLOAD with VCPI
[07:03:26] [PASSED] DP_REMOTE_DPCD_READ with port number
[07:03:26] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[07:03:26] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[07:03:26] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[07:03:26] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[07:03:26] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[07:03:26] [PASSED] DP_REMOTE_I2C_READ with port number
[07:03:26] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[07:03:26] [PASSED] DP_REMOTE_I2C_READ with transactions array
[07:03:26] [PASSED] DP_REMOTE_I2C_WRITE with port number
[07:03:26] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[07:03:26] [PASSED] DP_REMOTE_I2C_WRITE with data array
[07:03:26] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[07:03:26] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[07:03:26] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[07:03:26] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[07:03:26] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[07:03:26] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[07:03:26] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[07:03:26] ================ [PASSED] drm_dp_mst_helper ================
[07:03:26] ======================== drm_exec  =========================
[07:03:26] [PASSED] sanitycheck
[07:03:26] [PASSED] test_lock
[07:03:26] [PASSED] test_lock_unlock
[07:03:26] [PASSED] test_duplicates
[07:03:26] [PASSED] test_prepare
[07:03:26] [PASSED] test_prepare_array
[07:03:26] [PASSED] test_multiple_loops
[07:03:26] ==================== [PASSED] drm_exec =====================
[07:03:26] ================= drm_format_helper_test  ==================
[07:03:26] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[07:03:26] [PASSED] single_pixel_source_buffer
[07:03:26] [PASSED] single_pixel_clip_rectangle
[07:03:26] [PASSED] well_known_colors
[07:03:26] [PASSED] destination_pitch
[07:03:26] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[07:03:26] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[07:03:26] [PASSED] single_pixel_source_buffer
[07:03:26] [PASSED] single_pixel_clip_rectangle
[07:03:26] [PASSED] well_known_colors
[07:03:26] [PASSED] destination_pitch
[07:03:26] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[07:03:26] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[07:03:26] [PASSED] single_pixel_source_buffer
[07:03:26] [PASSED] single_pixel_clip_rectangle
[07:03:26] [PASSED] well_known_colors
[07:03:26] [PASSED] destination_pitch
[07:03:26] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[07:03:26] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[07:03:26] [PASSED] single_pixel_source_buffer
[07:03:26] [PASSED] single_pixel_clip_rectangle
[07:03:26] [PASSED] well_known_colors
[07:03:26] [PASSED] destination_pitch
[07:03:26] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[07:03:26] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[07:03:26] [PASSED] single_pixel_source_buffer
[07:03:26] [PASSED] single_pixel_clip_rectangle
[07:03:26] [PASSED] well_known_colors
[07:03:26] [PASSED] destination_pitch
[07:03:26] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[07:03:26] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[07:03:26] [PASSED] single_pixel_source_buffer
[07:03:26] [PASSED] single_pixel_clip_rectangle
[07:03:26] [PASSED] well_known_colors
[07:03:26] [PASSED] destination_pitch
[07:03:26] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[07:03:26] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[07:03:26] [PASSED] single_pixel_source_buffer
[07:03:26] [PASSED] single_pixel_clip_rectangle
[07:03:26] [PASSED] well_known_colors
[07:03:26] [PASSED] destination_pitch
[07:03:26] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[07:03:26] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[07:03:26] [PASSED] single_pixel_source_buffer
[07:03:26] [PASSED] single_pixel_clip_rectangle
[07:03:26] [PASSED] well_known_colors
[07:03:26] [PASSED] destination_pitch
[07:03:26] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[07:03:26] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[07:03:26] [PASSED] single_pixel_source_buffer
[07:03:26] [PASSED] single_pixel_clip_rectangle
[07:03:26] [PASSED] well_known_colors
[07:03:26] [PASSED] destination_pitch
[07:03:26] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[07:03:26] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[07:03:26] [PASSED] single_pixel_source_buffer
[07:03:26] [PASSED] single_pixel_clip_rectangle
[07:03:26] [PASSED] well_known_colors
[07:03:26] [PASSED] destination_pitch
[07:03:26] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[07:03:26] ============== drm_test_fb_xrgb8888_to_mono  ===============
[07:03:26] [PASSED] single_pixel_source_buffer
[07:03:26] [PASSED] single_pixel_clip_rectangle
[07:03:26] [PASSED] well_known_colors
[07:03:26] [PASSED] destination_pitch
[07:03:26] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[07:03:26] ==================== drm_test_fb_swab  =====================
[07:03:26] [PASSED] single_pixel_source_buffer
[07:03:26] [PASSED] single_pixel_clip_rectangle
[07:03:26] [PASSED] well_known_colors
[07:03:26] [PASSED] destination_pitch
[07:03:26] ================ [PASSED] drm_test_fb_swab =================
[07:03:26] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[07:03:26] [PASSED] single_pixel_source_buffer
[07:03:26] [PASSED] single_pixel_clip_rectangle
[07:03:26] [PASSED] well_known_colors
[07:03:26] [PASSED] destination_pitch
[07:03:26] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[07:03:26] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[07:03:26] [PASSED] single_pixel_source_buffer
[07:03:26] [PASSED] single_pixel_clip_rectangle
[07:03:26] [PASSED] well_known_colors
[07:03:26] [PASSED] destination_pitch
[07:03:26] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[07:03:26] ================= drm_test_fb_clip_offset  =================
[07:03:26] [PASSED] pass through
[07:03:26] [PASSED] horizontal offset
[07:03:26] [PASSED] vertical offset
[07:03:26] [PASSED] horizontal and vertical offset
[07:03:26] [PASSED] horizontal offset (custom pitch)
[07:03:26] [PASSED] vertical offset (custom pitch)
[07:03:26] [PASSED] horizontal and vertical offset (custom pitch)
[07:03:26] ============= [PASSED] drm_test_fb_clip_offset =============
[07:03:26] ============== drm_test_fb_build_fourcc_list  ==============
[07:03:26] [PASSED] no native formats
[07:03:26] [PASSED] XRGB8888 as native format
[07:03:26] [PASSED] remove duplicates
[07:03:26] [PASSED] convert alpha formats
[07:03:26] [PASSED] random formats
[07:03:26] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[07:03:26] =================== drm_test_fb_memcpy  ====================
[07:03:26] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[07:03:26] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[07:03:26] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[07:03:26] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[07:03:26] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[07:03:26] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[07:03:26] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[07:03:26] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[07:03:26] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[07:03:26] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[07:03:26] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[07:03:26] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[07:03:26] =============== [PASSED] drm_test_fb_memcpy ================
[07:03:26] ============= [PASSED] drm_format_helper_test ==============
[07:03:26] ======================= drm_format  ========================
[07:03:26] [PASSED] drm_test_format_block_width_invalid
[07:03:26] [PASSED] drm_test_format_block_width_one_plane
[07:03:26] [PASSED] drm_test_format_block_width_two_plane
[07:03:26] [PASSED] drm_test_format_block_width_three_plane
[07:03:26] [PASSED] drm_test_format_block_width_tiled
[07:03:26] [PASSED] drm_test_format_block_height_invalid
[07:03:26] [PASSED] drm_test_format_block_height_one_plane
[07:03:26] [PASSED] drm_test_format_block_height_two_plane
[07:03:26] [PASSED] drm_test_format_block_height_three_plane
[07:03:26] [PASSED] drm_test_format_block_height_tiled
[07:03:26] [PASSED] drm_test_format_min_pitch_invalid
[07:03:26] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[07:03:26] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[07:03:26] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[07:03:26] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[07:03:26] [PASSED] drm_test_format_min_pitch_two_plane
[07:03:26] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[07:03:26] [PASSED] drm_test_format_min_pitch_tiled
[07:03:26] =================== [PASSED] drm_format ====================
[07:03:26] ===================== drm_framebuffer  =====================
[07:03:26] =============== drm_test_framebuffer_create  ===============
[07:03:26] [PASSED] ABGR8888 normal sizes
[07:03:26] [PASSED] ABGR8888 max sizes
[07:03:26] [PASSED] ABGR8888 pitch greater than min required
[07:03:26] [PASSED] ABGR8888 pitch less than min required
[07:03:26] [PASSED] ABGR8888 Invalid width
[07:03:26] [PASSED] ABGR8888 Invalid buffer handle
[07:03:26] [PASSED] No pixel format
[07:03:26] [PASSED] ABGR8888 Width 0
[07:03:26] [PASSED] ABGR8888 Height 0
[07:03:26] [PASSED] ABGR8888 Out of bound height * pitch combination
[07:03:26] [PASSED] ABGR8888 Large buffer offset
[07:03:26] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[07:03:26] [PASSED] ABGR8888 Valid buffer modifier
[07:03:26] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[07:03:26] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[07:03:26] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[07:03:26] [PASSED] NV12 Normal sizes
[07:03:26] [PASSED] NV12 Max sizes
[07:03:26] [PASSED] NV12 Invalid pitch
[07:03:26] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[07:03:26] [PASSED] NV12 different  modifier per-plane
[07:03:26] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[07:03:26] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[07:03:26] [PASSED] NV12 Modifier for inexistent plane
[07:03:26] [PASSED] NV12 Handle for inexistent plane
[07:03:26] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[07:03:26] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[07:03:26] [PASSED] YVU420 Normal sizes
[07:03:26] [PASSED] YVU420 Max sizes
[07:03:26] [PASSED] YVU420 Invalid pitch
[07:03:26] [PASSED] YVU420 Different pitches
[07:03:26] [PASSED] YVU420 Different buffer offsets/pitches
[07:03:26] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[07:03:26] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[07:03:26] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[07:03:26] [PASSED] YVU420 Valid modifier
[07:03:26] [PASSED] YVU420 Different modifiers per plane
[07:03:26] [PASSED] YVU420 Modifier for inexistent plane
[07:03:26] [PASSED] X0L2 Normal sizes
[07:03:26] [PASSED] X0L2 Max sizes
[07:03:26] [PASSED] X0L2 Invalid pitch
[07:03:26] [PASSED] X0L2 Pitch greater than minimum required
[07:03:26] [PASSED] X0L2 Handle for inexistent plane
[07:03:26] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[07:03:26] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[07:03:26] [PASSED] X0L2 Valid modifier
[07:03:26] [PASSED] X0L2 Modifier for inexistent plane
[07:03:26] =========== [PASSED] drm_test_framebuffer_create ===========
[07:03:26] ================= [PASSED] drm_framebuffer =================
[07:03:26] ====================== drm_gem_shmem  ======================
[07:03:26] [PASSED] drm_gem_shmem_test_obj_create
[07:03:26] [PASSED] drm_gem_shmem_test_obj_create_private
[07:03:26] [PASSED] drm_gem_shmem_test_pin_pages
[07:03:26] [PASSED] drm_gem_shmem_test_vmap
[07:03:26] [PASSED] drm_gem_shmem_test_get_pages_sgt
[07:03:26] [PASSED] drm_gem_shmem_test_get_sg_table
[07:03:26] [PASSED] drm_gem_shmem_test_madvise
[07:03:26] [PASSED] drm_gem_shmem_test_purge
[07:03:26] ================== [PASSED] drm_gem_shmem ==================
[07:03:26] ==================== drm-test-managed  =====================
[07:03:26] [PASSED] drm_test_managed_run_action
[07:03:26] ================ [PASSED] drm-test-managed =================
[07:03:26] ========================= drm_mm  ==========================
[07:03:26] [PASSED] drm_test_mm_init
[07:03:26] [PASSED] drm_test_mm_debug
[07:03:26] [PASSED] drm_test_mm_align32
[07:03:26] [PASSED] drm_test_mm_align64
[07:03:26] [PASSED] drm_test_mm_lowest
[07:03:26] [PASSED] drm_test_mm_highest
[07:03:26] ===================== [PASSED] drm_mm ======================
[07:03:26] =================== drm_modes_analog_tv  ===================
[07:03:26] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[07:03:26] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[07:03:26] [PASSED] drm_test_modes_analog_tv_pal_576i
[07:03:26] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[07:03:26] =============== [PASSED] drm_modes_analog_tv ===============
[07:03:26] ==================== drm_plane_helper  =====================
[07:03:26] =============== drm_test_check_plane_state  ================
[07:03:26] [PASSED] clipping_simple
[07:03:26] [PASSED] clipping_rotate_reflect
[07:03:26] [PASSED] positioning_simple
[07:03:26] [PASSED] upscaling
[07:03:26] [PASSED] downscaling
[07:03:26] [PASSED] rounding1
[07:03:26] [PASSED] rounding2
[07:03:26] [PASSED] rounding3
[07:03:26] [PASSED] rounding4
[07:03:26] =========== [PASSED] drm_test_check_plane_state ============
[07:03:26] =========== drm_test_check_invalid_plane_state  ============
[07:03:26] [PASSED] positioning_invalid
[07:03:26] [PASSED] upscaling_invalid
[07:03:26] [PASSED] downscaling_invalid
[07:03:26] ======= [PASSED] drm_test_check_invalid_plane_state ========
[07:03:26] ================ [PASSED] drm_plane_helper =================
[07:03:26] ============ drm_connector_helper_tv_get_modes  ============
[07:03:26] ====== drm_test_connector_helper_tv_get_modes_check  =======
[07:03:26] [PASSED] None
[07:03:26] [PASSED] PAL
[07:03:26] [PASSED] NTSC
[07:03:26] [PASSED] Both, NTSC Default
[07:03:26] [PASSED] Both, PAL Default
[07:03:26] [PASSED] Both, NTSC Default, with PAL on command-line
[07:03:26] [PASSED] Both, PAL Default, with NTSC on command-line
[07:03:26] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[07:03:26] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[07:03:26] ======================== drm_rect  =========================
[07:03:26] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[07:03:26] [PASSED] drm_test_rect_clip_scaled_not_clipped
[07:03:26] [PASSED] drm_test_rect_clip_scaled_clipped
[07:03:26] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[07:03:26] ================= drm_test_rect_intersect  =================
[07:03:26] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[07:03:26] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
stty: 'standard input': Inappropriate ioctl for device
[07:03:26] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[07:03:26] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[07:03:26] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[07:03:26] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[07:03:26] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[07:03:26] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[07:03:26] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[07:03:26] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[07:03:26] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[07:03:26] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[07:03:26] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[07:03:26] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[07:03:26] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[07:03:26] ============= [PASSED] drm_test_rect_intersect =============
[07:03:26] ================ drm_test_rect_calc_hscale  ================
[07:03:26] [PASSED] normal use
[07:03:26] [PASSED] out of max range
[07:03:26] [PASSED] out of min range
[07:03:26] [PASSED] zero dst
[07:03:26] [PASSED] negative src
[07:03:26] [PASSED] negative dst
[07:03:26] ============ [PASSED] drm_test_rect_calc_hscale ============
[07:03:26] ================ drm_test_rect_calc_vscale  ================
[07:03:26] [PASSED] normal use
[07:03:26] [PASSED] out of max range
[07:03:26] [PASSED] out of min range
[07:03:26] [PASSED] zero dst
[07:03:26] [PASSED] negative src
[07:03:26] [PASSED] negative dst
[07:03:26] ============ [PASSED] drm_test_rect_calc_vscale ============
[07:03:26] ================== drm_test_rect_rotate  ===================
[07:03:26] [PASSED] reflect-x
[07:03:26] [PASSED] reflect-y
[07:03:26] [PASSED] rotate-0
[07:03:26] [PASSED] rotate-90
[07:03:26] [PASSED] rotate-180
[07:03:26] [PASSED] rotate-270
[07:03:26] ============== [PASSED] drm_test_rect_rotate ===============
[07:03:26] ================ drm_test_rect_rotate_inv  =================
[07:03:26] [PASSED] reflect-x
[07:03:26] [PASSED] reflect-y
[07:03:26] [PASSED] rotate-0
[07:03:26] [PASSED] rotate-90
[07:03:26] [PASSED] rotate-180
[07:03:26] [PASSED] rotate-270
[07:03:26] ============ [PASSED] drm_test_rect_rotate_inv =============
[07:03:26] ==================== [PASSED] drm_rect =====================
[07:03:26] ============================================================
[07:03:26] Testing complete. Ran 390 tests: passed: 390
[07:03:26] Elapsed time: 22.082s total, 1.658s configuring, 20.299s building, 0.121s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


