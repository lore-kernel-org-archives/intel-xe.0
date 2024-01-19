Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D68EC47DAF
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 14:17:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264EA10E9B7;
	Fri, 19 Jan 2024 14:17:09 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EE810E9F9;
 Fri, 19 Jan 2024 14:17:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Revert_=22drm/xe/uc=3A_Store_f?=
 =?utf-8?q?irmware_binary_in_system-memory_backed_BO=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Fri, 19 Jan 2024 14:17:08 -0000
Message-ID: <170567382846.593058.8007447935880956720@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240119132548.404243-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240119132548.404243-1-rodrigo.vivi@intel.com>
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

Series: Revert "drm/xe/uc: Store firmware binary in system-memory backed BO"
URL   : https://patchwork.freedesktop.org/series/128981/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[14:16:15] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:16:20] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[14:16:43] Starting KUnit Kernel (1/1)...
[14:16:43] ============================================================
[14:16:43] ========================= guc_dbm  =========================
[14:16:43] [PASSED] test_empty
[14:16:43] [PASSED] test_default
[14:16:43] ======================== test_size  ========================
[14:16:43] [PASSED] 4
[14:16:43] [PASSED] 8
[14:16:43] [PASSED] 32
[14:16:43] [PASSED] 256
[14:16:43] ==================== [PASSED] test_size ====================
[14:16:43] ======================= test_reuse  ========================
[14:16:43] [PASSED] 4
[14:16:43] [PASSED] 8
[14:16:43] [PASSED] 32
[14:16:43] [PASSED] 256
[14:16:43] =================== [PASSED] test_reuse ====================
[14:16:43] =================== test_range_overlap  ====================
[14:16:43] [PASSED] 4
[14:16:43] [PASSED] 8
[14:16:43] [PASSED] 32
[14:16:43] [PASSED] 256
[14:16:43] =============== [PASSED] test_range_overlap ================
[14:16:43] =================== test_range_compact  ====================
[14:16:43] [PASSED] 4
[14:16:43] [PASSED] 8
[14:16:43] [PASSED] 32
[14:16:43] [PASSED] 256
[14:16:43] =============== [PASSED] test_range_compact ================
[14:16:43] ==================== test_range_spare  =====================
[14:16:43] [PASSED] 4
[14:16:43] [PASSED] 8
[14:16:43] [PASSED] 32
[14:16:43] [PASSED] 256
[14:16:43] ================ [PASSED] test_range_spare =================
[14:16:43] ===================== [PASSED] guc_dbm =====================
[14:16:43] ======================== no_relay  =========================
[14:16:43] [PASSED] xe_drops_guc2pf_if_not_ready
[14:16:43] [PASSED] xe_drops_guc2vf_if_not_ready
[14:16:43] [PASSED] xe_rejects_send_if_not_ready
[14:16:43] ==================== [PASSED] no_relay =====================
[14:16:43] ======================== pf_relay  =========================
[14:16:43] [PASSED] pf_rejects_guc2pf_too_short
[14:16:43] [PASSED] pf_rejects_guc2pf_too_long
[14:16:43] [PASSED] pf_rejects_guc2pf_no_payload
[14:16:43] [PASSED] pf_fails_no_payload
[14:16:43] [PASSED] pf_fails_bad_origin
[14:16:43] [PASSED] pf_fails_bad_type
[14:16:43] [PASSED] pf_txn_reports_error
[14:16:43] [PASSED] pf_txn_sends_pf2guc
[14:16:43] [PASSED] pf_sends_pf2guc
[14:16:43] [SKIPPED] pf_loopback_nop
[14:16:43] [SKIPPED] pf_loopback_echo
[14:16:43] [SKIPPED] pf_loopback_fail
[14:16:43] [SKIPPED] pf_loopback_busy
[14:16:43] [SKIPPED] pf_loopback_retry
[14:16:43] ==================== [PASSED] pf_relay =====================
[14:16:43] ======================== vf_relay  =========================
[14:16:43] [PASSED] vf_rejects_guc2vf_too_short
[14:16:43] [PASSED] vf_rejects_guc2vf_too_long
[14:16:43] [PASSED] vf_rejects_guc2vf_no_payload
[14:16:43] ==================== [PASSED] vf_relay =====================
[14:16:43] ========================== lmtt  ===========================
[14:16:43] ======================== test_ops  =========================
[14:16:43] [PASSED] 2-level
[14:16:43] [PASSED] multi-level
[14:16:43] ==================== [PASSED] test_ops =====================
[14:16:43] ====================== [PASSED] lmtt =======================
[14:16:43] ========================== xe_bo  ==========================
[14:16:43] [SKIPPED] xe_ccs_migrate_kunit
[14:16:43] [SKIPPED] xe_bo_evict_kunit
[14:16:43] ===================== [SKIPPED] xe_bo ======================
[14:16:43] ======================= xe_dma_buf  ========================
[14:16:43] [SKIPPED] xe_dma_buf_kunit
[14:16:43] =================== [SKIPPED] xe_dma_buf ===================
[14:16:43] ======================= xe_migrate  ========================
[14:16:43] [SKIPPED] xe_migrate_sanity_kunit
[14:16:43] =================== [SKIPPED] xe_migrate ===================
[14:16:43] ========================= xe_mocs  =========================
[14:16:43] [SKIPPED] xe_live_mocs_kernel_kunit
[14:16:43] [SKIPPED] xe_live_mocs_reset_kunit
[14:16:43] ==================== [SKIPPED] xe_mocs =====================
[14:16:43] ========================= xe_pci  ==========================
[14:16:43] [PASSED] xe_gmdid_graphics_ip
[14:16:43] [PASSED] xe_gmdid_media_ip
[14:16:43] ===================== [PASSED] xe_pci ======================
[14:16:43] ========================= xe_rtp  ==========================
[14:16:43] ================== xe_rtp_process_tests  ===================
[14:16:43] [PASSED] coalesce-same-reg
[14:16:43] [PASSED] no-match-no-add
[14:16:43] [PASSED] no-match-no-add-multiple-rules
[14:16:43] [PASSED] two-regs-two-entries
[14:16:43] [PASSED] clr-one-set-other
[14:16:43] [PASSED] set-field
[14:16:43] [PASSED] conflict-duplicate
[14:16:43] [PASSED] conflict-not-disjoint
[14:16:43] [PASSED] conflict-reg-type
[14:16:43] ============== [PASSED] xe_rtp_process_tests ===============
[14:16:43] ===================== [PASSED] xe_rtp ======================
[14:16:43] ========================== xe_wa  ==========================
[14:16:43] ======================== xe_wa_gt  =========================
[14:16:43] [PASSED] TIGERLAKE (B0)
[14:16:43] [PASSED] DG1 (A0)
[14:16:43] [PASSED] DG1 (B0)
[14:16:43] [PASSED] ALDERLAKE_S (A0)
[14:16:43] [PASSED] ALDERLAKE_S (B0)
[14:16:43] [PASSED] ALDERLAKE_S (C0)
[14:16:43] [PASSED] ALDERLAKE_S (D0)
[14:16:43] [PASSED] ALDERLAKE_P (A0)
[14:16:43] [PASSED] ALDERLAKE_P (B0)
[14:16:43] [PASSED] ALDERLAKE_P (C0)
[14:16:43] [PASSED] ALDERLAKE_S_RPLS (D0)
[14:16:43] [PASSED] ALDERLAKE_P_RPLU (E0)
[14:16:43] [PASSED] DG2_G10 (C0)
[14:16:43] [PASSED] DG2_G11 (B1)
[14:16:43] [PASSED] DG2_G12 (A1)
[14:16:43] [PASSED] PVC (B0)
[14:16:43] [PASSED] PVC (B1)
[14:16:43] [PASSED] PVC (C0)
[14:16:43] [PASSED] METEORLAKE (g:A0, m:A0)
[14:16:43] [PASSED] METEORLAKE (g:A0, m:A0)
[14:16:43] [PASSED] LUNARLAKE (g:A0, m:A0)
[14:16:43] [PASSED] LUNARLAKE (g:B0, m:A0)
[14:16:43] ==================== [PASSED] xe_wa_gt =====================
[14:16:43] ====================== [PASSED] xe_wa ======================
[14:16:43] ============================================================
[14:16:43] Testing complete. Ran 83 tests: passed: 72, skipped: 11
[14:16:43] Elapsed time: 27.849s total, 4.190s configuring, 23.439s building, 0.193s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[14:16:43] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:16:45] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[14:17:05] Starting KUnit Kernel (1/1)...
[14:17:05] ============================================================
[14:17:05] ================== drm_test_pick_cmdline  ==================
[14:17:05] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[14:17:05] =============== drm_test_pick_cmdline_named  ===============
[14:17:05] [PASSED] NTSC
[14:17:05] [PASSED] NTSC-J
[14:17:05] [PASSED] PAL
[14:17:05] [PASSED] PAL-M
[14:17:05] =========== [PASSED] drm_test_pick_cmdline_named ===========
[14:17:05] ============== [PASSED] drm_test_pick_cmdline ==============
[14:17:05] ======================== drm_buddy  ========================
[14:17:05] [PASSED] drm_test_buddy_alloc_limit
[14:17:05] [PASSED] drm_test_buddy_alloc_optimistic
[14:17:05] [PASSED] drm_test_buddy_alloc_pessimistic
[14:17:05] [PASSED] drm_test_buddy_alloc_pathological
[14:17:05] ==================== [PASSED] drm_buddy ====================
[14:17:05] =================== drm_cmdline_parser  ====================
[14:17:05] [PASSED] drm_test_cmdline_force_d_only
[14:17:05] [PASSED] drm_test_cmdline_force_D_only_dvi
[14:17:05] [PASSED] drm_test_cmdline_force_D_only_hdmi
[14:17:05] [PASSED] drm_test_cmdline_force_D_only_not_digital
[14:17:05] [PASSED] drm_test_cmdline_force_e_only
[14:17:05] [PASSED] drm_test_cmdline_res
[14:17:05] [PASSED] drm_test_cmdline_res_vesa
[14:17:05] [PASSED] drm_test_cmdline_res_vesa_rblank
[14:17:05] [PASSED] drm_test_cmdline_res_rblank
[14:17:05] [PASSED] drm_test_cmdline_res_bpp
[14:17:05] [PASSED] drm_test_cmdline_res_refresh
[14:17:05] [PASSED] drm_test_cmdline_res_bpp_refresh
[14:17:05] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[14:17:05] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[14:17:05] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[14:17:05] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[14:17:05] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[14:17:05] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[14:17:05] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[14:17:05] [PASSED] drm_test_cmdline_res_margins_force_on
[14:17:05] [PASSED] drm_test_cmdline_res_vesa_margins
[14:17:05] [PASSED] drm_test_cmdline_name
[14:17:05] [PASSED] drm_test_cmdline_name_bpp
[14:17:05] [PASSED] drm_test_cmdline_name_option
[14:17:05] [PASSED] drm_test_cmdline_name_bpp_option
[14:17:05] [PASSED] drm_test_cmdline_rotate_0
[14:17:05] [PASSED] drm_test_cmdline_rotate_90
[14:17:05] [PASSED] drm_test_cmdline_rotate_180
[14:17:05] [PASSED] drm_test_cmdline_rotate_270
[14:17:05] [PASSED] drm_test_cmdline_hmirror
[14:17:05] [PASSED] drm_test_cmdline_vmirror
[14:17:05] [PASSED] drm_test_cmdline_margin_options
[14:17:05] [PASSED] drm_test_cmdline_multiple_options
[14:17:05] [PASSED] drm_test_cmdline_bpp_extra_and_option
[14:17:05] [PASSED] drm_test_cmdline_extra_and_option
[14:17:05] [PASSED] drm_test_cmdline_freestanding_options
[14:17:05] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[14:17:05] [PASSED] drm_test_cmdline_panel_orientation
[14:17:05] ================ drm_test_cmdline_invalid  =================
[14:17:05] [PASSED] margin_only
[14:17:05] [PASSED] interlace_only
[14:17:05] [PASSED] res_missing_x
[14:17:05] [PASSED] res_missing_y
[14:17:05] [PASSED] res_bad_y
[14:17:05] [PASSED] res_missing_y_bpp
[14:17:05] [PASSED] res_bad_bpp
[14:17:05] [PASSED] res_bad_refresh
[14:17:05] [PASSED] res_bpp_refresh_force_on_off
[14:17:05] [PASSED] res_invalid_mode
[14:17:05] [PASSED] res_bpp_wrong_place_mode
[14:17:05] [PASSED] name_bpp_refresh
[14:17:05] [PASSED] name_refresh
[14:17:05] [PASSED] name_refresh_wrong_mode
[14:17:05] [PASSED] name_refresh_invalid_mode
[14:17:05] [PASSED] rotate_multiple
[14:17:05] [PASSED] rotate_invalid_val
[14:17:05] [PASSED] rotate_truncated
[14:17:05] [PASSED] invalid_option
[14:17:05] [PASSED] invalid_tv_option
[14:17:05] [PASSED] truncated_tv_option
[14:17:05] ============ [PASSED] drm_test_cmdline_invalid =============
[14:17:05] =============== drm_test_cmdline_tv_options  ===============
[14:17:05] [PASSED] NTSC
[14:17:05] [PASSED] NTSC_443
[14:17:05] [PASSED] NTSC_J
[14:17:05] [PASSED] PAL
[14:17:05] [PASSED] PAL_M
[14:17:05] [PASSED] PAL_N
[14:17:05] [PASSED] SECAM
[14:17:05] =========== [PASSED] drm_test_cmdline_tv_options ===========
[14:17:05] =============== [PASSED] drm_cmdline_parser ================
[14:17:05] ================ drm_get_tv_mode_from_name  ================
[14:17:05] ========== drm_test_get_tv_mode_from_name_valid  ===========
[14:17:05] [PASSED] NTSC
[14:17:05] [PASSED] NTSC-443
[14:17:05] [PASSED] NTSC-J
[14:17:05] [PASSED] PAL
[14:17:05] [PASSED] PAL-M
[14:17:05] [PASSED] PAL-N
[14:17:05] [PASSED] SECAM
[14:17:05] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[14:17:05] [PASSED] drm_test_get_tv_mode_from_name_truncated
[14:17:05] ============ [PASSED] drm_get_tv_mode_from_name ============
[14:17:05] ==================== drm_damage_helper  ====================
[14:17:05] [PASSED] drm_test_damage_iter_no_damage
[14:17:05] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[14:17:05] [PASSED] drm_test_damage_iter_no_damage_src_moved
[14:17:05] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[14:17:05] [PASSED] drm_test_damage_iter_no_damage_not_visible
[14:17:05] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[14:17:05] [PASSED] drm_test_damage_iter_no_damage_no_fb
[14:17:05] [PASSED] drm_test_damage_iter_simple_damage
[14:17:05] [PASSED] drm_test_damage_iter_single_damage
[14:17:05] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[14:17:05] [PASSED] drm_test_damage_iter_single_damage_outside_src
[14:17:05] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[14:17:05] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[14:17:05] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[14:17:05] [PASSED] drm_test_damage_iter_single_damage_src_moved
[14:17:05] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[14:17:05] [PASSED] drm_test_damage_iter_damage
[14:17:05] [PASSED] drm_test_damage_iter_damage_one_intersect
[14:17:05] [PASSED] drm_test_damage_iter_damage_one_outside
[14:17:05] [PASSED] drm_test_damage_iter_damage_src_moved
[14:17:05] [PASSED] drm_test_damage_iter_damage_not_visible
[14:17:05] ================ [PASSED] drm_damage_helper ================
[14:17:05] ==================== drm_dp_mst_helper  ====================
[14:17:05] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[14:17:05] [PASSED] Clock 154000 BPP 30 DSC disabled
[14:17:05] [PASSED] Clock 234000 BPP 30 DSC disabled
[14:17:05] [PASSED] Clock 297000 BPP 24 DSC disabled
[14:17:05] [PASSED] Clock 332880 BPP 24 DSC enabled
[14:17:05] [PASSED] Clock 324540 BPP 24 DSC enabled
[14:17:05] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[14:17:05] ============== drm_test_dp_mst_calc_pbn_div  ===============
[14:17:05] [PASSED] Link rate 2000000 lane count 4
[14:17:05] [PASSED] Link rate 2000000 lane count 2
[14:17:05] [PASSED] Link rate 2000000 lane count 1
[14:17:05] [PASSED] Link rate 1350000 lane count 4
[14:17:05] [PASSED] Link rate 1350000 lane count 2
[14:17:05] [PASSED] Link rate 1350000 lane count 1
[14:17:05] [PASSED] Link rate 1000000 lane count 4
[14:17:05] [PASSED] Link rate 1000000 lane count 2
[14:17:05] [PASSED] Link rate 1000000 lane count 1
[14:17:05] [PASSED] Link rate 810000 lane count 4
[14:17:05] [PASSED] Link rate 810000 lane count 2
[14:17:05] [PASSED] Link rate 810000 lane count 1
[14:17:05] [PASSED] Link rate 540000 lane count 4
[14:17:05] [PASSED] Link rate 540000 lane count 2
[14:17:05] [PASSED] Link rate 540000 lane count 1
[14:17:05] [PASSED] Link rate 270000 lane count 4
[14:17:05] [PASSED] Link rate 270000 lane count 2
[14:17:05] [PASSED] Link rate 270000 lane count 1
[14:17:05] [PASSED] Link rate 162000 lane count 4
[14:17:05] [PASSED] Link rate 162000 lane count 2
[14:17:05] [PASSED] Link rate 162000 lane count 1
[14:17:05] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[14:17:05] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[14:17:05] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[14:17:05] [PASSED] DP_POWER_UP_PHY with port number
[14:17:05] [PASSED] DP_POWER_DOWN_PHY with port number
[14:17:05] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[14:17:05] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[14:17:05] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[14:17:05] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[14:17:05] [PASSED] DP_QUERY_PAYLOAD with port number
[14:17:05] [PASSED] DP_QUERY_PAYLOAD with VCPI
[14:17:05] [PASSED] DP_REMOTE_DPCD_READ with port number
[14:17:05] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[14:17:05] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[14:17:05] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[14:17:05] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[14:17:05] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[14:17:05] [PASSED] DP_REMOTE_I2C_READ with port number
[14:17:05] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[14:17:05] [PASSED] DP_REMOTE_I2C_READ with transactions array
[14:17:05] [PASSED] DP_REMOTE_I2C_WRITE with port number
[14:17:05] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[14:17:05] [PASSED] DP_REMOTE_I2C_WRITE with data array
[14:17:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[14:17:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[14:17:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[14:17:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[14:17:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[14:17:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[14:17:05] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[14:17:05] ================ [PASSED] drm_dp_mst_helper ================
[14:17:05] ======================== drm_exec  =========================
[14:17:05] [PASSED] sanitycheck
[14:17:05] [PASSED] test_lock
[14:17:05] [PASSED] test_lock_unlock
[14:17:05] [PASSED] test_duplicates
[14:17:05] [PASSED] test_prepare
[14:17:05] [PASSED] test_prepare_array
[14:17:05] [PASSED] test_multiple_loops
[14:17:05] ==================== [PASSED] drm_exec =====================
[14:17:05] ================= drm_format_helper_test  ==================
[14:17:05] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[14:17:05] [PASSED] single_pixel_source_buffer
[14:17:05] [PASSED] single_pixel_clip_rectangle
[14:17:05] [PASSED] well_known_colors
[14:17:05] [PASSED] destination_pitch
[14:17:05] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[14:17:05] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[14:17:05] [PASSED] single_pixel_source_buffer
[14:17:05] [PASSED] single_pixel_clip_rectangle
[14:17:05] [PASSED] well_known_colors
[14:17:05] [PASSED] destination_pitch
[14:17:05] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[14:17:05] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[14:17:05] [PASSED] single_pixel_source_buffer
[14:17:05] [PASSED] single_pixel_clip_rectangle
[14:17:05] [PASSED] well_known_colors
[14:17:05] [PASSED] destination_pitch
[14:17:05] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[14:17:05] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[14:17:05] [PASSED] single_pixel_source_buffer
[14:17:05] [PASSED] single_pixel_clip_rectangle
[14:17:05] [PASSED] well_known_colors
[14:17:05] [PASSED] destination_pitch
[14:17:05] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[14:17:05] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[14:17:05] [PASSED] single_pixel_source_buffer
[14:17:05] [PASSED] single_pixel_clip_rectangle
[14:17:05] [PASSED] well_known_colors
[14:17:05] [PASSED] destination_pitch
[14:17:05] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[14:17:05] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[14:17:05] [PASSED] single_pixel_source_buffer
[14:17:05] [PASSED] single_pixel_clip_rectangle
[14:17:05] [PASSED] well_known_colors
[14:17:05] [PASSED] destination_pitch
[14:17:05] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[14:17:05] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[14:17:05] [PASSED] single_pixel_source_buffer
[14:17:05] [PASSED] single_pixel_clip_rectangle
[14:17:05] [PASSED] well_known_colors
[14:17:05] [PASSED] destination_pitch
[14:17:05] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[14:17:05] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[14:17:05] [PASSED] single_pixel_source_buffer
[14:17:05] [PASSED] single_pixel_clip_rectangle
[14:17:05] [PASSED] well_known_colors
[14:17:05] [PASSED] destination_pitch
[14:17:05] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[14:17:05] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[14:17:05] [PASSED] single_pixel_source_buffer
[14:17:05] [PASSED] single_pixel_clip_rectangle
[14:17:05] [PASSED] well_known_colors
[14:17:05] [PASSED] destination_pitch
[14:17:05] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[14:17:05] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[14:17:05] [PASSED] single_pixel_source_buffer
[14:17:05] [PASSED] single_pixel_clip_rectangle
[14:17:05] [PASSED] well_known_colors
[14:17:05] [PASSED] destination_pitch
[14:17:05] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[14:17:05] ============== drm_test_fb_xrgb8888_to_mono  ===============
[14:17:05] [PASSED] single_pixel_source_buffer
[14:17:05] [PASSED] single_pixel_clip_rectangle
[14:17:05] [PASSED] well_known_colors
[14:17:05] [PASSED] destination_pitch
[14:17:05] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[14:17:05] ==================== drm_test_fb_swab  =====================
[14:17:05] [PASSED] single_pixel_source_buffer
[14:17:05] [PASSED] single_pixel_clip_rectangle
[14:17:05] [PASSED] well_known_colors
[14:17:05] [PASSED] destination_pitch
[14:17:05] ================ [PASSED] drm_test_fb_swab =================
[14:17:05] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[14:17:05] [PASSED] single_pixel_source_buffer
[14:17:05] [PASSED] single_pixel_clip_rectangle
[14:17:05] [PASSED] well_known_colors
[14:17:05] [PASSED] destination_pitch
[14:17:05] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[14:17:05] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[14:17:05] [PASSED] single_pixel_source_buffer
[14:17:05] [PASSED] single_pixel_clip_rectangle
[14:17:05] [PASSED] well_known_colors
[14:17:05] [PASSED] destination_pitch
[14:17:05] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[14:17:05] ================= drm_test_fb_clip_offset  =================
[14:17:05] [PASSED] pass through
[14:17:05] [PASSED] horizontal offset
[14:17:05] [PASSED] vertical offset
[14:17:05] [PASSED] horizontal and vertical offset
[14:17:05] [PASSED] horizontal offset (custom pitch)
[14:17:05] [PASSED] vertical offset (custom pitch)
[14:17:05] [PASSED] horizontal and vertical offset (custom pitch)
[14:17:05] ============= [PASSED] drm_test_fb_clip_offset =============
[14:17:05] ============== drm_test_fb_build_fourcc_list  ==============
[14:17:05] [PASSED] no native formats
[14:17:05] [PASSED] XRGB8888 as native format
[14:17:05] [PASSED] remove duplicates
[14:17:05] [PASSED] convert alpha formats
[14:17:05] [PASSED] random formats
[14:17:05] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[14:17:05] =================== drm_test_fb_memcpy  ====================
[14:17:05] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[14:17:05] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[14:17:05] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[14:17:05] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[14:17:05] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[14:17:05] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[14:17:05] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[14:17:05] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[14:17:05] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[14:17:05] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[14:17:05] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[14:17:05] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[14:17:05] =============== [PASSED] drm_test_fb_memcpy ================
[14:17:05] ============= [PASSED] drm_format_helper_test ==============
[14:17:05] ======================= drm_format  ========================
[14:17:05] [PASSED] drm_test_format_block_width_invalid
[14:17:05] [PASSED] drm_test_format_block_width_one_plane
[14:17:05] [PASSED] drm_test_format_block_width_two_plane
[14:17:05] [PASSED] drm_test_format_block_width_three_plane
[14:17:05] [PASSED] drm_test_format_block_width_tiled
[14:17:05] [PASSED] drm_test_format_block_height_invalid
[14:17:05] [PASSED] drm_test_format_block_height_one_plane
[14:17:05] [PASSED] drm_test_format_block_height_two_plane
[14:17:05] [PASSED] drm_test_format_block_height_three_plane
[14:17:05] [PASSED] drm_test_format_block_height_tiled
[14:17:05] [PASSED] drm_test_format_min_pitch_invalid
[14:17:05] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[14:17:05] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[14:17:05] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[14:17:05] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[14:17:05] [PASSED] drm_test_format_min_pitch_two_plane
[14:17:05] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[14:17:05] [PASSED] drm_test_format_min_pitch_tiled
[14:17:05] =================== [PASSED] drm_format ====================
[14:17:05] ===================== drm_framebuffer  =====================
[14:17:05] =============== drm_test_framebuffer_create  ===============
[14:17:05] [PASSED] ABGR8888 normal sizes
[14:17:05] [PASSED] ABGR8888 max sizes
[14:17:05] [PASSED] ABGR8888 pitch greater than min required
[14:17:05] [PASSED] ABGR8888 pitch less than min required
[14:17:05] [PASSED] ABGR8888 Invalid width
[14:17:05] [PASSED] ABGR8888 Invalid buffer handle
[14:17:05] [PASSED] No pixel format
[14:17:05] [PASSED] ABGR8888 Width 0
[14:17:05] [PASSED] ABGR8888 Height 0
[14:17:05] [PASSED] ABGR8888 Out of bound height * pitch combination
[14:17:05] [PASSED] ABGR8888 Large buffer offset
[14:17:05] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[14:17:05] [PASSED] ABGR8888 Valid buffer modifier
[14:17:05] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[14:17:05] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[14:17:05] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[14:17:05] [PASSED] NV12 Normal sizes
[14:17:05] [PASSED] NV12 Max sizes
[14:17:05] [PASSED] NV12 Invalid pitch
[14:17:05] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[14:17:05] [PASSED] NV12 different  modifier per-plane
[14:17:05] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[14:17:05] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[14:17:05] [PASSED] NV12 Modifier for inexistent plane
[14:17:05] [PASSED] NV12 Handle for inexistent plane
[14:17:05] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[14:17:05] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[14:17:05] [PASSED] YVU420 Normal sizes
[14:17:05] [PASSED] YVU420 Max sizes
[14:17:05] [PASSED] YVU420 Invalid pitch
[14:17:05] [PASSED] YVU420 Different pitches
[14:17:05] [PASSED] YVU420 Different buffer offsets/pitches
[14:17:05] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[14:17:05] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[14:17:05] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[14:17:05] [PASSED] YVU420 Valid modifier
[14:17:05] [PASSED] YVU420 Different modifiers per plane
[14:17:05] [PASSED] YVU420 Modifier for inexistent plane
[14:17:05] [PASSED] X0L2 Normal sizes
[14:17:05] [PASSED] X0L2 Max sizes
[14:17:05] [PASSED] X0L2 Invalid pitch
[14:17:05] [PASSED] X0L2 Pitch greater than minimum required
[14:17:05] [PASSED] X0L2 Handle for inexistent plane
[14:17:05] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[14:17:05] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[14:17:05] [PASSED] X0L2 Valid modifier
[14:17:05] [PASSED] X0L2 Modifier for inexistent plane
[14:17:05] =========== [PASSED] drm_test_framebuffer_create ===========
[14:17:05] ================= [PASSED] drm_framebuffer =================
[14:17:05] ====================== drm_gem_shmem  ======================
[14:17:05] [PASSED] drm_gem_shmem_test_obj_create
[14:17:05] [PASSED] drm_gem_shmem_test_obj_create_private
[14:17:05] [PASSED] drm_gem_shmem_test_pin_pages
[14:17:05] [PASSED] drm_gem_shmem_test_vmap
[14:17:05] [PASSED] drm_gem_shmem_test_get_pages_sgt
[14:17:05] [PASSED] drm_gem_shmem_test_get_sg_table
[14:17:05] [PASSED] drm_gem_shmem_test_madvise
[14:17:05] [PASSED] drm_gem_shmem_test_purge
[14:17:05] ================== [PASSED] drm_gem_shmem ==================
[14:17:05] ======================= drm_managed  =======================
[14:17:05] [PASSED] drm_test_managed_release_action
[14:17:05] [PASSED] drm_test_managed_run_action
[14:17:05] =================== [PASSED] drm_managed ===================
[14:17:05] ========================= drm_mm  ==========================
[14:17:05] [PASSED] drm_test_mm_init
[14:17:05] [PASSED] drm_test_mm_debug
[14:17:05] [PASSED] drm_test_mm_align32
[14:17:05] [PASSED] drm_test_mm_align64
[14:17:05] [PASSED] drm_test_mm_lowest
[14:17:05] [PASSED] drm_test_mm_highest
[14:17:05] ===================== [PASSED] drm_mm ======================
[14:17:05] =================== drm_modes_analog_tv  ===================
[14:17:05] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[14:17:05] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[14:17:05] [PASSED] drm_test_modes_analog_tv_pal_576i
[14:17:05] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[14:17:05] =============== [PASSED] drm_modes_analog_tv ===============
[14:17:05] ==================== drm_plane_helper  =====================
[14:17:05] =============== drm_test_check_plane_state  ================
[14:17:05] [PASSED] clipping_simple
[14:17:05] [PASSED] clipping_rotate_reflect
[14:17:05] [PASSED] positioning_simple
[14:17:05] [PASSED] upscaling
[14:17:05] [PASSED] downscaling
[14:17:05] [PASSED] rounding1
[14:17:05] [PASSED] rounding2
[14:17:05] [PASSED] rounding3
[14:17:05] [PASSED] rounding4
[14:17:05] =========== [PASSED] drm_test_check_plane_state ============
[14:17:05] =========== drm_test_check_invalid_plane_state  ============
[14:17:05] [PASSED] positioning_invalid
[14:17:05] [PASSED] upscaling_invalid
[14:17:05] [PASSED] downscaling_invalid
[14:17:05] ======= [PASSED] drm_test_check_invalid_plane_state ========
[14:17:05] ================ [PASSED] drm_plane_helper =================
[14:17:05] ============ drm_connector_helper_tv_get_modes  ============
[14:17:05] ====== drm_test_connector_helper_tv_get_modes_check  =======
[14:17:05] [PASSED] None
[14:17:05] [PASSED] PAL
[14:17:05] [PASSED] NTSC
[14:17:05] [PASSED] Both, NTSC Default
[14:17:05] [PASSED] Both, PAL Default
[14:17:05] [PASSED] Both, NTSC Default, with PAL on command-line
[14:17:05] [PASSED] Both, PAL Default, with NTSC on command-line
[14:17:05] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[14:17:05] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[14:17:05] ======================== drm_rect  =========================
[14:17:05] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[14:17:05] [PASSED] drm_test_rect_clip_scaled_not_clipped
[14:17:05] [PASSED] drm_test_rect_clip_scaled_clipped
[14:17:05] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[14:17:05] ================= drm_test_rect_intersect  =================
[14:17:05] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
stty: 'standard input': Inappropriate ioctl for device
[14:17:05] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[14:17:05] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[14:17:05] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[14:17:05] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[14:17:05] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[14:17:05] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[14:17:05] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[14:17:05] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[14:17:05] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[14:17:05] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[14:17:05] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[14:17:05] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[14:17:05] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[14:17:05] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[14:17:05] ============= [PASSED] drm_test_rect_intersect =============
[14:17:05] ================ drm_test_rect_calc_hscale  ================
[14:17:05] [PASSED] normal use
[14:17:05] [PASSED] out of max range
[14:17:05] [PASSED] out of min range
[14:17:05] [PASSED] zero dst
[14:17:05] [PASSED] negative src
[14:17:05] [PASSED] negative dst
[14:17:05] ============ [PASSED] drm_test_rect_calc_hscale ============
[14:17:05] ================ drm_test_rect_calc_vscale  ================
[14:17:05] [PASSED] normal use
[14:17:05] [PASSED] out of max range
[14:17:05] [PASSED] out of min range
[14:17:05] [PASSED] zero dst
[14:17:05] [PASSED] negative src
[14:17:05] [PASSED] negative dst
[14:17:05] ============ [PASSED] drm_test_rect_calc_vscale ============
[14:17:05] ================== drm_test_rect_rotate  ===================
[14:17:05] [PASSED] reflect-x
[14:17:05] [PASSED] reflect-y
[14:17:05] [PASSED] rotate-0
[14:17:05] [PASSED] rotate-90
[14:17:05] [PASSED] rotate-180
[14:17:05] [PASSED] rotate-270
[14:17:05] ============== [PASSED] drm_test_rect_rotate ===============
[14:17:05] ================ drm_test_rect_rotate_inv  =================
[14:17:05] [PASSED] reflect-x
[14:17:05] [PASSED] reflect-y
[14:17:05] [PASSED] rotate-0
[14:17:05] [PASSED] rotate-90
[14:17:05] [PASSED] rotate-180
[14:17:05] [PASSED] rotate-270
[14:17:05] ============ [PASSED] drm_test_rect_rotate_inv =============
[14:17:05] ==================== [PASSED] drm_rect =====================
[14:17:05] ============================================================
[14:17:05] Testing complete. Ran 391 tests: passed: 391
[14:17:05] Elapsed time: 22.001s total, 1.638s configuring, 20.241s building, 0.120s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


