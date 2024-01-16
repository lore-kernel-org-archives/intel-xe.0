Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798BDC47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 15:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458C410E552;
	Tue, 16 Jan 2024 15:00:16 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC6310E59D;
 Tue, 16 Jan 2024 15:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Update_MMIO_read/write_functio?=
 =?utf-8?q?ns?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Tue, 16 Jan 2024 15:00:15 -0000
Message-ID: <170541721570.502240.10838898838135700617@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240116145617.1177-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240116145617.1177-1-michal.wajdeczko@intel.com>
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

Series: Update MMIO read/write functions
URL   : https://patchwork.freedesktop.org/series/128835/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[14:59:23] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:59:27] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[14:59:51] Starting KUnit Kernel (1/1)...
[14:59:51] ============================================================
[14:59:51] ========================= guc_dbm  =========================
[14:59:51] [PASSED] test_empty
[14:59:51] [PASSED] test_default
[14:59:51] ======================== test_size  ========================
[14:59:51] [PASSED] 4
[14:59:51] [PASSED] 8
[14:59:51] [PASSED] 32
[14:59:51] [PASSED] 256
[14:59:51] ==================== [PASSED] test_size ====================
[14:59:51] ======================= test_reuse  ========================
[14:59:51] [PASSED] 4
[14:59:51] [PASSED] 8
[14:59:51] [PASSED] 32
[14:59:51] [PASSED] 256
[14:59:51] =================== [PASSED] test_reuse ====================
[14:59:51] =================== test_range_overlap  ====================
[14:59:51] [PASSED] 4
[14:59:51] [PASSED] 8
[14:59:51] [PASSED] 32
[14:59:51] [PASSED] 256
[14:59:51] =============== [PASSED] test_range_overlap ================
[14:59:51] =================== test_range_compact  ====================
[14:59:51] [PASSED] 4
[14:59:51] [PASSED] 8
[14:59:51] [PASSED] 32
[14:59:51] [PASSED] 256
[14:59:51] =============== [PASSED] test_range_compact ================
[14:59:51] ==================== test_range_spare  =====================
[14:59:51] [PASSED] 4
[14:59:51] [PASSED] 8
[14:59:51] [PASSED] 32
[14:59:51] [PASSED] 256
[14:59:51] ================ [PASSED] test_range_spare =================
[14:59:51] ===================== [PASSED] guc_dbm =====================
[14:59:51] ======================== no_relay  =========================
[14:59:51] [PASSED] xe_drops_guc2pf_if_not_ready
[14:59:51] [PASSED] xe_drops_guc2vf_if_not_ready
[14:59:51] [PASSED] xe_rejects_send_if_not_ready
[14:59:51] ==================== [PASSED] no_relay =====================
[14:59:51] ======================== pf_relay  =========================
[14:59:51] [PASSED] pf_rejects_guc2pf_too_short
[14:59:51] [PASSED] pf_rejects_guc2pf_too_long
[14:59:51] [PASSED] pf_rejects_guc2pf_no_payload
[14:59:51] [PASSED] pf_fails_no_payload
[14:59:51] [PASSED] pf_fails_bad_origin
[14:59:51] [PASSED] pf_fails_bad_type
[14:59:51] [PASSED] pf_txn_reports_error
[14:59:51] [PASSED] pf_txn_sends_pf2guc
[14:59:51] [PASSED] pf_sends_pf2guc
[14:59:51] [SKIPPED] pf_loopback_nop
[14:59:51] [SKIPPED] pf_loopback_echo
[14:59:51] [SKIPPED] pf_loopback_fail
[14:59:51] [SKIPPED] pf_loopback_busy
[14:59:51] [SKIPPED] pf_loopback_retry
[14:59:51] ==================== [PASSED] pf_relay =====================
[14:59:51] ======================== vf_relay  =========================
[14:59:51] [PASSED] vf_rejects_guc2vf_too_short
[14:59:51] [PASSED] vf_rejects_guc2vf_too_long
[14:59:51] [PASSED] vf_rejects_guc2vf_no_payload
[14:59:51] ==================== [PASSED] vf_relay =====================
[14:59:51] ========================== lmtt  ===========================
[14:59:51] ======================== test_ops  =========================
[14:59:51] [PASSED] 2-level
[14:59:51] [PASSED] multi-level
[14:59:51] ==================== [PASSED] test_ops =====================
[14:59:51] ====================== [PASSED] lmtt =======================
[14:59:51] ========================== xe_bo  ==========================
[14:59:51] [SKIPPED] xe_ccs_migrate_kunit
[14:59:51] [SKIPPED] xe_bo_evict_kunit
[14:59:51] ===================== [SKIPPED] xe_bo ======================
[14:59:51] ======================= xe_dma_buf  ========================
[14:59:51] [SKIPPED] xe_dma_buf_kunit
[14:59:51] =================== [SKIPPED] xe_dma_buf ===================
[14:59:51] ======================= xe_migrate  ========================
[14:59:51] [SKIPPED] xe_migrate_sanity_kunit
[14:59:51] =================== [SKIPPED] xe_migrate ===================
[14:59:51] ========================= xe_mocs  =========================
[14:59:51] [SKIPPED] xe_live_mocs_kernel_kunit
[14:59:51] [SKIPPED] xe_live_mocs_reset_kunit
[14:59:51] ==================== [SKIPPED] xe_mocs =====================
[14:59:51] ========================= xe_pci  ==========================
[14:59:51] [PASSED] xe_gmdid_graphics_ip
[14:59:51] [PASSED] xe_gmdid_media_ip
[14:59:51] ===================== [PASSED] xe_pci ======================
[14:59:51] ========================= xe_rtp  ==========================
[14:59:51] ================== xe_rtp_process_tests  ===================
[14:59:51] [PASSED] coalesce-same-reg
[14:59:51] [PASSED] no-match-no-add
[14:59:51] [PASSED] no-match-no-add-multiple-rules
[14:59:51] [PASSED] two-regs-two-entries
[14:59:51] [PASSED] clr-one-set-other
[14:59:51] [PASSED] set-field
[14:59:51] [PASSED] conflict-duplicate
[14:59:51] [PASSED] conflict-not-disjoint
[14:59:51] [PASSED] conflict-reg-type
[14:59:51] ============== [PASSED] xe_rtp_process_tests ===============
[14:59:51] ===================== [PASSED] xe_rtp ======================
[14:59:51] ========================== xe_wa  ==========================
[14:59:51] ======================== xe_wa_gt  =========================
[14:59:51] [PASSED] TIGERLAKE (B0)
[14:59:51] [PASSED] DG1 (A0)
[14:59:51] [PASSED] DG1 (B0)
[14:59:51] [PASSED] ALDERLAKE_S (A0)
[14:59:51] [PASSED] ALDERLAKE_S (B0)
[14:59:51] [PASSED] ALDERLAKE_S (C0)
[14:59:51] [PASSED] ALDERLAKE_S (D0)
[14:59:51] [PASSED] ALDERLAKE_P (A0)
[14:59:51] [PASSED] ALDERLAKE_P (B0)
[14:59:51] [PASSED] ALDERLAKE_P (C0)
[14:59:51] [PASSED] ALDERLAKE_S_RPLS (D0)
[14:59:51] [PASSED] ALDERLAKE_P_RPLU (E0)
[14:59:51] [PASSED] DG2_G10 (C0)
[14:59:51] [PASSED] DG2_G11 (B1)
[14:59:51] [PASSED] DG2_G12 (A1)
[14:59:51] [PASSED] PVC (B0)
[14:59:51] [PASSED] PVC (B1)
[14:59:51] [PASSED] PVC (C0)
[14:59:51] [PASSED] METEORLAKE (g:A0, m:A0)
[14:59:51] [PASSED] METEORLAKE (g:A0, m:A0)
[14:59:51] [PASSED] LUNARLAKE (g:A0, m:A0)
[14:59:51] [PASSED] LUNARLAKE (g:B0, m:A0)
[14:59:51] ==================== [PASSED] xe_wa_gt =====================
[14:59:51] ====================== [PASSED] xe_wa ======================
[14:59:51] ============================================================
[14:59:51] Testing complete. Ran 83 tests: passed: 72, skipped: 11
[14:59:51] Elapsed time: 27.909s total, 4.250s configuring, 23.439s building, 0.189s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[14:59:51] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:59:53] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[15:00:13] Starting KUnit Kernel (1/1)...
[15:00:13] ============================================================
[15:00:13] ================== drm_test_pick_cmdline  ==================
[15:00:13] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[15:00:13] =============== drm_test_pick_cmdline_named  ===============
[15:00:13] [PASSED] NTSC
[15:00:13] [PASSED] NTSC-J
[15:00:13] [PASSED] PAL
[15:00:13] [PASSED] PAL-M
[15:00:13] =========== [PASSED] drm_test_pick_cmdline_named ===========
[15:00:13] ============== [PASSED] drm_test_pick_cmdline ==============
[15:00:13] ======================== drm_buddy  ========================
[15:00:13] [PASSED] drm_test_buddy_alloc_limit
[15:00:13] [PASSED] drm_test_buddy_alloc_optimistic
[15:00:13] [PASSED] drm_test_buddy_alloc_pessimistic
[15:00:13] [PASSED] drm_test_buddy_alloc_pathological
[15:00:13] ==================== [PASSED] drm_buddy ====================
[15:00:13] =================== drm_cmdline_parser  ====================
[15:00:13] [PASSED] drm_test_cmdline_force_d_only
[15:00:13] [PASSED] drm_test_cmdline_force_D_only_dvi
[15:00:13] [PASSED] drm_test_cmdline_force_D_only_hdmi
[15:00:13] [PASSED] drm_test_cmdline_force_D_only_not_digital
[15:00:13] [PASSED] drm_test_cmdline_force_e_only
[15:00:13] [PASSED] drm_test_cmdline_res
[15:00:13] [PASSED] drm_test_cmdline_res_vesa
[15:00:13] [PASSED] drm_test_cmdline_res_vesa_rblank
[15:00:13] [PASSED] drm_test_cmdline_res_rblank
[15:00:13] [PASSED] drm_test_cmdline_res_bpp
[15:00:13] [PASSED] drm_test_cmdline_res_refresh
[15:00:13] [PASSED] drm_test_cmdline_res_bpp_refresh
[15:00:13] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[15:00:13] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[15:00:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[15:00:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[15:00:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[15:00:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[15:00:13] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[15:00:13] [PASSED] drm_test_cmdline_res_margins_force_on
[15:00:13] [PASSED] drm_test_cmdline_res_vesa_margins
[15:00:13] [PASSED] drm_test_cmdline_name
[15:00:13] [PASSED] drm_test_cmdline_name_bpp
[15:00:13] [PASSED] drm_test_cmdline_name_option
[15:00:13] [PASSED] drm_test_cmdline_name_bpp_option
[15:00:13] [PASSED] drm_test_cmdline_rotate_0
[15:00:13] [PASSED] drm_test_cmdline_rotate_90
[15:00:13] [PASSED] drm_test_cmdline_rotate_180
[15:00:13] [PASSED] drm_test_cmdline_rotate_270
[15:00:13] [PASSED] drm_test_cmdline_hmirror
[15:00:13] [PASSED] drm_test_cmdline_vmirror
[15:00:13] [PASSED] drm_test_cmdline_margin_options
[15:00:13] [PASSED] drm_test_cmdline_multiple_options
[15:00:13] [PASSED] drm_test_cmdline_bpp_extra_and_option
[15:00:13] [PASSED] drm_test_cmdline_extra_and_option
[15:00:13] [PASSED] drm_test_cmdline_freestanding_options
[15:00:13] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[15:00:13] [PASSED] drm_test_cmdline_panel_orientation
[15:00:13] ================ drm_test_cmdline_invalid  =================
[15:00:13] [PASSED] margin_only
[15:00:13] [PASSED] interlace_only
[15:00:13] [PASSED] res_missing_x
[15:00:13] [PASSED] res_missing_y
[15:00:13] [PASSED] res_bad_y
[15:00:13] [PASSED] res_missing_y_bpp
[15:00:13] [PASSED] res_bad_bpp
[15:00:13] [PASSED] res_bad_refresh
[15:00:13] [PASSED] res_bpp_refresh_force_on_off
[15:00:13] [PASSED] res_invalid_mode
[15:00:13] [PASSED] res_bpp_wrong_place_mode
[15:00:13] [PASSED] name_bpp_refresh
[15:00:13] [PASSED] name_refresh
[15:00:13] [PASSED] name_refresh_wrong_mode
[15:00:13] [PASSED] name_refresh_invalid_mode
[15:00:13] [PASSED] rotate_multiple
[15:00:13] [PASSED] rotate_invalid_val
[15:00:13] [PASSED] rotate_truncated
[15:00:13] [PASSED] invalid_option
[15:00:13] [PASSED] invalid_tv_option
[15:00:13] [PASSED] truncated_tv_option
[15:00:13] ============ [PASSED] drm_test_cmdline_invalid =============
[15:00:13] =============== drm_test_cmdline_tv_options  ===============
[15:00:13] [PASSED] NTSC
[15:00:13] [PASSED] NTSC_443
[15:00:13] [PASSED] NTSC_J
[15:00:13] [PASSED] PAL
[15:00:13] [PASSED] PAL_M
[15:00:13] [PASSED] PAL_N
[15:00:13] [PASSED] SECAM
[15:00:13] =========== [PASSED] drm_test_cmdline_tv_options ===========
[15:00:13] =============== [PASSED] drm_cmdline_parser ================
[15:00:13] ================ drm_get_tv_mode_from_name  ================
[15:00:13] ========== drm_test_get_tv_mode_from_name_valid  ===========
[15:00:13] [PASSED] NTSC
[15:00:13] [PASSED] NTSC-443
[15:00:13] [PASSED] NTSC-J
[15:00:13] [PASSED] PAL
[15:00:13] [PASSED] PAL-M
[15:00:13] [PASSED] PAL-N
[15:00:13] [PASSED] SECAM
[15:00:13] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[15:00:13] [PASSED] drm_test_get_tv_mode_from_name_truncated
[15:00:13] ============ [PASSED] drm_get_tv_mode_from_name ============
[15:00:13] ==================== drm_damage_helper  ====================
[15:00:13] [PASSED] drm_test_damage_iter_no_damage
[15:00:13] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[15:00:13] [PASSED] drm_test_damage_iter_no_damage_src_moved
[15:00:13] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[15:00:13] [PASSED] drm_test_damage_iter_no_damage_not_visible
[15:00:13] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[15:00:13] [PASSED] drm_test_damage_iter_no_damage_no_fb
[15:00:13] [PASSED] drm_test_damage_iter_simple_damage
[15:00:13] [PASSED] drm_test_damage_iter_single_damage
[15:00:13] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[15:00:13] [PASSED] drm_test_damage_iter_single_damage_outside_src
[15:00:13] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[15:00:13] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[15:00:13] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[15:00:13] [PASSED] drm_test_damage_iter_single_damage_src_moved
[15:00:13] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[15:00:13] [PASSED] drm_test_damage_iter_damage
[15:00:13] [PASSED] drm_test_damage_iter_damage_one_intersect
[15:00:13] [PASSED] drm_test_damage_iter_damage_one_outside
[15:00:13] [PASSED] drm_test_damage_iter_damage_src_moved
[15:00:13] [PASSED] drm_test_damage_iter_damage_not_visible
[15:00:13] ================ [PASSED] drm_damage_helper ================
[15:00:13] ==================== drm_dp_mst_helper  ====================
[15:00:13] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[15:00:13] [PASSED] Clock 154000 BPP 30 DSC disabled
[15:00:13] [PASSED] Clock 234000 BPP 30 DSC disabled
[15:00:13] [PASSED] Clock 297000 BPP 24 DSC disabled
[15:00:13] [PASSED] Clock 332880 BPP 24 DSC enabled
[15:00:13] [PASSED] Clock 324540 BPP 24 DSC enabled
[15:00:13] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[15:00:13] ============== drm_test_dp_mst_calc_pbn_div  ===============
[15:00:13] [PASSED] Link rate 2000000 lane count 4
[15:00:13] [PASSED] Link rate 2000000 lane count 2
[15:00:13] [PASSED] Link rate 2000000 lane count 1
[15:00:13] [PASSED] Link rate 1350000 lane count 4
[15:00:13] [PASSED] Link rate 1350000 lane count 2
[15:00:13] [PASSED] Link rate 1350000 lane count 1
[15:00:13] [PASSED] Link rate 1000000 lane count 4
[15:00:13] [PASSED] Link rate 1000000 lane count 2
[15:00:13] [PASSED] Link rate 1000000 lane count 1
[15:00:13] [PASSED] Link rate 810000 lane count 4
[15:00:13] [PASSED] Link rate 810000 lane count 2
[15:00:13] [PASSED] Link rate 810000 lane count 1
[15:00:13] [PASSED] Link rate 540000 lane count 4
[15:00:13] [PASSED] Link rate 540000 lane count 2
[15:00:13] [PASSED] Link rate 540000 lane count 1
[15:00:13] [PASSED] Link rate 270000 lane count 4
[15:00:13] [PASSED] Link rate 270000 lane count 2
[15:00:13] [PASSED] Link rate 270000 lane count 1
[15:00:13] [PASSED] Link rate 162000 lane count 4
[15:00:13] [PASSED] Link rate 162000 lane count 2
[15:00:13] [PASSED] Link rate 162000 lane count 1
[15:00:13] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[15:00:13] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[15:00:13] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[15:00:13] [PASSED] DP_POWER_UP_PHY with port number
[15:00:13] [PASSED] DP_POWER_DOWN_PHY with port number
[15:00:13] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[15:00:13] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[15:00:13] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[15:00:13] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[15:00:13] [PASSED] DP_QUERY_PAYLOAD with port number
[15:00:13] [PASSED] DP_QUERY_PAYLOAD with VCPI
[15:00:13] [PASSED] DP_REMOTE_DPCD_READ with port number
[15:00:13] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[15:00:13] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[15:00:13] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[15:00:13] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[15:00:13] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[15:00:13] [PASSED] DP_REMOTE_I2C_READ with port number
[15:00:13] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[15:00:13] [PASSED] DP_REMOTE_I2C_READ with transactions array
[15:00:13] [PASSED] DP_REMOTE_I2C_WRITE with port number
[15:00:13] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[15:00:13] [PASSED] DP_REMOTE_I2C_WRITE with data array
[15:00:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[15:00:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[15:00:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[15:00:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[15:00:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[15:00:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[15:00:13] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[15:00:13] ================ [PASSED] drm_dp_mst_helper ================
[15:00:13] ======================== drm_exec  =========================
[15:00:13] [PASSED] sanitycheck
[15:00:13] [PASSED] test_lock
[15:00:13] [PASSED] test_lock_unlock
[15:00:13] [PASSED] test_duplicates
[15:00:13] [PASSED] test_prepare
[15:00:13] [PASSED] test_prepare_array
[15:00:13] [PASSED] test_multiple_loops
[15:00:13] ==================== [PASSED] drm_exec =====================
[15:00:13] ================= drm_format_helper_test  ==================
[15:00:13] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[15:00:13] [PASSED] single_pixel_source_buffer
[15:00:13] [PASSED] single_pixel_clip_rectangle
[15:00:13] [PASSED] well_known_colors
[15:00:13] [PASSED] destination_pitch
[15:00:13] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[15:00:13] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[15:00:13] [PASSED] single_pixel_source_buffer
[15:00:13] [PASSED] single_pixel_clip_rectangle
[15:00:13] [PASSED] well_known_colors
[15:00:13] [PASSED] destination_pitch
[15:00:13] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[15:00:13] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[15:00:13] [PASSED] single_pixel_source_buffer
[15:00:13] [PASSED] single_pixel_clip_rectangle
[15:00:13] [PASSED] well_known_colors
[15:00:13] [PASSED] destination_pitch
[15:00:13] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[15:00:13] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[15:00:13] [PASSED] single_pixel_source_buffer
[15:00:13] [PASSED] single_pixel_clip_rectangle
[15:00:13] [PASSED] well_known_colors
[15:00:13] [PASSED] destination_pitch
[15:00:13] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[15:00:13] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[15:00:13] [PASSED] single_pixel_source_buffer
[15:00:13] [PASSED] single_pixel_clip_rectangle
[15:00:13] [PASSED] well_known_colors
[15:00:13] [PASSED] destination_pitch
[15:00:13] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[15:00:13] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[15:00:13] [PASSED] single_pixel_source_buffer
[15:00:13] [PASSED] single_pixel_clip_rectangle
[15:00:13] [PASSED] well_known_colors
[15:00:13] [PASSED] destination_pitch
[15:00:13] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[15:00:13] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[15:00:13] [PASSED] single_pixel_source_buffer
[15:00:13] [PASSED] single_pixel_clip_rectangle
[15:00:13] [PASSED] well_known_colors
[15:00:13] [PASSED] destination_pitch
[15:00:13] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[15:00:13] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[15:00:13] [PASSED] single_pixel_source_buffer
[15:00:13] [PASSED] single_pixel_clip_rectangle
[15:00:13] [PASSED] well_known_colors
[15:00:13] [PASSED] destination_pitch
[15:00:13] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[15:00:13] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[15:00:13] [PASSED] single_pixel_source_buffer
[15:00:13] [PASSED] single_pixel_clip_rectangle
[15:00:13] [PASSED] well_known_colors
[15:00:13] [PASSED] destination_pitch
[15:00:13] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[15:00:13] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[15:00:13] [PASSED] single_pixel_source_buffer
[15:00:13] [PASSED] single_pixel_clip_rectangle
[15:00:13] [PASSED] well_known_colors
[15:00:13] [PASSED] destination_pitch
[15:00:13] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[15:00:13] ============== drm_test_fb_xrgb8888_to_mono  ===============
[15:00:13] [PASSED] single_pixel_source_buffer
[15:00:13] [PASSED] single_pixel_clip_rectangle
[15:00:13] [PASSED] well_known_colors
[15:00:13] [PASSED] destination_pitch
[15:00:13] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[15:00:13] ==================== drm_test_fb_swab  =====================
[15:00:13] [PASSED] single_pixel_source_buffer
[15:00:13] [PASSED] single_pixel_clip_rectangle
[15:00:13] [PASSED] well_known_colors
[15:00:13] [PASSED] destination_pitch
[15:00:13] ================ [PASSED] drm_test_fb_swab =================
[15:00:13] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[15:00:13] [PASSED] single_pixel_source_buffer
[15:00:13] [PASSED] single_pixel_clip_rectangle
[15:00:13] [PASSED] well_known_colors
[15:00:13] [PASSED] destination_pitch
[15:00:13] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[15:00:13] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[15:00:13] [PASSED] single_pixel_source_buffer
[15:00:13] [PASSED] single_pixel_clip_rectangle
[15:00:13] [PASSED] well_known_colors
[15:00:13] [PASSED] destination_pitch
[15:00:13] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[15:00:13] ================= drm_test_fb_clip_offset  =================
[15:00:13] [PASSED] pass through
[15:00:13] [PASSED] horizontal offset
[15:00:13] [PASSED] vertical offset
[15:00:13] [PASSED] horizontal and vertical offset
[15:00:13] [PASSED] horizontal offset (custom pitch)
[15:00:13] [PASSED] vertical offset (custom pitch)
[15:00:13] [PASSED] horizontal and vertical offset (custom pitch)
[15:00:13] ============= [PASSED] drm_test_fb_clip_offset =============
[15:00:13] ============== drm_test_fb_build_fourcc_list  ==============
[15:00:13] [PASSED] no native formats
[15:00:13] [PASSED] XRGB8888 as native format
[15:00:13] [PASSED] remove duplicates
[15:00:13] [PASSED] convert alpha formats
[15:00:13] [PASSED] random formats
[15:00:13] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[15:00:13] =================== drm_test_fb_memcpy  ====================
[15:00:13] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[15:00:13] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[15:00:13] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[15:00:13] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[15:00:13] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[15:00:13] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[15:00:13] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[15:00:13] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[15:00:13] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[15:00:13] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[15:00:13] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[15:00:13] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[15:00:13] =============== [PASSED] drm_test_fb_memcpy ================
[15:00:13] ============= [PASSED] drm_format_helper_test ==============
[15:00:13] ======================= drm_format  ========================
[15:00:13] [PASSED] drm_test_format_block_width_invalid
[15:00:13] [PASSED] drm_test_format_block_width_one_plane
[15:00:13] [PASSED] drm_test_format_block_width_two_plane
[15:00:13] [PASSED] drm_test_format_block_width_three_plane
[15:00:13] [PASSED] drm_test_format_block_width_tiled
[15:00:13] [PASSED] drm_test_format_block_height_invalid
[15:00:13] [PASSED] drm_test_format_block_height_one_plane
[15:00:13] [PASSED] drm_test_format_block_height_two_plane
[15:00:13] [PASSED] drm_test_format_block_height_three_plane
[15:00:13] [PASSED] drm_test_format_block_height_tiled
[15:00:13] [PASSED] drm_test_format_min_pitch_invalid
[15:00:13] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[15:00:13] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[15:00:13] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[15:00:13] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[15:00:13] [PASSED] drm_test_format_min_pitch_two_plane
[15:00:13] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[15:00:13] [PASSED] drm_test_format_min_pitch_tiled
[15:00:13] =================== [PASSED] drm_format ====================
[15:00:13] ===================== drm_framebuffer  =====================
[15:00:13] =============== drm_test_framebuffer_create  ===============
[15:00:13] [PASSED] ABGR8888 normal sizes
[15:00:13] [PASSED] ABGR8888 max sizes
[15:00:13] [PASSED] ABGR8888 pitch greater than min required
[15:00:13] [PASSED] ABGR8888 pitch less than min required
[15:00:13] [PASSED] ABGR8888 Invalid width
[15:00:13] [PASSED] ABGR8888 Invalid buffer handle
[15:00:13] [PASSED] No pixel format
[15:00:13] [PASSED] ABGR8888 Width 0
[15:00:13] [PASSED] ABGR8888 Height 0
[15:00:13] [PASSED] ABGR8888 Out of bound height * pitch combination
[15:00:13] [PASSED] ABGR8888 Large buffer offset
[15:00:13] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[15:00:13] [PASSED] ABGR8888 Valid buffer modifier
[15:00:13] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[15:00:13] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[15:00:13] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[15:00:13] [PASSED] NV12 Normal sizes
[15:00:13] [PASSED] NV12 Max sizes
[15:00:13] [PASSED] NV12 Invalid pitch
[15:00:13] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[15:00:13] [PASSED] NV12 different  modifier per-plane
[15:00:13] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[15:00:13] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[15:00:13] [PASSED] NV12 Modifier for inexistent plane
[15:00:13] [PASSED] NV12 Handle for inexistent plane
[15:00:13] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[15:00:13] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[15:00:13] [PASSED] YVU420 Normal sizes
[15:00:13] [PASSED] YVU420 Max sizes
[15:00:13] [PASSED] YVU420 Invalid pitch
[15:00:13] [PASSED] YVU420 Different pitches
[15:00:13] [PASSED] YVU420 Different buffer offsets/pitches
[15:00:13] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[15:00:13] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[15:00:13] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[15:00:13] [PASSED] YVU420 Valid modifier
[15:00:13] [PASSED] YVU420 Different modifiers per plane
[15:00:13] [PASSED] YVU420 Modifier for inexistent plane
[15:00:13] [PASSED] X0L2 Normal sizes
[15:00:13] [PASSED] X0L2 Max sizes
[15:00:13] [PASSED] X0L2 Invalid pitch
[15:00:13] [PASSED] X0L2 Pitch greater than minimum required
[15:00:13] [PASSED] X0L2 Handle for inexistent plane
[15:00:13] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[15:00:13] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[15:00:13] [PASSED] X0L2 Valid modifier
[15:00:13] [PASSED] X0L2 Modifier for inexistent plane
[15:00:13] =========== [PASSED] drm_test_framebuffer_create ===========
[15:00:13] ================= [PASSED] drm_framebuffer =================
[15:00:13] ====================== drm_gem_shmem  ======================
[15:00:13] [PASSED] drm_gem_shmem_test_obj_create
[15:00:13] [PASSED] drm_gem_shmem_test_obj_create_private
[15:00:13] [PASSED] drm_gem_shmem_test_pin_pages
[15:00:13] [PASSED] drm_gem_shmem_test_vmap
[15:00:13] [PASSED] drm_gem_shmem_test_get_pages_sgt
[15:00:13] [PASSED] drm_gem_shmem_test_get_sg_table
[15:00:13] [PASSED] drm_gem_shmem_test_madvise
[15:00:13] [PASSED] drm_gem_shmem_test_purge
[15:00:13] ================== [PASSED] drm_gem_shmem ==================
[15:00:13] ==================== drm-test-managed  =====================
[15:00:13] [PASSED] drm_test_managed_run_action
[15:00:13] ================ [PASSED] drm-test-managed =================
[15:00:13] ========================= drm_mm  ==========================
[15:00:13] [PASSED] drm_test_mm_init
[15:00:13] [PASSED] drm_test_mm_debug
[15:00:13] [PASSED] drm_test_mm_align32
[15:00:13] [PASSED] drm_test_mm_align64
[15:00:13] [PASSED] drm_test_mm_lowest
[15:00:13] [PASSED] drm_test_mm_highest
[15:00:13] ===================== [PASSED] drm_mm ======================
[15:00:13] =================== drm_modes_analog_tv  ===================
[15:00:13] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[15:00:13] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[15:00:13] [PASSED] drm_test_modes_analog_tv_pal_576i
[15:00:13] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[15:00:13] =============== [PASSED] drm_modes_analog_tv ===============
[15:00:13] ==================== drm_plane_helper  =====================
[15:00:13] =============== drm_test_check_plane_state  ================
[15:00:13] [PASSED] clipping_simple
[15:00:13] [PASSED] clipping_rotate_reflect
[15:00:13] [PASSED] positioning_simple
[15:00:13] [PASSED] upscaling
[15:00:13] [PASSED] downscaling
[15:00:13] [PASSED] rounding1
[15:00:13] [PASSED] rounding2
[15:00:13] [PASSED] rounding3
[15:00:13] [PASSED] rounding4
[15:00:13] =========== [PASSED] drm_test_check_plane_state ============
[15:00:13] =========== drm_test_check_invalid_plane_state  ============
[15:00:13] [PASSED] positioning_invalid
[15:00:13] [PASSED] upscaling_invalid
[15:00:13] [PASSED] downscaling_invalid
[15:00:13] ======= [PASSED] drm_test_check_invalid_plane_state ========
[15:00:13] ================ [PASSED] drm_plane_helper =================
[15:00:13] ============ drm_connector_helper_tv_get_modes  ============
[15:00:13] ====== drm_test_connector_helper_tv_get_modes_check  =======
[15:00:13] [PASSED] None
[15:00:13] [PASSED] PAL
[15:00:13] [PASSED] NTSC
[15:00:13] [PASSED] Both, NTSC Default
[15:00:13] [PASSED] Both, PAL Default
[15:00:13] [PASSED] Both, NTSC Default, with PAL on command-line
[15:00:13] [PASSED] Both, PAL Default, with NTSC on command-line
[15:00:13] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[15:00:13] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[15:00:13] ======================== drm_rect  =========================
[15:00:13] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[15:00:13] [PASSED] drm_test_rect_clip_scaled_not_clipped
[15:00:13] [PASSED] drm_test_rect_clip_scaled_clipped
[15:00:13] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[15:00:13] ================= drm_test_rect_intersect  =================
[15:00:13] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[15:00:13] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
stty: 'standard input': Inappropriate ioctl for device
[15:00:13] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[15:00:13] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[15:00:13] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[15:00:13] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[15:00:13] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[15:00:13] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[15:00:13] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[15:00:13] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[15:00:13] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[15:00:13] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[15:00:13] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[15:00:13] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[15:00:13] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[15:00:13] ============= [PASSED] drm_test_rect_intersect =============
[15:00:13] ================ drm_test_rect_calc_hscale  ================
[15:00:13] [PASSED] normal use
[15:00:13] [PASSED] out of max range
[15:00:13] [PASSED] out of min range
[15:00:13] [PASSED] zero dst
[15:00:13] [PASSED] negative src
[15:00:13] [PASSED] negative dst
[15:00:13] ============ [PASSED] drm_test_rect_calc_hscale ============
[15:00:13] ================ drm_test_rect_calc_vscale  ================
[15:00:13] [PASSED] normal use
[15:00:13] [PASSED] out of max range
[15:00:13] [PASSED] out of min range
[15:00:13] [PASSED] zero dst
[15:00:13] [PASSED] negative src
[15:00:13] [PASSED] negative dst
[15:00:13] ============ [PASSED] drm_test_rect_calc_vscale ============
[15:00:13] ================== drm_test_rect_rotate  ===================
[15:00:13] [PASSED] reflect-x
[15:00:13] [PASSED] reflect-y
[15:00:13] [PASSED] rotate-0
[15:00:13] [PASSED] rotate-90
[15:00:13] [PASSED] rotate-180
[15:00:13] [PASSED] rotate-270
[15:00:13] ============== [PASSED] drm_test_rect_rotate ===============
[15:00:13] ================ drm_test_rect_rotate_inv  =================
[15:00:13] [PASSED] reflect-x
[15:00:13] [PASSED] reflect-y
[15:00:13] [PASSED] rotate-0
[15:00:13] [PASSED] rotate-90
[15:00:13] [PASSED] rotate-180
[15:00:13] [PASSED] rotate-270
[15:00:13] ============ [PASSED] drm_test_rect_rotate_inv =============
[15:00:13] ==================== [PASSED] drm_rect =====================
[15:00:13] ============================================================
[15:00:13] Testing complete. Ran 390 tests: passed: 390
[15:00:13] Elapsed time: 22.048s total, 1.676s configuring, 20.245s building, 0.125s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


