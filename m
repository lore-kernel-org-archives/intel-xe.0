Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E00C5B552
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 06:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB47810E91F;
	Wed,  4 Jun 2025 06:16:24 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E8410E91F;
 Wed,  4 Jun 2025 06:16:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/i915/flipq=3A_Rough_flip_q?=
 =?utf-8?q?ueue_implementation_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Jun 2025 06:16:24 -0000
Message-ID: <174901778400.47115.4725489740097413502@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603140836.21432-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250603140836.21432-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/flipq: Rough flip queue implementation (rev5)
URL   : https://patchwork.freedesktop.org/series/149109/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[06:15:18] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:15:23] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[06:15:49] Starting KUnit Kernel (1/1)...
[06:15:49] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[06:15:49] ================== guc_buf (11 subtests) ===================
[06:15:49] [PASSED] test_smallest
[06:15:49] [PASSED] test_largest
[06:15:49] [PASSED] test_granular
[06:15:49] [PASSED] test_unique
[06:15:49] [PASSED] test_overlap
[06:15:49] [PASSED] test_reusable
[06:15:49] [PASSED] test_too_big
[06:15:49] [PASSED] test_flush
[06:15:49] [PASSED] test_lookup
[06:15:49] [PASSED] test_data
[06:15:49] [PASSED] test_class
[06:15:49] ===================== [PASSED] guc_buf =====================
[06:15:49] =================== guc_dbm (7 subtests) ===================
[06:15:49] [PASSED] test_empty
[06:15:49] [PASSED] test_default
[06:15:49] ======================== test_size  ========================
[06:15:49] [PASSED] 4
[06:15:49] [PASSED] 8
[06:15:49] [PASSED] 32
[06:15:49] [PASSED] 256
[06:15:49] ==================== [PASSED] test_size ====================
[06:15:49] ======================= test_reuse  ========================
[06:15:49] [PASSED] 4
[06:15:49] [PASSED] 8
[06:15:49] [PASSED] 32
[06:15:49] [PASSED] 256
[06:15:49] =================== [PASSED] test_reuse ====================
[06:15:49] =================== test_range_overlap  ====================
[06:15:49] [PASSED] 4
[06:15:49] [PASSED] 8
[06:15:49] [PASSED] 32
[06:15:49] [PASSED] 256
[06:15:49] =============== [PASSED] test_range_overlap ================
[06:15:49] =================== test_range_compact  ====================
[06:15:49] [PASSED] 4
[06:15:49] [PASSED] 8
[06:15:49] [PASSED] 32
[06:15:49] [PASSED] 256
[06:15:49] =============== [PASSED] test_range_compact ================
[06:15:49] ==================== test_range_spare  =====================
[06:15:49] [PASSED] 4
[06:15:49] [PASSED] 8
[06:15:49] [PASSED] 32
[06:15:49] [PASSED] 256
[06:15:49] ================ [PASSED] test_range_spare =================
[06:15:49] ===================== [PASSED] guc_dbm =====================
[06:15:49] =================== guc_idm (6 subtests) ===================
[06:15:49] [PASSED] bad_init
[06:15:49] [PASSED] no_init
[06:15:49] [PASSED] init_fini
[06:15:49] [PASSED] check_used
[06:15:49] [PASSED] check_quota
[06:15:49] [PASSED] check_all
[06:15:49] ===================== [PASSED] guc_idm =====================
[06:15:49] ================== no_relay (3 subtests) ===================
[06:15:49] [PASSED] xe_drops_guc2pf_if_not_ready
[06:15:49] [PASSED] xe_drops_guc2vf_if_not_ready
[06:15:49] [PASSED] xe_rejects_send_if_not_ready
[06:15:49] ==================== [PASSED] no_relay =====================
[06:15:49] ================== pf_relay (14 subtests) ==================
[06:15:49] [PASSED] pf_rejects_guc2pf_too_short
[06:15:49] [PASSED] pf_rejects_guc2pf_too_long
[06:15:49] [PASSED] pf_rejects_guc2pf_no_payload
[06:15:49] [PASSED] pf_fails_no_payload
[06:15:49] [PASSED] pf_fails_bad_origin
[06:15:49] [PASSED] pf_fails_bad_type
[06:15:49] [PASSED] pf_txn_reports_error
[06:15:49] [PASSED] pf_txn_sends_pf2guc
[06:15:49] [PASSED] pf_sends_pf2guc
[06:15:49] [SKIPPED] pf_loopback_nop
[06:15:49] [SKIPPED] pf_loopback_echo
[06:15:49] [SKIPPED] pf_loopback_fail
[06:15:49] [SKIPPED] pf_loopback_busy
[06:15:49] [SKIPPED] pf_loopback_retry
[06:15:49] ==================== [PASSED] pf_relay =====================
[06:15:49] ================== vf_relay (3 subtests) ===================
[06:15:49] [PASSED] vf_rejects_guc2vf_too_short
[06:15:49] [PASSED] vf_rejects_guc2vf_too_long
[06:15:49] [PASSED] vf_rejects_guc2vf_no_payload
[06:15:49] ==================== [PASSED] vf_relay =====================
[06:15:49] ================= pf_service (11 subtests) =================
[06:15:49] [PASSED] pf_negotiate_any
[06:15:49] [PASSED] pf_negotiate_base_match
[06:15:49] [PASSED] pf_negotiate_base_newer
[06:15:49] [PASSED] pf_negotiate_base_next
[06:15:49] [SKIPPED] pf_negotiate_base_older
[06:15:49] [PASSED] pf_negotiate_base_prev
[06:15:49] [PASSED] pf_negotiate_latest_match
[06:15:49] [PASSED] pf_negotiate_latest_newer
[06:15:49] [PASSED] pf_negotiate_latest_next
[06:15:49] [SKIPPED] pf_negotiate_latest_older
[06:15:49] [SKIPPED] pf_negotiate_latest_prev
[06:15:49] =================== [PASSED] pf_service ====================
[06:15:49] ===================== lmtt (1 subtest) =====================
[06:15:49] ======================== test_ops  =========================
[06:15:49] [PASSED] 2-level
[06:15:49] [PASSED] multi-level
[06:15:49] ==================== [PASSED] test_ops =====================
[06:15:49] ====================== [PASSED] lmtt =======================
[06:15:49] =================== xe_mocs (2 subtests) ===================
[06:15:49] ================ xe_live_mocs_kernel_kunit  ================
[06:15:49] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[06:15:49] ================ xe_live_mocs_reset_kunit  =================
[06:15:49] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[06:15:49] ==================== [SKIPPED] xe_mocs =====================
[06:15:49] ================= xe_migrate (2 subtests) ==================
[06:15:49] ================= xe_migrate_sanity_kunit  =================
[06:15:49] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[06:15:49] ================== xe_validate_ccs_kunit  ==================
[06:15:49] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[06:15:49] =================== [SKIPPED] xe_migrate ===================
[06:15:49] ================== xe_dma_buf (1 subtest) ==================
[06:15:49] ==================== xe_dma_buf_kunit  =====================
[06:15:49] ================ [SKIPPED] xe_dma_buf_kunit ================
[06:15:49] =================== [SKIPPED] xe_dma_buf ===================
[06:15:49] ================= xe_bo_shrink (1 subtest) =================
[06:15:49] =================== xe_bo_shrink_kunit  ====================
[06:15:49] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[06:15:49] ================== [SKIPPED] xe_bo_shrink ==================
[06:15:49] ==================== xe_bo (2 subtests) ====================
[06:15:49] ================== xe_ccs_migrate_kunit  ===================
[06:15:49] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[06:15:49] ==================== xe_bo_evict_kunit  ====================
[06:15:49] =============== [SKIPPED] xe_bo_evict_kunit ================
[06:15:49] ===================== [SKIPPED] xe_bo ======================
[06:15:49] ==================== args (11 subtests) ====================
[06:15:49] [PASSED] count_args_test
[06:15:49] [PASSED] call_args_example
[06:15:49] [PASSED] call_args_test
[06:15:49] [PASSED] drop_first_arg_example
[06:15:49] [PASSED] drop_first_arg_test
[06:15:49] [PASSED] first_arg_example
[06:15:49] [PASSED] first_arg_test
[06:15:49] [PASSED] last_arg_example
[06:15:49] [PASSED] last_arg_test
[06:15:49] [PASSED] pick_arg_example
[06:15:49] [PASSED] sep_comma_example
[06:15:49] ====================== [PASSED] args =======================
[06:15:49] =================== xe_pci (2 subtests) ====================
[06:15:49] [PASSED] xe_gmdid_graphics_ip
[06:15:49] [PASSED] xe_gmdid_media_ip
[06:15:49] ===================== [PASSED] xe_pci ======================
[06:15:49] =================== xe_rtp (2 subtests) ====================
[06:15:49] =============== xe_rtp_process_to_sr_tests  ================
[06:15:49] [PASSED] coalesce-same-reg
[06:15:49] [PASSED] no-match-no-add
[06:15:49] [PASSED] match-or
[06:15:49] [PASSED] match-or-xfail
[06:15:49] [PASSED] no-match-no-add-multiple-rules
[06:15:49] [PASSED] two-regs-two-entries
[06:15:49] [PASSED] clr-one-set-other
[06:15:49] [PASSED] set-field
[06:15:49] [PASSED] conflict-duplicate
[06:15:49] [PASSED] conflict-not-disjoint
stty: 'standard input': Inappropriate ioctl for device
[06:15:49] [PASSED] conflict-reg-type
[06:15:49] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[06:15:49] ================== xe_rtp_process_tests  ===================
[06:15:49] [PASSED] active1
[06:15:49] [PASSED] active2
[06:15:49] [PASSED] active-inactive
[06:15:49] [PASSED] inactive-active
[06:15:49] [PASSED] inactive-1st_or_active-inactive
[06:15:49] [PASSED] inactive-2nd_or_active-inactive
[06:15:49] [PASSED] inactive-last_or_active-inactive
[06:15:49] [PASSED] inactive-no_or_active-inactive
[06:15:49] ============== [PASSED] xe_rtp_process_tests ===============
[06:15:49] ===================== [PASSED] xe_rtp ======================
[06:15:49] ==================== xe_wa (1 subtest) =====================
[06:15:49] ======================== xe_wa_gt  =========================
[06:15:49] [PASSED] TIGERLAKE (B0)
[06:15:49] [PASSED] DG1 (A0)
[06:15:49] [PASSED] DG1 (B0)
[06:15:49] [PASSED] ALDERLAKE_S (A0)
[06:15:49] [PASSED] ALDERLAKE_S (B0)
[06:15:49] [PASSED] ALDERLAKE_S (C0)
[06:15:49] [PASSED] ALDERLAKE_S (D0)
[06:15:49] [PASSED] ALDERLAKE_P (A0)
[06:15:49] [PASSED] ALDERLAKE_P (B0)
[06:15:49] [PASSED] ALDERLAKE_P (C0)
[06:15:49] [PASSED] ALDERLAKE_S_RPLS (D0)
[06:15:49] [PASSED] ALDERLAKE_P_RPLU (E0)
[06:15:49] [PASSED] DG2_G10 (C0)
[06:15:49] [PASSED] DG2_G11 (B1)
[06:15:49] [PASSED] DG2_G12 (A1)
[06:15:49] [PASSED] METEORLAKE (g:A0, m:A0)
[06:15:49] [PASSED] METEORLAKE (g:A0, m:A0)
[06:15:49] [PASSED] METEORLAKE (g:A0, m:A0)
[06:15:49] [PASSED] LUNARLAKE (g:A0, m:A0)
[06:15:49] [PASSED] LUNARLAKE (g:B0, m:A0)
[06:15:49] [PASSED] BATTLEMAGE (g:A0, m:A1)
[06:15:49] ==================== [PASSED] xe_wa_gt =====================
[06:15:49] ====================== [PASSED] xe_wa ======================
[06:15:49] ============================================================
[06:15:49] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[06:15:49] Elapsed time: 31.113s total, 4.175s configuring, 26.622s building, 0.299s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[06:15:50] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:15:51] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[06:16:13] Starting KUnit Kernel (1/1)...
[06:16:13] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[06:16:13] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[06:16:13] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[06:16:13] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[06:16:13] =========== drm_validate_clone_mode (2 subtests) ===========
[06:16:13] ============== drm_test_check_in_clone_mode  ===============
[06:16:13] [PASSED] in_clone_mode
[06:16:13] [PASSED] not_in_clone_mode
[06:16:13] ========== [PASSED] drm_test_check_in_clone_mode ===========
[06:16:13] =============== drm_test_check_valid_clones  ===============
[06:16:13] [PASSED] not_in_clone_mode
[06:16:13] [PASSED] valid_clone
[06:16:13] [PASSED] invalid_clone
[06:16:13] =========== [PASSED] drm_test_check_valid_clones ===========
[06:16:13] ============= [PASSED] drm_validate_clone_mode =============
[06:16:13] ============= drm_validate_modeset (1 subtest) =============
[06:16:13] [PASSED] drm_test_check_connector_changed_modeset
[06:16:13] ============== [PASSED] drm_validate_modeset ===============
[06:16:13] ====== drm_test_bridge_get_current_state (2 subtests) ======
[06:16:13] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[06:16:13] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[06:16:13] ======== [PASSED] drm_test_bridge_get_current_state ========
[06:16:13] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[06:16:13] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[06:16:13] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[06:16:13] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[06:16:13] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[06:16:13] ================== drm_buddy (7 subtests) ==================
[06:16:13] [PASSED] drm_test_buddy_alloc_limit
[06:16:13] [PASSED] drm_test_buddy_alloc_optimistic
[06:16:13] [PASSED] drm_test_buddy_alloc_pessimistic
[06:16:13] [PASSED] drm_test_buddy_alloc_pathological
[06:16:13] [PASSED] drm_test_buddy_alloc_contiguous
[06:16:13] [PASSED] drm_test_buddy_alloc_clear
[06:16:13] [PASSED] drm_test_buddy_alloc_range_bias
[06:16:13] ==================== [PASSED] drm_buddy ====================
[06:16:13] ============= drm_cmdline_parser (40 subtests) =============
[06:16:13] [PASSED] drm_test_cmdline_force_d_only
[06:16:13] [PASSED] drm_test_cmdline_force_D_only_dvi
[06:16:13] [PASSED] drm_test_cmdline_force_D_only_hdmi
[06:16:13] [PASSED] drm_test_cmdline_force_D_only_not_digital
[06:16:13] [PASSED] drm_test_cmdline_force_e_only
[06:16:13] [PASSED] drm_test_cmdline_res
[06:16:13] [PASSED] drm_test_cmdline_res_vesa
[06:16:13] [PASSED] drm_test_cmdline_res_vesa_rblank
[06:16:13] [PASSED] drm_test_cmdline_res_rblank
[06:16:13] [PASSED] drm_test_cmdline_res_bpp
[06:16:13] [PASSED] drm_test_cmdline_res_refresh
[06:16:13] [PASSED] drm_test_cmdline_res_bpp_refresh
[06:16:13] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[06:16:13] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[06:16:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[06:16:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[06:16:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[06:16:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[06:16:13] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[06:16:13] [PASSED] drm_test_cmdline_res_margins_force_on
[06:16:13] [PASSED] drm_test_cmdline_res_vesa_margins
[06:16:13] [PASSED] drm_test_cmdline_name
[06:16:13] [PASSED] drm_test_cmdline_name_bpp
[06:16:13] [PASSED] drm_test_cmdline_name_option
[06:16:13] [PASSED] drm_test_cmdline_name_bpp_option
[06:16:13] [PASSED] drm_test_cmdline_rotate_0
[06:16:13] [PASSED] drm_test_cmdline_rotate_90
[06:16:13] [PASSED] drm_test_cmdline_rotate_180
[06:16:13] [PASSED] drm_test_cmdline_rotate_270
[06:16:13] [PASSED] drm_test_cmdline_hmirror
[06:16:13] [PASSED] drm_test_cmdline_vmirror
[06:16:13] [PASSED] drm_test_cmdline_margin_options
[06:16:13] [PASSED] drm_test_cmdline_multiple_options
[06:16:13] [PASSED] drm_test_cmdline_bpp_extra_and_option
[06:16:13] [PASSED] drm_test_cmdline_extra_and_option
[06:16:13] [PASSED] drm_test_cmdline_freestanding_options
[06:16:13] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[06:16:13] [PASSED] drm_test_cmdline_panel_orientation
[06:16:13] ================ drm_test_cmdline_invalid  =================
[06:16:13] [PASSED] margin_only
[06:16:13] [PASSED] interlace_only
[06:16:13] [PASSED] res_missing_x
[06:16:13] [PASSED] res_missing_y
[06:16:13] [PASSED] res_bad_y
[06:16:13] [PASSED] res_missing_y_bpp
[06:16:13] [PASSED] res_bad_bpp
[06:16:13] [PASSED] res_bad_refresh
[06:16:13] [PASSED] res_bpp_refresh_force_on_off
[06:16:13] [PASSED] res_invalid_mode
[06:16:13] [PASSED] res_bpp_wrong_place_mode
[06:16:13] [PASSED] name_bpp_refresh
[06:16:13] [PASSED] name_refresh
[06:16:13] [PASSED] name_refresh_wrong_mode
[06:16:13] [PASSED] name_refresh_invalid_mode
[06:16:13] [PASSED] rotate_multiple
[06:16:13] [PASSED] rotate_invalid_val
[06:16:13] [PASSED] rotate_truncated
[06:16:13] [PASSED] invalid_option
[06:16:13] [PASSED] invalid_tv_option
[06:16:13] [PASSED] truncated_tv_option
[06:16:13] ============ [PASSED] drm_test_cmdline_invalid =============
[06:16:13] =============== drm_test_cmdline_tv_options  ===============
[06:16:13] [PASSED] NTSC
[06:16:13] [PASSED] NTSC_443
[06:16:13] [PASSED] NTSC_J
[06:16:13] [PASSED] PAL
[06:16:13] [PASSED] PAL_M
[06:16:13] [PASSED] PAL_N
[06:16:13] [PASSED] SECAM
[06:16:13] [PASSED] MONO_525
[06:16:13] [PASSED] MONO_625
[06:16:13] =========== [PASSED] drm_test_cmdline_tv_options ===========
[06:16:13] =============== [PASSED] drm_cmdline_parser ================
[06:16:13] ========== drmm_connector_hdmi_init (20 subtests) ==========
[06:16:13] [PASSED] drm_test_connector_hdmi_init_valid
[06:16:13] [PASSED] drm_test_connector_hdmi_init_bpc_8
[06:16:13] [PASSED] drm_test_connector_hdmi_init_bpc_10
[06:16:13] [PASSED] drm_test_connector_hdmi_init_bpc_12
[06:16:13] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[06:16:13] [PASSED] drm_test_connector_hdmi_init_bpc_null
[06:16:13] [PASSED] drm_test_connector_hdmi_init_formats_empty
[06:16:13] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[06:16:13] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[06:16:13] [PASSED] supported_formats=0x9 yuv420_allowed=1
[06:16:13] [PASSED] supported_formats=0x9 yuv420_allowed=0
[06:16:13] [PASSED] supported_formats=0x3 yuv420_allowed=1
[06:16:13] [PASSED] supported_formats=0x3 yuv420_allowed=0
[06:16:13] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[06:16:13] [PASSED] drm_test_connector_hdmi_init_null_ddc
[06:16:13] [PASSED] drm_test_connector_hdmi_init_null_product
[06:16:13] [PASSED] drm_test_connector_hdmi_init_null_vendor
[06:16:13] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[06:16:13] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[06:16:13] [PASSED] drm_test_connector_hdmi_init_product_valid
[06:16:13] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[06:16:13] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[06:16:13] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[06:16:13] ========= drm_test_connector_hdmi_init_type_valid  =========
[06:16:13] [PASSED] HDMI-A
[06:16:13] [PASSED] HDMI-B
[06:16:13] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[06:16:13] ======== drm_test_connector_hdmi_init_type_invalid  ========
[06:16:13] [PASSED] Unknown
[06:16:13] [PASSED] VGA
[06:16:13] [PASSED] DVI-I
[06:16:13] [PASSED] DVI-D
[06:16:13] [PASSED] DVI-A
[06:16:13] [PASSED] Composite
[06:16:13] [PASSED] SVIDEO
[06:16:13] [PASSED] LVDS
[06:16:13] [PASSED] Component
[06:16:13] [PASSED] DIN
[06:16:13] [PASSED] DP
[06:16:13] [PASSED] TV
[06:16:13] [PASSED] eDP
[06:16:13] [PASSED] Virtual
[06:16:13] [PASSED] DSI
[06:16:13] [PASSED] DPI
[06:16:13] [PASSED] Writeback
[06:16:13] [PASSED] SPI
[06:16:13] [PASSED] USB
[06:16:13] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[06:16:13] ============ [PASSED] drmm_connector_hdmi_init =============
[06:16:13] ============= drmm_connector_init (3 subtests) =============
[06:16:13] [PASSED] drm_test_drmm_connector_init
[06:16:13] [PASSED] drm_test_drmm_connector_init_null_ddc
[06:16:13] ========= drm_test_drmm_connector_init_type_valid  =========
[06:16:13] [PASSED] Unknown
[06:16:13] [PASSED] VGA
[06:16:13] [PASSED] DVI-I
[06:16:13] [PASSED] DVI-D
[06:16:13] [PASSED] DVI-A
[06:16:13] [PASSED] Composite
[06:16:13] [PASSED] SVIDEO
[06:16:13] [PASSED] LVDS
[06:16:13] [PASSED] Component
[06:16:13] [PASSED] DIN
[06:16:13] [PASSED] DP
[06:16:13] [PASSED] HDMI-A
[06:16:13] [PASSED] HDMI-B
[06:16:13] [PASSED] TV
[06:16:13] [PASSED] eDP
[06:16:13] [PASSED] Virtual
[06:16:13] [PASSED] DSI
[06:16:13] [PASSED] DPI
[06:16:13] [PASSED] Writeback
[06:16:13] [PASSED] SPI
[06:16:13] [PASSED] USB
[06:16:13] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[06:16:13] =============== [PASSED] drmm_connector_init ===============
[06:16:13] ========= drm_connector_dynamic_init (6 subtests) ==========
[06:16:13] [PASSED] drm_test_drm_connector_dynamic_init
[06:16:13] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[06:16:13] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[06:16:13] [PASSED] drm_test_drm_connector_dynamic_init_properties
[06:16:13] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[06:16:13] [PASSED] Unknown
[06:16:13] [PASSED] VGA
[06:16:13] [PASSED] DVI-I
[06:16:13] [PASSED] DVI-D
[06:16:13] [PASSED] DVI-A
[06:16:13] [PASSED] Composite
[06:16:13] [PASSED] SVIDEO
[06:16:13] [PASSED] LVDS
[06:16:13] [PASSED] Component
[06:16:13] [PASSED] DIN
[06:16:13] [PASSED] DP
[06:16:13] [PASSED] HDMI-A
[06:16:13] [PASSED] HDMI-B
[06:16:13] [PASSED] TV
[06:16:13] [PASSED] eDP
[06:16:13] [PASSED] Virtual
[06:16:13] [PASSED] DSI
[06:16:13] [PASSED] DPI
[06:16:13] [PASSED] Writeback
[06:16:13] [PASSED] SPI
[06:16:13] [PASSED] USB
[06:16:13] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[06:16:13] ======== drm_test_drm_connector_dynamic_init_name  =========
[06:16:13] [PASSED] Unknown
[06:16:13] [PASSED] VGA
[06:16:13] [PASSED] DVI-I
[06:16:13] [PASSED] DVI-D
[06:16:13] [PASSED] DVI-A
[06:16:13] [PASSED] Composite
[06:16:13] [PASSED] SVIDEO
[06:16:13] [PASSED] LVDS
[06:16:13] [PASSED] Component
[06:16:13] [PASSED] DIN
[06:16:13] [PASSED] DP
[06:16:13] [PASSED] HDMI-A
[06:16:13] [PASSED] HDMI-B
[06:16:13] [PASSED] TV
[06:16:13] [PASSED] eDP
[06:16:13] [PASSED] Virtual
[06:16:13] [PASSED] DSI
[06:16:13] [PASSED] DPI
[06:16:13] [PASSED] Writeback
[06:16:13] [PASSED] SPI
[06:16:13] [PASSED] USB
[06:16:13] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[06:16:13] =========== [PASSED] drm_connector_dynamic_init ============
[06:16:13] ==== drm_connector_dynamic_register_early (4 subtests) =====
[06:16:13] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[06:16:13] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[06:16:13] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[06:16:13] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[06:16:13] ====== [PASSED] drm_connector_dynamic_register_early =======
[06:16:13] ======= drm_connector_dynamic_register (7 subtests) ========
[06:16:13] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[06:16:13] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[06:16:13] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[06:16:13] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[06:16:13] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[06:16:13] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[06:16:13] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[06:16:13] ========= [PASSED] drm_connector_dynamic_register ==========
[06:16:13] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[06:16:13] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[06:16:13] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[06:16:13] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[06:16:13] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[06:16:13] ========== drm_test_get_tv_mode_from_name_valid  ===========
[06:16:13] [PASSED] NTSC
[06:16:13] [PASSED] NTSC-443
[06:16:13] [PASSED] NTSC-J
[06:16:13] [PASSED] PAL
[06:16:13] [PASSED] PAL-M
[06:16:13] [PASSED] PAL-N
[06:16:13] [PASSED] SECAM
[06:16:13] [PASSED] Mono
[06:16:13] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[06:16:13] [PASSED] drm_test_get_tv_mode_from_name_truncated
[06:16:13] ============ [PASSED] drm_get_tv_mode_from_name ============
[06:16:13] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[06:16:13] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[06:16:13] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[06:16:13] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[06:16:13] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[06:16:13] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[06:16:13] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[06:16:13] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[06:16:13] [PASSED] VIC 96
[06:16:13] [PASSED] VIC 97
[06:16:13] [PASSED] VIC 101
[06:16:13] [PASSED] VIC 102
[06:16:13] [PASSED] VIC 106
[06:16:13] [PASSED] VIC 107
[06:16:13] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[06:16:13] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[06:16:13] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[06:16:13] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[06:16:13] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[06:16:13] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[06:16:13] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[06:16:13] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[06:16:13] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[06:16:13] [PASSED] Automatic
[06:16:13] [PASSED] Full
[06:16:13] [PASSED] Limited 16:235
[06:16:13] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[06:16:13] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[06:16:13] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[06:16:13] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[06:16:13] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[06:16:13] [PASSED] RGB
[06:16:13] [PASSED] YUV 4:2:0
[06:16:13] [PASSED] YUV 4:2:2
[06:16:13] [PASSED] YUV 4:4:4
[06:16:13] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[06:16:13] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[06:16:13] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[06:16:13] ============= drm_damage_helper (21 subtests) ==============
[06:16:13] [PASSED] drm_test_damage_iter_no_damage
[06:16:13] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[06:16:13] [PASSED] drm_test_damage_iter_no_damage_src_moved
[06:16:13] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[06:16:13] [PASSED] drm_test_damage_iter_no_damage_not_visible
[06:16:13] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[06:16:13] [PASSED] drm_test_damage_iter_no_damage_no_fb
[06:16:13] [PASSED] drm_test_damage_iter_simple_damage
[06:16:13] [PASSED] drm_test_damage_iter_single_damage
[06:16:13] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[06:16:13] [PASSED] drm_test_damage_iter_single_damage_outside_src
[06:16:13] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[06:16:13] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[06:16:13] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[06:16:13] [PASSED] drm_test_damage_iter_single_damage_src_moved
[06:16:13] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[06:16:13] [PASSED] drm_test_damage_iter_damage
[06:16:13] [PASSED] drm_test_damage_iter_damage_one_intersect
[06:16:13] [PASSED] drm_test_damage_iter_damage_one_outside
[06:16:13] [PASSED] drm_test_damage_iter_damage_src_moved
[06:16:13] [PASSED] drm_test_damage_iter_damage_not_visible
[06:16:13] ================ [PASSED] drm_damage_helper ================
[06:16:13] ============== drm_dp_mst_helper (3 subtests) ==============
[06:16:13] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[06:16:13] [PASSED] Clock 154000 BPP 30 DSC disabled
[06:16:13] [PASSED] Clock 234000 BPP 30 DSC disabled
[06:16:13] [PASSED] Clock 297000 BPP 24 DSC disabled
[06:16:13] [PASSED] Clock 332880 BPP 24 DSC enabled
[06:16:13] [PASSED] Clock 324540 BPP 24 DSC enabled
[06:16:13] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[06:16:13] ============== drm_test_dp_mst_calc_pbn_div  ===============
[06:16:13] [PASSED] Link rate 2000000 lane count 4
[06:16:13] [PASSED] Link rate 2000000 lane count 2
[06:16:13] [PASSED] Link rate 2000000 lane count 1
[06:16:13] [PASSED] Link rate 1350000 lane count 4
[06:16:13] [PASSED] Link rate 1350000 lane count 2
[06:16:13] [PASSED] Link rate 1350000 lane count 1
[06:16:13] [PASSED] Link rate 1000000 lane count 4
[06:16:13] [PASSED] Link rate 1000000 lane count 2
[06:16:13] [PASSED] Link rate 1000000 lane count 1
[06:16:13] [PASSED] Link rate 810000 lane count 4
[06:16:13] [PASSED] Link rate 810000 lane count 2
[06:16:13] [PASSED] Link rate 810000 lane count 1
[06:16:13] [PASSED] Link rate 540000 lane count 4
[06:16:13] [PASSED] Link rate 540000 lane count 2
[06:16:13] [PASSED] Link rate 540000 lane count 1
[06:16:13] [PASSED] Link rate 270000 lane count 4
[06:16:13] [PASSED] Link rate 270000 lane count 2
[06:16:13] [PASSED] Link rate 270000 lane count 1
[06:16:13] [PASSED] Link rate 162000 lane count 4
[06:16:13] [PASSED] Link rate 162000 lane count 2
[06:16:13] [PASSED] Link rate 162000 lane count 1
[06:16:13] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[06:16:13] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[06:16:13] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[06:16:13] [PASSED] DP_POWER_UP_PHY with port number
[06:16:13] [PASSED] DP_POWER_DOWN_PHY with port number
[06:16:13] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[06:16:13] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[06:16:13] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[06:16:13] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[06:16:13] [PASSED] DP_QUERY_PAYLOAD with port number
[06:16:13] [PASSED] DP_QUERY_PAYLOAD with VCPI
[06:16:13] [PASSED] DP_REMOTE_DPCD_READ with port number
[06:16:13] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[06:16:13] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[06:16:13] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[06:16:13] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[06:16:13] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[06:16:13] [PASSED] DP_REMOTE_I2C_READ with port number
[06:16:13] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[06:16:13] [PASSED] DP_REMOTE_I2C_READ with transactions array
[06:16:13] [PASSED] DP_REMOTE_I2C_WRITE with port number
[06:16:13] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[06:16:13] [PASSED] DP_REMOTE_I2C_WRITE with data array
[06:16:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[06:16:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[06:16:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[06:16:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[06:16:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[06:16:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[06:16:13] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[06:16:13] ================ [PASSED] drm_dp_mst_helper ================
[06:16:13] ================== drm_exec (7 subtests) ===================
[06:16:13] [PASSED] sanitycheck
[06:16:13] [PASSED] test_lock
[06:16:13] [PASSED] test_lock_unlock
[06:16:13] [PASSED] test_duplicates
[06:16:13] [PASSED] test_prepare
[06:16:13] [PASSED] test_prepare_array
[06:16:13] [PASSED] test_multiple_loops
[06:16:13] ==================== [PASSED] drm_exec =====================
[06:16:13] =========== drm_format_helper_test (18 subtests) ===========
[06:16:13] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[06:16:13] [PASSED] single_pixel_source_buffer
[06:16:13] [PASSED] single_pixel_clip_rectangle
[06:16:13] [PASSED] well_known_colors
[06:16:13] [PASSED] destination_pitch
[06:16:13] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[06:16:13] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[06:16:13] [PASSED] single_pixel_source_buffer
[06:16:13] [PASSED] single_pixel_clip_rectangle
[06:16:13] [PASSED] well_known_colors
[06:16:13] [PASSED] destination_pitch
[06:16:13] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[06:16:13] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[06:16:13] [PASSED] single_pixel_source_buffer
[06:16:13] [PASSED] single_pixel_clip_rectangle
[06:16:13] [PASSED] well_known_colors
[06:16:13] [PASSED] destination_pitch
[06:16:13] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[06:16:13] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[06:16:13] [PASSED] single_pixel_source_buffer
[06:16:13] [PASSED] single_pixel_clip_rectangle
[06:16:13] [PASSED] well_known_colors
[06:16:13] [PASSED] destination_pitch
[06:16:13] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[06:16:13] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[06:16:13] [PASSED] single_pixel_source_buffer
[06:16:13] [PASSED] single_pixel_clip_rectangle
[06:16:13] [PASSED] well_known_colors
[06:16:13] [PASSED] destination_pitch
[06:16:13] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[06:16:13] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[06:16:13] [PASSED] single_pixel_source_buffer
[06:16:13] [PASSED] single_pixel_clip_rectangle
[06:16:13] [PASSED] well_known_colors
[06:16:13] [PASSED] destination_pitch
[06:16:13] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[06:16:13] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[06:16:13] [PASSED] single_pixel_source_buffer
[06:16:13] [PASSED] single_pixel_clip_rectangle
[06:16:13] [PASSED] well_known_colors
[06:16:13] [PASSED] destination_pitch
[06:16:13] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[06:16:13] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[06:16:13] [PASSED] single_pixel_source_buffer
[06:16:13] [PASSED] single_pixel_clip_rectangle
[06:16:13] [PASSED] well_known_colors
[06:16:13] [PASSED] destination_pitch
[06:16:13] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[06:16:13] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[06:16:13] [PASSED] single_pixel_source_buffer
[06:16:13] [PASSED] single_pixel_clip_rectangle
[06:16:13] [PASSED] well_known_colors
[06:16:13] [PASSED] destination_pitch
[06:16:13] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[06:16:13] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[06:16:13] [PASSED] single_pixel_source_buffer
[06:16:13] [PASSED] single_pixel_clip_rectangle
[06:16:13] [PASSED] well_known_colors
[06:16:13] [PASSED] destination_pitch
[06:16:13] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[06:16:13] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[06:16:13] [PASSED] single_pixel_source_buffer
[06:16:13] [PASSED] single_pixel_clip_rectangle
[06:16:13] [PASSED] well_known_colors
[06:16:13] [PASSED] destination_pitch
[06:16:13] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[06:16:13] ============== drm_test_fb_xrgb8888_to_mono  ===============
[06:16:13] [PASSED] single_pixel_source_buffer
[06:16:13] [PASSED] single_pixel_clip_rectangle
[06:16:13] [PASSED] well_known_colors
[06:16:13] [PASSED] destination_pitch
[06:16:13] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[06:16:13] ==================== drm_test_fb_swab  =====================
[06:16:13] [PASSED] single_pixel_source_buffer
[06:16:13] [PASSED] single_pixel_clip_rectangle
[06:16:13] [PASSED] well_known_colors
[06:16:13] [PASSED] destination_pitch
[06:16:13] ================ [PASSED] drm_test_fb_swab =================
[06:16:13] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[06:16:13] [PASSED] single_pixel_source_buffer
[06:16:13] [PASSED] single_pixel_clip_rectangle
[06:16:13] [PASSED] well_known_colors
[06:16:13] [PASSED] destination_pitch
[06:16:13] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[06:16:13] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[06:16:13] [PASSED] single_pixel_source_buffer
[06:16:13] [PASSED] single_pixel_clip_rectangle
[06:16:13] [PASSED] well_known_colors
[06:16:13] [PASSED] destination_pitch
[06:16:13] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[06:16:13] ================= drm_test_fb_clip_offset  =================
[06:16:13] [PASSED] pass through
[06:16:13] [PASSED] horizontal offset
[06:16:13] [PASSED] vertical offset
[06:16:13] [PASSED] horizontal and vertical offset
[06:16:13] [PASSED] horizontal offset (custom pitch)
[06:16:13] [PASSED] vertical offset (custom pitch)
[06:16:13] [PASSED] horizontal and vertical offset (custom pitch)
[06:16:13] ============= [PASSED] drm_test_fb_clip_offset =============
[06:16:13] ============== drm_test_fb_build_fourcc_list  ==============
[06:16:13] [PASSED] no native formats
[06:16:13] [PASSED] XRGB8888 as native format
[06:16:13] [PASSED] remove duplicates
[06:16:13] [PASSED] convert alpha formats
[06:16:13] [PASSED] random formats
[06:16:13] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[06:16:13] =================== drm_test_fb_memcpy  ====================
[06:16:13] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[06:16:13] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[06:16:13] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[06:16:13] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[06:16:13] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[06:16:13] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[06:16:13] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[06:16:13] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[06:16:13] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[06:16:13] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[06:16:13] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[06:16:13] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[06:16:13] =============== [PASSED] drm_test_fb_memcpy ================
[06:16:13] ============= [PASSED] drm_format_helper_test ==============
[06:16:13] ================= drm_format (18 subtests) =================
[06:16:13] [PASSED] drm_test_format_block_width_invalid
[06:16:13] [PASSED] drm_test_format_block_width_one_plane
[06:16:13] [PASSED] drm_test_format_block_width_two_plane
[06:16:13] [PASSED] drm_test_format_block_width_three_plane
[06:16:13] [PASSED] drm_test_format_block_width_tiled
[06:16:13] [PASSED] drm_test_format_block_height_invalid
[06:16:13] [PASSED] drm_test_format_block_height_one_plane
[06:16:13] [PASSED] drm_test_format_block_height_two_plane
[06:16:13] [PASSED] drm_test_format_block_height_three_plane
[06:16:13] [PASSED] drm_test_format_block_height_tiled
[06:16:13] [PASSED] drm_test_format_min_pitch_invalid
[06:16:13] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[06:16:13] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[06:16:13] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[06:16:13] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[06:16:13] [PASSED] drm_test_format_min_pitch_two_plane
[06:16:13] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[06:16:13] [PASSED] drm_test_format_min_pitch_tiled
[06:16:13] =================== [PASSED] drm_format ====================
[06:16:13] ============== drm_framebuffer (10 subtests) ===============
[06:16:13] ========== drm_test_framebuffer_check_src_coords  ==========
[06:16:13] [PASSED] Success: source fits into fb
[06:16:13] [PASSED] Fail: overflowing fb with x-axis coordinate
[06:16:13] [PASSED] Fail: overflowing fb with y-axis coordinate
[06:16:13] [PASSED] Fail: overflowing fb with source width
[06:16:13] [PASSED] Fail: overflowing fb with source height
[06:16:13] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[06:16:13] [PASSED] drm_test_framebuffer_cleanup
[06:16:13] =============== drm_test_framebuffer_create  ===============
[06:16:13] [PASSED] ABGR8888 normal sizes
[06:16:13] [PASSED] ABGR8888 max sizes
[06:16:13] [PASSED] ABGR8888 pitch greater than min required
[06:16:13] [PASSED] ABGR8888 pitch less than min required
[06:16:13] [PASSED] ABGR8888 Invalid width
[06:16:13] [PASSED] ABGR8888 Invalid buffer handle
[06:16:13] [PASSED] No pixel format
[06:16:13] [PASSED] ABGR8888 Width 0
[06:16:13] [PASSED] ABGR8888 Height 0
[06:16:13] [PASSED] ABGR8888 Out of bound height * pitch combination
[06:16:13] [PASSED] ABGR8888 Large buffer offset
[06:16:13] [PASSED] ABGR8888 Buffer offset for inexistent plane
[06:16:13] [PASSED] ABGR8888 Invalid flag
[06:16:13] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[06:16:13] [PASSED] ABGR8888 Valid buffer modifier
[06:16:13] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[06:16:13] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[06:16:13] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[06:16:13] [PASSED] NV12 Normal sizes
[06:16:13] [PASSED] NV12 Max sizes
[06:16:13] [PASSED] NV12 Invalid pitch
[06:16:13] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[06:16:13] [PASSED] NV12 different  modifier per-plane
[06:16:13] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[06:16:13] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[06:16:13] [PASSED] NV12 Modifier for inexistent plane
[06:16:13] [PASSED] NV12 Handle for inexistent plane
[06:16:13] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[06:16:13] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[06:16:13] [PASSED] YVU420 Normal sizes
[06:16:13] [PASSED] YVU420 Max sizes
[06:16:13] [PASSED] YVU420 Invalid pitch
[06:16:13] [PASSED] YVU420 Different pitches
[06:16:13] [PASSED] YVU420 Different buffer offsets/pitches
[06:16:13] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[06:16:13] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[06:16:13] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[06:16:13] [PASSED] YVU420 Valid modifier
[06:16:13] [PASSED] YVU420 Different modifiers per plane
[06:16:13] [PASSED] YVU420 Modifier for inexistent plane
[06:16:13] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[06:16:13] [PASSED] X0L2 Normal sizes
[06:16:13] [PASSED] X0L2 Max sizes
[06:16:13] [PASSED] X0L2 Invalid pitch
[06:16:13] [PASSED] X0L2 Pitch greater than minimum required
[06:16:13] [PASSED] X0L2 Handle for inexistent plane
[06:16:13] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[06:16:13] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[06:16:13] [PASSED] X0L2 Valid modifier
[06:16:13] [PASSED] X0L2 Modifier for inexistent plane
[06:16:13] =========== [PASSED] drm_test_framebuffer_create ===========
[06:16:13] [PASSED] drm_test_framebuffer_free
[06:16:13] [PASSED] drm_test_framebuffer_init
[06:16:13] [PASSED] drm_test_framebuffer_init_bad_format
[06:16:13] [PASSED] drm_test_framebuffer_init_dev_mismatch
[06:16:13] [PASSED] drm_test_framebuffer_lookup
[06:16:13] [PASSED] drm_test_framebuffer_lookup_inexistent
[06:16:13] [PASSED] drm_test_framebuffer_modifiers_not_supported
[06:16:13] ================= [PASSED] drm_framebuffer =================
[06:16:13] ================ drm_gem_shmem (8 subtests) ================
[06:16:13] [PASSED] drm_gem_shmem_test_obj_create
[06:16:13] [PASSED] drm_gem_shmem_test_obj_create_private
[06:16:13] [PASSED] drm_gem_shmem_test_pin_pages
[06:16:13] [PASSED] drm_gem_shmem_test_vmap
[06:16:13] [PASSED] drm_gem_shmem_test_get_pages_sgt
[06:16:13] [PASSED] drm_gem_shmem_test_get_sg_table
[06:16:13] [PASSED] drm_gem_shmem_test_madvise
[06:16:13] [PASSED] drm_gem_shmem_test_purge
[06:16:13] ================== [PASSED] drm_gem_shmem ==================
[06:16:13] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[06:16:13] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[06:16:13] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[06:16:13] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[06:16:13] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[06:16:13] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[06:16:13] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[06:16:13] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[06:16:13] [PASSED] Automatic
[06:16:13] [PASSED] Full
[06:16:13] [PASSED] Limited 16:235
[06:16:13] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[06:16:13] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[06:16:13] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[06:16:13] [PASSED] drm_test_check_disable_connector
[06:16:13] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[06:16:13] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[06:16:13] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[06:16:13] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[06:16:13] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[06:16:13] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[06:16:13] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[06:16:13] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[06:16:13] [PASSED] drm_test_check_output_bpc_dvi
[06:16:13] [PASSED] drm_test_check_output_bpc_format_vic_1
[06:16:13] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[06:16:13] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[06:16:13] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[06:16:13] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[06:16:13] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[06:16:13] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[06:16:13] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[06:16:13] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[06:16:13] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[06:16:13] [PASSED] drm_test_check_broadcast_rgb_value
[06:16:13] [PASSED] drm_test_check_bpc_8_value
[06:16:13] [PASSED] drm_test_check_bpc_10_value
[06:16:13] [PASSED] drm_test_check_bpc_12_value
[06:16:13] [PASSED] drm_test_check_format_value
[06:16:13] [PASSED] drm_test_check_tmds_char_value
[06:16:13] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[06:16:13] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[06:16:13] [PASSED] drm_test_check_mode_valid
[06:16:13] [PASSED] drm_test_check_mode_valid_reject
[06:16:13] [PASSED] drm_test_check_mode_valid_reject_rate
[06:16:13] [PASSED] drm_test_check_mode_valid_reject_max_clock
[06:16:13] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[06:16:13] ================= drm_managed (2 subtests) =================
[06:16:13] [PASSED] drm_test_managed_release_action
[06:16:13] [PASSED] drm_test_managed_run_action
[06:16:13] =================== [PASSED] drm_managed ===================
[06:16:13] =================== drm_mm (6 subtests) ====================
[06:16:13] [PASSED] drm_test_mm_init
[06:16:13] [PASSED] drm_test_mm_debug
[06:16:13] [PASSED] drm_test_mm_align32
[06:16:13] [PASSED] drm_test_mm_align64
[06:16:13] [PASSED] drm_test_mm_lowest
[06:16:13] [PASSED] drm_test_mm_highest
[06:16:13] ===================== [PASSED] drm_mm ======================
[06:16:13] ============= drm_modes_analog_tv (5 subtests) =============
[06:16:13] [PASSED] drm_test_modes_analog_tv_mono_576i
[06:16:13] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[06:16:13] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[06:16:13] [PASSED] drm_test_modes_analog_tv_pal_576i
[06:16:13] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[06:16:13] =============== [PASSED] drm_modes_analog_tv ===============
[06:16:13] ============== drm_plane_helper (2 subtests) ===============
[06:16:13] =============== drm_test_check_plane_state  ================
[06:16:13] [PASSED] clipping_simple
[06:16:13] [PASSED] clipping_rotate_reflect
[06:16:13] [PASSED] positioning_simple
[06:16:13] [PASSED] upscaling
[06:16:13] [PASSED] downscaling
[06:16:13] [PASSED] rounding1
[06:16:13] [PASSED] rounding2
[06:16:13] [PASSED] rounding3
[06:16:13] [PASSED] rounding4
[06:16:13] =========== [PASSED] drm_test_check_plane_state ============
[06:16:13] =========== drm_test_check_invalid_plane_state  ============
[06:16:13] [PASSED] positioning_invalid
[06:16:13] [PASSED] upscaling_invalid
[06:16:13] [PASSED] downscaling_invalid
[06:16:13] ======= [PASSED] drm_test_check_invalid_plane_state ========
[06:16:13] ================ [PASSED] drm_plane_helper =================
[06:16:13] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[06:16:13] ====== drm_test_connector_helper_tv_get_modes_check  =======
[06:16:13] [PASSED] None
[06:16:13] [PASSED] PAL
[06:16:13] [PASSED] NTSC
[06:16:13] [PASSED] Both, NTSC Default
[06:16:13] [PASSED] Both, PAL Default
[06:16:13] [PASSED] Both, NTSC Default, with PAL on command-line
[06:16:13] [PASSED] Both, PAL Default, with NTSC on command-line
[06:16:13] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[06:16:13] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[06:16:13] ================== drm_rect (9 subtests) ===================
[06:16:13] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[06:16:13] [PASSED] drm_test_rect_clip_scaled_not_clipped
[06:16:13] [PASSED] drm_test_rect_clip_scaled_clipped
[06:16:13] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[06:16:13] ================= drm_test_rect_intersect  =================
[06:16:13] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[06:16:13] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[06:16:13] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[06:16:13] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[06:16:13] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[06:16:13] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[06:16:13] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[06:16:13] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[06:16:13] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[06:16:13] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[06:16:13] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[06:16:13] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[06:16:13] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[06:16:13] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[06:16:13] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[06:16:13] ============= [PASSED] drm_test_rect_intersect =============
[06:16:13] ================ drm_test_rect_calc_hscale  ================
[06:16:13] [PASSED] normal use
[06:16:13] [PASSED] out of max range
[06:16:13] [PASSED] out of min range
[06:16:13] [PASSED] zero dst
[06:16:13] [PASSED] negative src
[06:16:13] [PASSED] negative dst
[06:16:13] ============ [PASSED] drm_test_rect_calc_hscale ============
[06:16:13] ================ drm_test_rect_calc_vscale  ================
[06:16:13] [PASSED] normal use
[06:16:13] [PASSED] out of max range
[06:16:13] [PASSED] out of min range
[06:16:13] [PASSED] zero dst
[06:16:13] [PASSED] negative src
[06:16:13] [PASSED] negative dst
[06:16:13] ============ [PASSED] drm_test_rect_calc_vscale ============
[06:16:13] ================== drm_test_rect_rotate  ===================
[06:16:13] [PASSED] reflect-x
[06:16:13] [PASSED] reflect-y
[06:16:13] [PASSED] rotate-0
[06:16:13] [PASSED] rotate-90
[06:16:13] [PASSED] rotate-180
stty: 'standard input': Inappropriate ioctl for device
[06:16:13] [PASSED] rotate-270
[06:16:13] ============== [PASSED] drm_test_rect_rotate ===============
[06:16:13] ================ drm_test_rect_rotate_inv  =================
[06:16:13] [PASSED] reflect-x
[06:16:13] [PASSED] reflect-y
[06:16:13] [PASSED] rotate-0
[06:16:13] [PASSED] rotate-90
[06:16:13] [PASSED] rotate-180
[06:16:13] [PASSED] rotate-270
[06:16:13] ============ [PASSED] drm_test_rect_rotate_inv =============
[06:16:13] ==================== [PASSED] drm_rect =====================
[06:16:13] ============================================================
[06:16:13] Testing complete. Ran 614 tests: passed: 614
[06:16:13] Elapsed time: 23.301s total, 1.699s configuring, 21.433s building, 0.138s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
ERROR:root:../drivers/gpu/drm/ttm/ttm_pool.c: In function ‘ttm_pool_mgr_init’:
../drivers/gpu/drm/ttm/ttm_pool.c:1340:30: error: ‘TTM_SHRINKER_BATCH’ undeclared (first use in this function)
 1340 |         mm_shrinker->batch = TTM_SHRINKER_BATCH;
      |                              ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/ttm_pool.c:1340:30: note: each undeclared identifier is reported only once for each function it appears in
make[7]: *** [../scripts/Makefile.build:203: drivers/gpu/drm/ttm/ttm_pool.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:461: drivers/gpu/drm/ttm] Error 2
make[5]: *** [../scripts/Makefile.build:461: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:461: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:461: drivers] Error 2
make[2]: *** [/kernel/Makefile:2003: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[06:16:13] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:16:15] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


