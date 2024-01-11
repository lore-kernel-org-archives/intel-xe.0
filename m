Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3686C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 16:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FEF10E96D;
	Thu, 11 Jan 2024 16:55:38 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281BC10E96A;
 Thu, 11 Jan 2024 16:55:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/guc=3A_Treat_non-respon?=
 =?utf-8?q?se_message_after_BUSY_as_unexpected?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Thu, 11 Jan 2024 16:55:37 -0000
Message-ID: <170499213715.290001.1260171427550613329@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240111154838.541-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240111154838.541-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/guc: Treat non-response message after BUSY as unexpected
URL   : https://patchwork.freedesktop.org/series/128676/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[16:54:45] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:54:49] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[16:55:12] Starting KUnit Kernel (1/1)...
[16:55:12] ============================================================
[16:55:12] ========================= guc_dbm  =========================
[16:55:12] [PASSED] test_empty
[16:55:12] [PASSED] test_default
[16:55:12] ======================== test_size  ========================
[16:55:12] [PASSED] 4
[16:55:12] [PASSED] 8
[16:55:12] [PASSED] 32
[16:55:12] [PASSED] 256
[16:55:12] ==================== [PASSED] test_size ====================
[16:55:12] ======================= test_reuse  ========================
[16:55:12] [PASSED] 4
[16:55:12] [PASSED] 8
[16:55:12] [PASSED] 32
[16:55:12] [PASSED] 256
[16:55:12] =================== [PASSED] test_reuse ====================
[16:55:12] =================== test_range_overlap  ====================
[16:55:12] [PASSED] 4
[16:55:12] [PASSED] 8
[16:55:12] [PASSED] 32
[16:55:12] [PASSED] 256
[16:55:12] =============== [PASSED] test_range_overlap ================
[16:55:12] =================== test_range_compact  ====================
[16:55:12] [PASSED] 4
[16:55:12] [PASSED] 8
[16:55:12] [PASSED] 32
[16:55:12] [PASSED] 256
[16:55:12] =============== [PASSED] test_range_compact ================
[16:55:12] ==================== test_range_spare  =====================
[16:55:12] [PASSED] 4
[16:55:12] [PASSED] 8
[16:55:12] [PASSED] 32
[16:55:12] [PASSED] 256
[16:55:12] ================ [PASSED] test_range_spare =================
[16:55:12] ===================== [PASSED] guc_dbm =====================
[16:55:12] ======================== no_relay  =========================
[16:55:12] [PASSED] xe_drops_guc2pf_if_not_ready
[16:55:12] [PASSED] xe_drops_guc2vf_if_not_ready
[16:55:12] [PASSED] xe_rejects_send_if_not_ready
[16:55:12] ==================== [PASSED] no_relay =====================
[16:55:12] ======================== pf_relay  =========================
[16:55:12] [PASSED] pf_rejects_guc2pf_too_short
[16:55:12] [PASSED] pf_rejects_guc2pf_too_long
[16:55:12] [PASSED] pf_rejects_guc2pf_no_payload
[16:55:12] [PASSED] pf_fails_no_payload
[16:55:12] [PASSED] pf_fails_bad_origin
[16:55:12] [PASSED] pf_fails_bad_type
[16:55:12] [PASSED] pf_txn_reports_error
[16:55:12] [PASSED] pf_txn_sends_pf2guc
[16:55:12] [PASSED] pf_sends_pf2guc
[16:55:12] [SKIPPED] pf_loopback_nop
[16:55:12] [SKIPPED] pf_loopback_echo
[16:55:12] [SKIPPED] pf_loopback_fail
[16:55:12] [SKIPPED] pf_loopback_busy
[16:55:12] [SKIPPED] pf_loopback_retry
[16:55:12] ==================== [PASSED] pf_relay =====================
[16:55:12] ======================== vf_relay  =========================
[16:55:12] [PASSED] vf_rejects_guc2vf_too_short
[16:55:12] [PASSED] vf_rejects_guc2vf_too_long
[16:55:12] [PASSED] vf_rejects_guc2vf_no_payload
[16:55:12] ==================== [PASSED] vf_relay =====================
[16:55:12] ========================== lmtt  ===========================
[16:55:12] ======================== test_ops  =========================
[16:55:12] [PASSED] 2-level
[16:55:12] [PASSED] multi-level
[16:55:12] ==================== [PASSED] test_ops =====================
[16:55:12] ====================== [PASSED] lmtt =======================
[16:55:12] ========================== xe_bo  ==========================
[16:55:12] [SKIPPED] xe_ccs_migrate_kunit
[16:55:12] [SKIPPED] xe_bo_evict_kunit
[16:55:12] ===================== [SKIPPED] xe_bo ======================
[16:55:12] ======================= xe_dma_buf  ========================
[16:55:12] [SKIPPED] xe_dma_buf_kunit
[16:55:12] =================== [SKIPPED] xe_dma_buf ===================
[16:55:12] ======================= xe_migrate  ========================
[16:55:12] [SKIPPED] xe_migrate_sanity_kunit
[16:55:12] =================== [SKIPPED] xe_migrate ===================
[16:55:12] ========================= xe_mocs  =========================
[16:55:12] [SKIPPED] xe_live_mocs_kernel_kunit
[16:55:12] [SKIPPED] xe_live_mocs_reset_kunit
[16:55:12] ==================== [SKIPPED] xe_mocs =====================
[16:55:12] ========================= xe_pci  ==========================
[16:55:12] [PASSED] xe_gmdid_graphics_ip
[16:55:12] [PASSED] xe_gmdid_media_ip
[16:55:12] ===================== [PASSED] xe_pci ======================
[16:55:12] ========================= xe_rtp  ==========================
[16:55:12] ================== xe_rtp_process_tests  ===================
[16:55:12] [PASSED] coalesce-same-reg
[16:55:12] [PASSED] no-match-no-add
[16:55:12] [PASSED] no-match-no-add-multiple-rules
[16:55:12] [PASSED] two-regs-two-entries
[16:55:12] [PASSED] clr-one-set-other
[16:55:12] [PASSED] set-field
[16:55:12] [PASSED] conflict-duplicate
[16:55:12] [PASSED] conflict-not-disjoint
[16:55:12] [PASSED] conflict-reg-type
[16:55:12] ============== [PASSED] xe_rtp_process_tests ===============
[16:55:12] ===================== [PASSED] xe_rtp ======================
[16:55:12] ========================== xe_wa  ==========================
[16:55:12] ======================== xe_wa_gt  =========================
[16:55:12] [PASSED] TIGERLAKE (B0)
[16:55:12] [PASSED] DG1 (A0)
[16:55:12] [PASSED] DG1 (B0)
[16:55:12] [PASSED] ALDERLAKE_S (A0)
[16:55:12] [PASSED] ALDERLAKE_S (B0)
[16:55:12] [PASSED] ALDERLAKE_S (C0)
[16:55:12] [PASSED] ALDERLAKE_S (D0)
[16:55:12] [PASSED] ALDERLAKE_P (A0)
[16:55:12] [PASSED] ALDERLAKE_P (B0)
[16:55:12] [PASSED] ALDERLAKE_P (C0)
[16:55:12] [PASSED] ALDERLAKE_S_RPLS (D0)
[16:55:12] [PASSED] ALDERLAKE_P_RPLU (E0)
[16:55:12] [PASSED] DG2_G10 (C0)
[16:55:12] [PASSED] DG2_G11 (B1)
[16:55:12] [PASSED] DG2_G12 (A1)
[16:55:12] [PASSED] PVC (B0)
[16:55:12] [PASSED] PVC (B1)
[16:55:12] [PASSED] PVC (C0)
[16:55:12] [PASSED] METEORLAKE (g:A0, m:A0)
[16:55:12] [PASSED] METEORLAKE (g:A0, m:A0)
[16:55:12] [PASSED] LUNARLAKE (g:A0, m:A0)
[16:55:12] [PASSED] LUNARLAKE (g:B0, m:A0)
[16:55:12] ==================== [PASSED] xe_wa_gt =====================
[16:55:12] ====================== [PASSED] xe_wa ======================
[16:55:12] ============================================================
[16:55:12] Testing complete. Ran 83 tests: passed: 72, skipped: 11
[16:55:12] Elapsed time: 27.279s total, 4.238s configuring, 22.821s building, 0.186s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[16:55:12] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:55:14] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[16:55:34] Starting KUnit Kernel (1/1)...
[16:55:34] ============================================================
[16:55:34] ================== drm_test_pick_cmdline  ==================
[16:55:34] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[16:55:34] =============== drm_test_pick_cmdline_named  ===============
[16:55:34] [PASSED] NTSC
[16:55:34] [PASSED] NTSC-J
[16:55:34] [PASSED] PAL
[16:55:34] [PASSED] PAL-M
[16:55:34] =========== [PASSED] drm_test_pick_cmdline_named ===========
[16:55:34] ============== [PASSED] drm_test_pick_cmdline ==============
[16:55:34] ======================== drm_buddy  ========================
[16:55:34] [PASSED] drm_test_buddy_alloc_limit
[16:55:34] [PASSED] drm_test_buddy_alloc_optimistic
[16:55:34] [PASSED] drm_test_buddy_alloc_pessimistic
[16:55:34] [PASSED] drm_test_buddy_alloc_pathological
[16:55:34] ==================== [PASSED] drm_buddy ====================
[16:55:34] =================== drm_cmdline_parser  ====================
[16:55:34] [PASSED] drm_test_cmdline_force_d_only
[16:55:34] [PASSED] drm_test_cmdline_force_D_only_dvi
[16:55:34] [PASSED] drm_test_cmdline_force_D_only_hdmi
[16:55:34] [PASSED] drm_test_cmdline_force_D_only_not_digital
[16:55:34] [PASSED] drm_test_cmdline_force_e_only
[16:55:34] [PASSED] drm_test_cmdline_res
[16:55:34] [PASSED] drm_test_cmdline_res_vesa
[16:55:34] [PASSED] drm_test_cmdline_res_vesa_rblank
[16:55:34] [PASSED] drm_test_cmdline_res_rblank
[16:55:34] [PASSED] drm_test_cmdline_res_bpp
[16:55:34] [PASSED] drm_test_cmdline_res_refresh
[16:55:34] [PASSED] drm_test_cmdline_res_bpp_refresh
[16:55:34] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[16:55:34] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[16:55:34] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[16:55:34] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[16:55:34] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[16:55:34] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[16:55:34] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[16:55:34] [PASSED] drm_test_cmdline_res_margins_force_on
[16:55:34] [PASSED] drm_test_cmdline_res_vesa_margins
[16:55:34] [PASSED] drm_test_cmdline_name
[16:55:34] [PASSED] drm_test_cmdline_name_bpp
[16:55:34] [PASSED] drm_test_cmdline_name_option
[16:55:34] [PASSED] drm_test_cmdline_name_bpp_option
[16:55:34] [PASSED] drm_test_cmdline_rotate_0
[16:55:34] [PASSED] drm_test_cmdline_rotate_90
[16:55:34] [PASSED] drm_test_cmdline_rotate_180
[16:55:34] [PASSED] drm_test_cmdline_rotate_270
[16:55:34] [PASSED] drm_test_cmdline_hmirror
[16:55:34] [PASSED] drm_test_cmdline_vmirror
[16:55:34] [PASSED] drm_test_cmdline_margin_options
[16:55:34] [PASSED] drm_test_cmdline_multiple_options
[16:55:34] [PASSED] drm_test_cmdline_bpp_extra_and_option
[16:55:34] [PASSED] drm_test_cmdline_extra_and_option
[16:55:34] [PASSED] drm_test_cmdline_freestanding_options
[16:55:34] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[16:55:34] [PASSED] drm_test_cmdline_panel_orientation
[16:55:34] ================ drm_test_cmdline_invalid  =================
[16:55:34] [PASSED] margin_only
[16:55:34] [PASSED] interlace_only
[16:55:34] [PASSED] res_missing_x
[16:55:34] [PASSED] res_missing_y
[16:55:34] [PASSED] res_bad_y
[16:55:34] [PASSED] res_missing_y_bpp
[16:55:34] [PASSED] res_bad_bpp
[16:55:34] [PASSED] res_bad_refresh
[16:55:34] [PASSED] res_bpp_refresh_force_on_off
[16:55:34] [PASSED] res_invalid_mode
[16:55:34] [PASSED] res_bpp_wrong_place_mode
[16:55:34] [PASSED] name_bpp_refresh
[16:55:34] [PASSED] name_refresh
[16:55:34] [PASSED] name_refresh_wrong_mode
[16:55:34] [PASSED] name_refresh_invalid_mode
[16:55:34] [PASSED] rotate_multiple
[16:55:34] [PASSED] rotate_invalid_val
[16:55:34] [PASSED] rotate_truncated
[16:55:34] [PASSED] invalid_option
[16:55:34] [PASSED] invalid_tv_option
[16:55:34] [PASSED] truncated_tv_option
[16:55:34] ============ [PASSED] drm_test_cmdline_invalid =============
[16:55:34] =============== drm_test_cmdline_tv_options  ===============
[16:55:34] [PASSED] NTSC
[16:55:34] [PASSED] NTSC_443
[16:55:34] [PASSED] NTSC_J
[16:55:34] [PASSED] PAL
[16:55:34] [PASSED] PAL_M
[16:55:34] [PASSED] PAL_N
[16:55:34] [PASSED] SECAM
[16:55:34] =========== [PASSED] drm_test_cmdline_tv_options ===========
[16:55:34] =============== [PASSED] drm_cmdline_parser ================
[16:55:34] ================ drm_get_tv_mode_from_name  ================
[16:55:34] ========== drm_test_get_tv_mode_from_name_valid  ===========
[16:55:34] [PASSED] NTSC
[16:55:34] [PASSED] NTSC-443
[16:55:34] [PASSED] NTSC-J
[16:55:34] [PASSED] PAL
[16:55:34] [PASSED] PAL-M
[16:55:34] [PASSED] PAL-N
[16:55:34] [PASSED] SECAM
[16:55:34] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[16:55:34] [PASSED] drm_test_get_tv_mode_from_name_truncated
[16:55:34] ============ [PASSED] drm_get_tv_mode_from_name ============
[16:55:34] ==================== drm_damage_helper  ====================
[16:55:34] [PASSED] drm_test_damage_iter_no_damage
[16:55:34] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[16:55:34] [PASSED] drm_test_damage_iter_no_damage_src_moved
[16:55:34] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[16:55:34] [PASSED] drm_test_damage_iter_no_damage_not_visible
[16:55:34] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[16:55:34] [PASSED] drm_test_damage_iter_no_damage_no_fb
[16:55:34] [PASSED] drm_test_damage_iter_simple_damage
[16:55:34] [PASSED] drm_test_damage_iter_single_damage
[16:55:34] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[16:55:34] [PASSED] drm_test_damage_iter_single_damage_outside_src
[16:55:34] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[16:55:34] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[16:55:34] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[16:55:34] [PASSED] drm_test_damage_iter_single_damage_src_moved
[16:55:34] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[16:55:34] [PASSED] drm_test_damage_iter_damage
[16:55:34] [PASSED] drm_test_damage_iter_damage_one_intersect
[16:55:34] [PASSED] drm_test_damage_iter_damage_one_outside
[16:55:34] [PASSED] drm_test_damage_iter_damage_src_moved
[16:55:34] [PASSED] drm_test_damage_iter_damage_not_visible
[16:55:34] ================ [PASSED] drm_damage_helper ================
[16:55:34] ==================== drm_dp_mst_helper  ====================
[16:55:34] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[16:55:34] [PASSED] Clock 154000 BPP 30 DSC disabled
[16:55:34] [PASSED] Clock 234000 BPP 30 DSC disabled
[16:55:34] [PASSED] Clock 297000 BPP 24 DSC disabled
[16:55:34] [PASSED] Clock 332880 BPP 24 DSC enabled
[16:55:34] [PASSED] Clock 324540 BPP 24 DSC enabled
[16:55:34] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[16:55:34] ============== drm_test_dp_mst_calc_pbn_div  ===============
[16:55:34] [PASSED] Link rate 2000000 lane count 4
[16:55:34] [PASSED] Link rate 2000000 lane count 2
[16:55:34] [PASSED] Link rate 2000000 lane count 1
[16:55:34] [PASSED] Link rate 1350000 lane count 4
[16:55:34] [PASSED] Link rate 1350000 lane count 2
[16:55:34] [PASSED] Link rate 1350000 lane count 1
[16:55:34] [PASSED] Link rate 1000000 lane count 4
[16:55:34] [PASSED] Link rate 1000000 lane count 2
[16:55:34] [PASSED] Link rate 1000000 lane count 1
[16:55:34] [PASSED] Link rate 810000 lane count 4
[16:55:34] [PASSED] Link rate 810000 lane count 2
[16:55:34] [PASSED] Link rate 810000 lane count 1
[16:55:34] [PASSED] Link rate 540000 lane count 4
[16:55:34] [PASSED] Link rate 540000 lane count 2
[16:55:34] [PASSED] Link rate 540000 lane count 1
[16:55:34] [PASSED] Link rate 270000 lane count 4
[16:55:34] [PASSED] Link rate 270000 lane count 2
[16:55:34] [PASSED] Link rate 270000 lane count 1
[16:55:34] [PASSED] Link rate 162000 lane count 4
[16:55:34] [PASSED] Link rate 162000 lane count 2
[16:55:34] [PASSED] Link rate 162000 lane count 1
[16:55:34] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[16:55:34] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[16:55:34] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[16:55:34] [PASSED] DP_POWER_UP_PHY with port number
[16:55:34] [PASSED] DP_POWER_DOWN_PHY with port number
[16:55:34] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[16:55:34] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[16:55:34] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[16:55:34] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[16:55:34] [PASSED] DP_QUERY_PAYLOAD with port number
[16:55:34] [PASSED] DP_QUERY_PAYLOAD with VCPI
[16:55:34] [PASSED] DP_REMOTE_DPCD_READ with port number
[16:55:34] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[16:55:34] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[16:55:34] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[16:55:34] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[16:55:34] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[16:55:34] [PASSED] DP_REMOTE_I2C_READ with port number
[16:55:34] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[16:55:34] [PASSED] DP_REMOTE_I2C_READ with transactions array
[16:55:34] [PASSED] DP_REMOTE_I2C_WRITE with port number
[16:55:34] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[16:55:34] [PASSED] DP_REMOTE_I2C_WRITE with data array
[16:55:34] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[16:55:34] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[16:55:34] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[16:55:34] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[16:55:34] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[16:55:34] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[16:55:34] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[16:55:34] ================ [PASSED] drm_dp_mst_helper ================
[16:55:34] ======================== drm_exec  =========================
[16:55:34] [PASSED] sanitycheck
[16:55:34] [PASSED] test_lock
[16:55:34] [PASSED] test_lock_unlock
[16:55:34] [PASSED] test_duplicates
[16:55:34] [PASSED] test_prepare
[16:55:34] [PASSED] test_prepare_array
[16:55:34] [PASSED] test_multiple_loops
[16:55:34] ==================== [PASSED] drm_exec =====================
[16:55:34] ================= drm_format_helper_test  ==================
[16:55:34] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[16:55:34] [PASSED] single_pixel_source_buffer
[16:55:34] [PASSED] single_pixel_clip_rectangle
[16:55:34] [PASSED] well_known_colors
[16:55:34] [PASSED] destination_pitch
[16:55:34] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[16:55:34] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[16:55:34] [PASSED] single_pixel_source_buffer
[16:55:34] [PASSED] single_pixel_clip_rectangle
[16:55:34] [PASSED] well_known_colors
[16:55:34] [PASSED] destination_pitch
[16:55:34] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[16:55:34] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[16:55:34] [PASSED] single_pixel_source_buffer
[16:55:34] [PASSED] single_pixel_clip_rectangle
[16:55:34] [PASSED] well_known_colors
[16:55:34] [PASSED] destination_pitch
[16:55:34] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[16:55:34] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[16:55:34] [PASSED] single_pixel_source_buffer
[16:55:34] [PASSED] single_pixel_clip_rectangle
[16:55:34] [PASSED] well_known_colors
[16:55:34] [PASSED] destination_pitch
[16:55:34] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[16:55:34] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[16:55:34] [PASSED] single_pixel_source_buffer
[16:55:34] [PASSED] single_pixel_clip_rectangle
[16:55:34] [PASSED] well_known_colors
[16:55:34] [PASSED] destination_pitch
[16:55:34] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[16:55:34] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[16:55:34] [PASSED] single_pixel_source_buffer
[16:55:34] [PASSED] single_pixel_clip_rectangle
[16:55:34] [PASSED] well_known_colors
[16:55:34] [PASSED] destination_pitch
[16:55:34] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[16:55:34] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[16:55:34] [PASSED] single_pixel_source_buffer
[16:55:34] [PASSED] single_pixel_clip_rectangle
[16:55:34] [PASSED] well_known_colors
[16:55:34] [PASSED] destination_pitch
[16:55:34] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[16:55:34] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[16:55:34] [PASSED] single_pixel_source_buffer
[16:55:34] [PASSED] single_pixel_clip_rectangle
[16:55:34] [PASSED] well_known_colors
[16:55:34] [PASSED] destination_pitch
[16:55:34] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[16:55:34] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[16:55:34] [PASSED] single_pixel_source_buffer
[16:55:34] [PASSED] single_pixel_clip_rectangle
[16:55:34] [PASSED] well_known_colors
[16:55:34] [PASSED] destination_pitch
[16:55:34] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[16:55:34] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[16:55:34] [PASSED] single_pixel_source_buffer
[16:55:34] [PASSED] single_pixel_clip_rectangle
[16:55:34] [PASSED] well_known_colors
[16:55:34] [PASSED] destination_pitch
[16:55:34] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[16:55:34] ============== drm_test_fb_xrgb8888_to_mono  ===============
[16:55:34] [PASSED] single_pixel_source_buffer
[16:55:34] [PASSED] single_pixel_clip_rectangle
[16:55:34] [PASSED] well_known_colors
[16:55:34] [PASSED] destination_pitch
[16:55:34] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[16:55:34] ==================== drm_test_fb_swab  =====================
[16:55:34] [PASSED] single_pixel_source_buffer
[16:55:34] [PASSED] single_pixel_clip_rectangle
[16:55:34] [PASSED] well_known_colors
[16:55:34] [PASSED] destination_pitch
[16:55:34] ================ [PASSED] drm_test_fb_swab =================
[16:55:34] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[16:55:34] [PASSED] single_pixel_source_buffer
[16:55:34] [PASSED] single_pixel_clip_rectangle
[16:55:34] [PASSED] well_known_colors
[16:55:34] [PASSED] destination_pitch
[16:55:34] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[16:55:34] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[16:55:34] [PASSED] single_pixel_source_buffer
[16:55:34] [PASSED] single_pixel_clip_rectangle
[16:55:34] [PASSED] well_known_colors
[16:55:34] [PASSED] destination_pitch
[16:55:34] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[16:55:34] ================= drm_test_fb_clip_offset  =================
[16:55:34] [PASSED] pass through
[16:55:34] [PASSED] horizontal offset
[16:55:34] [PASSED] vertical offset
[16:55:34] [PASSED] horizontal and vertical offset
[16:55:34] [PASSED] horizontal offset (custom pitch)
[16:55:34] [PASSED] vertical offset (custom pitch)
[16:55:34] [PASSED] horizontal and vertical offset (custom pitch)
[16:55:34] ============= [PASSED] drm_test_fb_clip_offset =============
[16:55:34] ============== drm_test_fb_build_fourcc_list  ==============
[16:55:34] [PASSED] no native formats
[16:55:34] [PASSED] XRGB8888 as native format
[16:55:34] [PASSED] remove duplicates
[16:55:34] [PASSED] convert alpha formats
[16:55:34] [PASSED] random formats
[16:55:34] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[16:55:34] =================== drm_test_fb_memcpy  ====================
[16:55:34] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[16:55:34] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[16:55:34] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[16:55:34] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[16:55:34] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[16:55:34] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[16:55:34] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[16:55:34] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[16:55:34] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[16:55:34] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[16:55:34] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[16:55:34] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[16:55:34] =============== [PASSED] drm_test_fb_memcpy ================
[16:55:34] ============= [PASSED] drm_format_helper_test ==============
[16:55:34] ======================= drm_format  ========================
[16:55:34] [PASSED] drm_test_format_block_width_invalid
[16:55:34] [PASSED] drm_test_format_block_width_one_plane
[16:55:34] [PASSED] drm_test_format_block_width_two_plane
[16:55:34] [PASSED] drm_test_format_block_width_three_plane
[16:55:34] [PASSED] drm_test_format_block_width_tiled
[16:55:34] [PASSED] drm_test_format_block_height_invalid
[16:55:34] [PASSED] drm_test_format_block_height_one_plane
[16:55:34] [PASSED] drm_test_format_block_height_two_plane
[16:55:34] [PASSED] drm_test_format_block_height_three_plane
[16:55:34] [PASSED] drm_test_format_block_height_tiled
[16:55:34] [PASSED] drm_test_format_min_pitch_invalid
[16:55:34] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[16:55:34] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[16:55:34] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[16:55:34] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[16:55:34] [PASSED] drm_test_format_min_pitch_two_plane
[16:55:34] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[16:55:34] [PASSED] drm_test_format_min_pitch_tiled
[16:55:34] =================== [PASSED] drm_format ====================
[16:55:34] ===================== drm_framebuffer  =====================
[16:55:34] =============== drm_test_framebuffer_create  ===============
[16:55:34] [PASSED] ABGR8888 normal sizes
[16:55:34] [PASSED] ABGR8888 max sizes
[16:55:34] [PASSED] ABGR8888 pitch greater than min required
[16:55:34] [PASSED] ABGR8888 pitch less than min required
[16:55:34] [PASSED] ABGR8888 Invalid width
[16:55:34] [PASSED] ABGR8888 Invalid buffer handle
[16:55:34] [PASSED] No pixel format
[16:55:34] [PASSED] ABGR8888 Width 0
[16:55:34] [PASSED] ABGR8888 Height 0
[16:55:34] [PASSED] ABGR8888 Out of bound height * pitch combination
[16:55:34] [PASSED] ABGR8888 Large buffer offset
[16:55:34] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[16:55:34] [PASSED] ABGR8888 Valid buffer modifier
[16:55:34] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[16:55:34] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[16:55:34] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[16:55:34] [PASSED] NV12 Normal sizes
[16:55:34] [PASSED] NV12 Max sizes
[16:55:34] [PASSED] NV12 Invalid pitch
[16:55:34] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[16:55:34] [PASSED] NV12 different  modifier per-plane
[16:55:34] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[16:55:34] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[16:55:34] [PASSED] NV12 Modifier for inexistent plane
[16:55:34] [PASSED] NV12 Handle for inexistent plane
[16:55:34] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[16:55:34] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[16:55:34] [PASSED] YVU420 Normal sizes
[16:55:34] [PASSED] YVU420 Max sizes
[16:55:34] [PASSED] YVU420 Invalid pitch
[16:55:34] [PASSED] YVU420 Different pitches
[16:55:34] [PASSED] YVU420 Different buffer offsets/pitches
[16:55:34] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[16:55:34] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[16:55:34] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[16:55:34] [PASSED] YVU420 Valid modifier
[16:55:34] [PASSED] YVU420 Different modifiers per plane
[16:55:34] [PASSED] YVU420 Modifier for inexistent plane
[16:55:34] [PASSED] X0L2 Normal sizes
[16:55:34] [PASSED] X0L2 Max sizes
[16:55:34] [PASSED] X0L2 Invalid pitch
[16:55:34] [PASSED] X0L2 Pitch greater than minimum required
[16:55:34] [PASSED] X0L2 Handle for inexistent plane
[16:55:34] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[16:55:34] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[16:55:34] [PASSED] X0L2 Valid modifier
[16:55:34] [PASSED] X0L2 Modifier for inexistent plane
[16:55:34] =========== [PASSED] drm_test_framebuffer_create ===========
[16:55:34] ================= [PASSED] drm_framebuffer =================
[16:55:34] ====================== drm_gem_shmem  ======================
[16:55:34] [PASSED] drm_gem_shmem_test_obj_create
[16:55:34] [PASSED] drm_gem_shmem_test_obj_create_private
[16:55:34] [PASSED] drm_gem_shmem_test_pin_pages
[16:55:34] [PASSED] drm_gem_shmem_test_vmap
[16:55:34] [PASSED] drm_gem_shmem_test_get_pages_sgt
[16:55:34] [PASSED] drm_gem_shmem_test_get_sg_table
[16:55:34] [PASSED] drm_gem_shmem_test_madvise
[16:55:34] [PASSED] drm_gem_shmem_test_purge
[16:55:34] ================== [PASSED] drm_gem_shmem ==================
[16:55:34] ==================== drm-test-managed  =====================
[16:55:34] [PASSED] drm_test_managed_run_action
[16:55:34] ================ [PASSED] drm-test-managed =================
[16:55:34] ========================= drm_mm  ==========================
[16:55:34] [PASSED] drm_test_mm_init
[16:55:34] [PASSED] drm_test_mm_debug
[16:55:34] [PASSED] drm_test_mm_align32
[16:55:34] [PASSED] drm_test_mm_align64
[16:55:34] [PASSED] drm_test_mm_lowest
[16:55:34] [PASSED] drm_test_mm_highest
[16:55:34] ===================== [PASSED] drm_mm ======================
[16:55:34] =================== drm_modes_analog_tv  ===================
[16:55:34] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[16:55:34] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[16:55:34] [PASSED] drm_test_modes_analog_tv_pal_576i
[16:55:34] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[16:55:34] =============== [PASSED] drm_modes_analog_tv ===============
[16:55:34] ==================== drm_plane_helper  =====================
[16:55:34] =============== drm_test_check_plane_state  ================
[16:55:34] [PASSED] clipping_simple
[16:55:34] [PASSED] clipping_rotate_reflect
[16:55:34] [PASSED] positioning_simple
[16:55:34] [PASSED] upscaling
[16:55:34] [PASSED] downscaling
[16:55:34] [PASSED] rounding1
[16:55:34] [PASSED] rounding2
[16:55:34] [PASSED] rounding3
[16:55:34] [PASSED] rounding4
[16:55:34] =========== [PASSED] drm_test_check_plane_state ============
[16:55:34] =========== drm_test_check_invalid_plane_state  ============
[16:55:34] [PASSED] positioning_invalid
[16:55:34] [PASSED] upscaling_invalid
[16:55:34] [PASSED] downscaling_invalid
[16:55:34] ======= [PASSED] drm_test_check_invalid_plane_state ========
[16:55:34] ================ [PASSED] drm_plane_helper =================
[16:55:34] ============ drm_connector_helper_tv_get_modes  ============
[16:55:34] ====== drm_test_connector_helper_tv_get_modes_check  =======
[16:55:34] [PASSED] None
[16:55:34] [PASSED] PAL
[16:55:34] [PASSED] NTSC
[16:55:34] [PASSED] Both, NTSC Default
[16:55:34] [PASSED] Both, PAL Default
[16:55:34] [PASSED] Both, NTSC Default, with PAL on command-line
[16:55:34] [PASSED] Both, PAL Default, with NTSC on command-line
[16:55:34] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[16:55:34] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[16:55:34] ======================== drm_rect  =========================
[16:55:34] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[16:55:34] [PASSED] drm_test_rect_clip_scaled_not_clipped
[16:55:34] [PASSED] drm_test_rect_clip_scaled_clipped
[16:55:34] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[16:55:34] ================= drm_test_rect_intersect  =================
[16:55:34] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[16:55:34] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
stty: 'standard input': Inappropriate ioctl for device
[16:55:34] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[16:55:34] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[16:55:34] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[16:55:34] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[16:55:34] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[16:55:34] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[16:55:34] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[16:55:34] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[16:55:34] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[16:55:34] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[16:55:34] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[16:55:34] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[16:55:34] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[16:55:34] ============= [PASSED] drm_test_rect_intersect =============
[16:55:34] ================ drm_test_rect_calc_hscale  ================
[16:55:34] [PASSED] normal use
[16:55:34] [PASSED] out of max range
[16:55:34] [PASSED] out of min range
[16:55:34] [PASSED] zero dst
[16:55:34] [PASSED] negative src
[16:55:34] [PASSED] negative dst
[16:55:34] ============ [PASSED] drm_test_rect_calc_hscale ============
[16:55:34] ================ drm_test_rect_calc_vscale  ================
[16:55:34] [PASSED] normal use
[16:55:34] [PASSED] out of max range
[16:55:34] [PASSED] out of min range
[16:55:34] [PASSED] zero dst
[16:55:34] [PASSED] negative src
[16:55:34] [PASSED] negative dst
[16:55:34] ============ [PASSED] drm_test_rect_calc_vscale ============
[16:55:34] ================== drm_test_rect_rotate  ===================
[16:55:34] [PASSED] reflect-x
[16:55:34] [PASSED] reflect-y
[16:55:34] [PASSED] rotate-0
[16:55:34] [PASSED] rotate-90
[16:55:34] [PASSED] rotate-180
[16:55:34] [PASSED] rotate-270
[16:55:34] ============== [PASSED] drm_test_rect_rotate ===============
[16:55:34] ================ drm_test_rect_rotate_inv  =================
[16:55:34] [PASSED] reflect-x
[16:55:34] [PASSED] reflect-y
[16:55:34] [PASSED] rotate-0
[16:55:34] [PASSED] rotate-90
[16:55:34] [PASSED] rotate-180
[16:55:34] [PASSED] rotate-270
[16:55:34] ============ [PASSED] drm_test_rect_rotate_inv =============
[16:55:34] ==================== [PASSED] drm_rect =====================
[16:55:34] ============================================================
[16:55:34] Testing complete. Ran 390 tests: passed: 390
[16:55:34] Elapsed time: 21.564s total, 1.663s configuring, 19.730s building, 0.168s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


