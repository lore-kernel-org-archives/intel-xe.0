Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ADBC5AE59
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 08:24:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC8510E571;
	Wed, 28 May 2025 08:24:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C01F10E571;
 Wed, 28 May 2025 08:24:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/i915/sbi=3A_move_under_dis?=
 =?utf-8?q?play=2C_cleanup_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 08:24:56 -0000
Message-ID: <174842069657.27115.18283857509186885474@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1748343520.git.jani.nikula@intel.com>
In-Reply-To: <cover.1748343520.git.jani.nikula@intel.com>
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

Series: drm/i915/sbi: move under display, cleanup (rev3)
URL   : https://patchwork.freedesktop.org/series/148960/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[08:23:42] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:23:47] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[08:24:13] Starting KUnit Kernel (1/1)...
[08:24:13] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[08:24:13] ================== guc_buf (11 subtests) ===================
[08:24:13] [PASSED] test_smallest
[08:24:13] [PASSED] test_largest
[08:24:13] [PASSED] test_granular
[08:24:13] [PASSED] test_unique
[08:24:13] [PASSED] test_overlap
[08:24:13] [PASSED] test_reusable
[08:24:13] [PASSED] test_too_big
[08:24:13] [PASSED] test_flush
[08:24:13] [PASSED] test_lookup
[08:24:13] [PASSED] test_data
[08:24:13] [PASSED] test_class
[08:24:13] ===================== [PASSED] guc_buf =====================
[08:24:13] =================== guc_dbm (7 subtests) ===================
[08:24:13] [PASSED] test_empty
[08:24:13] [PASSED] test_default
[08:24:13] ======================== test_size  ========================
[08:24:13] [PASSED] 4
[08:24:13] [PASSED] 8
[08:24:13] [PASSED] 32
[08:24:13] [PASSED] 256
[08:24:13] ==================== [PASSED] test_size ====================
[08:24:13] ======================= test_reuse  ========================
[08:24:13] [PASSED] 4
[08:24:13] [PASSED] 8
[08:24:13] [PASSED] 32
[08:24:13] [PASSED] 256
[08:24:13] =================== [PASSED] test_reuse ====================
[08:24:13] =================== test_range_overlap  ====================
[08:24:13] [PASSED] 4
[08:24:13] [PASSED] 8
[08:24:13] [PASSED] 32
[08:24:13] [PASSED] 256
[08:24:13] =============== [PASSED] test_range_overlap ================
[08:24:13] =================== test_range_compact  ====================
[08:24:13] [PASSED] 4
[08:24:13] [PASSED] 8
[08:24:13] [PASSED] 32
[08:24:13] [PASSED] 256
[08:24:13] =============== [PASSED] test_range_compact ================
[08:24:13] ==================== test_range_spare  =====================
[08:24:13] [PASSED] 4
[08:24:13] [PASSED] 8
[08:24:13] [PASSED] 32
[08:24:13] [PASSED] 256
[08:24:13] ================ [PASSED] test_range_spare =================
[08:24:13] ===================== [PASSED] guc_dbm =====================
[08:24:13] =================== guc_idm (6 subtests) ===================
[08:24:13] [PASSED] bad_init
[08:24:13] [PASSED] no_init
[08:24:13] [PASSED] init_fini
[08:24:13] [PASSED] check_used
[08:24:13] [PASSED] check_quota
[08:24:13] [PASSED] check_all
[08:24:13] ===================== [PASSED] guc_idm =====================
[08:24:13] ================== no_relay (3 subtests) ===================
[08:24:13] [PASSED] xe_drops_guc2pf_if_not_ready
[08:24:13] [PASSED] xe_drops_guc2vf_if_not_ready
[08:24:13] [PASSED] xe_rejects_send_if_not_ready
[08:24:13] ==================== [PASSED] no_relay =====================
[08:24:13] ================== pf_relay (14 subtests) ==================
[08:24:13] [PASSED] pf_rejects_guc2pf_too_short
[08:24:13] [PASSED] pf_rejects_guc2pf_too_long
[08:24:13] [PASSED] pf_rejects_guc2pf_no_payload
[08:24:13] [PASSED] pf_fails_no_payload
[08:24:13] [PASSED] pf_fails_bad_origin
[08:24:13] [PASSED] pf_fails_bad_type
[08:24:13] [PASSED] pf_txn_reports_error
[08:24:13] [PASSED] pf_txn_sends_pf2guc
[08:24:13] [PASSED] pf_sends_pf2guc
[08:24:13] [SKIPPED] pf_loopback_nop
[08:24:13] [SKIPPED] pf_loopback_echo
[08:24:13] [SKIPPED] pf_loopback_fail
[08:24:13] [SKIPPED] pf_loopback_busy
[08:24:13] [SKIPPED] pf_loopback_retry
[08:24:13] ==================== [PASSED] pf_relay =====================
[08:24:13] ================== vf_relay (3 subtests) ===================
[08:24:13] [PASSED] vf_rejects_guc2vf_too_short
[08:24:13] [PASSED] vf_rejects_guc2vf_too_long
[08:24:13] [PASSED] vf_rejects_guc2vf_no_payload
[08:24:13] ==================== [PASSED] vf_relay =====================
[08:24:13] ================= pf_service (11 subtests) =================
[08:24:13] [PASSED] pf_negotiate_any
[08:24:13] [PASSED] pf_negotiate_base_match
[08:24:13] [PASSED] pf_negotiate_base_newer
[08:24:13] [PASSED] pf_negotiate_base_next
[08:24:13] [SKIPPED] pf_negotiate_base_older
[08:24:13] [PASSED] pf_negotiate_base_prev
[08:24:13] [PASSED] pf_negotiate_latest_match
[08:24:13] [PASSED] pf_negotiate_latest_newer
[08:24:13] [PASSED] pf_negotiate_latest_next
[08:24:13] [SKIPPED] pf_negotiate_latest_older
[08:24:13] [SKIPPED] pf_negotiate_latest_prev
[08:24:13] =================== [PASSED] pf_service ====================
[08:24:13] ===================== lmtt (1 subtest) =====================
[08:24:13] ======================== test_ops  =========================
[08:24:13] [PASSED] 2-level
[08:24:13] [PASSED] multi-level
[08:24:13] ==================== [PASSED] test_ops =====================
[08:24:13] ====================== [PASSED] lmtt =======================
[08:24:13] =================== xe_mocs (2 subtests) ===================
[08:24:13] ================ xe_live_mocs_kernel_kunit  ================
[08:24:13] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[08:24:13] ================ xe_live_mocs_reset_kunit  =================
[08:24:13] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[08:24:13] ==================== [SKIPPED] xe_mocs =====================
[08:24:13] ================= xe_migrate (2 subtests) ==================
[08:24:13] ================= xe_migrate_sanity_kunit  =================
[08:24:13] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[08:24:13] ================== xe_validate_ccs_kunit  ==================
[08:24:13] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[08:24:13] =================== [SKIPPED] xe_migrate ===================
[08:24:13] ================== xe_dma_buf (1 subtest) ==================
[08:24:13] ==================== xe_dma_buf_kunit  =====================
[08:24:13] ================ [SKIPPED] xe_dma_buf_kunit ================
[08:24:13] =================== [SKIPPED] xe_dma_buf ===================
[08:24:13] ================= xe_bo_shrink (1 subtest) =================
[08:24:13] =================== xe_bo_shrink_kunit  ====================
[08:24:13] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[08:24:13] ================== [SKIPPED] xe_bo_shrink ==================
[08:24:13] ==================== xe_bo (2 subtests) ====================
[08:24:13] ================== xe_ccs_migrate_kunit  ===================
[08:24:13] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[08:24:13] ==================== xe_bo_evict_kunit  ====================
[08:24:13] =============== [SKIPPED] xe_bo_evict_kunit ================
[08:24:13] ===================== [SKIPPED] xe_bo ======================
[08:24:13] ==================== args (11 subtests) ====================
[08:24:13] [PASSED] count_args_test
[08:24:13] [PASSED] call_args_example
[08:24:13] [PASSED] call_args_test
[08:24:13] [PASSED] drop_first_arg_example
[08:24:13] [PASSED] drop_first_arg_test
[08:24:13] [PASSED] first_arg_example
[08:24:13] [PASSED] first_arg_test
[08:24:13] [PASSED] last_arg_example
[08:24:13] [PASSED] last_arg_test
[08:24:13] [PASSED] pick_arg_example
[08:24:13] [PASSED] sep_comma_example
[08:24:13] ====================== [PASSED] args =======================
[08:24:13] =================== xe_pci (2 subtests) ====================
[08:24:13] [PASSED] xe_gmdid_graphics_ip
[08:24:13] [PASSED] xe_gmdid_media_ip
[08:24:13] ===================== [PASSED] xe_pci ======================
[08:24:13] =================== xe_rtp (2 subtests) ====================
[08:24:13] =============== xe_rtp_process_to_sr_tests  ================
[08:24:13] [PASSED] coalesce-same-reg
[08:24:13] [PASSED] no-match-no-add
[08:24:13] [PASSED] match-or
[08:24:13] [PASSED] match-or-xfail
[08:24:13] [PASSED] no-match-no-add-multiple-rules
[08:24:13] [PASSED] two-regs-two-entries
[08:24:13] [PASSED] clr-one-set-other
[08:24:13] [PASSED] set-field
[08:24:13] [PASSED] conflict-duplicate
[08:24:13] [PASSED] conflict-not-disjoint
stty: 'standard input': Inappropriate ioctl for device
[08:24:13] [PASSED] conflict-reg-type
[08:24:13] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[08:24:13] ================== xe_rtp_process_tests  ===================
[08:24:13] [PASSED] active1
[08:24:13] [PASSED] active2
[08:24:13] [PASSED] active-inactive
[08:24:13] [PASSED] inactive-active
[08:24:13] [PASSED] inactive-1st_or_active-inactive
[08:24:13] [PASSED] inactive-2nd_or_active-inactive
[08:24:13] [PASSED] inactive-last_or_active-inactive
[08:24:13] [PASSED] inactive-no_or_active-inactive
[08:24:13] ============== [PASSED] xe_rtp_process_tests ===============
[08:24:13] ===================== [PASSED] xe_rtp ======================
[08:24:13] ==================== xe_wa (1 subtest) =====================
[08:24:13] ======================== xe_wa_gt  =========================
[08:24:13] [PASSED] TIGERLAKE (B0)
[08:24:13] [PASSED] DG1 (A0)
[08:24:13] [PASSED] DG1 (B0)
[08:24:13] [PASSED] ALDERLAKE_S (A0)
[08:24:13] [PASSED] ALDERLAKE_S (B0)
[08:24:13] [PASSED] ALDERLAKE_S (C0)
[08:24:13] [PASSED] ALDERLAKE_S (D0)
[08:24:13] [PASSED] ALDERLAKE_P (A0)
[08:24:13] [PASSED] ALDERLAKE_P (B0)
[08:24:13] [PASSED] ALDERLAKE_P (C0)
[08:24:13] [PASSED] ALDERLAKE_S_RPLS (D0)
[08:24:13] [PASSED] ALDERLAKE_P_RPLU (E0)
[08:24:13] [PASSED] DG2_G10 (C0)
[08:24:13] [PASSED] DG2_G11 (B1)
[08:24:13] [PASSED] DG2_G12 (A1)
[08:24:13] [PASSED] METEORLAKE (g:A0, m:A0)
[08:24:13] [PASSED] METEORLAKE (g:A0, m:A0)
[08:24:13] [PASSED] METEORLAKE (g:A0, m:A0)
[08:24:13] [PASSED] LUNARLAKE (g:A0, m:A0)
[08:24:13] [PASSED] LUNARLAKE (g:B0, m:A0)
[08:24:13] [PASSED] BATTLEMAGE (g:A0, m:A1)
[08:24:13] ==================== [PASSED] xe_wa_gt =====================
[08:24:13] ====================== [PASSED] xe_wa ======================
[08:24:13] ============================================================
[08:24:13] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[08:24:14] Elapsed time: 31.073s total, 4.182s configuring, 26.575s building, 0.265s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[08:24:14] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:24:15] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[08:24:36] Starting KUnit Kernel (1/1)...
[08:24:36] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[08:24:37] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[08:24:37] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[08:24:37] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[08:24:37] =========== drm_validate_clone_mode (2 subtests) ===========
[08:24:37] ============== drm_test_check_in_clone_mode  ===============
[08:24:37] [PASSED] in_clone_mode
[08:24:37] [PASSED] not_in_clone_mode
[08:24:37] ========== [PASSED] drm_test_check_in_clone_mode ===========
[08:24:37] =============== drm_test_check_valid_clones  ===============
[08:24:37] [PASSED] not_in_clone_mode
[08:24:37] [PASSED] valid_clone
[08:24:37] [PASSED] invalid_clone
[08:24:37] =========== [PASSED] drm_test_check_valid_clones ===========
[08:24:37] ============= [PASSED] drm_validate_clone_mode =============
[08:24:37] ============= drm_validate_modeset (1 subtest) =============
[08:24:37] [PASSED] drm_test_check_connector_changed_modeset
[08:24:37] ============== [PASSED] drm_validate_modeset ===============
[08:24:37] ====== drm_test_bridge_get_current_state (2 subtests) ======
[08:24:37] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[08:24:37] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[08:24:37] ======== [PASSED] drm_test_bridge_get_current_state ========
[08:24:37] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[08:24:37] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[08:24:37] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[08:24:37] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[08:24:37] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[08:24:37] ================== drm_buddy (7 subtests) ==================
[08:24:37] [PASSED] drm_test_buddy_alloc_limit
[08:24:37] [PASSED] drm_test_buddy_alloc_optimistic
[08:24:37] [PASSED] drm_test_buddy_alloc_pessimistic
[08:24:37] [PASSED] drm_test_buddy_alloc_pathological
[08:24:37] [PASSED] drm_test_buddy_alloc_contiguous
[08:24:37] [PASSED] drm_test_buddy_alloc_clear
[08:24:37] [PASSED] drm_test_buddy_alloc_range_bias
[08:24:37] ==================== [PASSED] drm_buddy ====================
[08:24:37] ============= drm_cmdline_parser (40 subtests) =============
[08:24:37] [PASSED] drm_test_cmdline_force_d_only
[08:24:37] [PASSED] drm_test_cmdline_force_D_only_dvi
[08:24:37] [PASSED] drm_test_cmdline_force_D_only_hdmi
[08:24:37] [PASSED] drm_test_cmdline_force_D_only_not_digital
[08:24:37] [PASSED] drm_test_cmdline_force_e_only
[08:24:37] [PASSED] drm_test_cmdline_res
[08:24:37] [PASSED] drm_test_cmdline_res_vesa
[08:24:37] [PASSED] drm_test_cmdline_res_vesa_rblank
[08:24:37] [PASSED] drm_test_cmdline_res_rblank
[08:24:37] [PASSED] drm_test_cmdline_res_bpp
[08:24:37] [PASSED] drm_test_cmdline_res_refresh
[08:24:37] [PASSED] drm_test_cmdline_res_bpp_refresh
[08:24:37] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[08:24:37] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[08:24:37] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[08:24:37] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[08:24:37] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[08:24:37] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[08:24:37] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[08:24:37] [PASSED] drm_test_cmdline_res_margins_force_on
[08:24:37] [PASSED] drm_test_cmdline_res_vesa_margins
[08:24:37] [PASSED] drm_test_cmdline_name
[08:24:37] [PASSED] drm_test_cmdline_name_bpp
[08:24:37] [PASSED] drm_test_cmdline_name_option
[08:24:37] [PASSED] drm_test_cmdline_name_bpp_option
[08:24:37] [PASSED] drm_test_cmdline_rotate_0
[08:24:37] [PASSED] drm_test_cmdline_rotate_90
[08:24:37] [PASSED] drm_test_cmdline_rotate_180
[08:24:37] [PASSED] drm_test_cmdline_rotate_270
[08:24:37] [PASSED] drm_test_cmdline_hmirror
[08:24:37] [PASSED] drm_test_cmdline_vmirror
[08:24:37] [PASSED] drm_test_cmdline_margin_options
[08:24:37] [PASSED] drm_test_cmdline_multiple_options
[08:24:37] [PASSED] drm_test_cmdline_bpp_extra_and_option
[08:24:37] [PASSED] drm_test_cmdline_extra_and_option
[08:24:37] [PASSED] drm_test_cmdline_freestanding_options
[08:24:37] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[08:24:37] [PASSED] drm_test_cmdline_panel_orientation
[08:24:37] ================ drm_test_cmdline_invalid  =================
[08:24:37] [PASSED] margin_only
[08:24:37] [PASSED] interlace_only
[08:24:37] [PASSED] res_missing_x
[08:24:37] [PASSED] res_missing_y
[08:24:37] [PASSED] res_bad_y
[08:24:37] [PASSED] res_missing_y_bpp
[08:24:37] [PASSED] res_bad_bpp
[08:24:37] [PASSED] res_bad_refresh
[08:24:37] [PASSED] res_bpp_refresh_force_on_off
[08:24:37] [PASSED] res_invalid_mode
[08:24:37] [PASSED] res_bpp_wrong_place_mode
[08:24:37] [PASSED] name_bpp_refresh
[08:24:37] [PASSED] name_refresh
[08:24:37] [PASSED] name_refresh_wrong_mode
[08:24:37] [PASSED] name_refresh_invalid_mode
[08:24:37] [PASSED] rotate_multiple
[08:24:37] [PASSED] rotate_invalid_val
[08:24:37] [PASSED] rotate_truncated
[08:24:37] [PASSED] invalid_option
[08:24:37] [PASSED] invalid_tv_option
[08:24:37] [PASSED] truncated_tv_option
[08:24:37] ============ [PASSED] drm_test_cmdline_invalid =============
[08:24:37] =============== drm_test_cmdline_tv_options  ===============
[08:24:37] [PASSED] NTSC
[08:24:37] [PASSED] NTSC_443
[08:24:37] [PASSED] NTSC_J
[08:24:37] [PASSED] PAL
[08:24:37] [PASSED] PAL_M
[08:24:37] [PASSED] PAL_N
[08:24:37] [PASSED] SECAM
[08:24:37] [PASSED] MONO_525
[08:24:37] [PASSED] MONO_625
[08:24:37] =========== [PASSED] drm_test_cmdline_tv_options ===========
[08:24:37] =============== [PASSED] drm_cmdline_parser ================
[08:24:37] ========== drmm_connector_hdmi_init (20 subtests) ==========
[08:24:37] [PASSED] drm_test_connector_hdmi_init_valid
[08:24:37] [PASSED] drm_test_connector_hdmi_init_bpc_8
[08:24:37] [PASSED] drm_test_connector_hdmi_init_bpc_10
[08:24:37] [PASSED] drm_test_connector_hdmi_init_bpc_12
[08:24:37] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[08:24:37] [PASSED] drm_test_connector_hdmi_init_bpc_null
[08:24:37] [PASSED] drm_test_connector_hdmi_init_formats_empty
[08:24:37] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[08:24:37] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[08:24:37] [PASSED] supported_formats=0x9 yuv420_allowed=1
[08:24:37] [PASSED] supported_formats=0x9 yuv420_allowed=0
[08:24:37] [PASSED] supported_formats=0x3 yuv420_allowed=1
[08:24:37] [PASSED] supported_formats=0x3 yuv420_allowed=0
[08:24:37] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[08:24:37] [PASSED] drm_test_connector_hdmi_init_null_ddc
[08:24:37] [PASSED] drm_test_connector_hdmi_init_null_product
[08:24:37] [PASSED] drm_test_connector_hdmi_init_null_vendor
[08:24:37] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[08:24:37] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[08:24:37] [PASSED] drm_test_connector_hdmi_init_product_valid
[08:24:37] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[08:24:37] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[08:24:37] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[08:24:37] ========= drm_test_connector_hdmi_init_type_valid  =========
[08:24:37] [PASSED] HDMI-A
[08:24:37] [PASSED] HDMI-B
[08:24:37] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[08:24:37] ======== drm_test_connector_hdmi_init_type_invalid  ========
[08:24:37] [PASSED] Unknown
[08:24:37] [PASSED] VGA
[08:24:37] [PASSED] DVI-I
[08:24:37] [PASSED] DVI-D
[08:24:37] [PASSED] DVI-A
[08:24:37] [PASSED] Composite
[08:24:37] [PASSED] SVIDEO
[08:24:37] [PASSED] LVDS
[08:24:37] [PASSED] Component
[08:24:37] [PASSED] DIN
[08:24:37] [PASSED] DP
[08:24:37] [PASSED] TV
[08:24:37] [PASSED] eDP
[08:24:37] [PASSED] Virtual
[08:24:37] [PASSED] DSI
[08:24:37] [PASSED] DPI
[08:24:37] [PASSED] Writeback
[08:24:37] [PASSED] SPI
[08:24:37] [PASSED] USB
[08:24:37] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[08:24:37] ============ [PASSED] drmm_connector_hdmi_init =============
[08:24:37] ============= drmm_connector_init (3 subtests) =============
[08:24:37] [PASSED] drm_test_drmm_connector_init
[08:24:37] [PASSED] drm_test_drmm_connector_init_null_ddc
[08:24:37] ========= drm_test_drmm_connector_init_type_valid  =========
[08:24:37] [PASSED] Unknown
[08:24:37] [PASSED] VGA
[08:24:37] [PASSED] DVI-I
[08:24:37] [PASSED] DVI-D
[08:24:37] [PASSED] DVI-A
[08:24:37] [PASSED] Composite
[08:24:37] [PASSED] SVIDEO
[08:24:37] [PASSED] LVDS
[08:24:37] [PASSED] Component
[08:24:37] [PASSED] DIN
[08:24:37] [PASSED] DP
[08:24:37] [PASSED] HDMI-A
[08:24:37] [PASSED] HDMI-B
[08:24:37] [PASSED] TV
[08:24:37] [PASSED] eDP
[08:24:37] [PASSED] Virtual
[08:24:37] [PASSED] DSI
[08:24:37] [PASSED] DPI
[08:24:37] [PASSED] Writeback
[08:24:37] [PASSED] SPI
[08:24:37] [PASSED] USB
[08:24:37] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[08:24:37] =============== [PASSED] drmm_connector_init ===============
[08:24:37] ========= drm_connector_dynamic_init (6 subtests) ==========
[08:24:37] [PASSED] drm_test_drm_connector_dynamic_init
[08:24:37] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[08:24:37] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[08:24:37] [PASSED] drm_test_drm_connector_dynamic_init_properties
[08:24:37] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[08:24:37] [PASSED] Unknown
[08:24:37] [PASSED] VGA
[08:24:37] [PASSED] DVI-I
[08:24:37] [PASSED] DVI-D
[08:24:37] [PASSED] DVI-A
[08:24:37] [PASSED] Composite
[08:24:37] [PASSED] SVIDEO
[08:24:37] [PASSED] LVDS
[08:24:37] [PASSED] Component
[08:24:37] [PASSED] DIN
[08:24:37] [PASSED] DP
[08:24:37] [PASSED] HDMI-A
[08:24:37] [PASSED] HDMI-B
[08:24:37] [PASSED] TV
[08:24:37] [PASSED] eDP
[08:24:37] [PASSED] Virtual
[08:24:37] [PASSED] DSI
[08:24:37] [PASSED] DPI
[08:24:37] [PASSED] Writeback
[08:24:37] [PASSED] SPI
[08:24:37] [PASSED] USB
[08:24:37] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[08:24:37] ======== drm_test_drm_connector_dynamic_init_name  =========
[08:24:37] [PASSED] Unknown
[08:24:37] [PASSED] VGA
[08:24:37] [PASSED] DVI-I
[08:24:37] [PASSED] DVI-D
[08:24:37] [PASSED] DVI-A
[08:24:37] [PASSED] Composite
[08:24:37] [PASSED] SVIDEO
[08:24:37] [PASSED] LVDS
[08:24:37] [PASSED] Component
[08:24:37] [PASSED] DIN
[08:24:37] [PASSED] DP
[08:24:37] [PASSED] HDMI-A
[08:24:37] [PASSED] HDMI-B
[08:24:37] [PASSED] TV
[08:24:37] [PASSED] eDP
[08:24:37] [PASSED] Virtual
[08:24:37] [PASSED] DSI
[08:24:37] [PASSED] DPI
[08:24:37] [PASSED] Writeback
[08:24:37] [PASSED] SPI
[08:24:37] [PASSED] USB
[08:24:37] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[08:24:37] =========== [PASSED] drm_connector_dynamic_init ============
[08:24:37] ==== drm_connector_dynamic_register_early (4 subtests) =====
[08:24:37] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[08:24:37] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[08:24:37] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[08:24:37] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[08:24:37] ====== [PASSED] drm_connector_dynamic_register_early =======
[08:24:37] ======= drm_connector_dynamic_register (7 subtests) ========
[08:24:37] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[08:24:37] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[08:24:37] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[08:24:37] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[08:24:37] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[08:24:37] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[08:24:37] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[08:24:37] ========= [PASSED] drm_connector_dynamic_register ==========
[08:24:37] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[08:24:37] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[08:24:37] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[08:24:37] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[08:24:37] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[08:24:37] ========== drm_test_get_tv_mode_from_name_valid  ===========
[08:24:37] [PASSED] NTSC
[08:24:37] [PASSED] NTSC-443
[08:24:37] [PASSED] NTSC-J
[08:24:37] [PASSED] PAL
[08:24:37] [PASSED] PAL-M
[08:24:37] [PASSED] PAL-N
[08:24:37] [PASSED] SECAM
[08:24:37] [PASSED] Mono
[08:24:37] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[08:24:37] [PASSED] drm_test_get_tv_mode_from_name_truncated
[08:24:37] ============ [PASSED] drm_get_tv_mode_from_name ============
[08:24:37] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[08:24:37] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[08:24:37] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[08:24:37] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[08:24:37] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[08:24:37] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[08:24:37] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[08:24:37] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[08:24:37] [PASSED] VIC 96
[08:24:37] [PASSED] VIC 97
[08:24:37] [PASSED] VIC 101
[08:24:37] [PASSED] VIC 102
[08:24:37] [PASSED] VIC 106
[08:24:37] [PASSED] VIC 107
[08:24:37] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[08:24:37] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[08:24:37] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[08:24:37] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[08:24:37] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[08:24:37] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[08:24:37] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[08:24:37] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[08:24:37] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[08:24:37] [PASSED] Automatic
[08:24:37] [PASSED] Full
[08:24:37] [PASSED] Limited 16:235
[08:24:37] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[08:24:37] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[08:24:37] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[08:24:37] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[08:24:37] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[08:24:37] [PASSED] RGB
[08:24:37] [PASSED] YUV 4:2:0
[08:24:37] [PASSED] YUV 4:2:2
[08:24:37] [PASSED] YUV 4:4:4
[08:24:37] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[08:24:37] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[08:24:37] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[08:24:37] ============= drm_damage_helper (21 subtests) ==============
[08:24:37] [PASSED] drm_test_damage_iter_no_damage
[08:24:37] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[08:24:37] [PASSED] drm_test_damage_iter_no_damage_src_moved
[08:24:37] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[08:24:37] [PASSED] drm_test_damage_iter_no_damage_not_visible
[08:24:37] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[08:24:37] [PASSED] drm_test_damage_iter_no_damage_no_fb
[08:24:37] [PASSED] drm_test_damage_iter_simple_damage
[08:24:37] [PASSED] drm_test_damage_iter_single_damage
[08:24:37] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[08:24:37] [PASSED] drm_test_damage_iter_single_damage_outside_src
[08:24:37] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[08:24:37] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[08:24:37] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[08:24:37] [PASSED] drm_test_damage_iter_single_damage_src_moved
[08:24:37] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[08:24:37] [PASSED] drm_test_damage_iter_damage
[08:24:37] [PASSED] drm_test_damage_iter_damage_one_intersect
[08:24:37] [PASSED] drm_test_damage_iter_damage_one_outside
[08:24:37] [PASSED] drm_test_damage_iter_damage_src_moved
[08:24:37] [PASSED] drm_test_damage_iter_damage_not_visible
[08:24:37] ================ [PASSED] drm_damage_helper ================
[08:24:37] ============== drm_dp_mst_helper (3 subtests) ==============
[08:24:37] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[08:24:37] [PASSED] Clock 154000 BPP 30 DSC disabled
[08:24:37] [PASSED] Clock 234000 BPP 30 DSC disabled
[08:24:37] [PASSED] Clock 297000 BPP 24 DSC disabled
[08:24:37] [PASSED] Clock 332880 BPP 24 DSC enabled
[08:24:37] [PASSED] Clock 324540 BPP 24 DSC enabled
[08:24:37] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[08:24:37] ============== drm_test_dp_mst_calc_pbn_div  ===============
[08:24:37] [PASSED] Link rate 2000000 lane count 4
[08:24:37] [PASSED] Link rate 2000000 lane count 2
[08:24:37] [PASSED] Link rate 2000000 lane count 1
[08:24:37] [PASSED] Link rate 1350000 lane count 4
[08:24:37] [PASSED] Link rate 1350000 lane count 2
[08:24:37] [PASSED] Link rate 1350000 lane count 1
[08:24:37] [PASSED] Link rate 1000000 lane count 4
[08:24:37] [PASSED] Link rate 1000000 lane count 2
[08:24:37] [PASSED] Link rate 1000000 lane count 1
[08:24:37] [PASSED] Link rate 810000 lane count 4
[08:24:37] [PASSED] Link rate 810000 lane count 2
[08:24:37] [PASSED] Link rate 810000 lane count 1
[08:24:37] [PASSED] Link rate 540000 lane count 4
[08:24:37] [PASSED] Link rate 540000 lane count 2
[08:24:37] [PASSED] Link rate 540000 lane count 1
[08:24:37] [PASSED] Link rate 270000 lane count 4
[08:24:37] [PASSED] Link rate 270000 lane count 2
[08:24:37] [PASSED] Link rate 270000 lane count 1
[08:24:37] [PASSED] Link rate 162000 lane count 4
[08:24:37] [PASSED] Link rate 162000 lane count 2
[08:24:37] [PASSED] Link rate 162000 lane count 1
[08:24:37] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[08:24:37] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[08:24:37] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[08:24:37] [PASSED] DP_POWER_UP_PHY with port number
[08:24:37] [PASSED] DP_POWER_DOWN_PHY with port number
[08:24:37] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[08:24:37] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[08:24:37] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[08:24:37] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[08:24:37] [PASSED] DP_QUERY_PAYLOAD with port number
[08:24:37] [PASSED] DP_QUERY_PAYLOAD with VCPI
[08:24:37] [PASSED] DP_REMOTE_DPCD_READ with port number
[08:24:37] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[08:24:37] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[08:24:37] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[08:24:37] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[08:24:37] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[08:24:37] [PASSED] DP_REMOTE_I2C_READ with port number
[08:24:37] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[08:24:37] [PASSED] DP_REMOTE_I2C_READ with transactions array
[08:24:37] [PASSED] DP_REMOTE_I2C_WRITE with port number
[08:24:37] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[08:24:37] [PASSED] DP_REMOTE_I2C_WRITE with data array
[08:24:37] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[08:24:37] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[08:24:37] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[08:24:37] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[08:24:37] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[08:24:37] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[08:24:37] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[08:24:37] ================ [PASSED] drm_dp_mst_helper ================
[08:24:37] ================== drm_exec (7 subtests) ===================
[08:24:37] [PASSED] sanitycheck
[08:24:37] [PASSED] test_lock
[08:24:37] [PASSED] test_lock_unlock
[08:24:37] [PASSED] test_duplicates
[08:24:37] [PASSED] test_prepare
[08:24:37] [PASSED] test_prepare_array
[08:24:37] [PASSED] test_multiple_loops
[08:24:37] ==================== [PASSED] drm_exec =====================
[08:24:37] =========== drm_format_helper_test (18 subtests) ===========
[08:24:37] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[08:24:37] [PASSED] single_pixel_source_buffer
[08:24:37] [PASSED] single_pixel_clip_rectangle
[08:24:37] [PASSED] well_known_colors
[08:24:37] [PASSED] destination_pitch
[08:24:37] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[08:24:37] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[08:24:37] [PASSED] single_pixel_source_buffer
[08:24:37] [PASSED] single_pixel_clip_rectangle
[08:24:37] [PASSED] well_known_colors
[08:24:37] [PASSED] destination_pitch
[08:24:37] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[08:24:37] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[08:24:37] [PASSED] single_pixel_source_buffer
[08:24:37] [PASSED] single_pixel_clip_rectangle
[08:24:37] [PASSED] well_known_colors
[08:24:37] [PASSED] destination_pitch
[08:24:37] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[08:24:37] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[08:24:37] [PASSED] single_pixel_source_buffer
[08:24:37] [PASSED] single_pixel_clip_rectangle
[08:24:37] [PASSED] well_known_colors
[08:24:37] [PASSED] destination_pitch
[08:24:37] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[08:24:37] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[08:24:37] [PASSED] single_pixel_source_buffer
[08:24:37] [PASSED] single_pixel_clip_rectangle
[08:24:37] [PASSED] well_known_colors
[08:24:37] [PASSED] destination_pitch
[08:24:37] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[08:24:37] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[08:24:37] [PASSED] single_pixel_source_buffer
[08:24:37] [PASSED] single_pixel_clip_rectangle
[08:24:37] [PASSED] well_known_colors
[08:24:37] [PASSED] destination_pitch
[08:24:37] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[08:24:37] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[08:24:37] [PASSED] single_pixel_source_buffer
[08:24:37] [PASSED] single_pixel_clip_rectangle
[08:24:37] [PASSED] well_known_colors
[08:24:37] [PASSED] destination_pitch
[08:24:37] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[08:24:37] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[08:24:37] [PASSED] single_pixel_source_buffer
[08:24:37] [PASSED] single_pixel_clip_rectangle
[08:24:37] [PASSED] well_known_colors
[08:24:37] [PASSED] destination_pitch
[08:24:37] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[08:24:37] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[08:24:37] [PASSED] single_pixel_source_buffer
[08:24:37] [PASSED] single_pixel_clip_rectangle
[08:24:37] [PASSED] well_known_colors
[08:24:37] [PASSED] destination_pitch
[08:24:37] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[08:24:37] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[08:24:37] [PASSED] single_pixel_source_buffer
[08:24:37] [PASSED] single_pixel_clip_rectangle
[08:24:37] [PASSED] well_known_colors
[08:24:37] [PASSED] destination_pitch
[08:24:37] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[08:24:37] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[08:24:37] [PASSED] single_pixel_source_buffer
[08:24:37] [PASSED] single_pixel_clip_rectangle
[08:24:37] [PASSED] well_known_colors
[08:24:37] [PASSED] destination_pitch
[08:24:37] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[08:24:37] ============== drm_test_fb_xrgb8888_to_mono  ===============
[08:24:37] [PASSED] single_pixel_source_buffer
[08:24:37] [PASSED] single_pixel_clip_rectangle
[08:24:37] [PASSED] well_known_colors
[08:24:37] [PASSED] destination_pitch
[08:24:37] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[08:24:37] ==================== drm_test_fb_swab  =====================
[08:24:37] [PASSED] single_pixel_source_buffer
[08:24:37] [PASSED] single_pixel_clip_rectangle
[08:24:37] [PASSED] well_known_colors
[08:24:37] [PASSED] destination_pitch
[08:24:37] ================ [PASSED] drm_test_fb_swab =================
[08:24:37] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[08:24:37] [PASSED] single_pixel_source_buffer
[08:24:37] [PASSED] single_pixel_clip_rectangle
[08:24:37] [PASSED] well_known_colors
[08:24:37] [PASSED] destination_pitch
[08:24:37] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[08:24:37] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[08:24:37] [PASSED] single_pixel_source_buffer
[08:24:37] [PASSED] single_pixel_clip_rectangle
[08:24:37] [PASSED] well_known_colors
[08:24:37] [PASSED] destination_pitch
[08:24:37] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[08:24:37] ================= drm_test_fb_clip_offset  =================
[08:24:37] [PASSED] pass through
[08:24:37] [PASSED] horizontal offset
[08:24:37] [PASSED] vertical offset
[08:24:37] [PASSED] horizontal and vertical offset
[08:24:37] [PASSED] horizontal offset (custom pitch)
[08:24:37] [PASSED] vertical offset (custom pitch)
[08:24:37] [PASSED] horizontal and vertical offset (custom pitch)
[08:24:37] ============= [PASSED] drm_test_fb_clip_offset =============
[08:24:37] ============== drm_test_fb_build_fourcc_list  ==============
[08:24:37] [PASSED] no native formats
[08:24:37] [PASSED] XRGB8888 as native format
[08:24:37] [PASSED] remove duplicates
[08:24:37] [PASSED] convert alpha formats
[08:24:37] [PASSED] random formats
[08:24:37] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[08:24:37] =================== drm_test_fb_memcpy  ====================
[08:24:37] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[08:24:37] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[08:24:37] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[08:24:37] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[08:24:37] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[08:24:37] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[08:24:37] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[08:24:37] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[08:24:37] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[08:24:37] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[08:24:37] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[08:24:37] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[08:24:37] =============== [PASSED] drm_test_fb_memcpy ================
[08:24:37] ============= [PASSED] drm_format_helper_test ==============
[08:24:37] ================= drm_format (18 subtests) =================
[08:24:37] [PASSED] drm_test_format_block_width_invalid
[08:24:37] [PASSED] drm_test_format_block_width_one_plane
[08:24:37] [PASSED] drm_test_format_block_width_two_plane
[08:24:37] [PASSED] drm_test_format_block_width_three_plane
[08:24:37] [PASSED] drm_test_format_block_width_tiled
[08:24:37] [PASSED] drm_test_format_block_height_invalid
[08:24:37] [PASSED] drm_test_format_block_height_one_plane
[08:24:37] [PASSED] drm_test_format_block_height_two_plane
[08:24:37] [PASSED] drm_test_format_block_height_three_plane
[08:24:37] [PASSED] drm_test_format_block_height_tiled
[08:24:37] [PASSED] drm_test_format_min_pitch_invalid
[08:24:37] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[08:24:37] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[08:24:37] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[08:24:37] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[08:24:37] [PASSED] drm_test_format_min_pitch_two_plane
[08:24:37] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[08:24:37] [PASSED] drm_test_format_min_pitch_tiled
[08:24:37] =================== [PASSED] drm_format ====================
[08:24:37] ============== drm_framebuffer (10 subtests) ===============
[08:24:37] ========== drm_test_framebuffer_check_src_coords  ==========
[08:24:37] [PASSED] Success: source fits into fb
[08:24:37] [PASSED] Fail: overflowing fb with x-axis coordinate
[08:24:37] [PASSED] Fail: overflowing fb with y-axis coordinate
[08:24:37] [PASSED] Fail: overflowing fb with source width
[08:24:37] [PASSED] Fail: overflowing fb with source height
[08:24:37] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[08:24:37] [PASSED] drm_test_framebuffer_cleanup
[08:24:37] =============== drm_test_framebuffer_create  ===============
[08:24:37] [PASSED] ABGR8888 normal sizes
[08:24:37] [PASSED] ABGR8888 max sizes
[08:24:37] [PASSED] ABGR8888 pitch greater than min required
[08:24:37] [PASSED] ABGR8888 pitch less than min required
[08:24:37] [PASSED] ABGR8888 Invalid width
[08:24:37] [PASSED] ABGR8888 Invalid buffer handle
[08:24:37] [PASSED] No pixel format
[08:24:37] [PASSED] ABGR8888 Width 0
[08:24:37] [PASSED] ABGR8888 Height 0
[08:24:37] [PASSED] ABGR8888 Out of bound height * pitch combination
[08:24:37] [PASSED] ABGR8888 Large buffer offset
[08:24:37] [PASSED] ABGR8888 Buffer offset for inexistent plane
[08:24:37] [PASSED] ABGR8888 Invalid flag
[08:24:37] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[08:24:37] [PASSED] ABGR8888 Valid buffer modifier
[08:24:37] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[08:24:37] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[08:24:37] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[08:24:37] [PASSED] NV12 Normal sizes
[08:24:37] [PASSED] NV12 Max sizes
[08:24:37] [PASSED] NV12 Invalid pitch
[08:24:37] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[08:24:37] [PASSED] NV12 different  modifier per-plane
[08:24:37] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[08:24:37] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[08:24:37] [PASSED] NV12 Modifier for inexistent plane
[08:24:37] [PASSED] NV12 Handle for inexistent plane
[08:24:37] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[08:24:37] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[08:24:37] [PASSED] YVU420 Normal sizes
[08:24:37] [PASSED] YVU420 Max sizes
[08:24:37] [PASSED] YVU420 Invalid pitch
[08:24:37] [PASSED] YVU420 Different pitches
[08:24:37] [PASSED] YVU420 Different buffer offsets/pitches
[08:24:37] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[08:24:37] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[08:24:37] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[08:24:37] [PASSED] YVU420 Valid modifier
[08:24:37] [PASSED] YVU420 Different modifiers per plane
[08:24:37] [PASSED] YVU420 Modifier for inexistent plane
[08:24:37] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[08:24:37] [PASSED] X0L2 Normal sizes
[08:24:37] [PASSED] X0L2 Max sizes
[08:24:37] [PASSED] X0L2 Invalid pitch
[08:24:37] [PASSED] X0L2 Pitch greater than minimum required
[08:24:37] [PASSED] X0L2 Handle for inexistent plane
[08:24:37] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[08:24:37] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[08:24:37] [PASSED] X0L2 Valid modifier
[08:24:37] [PASSED] X0L2 Modifier for inexistent plane
[08:24:37] =========== [PASSED] drm_test_framebuffer_create ===========
[08:24:37] [PASSED] drm_test_framebuffer_free
[08:24:37] [PASSED] drm_test_framebuffer_init
[08:24:37] [PASSED] drm_test_framebuffer_init_bad_format
[08:24:37] [PASSED] drm_test_framebuffer_init_dev_mismatch
[08:24:37] [PASSED] drm_test_framebuffer_lookup
[08:24:37] [PASSED] drm_test_framebuffer_lookup_inexistent
[08:24:37] [PASSED] drm_test_framebuffer_modifiers_not_supported
[08:24:37] ================= [PASSED] drm_framebuffer =================
[08:24:37] ================ drm_gem_shmem (8 subtests) ================
[08:24:37] [PASSED] drm_gem_shmem_test_obj_create
[08:24:37] [PASSED] drm_gem_shmem_test_obj_create_private
[08:24:37] [PASSED] drm_gem_shmem_test_pin_pages
[08:24:37] [PASSED] drm_gem_shmem_test_vmap
[08:24:37] [PASSED] drm_gem_shmem_test_get_pages_sgt
[08:24:37] [PASSED] drm_gem_shmem_test_get_sg_table
[08:24:37] [PASSED] drm_gem_shmem_test_madvise
[08:24:37] [PASSED] drm_gem_shmem_test_purge
[08:24:37] ================== [PASSED] drm_gem_shmem ==================
[08:24:37] === drm_atomic_helper_connector_hdmi_check (23 subtests) ===
[08:24:37] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[08:24:37] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[08:24:37] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[08:24:37] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[08:24:37] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[08:24:37] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[08:24:37] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[08:24:37] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[08:24:37] [PASSED] drm_test_check_disable_connector
[08:24:37] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[08:24:37] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[08:24:37] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[08:24:37] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[08:24:37] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[08:24:37] [PASSED] drm_test_check_output_bpc_dvi
[08:24:37] [PASSED] drm_test_check_output_bpc_format_vic_1
[08:24:37] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[08:24:37] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[08:24:37] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[08:24:37] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[08:24:37] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[08:24:37] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[08:24:37] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[08:24:37] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[08:24:37] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[08:24:37] [PASSED] drm_test_check_broadcast_rgb_value
[08:24:37] [PASSED] drm_test_check_bpc_8_value
[08:24:37] [PASSED] drm_test_check_bpc_10_value
[08:24:37] [PASSED] drm_test_check_bpc_12_value
[08:24:37] [PASSED] drm_test_check_format_value
[08:24:37] [PASSED] drm_test_check_tmds_char_value
[08:24:37] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[08:24:37] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[08:24:37] [PASSED] drm_test_check_mode_valid
[08:24:37] [PASSED] drm_test_check_mode_valid_reject
[08:24:37] [PASSED] drm_test_check_mode_valid_reject_rate
[08:24:37] [PASSED] drm_test_check_mode_valid_reject_max_clock
[08:24:37] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[08:24:37] ================= drm_managed (2 subtests) =================
[08:24:37] [PASSED] drm_test_managed_release_action
[08:24:37] [PASSED] drm_test_managed_run_action
[08:24:37] =================== [PASSED] drm_managed ===================
[08:24:37] =================== drm_mm (6 subtests) ====================
[08:24:37] [PASSED] drm_test_mm_init
[08:24:37] [PASSED] drm_test_mm_debug
[08:24:37] [PASSED] drm_test_mm_align32
[08:24:37] [PASSED] drm_test_mm_align64
[08:24:37] [PASSED] drm_test_mm_lowest
[08:24:37] [PASSED] drm_test_mm_highest
[08:24:37] ===================== [PASSED] drm_mm ======================
[08:24:37] ============= drm_modes_analog_tv (5 subtests) =============
[08:24:37] [PASSED] drm_test_modes_analog_tv_mono_576i
[08:24:37] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[08:24:37] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[08:24:37] [PASSED] drm_test_modes_analog_tv_pal_576i
[08:24:37] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[08:24:37] =============== [PASSED] drm_modes_analog_tv ===============
[08:24:37] ============== drm_plane_helper (2 subtests) ===============
[08:24:37] =============== drm_test_check_plane_state  ================
[08:24:37] [PASSED] clipping_simple
[08:24:37] [PASSED] clipping_rotate_reflect
[08:24:37] [PASSED] positioning_simple
[08:24:37] [PASSED] upscaling
[08:24:37] [PASSED] downscaling
[08:24:37] [PASSED] rounding1
[08:24:37] [PASSED] rounding2
[08:24:37] [PASSED] rounding3
[08:24:37] [PASSED] rounding4
[08:24:37] =========== [PASSED] drm_test_check_plane_state ============
[08:24:37] =========== drm_test_check_invalid_plane_state  ============
[08:24:37] [PASSED] positioning_invalid
[08:24:37] [PASSED] upscaling_invalid
[08:24:37] [PASSED] downscaling_invalid
[08:24:37] ======= [PASSED] drm_test_check_invalid_plane_state ========
[08:24:37] ================ [PASSED] drm_plane_helper =================
[08:24:37] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[08:24:37] ====== drm_test_connector_helper_tv_get_modes_check  =======
[08:24:37] [PASSED] None
[08:24:37] [PASSED] PAL
[08:24:37] [PASSED] NTSC
[08:24:37] [PASSED] Both, NTSC Default
[08:24:37] [PASSED] Both, PAL Default
[08:24:37] [PASSED] Both, NTSC Default, with PAL on command-line
[08:24:37] [PASSED] Both, PAL Default, with NTSC on command-line
[08:24:37] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[08:24:37] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[08:24:37] ================== drm_rect (9 subtests) ===================
[08:24:37] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[08:24:37] [PASSED] drm_test_rect_clip_scaled_not_clipped
[08:24:37] [PASSED] drm_test_rect_clip_scaled_clipped
[08:24:37] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[08:24:37] ================= drm_test_rect_intersect  =================
[08:24:37] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[08:24:37] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[08:24:37] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[08:24:37] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[08:24:37] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[08:24:37] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[08:24:37] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[08:24:37] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[08:24:37] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[08:24:37] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[08:24:37] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[08:24:37] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[08:24:37] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[08:24:37] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[08:24:37] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[08:24:37] ============= [PASSED] drm_test_rect_intersect =============
[08:24:37] ================ drm_test_rect_calc_hscale  ================
[08:24:37] [PASSED] normal use
[08:24:37] [PASSED] out of max range
[08:24:37] [PASSED] out of min range
[08:24:37] [PASSED] zero dst
[08:24:37] [PASSED] negative src
[08:24:37] [PASSED] negative dst
[08:24:37] ============ [PASSED] drm_test_rect_calc_hscale ============
[08:24:37] ================ drm_test_rect_calc_vscale  ================
[08:24:37] [PASSED] normal use
[08:24:37] [PASSED] out of max range
[08:24:37] [PASSED] out of min range
[08:24:37] [PASSED] zero dst
[08:24:37] [PASSED] negative src
[08:24:37] [PASSED] negative dst
[08:24:37] ============ [PASSED] drm_test_rect_calc_vscale ============
[08:24:37] ================== drm_test_rect_rotate  ===================
[08:24:37] [PASSED] reflect-x
[08:24:37] [PASSED] reflect-y
[08:24:37] [PASSED] rotate-0
[08:24:37] [PASSED] rotate-90
[08:24:37] [PASSED] rotate-180
[08:24:37] [PASSED] rotate-270
[08:24:37] ============== [PASSED] drm_test_rect_rotate ===============
[08:24:37] ================ drm_test_rect_rotate_inv  =================
[08:24:37] [PASSED] reflect-x
[08:24:37] [PASSED] reflect-y
[08:24:37] [PASSED] rotate-0
[08:24:37] [PASSED] rotate-90
[08:24:37] [PASSED] rotate-180
[08:24:37] [PASSED] rotate-270
[08:24:37] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[08:24:37] ==================== [PASSED] drm_rect =====================
[08:24:37] ============================================================
[08:24:37] Testing complete. Ran 608 tests: passed: 608
[08:24:37] Elapsed time: 22.982s total, 1.676s configuring, 21.139s building, 0.149s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[08:24:37] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:24:38] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[08:24:46] Starting KUnit Kernel (1/1)...
[08:24:46] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[08:24:46] ================= ttm_device (5 subtests) ==================
[08:24:46] [PASSED] ttm_device_init_basic
[08:24:46] [PASSED] ttm_device_init_multiple
[08:24:46] [PASSED] ttm_device_fini_basic
[08:24:46] [PASSED] ttm_device_init_no_vma_man
[08:24:46] ================== ttm_device_init_pools  ==================
[08:24:46] [PASSED] No DMA allocations, no DMA32 required
[08:24:46] [PASSED] DMA allocations, DMA32 required
[08:24:46] [PASSED] No DMA allocations, DMA32 required
[08:24:46] [PASSED] DMA allocations, no DMA32 required
[08:24:46] ============== [PASSED] ttm_device_init_pools ==============
[08:24:46] =================== [PASSED] ttm_device ====================
[08:24:46] ================== ttm_pool (8 subtests) ===================
[08:24:46] ================== ttm_pool_alloc_basic  ===================
[08:24:46] [PASSED] One page
[08:24:46] [PASSED] More than one page
[08:24:46] [PASSED] Above the allocation limit
[08:24:46] [PASSED] One page, with coherent DMA mappings enabled
[08:24:46] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[08:24:46] ============== [PASSED] ttm_pool_alloc_basic ===============
[08:24:46] ============== ttm_pool_alloc_basic_dma_addr  ==============
[08:24:46] [PASSED] One page
[08:24:46] [PASSED] More than one page
[08:24:46] [PASSED] Above the allocation limit
[08:24:46] [PASSED] One page, with coherent DMA mappings enabled
[08:24:46] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[08:24:46] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[08:24:46] [PASSED] ttm_pool_alloc_order_caching_match
[08:24:46] [PASSED] ttm_pool_alloc_caching_mismatch
[08:24:46] [PASSED] ttm_pool_alloc_order_mismatch
[08:24:46] [PASSED] ttm_pool_free_dma_alloc
[08:24:46] [PASSED] ttm_pool_free_no_dma_alloc
[08:24:46] [PASSED] ttm_pool_fini_basic
[08:24:46] ==================== [PASSED] ttm_pool =====================
[08:24:46] ================ ttm_resource (8 subtests) =================
[08:24:46] ================= ttm_resource_init_basic  =================
[08:24:46] [PASSED] Init resource in TTM_PL_SYSTEM
[08:24:46] [PASSED] Init resource in TTM_PL_VRAM
[08:24:46] [PASSED] Init resource in a private placement
[08:24:46] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[08:24:46] ============= [PASSED] ttm_resource_init_basic =============
[08:24:46] [PASSED] ttm_resource_init_pinned
[08:24:46] [PASSED] ttm_resource_fini_basic
[08:24:46] [PASSED] ttm_resource_manager_init_basic
[08:24:46] [PASSED] ttm_resource_manager_usage_basic
[08:24:46] [PASSED] ttm_resource_manager_set_used_basic
[08:24:46] [PASSED] ttm_sys_man_alloc_basic
[08:24:46] [PASSED] ttm_sys_man_free_basic
[08:24:46] ================== [PASSED] ttm_resource ===================
[08:24:46] =================== ttm_tt (15 subtests) ===================
[08:24:46] ==================== ttm_tt_init_basic  ====================
[08:24:46] [PASSED] Page-aligned size
[08:24:46] [PASSED] Extra pages requested
[08:24:46] ================ [PASSED] ttm_tt_init_basic ================
[08:24:46] [PASSED] ttm_tt_init_misaligned
[08:24:46] [PASSED] ttm_tt_fini_basic
[08:24:46] [PASSED] ttm_tt_fini_sg
[08:24:46] [PASSED] ttm_tt_fini_shmem
[08:24:46] [PASSED] ttm_tt_create_basic
[08:24:46] [PASSED] ttm_tt_create_invalid_bo_type
[08:24:46] [PASSED] ttm_tt_create_ttm_exists
[08:24:46] [PASSED] ttm_tt_create_failed
[08:24:46] [PASSED] ttm_tt_destroy_basic
[08:24:46] [PASSED] ttm_tt_populate_null_ttm
[08:24:46] [PASSED] ttm_tt_populate_populated_ttm
[08:24:46] [PASSED] ttm_tt_unpopulate_basic
[08:24:46] [PASSED] ttm_tt_unpopulate_empty_ttm
[08:24:46] [PASSED] ttm_tt_swapin_basic
[08:24:46] ===================== [PASSED] ttm_tt ======================
[08:24:46] =================== ttm_bo (14 subtests) ===================
[08:24:46] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[08:24:46] [PASSED] Cannot be interrupted and sleeps
[08:24:46] [PASSED] Cannot be interrupted, locks straight away
[08:24:46] [PASSED] Can be interrupted, sleeps
[08:24:46] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[08:24:46] [PASSED] ttm_bo_reserve_locked_no_sleep
[08:24:46] [PASSED] ttm_bo_reserve_no_wait_ticket
[08:24:46] [PASSED] ttm_bo_reserve_double_resv
[08:24:46] [PASSED] ttm_bo_reserve_interrupted
[08:24:46] [PASSED] ttm_bo_reserve_deadlock
[08:24:46] [PASSED] ttm_bo_unreserve_basic
[08:24:46] [PASSED] ttm_bo_unreserve_pinned
[08:24:46] [PASSED] ttm_bo_unreserve_bulk
[08:24:46] [PASSED] ttm_bo_put_basic
[08:24:46] [PASSED] ttm_bo_put_shared_resv
[08:24:46] [PASSED] ttm_bo_pin_basic
[08:24:46] [PASSED] ttm_bo_pin_unpin_resource
[08:24:46] [PASSED] ttm_bo_multiple_pin_one_unpin
[08:24:46] ===================== [PASSED] ttm_bo ======================
[08:24:46] ============== ttm_bo_validate (22 subtests) ===============
[08:24:46] ============== ttm_bo_init_reserved_sys_man  ===============
[08:24:46] [PASSED] Buffer object for userspace
[08:24:46] [PASSED] Kernel buffer object
[08:24:46] [PASSED] Shared buffer object
[08:24:46] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[08:24:46] ============== ttm_bo_init_reserved_mock_man  ==============
[08:24:46] [PASSED] Buffer object for userspace
[08:24:46] [PASSED] Kernel buffer object
[08:24:46] [PASSED] Shared buffer object
[08:24:46] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[08:24:46] [PASSED] ttm_bo_init_reserved_resv
[08:24:46] ================== ttm_bo_validate_basic  ==================
[08:24:46] [PASSED] Buffer object for userspace
[08:24:46] [PASSED] Kernel buffer object
[08:24:46] [PASSED] Shared buffer object
[08:24:46] ============== [PASSED] ttm_bo_validate_basic ==============
[08:24:46] [PASSED] ttm_bo_validate_invalid_placement
[08:24:46] ============= ttm_bo_validate_same_placement  ==============
[08:24:46] [PASSED] System manager
[08:24:46] [PASSED] VRAM manager
[08:24:46] ========= [PASSED] ttm_bo_validate_same_placement ==========
[08:24:46] [PASSED] ttm_bo_validate_failed_alloc
[08:24:46] [PASSED] ttm_bo_validate_pinned
[08:24:46] [PASSED] ttm_bo_validate_busy_placement
[08:24:46] ================ ttm_bo_validate_multihop  =================
[08:24:46] [PASSED] Buffer object for userspace
[08:24:46] [PASSED] Kernel buffer object
[08:24:46] [PASSED] Shared buffer object
[08:24:46] ============ [PASSED] ttm_bo_validate_multihop =============
[08:24:46] ========== ttm_bo_validate_no_placement_signaled  ==========
[08:24:46] [PASSED] Buffer object in system domain, no page vector
[08:24:46] [PASSED] Buffer object in system domain with an existing page vector
[08:24:46] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[08:24:46] ======== ttm_bo_validate_no_placement_not_signaled  ========
[08:24:46] [PASSED] Buffer object for userspace
[08:24:46] [PASSED] Kernel buffer object
[08:24:46] [PASSED] Shared buffer object
[08:24:46] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[08:24:46] [PASSED] ttm_bo_validate_move_fence_signaled
[08:24:46] ========= ttm_bo_validate_move_fence_not_signaled  =========
[08:24:46] [PASSED] Waits for GPU
[08:24:46] [PASSED] Tries to lock straight away
[08:24:47] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[08:24:47] [PASSED] ttm_bo_validate_swapout
[08:24:47] [PASSED] ttm_bo_validate_happy_evict
[08:24:47] [PASSED] ttm_bo_validate_all_pinned_evict
[08:24:47] [PASSED] ttm_bo_validate_allowed_only_evict
[08:24:47] [PASSED] ttm_bo_validate_deleted_evict
[08:24:47] [PASSED] ttm_bo_validate_busy_domain_evict
[08:24:47] [PASSED] ttm_bo_validate_evict_gutting
[08:24:47] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[08:24:47] ================= [PASSED] ttm_bo_validate =================
[08:24:47] ============================================================
[08:24:47] Testing complete. Ran 102 tests: passed: 102
[08:24:47] Elapsed time: 9.900s total, 1.581s configuring, 7.701s building, 0.519s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


