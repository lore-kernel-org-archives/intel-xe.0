Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F31C369C2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 16:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F16C10E2C8;
	Thu, 17 Apr 2025 16:27:47 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A3110E2C8;
 Thu, 17 Apr 2025 16:27:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/gsc=3A_test_new_GSC_104?=
 =?utf-8?q?=2E0=2E5=2E1429_for_LNL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Apr 2025 16:27:46 -0000
Message-ID: <174490726620.15598.182098572763065359@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250416233202.1303381-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250416233202.1303381-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe/gsc: test new GSC 104.0.5.1429 for LNL (rev2)
URL   : https://patchwork.freedesktop.org/series/147859/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[16:26:39] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:26:43] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[16:27:10] Starting KUnit Kernel (1/1)...
[16:27:10] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[16:27:10] ================== guc_buf (11 subtests) ===================
[16:27:10] [PASSED] test_smallest
[16:27:10] [PASSED] test_largest
[16:27:10] [PASSED] test_granular
[16:27:10] [PASSED] test_unique
[16:27:10] [PASSED] test_overlap
[16:27:10] [PASSED] test_reusable
[16:27:10] [PASSED] test_too_big
[16:27:10] [PASSED] test_flush
[16:27:10] [PASSED] test_lookup
[16:27:10] [PASSED] test_data
[16:27:10] [PASSED] test_class
[16:27:10] ===================== [PASSED] guc_buf =====================
[16:27:10] =================== guc_dbm (7 subtests) ===================
[16:27:10] [PASSED] test_empty
[16:27:10] [PASSED] test_default
[16:27:10] ======================== test_size  ========================
[16:27:10] [PASSED] 4
[16:27:10] [PASSED] 8
[16:27:10] [PASSED] 32
[16:27:10] [PASSED] 256
[16:27:10] ==================== [PASSED] test_size ====================
[16:27:10] ======================= test_reuse  ========================
[16:27:10] [PASSED] 4
[16:27:10] [PASSED] 8
[16:27:10] [PASSED] 32
[16:27:10] [PASSED] 256
[16:27:10] =================== [PASSED] test_reuse ====================
[16:27:10] =================== test_range_overlap  ====================
[16:27:10] [PASSED] 4
[16:27:10] [PASSED] 8
[16:27:10] [PASSED] 32
[16:27:10] [PASSED] 256
[16:27:10] =============== [PASSED] test_range_overlap ================
[16:27:10] =================== test_range_compact  ====================
[16:27:10] [PASSED] 4
[16:27:10] [PASSED] 8
[16:27:10] [PASSED] 32
[16:27:10] [PASSED] 256
[16:27:10] =============== [PASSED] test_range_compact ================
[16:27:10] ==================== test_range_spare  =====================
[16:27:10] [PASSED] 4
[16:27:10] [PASSED] 8
[16:27:10] [PASSED] 32
[16:27:10] [PASSED] 256
[16:27:10] ================ [PASSED] test_range_spare =================
[16:27:10] ===================== [PASSED] guc_dbm =====================
[16:27:10] =================== guc_idm (6 subtests) ===================
[16:27:10] [PASSED] bad_init
[16:27:10] [PASSED] no_init
[16:27:10] [PASSED] init_fini
[16:27:10] [PASSED] check_used
[16:27:10] [PASSED] check_quota
[16:27:10] [PASSED] check_all
[16:27:10] ===================== [PASSED] guc_idm =====================
[16:27:10] ================== no_relay (3 subtests) ===================
[16:27:10] [PASSED] xe_drops_guc2pf_if_not_ready
[16:27:10] [PASSED] xe_drops_guc2vf_if_not_ready
[16:27:10] [PASSED] xe_rejects_send_if_not_ready
[16:27:10] ==================== [PASSED] no_relay =====================
[16:27:10] ================== pf_relay (14 subtests) ==================
[16:27:10] [PASSED] pf_rejects_guc2pf_too_short
[16:27:10] [PASSED] pf_rejects_guc2pf_too_long
[16:27:10] [PASSED] pf_rejects_guc2pf_no_payload
[16:27:10] [PASSED] pf_fails_no_payload
[16:27:10] [PASSED] pf_fails_bad_origin
[16:27:10] [PASSED] pf_fails_bad_type
[16:27:10] [PASSED] pf_txn_reports_error
[16:27:10] [PASSED] pf_txn_sends_pf2guc
[16:27:10] [PASSED] pf_sends_pf2guc
[16:27:10] [SKIPPED] pf_loopback_nop
[16:27:10] [SKIPPED] pf_loopback_echo
[16:27:10] [SKIPPED] pf_loopback_fail
[16:27:10] [SKIPPED] pf_loopback_busy
[16:27:10] [SKIPPED] pf_loopback_retry
[16:27:10] ==================== [PASSED] pf_relay =====================
[16:27:10] ================== vf_relay (3 subtests) ===================
[16:27:10] [PASSED] vf_rejects_guc2vf_too_short
[16:27:10] [PASSED] vf_rejects_guc2vf_too_long
[16:27:10] [PASSED] vf_rejects_guc2vf_no_payload
[16:27:10] ==================== [PASSED] vf_relay =====================
[16:27:10] ================= pf_service (11 subtests) =================
[16:27:10] [PASSED] pf_negotiate_any
[16:27:10] [PASSED] pf_negotiate_base_match
[16:27:10] [PASSED] pf_negotiate_base_newer
[16:27:10] [PASSED] pf_negotiate_base_next
[16:27:10] [SKIPPED] pf_negotiate_base_older
[16:27:10] [PASSED] pf_negotiate_base_prev
[16:27:10] [PASSED] pf_negotiate_latest_match
[16:27:10] [PASSED] pf_negotiate_latest_newer
[16:27:10] [PASSED] pf_negotiate_latest_next
[16:27:10] [SKIPPED] pf_negotiate_latest_older
[16:27:10] [SKIPPED] pf_negotiate_latest_prev
[16:27:10] =================== [PASSED] pf_service ====================
[16:27:10] ===================== lmtt (1 subtest) =====================
[16:27:10] ======================== test_ops  =========================
[16:27:10] [PASSED] 2-level
[16:27:10] [PASSED] multi-level
[16:27:10] ==================== [PASSED] test_ops =====================
[16:27:10] ====================== [PASSED] lmtt =======================
[16:27:10] =================== xe_mocs (2 subtests) ===================
[16:27:10] ================ xe_live_mocs_kernel_kunit  ================
[16:27:10] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[16:27:10] ================ xe_live_mocs_reset_kunit  =================
[16:27:10] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[16:27:10] ==================== [SKIPPED] xe_mocs =====================
[16:27:10] ================= xe_migrate (2 subtests) ==================
[16:27:10] ================= xe_migrate_sanity_kunit  =================
[16:27:10] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[16:27:10] ================== xe_validate_ccs_kunit  ==================
[16:27:10] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[16:27:10] =================== [SKIPPED] xe_migrate ===================
[16:27:10] ================== xe_dma_buf (1 subtest) ==================
[16:27:10] ==================== xe_dma_buf_kunit  =====================
[16:27:10] ================ [SKIPPED] xe_dma_buf_kunit ================
[16:27:10] =================== [SKIPPED] xe_dma_buf ===================
[16:27:10] ================= xe_bo_shrink (1 subtest) =================
[16:27:10] =================== xe_bo_shrink_kunit  ====================
[16:27:10] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[16:27:10] ================== [SKIPPED] xe_bo_shrink ==================
[16:27:10] ==================== xe_bo (2 subtests) ====================
[16:27:10] ================== xe_ccs_migrate_kunit  ===================
[16:27:10] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[16:27:10] ==================== xe_bo_evict_kunit  ====================
[16:27:10] =============== [SKIPPED] xe_bo_evict_kunit ================
[16:27:10] ===================== [SKIPPED] xe_bo ======================
[16:27:10] ==================== args (11 subtests) ====================
[16:27:10] [PASSED] count_args_test
[16:27:10] [PASSED] call_args_example
[16:27:10] [PASSED] call_args_test
[16:27:10] [PASSED] drop_first_arg_example
[16:27:10] [PASSED] drop_first_arg_test
[16:27:10] [PASSED] first_arg_example
[16:27:10] [PASSED] first_arg_test
[16:27:10] [PASSED] last_arg_example
[16:27:10] [PASSED] last_arg_test
[16:27:10] [PASSED] pick_arg_example
[16:27:10] [PASSED] sep_comma_example
[16:27:10] ====================== [PASSED] args =======================
[16:27:10] =================== xe_pci (2 subtests) ====================
[16:27:10] [PASSED] xe_gmdid_graphics_ip
[16:27:10] [PASSED] xe_gmdid_media_ip
[16:27:10] ===================== [PASSED] xe_pci ======================
[16:27:10] =================== xe_rtp (2 subtests) ====================
[16:27:10] =============== xe_rtp_process_to_sr_tests  ================
[16:27:10] [PASSED] coalesce-same-reg
[16:27:10] [PASSED] no-match-no-add
[16:27:10] [PASSED] match-or
[16:27:10] [PASSED] match-or-xfail
[16:27:10] [PASSED] no-match-no-add-multiple-rules
[16:27:10] [PASSED] two-regs-two-entries
[16:27:10] [PASSED] clr-one-set-other
[16:27:10] [PASSED] set-field
[16:27:10] [PASSED] conflict-duplicate
[16:27:10] [PASSED] conflict-not-disjoint
stty: 'standard input': Inappropriate ioctl for device
[16:27:10] [PASSED] conflict-reg-type
[16:27:10] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[16:27:10] ================== xe_rtp_process_tests  ===================
[16:27:10] [PASSED] active1
[16:27:10] [PASSED] active2
[16:27:10] [PASSED] active-inactive
[16:27:10] [PASSED] inactive-active
[16:27:10] [PASSED] inactive-1st_or_active-inactive
[16:27:10] [PASSED] inactive-2nd_or_active-inactive
[16:27:10] [PASSED] inactive-last_or_active-inactive
[16:27:10] [PASSED] inactive-no_or_active-inactive
[16:27:10] ============== [PASSED] xe_rtp_process_tests ===============
[16:27:10] ===================== [PASSED] xe_rtp ======================
[16:27:10] ==================== xe_wa (1 subtest) =====================
[16:27:10] ======================== xe_wa_gt  =========================
[16:27:10] [PASSED] TIGERLAKE (B0)
[16:27:10] [PASSED] DG1 (A0)
[16:27:10] [PASSED] DG1 (B0)
[16:27:10] [PASSED] ALDERLAKE_S (A0)
[16:27:10] [PASSED] ALDERLAKE_S (B0)
[16:27:10] [PASSED] ALDERLAKE_S (C0)
[16:27:10] [PASSED] ALDERLAKE_S (D0)
[16:27:10] [PASSED] ALDERLAKE_P (A0)
[16:27:10] [PASSED] ALDERLAKE_P (B0)
[16:27:10] [PASSED] ALDERLAKE_P (C0)
[16:27:10] [PASSED] ALDERLAKE_S_RPLS (D0)
[16:27:10] [PASSED] ALDERLAKE_P_RPLU (E0)
[16:27:10] [PASSED] DG2_G10 (C0)
[16:27:10] [PASSED] DG2_G11 (B1)
[16:27:10] [PASSED] DG2_G12 (A1)
[16:27:10] [PASSED] METEORLAKE (g:A0, m:A0)
[16:27:10] [PASSED] METEORLAKE (g:A0, m:A0)
[16:27:10] [PASSED] METEORLAKE (g:A0, m:A0)
[16:27:10] [PASSED] LUNARLAKE (g:A0, m:A0)
[16:27:10] [PASSED] LUNARLAKE (g:B0, m:A0)
[16:27:10] [PASSED] BATTLEMAGE (g:A0, m:A1)
[16:27:10] ==================== [PASSED] xe_wa_gt =====================
[16:27:10] ====================== [PASSED] xe_wa ======================
[16:27:10] ============================================================
[16:27:10] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[16:27:10] Elapsed time: 30.877s total, 4.234s configuring, 26.326s building, 0.294s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[16:27:10] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:27:12] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[16:27:33] Starting KUnit Kernel (1/1)...
[16:27:33] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[16:27:33] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[16:27:33] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[16:27:33] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[16:27:33] =========== drm_validate_clone_mode (2 subtests) ===========
[16:27:33] ============== drm_test_check_in_clone_mode  ===============
[16:27:33] [PASSED] in_clone_mode
[16:27:33] [PASSED] not_in_clone_mode
[16:27:33] ========== [PASSED] drm_test_check_in_clone_mode ===========
[16:27:33] =============== drm_test_check_valid_clones  ===============
[16:27:33] [PASSED] not_in_clone_mode
[16:27:33] [PASSED] valid_clone
[16:27:33] [PASSED] invalid_clone
[16:27:33] =========== [PASSED] drm_test_check_valid_clones ===========
[16:27:33] ============= [PASSED] drm_validate_clone_mode =============
[16:27:33] ============= drm_validate_modeset (1 subtest) =============
[16:27:33] [PASSED] drm_test_check_connector_changed_modeset
[16:27:33] ============== [PASSED] drm_validate_modeset ===============
[16:27:33] ====== drm_test_bridge_get_current_state (2 subtests) ======
[16:27:33] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[16:27:33] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[16:27:33] ======== [PASSED] drm_test_bridge_get_current_state ========
[16:27:33] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[16:27:33] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[16:27:33] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[16:27:33] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[16:27:33] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[16:27:33] ================== drm_buddy (7 subtests) ==================
[16:27:33] [PASSED] drm_test_buddy_alloc_limit
[16:27:33] [PASSED] drm_test_buddy_alloc_optimistic
[16:27:33] [PASSED] drm_test_buddy_alloc_pessimistic
[16:27:33] [PASSED] drm_test_buddy_alloc_pathological
[16:27:33] [PASSED] drm_test_buddy_alloc_contiguous
[16:27:33] [PASSED] drm_test_buddy_alloc_clear
[16:27:33] [PASSED] drm_test_buddy_alloc_range_bias
[16:27:33] ==================== [PASSED] drm_buddy ====================
[16:27:33] ============= drm_cmdline_parser (40 subtests) =============
[16:27:33] [PASSED] drm_test_cmdline_force_d_only
[16:27:33] [PASSED] drm_test_cmdline_force_D_only_dvi
[16:27:33] [PASSED] drm_test_cmdline_force_D_only_hdmi
[16:27:33] [PASSED] drm_test_cmdline_force_D_only_not_digital
[16:27:33] [PASSED] drm_test_cmdline_force_e_only
[16:27:33] [PASSED] drm_test_cmdline_res
[16:27:33] [PASSED] drm_test_cmdline_res_vesa
[16:27:33] [PASSED] drm_test_cmdline_res_vesa_rblank
[16:27:33] [PASSED] drm_test_cmdline_res_rblank
[16:27:33] [PASSED] drm_test_cmdline_res_bpp
[16:27:33] [PASSED] drm_test_cmdline_res_refresh
[16:27:33] [PASSED] drm_test_cmdline_res_bpp_refresh
[16:27:33] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[16:27:33] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[16:27:33] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[16:27:33] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[16:27:33] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[16:27:33] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[16:27:33] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[16:27:33] [PASSED] drm_test_cmdline_res_margins_force_on
[16:27:33] [PASSED] drm_test_cmdline_res_vesa_margins
[16:27:33] [PASSED] drm_test_cmdline_name
[16:27:33] [PASSED] drm_test_cmdline_name_bpp
[16:27:33] [PASSED] drm_test_cmdline_name_option
[16:27:33] [PASSED] drm_test_cmdline_name_bpp_option
[16:27:33] [PASSED] drm_test_cmdline_rotate_0
[16:27:33] [PASSED] drm_test_cmdline_rotate_90
[16:27:33] [PASSED] drm_test_cmdline_rotate_180
[16:27:33] [PASSED] drm_test_cmdline_rotate_270
[16:27:33] [PASSED] drm_test_cmdline_hmirror
[16:27:33] [PASSED] drm_test_cmdline_vmirror
[16:27:33] [PASSED] drm_test_cmdline_margin_options
[16:27:33] [PASSED] drm_test_cmdline_multiple_options
[16:27:33] [PASSED] drm_test_cmdline_bpp_extra_and_option
[16:27:33] [PASSED] drm_test_cmdline_extra_and_option
[16:27:33] [PASSED] drm_test_cmdline_freestanding_options
[16:27:33] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[16:27:33] [PASSED] drm_test_cmdline_panel_orientation
[16:27:33] ================ drm_test_cmdline_invalid  =================
[16:27:33] [PASSED] margin_only
[16:27:33] [PASSED] interlace_only
[16:27:33] [PASSED] res_missing_x
[16:27:33] [PASSED] res_missing_y
[16:27:33] [PASSED] res_bad_y
[16:27:33] [PASSED] res_missing_y_bpp
[16:27:33] [PASSED] res_bad_bpp
[16:27:33] [PASSED] res_bad_refresh
[16:27:33] [PASSED] res_bpp_refresh_force_on_off
[16:27:33] [PASSED] res_invalid_mode
[16:27:33] [PASSED] res_bpp_wrong_place_mode
[16:27:33] [PASSED] name_bpp_refresh
[16:27:33] [PASSED] name_refresh
[16:27:33] [PASSED] name_refresh_wrong_mode
[16:27:33] [PASSED] name_refresh_invalid_mode
[16:27:33] [PASSED] rotate_multiple
[16:27:33] [PASSED] rotate_invalid_val
[16:27:33] [PASSED] rotate_truncated
[16:27:33] [PASSED] invalid_option
[16:27:33] [PASSED] invalid_tv_option
[16:27:33] [PASSED] truncated_tv_option
[16:27:33] ============ [PASSED] drm_test_cmdline_invalid =============
[16:27:33] =============== drm_test_cmdline_tv_options  ===============
[16:27:33] [PASSED] NTSC
[16:27:33] [PASSED] NTSC_443
[16:27:33] [PASSED] NTSC_J
[16:27:33] [PASSED] PAL
[16:27:33] [PASSED] PAL_M
[16:27:33] [PASSED] PAL_N
[16:27:33] [PASSED] SECAM
[16:27:33] [PASSED] MONO_525
[16:27:33] [PASSED] MONO_625
[16:27:33] =========== [PASSED] drm_test_cmdline_tv_options ===========
[16:27:33] =============== [PASSED] drm_cmdline_parser ================
[16:27:33] ========== drmm_connector_hdmi_init (20 subtests) ==========
[16:27:33] [PASSED] drm_test_connector_hdmi_init_valid
[16:27:33] [PASSED] drm_test_connector_hdmi_init_bpc_8
[16:27:33] [PASSED] drm_test_connector_hdmi_init_bpc_10
[16:27:33] [PASSED] drm_test_connector_hdmi_init_bpc_12
[16:27:33] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[16:27:33] [PASSED] drm_test_connector_hdmi_init_bpc_null
[16:27:33] [PASSED] drm_test_connector_hdmi_init_formats_empty
[16:27:33] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[16:27:33] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[16:27:33] [PASSED] supported_formats=0x9 yuv420_allowed=1
[16:27:33] [PASSED] supported_formats=0x9 yuv420_allowed=0
[16:27:33] [PASSED] supported_formats=0x3 yuv420_allowed=1
[16:27:33] [PASSED] supported_formats=0x3 yuv420_allowed=0
[16:27:33] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[16:27:33] [PASSED] drm_test_connector_hdmi_init_null_ddc
[16:27:33] [PASSED] drm_test_connector_hdmi_init_null_product
[16:27:33] [PASSED] drm_test_connector_hdmi_init_null_vendor
[16:27:33] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[16:27:33] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[16:27:33] [PASSED] drm_test_connector_hdmi_init_product_valid
[16:27:33] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[16:27:33] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[16:27:33] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[16:27:33] ========= drm_test_connector_hdmi_init_type_valid  =========
[16:27:33] [PASSED] HDMI-A
[16:27:33] [PASSED] HDMI-B
[16:27:33] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[16:27:33] ======== drm_test_connector_hdmi_init_type_invalid  ========
[16:27:33] [PASSED] Unknown
[16:27:33] [PASSED] VGA
[16:27:33] [PASSED] DVI-I
[16:27:33] [PASSED] DVI-D
[16:27:33] [PASSED] DVI-A
[16:27:33] [PASSED] Composite
[16:27:33] [PASSED] SVIDEO
[16:27:33] [PASSED] LVDS
[16:27:33] [PASSED] Component
[16:27:33] [PASSED] DIN
[16:27:33] [PASSED] DP
[16:27:33] [PASSED] TV
[16:27:33] [PASSED] eDP
[16:27:33] [PASSED] Virtual
[16:27:33] [PASSED] DSI
[16:27:33] [PASSED] DPI
[16:27:33] [PASSED] Writeback
[16:27:33] [PASSED] SPI
[16:27:33] [PASSED] USB
[16:27:33] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[16:27:33] ============ [PASSED] drmm_connector_hdmi_init =============
[16:27:33] ============= drmm_connector_init (3 subtests) =============
[16:27:33] [PASSED] drm_test_drmm_connector_init
[16:27:33] [PASSED] drm_test_drmm_connector_init_null_ddc
[16:27:33] ========= drm_test_drmm_connector_init_type_valid  =========
[16:27:33] [PASSED] Unknown
[16:27:33] [PASSED] VGA
[16:27:33] [PASSED] DVI-I
[16:27:33] [PASSED] DVI-D
[16:27:33] [PASSED] DVI-A
[16:27:33] [PASSED] Composite
[16:27:33] [PASSED] SVIDEO
[16:27:33] [PASSED] LVDS
[16:27:33] [PASSED] Component
[16:27:33] [PASSED] DIN
[16:27:33] [PASSED] DP
[16:27:33] [PASSED] HDMI-A
[16:27:33] [PASSED] HDMI-B
[16:27:33] [PASSED] TV
[16:27:33] [PASSED] eDP
[16:27:33] [PASSED] Virtual
[16:27:33] [PASSED] DSI
[16:27:33] [PASSED] DPI
[16:27:33] [PASSED] Writeback
[16:27:33] [PASSED] SPI
[16:27:33] [PASSED] USB
[16:27:33] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[16:27:33] =============== [PASSED] drmm_connector_init ===============
[16:27:33] ========= drm_connector_dynamic_init (6 subtests) ==========
[16:27:33] [PASSED] drm_test_drm_connector_dynamic_init
[16:27:33] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[16:27:33] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[16:27:33] [PASSED] drm_test_drm_connector_dynamic_init_properties
[16:27:33] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[16:27:33] [PASSED] Unknown
[16:27:33] [PASSED] VGA
[16:27:33] [PASSED] DVI-I
[16:27:33] [PASSED] DVI-D
[16:27:33] [PASSED] DVI-A
[16:27:33] [PASSED] Composite
[16:27:33] [PASSED] SVIDEO
[16:27:33] [PASSED] LVDS
[16:27:33] [PASSED] Component
[16:27:33] [PASSED] DIN
[16:27:33] [PASSED] DP
[16:27:33] [PASSED] HDMI-A
[16:27:33] [PASSED] HDMI-B
[16:27:33] [PASSED] TV
[16:27:33] [PASSED] eDP
[16:27:33] [PASSED] Virtual
[16:27:33] [PASSED] DSI
[16:27:33] [PASSED] DPI
[16:27:33] [PASSED] Writeback
[16:27:33] [PASSED] SPI
[16:27:33] [PASSED] USB
[16:27:33] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[16:27:33] ======== drm_test_drm_connector_dynamic_init_name  =========
[16:27:33] [PASSED] Unknown
[16:27:33] [PASSED] VGA
[16:27:33] [PASSED] DVI-I
[16:27:33] [PASSED] DVI-D
[16:27:33] [PASSED] DVI-A
[16:27:33] [PASSED] Composite
[16:27:33] [PASSED] SVIDEO
[16:27:33] [PASSED] LVDS
[16:27:33] [PASSED] Component
[16:27:33] [PASSED] DIN
[16:27:33] [PASSED] DP
[16:27:33] [PASSED] HDMI-A
[16:27:33] [PASSED] HDMI-B
[16:27:33] [PASSED] TV
[16:27:33] [PASSED] eDP
[16:27:33] [PASSED] Virtual
[16:27:33] [PASSED] DSI
[16:27:33] [PASSED] DPI
[16:27:33] [PASSED] Writeback
[16:27:33] [PASSED] SPI
[16:27:33] [PASSED] USB
[16:27:33] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[16:27:33] =========== [PASSED] drm_connector_dynamic_init ============
[16:27:33] ==== drm_connector_dynamic_register_early (4 subtests) =====
[16:27:33] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[16:27:33] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[16:27:33] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[16:27:33] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[16:27:33] ====== [PASSED] drm_connector_dynamic_register_early =======
[16:27:33] ======= drm_connector_dynamic_register (7 subtests) ========
[16:27:33] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[16:27:33] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[16:27:33] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[16:27:33] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[16:27:33] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[16:27:33] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[16:27:33] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[16:27:33] ========= [PASSED] drm_connector_dynamic_register ==========
[16:27:33] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[16:27:33] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[16:27:33] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[16:27:33] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[16:27:33] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[16:27:33] ========== drm_test_get_tv_mode_from_name_valid  ===========
[16:27:33] [PASSED] NTSC
[16:27:33] [PASSED] NTSC-443
[16:27:33] [PASSED] NTSC-J
[16:27:33] [PASSED] PAL
[16:27:33] [PASSED] PAL-M
[16:27:33] [PASSED] PAL-N
[16:27:33] [PASSED] SECAM
[16:27:33] [PASSED] Mono
[16:27:33] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[16:27:33] [PASSED] drm_test_get_tv_mode_from_name_truncated
[16:27:33] ============ [PASSED] drm_get_tv_mode_from_name ============
[16:27:33] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[16:27:33] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[16:27:33] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[16:27:33] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[16:27:33] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[16:27:33] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[16:27:33] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[16:27:33] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[16:27:33] [PASSED] VIC 96
[16:27:33] [PASSED] VIC 97
[16:27:33] [PASSED] VIC 101
[16:27:33] [PASSED] VIC 102
[16:27:33] [PASSED] VIC 106
[16:27:33] [PASSED] VIC 107
[16:27:33] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[16:27:33] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[16:27:33] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[16:27:33] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[16:27:33] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[16:27:33] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[16:27:33] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[16:27:33] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[16:27:33] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[16:27:33] [PASSED] Automatic
[16:27:33] [PASSED] Full
[16:27:33] [PASSED] Limited 16:235
[16:27:33] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[16:27:33] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[16:27:33] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[16:27:33] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[16:27:33] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[16:27:33] [PASSED] RGB
[16:27:33] [PASSED] YUV 4:2:0
[16:27:33] [PASSED] YUV 4:2:2
[16:27:33] [PASSED] YUV 4:4:4
[16:27:33] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[16:27:33] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[16:27:33] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[16:27:33] ============= drm_damage_helper (21 subtests) ==============
[16:27:33] [PASSED] drm_test_damage_iter_no_damage
[16:27:33] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[16:27:33] [PASSED] drm_test_damage_iter_no_damage_src_moved
[16:27:33] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[16:27:33] [PASSED] drm_test_damage_iter_no_damage_not_visible
[16:27:33] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[16:27:33] [PASSED] drm_test_damage_iter_no_damage_no_fb
[16:27:33] [PASSED] drm_test_damage_iter_simple_damage
[16:27:33] [PASSED] drm_test_damage_iter_single_damage
[16:27:33] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[16:27:33] [PASSED] drm_test_damage_iter_single_damage_outside_src
[16:27:33] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[16:27:33] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[16:27:33] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[16:27:33] [PASSED] drm_test_damage_iter_single_damage_src_moved
[16:27:33] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[16:27:33] [PASSED] drm_test_damage_iter_damage
[16:27:33] [PASSED] drm_test_damage_iter_damage_one_intersect
[16:27:33] [PASSED] drm_test_damage_iter_damage_one_outside
[16:27:33] [PASSED] drm_test_damage_iter_damage_src_moved
[16:27:33] [PASSED] drm_test_damage_iter_damage_not_visible
[16:27:33] ================ [PASSED] drm_damage_helper ================
[16:27:33] ============== drm_dp_mst_helper (3 subtests) ==============
[16:27:33] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[16:27:33] [PASSED] Clock 154000 BPP 30 DSC disabled
[16:27:33] [PASSED] Clock 234000 BPP 30 DSC disabled
[16:27:33] [PASSED] Clock 297000 BPP 24 DSC disabled
[16:27:33] [PASSED] Clock 332880 BPP 24 DSC enabled
[16:27:33] [PASSED] Clock 324540 BPP 24 DSC enabled
[16:27:33] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[16:27:33] ============== drm_test_dp_mst_calc_pbn_div  ===============
[16:27:33] [PASSED] Link rate 2000000 lane count 4
[16:27:33] [PASSED] Link rate 2000000 lane count 2
[16:27:33] [PASSED] Link rate 2000000 lane count 1
[16:27:33] [PASSED] Link rate 1350000 lane count 4
[16:27:33] [PASSED] Link rate 1350000 lane count 2
[16:27:33] [PASSED] Link rate 1350000 lane count 1
[16:27:33] [PASSED] Link rate 1000000 lane count 4
[16:27:33] [PASSED] Link rate 1000000 lane count 2
[16:27:33] [PASSED] Link rate 1000000 lane count 1
[16:27:33] [PASSED] Link rate 810000 lane count 4
[16:27:33] [PASSED] Link rate 810000 lane count 2
[16:27:33] [PASSED] Link rate 810000 lane count 1
[16:27:33] [PASSED] Link rate 540000 lane count 4
[16:27:33] [PASSED] Link rate 540000 lane count 2
[16:27:33] [PASSED] Link rate 540000 lane count 1
[16:27:33] [PASSED] Link rate 270000 lane count 4
[16:27:33] [PASSED] Link rate 270000 lane count 2
[16:27:33] [PASSED] Link rate 270000 lane count 1
[16:27:33] [PASSED] Link rate 162000 lane count 4
[16:27:33] [PASSED] Link rate 162000 lane count 2
[16:27:33] [PASSED] Link rate 162000 lane count 1
[16:27:33] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[16:27:33] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[16:27:33] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[16:27:33] [PASSED] DP_POWER_UP_PHY with port number
[16:27:33] [PASSED] DP_POWER_DOWN_PHY with port number
[16:27:33] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[16:27:33] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[16:27:33] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[16:27:33] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[16:27:33] [PASSED] DP_QUERY_PAYLOAD with port number
[16:27:33] [PASSED] DP_QUERY_PAYLOAD with VCPI
[16:27:33] [PASSED] DP_REMOTE_DPCD_READ with port number
[16:27:33] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[16:27:33] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[16:27:33] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[16:27:33] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[16:27:33] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[16:27:33] [PASSED] DP_REMOTE_I2C_READ with port number
[16:27:33] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[16:27:33] [PASSED] DP_REMOTE_I2C_READ with transactions array
[16:27:33] [PASSED] DP_REMOTE_I2C_WRITE with port number
[16:27:33] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[16:27:33] [PASSED] DP_REMOTE_I2C_WRITE with data array
[16:27:33] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[16:27:33] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[16:27:33] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[16:27:33] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[16:27:33] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[16:27:33] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[16:27:33] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[16:27:33] ================ [PASSED] drm_dp_mst_helper ================
[16:27:33] ================== drm_exec (7 subtests) ===================
[16:27:33] [PASSED] sanitycheck
[16:27:33] [PASSED] test_lock
[16:27:33] [PASSED] test_lock_unlock
[16:27:33] [PASSED] test_duplicates
[16:27:33] [PASSED] test_prepare
[16:27:33] [PASSED] test_prepare_array
[16:27:33] [PASSED] test_multiple_loops
[16:27:33] ==================== [PASSED] drm_exec =====================
[16:27:33] =========== drm_format_helper_test (18 subtests) ===========
[16:27:33] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[16:27:33] [PASSED] single_pixel_source_buffer
[16:27:33] [PASSED] single_pixel_clip_rectangle
[16:27:33] [PASSED] well_known_colors
[16:27:33] [PASSED] destination_pitch
[16:27:33] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[16:27:33] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[16:27:33] [PASSED] single_pixel_source_buffer
[16:27:33] [PASSED] single_pixel_clip_rectangle
[16:27:33] [PASSED] well_known_colors
[16:27:33] [PASSED] destination_pitch
[16:27:33] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[16:27:33] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[16:27:33] [PASSED] single_pixel_source_buffer
[16:27:33] [PASSED] single_pixel_clip_rectangle
[16:27:33] [PASSED] well_known_colors
[16:27:33] [PASSED] destination_pitch
[16:27:33] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[16:27:33] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[16:27:33] [PASSED] single_pixel_source_buffer
[16:27:33] [PASSED] single_pixel_clip_rectangle
[16:27:33] [PASSED] well_known_colors
[16:27:33] [PASSED] destination_pitch
[16:27:33] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[16:27:33] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[16:27:33] [PASSED] single_pixel_source_buffer
[16:27:33] [PASSED] single_pixel_clip_rectangle
[16:27:33] [PASSED] well_known_colors
[16:27:33] [PASSED] destination_pitch
[16:27:33] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[16:27:33] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[16:27:33] [PASSED] single_pixel_source_buffer
[16:27:33] [PASSED] single_pixel_clip_rectangle
[16:27:33] [PASSED] well_known_colors
[16:27:33] [PASSED] destination_pitch
[16:27:33] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[16:27:33] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[16:27:33] [PASSED] single_pixel_source_buffer
[16:27:33] [PASSED] single_pixel_clip_rectangle
[16:27:33] [PASSED] well_known_colors
[16:27:33] [PASSED] destination_pitch
[16:27:33] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[16:27:33] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[16:27:33] [PASSED] single_pixel_source_buffer
[16:27:33] [PASSED] single_pixel_clip_rectangle
[16:27:33] [PASSED] well_known_colors
[16:27:33] [PASSED] destination_pitch
[16:27:33] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[16:27:33] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[16:27:33] [PASSED] single_pixel_source_buffer
[16:27:33] [PASSED] single_pixel_clip_rectangle
[16:27:33] [PASSED] well_known_colors
[16:27:33] [PASSED] destination_pitch
[16:27:33] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[16:27:33] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[16:27:33] [PASSED] single_pixel_source_buffer
[16:27:33] [PASSED] single_pixel_clip_rectangle
[16:27:33] [PASSED] well_known_colors
[16:27:33] [PASSED] destination_pitch
[16:27:33] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[16:27:33] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[16:27:33] [PASSED] single_pixel_source_buffer
[16:27:33] [PASSED] single_pixel_clip_rectangle
[16:27:33] [PASSED] well_known_colors
[16:27:33] [PASSED] destination_pitch
[16:27:33] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[16:27:33] ============== drm_test_fb_xrgb8888_to_mono  ===============
[16:27:33] [PASSED] single_pixel_source_buffer
[16:27:33] [PASSED] single_pixel_clip_rectangle
[16:27:33] [PASSED] well_known_colors
[16:27:33] [PASSED] destination_pitch
[16:27:33] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[16:27:33] ==================== drm_test_fb_swab  =====================
[16:27:33] [PASSED] single_pixel_source_buffer
[16:27:33] [PASSED] single_pixel_clip_rectangle
[16:27:33] [PASSED] well_known_colors
[16:27:33] [PASSED] destination_pitch
[16:27:33] ================ [PASSED] drm_test_fb_swab =================
[16:27:33] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[16:27:33] [PASSED] single_pixel_source_buffer
[16:27:33] [PASSED] single_pixel_clip_rectangle
[16:27:33] [PASSED] well_known_colors
[16:27:33] [PASSED] destination_pitch
[16:27:33] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[16:27:33] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[16:27:33] [PASSED] single_pixel_source_buffer
[16:27:33] [PASSED] single_pixel_clip_rectangle
[16:27:33] [PASSED] well_known_colors
[16:27:33] [PASSED] destination_pitch
[16:27:33] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[16:27:33] ================= drm_test_fb_clip_offset  =================
[16:27:33] [PASSED] pass through
[16:27:33] [PASSED] horizontal offset
[16:27:33] [PASSED] vertical offset
[16:27:33] [PASSED] horizontal and vertical offset
[16:27:33] [PASSED] horizontal offset (custom pitch)
[16:27:33] [PASSED] vertical offset (custom pitch)
[16:27:33] [PASSED] horizontal and vertical offset (custom pitch)
[16:27:33] ============= [PASSED] drm_test_fb_clip_offset =============
[16:27:33] ============== drm_test_fb_build_fourcc_list  ==============
[16:27:33] [PASSED] no native formats
[16:27:33] [PASSED] XRGB8888 as native format
[16:27:33] [PASSED] remove duplicates
[16:27:33] [PASSED] convert alpha formats
[16:27:33] [PASSED] random formats
[16:27:33] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[16:27:33] =================== drm_test_fb_memcpy  ====================
[16:27:33] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[16:27:33] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[16:27:33] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[16:27:33] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[16:27:33] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[16:27:33] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[16:27:33] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[16:27:33] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[16:27:33] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[16:27:33] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[16:27:33] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[16:27:33] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[16:27:33] =============== [PASSED] drm_test_fb_memcpy ================
[16:27:33] ============= [PASSED] drm_format_helper_test ==============
[16:27:33] ================= drm_format (18 subtests) =================
[16:27:33] [PASSED] drm_test_format_block_width_invalid
[16:27:33] [PASSED] drm_test_format_block_width_one_plane
[16:27:33] [PASSED] drm_test_format_block_width_two_plane
[16:27:33] [PASSED] drm_test_format_block_width_three_plane
[16:27:33] [PASSED] drm_test_format_block_width_tiled
[16:27:33] [PASSED] drm_test_format_block_height_invalid
[16:27:33] [PASSED] drm_test_format_block_height_one_plane
[16:27:33] [PASSED] drm_test_format_block_height_two_plane
[16:27:33] [PASSED] drm_test_format_block_height_three_plane
[16:27:33] [PASSED] drm_test_format_block_height_tiled
[16:27:33] [PASSED] drm_test_format_min_pitch_invalid
[16:27:33] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[16:27:33] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[16:27:33] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[16:27:33] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[16:27:33] [PASSED] drm_test_format_min_pitch_two_plane
[16:27:33] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[16:27:33] [PASSED] drm_test_format_min_pitch_tiled
[16:27:33] =================== [PASSED] drm_format ====================
[16:27:33] ============== drm_framebuffer (10 subtests) ===============
[16:27:33] ========== drm_test_framebuffer_check_src_coords  ==========
[16:27:33] [PASSED] Success: source fits into fb
[16:27:33] [PASSED] Fail: overflowing fb with x-axis coordinate
[16:27:33] [PASSED] Fail: overflowing fb with y-axis coordinate
[16:27:33] [PASSED] Fail: overflowing fb with source width
[16:27:33] [PASSED] Fail: overflowing fb with source height
[16:27:33] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[16:27:33] [PASSED] drm_test_framebuffer_cleanup
[16:27:33] =============== drm_test_framebuffer_create  ===============
[16:27:33] [PASSED] ABGR8888 normal sizes
[16:27:33] [PASSED] ABGR8888 max sizes
[16:27:33] [PASSED] ABGR8888 pitch greater than min required
[16:27:33] [PASSED] ABGR8888 pitch less than min required
[16:27:33] [PASSED] ABGR8888 Invalid width
[16:27:33] [PASSED] ABGR8888 Invalid buffer handle
[16:27:33] [PASSED] No pixel format
[16:27:33] [PASSED] ABGR8888 Width 0
[16:27:33] [PASSED] ABGR8888 Height 0
[16:27:33] [PASSED] ABGR8888 Out of bound height * pitch combination
[16:27:33] [PASSED] ABGR8888 Large buffer offset
[16:27:33] [PASSED] ABGR8888 Buffer offset for inexistent plane
[16:27:33] [PASSED] ABGR8888 Invalid flag
[16:27:33] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[16:27:33] [PASSED] ABGR8888 Valid buffer modifier
[16:27:33] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[16:27:33] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[16:27:33] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[16:27:33] [PASSED] NV12 Normal sizes
[16:27:33] [PASSED] NV12 Max sizes
[16:27:33] [PASSED] NV12 Invalid pitch
[16:27:33] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[16:27:33] [PASSED] NV12 different  modifier per-plane
[16:27:33] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[16:27:33] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[16:27:33] [PASSED] NV12 Modifier for inexistent plane
[16:27:33] [PASSED] NV12 Handle for inexistent plane
[16:27:33] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[16:27:33] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[16:27:33] [PASSED] YVU420 Normal sizes
[16:27:33] [PASSED] YVU420 Max sizes
[16:27:33] [PASSED] YVU420 Invalid pitch
[16:27:33] [PASSED] YVU420 Different pitches
[16:27:33] [PASSED] YVU420 Different buffer offsets/pitches
[16:27:33] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[16:27:33] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[16:27:33] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[16:27:33] [PASSED] YVU420 Valid modifier
[16:27:33] [PASSED] YVU420 Different modifiers per plane
[16:27:33] [PASSED] YVU420 Modifier for inexistent plane
[16:27:33] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[16:27:33] [PASSED] X0L2 Normal sizes
[16:27:33] [PASSED] X0L2 Max sizes
[16:27:33] [PASSED] X0L2 Invalid pitch
[16:27:33] [PASSED] X0L2 Pitch greater than minimum required
[16:27:33] [PASSED] X0L2 Handle for inexistent plane
[16:27:33] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[16:27:33] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[16:27:33] [PASSED] X0L2 Valid modifier
[16:27:33] [PASSED] X0L2 Modifier for inexistent plane
[16:27:33] =========== [PASSED] drm_test_framebuffer_create ===========
[16:27:33] [PASSED] drm_test_framebuffer_free
[16:27:33] [PASSED] drm_test_framebuffer_init
[16:27:33] [PASSED] drm_test_framebuffer_init_bad_format
[16:27:33] [PASSED] drm_test_framebuffer_init_dev_mismatch
[16:27:33] [PASSED] drm_test_framebuffer_lookup
[16:27:33] [PASSED] drm_test_framebuffer_lookup_inexistent
[16:27:33] [PASSED] drm_test_framebuffer_modifiers_not_supported
[16:27:33] ================= [PASSED] drm_framebuffer =================
[16:27:33] ================ drm_gem_shmem (8 subtests) ================
[16:27:33] [PASSED] drm_gem_shmem_test_obj_create
[16:27:33] [PASSED] drm_gem_shmem_test_obj_create_private
[16:27:33] [PASSED] drm_gem_shmem_test_pin_pages
[16:27:33] [PASSED] drm_gem_shmem_test_vmap
[16:27:33] [PASSED] drm_gem_shmem_test_get_pages_sgt
[16:27:33] [PASSED] drm_gem_shmem_test_get_sg_table
[16:27:33] [PASSED] drm_gem_shmem_test_madvise
[16:27:33] [PASSED] drm_gem_shmem_test_purge
[16:27:33] ================== [PASSED] drm_gem_shmem ==================
[16:27:33] === drm_atomic_helper_connector_hdmi_check (23 subtests) ===
[16:27:33] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[16:27:33] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[16:27:33] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[16:27:33] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[16:27:33] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[16:27:33] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[16:27:33] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[16:27:33] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[16:27:33] [PASSED] drm_test_check_disable_connector
[16:27:33] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[16:27:33] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[16:27:33] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[16:27:33] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[16:27:33] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[16:27:33] [PASSED] drm_test_check_output_bpc_dvi
[16:27:33] [PASSED] drm_test_check_output_bpc_format_vic_1
[16:27:33] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[16:27:33] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[16:27:33] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[16:27:33] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[16:27:33] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[16:27:33] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[16:27:33] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[16:27:33] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[16:27:33] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[16:27:33] [PASSED] drm_test_check_broadcast_rgb_value
[16:27:33] [PASSED] drm_test_check_bpc_8_value
[16:27:33] [PASSED] drm_test_check_bpc_10_value
[16:27:33] [PASSED] drm_test_check_bpc_12_value
[16:27:33] [PASSED] drm_test_check_format_value
[16:27:33] [PASSED] drm_test_check_tmds_char_value
[16:27:33] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[16:27:33] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[16:27:33] [PASSED] drm_test_check_mode_valid
[16:27:33] [PASSED] drm_test_check_mode_valid_reject
[16:27:33] [PASSED] drm_test_check_mode_valid_reject_rate
[16:27:33] [PASSED] drm_test_check_mode_valid_reject_max_clock
[16:27:33] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[16:27:33] ================= drm_managed (2 subtests) =================
[16:27:33] [PASSED] drm_test_managed_release_action
[16:27:33] [PASSED] drm_test_managed_run_action
[16:27:33] =================== [PASSED] drm_managed ===================
[16:27:33] =================== drm_mm (6 subtests) ====================
[16:27:33] [PASSED] drm_test_mm_init
[16:27:33] [PASSED] drm_test_mm_debug
[16:27:33] [PASSED] drm_test_mm_align32
[16:27:33] [PASSED] drm_test_mm_align64
[16:27:33] [PASSED] drm_test_mm_lowest
[16:27:33] [PASSED] drm_test_mm_highest
[16:27:33] ===================== [PASSED] drm_mm ======================
[16:27:33] ============= drm_modes_analog_tv (5 subtests) =============
[16:27:33] [PASSED] drm_test_modes_analog_tv_mono_576i
[16:27:33] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[16:27:33] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[16:27:33] [PASSED] drm_test_modes_analog_tv_pal_576i
[16:27:33] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[16:27:33] =============== [PASSED] drm_modes_analog_tv ===============
[16:27:33] ============== drm_plane_helper (2 subtests) ===============
[16:27:33] =============== drm_test_check_plane_state  ================
[16:27:33] [PASSED] clipping_simple
[16:27:33] [PASSED] clipping_rotate_reflect
[16:27:33] [PASSED] positioning_simple
[16:27:33] [PASSED] upscaling
[16:27:33] [PASSED] downscaling
[16:27:33] [PASSED] rounding1
[16:27:33] [PASSED] rounding2
[16:27:33] [PASSED] rounding3
[16:27:33] [PASSED] rounding4
[16:27:33] =========== [PASSED] drm_test_check_plane_state ============
[16:27:33] =========== drm_test_check_invalid_plane_state  ============
[16:27:33] [PASSED] positioning_invalid
[16:27:33] [PASSED] upscaling_invalid
[16:27:33] [PASSED] downscaling_invalid
[16:27:33] ======= [PASSED] drm_test_check_invalid_plane_state ========
[16:27:33] ================ [PASSED] drm_plane_helper =================
[16:27:33] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[16:27:33] ====== drm_test_connector_helper_tv_get_modes_check  =======
[16:27:33] [PASSED] None
[16:27:33] [PASSED] PAL
[16:27:33] [PASSED] NTSC
[16:27:33] [PASSED] Both, NTSC Default
[16:27:33] [PASSED] Both, PAL Default
[16:27:33] [PASSED] Both, NTSC Default, with PAL on command-line
[16:27:33] [PASSED] Both, PAL Default, with NTSC on command-line
[16:27:33] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[16:27:33] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[16:27:33] ================== drm_rect (9 subtests) ===================
[16:27:33] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[16:27:33] [PASSED] drm_test_rect_clip_scaled_not_clipped
[16:27:33] [PASSED] drm_test_rect_clip_scaled_clipped
[16:27:33] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[16:27:33] ================= drm_test_rect_intersect  =================
[16:27:33] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[16:27:33] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[16:27:33] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[16:27:33] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[16:27:33] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[16:27:33] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[16:27:33] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[16:27:33] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[16:27:33] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[16:27:33] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[16:27:33] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[16:27:33] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[16:27:33] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[16:27:33] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[16:27:33] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[16:27:33] ============= [PASSED] drm_test_rect_intersect =============
[16:27:33] ================ drm_test_rect_calc_hscale  ================
[16:27:33] [PASSED] normal use
[16:27:33] [PASSED] out of max range
[16:27:33] [PASSED] out of min range
[16:27:33] [PASSED] zero dst
[16:27:33] [PASSED] negative src
[16:27:33] [PASSED] negative dst
[16:27:33] ============ [PASSED] drm_test_rect_calc_hscale ============
[16:27:33] ================ drm_test_rect_calc_vscale  ================
[16:27:33] [PASSED] normal use
[16:27:33] [PASSED] out of max range
[16:27:33] [PASSED] out of min range
[16:27:33] [PASSED] zero dst
[16:27:33] [PASSED] negative src
[16:27:33] [PASSED] negative dst
[16:27:33] ============ [PASSED] drm_test_rect_calc_vscale ============
[16:27:33] ================== drm_test_rect_rotate  ===================
[16:27:33] [PASSED] reflect-x
[16:27:33] [PASSED] reflect-y
[16:27:33] [PASSED] rotate-0
[16:27:33] [PASSED] rotate-90
[16:27:33] [PASSED] rotate-180
[16:27:33] [PASSED] rotate-270
[16:27:33] ============== [PASSED] drm_test_rect_rotate ===============
[16:27:33] ================ drm_test_rect_rotate_inv  =================
[16:27:33] [PASSED] reflect-x
[16:27:33] [PASSED] reflect-y
[16:27:33] [PASSED] rotate-0
[16:27:33] [PASSED] rotate-90
[16:27:33] [PASSED] rotate-180
[16:27:33] [PASSED] rotate-270
[16:27:33] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[16:27:33] ==================== [PASSED] drm_rect =====================
[16:27:33] ============================================================
[16:27:33] Testing complete. Ran 608 tests: passed: 608
[16:27:33] Elapsed time: 22.850s total, 1.789s configuring, 20.891s building, 0.131s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[16:27:33] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:27:35] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[16:27:43] Starting KUnit Kernel (1/1)...
[16:27:43] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[16:27:43] ================= ttm_device (5 subtests) ==================
[16:27:43] [PASSED] ttm_device_init_basic
[16:27:43] [PASSED] ttm_device_init_multiple
[16:27:43] [PASSED] ttm_device_fini_basic
[16:27:43] [PASSED] ttm_device_init_no_vma_man
[16:27:43] ================== ttm_device_init_pools  ==================
[16:27:43] [PASSED] No DMA allocations, no DMA32 required
[16:27:43] [PASSED] DMA allocations, DMA32 required
[16:27:43] [PASSED] No DMA allocations, DMA32 required
[16:27:43] [PASSED] DMA allocations, no DMA32 required
[16:27:43] ============== [PASSED] ttm_device_init_pools ==============
[16:27:43] =================== [PASSED] ttm_device ====================
[16:27:43] ================== ttm_pool (8 subtests) ===================
[16:27:43] ================== ttm_pool_alloc_basic  ===================
[16:27:43] [PASSED] One page
[16:27:43] [PASSED] More than one page
[16:27:43] [PASSED] Above the allocation limit
[16:27:43] [PASSED] One page, with coherent DMA mappings enabled
[16:27:43] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[16:27:43] ============== [PASSED] ttm_pool_alloc_basic ===============
[16:27:43] ============== ttm_pool_alloc_basic_dma_addr  ==============
[16:27:43] [PASSED] One page
[16:27:43] [PASSED] More than one page
[16:27:43] [PASSED] Above the allocation limit
[16:27:43] [PASSED] One page, with coherent DMA mappings enabled
[16:27:43] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[16:27:43] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[16:27:43] [PASSED] ttm_pool_alloc_order_caching_match
[16:27:43] [PASSED] ttm_pool_alloc_caching_mismatch
[16:27:43] [PASSED] ttm_pool_alloc_order_mismatch
[16:27:43] [PASSED] ttm_pool_free_dma_alloc
[16:27:43] [PASSED] ttm_pool_free_no_dma_alloc
[16:27:43] [PASSED] ttm_pool_fini_basic
[16:27:43] ==================== [PASSED] ttm_pool =====================
[16:27:43] ================ ttm_resource (8 subtests) =================
[16:27:43] ================= ttm_resource_init_basic  =================
[16:27:43] [PASSED] Init resource in TTM_PL_SYSTEM
[16:27:43] [PASSED] Init resource in TTM_PL_VRAM
[16:27:43] [PASSED] Init resource in a private placement
[16:27:43] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[16:27:43] ============= [PASSED] ttm_resource_init_basic =============
[16:27:43] [PASSED] ttm_resource_init_pinned
[16:27:43] [PASSED] ttm_resource_fini_basic
[16:27:43] [PASSED] ttm_resource_manager_init_basic
[16:27:43] [PASSED] ttm_resource_manager_usage_basic
[16:27:43] [PASSED] ttm_resource_manager_set_used_basic
[16:27:43] [PASSED] ttm_sys_man_alloc_basic
[16:27:43] [PASSED] ttm_sys_man_free_basic
[16:27:43] ================== [PASSED] ttm_resource ===================
[16:27:43] =================== ttm_tt (15 subtests) ===================
[16:27:43] ==================== ttm_tt_init_basic  ====================
[16:27:43] [PASSED] Page-aligned size
[16:27:43] [PASSED] Extra pages requested
[16:27:43] ================ [PASSED] ttm_tt_init_basic ================
[16:27:43] [PASSED] ttm_tt_init_misaligned
[16:27:43] [PASSED] ttm_tt_fini_basic
[16:27:43] [PASSED] ttm_tt_fini_sg
[16:27:43] [PASSED] ttm_tt_fini_shmem
[16:27:43] [PASSED] ttm_tt_create_basic
[16:27:43] [PASSED] ttm_tt_create_invalid_bo_type
[16:27:43] [PASSED] ttm_tt_create_ttm_exists
[16:27:43] [PASSED] ttm_tt_create_failed
[16:27:43] [PASSED] ttm_tt_destroy_basic
[16:27:43] [PASSED] ttm_tt_populate_null_ttm
[16:27:43] [PASSED] ttm_tt_populate_populated_ttm
[16:27:43] [PASSED] ttm_tt_unpopulate_basic
[16:27:43] [PASSED] ttm_tt_unpopulate_empty_ttm
[16:27:43] [PASSED] ttm_tt_swapin_basic
[16:27:43] ===================== [PASSED] ttm_tt ======================
[16:27:43] =================== ttm_bo (14 subtests) ===================
[16:27:43] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[16:27:43] [PASSED] Cannot be interrupted and sleeps
[16:27:43] [PASSED] Cannot be interrupted, locks straight away
[16:27:43] [PASSED] Can be interrupted, sleeps
[16:27:43] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[16:27:43] [PASSED] ttm_bo_reserve_locked_no_sleep
[16:27:43] [PASSED] ttm_bo_reserve_no_wait_ticket
[16:27:43] [PASSED] ttm_bo_reserve_double_resv
[16:27:43] [PASSED] ttm_bo_reserve_interrupted
[16:27:43] [PASSED] ttm_bo_reserve_deadlock
[16:27:43] [PASSED] ttm_bo_unreserve_basic
[16:27:43] [PASSED] ttm_bo_unreserve_pinned
[16:27:43] [PASSED] ttm_bo_unreserve_bulk
[16:27:43] [PASSED] ttm_bo_put_basic
[16:27:43] [PASSED] ttm_bo_put_shared_resv
[16:27:43] [PASSED] ttm_bo_pin_basic
[16:27:43] [PASSED] ttm_bo_pin_unpin_resource
[16:27:43] [PASSED] ttm_bo_multiple_pin_one_unpin
[16:27:43] ===================== [PASSED] ttm_bo ======================
[16:27:43] ============== ttm_bo_validate (22 subtests) ===============
[16:27:43] ============== ttm_bo_init_reserved_sys_man  ===============
[16:27:43] [PASSED] Buffer object for userspace
[16:27:43] [PASSED] Kernel buffer object
[16:27:43] [PASSED] Shared buffer object
[16:27:43] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[16:27:43] ============== ttm_bo_init_reserved_mock_man  ==============
[16:27:43] [PASSED] Buffer object for userspace
[16:27:43] [PASSED] Kernel buffer object
[16:27:43] [PASSED] Shared buffer object
[16:27:43] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[16:27:43] [PASSED] ttm_bo_init_reserved_resv
[16:27:43] ================== ttm_bo_validate_basic  ==================
[16:27:43] [PASSED] Buffer object for userspace
[16:27:43] [PASSED] Kernel buffer object
[16:27:43] [PASSED] Shared buffer object
[16:27:43] ============== [PASSED] ttm_bo_validate_basic ==============
[16:27:43] [PASSED] ttm_bo_validate_invalid_placement
[16:27:43] ============= ttm_bo_validate_same_placement  ==============
[16:27:43] [PASSED] System manager
[16:27:43] [PASSED] VRAM manager
[16:27:43] ========= [PASSED] ttm_bo_validate_same_placement ==========
[16:27:43] [PASSED] ttm_bo_validate_failed_alloc
[16:27:43] [PASSED] ttm_bo_validate_pinned
[16:27:43] [PASSED] ttm_bo_validate_busy_placement
[16:27:43] ================ ttm_bo_validate_multihop  =================
[16:27:43] [PASSED] Buffer object for userspace
[16:27:43] [PASSED] Kernel buffer object
[16:27:43] [PASSED] Shared buffer object
[16:27:43] ============ [PASSED] ttm_bo_validate_multihop =============
[16:27:43] ========== ttm_bo_validate_no_placement_signaled  ==========
[16:27:43] [PASSED] Buffer object in system domain, no page vector
[16:27:43] [PASSED] Buffer object in system domain with an existing page vector
[16:27:43] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[16:27:43] ======== ttm_bo_validate_no_placement_not_signaled  ========
[16:27:43] [PASSED] Buffer object for userspace
[16:27:43] [PASSED] Kernel buffer object
[16:27:43] [PASSED] Shared buffer object
[16:27:43] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[16:27:43] [PASSED] ttm_bo_validate_move_fence_signaled
[16:27:43] ========= ttm_bo_validate_move_fence_not_signaled  =========
[16:27:43] [PASSED] Waits for GPU
[16:27:43] [PASSED] Tries to lock straight away
[16:27:43] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[16:27:43] [PASSED] ttm_bo_validate_swapout
[16:27:43] [PASSED] ttm_bo_validate_happy_evict
[16:27:43] [PASSED] ttm_bo_validate_all_pinned_evict
[16:27:43] [PASSED] ttm_bo_validate_allowed_only_evict
[16:27:43] [PASSED] ttm_bo_validate_deleted_evict
[16:27:43] [PASSED] ttm_bo_validate_busy_domain_evict
[16:27:43] [PASSED] ttm_bo_validate_evict_gutting
[16:27:43] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[16:27:43] ================= [PASSED] ttm_bo_validate =================
[16:27:43] ============================================================
[16:27:43] Testing complete. Ran 102 tests: passed: 102
[16:27:43] Elapsed time: 9.960s total, 1.660s configuring, 7.684s building, 0.530s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


