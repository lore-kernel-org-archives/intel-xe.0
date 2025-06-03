Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC624C5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 20:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C3210E12A;
	Tue,  3 Jun 2025 20:28:00 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B44110E12A;
 Tue,  3 Jun 2025 20:27:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Enable_media_OA?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Jun 2025 20:27:59 -0000
Message-ID: <174898247923.45504.12429032361025907570@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603202133.2713863-1-ashutosh.dixit@intel.com>
In-Reply-To: <20250603202133.2713863-1-ashutosh.dixit@intel.com>
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

Series: Enable media OA
URL   : https://patchwork.freedesktop.org/series/149806/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[20:26:54] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:26:58] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[20:27:25] Starting KUnit Kernel (1/1)...
[20:27:25] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[20:27:25] ================== guc_buf (11 subtests) ===================
[20:27:25] [PASSED] test_smallest
[20:27:25] [PASSED] test_largest
[20:27:25] [PASSED] test_granular
[20:27:25] [PASSED] test_unique
[20:27:25] [PASSED] test_overlap
[20:27:25] [PASSED] test_reusable
[20:27:25] [PASSED] test_too_big
[20:27:25] [PASSED] test_flush
[20:27:25] [PASSED] test_lookup
[20:27:25] [PASSED] test_data
[20:27:25] [PASSED] test_class
[20:27:25] ===================== [PASSED] guc_buf =====================
[20:27:25] =================== guc_dbm (7 subtests) ===================
[20:27:25] [PASSED] test_empty
[20:27:25] [PASSED] test_default
[20:27:25] ======================== test_size  ========================
[20:27:25] [PASSED] 4
[20:27:25] [PASSED] 8
[20:27:25] [PASSED] 32
[20:27:25] [PASSED] 256
[20:27:25] ==================== [PASSED] test_size ====================
[20:27:25] ======================= test_reuse  ========================
[20:27:25] [PASSED] 4
[20:27:25] [PASSED] 8
[20:27:25] [PASSED] 32
[20:27:25] [PASSED] 256
[20:27:25] =================== [PASSED] test_reuse ====================
[20:27:25] =================== test_range_overlap  ====================
[20:27:25] [PASSED] 4
[20:27:25] [PASSED] 8
[20:27:25] [PASSED] 32
[20:27:25] [PASSED] 256
[20:27:25] =============== [PASSED] test_range_overlap ================
[20:27:25] =================== test_range_compact  ====================
[20:27:25] [PASSED] 4
[20:27:25] [PASSED] 8
[20:27:25] [PASSED] 32
[20:27:25] [PASSED] 256
[20:27:25] =============== [PASSED] test_range_compact ================
[20:27:25] ==================== test_range_spare  =====================
[20:27:25] [PASSED] 4
[20:27:25] [PASSED] 8
[20:27:25] [PASSED] 32
[20:27:25] [PASSED] 256
[20:27:25] ================ [PASSED] test_range_spare =================
[20:27:25] ===================== [PASSED] guc_dbm =====================
[20:27:25] =================== guc_idm (6 subtests) ===================
[20:27:25] [PASSED] bad_init
[20:27:25] [PASSED] no_init
[20:27:25] [PASSED] init_fini
[20:27:25] [PASSED] check_used
[20:27:25] [PASSED] check_quota
[20:27:25] [PASSED] check_all
[20:27:25] ===================== [PASSED] guc_idm =====================
[20:27:25] ================== no_relay (3 subtests) ===================
[20:27:25] [PASSED] xe_drops_guc2pf_if_not_ready
[20:27:25] [PASSED] xe_drops_guc2vf_if_not_ready
[20:27:25] [PASSED] xe_rejects_send_if_not_ready
[20:27:25] ==================== [PASSED] no_relay =====================
[20:27:25] ================== pf_relay (14 subtests) ==================
[20:27:25] [PASSED] pf_rejects_guc2pf_too_short
[20:27:25] [PASSED] pf_rejects_guc2pf_too_long
[20:27:25] [PASSED] pf_rejects_guc2pf_no_payload
[20:27:25] [PASSED] pf_fails_no_payload
[20:27:25] [PASSED] pf_fails_bad_origin
[20:27:25] [PASSED] pf_fails_bad_type
[20:27:25] [PASSED] pf_txn_reports_error
[20:27:25] [PASSED] pf_txn_sends_pf2guc
[20:27:25] [PASSED] pf_sends_pf2guc
[20:27:25] [SKIPPED] pf_loopback_nop
[20:27:25] [SKIPPED] pf_loopback_echo
[20:27:25] [SKIPPED] pf_loopback_fail
[20:27:25] [SKIPPED] pf_loopback_busy
[20:27:25] [SKIPPED] pf_loopback_retry
[20:27:25] ==================== [PASSED] pf_relay =====================
[20:27:25] ================== vf_relay (3 subtests) ===================
[20:27:25] [PASSED] vf_rejects_guc2vf_too_short
[20:27:25] [PASSED] vf_rejects_guc2vf_too_long
[20:27:25] [PASSED] vf_rejects_guc2vf_no_payload
[20:27:25] ==================== [PASSED] vf_relay =====================
[20:27:25] ================= pf_service (11 subtests) =================
[20:27:25] [PASSED] pf_negotiate_any
[20:27:25] [PASSED] pf_negotiate_base_match
[20:27:25] [PASSED] pf_negotiate_base_newer
[20:27:25] [PASSED] pf_negotiate_base_next
[20:27:25] [SKIPPED] pf_negotiate_base_older
[20:27:25] [PASSED] pf_negotiate_base_prev
[20:27:25] [PASSED] pf_negotiate_latest_match
[20:27:25] [PASSED] pf_negotiate_latest_newer
[20:27:25] [PASSED] pf_negotiate_latest_next
[20:27:25] [SKIPPED] pf_negotiate_latest_older
[20:27:25] [SKIPPED] pf_negotiate_latest_prev
[20:27:25] =================== [PASSED] pf_service ====================
[20:27:25] ===================== lmtt (1 subtest) =====================
[20:27:25] ======================== test_ops  =========================
[20:27:25] [PASSED] 2-level
[20:27:25] [PASSED] multi-level
[20:27:25] ==================== [PASSED] test_ops =====================
[20:27:25] ====================== [PASSED] lmtt =======================
[20:27:25] =================== xe_mocs (2 subtests) ===================
[20:27:25] ================ xe_live_mocs_kernel_kunit  ================
[20:27:25] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[20:27:25] ================ xe_live_mocs_reset_kunit  =================
[20:27:25] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[20:27:25] ==================== [SKIPPED] xe_mocs =====================
[20:27:25] ================= xe_migrate (2 subtests) ==================
[20:27:25] ================= xe_migrate_sanity_kunit  =================
[20:27:25] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[20:27:25] ================== xe_validate_ccs_kunit  ==================
[20:27:25] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[20:27:25] =================== [SKIPPED] xe_migrate ===================
[20:27:25] ================== xe_dma_buf (1 subtest) ==================
[20:27:25] ==================== xe_dma_buf_kunit  =====================
[20:27:25] ================ [SKIPPED] xe_dma_buf_kunit ================
[20:27:25] =================== [SKIPPED] xe_dma_buf ===================
[20:27:25] ================= xe_bo_shrink (1 subtest) =================
[20:27:25] =================== xe_bo_shrink_kunit  ====================
[20:27:25] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[20:27:25] ================== [SKIPPED] xe_bo_shrink ==================
[20:27:25] ==================== xe_bo (2 subtests) ====================
[20:27:25] ================== xe_ccs_migrate_kunit  ===================
[20:27:25] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[20:27:25] ==================== xe_bo_evict_kunit  ====================
[20:27:25] =============== [SKIPPED] xe_bo_evict_kunit ================
[20:27:25] ===================== [SKIPPED] xe_bo ======================
[20:27:25] ==================== args (11 subtests) ====================
[20:27:25] [PASSED] count_args_test
[20:27:25] [PASSED] call_args_example
[20:27:25] [PASSED] call_args_test
[20:27:25] [PASSED] drop_first_arg_example
[20:27:25] [PASSED] drop_first_arg_test
[20:27:25] [PASSED] first_arg_example
[20:27:25] [PASSED] first_arg_test
[20:27:25] [PASSED] last_arg_example
[20:27:25] [PASSED] last_arg_test
[20:27:25] [PASSED] pick_arg_example
[20:27:25] [PASSED] sep_comma_example
[20:27:25] ====================== [PASSED] args =======================
[20:27:25] =================== xe_pci (2 subtests) ====================
[20:27:25] [PASSED] xe_gmdid_graphics_ip
[20:27:25] [PASSED] xe_gmdid_media_ip
[20:27:25] ===================== [PASSED] xe_pci ======================
[20:27:25] =================== xe_rtp (2 subtests) ====================
[20:27:25] =============== xe_rtp_process_to_sr_tests  ================
[20:27:25] [PASSED] coalesce-same-reg
[20:27:25] [PASSED] no-match-no-add
[20:27:25] [PASSED] match-or
[20:27:25] [PASSED] match-or-xfail
[20:27:25] [PASSED] no-match-no-add-multiple-rules
[20:27:25] [PASSED] two-regs-two-entries
[20:27:25] [PASSED] clr-one-set-other
[20:27:25] [PASSED] set-field
[20:27:25] [PASSED] conflict-duplicate
[20:27:25] [PASSED] conflict-not-disjoint
stty: 'standard input': Inappropriate ioctl for device
[20:27:25] [PASSED] conflict-reg-type
[20:27:25] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[20:27:25] ================== xe_rtp_process_tests  ===================
[20:27:25] [PASSED] active1
[20:27:25] [PASSED] active2
[20:27:25] [PASSED] active-inactive
[20:27:25] [PASSED] inactive-active
[20:27:25] [PASSED] inactive-1st_or_active-inactive
[20:27:25] [PASSED] inactive-2nd_or_active-inactive
[20:27:25] [PASSED] inactive-last_or_active-inactive
[20:27:25] [PASSED] inactive-no_or_active-inactive
[20:27:25] ============== [PASSED] xe_rtp_process_tests ===============
[20:27:25] ===================== [PASSED] xe_rtp ======================
[20:27:25] ==================== xe_wa (1 subtest) =====================
[20:27:25] ======================== xe_wa_gt  =========================
[20:27:25] [PASSED] TIGERLAKE (B0)
[20:27:25] [PASSED] DG1 (A0)
[20:27:25] [PASSED] DG1 (B0)
[20:27:25] [PASSED] ALDERLAKE_S (A0)
[20:27:25] [PASSED] ALDERLAKE_S (B0)
[20:27:25] [PASSED] ALDERLAKE_S (C0)
[20:27:25] [PASSED] ALDERLAKE_S (D0)
[20:27:25] [PASSED] ALDERLAKE_P (A0)
[20:27:25] [PASSED] ALDERLAKE_P (B0)
[20:27:25] [PASSED] ALDERLAKE_P (C0)
[20:27:25] [PASSED] ALDERLAKE_S_RPLS (D0)
[20:27:25] [PASSED] ALDERLAKE_P_RPLU (E0)
[20:27:25] [PASSED] DG2_G10 (C0)
[20:27:25] [PASSED] DG2_G11 (B1)
[20:27:25] [PASSED] DG2_G12 (A1)
[20:27:25] [PASSED] METEORLAKE (g:A0, m:A0)
[20:27:25] [PASSED] METEORLAKE (g:A0, m:A0)
[20:27:25] [PASSED] METEORLAKE (g:A0, m:A0)
[20:27:25] [PASSED] LUNARLAKE (g:A0, m:A0)
[20:27:25] [PASSED] LUNARLAKE (g:B0, m:A0)
[20:27:25] [PASSED] BATTLEMAGE (g:A0, m:A1)
[20:27:25] ==================== [PASSED] xe_wa_gt =====================
[20:27:25] ====================== [PASSED] xe_wa ======================
[20:27:25] ============================================================
[20:27:25] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[20:27:25] Elapsed time: 31.022s total, 4.144s configuring, 26.561s building, 0.297s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[20:27:25] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:27:27] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[20:27:48] Starting KUnit Kernel (1/1)...
[20:27:48] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[20:27:48] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[20:27:48] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[20:27:48] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[20:27:48] =========== drm_validate_clone_mode (2 subtests) ===========
[20:27:48] ============== drm_test_check_in_clone_mode  ===============
[20:27:48] [PASSED] in_clone_mode
[20:27:48] [PASSED] not_in_clone_mode
[20:27:48] ========== [PASSED] drm_test_check_in_clone_mode ===========
[20:27:48] =============== drm_test_check_valid_clones  ===============
[20:27:48] [PASSED] not_in_clone_mode
[20:27:48] [PASSED] valid_clone
[20:27:48] [PASSED] invalid_clone
[20:27:48] =========== [PASSED] drm_test_check_valid_clones ===========
[20:27:48] ============= [PASSED] drm_validate_clone_mode =============
[20:27:48] ============= drm_validate_modeset (1 subtest) =============
[20:27:48] [PASSED] drm_test_check_connector_changed_modeset
[20:27:48] ============== [PASSED] drm_validate_modeset ===============
[20:27:48] ====== drm_test_bridge_get_current_state (2 subtests) ======
[20:27:48] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[20:27:48] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[20:27:48] ======== [PASSED] drm_test_bridge_get_current_state ========
[20:27:48] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[20:27:48] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[20:27:48] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[20:27:48] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[20:27:48] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[20:27:48] ================== drm_buddy (7 subtests) ==================
[20:27:48] [PASSED] drm_test_buddy_alloc_limit
[20:27:48] [PASSED] drm_test_buddy_alloc_optimistic
[20:27:48] [PASSED] drm_test_buddy_alloc_pessimistic
[20:27:48] [PASSED] drm_test_buddy_alloc_pathological
[20:27:48] [PASSED] drm_test_buddy_alloc_contiguous
[20:27:48] [PASSED] drm_test_buddy_alloc_clear
[20:27:48] [PASSED] drm_test_buddy_alloc_range_bias
[20:27:48] ==================== [PASSED] drm_buddy ====================
[20:27:48] ============= drm_cmdline_parser (40 subtests) =============
[20:27:48] [PASSED] drm_test_cmdline_force_d_only
[20:27:48] [PASSED] drm_test_cmdline_force_D_only_dvi
[20:27:48] [PASSED] drm_test_cmdline_force_D_only_hdmi
[20:27:48] [PASSED] drm_test_cmdline_force_D_only_not_digital
[20:27:48] [PASSED] drm_test_cmdline_force_e_only
[20:27:48] [PASSED] drm_test_cmdline_res
[20:27:48] [PASSED] drm_test_cmdline_res_vesa
[20:27:48] [PASSED] drm_test_cmdline_res_vesa_rblank
[20:27:48] [PASSED] drm_test_cmdline_res_rblank
[20:27:48] [PASSED] drm_test_cmdline_res_bpp
[20:27:48] [PASSED] drm_test_cmdline_res_refresh
[20:27:48] [PASSED] drm_test_cmdline_res_bpp_refresh
[20:27:48] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[20:27:48] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[20:27:48] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[20:27:48] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[20:27:48] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[20:27:48] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[20:27:48] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[20:27:48] [PASSED] drm_test_cmdline_res_margins_force_on
[20:27:48] [PASSED] drm_test_cmdline_res_vesa_margins
[20:27:48] [PASSED] drm_test_cmdline_name
[20:27:48] [PASSED] drm_test_cmdline_name_bpp
[20:27:48] [PASSED] drm_test_cmdline_name_option
[20:27:48] [PASSED] drm_test_cmdline_name_bpp_option
[20:27:48] [PASSED] drm_test_cmdline_rotate_0
[20:27:48] [PASSED] drm_test_cmdline_rotate_90
[20:27:48] [PASSED] drm_test_cmdline_rotate_180
[20:27:48] [PASSED] drm_test_cmdline_rotate_270
[20:27:48] [PASSED] drm_test_cmdline_hmirror
[20:27:48] [PASSED] drm_test_cmdline_vmirror
[20:27:48] [PASSED] drm_test_cmdline_margin_options
[20:27:48] [PASSED] drm_test_cmdline_multiple_options
[20:27:48] [PASSED] drm_test_cmdline_bpp_extra_and_option
[20:27:48] [PASSED] drm_test_cmdline_extra_and_option
[20:27:48] [PASSED] drm_test_cmdline_freestanding_options
[20:27:48] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[20:27:48] [PASSED] drm_test_cmdline_panel_orientation
[20:27:48] ================ drm_test_cmdline_invalid  =================
[20:27:48] [PASSED] margin_only
[20:27:48] [PASSED] interlace_only
[20:27:48] [PASSED] res_missing_x
[20:27:48] [PASSED] res_missing_y
[20:27:48] [PASSED] res_bad_y
[20:27:48] [PASSED] res_missing_y_bpp
[20:27:48] [PASSED] res_bad_bpp
[20:27:48] [PASSED] res_bad_refresh
[20:27:48] [PASSED] res_bpp_refresh_force_on_off
[20:27:48] [PASSED] res_invalid_mode
[20:27:48] [PASSED] res_bpp_wrong_place_mode
[20:27:48] [PASSED] name_bpp_refresh
[20:27:48] [PASSED] name_refresh
[20:27:48] [PASSED] name_refresh_wrong_mode
[20:27:48] [PASSED] name_refresh_invalid_mode
[20:27:48] [PASSED] rotate_multiple
[20:27:48] [PASSED] rotate_invalid_val
[20:27:48] [PASSED] rotate_truncated
[20:27:48] [PASSED] invalid_option
[20:27:48] [PASSED] invalid_tv_option
[20:27:48] [PASSED] truncated_tv_option
[20:27:48] ============ [PASSED] drm_test_cmdline_invalid =============
[20:27:48] =============== drm_test_cmdline_tv_options  ===============
[20:27:48] [PASSED] NTSC
[20:27:48] [PASSED] NTSC_443
[20:27:48] [PASSED] NTSC_J
[20:27:48] [PASSED] PAL
[20:27:48] [PASSED] PAL_M
[20:27:48] [PASSED] PAL_N
[20:27:48] [PASSED] SECAM
[20:27:48] [PASSED] MONO_525
[20:27:48] [PASSED] MONO_625
[20:27:48] =========== [PASSED] drm_test_cmdline_tv_options ===========
[20:27:48] =============== [PASSED] drm_cmdline_parser ================
[20:27:48] ========== drmm_connector_hdmi_init (20 subtests) ==========
[20:27:48] [PASSED] drm_test_connector_hdmi_init_valid
[20:27:48] [PASSED] drm_test_connector_hdmi_init_bpc_8
[20:27:48] [PASSED] drm_test_connector_hdmi_init_bpc_10
[20:27:48] [PASSED] drm_test_connector_hdmi_init_bpc_12
[20:27:48] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[20:27:48] [PASSED] drm_test_connector_hdmi_init_bpc_null
[20:27:48] [PASSED] drm_test_connector_hdmi_init_formats_empty
[20:27:48] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[20:27:48] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[20:27:48] [PASSED] supported_formats=0x9 yuv420_allowed=1
[20:27:48] [PASSED] supported_formats=0x9 yuv420_allowed=0
[20:27:48] [PASSED] supported_formats=0x3 yuv420_allowed=1
[20:27:48] [PASSED] supported_formats=0x3 yuv420_allowed=0
[20:27:48] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[20:27:48] [PASSED] drm_test_connector_hdmi_init_null_ddc
[20:27:48] [PASSED] drm_test_connector_hdmi_init_null_product
[20:27:48] [PASSED] drm_test_connector_hdmi_init_null_vendor
[20:27:48] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[20:27:48] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[20:27:48] [PASSED] drm_test_connector_hdmi_init_product_valid
[20:27:48] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[20:27:48] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[20:27:48] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[20:27:48] ========= drm_test_connector_hdmi_init_type_valid  =========
[20:27:48] [PASSED] HDMI-A
[20:27:48] [PASSED] HDMI-B
[20:27:48] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[20:27:48] ======== drm_test_connector_hdmi_init_type_invalid  ========
[20:27:48] [PASSED] Unknown
[20:27:48] [PASSED] VGA
[20:27:48] [PASSED] DVI-I
[20:27:48] [PASSED] DVI-D
[20:27:48] [PASSED] DVI-A
[20:27:48] [PASSED] Composite
[20:27:48] [PASSED] SVIDEO
[20:27:48] [PASSED] LVDS
[20:27:48] [PASSED] Component
[20:27:48] [PASSED] DIN
[20:27:48] [PASSED] DP
[20:27:48] [PASSED] TV
[20:27:48] [PASSED] eDP
[20:27:48] [PASSED] Virtual
[20:27:48] [PASSED] DSI
[20:27:48] [PASSED] DPI
[20:27:48] [PASSED] Writeback
[20:27:48] [PASSED] SPI
[20:27:48] [PASSED] USB
[20:27:48] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[20:27:48] ============ [PASSED] drmm_connector_hdmi_init =============
[20:27:48] ============= drmm_connector_init (3 subtests) =============
[20:27:48] [PASSED] drm_test_drmm_connector_init
[20:27:48] [PASSED] drm_test_drmm_connector_init_null_ddc
[20:27:48] ========= drm_test_drmm_connector_init_type_valid  =========
[20:27:48] [PASSED] Unknown
[20:27:48] [PASSED] VGA
[20:27:48] [PASSED] DVI-I
[20:27:48] [PASSED] DVI-D
[20:27:48] [PASSED] DVI-A
[20:27:48] [PASSED] Composite
[20:27:48] [PASSED] SVIDEO
[20:27:48] [PASSED] LVDS
[20:27:48] [PASSED] Component
[20:27:48] [PASSED] DIN
[20:27:48] [PASSED] DP
[20:27:48] [PASSED] HDMI-A
[20:27:48] [PASSED] HDMI-B
[20:27:48] [PASSED] TV
[20:27:48] [PASSED] eDP
[20:27:48] [PASSED] Virtual
[20:27:48] [PASSED] DSI
[20:27:48] [PASSED] DPI
[20:27:48] [PASSED] Writeback
[20:27:48] [PASSED] SPI
[20:27:48] [PASSED] USB
[20:27:48] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[20:27:48] =============== [PASSED] drmm_connector_init ===============
[20:27:48] ========= drm_connector_dynamic_init (6 subtests) ==========
[20:27:48] [PASSED] drm_test_drm_connector_dynamic_init
[20:27:48] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[20:27:48] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[20:27:48] [PASSED] drm_test_drm_connector_dynamic_init_properties
[20:27:48] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[20:27:48] [PASSED] Unknown
[20:27:48] [PASSED] VGA
[20:27:48] [PASSED] DVI-I
[20:27:48] [PASSED] DVI-D
[20:27:48] [PASSED] DVI-A
[20:27:48] [PASSED] Composite
[20:27:48] [PASSED] SVIDEO
[20:27:48] [PASSED] LVDS
[20:27:48] [PASSED] Component
[20:27:48] [PASSED] DIN
[20:27:48] [PASSED] DP
[20:27:48] [PASSED] HDMI-A
[20:27:48] [PASSED] HDMI-B
[20:27:48] [PASSED] TV
[20:27:48] [PASSED] eDP
[20:27:48] [PASSED] Virtual
[20:27:48] [PASSED] DSI
[20:27:48] [PASSED] DPI
[20:27:48] [PASSED] Writeback
[20:27:48] [PASSED] SPI
[20:27:48] [PASSED] USB
[20:27:48] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[20:27:48] ======== drm_test_drm_connector_dynamic_init_name  =========
[20:27:48] [PASSED] Unknown
[20:27:48] [PASSED] VGA
[20:27:48] [PASSED] DVI-I
[20:27:48] [PASSED] DVI-D
[20:27:48] [PASSED] DVI-A
[20:27:48] [PASSED] Composite
[20:27:48] [PASSED] SVIDEO
[20:27:48] [PASSED] LVDS
[20:27:48] [PASSED] Component
[20:27:48] [PASSED] DIN
[20:27:48] [PASSED] DP
[20:27:48] [PASSED] HDMI-A
[20:27:48] [PASSED] HDMI-B
[20:27:48] [PASSED] TV
[20:27:48] [PASSED] eDP
[20:27:48] [PASSED] Virtual
[20:27:48] [PASSED] DSI
[20:27:48] [PASSED] DPI
[20:27:48] [PASSED] Writeback
[20:27:48] [PASSED] SPI
[20:27:48] [PASSED] USB
[20:27:48] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[20:27:48] =========== [PASSED] drm_connector_dynamic_init ============
[20:27:48] ==== drm_connector_dynamic_register_early (4 subtests) =====
[20:27:48] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[20:27:48] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[20:27:48] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[20:27:48] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[20:27:48] ====== [PASSED] drm_connector_dynamic_register_early =======
[20:27:48] ======= drm_connector_dynamic_register (7 subtests) ========
[20:27:48] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[20:27:48] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[20:27:48] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[20:27:48] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[20:27:48] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[20:27:48] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[20:27:48] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[20:27:48] ========= [PASSED] drm_connector_dynamic_register ==========
[20:27:48] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[20:27:48] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[20:27:48] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[20:27:48] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[20:27:48] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[20:27:48] ========== drm_test_get_tv_mode_from_name_valid  ===========
[20:27:48] [PASSED] NTSC
[20:27:48] [PASSED] NTSC-443
[20:27:48] [PASSED] NTSC-J
[20:27:48] [PASSED] PAL
[20:27:48] [PASSED] PAL-M
[20:27:48] [PASSED] PAL-N
[20:27:48] [PASSED] SECAM
[20:27:48] [PASSED] Mono
[20:27:48] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[20:27:48] [PASSED] drm_test_get_tv_mode_from_name_truncated
[20:27:48] ============ [PASSED] drm_get_tv_mode_from_name ============
[20:27:48] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[20:27:48] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[20:27:48] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[20:27:48] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[20:27:48] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[20:27:48] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[20:27:48] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[20:27:48] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[20:27:48] [PASSED] VIC 96
[20:27:48] [PASSED] VIC 97
[20:27:48] [PASSED] VIC 101
[20:27:48] [PASSED] VIC 102
[20:27:48] [PASSED] VIC 106
[20:27:48] [PASSED] VIC 107
[20:27:48] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[20:27:48] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[20:27:48] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[20:27:48] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[20:27:48] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[20:27:48] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[20:27:48] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[20:27:48] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[20:27:48] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[20:27:48] [PASSED] Automatic
[20:27:48] [PASSED] Full
[20:27:48] [PASSED] Limited 16:235
[20:27:48] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[20:27:48] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[20:27:48] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[20:27:48] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[20:27:48] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[20:27:48] [PASSED] RGB
[20:27:48] [PASSED] YUV 4:2:0
[20:27:48] [PASSED] YUV 4:2:2
[20:27:48] [PASSED] YUV 4:4:4
[20:27:48] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[20:27:48] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[20:27:48] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[20:27:48] ============= drm_damage_helper (21 subtests) ==============
[20:27:48] [PASSED] drm_test_damage_iter_no_damage
[20:27:48] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[20:27:48] [PASSED] drm_test_damage_iter_no_damage_src_moved
[20:27:48] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[20:27:48] [PASSED] drm_test_damage_iter_no_damage_not_visible
[20:27:48] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[20:27:48] [PASSED] drm_test_damage_iter_no_damage_no_fb
[20:27:48] [PASSED] drm_test_damage_iter_simple_damage
[20:27:48] [PASSED] drm_test_damage_iter_single_damage
[20:27:48] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[20:27:48] [PASSED] drm_test_damage_iter_single_damage_outside_src
[20:27:48] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[20:27:48] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[20:27:48] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[20:27:48] [PASSED] drm_test_damage_iter_single_damage_src_moved
[20:27:48] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[20:27:48] [PASSED] drm_test_damage_iter_damage
[20:27:48] [PASSED] drm_test_damage_iter_damage_one_intersect
[20:27:48] [PASSED] drm_test_damage_iter_damage_one_outside
[20:27:48] [PASSED] drm_test_damage_iter_damage_src_moved
[20:27:48] [PASSED] drm_test_damage_iter_damage_not_visible
[20:27:48] ================ [PASSED] drm_damage_helper ================
[20:27:48] ============== drm_dp_mst_helper (3 subtests) ==============
[20:27:48] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[20:27:48] [PASSED] Clock 154000 BPP 30 DSC disabled
[20:27:48] [PASSED] Clock 234000 BPP 30 DSC disabled
[20:27:48] [PASSED] Clock 297000 BPP 24 DSC disabled
[20:27:48] [PASSED] Clock 332880 BPP 24 DSC enabled
[20:27:48] [PASSED] Clock 324540 BPP 24 DSC enabled
[20:27:48] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[20:27:48] ============== drm_test_dp_mst_calc_pbn_div  ===============
[20:27:48] [PASSED] Link rate 2000000 lane count 4
[20:27:48] [PASSED] Link rate 2000000 lane count 2
[20:27:48] [PASSED] Link rate 2000000 lane count 1
[20:27:48] [PASSED] Link rate 1350000 lane count 4
[20:27:48] [PASSED] Link rate 1350000 lane count 2
[20:27:48] [PASSED] Link rate 1350000 lane count 1
[20:27:48] [PASSED] Link rate 1000000 lane count 4
[20:27:48] [PASSED] Link rate 1000000 lane count 2
[20:27:48] [PASSED] Link rate 1000000 lane count 1
[20:27:48] [PASSED] Link rate 810000 lane count 4
[20:27:48] [PASSED] Link rate 810000 lane count 2
[20:27:48] [PASSED] Link rate 810000 lane count 1
[20:27:48] [PASSED] Link rate 540000 lane count 4
[20:27:48] [PASSED] Link rate 540000 lane count 2
[20:27:48] [PASSED] Link rate 540000 lane count 1
[20:27:48] [PASSED] Link rate 270000 lane count 4
[20:27:48] [PASSED] Link rate 270000 lane count 2
[20:27:48] [PASSED] Link rate 270000 lane count 1
[20:27:48] [PASSED] Link rate 162000 lane count 4
[20:27:48] [PASSED] Link rate 162000 lane count 2
[20:27:48] [PASSED] Link rate 162000 lane count 1
[20:27:48] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[20:27:48] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[20:27:48] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[20:27:48] [PASSED] DP_POWER_UP_PHY with port number
[20:27:48] [PASSED] DP_POWER_DOWN_PHY with port number
[20:27:48] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[20:27:48] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[20:27:48] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[20:27:48] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[20:27:48] [PASSED] DP_QUERY_PAYLOAD with port number
[20:27:48] [PASSED] DP_QUERY_PAYLOAD with VCPI
[20:27:48] [PASSED] DP_REMOTE_DPCD_READ with port number
[20:27:48] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[20:27:48] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[20:27:48] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[20:27:48] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[20:27:48] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[20:27:48] [PASSED] DP_REMOTE_I2C_READ with port number
[20:27:48] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[20:27:48] [PASSED] DP_REMOTE_I2C_READ with transactions array
[20:27:48] [PASSED] DP_REMOTE_I2C_WRITE with port number
[20:27:48] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[20:27:48] [PASSED] DP_REMOTE_I2C_WRITE with data array
[20:27:48] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[20:27:48] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[20:27:48] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[20:27:48] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[20:27:48] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[20:27:48] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[20:27:48] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[20:27:48] ================ [PASSED] drm_dp_mst_helper ================
[20:27:48] ================== drm_exec (7 subtests) ===================
[20:27:48] [PASSED] sanitycheck
[20:27:48] [PASSED] test_lock
[20:27:48] [PASSED] test_lock_unlock
[20:27:48] [PASSED] test_duplicates
[20:27:48] [PASSED] test_prepare
[20:27:48] [PASSED] test_prepare_array
[20:27:48] [PASSED] test_multiple_loops
[20:27:48] ==================== [PASSED] drm_exec =====================
[20:27:48] =========== drm_format_helper_test (18 subtests) ===========
[20:27:48] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[20:27:48] [PASSED] single_pixel_source_buffer
[20:27:48] [PASSED] single_pixel_clip_rectangle
[20:27:48] [PASSED] well_known_colors
[20:27:48] [PASSED] destination_pitch
[20:27:48] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[20:27:48] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[20:27:48] [PASSED] single_pixel_source_buffer
[20:27:48] [PASSED] single_pixel_clip_rectangle
[20:27:48] [PASSED] well_known_colors
[20:27:48] [PASSED] destination_pitch
[20:27:48] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[20:27:48] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[20:27:48] [PASSED] single_pixel_source_buffer
[20:27:48] [PASSED] single_pixel_clip_rectangle
[20:27:48] [PASSED] well_known_colors
[20:27:48] [PASSED] destination_pitch
[20:27:48] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[20:27:48] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[20:27:48] [PASSED] single_pixel_source_buffer
[20:27:48] [PASSED] single_pixel_clip_rectangle
[20:27:48] [PASSED] well_known_colors
[20:27:48] [PASSED] destination_pitch
[20:27:48] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[20:27:48] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[20:27:48] [PASSED] single_pixel_source_buffer
[20:27:48] [PASSED] single_pixel_clip_rectangle
[20:27:48] [PASSED] well_known_colors
[20:27:48] [PASSED] destination_pitch
[20:27:48] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[20:27:48] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[20:27:48] [PASSED] single_pixel_source_buffer
[20:27:48] [PASSED] single_pixel_clip_rectangle
[20:27:48] [PASSED] well_known_colors
[20:27:48] [PASSED] destination_pitch
[20:27:48] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[20:27:48] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[20:27:48] [PASSED] single_pixel_source_buffer
[20:27:48] [PASSED] single_pixel_clip_rectangle
[20:27:48] [PASSED] well_known_colors
[20:27:48] [PASSED] destination_pitch
[20:27:48] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[20:27:48] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[20:27:48] [PASSED] single_pixel_source_buffer
[20:27:48] [PASSED] single_pixel_clip_rectangle
[20:27:48] [PASSED] well_known_colors
[20:27:48] [PASSED] destination_pitch
[20:27:48] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[20:27:48] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[20:27:48] [PASSED] single_pixel_source_buffer
[20:27:48] [PASSED] single_pixel_clip_rectangle
[20:27:48] [PASSED] well_known_colors
[20:27:48] [PASSED] destination_pitch
[20:27:48] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[20:27:48] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[20:27:48] [PASSED] single_pixel_source_buffer
[20:27:48] [PASSED] single_pixel_clip_rectangle
[20:27:48] [PASSED] well_known_colors
[20:27:48] [PASSED] destination_pitch
[20:27:48] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[20:27:48] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[20:27:48] [PASSED] single_pixel_source_buffer
[20:27:48] [PASSED] single_pixel_clip_rectangle
[20:27:48] [PASSED] well_known_colors
[20:27:48] [PASSED] destination_pitch
[20:27:48] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[20:27:48] ============== drm_test_fb_xrgb8888_to_mono  ===============
[20:27:48] [PASSED] single_pixel_source_buffer
[20:27:48] [PASSED] single_pixel_clip_rectangle
[20:27:48] [PASSED] well_known_colors
[20:27:48] [PASSED] destination_pitch
[20:27:48] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[20:27:48] ==================== drm_test_fb_swab  =====================
[20:27:48] [PASSED] single_pixel_source_buffer
[20:27:48] [PASSED] single_pixel_clip_rectangle
[20:27:48] [PASSED] well_known_colors
[20:27:48] [PASSED] destination_pitch
[20:27:48] ================ [PASSED] drm_test_fb_swab =================
[20:27:48] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[20:27:48] [PASSED] single_pixel_source_buffer
[20:27:48] [PASSED] single_pixel_clip_rectangle
[20:27:48] [PASSED] well_known_colors
[20:27:48] [PASSED] destination_pitch
[20:27:48] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[20:27:48] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[20:27:48] [PASSED] single_pixel_source_buffer
[20:27:48] [PASSED] single_pixel_clip_rectangle
[20:27:48] [PASSED] well_known_colors
[20:27:48] [PASSED] destination_pitch
[20:27:48] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[20:27:48] ================= drm_test_fb_clip_offset  =================
[20:27:48] [PASSED] pass through
[20:27:48] [PASSED] horizontal offset
[20:27:48] [PASSED] vertical offset
[20:27:48] [PASSED] horizontal and vertical offset
[20:27:48] [PASSED] horizontal offset (custom pitch)
[20:27:48] [PASSED] vertical offset (custom pitch)
[20:27:48] [PASSED] horizontal and vertical offset (custom pitch)
[20:27:48] ============= [PASSED] drm_test_fb_clip_offset =============
[20:27:48] ============== drm_test_fb_build_fourcc_list  ==============
[20:27:48] [PASSED] no native formats
[20:27:48] [PASSED] XRGB8888 as native format
[20:27:48] [PASSED] remove duplicates
[20:27:48] [PASSED] convert alpha formats
[20:27:48] [PASSED] random formats
[20:27:48] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[20:27:48] =================== drm_test_fb_memcpy  ====================
[20:27:48] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[20:27:48] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[20:27:48] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[20:27:48] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[20:27:48] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[20:27:48] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[20:27:48] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[20:27:48] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[20:27:48] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[20:27:48] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[20:27:48] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[20:27:48] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[20:27:48] =============== [PASSED] drm_test_fb_memcpy ================
[20:27:48] ============= [PASSED] drm_format_helper_test ==============
[20:27:48] ================= drm_format (18 subtests) =================
[20:27:48] [PASSED] drm_test_format_block_width_invalid
[20:27:48] [PASSED] drm_test_format_block_width_one_plane
[20:27:48] [PASSED] drm_test_format_block_width_two_plane
[20:27:48] [PASSED] drm_test_format_block_width_three_plane
[20:27:48] [PASSED] drm_test_format_block_width_tiled
[20:27:48] [PASSED] drm_test_format_block_height_invalid
[20:27:48] [PASSED] drm_test_format_block_height_one_plane
[20:27:48] [PASSED] drm_test_format_block_height_two_plane
[20:27:48] [PASSED] drm_test_format_block_height_three_plane
[20:27:48] [PASSED] drm_test_format_block_height_tiled
[20:27:48] [PASSED] drm_test_format_min_pitch_invalid
[20:27:48] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[20:27:48] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[20:27:48] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[20:27:48] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[20:27:48] [PASSED] drm_test_format_min_pitch_two_plane
[20:27:48] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[20:27:48] [PASSED] drm_test_format_min_pitch_tiled
[20:27:48] =================== [PASSED] drm_format ====================
[20:27:48] ============== drm_framebuffer (10 subtests) ===============
[20:27:48] ========== drm_test_framebuffer_check_src_coords  ==========
[20:27:48] [PASSED] Success: source fits into fb
[20:27:48] [PASSED] Fail: overflowing fb with x-axis coordinate
[20:27:48] [PASSED] Fail: overflowing fb with y-axis coordinate
[20:27:48] [PASSED] Fail: overflowing fb with source width
[20:27:48] [PASSED] Fail: overflowing fb with source height
[20:27:48] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[20:27:48] [PASSED] drm_test_framebuffer_cleanup
[20:27:48] =============== drm_test_framebuffer_create  ===============
[20:27:48] [PASSED] ABGR8888 normal sizes
[20:27:48] [PASSED] ABGR8888 max sizes
[20:27:48] [PASSED] ABGR8888 pitch greater than min required
[20:27:48] [PASSED] ABGR8888 pitch less than min required
[20:27:48] [PASSED] ABGR8888 Invalid width
[20:27:48] [PASSED] ABGR8888 Invalid buffer handle
[20:27:48] [PASSED] No pixel format
[20:27:48] [PASSED] ABGR8888 Width 0
[20:27:48] [PASSED] ABGR8888 Height 0
[20:27:48] [PASSED] ABGR8888 Out of bound height * pitch combination
[20:27:48] [PASSED] ABGR8888 Large buffer offset
[20:27:48] [PASSED] ABGR8888 Buffer offset for inexistent plane
[20:27:48] [PASSED] ABGR8888 Invalid flag
[20:27:48] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[20:27:48] [PASSED] ABGR8888 Valid buffer modifier
[20:27:48] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[20:27:48] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[20:27:48] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[20:27:48] [PASSED] NV12 Normal sizes
[20:27:48] [PASSED] NV12 Max sizes
[20:27:48] [PASSED] NV12 Invalid pitch
[20:27:48] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[20:27:48] [PASSED] NV12 different  modifier per-plane
[20:27:48] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[20:27:48] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[20:27:48] [PASSED] NV12 Modifier for inexistent plane
[20:27:48] [PASSED] NV12 Handle for inexistent plane
[20:27:48] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[20:27:48] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[20:27:48] [PASSED] YVU420 Normal sizes
[20:27:48] [PASSED] YVU420 Max sizes
[20:27:48] [PASSED] YVU420 Invalid pitch
[20:27:48] [PASSED] YVU420 Different pitches
[20:27:48] [PASSED] YVU420 Different buffer offsets/pitches
[20:27:48] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[20:27:48] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[20:27:48] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[20:27:48] [PASSED] YVU420 Valid modifier
[20:27:48] [PASSED] YVU420 Different modifiers per plane
[20:27:48] [PASSED] YVU420 Modifier for inexistent plane
[20:27:48] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[20:27:48] [PASSED] X0L2 Normal sizes
[20:27:48] [PASSED] X0L2 Max sizes
[20:27:48] [PASSED] X0L2 Invalid pitch
[20:27:48] [PASSED] X0L2 Pitch greater than minimum required
[20:27:48] [PASSED] X0L2 Handle for inexistent plane
[20:27:48] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[20:27:48] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[20:27:48] [PASSED] X0L2 Valid modifier
[20:27:48] [PASSED] X0L2 Modifier for inexistent plane
[20:27:48] =========== [PASSED] drm_test_framebuffer_create ===========
[20:27:48] [PASSED] drm_test_framebuffer_free
[20:27:48] [PASSED] drm_test_framebuffer_init
[20:27:48] [PASSED] drm_test_framebuffer_init_bad_format
[20:27:48] [PASSED] drm_test_framebuffer_init_dev_mismatch
[20:27:48] [PASSED] drm_test_framebuffer_lookup
[20:27:48] [PASSED] drm_test_framebuffer_lookup_inexistent
[20:27:48] [PASSED] drm_test_framebuffer_modifiers_not_supported
[20:27:48] ================= [PASSED] drm_framebuffer =================
[20:27:48] ================ drm_gem_shmem (8 subtests) ================
[20:27:48] [PASSED] drm_gem_shmem_test_obj_create
[20:27:48] [PASSED] drm_gem_shmem_test_obj_create_private
[20:27:48] [PASSED] drm_gem_shmem_test_pin_pages
[20:27:48] [PASSED] drm_gem_shmem_test_vmap
[20:27:48] [PASSED] drm_gem_shmem_test_get_pages_sgt
[20:27:48] [PASSED] drm_gem_shmem_test_get_sg_table
[20:27:48] [PASSED] drm_gem_shmem_test_madvise
[20:27:48] [PASSED] drm_gem_shmem_test_purge
[20:27:48] ================== [PASSED] drm_gem_shmem ==================
[20:27:48] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[20:27:48] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[20:27:48] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[20:27:48] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[20:27:48] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[20:27:48] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[20:27:48] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[20:27:48] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[20:27:48] [PASSED] Automatic
[20:27:48] [PASSED] Full
[20:27:48] [PASSED] Limited 16:235
[20:27:48] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[20:27:48] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[20:27:48] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[20:27:48] [PASSED] drm_test_check_disable_connector
[20:27:48] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[20:27:48] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[20:27:48] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[20:27:48] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[20:27:48] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[20:27:48] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[20:27:48] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[20:27:48] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[20:27:48] [PASSED] drm_test_check_output_bpc_dvi
[20:27:48] [PASSED] drm_test_check_output_bpc_format_vic_1
[20:27:48] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[20:27:48] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[20:27:48] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[20:27:48] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[20:27:48] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[20:27:48] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[20:27:48] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[20:27:48] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[20:27:48] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[20:27:48] [PASSED] drm_test_check_broadcast_rgb_value
[20:27:48] [PASSED] drm_test_check_bpc_8_value
[20:27:48] [PASSED] drm_test_check_bpc_10_value
[20:27:48] [PASSED] drm_test_check_bpc_12_value
[20:27:48] [PASSED] drm_test_check_format_value
[20:27:48] [PASSED] drm_test_check_tmds_char_value
[20:27:48] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[20:27:48] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[20:27:48] [PASSED] drm_test_check_mode_valid
[20:27:48] [PASSED] drm_test_check_mode_valid_reject
[20:27:48] [PASSED] drm_test_check_mode_valid_reject_rate
[20:27:48] [PASSED] drm_test_check_mode_valid_reject_max_clock
[20:27:48] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[20:27:48] ================= drm_managed (2 subtests) =================
[20:27:48] [PASSED] drm_test_managed_release_action
[20:27:48] [PASSED] drm_test_managed_run_action
[20:27:48] =================== [PASSED] drm_managed ===================
[20:27:48] =================== drm_mm (6 subtests) ====================
[20:27:48] [PASSED] drm_test_mm_init
[20:27:48] [PASSED] drm_test_mm_debug
[20:27:48] [PASSED] drm_test_mm_align32
[20:27:48] [PASSED] drm_test_mm_align64
[20:27:48] [PASSED] drm_test_mm_lowest
[20:27:48] [PASSED] drm_test_mm_highest
[20:27:48] ===================== [PASSED] drm_mm ======================
[20:27:48] ============= drm_modes_analog_tv (5 subtests) =============
[20:27:48] [PASSED] drm_test_modes_analog_tv_mono_576i
[20:27:48] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[20:27:48] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[20:27:48] [PASSED] drm_test_modes_analog_tv_pal_576i
[20:27:48] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[20:27:48] =============== [PASSED] drm_modes_analog_tv ===============
[20:27:48] ============== drm_plane_helper (2 subtests) ===============
[20:27:48] =============== drm_test_check_plane_state  ================
[20:27:48] [PASSED] clipping_simple
[20:27:48] [PASSED] clipping_rotate_reflect
[20:27:48] [PASSED] positioning_simple
[20:27:48] [PASSED] upscaling
[20:27:48] [PASSED] downscaling
[20:27:48] [PASSED] rounding1
[20:27:48] [PASSED] rounding2
[20:27:48] [PASSED] rounding3
[20:27:48] [PASSED] rounding4
[20:27:48] =========== [PASSED] drm_test_check_plane_state ============
[20:27:48] =========== drm_test_check_invalid_plane_state  ============
[20:27:48] [PASSED] positioning_invalid
[20:27:48] [PASSED] upscaling_invalid
[20:27:48] [PASSED] downscaling_invalid
[20:27:48] ======= [PASSED] drm_test_check_invalid_plane_state ========
[20:27:48] ================ [PASSED] drm_plane_helper =================
[20:27:48] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[20:27:48] ====== drm_test_connector_helper_tv_get_modes_check  =======
[20:27:48] [PASSED] None
[20:27:48] [PASSED] PAL
[20:27:48] [PASSED] NTSC
[20:27:48] [PASSED] Both, NTSC Default
[20:27:48] [PASSED] Both, PAL Default
[20:27:48] [PASSED] Both, NTSC Default, with PAL on command-line
[20:27:48] [PASSED] Both, PAL Default, with NTSC on command-line
[20:27:48] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[20:27:48] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[20:27:48] ================== drm_rect (9 subtests) ===================
[20:27:48] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[20:27:48] [PASSED] drm_test_rect_clip_scaled_not_clipped
[20:27:48] [PASSED] drm_test_rect_clip_scaled_clipped
[20:27:48] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[20:27:48] ================= drm_test_rect_intersect  =================
[20:27:48] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[20:27:48] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[20:27:48] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[20:27:48] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[20:27:48] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[20:27:48] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[20:27:48] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[20:27:48] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[20:27:48] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[20:27:48] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[20:27:48] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[20:27:48] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[20:27:48] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[20:27:48] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[20:27:48] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[20:27:48] ============= [PASSED] drm_test_rect_intersect =============
[20:27:48] ================ drm_test_rect_calc_hscale  ================
[20:27:48] [PASSED] normal use
[20:27:48] [PASSED] out of max range
[20:27:48] [PASSED] out of min range
[20:27:48] [PASSED] zero dst
[20:27:48] [PASSED] negative src
[20:27:48] [PASSED] negative dst
[20:27:48] ============ [PASSED] drm_test_rect_calc_hscale ============
[20:27:48] ================ drm_test_rect_calc_vscale  ================
[20:27:48] [PASSED] normal use
[20:27:48] [PASSED] out of max range
[20:27:48] [PASSED] out of min range
[20:27:48] [PASSED] zero dst
[20:27:48] [PASSED] negative src
[20:27:48] [PASSED] negative dst
[20:27:48] ============ [PASSED] drm_test_rect_calc_vscale ============
[20:27:48] ================== drm_test_rect_rotate  ===================
[20:27:48] [PASSED] reflect-x
[20:27:48] [PASSED] reflect-y
[20:27:48] [PASSED] rotate-0
[20:27:48] [PASSED] rotate-90
[20:27:48] [PASSED] rotate-180
stty: 'standard input': Inappropriate ioctl for device
[20:27:48] [PASSED] rotate-270
[20:27:48] ============== [PASSED] drm_test_rect_rotate ===============
[20:27:48] ================ drm_test_rect_rotate_inv  =================
[20:27:48] [PASSED] reflect-x
[20:27:48] [PASSED] reflect-y
[20:27:48] [PASSED] rotate-0
[20:27:48] [PASSED] rotate-90
[20:27:48] [PASSED] rotate-180
[20:27:48] [PASSED] rotate-270
[20:27:48] ============ [PASSED] drm_test_rect_rotate_inv =============
[20:27:48] ==================== [PASSED] drm_rect =====================
[20:27:48] ============================================================
[20:27:48] Testing complete. Ran 614 tests: passed: 614
[20:27:48] Elapsed time: 23.159s total, 1.651s configuring, 21.340s building, 0.150s running

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

[20:27:48] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:27:50] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


