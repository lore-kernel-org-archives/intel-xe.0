Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051D2C47422
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 00:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B8710E93B;
	Fri, 19 Jan 2024 00:20:12 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9847710E838;
 Fri, 19 Jan 2024 00:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Fix_32bit_build_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Fri, 19 Jan 2024 00:20:11 -0000
Message-ID: <170562361162.558566.14761878732669385979@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240119001612.2991381-1-lucas.demarchi@intel.com>
In-Reply-To: <20240119001612.2991381-1-lucas.demarchi@intel.com>
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

Series: Fix 32bit build (rev2)
URL   : https://patchwork.freedesktop.org/series/128840/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[00:19:19] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:19:23] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[00:19:46] Starting KUnit Kernel (1/1)...
[00:19:46] ============================================================
[00:19:47] ========================= guc_dbm  =========================
[00:19:47] [PASSED] test_empty
[00:19:47] [PASSED] test_default
[00:19:47] ======================== test_size  ========================
[00:19:47] [PASSED] 4
[00:19:47] [PASSED] 8
[00:19:47] [PASSED] 32
[00:19:47] [PASSED] 256
[00:19:47] ==================== [PASSED] test_size ====================
[00:19:47] ======================= test_reuse  ========================
[00:19:47] [PASSED] 4
[00:19:47] [PASSED] 8
[00:19:47] [PASSED] 32
[00:19:47] [PASSED] 256
[00:19:47] =================== [PASSED] test_reuse ====================
[00:19:47] =================== test_range_overlap  ====================
[00:19:47] [PASSED] 4
[00:19:47] [PASSED] 8
[00:19:47] [PASSED] 32
[00:19:47] [PASSED] 256
[00:19:47] =============== [PASSED] test_range_overlap ================
[00:19:47] =================== test_range_compact  ====================
[00:19:47] [PASSED] 4
[00:19:47] [PASSED] 8
[00:19:47] [PASSED] 32
[00:19:47] [PASSED] 256
[00:19:47] =============== [PASSED] test_range_compact ================
[00:19:47] ==================== test_range_spare  =====================
[00:19:47] [PASSED] 4
[00:19:47] [PASSED] 8
[00:19:47] [PASSED] 32
[00:19:47] [PASSED] 256
[00:19:47] ================ [PASSED] test_range_spare =================
[00:19:47] ===================== [PASSED] guc_dbm =====================
[00:19:47] ======================== no_relay  =========================
[00:19:47] [PASSED] xe_drops_guc2pf_if_not_ready
[00:19:47] [PASSED] xe_drops_guc2vf_if_not_ready
[00:19:47] [PASSED] xe_rejects_send_if_not_ready
[00:19:47] ==================== [PASSED] no_relay =====================
[00:19:47] ======================== pf_relay  =========================
[00:19:47] [PASSED] pf_rejects_guc2pf_too_short
[00:19:47] [PASSED] pf_rejects_guc2pf_too_long
[00:19:47] [PASSED] pf_rejects_guc2pf_no_payload
[00:19:47] [PASSED] pf_fails_no_payload
[00:19:47] [PASSED] pf_fails_bad_origin
[00:19:47] [PASSED] pf_fails_bad_type
[00:19:47] [PASSED] pf_txn_reports_error
[00:19:47] [PASSED] pf_txn_sends_pf2guc
[00:19:47] [PASSED] pf_sends_pf2guc
[00:19:47] [SKIPPED] pf_loopback_nop
[00:19:47] [SKIPPED] pf_loopback_echo
[00:19:47] [SKIPPED] pf_loopback_fail
[00:19:47] [SKIPPED] pf_loopback_busy
[00:19:47] [SKIPPED] pf_loopback_retry
[00:19:47] ==================== [PASSED] pf_relay =====================
[00:19:47] ======================== vf_relay  =========================
[00:19:47] [PASSED] vf_rejects_guc2vf_too_short
[00:19:47] [PASSED] vf_rejects_guc2vf_too_long
[00:19:47] [PASSED] vf_rejects_guc2vf_no_payload
[00:19:47] ==================== [PASSED] vf_relay =====================
[00:19:47] ========================== lmtt  ===========================
[00:19:47] ======================== test_ops  =========================
[00:19:47] [PASSED] 2-level
[00:19:47] [PASSED] multi-level
[00:19:47] ==================== [PASSED] test_ops =====================
[00:19:47] ====================== [PASSED] lmtt =======================
[00:19:47] ========================== xe_bo  ==========================
[00:19:47] [SKIPPED] xe_ccs_migrate_kunit
[00:19:47] [SKIPPED] xe_bo_evict_kunit
[00:19:47] ===================== [SKIPPED] xe_bo ======================
[00:19:47] ======================= xe_dma_buf  ========================
[00:19:47] [SKIPPED] xe_dma_buf_kunit
[00:19:47] =================== [SKIPPED] xe_dma_buf ===================
[00:19:47] ======================= xe_migrate  ========================
[00:19:47] [SKIPPED] xe_migrate_sanity_kunit
[00:19:47] =================== [SKIPPED] xe_migrate ===================
[00:19:47] ========================= xe_mocs  =========================
[00:19:47] [SKIPPED] xe_live_mocs_kernel_kunit
[00:19:47] [SKIPPED] xe_live_mocs_reset_kunit
[00:19:47] ==================== [SKIPPED] xe_mocs =====================
[00:19:47] ========================= xe_pci  ==========================
[00:19:47] [PASSED] xe_gmdid_graphics_ip
[00:19:47] [PASSED] xe_gmdid_media_ip
[00:19:47] ===================== [PASSED] xe_pci ======================
[00:19:47] ========================= xe_rtp  ==========================
[00:19:47] ================== xe_rtp_process_tests  ===================
[00:19:47] [PASSED] coalesce-same-reg
[00:19:47] [PASSED] no-match-no-add
[00:19:47] [PASSED] no-match-no-add-multiple-rules
[00:19:47] [PASSED] two-regs-two-entries
[00:19:47] [PASSED] clr-one-set-other
[00:19:47] [PASSED] set-field
[00:19:47] [PASSED] conflict-duplicate
[00:19:47] [PASSED] conflict-not-disjoint
[00:19:47] [PASSED] conflict-reg-type
[00:19:47] ============== [PASSED] xe_rtp_process_tests ===============
[00:19:47] ===================== [PASSED] xe_rtp ======================
[00:19:47] ========================== xe_wa  ==========================
[00:19:47] ======================== xe_wa_gt  =========================
[00:19:47] [PASSED] TIGERLAKE (B0)
[00:19:47] [PASSED] DG1 (A0)
[00:19:47] [PASSED] DG1 (B0)
[00:19:47] [PASSED] ALDERLAKE_S (A0)
[00:19:47] [PASSED] ALDERLAKE_S (B0)
[00:19:47] [PASSED] ALDERLAKE_S (C0)
[00:19:47] [PASSED] ALDERLAKE_S (D0)
[00:19:47] [PASSED] ALDERLAKE_P (A0)
[00:19:47] [PASSED] ALDERLAKE_P (B0)
[00:19:47] [PASSED] ALDERLAKE_P (C0)
[00:19:47] [PASSED] ALDERLAKE_S_RPLS (D0)
[00:19:47] [PASSED] ALDERLAKE_P_RPLU (E0)
[00:19:47] [PASSED] DG2_G10 (C0)
[00:19:47] [PASSED] DG2_G11 (B1)
[00:19:47] [PASSED] DG2_G12 (A1)
[00:19:47] [PASSED] PVC (B0)
[00:19:47] [PASSED] PVC (B1)
[00:19:47] [PASSED] PVC (C0)
[00:19:47] [PASSED] METEORLAKE (g:A0, m:A0)
[00:19:47] [PASSED] METEORLAKE (g:A0, m:A0)
[00:19:47] [PASSED] LUNARLAKE (g:A0, m:A0)
[00:19:47] [PASSED] LUNARLAKE (g:B0, m:A0)
[00:19:47] ==================== [PASSED] xe_wa_gt =====================
[00:19:47] ====================== [PASSED] xe_wa ======================
[00:19:47] ============================================================
[00:19:47] Testing complete. Ran 83 tests: passed: 72, skipped: 11
[00:19:47] Elapsed time: 27.840s total, 4.214s configuring, 23.407s building, 0.190s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[00:19:47] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:19:48] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[00:20:09] Starting KUnit Kernel (1/1)...
[00:20:09] ============================================================
[00:20:09] ================== drm_test_pick_cmdline  ==================
[00:20:09] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[00:20:09] =============== drm_test_pick_cmdline_named  ===============
[00:20:09] [PASSED] NTSC
[00:20:09] [PASSED] NTSC-J
[00:20:09] [PASSED] PAL
[00:20:09] [PASSED] PAL-M
[00:20:09] =========== [PASSED] drm_test_pick_cmdline_named ===========
[00:20:09] ============== [PASSED] drm_test_pick_cmdline ==============
[00:20:09] ======================== drm_buddy  ========================
[00:20:09] [PASSED] drm_test_buddy_alloc_limit
[00:20:09] [PASSED] drm_test_buddy_alloc_optimistic
[00:20:09] [PASSED] drm_test_buddy_alloc_pessimistic
[00:20:09] [PASSED] drm_test_buddy_alloc_pathological
[00:20:09] ==================== [PASSED] drm_buddy ====================
[00:20:09] =================== drm_cmdline_parser  ====================
[00:20:09] [PASSED] drm_test_cmdline_force_d_only
[00:20:09] [PASSED] drm_test_cmdline_force_D_only_dvi
[00:20:09] [PASSED] drm_test_cmdline_force_D_only_hdmi
[00:20:09] [PASSED] drm_test_cmdline_force_D_only_not_digital
[00:20:09] [PASSED] drm_test_cmdline_force_e_only
[00:20:09] [PASSED] drm_test_cmdline_res
[00:20:09] [PASSED] drm_test_cmdline_res_vesa
[00:20:09] [PASSED] drm_test_cmdline_res_vesa_rblank
[00:20:09] [PASSED] drm_test_cmdline_res_rblank
[00:20:09] [PASSED] drm_test_cmdline_res_bpp
[00:20:09] [PASSED] drm_test_cmdline_res_refresh
[00:20:09] [PASSED] drm_test_cmdline_res_bpp_refresh
[00:20:09] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[00:20:09] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[00:20:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[00:20:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[00:20:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[00:20:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[00:20:09] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[00:20:09] [PASSED] drm_test_cmdline_res_margins_force_on
[00:20:09] [PASSED] drm_test_cmdline_res_vesa_margins
[00:20:09] [PASSED] drm_test_cmdline_name
[00:20:09] [PASSED] drm_test_cmdline_name_bpp
[00:20:09] [PASSED] drm_test_cmdline_name_option
[00:20:09] [PASSED] drm_test_cmdline_name_bpp_option
[00:20:09] [PASSED] drm_test_cmdline_rotate_0
[00:20:09] [PASSED] drm_test_cmdline_rotate_90
[00:20:09] [PASSED] drm_test_cmdline_rotate_180
[00:20:09] [PASSED] drm_test_cmdline_rotate_270
[00:20:09] [PASSED] drm_test_cmdline_hmirror
[00:20:09] [PASSED] drm_test_cmdline_vmirror
[00:20:09] [PASSED] drm_test_cmdline_margin_options
[00:20:09] [PASSED] drm_test_cmdline_multiple_options
[00:20:09] [PASSED] drm_test_cmdline_bpp_extra_and_option
[00:20:09] [PASSED] drm_test_cmdline_extra_and_option
[00:20:09] [PASSED] drm_test_cmdline_freestanding_options
[00:20:09] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[00:20:09] [PASSED] drm_test_cmdline_panel_orientation
[00:20:09] ================ drm_test_cmdline_invalid  =================
[00:20:09] [PASSED] margin_only
[00:20:09] [PASSED] interlace_only
[00:20:09] [PASSED] res_missing_x
[00:20:09] [PASSED] res_missing_y
[00:20:09] [PASSED] res_bad_y
[00:20:09] [PASSED] res_missing_y_bpp
[00:20:09] [PASSED] res_bad_bpp
[00:20:09] [PASSED] res_bad_refresh
[00:20:09] [PASSED] res_bpp_refresh_force_on_off
[00:20:09] [PASSED] res_invalid_mode
[00:20:09] [PASSED] res_bpp_wrong_place_mode
[00:20:09] [PASSED] name_bpp_refresh
[00:20:09] [PASSED] name_refresh
[00:20:09] [PASSED] name_refresh_wrong_mode
[00:20:09] [PASSED] name_refresh_invalid_mode
[00:20:09] [PASSED] rotate_multiple
[00:20:09] [PASSED] rotate_invalid_val
[00:20:09] [PASSED] rotate_truncated
[00:20:09] [PASSED] invalid_option
[00:20:09] [PASSED] invalid_tv_option
[00:20:09] [PASSED] truncated_tv_option
[00:20:09] ============ [PASSED] drm_test_cmdline_invalid =============
[00:20:09] =============== drm_test_cmdline_tv_options  ===============
[00:20:09] [PASSED] NTSC
[00:20:09] [PASSED] NTSC_443
[00:20:09] [PASSED] NTSC_J
[00:20:09] [PASSED] PAL
[00:20:09] [PASSED] PAL_M
[00:20:09] [PASSED] PAL_N
[00:20:09] [PASSED] SECAM
[00:20:09] =========== [PASSED] drm_test_cmdline_tv_options ===========
[00:20:09] =============== [PASSED] drm_cmdline_parser ================
[00:20:09] ================ drm_get_tv_mode_from_name  ================
[00:20:09] ========== drm_test_get_tv_mode_from_name_valid  ===========
[00:20:09] [PASSED] NTSC
[00:20:09] [PASSED] NTSC-443
[00:20:09] [PASSED] NTSC-J
[00:20:09] [PASSED] PAL
[00:20:09] [PASSED] PAL-M
[00:20:09] [PASSED] PAL-N
[00:20:09] [PASSED] SECAM
[00:20:09] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[00:20:09] [PASSED] drm_test_get_tv_mode_from_name_truncated
[00:20:09] ============ [PASSED] drm_get_tv_mode_from_name ============
[00:20:09] ==================== drm_damage_helper  ====================
[00:20:09] [PASSED] drm_test_damage_iter_no_damage
[00:20:09] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[00:20:09] [PASSED] drm_test_damage_iter_no_damage_src_moved
[00:20:09] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[00:20:09] [PASSED] drm_test_damage_iter_no_damage_not_visible
[00:20:09] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[00:20:09] [PASSED] drm_test_damage_iter_no_damage_no_fb
[00:20:09] [PASSED] drm_test_damage_iter_simple_damage
[00:20:09] [PASSED] drm_test_damage_iter_single_damage
[00:20:09] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[00:20:09] [PASSED] drm_test_damage_iter_single_damage_outside_src
[00:20:09] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[00:20:09] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[00:20:09] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[00:20:09] [PASSED] drm_test_damage_iter_single_damage_src_moved
[00:20:09] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[00:20:09] [PASSED] drm_test_damage_iter_damage
[00:20:09] [PASSED] drm_test_damage_iter_damage_one_intersect
[00:20:09] [PASSED] drm_test_damage_iter_damage_one_outside
[00:20:09] [PASSED] drm_test_damage_iter_damage_src_moved
[00:20:09] [PASSED] drm_test_damage_iter_damage_not_visible
[00:20:09] ================ [PASSED] drm_damage_helper ================
[00:20:09] ==================== drm_dp_mst_helper  ====================
[00:20:09] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[00:20:09] [PASSED] Clock 154000 BPP 30 DSC disabled
[00:20:09] [PASSED] Clock 234000 BPP 30 DSC disabled
[00:20:09] [PASSED] Clock 297000 BPP 24 DSC disabled
[00:20:09] [PASSED] Clock 332880 BPP 24 DSC enabled
[00:20:09] [PASSED] Clock 324540 BPP 24 DSC enabled
[00:20:09] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[00:20:09] ============== drm_test_dp_mst_calc_pbn_div  ===============
[00:20:09] [PASSED] Link rate 2000000 lane count 4
[00:20:09] [PASSED] Link rate 2000000 lane count 2
[00:20:09] [PASSED] Link rate 2000000 lane count 1
[00:20:09] [PASSED] Link rate 1350000 lane count 4
[00:20:09] [PASSED] Link rate 1350000 lane count 2
[00:20:09] [PASSED] Link rate 1350000 lane count 1
[00:20:09] [PASSED] Link rate 1000000 lane count 4
[00:20:09] [PASSED] Link rate 1000000 lane count 2
[00:20:09] [PASSED] Link rate 1000000 lane count 1
[00:20:09] [PASSED] Link rate 810000 lane count 4
[00:20:09] [PASSED] Link rate 810000 lane count 2
[00:20:09] [PASSED] Link rate 810000 lane count 1
[00:20:09] [PASSED] Link rate 540000 lane count 4
[00:20:09] [PASSED] Link rate 540000 lane count 2
[00:20:09] [PASSED] Link rate 540000 lane count 1
[00:20:09] [PASSED] Link rate 270000 lane count 4
[00:20:09] [PASSED] Link rate 270000 lane count 2
[00:20:09] [PASSED] Link rate 270000 lane count 1
[00:20:09] [PASSED] Link rate 162000 lane count 4
[00:20:09] [PASSED] Link rate 162000 lane count 2
[00:20:09] [PASSED] Link rate 162000 lane count 1
[00:20:09] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[00:20:09] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[00:20:09] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[00:20:09] [PASSED] DP_POWER_UP_PHY with port number
[00:20:09] [PASSED] DP_POWER_DOWN_PHY with port number
[00:20:09] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[00:20:09] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[00:20:09] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[00:20:09] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[00:20:09] [PASSED] DP_QUERY_PAYLOAD with port number
[00:20:09] [PASSED] DP_QUERY_PAYLOAD with VCPI
[00:20:09] [PASSED] DP_REMOTE_DPCD_READ with port number
[00:20:09] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[00:20:09] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[00:20:09] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[00:20:09] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[00:20:09] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[00:20:09] [PASSED] DP_REMOTE_I2C_READ with port number
[00:20:09] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[00:20:09] [PASSED] DP_REMOTE_I2C_READ with transactions array
[00:20:09] [PASSED] DP_REMOTE_I2C_WRITE with port number
[00:20:09] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[00:20:09] [PASSED] DP_REMOTE_I2C_WRITE with data array
[00:20:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[00:20:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[00:20:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[00:20:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[00:20:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[00:20:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[00:20:09] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[00:20:09] ================ [PASSED] drm_dp_mst_helper ================
[00:20:09] ======================== drm_exec  =========================
[00:20:09] [PASSED] sanitycheck
[00:20:09] [PASSED] test_lock
[00:20:09] [PASSED] test_lock_unlock
[00:20:09] [PASSED] test_duplicates
[00:20:09] [PASSED] test_prepare
[00:20:09] [PASSED] test_prepare_array
[00:20:09] [PASSED] test_multiple_loops
[00:20:09] ==================== [PASSED] drm_exec =====================
[00:20:09] ================= drm_format_helper_test  ==================
[00:20:09] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[00:20:09] [PASSED] single_pixel_source_buffer
[00:20:09] [PASSED] single_pixel_clip_rectangle
[00:20:09] [PASSED] well_known_colors
[00:20:09] [PASSED] destination_pitch
[00:20:09] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[00:20:09] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[00:20:09] [PASSED] single_pixel_source_buffer
[00:20:09] [PASSED] single_pixel_clip_rectangle
[00:20:09] [PASSED] well_known_colors
[00:20:09] [PASSED] destination_pitch
[00:20:09] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[00:20:09] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[00:20:09] [PASSED] single_pixel_source_buffer
[00:20:09] [PASSED] single_pixel_clip_rectangle
[00:20:09] [PASSED] well_known_colors
[00:20:09] [PASSED] destination_pitch
[00:20:09] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[00:20:09] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[00:20:09] [PASSED] single_pixel_source_buffer
[00:20:09] [PASSED] single_pixel_clip_rectangle
[00:20:09] [PASSED] well_known_colors
[00:20:09] [PASSED] destination_pitch
[00:20:09] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[00:20:09] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[00:20:09] [PASSED] single_pixel_source_buffer
[00:20:09] [PASSED] single_pixel_clip_rectangle
[00:20:09] [PASSED] well_known_colors
[00:20:09] [PASSED] destination_pitch
[00:20:09] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[00:20:09] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[00:20:09] [PASSED] single_pixel_source_buffer
[00:20:09] [PASSED] single_pixel_clip_rectangle
[00:20:09] [PASSED] well_known_colors
[00:20:09] [PASSED] destination_pitch
[00:20:09] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[00:20:09] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[00:20:09] [PASSED] single_pixel_source_buffer
[00:20:09] [PASSED] single_pixel_clip_rectangle
[00:20:09] [PASSED] well_known_colors
[00:20:09] [PASSED] destination_pitch
[00:20:09] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[00:20:09] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[00:20:09] [PASSED] single_pixel_source_buffer
[00:20:09] [PASSED] single_pixel_clip_rectangle
[00:20:09] [PASSED] well_known_colors
[00:20:09] [PASSED] destination_pitch
[00:20:09] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[00:20:09] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[00:20:09] [PASSED] single_pixel_source_buffer
[00:20:09] [PASSED] single_pixel_clip_rectangle
[00:20:09] [PASSED] well_known_colors
[00:20:09] [PASSED] destination_pitch
[00:20:09] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[00:20:09] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[00:20:09] [PASSED] single_pixel_source_buffer
[00:20:09] [PASSED] single_pixel_clip_rectangle
[00:20:09] [PASSED] well_known_colors
[00:20:09] [PASSED] destination_pitch
[00:20:09] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[00:20:09] ============== drm_test_fb_xrgb8888_to_mono  ===============
[00:20:09] [PASSED] single_pixel_source_buffer
[00:20:09] [PASSED] single_pixel_clip_rectangle
[00:20:09] [PASSED] well_known_colors
[00:20:09] [PASSED] destination_pitch
[00:20:09] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[00:20:09] ==================== drm_test_fb_swab  =====================
[00:20:09] [PASSED] single_pixel_source_buffer
[00:20:09] [PASSED] single_pixel_clip_rectangle
[00:20:09] [PASSED] well_known_colors
[00:20:09] [PASSED] destination_pitch
[00:20:09] ================ [PASSED] drm_test_fb_swab =================
[00:20:09] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[00:20:09] [PASSED] single_pixel_source_buffer
[00:20:09] [PASSED] single_pixel_clip_rectangle
[00:20:09] [PASSED] well_known_colors
[00:20:09] [PASSED] destination_pitch
[00:20:09] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[00:20:09] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[00:20:09] [PASSED] single_pixel_source_buffer
[00:20:09] [PASSED] single_pixel_clip_rectangle
[00:20:09] [PASSED] well_known_colors
[00:20:09] [PASSED] destination_pitch
[00:20:09] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[00:20:09] ================= drm_test_fb_clip_offset  =================
[00:20:09] [PASSED] pass through
[00:20:09] [PASSED] horizontal offset
[00:20:09] [PASSED] vertical offset
[00:20:09] [PASSED] horizontal and vertical offset
[00:20:09] [PASSED] horizontal offset (custom pitch)
[00:20:09] [PASSED] vertical offset (custom pitch)
[00:20:09] [PASSED] horizontal and vertical offset (custom pitch)
[00:20:09] ============= [PASSED] drm_test_fb_clip_offset =============
[00:20:09] ============== drm_test_fb_build_fourcc_list  ==============
[00:20:09] [PASSED] no native formats
[00:20:09] [PASSED] XRGB8888 as native format
[00:20:09] [PASSED] remove duplicates
[00:20:09] [PASSED] convert alpha formats
[00:20:09] [PASSED] random formats
[00:20:09] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[00:20:09] =================== drm_test_fb_memcpy  ====================
[00:20:09] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[00:20:09] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[00:20:09] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[00:20:09] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[00:20:09] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[00:20:09] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[00:20:09] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[00:20:09] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[00:20:09] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[00:20:09] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[00:20:09] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[00:20:09] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[00:20:09] =============== [PASSED] drm_test_fb_memcpy ================
[00:20:09] ============= [PASSED] drm_format_helper_test ==============
[00:20:09] ======================= drm_format  ========================
[00:20:09] [PASSED] drm_test_format_block_width_invalid
[00:20:09] [PASSED] drm_test_format_block_width_one_plane
[00:20:09] [PASSED] drm_test_format_block_width_two_plane
[00:20:09] [PASSED] drm_test_format_block_width_three_plane
[00:20:09] [PASSED] drm_test_format_block_width_tiled
[00:20:09] [PASSED] drm_test_format_block_height_invalid
[00:20:09] [PASSED] drm_test_format_block_height_one_plane
[00:20:09] [PASSED] drm_test_format_block_height_two_plane
[00:20:09] [PASSED] drm_test_format_block_height_three_plane
[00:20:09] [PASSED] drm_test_format_block_height_tiled
[00:20:09] [PASSED] drm_test_format_min_pitch_invalid
[00:20:09] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[00:20:09] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[00:20:09] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[00:20:09] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[00:20:09] [PASSED] drm_test_format_min_pitch_two_plane
[00:20:09] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[00:20:09] [PASSED] drm_test_format_min_pitch_tiled
[00:20:09] =================== [PASSED] drm_format ====================
[00:20:09] ===================== drm_framebuffer  =====================
[00:20:09] =============== drm_test_framebuffer_create  ===============
[00:20:09] [PASSED] ABGR8888 normal sizes
[00:20:09] [PASSED] ABGR8888 max sizes
[00:20:09] [PASSED] ABGR8888 pitch greater than min required
[00:20:09] [PASSED] ABGR8888 pitch less than min required
[00:20:09] [PASSED] ABGR8888 Invalid width
[00:20:09] [PASSED] ABGR8888 Invalid buffer handle
[00:20:09] [PASSED] No pixel format
[00:20:09] [PASSED] ABGR8888 Width 0
[00:20:09] [PASSED] ABGR8888 Height 0
[00:20:09] [PASSED] ABGR8888 Out of bound height * pitch combination
[00:20:09] [PASSED] ABGR8888 Large buffer offset
[00:20:09] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[00:20:09] [PASSED] ABGR8888 Valid buffer modifier
[00:20:09] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[00:20:09] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[00:20:09] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[00:20:09] [PASSED] NV12 Normal sizes
[00:20:09] [PASSED] NV12 Max sizes
[00:20:09] [PASSED] NV12 Invalid pitch
[00:20:09] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[00:20:09] [PASSED] NV12 different  modifier per-plane
[00:20:09] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[00:20:09] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[00:20:09] [PASSED] NV12 Modifier for inexistent plane
[00:20:09] [PASSED] NV12 Handle for inexistent plane
[00:20:09] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[00:20:09] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[00:20:09] [PASSED] YVU420 Normal sizes
[00:20:09] [PASSED] YVU420 Max sizes
[00:20:09] [PASSED] YVU420 Invalid pitch
[00:20:09] [PASSED] YVU420 Different pitches
[00:20:09] [PASSED] YVU420 Different buffer offsets/pitches
[00:20:09] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[00:20:09] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[00:20:09] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[00:20:09] [PASSED] YVU420 Valid modifier
[00:20:09] [PASSED] YVU420 Different modifiers per plane
[00:20:09] [PASSED] YVU420 Modifier for inexistent plane
[00:20:09] [PASSED] X0L2 Normal sizes
[00:20:09] [PASSED] X0L2 Max sizes
[00:20:09] [PASSED] X0L2 Invalid pitch
[00:20:09] [PASSED] X0L2 Pitch greater than minimum required
[00:20:09] [PASSED] X0L2 Handle for inexistent plane
[00:20:09] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[00:20:09] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[00:20:09] [PASSED] X0L2 Valid modifier
[00:20:09] [PASSED] X0L2 Modifier for inexistent plane
[00:20:09] =========== [PASSED] drm_test_framebuffer_create ===========
[00:20:09] ================= [PASSED] drm_framebuffer =================
[00:20:09] ====================== drm_gem_shmem  ======================
[00:20:09] [PASSED] drm_gem_shmem_test_obj_create
[00:20:09] [PASSED] drm_gem_shmem_test_obj_create_private
[00:20:09] [PASSED] drm_gem_shmem_test_pin_pages
[00:20:09] [PASSED] drm_gem_shmem_test_vmap
[00:20:09] [PASSED] drm_gem_shmem_test_get_pages_sgt
[00:20:09] [PASSED] drm_gem_shmem_test_get_sg_table
[00:20:09] [PASSED] drm_gem_shmem_test_madvise
[00:20:09] [PASSED] drm_gem_shmem_test_purge
[00:20:09] ================== [PASSED] drm_gem_shmem ==================
[00:20:09] ======================= drm_managed  =======================
[00:20:09] [PASSED] drm_test_managed_release_action
[00:20:09] [PASSED] drm_test_managed_run_action
[00:20:09] =================== [PASSED] drm_managed ===================
[00:20:09] ========================= drm_mm  ==========================
[00:20:09] [PASSED] drm_test_mm_init
[00:20:09] [PASSED] drm_test_mm_debug
[00:20:09] [PASSED] drm_test_mm_align32
[00:20:09] [PASSED] drm_test_mm_align64
[00:20:09] [PASSED] drm_test_mm_lowest
[00:20:09] [PASSED] drm_test_mm_highest
[00:20:09] ===================== [PASSED] drm_mm ======================
[00:20:09] =================== drm_modes_analog_tv  ===================
[00:20:09] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[00:20:09] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[00:20:09] [PASSED] drm_test_modes_analog_tv_pal_576i
[00:20:09] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[00:20:09] =============== [PASSED] drm_modes_analog_tv ===============
[00:20:09] ==================== drm_plane_helper  =====================
[00:20:09] =============== drm_test_check_plane_state  ================
[00:20:09] [PASSED] clipping_simple
[00:20:09] [PASSED] clipping_rotate_reflect
[00:20:09] [PASSED] positioning_simple
[00:20:09] [PASSED] upscaling
[00:20:09] [PASSED] downscaling
[00:20:09] [PASSED] rounding1
[00:20:09] [PASSED] rounding2
[00:20:09] [PASSED] rounding3
[00:20:09] [PASSED] rounding4
[00:20:09] =========== [PASSED] drm_test_check_plane_state ============
[00:20:09] =========== drm_test_check_invalid_plane_state  ============
[00:20:09] [PASSED] positioning_invalid
[00:20:09] [PASSED] upscaling_invalid
[00:20:09] [PASSED] downscaling_invalid
[00:20:09] ======= [PASSED] drm_test_check_invalid_plane_state ========
[00:20:09] ================ [PASSED] drm_plane_helper =================
[00:20:09] ============ drm_connector_helper_tv_get_modes  ============
[00:20:09] ====== drm_test_connector_helper_tv_get_modes_check  =======
[00:20:09] [PASSED] None
[00:20:09] [PASSED] PAL
[00:20:09] [PASSED] NTSC
[00:20:09] [PASSED] Both, NTSC Default
[00:20:09] [PASSED] Both, PAL Default
[00:20:09] [PASSED] Both, NTSC Default, with PAL on command-line
[00:20:09] [PASSED] Both, PAL Default, with NTSC on command-line
[00:20:09] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[00:20:09] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[00:20:09] ======================== drm_rect  =========================
[00:20:09] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[00:20:09] [PASSED] drm_test_rect_clip_scaled_not_clipped
[00:20:09] [PASSED] drm_test_rect_clip_scaled_clipped
[00:20:09] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[00:20:09] ================= drm_test_rect_intersect  =================
[00:20:09] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
stty: 'standard input': Inappropriate ioctl for device
[00:20:09] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[00:20:09] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[00:20:09] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[00:20:09] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[00:20:09] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[00:20:09] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[00:20:09] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[00:20:09] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[00:20:09] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[00:20:09] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[00:20:09] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[00:20:09] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[00:20:09] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[00:20:09] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[00:20:09] ============= [PASSED] drm_test_rect_intersect =============
[00:20:09] ================ drm_test_rect_calc_hscale  ================
[00:20:09] [PASSED] normal use
[00:20:09] [PASSED] out of max range
[00:20:09] [PASSED] out of min range
[00:20:09] [PASSED] zero dst
[00:20:09] [PASSED] negative src
[00:20:09] [PASSED] negative dst
[00:20:09] ============ [PASSED] drm_test_rect_calc_hscale ============
[00:20:09] ================ drm_test_rect_calc_vscale  ================
[00:20:09] [PASSED] normal use
[00:20:09] [PASSED] out of max range
[00:20:09] [PASSED] out of min range
[00:20:09] [PASSED] zero dst
[00:20:09] [PASSED] negative src
[00:20:09] [PASSED] negative dst
[00:20:09] ============ [PASSED] drm_test_rect_calc_vscale ============
[00:20:09] ================== drm_test_rect_rotate  ===================
[00:20:09] [PASSED] reflect-x
[00:20:09] [PASSED] reflect-y
[00:20:09] [PASSED] rotate-0
[00:20:09] [PASSED] rotate-90
[00:20:09] [PASSED] rotate-180
[00:20:09] [PASSED] rotate-270
[00:20:09] ============== [PASSED] drm_test_rect_rotate ===============
[00:20:09] ================ drm_test_rect_rotate_inv  =================
[00:20:09] [PASSED] reflect-x
[00:20:09] [PASSED] reflect-y
[00:20:09] [PASSED] rotate-0
[00:20:09] [PASSED] rotate-90
[00:20:09] [PASSED] rotate-180
[00:20:09] [PASSED] rotate-270
[00:20:09] ============ [PASSED] drm_test_rect_rotate_inv =============
[00:20:09] ==================== [PASSED] drm_rect =====================
[00:20:09] ============================================================
[00:20:09] Testing complete. Ran 391 tests: passed: 391
[00:20:09] Elapsed time: 22.015s total, 1.673s configuring, 20.220s building, 0.120s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


