Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640ADC3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 22:00:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259A610E048;
	Mon, 12 May 2025 22:00:12 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C24010E048;
 Mon, 12 May 2025 22:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Track_FAST=5FREQ_H2Gs_to_repor?=
 =?utf-8?q?t_where_errors_came_from?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 May 2025 22:00:11 -0000
Message-ID: <174708721117.71133.15582647662871226706@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512215324.1457009-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250512215324.1457009-1-John.C.Harrison@Intel.com>
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

Series: Track FAST_REQ H2Gs to report where errors came from
URL   : https://patchwork.freedesktop.org/series/148912/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[21:59:02] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:59:07] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[21:59:33] Starting KUnit Kernel (1/1)...
[21:59:33] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[21:59:33] ================== guc_buf (11 subtests) ===================
[21:59:33] [PASSED] test_smallest
[21:59:33] [PASSED] test_largest
[21:59:33] [PASSED] test_granular
[21:59:33] [PASSED] test_unique
[21:59:33] [PASSED] test_overlap
[21:59:33] [PASSED] test_reusable
[21:59:33] [PASSED] test_too_big
[21:59:33] [PASSED] test_flush
[21:59:33] [PASSED] test_lookup
[21:59:33] [PASSED] test_data
[21:59:33] [PASSED] test_class
[21:59:33] ===================== [PASSED] guc_buf =====================
[21:59:33] =================== guc_dbm (7 subtests) ===================
[21:59:33] [PASSED] test_empty
[21:59:33] [PASSED] test_default
[21:59:33] ======================== test_size  ========================
[21:59:33] [PASSED] 4
[21:59:33] [PASSED] 8
[21:59:33] [PASSED] 32
[21:59:33] [PASSED] 256
[21:59:33] ==================== [PASSED] test_size ====================
[21:59:33] ======================= test_reuse  ========================
[21:59:33] [PASSED] 4
[21:59:33] [PASSED] 8
[21:59:33] [PASSED] 32
[21:59:33] [PASSED] 256
[21:59:33] =================== [PASSED] test_reuse ====================
[21:59:33] =================== test_range_overlap  ====================
[21:59:33] [PASSED] 4
[21:59:33] [PASSED] 8
[21:59:33] [PASSED] 32
[21:59:33] [PASSED] 256
[21:59:33] =============== [PASSED] test_range_overlap ================
[21:59:33] =================== test_range_compact  ====================
[21:59:33] [PASSED] 4
[21:59:33] [PASSED] 8
[21:59:33] [PASSED] 32
[21:59:33] [PASSED] 256
[21:59:33] =============== [PASSED] test_range_compact ================
[21:59:33] ==================== test_range_spare  =====================
[21:59:33] [PASSED] 4
[21:59:33] [PASSED] 8
[21:59:33] [PASSED] 32
[21:59:33] [PASSED] 256
[21:59:33] ================ [PASSED] test_range_spare =================
[21:59:33] ===================== [PASSED] guc_dbm =====================
[21:59:33] =================== guc_idm (6 subtests) ===================
[21:59:33] [PASSED] bad_init
[21:59:33] [PASSED] no_init
[21:59:33] [PASSED] init_fini
[21:59:33] [PASSED] check_used
[21:59:33] [PASSED] check_quota
[21:59:33] [PASSED] check_all
[21:59:33] ===================== [PASSED] guc_idm =====================
[21:59:33] ================== no_relay (3 subtests) ===================
[21:59:33] [PASSED] xe_drops_guc2pf_if_not_ready
[21:59:33] [PASSED] xe_drops_guc2vf_if_not_ready
[21:59:33] [PASSED] xe_rejects_send_if_not_ready
[21:59:33] ==================== [PASSED] no_relay =====================
[21:59:33] ================== pf_relay (14 subtests) ==================
[21:59:33] [PASSED] pf_rejects_guc2pf_too_short
[21:59:33] [PASSED] pf_rejects_guc2pf_too_long
[21:59:33] [PASSED] pf_rejects_guc2pf_no_payload
[21:59:33] [PASSED] pf_fails_no_payload
[21:59:33] [PASSED] pf_fails_bad_origin
[21:59:33] [PASSED] pf_fails_bad_type
[21:59:33] [PASSED] pf_txn_reports_error
[21:59:33] [PASSED] pf_txn_sends_pf2guc
[21:59:33] [PASSED] pf_sends_pf2guc
[21:59:33] [SKIPPED] pf_loopback_nop
[21:59:33] [SKIPPED] pf_loopback_echo
[21:59:33] [SKIPPED] pf_loopback_fail
[21:59:33] [SKIPPED] pf_loopback_busy
[21:59:33] [SKIPPED] pf_loopback_retry
[21:59:33] ==================== [PASSED] pf_relay =====================
[21:59:33] ================== vf_relay (3 subtests) ===================
[21:59:33] [PASSED] vf_rejects_guc2vf_too_short
[21:59:33] [PASSED] vf_rejects_guc2vf_too_long
[21:59:33] [PASSED] vf_rejects_guc2vf_no_payload
[21:59:33] ==================== [PASSED] vf_relay =====================
[21:59:33] ================= pf_service (11 subtests) =================
[21:59:33] [PASSED] pf_negotiate_any
[21:59:33] [PASSED] pf_negotiate_base_match
[21:59:33] [PASSED] pf_negotiate_base_newer
[21:59:33] [PASSED] pf_negotiate_base_next
[21:59:33] [SKIPPED] pf_negotiate_base_older
[21:59:33] [PASSED] pf_negotiate_base_prev
[21:59:33] [PASSED] pf_negotiate_latest_match
[21:59:33] [PASSED] pf_negotiate_latest_newer
[21:59:33] [PASSED] pf_negotiate_latest_next
[21:59:33] [SKIPPED] pf_negotiate_latest_older
[21:59:33] [SKIPPED] pf_negotiate_latest_prev
[21:59:33] =================== [PASSED] pf_service ====================
[21:59:33] ===================== lmtt (1 subtest) =====================
[21:59:33] ======================== test_ops  =========================
[21:59:33] [PASSED] 2-level
[21:59:33] [PASSED] multi-level
[21:59:33] ==================== [PASSED] test_ops =====================
[21:59:33] ====================== [PASSED] lmtt =======================
[21:59:33] =================== xe_mocs (2 subtests) ===================
[21:59:33] ================ xe_live_mocs_kernel_kunit  ================
[21:59:33] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[21:59:33] ================ xe_live_mocs_reset_kunit  =================
[21:59:33] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[21:59:33] ==================== [SKIPPED] xe_mocs =====================
[21:59:33] ================= xe_migrate (2 subtests) ==================
[21:59:33] ================= xe_migrate_sanity_kunit  =================
[21:59:33] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[21:59:33] ================== xe_validate_ccs_kunit  ==================
[21:59:33] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[21:59:33] =================== [SKIPPED] xe_migrate ===================
[21:59:33] ================== xe_dma_buf (1 subtest) ==================
[21:59:33] ==================== xe_dma_buf_kunit  =====================
[21:59:33] ================ [SKIPPED] xe_dma_buf_kunit ================
[21:59:33] =================== [SKIPPED] xe_dma_buf ===================
[21:59:33] ================= xe_bo_shrink (1 subtest) =================
[21:59:33] =================== xe_bo_shrink_kunit  ====================
[21:59:33] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[21:59:33] ================== [SKIPPED] xe_bo_shrink ==================
[21:59:33] ==================== xe_bo (2 subtests) ====================
[21:59:33] ================== xe_ccs_migrate_kunit  ===================
[21:59:33] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[21:59:33] ==================== xe_bo_evict_kunit  ====================
[21:59:33] =============== [SKIPPED] xe_bo_evict_kunit ================
[21:59:33] ===================== [SKIPPED] xe_bo ======================
[21:59:33] ==================== args (11 subtests) ====================
[21:59:33] [PASSED] count_args_test
[21:59:33] [PASSED] call_args_example
[21:59:33] [PASSED] call_args_test
[21:59:33] [PASSED] drop_first_arg_example
[21:59:33] [PASSED] drop_first_arg_test
[21:59:33] [PASSED] first_arg_example
[21:59:33] [PASSED] first_arg_test
[21:59:33] [PASSED] last_arg_example
[21:59:33] [PASSED] last_arg_test
[21:59:33] [PASSED] pick_arg_example
[21:59:33] [PASSED] sep_comma_example
[21:59:33] ====================== [PASSED] args =======================
[21:59:33] =================== xe_pci (2 subtests) ====================
[21:59:33] [PASSED] xe_gmdid_graphics_ip
[21:59:33] [PASSED] xe_gmdid_media_ip
[21:59:33] ===================== [PASSED] xe_pci ======================
[21:59:33] =================== xe_rtp (2 subtests) ====================
[21:59:33] =============== xe_rtp_process_to_sr_tests  ================
[21:59:33] [PASSED] coalesce-same-reg
[21:59:33] [PASSED] no-match-no-add
[21:59:33] [PASSED] match-or
[21:59:33] [PASSED] match-or-xfail
[21:59:33] [PASSED] no-match-no-add-multiple-rules
[21:59:33] [PASSED] two-regs-two-entries
[21:59:33] [PASSED] clr-one-set-other
[21:59:33] [PASSED] set-field
[21:59:33] [PASSED] conflict-duplicate
[21:59:33] [PASSED] conflict-not-disjoint
stty: 'standard input': Inappropriate ioctl for device
[21:59:33] [PASSED] conflict-reg-type
[21:59:33] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[21:59:33] ================== xe_rtp_process_tests  ===================
[21:59:33] [PASSED] active1
[21:59:33] [PASSED] active2
[21:59:33] [PASSED] active-inactive
[21:59:33] [PASSED] inactive-active
[21:59:33] [PASSED] inactive-1st_or_active-inactive
[21:59:33] [PASSED] inactive-2nd_or_active-inactive
[21:59:33] [PASSED] inactive-last_or_active-inactive
[21:59:33] [PASSED] inactive-no_or_active-inactive
[21:59:33] ============== [PASSED] xe_rtp_process_tests ===============
[21:59:33] ===================== [PASSED] xe_rtp ======================
[21:59:33] ==================== xe_wa (1 subtest) =====================
[21:59:33] ======================== xe_wa_gt  =========================
[21:59:33] [PASSED] TIGERLAKE (B0)
[21:59:33] [PASSED] DG1 (A0)
[21:59:33] [PASSED] DG1 (B0)
[21:59:33] [PASSED] ALDERLAKE_S (A0)
[21:59:33] [PASSED] ALDERLAKE_S (B0)
[21:59:33] [PASSED] ALDERLAKE_S (C0)
[21:59:33] [PASSED] ALDERLAKE_S (D0)
[21:59:33] [PASSED] ALDERLAKE_P (A0)
[21:59:33] [PASSED] ALDERLAKE_P (B0)
[21:59:33] [PASSED] ALDERLAKE_P (C0)
[21:59:33] [PASSED] ALDERLAKE_S_RPLS (D0)
[21:59:33] [PASSED] ALDERLAKE_P_RPLU (E0)
[21:59:33] [PASSED] DG2_G10 (C0)
[21:59:33] [PASSED] DG2_G11 (B1)
[21:59:33] [PASSED] DG2_G12 (A1)
[21:59:33] [PASSED] METEORLAKE (g:A0, m:A0)
[21:59:33] [PASSED] METEORLAKE (g:A0, m:A0)
[21:59:33] [PASSED] METEORLAKE (g:A0, m:A0)
[21:59:33] [PASSED] LUNARLAKE (g:A0, m:A0)
[21:59:33] [PASSED] LUNARLAKE (g:B0, m:A0)
[21:59:33] [PASSED] BATTLEMAGE (g:A0, m:A1)
[21:59:33] ==================== [PASSED] xe_wa_gt =====================
[21:59:33] ====================== [PASSED] xe_wa ======================
[21:59:33] ============================================================
[21:59:33] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[21:59:33] Elapsed time: 30.989s total, 4.243s configuring, 26.428s building, 0.292s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[21:59:33] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:59:35] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[21:59:57] Starting KUnit Kernel (1/1)...
[21:59:57] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[21:59:57] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[21:59:57] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[21:59:57] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[21:59:57] =========== drm_validate_clone_mode (2 subtests) ===========
[21:59:57] ============== drm_test_check_in_clone_mode  ===============
[21:59:57] [PASSED] in_clone_mode
[21:59:57] [PASSED] not_in_clone_mode
[21:59:57] ========== [PASSED] drm_test_check_in_clone_mode ===========
[21:59:57] =============== drm_test_check_valid_clones  ===============
[21:59:57] [PASSED] not_in_clone_mode
[21:59:57] [PASSED] valid_clone
[21:59:57] [PASSED] invalid_clone
[21:59:57] =========== [PASSED] drm_test_check_valid_clones ===========
[21:59:57] ============= [PASSED] drm_validate_clone_mode =============
[21:59:57] ============= drm_validate_modeset (1 subtest) =============
[21:59:57] [PASSED] drm_test_check_connector_changed_modeset
[21:59:57] ============== [PASSED] drm_validate_modeset ===============
[21:59:57] ====== drm_test_bridge_get_current_state (2 subtests) ======
[21:59:57] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[21:59:57] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[21:59:57] ======== [PASSED] drm_test_bridge_get_current_state ========
[21:59:57] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[21:59:57] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[21:59:57] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[21:59:57] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[21:59:57] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[21:59:57] ================== drm_buddy (7 subtests) ==================
[21:59:57] [PASSED] drm_test_buddy_alloc_limit
[21:59:57] [PASSED] drm_test_buddy_alloc_optimistic
[21:59:57] [PASSED] drm_test_buddy_alloc_pessimistic
[21:59:57] [PASSED] drm_test_buddy_alloc_pathological
[21:59:57] [PASSED] drm_test_buddy_alloc_contiguous
[21:59:57] [PASSED] drm_test_buddy_alloc_clear
[21:59:57] [PASSED] drm_test_buddy_alloc_range_bias
[21:59:57] ==================== [PASSED] drm_buddy ====================
[21:59:57] ============= drm_cmdline_parser (40 subtests) =============
[21:59:57] [PASSED] drm_test_cmdline_force_d_only
[21:59:57] [PASSED] drm_test_cmdline_force_D_only_dvi
[21:59:57] [PASSED] drm_test_cmdline_force_D_only_hdmi
[21:59:57] [PASSED] drm_test_cmdline_force_D_only_not_digital
[21:59:57] [PASSED] drm_test_cmdline_force_e_only
[21:59:57] [PASSED] drm_test_cmdline_res
[21:59:57] [PASSED] drm_test_cmdline_res_vesa
[21:59:57] [PASSED] drm_test_cmdline_res_vesa_rblank
[21:59:57] [PASSED] drm_test_cmdline_res_rblank
[21:59:57] [PASSED] drm_test_cmdline_res_bpp
[21:59:57] [PASSED] drm_test_cmdline_res_refresh
[21:59:57] [PASSED] drm_test_cmdline_res_bpp_refresh
[21:59:57] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[21:59:57] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[21:59:57] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[21:59:57] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[21:59:57] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[21:59:57] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[21:59:57] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[21:59:57] [PASSED] drm_test_cmdline_res_margins_force_on
[21:59:57] [PASSED] drm_test_cmdline_res_vesa_margins
[21:59:57] [PASSED] drm_test_cmdline_name
[21:59:57] [PASSED] drm_test_cmdline_name_bpp
[21:59:57] [PASSED] drm_test_cmdline_name_option
[21:59:57] [PASSED] drm_test_cmdline_name_bpp_option
[21:59:57] [PASSED] drm_test_cmdline_rotate_0
[21:59:57] [PASSED] drm_test_cmdline_rotate_90
[21:59:57] [PASSED] drm_test_cmdline_rotate_180
[21:59:57] [PASSED] drm_test_cmdline_rotate_270
[21:59:57] [PASSED] drm_test_cmdline_hmirror
[21:59:57] [PASSED] drm_test_cmdline_vmirror
[21:59:57] [PASSED] drm_test_cmdline_margin_options
[21:59:57] [PASSED] drm_test_cmdline_multiple_options
[21:59:57] [PASSED] drm_test_cmdline_bpp_extra_and_option
[21:59:57] [PASSED] drm_test_cmdline_extra_and_option
[21:59:57] [PASSED] drm_test_cmdline_freestanding_options
[21:59:57] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[21:59:57] [PASSED] drm_test_cmdline_panel_orientation
[21:59:57] ================ drm_test_cmdline_invalid  =================
[21:59:57] [PASSED] margin_only
[21:59:57] [PASSED] interlace_only
[21:59:57] [PASSED] res_missing_x
[21:59:57] [PASSED] res_missing_y
[21:59:57] [PASSED] res_bad_y
[21:59:57] [PASSED] res_missing_y_bpp
[21:59:57] [PASSED] res_bad_bpp
[21:59:57] [PASSED] res_bad_refresh
[21:59:57] [PASSED] res_bpp_refresh_force_on_off
[21:59:57] [PASSED] res_invalid_mode
[21:59:57] [PASSED] res_bpp_wrong_place_mode
[21:59:57] [PASSED] name_bpp_refresh
[21:59:57] [PASSED] name_refresh
[21:59:57] [PASSED] name_refresh_wrong_mode
[21:59:57] [PASSED] name_refresh_invalid_mode
[21:59:57] [PASSED] rotate_multiple
[21:59:57] [PASSED] rotate_invalid_val
[21:59:57] [PASSED] rotate_truncated
[21:59:57] [PASSED] invalid_option
[21:59:57] [PASSED] invalid_tv_option
[21:59:57] [PASSED] truncated_tv_option
[21:59:57] ============ [PASSED] drm_test_cmdline_invalid =============
[21:59:57] =============== drm_test_cmdline_tv_options  ===============
[21:59:57] [PASSED] NTSC
[21:59:57] [PASSED] NTSC_443
[21:59:57] [PASSED] NTSC_J
[21:59:57] [PASSED] PAL
[21:59:57] [PASSED] PAL_M
[21:59:57] [PASSED] PAL_N
[21:59:57] [PASSED] SECAM
[21:59:57] [PASSED] MONO_525
[21:59:57] [PASSED] MONO_625
[21:59:57] =========== [PASSED] drm_test_cmdline_tv_options ===========
[21:59:57] =============== [PASSED] drm_cmdline_parser ================
[21:59:57] ========== drmm_connector_hdmi_init (20 subtests) ==========
[21:59:57] [PASSED] drm_test_connector_hdmi_init_valid
[21:59:57] [PASSED] drm_test_connector_hdmi_init_bpc_8
[21:59:57] [PASSED] drm_test_connector_hdmi_init_bpc_10
[21:59:57] [PASSED] drm_test_connector_hdmi_init_bpc_12
[21:59:57] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[21:59:57] [PASSED] drm_test_connector_hdmi_init_bpc_null
[21:59:57] [PASSED] drm_test_connector_hdmi_init_formats_empty
[21:59:57] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[21:59:57] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[21:59:57] [PASSED] supported_formats=0x9 yuv420_allowed=1
[21:59:57] [PASSED] supported_formats=0x9 yuv420_allowed=0
[21:59:57] [PASSED] supported_formats=0x3 yuv420_allowed=1
[21:59:57] [PASSED] supported_formats=0x3 yuv420_allowed=0
[21:59:57] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[21:59:57] [PASSED] drm_test_connector_hdmi_init_null_ddc
[21:59:57] [PASSED] drm_test_connector_hdmi_init_null_product
[21:59:57] [PASSED] drm_test_connector_hdmi_init_null_vendor
[21:59:57] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[21:59:57] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[21:59:57] [PASSED] drm_test_connector_hdmi_init_product_valid
[21:59:57] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[21:59:57] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[21:59:57] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[21:59:57] ========= drm_test_connector_hdmi_init_type_valid  =========
[21:59:57] [PASSED] HDMI-A
[21:59:57] [PASSED] HDMI-B
[21:59:57] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[21:59:57] ======== drm_test_connector_hdmi_init_type_invalid  ========
[21:59:57] [PASSED] Unknown
[21:59:57] [PASSED] VGA
[21:59:57] [PASSED] DVI-I
[21:59:57] [PASSED] DVI-D
[21:59:57] [PASSED] DVI-A
[21:59:57] [PASSED] Composite
[21:59:57] [PASSED] SVIDEO
[21:59:57] [PASSED] LVDS
[21:59:57] [PASSED] Component
[21:59:57] [PASSED] DIN
[21:59:57] [PASSED] DP
[21:59:57] [PASSED] TV
[21:59:57] [PASSED] eDP
[21:59:57] [PASSED] Virtual
[21:59:57] [PASSED] DSI
[21:59:57] [PASSED] DPI
[21:59:57] [PASSED] Writeback
[21:59:57] [PASSED] SPI
[21:59:57] [PASSED] USB
[21:59:57] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[21:59:57] ============ [PASSED] drmm_connector_hdmi_init =============
[21:59:57] ============= drmm_connector_init (3 subtests) =============
[21:59:57] [PASSED] drm_test_drmm_connector_init
[21:59:57] [PASSED] drm_test_drmm_connector_init_null_ddc
[21:59:57] ========= drm_test_drmm_connector_init_type_valid  =========
[21:59:57] [PASSED] Unknown
[21:59:57] [PASSED] VGA
[21:59:57] [PASSED] DVI-I
[21:59:57] [PASSED] DVI-D
[21:59:57] [PASSED] DVI-A
[21:59:57] [PASSED] Composite
[21:59:57] [PASSED] SVIDEO
[21:59:57] [PASSED] LVDS
[21:59:57] [PASSED] Component
[21:59:57] [PASSED] DIN
[21:59:57] [PASSED] DP
[21:59:57] [PASSED] HDMI-A
[21:59:57] [PASSED] HDMI-B
[21:59:57] [PASSED] TV
[21:59:57] [PASSED] eDP
[21:59:57] [PASSED] Virtual
[21:59:57] [PASSED] DSI
[21:59:57] [PASSED] DPI
[21:59:57] [PASSED] Writeback
[21:59:57] [PASSED] SPI
[21:59:57] [PASSED] USB
[21:59:57] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[21:59:57] =============== [PASSED] drmm_connector_init ===============
[21:59:57] ========= drm_connector_dynamic_init (6 subtests) ==========
[21:59:57] [PASSED] drm_test_drm_connector_dynamic_init
[21:59:57] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[21:59:57] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[21:59:57] [PASSED] drm_test_drm_connector_dynamic_init_properties
[21:59:57] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[21:59:57] [PASSED] Unknown
[21:59:57] [PASSED] VGA
[21:59:57] [PASSED] DVI-I
[21:59:57] [PASSED] DVI-D
[21:59:57] [PASSED] DVI-A
[21:59:57] [PASSED] Composite
[21:59:57] [PASSED] SVIDEO
[21:59:57] [PASSED] LVDS
[21:59:57] [PASSED] Component
[21:59:57] [PASSED] DIN
[21:59:57] [PASSED] DP
[21:59:57] [PASSED] HDMI-A
[21:59:57] [PASSED] HDMI-B
[21:59:57] [PASSED] TV
[21:59:57] [PASSED] eDP
[21:59:57] [PASSED] Virtual
[21:59:57] [PASSED] DSI
[21:59:57] [PASSED] DPI
[21:59:57] [PASSED] Writeback
[21:59:57] [PASSED] SPI
[21:59:57] [PASSED] USB
[21:59:57] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[21:59:57] ======== drm_test_drm_connector_dynamic_init_name  =========
[21:59:57] [PASSED] Unknown
[21:59:57] [PASSED] VGA
[21:59:57] [PASSED] DVI-I
[21:59:57] [PASSED] DVI-D
[21:59:57] [PASSED] DVI-A
[21:59:57] [PASSED] Composite
[21:59:57] [PASSED] SVIDEO
[21:59:57] [PASSED] LVDS
[21:59:57] [PASSED] Component
[21:59:57] [PASSED] DIN
[21:59:57] [PASSED] DP
[21:59:57] [PASSED] HDMI-A
[21:59:57] [PASSED] HDMI-B
[21:59:57] [PASSED] TV
[21:59:57] [PASSED] eDP
[21:59:57] [PASSED] Virtual
[21:59:57] [PASSED] DSI
[21:59:57] [PASSED] DPI
[21:59:57] [PASSED] Writeback
[21:59:57] [PASSED] SPI
[21:59:57] [PASSED] USB
[21:59:57] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[21:59:57] =========== [PASSED] drm_connector_dynamic_init ============
[21:59:57] ==== drm_connector_dynamic_register_early (4 subtests) =====
[21:59:57] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[21:59:57] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[21:59:57] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[21:59:57] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[21:59:57] ====== [PASSED] drm_connector_dynamic_register_early =======
[21:59:57] ======= drm_connector_dynamic_register (7 subtests) ========
[21:59:57] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[21:59:57] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[21:59:57] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[21:59:57] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[21:59:57] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[21:59:57] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[21:59:57] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[21:59:57] ========= [PASSED] drm_connector_dynamic_register ==========
[21:59:57] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[21:59:57] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[21:59:57] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[21:59:57] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[21:59:57] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[21:59:57] ========== drm_test_get_tv_mode_from_name_valid  ===========
[21:59:57] [PASSED] NTSC
[21:59:57] [PASSED] NTSC-443
[21:59:57] [PASSED] NTSC-J
[21:59:57] [PASSED] PAL
[21:59:57] [PASSED] PAL-M
[21:59:57] [PASSED] PAL-N
[21:59:57] [PASSED] SECAM
[21:59:57] [PASSED] Mono
[21:59:57] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[21:59:57] [PASSED] drm_test_get_tv_mode_from_name_truncated
[21:59:57] ============ [PASSED] drm_get_tv_mode_from_name ============
[21:59:57] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[21:59:57] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[21:59:57] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[21:59:57] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[21:59:57] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[21:59:57] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[21:59:57] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[21:59:57] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[21:59:57] [PASSED] VIC 96
[21:59:57] [PASSED] VIC 97
[21:59:57] [PASSED] VIC 101
[21:59:57] [PASSED] VIC 102
[21:59:57] [PASSED] VIC 106
[21:59:57] [PASSED] VIC 107
[21:59:57] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[21:59:57] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[21:59:57] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[21:59:57] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[21:59:57] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[21:59:57] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[21:59:57] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[21:59:57] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[21:59:57] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[21:59:57] [PASSED] Automatic
[21:59:57] [PASSED] Full
[21:59:57] [PASSED] Limited 16:235
[21:59:57] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[21:59:57] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[21:59:57] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[21:59:57] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[21:59:57] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[21:59:57] [PASSED] RGB
[21:59:57] [PASSED] YUV 4:2:0
[21:59:57] [PASSED] YUV 4:2:2
[21:59:57] [PASSED] YUV 4:4:4
[21:59:57] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[21:59:57] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[21:59:57] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[21:59:57] ============= drm_damage_helper (21 subtests) ==============
[21:59:57] [PASSED] drm_test_damage_iter_no_damage
[21:59:57] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[21:59:57] [PASSED] drm_test_damage_iter_no_damage_src_moved
[21:59:57] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[21:59:57] [PASSED] drm_test_damage_iter_no_damage_not_visible
[21:59:57] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[21:59:57] [PASSED] drm_test_damage_iter_no_damage_no_fb
[21:59:57] [PASSED] drm_test_damage_iter_simple_damage
[21:59:57] [PASSED] drm_test_damage_iter_single_damage
[21:59:57] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[21:59:57] [PASSED] drm_test_damage_iter_single_damage_outside_src
[21:59:57] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[21:59:57] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[21:59:57] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[21:59:57] [PASSED] drm_test_damage_iter_single_damage_src_moved
[21:59:57] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[21:59:57] [PASSED] drm_test_damage_iter_damage
[21:59:57] [PASSED] drm_test_damage_iter_damage_one_intersect
[21:59:57] [PASSED] drm_test_damage_iter_damage_one_outside
[21:59:57] [PASSED] drm_test_damage_iter_damage_src_moved
[21:59:57] [PASSED] drm_test_damage_iter_damage_not_visible
[21:59:57] ================ [PASSED] drm_damage_helper ================
[21:59:57] ============== drm_dp_mst_helper (3 subtests) ==============
[21:59:57] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[21:59:57] [PASSED] Clock 154000 BPP 30 DSC disabled
[21:59:57] [PASSED] Clock 234000 BPP 30 DSC disabled
[21:59:57] [PASSED] Clock 297000 BPP 24 DSC disabled
[21:59:57] [PASSED] Clock 332880 BPP 24 DSC enabled
[21:59:57] [PASSED] Clock 324540 BPP 24 DSC enabled
[21:59:57] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[21:59:57] ============== drm_test_dp_mst_calc_pbn_div  ===============
[21:59:57] [PASSED] Link rate 2000000 lane count 4
[21:59:57] [PASSED] Link rate 2000000 lane count 2
[21:59:57] [PASSED] Link rate 2000000 lane count 1
[21:59:57] [PASSED] Link rate 1350000 lane count 4
[21:59:57] [PASSED] Link rate 1350000 lane count 2
[21:59:57] [PASSED] Link rate 1350000 lane count 1
[21:59:57] [PASSED] Link rate 1000000 lane count 4
[21:59:57] [PASSED] Link rate 1000000 lane count 2
[21:59:57] [PASSED] Link rate 1000000 lane count 1
[21:59:57] [PASSED] Link rate 810000 lane count 4
[21:59:57] [PASSED] Link rate 810000 lane count 2
[21:59:57] [PASSED] Link rate 810000 lane count 1
[21:59:57] [PASSED] Link rate 540000 lane count 4
[21:59:57] [PASSED] Link rate 540000 lane count 2
[21:59:57] [PASSED] Link rate 540000 lane count 1
[21:59:57] [PASSED] Link rate 270000 lane count 4
[21:59:57] [PASSED] Link rate 270000 lane count 2
[21:59:57] [PASSED] Link rate 270000 lane count 1
[21:59:57] [PASSED] Link rate 162000 lane count 4
[21:59:57] [PASSED] Link rate 162000 lane count 2
[21:59:57] [PASSED] Link rate 162000 lane count 1
[21:59:57] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[21:59:57] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[21:59:57] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[21:59:57] [PASSED] DP_POWER_UP_PHY with port number
[21:59:57] [PASSED] DP_POWER_DOWN_PHY with port number
[21:59:57] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[21:59:57] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[21:59:57] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[21:59:57] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[21:59:57] [PASSED] DP_QUERY_PAYLOAD with port number
[21:59:57] [PASSED] DP_QUERY_PAYLOAD with VCPI
[21:59:57] [PASSED] DP_REMOTE_DPCD_READ with port number
[21:59:57] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[21:59:57] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[21:59:57] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[21:59:57] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[21:59:57] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[21:59:57] [PASSED] DP_REMOTE_I2C_READ with port number
[21:59:57] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[21:59:57] [PASSED] DP_REMOTE_I2C_READ with transactions array
[21:59:57] [PASSED] DP_REMOTE_I2C_WRITE with port number
[21:59:57] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[21:59:57] [PASSED] DP_REMOTE_I2C_WRITE with data array
[21:59:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[21:59:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[21:59:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[21:59:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[21:59:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[21:59:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[21:59:57] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[21:59:57] ================ [PASSED] drm_dp_mst_helper ================
[21:59:57] ================== drm_exec (7 subtests) ===================
[21:59:57] [PASSED] sanitycheck
[21:59:57] [PASSED] test_lock
[21:59:57] [PASSED] test_lock_unlock
[21:59:57] [PASSED] test_duplicates
[21:59:57] [PASSED] test_prepare
[21:59:57] [PASSED] test_prepare_array
[21:59:57] [PASSED] test_multiple_loops
[21:59:57] ==================== [PASSED] drm_exec =====================
[21:59:57] =========== drm_format_helper_test (18 subtests) ===========
[21:59:57] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[21:59:57] [PASSED] single_pixel_source_buffer
[21:59:57] [PASSED] single_pixel_clip_rectangle
[21:59:57] [PASSED] well_known_colors
[21:59:57] [PASSED] destination_pitch
[21:59:57] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[21:59:57] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[21:59:57] [PASSED] single_pixel_source_buffer
[21:59:57] [PASSED] single_pixel_clip_rectangle
[21:59:57] [PASSED] well_known_colors
[21:59:57] [PASSED] destination_pitch
[21:59:57] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[21:59:57] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[21:59:57] [PASSED] single_pixel_source_buffer
[21:59:57] [PASSED] single_pixel_clip_rectangle
[21:59:57] [PASSED] well_known_colors
[21:59:57] [PASSED] destination_pitch
[21:59:57] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[21:59:57] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[21:59:57] [PASSED] single_pixel_source_buffer
[21:59:57] [PASSED] single_pixel_clip_rectangle
[21:59:57] [PASSED] well_known_colors
[21:59:57] [PASSED] destination_pitch
[21:59:57] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[21:59:57] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[21:59:57] [PASSED] single_pixel_source_buffer
[21:59:57] [PASSED] single_pixel_clip_rectangle
[21:59:57] [PASSED] well_known_colors
[21:59:57] [PASSED] destination_pitch
[21:59:57] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[21:59:57] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[21:59:57] [PASSED] single_pixel_source_buffer
[21:59:57] [PASSED] single_pixel_clip_rectangle
[21:59:57] [PASSED] well_known_colors
[21:59:57] [PASSED] destination_pitch
[21:59:57] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[21:59:57] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[21:59:57] [PASSED] single_pixel_source_buffer
[21:59:57] [PASSED] single_pixel_clip_rectangle
[21:59:57] [PASSED] well_known_colors
[21:59:57] [PASSED] destination_pitch
[21:59:57] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[21:59:57] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[21:59:57] [PASSED] single_pixel_source_buffer
[21:59:57] [PASSED] single_pixel_clip_rectangle
[21:59:57] [PASSED] well_known_colors
[21:59:57] [PASSED] destination_pitch
[21:59:57] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[21:59:57] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[21:59:57] [PASSED] single_pixel_source_buffer
[21:59:57] [PASSED] single_pixel_clip_rectangle
[21:59:57] [PASSED] well_known_colors
[21:59:57] [PASSED] destination_pitch
[21:59:57] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[21:59:57] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[21:59:57] [PASSED] single_pixel_source_buffer
[21:59:57] [PASSED] single_pixel_clip_rectangle
[21:59:57] [PASSED] well_known_colors
[21:59:57] [PASSED] destination_pitch
[21:59:57] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[21:59:57] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[21:59:57] [PASSED] single_pixel_source_buffer
[21:59:57] [PASSED] single_pixel_clip_rectangle
[21:59:57] [PASSED] well_known_colors
[21:59:57] [PASSED] destination_pitch
[21:59:57] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[21:59:57] ============== drm_test_fb_xrgb8888_to_mono  ===============
[21:59:57] [PASSED] single_pixel_source_buffer
[21:59:57] [PASSED] single_pixel_clip_rectangle
[21:59:57] [PASSED] well_known_colors
[21:59:57] [PASSED] destination_pitch
[21:59:57] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[21:59:57] ==================== drm_test_fb_swab  =====================
[21:59:57] [PASSED] single_pixel_source_buffer
[21:59:57] [PASSED] single_pixel_clip_rectangle
[21:59:57] [PASSED] well_known_colors
[21:59:57] [PASSED] destination_pitch
[21:59:57] ================ [PASSED] drm_test_fb_swab =================
[21:59:57] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[21:59:57] [PASSED] single_pixel_source_buffer
[21:59:57] [PASSED] single_pixel_clip_rectangle
[21:59:57] [PASSED] well_known_colors
[21:59:57] [PASSED] destination_pitch
[21:59:57] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[21:59:57] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[21:59:57] [PASSED] single_pixel_source_buffer
[21:59:57] [PASSED] single_pixel_clip_rectangle
[21:59:57] [PASSED] well_known_colors
[21:59:57] [PASSED] destination_pitch
[21:59:57] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[21:59:57] ================= drm_test_fb_clip_offset  =================
[21:59:57] [PASSED] pass through
[21:59:57] [PASSED] horizontal offset
[21:59:57] [PASSED] vertical offset
[21:59:57] [PASSED] horizontal and vertical offset
[21:59:57] [PASSED] horizontal offset (custom pitch)
[21:59:57] [PASSED] vertical offset (custom pitch)
[21:59:57] [PASSED] horizontal and vertical offset (custom pitch)
[21:59:57] ============= [PASSED] drm_test_fb_clip_offset =============
[21:59:57] ============== drm_test_fb_build_fourcc_list  ==============
[21:59:57] [PASSED] no native formats
[21:59:57] [PASSED] XRGB8888 as native format
[21:59:57] [PASSED] remove duplicates
[21:59:57] [PASSED] convert alpha formats
[21:59:57] [PASSED] random formats
[21:59:57] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[21:59:57] =================== drm_test_fb_memcpy  ====================
[21:59:57] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[21:59:57] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[21:59:57] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[21:59:57] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[21:59:57] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[21:59:57] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[21:59:57] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[21:59:57] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[21:59:57] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[21:59:57] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[21:59:57] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[21:59:57] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[21:59:57] =============== [PASSED] drm_test_fb_memcpy ================
[21:59:57] ============= [PASSED] drm_format_helper_test ==============
[21:59:57] ================= drm_format (18 subtests) =================
[21:59:57] [PASSED] drm_test_format_block_width_invalid
[21:59:57] [PASSED] drm_test_format_block_width_one_plane
[21:59:57] [PASSED] drm_test_format_block_width_two_plane
[21:59:57] [PASSED] drm_test_format_block_width_three_plane
[21:59:57] [PASSED] drm_test_format_block_width_tiled
[21:59:57] [PASSED] drm_test_format_block_height_invalid
[21:59:57] [PASSED] drm_test_format_block_height_one_plane
[21:59:57] [PASSED] drm_test_format_block_height_two_plane
[21:59:57] [PASSED] drm_test_format_block_height_three_plane
[21:59:57] [PASSED] drm_test_format_block_height_tiled
[21:59:57] [PASSED] drm_test_format_min_pitch_invalid
[21:59:57] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[21:59:57] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[21:59:57] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[21:59:57] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[21:59:57] [PASSED] drm_test_format_min_pitch_two_plane
[21:59:57] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[21:59:57] [PASSED] drm_test_format_min_pitch_tiled
[21:59:57] =================== [PASSED] drm_format ====================
[21:59:57] ============== drm_framebuffer (10 subtests) ===============
[21:59:57] ========== drm_test_framebuffer_check_src_coords  ==========
[21:59:57] [PASSED] Success: source fits into fb
[21:59:57] [PASSED] Fail: overflowing fb with x-axis coordinate
[21:59:57] [PASSED] Fail: overflowing fb with y-axis coordinate
[21:59:57] [PASSED] Fail: overflowing fb with source width
[21:59:57] [PASSED] Fail: overflowing fb with source height
[21:59:57] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[21:59:57] [PASSED] drm_test_framebuffer_cleanup
[21:59:57] =============== drm_test_framebuffer_create  ===============
[21:59:57] [PASSED] ABGR8888 normal sizes
[21:59:57] [PASSED] ABGR8888 max sizes
[21:59:57] [PASSED] ABGR8888 pitch greater than min required
[21:59:57] [PASSED] ABGR8888 pitch less than min required
[21:59:57] [PASSED] ABGR8888 Invalid width
[21:59:57] [PASSED] ABGR8888 Invalid buffer handle
[21:59:57] [PASSED] No pixel format
[21:59:57] [PASSED] ABGR8888 Width 0
[21:59:57] [PASSED] ABGR8888 Height 0
[21:59:57] [PASSED] ABGR8888 Out of bound height * pitch combination
[21:59:57] [PASSED] ABGR8888 Large buffer offset
[21:59:57] [PASSED] ABGR8888 Buffer offset for inexistent plane
[21:59:57] [PASSED] ABGR8888 Invalid flag
[21:59:57] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[21:59:57] [PASSED] ABGR8888 Valid buffer modifier
[21:59:57] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[21:59:57] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[21:59:57] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[21:59:57] [PASSED] NV12 Normal sizes
[21:59:57] [PASSED] NV12 Max sizes
[21:59:57] [PASSED] NV12 Invalid pitch
[21:59:57] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[21:59:57] [PASSED] NV12 different  modifier per-plane
[21:59:57] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[21:59:57] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[21:59:57] [PASSED] NV12 Modifier for inexistent plane
[21:59:57] [PASSED] NV12 Handle for inexistent plane
[21:59:57] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[21:59:57] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[21:59:57] [PASSED] YVU420 Normal sizes
[21:59:57] [PASSED] YVU420 Max sizes
[21:59:57] [PASSED] YVU420 Invalid pitch
[21:59:57] [PASSED] YVU420 Different pitches
[21:59:57] [PASSED] YVU420 Different buffer offsets/pitches
[21:59:57] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[21:59:57] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[21:59:57] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[21:59:57] [PASSED] YVU420 Valid modifier
[21:59:57] [PASSED] YVU420 Different modifiers per plane
[21:59:57] [PASSED] YVU420 Modifier for inexistent plane
[21:59:57] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[21:59:57] [PASSED] X0L2 Normal sizes
[21:59:57] [PASSED] X0L2 Max sizes
[21:59:57] [PASSED] X0L2 Invalid pitch
[21:59:57] [PASSED] X0L2 Pitch greater than minimum required
[21:59:57] [PASSED] X0L2 Handle for inexistent plane
[21:59:57] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[21:59:57] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[21:59:57] [PASSED] X0L2 Valid modifier
[21:59:57] [PASSED] X0L2 Modifier for inexistent plane
[21:59:57] =========== [PASSED] drm_test_framebuffer_create ===========
[21:59:57] [PASSED] drm_test_framebuffer_free
[21:59:57] [PASSED] drm_test_framebuffer_init
[21:59:57] [PASSED] drm_test_framebuffer_init_bad_format
[21:59:57] [PASSED] drm_test_framebuffer_init_dev_mismatch
[21:59:57] [PASSED] drm_test_framebuffer_lookup
[21:59:57] [PASSED] drm_test_framebuffer_lookup_inexistent
[21:59:57] [PASSED] drm_test_framebuffer_modifiers_not_supported
[21:59:57] ================= [PASSED] drm_framebuffer =================
[21:59:57] ================ drm_gem_shmem (8 subtests) ================
[21:59:57] [PASSED] drm_gem_shmem_test_obj_create
[21:59:57] [PASSED] drm_gem_shmem_test_obj_create_private
[21:59:57] [PASSED] drm_gem_shmem_test_pin_pages
[21:59:57] [PASSED] drm_gem_shmem_test_vmap
[21:59:57] [PASSED] drm_gem_shmem_test_get_pages_sgt
[21:59:57] [PASSED] drm_gem_shmem_test_get_sg_table
[21:59:57] [PASSED] drm_gem_shmem_test_madvise
[21:59:57] [PASSED] drm_gem_shmem_test_purge
[21:59:57] ================== [PASSED] drm_gem_shmem ==================
[21:59:57] === drm_atomic_helper_connector_hdmi_check (23 subtests) ===
[21:59:57] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[21:59:57] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[21:59:57] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[21:59:57] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[21:59:57] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[21:59:57] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[21:59:57] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[21:59:57] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[21:59:57] [PASSED] drm_test_check_disable_connector
[21:59:57] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[21:59:57] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[21:59:57] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[21:59:57] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[21:59:57] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[21:59:57] [PASSED] drm_test_check_output_bpc_dvi
[21:59:57] [PASSED] drm_test_check_output_bpc_format_vic_1
[21:59:57] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[21:59:57] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[21:59:57] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[21:59:57] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[21:59:57] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[21:59:57] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[21:59:57] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[21:59:57] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[21:59:57] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[21:59:57] [PASSED] drm_test_check_broadcast_rgb_value
[21:59:57] [PASSED] drm_test_check_bpc_8_value
[21:59:57] [PASSED] drm_test_check_bpc_10_value
[21:59:57] [PASSED] drm_test_check_bpc_12_value
[21:59:57] [PASSED] drm_test_check_format_value
[21:59:57] [PASSED] drm_test_check_tmds_char_value
[21:59:57] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[21:59:57] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[21:59:57] [PASSED] drm_test_check_mode_valid
[21:59:57] [PASSED] drm_test_check_mode_valid_reject
[21:59:57] [PASSED] drm_test_check_mode_valid_reject_rate
[21:59:57] [PASSED] drm_test_check_mode_valid_reject_max_clock
[21:59:57] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[21:59:57] ================= drm_managed (2 subtests) =================
[21:59:57] [PASSED] drm_test_managed_release_action
[21:59:57] [PASSED] drm_test_managed_run_action
[21:59:57] =================== [PASSED] drm_managed ===================
[21:59:57] =================== drm_mm (6 subtests) ====================
[21:59:57] [PASSED] drm_test_mm_init
[21:59:57] [PASSED] drm_test_mm_debug
[21:59:57] [PASSED] drm_test_mm_align32
[21:59:57] [PASSED] drm_test_mm_align64
[21:59:57] [PASSED] drm_test_mm_lowest
[21:59:57] [PASSED] drm_test_mm_highest
[21:59:57] ===================== [PASSED] drm_mm ======================
[21:59:57] ============= drm_modes_analog_tv (5 subtests) =============
[21:59:57] [PASSED] drm_test_modes_analog_tv_mono_576i
[21:59:57] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[21:59:57] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[21:59:57] [PASSED] drm_test_modes_analog_tv_pal_576i
[21:59:57] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[21:59:57] =============== [PASSED] drm_modes_analog_tv ===============
[21:59:57] ============== drm_plane_helper (2 subtests) ===============
[21:59:57] =============== drm_test_check_plane_state  ================
[21:59:57] [PASSED] clipping_simple
[21:59:57] [PASSED] clipping_rotate_reflect
[21:59:57] [PASSED] positioning_simple
[21:59:57] [PASSED] upscaling
[21:59:57] [PASSED] downscaling
[21:59:57] [PASSED] rounding1
[21:59:57] [PASSED] rounding2
[21:59:57] [PASSED] rounding3
[21:59:57] [PASSED] rounding4
[21:59:57] =========== [PASSED] drm_test_check_plane_state ============
[21:59:57] =========== drm_test_check_invalid_plane_state  ============
[21:59:57] [PASSED] positioning_invalid
[21:59:57] [PASSED] upscaling_invalid
[21:59:57] [PASSED] downscaling_invalid
[21:59:57] ======= [PASSED] drm_test_check_invalid_plane_state ========
[21:59:57] ================ [PASSED] drm_plane_helper =================
[21:59:57] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[21:59:57] ====== drm_test_connector_helper_tv_get_modes_check  =======
[21:59:57] [PASSED] None
[21:59:57] [PASSED] PAL
[21:59:57] [PASSED] NTSC
[21:59:57] [PASSED] Both, NTSC Default
[21:59:57] [PASSED] Both, PAL Default
[21:59:57] [PASSED] Both, NTSC Default, with PAL on command-line
[21:59:57] [PASSED] Both, PAL Default, with NTSC on command-line
[21:59:57] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[21:59:57] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[21:59:57] ================== drm_rect (9 subtests) ===================
[21:59:57] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[21:59:57] [PASSED] drm_test_rect_clip_scaled_not_clipped
[21:59:57] [PASSED] drm_test_rect_clip_scaled_clipped
[21:59:57] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[21:59:57] ================= drm_test_rect_intersect  =================
[21:59:57] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[21:59:57] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[21:59:57] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[21:59:57] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[21:59:57] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[21:59:57] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[21:59:57] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[21:59:57] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[21:59:57] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[21:59:57] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[21:59:57] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[21:59:57] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[21:59:57] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[21:59:57] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[21:59:57] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[21:59:57] ============= [PASSED] drm_test_rect_intersect =============
[21:59:57] ================ drm_test_rect_calc_hscale  ================
[21:59:57] [PASSED] normal use
[21:59:57] [PASSED] out of max range
[21:59:57] [PASSED] out of min range
[21:59:57] [PASSED] zero dst
[21:59:57] [PASSED] negative src
[21:59:57] [PASSED] negative dst
[21:59:57] ============ [PASSED] drm_test_rect_calc_hscale ============
[21:59:57] ================ drm_test_rect_calc_vscale  ================
[21:59:57] [PASSED] normal use
[21:59:57] [PASSED] out of max range
[21:59:57] [PASSED] out of min range
[21:59:57] [PASSED] zero dst
[21:59:57] [PASSED] negative src
[21:59:57] [PASSED] negative dst
[21:59:57] ============ [PASSED] drm_test_rect_calc_vscale ============
[21:59:57] ================== drm_test_rect_rotate  ===================
[21:59:57] [PASSED] reflect-x
[21:59:57] [PASSED] reflect-y
[21:59:57] [PASSED] rotate-0
[21:59:57] [PASSED] rotate-90
[21:59:57] [PASSED] rotate-180
[21:59:57] [PASSED] rotate-270
[21:59:57] ============== [PASSED] drm_test_rect_rotate ===============
[21:59:57] ================ drm_test_rect_rotate_inv  =================
[21:59:57] [PASSED] reflect-x
[21:59:57] [PASSED] reflect-y
[21:59:57] [PASSED] rotate-0
[21:59:57] [PASSED] rotate-90
[21:59:57] [PASSED] rotate-180
[21:59:57] [PASSED] rotate-270
[21:59:57] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[21:59:57] ==================== [PASSED] drm_rect =====================
[21:59:57] ============================================================
[21:59:57] Testing complete. Ran 608 tests: passed: 608
[21:59:57] Elapsed time: 23.677s total, 1.795s configuring, 21.713s building, 0.145s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[21:59:57] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:59:59] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[22:00:07] Starting KUnit Kernel (1/1)...
[22:00:07] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:00:07] ================= ttm_device (5 subtests) ==================
[22:00:07] [PASSED] ttm_device_init_basic
[22:00:07] [PASSED] ttm_device_init_multiple
[22:00:07] [PASSED] ttm_device_fini_basic
[22:00:07] [PASSED] ttm_device_init_no_vma_man
[22:00:07] ================== ttm_device_init_pools  ==================
[22:00:07] [PASSED] No DMA allocations, no DMA32 required
[22:00:07] [PASSED] DMA allocations, DMA32 required
[22:00:07] [PASSED] No DMA allocations, DMA32 required
[22:00:07] [PASSED] DMA allocations, no DMA32 required
[22:00:07] ============== [PASSED] ttm_device_init_pools ==============
[22:00:07] =================== [PASSED] ttm_device ====================
[22:00:07] ================== ttm_pool (8 subtests) ===================
[22:00:07] ================== ttm_pool_alloc_basic  ===================
[22:00:07] [PASSED] One page
[22:00:07] [PASSED] More than one page
[22:00:07] [PASSED] Above the allocation limit
[22:00:07] [PASSED] One page, with coherent DMA mappings enabled
[22:00:07] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[22:00:07] ============== [PASSED] ttm_pool_alloc_basic ===============
[22:00:07] ============== ttm_pool_alloc_basic_dma_addr  ==============
[22:00:07] [PASSED] One page
[22:00:07] [PASSED] More than one page
[22:00:07] [PASSED] Above the allocation limit
[22:00:07] [PASSED] One page, with coherent DMA mappings enabled
[22:00:07] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[22:00:07] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[22:00:07] [PASSED] ttm_pool_alloc_order_caching_match
[22:00:07] [PASSED] ttm_pool_alloc_caching_mismatch
[22:00:07] [PASSED] ttm_pool_alloc_order_mismatch
[22:00:07] [PASSED] ttm_pool_free_dma_alloc
[22:00:07] [PASSED] ttm_pool_free_no_dma_alloc
[22:00:07] [PASSED] ttm_pool_fini_basic
[22:00:07] ==================== [PASSED] ttm_pool =====================
[22:00:07] ================ ttm_resource (8 subtests) =================
[22:00:07] ================= ttm_resource_init_basic  =================
[22:00:07] [PASSED] Init resource in TTM_PL_SYSTEM
[22:00:07] [PASSED] Init resource in TTM_PL_VRAM
[22:00:07] [PASSED] Init resource in a private placement
[22:00:07] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[22:00:07] ============= [PASSED] ttm_resource_init_basic =============
[22:00:07] [PASSED] ttm_resource_init_pinned
[22:00:07] [PASSED] ttm_resource_fini_basic
[22:00:07] [PASSED] ttm_resource_manager_init_basic
[22:00:07] [PASSED] ttm_resource_manager_usage_basic
[22:00:07] [PASSED] ttm_resource_manager_set_used_basic
[22:00:07] [PASSED] ttm_sys_man_alloc_basic
[22:00:07] [PASSED] ttm_sys_man_free_basic
[22:00:07] ================== [PASSED] ttm_resource ===================
[22:00:07] =================== ttm_tt (15 subtests) ===================
[22:00:07] ==================== ttm_tt_init_basic  ====================
[22:00:07] [PASSED] Page-aligned size
[22:00:07] [PASSED] Extra pages requested
[22:00:07] ================ [PASSED] ttm_tt_init_basic ================
[22:00:07] [PASSED] ttm_tt_init_misaligned
[22:00:07] [PASSED] ttm_tt_fini_basic
[22:00:07] [PASSED] ttm_tt_fini_sg
[22:00:07] [PASSED] ttm_tt_fini_shmem
[22:00:07] [PASSED] ttm_tt_create_basic
[22:00:07] [PASSED] ttm_tt_create_invalid_bo_type
[22:00:07] [PASSED] ttm_tt_create_ttm_exists
[22:00:07] [PASSED] ttm_tt_create_failed
[22:00:07] [PASSED] ttm_tt_destroy_basic
[22:00:07] [PASSED] ttm_tt_populate_null_ttm
[22:00:07] [PASSED] ttm_tt_populate_populated_ttm
[22:00:07] [PASSED] ttm_tt_unpopulate_basic
[22:00:07] [PASSED] ttm_tt_unpopulate_empty_ttm
[22:00:07] [PASSED] ttm_tt_swapin_basic
[22:00:07] ===================== [PASSED] ttm_tt ======================
[22:00:07] =================== ttm_bo (14 subtests) ===================
[22:00:07] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[22:00:07] [PASSED] Cannot be interrupted and sleeps
[22:00:07] [PASSED] Cannot be interrupted, locks straight away
[22:00:07] [PASSED] Can be interrupted, sleeps
[22:00:07] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[22:00:07] [PASSED] ttm_bo_reserve_locked_no_sleep
[22:00:07] [PASSED] ttm_bo_reserve_no_wait_ticket
[22:00:07] [PASSED] ttm_bo_reserve_double_resv
[22:00:07] [PASSED] ttm_bo_reserve_interrupted
[22:00:07] [PASSED] ttm_bo_reserve_deadlock
[22:00:07] [PASSED] ttm_bo_unreserve_basic
[22:00:07] [PASSED] ttm_bo_unreserve_pinned
[22:00:07] [PASSED] ttm_bo_unreserve_bulk
[22:00:07] [PASSED] ttm_bo_put_basic
[22:00:07] [PASSED] ttm_bo_put_shared_resv
[22:00:07] [PASSED] ttm_bo_pin_basic
[22:00:07] [PASSED] ttm_bo_pin_unpin_resource
[22:00:07] [PASSED] ttm_bo_multiple_pin_one_unpin
[22:00:07] ===================== [PASSED] ttm_bo ======================
[22:00:07] ============== ttm_bo_validate (22 subtests) ===============
[22:00:07] ============== ttm_bo_init_reserved_sys_man  ===============
[22:00:07] [PASSED] Buffer object for userspace
[22:00:07] [PASSED] Kernel buffer object
[22:00:07] [PASSED] Shared buffer object
[22:00:07] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[22:00:07] ============== ttm_bo_init_reserved_mock_man  ==============
[22:00:07] [PASSED] Buffer object for userspace
[22:00:07] [PASSED] Kernel buffer object
[22:00:07] [PASSED] Shared buffer object
[22:00:07] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[22:00:07] [PASSED] ttm_bo_init_reserved_resv
[22:00:07] ================== ttm_bo_validate_basic  ==================
[22:00:07] [PASSED] Buffer object for userspace
[22:00:07] [PASSED] Kernel buffer object
[22:00:07] [PASSED] Shared buffer object
[22:00:07] ============== [PASSED] ttm_bo_validate_basic ==============
[22:00:07] [PASSED] ttm_bo_validate_invalid_placement
[22:00:07] ============= ttm_bo_validate_same_placement  ==============
[22:00:07] [PASSED] System manager
[22:00:07] [PASSED] VRAM manager
[22:00:07] ========= [PASSED] ttm_bo_validate_same_placement ==========
[22:00:07] [PASSED] ttm_bo_validate_failed_alloc
[22:00:07] [PASSED] ttm_bo_validate_pinned
[22:00:07] [PASSED] ttm_bo_validate_busy_placement
[22:00:07] ================ ttm_bo_validate_multihop  =================
[22:00:07] [PASSED] Buffer object for userspace
[22:00:07] [PASSED] Kernel buffer object
[22:00:07] [PASSED] Shared buffer object
[22:00:07] ============ [PASSED] ttm_bo_validate_multihop =============
[22:00:07] ========== ttm_bo_validate_no_placement_signaled  ==========
[22:00:07] [PASSED] Buffer object in system domain, no page vector
[22:00:07] [PASSED] Buffer object in system domain with an existing page vector
[22:00:07] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[22:00:07] ======== ttm_bo_validate_no_placement_not_signaled  ========
[22:00:07] [PASSED] Buffer object for userspace
[22:00:07] [PASSED] Kernel buffer object
[22:00:07] [PASSED] Shared buffer object
[22:00:07] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[22:00:07] [PASSED] ttm_bo_validate_move_fence_signaled
[22:00:07] ========= ttm_bo_validate_move_fence_not_signaled  =========
[22:00:07] [PASSED] Waits for GPU
[22:00:07] [PASSED] Tries to lock straight away
[22:00:08] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[22:00:08] [PASSED] ttm_bo_validate_swapout
[22:00:08] [PASSED] ttm_bo_validate_happy_evict
[22:00:08] [PASSED] ttm_bo_validate_all_pinned_evict
[22:00:08] [PASSED] ttm_bo_validate_allowed_only_evict
[22:00:08] [PASSED] ttm_bo_validate_deleted_evict
[22:00:08] [PASSED] ttm_bo_validate_busy_domain_evict
[22:00:08] [PASSED] ttm_bo_validate_evict_gutting
[22:00:08] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[22:00:08] ================= [PASSED] ttm_bo_validate =================
[22:00:08] ============================================================
[22:00:08] Testing complete. Ran 102 tests: passed: 102
[22:00:08] Elapsed time: 10.379s total, 1.762s configuring, 8.000s building, 0.529s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


