Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A7CC46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 13:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E7710E423;
	Tue,  9 Jan 2024 13:02:23 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3865810E423;
 Tue,  9 Jan 2024 13:02:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Silence_a_number_of_?=
 =?utf-8?q?sparse_warnings?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 09 Jan 2024 13:02:22 -0000
Message-ID: <170480534223.215663.8272572146693733885@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240109112405.108136-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240109112405.108136-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Silence a number of sparse warnings
URL   : https://patchwork.freedesktop.org/series/128368/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[13:01:30] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:01:34] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[13:01:57] Starting KUnit Kernel (1/1)...
[13:01:57] ============================================================
[13:01:57] ========================= guc_dbm  =========================
[13:01:57] [PASSED] test_empty
[13:01:57] [PASSED] test_default
[13:01:57] ======================== test_size  ========================
[13:01:57] [PASSED] 4
[13:01:57] [PASSED] 8
[13:01:57] [PASSED] 32
[13:01:57] [PASSED] 256
[13:01:57] ==================== [PASSED] test_size ====================
[13:01:57] ======================= test_reuse  ========================
[13:01:57] [PASSED] 4
[13:01:57] [PASSED] 8
[13:01:57] [PASSED] 32
[13:01:57] [PASSED] 256
[13:01:57] =================== [PASSED] test_reuse ====================
[13:01:57] =================== test_range_overlap  ====================
[13:01:57] [PASSED] 4
[13:01:57] [PASSED] 8
[13:01:57] [PASSED] 32
[13:01:57] [PASSED] 256
[13:01:57] =============== [PASSED] test_range_overlap ================
[13:01:57] =================== test_range_compact  ====================
[13:01:57] [PASSED] 4
[13:01:57] [PASSED] 8
[13:01:57] [PASSED] 32
[13:01:57] [PASSED] 256
[13:01:57] =============== [PASSED] test_range_compact ================
[13:01:57] ==================== test_range_spare  =====================
[13:01:57] [PASSED] 4
[13:01:57] [PASSED] 8
[13:01:57] [PASSED] 32
[13:01:57] [PASSED] 256
[13:01:57] ================ [PASSED] test_range_spare =================
[13:01:57] ===================== [PASSED] guc_dbm =====================
[13:01:57] ======================== no_relay  =========================
[13:01:57] [PASSED] xe_drops_guc2pf_if_not_ready
[13:01:57] [PASSED] xe_drops_guc2vf_if_not_ready
[13:01:57] [PASSED] xe_rejects_send_if_not_ready
[13:01:57] ==================== [PASSED] no_relay =====================
[13:01:57] ======================== pf_relay  =========================
[13:01:57] [PASSED] pf_rejects_guc2pf_too_short
[13:01:57] [PASSED] pf_rejects_guc2pf_too_long
[13:01:57] [PASSED] pf_rejects_guc2pf_no_payload
[13:01:57] [PASSED] pf_fails_no_payload
[13:01:57] [PASSED] pf_fails_bad_origin
[13:01:57] [PASSED] pf_fails_bad_type
[13:01:57] [PASSED] pf_txn_reports_error
[13:01:57] [PASSED] pf_txn_sends_pf2guc
[13:01:57] [PASSED] pf_sends_pf2guc
[13:01:57] [SKIPPED] pf_loopback_nop
[13:01:57] [SKIPPED] pf_loopback_echo
[13:01:57] [SKIPPED] pf_loopback_fail
[13:01:57] [SKIPPED] pf_loopback_busy
[13:01:57] [SKIPPED] pf_loopback_retry
[13:01:57] ==================== [PASSED] pf_relay =====================
[13:01:57] ======================== vf_relay  =========================
[13:01:57] [PASSED] vf_rejects_guc2vf_too_short
[13:01:57] [PASSED] vf_rejects_guc2vf_too_long
[13:01:57] [PASSED] vf_rejects_guc2vf_no_payload
[13:01:57] ==================== [PASSED] vf_relay =====================
[13:01:57] ========================== lmtt  ===========================
[13:01:57] ======================== test_ops  =========================
[13:01:57] [PASSED] 2-level
[13:01:57] [PASSED] multi-level
[13:01:57] ==================== [PASSED] test_ops =====================
[13:01:57] ====================== [PASSED] lmtt =======================
[13:01:57] ========================== xe_bo  ==========================
[13:01:57] [SKIPPED] xe_ccs_migrate_kunit
[13:01:57] [SKIPPED] xe_bo_evict_kunit
[13:01:57] ===================== [SKIPPED] xe_bo ======================
[13:01:57] ======================= xe_dma_buf  ========================
[13:01:57] [SKIPPED] xe_dma_buf_kunit
[13:01:57] =================== [SKIPPED] xe_dma_buf ===================
[13:01:57] ======================= xe_migrate  ========================
[13:01:57] [SKIPPED] xe_migrate_sanity_kunit
[13:01:57] =================== [SKIPPED] xe_migrate ===================
[13:01:57] ========================= xe_mocs  =========================
[13:01:57] [SKIPPED] xe_live_mocs_kernel_kunit
[13:01:57] [SKIPPED] xe_live_mocs_reset_kunit
[13:01:57] ==================== [SKIPPED] xe_mocs =====================
[13:01:57] ========================= xe_pci  ==========================
[13:01:57] [PASSED] xe_gmdid_graphics_ip
[13:01:57] [PASSED] xe_gmdid_media_ip
[13:01:57] ===================== [PASSED] xe_pci ======================
[13:01:57] ========================= xe_rtp  ==========================
[13:01:57] ================== xe_rtp_process_tests  ===================
[13:01:57] [PASSED] coalesce-same-reg
[13:01:57] [PASSED] no-match-no-add
[13:01:57] [PASSED] no-match-no-add-multiple-rules
[13:01:57] [PASSED] two-regs-two-entries
[13:01:57] [PASSED] clr-one-set-other
[13:01:57] [PASSED] set-field
[13:01:57] [PASSED] conflict-duplicate
[13:01:57] [PASSED] conflict-not-disjoint
[13:01:57] [PASSED] conflict-reg-type
[13:01:57] ============== [PASSED] xe_rtp_process_tests ===============
[13:01:57] ===================== [PASSED] xe_rtp ======================
[13:01:57] ========================== xe_wa  ==========================
[13:01:57] ======================== xe_wa_gt  =========================
[13:01:57] [PASSED] TIGERLAKE (B0)
[13:01:57] [PASSED] DG1 (A0)
[13:01:57] [PASSED] DG1 (B0)
[13:01:57] [PASSED] ALDERLAKE_S (A0)
[13:01:57] [PASSED] ALDERLAKE_S (B0)
[13:01:57] [PASSED] ALDERLAKE_S (C0)
[13:01:57] [PASSED] ALDERLAKE_S (D0)
[13:01:57] [PASSED] ALDERLAKE_P (A0)
[13:01:57] [PASSED] ALDERLAKE_P (B0)
[13:01:57] [PASSED] ALDERLAKE_P (C0)
[13:01:57] [PASSED] ALDERLAKE_S_RPLS (D0)
[13:01:57] [PASSED] ALDERLAKE_P_RPLU (E0)
[13:01:57] [PASSED] DG2_G10 (C0)
[13:01:57] [PASSED] DG2_G11 (B1)
[13:01:57] [PASSED] DG2_G12 (A1)
[13:01:57] [PASSED] PVC (B0)
[13:01:57] [PASSED] PVC (B1)
[13:01:57] [PASSED] PVC (C0)
[13:01:57] [PASSED] METEORLAKE (g:A0, m:A0)
[13:01:57] [PASSED] METEORLAKE (g:A0, m:A0)
[13:01:57] [PASSED] LUNARLAKE (g:A0, m:A0)
[13:01:57] [PASSED] LUNARLAKE (g:B0, m:A0)
[13:01:57] ==================== [PASSED] xe_wa_gt =====================
[13:01:57] ====================== [PASSED] xe_wa ======================
[13:01:57] ============================================================
[13:01:57] Testing complete. Ran 83 tests: passed: 72, skipped: 11
[13:01:57] Elapsed time: 27.556s total, 4.214s configuring, 23.121s building, 0.183s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[13:01:57] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:01:59] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[13:02:19] Starting KUnit Kernel (1/1)...
[13:02:19] ============================================================
[13:02:20] ================== drm_test_pick_cmdline  ==================
[13:02:20] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[13:02:20] =============== drm_test_pick_cmdline_named  ===============
[13:02:20] [PASSED] NTSC
[13:02:20] [PASSED] NTSC-J
[13:02:20] [PASSED] PAL
[13:02:20] [PASSED] PAL-M
[13:02:20] =========== [PASSED] drm_test_pick_cmdline_named ===========
[13:02:20] ============== [PASSED] drm_test_pick_cmdline ==============
[13:02:20] ======================== drm_buddy  ========================
[13:02:20] [PASSED] drm_test_buddy_alloc_limit
[13:02:20] [PASSED] drm_test_buddy_alloc_optimistic
[13:02:20] [PASSED] drm_test_buddy_alloc_pessimistic
[13:02:20] [PASSED] drm_test_buddy_alloc_pathological
[13:02:20] ==================== [PASSED] drm_buddy ====================
[13:02:20] =================== drm_cmdline_parser  ====================
[13:02:20] [PASSED] drm_test_cmdline_force_d_only
[13:02:20] [PASSED] drm_test_cmdline_force_D_only_dvi
[13:02:20] [PASSED] drm_test_cmdline_force_D_only_hdmi
[13:02:20] [PASSED] drm_test_cmdline_force_D_only_not_digital
[13:02:20] [PASSED] drm_test_cmdline_force_e_only
[13:02:20] [PASSED] drm_test_cmdline_res
[13:02:20] [PASSED] drm_test_cmdline_res_vesa
[13:02:20] [PASSED] drm_test_cmdline_res_vesa_rblank
[13:02:20] [PASSED] drm_test_cmdline_res_rblank
[13:02:20] [PASSED] drm_test_cmdline_res_bpp
[13:02:20] [PASSED] drm_test_cmdline_res_refresh
[13:02:20] [PASSED] drm_test_cmdline_res_bpp_refresh
[13:02:20] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[13:02:20] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[13:02:20] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[13:02:20] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[13:02:20] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[13:02:20] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[13:02:20] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[13:02:20] [PASSED] drm_test_cmdline_res_margins_force_on
[13:02:20] [PASSED] drm_test_cmdline_res_vesa_margins
[13:02:20] [PASSED] drm_test_cmdline_name
[13:02:20] [PASSED] drm_test_cmdline_name_bpp
[13:02:20] [PASSED] drm_test_cmdline_name_option
[13:02:20] [PASSED] drm_test_cmdline_name_bpp_option
[13:02:20] [PASSED] drm_test_cmdline_rotate_0
[13:02:20] [PASSED] drm_test_cmdline_rotate_90
[13:02:20] [PASSED] drm_test_cmdline_rotate_180
[13:02:20] [PASSED] drm_test_cmdline_rotate_270
[13:02:20] [PASSED] drm_test_cmdline_hmirror
[13:02:20] [PASSED] drm_test_cmdline_vmirror
[13:02:20] [PASSED] drm_test_cmdline_margin_options
[13:02:20] [PASSED] drm_test_cmdline_multiple_options
[13:02:20] [PASSED] drm_test_cmdline_bpp_extra_and_option
[13:02:20] [PASSED] drm_test_cmdline_extra_and_option
[13:02:20] [PASSED] drm_test_cmdline_freestanding_options
[13:02:20] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[13:02:20] [PASSED] drm_test_cmdline_panel_orientation
[13:02:20] ================ drm_test_cmdline_invalid  =================
[13:02:20] [PASSED] margin_only
[13:02:20] [PASSED] interlace_only
[13:02:20] [PASSED] res_missing_x
[13:02:20] [PASSED] res_missing_y
[13:02:20] [PASSED] res_bad_y
[13:02:20] [PASSED] res_missing_y_bpp
[13:02:20] [PASSED] res_bad_bpp
[13:02:20] [PASSED] res_bad_refresh
[13:02:20] [PASSED] res_bpp_refresh_force_on_off
[13:02:20] [PASSED] res_invalid_mode
[13:02:20] [PASSED] res_bpp_wrong_place_mode
[13:02:20] [PASSED] name_bpp_refresh
[13:02:20] [PASSED] name_refresh
[13:02:20] [PASSED] name_refresh_wrong_mode
[13:02:20] [PASSED] name_refresh_invalid_mode
[13:02:20] [PASSED] rotate_multiple
[13:02:20] [PASSED] rotate_invalid_val
[13:02:20] [PASSED] rotate_truncated
[13:02:20] [PASSED] invalid_option
[13:02:20] [PASSED] invalid_tv_option
[13:02:20] [PASSED] truncated_tv_option
[13:02:20] ============ [PASSED] drm_test_cmdline_invalid =============
[13:02:20] =============== drm_test_cmdline_tv_options  ===============
[13:02:20] [PASSED] NTSC
[13:02:20] [PASSED] NTSC_443
[13:02:20] [PASSED] NTSC_J
[13:02:20] [PASSED] PAL
[13:02:20] [PASSED] PAL_M
[13:02:20] [PASSED] PAL_N
[13:02:20] [PASSED] SECAM
[13:02:20] =========== [PASSED] drm_test_cmdline_tv_options ===========
[13:02:20] =============== [PASSED] drm_cmdline_parser ================
[13:02:20] ================ drm_get_tv_mode_from_name  ================
[13:02:20] ========== drm_test_get_tv_mode_from_name_valid  ===========
[13:02:20] [PASSED] NTSC
[13:02:20] [PASSED] NTSC-443
[13:02:20] [PASSED] NTSC-J
[13:02:20] [PASSED] PAL
[13:02:20] [PASSED] PAL-M
[13:02:20] [PASSED] PAL-N
[13:02:20] [PASSED] SECAM
[13:02:20] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[13:02:20] [PASSED] drm_test_get_tv_mode_from_name_truncated
[13:02:20] ============ [PASSED] drm_get_tv_mode_from_name ============
[13:02:20] ==================== drm_damage_helper  ====================
[13:02:20] [PASSED] drm_test_damage_iter_no_damage
[13:02:20] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[13:02:20] [PASSED] drm_test_damage_iter_no_damage_src_moved
[13:02:20] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[13:02:20] [PASSED] drm_test_damage_iter_no_damage_not_visible
[13:02:20] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[13:02:20] [PASSED] drm_test_damage_iter_no_damage_no_fb
[13:02:20] [PASSED] drm_test_damage_iter_simple_damage
[13:02:20] [PASSED] drm_test_damage_iter_single_damage
[13:02:20] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[13:02:20] [PASSED] drm_test_damage_iter_single_damage_outside_src
[13:02:20] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[13:02:20] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[13:02:20] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[13:02:20] [PASSED] drm_test_damage_iter_single_damage_src_moved
[13:02:20] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[13:02:20] [PASSED] drm_test_damage_iter_damage
[13:02:20] [PASSED] drm_test_damage_iter_damage_one_intersect
[13:02:20] [PASSED] drm_test_damage_iter_damage_one_outside
[13:02:20] [PASSED] drm_test_damage_iter_damage_src_moved
[13:02:20] [PASSED] drm_test_damage_iter_damage_not_visible
[13:02:20] ================ [PASSED] drm_damage_helper ================
[13:02:20] ==================== drm_dp_mst_helper  ====================
[13:02:20] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[13:02:20] [PASSED] Clock 154000 BPP 30 DSC disabled
[13:02:20] [PASSED] Clock 234000 BPP 30 DSC disabled
[13:02:20] [PASSED] Clock 297000 BPP 24 DSC disabled
[13:02:20] [PASSED] Clock 332880 BPP 24 DSC enabled
[13:02:20] [PASSED] Clock 324540 BPP 24 DSC enabled
[13:02:20] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[13:02:20] ============== drm_test_dp_mst_calc_pbn_div  ===============
[13:02:20] [PASSED] Link rate 2000000 lane count 4
[13:02:20] [PASSED] Link rate 2000000 lane count 2
[13:02:20] [PASSED] Link rate 2000000 lane count 1
[13:02:20] [PASSED] Link rate 1350000 lane count 4
[13:02:20] [PASSED] Link rate 1350000 lane count 2
[13:02:20] [PASSED] Link rate 1350000 lane count 1
[13:02:20] [PASSED] Link rate 1000000 lane count 4
[13:02:20] [PASSED] Link rate 1000000 lane count 2
[13:02:20] [PASSED] Link rate 1000000 lane count 1
[13:02:20] [PASSED] Link rate 810000 lane count 4
[13:02:20] [PASSED] Link rate 810000 lane count 2
[13:02:20] [PASSED] Link rate 810000 lane count 1
[13:02:20] [PASSED] Link rate 540000 lane count 4
[13:02:20] [PASSED] Link rate 540000 lane count 2
[13:02:20] [PASSED] Link rate 540000 lane count 1
[13:02:20] [PASSED] Link rate 270000 lane count 4
[13:02:20] [PASSED] Link rate 270000 lane count 2
[13:02:20] [PASSED] Link rate 270000 lane count 1
[13:02:20] [PASSED] Link rate 162000 lane count 4
[13:02:20] [PASSED] Link rate 162000 lane count 2
[13:02:20] [PASSED] Link rate 162000 lane count 1
[13:02:20] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[13:02:20] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[13:02:20] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[13:02:20] [PASSED] DP_POWER_UP_PHY with port number
[13:02:20] [PASSED] DP_POWER_DOWN_PHY with port number
[13:02:20] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[13:02:20] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[13:02:20] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[13:02:20] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[13:02:20] [PASSED] DP_QUERY_PAYLOAD with port number
[13:02:20] [PASSED] DP_QUERY_PAYLOAD with VCPI
[13:02:20] [PASSED] DP_REMOTE_DPCD_READ with port number
[13:02:20] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[13:02:20] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[13:02:20] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[13:02:20] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[13:02:20] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[13:02:20] [PASSED] DP_REMOTE_I2C_READ with port number
[13:02:20] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[13:02:20] [PASSED] DP_REMOTE_I2C_READ with transactions array
[13:02:20] [PASSED] DP_REMOTE_I2C_WRITE with port number
[13:02:20] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[13:02:20] [PASSED] DP_REMOTE_I2C_WRITE with data array
[13:02:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[13:02:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[13:02:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[13:02:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[13:02:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[13:02:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[13:02:20] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[13:02:20] ================ [PASSED] drm_dp_mst_helper ================
[13:02:20] ======================== drm_exec  =========================
[13:02:20] [PASSED] sanitycheck
[13:02:20] [PASSED] test_lock
[13:02:20] [PASSED] test_lock_unlock
[13:02:20] [PASSED] test_duplicates
[13:02:20] [PASSED] test_prepare
[13:02:20] [PASSED] test_prepare_array
[13:02:20] [PASSED] test_multiple_loops
[13:02:20] ==================== [PASSED] drm_exec =====================
[13:02:20] ================= drm_format_helper_test  ==================
[13:02:20] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[13:02:20] [PASSED] single_pixel_source_buffer
[13:02:20] [PASSED] single_pixel_clip_rectangle
[13:02:20] [PASSED] well_known_colors
[13:02:20] [PASSED] destination_pitch
[13:02:20] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[13:02:20] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[13:02:20] [PASSED] single_pixel_source_buffer
[13:02:20] [PASSED] single_pixel_clip_rectangle
[13:02:20] [PASSED] well_known_colors
[13:02:20] [PASSED] destination_pitch
[13:02:20] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[13:02:20] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[13:02:20] [PASSED] single_pixel_source_buffer
[13:02:20] [PASSED] single_pixel_clip_rectangle
[13:02:20] [PASSED] well_known_colors
[13:02:20] [PASSED] destination_pitch
[13:02:20] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[13:02:20] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[13:02:20] [PASSED] single_pixel_source_buffer
[13:02:20] [PASSED] single_pixel_clip_rectangle
[13:02:20] [PASSED] well_known_colors
[13:02:20] [PASSED] destination_pitch
[13:02:20] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[13:02:20] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[13:02:20] [PASSED] single_pixel_source_buffer
[13:02:20] [PASSED] single_pixel_clip_rectangle
[13:02:20] [PASSED] well_known_colors
[13:02:20] [PASSED] destination_pitch
[13:02:20] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[13:02:20] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[13:02:20] [PASSED] single_pixel_source_buffer
[13:02:20] [PASSED] single_pixel_clip_rectangle
[13:02:20] [PASSED] well_known_colors
[13:02:20] [PASSED] destination_pitch
[13:02:20] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[13:02:20] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[13:02:20] [PASSED] single_pixel_source_buffer
[13:02:20] [PASSED] single_pixel_clip_rectangle
[13:02:20] [PASSED] well_known_colors
[13:02:20] [PASSED] destination_pitch
[13:02:20] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[13:02:20] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[13:02:20] [PASSED] single_pixel_source_buffer
[13:02:20] [PASSED] single_pixel_clip_rectangle
[13:02:20] [PASSED] well_known_colors
[13:02:20] [PASSED] destination_pitch
[13:02:20] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[13:02:20] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[13:02:20] [PASSED] single_pixel_source_buffer
[13:02:20] [PASSED] single_pixel_clip_rectangle
[13:02:20] [PASSED] well_known_colors
[13:02:20] [PASSED] destination_pitch
[13:02:20] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[13:02:20] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[13:02:20] [PASSED] single_pixel_source_buffer
[13:02:20] [PASSED] single_pixel_clip_rectangle
[13:02:20] [PASSED] well_known_colors
[13:02:20] [PASSED] destination_pitch
[13:02:20] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[13:02:20] ============== drm_test_fb_xrgb8888_to_mono  ===============
[13:02:20] [PASSED] single_pixel_source_buffer
[13:02:20] [PASSED] single_pixel_clip_rectangle
[13:02:20] [PASSED] well_known_colors
[13:02:20] [PASSED] destination_pitch
[13:02:20] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[13:02:20] ==================== drm_test_fb_swab  =====================
[13:02:20] [PASSED] single_pixel_source_buffer
[13:02:20] [PASSED] single_pixel_clip_rectangle
[13:02:20] [PASSED] well_known_colors
[13:02:20] [PASSED] destination_pitch
[13:02:20] ================ [PASSED] drm_test_fb_swab =================
[13:02:20] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[13:02:20] [PASSED] single_pixel_source_buffer
[13:02:20] [PASSED] single_pixel_clip_rectangle
[13:02:20] [PASSED] well_known_colors
[13:02:20] [PASSED] destination_pitch
[13:02:20] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[13:02:20] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[13:02:20] [PASSED] single_pixel_source_buffer
[13:02:20] [PASSED] single_pixel_clip_rectangle
[13:02:20] [PASSED] well_known_colors
[13:02:20] [PASSED] destination_pitch
[13:02:20] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[13:02:20] ================= drm_test_fb_clip_offset  =================
[13:02:20] [PASSED] pass through
[13:02:20] [PASSED] horizontal offset
[13:02:20] [PASSED] vertical offset
[13:02:20] [PASSED] horizontal and vertical offset
[13:02:20] [PASSED] horizontal offset (custom pitch)
[13:02:20] [PASSED] vertical offset (custom pitch)
[13:02:20] [PASSED] horizontal and vertical offset (custom pitch)
[13:02:20] ============= [PASSED] drm_test_fb_clip_offset =============
[13:02:20] ============== drm_test_fb_build_fourcc_list  ==============
[13:02:20] [PASSED] no native formats
[13:02:20] [PASSED] XRGB8888 as native format
[13:02:20] [PASSED] remove duplicates
[13:02:20] [PASSED] convert alpha formats
[13:02:20] [PASSED] random formats
[13:02:20] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[13:02:20] =================== drm_test_fb_memcpy  ====================
[13:02:20] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[13:02:20] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[13:02:20] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[13:02:20] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[13:02:20] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[13:02:20] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[13:02:20] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[13:02:20] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[13:02:20] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[13:02:20] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[13:02:20] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[13:02:20] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[13:02:20] =============== [PASSED] drm_test_fb_memcpy ================
[13:02:20] ============= [PASSED] drm_format_helper_test ==============
[13:02:20] ======================= drm_format  ========================
[13:02:20] [PASSED] drm_test_format_block_width_invalid
[13:02:20] [PASSED] drm_test_format_block_width_one_plane
[13:02:20] [PASSED] drm_test_format_block_width_two_plane
[13:02:20] [PASSED] drm_test_format_block_width_three_plane
[13:02:20] [PASSED] drm_test_format_block_width_tiled
[13:02:20] [PASSED] drm_test_format_block_height_invalid
[13:02:20] [PASSED] drm_test_format_block_height_one_plane
[13:02:20] [PASSED] drm_test_format_block_height_two_plane
[13:02:20] [PASSED] drm_test_format_block_height_three_plane
[13:02:20] [PASSED] drm_test_format_block_height_tiled
[13:02:20] [PASSED] drm_test_format_min_pitch_invalid
[13:02:20] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[13:02:20] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[13:02:20] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[13:02:20] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[13:02:20] [PASSED] drm_test_format_min_pitch_two_plane
[13:02:20] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[13:02:20] [PASSED] drm_test_format_min_pitch_tiled
[13:02:20] =================== [PASSED] drm_format ====================
[13:02:20] ===================== drm_framebuffer  =====================
[13:02:20] =============== drm_test_framebuffer_create  ===============
[13:02:20] [PASSED] ABGR8888 normal sizes
[13:02:20] [PASSED] ABGR8888 max sizes
[13:02:20] [PASSED] ABGR8888 pitch greater than min required
[13:02:20] [PASSED] ABGR8888 pitch less than min required
[13:02:20] [PASSED] ABGR8888 Invalid width
[13:02:20] [PASSED] ABGR8888 Invalid buffer handle
[13:02:20] [PASSED] No pixel format
[13:02:20] [PASSED] ABGR8888 Width 0
[13:02:20] [PASSED] ABGR8888 Height 0
[13:02:20] [PASSED] ABGR8888 Out of bound height * pitch combination
[13:02:20] [PASSED] ABGR8888 Large buffer offset
[13:02:20] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[13:02:20] [PASSED] ABGR8888 Valid buffer modifier
[13:02:20] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[13:02:20] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[13:02:20] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[13:02:20] [PASSED] NV12 Normal sizes
[13:02:20] [PASSED] NV12 Max sizes
[13:02:20] [PASSED] NV12 Invalid pitch
[13:02:20] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[13:02:20] [PASSED] NV12 different  modifier per-plane
[13:02:20] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[13:02:20] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[13:02:20] [PASSED] NV12 Modifier for inexistent plane
[13:02:20] [PASSED] NV12 Handle for inexistent plane
[13:02:20] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[13:02:20] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[13:02:20] [PASSED] YVU420 Normal sizes
[13:02:20] [PASSED] YVU420 Max sizes
[13:02:20] [PASSED] YVU420 Invalid pitch
[13:02:20] [PASSED] YVU420 Different pitches
[13:02:20] [PASSED] YVU420 Different buffer offsets/pitches
[13:02:20] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[13:02:20] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[13:02:20] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[13:02:20] [PASSED] YVU420 Valid modifier
[13:02:20] [PASSED] YVU420 Different modifiers per plane
[13:02:20] [PASSED] YVU420 Modifier for inexistent plane
[13:02:20] [PASSED] X0L2 Normal sizes
[13:02:20] [PASSED] X0L2 Max sizes
[13:02:20] [PASSED] X0L2 Invalid pitch
[13:02:20] [PASSED] X0L2 Pitch greater than minimum required
[13:02:20] [PASSED] X0L2 Handle for inexistent plane
[13:02:20] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[13:02:20] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[13:02:20] [PASSED] X0L2 Valid modifier
[13:02:20] [PASSED] X0L2 Modifier for inexistent plane
[13:02:20] =========== [PASSED] drm_test_framebuffer_create ===========
[13:02:20] ================= [PASSED] drm_framebuffer =================
[13:02:20] ====================== drm_gem_shmem  ======================
[13:02:20] [PASSED] drm_gem_shmem_test_obj_create
[13:02:20] [PASSED] drm_gem_shmem_test_obj_create_private
[13:02:20] [PASSED] drm_gem_shmem_test_pin_pages
[13:02:20] [PASSED] drm_gem_shmem_test_vmap
[13:02:20] [PASSED] drm_gem_shmem_test_get_pages_sgt
[13:02:20] [PASSED] drm_gem_shmem_test_get_sg_table
[13:02:20] [PASSED] drm_gem_shmem_test_madvise
[13:02:20] [PASSED] drm_gem_shmem_test_purge
[13:02:20] ================== [PASSED] drm_gem_shmem ==================
[13:02:20] ==================== drm-test-managed  =====================
[13:02:20] [PASSED] drm_test_managed_run_action
[13:02:20] ================ [PASSED] drm-test-managed =================
[13:02:20] ========================= drm_mm  ==========================
[13:02:20] [PASSED] drm_test_mm_init
[13:02:20] [PASSED] drm_test_mm_debug
[13:02:20] [PASSED] drm_test_mm_align32
[13:02:20] [PASSED] drm_test_mm_align64
[13:02:20] [PASSED] drm_test_mm_lowest
[13:02:20] [PASSED] drm_test_mm_highest
[13:02:20] ===================== [PASSED] drm_mm ======================
[13:02:20] =================== drm_modes_analog_tv  ===================
[13:02:20] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[13:02:20] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[13:02:20] [PASSED] drm_test_modes_analog_tv_pal_576i
[13:02:20] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[13:02:20] =============== [PASSED] drm_modes_analog_tv ===============
[13:02:20] ==================== drm_plane_helper  =====================
[13:02:20] =============== drm_test_check_plane_state  ================
[13:02:20] [PASSED] clipping_simple
[13:02:20] [PASSED] clipping_rotate_reflect
[13:02:20] [PASSED] positioning_simple
[13:02:20] [PASSED] upscaling
[13:02:20] [PASSED] downscaling
[13:02:20] [PASSED] rounding1
[13:02:20] [PASSED] rounding2
[13:02:20] [PASSED] rounding3
[13:02:20] [PASSED] rounding4
[13:02:20] =========== [PASSED] drm_test_check_plane_state ============
[13:02:20] =========== drm_test_check_invalid_plane_state  ============
[13:02:20] [PASSED] positioning_invalid
[13:02:20] [PASSED] upscaling_invalid
[13:02:20] [PASSED] downscaling_invalid
[13:02:20] ======= [PASSED] drm_test_check_invalid_plane_state ========
[13:02:20] ================ [PASSED] drm_plane_helper =================
[13:02:20] ============ drm_connector_helper_tv_get_modes  ============
[13:02:20] ====== drm_test_connector_helper_tv_get_modes_check  =======
[13:02:20] [PASSED] None
[13:02:20] [PASSED] PAL
[13:02:20] [PASSED] NTSC
[13:02:20] [PASSED] Both, NTSC Default
[13:02:20] [PASSED] Both, PAL Default
[13:02:20] [PASSED] Both, NTSC Default, with PAL on command-line
[13:02:20] [PASSED] Both, PAL Default, with NTSC on command-line
[13:02:20] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[13:02:20] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[13:02:20] ======================== drm_rect  =========================
[13:02:20] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[13:02:20] [PASSED] drm_test_rect_clip_scaled_not_clipped
[13:02:20] [PASSED] drm_test_rect_clip_scaled_clipped
[13:02:20] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[13:02:20] ================= drm_test_rect_intersect  =================
[13:02:20] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[13:02:20] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
stty: 'standard input': Inappropriate ioctl for device
[13:02:20] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[13:02:20] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[13:02:20] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[13:02:20] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[13:02:20] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[13:02:20] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[13:02:20] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[13:02:20] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[13:02:20] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[13:02:20] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[13:02:20] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[13:02:20] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[13:02:20] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[13:02:20] ============= [PASSED] drm_test_rect_intersect =============
[13:02:20] ================ drm_test_rect_calc_hscale  ================
[13:02:20] [PASSED] normal use
[13:02:20] [PASSED] out of max range
[13:02:20] [PASSED] out of min range
[13:02:20] [PASSED] zero dst
[13:02:20] [PASSED] negative src
[13:02:20] [PASSED] negative dst
[13:02:20] ============ [PASSED] drm_test_rect_calc_hscale ============
[13:02:20] ================ drm_test_rect_calc_vscale  ================
[13:02:20] [PASSED] normal use
[13:02:20] [PASSED] out of max range
[13:02:20] [PASSED] out of min range
[13:02:20] [PASSED] zero dst
[13:02:20] [PASSED] negative src
[13:02:20] [PASSED] negative dst
[13:02:20] ============ [PASSED] drm_test_rect_calc_vscale ============
[13:02:20] ================== drm_test_rect_rotate  ===================
[13:02:20] [PASSED] reflect-x
[13:02:20] [PASSED] reflect-y
[13:02:20] [PASSED] rotate-0
[13:02:20] [PASSED] rotate-90
[13:02:20] [PASSED] rotate-180
[13:02:20] [PASSED] rotate-270
[13:02:20] ============== [PASSED] drm_test_rect_rotate ===============
[13:02:20] ================ drm_test_rect_rotate_inv  =================
[13:02:20] [PASSED] reflect-x
[13:02:20] [PASSED] reflect-y
[13:02:20] [PASSED] rotate-0
[13:02:20] [PASSED] rotate-90
[13:02:20] [PASSED] rotate-180
[13:02:20] [PASSED] rotate-270
[13:02:20] ============ [PASSED] drm_test_rect_rotate_inv =============
[13:02:20] ==================== [PASSED] drm_rect =====================
[13:02:20] ============================================================
[13:02:20] Testing complete. Ran 390 tests: passed: 390
[13:02:20] Elapsed time: 22.229s total, 1.657s configuring, 20.395s building, 0.174s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


