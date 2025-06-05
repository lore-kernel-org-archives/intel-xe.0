Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EEAC5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 05:23:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CABF10E25F;
	Thu,  5 Jun 2025 05:23:39 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51C610E25F;
 Thu,  5 Jun 2025 05:23:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/hwmon=3A_Fix_xe=5Fhwmon?=
 =?utf-8?q?=5Fpower=5Fmax=5Fwrite_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 05:23:37 -0000
Message-ID: <174910101779.50766.10451750255962258099@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250604020520.2627638-1-karthik.poosa@intel.com>
In-Reply-To: <20250604020520.2627638-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Fix xe_hwmon_power_max_write (rev2)
URL   : https://patchwork.freedesktop.org/series/149816/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[05:21:55] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:21:59] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[05:22:30] Starting KUnit Kernel (1/1)...
[05:22:30] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:22:30] ================== guc_buf (11 subtests) ===================
[05:22:30] [PASSED] test_smallest
[05:22:30] [PASSED] test_largest
[05:22:30] [PASSED] test_granular
[05:22:30] [PASSED] test_unique
[05:22:30] [PASSED] test_overlap
[05:22:30] [PASSED] test_reusable
[05:22:30] [PASSED] test_too_big
[05:22:30] [PASSED] test_flush
[05:22:30] [PASSED] test_lookup
[05:22:30] [PASSED] test_data
[05:22:30] [PASSED] test_class
[05:22:30] ===================== [PASSED] guc_buf =====================
[05:22:30] =================== guc_dbm (7 subtests) ===================
[05:22:30] [PASSED] test_empty
[05:22:30] [PASSED] test_default
[05:22:30] ======================== test_size  ========================
[05:22:30] [PASSED] 4
[05:22:30] [PASSED] 8
[05:22:30] [PASSED] 32
[05:22:30] [PASSED] 256
[05:22:30] ==================== [PASSED] test_size ====================
[05:22:30] ======================= test_reuse  ========================
[05:22:30] [PASSED] 4
[05:22:30] [PASSED] 8
[05:22:30] [PASSED] 32
[05:22:30] [PASSED] 256
[05:22:30] =================== [PASSED] test_reuse ====================
[05:22:30] =================== test_range_overlap  ====================
[05:22:30] [PASSED] 4
[05:22:30] [PASSED] 8
[05:22:30] [PASSED] 32
[05:22:30] [PASSED] 256
[05:22:30] =============== [PASSED] test_range_overlap ================
[05:22:30] =================== test_range_compact  ====================
[05:22:30] [PASSED] 4
[05:22:30] [PASSED] 8
[05:22:30] [PASSED] 32
[05:22:30] [PASSED] 256
[05:22:30] =============== [PASSED] test_range_compact ================
[05:22:30] ==================== test_range_spare  =====================
[05:22:30] [PASSED] 4
[05:22:30] [PASSED] 8
[05:22:30] [PASSED] 32
[05:22:30] [PASSED] 256
[05:22:30] ================ [PASSED] test_range_spare =================
[05:22:30] ===================== [PASSED] guc_dbm =====================
[05:22:30] =================== guc_idm (6 subtests) ===================
[05:22:30] [PASSED] bad_init
[05:22:30] [PASSED] no_init
[05:22:30] [PASSED] init_fini
[05:22:30] [PASSED] check_used
[05:22:30] [PASSED] check_quota
[05:22:30] [PASSED] check_all
[05:22:30] ===================== [PASSED] guc_idm =====================
[05:22:30] ================== no_relay (3 subtests) ===================
[05:22:30] [PASSED] xe_drops_guc2pf_if_not_ready
[05:22:30] [PASSED] xe_drops_guc2vf_if_not_ready
[05:22:30] [PASSED] xe_rejects_send_if_not_ready
[05:22:30] ==================== [PASSED] no_relay =====================
[05:22:30] ================== pf_relay (14 subtests) ==================
[05:22:30] [PASSED] pf_rejects_guc2pf_too_short
[05:22:30] [PASSED] pf_rejects_guc2pf_too_long
[05:22:30] [PASSED] pf_rejects_guc2pf_no_payload
[05:22:30] [PASSED] pf_fails_no_payload
[05:22:30] [PASSED] pf_fails_bad_origin
[05:22:30] [PASSED] pf_fails_bad_type
[05:22:30] [PASSED] pf_txn_reports_error
[05:22:30] [PASSED] pf_txn_sends_pf2guc
[05:22:30] [PASSED] pf_sends_pf2guc
[05:22:30] [SKIPPED] pf_loopback_nop
[05:22:30] [SKIPPED] pf_loopback_echo
[05:22:30] [SKIPPED] pf_loopback_fail
[05:22:30] [SKIPPED] pf_loopback_busy
[05:22:30] [SKIPPED] pf_loopback_retry
[05:22:30] ==================== [PASSED] pf_relay =====================
[05:22:30] ================== vf_relay (3 subtests) ===================
[05:22:30] [PASSED] vf_rejects_guc2vf_too_short
[05:22:30] [PASSED] vf_rejects_guc2vf_too_long
[05:22:30] [PASSED] vf_rejects_guc2vf_no_payload
[05:22:30] ==================== [PASSED] vf_relay =====================
[05:22:30] ================= pf_service (11 subtests) =================
[05:22:30] [PASSED] pf_negotiate_any
[05:22:30] [PASSED] pf_negotiate_base_match
[05:22:30] [PASSED] pf_negotiate_base_newer
[05:22:30] [PASSED] pf_negotiate_base_next
[05:22:30] [SKIPPED] pf_negotiate_base_older
[05:22:30] [PASSED] pf_negotiate_base_prev
[05:22:30] [PASSED] pf_negotiate_latest_match
[05:22:30] [PASSED] pf_negotiate_latest_newer
[05:22:30] [PASSED] pf_negotiate_latest_next
[05:22:30] [SKIPPED] pf_negotiate_latest_older
[05:22:30] [SKIPPED] pf_negotiate_latest_prev
[05:22:30] =================== [PASSED] pf_service ====================
[05:22:30] ===================== lmtt (1 subtest) =====================
[05:22:30] ======================== test_ops  =========================
[05:22:30] [PASSED] 2-level
[05:22:30] [PASSED] multi-level
[05:22:30] ==================== [PASSED] test_ops =====================
[05:22:30] ====================== [PASSED] lmtt =======================
[05:22:30] =================== xe_mocs (2 subtests) ===================
[05:22:30] ================ xe_live_mocs_kernel_kunit  ================
[05:22:30] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[05:22:30] ================ xe_live_mocs_reset_kunit  =================
[05:22:30] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[05:22:30] ==================== [SKIPPED] xe_mocs =====================
[05:22:30] ================= xe_migrate (2 subtests) ==================
[05:22:30] ================= xe_migrate_sanity_kunit  =================
[05:22:30] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[05:22:30] ================== xe_validate_ccs_kunit  ==================
[05:22:30] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[05:22:30] =================== [SKIPPED] xe_migrate ===================
[05:22:30] ================== xe_dma_buf (1 subtest) ==================
[05:22:30] ==================== xe_dma_buf_kunit  =====================
[05:22:30] ================ [SKIPPED] xe_dma_buf_kunit ================
[05:22:30] =================== [SKIPPED] xe_dma_buf ===================
[05:22:30] ================= xe_bo_shrink (1 subtest) =================
[05:22:30] =================== xe_bo_shrink_kunit  ====================
[05:22:30] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[05:22:30] ================== [SKIPPED] xe_bo_shrink ==================
[05:22:30] ==================== xe_bo (2 subtests) ====================
[05:22:30] ================== xe_ccs_migrate_kunit  ===================
[05:22:30] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[05:22:30] ==================== xe_bo_evict_kunit  ====================
[05:22:30] =============== [SKIPPED] xe_bo_evict_kunit ================
[05:22:30] ===================== [SKIPPED] xe_bo ======================
[05:22:30] ==================== args (11 subtests) ====================
[05:22:30] [PASSED] count_args_test
[05:22:30] [PASSED] call_args_example
[05:22:30] [PASSED] call_args_test
[05:22:30] [PASSED] drop_first_arg_example
[05:22:30] [PASSED] drop_first_arg_test
[05:22:30] [PASSED] first_arg_example
[05:22:30] [PASSED] first_arg_test
[05:22:30] [PASSED] last_arg_example
[05:22:30] [PASSED] last_arg_test
[05:22:30] [PASSED] pick_arg_example
[05:22:30] [PASSED] sep_comma_example
[05:22:30] ====================== [PASSED] args =======================
[05:22:30] =================== xe_pci (2 subtests) ====================
[05:22:30] [PASSED] xe_gmdid_graphics_ip
[05:22:30] [PASSED] xe_gmdid_media_ip
[05:22:30] ===================== [PASSED] xe_pci ======================
[05:22:30] =================== xe_rtp (2 subtests) ====================
[05:22:30] =============== xe_rtp_process_to_sr_tests  ================
[05:22:30] [PASSED] coalesce-same-reg
[05:22:30] [PASSED] no-match-no-add
[05:22:30] [PASSED] match-or
[05:22:30] [PASSED] match-or-xfail
[05:22:30] [PASSED] no-match-no-add-multiple-rules
[05:22:30] [PASSED] two-regs-two-entries
[05:22:30] [PASSED] clr-one-set-other
[05:22:30] [PASSED] set-field
[05:22:30] [PASSED] conflict-duplicate
[05:22:30] [PASSED] conflict-not-disjoint
stty: 'standard input': Inappropriate ioctl for device
[05:22:30] [PASSED] conflict-reg-type
[05:22:30] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[05:22:30] ================== xe_rtp_process_tests  ===================
[05:22:30] [PASSED] active1
[05:22:30] [PASSED] active2
[05:22:30] [PASSED] active-inactive
[05:22:30] [PASSED] inactive-active
[05:22:30] [PASSED] inactive-1st_or_active-inactive
[05:22:30] [PASSED] inactive-2nd_or_active-inactive
[05:22:30] [PASSED] inactive-last_or_active-inactive
[05:22:30] [PASSED] inactive-no_or_active-inactive
[05:22:30] ============== [PASSED] xe_rtp_process_tests ===============
[05:22:30] ===================== [PASSED] xe_rtp ======================
[05:22:30] ==================== xe_wa (1 subtest) =====================
[05:22:30] ======================== xe_wa_gt  =========================
[05:22:30] [PASSED] TIGERLAKE (B0)
[05:22:30] [PASSED] DG1 (A0)
[05:22:30] [PASSED] DG1 (B0)
[05:22:30] [PASSED] ALDERLAKE_S (A0)
[05:22:30] [PASSED] ALDERLAKE_S (B0)
[05:22:30] [PASSED] ALDERLAKE_S (C0)
[05:22:30] [PASSED] ALDERLAKE_S (D0)
[05:22:30] [PASSED] ALDERLAKE_P (A0)
[05:22:30] [PASSED] ALDERLAKE_P (B0)
[05:22:30] [PASSED] ALDERLAKE_P (C0)
[05:22:30] [PASSED] ALDERLAKE_S_RPLS (D0)
[05:22:30] [PASSED] ALDERLAKE_P_RPLU (E0)
[05:22:30] [PASSED] DG2_G10 (C0)
[05:22:30] [PASSED] DG2_G11 (B1)
[05:22:30] [PASSED] DG2_G12 (A1)
[05:22:30] [PASSED] METEORLAKE (g:A0, m:A0)
[05:22:30] [PASSED] METEORLAKE (g:A0, m:A0)
[05:22:30] [PASSED] METEORLAKE (g:A0, m:A0)
[05:22:30] [PASSED] LUNARLAKE (g:A0, m:A0)
[05:22:30] [PASSED] LUNARLAKE (g:B0, m:A0)
[05:22:30] [PASSED] BATTLEMAGE (g:A0, m:A1)
[05:22:30] ==================== [PASSED] xe_wa_gt =====================
[05:22:30] ====================== [PASSED] xe_wa ======================
[05:22:30] ============================================================
[05:22:30] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[05:22:30] Elapsed time: 35.855s total, 4.162s configuring, 31.222s building, 0.429s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[05:22:31] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:22:33] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[05:23:18] Starting KUnit Kernel (1/1)...
[05:23:18] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:23:18] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[05:23:18] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[05:23:18] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[05:23:18] =========== drm_validate_clone_mode (2 subtests) ===========
[05:23:18] ============== drm_test_check_in_clone_mode  ===============
[05:23:18] [PASSED] in_clone_mode
[05:23:18] [PASSED] not_in_clone_mode
[05:23:18] ========== [PASSED] drm_test_check_in_clone_mode ===========
[05:23:18] =============== drm_test_check_valid_clones  ===============
[05:23:18] [PASSED] not_in_clone_mode
[05:23:18] [PASSED] valid_clone
[05:23:18] [PASSED] invalid_clone
[05:23:18] =========== [PASSED] drm_test_check_valid_clones ===========
[05:23:18] ============= [PASSED] drm_validate_clone_mode =============
[05:23:18] ============= drm_validate_modeset (1 subtest) =============
[05:23:18] [PASSED] drm_test_check_connector_changed_modeset
[05:23:18] ============== [PASSED] drm_validate_modeset ===============
[05:23:18] ====== drm_test_bridge_get_current_state (2 subtests) ======
[05:23:18] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[05:23:18] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[05:23:18] ======== [PASSED] drm_test_bridge_get_current_state ========
[05:23:18] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[05:23:18] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[05:23:18] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[05:23:18] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[05:23:18] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[05:23:18] ================== drm_buddy (7 subtests) ==================
[05:23:18] [PASSED] drm_test_buddy_alloc_limit
[05:23:18] [PASSED] drm_test_buddy_alloc_optimistic
[05:23:18] [PASSED] drm_test_buddy_alloc_pessimistic
[05:23:18] [PASSED] drm_test_buddy_alloc_pathological
[05:23:18] [PASSED] drm_test_buddy_alloc_contiguous
[05:23:18] [PASSED] drm_test_buddy_alloc_clear
[05:23:18] [PASSED] drm_test_buddy_alloc_range_bias
[05:23:18] ==================== [PASSED] drm_buddy ====================
[05:23:18] ============= drm_cmdline_parser (40 subtests) =============
[05:23:18] [PASSED] drm_test_cmdline_force_d_only
[05:23:18] [PASSED] drm_test_cmdline_force_D_only_dvi
[05:23:18] [PASSED] drm_test_cmdline_force_D_only_hdmi
[05:23:18] [PASSED] drm_test_cmdline_force_D_only_not_digital
[05:23:18] [PASSED] drm_test_cmdline_force_e_only
[05:23:18] [PASSED] drm_test_cmdline_res
[05:23:18] [PASSED] drm_test_cmdline_res_vesa
[05:23:18] [PASSED] drm_test_cmdline_res_vesa_rblank
[05:23:18] [PASSED] drm_test_cmdline_res_rblank
[05:23:18] [PASSED] drm_test_cmdline_res_bpp
[05:23:18] [PASSED] drm_test_cmdline_res_refresh
[05:23:18] [PASSED] drm_test_cmdline_res_bpp_refresh
[05:23:18] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[05:23:18] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[05:23:18] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[05:23:18] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[05:23:18] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[05:23:18] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[05:23:18] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[05:23:18] [PASSED] drm_test_cmdline_res_margins_force_on
[05:23:18] [PASSED] drm_test_cmdline_res_vesa_margins
[05:23:18] [PASSED] drm_test_cmdline_name
[05:23:18] [PASSED] drm_test_cmdline_name_bpp
[05:23:18] [PASSED] drm_test_cmdline_name_option
[05:23:18] [PASSED] drm_test_cmdline_name_bpp_option
[05:23:18] [PASSED] drm_test_cmdline_rotate_0
[05:23:18] [PASSED] drm_test_cmdline_rotate_90
[05:23:18] [PASSED] drm_test_cmdline_rotate_180
[05:23:18] [PASSED] drm_test_cmdline_rotate_270
[05:23:18] [PASSED] drm_test_cmdline_hmirror
[05:23:18] [PASSED] drm_test_cmdline_vmirror
[05:23:18] [PASSED] drm_test_cmdline_margin_options
[05:23:18] [PASSED] drm_test_cmdline_multiple_options
[05:23:18] [PASSED] drm_test_cmdline_bpp_extra_and_option
[05:23:18] [PASSED] drm_test_cmdline_extra_and_option
[05:23:18] [PASSED] drm_test_cmdline_freestanding_options
[05:23:18] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[05:23:18] [PASSED] drm_test_cmdline_panel_orientation
[05:23:18] ================ drm_test_cmdline_invalid  =================
[05:23:18] [PASSED] margin_only
[05:23:18] [PASSED] interlace_only
[05:23:18] [PASSED] res_missing_x
[05:23:18] [PASSED] res_missing_y
[05:23:18] [PASSED] res_bad_y
[05:23:18] [PASSED] res_missing_y_bpp
[05:23:18] [PASSED] res_bad_bpp
[05:23:18] [PASSED] res_bad_refresh
[05:23:18] [PASSED] res_bpp_refresh_force_on_off
[05:23:18] [PASSED] res_invalid_mode
[05:23:18] [PASSED] res_bpp_wrong_place_mode
[05:23:18] [PASSED] name_bpp_refresh
[05:23:18] [PASSED] name_refresh
[05:23:18] [PASSED] name_refresh_wrong_mode
[05:23:18] [PASSED] name_refresh_invalid_mode
[05:23:18] [PASSED] rotate_multiple
[05:23:18] [PASSED] rotate_invalid_val
[05:23:18] [PASSED] rotate_truncated
[05:23:18] [PASSED] invalid_option
[05:23:18] [PASSED] invalid_tv_option
[05:23:18] [PASSED] truncated_tv_option
[05:23:18] ============ [PASSED] drm_test_cmdline_invalid =============
[05:23:18] =============== drm_test_cmdline_tv_options  ===============
[05:23:18] [PASSED] NTSC
[05:23:18] [PASSED] NTSC_443
[05:23:18] [PASSED] NTSC_J
[05:23:18] [PASSED] PAL
[05:23:18] [PASSED] PAL_M
[05:23:18] [PASSED] PAL_N
[05:23:18] [PASSED] SECAM
[05:23:18] [PASSED] MONO_525
[05:23:18] [PASSED] MONO_625
[05:23:18] =========== [PASSED] drm_test_cmdline_tv_options ===========
[05:23:18] =============== [PASSED] drm_cmdline_parser ================
[05:23:18] ========== drmm_connector_hdmi_init (20 subtests) ==========
[05:23:18] [PASSED] drm_test_connector_hdmi_init_valid
[05:23:18] [PASSED] drm_test_connector_hdmi_init_bpc_8
[05:23:18] [PASSED] drm_test_connector_hdmi_init_bpc_10
[05:23:18] [PASSED] drm_test_connector_hdmi_init_bpc_12
[05:23:18] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[05:23:18] [PASSED] drm_test_connector_hdmi_init_bpc_null
[05:23:18] [PASSED] drm_test_connector_hdmi_init_formats_empty
[05:23:18] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[05:23:18] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[05:23:18] [PASSED] supported_formats=0x9 yuv420_allowed=1
[05:23:18] [PASSED] supported_formats=0x9 yuv420_allowed=0
[05:23:18] [PASSED] supported_formats=0x3 yuv420_allowed=1
[05:23:18] [PASSED] supported_formats=0x3 yuv420_allowed=0
[05:23:18] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[05:23:18] [PASSED] drm_test_connector_hdmi_init_null_ddc
[05:23:18] [PASSED] drm_test_connector_hdmi_init_null_product
[05:23:18] [PASSED] drm_test_connector_hdmi_init_null_vendor
[05:23:18] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[05:23:18] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[05:23:18] [PASSED] drm_test_connector_hdmi_init_product_valid
[05:23:18] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[05:23:18] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[05:23:18] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[05:23:18] ========= drm_test_connector_hdmi_init_type_valid  =========
[05:23:18] [PASSED] HDMI-A
[05:23:18] [PASSED] HDMI-B
[05:23:18] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[05:23:18] ======== drm_test_connector_hdmi_init_type_invalid  ========
[05:23:18] [PASSED] Unknown
[05:23:18] [PASSED] VGA
[05:23:18] [PASSED] DVI-I
[05:23:18] [PASSED] DVI-D
[05:23:18] [PASSED] DVI-A
[05:23:18] [PASSED] Composite
[05:23:18] [PASSED] SVIDEO
[05:23:18] [PASSED] LVDS
[05:23:18] [PASSED] Component
[05:23:18] [PASSED] DIN
[05:23:18] [PASSED] DP
[05:23:18] [PASSED] TV
[05:23:18] [PASSED] eDP
[05:23:18] [PASSED] Virtual
[05:23:18] [PASSED] DSI
[05:23:18] [PASSED] DPI
[05:23:18] [PASSED] Writeback
[05:23:18] [PASSED] SPI
[05:23:18] [PASSED] USB
[05:23:18] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[05:23:18] ============ [PASSED] drmm_connector_hdmi_init =============
[05:23:18] ============= drmm_connector_init (3 subtests) =============
[05:23:18] [PASSED] drm_test_drmm_connector_init
[05:23:18] [PASSED] drm_test_drmm_connector_init_null_ddc
[05:23:18] ========= drm_test_drmm_connector_init_type_valid  =========
[05:23:18] [PASSED] Unknown
[05:23:18] [PASSED] VGA
[05:23:18] [PASSED] DVI-I
[05:23:18] [PASSED] DVI-D
[05:23:18] [PASSED] DVI-A
[05:23:18] [PASSED] Composite
[05:23:18] [PASSED] SVIDEO
[05:23:18] [PASSED] LVDS
[05:23:18] [PASSED] Component
[05:23:18] [PASSED] DIN
[05:23:18] [PASSED] DP
[05:23:18] [PASSED] HDMI-A
[05:23:18] [PASSED] HDMI-B
[05:23:18] [PASSED] TV
[05:23:18] [PASSED] eDP
[05:23:18] [PASSED] Virtual
[05:23:18] [PASSED] DSI
[05:23:18] [PASSED] DPI
[05:23:18] [PASSED] Writeback
[05:23:18] [PASSED] SPI
[05:23:18] [PASSED] USB
[05:23:18] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[05:23:18] =============== [PASSED] drmm_connector_init ===============
[05:23:18] ========= drm_connector_dynamic_init (6 subtests) ==========
[05:23:18] [PASSED] drm_test_drm_connector_dynamic_init
[05:23:18] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[05:23:18] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[05:23:18] [PASSED] drm_test_drm_connector_dynamic_init_properties
[05:23:18] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[05:23:18] [PASSED] Unknown
[05:23:18] [PASSED] VGA
[05:23:18] [PASSED] DVI-I
[05:23:18] [PASSED] DVI-D
[05:23:18] [PASSED] DVI-A
[05:23:18] [PASSED] Composite
[05:23:18] [PASSED] SVIDEO
[05:23:18] [PASSED] LVDS
[05:23:18] [PASSED] Component
[05:23:18] [PASSED] DIN
[05:23:18] [PASSED] DP
[05:23:18] [PASSED] HDMI-A
[05:23:18] [PASSED] HDMI-B
[05:23:18] [PASSED] TV
[05:23:18] [PASSED] eDP
[05:23:18] [PASSED] Virtual
[05:23:18] [PASSED] DSI
[05:23:18] [PASSED] DPI
[05:23:18] [PASSED] Writeback
[05:23:18] [PASSED] SPI
[05:23:18] [PASSED] USB
[05:23:18] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[05:23:18] ======== drm_test_drm_connector_dynamic_init_name  =========
[05:23:18] [PASSED] Unknown
[05:23:18] [PASSED] VGA
[05:23:18] [PASSED] DVI-I
[05:23:18] [PASSED] DVI-D
[05:23:18] [PASSED] DVI-A
[05:23:18] [PASSED] Composite
[05:23:18] [PASSED] SVIDEO
[05:23:18] [PASSED] LVDS
[05:23:18] [PASSED] Component
[05:23:18] [PASSED] DIN
[05:23:18] [PASSED] DP
[05:23:18] [PASSED] HDMI-A
[05:23:18] [PASSED] HDMI-B
[05:23:18] [PASSED] TV
[05:23:18] [PASSED] eDP
[05:23:18] [PASSED] Virtual
[05:23:18] [PASSED] DSI
[05:23:18] [PASSED] DPI
[05:23:18] [PASSED] Writeback
[05:23:18] [PASSED] SPI
[05:23:18] [PASSED] USB
[05:23:18] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[05:23:18] =========== [PASSED] drm_connector_dynamic_init ============
[05:23:18] ==== drm_connector_dynamic_register_early (4 subtests) =====
[05:23:18] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[05:23:18] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[05:23:18] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[05:23:18] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[05:23:18] ====== [PASSED] drm_connector_dynamic_register_early =======
[05:23:18] ======= drm_connector_dynamic_register (7 subtests) ========
[05:23:18] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[05:23:18] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[05:23:18] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[05:23:18] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[05:23:18] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[05:23:18] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[05:23:18] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[05:23:18] ========= [PASSED] drm_connector_dynamic_register ==========
[05:23:18] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[05:23:18] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[05:23:18] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[05:23:18] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[05:23:18] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[05:23:18] ========== drm_test_get_tv_mode_from_name_valid  ===========
[05:23:18] [PASSED] NTSC
[05:23:18] [PASSED] NTSC-443
[05:23:18] [PASSED] NTSC-J
[05:23:18] [PASSED] PAL
[05:23:18] [PASSED] PAL-M
[05:23:18] [PASSED] PAL-N
[05:23:18] [PASSED] SECAM
[05:23:18] [PASSED] Mono
[05:23:18] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[05:23:18] [PASSED] drm_test_get_tv_mode_from_name_truncated
[05:23:18] ============ [PASSED] drm_get_tv_mode_from_name ============
[05:23:18] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[05:23:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[05:23:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[05:23:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[05:23:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[05:23:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[05:23:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[05:23:18] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[05:23:18] [PASSED] VIC 96
[05:23:18] [PASSED] VIC 97
[05:23:18] [PASSED] VIC 101
[05:23:18] [PASSED] VIC 102
[05:23:18] [PASSED] VIC 106
[05:23:18] [PASSED] VIC 107
[05:23:18] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[05:23:18] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[05:23:18] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[05:23:18] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[05:23:18] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[05:23:18] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[05:23:18] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[05:23:18] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[05:23:18] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[05:23:18] [PASSED] Automatic
[05:23:18] [PASSED] Full
[05:23:18] [PASSED] Limited 16:235
[05:23:18] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[05:23:18] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[05:23:18] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[05:23:18] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[05:23:18] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[05:23:18] [PASSED] RGB
[05:23:18] [PASSED] YUV 4:2:0
[05:23:18] [PASSED] YUV 4:2:2
[05:23:18] [PASSED] YUV 4:4:4
[05:23:18] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[05:23:18] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[05:23:18] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[05:23:18] ============= drm_damage_helper (21 subtests) ==============
[05:23:18] [PASSED] drm_test_damage_iter_no_damage
[05:23:18] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[05:23:18] [PASSED] drm_test_damage_iter_no_damage_src_moved
[05:23:18] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[05:23:18] [PASSED] drm_test_damage_iter_no_damage_not_visible
[05:23:18] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[05:23:18] [PASSED] drm_test_damage_iter_no_damage_no_fb
[05:23:18] [PASSED] drm_test_damage_iter_simple_damage
[05:23:18] [PASSED] drm_test_damage_iter_single_damage
[05:23:18] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[05:23:18] [PASSED] drm_test_damage_iter_single_damage_outside_src
[05:23:18] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[05:23:18] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[05:23:18] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[05:23:18] [PASSED] drm_test_damage_iter_single_damage_src_moved
[05:23:18] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[05:23:18] [PASSED] drm_test_damage_iter_damage
[05:23:18] [PASSED] drm_test_damage_iter_damage_one_intersect
[05:23:18] [PASSED] drm_test_damage_iter_damage_one_outside
[05:23:18] [PASSED] drm_test_damage_iter_damage_src_moved
[05:23:18] [PASSED] drm_test_damage_iter_damage_not_visible
[05:23:18] ================ [PASSED] drm_damage_helper ================
[05:23:18] ============== drm_dp_mst_helper (3 subtests) ==============
[05:23:18] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[05:23:18] [PASSED] Clock 154000 BPP 30 DSC disabled
[05:23:18] [PASSED] Clock 234000 BPP 30 DSC disabled
[05:23:18] [PASSED] Clock 297000 BPP 24 DSC disabled
[05:23:18] [PASSED] Clock 332880 BPP 24 DSC enabled
[05:23:18] [PASSED] Clock 324540 BPP 24 DSC enabled
[05:23:18] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[05:23:18] ============== drm_test_dp_mst_calc_pbn_div  ===============
[05:23:18] [PASSED] Link rate 2000000 lane count 4
[05:23:18] [PASSED] Link rate 2000000 lane count 2
[05:23:18] [PASSED] Link rate 2000000 lane count 1
[05:23:18] [PASSED] Link rate 1350000 lane count 4
[05:23:18] [PASSED] Link rate 1350000 lane count 2
[05:23:18] [PASSED] Link rate 1350000 lane count 1
[05:23:18] [PASSED] Link rate 1000000 lane count 4
[05:23:18] [PASSED] Link rate 1000000 lane count 2
[05:23:18] [PASSED] Link rate 1000000 lane count 1
[05:23:18] [PASSED] Link rate 810000 lane count 4
[05:23:18] [PASSED] Link rate 810000 lane count 2
[05:23:18] [PASSED] Link rate 810000 lane count 1
[05:23:18] [PASSED] Link rate 540000 lane count 4
[05:23:18] [PASSED] Link rate 540000 lane count 2
[05:23:18] [PASSED] Link rate 540000 lane count 1
[05:23:18] [PASSED] Link rate 270000 lane count 4
[05:23:18] [PASSED] Link rate 270000 lane count 2
[05:23:18] [PASSED] Link rate 270000 lane count 1
[05:23:18] [PASSED] Link rate 162000 lane count 4
[05:23:18] [PASSED] Link rate 162000 lane count 2
[05:23:18] [PASSED] Link rate 162000 lane count 1
[05:23:18] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[05:23:18] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[05:23:18] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[05:23:18] [PASSED] DP_POWER_UP_PHY with port number
[05:23:18] [PASSED] DP_POWER_DOWN_PHY with port number
[05:23:18] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[05:23:18] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[05:23:18] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[05:23:18] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[05:23:18] [PASSED] DP_QUERY_PAYLOAD with port number
[05:23:18] [PASSED] DP_QUERY_PAYLOAD with VCPI
[05:23:18] [PASSED] DP_REMOTE_DPCD_READ with port number
[05:23:18] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[05:23:18] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[05:23:18] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[05:23:18] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[05:23:18] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[05:23:18] [PASSED] DP_REMOTE_I2C_READ with port number
[05:23:18] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[05:23:18] [PASSED] DP_REMOTE_I2C_READ with transactions array
[05:23:18] [PASSED] DP_REMOTE_I2C_WRITE with port number
[05:23:18] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[05:23:18] [PASSED] DP_REMOTE_I2C_WRITE with data array
[05:23:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[05:23:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[05:23:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[05:23:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[05:23:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[05:23:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[05:23:18] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[05:23:18] ================ [PASSED] drm_dp_mst_helper ================
[05:23:18] ================== drm_exec (7 subtests) ===================
[05:23:18] [PASSED] sanitycheck
[05:23:18] [PASSED] test_lock
[05:23:18] [PASSED] test_lock_unlock
[05:23:18] [PASSED] test_duplicates
[05:23:18] [PASSED] test_prepare
[05:23:18] [PASSED] test_prepare_array
[05:23:18] [PASSED] test_multiple_loops
[05:23:18] ==================== [PASSED] drm_exec =====================
[05:23:18] =========== drm_format_helper_test (18 subtests) ===========
[05:23:18] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[05:23:18] [PASSED] single_pixel_source_buffer
[05:23:18] [PASSED] single_pixel_clip_rectangle
[05:23:18] [PASSED] well_known_colors
[05:23:18] [PASSED] destination_pitch
[05:23:18] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[05:23:18] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[05:23:18] [PASSED] single_pixel_source_buffer
[05:23:18] [PASSED] single_pixel_clip_rectangle
[05:23:18] [PASSED] well_known_colors
[05:23:18] [PASSED] destination_pitch
[05:23:18] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[05:23:18] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[05:23:18] [PASSED] single_pixel_source_buffer
[05:23:18] [PASSED] single_pixel_clip_rectangle
[05:23:18] [PASSED] well_known_colors
[05:23:18] [PASSED] destination_pitch
[05:23:18] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[05:23:18] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[05:23:18] [PASSED] single_pixel_source_buffer
[05:23:18] [PASSED] single_pixel_clip_rectangle
[05:23:18] [PASSED] well_known_colors
[05:23:18] [PASSED] destination_pitch
[05:23:18] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[05:23:18] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[05:23:18] [PASSED] single_pixel_source_buffer
[05:23:18] [PASSED] single_pixel_clip_rectangle
[05:23:18] [PASSED] well_known_colors
[05:23:18] [PASSED] destination_pitch
[05:23:18] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[05:23:18] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[05:23:18] [PASSED] single_pixel_source_buffer
[05:23:18] [PASSED] single_pixel_clip_rectangle
[05:23:18] [PASSED] well_known_colors
[05:23:18] [PASSED] destination_pitch
[05:23:18] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[05:23:18] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[05:23:18] [PASSED] single_pixel_source_buffer
[05:23:18] [PASSED] single_pixel_clip_rectangle
[05:23:18] [PASSED] well_known_colors
[05:23:18] [PASSED] destination_pitch
[05:23:18] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[05:23:18] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[05:23:18] [PASSED] single_pixel_source_buffer
[05:23:18] [PASSED] single_pixel_clip_rectangle
[05:23:18] [PASSED] well_known_colors
[05:23:18] [PASSED] destination_pitch
[05:23:18] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[05:23:18] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[05:23:18] [PASSED] single_pixel_source_buffer
[05:23:18] [PASSED] single_pixel_clip_rectangle
[05:23:18] [PASSED] well_known_colors
[05:23:18] [PASSED] destination_pitch
[05:23:18] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[05:23:18] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[05:23:18] [PASSED] single_pixel_source_buffer
[05:23:18] [PASSED] single_pixel_clip_rectangle
[05:23:18] [PASSED] well_known_colors
[05:23:18] [PASSED] destination_pitch
[05:23:18] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[05:23:18] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[05:23:18] [PASSED] single_pixel_source_buffer
[05:23:18] [PASSED] single_pixel_clip_rectangle
[05:23:18] [PASSED] well_known_colors
[05:23:18] [PASSED] destination_pitch
[05:23:18] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[05:23:18] ============== drm_test_fb_xrgb8888_to_mono  ===============
[05:23:18] [PASSED] single_pixel_source_buffer
[05:23:18] [PASSED] single_pixel_clip_rectangle
[05:23:18] [PASSED] well_known_colors
[05:23:18] [PASSED] destination_pitch
[05:23:18] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[05:23:18] ==================== drm_test_fb_swab  =====================
[05:23:18] [PASSED] single_pixel_source_buffer
[05:23:18] [PASSED] single_pixel_clip_rectangle
[05:23:18] [PASSED] well_known_colors
[05:23:18] [PASSED] destination_pitch
[05:23:18] ================ [PASSED] drm_test_fb_swab =================
[05:23:18] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[05:23:18] [PASSED] single_pixel_source_buffer
[05:23:18] [PASSED] single_pixel_clip_rectangle
[05:23:18] [PASSED] well_known_colors
[05:23:18] [PASSED] destination_pitch
[05:23:18] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[05:23:18] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[05:23:18] [PASSED] single_pixel_source_buffer
[05:23:18] [PASSED] single_pixel_clip_rectangle
[05:23:18] [PASSED] well_known_colors
[05:23:18] [PASSED] destination_pitch
[05:23:18] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[05:23:18] ================= drm_test_fb_clip_offset  =================
[05:23:18] [PASSED] pass through
[05:23:18] [PASSED] horizontal offset
[05:23:18] [PASSED] vertical offset
[05:23:18] [PASSED] horizontal and vertical offset
[05:23:18] [PASSED] horizontal offset (custom pitch)
[05:23:18] [PASSED] vertical offset (custom pitch)
[05:23:18] [PASSED] horizontal and vertical offset (custom pitch)
[05:23:18] ============= [PASSED] drm_test_fb_clip_offset =============
[05:23:18] ============== drm_test_fb_build_fourcc_list  ==============
[05:23:18] [PASSED] no native formats
[05:23:18] [PASSED] XRGB8888 as native format
[05:23:18] [PASSED] remove duplicates
[05:23:18] [PASSED] convert alpha formats
[05:23:18] [PASSED] random formats
[05:23:18] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[05:23:18] =================== drm_test_fb_memcpy  ====================
[05:23:18] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[05:23:18] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[05:23:18] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[05:23:18] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[05:23:18] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[05:23:18] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[05:23:18] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[05:23:18] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[05:23:18] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[05:23:18] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[05:23:18] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[05:23:18] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[05:23:18] =============== [PASSED] drm_test_fb_memcpy ================
[05:23:18] ============= [PASSED] drm_format_helper_test ==============
[05:23:18] ================= drm_format (18 subtests) =================
[05:23:18] [PASSED] drm_test_format_block_width_invalid
[05:23:18] [PASSED] drm_test_format_block_width_one_plane
[05:23:18] [PASSED] drm_test_format_block_width_two_plane
[05:23:18] [PASSED] drm_test_format_block_width_three_plane
[05:23:18] [PASSED] drm_test_format_block_width_tiled
[05:23:18] [PASSED] drm_test_format_block_height_invalid
[05:23:18] [PASSED] drm_test_format_block_height_one_plane
[05:23:18] [PASSED] drm_test_format_block_height_two_plane
[05:23:18] [PASSED] drm_test_format_block_height_three_plane
[05:23:18] [PASSED] drm_test_format_block_height_tiled
[05:23:18] [PASSED] drm_test_format_min_pitch_invalid
[05:23:18] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[05:23:18] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[05:23:18] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[05:23:18] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[05:23:18] [PASSED] drm_test_format_min_pitch_two_plane
[05:23:18] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[05:23:18] [PASSED] drm_test_format_min_pitch_tiled
[05:23:18] =================== [PASSED] drm_format ====================
[05:23:18] ============== drm_framebuffer (10 subtests) ===============
[05:23:18] ========== drm_test_framebuffer_check_src_coords  ==========
[05:23:18] [PASSED] Success: source fits into fb
[05:23:18] [PASSED] Fail: overflowing fb with x-axis coordinate
[05:23:18] [PASSED] Fail: overflowing fb with y-axis coordinate
[05:23:18] [PASSED] Fail: overflowing fb with source width
[05:23:18] [PASSED] Fail: overflowing fb with source height
[05:23:18] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[05:23:18] [PASSED] drm_test_framebuffer_cleanup
[05:23:18] =============== drm_test_framebuffer_create  ===============
[05:23:18] [PASSED] ABGR8888 normal sizes
[05:23:18] [PASSED] ABGR8888 max sizes
[05:23:18] [PASSED] ABGR8888 pitch greater than min required
[05:23:18] [PASSED] ABGR8888 pitch less than min required
[05:23:18] [PASSED] ABGR8888 Invalid width
[05:23:18] [PASSED] ABGR8888 Invalid buffer handle
[05:23:18] [PASSED] No pixel format
[05:23:18] [PASSED] ABGR8888 Width 0
[05:23:18] [PASSED] ABGR8888 Height 0
[05:23:18] [PASSED] ABGR8888 Out of bound height * pitch combination
[05:23:18] [PASSED] ABGR8888 Large buffer offset
[05:23:18] [PASSED] ABGR8888 Buffer offset for inexistent plane
[05:23:18] [PASSED] ABGR8888 Invalid flag
[05:23:18] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[05:23:18] [PASSED] ABGR8888 Valid buffer modifier
[05:23:18] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[05:23:18] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[05:23:18] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[05:23:18] [PASSED] NV12 Normal sizes
[05:23:18] [PASSED] NV12 Max sizes
[05:23:18] [PASSED] NV12 Invalid pitch
[05:23:18] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[05:23:18] [PASSED] NV12 different  modifier per-plane
[05:23:18] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[05:23:18] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[05:23:18] [PASSED] NV12 Modifier for inexistent plane
[05:23:18] [PASSED] NV12 Handle for inexistent plane
[05:23:18] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[05:23:18] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[05:23:18] [PASSED] YVU420 Normal sizes
[05:23:18] [PASSED] YVU420 Max sizes
[05:23:18] [PASSED] YVU420 Invalid pitch
[05:23:18] [PASSED] YVU420 Different pitches
[05:23:18] [PASSED] YVU420 Different buffer offsets/pitches
[05:23:18] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[05:23:18] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[05:23:18] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[05:23:18] [PASSED] YVU420 Valid modifier
[05:23:18] [PASSED] YVU420 Different modifiers per plane
[05:23:18] [PASSED] YVU420 Modifier for inexistent plane
[05:23:18] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[05:23:18] [PASSED] X0L2 Normal sizes
[05:23:18] [PASSED] X0L2 Max sizes
[05:23:18] [PASSED] X0L2 Invalid pitch
[05:23:18] [PASSED] X0L2 Pitch greater than minimum required
[05:23:18] [PASSED] X0L2 Handle for inexistent plane
[05:23:18] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[05:23:18] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[05:23:18] [PASSED] X0L2 Valid modifier
[05:23:18] [PASSED] X0L2 Modifier for inexistent plane
[05:23:18] =========== [PASSED] drm_test_framebuffer_create ===========
[05:23:18] [PASSED] drm_test_framebuffer_free
[05:23:18] [PASSED] drm_test_framebuffer_init
[05:23:18] [PASSED] drm_test_framebuffer_init_bad_format
[05:23:18] [PASSED] drm_test_framebuffer_init_dev_mismatch
[05:23:18] [PASSED] drm_test_framebuffer_lookup
[05:23:18] [PASSED] drm_test_framebuffer_lookup_inexistent
[05:23:18] [PASSED] drm_test_framebuffer_modifiers_not_supported
[05:23:18] ================= [PASSED] drm_framebuffer =================
[05:23:18] ================ drm_gem_shmem (8 subtests) ================
[05:23:18] [PASSED] drm_gem_shmem_test_obj_create
[05:23:18] [PASSED] drm_gem_shmem_test_obj_create_private
[05:23:18] [PASSED] drm_gem_shmem_test_pin_pages
[05:23:18] [PASSED] drm_gem_shmem_test_vmap
[05:23:18] [PASSED] drm_gem_shmem_test_get_pages_sgt
[05:23:18] [PASSED] drm_gem_shmem_test_get_sg_table
[05:23:18] [PASSED] drm_gem_shmem_test_madvise
[05:23:18] [PASSED] drm_gem_shmem_test_purge
[05:23:18] ================== [PASSED] drm_gem_shmem ==================
[05:23:18] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[05:23:18] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[05:23:18] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[05:23:18] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[05:23:18] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[05:23:18] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[05:23:18] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[05:23:18] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[05:23:18] [PASSED] Automatic
[05:23:18] [PASSED] Full
[05:23:18] [PASSED] Limited 16:235
[05:23:18] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[05:23:18] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[05:23:18] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[05:23:18] [PASSED] drm_test_check_disable_connector
[05:23:18] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[05:23:18] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[05:23:18] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[05:23:18] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[05:23:18] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[05:23:18] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[05:23:18] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[05:23:18] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[05:23:18] [PASSED] drm_test_check_output_bpc_dvi
[05:23:18] [PASSED] drm_test_check_output_bpc_format_vic_1
[05:23:18] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[05:23:18] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[05:23:18] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[05:23:18] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[05:23:18] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[05:23:18] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[05:23:18] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[05:23:18] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[05:23:18] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[05:23:18] [PASSED] drm_test_check_broadcast_rgb_value
[05:23:18] [PASSED] drm_test_check_bpc_8_value
[05:23:18] [PASSED] drm_test_check_bpc_10_value
[05:23:18] [PASSED] drm_test_check_bpc_12_value
[05:23:18] [PASSED] drm_test_check_format_value
[05:23:18] [PASSED] drm_test_check_tmds_char_value
[05:23:18] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[05:23:18] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[05:23:18] [PASSED] drm_test_check_mode_valid
[05:23:18] [PASSED] drm_test_check_mode_valid_reject
[05:23:18] [PASSED] drm_test_check_mode_valid_reject_rate
[05:23:18] [PASSED] drm_test_check_mode_valid_reject_max_clock
[05:23:18] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[05:23:18] ================= drm_managed (2 subtests) =================
[05:23:18] [PASSED] drm_test_managed_release_action
[05:23:18] [PASSED] drm_test_managed_run_action
[05:23:18] =================== [PASSED] drm_managed ===================
[05:23:18] =================== drm_mm (6 subtests) ====================
[05:23:18] [PASSED] drm_test_mm_init
[05:23:18] [PASSED] drm_test_mm_debug
[05:23:18] [PASSED] drm_test_mm_align32
[05:23:18] [PASSED] drm_test_mm_align64
[05:23:18] [PASSED] drm_test_mm_lowest
[05:23:18] [PASSED] drm_test_mm_highest
[05:23:18] ===================== [PASSED] drm_mm ======================
[05:23:18] ============= drm_modes_analog_tv (5 subtests) =============
[05:23:18] [PASSED] drm_test_modes_analog_tv_mono_576i
[05:23:18] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[05:23:18] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[05:23:18] [PASSED] drm_test_modes_analog_tv_pal_576i
[05:23:18] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[05:23:18] =============== [PASSED] drm_modes_analog_tv ===============
[05:23:18] ============== drm_plane_helper (2 subtests) ===============
[05:23:18] =============== drm_test_check_plane_state  ================
[05:23:18] [PASSED] clipping_simple
[05:23:18] [PASSED] clipping_rotate_reflect
[05:23:18] [PASSED] positioning_simple
[05:23:18] [PASSED] upscaling
[05:23:18] [PASSED] downscaling
[05:23:18] [PASSED] rounding1
[05:23:18] [PASSED] rounding2
[05:23:18] [PASSED] rounding3
[05:23:18] [PASSED] rounding4
[05:23:18] =========== [PASSED] drm_test_check_plane_state ============
[05:23:18] =========== drm_test_check_invalid_plane_state  ============
[05:23:18] [PASSED] positioning_invalid
[05:23:18] [PASSED] upscaling_invalid
[05:23:18] [PASSED] downscaling_invalid
[05:23:18] ======= [PASSED] drm_test_check_invalid_plane_state ========
[05:23:18] ================ [PASSED] drm_plane_helper =================
[05:23:18] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[05:23:18] ====== drm_test_connector_helper_tv_get_modes_check  =======
[05:23:18] [PASSED] None
[05:23:18] [PASSED] PAL
[05:23:18] [PASSED] NTSC
[05:23:18] [PASSED] Both, NTSC Default
[05:23:18] [PASSED] Both, PAL Default
[05:23:18] [PASSED] Both, NTSC Default, with PAL on command-line
[05:23:18] [PASSED] Both, PAL Default, with NTSC on command-line
[05:23:18] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[05:23:18] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[05:23:18] ================== drm_rect (9 subtests) ===================
[05:23:18] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[05:23:18] [PASSED] drm_test_rect_clip_scaled_not_clipped
[05:23:18] [PASSED] drm_test_rect_clip_scaled_clipped
[05:23:18] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[05:23:18] ================= drm_test_rect_intersect  =================
[05:23:18] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[05:23:18] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[05:23:18] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[05:23:18] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[05:23:18] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[05:23:18] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[05:23:18] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[05:23:18] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[05:23:18] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[05:23:18] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[05:23:18] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[05:23:18] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[05:23:18] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[05:23:18] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[05:23:18] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[05:23:18] ============= [PASSED] drm_test_rect_intersect =============
[05:23:18] ================ drm_test_rect_calc_hscale  ================
[05:23:18] [PASSED] normal use
[05:23:18] [PASSED] out of max range
[05:23:18] [PASSED] out of min range
[05:23:18] [PASSED] zero dst
[05:23:18] [PASSED] negative src
[05:23:18] [PASSED] negative dst
[05:23:18] ============ [PASSED] drm_test_rect_calc_hscale ============
[05:23:18] ================ drm_test_rect_calc_vscale  ================
[05:23:18] [PASSED] normal use
[05:23:18] [PASSED] out of max range
[05:23:18] [PASSED] out of min range
[05:23:18] [PASSED] zero dst
[05:23:18] [PASSED] negative src
[05:23:18] [PASSED] negative dst
[05:23:18] ============ [PASSED] drm_test_rect_calc_vscale ============
[05:23:18] ================== drm_test_rect_rotate  ===================
[05:23:18] [PASSED] reflect-x
[05:23:18] [PASSED] reflect-y
[05:23:18] [PASSED] rotate-0
[05:23:18] [PASSED] rotate-90
[05:23:18] [PASSED] rotate-180
stty: 'standard input': Inappropriate ioctl for device
[05:23:18] [PASSED] rotate-270
[05:23:18] ============== [PASSED] drm_test_rect_rotate ===============
[05:23:18] ================ drm_test_rect_rotate_inv  =================
[05:23:18] [PASSED] reflect-x
[05:23:18] [PASSED] reflect-y
[05:23:18] [PASSED] rotate-0
[05:23:18] [PASSED] rotate-90
[05:23:18] [PASSED] rotate-180
[05:23:18] [PASSED] rotate-270
[05:23:18] ============ [PASSED] drm_test_rect_rotate_inv =============
[05:23:18] ==================== [PASSED] drm_rect =====================
[05:23:18] ============================================================
[05:23:18] Testing complete. Ran 614 tests: passed: 614
[05:23:18] Elapsed time: 47.282s total, 2.641s configuring, 44.360s building, 0.269s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[05:23:18] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:23:20] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[05:23:33] Starting KUnit Kernel (1/1)...
[05:23:33] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:23:33] ================= ttm_device (5 subtests) ==================
[05:23:33] [PASSED] ttm_device_init_basic
[05:23:33] [PASSED] ttm_device_init_multiple
[05:23:33] [PASSED] ttm_device_fini_basic
[05:23:33] [PASSED] ttm_device_init_no_vma_man
[05:23:33] ================== ttm_device_init_pools  ==================
[05:23:33] [PASSED] No DMA allocations, no DMA32 required
[05:23:33] [PASSED] DMA allocations, DMA32 required
[05:23:33] [PASSED] No DMA allocations, DMA32 required
[05:23:33] [PASSED] DMA allocations, no DMA32 required
[05:23:33] ============== [PASSED] ttm_device_init_pools ==============
[05:23:33] =================== [PASSED] ttm_device ====================
[05:23:33] ================== ttm_pool (8 subtests) ===================
[05:23:33] ================== ttm_pool_alloc_basic  ===================
[05:23:33] [PASSED] One page
[05:23:33] [PASSED] More than one page
[05:23:33] [PASSED] Above the allocation limit
[05:23:33] [PASSED] One page, with coherent DMA mappings enabled
[05:23:33] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[05:23:33] ============== [PASSED] ttm_pool_alloc_basic ===============
[05:23:33] ============== ttm_pool_alloc_basic_dma_addr  ==============
[05:23:33] [PASSED] One page
[05:23:33] [PASSED] More than one page
[05:23:33] [PASSED] Above the allocation limit
[05:23:33] [PASSED] One page, with coherent DMA mappings enabled
[05:23:33] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[05:23:33] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[05:23:33] [PASSED] ttm_pool_alloc_order_caching_match
[05:23:33] [PASSED] ttm_pool_alloc_caching_mismatch
[05:23:33] [PASSED] ttm_pool_alloc_order_mismatch
[05:23:33] [PASSED] ttm_pool_free_dma_alloc
[05:23:33] [PASSED] ttm_pool_free_no_dma_alloc
[05:23:33] [PASSED] ttm_pool_fini_basic
[05:23:33] ==================== [PASSED] ttm_pool =====================
[05:23:33] ================ ttm_resource (8 subtests) =================
[05:23:33] ================= ttm_resource_init_basic  =================
[05:23:33] [PASSED] Init resource in TTM_PL_SYSTEM
[05:23:33] [PASSED] Init resource in TTM_PL_VRAM
[05:23:33] [PASSED] Init resource in a private placement
[05:23:33] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[05:23:33] ============= [PASSED] ttm_resource_init_basic =============
[05:23:33] [PASSED] ttm_resource_init_pinned
[05:23:33] [PASSED] ttm_resource_fini_basic
[05:23:33] [PASSED] ttm_resource_manager_init_basic
[05:23:33] [PASSED] ttm_resource_manager_usage_basic
[05:23:33] [PASSED] ttm_resource_manager_set_used_basic
[05:23:33] [PASSED] ttm_sys_man_alloc_basic
[05:23:33] [PASSED] ttm_sys_man_free_basic
[05:23:33] ================== [PASSED] ttm_resource ===================
[05:23:33] =================== ttm_tt (15 subtests) ===================
[05:23:33] ==================== ttm_tt_init_basic  ====================
[05:23:33] [PASSED] Page-aligned size
[05:23:33] [PASSED] Extra pages requested
[05:23:33] ================ [PASSED] ttm_tt_init_basic ================
[05:23:33] [PASSED] ttm_tt_init_misaligned
[05:23:33] [PASSED] ttm_tt_fini_basic
[05:23:33] [PASSED] ttm_tt_fini_sg
[05:23:33] [PASSED] ttm_tt_fini_shmem
[05:23:33] [PASSED] ttm_tt_create_basic
[05:23:33] [PASSED] ttm_tt_create_invalid_bo_type
[05:23:33] [PASSED] ttm_tt_create_ttm_exists
[05:23:33] [PASSED] ttm_tt_create_failed
[05:23:33] [PASSED] ttm_tt_destroy_basic
[05:23:33] [PASSED] ttm_tt_populate_null_ttm
[05:23:33] [PASSED] ttm_tt_populate_populated_ttm
[05:23:33] [PASSED] ttm_tt_unpopulate_basic
[05:23:33] [PASSED] ttm_tt_unpopulate_empty_ttm
[05:23:33] [PASSED] ttm_tt_swapin_basic
[05:23:33] ===================== [PASSED] ttm_tt ======================
[05:23:33] =================== ttm_bo (14 subtests) ===================
[05:23:33] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[05:23:33] [PASSED] Cannot be interrupted and sleeps
[05:23:33] [PASSED] Cannot be interrupted, locks straight away
[05:23:33] [PASSED] Can be interrupted, sleeps
[05:23:33] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[05:23:33] [PASSED] ttm_bo_reserve_locked_no_sleep
[05:23:33] [PASSED] ttm_bo_reserve_no_wait_ticket
[05:23:33] [PASSED] ttm_bo_reserve_double_resv
[05:23:33] [PASSED] ttm_bo_reserve_interrupted
[05:23:33] [PASSED] ttm_bo_reserve_deadlock
[05:23:33] [PASSED] ttm_bo_unreserve_basic
[05:23:33] [PASSED] ttm_bo_unreserve_pinned
[05:23:33] [PASSED] ttm_bo_unreserve_bulk
[05:23:33] [PASSED] ttm_bo_put_basic
[05:23:33] [PASSED] ttm_bo_put_shared_resv
[05:23:33] [PASSED] ttm_bo_pin_basic
[05:23:33] [PASSED] ttm_bo_pin_unpin_resource
[05:23:33] [PASSED] ttm_bo_multiple_pin_one_unpin
[05:23:33] ===================== [PASSED] ttm_bo ======================
[05:23:33] ============== ttm_bo_validate (22 subtests) ===============
[05:23:33] ============== ttm_bo_init_reserved_sys_man  ===============
[05:23:33] [PASSED] Buffer object for userspace
[05:23:33] [PASSED] Kernel buffer object
[05:23:33] [PASSED] Shared buffer object
[05:23:33] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[05:23:33] ============== ttm_bo_init_reserved_mock_man  ==============
[05:23:33] [PASSED] Buffer object for userspace
[05:23:33] [PASSED] Kernel buffer object
[05:23:33] [PASSED] Shared buffer object
[05:23:33] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[05:23:33] [PASSED] ttm_bo_init_reserved_resv
[05:23:33] ================== ttm_bo_validate_basic  ==================
[05:23:33] [PASSED] Buffer object for userspace
[05:23:33] [PASSED] Kernel buffer object
[05:23:33] [PASSED] Shared buffer object
[05:23:33] ============== [PASSED] ttm_bo_validate_basic ==============
[05:23:33] [PASSED] ttm_bo_validate_invalid_placement
[05:23:33] ============= ttm_bo_validate_same_placement  ==============
[05:23:33] [PASSED] System manager
[05:23:33] [PASSED] VRAM manager
[05:23:33] ========= [PASSED] ttm_bo_validate_same_placement ==========
[05:23:33] [PASSED] ttm_bo_validate_failed_alloc
[05:23:33] [PASSED] ttm_bo_validate_pinned
[05:23:33] [PASSED] ttm_bo_validate_busy_placement
[05:23:33] ================ ttm_bo_validate_multihop  =================
[05:23:33] [PASSED] Buffer object for userspace
[05:23:33] [PASSED] Kernel buffer object
[05:23:33] [PASSED] Shared buffer object
[05:23:33] ============ [PASSED] ttm_bo_validate_multihop =============
[05:23:33] ========== ttm_bo_validate_no_placement_signaled  ==========
[05:23:33] [PASSED] Buffer object in system domain, no page vector
[05:23:33] [PASSED] Buffer object in system domain with an existing page vector
[05:23:33] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[05:23:33] ======== ttm_bo_validate_no_placement_not_signaled  ========
[05:23:33] [PASSED] Buffer object for userspace
[05:23:33] [PASSED] Kernel buffer object
[05:23:33] [PASSED] Shared buffer object
[05:23:33] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[05:23:33] [PASSED] ttm_bo_validate_move_fence_signaled
[05:23:33] ========= ttm_bo_validate_move_fence_not_signaled  =========
[05:23:33] [PASSED] Waits for GPU
[05:23:33] [PASSED] Tries to lock straight away
[05:23:34] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[05:23:34] [PASSED] ttm_bo_validate_swapout
[05:23:34] [PASSED] ttm_bo_validate_happy_evict
[05:23:34] [PASSED] ttm_bo_validate_all_pinned_evict
[05:23:34] [PASSED] ttm_bo_validate_allowed_only_evict
[05:23:34] [PASSED] ttm_bo_validate_deleted_evict
[05:23:34] [PASSED] ttm_bo_validate_busy_domain_evict
[05:23:34] [PASSED] ttm_bo_validate_evict_gutting
[05:23:34] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[05:23:34] ================= [PASSED] ttm_bo_validate =================
[05:23:34] ============================================================
[05:23:34] Testing complete. Ran 102 tests: passed: 102
[05:23:34] Elapsed time: 15.879s total, 2.525s configuring, 12.526s building, 0.692s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


