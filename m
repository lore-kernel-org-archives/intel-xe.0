Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40E5C83030
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 02:34:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2C710E4D5;
	Tue,  1 Jul 2025 02:34:22 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B226810E24B;
 Tue,  1 Jul 2025 02:34:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/i915/display=3A_Optimize_p?=
 =?utf-8?q?anel_power-on_wait_time?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Jul 2025 02:34:20 -0000
Message-ID: <175133726070.122429.4623479390657851762@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250630122339.3007880-1-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20250630122339.3007880-1-dibin.moolakadan.subrahmanian@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915/display: Optimize panel power-on wait time
URL   : https://patchwork.freedesktop.org/series/150958/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[02:33:13] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:33:17] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[02:33:44] Starting KUnit Kernel (1/1)...
[02:33:44] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[02:33:44] ================== guc_buf (11 subtests) ===================
[02:33:44] [PASSED] test_smallest
[02:33:44] [PASSED] test_largest
[02:33:44] [PASSED] test_granular
[02:33:44] [PASSED] test_unique
[02:33:44] [PASSED] test_overlap
[02:33:44] [PASSED] test_reusable
[02:33:44] [PASSED] test_too_big
[02:33:44] [PASSED] test_flush
[02:33:44] [PASSED] test_lookup
[02:33:44] [PASSED] test_data
[02:33:44] [PASSED] test_class
[02:33:44] ===================== [PASSED] guc_buf =====================
[02:33:44] =================== guc_dbm (7 subtests) ===================
[02:33:44] [PASSED] test_empty
[02:33:44] [PASSED] test_default
[02:33:44] ======================== test_size  ========================
[02:33:44] [PASSED] 4
[02:33:44] [PASSED] 8
[02:33:44] [PASSED] 32
[02:33:44] [PASSED] 256
[02:33:44] ==================== [PASSED] test_size ====================
[02:33:44] ======================= test_reuse  ========================
[02:33:44] [PASSED] 4
[02:33:44] [PASSED] 8
[02:33:44] [PASSED] 32
[02:33:44] [PASSED] 256
[02:33:44] =================== [PASSED] test_reuse ====================
[02:33:44] =================== test_range_overlap  ====================
[02:33:44] [PASSED] 4
[02:33:44] [PASSED] 8
[02:33:44] [PASSED] 32
[02:33:44] [PASSED] 256
[02:33:44] =============== [PASSED] test_range_overlap ================
[02:33:44] =================== test_range_compact  ====================
[02:33:44] [PASSED] 4
[02:33:44] [PASSED] 8
[02:33:44] [PASSED] 32
[02:33:44] [PASSED] 256
[02:33:44] =============== [PASSED] test_range_compact ================
[02:33:44] ==================== test_range_spare  =====================
[02:33:44] [PASSED] 4
[02:33:44] [PASSED] 8
[02:33:44] [PASSED] 32
[02:33:44] [PASSED] 256
[02:33:44] ================ [PASSED] test_range_spare =================
[02:33:44] ===================== [PASSED] guc_dbm =====================
[02:33:44] =================== guc_idm (6 subtests) ===================
[02:33:44] [PASSED] bad_init
[02:33:44] [PASSED] no_init
[02:33:44] [PASSED] init_fini
[02:33:44] [PASSED] check_used
[02:33:44] [PASSED] check_quota
[02:33:44] [PASSED] check_all
[02:33:44] ===================== [PASSED] guc_idm =====================
[02:33:44] ================== no_relay (3 subtests) ===================
[02:33:44] [PASSED] xe_drops_guc2pf_if_not_ready
[02:33:44] [PASSED] xe_drops_guc2vf_if_not_ready
[02:33:44] [PASSED] xe_rejects_send_if_not_ready
[02:33:44] ==================== [PASSED] no_relay =====================
[02:33:44] ================== pf_relay (14 subtests) ==================
[02:33:44] [PASSED] pf_rejects_guc2pf_too_short
[02:33:44] [PASSED] pf_rejects_guc2pf_too_long
[02:33:44] [PASSED] pf_rejects_guc2pf_no_payload
[02:33:44] [PASSED] pf_fails_no_payload
[02:33:44] [PASSED] pf_fails_bad_origin
[02:33:44] [PASSED] pf_fails_bad_type
[02:33:44] [PASSED] pf_txn_reports_error
[02:33:44] [PASSED] pf_txn_sends_pf2guc
[02:33:44] [PASSED] pf_sends_pf2guc
[02:33:44] [SKIPPED] pf_loopback_nop
[02:33:44] [SKIPPED] pf_loopback_echo
[02:33:44] [SKIPPED] pf_loopback_fail
[02:33:44] [SKIPPED] pf_loopback_busy
[02:33:44] [SKIPPED] pf_loopback_retry
[02:33:44] ==================== [PASSED] pf_relay =====================
[02:33:44] ================== vf_relay (3 subtests) ===================
[02:33:44] [PASSED] vf_rejects_guc2vf_too_short
[02:33:44] [PASSED] vf_rejects_guc2vf_too_long
[02:33:44] [PASSED] vf_rejects_guc2vf_no_payload
[02:33:44] ==================== [PASSED] vf_relay =====================
[02:33:44] ================= pf_service (11 subtests) =================
[02:33:44] [PASSED] pf_negotiate_any
[02:33:44] [PASSED] pf_negotiate_base_match
[02:33:44] [PASSED] pf_negotiate_base_newer
[02:33:44] [PASSED] pf_negotiate_base_next
[02:33:44] [SKIPPED] pf_negotiate_base_older
[02:33:44] [PASSED] pf_negotiate_base_prev
[02:33:44] [PASSED] pf_negotiate_latest_match
[02:33:44] [PASSED] pf_negotiate_latest_newer
[02:33:44] [PASSED] pf_negotiate_latest_next
[02:33:44] [SKIPPED] pf_negotiate_latest_older
[02:33:44] [SKIPPED] pf_negotiate_latest_prev
[02:33:44] =================== [PASSED] pf_service ====================
[02:33:44] ===================== lmtt (1 subtest) =====================
[02:33:44] ======================== test_ops  =========================
[02:33:44] [PASSED] 2-level
[02:33:44] [PASSED] multi-level
[02:33:44] ==================== [PASSED] test_ops =====================
[02:33:44] ====================== [PASSED] lmtt =======================
[02:33:44] =================== xe_mocs (2 subtests) ===================
[02:33:44] ================ xe_live_mocs_kernel_kunit  ================
[02:33:44] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[02:33:44] ================ xe_live_mocs_reset_kunit  =================
[02:33:44] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[02:33:44] ==================== [SKIPPED] xe_mocs =====================
[02:33:44] ================= xe_migrate (2 subtests) ==================
[02:33:44] ================= xe_migrate_sanity_kunit  =================
[02:33:44] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[02:33:44] ================== xe_validate_ccs_kunit  ==================
[02:33:44] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[02:33:44] =================== [SKIPPED] xe_migrate ===================
[02:33:44] ================== xe_dma_buf (1 subtest) ==================
[02:33:44] ==================== xe_dma_buf_kunit  =====================
[02:33:44] ================ [SKIPPED] xe_dma_buf_kunit ================
[02:33:44] =================== [SKIPPED] xe_dma_buf ===================
[02:33:44] ================= xe_bo_shrink (1 subtest) =================
[02:33:44] =================== xe_bo_shrink_kunit  ====================
[02:33:44] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[02:33:44] ================== [SKIPPED] xe_bo_shrink ==================
[02:33:44] ==================== xe_bo (2 subtests) ====================
[02:33:44] ================== xe_ccs_migrate_kunit  ===================
[02:33:44] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[02:33:44] ==================== xe_bo_evict_kunit  ====================
[02:33:44] =============== [SKIPPED] xe_bo_evict_kunit ================
[02:33:44] ===================== [SKIPPED] xe_bo ======================
[02:33:44] ==================== args (11 subtests) ====================
[02:33:44] [PASSED] count_args_test
[02:33:44] [PASSED] call_args_example
[02:33:44] [PASSED] call_args_test
[02:33:44] [PASSED] drop_first_arg_example
[02:33:44] [PASSED] drop_first_arg_test
[02:33:44] [PASSED] first_arg_example
[02:33:44] [PASSED] first_arg_test
[02:33:44] [PASSED] last_arg_example
[02:33:44] [PASSED] last_arg_test
[02:33:44] [PASSED] pick_arg_example
[02:33:44] [PASSED] sep_comma_example
[02:33:44] ====================== [PASSED] args =======================
[02:33:44] =================== xe_pci (2 subtests) ====================
[02:33:44] ==================== check_graphics_ip  ====================
[02:33:44] [PASSED] 12.70 Xe_LPG
[02:33:44] [PASSED] 12.71 Xe_LPG
[02:33:44] [PASSED] 12.74 Xe_LPG+
[02:33:44] [PASSED] 20.01 Xe2_HPG
[02:33:44] [PASSED] 20.02 Xe2_HPG
[02:33:44] [PASSED] 20.04 Xe2_LPG
[02:33:44] [PASSED] 30.00 Xe3_LPG
[02:33:44] [PASSED] 30.01 Xe3_LPG
[02:33:44] [PASSED] 30.03 Xe3_LPG
[02:33:44] ================ [PASSED] check_graphics_ip ================
[02:33:44] ===================== check_media_ip  ======================
[02:33:44] [PASSED] 13.00 Xe_LPM+
[02:33:44] [PASSED] 13.01 Xe2_HPM
[02:33:44] [PASSED] 20.00 Xe2_LPM
[02:33:44] [PASSED] 30.00 Xe3_LPM
[02:33:44] [PASSED] 30.02 Xe3_LPM
stty: 'standard input': Inappropriate ioctl for device
[02:33:44] ================= [PASSED] check_media_ip ==================
[02:33:44] ===================== [PASSED] xe_pci ======================
[02:33:44] =================== xe_rtp (2 subtests) ====================
[02:33:44] =============== xe_rtp_process_to_sr_tests  ================
[02:33:44] [PASSED] coalesce-same-reg
[02:33:44] [PASSED] no-match-no-add
[02:33:44] [PASSED] match-or
[02:33:44] [PASSED] match-or-xfail
[02:33:44] [PASSED] no-match-no-add-multiple-rules
[02:33:44] [PASSED] two-regs-two-entries
[02:33:44] [PASSED] clr-one-set-other
[02:33:44] [PASSED] set-field
[02:33:44] [PASSED] conflict-duplicate
[02:33:44] [PASSED] conflict-not-disjoint
[02:33:44] [PASSED] conflict-reg-type
[02:33:44] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[02:33:44] ================== xe_rtp_process_tests  ===================
[02:33:44] [PASSED] active1
[02:33:44] [PASSED] active2
[02:33:44] [PASSED] active-inactive
[02:33:44] [PASSED] inactive-active
[02:33:44] [PASSED] inactive-1st_or_active-inactive
[02:33:44] [PASSED] inactive-2nd_or_active-inactive
[02:33:44] [PASSED] inactive-last_or_active-inactive
[02:33:44] [PASSED] inactive-no_or_active-inactive
[02:33:44] ============== [PASSED] xe_rtp_process_tests ===============
[02:33:44] ===================== [PASSED] xe_rtp ======================
[02:33:44] ==================== xe_wa (1 subtest) =====================
[02:33:44] ======================== xe_wa_gt  =========================
[02:33:44] [PASSED] TIGERLAKE (B0)
[02:33:44] [PASSED] DG1 (A0)
[02:33:44] [PASSED] DG1 (B0)
[02:33:44] [PASSED] ALDERLAKE_S (A0)
[02:33:44] [PASSED] ALDERLAKE_S (B0)
[02:33:44] [PASSED] ALDERLAKE_S (C0)
[02:33:44] [PASSED] ALDERLAKE_S (D0)
[02:33:44] [PASSED] ALDERLAKE_P (A0)
[02:33:44] [PASSED] ALDERLAKE_P (B0)
[02:33:44] [PASSED] ALDERLAKE_P (C0)
[02:33:44] [PASSED] ALDERLAKE_S_RPLS (D0)
[02:33:44] [PASSED] ALDERLAKE_P_RPLU (E0)
[02:33:44] [PASSED] DG2_G10 (C0)
[02:33:44] [PASSED] DG2_G11 (B1)
[02:33:44] [PASSED] DG2_G12 (A1)
[02:33:44] [PASSED] METEORLAKE (g:A0, m:A0)
[02:33:44] [PASSED] METEORLAKE (g:A0, m:A0)
[02:33:44] [PASSED] METEORLAKE (g:A0, m:A0)
[02:33:44] [PASSED] LUNARLAKE (g:A0, m:A0)
[02:33:44] [PASSED] LUNARLAKE (g:B0, m:A0)
[02:33:44] [PASSED] BATTLEMAGE (g:A0, m:A1)
[02:33:44] ==================== [PASSED] xe_wa_gt =====================
[02:33:44] ====================== [PASSED] xe_wa ======================
[02:33:44] ============================================================
[02:33:44] Testing complete. Ran 145 tests: passed: 129, skipped: 16
[02:33:44] Elapsed time: 31.388s total, 4.197s configuring, 26.874s building, 0.300s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[02:33:44] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:33:46] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[02:34:07] Starting KUnit Kernel (1/1)...
[02:34:07] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[02:34:07] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[02:34:07] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[02:34:07] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[02:34:07] =========== drm_validate_clone_mode (2 subtests) ===========
[02:34:07] ============== drm_test_check_in_clone_mode  ===============
[02:34:07] [PASSED] in_clone_mode
[02:34:07] [PASSED] not_in_clone_mode
[02:34:07] ========== [PASSED] drm_test_check_in_clone_mode ===========
[02:34:07] =============== drm_test_check_valid_clones  ===============
[02:34:07] [PASSED] not_in_clone_mode
[02:34:07] [PASSED] valid_clone
[02:34:07] [PASSED] invalid_clone
[02:34:07] =========== [PASSED] drm_test_check_valid_clones ===========
[02:34:07] ============= [PASSED] drm_validate_clone_mode =============
[02:34:07] ============= drm_validate_modeset (1 subtest) =============
[02:34:07] [PASSED] drm_test_check_connector_changed_modeset
[02:34:07] ============== [PASSED] drm_validate_modeset ===============
[02:34:07] ====== drm_test_bridge_get_current_state (2 subtests) ======
[02:34:07] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[02:34:07] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[02:34:07] ======== [PASSED] drm_test_bridge_get_current_state ========
[02:34:07] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[02:34:07] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[02:34:07] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[02:34:07] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[02:34:07] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[02:34:07] ============== drm_bridge_alloc (2 subtests) ===============
[02:34:07] [PASSED] drm_test_drm_bridge_alloc_basic
[02:34:07] [PASSED] drm_test_drm_bridge_alloc_get_put
[02:34:07] ================ [PASSED] drm_bridge_alloc =================
[02:34:07] ================== drm_buddy (7 subtests) ==================
[02:34:07] [PASSED] drm_test_buddy_alloc_limit
[02:34:07] [PASSED] drm_test_buddy_alloc_optimistic
[02:34:07] [PASSED] drm_test_buddy_alloc_pessimistic
[02:34:07] [PASSED] drm_test_buddy_alloc_pathological
[02:34:07] [PASSED] drm_test_buddy_alloc_contiguous
[02:34:07] [PASSED] drm_test_buddy_alloc_clear
[02:34:07] [PASSED] drm_test_buddy_alloc_range_bias
[02:34:07] ==================== [PASSED] drm_buddy ====================
[02:34:07] ============= drm_cmdline_parser (40 subtests) =============
[02:34:07] [PASSED] drm_test_cmdline_force_d_only
[02:34:07] [PASSED] drm_test_cmdline_force_D_only_dvi
[02:34:07] [PASSED] drm_test_cmdline_force_D_only_hdmi
[02:34:07] [PASSED] drm_test_cmdline_force_D_only_not_digital
[02:34:07] [PASSED] drm_test_cmdline_force_e_only
[02:34:07] [PASSED] drm_test_cmdline_res
[02:34:07] [PASSED] drm_test_cmdline_res_vesa
[02:34:07] [PASSED] drm_test_cmdline_res_vesa_rblank
[02:34:07] [PASSED] drm_test_cmdline_res_rblank
[02:34:07] [PASSED] drm_test_cmdline_res_bpp
[02:34:07] [PASSED] drm_test_cmdline_res_refresh
[02:34:07] [PASSED] drm_test_cmdline_res_bpp_refresh
[02:34:07] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[02:34:07] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[02:34:07] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[02:34:07] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[02:34:07] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[02:34:07] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[02:34:07] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[02:34:07] [PASSED] drm_test_cmdline_res_margins_force_on
[02:34:07] [PASSED] drm_test_cmdline_res_vesa_margins
[02:34:07] [PASSED] drm_test_cmdline_name
[02:34:07] [PASSED] drm_test_cmdline_name_bpp
[02:34:07] [PASSED] drm_test_cmdline_name_option
[02:34:07] [PASSED] drm_test_cmdline_name_bpp_option
[02:34:07] [PASSED] drm_test_cmdline_rotate_0
[02:34:07] [PASSED] drm_test_cmdline_rotate_90
[02:34:07] [PASSED] drm_test_cmdline_rotate_180
[02:34:07] [PASSED] drm_test_cmdline_rotate_270
[02:34:07] [PASSED] drm_test_cmdline_hmirror
[02:34:07] [PASSED] drm_test_cmdline_vmirror
[02:34:07] [PASSED] drm_test_cmdline_margin_options
[02:34:07] [PASSED] drm_test_cmdline_multiple_options
[02:34:07] [PASSED] drm_test_cmdline_bpp_extra_and_option
[02:34:07] [PASSED] drm_test_cmdline_extra_and_option
[02:34:07] [PASSED] drm_test_cmdline_freestanding_options
[02:34:07] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[02:34:07] [PASSED] drm_test_cmdline_panel_orientation
[02:34:07] ================ drm_test_cmdline_invalid  =================
[02:34:07] [PASSED] margin_only
[02:34:07] [PASSED] interlace_only
[02:34:07] [PASSED] res_missing_x
[02:34:07] [PASSED] res_missing_y
[02:34:07] [PASSED] res_bad_y
[02:34:07] [PASSED] res_missing_y_bpp
[02:34:07] [PASSED] res_bad_bpp
[02:34:07] [PASSED] res_bad_refresh
[02:34:07] [PASSED] res_bpp_refresh_force_on_off
[02:34:07] [PASSED] res_invalid_mode
[02:34:07] [PASSED] res_bpp_wrong_place_mode
[02:34:07] [PASSED] name_bpp_refresh
[02:34:07] [PASSED] name_refresh
[02:34:07] [PASSED] name_refresh_wrong_mode
[02:34:07] [PASSED] name_refresh_invalid_mode
[02:34:07] [PASSED] rotate_multiple
[02:34:07] [PASSED] rotate_invalid_val
[02:34:07] [PASSED] rotate_truncated
[02:34:07] [PASSED] invalid_option
[02:34:07] [PASSED] invalid_tv_option
[02:34:07] [PASSED] truncated_tv_option
[02:34:07] ============ [PASSED] drm_test_cmdline_invalid =============
[02:34:07] =============== drm_test_cmdline_tv_options  ===============
[02:34:07] [PASSED] NTSC
[02:34:07] [PASSED] NTSC_443
[02:34:07] [PASSED] NTSC_J
[02:34:07] [PASSED] PAL
[02:34:07] [PASSED] PAL_M
[02:34:07] [PASSED] PAL_N
[02:34:07] [PASSED] SECAM
[02:34:07] [PASSED] MONO_525
[02:34:07] [PASSED] MONO_625
[02:34:07] =========== [PASSED] drm_test_cmdline_tv_options ===========
[02:34:07] =============== [PASSED] drm_cmdline_parser ================
[02:34:07] ========== drmm_connector_hdmi_init (20 subtests) ==========
[02:34:07] [PASSED] drm_test_connector_hdmi_init_valid
[02:34:07] [PASSED] drm_test_connector_hdmi_init_bpc_8
[02:34:07] [PASSED] drm_test_connector_hdmi_init_bpc_10
[02:34:07] [PASSED] drm_test_connector_hdmi_init_bpc_12
[02:34:07] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[02:34:07] [PASSED] drm_test_connector_hdmi_init_bpc_null
[02:34:07] [PASSED] drm_test_connector_hdmi_init_formats_empty
[02:34:07] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[02:34:07] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[02:34:07] [PASSED] supported_formats=0x9 yuv420_allowed=1
[02:34:07] [PASSED] supported_formats=0x9 yuv420_allowed=0
[02:34:07] [PASSED] supported_formats=0x3 yuv420_allowed=1
[02:34:07] [PASSED] supported_formats=0x3 yuv420_allowed=0
[02:34:07] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[02:34:07] [PASSED] drm_test_connector_hdmi_init_null_ddc
[02:34:07] [PASSED] drm_test_connector_hdmi_init_null_product
[02:34:07] [PASSED] drm_test_connector_hdmi_init_null_vendor
[02:34:07] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[02:34:07] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[02:34:07] [PASSED] drm_test_connector_hdmi_init_product_valid
[02:34:07] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[02:34:07] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[02:34:07] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[02:34:07] ========= drm_test_connector_hdmi_init_type_valid  =========
[02:34:07] [PASSED] HDMI-A
[02:34:07] [PASSED] HDMI-B
[02:34:07] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[02:34:07] ======== drm_test_connector_hdmi_init_type_invalid  ========
[02:34:07] [PASSED] Unknown
[02:34:07] [PASSED] VGA
[02:34:07] [PASSED] DVI-I
[02:34:07] [PASSED] DVI-D
[02:34:07] [PASSED] DVI-A
[02:34:07] [PASSED] Composite
[02:34:07] [PASSED] SVIDEO
[02:34:07] [PASSED] LVDS
[02:34:07] [PASSED] Component
[02:34:07] [PASSED] DIN
[02:34:07] [PASSED] DP
[02:34:07] [PASSED] TV
[02:34:07] [PASSED] eDP
[02:34:07] [PASSED] Virtual
[02:34:07] [PASSED] DSI
[02:34:07] [PASSED] DPI
[02:34:07] [PASSED] Writeback
[02:34:07] [PASSED] SPI
[02:34:07] [PASSED] USB
[02:34:07] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[02:34:07] ============ [PASSED] drmm_connector_hdmi_init =============
[02:34:07] ============= drmm_connector_init (3 subtests) =============
[02:34:07] [PASSED] drm_test_drmm_connector_init
[02:34:07] [PASSED] drm_test_drmm_connector_init_null_ddc
[02:34:07] ========= drm_test_drmm_connector_init_type_valid  =========
[02:34:07] [PASSED] Unknown
[02:34:07] [PASSED] VGA
[02:34:07] [PASSED] DVI-I
[02:34:07] [PASSED] DVI-D
[02:34:07] [PASSED] DVI-A
[02:34:07] [PASSED] Composite
[02:34:07] [PASSED] SVIDEO
[02:34:07] [PASSED] LVDS
[02:34:07] [PASSED] Component
[02:34:07] [PASSED] DIN
[02:34:07] [PASSED] DP
[02:34:07] [PASSED] HDMI-A
[02:34:07] [PASSED] HDMI-B
[02:34:07] [PASSED] TV
[02:34:07] [PASSED] eDP
[02:34:07] [PASSED] Virtual
[02:34:07] [PASSED] DSI
[02:34:07] [PASSED] DPI
[02:34:07] [PASSED] Writeback
[02:34:07] [PASSED] SPI
[02:34:07] [PASSED] USB
[02:34:07] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[02:34:07] =============== [PASSED] drmm_connector_init ===============
[02:34:07] ========= drm_connector_dynamic_init (6 subtests) ==========
[02:34:07] [PASSED] drm_test_drm_connector_dynamic_init
[02:34:07] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[02:34:07] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[02:34:07] [PASSED] drm_test_drm_connector_dynamic_init_properties
[02:34:07] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[02:34:07] [PASSED] Unknown
[02:34:07] [PASSED] VGA
[02:34:07] [PASSED] DVI-I
[02:34:07] [PASSED] DVI-D
[02:34:07] [PASSED] DVI-A
[02:34:07] [PASSED] Composite
[02:34:07] [PASSED] SVIDEO
[02:34:07] [PASSED] LVDS
[02:34:07] [PASSED] Component
[02:34:07] [PASSED] DIN
[02:34:07] [PASSED] DP
[02:34:07] [PASSED] HDMI-A
[02:34:07] [PASSED] HDMI-B
[02:34:07] [PASSED] TV
[02:34:07] [PASSED] eDP
[02:34:07] [PASSED] Virtual
[02:34:07] [PASSED] DSI
[02:34:07] [PASSED] DPI
[02:34:07] [PASSED] Writeback
[02:34:07] [PASSED] SPI
[02:34:07] [PASSED] USB
[02:34:07] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[02:34:07] ======== drm_test_drm_connector_dynamic_init_name  =========
[02:34:07] [PASSED] Unknown
[02:34:07] [PASSED] VGA
[02:34:07] [PASSED] DVI-I
[02:34:07] [PASSED] DVI-D
[02:34:07] [PASSED] DVI-A
[02:34:07] [PASSED] Composite
[02:34:07] [PASSED] SVIDEO
[02:34:07] [PASSED] LVDS
[02:34:07] [PASSED] Component
[02:34:07] [PASSED] DIN
[02:34:07] [PASSED] DP
[02:34:07] [PASSED] HDMI-A
[02:34:07] [PASSED] HDMI-B
[02:34:07] [PASSED] TV
[02:34:07] [PASSED] eDP
[02:34:07] [PASSED] Virtual
[02:34:07] [PASSED] DSI
[02:34:07] [PASSED] DPI
[02:34:07] [PASSED] Writeback
[02:34:07] [PASSED] SPI
[02:34:07] [PASSED] USB
[02:34:07] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[02:34:07] =========== [PASSED] drm_connector_dynamic_init ============
[02:34:07] ==== drm_connector_dynamic_register_early (4 subtests) =====
[02:34:07] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[02:34:07] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[02:34:07] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[02:34:07] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[02:34:07] ====== [PASSED] drm_connector_dynamic_register_early =======
[02:34:07] ======= drm_connector_dynamic_register (7 subtests) ========
[02:34:07] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[02:34:07] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[02:34:07] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[02:34:07] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[02:34:07] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[02:34:07] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[02:34:07] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[02:34:07] ========= [PASSED] drm_connector_dynamic_register ==========
[02:34:07] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[02:34:07] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[02:34:07] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[02:34:07] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[02:34:07] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[02:34:07] ========== drm_test_get_tv_mode_from_name_valid  ===========
[02:34:07] [PASSED] NTSC
[02:34:07] [PASSED] NTSC-443
[02:34:07] [PASSED] NTSC-J
[02:34:07] [PASSED] PAL
[02:34:07] [PASSED] PAL-M
[02:34:07] [PASSED] PAL-N
[02:34:07] [PASSED] SECAM
[02:34:07] [PASSED] Mono
[02:34:07] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[02:34:07] [PASSED] drm_test_get_tv_mode_from_name_truncated
[02:34:07] ============ [PASSED] drm_get_tv_mode_from_name ============
[02:34:07] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[02:34:07] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[02:34:07] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[02:34:07] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[02:34:07] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[02:34:07] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[02:34:07] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[02:34:07] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[02:34:07] [PASSED] VIC 96
[02:34:07] [PASSED] VIC 97
[02:34:07] [PASSED] VIC 101
[02:34:07] [PASSED] VIC 102
[02:34:07] [PASSED] VIC 106
[02:34:07] [PASSED] VIC 107
[02:34:07] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[02:34:07] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[02:34:07] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[02:34:07] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[02:34:07] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[02:34:07] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[02:34:07] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[02:34:07] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[02:34:07] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[02:34:07] [PASSED] Automatic
[02:34:07] [PASSED] Full
[02:34:07] [PASSED] Limited 16:235
[02:34:07] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[02:34:07] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[02:34:07] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[02:34:07] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[02:34:07] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[02:34:07] [PASSED] RGB
[02:34:07] [PASSED] YUV 4:2:0
[02:34:07] [PASSED] YUV 4:2:2
[02:34:07] [PASSED] YUV 4:4:4
[02:34:07] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[02:34:07] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[02:34:07] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[02:34:07] ============= drm_damage_helper (21 subtests) ==============
[02:34:07] [PASSED] drm_test_damage_iter_no_damage
[02:34:07] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[02:34:07] [PASSED] drm_test_damage_iter_no_damage_src_moved
[02:34:07] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[02:34:07] [PASSED] drm_test_damage_iter_no_damage_not_visible
[02:34:07] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[02:34:07] [PASSED] drm_test_damage_iter_no_damage_no_fb
[02:34:07] [PASSED] drm_test_damage_iter_simple_damage
[02:34:07] [PASSED] drm_test_damage_iter_single_damage
[02:34:07] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[02:34:07] [PASSED] drm_test_damage_iter_single_damage_outside_src
[02:34:07] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[02:34:07] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[02:34:07] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[02:34:07] [PASSED] drm_test_damage_iter_single_damage_src_moved
[02:34:07] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[02:34:07] [PASSED] drm_test_damage_iter_damage
[02:34:07] [PASSED] drm_test_damage_iter_damage_one_intersect
[02:34:07] [PASSED] drm_test_damage_iter_damage_one_outside
[02:34:07] [PASSED] drm_test_damage_iter_damage_src_moved
[02:34:07] [PASSED] drm_test_damage_iter_damage_not_visible
[02:34:07] ================ [PASSED] drm_damage_helper ================
[02:34:07] ============== drm_dp_mst_helper (3 subtests) ==============
[02:34:07] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[02:34:07] [PASSED] Clock 154000 BPP 30 DSC disabled
[02:34:07] [PASSED] Clock 234000 BPP 30 DSC disabled
[02:34:07] [PASSED] Clock 297000 BPP 24 DSC disabled
[02:34:07] [PASSED] Clock 332880 BPP 24 DSC enabled
[02:34:07] [PASSED] Clock 324540 BPP 24 DSC enabled
[02:34:07] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[02:34:07] ============== drm_test_dp_mst_calc_pbn_div  ===============
[02:34:07] [PASSED] Link rate 2000000 lane count 4
[02:34:07] [PASSED] Link rate 2000000 lane count 2
[02:34:07] [PASSED] Link rate 2000000 lane count 1
[02:34:07] [PASSED] Link rate 1350000 lane count 4
[02:34:07] [PASSED] Link rate 1350000 lane count 2
[02:34:07] [PASSED] Link rate 1350000 lane count 1
[02:34:07] [PASSED] Link rate 1000000 lane count 4
[02:34:07] [PASSED] Link rate 1000000 lane count 2
[02:34:07] [PASSED] Link rate 1000000 lane count 1
[02:34:07] [PASSED] Link rate 810000 lane count 4
[02:34:07] [PASSED] Link rate 810000 lane count 2
[02:34:07] [PASSED] Link rate 810000 lane count 1
[02:34:07] [PASSED] Link rate 540000 lane count 4
[02:34:07] [PASSED] Link rate 540000 lane count 2
[02:34:07] [PASSED] Link rate 540000 lane count 1
[02:34:07] [PASSED] Link rate 270000 lane count 4
[02:34:07] [PASSED] Link rate 270000 lane count 2
[02:34:07] [PASSED] Link rate 270000 lane count 1
[02:34:07] [PASSED] Link rate 162000 lane count 4
[02:34:07] [PASSED] Link rate 162000 lane count 2
[02:34:07] [PASSED] Link rate 162000 lane count 1
[02:34:07] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[02:34:07] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[02:34:07] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[02:34:07] [PASSED] DP_POWER_UP_PHY with port number
[02:34:07] [PASSED] DP_POWER_DOWN_PHY with port number
[02:34:07] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[02:34:07] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[02:34:07] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[02:34:07] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[02:34:07] [PASSED] DP_QUERY_PAYLOAD with port number
[02:34:07] [PASSED] DP_QUERY_PAYLOAD with VCPI
[02:34:07] [PASSED] DP_REMOTE_DPCD_READ with port number
[02:34:07] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[02:34:07] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[02:34:07] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[02:34:07] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[02:34:07] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[02:34:07] [PASSED] DP_REMOTE_I2C_READ with port number
[02:34:07] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[02:34:07] [PASSED] DP_REMOTE_I2C_READ with transactions array
[02:34:07] [PASSED] DP_REMOTE_I2C_WRITE with port number
[02:34:07] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[02:34:07] [PASSED] DP_REMOTE_I2C_WRITE with data array
[02:34:07] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[02:34:07] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[02:34:07] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[02:34:07] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[02:34:07] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[02:34:07] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[02:34:07] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[02:34:07] ================ [PASSED] drm_dp_mst_helper ================
[02:34:07] ================== drm_exec (7 subtests) ===================
[02:34:07] [PASSED] sanitycheck
[02:34:07] [PASSED] test_lock
[02:34:07] [PASSED] test_lock_unlock
[02:34:07] [PASSED] test_duplicates
[02:34:07] [PASSED] test_prepare
[02:34:07] [PASSED] test_prepare_array
[02:34:07] [PASSED] test_multiple_loops
[02:34:07] ==================== [PASSED] drm_exec =====================
[02:34:07] =========== drm_format_helper_test (17 subtests) ===========
[02:34:07] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[02:34:07] [PASSED] single_pixel_source_buffer
[02:34:07] [PASSED] single_pixel_clip_rectangle
[02:34:07] [PASSED] well_known_colors
[02:34:07] [PASSED] destination_pitch
[02:34:07] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[02:34:07] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[02:34:07] [PASSED] single_pixel_source_buffer
[02:34:07] [PASSED] single_pixel_clip_rectangle
[02:34:07] [PASSED] well_known_colors
[02:34:07] [PASSED] destination_pitch
[02:34:07] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[02:34:07] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[02:34:07] [PASSED] single_pixel_source_buffer
[02:34:07] [PASSED] single_pixel_clip_rectangle
[02:34:07] [PASSED] well_known_colors
[02:34:07] [PASSED] destination_pitch
[02:34:07] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[02:34:07] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[02:34:07] [PASSED] single_pixel_source_buffer
[02:34:07] [PASSED] single_pixel_clip_rectangle
[02:34:07] [PASSED] well_known_colors
[02:34:07] [PASSED] destination_pitch
[02:34:07] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[02:34:07] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[02:34:07] [PASSED] single_pixel_source_buffer
[02:34:07] [PASSED] single_pixel_clip_rectangle
[02:34:07] [PASSED] well_known_colors
[02:34:07] [PASSED] destination_pitch
[02:34:07] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[02:34:07] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[02:34:07] [PASSED] single_pixel_source_buffer
[02:34:07] [PASSED] single_pixel_clip_rectangle
[02:34:07] [PASSED] well_known_colors
[02:34:07] [PASSED] destination_pitch
[02:34:07] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[02:34:07] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[02:34:07] [PASSED] single_pixel_source_buffer
[02:34:07] [PASSED] single_pixel_clip_rectangle
[02:34:07] [PASSED] well_known_colors
[02:34:07] [PASSED] destination_pitch
[02:34:07] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[02:34:07] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[02:34:07] [PASSED] single_pixel_source_buffer
[02:34:07] [PASSED] single_pixel_clip_rectangle
[02:34:07] [PASSED] well_known_colors
[02:34:07] [PASSED] destination_pitch
[02:34:07] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[02:34:07] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[02:34:07] [PASSED] single_pixel_source_buffer
[02:34:07] [PASSED] single_pixel_clip_rectangle
[02:34:07] [PASSED] well_known_colors
[02:34:07] [PASSED] destination_pitch
[02:34:07] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[02:34:07] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[02:34:07] [PASSED] single_pixel_source_buffer
[02:34:07] [PASSED] single_pixel_clip_rectangle
[02:34:07] [PASSED] well_known_colors
[02:34:07] [PASSED] destination_pitch
[02:34:07] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[02:34:07] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[02:34:07] [PASSED] single_pixel_source_buffer
[02:34:07] [PASSED] single_pixel_clip_rectangle
[02:34:07] [PASSED] well_known_colors
[02:34:07] [PASSED] destination_pitch
[02:34:07] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[02:34:07] ============== drm_test_fb_xrgb8888_to_mono  ===============
[02:34:07] [PASSED] single_pixel_source_buffer
[02:34:07] [PASSED] single_pixel_clip_rectangle
[02:34:07] [PASSED] well_known_colors
[02:34:07] [PASSED] destination_pitch
[02:34:07] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[02:34:07] ==================== drm_test_fb_swab  =====================
[02:34:07] [PASSED] single_pixel_source_buffer
[02:34:07] [PASSED] single_pixel_clip_rectangle
[02:34:07] [PASSED] well_known_colors
[02:34:07] [PASSED] destination_pitch
[02:34:07] ================ [PASSED] drm_test_fb_swab =================
[02:34:07] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[02:34:07] [PASSED] single_pixel_source_buffer
[02:34:07] [PASSED] single_pixel_clip_rectangle
[02:34:07] [PASSED] well_known_colors
[02:34:07] [PASSED] destination_pitch
[02:34:07] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[02:34:07] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[02:34:07] [PASSED] single_pixel_source_buffer
[02:34:07] [PASSED] single_pixel_clip_rectangle
[02:34:07] [PASSED] well_known_colors
[02:34:07] [PASSED] destination_pitch
[02:34:07] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[02:34:07] ================= drm_test_fb_clip_offset  =================
[02:34:07] [PASSED] pass through
[02:34:07] [PASSED] horizontal offset
[02:34:07] [PASSED] vertical offset
[02:34:07] [PASSED] horizontal and vertical offset
[02:34:07] [PASSED] horizontal offset (custom pitch)
[02:34:07] [PASSED] vertical offset (custom pitch)
[02:34:07] [PASSED] horizontal and vertical offset (custom pitch)
[02:34:07] ============= [PASSED] drm_test_fb_clip_offset =============
[02:34:07] =================== drm_test_fb_memcpy  ====================
[02:34:07] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[02:34:07] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[02:34:07] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[02:34:07] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[02:34:07] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[02:34:07] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[02:34:07] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[02:34:07] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[02:34:07] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[02:34:07] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[02:34:07] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[02:34:07] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[02:34:07] =============== [PASSED] drm_test_fb_memcpy ================
[02:34:07] ============= [PASSED] drm_format_helper_test ==============
[02:34:07] ================= drm_format (18 subtests) =================
[02:34:07] [PASSED] drm_test_format_block_width_invalid
[02:34:07] [PASSED] drm_test_format_block_width_one_plane
[02:34:07] [PASSED] drm_test_format_block_width_two_plane
[02:34:07] [PASSED] drm_test_format_block_width_three_plane
[02:34:07] [PASSED] drm_test_format_block_width_tiled
[02:34:07] [PASSED] drm_test_format_block_height_invalid
[02:34:07] [PASSED] drm_test_format_block_height_one_plane
[02:34:07] [PASSED] drm_test_format_block_height_two_plane
[02:34:07] [PASSED] drm_test_format_block_height_three_plane
[02:34:07] [PASSED] drm_test_format_block_height_tiled
[02:34:07] [PASSED] drm_test_format_min_pitch_invalid
[02:34:07] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[02:34:07] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[02:34:07] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[02:34:07] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[02:34:07] [PASSED] drm_test_format_min_pitch_two_plane
[02:34:07] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[02:34:07] [PASSED] drm_test_format_min_pitch_tiled
[02:34:07] =================== [PASSED] drm_format ====================
[02:34:07] ============== drm_framebuffer (10 subtests) ===============
[02:34:07] ========== drm_test_framebuffer_check_src_coords  ==========
[02:34:07] [PASSED] Success: source fits into fb
[02:34:07] [PASSED] Fail: overflowing fb with x-axis coordinate
[02:34:07] [PASSED] Fail: overflowing fb with y-axis coordinate
[02:34:07] [PASSED] Fail: overflowing fb with source width
[02:34:07] [PASSED] Fail: overflowing fb with source height
[02:34:07] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[02:34:07] [PASSED] drm_test_framebuffer_cleanup
[02:34:07] =============== drm_test_framebuffer_create  ===============
[02:34:07] [PASSED] ABGR8888 normal sizes
[02:34:07] [PASSED] ABGR8888 max sizes
[02:34:07] [PASSED] ABGR8888 pitch greater than min required
[02:34:07] [PASSED] ABGR8888 pitch less than min required
[02:34:07] [PASSED] ABGR8888 Invalid width
[02:34:07] [PASSED] ABGR8888 Invalid buffer handle
[02:34:07] [PASSED] No pixel format
[02:34:07] [PASSED] ABGR8888 Width 0
[02:34:07] [PASSED] ABGR8888 Height 0
[02:34:07] [PASSED] ABGR8888 Out of bound height * pitch combination
[02:34:07] [PASSED] ABGR8888 Large buffer offset
[02:34:07] [PASSED] ABGR8888 Buffer offset for inexistent plane
[02:34:07] [PASSED] ABGR8888 Invalid flag
[02:34:07] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[02:34:07] [PASSED] ABGR8888 Valid buffer modifier
[02:34:07] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[02:34:07] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[02:34:07] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[02:34:07] [PASSED] NV12 Normal sizes
[02:34:07] [PASSED] NV12 Max sizes
[02:34:07] [PASSED] NV12 Invalid pitch
[02:34:07] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[02:34:07] [PASSED] NV12 different  modifier per-plane
[02:34:07] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[02:34:07] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[02:34:07] [PASSED] NV12 Modifier for inexistent plane
[02:34:07] [PASSED] NV12 Handle for inexistent plane
[02:34:07] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[02:34:07] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[02:34:07] [PASSED] YVU420 Normal sizes
[02:34:07] [PASSED] YVU420 Max sizes
[02:34:07] [PASSED] YVU420 Invalid pitch
[02:34:07] [PASSED] YVU420 Different pitches
[02:34:07] [PASSED] YVU420 Different buffer offsets/pitches
[02:34:07] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[02:34:07] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[02:34:07] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[02:34:07] [PASSED] YVU420 Valid modifier
[02:34:07] [PASSED] YVU420 Different modifiers per plane
[02:34:07] [PASSED] YVU420 Modifier for inexistent plane
[02:34:07] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[02:34:07] [PASSED] X0L2 Normal sizes
[02:34:07] [PASSED] X0L2 Max sizes
[02:34:07] [PASSED] X0L2 Invalid pitch
[02:34:07] [PASSED] X0L2 Pitch greater than minimum required
[02:34:07] [PASSED] X0L2 Handle for inexistent plane
[02:34:07] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[02:34:07] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[02:34:07] [PASSED] X0L2 Valid modifier
[02:34:07] [PASSED] X0L2 Modifier for inexistent plane
[02:34:07] =========== [PASSED] drm_test_framebuffer_create ===========
[02:34:07] [PASSED] drm_test_framebuffer_free
[02:34:07] [PASSED] drm_test_framebuffer_init
[02:34:07] [PASSED] drm_test_framebuffer_init_bad_format
[02:34:07] [PASSED] drm_test_framebuffer_init_dev_mismatch
[02:34:07] [PASSED] drm_test_framebuffer_lookup
[02:34:07] [PASSED] drm_test_framebuffer_lookup_inexistent
[02:34:07] [PASSED] drm_test_framebuffer_modifiers_not_supported
[02:34:07] ================= [PASSED] drm_framebuffer =================
[02:34:07] ================ drm_gem_shmem (8 subtests) ================
[02:34:07] [PASSED] drm_gem_shmem_test_obj_create
[02:34:07] [PASSED] drm_gem_shmem_test_obj_create_private
[02:34:07] [PASSED] drm_gem_shmem_test_pin_pages
[02:34:07] [PASSED] drm_gem_shmem_test_vmap
[02:34:07] [PASSED] drm_gem_shmem_test_get_pages_sgt
[02:34:07] [PASSED] drm_gem_shmem_test_get_sg_table
[02:34:07] [PASSED] drm_gem_shmem_test_madvise
[02:34:07] [PASSED] drm_gem_shmem_test_purge
[02:34:07] ================== [PASSED] drm_gem_shmem ==================
[02:34:07] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[02:34:07] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[02:34:07] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[02:34:07] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[02:34:07] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[02:34:07] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[02:34:07] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[02:34:07] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[02:34:07] [PASSED] Automatic
[02:34:07] [PASSED] Full
[02:34:07] [PASSED] Limited 16:235
[02:34:07] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[02:34:07] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[02:34:07] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[02:34:07] [PASSED] drm_test_check_disable_connector
[02:34:07] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[02:34:07] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[02:34:07] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[02:34:07] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[02:34:07] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[02:34:07] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[02:34:07] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[02:34:07] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[02:34:07] [PASSED] drm_test_check_output_bpc_dvi
[02:34:07] [PASSED] drm_test_check_output_bpc_format_vic_1
[02:34:07] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[02:34:07] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[02:34:07] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[02:34:07] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[02:34:07] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[02:34:07] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[02:34:07] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[02:34:07] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[02:34:07] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[02:34:07] [PASSED] drm_test_check_broadcast_rgb_value
[02:34:07] [PASSED] drm_test_check_bpc_8_value
[02:34:07] [PASSED] drm_test_check_bpc_10_value
[02:34:07] [PASSED] drm_test_check_bpc_12_value
[02:34:07] [PASSED] drm_test_check_format_value
[02:34:07] [PASSED] drm_test_check_tmds_char_value
[02:34:07] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[02:34:07] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[02:34:07] [PASSED] drm_test_check_mode_valid
[02:34:07] [PASSED] drm_test_check_mode_valid_reject
[02:34:07] [PASSED] drm_test_check_mode_valid_reject_rate
[02:34:07] [PASSED] drm_test_check_mode_valid_reject_max_clock
[02:34:07] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[02:34:07] ================= drm_managed (2 subtests) =================
[02:34:07] [PASSED] drm_test_managed_release_action
[02:34:07] [PASSED] drm_test_managed_run_action
[02:34:07] =================== [PASSED] drm_managed ===================
[02:34:07] =================== drm_mm (6 subtests) ====================
[02:34:07] [PASSED] drm_test_mm_init
[02:34:07] [PASSED] drm_test_mm_debug
[02:34:07] [PASSED] drm_test_mm_align32
[02:34:07] [PASSED] drm_test_mm_align64
[02:34:07] [PASSED] drm_test_mm_lowest
[02:34:07] [PASSED] drm_test_mm_highest
[02:34:07] ===================== [PASSED] drm_mm ======================
[02:34:07] ============= drm_modes_analog_tv (5 subtests) =============
[02:34:07] [PASSED] drm_test_modes_analog_tv_mono_576i
[02:34:07] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[02:34:07] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[02:34:07] [PASSED] drm_test_modes_analog_tv_pal_576i
[02:34:07] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[02:34:07] =============== [PASSED] drm_modes_analog_tv ===============
[02:34:07] ============== drm_plane_helper (2 subtests) ===============
[02:34:07] =============== drm_test_check_plane_state  ================
[02:34:07] [PASSED] clipping_simple
[02:34:07] [PASSED] clipping_rotate_reflect
[02:34:07] [PASSED] positioning_simple
[02:34:07] [PASSED] upscaling
[02:34:07] [PASSED] downscaling
[02:34:07] [PASSED] rounding1
[02:34:07] [PASSED] rounding2
[02:34:07] [PASSED] rounding3
[02:34:07] [PASSED] rounding4
[02:34:07] =========== [PASSED] drm_test_check_plane_state ============
[02:34:07] =========== drm_test_check_invalid_plane_state  ============
[02:34:07] [PASSED] positioning_invalid
[02:34:07] [PASSED] upscaling_invalid
[02:34:07] [PASSED] downscaling_invalid
[02:34:07] ======= [PASSED] drm_test_check_invalid_plane_state ========
[02:34:07] ================ [PASSED] drm_plane_helper =================
[02:34:07] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[02:34:07] ====== drm_test_connector_helper_tv_get_modes_check  =======
[02:34:07] [PASSED] None
[02:34:07] [PASSED] PAL
[02:34:07] [PASSED] NTSC
[02:34:07] [PASSED] Both, NTSC Default
[02:34:07] [PASSED] Both, PAL Default
[02:34:07] [PASSED] Both, NTSC Default, with PAL on command-line
[02:34:07] [PASSED] Both, PAL Default, with NTSC on command-line
[02:34:07] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[02:34:07] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[02:34:07] ================== drm_rect (9 subtests) ===================
[02:34:07] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[02:34:07] [PASSED] drm_test_rect_clip_scaled_not_clipped
[02:34:07] [PASSED] drm_test_rect_clip_scaled_clipped
[02:34:07] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[02:34:07] ================= drm_test_rect_intersect  =================
[02:34:07] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[02:34:07] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[02:34:07] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[02:34:07] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[02:34:07] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[02:34:07] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[02:34:07] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[02:34:07] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[02:34:07] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[02:34:07] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[02:34:07] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[02:34:07] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[02:34:07] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[02:34:07] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[02:34:07] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[02:34:07] ============= [PASSED] drm_test_rect_intersect =============
[02:34:07] ================ drm_test_rect_calc_hscale  ================
[02:34:07] [PASSED] normal use
[02:34:07] [PASSED] out of max range
[02:34:07] [PASSED] out of min range
[02:34:07] [PASSED] zero dst
[02:34:07] [PASSED] negative src
[02:34:07] [PASSED] negative dst
[02:34:07] ============ [PASSED] drm_test_rect_calc_hscale ============
[02:34:07] ================ drm_test_rect_calc_vscale  ================
[02:34:07] [PASSED] normal use
[02:34:07] [PASSED] out of max range
[02:34:07] [PASSED] out of min range
[02:34:07] [PASSED] zero dst
[02:34:07] [PASSED] negative src
[02:34:07] [PASSED] negative dst
[02:34:07] ============ [PASSED] drm_test_rect_calc_vscale ============
[02:34:07] ================== drm_test_rect_rotate  ===================
[02:34:07] [PASSED] reflect-x
[02:34:07] [PASSED] reflect-y
[02:34:07] [PASSED] rotate-0
[02:34:07] [PASSED] rotate-90
[02:34:07] [PASSED] rotate-180
[02:34:07] [PASSED] rotate-270
stty: 'standard input': Inappropriate ioctl for device
[02:34:07] ============== [PASSED] drm_test_rect_rotate ===============
[02:34:07] ================ drm_test_rect_rotate_inv  =================
[02:34:07] [PASSED] reflect-x
[02:34:07] [PASSED] reflect-y
[02:34:07] [PASSED] rotate-0
[02:34:07] [PASSED] rotate-90
[02:34:07] [PASSED] rotate-180
[02:34:07] [PASSED] rotate-270
[02:34:07] ============ [PASSED] drm_test_rect_rotate_inv =============
[02:34:07] ==================== [PASSED] drm_rect =====================
[02:34:07] ============ drm_sysfb_modeset_test (1 subtest) ============
[02:34:07] ============ drm_test_sysfb_build_fourcc_list  =============
[02:34:07] [PASSED] no native formats
[02:34:07] [PASSED] XRGB8888 as native format
[02:34:07] [PASSED] remove duplicates
[02:34:07] [PASSED] convert alpha formats
[02:34:07] [PASSED] random formats
[02:34:07] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[02:34:07] ============= [PASSED] drm_sysfb_modeset_test ==============
[02:34:07] ============================================================
[02:34:07] Testing complete. Ran 616 tests: passed: 616
[02:34:07] Elapsed time: 23.136s total, 1.670s configuring, 21.297s building, 0.152s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[02:34:07] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:34:09] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[02:34:17] Starting KUnit Kernel (1/1)...
[02:34:17] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[02:34:17] ================= ttm_device (5 subtests) ==================
[02:34:17] [PASSED] ttm_device_init_basic
[02:34:17] [PASSED] ttm_device_init_multiple
[02:34:17] [PASSED] ttm_device_fini_basic
[02:34:17] [PASSED] ttm_device_init_no_vma_man
[02:34:17] ================== ttm_device_init_pools  ==================
[02:34:17] [PASSED] No DMA allocations, no DMA32 required
[02:34:17] [PASSED] DMA allocations, DMA32 required
[02:34:17] [PASSED] No DMA allocations, DMA32 required
[02:34:17] [PASSED] DMA allocations, no DMA32 required
[02:34:17] ============== [PASSED] ttm_device_init_pools ==============
[02:34:17] =================== [PASSED] ttm_device ====================
[02:34:17] ================== ttm_pool (8 subtests) ===================
[02:34:17] ================== ttm_pool_alloc_basic  ===================
[02:34:17] [PASSED] One page
[02:34:17] [PASSED] More than one page
[02:34:17] [PASSED] Above the allocation limit
[02:34:17] [PASSED] One page, with coherent DMA mappings enabled
[02:34:17] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[02:34:17] ============== [PASSED] ttm_pool_alloc_basic ===============
[02:34:17] ============== ttm_pool_alloc_basic_dma_addr  ==============
[02:34:17] [PASSED] One page
[02:34:17] [PASSED] More than one page
[02:34:17] [PASSED] Above the allocation limit
[02:34:17] [PASSED] One page, with coherent DMA mappings enabled
[02:34:17] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[02:34:17] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[02:34:17] [PASSED] ttm_pool_alloc_order_caching_match
[02:34:17] [PASSED] ttm_pool_alloc_caching_mismatch
[02:34:17] [PASSED] ttm_pool_alloc_order_mismatch
[02:34:17] [PASSED] ttm_pool_free_dma_alloc
[02:34:17] [PASSED] ttm_pool_free_no_dma_alloc
[02:34:17] [PASSED] ttm_pool_fini_basic
[02:34:17] ==================== [PASSED] ttm_pool =====================
[02:34:17] ================ ttm_resource (8 subtests) =================
[02:34:17] ================= ttm_resource_init_basic  =================
[02:34:17] [PASSED] Init resource in TTM_PL_SYSTEM
[02:34:17] [PASSED] Init resource in TTM_PL_VRAM
[02:34:17] [PASSED] Init resource in a private placement
[02:34:17] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[02:34:17] ============= [PASSED] ttm_resource_init_basic =============
[02:34:17] [PASSED] ttm_resource_init_pinned
[02:34:17] [PASSED] ttm_resource_fini_basic
[02:34:17] [PASSED] ttm_resource_manager_init_basic
[02:34:17] [PASSED] ttm_resource_manager_usage_basic
[02:34:17] [PASSED] ttm_resource_manager_set_used_basic
[02:34:17] [PASSED] ttm_sys_man_alloc_basic
[02:34:17] [PASSED] ttm_sys_man_free_basic
[02:34:17] ================== [PASSED] ttm_resource ===================
[02:34:17] =================== ttm_tt (15 subtests) ===================
[02:34:17] ==================== ttm_tt_init_basic  ====================
[02:34:17] [PASSED] Page-aligned size
[02:34:17] [PASSED] Extra pages requested
[02:34:17] ================ [PASSED] ttm_tt_init_basic ================
[02:34:17] [PASSED] ttm_tt_init_misaligned
[02:34:17] [PASSED] ttm_tt_fini_basic
[02:34:17] [PASSED] ttm_tt_fini_sg
[02:34:17] [PASSED] ttm_tt_fini_shmem
[02:34:17] [PASSED] ttm_tt_create_basic
[02:34:17] [PASSED] ttm_tt_create_invalid_bo_type
[02:34:17] [PASSED] ttm_tt_create_ttm_exists
[02:34:17] [PASSED] ttm_tt_create_failed
[02:34:17] [PASSED] ttm_tt_destroy_basic
[02:34:17] [PASSED] ttm_tt_populate_null_ttm
[02:34:17] [PASSED] ttm_tt_populate_populated_ttm
[02:34:17] [PASSED] ttm_tt_unpopulate_basic
[02:34:17] [PASSED] ttm_tt_unpopulate_empty_ttm
[02:34:17] [PASSED] ttm_tt_swapin_basic
[02:34:17] ===================== [PASSED] ttm_tt ======================
[02:34:17] =================== ttm_bo (14 subtests) ===================
[02:34:17] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[02:34:17] [PASSED] Cannot be interrupted and sleeps
[02:34:17] [PASSED] Cannot be interrupted, locks straight away
[02:34:17] [PASSED] Can be interrupted, sleeps
[02:34:17] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[02:34:17] [PASSED] ttm_bo_reserve_locked_no_sleep
[02:34:17] [PASSED] ttm_bo_reserve_no_wait_ticket
[02:34:17] [PASSED] ttm_bo_reserve_double_resv
[02:34:17] [PASSED] ttm_bo_reserve_interrupted
[02:34:17] [PASSED] ttm_bo_reserve_deadlock
[02:34:17] [PASSED] ttm_bo_unreserve_basic
[02:34:17] [PASSED] ttm_bo_unreserve_pinned
[02:34:17] [PASSED] ttm_bo_unreserve_bulk
[02:34:17] [PASSED] ttm_bo_put_basic
[02:34:17] [PASSED] ttm_bo_put_shared_resv
[02:34:17] [PASSED] ttm_bo_pin_basic
[02:34:17] [PASSED] ttm_bo_pin_unpin_resource
[02:34:17] [PASSED] ttm_bo_multiple_pin_one_unpin
[02:34:17] ===================== [PASSED] ttm_bo ======================
[02:34:17] ============== ttm_bo_validate (22 subtests) ===============
[02:34:17] ============== ttm_bo_init_reserved_sys_man  ===============
[02:34:17] [PASSED] Buffer object for userspace
[02:34:17] [PASSED] Kernel buffer object
[02:34:17] [PASSED] Shared buffer object
[02:34:17] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[02:34:17] ============== ttm_bo_init_reserved_mock_man  ==============
[02:34:17] [PASSED] Buffer object for userspace
[02:34:17] [PASSED] Kernel buffer object
[02:34:17] [PASSED] Shared buffer object
[02:34:17] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[02:34:17] [PASSED] ttm_bo_init_reserved_resv
[02:34:17] ================== ttm_bo_validate_basic  ==================
[02:34:17] [PASSED] Buffer object for userspace
[02:34:17] [PASSED] Kernel buffer object
[02:34:17] [PASSED] Shared buffer object
[02:34:17] ============== [PASSED] ttm_bo_validate_basic ==============
[02:34:17] [PASSED] ttm_bo_validate_invalid_placement
[02:34:17] ============= ttm_bo_validate_same_placement  ==============
[02:34:17] [PASSED] System manager
[02:34:17] [PASSED] VRAM manager
[02:34:17] ========= [PASSED] ttm_bo_validate_same_placement ==========
[02:34:17] [PASSED] ttm_bo_validate_failed_alloc
[02:34:17] [PASSED] ttm_bo_validate_pinned
[02:34:17] [PASSED] ttm_bo_validate_busy_placement
[02:34:17] ================ ttm_bo_validate_multihop  =================
[02:34:17] [PASSED] Buffer object for userspace
[02:34:17] [PASSED] Kernel buffer object
[02:34:17] [PASSED] Shared buffer object
[02:34:17] ============ [PASSED] ttm_bo_validate_multihop =============
[02:34:17] ========== ttm_bo_validate_no_placement_signaled  ==========
[02:34:17] [PASSED] Buffer object in system domain, no page vector
[02:34:17] [PASSED] Buffer object in system domain with an existing page vector
[02:34:17] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[02:34:17] ======== ttm_bo_validate_no_placement_not_signaled  ========
[02:34:17] [PASSED] Buffer object for userspace
[02:34:17] [PASSED] Kernel buffer object
[02:34:17] [PASSED] Shared buffer object
[02:34:17] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[02:34:17] [PASSED] ttm_bo_validate_move_fence_signaled
[02:34:17] ========= ttm_bo_validate_move_fence_not_signaled  =========
[02:34:17] [PASSED] Waits for GPU
[02:34:17] [PASSED] Tries to lock straight away
[02:34:17] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[02:34:17] [PASSED] ttm_bo_validate_swapout
[02:34:17] [PASSED] ttm_bo_validate_happy_evict
[02:34:17] [PASSED] ttm_bo_validate_all_pinned_evict
[02:34:17] [PASSED] ttm_bo_validate_allowed_only_evict
[02:34:17] [PASSED] ttm_bo_validate_deleted_evict
[02:34:17] [PASSED] ttm_bo_validate_busy_domain_evict
[02:34:17] [PASSED] ttm_bo_validate_evict_gutting
[02:34:17] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[02:34:17] ================= [PASSED] ttm_bo_validate =================
[02:34:17] ============================================================
[02:34:17] Testing complete. Ran 102 tests: passed: 102
[02:34:17] Elapsed time: 9.989s total, 1.623s configuring, 7.748s building, 0.525s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


