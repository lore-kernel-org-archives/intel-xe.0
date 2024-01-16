Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D92C4706C
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 10:10:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626A510E447;
	Tue, 16 Jan 2024 10:10:18 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78D010E447;
 Tue, 16 Jan 2024 10:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/guc=3A_Enable_WA_140189?=
 =?utf-8?q?13170?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Date: Tue, 16 Jan 2024 10:10:16 -0000
Message-ID: <170539981668.500649.6762304218571678730@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240116095535.2304397-1-karthik.poosa@intel.com>
In-Reply-To: <20240116095535.2304397-1-karthik.poosa@intel.com>
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

Series: drm/xe/guc: Enable WA 14018913170
URL   : https://patchwork.freedesktop.org/series/128806/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[10:09:24] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:09:29] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[10:09:52] Starting KUnit Kernel (1/1)...
[10:09:52] ============================================================
[10:09:52] ========================= guc_dbm  =========================
[10:09:52] [PASSED] test_empty
[10:09:52] [PASSED] test_default
[10:09:52] ======================== test_size  ========================
[10:09:52] [PASSED] 4
[10:09:52] [PASSED] 8
[10:09:52] [PASSED] 32
[10:09:52] [PASSED] 256
[10:09:52] ==================== [PASSED] test_size ====================
[10:09:52] ======================= test_reuse  ========================
[10:09:52] [PASSED] 4
[10:09:52] [PASSED] 8
[10:09:52] [PASSED] 32
[10:09:52] [PASSED] 256
[10:09:52] =================== [PASSED] test_reuse ====================
[10:09:52] =================== test_range_overlap  ====================
[10:09:52] [PASSED] 4
[10:09:52] [PASSED] 8
[10:09:52] [PASSED] 32
[10:09:52] [PASSED] 256
[10:09:52] =============== [PASSED] test_range_overlap ================
[10:09:52] =================== test_range_compact  ====================
[10:09:52] [PASSED] 4
[10:09:52] [PASSED] 8
[10:09:52] [PASSED] 32
[10:09:52] [PASSED] 256
[10:09:52] =============== [PASSED] test_range_compact ================
[10:09:52] ==================== test_range_spare  =====================
[10:09:52] [PASSED] 4
[10:09:52] [PASSED] 8
[10:09:52] [PASSED] 32
[10:09:52] [PASSED] 256
[10:09:52] ================ [PASSED] test_range_spare =================
[10:09:52] ===================== [PASSED] guc_dbm =====================
[10:09:52] ======================== no_relay  =========================
[10:09:52] [PASSED] xe_drops_guc2pf_if_not_ready
[10:09:52] [PASSED] xe_drops_guc2vf_if_not_ready
[10:09:52] [PASSED] xe_rejects_send_if_not_ready
[10:09:52] ==================== [PASSED] no_relay =====================
[10:09:52] ======================== pf_relay  =========================
[10:09:52] [PASSED] pf_rejects_guc2pf_too_short
[10:09:52] [PASSED] pf_rejects_guc2pf_too_long
[10:09:52] [PASSED] pf_rejects_guc2pf_no_payload
[10:09:52] [PASSED] pf_fails_no_payload
[10:09:52] [PASSED] pf_fails_bad_origin
[10:09:52] [PASSED] pf_fails_bad_type
[10:09:52] [PASSED] pf_txn_reports_error
[10:09:52] [PASSED] pf_txn_sends_pf2guc
[10:09:52] [PASSED] pf_sends_pf2guc
[10:09:52] [SKIPPED] pf_loopback_nop
[10:09:52] [SKIPPED] pf_loopback_echo
[10:09:52] [SKIPPED] pf_loopback_fail
[10:09:52] [SKIPPED] pf_loopback_busy
[10:09:52] [SKIPPED] pf_loopback_retry
[10:09:52] ==================== [PASSED] pf_relay =====================
[10:09:52] ======================== vf_relay  =========================
[10:09:52] [PASSED] vf_rejects_guc2vf_too_short
[10:09:52] [PASSED] vf_rejects_guc2vf_too_long
[10:09:52] [PASSED] vf_rejects_guc2vf_no_payload
[10:09:52] ==================== [PASSED] vf_relay =====================
[10:09:52] ========================== lmtt  ===========================
[10:09:52] ======================== test_ops  =========================
[10:09:52] [PASSED] 2-level
[10:09:52] [PASSED] multi-level
[10:09:52] ==================== [PASSED] test_ops =====================
[10:09:52] ====================== [PASSED] lmtt =======================
[10:09:52] ========================== xe_bo  ==========================
[10:09:52] [SKIPPED] xe_ccs_migrate_kunit
[10:09:52] [SKIPPED] xe_bo_evict_kunit
[10:09:52] ===================== [SKIPPED] xe_bo ======================
[10:09:52] ======================= xe_dma_buf  ========================
[10:09:52] [SKIPPED] xe_dma_buf_kunit
[10:09:52] =================== [SKIPPED] xe_dma_buf ===================
[10:09:52] ======================= xe_migrate  ========================
[10:09:52] [SKIPPED] xe_migrate_sanity_kunit
[10:09:52] =================== [SKIPPED] xe_migrate ===================
[10:09:52] ========================= xe_mocs  =========================
[10:09:52] [SKIPPED] xe_live_mocs_kernel_kunit
[10:09:52] [SKIPPED] xe_live_mocs_reset_kunit
[10:09:52] ==================== [SKIPPED] xe_mocs =====================
[10:09:52] ========================= xe_pci  ==========================
[10:09:52] [PASSED] xe_gmdid_graphics_ip
[10:09:52] [PASSED] xe_gmdid_media_ip
[10:09:52] ===================== [PASSED] xe_pci ======================
[10:09:52] ========================= xe_rtp  ==========================
[10:09:52] ================== xe_rtp_process_tests  ===================
[10:09:52] [PASSED] coalesce-same-reg
[10:09:52] [PASSED] no-match-no-add
[10:09:52] [PASSED] no-match-no-add-multiple-rules
[10:09:52] [PASSED] two-regs-two-entries
[10:09:52] [PASSED] clr-one-set-other
[10:09:52] [PASSED] set-field
[10:09:52] [PASSED] conflict-duplicate
[10:09:52] [PASSED] conflict-not-disjoint
[10:09:52] [PASSED] conflict-reg-type
[10:09:52] ============== [PASSED] xe_rtp_process_tests ===============
[10:09:52] ===================== [PASSED] xe_rtp ======================
[10:09:52] ========================== xe_wa  ==========================
[10:09:52] ======================== xe_wa_gt  =========================
[10:09:52] [PASSED] TIGERLAKE (B0)
[10:09:52] [PASSED] DG1 (A0)
[10:09:52] [PASSED] DG1 (B0)
[10:09:52] [PASSED] ALDERLAKE_S (A0)
[10:09:52] [PASSED] ALDERLAKE_S (B0)
[10:09:52] [PASSED] ALDERLAKE_S (C0)
[10:09:52] [PASSED] ALDERLAKE_S (D0)
[10:09:52] [PASSED] ALDERLAKE_P (A0)
[10:09:52] [PASSED] ALDERLAKE_P (B0)
[10:09:52] [PASSED] ALDERLAKE_P (C0)
[10:09:52] [PASSED] ALDERLAKE_S_RPLS (D0)
[10:09:52] [PASSED] ALDERLAKE_P_RPLU (E0)
[10:09:52] [PASSED] DG2_G10 (C0)
[10:09:52] [PASSED] DG2_G11 (B1)
[10:09:52] [PASSED] DG2_G12 (A1)
[10:09:52] [PASSED] PVC (B0)
[10:09:52] [PASSED] PVC (B1)
[10:09:52] [PASSED] PVC (C0)
[10:09:52] [PASSED] METEORLAKE (g:A0, m:A0)
[10:09:52] [PASSED] METEORLAKE (g:A0, m:A0)
[10:09:52] [PASSED] LUNARLAKE (g:A0, m:A0)
[10:09:52] [PASSED] LUNARLAKE (g:B0, m:A0)
[10:09:52] ==================== [PASSED] xe_wa_gt =====================
[10:09:52] ====================== [PASSED] xe_wa ======================
[10:09:52] ============================================================
[10:09:52] Testing complete. Ran 83 tests: passed: 72, skipped: 11
[10:09:52] Elapsed time: 27.475s total, 4.194s configuring, 23.060s building, 0.189s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[10:09:52] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:09:54] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[10:10:13] Starting KUnit Kernel (1/1)...
[10:10:13] ============================================================
[10:10:13] ================== drm_test_pick_cmdline  ==================
[10:10:13] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[10:10:13] =============== drm_test_pick_cmdline_named  ===============
[10:10:13] [PASSED] NTSC
[10:10:13] [PASSED] NTSC-J
[10:10:13] [PASSED] PAL
[10:10:13] [PASSED] PAL-M
[10:10:13] =========== [PASSED] drm_test_pick_cmdline_named ===========
[10:10:13] ============== [PASSED] drm_test_pick_cmdline ==============
[10:10:13] ======================== drm_buddy  ========================
[10:10:13] [PASSED] drm_test_buddy_alloc_limit
[10:10:13] [PASSED] drm_test_buddy_alloc_optimistic
[10:10:13] [PASSED] drm_test_buddy_alloc_pessimistic
[10:10:13] [PASSED] drm_test_buddy_alloc_pathological
[10:10:13] ==================== [PASSED] drm_buddy ====================
[10:10:13] =================== drm_cmdline_parser  ====================
[10:10:13] [PASSED] drm_test_cmdline_force_d_only
[10:10:13] [PASSED] drm_test_cmdline_force_D_only_dvi
[10:10:13] [PASSED] drm_test_cmdline_force_D_only_hdmi
[10:10:13] [PASSED] drm_test_cmdline_force_D_only_not_digital
[10:10:13] [PASSED] drm_test_cmdline_force_e_only
[10:10:13] [PASSED] drm_test_cmdline_res
[10:10:13] [PASSED] drm_test_cmdline_res_vesa
[10:10:13] [PASSED] drm_test_cmdline_res_vesa_rblank
[10:10:13] [PASSED] drm_test_cmdline_res_rblank
[10:10:13] [PASSED] drm_test_cmdline_res_bpp
[10:10:13] [PASSED] drm_test_cmdline_res_refresh
[10:10:13] [PASSED] drm_test_cmdline_res_bpp_refresh
[10:10:13] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[10:10:13] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[10:10:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[10:10:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[10:10:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[10:10:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[10:10:13] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[10:10:13] [PASSED] drm_test_cmdline_res_margins_force_on
[10:10:13] [PASSED] drm_test_cmdline_res_vesa_margins
[10:10:13] [PASSED] drm_test_cmdline_name
[10:10:13] [PASSED] drm_test_cmdline_name_bpp
[10:10:13] [PASSED] drm_test_cmdline_name_option
[10:10:13] [PASSED] drm_test_cmdline_name_bpp_option
[10:10:13] [PASSED] drm_test_cmdline_rotate_0
[10:10:13] [PASSED] drm_test_cmdline_rotate_90
[10:10:13] [PASSED] drm_test_cmdline_rotate_180
[10:10:13] [PASSED] drm_test_cmdline_rotate_270
[10:10:13] [PASSED] drm_test_cmdline_hmirror
[10:10:13] [PASSED] drm_test_cmdline_vmirror
[10:10:13] [PASSED] drm_test_cmdline_margin_options
[10:10:13] [PASSED] drm_test_cmdline_multiple_options
[10:10:13] [PASSED] drm_test_cmdline_bpp_extra_and_option
[10:10:13] [PASSED] drm_test_cmdline_extra_and_option
[10:10:13] [PASSED] drm_test_cmdline_freestanding_options
[10:10:13] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[10:10:13] [PASSED] drm_test_cmdline_panel_orientation
[10:10:13] ================ drm_test_cmdline_invalid  =================
[10:10:13] [PASSED] margin_only
[10:10:13] [PASSED] interlace_only
[10:10:13] [PASSED] res_missing_x
[10:10:13] [PASSED] res_missing_y
[10:10:13] [PASSED] res_bad_y
[10:10:13] [PASSED] res_missing_y_bpp
[10:10:13] [PASSED] res_bad_bpp
[10:10:13] [PASSED] res_bad_refresh
[10:10:13] [PASSED] res_bpp_refresh_force_on_off
[10:10:13] [PASSED] res_invalid_mode
[10:10:13] [PASSED] res_bpp_wrong_place_mode
[10:10:13] [PASSED] name_bpp_refresh
[10:10:13] [PASSED] name_refresh
[10:10:13] [PASSED] name_refresh_wrong_mode
[10:10:13] [PASSED] name_refresh_invalid_mode
[10:10:13] [PASSED] rotate_multiple
[10:10:13] [PASSED] rotate_invalid_val
[10:10:13] [PASSED] rotate_truncated
[10:10:13] [PASSED] invalid_option
[10:10:13] [PASSED] invalid_tv_option
[10:10:13] [PASSED] truncated_tv_option
[10:10:13] ============ [PASSED] drm_test_cmdline_invalid =============
[10:10:13] =============== drm_test_cmdline_tv_options  ===============
[10:10:13] [PASSED] NTSC
[10:10:13] [PASSED] NTSC_443
[10:10:13] [PASSED] NTSC_J
[10:10:13] [PASSED] PAL
[10:10:13] [PASSED] PAL_M
[10:10:13] [PASSED] PAL_N
[10:10:13] [PASSED] SECAM
[10:10:13] =========== [PASSED] drm_test_cmdline_tv_options ===========
[10:10:13] =============== [PASSED] drm_cmdline_parser ================
[10:10:13] ================ drm_get_tv_mode_from_name  ================
[10:10:13] ========== drm_test_get_tv_mode_from_name_valid  ===========
[10:10:13] [PASSED] NTSC
[10:10:13] [PASSED] NTSC-443
[10:10:13] [PASSED] NTSC-J
[10:10:13] [PASSED] PAL
[10:10:13] [PASSED] PAL-M
[10:10:13] [PASSED] PAL-N
[10:10:13] [PASSED] SECAM
[10:10:13] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[10:10:13] [PASSED] drm_test_get_tv_mode_from_name_truncated
[10:10:13] ============ [PASSED] drm_get_tv_mode_from_name ============
[10:10:13] ==================== drm_damage_helper  ====================
[10:10:13] [PASSED] drm_test_damage_iter_no_damage
[10:10:13] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[10:10:13] [PASSED] drm_test_damage_iter_no_damage_src_moved
[10:10:13] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[10:10:13] [PASSED] drm_test_damage_iter_no_damage_not_visible
[10:10:13] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[10:10:13] [PASSED] drm_test_damage_iter_no_damage_no_fb
[10:10:13] [PASSED] drm_test_damage_iter_simple_damage
[10:10:13] [PASSED] drm_test_damage_iter_single_damage
[10:10:13] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[10:10:13] [PASSED] drm_test_damage_iter_single_damage_outside_src
[10:10:13] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[10:10:13] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[10:10:13] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[10:10:13] [PASSED] drm_test_damage_iter_single_damage_src_moved
[10:10:13] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[10:10:13] [PASSED] drm_test_damage_iter_damage
[10:10:13] [PASSED] drm_test_damage_iter_damage_one_intersect
[10:10:13] [PASSED] drm_test_damage_iter_damage_one_outside
[10:10:13] [PASSED] drm_test_damage_iter_damage_src_moved
[10:10:13] [PASSED] drm_test_damage_iter_damage_not_visible
[10:10:13] ================ [PASSED] drm_damage_helper ================
[10:10:13] ==================== drm_dp_mst_helper  ====================
[10:10:13] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[10:10:13] [PASSED] Clock 154000 BPP 30 DSC disabled
[10:10:13] [PASSED] Clock 234000 BPP 30 DSC disabled
[10:10:13] [PASSED] Clock 297000 BPP 24 DSC disabled
[10:10:13] [PASSED] Clock 332880 BPP 24 DSC enabled
[10:10:13] [PASSED] Clock 324540 BPP 24 DSC enabled
[10:10:13] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[10:10:13] ============== drm_test_dp_mst_calc_pbn_div  ===============
[10:10:13] [PASSED] Link rate 2000000 lane count 4
[10:10:13] [PASSED] Link rate 2000000 lane count 2
[10:10:13] [PASSED] Link rate 2000000 lane count 1
[10:10:13] [PASSED] Link rate 1350000 lane count 4
[10:10:13] [PASSED] Link rate 1350000 lane count 2
[10:10:13] [PASSED] Link rate 1350000 lane count 1
[10:10:13] [PASSED] Link rate 1000000 lane count 4
[10:10:13] [PASSED] Link rate 1000000 lane count 2
[10:10:13] [PASSED] Link rate 1000000 lane count 1
[10:10:13] [PASSED] Link rate 810000 lane count 4
[10:10:13] [PASSED] Link rate 810000 lane count 2
[10:10:13] [PASSED] Link rate 810000 lane count 1
[10:10:13] [PASSED] Link rate 540000 lane count 4
[10:10:13] [PASSED] Link rate 540000 lane count 2
[10:10:13] [PASSED] Link rate 540000 lane count 1
[10:10:13] [PASSED] Link rate 270000 lane count 4
[10:10:13] [PASSED] Link rate 270000 lane count 2
[10:10:13] [PASSED] Link rate 270000 lane count 1
[10:10:13] [PASSED] Link rate 162000 lane count 4
[10:10:13] [PASSED] Link rate 162000 lane count 2
[10:10:13] [PASSED] Link rate 162000 lane count 1
[10:10:13] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[10:10:13] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[10:10:13] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[10:10:13] [PASSED] DP_POWER_UP_PHY with port number
[10:10:13] [PASSED] DP_POWER_DOWN_PHY with port number
[10:10:13] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[10:10:13] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[10:10:13] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[10:10:13] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[10:10:13] [PASSED] DP_QUERY_PAYLOAD with port number
[10:10:13] [PASSED] DP_QUERY_PAYLOAD with VCPI
[10:10:13] [PASSED] DP_REMOTE_DPCD_READ with port number
[10:10:13] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[10:10:13] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[10:10:13] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[10:10:13] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[10:10:13] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[10:10:13] [PASSED] DP_REMOTE_I2C_READ with port number
[10:10:13] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[10:10:13] [PASSED] DP_REMOTE_I2C_READ with transactions array
[10:10:13] [PASSED] DP_REMOTE_I2C_WRITE with port number
[10:10:13] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[10:10:13] [PASSED] DP_REMOTE_I2C_WRITE with data array
[10:10:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[10:10:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[10:10:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[10:10:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[10:10:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[10:10:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[10:10:13] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[10:10:13] ================ [PASSED] drm_dp_mst_helper ================
[10:10:13] ======================== drm_exec  =========================
[10:10:13] [PASSED] sanitycheck
[10:10:13] [PASSED] test_lock
[10:10:13] [PASSED] test_lock_unlock
[10:10:13] [PASSED] test_duplicates
[10:10:13] [PASSED] test_prepare
[10:10:13] [PASSED] test_prepare_array
[10:10:13] [PASSED] test_multiple_loops
[10:10:13] ==================== [PASSED] drm_exec =====================
[10:10:13] ================= drm_format_helper_test  ==================
[10:10:13] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[10:10:13] [PASSED] single_pixel_source_buffer
[10:10:13] [PASSED] single_pixel_clip_rectangle
[10:10:13] [PASSED] well_known_colors
[10:10:13] [PASSED] destination_pitch
[10:10:13] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[10:10:13] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[10:10:13] [PASSED] single_pixel_source_buffer
[10:10:13] [PASSED] single_pixel_clip_rectangle
[10:10:13] [PASSED] well_known_colors
[10:10:13] [PASSED] destination_pitch
[10:10:13] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[10:10:13] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[10:10:13] [PASSED] single_pixel_source_buffer
[10:10:13] [PASSED] single_pixel_clip_rectangle
[10:10:13] [PASSED] well_known_colors
[10:10:13] [PASSED] destination_pitch
[10:10:13] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[10:10:13] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[10:10:13] [PASSED] single_pixel_source_buffer
[10:10:13] [PASSED] single_pixel_clip_rectangle
[10:10:13] [PASSED] well_known_colors
[10:10:13] [PASSED] destination_pitch
[10:10:13] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[10:10:13] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[10:10:13] [PASSED] single_pixel_source_buffer
[10:10:13] [PASSED] single_pixel_clip_rectangle
[10:10:13] [PASSED] well_known_colors
[10:10:13] [PASSED] destination_pitch
[10:10:13] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[10:10:13] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[10:10:13] [PASSED] single_pixel_source_buffer
[10:10:13] [PASSED] single_pixel_clip_rectangle
[10:10:13] [PASSED] well_known_colors
[10:10:13] [PASSED] destination_pitch
[10:10:13] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[10:10:13] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[10:10:13] [PASSED] single_pixel_source_buffer
[10:10:13] [PASSED] single_pixel_clip_rectangle
[10:10:13] [PASSED] well_known_colors
[10:10:13] [PASSED] destination_pitch
[10:10:13] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[10:10:13] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[10:10:13] [PASSED] single_pixel_source_buffer
[10:10:13] [PASSED] single_pixel_clip_rectangle
[10:10:13] [PASSED] well_known_colors
[10:10:13] [PASSED] destination_pitch
[10:10:13] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[10:10:13] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[10:10:13] [PASSED] single_pixel_source_buffer
[10:10:13] [PASSED] single_pixel_clip_rectangle
[10:10:13] [PASSED] well_known_colors
[10:10:13] [PASSED] destination_pitch
[10:10:13] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[10:10:13] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[10:10:13] [PASSED] single_pixel_source_buffer
[10:10:13] [PASSED] single_pixel_clip_rectangle
[10:10:13] [PASSED] well_known_colors
[10:10:13] [PASSED] destination_pitch
[10:10:13] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[10:10:13] ============== drm_test_fb_xrgb8888_to_mono  ===============
[10:10:13] [PASSED] single_pixel_source_buffer
[10:10:13] [PASSED] single_pixel_clip_rectangle
[10:10:13] [PASSED] well_known_colors
[10:10:13] [PASSED] destination_pitch
[10:10:13] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[10:10:13] ==================== drm_test_fb_swab  =====================
[10:10:13] [PASSED] single_pixel_source_buffer
[10:10:13] [PASSED] single_pixel_clip_rectangle
[10:10:13] [PASSED] well_known_colors
[10:10:13] [PASSED] destination_pitch
[10:10:13] ================ [PASSED] drm_test_fb_swab =================
[10:10:13] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[10:10:13] [PASSED] single_pixel_source_buffer
[10:10:13] [PASSED] single_pixel_clip_rectangle
[10:10:13] [PASSED] well_known_colors
[10:10:13] [PASSED] destination_pitch
[10:10:13] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[10:10:13] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[10:10:13] [PASSED] single_pixel_source_buffer
[10:10:13] [PASSED] single_pixel_clip_rectangle
[10:10:13] [PASSED] well_known_colors
[10:10:13] [PASSED] destination_pitch
[10:10:13] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[10:10:13] ================= drm_test_fb_clip_offset  =================
[10:10:13] [PASSED] pass through
[10:10:13] [PASSED] horizontal offset
[10:10:13] [PASSED] vertical offset
[10:10:13] [PASSED] horizontal and vertical offset
[10:10:13] [PASSED] horizontal offset (custom pitch)
[10:10:13] [PASSED] vertical offset (custom pitch)
[10:10:13] [PASSED] horizontal and vertical offset (custom pitch)
[10:10:13] ============= [PASSED] drm_test_fb_clip_offset =============
[10:10:13] ============== drm_test_fb_build_fourcc_list  ==============
[10:10:13] [PASSED] no native formats
[10:10:13] [PASSED] XRGB8888 as native format
[10:10:13] [PASSED] remove duplicates
[10:10:13] [PASSED] convert alpha formats
[10:10:13] [PASSED] random formats
[10:10:13] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[10:10:13] =================== drm_test_fb_memcpy  ====================
[10:10:13] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[10:10:13] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[10:10:13] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[10:10:13] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[10:10:13] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[10:10:13] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[10:10:13] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[10:10:13] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[10:10:13] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[10:10:13] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[10:10:13] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[10:10:13] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[10:10:13] =============== [PASSED] drm_test_fb_memcpy ================
[10:10:13] ============= [PASSED] drm_format_helper_test ==============
[10:10:13] ======================= drm_format  ========================
[10:10:13] [PASSED] drm_test_format_block_width_invalid
[10:10:13] [PASSED] drm_test_format_block_width_one_plane
[10:10:13] [PASSED] drm_test_format_block_width_two_plane
[10:10:13] [PASSED] drm_test_format_block_width_three_plane
[10:10:13] [PASSED] drm_test_format_block_width_tiled
[10:10:13] [PASSED] drm_test_format_block_height_invalid
[10:10:13] [PASSED] drm_test_format_block_height_one_plane
[10:10:13] [PASSED] drm_test_format_block_height_two_plane
[10:10:13] [PASSED] drm_test_format_block_height_three_plane
[10:10:13] [PASSED] drm_test_format_block_height_tiled
[10:10:13] [PASSED] drm_test_format_min_pitch_invalid
[10:10:13] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[10:10:13] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[10:10:13] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[10:10:13] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[10:10:13] [PASSED] drm_test_format_min_pitch_two_plane
[10:10:13] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[10:10:13] [PASSED] drm_test_format_min_pitch_tiled
[10:10:13] =================== [PASSED] drm_format ====================
[10:10:13] ===================== drm_framebuffer  =====================
[10:10:13] =============== drm_test_framebuffer_create  ===============
[10:10:13] [PASSED] ABGR8888 normal sizes
[10:10:13] [PASSED] ABGR8888 max sizes
[10:10:13] [PASSED] ABGR8888 pitch greater than min required
[10:10:13] [PASSED] ABGR8888 pitch less than min required
[10:10:13] [PASSED] ABGR8888 Invalid width
[10:10:13] [PASSED] ABGR8888 Invalid buffer handle
[10:10:13] [PASSED] No pixel format
[10:10:13] [PASSED] ABGR8888 Width 0
[10:10:13] [PASSED] ABGR8888 Height 0
[10:10:13] [PASSED] ABGR8888 Out of bound height * pitch combination
[10:10:13] [PASSED] ABGR8888 Large buffer offset
[10:10:13] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[10:10:13] [PASSED] ABGR8888 Valid buffer modifier
[10:10:13] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[10:10:13] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[10:10:13] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[10:10:13] [PASSED] NV12 Normal sizes
[10:10:13] [PASSED] NV12 Max sizes
[10:10:13] [PASSED] NV12 Invalid pitch
[10:10:13] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[10:10:13] [PASSED] NV12 different  modifier per-plane
[10:10:13] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[10:10:13] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[10:10:13] [PASSED] NV12 Modifier for inexistent plane
[10:10:13] [PASSED] NV12 Handle for inexistent plane
[10:10:13] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[10:10:13] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[10:10:13] [PASSED] YVU420 Normal sizes
[10:10:13] [PASSED] YVU420 Max sizes
[10:10:13] [PASSED] YVU420 Invalid pitch
[10:10:13] [PASSED] YVU420 Different pitches
[10:10:13] [PASSED] YVU420 Different buffer offsets/pitches
[10:10:13] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[10:10:13] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[10:10:13] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[10:10:13] [PASSED] YVU420 Valid modifier
[10:10:13] [PASSED] YVU420 Different modifiers per plane
[10:10:13] [PASSED] YVU420 Modifier for inexistent plane
[10:10:13] [PASSED] X0L2 Normal sizes
[10:10:13] [PASSED] X0L2 Max sizes
[10:10:13] [PASSED] X0L2 Invalid pitch
[10:10:13] [PASSED] X0L2 Pitch greater than minimum required
[10:10:13] [PASSED] X0L2 Handle for inexistent plane
[10:10:13] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[10:10:13] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[10:10:13] [PASSED] X0L2 Valid modifier
[10:10:13] [PASSED] X0L2 Modifier for inexistent plane
[10:10:13] =========== [PASSED] drm_test_framebuffer_create ===========
[10:10:13] ================= [PASSED] drm_framebuffer =================
[10:10:13] ====================== drm_gem_shmem  ======================
[10:10:13] [PASSED] drm_gem_shmem_test_obj_create
[10:10:13] [PASSED] drm_gem_shmem_test_obj_create_private
[10:10:13] [PASSED] drm_gem_shmem_test_pin_pages
[10:10:13] [PASSED] drm_gem_shmem_test_vmap
[10:10:13] [PASSED] drm_gem_shmem_test_get_pages_sgt
[10:10:13] [PASSED] drm_gem_shmem_test_get_sg_table
[10:10:13] [PASSED] drm_gem_shmem_test_madvise
[10:10:13] [PASSED] drm_gem_shmem_test_purge
[10:10:13] ================== [PASSED] drm_gem_shmem ==================
[10:10:13] ==================== drm-test-managed  =====================
[10:10:13] [PASSED] drm_test_managed_run_action
[10:10:13] ================ [PASSED] drm-test-managed =================
[10:10:13] ========================= drm_mm  ==========================
[10:10:13] [PASSED] drm_test_mm_init
[10:10:13] [PASSED] drm_test_mm_debug
[10:10:13] [PASSED] drm_test_mm_align32
[10:10:13] [PASSED] drm_test_mm_align64
[10:10:13] [PASSED] drm_test_mm_lowest
[10:10:13] [PASSED] drm_test_mm_highest
[10:10:13] ===================== [PASSED] drm_mm ======================
[10:10:13] =================== drm_modes_analog_tv  ===================
[10:10:13] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[10:10:13] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[10:10:13] [PASSED] drm_test_modes_analog_tv_pal_576i
[10:10:13] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[10:10:13] =============== [PASSED] drm_modes_analog_tv ===============
[10:10:13] ==================== drm_plane_helper  =====================
[10:10:13] =============== drm_test_check_plane_state  ================
[10:10:13] [PASSED] clipping_simple
[10:10:13] [PASSED] clipping_rotate_reflect
[10:10:13] [PASSED] positioning_simple
[10:10:13] [PASSED] upscaling
[10:10:13] [PASSED] downscaling
[10:10:13] [PASSED] rounding1
[10:10:13] [PASSED] rounding2
[10:10:13] [PASSED] rounding3
[10:10:13] [PASSED] rounding4
[10:10:13] =========== [PASSED] drm_test_check_plane_state ============
[10:10:13] =========== drm_test_check_invalid_plane_state  ============
[10:10:13] [PASSED] positioning_invalid
[10:10:13] [PASSED] upscaling_invalid
[10:10:13] [PASSED] downscaling_invalid
[10:10:13] ======= [PASSED] drm_test_check_invalid_plane_state ========
[10:10:13] ================ [PASSED] drm_plane_helper =================
[10:10:13] ============ drm_connector_helper_tv_get_modes  ============
[10:10:13] ====== drm_test_connector_helper_tv_get_modes_check  =======
[10:10:13] [PASSED] None
[10:10:13] [PASSED] PAL
[10:10:13] [PASSED] NTSC
[10:10:13] [PASSED] Both, NTSC Default
[10:10:13] [PASSED] Both, PAL Default
[10:10:13] [PASSED] Both, NTSC Default, with PAL on command-line
[10:10:13] [PASSED] Both, PAL Default, with NTSC on command-line
[10:10:13] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[10:10:13] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[10:10:13] ======================== drm_rect  =========================
[10:10:13] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[10:10:13] [PASSED] drm_test_rect_clip_scaled_not_clipped
[10:10:13] [PASSED] drm_test_rect_clip_scaled_clipped
[10:10:13] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[10:10:13] ================= drm_test_rect_intersect  =================
[10:10:13] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[10:10:13] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
stty: 'standard input': Inappropriate ioctl for device
[10:10:13] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[10:10:13] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[10:10:13] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[10:10:13] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[10:10:13] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[10:10:13] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[10:10:13] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[10:10:13] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[10:10:13] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[10:10:13] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[10:10:13] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[10:10:13] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[10:10:13] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[10:10:13] ============= [PASSED] drm_test_rect_intersect =============
[10:10:13] ================ drm_test_rect_calc_hscale  ================
[10:10:13] [PASSED] normal use
[10:10:13] [PASSED] out of max range
[10:10:13] [PASSED] out of min range
[10:10:13] [PASSED] zero dst
[10:10:13] [PASSED] negative src
[10:10:13] [PASSED] negative dst
[10:10:13] ============ [PASSED] drm_test_rect_calc_hscale ============
[10:10:13] ================ drm_test_rect_calc_vscale  ================
[10:10:13] [PASSED] normal use
[10:10:13] [PASSED] out of max range
[10:10:13] [PASSED] out of min range
[10:10:13] [PASSED] zero dst
[10:10:13] [PASSED] negative src
[10:10:13] [PASSED] negative dst
[10:10:13] ============ [PASSED] drm_test_rect_calc_vscale ============
[10:10:13] ================== drm_test_rect_rotate  ===================
[10:10:13] [PASSED] reflect-x
[10:10:13] [PASSED] reflect-y
[10:10:13] [PASSED] rotate-0
[10:10:13] [PASSED] rotate-90
[10:10:13] [PASSED] rotate-180
[10:10:13] [PASSED] rotate-270
[10:10:13] ============== [PASSED] drm_test_rect_rotate ===============
[10:10:13] ================ drm_test_rect_rotate_inv  =================
[10:10:13] [PASSED] reflect-x
[10:10:13] [PASSED] reflect-y
[10:10:13] [PASSED] rotate-0
[10:10:13] [PASSED] rotate-90
[10:10:13] [PASSED] rotate-180
[10:10:13] [PASSED] rotate-270
[10:10:13] ============ [PASSED] drm_test_rect_rotate_inv =============
[10:10:13] ==================== [PASSED] drm_rect =====================
[10:10:13] ============================================================
[10:10:13] Testing complete. Ran 390 tests: passed: 390
[10:10:13] Elapsed time: 21.349s total, 1.685s configuring, 19.541s building, 0.121s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


