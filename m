Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF08C3DA6E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 23:03:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7059F10E333;
	Mon,  8 Jan 2024 23:03:03 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A92310E332;
 Mon,  8 Jan 2024 23:03:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Check_skip=5Fguc=5Fp?=
 =?utf-8?q?c_before_setting_SLPC_flag_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Date: Mon, 08 Jan 2024 23:03:02 -0000
Message-ID: <170475498224.197000.2602638012356241805@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240108225842.966066-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240108225842.966066-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe: Check skip_guc_pc before setting SLPC flag (rev4)
URL   : https://patchwork.freedesktop.org/series/128001/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[23:02:10] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:02:15] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[23:02:38] Starting KUnit Kernel (1/1)...
[23:02:38] ============================================================
[23:02:38] ========================= guc_dbm  =========================
[23:02:38] [PASSED] test_empty
[23:02:38] [PASSED] test_default
[23:02:38] ======================== test_size  ========================
[23:02:38] [PASSED] 4
[23:02:38] [PASSED] 8
[23:02:38] [PASSED] 32
[23:02:38] [PASSED] 256
[23:02:38] ==================== [PASSED] test_size ====================
[23:02:38] ======================= test_reuse  ========================
[23:02:38] [PASSED] 4
[23:02:38] [PASSED] 8
[23:02:38] [PASSED] 32
[23:02:38] [PASSED] 256
[23:02:38] =================== [PASSED] test_reuse ====================
[23:02:38] =================== test_range_overlap  ====================
[23:02:38] [PASSED] 4
[23:02:38] [PASSED] 8
[23:02:38] [PASSED] 32
[23:02:38] [PASSED] 256
[23:02:38] =============== [PASSED] test_range_overlap ================
[23:02:38] =================== test_range_compact  ====================
[23:02:38] [PASSED] 4
[23:02:38] [PASSED] 8
[23:02:38] [PASSED] 32
[23:02:38] [PASSED] 256
[23:02:38] =============== [PASSED] test_range_compact ================
[23:02:38] ==================== test_range_spare  =====================
[23:02:38] [PASSED] 4
[23:02:38] [PASSED] 8
[23:02:38] [PASSED] 32
[23:02:38] [PASSED] 256
[23:02:38] ================ [PASSED] test_range_spare =================
[23:02:38] ===================== [PASSED] guc_dbm =====================
[23:02:38] ======================== no_relay  =========================
[23:02:38] [PASSED] xe_drops_guc2pf_if_not_ready
[23:02:38] [PASSED] xe_drops_guc2vf_if_not_ready
[23:02:38] [PASSED] xe_rejects_send_if_not_ready
[23:02:38] ==================== [PASSED] no_relay =====================
[23:02:38] ======================== pf_relay  =========================
[23:02:38] [PASSED] pf_rejects_guc2pf_too_short
[23:02:38] [PASSED] pf_rejects_guc2pf_too_long
[23:02:38] [PASSED] pf_rejects_guc2pf_no_payload
[23:02:38] [PASSED] pf_fails_no_payload
[23:02:38] [PASSED] pf_fails_bad_origin
[23:02:38] [PASSED] pf_fails_bad_type
[23:02:38] [PASSED] pf_txn_reports_error
[23:02:38] [PASSED] pf_txn_sends_pf2guc
[23:02:38] [PASSED] pf_sends_pf2guc
[23:02:38] [SKIPPED] pf_loopback_nop
[23:02:38] [SKIPPED] pf_loopback_echo
[23:02:38] [SKIPPED] pf_loopback_fail
[23:02:38] [SKIPPED] pf_loopback_busy
[23:02:38] [SKIPPED] pf_loopback_retry
[23:02:38] ==================== [PASSED] pf_relay =====================
[23:02:38] ======================== vf_relay  =========================
[23:02:38] [PASSED] vf_rejects_guc2vf_too_short
[23:02:38] [PASSED] vf_rejects_guc2vf_too_long
[23:02:38] [PASSED] vf_rejects_guc2vf_no_payload
[23:02:38] ==================== [PASSED] vf_relay =====================
[23:02:38] ========================== lmtt  ===========================
[23:02:38] ======================== test_ops  =========================
[23:02:38] [PASSED] 2-level
[23:02:38] [PASSED] multi-level
[23:02:38] ==================== [PASSED] test_ops =====================
[23:02:38] ====================== [PASSED] lmtt =======================
[23:02:38] ========================== xe_bo  ==========================
[23:02:38] [SKIPPED] xe_ccs_migrate_kunit
[23:02:38] [SKIPPED] xe_bo_evict_kunit
[23:02:38] ===================== [SKIPPED] xe_bo ======================
[23:02:38] ======================= xe_dma_buf  ========================
[23:02:38] [SKIPPED] xe_dma_buf_kunit
[23:02:38] =================== [SKIPPED] xe_dma_buf ===================
[23:02:38] ======================= xe_migrate  ========================
[23:02:38] [SKIPPED] xe_migrate_sanity_kunit
[23:02:38] =================== [SKIPPED] xe_migrate ===================
[23:02:38] ========================= xe_mocs  =========================
[23:02:38] [SKIPPED] xe_live_mocs_kernel_kunit
[23:02:38] [SKIPPED] xe_live_mocs_reset_kunit
[23:02:38] ==================== [SKIPPED] xe_mocs =====================
[23:02:38] ========================= xe_pci  ==========================
[23:02:38] [PASSED] xe_gmdid_graphics_ip
[23:02:38] [PASSED] xe_gmdid_media_ip
[23:02:38] ===================== [PASSED] xe_pci ======================
[23:02:38] ========================= xe_rtp  ==========================
[23:02:38] ================== xe_rtp_process_tests  ===================
[23:02:38] [PASSED] coalesce-same-reg
[23:02:38] [PASSED] no-match-no-add
[23:02:38] [PASSED] no-match-no-add-multiple-rules
[23:02:38] [PASSED] two-regs-two-entries
[23:02:38] [PASSED] clr-one-set-other
[23:02:38] [PASSED] set-field
[23:02:38] [PASSED] conflict-duplicate
[23:02:38] [PASSED] conflict-not-disjoint
[23:02:38] [PASSED] conflict-reg-type
[23:02:38] ============== [PASSED] xe_rtp_process_tests ===============
[23:02:38] ===================== [PASSED] xe_rtp ======================
[23:02:38] ========================== xe_wa  ==========================
[23:02:38] ======================== xe_wa_gt  =========================
[23:02:38] [PASSED] TIGERLAKE (B0)
[23:02:38] [PASSED] DG1 (A0)
[23:02:38] [PASSED] DG1 (B0)
[23:02:38] [PASSED] ALDERLAKE_S (A0)
[23:02:38] [PASSED] ALDERLAKE_S (B0)
[23:02:38] [PASSED] ALDERLAKE_S (C0)
[23:02:38] [PASSED] ALDERLAKE_S (D0)
[23:02:38] [PASSED] ALDERLAKE_P (A0)
[23:02:38] [PASSED] ALDERLAKE_P (B0)
[23:02:38] [PASSED] ALDERLAKE_P (C0)
[23:02:38] [PASSED] ALDERLAKE_S_RPLS (D0)
[23:02:38] [PASSED] ALDERLAKE_P_RPLU (E0)
[23:02:38] [PASSED] DG2_G10 (C0)
[23:02:38] [PASSED] DG2_G11 (B1)
[23:02:38] [PASSED] DG2_G12 (A1)
[23:02:38] [PASSED] PVC (B0)
[23:02:38] [PASSED] PVC (B1)
[23:02:38] [PASSED] PVC (C0)
[23:02:38] [PASSED] METEORLAKE (g:A0, m:A0)
[23:02:38] [PASSED] METEORLAKE (g:A0, m:A0)
[23:02:38] [PASSED] LUNARLAKE (g:A0, m:A0)
[23:02:38] [PASSED] LUNARLAKE (g:B0, m:A0)
[23:02:38] ==================== [PASSED] xe_wa_gt =====================
[23:02:38] ====================== [PASSED] xe_wa ======================
[23:02:38] ============================================================
[23:02:38] Testing complete. Ran 83 tests: passed: 72, skipped: 11
[23:02:38] Elapsed time: 27.487s total, 4.212s configuring, 23.055s building, 0.182s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[23:02:38] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:02:40] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[23:03:00] Starting KUnit Kernel (1/1)...
[23:03:00] ============================================================
[23:03:00] ================== drm_test_pick_cmdline  ==================
[23:03:00] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[23:03:00] =============== drm_test_pick_cmdline_named  ===============
[23:03:00] [PASSED] NTSC
[23:03:00] [PASSED] NTSC-J
[23:03:00] [PASSED] PAL
[23:03:00] [PASSED] PAL-M
[23:03:00] =========== [PASSED] drm_test_pick_cmdline_named ===========
[23:03:00] ============== [PASSED] drm_test_pick_cmdline ==============
[23:03:00] ======================== drm_buddy  ========================
[23:03:00] [PASSED] drm_test_buddy_alloc_limit
[23:03:00] [PASSED] drm_test_buddy_alloc_optimistic
[23:03:00] [PASSED] drm_test_buddy_alloc_pessimistic
[23:03:00] [PASSED] drm_test_buddy_alloc_pathological
[23:03:00] ==================== [PASSED] drm_buddy ====================
[23:03:00] =================== drm_cmdline_parser  ====================
[23:03:00] [PASSED] drm_test_cmdline_force_d_only
[23:03:00] [PASSED] drm_test_cmdline_force_D_only_dvi
[23:03:00] [PASSED] drm_test_cmdline_force_D_only_hdmi
[23:03:00] [PASSED] drm_test_cmdline_force_D_only_not_digital
[23:03:00] [PASSED] drm_test_cmdline_force_e_only
[23:03:00] [PASSED] drm_test_cmdline_res
[23:03:00] [PASSED] drm_test_cmdline_res_vesa
[23:03:00] [PASSED] drm_test_cmdline_res_vesa_rblank
[23:03:00] [PASSED] drm_test_cmdline_res_rblank
[23:03:00] [PASSED] drm_test_cmdline_res_bpp
[23:03:00] [PASSED] drm_test_cmdline_res_refresh
[23:03:00] [PASSED] drm_test_cmdline_res_bpp_refresh
[23:03:00] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[23:03:00] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[23:03:00] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[23:03:00] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[23:03:00] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[23:03:00] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[23:03:00] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[23:03:00] [PASSED] drm_test_cmdline_res_margins_force_on
[23:03:00] [PASSED] drm_test_cmdline_res_vesa_margins
[23:03:00] [PASSED] drm_test_cmdline_name
[23:03:00] [PASSED] drm_test_cmdline_name_bpp
[23:03:00] [PASSED] drm_test_cmdline_name_option
[23:03:00] [PASSED] drm_test_cmdline_name_bpp_option
[23:03:00] [PASSED] drm_test_cmdline_rotate_0
[23:03:00] [PASSED] drm_test_cmdline_rotate_90
[23:03:00] [PASSED] drm_test_cmdline_rotate_180
[23:03:00] [PASSED] drm_test_cmdline_rotate_270
[23:03:00] [PASSED] drm_test_cmdline_hmirror
[23:03:00] [PASSED] drm_test_cmdline_vmirror
[23:03:00] [PASSED] drm_test_cmdline_margin_options
[23:03:00] [PASSED] drm_test_cmdline_multiple_options
[23:03:00] [PASSED] drm_test_cmdline_bpp_extra_and_option
[23:03:00] [PASSED] drm_test_cmdline_extra_and_option
[23:03:00] [PASSED] drm_test_cmdline_freestanding_options
[23:03:00] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[23:03:00] [PASSED] drm_test_cmdline_panel_orientation
[23:03:00] ================ drm_test_cmdline_invalid  =================
[23:03:00] [PASSED] margin_only
[23:03:00] [PASSED] interlace_only
[23:03:00] [PASSED] res_missing_x
[23:03:00] [PASSED] res_missing_y
[23:03:00] [PASSED] res_bad_y
[23:03:00] [PASSED] res_missing_y_bpp
[23:03:00] [PASSED] res_bad_bpp
[23:03:00] [PASSED] res_bad_refresh
[23:03:00] [PASSED] res_bpp_refresh_force_on_off
[23:03:00] [PASSED] res_invalid_mode
[23:03:00] [PASSED] res_bpp_wrong_place_mode
[23:03:00] [PASSED] name_bpp_refresh
[23:03:00] [PASSED] name_refresh
[23:03:00] [PASSED] name_refresh_wrong_mode
[23:03:00] [PASSED] name_refresh_invalid_mode
[23:03:00] [PASSED] rotate_multiple
[23:03:00] [PASSED] rotate_invalid_val
[23:03:00] [PASSED] rotate_truncated
[23:03:00] [PASSED] invalid_option
[23:03:00] [PASSED] invalid_tv_option
[23:03:00] [PASSED] truncated_tv_option
[23:03:00] ============ [PASSED] drm_test_cmdline_invalid =============
[23:03:00] =============== drm_test_cmdline_tv_options  ===============
[23:03:00] [PASSED] NTSC
[23:03:00] [PASSED] NTSC_443
[23:03:00] [PASSED] NTSC_J
[23:03:00] [PASSED] PAL
[23:03:00] [PASSED] PAL_M
[23:03:00] [PASSED] PAL_N
[23:03:00] [PASSED] SECAM
[23:03:00] =========== [PASSED] drm_test_cmdline_tv_options ===========
[23:03:00] =============== [PASSED] drm_cmdline_parser ================
[23:03:00] ================ drm_get_tv_mode_from_name  ================
[23:03:00] ========== drm_test_get_tv_mode_from_name_valid  ===========
[23:03:00] [PASSED] NTSC
[23:03:00] [PASSED] NTSC-443
[23:03:00] [PASSED] NTSC-J
[23:03:00] [PASSED] PAL
[23:03:00] [PASSED] PAL-M
[23:03:00] [PASSED] PAL-N
[23:03:00] [PASSED] SECAM
[23:03:00] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[23:03:00] [PASSED] drm_test_get_tv_mode_from_name_truncated
[23:03:00] ============ [PASSED] drm_get_tv_mode_from_name ============
[23:03:00] ==================== drm_damage_helper  ====================
[23:03:00] [PASSED] drm_test_damage_iter_no_damage
[23:03:00] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[23:03:00] [PASSED] drm_test_damage_iter_no_damage_src_moved
[23:03:00] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[23:03:00] [PASSED] drm_test_damage_iter_no_damage_not_visible
[23:03:00] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[23:03:00] [PASSED] drm_test_damage_iter_no_damage_no_fb
[23:03:00] [PASSED] drm_test_damage_iter_simple_damage
[23:03:00] [PASSED] drm_test_damage_iter_single_damage
[23:03:00] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[23:03:00] [PASSED] drm_test_damage_iter_single_damage_outside_src
[23:03:00] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[23:03:00] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[23:03:00] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[23:03:00] [PASSED] drm_test_damage_iter_single_damage_src_moved
[23:03:00] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[23:03:00] [PASSED] drm_test_damage_iter_damage
[23:03:00] [PASSED] drm_test_damage_iter_damage_one_intersect
[23:03:00] [PASSED] drm_test_damage_iter_damage_one_outside
[23:03:00] [PASSED] drm_test_damage_iter_damage_src_moved
[23:03:00] [PASSED] drm_test_damage_iter_damage_not_visible
[23:03:00] ================ [PASSED] drm_damage_helper ================
[23:03:00] ==================== drm_dp_mst_helper  ====================
[23:03:00] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[23:03:00] [PASSED] Clock 154000 BPP 30 DSC disabled
[23:03:00] [PASSED] Clock 234000 BPP 30 DSC disabled
[23:03:00] [PASSED] Clock 297000 BPP 24 DSC disabled
[23:03:00] [PASSED] Clock 332880 BPP 24 DSC enabled
[23:03:00] [PASSED] Clock 324540 BPP 24 DSC enabled
[23:03:00] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[23:03:00] ============== drm_test_dp_mst_calc_pbn_div  ===============
[23:03:00] [PASSED] Link rate 2000000 lane count 4
[23:03:00] [PASSED] Link rate 2000000 lane count 2
[23:03:00] [PASSED] Link rate 2000000 lane count 1
[23:03:00] [PASSED] Link rate 1350000 lane count 4
[23:03:00] [PASSED] Link rate 1350000 lane count 2
[23:03:00] [PASSED] Link rate 1350000 lane count 1
[23:03:00] [PASSED] Link rate 1000000 lane count 4
[23:03:00] [PASSED] Link rate 1000000 lane count 2
[23:03:00] [PASSED] Link rate 1000000 lane count 1
[23:03:00] [PASSED] Link rate 810000 lane count 4
[23:03:00] [PASSED] Link rate 810000 lane count 2
[23:03:00] [PASSED] Link rate 810000 lane count 1
[23:03:00] [PASSED] Link rate 540000 lane count 4
[23:03:00] [PASSED] Link rate 540000 lane count 2
[23:03:00] [PASSED] Link rate 540000 lane count 1
[23:03:00] [PASSED] Link rate 270000 lane count 4
[23:03:00] [PASSED] Link rate 270000 lane count 2
[23:03:00] [PASSED] Link rate 270000 lane count 1
[23:03:00] [PASSED] Link rate 162000 lane count 4
[23:03:00] [PASSED] Link rate 162000 lane count 2
[23:03:00] [PASSED] Link rate 162000 lane count 1
[23:03:00] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[23:03:00] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[23:03:00] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[23:03:00] [PASSED] DP_POWER_UP_PHY with port number
[23:03:00] [PASSED] DP_POWER_DOWN_PHY with port number
[23:03:00] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[23:03:00] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[23:03:00] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[23:03:00] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[23:03:00] [PASSED] DP_QUERY_PAYLOAD with port number
[23:03:00] [PASSED] DP_QUERY_PAYLOAD with VCPI
[23:03:00] [PASSED] DP_REMOTE_DPCD_READ with port number
[23:03:00] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[23:03:00] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[23:03:00] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[23:03:00] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[23:03:00] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[23:03:00] [PASSED] DP_REMOTE_I2C_READ with port number
[23:03:00] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[23:03:00] [PASSED] DP_REMOTE_I2C_READ with transactions array
[23:03:00] [PASSED] DP_REMOTE_I2C_WRITE with port number
[23:03:00] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[23:03:00] [PASSED] DP_REMOTE_I2C_WRITE with data array
[23:03:00] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[23:03:00] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[23:03:00] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[23:03:00] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[23:03:00] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[23:03:00] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[23:03:00] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[23:03:00] ================ [PASSED] drm_dp_mst_helper ================
[23:03:00] ======================== drm_exec  =========================
[23:03:00] [PASSED] sanitycheck
[23:03:00] [PASSED] test_lock
[23:03:00] [PASSED] test_lock_unlock
[23:03:00] [PASSED] test_duplicates
[23:03:00] [PASSED] test_prepare
[23:03:00] [PASSED] test_prepare_array
[23:03:00] [PASSED] test_multiple_loops
[23:03:00] ==================== [PASSED] drm_exec =====================
[23:03:00] ================= drm_format_helper_test  ==================
[23:03:00] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[23:03:00] [PASSED] single_pixel_source_buffer
[23:03:00] [PASSED] single_pixel_clip_rectangle
[23:03:00] [PASSED] well_known_colors
[23:03:00] [PASSED] destination_pitch
[23:03:00] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[23:03:00] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[23:03:00] [PASSED] single_pixel_source_buffer
[23:03:00] [PASSED] single_pixel_clip_rectangle
[23:03:00] [PASSED] well_known_colors
[23:03:00] [PASSED] destination_pitch
[23:03:00] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[23:03:00] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[23:03:00] [PASSED] single_pixel_source_buffer
[23:03:00] [PASSED] single_pixel_clip_rectangle
[23:03:00] [PASSED] well_known_colors
[23:03:00] [PASSED] destination_pitch
[23:03:00] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[23:03:00] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[23:03:00] [PASSED] single_pixel_source_buffer
[23:03:00] [PASSED] single_pixel_clip_rectangle
[23:03:00] [PASSED] well_known_colors
[23:03:00] [PASSED] destination_pitch
[23:03:00] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[23:03:00] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[23:03:00] [PASSED] single_pixel_source_buffer
[23:03:00] [PASSED] single_pixel_clip_rectangle
[23:03:00] [PASSED] well_known_colors
[23:03:00] [PASSED] destination_pitch
[23:03:00] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[23:03:00] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[23:03:00] [PASSED] single_pixel_source_buffer
[23:03:00] [PASSED] single_pixel_clip_rectangle
[23:03:00] [PASSED] well_known_colors
[23:03:00] [PASSED] destination_pitch
[23:03:00] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[23:03:00] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[23:03:00] [PASSED] single_pixel_source_buffer
[23:03:00] [PASSED] single_pixel_clip_rectangle
[23:03:00] [PASSED] well_known_colors
[23:03:00] [PASSED] destination_pitch
[23:03:00] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[23:03:00] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[23:03:00] [PASSED] single_pixel_source_buffer
[23:03:00] [PASSED] single_pixel_clip_rectangle
[23:03:00] [PASSED] well_known_colors
[23:03:00] [PASSED] destination_pitch
[23:03:00] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[23:03:00] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[23:03:00] [PASSED] single_pixel_source_buffer
[23:03:00] [PASSED] single_pixel_clip_rectangle
[23:03:00] [PASSED] well_known_colors
[23:03:00] [PASSED] destination_pitch
[23:03:00] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[23:03:00] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[23:03:00] [PASSED] single_pixel_source_buffer
[23:03:00] [PASSED] single_pixel_clip_rectangle
[23:03:00] [PASSED] well_known_colors
[23:03:00] [PASSED] destination_pitch
[23:03:00] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[23:03:00] ============== drm_test_fb_xrgb8888_to_mono  ===============
[23:03:00] [PASSED] single_pixel_source_buffer
[23:03:00] [PASSED] single_pixel_clip_rectangle
[23:03:00] [PASSED] well_known_colors
[23:03:00] [PASSED] destination_pitch
[23:03:00] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[23:03:00] ==================== drm_test_fb_swab  =====================
[23:03:00] [PASSED] single_pixel_source_buffer
[23:03:00] [PASSED] single_pixel_clip_rectangle
[23:03:00] [PASSED] well_known_colors
[23:03:00] [PASSED] destination_pitch
[23:03:00] ================ [PASSED] drm_test_fb_swab =================
[23:03:00] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[23:03:00] [PASSED] single_pixel_source_buffer
[23:03:00] [PASSED] single_pixel_clip_rectangle
[23:03:00] [PASSED] well_known_colors
[23:03:00] [PASSED] destination_pitch
[23:03:00] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[23:03:00] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[23:03:00] [PASSED] single_pixel_source_buffer
[23:03:00] [PASSED] single_pixel_clip_rectangle
[23:03:00] [PASSED] well_known_colors
[23:03:00] [PASSED] destination_pitch
[23:03:00] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[23:03:00] ================= drm_test_fb_clip_offset  =================
[23:03:00] [PASSED] pass through
[23:03:00] [PASSED] horizontal offset
[23:03:00] [PASSED] vertical offset
[23:03:00] [PASSED] horizontal and vertical offset
[23:03:00] [PASSED] horizontal offset (custom pitch)
[23:03:00] [PASSED] vertical offset (custom pitch)
[23:03:00] [PASSED] horizontal and vertical offset (custom pitch)
[23:03:00] ============= [PASSED] drm_test_fb_clip_offset =============
[23:03:00] ============== drm_test_fb_build_fourcc_list  ==============
[23:03:00] [PASSED] no native formats
[23:03:00] [PASSED] XRGB8888 as native format
[23:03:00] [PASSED] remove duplicates
[23:03:00] [PASSED] convert alpha formats
[23:03:00] [PASSED] random formats
[23:03:00] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[23:03:00] =================== drm_test_fb_memcpy  ====================
[23:03:00] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[23:03:00] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[23:03:00] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[23:03:00] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[23:03:00] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[23:03:00] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[23:03:00] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[23:03:00] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[23:03:00] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[23:03:00] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[23:03:00] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[23:03:00] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[23:03:00] =============== [PASSED] drm_test_fb_memcpy ================
[23:03:00] ============= [PASSED] drm_format_helper_test ==============
[23:03:00] ======================= drm_format  ========================
[23:03:00] [PASSED] drm_test_format_block_width_invalid
[23:03:00] [PASSED] drm_test_format_block_width_one_plane
[23:03:00] [PASSED] drm_test_format_block_width_two_plane
[23:03:00] [PASSED] drm_test_format_block_width_three_plane
[23:03:00] [PASSED] drm_test_format_block_width_tiled
[23:03:00] [PASSED] drm_test_format_block_height_invalid
[23:03:00] [PASSED] drm_test_format_block_height_one_plane
[23:03:00] [PASSED] drm_test_format_block_height_two_plane
[23:03:00] [PASSED] drm_test_format_block_height_three_plane
[23:03:00] [PASSED] drm_test_format_block_height_tiled
[23:03:00] [PASSED] drm_test_format_min_pitch_invalid
[23:03:00] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[23:03:00] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[23:03:00] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[23:03:00] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[23:03:00] [PASSED] drm_test_format_min_pitch_two_plane
[23:03:00] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[23:03:00] [PASSED] drm_test_format_min_pitch_tiled
[23:03:00] =================== [PASSED] drm_format ====================
[23:03:00] ===================== drm_framebuffer  =====================
[23:03:00] =============== drm_test_framebuffer_create  ===============
[23:03:00] [PASSED] ABGR8888 normal sizes
[23:03:00] [PASSED] ABGR8888 max sizes
[23:03:00] [PASSED] ABGR8888 pitch greater than min required
[23:03:00] [PASSED] ABGR8888 pitch less than min required
[23:03:00] [PASSED] ABGR8888 Invalid width
[23:03:00] [PASSED] ABGR8888 Invalid buffer handle
[23:03:00] [PASSED] No pixel format
[23:03:00] [PASSED] ABGR8888 Width 0
[23:03:00] [PASSED] ABGR8888 Height 0
[23:03:00] [PASSED] ABGR8888 Out of bound height * pitch combination
[23:03:00] [PASSED] ABGR8888 Large buffer offset
[23:03:00] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[23:03:00] [PASSED] ABGR8888 Valid buffer modifier
[23:03:00] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[23:03:00] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[23:03:00] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[23:03:00] [PASSED] NV12 Normal sizes
[23:03:00] [PASSED] NV12 Max sizes
[23:03:00] [PASSED] NV12 Invalid pitch
[23:03:00] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[23:03:00] [PASSED] NV12 different  modifier per-plane
[23:03:00] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[23:03:00] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[23:03:00] [PASSED] NV12 Modifier for inexistent plane
[23:03:00] [PASSED] NV12 Handle for inexistent plane
[23:03:00] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[23:03:00] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[23:03:00] [PASSED] YVU420 Normal sizes
[23:03:00] [PASSED] YVU420 Max sizes
[23:03:00] [PASSED] YVU420 Invalid pitch
[23:03:00] [PASSED] YVU420 Different pitches
[23:03:00] [PASSED] YVU420 Different buffer offsets/pitches
[23:03:00] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[23:03:00] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[23:03:00] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[23:03:00] [PASSED] YVU420 Valid modifier
[23:03:00] [PASSED] YVU420 Different modifiers per plane
[23:03:00] [PASSED] YVU420 Modifier for inexistent plane
[23:03:00] [PASSED] X0L2 Normal sizes
[23:03:00] [PASSED] X0L2 Max sizes
[23:03:00] [PASSED] X0L2 Invalid pitch
[23:03:00] [PASSED] X0L2 Pitch greater than minimum required
[23:03:00] [PASSED] X0L2 Handle for inexistent plane
[23:03:00] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[23:03:00] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[23:03:00] [PASSED] X0L2 Valid modifier
[23:03:00] [PASSED] X0L2 Modifier for inexistent plane
[23:03:00] =========== [PASSED] drm_test_framebuffer_create ===========
[23:03:00] ================= [PASSED] drm_framebuffer =================
[23:03:00] ====================== drm_gem_shmem  ======================
[23:03:00] [PASSED] drm_gem_shmem_test_obj_create
[23:03:00] [PASSED] drm_gem_shmem_test_obj_create_private
[23:03:00] [PASSED] drm_gem_shmem_test_pin_pages
[23:03:00] [PASSED] drm_gem_shmem_test_vmap
[23:03:00] [PASSED] drm_gem_shmem_test_get_pages_sgt
[23:03:00] [PASSED] drm_gem_shmem_test_get_sg_table
[23:03:00] [PASSED] drm_gem_shmem_test_madvise
[23:03:00] [PASSED] drm_gem_shmem_test_purge
[23:03:00] ================== [PASSED] drm_gem_shmem ==================
[23:03:00] ==================== drm-test-managed  =====================
[23:03:00] [PASSED] drm_test_managed_run_action
[23:03:00] ================ [PASSED] drm-test-managed =================
[23:03:00] ========================= drm_mm  ==========================
[23:03:00] [PASSED] drm_test_mm_init
[23:03:00] [PASSED] drm_test_mm_debug
[23:03:00] [PASSED] drm_test_mm_align32
[23:03:00] [PASSED] drm_test_mm_align64
[23:03:00] [PASSED] drm_test_mm_lowest
[23:03:00] [PASSED] drm_test_mm_highest
[23:03:00] ===================== [PASSED] drm_mm ======================
[23:03:00] =================== drm_modes_analog_tv  ===================
[23:03:00] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[23:03:00] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[23:03:00] [PASSED] drm_test_modes_analog_tv_pal_576i
[23:03:00] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[23:03:00] =============== [PASSED] drm_modes_analog_tv ===============
[23:03:00] ==================== drm_plane_helper  =====================
[23:03:00] =============== drm_test_check_plane_state  ================
[23:03:00] [PASSED] clipping_simple
[23:03:00] [PASSED] clipping_rotate_reflect
[23:03:00] [PASSED] positioning_simple
[23:03:00] [PASSED] upscaling
[23:03:00] [PASSED] downscaling
[23:03:00] [PASSED] rounding1
[23:03:00] [PASSED] rounding2
[23:03:00] [PASSED] rounding3
[23:03:00] [PASSED] rounding4
[23:03:00] =========== [PASSED] drm_test_check_plane_state ============
[23:03:00] =========== drm_test_check_invalid_plane_state  ============
[23:03:00] [PASSED] positioning_invalid
[23:03:00] [PASSED] upscaling_invalid
[23:03:00] [PASSED] downscaling_invalid
[23:03:00] ======= [PASSED] drm_test_check_invalid_plane_state ========
[23:03:00] ================ [PASSED] drm_plane_helper =================
[23:03:00] ============ drm_connector_helper_tv_get_modes  ============
[23:03:00] ====== drm_test_connector_helper_tv_get_modes_check  =======
[23:03:00] [PASSED] None
[23:03:00] [PASSED] PAL
[23:03:00] [PASSED] NTSC
[23:03:00] [PASSED] Both, NTSC Default
[23:03:00] [PASSED] Both, PAL Default
[23:03:00] [PASSED] Both, NTSC Default, with PAL on command-line
[23:03:00] [PASSED] Both, PAL Default, with NTSC on command-line
[23:03:00] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[23:03:00] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[23:03:00] ======================== drm_rect  =========================
[23:03:00] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[23:03:00] [PASSED] drm_test_rect_clip_scaled_not_clipped
[23:03:00] [PASSED] drm_test_rect_clip_scaled_clipped
[23:03:00] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[23:03:00] ================= drm_test_rect_intersect  =================
[23:03:00] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[23:03:00] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
stty: 'standard input': Inappropriate ioctl for device
[23:03:00] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[23:03:00] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[23:03:00] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[23:03:00] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[23:03:00] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[23:03:00] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[23:03:00] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[23:03:00] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[23:03:00] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[23:03:00] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[23:03:00] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[23:03:00] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[23:03:00] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[23:03:00] ============= [PASSED] drm_test_rect_intersect =============
[23:03:00] ================ drm_test_rect_calc_hscale  ================
[23:03:00] [PASSED] normal use
[23:03:00] [PASSED] out of max range
[23:03:00] [PASSED] out of min range
[23:03:00] [PASSED] zero dst
[23:03:00] [PASSED] negative src
[23:03:00] [PASSED] negative dst
[23:03:00] ============ [PASSED] drm_test_rect_calc_hscale ============
[23:03:00] ================ drm_test_rect_calc_vscale  ================
[23:03:00] [PASSED] normal use
[23:03:00] [PASSED] out of max range
[23:03:00] [PASSED] out of min range
[23:03:00] [PASSED] zero dst
[23:03:00] [PASSED] negative src
[23:03:00] [PASSED] negative dst
[23:03:00] ============ [PASSED] drm_test_rect_calc_vscale ============
[23:03:00] ================== drm_test_rect_rotate  ===================
[23:03:00] [PASSED] reflect-x
[23:03:00] [PASSED] reflect-y
[23:03:00] [PASSED] rotate-0
[23:03:00] [PASSED] rotate-90
[23:03:00] [PASSED] rotate-180
[23:03:00] [PASSED] rotate-270
[23:03:00] ============== [PASSED] drm_test_rect_rotate ===============
[23:03:00] ================ drm_test_rect_rotate_inv  =================
[23:03:00] [PASSED] reflect-x
[23:03:00] [PASSED] reflect-y
[23:03:00] [PASSED] rotate-0
[23:03:00] [PASSED] rotate-90
[23:03:00] [PASSED] rotate-180
[23:03:00] [PASSED] rotate-270
[23:03:00] ============ [PASSED] drm_test_rect_rotate_inv =============
[23:03:00] ==================== [PASSED] drm_rect =====================
[23:03:00] ============================================================
[23:03:00] Testing complete. Ran 390 tests: passed: 390
[23:03:00] Elapsed time: 21.868s total, 1.674s configuring, 20.066s building, 0.126s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


