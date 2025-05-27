Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061A9C54FB3
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 01:39:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70C410E424;
	Tue, 27 May 2025 01:39:31 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E7810E416;
 Tue, 27 May 2025 01:39:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Add_quirk_for_panels_that_supp?=
 =?utf-8?q?ort_HBR3_without_TPS4_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 May 2025 01:39:30 -0000
Message-ID: <174830997062.22163.13839246401078230352@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250514084356.1558407-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250514084356.1558407-1-ankit.k.nautiyal@intel.com>
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

Series: Add quirk for panels that support HBR3 without TPS4 (rev2)
URL   : https://patchwork.freedesktop.org/series/149004/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[01:38:23] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:38:27] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[01:38:53] Starting KUnit Kernel (1/1)...
[01:38:53] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:38:54] ================== guc_buf (11 subtests) ===================
[01:38:54] [PASSED] test_smallest
[01:38:54] [PASSED] test_largest
[01:38:54] [PASSED] test_granular
[01:38:54] [PASSED] test_unique
[01:38:54] [PASSED] test_overlap
[01:38:54] [PASSED] test_reusable
[01:38:54] [PASSED] test_too_big
[01:38:54] [PASSED] test_flush
[01:38:54] [PASSED] test_lookup
[01:38:54] [PASSED] test_data
[01:38:54] [PASSED] test_class
[01:38:54] ===================== [PASSED] guc_buf =====================
[01:38:54] =================== guc_dbm (7 subtests) ===================
[01:38:54] [PASSED] test_empty
[01:38:54] [PASSED] test_default
[01:38:54] ======================== test_size  ========================
[01:38:54] [PASSED] 4
[01:38:54] [PASSED] 8
[01:38:54] [PASSED] 32
[01:38:54] [PASSED] 256
[01:38:54] ==================== [PASSED] test_size ====================
[01:38:54] ======================= test_reuse  ========================
[01:38:54] [PASSED] 4
[01:38:54] [PASSED] 8
[01:38:54] [PASSED] 32
[01:38:54] [PASSED] 256
[01:38:54] =================== [PASSED] test_reuse ====================
[01:38:54] =================== test_range_overlap  ====================
[01:38:54] [PASSED] 4
[01:38:54] [PASSED] 8
[01:38:54] [PASSED] 32
[01:38:54] [PASSED] 256
[01:38:54] =============== [PASSED] test_range_overlap ================
[01:38:54] =================== test_range_compact  ====================
[01:38:54] [PASSED] 4
[01:38:54] [PASSED] 8
[01:38:54] [PASSED] 32
[01:38:54] [PASSED] 256
[01:38:54] =============== [PASSED] test_range_compact ================
[01:38:54] ==================== test_range_spare  =====================
[01:38:54] [PASSED] 4
[01:38:54] [PASSED] 8
[01:38:54] [PASSED] 32
[01:38:54] [PASSED] 256
[01:38:54] ================ [PASSED] test_range_spare =================
[01:38:54] ===================== [PASSED] guc_dbm =====================
[01:38:54] =================== guc_idm (6 subtests) ===================
[01:38:54] [PASSED] bad_init
[01:38:54] [PASSED] no_init
[01:38:54] [PASSED] init_fini
[01:38:54] [PASSED] check_used
[01:38:54] [PASSED] check_quota
[01:38:54] [PASSED] check_all
[01:38:54] ===================== [PASSED] guc_idm =====================
[01:38:54] ================== no_relay (3 subtests) ===================
[01:38:54] [PASSED] xe_drops_guc2pf_if_not_ready
[01:38:54] [PASSED] xe_drops_guc2vf_if_not_ready
[01:38:54] [PASSED] xe_rejects_send_if_not_ready
[01:38:54] ==================== [PASSED] no_relay =====================
[01:38:54] ================== pf_relay (14 subtests) ==================
[01:38:54] [PASSED] pf_rejects_guc2pf_too_short
[01:38:54] [PASSED] pf_rejects_guc2pf_too_long
[01:38:54] [PASSED] pf_rejects_guc2pf_no_payload
[01:38:54] [PASSED] pf_fails_no_payload
[01:38:54] [PASSED] pf_fails_bad_origin
[01:38:54] [PASSED] pf_fails_bad_type
[01:38:54] [PASSED] pf_txn_reports_error
[01:38:54] [PASSED] pf_txn_sends_pf2guc
[01:38:54] [PASSED] pf_sends_pf2guc
[01:38:54] [SKIPPED] pf_loopback_nop
[01:38:54] [SKIPPED] pf_loopback_echo
[01:38:54] [SKIPPED] pf_loopback_fail
[01:38:54] [SKIPPED] pf_loopback_busy
[01:38:54] [SKIPPED] pf_loopback_retry
[01:38:54] ==================== [PASSED] pf_relay =====================
[01:38:54] ================== vf_relay (3 subtests) ===================
[01:38:54] [PASSED] vf_rejects_guc2vf_too_short
[01:38:54] [PASSED] vf_rejects_guc2vf_too_long
[01:38:54] [PASSED] vf_rejects_guc2vf_no_payload
[01:38:54] ==================== [PASSED] vf_relay =====================
[01:38:54] ================= pf_service (11 subtests) =================
[01:38:54] [PASSED] pf_negotiate_any
[01:38:54] [PASSED] pf_negotiate_base_match
[01:38:54] [PASSED] pf_negotiate_base_newer
[01:38:54] [PASSED] pf_negotiate_base_next
[01:38:54] [SKIPPED] pf_negotiate_base_older
[01:38:54] [PASSED] pf_negotiate_base_prev
[01:38:54] [PASSED] pf_negotiate_latest_match
[01:38:54] [PASSED] pf_negotiate_latest_newer
[01:38:54] [PASSED] pf_negotiate_latest_next
[01:38:54] [SKIPPED] pf_negotiate_latest_older
[01:38:54] [SKIPPED] pf_negotiate_latest_prev
[01:38:54] =================== [PASSED] pf_service ====================
[01:38:54] ===================== lmtt (1 subtest) =====================
[01:38:54] ======================== test_ops  =========================
[01:38:54] [PASSED] 2-level
[01:38:54] [PASSED] multi-level
[01:38:54] ==================== [PASSED] test_ops =====================
[01:38:54] ====================== [PASSED] lmtt =======================
[01:38:54] =================== xe_mocs (2 subtests) ===================
[01:38:54] ================ xe_live_mocs_kernel_kunit  ================
[01:38:54] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[01:38:54] ================ xe_live_mocs_reset_kunit  =================
[01:38:54] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[01:38:54] ==================== [SKIPPED] xe_mocs =====================
[01:38:54] ================= xe_migrate (2 subtests) ==================
[01:38:54] ================= xe_migrate_sanity_kunit  =================
[01:38:54] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[01:38:54] ================== xe_validate_ccs_kunit  ==================
[01:38:54] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[01:38:54] =================== [SKIPPED] xe_migrate ===================
[01:38:54] ================== xe_dma_buf (1 subtest) ==================
[01:38:54] ==================== xe_dma_buf_kunit  =====================
[01:38:54] ================ [SKIPPED] xe_dma_buf_kunit ================
[01:38:54] =================== [SKIPPED] xe_dma_buf ===================
[01:38:54] ================= xe_bo_shrink (1 subtest) =================
[01:38:54] =================== xe_bo_shrink_kunit  ====================
[01:38:54] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[01:38:54] ================== [SKIPPED] xe_bo_shrink ==================
[01:38:54] ==================== xe_bo (2 subtests) ====================
[01:38:54] ================== xe_ccs_migrate_kunit  ===================
[01:38:54] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[01:38:54] ==================== xe_bo_evict_kunit  ====================
[01:38:54] =============== [SKIPPED] xe_bo_evict_kunit ================
[01:38:54] ===================== [SKIPPED] xe_bo ======================
[01:38:54] ==================== args (11 subtests) ====================
[01:38:54] [PASSED] count_args_test
[01:38:54] [PASSED] call_args_example
[01:38:54] [PASSED] call_args_test
[01:38:54] [PASSED] drop_first_arg_example
[01:38:54] [PASSED] drop_first_arg_test
[01:38:54] [PASSED] first_arg_example
[01:38:54] [PASSED] first_arg_test
[01:38:54] [PASSED] last_arg_example
[01:38:54] [PASSED] last_arg_test
[01:38:54] [PASSED] pick_arg_example
[01:38:54] [PASSED] sep_comma_example
[01:38:54] ====================== [PASSED] args =======================
[01:38:54] =================== xe_pci (2 subtests) ====================
[01:38:54] [PASSED] xe_gmdid_graphics_ip
[01:38:54] [PASSED] xe_gmdid_media_ip
[01:38:54] ===================== [PASSED] xe_pci ======================
[01:38:54] =================== xe_rtp (2 subtests) ====================
[01:38:54] =============== xe_rtp_process_to_sr_tests  ================
[01:38:54] [PASSED] coalesce-same-reg
[01:38:54] [PASSED] no-match-no-add
[01:38:54] [PASSED] match-or
[01:38:54] [PASSED] match-or-xfail
[01:38:54] [PASSED] no-match-no-add-multiple-rules
[01:38:54] [PASSED] two-regs-two-entries
[01:38:54] [PASSED] clr-one-set-other
[01:38:54] [PASSED] set-field
[01:38:54] [PASSED] conflict-duplicate
[01:38:54] [PASSED] conflict-not-disjoint
stty: 'standard input': Inappropriate ioctl for device
[01:38:54] [PASSED] conflict-reg-type
[01:38:54] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[01:38:54] ================== xe_rtp_process_tests  ===================
[01:38:54] [PASSED] active1
[01:38:54] [PASSED] active2
[01:38:54] [PASSED] active-inactive
[01:38:54] [PASSED] inactive-active
[01:38:54] [PASSED] inactive-1st_or_active-inactive
[01:38:54] [PASSED] inactive-2nd_or_active-inactive
[01:38:54] [PASSED] inactive-last_or_active-inactive
[01:38:54] [PASSED] inactive-no_or_active-inactive
[01:38:54] ============== [PASSED] xe_rtp_process_tests ===============
[01:38:54] ===================== [PASSED] xe_rtp ======================
[01:38:54] ==================== xe_wa (1 subtest) =====================
[01:38:54] ======================== xe_wa_gt  =========================
[01:38:54] [PASSED] TIGERLAKE (B0)
[01:38:54] [PASSED] DG1 (A0)
[01:38:54] [PASSED] DG1 (B0)
[01:38:54] [PASSED] ALDERLAKE_S (A0)
[01:38:54] [PASSED] ALDERLAKE_S (B0)
[01:38:54] [PASSED] ALDERLAKE_S (C0)
[01:38:54] [PASSED] ALDERLAKE_S (D0)
[01:38:54] [PASSED] ALDERLAKE_P (A0)
[01:38:54] [PASSED] ALDERLAKE_P (B0)
[01:38:54] [PASSED] ALDERLAKE_P (C0)
[01:38:54] [PASSED] ALDERLAKE_S_RPLS (D0)
[01:38:54] [PASSED] ALDERLAKE_P_RPLU (E0)
[01:38:54] [PASSED] DG2_G10 (C0)
[01:38:54] [PASSED] DG2_G11 (B1)
[01:38:54] [PASSED] DG2_G12 (A1)
[01:38:54] [PASSED] METEORLAKE (g:A0, m:A0)
[01:38:54] [PASSED] METEORLAKE (g:A0, m:A0)
[01:38:54] [PASSED] METEORLAKE (g:A0, m:A0)
[01:38:54] [PASSED] LUNARLAKE (g:A0, m:A0)
[01:38:54] [PASSED] LUNARLAKE (g:B0, m:A0)
[01:38:54] [PASSED] BATTLEMAGE (g:A0, m:A1)
[01:38:54] ==================== [PASSED] xe_wa_gt =====================
[01:38:54] ====================== [PASSED] xe_wa ======================
[01:38:54] ============================================================
[01:38:54] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[01:38:54] Elapsed time: 30.975s total, 4.186s configuring, 26.472s building, 0.292s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[01:38:54] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:38:55] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[01:39:17] Starting KUnit Kernel (1/1)...
[01:39:17] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:39:17] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[01:39:17] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[01:39:17] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[01:39:17] =========== drm_validate_clone_mode (2 subtests) ===========
[01:39:17] ============== drm_test_check_in_clone_mode  ===============
[01:39:17] [PASSED] in_clone_mode
[01:39:17] [PASSED] not_in_clone_mode
[01:39:17] ========== [PASSED] drm_test_check_in_clone_mode ===========
[01:39:17] =============== drm_test_check_valid_clones  ===============
[01:39:17] [PASSED] not_in_clone_mode
[01:39:17] [PASSED] valid_clone
[01:39:17] [PASSED] invalid_clone
[01:39:17] =========== [PASSED] drm_test_check_valid_clones ===========
[01:39:17] ============= [PASSED] drm_validate_clone_mode =============
[01:39:17] ============= drm_validate_modeset (1 subtest) =============
[01:39:17] [PASSED] drm_test_check_connector_changed_modeset
[01:39:17] ============== [PASSED] drm_validate_modeset ===============
[01:39:17] ====== drm_test_bridge_get_current_state (2 subtests) ======
[01:39:17] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[01:39:17] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[01:39:17] ======== [PASSED] drm_test_bridge_get_current_state ========
[01:39:17] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[01:39:17] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[01:39:17] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[01:39:17] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[01:39:17] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[01:39:17] ================== drm_buddy (7 subtests) ==================
[01:39:17] [PASSED] drm_test_buddy_alloc_limit
[01:39:17] [PASSED] drm_test_buddy_alloc_optimistic
[01:39:17] [PASSED] drm_test_buddy_alloc_pessimistic
[01:39:17] [PASSED] drm_test_buddy_alloc_pathological
[01:39:17] [PASSED] drm_test_buddy_alloc_contiguous
[01:39:17] [PASSED] drm_test_buddy_alloc_clear
[01:39:17] [PASSED] drm_test_buddy_alloc_range_bias
[01:39:17] ==================== [PASSED] drm_buddy ====================
[01:39:17] ============= drm_cmdline_parser (40 subtests) =============
[01:39:17] [PASSED] drm_test_cmdline_force_d_only
[01:39:17] [PASSED] drm_test_cmdline_force_D_only_dvi
[01:39:17] [PASSED] drm_test_cmdline_force_D_only_hdmi
[01:39:17] [PASSED] drm_test_cmdline_force_D_only_not_digital
[01:39:17] [PASSED] drm_test_cmdline_force_e_only
[01:39:17] [PASSED] drm_test_cmdline_res
[01:39:17] [PASSED] drm_test_cmdline_res_vesa
[01:39:17] [PASSED] drm_test_cmdline_res_vesa_rblank
[01:39:17] [PASSED] drm_test_cmdline_res_rblank
[01:39:17] [PASSED] drm_test_cmdline_res_bpp
[01:39:17] [PASSED] drm_test_cmdline_res_refresh
[01:39:17] [PASSED] drm_test_cmdline_res_bpp_refresh
[01:39:17] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[01:39:17] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[01:39:17] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[01:39:17] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[01:39:17] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[01:39:17] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[01:39:17] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[01:39:17] [PASSED] drm_test_cmdline_res_margins_force_on
[01:39:17] [PASSED] drm_test_cmdline_res_vesa_margins
[01:39:17] [PASSED] drm_test_cmdline_name
[01:39:17] [PASSED] drm_test_cmdline_name_bpp
[01:39:17] [PASSED] drm_test_cmdline_name_option
[01:39:17] [PASSED] drm_test_cmdline_name_bpp_option
[01:39:17] [PASSED] drm_test_cmdline_rotate_0
[01:39:17] [PASSED] drm_test_cmdline_rotate_90
[01:39:17] [PASSED] drm_test_cmdline_rotate_180
[01:39:17] [PASSED] drm_test_cmdline_rotate_270
[01:39:17] [PASSED] drm_test_cmdline_hmirror
[01:39:17] [PASSED] drm_test_cmdline_vmirror
[01:39:17] [PASSED] drm_test_cmdline_margin_options
[01:39:17] [PASSED] drm_test_cmdline_multiple_options
[01:39:17] [PASSED] drm_test_cmdline_bpp_extra_and_option
[01:39:17] [PASSED] drm_test_cmdline_extra_and_option
[01:39:17] [PASSED] drm_test_cmdline_freestanding_options
[01:39:17] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[01:39:17] [PASSED] drm_test_cmdline_panel_orientation
[01:39:17] ================ drm_test_cmdline_invalid  =================
[01:39:17] [PASSED] margin_only
[01:39:17] [PASSED] interlace_only
[01:39:17] [PASSED] res_missing_x
[01:39:17] [PASSED] res_missing_y
[01:39:17] [PASSED] res_bad_y
[01:39:17] [PASSED] res_missing_y_bpp
[01:39:17] [PASSED] res_bad_bpp
[01:39:17] [PASSED] res_bad_refresh
[01:39:17] [PASSED] res_bpp_refresh_force_on_off
[01:39:17] [PASSED] res_invalid_mode
[01:39:17] [PASSED] res_bpp_wrong_place_mode
[01:39:17] [PASSED] name_bpp_refresh
[01:39:17] [PASSED] name_refresh
[01:39:17] [PASSED] name_refresh_wrong_mode
[01:39:17] [PASSED] name_refresh_invalid_mode
[01:39:17] [PASSED] rotate_multiple
[01:39:17] [PASSED] rotate_invalid_val
[01:39:17] [PASSED] rotate_truncated
[01:39:17] [PASSED] invalid_option
[01:39:17] [PASSED] invalid_tv_option
[01:39:17] [PASSED] truncated_tv_option
[01:39:17] ============ [PASSED] drm_test_cmdline_invalid =============
[01:39:17] =============== drm_test_cmdline_tv_options  ===============
[01:39:17] [PASSED] NTSC
[01:39:17] [PASSED] NTSC_443
[01:39:17] [PASSED] NTSC_J
[01:39:17] [PASSED] PAL
[01:39:17] [PASSED] PAL_M
[01:39:17] [PASSED] PAL_N
[01:39:17] [PASSED] SECAM
[01:39:17] [PASSED] MONO_525
[01:39:17] [PASSED] MONO_625
[01:39:17] =========== [PASSED] drm_test_cmdline_tv_options ===========
[01:39:17] =============== [PASSED] drm_cmdline_parser ================
[01:39:17] ========== drmm_connector_hdmi_init (20 subtests) ==========
[01:39:17] [PASSED] drm_test_connector_hdmi_init_valid
[01:39:17] [PASSED] drm_test_connector_hdmi_init_bpc_8
[01:39:17] [PASSED] drm_test_connector_hdmi_init_bpc_10
[01:39:17] [PASSED] drm_test_connector_hdmi_init_bpc_12
[01:39:17] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[01:39:17] [PASSED] drm_test_connector_hdmi_init_bpc_null
[01:39:17] [PASSED] drm_test_connector_hdmi_init_formats_empty
[01:39:17] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[01:39:17] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[01:39:17] [PASSED] supported_formats=0x9 yuv420_allowed=1
[01:39:17] [PASSED] supported_formats=0x9 yuv420_allowed=0
[01:39:17] [PASSED] supported_formats=0x3 yuv420_allowed=1
[01:39:17] [PASSED] supported_formats=0x3 yuv420_allowed=0
[01:39:17] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[01:39:17] [PASSED] drm_test_connector_hdmi_init_null_ddc
[01:39:17] [PASSED] drm_test_connector_hdmi_init_null_product
[01:39:17] [PASSED] drm_test_connector_hdmi_init_null_vendor
[01:39:17] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[01:39:17] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[01:39:17] [PASSED] drm_test_connector_hdmi_init_product_valid
[01:39:17] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[01:39:17] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[01:39:17] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[01:39:17] ========= drm_test_connector_hdmi_init_type_valid  =========
[01:39:17] [PASSED] HDMI-A
[01:39:17] [PASSED] HDMI-B
[01:39:17] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[01:39:17] ======== drm_test_connector_hdmi_init_type_invalid  ========
[01:39:17] [PASSED] Unknown
[01:39:17] [PASSED] VGA
[01:39:17] [PASSED] DVI-I
[01:39:17] [PASSED] DVI-D
[01:39:17] [PASSED] DVI-A
[01:39:17] [PASSED] Composite
[01:39:17] [PASSED] SVIDEO
[01:39:17] [PASSED] LVDS
[01:39:17] [PASSED] Component
[01:39:17] [PASSED] DIN
[01:39:17] [PASSED] DP
[01:39:17] [PASSED] TV
[01:39:17] [PASSED] eDP
[01:39:17] [PASSED] Virtual
[01:39:17] [PASSED] DSI
[01:39:17] [PASSED] DPI
[01:39:17] [PASSED] Writeback
[01:39:17] [PASSED] SPI
[01:39:17] [PASSED] USB
[01:39:17] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[01:39:17] ============ [PASSED] drmm_connector_hdmi_init =============
[01:39:17] ============= drmm_connector_init (3 subtests) =============
[01:39:17] [PASSED] drm_test_drmm_connector_init
[01:39:17] [PASSED] drm_test_drmm_connector_init_null_ddc
[01:39:17] ========= drm_test_drmm_connector_init_type_valid  =========
[01:39:17] [PASSED] Unknown
[01:39:17] [PASSED] VGA
[01:39:17] [PASSED] DVI-I
[01:39:17] [PASSED] DVI-D
[01:39:17] [PASSED] DVI-A
[01:39:17] [PASSED] Composite
[01:39:17] [PASSED] SVIDEO
[01:39:17] [PASSED] LVDS
[01:39:17] [PASSED] Component
[01:39:17] [PASSED] DIN
[01:39:17] [PASSED] DP
[01:39:17] [PASSED] HDMI-A
[01:39:17] [PASSED] HDMI-B
[01:39:17] [PASSED] TV
[01:39:17] [PASSED] eDP
[01:39:17] [PASSED] Virtual
[01:39:17] [PASSED] DSI
[01:39:17] [PASSED] DPI
[01:39:17] [PASSED] Writeback
[01:39:17] [PASSED] SPI
[01:39:17] [PASSED] USB
[01:39:17] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[01:39:17] =============== [PASSED] drmm_connector_init ===============
[01:39:17] ========= drm_connector_dynamic_init (6 subtests) ==========
[01:39:17] [PASSED] drm_test_drm_connector_dynamic_init
[01:39:17] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[01:39:17] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[01:39:17] [PASSED] drm_test_drm_connector_dynamic_init_properties
[01:39:17] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[01:39:17] [PASSED] Unknown
[01:39:17] [PASSED] VGA
[01:39:17] [PASSED] DVI-I
[01:39:17] [PASSED] DVI-D
[01:39:17] [PASSED] DVI-A
[01:39:17] [PASSED] Composite
[01:39:17] [PASSED] SVIDEO
[01:39:17] [PASSED] LVDS
[01:39:17] [PASSED] Component
[01:39:17] [PASSED] DIN
[01:39:17] [PASSED] DP
[01:39:17] [PASSED] HDMI-A
[01:39:17] [PASSED] HDMI-B
[01:39:17] [PASSED] TV
[01:39:17] [PASSED] eDP
[01:39:17] [PASSED] Virtual
[01:39:17] [PASSED] DSI
[01:39:17] [PASSED] DPI
[01:39:17] [PASSED] Writeback
[01:39:17] [PASSED] SPI
[01:39:17] [PASSED] USB
[01:39:17] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[01:39:17] ======== drm_test_drm_connector_dynamic_init_name  =========
[01:39:17] [PASSED] Unknown
[01:39:17] [PASSED] VGA
[01:39:17] [PASSED] DVI-I
[01:39:17] [PASSED] DVI-D
[01:39:17] [PASSED] DVI-A
[01:39:17] [PASSED] Composite
[01:39:17] [PASSED] SVIDEO
[01:39:17] [PASSED] LVDS
[01:39:17] [PASSED] Component
[01:39:17] [PASSED] DIN
[01:39:17] [PASSED] DP
[01:39:17] [PASSED] HDMI-A
[01:39:17] [PASSED] HDMI-B
[01:39:17] [PASSED] TV
[01:39:17] [PASSED] eDP
[01:39:17] [PASSED] Virtual
[01:39:17] [PASSED] DSI
[01:39:17] [PASSED] DPI
[01:39:17] [PASSED] Writeback
[01:39:17] [PASSED] SPI
[01:39:17] [PASSED] USB
[01:39:17] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[01:39:17] =========== [PASSED] drm_connector_dynamic_init ============
[01:39:17] ==== drm_connector_dynamic_register_early (4 subtests) =====
[01:39:17] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[01:39:17] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[01:39:17] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[01:39:17] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[01:39:17] ====== [PASSED] drm_connector_dynamic_register_early =======
[01:39:17] ======= drm_connector_dynamic_register (7 subtests) ========
[01:39:17] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[01:39:17] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[01:39:17] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[01:39:17] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[01:39:17] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[01:39:17] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[01:39:17] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[01:39:17] ========= [PASSED] drm_connector_dynamic_register ==========
[01:39:17] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[01:39:17] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[01:39:17] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[01:39:17] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[01:39:17] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[01:39:17] ========== drm_test_get_tv_mode_from_name_valid  ===========
[01:39:17] [PASSED] NTSC
[01:39:17] [PASSED] NTSC-443
[01:39:17] [PASSED] NTSC-J
[01:39:17] [PASSED] PAL
[01:39:17] [PASSED] PAL-M
[01:39:17] [PASSED] PAL-N
[01:39:17] [PASSED] SECAM
[01:39:17] [PASSED] Mono
[01:39:17] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[01:39:17] [PASSED] drm_test_get_tv_mode_from_name_truncated
[01:39:17] ============ [PASSED] drm_get_tv_mode_from_name ============
[01:39:17] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[01:39:17] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[01:39:17] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[01:39:17] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[01:39:17] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[01:39:17] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[01:39:17] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[01:39:17] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[01:39:17] [PASSED] VIC 96
[01:39:17] [PASSED] VIC 97
[01:39:17] [PASSED] VIC 101
[01:39:17] [PASSED] VIC 102
[01:39:17] [PASSED] VIC 106
[01:39:17] [PASSED] VIC 107
[01:39:17] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[01:39:17] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[01:39:17] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[01:39:17] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[01:39:17] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[01:39:17] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[01:39:17] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[01:39:17] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[01:39:17] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[01:39:17] [PASSED] Automatic
[01:39:17] [PASSED] Full
[01:39:17] [PASSED] Limited 16:235
[01:39:17] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[01:39:17] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[01:39:17] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[01:39:17] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[01:39:17] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[01:39:17] [PASSED] RGB
[01:39:17] [PASSED] YUV 4:2:0
[01:39:17] [PASSED] YUV 4:2:2
[01:39:17] [PASSED] YUV 4:4:4
[01:39:17] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[01:39:17] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[01:39:17] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[01:39:17] ============= drm_damage_helper (21 subtests) ==============
[01:39:17] [PASSED] drm_test_damage_iter_no_damage
[01:39:17] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[01:39:17] [PASSED] drm_test_damage_iter_no_damage_src_moved
[01:39:17] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[01:39:17] [PASSED] drm_test_damage_iter_no_damage_not_visible
[01:39:17] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[01:39:17] [PASSED] drm_test_damage_iter_no_damage_no_fb
[01:39:17] [PASSED] drm_test_damage_iter_simple_damage
[01:39:17] [PASSED] drm_test_damage_iter_single_damage
[01:39:17] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[01:39:17] [PASSED] drm_test_damage_iter_single_damage_outside_src
[01:39:17] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[01:39:17] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[01:39:17] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[01:39:17] [PASSED] drm_test_damage_iter_single_damage_src_moved
[01:39:17] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[01:39:17] [PASSED] drm_test_damage_iter_damage
[01:39:17] [PASSED] drm_test_damage_iter_damage_one_intersect
[01:39:17] [PASSED] drm_test_damage_iter_damage_one_outside
[01:39:17] [PASSED] drm_test_damage_iter_damage_src_moved
[01:39:17] [PASSED] drm_test_damage_iter_damage_not_visible
[01:39:17] ================ [PASSED] drm_damage_helper ================
[01:39:17] ============== drm_dp_mst_helper (3 subtests) ==============
[01:39:17] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[01:39:17] [PASSED] Clock 154000 BPP 30 DSC disabled
[01:39:17] [PASSED] Clock 234000 BPP 30 DSC disabled
[01:39:17] [PASSED] Clock 297000 BPP 24 DSC disabled
[01:39:17] [PASSED] Clock 332880 BPP 24 DSC enabled
[01:39:17] [PASSED] Clock 324540 BPP 24 DSC enabled
[01:39:17] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[01:39:17] ============== drm_test_dp_mst_calc_pbn_div  ===============
[01:39:17] [PASSED] Link rate 2000000 lane count 4
[01:39:17] [PASSED] Link rate 2000000 lane count 2
[01:39:17] [PASSED] Link rate 2000000 lane count 1
[01:39:17] [PASSED] Link rate 1350000 lane count 4
[01:39:17] [PASSED] Link rate 1350000 lane count 2
[01:39:17] [PASSED] Link rate 1350000 lane count 1
[01:39:17] [PASSED] Link rate 1000000 lane count 4
[01:39:17] [PASSED] Link rate 1000000 lane count 2
[01:39:17] [PASSED] Link rate 1000000 lane count 1
[01:39:17] [PASSED] Link rate 810000 lane count 4
[01:39:17] [PASSED] Link rate 810000 lane count 2
[01:39:17] [PASSED] Link rate 810000 lane count 1
[01:39:17] [PASSED] Link rate 540000 lane count 4
[01:39:17] [PASSED] Link rate 540000 lane count 2
[01:39:17] [PASSED] Link rate 540000 lane count 1
[01:39:17] [PASSED] Link rate 270000 lane count 4
[01:39:17] [PASSED] Link rate 270000 lane count 2
[01:39:17] [PASSED] Link rate 270000 lane count 1
[01:39:17] [PASSED] Link rate 162000 lane count 4
[01:39:17] [PASSED] Link rate 162000 lane count 2
[01:39:17] [PASSED] Link rate 162000 lane count 1
[01:39:17] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[01:39:17] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[01:39:17] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[01:39:17] [PASSED] DP_POWER_UP_PHY with port number
[01:39:17] [PASSED] DP_POWER_DOWN_PHY with port number
[01:39:17] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[01:39:17] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[01:39:17] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[01:39:17] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[01:39:17] [PASSED] DP_QUERY_PAYLOAD with port number
[01:39:17] [PASSED] DP_QUERY_PAYLOAD with VCPI
[01:39:17] [PASSED] DP_REMOTE_DPCD_READ with port number
[01:39:17] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[01:39:17] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[01:39:17] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[01:39:17] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[01:39:17] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[01:39:17] [PASSED] DP_REMOTE_I2C_READ with port number
[01:39:17] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[01:39:17] [PASSED] DP_REMOTE_I2C_READ with transactions array
[01:39:17] [PASSED] DP_REMOTE_I2C_WRITE with port number
[01:39:17] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[01:39:17] [PASSED] DP_REMOTE_I2C_WRITE with data array
[01:39:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[01:39:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[01:39:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[01:39:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[01:39:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[01:39:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[01:39:17] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[01:39:17] ================ [PASSED] drm_dp_mst_helper ================
[01:39:17] ================== drm_exec (7 subtests) ===================
[01:39:17] [PASSED] sanitycheck
[01:39:17] [PASSED] test_lock
[01:39:17] [PASSED] test_lock_unlock
[01:39:17] [PASSED] test_duplicates
[01:39:17] [PASSED] test_prepare
[01:39:17] [PASSED] test_prepare_array
[01:39:17] [PASSED] test_multiple_loops
[01:39:17] ==================== [PASSED] drm_exec =====================
[01:39:17] =========== drm_format_helper_test (18 subtests) ===========
[01:39:17] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[01:39:17] [PASSED] single_pixel_source_buffer
[01:39:17] [PASSED] single_pixel_clip_rectangle
[01:39:17] [PASSED] well_known_colors
[01:39:17] [PASSED] destination_pitch
[01:39:17] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[01:39:17] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[01:39:17] [PASSED] single_pixel_source_buffer
[01:39:17] [PASSED] single_pixel_clip_rectangle
[01:39:17] [PASSED] well_known_colors
[01:39:17] [PASSED] destination_pitch
[01:39:17] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[01:39:17] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[01:39:17] [PASSED] single_pixel_source_buffer
[01:39:17] [PASSED] single_pixel_clip_rectangle
[01:39:17] [PASSED] well_known_colors
[01:39:17] [PASSED] destination_pitch
[01:39:17] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[01:39:17] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[01:39:17] [PASSED] single_pixel_source_buffer
[01:39:17] [PASSED] single_pixel_clip_rectangle
[01:39:17] [PASSED] well_known_colors
[01:39:17] [PASSED] destination_pitch
[01:39:17] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[01:39:17] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[01:39:17] [PASSED] single_pixel_source_buffer
[01:39:17] [PASSED] single_pixel_clip_rectangle
[01:39:17] [PASSED] well_known_colors
[01:39:17] [PASSED] destination_pitch
[01:39:17] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[01:39:17] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[01:39:17] [PASSED] single_pixel_source_buffer
[01:39:17] [PASSED] single_pixel_clip_rectangle
[01:39:17] [PASSED] well_known_colors
[01:39:17] [PASSED] destination_pitch
[01:39:17] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[01:39:17] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[01:39:17] [PASSED] single_pixel_source_buffer
[01:39:17] [PASSED] single_pixel_clip_rectangle
[01:39:17] [PASSED] well_known_colors
[01:39:17] [PASSED] destination_pitch
[01:39:17] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[01:39:17] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[01:39:17] [PASSED] single_pixel_source_buffer
[01:39:17] [PASSED] single_pixel_clip_rectangle
[01:39:17] [PASSED] well_known_colors
[01:39:17] [PASSED] destination_pitch
[01:39:17] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[01:39:17] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[01:39:17] [PASSED] single_pixel_source_buffer
[01:39:17] [PASSED] single_pixel_clip_rectangle
[01:39:17] [PASSED] well_known_colors
[01:39:17] [PASSED] destination_pitch
[01:39:17] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[01:39:17] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[01:39:17] [PASSED] single_pixel_source_buffer
[01:39:17] [PASSED] single_pixel_clip_rectangle
[01:39:17] [PASSED] well_known_colors
[01:39:17] [PASSED] destination_pitch
[01:39:17] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[01:39:17] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[01:39:17] [PASSED] single_pixel_source_buffer
[01:39:17] [PASSED] single_pixel_clip_rectangle
[01:39:17] [PASSED] well_known_colors
[01:39:17] [PASSED] destination_pitch
[01:39:17] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[01:39:17] ============== drm_test_fb_xrgb8888_to_mono  ===============
[01:39:17] [PASSED] single_pixel_source_buffer
[01:39:17] [PASSED] single_pixel_clip_rectangle
[01:39:17] [PASSED] well_known_colors
[01:39:17] [PASSED] destination_pitch
[01:39:17] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[01:39:17] ==================== drm_test_fb_swab  =====================
[01:39:17] [PASSED] single_pixel_source_buffer
[01:39:17] [PASSED] single_pixel_clip_rectangle
[01:39:17] [PASSED] well_known_colors
[01:39:17] [PASSED] destination_pitch
[01:39:17] ================ [PASSED] drm_test_fb_swab =================
[01:39:17] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[01:39:17] [PASSED] single_pixel_source_buffer
[01:39:17] [PASSED] single_pixel_clip_rectangle
[01:39:17] [PASSED] well_known_colors
[01:39:17] [PASSED] destination_pitch
[01:39:17] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[01:39:17] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[01:39:17] [PASSED] single_pixel_source_buffer
[01:39:17] [PASSED] single_pixel_clip_rectangle
[01:39:17] [PASSED] well_known_colors
[01:39:17] [PASSED] destination_pitch
[01:39:17] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[01:39:17] ================= drm_test_fb_clip_offset  =================
[01:39:17] [PASSED] pass through
[01:39:17] [PASSED] horizontal offset
[01:39:17] [PASSED] vertical offset
[01:39:17] [PASSED] horizontal and vertical offset
[01:39:17] [PASSED] horizontal offset (custom pitch)
[01:39:17] [PASSED] vertical offset (custom pitch)
[01:39:17] [PASSED] horizontal and vertical offset (custom pitch)
[01:39:17] ============= [PASSED] drm_test_fb_clip_offset =============
[01:39:17] ============== drm_test_fb_build_fourcc_list  ==============
[01:39:17] [PASSED] no native formats
[01:39:17] [PASSED] XRGB8888 as native format
[01:39:17] [PASSED] remove duplicates
[01:39:17] [PASSED] convert alpha formats
[01:39:17] [PASSED] random formats
[01:39:17] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[01:39:17] =================== drm_test_fb_memcpy  ====================
[01:39:17] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[01:39:17] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[01:39:17] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[01:39:17] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[01:39:17] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[01:39:17] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[01:39:17] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[01:39:17] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[01:39:17] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[01:39:17] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[01:39:17] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[01:39:17] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[01:39:17] =============== [PASSED] drm_test_fb_memcpy ================
[01:39:17] ============= [PASSED] drm_format_helper_test ==============
[01:39:17] ================= drm_format (18 subtests) =================
[01:39:17] [PASSED] drm_test_format_block_width_invalid
[01:39:17] [PASSED] drm_test_format_block_width_one_plane
[01:39:17] [PASSED] drm_test_format_block_width_two_plane
[01:39:17] [PASSED] drm_test_format_block_width_three_plane
[01:39:17] [PASSED] drm_test_format_block_width_tiled
[01:39:17] [PASSED] drm_test_format_block_height_invalid
[01:39:17] [PASSED] drm_test_format_block_height_one_plane
[01:39:17] [PASSED] drm_test_format_block_height_two_plane
[01:39:17] [PASSED] drm_test_format_block_height_three_plane
[01:39:17] [PASSED] drm_test_format_block_height_tiled
[01:39:17] [PASSED] drm_test_format_min_pitch_invalid
[01:39:17] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[01:39:17] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[01:39:17] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[01:39:17] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[01:39:17] [PASSED] drm_test_format_min_pitch_two_plane
[01:39:17] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[01:39:17] [PASSED] drm_test_format_min_pitch_tiled
[01:39:17] =================== [PASSED] drm_format ====================
[01:39:17] ============== drm_framebuffer (10 subtests) ===============
[01:39:17] ========== drm_test_framebuffer_check_src_coords  ==========
[01:39:17] [PASSED] Success: source fits into fb
[01:39:17] [PASSED] Fail: overflowing fb with x-axis coordinate
[01:39:17] [PASSED] Fail: overflowing fb with y-axis coordinate
[01:39:17] [PASSED] Fail: overflowing fb with source width
[01:39:17] [PASSED] Fail: overflowing fb with source height
[01:39:17] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[01:39:17] [PASSED] drm_test_framebuffer_cleanup
[01:39:17] =============== drm_test_framebuffer_create  ===============
[01:39:17] [PASSED] ABGR8888 normal sizes
[01:39:17] [PASSED] ABGR8888 max sizes
[01:39:17] [PASSED] ABGR8888 pitch greater than min required
[01:39:17] [PASSED] ABGR8888 pitch less than min required
[01:39:17] [PASSED] ABGR8888 Invalid width
[01:39:17] [PASSED] ABGR8888 Invalid buffer handle
[01:39:17] [PASSED] No pixel format
[01:39:17] [PASSED] ABGR8888 Width 0
[01:39:17] [PASSED] ABGR8888 Height 0
[01:39:17] [PASSED] ABGR8888 Out of bound height * pitch combination
[01:39:17] [PASSED] ABGR8888 Large buffer offset
[01:39:17] [PASSED] ABGR8888 Buffer offset for inexistent plane
[01:39:17] [PASSED] ABGR8888 Invalid flag
[01:39:17] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[01:39:17] [PASSED] ABGR8888 Valid buffer modifier
[01:39:17] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[01:39:17] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[01:39:17] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[01:39:17] [PASSED] NV12 Normal sizes
[01:39:17] [PASSED] NV12 Max sizes
[01:39:17] [PASSED] NV12 Invalid pitch
[01:39:17] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[01:39:17] [PASSED] NV12 different  modifier per-plane
[01:39:17] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[01:39:17] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[01:39:17] [PASSED] NV12 Modifier for inexistent plane
[01:39:17] [PASSED] NV12 Handle for inexistent plane
[01:39:17] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[01:39:17] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[01:39:17] [PASSED] YVU420 Normal sizes
[01:39:17] [PASSED] YVU420 Max sizes
[01:39:17] [PASSED] YVU420 Invalid pitch
[01:39:17] [PASSED] YVU420 Different pitches
[01:39:17] [PASSED] YVU420 Different buffer offsets/pitches
[01:39:17] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[01:39:17] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[01:39:17] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[01:39:17] [PASSED] YVU420 Valid modifier
[01:39:17] [PASSED] YVU420 Different modifiers per plane
[01:39:17] [PASSED] YVU420 Modifier for inexistent plane
[01:39:17] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[01:39:17] [PASSED] X0L2 Normal sizes
[01:39:17] [PASSED] X0L2 Max sizes
[01:39:17] [PASSED] X0L2 Invalid pitch
[01:39:17] [PASSED] X0L2 Pitch greater than minimum required
[01:39:17] [PASSED] X0L2 Handle for inexistent plane
[01:39:17] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[01:39:17] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[01:39:17] [PASSED] X0L2 Valid modifier
[01:39:17] [PASSED] X0L2 Modifier for inexistent plane
[01:39:17] =========== [PASSED] drm_test_framebuffer_create ===========
[01:39:17] [PASSED] drm_test_framebuffer_free
[01:39:17] [PASSED] drm_test_framebuffer_init
[01:39:17] [PASSED] drm_test_framebuffer_init_bad_format
[01:39:17] [PASSED] drm_test_framebuffer_init_dev_mismatch
[01:39:17] [PASSED] drm_test_framebuffer_lookup
[01:39:17] [PASSED] drm_test_framebuffer_lookup_inexistent
[01:39:17] [PASSED] drm_test_framebuffer_modifiers_not_supported
[01:39:17] ================= [PASSED] drm_framebuffer =================
[01:39:17] ================ drm_gem_shmem (8 subtests) ================
[01:39:17] [PASSED] drm_gem_shmem_test_obj_create
[01:39:17] [PASSED] drm_gem_shmem_test_obj_create_private
[01:39:17] [PASSED] drm_gem_shmem_test_pin_pages
[01:39:17] [PASSED] drm_gem_shmem_test_vmap
[01:39:17] [PASSED] drm_gem_shmem_test_get_pages_sgt
[01:39:17] [PASSED] drm_gem_shmem_test_get_sg_table
[01:39:17] [PASSED] drm_gem_shmem_test_madvise
[01:39:17] [PASSED] drm_gem_shmem_test_purge
[01:39:17] ================== [PASSED] drm_gem_shmem ==================
[01:39:17] === drm_atomic_helper_connector_hdmi_check (23 subtests) ===
[01:39:17] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[01:39:17] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[01:39:17] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[01:39:17] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[01:39:17] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[01:39:17] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[01:39:17] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[01:39:17] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[01:39:17] [PASSED] drm_test_check_disable_connector
[01:39:17] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[01:39:17] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[01:39:17] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[01:39:17] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[01:39:17] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[01:39:17] [PASSED] drm_test_check_output_bpc_dvi
[01:39:17] [PASSED] drm_test_check_output_bpc_format_vic_1
[01:39:17] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[01:39:17] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[01:39:17] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[01:39:17] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[01:39:17] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[01:39:17] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[01:39:17] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[01:39:17] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[01:39:17] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[01:39:17] [PASSED] drm_test_check_broadcast_rgb_value
[01:39:17] [PASSED] drm_test_check_bpc_8_value
[01:39:17] [PASSED] drm_test_check_bpc_10_value
[01:39:17] [PASSED] drm_test_check_bpc_12_value
[01:39:17] [PASSED] drm_test_check_format_value
[01:39:17] [PASSED] drm_test_check_tmds_char_value
[01:39:17] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[01:39:17] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[01:39:17] [PASSED] drm_test_check_mode_valid
[01:39:17] [PASSED] drm_test_check_mode_valid_reject
[01:39:17] [PASSED] drm_test_check_mode_valid_reject_rate
[01:39:17] [PASSED] drm_test_check_mode_valid_reject_max_clock
[01:39:17] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[01:39:17] ================= drm_managed (2 subtests) =================
[01:39:17] [PASSED] drm_test_managed_release_action
[01:39:17] [PASSED] drm_test_managed_run_action
[01:39:17] =================== [PASSED] drm_managed ===================
[01:39:17] =================== drm_mm (6 subtests) ====================
[01:39:17] [PASSED] drm_test_mm_init
[01:39:17] [PASSED] drm_test_mm_debug
[01:39:17] [PASSED] drm_test_mm_align32
[01:39:17] [PASSED] drm_test_mm_align64
[01:39:17] [PASSED] drm_test_mm_lowest
[01:39:17] [PASSED] drm_test_mm_highest
[01:39:17] ===================== [PASSED] drm_mm ======================
[01:39:17] ============= drm_modes_analog_tv (5 subtests) =============
[01:39:17] [PASSED] drm_test_modes_analog_tv_mono_576i
[01:39:17] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[01:39:17] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[01:39:17] [PASSED] drm_test_modes_analog_tv_pal_576i
[01:39:17] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[01:39:17] =============== [PASSED] drm_modes_analog_tv ===============
[01:39:17] ============== drm_plane_helper (2 subtests) ===============
[01:39:17] =============== drm_test_check_plane_state  ================
[01:39:17] [PASSED] clipping_simple
[01:39:17] [PASSED] clipping_rotate_reflect
[01:39:17] [PASSED] positioning_simple
[01:39:17] [PASSED] upscaling
[01:39:17] [PASSED] downscaling
[01:39:17] [PASSED] rounding1
[01:39:17] [PASSED] rounding2
[01:39:17] [PASSED] rounding3
[01:39:17] [PASSED] rounding4
[01:39:17] =========== [PASSED] drm_test_check_plane_state ============
[01:39:17] =========== drm_test_check_invalid_plane_state  ============
[01:39:17] [PASSED] positioning_invalid
[01:39:17] [PASSED] upscaling_invalid
[01:39:17] [PASSED] downscaling_invalid
[01:39:17] ======= [PASSED] drm_test_check_invalid_plane_state ========
[01:39:17] ================ [PASSED] drm_plane_helper =================
[01:39:17] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[01:39:17] ====== drm_test_connector_helper_tv_get_modes_check  =======
[01:39:17] [PASSED] None
[01:39:17] [PASSED] PAL
[01:39:17] [PASSED] NTSC
[01:39:17] [PASSED] Both, NTSC Default
[01:39:17] [PASSED] Both, PAL Default
[01:39:17] [PASSED] Both, NTSC Default, with PAL on command-line
[01:39:17] [PASSED] Both, PAL Default, with NTSC on command-line
[01:39:17] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[01:39:17] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[01:39:17] ================== drm_rect (9 subtests) ===================
[01:39:17] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[01:39:17] [PASSED] drm_test_rect_clip_scaled_not_clipped
[01:39:17] [PASSED] drm_test_rect_clip_scaled_clipped
[01:39:17] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[01:39:17] ================= drm_test_rect_intersect  =================
[01:39:17] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[01:39:17] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[01:39:17] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[01:39:17] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[01:39:17] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[01:39:17] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[01:39:17] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[01:39:17] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[01:39:17] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[01:39:17] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[01:39:17] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[01:39:17] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[01:39:17] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[01:39:17] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[01:39:17] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[01:39:17] ============= [PASSED] drm_test_rect_intersect =============
[01:39:17] ================ drm_test_rect_calc_hscale  ================
[01:39:17] [PASSED] normal use
[01:39:17] [PASSED] out of max range
[01:39:17] [PASSED] out of min range
[01:39:17] [PASSED] zero dst
[01:39:17] [PASSED] negative src
[01:39:17] [PASSED] negative dst
[01:39:17] ============ [PASSED] drm_test_rect_calc_hscale ============
[01:39:17] ================ drm_test_rect_calc_vscale  ================
[01:39:17] [PASSED] normal use
[01:39:17] [PASSED] out of max range
[01:39:17] [PASSED] out of min range
[01:39:17] [PASSED] zero dst
[01:39:17] [PASSED] negative src
[01:39:17] [PASSED] negative dst
[01:39:17] ============ [PASSED] drm_test_rect_calc_vscale ============
[01:39:17] ================== drm_test_rect_rotate  ===================
[01:39:17] [PASSED] reflect-x
[01:39:17] [PASSED] reflect-y
[01:39:17] [PASSED] rotate-0
[01:39:17] [PASSED] rotate-90
[01:39:17] [PASSED] rotate-180
[01:39:17] [PASSED] rotate-270
[01:39:17] ============== [PASSED] drm_test_rect_rotate ===============
[01:39:17] ================ drm_test_rect_rotate_inv  =================
[01:39:17] [PASSED] reflect-x
[01:39:17] [PASSED] reflect-y
[01:39:17] [PASSED] rotate-0
[01:39:17] [PASSED] rotate-90
[01:39:17] [PASSED] rotate-180
[01:39:17] [PASSED] rotate-270
[01:39:17] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[01:39:17] ==================== [PASSED] drm_rect =====================
[01:39:17] ============================================================
[01:39:17] Testing complete. Ran 608 tests: passed: 608
[01:39:17] Elapsed time: 23.023s total, 1.688s configuring, 21.119s building, 0.173s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[01:39:17] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:39:19] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[01:39:26] Starting KUnit Kernel (1/1)...
[01:39:26] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:39:26] ================= ttm_device (5 subtests) ==================
[01:39:26] [PASSED] ttm_device_init_basic
[01:39:26] [PASSED] ttm_device_init_multiple
[01:39:26] [PASSED] ttm_device_fini_basic
[01:39:26] [PASSED] ttm_device_init_no_vma_man
[01:39:26] ================== ttm_device_init_pools  ==================
[01:39:26] [PASSED] No DMA allocations, no DMA32 required
[01:39:26] [PASSED] DMA allocations, DMA32 required
[01:39:26] [PASSED] No DMA allocations, DMA32 required
[01:39:26] [PASSED] DMA allocations, no DMA32 required
[01:39:26] ============== [PASSED] ttm_device_init_pools ==============
[01:39:26] =================== [PASSED] ttm_device ====================
[01:39:26] ================== ttm_pool (8 subtests) ===================
[01:39:26] ================== ttm_pool_alloc_basic  ===================
[01:39:26] [PASSED] One page
[01:39:26] [PASSED] More than one page
[01:39:26] [PASSED] Above the allocation limit
[01:39:26] [PASSED] One page, with coherent DMA mappings enabled
[01:39:26] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[01:39:26] ============== [PASSED] ttm_pool_alloc_basic ===============
[01:39:26] ============== ttm_pool_alloc_basic_dma_addr  ==============
[01:39:26] [PASSED] One page
[01:39:26] [PASSED] More than one page
[01:39:26] [PASSED] Above the allocation limit
[01:39:26] [PASSED] One page, with coherent DMA mappings enabled
[01:39:26] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[01:39:26] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[01:39:26] [PASSED] ttm_pool_alloc_order_caching_match
[01:39:26] [PASSED] ttm_pool_alloc_caching_mismatch
[01:39:26] [PASSED] ttm_pool_alloc_order_mismatch
[01:39:26] [PASSED] ttm_pool_free_dma_alloc
[01:39:26] [PASSED] ttm_pool_free_no_dma_alloc
[01:39:26] [PASSED] ttm_pool_fini_basic
[01:39:26] ==================== [PASSED] ttm_pool =====================
[01:39:26] ================ ttm_resource (8 subtests) =================
[01:39:26] ================= ttm_resource_init_basic  =================
[01:39:26] [PASSED] Init resource in TTM_PL_SYSTEM
[01:39:26] [PASSED] Init resource in TTM_PL_VRAM
[01:39:26] [PASSED] Init resource in a private placement
[01:39:26] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[01:39:26] ============= [PASSED] ttm_resource_init_basic =============
[01:39:26] [PASSED] ttm_resource_init_pinned
[01:39:26] [PASSED] ttm_resource_fini_basic
[01:39:26] [PASSED] ttm_resource_manager_init_basic
[01:39:26] [PASSED] ttm_resource_manager_usage_basic
[01:39:26] [PASSED] ttm_resource_manager_set_used_basic
[01:39:26] [PASSED] ttm_sys_man_alloc_basic
[01:39:26] [PASSED] ttm_sys_man_free_basic
[01:39:26] ================== [PASSED] ttm_resource ===================
[01:39:26] =================== ttm_tt (15 subtests) ===================
[01:39:26] ==================== ttm_tt_init_basic  ====================
[01:39:26] [PASSED] Page-aligned size
[01:39:26] [PASSED] Extra pages requested
[01:39:26] ================ [PASSED] ttm_tt_init_basic ================
[01:39:26] [PASSED] ttm_tt_init_misaligned
[01:39:26] [PASSED] ttm_tt_fini_basic
[01:39:26] [PASSED] ttm_tt_fini_sg
[01:39:26] [PASSED] ttm_tt_fini_shmem
[01:39:26] [PASSED] ttm_tt_create_basic
[01:39:26] [PASSED] ttm_tt_create_invalid_bo_type
[01:39:26] [PASSED] ttm_tt_create_ttm_exists
[01:39:26] [PASSED] ttm_tt_create_failed
[01:39:26] [PASSED] ttm_tt_destroy_basic
[01:39:26] [PASSED] ttm_tt_populate_null_ttm
[01:39:26] [PASSED] ttm_tt_populate_populated_ttm
[01:39:26] [PASSED] ttm_tt_unpopulate_basic
[01:39:26] [PASSED] ttm_tt_unpopulate_empty_ttm
[01:39:26] [PASSED] ttm_tt_swapin_basic
[01:39:26] ===================== [PASSED] ttm_tt ======================
[01:39:26] =================== ttm_bo (14 subtests) ===================
[01:39:26] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[01:39:26] [PASSED] Cannot be interrupted and sleeps
[01:39:26] [PASSED] Cannot be interrupted, locks straight away
[01:39:26] [PASSED] Can be interrupted, sleeps
[01:39:26] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[01:39:26] [PASSED] ttm_bo_reserve_locked_no_sleep
[01:39:26] [PASSED] ttm_bo_reserve_no_wait_ticket
[01:39:26] [PASSED] ttm_bo_reserve_double_resv
[01:39:26] [PASSED] ttm_bo_reserve_interrupted
[01:39:26] [PASSED] ttm_bo_reserve_deadlock
[01:39:26] [PASSED] ttm_bo_unreserve_basic
[01:39:26] [PASSED] ttm_bo_unreserve_pinned
[01:39:26] [PASSED] ttm_bo_unreserve_bulk
[01:39:26] [PASSED] ttm_bo_put_basic
[01:39:26] [PASSED] ttm_bo_put_shared_resv
[01:39:26] [PASSED] ttm_bo_pin_basic
[01:39:26] [PASSED] ttm_bo_pin_unpin_resource
[01:39:26] [PASSED] ttm_bo_multiple_pin_one_unpin
[01:39:26] ===================== [PASSED] ttm_bo ======================
[01:39:26] ============== ttm_bo_validate (22 subtests) ===============
[01:39:26] ============== ttm_bo_init_reserved_sys_man  ===============
[01:39:26] [PASSED] Buffer object for userspace
[01:39:26] [PASSED] Kernel buffer object
[01:39:26] [PASSED] Shared buffer object
[01:39:26] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[01:39:26] ============== ttm_bo_init_reserved_mock_man  ==============
[01:39:26] [PASSED] Buffer object for userspace
[01:39:26] [PASSED] Kernel buffer object
[01:39:26] [PASSED] Shared buffer object
[01:39:26] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[01:39:26] [PASSED] ttm_bo_init_reserved_resv
[01:39:26] ================== ttm_bo_validate_basic  ==================
[01:39:26] [PASSED] Buffer object for userspace
[01:39:26] [PASSED] Kernel buffer object
[01:39:26] [PASSED] Shared buffer object
[01:39:26] ============== [PASSED] ttm_bo_validate_basic ==============
[01:39:26] [PASSED] ttm_bo_validate_invalid_placement
[01:39:26] ============= ttm_bo_validate_same_placement  ==============
[01:39:26] [PASSED] System manager
[01:39:26] [PASSED] VRAM manager
[01:39:26] ========= [PASSED] ttm_bo_validate_same_placement ==========
[01:39:26] [PASSED] ttm_bo_validate_failed_alloc
[01:39:26] [PASSED] ttm_bo_validate_pinned
[01:39:26] [PASSED] ttm_bo_validate_busy_placement
[01:39:26] ================ ttm_bo_validate_multihop  =================
[01:39:26] [PASSED] Buffer object for userspace
[01:39:26] [PASSED] Kernel buffer object
[01:39:26] [PASSED] Shared buffer object
[01:39:26] ============ [PASSED] ttm_bo_validate_multihop =============
[01:39:26] ========== ttm_bo_validate_no_placement_signaled  ==========
[01:39:26] [PASSED] Buffer object in system domain, no page vector
[01:39:26] [PASSED] Buffer object in system domain with an existing page vector
[01:39:26] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[01:39:26] ======== ttm_bo_validate_no_placement_not_signaled  ========
[01:39:26] [PASSED] Buffer object for userspace
[01:39:26] [PASSED] Kernel buffer object
[01:39:26] [PASSED] Shared buffer object
[01:39:26] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[01:39:26] [PASSED] ttm_bo_validate_move_fence_signaled
[01:39:27] ========= ttm_bo_validate_move_fence_not_signaled  =========
[01:39:27] [PASSED] Waits for GPU
[01:39:27] [PASSED] Tries to lock straight away
[01:39:27] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[01:39:27] [PASSED] ttm_bo_validate_swapout
[01:39:27] [PASSED] ttm_bo_validate_happy_evict
[01:39:27] [PASSED] ttm_bo_validate_all_pinned_evict
[01:39:27] [PASSED] ttm_bo_validate_allowed_only_evict
[01:39:27] [PASSED] ttm_bo_validate_deleted_evict
[01:39:27] [PASSED] ttm_bo_validate_busy_domain_evict
[01:39:27] [PASSED] ttm_bo_validate_evict_gutting
[01:39:27] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[01:39:27] ================= [PASSED] ttm_bo_validate =================
[01:39:27] ============================================================
[01:39:27] Testing complete. Ran 102 tests: passed: 102
[01:39:27] Elapsed time: 10.074s total, 1.689s configuring, 7.717s building, 0.569s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


