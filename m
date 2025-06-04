Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AE1C5AD49
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 00:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84AF610E95B;
	Wed,  4 Jun 2025 00:34:24 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BBA10E94D;
 Wed,  4 Jun 2025 00:34:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Enable_GuC_opt-in_features?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Jun 2025 00:34:23 -0000
Message-ID: <174899726328.46839.11857569428612334340@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250604002454.743404-4-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250604002454.743404-4-daniele.ceraolospurio@intel.com>
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

Series: Enable GuC opt-in features
URL   : https://patchwork.freedesktop.org/series/149815/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[00:33:18] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:33:22] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[00:33:48] Starting KUnit Kernel (1/1)...
[00:33:48] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[00:33:48] ================== guc_buf (11 subtests) ===================
[00:33:48] [PASSED] test_smallest
[00:33:48] [PASSED] test_largest
[00:33:48] [PASSED] test_granular
[00:33:48] [PASSED] test_unique
[00:33:48] [PASSED] test_overlap
[00:33:48] [PASSED] test_reusable
[00:33:48] [PASSED] test_too_big
[00:33:48] [PASSED] test_flush
[00:33:48] [PASSED] test_lookup
[00:33:48] [PASSED] test_data
[00:33:48] [PASSED] test_class
[00:33:48] ===================== [PASSED] guc_buf =====================
[00:33:48] =================== guc_dbm (7 subtests) ===================
[00:33:48] [PASSED] test_empty
[00:33:48] [PASSED] test_default
[00:33:48] ======================== test_size  ========================
[00:33:48] [PASSED] 4
[00:33:48] [PASSED] 8
[00:33:48] [PASSED] 32
[00:33:48] [PASSED] 256
[00:33:48] ==================== [PASSED] test_size ====================
[00:33:48] ======================= test_reuse  ========================
[00:33:48] [PASSED] 4
[00:33:48] [PASSED] 8
[00:33:48] [PASSED] 32
[00:33:48] [PASSED] 256
[00:33:48] =================== [PASSED] test_reuse ====================
[00:33:48] =================== test_range_overlap  ====================
[00:33:48] [PASSED] 4
[00:33:48] [PASSED] 8
[00:33:48] [PASSED] 32
[00:33:48] [PASSED] 256
[00:33:48] =============== [PASSED] test_range_overlap ================
[00:33:48] =================== test_range_compact  ====================
[00:33:48] [PASSED] 4
[00:33:48] [PASSED] 8
[00:33:48] [PASSED] 32
[00:33:48] [PASSED] 256
[00:33:48] =============== [PASSED] test_range_compact ================
[00:33:48] ==================== test_range_spare  =====================
[00:33:48] [PASSED] 4
[00:33:48] [PASSED] 8
[00:33:48] [PASSED] 32
[00:33:48] [PASSED] 256
[00:33:48] ================ [PASSED] test_range_spare =================
[00:33:48] ===================== [PASSED] guc_dbm =====================
[00:33:48] =================== guc_idm (6 subtests) ===================
[00:33:48] [PASSED] bad_init
[00:33:48] [PASSED] no_init
[00:33:48] [PASSED] init_fini
[00:33:48] [PASSED] check_used
[00:33:49] [PASSED] check_quota
[00:33:49] [PASSED] check_all
[00:33:49] ===================== [PASSED] guc_idm =====================
[00:33:49] ================== no_relay (3 subtests) ===================
[00:33:49] [PASSED] xe_drops_guc2pf_if_not_ready
[00:33:49] [PASSED] xe_drops_guc2vf_if_not_ready
[00:33:49] [PASSED] xe_rejects_send_if_not_ready
[00:33:49] ==================== [PASSED] no_relay =====================
[00:33:49] ================== pf_relay (14 subtests) ==================
[00:33:49] [PASSED] pf_rejects_guc2pf_too_short
[00:33:49] [PASSED] pf_rejects_guc2pf_too_long
[00:33:49] [PASSED] pf_rejects_guc2pf_no_payload
[00:33:49] [PASSED] pf_fails_no_payload
[00:33:49] [PASSED] pf_fails_bad_origin
[00:33:49] [PASSED] pf_fails_bad_type
[00:33:49] [PASSED] pf_txn_reports_error
[00:33:49] [PASSED] pf_txn_sends_pf2guc
[00:33:49] [PASSED] pf_sends_pf2guc
[00:33:49] [SKIPPED] pf_loopback_nop
[00:33:49] [SKIPPED] pf_loopback_echo
[00:33:49] [SKIPPED] pf_loopback_fail
[00:33:49] [SKIPPED] pf_loopback_busy
[00:33:49] [SKIPPED] pf_loopback_retry
[00:33:49] ==================== [PASSED] pf_relay =====================
[00:33:49] ================== vf_relay (3 subtests) ===================
[00:33:49] [PASSED] vf_rejects_guc2vf_too_short
[00:33:49] [PASSED] vf_rejects_guc2vf_too_long
[00:33:49] [PASSED] vf_rejects_guc2vf_no_payload
[00:33:49] ==================== [PASSED] vf_relay =====================
[00:33:49] ================= pf_service (11 subtests) =================
[00:33:49] [PASSED] pf_negotiate_any
[00:33:49] [PASSED] pf_negotiate_base_match
[00:33:49] [PASSED] pf_negotiate_base_newer
[00:33:49] [PASSED] pf_negotiate_base_next
[00:33:49] [SKIPPED] pf_negotiate_base_older
[00:33:49] [PASSED] pf_negotiate_base_prev
[00:33:49] [PASSED] pf_negotiate_latest_match
[00:33:49] [PASSED] pf_negotiate_latest_newer
[00:33:49] [PASSED] pf_negotiate_latest_next
[00:33:49] [SKIPPED] pf_negotiate_latest_older
[00:33:49] [SKIPPED] pf_negotiate_latest_prev
[00:33:49] =================== [PASSED] pf_service ====================
[00:33:49] ===================== lmtt (1 subtest) =====================
[00:33:49] ======================== test_ops  =========================
[00:33:49] [PASSED] 2-level
[00:33:49] [PASSED] multi-level
[00:33:49] ==================== [PASSED] test_ops =====================
[00:33:49] ====================== [PASSED] lmtt =======================
[00:33:49] =================== xe_mocs (2 subtests) ===================
[00:33:49] ================ xe_live_mocs_kernel_kunit  ================
[00:33:49] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[00:33:49] ================ xe_live_mocs_reset_kunit  =================
[00:33:49] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[00:33:49] ==================== [SKIPPED] xe_mocs =====================
[00:33:49] ================= xe_migrate (2 subtests) ==================
[00:33:49] ================= xe_migrate_sanity_kunit  =================
[00:33:49] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[00:33:49] ================== xe_validate_ccs_kunit  ==================
[00:33:49] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[00:33:49] =================== [SKIPPED] xe_migrate ===================
[00:33:49] ================== xe_dma_buf (1 subtest) ==================
[00:33:49] ==================== xe_dma_buf_kunit  =====================
[00:33:49] ================ [SKIPPED] xe_dma_buf_kunit ================
[00:33:49] =================== [SKIPPED] xe_dma_buf ===================
[00:33:49] ================= xe_bo_shrink (1 subtest) =================
[00:33:49] =================== xe_bo_shrink_kunit  ====================
[00:33:49] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[00:33:49] ================== [SKIPPED] xe_bo_shrink ==================
[00:33:49] ==================== xe_bo (2 subtests) ====================
[00:33:49] ================== xe_ccs_migrate_kunit  ===================
[00:33:49] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[00:33:49] ==================== xe_bo_evict_kunit  ====================
[00:33:49] =============== [SKIPPED] xe_bo_evict_kunit ================
[00:33:49] ===================== [SKIPPED] xe_bo ======================
[00:33:49] ==================== args (11 subtests) ====================
[00:33:49] [PASSED] count_args_test
[00:33:49] [PASSED] call_args_example
[00:33:49] [PASSED] call_args_test
[00:33:49] [PASSED] drop_first_arg_example
[00:33:49] [PASSED] drop_first_arg_test
[00:33:49] [PASSED] first_arg_example
[00:33:49] [PASSED] first_arg_test
[00:33:49] [PASSED] last_arg_example
[00:33:49] [PASSED] last_arg_test
[00:33:49] [PASSED] pick_arg_example
[00:33:49] [PASSED] sep_comma_example
[00:33:49] ====================== [PASSED] args =======================
[00:33:49] =================== xe_pci (2 subtests) ====================
[00:33:49] [PASSED] xe_gmdid_graphics_ip
[00:33:49] [PASSED] xe_gmdid_media_ip
[00:33:49] ===================== [PASSED] xe_pci ======================
[00:33:49] =================== xe_rtp (2 subtests) ====================
[00:33:49] =============== xe_rtp_process_to_sr_tests  ================
[00:33:49] [PASSED] coalesce-same-reg
[00:33:49] [PASSED] no-match-no-add
[00:33:49] [PASSED] match-or
[00:33:49] [PASSED] match-or-xfail
[00:33:49] [PASSED] no-match-no-add-multiple-rules
[00:33:49] [PASSED] two-regs-two-entries
[00:33:49] [PASSED] clr-one-set-other
[00:33:49] [PASSED] set-field
[00:33:49] [PASSED] conflict-duplicate
[00:33:49] [PASSED] conflict-not-disjoint
stty: 'standard input': Inappropriate ioctl for device
[00:33:49] [PASSED] conflict-reg-type
[00:33:49] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[00:33:49] ================== xe_rtp_process_tests  ===================
[00:33:49] [PASSED] active1
[00:33:49] [PASSED] active2
[00:33:49] [PASSED] active-inactive
[00:33:49] [PASSED] inactive-active
[00:33:49] [PASSED] inactive-1st_or_active-inactive
[00:33:49] [PASSED] inactive-2nd_or_active-inactive
[00:33:49] [PASSED] inactive-last_or_active-inactive
[00:33:49] [PASSED] inactive-no_or_active-inactive
[00:33:49] ============== [PASSED] xe_rtp_process_tests ===============
[00:33:49] ===================== [PASSED] xe_rtp ======================
[00:33:49] ==================== xe_wa (1 subtest) =====================
[00:33:49] ======================== xe_wa_gt  =========================
[00:33:49] [PASSED] TIGERLAKE (B0)
[00:33:49] [PASSED] DG1 (A0)
[00:33:49] [PASSED] DG1 (B0)
[00:33:49] [PASSED] ALDERLAKE_S (A0)
[00:33:49] [PASSED] ALDERLAKE_S (B0)
[00:33:49] [PASSED] ALDERLAKE_S (C0)
[00:33:49] [PASSED] ALDERLAKE_S (D0)
[00:33:49] [PASSED] ALDERLAKE_P (A0)
[00:33:49] [PASSED] ALDERLAKE_P (B0)
[00:33:49] [PASSED] ALDERLAKE_P (C0)
[00:33:49] [PASSED] ALDERLAKE_S_RPLS (D0)
[00:33:49] [PASSED] ALDERLAKE_P_RPLU (E0)
[00:33:49] [PASSED] DG2_G10 (C0)
[00:33:49] [PASSED] DG2_G11 (B1)
[00:33:49] [PASSED] DG2_G12 (A1)
[00:33:49] [PASSED] METEORLAKE (g:A0, m:A0)
[00:33:49] [PASSED] METEORLAKE (g:A0, m:A0)
[00:33:49] [PASSED] METEORLAKE (g:A0, m:A0)
[00:33:49] [PASSED] LUNARLAKE (g:A0, m:A0)
[00:33:49] [PASSED] LUNARLAKE (g:B0, m:A0)
[00:33:49] [PASSED] BATTLEMAGE (g:A0, m:A1)
[00:33:49] ==================== [PASSED] xe_wa_gt =====================
[00:33:49] ====================== [PASSED] xe_wa ======================
[00:33:49] ============================================================
[00:33:49] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[00:33:49] Elapsed time: 31.071s total, 4.263s configuring, 26.490s building, 0.292s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[00:33:49] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:33:50] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[00:34:12] Starting KUnit Kernel (1/1)...
[00:34:12] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[00:34:12] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[00:34:12] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[00:34:12] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[00:34:12] =========== drm_validate_clone_mode (2 subtests) ===========
[00:34:12] ============== drm_test_check_in_clone_mode  ===============
[00:34:12] [PASSED] in_clone_mode
[00:34:12] [PASSED] not_in_clone_mode
[00:34:12] ========== [PASSED] drm_test_check_in_clone_mode ===========
[00:34:12] =============== drm_test_check_valid_clones  ===============
[00:34:12] [PASSED] not_in_clone_mode
[00:34:12] [PASSED] valid_clone
[00:34:12] [PASSED] invalid_clone
[00:34:12] =========== [PASSED] drm_test_check_valid_clones ===========
[00:34:12] ============= [PASSED] drm_validate_clone_mode =============
[00:34:12] ============= drm_validate_modeset (1 subtest) =============
[00:34:12] [PASSED] drm_test_check_connector_changed_modeset
[00:34:12] ============== [PASSED] drm_validate_modeset ===============
[00:34:12] ====== drm_test_bridge_get_current_state (2 subtests) ======
[00:34:12] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[00:34:12] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[00:34:12] ======== [PASSED] drm_test_bridge_get_current_state ========
[00:34:12] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[00:34:12] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[00:34:12] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[00:34:12] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[00:34:12] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[00:34:12] ================== drm_buddy (7 subtests) ==================
[00:34:12] [PASSED] drm_test_buddy_alloc_limit
[00:34:12] [PASSED] drm_test_buddy_alloc_optimistic
[00:34:12] [PASSED] drm_test_buddy_alloc_pessimistic
[00:34:12] [PASSED] drm_test_buddy_alloc_pathological
[00:34:12] [PASSED] drm_test_buddy_alloc_contiguous
[00:34:12] [PASSED] drm_test_buddy_alloc_clear
[00:34:12] [PASSED] drm_test_buddy_alloc_range_bias
[00:34:12] ==================== [PASSED] drm_buddy ====================
[00:34:12] ============= drm_cmdline_parser (40 subtests) =============
[00:34:12] [PASSED] drm_test_cmdline_force_d_only
[00:34:12] [PASSED] drm_test_cmdline_force_D_only_dvi
[00:34:12] [PASSED] drm_test_cmdline_force_D_only_hdmi
[00:34:12] [PASSED] drm_test_cmdline_force_D_only_not_digital
[00:34:12] [PASSED] drm_test_cmdline_force_e_only
[00:34:12] [PASSED] drm_test_cmdline_res
[00:34:12] [PASSED] drm_test_cmdline_res_vesa
[00:34:12] [PASSED] drm_test_cmdline_res_vesa_rblank
[00:34:12] [PASSED] drm_test_cmdline_res_rblank
[00:34:12] [PASSED] drm_test_cmdline_res_bpp
[00:34:12] [PASSED] drm_test_cmdline_res_refresh
[00:34:12] [PASSED] drm_test_cmdline_res_bpp_refresh
[00:34:12] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[00:34:12] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[00:34:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[00:34:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[00:34:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[00:34:12] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[00:34:12] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[00:34:12] [PASSED] drm_test_cmdline_res_margins_force_on
[00:34:12] [PASSED] drm_test_cmdline_res_vesa_margins
[00:34:12] [PASSED] drm_test_cmdline_name
[00:34:12] [PASSED] drm_test_cmdline_name_bpp
[00:34:12] [PASSED] drm_test_cmdline_name_option
[00:34:12] [PASSED] drm_test_cmdline_name_bpp_option
[00:34:12] [PASSED] drm_test_cmdline_rotate_0
[00:34:12] [PASSED] drm_test_cmdline_rotate_90
[00:34:12] [PASSED] drm_test_cmdline_rotate_180
[00:34:12] [PASSED] drm_test_cmdline_rotate_270
[00:34:12] [PASSED] drm_test_cmdline_hmirror
[00:34:12] [PASSED] drm_test_cmdline_vmirror
[00:34:12] [PASSED] drm_test_cmdline_margin_options
[00:34:12] [PASSED] drm_test_cmdline_multiple_options
[00:34:12] [PASSED] drm_test_cmdline_bpp_extra_and_option
[00:34:12] [PASSED] drm_test_cmdline_extra_and_option
[00:34:12] [PASSED] drm_test_cmdline_freestanding_options
[00:34:12] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[00:34:12] [PASSED] drm_test_cmdline_panel_orientation
[00:34:12] ================ drm_test_cmdline_invalid  =================
[00:34:12] [PASSED] margin_only
[00:34:12] [PASSED] interlace_only
[00:34:12] [PASSED] res_missing_x
[00:34:12] [PASSED] res_missing_y
[00:34:12] [PASSED] res_bad_y
[00:34:12] [PASSED] res_missing_y_bpp
[00:34:12] [PASSED] res_bad_bpp
[00:34:12] [PASSED] res_bad_refresh
[00:34:12] [PASSED] res_bpp_refresh_force_on_off
[00:34:12] [PASSED] res_invalid_mode
[00:34:12] [PASSED] res_bpp_wrong_place_mode
[00:34:12] [PASSED] name_bpp_refresh
[00:34:12] [PASSED] name_refresh
[00:34:12] [PASSED] name_refresh_wrong_mode
[00:34:12] [PASSED] name_refresh_invalid_mode
[00:34:12] [PASSED] rotate_multiple
[00:34:12] [PASSED] rotate_invalid_val
[00:34:12] [PASSED] rotate_truncated
[00:34:12] [PASSED] invalid_option
[00:34:12] [PASSED] invalid_tv_option
[00:34:12] [PASSED] truncated_tv_option
[00:34:12] ============ [PASSED] drm_test_cmdline_invalid =============
[00:34:12] =============== drm_test_cmdline_tv_options  ===============
[00:34:12] [PASSED] NTSC
[00:34:12] [PASSED] NTSC_443
[00:34:12] [PASSED] NTSC_J
[00:34:12] [PASSED] PAL
[00:34:12] [PASSED] PAL_M
[00:34:12] [PASSED] PAL_N
[00:34:12] [PASSED] SECAM
[00:34:12] [PASSED] MONO_525
[00:34:12] [PASSED] MONO_625
[00:34:12] =========== [PASSED] drm_test_cmdline_tv_options ===========
[00:34:12] =============== [PASSED] drm_cmdline_parser ================
[00:34:12] ========== drmm_connector_hdmi_init (20 subtests) ==========
[00:34:12] [PASSED] drm_test_connector_hdmi_init_valid
[00:34:12] [PASSED] drm_test_connector_hdmi_init_bpc_8
[00:34:12] [PASSED] drm_test_connector_hdmi_init_bpc_10
[00:34:12] [PASSED] drm_test_connector_hdmi_init_bpc_12
[00:34:12] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[00:34:12] [PASSED] drm_test_connector_hdmi_init_bpc_null
[00:34:12] [PASSED] drm_test_connector_hdmi_init_formats_empty
[00:34:12] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[00:34:12] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[00:34:12] [PASSED] supported_formats=0x9 yuv420_allowed=1
[00:34:12] [PASSED] supported_formats=0x9 yuv420_allowed=0
[00:34:12] [PASSED] supported_formats=0x3 yuv420_allowed=1
[00:34:12] [PASSED] supported_formats=0x3 yuv420_allowed=0
[00:34:12] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[00:34:12] [PASSED] drm_test_connector_hdmi_init_null_ddc
[00:34:12] [PASSED] drm_test_connector_hdmi_init_null_product
[00:34:12] [PASSED] drm_test_connector_hdmi_init_null_vendor
[00:34:12] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[00:34:12] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[00:34:12] [PASSED] drm_test_connector_hdmi_init_product_valid
[00:34:12] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[00:34:12] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[00:34:12] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[00:34:12] ========= drm_test_connector_hdmi_init_type_valid  =========
[00:34:12] [PASSED] HDMI-A
[00:34:12] [PASSED] HDMI-B
[00:34:12] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[00:34:12] ======== drm_test_connector_hdmi_init_type_invalid  ========
[00:34:12] [PASSED] Unknown
[00:34:12] [PASSED] VGA
[00:34:12] [PASSED] DVI-I
[00:34:12] [PASSED] DVI-D
[00:34:12] [PASSED] DVI-A
[00:34:12] [PASSED] Composite
[00:34:12] [PASSED] SVIDEO
[00:34:12] [PASSED] LVDS
[00:34:12] [PASSED] Component
[00:34:12] [PASSED] DIN
[00:34:12] [PASSED] DP
[00:34:12] [PASSED] TV
[00:34:12] [PASSED] eDP
[00:34:12] [PASSED] Virtual
[00:34:12] [PASSED] DSI
[00:34:12] [PASSED] DPI
[00:34:12] [PASSED] Writeback
[00:34:12] [PASSED] SPI
[00:34:12] [PASSED] USB
[00:34:12] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[00:34:12] ============ [PASSED] drmm_connector_hdmi_init =============
[00:34:12] ============= drmm_connector_init (3 subtests) =============
[00:34:12] [PASSED] drm_test_drmm_connector_init
[00:34:12] [PASSED] drm_test_drmm_connector_init_null_ddc
[00:34:12] ========= drm_test_drmm_connector_init_type_valid  =========
[00:34:12] [PASSED] Unknown
[00:34:12] [PASSED] VGA
[00:34:12] [PASSED] DVI-I
[00:34:12] [PASSED] DVI-D
[00:34:12] [PASSED] DVI-A
[00:34:12] [PASSED] Composite
[00:34:12] [PASSED] SVIDEO
[00:34:12] [PASSED] LVDS
[00:34:12] [PASSED] Component
[00:34:12] [PASSED] DIN
[00:34:12] [PASSED] DP
[00:34:12] [PASSED] HDMI-A
[00:34:12] [PASSED] HDMI-B
[00:34:12] [PASSED] TV
[00:34:12] [PASSED] eDP
[00:34:12] [PASSED] Virtual
[00:34:12] [PASSED] DSI
[00:34:12] [PASSED] DPI
[00:34:12] [PASSED] Writeback
[00:34:12] [PASSED] SPI
[00:34:12] [PASSED] USB
[00:34:12] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[00:34:12] =============== [PASSED] drmm_connector_init ===============
[00:34:12] ========= drm_connector_dynamic_init (6 subtests) ==========
[00:34:12] [PASSED] drm_test_drm_connector_dynamic_init
[00:34:12] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[00:34:12] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[00:34:12] [PASSED] drm_test_drm_connector_dynamic_init_properties
[00:34:12] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[00:34:12] [PASSED] Unknown
[00:34:12] [PASSED] VGA
[00:34:12] [PASSED] DVI-I
[00:34:12] [PASSED] DVI-D
[00:34:12] [PASSED] DVI-A
[00:34:12] [PASSED] Composite
[00:34:12] [PASSED] SVIDEO
[00:34:12] [PASSED] LVDS
[00:34:12] [PASSED] Component
[00:34:12] [PASSED] DIN
[00:34:12] [PASSED] DP
[00:34:12] [PASSED] HDMI-A
[00:34:12] [PASSED] HDMI-B
[00:34:12] [PASSED] TV
[00:34:12] [PASSED] eDP
[00:34:12] [PASSED] Virtual
[00:34:12] [PASSED] DSI
[00:34:12] [PASSED] DPI
[00:34:12] [PASSED] Writeback
[00:34:12] [PASSED] SPI
[00:34:12] [PASSED] USB
[00:34:12] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[00:34:12] ======== drm_test_drm_connector_dynamic_init_name  =========
[00:34:12] [PASSED] Unknown
[00:34:12] [PASSED] VGA
[00:34:12] [PASSED] DVI-I
[00:34:12] [PASSED] DVI-D
[00:34:12] [PASSED] DVI-A
[00:34:12] [PASSED] Composite
[00:34:12] [PASSED] SVIDEO
[00:34:12] [PASSED] LVDS
[00:34:12] [PASSED] Component
[00:34:12] [PASSED] DIN
[00:34:12] [PASSED] DP
[00:34:12] [PASSED] HDMI-A
[00:34:12] [PASSED] HDMI-B
[00:34:12] [PASSED] TV
[00:34:12] [PASSED] eDP
[00:34:12] [PASSED] Virtual
[00:34:12] [PASSED] DSI
[00:34:12] [PASSED] DPI
[00:34:12] [PASSED] Writeback
[00:34:12] [PASSED] SPI
[00:34:12] [PASSED] USB
[00:34:12] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[00:34:12] =========== [PASSED] drm_connector_dynamic_init ============
[00:34:12] ==== drm_connector_dynamic_register_early (4 subtests) =====
[00:34:12] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[00:34:12] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[00:34:12] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[00:34:12] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[00:34:12] ====== [PASSED] drm_connector_dynamic_register_early =======
[00:34:12] ======= drm_connector_dynamic_register (7 subtests) ========
[00:34:12] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[00:34:12] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[00:34:12] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[00:34:12] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[00:34:12] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[00:34:12] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[00:34:12] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[00:34:12] ========= [PASSED] drm_connector_dynamic_register ==========
[00:34:12] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[00:34:12] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[00:34:12] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[00:34:12] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[00:34:12] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[00:34:12] ========== drm_test_get_tv_mode_from_name_valid  ===========
[00:34:12] [PASSED] NTSC
[00:34:12] [PASSED] NTSC-443
[00:34:12] [PASSED] NTSC-J
[00:34:12] [PASSED] PAL
[00:34:12] [PASSED] PAL-M
[00:34:12] [PASSED] PAL-N
[00:34:12] [PASSED] SECAM
[00:34:12] [PASSED] Mono
[00:34:12] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[00:34:12] [PASSED] drm_test_get_tv_mode_from_name_truncated
[00:34:12] ============ [PASSED] drm_get_tv_mode_from_name ============
[00:34:12] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[00:34:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[00:34:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[00:34:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[00:34:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[00:34:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[00:34:12] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[00:34:12] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[00:34:12] [PASSED] VIC 96
[00:34:12] [PASSED] VIC 97
[00:34:12] [PASSED] VIC 101
[00:34:12] [PASSED] VIC 102
[00:34:12] [PASSED] VIC 106
[00:34:12] [PASSED] VIC 107
[00:34:12] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[00:34:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[00:34:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[00:34:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[00:34:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[00:34:12] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[00:34:12] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[00:34:12] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[00:34:12] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[00:34:12] [PASSED] Automatic
[00:34:12] [PASSED] Full
[00:34:12] [PASSED] Limited 16:235
[00:34:12] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[00:34:12] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[00:34:12] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[00:34:12] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[00:34:12] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[00:34:12] [PASSED] RGB
[00:34:12] [PASSED] YUV 4:2:0
[00:34:12] [PASSED] YUV 4:2:2
[00:34:12] [PASSED] YUV 4:4:4
[00:34:12] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[00:34:12] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[00:34:12] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[00:34:12] ============= drm_damage_helper (21 subtests) ==============
[00:34:12] [PASSED] drm_test_damage_iter_no_damage
[00:34:12] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[00:34:12] [PASSED] drm_test_damage_iter_no_damage_src_moved
[00:34:12] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[00:34:12] [PASSED] drm_test_damage_iter_no_damage_not_visible
[00:34:12] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[00:34:12] [PASSED] drm_test_damage_iter_no_damage_no_fb
[00:34:12] [PASSED] drm_test_damage_iter_simple_damage
[00:34:12] [PASSED] drm_test_damage_iter_single_damage
[00:34:12] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[00:34:12] [PASSED] drm_test_damage_iter_single_damage_outside_src
[00:34:12] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[00:34:12] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[00:34:12] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[00:34:12] [PASSED] drm_test_damage_iter_single_damage_src_moved
[00:34:12] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[00:34:12] [PASSED] drm_test_damage_iter_damage
[00:34:12] [PASSED] drm_test_damage_iter_damage_one_intersect
[00:34:12] [PASSED] drm_test_damage_iter_damage_one_outside
[00:34:12] [PASSED] drm_test_damage_iter_damage_src_moved
[00:34:12] [PASSED] drm_test_damage_iter_damage_not_visible
[00:34:12] ================ [PASSED] drm_damage_helper ================
[00:34:12] ============== drm_dp_mst_helper (3 subtests) ==============
[00:34:12] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[00:34:12] [PASSED] Clock 154000 BPP 30 DSC disabled
[00:34:12] [PASSED] Clock 234000 BPP 30 DSC disabled
[00:34:12] [PASSED] Clock 297000 BPP 24 DSC disabled
[00:34:12] [PASSED] Clock 332880 BPP 24 DSC enabled
[00:34:12] [PASSED] Clock 324540 BPP 24 DSC enabled
[00:34:12] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[00:34:12] ============== drm_test_dp_mst_calc_pbn_div  ===============
[00:34:12] [PASSED] Link rate 2000000 lane count 4
[00:34:12] [PASSED] Link rate 2000000 lane count 2
[00:34:12] [PASSED] Link rate 2000000 lane count 1
[00:34:12] [PASSED] Link rate 1350000 lane count 4
[00:34:12] [PASSED] Link rate 1350000 lane count 2
[00:34:12] [PASSED] Link rate 1350000 lane count 1
[00:34:12] [PASSED] Link rate 1000000 lane count 4
[00:34:12] [PASSED] Link rate 1000000 lane count 2
[00:34:12] [PASSED] Link rate 1000000 lane count 1
[00:34:12] [PASSED] Link rate 810000 lane count 4
[00:34:12] [PASSED] Link rate 810000 lane count 2
[00:34:12] [PASSED] Link rate 810000 lane count 1
[00:34:12] [PASSED] Link rate 540000 lane count 4
[00:34:12] [PASSED] Link rate 540000 lane count 2
[00:34:12] [PASSED] Link rate 540000 lane count 1
[00:34:12] [PASSED] Link rate 270000 lane count 4
[00:34:12] [PASSED] Link rate 270000 lane count 2
[00:34:12] [PASSED] Link rate 270000 lane count 1
[00:34:12] [PASSED] Link rate 162000 lane count 4
[00:34:12] [PASSED] Link rate 162000 lane count 2
[00:34:12] [PASSED] Link rate 162000 lane count 1
[00:34:12] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[00:34:12] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[00:34:12] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[00:34:12] [PASSED] DP_POWER_UP_PHY with port number
[00:34:12] [PASSED] DP_POWER_DOWN_PHY with port number
[00:34:12] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[00:34:12] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[00:34:12] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[00:34:12] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[00:34:12] [PASSED] DP_QUERY_PAYLOAD with port number
[00:34:12] [PASSED] DP_QUERY_PAYLOAD with VCPI
[00:34:12] [PASSED] DP_REMOTE_DPCD_READ with port number
[00:34:12] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[00:34:12] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[00:34:12] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[00:34:12] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[00:34:12] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[00:34:12] [PASSED] DP_REMOTE_I2C_READ with port number
[00:34:12] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[00:34:12] [PASSED] DP_REMOTE_I2C_READ with transactions array
[00:34:12] [PASSED] DP_REMOTE_I2C_WRITE with port number
[00:34:12] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[00:34:12] [PASSED] DP_REMOTE_I2C_WRITE with data array
[00:34:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[00:34:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[00:34:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[00:34:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[00:34:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[00:34:12] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[00:34:12] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[00:34:12] ================ [PASSED] drm_dp_mst_helper ================
[00:34:12] ================== drm_exec (7 subtests) ===================
[00:34:12] [PASSED] sanitycheck
[00:34:12] [PASSED] test_lock
[00:34:12] [PASSED] test_lock_unlock
[00:34:12] [PASSED] test_duplicates
[00:34:12] [PASSED] test_prepare
[00:34:12] [PASSED] test_prepare_array
[00:34:12] [PASSED] test_multiple_loops
[00:34:12] ==================== [PASSED] drm_exec =====================
[00:34:12] =========== drm_format_helper_test (18 subtests) ===========
[00:34:12] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[00:34:12] [PASSED] single_pixel_source_buffer
[00:34:12] [PASSED] single_pixel_clip_rectangle
[00:34:12] [PASSED] well_known_colors
[00:34:12] [PASSED] destination_pitch
[00:34:12] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[00:34:12] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[00:34:12] [PASSED] single_pixel_source_buffer
[00:34:12] [PASSED] single_pixel_clip_rectangle
[00:34:12] [PASSED] well_known_colors
[00:34:12] [PASSED] destination_pitch
[00:34:12] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[00:34:12] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[00:34:12] [PASSED] single_pixel_source_buffer
[00:34:12] [PASSED] single_pixel_clip_rectangle
[00:34:12] [PASSED] well_known_colors
[00:34:12] [PASSED] destination_pitch
[00:34:12] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[00:34:12] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[00:34:12] [PASSED] single_pixel_source_buffer
[00:34:12] [PASSED] single_pixel_clip_rectangle
[00:34:12] [PASSED] well_known_colors
[00:34:12] [PASSED] destination_pitch
[00:34:12] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[00:34:12] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[00:34:12] [PASSED] single_pixel_source_buffer
[00:34:12] [PASSED] single_pixel_clip_rectangle
[00:34:12] [PASSED] well_known_colors
[00:34:12] [PASSED] destination_pitch
[00:34:12] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[00:34:12] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[00:34:12] [PASSED] single_pixel_source_buffer
[00:34:12] [PASSED] single_pixel_clip_rectangle
[00:34:12] [PASSED] well_known_colors
[00:34:12] [PASSED] destination_pitch
[00:34:12] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[00:34:12] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[00:34:12] [PASSED] single_pixel_source_buffer
[00:34:12] [PASSED] single_pixel_clip_rectangle
[00:34:12] [PASSED] well_known_colors
[00:34:12] [PASSED] destination_pitch
[00:34:12] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[00:34:12] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[00:34:12] [PASSED] single_pixel_source_buffer
[00:34:12] [PASSED] single_pixel_clip_rectangle
[00:34:12] [PASSED] well_known_colors
[00:34:12] [PASSED] destination_pitch
[00:34:12] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[00:34:12] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[00:34:12] [PASSED] single_pixel_source_buffer
[00:34:12] [PASSED] single_pixel_clip_rectangle
[00:34:12] [PASSED] well_known_colors
[00:34:12] [PASSED] destination_pitch
[00:34:12] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[00:34:12] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[00:34:12] [PASSED] single_pixel_source_buffer
[00:34:12] [PASSED] single_pixel_clip_rectangle
[00:34:12] [PASSED] well_known_colors
[00:34:12] [PASSED] destination_pitch
[00:34:12] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[00:34:12] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[00:34:12] [PASSED] single_pixel_source_buffer
[00:34:12] [PASSED] single_pixel_clip_rectangle
[00:34:12] [PASSED] well_known_colors
[00:34:12] [PASSED] destination_pitch
[00:34:12] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[00:34:12] ============== drm_test_fb_xrgb8888_to_mono  ===============
[00:34:12] [PASSED] single_pixel_source_buffer
[00:34:12] [PASSED] single_pixel_clip_rectangle
[00:34:12] [PASSED] well_known_colors
[00:34:12] [PASSED] destination_pitch
[00:34:12] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[00:34:12] ==================== drm_test_fb_swab  =====================
[00:34:12] [PASSED] single_pixel_source_buffer
[00:34:12] [PASSED] single_pixel_clip_rectangle
[00:34:12] [PASSED] well_known_colors
[00:34:12] [PASSED] destination_pitch
[00:34:12] ================ [PASSED] drm_test_fb_swab =================
[00:34:12] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[00:34:12] [PASSED] single_pixel_source_buffer
[00:34:12] [PASSED] single_pixel_clip_rectangle
[00:34:12] [PASSED] well_known_colors
[00:34:12] [PASSED] destination_pitch
[00:34:12] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[00:34:12] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[00:34:12] [PASSED] single_pixel_source_buffer
[00:34:12] [PASSED] single_pixel_clip_rectangle
[00:34:12] [PASSED] well_known_colors
[00:34:12] [PASSED] destination_pitch
[00:34:12] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[00:34:12] ================= drm_test_fb_clip_offset  =================
[00:34:12] [PASSED] pass through
[00:34:12] [PASSED] horizontal offset
[00:34:12] [PASSED] vertical offset
[00:34:12] [PASSED] horizontal and vertical offset
[00:34:12] [PASSED] horizontal offset (custom pitch)
[00:34:12] [PASSED] vertical offset (custom pitch)
[00:34:12] [PASSED] horizontal and vertical offset (custom pitch)
[00:34:12] ============= [PASSED] drm_test_fb_clip_offset =============
[00:34:12] ============== drm_test_fb_build_fourcc_list  ==============
[00:34:12] [PASSED] no native formats
[00:34:12] [PASSED] XRGB8888 as native format
[00:34:12] [PASSED] remove duplicates
[00:34:12] [PASSED] convert alpha formats
[00:34:12] [PASSED] random formats
[00:34:12] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[00:34:12] =================== drm_test_fb_memcpy  ====================
[00:34:12] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[00:34:12] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[00:34:12] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[00:34:12] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[00:34:12] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[00:34:12] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[00:34:12] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[00:34:12] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[00:34:12] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[00:34:12] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[00:34:12] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[00:34:12] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[00:34:12] =============== [PASSED] drm_test_fb_memcpy ================
[00:34:12] ============= [PASSED] drm_format_helper_test ==============
[00:34:12] ================= drm_format (18 subtests) =================
[00:34:12] [PASSED] drm_test_format_block_width_invalid
[00:34:12] [PASSED] drm_test_format_block_width_one_plane
[00:34:12] [PASSED] drm_test_format_block_width_two_plane
[00:34:12] [PASSED] drm_test_format_block_width_three_plane
[00:34:12] [PASSED] drm_test_format_block_width_tiled
[00:34:12] [PASSED] drm_test_format_block_height_invalid
[00:34:12] [PASSED] drm_test_format_block_height_one_plane
[00:34:12] [PASSED] drm_test_format_block_height_two_plane
[00:34:12] [PASSED] drm_test_format_block_height_three_plane
[00:34:12] [PASSED] drm_test_format_block_height_tiled
[00:34:12] [PASSED] drm_test_format_min_pitch_invalid
[00:34:12] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[00:34:12] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[00:34:12] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[00:34:12] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[00:34:12] [PASSED] drm_test_format_min_pitch_two_plane
[00:34:12] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[00:34:12] [PASSED] drm_test_format_min_pitch_tiled
[00:34:12] =================== [PASSED] drm_format ====================
[00:34:12] ============== drm_framebuffer (10 subtests) ===============
[00:34:12] ========== drm_test_framebuffer_check_src_coords  ==========
[00:34:12] [PASSED] Success: source fits into fb
[00:34:12] [PASSED] Fail: overflowing fb with x-axis coordinate
[00:34:12] [PASSED] Fail: overflowing fb with y-axis coordinate
[00:34:12] [PASSED] Fail: overflowing fb with source width
[00:34:12] [PASSED] Fail: overflowing fb with source height
[00:34:12] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[00:34:12] [PASSED] drm_test_framebuffer_cleanup
[00:34:12] =============== drm_test_framebuffer_create  ===============
[00:34:12] [PASSED] ABGR8888 normal sizes
[00:34:12] [PASSED] ABGR8888 max sizes
[00:34:12] [PASSED] ABGR8888 pitch greater than min required
[00:34:12] [PASSED] ABGR8888 pitch less than min required
[00:34:12] [PASSED] ABGR8888 Invalid width
[00:34:12] [PASSED] ABGR8888 Invalid buffer handle
[00:34:12] [PASSED] No pixel format
[00:34:12] [PASSED] ABGR8888 Width 0
[00:34:12] [PASSED] ABGR8888 Height 0
[00:34:12] [PASSED] ABGR8888 Out of bound height * pitch combination
[00:34:12] [PASSED] ABGR8888 Large buffer offset
[00:34:12] [PASSED] ABGR8888 Buffer offset for inexistent plane
[00:34:12] [PASSED] ABGR8888 Invalid flag
[00:34:12] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[00:34:12] [PASSED] ABGR8888 Valid buffer modifier
[00:34:12] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[00:34:12] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[00:34:12] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[00:34:12] [PASSED] NV12 Normal sizes
[00:34:12] [PASSED] NV12 Max sizes
[00:34:12] [PASSED] NV12 Invalid pitch
[00:34:12] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[00:34:12] [PASSED] NV12 different  modifier per-plane
[00:34:12] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[00:34:12] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[00:34:12] [PASSED] NV12 Modifier for inexistent plane
[00:34:12] [PASSED] NV12 Handle for inexistent plane
[00:34:12] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[00:34:12] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[00:34:12] [PASSED] YVU420 Normal sizes
[00:34:12] [PASSED] YVU420 Max sizes
[00:34:12] [PASSED] YVU420 Invalid pitch
[00:34:12] [PASSED] YVU420 Different pitches
[00:34:12] [PASSED] YVU420 Different buffer offsets/pitches
[00:34:12] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[00:34:12] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[00:34:12] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[00:34:12] [PASSED] YVU420 Valid modifier
[00:34:12] [PASSED] YVU420 Different modifiers per plane
[00:34:12] [PASSED] YVU420 Modifier for inexistent plane
[00:34:12] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[00:34:12] [PASSED] X0L2 Normal sizes
[00:34:12] [PASSED] X0L2 Max sizes
[00:34:12] [PASSED] X0L2 Invalid pitch
[00:34:12] [PASSED] X0L2 Pitch greater than minimum required
[00:34:12] [PASSED] X0L2 Handle for inexistent plane
[00:34:12] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[00:34:12] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[00:34:12] [PASSED] X0L2 Valid modifier
[00:34:12] [PASSED] X0L2 Modifier for inexistent plane
[00:34:12] =========== [PASSED] drm_test_framebuffer_create ===========
[00:34:12] [PASSED] drm_test_framebuffer_free
[00:34:12] [PASSED] drm_test_framebuffer_init
[00:34:12] [PASSED] drm_test_framebuffer_init_bad_format
[00:34:12] [PASSED] drm_test_framebuffer_init_dev_mismatch
[00:34:12] [PASSED] drm_test_framebuffer_lookup
[00:34:12] [PASSED] drm_test_framebuffer_lookup_inexistent
[00:34:12] [PASSED] drm_test_framebuffer_modifiers_not_supported
[00:34:12] ================= [PASSED] drm_framebuffer =================
[00:34:12] ================ drm_gem_shmem (8 subtests) ================
[00:34:12] [PASSED] drm_gem_shmem_test_obj_create
[00:34:12] [PASSED] drm_gem_shmem_test_obj_create_private
[00:34:12] [PASSED] drm_gem_shmem_test_pin_pages
[00:34:12] [PASSED] drm_gem_shmem_test_vmap
[00:34:12] [PASSED] drm_gem_shmem_test_get_pages_sgt
[00:34:12] [PASSED] drm_gem_shmem_test_get_sg_table
[00:34:12] [PASSED] drm_gem_shmem_test_madvise
[00:34:12] [PASSED] drm_gem_shmem_test_purge
[00:34:12] ================== [PASSED] drm_gem_shmem ==================
[00:34:12] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[00:34:12] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[00:34:12] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[00:34:12] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[00:34:12] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[00:34:12] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[00:34:12] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[00:34:12] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[00:34:12] [PASSED] Automatic
[00:34:12] [PASSED] Full
[00:34:12] [PASSED] Limited 16:235
[00:34:12] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[00:34:12] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[00:34:12] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[00:34:12] [PASSED] drm_test_check_disable_connector
[00:34:12] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[00:34:12] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[00:34:12] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[00:34:12] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[00:34:12] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[00:34:12] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[00:34:12] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[00:34:12] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[00:34:12] [PASSED] drm_test_check_output_bpc_dvi
[00:34:12] [PASSED] drm_test_check_output_bpc_format_vic_1
[00:34:12] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[00:34:12] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[00:34:12] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[00:34:12] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[00:34:12] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[00:34:12] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[00:34:12] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[00:34:12] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[00:34:12] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[00:34:12] [PASSED] drm_test_check_broadcast_rgb_value
[00:34:12] [PASSED] drm_test_check_bpc_8_value
[00:34:12] [PASSED] drm_test_check_bpc_10_value
[00:34:12] [PASSED] drm_test_check_bpc_12_value
[00:34:12] [PASSED] drm_test_check_format_value
[00:34:12] [PASSED] drm_test_check_tmds_char_value
[00:34:12] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[00:34:12] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[00:34:12] [PASSED] drm_test_check_mode_valid
[00:34:12] [PASSED] drm_test_check_mode_valid_reject
[00:34:12] [PASSED] drm_test_check_mode_valid_reject_rate
[00:34:12] [PASSED] drm_test_check_mode_valid_reject_max_clock
[00:34:12] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[00:34:12] ================= drm_managed (2 subtests) =================
[00:34:12] [PASSED] drm_test_managed_release_action
[00:34:12] [PASSED] drm_test_managed_run_action
[00:34:12] =================== [PASSED] drm_managed ===================
[00:34:12] =================== drm_mm (6 subtests) ====================
[00:34:12] [PASSED] drm_test_mm_init
[00:34:12] [PASSED] drm_test_mm_debug
[00:34:12] [PASSED] drm_test_mm_align32
[00:34:12] [PASSED] drm_test_mm_align64
[00:34:12] [PASSED] drm_test_mm_lowest
[00:34:12] [PASSED] drm_test_mm_highest
[00:34:12] ===================== [PASSED] drm_mm ======================
[00:34:12] ============= drm_modes_analog_tv (5 subtests) =============
[00:34:12] [PASSED] drm_test_modes_analog_tv_mono_576i
[00:34:12] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[00:34:12] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[00:34:12] [PASSED] drm_test_modes_analog_tv_pal_576i
[00:34:12] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[00:34:12] =============== [PASSED] drm_modes_analog_tv ===============
[00:34:12] ============== drm_plane_helper (2 subtests) ===============
[00:34:12] =============== drm_test_check_plane_state  ================
[00:34:12] [PASSED] clipping_simple
[00:34:12] [PASSED] clipping_rotate_reflect
[00:34:12] [PASSED] positioning_simple
[00:34:12] [PASSED] upscaling
[00:34:12] [PASSED] downscaling
[00:34:12] [PASSED] rounding1
[00:34:12] [PASSED] rounding2
[00:34:12] [PASSED] rounding3
[00:34:12] [PASSED] rounding4
[00:34:12] =========== [PASSED] drm_test_check_plane_state ============
[00:34:12] =========== drm_test_check_invalid_plane_state  ============
[00:34:12] [PASSED] positioning_invalid
[00:34:12] [PASSED] upscaling_invalid
[00:34:12] [PASSED] downscaling_invalid
[00:34:12] ======= [PASSED] drm_test_check_invalid_plane_state ========
[00:34:12] ================ [PASSED] drm_plane_helper =================
[00:34:12] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[00:34:12] ====== drm_test_connector_helper_tv_get_modes_check  =======
[00:34:12] [PASSED] None
[00:34:12] [PASSED] PAL
[00:34:12] [PASSED] NTSC
[00:34:12] [PASSED] Both, NTSC Default
[00:34:12] [PASSED] Both, PAL Default
[00:34:12] [PASSED] Both, NTSC Default, with PAL on command-line
[00:34:12] [PASSED] Both, PAL Default, with NTSC on command-line
[00:34:12] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[00:34:12] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[00:34:12] ================== drm_rect (9 subtests) ===================
[00:34:12] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[00:34:12] [PASSED] drm_test_rect_clip_scaled_not_clipped
[00:34:12] [PASSED] drm_test_rect_clip_scaled_clipped
[00:34:12] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[00:34:12] ================= drm_test_rect_intersect  =================
[00:34:12] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[00:34:12] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[00:34:12] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[00:34:12] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[00:34:12] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[00:34:12] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[00:34:12] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[00:34:12] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[00:34:12] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[00:34:12] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[00:34:12] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[00:34:12] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[00:34:12] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[00:34:12] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[00:34:12] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[00:34:12] ============= [PASSED] drm_test_rect_intersect =============
[00:34:12] ================ drm_test_rect_calc_hscale  ================
[00:34:12] [PASSED] normal use
[00:34:12] [PASSED] out of max range
[00:34:12] [PASSED] out of min range
[00:34:12] [PASSED] zero dst
[00:34:12] [PASSED] negative src
[00:34:12] [PASSED] negative dst
[00:34:12] ============ [PASSED] drm_test_rect_calc_hscale ============
[00:34:12] ================ drm_test_rect_calc_vscale  ================
[00:34:12] [PASSED] normal use
[00:34:12] [PASSED] out of max range
[00:34:12] [PASSED] out of min range
[00:34:12] [PASSED] zero dst
[00:34:12] [PASSED] negative src
[00:34:12] [PASSED] negative dst
[00:34:12] ============ [PASSED] drm_test_rect_calc_vscale ============
[00:34:12] ================== drm_test_rect_rotate  ===================
[00:34:12] [PASSED] reflect-x
[00:34:12] [PASSED] reflect-y
[00:34:12] [PASSED] rotate-0
[00:34:12] [PASSED] rotate-90
[00:34:12] [PASSED] rotate-180
stty: 'standard input': Inappropriate ioctl for device
[00:34:12] [PASSED] rotate-270
[00:34:12] ============== [PASSED] drm_test_rect_rotate ===============
[00:34:12] ================ drm_test_rect_rotate_inv  =================
[00:34:12] [PASSED] reflect-x
[00:34:12] [PASSED] reflect-y
[00:34:12] [PASSED] rotate-0
[00:34:12] [PASSED] rotate-90
[00:34:12] [PASSED] rotate-180
[00:34:12] [PASSED] rotate-270
[00:34:12] ============ [PASSED] drm_test_rect_rotate_inv =============
[00:34:12] ==================== [PASSED] drm_rect =====================
[00:34:12] ============================================================
[00:34:12] Testing complete. Ran 614 tests: passed: 614
[00:34:12] Elapsed time: 23.291s total, 1.648s configuring, 21.427s building, 0.197s running

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

[00:34:12] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:34:14] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


