Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7BDC5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 17:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F2110E87A;
	Thu,  5 Jun 2025 17:58:34 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B2D10E33F;
 Thu,  5 Jun 2025 17:58:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Remove_IOSF=5FMBI_se?=
 =?utf-8?q?lect=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 17:58:33 -0000
Message-ID: <174914631355.52551.342700961218077354@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605074644.71036-1-dev@lankhorst.se>
In-Reply-To: <20250605074644.71036-1-dev@lankhorst.se>
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

Series: drm/xe: Remove IOSF_MBI select. (rev2)
URL   : https://patchwork.freedesktop.org/series/149868/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[17:57:25] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:57:29] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:57:56] Starting KUnit Kernel (1/1)...
[17:57:56] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:57:57] ================== guc_buf (11 subtests) ===================
[17:57:57] [PASSED] test_smallest
[17:57:57] [PASSED] test_largest
[17:57:57] [PASSED] test_granular
[17:57:57] [PASSED] test_unique
[17:57:57] [PASSED] test_overlap
[17:57:57] [PASSED] test_reusable
[17:57:57] [PASSED] test_too_big
[17:57:57] [PASSED] test_flush
[17:57:57] [PASSED] test_lookup
[17:57:57] [PASSED] test_data
[17:57:57] [PASSED] test_class
[17:57:57] ===================== [PASSED] guc_buf =====================
[17:57:57] =================== guc_dbm (7 subtests) ===================
[17:57:57] [PASSED] test_empty
[17:57:57] [PASSED] test_default
[17:57:57] ======================== test_size  ========================
[17:57:57] [PASSED] 4
[17:57:57] [PASSED] 8
[17:57:57] [PASSED] 32
[17:57:57] [PASSED] 256
[17:57:57] ==================== [PASSED] test_size ====================
[17:57:57] ======================= test_reuse  ========================
[17:57:57] [PASSED] 4
[17:57:57] [PASSED] 8
[17:57:57] [PASSED] 32
[17:57:57] [PASSED] 256
[17:57:57] =================== [PASSED] test_reuse ====================
[17:57:57] =================== test_range_overlap  ====================
[17:57:57] [PASSED] 4
[17:57:57] [PASSED] 8
[17:57:57] [PASSED] 32
[17:57:57] [PASSED] 256
[17:57:57] =============== [PASSED] test_range_overlap ================
[17:57:57] =================== test_range_compact  ====================
[17:57:57] [PASSED] 4
[17:57:57] [PASSED] 8
[17:57:57] [PASSED] 32
[17:57:57] [PASSED] 256
[17:57:57] =============== [PASSED] test_range_compact ================
[17:57:57] ==================== test_range_spare  =====================
[17:57:57] [PASSED] 4
[17:57:57] [PASSED] 8
[17:57:57] [PASSED] 32
[17:57:57] [PASSED] 256
[17:57:57] ================ [PASSED] test_range_spare =================
[17:57:57] ===================== [PASSED] guc_dbm =====================
[17:57:57] =================== guc_idm (6 subtests) ===================
[17:57:57] [PASSED] bad_init
[17:57:57] [PASSED] no_init
[17:57:57] [PASSED] init_fini
[17:57:57] [PASSED] check_used
[17:57:57] [PASSED] check_quota
[17:57:57] [PASSED] check_all
[17:57:57] ===================== [PASSED] guc_idm =====================
[17:57:57] ================== no_relay (3 subtests) ===================
[17:57:57] [PASSED] xe_drops_guc2pf_if_not_ready
[17:57:57] [PASSED] xe_drops_guc2vf_if_not_ready
[17:57:57] [PASSED] xe_rejects_send_if_not_ready
[17:57:57] ==================== [PASSED] no_relay =====================
[17:57:57] ================== pf_relay (14 subtests) ==================
[17:57:57] [PASSED] pf_rejects_guc2pf_too_short
[17:57:57] [PASSED] pf_rejects_guc2pf_too_long
[17:57:57] [PASSED] pf_rejects_guc2pf_no_payload
[17:57:57] [PASSED] pf_fails_no_payload
[17:57:57] [PASSED] pf_fails_bad_origin
[17:57:57] [PASSED] pf_fails_bad_type
[17:57:57] [PASSED] pf_txn_reports_error
[17:57:57] [PASSED] pf_txn_sends_pf2guc
[17:57:57] [PASSED] pf_sends_pf2guc
[17:57:57] [SKIPPED] pf_loopback_nop
[17:57:57] [SKIPPED] pf_loopback_echo
[17:57:57] [SKIPPED] pf_loopback_fail
[17:57:57] [SKIPPED] pf_loopback_busy
[17:57:57] [SKIPPED] pf_loopback_retry
[17:57:57] ==================== [PASSED] pf_relay =====================
[17:57:57] ================== vf_relay (3 subtests) ===================
[17:57:57] [PASSED] vf_rejects_guc2vf_too_short
[17:57:57] [PASSED] vf_rejects_guc2vf_too_long
[17:57:57] [PASSED] vf_rejects_guc2vf_no_payload
[17:57:57] ==================== [PASSED] vf_relay =====================
[17:57:57] ================= pf_service (11 subtests) =================
[17:57:57] [PASSED] pf_negotiate_any
[17:57:57] [PASSED] pf_negotiate_base_match
[17:57:57] [PASSED] pf_negotiate_base_newer
[17:57:57] [PASSED] pf_negotiate_base_next
[17:57:57] [SKIPPED] pf_negotiate_base_older
[17:57:57] [PASSED] pf_negotiate_base_prev
[17:57:57] [PASSED] pf_negotiate_latest_match
[17:57:57] [PASSED] pf_negotiate_latest_newer
[17:57:57] [PASSED] pf_negotiate_latest_next
[17:57:57] [SKIPPED] pf_negotiate_latest_older
[17:57:57] [SKIPPED] pf_negotiate_latest_prev
[17:57:57] =================== [PASSED] pf_service ====================
[17:57:57] ===================== lmtt (1 subtest) =====================
[17:57:57] ======================== test_ops  =========================
[17:57:57] [PASSED] 2-level
[17:57:57] [PASSED] multi-level
[17:57:57] ==================== [PASSED] test_ops =====================
[17:57:57] ====================== [PASSED] lmtt =======================
[17:57:57] =================== xe_mocs (2 subtests) ===================
[17:57:57] ================ xe_live_mocs_kernel_kunit  ================
[17:57:57] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[17:57:57] ================ xe_live_mocs_reset_kunit  =================
[17:57:57] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[17:57:57] ==================== [SKIPPED] xe_mocs =====================
[17:57:57] ================= xe_migrate (2 subtests) ==================
[17:57:57] ================= xe_migrate_sanity_kunit  =================
[17:57:57] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[17:57:57] ================== xe_validate_ccs_kunit  ==================
[17:57:57] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[17:57:57] =================== [SKIPPED] xe_migrate ===================
[17:57:57] ================== xe_dma_buf (1 subtest) ==================
[17:57:57] ==================== xe_dma_buf_kunit  =====================
[17:57:57] ================ [SKIPPED] xe_dma_buf_kunit ================
[17:57:57] =================== [SKIPPED] xe_dma_buf ===================
[17:57:57] ================= xe_bo_shrink (1 subtest) =================
[17:57:57] =================== xe_bo_shrink_kunit  ====================
[17:57:57] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[17:57:57] ================== [SKIPPED] xe_bo_shrink ==================
[17:57:57] ==================== xe_bo (2 subtests) ====================
[17:57:57] ================== xe_ccs_migrate_kunit  ===================
[17:57:57] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[17:57:57] ==================== xe_bo_evict_kunit  ====================
[17:57:57] =============== [SKIPPED] xe_bo_evict_kunit ================
[17:57:57] ===================== [SKIPPED] xe_bo ======================
[17:57:57] ==================== args (11 subtests) ====================
[17:57:57] [PASSED] count_args_test
[17:57:57] [PASSED] call_args_example
[17:57:57] [PASSED] call_args_test
[17:57:57] [PASSED] drop_first_arg_example
[17:57:57] [PASSED] drop_first_arg_test
[17:57:57] [PASSED] first_arg_example
[17:57:57] [PASSED] first_arg_test
[17:57:57] [PASSED] last_arg_example
[17:57:57] [PASSED] last_arg_test
[17:57:57] [PASSED] pick_arg_example
[17:57:57] [PASSED] sep_comma_example
[17:57:57] ====================== [PASSED] args =======================
[17:57:57] =================== xe_pci (2 subtests) ====================
[17:57:57] [PASSED] xe_gmdid_graphics_ip
[17:57:57] [PASSED] xe_gmdid_media_ip
[17:57:57] ===================== [PASSED] xe_pci ======================
[17:57:57] =================== xe_rtp (2 subtests) ====================
[17:57:57] =============== xe_rtp_process_to_sr_tests  ================
[17:57:57] [PASSED] coalesce-same-reg
[17:57:57] [PASSED] no-match-no-add
[17:57:57] [PASSED] match-or
[17:57:57] [PASSED] match-or-xfail
[17:57:57] [PASSED] no-match-no-add-multiple-rules
[17:57:57] [PASSED] two-regs-two-entries
[17:57:57] [PASSED] clr-one-set-other
[17:57:57] [PASSED] set-field
[17:57:57] [PASSED] conflict-duplicate
[17:57:57] [PASSED] conflict-not-disjoint
stty: 'standard input': Inappropriate ioctl for device
[17:57:57] [PASSED] conflict-reg-type
[17:57:57] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[17:57:57] ================== xe_rtp_process_tests  ===================
[17:57:57] [PASSED] active1
[17:57:57] [PASSED] active2
[17:57:57] [PASSED] active-inactive
[17:57:57] [PASSED] inactive-active
[17:57:57] [PASSED] inactive-1st_or_active-inactive
[17:57:57] [PASSED] inactive-2nd_or_active-inactive
[17:57:57] [PASSED] inactive-last_or_active-inactive
[17:57:57] [PASSED] inactive-no_or_active-inactive
[17:57:57] ============== [PASSED] xe_rtp_process_tests ===============
[17:57:57] ===================== [PASSED] xe_rtp ======================
[17:57:57] ==================== xe_wa (1 subtest) =====================
[17:57:57] ======================== xe_wa_gt  =========================
[17:57:57] [PASSED] TIGERLAKE (B0)
[17:57:57] [PASSED] DG1 (A0)
[17:57:57] [PASSED] DG1 (B0)
[17:57:57] [PASSED] ALDERLAKE_S (A0)
[17:57:57] [PASSED] ALDERLAKE_S (B0)
[17:57:57] [PASSED] ALDERLAKE_S (C0)
[17:57:57] [PASSED] ALDERLAKE_S (D0)
[17:57:57] [PASSED] ALDERLAKE_P (A0)
[17:57:57] [PASSED] ALDERLAKE_P (B0)
[17:57:57] [PASSED] ALDERLAKE_P (C0)
[17:57:57] [PASSED] ALDERLAKE_S_RPLS (D0)
[17:57:57] [PASSED] ALDERLAKE_P_RPLU (E0)
[17:57:57] [PASSED] DG2_G10 (C0)
[17:57:57] [PASSED] DG2_G11 (B1)
[17:57:57] [PASSED] DG2_G12 (A1)
[17:57:57] [PASSED] METEORLAKE (g:A0, m:A0)
[17:57:57] [PASSED] METEORLAKE (g:A0, m:A0)
[17:57:57] [PASSED] METEORLAKE (g:A0, m:A0)
[17:57:57] [PASSED] LUNARLAKE (g:A0, m:A0)
[17:57:57] [PASSED] LUNARLAKE (g:B0, m:A0)
[17:57:57] [PASSED] BATTLEMAGE (g:A0, m:A1)
[17:57:57] ==================== [PASSED] xe_wa_gt =====================
[17:57:57] ====================== [PASSED] xe_wa ======================
[17:57:57] ============================================================
[17:57:57] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[17:57:57] Elapsed time: 31.445s total, 4.194s configuring, 26.985s building, 0.246s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[17:57:57] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:57:59] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:58:20] Starting KUnit Kernel (1/1)...
[17:58:20] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:58:20] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[17:58:20] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[17:58:20] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[17:58:20] =========== drm_validate_clone_mode (2 subtests) ===========
[17:58:20] ============== drm_test_check_in_clone_mode  ===============
[17:58:20] [PASSED] in_clone_mode
[17:58:20] [PASSED] not_in_clone_mode
[17:58:20] ========== [PASSED] drm_test_check_in_clone_mode ===========
[17:58:20] =============== drm_test_check_valid_clones  ===============
[17:58:20] [PASSED] not_in_clone_mode
[17:58:20] [PASSED] valid_clone
[17:58:20] [PASSED] invalid_clone
[17:58:20] =========== [PASSED] drm_test_check_valid_clones ===========
[17:58:20] ============= [PASSED] drm_validate_clone_mode =============
[17:58:20] ============= drm_validate_modeset (1 subtest) =============
[17:58:20] [PASSED] drm_test_check_connector_changed_modeset
[17:58:20] ============== [PASSED] drm_validate_modeset ===============
[17:58:20] ====== drm_test_bridge_get_current_state (2 subtests) ======
[17:58:20] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[17:58:20] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[17:58:20] ======== [PASSED] drm_test_bridge_get_current_state ========
[17:58:20] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[17:58:20] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[17:58:20] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[17:58:20] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[17:58:20] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[17:58:20] ================== drm_buddy (7 subtests) ==================
[17:58:20] [PASSED] drm_test_buddy_alloc_limit
[17:58:20] [PASSED] drm_test_buddy_alloc_optimistic
[17:58:20] [PASSED] drm_test_buddy_alloc_pessimistic
[17:58:20] [PASSED] drm_test_buddy_alloc_pathological
[17:58:20] [PASSED] drm_test_buddy_alloc_contiguous
[17:58:20] [PASSED] drm_test_buddy_alloc_clear
[17:58:20] [PASSED] drm_test_buddy_alloc_range_bias
[17:58:20] ==================== [PASSED] drm_buddy ====================
[17:58:20] ============= drm_cmdline_parser (40 subtests) =============
[17:58:20] [PASSED] drm_test_cmdline_force_d_only
[17:58:20] [PASSED] drm_test_cmdline_force_D_only_dvi
[17:58:20] [PASSED] drm_test_cmdline_force_D_only_hdmi
[17:58:20] [PASSED] drm_test_cmdline_force_D_only_not_digital
[17:58:20] [PASSED] drm_test_cmdline_force_e_only
[17:58:20] [PASSED] drm_test_cmdline_res
[17:58:20] [PASSED] drm_test_cmdline_res_vesa
[17:58:20] [PASSED] drm_test_cmdline_res_vesa_rblank
[17:58:20] [PASSED] drm_test_cmdline_res_rblank
[17:58:20] [PASSED] drm_test_cmdline_res_bpp
[17:58:20] [PASSED] drm_test_cmdline_res_refresh
[17:58:20] [PASSED] drm_test_cmdline_res_bpp_refresh
[17:58:20] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[17:58:20] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[17:58:20] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[17:58:20] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[17:58:20] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[17:58:20] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[17:58:20] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[17:58:20] [PASSED] drm_test_cmdline_res_margins_force_on
[17:58:20] [PASSED] drm_test_cmdline_res_vesa_margins
[17:58:20] [PASSED] drm_test_cmdline_name
[17:58:20] [PASSED] drm_test_cmdline_name_bpp
[17:58:20] [PASSED] drm_test_cmdline_name_option
[17:58:20] [PASSED] drm_test_cmdline_name_bpp_option
[17:58:20] [PASSED] drm_test_cmdline_rotate_0
[17:58:20] [PASSED] drm_test_cmdline_rotate_90
[17:58:20] [PASSED] drm_test_cmdline_rotate_180
[17:58:20] [PASSED] drm_test_cmdline_rotate_270
[17:58:20] [PASSED] drm_test_cmdline_hmirror
[17:58:20] [PASSED] drm_test_cmdline_vmirror
[17:58:20] [PASSED] drm_test_cmdline_margin_options
[17:58:20] [PASSED] drm_test_cmdline_multiple_options
[17:58:20] [PASSED] drm_test_cmdline_bpp_extra_and_option
[17:58:20] [PASSED] drm_test_cmdline_extra_and_option
[17:58:20] [PASSED] drm_test_cmdline_freestanding_options
[17:58:20] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[17:58:20] [PASSED] drm_test_cmdline_panel_orientation
[17:58:20] ================ drm_test_cmdline_invalid  =================
[17:58:20] [PASSED] margin_only
[17:58:20] [PASSED] interlace_only
[17:58:20] [PASSED] res_missing_x
[17:58:20] [PASSED] res_missing_y
[17:58:20] [PASSED] res_bad_y
[17:58:20] [PASSED] res_missing_y_bpp
[17:58:20] [PASSED] res_bad_bpp
[17:58:20] [PASSED] res_bad_refresh
[17:58:20] [PASSED] res_bpp_refresh_force_on_off
[17:58:20] [PASSED] res_invalid_mode
[17:58:20] [PASSED] res_bpp_wrong_place_mode
[17:58:20] [PASSED] name_bpp_refresh
[17:58:20] [PASSED] name_refresh
[17:58:20] [PASSED] name_refresh_wrong_mode
[17:58:20] [PASSED] name_refresh_invalid_mode
[17:58:20] [PASSED] rotate_multiple
[17:58:20] [PASSED] rotate_invalid_val
[17:58:20] [PASSED] rotate_truncated
[17:58:20] [PASSED] invalid_option
[17:58:20] [PASSED] invalid_tv_option
[17:58:20] [PASSED] truncated_tv_option
[17:58:20] ============ [PASSED] drm_test_cmdline_invalid =============
[17:58:20] =============== drm_test_cmdline_tv_options  ===============
[17:58:20] [PASSED] NTSC
[17:58:20] [PASSED] NTSC_443
[17:58:20] [PASSED] NTSC_J
[17:58:20] [PASSED] PAL
[17:58:20] [PASSED] PAL_M
[17:58:20] [PASSED] PAL_N
[17:58:20] [PASSED] SECAM
[17:58:20] [PASSED] MONO_525
[17:58:20] [PASSED] MONO_625
[17:58:20] =========== [PASSED] drm_test_cmdline_tv_options ===========
[17:58:20] =============== [PASSED] drm_cmdline_parser ================
[17:58:20] ========== drmm_connector_hdmi_init (20 subtests) ==========
[17:58:20] [PASSED] drm_test_connector_hdmi_init_valid
[17:58:20] [PASSED] drm_test_connector_hdmi_init_bpc_8
[17:58:20] [PASSED] drm_test_connector_hdmi_init_bpc_10
[17:58:20] [PASSED] drm_test_connector_hdmi_init_bpc_12
[17:58:20] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[17:58:20] [PASSED] drm_test_connector_hdmi_init_bpc_null
[17:58:20] [PASSED] drm_test_connector_hdmi_init_formats_empty
[17:58:20] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[17:58:20] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[17:58:20] [PASSED] supported_formats=0x9 yuv420_allowed=1
[17:58:20] [PASSED] supported_formats=0x9 yuv420_allowed=0
[17:58:20] [PASSED] supported_formats=0x3 yuv420_allowed=1
[17:58:20] [PASSED] supported_formats=0x3 yuv420_allowed=0
[17:58:20] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[17:58:20] [PASSED] drm_test_connector_hdmi_init_null_ddc
[17:58:20] [PASSED] drm_test_connector_hdmi_init_null_product
[17:58:20] [PASSED] drm_test_connector_hdmi_init_null_vendor
[17:58:20] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[17:58:20] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[17:58:20] [PASSED] drm_test_connector_hdmi_init_product_valid
[17:58:20] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[17:58:20] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[17:58:20] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[17:58:20] ========= drm_test_connector_hdmi_init_type_valid  =========
[17:58:20] [PASSED] HDMI-A
[17:58:20] [PASSED] HDMI-B
[17:58:20] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[17:58:20] ======== drm_test_connector_hdmi_init_type_invalid  ========
[17:58:20] [PASSED] Unknown
[17:58:20] [PASSED] VGA
[17:58:20] [PASSED] DVI-I
[17:58:20] [PASSED] DVI-D
[17:58:20] [PASSED] DVI-A
[17:58:20] [PASSED] Composite
[17:58:20] [PASSED] SVIDEO
[17:58:20] [PASSED] LVDS
[17:58:20] [PASSED] Component
[17:58:20] [PASSED] DIN
[17:58:20] [PASSED] DP
[17:58:20] [PASSED] TV
[17:58:20] [PASSED] eDP
[17:58:20] [PASSED] Virtual
[17:58:20] [PASSED] DSI
[17:58:20] [PASSED] DPI
[17:58:20] [PASSED] Writeback
[17:58:20] [PASSED] SPI
[17:58:20] [PASSED] USB
[17:58:20] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[17:58:20] ============ [PASSED] drmm_connector_hdmi_init =============
[17:58:20] ============= drmm_connector_init (3 subtests) =============
[17:58:20] [PASSED] drm_test_drmm_connector_init
[17:58:20] [PASSED] drm_test_drmm_connector_init_null_ddc
[17:58:20] ========= drm_test_drmm_connector_init_type_valid  =========
[17:58:20] [PASSED] Unknown
[17:58:20] [PASSED] VGA
[17:58:20] [PASSED] DVI-I
[17:58:20] [PASSED] DVI-D
[17:58:20] [PASSED] DVI-A
[17:58:20] [PASSED] Composite
[17:58:20] [PASSED] SVIDEO
[17:58:20] [PASSED] LVDS
[17:58:20] [PASSED] Component
[17:58:20] [PASSED] DIN
[17:58:20] [PASSED] DP
[17:58:20] [PASSED] HDMI-A
[17:58:20] [PASSED] HDMI-B
[17:58:20] [PASSED] TV
[17:58:20] [PASSED] eDP
[17:58:20] [PASSED] Virtual
[17:58:20] [PASSED] DSI
[17:58:20] [PASSED] DPI
[17:58:20] [PASSED] Writeback
[17:58:20] [PASSED] SPI
[17:58:20] [PASSED] USB
[17:58:20] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[17:58:20] =============== [PASSED] drmm_connector_init ===============
[17:58:20] ========= drm_connector_dynamic_init (6 subtests) ==========
[17:58:20] [PASSED] drm_test_drm_connector_dynamic_init
[17:58:20] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[17:58:20] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[17:58:20] [PASSED] drm_test_drm_connector_dynamic_init_properties
[17:58:20] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[17:58:20] [PASSED] Unknown
[17:58:20] [PASSED] VGA
[17:58:20] [PASSED] DVI-I
[17:58:20] [PASSED] DVI-D
[17:58:20] [PASSED] DVI-A
[17:58:20] [PASSED] Composite
[17:58:20] [PASSED] SVIDEO
[17:58:20] [PASSED] LVDS
[17:58:20] [PASSED] Component
[17:58:20] [PASSED] DIN
[17:58:20] [PASSED] DP
[17:58:20] [PASSED] HDMI-A
[17:58:20] [PASSED] HDMI-B
[17:58:20] [PASSED] TV
[17:58:20] [PASSED] eDP
[17:58:20] [PASSED] Virtual
[17:58:20] [PASSED] DSI
[17:58:20] [PASSED] DPI
[17:58:20] [PASSED] Writeback
[17:58:20] [PASSED] SPI
[17:58:20] [PASSED] USB
[17:58:20] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[17:58:20] ======== drm_test_drm_connector_dynamic_init_name  =========
[17:58:20] [PASSED] Unknown
[17:58:20] [PASSED] VGA
[17:58:20] [PASSED] DVI-I
[17:58:20] [PASSED] DVI-D
[17:58:20] [PASSED] DVI-A
[17:58:20] [PASSED] Composite
[17:58:20] [PASSED] SVIDEO
[17:58:20] [PASSED] LVDS
[17:58:20] [PASSED] Component
[17:58:20] [PASSED] DIN
[17:58:20] [PASSED] DP
[17:58:20] [PASSED] HDMI-A
[17:58:20] [PASSED] HDMI-B
[17:58:20] [PASSED] TV
[17:58:20] [PASSED] eDP
[17:58:20] [PASSED] Virtual
[17:58:20] [PASSED] DSI
[17:58:20] [PASSED] DPI
[17:58:20] [PASSED] Writeback
[17:58:20] [PASSED] SPI
[17:58:20] [PASSED] USB
[17:58:20] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[17:58:20] =========== [PASSED] drm_connector_dynamic_init ============
[17:58:20] ==== drm_connector_dynamic_register_early (4 subtests) =====
[17:58:20] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[17:58:20] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[17:58:20] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[17:58:20] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[17:58:20] ====== [PASSED] drm_connector_dynamic_register_early =======
[17:58:20] ======= drm_connector_dynamic_register (7 subtests) ========
[17:58:20] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[17:58:20] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[17:58:20] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[17:58:20] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[17:58:20] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[17:58:20] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[17:58:20] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[17:58:20] ========= [PASSED] drm_connector_dynamic_register ==========
[17:58:20] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[17:58:20] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[17:58:20] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[17:58:20] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[17:58:20] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[17:58:20] ========== drm_test_get_tv_mode_from_name_valid  ===========
[17:58:20] [PASSED] NTSC
[17:58:20] [PASSED] NTSC-443
[17:58:20] [PASSED] NTSC-J
[17:58:20] [PASSED] PAL
[17:58:20] [PASSED] PAL-M
[17:58:20] [PASSED] PAL-N
[17:58:20] [PASSED] SECAM
[17:58:20] [PASSED] Mono
[17:58:20] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[17:58:20] [PASSED] drm_test_get_tv_mode_from_name_truncated
[17:58:20] ============ [PASSED] drm_get_tv_mode_from_name ============
[17:58:20] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[17:58:20] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[17:58:20] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[17:58:20] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[17:58:20] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[17:58:20] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[17:58:20] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[17:58:20] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[17:58:20] [PASSED] VIC 96
[17:58:20] [PASSED] VIC 97
[17:58:20] [PASSED] VIC 101
[17:58:20] [PASSED] VIC 102
[17:58:20] [PASSED] VIC 106
[17:58:20] [PASSED] VIC 107
[17:58:20] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[17:58:20] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[17:58:20] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[17:58:20] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[17:58:20] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[17:58:20] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[17:58:20] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[17:58:20] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[17:58:20] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[17:58:20] [PASSED] Automatic
[17:58:20] [PASSED] Full
[17:58:20] [PASSED] Limited 16:235
[17:58:20] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[17:58:20] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[17:58:20] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[17:58:20] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[17:58:20] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[17:58:20] [PASSED] RGB
[17:58:20] [PASSED] YUV 4:2:0
[17:58:20] [PASSED] YUV 4:2:2
[17:58:20] [PASSED] YUV 4:4:4
[17:58:20] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[17:58:20] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[17:58:20] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[17:58:20] ============= drm_damage_helper (21 subtests) ==============
[17:58:20] [PASSED] drm_test_damage_iter_no_damage
[17:58:20] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[17:58:20] [PASSED] drm_test_damage_iter_no_damage_src_moved
[17:58:20] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[17:58:20] [PASSED] drm_test_damage_iter_no_damage_not_visible
[17:58:20] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[17:58:20] [PASSED] drm_test_damage_iter_no_damage_no_fb
[17:58:20] [PASSED] drm_test_damage_iter_simple_damage
[17:58:20] [PASSED] drm_test_damage_iter_single_damage
[17:58:20] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[17:58:20] [PASSED] drm_test_damage_iter_single_damage_outside_src
[17:58:20] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[17:58:20] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[17:58:20] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[17:58:20] [PASSED] drm_test_damage_iter_single_damage_src_moved
[17:58:20] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[17:58:20] [PASSED] drm_test_damage_iter_damage
[17:58:20] [PASSED] drm_test_damage_iter_damage_one_intersect
[17:58:20] [PASSED] drm_test_damage_iter_damage_one_outside
[17:58:20] [PASSED] drm_test_damage_iter_damage_src_moved
[17:58:20] [PASSED] drm_test_damage_iter_damage_not_visible
[17:58:20] ================ [PASSED] drm_damage_helper ================
[17:58:20] ============== drm_dp_mst_helper (3 subtests) ==============
[17:58:20] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[17:58:20] [PASSED] Clock 154000 BPP 30 DSC disabled
[17:58:20] [PASSED] Clock 234000 BPP 30 DSC disabled
[17:58:20] [PASSED] Clock 297000 BPP 24 DSC disabled
[17:58:20] [PASSED] Clock 332880 BPP 24 DSC enabled
[17:58:20] [PASSED] Clock 324540 BPP 24 DSC enabled
[17:58:20] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[17:58:20] ============== drm_test_dp_mst_calc_pbn_div  ===============
[17:58:20] [PASSED] Link rate 2000000 lane count 4
[17:58:20] [PASSED] Link rate 2000000 lane count 2
[17:58:20] [PASSED] Link rate 2000000 lane count 1
[17:58:20] [PASSED] Link rate 1350000 lane count 4
[17:58:20] [PASSED] Link rate 1350000 lane count 2
[17:58:20] [PASSED] Link rate 1350000 lane count 1
[17:58:20] [PASSED] Link rate 1000000 lane count 4
[17:58:20] [PASSED] Link rate 1000000 lane count 2
[17:58:20] [PASSED] Link rate 1000000 lane count 1
[17:58:20] [PASSED] Link rate 810000 lane count 4
[17:58:20] [PASSED] Link rate 810000 lane count 2
[17:58:20] [PASSED] Link rate 810000 lane count 1
[17:58:20] [PASSED] Link rate 540000 lane count 4
[17:58:20] [PASSED] Link rate 540000 lane count 2
[17:58:20] [PASSED] Link rate 540000 lane count 1
[17:58:20] [PASSED] Link rate 270000 lane count 4
[17:58:20] [PASSED] Link rate 270000 lane count 2
[17:58:20] [PASSED] Link rate 270000 lane count 1
[17:58:20] [PASSED] Link rate 162000 lane count 4
[17:58:20] [PASSED] Link rate 162000 lane count 2
[17:58:20] [PASSED] Link rate 162000 lane count 1
[17:58:20] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[17:58:20] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[17:58:20] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[17:58:20] [PASSED] DP_POWER_UP_PHY with port number
[17:58:20] [PASSED] DP_POWER_DOWN_PHY with port number
[17:58:20] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[17:58:20] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[17:58:20] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[17:58:20] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[17:58:20] [PASSED] DP_QUERY_PAYLOAD with port number
[17:58:20] [PASSED] DP_QUERY_PAYLOAD with VCPI
[17:58:20] [PASSED] DP_REMOTE_DPCD_READ with port number
[17:58:20] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[17:58:20] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[17:58:20] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[17:58:20] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[17:58:20] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[17:58:20] [PASSED] DP_REMOTE_I2C_READ with port number
[17:58:20] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[17:58:20] [PASSED] DP_REMOTE_I2C_READ with transactions array
[17:58:20] [PASSED] DP_REMOTE_I2C_WRITE with port number
[17:58:20] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[17:58:20] [PASSED] DP_REMOTE_I2C_WRITE with data array
[17:58:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[17:58:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[17:58:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[17:58:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[17:58:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[17:58:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[17:58:20] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[17:58:20] ================ [PASSED] drm_dp_mst_helper ================
[17:58:20] ================== drm_exec (7 subtests) ===================
[17:58:20] [PASSED] sanitycheck
[17:58:20] [PASSED] test_lock
[17:58:20] [PASSED] test_lock_unlock
[17:58:20] [PASSED] test_duplicates
[17:58:20] [PASSED] test_prepare
[17:58:20] [PASSED] test_prepare_array
[17:58:20] [PASSED] test_multiple_loops
[17:58:20] ==================== [PASSED] drm_exec =====================
[17:58:20] =========== drm_format_helper_test (18 subtests) ===========
[17:58:20] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[17:58:20] [PASSED] single_pixel_source_buffer
[17:58:20] [PASSED] single_pixel_clip_rectangle
[17:58:20] [PASSED] well_known_colors
[17:58:20] [PASSED] destination_pitch
[17:58:20] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[17:58:20] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[17:58:20] [PASSED] single_pixel_source_buffer
[17:58:20] [PASSED] single_pixel_clip_rectangle
[17:58:20] [PASSED] well_known_colors
[17:58:20] [PASSED] destination_pitch
[17:58:20] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[17:58:20] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[17:58:20] [PASSED] single_pixel_source_buffer
[17:58:20] [PASSED] single_pixel_clip_rectangle
[17:58:20] [PASSED] well_known_colors
[17:58:20] [PASSED] destination_pitch
[17:58:20] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[17:58:20] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[17:58:20] [PASSED] single_pixel_source_buffer
[17:58:20] [PASSED] single_pixel_clip_rectangle
[17:58:20] [PASSED] well_known_colors
[17:58:20] [PASSED] destination_pitch
[17:58:20] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[17:58:20] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[17:58:20] [PASSED] single_pixel_source_buffer
[17:58:20] [PASSED] single_pixel_clip_rectangle
[17:58:20] [PASSED] well_known_colors
[17:58:20] [PASSED] destination_pitch
[17:58:20] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[17:58:20] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[17:58:20] [PASSED] single_pixel_source_buffer
[17:58:20] [PASSED] single_pixel_clip_rectangle
[17:58:20] [PASSED] well_known_colors
[17:58:20] [PASSED] destination_pitch
[17:58:20] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[17:58:20] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[17:58:20] [PASSED] single_pixel_source_buffer
[17:58:20] [PASSED] single_pixel_clip_rectangle
[17:58:20] [PASSED] well_known_colors
[17:58:20] [PASSED] destination_pitch
[17:58:20] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[17:58:20] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[17:58:20] [PASSED] single_pixel_source_buffer
[17:58:20] [PASSED] single_pixel_clip_rectangle
[17:58:20] [PASSED] well_known_colors
[17:58:20] [PASSED] destination_pitch
[17:58:20] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[17:58:20] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[17:58:20] [PASSED] single_pixel_source_buffer
[17:58:20] [PASSED] single_pixel_clip_rectangle
[17:58:20] [PASSED] well_known_colors
[17:58:20] [PASSED] destination_pitch
[17:58:20] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[17:58:20] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[17:58:20] [PASSED] single_pixel_source_buffer
[17:58:20] [PASSED] single_pixel_clip_rectangle
[17:58:20] [PASSED] well_known_colors
[17:58:20] [PASSED] destination_pitch
[17:58:20] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[17:58:20] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[17:58:20] [PASSED] single_pixel_source_buffer
[17:58:20] [PASSED] single_pixel_clip_rectangle
[17:58:20] [PASSED] well_known_colors
[17:58:20] [PASSED] destination_pitch
[17:58:20] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[17:58:20] ============== drm_test_fb_xrgb8888_to_mono  ===============
[17:58:20] [PASSED] single_pixel_source_buffer
[17:58:20] [PASSED] single_pixel_clip_rectangle
[17:58:20] [PASSED] well_known_colors
[17:58:20] [PASSED] destination_pitch
[17:58:20] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[17:58:20] ==================== drm_test_fb_swab  =====================
[17:58:20] [PASSED] single_pixel_source_buffer
[17:58:20] [PASSED] single_pixel_clip_rectangle
[17:58:20] [PASSED] well_known_colors
[17:58:20] [PASSED] destination_pitch
[17:58:20] ================ [PASSED] drm_test_fb_swab =================
[17:58:20] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[17:58:20] [PASSED] single_pixel_source_buffer
[17:58:20] [PASSED] single_pixel_clip_rectangle
[17:58:20] [PASSED] well_known_colors
[17:58:20] [PASSED] destination_pitch
[17:58:20] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[17:58:20] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[17:58:20] [PASSED] single_pixel_source_buffer
[17:58:20] [PASSED] single_pixel_clip_rectangle
[17:58:20] [PASSED] well_known_colors
[17:58:20] [PASSED] destination_pitch
[17:58:20] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[17:58:20] ================= drm_test_fb_clip_offset  =================
[17:58:20] [PASSED] pass through
[17:58:20] [PASSED] horizontal offset
[17:58:20] [PASSED] vertical offset
[17:58:20] [PASSED] horizontal and vertical offset
[17:58:20] [PASSED] horizontal offset (custom pitch)
[17:58:20] [PASSED] vertical offset (custom pitch)
[17:58:20] [PASSED] horizontal and vertical offset (custom pitch)
[17:58:20] ============= [PASSED] drm_test_fb_clip_offset =============
[17:58:20] ============== drm_test_fb_build_fourcc_list  ==============
[17:58:20] [PASSED] no native formats
[17:58:20] [PASSED] XRGB8888 as native format
[17:58:20] [PASSED] remove duplicates
[17:58:20] [PASSED] convert alpha formats
[17:58:20] [PASSED] random formats
[17:58:20] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[17:58:20] =================== drm_test_fb_memcpy  ====================
[17:58:20] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[17:58:20] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[17:58:20] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[17:58:20] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[17:58:20] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[17:58:20] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[17:58:20] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[17:58:20] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[17:58:20] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[17:58:20] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[17:58:20] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[17:58:20] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[17:58:20] =============== [PASSED] drm_test_fb_memcpy ================
[17:58:20] ============= [PASSED] drm_format_helper_test ==============
[17:58:20] ================= drm_format (18 subtests) =================
[17:58:20] [PASSED] drm_test_format_block_width_invalid
[17:58:20] [PASSED] drm_test_format_block_width_one_plane
[17:58:20] [PASSED] drm_test_format_block_width_two_plane
[17:58:20] [PASSED] drm_test_format_block_width_three_plane
[17:58:20] [PASSED] drm_test_format_block_width_tiled
[17:58:20] [PASSED] drm_test_format_block_height_invalid
[17:58:20] [PASSED] drm_test_format_block_height_one_plane
[17:58:20] [PASSED] drm_test_format_block_height_two_plane
[17:58:20] [PASSED] drm_test_format_block_height_three_plane
[17:58:20] [PASSED] drm_test_format_block_height_tiled
[17:58:20] [PASSED] drm_test_format_min_pitch_invalid
[17:58:20] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[17:58:20] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[17:58:20] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[17:58:20] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[17:58:20] [PASSED] drm_test_format_min_pitch_two_plane
[17:58:20] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[17:58:20] [PASSED] drm_test_format_min_pitch_tiled
[17:58:20] =================== [PASSED] drm_format ====================
[17:58:20] ============== drm_framebuffer (10 subtests) ===============
[17:58:20] ========== drm_test_framebuffer_check_src_coords  ==========
[17:58:20] [PASSED] Success: source fits into fb
[17:58:20] [PASSED] Fail: overflowing fb with x-axis coordinate
[17:58:20] [PASSED] Fail: overflowing fb with y-axis coordinate
[17:58:20] [PASSED] Fail: overflowing fb with source width
[17:58:20] [PASSED] Fail: overflowing fb with source height
[17:58:20] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[17:58:20] [PASSED] drm_test_framebuffer_cleanup
[17:58:20] =============== drm_test_framebuffer_create  ===============
[17:58:20] [PASSED] ABGR8888 normal sizes
[17:58:20] [PASSED] ABGR8888 max sizes
[17:58:20] [PASSED] ABGR8888 pitch greater than min required
[17:58:20] [PASSED] ABGR8888 pitch less than min required
[17:58:20] [PASSED] ABGR8888 Invalid width
[17:58:20] [PASSED] ABGR8888 Invalid buffer handle
[17:58:20] [PASSED] No pixel format
[17:58:20] [PASSED] ABGR8888 Width 0
[17:58:20] [PASSED] ABGR8888 Height 0
[17:58:20] [PASSED] ABGR8888 Out of bound height * pitch combination
[17:58:20] [PASSED] ABGR8888 Large buffer offset
[17:58:20] [PASSED] ABGR8888 Buffer offset for inexistent plane
[17:58:20] [PASSED] ABGR8888 Invalid flag
[17:58:20] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[17:58:20] [PASSED] ABGR8888 Valid buffer modifier
[17:58:20] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[17:58:20] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[17:58:20] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[17:58:20] [PASSED] NV12 Normal sizes
[17:58:20] [PASSED] NV12 Max sizes
[17:58:20] [PASSED] NV12 Invalid pitch
[17:58:20] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[17:58:20] [PASSED] NV12 different  modifier per-plane
[17:58:20] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[17:58:20] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[17:58:20] [PASSED] NV12 Modifier for inexistent plane
[17:58:20] [PASSED] NV12 Handle for inexistent plane
[17:58:20] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[17:58:20] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[17:58:20] [PASSED] YVU420 Normal sizes
[17:58:20] [PASSED] YVU420 Max sizes
[17:58:20] [PASSED] YVU420 Invalid pitch
[17:58:20] [PASSED] YVU420 Different pitches
[17:58:20] [PASSED] YVU420 Different buffer offsets/pitches
[17:58:20] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[17:58:20] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[17:58:20] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[17:58:20] [PASSED] YVU420 Valid modifier
[17:58:20] [PASSED] YVU420 Different modifiers per plane
[17:58:20] [PASSED] YVU420 Modifier for inexistent plane
[17:58:20] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[17:58:20] [PASSED] X0L2 Normal sizes
[17:58:20] [PASSED] X0L2 Max sizes
[17:58:20] [PASSED] X0L2 Invalid pitch
[17:58:20] [PASSED] X0L2 Pitch greater than minimum required
[17:58:20] [PASSED] X0L2 Handle for inexistent plane
[17:58:20] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[17:58:20] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[17:58:20] [PASSED] X0L2 Valid modifier
[17:58:20] [PASSED] X0L2 Modifier for inexistent plane
[17:58:20] =========== [PASSED] drm_test_framebuffer_create ===========
[17:58:20] [PASSED] drm_test_framebuffer_free
[17:58:20] [PASSED] drm_test_framebuffer_init
[17:58:20] [PASSED] drm_test_framebuffer_init_bad_format
[17:58:20] [PASSED] drm_test_framebuffer_init_dev_mismatch
[17:58:20] [PASSED] drm_test_framebuffer_lookup
[17:58:20] [PASSED] drm_test_framebuffer_lookup_inexistent
[17:58:20] [PASSED] drm_test_framebuffer_modifiers_not_supported
[17:58:20] ================= [PASSED] drm_framebuffer =================
[17:58:20] ================ drm_gem_shmem (8 subtests) ================
[17:58:20] [PASSED] drm_gem_shmem_test_obj_create
[17:58:20] [PASSED] drm_gem_shmem_test_obj_create_private
[17:58:20] [PASSED] drm_gem_shmem_test_pin_pages
[17:58:20] [PASSED] drm_gem_shmem_test_vmap
[17:58:20] [PASSED] drm_gem_shmem_test_get_pages_sgt
[17:58:20] [PASSED] drm_gem_shmem_test_get_sg_table
[17:58:20] [PASSED] drm_gem_shmem_test_madvise
[17:58:20] [PASSED] drm_gem_shmem_test_purge
[17:58:20] ================== [PASSED] drm_gem_shmem ==================
[17:58:20] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[17:58:20] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[17:58:20] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[17:58:20] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[17:58:20] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[17:58:20] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[17:58:20] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[17:58:20] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[17:58:20] [PASSED] Automatic
[17:58:20] [PASSED] Full
[17:58:20] [PASSED] Limited 16:235
[17:58:20] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[17:58:20] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[17:58:20] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[17:58:20] [PASSED] drm_test_check_disable_connector
[17:58:20] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[17:58:20] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[17:58:20] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[17:58:20] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[17:58:20] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[17:58:20] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[17:58:20] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[17:58:20] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[17:58:20] [PASSED] drm_test_check_output_bpc_dvi
[17:58:20] [PASSED] drm_test_check_output_bpc_format_vic_1
[17:58:20] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[17:58:20] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[17:58:20] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[17:58:20] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[17:58:20] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[17:58:20] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[17:58:20] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[17:58:20] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[17:58:20] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[17:58:20] [PASSED] drm_test_check_broadcast_rgb_value
[17:58:20] [PASSED] drm_test_check_bpc_8_value
[17:58:20] [PASSED] drm_test_check_bpc_10_value
[17:58:20] [PASSED] drm_test_check_bpc_12_value
[17:58:20] [PASSED] drm_test_check_format_value
[17:58:20] [PASSED] drm_test_check_tmds_char_value
[17:58:20] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[17:58:20] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[17:58:20] [PASSED] drm_test_check_mode_valid
[17:58:20] [PASSED] drm_test_check_mode_valid_reject
[17:58:20] [PASSED] drm_test_check_mode_valid_reject_rate
[17:58:20] [PASSED] drm_test_check_mode_valid_reject_max_clock
[17:58:20] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[17:58:20] ================= drm_managed (2 subtests) =================
[17:58:20] [PASSED] drm_test_managed_release_action
[17:58:20] [PASSED] drm_test_managed_run_action
[17:58:20] =================== [PASSED] drm_managed ===================
[17:58:20] =================== drm_mm (6 subtests) ====================
[17:58:20] [PASSED] drm_test_mm_init
[17:58:20] [PASSED] drm_test_mm_debug
[17:58:20] [PASSED] drm_test_mm_align32
[17:58:20] [PASSED] drm_test_mm_align64
[17:58:20] [PASSED] drm_test_mm_lowest
[17:58:20] [PASSED] drm_test_mm_highest
[17:58:20] ===================== [PASSED] drm_mm ======================
[17:58:20] ============= drm_modes_analog_tv (5 subtests) =============
[17:58:20] [PASSED] drm_test_modes_analog_tv_mono_576i
[17:58:20] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[17:58:20] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[17:58:20] [PASSED] drm_test_modes_analog_tv_pal_576i
[17:58:20] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[17:58:20] =============== [PASSED] drm_modes_analog_tv ===============
[17:58:20] ============== drm_plane_helper (2 subtests) ===============
[17:58:20] =============== drm_test_check_plane_state  ================
[17:58:20] [PASSED] clipping_simple
[17:58:20] [PASSED] clipping_rotate_reflect
[17:58:20] [PASSED] positioning_simple
[17:58:20] [PASSED] upscaling
[17:58:20] [PASSED] downscaling
[17:58:20] [PASSED] rounding1
[17:58:20] [PASSED] rounding2
[17:58:20] [PASSED] rounding3
[17:58:20] [PASSED] rounding4
[17:58:20] =========== [PASSED] drm_test_check_plane_state ============
[17:58:20] =========== drm_test_check_invalid_plane_state  ============
[17:58:20] [PASSED] positioning_invalid
[17:58:20] [PASSED] upscaling_invalid
[17:58:20] [PASSED] downscaling_invalid
[17:58:20] ======= [PASSED] drm_test_check_invalid_plane_state ========
[17:58:20] ================ [PASSED] drm_plane_helper =================
[17:58:20] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[17:58:20] ====== drm_test_connector_helper_tv_get_modes_check  =======
[17:58:20] [PASSED] None
[17:58:20] [PASSED] PAL
[17:58:20] [PASSED] NTSC
[17:58:20] [PASSED] Both, NTSC Default
[17:58:20] [PASSED] Both, PAL Default
[17:58:20] [PASSED] Both, NTSC Default, with PAL on command-line
[17:58:20] [PASSED] Both, PAL Default, with NTSC on command-line
[17:58:20] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[17:58:20] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[17:58:20] ================== drm_rect (9 subtests) ===================
[17:58:20] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[17:58:20] [PASSED] drm_test_rect_clip_scaled_not_clipped
[17:58:20] [PASSED] drm_test_rect_clip_scaled_clipped
[17:58:20] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[17:58:20] ================= drm_test_rect_intersect  =================
[17:58:20] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[17:58:20] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[17:58:20] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[17:58:20] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[17:58:20] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[17:58:20] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[17:58:20] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[17:58:20] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[17:58:20] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[17:58:20] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[17:58:20] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[17:58:20] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[17:58:20] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[17:58:20] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[17:58:20] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[17:58:20] ============= [PASSED] drm_test_rect_intersect =============
[17:58:20] ================ drm_test_rect_calc_hscale  ================
[17:58:20] [PASSED] normal use
[17:58:20] [PASSED] out of max range
[17:58:20] [PASSED] out of min range
[17:58:20] [PASSED] zero dst
[17:58:20] [PASSED] negative src
[17:58:20] [PASSED] negative dst
[17:58:20] ============ [PASSED] drm_test_rect_calc_hscale ============
[17:58:20] ================ drm_test_rect_calc_vscale  ================
[17:58:20] [PASSED] normal use
[17:58:20] [PASSED] out of max range
[17:58:20] [PASSED] out of min range
[17:58:20] [PASSED] zero dst
[17:58:20] [PASSED] negative src
[17:58:20] [PASSED] negative dst
[17:58:20] ============ [PASSED] drm_test_rect_calc_vscale ============
[17:58:20] ================== drm_test_rect_rotate  ===================
[17:58:20] [PASSED] reflect-x
[17:58:20] [PASSED] reflect-y
[17:58:20] [PASSED] rotate-0
[17:58:20] [PASSED] rotate-90
[17:58:20] [PASSED] rotate-180
stty: 'standard input': Inappropriate ioctl for device
[17:58:20] [PASSED] rotate-270
[17:58:20] ============== [PASSED] drm_test_rect_rotate ===============
[17:58:20] ================ drm_test_rect_rotate_inv  =================
[17:58:20] [PASSED] reflect-x
[17:58:20] [PASSED] reflect-y
[17:58:20] [PASSED] rotate-0
[17:58:20] [PASSED] rotate-90
[17:58:20] [PASSED] rotate-180
[17:58:20] [PASSED] rotate-270
[17:58:20] ============ [PASSED] drm_test_rect_rotate_inv =============
[17:58:20] ==================== [PASSED] drm_rect =====================
[17:58:20] ============================================================
[17:58:20] Testing complete. Ran 614 tests: passed: 614
[17:58:20] Elapsed time: 23.137s total, 1.701s configuring, 21.218s building, 0.187s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[17:58:20] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:58:22] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:58:30] Starting KUnit Kernel (1/1)...
[17:58:30] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:58:30] ================= ttm_device (5 subtests) ==================
[17:58:30] [PASSED] ttm_device_init_basic
[17:58:30] [PASSED] ttm_device_init_multiple
[17:58:30] [PASSED] ttm_device_fini_basic
[17:58:30] [PASSED] ttm_device_init_no_vma_man
[17:58:30] ================== ttm_device_init_pools  ==================
[17:58:30] [PASSED] No DMA allocations, no DMA32 required
[17:58:30] [PASSED] DMA allocations, DMA32 required
[17:58:30] [PASSED] No DMA allocations, DMA32 required
[17:58:30] [PASSED] DMA allocations, no DMA32 required
[17:58:30] ============== [PASSED] ttm_device_init_pools ==============
[17:58:30] =================== [PASSED] ttm_device ====================
[17:58:30] ================== ttm_pool (8 subtests) ===================
[17:58:30] ================== ttm_pool_alloc_basic  ===================
[17:58:30] [PASSED] One page
[17:58:30] [PASSED] More than one page
[17:58:30] [PASSED] Above the allocation limit
[17:58:30] [PASSED] One page, with coherent DMA mappings enabled
[17:58:30] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[17:58:30] ============== [PASSED] ttm_pool_alloc_basic ===============
[17:58:30] ============== ttm_pool_alloc_basic_dma_addr  ==============
[17:58:30] [PASSED] One page
[17:58:30] [PASSED] More than one page
[17:58:30] [PASSED] Above the allocation limit
[17:58:30] [PASSED] One page, with coherent DMA mappings enabled
[17:58:30] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[17:58:30] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[17:58:30] [PASSED] ttm_pool_alloc_order_caching_match
[17:58:30] [PASSED] ttm_pool_alloc_caching_mismatch
[17:58:30] [PASSED] ttm_pool_alloc_order_mismatch
[17:58:30] [PASSED] ttm_pool_free_dma_alloc
[17:58:30] [PASSED] ttm_pool_free_no_dma_alloc
[17:58:30] [PASSED] ttm_pool_fini_basic
[17:58:30] ==================== [PASSED] ttm_pool =====================
[17:58:30] ================ ttm_resource (8 subtests) =================
[17:58:30] ================= ttm_resource_init_basic  =================
[17:58:30] [PASSED] Init resource in TTM_PL_SYSTEM
[17:58:30] [PASSED] Init resource in TTM_PL_VRAM
[17:58:30] [PASSED] Init resource in a private placement
[17:58:30] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[17:58:30] ============= [PASSED] ttm_resource_init_basic =============
[17:58:30] [PASSED] ttm_resource_init_pinned
[17:58:30] [PASSED] ttm_resource_fini_basic
[17:58:30] [PASSED] ttm_resource_manager_init_basic
[17:58:30] [PASSED] ttm_resource_manager_usage_basic
[17:58:30] [PASSED] ttm_resource_manager_set_used_basic
[17:58:30] [PASSED] ttm_sys_man_alloc_basic
[17:58:30] [PASSED] ttm_sys_man_free_basic
[17:58:30] ================== [PASSED] ttm_resource ===================
[17:58:30] =================== ttm_tt (15 subtests) ===================
[17:58:30] ==================== ttm_tt_init_basic  ====================
[17:58:30] [PASSED] Page-aligned size
[17:58:30] [PASSED] Extra pages requested
[17:58:30] ================ [PASSED] ttm_tt_init_basic ================
[17:58:30] [PASSED] ttm_tt_init_misaligned
[17:58:30] [PASSED] ttm_tt_fini_basic
[17:58:30] [PASSED] ttm_tt_fini_sg
[17:58:30] [PASSED] ttm_tt_fini_shmem
[17:58:30] [PASSED] ttm_tt_create_basic
[17:58:30] [PASSED] ttm_tt_create_invalid_bo_type
[17:58:30] [PASSED] ttm_tt_create_ttm_exists
[17:58:30] [PASSED] ttm_tt_create_failed
[17:58:30] [PASSED] ttm_tt_destroy_basic
[17:58:30] [PASSED] ttm_tt_populate_null_ttm
[17:58:30] [PASSED] ttm_tt_populate_populated_ttm
[17:58:30] [PASSED] ttm_tt_unpopulate_basic
[17:58:30] [PASSED] ttm_tt_unpopulate_empty_ttm
[17:58:30] [PASSED] ttm_tt_swapin_basic
[17:58:30] ===================== [PASSED] ttm_tt ======================
[17:58:30] =================== ttm_bo (14 subtests) ===================
[17:58:30] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[17:58:30] [PASSED] Cannot be interrupted and sleeps
[17:58:30] [PASSED] Cannot be interrupted, locks straight away
[17:58:30] [PASSED] Can be interrupted, sleeps
[17:58:30] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[17:58:30] [PASSED] ttm_bo_reserve_locked_no_sleep
[17:58:30] [PASSED] ttm_bo_reserve_no_wait_ticket
[17:58:30] [PASSED] ttm_bo_reserve_double_resv
[17:58:30] [PASSED] ttm_bo_reserve_interrupted
[17:58:30] [PASSED] ttm_bo_reserve_deadlock
[17:58:30] [PASSED] ttm_bo_unreserve_basic
[17:58:30] [PASSED] ttm_bo_unreserve_pinned
[17:58:30] [PASSED] ttm_bo_unreserve_bulk
[17:58:30] [PASSED] ttm_bo_put_basic
[17:58:30] [PASSED] ttm_bo_put_shared_resv
[17:58:30] [PASSED] ttm_bo_pin_basic
[17:58:30] [PASSED] ttm_bo_pin_unpin_resource
[17:58:30] [PASSED] ttm_bo_multiple_pin_one_unpin
[17:58:30] ===================== [PASSED] ttm_bo ======================
[17:58:30] ============== ttm_bo_validate (22 subtests) ===============
[17:58:30] ============== ttm_bo_init_reserved_sys_man  ===============
[17:58:30] [PASSED] Buffer object for userspace
[17:58:30] [PASSED] Kernel buffer object
[17:58:30] [PASSED] Shared buffer object
[17:58:30] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[17:58:30] ============== ttm_bo_init_reserved_mock_man  ==============
[17:58:30] [PASSED] Buffer object for userspace
[17:58:30] [PASSED] Kernel buffer object
[17:58:30] [PASSED] Shared buffer object
[17:58:30] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[17:58:30] [PASSED] ttm_bo_init_reserved_resv
[17:58:30] ================== ttm_bo_validate_basic  ==================
[17:58:30] [PASSED] Buffer object for userspace
[17:58:30] [PASSED] Kernel buffer object
[17:58:30] [PASSED] Shared buffer object
[17:58:30] ============== [PASSED] ttm_bo_validate_basic ==============
[17:58:30] [PASSED] ttm_bo_validate_invalid_placement
[17:58:30] ============= ttm_bo_validate_same_placement  ==============
[17:58:30] [PASSED] System manager
[17:58:30] [PASSED] VRAM manager
[17:58:30] ========= [PASSED] ttm_bo_validate_same_placement ==========
[17:58:30] [PASSED] ttm_bo_validate_failed_alloc
[17:58:30] [PASSED] ttm_bo_validate_pinned
[17:58:30] [PASSED] ttm_bo_validate_busy_placement
[17:58:30] ================ ttm_bo_validate_multihop  =================
[17:58:30] [PASSED] Buffer object for userspace
[17:58:30] [PASSED] Kernel buffer object
[17:58:30] [PASSED] Shared buffer object
[17:58:30] ============ [PASSED] ttm_bo_validate_multihop =============
[17:58:30] ========== ttm_bo_validate_no_placement_signaled  ==========
[17:58:30] [PASSED] Buffer object in system domain, no page vector
[17:58:30] [PASSED] Buffer object in system domain with an existing page vector
[17:58:30] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[17:58:30] ======== ttm_bo_validate_no_placement_not_signaled  ========
[17:58:30] [PASSED] Buffer object for userspace
[17:58:30] [PASSED] Kernel buffer object
[17:58:30] [PASSED] Shared buffer object
[17:58:30] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[17:58:30] [PASSED] ttm_bo_validate_move_fence_signaled
[17:58:30] ========= ttm_bo_validate_move_fence_not_signaled  =========
[17:58:30] [PASSED] Waits for GPU
[17:58:30] [PASSED] Tries to lock straight away
[17:58:30] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[17:58:30] [PASSED] ttm_bo_validate_swapout
[17:58:30] [PASSED] ttm_bo_validate_happy_evict
[17:58:30] [PASSED] ttm_bo_validate_all_pinned_evict
[17:58:30] [PASSED] ttm_bo_validate_allowed_only_evict
[17:58:30] [PASSED] ttm_bo_validate_deleted_evict
[17:58:30] [PASSED] ttm_bo_validate_busy_domain_evict
[17:58:30] [PASSED] ttm_bo_validate_evict_gutting
[17:58:30] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[17:58:30] ================= [PASSED] ttm_bo_validate =================
[17:58:30] ============================================================
[17:58:30] Testing complete. Ran 102 tests: passed: 102
[17:58:30] Elapsed time: 10.113s total, 1.679s configuring, 7.818s building, 0.528s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


