Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D52C8302F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 23:49:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E1810E243;
	Mon, 30 Jun 2025 23:49:23 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0161910E243;
 Mon, 30 Jun 2025 23:49:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/xe=5Fpmu=3A_Validate_gt?=
 =?utf-8?q?_in_event_supported?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Jun 2025 23:49:21 -0000
Message-ID: <175132736199.121990.8468467589947765895@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250630093741.2435281-1-riana.tauro@intel.com>
In-Reply-To: <20250630093741.2435281-1-riana.tauro@intel.com>
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

Series: drm/xe/xe_pmu: Validate gt in event supported
URL   : https://patchwork.freedesktop.org/series/150943/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[23:47:59] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:48:03] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=25
[23:48:36] Starting KUnit Kernel (1/1)...
[23:48:36] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:48:36] ================== guc_buf (11 subtests) ===================
[23:48:36] [PASSED] test_smallest
[23:48:36] [PASSED] test_largest
[23:48:36] [PASSED] test_granular
[23:48:36] [PASSED] test_unique
[23:48:36] [PASSED] test_overlap
[23:48:36] [PASSED] test_reusable
[23:48:36] [PASSED] test_too_big
[23:48:36] [PASSED] test_flush
[23:48:36] [PASSED] test_lookup
[23:48:36] [PASSED] test_data
[23:48:36] [PASSED] test_class
[23:48:36] ===================== [PASSED] guc_buf =====================
[23:48:36] =================== guc_dbm (7 subtests) ===================
[23:48:36] [PASSED] test_empty
[23:48:36] [PASSED] test_default
[23:48:36] ======================== test_size  ========================
[23:48:36] [PASSED] 4
[23:48:36] [PASSED] 8
[23:48:36] [PASSED] 32
[23:48:36] [PASSED] 256
[23:48:36] ==================== [PASSED] test_size ====================
[23:48:36] ======================= test_reuse  ========================
[23:48:36] [PASSED] 4
[23:48:36] [PASSED] 8
[23:48:36] [PASSED] 32
[23:48:36] [PASSED] 256
[23:48:36] =================== [PASSED] test_reuse ====================
[23:48:36] =================== test_range_overlap  ====================
[23:48:36] [PASSED] 4
[23:48:36] [PASSED] 8
[23:48:36] [PASSED] 32
[23:48:36] [PASSED] 256
[23:48:36] =============== [PASSED] test_range_overlap ================
[23:48:36] =================== test_range_compact  ====================
[23:48:36] [PASSED] 4
[23:48:36] [PASSED] 8
[23:48:36] [PASSED] 32
[23:48:36] [PASSED] 256
[23:48:36] =============== [PASSED] test_range_compact ================
[23:48:36] ==================== test_range_spare  =====================
[23:48:36] [PASSED] 4
[23:48:36] [PASSED] 8
[23:48:36] [PASSED] 32
[23:48:36] [PASSED] 256
[23:48:36] ================ [PASSED] test_range_spare =================
[23:48:36] ===================== [PASSED] guc_dbm =====================
[23:48:36] =================== guc_idm (6 subtests) ===================
[23:48:36] [PASSED] bad_init
[23:48:36] [PASSED] no_init
[23:48:36] [PASSED] init_fini
[23:48:36] [PASSED] check_used
[23:48:36] [PASSED] check_quota
[23:48:36] [PASSED] check_all
[23:48:36] ===================== [PASSED] guc_idm =====================
[23:48:36] ================== no_relay (3 subtests) ===================
[23:48:36] [PASSED] xe_drops_guc2pf_if_not_ready
[23:48:36] [PASSED] xe_drops_guc2vf_if_not_ready
[23:48:36] [PASSED] xe_rejects_send_if_not_ready
[23:48:36] ==================== [PASSED] no_relay =====================
[23:48:36] ================== pf_relay (14 subtests) ==================
[23:48:36] [PASSED] pf_rejects_guc2pf_too_short
[23:48:36] [PASSED] pf_rejects_guc2pf_too_long
[23:48:36] [PASSED] pf_rejects_guc2pf_no_payload
[23:48:36] [PASSED] pf_fails_no_payload
[23:48:36] [PASSED] pf_fails_bad_origin
[23:48:36] [PASSED] pf_fails_bad_type
[23:48:36] [PASSED] pf_txn_reports_error
[23:48:36] [PASSED] pf_txn_sends_pf2guc
[23:48:36] [PASSED] pf_sends_pf2guc
[23:48:36] [SKIPPED] pf_loopback_nop
[23:48:36] [SKIPPED] pf_loopback_echo
[23:48:36] [SKIPPED] pf_loopback_fail
[23:48:36] [SKIPPED] pf_loopback_busy
[23:48:36] [SKIPPED] pf_loopback_retry
[23:48:36] ==================== [PASSED] pf_relay =====================
[23:48:36] ================== vf_relay (3 subtests) ===================
[23:48:36] [PASSED] vf_rejects_guc2vf_too_short
[23:48:36] [PASSED] vf_rejects_guc2vf_too_long
[23:48:36] [PASSED] vf_rejects_guc2vf_no_payload
[23:48:36] ==================== [PASSED] vf_relay =====================
[23:48:36] ================= pf_service (11 subtests) =================
[23:48:36] [PASSED] pf_negotiate_any
[23:48:36] [PASSED] pf_negotiate_base_match
[23:48:36] [PASSED] pf_negotiate_base_newer
[23:48:36] [PASSED] pf_negotiate_base_next
[23:48:36] [SKIPPED] pf_negotiate_base_older
[23:48:36] [PASSED] pf_negotiate_base_prev
[23:48:36] [PASSED] pf_negotiate_latest_match
[23:48:36] [PASSED] pf_negotiate_latest_newer
[23:48:36] [PASSED] pf_negotiate_latest_next
[23:48:36] [SKIPPED] pf_negotiate_latest_older
[23:48:36] [SKIPPED] pf_negotiate_latest_prev
[23:48:36] =================== [PASSED] pf_service ====================
[23:48:36] ===================== lmtt (1 subtest) =====================
[23:48:36] ======================== test_ops  =========================
[23:48:36] [PASSED] 2-level
[23:48:36] [PASSED] multi-level
[23:48:36] ==================== [PASSED] test_ops =====================
[23:48:36] ====================== [PASSED] lmtt =======================
[23:48:36] =================== xe_mocs (2 subtests) ===================
[23:48:36] ================ xe_live_mocs_kernel_kunit  ================
[23:48:36] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[23:48:36] ================ xe_live_mocs_reset_kunit  =================
[23:48:36] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[23:48:36] ==================== [SKIPPED] xe_mocs =====================
[23:48:36] ================= xe_migrate (2 subtests) ==================
[23:48:36] ================= xe_migrate_sanity_kunit  =================
[23:48:36] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[23:48:36] ================== xe_validate_ccs_kunit  ==================
[23:48:36] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[23:48:36] =================== [SKIPPED] xe_migrate ===================
[23:48:36] ================== xe_dma_buf (1 subtest) ==================
[23:48:36] ==================== xe_dma_buf_kunit  =====================
[23:48:36] ================ [SKIPPED] xe_dma_buf_kunit ================
[23:48:36] =================== [SKIPPED] xe_dma_buf ===================
[23:48:36] ================= xe_bo_shrink (1 subtest) =================
[23:48:36] =================== xe_bo_shrink_kunit  ====================
[23:48:36] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[23:48:36] ================== [SKIPPED] xe_bo_shrink ==================
[23:48:36] ==================== xe_bo (2 subtests) ====================
[23:48:36] ================== xe_ccs_migrate_kunit  ===================
[23:48:36] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[23:48:36] ==================== xe_bo_evict_kunit  ====================
[23:48:36] =============== [SKIPPED] xe_bo_evict_kunit ================
[23:48:36] ===================== [SKIPPED] xe_bo ======================
[23:48:36] ==================== args (11 subtests) ====================
[23:48:36] [PASSED] count_args_test
[23:48:36] [PASSED] call_args_example
[23:48:36] [PASSED] call_args_test
[23:48:36] [PASSED] drop_first_arg_example
[23:48:36] [PASSED] drop_first_arg_test
[23:48:36] [PASSED] first_arg_example
[23:48:36] [PASSED] first_arg_test
[23:48:36] [PASSED] last_arg_example
[23:48:36] [PASSED] last_arg_test
[23:48:36] [PASSED] pick_arg_example
[23:48:36] [PASSED] sep_comma_example
[23:48:36] ====================== [PASSED] args =======================
[23:48:36] =================== xe_pci (2 subtests) ====================
[23:48:36] ==================== check_graphics_ip  ====================
[23:48:36] [PASSED] 12.70 Xe_LPG
[23:48:36] [PASSED] 12.71 Xe_LPG
[23:48:36] [PASSED] 12.74 Xe_LPG+
[23:48:36] [PASSED] 20.01 Xe2_HPG
[23:48:36] [PASSED] 20.02 Xe2_HPG
[23:48:36] [PASSED] 20.04 Xe2_LPG
[23:48:36] [PASSED] 30.00 Xe3_LPG
[23:48:36] [PASSED] 30.01 Xe3_LPG
[23:48:36] [PASSED] 30.03 Xe3_LPG
[23:48:36] ================ [PASSED] check_graphics_ip ================
[23:48:36] ===================== check_media_ip  ======================
[23:48:36] [PASSED] 13.00 Xe_LPM+
[23:48:36] [PASSED] 13.01 Xe2_HPM
[23:48:36] [PASSED] 20.00 Xe2_LPM
[23:48:36] [PASSED] 30.00 Xe3_LPM
[23:48:36] [PASSED] 30.02 Xe3_LPM
stty: 'standard input': Inappropriate ioctl for device
[23:48:36] ================= [PASSED] check_media_ip ==================
[23:48:36] ===================== [PASSED] xe_pci ======================
[23:48:36] =================== xe_rtp (2 subtests) ====================
[23:48:36] =============== xe_rtp_process_to_sr_tests  ================
[23:48:36] [PASSED] coalesce-same-reg
[23:48:36] [PASSED] no-match-no-add
[23:48:36] [PASSED] match-or
[23:48:36] [PASSED] match-or-xfail
[23:48:36] [PASSED] no-match-no-add-multiple-rules
[23:48:36] [PASSED] two-regs-two-entries
[23:48:36] [PASSED] clr-one-set-other
[23:48:36] [PASSED] set-field
[23:48:36] [PASSED] conflict-duplicate
[23:48:36] [PASSED] conflict-not-disjoint
[23:48:36] [PASSED] conflict-reg-type
[23:48:36] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[23:48:36] ================== xe_rtp_process_tests  ===================
[23:48:36] [PASSED] active1
[23:48:36] [PASSED] active2
[23:48:36] [PASSED] active-inactive
[23:48:36] [PASSED] inactive-active
[23:48:36] [PASSED] inactive-1st_or_active-inactive
[23:48:36] [PASSED] inactive-2nd_or_active-inactive
[23:48:36] [PASSED] inactive-last_or_active-inactive
[23:48:36] [PASSED] inactive-no_or_active-inactive
[23:48:36] ============== [PASSED] xe_rtp_process_tests ===============
[23:48:36] ===================== [PASSED] xe_rtp ======================
[23:48:36] ==================== xe_wa (1 subtest) =====================
[23:48:36] ======================== xe_wa_gt  =========================
[23:48:36] [PASSED] TIGERLAKE (B0)
[23:48:36] [PASSED] DG1 (A0)
[23:48:36] [PASSED] DG1 (B0)
[23:48:36] [PASSED] ALDERLAKE_S (A0)
[23:48:36] [PASSED] ALDERLAKE_S (B0)
[23:48:36] [PASSED] ALDERLAKE_S (C0)
[23:48:36] [PASSED] ALDERLAKE_S (D0)
[23:48:36] [PASSED] ALDERLAKE_P (A0)
[23:48:36] [PASSED] ALDERLAKE_P (B0)
[23:48:36] [PASSED] ALDERLAKE_P (C0)
[23:48:36] [PASSED] ALDERLAKE_S_RPLS (D0)
[23:48:36] [PASSED] ALDERLAKE_P_RPLU (E0)
[23:48:36] [PASSED] DG2_G10 (C0)
[23:48:36] [PASSED] DG2_G11 (B1)
[23:48:36] [PASSED] DG2_G12 (A1)
[23:48:36] [PASSED] METEORLAKE (g:A0, m:A0)
[23:48:36] [PASSED] METEORLAKE (g:A0, m:A0)
[23:48:36] [PASSED] METEORLAKE (g:A0, m:A0)
[23:48:36] [PASSED] LUNARLAKE (g:A0, m:A0)
[23:48:36] [PASSED] LUNARLAKE (g:B0, m:A0)
[23:48:36] [PASSED] BATTLEMAGE (g:A0, m:A1)
[23:48:36] ==================== [PASSED] xe_wa_gt =====================
[23:48:36] ====================== [PASSED] xe_wa ======================
[23:48:36] ============================================================
[23:48:36] Testing complete. Ran 145 tests: passed: 129, skipped: 16
[23:48:36] Elapsed time: 37.361s total, 4.222s configuring, 32.822s building, 0.305s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[23:48:36] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:48:38] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=25
[23:49:04] Starting KUnit Kernel (1/1)...
[23:49:04] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:49:04] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[23:49:04] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[23:49:04] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[23:49:04] =========== drm_validate_clone_mode (2 subtests) ===========
[23:49:04] ============== drm_test_check_in_clone_mode  ===============
[23:49:04] [PASSED] in_clone_mode
[23:49:04] [PASSED] not_in_clone_mode
[23:49:04] ========== [PASSED] drm_test_check_in_clone_mode ===========
[23:49:04] =============== drm_test_check_valid_clones  ===============
[23:49:04] [PASSED] not_in_clone_mode
[23:49:04] [PASSED] valid_clone
[23:49:04] [PASSED] invalid_clone
[23:49:04] =========== [PASSED] drm_test_check_valid_clones ===========
[23:49:04] ============= [PASSED] drm_validate_clone_mode =============
[23:49:04] ============= drm_validate_modeset (1 subtest) =============
[23:49:04] [PASSED] drm_test_check_connector_changed_modeset
[23:49:04] ============== [PASSED] drm_validate_modeset ===============
[23:49:04] ====== drm_test_bridge_get_current_state (2 subtests) ======
[23:49:04] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[23:49:04] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[23:49:04] ======== [PASSED] drm_test_bridge_get_current_state ========
[23:49:04] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[23:49:04] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[23:49:04] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[23:49:04] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[23:49:04] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[23:49:04] ============== drm_bridge_alloc (2 subtests) ===============
[23:49:04] [PASSED] drm_test_drm_bridge_alloc_basic
[23:49:04] [PASSED] drm_test_drm_bridge_alloc_get_put
[23:49:04] ================ [PASSED] drm_bridge_alloc =================
[23:49:04] ================== drm_buddy (7 subtests) ==================
[23:49:04] [PASSED] drm_test_buddy_alloc_limit
[23:49:04] [PASSED] drm_test_buddy_alloc_optimistic
[23:49:04] [PASSED] drm_test_buddy_alloc_pessimistic
[23:49:04] [PASSED] drm_test_buddy_alloc_pathological
[23:49:04] [PASSED] drm_test_buddy_alloc_contiguous
[23:49:04] [PASSED] drm_test_buddy_alloc_clear
[23:49:04] [PASSED] drm_test_buddy_alloc_range_bias
[23:49:04] ==================== [PASSED] drm_buddy ====================
[23:49:04] ============= drm_cmdline_parser (40 subtests) =============
[23:49:04] [PASSED] drm_test_cmdline_force_d_only
[23:49:04] [PASSED] drm_test_cmdline_force_D_only_dvi
[23:49:04] [PASSED] drm_test_cmdline_force_D_only_hdmi
[23:49:04] [PASSED] drm_test_cmdline_force_D_only_not_digital
[23:49:04] [PASSED] drm_test_cmdline_force_e_only
[23:49:04] [PASSED] drm_test_cmdline_res
[23:49:04] [PASSED] drm_test_cmdline_res_vesa
[23:49:04] [PASSED] drm_test_cmdline_res_vesa_rblank
[23:49:04] [PASSED] drm_test_cmdline_res_rblank
[23:49:04] [PASSED] drm_test_cmdline_res_bpp
[23:49:04] [PASSED] drm_test_cmdline_res_refresh
[23:49:04] [PASSED] drm_test_cmdline_res_bpp_refresh
[23:49:04] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[23:49:04] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[23:49:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[23:49:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[23:49:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[23:49:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[23:49:04] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[23:49:04] [PASSED] drm_test_cmdline_res_margins_force_on
[23:49:04] [PASSED] drm_test_cmdline_res_vesa_margins
[23:49:04] [PASSED] drm_test_cmdline_name
[23:49:04] [PASSED] drm_test_cmdline_name_bpp
[23:49:04] [PASSED] drm_test_cmdline_name_option
[23:49:04] [PASSED] drm_test_cmdline_name_bpp_option
[23:49:04] [PASSED] drm_test_cmdline_rotate_0
[23:49:04] [PASSED] drm_test_cmdline_rotate_90
[23:49:04] [PASSED] drm_test_cmdline_rotate_180
[23:49:04] [PASSED] drm_test_cmdline_rotate_270
[23:49:04] [PASSED] drm_test_cmdline_hmirror
[23:49:04] [PASSED] drm_test_cmdline_vmirror
[23:49:04] [PASSED] drm_test_cmdline_margin_options
[23:49:04] [PASSED] drm_test_cmdline_multiple_options
[23:49:04] [PASSED] drm_test_cmdline_bpp_extra_and_option
[23:49:04] [PASSED] drm_test_cmdline_extra_and_option
[23:49:04] [PASSED] drm_test_cmdline_freestanding_options
[23:49:04] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[23:49:04] [PASSED] drm_test_cmdline_panel_orientation
[23:49:04] ================ drm_test_cmdline_invalid  =================
[23:49:04] [PASSED] margin_only
[23:49:04] [PASSED] interlace_only
[23:49:04] [PASSED] res_missing_x
[23:49:04] [PASSED] res_missing_y
[23:49:04] [PASSED] res_bad_y
[23:49:04] [PASSED] res_missing_y_bpp
[23:49:04] [PASSED] res_bad_bpp
[23:49:04] [PASSED] res_bad_refresh
[23:49:04] [PASSED] res_bpp_refresh_force_on_off
[23:49:04] [PASSED] res_invalid_mode
[23:49:04] [PASSED] res_bpp_wrong_place_mode
[23:49:04] [PASSED] name_bpp_refresh
[23:49:04] [PASSED] name_refresh
[23:49:04] [PASSED] name_refresh_wrong_mode
[23:49:04] [PASSED] name_refresh_invalid_mode
[23:49:04] [PASSED] rotate_multiple
[23:49:04] [PASSED] rotate_invalid_val
[23:49:04] [PASSED] rotate_truncated
[23:49:04] [PASSED] invalid_option
[23:49:04] [PASSED] invalid_tv_option
[23:49:04] [PASSED] truncated_tv_option
[23:49:04] ============ [PASSED] drm_test_cmdline_invalid =============
[23:49:04] =============== drm_test_cmdline_tv_options  ===============
[23:49:04] [PASSED] NTSC
[23:49:04] [PASSED] NTSC_443
[23:49:04] [PASSED] NTSC_J
[23:49:04] [PASSED] PAL
[23:49:04] [PASSED] PAL_M
[23:49:04] [PASSED] PAL_N
[23:49:04] [PASSED] SECAM
[23:49:04] [PASSED] MONO_525
[23:49:04] [PASSED] MONO_625
[23:49:04] =========== [PASSED] drm_test_cmdline_tv_options ===========
[23:49:04] =============== [PASSED] drm_cmdline_parser ================
[23:49:04] ========== drmm_connector_hdmi_init (20 subtests) ==========
[23:49:04] [PASSED] drm_test_connector_hdmi_init_valid
[23:49:04] [PASSED] drm_test_connector_hdmi_init_bpc_8
[23:49:04] [PASSED] drm_test_connector_hdmi_init_bpc_10
[23:49:04] [PASSED] drm_test_connector_hdmi_init_bpc_12
[23:49:04] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[23:49:04] [PASSED] drm_test_connector_hdmi_init_bpc_null
[23:49:04] [PASSED] drm_test_connector_hdmi_init_formats_empty
[23:49:04] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[23:49:04] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[23:49:04] [PASSED] supported_formats=0x9 yuv420_allowed=1
[23:49:04] [PASSED] supported_formats=0x9 yuv420_allowed=0
[23:49:04] [PASSED] supported_formats=0x3 yuv420_allowed=1
[23:49:04] [PASSED] supported_formats=0x3 yuv420_allowed=0
[23:49:04] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[23:49:04] [PASSED] drm_test_connector_hdmi_init_null_ddc
[23:49:04] [PASSED] drm_test_connector_hdmi_init_null_product
[23:49:04] [PASSED] drm_test_connector_hdmi_init_null_vendor
[23:49:04] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[23:49:04] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[23:49:04] [PASSED] drm_test_connector_hdmi_init_product_valid
[23:49:04] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[23:49:04] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[23:49:04] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[23:49:04] ========= drm_test_connector_hdmi_init_type_valid  =========
[23:49:04] [PASSED] HDMI-A
[23:49:04] [PASSED] HDMI-B
[23:49:04] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[23:49:04] ======== drm_test_connector_hdmi_init_type_invalid  ========
[23:49:04] [PASSED] Unknown
[23:49:04] [PASSED] VGA
[23:49:04] [PASSED] DVI-I
[23:49:04] [PASSED] DVI-D
[23:49:04] [PASSED] DVI-A
[23:49:04] [PASSED] Composite
[23:49:04] [PASSED] SVIDEO
[23:49:04] [PASSED] LVDS
[23:49:04] [PASSED] Component
[23:49:04] [PASSED] DIN
[23:49:04] [PASSED] DP
[23:49:04] [PASSED] TV
[23:49:04] [PASSED] eDP
[23:49:04] [PASSED] Virtual
[23:49:04] [PASSED] DSI
[23:49:04] [PASSED] DPI
[23:49:04] [PASSED] Writeback
[23:49:04] [PASSED] SPI
[23:49:04] [PASSED] USB
[23:49:04] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[23:49:04] ============ [PASSED] drmm_connector_hdmi_init =============
[23:49:04] ============= drmm_connector_init (3 subtests) =============
[23:49:04] [PASSED] drm_test_drmm_connector_init
[23:49:04] [PASSED] drm_test_drmm_connector_init_null_ddc
[23:49:04] ========= drm_test_drmm_connector_init_type_valid  =========
[23:49:04] [PASSED] Unknown
[23:49:04] [PASSED] VGA
[23:49:04] [PASSED] DVI-I
[23:49:04] [PASSED] DVI-D
[23:49:04] [PASSED] DVI-A
[23:49:04] [PASSED] Composite
[23:49:04] [PASSED] SVIDEO
[23:49:04] [PASSED] LVDS
[23:49:04] [PASSED] Component
[23:49:04] [PASSED] DIN
[23:49:04] [PASSED] DP
[23:49:04] [PASSED] HDMI-A
[23:49:04] [PASSED] HDMI-B
[23:49:04] [PASSED] TV
[23:49:04] [PASSED] eDP
[23:49:04] [PASSED] Virtual
[23:49:04] [PASSED] DSI
[23:49:04] [PASSED] DPI
[23:49:04] [PASSED] Writeback
[23:49:04] [PASSED] SPI
[23:49:04] [PASSED] USB
[23:49:04] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[23:49:04] =============== [PASSED] drmm_connector_init ===============
[23:49:04] ========= drm_connector_dynamic_init (6 subtests) ==========
[23:49:04] [PASSED] drm_test_drm_connector_dynamic_init
[23:49:04] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[23:49:04] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[23:49:04] [PASSED] drm_test_drm_connector_dynamic_init_properties
[23:49:04] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[23:49:04] [PASSED] Unknown
[23:49:04] [PASSED] VGA
[23:49:04] [PASSED] DVI-I
[23:49:04] [PASSED] DVI-D
[23:49:04] [PASSED] DVI-A
[23:49:04] [PASSED] Composite
[23:49:04] [PASSED] SVIDEO
[23:49:04] [PASSED] LVDS
[23:49:04] [PASSED] Component
[23:49:04] [PASSED] DIN
[23:49:04] [PASSED] DP
[23:49:04] [PASSED] HDMI-A
[23:49:04] [PASSED] HDMI-B
[23:49:04] [PASSED] TV
[23:49:04] [PASSED] eDP
[23:49:04] [PASSED] Virtual
[23:49:04] [PASSED] DSI
[23:49:04] [PASSED] DPI
[23:49:04] [PASSED] Writeback
[23:49:04] [PASSED] SPI
[23:49:04] [PASSED] USB
[23:49:04] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[23:49:04] ======== drm_test_drm_connector_dynamic_init_name  =========
[23:49:04] [PASSED] Unknown
[23:49:04] [PASSED] VGA
[23:49:04] [PASSED] DVI-I
[23:49:04] [PASSED] DVI-D
[23:49:04] [PASSED] DVI-A
[23:49:04] [PASSED] Composite
[23:49:04] [PASSED] SVIDEO
[23:49:04] [PASSED] LVDS
[23:49:04] [PASSED] Component
[23:49:04] [PASSED] DIN
[23:49:04] [PASSED] DP
[23:49:04] [PASSED] HDMI-A
[23:49:04] [PASSED] HDMI-B
[23:49:04] [PASSED] TV
[23:49:04] [PASSED] eDP
[23:49:04] [PASSED] Virtual
[23:49:04] [PASSED] DSI
[23:49:04] [PASSED] DPI
[23:49:04] [PASSED] Writeback
[23:49:04] [PASSED] SPI
[23:49:04] [PASSED] USB
[23:49:04] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[23:49:04] =========== [PASSED] drm_connector_dynamic_init ============
[23:49:04] ==== drm_connector_dynamic_register_early (4 subtests) =====
[23:49:04] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[23:49:04] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[23:49:04] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[23:49:04] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[23:49:04] ====== [PASSED] drm_connector_dynamic_register_early =======
[23:49:04] ======= drm_connector_dynamic_register (7 subtests) ========
[23:49:04] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[23:49:04] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[23:49:04] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[23:49:04] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[23:49:04] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[23:49:04] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[23:49:04] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[23:49:04] ========= [PASSED] drm_connector_dynamic_register ==========
[23:49:04] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[23:49:04] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[23:49:04] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[23:49:04] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[23:49:04] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[23:49:04] ========== drm_test_get_tv_mode_from_name_valid  ===========
[23:49:04] [PASSED] NTSC
[23:49:04] [PASSED] NTSC-443
[23:49:04] [PASSED] NTSC-J
[23:49:04] [PASSED] PAL
[23:49:04] [PASSED] PAL-M
[23:49:04] [PASSED] PAL-N
[23:49:04] [PASSED] SECAM
[23:49:04] [PASSED] Mono
[23:49:04] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[23:49:04] [PASSED] drm_test_get_tv_mode_from_name_truncated
[23:49:04] ============ [PASSED] drm_get_tv_mode_from_name ============
[23:49:04] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[23:49:04] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[23:49:04] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[23:49:04] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[23:49:04] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[23:49:04] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[23:49:04] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[23:49:04] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[23:49:04] [PASSED] VIC 96
[23:49:04] [PASSED] VIC 97
[23:49:04] [PASSED] VIC 101
[23:49:04] [PASSED] VIC 102
[23:49:04] [PASSED] VIC 106
[23:49:04] [PASSED] VIC 107
[23:49:04] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[23:49:04] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[23:49:04] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[23:49:04] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[23:49:04] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[23:49:04] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[23:49:04] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[23:49:04] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[23:49:04] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[23:49:04] [PASSED] Automatic
[23:49:04] [PASSED] Full
[23:49:04] [PASSED] Limited 16:235
[23:49:04] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[23:49:04] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[23:49:04] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[23:49:04] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[23:49:04] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[23:49:04] [PASSED] RGB
[23:49:04] [PASSED] YUV 4:2:0
[23:49:04] [PASSED] YUV 4:2:2
[23:49:04] [PASSED] YUV 4:4:4
[23:49:04] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[23:49:04] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[23:49:04] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[23:49:04] ============= drm_damage_helper (21 subtests) ==============
[23:49:04] [PASSED] drm_test_damage_iter_no_damage
[23:49:04] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[23:49:04] [PASSED] drm_test_damage_iter_no_damage_src_moved
[23:49:04] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[23:49:04] [PASSED] drm_test_damage_iter_no_damage_not_visible
[23:49:04] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[23:49:04] [PASSED] drm_test_damage_iter_no_damage_no_fb
[23:49:04] [PASSED] drm_test_damage_iter_simple_damage
[23:49:04] [PASSED] drm_test_damage_iter_single_damage
[23:49:04] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[23:49:04] [PASSED] drm_test_damage_iter_single_damage_outside_src
[23:49:04] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[23:49:04] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[23:49:04] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[23:49:04] [PASSED] drm_test_damage_iter_single_damage_src_moved
[23:49:04] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[23:49:04] [PASSED] drm_test_damage_iter_damage
[23:49:04] [PASSED] drm_test_damage_iter_damage_one_intersect
[23:49:04] [PASSED] drm_test_damage_iter_damage_one_outside
[23:49:04] [PASSED] drm_test_damage_iter_damage_src_moved
[23:49:04] [PASSED] drm_test_damage_iter_damage_not_visible
[23:49:04] ================ [PASSED] drm_damage_helper ================
[23:49:04] ============== drm_dp_mst_helper (3 subtests) ==============
[23:49:04] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[23:49:04] [PASSED] Clock 154000 BPP 30 DSC disabled
[23:49:04] [PASSED] Clock 234000 BPP 30 DSC disabled
[23:49:04] [PASSED] Clock 297000 BPP 24 DSC disabled
[23:49:04] [PASSED] Clock 332880 BPP 24 DSC enabled
[23:49:04] [PASSED] Clock 324540 BPP 24 DSC enabled
[23:49:04] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[23:49:04] ============== drm_test_dp_mst_calc_pbn_div  ===============
[23:49:04] [PASSED] Link rate 2000000 lane count 4
[23:49:04] [PASSED] Link rate 2000000 lane count 2
[23:49:04] [PASSED] Link rate 2000000 lane count 1
[23:49:04] [PASSED] Link rate 1350000 lane count 4
[23:49:04] [PASSED] Link rate 1350000 lane count 2
[23:49:04] [PASSED] Link rate 1350000 lane count 1
[23:49:04] [PASSED] Link rate 1000000 lane count 4
[23:49:04] [PASSED] Link rate 1000000 lane count 2
[23:49:04] [PASSED] Link rate 1000000 lane count 1
[23:49:04] [PASSED] Link rate 810000 lane count 4
[23:49:04] [PASSED] Link rate 810000 lane count 2
[23:49:04] [PASSED] Link rate 810000 lane count 1
[23:49:04] [PASSED] Link rate 540000 lane count 4
[23:49:04] [PASSED] Link rate 540000 lane count 2
[23:49:04] [PASSED] Link rate 540000 lane count 1
[23:49:04] [PASSED] Link rate 270000 lane count 4
[23:49:04] [PASSED] Link rate 270000 lane count 2
[23:49:04] [PASSED] Link rate 270000 lane count 1
[23:49:04] [PASSED] Link rate 162000 lane count 4
[23:49:04] [PASSED] Link rate 162000 lane count 2
[23:49:04] [PASSED] Link rate 162000 lane count 1
[23:49:04] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[23:49:04] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[23:49:04] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[23:49:04] [PASSED] DP_POWER_UP_PHY with port number
[23:49:04] [PASSED] DP_POWER_DOWN_PHY with port number
[23:49:04] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[23:49:04] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[23:49:04] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[23:49:04] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[23:49:04] [PASSED] DP_QUERY_PAYLOAD with port number
[23:49:04] [PASSED] DP_QUERY_PAYLOAD with VCPI
[23:49:04] [PASSED] DP_REMOTE_DPCD_READ with port number
[23:49:04] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[23:49:04] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[23:49:04] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[23:49:04] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[23:49:04] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[23:49:04] [PASSED] DP_REMOTE_I2C_READ with port number
[23:49:04] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[23:49:04] [PASSED] DP_REMOTE_I2C_READ with transactions array
[23:49:04] [PASSED] DP_REMOTE_I2C_WRITE with port number
[23:49:04] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[23:49:04] [PASSED] DP_REMOTE_I2C_WRITE with data array
[23:49:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[23:49:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[23:49:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[23:49:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[23:49:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[23:49:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[23:49:04] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[23:49:04] ================ [PASSED] drm_dp_mst_helper ================
[23:49:04] ================== drm_exec (7 subtests) ===================
[23:49:04] [PASSED] sanitycheck
[23:49:04] [PASSED] test_lock
[23:49:04] [PASSED] test_lock_unlock
[23:49:04] [PASSED] test_duplicates
[23:49:04] [PASSED] test_prepare
[23:49:04] [PASSED] test_prepare_array
[23:49:04] [PASSED] test_multiple_loops
[23:49:04] ==================== [PASSED] drm_exec =====================
[23:49:04] =========== drm_format_helper_test (17 subtests) ===========
[23:49:04] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[23:49:04] [PASSED] single_pixel_source_buffer
[23:49:04] [PASSED] single_pixel_clip_rectangle
[23:49:04] [PASSED] well_known_colors
[23:49:04] [PASSED] destination_pitch
[23:49:04] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[23:49:04] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[23:49:04] [PASSED] single_pixel_source_buffer
[23:49:04] [PASSED] single_pixel_clip_rectangle
[23:49:04] [PASSED] well_known_colors
[23:49:04] [PASSED] destination_pitch
[23:49:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[23:49:04] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[23:49:04] [PASSED] single_pixel_source_buffer
[23:49:04] [PASSED] single_pixel_clip_rectangle
[23:49:04] [PASSED] well_known_colors
[23:49:04] [PASSED] destination_pitch
[23:49:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[23:49:04] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[23:49:04] [PASSED] single_pixel_source_buffer
[23:49:04] [PASSED] single_pixel_clip_rectangle
[23:49:04] [PASSED] well_known_colors
[23:49:04] [PASSED] destination_pitch
[23:49:04] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[23:49:04] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[23:49:04] [PASSED] single_pixel_source_buffer
[23:49:04] [PASSED] single_pixel_clip_rectangle
[23:49:04] [PASSED] well_known_colors
[23:49:04] [PASSED] destination_pitch
[23:49:04] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[23:49:04] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[23:49:04] [PASSED] single_pixel_source_buffer
[23:49:04] [PASSED] single_pixel_clip_rectangle
[23:49:04] [PASSED] well_known_colors
[23:49:04] [PASSED] destination_pitch
[23:49:04] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[23:49:04] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[23:49:04] [PASSED] single_pixel_source_buffer
[23:49:04] [PASSED] single_pixel_clip_rectangle
[23:49:04] [PASSED] well_known_colors
[23:49:04] [PASSED] destination_pitch
[23:49:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[23:49:04] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[23:49:04] [PASSED] single_pixel_source_buffer
[23:49:04] [PASSED] single_pixel_clip_rectangle
[23:49:04] [PASSED] well_known_colors
[23:49:04] [PASSED] destination_pitch
[23:49:04] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[23:49:04] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[23:49:04] [PASSED] single_pixel_source_buffer
[23:49:04] [PASSED] single_pixel_clip_rectangle
[23:49:04] [PASSED] well_known_colors
[23:49:04] [PASSED] destination_pitch
[23:49:04] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[23:49:04] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[23:49:04] [PASSED] single_pixel_source_buffer
[23:49:04] [PASSED] single_pixel_clip_rectangle
[23:49:04] [PASSED] well_known_colors
[23:49:04] [PASSED] destination_pitch
[23:49:04] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[23:49:04] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[23:49:04] [PASSED] single_pixel_source_buffer
[23:49:04] [PASSED] single_pixel_clip_rectangle
[23:49:04] [PASSED] well_known_colors
[23:49:04] [PASSED] destination_pitch
[23:49:04] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[23:49:04] ============== drm_test_fb_xrgb8888_to_mono  ===============
[23:49:04] [PASSED] single_pixel_source_buffer
[23:49:04] [PASSED] single_pixel_clip_rectangle
[23:49:04] [PASSED] well_known_colors
[23:49:04] [PASSED] destination_pitch
[23:49:04] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[23:49:04] ==================== drm_test_fb_swab  =====================
[23:49:04] [PASSED] single_pixel_source_buffer
[23:49:04] [PASSED] single_pixel_clip_rectangle
[23:49:04] [PASSED] well_known_colors
[23:49:04] [PASSED] destination_pitch
[23:49:04] ================ [PASSED] drm_test_fb_swab =================
[23:49:04] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[23:49:04] [PASSED] single_pixel_source_buffer
[23:49:04] [PASSED] single_pixel_clip_rectangle
[23:49:04] [PASSED] well_known_colors
[23:49:04] [PASSED] destination_pitch
[23:49:04] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[23:49:04] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[23:49:04] [PASSED] single_pixel_source_buffer
[23:49:04] [PASSED] single_pixel_clip_rectangle
[23:49:04] [PASSED] well_known_colors
[23:49:04] [PASSED] destination_pitch
[23:49:04] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[23:49:04] ================= drm_test_fb_clip_offset  =================
[23:49:04] [PASSED] pass through
[23:49:04] [PASSED] horizontal offset
[23:49:04] [PASSED] vertical offset
[23:49:04] [PASSED] horizontal and vertical offset
[23:49:04] [PASSED] horizontal offset (custom pitch)
[23:49:04] [PASSED] vertical offset (custom pitch)
[23:49:04] [PASSED] horizontal and vertical offset (custom pitch)
[23:49:04] ============= [PASSED] drm_test_fb_clip_offset =============
[23:49:04] =================== drm_test_fb_memcpy  ====================
[23:49:04] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[23:49:04] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[23:49:04] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[23:49:04] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[23:49:04] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[23:49:04] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[23:49:04] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[23:49:04] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[23:49:04] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[23:49:04] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[23:49:04] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[23:49:04] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[23:49:04] =============== [PASSED] drm_test_fb_memcpy ================
[23:49:04] ============= [PASSED] drm_format_helper_test ==============
[23:49:04] ================= drm_format (18 subtests) =================
[23:49:04] [PASSED] drm_test_format_block_width_invalid
[23:49:04] [PASSED] drm_test_format_block_width_one_plane
[23:49:04] [PASSED] drm_test_format_block_width_two_plane
[23:49:04] [PASSED] drm_test_format_block_width_three_plane
[23:49:04] [PASSED] drm_test_format_block_width_tiled
[23:49:04] [PASSED] drm_test_format_block_height_invalid
[23:49:04] [PASSED] drm_test_format_block_height_one_plane
[23:49:04] [PASSED] drm_test_format_block_height_two_plane
[23:49:04] [PASSED] drm_test_format_block_height_three_plane
[23:49:04] [PASSED] drm_test_format_block_height_tiled
[23:49:04] [PASSED] drm_test_format_min_pitch_invalid
[23:49:04] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[23:49:04] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[23:49:04] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[23:49:04] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[23:49:04] [PASSED] drm_test_format_min_pitch_two_plane
[23:49:04] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[23:49:04] [PASSED] drm_test_format_min_pitch_tiled
[23:49:04] =================== [PASSED] drm_format ====================
[23:49:04] ============== drm_framebuffer (10 subtests) ===============
[23:49:04] ========== drm_test_framebuffer_check_src_coords  ==========
[23:49:04] [PASSED] Success: source fits into fb
[23:49:04] [PASSED] Fail: overflowing fb with x-axis coordinate
[23:49:04] [PASSED] Fail: overflowing fb with y-axis coordinate
[23:49:04] [PASSED] Fail: overflowing fb with source width
[23:49:04] [PASSED] Fail: overflowing fb with source height
[23:49:04] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[23:49:04] [PASSED] drm_test_framebuffer_cleanup
[23:49:04] =============== drm_test_framebuffer_create  ===============
[23:49:04] [PASSED] ABGR8888 normal sizes
[23:49:04] [PASSED] ABGR8888 max sizes
[23:49:04] [PASSED] ABGR8888 pitch greater than min required
[23:49:04] [PASSED] ABGR8888 pitch less than min required
[23:49:04] [PASSED] ABGR8888 Invalid width
[23:49:04] [PASSED] ABGR8888 Invalid buffer handle
[23:49:04] [PASSED] No pixel format
[23:49:04] [PASSED] ABGR8888 Width 0
[23:49:04] [PASSED] ABGR8888 Height 0
[23:49:04] [PASSED] ABGR8888 Out of bound height * pitch combination
[23:49:04] [PASSED] ABGR8888 Large buffer offset
[23:49:04] [PASSED] ABGR8888 Buffer offset for inexistent plane
[23:49:04] [PASSED] ABGR8888 Invalid flag
[23:49:04] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[23:49:04] [PASSED] ABGR8888 Valid buffer modifier
[23:49:04] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[23:49:04] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[23:49:04] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[23:49:04] [PASSED] NV12 Normal sizes
[23:49:04] [PASSED] NV12 Max sizes
[23:49:04] [PASSED] NV12 Invalid pitch
[23:49:04] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[23:49:04] [PASSED] NV12 different  modifier per-plane
[23:49:04] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[23:49:04] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[23:49:04] [PASSED] NV12 Modifier for inexistent plane
[23:49:04] [PASSED] NV12 Handle for inexistent plane
[23:49:04] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[23:49:04] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[23:49:04] [PASSED] YVU420 Normal sizes
[23:49:04] [PASSED] YVU420 Max sizes
[23:49:04] [PASSED] YVU420 Invalid pitch
[23:49:04] [PASSED] YVU420 Different pitches
[23:49:04] [PASSED] YVU420 Different buffer offsets/pitches
[23:49:04] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[23:49:04] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[23:49:04] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[23:49:04] [PASSED] YVU420 Valid modifier
[23:49:04] [PASSED] YVU420 Different modifiers per plane
[23:49:04] [PASSED] YVU420 Modifier for inexistent plane
[23:49:04] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[23:49:04] [PASSED] X0L2 Normal sizes
[23:49:04] [PASSED] X0L2 Max sizes
[23:49:04] [PASSED] X0L2 Invalid pitch
[23:49:04] [PASSED] X0L2 Pitch greater than minimum required
[23:49:04] [PASSED] X0L2 Handle for inexistent plane
[23:49:04] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[23:49:04] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[23:49:04] [PASSED] X0L2 Valid modifier
[23:49:04] [PASSED] X0L2 Modifier for inexistent plane
[23:49:04] =========== [PASSED] drm_test_framebuffer_create ===========
[23:49:04] [PASSED] drm_test_framebuffer_free
[23:49:04] [PASSED] drm_test_framebuffer_init
[23:49:04] [PASSED] drm_test_framebuffer_init_bad_format
[23:49:04] [PASSED] drm_test_framebuffer_init_dev_mismatch
[23:49:04] [PASSED] drm_test_framebuffer_lookup
[23:49:04] [PASSED] drm_test_framebuffer_lookup_inexistent
[23:49:04] [PASSED] drm_test_framebuffer_modifiers_not_supported
[23:49:04] ================= [PASSED] drm_framebuffer =================
[23:49:04] ================ drm_gem_shmem (8 subtests) ================
[23:49:04] [PASSED] drm_gem_shmem_test_obj_create
[23:49:04] [PASSED] drm_gem_shmem_test_obj_create_private
[23:49:04] [PASSED] drm_gem_shmem_test_pin_pages
[23:49:04] [PASSED] drm_gem_shmem_test_vmap
[23:49:04] [PASSED] drm_gem_shmem_test_get_pages_sgt
[23:49:04] [PASSED] drm_gem_shmem_test_get_sg_table
[23:49:04] [PASSED] drm_gem_shmem_test_madvise
[23:49:04] [PASSED] drm_gem_shmem_test_purge
[23:49:04] ================== [PASSED] drm_gem_shmem ==================
[23:49:04] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[23:49:04] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[23:49:04] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[23:49:04] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[23:49:04] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[23:49:04] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[23:49:04] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[23:49:04] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[23:49:04] [PASSED] Automatic
[23:49:04] [PASSED] Full
[23:49:04] [PASSED] Limited 16:235
[23:49:04] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[23:49:04] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[23:49:04] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[23:49:04] [PASSED] drm_test_check_disable_connector
[23:49:04] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[23:49:04] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[23:49:04] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[23:49:04] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[23:49:04] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[23:49:04] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[23:49:04] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[23:49:04] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[23:49:04] [PASSED] drm_test_check_output_bpc_dvi
[23:49:04] [PASSED] drm_test_check_output_bpc_format_vic_1
[23:49:04] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[23:49:04] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[23:49:04] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[23:49:04] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[23:49:04] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[23:49:04] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[23:49:04] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[23:49:04] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[23:49:04] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[23:49:04] [PASSED] drm_test_check_broadcast_rgb_value
[23:49:04] [PASSED] drm_test_check_bpc_8_value
[23:49:04] [PASSED] drm_test_check_bpc_10_value
[23:49:04] [PASSED] drm_test_check_bpc_12_value
[23:49:04] [PASSED] drm_test_check_format_value
[23:49:04] [PASSED] drm_test_check_tmds_char_value
[23:49:04] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[23:49:04] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[23:49:04] [PASSED] drm_test_check_mode_valid
[23:49:04] [PASSED] drm_test_check_mode_valid_reject
[23:49:04] [PASSED] drm_test_check_mode_valid_reject_rate
[23:49:04] [PASSED] drm_test_check_mode_valid_reject_max_clock
[23:49:04] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[23:49:04] ================= drm_managed (2 subtests) =================
[23:49:04] [PASSED] drm_test_managed_release_action
[23:49:04] [PASSED] drm_test_managed_run_action
[23:49:04] =================== [PASSED] drm_managed ===================
[23:49:04] =================== drm_mm (6 subtests) ====================
[23:49:04] [PASSED] drm_test_mm_init
[23:49:04] [PASSED] drm_test_mm_debug
[23:49:04] [PASSED] drm_test_mm_align32
[23:49:04] [PASSED] drm_test_mm_align64
[23:49:04] [PASSED] drm_test_mm_lowest
[23:49:04] [PASSED] drm_test_mm_highest
[23:49:04] ===================== [PASSED] drm_mm ======================
[23:49:04] ============= drm_modes_analog_tv (5 subtests) =============
[23:49:04] [PASSED] drm_test_modes_analog_tv_mono_576i
[23:49:04] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[23:49:04] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[23:49:04] [PASSED] drm_test_modes_analog_tv_pal_576i
[23:49:04] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[23:49:04] =============== [PASSED] drm_modes_analog_tv ===============
[23:49:04] ============== drm_plane_helper (2 subtests) ===============
[23:49:04] =============== drm_test_check_plane_state  ================
[23:49:04] [PASSED] clipping_simple
[23:49:04] [PASSED] clipping_rotate_reflect
[23:49:04] [PASSED] positioning_simple
[23:49:04] [PASSED] upscaling
[23:49:04] [PASSED] downscaling
[23:49:04] [PASSED] rounding1
[23:49:04] [PASSED] rounding2
[23:49:04] [PASSED] rounding3
[23:49:04] [PASSED] rounding4
[23:49:04] =========== [PASSED] drm_test_check_plane_state ============
[23:49:04] =========== drm_test_check_invalid_plane_state  ============
[23:49:04] [PASSED] positioning_invalid
[23:49:04] [PASSED] upscaling_invalid
[23:49:04] [PASSED] downscaling_invalid
[23:49:04] ======= [PASSED] drm_test_check_invalid_plane_state ========
[23:49:04] ================ [PASSED] drm_plane_helper =================
[23:49:04] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[23:49:04] ====== drm_test_connector_helper_tv_get_modes_check  =======
[23:49:04] [PASSED] None
[23:49:04] [PASSED] PAL
[23:49:04] [PASSED] NTSC
[23:49:04] [PASSED] Both, NTSC Default
[23:49:04] [PASSED] Both, PAL Default
[23:49:04] [PASSED] Both, NTSC Default, with PAL on command-line
[23:49:04] [PASSED] Both, PAL Default, with NTSC on command-line
[23:49:04] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[23:49:04] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[23:49:04] ================== drm_rect (9 subtests) ===================
[23:49:04] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[23:49:04] [PASSED] drm_test_rect_clip_scaled_not_clipped
[23:49:04] [PASSED] drm_test_rect_clip_scaled_clipped
[23:49:04] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[23:49:04] ================= drm_test_rect_intersect  =================
[23:49:04] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[23:49:04] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[23:49:04] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[23:49:04] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[23:49:04] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[23:49:04] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[23:49:04] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[23:49:04] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[23:49:04] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[23:49:04] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[23:49:04] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[23:49:04] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[23:49:04] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[23:49:04] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[23:49:04] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[23:49:04] ============= [PASSED] drm_test_rect_intersect =============
[23:49:04] ================ drm_test_rect_calc_hscale  ================
[23:49:04] [PASSED] normal use
[23:49:04] [PASSED] out of max range
[23:49:04] [PASSED] out of min range
[23:49:04] [PASSED] zero dst
[23:49:04] [PASSED] negative src
[23:49:04] [PASSED] negative dst
[23:49:04] ============ [PASSED] drm_test_rect_calc_hscale ============
[23:49:04] ================ drm_test_rect_calc_vscale  ================
[23:49:04] [PASSED] normal use
[23:49:04] [PASSED] out of max range
[23:49:04] [PASSED] out of min range
[23:49:04] [PASSED] zero dst
[23:49:04] [PASSED] negative src
[23:49:04] [PASSED] negative dst
[23:49:04] ============ [PASSED] drm_test_rect_calc_vscale ============
[23:49:04] ================== drm_test_rect_rotate  ===================
[23:49:04] [PASSED] reflect-x
[23:49:04] [PASSED] reflect-y
[23:49:04] [PASSED] rotate-0
[23:49:04] [PASSED] rotate-90
[23:49:04] [PASSED] rotate-180
[23:49:04] [PASSED] rotate-270
stty: 'standard input': Inappropriate ioctl for device
[23:49:04] ============== [PASSED] drm_test_rect_rotate ===============
[23:49:04] ================ drm_test_rect_rotate_inv  =================
[23:49:04] [PASSED] reflect-x
[23:49:04] [PASSED] reflect-y
[23:49:04] [PASSED] rotate-0
[23:49:04] [PASSED] rotate-90
[23:49:04] [PASSED] rotate-180
[23:49:04] [PASSED] rotate-270
[23:49:04] ============ [PASSED] drm_test_rect_rotate_inv =============
[23:49:04] ==================== [PASSED] drm_rect =====================
[23:49:04] ============ drm_sysfb_modeset_test (1 subtest) ============
[23:49:04] ============ drm_test_sysfb_build_fourcc_list  =============
[23:49:04] [PASSED] no native formats
[23:49:04] [PASSED] XRGB8888 as native format
[23:49:04] [PASSED] remove duplicates
[23:49:04] [PASSED] convert alpha formats
[23:49:04] [PASSED] random formats
[23:49:04] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[23:49:04] ============= [PASSED] drm_sysfb_modeset_test ==============
[23:49:04] ============================================================
[23:49:04] Testing complete. Ran 616 tests: passed: 616
[23:49:04] Elapsed time: 27.550s total, 1.599s configuring, 25.734s building, 0.193s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[23:49:04] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:49:06] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=25
[23:49:13] Starting KUnit Kernel (1/1)...
[23:49:13] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:49:14] ================= ttm_device (5 subtests) ==================
[23:49:14] [PASSED] ttm_device_init_basic
[23:49:14] [PASSED] ttm_device_init_multiple
[23:49:14] [PASSED] ttm_device_fini_basic
[23:49:14] [PASSED] ttm_device_init_no_vma_man
[23:49:14] ================== ttm_device_init_pools  ==================
[23:49:14] [PASSED] No DMA allocations, no DMA32 required
[23:49:14] [PASSED] DMA allocations, DMA32 required
[23:49:14] [PASSED] No DMA allocations, DMA32 required
[23:49:14] [PASSED] DMA allocations, no DMA32 required
[23:49:14] ============== [PASSED] ttm_device_init_pools ==============
[23:49:14] =================== [PASSED] ttm_device ====================
[23:49:14] ================== ttm_pool (8 subtests) ===================
[23:49:14] ================== ttm_pool_alloc_basic  ===================
[23:49:14] [PASSED] One page
[23:49:14] [PASSED] More than one page
[23:49:14] [PASSED] Above the allocation limit
[23:49:14] [PASSED] One page, with coherent DMA mappings enabled
[23:49:14] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[23:49:14] ============== [PASSED] ttm_pool_alloc_basic ===============
[23:49:14] ============== ttm_pool_alloc_basic_dma_addr  ==============
[23:49:14] [PASSED] One page
[23:49:14] [PASSED] More than one page
[23:49:14] [PASSED] Above the allocation limit
[23:49:14] [PASSED] One page, with coherent DMA mappings enabled
[23:49:14] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[23:49:14] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[23:49:14] [PASSED] ttm_pool_alloc_order_caching_match
[23:49:14] [PASSED] ttm_pool_alloc_caching_mismatch
[23:49:14] [PASSED] ttm_pool_alloc_order_mismatch
[23:49:14] [PASSED] ttm_pool_free_dma_alloc
[23:49:14] [PASSED] ttm_pool_free_no_dma_alloc
[23:49:14] [PASSED] ttm_pool_fini_basic
[23:49:14] ==================== [PASSED] ttm_pool =====================
[23:49:14] ================ ttm_resource (8 subtests) =================
[23:49:14] ================= ttm_resource_init_basic  =================
[23:49:14] [PASSED] Init resource in TTM_PL_SYSTEM
[23:49:14] [PASSED] Init resource in TTM_PL_VRAM
[23:49:14] [PASSED] Init resource in a private placement
[23:49:14] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[23:49:14] ============= [PASSED] ttm_resource_init_basic =============
[23:49:14] [PASSED] ttm_resource_init_pinned
[23:49:14] [PASSED] ttm_resource_fini_basic
[23:49:14] [PASSED] ttm_resource_manager_init_basic
[23:49:14] [PASSED] ttm_resource_manager_usage_basic
[23:49:14] [PASSED] ttm_resource_manager_set_used_basic
[23:49:14] [PASSED] ttm_sys_man_alloc_basic
[23:49:14] [PASSED] ttm_sys_man_free_basic
[23:49:14] ================== [PASSED] ttm_resource ===================
[23:49:14] =================== ttm_tt (15 subtests) ===================
[23:49:14] ==================== ttm_tt_init_basic  ====================
[23:49:14] [PASSED] Page-aligned size
[23:49:14] [PASSED] Extra pages requested
[23:49:14] ================ [PASSED] ttm_tt_init_basic ================
[23:49:14] [PASSED] ttm_tt_init_misaligned
[23:49:14] [PASSED] ttm_tt_fini_basic
[23:49:14] [PASSED] ttm_tt_fini_sg
[23:49:14] [PASSED] ttm_tt_fini_shmem
[23:49:14] [PASSED] ttm_tt_create_basic
[23:49:14] [PASSED] ttm_tt_create_invalid_bo_type
[23:49:14] [PASSED] ttm_tt_create_ttm_exists
[23:49:14] [PASSED] ttm_tt_create_failed
[23:49:14] [PASSED] ttm_tt_destroy_basic
[23:49:14] [PASSED] ttm_tt_populate_null_ttm
[23:49:14] [PASSED] ttm_tt_populate_populated_ttm
[23:49:14] [PASSED] ttm_tt_unpopulate_basic
[23:49:14] [PASSED] ttm_tt_unpopulate_empty_ttm
[23:49:14] [PASSED] ttm_tt_swapin_basic
[23:49:14] ===================== [PASSED] ttm_tt ======================
[23:49:14] =================== ttm_bo (14 subtests) ===================
[23:49:14] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[23:49:14] [PASSED] Cannot be interrupted and sleeps
[23:49:14] [PASSED] Cannot be interrupted, locks straight away
[23:49:14] [PASSED] Can be interrupted, sleeps
[23:49:14] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[23:49:14] [PASSED] ttm_bo_reserve_locked_no_sleep
[23:49:14] [PASSED] ttm_bo_reserve_no_wait_ticket
[23:49:14] [PASSED] ttm_bo_reserve_double_resv
[23:49:14] [PASSED] ttm_bo_reserve_interrupted
[23:49:14] [PASSED] ttm_bo_reserve_deadlock
[23:49:14] [PASSED] ttm_bo_unreserve_basic
[23:49:14] [PASSED] ttm_bo_unreserve_pinned
[23:49:14] [PASSED] ttm_bo_unreserve_bulk
[23:49:14] [PASSED] ttm_bo_put_basic
[23:49:14] [PASSED] ttm_bo_put_shared_resv
[23:49:14] [PASSED] ttm_bo_pin_basic
[23:49:14] [PASSED] ttm_bo_pin_unpin_resource
[23:49:14] [PASSED] ttm_bo_multiple_pin_one_unpin
[23:49:14] ===================== [PASSED] ttm_bo ======================
[23:49:14] ============== ttm_bo_validate (22 subtests) ===============
[23:49:14] ============== ttm_bo_init_reserved_sys_man  ===============
[23:49:14] [PASSED] Buffer object for userspace
[23:49:14] [PASSED] Kernel buffer object
[23:49:14] [PASSED] Shared buffer object
[23:49:14] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[23:49:14] ============== ttm_bo_init_reserved_mock_man  ==============
[23:49:14] [PASSED] Buffer object for userspace
[23:49:14] [PASSED] Kernel buffer object
[23:49:14] [PASSED] Shared buffer object
[23:49:14] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[23:49:14] [PASSED] ttm_bo_init_reserved_resv
[23:49:14] ================== ttm_bo_validate_basic  ==================
[23:49:14] [PASSED] Buffer object for userspace
[23:49:14] [PASSED] Kernel buffer object
[23:49:14] [PASSED] Shared buffer object
[23:49:14] ============== [PASSED] ttm_bo_validate_basic ==============
[23:49:14] [PASSED] ttm_bo_validate_invalid_placement
[23:49:14] ============= ttm_bo_validate_same_placement  ==============
[23:49:14] [PASSED] System manager
[23:49:14] [PASSED] VRAM manager
[23:49:14] ========= [PASSED] ttm_bo_validate_same_placement ==========
[23:49:14] [PASSED] ttm_bo_validate_failed_alloc
[23:49:14] [PASSED] ttm_bo_validate_pinned
[23:49:14] [PASSED] ttm_bo_validate_busy_placement
[23:49:14] ================ ttm_bo_validate_multihop  =================
[23:49:14] [PASSED] Buffer object for userspace
[23:49:14] [PASSED] Kernel buffer object
[23:49:14] [PASSED] Shared buffer object
[23:49:14] ============ [PASSED] ttm_bo_validate_multihop =============
[23:49:14] ========== ttm_bo_validate_no_placement_signaled  ==========
[23:49:14] [PASSED] Buffer object in system domain, no page vector
[23:49:14] [PASSED] Buffer object in system domain with an existing page vector
[23:49:14] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[23:49:14] ======== ttm_bo_validate_no_placement_not_signaled  ========
[23:49:14] [PASSED] Buffer object for userspace
[23:49:14] [PASSED] Kernel buffer object
[23:49:14] [PASSED] Shared buffer object
[23:49:14] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[23:49:14] [PASSED] ttm_bo_validate_move_fence_signaled
[23:49:14] ========= ttm_bo_validate_move_fence_not_signaled  =========
[23:49:14] [PASSED] Waits for GPU
[23:49:14] [PASSED] Tries to lock straight away
[23:49:14] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[23:49:14] [PASSED] ttm_bo_validate_swapout
[23:49:14] [PASSED] ttm_bo_validate_happy_evict
[23:49:14] [PASSED] ttm_bo_validate_all_pinned_evict
[23:49:14] [PASSED] ttm_bo_validate_allowed_only_evict
[23:49:14] [PASSED] ttm_bo_validate_deleted_evict
[23:49:14] [PASSED] ttm_bo_validate_busy_domain_evict
[23:49:14] [PASSED] ttm_bo_validate_evict_gutting
[23:49:14] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[23:49:14] ================= [PASSED] ttm_bo_validate =================
[23:49:14] ============================================================
[23:49:14] Testing complete. Ran 102 tests: passed: 102
[23:49:14] Elapsed time: 10.041s total, 1.587s configuring, 7.736s building, 0.593s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


