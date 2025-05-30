Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFE9C5B543
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 11:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598A410E826;
	Fri, 30 May 2025 11:14:36 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB9D10E813;
 Fri, 30 May 2025 11:14:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/hwmon=3A_Add_mailbox_po?=
 =?utf-8?q?wer_limits=2C_PL2=2C_read_energy_from_PMT_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 May 2025 11:14:34 -0000
Message-ID: <174860367485.34978.13527493958677226201@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250529163458.2354509-1-karthik.poosa@intel.com>
In-Reply-To: <20250529163458.2354509-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Add mailbox power limits, PL2, read energy from PMT (rev2)
URL   : https://patchwork.freedesktop.org/series/149651/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[11:13:27] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:13:31] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[11:13:57] Starting KUnit Kernel (1/1)...
[11:13:57] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[11:13:57] ================== guc_buf (11 subtests) ===================
[11:13:57] [PASSED] test_smallest
[11:13:57] [PASSED] test_largest
[11:13:57] [PASSED] test_granular
[11:13:57] [PASSED] test_unique
[11:13:57] [PASSED] test_overlap
[11:13:57] [PASSED] test_reusable
[11:13:57] [PASSED] test_too_big
[11:13:57] [PASSED] test_flush
[11:13:57] [PASSED] test_lookup
[11:13:57] [PASSED] test_data
[11:13:57] [PASSED] test_class
[11:13:57] ===================== [PASSED] guc_buf =====================
[11:13:57] =================== guc_dbm (7 subtests) ===================
[11:13:57] [PASSED] test_empty
[11:13:57] [PASSED] test_default
[11:13:57] ======================== test_size  ========================
[11:13:57] [PASSED] 4
[11:13:57] [PASSED] 8
[11:13:57] [PASSED] 32
[11:13:57] [PASSED] 256
[11:13:57] ==================== [PASSED] test_size ====================
[11:13:57] ======================= test_reuse  ========================
[11:13:57] [PASSED] 4
[11:13:57] [PASSED] 8
[11:13:57] [PASSED] 32
[11:13:57] [PASSED] 256
[11:13:57] =================== [PASSED] test_reuse ====================
[11:13:57] =================== test_range_overlap  ====================
[11:13:57] [PASSED] 4
[11:13:57] [PASSED] 8
[11:13:57] [PASSED] 32
[11:13:57] [PASSED] 256
[11:13:57] =============== [PASSED] test_range_overlap ================
[11:13:57] =================== test_range_compact  ====================
[11:13:57] [PASSED] 4
[11:13:57] [PASSED] 8
[11:13:57] [PASSED] 32
[11:13:57] [PASSED] 256
[11:13:57] =============== [PASSED] test_range_compact ================
[11:13:57] ==================== test_range_spare  =====================
[11:13:57] [PASSED] 4
[11:13:57] [PASSED] 8
[11:13:57] [PASSED] 32
[11:13:57] [PASSED] 256
[11:13:57] ================ [PASSED] test_range_spare =================
[11:13:57] ===================== [PASSED] guc_dbm =====================
[11:13:57] =================== guc_idm (6 subtests) ===================
[11:13:57] [PASSED] bad_init
[11:13:57] [PASSED] no_init
[11:13:57] [PASSED] init_fini
[11:13:57] [PASSED] check_used
[11:13:58] [PASSED] check_quota
[11:13:58] [PASSED] check_all
[11:13:58] ===================== [PASSED] guc_idm =====================
[11:13:58] ================== no_relay (3 subtests) ===================
[11:13:58] [PASSED] xe_drops_guc2pf_if_not_ready
[11:13:58] [PASSED] xe_drops_guc2vf_if_not_ready
[11:13:58] [PASSED] xe_rejects_send_if_not_ready
[11:13:58] ==================== [PASSED] no_relay =====================
[11:13:58] ================== pf_relay (14 subtests) ==================
[11:13:58] [PASSED] pf_rejects_guc2pf_too_short
[11:13:58] [PASSED] pf_rejects_guc2pf_too_long
[11:13:58] [PASSED] pf_rejects_guc2pf_no_payload
[11:13:58] [PASSED] pf_fails_no_payload
[11:13:58] [PASSED] pf_fails_bad_origin
[11:13:58] [PASSED] pf_fails_bad_type
[11:13:58] [PASSED] pf_txn_reports_error
[11:13:58] [PASSED] pf_txn_sends_pf2guc
[11:13:58] [PASSED] pf_sends_pf2guc
[11:13:58] [SKIPPED] pf_loopback_nop
[11:13:58] [SKIPPED] pf_loopback_echo
[11:13:58] [SKIPPED] pf_loopback_fail
[11:13:58] [SKIPPED] pf_loopback_busy
[11:13:58] [SKIPPED] pf_loopback_retry
[11:13:58] ==================== [PASSED] pf_relay =====================
[11:13:58] ================== vf_relay (3 subtests) ===================
[11:13:58] [PASSED] vf_rejects_guc2vf_too_short
[11:13:58] [PASSED] vf_rejects_guc2vf_too_long
[11:13:58] [PASSED] vf_rejects_guc2vf_no_payload
[11:13:58] ==================== [PASSED] vf_relay =====================
[11:13:58] ================= pf_service (11 subtests) =================
[11:13:58] [PASSED] pf_negotiate_any
[11:13:58] [PASSED] pf_negotiate_base_match
[11:13:58] [PASSED] pf_negotiate_base_newer
[11:13:58] [PASSED] pf_negotiate_base_next
[11:13:58] [SKIPPED] pf_negotiate_base_older
[11:13:58] [PASSED] pf_negotiate_base_prev
[11:13:58] [PASSED] pf_negotiate_latest_match
[11:13:58] [PASSED] pf_negotiate_latest_newer
[11:13:58] [PASSED] pf_negotiate_latest_next
[11:13:58] [SKIPPED] pf_negotiate_latest_older
[11:13:58] [SKIPPED] pf_negotiate_latest_prev
[11:13:58] =================== [PASSED] pf_service ====================
[11:13:58] ===================== lmtt (1 subtest) =====================
[11:13:58] ======================== test_ops  =========================
[11:13:58] [PASSED] 2-level
[11:13:58] [PASSED] multi-level
[11:13:58] ==================== [PASSED] test_ops =====================
[11:13:58] ====================== [PASSED] lmtt =======================
[11:13:58] =================== xe_mocs (2 subtests) ===================
[11:13:58] ================ xe_live_mocs_kernel_kunit  ================
[11:13:58] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[11:13:58] ================ xe_live_mocs_reset_kunit  =================
[11:13:58] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[11:13:58] ==================== [SKIPPED] xe_mocs =====================
[11:13:58] ================= xe_migrate (2 subtests) ==================
[11:13:58] ================= xe_migrate_sanity_kunit  =================
[11:13:58] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[11:13:58] ================== xe_validate_ccs_kunit  ==================
[11:13:58] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[11:13:58] =================== [SKIPPED] xe_migrate ===================
[11:13:58] ================== xe_dma_buf (1 subtest) ==================
[11:13:58] ==================== xe_dma_buf_kunit  =====================
[11:13:58] ================ [SKIPPED] xe_dma_buf_kunit ================
[11:13:58] =================== [SKIPPED] xe_dma_buf ===================
[11:13:58] ================= xe_bo_shrink (1 subtest) =================
[11:13:58] =================== xe_bo_shrink_kunit  ====================
[11:13:58] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[11:13:58] ================== [SKIPPED] xe_bo_shrink ==================
[11:13:58] ==================== xe_bo (2 subtests) ====================
[11:13:58] ================== xe_ccs_migrate_kunit  ===================
[11:13:58] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[11:13:58] ==================== xe_bo_evict_kunit  ====================
[11:13:58] =============== [SKIPPED] xe_bo_evict_kunit ================
[11:13:58] ===================== [SKIPPED] xe_bo ======================
[11:13:58] ==================== args (11 subtests) ====================
[11:13:58] [PASSED] count_args_test
[11:13:58] [PASSED] call_args_example
[11:13:58] [PASSED] call_args_test
[11:13:58] [PASSED] drop_first_arg_example
[11:13:58] [PASSED] drop_first_arg_test
[11:13:58] [PASSED] first_arg_example
[11:13:58] [PASSED] first_arg_test
[11:13:58] [PASSED] last_arg_example
[11:13:58] [PASSED] last_arg_test
[11:13:58] [PASSED] pick_arg_example
[11:13:58] [PASSED] sep_comma_example
[11:13:58] ====================== [PASSED] args =======================
[11:13:58] =================== xe_pci (2 subtests) ====================
[11:13:58] [PASSED] xe_gmdid_graphics_ip
[11:13:58] [PASSED] xe_gmdid_media_ip
[11:13:58] ===================== [PASSED] xe_pci ======================
[11:13:58] =================== xe_rtp (2 subtests) ====================
[11:13:58] =============== xe_rtp_process_to_sr_tests  ================
[11:13:58] [PASSED] coalesce-same-reg
[11:13:58] [PASSED] no-match-no-add
[11:13:58] [PASSED] match-or
[11:13:58] [PASSED] match-or-xfail
[11:13:58] [PASSED] no-match-no-add-multiple-rules
[11:13:58] [PASSED] two-regs-two-entries
[11:13:58] [PASSED] clr-one-set-other
[11:13:58] [PASSED] set-field
[11:13:58] [PASSED] conflict-duplicate
[11:13:58] [PASSED] conflict-not-disjoint
stty: 'standard input': Inappropriate ioctl for device
[11:13:58] [PASSED] conflict-reg-type
[11:13:58] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[11:13:58] ================== xe_rtp_process_tests  ===================
[11:13:58] [PASSED] active1
[11:13:58] [PASSED] active2
[11:13:58] [PASSED] active-inactive
[11:13:58] [PASSED] inactive-active
[11:13:58] [PASSED] inactive-1st_or_active-inactive
[11:13:58] [PASSED] inactive-2nd_or_active-inactive
[11:13:58] [PASSED] inactive-last_or_active-inactive
[11:13:58] [PASSED] inactive-no_or_active-inactive
[11:13:58] ============== [PASSED] xe_rtp_process_tests ===============
[11:13:58] ===================== [PASSED] xe_rtp ======================
[11:13:58] ==================== xe_wa (1 subtest) =====================
[11:13:58] ======================== xe_wa_gt  =========================
[11:13:58] [PASSED] TIGERLAKE (B0)
[11:13:58] [PASSED] DG1 (A0)
[11:13:58] [PASSED] DG1 (B0)
[11:13:58] [PASSED] ALDERLAKE_S (A0)
[11:13:58] [PASSED] ALDERLAKE_S (B0)
[11:13:58] [PASSED] ALDERLAKE_S (C0)
[11:13:58] [PASSED] ALDERLAKE_S (D0)
[11:13:58] [PASSED] ALDERLAKE_P (A0)
[11:13:58] [PASSED] ALDERLAKE_P (B0)
[11:13:58] [PASSED] ALDERLAKE_P (C0)
[11:13:58] [PASSED] ALDERLAKE_S_RPLS (D0)
[11:13:58] [PASSED] ALDERLAKE_P_RPLU (E0)
[11:13:58] [PASSED] DG2_G10 (C0)
[11:13:58] [PASSED] DG2_G11 (B1)
[11:13:58] [PASSED] DG2_G12 (A1)
[11:13:58] [PASSED] METEORLAKE (g:A0, m:A0)
[11:13:58] [PASSED] METEORLAKE (g:A0, m:A0)
[11:13:58] [PASSED] METEORLAKE (g:A0, m:A0)
[11:13:58] [PASSED] LUNARLAKE (g:A0, m:A0)
[11:13:58] [PASSED] LUNARLAKE (g:B0, m:A0)
[11:13:58] [PASSED] BATTLEMAGE (g:A0, m:A1)
[11:13:58] ==================== [PASSED] xe_wa_gt =====================
[11:13:58] ====================== [PASSED] xe_wa ======================
[11:13:58] ============================================================
[11:13:58] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[11:13:58] Elapsed time: 30.983s total, 4.136s configuring, 26.481s building, 0.315s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[11:13:58] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:13:59] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[11:14:21] Starting KUnit Kernel (1/1)...
[11:14:21] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[11:14:21] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[11:14:21] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[11:14:21] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[11:14:21] =========== drm_validate_clone_mode (2 subtests) ===========
[11:14:21] ============== drm_test_check_in_clone_mode  ===============
[11:14:21] [PASSED] in_clone_mode
[11:14:21] [PASSED] not_in_clone_mode
[11:14:21] ========== [PASSED] drm_test_check_in_clone_mode ===========
[11:14:21] =============== drm_test_check_valid_clones  ===============
[11:14:21] [PASSED] not_in_clone_mode
[11:14:21] [PASSED] valid_clone
[11:14:21] [PASSED] invalid_clone
[11:14:21] =========== [PASSED] drm_test_check_valid_clones ===========
[11:14:21] ============= [PASSED] drm_validate_clone_mode =============
[11:14:21] ============= drm_validate_modeset (1 subtest) =============
[11:14:21] [PASSED] drm_test_check_connector_changed_modeset
[11:14:21] ============== [PASSED] drm_validate_modeset ===============
[11:14:21] ====== drm_test_bridge_get_current_state (2 subtests) ======
[11:14:21] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[11:14:21] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[11:14:21] ======== [PASSED] drm_test_bridge_get_current_state ========
[11:14:21] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[11:14:21] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[11:14:21] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[11:14:21] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[11:14:21] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[11:14:21] ================== drm_buddy (7 subtests) ==================
[11:14:21] [PASSED] drm_test_buddy_alloc_limit
[11:14:21] [PASSED] drm_test_buddy_alloc_optimistic
[11:14:21] [PASSED] drm_test_buddy_alloc_pessimistic
[11:14:21] [PASSED] drm_test_buddy_alloc_pathological
[11:14:21] [PASSED] drm_test_buddy_alloc_contiguous
[11:14:21] [PASSED] drm_test_buddy_alloc_clear
[11:14:21] [PASSED] drm_test_buddy_alloc_range_bias
[11:14:21] ==================== [PASSED] drm_buddy ====================
[11:14:21] ============= drm_cmdline_parser (40 subtests) =============
[11:14:21] [PASSED] drm_test_cmdline_force_d_only
[11:14:21] [PASSED] drm_test_cmdline_force_D_only_dvi
[11:14:21] [PASSED] drm_test_cmdline_force_D_only_hdmi
[11:14:21] [PASSED] drm_test_cmdline_force_D_only_not_digital
[11:14:21] [PASSED] drm_test_cmdline_force_e_only
[11:14:21] [PASSED] drm_test_cmdline_res
[11:14:21] [PASSED] drm_test_cmdline_res_vesa
[11:14:21] [PASSED] drm_test_cmdline_res_vesa_rblank
[11:14:21] [PASSED] drm_test_cmdline_res_rblank
[11:14:21] [PASSED] drm_test_cmdline_res_bpp
[11:14:21] [PASSED] drm_test_cmdline_res_refresh
[11:14:21] [PASSED] drm_test_cmdline_res_bpp_refresh
[11:14:21] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[11:14:21] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[11:14:21] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[11:14:21] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[11:14:21] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[11:14:21] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[11:14:21] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[11:14:21] [PASSED] drm_test_cmdline_res_margins_force_on
[11:14:21] [PASSED] drm_test_cmdline_res_vesa_margins
[11:14:21] [PASSED] drm_test_cmdline_name
[11:14:21] [PASSED] drm_test_cmdline_name_bpp
[11:14:21] [PASSED] drm_test_cmdline_name_option
[11:14:21] [PASSED] drm_test_cmdline_name_bpp_option
[11:14:21] [PASSED] drm_test_cmdline_rotate_0
[11:14:21] [PASSED] drm_test_cmdline_rotate_90
[11:14:21] [PASSED] drm_test_cmdline_rotate_180
[11:14:21] [PASSED] drm_test_cmdline_rotate_270
[11:14:21] [PASSED] drm_test_cmdline_hmirror
[11:14:21] [PASSED] drm_test_cmdline_vmirror
[11:14:21] [PASSED] drm_test_cmdline_margin_options
[11:14:21] [PASSED] drm_test_cmdline_multiple_options
[11:14:21] [PASSED] drm_test_cmdline_bpp_extra_and_option
[11:14:21] [PASSED] drm_test_cmdline_extra_and_option
[11:14:21] [PASSED] drm_test_cmdline_freestanding_options
[11:14:21] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[11:14:21] [PASSED] drm_test_cmdline_panel_orientation
[11:14:21] ================ drm_test_cmdline_invalid  =================
[11:14:21] [PASSED] margin_only
[11:14:21] [PASSED] interlace_only
[11:14:21] [PASSED] res_missing_x
[11:14:21] [PASSED] res_missing_y
[11:14:21] [PASSED] res_bad_y
[11:14:21] [PASSED] res_missing_y_bpp
[11:14:21] [PASSED] res_bad_bpp
[11:14:21] [PASSED] res_bad_refresh
[11:14:21] [PASSED] res_bpp_refresh_force_on_off
[11:14:21] [PASSED] res_invalid_mode
[11:14:21] [PASSED] res_bpp_wrong_place_mode
[11:14:21] [PASSED] name_bpp_refresh
[11:14:21] [PASSED] name_refresh
[11:14:21] [PASSED] name_refresh_wrong_mode
[11:14:21] [PASSED] name_refresh_invalid_mode
[11:14:21] [PASSED] rotate_multiple
[11:14:21] [PASSED] rotate_invalid_val
[11:14:21] [PASSED] rotate_truncated
[11:14:21] [PASSED] invalid_option
[11:14:21] [PASSED] invalid_tv_option
[11:14:21] [PASSED] truncated_tv_option
[11:14:21] ============ [PASSED] drm_test_cmdline_invalid =============
[11:14:21] =============== drm_test_cmdline_tv_options  ===============
[11:14:21] [PASSED] NTSC
[11:14:21] [PASSED] NTSC_443
[11:14:21] [PASSED] NTSC_J
[11:14:21] [PASSED] PAL
[11:14:21] [PASSED] PAL_M
[11:14:21] [PASSED] PAL_N
[11:14:21] [PASSED] SECAM
[11:14:21] [PASSED] MONO_525
[11:14:21] [PASSED] MONO_625
[11:14:21] =========== [PASSED] drm_test_cmdline_tv_options ===========
[11:14:21] =============== [PASSED] drm_cmdline_parser ================
[11:14:21] ========== drmm_connector_hdmi_init (20 subtests) ==========
[11:14:21] [PASSED] drm_test_connector_hdmi_init_valid
[11:14:21] [PASSED] drm_test_connector_hdmi_init_bpc_8
[11:14:21] [PASSED] drm_test_connector_hdmi_init_bpc_10
[11:14:21] [PASSED] drm_test_connector_hdmi_init_bpc_12
[11:14:21] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[11:14:21] [PASSED] drm_test_connector_hdmi_init_bpc_null
[11:14:21] [PASSED] drm_test_connector_hdmi_init_formats_empty
[11:14:21] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[11:14:21] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[11:14:21] [PASSED] supported_formats=0x9 yuv420_allowed=1
[11:14:21] [PASSED] supported_formats=0x9 yuv420_allowed=0
[11:14:21] [PASSED] supported_formats=0x3 yuv420_allowed=1
[11:14:21] [PASSED] supported_formats=0x3 yuv420_allowed=0
[11:14:21] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[11:14:21] [PASSED] drm_test_connector_hdmi_init_null_ddc
[11:14:21] [PASSED] drm_test_connector_hdmi_init_null_product
[11:14:21] [PASSED] drm_test_connector_hdmi_init_null_vendor
[11:14:21] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[11:14:21] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[11:14:21] [PASSED] drm_test_connector_hdmi_init_product_valid
[11:14:21] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[11:14:21] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[11:14:21] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[11:14:21] ========= drm_test_connector_hdmi_init_type_valid  =========
[11:14:21] [PASSED] HDMI-A
[11:14:21] [PASSED] HDMI-B
[11:14:21] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[11:14:21] ======== drm_test_connector_hdmi_init_type_invalid  ========
[11:14:21] [PASSED] Unknown
[11:14:21] [PASSED] VGA
[11:14:21] [PASSED] DVI-I
[11:14:21] [PASSED] DVI-D
[11:14:21] [PASSED] DVI-A
[11:14:21] [PASSED] Composite
[11:14:21] [PASSED] SVIDEO
[11:14:21] [PASSED] LVDS
[11:14:21] [PASSED] Component
[11:14:21] [PASSED] DIN
[11:14:21] [PASSED] DP
[11:14:21] [PASSED] TV
[11:14:21] [PASSED] eDP
[11:14:21] [PASSED] Virtual
[11:14:21] [PASSED] DSI
[11:14:21] [PASSED] DPI
[11:14:21] [PASSED] Writeback
[11:14:21] [PASSED] SPI
[11:14:21] [PASSED] USB
[11:14:21] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[11:14:21] ============ [PASSED] drmm_connector_hdmi_init =============
[11:14:21] ============= drmm_connector_init (3 subtests) =============
[11:14:21] [PASSED] drm_test_drmm_connector_init
[11:14:21] [PASSED] drm_test_drmm_connector_init_null_ddc
[11:14:21] ========= drm_test_drmm_connector_init_type_valid  =========
[11:14:21] [PASSED] Unknown
[11:14:21] [PASSED] VGA
[11:14:21] [PASSED] DVI-I
[11:14:21] [PASSED] DVI-D
[11:14:21] [PASSED] DVI-A
[11:14:21] [PASSED] Composite
[11:14:21] [PASSED] SVIDEO
[11:14:21] [PASSED] LVDS
[11:14:21] [PASSED] Component
[11:14:21] [PASSED] DIN
[11:14:21] [PASSED] DP
[11:14:21] [PASSED] HDMI-A
[11:14:21] [PASSED] HDMI-B
[11:14:21] [PASSED] TV
[11:14:21] [PASSED] eDP
[11:14:21] [PASSED] Virtual
[11:14:21] [PASSED] DSI
[11:14:21] [PASSED] DPI
[11:14:21] [PASSED] Writeback
[11:14:21] [PASSED] SPI
[11:14:21] [PASSED] USB
[11:14:21] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[11:14:21] =============== [PASSED] drmm_connector_init ===============
[11:14:21] ========= drm_connector_dynamic_init (6 subtests) ==========
[11:14:21] [PASSED] drm_test_drm_connector_dynamic_init
[11:14:21] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[11:14:21] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[11:14:21] [PASSED] drm_test_drm_connector_dynamic_init_properties
[11:14:21] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[11:14:21] [PASSED] Unknown
[11:14:21] [PASSED] VGA
[11:14:21] [PASSED] DVI-I
[11:14:21] [PASSED] DVI-D
[11:14:21] [PASSED] DVI-A
[11:14:21] [PASSED] Composite
[11:14:21] [PASSED] SVIDEO
[11:14:21] [PASSED] LVDS
[11:14:21] [PASSED] Component
[11:14:21] [PASSED] DIN
[11:14:21] [PASSED] DP
[11:14:21] [PASSED] HDMI-A
[11:14:21] [PASSED] HDMI-B
[11:14:21] [PASSED] TV
[11:14:21] [PASSED] eDP
[11:14:21] [PASSED] Virtual
[11:14:21] [PASSED] DSI
[11:14:21] [PASSED] DPI
[11:14:21] [PASSED] Writeback
[11:14:21] [PASSED] SPI
[11:14:21] [PASSED] USB
[11:14:21] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[11:14:21] ======== drm_test_drm_connector_dynamic_init_name  =========
[11:14:21] [PASSED] Unknown
[11:14:21] [PASSED] VGA
[11:14:21] [PASSED] DVI-I
[11:14:21] [PASSED] DVI-D
[11:14:21] [PASSED] DVI-A
[11:14:21] [PASSED] Composite
[11:14:21] [PASSED] SVIDEO
[11:14:21] [PASSED] LVDS
[11:14:21] [PASSED] Component
[11:14:21] [PASSED] DIN
[11:14:21] [PASSED] DP
[11:14:21] [PASSED] HDMI-A
[11:14:21] [PASSED] HDMI-B
[11:14:21] [PASSED] TV
[11:14:21] [PASSED] eDP
[11:14:21] [PASSED] Virtual
[11:14:21] [PASSED] DSI
[11:14:21] [PASSED] DPI
[11:14:21] [PASSED] Writeback
[11:14:21] [PASSED] SPI
[11:14:21] [PASSED] USB
[11:14:21] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[11:14:21] =========== [PASSED] drm_connector_dynamic_init ============
[11:14:21] ==== drm_connector_dynamic_register_early (4 subtests) =====
[11:14:21] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[11:14:21] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[11:14:21] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[11:14:21] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[11:14:21] ====== [PASSED] drm_connector_dynamic_register_early =======
[11:14:21] ======= drm_connector_dynamic_register (7 subtests) ========
[11:14:21] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[11:14:21] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[11:14:21] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[11:14:21] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[11:14:21] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[11:14:21] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[11:14:21] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[11:14:21] ========= [PASSED] drm_connector_dynamic_register ==========
[11:14:21] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[11:14:21] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[11:14:21] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[11:14:21] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[11:14:21] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[11:14:21] ========== drm_test_get_tv_mode_from_name_valid  ===========
[11:14:21] [PASSED] NTSC
[11:14:21] [PASSED] NTSC-443
[11:14:21] [PASSED] NTSC-J
[11:14:21] [PASSED] PAL
[11:14:21] [PASSED] PAL-M
[11:14:21] [PASSED] PAL-N
[11:14:21] [PASSED] SECAM
[11:14:21] [PASSED] Mono
[11:14:21] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[11:14:21] [PASSED] drm_test_get_tv_mode_from_name_truncated
[11:14:21] ============ [PASSED] drm_get_tv_mode_from_name ============
[11:14:21] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[11:14:21] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[11:14:21] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[11:14:21] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[11:14:21] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[11:14:21] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[11:14:21] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[11:14:21] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[11:14:21] [PASSED] VIC 96
[11:14:21] [PASSED] VIC 97
[11:14:21] [PASSED] VIC 101
[11:14:21] [PASSED] VIC 102
[11:14:21] [PASSED] VIC 106
[11:14:21] [PASSED] VIC 107
[11:14:21] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[11:14:21] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[11:14:21] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[11:14:21] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[11:14:21] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[11:14:21] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[11:14:21] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[11:14:21] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[11:14:21] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[11:14:21] [PASSED] Automatic
[11:14:21] [PASSED] Full
[11:14:21] [PASSED] Limited 16:235
[11:14:21] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[11:14:21] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[11:14:21] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[11:14:21] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[11:14:21] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[11:14:21] [PASSED] RGB
[11:14:21] [PASSED] YUV 4:2:0
[11:14:21] [PASSED] YUV 4:2:2
[11:14:21] [PASSED] YUV 4:4:4
[11:14:21] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[11:14:21] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[11:14:21] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[11:14:21] ============= drm_damage_helper (21 subtests) ==============
[11:14:21] [PASSED] drm_test_damage_iter_no_damage
[11:14:21] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[11:14:21] [PASSED] drm_test_damage_iter_no_damage_src_moved
[11:14:21] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[11:14:21] [PASSED] drm_test_damage_iter_no_damage_not_visible
[11:14:21] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[11:14:21] [PASSED] drm_test_damage_iter_no_damage_no_fb
[11:14:21] [PASSED] drm_test_damage_iter_simple_damage
[11:14:21] [PASSED] drm_test_damage_iter_single_damage
[11:14:21] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[11:14:21] [PASSED] drm_test_damage_iter_single_damage_outside_src
[11:14:21] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[11:14:21] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[11:14:21] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[11:14:21] [PASSED] drm_test_damage_iter_single_damage_src_moved
[11:14:21] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[11:14:21] [PASSED] drm_test_damage_iter_damage
[11:14:21] [PASSED] drm_test_damage_iter_damage_one_intersect
[11:14:21] [PASSED] drm_test_damage_iter_damage_one_outside
[11:14:21] [PASSED] drm_test_damage_iter_damage_src_moved
[11:14:21] [PASSED] drm_test_damage_iter_damage_not_visible
[11:14:21] ================ [PASSED] drm_damage_helper ================
[11:14:21] ============== drm_dp_mst_helper (3 subtests) ==============
[11:14:21] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[11:14:21] [PASSED] Clock 154000 BPP 30 DSC disabled
[11:14:21] [PASSED] Clock 234000 BPP 30 DSC disabled
[11:14:21] [PASSED] Clock 297000 BPP 24 DSC disabled
[11:14:21] [PASSED] Clock 332880 BPP 24 DSC enabled
[11:14:21] [PASSED] Clock 324540 BPP 24 DSC enabled
[11:14:21] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[11:14:21] ============== drm_test_dp_mst_calc_pbn_div  ===============
[11:14:21] [PASSED] Link rate 2000000 lane count 4
[11:14:21] [PASSED] Link rate 2000000 lane count 2
[11:14:21] [PASSED] Link rate 2000000 lane count 1
[11:14:21] [PASSED] Link rate 1350000 lane count 4
[11:14:21] [PASSED] Link rate 1350000 lane count 2
[11:14:21] [PASSED] Link rate 1350000 lane count 1
[11:14:21] [PASSED] Link rate 1000000 lane count 4
[11:14:21] [PASSED] Link rate 1000000 lane count 2
[11:14:21] [PASSED] Link rate 1000000 lane count 1
[11:14:21] [PASSED] Link rate 810000 lane count 4
[11:14:21] [PASSED] Link rate 810000 lane count 2
[11:14:21] [PASSED] Link rate 810000 lane count 1
[11:14:21] [PASSED] Link rate 540000 lane count 4
[11:14:21] [PASSED] Link rate 540000 lane count 2
[11:14:21] [PASSED] Link rate 540000 lane count 1
[11:14:21] [PASSED] Link rate 270000 lane count 4
[11:14:21] [PASSED] Link rate 270000 lane count 2
[11:14:21] [PASSED] Link rate 270000 lane count 1
[11:14:21] [PASSED] Link rate 162000 lane count 4
[11:14:21] [PASSED] Link rate 162000 lane count 2
[11:14:21] [PASSED] Link rate 162000 lane count 1
[11:14:21] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[11:14:21] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[11:14:21] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[11:14:21] [PASSED] DP_POWER_UP_PHY with port number
[11:14:21] [PASSED] DP_POWER_DOWN_PHY with port number
[11:14:21] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[11:14:21] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[11:14:21] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[11:14:21] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[11:14:21] [PASSED] DP_QUERY_PAYLOAD with port number
[11:14:21] [PASSED] DP_QUERY_PAYLOAD with VCPI
[11:14:21] [PASSED] DP_REMOTE_DPCD_READ with port number
[11:14:21] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[11:14:21] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[11:14:21] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[11:14:21] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[11:14:21] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[11:14:21] [PASSED] DP_REMOTE_I2C_READ with port number
[11:14:21] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[11:14:21] [PASSED] DP_REMOTE_I2C_READ with transactions array
[11:14:21] [PASSED] DP_REMOTE_I2C_WRITE with port number
[11:14:21] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[11:14:21] [PASSED] DP_REMOTE_I2C_WRITE with data array
[11:14:21] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[11:14:21] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[11:14:21] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[11:14:21] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[11:14:21] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[11:14:21] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[11:14:21] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[11:14:21] ================ [PASSED] drm_dp_mst_helper ================
[11:14:21] ================== drm_exec (7 subtests) ===================
[11:14:21] [PASSED] sanitycheck
[11:14:21] [PASSED] test_lock
[11:14:21] [PASSED] test_lock_unlock
[11:14:21] [PASSED] test_duplicates
[11:14:21] [PASSED] test_prepare
[11:14:21] [PASSED] test_prepare_array
[11:14:21] [PASSED] test_multiple_loops
[11:14:21] ==================== [PASSED] drm_exec =====================
[11:14:21] =========== drm_format_helper_test (18 subtests) ===========
[11:14:21] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[11:14:21] [PASSED] single_pixel_source_buffer
[11:14:21] [PASSED] single_pixel_clip_rectangle
[11:14:21] [PASSED] well_known_colors
[11:14:21] [PASSED] destination_pitch
[11:14:21] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[11:14:21] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[11:14:21] [PASSED] single_pixel_source_buffer
[11:14:21] [PASSED] single_pixel_clip_rectangle
[11:14:21] [PASSED] well_known_colors
[11:14:21] [PASSED] destination_pitch
[11:14:21] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[11:14:21] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[11:14:21] [PASSED] single_pixel_source_buffer
[11:14:21] [PASSED] single_pixel_clip_rectangle
[11:14:21] [PASSED] well_known_colors
[11:14:21] [PASSED] destination_pitch
[11:14:21] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[11:14:21] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[11:14:21] [PASSED] single_pixel_source_buffer
[11:14:21] [PASSED] single_pixel_clip_rectangle
[11:14:21] [PASSED] well_known_colors
[11:14:21] [PASSED] destination_pitch
[11:14:21] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[11:14:21] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[11:14:21] [PASSED] single_pixel_source_buffer
[11:14:21] [PASSED] single_pixel_clip_rectangle
[11:14:21] [PASSED] well_known_colors
[11:14:21] [PASSED] destination_pitch
[11:14:21] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[11:14:21] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[11:14:21] [PASSED] single_pixel_source_buffer
[11:14:21] [PASSED] single_pixel_clip_rectangle
[11:14:21] [PASSED] well_known_colors
[11:14:21] [PASSED] destination_pitch
[11:14:21] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[11:14:21] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[11:14:21] [PASSED] single_pixel_source_buffer
[11:14:21] [PASSED] single_pixel_clip_rectangle
[11:14:21] [PASSED] well_known_colors
[11:14:21] [PASSED] destination_pitch
[11:14:21] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[11:14:21] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[11:14:21] [PASSED] single_pixel_source_buffer
[11:14:21] [PASSED] single_pixel_clip_rectangle
[11:14:21] [PASSED] well_known_colors
[11:14:21] [PASSED] destination_pitch
[11:14:21] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[11:14:21] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[11:14:21] [PASSED] single_pixel_source_buffer
[11:14:21] [PASSED] single_pixel_clip_rectangle
[11:14:21] [PASSED] well_known_colors
[11:14:21] [PASSED] destination_pitch
[11:14:21] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[11:14:21] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[11:14:21] [PASSED] single_pixel_source_buffer
[11:14:21] [PASSED] single_pixel_clip_rectangle
[11:14:21] [PASSED] well_known_colors
[11:14:21] [PASSED] destination_pitch
[11:14:21] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[11:14:21] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[11:14:21] [PASSED] single_pixel_source_buffer
[11:14:21] [PASSED] single_pixel_clip_rectangle
[11:14:21] [PASSED] well_known_colors
[11:14:21] [PASSED] destination_pitch
[11:14:21] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[11:14:21] ============== drm_test_fb_xrgb8888_to_mono  ===============
[11:14:21] [PASSED] single_pixel_source_buffer
[11:14:21] [PASSED] single_pixel_clip_rectangle
[11:14:21] [PASSED] well_known_colors
[11:14:21] [PASSED] destination_pitch
[11:14:21] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[11:14:21] ==================== drm_test_fb_swab  =====================
[11:14:21] [PASSED] single_pixel_source_buffer
[11:14:21] [PASSED] single_pixel_clip_rectangle
[11:14:21] [PASSED] well_known_colors
[11:14:21] [PASSED] destination_pitch
[11:14:21] ================ [PASSED] drm_test_fb_swab =================
[11:14:21] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[11:14:21] [PASSED] single_pixel_source_buffer
[11:14:21] [PASSED] single_pixel_clip_rectangle
[11:14:21] [PASSED] well_known_colors
[11:14:21] [PASSED] destination_pitch
[11:14:21] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[11:14:21] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[11:14:21] [PASSED] single_pixel_source_buffer
[11:14:21] [PASSED] single_pixel_clip_rectangle
[11:14:21] [PASSED] well_known_colors
[11:14:21] [PASSED] destination_pitch
[11:14:21] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[11:14:21] ================= drm_test_fb_clip_offset  =================
[11:14:21] [PASSED] pass through
[11:14:21] [PASSED] horizontal offset
[11:14:21] [PASSED] vertical offset
[11:14:21] [PASSED] horizontal and vertical offset
[11:14:21] [PASSED] horizontal offset (custom pitch)
[11:14:21] [PASSED] vertical offset (custom pitch)
[11:14:21] [PASSED] horizontal and vertical offset (custom pitch)
[11:14:21] ============= [PASSED] drm_test_fb_clip_offset =============
[11:14:21] ============== drm_test_fb_build_fourcc_list  ==============
[11:14:21] [PASSED] no native formats
[11:14:21] [PASSED] XRGB8888 as native format
[11:14:21] [PASSED] remove duplicates
[11:14:21] [PASSED] convert alpha formats
[11:14:21] [PASSED] random formats
[11:14:21] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[11:14:21] =================== drm_test_fb_memcpy  ====================
[11:14:21] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[11:14:21] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[11:14:21] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[11:14:21] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[11:14:21] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[11:14:21] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[11:14:21] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[11:14:21] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[11:14:21] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[11:14:21] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[11:14:21] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[11:14:21] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[11:14:21] =============== [PASSED] drm_test_fb_memcpy ================
[11:14:21] ============= [PASSED] drm_format_helper_test ==============
[11:14:21] ================= drm_format (18 subtests) =================
[11:14:21] [PASSED] drm_test_format_block_width_invalid
[11:14:21] [PASSED] drm_test_format_block_width_one_plane
[11:14:21] [PASSED] drm_test_format_block_width_two_plane
[11:14:21] [PASSED] drm_test_format_block_width_three_plane
[11:14:21] [PASSED] drm_test_format_block_width_tiled
[11:14:21] [PASSED] drm_test_format_block_height_invalid
[11:14:21] [PASSED] drm_test_format_block_height_one_plane
[11:14:21] [PASSED] drm_test_format_block_height_two_plane
[11:14:21] [PASSED] drm_test_format_block_height_three_plane
[11:14:21] [PASSED] drm_test_format_block_height_tiled
[11:14:21] [PASSED] drm_test_format_min_pitch_invalid
[11:14:21] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[11:14:21] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[11:14:21] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[11:14:21] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[11:14:21] [PASSED] drm_test_format_min_pitch_two_plane
[11:14:21] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[11:14:21] [PASSED] drm_test_format_min_pitch_tiled
[11:14:21] =================== [PASSED] drm_format ====================
[11:14:21] ============== drm_framebuffer (10 subtests) ===============
[11:14:21] ========== drm_test_framebuffer_check_src_coords  ==========
[11:14:21] [PASSED] Success: source fits into fb
[11:14:21] [PASSED] Fail: overflowing fb with x-axis coordinate
[11:14:21] [PASSED] Fail: overflowing fb with y-axis coordinate
[11:14:21] [PASSED] Fail: overflowing fb with source width
[11:14:21] [PASSED] Fail: overflowing fb with source height
[11:14:21] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[11:14:21] [PASSED] drm_test_framebuffer_cleanup
[11:14:21] =============== drm_test_framebuffer_create  ===============
[11:14:21] [PASSED] ABGR8888 normal sizes
[11:14:21] [PASSED] ABGR8888 max sizes
[11:14:21] [PASSED] ABGR8888 pitch greater than min required
[11:14:21] [PASSED] ABGR8888 pitch less than min required
[11:14:21] [PASSED] ABGR8888 Invalid width
[11:14:21] [PASSED] ABGR8888 Invalid buffer handle
[11:14:21] [PASSED] No pixel format
[11:14:21] [PASSED] ABGR8888 Width 0
[11:14:21] [PASSED] ABGR8888 Height 0
[11:14:21] [PASSED] ABGR8888 Out of bound height * pitch combination
[11:14:21] [PASSED] ABGR8888 Large buffer offset
[11:14:21] [PASSED] ABGR8888 Buffer offset for inexistent plane
[11:14:21] [PASSED] ABGR8888 Invalid flag
[11:14:21] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[11:14:21] [PASSED] ABGR8888 Valid buffer modifier
[11:14:21] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[11:14:21] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[11:14:21] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[11:14:21] [PASSED] NV12 Normal sizes
[11:14:21] [PASSED] NV12 Max sizes
[11:14:21] [PASSED] NV12 Invalid pitch
[11:14:21] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[11:14:21] [PASSED] NV12 different  modifier per-plane
[11:14:21] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[11:14:21] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[11:14:21] [PASSED] NV12 Modifier for inexistent plane
[11:14:21] [PASSED] NV12 Handle for inexistent plane
[11:14:21] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[11:14:21] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[11:14:21] [PASSED] YVU420 Normal sizes
[11:14:21] [PASSED] YVU420 Max sizes
[11:14:21] [PASSED] YVU420 Invalid pitch
[11:14:21] [PASSED] YVU420 Different pitches
[11:14:21] [PASSED] YVU420 Different buffer offsets/pitches
[11:14:21] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[11:14:21] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[11:14:21] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[11:14:21] [PASSED] YVU420 Valid modifier
[11:14:21] [PASSED] YVU420 Different modifiers per plane
[11:14:21] [PASSED] YVU420 Modifier for inexistent plane
[11:14:21] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[11:14:21] [PASSED] X0L2 Normal sizes
[11:14:21] [PASSED] X0L2 Max sizes
[11:14:21] [PASSED] X0L2 Invalid pitch
[11:14:21] [PASSED] X0L2 Pitch greater than minimum required
[11:14:21] [PASSED] X0L2 Handle for inexistent plane
[11:14:21] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[11:14:21] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[11:14:21] [PASSED] X0L2 Valid modifier
[11:14:21] [PASSED] X0L2 Modifier for inexistent plane
[11:14:21] =========== [PASSED] drm_test_framebuffer_create ===========
[11:14:21] [PASSED] drm_test_framebuffer_free
[11:14:21] [PASSED] drm_test_framebuffer_init
[11:14:21] [PASSED] drm_test_framebuffer_init_bad_format
[11:14:21] [PASSED] drm_test_framebuffer_init_dev_mismatch
[11:14:21] [PASSED] drm_test_framebuffer_lookup
[11:14:21] [PASSED] drm_test_framebuffer_lookup_inexistent
[11:14:21] [PASSED] drm_test_framebuffer_modifiers_not_supported
[11:14:21] ================= [PASSED] drm_framebuffer =================
[11:14:21] ================ drm_gem_shmem (8 subtests) ================
[11:14:21] [PASSED] drm_gem_shmem_test_obj_create
[11:14:21] [PASSED] drm_gem_shmem_test_obj_create_private
[11:14:21] [PASSED] drm_gem_shmem_test_pin_pages
[11:14:21] [PASSED] drm_gem_shmem_test_vmap
[11:14:21] [PASSED] drm_gem_shmem_test_get_pages_sgt
[11:14:21] [PASSED] drm_gem_shmem_test_get_sg_table
[11:14:21] [PASSED] drm_gem_shmem_test_madvise
[11:14:21] [PASSED] drm_gem_shmem_test_purge
[11:14:21] ================== [PASSED] drm_gem_shmem ==================
[11:14:21] === drm_atomic_helper_connector_hdmi_check (23 subtests) ===
[11:14:21] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[11:14:21] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[11:14:21] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[11:14:21] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[11:14:21] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[11:14:21] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[11:14:21] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[11:14:21] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[11:14:21] [PASSED] drm_test_check_disable_connector
[11:14:21] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[11:14:21] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[11:14:21] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[11:14:21] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[11:14:21] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[11:14:21] [PASSED] drm_test_check_output_bpc_dvi
[11:14:21] [PASSED] drm_test_check_output_bpc_format_vic_1
[11:14:21] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[11:14:21] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[11:14:21] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[11:14:21] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[11:14:21] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[11:14:21] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[11:14:21] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[11:14:21] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[11:14:21] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[11:14:21] [PASSED] drm_test_check_broadcast_rgb_value
[11:14:21] [PASSED] drm_test_check_bpc_8_value
[11:14:21] [PASSED] drm_test_check_bpc_10_value
[11:14:21] [PASSED] drm_test_check_bpc_12_value
[11:14:21] [PASSED] drm_test_check_format_value
[11:14:21] [PASSED] drm_test_check_tmds_char_value
[11:14:21] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[11:14:21] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[11:14:21] [PASSED] drm_test_check_mode_valid
[11:14:21] [PASSED] drm_test_check_mode_valid_reject
[11:14:21] [PASSED] drm_test_check_mode_valid_reject_rate
[11:14:21] [PASSED] drm_test_check_mode_valid_reject_max_clock
[11:14:21] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[11:14:21] ================= drm_managed (2 subtests) =================
[11:14:21] [PASSED] drm_test_managed_release_action
[11:14:21] [PASSED] drm_test_managed_run_action
[11:14:21] =================== [PASSED] drm_managed ===================
[11:14:21] =================== drm_mm (6 subtests) ====================
[11:14:21] [PASSED] drm_test_mm_init
[11:14:21] [PASSED] drm_test_mm_debug
[11:14:21] [PASSED] drm_test_mm_align32
[11:14:21] [PASSED] drm_test_mm_align64
[11:14:21] [PASSED] drm_test_mm_lowest
[11:14:21] [PASSED] drm_test_mm_highest
[11:14:21] ===================== [PASSED] drm_mm ======================
[11:14:21] ============= drm_modes_analog_tv (5 subtests) =============
[11:14:21] [PASSED] drm_test_modes_analog_tv_mono_576i
[11:14:21] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[11:14:21] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[11:14:21] [PASSED] drm_test_modes_analog_tv_pal_576i
[11:14:21] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[11:14:21] =============== [PASSED] drm_modes_analog_tv ===============
[11:14:21] ============== drm_plane_helper (2 subtests) ===============
[11:14:21] =============== drm_test_check_plane_state  ================
[11:14:21] [PASSED] clipping_simple
[11:14:21] [PASSED] clipping_rotate_reflect
[11:14:21] [PASSED] positioning_simple
[11:14:21] [PASSED] upscaling
[11:14:21] [PASSED] downscaling
[11:14:21] [PASSED] rounding1
[11:14:21] [PASSED] rounding2
[11:14:21] [PASSED] rounding3
[11:14:21] [PASSED] rounding4
[11:14:21] =========== [PASSED] drm_test_check_plane_state ============
[11:14:21] =========== drm_test_check_invalid_plane_state  ============
[11:14:21] [PASSED] positioning_invalid
[11:14:21] [PASSED] upscaling_invalid
[11:14:21] [PASSED] downscaling_invalid
[11:14:21] ======= [PASSED] drm_test_check_invalid_plane_state ========
[11:14:21] ================ [PASSED] drm_plane_helper =================
[11:14:21] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[11:14:21] ====== drm_test_connector_helper_tv_get_modes_check  =======
[11:14:21] [PASSED] None
[11:14:21] [PASSED] PAL
[11:14:21] [PASSED] NTSC
[11:14:21] [PASSED] Both, NTSC Default
[11:14:21] [PASSED] Both, PAL Default
[11:14:21] [PASSED] Both, NTSC Default, with PAL on command-line
[11:14:21] [PASSED] Both, PAL Default, with NTSC on command-line
[11:14:21] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[11:14:21] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[11:14:21] ================== drm_rect (9 subtests) ===================
[11:14:21] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[11:14:21] [PASSED] drm_test_rect_clip_scaled_not_clipped
[11:14:21] [PASSED] drm_test_rect_clip_scaled_clipped
[11:14:21] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[11:14:21] ================= drm_test_rect_intersect  =================
[11:14:21] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[11:14:21] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[11:14:21] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[11:14:21] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[11:14:21] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[11:14:21] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[11:14:21] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[11:14:21] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[11:14:21] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[11:14:21] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[11:14:21] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[11:14:21] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[11:14:21] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[11:14:21] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[11:14:21] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[11:14:21] ============= [PASSED] drm_test_rect_intersect =============
[11:14:21] ================ drm_test_rect_calc_hscale  ================
[11:14:21] [PASSED] normal use
[11:14:21] [PASSED] out of max range
[11:14:21] [PASSED] out of min range
[11:14:21] [PASSED] zero dst
[11:14:21] [PASSED] negative src
[11:14:21] [PASSED] negative dst
[11:14:21] ============ [PASSED] drm_test_rect_calc_hscale ============
[11:14:21] ================ drm_test_rect_calc_vscale  ================
[11:14:21] [PASSED] normal use
[11:14:21] [PASSED] out of max range
[11:14:21] [PASSED] out of min range
[11:14:21] [PASSED] zero dst
[11:14:21] [PASSED] negative src
[11:14:21] [PASSED] negative dst
[11:14:21] ============ [PASSED] drm_test_rect_calc_vscale ============
[11:14:21] ================== drm_test_rect_rotate  ===================
[11:14:21] [PASSED] reflect-x
[11:14:21] [PASSED] reflect-y
[11:14:21] [PASSED] rotate-0
[11:14:21] [PASSED] rotate-90
[11:14:21] [PASSED] rotate-180
[11:14:21] [PASSED] rotate-270
[11:14:21] ============== [PASSED] drm_test_rect_rotate ===============
[11:14:21] ================ drm_test_rect_rotate_inv  =================
[11:14:21] [PASSED] reflect-x
[11:14:21] [PASSED] reflect-y
[11:14:21] [PASSED] rotate-0
[11:14:21] [PASSED] rotate-90
[11:14:21] [PASSED] rotate-180
[11:14:21] [PASSED] rotate-270
[11:14:21] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[11:14:21] ==================== [PASSED] drm_rect =====================
[11:14:21] ============================================================
[11:14:21] Testing complete. Ran 608 tests: passed: 608
[11:14:21] Elapsed time: 23.340s total, 1.672s configuring, 21.501s building, 0.145s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[11:14:21] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:14:23] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[11:14:31] Starting KUnit Kernel (1/1)...
[11:14:31] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[11:14:31] ================= ttm_device (5 subtests) ==================
[11:14:31] [PASSED] ttm_device_init_basic
[11:14:31] [PASSED] ttm_device_init_multiple
[11:14:31] [PASSED] ttm_device_fini_basic
[11:14:31] [PASSED] ttm_device_init_no_vma_man
[11:14:31] ================== ttm_device_init_pools  ==================
[11:14:31] [PASSED] No DMA allocations, no DMA32 required
[11:14:31] [PASSED] DMA allocations, DMA32 required
[11:14:31] [PASSED] No DMA allocations, DMA32 required
[11:14:31] [PASSED] DMA allocations, no DMA32 required
[11:14:31] ============== [PASSED] ttm_device_init_pools ==============
[11:14:31] =================== [PASSED] ttm_device ====================
[11:14:31] ================== ttm_pool (8 subtests) ===================
[11:14:31] ================== ttm_pool_alloc_basic  ===================
[11:14:31] [PASSED] One page
[11:14:31] [PASSED] More than one page
[11:14:31] [PASSED] Above the allocation limit
[11:14:31] [PASSED] One page, with coherent DMA mappings enabled
[11:14:31] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[11:14:31] ============== [PASSED] ttm_pool_alloc_basic ===============
[11:14:31] ============== ttm_pool_alloc_basic_dma_addr  ==============
[11:14:31] [PASSED] One page
[11:14:31] [PASSED] More than one page
[11:14:31] [PASSED] Above the allocation limit
[11:14:31] [PASSED] One page, with coherent DMA mappings enabled
[11:14:31] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[11:14:31] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[11:14:31] [PASSED] ttm_pool_alloc_order_caching_match
[11:14:31] [PASSED] ttm_pool_alloc_caching_mismatch
[11:14:31] [PASSED] ttm_pool_alloc_order_mismatch
[11:14:31] [PASSED] ttm_pool_free_dma_alloc
[11:14:31] [PASSED] ttm_pool_free_no_dma_alloc
[11:14:31] [PASSED] ttm_pool_fini_basic
[11:14:31] ==================== [PASSED] ttm_pool =====================
[11:14:31] ================ ttm_resource (8 subtests) =================
[11:14:31] ================= ttm_resource_init_basic  =================
[11:14:31] [PASSED] Init resource in TTM_PL_SYSTEM
[11:14:31] [PASSED] Init resource in TTM_PL_VRAM
[11:14:31] [PASSED] Init resource in a private placement
[11:14:31] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[11:14:31] ============= [PASSED] ttm_resource_init_basic =============
[11:14:31] [PASSED] ttm_resource_init_pinned
[11:14:31] [PASSED] ttm_resource_fini_basic
[11:14:31] [PASSED] ttm_resource_manager_init_basic
[11:14:31] [PASSED] ttm_resource_manager_usage_basic
[11:14:31] [PASSED] ttm_resource_manager_set_used_basic
[11:14:31] [PASSED] ttm_sys_man_alloc_basic
[11:14:31] [PASSED] ttm_sys_man_free_basic
[11:14:31] ================== [PASSED] ttm_resource ===================
[11:14:31] =================== ttm_tt (15 subtests) ===================
[11:14:31] ==================== ttm_tt_init_basic  ====================
[11:14:31] [PASSED] Page-aligned size
[11:14:31] [PASSED] Extra pages requested
[11:14:31] ================ [PASSED] ttm_tt_init_basic ================
[11:14:31] [PASSED] ttm_tt_init_misaligned
[11:14:31] [PASSED] ttm_tt_fini_basic
[11:14:31] [PASSED] ttm_tt_fini_sg
[11:14:31] [PASSED] ttm_tt_fini_shmem
[11:14:31] [PASSED] ttm_tt_create_basic
[11:14:31] [PASSED] ttm_tt_create_invalid_bo_type
[11:14:31] [PASSED] ttm_tt_create_ttm_exists
[11:14:31] [PASSED] ttm_tt_create_failed
[11:14:31] [PASSED] ttm_tt_destroy_basic
[11:14:31] [PASSED] ttm_tt_populate_null_ttm
[11:14:31] [PASSED] ttm_tt_populate_populated_ttm
[11:14:31] [PASSED] ttm_tt_unpopulate_basic
[11:14:31] [PASSED] ttm_tt_unpopulate_empty_ttm
[11:14:31] [PASSED] ttm_tt_swapin_basic
[11:14:31] ===================== [PASSED] ttm_tt ======================
[11:14:31] =================== ttm_bo (14 subtests) ===================
[11:14:31] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[11:14:31] [PASSED] Cannot be interrupted and sleeps
[11:14:31] [PASSED] Cannot be interrupted, locks straight away
[11:14:31] [PASSED] Can be interrupted, sleeps
[11:14:31] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[11:14:31] [PASSED] ttm_bo_reserve_locked_no_sleep
[11:14:31] [PASSED] ttm_bo_reserve_no_wait_ticket
[11:14:31] [PASSED] ttm_bo_reserve_double_resv
[11:14:31] [PASSED] ttm_bo_reserve_interrupted
[11:14:31] [PASSED] ttm_bo_reserve_deadlock
[11:14:31] [PASSED] ttm_bo_unreserve_basic
[11:14:31] [PASSED] ttm_bo_unreserve_pinned
[11:14:31] [PASSED] ttm_bo_unreserve_bulk
[11:14:31] [PASSED] ttm_bo_put_basic
[11:14:31] [PASSED] ttm_bo_put_shared_resv
[11:14:31] [PASSED] ttm_bo_pin_basic
[11:14:31] [PASSED] ttm_bo_pin_unpin_resource
[11:14:31] [PASSED] ttm_bo_multiple_pin_one_unpin
[11:14:31] ===================== [PASSED] ttm_bo ======================
[11:14:31] ============== ttm_bo_validate (22 subtests) ===============
[11:14:31] ============== ttm_bo_init_reserved_sys_man  ===============
[11:14:31] [PASSED] Buffer object for userspace
[11:14:31] [PASSED] Kernel buffer object
[11:14:31] [PASSED] Shared buffer object
[11:14:31] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[11:14:31] ============== ttm_bo_init_reserved_mock_man  ==============
[11:14:31] [PASSED] Buffer object for userspace
[11:14:31] [PASSED] Kernel buffer object
[11:14:31] [PASSED] Shared buffer object
[11:14:31] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[11:14:31] [PASSED] ttm_bo_init_reserved_resv
[11:14:31] ================== ttm_bo_validate_basic  ==================
[11:14:31] [PASSED] Buffer object for userspace
[11:14:31] [PASSED] Kernel buffer object
[11:14:31] [PASSED] Shared buffer object
[11:14:31] ============== [PASSED] ttm_bo_validate_basic ==============
[11:14:31] [PASSED] ttm_bo_validate_invalid_placement
[11:14:31] ============= ttm_bo_validate_same_placement  ==============
[11:14:31] [PASSED] System manager
[11:14:31] [PASSED] VRAM manager
[11:14:31] ========= [PASSED] ttm_bo_validate_same_placement ==========
[11:14:31] [PASSED] ttm_bo_validate_failed_alloc
[11:14:31] [PASSED] ttm_bo_validate_pinned
[11:14:31] [PASSED] ttm_bo_validate_busy_placement
[11:14:31] ================ ttm_bo_validate_multihop  =================
[11:14:31] [PASSED] Buffer object for userspace
[11:14:31] [PASSED] Kernel buffer object
[11:14:31] [PASSED] Shared buffer object
[11:14:31] ============ [PASSED] ttm_bo_validate_multihop =============
[11:14:31] ========== ttm_bo_validate_no_placement_signaled  ==========
[11:14:31] [PASSED] Buffer object in system domain, no page vector
[11:14:31] [PASSED] Buffer object in system domain with an existing page vector
[11:14:31] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[11:14:31] ======== ttm_bo_validate_no_placement_not_signaled  ========
[11:14:31] [PASSED] Buffer object for userspace
[11:14:31] [PASSED] Kernel buffer object
[11:14:31] [PASSED] Shared buffer object
[11:14:31] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[11:14:31] [PASSED] ttm_bo_validate_move_fence_signaled
[11:14:31] ========= ttm_bo_validate_move_fence_not_signaled  =========
[11:14:31] [PASSED] Waits for GPU
[11:14:31] [PASSED] Tries to lock straight away
[11:14:31] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[11:14:31] [PASSED] ttm_bo_validate_swapout
[11:14:31] [PASSED] ttm_bo_validate_happy_evict
[11:14:31] [PASSED] ttm_bo_validate_all_pinned_evict
[11:14:31] [PASSED] ttm_bo_validate_allowed_only_evict
[11:14:31] [PASSED] ttm_bo_validate_deleted_evict
[11:14:31] [PASSED] ttm_bo_validate_busy_domain_evict
[11:14:31] [PASSED] ttm_bo_validate_evict_gutting
[11:14:31] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[11:14:31] ================= [PASSED] ttm_bo_validate =================
[11:14:31] ============================================================
[11:14:31] Testing complete. Ran 102 tests: passed: 102
[11:14:31] Elapsed time: 10.095s total, 1.730s configuring, 7.698s building, 0.571s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


