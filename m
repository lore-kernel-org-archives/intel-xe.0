Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B24C5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 22:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55ECB10E25D;
	Tue,  3 Jun 2025 22:57:58 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D7610E198;
 Tue,  3 Jun 2025 22:57:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_series_starting_with_=5Bv3=2C1?=
 =?utf-8?q?/2=5D_gpu/trace=3A_make_TRACE=5FGPU=5FMEM_configurable?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juston Li" <justonli@chromium.org>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Jun 2025 22:57:57 -0000
Message-ID: <174899147794.45504.7864274587434775957@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603225123.2535767-1-justonli@chromium.org>
In-Reply-To: <20250603225123.2535767-1-justonli@chromium.org>
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

Series: series starting with [v3,1/2] gpu/trace: make TRACE_GPU_MEM configurable
URL   : https://patchwork.freedesktop.org/series/149810/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[22:56:52] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:56:56] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[22:57:23] Starting KUnit Kernel (1/1)...
[22:57:23] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:57:23] ================== guc_buf (11 subtests) ===================
[22:57:23] [PASSED] test_smallest
[22:57:23] [PASSED] test_largest
[22:57:23] [PASSED] test_granular
[22:57:23] [PASSED] test_unique
[22:57:23] [PASSED] test_overlap
[22:57:23] [PASSED] test_reusable
[22:57:23] [PASSED] test_too_big
[22:57:23] [PASSED] test_flush
[22:57:23] [PASSED] test_lookup
[22:57:23] [PASSED] test_data
[22:57:23] [PASSED] test_class
[22:57:23] ===================== [PASSED] guc_buf =====================
[22:57:23] =================== guc_dbm (7 subtests) ===================
[22:57:23] [PASSED] test_empty
[22:57:23] [PASSED] test_default
[22:57:23] ======================== test_size  ========================
[22:57:23] [PASSED] 4
[22:57:23] [PASSED] 8
[22:57:23] [PASSED] 32
[22:57:23] [PASSED] 256
[22:57:23] ==================== [PASSED] test_size ====================
[22:57:23] ======================= test_reuse  ========================
[22:57:23] [PASSED] 4
[22:57:23] [PASSED] 8
[22:57:23] [PASSED] 32
[22:57:23] [PASSED] 256
[22:57:23] =================== [PASSED] test_reuse ====================
[22:57:23] =================== test_range_overlap  ====================
[22:57:23] [PASSED] 4
[22:57:23] [PASSED] 8
[22:57:23] [PASSED] 32
[22:57:23] [PASSED] 256
[22:57:23] =============== [PASSED] test_range_overlap ================
[22:57:23] =================== test_range_compact  ====================
[22:57:23] [PASSED] 4
[22:57:23] [PASSED] 8
[22:57:23] [PASSED] 32
[22:57:23] [PASSED] 256
[22:57:23] =============== [PASSED] test_range_compact ================
[22:57:23] ==================== test_range_spare  =====================
[22:57:23] [PASSED] 4
[22:57:23] [PASSED] 8
[22:57:23] [PASSED] 32
[22:57:23] [PASSED] 256
[22:57:23] ================ [PASSED] test_range_spare =================
[22:57:23] ===================== [PASSED] guc_dbm =====================
[22:57:23] =================== guc_idm (6 subtests) ===================
[22:57:23] [PASSED] bad_init
[22:57:23] [PASSED] no_init
[22:57:23] [PASSED] init_fini
[22:57:23] [PASSED] check_used
[22:57:23] [PASSED] check_quota
[22:57:23] [PASSED] check_all
[22:57:23] ===================== [PASSED] guc_idm =====================
[22:57:23] ================== no_relay (3 subtests) ===================
[22:57:23] [PASSED] xe_drops_guc2pf_if_not_ready
[22:57:23] [PASSED] xe_drops_guc2vf_if_not_ready
[22:57:23] [PASSED] xe_rejects_send_if_not_ready
[22:57:23] ==================== [PASSED] no_relay =====================
[22:57:23] ================== pf_relay (14 subtests) ==================
[22:57:23] [PASSED] pf_rejects_guc2pf_too_short
[22:57:23] [PASSED] pf_rejects_guc2pf_too_long
[22:57:23] [PASSED] pf_rejects_guc2pf_no_payload
[22:57:23] [PASSED] pf_fails_no_payload
[22:57:23] [PASSED] pf_fails_bad_origin
[22:57:23] [PASSED] pf_fails_bad_type
[22:57:23] [PASSED] pf_txn_reports_error
[22:57:23] [PASSED] pf_txn_sends_pf2guc
[22:57:23] [PASSED] pf_sends_pf2guc
[22:57:23] [SKIPPED] pf_loopback_nop
[22:57:23] [SKIPPED] pf_loopback_echo
[22:57:23] [SKIPPED] pf_loopback_fail
[22:57:23] [SKIPPED] pf_loopback_busy
[22:57:23] [SKIPPED] pf_loopback_retry
[22:57:23] ==================== [PASSED] pf_relay =====================
[22:57:23] ================== vf_relay (3 subtests) ===================
[22:57:23] [PASSED] vf_rejects_guc2vf_too_short
[22:57:23] [PASSED] vf_rejects_guc2vf_too_long
[22:57:23] [PASSED] vf_rejects_guc2vf_no_payload
[22:57:23] ==================== [PASSED] vf_relay =====================
[22:57:23] ================= pf_service (11 subtests) =================
[22:57:23] [PASSED] pf_negotiate_any
[22:57:23] [PASSED] pf_negotiate_base_match
[22:57:23] [PASSED] pf_negotiate_base_newer
[22:57:23] [PASSED] pf_negotiate_base_next
[22:57:23] [SKIPPED] pf_negotiate_base_older
[22:57:23] [PASSED] pf_negotiate_base_prev
[22:57:23] [PASSED] pf_negotiate_latest_match
[22:57:23] [PASSED] pf_negotiate_latest_newer
[22:57:23] [PASSED] pf_negotiate_latest_next
[22:57:23] [SKIPPED] pf_negotiate_latest_older
[22:57:23] [SKIPPED] pf_negotiate_latest_prev
[22:57:23] =================== [PASSED] pf_service ====================
[22:57:23] ===================== lmtt (1 subtest) =====================
[22:57:23] ======================== test_ops  =========================
[22:57:23] [PASSED] 2-level
[22:57:23] [PASSED] multi-level
[22:57:23] ==================== [PASSED] test_ops =====================
[22:57:23] ====================== [PASSED] lmtt =======================
[22:57:23] =================== xe_mocs (2 subtests) ===================
[22:57:23] ================ xe_live_mocs_kernel_kunit  ================
[22:57:23] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[22:57:23] ================ xe_live_mocs_reset_kunit  =================
[22:57:23] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[22:57:23] ==================== [SKIPPED] xe_mocs =====================
[22:57:23] ================= xe_migrate (2 subtests) ==================
[22:57:23] ================= xe_migrate_sanity_kunit  =================
[22:57:23] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[22:57:23] ================== xe_validate_ccs_kunit  ==================
[22:57:23] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[22:57:23] =================== [SKIPPED] xe_migrate ===================
[22:57:23] ================== xe_dma_buf (1 subtest) ==================
[22:57:23] ==================== xe_dma_buf_kunit  =====================
[22:57:23] ================ [SKIPPED] xe_dma_buf_kunit ================
[22:57:23] =================== [SKIPPED] xe_dma_buf ===================
[22:57:23] ================= xe_bo_shrink (1 subtest) =================
[22:57:23] =================== xe_bo_shrink_kunit  ====================
[22:57:23] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[22:57:23] ================== [SKIPPED] xe_bo_shrink ==================
[22:57:23] ==================== xe_bo (2 subtests) ====================
[22:57:23] ================== xe_ccs_migrate_kunit  ===================
[22:57:23] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[22:57:23] ==================== xe_bo_evict_kunit  ====================
[22:57:23] =============== [SKIPPED] xe_bo_evict_kunit ================
[22:57:23] ===================== [SKIPPED] xe_bo ======================
[22:57:23] ==================== args (11 subtests) ====================
[22:57:23] [PASSED] count_args_test
[22:57:23] [PASSED] call_args_example
[22:57:23] [PASSED] call_args_test
[22:57:23] [PASSED] drop_first_arg_example
[22:57:23] [PASSED] drop_first_arg_test
[22:57:23] [PASSED] first_arg_example
[22:57:23] [PASSED] first_arg_test
[22:57:23] [PASSED] last_arg_example
[22:57:23] [PASSED] last_arg_test
[22:57:23] [PASSED] pick_arg_example
[22:57:23] [PASSED] sep_comma_example
[22:57:23] ====================== [PASSED] args =======================
[22:57:23] =================== xe_pci (2 subtests) ====================
[22:57:23] [PASSED] xe_gmdid_graphics_ip
[22:57:23] [PASSED] xe_gmdid_media_ip
[22:57:23] ===================== [PASSED] xe_pci ======================
[22:57:23] =================== xe_rtp (2 subtests) ====================
[22:57:23] =============== xe_rtp_process_to_sr_tests  ================
[22:57:23] [PASSED] coalesce-same-reg
[22:57:23] [PASSED] no-match-no-add
[22:57:23] [PASSED] match-or
[22:57:23] [PASSED] match-or-xfail
[22:57:23] [PASSED] no-match-no-add-multiple-rules
[22:57:23] [PASSED] two-regs-two-entries
[22:57:23] [PASSED] clr-one-set-other
[22:57:23] [PASSED] set-field
[22:57:23] [PASSED] conflict-duplicate
[22:57:23] [PASSED] conflict-not-disjoint
stty: 'standard input': Inappropriate ioctl for device
[22:57:23] [PASSED] conflict-reg-type
[22:57:23] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[22:57:23] ================== xe_rtp_process_tests  ===================
[22:57:23] [PASSED] active1
[22:57:23] [PASSED] active2
[22:57:23] [PASSED] active-inactive
[22:57:23] [PASSED] inactive-active
[22:57:23] [PASSED] inactive-1st_or_active-inactive
[22:57:23] [PASSED] inactive-2nd_or_active-inactive
[22:57:23] [PASSED] inactive-last_or_active-inactive
[22:57:23] [PASSED] inactive-no_or_active-inactive
[22:57:23] ============== [PASSED] xe_rtp_process_tests ===============
[22:57:23] ===================== [PASSED] xe_rtp ======================
[22:57:23] ==================== xe_wa (1 subtest) =====================
[22:57:23] ======================== xe_wa_gt  =========================
[22:57:23] [PASSED] TIGERLAKE (B0)
[22:57:23] [PASSED] DG1 (A0)
[22:57:23] [PASSED] DG1 (B0)
[22:57:23] [PASSED] ALDERLAKE_S (A0)
[22:57:23] [PASSED] ALDERLAKE_S (B0)
[22:57:23] [PASSED] ALDERLAKE_S (C0)
[22:57:23] [PASSED] ALDERLAKE_S (D0)
[22:57:23] [PASSED] ALDERLAKE_P (A0)
[22:57:23] [PASSED] ALDERLAKE_P (B0)
[22:57:23] [PASSED] ALDERLAKE_P (C0)
[22:57:23] [PASSED] ALDERLAKE_S_RPLS (D0)
[22:57:23] [PASSED] ALDERLAKE_P_RPLU (E0)
[22:57:23] [PASSED] DG2_G10 (C0)
[22:57:23] [PASSED] DG2_G11 (B1)
[22:57:23] [PASSED] DG2_G12 (A1)
[22:57:23] [PASSED] METEORLAKE (g:A0, m:A0)
[22:57:23] [PASSED] METEORLAKE (g:A0, m:A0)
[22:57:23] [PASSED] METEORLAKE (g:A0, m:A0)
[22:57:23] [PASSED] LUNARLAKE (g:A0, m:A0)
[22:57:23] [PASSED] LUNARLAKE (g:B0, m:A0)
[22:57:23] [PASSED] BATTLEMAGE (g:A0, m:A1)
[22:57:23] ==================== [PASSED] xe_wa_gt =====================
[22:57:23] ====================== [PASSED] xe_wa ======================
[22:57:23] ============================================================
[22:57:23] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[22:57:23] Elapsed time: 31.023s total, 4.200s configuring, 26.508s building, 0.304s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[22:57:23] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:57:25] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[22:57:47] Starting KUnit Kernel (1/1)...
[22:57:47] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:57:47] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[22:57:47] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[22:57:47] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[22:57:47] =========== drm_validate_clone_mode (2 subtests) ===========
[22:57:47] ============== drm_test_check_in_clone_mode  ===============
[22:57:47] [PASSED] in_clone_mode
[22:57:47] [PASSED] not_in_clone_mode
[22:57:47] ========== [PASSED] drm_test_check_in_clone_mode ===========
[22:57:47] =============== drm_test_check_valid_clones  ===============
[22:57:47] [PASSED] not_in_clone_mode
[22:57:47] [PASSED] valid_clone
[22:57:47] [PASSED] invalid_clone
[22:57:47] =========== [PASSED] drm_test_check_valid_clones ===========
[22:57:47] ============= [PASSED] drm_validate_clone_mode =============
[22:57:47] ============= drm_validate_modeset (1 subtest) =============
[22:57:47] [PASSED] drm_test_check_connector_changed_modeset
[22:57:47] ============== [PASSED] drm_validate_modeset ===============
[22:57:47] ====== drm_test_bridge_get_current_state (2 subtests) ======
[22:57:47] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[22:57:47] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[22:57:47] ======== [PASSED] drm_test_bridge_get_current_state ========
[22:57:47] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[22:57:47] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[22:57:47] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[22:57:47] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[22:57:47] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[22:57:47] ================== drm_buddy (7 subtests) ==================
[22:57:47] [PASSED] drm_test_buddy_alloc_limit
[22:57:47] [PASSED] drm_test_buddy_alloc_optimistic
[22:57:47] [PASSED] drm_test_buddy_alloc_pessimistic
[22:57:47] [PASSED] drm_test_buddy_alloc_pathological
[22:57:47] [PASSED] drm_test_buddy_alloc_contiguous
[22:57:47] [PASSED] drm_test_buddy_alloc_clear
[22:57:47] [PASSED] drm_test_buddy_alloc_range_bias
[22:57:47] ==================== [PASSED] drm_buddy ====================
[22:57:47] ============= drm_cmdline_parser (40 subtests) =============
[22:57:47] [PASSED] drm_test_cmdline_force_d_only
[22:57:47] [PASSED] drm_test_cmdline_force_D_only_dvi
[22:57:47] [PASSED] drm_test_cmdline_force_D_only_hdmi
[22:57:47] [PASSED] drm_test_cmdline_force_D_only_not_digital
[22:57:47] [PASSED] drm_test_cmdline_force_e_only
[22:57:47] [PASSED] drm_test_cmdline_res
[22:57:47] [PASSED] drm_test_cmdline_res_vesa
[22:57:47] [PASSED] drm_test_cmdline_res_vesa_rblank
[22:57:47] [PASSED] drm_test_cmdline_res_rblank
[22:57:47] [PASSED] drm_test_cmdline_res_bpp
[22:57:47] [PASSED] drm_test_cmdline_res_refresh
[22:57:47] [PASSED] drm_test_cmdline_res_bpp_refresh
[22:57:47] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[22:57:47] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[22:57:47] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[22:57:47] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[22:57:47] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[22:57:47] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[22:57:47] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[22:57:47] [PASSED] drm_test_cmdline_res_margins_force_on
[22:57:47] [PASSED] drm_test_cmdline_res_vesa_margins
[22:57:47] [PASSED] drm_test_cmdline_name
[22:57:47] [PASSED] drm_test_cmdline_name_bpp
[22:57:47] [PASSED] drm_test_cmdline_name_option
[22:57:47] [PASSED] drm_test_cmdline_name_bpp_option
[22:57:47] [PASSED] drm_test_cmdline_rotate_0
[22:57:47] [PASSED] drm_test_cmdline_rotate_90
[22:57:47] [PASSED] drm_test_cmdline_rotate_180
[22:57:47] [PASSED] drm_test_cmdline_rotate_270
[22:57:47] [PASSED] drm_test_cmdline_hmirror
[22:57:47] [PASSED] drm_test_cmdline_vmirror
[22:57:47] [PASSED] drm_test_cmdline_margin_options
[22:57:47] [PASSED] drm_test_cmdline_multiple_options
[22:57:47] [PASSED] drm_test_cmdline_bpp_extra_and_option
[22:57:47] [PASSED] drm_test_cmdline_extra_and_option
[22:57:47] [PASSED] drm_test_cmdline_freestanding_options
[22:57:47] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[22:57:47] [PASSED] drm_test_cmdline_panel_orientation
[22:57:47] ================ drm_test_cmdline_invalid  =================
[22:57:47] [PASSED] margin_only
[22:57:47] [PASSED] interlace_only
[22:57:47] [PASSED] res_missing_x
[22:57:47] [PASSED] res_missing_y
[22:57:47] [PASSED] res_bad_y
[22:57:47] [PASSED] res_missing_y_bpp
[22:57:47] [PASSED] res_bad_bpp
[22:57:47] [PASSED] res_bad_refresh
[22:57:47] [PASSED] res_bpp_refresh_force_on_off
[22:57:47] [PASSED] res_invalid_mode
[22:57:47] [PASSED] res_bpp_wrong_place_mode
[22:57:47] [PASSED] name_bpp_refresh
[22:57:47] [PASSED] name_refresh
[22:57:47] [PASSED] name_refresh_wrong_mode
[22:57:47] [PASSED] name_refresh_invalid_mode
[22:57:47] [PASSED] rotate_multiple
[22:57:47] [PASSED] rotate_invalid_val
[22:57:47] [PASSED] rotate_truncated
[22:57:47] [PASSED] invalid_option
[22:57:47] [PASSED] invalid_tv_option
[22:57:47] [PASSED] truncated_tv_option
[22:57:47] ============ [PASSED] drm_test_cmdline_invalid =============
[22:57:47] =============== drm_test_cmdline_tv_options  ===============
[22:57:47] [PASSED] NTSC
[22:57:47] [PASSED] NTSC_443
[22:57:47] [PASSED] NTSC_J
[22:57:47] [PASSED] PAL
[22:57:47] [PASSED] PAL_M
[22:57:47] [PASSED] PAL_N
[22:57:47] [PASSED] SECAM
[22:57:47] [PASSED] MONO_525
[22:57:47] [PASSED] MONO_625
[22:57:47] =========== [PASSED] drm_test_cmdline_tv_options ===========
[22:57:47] =============== [PASSED] drm_cmdline_parser ================
[22:57:47] ========== drmm_connector_hdmi_init (20 subtests) ==========
[22:57:47] [PASSED] drm_test_connector_hdmi_init_valid
[22:57:47] [PASSED] drm_test_connector_hdmi_init_bpc_8
[22:57:47] [PASSED] drm_test_connector_hdmi_init_bpc_10
[22:57:47] [PASSED] drm_test_connector_hdmi_init_bpc_12
[22:57:47] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[22:57:47] [PASSED] drm_test_connector_hdmi_init_bpc_null
[22:57:47] [PASSED] drm_test_connector_hdmi_init_formats_empty
[22:57:47] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[22:57:47] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[22:57:47] [PASSED] supported_formats=0x9 yuv420_allowed=1
[22:57:47] [PASSED] supported_formats=0x9 yuv420_allowed=0
[22:57:47] [PASSED] supported_formats=0x3 yuv420_allowed=1
[22:57:47] [PASSED] supported_formats=0x3 yuv420_allowed=0
[22:57:47] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[22:57:47] [PASSED] drm_test_connector_hdmi_init_null_ddc
[22:57:47] [PASSED] drm_test_connector_hdmi_init_null_product
[22:57:47] [PASSED] drm_test_connector_hdmi_init_null_vendor
[22:57:47] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[22:57:47] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[22:57:47] [PASSED] drm_test_connector_hdmi_init_product_valid
[22:57:47] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[22:57:47] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[22:57:47] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[22:57:47] ========= drm_test_connector_hdmi_init_type_valid  =========
[22:57:47] [PASSED] HDMI-A
[22:57:47] [PASSED] HDMI-B
[22:57:47] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[22:57:47] ======== drm_test_connector_hdmi_init_type_invalid  ========
[22:57:47] [PASSED] Unknown
[22:57:47] [PASSED] VGA
[22:57:47] [PASSED] DVI-I
[22:57:47] [PASSED] DVI-D
[22:57:47] [PASSED] DVI-A
[22:57:47] [PASSED] Composite
[22:57:47] [PASSED] SVIDEO
[22:57:47] [PASSED] LVDS
[22:57:47] [PASSED] Component
[22:57:47] [PASSED] DIN
[22:57:47] [PASSED] DP
[22:57:47] [PASSED] TV
[22:57:47] [PASSED] eDP
[22:57:47] [PASSED] Virtual
[22:57:47] [PASSED] DSI
[22:57:47] [PASSED] DPI
[22:57:47] [PASSED] Writeback
[22:57:47] [PASSED] SPI
[22:57:47] [PASSED] USB
[22:57:47] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[22:57:47] ============ [PASSED] drmm_connector_hdmi_init =============
[22:57:47] ============= drmm_connector_init (3 subtests) =============
[22:57:47] [PASSED] drm_test_drmm_connector_init
[22:57:47] [PASSED] drm_test_drmm_connector_init_null_ddc
[22:57:47] ========= drm_test_drmm_connector_init_type_valid  =========
[22:57:47] [PASSED] Unknown
[22:57:47] [PASSED] VGA
[22:57:47] [PASSED] DVI-I
[22:57:47] [PASSED] DVI-D
[22:57:47] [PASSED] DVI-A
[22:57:47] [PASSED] Composite
[22:57:47] [PASSED] SVIDEO
[22:57:47] [PASSED] LVDS
[22:57:47] [PASSED] Component
[22:57:47] [PASSED] DIN
[22:57:47] [PASSED] DP
[22:57:47] [PASSED] HDMI-A
[22:57:47] [PASSED] HDMI-B
[22:57:47] [PASSED] TV
[22:57:47] [PASSED] eDP
[22:57:47] [PASSED] Virtual
[22:57:47] [PASSED] DSI
[22:57:47] [PASSED] DPI
[22:57:47] [PASSED] Writeback
[22:57:47] [PASSED] SPI
[22:57:47] [PASSED] USB
[22:57:47] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[22:57:47] =============== [PASSED] drmm_connector_init ===============
[22:57:47] ========= drm_connector_dynamic_init (6 subtests) ==========
[22:57:47] [PASSED] drm_test_drm_connector_dynamic_init
[22:57:47] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[22:57:47] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[22:57:47] [PASSED] drm_test_drm_connector_dynamic_init_properties
[22:57:47] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[22:57:47] [PASSED] Unknown
[22:57:47] [PASSED] VGA
[22:57:47] [PASSED] DVI-I
[22:57:47] [PASSED] DVI-D
[22:57:47] [PASSED] DVI-A
[22:57:47] [PASSED] Composite
[22:57:47] [PASSED] SVIDEO
[22:57:47] [PASSED] LVDS
[22:57:47] [PASSED] Component
[22:57:47] [PASSED] DIN
[22:57:47] [PASSED] DP
[22:57:47] [PASSED] HDMI-A
[22:57:47] [PASSED] HDMI-B
[22:57:47] [PASSED] TV
[22:57:47] [PASSED] eDP
[22:57:47] [PASSED] Virtual
[22:57:47] [PASSED] DSI
[22:57:47] [PASSED] DPI
[22:57:47] [PASSED] Writeback
[22:57:47] [PASSED] SPI
[22:57:47] [PASSED] USB
[22:57:47] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[22:57:47] ======== drm_test_drm_connector_dynamic_init_name  =========
[22:57:47] [PASSED] Unknown
[22:57:47] [PASSED] VGA
[22:57:47] [PASSED] DVI-I
[22:57:47] [PASSED] DVI-D
[22:57:47] [PASSED] DVI-A
[22:57:47] [PASSED] Composite
[22:57:47] [PASSED] SVIDEO
[22:57:47] [PASSED] LVDS
[22:57:47] [PASSED] Component
[22:57:47] [PASSED] DIN
[22:57:47] [PASSED] DP
[22:57:47] [PASSED] HDMI-A
[22:57:47] [PASSED] HDMI-B
[22:57:47] [PASSED] TV
[22:57:47] [PASSED] eDP
[22:57:47] [PASSED] Virtual
[22:57:47] [PASSED] DSI
[22:57:47] [PASSED] DPI
[22:57:47] [PASSED] Writeback
[22:57:47] [PASSED] SPI
[22:57:47] [PASSED] USB
[22:57:47] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[22:57:47] =========== [PASSED] drm_connector_dynamic_init ============
[22:57:47] ==== drm_connector_dynamic_register_early (4 subtests) =====
[22:57:47] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[22:57:47] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[22:57:47] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[22:57:47] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[22:57:47] ====== [PASSED] drm_connector_dynamic_register_early =======
[22:57:47] ======= drm_connector_dynamic_register (7 subtests) ========
[22:57:47] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[22:57:47] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[22:57:47] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[22:57:47] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[22:57:47] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[22:57:47] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[22:57:47] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[22:57:47] ========= [PASSED] drm_connector_dynamic_register ==========
[22:57:47] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[22:57:47] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[22:57:47] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[22:57:47] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[22:57:47] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[22:57:47] ========== drm_test_get_tv_mode_from_name_valid  ===========
[22:57:47] [PASSED] NTSC
[22:57:47] [PASSED] NTSC-443
[22:57:47] [PASSED] NTSC-J
[22:57:47] [PASSED] PAL
[22:57:47] [PASSED] PAL-M
[22:57:47] [PASSED] PAL-N
[22:57:47] [PASSED] SECAM
[22:57:47] [PASSED] Mono
[22:57:47] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[22:57:47] [PASSED] drm_test_get_tv_mode_from_name_truncated
[22:57:47] ============ [PASSED] drm_get_tv_mode_from_name ============
[22:57:47] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[22:57:47] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[22:57:47] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[22:57:47] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[22:57:47] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[22:57:47] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[22:57:47] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[22:57:47] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[22:57:47] [PASSED] VIC 96
[22:57:47] [PASSED] VIC 97
[22:57:47] [PASSED] VIC 101
[22:57:47] [PASSED] VIC 102
[22:57:47] [PASSED] VIC 106
[22:57:47] [PASSED] VIC 107
[22:57:47] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[22:57:47] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[22:57:47] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[22:57:47] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[22:57:47] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[22:57:47] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[22:57:47] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[22:57:47] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[22:57:47] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[22:57:47] [PASSED] Automatic
[22:57:47] [PASSED] Full
[22:57:47] [PASSED] Limited 16:235
[22:57:47] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[22:57:47] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[22:57:47] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[22:57:47] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[22:57:47] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[22:57:47] [PASSED] RGB
[22:57:47] [PASSED] YUV 4:2:0
[22:57:47] [PASSED] YUV 4:2:2
[22:57:47] [PASSED] YUV 4:4:4
[22:57:47] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[22:57:47] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[22:57:47] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[22:57:47] ============= drm_damage_helper (21 subtests) ==============
[22:57:47] [PASSED] drm_test_damage_iter_no_damage
[22:57:47] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[22:57:47] [PASSED] drm_test_damage_iter_no_damage_src_moved
[22:57:47] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[22:57:47] [PASSED] drm_test_damage_iter_no_damage_not_visible
[22:57:47] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[22:57:47] [PASSED] drm_test_damage_iter_no_damage_no_fb
[22:57:47] [PASSED] drm_test_damage_iter_simple_damage
[22:57:47] [PASSED] drm_test_damage_iter_single_damage
[22:57:47] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[22:57:47] [PASSED] drm_test_damage_iter_single_damage_outside_src
[22:57:47] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[22:57:47] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[22:57:47] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[22:57:47] [PASSED] drm_test_damage_iter_single_damage_src_moved
[22:57:47] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[22:57:47] [PASSED] drm_test_damage_iter_damage
[22:57:47] [PASSED] drm_test_damage_iter_damage_one_intersect
[22:57:47] [PASSED] drm_test_damage_iter_damage_one_outside
[22:57:47] [PASSED] drm_test_damage_iter_damage_src_moved
[22:57:47] [PASSED] drm_test_damage_iter_damage_not_visible
[22:57:47] ================ [PASSED] drm_damage_helper ================
[22:57:47] ============== drm_dp_mst_helper (3 subtests) ==============
[22:57:47] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[22:57:47] [PASSED] Clock 154000 BPP 30 DSC disabled
[22:57:47] [PASSED] Clock 234000 BPP 30 DSC disabled
[22:57:47] [PASSED] Clock 297000 BPP 24 DSC disabled
[22:57:47] [PASSED] Clock 332880 BPP 24 DSC enabled
[22:57:47] [PASSED] Clock 324540 BPP 24 DSC enabled
[22:57:47] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[22:57:47] ============== drm_test_dp_mst_calc_pbn_div  ===============
[22:57:47] [PASSED] Link rate 2000000 lane count 4
[22:57:47] [PASSED] Link rate 2000000 lane count 2
[22:57:47] [PASSED] Link rate 2000000 lane count 1
[22:57:47] [PASSED] Link rate 1350000 lane count 4
[22:57:47] [PASSED] Link rate 1350000 lane count 2
[22:57:47] [PASSED] Link rate 1350000 lane count 1
[22:57:47] [PASSED] Link rate 1000000 lane count 4
[22:57:47] [PASSED] Link rate 1000000 lane count 2
[22:57:47] [PASSED] Link rate 1000000 lane count 1
[22:57:47] [PASSED] Link rate 810000 lane count 4
[22:57:47] [PASSED] Link rate 810000 lane count 2
[22:57:47] [PASSED] Link rate 810000 lane count 1
[22:57:47] [PASSED] Link rate 540000 lane count 4
[22:57:47] [PASSED] Link rate 540000 lane count 2
[22:57:47] [PASSED] Link rate 540000 lane count 1
[22:57:47] [PASSED] Link rate 270000 lane count 4
[22:57:47] [PASSED] Link rate 270000 lane count 2
[22:57:47] [PASSED] Link rate 270000 lane count 1
[22:57:47] [PASSED] Link rate 162000 lane count 4
[22:57:47] [PASSED] Link rate 162000 lane count 2
[22:57:47] [PASSED] Link rate 162000 lane count 1
[22:57:47] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[22:57:47] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[22:57:47] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[22:57:47] [PASSED] DP_POWER_UP_PHY with port number
[22:57:47] [PASSED] DP_POWER_DOWN_PHY with port number
[22:57:47] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[22:57:47] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[22:57:47] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[22:57:47] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[22:57:47] [PASSED] DP_QUERY_PAYLOAD with port number
[22:57:47] [PASSED] DP_QUERY_PAYLOAD with VCPI
[22:57:47] [PASSED] DP_REMOTE_DPCD_READ with port number
[22:57:47] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[22:57:47] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[22:57:47] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[22:57:47] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[22:57:47] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[22:57:47] [PASSED] DP_REMOTE_I2C_READ with port number
[22:57:47] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[22:57:47] [PASSED] DP_REMOTE_I2C_READ with transactions array
[22:57:47] [PASSED] DP_REMOTE_I2C_WRITE with port number
[22:57:47] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[22:57:47] [PASSED] DP_REMOTE_I2C_WRITE with data array
[22:57:47] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[22:57:47] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[22:57:47] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[22:57:47] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[22:57:47] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[22:57:47] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[22:57:47] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[22:57:47] ================ [PASSED] drm_dp_mst_helper ================
[22:57:47] ================== drm_exec (7 subtests) ===================
[22:57:47] [PASSED] sanitycheck
[22:57:47] [PASSED] test_lock
[22:57:47] [PASSED] test_lock_unlock
[22:57:47] [PASSED] test_duplicates
[22:57:47] [PASSED] test_prepare
[22:57:47] [PASSED] test_prepare_array
[22:57:47] [PASSED] test_multiple_loops
[22:57:47] ==================== [PASSED] drm_exec =====================
[22:57:47] =========== drm_format_helper_test (18 subtests) ===========
[22:57:47] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[22:57:47] [PASSED] single_pixel_source_buffer
[22:57:47] [PASSED] single_pixel_clip_rectangle
[22:57:47] [PASSED] well_known_colors
[22:57:47] [PASSED] destination_pitch
[22:57:47] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[22:57:47] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[22:57:47] [PASSED] single_pixel_source_buffer
[22:57:47] [PASSED] single_pixel_clip_rectangle
[22:57:47] [PASSED] well_known_colors
[22:57:47] [PASSED] destination_pitch
[22:57:47] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[22:57:47] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[22:57:47] [PASSED] single_pixel_source_buffer
[22:57:47] [PASSED] single_pixel_clip_rectangle
[22:57:47] [PASSED] well_known_colors
[22:57:47] [PASSED] destination_pitch
[22:57:47] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[22:57:47] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[22:57:47] [PASSED] single_pixel_source_buffer
[22:57:47] [PASSED] single_pixel_clip_rectangle
[22:57:47] [PASSED] well_known_colors
[22:57:47] [PASSED] destination_pitch
[22:57:47] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[22:57:47] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[22:57:47] [PASSED] single_pixel_source_buffer
[22:57:47] [PASSED] single_pixel_clip_rectangle
[22:57:47] [PASSED] well_known_colors
[22:57:47] [PASSED] destination_pitch
[22:57:47] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[22:57:47] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[22:57:47] [PASSED] single_pixel_source_buffer
[22:57:47] [PASSED] single_pixel_clip_rectangle
[22:57:47] [PASSED] well_known_colors
[22:57:47] [PASSED] destination_pitch
[22:57:47] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[22:57:47] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[22:57:47] [PASSED] single_pixel_source_buffer
[22:57:47] [PASSED] single_pixel_clip_rectangle
[22:57:47] [PASSED] well_known_colors
[22:57:47] [PASSED] destination_pitch
[22:57:47] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[22:57:47] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[22:57:47] [PASSED] single_pixel_source_buffer
[22:57:47] [PASSED] single_pixel_clip_rectangle
[22:57:47] [PASSED] well_known_colors
[22:57:47] [PASSED] destination_pitch
[22:57:47] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[22:57:47] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[22:57:47] [PASSED] single_pixel_source_buffer
[22:57:47] [PASSED] single_pixel_clip_rectangle
[22:57:47] [PASSED] well_known_colors
[22:57:47] [PASSED] destination_pitch
[22:57:47] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[22:57:47] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[22:57:47] [PASSED] single_pixel_source_buffer
[22:57:47] [PASSED] single_pixel_clip_rectangle
[22:57:47] [PASSED] well_known_colors
[22:57:47] [PASSED] destination_pitch
[22:57:47] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[22:57:47] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[22:57:47] [PASSED] single_pixel_source_buffer
[22:57:47] [PASSED] single_pixel_clip_rectangle
[22:57:47] [PASSED] well_known_colors
[22:57:47] [PASSED] destination_pitch
[22:57:47] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[22:57:47] ============== drm_test_fb_xrgb8888_to_mono  ===============
[22:57:47] [PASSED] single_pixel_source_buffer
[22:57:47] [PASSED] single_pixel_clip_rectangle
[22:57:47] [PASSED] well_known_colors
[22:57:47] [PASSED] destination_pitch
[22:57:47] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[22:57:47] ==================== drm_test_fb_swab  =====================
[22:57:47] [PASSED] single_pixel_source_buffer
[22:57:47] [PASSED] single_pixel_clip_rectangle
[22:57:47] [PASSED] well_known_colors
[22:57:47] [PASSED] destination_pitch
[22:57:47] ================ [PASSED] drm_test_fb_swab =================
[22:57:47] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[22:57:47] [PASSED] single_pixel_source_buffer
[22:57:47] [PASSED] single_pixel_clip_rectangle
[22:57:47] [PASSED] well_known_colors
[22:57:47] [PASSED] destination_pitch
[22:57:47] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[22:57:47] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[22:57:47] [PASSED] single_pixel_source_buffer
[22:57:47] [PASSED] single_pixel_clip_rectangle
[22:57:47] [PASSED] well_known_colors
[22:57:47] [PASSED] destination_pitch
[22:57:47] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[22:57:47] ================= drm_test_fb_clip_offset  =================
[22:57:47] [PASSED] pass through
[22:57:47] [PASSED] horizontal offset
[22:57:47] [PASSED] vertical offset
[22:57:47] [PASSED] horizontal and vertical offset
[22:57:47] [PASSED] horizontal offset (custom pitch)
[22:57:47] [PASSED] vertical offset (custom pitch)
[22:57:47] [PASSED] horizontal and vertical offset (custom pitch)
[22:57:47] ============= [PASSED] drm_test_fb_clip_offset =============
[22:57:47] ============== drm_test_fb_build_fourcc_list  ==============
[22:57:47] [PASSED] no native formats
[22:57:47] [PASSED] XRGB8888 as native format
[22:57:47] [PASSED] remove duplicates
[22:57:47] [PASSED] convert alpha formats
[22:57:47] [PASSED] random formats
[22:57:47] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[22:57:47] =================== drm_test_fb_memcpy  ====================
[22:57:47] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[22:57:47] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[22:57:47] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[22:57:47] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[22:57:47] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[22:57:47] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[22:57:47] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[22:57:47] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[22:57:47] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[22:57:47] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[22:57:47] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[22:57:47] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[22:57:47] =============== [PASSED] drm_test_fb_memcpy ================
[22:57:47] ============= [PASSED] drm_format_helper_test ==============
[22:57:47] ================= drm_format (18 subtests) =================
[22:57:47] [PASSED] drm_test_format_block_width_invalid
[22:57:47] [PASSED] drm_test_format_block_width_one_plane
[22:57:47] [PASSED] drm_test_format_block_width_two_plane
[22:57:47] [PASSED] drm_test_format_block_width_three_plane
[22:57:47] [PASSED] drm_test_format_block_width_tiled
[22:57:47] [PASSED] drm_test_format_block_height_invalid
[22:57:47] [PASSED] drm_test_format_block_height_one_plane
[22:57:47] [PASSED] drm_test_format_block_height_two_plane
[22:57:47] [PASSED] drm_test_format_block_height_three_plane
[22:57:47] [PASSED] drm_test_format_block_height_tiled
[22:57:47] [PASSED] drm_test_format_min_pitch_invalid
[22:57:47] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[22:57:47] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[22:57:47] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[22:57:47] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[22:57:47] [PASSED] drm_test_format_min_pitch_two_plane
[22:57:47] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[22:57:47] [PASSED] drm_test_format_min_pitch_tiled
[22:57:47] =================== [PASSED] drm_format ====================
[22:57:47] ============== drm_framebuffer (10 subtests) ===============
[22:57:47] ========== drm_test_framebuffer_check_src_coords  ==========
[22:57:47] [PASSED] Success: source fits into fb
[22:57:47] [PASSED] Fail: overflowing fb with x-axis coordinate
[22:57:47] [PASSED] Fail: overflowing fb with y-axis coordinate
[22:57:47] [PASSED] Fail: overflowing fb with source width
[22:57:47] [PASSED] Fail: overflowing fb with source height
[22:57:47] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[22:57:47] [PASSED] drm_test_framebuffer_cleanup
[22:57:47] =============== drm_test_framebuffer_create  ===============
[22:57:47] [PASSED] ABGR8888 normal sizes
[22:57:47] [PASSED] ABGR8888 max sizes
[22:57:47] [PASSED] ABGR8888 pitch greater than min required
[22:57:47] [PASSED] ABGR8888 pitch less than min required
[22:57:47] [PASSED] ABGR8888 Invalid width
[22:57:47] [PASSED] ABGR8888 Invalid buffer handle
[22:57:47] [PASSED] No pixel format
[22:57:47] [PASSED] ABGR8888 Width 0
[22:57:47] [PASSED] ABGR8888 Height 0
[22:57:47] [PASSED] ABGR8888 Out of bound height * pitch combination
[22:57:47] [PASSED] ABGR8888 Large buffer offset
[22:57:47] [PASSED] ABGR8888 Buffer offset for inexistent plane
[22:57:47] [PASSED] ABGR8888 Invalid flag
[22:57:47] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[22:57:47] [PASSED] ABGR8888 Valid buffer modifier
[22:57:47] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[22:57:47] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[22:57:47] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[22:57:47] [PASSED] NV12 Normal sizes
[22:57:47] [PASSED] NV12 Max sizes
[22:57:47] [PASSED] NV12 Invalid pitch
[22:57:47] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[22:57:47] [PASSED] NV12 different  modifier per-plane
[22:57:47] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[22:57:47] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[22:57:47] [PASSED] NV12 Modifier for inexistent plane
[22:57:47] [PASSED] NV12 Handle for inexistent plane
[22:57:47] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[22:57:47] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[22:57:47] [PASSED] YVU420 Normal sizes
[22:57:47] [PASSED] YVU420 Max sizes
[22:57:47] [PASSED] YVU420 Invalid pitch
[22:57:47] [PASSED] YVU420 Different pitches
[22:57:47] [PASSED] YVU420 Different buffer offsets/pitches
[22:57:47] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[22:57:47] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[22:57:47] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[22:57:47] [PASSED] YVU420 Valid modifier
[22:57:47] [PASSED] YVU420 Different modifiers per plane
[22:57:47] [PASSED] YVU420 Modifier for inexistent plane
[22:57:47] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[22:57:47] [PASSED] X0L2 Normal sizes
[22:57:47] [PASSED] X0L2 Max sizes
[22:57:47] [PASSED] X0L2 Invalid pitch
[22:57:47] [PASSED] X0L2 Pitch greater than minimum required
[22:57:47] [PASSED] X0L2 Handle for inexistent plane
[22:57:47] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[22:57:47] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[22:57:47] [PASSED] X0L2 Valid modifier
[22:57:47] [PASSED] X0L2 Modifier for inexistent plane
[22:57:47] =========== [PASSED] drm_test_framebuffer_create ===========
[22:57:47] [PASSED] drm_test_framebuffer_free
[22:57:47] [PASSED] drm_test_framebuffer_init
[22:57:47] [PASSED] drm_test_framebuffer_init_bad_format
[22:57:47] [PASSED] drm_test_framebuffer_init_dev_mismatch
[22:57:47] [PASSED] drm_test_framebuffer_lookup
[22:57:47] [PASSED] drm_test_framebuffer_lookup_inexistent
[22:57:47] [PASSED] drm_test_framebuffer_modifiers_not_supported
[22:57:47] ================= [PASSED] drm_framebuffer =================
[22:57:47] ================ drm_gem_shmem (8 subtests) ================
[22:57:47] [PASSED] drm_gem_shmem_test_obj_create
[22:57:47] [PASSED] drm_gem_shmem_test_obj_create_private
[22:57:47] [PASSED] drm_gem_shmem_test_pin_pages
[22:57:47] [PASSED] drm_gem_shmem_test_vmap
[22:57:47] [PASSED] drm_gem_shmem_test_get_pages_sgt
[22:57:47] [PASSED] drm_gem_shmem_test_get_sg_table
[22:57:47] [PASSED] drm_gem_shmem_test_madvise
[22:57:47] [PASSED] drm_gem_shmem_test_purge
[22:57:47] ================== [PASSED] drm_gem_shmem ==================
[22:57:47] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[22:57:47] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[22:57:47] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[22:57:47] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[22:57:47] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[22:57:47] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[22:57:47] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[22:57:47] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[22:57:47] [PASSED] Automatic
[22:57:47] [PASSED] Full
[22:57:47] [PASSED] Limited 16:235
[22:57:47] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[22:57:47] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[22:57:47] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[22:57:47] [PASSED] drm_test_check_disable_connector
[22:57:47] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[22:57:47] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[22:57:47] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[22:57:47] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[22:57:47] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[22:57:47] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[22:57:47] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[22:57:47] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[22:57:47] [PASSED] drm_test_check_output_bpc_dvi
[22:57:47] [PASSED] drm_test_check_output_bpc_format_vic_1
[22:57:47] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[22:57:47] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[22:57:47] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[22:57:47] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[22:57:47] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[22:57:47] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[22:57:47] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[22:57:47] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[22:57:47] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[22:57:47] [PASSED] drm_test_check_broadcast_rgb_value
[22:57:47] [PASSED] drm_test_check_bpc_8_value
[22:57:47] [PASSED] drm_test_check_bpc_10_value
[22:57:47] [PASSED] drm_test_check_bpc_12_value
[22:57:47] [PASSED] drm_test_check_format_value
[22:57:47] [PASSED] drm_test_check_tmds_char_value
[22:57:47] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[22:57:47] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[22:57:47] [PASSED] drm_test_check_mode_valid
[22:57:47] [PASSED] drm_test_check_mode_valid_reject
[22:57:47] [PASSED] drm_test_check_mode_valid_reject_rate
[22:57:47] [PASSED] drm_test_check_mode_valid_reject_max_clock
[22:57:47] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[22:57:47] ================= drm_managed (2 subtests) =================
[22:57:47] [PASSED] drm_test_managed_release_action
[22:57:47] [PASSED] drm_test_managed_run_action
[22:57:47] =================== [PASSED] drm_managed ===================
[22:57:47] =================== drm_mm (6 subtests) ====================
[22:57:47] [PASSED] drm_test_mm_init
[22:57:47] [PASSED] drm_test_mm_debug
[22:57:47] [PASSED] drm_test_mm_align32
[22:57:47] [PASSED] drm_test_mm_align64
[22:57:47] [PASSED] drm_test_mm_lowest
[22:57:47] [PASSED] drm_test_mm_highest
[22:57:47] ===================== [PASSED] drm_mm ======================
[22:57:47] ============= drm_modes_analog_tv (5 subtests) =============
[22:57:47] [PASSED] drm_test_modes_analog_tv_mono_576i
[22:57:47] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[22:57:47] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[22:57:47] [PASSED] drm_test_modes_analog_tv_pal_576i
[22:57:47] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[22:57:47] =============== [PASSED] drm_modes_analog_tv ===============
[22:57:47] ============== drm_plane_helper (2 subtests) ===============
[22:57:47] =============== drm_test_check_plane_state  ================
[22:57:47] [PASSED] clipping_simple
[22:57:47] [PASSED] clipping_rotate_reflect
[22:57:47] [PASSED] positioning_simple
[22:57:47] [PASSED] upscaling
[22:57:47] [PASSED] downscaling
[22:57:47] [PASSED] rounding1
[22:57:47] [PASSED] rounding2
[22:57:47] [PASSED] rounding3
[22:57:47] [PASSED] rounding4
[22:57:47] =========== [PASSED] drm_test_check_plane_state ============
[22:57:47] =========== drm_test_check_invalid_plane_state  ============
[22:57:47] [PASSED] positioning_invalid
[22:57:47] [PASSED] upscaling_invalid
[22:57:47] [PASSED] downscaling_invalid
[22:57:47] ======= [PASSED] drm_test_check_invalid_plane_state ========
[22:57:47] ================ [PASSED] drm_plane_helper =================
[22:57:47] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[22:57:47] ====== drm_test_connector_helper_tv_get_modes_check  =======
[22:57:47] [PASSED] None
[22:57:47] [PASSED] PAL
[22:57:47] [PASSED] NTSC
[22:57:47] [PASSED] Both, NTSC Default
[22:57:47] [PASSED] Both, PAL Default
[22:57:47] [PASSED] Both, NTSC Default, with PAL on command-line
[22:57:47] [PASSED] Both, PAL Default, with NTSC on command-line
[22:57:47] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[22:57:47] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[22:57:47] ================== drm_rect (9 subtests) ===================
[22:57:47] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[22:57:47] [PASSED] drm_test_rect_clip_scaled_not_clipped
[22:57:47] [PASSED] drm_test_rect_clip_scaled_clipped
[22:57:47] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[22:57:47] ================= drm_test_rect_intersect  =================
[22:57:47] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[22:57:47] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[22:57:47] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[22:57:47] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[22:57:47] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[22:57:47] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[22:57:47] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[22:57:47] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[22:57:47] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[22:57:47] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[22:57:47] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[22:57:47] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[22:57:47] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[22:57:47] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[22:57:47] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[22:57:47] ============= [PASSED] drm_test_rect_intersect =============
[22:57:47] ================ drm_test_rect_calc_hscale  ================
[22:57:47] [PASSED] normal use
[22:57:47] [PASSED] out of max range
[22:57:47] [PASSED] out of min range
[22:57:47] [PASSED] zero dst
[22:57:47] [PASSED] negative src
[22:57:47] [PASSED] negative dst
[22:57:47] ============ [PASSED] drm_test_rect_calc_hscale ============
[22:57:47] ================ drm_test_rect_calc_vscale  ================
[22:57:47] [PASSED] normal use
[22:57:47] [PASSED] out of max range
[22:57:47] [PASSED] out of min range
[22:57:47] [PASSED] zero dst
[22:57:47] [PASSED] negative src
[22:57:47] [PASSED] negative dst
[22:57:47] ============ [PASSED] drm_test_rect_calc_vscale ============
[22:57:47] ================== drm_test_rect_rotate  ===================
[22:57:47] [PASSED] reflect-x
[22:57:47] [PASSED] reflect-y
[22:57:47] [PASSED] rotate-0
[22:57:47] [PASSED] rotate-90
[22:57:47] [PASSED] rotate-180
stty: 'standard input': Inappropriate ioctl for device
[22:57:47] [PASSED] rotate-270
[22:57:47] ============== [PASSED] drm_test_rect_rotate ===============
[22:57:47] ================ drm_test_rect_rotate_inv  =================
[22:57:47] [PASSED] reflect-x
[22:57:47] [PASSED] reflect-y
[22:57:47] [PASSED] rotate-0
[22:57:47] [PASSED] rotate-90
[22:57:47] [PASSED] rotate-180
[22:57:47] [PASSED] rotate-270
[22:57:47] ============ [PASSED] drm_test_rect_rotate_inv =============
[22:57:47] ==================== [PASSED] drm_rect =====================
[22:57:47] ============================================================
[22:57:47] Testing complete. Ran 614 tests: passed: 614
[22:57:47] Elapsed time: 23.519s total, 1.658s configuring, 21.693s building, 0.147s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[22:57:47] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:57:49] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
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

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


