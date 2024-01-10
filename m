Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13EAC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 06:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6869510E0E8;
	Wed, 10 Jan 2024 06:14:12 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451E210E0E8;
 Wed, 10 Jan 2024 06:14:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_series_starting_with_=5B1/2=5D?=
 =?utf-8?q?_drm/xe/xe2=5Flpg=3A_Introduce_performance_guide_changes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Date: Wed, 10 Jan 2024 06:14:11 -0000
Message-ID: <170486725128.240792.1792226376755035004@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240110060951.779234-1-shekhar.chauhan@intel.com>
In-Reply-To: <20240110060951.779234-1-shekhar.chauhan@intel.com>
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

Series: series starting with [1/2] drm/xe/xe2_lpg: Introduce performance guide changes
URL   : https://patchwork.freedesktop.org/series/128411/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[06:13:19] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:13:23] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[06:13:47] Starting KUnit Kernel (1/1)...
[06:13:47] ============================================================
[06:13:47] ========================= guc_dbm  =========================
[06:13:47] [PASSED] test_empty
[06:13:47] [PASSED] test_default
[06:13:47] ======================== test_size  ========================
[06:13:47] [PASSED] 4
[06:13:47] [PASSED] 8
[06:13:47] [PASSED] 32
[06:13:47] [PASSED] 256
[06:13:47] ==================== [PASSED] test_size ====================
[06:13:47] ======================= test_reuse  ========================
[06:13:47] [PASSED] 4
[06:13:47] [PASSED] 8
[06:13:47] [PASSED] 32
[06:13:47] [PASSED] 256
[06:13:47] =================== [PASSED] test_reuse ====================
[06:13:47] =================== test_range_overlap  ====================
[06:13:47] [PASSED] 4
[06:13:47] [PASSED] 8
[06:13:47] [PASSED] 32
[06:13:47] [PASSED] 256
[06:13:47] =============== [PASSED] test_range_overlap ================
[06:13:47] =================== test_range_compact  ====================
[06:13:47] [PASSED] 4
[06:13:47] [PASSED] 8
[06:13:47] [PASSED] 32
[06:13:47] [PASSED] 256
[06:13:47] =============== [PASSED] test_range_compact ================
[06:13:47] ==================== test_range_spare  =====================
[06:13:47] [PASSED] 4
[06:13:47] [PASSED] 8
[06:13:47] [PASSED] 32
[06:13:47] [PASSED] 256
[06:13:47] ================ [PASSED] test_range_spare =================
[06:13:47] ===================== [PASSED] guc_dbm =====================
[06:13:47] ======================== no_relay  =========================
[06:13:47] [PASSED] xe_drops_guc2pf_if_not_ready
[06:13:47] [PASSED] xe_drops_guc2vf_if_not_ready
[06:13:47] [PASSED] xe_rejects_send_if_not_ready
[06:13:47] ==================== [PASSED] no_relay =====================
[06:13:47] ======================== pf_relay  =========================
[06:13:47] [PASSED] pf_rejects_guc2pf_too_short
[06:13:47] [PASSED] pf_rejects_guc2pf_too_long
[06:13:47] [PASSED] pf_rejects_guc2pf_no_payload
[06:13:47] [PASSED] pf_fails_no_payload
[06:13:47] [PASSED] pf_fails_bad_origin
[06:13:47] [PASSED] pf_fails_bad_type
[06:13:47] [PASSED] pf_txn_reports_error
[06:13:47] [PASSED] pf_txn_sends_pf2guc
[06:13:47] [PASSED] pf_sends_pf2guc
[06:13:47] [SKIPPED] pf_loopback_nop
[06:13:47] [SKIPPED] pf_loopback_echo
[06:13:47] [SKIPPED] pf_loopback_fail
[06:13:47] [SKIPPED] pf_loopback_busy
[06:13:47] [SKIPPED] pf_loopback_retry
[06:13:47] ==================== [PASSED] pf_relay =====================
[06:13:47] ======================== vf_relay  =========================
[06:13:47] [PASSED] vf_rejects_guc2vf_too_short
[06:13:47] [PASSED] vf_rejects_guc2vf_too_long
[06:13:47] [PASSED] vf_rejects_guc2vf_no_payload
[06:13:47] ==================== [PASSED] vf_relay =====================
[06:13:47] ========================== lmtt  ===========================
[06:13:47] ======================== test_ops  =========================
[06:13:47] [PASSED] 2-level
[06:13:47] [PASSED] multi-level
[06:13:47] ==================== [PASSED] test_ops =====================
[06:13:47] ====================== [PASSED] lmtt =======================
[06:13:47] ========================== xe_bo  ==========================
[06:13:47] [SKIPPED] xe_ccs_migrate_kunit
[06:13:47] [SKIPPED] xe_bo_evict_kunit
[06:13:47] ===================== [SKIPPED] xe_bo ======================
[06:13:47] ======================= xe_dma_buf  ========================
[06:13:47] [SKIPPED] xe_dma_buf_kunit
[06:13:47] =================== [SKIPPED] xe_dma_buf ===================
[06:13:47] ======================= xe_migrate  ========================
[06:13:47] [SKIPPED] xe_migrate_sanity_kunit
[06:13:47] =================== [SKIPPED] xe_migrate ===================
[06:13:47] ========================= xe_mocs  =========================
[06:13:47] [SKIPPED] xe_live_mocs_kernel_kunit
[06:13:47] [SKIPPED] xe_live_mocs_reset_kunit
[06:13:47] ==================== [SKIPPED] xe_mocs =====================
[06:13:47] ========================= xe_pci  ==========================
[06:13:47] [PASSED] xe_gmdid_graphics_ip
[06:13:47] [PASSED] xe_gmdid_media_ip
[06:13:47] ===================== [PASSED] xe_pci ======================
[06:13:47] ========================= xe_rtp  ==========================
[06:13:47] ================== xe_rtp_process_tests  ===================
[06:13:47] [PASSED] coalesce-same-reg
[06:13:47] [PASSED] no-match-no-add
[06:13:47] [PASSED] no-match-no-add-multiple-rules
[06:13:47] [PASSED] two-regs-two-entries
[06:13:47] [PASSED] clr-one-set-other
[06:13:47] [PASSED] set-field
[06:13:47] [PASSED] conflict-duplicate
[06:13:47] [PASSED] conflict-not-disjoint
[06:13:47] [PASSED] conflict-reg-type
[06:13:47] ============== [PASSED] xe_rtp_process_tests ===============
[06:13:47] ===================== [PASSED] xe_rtp ======================
[06:13:47] ========================== xe_wa  ==========================
[06:13:47] ======================== xe_wa_gt  =========================
[06:13:47] [PASSED] TIGERLAKE (B0)
[06:13:47] [PASSED] DG1 (A0)
[06:13:47] [PASSED] DG1 (B0)
[06:13:47] [PASSED] ALDERLAKE_S (A0)
[06:13:47] [PASSED] ALDERLAKE_S (B0)
[06:13:47] [PASSED] ALDERLAKE_S (C0)
[06:13:47] [PASSED] ALDERLAKE_S (D0)
[06:13:47] [PASSED] ALDERLAKE_P (A0)
[06:13:47] [PASSED] ALDERLAKE_P (B0)
[06:13:47] [PASSED] ALDERLAKE_P (C0)
[06:13:47] [PASSED] ALDERLAKE_S_RPLS (D0)
[06:13:47] [PASSED] ALDERLAKE_P_RPLU (E0)
[06:13:47] [PASSED] DG2_G10 (C0)
[06:13:47] [PASSED] DG2_G11 (B1)
[06:13:47] [PASSED] DG2_G12 (A1)
[06:13:47] [PASSED] PVC (B0)
[06:13:47] [PASSED] PVC (B1)
[06:13:47] [PASSED] PVC (C0)
[06:13:47] [PASSED] METEORLAKE (g:A0, m:A0)
[06:13:47] [PASSED] METEORLAKE (g:A0, m:A0)
[06:13:47] [PASSED] LUNARLAKE (g:A0, m:A0)
[06:13:47] [PASSED] LUNARLAKE (g:B0, m:A0)
[06:13:47] ==================== [PASSED] xe_wa_gt =====================
[06:13:47] ====================== [PASSED] xe_wa ======================
[06:13:47] ============================================================
[06:13:47] Testing complete. Ran 83 tests: passed: 72, skipped: 11
[06:13:47] Elapsed time: 27.901s total, 4.216s configuring, 23.465s building, 0.185s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[06:13:47] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:13:49] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[06:14:08] Starting KUnit Kernel (1/1)...
[06:14:08] ============================================================
[06:14:09] ================== drm_test_pick_cmdline  ==================
[06:14:09] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[06:14:09] =============== drm_test_pick_cmdline_named  ===============
[06:14:09] [PASSED] NTSC
[06:14:09] [PASSED] NTSC-J
[06:14:09] [PASSED] PAL
[06:14:09] [PASSED] PAL-M
[06:14:09] =========== [PASSED] drm_test_pick_cmdline_named ===========
[06:14:09] ============== [PASSED] drm_test_pick_cmdline ==============
[06:14:09] ======================== drm_buddy  ========================
[06:14:09] [PASSED] drm_test_buddy_alloc_limit
[06:14:09] [PASSED] drm_test_buddy_alloc_optimistic
[06:14:09] [PASSED] drm_test_buddy_alloc_pessimistic
[06:14:09] [PASSED] drm_test_buddy_alloc_pathological
[06:14:09] ==================== [PASSED] drm_buddy ====================
[06:14:09] =================== drm_cmdline_parser  ====================
[06:14:09] [PASSED] drm_test_cmdline_force_d_only
[06:14:09] [PASSED] drm_test_cmdline_force_D_only_dvi
[06:14:09] [PASSED] drm_test_cmdline_force_D_only_hdmi
[06:14:09] [PASSED] drm_test_cmdline_force_D_only_not_digital
[06:14:09] [PASSED] drm_test_cmdline_force_e_only
[06:14:09] [PASSED] drm_test_cmdline_res
[06:14:09] [PASSED] drm_test_cmdline_res_vesa
[06:14:09] [PASSED] drm_test_cmdline_res_vesa_rblank
[06:14:09] [PASSED] drm_test_cmdline_res_rblank
[06:14:09] [PASSED] drm_test_cmdline_res_bpp
[06:14:09] [PASSED] drm_test_cmdline_res_refresh
[06:14:09] [PASSED] drm_test_cmdline_res_bpp_refresh
[06:14:09] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[06:14:09] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[06:14:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[06:14:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[06:14:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[06:14:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[06:14:09] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[06:14:09] [PASSED] drm_test_cmdline_res_margins_force_on
[06:14:09] [PASSED] drm_test_cmdline_res_vesa_margins
[06:14:09] [PASSED] drm_test_cmdline_name
[06:14:09] [PASSED] drm_test_cmdline_name_bpp
[06:14:09] [PASSED] drm_test_cmdline_name_option
[06:14:09] [PASSED] drm_test_cmdline_name_bpp_option
[06:14:09] [PASSED] drm_test_cmdline_rotate_0
[06:14:09] [PASSED] drm_test_cmdline_rotate_90
[06:14:09] [PASSED] drm_test_cmdline_rotate_180
[06:14:09] [PASSED] drm_test_cmdline_rotate_270
[06:14:09] [PASSED] drm_test_cmdline_hmirror
[06:14:09] [PASSED] drm_test_cmdline_vmirror
[06:14:09] [PASSED] drm_test_cmdline_margin_options
[06:14:09] [PASSED] drm_test_cmdline_multiple_options
[06:14:09] [PASSED] drm_test_cmdline_bpp_extra_and_option
[06:14:09] [PASSED] drm_test_cmdline_extra_and_option
[06:14:09] [PASSED] drm_test_cmdline_freestanding_options
[06:14:09] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[06:14:09] [PASSED] drm_test_cmdline_panel_orientation
[06:14:09] ================ drm_test_cmdline_invalid  =================
[06:14:09] [PASSED] margin_only
[06:14:09] [PASSED] interlace_only
[06:14:09] [PASSED] res_missing_x
[06:14:09] [PASSED] res_missing_y
[06:14:09] [PASSED] res_bad_y
[06:14:09] [PASSED] res_missing_y_bpp
[06:14:09] [PASSED] res_bad_bpp
[06:14:09] [PASSED] res_bad_refresh
[06:14:09] [PASSED] res_bpp_refresh_force_on_off
[06:14:09] [PASSED] res_invalid_mode
[06:14:09] [PASSED] res_bpp_wrong_place_mode
[06:14:09] [PASSED] name_bpp_refresh
[06:14:09] [PASSED] name_refresh
[06:14:09] [PASSED] name_refresh_wrong_mode
[06:14:09] [PASSED] name_refresh_invalid_mode
[06:14:09] [PASSED] rotate_multiple
[06:14:09] [PASSED] rotate_invalid_val
[06:14:09] [PASSED] rotate_truncated
[06:14:09] [PASSED] invalid_option
[06:14:09] [PASSED] invalid_tv_option
[06:14:09] [PASSED] truncated_tv_option
[06:14:09] ============ [PASSED] drm_test_cmdline_invalid =============
[06:14:09] =============== drm_test_cmdline_tv_options  ===============
[06:14:09] [PASSED] NTSC
[06:14:09] [PASSED] NTSC_443
[06:14:09] [PASSED] NTSC_J
[06:14:09] [PASSED] PAL
[06:14:09] [PASSED] PAL_M
[06:14:09] [PASSED] PAL_N
[06:14:09] [PASSED] SECAM
[06:14:09] =========== [PASSED] drm_test_cmdline_tv_options ===========
[06:14:09] =============== [PASSED] drm_cmdline_parser ================
[06:14:09] ================ drm_get_tv_mode_from_name  ================
[06:14:09] ========== drm_test_get_tv_mode_from_name_valid  ===========
[06:14:09] [PASSED] NTSC
[06:14:09] [PASSED] NTSC-443
[06:14:09] [PASSED] NTSC-J
[06:14:09] [PASSED] PAL
[06:14:09] [PASSED] PAL-M
[06:14:09] [PASSED] PAL-N
[06:14:09] [PASSED] SECAM
[06:14:09] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[06:14:09] [PASSED] drm_test_get_tv_mode_from_name_truncated
[06:14:09] ============ [PASSED] drm_get_tv_mode_from_name ============
[06:14:09] ==================== drm_damage_helper  ====================
[06:14:09] [PASSED] drm_test_damage_iter_no_damage
[06:14:09] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[06:14:09] [PASSED] drm_test_damage_iter_no_damage_src_moved
[06:14:09] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[06:14:09] [PASSED] drm_test_damage_iter_no_damage_not_visible
[06:14:09] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[06:14:09] [PASSED] drm_test_damage_iter_no_damage_no_fb
[06:14:09] [PASSED] drm_test_damage_iter_simple_damage
[06:14:09] [PASSED] drm_test_damage_iter_single_damage
[06:14:09] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[06:14:09] [PASSED] drm_test_damage_iter_single_damage_outside_src
[06:14:09] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[06:14:09] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[06:14:09] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[06:14:09] [PASSED] drm_test_damage_iter_single_damage_src_moved
[06:14:09] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[06:14:09] [PASSED] drm_test_damage_iter_damage
[06:14:09] [PASSED] drm_test_damage_iter_damage_one_intersect
[06:14:09] [PASSED] drm_test_damage_iter_damage_one_outside
[06:14:09] [PASSED] drm_test_damage_iter_damage_src_moved
[06:14:09] [PASSED] drm_test_damage_iter_damage_not_visible
[06:14:09] ================ [PASSED] drm_damage_helper ================
[06:14:09] ==================== drm_dp_mst_helper  ====================
[06:14:09] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[06:14:09] [PASSED] Clock 154000 BPP 30 DSC disabled
[06:14:09] [PASSED] Clock 234000 BPP 30 DSC disabled
[06:14:09] [PASSED] Clock 297000 BPP 24 DSC disabled
[06:14:09] [PASSED] Clock 332880 BPP 24 DSC enabled
[06:14:09] [PASSED] Clock 324540 BPP 24 DSC enabled
[06:14:09] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[06:14:09] ============== drm_test_dp_mst_calc_pbn_div  ===============
[06:14:09] [PASSED] Link rate 2000000 lane count 4
[06:14:09] [PASSED] Link rate 2000000 lane count 2
[06:14:09] [PASSED] Link rate 2000000 lane count 1
[06:14:09] [PASSED] Link rate 1350000 lane count 4
[06:14:09] [PASSED] Link rate 1350000 lane count 2
[06:14:09] [PASSED] Link rate 1350000 lane count 1
[06:14:09] [PASSED] Link rate 1000000 lane count 4
[06:14:09] [PASSED] Link rate 1000000 lane count 2
[06:14:09] [PASSED] Link rate 1000000 lane count 1
[06:14:09] [PASSED] Link rate 810000 lane count 4
[06:14:09] [PASSED] Link rate 810000 lane count 2
[06:14:09] [PASSED] Link rate 810000 lane count 1
[06:14:09] [PASSED] Link rate 540000 lane count 4
[06:14:09] [PASSED] Link rate 540000 lane count 2
[06:14:09] [PASSED] Link rate 540000 lane count 1
[06:14:09] [PASSED] Link rate 270000 lane count 4
[06:14:09] [PASSED] Link rate 270000 lane count 2
[06:14:09] [PASSED] Link rate 270000 lane count 1
[06:14:09] [PASSED] Link rate 162000 lane count 4
[06:14:09] [PASSED] Link rate 162000 lane count 2
[06:14:09] [PASSED] Link rate 162000 lane count 1
[06:14:09] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[06:14:09] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[06:14:09] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[06:14:09] [PASSED] DP_POWER_UP_PHY with port number
[06:14:09] [PASSED] DP_POWER_DOWN_PHY with port number
[06:14:09] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[06:14:09] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[06:14:09] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[06:14:09] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[06:14:09] [PASSED] DP_QUERY_PAYLOAD with port number
[06:14:09] [PASSED] DP_QUERY_PAYLOAD with VCPI
[06:14:09] [PASSED] DP_REMOTE_DPCD_READ with port number
[06:14:09] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[06:14:09] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[06:14:09] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[06:14:09] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[06:14:09] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[06:14:09] [PASSED] DP_REMOTE_I2C_READ with port number
[06:14:09] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[06:14:09] [PASSED] DP_REMOTE_I2C_READ with transactions array
[06:14:09] [PASSED] DP_REMOTE_I2C_WRITE with port number
[06:14:09] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[06:14:09] [PASSED] DP_REMOTE_I2C_WRITE with data array
[06:14:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[06:14:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[06:14:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[06:14:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[06:14:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[06:14:09] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[06:14:09] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[06:14:09] ================ [PASSED] drm_dp_mst_helper ================
[06:14:09] ======================== drm_exec  =========================
[06:14:09] [PASSED] sanitycheck
[06:14:09] [PASSED] test_lock
[06:14:09] [PASSED] test_lock_unlock
[06:14:09] [PASSED] test_duplicates
[06:14:09] [PASSED] test_prepare
[06:14:09] [PASSED] test_prepare_array
[06:14:09] [PASSED] test_multiple_loops
[06:14:09] ==================== [PASSED] drm_exec =====================
[06:14:09] ================= drm_format_helper_test  ==================
[06:14:09] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[06:14:09] [PASSED] single_pixel_source_buffer
[06:14:09] [PASSED] single_pixel_clip_rectangle
[06:14:09] [PASSED] well_known_colors
[06:14:09] [PASSED] destination_pitch
[06:14:09] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[06:14:09] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[06:14:09] [PASSED] single_pixel_source_buffer
[06:14:09] [PASSED] single_pixel_clip_rectangle
[06:14:09] [PASSED] well_known_colors
[06:14:09] [PASSED] destination_pitch
[06:14:09] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[06:14:09] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[06:14:09] [PASSED] single_pixel_source_buffer
[06:14:09] [PASSED] single_pixel_clip_rectangle
[06:14:09] [PASSED] well_known_colors
[06:14:09] [PASSED] destination_pitch
[06:14:09] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[06:14:09] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[06:14:09] [PASSED] single_pixel_source_buffer
[06:14:09] [PASSED] single_pixel_clip_rectangle
[06:14:09] [PASSED] well_known_colors
[06:14:09] [PASSED] destination_pitch
[06:14:09] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[06:14:09] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[06:14:09] [PASSED] single_pixel_source_buffer
[06:14:09] [PASSED] single_pixel_clip_rectangle
[06:14:09] [PASSED] well_known_colors
[06:14:09] [PASSED] destination_pitch
[06:14:09] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[06:14:09] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[06:14:09] [PASSED] single_pixel_source_buffer
[06:14:09] [PASSED] single_pixel_clip_rectangle
[06:14:09] [PASSED] well_known_colors
[06:14:09] [PASSED] destination_pitch
[06:14:09] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[06:14:09] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[06:14:09] [PASSED] single_pixel_source_buffer
[06:14:09] [PASSED] single_pixel_clip_rectangle
[06:14:09] [PASSED] well_known_colors
[06:14:09] [PASSED] destination_pitch
[06:14:09] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[06:14:09] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[06:14:09] [PASSED] single_pixel_source_buffer
[06:14:09] [PASSED] single_pixel_clip_rectangle
[06:14:09] [PASSED] well_known_colors
[06:14:09] [PASSED] destination_pitch
[06:14:09] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[06:14:09] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[06:14:09] [PASSED] single_pixel_source_buffer
[06:14:09] [PASSED] single_pixel_clip_rectangle
[06:14:09] [PASSED] well_known_colors
[06:14:09] [PASSED] destination_pitch
[06:14:09] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[06:14:09] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[06:14:09] [PASSED] single_pixel_source_buffer
[06:14:09] [PASSED] single_pixel_clip_rectangle
[06:14:09] [PASSED] well_known_colors
[06:14:09] [PASSED] destination_pitch
[06:14:09] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[06:14:09] ============== drm_test_fb_xrgb8888_to_mono  ===============
[06:14:09] [PASSED] single_pixel_source_buffer
[06:14:09] [PASSED] single_pixel_clip_rectangle
[06:14:09] [PASSED] well_known_colors
[06:14:09] [PASSED] destination_pitch
[06:14:09] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[06:14:09] ==================== drm_test_fb_swab  =====================
[06:14:09] [PASSED] single_pixel_source_buffer
[06:14:09] [PASSED] single_pixel_clip_rectangle
[06:14:09] [PASSED] well_known_colors
[06:14:09] [PASSED] destination_pitch
[06:14:09] ================ [PASSED] drm_test_fb_swab =================
[06:14:09] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[06:14:09] [PASSED] single_pixel_source_buffer
[06:14:09] [PASSED] single_pixel_clip_rectangle
[06:14:09] [PASSED] well_known_colors
[06:14:09] [PASSED] destination_pitch
[06:14:09] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[06:14:09] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[06:14:09] [PASSED] single_pixel_source_buffer
[06:14:09] [PASSED] single_pixel_clip_rectangle
[06:14:09] [PASSED] well_known_colors
[06:14:09] [PASSED] destination_pitch
[06:14:09] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[06:14:09] ================= drm_test_fb_clip_offset  =================
[06:14:09] [PASSED] pass through
[06:14:09] [PASSED] horizontal offset
[06:14:09] [PASSED] vertical offset
[06:14:09] [PASSED] horizontal and vertical offset
[06:14:09] [PASSED] horizontal offset (custom pitch)
[06:14:09] [PASSED] vertical offset (custom pitch)
[06:14:09] [PASSED] horizontal and vertical offset (custom pitch)
[06:14:09] ============= [PASSED] drm_test_fb_clip_offset =============
[06:14:09] ============== drm_test_fb_build_fourcc_list  ==============
[06:14:09] [PASSED] no native formats
[06:14:09] [PASSED] XRGB8888 as native format
[06:14:09] [PASSED] remove duplicates
[06:14:09] [PASSED] convert alpha formats
[06:14:09] [PASSED] random formats
[06:14:09] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[06:14:09] =================== drm_test_fb_memcpy  ====================
[06:14:09] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[06:14:09] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[06:14:09] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[06:14:09] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[06:14:09] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[06:14:09] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[06:14:09] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[06:14:09] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[06:14:09] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[06:14:09] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[06:14:09] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[06:14:09] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[06:14:09] =============== [PASSED] drm_test_fb_memcpy ================
[06:14:09] ============= [PASSED] drm_format_helper_test ==============
[06:14:09] ======================= drm_format  ========================
[06:14:09] [PASSED] drm_test_format_block_width_invalid
[06:14:09] [PASSED] drm_test_format_block_width_one_plane
[06:14:09] [PASSED] drm_test_format_block_width_two_plane
[06:14:09] [PASSED] drm_test_format_block_width_three_plane
[06:14:09] [PASSED] drm_test_format_block_width_tiled
[06:14:09] [PASSED] drm_test_format_block_height_invalid
[06:14:09] [PASSED] drm_test_format_block_height_one_plane
[06:14:09] [PASSED] drm_test_format_block_height_two_plane
[06:14:09] [PASSED] drm_test_format_block_height_three_plane
[06:14:09] [PASSED] drm_test_format_block_height_tiled
[06:14:09] [PASSED] drm_test_format_min_pitch_invalid
[06:14:09] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[06:14:09] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[06:14:09] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[06:14:09] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[06:14:09] [PASSED] drm_test_format_min_pitch_two_plane
[06:14:09] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[06:14:09] [PASSED] drm_test_format_min_pitch_tiled
[06:14:09] =================== [PASSED] drm_format ====================
[06:14:09] ===================== drm_framebuffer  =====================
[06:14:09] =============== drm_test_framebuffer_create  ===============
[06:14:09] [PASSED] ABGR8888 normal sizes
[06:14:09] [PASSED] ABGR8888 max sizes
[06:14:09] [PASSED] ABGR8888 pitch greater than min required
[06:14:09] [PASSED] ABGR8888 pitch less than min required
[06:14:09] [PASSED] ABGR8888 Invalid width
[06:14:09] [PASSED] ABGR8888 Invalid buffer handle
[06:14:09] [PASSED] No pixel format
[06:14:09] [PASSED] ABGR8888 Width 0
[06:14:09] [PASSED] ABGR8888 Height 0
[06:14:09] [PASSED] ABGR8888 Out of bound height * pitch combination
[06:14:09] [PASSED] ABGR8888 Large buffer offset
[06:14:09] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[06:14:09] [PASSED] ABGR8888 Valid buffer modifier
[06:14:09] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[06:14:09] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[06:14:09] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[06:14:09] [PASSED] NV12 Normal sizes
[06:14:09] [PASSED] NV12 Max sizes
[06:14:09] [PASSED] NV12 Invalid pitch
[06:14:09] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[06:14:09] [PASSED] NV12 different  modifier per-plane
[06:14:09] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[06:14:09] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[06:14:09] [PASSED] NV12 Modifier for inexistent plane
[06:14:09] [PASSED] NV12 Handle for inexistent plane
[06:14:09] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[06:14:09] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[06:14:09] [PASSED] YVU420 Normal sizes
[06:14:09] [PASSED] YVU420 Max sizes
[06:14:09] [PASSED] YVU420 Invalid pitch
[06:14:09] [PASSED] YVU420 Different pitches
[06:14:09] [PASSED] YVU420 Different buffer offsets/pitches
[06:14:09] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[06:14:09] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[06:14:09] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[06:14:09] [PASSED] YVU420 Valid modifier
[06:14:09] [PASSED] YVU420 Different modifiers per plane
[06:14:09] [PASSED] YVU420 Modifier for inexistent plane
[06:14:09] [PASSED] X0L2 Normal sizes
[06:14:09] [PASSED] X0L2 Max sizes
[06:14:09] [PASSED] X0L2 Invalid pitch
[06:14:09] [PASSED] X0L2 Pitch greater than minimum required
[06:14:09] [PASSED] X0L2 Handle for inexistent plane
[06:14:09] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[06:14:09] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[06:14:09] [PASSED] X0L2 Valid modifier
[06:14:09] [PASSED] X0L2 Modifier for inexistent plane
[06:14:09] =========== [PASSED] drm_test_framebuffer_create ===========
[06:14:09] ================= [PASSED] drm_framebuffer =================
[06:14:09] ====================== drm_gem_shmem  ======================
[06:14:09] [PASSED] drm_gem_shmem_test_obj_create
[06:14:09] [PASSED] drm_gem_shmem_test_obj_create_private
[06:14:09] [PASSED] drm_gem_shmem_test_pin_pages
[06:14:09] [PASSED] drm_gem_shmem_test_vmap
[06:14:09] [PASSED] drm_gem_shmem_test_get_pages_sgt
[06:14:09] [PASSED] drm_gem_shmem_test_get_sg_table
[06:14:09] [PASSED] drm_gem_shmem_test_madvise
[06:14:09] [PASSED] drm_gem_shmem_test_purge
[06:14:09] ================== [PASSED] drm_gem_shmem ==================
[06:14:09] ==================== drm-test-managed  =====================
[06:14:09] [PASSED] drm_test_managed_run_action
[06:14:09] ================ [PASSED] drm-test-managed =================
[06:14:09] ========================= drm_mm  ==========================
[06:14:09] [PASSED] drm_test_mm_init
[06:14:09] [PASSED] drm_test_mm_debug
[06:14:09] [PASSED] drm_test_mm_align32
[06:14:09] [PASSED] drm_test_mm_align64
[06:14:09] [PASSED] drm_test_mm_lowest
[06:14:09] [PASSED] drm_test_mm_highest
[06:14:09] ===================== [PASSED] drm_mm ======================
[06:14:09] =================== drm_modes_analog_tv  ===================
[06:14:09] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[06:14:09] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[06:14:09] [PASSED] drm_test_modes_analog_tv_pal_576i
[06:14:09] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[06:14:09] =============== [PASSED] drm_modes_analog_tv ===============
[06:14:09] ==================== drm_plane_helper  =====================
[06:14:09] =============== drm_test_check_plane_state  ================
[06:14:09] [PASSED] clipping_simple
[06:14:09] [PASSED] clipping_rotate_reflect
[06:14:09] [PASSED] positioning_simple
[06:14:09] [PASSED] upscaling
[06:14:09] [PASSED] downscaling
[06:14:09] [PASSED] rounding1
[06:14:09] [PASSED] rounding2
[06:14:09] [PASSED] rounding3
[06:14:09] [PASSED] rounding4
[06:14:09] =========== [PASSED] drm_test_check_plane_state ============
[06:14:09] =========== drm_test_check_invalid_plane_state  ============
[06:14:09] [PASSED] positioning_invalid
[06:14:09] [PASSED] upscaling_invalid
[06:14:09] [PASSED] downscaling_invalid
[06:14:09] ======= [PASSED] drm_test_check_invalid_plane_state ========
[06:14:09] ================ [PASSED] drm_plane_helper =================
[06:14:09] ============ drm_connector_helper_tv_get_modes  ============
[06:14:09] ====== drm_test_connector_helper_tv_get_modes_check  =======
[06:14:09] [PASSED] None
[06:14:09] [PASSED] PAL
[06:14:09] [PASSED] NTSC
[06:14:09] [PASSED] Both, NTSC Default
[06:14:09] [PASSED] Both, PAL Default
[06:14:09] [PASSED] Both, NTSC Default, with PAL on command-line
[06:14:09] [PASSED] Both, PAL Default, with NTSC on command-line
[06:14:09] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[06:14:09] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[06:14:09] ======================== drm_rect  =========================
[06:14:09] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[06:14:09] [PASSED] drm_test_rect_clip_scaled_not_clipped
[06:14:09] [PASSED] drm_test_rect_clip_scaled_clipped
[06:14:09] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[06:14:09] ================= drm_test_rect_intersect  =================
[06:14:09] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[06:14:09] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
stty: 'standard input': Inappropriate ioctl for device
[06:14:09] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[06:14:09] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[06:14:09] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[06:14:09] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[06:14:09] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[06:14:09] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[06:14:09] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[06:14:09] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[06:14:09] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[06:14:09] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[06:14:09] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[06:14:09] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[06:14:09] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[06:14:09] ============= [PASSED] drm_test_rect_intersect =============
[06:14:09] ================ drm_test_rect_calc_hscale  ================
[06:14:09] [PASSED] normal use
[06:14:09] [PASSED] out of max range
[06:14:09] [PASSED] out of min range
[06:14:09] [PASSED] zero dst
[06:14:09] [PASSED] negative src
[06:14:09] [PASSED] negative dst
[06:14:09] ============ [PASSED] drm_test_rect_calc_hscale ============
[06:14:09] ================ drm_test_rect_calc_vscale  ================
[06:14:09] [PASSED] normal use
[06:14:09] [PASSED] out of max range
[06:14:09] [PASSED] out of min range
[06:14:09] [PASSED] zero dst
[06:14:09] [PASSED] negative src
[06:14:09] [PASSED] negative dst
[06:14:09] ============ [PASSED] drm_test_rect_calc_vscale ============
[06:14:09] ================== drm_test_rect_rotate  ===================
[06:14:09] [PASSED] reflect-x
[06:14:09] [PASSED] reflect-y
[06:14:09] [PASSED] rotate-0
[06:14:09] [PASSED] rotate-90
[06:14:09] [PASSED] rotate-180
[06:14:09] [PASSED] rotate-270
[06:14:09] ============== [PASSED] drm_test_rect_rotate ===============
[06:14:09] ================ drm_test_rect_rotate_inv  =================
[06:14:09] [PASSED] reflect-x
[06:14:09] [PASSED] reflect-y
[06:14:09] [PASSED] rotate-0
[06:14:09] [PASSED] rotate-90
[06:14:09] [PASSED] rotate-180
[06:14:09] [PASSED] rotate-270
[06:14:09] ============ [PASSED] drm_test_rect_rotate_inv =============
[06:14:09] ==================== [PASSED] drm_rect =====================
[06:14:09] ============================================================
[06:14:09] Testing complete. Ran 390 tests: passed: 390
[06:14:09] Elapsed time: 21.588s total, 1.682s configuring, 19.737s building, 0.162s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


