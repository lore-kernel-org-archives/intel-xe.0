Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76B7C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 19:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A86410E699;
	Tue,  3 Jun 2025 19:59:27 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0EB10E227;
 Tue,  3 Jun 2025 19:59:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe=3A_Make_force=5Freset_a?=
 =?utf-8?q?ttributes_write-only?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Jun 2025 19:59:26 -0000
Message-ID: <174898076605.45504.14236733300401521098@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603192218.637-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250603192218.637-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Make force_reset attributes write-only
URL   : https://patchwork.freedesktop.org/series/149799/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[19:58:20] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:58:24] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[19:58:51] Starting KUnit Kernel (1/1)...
[19:58:51] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[19:58:51] ================== guc_buf (11 subtests) ===================
[19:58:51] [PASSED] test_smallest
[19:58:51] [PASSED] test_largest
[19:58:51] [PASSED] test_granular
[19:58:51] [PASSED] test_unique
[19:58:51] [PASSED] test_overlap
[19:58:51] [PASSED] test_reusable
[19:58:51] [PASSED] test_too_big
[19:58:51] [PASSED] test_flush
[19:58:51] [PASSED] test_lookup
[19:58:51] [PASSED] test_data
[19:58:51] [PASSED] test_class
[19:58:51] ===================== [PASSED] guc_buf =====================
[19:58:51] =================== guc_dbm (7 subtests) ===================
[19:58:51] [PASSED] test_empty
[19:58:51] [PASSED] test_default
[19:58:51] ======================== test_size  ========================
[19:58:51] [PASSED] 4
[19:58:51] [PASSED] 8
[19:58:51] [PASSED] 32
[19:58:51] [PASSED] 256
[19:58:51] ==================== [PASSED] test_size ====================
[19:58:51] ======================= test_reuse  ========================
[19:58:51] [PASSED] 4
[19:58:51] [PASSED] 8
[19:58:51] [PASSED] 32
[19:58:51] [PASSED] 256
[19:58:51] =================== [PASSED] test_reuse ====================
[19:58:51] =================== test_range_overlap  ====================
[19:58:51] [PASSED] 4
[19:58:51] [PASSED] 8
[19:58:51] [PASSED] 32
[19:58:51] [PASSED] 256
[19:58:51] =============== [PASSED] test_range_overlap ================
[19:58:51] =================== test_range_compact  ====================
[19:58:51] [PASSED] 4
[19:58:51] [PASSED] 8
[19:58:51] [PASSED] 32
[19:58:51] [PASSED] 256
[19:58:51] =============== [PASSED] test_range_compact ================
[19:58:51] ==================== test_range_spare  =====================
[19:58:51] [PASSED] 4
[19:58:51] [PASSED] 8
[19:58:51] [PASSED] 32
[19:58:51] [PASSED] 256
[19:58:51] ================ [PASSED] test_range_spare =================
[19:58:51] ===================== [PASSED] guc_dbm =====================
[19:58:51] =================== guc_idm (6 subtests) ===================
[19:58:51] [PASSED] bad_init
[19:58:51] [PASSED] no_init
[19:58:51] [PASSED] init_fini
[19:58:51] [PASSED] check_used
[19:58:51] [PASSED] check_quota
[19:58:51] [PASSED] check_all
[19:58:51] ===================== [PASSED] guc_idm =====================
[19:58:51] ================== no_relay (3 subtests) ===================
[19:58:51] [PASSED] xe_drops_guc2pf_if_not_ready
[19:58:51] [PASSED] xe_drops_guc2vf_if_not_ready
[19:58:51] [PASSED] xe_rejects_send_if_not_ready
[19:58:51] ==================== [PASSED] no_relay =====================
[19:58:51] ================== pf_relay (14 subtests) ==================
[19:58:51] [PASSED] pf_rejects_guc2pf_too_short
[19:58:51] [PASSED] pf_rejects_guc2pf_too_long
[19:58:51] [PASSED] pf_rejects_guc2pf_no_payload
[19:58:51] [PASSED] pf_fails_no_payload
[19:58:51] [PASSED] pf_fails_bad_origin
[19:58:51] [PASSED] pf_fails_bad_type
[19:58:51] [PASSED] pf_txn_reports_error
[19:58:51] [PASSED] pf_txn_sends_pf2guc
[19:58:51] [PASSED] pf_sends_pf2guc
[19:58:51] [SKIPPED] pf_loopback_nop
[19:58:51] [SKIPPED] pf_loopback_echo
[19:58:51] [SKIPPED] pf_loopback_fail
[19:58:51] [SKIPPED] pf_loopback_busy
[19:58:51] [SKIPPED] pf_loopback_retry
[19:58:51] ==================== [PASSED] pf_relay =====================
[19:58:51] ================== vf_relay (3 subtests) ===================
[19:58:51] [PASSED] vf_rejects_guc2vf_too_short
[19:58:51] [PASSED] vf_rejects_guc2vf_too_long
[19:58:51] [PASSED] vf_rejects_guc2vf_no_payload
[19:58:51] ==================== [PASSED] vf_relay =====================
[19:58:51] ================= pf_service (11 subtests) =================
[19:58:51] [PASSED] pf_negotiate_any
[19:58:51] [PASSED] pf_negotiate_base_match
[19:58:51] [PASSED] pf_negotiate_base_newer
[19:58:51] [PASSED] pf_negotiate_base_next
[19:58:51] [SKIPPED] pf_negotiate_base_older
[19:58:51] [PASSED] pf_negotiate_base_prev
[19:58:51] [PASSED] pf_negotiate_latest_match
[19:58:51] [PASSED] pf_negotiate_latest_newer
[19:58:51] [PASSED] pf_negotiate_latest_next
[19:58:51] [SKIPPED] pf_negotiate_latest_older
[19:58:51] [SKIPPED] pf_negotiate_latest_prev
[19:58:51] =================== [PASSED] pf_service ====================
[19:58:51] ===================== lmtt (1 subtest) =====================
[19:58:51] ======================== test_ops  =========================
[19:58:51] [PASSED] 2-level
[19:58:51] [PASSED] multi-level
[19:58:51] ==================== [PASSED] test_ops =====================
[19:58:51] ====================== [PASSED] lmtt =======================
[19:58:51] =================== xe_mocs (2 subtests) ===================
[19:58:51] ================ xe_live_mocs_kernel_kunit  ================
[19:58:51] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[19:58:51] ================ xe_live_mocs_reset_kunit  =================
[19:58:51] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[19:58:51] ==================== [SKIPPED] xe_mocs =====================
[19:58:51] ================= xe_migrate (2 subtests) ==================
[19:58:51] ================= xe_migrate_sanity_kunit  =================
[19:58:51] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[19:58:51] ================== xe_validate_ccs_kunit  ==================
[19:58:51] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[19:58:51] =================== [SKIPPED] xe_migrate ===================
[19:58:51] ================== xe_dma_buf (1 subtest) ==================
[19:58:51] ==================== xe_dma_buf_kunit  =====================
[19:58:51] ================ [SKIPPED] xe_dma_buf_kunit ================
[19:58:51] =================== [SKIPPED] xe_dma_buf ===================
[19:58:51] ================= xe_bo_shrink (1 subtest) =================
[19:58:51] =================== xe_bo_shrink_kunit  ====================
[19:58:51] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[19:58:51] ================== [SKIPPED] xe_bo_shrink ==================
[19:58:51] ==================== xe_bo (2 subtests) ====================
[19:58:51] ================== xe_ccs_migrate_kunit  ===================
[19:58:51] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[19:58:51] ==================== xe_bo_evict_kunit  ====================
[19:58:51] =============== [SKIPPED] xe_bo_evict_kunit ================
[19:58:51] ===================== [SKIPPED] xe_bo ======================
[19:58:51] ==================== args (11 subtests) ====================
[19:58:51] [PASSED] count_args_test
[19:58:51] [PASSED] call_args_example
[19:58:51] [PASSED] call_args_test
[19:58:51] [PASSED] drop_first_arg_example
[19:58:51] [PASSED] drop_first_arg_test
[19:58:51] [PASSED] first_arg_example
[19:58:51] [PASSED] first_arg_test
[19:58:51] [PASSED] last_arg_example
[19:58:51] [PASSED] last_arg_test
[19:58:51] [PASSED] pick_arg_example
[19:58:51] [PASSED] sep_comma_example
[19:58:51] ====================== [PASSED] args =======================
[19:58:51] =================== xe_pci (2 subtests) ====================
[19:58:51] [PASSED] xe_gmdid_graphics_ip
[19:58:51] [PASSED] xe_gmdid_media_ip
[19:58:51] ===================== [PASSED] xe_pci ======================
[19:58:51] =================== xe_rtp (2 subtests) ====================
[19:58:51] =============== xe_rtp_process_to_sr_tests  ================
[19:58:51] [PASSED] coalesce-same-reg
[19:58:51] [PASSED] no-match-no-add
[19:58:51] [PASSED] match-or
[19:58:51] [PASSED] match-or-xfail
[19:58:51] [PASSED] no-match-no-add-multiple-rules
[19:58:51] [PASSED] two-regs-two-entries
[19:58:51] [PASSED] clr-one-set-other
[19:58:51] [PASSED] set-field
[19:58:51] [PASSED] conflict-duplicate
[19:58:51] [PASSED] conflict-not-disjoint
stty: 'standard input': Inappropriate ioctl for device
[19:58:51] [PASSED] conflict-reg-type
[19:58:51] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[19:58:51] ================== xe_rtp_process_tests  ===================
[19:58:51] [PASSED] active1
[19:58:51] [PASSED] active2
[19:58:51] [PASSED] active-inactive
[19:58:51] [PASSED] inactive-active
[19:58:51] [PASSED] inactive-1st_or_active-inactive
[19:58:51] [PASSED] inactive-2nd_or_active-inactive
[19:58:51] [PASSED] inactive-last_or_active-inactive
[19:58:51] [PASSED] inactive-no_or_active-inactive
[19:58:51] ============== [PASSED] xe_rtp_process_tests ===============
[19:58:51] ===================== [PASSED] xe_rtp ======================
[19:58:51] ==================== xe_wa (1 subtest) =====================
[19:58:51] ======================== xe_wa_gt  =========================
[19:58:51] [PASSED] TIGERLAKE (B0)
[19:58:51] [PASSED] DG1 (A0)
[19:58:51] [PASSED] DG1 (B0)
[19:58:51] [PASSED] ALDERLAKE_S (A0)
[19:58:51] [PASSED] ALDERLAKE_S (B0)
[19:58:51] [PASSED] ALDERLAKE_S (C0)
[19:58:51] [PASSED] ALDERLAKE_S (D0)
[19:58:51] [PASSED] ALDERLAKE_P (A0)
[19:58:51] [PASSED] ALDERLAKE_P (B0)
[19:58:51] [PASSED] ALDERLAKE_P (C0)
[19:58:51] [PASSED] ALDERLAKE_S_RPLS (D0)
[19:58:51] [PASSED] ALDERLAKE_P_RPLU (E0)
[19:58:51] [PASSED] DG2_G10 (C0)
[19:58:51] [PASSED] DG2_G11 (B1)
[19:58:51] [PASSED] DG2_G12 (A1)
[19:58:51] [PASSED] METEORLAKE (g:A0, m:A0)
[19:58:51] [PASSED] METEORLAKE (g:A0, m:A0)
[19:58:51] [PASSED] METEORLAKE (g:A0, m:A0)
[19:58:51] [PASSED] LUNARLAKE (g:A0, m:A0)
[19:58:51] [PASSED] LUNARLAKE (g:B0, m:A0)
[19:58:51] [PASSED] BATTLEMAGE (g:A0, m:A1)
[19:58:51] ==================== [PASSED] xe_wa_gt =====================
[19:58:51] ====================== [PASSED] xe_wa ======================
[19:58:51] ============================================================
[19:58:51] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[19:58:51] Elapsed time: 31.098s total, 4.201s configuring, 26.581s building, 0.302s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[19:58:51] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:58:53] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[19:59:15] Starting KUnit Kernel (1/1)...
[19:59:15] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[19:59:15] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[19:59:15] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[19:59:15] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[19:59:15] =========== drm_validate_clone_mode (2 subtests) ===========
[19:59:15] ============== drm_test_check_in_clone_mode  ===============
[19:59:15] [PASSED] in_clone_mode
[19:59:15] [PASSED] not_in_clone_mode
[19:59:15] ========== [PASSED] drm_test_check_in_clone_mode ===========
[19:59:15] =============== drm_test_check_valid_clones  ===============
[19:59:15] [PASSED] not_in_clone_mode
[19:59:15] [PASSED] valid_clone
[19:59:15] [PASSED] invalid_clone
[19:59:15] =========== [PASSED] drm_test_check_valid_clones ===========
[19:59:15] ============= [PASSED] drm_validate_clone_mode =============
[19:59:15] ============= drm_validate_modeset (1 subtest) =============
[19:59:15] [PASSED] drm_test_check_connector_changed_modeset
[19:59:15] ============== [PASSED] drm_validate_modeset ===============
[19:59:15] ====== drm_test_bridge_get_current_state (2 subtests) ======
[19:59:15] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[19:59:15] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[19:59:15] ======== [PASSED] drm_test_bridge_get_current_state ========
[19:59:15] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[19:59:15] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[19:59:15] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[19:59:15] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[19:59:15] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[19:59:15] ================== drm_buddy (7 subtests) ==================
[19:59:15] [PASSED] drm_test_buddy_alloc_limit
[19:59:15] [PASSED] drm_test_buddy_alloc_optimistic
[19:59:15] [PASSED] drm_test_buddy_alloc_pessimistic
[19:59:15] [PASSED] drm_test_buddy_alloc_pathological
[19:59:15] [PASSED] drm_test_buddy_alloc_contiguous
[19:59:15] [PASSED] drm_test_buddy_alloc_clear
[19:59:15] [PASSED] drm_test_buddy_alloc_range_bias
[19:59:15] ==================== [PASSED] drm_buddy ====================
[19:59:15] ============= drm_cmdline_parser (40 subtests) =============
[19:59:15] [PASSED] drm_test_cmdline_force_d_only
[19:59:15] [PASSED] drm_test_cmdline_force_D_only_dvi
[19:59:15] [PASSED] drm_test_cmdline_force_D_only_hdmi
[19:59:15] [PASSED] drm_test_cmdline_force_D_only_not_digital
[19:59:15] [PASSED] drm_test_cmdline_force_e_only
[19:59:15] [PASSED] drm_test_cmdline_res
[19:59:15] [PASSED] drm_test_cmdline_res_vesa
[19:59:15] [PASSED] drm_test_cmdline_res_vesa_rblank
[19:59:15] [PASSED] drm_test_cmdline_res_rblank
[19:59:15] [PASSED] drm_test_cmdline_res_bpp
[19:59:15] [PASSED] drm_test_cmdline_res_refresh
[19:59:15] [PASSED] drm_test_cmdline_res_bpp_refresh
[19:59:15] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[19:59:15] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[19:59:15] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[19:59:15] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[19:59:15] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[19:59:15] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[19:59:15] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[19:59:15] [PASSED] drm_test_cmdline_res_margins_force_on
[19:59:15] [PASSED] drm_test_cmdline_res_vesa_margins
[19:59:15] [PASSED] drm_test_cmdline_name
[19:59:15] [PASSED] drm_test_cmdline_name_bpp
[19:59:15] [PASSED] drm_test_cmdline_name_option
[19:59:15] [PASSED] drm_test_cmdline_name_bpp_option
[19:59:15] [PASSED] drm_test_cmdline_rotate_0
[19:59:15] [PASSED] drm_test_cmdline_rotate_90
[19:59:15] [PASSED] drm_test_cmdline_rotate_180
[19:59:15] [PASSED] drm_test_cmdline_rotate_270
[19:59:15] [PASSED] drm_test_cmdline_hmirror
[19:59:15] [PASSED] drm_test_cmdline_vmirror
[19:59:15] [PASSED] drm_test_cmdline_margin_options
[19:59:15] [PASSED] drm_test_cmdline_multiple_options
[19:59:15] [PASSED] drm_test_cmdline_bpp_extra_and_option
[19:59:15] [PASSED] drm_test_cmdline_extra_and_option
[19:59:15] [PASSED] drm_test_cmdline_freestanding_options
[19:59:15] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[19:59:15] [PASSED] drm_test_cmdline_panel_orientation
[19:59:15] ================ drm_test_cmdline_invalid  =================
[19:59:15] [PASSED] margin_only
[19:59:15] [PASSED] interlace_only
[19:59:15] [PASSED] res_missing_x
[19:59:15] [PASSED] res_missing_y
[19:59:15] [PASSED] res_bad_y
[19:59:15] [PASSED] res_missing_y_bpp
[19:59:15] [PASSED] res_bad_bpp
[19:59:15] [PASSED] res_bad_refresh
[19:59:15] [PASSED] res_bpp_refresh_force_on_off
[19:59:15] [PASSED] res_invalid_mode
[19:59:15] [PASSED] res_bpp_wrong_place_mode
[19:59:15] [PASSED] name_bpp_refresh
[19:59:15] [PASSED] name_refresh
[19:59:15] [PASSED] name_refresh_wrong_mode
[19:59:15] [PASSED] name_refresh_invalid_mode
[19:59:15] [PASSED] rotate_multiple
[19:59:15] [PASSED] rotate_invalid_val
[19:59:15] [PASSED] rotate_truncated
[19:59:15] [PASSED] invalid_option
[19:59:15] [PASSED] invalid_tv_option
[19:59:15] [PASSED] truncated_tv_option
[19:59:15] ============ [PASSED] drm_test_cmdline_invalid =============
[19:59:15] =============== drm_test_cmdline_tv_options  ===============
[19:59:15] [PASSED] NTSC
[19:59:15] [PASSED] NTSC_443
[19:59:15] [PASSED] NTSC_J
[19:59:15] [PASSED] PAL
[19:59:15] [PASSED] PAL_M
[19:59:15] [PASSED] PAL_N
[19:59:15] [PASSED] SECAM
[19:59:15] [PASSED] MONO_525
[19:59:15] [PASSED] MONO_625
[19:59:15] =========== [PASSED] drm_test_cmdline_tv_options ===========
[19:59:15] =============== [PASSED] drm_cmdline_parser ================
[19:59:15] ========== drmm_connector_hdmi_init (20 subtests) ==========
[19:59:15] [PASSED] drm_test_connector_hdmi_init_valid
[19:59:15] [PASSED] drm_test_connector_hdmi_init_bpc_8
[19:59:15] [PASSED] drm_test_connector_hdmi_init_bpc_10
[19:59:15] [PASSED] drm_test_connector_hdmi_init_bpc_12
[19:59:15] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[19:59:15] [PASSED] drm_test_connector_hdmi_init_bpc_null
[19:59:15] [PASSED] drm_test_connector_hdmi_init_formats_empty
[19:59:15] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[19:59:15] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[19:59:15] [PASSED] supported_formats=0x9 yuv420_allowed=1
[19:59:15] [PASSED] supported_formats=0x9 yuv420_allowed=0
[19:59:15] [PASSED] supported_formats=0x3 yuv420_allowed=1
[19:59:15] [PASSED] supported_formats=0x3 yuv420_allowed=0
[19:59:15] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[19:59:15] [PASSED] drm_test_connector_hdmi_init_null_ddc
[19:59:15] [PASSED] drm_test_connector_hdmi_init_null_product
[19:59:15] [PASSED] drm_test_connector_hdmi_init_null_vendor
[19:59:15] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[19:59:15] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[19:59:15] [PASSED] drm_test_connector_hdmi_init_product_valid
[19:59:15] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[19:59:15] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[19:59:15] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[19:59:15] ========= drm_test_connector_hdmi_init_type_valid  =========
[19:59:15] [PASSED] HDMI-A
[19:59:15] [PASSED] HDMI-B
[19:59:15] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[19:59:15] ======== drm_test_connector_hdmi_init_type_invalid  ========
[19:59:15] [PASSED] Unknown
[19:59:15] [PASSED] VGA
[19:59:15] [PASSED] DVI-I
[19:59:15] [PASSED] DVI-D
[19:59:15] [PASSED] DVI-A
[19:59:15] [PASSED] Composite
[19:59:15] [PASSED] SVIDEO
[19:59:15] [PASSED] LVDS
[19:59:15] [PASSED] Component
[19:59:15] [PASSED] DIN
[19:59:15] [PASSED] DP
[19:59:15] [PASSED] TV
[19:59:15] [PASSED] eDP
[19:59:15] [PASSED] Virtual
[19:59:15] [PASSED] DSI
[19:59:15] [PASSED] DPI
[19:59:15] [PASSED] Writeback
[19:59:15] [PASSED] SPI
[19:59:15] [PASSED] USB
[19:59:15] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[19:59:15] ============ [PASSED] drmm_connector_hdmi_init =============
[19:59:15] ============= drmm_connector_init (3 subtests) =============
[19:59:15] [PASSED] drm_test_drmm_connector_init
[19:59:15] [PASSED] drm_test_drmm_connector_init_null_ddc
[19:59:15] ========= drm_test_drmm_connector_init_type_valid  =========
[19:59:15] [PASSED] Unknown
[19:59:15] [PASSED] VGA
[19:59:15] [PASSED] DVI-I
[19:59:15] [PASSED] DVI-D
[19:59:15] [PASSED] DVI-A
[19:59:15] [PASSED] Composite
[19:59:15] [PASSED] SVIDEO
[19:59:15] [PASSED] LVDS
[19:59:15] [PASSED] Component
[19:59:15] [PASSED] DIN
[19:59:15] [PASSED] DP
[19:59:15] [PASSED] HDMI-A
[19:59:15] [PASSED] HDMI-B
[19:59:15] [PASSED] TV
[19:59:15] [PASSED] eDP
[19:59:15] [PASSED] Virtual
[19:59:15] [PASSED] DSI
[19:59:15] [PASSED] DPI
[19:59:15] [PASSED] Writeback
[19:59:15] [PASSED] SPI
[19:59:15] [PASSED] USB
[19:59:15] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[19:59:15] =============== [PASSED] drmm_connector_init ===============
[19:59:15] ========= drm_connector_dynamic_init (6 subtests) ==========
[19:59:15] [PASSED] drm_test_drm_connector_dynamic_init
[19:59:15] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[19:59:15] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[19:59:15] [PASSED] drm_test_drm_connector_dynamic_init_properties
[19:59:15] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[19:59:15] [PASSED] Unknown
[19:59:15] [PASSED] VGA
[19:59:15] [PASSED] DVI-I
[19:59:15] [PASSED] DVI-D
[19:59:15] [PASSED] DVI-A
[19:59:15] [PASSED] Composite
[19:59:15] [PASSED] SVIDEO
[19:59:15] [PASSED] LVDS
[19:59:15] [PASSED] Component
[19:59:15] [PASSED] DIN
[19:59:15] [PASSED] DP
[19:59:15] [PASSED] HDMI-A
[19:59:15] [PASSED] HDMI-B
[19:59:15] [PASSED] TV
[19:59:15] [PASSED] eDP
[19:59:15] [PASSED] Virtual
[19:59:15] [PASSED] DSI
[19:59:15] [PASSED] DPI
[19:59:15] [PASSED] Writeback
[19:59:15] [PASSED] SPI
[19:59:15] [PASSED] USB
[19:59:15] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[19:59:15] ======== drm_test_drm_connector_dynamic_init_name  =========
[19:59:15] [PASSED] Unknown
[19:59:15] [PASSED] VGA
[19:59:15] [PASSED] DVI-I
[19:59:15] [PASSED] DVI-D
[19:59:15] [PASSED] DVI-A
[19:59:15] [PASSED] Composite
[19:59:15] [PASSED] SVIDEO
[19:59:15] [PASSED] LVDS
[19:59:15] [PASSED] Component
[19:59:15] [PASSED] DIN
[19:59:15] [PASSED] DP
[19:59:15] [PASSED] HDMI-A
[19:59:15] [PASSED] HDMI-B
[19:59:15] [PASSED] TV
[19:59:15] [PASSED] eDP
[19:59:15] [PASSED] Virtual
[19:59:15] [PASSED] DSI
[19:59:15] [PASSED] DPI
[19:59:15] [PASSED] Writeback
[19:59:15] [PASSED] SPI
[19:59:15] [PASSED] USB
[19:59:15] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[19:59:15] =========== [PASSED] drm_connector_dynamic_init ============
[19:59:15] ==== drm_connector_dynamic_register_early (4 subtests) =====
[19:59:15] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[19:59:15] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[19:59:15] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[19:59:15] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[19:59:15] ====== [PASSED] drm_connector_dynamic_register_early =======
[19:59:15] ======= drm_connector_dynamic_register (7 subtests) ========
[19:59:15] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[19:59:15] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[19:59:15] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[19:59:15] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[19:59:15] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[19:59:15] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[19:59:15] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[19:59:15] ========= [PASSED] drm_connector_dynamic_register ==========
[19:59:15] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[19:59:15] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[19:59:15] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[19:59:15] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[19:59:15] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[19:59:15] ========== drm_test_get_tv_mode_from_name_valid  ===========
[19:59:15] [PASSED] NTSC
[19:59:15] [PASSED] NTSC-443
[19:59:15] [PASSED] NTSC-J
[19:59:15] [PASSED] PAL
[19:59:15] [PASSED] PAL-M
[19:59:15] [PASSED] PAL-N
[19:59:15] [PASSED] SECAM
[19:59:15] [PASSED] Mono
[19:59:15] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[19:59:15] [PASSED] drm_test_get_tv_mode_from_name_truncated
[19:59:15] ============ [PASSED] drm_get_tv_mode_from_name ============
[19:59:15] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[19:59:15] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[19:59:15] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[19:59:15] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[19:59:15] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[19:59:15] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[19:59:15] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[19:59:15] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[19:59:15] [PASSED] VIC 96
[19:59:15] [PASSED] VIC 97
[19:59:15] [PASSED] VIC 101
[19:59:15] [PASSED] VIC 102
[19:59:15] [PASSED] VIC 106
[19:59:15] [PASSED] VIC 107
[19:59:15] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[19:59:15] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[19:59:15] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[19:59:15] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[19:59:15] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[19:59:15] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[19:59:15] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[19:59:15] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[19:59:15] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[19:59:15] [PASSED] Automatic
[19:59:15] [PASSED] Full
[19:59:15] [PASSED] Limited 16:235
[19:59:15] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[19:59:15] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[19:59:15] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[19:59:15] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[19:59:15] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[19:59:15] [PASSED] RGB
[19:59:15] [PASSED] YUV 4:2:0
[19:59:15] [PASSED] YUV 4:2:2
[19:59:15] [PASSED] YUV 4:4:4
[19:59:15] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[19:59:15] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[19:59:15] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[19:59:15] ============= drm_damage_helper (21 subtests) ==============
[19:59:15] [PASSED] drm_test_damage_iter_no_damage
[19:59:15] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[19:59:15] [PASSED] drm_test_damage_iter_no_damage_src_moved
[19:59:15] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[19:59:15] [PASSED] drm_test_damage_iter_no_damage_not_visible
[19:59:15] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[19:59:15] [PASSED] drm_test_damage_iter_no_damage_no_fb
[19:59:15] [PASSED] drm_test_damage_iter_simple_damage
[19:59:15] [PASSED] drm_test_damage_iter_single_damage
[19:59:15] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[19:59:15] [PASSED] drm_test_damage_iter_single_damage_outside_src
[19:59:15] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[19:59:15] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[19:59:15] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[19:59:15] [PASSED] drm_test_damage_iter_single_damage_src_moved
[19:59:15] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[19:59:15] [PASSED] drm_test_damage_iter_damage
[19:59:15] [PASSED] drm_test_damage_iter_damage_one_intersect
[19:59:15] [PASSED] drm_test_damage_iter_damage_one_outside
[19:59:15] [PASSED] drm_test_damage_iter_damage_src_moved
[19:59:15] [PASSED] drm_test_damage_iter_damage_not_visible
[19:59:15] ================ [PASSED] drm_damage_helper ================
[19:59:15] ============== drm_dp_mst_helper (3 subtests) ==============
[19:59:15] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[19:59:15] [PASSED] Clock 154000 BPP 30 DSC disabled
[19:59:15] [PASSED] Clock 234000 BPP 30 DSC disabled
[19:59:15] [PASSED] Clock 297000 BPP 24 DSC disabled
[19:59:15] [PASSED] Clock 332880 BPP 24 DSC enabled
[19:59:15] [PASSED] Clock 324540 BPP 24 DSC enabled
[19:59:15] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[19:59:15] ============== drm_test_dp_mst_calc_pbn_div  ===============
[19:59:15] [PASSED] Link rate 2000000 lane count 4
[19:59:15] [PASSED] Link rate 2000000 lane count 2
[19:59:15] [PASSED] Link rate 2000000 lane count 1
[19:59:15] [PASSED] Link rate 1350000 lane count 4
[19:59:15] [PASSED] Link rate 1350000 lane count 2
[19:59:15] [PASSED] Link rate 1350000 lane count 1
[19:59:15] [PASSED] Link rate 1000000 lane count 4
[19:59:15] [PASSED] Link rate 1000000 lane count 2
[19:59:15] [PASSED] Link rate 1000000 lane count 1
[19:59:15] [PASSED] Link rate 810000 lane count 4
[19:59:15] [PASSED] Link rate 810000 lane count 2
[19:59:15] [PASSED] Link rate 810000 lane count 1
[19:59:15] [PASSED] Link rate 540000 lane count 4
[19:59:15] [PASSED] Link rate 540000 lane count 2
[19:59:15] [PASSED] Link rate 540000 lane count 1
[19:59:15] [PASSED] Link rate 270000 lane count 4
[19:59:15] [PASSED] Link rate 270000 lane count 2
[19:59:15] [PASSED] Link rate 270000 lane count 1
[19:59:15] [PASSED] Link rate 162000 lane count 4
[19:59:15] [PASSED] Link rate 162000 lane count 2
[19:59:15] [PASSED] Link rate 162000 lane count 1
[19:59:15] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[19:59:15] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[19:59:15] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[19:59:15] [PASSED] DP_POWER_UP_PHY with port number
[19:59:15] [PASSED] DP_POWER_DOWN_PHY with port number
[19:59:15] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[19:59:15] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[19:59:15] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[19:59:15] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[19:59:15] [PASSED] DP_QUERY_PAYLOAD with port number
[19:59:15] [PASSED] DP_QUERY_PAYLOAD with VCPI
[19:59:15] [PASSED] DP_REMOTE_DPCD_READ with port number
[19:59:15] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[19:59:15] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[19:59:15] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[19:59:15] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[19:59:15] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[19:59:15] [PASSED] DP_REMOTE_I2C_READ with port number
[19:59:15] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[19:59:15] [PASSED] DP_REMOTE_I2C_READ with transactions array
[19:59:15] [PASSED] DP_REMOTE_I2C_WRITE with port number
[19:59:15] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[19:59:15] [PASSED] DP_REMOTE_I2C_WRITE with data array
[19:59:15] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[19:59:15] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[19:59:15] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[19:59:15] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[19:59:15] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[19:59:15] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[19:59:15] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[19:59:15] ================ [PASSED] drm_dp_mst_helper ================
[19:59:15] ================== drm_exec (7 subtests) ===================
[19:59:15] [PASSED] sanitycheck
[19:59:15] [PASSED] test_lock
[19:59:15] [PASSED] test_lock_unlock
[19:59:15] [PASSED] test_duplicates
[19:59:15] [PASSED] test_prepare
[19:59:15] [PASSED] test_prepare_array
[19:59:15] [PASSED] test_multiple_loops
[19:59:15] ==================== [PASSED] drm_exec =====================
[19:59:15] =========== drm_format_helper_test (18 subtests) ===========
[19:59:15] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[19:59:15] [PASSED] single_pixel_source_buffer
[19:59:15] [PASSED] single_pixel_clip_rectangle
[19:59:15] [PASSED] well_known_colors
[19:59:15] [PASSED] destination_pitch
[19:59:15] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[19:59:15] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[19:59:15] [PASSED] single_pixel_source_buffer
[19:59:15] [PASSED] single_pixel_clip_rectangle
[19:59:15] [PASSED] well_known_colors
[19:59:15] [PASSED] destination_pitch
[19:59:15] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[19:59:15] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[19:59:15] [PASSED] single_pixel_source_buffer
[19:59:15] [PASSED] single_pixel_clip_rectangle
[19:59:15] [PASSED] well_known_colors
[19:59:15] [PASSED] destination_pitch
[19:59:15] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[19:59:15] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[19:59:15] [PASSED] single_pixel_source_buffer
[19:59:15] [PASSED] single_pixel_clip_rectangle
[19:59:15] [PASSED] well_known_colors
[19:59:15] [PASSED] destination_pitch
[19:59:15] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[19:59:15] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[19:59:15] [PASSED] single_pixel_source_buffer
[19:59:15] [PASSED] single_pixel_clip_rectangle
[19:59:15] [PASSED] well_known_colors
[19:59:15] [PASSED] destination_pitch
[19:59:15] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[19:59:15] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[19:59:15] [PASSED] single_pixel_source_buffer
[19:59:15] [PASSED] single_pixel_clip_rectangle
[19:59:15] [PASSED] well_known_colors
[19:59:15] [PASSED] destination_pitch
[19:59:15] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[19:59:15] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[19:59:15] [PASSED] single_pixel_source_buffer
[19:59:15] [PASSED] single_pixel_clip_rectangle
[19:59:15] [PASSED] well_known_colors
[19:59:15] [PASSED] destination_pitch
[19:59:15] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[19:59:15] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[19:59:15] [PASSED] single_pixel_source_buffer
[19:59:15] [PASSED] single_pixel_clip_rectangle
[19:59:15] [PASSED] well_known_colors
[19:59:15] [PASSED] destination_pitch
[19:59:15] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[19:59:15] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[19:59:15] [PASSED] single_pixel_source_buffer
[19:59:15] [PASSED] single_pixel_clip_rectangle
[19:59:15] [PASSED] well_known_colors
[19:59:15] [PASSED] destination_pitch
[19:59:15] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[19:59:15] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[19:59:15] [PASSED] single_pixel_source_buffer
[19:59:15] [PASSED] single_pixel_clip_rectangle
[19:59:15] [PASSED] well_known_colors
[19:59:15] [PASSED] destination_pitch
[19:59:15] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[19:59:15] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[19:59:15] [PASSED] single_pixel_source_buffer
[19:59:15] [PASSED] single_pixel_clip_rectangle
[19:59:15] [PASSED] well_known_colors
[19:59:15] [PASSED] destination_pitch
[19:59:15] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[19:59:15] ============== drm_test_fb_xrgb8888_to_mono  ===============
[19:59:15] [PASSED] single_pixel_source_buffer
[19:59:15] [PASSED] single_pixel_clip_rectangle
[19:59:15] [PASSED] well_known_colors
[19:59:15] [PASSED] destination_pitch
[19:59:15] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[19:59:15] ==================== drm_test_fb_swab  =====================
[19:59:15] [PASSED] single_pixel_source_buffer
[19:59:15] [PASSED] single_pixel_clip_rectangle
[19:59:15] [PASSED] well_known_colors
[19:59:15] [PASSED] destination_pitch
[19:59:15] ================ [PASSED] drm_test_fb_swab =================
[19:59:15] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[19:59:15] [PASSED] single_pixel_source_buffer
[19:59:15] [PASSED] single_pixel_clip_rectangle
[19:59:15] [PASSED] well_known_colors
[19:59:15] [PASSED] destination_pitch
[19:59:15] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[19:59:15] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[19:59:15] [PASSED] single_pixel_source_buffer
[19:59:15] [PASSED] single_pixel_clip_rectangle
[19:59:15] [PASSED] well_known_colors
[19:59:15] [PASSED] destination_pitch
[19:59:15] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[19:59:15] ================= drm_test_fb_clip_offset  =================
[19:59:15] [PASSED] pass through
[19:59:15] [PASSED] horizontal offset
[19:59:15] [PASSED] vertical offset
[19:59:15] [PASSED] horizontal and vertical offset
[19:59:15] [PASSED] horizontal offset (custom pitch)
[19:59:15] [PASSED] vertical offset (custom pitch)
[19:59:15] [PASSED] horizontal and vertical offset (custom pitch)
[19:59:15] ============= [PASSED] drm_test_fb_clip_offset =============
[19:59:15] ============== drm_test_fb_build_fourcc_list  ==============
[19:59:15] [PASSED] no native formats
[19:59:15] [PASSED] XRGB8888 as native format
[19:59:15] [PASSED] remove duplicates
[19:59:15] [PASSED] convert alpha formats
[19:59:15] [PASSED] random formats
[19:59:15] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[19:59:15] =================== drm_test_fb_memcpy  ====================
[19:59:15] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[19:59:15] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[19:59:15] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[19:59:15] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[19:59:15] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[19:59:15] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[19:59:15] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[19:59:15] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[19:59:15] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[19:59:15] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[19:59:15] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[19:59:15] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[19:59:15] =============== [PASSED] drm_test_fb_memcpy ================
[19:59:15] ============= [PASSED] drm_format_helper_test ==============
[19:59:15] ================= drm_format (18 subtests) =================
[19:59:15] [PASSED] drm_test_format_block_width_invalid
[19:59:15] [PASSED] drm_test_format_block_width_one_plane
[19:59:15] [PASSED] drm_test_format_block_width_two_plane
[19:59:15] [PASSED] drm_test_format_block_width_three_plane
[19:59:15] [PASSED] drm_test_format_block_width_tiled
[19:59:15] [PASSED] drm_test_format_block_height_invalid
[19:59:15] [PASSED] drm_test_format_block_height_one_plane
[19:59:15] [PASSED] drm_test_format_block_height_two_plane
[19:59:15] [PASSED] drm_test_format_block_height_three_plane
[19:59:15] [PASSED] drm_test_format_block_height_tiled
[19:59:15] [PASSED] drm_test_format_min_pitch_invalid
[19:59:15] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[19:59:15] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[19:59:15] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[19:59:15] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[19:59:15] [PASSED] drm_test_format_min_pitch_two_plane
[19:59:15] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[19:59:15] [PASSED] drm_test_format_min_pitch_tiled
[19:59:15] =================== [PASSED] drm_format ====================
[19:59:15] ============== drm_framebuffer (10 subtests) ===============
[19:59:15] ========== drm_test_framebuffer_check_src_coords  ==========
[19:59:15] [PASSED] Success: source fits into fb
[19:59:15] [PASSED] Fail: overflowing fb with x-axis coordinate
[19:59:15] [PASSED] Fail: overflowing fb with y-axis coordinate
[19:59:15] [PASSED] Fail: overflowing fb with source width
[19:59:15] [PASSED] Fail: overflowing fb with source height
[19:59:15] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[19:59:15] [PASSED] drm_test_framebuffer_cleanup
[19:59:15] =============== drm_test_framebuffer_create  ===============
[19:59:15] [PASSED] ABGR8888 normal sizes
[19:59:15] [PASSED] ABGR8888 max sizes
[19:59:15] [PASSED] ABGR8888 pitch greater than min required
[19:59:15] [PASSED] ABGR8888 pitch less than min required
[19:59:15] [PASSED] ABGR8888 Invalid width
[19:59:15] [PASSED] ABGR8888 Invalid buffer handle
[19:59:15] [PASSED] No pixel format
[19:59:15] [PASSED] ABGR8888 Width 0
[19:59:15] [PASSED] ABGR8888 Height 0
[19:59:15] [PASSED] ABGR8888 Out of bound height * pitch combination
[19:59:15] [PASSED] ABGR8888 Large buffer offset
[19:59:15] [PASSED] ABGR8888 Buffer offset for inexistent plane
[19:59:15] [PASSED] ABGR8888 Invalid flag
[19:59:15] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[19:59:15] [PASSED] ABGR8888 Valid buffer modifier
[19:59:15] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[19:59:15] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[19:59:15] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[19:59:15] [PASSED] NV12 Normal sizes
[19:59:15] [PASSED] NV12 Max sizes
[19:59:15] [PASSED] NV12 Invalid pitch
[19:59:15] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[19:59:15] [PASSED] NV12 different  modifier per-plane
[19:59:15] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[19:59:15] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[19:59:15] [PASSED] NV12 Modifier for inexistent plane
[19:59:15] [PASSED] NV12 Handle for inexistent plane
[19:59:15] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[19:59:15] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[19:59:15] [PASSED] YVU420 Normal sizes
[19:59:15] [PASSED] YVU420 Max sizes
[19:59:15] [PASSED] YVU420 Invalid pitch
[19:59:15] [PASSED] YVU420 Different pitches
[19:59:15] [PASSED] YVU420 Different buffer offsets/pitches
[19:59:15] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[19:59:15] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[19:59:15] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[19:59:15] [PASSED] YVU420 Valid modifier
[19:59:15] [PASSED] YVU420 Different modifiers per plane
[19:59:15] [PASSED] YVU420 Modifier for inexistent plane
[19:59:15] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[19:59:15] [PASSED] X0L2 Normal sizes
[19:59:15] [PASSED] X0L2 Max sizes
[19:59:15] [PASSED] X0L2 Invalid pitch
[19:59:15] [PASSED] X0L2 Pitch greater than minimum required
[19:59:15] [PASSED] X0L2 Handle for inexistent plane
[19:59:15] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[19:59:15] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[19:59:15] [PASSED] X0L2 Valid modifier
[19:59:15] [PASSED] X0L2 Modifier for inexistent plane
[19:59:15] =========== [PASSED] drm_test_framebuffer_create ===========
[19:59:15] [PASSED] drm_test_framebuffer_free
[19:59:15] [PASSED] drm_test_framebuffer_init
[19:59:15] [PASSED] drm_test_framebuffer_init_bad_format
[19:59:15] [PASSED] drm_test_framebuffer_init_dev_mismatch
[19:59:15] [PASSED] drm_test_framebuffer_lookup
[19:59:15] [PASSED] drm_test_framebuffer_lookup_inexistent
[19:59:15] [PASSED] drm_test_framebuffer_modifiers_not_supported
[19:59:15] ================= [PASSED] drm_framebuffer =================
[19:59:15] ================ drm_gem_shmem (8 subtests) ================
[19:59:15] [PASSED] drm_gem_shmem_test_obj_create
[19:59:15] [PASSED] drm_gem_shmem_test_obj_create_private
[19:59:15] [PASSED] drm_gem_shmem_test_pin_pages
[19:59:15] [PASSED] drm_gem_shmem_test_vmap
[19:59:15] [PASSED] drm_gem_shmem_test_get_pages_sgt
[19:59:15] [PASSED] drm_gem_shmem_test_get_sg_table
[19:59:15] [PASSED] drm_gem_shmem_test_madvise
[19:59:15] [PASSED] drm_gem_shmem_test_purge
[19:59:15] ================== [PASSED] drm_gem_shmem ==================
[19:59:15] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[19:59:15] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[19:59:15] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[19:59:15] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[19:59:15] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[19:59:15] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[19:59:15] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[19:59:15] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[19:59:15] [PASSED] Automatic
[19:59:15] [PASSED] Full
[19:59:15] [PASSED] Limited 16:235
[19:59:15] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[19:59:15] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[19:59:15] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[19:59:15] [PASSED] drm_test_check_disable_connector
[19:59:15] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[19:59:15] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[19:59:15] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[19:59:15] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[19:59:15] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[19:59:15] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[19:59:15] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[19:59:15] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[19:59:15] [PASSED] drm_test_check_output_bpc_dvi
[19:59:15] [PASSED] drm_test_check_output_bpc_format_vic_1
[19:59:15] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[19:59:15] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[19:59:15] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[19:59:15] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[19:59:15] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[19:59:15] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[19:59:15] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[19:59:15] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[19:59:15] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[19:59:15] [PASSED] drm_test_check_broadcast_rgb_value
[19:59:15] [PASSED] drm_test_check_bpc_8_value
[19:59:15] [PASSED] drm_test_check_bpc_10_value
[19:59:15] [PASSED] drm_test_check_bpc_12_value
[19:59:15] [PASSED] drm_test_check_format_value
[19:59:15] [PASSED] drm_test_check_tmds_char_value
[19:59:15] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[19:59:15] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[19:59:15] [PASSED] drm_test_check_mode_valid
[19:59:15] [PASSED] drm_test_check_mode_valid_reject
[19:59:15] [PASSED] drm_test_check_mode_valid_reject_rate
[19:59:15] [PASSED] drm_test_check_mode_valid_reject_max_clock
[19:59:15] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[19:59:15] ================= drm_managed (2 subtests) =================
[19:59:15] [PASSED] drm_test_managed_release_action
[19:59:15] [PASSED] drm_test_managed_run_action
[19:59:15] =================== [PASSED] drm_managed ===================
[19:59:15] =================== drm_mm (6 subtests) ====================
[19:59:15] [PASSED] drm_test_mm_init
[19:59:15] [PASSED] drm_test_mm_debug
[19:59:15] [PASSED] drm_test_mm_align32
[19:59:15] [PASSED] drm_test_mm_align64
[19:59:15] [PASSED] drm_test_mm_lowest
[19:59:15] [PASSED] drm_test_mm_highest
[19:59:15] ===================== [PASSED] drm_mm ======================
[19:59:15] ============= drm_modes_analog_tv (5 subtests) =============
[19:59:15] [PASSED] drm_test_modes_analog_tv_mono_576i
[19:59:15] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[19:59:15] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[19:59:15] [PASSED] drm_test_modes_analog_tv_pal_576i
[19:59:15] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[19:59:15] =============== [PASSED] drm_modes_analog_tv ===============
[19:59:15] ============== drm_plane_helper (2 subtests) ===============
[19:59:15] =============== drm_test_check_plane_state  ================
[19:59:15] [PASSED] clipping_simple
[19:59:15] [PASSED] clipping_rotate_reflect
[19:59:15] [PASSED] positioning_simple
[19:59:15] [PASSED] upscaling
[19:59:15] [PASSED] downscaling
[19:59:15] [PASSED] rounding1
[19:59:15] [PASSED] rounding2
[19:59:15] [PASSED] rounding3
[19:59:15] [PASSED] rounding4
[19:59:15] =========== [PASSED] drm_test_check_plane_state ============
[19:59:15] =========== drm_test_check_invalid_plane_state  ============
[19:59:15] [PASSED] positioning_invalid
[19:59:15] [PASSED] upscaling_invalid
[19:59:15] [PASSED] downscaling_invalid
[19:59:15] ======= [PASSED] drm_test_check_invalid_plane_state ========
[19:59:15] ================ [PASSED] drm_plane_helper =================
[19:59:15] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[19:59:15] ====== drm_test_connector_helper_tv_get_modes_check  =======
[19:59:15] [PASSED] None
[19:59:15] [PASSED] PAL
[19:59:15] [PASSED] NTSC
[19:59:15] [PASSED] Both, NTSC Default
[19:59:15] [PASSED] Both, PAL Default
[19:59:15] [PASSED] Both, NTSC Default, with PAL on command-line
[19:59:15] [PASSED] Both, PAL Default, with NTSC on command-line
[19:59:15] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[19:59:15] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[19:59:15] ================== drm_rect (9 subtests) ===================
[19:59:15] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[19:59:15] [PASSED] drm_test_rect_clip_scaled_not_clipped
[19:59:15] [PASSED] drm_test_rect_clip_scaled_clipped
[19:59:15] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[19:59:15] ================= drm_test_rect_intersect  =================
[19:59:15] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[19:59:15] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[19:59:15] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[19:59:15] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[19:59:15] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[19:59:15] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[19:59:15] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[19:59:15] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[19:59:15] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[19:59:15] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[19:59:15] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[19:59:15] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[19:59:15] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[19:59:15] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[19:59:15] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[19:59:15] ============= [PASSED] drm_test_rect_intersect =============
[19:59:15] ================ drm_test_rect_calc_hscale  ================
[19:59:15] [PASSED] normal use
[19:59:15] [PASSED] out of max range
[19:59:15] [PASSED] out of min range
[19:59:15] [PASSED] zero dst
[19:59:15] [PASSED] negative src
[19:59:15] [PASSED] negative dst
[19:59:15] ============ [PASSED] drm_test_rect_calc_hscale ============
[19:59:15] ================ drm_test_rect_calc_vscale  ================
[19:59:15] [PASSED] normal use
[19:59:15] [PASSED] out of max range
[19:59:15] [PASSED] out of min range
[19:59:15] [PASSED] zero dst
[19:59:15] [PASSED] negative src
[19:59:15] [PASSED] negative dst
[19:59:15] ============ [PASSED] drm_test_rect_calc_vscale ============
[19:59:15] ================== drm_test_rect_rotate  ===================
[19:59:15] [PASSED] reflect-x
[19:59:15] [PASSED] reflect-y
[19:59:15] [PASSED] rotate-0
[19:59:15] [PASSED] rotate-90
[19:59:15] [PASSED] rotate-180
stty: 'standard input': Inappropriate ioctl for device
[19:59:15] [PASSED] rotate-270
[19:59:15] ============== [PASSED] drm_test_rect_rotate ===============
[19:59:15] ================ drm_test_rect_rotate_inv  =================
[19:59:15] [PASSED] reflect-x
[19:59:15] [PASSED] reflect-y
[19:59:15] [PASSED] rotate-0
[19:59:15] [PASSED] rotate-90
[19:59:15] [PASSED] rotate-180
[19:59:15] [PASSED] rotate-270
[19:59:15] ============ [PASSED] drm_test_rect_rotate_inv =============
[19:59:15] ==================== [PASSED] drm_rect =====================
[19:59:15] ============================================================
[19:59:15] Testing complete. Ran 614 tests: passed: 614
[19:59:15] Elapsed time: 23.391s total, 1.622s configuring, 21.552s building, 0.174s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
ERROR:root:../drivers/gpu/drm/ttm/ttm_pool.c: In function ‘ttm_pool_mgr_init’:
../drivers/gpu/drm/ttm/ttm_pool.c:1335:30: error: ‘TTM_SHRINKER_BATCH’ undeclared (first use in this function)
 1335 |         mm_shrinker->batch = TTM_SHRINKER_BATCH;
      |                              ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/ttm_pool.c:1335:30: note: each undeclared identifier is reported only once for each function it appears in
make[7]: *** [../scripts/Makefile.build:203: drivers/gpu/drm/ttm/ttm_pool.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:461: drivers/gpu/drm/ttm] Error 2
make[5]: *** [../scripts/Makefile.build:461: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:461: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:461: drivers] Error 2
make[2]: *** [/kernel/Makefile:2003: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[19:59:15] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:59:17] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


