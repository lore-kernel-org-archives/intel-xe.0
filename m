Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF28EC5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 18:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFD410E698;
	Tue,  3 Jun 2025 18:46:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F0110E698;
 Tue,  3 Jun 2025 18:46:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Enhance_SVM_stats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Jun 2025 18:46:55 -0000
Message-ID: <174897641528.45504.12227095446456680392@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603184133.2215422-1-matthew.brost@intel.com>
In-Reply-To: <20250603184133.2215422-1-matthew.brost@intel.com>
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

Series: Enhance SVM stats
URL   : https://patchwork.freedesktop.org/series/149795/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[18:45:50] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:45:54] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[18:46:21] Starting KUnit Kernel (1/1)...
[18:46:21] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[18:46:21] ================== guc_buf (11 subtests) ===================
[18:46:21] [PASSED] test_smallest
[18:46:21] [PASSED] test_largest
[18:46:21] [PASSED] test_granular
[18:46:21] [PASSED] test_unique
[18:46:21] [PASSED] test_overlap
[18:46:21] [PASSED] test_reusable
[18:46:21] [PASSED] test_too_big
[18:46:21] [PASSED] test_flush
[18:46:21] [PASSED] test_lookup
[18:46:21] [PASSED] test_data
[18:46:21] [PASSED] test_class
[18:46:21] ===================== [PASSED] guc_buf =====================
[18:46:21] =================== guc_dbm (7 subtests) ===================
[18:46:21] [PASSED] test_empty
[18:46:21] [PASSED] test_default
[18:46:21] ======================== test_size  ========================
[18:46:21] [PASSED] 4
[18:46:21] [PASSED] 8
[18:46:21] [PASSED] 32
[18:46:21] [PASSED] 256
[18:46:21] ==================== [PASSED] test_size ====================
[18:46:21] ======================= test_reuse  ========================
[18:46:21] [PASSED] 4
[18:46:21] [PASSED] 8
[18:46:21] [PASSED] 32
[18:46:21] [PASSED] 256
[18:46:21] =================== [PASSED] test_reuse ====================
[18:46:21] =================== test_range_overlap  ====================
[18:46:21] [PASSED] 4
[18:46:21] [PASSED] 8
[18:46:21] [PASSED] 32
[18:46:21] [PASSED] 256
[18:46:21] =============== [PASSED] test_range_overlap ================
[18:46:21] =================== test_range_compact  ====================
[18:46:21] [PASSED] 4
[18:46:21] [PASSED] 8
[18:46:21] [PASSED] 32
[18:46:21] [PASSED] 256
[18:46:21] =============== [PASSED] test_range_compact ================
[18:46:21] ==================== test_range_spare  =====================
[18:46:21] [PASSED] 4
[18:46:21] [PASSED] 8
[18:46:21] [PASSED] 32
[18:46:21] [PASSED] 256
[18:46:21] ================ [PASSED] test_range_spare =================
[18:46:21] ===================== [PASSED] guc_dbm =====================
[18:46:21] =================== guc_idm (6 subtests) ===================
[18:46:21] [PASSED] bad_init
[18:46:21] [PASSED] no_init
[18:46:21] [PASSED] init_fini
[18:46:21] [PASSED] check_used
[18:46:21] [PASSED] check_quota
[18:46:21] [PASSED] check_all
[18:46:21] ===================== [PASSED] guc_idm =====================
[18:46:21] ================== no_relay (3 subtests) ===================
[18:46:21] [PASSED] xe_drops_guc2pf_if_not_ready
[18:46:21] [PASSED] xe_drops_guc2vf_if_not_ready
[18:46:21] [PASSED] xe_rejects_send_if_not_ready
[18:46:21] ==================== [PASSED] no_relay =====================
[18:46:21] ================== pf_relay (14 subtests) ==================
[18:46:21] [PASSED] pf_rejects_guc2pf_too_short
[18:46:21] [PASSED] pf_rejects_guc2pf_too_long
[18:46:21] [PASSED] pf_rejects_guc2pf_no_payload
[18:46:21] [PASSED] pf_fails_no_payload
[18:46:21] [PASSED] pf_fails_bad_origin
[18:46:21] [PASSED] pf_fails_bad_type
[18:46:21] [PASSED] pf_txn_reports_error
[18:46:21] [PASSED] pf_txn_sends_pf2guc
[18:46:21] [PASSED] pf_sends_pf2guc
[18:46:21] [SKIPPED] pf_loopback_nop
[18:46:21] [SKIPPED] pf_loopback_echo
[18:46:21] [SKIPPED] pf_loopback_fail
[18:46:21] [SKIPPED] pf_loopback_busy
[18:46:21] [SKIPPED] pf_loopback_retry
[18:46:21] ==================== [PASSED] pf_relay =====================
[18:46:21] ================== vf_relay (3 subtests) ===================
[18:46:21] [PASSED] vf_rejects_guc2vf_too_short
[18:46:21] [PASSED] vf_rejects_guc2vf_too_long
[18:46:21] [PASSED] vf_rejects_guc2vf_no_payload
[18:46:21] ==================== [PASSED] vf_relay =====================
[18:46:21] ================= pf_service (11 subtests) =================
[18:46:21] [PASSED] pf_negotiate_any
[18:46:21] [PASSED] pf_negotiate_base_match
[18:46:21] [PASSED] pf_negotiate_base_newer
[18:46:21] [PASSED] pf_negotiate_base_next
[18:46:21] [SKIPPED] pf_negotiate_base_older
[18:46:21] [PASSED] pf_negotiate_base_prev
[18:46:21] [PASSED] pf_negotiate_latest_match
[18:46:21] [PASSED] pf_negotiate_latest_newer
[18:46:21] [PASSED] pf_negotiate_latest_next
[18:46:21] [SKIPPED] pf_negotiate_latest_older
[18:46:21] [SKIPPED] pf_negotiate_latest_prev
[18:46:21] =================== [PASSED] pf_service ====================
[18:46:21] ===================== lmtt (1 subtest) =====================
[18:46:21] ======================== test_ops  =========================
[18:46:21] [PASSED] 2-level
[18:46:21] [PASSED] multi-level
[18:46:21] ==================== [PASSED] test_ops =====================
[18:46:21] ====================== [PASSED] lmtt =======================
[18:46:21] =================== xe_mocs (2 subtests) ===================
[18:46:21] ================ xe_live_mocs_kernel_kunit  ================
[18:46:21] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[18:46:21] ================ xe_live_mocs_reset_kunit  =================
[18:46:21] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[18:46:21] ==================== [SKIPPED] xe_mocs =====================
[18:46:21] ================= xe_migrate (2 subtests) ==================
[18:46:21] ================= xe_migrate_sanity_kunit  =================
[18:46:21] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[18:46:21] ================== xe_validate_ccs_kunit  ==================
[18:46:21] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[18:46:21] =================== [SKIPPED] xe_migrate ===================
[18:46:21] ================== xe_dma_buf (1 subtest) ==================
[18:46:21] ==================== xe_dma_buf_kunit  =====================
[18:46:21] ================ [SKIPPED] xe_dma_buf_kunit ================
[18:46:21] =================== [SKIPPED] xe_dma_buf ===================
[18:46:21] ================= xe_bo_shrink (1 subtest) =================
[18:46:21] =================== xe_bo_shrink_kunit  ====================
[18:46:21] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[18:46:21] ================== [SKIPPED] xe_bo_shrink ==================
[18:46:21] ==================== xe_bo (2 subtests) ====================
[18:46:21] ================== xe_ccs_migrate_kunit  ===================
[18:46:21] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[18:46:21] ==================== xe_bo_evict_kunit  ====================
[18:46:21] =============== [SKIPPED] xe_bo_evict_kunit ================
[18:46:21] ===================== [SKIPPED] xe_bo ======================
[18:46:21] ==================== args (11 subtests) ====================
[18:46:21] [PASSED] count_args_test
[18:46:21] [PASSED] call_args_example
[18:46:21] [PASSED] call_args_test
[18:46:21] [PASSED] drop_first_arg_example
[18:46:21] [PASSED] drop_first_arg_test
[18:46:21] [PASSED] first_arg_example
[18:46:21] [PASSED] first_arg_test
[18:46:21] [PASSED] last_arg_example
[18:46:21] [PASSED] last_arg_test
[18:46:21] [PASSED] pick_arg_example
[18:46:21] [PASSED] sep_comma_example
[18:46:21] ====================== [PASSED] args =======================
[18:46:21] =================== xe_pci (2 subtests) ====================
[18:46:21] [PASSED] xe_gmdid_graphics_ip
[18:46:21] [PASSED] xe_gmdid_media_ip
[18:46:21] ===================== [PASSED] xe_pci ======================
[18:46:21] =================== xe_rtp (2 subtests) ====================
[18:46:21] =============== xe_rtp_process_to_sr_tests  ================
[18:46:21] [PASSED] coalesce-same-reg
[18:46:21] [PASSED] no-match-no-add
[18:46:21] [PASSED] match-or
[18:46:21] [PASSED] match-or-xfail
[18:46:21] [PASSED] no-match-no-add-multiple-rules
[18:46:21] [PASSED] two-regs-two-entries
[18:46:21] [PASSED] clr-one-set-other
[18:46:21] [PASSED] set-field
[18:46:21] [PASSED] conflict-duplicate
[18:46:21] [PASSED] conflict-not-disjoint
stty: 'standard input': Inappropriate ioctl for device
[18:46:21] [PASSED] conflict-reg-type
[18:46:21] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[18:46:21] ================== xe_rtp_process_tests  ===================
[18:46:21] [PASSED] active1
[18:46:21] [PASSED] active2
[18:46:21] [PASSED] active-inactive
[18:46:21] [PASSED] inactive-active
[18:46:21] [PASSED] inactive-1st_or_active-inactive
[18:46:21] [PASSED] inactive-2nd_or_active-inactive
[18:46:21] [PASSED] inactive-last_or_active-inactive
[18:46:21] [PASSED] inactive-no_or_active-inactive
[18:46:21] ============== [PASSED] xe_rtp_process_tests ===============
[18:46:21] ===================== [PASSED] xe_rtp ======================
[18:46:21] ==================== xe_wa (1 subtest) =====================
[18:46:21] ======================== xe_wa_gt  =========================
[18:46:21] [PASSED] TIGERLAKE (B0)
[18:46:21] [PASSED] DG1 (A0)
[18:46:21] [PASSED] DG1 (B0)
[18:46:21] [PASSED] ALDERLAKE_S (A0)
[18:46:21] [PASSED] ALDERLAKE_S (B0)
[18:46:21] [PASSED] ALDERLAKE_S (C0)
[18:46:21] [PASSED] ALDERLAKE_S (D0)
[18:46:21] [PASSED] ALDERLAKE_P (A0)
[18:46:21] [PASSED] ALDERLAKE_P (B0)
[18:46:21] [PASSED] ALDERLAKE_P (C0)
[18:46:21] [PASSED] ALDERLAKE_S_RPLS (D0)
[18:46:21] [PASSED] ALDERLAKE_P_RPLU (E0)
[18:46:21] [PASSED] DG2_G10 (C0)
[18:46:21] [PASSED] DG2_G11 (B1)
[18:46:21] [PASSED] DG2_G12 (A1)
[18:46:21] [PASSED] METEORLAKE (g:A0, m:A0)
[18:46:21] [PASSED] METEORLAKE (g:A0, m:A0)
[18:46:21] [PASSED] METEORLAKE (g:A0, m:A0)
[18:46:21] [PASSED] LUNARLAKE (g:A0, m:A0)
[18:46:21] [PASSED] LUNARLAKE (g:B0, m:A0)
[18:46:21] [PASSED] BATTLEMAGE (g:A0, m:A1)
[18:46:21] ==================== [PASSED] xe_wa_gt =====================
[18:46:21] ====================== [PASSED] xe_wa ======================
[18:46:21] ============================================================
[18:46:21] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[18:46:21] Elapsed time: 31.052s total, 4.223s configuring, 26.513s building, 0.297s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[18:46:21] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:46:23] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[18:46:44] Starting KUnit Kernel (1/1)...
[18:46:44] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[18:46:44] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[18:46:44] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[18:46:44] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[18:46:44] =========== drm_validate_clone_mode (2 subtests) ===========
[18:46:44] ============== drm_test_check_in_clone_mode  ===============
[18:46:44] [PASSED] in_clone_mode
[18:46:44] [PASSED] not_in_clone_mode
[18:46:44] ========== [PASSED] drm_test_check_in_clone_mode ===========
[18:46:44] =============== drm_test_check_valid_clones  ===============
[18:46:44] [PASSED] not_in_clone_mode
[18:46:44] [PASSED] valid_clone
[18:46:44] [PASSED] invalid_clone
[18:46:44] =========== [PASSED] drm_test_check_valid_clones ===========
[18:46:44] ============= [PASSED] drm_validate_clone_mode =============
[18:46:44] ============= drm_validate_modeset (1 subtest) =============
[18:46:44] [PASSED] drm_test_check_connector_changed_modeset
[18:46:44] ============== [PASSED] drm_validate_modeset ===============
[18:46:44] ====== drm_test_bridge_get_current_state (2 subtests) ======
[18:46:44] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[18:46:44] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[18:46:44] ======== [PASSED] drm_test_bridge_get_current_state ========
[18:46:44] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[18:46:44] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[18:46:44] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[18:46:44] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[18:46:44] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[18:46:44] ================== drm_buddy (7 subtests) ==================
[18:46:44] [PASSED] drm_test_buddy_alloc_limit
[18:46:44] [PASSED] drm_test_buddy_alloc_optimistic
[18:46:44] [PASSED] drm_test_buddy_alloc_pessimistic
[18:46:44] [PASSED] drm_test_buddy_alloc_pathological
[18:46:44] [PASSED] drm_test_buddy_alloc_contiguous
[18:46:44] [PASSED] drm_test_buddy_alloc_clear
[18:46:44] [PASSED] drm_test_buddy_alloc_range_bias
[18:46:44] ==================== [PASSED] drm_buddy ====================
[18:46:44] ============= drm_cmdline_parser (40 subtests) =============
[18:46:44] [PASSED] drm_test_cmdline_force_d_only
[18:46:44] [PASSED] drm_test_cmdline_force_D_only_dvi
[18:46:44] [PASSED] drm_test_cmdline_force_D_only_hdmi
[18:46:44] [PASSED] drm_test_cmdline_force_D_only_not_digital
[18:46:44] [PASSED] drm_test_cmdline_force_e_only
[18:46:44] [PASSED] drm_test_cmdline_res
[18:46:44] [PASSED] drm_test_cmdline_res_vesa
[18:46:44] [PASSED] drm_test_cmdline_res_vesa_rblank
[18:46:44] [PASSED] drm_test_cmdline_res_rblank
[18:46:44] [PASSED] drm_test_cmdline_res_bpp
[18:46:44] [PASSED] drm_test_cmdline_res_refresh
[18:46:44] [PASSED] drm_test_cmdline_res_bpp_refresh
[18:46:44] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[18:46:44] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[18:46:44] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[18:46:44] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[18:46:44] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[18:46:44] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[18:46:44] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[18:46:44] [PASSED] drm_test_cmdline_res_margins_force_on
[18:46:44] [PASSED] drm_test_cmdline_res_vesa_margins
[18:46:44] [PASSED] drm_test_cmdline_name
[18:46:44] [PASSED] drm_test_cmdline_name_bpp
[18:46:44] [PASSED] drm_test_cmdline_name_option
[18:46:44] [PASSED] drm_test_cmdline_name_bpp_option
[18:46:44] [PASSED] drm_test_cmdline_rotate_0
[18:46:44] [PASSED] drm_test_cmdline_rotate_90
[18:46:44] [PASSED] drm_test_cmdline_rotate_180
[18:46:44] [PASSED] drm_test_cmdline_rotate_270
[18:46:44] [PASSED] drm_test_cmdline_hmirror
[18:46:44] [PASSED] drm_test_cmdline_vmirror
[18:46:44] [PASSED] drm_test_cmdline_margin_options
[18:46:44] [PASSED] drm_test_cmdline_multiple_options
[18:46:44] [PASSED] drm_test_cmdline_bpp_extra_and_option
[18:46:44] [PASSED] drm_test_cmdline_extra_and_option
[18:46:44] [PASSED] drm_test_cmdline_freestanding_options
[18:46:44] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[18:46:44] [PASSED] drm_test_cmdline_panel_orientation
[18:46:44] ================ drm_test_cmdline_invalid  =================
[18:46:44] [PASSED] margin_only
[18:46:44] [PASSED] interlace_only
[18:46:44] [PASSED] res_missing_x
[18:46:44] [PASSED] res_missing_y
[18:46:44] [PASSED] res_bad_y
[18:46:44] [PASSED] res_missing_y_bpp
[18:46:44] [PASSED] res_bad_bpp
[18:46:44] [PASSED] res_bad_refresh
[18:46:44] [PASSED] res_bpp_refresh_force_on_off
[18:46:44] [PASSED] res_invalid_mode
[18:46:44] [PASSED] res_bpp_wrong_place_mode
[18:46:44] [PASSED] name_bpp_refresh
[18:46:44] [PASSED] name_refresh
[18:46:44] [PASSED] name_refresh_wrong_mode
[18:46:44] [PASSED] name_refresh_invalid_mode
[18:46:44] [PASSED] rotate_multiple
[18:46:44] [PASSED] rotate_invalid_val
[18:46:44] [PASSED] rotate_truncated
[18:46:44] [PASSED] invalid_option
[18:46:44] [PASSED] invalid_tv_option
[18:46:44] [PASSED] truncated_tv_option
[18:46:44] ============ [PASSED] drm_test_cmdline_invalid =============
[18:46:44] =============== drm_test_cmdline_tv_options  ===============
[18:46:44] [PASSED] NTSC
[18:46:44] [PASSED] NTSC_443
[18:46:44] [PASSED] NTSC_J
[18:46:44] [PASSED] PAL
[18:46:44] [PASSED] PAL_M
[18:46:44] [PASSED] PAL_N
[18:46:44] [PASSED] SECAM
[18:46:44] [PASSED] MONO_525
[18:46:44] [PASSED] MONO_625
[18:46:44] =========== [PASSED] drm_test_cmdline_tv_options ===========
[18:46:44] =============== [PASSED] drm_cmdline_parser ================
[18:46:44] ========== drmm_connector_hdmi_init (20 subtests) ==========
[18:46:44] [PASSED] drm_test_connector_hdmi_init_valid
[18:46:44] [PASSED] drm_test_connector_hdmi_init_bpc_8
[18:46:44] [PASSED] drm_test_connector_hdmi_init_bpc_10
[18:46:44] [PASSED] drm_test_connector_hdmi_init_bpc_12
[18:46:44] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[18:46:44] [PASSED] drm_test_connector_hdmi_init_bpc_null
[18:46:44] [PASSED] drm_test_connector_hdmi_init_formats_empty
[18:46:44] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[18:46:44] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[18:46:44] [PASSED] supported_formats=0x9 yuv420_allowed=1
[18:46:44] [PASSED] supported_formats=0x9 yuv420_allowed=0
[18:46:44] [PASSED] supported_formats=0x3 yuv420_allowed=1
[18:46:44] [PASSED] supported_formats=0x3 yuv420_allowed=0
[18:46:44] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[18:46:44] [PASSED] drm_test_connector_hdmi_init_null_ddc
[18:46:44] [PASSED] drm_test_connector_hdmi_init_null_product
[18:46:44] [PASSED] drm_test_connector_hdmi_init_null_vendor
[18:46:44] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[18:46:44] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[18:46:44] [PASSED] drm_test_connector_hdmi_init_product_valid
[18:46:44] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[18:46:44] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[18:46:44] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[18:46:44] ========= drm_test_connector_hdmi_init_type_valid  =========
[18:46:44] [PASSED] HDMI-A
[18:46:44] [PASSED] HDMI-B
[18:46:44] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[18:46:44] ======== drm_test_connector_hdmi_init_type_invalid  ========
[18:46:44] [PASSED] Unknown
[18:46:44] [PASSED] VGA
[18:46:44] [PASSED] DVI-I
[18:46:44] [PASSED] DVI-D
[18:46:44] [PASSED] DVI-A
[18:46:44] [PASSED] Composite
[18:46:44] [PASSED] SVIDEO
[18:46:44] [PASSED] LVDS
[18:46:44] [PASSED] Component
[18:46:44] [PASSED] DIN
[18:46:44] [PASSED] DP
[18:46:44] [PASSED] TV
[18:46:44] [PASSED] eDP
[18:46:44] [PASSED] Virtual
[18:46:44] [PASSED] DSI
[18:46:44] [PASSED] DPI
[18:46:44] [PASSED] Writeback
[18:46:44] [PASSED] SPI
[18:46:44] [PASSED] USB
[18:46:44] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[18:46:44] ============ [PASSED] drmm_connector_hdmi_init =============
[18:46:44] ============= drmm_connector_init (3 subtests) =============
[18:46:44] [PASSED] drm_test_drmm_connector_init
[18:46:44] [PASSED] drm_test_drmm_connector_init_null_ddc
[18:46:44] ========= drm_test_drmm_connector_init_type_valid  =========
[18:46:44] [PASSED] Unknown
[18:46:44] [PASSED] VGA
[18:46:44] [PASSED] DVI-I
[18:46:44] [PASSED] DVI-D
[18:46:44] [PASSED] DVI-A
[18:46:44] [PASSED] Composite
[18:46:44] [PASSED] SVIDEO
[18:46:44] [PASSED] LVDS
[18:46:44] [PASSED] Component
[18:46:44] [PASSED] DIN
[18:46:44] [PASSED] DP
[18:46:44] [PASSED] HDMI-A
[18:46:44] [PASSED] HDMI-B
[18:46:44] [PASSED] TV
[18:46:44] [PASSED] eDP
[18:46:44] [PASSED] Virtual
[18:46:44] [PASSED] DSI
[18:46:44] [PASSED] DPI
[18:46:44] [PASSED] Writeback
[18:46:44] [PASSED] SPI
[18:46:44] [PASSED] USB
[18:46:44] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[18:46:44] =============== [PASSED] drmm_connector_init ===============
[18:46:44] ========= drm_connector_dynamic_init (6 subtests) ==========
[18:46:44] [PASSED] drm_test_drm_connector_dynamic_init
[18:46:44] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[18:46:44] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[18:46:44] [PASSED] drm_test_drm_connector_dynamic_init_properties
[18:46:44] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[18:46:44] [PASSED] Unknown
[18:46:44] [PASSED] VGA
[18:46:44] [PASSED] DVI-I
[18:46:44] [PASSED] DVI-D
[18:46:44] [PASSED] DVI-A
[18:46:44] [PASSED] Composite
[18:46:44] [PASSED] SVIDEO
[18:46:44] [PASSED] LVDS
[18:46:44] [PASSED] Component
[18:46:44] [PASSED] DIN
[18:46:44] [PASSED] DP
[18:46:44] [PASSED] HDMI-A
[18:46:44] [PASSED] HDMI-B
[18:46:44] [PASSED] TV
[18:46:44] [PASSED] eDP
[18:46:44] [PASSED] Virtual
[18:46:44] [PASSED] DSI
[18:46:44] [PASSED] DPI
[18:46:44] [PASSED] Writeback
[18:46:44] [PASSED] SPI
[18:46:44] [PASSED] USB
[18:46:44] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[18:46:44] ======== drm_test_drm_connector_dynamic_init_name  =========
[18:46:44] [PASSED] Unknown
[18:46:44] [PASSED] VGA
[18:46:44] [PASSED] DVI-I
[18:46:44] [PASSED] DVI-D
[18:46:44] [PASSED] DVI-A
[18:46:44] [PASSED] Composite
[18:46:44] [PASSED] SVIDEO
[18:46:44] [PASSED] LVDS
[18:46:44] [PASSED] Component
[18:46:44] [PASSED] DIN
[18:46:44] [PASSED] DP
[18:46:44] [PASSED] HDMI-A
[18:46:44] [PASSED] HDMI-B
[18:46:44] [PASSED] TV
[18:46:44] [PASSED] eDP
[18:46:44] [PASSED] Virtual
[18:46:44] [PASSED] DSI
[18:46:44] [PASSED] DPI
[18:46:44] [PASSED] Writeback
[18:46:44] [PASSED] SPI
[18:46:44] [PASSED] USB
[18:46:44] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[18:46:44] =========== [PASSED] drm_connector_dynamic_init ============
[18:46:44] ==== drm_connector_dynamic_register_early (4 subtests) =====
[18:46:44] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[18:46:44] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[18:46:44] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[18:46:44] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[18:46:44] ====== [PASSED] drm_connector_dynamic_register_early =======
[18:46:44] ======= drm_connector_dynamic_register (7 subtests) ========
[18:46:44] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[18:46:44] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[18:46:44] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[18:46:44] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[18:46:44] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[18:46:44] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[18:46:44] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[18:46:44] ========= [PASSED] drm_connector_dynamic_register ==========
[18:46:44] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[18:46:44] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[18:46:44] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[18:46:44] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[18:46:44] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[18:46:44] ========== drm_test_get_tv_mode_from_name_valid  ===========
[18:46:44] [PASSED] NTSC
[18:46:44] [PASSED] NTSC-443
[18:46:44] [PASSED] NTSC-J
[18:46:44] [PASSED] PAL
[18:46:44] [PASSED] PAL-M
[18:46:44] [PASSED] PAL-N
[18:46:44] [PASSED] SECAM
[18:46:44] [PASSED] Mono
[18:46:44] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[18:46:44] [PASSED] drm_test_get_tv_mode_from_name_truncated
[18:46:44] ============ [PASSED] drm_get_tv_mode_from_name ============
[18:46:44] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[18:46:44] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[18:46:44] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[18:46:44] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[18:46:44] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[18:46:44] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[18:46:44] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[18:46:44] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[18:46:44] [PASSED] VIC 96
[18:46:44] [PASSED] VIC 97
[18:46:44] [PASSED] VIC 101
[18:46:44] [PASSED] VIC 102
[18:46:44] [PASSED] VIC 106
[18:46:44] [PASSED] VIC 107
[18:46:44] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[18:46:44] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[18:46:44] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[18:46:44] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[18:46:44] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[18:46:44] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[18:46:44] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[18:46:44] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[18:46:44] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[18:46:44] [PASSED] Automatic
[18:46:44] [PASSED] Full
[18:46:44] [PASSED] Limited 16:235
[18:46:44] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[18:46:44] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[18:46:44] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[18:46:44] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[18:46:44] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[18:46:44] [PASSED] RGB
[18:46:44] [PASSED] YUV 4:2:0
[18:46:44] [PASSED] YUV 4:2:2
[18:46:44] [PASSED] YUV 4:4:4
[18:46:44] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[18:46:44] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[18:46:44] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[18:46:44] ============= drm_damage_helper (21 subtests) ==============
[18:46:44] [PASSED] drm_test_damage_iter_no_damage
[18:46:44] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[18:46:44] [PASSED] drm_test_damage_iter_no_damage_src_moved
[18:46:44] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[18:46:44] [PASSED] drm_test_damage_iter_no_damage_not_visible
[18:46:44] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[18:46:44] [PASSED] drm_test_damage_iter_no_damage_no_fb
[18:46:44] [PASSED] drm_test_damage_iter_simple_damage
[18:46:44] [PASSED] drm_test_damage_iter_single_damage
[18:46:44] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[18:46:44] [PASSED] drm_test_damage_iter_single_damage_outside_src
[18:46:44] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[18:46:44] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[18:46:44] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[18:46:44] [PASSED] drm_test_damage_iter_single_damage_src_moved
[18:46:44] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[18:46:44] [PASSED] drm_test_damage_iter_damage
[18:46:44] [PASSED] drm_test_damage_iter_damage_one_intersect
[18:46:44] [PASSED] drm_test_damage_iter_damage_one_outside
[18:46:44] [PASSED] drm_test_damage_iter_damage_src_moved
[18:46:44] [PASSED] drm_test_damage_iter_damage_not_visible
[18:46:44] ================ [PASSED] drm_damage_helper ================
[18:46:44] ============== drm_dp_mst_helper (3 subtests) ==============
[18:46:44] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[18:46:44] [PASSED] Clock 154000 BPP 30 DSC disabled
[18:46:44] [PASSED] Clock 234000 BPP 30 DSC disabled
[18:46:44] [PASSED] Clock 297000 BPP 24 DSC disabled
[18:46:44] [PASSED] Clock 332880 BPP 24 DSC enabled
[18:46:44] [PASSED] Clock 324540 BPP 24 DSC enabled
[18:46:44] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[18:46:44] ============== drm_test_dp_mst_calc_pbn_div  ===============
[18:46:44] [PASSED] Link rate 2000000 lane count 4
[18:46:44] [PASSED] Link rate 2000000 lane count 2
[18:46:44] [PASSED] Link rate 2000000 lane count 1
[18:46:44] [PASSED] Link rate 1350000 lane count 4
[18:46:44] [PASSED] Link rate 1350000 lane count 2
[18:46:44] [PASSED] Link rate 1350000 lane count 1
[18:46:44] [PASSED] Link rate 1000000 lane count 4
[18:46:44] [PASSED] Link rate 1000000 lane count 2
[18:46:44] [PASSED] Link rate 1000000 lane count 1
[18:46:44] [PASSED] Link rate 810000 lane count 4
[18:46:44] [PASSED] Link rate 810000 lane count 2
[18:46:44] [PASSED] Link rate 810000 lane count 1
[18:46:44] [PASSED] Link rate 540000 lane count 4
[18:46:44] [PASSED] Link rate 540000 lane count 2
[18:46:44] [PASSED] Link rate 540000 lane count 1
[18:46:44] [PASSED] Link rate 270000 lane count 4
[18:46:44] [PASSED] Link rate 270000 lane count 2
[18:46:44] [PASSED] Link rate 270000 lane count 1
[18:46:44] [PASSED] Link rate 162000 lane count 4
[18:46:44] [PASSED] Link rate 162000 lane count 2
[18:46:44] [PASSED] Link rate 162000 lane count 1
[18:46:44] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[18:46:44] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[18:46:44] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[18:46:44] [PASSED] DP_POWER_UP_PHY with port number
[18:46:44] [PASSED] DP_POWER_DOWN_PHY with port number
[18:46:44] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[18:46:44] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[18:46:44] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[18:46:44] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[18:46:44] [PASSED] DP_QUERY_PAYLOAD with port number
[18:46:44] [PASSED] DP_QUERY_PAYLOAD with VCPI
[18:46:44] [PASSED] DP_REMOTE_DPCD_READ with port number
[18:46:44] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[18:46:44] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[18:46:44] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[18:46:44] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[18:46:44] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[18:46:44] [PASSED] DP_REMOTE_I2C_READ with port number
[18:46:44] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[18:46:44] [PASSED] DP_REMOTE_I2C_READ with transactions array
[18:46:44] [PASSED] DP_REMOTE_I2C_WRITE with port number
[18:46:44] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[18:46:44] [PASSED] DP_REMOTE_I2C_WRITE with data array
[18:46:44] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[18:46:44] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[18:46:44] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[18:46:44] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[18:46:44] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[18:46:44] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[18:46:44] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[18:46:44] ================ [PASSED] drm_dp_mst_helper ================
[18:46:44] ================== drm_exec (7 subtests) ===================
[18:46:44] [PASSED] sanitycheck
[18:46:44] [PASSED] test_lock
[18:46:44] [PASSED] test_lock_unlock
[18:46:44] [PASSED] test_duplicates
[18:46:44] [PASSED] test_prepare
[18:46:44] [PASSED] test_prepare_array
[18:46:44] [PASSED] test_multiple_loops
[18:46:44] ==================== [PASSED] drm_exec =====================
[18:46:44] =========== drm_format_helper_test (18 subtests) ===========
[18:46:44] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[18:46:44] [PASSED] single_pixel_source_buffer
[18:46:44] [PASSED] single_pixel_clip_rectangle
[18:46:44] [PASSED] well_known_colors
[18:46:44] [PASSED] destination_pitch
[18:46:44] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[18:46:44] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[18:46:44] [PASSED] single_pixel_source_buffer
[18:46:44] [PASSED] single_pixel_clip_rectangle
[18:46:44] [PASSED] well_known_colors
[18:46:44] [PASSED] destination_pitch
[18:46:44] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[18:46:44] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[18:46:44] [PASSED] single_pixel_source_buffer
[18:46:44] [PASSED] single_pixel_clip_rectangle
[18:46:44] [PASSED] well_known_colors
[18:46:44] [PASSED] destination_pitch
[18:46:44] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[18:46:44] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[18:46:44] [PASSED] single_pixel_source_buffer
[18:46:44] [PASSED] single_pixel_clip_rectangle
[18:46:44] [PASSED] well_known_colors
[18:46:44] [PASSED] destination_pitch
[18:46:44] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[18:46:44] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[18:46:44] [PASSED] single_pixel_source_buffer
[18:46:44] [PASSED] single_pixel_clip_rectangle
[18:46:44] [PASSED] well_known_colors
[18:46:44] [PASSED] destination_pitch
[18:46:44] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[18:46:44] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[18:46:44] [PASSED] single_pixel_source_buffer
[18:46:44] [PASSED] single_pixel_clip_rectangle
[18:46:44] [PASSED] well_known_colors
[18:46:44] [PASSED] destination_pitch
[18:46:44] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[18:46:44] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[18:46:44] [PASSED] single_pixel_source_buffer
[18:46:44] [PASSED] single_pixel_clip_rectangle
[18:46:44] [PASSED] well_known_colors
[18:46:44] [PASSED] destination_pitch
[18:46:44] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[18:46:44] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[18:46:44] [PASSED] single_pixel_source_buffer
[18:46:44] [PASSED] single_pixel_clip_rectangle
[18:46:44] [PASSED] well_known_colors
[18:46:44] [PASSED] destination_pitch
[18:46:44] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[18:46:44] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[18:46:44] [PASSED] single_pixel_source_buffer
[18:46:44] [PASSED] single_pixel_clip_rectangle
[18:46:44] [PASSED] well_known_colors
[18:46:44] [PASSED] destination_pitch
[18:46:44] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[18:46:44] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[18:46:44] [PASSED] single_pixel_source_buffer
[18:46:44] [PASSED] single_pixel_clip_rectangle
[18:46:44] [PASSED] well_known_colors
[18:46:44] [PASSED] destination_pitch
[18:46:44] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[18:46:44] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[18:46:44] [PASSED] single_pixel_source_buffer
[18:46:44] [PASSED] single_pixel_clip_rectangle
[18:46:44] [PASSED] well_known_colors
[18:46:44] [PASSED] destination_pitch
[18:46:44] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[18:46:44] ============== drm_test_fb_xrgb8888_to_mono  ===============
[18:46:44] [PASSED] single_pixel_source_buffer
[18:46:44] [PASSED] single_pixel_clip_rectangle
[18:46:44] [PASSED] well_known_colors
[18:46:44] [PASSED] destination_pitch
[18:46:44] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[18:46:44] ==================== drm_test_fb_swab  =====================
[18:46:44] [PASSED] single_pixel_source_buffer
[18:46:44] [PASSED] single_pixel_clip_rectangle
[18:46:44] [PASSED] well_known_colors
[18:46:44] [PASSED] destination_pitch
[18:46:44] ================ [PASSED] drm_test_fb_swab =================
[18:46:44] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[18:46:44] [PASSED] single_pixel_source_buffer
[18:46:44] [PASSED] single_pixel_clip_rectangle
[18:46:44] [PASSED] well_known_colors
[18:46:44] [PASSED] destination_pitch
[18:46:44] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[18:46:44] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[18:46:44] [PASSED] single_pixel_source_buffer
[18:46:44] [PASSED] single_pixel_clip_rectangle
[18:46:44] [PASSED] well_known_colors
[18:46:44] [PASSED] destination_pitch
[18:46:44] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[18:46:44] ================= drm_test_fb_clip_offset  =================
[18:46:44] [PASSED] pass through
[18:46:44] [PASSED] horizontal offset
[18:46:44] [PASSED] vertical offset
[18:46:44] [PASSED] horizontal and vertical offset
[18:46:44] [PASSED] horizontal offset (custom pitch)
[18:46:44] [PASSED] vertical offset (custom pitch)
[18:46:44] [PASSED] horizontal and vertical offset (custom pitch)
[18:46:44] ============= [PASSED] drm_test_fb_clip_offset =============
[18:46:44] ============== drm_test_fb_build_fourcc_list  ==============
[18:46:44] [PASSED] no native formats
[18:46:44] [PASSED] XRGB8888 as native format
[18:46:44] [PASSED] remove duplicates
[18:46:44] [PASSED] convert alpha formats
[18:46:44] [PASSED] random formats
[18:46:44] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[18:46:44] =================== drm_test_fb_memcpy  ====================
[18:46:44] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[18:46:44] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[18:46:44] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[18:46:44] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[18:46:44] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[18:46:44] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[18:46:44] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[18:46:44] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[18:46:44] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[18:46:44] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[18:46:44] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[18:46:44] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[18:46:44] =============== [PASSED] drm_test_fb_memcpy ================
[18:46:44] ============= [PASSED] drm_format_helper_test ==============
[18:46:44] ================= drm_format (18 subtests) =================
[18:46:44] [PASSED] drm_test_format_block_width_invalid
[18:46:44] [PASSED] drm_test_format_block_width_one_plane
[18:46:44] [PASSED] drm_test_format_block_width_two_plane
[18:46:44] [PASSED] drm_test_format_block_width_three_plane
[18:46:44] [PASSED] drm_test_format_block_width_tiled
[18:46:44] [PASSED] drm_test_format_block_height_invalid
[18:46:44] [PASSED] drm_test_format_block_height_one_plane
[18:46:44] [PASSED] drm_test_format_block_height_two_plane
[18:46:44] [PASSED] drm_test_format_block_height_three_plane
[18:46:44] [PASSED] drm_test_format_block_height_tiled
[18:46:44] [PASSED] drm_test_format_min_pitch_invalid
[18:46:44] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[18:46:44] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[18:46:44] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[18:46:44] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[18:46:44] [PASSED] drm_test_format_min_pitch_two_plane
[18:46:44] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[18:46:44] [PASSED] drm_test_format_min_pitch_tiled
[18:46:44] =================== [PASSED] drm_format ====================
[18:46:44] ============== drm_framebuffer (10 subtests) ===============
[18:46:44] ========== drm_test_framebuffer_check_src_coords  ==========
[18:46:44] [PASSED] Success: source fits into fb
[18:46:44] [PASSED] Fail: overflowing fb with x-axis coordinate
[18:46:44] [PASSED] Fail: overflowing fb with y-axis coordinate
[18:46:44] [PASSED] Fail: overflowing fb with source width
[18:46:44] [PASSED] Fail: overflowing fb with source height
[18:46:44] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[18:46:44] [PASSED] drm_test_framebuffer_cleanup
[18:46:44] =============== drm_test_framebuffer_create  ===============
[18:46:44] [PASSED] ABGR8888 normal sizes
[18:46:44] [PASSED] ABGR8888 max sizes
[18:46:44] [PASSED] ABGR8888 pitch greater than min required
[18:46:44] [PASSED] ABGR8888 pitch less than min required
[18:46:44] [PASSED] ABGR8888 Invalid width
[18:46:44] [PASSED] ABGR8888 Invalid buffer handle
[18:46:44] [PASSED] No pixel format
[18:46:44] [PASSED] ABGR8888 Width 0
[18:46:44] [PASSED] ABGR8888 Height 0
[18:46:44] [PASSED] ABGR8888 Out of bound height * pitch combination
[18:46:44] [PASSED] ABGR8888 Large buffer offset
[18:46:44] [PASSED] ABGR8888 Buffer offset for inexistent plane
[18:46:44] [PASSED] ABGR8888 Invalid flag
[18:46:44] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[18:46:44] [PASSED] ABGR8888 Valid buffer modifier
[18:46:44] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[18:46:44] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[18:46:44] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[18:46:44] [PASSED] NV12 Normal sizes
[18:46:44] [PASSED] NV12 Max sizes
[18:46:44] [PASSED] NV12 Invalid pitch
[18:46:44] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[18:46:44] [PASSED] NV12 different  modifier per-plane
[18:46:44] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[18:46:44] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[18:46:44] [PASSED] NV12 Modifier for inexistent plane
[18:46:44] [PASSED] NV12 Handle for inexistent plane
[18:46:44] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[18:46:44] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[18:46:44] [PASSED] YVU420 Normal sizes
[18:46:44] [PASSED] YVU420 Max sizes
[18:46:44] [PASSED] YVU420 Invalid pitch
[18:46:44] [PASSED] YVU420 Different pitches
[18:46:44] [PASSED] YVU420 Different buffer offsets/pitches
[18:46:44] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[18:46:44] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[18:46:44] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[18:46:44] [PASSED] YVU420 Valid modifier
[18:46:44] [PASSED] YVU420 Different modifiers per plane
[18:46:44] [PASSED] YVU420 Modifier for inexistent plane
[18:46:44] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[18:46:44] [PASSED] X0L2 Normal sizes
[18:46:44] [PASSED] X0L2 Max sizes
[18:46:44] [PASSED] X0L2 Invalid pitch
[18:46:44] [PASSED] X0L2 Pitch greater than minimum required
[18:46:44] [PASSED] X0L2 Handle for inexistent plane
[18:46:44] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[18:46:44] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[18:46:44] [PASSED] X0L2 Valid modifier
[18:46:44] [PASSED] X0L2 Modifier for inexistent plane
[18:46:44] =========== [PASSED] drm_test_framebuffer_create ===========
[18:46:44] [PASSED] drm_test_framebuffer_free
[18:46:44] [PASSED] drm_test_framebuffer_init
[18:46:44] [PASSED] drm_test_framebuffer_init_bad_format
[18:46:44] [PASSED] drm_test_framebuffer_init_dev_mismatch
[18:46:44] [PASSED] drm_test_framebuffer_lookup
[18:46:44] [PASSED] drm_test_framebuffer_lookup_inexistent
[18:46:44] [PASSED] drm_test_framebuffer_modifiers_not_supported
[18:46:44] ================= [PASSED] drm_framebuffer =================
[18:46:44] ================ drm_gem_shmem (8 subtests) ================
[18:46:44] [PASSED] drm_gem_shmem_test_obj_create
[18:46:44] [PASSED] drm_gem_shmem_test_obj_create_private
[18:46:44] [PASSED] drm_gem_shmem_test_pin_pages
[18:46:44] [PASSED] drm_gem_shmem_test_vmap
[18:46:44] [PASSED] drm_gem_shmem_test_get_pages_sgt
[18:46:44] [PASSED] drm_gem_shmem_test_get_sg_table
[18:46:44] [PASSED] drm_gem_shmem_test_madvise
[18:46:44] [PASSED] drm_gem_shmem_test_purge
[18:46:44] ================== [PASSED] drm_gem_shmem ==================
[18:46:44] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[18:46:44] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[18:46:44] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[18:46:44] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[18:46:44] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[18:46:44] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[18:46:44] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[18:46:44] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[18:46:44] [PASSED] Automatic
[18:46:44] [PASSED] Full
[18:46:44] [PASSED] Limited 16:235
[18:46:44] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[18:46:44] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[18:46:44] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[18:46:44] [PASSED] drm_test_check_disable_connector
[18:46:44] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[18:46:44] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[18:46:44] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[18:46:44] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[18:46:44] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[18:46:44] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[18:46:44] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[18:46:44] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[18:46:44] [PASSED] drm_test_check_output_bpc_dvi
[18:46:44] [PASSED] drm_test_check_output_bpc_format_vic_1
[18:46:44] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[18:46:44] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[18:46:44] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[18:46:44] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[18:46:44] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[18:46:44] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[18:46:44] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[18:46:44] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[18:46:44] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[18:46:44] [PASSED] drm_test_check_broadcast_rgb_value
[18:46:44] [PASSED] drm_test_check_bpc_8_value
[18:46:44] [PASSED] drm_test_check_bpc_10_value
[18:46:44] [PASSED] drm_test_check_bpc_12_value
[18:46:44] [PASSED] drm_test_check_format_value
[18:46:44] [PASSED] drm_test_check_tmds_char_value
[18:46:44] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[18:46:44] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[18:46:44] [PASSED] drm_test_check_mode_valid
[18:46:44] [PASSED] drm_test_check_mode_valid_reject
[18:46:44] [PASSED] drm_test_check_mode_valid_reject_rate
[18:46:44] [PASSED] drm_test_check_mode_valid_reject_max_clock
[18:46:44] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[18:46:44] ================= drm_managed (2 subtests) =================
[18:46:44] [PASSED] drm_test_managed_release_action
[18:46:44] [PASSED] drm_test_managed_run_action
[18:46:44] =================== [PASSED] drm_managed ===================
[18:46:44] =================== drm_mm (6 subtests) ====================
[18:46:44] [PASSED] drm_test_mm_init
[18:46:44] [PASSED] drm_test_mm_debug
[18:46:44] [PASSED] drm_test_mm_align32
[18:46:44] [PASSED] drm_test_mm_align64
[18:46:44] [PASSED] drm_test_mm_lowest
[18:46:44] [PASSED] drm_test_mm_highest
[18:46:44] ===================== [PASSED] drm_mm ======================
[18:46:44] ============= drm_modes_analog_tv (5 subtests) =============
[18:46:44] [PASSED] drm_test_modes_analog_tv_mono_576i
[18:46:44] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[18:46:44] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[18:46:44] [PASSED] drm_test_modes_analog_tv_pal_576i
[18:46:44] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[18:46:44] =============== [PASSED] drm_modes_analog_tv ===============
[18:46:44] ============== drm_plane_helper (2 subtests) ===============
[18:46:44] =============== drm_test_check_plane_state  ================
[18:46:44] [PASSED] clipping_simple
[18:46:44] [PASSED] clipping_rotate_reflect
[18:46:44] [PASSED] positioning_simple
[18:46:44] [PASSED] upscaling
[18:46:44] [PASSED] downscaling
[18:46:44] [PASSED] rounding1
[18:46:44] [PASSED] rounding2
[18:46:44] [PASSED] rounding3
[18:46:44] [PASSED] rounding4
[18:46:44] =========== [PASSED] drm_test_check_plane_state ============
[18:46:44] =========== drm_test_check_invalid_plane_state  ============
[18:46:44] [PASSED] positioning_invalid
[18:46:44] [PASSED] upscaling_invalid
[18:46:44] [PASSED] downscaling_invalid
[18:46:44] ======= [PASSED] drm_test_check_invalid_plane_state ========
[18:46:44] ================ [PASSED] drm_plane_helper =================
[18:46:44] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[18:46:44] ====== drm_test_connector_helper_tv_get_modes_check  =======
[18:46:44] [PASSED] None
[18:46:44] [PASSED] PAL
[18:46:44] [PASSED] NTSC
[18:46:44] [PASSED] Both, NTSC Default
[18:46:44] [PASSED] Both, PAL Default
[18:46:44] [PASSED] Both, NTSC Default, with PAL on command-line
[18:46:44] [PASSED] Both, PAL Default, with NTSC on command-line
[18:46:44] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[18:46:44] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[18:46:44] ================== drm_rect (9 subtests) ===================
[18:46:44] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[18:46:44] [PASSED] drm_test_rect_clip_scaled_not_clipped
[18:46:44] [PASSED] drm_test_rect_clip_scaled_clipped
[18:46:44] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[18:46:44] ================= drm_test_rect_intersect  =================
[18:46:44] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[18:46:44] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[18:46:44] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[18:46:44] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[18:46:44] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[18:46:44] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[18:46:44] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[18:46:44] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[18:46:44] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[18:46:44] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[18:46:44] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[18:46:44] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[18:46:44] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[18:46:44] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[18:46:44] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[18:46:44] ============= [PASSED] drm_test_rect_intersect =============
[18:46:44] ================ drm_test_rect_calc_hscale  ================
[18:46:44] [PASSED] normal use
[18:46:44] [PASSED] out of max range
[18:46:44] [PASSED] out of min range
[18:46:44] [PASSED] zero dst
[18:46:44] [PASSED] negative src
[18:46:44] [PASSED] negative dst
[18:46:44] ============ [PASSED] drm_test_rect_calc_hscale ============
[18:46:44] ================ drm_test_rect_calc_vscale  ================
[18:46:44] [PASSED] normal use
[18:46:44] [PASSED] out of max range
[18:46:44] [PASSED] out of min range
[18:46:44] [PASSED] zero dst
[18:46:44] [PASSED] negative src
[18:46:44] [PASSED] negative dst
[18:46:44] ============ [PASSED] drm_test_rect_calc_vscale ============
[18:46:44] ================== drm_test_rect_rotate  ===================
[18:46:44] [PASSED] reflect-x
[18:46:44] [PASSED] reflect-y
[18:46:44] [PASSED] rotate-0
[18:46:44] [PASSED] rotate-90
[18:46:44] [PASSED] rotate-180
stty: 'standard input': Inappropriate ioctl for device
[18:46:44] [PASSED] rotate-270
[18:46:44] ============== [PASSED] drm_test_rect_rotate ===============
[18:46:44] ================ drm_test_rect_rotate_inv  =================
[18:46:44] [PASSED] reflect-x
[18:46:44] [PASSED] reflect-y
[18:46:44] [PASSED] rotate-0
[18:46:44] [PASSED] rotate-90
[18:46:44] [PASSED] rotate-180
[18:46:44] [PASSED] rotate-270
[18:46:44] ============ [PASSED] drm_test_rect_rotate_inv =============
[18:46:44] ==================== [PASSED] drm_rect =====================
[18:46:44] ============================================================
[18:46:44] Testing complete. Ran 614 tests: passed: 614
[18:46:44] Elapsed time: 22.983s total, 1.671s configuring, 21.095s building, 0.188s running

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

[18:46:45] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:46:46] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


