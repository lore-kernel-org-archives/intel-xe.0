Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0800FC369A6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 02:38:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51A610E7BA;
	Wed,  9 Apr 2025 02:38:06 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5FD10E7B9;
 Wed,  9 Apr 2025 02:38:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/guc=3A_Squash_of_new_w/?=
 =?utf-8?q?a_and_GuC_update?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.c.harrison@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Apr 2025 02:38:06 -0000
Message-ID: <174416628628.50698.2370437191770131241@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250408223641.1903073-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250408223641.1903073-1-John.C.Harrison@Intel.com>
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

Series: drm/xe/guc: Squash of new w/a and GuC update
URL   : https://patchwork.freedesktop.org/series/147438/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[02:36:59] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:37:03] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[02:37:29] Starting KUnit Kernel (1/1)...
[02:37:29] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[02:37:29] ================== guc_buf (11 subtests) ===================
[02:37:29] [PASSED] test_smallest
[02:37:29] [PASSED] test_largest
[02:37:29] [PASSED] test_granular
[02:37:29] [PASSED] test_unique
[02:37:29] [PASSED] test_overlap
[02:37:29] [PASSED] test_reusable
[02:37:29] [PASSED] test_too_big
[02:37:29] [PASSED] test_flush
[02:37:29] [PASSED] test_lookup
[02:37:29] [PASSED] test_data
[02:37:29] [PASSED] test_class
[02:37:29] ===================== [PASSED] guc_buf =====================
[02:37:29] =================== guc_dbm (7 subtests) ===================
[02:37:29] [PASSED] test_empty
[02:37:29] [PASSED] test_default
[02:37:29] ======================== test_size  ========================
[02:37:29] [PASSED] 4
[02:37:29] [PASSED] 8
[02:37:29] [PASSED] 32
[02:37:29] [PASSED] 256
[02:37:29] ==================== [PASSED] test_size ====================
[02:37:29] ======================= test_reuse  ========================
[02:37:29] [PASSED] 4
[02:37:29] [PASSED] 8
[02:37:29] [PASSED] 32
[02:37:29] [PASSED] 256
[02:37:29] =================== [PASSED] test_reuse ====================
[02:37:29] =================== test_range_overlap  ====================
[02:37:29] [PASSED] 4
[02:37:29] [PASSED] 8
[02:37:29] [PASSED] 32
[02:37:29] [PASSED] 256
[02:37:29] =============== [PASSED] test_range_overlap ================
[02:37:29] =================== test_range_compact  ====================
[02:37:29] [PASSED] 4
[02:37:29] [PASSED] 8
[02:37:29] [PASSED] 32
[02:37:29] [PASSED] 256
[02:37:29] =============== [PASSED] test_range_compact ================
[02:37:29] ==================== test_range_spare  =====================
[02:37:29] [PASSED] 4
[02:37:29] [PASSED] 8
[02:37:29] [PASSED] 32
[02:37:29] [PASSED] 256
[02:37:29] ================ [PASSED] test_range_spare =================
[02:37:29] ===================== [PASSED] guc_dbm =====================
[02:37:29] =================== guc_idm (6 subtests) ===================
[02:37:29] [PASSED] bad_init
[02:37:29] [PASSED] no_init
[02:37:29] [PASSED] init_fini
[02:37:29] [PASSED] check_used
[02:37:29] [PASSED] check_quota
[02:37:29] [PASSED] check_all
[02:37:29] ===================== [PASSED] guc_idm =====================
[02:37:29] ================== no_relay (3 subtests) ===================
[02:37:29] [PASSED] xe_drops_guc2pf_if_not_ready
[02:37:29] [PASSED] xe_drops_guc2vf_if_not_ready
[02:37:29] [PASSED] xe_rejects_send_if_not_ready
[02:37:29] ==================== [PASSED] no_relay =====================
[02:37:29] ================== pf_relay (14 subtests) ==================
[02:37:29] [PASSED] pf_rejects_guc2pf_too_short
[02:37:29] [PASSED] pf_rejects_guc2pf_too_long
[02:37:29] [PASSED] pf_rejects_guc2pf_no_payload
[02:37:29] [PASSED] pf_fails_no_payload
[02:37:29] [PASSED] pf_fails_bad_origin
[02:37:29] [PASSED] pf_fails_bad_type
[02:37:29] [PASSED] pf_txn_reports_error
[02:37:29] [PASSED] pf_txn_sends_pf2guc
[02:37:29] [PASSED] pf_sends_pf2guc
[02:37:29] [SKIPPED] pf_loopback_nop
[02:37:29] [SKIPPED] pf_loopback_echo
[02:37:29] [SKIPPED] pf_loopback_fail
[02:37:29] [SKIPPED] pf_loopback_busy
[02:37:29] [SKIPPED] pf_loopback_retry
[02:37:29] ==================== [PASSED] pf_relay =====================
[02:37:29] ================== vf_relay (3 subtests) ===================
[02:37:29] [PASSED] vf_rejects_guc2vf_too_short
[02:37:29] [PASSED] vf_rejects_guc2vf_too_long
[02:37:29] [PASSED] vf_rejects_guc2vf_no_payload
[02:37:29] ==================== [PASSED] vf_relay =====================
[02:37:29] ================= pf_service (11 subtests) =================
[02:37:29] [PASSED] pf_negotiate_any
[02:37:29] [PASSED] pf_negotiate_base_match
[02:37:29] [PASSED] pf_negotiate_base_newer
[02:37:29] [PASSED] pf_negotiate_base_next
[02:37:29] [SKIPPED] pf_negotiate_base_older
[02:37:29] [PASSED] pf_negotiate_base_prev
[02:37:29] [PASSED] pf_negotiate_latest_match
[02:37:29] [PASSED] pf_negotiate_latest_newer
[02:37:29] [PASSED] pf_negotiate_latest_next
[02:37:29] [SKIPPED] pf_negotiate_latest_older
[02:37:29] [SKIPPED] pf_negotiate_latest_prev
[02:37:29] =================== [PASSED] pf_service ====================
[02:37:29] ===================== lmtt (1 subtest) =====================
[02:37:29] ======================== test_ops  =========================
[02:37:29] [PASSED] 2-level
[02:37:29] [PASSED] multi-level
[02:37:29] ==================== [PASSED] test_ops =====================
[02:37:29] ====================== [PASSED] lmtt =======================
[02:37:29] =================== xe_mocs (2 subtests) ===================
[02:37:29] ================ xe_live_mocs_kernel_kunit  ================
[02:37:29] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[02:37:29] ================ xe_live_mocs_reset_kunit  =================
[02:37:29] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[02:37:29] ==================== [SKIPPED] xe_mocs =====================
[02:37:29] ================= xe_migrate (2 subtests) ==================
[02:37:29] ================= xe_migrate_sanity_kunit  =================
[02:37:29] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[02:37:29] ================== xe_validate_ccs_kunit  ==================
[02:37:29] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[02:37:29] =================== [SKIPPED] xe_migrate ===================
[02:37:29] ================== xe_dma_buf (1 subtest) ==================
[02:37:29] ==================== xe_dma_buf_kunit  =====================
[02:37:29] ================ [SKIPPED] xe_dma_buf_kunit ================
[02:37:29] =================== [SKIPPED] xe_dma_buf ===================
[02:37:29] ================= xe_bo_shrink (1 subtest) =================
[02:37:29] =================== xe_bo_shrink_kunit  ====================
[02:37:29] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[02:37:29] ================== [SKIPPED] xe_bo_shrink ==================
[02:37:29] ==================== xe_bo (2 subtests) ====================
[02:37:29] ================== xe_ccs_migrate_kunit  ===================
[02:37:29] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[02:37:29] ==================== xe_bo_evict_kunit  ====================
[02:37:29] =============== [SKIPPED] xe_bo_evict_kunit ================
[02:37:29] ===================== [SKIPPED] xe_bo ======================
[02:37:29] ==================== args (11 subtests) ====================
[02:37:29] [PASSED] count_args_test
[02:37:29] [PASSED] call_args_example
[02:37:29] [PASSED] call_args_test
[02:37:29] [PASSED] drop_first_arg_example
[02:37:29] [PASSED] drop_first_arg_test
[02:37:29] [PASSED] first_arg_example
[02:37:29] [PASSED] first_arg_test
[02:37:29] [PASSED] last_arg_example
[02:37:29] [PASSED] last_arg_test
[02:37:29] [PASSED] pick_arg_example
[02:37:29] [PASSED] sep_comma_example
[02:37:29] ====================== [PASSED] args =======================
[02:37:29] =================== xe_pci (2 subtests) ====================
[02:37:29] [PASSED] xe_gmdid_graphics_ip
[02:37:29] [PASSED] xe_gmdid_media_ip
[02:37:29] ===================== [PASSED] xe_pci ======================
[02:37:29] =================== xe_rtp (2 subtests) ====================
[02:37:29] =============== xe_rtp_process_to_sr_tests  ================
[02:37:29] [PASSED] coalesce-same-reg
[02:37:29] [PASSED] no-match-no-add
[02:37:29] [PASSED] match-or
[02:37:29] [PASSED] match-or-xfail
[02:37:29] [PASSED] no-match-no-add-multiple-rules
[02:37:29] [PASSED] two-regs-two-entries
[02:37:29] [PASSED] clr-one-set-other
[02:37:29] [PASSED] set-field
[02:37:30] [PASSED] conflict-duplicate
[02:37:30] [PASSED] conflict-not-disjoint
stty: 'standard input': Inappropriate ioctl for device
[02:37:30] [PASSED] conflict-reg-type
[02:37:30] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[02:37:30] ================== xe_rtp_process_tests  ===================
[02:37:30] [PASSED] active1
[02:37:30] [PASSED] active2
[02:37:30] [PASSED] active-inactive
[02:37:30] [PASSED] inactive-active
[02:37:30] [PASSED] inactive-1st_or_active-inactive
[02:37:30] [PASSED] inactive-2nd_or_active-inactive
[02:37:30] [PASSED] inactive-last_or_active-inactive
[02:37:30] [PASSED] inactive-no_or_active-inactive
[02:37:30] ============== [PASSED] xe_rtp_process_tests ===============
[02:37:30] ===================== [PASSED] xe_rtp ======================
[02:37:30] ==================== xe_wa (1 subtest) =====================
[02:37:30] ======================== xe_wa_gt  =========================
[02:37:30] [PASSED] TIGERLAKE (B0)
[02:37:30] [PASSED] DG1 (A0)
[02:37:30] [PASSED] DG1 (B0)
[02:37:30] [PASSED] ALDERLAKE_S (A0)
[02:37:30] [PASSED] ALDERLAKE_S (B0)
[02:37:30] [PASSED] ALDERLAKE_S (C0)
[02:37:30] [PASSED] ALDERLAKE_S (D0)
[02:37:30] [PASSED] ALDERLAKE_P (A0)
[02:37:30] [PASSED] ALDERLAKE_P (B0)
[02:37:30] [PASSED] ALDERLAKE_P (C0)
[02:37:30] [PASSED] ALDERLAKE_S_RPLS (D0)
[02:37:30] [PASSED] ALDERLAKE_P_RPLU (E0)
[02:37:30] [PASSED] DG2_G10 (C0)
[02:37:30] [PASSED] DG2_G11 (B1)
[02:37:30] [PASSED] DG2_G12 (A1)
[02:37:30] [PASSED] METEORLAKE (g:A0, m:A0)
[02:37:30] [PASSED] METEORLAKE (g:A0, m:A0)
[02:37:30] [PASSED] METEORLAKE (g:A0, m:A0)
[02:37:30] [PASSED] LUNARLAKE (g:A0, m:A0)
[02:37:30] [PASSED] LUNARLAKE (g:B0, m:A0)
[02:37:30] [PASSED] BATTLEMAGE (g:A0, m:A1)
[02:37:30] ==================== [PASSED] xe_wa_gt =====================
[02:37:30] ====================== [PASSED] xe_wa ======================
[02:37:30] ============================================================
[02:37:30] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[02:37:30] Elapsed time: 30.960s total, 4.261s configuring, 26.384s building, 0.288s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[02:37:30] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:37:31] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[02:37:53] Starting KUnit Kernel (1/1)...
[02:37:53] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[02:37:53] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[02:37:53] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[02:37:53] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[02:37:53] =========== drm_validate_clone_mode (2 subtests) ===========
[02:37:53] ============== drm_test_check_in_clone_mode  ===============
[02:37:53] [PASSED] in_clone_mode
[02:37:53] [PASSED] not_in_clone_mode
[02:37:53] ========== [PASSED] drm_test_check_in_clone_mode ===========
[02:37:53] =============== drm_test_check_valid_clones  ===============
[02:37:53] [PASSED] not_in_clone_mode
[02:37:53] [PASSED] valid_clone
[02:37:53] [PASSED] invalid_clone
[02:37:53] =========== [PASSED] drm_test_check_valid_clones ===========
[02:37:53] ============= [PASSED] drm_validate_clone_mode =============
[02:37:53] ============= drm_validate_modeset (1 subtest) =============
[02:37:53] [PASSED] drm_test_check_connector_changed_modeset
[02:37:53] ============== [PASSED] drm_validate_modeset ===============
[02:37:53] ====== drm_test_bridge_get_current_state (2 subtests) ======
[02:37:53] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[02:37:53] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[02:37:53] ======== [PASSED] drm_test_bridge_get_current_state ========
[02:37:53] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[02:37:53] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[02:37:53] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[02:37:53] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[02:37:53] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[02:37:53] ================== drm_buddy (7 subtests) ==================
[02:37:53] [PASSED] drm_test_buddy_alloc_limit
[02:37:53] [PASSED] drm_test_buddy_alloc_optimistic
[02:37:53] [PASSED] drm_test_buddy_alloc_pessimistic
[02:37:53] [PASSED] drm_test_buddy_alloc_pathological
[02:37:53] [PASSED] drm_test_buddy_alloc_contiguous
[02:37:53] [PASSED] drm_test_buddy_alloc_clear
[02:37:53] [PASSED] drm_test_buddy_alloc_range_bias
[02:37:53] ==================== [PASSED] drm_buddy ====================
[02:37:53] ============= drm_cmdline_parser (40 subtests) =============
[02:37:53] [PASSED] drm_test_cmdline_force_d_only
[02:37:53] [PASSED] drm_test_cmdline_force_D_only_dvi
[02:37:53] [PASSED] drm_test_cmdline_force_D_only_hdmi
[02:37:53] [PASSED] drm_test_cmdline_force_D_only_not_digital
[02:37:53] [PASSED] drm_test_cmdline_force_e_only
[02:37:53] [PASSED] drm_test_cmdline_res
[02:37:53] [PASSED] drm_test_cmdline_res_vesa
[02:37:53] [PASSED] drm_test_cmdline_res_vesa_rblank
[02:37:53] [PASSED] drm_test_cmdline_res_rblank
[02:37:53] [PASSED] drm_test_cmdline_res_bpp
[02:37:53] [PASSED] drm_test_cmdline_res_refresh
[02:37:53] [PASSED] drm_test_cmdline_res_bpp_refresh
[02:37:53] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[02:37:53] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[02:37:53] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[02:37:53] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[02:37:53] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[02:37:53] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[02:37:53] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[02:37:53] [PASSED] drm_test_cmdline_res_margins_force_on
[02:37:53] [PASSED] drm_test_cmdline_res_vesa_margins
[02:37:53] [PASSED] drm_test_cmdline_name
[02:37:53] [PASSED] drm_test_cmdline_name_bpp
[02:37:53] [PASSED] drm_test_cmdline_name_option
[02:37:53] [PASSED] drm_test_cmdline_name_bpp_option
[02:37:53] [PASSED] drm_test_cmdline_rotate_0
[02:37:53] [PASSED] drm_test_cmdline_rotate_90
[02:37:53] [PASSED] drm_test_cmdline_rotate_180
[02:37:53] [PASSED] drm_test_cmdline_rotate_270
[02:37:53] [PASSED] drm_test_cmdline_hmirror
[02:37:53] [PASSED] drm_test_cmdline_vmirror
[02:37:53] [PASSED] drm_test_cmdline_margin_options
[02:37:53] [PASSED] drm_test_cmdline_multiple_options
[02:37:53] [PASSED] drm_test_cmdline_bpp_extra_and_option
[02:37:53] [PASSED] drm_test_cmdline_extra_and_option
[02:37:53] [PASSED] drm_test_cmdline_freestanding_options
[02:37:53] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[02:37:53] [PASSED] drm_test_cmdline_panel_orientation
[02:37:53] ================ drm_test_cmdline_invalid  =================
[02:37:53] [PASSED] margin_only
[02:37:53] [PASSED] interlace_only
[02:37:53] [PASSED] res_missing_x
[02:37:53] [PASSED] res_missing_y
[02:37:53] [PASSED] res_bad_y
[02:37:53] [PASSED] res_missing_y_bpp
[02:37:53] [PASSED] res_bad_bpp
[02:37:53] [PASSED] res_bad_refresh
[02:37:53] [PASSED] res_bpp_refresh_force_on_off
[02:37:53] [PASSED] res_invalid_mode
[02:37:53] [PASSED] res_bpp_wrong_place_mode
[02:37:53] [PASSED] name_bpp_refresh
[02:37:53] [PASSED] name_refresh
[02:37:53] [PASSED] name_refresh_wrong_mode
[02:37:53] [PASSED] name_refresh_invalid_mode
[02:37:53] [PASSED] rotate_multiple
[02:37:53] [PASSED] rotate_invalid_val
[02:37:53] [PASSED] rotate_truncated
[02:37:53] [PASSED] invalid_option
[02:37:53] [PASSED] invalid_tv_option
[02:37:53] [PASSED] truncated_tv_option
[02:37:53] ============ [PASSED] drm_test_cmdline_invalid =============
[02:37:53] =============== drm_test_cmdline_tv_options  ===============
[02:37:53] [PASSED] NTSC
[02:37:53] [PASSED] NTSC_443
[02:37:53] [PASSED] NTSC_J
[02:37:53] [PASSED] PAL
[02:37:53] [PASSED] PAL_M
[02:37:53] [PASSED] PAL_N
[02:37:53] [PASSED] SECAM
[02:37:53] [PASSED] MONO_525
[02:37:53] [PASSED] MONO_625
[02:37:53] =========== [PASSED] drm_test_cmdline_tv_options ===========
[02:37:53] =============== [PASSED] drm_cmdline_parser ================
[02:37:53] ========== drmm_connector_hdmi_init (20 subtests) ==========
[02:37:53] [PASSED] drm_test_connector_hdmi_init_valid
[02:37:53] [PASSED] drm_test_connector_hdmi_init_bpc_8
[02:37:53] [PASSED] drm_test_connector_hdmi_init_bpc_10
[02:37:53] [PASSED] drm_test_connector_hdmi_init_bpc_12
[02:37:53] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[02:37:53] [PASSED] drm_test_connector_hdmi_init_bpc_null
[02:37:53] [PASSED] drm_test_connector_hdmi_init_formats_empty
[02:37:53] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[02:37:53] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[02:37:53] [PASSED] supported_formats=0x9 yuv420_allowed=1
[02:37:53] [PASSED] supported_formats=0x9 yuv420_allowed=0
[02:37:53] [PASSED] supported_formats=0x3 yuv420_allowed=1
[02:37:53] [PASSED] supported_formats=0x3 yuv420_allowed=0
[02:37:53] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[02:37:53] [PASSED] drm_test_connector_hdmi_init_null_ddc
[02:37:53] [PASSED] drm_test_connector_hdmi_init_null_product
[02:37:53] [PASSED] drm_test_connector_hdmi_init_null_vendor
[02:37:53] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[02:37:53] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[02:37:53] [PASSED] drm_test_connector_hdmi_init_product_valid
[02:37:53] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[02:37:53] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[02:37:53] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[02:37:53] ========= drm_test_connector_hdmi_init_type_valid  =========
[02:37:53] [PASSED] HDMI-A
[02:37:53] [PASSED] HDMI-B
[02:37:53] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[02:37:53] ======== drm_test_connector_hdmi_init_type_invalid  ========
[02:37:53] [PASSED] Unknown
[02:37:53] [PASSED] VGA
[02:37:53] [PASSED] DVI-I
[02:37:53] [PASSED] DVI-D
[02:37:53] [PASSED] DVI-A
[02:37:53] [PASSED] Composite
[02:37:53] [PASSED] SVIDEO
[02:37:53] [PASSED] LVDS
[02:37:53] [PASSED] Component
[02:37:53] [PASSED] DIN
[02:37:53] [PASSED] DP
[02:37:53] [PASSED] TV
[02:37:53] [PASSED] eDP
[02:37:53] [PASSED] Virtual
[02:37:53] [PASSED] DSI
[02:37:53] [PASSED] DPI
[02:37:53] [PASSED] Writeback
[02:37:53] [PASSED] SPI
[02:37:53] [PASSED] USB
[02:37:53] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[02:37:53] ============ [PASSED] drmm_connector_hdmi_init =============
[02:37:53] ============= drmm_connector_init (3 subtests) =============
[02:37:53] [PASSED] drm_test_drmm_connector_init
[02:37:53] [PASSED] drm_test_drmm_connector_init_null_ddc
[02:37:53] ========= drm_test_drmm_connector_init_type_valid  =========
[02:37:53] [PASSED] Unknown
[02:37:53] [PASSED] VGA
[02:37:53] [PASSED] DVI-I
[02:37:53] [PASSED] DVI-D
[02:37:53] [PASSED] DVI-A
[02:37:53] [PASSED] Composite
[02:37:53] [PASSED] SVIDEO
[02:37:53] [PASSED] LVDS
[02:37:53] [PASSED] Component
[02:37:53] [PASSED] DIN
[02:37:53] [PASSED] DP
[02:37:53] [PASSED] HDMI-A
[02:37:53] [PASSED] HDMI-B
[02:37:53] [PASSED] TV
[02:37:53] [PASSED] eDP
[02:37:53] [PASSED] Virtual
[02:37:53] [PASSED] DSI
[02:37:53] [PASSED] DPI
[02:37:53] [PASSED] Writeback
[02:37:53] [PASSED] SPI
[02:37:53] [PASSED] USB
[02:37:53] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[02:37:53] =============== [PASSED] drmm_connector_init ===============
[02:37:53] ========= drm_connector_dynamic_init (6 subtests) ==========
[02:37:53] [PASSED] drm_test_drm_connector_dynamic_init
[02:37:53] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[02:37:53] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[02:37:53] [PASSED] drm_test_drm_connector_dynamic_init_properties
[02:37:53] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[02:37:53] [PASSED] Unknown
[02:37:53] [PASSED] VGA
[02:37:53] [PASSED] DVI-I
[02:37:53] [PASSED] DVI-D
[02:37:53] [PASSED] DVI-A
[02:37:53] [PASSED] Composite
[02:37:53] [PASSED] SVIDEO
[02:37:53] [PASSED] LVDS
[02:37:53] [PASSED] Component
[02:37:53] [PASSED] DIN
[02:37:53] [PASSED] DP
[02:37:53] [PASSED] HDMI-A
[02:37:53] [PASSED] HDMI-B
[02:37:53] [PASSED] TV
[02:37:53] [PASSED] eDP
[02:37:53] [PASSED] Virtual
[02:37:53] [PASSED] DSI
[02:37:53] [PASSED] DPI
[02:37:53] [PASSED] Writeback
[02:37:53] [PASSED] SPI
[02:37:53] [PASSED] USB
[02:37:53] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[02:37:53] ======== drm_test_drm_connector_dynamic_init_name  =========
[02:37:53] [PASSED] Unknown
[02:37:53] [PASSED] VGA
[02:37:53] [PASSED] DVI-I
[02:37:53] [PASSED] DVI-D
[02:37:53] [PASSED] DVI-A
[02:37:53] [PASSED] Composite
[02:37:53] [PASSED] SVIDEO
[02:37:53] [PASSED] LVDS
[02:37:53] [PASSED] Component
[02:37:53] [PASSED] DIN
[02:37:53] [PASSED] DP
[02:37:53] [PASSED] HDMI-A
[02:37:53] [PASSED] HDMI-B
[02:37:53] [PASSED] TV
[02:37:53] [PASSED] eDP
[02:37:53] [PASSED] Virtual
[02:37:53] [PASSED] DSI
[02:37:53] [PASSED] DPI
[02:37:53] [PASSED] Writeback
[02:37:53] [PASSED] SPI
[02:37:53] [PASSED] USB
[02:37:53] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[02:37:53] =========== [PASSED] drm_connector_dynamic_init ============
[02:37:53] ==== drm_connector_dynamic_register_early (4 subtests) =====
[02:37:53] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[02:37:53] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[02:37:53] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[02:37:53] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[02:37:53] ====== [PASSED] drm_connector_dynamic_register_early =======
[02:37:53] ======= drm_connector_dynamic_register (7 subtests) ========
[02:37:53] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[02:37:53] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[02:37:53] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[02:37:53] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[02:37:53] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[02:37:53] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[02:37:53] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[02:37:53] ========= [PASSED] drm_connector_dynamic_register ==========
[02:37:53] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[02:37:53] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[02:37:53] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[02:37:53] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[02:37:53] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[02:37:53] ========== drm_test_get_tv_mode_from_name_valid  ===========
[02:37:53] [PASSED] NTSC
[02:37:53] [PASSED] NTSC-443
[02:37:53] [PASSED] NTSC-J
[02:37:53] [PASSED] PAL
[02:37:53] [PASSED] PAL-M
[02:37:53] [PASSED] PAL-N
[02:37:53] [PASSED] SECAM
[02:37:53] [PASSED] Mono
[02:37:53] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[02:37:53] [PASSED] drm_test_get_tv_mode_from_name_truncated
[02:37:53] ============ [PASSED] drm_get_tv_mode_from_name ============
[02:37:53] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[02:37:53] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[02:37:53] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[02:37:53] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[02:37:53] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[02:37:53] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[02:37:53] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[02:37:53] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[02:37:53] [PASSED] VIC 96
[02:37:53] [PASSED] VIC 97
[02:37:53] [PASSED] VIC 101
[02:37:53] [PASSED] VIC 102
[02:37:53] [PASSED] VIC 106
[02:37:53] [PASSED] VIC 107
[02:37:53] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[02:37:53] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[02:37:53] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[02:37:53] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[02:37:53] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[02:37:53] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[02:37:53] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[02:37:53] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[02:37:53] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[02:37:53] [PASSED] Automatic
[02:37:53] [PASSED] Full
[02:37:53] [PASSED] Limited 16:235
[02:37:53] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[02:37:53] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[02:37:53] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[02:37:53] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[02:37:53] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[02:37:53] [PASSED] RGB
[02:37:53] [PASSED] YUV 4:2:0
[02:37:53] [PASSED] YUV 4:2:2
[02:37:53] [PASSED] YUV 4:4:4
[02:37:53] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[02:37:53] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[02:37:53] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[02:37:53] ============= drm_damage_helper (21 subtests) ==============
[02:37:53] [PASSED] drm_test_damage_iter_no_damage
[02:37:53] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[02:37:53] [PASSED] drm_test_damage_iter_no_damage_src_moved
[02:37:53] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[02:37:53] [PASSED] drm_test_damage_iter_no_damage_not_visible
[02:37:53] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[02:37:53] [PASSED] drm_test_damage_iter_no_damage_no_fb
[02:37:53] [PASSED] drm_test_damage_iter_simple_damage
[02:37:53] [PASSED] drm_test_damage_iter_single_damage
[02:37:53] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[02:37:53] [PASSED] drm_test_damage_iter_single_damage_outside_src
[02:37:53] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[02:37:53] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[02:37:53] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[02:37:53] [PASSED] drm_test_damage_iter_single_damage_src_moved
[02:37:53] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[02:37:53] [PASSED] drm_test_damage_iter_damage
[02:37:53] [PASSED] drm_test_damage_iter_damage_one_intersect
[02:37:53] [PASSED] drm_test_damage_iter_damage_one_outside
[02:37:53] [PASSED] drm_test_damage_iter_damage_src_moved
[02:37:53] [PASSED] drm_test_damage_iter_damage_not_visible
[02:37:53] ================ [PASSED] drm_damage_helper ================
[02:37:53] ============== drm_dp_mst_helper (3 subtests) ==============
[02:37:53] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[02:37:53] [PASSED] Clock 154000 BPP 30 DSC disabled
[02:37:53] [PASSED] Clock 234000 BPP 30 DSC disabled
[02:37:53] [PASSED] Clock 297000 BPP 24 DSC disabled
[02:37:53] [PASSED] Clock 332880 BPP 24 DSC enabled
[02:37:53] [PASSED] Clock 324540 BPP 24 DSC enabled
[02:37:53] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[02:37:53] ============== drm_test_dp_mst_calc_pbn_div  ===============
[02:37:53] [PASSED] Link rate 2000000 lane count 4
[02:37:53] [PASSED] Link rate 2000000 lane count 2
[02:37:53] [PASSED] Link rate 2000000 lane count 1
[02:37:53] [PASSED] Link rate 1350000 lane count 4
[02:37:53] [PASSED] Link rate 1350000 lane count 2
[02:37:53] [PASSED] Link rate 1350000 lane count 1
[02:37:53] [PASSED] Link rate 1000000 lane count 4
[02:37:53] [PASSED] Link rate 1000000 lane count 2
[02:37:53] [PASSED] Link rate 1000000 lane count 1
[02:37:53] [PASSED] Link rate 810000 lane count 4
[02:37:53] [PASSED] Link rate 810000 lane count 2
[02:37:53] [PASSED] Link rate 810000 lane count 1
[02:37:53] [PASSED] Link rate 540000 lane count 4
[02:37:53] [PASSED] Link rate 540000 lane count 2
[02:37:53] [PASSED] Link rate 540000 lane count 1
[02:37:53] [PASSED] Link rate 270000 lane count 4
[02:37:53] [PASSED] Link rate 270000 lane count 2
[02:37:53] [PASSED] Link rate 270000 lane count 1
[02:37:53] [PASSED] Link rate 162000 lane count 4
[02:37:53] [PASSED] Link rate 162000 lane count 2
[02:37:53] [PASSED] Link rate 162000 lane count 1
[02:37:53] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[02:37:53] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[02:37:53] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[02:37:53] [PASSED] DP_POWER_UP_PHY with port number
[02:37:53] [PASSED] DP_POWER_DOWN_PHY with port number
[02:37:53] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[02:37:53] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[02:37:53] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[02:37:53] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[02:37:53] [PASSED] DP_QUERY_PAYLOAD with port number
[02:37:53] [PASSED] DP_QUERY_PAYLOAD with VCPI
[02:37:53] [PASSED] DP_REMOTE_DPCD_READ with port number
[02:37:53] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[02:37:53] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[02:37:53] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[02:37:53] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[02:37:53] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[02:37:53] [PASSED] DP_REMOTE_I2C_READ with port number
[02:37:53] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[02:37:53] [PASSED] DP_REMOTE_I2C_READ with transactions array
[02:37:53] [PASSED] DP_REMOTE_I2C_WRITE with port number
[02:37:53] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[02:37:53] [PASSED] DP_REMOTE_I2C_WRITE with data array
[02:37:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[02:37:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[02:37:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[02:37:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[02:37:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[02:37:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[02:37:53] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[02:37:53] ================ [PASSED] drm_dp_mst_helper ================
[02:37:53] ================== drm_exec (7 subtests) ===================
[02:37:53] [PASSED] sanitycheck
[02:37:53] [PASSED] test_lock
[02:37:53] [PASSED] test_lock_unlock
[02:37:53] [PASSED] test_duplicates
[02:37:53] [PASSED] test_prepare
[02:37:53] [PASSED] test_prepare_array
[02:37:53] [PASSED] test_multiple_loops
[02:37:53] ==================== [PASSED] drm_exec =====================
[02:37:53] =========== drm_format_helper_test (18 subtests) ===========
[02:37:53] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[02:37:53] [PASSED] single_pixel_source_buffer
[02:37:53] [PASSED] single_pixel_clip_rectangle
[02:37:53] [PASSED] well_known_colors
[02:37:53] [PASSED] destination_pitch
[02:37:53] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[02:37:53] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[02:37:53] [PASSED] single_pixel_source_buffer
[02:37:53] [PASSED] single_pixel_clip_rectangle
[02:37:53] [PASSED] well_known_colors
[02:37:53] [PASSED] destination_pitch
[02:37:53] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[02:37:53] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[02:37:53] [PASSED] single_pixel_source_buffer
[02:37:53] [PASSED] single_pixel_clip_rectangle
[02:37:53] [PASSED] well_known_colors
[02:37:53] [PASSED] destination_pitch
[02:37:53] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[02:37:53] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[02:37:53] [PASSED] single_pixel_source_buffer
[02:37:53] [PASSED] single_pixel_clip_rectangle
[02:37:53] [PASSED] well_known_colors
[02:37:53] [PASSED] destination_pitch
[02:37:53] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[02:37:53] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[02:37:53] [PASSED] single_pixel_source_buffer
[02:37:53] [PASSED] single_pixel_clip_rectangle
[02:37:53] [PASSED] well_known_colors
[02:37:53] [PASSED] destination_pitch
[02:37:53] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[02:37:53] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[02:37:53] [PASSED] single_pixel_source_buffer
[02:37:53] [PASSED] single_pixel_clip_rectangle
[02:37:53] [PASSED] well_known_colors
[02:37:53] [PASSED] destination_pitch
[02:37:53] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[02:37:53] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[02:37:53] [PASSED] single_pixel_source_buffer
[02:37:53] [PASSED] single_pixel_clip_rectangle
[02:37:53] [PASSED] well_known_colors
[02:37:53] [PASSED] destination_pitch
[02:37:53] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[02:37:53] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[02:37:53] [PASSED] single_pixel_source_buffer
[02:37:53] [PASSED] single_pixel_clip_rectangle
[02:37:53] [PASSED] well_known_colors
[02:37:53] [PASSED] destination_pitch
[02:37:53] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[02:37:53] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[02:37:53] [PASSED] single_pixel_source_buffer
[02:37:53] [PASSED] single_pixel_clip_rectangle
[02:37:53] [PASSED] well_known_colors
[02:37:53] [PASSED] destination_pitch
[02:37:53] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[02:37:53] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[02:37:53] [PASSED] single_pixel_source_buffer
[02:37:53] [PASSED] single_pixel_clip_rectangle
[02:37:53] [PASSED] well_known_colors
[02:37:53] [PASSED] destination_pitch
[02:37:53] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[02:37:53] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[02:37:53] [PASSED] single_pixel_source_buffer
[02:37:53] [PASSED] single_pixel_clip_rectangle
[02:37:53] [PASSED] well_known_colors
[02:37:53] [PASSED] destination_pitch
[02:37:53] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[02:37:53] ============== drm_test_fb_xrgb8888_to_mono  ===============
[02:37:53] [PASSED] single_pixel_source_buffer
[02:37:53] [PASSED] single_pixel_clip_rectangle
[02:37:53] [PASSED] well_known_colors
[02:37:53] [PASSED] destination_pitch
[02:37:53] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[02:37:53] ==================== drm_test_fb_swab  =====================
[02:37:53] [PASSED] single_pixel_source_buffer
[02:37:53] [PASSED] single_pixel_clip_rectangle
[02:37:53] [PASSED] well_known_colors
[02:37:53] [PASSED] destination_pitch
[02:37:53] ================ [PASSED] drm_test_fb_swab =================
[02:37:53] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[02:37:53] [PASSED] single_pixel_source_buffer
[02:37:53] [PASSED] single_pixel_clip_rectangle
[02:37:53] [PASSED] well_known_colors
[02:37:53] [PASSED] destination_pitch
[02:37:53] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[02:37:53] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[02:37:53] [PASSED] single_pixel_source_buffer
[02:37:53] [PASSED] single_pixel_clip_rectangle
[02:37:53] [PASSED] well_known_colors
[02:37:53] [PASSED] destination_pitch
[02:37:53] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[02:37:53] ================= drm_test_fb_clip_offset  =================
[02:37:53] [PASSED] pass through
[02:37:53] [PASSED] horizontal offset
[02:37:53] [PASSED] vertical offset
[02:37:53] [PASSED] horizontal and vertical offset
[02:37:53] [PASSED] horizontal offset (custom pitch)
[02:37:53] [PASSED] vertical offset (custom pitch)
[02:37:53] [PASSED] horizontal and vertical offset (custom pitch)
[02:37:53] ============= [PASSED] drm_test_fb_clip_offset =============
[02:37:53] ============== drm_test_fb_build_fourcc_list  ==============
[02:37:53] [PASSED] no native formats
[02:37:53] [PASSED] XRGB8888 as native format
[02:37:53] [PASSED] remove duplicates
[02:37:53] [PASSED] convert alpha formats
[02:37:53] [PASSED] random formats
[02:37:53] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[02:37:53] =================== drm_test_fb_memcpy  ====================
[02:37:53] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[02:37:53] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[02:37:53] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[02:37:53] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[02:37:53] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[02:37:53] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[02:37:53] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[02:37:53] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[02:37:53] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[02:37:53] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[02:37:53] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[02:37:53] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[02:37:53] =============== [PASSED] drm_test_fb_memcpy ================
[02:37:53] ============= [PASSED] drm_format_helper_test ==============
[02:37:53] ================= drm_format (18 subtests) =================
[02:37:53] [PASSED] drm_test_format_block_width_invalid
[02:37:53] [PASSED] drm_test_format_block_width_one_plane
[02:37:53] [PASSED] drm_test_format_block_width_two_plane
[02:37:53] [PASSED] drm_test_format_block_width_three_plane
[02:37:53] [PASSED] drm_test_format_block_width_tiled
[02:37:53] [PASSED] drm_test_format_block_height_invalid
[02:37:53] [PASSED] drm_test_format_block_height_one_plane
[02:37:53] [PASSED] drm_test_format_block_height_two_plane
[02:37:53] [PASSED] drm_test_format_block_height_three_plane
[02:37:53] [PASSED] drm_test_format_block_height_tiled
[02:37:53] [PASSED] drm_test_format_min_pitch_invalid
[02:37:53] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[02:37:53] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[02:37:53] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[02:37:53] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[02:37:53] [PASSED] drm_test_format_min_pitch_two_plane
[02:37:53] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[02:37:53] [PASSED] drm_test_format_min_pitch_tiled
[02:37:53] =================== [PASSED] drm_format ====================
[02:37:53] ============== drm_framebuffer (10 subtests) ===============
[02:37:53] ========== drm_test_framebuffer_check_src_coords  ==========
[02:37:53] [PASSED] Success: source fits into fb
[02:37:53] [PASSED] Fail: overflowing fb with x-axis coordinate
[02:37:53] [PASSED] Fail: overflowing fb with y-axis coordinate
[02:37:53] [PASSED] Fail: overflowing fb with source width
[02:37:53] [PASSED] Fail: overflowing fb with source height
[02:37:53] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[02:37:53] [PASSED] drm_test_framebuffer_cleanup
[02:37:53] =============== drm_test_framebuffer_create  ===============
[02:37:53] [PASSED] ABGR8888 normal sizes
[02:37:53] [PASSED] ABGR8888 max sizes
[02:37:53] [PASSED] ABGR8888 pitch greater than min required
[02:37:53] [PASSED] ABGR8888 pitch less than min required
[02:37:53] [PASSED] ABGR8888 Invalid width
[02:37:53] [PASSED] ABGR8888 Invalid buffer handle
[02:37:53] [PASSED] No pixel format
[02:37:53] [PASSED] ABGR8888 Width 0
[02:37:53] [PASSED] ABGR8888 Height 0
[02:37:53] [PASSED] ABGR8888 Out of bound height * pitch combination
[02:37:53] [PASSED] ABGR8888 Large buffer offset
[02:37:53] [PASSED] ABGR8888 Buffer offset for inexistent plane
[02:37:53] [PASSED] ABGR8888 Invalid flag
[02:37:53] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[02:37:53] [PASSED] ABGR8888 Valid buffer modifier
[02:37:53] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[02:37:53] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[02:37:53] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[02:37:53] [PASSED] NV12 Normal sizes
[02:37:53] [PASSED] NV12 Max sizes
[02:37:53] [PASSED] NV12 Invalid pitch
[02:37:53] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[02:37:53] [PASSED] NV12 different  modifier per-plane
[02:37:53] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[02:37:53] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[02:37:53] [PASSED] NV12 Modifier for inexistent plane
[02:37:53] [PASSED] NV12 Handle for inexistent plane
[02:37:53] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[02:37:53] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[02:37:53] [PASSED] YVU420 Normal sizes
[02:37:53] [PASSED] YVU420 Max sizes
[02:37:53] [PASSED] YVU420 Invalid pitch
[02:37:53] [PASSED] YVU420 Different pitches
[02:37:53] [PASSED] YVU420 Different buffer offsets/pitches
[02:37:53] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[02:37:53] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[02:37:53] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[02:37:53] [PASSED] YVU420 Valid modifier
[02:37:53] [PASSED] YVU420 Different modifiers per plane
[02:37:53] [PASSED] YVU420 Modifier for inexistent plane
[02:37:53] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[02:37:53] [PASSED] X0L2 Normal sizes
[02:37:53] [PASSED] X0L2 Max sizes
[02:37:53] [PASSED] X0L2 Invalid pitch
[02:37:53] [PASSED] X0L2 Pitch greater than minimum required
[02:37:53] [PASSED] X0L2 Handle for inexistent plane
[02:37:53] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[02:37:53] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[02:37:53] [PASSED] X0L2 Valid modifier
[02:37:53] [PASSED] X0L2 Modifier for inexistent plane
[02:37:53] =========== [PASSED] drm_test_framebuffer_create ===========
[02:37:53] [PASSED] drm_test_framebuffer_free
[02:37:53] [PASSED] drm_test_framebuffer_init
[02:37:53] [PASSED] drm_test_framebuffer_init_bad_format
[02:37:53] [PASSED] drm_test_framebuffer_init_dev_mismatch
[02:37:53] [PASSED] drm_test_framebuffer_lookup
[02:37:53] [PASSED] drm_test_framebuffer_lookup_inexistent
[02:37:53] [PASSED] drm_test_framebuffer_modifiers_not_supported
[02:37:53] ================= [PASSED] drm_framebuffer =================
[02:37:53] ================ drm_gem_shmem (8 subtests) ================
[02:37:53] [PASSED] drm_gem_shmem_test_obj_create
[02:37:53] [PASSED] drm_gem_shmem_test_obj_create_private
[02:37:53] [PASSED] drm_gem_shmem_test_pin_pages
[02:37:53] [PASSED] drm_gem_shmem_test_vmap
[02:37:53] [PASSED] drm_gem_shmem_test_get_pages_sgt
[02:37:53] [PASSED] drm_gem_shmem_test_get_sg_table
[02:37:53] [PASSED] drm_gem_shmem_test_madvise
[02:37:53] [PASSED] drm_gem_shmem_test_purge
[02:37:53] ================== [PASSED] drm_gem_shmem ==================
[02:37:53] === drm_atomic_helper_connector_hdmi_check (23 subtests) ===
[02:37:53] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[02:37:53] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[02:37:53] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[02:37:53] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[02:37:53] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[02:37:53] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[02:37:53] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[02:37:53] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[02:37:53] [PASSED] drm_test_check_disable_connector
[02:37:53] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[02:37:53] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[02:37:53] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[02:37:53] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[02:37:53] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[02:37:53] [PASSED] drm_test_check_output_bpc_dvi
[02:37:53] [PASSED] drm_test_check_output_bpc_format_vic_1
[02:37:53] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[02:37:53] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[02:37:53] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[02:37:53] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[02:37:53] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[02:37:53] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[02:37:53] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[02:37:53] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[02:37:53] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[02:37:53] [PASSED] drm_test_check_broadcast_rgb_value
[02:37:53] [PASSED] drm_test_check_bpc_8_value
[02:37:53] [PASSED] drm_test_check_bpc_10_value
[02:37:53] [PASSED] drm_test_check_bpc_12_value
[02:37:53] [PASSED] drm_test_check_format_value
[02:37:53] [PASSED] drm_test_check_tmds_char_value
[02:37:53] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[02:37:53] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[02:37:53] [PASSED] drm_test_check_mode_valid
[02:37:53] [PASSED] drm_test_check_mode_valid_reject
[02:37:53] [PASSED] drm_test_check_mode_valid_reject_rate
[02:37:53] [PASSED] drm_test_check_mode_valid_reject_max_clock
[02:37:53] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[02:37:53] ================= drm_managed (2 subtests) =================
[02:37:53] [PASSED] drm_test_managed_release_action
[02:37:53] [PASSED] drm_test_managed_run_action
[02:37:53] =================== [PASSED] drm_managed ===================
[02:37:53] =================== drm_mm (6 subtests) ====================
[02:37:53] [PASSED] drm_test_mm_init
[02:37:53] [PASSED] drm_test_mm_debug
[02:37:53] [PASSED] drm_test_mm_align32
[02:37:53] [PASSED] drm_test_mm_align64
[02:37:53] [PASSED] drm_test_mm_lowest
[02:37:53] [PASSED] drm_test_mm_highest
[02:37:53] ===================== [PASSED] drm_mm ======================
[02:37:53] ============= drm_modes_analog_tv (5 subtests) =============
[02:37:53] [PASSED] drm_test_modes_analog_tv_mono_576i
[02:37:53] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[02:37:53] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[02:37:53] [PASSED] drm_test_modes_analog_tv_pal_576i
[02:37:53] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[02:37:53] =============== [PASSED] drm_modes_analog_tv ===============
[02:37:53] ============== drm_plane_helper (2 subtests) ===============
[02:37:53] =============== drm_test_check_plane_state  ================
[02:37:53] [PASSED] clipping_simple
[02:37:53] [PASSED] clipping_rotate_reflect
[02:37:53] [PASSED] positioning_simple
[02:37:53] [PASSED] upscaling
[02:37:53] [PASSED] downscaling
[02:37:53] [PASSED] rounding1
[02:37:53] [PASSED] rounding2
[02:37:53] [PASSED] rounding3
[02:37:53] [PASSED] rounding4
[02:37:53] =========== [PASSED] drm_test_check_plane_state ============
[02:37:53] =========== drm_test_check_invalid_plane_state  ============
[02:37:53] [PASSED] positioning_invalid
[02:37:53] [PASSED] upscaling_invalid
[02:37:53] [PASSED] downscaling_invalid
[02:37:53] ======= [PASSED] drm_test_check_invalid_plane_state ========
[02:37:53] ================ [PASSED] drm_plane_helper =================
[02:37:53] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[02:37:53] ====== drm_test_connector_helper_tv_get_modes_check  =======
[02:37:53] [PASSED] None
[02:37:53] [PASSED] PAL
[02:37:53] [PASSED] NTSC
[02:37:53] [PASSED] Both, NTSC Default
[02:37:53] [PASSED] Both, PAL Default
[02:37:53] [PASSED] Both, NTSC Default, with PAL on command-line
[02:37:53] [PASSED] Both, PAL Default, with NTSC on command-line
[02:37:53] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[02:37:53] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[02:37:53] ================== drm_rect (9 subtests) ===================
[02:37:53] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[02:37:53] [PASSED] drm_test_rect_clip_scaled_not_clipped
[02:37:53] [PASSED] drm_test_rect_clip_scaled_clipped
[02:37:53] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[02:37:53] ================= drm_test_rect_intersect  =================
[02:37:53] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[02:37:53] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[02:37:53] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[02:37:53] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[02:37:53] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[02:37:53] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[02:37:53] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[02:37:53] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[02:37:53] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[02:37:53] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[02:37:53] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[02:37:53] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[02:37:53] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[02:37:53] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[02:37:53] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[02:37:53] ============= [PASSED] drm_test_rect_intersect =============
[02:37:53] ================ drm_test_rect_calc_hscale  ================
[02:37:53] [PASSED] normal use
[02:37:53] [PASSED] out of max range
[02:37:53] [PASSED] out of min range
[02:37:53] [PASSED] zero dst
[02:37:53] [PASSED] negative src
[02:37:53] [PASSED] negative dst
[02:37:53] ============ [PASSED] drm_test_rect_calc_hscale ============
[02:37:53] ================ drm_test_rect_calc_vscale  ================
[02:37:53] [PASSED] normal use
[02:37:53] [PASSED] out of max range
[02:37:53] [PASSED] out of min range
[02:37:53] [PASSED] zero dst
[02:37:53] [PASSED] negative src
[02:37:53] [PASSED] negative dst
[02:37:53] ============ [PASSED] drm_test_rect_calc_vscale ============
[02:37:53] ================== drm_test_rect_rotate  ===================
[02:37:53] [PASSED] reflect-x
[02:37:53] [PASSED] reflect-y
[02:37:53] [PASSED] rotate-0
[02:37:53] [PASSED] rotate-90
[02:37:53] [PASSED] rotate-180
[02:37:53] [PASSED] rotate-270
[02:37:53] ============== [PASSED] drm_test_rect_rotate ===============
[02:37:53] ================ drm_test_rect_rotate_inv  =================
[02:37:53] [PASSED] reflect-x
[02:37:53] [PASSED] reflect-y
[02:37:53] [PASSED] rotate-0
[02:37:53] [PASSED] rotate-90
[02:37:53] [PASSED] rotate-180
[02:37:53] [PASSED] rotate-270
[02:37:53] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[02:37:53] ==================== [PASSED] drm_rect =====================
[02:37:53] ============================================================
[02:37:53] Testing complete. Ran 608 tests: passed: 608
[02:37:53] Elapsed time: 23.276s total, 1.758s configuring, 21.346s building, 0.141s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[02:37:53] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:37:55] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[02:38:02] Starting KUnit Kernel (1/1)...
[02:38:02] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[02:38:03] ================= ttm_device (5 subtests) ==================
[02:38:03] [PASSED] ttm_device_init_basic
[02:38:03] [PASSED] ttm_device_init_multiple
[02:38:03] [PASSED] ttm_device_fini_basic
[02:38:03] [PASSED] ttm_device_init_no_vma_man
[02:38:03] ================== ttm_device_init_pools  ==================
[02:38:03] [PASSED] No DMA allocations, no DMA32 required
[02:38:03] [PASSED] DMA allocations, DMA32 required
[02:38:03] [PASSED] No DMA allocations, DMA32 required
[02:38:03] [PASSED] DMA allocations, no DMA32 required
[02:38:03] ============== [PASSED] ttm_device_init_pools ==============
[02:38:03] =================== [PASSED] ttm_device ====================
[02:38:03] ================== ttm_pool (8 subtests) ===================
[02:38:03] ================== ttm_pool_alloc_basic  ===================
[02:38:03] [PASSED] One page
[02:38:03] [PASSED] More than one page
[02:38:03] [PASSED] Above the allocation limit
[02:38:03] [PASSED] One page, with coherent DMA mappings enabled
[02:38:03] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[02:38:03] ============== [PASSED] ttm_pool_alloc_basic ===============
[02:38:03] ============== ttm_pool_alloc_basic_dma_addr  ==============
[02:38:03] [PASSED] One page
[02:38:03] [PASSED] More than one page
[02:38:03] [PASSED] Above the allocation limit
[02:38:03] [PASSED] One page, with coherent DMA mappings enabled
[02:38:03] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[02:38:03] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[02:38:03] [PASSED] ttm_pool_alloc_order_caching_match
[02:38:03] [PASSED] ttm_pool_alloc_caching_mismatch
[02:38:03] [PASSED] ttm_pool_alloc_order_mismatch
[02:38:03] [PASSED] ttm_pool_free_dma_alloc
[02:38:03] [PASSED] ttm_pool_free_no_dma_alloc
[02:38:03] [PASSED] ttm_pool_fini_basic
[02:38:03] ==================== [PASSED] ttm_pool =====================
[02:38:03] ================ ttm_resource (8 subtests) =================
[02:38:03] ================= ttm_resource_init_basic  =================
[02:38:03] [PASSED] Init resource in TTM_PL_SYSTEM
[02:38:03] [PASSED] Init resource in TTM_PL_VRAM
[02:38:03] [PASSED] Init resource in a private placement
[02:38:03] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[02:38:03] ============= [PASSED] ttm_resource_init_basic =============
[02:38:03] [PASSED] ttm_resource_init_pinned
[02:38:03] [PASSED] ttm_resource_fini_basic
[02:38:03] [PASSED] ttm_resource_manager_init_basic
[02:38:03] [PASSED] ttm_resource_manager_usage_basic
[02:38:03] [PASSED] ttm_resource_manager_set_used_basic
[02:38:03] [PASSED] ttm_sys_man_alloc_basic
[02:38:03] [PASSED] ttm_sys_man_free_basic
[02:38:03] ================== [PASSED] ttm_resource ===================
[02:38:03] =================== ttm_tt (15 subtests) ===================
[02:38:03] ==================== ttm_tt_init_basic  ====================
[02:38:03] [PASSED] Page-aligned size
[02:38:03] [PASSED] Extra pages requested
[02:38:03] ================ [PASSED] ttm_tt_init_basic ================
[02:38:03] [PASSED] ttm_tt_init_misaligned
[02:38:03] [PASSED] ttm_tt_fini_basic
[02:38:03] [PASSED] ttm_tt_fini_sg
[02:38:03] [PASSED] ttm_tt_fini_shmem
[02:38:03] [PASSED] ttm_tt_create_basic
[02:38:03] [PASSED] ttm_tt_create_invalid_bo_type
[02:38:03] [PASSED] ttm_tt_create_ttm_exists
[02:38:03] [PASSED] ttm_tt_create_failed
[02:38:03] [PASSED] ttm_tt_destroy_basic
[02:38:03] [PASSED] ttm_tt_populate_null_ttm
[02:38:03] [PASSED] ttm_tt_populate_populated_ttm
[02:38:03] [PASSED] ttm_tt_unpopulate_basic
[02:38:03] [PASSED] ttm_tt_unpopulate_empty_ttm
[02:38:03] [PASSED] ttm_tt_swapin_basic
[02:38:03] ===================== [PASSED] ttm_tt ======================
[02:38:03] =================== ttm_bo (14 subtests) ===================
[02:38:03] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[02:38:03] [PASSED] Cannot be interrupted and sleeps
[02:38:03] [PASSED] Cannot be interrupted, locks straight away
[02:38:03] [PASSED] Can be interrupted, sleeps
[02:38:03] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[02:38:03] [PASSED] ttm_bo_reserve_locked_no_sleep
[02:38:03] [PASSED] ttm_bo_reserve_no_wait_ticket
[02:38:03] [PASSED] ttm_bo_reserve_double_resv
[02:38:03] [PASSED] ttm_bo_reserve_interrupted
[02:38:03] [PASSED] ttm_bo_reserve_deadlock
[02:38:03] [PASSED] ttm_bo_unreserve_basic
[02:38:03] [PASSED] ttm_bo_unreserve_pinned
[02:38:03] [PASSED] ttm_bo_unreserve_bulk
[02:38:03] [PASSED] ttm_bo_put_basic
[02:38:03] [PASSED] ttm_bo_put_shared_resv
[02:38:03] [PASSED] ttm_bo_pin_basic
[02:38:03] [PASSED] ttm_bo_pin_unpin_resource
[02:38:03] [PASSED] ttm_bo_multiple_pin_one_unpin
[02:38:03] ===================== [PASSED] ttm_bo ======================
[02:38:03] ============== ttm_bo_validate (22 subtests) ===============
[02:38:03] ============== ttm_bo_init_reserved_sys_man  ===============
[02:38:03] [PASSED] Buffer object for userspace
[02:38:03] [PASSED] Kernel buffer object
[02:38:03] [PASSED] Shared buffer object
[02:38:03] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[02:38:03] ============== ttm_bo_init_reserved_mock_man  ==============
[02:38:03] [PASSED] Buffer object for userspace
[02:38:03] [PASSED] Kernel buffer object
[02:38:03] [PASSED] Shared buffer object
[02:38:03] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[02:38:03] [PASSED] ttm_bo_init_reserved_resv
[02:38:03] ================== ttm_bo_validate_basic  ==================
[02:38:03] [PASSED] Buffer object for userspace
[02:38:03] [PASSED] Kernel buffer object
[02:38:03] [PASSED] Shared buffer object
[02:38:03] ============== [PASSED] ttm_bo_validate_basic ==============
[02:38:03] [PASSED] ttm_bo_validate_invalid_placement
[02:38:03] ============= ttm_bo_validate_same_placement  ==============
[02:38:03] [PASSED] System manager
[02:38:03] [PASSED] VRAM manager
[02:38:03] ========= [PASSED] ttm_bo_validate_same_placement ==========
[02:38:03] [PASSED] ttm_bo_validate_failed_alloc
[02:38:03] [PASSED] ttm_bo_validate_pinned
[02:38:03] [PASSED] ttm_bo_validate_busy_placement
[02:38:03] ================ ttm_bo_validate_multihop  =================
[02:38:03] [PASSED] Buffer object for userspace
[02:38:03] [PASSED] Kernel buffer object
[02:38:03] [PASSED] Shared buffer object
[02:38:03] ============ [PASSED] ttm_bo_validate_multihop =============
[02:38:03] ========== ttm_bo_validate_no_placement_signaled  ==========
[02:38:03] [PASSED] Buffer object in system domain, no page vector
[02:38:03] [PASSED] Buffer object in system domain with an existing page vector
[02:38:03] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[02:38:03] ======== ttm_bo_validate_no_placement_not_signaled  ========
[02:38:03] [PASSED] Buffer object for userspace
[02:38:03] [PASSED] Kernel buffer object
[02:38:03] [PASSED] Shared buffer object
[02:38:03] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[02:38:03] [PASSED] ttm_bo_validate_move_fence_signaled
[02:38:03] ========= ttm_bo_validate_move_fence_not_signaled  =========
[02:38:03] [PASSED] Waits for GPU
[02:38:03] [PASSED] Tries to lock straight away
[02:38:03] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[02:38:03] [PASSED] ttm_bo_validate_swapout
[02:38:03] [PASSED] ttm_bo_validate_happy_evict
[02:38:03] [PASSED] ttm_bo_validate_all_pinned_evict
[02:38:03] [PASSED] ttm_bo_validate_allowed_only_evict
[02:38:03] [PASSED] ttm_bo_validate_deleted_evict
[02:38:03] [PASSED] ttm_bo_validate_busy_domain_evict
[02:38:03] [PASSED] ttm_bo_validate_evict_gutting
[02:38:03] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[02:38:03] ================= [PASSED] ttm_bo_validate =================
[02:38:03] ============================================================
[02:38:03] Testing complete. Ran 102 tests: passed: 102
[02:38:03] Elapsed time: 10.058s total, 1.731s configuring, 7.710s building, 0.525s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


