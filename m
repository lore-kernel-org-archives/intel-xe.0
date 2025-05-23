Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A96CC54ED1
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 15:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D595610E82C;
	Fri, 23 May 2025 15:55:44 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C56210E82A;
 Fri, 23 May 2025 15:55:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Fix_out-of-bounds_fi?=
 =?utf-8?q?eld_write_in_MI=5FSTORE=5FDATA=5FIMM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 May 2025 15:55:43 -0000
Message-ID: <174801574310.17587.14201953769241678551@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250523150418.168362-1-jia.yao@intel.com>
In-Reply-To: <20250523150418.168362-1-jia.yao@intel.com>
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

Series: drm/xe: Fix out-of-bounds field write in MI_STORE_DATA_IMM
URL   : https://patchwork.freedesktop.org/series/149435/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[15:54:35] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:54:39] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[15:55:06] Starting KUnit Kernel (1/1)...
[15:55:06] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[15:55:06] ================== guc_buf (11 subtests) ===================
[15:55:06] [PASSED] test_smallest
[15:55:06] [PASSED] test_largest
[15:55:06] [PASSED] test_granular
[15:55:06] [PASSED] test_unique
[15:55:06] [PASSED] test_overlap
[15:55:06] [PASSED] test_reusable
[15:55:06] [PASSED] test_too_big
[15:55:06] [PASSED] test_flush
[15:55:06] [PASSED] test_lookup
[15:55:06] [PASSED] test_data
[15:55:06] [PASSED] test_class
[15:55:06] ===================== [PASSED] guc_buf =====================
[15:55:06] =================== guc_dbm (7 subtests) ===================
[15:55:06] [PASSED] test_empty
[15:55:06] [PASSED] test_default
[15:55:06] ======================== test_size  ========================
[15:55:06] [PASSED] 4
[15:55:06] [PASSED] 8
[15:55:06] [PASSED] 32
[15:55:06] [PASSED] 256
[15:55:06] ==================== [PASSED] test_size ====================
[15:55:06] ======================= test_reuse  ========================
[15:55:06] [PASSED] 4
[15:55:06] [PASSED] 8
[15:55:06] [PASSED] 32
[15:55:06] [PASSED] 256
[15:55:06] =================== [PASSED] test_reuse ====================
[15:55:06] =================== test_range_overlap  ====================
[15:55:06] [PASSED] 4
[15:55:06] [PASSED] 8
[15:55:06] [PASSED] 32
[15:55:06] [PASSED] 256
[15:55:06] =============== [PASSED] test_range_overlap ================
[15:55:06] =================== test_range_compact  ====================
[15:55:06] [PASSED] 4
[15:55:06] [PASSED] 8
[15:55:06] [PASSED] 32
[15:55:06] [PASSED] 256
[15:55:06] =============== [PASSED] test_range_compact ================
[15:55:06] ==================== test_range_spare  =====================
[15:55:06] [PASSED] 4
[15:55:06] [PASSED] 8
[15:55:06] [PASSED] 32
[15:55:06] [PASSED] 256
[15:55:06] ================ [PASSED] test_range_spare =================
[15:55:06] ===================== [PASSED] guc_dbm =====================
[15:55:06] =================== guc_idm (6 subtests) ===================
[15:55:06] [PASSED] bad_init
[15:55:06] [PASSED] no_init
[15:55:06] [PASSED] init_fini
[15:55:06] [PASSED] check_used
[15:55:06] [PASSED] check_quota
[15:55:06] [PASSED] check_all
[15:55:06] ===================== [PASSED] guc_idm =====================
[15:55:06] ================== no_relay (3 subtests) ===================
[15:55:06] [PASSED] xe_drops_guc2pf_if_not_ready
[15:55:06] [PASSED] xe_drops_guc2vf_if_not_ready
[15:55:06] [PASSED] xe_rejects_send_if_not_ready
[15:55:06] ==================== [PASSED] no_relay =====================
[15:55:06] ================== pf_relay (14 subtests) ==================
[15:55:06] [PASSED] pf_rejects_guc2pf_too_short
[15:55:06] [PASSED] pf_rejects_guc2pf_too_long
[15:55:06] [PASSED] pf_rejects_guc2pf_no_payload
[15:55:06] [PASSED] pf_fails_no_payload
[15:55:06] [PASSED] pf_fails_bad_origin
[15:55:06] [PASSED] pf_fails_bad_type
[15:55:06] [PASSED] pf_txn_reports_error
[15:55:06] [PASSED] pf_txn_sends_pf2guc
[15:55:06] [PASSED] pf_sends_pf2guc
[15:55:06] [SKIPPED] pf_loopback_nop
[15:55:06] [SKIPPED] pf_loopback_echo
[15:55:06] [SKIPPED] pf_loopback_fail
[15:55:06] [SKIPPED] pf_loopback_busy
[15:55:06] [SKIPPED] pf_loopback_retry
[15:55:06] ==================== [PASSED] pf_relay =====================
[15:55:06] ================== vf_relay (3 subtests) ===================
[15:55:06] [PASSED] vf_rejects_guc2vf_too_short
[15:55:06] [PASSED] vf_rejects_guc2vf_too_long
[15:55:06] [PASSED] vf_rejects_guc2vf_no_payload
[15:55:06] ==================== [PASSED] vf_relay =====================
[15:55:06] ================= pf_service (11 subtests) =================
[15:55:06] [PASSED] pf_negotiate_any
[15:55:06] [PASSED] pf_negotiate_base_match
[15:55:06] [PASSED] pf_negotiate_base_newer
[15:55:06] [PASSED] pf_negotiate_base_next
[15:55:06] [SKIPPED] pf_negotiate_base_older
[15:55:06] [PASSED] pf_negotiate_base_prev
[15:55:06] [PASSED] pf_negotiate_latest_match
[15:55:06] [PASSED] pf_negotiate_latest_newer
[15:55:06] [PASSED] pf_negotiate_latest_next
[15:55:06] [SKIPPED] pf_negotiate_latest_older
[15:55:06] [SKIPPED] pf_negotiate_latest_prev
[15:55:06] =================== [PASSED] pf_service ====================
[15:55:06] ===================== lmtt (1 subtest) =====================
[15:55:06] ======================== test_ops  =========================
[15:55:06] [PASSED] 2-level
[15:55:06] [PASSED] multi-level
[15:55:06] ==================== [PASSED] test_ops =====================
[15:55:06] ====================== [PASSED] lmtt =======================
[15:55:06] =================== xe_mocs (2 subtests) ===================
[15:55:06] ================ xe_live_mocs_kernel_kunit  ================
[15:55:06] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[15:55:06] ================ xe_live_mocs_reset_kunit  =================
[15:55:06] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[15:55:06] ==================== [SKIPPED] xe_mocs =====================
[15:55:06] ================= xe_migrate (2 subtests) ==================
[15:55:06] ================= xe_migrate_sanity_kunit  =================
[15:55:06] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[15:55:06] ================== xe_validate_ccs_kunit  ==================
[15:55:06] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[15:55:06] =================== [SKIPPED] xe_migrate ===================
[15:55:06] ================== xe_dma_buf (1 subtest) ==================
[15:55:06] ==================== xe_dma_buf_kunit  =====================
[15:55:06] ================ [SKIPPED] xe_dma_buf_kunit ================
[15:55:06] =================== [SKIPPED] xe_dma_buf ===================
[15:55:06] ================= xe_bo_shrink (1 subtest) =================
[15:55:06] =================== xe_bo_shrink_kunit  ====================
[15:55:06] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[15:55:06] ================== [SKIPPED] xe_bo_shrink ==================
[15:55:06] ==================== xe_bo (2 subtests) ====================
[15:55:06] ================== xe_ccs_migrate_kunit  ===================
[15:55:06] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[15:55:06] ==================== xe_bo_evict_kunit  ====================
[15:55:06] =============== [SKIPPED] xe_bo_evict_kunit ================
[15:55:06] ===================== [SKIPPED] xe_bo ======================
[15:55:06] ==================== args (11 subtests) ====================
[15:55:06] [PASSED] count_args_test
[15:55:06] [PASSED] call_args_example
[15:55:06] [PASSED] call_args_test
[15:55:06] [PASSED] drop_first_arg_example
[15:55:06] [PASSED] drop_first_arg_test
[15:55:06] [PASSED] first_arg_example
[15:55:06] [PASSED] first_arg_test
[15:55:06] [PASSED] last_arg_example
[15:55:06] [PASSED] last_arg_test
[15:55:06] [PASSED] pick_arg_example
[15:55:06] [PASSED] sep_comma_example
[15:55:06] ====================== [PASSED] args =======================
[15:55:06] =================== xe_pci (2 subtests) ====================
[15:55:06] [PASSED] xe_gmdid_graphics_ip
[15:55:06] [PASSED] xe_gmdid_media_ip
[15:55:06] ===================== [PASSED] xe_pci ======================
[15:55:06] =================== xe_rtp (2 subtests) ====================
[15:55:06] =============== xe_rtp_process_to_sr_tests  ================
[15:55:06] [PASSED] coalesce-same-reg
[15:55:06] [PASSED] no-match-no-add
[15:55:06] [PASSED] match-or
[15:55:06] [PASSED] match-or-xfail
[15:55:06] [PASSED] no-match-no-add-multiple-rules
[15:55:06] [PASSED] two-regs-two-entries
[15:55:06] [PASSED] clr-one-set-other
[15:55:06] [PASSED] set-field
[15:55:06] [PASSED] conflict-duplicate
[15:55:06] [PASSED] conflict-not-disjoint
stty: 'standard input': Inappropriate ioctl for device
[15:55:06] [PASSED] conflict-reg-type
[15:55:06] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[15:55:06] ================== xe_rtp_process_tests  ===================
[15:55:06] [PASSED] active1
[15:55:06] [PASSED] active2
[15:55:06] [PASSED] active-inactive
[15:55:06] [PASSED] inactive-active
[15:55:06] [PASSED] inactive-1st_or_active-inactive
[15:55:06] [PASSED] inactive-2nd_or_active-inactive
[15:55:06] [PASSED] inactive-last_or_active-inactive
[15:55:06] [PASSED] inactive-no_or_active-inactive
[15:55:06] ============== [PASSED] xe_rtp_process_tests ===============
[15:55:06] ===================== [PASSED] xe_rtp ======================
[15:55:06] ==================== xe_wa (1 subtest) =====================
[15:55:06] ======================== xe_wa_gt  =========================
[15:55:06] [PASSED] TIGERLAKE (B0)
[15:55:06] [PASSED] DG1 (A0)
[15:55:06] [PASSED] DG1 (B0)
[15:55:06] [PASSED] ALDERLAKE_S (A0)
[15:55:06] [PASSED] ALDERLAKE_S (B0)
[15:55:06] [PASSED] ALDERLAKE_S (C0)
[15:55:06] [PASSED] ALDERLAKE_S (D0)
[15:55:06] [PASSED] ALDERLAKE_P (A0)
[15:55:06] [PASSED] ALDERLAKE_P (B0)
[15:55:06] [PASSED] ALDERLAKE_P (C0)
[15:55:06] [PASSED] ALDERLAKE_S_RPLS (D0)
[15:55:06] [PASSED] ALDERLAKE_P_RPLU (E0)
[15:55:06] [PASSED] DG2_G10 (C0)
[15:55:06] [PASSED] DG2_G11 (B1)
[15:55:06] [PASSED] DG2_G12 (A1)
[15:55:06] [PASSED] METEORLAKE (g:A0, m:A0)
[15:55:06] [PASSED] METEORLAKE (g:A0, m:A0)
[15:55:06] [PASSED] METEORLAKE (g:A0, m:A0)
[15:55:06] [PASSED] LUNARLAKE (g:A0, m:A0)
[15:55:06] [PASSED] LUNARLAKE (g:B0, m:A0)
[15:55:06] [PASSED] BATTLEMAGE (g:A0, m:A1)
[15:55:06] ==================== [PASSED] xe_wa_gt =====================
[15:55:06] ====================== [PASSED] xe_wa ======================
[15:55:06] ============================================================
[15:55:06] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[15:55:06] Elapsed time: 30.894s total, 4.215s configuring, 26.363s building, 0.301s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[15:55:06] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:55:08] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[15:55:29] Starting KUnit Kernel (1/1)...
[15:55:29] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[15:55:29] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[15:55:29] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[15:55:29] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[15:55:29] =========== drm_validate_clone_mode (2 subtests) ===========
[15:55:29] ============== drm_test_check_in_clone_mode  ===============
[15:55:29] [PASSED] in_clone_mode
[15:55:29] [PASSED] not_in_clone_mode
[15:55:29] ========== [PASSED] drm_test_check_in_clone_mode ===========
[15:55:29] =============== drm_test_check_valid_clones  ===============
[15:55:29] [PASSED] not_in_clone_mode
[15:55:29] [PASSED] valid_clone
[15:55:29] [PASSED] invalid_clone
[15:55:29] =========== [PASSED] drm_test_check_valid_clones ===========
[15:55:29] ============= [PASSED] drm_validate_clone_mode =============
[15:55:29] ============= drm_validate_modeset (1 subtest) =============
[15:55:29] [PASSED] drm_test_check_connector_changed_modeset
[15:55:29] ============== [PASSED] drm_validate_modeset ===============
[15:55:29] ====== drm_test_bridge_get_current_state (2 subtests) ======
[15:55:29] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[15:55:29] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[15:55:29] ======== [PASSED] drm_test_bridge_get_current_state ========
[15:55:29] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[15:55:29] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[15:55:29] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[15:55:29] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[15:55:29] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[15:55:29] ================== drm_buddy (7 subtests) ==================
[15:55:29] [PASSED] drm_test_buddy_alloc_limit
[15:55:29] [PASSED] drm_test_buddy_alloc_optimistic
[15:55:29] [PASSED] drm_test_buddy_alloc_pessimistic
[15:55:29] [PASSED] drm_test_buddy_alloc_pathological
[15:55:29] [PASSED] drm_test_buddy_alloc_contiguous
[15:55:29] [PASSED] drm_test_buddy_alloc_clear
[15:55:29] [PASSED] drm_test_buddy_alloc_range_bias
[15:55:29] ==================== [PASSED] drm_buddy ====================
[15:55:29] ============= drm_cmdline_parser (40 subtests) =============
[15:55:29] [PASSED] drm_test_cmdline_force_d_only
[15:55:29] [PASSED] drm_test_cmdline_force_D_only_dvi
[15:55:29] [PASSED] drm_test_cmdline_force_D_only_hdmi
[15:55:29] [PASSED] drm_test_cmdline_force_D_only_not_digital
[15:55:29] [PASSED] drm_test_cmdline_force_e_only
[15:55:29] [PASSED] drm_test_cmdline_res
[15:55:29] [PASSED] drm_test_cmdline_res_vesa
[15:55:29] [PASSED] drm_test_cmdline_res_vesa_rblank
[15:55:29] [PASSED] drm_test_cmdline_res_rblank
[15:55:29] [PASSED] drm_test_cmdline_res_bpp
[15:55:29] [PASSED] drm_test_cmdline_res_refresh
[15:55:29] [PASSED] drm_test_cmdline_res_bpp_refresh
[15:55:29] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[15:55:29] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[15:55:29] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[15:55:29] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[15:55:29] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[15:55:29] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[15:55:29] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[15:55:29] [PASSED] drm_test_cmdline_res_margins_force_on
[15:55:29] [PASSED] drm_test_cmdline_res_vesa_margins
[15:55:29] [PASSED] drm_test_cmdline_name
[15:55:29] [PASSED] drm_test_cmdline_name_bpp
[15:55:29] [PASSED] drm_test_cmdline_name_option
[15:55:29] [PASSED] drm_test_cmdline_name_bpp_option
[15:55:29] [PASSED] drm_test_cmdline_rotate_0
[15:55:29] [PASSED] drm_test_cmdline_rotate_90
[15:55:29] [PASSED] drm_test_cmdline_rotate_180
[15:55:29] [PASSED] drm_test_cmdline_rotate_270
[15:55:29] [PASSED] drm_test_cmdline_hmirror
[15:55:29] [PASSED] drm_test_cmdline_vmirror
[15:55:29] [PASSED] drm_test_cmdline_margin_options
[15:55:29] [PASSED] drm_test_cmdline_multiple_options
[15:55:29] [PASSED] drm_test_cmdline_bpp_extra_and_option
[15:55:29] [PASSED] drm_test_cmdline_extra_and_option
[15:55:29] [PASSED] drm_test_cmdline_freestanding_options
[15:55:29] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[15:55:29] [PASSED] drm_test_cmdline_panel_orientation
[15:55:29] ================ drm_test_cmdline_invalid  =================
[15:55:29] [PASSED] margin_only
[15:55:29] [PASSED] interlace_only
[15:55:29] [PASSED] res_missing_x
[15:55:29] [PASSED] res_missing_y
[15:55:29] [PASSED] res_bad_y
[15:55:29] [PASSED] res_missing_y_bpp
[15:55:29] [PASSED] res_bad_bpp
[15:55:29] [PASSED] res_bad_refresh
[15:55:29] [PASSED] res_bpp_refresh_force_on_off
[15:55:29] [PASSED] res_invalid_mode
[15:55:29] [PASSED] res_bpp_wrong_place_mode
[15:55:29] [PASSED] name_bpp_refresh
[15:55:29] [PASSED] name_refresh
[15:55:29] [PASSED] name_refresh_wrong_mode
[15:55:29] [PASSED] name_refresh_invalid_mode
[15:55:29] [PASSED] rotate_multiple
[15:55:29] [PASSED] rotate_invalid_val
[15:55:29] [PASSED] rotate_truncated
[15:55:29] [PASSED] invalid_option
[15:55:29] [PASSED] invalid_tv_option
[15:55:29] [PASSED] truncated_tv_option
[15:55:29] ============ [PASSED] drm_test_cmdline_invalid =============
[15:55:29] =============== drm_test_cmdline_tv_options  ===============
[15:55:29] [PASSED] NTSC
[15:55:29] [PASSED] NTSC_443
[15:55:29] [PASSED] NTSC_J
[15:55:29] [PASSED] PAL
[15:55:29] [PASSED] PAL_M
[15:55:29] [PASSED] PAL_N
[15:55:29] [PASSED] SECAM
[15:55:29] [PASSED] MONO_525
[15:55:29] [PASSED] MONO_625
[15:55:29] =========== [PASSED] drm_test_cmdline_tv_options ===========
[15:55:29] =============== [PASSED] drm_cmdline_parser ================
[15:55:29] ========== drmm_connector_hdmi_init (20 subtests) ==========
[15:55:29] [PASSED] drm_test_connector_hdmi_init_valid
[15:55:29] [PASSED] drm_test_connector_hdmi_init_bpc_8
[15:55:29] [PASSED] drm_test_connector_hdmi_init_bpc_10
[15:55:29] [PASSED] drm_test_connector_hdmi_init_bpc_12
[15:55:29] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[15:55:29] [PASSED] drm_test_connector_hdmi_init_bpc_null
[15:55:29] [PASSED] drm_test_connector_hdmi_init_formats_empty
[15:55:29] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[15:55:29] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[15:55:29] [PASSED] supported_formats=0x9 yuv420_allowed=1
[15:55:29] [PASSED] supported_formats=0x9 yuv420_allowed=0
[15:55:29] [PASSED] supported_formats=0x3 yuv420_allowed=1
[15:55:29] [PASSED] supported_formats=0x3 yuv420_allowed=0
[15:55:29] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[15:55:29] [PASSED] drm_test_connector_hdmi_init_null_ddc
[15:55:29] [PASSED] drm_test_connector_hdmi_init_null_product
[15:55:29] [PASSED] drm_test_connector_hdmi_init_null_vendor
[15:55:29] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[15:55:29] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[15:55:29] [PASSED] drm_test_connector_hdmi_init_product_valid
[15:55:29] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[15:55:29] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[15:55:29] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[15:55:29] ========= drm_test_connector_hdmi_init_type_valid  =========
[15:55:29] [PASSED] HDMI-A
[15:55:29] [PASSED] HDMI-B
[15:55:29] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[15:55:29] ======== drm_test_connector_hdmi_init_type_invalid  ========
[15:55:29] [PASSED] Unknown
[15:55:29] [PASSED] VGA
[15:55:29] [PASSED] DVI-I
[15:55:29] [PASSED] DVI-D
[15:55:29] [PASSED] DVI-A
[15:55:29] [PASSED] Composite
[15:55:29] [PASSED] SVIDEO
[15:55:29] [PASSED] LVDS
[15:55:29] [PASSED] Component
[15:55:29] [PASSED] DIN
[15:55:29] [PASSED] DP
[15:55:29] [PASSED] TV
[15:55:29] [PASSED] eDP
[15:55:29] [PASSED] Virtual
[15:55:29] [PASSED] DSI
[15:55:29] [PASSED] DPI
[15:55:29] [PASSED] Writeback
[15:55:29] [PASSED] SPI
[15:55:29] [PASSED] USB
[15:55:29] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[15:55:29] ============ [PASSED] drmm_connector_hdmi_init =============
[15:55:29] ============= drmm_connector_init (3 subtests) =============
[15:55:29] [PASSED] drm_test_drmm_connector_init
[15:55:29] [PASSED] drm_test_drmm_connector_init_null_ddc
[15:55:29] ========= drm_test_drmm_connector_init_type_valid  =========
[15:55:29] [PASSED] Unknown
[15:55:29] [PASSED] VGA
[15:55:29] [PASSED] DVI-I
[15:55:29] [PASSED] DVI-D
[15:55:29] [PASSED] DVI-A
[15:55:29] [PASSED] Composite
[15:55:29] [PASSED] SVIDEO
[15:55:29] [PASSED] LVDS
[15:55:29] [PASSED] Component
[15:55:29] [PASSED] DIN
[15:55:29] [PASSED] DP
[15:55:29] [PASSED] HDMI-A
[15:55:29] [PASSED] HDMI-B
[15:55:29] [PASSED] TV
[15:55:29] [PASSED] eDP
[15:55:29] [PASSED] Virtual
[15:55:29] [PASSED] DSI
[15:55:29] [PASSED] DPI
[15:55:29] [PASSED] Writeback
[15:55:29] [PASSED] SPI
[15:55:29] [PASSED] USB
[15:55:29] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[15:55:29] =============== [PASSED] drmm_connector_init ===============
[15:55:29] ========= drm_connector_dynamic_init (6 subtests) ==========
[15:55:29] [PASSED] drm_test_drm_connector_dynamic_init
[15:55:29] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[15:55:29] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[15:55:29] [PASSED] drm_test_drm_connector_dynamic_init_properties
[15:55:29] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[15:55:29] [PASSED] Unknown
[15:55:29] [PASSED] VGA
[15:55:29] [PASSED] DVI-I
[15:55:29] [PASSED] DVI-D
[15:55:29] [PASSED] DVI-A
[15:55:29] [PASSED] Composite
[15:55:29] [PASSED] SVIDEO
[15:55:29] [PASSED] LVDS
[15:55:29] [PASSED] Component
[15:55:29] [PASSED] DIN
[15:55:29] [PASSED] DP
[15:55:29] [PASSED] HDMI-A
[15:55:29] [PASSED] HDMI-B
[15:55:29] [PASSED] TV
[15:55:29] [PASSED] eDP
[15:55:29] [PASSED] Virtual
[15:55:29] [PASSED] DSI
[15:55:29] [PASSED] DPI
[15:55:29] [PASSED] Writeback
[15:55:29] [PASSED] SPI
[15:55:29] [PASSED] USB
[15:55:29] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[15:55:29] ======== drm_test_drm_connector_dynamic_init_name  =========
[15:55:29] [PASSED] Unknown
[15:55:29] [PASSED] VGA
[15:55:29] [PASSED] DVI-I
[15:55:29] [PASSED] DVI-D
[15:55:29] [PASSED] DVI-A
[15:55:29] [PASSED] Composite
[15:55:29] [PASSED] SVIDEO
[15:55:29] [PASSED] LVDS
[15:55:29] [PASSED] Component
[15:55:29] [PASSED] DIN
[15:55:29] [PASSED] DP
[15:55:29] [PASSED] HDMI-A
[15:55:29] [PASSED] HDMI-B
[15:55:29] [PASSED] TV
[15:55:29] [PASSED] eDP
[15:55:29] [PASSED] Virtual
[15:55:29] [PASSED] DSI
[15:55:29] [PASSED] DPI
[15:55:29] [PASSED] Writeback
[15:55:29] [PASSED] SPI
[15:55:29] [PASSED] USB
[15:55:29] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[15:55:29] =========== [PASSED] drm_connector_dynamic_init ============
[15:55:29] ==== drm_connector_dynamic_register_early (4 subtests) =====
[15:55:29] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[15:55:29] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[15:55:29] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[15:55:29] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[15:55:29] ====== [PASSED] drm_connector_dynamic_register_early =======
[15:55:29] ======= drm_connector_dynamic_register (7 subtests) ========
[15:55:29] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[15:55:29] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[15:55:29] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[15:55:29] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[15:55:29] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[15:55:29] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[15:55:29] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[15:55:29] ========= [PASSED] drm_connector_dynamic_register ==========
[15:55:29] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[15:55:29] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[15:55:29] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[15:55:29] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[15:55:29] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[15:55:29] ========== drm_test_get_tv_mode_from_name_valid  ===========
[15:55:29] [PASSED] NTSC
[15:55:29] [PASSED] NTSC-443
[15:55:29] [PASSED] NTSC-J
[15:55:29] [PASSED] PAL
[15:55:29] [PASSED] PAL-M
[15:55:29] [PASSED] PAL-N
[15:55:29] [PASSED] SECAM
[15:55:29] [PASSED] Mono
[15:55:29] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[15:55:29] [PASSED] drm_test_get_tv_mode_from_name_truncated
[15:55:29] ============ [PASSED] drm_get_tv_mode_from_name ============
[15:55:29] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[15:55:29] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[15:55:29] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[15:55:29] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[15:55:29] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[15:55:29] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[15:55:29] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[15:55:29] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[15:55:29] [PASSED] VIC 96
[15:55:29] [PASSED] VIC 97
[15:55:29] [PASSED] VIC 101
[15:55:29] [PASSED] VIC 102
[15:55:29] [PASSED] VIC 106
[15:55:29] [PASSED] VIC 107
[15:55:29] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[15:55:29] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[15:55:29] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[15:55:29] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[15:55:29] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[15:55:29] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[15:55:29] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[15:55:29] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[15:55:29] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[15:55:29] [PASSED] Automatic
[15:55:29] [PASSED] Full
[15:55:29] [PASSED] Limited 16:235
[15:55:29] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[15:55:29] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[15:55:29] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[15:55:29] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[15:55:29] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[15:55:29] [PASSED] RGB
[15:55:29] [PASSED] YUV 4:2:0
[15:55:29] [PASSED] YUV 4:2:2
[15:55:29] [PASSED] YUV 4:4:4
[15:55:29] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[15:55:29] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[15:55:29] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[15:55:29] ============= drm_damage_helper (21 subtests) ==============
[15:55:29] [PASSED] drm_test_damage_iter_no_damage
[15:55:29] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[15:55:29] [PASSED] drm_test_damage_iter_no_damage_src_moved
[15:55:29] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[15:55:29] [PASSED] drm_test_damage_iter_no_damage_not_visible
[15:55:29] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[15:55:29] [PASSED] drm_test_damage_iter_no_damage_no_fb
[15:55:29] [PASSED] drm_test_damage_iter_simple_damage
[15:55:29] [PASSED] drm_test_damage_iter_single_damage
[15:55:29] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[15:55:29] [PASSED] drm_test_damage_iter_single_damage_outside_src
[15:55:29] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[15:55:29] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[15:55:29] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[15:55:29] [PASSED] drm_test_damage_iter_single_damage_src_moved
[15:55:29] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[15:55:29] [PASSED] drm_test_damage_iter_damage
[15:55:29] [PASSED] drm_test_damage_iter_damage_one_intersect
[15:55:29] [PASSED] drm_test_damage_iter_damage_one_outside
[15:55:29] [PASSED] drm_test_damage_iter_damage_src_moved
[15:55:29] [PASSED] drm_test_damage_iter_damage_not_visible
[15:55:29] ================ [PASSED] drm_damage_helper ================
[15:55:29] ============== drm_dp_mst_helper (3 subtests) ==============
[15:55:29] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[15:55:29] [PASSED] Clock 154000 BPP 30 DSC disabled
[15:55:29] [PASSED] Clock 234000 BPP 30 DSC disabled
[15:55:29] [PASSED] Clock 297000 BPP 24 DSC disabled
[15:55:29] [PASSED] Clock 332880 BPP 24 DSC enabled
[15:55:29] [PASSED] Clock 324540 BPP 24 DSC enabled
[15:55:29] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[15:55:29] ============== drm_test_dp_mst_calc_pbn_div  ===============
[15:55:29] [PASSED] Link rate 2000000 lane count 4
[15:55:29] [PASSED] Link rate 2000000 lane count 2
[15:55:29] [PASSED] Link rate 2000000 lane count 1
[15:55:29] [PASSED] Link rate 1350000 lane count 4
[15:55:29] [PASSED] Link rate 1350000 lane count 2
[15:55:29] [PASSED] Link rate 1350000 lane count 1
[15:55:29] [PASSED] Link rate 1000000 lane count 4
[15:55:29] [PASSED] Link rate 1000000 lane count 2
[15:55:29] [PASSED] Link rate 1000000 lane count 1
[15:55:29] [PASSED] Link rate 810000 lane count 4
[15:55:29] [PASSED] Link rate 810000 lane count 2
[15:55:29] [PASSED] Link rate 810000 lane count 1
[15:55:29] [PASSED] Link rate 540000 lane count 4
[15:55:29] [PASSED] Link rate 540000 lane count 2
[15:55:29] [PASSED] Link rate 540000 lane count 1
[15:55:29] [PASSED] Link rate 270000 lane count 4
[15:55:29] [PASSED] Link rate 270000 lane count 2
[15:55:29] [PASSED] Link rate 270000 lane count 1
[15:55:29] [PASSED] Link rate 162000 lane count 4
[15:55:29] [PASSED] Link rate 162000 lane count 2
[15:55:29] [PASSED] Link rate 162000 lane count 1
[15:55:29] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[15:55:29] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[15:55:29] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[15:55:29] [PASSED] DP_POWER_UP_PHY with port number
[15:55:29] [PASSED] DP_POWER_DOWN_PHY with port number
[15:55:29] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[15:55:29] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[15:55:29] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[15:55:29] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[15:55:29] [PASSED] DP_QUERY_PAYLOAD with port number
[15:55:29] [PASSED] DP_QUERY_PAYLOAD with VCPI
[15:55:29] [PASSED] DP_REMOTE_DPCD_READ with port number
[15:55:29] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[15:55:29] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[15:55:29] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[15:55:29] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[15:55:29] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[15:55:29] [PASSED] DP_REMOTE_I2C_READ with port number
[15:55:29] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[15:55:29] [PASSED] DP_REMOTE_I2C_READ with transactions array
[15:55:29] [PASSED] DP_REMOTE_I2C_WRITE with port number
[15:55:29] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[15:55:29] [PASSED] DP_REMOTE_I2C_WRITE with data array
[15:55:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[15:55:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[15:55:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[15:55:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[15:55:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[15:55:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[15:55:29] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[15:55:29] ================ [PASSED] drm_dp_mst_helper ================
[15:55:29] ================== drm_exec (7 subtests) ===================
[15:55:29] [PASSED] sanitycheck
[15:55:29] [PASSED] test_lock
[15:55:29] [PASSED] test_lock_unlock
[15:55:29] [PASSED] test_duplicates
[15:55:29] [PASSED] test_prepare
[15:55:29] [PASSED] test_prepare_array
[15:55:29] [PASSED] test_multiple_loops
[15:55:29] ==================== [PASSED] drm_exec =====================
[15:55:29] =========== drm_format_helper_test (18 subtests) ===========
[15:55:29] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[15:55:29] [PASSED] single_pixel_source_buffer
[15:55:29] [PASSED] single_pixel_clip_rectangle
[15:55:29] [PASSED] well_known_colors
[15:55:29] [PASSED] destination_pitch
[15:55:29] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[15:55:29] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[15:55:29] [PASSED] single_pixel_source_buffer
[15:55:29] [PASSED] single_pixel_clip_rectangle
[15:55:29] [PASSED] well_known_colors
[15:55:29] [PASSED] destination_pitch
[15:55:29] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[15:55:29] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[15:55:29] [PASSED] single_pixel_source_buffer
[15:55:29] [PASSED] single_pixel_clip_rectangle
[15:55:29] [PASSED] well_known_colors
[15:55:29] [PASSED] destination_pitch
[15:55:29] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[15:55:29] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[15:55:29] [PASSED] single_pixel_source_buffer
[15:55:29] [PASSED] single_pixel_clip_rectangle
[15:55:29] [PASSED] well_known_colors
[15:55:29] [PASSED] destination_pitch
[15:55:29] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[15:55:29] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[15:55:29] [PASSED] single_pixel_source_buffer
[15:55:29] [PASSED] single_pixel_clip_rectangle
[15:55:29] [PASSED] well_known_colors
[15:55:29] [PASSED] destination_pitch
[15:55:29] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[15:55:29] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[15:55:29] [PASSED] single_pixel_source_buffer
[15:55:29] [PASSED] single_pixel_clip_rectangle
[15:55:29] [PASSED] well_known_colors
[15:55:29] [PASSED] destination_pitch
[15:55:29] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[15:55:29] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[15:55:29] [PASSED] single_pixel_source_buffer
[15:55:29] [PASSED] single_pixel_clip_rectangle
[15:55:29] [PASSED] well_known_colors
[15:55:29] [PASSED] destination_pitch
[15:55:29] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[15:55:29] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[15:55:29] [PASSED] single_pixel_source_buffer
[15:55:29] [PASSED] single_pixel_clip_rectangle
[15:55:29] [PASSED] well_known_colors
[15:55:29] [PASSED] destination_pitch
[15:55:29] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[15:55:29] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[15:55:29] [PASSED] single_pixel_source_buffer
[15:55:29] [PASSED] single_pixel_clip_rectangle
[15:55:29] [PASSED] well_known_colors
[15:55:29] [PASSED] destination_pitch
[15:55:29] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[15:55:29] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[15:55:29] [PASSED] single_pixel_source_buffer
[15:55:29] [PASSED] single_pixel_clip_rectangle
[15:55:29] [PASSED] well_known_colors
[15:55:29] [PASSED] destination_pitch
[15:55:29] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[15:55:29] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[15:55:29] [PASSED] single_pixel_source_buffer
[15:55:29] [PASSED] single_pixel_clip_rectangle
[15:55:29] [PASSED] well_known_colors
[15:55:29] [PASSED] destination_pitch
[15:55:29] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[15:55:29] ============== drm_test_fb_xrgb8888_to_mono  ===============
[15:55:29] [PASSED] single_pixel_source_buffer
[15:55:29] [PASSED] single_pixel_clip_rectangle
[15:55:29] [PASSED] well_known_colors
[15:55:29] [PASSED] destination_pitch
[15:55:29] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[15:55:29] ==================== drm_test_fb_swab  =====================
[15:55:29] [PASSED] single_pixel_source_buffer
[15:55:29] [PASSED] single_pixel_clip_rectangle
[15:55:29] [PASSED] well_known_colors
[15:55:29] [PASSED] destination_pitch
[15:55:29] ================ [PASSED] drm_test_fb_swab =================
[15:55:29] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[15:55:29] [PASSED] single_pixel_source_buffer
[15:55:29] [PASSED] single_pixel_clip_rectangle
[15:55:29] [PASSED] well_known_colors
[15:55:29] [PASSED] destination_pitch
[15:55:29] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[15:55:29] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[15:55:29] [PASSED] single_pixel_source_buffer
[15:55:29] [PASSED] single_pixel_clip_rectangle
[15:55:29] [PASSED] well_known_colors
[15:55:29] [PASSED] destination_pitch
[15:55:29] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[15:55:29] ================= drm_test_fb_clip_offset  =================
[15:55:29] [PASSED] pass through
[15:55:29] [PASSED] horizontal offset
[15:55:29] [PASSED] vertical offset
[15:55:29] [PASSED] horizontal and vertical offset
[15:55:29] [PASSED] horizontal offset (custom pitch)
[15:55:29] [PASSED] vertical offset (custom pitch)
[15:55:29] [PASSED] horizontal and vertical offset (custom pitch)
[15:55:29] ============= [PASSED] drm_test_fb_clip_offset =============
[15:55:29] ============== drm_test_fb_build_fourcc_list  ==============
[15:55:29] [PASSED] no native formats
[15:55:29] [PASSED] XRGB8888 as native format
[15:55:29] [PASSED] remove duplicates
[15:55:29] [PASSED] convert alpha formats
[15:55:29] [PASSED] random formats
[15:55:29] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[15:55:29] =================== drm_test_fb_memcpy  ====================
[15:55:29] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[15:55:29] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[15:55:29] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[15:55:29] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[15:55:29] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[15:55:29] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[15:55:29] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[15:55:29] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[15:55:29] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[15:55:29] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[15:55:29] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[15:55:29] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[15:55:29] =============== [PASSED] drm_test_fb_memcpy ================
[15:55:29] ============= [PASSED] drm_format_helper_test ==============
[15:55:29] ================= drm_format (18 subtests) =================
[15:55:29] [PASSED] drm_test_format_block_width_invalid
[15:55:29] [PASSED] drm_test_format_block_width_one_plane
[15:55:29] [PASSED] drm_test_format_block_width_two_plane
[15:55:29] [PASSED] drm_test_format_block_width_three_plane
[15:55:29] [PASSED] drm_test_format_block_width_tiled
[15:55:29] [PASSED] drm_test_format_block_height_invalid
[15:55:29] [PASSED] drm_test_format_block_height_one_plane
[15:55:29] [PASSED] drm_test_format_block_height_two_plane
[15:55:29] [PASSED] drm_test_format_block_height_three_plane
[15:55:29] [PASSED] drm_test_format_block_height_tiled
[15:55:29] [PASSED] drm_test_format_min_pitch_invalid
[15:55:29] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[15:55:29] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[15:55:29] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[15:55:29] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[15:55:29] [PASSED] drm_test_format_min_pitch_two_plane
[15:55:29] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[15:55:29] [PASSED] drm_test_format_min_pitch_tiled
[15:55:29] =================== [PASSED] drm_format ====================
[15:55:29] ============== drm_framebuffer (10 subtests) ===============
[15:55:29] ========== drm_test_framebuffer_check_src_coords  ==========
[15:55:29] [PASSED] Success: source fits into fb
[15:55:29] [PASSED] Fail: overflowing fb with x-axis coordinate
[15:55:29] [PASSED] Fail: overflowing fb with y-axis coordinate
[15:55:29] [PASSED] Fail: overflowing fb with source width
[15:55:29] [PASSED] Fail: overflowing fb with source height
[15:55:29] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[15:55:29] [PASSED] drm_test_framebuffer_cleanup
[15:55:29] =============== drm_test_framebuffer_create  ===============
[15:55:29] [PASSED] ABGR8888 normal sizes
[15:55:29] [PASSED] ABGR8888 max sizes
[15:55:29] [PASSED] ABGR8888 pitch greater than min required
[15:55:29] [PASSED] ABGR8888 pitch less than min required
[15:55:29] [PASSED] ABGR8888 Invalid width
[15:55:29] [PASSED] ABGR8888 Invalid buffer handle
[15:55:29] [PASSED] No pixel format
[15:55:29] [PASSED] ABGR8888 Width 0
[15:55:29] [PASSED] ABGR8888 Height 0
[15:55:29] [PASSED] ABGR8888 Out of bound height * pitch combination
[15:55:29] [PASSED] ABGR8888 Large buffer offset
[15:55:29] [PASSED] ABGR8888 Buffer offset for inexistent plane
[15:55:29] [PASSED] ABGR8888 Invalid flag
[15:55:29] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[15:55:29] [PASSED] ABGR8888 Valid buffer modifier
[15:55:29] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[15:55:29] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[15:55:29] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[15:55:29] [PASSED] NV12 Normal sizes
[15:55:29] [PASSED] NV12 Max sizes
[15:55:29] [PASSED] NV12 Invalid pitch
[15:55:29] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[15:55:29] [PASSED] NV12 different  modifier per-plane
[15:55:29] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[15:55:29] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[15:55:29] [PASSED] NV12 Modifier for inexistent plane
[15:55:29] [PASSED] NV12 Handle for inexistent plane
[15:55:29] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[15:55:29] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[15:55:29] [PASSED] YVU420 Normal sizes
[15:55:29] [PASSED] YVU420 Max sizes
[15:55:29] [PASSED] YVU420 Invalid pitch
[15:55:29] [PASSED] YVU420 Different pitches
[15:55:29] [PASSED] YVU420 Different buffer offsets/pitches
[15:55:29] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[15:55:29] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[15:55:29] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[15:55:29] [PASSED] YVU420 Valid modifier
[15:55:29] [PASSED] YVU420 Different modifiers per plane
[15:55:29] [PASSED] YVU420 Modifier for inexistent plane
[15:55:29] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[15:55:29] [PASSED] X0L2 Normal sizes
[15:55:29] [PASSED] X0L2 Max sizes
[15:55:29] [PASSED] X0L2 Invalid pitch
[15:55:29] [PASSED] X0L2 Pitch greater than minimum required
[15:55:29] [PASSED] X0L2 Handle for inexistent plane
[15:55:29] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[15:55:29] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[15:55:29] [PASSED] X0L2 Valid modifier
[15:55:29] [PASSED] X0L2 Modifier for inexistent plane
[15:55:29] =========== [PASSED] drm_test_framebuffer_create ===========
[15:55:29] [PASSED] drm_test_framebuffer_free
[15:55:29] [PASSED] drm_test_framebuffer_init
[15:55:29] [PASSED] drm_test_framebuffer_init_bad_format
[15:55:29] [PASSED] drm_test_framebuffer_init_dev_mismatch
[15:55:29] [PASSED] drm_test_framebuffer_lookup
[15:55:29] [PASSED] drm_test_framebuffer_lookup_inexistent
[15:55:29] [PASSED] drm_test_framebuffer_modifiers_not_supported
[15:55:29] ================= [PASSED] drm_framebuffer =================
[15:55:29] ================ drm_gem_shmem (8 subtests) ================
[15:55:29] [PASSED] drm_gem_shmem_test_obj_create
[15:55:29] [PASSED] drm_gem_shmem_test_obj_create_private
[15:55:29] [PASSED] drm_gem_shmem_test_pin_pages
[15:55:29] [PASSED] drm_gem_shmem_test_vmap
[15:55:29] [PASSED] drm_gem_shmem_test_get_pages_sgt
[15:55:29] [PASSED] drm_gem_shmem_test_get_sg_table
[15:55:29] [PASSED] drm_gem_shmem_test_madvise
[15:55:29] [PASSED] drm_gem_shmem_test_purge
[15:55:29] ================== [PASSED] drm_gem_shmem ==================
[15:55:29] === drm_atomic_helper_connector_hdmi_check (23 subtests) ===
[15:55:29] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[15:55:29] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[15:55:29] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[15:55:29] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[15:55:29] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[15:55:29] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[15:55:29] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[15:55:29] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[15:55:29] [PASSED] drm_test_check_disable_connector
[15:55:29] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[15:55:29] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[15:55:29] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[15:55:29] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[15:55:29] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[15:55:29] [PASSED] drm_test_check_output_bpc_dvi
[15:55:29] [PASSED] drm_test_check_output_bpc_format_vic_1
[15:55:29] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[15:55:29] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[15:55:29] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[15:55:29] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[15:55:29] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[15:55:29] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[15:55:29] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[15:55:29] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[15:55:29] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[15:55:29] [PASSED] drm_test_check_broadcast_rgb_value
[15:55:29] [PASSED] drm_test_check_bpc_8_value
[15:55:29] [PASSED] drm_test_check_bpc_10_value
[15:55:29] [PASSED] drm_test_check_bpc_12_value
[15:55:29] [PASSED] drm_test_check_format_value
[15:55:29] [PASSED] drm_test_check_tmds_char_value
[15:55:29] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[15:55:29] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[15:55:29] [PASSED] drm_test_check_mode_valid
[15:55:29] [PASSED] drm_test_check_mode_valid_reject
[15:55:29] [PASSED] drm_test_check_mode_valid_reject_rate
[15:55:29] [PASSED] drm_test_check_mode_valid_reject_max_clock
[15:55:29] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[15:55:29] ================= drm_managed (2 subtests) =================
[15:55:29] [PASSED] drm_test_managed_release_action
[15:55:29] [PASSED] drm_test_managed_run_action
[15:55:29] =================== [PASSED] drm_managed ===================
[15:55:29] =================== drm_mm (6 subtests) ====================
[15:55:29] [PASSED] drm_test_mm_init
[15:55:29] [PASSED] drm_test_mm_debug
[15:55:29] [PASSED] drm_test_mm_align32
[15:55:29] [PASSED] drm_test_mm_align64
[15:55:29] [PASSED] drm_test_mm_lowest
[15:55:29] [PASSED] drm_test_mm_highest
[15:55:29] ===================== [PASSED] drm_mm ======================
[15:55:29] ============= drm_modes_analog_tv (5 subtests) =============
[15:55:29] [PASSED] drm_test_modes_analog_tv_mono_576i
[15:55:29] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[15:55:29] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[15:55:29] [PASSED] drm_test_modes_analog_tv_pal_576i
[15:55:29] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[15:55:29] =============== [PASSED] drm_modes_analog_tv ===============
[15:55:29] ============== drm_plane_helper (2 subtests) ===============
[15:55:29] =============== drm_test_check_plane_state  ================
[15:55:29] [PASSED] clipping_simple
[15:55:29] [PASSED] clipping_rotate_reflect
[15:55:29] [PASSED] positioning_simple
[15:55:29] [PASSED] upscaling
[15:55:29] [PASSED] downscaling
[15:55:29] [PASSED] rounding1
[15:55:29] [PASSED] rounding2
[15:55:29] [PASSED] rounding3
[15:55:29] [PASSED] rounding4
[15:55:29] =========== [PASSED] drm_test_check_plane_state ============
[15:55:29] =========== drm_test_check_invalid_plane_state  ============
[15:55:29] [PASSED] positioning_invalid
[15:55:29] [PASSED] upscaling_invalid
[15:55:29] [PASSED] downscaling_invalid
[15:55:29] ======= [PASSED] drm_test_check_invalid_plane_state ========
[15:55:29] ================ [PASSED] drm_plane_helper =================
[15:55:29] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[15:55:29] ====== drm_test_connector_helper_tv_get_modes_check  =======
[15:55:29] [PASSED] None
[15:55:29] [PASSED] PAL
[15:55:29] [PASSED] NTSC
[15:55:29] [PASSED] Both, NTSC Default
[15:55:29] [PASSED] Both, PAL Default
[15:55:29] [PASSED] Both, NTSC Default, with PAL on command-line
[15:55:29] [PASSED] Both, PAL Default, with NTSC on command-line
[15:55:29] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[15:55:29] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[15:55:29] ================== drm_rect (9 subtests) ===================
[15:55:29] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[15:55:29] [PASSED] drm_test_rect_clip_scaled_not_clipped
[15:55:29] [PASSED] drm_test_rect_clip_scaled_clipped
[15:55:29] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[15:55:29] ================= drm_test_rect_intersect  =================
[15:55:29] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[15:55:29] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[15:55:29] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[15:55:29] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[15:55:29] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[15:55:29] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[15:55:29] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[15:55:29] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[15:55:29] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[15:55:29] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[15:55:29] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[15:55:29] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[15:55:29] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[15:55:29] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[15:55:29] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[15:55:29] ============= [PASSED] drm_test_rect_intersect =============
[15:55:29] ================ drm_test_rect_calc_hscale  ================
[15:55:29] [PASSED] normal use
[15:55:29] [PASSED] out of max range
[15:55:29] [PASSED] out of min range
[15:55:29] [PASSED] zero dst
[15:55:29] [PASSED] negative src
[15:55:29] [PASSED] negative dst
[15:55:29] ============ [PASSED] drm_test_rect_calc_hscale ============
[15:55:29] ================ drm_test_rect_calc_vscale  ================
[15:55:29] [PASSED] normal use
[15:55:29] [PASSED] out of max range
[15:55:29] [PASSED] out of min range
[15:55:29] [PASSED] zero dst
[15:55:29] [PASSED] negative src
[15:55:29] [PASSED] negative dst
[15:55:29] ============ [PASSED] drm_test_rect_calc_vscale ============
[15:55:29] ================== drm_test_rect_rotate  ===================
[15:55:29] [PASSED] reflect-x
[15:55:29] [PASSED] reflect-y
[15:55:29] [PASSED] rotate-0
[15:55:29] [PASSED] rotate-90
[15:55:29] [PASSED] rotate-180
[15:55:29] [PASSED] rotate-270
[15:55:29] ============== [PASSED] drm_test_rect_rotate ===============
[15:55:29] ================ drm_test_rect_rotate_inv  =================
[15:55:29] [PASSED] reflect-x
[15:55:29] [PASSED] reflect-y
[15:55:29] [PASSED] rotate-0
[15:55:29] [PASSED] rotate-90
[15:55:29] [PASSED] rotate-180
[15:55:29] [PASSED] rotate-270
[15:55:29] ============ [PASSED] drm_test_rect_rotate_inv =============
stty: 'standard input': Inappropriate ioctl for device
[15:55:29] ==================== [PASSED] drm_rect =====================
[15:55:29] ============================================================
[15:55:29] Testing complete. Ran 608 tests: passed: 608
[15:55:29] Elapsed time: 23.345s total, 1.687s configuring, 21.492s building, 0.142s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[15:55:29] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:55:31] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[15:55:39] Starting KUnit Kernel (1/1)...
[15:55:39] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[15:55:39] ================= ttm_device (5 subtests) ==================
[15:55:39] [PASSED] ttm_device_init_basic
[15:55:39] [PASSED] ttm_device_init_multiple
[15:55:39] [PASSED] ttm_device_fini_basic
[15:55:39] [PASSED] ttm_device_init_no_vma_man
[15:55:39] ================== ttm_device_init_pools  ==================
[15:55:39] [PASSED] No DMA allocations, no DMA32 required
[15:55:39] [PASSED] DMA allocations, DMA32 required
[15:55:39] [PASSED] No DMA allocations, DMA32 required
[15:55:39] [PASSED] DMA allocations, no DMA32 required
[15:55:39] ============== [PASSED] ttm_device_init_pools ==============
[15:55:39] =================== [PASSED] ttm_device ====================
[15:55:39] ================== ttm_pool (8 subtests) ===================
[15:55:39] ================== ttm_pool_alloc_basic  ===================
[15:55:39] [PASSED] One page
[15:55:39] [PASSED] More than one page
[15:55:39] [PASSED] Above the allocation limit
[15:55:39] [PASSED] One page, with coherent DMA mappings enabled
[15:55:39] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[15:55:39] ============== [PASSED] ttm_pool_alloc_basic ===============
[15:55:39] ============== ttm_pool_alloc_basic_dma_addr  ==============
[15:55:39] [PASSED] One page
[15:55:39] [PASSED] More than one page
[15:55:39] [PASSED] Above the allocation limit
[15:55:39] [PASSED] One page, with coherent DMA mappings enabled
[15:55:39] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[15:55:39] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[15:55:39] [PASSED] ttm_pool_alloc_order_caching_match
[15:55:39] [PASSED] ttm_pool_alloc_caching_mismatch
[15:55:39] [PASSED] ttm_pool_alloc_order_mismatch
[15:55:39] [PASSED] ttm_pool_free_dma_alloc
[15:55:39] [PASSED] ttm_pool_free_no_dma_alloc
[15:55:39] [PASSED] ttm_pool_fini_basic
[15:55:39] ==================== [PASSED] ttm_pool =====================
[15:55:39] ================ ttm_resource (8 subtests) =================
[15:55:39] ================= ttm_resource_init_basic  =================
[15:55:39] [PASSED] Init resource in TTM_PL_SYSTEM
[15:55:39] [PASSED] Init resource in TTM_PL_VRAM
[15:55:39] [PASSED] Init resource in a private placement
[15:55:39] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[15:55:39] ============= [PASSED] ttm_resource_init_basic =============
[15:55:39] [PASSED] ttm_resource_init_pinned
[15:55:39] [PASSED] ttm_resource_fini_basic
[15:55:39] [PASSED] ttm_resource_manager_init_basic
[15:55:39] [PASSED] ttm_resource_manager_usage_basic
[15:55:39] [PASSED] ttm_resource_manager_set_used_basic
[15:55:39] [PASSED] ttm_sys_man_alloc_basic
[15:55:39] [PASSED] ttm_sys_man_free_basic
[15:55:39] ================== [PASSED] ttm_resource ===================
[15:55:39] =================== ttm_tt (15 subtests) ===================
[15:55:39] ==================== ttm_tt_init_basic  ====================
[15:55:39] [PASSED] Page-aligned size
[15:55:39] [PASSED] Extra pages requested
[15:55:39] ================ [PASSED] ttm_tt_init_basic ================
[15:55:39] [PASSED] ttm_tt_init_misaligned
[15:55:39] [PASSED] ttm_tt_fini_basic
[15:55:39] [PASSED] ttm_tt_fini_sg
[15:55:39] [PASSED] ttm_tt_fini_shmem
[15:55:39] [PASSED] ttm_tt_create_basic
[15:55:39] [PASSED] ttm_tt_create_invalid_bo_type
[15:55:39] [PASSED] ttm_tt_create_ttm_exists
[15:55:39] [PASSED] ttm_tt_create_failed
[15:55:39] [PASSED] ttm_tt_destroy_basic
[15:55:39] [PASSED] ttm_tt_populate_null_ttm
[15:55:39] [PASSED] ttm_tt_populate_populated_ttm
[15:55:39] [PASSED] ttm_tt_unpopulate_basic
[15:55:39] [PASSED] ttm_tt_unpopulate_empty_ttm
[15:55:39] [PASSED] ttm_tt_swapin_basic
[15:55:39] ===================== [PASSED] ttm_tt ======================
[15:55:39] =================== ttm_bo (14 subtests) ===================
[15:55:39] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[15:55:39] [PASSED] Cannot be interrupted and sleeps
[15:55:39] [PASSED] Cannot be interrupted, locks straight away
[15:55:39] [PASSED] Can be interrupted, sleeps
[15:55:39] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[15:55:39] [PASSED] ttm_bo_reserve_locked_no_sleep
[15:55:39] [PASSED] ttm_bo_reserve_no_wait_ticket
[15:55:39] [PASSED] ttm_bo_reserve_double_resv
[15:55:39] [PASSED] ttm_bo_reserve_interrupted
[15:55:39] [PASSED] ttm_bo_reserve_deadlock
[15:55:39] [PASSED] ttm_bo_unreserve_basic
[15:55:39] [PASSED] ttm_bo_unreserve_pinned
[15:55:39] [PASSED] ttm_bo_unreserve_bulk
[15:55:39] [PASSED] ttm_bo_put_basic
[15:55:39] [PASSED] ttm_bo_put_shared_resv
[15:55:39] [PASSED] ttm_bo_pin_basic
[15:55:39] [PASSED] ttm_bo_pin_unpin_resource
[15:55:39] [PASSED] ttm_bo_multiple_pin_one_unpin
[15:55:39] ===================== [PASSED] ttm_bo ======================
[15:55:39] ============== ttm_bo_validate (22 subtests) ===============
[15:55:39] ============== ttm_bo_init_reserved_sys_man  ===============
[15:55:39] [PASSED] Buffer object for userspace
[15:55:39] [PASSED] Kernel buffer object
[15:55:39] [PASSED] Shared buffer object
[15:55:39] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[15:55:39] ============== ttm_bo_init_reserved_mock_man  ==============
[15:55:39] [PASSED] Buffer object for userspace
[15:55:39] [PASSED] Kernel buffer object
[15:55:39] [PASSED] Shared buffer object
[15:55:39] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[15:55:39] [PASSED] ttm_bo_init_reserved_resv
[15:55:39] ================== ttm_bo_validate_basic  ==================
[15:55:39] [PASSED] Buffer object for userspace
[15:55:39] [PASSED] Kernel buffer object
[15:55:39] [PASSED] Shared buffer object
[15:55:39] ============== [PASSED] ttm_bo_validate_basic ==============
[15:55:39] [PASSED] ttm_bo_validate_invalid_placement
[15:55:39] ============= ttm_bo_validate_same_placement  ==============
[15:55:39] [PASSED] System manager
[15:55:39] [PASSED] VRAM manager
[15:55:39] ========= [PASSED] ttm_bo_validate_same_placement ==========
[15:55:39] [PASSED] ttm_bo_validate_failed_alloc
[15:55:39] [PASSED] ttm_bo_validate_pinned
[15:55:39] [PASSED] ttm_bo_validate_busy_placement
[15:55:39] ================ ttm_bo_validate_multihop  =================
[15:55:39] [PASSED] Buffer object for userspace
[15:55:39] [PASSED] Kernel buffer object
[15:55:39] [PASSED] Shared buffer object
[15:55:39] ============ [PASSED] ttm_bo_validate_multihop =============
[15:55:39] ========== ttm_bo_validate_no_placement_signaled  ==========
[15:55:39] [PASSED] Buffer object in system domain, no page vector
[15:55:39] [PASSED] Buffer object in system domain with an existing page vector
[15:55:39] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[15:55:39] ======== ttm_bo_validate_no_placement_not_signaled  ========
[15:55:39] [PASSED] Buffer object for userspace
[15:55:39] [PASSED] Kernel buffer object
[15:55:39] [PASSED] Shared buffer object
[15:55:39] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[15:55:39] [PASSED] ttm_bo_validate_move_fence_signaled
[15:55:39] ========= ttm_bo_validate_move_fence_not_signaled  =========
[15:55:39] [PASSED] Waits for GPU
[15:55:39] [PASSED] Tries to lock straight away
[15:55:39] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[15:55:39] [PASSED] ttm_bo_validate_swapout
[15:55:39] [PASSED] ttm_bo_validate_happy_evict
[15:55:39] [PASSED] ttm_bo_validate_all_pinned_evict
[15:55:39] [PASSED] ttm_bo_validate_allowed_only_evict
[15:55:39] [PASSED] ttm_bo_validate_deleted_evict
[15:55:39] [PASSED] ttm_bo_validate_busy_domain_evict
[15:55:39] [PASSED] ttm_bo_validate_evict_gutting
[15:55:39] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[15:55:39] ================= [PASSED] ttm_bo_validate =================
[15:55:39] ============================================================
[15:55:39] Testing complete. Ran 102 tests: passed: 102
[15:55:39] Elapsed time: 9.989s total, 1.695s configuring, 7.676s building, 0.529s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


