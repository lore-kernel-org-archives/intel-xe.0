Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7382C4725D
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 01:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7149F10E0DE;
	Thu, 18 Jan 2024 01:36:46 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C5110E0DE;
 Thu, 18 Jan 2024 01:36:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_GSC_proxy_support_?=
 =?utf-8?q?=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Thu, 18 Jan 2024 01:36:45 -0000
Message-ID: <170554180588.537693.5318509125626126037@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240117182621.2653049-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240117182621.2653049-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe: GSC proxy support (rev4)
URL   : https://patchwork.freedesktop.org/series/127657/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[01:35:54] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:35:58] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[01:36:21] Starting KUnit Kernel (1/1)...
[01:36:21] ============================================================
[01:36:21] ========================= guc_dbm  =========================
[01:36:21] [PASSED] test_empty
[01:36:21] [PASSED] test_default
[01:36:21] ======================== test_size  ========================
[01:36:21] [PASSED] 4
[01:36:21] [PASSED] 8
[01:36:21] [PASSED] 32
[01:36:21] [PASSED] 256
[01:36:21] ==================== [PASSED] test_size ====================
[01:36:21] ======================= test_reuse  ========================
[01:36:21] [PASSED] 4
[01:36:21] [PASSED] 8
[01:36:21] [PASSED] 32
[01:36:21] [PASSED] 256
[01:36:21] =================== [PASSED] test_reuse ====================
[01:36:21] =================== test_range_overlap  ====================
[01:36:21] [PASSED] 4
[01:36:21] [PASSED] 8
[01:36:21] [PASSED] 32
[01:36:21] [PASSED] 256
[01:36:21] =============== [PASSED] test_range_overlap ================
[01:36:21] =================== test_range_compact  ====================
[01:36:21] [PASSED] 4
[01:36:21] [PASSED] 8
[01:36:21] [PASSED] 32
[01:36:21] [PASSED] 256
[01:36:21] =============== [PASSED] test_range_compact ================
[01:36:21] ==================== test_range_spare  =====================
[01:36:21] [PASSED] 4
[01:36:21] [PASSED] 8
[01:36:21] [PASSED] 32
[01:36:21] [PASSED] 256
[01:36:21] ================ [PASSED] test_range_spare =================
[01:36:21] ===================== [PASSED] guc_dbm =====================
[01:36:21] ======================== no_relay  =========================
[01:36:21] [PASSED] xe_drops_guc2pf_if_not_ready
[01:36:21] [PASSED] xe_drops_guc2vf_if_not_ready
[01:36:21] [PASSED] xe_rejects_send_if_not_ready
[01:36:21] ==================== [PASSED] no_relay =====================
[01:36:21] ======================== pf_relay  =========================
[01:36:21] [PASSED] pf_rejects_guc2pf_too_short
[01:36:21] [PASSED] pf_rejects_guc2pf_too_long
[01:36:21] [PASSED] pf_rejects_guc2pf_no_payload
[01:36:21] [PASSED] pf_fails_no_payload
[01:36:21] [PASSED] pf_fails_bad_origin
[01:36:21] [PASSED] pf_fails_bad_type
[01:36:21] [PASSED] pf_txn_reports_error
[01:36:21] [PASSED] pf_txn_sends_pf2guc
[01:36:21] [PASSED] pf_sends_pf2guc
[01:36:21] [SKIPPED] pf_loopback_nop
[01:36:21] [SKIPPED] pf_loopback_echo
[01:36:21] [SKIPPED] pf_loopback_fail
[01:36:21] [SKIPPED] pf_loopback_busy
[01:36:21] [SKIPPED] pf_loopback_retry
[01:36:21] ==================== [PASSED] pf_relay =====================
[01:36:21] ======================== vf_relay  =========================
[01:36:21] [PASSED] vf_rejects_guc2vf_too_short
[01:36:21] [PASSED] vf_rejects_guc2vf_too_long
[01:36:21] [PASSED] vf_rejects_guc2vf_no_payload
[01:36:21] ==================== [PASSED] vf_relay =====================
[01:36:21] ========================== lmtt  ===========================
[01:36:21] ======================== test_ops  =========================
[01:36:21] [PASSED] 2-level
[01:36:21] [PASSED] multi-level
[01:36:21] ==================== [PASSED] test_ops =====================
[01:36:21] ====================== [PASSED] lmtt =======================
[01:36:21] ========================== xe_bo  ==========================
[01:36:21] [SKIPPED] xe_ccs_migrate_kunit
[01:36:21] [SKIPPED] xe_bo_evict_kunit
[01:36:21] ===================== [SKIPPED] xe_bo ======================
[01:36:21] ======================= xe_dma_buf  ========================
[01:36:21] [SKIPPED] xe_dma_buf_kunit
[01:36:21] =================== [SKIPPED] xe_dma_buf ===================
[01:36:21] ======================= xe_migrate  ========================
[01:36:21] [SKIPPED] xe_migrate_sanity_kunit
[01:36:21] =================== [SKIPPED] xe_migrate ===================
[01:36:21] ========================= xe_mocs  =========================
[01:36:21] [SKIPPED] xe_live_mocs_kernel_kunit
[01:36:21] [SKIPPED] xe_live_mocs_reset_kunit
[01:36:21] ==================== [SKIPPED] xe_mocs =====================
[01:36:21] ========================= xe_pci  ==========================
[01:36:21] [PASSED] xe_gmdid_graphics_ip
[01:36:21] [PASSED] xe_gmdid_media_ip
[01:36:21] ===================== [PASSED] xe_pci ======================
[01:36:21] ========================= xe_rtp  ==========================
[01:36:21] ================== xe_rtp_process_tests  ===================
[01:36:21] [PASSED] coalesce-same-reg
[01:36:21] [PASSED] no-match-no-add
[01:36:21] [PASSED] no-match-no-add-multiple-rules
[01:36:21] [PASSED] two-regs-two-entries
[01:36:21] [PASSED] clr-one-set-other
[01:36:21] [PASSED] set-field
[01:36:21] [PASSED] conflict-duplicate
[01:36:21] [PASSED] conflict-not-disjoint
[01:36:21] [PASSED] conflict-reg-type
[01:36:21] ============== [PASSED] xe_rtp_process_tests ===============
[01:36:21] ===================== [PASSED] xe_rtp ======================
[01:36:21] ========================== xe_wa  ==========================
[01:36:21] ======================== xe_wa_gt  =========================
[01:36:21] [PASSED] TIGERLAKE (B0)
[01:36:21] [PASSED] DG1 (A0)
[01:36:21] [PASSED] DG1 (B0)
[01:36:21] [PASSED] ALDERLAKE_S (A0)
[01:36:21] [PASSED] ALDERLAKE_S (B0)
[01:36:21] [PASSED] ALDERLAKE_S (C0)
[01:36:21] [PASSED] ALDERLAKE_S (D0)
[01:36:21] [PASSED] ALDERLAKE_P (A0)
[01:36:21] [PASSED] ALDERLAKE_P (B0)
[01:36:21] [PASSED] ALDERLAKE_P (C0)
[01:36:21] [PASSED] ALDERLAKE_S_RPLS (D0)
[01:36:21] [PASSED] ALDERLAKE_P_RPLU (E0)
[01:36:21] [PASSED] DG2_G10 (C0)
[01:36:21] [PASSED] DG2_G11 (B1)
[01:36:21] [PASSED] DG2_G12 (A1)
[01:36:21] [PASSED] PVC (B0)
[01:36:21] [PASSED] PVC (B1)
[01:36:21] [PASSED] PVC (C0)
[01:36:21] [PASSED] METEORLAKE (g:A0, m:A0)
[01:36:21] [PASSED] METEORLAKE (g:A0, m:A0)
[01:36:21] [PASSED] LUNARLAKE (g:A0, m:A0)
[01:36:21] [PASSED] LUNARLAKE (g:B0, m:A0)
[01:36:21] ==================== [PASSED] xe_wa_gt =====================
[01:36:21] ====================== [PASSED] xe_wa ======================
[01:36:21] ============================================================
[01:36:21] Testing complete. Ran 83 tests: passed: 72, skipped: 11
[01:36:21] Elapsed time: 27.724s total, 4.164s configuring, 23.340s building, 0.182s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[01:36:21] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:36:23] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[01:36:43] Starting KUnit Kernel (1/1)...
[01:36:43] ============================================================
[01:36:43] ================== drm_test_pick_cmdline  ==================
[01:36:43] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[01:36:43] =============== drm_test_pick_cmdline_named  ===============
[01:36:43] [PASSED] NTSC
[01:36:43] [PASSED] NTSC-J
[01:36:43] [PASSED] PAL
[01:36:43] [PASSED] PAL-M
[01:36:43] =========== [PASSED] drm_test_pick_cmdline_named ===========
[01:36:43] ============== [PASSED] drm_test_pick_cmdline ==============
[01:36:43] ======================== drm_buddy  ========================
[01:36:43] [PASSED] drm_test_buddy_alloc_limit
[01:36:43] [PASSED] drm_test_buddy_alloc_optimistic
[01:36:43] [PASSED] drm_test_buddy_alloc_pessimistic
[01:36:43] [PASSED] drm_test_buddy_alloc_pathological
[01:36:43] ==================== [PASSED] drm_buddy ====================
[01:36:43] =================== drm_cmdline_parser  ====================
[01:36:43] [PASSED] drm_test_cmdline_force_d_only
[01:36:43] [PASSED] drm_test_cmdline_force_D_only_dvi
[01:36:43] [PASSED] drm_test_cmdline_force_D_only_hdmi
[01:36:43] [PASSED] drm_test_cmdline_force_D_only_not_digital
[01:36:43] [PASSED] drm_test_cmdline_force_e_only
[01:36:43] [PASSED] drm_test_cmdline_res
[01:36:43] [PASSED] drm_test_cmdline_res_vesa
[01:36:43] [PASSED] drm_test_cmdline_res_vesa_rblank
[01:36:43] [PASSED] drm_test_cmdline_res_rblank
[01:36:43] [PASSED] drm_test_cmdline_res_bpp
[01:36:43] [PASSED] drm_test_cmdline_res_refresh
[01:36:43] [PASSED] drm_test_cmdline_res_bpp_refresh
[01:36:43] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[01:36:43] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[01:36:43] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[01:36:43] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[01:36:43] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[01:36:43] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[01:36:43] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[01:36:43] [PASSED] drm_test_cmdline_res_margins_force_on
[01:36:43] [PASSED] drm_test_cmdline_res_vesa_margins
[01:36:43] [PASSED] drm_test_cmdline_name
[01:36:43] [PASSED] drm_test_cmdline_name_bpp
[01:36:43] [PASSED] drm_test_cmdline_name_option
[01:36:43] [PASSED] drm_test_cmdline_name_bpp_option
[01:36:43] [PASSED] drm_test_cmdline_rotate_0
[01:36:43] [PASSED] drm_test_cmdline_rotate_90
[01:36:43] [PASSED] drm_test_cmdline_rotate_180
[01:36:43] [PASSED] drm_test_cmdline_rotate_270
[01:36:43] [PASSED] drm_test_cmdline_hmirror
[01:36:43] [PASSED] drm_test_cmdline_vmirror
[01:36:43] [PASSED] drm_test_cmdline_margin_options
[01:36:43] [PASSED] drm_test_cmdline_multiple_options
[01:36:43] [PASSED] drm_test_cmdline_bpp_extra_and_option
[01:36:43] [PASSED] drm_test_cmdline_extra_and_option
[01:36:43] [PASSED] drm_test_cmdline_freestanding_options
[01:36:43] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[01:36:43] [PASSED] drm_test_cmdline_panel_orientation
[01:36:43] ================ drm_test_cmdline_invalid  =================
[01:36:43] [PASSED] margin_only
[01:36:43] [PASSED] interlace_only
[01:36:43] [PASSED] res_missing_x
[01:36:43] [PASSED] res_missing_y
[01:36:43] [PASSED] res_bad_y
[01:36:43] [PASSED] res_missing_y_bpp
[01:36:43] [PASSED] res_bad_bpp
[01:36:43] [PASSED] res_bad_refresh
[01:36:43] [PASSED] res_bpp_refresh_force_on_off
[01:36:43] [PASSED] res_invalid_mode
[01:36:43] [PASSED] res_bpp_wrong_place_mode
[01:36:43] [PASSED] name_bpp_refresh
[01:36:43] [PASSED] name_refresh
[01:36:43] [PASSED] name_refresh_wrong_mode
[01:36:43] [PASSED] name_refresh_invalid_mode
[01:36:43] [PASSED] rotate_multiple
[01:36:43] [PASSED] rotate_invalid_val
[01:36:43] [PASSED] rotate_truncated
[01:36:43] [PASSED] invalid_option
[01:36:43] [PASSED] invalid_tv_option
[01:36:43] [PASSED] truncated_tv_option
[01:36:43] ============ [PASSED] drm_test_cmdline_invalid =============
[01:36:43] =============== drm_test_cmdline_tv_options  ===============
[01:36:43] [PASSED] NTSC
[01:36:43] [PASSED] NTSC_443
[01:36:43] [PASSED] NTSC_J
[01:36:43] [PASSED] PAL
[01:36:43] [PASSED] PAL_M
[01:36:43] [PASSED] PAL_N
[01:36:43] [PASSED] SECAM
[01:36:43] =========== [PASSED] drm_test_cmdline_tv_options ===========
[01:36:43] =============== [PASSED] drm_cmdline_parser ================
[01:36:43] ================ drm_get_tv_mode_from_name  ================
[01:36:43] ========== drm_test_get_tv_mode_from_name_valid  ===========
[01:36:43] [PASSED] NTSC
[01:36:43] [PASSED] NTSC-443
[01:36:43] [PASSED] NTSC-J
[01:36:43] [PASSED] PAL
[01:36:43] [PASSED] PAL-M
[01:36:43] [PASSED] PAL-N
[01:36:43] [PASSED] SECAM
[01:36:43] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[01:36:43] [PASSED] drm_test_get_tv_mode_from_name_truncated
[01:36:43] ============ [PASSED] drm_get_tv_mode_from_name ============
[01:36:43] ==================== drm_damage_helper  ====================
[01:36:43] [PASSED] drm_test_damage_iter_no_damage
[01:36:43] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[01:36:43] [PASSED] drm_test_damage_iter_no_damage_src_moved
[01:36:43] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[01:36:43] [PASSED] drm_test_damage_iter_no_damage_not_visible
[01:36:43] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[01:36:43] [PASSED] drm_test_damage_iter_no_damage_no_fb
[01:36:43] [PASSED] drm_test_damage_iter_simple_damage
[01:36:43] [PASSED] drm_test_damage_iter_single_damage
[01:36:43] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[01:36:43] [PASSED] drm_test_damage_iter_single_damage_outside_src
[01:36:43] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[01:36:43] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[01:36:43] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[01:36:43] [PASSED] drm_test_damage_iter_single_damage_src_moved
[01:36:43] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[01:36:43] [PASSED] drm_test_damage_iter_damage
[01:36:43] [PASSED] drm_test_damage_iter_damage_one_intersect
[01:36:43] [PASSED] drm_test_damage_iter_damage_one_outside
[01:36:43] [PASSED] drm_test_damage_iter_damage_src_moved
[01:36:43] [PASSED] drm_test_damage_iter_damage_not_visible
[01:36:43] ================ [PASSED] drm_damage_helper ================
[01:36:43] ==================== drm_dp_mst_helper  ====================
[01:36:43] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[01:36:43] [PASSED] Clock 154000 BPP 30 DSC disabled
[01:36:43] [PASSED] Clock 234000 BPP 30 DSC disabled
[01:36:43] [PASSED] Clock 297000 BPP 24 DSC disabled
[01:36:43] [PASSED] Clock 332880 BPP 24 DSC enabled
[01:36:43] [PASSED] Clock 324540 BPP 24 DSC enabled
[01:36:43] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[01:36:43] ============== drm_test_dp_mst_calc_pbn_div  ===============
[01:36:43] [PASSED] Link rate 2000000 lane count 4
[01:36:43] [PASSED] Link rate 2000000 lane count 2
[01:36:43] [PASSED] Link rate 2000000 lane count 1
[01:36:43] [PASSED] Link rate 1350000 lane count 4
[01:36:43] [PASSED] Link rate 1350000 lane count 2
[01:36:43] [PASSED] Link rate 1350000 lane count 1
[01:36:43] [PASSED] Link rate 1000000 lane count 4
[01:36:43] [PASSED] Link rate 1000000 lane count 2
[01:36:43] [PASSED] Link rate 1000000 lane count 1
[01:36:43] [PASSED] Link rate 810000 lane count 4
[01:36:43] [PASSED] Link rate 810000 lane count 2
[01:36:43] [PASSED] Link rate 810000 lane count 1
[01:36:43] [PASSED] Link rate 540000 lane count 4
[01:36:43] [PASSED] Link rate 540000 lane count 2
[01:36:43] [PASSED] Link rate 540000 lane count 1
[01:36:43] [PASSED] Link rate 270000 lane count 4
[01:36:43] [PASSED] Link rate 270000 lane count 2
[01:36:43] [PASSED] Link rate 270000 lane count 1
[01:36:43] [PASSED] Link rate 162000 lane count 4
[01:36:43] [PASSED] Link rate 162000 lane count 2
[01:36:43] [PASSED] Link rate 162000 lane count 1
[01:36:43] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[01:36:43] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[01:36:43] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[01:36:43] [PASSED] DP_POWER_UP_PHY with port number
[01:36:43] [PASSED] DP_POWER_DOWN_PHY with port number
[01:36:43] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[01:36:43] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[01:36:43] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[01:36:43] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[01:36:43] [PASSED] DP_QUERY_PAYLOAD with port number
[01:36:43] [PASSED] DP_QUERY_PAYLOAD with VCPI
[01:36:43] [PASSED] DP_REMOTE_DPCD_READ with port number
[01:36:43] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[01:36:43] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[01:36:43] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[01:36:43] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[01:36:43] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[01:36:43] [PASSED] DP_REMOTE_I2C_READ with port number
[01:36:43] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[01:36:43] [PASSED] DP_REMOTE_I2C_READ with transactions array
[01:36:43] [PASSED] DP_REMOTE_I2C_WRITE with port number
[01:36:43] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[01:36:43] [PASSED] DP_REMOTE_I2C_WRITE with data array
[01:36:43] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[01:36:43] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[01:36:43] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[01:36:43] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[01:36:43] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[01:36:43] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[01:36:43] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[01:36:43] ================ [PASSED] drm_dp_mst_helper ================
[01:36:43] ======================== drm_exec  =========================
[01:36:43] [PASSED] sanitycheck
[01:36:43] [PASSED] test_lock
[01:36:43] [PASSED] test_lock_unlock
[01:36:43] [PASSED] test_duplicates
[01:36:43] [PASSED] test_prepare
[01:36:43] [PASSED] test_prepare_array
[01:36:43] [PASSED] test_multiple_loops
[01:36:43] ==================== [PASSED] drm_exec =====================
[01:36:43] ================= drm_format_helper_test  ==================
[01:36:43] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[01:36:43] [PASSED] single_pixel_source_buffer
[01:36:43] [PASSED] single_pixel_clip_rectangle
[01:36:43] [PASSED] well_known_colors
[01:36:43] [PASSED] destination_pitch
[01:36:43] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[01:36:43] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[01:36:43] [PASSED] single_pixel_source_buffer
[01:36:43] [PASSED] single_pixel_clip_rectangle
[01:36:43] [PASSED] well_known_colors
[01:36:43] [PASSED] destination_pitch
[01:36:43] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[01:36:43] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[01:36:43] [PASSED] single_pixel_source_buffer
[01:36:43] [PASSED] single_pixel_clip_rectangle
[01:36:43] [PASSED] well_known_colors
[01:36:43] [PASSED] destination_pitch
[01:36:43] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[01:36:43] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[01:36:43] [PASSED] single_pixel_source_buffer
[01:36:43] [PASSED] single_pixel_clip_rectangle
[01:36:43] [PASSED] well_known_colors
[01:36:43] [PASSED] destination_pitch
[01:36:43] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[01:36:43] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[01:36:43] [PASSED] single_pixel_source_buffer
[01:36:43] [PASSED] single_pixel_clip_rectangle
[01:36:43] [PASSED] well_known_colors
[01:36:43] [PASSED] destination_pitch
[01:36:43] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[01:36:43] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[01:36:43] [PASSED] single_pixel_source_buffer
[01:36:43] [PASSED] single_pixel_clip_rectangle
[01:36:43] [PASSED] well_known_colors
[01:36:43] [PASSED] destination_pitch
[01:36:43] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[01:36:43] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[01:36:43] [PASSED] single_pixel_source_buffer
[01:36:43] [PASSED] single_pixel_clip_rectangle
[01:36:43] [PASSED] well_known_colors
[01:36:43] [PASSED] destination_pitch
[01:36:43] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[01:36:43] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[01:36:43] [PASSED] single_pixel_source_buffer
[01:36:43] [PASSED] single_pixel_clip_rectangle
[01:36:43] [PASSED] well_known_colors
[01:36:43] [PASSED] destination_pitch
[01:36:43] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[01:36:43] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[01:36:43] [PASSED] single_pixel_source_buffer
[01:36:43] [PASSED] single_pixel_clip_rectangle
[01:36:43] [PASSED] well_known_colors
[01:36:43] [PASSED] destination_pitch
[01:36:43] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[01:36:43] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[01:36:43] [PASSED] single_pixel_source_buffer
[01:36:43] [PASSED] single_pixel_clip_rectangle
[01:36:43] [PASSED] well_known_colors
[01:36:43] [PASSED] destination_pitch
[01:36:43] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[01:36:43] ============== drm_test_fb_xrgb8888_to_mono  ===============
[01:36:43] [PASSED] single_pixel_source_buffer
[01:36:43] [PASSED] single_pixel_clip_rectangle
[01:36:43] [PASSED] well_known_colors
[01:36:43] [PASSED] destination_pitch
[01:36:43] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[01:36:43] ==================== drm_test_fb_swab  =====================
[01:36:43] [PASSED] single_pixel_source_buffer
[01:36:43] [PASSED] single_pixel_clip_rectangle
[01:36:43] [PASSED] well_known_colors
[01:36:43] [PASSED] destination_pitch
[01:36:43] ================ [PASSED] drm_test_fb_swab =================
[01:36:43] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[01:36:43] [PASSED] single_pixel_source_buffer
[01:36:43] [PASSED] single_pixel_clip_rectangle
[01:36:43] [PASSED] well_known_colors
[01:36:43] [PASSED] destination_pitch
[01:36:43] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[01:36:43] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[01:36:43] [PASSED] single_pixel_source_buffer
[01:36:43] [PASSED] single_pixel_clip_rectangle
[01:36:43] [PASSED] well_known_colors
[01:36:43] [PASSED] destination_pitch
[01:36:43] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[01:36:43] ================= drm_test_fb_clip_offset  =================
[01:36:43] [PASSED] pass through
[01:36:43] [PASSED] horizontal offset
[01:36:43] [PASSED] vertical offset
[01:36:43] [PASSED] horizontal and vertical offset
[01:36:43] [PASSED] horizontal offset (custom pitch)
[01:36:43] [PASSED] vertical offset (custom pitch)
[01:36:43] [PASSED] horizontal and vertical offset (custom pitch)
[01:36:43] ============= [PASSED] drm_test_fb_clip_offset =============
[01:36:43] ============== drm_test_fb_build_fourcc_list  ==============
[01:36:43] [PASSED] no native formats
[01:36:43] [PASSED] XRGB8888 as native format
[01:36:43] [PASSED] remove duplicates
[01:36:43] [PASSED] convert alpha formats
[01:36:43] [PASSED] random formats
[01:36:43] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[01:36:43] =================== drm_test_fb_memcpy  ====================
[01:36:43] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[01:36:43] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[01:36:43] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[01:36:43] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[01:36:43] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[01:36:43] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[01:36:43] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[01:36:43] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[01:36:43] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[01:36:43] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[01:36:43] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[01:36:43] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[01:36:43] =============== [PASSED] drm_test_fb_memcpy ================
[01:36:43] ============= [PASSED] drm_format_helper_test ==============
[01:36:43] ======================= drm_format  ========================
[01:36:43] [PASSED] drm_test_format_block_width_invalid
[01:36:43] [PASSED] drm_test_format_block_width_one_plane
[01:36:43] [PASSED] drm_test_format_block_width_two_plane
[01:36:43] [PASSED] drm_test_format_block_width_three_plane
[01:36:43] [PASSED] drm_test_format_block_width_tiled
[01:36:43] [PASSED] drm_test_format_block_height_invalid
[01:36:43] [PASSED] drm_test_format_block_height_one_plane
[01:36:43] [PASSED] drm_test_format_block_height_two_plane
[01:36:43] [PASSED] drm_test_format_block_height_three_plane
[01:36:43] [PASSED] drm_test_format_block_height_tiled
[01:36:43] [PASSED] drm_test_format_min_pitch_invalid
[01:36:43] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[01:36:43] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[01:36:43] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[01:36:43] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[01:36:43] [PASSED] drm_test_format_min_pitch_two_plane
[01:36:43] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[01:36:43] [PASSED] drm_test_format_min_pitch_tiled
[01:36:43] =================== [PASSED] drm_format ====================
[01:36:43] ===================== drm_framebuffer  =====================
[01:36:43] =============== drm_test_framebuffer_create  ===============
[01:36:43] [PASSED] ABGR8888 normal sizes
[01:36:43] [PASSED] ABGR8888 max sizes
[01:36:43] [PASSED] ABGR8888 pitch greater than min required
[01:36:43] [PASSED] ABGR8888 pitch less than min required
[01:36:43] [PASSED] ABGR8888 Invalid width
[01:36:43] [PASSED] ABGR8888 Invalid buffer handle
[01:36:43] [PASSED] No pixel format
[01:36:43] [PASSED] ABGR8888 Width 0
[01:36:43] [PASSED] ABGR8888 Height 0
[01:36:43] [PASSED] ABGR8888 Out of bound height * pitch combination
[01:36:43] [PASSED] ABGR8888 Large buffer offset
[01:36:43] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[01:36:43] [PASSED] ABGR8888 Valid buffer modifier
[01:36:43] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[01:36:43] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[01:36:43] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[01:36:43] [PASSED] NV12 Normal sizes
[01:36:43] [PASSED] NV12 Max sizes
[01:36:43] [PASSED] NV12 Invalid pitch
[01:36:43] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[01:36:43] [PASSED] NV12 different  modifier per-plane
[01:36:43] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[01:36:43] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[01:36:43] [PASSED] NV12 Modifier for inexistent plane
[01:36:43] [PASSED] NV12 Handle for inexistent plane
[01:36:43] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[01:36:43] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[01:36:43] [PASSED] YVU420 Normal sizes
[01:36:43] [PASSED] YVU420 Max sizes
[01:36:43] [PASSED] YVU420 Invalid pitch
[01:36:43] [PASSED] YVU420 Different pitches
[01:36:43] [PASSED] YVU420 Different buffer offsets/pitches
[01:36:43] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[01:36:43] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[01:36:43] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[01:36:43] [PASSED] YVU420 Valid modifier
[01:36:43] [PASSED] YVU420 Different modifiers per plane
[01:36:43] [PASSED] YVU420 Modifier for inexistent plane
[01:36:43] [PASSED] X0L2 Normal sizes
[01:36:43] [PASSED] X0L2 Max sizes
[01:36:43] [PASSED] X0L2 Invalid pitch
[01:36:43] [PASSED] X0L2 Pitch greater than minimum required
[01:36:43] [PASSED] X0L2 Handle for inexistent plane
[01:36:43] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[01:36:43] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[01:36:43] [PASSED] X0L2 Valid modifier
[01:36:43] [PASSED] X0L2 Modifier for inexistent plane
[01:36:43] =========== [PASSED] drm_test_framebuffer_create ===========
[01:36:43] ================= [PASSED] drm_framebuffer =================
[01:36:43] ====================== drm_gem_shmem  ======================
[01:36:43] [PASSED] drm_gem_shmem_test_obj_create
[01:36:43] [PASSED] drm_gem_shmem_test_obj_create_private
[01:36:43] [PASSED] drm_gem_shmem_test_pin_pages
[01:36:43] [PASSED] drm_gem_shmem_test_vmap
[01:36:43] [PASSED] drm_gem_shmem_test_get_pages_sgt
[01:36:43] [PASSED] drm_gem_shmem_test_get_sg_table
[01:36:43] [PASSED] drm_gem_shmem_test_madvise
[01:36:43] [PASSED] drm_gem_shmem_test_purge
[01:36:43] ================== [PASSED] drm_gem_shmem ==================
[01:36:43] ======================= drm_managed  =======================
[01:36:43] [PASSED] drm_test_managed_release_action
[01:36:43] [PASSED] drm_test_managed_run_action
[01:36:43] =================== [PASSED] drm_managed ===================
[01:36:43] ========================= drm_mm  ==========================
[01:36:43] [PASSED] drm_test_mm_init
[01:36:43] [PASSED] drm_test_mm_debug
[01:36:43] [PASSED] drm_test_mm_align32
[01:36:43] [PASSED] drm_test_mm_align64
[01:36:43] [PASSED] drm_test_mm_lowest
[01:36:43] [PASSED] drm_test_mm_highest
[01:36:43] ===================== [PASSED] drm_mm ======================
[01:36:43] =================== drm_modes_analog_tv  ===================
[01:36:43] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[01:36:43] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[01:36:43] [PASSED] drm_test_modes_analog_tv_pal_576i
[01:36:43] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[01:36:43] =============== [PASSED] drm_modes_analog_tv ===============
[01:36:43] ==================== drm_plane_helper  =====================
[01:36:43] =============== drm_test_check_plane_state  ================
[01:36:43] [PASSED] clipping_simple
[01:36:43] [PASSED] clipping_rotate_reflect
[01:36:43] [PASSED] positioning_simple
[01:36:43] [PASSED] upscaling
[01:36:43] [PASSED] downscaling
[01:36:43] [PASSED] rounding1
[01:36:43] [PASSED] rounding2
[01:36:43] [PASSED] rounding3
[01:36:43] [PASSED] rounding4
[01:36:43] =========== [PASSED] drm_test_check_plane_state ============
[01:36:43] =========== drm_test_check_invalid_plane_state  ============
[01:36:43] [PASSED] positioning_invalid
[01:36:43] [PASSED] upscaling_invalid
[01:36:43] [PASSED] downscaling_invalid
[01:36:43] ======= [PASSED] drm_test_check_invalid_plane_state ========
[01:36:43] ================ [PASSED] drm_plane_helper =================
[01:36:43] ============ drm_connector_helper_tv_get_modes  ============
[01:36:43] ====== drm_test_connector_helper_tv_get_modes_check  =======
[01:36:43] [PASSED] None
[01:36:43] [PASSED] PAL
[01:36:43] [PASSED] NTSC
[01:36:43] [PASSED] Both, NTSC Default
[01:36:43] [PASSED] Both, PAL Default
[01:36:43] [PASSED] Both, NTSC Default, with PAL on command-line
[01:36:43] [PASSED] Both, PAL Default, with NTSC on command-line
[01:36:43] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[01:36:43] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[01:36:43] ======================== drm_rect  =========================
[01:36:43] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[01:36:43] [PASSED] drm_test_rect_clip_scaled_not_clipped
[01:36:43] [PASSED] drm_test_rect_clip_scaled_clipped
[01:36:43] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[01:36:43] ================= drm_test_rect_intersect  =================
[01:36:43] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
stty: 'standard input': Inappropriate ioctl for device
[01:36:43] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[01:36:43] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[01:36:43] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[01:36:43] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[01:36:43] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[01:36:43] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[01:36:43] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[01:36:43] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[01:36:43] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[01:36:43] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[01:36:43] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[01:36:43] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[01:36:43] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[01:36:43] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[01:36:43] ============= [PASSED] drm_test_rect_intersect =============
[01:36:43] ================ drm_test_rect_calc_hscale  ================
[01:36:43] [PASSED] normal use
[01:36:43] [PASSED] out of max range
[01:36:43] [PASSED] out of min range
[01:36:43] [PASSED] zero dst
[01:36:43] [PASSED] negative src
[01:36:43] [PASSED] negative dst
[01:36:43] ============ [PASSED] drm_test_rect_calc_hscale ============
[01:36:43] ================ drm_test_rect_calc_vscale  ================
[01:36:43] [PASSED] normal use
[01:36:43] [PASSED] out of max range
[01:36:43] [PASSED] out of min range
[01:36:43] [PASSED] zero dst
[01:36:43] [PASSED] negative src
[01:36:43] [PASSED] negative dst
[01:36:43] ============ [PASSED] drm_test_rect_calc_vscale ============
[01:36:43] ================== drm_test_rect_rotate  ===================
[01:36:43] [PASSED] reflect-x
[01:36:43] [PASSED] reflect-y
[01:36:43] [PASSED] rotate-0
[01:36:43] [PASSED] rotate-90
[01:36:43] [PASSED] rotate-180
[01:36:43] [PASSED] rotate-270
[01:36:43] ============== [PASSED] drm_test_rect_rotate ===============
[01:36:43] ================ drm_test_rect_rotate_inv  =================
[01:36:43] [PASSED] reflect-x
[01:36:43] [PASSED] reflect-y
[01:36:43] [PASSED] rotate-0
[01:36:43] [PASSED] rotate-90
[01:36:43] [PASSED] rotate-180
[01:36:43] [PASSED] rotate-270
[01:36:43] ============ [PASSED] drm_test_rect_rotate_inv =============
[01:36:43] ==================== [PASSED] drm_rect =====================
[01:36:43] ============================================================
[01:36:43] Testing complete. Ran 391 tests: passed: 391
[01:36:43] Elapsed time: 21.562s total, 1.645s configuring, 19.795s building, 0.120s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


