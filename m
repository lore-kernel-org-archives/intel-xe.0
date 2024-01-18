Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BC4C47077
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 05:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944F110E157;
	Thu, 18 Jan 2024 05:53:07 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483BB10E136;
 Thu, 18 Jan 2024 05:53:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Set_PTE=5FAE_for_xe2?=
 =?utf-8?q?_dgfx_platforms_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Date: Thu, 18 Jan 2024 05:53:06 -0000
Message-ID: <170555718629.537693.5082467477748869338@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240117144851.22952-1-nirmoy.das@intel.com>
In-Reply-To: <20240117144851.22952-1-nirmoy.das@intel.com>
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

Series: drm/xe: Set PTE_AE for xe2 dgfx platforms (rev2)
URL   : https://patchwork.freedesktop.org/series/128887/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[05:52:14] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:52:18] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[05:52:41] Starting KUnit Kernel (1/1)...
[05:52:41] ============================================================
[05:52:42] ========================= guc_dbm  =========================
[05:52:42] [PASSED] test_empty
[05:52:42] [PASSED] test_default
[05:52:42] ======================== test_size  ========================
[05:52:42] [PASSED] 4
[05:52:42] [PASSED] 8
[05:52:42] [PASSED] 32
[05:52:42] [PASSED] 256
[05:52:42] ==================== [PASSED] test_size ====================
[05:52:42] ======================= test_reuse  ========================
[05:52:42] [PASSED] 4
[05:52:42] [PASSED] 8
[05:52:42] [PASSED] 32
[05:52:42] [PASSED] 256
[05:52:42] =================== [PASSED] test_reuse ====================
[05:52:42] =================== test_range_overlap  ====================
[05:52:42] [PASSED] 4
[05:52:42] [PASSED] 8
[05:52:42] [PASSED] 32
[05:52:42] [PASSED] 256
[05:52:42] =============== [PASSED] test_range_overlap ================
[05:52:42] =================== test_range_compact  ====================
[05:52:42] [PASSED] 4
[05:52:42] [PASSED] 8
[05:52:42] [PASSED] 32
[05:52:42] [PASSED] 256
[05:52:42] =============== [PASSED] test_range_compact ================
[05:52:42] ==================== test_range_spare  =====================
[05:52:42] [PASSED] 4
[05:52:42] [PASSED] 8
[05:52:42] [PASSED] 32
[05:52:42] [PASSED] 256
[05:52:42] ================ [PASSED] test_range_spare =================
[05:52:42] ===================== [PASSED] guc_dbm =====================
[05:52:42] ======================== no_relay  =========================
[05:52:42] [PASSED] xe_drops_guc2pf_if_not_ready
[05:52:42] [PASSED] xe_drops_guc2vf_if_not_ready
[05:52:42] [PASSED] xe_rejects_send_if_not_ready
[05:52:42] ==================== [PASSED] no_relay =====================
[05:52:42] ======================== pf_relay  =========================
[05:52:42] [PASSED] pf_rejects_guc2pf_too_short
[05:52:42] [PASSED] pf_rejects_guc2pf_too_long
[05:52:42] [PASSED] pf_rejects_guc2pf_no_payload
[05:52:42] [PASSED] pf_fails_no_payload
[05:52:42] [PASSED] pf_fails_bad_origin
[05:52:42] [PASSED] pf_fails_bad_type
[05:52:42] [PASSED] pf_txn_reports_error
[05:52:42] [PASSED] pf_txn_sends_pf2guc
[05:52:42] [PASSED] pf_sends_pf2guc
[05:52:42] [SKIPPED] pf_loopback_nop
[05:52:42] [SKIPPED] pf_loopback_echo
[05:52:42] [SKIPPED] pf_loopback_fail
[05:52:42] [SKIPPED] pf_loopback_busy
[05:52:42] [SKIPPED] pf_loopback_retry
[05:52:42] ==================== [PASSED] pf_relay =====================
[05:52:42] ======================== vf_relay  =========================
[05:52:42] [PASSED] vf_rejects_guc2vf_too_short
[05:52:42] [PASSED] vf_rejects_guc2vf_too_long
[05:52:42] [PASSED] vf_rejects_guc2vf_no_payload
[05:52:42] ==================== [PASSED] vf_relay =====================
[05:52:42] ========================== lmtt  ===========================
[05:52:42] ======================== test_ops  =========================
[05:52:42] [PASSED] 2-level
[05:52:42] [PASSED] multi-level
[05:52:42] ==================== [PASSED] test_ops =====================
[05:52:42] ====================== [PASSED] lmtt =======================
[05:52:42] ========================== xe_bo  ==========================
[05:52:42] [SKIPPED] xe_ccs_migrate_kunit
[05:52:42] [SKIPPED] xe_bo_evict_kunit
[05:52:42] ===================== [SKIPPED] xe_bo ======================
[05:52:42] ======================= xe_dma_buf  ========================
[05:52:42] [SKIPPED] xe_dma_buf_kunit
[05:52:42] =================== [SKIPPED] xe_dma_buf ===================
[05:52:42] ======================= xe_migrate  ========================
[05:52:42] [SKIPPED] xe_migrate_sanity_kunit
[05:52:42] =================== [SKIPPED] xe_migrate ===================
[05:52:42] ========================= xe_mocs  =========================
[05:52:42] [SKIPPED] xe_live_mocs_kernel_kunit
[05:52:42] [SKIPPED] xe_live_mocs_reset_kunit
[05:52:42] ==================== [SKIPPED] xe_mocs =====================
[05:52:42] ========================= xe_pci  ==========================
[05:52:42] [PASSED] xe_gmdid_graphics_ip
[05:52:42] [PASSED] xe_gmdid_media_ip
[05:52:42] ===================== [PASSED] xe_pci ======================
[05:52:42] ========================= xe_rtp  ==========================
[05:52:42] ================== xe_rtp_process_tests  ===================
[05:52:42] [PASSED] coalesce-same-reg
[05:52:42] [PASSED] no-match-no-add
[05:52:42] [PASSED] no-match-no-add-multiple-rules
[05:52:42] [PASSED] two-regs-two-entries
[05:52:42] [PASSED] clr-one-set-other
[05:52:42] [PASSED] set-field
[05:52:42] [PASSED] conflict-duplicate
[05:52:42] [PASSED] conflict-not-disjoint
[05:52:42] [PASSED] conflict-reg-type
[05:52:42] ============== [PASSED] xe_rtp_process_tests ===============
[05:52:42] ===================== [PASSED] xe_rtp ======================
[05:52:42] ========================== xe_wa  ==========================
[05:52:42] ======================== xe_wa_gt  =========================
[05:52:42] [PASSED] TIGERLAKE (B0)
[05:52:42] [PASSED] DG1 (A0)
[05:52:42] [PASSED] DG1 (B0)
[05:52:42] [PASSED] ALDERLAKE_S (A0)
[05:52:42] [PASSED] ALDERLAKE_S (B0)
[05:52:42] [PASSED] ALDERLAKE_S (C0)
[05:52:42] [PASSED] ALDERLAKE_S (D0)
[05:52:42] [PASSED] ALDERLAKE_P (A0)
[05:52:42] [PASSED] ALDERLAKE_P (B0)
[05:52:42] [PASSED] ALDERLAKE_P (C0)
[05:52:42] [PASSED] ALDERLAKE_S_RPLS (D0)
[05:52:42] [PASSED] ALDERLAKE_P_RPLU (E0)
[05:52:42] [PASSED] DG2_G10 (C0)
[05:52:42] [PASSED] DG2_G11 (B1)
[05:52:42] [PASSED] DG2_G12 (A1)
[05:52:42] [PASSED] PVC (B0)
[05:52:42] [PASSED] PVC (B1)
[05:52:42] [PASSED] PVC (C0)
[05:52:42] [PASSED] METEORLAKE (g:A0, m:A0)
[05:52:42] [PASSED] METEORLAKE (g:A0, m:A0)
[05:52:42] [PASSED] LUNARLAKE (g:A0, m:A0)
[05:52:42] [PASSED] LUNARLAKE (g:B0, m:A0)
[05:52:42] ==================== [PASSED] xe_wa_gt =====================
[05:52:42] ====================== [PASSED] xe_wa ======================
[05:52:42] ============================================================
[05:52:42] Testing complete. Ran 83 tests: passed: 72, skipped: 11
[05:52:42] Elapsed time: 27.557s total, 4.219s configuring, 23.118s building, 0.180s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[05:52:42] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:52:43] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[05:53:03] Starting KUnit Kernel (1/1)...
[05:53:03] ============================================================
[05:53:03] ================== drm_test_pick_cmdline  ==================
[05:53:03] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[05:53:03] =============== drm_test_pick_cmdline_named  ===============
[05:53:03] [PASSED] NTSC
[05:53:03] [PASSED] NTSC-J
[05:53:03] [PASSED] PAL
[05:53:03] [PASSED] PAL-M
[05:53:03] =========== [PASSED] drm_test_pick_cmdline_named ===========
[05:53:03] ============== [PASSED] drm_test_pick_cmdline ==============
[05:53:03] ======================== drm_buddy  ========================
[05:53:03] [PASSED] drm_test_buddy_alloc_limit
[05:53:03] [PASSED] drm_test_buddy_alloc_optimistic
[05:53:03] [PASSED] drm_test_buddy_alloc_pessimistic
[05:53:03] [PASSED] drm_test_buddy_alloc_pathological
[05:53:03] ==================== [PASSED] drm_buddy ====================
[05:53:03] =================== drm_cmdline_parser  ====================
[05:53:03] [PASSED] drm_test_cmdline_force_d_only
[05:53:03] [PASSED] drm_test_cmdline_force_D_only_dvi
[05:53:03] [PASSED] drm_test_cmdline_force_D_only_hdmi
[05:53:03] [PASSED] drm_test_cmdline_force_D_only_not_digital
[05:53:03] [PASSED] drm_test_cmdline_force_e_only
[05:53:03] [PASSED] drm_test_cmdline_res
[05:53:03] [PASSED] drm_test_cmdline_res_vesa
[05:53:03] [PASSED] drm_test_cmdline_res_vesa_rblank
[05:53:03] [PASSED] drm_test_cmdline_res_rblank
[05:53:03] [PASSED] drm_test_cmdline_res_bpp
[05:53:03] [PASSED] drm_test_cmdline_res_refresh
[05:53:03] [PASSED] drm_test_cmdline_res_bpp_refresh
[05:53:03] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[05:53:03] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[05:53:03] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[05:53:03] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[05:53:03] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[05:53:03] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[05:53:03] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[05:53:03] [PASSED] drm_test_cmdline_res_margins_force_on
[05:53:03] [PASSED] drm_test_cmdline_res_vesa_margins
[05:53:03] [PASSED] drm_test_cmdline_name
[05:53:03] [PASSED] drm_test_cmdline_name_bpp
[05:53:03] [PASSED] drm_test_cmdline_name_option
[05:53:03] [PASSED] drm_test_cmdline_name_bpp_option
[05:53:03] [PASSED] drm_test_cmdline_rotate_0
[05:53:03] [PASSED] drm_test_cmdline_rotate_90
[05:53:03] [PASSED] drm_test_cmdline_rotate_180
[05:53:03] [PASSED] drm_test_cmdline_rotate_270
[05:53:03] [PASSED] drm_test_cmdline_hmirror
[05:53:03] [PASSED] drm_test_cmdline_vmirror
[05:53:03] [PASSED] drm_test_cmdline_margin_options
[05:53:03] [PASSED] drm_test_cmdline_multiple_options
[05:53:03] [PASSED] drm_test_cmdline_bpp_extra_and_option
[05:53:03] [PASSED] drm_test_cmdline_extra_and_option
[05:53:03] [PASSED] drm_test_cmdline_freestanding_options
[05:53:03] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[05:53:03] [PASSED] drm_test_cmdline_panel_orientation
[05:53:03] ================ drm_test_cmdline_invalid  =================
[05:53:03] [PASSED] margin_only
[05:53:03] [PASSED] interlace_only
[05:53:03] [PASSED] res_missing_x
[05:53:03] [PASSED] res_missing_y
[05:53:03] [PASSED] res_bad_y
[05:53:03] [PASSED] res_missing_y_bpp
[05:53:03] [PASSED] res_bad_bpp
[05:53:03] [PASSED] res_bad_refresh
[05:53:03] [PASSED] res_bpp_refresh_force_on_off
[05:53:03] [PASSED] res_invalid_mode
[05:53:03] [PASSED] res_bpp_wrong_place_mode
[05:53:03] [PASSED] name_bpp_refresh
[05:53:03] [PASSED] name_refresh
[05:53:03] [PASSED] name_refresh_wrong_mode
[05:53:03] [PASSED] name_refresh_invalid_mode
[05:53:03] [PASSED] rotate_multiple
[05:53:03] [PASSED] rotate_invalid_val
[05:53:03] [PASSED] rotate_truncated
[05:53:03] [PASSED] invalid_option
[05:53:03] [PASSED] invalid_tv_option
[05:53:03] [PASSED] truncated_tv_option
[05:53:03] ============ [PASSED] drm_test_cmdline_invalid =============
[05:53:03] =============== drm_test_cmdline_tv_options  ===============
[05:53:03] [PASSED] NTSC
[05:53:03] [PASSED] NTSC_443
[05:53:03] [PASSED] NTSC_J
[05:53:03] [PASSED] PAL
[05:53:03] [PASSED] PAL_M
[05:53:03] [PASSED] PAL_N
[05:53:03] [PASSED] SECAM
[05:53:03] =========== [PASSED] drm_test_cmdline_tv_options ===========
[05:53:03] =============== [PASSED] drm_cmdline_parser ================
[05:53:03] ================ drm_get_tv_mode_from_name  ================
[05:53:03] ========== drm_test_get_tv_mode_from_name_valid  ===========
[05:53:03] [PASSED] NTSC
[05:53:03] [PASSED] NTSC-443
[05:53:03] [PASSED] NTSC-J
[05:53:03] [PASSED] PAL
[05:53:03] [PASSED] PAL-M
[05:53:03] [PASSED] PAL-N
[05:53:03] [PASSED] SECAM
[05:53:03] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[05:53:03] [PASSED] drm_test_get_tv_mode_from_name_truncated
[05:53:03] ============ [PASSED] drm_get_tv_mode_from_name ============
[05:53:03] ==================== drm_damage_helper  ====================
[05:53:03] [PASSED] drm_test_damage_iter_no_damage
[05:53:03] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[05:53:03] [PASSED] drm_test_damage_iter_no_damage_src_moved
[05:53:03] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[05:53:03] [PASSED] drm_test_damage_iter_no_damage_not_visible
[05:53:03] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[05:53:03] [PASSED] drm_test_damage_iter_no_damage_no_fb
[05:53:03] [PASSED] drm_test_damage_iter_simple_damage
[05:53:03] [PASSED] drm_test_damage_iter_single_damage
[05:53:03] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[05:53:03] [PASSED] drm_test_damage_iter_single_damage_outside_src
[05:53:03] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[05:53:03] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[05:53:03] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[05:53:03] [PASSED] drm_test_damage_iter_single_damage_src_moved
[05:53:03] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[05:53:03] [PASSED] drm_test_damage_iter_damage
[05:53:03] [PASSED] drm_test_damage_iter_damage_one_intersect
[05:53:03] [PASSED] drm_test_damage_iter_damage_one_outside
[05:53:03] [PASSED] drm_test_damage_iter_damage_src_moved
[05:53:03] [PASSED] drm_test_damage_iter_damage_not_visible
[05:53:03] ================ [PASSED] drm_damage_helper ================
[05:53:03] ==================== drm_dp_mst_helper  ====================
[05:53:03] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[05:53:03] [PASSED] Clock 154000 BPP 30 DSC disabled
[05:53:03] [PASSED] Clock 234000 BPP 30 DSC disabled
[05:53:03] [PASSED] Clock 297000 BPP 24 DSC disabled
[05:53:03] [PASSED] Clock 332880 BPP 24 DSC enabled
[05:53:03] [PASSED] Clock 324540 BPP 24 DSC enabled
[05:53:03] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[05:53:03] ============== drm_test_dp_mst_calc_pbn_div  ===============
[05:53:03] [PASSED] Link rate 2000000 lane count 4
[05:53:03] [PASSED] Link rate 2000000 lane count 2
[05:53:03] [PASSED] Link rate 2000000 lane count 1
[05:53:03] [PASSED] Link rate 1350000 lane count 4
[05:53:03] [PASSED] Link rate 1350000 lane count 2
[05:53:03] [PASSED] Link rate 1350000 lane count 1
[05:53:03] [PASSED] Link rate 1000000 lane count 4
[05:53:03] [PASSED] Link rate 1000000 lane count 2
[05:53:03] [PASSED] Link rate 1000000 lane count 1
[05:53:03] [PASSED] Link rate 810000 lane count 4
[05:53:03] [PASSED] Link rate 810000 lane count 2
[05:53:03] [PASSED] Link rate 810000 lane count 1
[05:53:03] [PASSED] Link rate 540000 lane count 4
[05:53:03] [PASSED] Link rate 540000 lane count 2
[05:53:03] [PASSED] Link rate 540000 lane count 1
[05:53:03] [PASSED] Link rate 270000 lane count 4
[05:53:03] [PASSED] Link rate 270000 lane count 2
[05:53:03] [PASSED] Link rate 270000 lane count 1
[05:53:03] [PASSED] Link rate 162000 lane count 4
[05:53:03] [PASSED] Link rate 162000 lane count 2
[05:53:03] [PASSED] Link rate 162000 lane count 1
[05:53:03] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[05:53:03] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[05:53:03] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[05:53:03] [PASSED] DP_POWER_UP_PHY with port number
[05:53:03] [PASSED] DP_POWER_DOWN_PHY with port number
[05:53:03] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[05:53:03] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[05:53:03] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[05:53:03] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[05:53:03] [PASSED] DP_QUERY_PAYLOAD with port number
[05:53:03] [PASSED] DP_QUERY_PAYLOAD with VCPI
[05:53:03] [PASSED] DP_REMOTE_DPCD_READ with port number
[05:53:03] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[05:53:03] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[05:53:03] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[05:53:03] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[05:53:03] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[05:53:03] [PASSED] DP_REMOTE_I2C_READ with port number
[05:53:03] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[05:53:03] [PASSED] DP_REMOTE_I2C_READ with transactions array
[05:53:03] [PASSED] DP_REMOTE_I2C_WRITE with port number
[05:53:03] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[05:53:03] [PASSED] DP_REMOTE_I2C_WRITE with data array
[05:53:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[05:53:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[05:53:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[05:53:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[05:53:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[05:53:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[05:53:03] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[05:53:03] ================ [PASSED] drm_dp_mst_helper ================
[05:53:03] ======================== drm_exec  =========================
[05:53:03] [PASSED] sanitycheck
[05:53:03] [PASSED] test_lock
[05:53:03] [PASSED] test_lock_unlock
[05:53:03] [PASSED] test_duplicates
[05:53:03] [PASSED] test_prepare
[05:53:03] [PASSED] test_prepare_array
[05:53:03] [PASSED] test_multiple_loops
[05:53:03] ==================== [PASSED] drm_exec =====================
[05:53:03] ================= drm_format_helper_test  ==================
[05:53:03] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[05:53:03] [PASSED] single_pixel_source_buffer
[05:53:03] [PASSED] single_pixel_clip_rectangle
[05:53:03] [PASSED] well_known_colors
[05:53:03] [PASSED] destination_pitch
[05:53:03] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[05:53:03] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[05:53:03] [PASSED] single_pixel_source_buffer
[05:53:03] [PASSED] single_pixel_clip_rectangle
[05:53:03] [PASSED] well_known_colors
[05:53:03] [PASSED] destination_pitch
[05:53:03] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[05:53:03] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[05:53:03] [PASSED] single_pixel_source_buffer
[05:53:03] [PASSED] single_pixel_clip_rectangle
[05:53:03] [PASSED] well_known_colors
[05:53:03] [PASSED] destination_pitch
[05:53:03] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[05:53:03] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[05:53:03] [PASSED] single_pixel_source_buffer
[05:53:03] [PASSED] single_pixel_clip_rectangle
[05:53:03] [PASSED] well_known_colors
[05:53:03] [PASSED] destination_pitch
[05:53:03] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[05:53:03] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[05:53:03] [PASSED] single_pixel_source_buffer
[05:53:03] [PASSED] single_pixel_clip_rectangle
[05:53:03] [PASSED] well_known_colors
[05:53:03] [PASSED] destination_pitch
[05:53:03] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[05:53:03] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[05:53:03] [PASSED] single_pixel_source_buffer
[05:53:03] [PASSED] single_pixel_clip_rectangle
[05:53:03] [PASSED] well_known_colors
[05:53:03] [PASSED] destination_pitch
[05:53:03] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[05:53:03] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[05:53:03] [PASSED] single_pixel_source_buffer
[05:53:03] [PASSED] single_pixel_clip_rectangle
[05:53:03] [PASSED] well_known_colors
[05:53:03] [PASSED] destination_pitch
[05:53:03] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[05:53:03] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[05:53:03] [PASSED] single_pixel_source_buffer
[05:53:03] [PASSED] single_pixel_clip_rectangle
[05:53:03] [PASSED] well_known_colors
[05:53:03] [PASSED] destination_pitch
[05:53:03] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[05:53:03] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[05:53:03] [PASSED] single_pixel_source_buffer
[05:53:03] [PASSED] single_pixel_clip_rectangle
[05:53:03] [PASSED] well_known_colors
[05:53:03] [PASSED] destination_pitch
[05:53:03] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[05:53:03] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[05:53:03] [PASSED] single_pixel_source_buffer
[05:53:03] [PASSED] single_pixel_clip_rectangle
[05:53:03] [PASSED] well_known_colors
[05:53:03] [PASSED] destination_pitch
[05:53:03] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[05:53:03] ============== drm_test_fb_xrgb8888_to_mono  ===============
[05:53:03] [PASSED] single_pixel_source_buffer
[05:53:03] [PASSED] single_pixel_clip_rectangle
[05:53:03] [PASSED] well_known_colors
[05:53:03] [PASSED] destination_pitch
[05:53:03] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[05:53:03] ==================== drm_test_fb_swab  =====================
[05:53:03] [PASSED] single_pixel_source_buffer
[05:53:03] [PASSED] single_pixel_clip_rectangle
[05:53:03] [PASSED] well_known_colors
[05:53:03] [PASSED] destination_pitch
[05:53:03] ================ [PASSED] drm_test_fb_swab =================
[05:53:03] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[05:53:03] [PASSED] single_pixel_source_buffer
[05:53:03] [PASSED] single_pixel_clip_rectangle
[05:53:03] [PASSED] well_known_colors
[05:53:03] [PASSED] destination_pitch
[05:53:03] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[05:53:03] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[05:53:03] [PASSED] single_pixel_source_buffer
[05:53:03] [PASSED] single_pixel_clip_rectangle
[05:53:03] [PASSED] well_known_colors
[05:53:03] [PASSED] destination_pitch
[05:53:03] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[05:53:03] ================= drm_test_fb_clip_offset  =================
[05:53:03] [PASSED] pass through
[05:53:03] [PASSED] horizontal offset
[05:53:03] [PASSED] vertical offset
[05:53:03] [PASSED] horizontal and vertical offset
[05:53:03] [PASSED] horizontal offset (custom pitch)
[05:53:03] [PASSED] vertical offset (custom pitch)
[05:53:03] [PASSED] horizontal and vertical offset (custom pitch)
[05:53:03] ============= [PASSED] drm_test_fb_clip_offset =============
[05:53:03] ============== drm_test_fb_build_fourcc_list  ==============
[05:53:03] [PASSED] no native formats
[05:53:03] [PASSED] XRGB8888 as native format
[05:53:03] [PASSED] remove duplicates
[05:53:03] [PASSED] convert alpha formats
[05:53:03] [PASSED] random formats
[05:53:03] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[05:53:03] =================== drm_test_fb_memcpy  ====================
[05:53:03] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[05:53:03] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[05:53:03] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[05:53:03] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[05:53:03] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[05:53:03] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[05:53:03] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[05:53:03] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[05:53:03] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[05:53:03] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[05:53:03] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[05:53:03] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[05:53:03] =============== [PASSED] drm_test_fb_memcpy ================
[05:53:03] ============= [PASSED] drm_format_helper_test ==============
[05:53:03] ======================= drm_format  ========================
[05:53:03] [PASSED] drm_test_format_block_width_invalid
[05:53:03] [PASSED] drm_test_format_block_width_one_plane
[05:53:03] [PASSED] drm_test_format_block_width_two_plane
[05:53:03] [PASSED] drm_test_format_block_width_three_plane
[05:53:03] [PASSED] drm_test_format_block_width_tiled
[05:53:03] [PASSED] drm_test_format_block_height_invalid
[05:53:03] [PASSED] drm_test_format_block_height_one_plane
[05:53:03] [PASSED] drm_test_format_block_height_two_plane
[05:53:03] [PASSED] drm_test_format_block_height_three_plane
[05:53:03] [PASSED] drm_test_format_block_height_tiled
[05:53:03] [PASSED] drm_test_format_min_pitch_invalid
[05:53:03] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[05:53:03] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[05:53:03] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[05:53:03] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[05:53:03] [PASSED] drm_test_format_min_pitch_two_plane
[05:53:03] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[05:53:03] [PASSED] drm_test_format_min_pitch_tiled
[05:53:03] =================== [PASSED] drm_format ====================
[05:53:03] ===================== drm_framebuffer  =====================
[05:53:03] =============== drm_test_framebuffer_create  ===============
[05:53:03] [PASSED] ABGR8888 normal sizes
[05:53:03] [PASSED] ABGR8888 max sizes
[05:53:03] [PASSED] ABGR8888 pitch greater than min required
[05:53:03] [PASSED] ABGR8888 pitch less than min required
[05:53:03] [PASSED] ABGR8888 Invalid width
[05:53:03] [PASSED] ABGR8888 Invalid buffer handle
[05:53:03] [PASSED] No pixel format
[05:53:03] [PASSED] ABGR8888 Width 0
[05:53:03] [PASSED] ABGR8888 Height 0
[05:53:03] [PASSED] ABGR8888 Out of bound height * pitch combination
[05:53:03] [PASSED] ABGR8888 Large buffer offset
[05:53:03] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[05:53:03] [PASSED] ABGR8888 Valid buffer modifier
[05:53:03] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[05:53:03] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[05:53:03] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[05:53:03] [PASSED] NV12 Normal sizes
[05:53:03] [PASSED] NV12 Max sizes
[05:53:03] [PASSED] NV12 Invalid pitch
[05:53:03] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[05:53:03] [PASSED] NV12 different  modifier per-plane
[05:53:03] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[05:53:03] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[05:53:03] [PASSED] NV12 Modifier for inexistent plane
[05:53:03] [PASSED] NV12 Handle for inexistent plane
[05:53:03] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[05:53:03] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[05:53:03] [PASSED] YVU420 Normal sizes
[05:53:03] [PASSED] YVU420 Max sizes
[05:53:03] [PASSED] YVU420 Invalid pitch
[05:53:03] [PASSED] YVU420 Different pitches
[05:53:03] [PASSED] YVU420 Different buffer offsets/pitches
[05:53:03] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[05:53:03] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[05:53:03] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[05:53:03] [PASSED] YVU420 Valid modifier
[05:53:03] [PASSED] YVU420 Different modifiers per plane
[05:53:03] [PASSED] YVU420 Modifier for inexistent plane
[05:53:03] [PASSED] X0L2 Normal sizes
[05:53:03] [PASSED] X0L2 Max sizes
[05:53:03] [PASSED] X0L2 Invalid pitch
[05:53:03] [PASSED] X0L2 Pitch greater than minimum required
[05:53:03] [PASSED] X0L2 Handle for inexistent plane
[05:53:03] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[05:53:03] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[05:53:03] [PASSED] X0L2 Valid modifier
[05:53:03] [PASSED] X0L2 Modifier for inexistent plane
[05:53:03] =========== [PASSED] drm_test_framebuffer_create ===========
[05:53:03] ================= [PASSED] drm_framebuffer =================
[05:53:03] ====================== drm_gem_shmem  ======================
[05:53:03] [PASSED] drm_gem_shmem_test_obj_create
[05:53:03] [PASSED] drm_gem_shmem_test_obj_create_private
[05:53:03] [PASSED] drm_gem_shmem_test_pin_pages
[05:53:03] [PASSED] drm_gem_shmem_test_vmap
[05:53:03] [PASSED] drm_gem_shmem_test_get_pages_sgt
[05:53:03] [PASSED] drm_gem_shmem_test_get_sg_table
[05:53:03] [PASSED] drm_gem_shmem_test_madvise
[05:53:03] [PASSED] drm_gem_shmem_test_purge
[05:53:03] ================== [PASSED] drm_gem_shmem ==================
[05:53:03] ======================= drm_managed  =======================
[05:53:03] [PASSED] drm_test_managed_release_action
[05:53:03] [PASSED] drm_test_managed_run_action
[05:53:03] =================== [PASSED] drm_managed ===================
[05:53:03] ========================= drm_mm  ==========================
[05:53:03] [PASSED] drm_test_mm_init
[05:53:03] [PASSED] drm_test_mm_debug
[05:53:03] [PASSED] drm_test_mm_align32
[05:53:03] [PASSED] drm_test_mm_align64
[05:53:03] [PASSED] drm_test_mm_lowest
[05:53:03] [PASSED] drm_test_mm_highest
[05:53:03] ===================== [PASSED] drm_mm ======================
[05:53:03] =================== drm_modes_analog_tv  ===================
[05:53:03] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[05:53:03] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[05:53:03] [PASSED] drm_test_modes_analog_tv_pal_576i
[05:53:03] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[05:53:03] =============== [PASSED] drm_modes_analog_tv ===============
[05:53:03] ==================== drm_plane_helper  =====================
[05:53:03] =============== drm_test_check_plane_state  ================
[05:53:03] [PASSED] clipping_simple
[05:53:03] [PASSED] clipping_rotate_reflect
[05:53:03] [PASSED] positioning_simple
[05:53:03] [PASSED] upscaling
[05:53:03] [PASSED] downscaling
[05:53:03] [PASSED] rounding1
[05:53:03] [PASSED] rounding2
[05:53:03] [PASSED] rounding3
[05:53:03] [PASSED] rounding4
[05:53:03] =========== [PASSED] drm_test_check_plane_state ============
[05:53:03] =========== drm_test_check_invalid_plane_state  ============
[05:53:03] [PASSED] positioning_invalid
[05:53:03] [PASSED] upscaling_invalid
[05:53:03] [PASSED] downscaling_invalid
[05:53:03] ======= [PASSED] drm_test_check_invalid_plane_state ========
[05:53:03] ================ [PASSED] drm_plane_helper =================
[05:53:03] ============ drm_connector_helper_tv_get_modes  ============
[05:53:03] ====== drm_test_connector_helper_tv_get_modes_check  =======
[05:53:03] [PASSED] None
[05:53:03] [PASSED] PAL
[05:53:03] [PASSED] NTSC
[05:53:03] [PASSED] Both, NTSC Default
[05:53:03] [PASSED] Both, PAL Default
[05:53:03] [PASSED] Both, NTSC Default, with PAL on command-line
[05:53:03] [PASSED] Both, PAL Default, with NTSC on command-line
[05:53:03] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[05:53:03] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[05:53:03] ======================== drm_rect  =========================
[05:53:03] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[05:53:03] [PASSED] drm_test_rect_clip_scaled_not_clipped
[05:53:03] [PASSED] drm_test_rect_clip_scaled_clipped
[05:53:03] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[05:53:03] ================= drm_test_rect_intersect  =================
[05:53:03] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
stty: 'standard input': Inappropriate ioctl for device
[05:53:03] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[05:53:03] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[05:53:03] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[05:53:03] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[05:53:03] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[05:53:03] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[05:53:03] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[05:53:03] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[05:53:03] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[05:53:03] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[05:53:03] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[05:53:03] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[05:53:03] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[05:53:03] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[05:53:03] ============= [PASSED] drm_test_rect_intersect =============
[05:53:03] ================ drm_test_rect_calc_hscale  ================
[05:53:03] [PASSED] normal use
[05:53:03] [PASSED] out of max range
[05:53:03] [PASSED] out of min range
[05:53:03] [PASSED] zero dst
[05:53:03] [PASSED] negative src
[05:53:03] [PASSED] negative dst
[05:53:03] ============ [PASSED] drm_test_rect_calc_hscale ============
[05:53:03] ================ drm_test_rect_calc_vscale  ================
[05:53:03] [PASSED] normal use
[05:53:03] [PASSED] out of max range
[05:53:03] [PASSED] out of min range
[05:53:03] [PASSED] zero dst
[05:53:03] [PASSED] negative src
[05:53:03] [PASSED] negative dst
[05:53:03] ============ [PASSED] drm_test_rect_calc_vscale ============
[05:53:03] ================== drm_test_rect_rotate  ===================
[05:53:03] [PASSED] reflect-x
[05:53:03] [PASSED] reflect-y
[05:53:03] [PASSED] rotate-0
[05:53:03] [PASSED] rotate-90
[05:53:03] [PASSED] rotate-180
[05:53:03] [PASSED] rotate-270
[05:53:03] ============== [PASSED] drm_test_rect_rotate ===============
[05:53:03] ================ drm_test_rect_rotate_inv  =================
[05:53:03] [PASSED] reflect-x
[05:53:03] [PASSED] reflect-y
[05:53:03] [PASSED] rotate-0
[05:53:03] [PASSED] rotate-90
[05:53:03] [PASSED] rotate-180
[05:53:03] [PASSED] rotate-270
[05:53:03] ============ [PASSED] drm_test_rect_rotate_inv =============
[05:53:03] ==================== [PASSED] drm_rect =====================
[05:53:03] ============================================================
[05:53:03] Testing complete. Ran 391 tests: passed: 391
[05:53:03] Elapsed time: 21.794s total, 1.670s configuring, 20.002s building, 0.120s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


