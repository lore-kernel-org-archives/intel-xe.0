Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0FBC71135
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 09:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F53210E92D;
	Fri, 13 Jun 2025 09:24:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B43210E902;
 Fri, 13 Jun 2025 09:24:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/dumb-buffers=3A_Fix_and_im?=
 =?utf-8?q?prove_buffer-size_calculation_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Jun 2025 09:24:41 -0000
Message-ID: <174980668162.75408.13635454391645025559@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250613090431.127087-1-tzimmermann@suse.de>
In-Reply-To: <20250613090431.127087-1-tzimmermann@suse.de>
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

Series: drm/dumb-buffers: Fix and improve buffer-size calculation (rev5)
URL   : https://patchwork.freedesktop.org/series/143335/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[09:23:40] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:23:44] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[09:24:11] Starting KUnit Kernel (1/1)...
[09:24:11] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[09:24:11] ================== guc_buf (11 subtests) ===================
[09:24:11] [PASSED] test_smallest
[09:24:11] [PASSED] test_largest
[09:24:11] [PASSED] test_granular
[09:24:11] [PASSED] test_unique
[09:24:11] [PASSED] test_overlap
[09:24:11] [PASSED] test_reusable
[09:24:11] [PASSED] test_too_big
[09:24:11] [PASSED] test_flush
[09:24:11] [PASSED] test_lookup
[09:24:11] [PASSED] test_data
[09:24:12] [PASSED] test_class
[09:24:12] ===================== [PASSED] guc_buf =====================
[09:24:12] =================== guc_dbm (7 subtests) ===================
[09:24:12] [PASSED] test_empty
[09:24:12] [PASSED] test_default
[09:24:12] ======================== test_size  ========================
[09:24:12] [PASSED] 4
[09:24:12] [PASSED] 8
[09:24:12] [PASSED] 32
[09:24:12] [PASSED] 256
[09:24:12] ==================== [PASSED] test_size ====================
[09:24:12] ======================= test_reuse  ========================
[09:24:12] [PASSED] 4
[09:24:12] [PASSED] 8
[09:24:12] [PASSED] 32
[09:24:12] [PASSED] 256
[09:24:12] =================== [PASSED] test_reuse ====================
[09:24:12] =================== test_range_overlap  ====================
[09:24:12] [PASSED] 4
[09:24:12] [PASSED] 8
[09:24:12] [PASSED] 32
[09:24:12] [PASSED] 256
[09:24:12] =============== [PASSED] test_range_overlap ================
[09:24:12] =================== test_range_compact  ====================
[09:24:12] [PASSED] 4
[09:24:12] [PASSED] 8
[09:24:12] [PASSED] 32
[09:24:12] [PASSED] 256
[09:24:12] =============== [PASSED] test_range_compact ================
[09:24:12] ==================== test_range_spare  =====================
[09:24:12] [PASSED] 4
[09:24:12] [PASSED] 8
[09:24:12] [PASSED] 32
[09:24:12] [PASSED] 256
[09:24:12] ================ [PASSED] test_range_spare =================
[09:24:12] ===================== [PASSED] guc_dbm =====================
[09:24:12] =================== guc_idm (6 subtests) ===================
[09:24:12] [PASSED] bad_init
[09:24:12] [PASSED] no_init
[09:24:12] [PASSED] init_fini
[09:24:12] [PASSED] check_used
[09:24:12] [PASSED] check_quota
[09:24:12] [PASSED] check_all
[09:24:12] ===================== [PASSED] guc_idm =====================
[09:24:12] ================== no_relay (3 subtests) ===================
[09:24:12] [PASSED] xe_drops_guc2pf_if_not_ready
[09:24:12] [PASSED] xe_drops_guc2vf_if_not_ready
[09:24:12] [PASSED] xe_rejects_send_if_not_ready
[09:24:12] ==================== [PASSED] no_relay =====================
[09:24:12] ================== pf_relay (14 subtests) ==================
[09:24:12] [PASSED] pf_rejects_guc2pf_too_short
[09:24:12] [PASSED] pf_rejects_guc2pf_too_long
[09:24:12] [PASSED] pf_rejects_guc2pf_no_payload
[09:24:12] [PASSED] pf_fails_no_payload
[09:24:12] [PASSED] pf_fails_bad_origin
[09:24:12] [PASSED] pf_fails_bad_type
[09:24:12] [PASSED] pf_txn_reports_error
[09:24:12] [PASSED] pf_txn_sends_pf2guc
[09:24:12] [PASSED] pf_sends_pf2guc
[09:24:12] [SKIPPED] pf_loopback_nop
[09:24:12] [SKIPPED] pf_loopback_echo
[09:24:12] [SKIPPED] pf_loopback_fail
[09:24:12] [SKIPPED] pf_loopback_busy
[09:24:12] [SKIPPED] pf_loopback_retry
[09:24:12] ==================== [PASSED] pf_relay =====================
[09:24:12] ================== vf_relay (3 subtests) ===================
[09:24:12] [PASSED] vf_rejects_guc2vf_too_short
[09:24:12] [PASSED] vf_rejects_guc2vf_too_long
[09:24:12] [PASSED] vf_rejects_guc2vf_no_payload
[09:24:12] ==================== [PASSED] vf_relay =====================
[09:24:12] ================= pf_service (11 subtests) =================
[09:24:12] [PASSED] pf_negotiate_any
[09:24:12] [PASSED] pf_negotiate_base_match
[09:24:12] [PASSED] pf_negotiate_base_newer
[09:24:12] [PASSED] pf_negotiate_base_next
[09:24:12] [SKIPPED] pf_negotiate_base_older
[09:24:12] [PASSED] pf_negotiate_base_prev
[09:24:12] [PASSED] pf_negotiate_latest_match
[09:24:12] [PASSED] pf_negotiate_latest_newer
[09:24:12] [PASSED] pf_negotiate_latest_next
[09:24:12] [SKIPPED] pf_negotiate_latest_older
[09:24:12] [SKIPPED] pf_negotiate_latest_prev
[09:24:12] =================== [PASSED] pf_service ====================
[09:24:12] ===================== lmtt (1 subtest) =====================
[09:24:12] ======================== test_ops  =========================
[09:24:12] [PASSED] 2-level
[09:24:12] [PASSED] multi-level
[09:24:12] ==================== [PASSED] test_ops =====================
[09:24:12] ====================== [PASSED] lmtt =======================
[09:24:12] =================== xe_mocs (2 subtests) ===================
[09:24:12] ================ xe_live_mocs_kernel_kunit  ================
[09:24:12] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[09:24:12] ================ xe_live_mocs_reset_kunit  =================
[09:24:12] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[09:24:12] ==================== [SKIPPED] xe_mocs =====================
[09:24:12] ================= xe_migrate (2 subtests) ==================
[09:24:12] ================= xe_migrate_sanity_kunit  =================
[09:24:12] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[09:24:12] ================== xe_validate_ccs_kunit  ==================
[09:24:12] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[09:24:12] =================== [SKIPPED] xe_migrate ===================
[09:24:12] ================== xe_dma_buf (1 subtest) ==================
[09:24:12] ==================== xe_dma_buf_kunit  =====================
[09:24:12] ================ [SKIPPED] xe_dma_buf_kunit ================
[09:24:12] =================== [SKIPPED] xe_dma_buf ===================
[09:24:12] ================= xe_bo_shrink (1 subtest) =================
[09:24:12] =================== xe_bo_shrink_kunit  ====================
[09:24:12] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[09:24:12] ================== [SKIPPED] xe_bo_shrink ==================
[09:24:12] ==================== xe_bo (2 subtests) ====================
[09:24:12] ================== xe_ccs_migrate_kunit  ===================
[09:24:12] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[09:24:12] ==================== xe_bo_evict_kunit  ====================
[09:24:12] =============== [SKIPPED] xe_bo_evict_kunit ================
[09:24:12] ===================== [SKIPPED] xe_bo ======================
[09:24:12] ==================== args (11 subtests) ====================
[09:24:12] [PASSED] count_args_test
[09:24:12] [PASSED] call_args_example
[09:24:12] [PASSED] call_args_test
[09:24:12] [PASSED] drop_first_arg_example
[09:24:12] [PASSED] drop_first_arg_test
[09:24:12] [PASSED] first_arg_example
[09:24:12] [PASSED] first_arg_test
[09:24:12] [PASSED] last_arg_example
[09:24:12] [PASSED] last_arg_test
[09:24:12] [PASSED] pick_arg_example
[09:24:12] [PASSED] sep_comma_example
[09:24:12] ====================== [PASSED] args =======================
[09:24:12] =================== xe_pci (2 subtests) ====================
[09:24:12] [PASSED] xe_gmdid_graphics_ip
[09:24:12] [PASSED] xe_gmdid_media_ip
[09:24:12] ===================== [PASSED] xe_pci ======================
[09:24:12] =================== xe_rtp (2 subtests) ====================
[09:24:12] =============== xe_rtp_process_to_sr_tests  ================
[09:24:12] [PASSED] coalesce-same-reg
[09:24:12] [PASSED] no-match-no-add
[09:24:12] [PASSED] match-or
[09:24:12] [PASSED] match-or-xfail
[09:24:12] [PASSED] no-match-no-add-multiple-rules
[09:24:12] [PASSED] two-regs-two-entries
[09:24:12] [PASSED] clr-one-set-other
[09:24:12] [PASSED] set-field
[09:24:12] [PASSED] conflict-duplicate
[09:24:12] [PASSED] conflict-not-disjoint
stty: 'standard input': Inappropriate ioctl for device
[09:24:12] [PASSED] conflict-reg-type
[09:24:12] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[09:24:12] ================== xe_rtp_process_tests  ===================
[09:24:12] [PASSED] active1
[09:24:12] [PASSED] active2
[09:24:12] [PASSED] active-inactive
[09:24:12] [PASSED] inactive-active
[09:24:12] [PASSED] inactive-1st_or_active-inactive
[09:24:12] [PASSED] inactive-2nd_or_active-inactive
[09:24:12] [PASSED] inactive-last_or_active-inactive
[09:24:12] [PASSED] inactive-no_or_active-inactive
[09:24:12] ============== [PASSED] xe_rtp_process_tests ===============
[09:24:12] ===================== [PASSED] xe_rtp ======================
[09:24:12] ==================== xe_wa (1 subtest) =====================
[09:24:12] ======================== xe_wa_gt  =========================
[09:24:12] [PASSED] TIGERLAKE (B0)
[09:24:12] [PASSED] DG1 (A0)
[09:24:12] [PASSED] DG1 (B0)
[09:24:12] [PASSED] ALDERLAKE_S (A0)
[09:24:12] [PASSED] ALDERLAKE_S (B0)
[09:24:12] [PASSED] ALDERLAKE_S (C0)
[09:24:12] [PASSED] ALDERLAKE_S (D0)
[09:24:12] [PASSED] ALDERLAKE_P (A0)
[09:24:12] [PASSED] ALDERLAKE_P (B0)
[09:24:12] [PASSED] ALDERLAKE_P (C0)
[09:24:12] [PASSED] ALDERLAKE_S_RPLS (D0)
[09:24:12] [PASSED] ALDERLAKE_P_RPLU (E0)
[09:24:12] [PASSED] DG2_G10 (C0)
[09:24:12] [PASSED] DG2_G11 (B1)
[09:24:12] [PASSED] DG2_G12 (A1)
[09:24:12] [PASSED] METEORLAKE (g:A0, m:A0)
[09:24:12] [PASSED] METEORLAKE (g:A0, m:A0)
[09:24:12] [PASSED] METEORLAKE (g:A0, m:A0)
[09:24:12] [PASSED] LUNARLAKE (g:A0, m:A0)
[09:24:12] [PASSED] LUNARLAKE (g:B0, m:A0)
[09:24:12] [PASSED] BATTLEMAGE (g:A0, m:A1)
[09:24:12] ==================== [PASSED] xe_wa_gt =====================
[09:24:12] ====================== [PASSED] xe_wa ======================
[09:24:12] ============================================================
[09:24:12] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[09:24:12] Elapsed time: 31.338s total, 4.085s configuring, 26.987s building, 0.249s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[09:24:12] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:24:13] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[09:24:35] Starting KUnit Kernel (1/1)...
[09:24:35] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[09:24:35] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[09:24:35] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[09:24:35] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[09:24:35] =========== drm_validate_clone_mode (2 subtests) ===========
[09:24:35] ============== drm_test_check_in_clone_mode  ===============
[09:24:35] [PASSED] in_clone_mode
[09:24:35] [PASSED] not_in_clone_mode
[09:24:35] ========== [PASSED] drm_test_check_in_clone_mode ===========
[09:24:35] =============== drm_test_check_valid_clones  ===============
[09:24:35] [PASSED] not_in_clone_mode
[09:24:35] [PASSED] valid_clone
[09:24:35] [PASSED] invalid_clone
[09:24:35] =========== [PASSED] drm_test_check_valid_clones ===========
[09:24:35] ============= [PASSED] drm_validate_clone_mode =============
[09:24:35] ============= drm_validate_modeset (1 subtest) =============
[09:24:35] [PASSED] drm_test_check_connector_changed_modeset
[09:24:35] ============== [PASSED] drm_validate_modeset ===============
[09:24:35] ====== drm_test_bridge_get_current_state (2 subtests) ======
[09:24:35] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[09:24:35] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[09:24:35] ======== [PASSED] drm_test_bridge_get_current_state ========
[09:24:35] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[09:24:35] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[09:24:35] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[09:24:35] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[09:24:35] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[09:24:35] ============== drm_bridge_alloc (2 subtests) ===============
[09:24:35] [PASSED] drm_test_drm_bridge_alloc_basic
[09:24:35] [PASSED] drm_test_drm_bridge_alloc_get_put
[09:24:35] ================ [PASSED] drm_bridge_alloc =================
[09:24:35] ================== drm_buddy (7 subtests) ==================
[09:24:35] [PASSED] drm_test_buddy_alloc_limit
[09:24:35] [PASSED] drm_test_buddy_alloc_optimistic
[09:24:35] [PASSED] drm_test_buddy_alloc_pessimistic
[09:24:35] [PASSED] drm_test_buddy_alloc_pathological
[09:24:35] [PASSED] drm_test_buddy_alloc_contiguous
[09:24:35] [PASSED] drm_test_buddy_alloc_clear
[09:24:35] [PASSED] drm_test_buddy_alloc_range_bias
[09:24:35] ==================== [PASSED] drm_buddy ====================
[09:24:35] ============= drm_cmdline_parser (40 subtests) =============
[09:24:35] [PASSED] drm_test_cmdline_force_d_only
[09:24:35] [PASSED] drm_test_cmdline_force_D_only_dvi
[09:24:35] [PASSED] drm_test_cmdline_force_D_only_hdmi
[09:24:35] [PASSED] drm_test_cmdline_force_D_only_not_digital
[09:24:35] [PASSED] drm_test_cmdline_force_e_only
[09:24:35] [PASSED] drm_test_cmdline_res
[09:24:35] [PASSED] drm_test_cmdline_res_vesa
[09:24:35] [PASSED] drm_test_cmdline_res_vesa_rblank
[09:24:35] [PASSED] drm_test_cmdline_res_rblank
[09:24:35] [PASSED] drm_test_cmdline_res_bpp
[09:24:35] [PASSED] drm_test_cmdline_res_refresh
[09:24:35] [PASSED] drm_test_cmdline_res_bpp_refresh
[09:24:35] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[09:24:35] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[09:24:35] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[09:24:35] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[09:24:35] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[09:24:35] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[09:24:35] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[09:24:35] [PASSED] drm_test_cmdline_res_margins_force_on
[09:24:35] [PASSED] drm_test_cmdline_res_vesa_margins
[09:24:35] [PASSED] drm_test_cmdline_name
[09:24:35] [PASSED] drm_test_cmdline_name_bpp
[09:24:35] [PASSED] drm_test_cmdline_name_option
[09:24:35] [PASSED] drm_test_cmdline_name_bpp_option
[09:24:35] [PASSED] drm_test_cmdline_rotate_0
[09:24:35] [PASSED] drm_test_cmdline_rotate_90
[09:24:35] [PASSED] drm_test_cmdline_rotate_180
[09:24:35] [PASSED] drm_test_cmdline_rotate_270
[09:24:35] [PASSED] drm_test_cmdline_hmirror
[09:24:35] [PASSED] drm_test_cmdline_vmirror
[09:24:35] [PASSED] drm_test_cmdline_margin_options
[09:24:35] [PASSED] drm_test_cmdline_multiple_options
[09:24:35] [PASSED] drm_test_cmdline_bpp_extra_and_option
[09:24:35] [PASSED] drm_test_cmdline_extra_and_option
[09:24:35] [PASSED] drm_test_cmdline_freestanding_options
[09:24:35] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[09:24:35] [PASSED] drm_test_cmdline_panel_orientation
[09:24:35] ================ drm_test_cmdline_invalid  =================
[09:24:35] [PASSED] margin_only
[09:24:35] [PASSED] interlace_only
[09:24:35] [PASSED] res_missing_x
[09:24:35] [PASSED] res_missing_y
[09:24:35] [PASSED] res_bad_y
[09:24:35] [PASSED] res_missing_y_bpp
[09:24:35] [PASSED] res_bad_bpp
[09:24:35] [PASSED] res_bad_refresh
[09:24:35] [PASSED] res_bpp_refresh_force_on_off
[09:24:35] [PASSED] res_invalid_mode
[09:24:35] [PASSED] res_bpp_wrong_place_mode
[09:24:35] [PASSED] name_bpp_refresh
[09:24:35] [PASSED] name_refresh
[09:24:35] [PASSED] name_refresh_wrong_mode
[09:24:35] [PASSED] name_refresh_invalid_mode
[09:24:35] [PASSED] rotate_multiple
[09:24:35] [PASSED] rotate_invalid_val
[09:24:35] [PASSED] rotate_truncated
[09:24:35] [PASSED] invalid_option
[09:24:35] [PASSED] invalid_tv_option
[09:24:35] [PASSED] truncated_tv_option
[09:24:35] ============ [PASSED] drm_test_cmdline_invalid =============
[09:24:35] =============== drm_test_cmdline_tv_options  ===============
[09:24:35] [PASSED] NTSC
[09:24:35] [PASSED] NTSC_443
[09:24:35] [PASSED] NTSC_J
[09:24:35] [PASSED] PAL
[09:24:35] [PASSED] PAL_M
[09:24:35] [PASSED] PAL_N
[09:24:35] [PASSED] SECAM
[09:24:35] [PASSED] MONO_525
[09:24:35] [PASSED] MONO_625
[09:24:35] =========== [PASSED] drm_test_cmdline_tv_options ===========
[09:24:35] =============== [PASSED] drm_cmdline_parser ================
[09:24:35] ========== drmm_connector_hdmi_init (20 subtests) ==========
[09:24:35] [PASSED] drm_test_connector_hdmi_init_valid
[09:24:35] [PASSED] drm_test_connector_hdmi_init_bpc_8
[09:24:35] [PASSED] drm_test_connector_hdmi_init_bpc_10
[09:24:35] [PASSED] drm_test_connector_hdmi_init_bpc_12
[09:24:35] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[09:24:35] [PASSED] drm_test_connector_hdmi_init_bpc_null
[09:24:35] [PASSED] drm_test_connector_hdmi_init_formats_empty
[09:24:35] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[09:24:35] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[09:24:35] [PASSED] supported_formats=0x9 yuv420_allowed=1
[09:24:35] [PASSED] supported_formats=0x9 yuv420_allowed=0
[09:24:35] [PASSED] supported_formats=0x3 yuv420_allowed=1
[09:24:35] [PASSED] supported_formats=0x3 yuv420_allowed=0
[09:24:35] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[09:24:35] [PASSED] drm_test_connector_hdmi_init_null_ddc
[09:24:35] [PASSED] drm_test_connector_hdmi_init_null_product
[09:24:35] [PASSED] drm_test_connector_hdmi_init_null_vendor
[09:24:35] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[09:24:35] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[09:24:35] [PASSED] drm_test_connector_hdmi_init_product_valid
[09:24:35] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[09:24:35] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[09:24:35] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[09:24:35] ========= drm_test_connector_hdmi_init_type_valid  =========
[09:24:35] [PASSED] HDMI-A
[09:24:35] [PASSED] HDMI-B
[09:24:35] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[09:24:35] ======== drm_test_connector_hdmi_init_type_invalid  ========
[09:24:35] [PASSED] Unknown
[09:24:35] [PASSED] VGA
[09:24:35] [PASSED] DVI-I
[09:24:35] [PASSED] DVI-D
[09:24:35] [PASSED] DVI-A
[09:24:35] [PASSED] Composite
[09:24:35] [PASSED] SVIDEO
[09:24:35] [PASSED] LVDS
[09:24:35] [PASSED] Component
[09:24:35] [PASSED] DIN
[09:24:35] [PASSED] DP
[09:24:35] [PASSED] TV
[09:24:35] [PASSED] eDP
[09:24:35] [PASSED] Virtual
[09:24:35] [PASSED] DSI
[09:24:35] [PASSED] DPI
[09:24:35] [PASSED] Writeback
[09:24:35] [PASSED] SPI
[09:24:35] [PASSED] USB
[09:24:35] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[09:24:35] ============ [PASSED] drmm_connector_hdmi_init =============
[09:24:35] ============= drmm_connector_init (3 subtests) =============
[09:24:35] [PASSED] drm_test_drmm_connector_init
[09:24:35] [PASSED] drm_test_drmm_connector_init_null_ddc
[09:24:35] ========= drm_test_drmm_connector_init_type_valid  =========
[09:24:35] [PASSED] Unknown
[09:24:35] [PASSED] VGA
[09:24:35] [PASSED] DVI-I
[09:24:35] [PASSED] DVI-D
[09:24:35] [PASSED] DVI-A
[09:24:35] [PASSED] Composite
[09:24:35] [PASSED] SVIDEO
[09:24:35] [PASSED] LVDS
[09:24:35] [PASSED] Component
[09:24:35] [PASSED] DIN
[09:24:35] [PASSED] DP
[09:24:35] [PASSED] HDMI-A
[09:24:35] [PASSED] HDMI-B
[09:24:35] [PASSED] TV
[09:24:35] [PASSED] eDP
[09:24:35] [PASSED] Virtual
[09:24:35] [PASSED] DSI
[09:24:35] [PASSED] DPI
[09:24:35] [PASSED] Writeback
[09:24:35] [PASSED] SPI
[09:24:35] [PASSED] USB
[09:24:35] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[09:24:35] =============== [PASSED] drmm_connector_init ===============
[09:24:35] ========= drm_connector_dynamic_init (6 subtests) ==========
[09:24:35] [PASSED] drm_test_drm_connector_dynamic_init
[09:24:35] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[09:24:35] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[09:24:35] [PASSED] drm_test_drm_connector_dynamic_init_properties
[09:24:35] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[09:24:35] [PASSED] Unknown
[09:24:35] [PASSED] VGA
[09:24:35] [PASSED] DVI-I
[09:24:35] [PASSED] DVI-D
[09:24:35] [PASSED] DVI-A
[09:24:35] [PASSED] Composite
[09:24:35] [PASSED] SVIDEO
[09:24:35] [PASSED] LVDS
[09:24:35] [PASSED] Component
[09:24:35] [PASSED] DIN
[09:24:35] [PASSED] DP
[09:24:35] [PASSED] HDMI-A
[09:24:35] [PASSED] HDMI-B
[09:24:35] [PASSED] TV
[09:24:35] [PASSED] eDP
[09:24:35] [PASSED] Virtual
[09:24:35] [PASSED] DSI
[09:24:35] [PASSED] DPI
[09:24:35] [PASSED] Writeback
[09:24:35] [PASSED] SPI
[09:24:35] [PASSED] USB
[09:24:35] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[09:24:35] ======== drm_test_drm_connector_dynamic_init_name  =========
[09:24:35] [PASSED] Unknown
[09:24:35] [PASSED] VGA
[09:24:35] [PASSED] DVI-I
[09:24:35] [PASSED] DVI-D
[09:24:35] [PASSED] DVI-A
[09:24:35] [PASSED] Composite
[09:24:35] [PASSED] SVIDEO
[09:24:35] [PASSED] LVDS
[09:24:35] [PASSED] Component
[09:24:35] [PASSED] DIN
[09:24:35] [PASSED] DP
[09:24:35] [PASSED] HDMI-A
[09:24:35] [PASSED] HDMI-B
[09:24:35] [PASSED] TV
[09:24:35] [PASSED] eDP
[09:24:35] [PASSED] Virtual
[09:24:35] [PASSED] DSI
[09:24:35] [PASSED] DPI
[09:24:35] [PASSED] Writeback
[09:24:35] [PASSED] SPI
[09:24:35] [PASSED] USB
[09:24:35] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[09:24:35] =========== [PASSED] drm_connector_dynamic_init ============
[09:24:35] ==== drm_connector_dynamic_register_early (4 subtests) =====
[09:24:35] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[09:24:35] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[09:24:35] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[09:24:35] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[09:24:35] ====== [PASSED] drm_connector_dynamic_register_early =======
[09:24:35] ======= drm_connector_dynamic_register (7 subtests) ========
[09:24:35] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[09:24:35] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[09:24:35] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[09:24:35] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[09:24:35] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[09:24:35] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[09:24:35] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[09:24:35] ========= [PASSED] drm_connector_dynamic_register ==========
[09:24:35] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[09:24:35] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[09:24:35] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[09:24:35] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[09:24:35] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[09:24:35] ========== drm_test_get_tv_mode_from_name_valid  ===========
[09:24:35] [PASSED] NTSC
[09:24:35] [PASSED] NTSC-443
[09:24:35] [PASSED] NTSC-J
[09:24:35] [PASSED] PAL
[09:24:35] [PASSED] PAL-M
[09:24:35] [PASSED] PAL-N
[09:24:35] [PASSED] SECAM
[09:24:35] [PASSED] Mono
[09:24:35] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[09:24:35] [PASSED] drm_test_get_tv_mode_from_name_truncated
[09:24:35] ============ [PASSED] drm_get_tv_mode_from_name ============
[09:24:35] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[09:24:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[09:24:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[09:24:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[09:24:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[09:24:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[09:24:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[09:24:35] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[09:24:35] [PASSED] VIC 96
[09:24:35] [PASSED] VIC 97
[09:24:35] [PASSED] VIC 101
[09:24:35] [PASSED] VIC 102
[09:24:35] [PASSED] VIC 106
[09:24:35] [PASSED] VIC 107
[09:24:35] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[09:24:35] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[09:24:35] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[09:24:35] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[09:24:35] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[09:24:35] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[09:24:35] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[09:24:35] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[09:24:35] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[09:24:35] [PASSED] Automatic
[09:24:35] [PASSED] Full
[09:24:35] [PASSED] Limited 16:235
[09:24:35] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[09:24:35] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[09:24:35] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[09:24:35] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[09:24:35] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[09:24:35] [PASSED] RGB
[09:24:35] [PASSED] YUV 4:2:0
[09:24:35] [PASSED] YUV 4:2:2
[09:24:35] [PASSED] YUV 4:4:4
[09:24:35] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[09:24:35] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[09:24:35] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[09:24:35] ============= drm_damage_helper (21 subtests) ==============
[09:24:35] [PASSED] drm_test_damage_iter_no_damage
[09:24:35] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[09:24:35] [PASSED] drm_test_damage_iter_no_damage_src_moved
[09:24:35] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[09:24:35] [PASSED] drm_test_damage_iter_no_damage_not_visible
[09:24:35] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[09:24:35] [PASSED] drm_test_damage_iter_no_damage_no_fb
[09:24:35] [PASSED] drm_test_damage_iter_simple_damage
[09:24:35] [PASSED] drm_test_damage_iter_single_damage
[09:24:35] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[09:24:35] [PASSED] drm_test_damage_iter_single_damage_outside_src
[09:24:35] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[09:24:35] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[09:24:35] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[09:24:35] [PASSED] drm_test_damage_iter_single_damage_src_moved
[09:24:35] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[09:24:35] [PASSED] drm_test_damage_iter_damage
[09:24:35] [PASSED] drm_test_damage_iter_damage_one_intersect
[09:24:35] [PASSED] drm_test_damage_iter_damage_one_outside
[09:24:35] [PASSED] drm_test_damage_iter_damage_src_moved
[09:24:35] [PASSED] drm_test_damage_iter_damage_not_visible
[09:24:35] ================ [PASSED] drm_damage_helper ================
[09:24:35] ============== drm_dp_mst_helper (3 subtests) ==============
[09:24:35] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[09:24:35] [PASSED] Clock 154000 BPP 30 DSC disabled
[09:24:35] [PASSED] Clock 234000 BPP 30 DSC disabled
[09:24:35] [PASSED] Clock 297000 BPP 24 DSC disabled
[09:24:35] [PASSED] Clock 332880 BPP 24 DSC enabled
[09:24:35] [PASSED] Clock 324540 BPP 24 DSC enabled
[09:24:35] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[09:24:35] ============== drm_test_dp_mst_calc_pbn_div  ===============
[09:24:35] [PASSED] Link rate 2000000 lane count 4
[09:24:35] [PASSED] Link rate 2000000 lane count 2
[09:24:35] [PASSED] Link rate 2000000 lane count 1
[09:24:35] [PASSED] Link rate 1350000 lane count 4
[09:24:35] [PASSED] Link rate 1350000 lane count 2
[09:24:35] [PASSED] Link rate 1350000 lane count 1
[09:24:35] [PASSED] Link rate 1000000 lane count 4
[09:24:35] [PASSED] Link rate 1000000 lane count 2
[09:24:35] [PASSED] Link rate 1000000 lane count 1
[09:24:35] [PASSED] Link rate 810000 lane count 4
[09:24:35] [PASSED] Link rate 810000 lane count 2
[09:24:35] [PASSED] Link rate 810000 lane count 1
[09:24:35] [PASSED] Link rate 540000 lane count 4
[09:24:35] [PASSED] Link rate 540000 lane count 2
[09:24:35] [PASSED] Link rate 540000 lane count 1
[09:24:35] [PASSED] Link rate 270000 lane count 4
[09:24:35] [PASSED] Link rate 270000 lane count 2
[09:24:35] [PASSED] Link rate 270000 lane count 1
[09:24:35] [PASSED] Link rate 162000 lane count 4
[09:24:35] [PASSED] Link rate 162000 lane count 2
[09:24:35] [PASSED] Link rate 162000 lane count 1
[09:24:35] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[09:24:35] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[09:24:35] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[09:24:35] [PASSED] DP_POWER_UP_PHY with port number
[09:24:35] [PASSED] DP_POWER_DOWN_PHY with port number
[09:24:35] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[09:24:35] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[09:24:35] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[09:24:35] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[09:24:35] [PASSED] DP_QUERY_PAYLOAD with port number
[09:24:35] [PASSED] DP_QUERY_PAYLOAD with VCPI
[09:24:35] [PASSED] DP_REMOTE_DPCD_READ with port number
[09:24:35] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[09:24:35] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[09:24:35] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[09:24:35] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[09:24:35] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[09:24:35] [PASSED] DP_REMOTE_I2C_READ with port number
[09:24:35] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[09:24:35] [PASSED] DP_REMOTE_I2C_READ with transactions array
[09:24:35] [PASSED] DP_REMOTE_I2C_WRITE with port number
[09:24:35] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[09:24:35] [PASSED] DP_REMOTE_I2C_WRITE with data array
[09:24:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[09:24:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[09:24:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[09:24:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[09:24:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[09:24:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[09:24:35] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[09:24:35] ================ [PASSED] drm_dp_mst_helper ================
[09:24:35] ================== drm_exec (7 subtests) ===================
[09:24:35] [PASSED] sanitycheck
[09:24:35] [PASSED] test_lock
[09:24:35] [PASSED] test_lock_unlock
[09:24:35] [PASSED] test_duplicates
[09:24:35] [PASSED] test_prepare
[09:24:35] [PASSED] test_prepare_array
[09:24:35] [PASSED] test_multiple_loops
[09:24:35] ==================== [PASSED] drm_exec =====================
[09:24:35] =========== drm_format_helper_test (18 subtests) ===========
[09:24:35] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[09:24:35] [PASSED] single_pixel_source_buffer
[09:24:35] [PASSED] single_pixel_clip_rectangle
[09:24:35] # drm_test_fb_xrgb8888_to_gray8: EXPECTATION FAILED at drivers/gpu/drm/tests/drm_format_helper_test.c:672
[09:24:35] Expected buf == result->expected, but
[09:24:35]     buf ==
[09:24:35]      ff  00  4c <95><1c><69><e2> b2
[09:24:35]     result->expected ==
[09:24:35]      ff  00  4c <99><19><66><e5> b2
[09:24:35] [FAILED] well_known_colors
[09:24:35] # drm_test_fb_xrgb8888_to_gray8: EXPECTATION FAILED at drivers/gpu/drm/tests/drm_format_helper_test.c:672
[09:24:35] Expected buf == result->expected, but
[09:24:35]     buf ==
[09:24:35]     <3d><32><c1> 00  00 <ba><3d><32> 00  00  34 <ba><3d> 00  00
[09:24:35]     result->expected ==
[09:24:35]     <3c><33><c4> 00  00 <bb><3c><33> 00  00  34 <bb><3c> 00  00
[09:24:35] [FAILED] destination_pitch
[09:24:35] # drm_test_fb_xrgb8888_to_gray8: pass:2 fail:2 skip:0 total:4
[09:24:35] ========== [FAILED] drm_test_fb_xrgb8888_to_gray8 ==========
[09:24:35] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[09:24:35] [PASSED] single_pixel_source_buffer
[09:24:35] [PASSED] single_pixel_clip_rectangle
[09:24:35] [PASSED] well_known_colors
[09:24:35] [PASSED] destination_pitch
[09:24:35] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[09:24:35] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[09:24:35] [PASSED] single_pixel_source_buffer
[09:24:35] [PASSED] single_pixel_clip_rectangle
[09:24:35] [PASSED] well_known_colors
[09:24:35] [PASSED] destination_pitch
[09:24:35] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[09:24:35] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[09:24:35] [PASSED] single_pixel_source_buffer
[09:24:35] [PASSED] single_pixel_clip_rectangle
[09:24:35] [PASSED] well_known_colors
[09:24:35] [PASSED] destination_pitch
[09:24:35] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[09:24:35] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[09:24:35] [PASSED] single_pixel_source_buffer
[09:24:35] [PASSED] single_pixel_clip_rectangle
[09:24:35] [PASSED] well_known_colors
[09:24:35] [PASSED] destination_pitch
[09:24:35] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[09:24:35] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[09:24:35] [PASSED] single_pixel_source_buffer
[09:24:35] [PASSED] single_pixel_clip_rectangle
[09:24:35] [PASSED] well_known_colors
[09:24:35] [PASSED] destination_pitch
[09:24:35] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[09:24:35] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[09:24:35] [PASSED] single_pixel_source_buffer
[09:24:35] [PASSED] single_pixel_clip_rectangle
[09:24:35] [PASSED] well_known_colors
[09:24:35] [PASSED] destination_pitch
[09:24:35] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[09:24:35] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[09:24:35] [PASSED] single_pixel_source_buffer
[09:24:35] [PASSED] single_pixel_clip_rectangle
[09:24:35] [PASSED] well_known_colors
[09:24:35] [PASSED] destination_pitch
[09:24:35] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[09:24:35] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[09:24:35] [PASSED] single_pixel_source_buffer
[09:24:35] [PASSED] single_pixel_clip_rectangle
[09:24:35] [PASSED] well_known_colors
[09:24:35] [PASSED] destination_pitch
[09:24:35] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[09:24:35] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[09:24:35] [PASSED] single_pixel_source_buffer
[09:24:35] [PASSED] single_pixel_clip_rectangle
[09:24:35] [PASSED] well_known_colors
[09:24:35] [PASSED] destination_pitch
[09:24:35] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[09:24:35] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[09:24:35] [PASSED] single_pixel_source_buffer
[09:24:35] [PASSED] single_pixel_clip_rectangle
[09:24:35] [PASSED] well_known_colors
[09:24:35] [PASSED] destination_pitch
[09:24:35] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[09:24:35] ============== drm_test_fb_xrgb8888_to_mono  ===============
[09:24:35] [PASSED] single_pixel_source_buffer
[09:24:35] [PASSED] single_pixel_clip_rectangle
[09:24:35] [PASSED] well_known_colors
[09:24:35] [PASSED] destination_pitch
[09:24:35] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[09:24:35] ==================== drm_test_fb_swab  =====================
[09:24:35] [PASSED] single_pixel_source_buffer
[09:24:35] [PASSED] single_pixel_clip_rectangle
[09:24:35] [PASSED] well_known_colors
[09:24:35] [PASSED] destination_pitch
[09:24:35] ================ [PASSED] drm_test_fb_swab =================
[09:24:35] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[09:24:35] [PASSED] single_pixel_source_buffer
[09:24:35] [PASSED] single_pixel_clip_rectangle
[09:24:35] [PASSED] well_known_colors
[09:24:35] [PASSED] destination_pitch
[09:24:35] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[09:24:35] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[09:24:35] [PASSED] single_pixel_source_buffer
[09:24:35] [PASSED] single_pixel_clip_rectangle
[09:24:35] [PASSED] well_known_colors
[09:24:35] [PASSED] destination_pitch
[09:24:35] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[09:24:35] ================= drm_test_fb_clip_offset  =================
[09:24:35] [PASSED] pass through
[09:24:35] [PASSED] horizontal offset
[09:24:35] [PASSED] vertical offset
[09:24:35] [PASSED] horizontal and vertical offset
[09:24:35] [PASSED] horizontal offset (custom pitch)
[09:24:35] [PASSED] vertical offset (custom pitch)
[09:24:35] [PASSED] horizontal and vertical offset (custom pitch)
[09:24:35] ============= [PASSED] drm_test_fb_clip_offset =============
[09:24:35] ============== drm_test_fb_build_fourcc_list  ==============
[09:24:35] [PASSED] no native formats
[09:24:35] [PASSED] XRGB8888 as native format
[09:24:35] [PASSED] remove duplicates
[09:24:35] [PASSED] convert alpha formats
[09:24:35] [PASSED] random formats
[09:24:35] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[09:24:35] =================== drm_test_fb_memcpy  ====================
[09:24:35] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[09:24:35] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[09:24:35] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[09:24:35] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[09:24:35] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[09:24:35] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[09:24:35] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[09:24:35] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[09:24:35] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[09:24:35] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[09:24:35] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[09:24:35] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[09:24:35] =============== [PASSED] drm_test_fb_memcpy ================
[09:24:35]     # module: drm_format_helper_test
[09:24:35] # drm_format_helper_test: pass:17 fail:1 skip:0 total:18
[09:24:35] # Totals: pass:82 fail:2 skip:0 total:84
[09:24:35] ============= [FAILED] drm_format_helper_test ==============
[09:24:35] ================= drm_format (18 subtests) =================
[09:24:35] [PASSED] drm_test_format_block_width_invalid
[09:24:35] [PASSED] drm_test_format_block_width_one_plane
[09:24:35] [PASSED] drm_test_format_block_width_two_plane
[09:24:35] [PASSED] drm_test_format_block_width_three_plane
[09:24:35] [PASSED] drm_test_format_block_width_tiled
[09:24:35] [PASSED] drm_test_format_block_height_invalid
[09:24:35] [PASSED] drm_test_format_block_height_one_plane
[09:24:35] [PASSED] drm_test_format_block_height_two_plane
[09:24:35] [PASSED] drm_test_format_block_height_three_plane
[09:24:35] [PASSED] drm_test_format_block_height_tiled
[09:24:35] [PASSED] drm_test_format_min_pitch_invalid
[09:24:35] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[09:24:35] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[09:24:35] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[09:24:35] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[09:24:35] [PASSED] drm_test_format_min_pitch_two_plane
[09:24:35] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[09:24:35] [PASSED] drm_test_format_min_pitch_tiled
[09:24:35] =================== [PASSED] drm_format ====================
[09:24:35] ============== drm_framebuffer (10 subtests) ===============
[09:24:35] ========== drm_test_framebuffer_check_src_coords  ==========
[09:24:35] [PASSED] Success: source fits into fb
[09:24:35] [PASSED] Fail: overflowing fb with x-axis coordinate
[09:24:35] [PASSED] Fail: overflowing fb with y-axis coordinate
[09:24:35] [PASSED] Fail: overflowing fb with source width
[09:24:35] [PASSED] Fail: overflowing fb with source height
[09:24:35] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[09:24:35] [PASSED] drm_test_framebuffer_cleanup
[09:24:35] =============== drm_test_framebuffer_create  ===============
[09:24:35] [PASSED] ABGR8888 normal sizes
[09:24:35] [PASSED] ABGR8888 max sizes
[09:24:35] [PASSED] ABGR8888 pitch greater than min required
[09:24:35] [PASSED] ABGR8888 pitch less than min required
[09:24:35] [PASSED] ABGR8888 Invalid width
[09:24:35] [PASSED] ABGR8888 Invalid buffer handle
[09:24:35] [PASSED] No pixel format
[09:24:35] [PASSED] ABGR8888 Width 0
[09:24:35] [PASSED] ABGR8888 Height 0
[09:24:35] [PASSED] ABGR8888 Out of bound height * pitch combination
[09:24:35] [PASSED] ABGR8888 Large buffer offset
[09:24:35] [PASSED] ABGR8888 Buffer offset for inexistent plane
[09:24:35] [PASSED] ABGR8888 Invalid flag
[09:24:35] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[09:24:35] [PASSED] ABGR8888 Valid buffer modifier
[09:24:35] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[09:24:35] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[09:24:35] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[09:24:35] [PASSED] NV12 Normal sizes
[09:24:35] [PASSED] NV12 Max sizes
[09:24:35] [PASSED] NV12 Invalid pitch
[09:24:35] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[09:24:35] [PASSED] NV12 different  modifier per-plane
[09:24:35] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[09:24:35] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[09:24:35] [PASSED] NV12 Modifier for inexistent plane
[09:24:35] [PASSED] NV12 Handle for inexistent plane
[09:24:35] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[09:24:35] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[09:24:35] [PASSED] YVU420 Normal sizes
[09:24:35] [PASSED] YVU420 Max sizes
[09:24:35] [PASSED] YVU420 Invalid pitch
[09:24:35] [PASSED] YVU420 Different pitches
[09:24:35] [PASSED] YVU420 Different buffer offsets/pitches
[09:24:35] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[09:24:35] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[09:24:35] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[09:24:35] [PASSED] YVU420 Valid modifier
[09:24:35] [PASSED] YVU420 Different modifiers per plane
[09:24:35] [PASSED] YVU420 Modifier for inexistent plane
[09:24:35] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[09:24:35] [PASSED] X0L2 Normal sizes
[09:24:35] [PASSED] X0L2 Max sizes
[09:24:35] [PASSED] X0L2 Invalid pitch
[09:24:35] [PASSED] X0L2 Pitch greater than minimum required
[09:24:35] [PASSED] X0L2 Handle for inexistent plane
[09:24:35] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[09:24:35] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[09:24:35] [PASSED] X0L2 Valid modifier
[09:24:35] [PASSED] X0L2 Modifier for inexistent plane
[09:24:35] =========== [PASSED] drm_test_framebuffer_create ===========
[09:24:35] [PASSED] drm_test_framebuffer_free
[09:24:35] [PASSED] drm_test_framebuffer_init
[09:24:35] [PASSED] drm_test_framebuffer_init_bad_format
[09:24:35] [PASSED] drm_test_framebuffer_init_dev_mismatch
[09:24:35] [PASSED] drm_test_framebuffer_lookup
[09:24:35] [PASSED] drm_test_framebuffer_lookup_inexistent
[09:24:35] [PASSED] drm_test_framebuffer_modifiers_not_supported
[09:24:35] ================= [PASSED] drm_framebuffer =================
[09:24:35] ================ drm_gem_shmem (8 subtests) ================
[09:24:35] [PASSED] drm_gem_shmem_test_obj_create
[09:24:35] [PASSED] drm_gem_shmem_test_obj_create_private
[09:24:35] [PASSED] drm_gem_shmem_test_pin_pages
[09:24:35] [PASSED] drm_gem_shmem_test_vmap
[09:24:35] [PASSED] drm_gem_shmem_test_get_pages_sgt
[09:24:35] [PASSED] drm_gem_shmem_test_get_sg_table
[09:24:35] [PASSED] drm_gem_shmem_test_madvise
[09:24:35] [PASSED] drm_gem_shmem_test_purge
[09:24:35] ================== [PASSED] drm_gem_shmem ==================
[09:24:35] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[09:24:35] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[09:24:35] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[09:24:35] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[09:24:35] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[09:24:35] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[09:24:35] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[09:24:35] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[09:24:35] [PASSED] Automatic
[09:24:35] [PASSED] Full
[09:24:35] [PASSED] Limited 16:235
[09:24:35] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[09:24:35] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[09:24:35] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[09:24:35] [PASSED] drm_test_check_disable_connector
[09:24:35] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[09:24:35] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[09:24:35] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[09:24:35] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[09:24:35] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[09:24:35] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[09:24:35] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[09:24:35] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[09:24:35] [PASSED] drm_test_check_output_bpc_dvi
[09:24:35] [PASSED] drm_test_check_output_bpc_format_vic_1
[09:24:35] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[09:24:35] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[09:24:35] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[09:24:35] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[09:24:35] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[09:24:35] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[09:24:35] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[09:24:35] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[09:24:35] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[09:24:35] [PASSED] drm_test_check_broadcast_rgb_value
[09:24:35] [PASSED] drm_test_check_bpc_8_value
[09:24:35] [PASSED] drm_test_check_bpc_10_value
[09:24:35] [PASSED] drm_test_check_bpc_12_value
[09:24:35] [PASSED] drm_test_check_format_value
[09:24:35] [PASSED] drm_test_check_tmds_char_value
[09:24:35] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[09:24:35] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[09:24:35] [PASSED] drm_test_check_mode_valid
[09:24:35] [PASSED] drm_test_check_mode_valid_reject
[09:24:35] [PASSED] drm_test_check_mode_valid_reject_rate
[09:24:35] [PASSED] drm_test_check_mode_valid_reject_max_clock
[09:24:35] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[09:24:35] ================= drm_managed (2 subtests) =================
[09:24:35] [PASSED] drm_test_managed_release_action
[09:24:35] [PASSED] drm_test_managed_run_action
[09:24:35] =================== [PASSED] drm_managed ===================
[09:24:35] =================== drm_mm (6 subtests) ====================
[09:24:35] [PASSED] drm_test_mm_init
[09:24:35] [PASSED] drm_test_mm_debug
[09:24:35] [PASSED] drm_test_mm_align32
[09:24:35] [PASSED] drm_test_mm_align64
[09:24:35] [PASSED] drm_test_mm_lowest
[09:24:35] [PASSED] drm_test_mm_highest
[09:24:35] ===================== [PASSED] drm_mm ======================
[09:24:35] ============= drm_modes_analog_tv (5 subtests) =============
[09:24:35] [PASSED] drm_test_modes_analog_tv_mono_576i
[09:24:35] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[09:24:35] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[09:24:35] [PASSED] drm_test_modes_analog_tv_pal_576i
[09:24:35] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[09:24:35] =============== [PASSED] drm_modes_analog_tv ===============
[09:24:35] ============== drm_plane_helper (2 subtests) ===============
[09:24:35] =============== drm_test_check_plane_state  ================
[09:24:35] [PASSED] clipping_simple
[09:24:35] [PASSED] clipping_rotate_reflect
[09:24:35] [PASSED] positioning_simple
[09:24:35] [PASSED] upscaling
[09:24:35] [PASSED] downscaling
[09:24:35] [PASSED] rounding1
[09:24:35] [PASSED] rounding2
[09:24:35] [PASSED] rounding3
[09:24:35] [PASSED] rounding4
[09:24:35] =========== [PASSED] drm_test_check_plane_state ============
[09:24:35] =========== drm_test_check_invalid_plane_state  ============
[09:24:35] [PASSED] positioning_invalid
[09:24:35] [PASSED] upscaling_invalid
[09:24:35] [PASSED] downscaling_invalid
[09:24:35] ======= [PASSED] drm_test_check_invalid_plane_state ========
[09:24:35] ================ [PASSED] drm_plane_helper =================
[09:24:35] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[09:24:35] ====== drm_test_connector_helper_tv_get_modes_check  =======
[09:24:35] [PASSED] None
[09:24:35] [PASSED] PAL
[09:24:35] [PASSED] NTSC
[09:24:35] [PASSED] Both, NTSC Default
[09:24:35] [PASSED] Both, PAL Default
[09:24:35] [PASSED] Both, NTSC Default, with PAL on command-line
[09:24:35] [PASSED] Both, PAL Default, with NTSC on command-line
[09:24:35] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[09:24:35] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[09:24:35] ================== drm_rect (9 subtests) ===================
[09:24:35] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[09:24:35] [PASSED] drm_test_rect_clip_scaled_not_clipped
[09:24:35] [PASSED] drm_test_rect_clip_scaled_clipped
[09:24:35] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[09:24:35] ================= drm_test_rect_intersect  =================
[09:24:35] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[09:24:35] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[09:24:35] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[09:24:35] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[09:24:35] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[09:24:35] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[09:24:35] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[09:24:35] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[09:24:35] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[09:24:35] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[09:24:35] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[09:24:35] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
stty: 'standard input': Inappropriate ioctl for device
[09:24:35] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[09:24:35] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[09:24:35] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[09:24:35] ============= [PASSED] drm_test_rect_intersect =============
[09:24:35] ================ drm_test_rect_calc_hscale  ================
[09:24:35] [PASSED] normal use
[09:24:35] [PASSED] out of max range
[09:24:35] [PASSED] out of min range
[09:24:35] [PASSED] zero dst
[09:24:35] [PASSED] negative src
[09:24:35] [PASSED] negative dst
[09:24:35] ============ [PASSED] drm_test_rect_calc_hscale ============
[09:24:35] ================ drm_test_rect_calc_vscale  ================
[09:24:35] [PASSED] normal use
[09:24:35] [PASSED] out of max range
[09:24:35] [PASSED] out of min range
[09:24:35] [PASSED] zero dst
[09:24:35] [PASSED] negative src
[09:24:35] [PASSED] negative dst
[09:24:35] ============ [PASSED] drm_test_rect_calc_vscale ============
[09:24:35] ================== drm_test_rect_rotate  ===================
[09:24:35] [PASSED] reflect-x
[09:24:35] [PASSED] reflect-y
[09:24:35] [PASSED] rotate-0
[09:24:35] [PASSED] rotate-90
[09:24:35] [PASSED] rotate-180
[09:24:35] [PASSED] rotate-270
[09:24:35] ============== [PASSED] drm_test_rect_rotate ===============
[09:24:35] ================ drm_test_rect_rotate_inv  =================
[09:24:35] [PASSED] reflect-x
[09:24:35] [PASSED] reflect-y
[09:24:35] [PASSED] rotate-0
[09:24:35] [PASSED] rotate-90
[09:24:35] [PASSED] rotate-180
[09:24:35] [PASSED] rotate-270
[09:24:35] ============ [PASSED] drm_test_rect_rotate_inv =============
[09:24:35] ==================== [PASSED] drm_rect =====================
[09:24:35] ============================================================
[09:24:35] Testing complete. Ran 616 tests: passed: 614, failed: 2
[09:24:35] Failures: drm_format_helper_test.drm_test_fb_xrgb8888_to_gray8.well_known_colors, drm_format_helper_test.drm_test_fb_xrgb8888_to_gray8.destination_pitch
[09:24:35] Elapsed time: 23.483s total, 1.642s configuring, 21.671s building, 0.148s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


