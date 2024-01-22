Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A25C4725D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 05:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C5B10E518;
	Mon, 22 Jan 2024 05:53:03 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFEA10E519;
 Mon, 22 Jan 2024 05:53:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/xe2=5Flpg=3A_Introduce_?=
 =?utf-8?q?performance_guide_changes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Date: Mon, 22 Jan 2024 05:53:01 -0000
Message-ID: <170590278171.645876.7244771889066841572@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240122054904.2111721-1-shekhar.chauhan@intel.com>
In-Reply-To: <20240122054904.2111721-1-shekhar.chauhan@intel.com>
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

Series: drm/xe/xe2_lpg: Introduce performance guide changes
URL   : https://patchwork.freedesktop.org/series/129010/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[05:52:09] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:52:13] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[05:52:37] Starting KUnit Kernel (1/1)...
[05:52:37] ============================================================
[05:52:37] ========================= guc_dbm  =========================
[05:52:37] [PASSED] test_empty
[05:52:37] [PASSED] test_default
[05:52:37] ======================== test_size  ========================
[05:52:37] [PASSED] 4
[05:52:37] [PASSED] 8
[05:52:37] [PASSED] 32
[05:52:37] [PASSED] 256
[05:52:37] ==================== [PASSED] test_size ====================
[05:52:37] ======================= test_reuse  ========================
[05:52:37] [PASSED] 4
[05:52:37] [PASSED] 8
[05:52:37] [PASSED] 32
[05:52:37] [PASSED] 256
[05:52:37] =================== [PASSED] test_reuse ====================
[05:52:37] =================== test_range_overlap  ====================
[05:52:37] [PASSED] 4
[05:52:37] [PASSED] 8
[05:52:37] [PASSED] 32
[05:52:37] [PASSED] 256
[05:52:37] =============== [PASSED] test_range_overlap ================
[05:52:37] =================== test_range_compact  ====================
[05:52:37] [PASSED] 4
[05:52:37] [PASSED] 8
[05:52:37] [PASSED] 32
[05:52:37] [PASSED] 256
[05:52:37] =============== [PASSED] test_range_compact ================
[05:52:37] ==================== test_range_spare  =====================
[05:52:37] [PASSED] 4
[05:52:37] [PASSED] 8
[05:52:37] [PASSED] 32
[05:52:37] [PASSED] 256
[05:52:37] ================ [PASSED] test_range_spare =================
[05:52:37] ===================== [PASSED] guc_dbm =====================
[05:52:37] ======================== no_relay  =========================
[05:52:37] [PASSED] xe_drops_guc2pf_if_not_ready
[05:52:37] [PASSED] xe_drops_guc2vf_if_not_ready
[05:52:37] [PASSED] xe_rejects_send_if_not_ready
[05:52:37] ==================== [PASSED] no_relay =====================
[05:52:37] ======================== pf_relay  =========================
[05:52:37] [PASSED] pf_rejects_guc2pf_too_short
[05:52:37] [PASSED] pf_rejects_guc2pf_too_long
[05:52:37] [PASSED] pf_rejects_guc2pf_no_payload
[05:52:37] [PASSED] pf_fails_no_payload
[05:52:37] [PASSED] pf_fails_bad_origin
[05:52:37] [PASSED] pf_fails_bad_type
[05:52:37] [PASSED] pf_txn_reports_error
[05:52:37] [PASSED] pf_txn_sends_pf2guc
[05:52:37] [PASSED] pf_sends_pf2guc
[05:52:37] [SKIPPED] pf_loopback_nop
[05:52:37] [SKIPPED] pf_loopback_echo
[05:52:37] [SKIPPED] pf_loopback_fail
[05:52:37] [SKIPPED] pf_loopback_busy
[05:52:37] [SKIPPED] pf_loopback_retry
[05:52:37] ==================== [PASSED] pf_relay =====================
[05:52:37] ======================== vf_relay  =========================
[05:52:37] [PASSED] vf_rejects_guc2vf_too_short
[05:52:37] [PASSED] vf_rejects_guc2vf_too_long
[05:52:37] [PASSED] vf_rejects_guc2vf_no_payload
[05:52:37] ==================== [PASSED] vf_relay =====================
[05:52:37] ========================== lmtt  ===========================
[05:52:37] ======================== test_ops  =========================
[05:52:37] [PASSED] 2-level
[05:52:37] [PASSED] multi-level
[05:52:37] ==================== [PASSED] test_ops =====================
[05:52:37] ====================== [PASSED] lmtt =======================
[05:52:37] ========================== xe_bo  ==========================
[05:52:37] [SKIPPED] xe_ccs_migrate_kunit
[05:52:37] [SKIPPED] xe_bo_evict_kunit
[05:52:37] ===================== [SKIPPED] xe_bo ======================
[05:52:37] ======================= xe_dma_buf  ========================
[05:52:37] [SKIPPED] xe_dma_buf_kunit
[05:52:37] =================== [SKIPPED] xe_dma_buf ===================
[05:52:37] ======================= xe_migrate  ========================
[05:52:37] [SKIPPED] xe_migrate_sanity_kunit
[05:52:37] =================== [SKIPPED] xe_migrate ===================
[05:52:37] ========================= xe_mocs  =========================
[05:52:37] [SKIPPED] xe_live_mocs_kernel_kunit
[05:52:37] [SKIPPED] xe_live_mocs_reset_kunit
[05:52:37] ==================== [SKIPPED] xe_mocs =====================
[05:52:37] ========================= xe_pci  ==========================
[05:52:37] [PASSED] xe_gmdid_graphics_ip
[05:52:37] [PASSED] xe_gmdid_media_ip
[05:52:37] ===================== [PASSED] xe_pci ======================
[05:52:37] ========================= xe_rtp  ==========================
[05:52:37] ================== xe_rtp_process_tests  ===================
[05:52:37] [PASSED] coalesce-same-reg
[05:52:37] [PASSED] no-match-no-add
[05:52:37] [PASSED] no-match-no-add-multiple-rules
[05:52:37] [PASSED] two-regs-two-entries
[05:52:37] [PASSED] clr-one-set-other
[05:52:37] [PASSED] set-field
[05:52:37] [PASSED] conflict-duplicate
[05:52:37] [PASSED] conflict-not-disjoint
[05:52:37] [PASSED] conflict-reg-type
[05:52:37] ============== [PASSED] xe_rtp_process_tests ===============
[05:52:37] ===================== [PASSED] xe_rtp ======================
[05:52:37] ========================== xe_wa  ==========================
[05:52:37] ======================== xe_wa_gt  =========================
[05:52:37] [PASSED] TIGERLAKE (B0)
[05:52:37] [PASSED] DG1 (A0)
[05:52:37] [PASSED] DG1 (B0)
[05:52:37] [PASSED] ALDERLAKE_S (A0)
[05:52:37] [PASSED] ALDERLAKE_S (B0)
[05:52:37] [PASSED] ALDERLAKE_S (C0)
[05:52:37] [PASSED] ALDERLAKE_S (D0)
[05:52:37] [PASSED] ALDERLAKE_P (A0)
[05:52:37] [PASSED] ALDERLAKE_P (B0)
[05:52:37] [PASSED] ALDERLAKE_P (C0)
[05:52:37] [PASSED] ALDERLAKE_S_RPLS (D0)
[05:52:37] [PASSED] ALDERLAKE_P_RPLU (E0)
[05:52:37] [PASSED] DG2_G10 (C0)
[05:52:37] [PASSED] DG2_G11 (B1)
[05:52:37] [PASSED] DG2_G12 (A1)
[05:52:37] [PASSED] PVC (B0)
[05:52:37] [PASSED] PVC (B1)
[05:52:37] [PASSED] PVC (C0)
[05:52:37] [PASSED] METEORLAKE (g:A0, m:A0)
[05:52:37] [PASSED] METEORLAKE (g:A0, m:A0)
[05:52:37] [PASSED] LUNARLAKE (g:A0, m:A0)
[05:52:37] [PASSED] LUNARLAKE (g:B0, m:A0)
[05:52:37] ==================== [PASSED] xe_wa_gt =====================
[05:52:37] ====================== [PASSED] xe_wa ======================
[05:52:37] ============================================================
[05:52:37] Testing complete. Ran 83 tests: passed: 72, skipped: 11
[05:52:37] Elapsed time: 27.889s total, 4.199s configuring, 23.470s building, 0.187s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[05:52:37] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:52:39] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[05:52:59] Starting KUnit Kernel (1/1)...
[05:52:59] ============================================================
[05:52:59] ================== drm_test_pick_cmdline  ==================
[05:52:59] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[05:52:59] =============== drm_test_pick_cmdline_named  ===============
[05:52:59] [PASSED] NTSC
[05:52:59] [PASSED] NTSC-J
[05:52:59] [PASSED] PAL
[05:52:59] [PASSED] PAL-M
[05:52:59] =========== [PASSED] drm_test_pick_cmdline_named ===========
[05:52:59] ============== [PASSED] drm_test_pick_cmdline ==============
[05:52:59] ======================== drm_buddy  ========================
[05:52:59] [PASSED] drm_test_buddy_alloc_limit
[05:52:59] [PASSED] drm_test_buddy_alloc_optimistic
[05:52:59] [PASSED] drm_test_buddy_alloc_pessimistic
[05:52:59] [PASSED] drm_test_buddy_alloc_pathological
[05:52:59] ==================== [PASSED] drm_buddy ====================
[05:52:59] =================== drm_cmdline_parser  ====================
[05:52:59] [PASSED] drm_test_cmdline_force_d_only
[05:52:59] [PASSED] drm_test_cmdline_force_D_only_dvi
[05:52:59] [PASSED] drm_test_cmdline_force_D_only_hdmi
[05:52:59] [PASSED] drm_test_cmdline_force_D_only_not_digital
[05:52:59] [PASSED] drm_test_cmdline_force_e_only
[05:52:59] [PASSED] drm_test_cmdline_res
[05:52:59] [PASSED] drm_test_cmdline_res_vesa
[05:52:59] [PASSED] drm_test_cmdline_res_vesa_rblank
[05:52:59] [PASSED] drm_test_cmdline_res_rblank
[05:52:59] [PASSED] drm_test_cmdline_res_bpp
[05:52:59] [PASSED] drm_test_cmdline_res_refresh
[05:52:59] [PASSED] drm_test_cmdline_res_bpp_refresh
[05:52:59] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[05:52:59] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[05:52:59] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[05:52:59] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[05:52:59] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[05:52:59] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[05:52:59] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[05:52:59] [PASSED] drm_test_cmdline_res_margins_force_on
[05:52:59] [PASSED] drm_test_cmdline_res_vesa_margins
[05:52:59] [PASSED] drm_test_cmdline_name
[05:52:59] [PASSED] drm_test_cmdline_name_bpp
[05:52:59] [PASSED] drm_test_cmdline_name_option
[05:52:59] [PASSED] drm_test_cmdline_name_bpp_option
[05:52:59] [PASSED] drm_test_cmdline_rotate_0
[05:52:59] [PASSED] drm_test_cmdline_rotate_90
[05:52:59] [PASSED] drm_test_cmdline_rotate_180
[05:52:59] [PASSED] drm_test_cmdline_rotate_270
[05:52:59] [PASSED] drm_test_cmdline_hmirror
[05:52:59] [PASSED] drm_test_cmdline_vmirror
[05:52:59] [PASSED] drm_test_cmdline_margin_options
[05:52:59] [PASSED] drm_test_cmdline_multiple_options
[05:52:59] [PASSED] drm_test_cmdline_bpp_extra_and_option
[05:52:59] [PASSED] drm_test_cmdline_extra_and_option
[05:52:59] [PASSED] drm_test_cmdline_freestanding_options
[05:52:59] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[05:52:59] [PASSED] drm_test_cmdline_panel_orientation
[05:52:59] ================ drm_test_cmdline_invalid  =================
[05:52:59] [PASSED] margin_only
[05:52:59] [PASSED] interlace_only
[05:52:59] [PASSED] res_missing_x
[05:52:59] [PASSED] res_missing_y
[05:52:59] [PASSED] res_bad_y
[05:52:59] [PASSED] res_missing_y_bpp
[05:52:59] [PASSED] res_bad_bpp
[05:52:59] [PASSED] res_bad_refresh
[05:52:59] [PASSED] res_bpp_refresh_force_on_off
[05:52:59] [PASSED] res_invalid_mode
[05:52:59] [PASSED] res_bpp_wrong_place_mode
[05:52:59] [PASSED] name_bpp_refresh
[05:52:59] [PASSED] name_refresh
[05:52:59] [PASSED] name_refresh_wrong_mode
[05:52:59] [PASSED] name_refresh_invalid_mode
[05:52:59] [PASSED] rotate_multiple
[05:52:59] [PASSED] rotate_invalid_val
[05:52:59] [PASSED] rotate_truncated
[05:52:59] [PASSED] invalid_option
[05:52:59] [PASSED] invalid_tv_option
[05:52:59] [PASSED] truncated_tv_option
[05:52:59] ============ [PASSED] drm_test_cmdline_invalid =============
[05:52:59] =============== drm_test_cmdline_tv_options  ===============
[05:52:59] [PASSED] NTSC
[05:52:59] [PASSED] NTSC_443
[05:52:59] [PASSED] NTSC_J
[05:52:59] [PASSED] PAL
[05:52:59] [PASSED] PAL_M
[05:52:59] [PASSED] PAL_N
[05:52:59] [PASSED] SECAM
[05:52:59] =========== [PASSED] drm_test_cmdline_tv_options ===========
[05:52:59] =============== [PASSED] drm_cmdline_parser ================
[05:52:59] ================ drm_get_tv_mode_from_name  ================
[05:52:59] ========== drm_test_get_tv_mode_from_name_valid  ===========
[05:52:59] [PASSED] NTSC
[05:52:59] [PASSED] NTSC-443
[05:52:59] [PASSED] NTSC-J
[05:52:59] [PASSED] PAL
[05:52:59] [PASSED] PAL-M
[05:52:59] [PASSED] PAL-N
[05:52:59] [PASSED] SECAM
[05:52:59] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[05:52:59] [PASSED] drm_test_get_tv_mode_from_name_truncated
[05:52:59] ============ [PASSED] drm_get_tv_mode_from_name ============
[05:52:59] ==================== drm_damage_helper  ====================
[05:52:59] [PASSED] drm_test_damage_iter_no_damage
[05:52:59] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[05:52:59] [PASSED] drm_test_damage_iter_no_damage_src_moved
[05:52:59] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[05:52:59] [PASSED] drm_test_damage_iter_no_damage_not_visible
[05:52:59] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[05:52:59] [PASSED] drm_test_damage_iter_no_damage_no_fb
[05:52:59] [PASSED] drm_test_damage_iter_simple_damage
[05:52:59] [PASSED] drm_test_damage_iter_single_damage
[05:52:59] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[05:52:59] [PASSED] drm_test_damage_iter_single_damage_outside_src
[05:52:59] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[05:52:59] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[05:52:59] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[05:52:59] [PASSED] drm_test_damage_iter_single_damage_src_moved
[05:52:59] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[05:52:59] [PASSED] drm_test_damage_iter_damage
[05:52:59] [PASSED] drm_test_damage_iter_damage_one_intersect
[05:52:59] [PASSED] drm_test_damage_iter_damage_one_outside
[05:52:59] [PASSED] drm_test_damage_iter_damage_src_moved
[05:52:59] [PASSED] drm_test_damage_iter_damage_not_visible
[05:52:59] ================ [PASSED] drm_damage_helper ================
[05:52:59] ==================== drm_dp_mst_helper  ====================
[05:52:59] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[05:52:59] [PASSED] Clock 154000 BPP 30 DSC disabled
[05:52:59] [PASSED] Clock 234000 BPP 30 DSC disabled
[05:52:59] [PASSED] Clock 297000 BPP 24 DSC disabled
[05:52:59] [PASSED] Clock 332880 BPP 24 DSC enabled
[05:52:59] [PASSED] Clock 324540 BPP 24 DSC enabled
[05:52:59] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[05:52:59] ============== drm_test_dp_mst_calc_pbn_div  ===============
[05:52:59] [PASSED] Link rate 2000000 lane count 4
[05:52:59] [PASSED] Link rate 2000000 lane count 2
[05:52:59] [PASSED] Link rate 2000000 lane count 1
[05:52:59] [PASSED] Link rate 1350000 lane count 4
[05:52:59] [PASSED] Link rate 1350000 lane count 2
[05:52:59] [PASSED] Link rate 1350000 lane count 1
[05:52:59] [PASSED] Link rate 1000000 lane count 4
[05:52:59] [PASSED] Link rate 1000000 lane count 2
[05:52:59] [PASSED] Link rate 1000000 lane count 1
[05:52:59] [PASSED] Link rate 810000 lane count 4
[05:52:59] [PASSED] Link rate 810000 lane count 2
[05:52:59] [PASSED] Link rate 810000 lane count 1
[05:52:59] [PASSED] Link rate 540000 lane count 4
[05:52:59] [PASSED] Link rate 540000 lane count 2
[05:52:59] [PASSED] Link rate 540000 lane count 1
[05:52:59] [PASSED] Link rate 270000 lane count 4
[05:52:59] [PASSED] Link rate 270000 lane count 2
[05:52:59] [PASSED] Link rate 270000 lane count 1
[05:52:59] [PASSED] Link rate 162000 lane count 4
[05:52:59] [PASSED] Link rate 162000 lane count 2
[05:52:59] [PASSED] Link rate 162000 lane count 1
[05:52:59] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[05:52:59] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[05:52:59] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[05:52:59] [PASSED] DP_POWER_UP_PHY with port number
[05:52:59] [PASSED] DP_POWER_DOWN_PHY with port number
[05:52:59] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[05:52:59] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[05:52:59] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[05:52:59] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[05:52:59] [PASSED] DP_QUERY_PAYLOAD with port number
[05:52:59] [PASSED] DP_QUERY_PAYLOAD with VCPI
[05:52:59] [PASSED] DP_REMOTE_DPCD_READ with port number
[05:52:59] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[05:52:59] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[05:52:59] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[05:52:59] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[05:52:59] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[05:52:59] [PASSED] DP_REMOTE_I2C_READ with port number
[05:52:59] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[05:52:59] [PASSED] DP_REMOTE_I2C_READ with transactions array
[05:52:59] [PASSED] DP_REMOTE_I2C_WRITE with port number
[05:52:59] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[05:52:59] [PASSED] DP_REMOTE_I2C_WRITE with data array
[05:52:59] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[05:52:59] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[05:52:59] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[05:52:59] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[05:52:59] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[05:52:59] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[05:52:59] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[05:52:59] ================ [PASSED] drm_dp_mst_helper ================
[05:52:59] ======================== drm_exec  =========================
[05:52:59] [PASSED] sanitycheck
[05:52:59] [PASSED] test_lock
[05:52:59] [PASSED] test_lock_unlock
[05:52:59] [PASSED] test_duplicates
[05:52:59] [PASSED] test_prepare
[05:52:59] [PASSED] test_prepare_array
[05:52:59] [PASSED] test_multiple_loops
[05:52:59] ==================== [PASSED] drm_exec =====================
[05:52:59] ================= drm_format_helper_test  ==================
[05:52:59] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[05:52:59] [PASSED] single_pixel_source_buffer
[05:52:59] [PASSED] single_pixel_clip_rectangle
[05:52:59] [PASSED] well_known_colors
[05:52:59] [PASSED] destination_pitch
[05:52:59] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[05:52:59] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[05:52:59] [PASSED] single_pixel_source_buffer
[05:52:59] [PASSED] single_pixel_clip_rectangle
[05:52:59] [PASSED] well_known_colors
[05:52:59] [PASSED] destination_pitch
[05:52:59] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[05:52:59] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[05:52:59] [PASSED] single_pixel_source_buffer
[05:52:59] [PASSED] single_pixel_clip_rectangle
[05:52:59] [PASSED] well_known_colors
[05:52:59] [PASSED] destination_pitch
[05:52:59] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[05:52:59] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[05:52:59] [PASSED] single_pixel_source_buffer
[05:52:59] [PASSED] single_pixel_clip_rectangle
[05:52:59] [PASSED] well_known_colors
[05:52:59] [PASSED] destination_pitch
[05:52:59] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[05:52:59] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[05:52:59] [PASSED] single_pixel_source_buffer
[05:52:59] [PASSED] single_pixel_clip_rectangle
[05:52:59] [PASSED] well_known_colors
[05:52:59] [PASSED] destination_pitch
[05:52:59] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[05:52:59] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[05:52:59] [PASSED] single_pixel_source_buffer
[05:52:59] [PASSED] single_pixel_clip_rectangle
[05:52:59] [PASSED] well_known_colors
[05:52:59] [PASSED] destination_pitch
[05:52:59] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[05:52:59] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[05:52:59] [PASSED] single_pixel_source_buffer
[05:52:59] [PASSED] single_pixel_clip_rectangle
[05:52:59] [PASSED] well_known_colors
[05:52:59] [PASSED] destination_pitch
[05:52:59] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[05:52:59] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[05:52:59] [PASSED] single_pixel_source_buffer
[05:52:59] [PASSED] single_pixel_clip_rectangle
[05:52:59] [PASSED] well_known_colors
[05:52:59] [PASSED] destination_pitch
[05:52:59] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[05:52:59] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[05:52:59] [PASSED] single_pixel_source_buffer
[05:52:59] [PASSED] single_pixel_clip_rectangle
[05:52:59] [PASSED] well_known_colors
[05:52:59] [PASSED] destination_pitch
[05:52:59] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[05:52:59] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[05:52:59] [PASSED] single_pixel_source_buffer
[05:52:59] [PASSED] single_pixel_clip_rectangle
[05:52:59] [PASSED] well_known_colors
[05:52:59] [PASSED] destination_pitch
[05:52:59] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[05:52:59] ============== drm_test_fb_xrgb8888_to_mono  ===============
[05:52:59] [PASSED] single_pixel_source_buffer
[05:52:59] [PASSED] single_pixel_clip_rectangle
[05:52:59] [PASSED] well_known_colors
[05:52:59] [PASSED] destination_pitch
[05:52:59] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[05:52:59] ==================== drm_test_fb_swab  =====================
[05:52:59] [PASSED] single_pixel_source_buffer
[05:52:59] [PASSED] single_pixel_clip_rectangle
[05:52:59] [PASSED] well_known_colors
[05:52:59] [PASSED] destination_pitch
[05:52:59] ================ [PASSED] drm_test_fb_swab =================
[05:52:59] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[05:52:59] [PASSED] single_pixel_source_buffer
[05:52:59] [PASSED] single_pixel_clip_rectangle
[05:52:59] [PASSED] well_known_colors
[05:52:59] [PASSED] destination_pitch
[05:52:59] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[05:52:59] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[05:52:59] [PASSED] single_pixel_source_buffer
[05:52:59] [PASSED] single_pixel_clip_rectangle
[05:52:59] [PASSED] well_known_colors
[05:52:59] [PASSED] destination_pitch
[05:52:59] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[05:52:59] ================= drm_test_fb_clip_offset  =================
[05:52:59] [PASSED] pass through
[05:52:59] [PASSED] horizontal offset
[05:52:59] [PASSED] vertical offset
[05:52:59] [PASSED] horizontal and vertical offset
[05:52:59] [PASSED] horizontal offset (custom pitch)
[05:52:59] [PASSED] vertical offset (custom pitch)
[05:52:59] [PASSED] horizontal and vertical offset (custom pitch)
[05:52:59] ============= [PASSED] drm_test_fb_clip_offset =============
[05:52:59] ============== drm_test_fb_build_fourcc_list  ==============
[05:52:59] [PASSED] no native formats
[05:52:59] [PASSED] XRGB8888 as native format
[05:52:59] [PASSED] remove duplicates
[05:52:59] [PASSED] convert alpha formats
[05:52:59] [PASSED] random formats
[05:52:59] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[05:52:59] =================== drm_test_fb_memcpy  ====================
[05:52:59] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[05:52:59] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[05:52:59] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[05:52:59] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[05:52:59] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[05:52:59] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[05:52:59] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[05:52:59] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[05:52:59] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[05:52:59] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[05:52:59] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[05:52:59] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[05:52:59] =============== [PASSED] drm_test_fb_memcpy ================
[05:52:59] ============= [PASSED] drm_format_helper_test ==============
[05:52:59] ======================= drm_format  ========================
[05:52:59] [PASSED] drm_test_format_block_width_invalid
[05:52:59] [PASSED] drm_test_format_block_width_one_plane
[05:52:59] [PASSED] drm_test_format_block_width_two_plane
[05:52:59] [PASSED] drm_test_format_block_width_three_plane
[05:52:59] [PASSED] drm_test_format_block_width_tiled
[05:52:59] [PASSED] drm_test_format_block_height_invalid
[05:52:59] [PASSED] drm_test_format_block_height_one_plane
[05:52:59] [PASSED] drm_test_format_block_height_two_plane
[05:52:59] [PASSED] drm_test_format_block_height_three_plane
[05:52:59] [PASSED] drm_test_format_block_height_tiled
[05:52:59] [PASSED] drm_test_format_min_pitch_invalid
[05:52:59] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[05:52:59] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[05:52:59] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[05:52:59] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[05:52:59] [PASSED] drm_test_format_min_pitch_two_plane
[05:52:59] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[05:52:59] [PASSED] drm_test_format_min_pitch_tiled
[05:52:59] =================== [PASSED] drm_format ====================
[05:52:59] ===================== drm_framebuffer  =====================
[05:52:59] =============== drm_test_framebuffer_create  ===============
[05:52:59] [PASSED] ABGR8888 normal sizes
[05:52:59] [PASSED] ABGR8888 max sizes
[05:52:59] [PASSED] ABGR8888 pitch greater than min required
[05:52:59] [PASSED] ABGR8888 pitch less than min required
[05:52:59] [PASSED] ABGR8888 Invalid width
[05:52:59] [PASSED] ABGR8888 Invalid buffer handle
[05:52:59] [PASSED] No pixel format
[05:52:59] [PASSED] ABGR8888 Width 0
[05:52:59] [PASSED] ABGR8888 Height 0
[05:52:59] [PASSED] ABGR8888 Out of bound height * pitch combination
[05:52:59] [PASSED] ABGR8888 Large buffer offset
[05:52:59] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[05:52:59] [PASSED] ABGR8888 Valid buffer modifier
[05:52:59] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[05:52:59] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[05:52:59] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[05:52:59] [PASSED] NV12 Normal sizes
[05:52:59] [PASSED] NV12 Max sizes
[05:52:59] [PASSED] NV12 Invalid pitch
[05:52:59] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[05:52:59] [PASSED] NV12 different  modifier per-plane
[05:52:59] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[05:52:59] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[05:52:59] [PASSED] NV12 Modifier for inexistent plane
[05:52:59] [PASSED] NV12 Handle for inexistent plane
[05:52:59] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[05:52:59] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[05:52:59] [PASSED] YVU420 Normal sizes
[05:52:59] [PASSED] YVU420 Max sizes
[05:52:59] [PASSED] YVU420 Invalid pitch
[05:52:59] [PASSED] YVU420 Different pitches
[05:52:59] [PASSED] YVU420 Different buffer offsets/pitches
[05:52:59] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[05:52:59] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[05:52:59] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[05:52:59] [PASSED] YVU420 Valid modifier
[05:52:59] [PASSED] YVU420 Different modifiers per plane
[05:52:59] [PASSED] YVU420 Modifier for inexistent plane
[05:52:59] [PASSED] X0L2 Normal sizes
[05:52:59] [PASSED] X0L2 Max sizes
[05:52:59] [PASSED] X0L2 Invalid pitch
[05:52:59] [PASSED] X0L2 Pitch greater than minimum required
[05:52:59] [PASSED] X0L2 Handle for inexistent plane
[05:52:59] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[05:52:59] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[05:52:59] [PASSED] X0L2 Valid modifier
[05:52:59] [PASSED] X0L2 Modifier for inexistent plane
[05:52:59] =========== [PASSED] drm_test_framebuffer_create ===========
[05:52:59] ================= [PASSED] drm_framebuffer =================
[05:52:59] ====================== drm_gem_shmem  ======================
[05:52:59] [PASSED] drm_gem_shmem_test_obj_create
[05:52:59] [PASSED] drm_gem_shmem_test_obj_create_private
[05:52:59] [PASSED] drm_gem_shmem_test_pin_pages
[05:52:59] [PASSED] drm_gem_shmem_test_vmap
[05:52:59] [PASSED] drm_gem_shmem_test_get_pages_sgt
[05:52:59] [PASSED] drm_gem_shmem_test_get_sg_table
[05:52:59] [PASSED] drm_gem_shmem_test_madvise
[05:52:59] [PASSED] drm_gem_shmem_test_purge
[05:52:59] ================== [PASSED] drm_gem_shmem ==================
[05:52:59] ======================= drm_managed  =======================
[05:52:59] [PASSED] drm_test_managed_release_action
[05:52:59] [PASSED] drm_test_managed_run_action
[05:52:59] =================== [PASSED] drm_managed ===================
[05:52:59] ========================= drm_mm  ==========================
[05:52:59] [PASSED] drm_test_mm_init
[05:52:59] [PASSED] drm_test_mm_debug
[05:52:59] [PASSED] drm_test_mm_align32
[05:52:59] [PASSED] drm_test_mm_align64
[05:52:59] [PASSED] drm_test_mm_lowest
[05:52:59] [PASSED] drm_test_mm_highest
[05:52:59] ===================== [PASSED] drm_mm ======================
[05:52:59] =================== drm_modes_analog_tv  ===================
[05:52:59] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[05:52:59] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[05:52:59] [PASSED] drm_test_modes_analog_tv_pal_576i
[05:52:59] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[05:52:59] =============== [PASSED] drm_modes_analog_tv ===============
[05:52:59] ==================== drm_plane_helper  =====================
[05:52:59] =============== drm_test_check_plane_state  ================
[05:52:59] [PASSED] clipping_simple
[05:52:59] [PASSED] clipping_rotate_reflect
[05:52:59] [PASSED] positioning_simple
[05:52:59] [PASSED] upscaling
[05:52:59] [PASSED] downscaling
[05:52:59] [PASSED] rounding1
[05:52:59] [PASSED] rounding2
[05:52:59] [PASSED] rounding3
[05:52:59] [PASSED] rounding4
[05:52:59] =========== [PASSED] drm_test_check_plane_state ============
[05:52:59] =========== drm_test_check_invalid_plane_state  ============
[05:52:59] [PASSED] positioning_invalid
[05:52:59] [PASSED] upscaling_invalid
[05:52:59] [PASSED] downscaling_invalid
[05:52:59] ======= [PASSED] drm_test_check_invalid_plane_state ========
[05:52:59] ================ [PASSED] drm_plane_helper =================
[05:52:59] ============ drm_connector_helper_tv_get_modes  ============
[05:52:59] ====== drm_test_connector_helper_tv_get_modes_check  =======
[05:52:59] [PASSED] None
[05:52:59] [PASSED] PAL
[05:52:59] [PASSED] NTSC
[05:52:59] [PASSED] Both, NTSC Default
[05:52:59] [PASSED] Both, PAL Default
[05:52:59] [PASSED] Both, NTSC Default, with PAL on command-line
[05:52:59] [PASSED] Both, PAL Default, with NTSC on command-line
[05:52:59] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[05:52:59] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[05:52:59] ======================== drm_rect  =========================
[05:52:59] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[05:52:59] [PASSED] drm_test_rect_clip_scaled_not_clipped
[05:52:59] [PASSED] drm_test_rect_clip_scaled_clipped
[05:52:59] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[05:52:59] ================= drm_test_rect_intersect  =================
[05:52:59] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
stty: 'standard input': Inappropriate ioctl for device
[05:52:59] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[05:52:59] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[05:52:59] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[05:52:59] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[05:52:59] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[05:52:59] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[05:52:59] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[05:52:59] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[05:52:59] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[05:52:59] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[05:52:59] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[05:52:59] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[05:52:59] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[05:52:59] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[05:52:59] ============= [PASSED] drm_test_rect_intersect =============
[05:52:59] ================ drm_test_rect_calc_hscale  ================
[05:52:59] [PASSED] normal use
[05:52:59] [PASSED] out of max range
[05:52:59] [PASSED] out of min range
[05:52:59] [PASSED] zero dst
[05:52:59] [PASSED] negative src
[05:52:59] [PASSED] negative dst
[05:52:59] ============ [PASSED] drm_test_rect_calc_hscale ============
[05:52:59] ================ drm_test_rect_calc_vscale  ================
[05:52:59] [PASSED] normal use
[05:52:59] [PASSED] out of max range
[05:52:59] [PASSED] out of min range
[05:52:59] [PASSED] zero dst
[05:52:59] [PASSED] negative src
[05:52:59] [PASSED] negative dst
[05:52:59] ============ [PASSED] drm_test_rect_calc_vscale ============
[05:52:59] ================== drm_test_rect_rotate  ===================
[05:52:59] [PASSED] reflect-x
[05:52:59] [PASSED] reflect-y
[05:52:59] [PASSED] rotate-0
[05:52:59] [PASSED] rotate-90
[05:52:59] [PASSED] rotate-180
[05:52:59] [PASSED] rotate-270
[05:52:59] ============== [PASSED] drm_test_rect_rotate ===============
[05:52:59] ================ drm_test_rect_rotate_inv  =================
[05:52:59] [PASSED] reflect-x
[05:52:59] [PASSED] reflect-y
[05:52:59] [PASSED] rotate-0
[05:52:59] [PASSED] rotate-90
[05:52:59] [PASSED] rotate-180
[05:52:59] [PASSED] rotate-270
[05:52:59] ============ [PASSED] drm_test_rect_rotate_inv =============
[05:52:59] ==================== [PASSED] drm_rect =====================
[05:52:59] ============================================================
[05:52:59] Testing complete. Ran 391 tests: passed: 391
[05:52:59] Elapsed time: 21.944s total, 1.676s configuring, 20.146s building, 0.119s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


