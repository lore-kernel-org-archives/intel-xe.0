Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA444C27C75
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 19:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AC110E70B;
	Tue, 11 Jun 2024 19:23:10 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A9810E706;
 Tue, 11 Jun 2024 19:23:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/i915/display=3A_Send_vrr_v?=
 =?utf-8?q?sync_params_whne_vrr_is_enabled?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Jun 2024 19:23:08 -0000
Message-ID: <171813378848.68617.5631022557462223512@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240611174909.154670-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20240611174909.154670-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: drm/i915/display: Send vrr vsync params whne vrr is enabled
URL   : https://patchwork.freedesktop.org/series/134733/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[19:22:11] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:22:16] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
  156 | u64 ioread64_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:163:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
  163 | u64 ioread64_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:170:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
  170 | u64 ioread64be_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:178:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
  178 | u64 ioread64be_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:264:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
  264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:272:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
  272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:280:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
  280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
../lib/iomap.c:288:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
  288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~

[19:22:41] Starting KUnit Kernel (1/1)...
[19:22:41] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[19:22:41] =================== guc_dbm (7 subtests) ===================
[19:22:41] [PASSED] test_empty
[19:22:41] [PASSED] test_default
[19:22:41] ======================== test_size  ========================
[19:22:41] [PASSED] 4
[19:22:41] [PASSED] 8
[19:22:41] [PASSED] 32
[19:22:41] [PASSED] 256
[19:22:41] ==================== [PASSED] test_size ====================
[19:22:41] ======================= test_reuse  ========================
[19:22:41] [PASSED] 4
[19:22:41] [PASSED] 8
[19:22:41] [PASSED] 32
[19:22:41] [PASSED] 256
[19:22:41] =================== [PASSED] test_reuse ====================
[19:22:41] =================== test_range_overlap  ====================
[19:22:41] [PASSED] 4
[19:22:41] [PASSED] 8
[19:22:41] [PASSED] 32
[19:22:41] [PASSED] 256
[19:22:41] =============== [PASSED] test_range_overlap ================
[19:22:41] =================== test_range_compact  ====================
[19:22:41] [PASSED] 4
[19:22:41] [PASSED] 8
[19:22:41] [PASSED] 32
[19:22:41] [PASSED] 256
[19:22:41] =============== [PASSED] test_range_compact ================
[19:22:41] ==================== test_range_spare  =====================
[19:22:41] [PASSED] 4
[19:22:41] [PASSED] 8
[19:22:41] [PASSED] 32
[19:22:41] [PASSED] 256
[19:22:41] ================ [PASSED] test_range_spare =================
[19:22:41] ===================== [PASSED] guc_dbm =====================
[19:22:41] =================== guc_idm (6 subtests) ===================
[19:22:41] [PASSED] bad_init
[19:22:41] [PASSED] no_init
[19:22:41] [PASSED] init_fini
[19:22:41] [PASSED] check_used
[19:22:41] [PASSED] check_quota
[19:22:41] [PASSED] check_all
[19:22:41] ===================== [PASSED] guc_idm =====================
[19:22:41] ================== no_relay (3 subtests) ===================
[19:22:41] [PASSED] xe_drops_guc2pf_if_not_ready
[19:22:41] [PASSED] xe_drops_guc2vf_if_not_ready
[19:22:41] [PASSED] xe_rejects_send_if_not_ready
[19:22:41] ==================== [PASSED] no_relay =====================
[19:22:41] ================== pf_relay (14 subtests) ==================
[19:22:41] [PASSED] pf_rejects_guc2pf_too_short
[19:22:41] [PASSED] pf_rejects_guc2pf_too_long
[19:22:41] [PASSED] pf_rejects_guc2pf_no_payload
[19:22:41] [PASSED] pf_fails_no_payload
[19:22:41] [PASSED] pf_fails_bad_origin
[19:22:41] [PASSED] pf_fails_bad_type
[19:22:41] [PASSED] pf_txn_reports_error
[19:22:41] [PASSED] pf_txn_sends_pf2guc
[19:22:41] [PASSED] pf_sends_pf2guc
[19:22:41] [SKIPPED] pf_loopback_nop
[19:22:41] [SKIPPED] pf_loopback_echo
[19:22:41] [SKIPPED] pf_loopback_fail
[19:22:41] [SKIPPED] pf_loopback_busy
[19:22:41] [SKIPPED] pf_loopback_retry
[19:22:41] ==================== [PASSED] pf_relay =====================
[19:22:41] ================== vf_relay (3 subtests) ===================
[19:22:41] [PASSED] vf_rejects_guc2vf_too_short
[19:22:41] [PASSED] vf_rejects_guc2vf_too_long
[19:22:41] [PASSED] vf_rejects_guc2vf_no_payload
[19:22:41] ==================== [PASSED] vf_relay =====================
[19:22:41] ================= pf_service (11 subtests) =================
[19:22:41] [PASSED] pf_negotiate_any
[19:22:41] [PASSED] pf_negotiate_base_match
[19:22:41] [PASSED] pf_negotiate_base_newer
[19:22:41] [PASSED] pf_negotiate_base_next
[19:22:41] [SKIPPED] pf_negotiate_base_older
[19:22:41] [PASSED] pf_negotiate_base_prev
[19:22:41] [PASSED] pf_negotiate_latest_match
[19:22:41] [PASSED] pf_negotiate_latest_newer
[19:22:41] [PASSED] pf_negotiate_latest_next
[19:22:41] [SKIPPED] pf_negotiate_latest_older
[19:22:41] [SKIPPED] pf_negotiate_latest_prev
[19:22:41] =================== [PASSED] pf_service ====================
[19:22:41] ===================== lmtt (1 subtest) =====================
[19:22:41] ======================== test_ops  =========================
[19:22:41] [PASSED] 2-level
[19:22:41] [PASSED] multi-level
[19:22:41] ==================== [PASSED] test_ops =====================
[19:22:41] ====================== [PASSED] lmtt =======================
[19:22:41] ==================== xe_bo (2 subtests) ====================
[19:22:41] [SKIPPED] xe_ccs_migrate_kunit
[19:22:41] [SKIPPED] xe_bo_evict_kunit
[19:22:41] ===================== [SKIPPED] xe_bo ======================
[19:22:41] ================== xe_dma_buf (1 subtest) ==================
[19:22:41] [SKIPPED] xe_dma_buf_kunit
[19:22:41] =================== [SKIPPED] xe_dma_buf ===================
[19:22:41] ================== xe_migrate (1 subtest) ==================
[19:22:41] [SKIPPED] xe_migrate_sanity_kunit
[19:22:41] =================== [SKIPPED] xe_migrate ===================
[19:22:41] =================== xe_mocs (2 subtests) ===================
[19:22:41] [SKIPPED] xe_live_mocs_kernel_kunit
[19:22:41] [SKIPPED] xe_live_mocs_reset_kunit
[19:22:41] ==================== [SKIPPED] xe_mocs =====================
[19:22:41] ==================== args (11 subtests) ====================
[19:22:41] [PASSED] count_args_test
[19:22:41] [PASSED] call_args_example
[19:22:41] [PASSED] call_args_test
[19:22:41] [PASSED] drop_first_arg_example
[19:22:41] [PASSED] drop_first_arg_test
[19:22:41] [PASSED] first_arg_example
[19:22:41] [PASSED] first_arg_test
[19:22:41] [PASSED] last_arg_example
[19:22:41] [PASSED] last_arg_test
[19:22:41] [PASSED] pick_arg_example
[19:22:41] [PASSED] sep_comma_example
[19:22:41] ====================== [PASSED] args =======================
[19:22:41] =================== xe_pci (2 subtests) ====================
[19:22:41] [PASSED] xe_gmdid_graphics_ip
[19:22:41] [PASSED] xe_gmdid_media_ip
[19:22:41] ===================== [PASSED] xe_pci ======================
[19:22:41] ==================== xe_rtp (1 subtest) ====================
[19:22:41] ================== xe_rtp_process_tests  ===================
[19:22:41] [PASSED] coalesce-same-reg
[19:22:41] [PASSED] no-match-no-add
[19:22:41] [PASSED] no-match-no-add-multiple-rules
[19:22:41] [PASSED] two-regs-two-entries
[19:22:41] [PASSED] clr-one-set-other
[19:22:41] [PASSED] set-field
[19:22:41] [PASSED] conflict-duplicate
[19:22:41] [PASSED] conflict-not-disjoint
[19:22:41] [PASSED] conflict-reg-type
[19:22:41] ============== [PASSED] xe_rtp_process_tests ===============
stty: 'standard input': Inappropriate ioctl for device
[19:22:41] ===================== [PASSED] xe_rtp ======================
[19:22:41] ==================== xe_wa (1 subtest) =====================
[19:22:41] ======================== xe_wa_gt  =========================
[19:22:41] [PASSED] TIGERLAKE (B0)
[19:22:41] [PASSED] DG1 (A0)
[19:22:41] [PASSED] DG1 (B0)
[19:22:41] [PASSED] ALDERLAKE_S (A0)
[19:22:41] [PASSED] ALDERLAKE_S (B0)
[19:22:41] [PASSED] ALDERLAKE_S (C0)
[19:22:41] [PASSED] ALDERLAKE_S (D0)
[19:22:41] [PASSED] ALDERLAKE_P (A0)
[19:22:41] [PASSED] ALDERLAKE_P (B0)
[19:22:41] [PASSED] ALDERLAKE_P (C0)
[19:22:41] [PASSED] ALDERLAKE_S_RPLS (D0)
[19:22:41] [PASSED] ALDERLAKE_P_RPLU (E0)
[19:22:41] [PASSED] DG2_G10 (C0)
[19:22:41] [PASSED] DG2_G11 (B1)
[19:22:41] [PASSED] DG2_G12 (A1)
[19:22:41] [PASSED] METEORLAKE (g:A0, m:A0)
[19:22:41] [PASSED] METEORLAKE (g:A0, m:A0)
[19:22:41] [PASSED] METEORLAKE (g:A0, m:A0)
[19:22:41] [PASSED] LUNARLAKE (g:A0, m:A0)
[19:22:41] [PASSED] LUNARLAKE (g:B0, m:A0)
[19:22:41] ==================== [PASSED] xe_wa_gt =====================
[19:22:41] ====================== [PASSED] xe_wa ======================
[19:22:41] ============================================================
[19:22:41] Testing complete. Ran 109 tests: passed: 95, skipped: 14
[19:22:41] Elapsed time: 29.940s total, 4.219s configuring, 25.451s building, 0.217s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[19:22:42] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:22:43] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
  156 | u64 ioread64_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:163:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
  163 | u64 ioread64_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:170:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
  170 | u64 ioread64be_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:178:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
  178 | u64 ioread64be_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:264:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
  264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:272:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
  272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:280:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
  280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
../lib/iomap.c:288:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
  288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~

[19:23:05] Starting KUnit Kernel (1/1)...
[19:23:05] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[19:23:05] ============ drm_test_pick_cmdline (2 subtests) ============
[19:23:05] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[19:23:05] =============== drm_test_pick_cmdline_named  ===============
[19:23:05] [PASSED] NTSC
[19:23:05] [PASSED] NTSC-J
[19:23:05] [PASSED] PAL
[19:23:05] [PASSED] PAL-M
[19:23:05] =========== [PASSED] drm_test_pick_cmdline_named ===========
[19:23:05] ============== [PASSED] drm_test_pick_cmdline ==============
[19:23:05] ================== drm_buddy (7 subtests) ==================
[19:23:05] [PASSED] drm_test_buddy_alloc_limit
[19:23:05] [PASSED] drm_test_buddy_alloc_optimistic
[19:23:05] [PASSED] drm_test_buddy_alloc_pessimistic
[19:23:05] [PASSED] drm_test_buddy_alloc_pathological
[19:23:05] [PASSED] drm_test_buddy_alloc_contiguous
[19:23:05] [PASSED] drm_test_buddy_alloc_clear
[19:23:05] [PASSED] drm_test_buddy_alloc_range_bias
[19:23:05] ==================== [PASSED] drm_buddy ====================
[19:23:05] ============= drm_cmdline_parser (40 subtests) =============
[19:23:05] [PASSED] drm_test_cmdline_force_d_only
[19:23:05] [PASSED] drm_test_cmdline_force_D_only_dvi
[19:23:05] [PASSED] drm_test_cmdline_force_D_only_hdmi
[19:23:05] [PASSED] drm_test_cmdline_force_D_only_not_digital
[19:23:05] [PASSED] drm_test_cmdline_force_e_only
[19:23:05] [PASSED] drm_test_cmdline_res
[19:23:05] [PASSED] drm_test_cmdline_res_vesa
[19:23:05] [PASSED] drm_test_cmdline_res_vesa_rblank
[19:23:05] [PASSED] drm_test_cmdline_res_rblank
[19:23:05] [PASSED] drm_test_cmdline_res_bpp
[19:23:05] [PASSED] drm_test_cmdline_res_refresh
[19:23:05] [PASSED] drm_test_cmdline_res_bpp_refresh
[19:23:05] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[19:23:05] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[19:23:05] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[19:23:05] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[19:23:05] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[19:23:05] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[19:23:05] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[19:23:05] [PASSED] drm_test_cmdline_res_margins_force_on
[19:23:05] [PASSED] drm_test_cmdline_res_vesa_margins
[19:23:05] [PASSED] drm_test_cmdline_name
[19:23:05] [PASSED] drm_test_cmdline_name_bpp
[19:23:05] [PASSED] drm_test_cmdline_name_option
[19:23:05] [PASSED] drm_test_cmdline_name_bpp_option
[19:23:05] [PASSED] drm_test_cmdline_rotate_0
[19:23:05] [PASSED] drm_test_cmdline_rotate_90
[19:23:05] [PASSED] drm_test_cmdline_rotate_180
[19:23:05] [PASSED] drm_test_cmdline_rotate_270
[19:23:05] [PASSED] drm_test_cmdline_hmirror
[19:23:05] [PASSED] drm_test_cmdline_vmirror
[19:23:05] [PASSED] drm_test_cmdline_margin_options
[19:23:05] [PASSED] drm_test_cmdline_multiple_options
[19:23:05] [PASSED] drm_test_cmdline_bpp_extra_and_option
[19:23:05] [PASSED] drm_test_cmdline_extra_and_option
[19:23:05] [PASSED] drm_test_cmdline_freestanding_options
[19:23:05] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[19:23:05] [PASSED] drm_test_cmdline_panel_orientation
[19:23:05] ================ drm_test_cmdline_invalid  =================
[19:23:05] [PASSED] margin_only
[19:23:05] [PASSED] interlace_only
[19:23:05] [PASSED] res_missing_x
[19:23:05] [PASSED] res_missing_y
[19:23:05] [PASSED] res_bad_y
[19:23:05] [PASSED] res_missing_y_bpp
[19:23:05] [PASSED] res_bad_bpp
[19:23:05] [PASSED] res_bad_refresh
[19:23:05] [PASSED] res_bpp_refresh_force_on_off
[19:23:05] [PASSED] res_invalid_mode
[19:23:05] [PASSED] res_bpp_wrong_place_mode
[19:23:05] [PASSED] name_bpp_refresh
[19:23:05] [PASSED] name_refresh
[19:23:05] [PASSED] name_refresh_wrong_mode
[19:23:05] [PASSED] name_refresh_invalid_mode
[19:23:05] [PASSED] rotate_multiple
[19:23:05] [PASSED] rotate_invalid_val
[19:23:05] [PASSED] rotate_truncated
[19:23:05] [PASSED] invalid_option
[19:23:05] [PASSED] invalid_tv_option
[19:23:05] [PASSED] truncated_tv_option
[19:23:05] ============ [PASSED] drm_test_cmdline_invalid =============
[19:23:05] =============== drm_test_cmdline_tv_options  ===============
[19:23:05] [PASSED] NTSC
[19:23:05] [PASSED] NTSC_443
[19:23:05] [PASSED] NTSC_J
[19:23:05] [PASSED] PAL
[19:23:05] [PASSED] PAL_M
[19:23:05] [PASSED] PAL_N
[19:23:05] [PASSED] SECAM
[19:23:05] =========== [PASSED] drm_test_cmdline_tv_options ===========
[19:23:05] =============== [PASSED] drm_cmdline_parser ================
[19:23:05] ========== drmm_connector_hdmi_init (19 subtests) ==========
[19:23:05] [PASSED] drm_test_connector_hdmi_init_valid
[19:23:05] [PASSED] drm_test_connector_hdmi_init_bpc_8
[19:23:05] [PASSED] drm_test_connector_hdmi_init_bpc_10
[19:23:05] [PASSED] drm_test_connector_hdmi_init_bpc_12
[19:23:05] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[19:23:05] [PASSED] drm_test_connector_hdmi_init_bpc_null
[19:23:05] [PASSED] drm_test_connector_hdmi_init_formats_empty
[19:23:05] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[19:23:05] [PASSED] drm_test_connector_hdmi_init_null_ddc
[19:23:05] [PASSED] drm_test_connector_hdmi_init_null_product
[19:23:05] [PASSED] drm_test_connector_hdmi_init_null_vendor
[19:23:05] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[19:23:05] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[19:23:05] [PASSED] drm_test_connector_hdmi_init_product_valid
[19:23:05] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[19:23:05] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[19:23:05] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[19:23:05] ========= drm_test_connector_hdmi_init_type_valid  =========
[19:23:05] [PASSED] HDMI-A
[19:23:05] [PASSED] HDMI-B
[19:23:05] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[19:23:05] ======== drm_test_connector_hdmi_init_type_invalid  ========
[19:23:05] [PASSED] Unknown
[19:23:05] [PASSED] VGA
[19:23:05] [PASSED] DVI-I
[19:23:05] [PASSED] DVI-D
[19:23:05] [PASSED] DVI-A
[19:23:05] [PASSED] Composite
[19:23:05] [PASSED] SVIDEO
[19:23:05] [PASSED] LVDS
[19:23:05] [PASSED] Component
[19:23:05] [PASSED] DIN
[19:23:05] [PASSED] DP
[19:23:05] [PASSED] TV
[19:23:05] [PASSED] eDP
[19:23:05] [PASSED] Virtual
[19:23:05] [PASSED] DSI
[19:23:05] [PASSED] DPI
[19:23:05] [PASSED] Writeback
[19:23:05] [PASSED] SPI
[19:23:05] [PASSED] USB
[19:23:05] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[19:23:05] ============ [PASSED] drmm_connector_hdmi_init =============
[19:23:05] ============= drmm_connector_init (3 subtests) =============
[19:23:05] [PASSED] drm_test_drmm_connector_init
[19:23:05] [PASSED] drm_test_drmm_connector_init_null_ddc
[19:23:05] ========= drm_test_drmm_connector_init_type_valid  =========
[19:23:05] [PASSED] Unknown
[19:23:05] [PASSED] VGA
[19:23:05] [PASSED] DVI-I
[19:23:05] [PASSED] DVI-D
[19:23:05] [PASSED] DVI-A
[19:23:05] [PASSED] Composite
[19:23:05] [PASSED] SVIDEO
[19:23:05] [PASSED] LVDS
[19:23:05] [PASSED] Component
[19:23:05] [PASSED] DIN
[19:23:05] [PASSED] DP
[19:23:05] [PASSED] HDMI-A
[19:23:05] [PASSED] HDMI-B
[19:23:05] [PASSED] TV
[19:23:05] [PASSED] eDP
[19:23:05] [PASSED] Virtual
[19:23:05] [PASSED] DSI
[19:23:05] [PASSED] DPI
[19:23:05] [PASSED] Writeback
[19:23:05] [PASSED] SPI
[19:23:05] [PASSED] USB
[19:23:05] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[19:23:05] =============== [PASSED] drmm_connector_init ===============
[19:23:05] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[19:23:05] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[19:23:05] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[19:23:05] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[19:23:05] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[19:23:05] ========== drm_test_get_tv_mode_from_name_valid  ===========
[19:23:05] [PASSED] NTSC
[19:23:05] [PASSED] NTSC-443
[19:23:05] [PASSED] NTSC-J
[19:23:05] [PASSED] PAL
[19:23:05] [PASSED] PAL-M
[19:23:05] [PASSED] PAL-N
[19:23:05] [PASSED] SECAM
[19:23:05] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[19:23:05] [PASSED] drm_test_get_tv_mode_from_name_truncated
[19:23:05] ============ [PASSED] drm_get_tv_mode_from_name ============
[19:23:05] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[19:23:05] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[19:23:05] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[19:23:05] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[19:23:05] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[19:23:05] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[19:23:05] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[19:23:05] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[19:23:05] [PASSED] VIC 96
[19:23:05] [PASSED] VIC 97
[19:23:05] [PASSED] VIC 101
[19:23:05] [PASSED] VIC 102
[19:23:05] [PASSED] VIC 106
[19:23:05] [PASSED] VIC 107
[19:23:05] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[19:23:05] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[19:23:05] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[19:23:05] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[19:23:05] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[19:23:05] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[19:23:05] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[19:23:05] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[19:23:05] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[19:23:05] [PASSED] Automatic
[19:23:05] [PASSED] Full
[19:23:05] [PASSED] Limited 16:235
[19:23:05] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[19:23:05] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[19:23:05] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[19:23:05] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[19:23:05] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[19:23:05] [PASSED] RGB
[19:23:05] [PASSED] YUV 4:2:0
[19:23:05] [PASSED] YUV 4:2:2
[19:23:05] [PASSED] YUV 4:4:4
[19:23:05] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[19:23:05] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[19:23:05] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[19:23:05] ============= drm_damage_helper (21 subtests) ==============
[19:23:05] [PASSED] drm_test_damage_iter_no_damage
[19:23:05] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[19:23:05] [PASSED] drm_test_damage_iter_no_damage_src_moved
[19:23:05] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[19:23:05] [PASSED] drm_test_damage_iter_no_damage_not_visible
[19:23:05] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[19:23:05] [PASSED] drm_test_damage_iter_no_damage_no_fb
[19:23:05] [PASSED] drm_test_damage_iter_simple_damage
[19:23:05] [PASSED] drm_test_damage_iter_single_damage
[19:23:05] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[19:23:05] [PASSED] drm_test_damage_iter_single_damage_outside_src
[19:23:05] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[19:23:05] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[19:23:05] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[19:23:05] [PASSED] drm_test_damage_iter_single_damage_src_moved
[19:23:05] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[19:23:05] [PASSED] drm_test_damage_iter_damage
[19:23:05] [PASSED] drm_test_damage_iter_damage_one_intersect
[19:23:05] [PASSED] drm_test_damage_iter_damage_one_outside
[19:23:05] [PASSED] drm_test_damage_iter_damage_src_moved
[19:23:05] [PASSED] drm_test_damage_iter_damage_not_visible
[19:23:05] ================ [PASSED] drm_damage_helper ================
[19:23:05] ============== drm_dp_mst_helper (3 subtests) ==============
[19:23:05] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[19:23:05] [PASSED] Clock 154000 BPP 30 DSC disabled
[19:23:05] [PASSED] Clock 234000 BPP 30 DSC disabled
[19:23:05] [PASSED] Clock 297000 BPP 24 DSC disabled
[19:23:05] [PASSED] Clock 332880 BPP 24 DSC enabled
[19:23:05] [PASSED] Clock 324540 BPP 24 DSC enabled
[19:23:05] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[19:23:05] ============== drm_test_dp_mst_calc_pbn_div  ===============
[19:23:05] [PASSED] Link rate 2000000 lane count 4
[19:23:05] [PASSED] Link rate 2000000 lane count 2
[19:23:05] [PASSED] Link rate 2000000 lane count 1
[19:23:05] [PASSED] Link rate 1350000 lane count 4
[19:23:05] [PASSED] Link rate 1350000 lane count 2
[19:23:05] [PASSED] Link rate 1350000 lane count 1
[19:23:05] [PASSED] Link rate 1000000 lane count 4
[19:23:05] [PASSED] Link rate 1000000 lane count 2
[19:23:05] [PASSED] Link rate 1000000 lane count 1
[19:23:05] [PASSED] Link rate 810000 lane count 4
[19:23:05] [PASSED] Link rate 810000 lane count 2
[19:23:05] [PASSED] Link rate 810000 lane count 1
[19:23:05] [PASSED] Link rate 540000 lane count 4
[19:23:05] [PASSED] Link rate 540000 lane count 2
[19:23:05] [PASSED] Link rate 540000 lane count 1
[19:23:05] [PASSED] Link rate 270000 lane count 4
[19:23:05] [PASSED] Link rate 270000 lane count 2
[19:23:05] [PASSED] Link rate 270000 lane count 1
[19:23:05] [PASSED] Link rate 162000 lane count 4
[19:23:05] [PASSED] Link rate 162000 lane count 2
[19:23:05] [PASSED] Link rate 162000 lane count 1
[19:23:05] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[19:23:05] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[19:23:05] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[19:23:05] [PASSED] DP_POWER_UP_PHY with port number
[19:23:05] [PASSED] DP_POWER_DOWN_PHY with port number
[19:23:05] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[19:23:05] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[19:23:05] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[19:23:05] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[19:23:05] [PASSED] DP_QUERY_PAYLOAD with port number
[19:23:05] [PASSED] DP_QUERY_PAYLOAD with VCPI
[19:23:05] [PASSED] DP_REMOTE_DPCD_READ with port number
[19:23:05] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[19:23:05] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[19:23:05] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[19:23:05] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[19:23:05] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[19:23:05] [PASSED] DP_REMOTE_I2C_READ with port number
[19:23:05] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[19:23:05] [PASSED] DP_REMOTE_I2C_READ with transactions array
[19:23:05] [PASSED] DP_REMOTE_I2C_WRITE with port number
[19:23:05] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[19:23:05] [PASSED] DP_REMOTE_I2C_WRITE with data array
[19:23:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[19:23:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[19:23:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[19:23:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[19:23:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[19:23:05] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[19:23:05] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[19:23:05] ================ [PASSED] drm_dp_mst_helper ================
[19:23:05] ================== drm_exec (7 subtests) ===================
[19:23:05] [PASSED] sanitycheck
[19:23:05] [PASSED] test_lock
[19:23:05] [PASSED] test_lock_unlock
[19:23:05] [PASSED] test_duplicates
[19:23:05] [PASSED] test_prepare
[19:23:05] [PASSED] test_prepare_array
[19:23:05] [PASSED] test_multiple_loops
[19:23:05] ==================== [PASSED] drm_exec =====================
[19:23:05] =========== drm_format_helper_test (17 subtests) ===========
[19:23:05] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[19:23:05] [PASSED] single_pixel_source_buffer
[19:23:05] [PASSED] single_pixel_clip_rectangle
[19:23:05] [PASSED] well_known_colors
[19:23:05] [PASSED] destination_pitch
[19:23:05] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[19:23:05] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[19:23:05] [PASSED] single_pixel_source_buffer
[19:23:05] [PASSED] single_pixel_clip_rectangle
[19:23:05] [PASSED] well_known_colors
[19:23:05] [PASSED] destination_pitch
[19:23:05] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[19:23:05] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[19:23:05] [PASSED] single_pixel_source_buffer
[19:23:05] [PASSED] single_pixel_clip_rectangle
[19:23:05] [PASSED] well_known_colors
[19:23:05] [PASSED] destination_pitch
[19:23:05] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[19:23:05] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[19:23:05] [PASSED] single_pixel_source_buffer
[19:23:05] [PASSED] single_pixel_clip_rectangle
[19:23:05] [PASSED] well_known_colors
[19:23:05] [PASSED] destination_pitch
[19:23:05] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[19:23:05] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[19:23:05] [PASSED] single_pixel_source_buffer
[19:23:05] [PASSED] single_pixel_clip_rectangle
[19:23:05] [PASSED] well_known_colors
[19:23:05] [PASSED] destination_pitch
[19:23:05] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[19:23:05] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[19:23:05] [PASSED] single_pixel_source_buffer
[19:23:05] [PASSED] single_pixel_clip_rectangle
[19:23:05] [PASSED] well_known_colors
[19:23:05] [PASSED] destination_pitch
[19:23:05] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[19:23:05] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[19:23:05] [PASSED] single_pixel_source_buffer
[19:23:05] [PASSED] single_pixel_clip_rectangle
[19:23:05] [PASSED] well_known_colors
[19:23:05] [PASSED] destination_pitch
[19:23:05] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[19:23:05] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[19:23:05] [PASSED] single_pixel_source_buffer
[19:23:05] [PASSED] single_pixel_clip_rectangle
[19:23:05] [PASSED] well_known_colors
[19:23:05] [PASSED] destination_pitch
[19:23:05] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[19:23:05] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[19:23:05] [PASSED] single_pixel_source_buffer
[19:23:05] [PASSED] single_pixel_clip_rectangle
[19:23:05] [PASSED] well_known_colors
[19:23:05] [PASSED] destination_pitch
[19:23:05] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[19:23:05] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[19:23:05] [PASSED] single_pixel_source_buffer
[19:23:05] [PASSED] single_pixel_clip_rectangle
[19:23:05] [PASSED] well_known_colors
[19:23:05] [PASSED] destination_pitch
[19:23:05] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[19:23:05] ============== drm_test_fb_xrgb8888_to_mono  ===============
[19:23:05] [PASSED] single_pixel_source_buffer
[19:23:05] [PASSED] single_pixel_clip_rectangle
[19:23:05] [PASSED] well_known_colors
[19:23:05] [PASSED] destination_pitch
[19:23:05] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[19:23:05] ==================== drm_test_fb_swab  =====================
[19:23:05] [PASSED] single_pixel_source_buffer
[19:23:05] [PASSED] single_pixel_clip_rectangle
[19:23:05] [PASSED] well_known_colors
[19:23:05] [PASSED] destination_pitch
[19:23:05] ================ [PASSED] drm_test_fb_swab =================
[19:23:05] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[19:23:05] [PASSED] single_pixel_source_buffer
[19:23:05] [PASSED] single_pixel_clip_rectangle
[19:23:05] [PASSED] well_known_colors
[19:23:05] [PASSED] destination_pitch
[19:23:05] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[19:23:05] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[19:23:05] [PASSED] single_pixel_source_buffer
[19:23:05] [PASSED] single_pixel_clip_rectangle
[19:23:05] [PASSED] well_known_colors
[19:23:05] [PASSED] destination_pitch
[19:23:05] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[19:23:05] ================= drm_test_fb_clip_offset  =================
[19:23:05] [PASSED] pass through
[19:23:05] [PASSED] horizontal offset
[19:23:05] [PASSED] vertical offset
[19:23:05] [PASSED] horizontal and vertical offset
[19:23:05] [PASSED] horizontal offset (custom pitch)
[19:23:05] [PASSED] vertical offset (custom pitch)
[19:23:05] [PASSED] horizontal and vertical offset (custom pitch)
[19:23:05] ============= [PASSED] drm_test_fb_clip_offset =============
[19:23:05] ============== drm_test_fb_build_fourcc_list  ==============
[19:23:05] [PASSED] no native formats
[19:23:05] [PASSED] XRGB8888 as native format
[19:23:05] [PASSED] remove duplicates
[19:23:05] [PASSED] convert alpha formats
[19:23:05] [PASSED] random formats
[19:23:05] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[19:23:05] =================== drm_test_fb_memcpy  ====================
[19:23:05] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[19:23:05] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[19:23:05] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[19:23:05] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[19:23:05] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[19:23:05] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[19:23:05] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[19:23:05] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[19:23:05] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[19:23:05] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[19:23:05] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[19:23:05] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[19:23:05] =============== [PASSED] drm_test_fb_memcpy ================
[19:23:05] ============= [PASSED] drm_format_helper_test ==============
[19:23:05] ================= drm_format (18 subtests) =================
[19:23:05] [PASSED] drm_test_format_block_width_invalid
[19:23:05] [PASSED] drm_test_format_block_width_one_plane
[19:23:05] [PASSED] drm_test_format_block_width_two_plane
[19:23:05] [PASSED] drm_test_format_block_width_three_plane
[19:23:05] [PASSED] drm_test_format_block_width_tiled
[19:23:05] [PASSED] drm_test_format_block_height_invalid
[19:23:05] [PASSED] drm_test_format_block_height_one_plane
[19:23:05] [PASSED] drm_test_format_block_height_two_plane
[19:23:05] [PASSED] drm_test_format_block_height_three_plane
[19:23:05] [PASSED] drm_test_format_block_height_tiled
[19:23:05] [PASSED] drm_test_format_min_pitch_invalid
[19:23:05] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[19:23:05] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[19:23:05] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[19:23:05] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[19:23:05] [PASSED] drm_test_format_min_pitch_two_plane
[19:23:05] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[19:23:05] [PASSED] drm_test_format_min_pitch_tiled
[19:23:05] =================== [PASSED] drm_format ====================
[19:23:05] =============== drm_framebuffer (1 subtest) ================
[19:23:05] =============== drm_test_framebuffer_create  ===============
[19:23:05] [PASSED] ABGR8888 normal sizes
[19:23:05] [PASSED] ABGR8888 max sizes
[19:23:05] [PASSED] ABGR8888 pitch greater than min required
[19:23:05] [PASSED] ABGR8888 pitch less than min required
[19:23:05] [PASSED] ABGR8888 Invalid width
[19:23:05] [PASSED] ABGR8888 Invalid buffer handle
[19:23:05] [PASSED] No pixel format
[19:23:05] [PASSED] ABGR8888 Width 0
[19:23:05] [PASSED] ABGR8888 Height 0
[19:23:05] [PASSED] ABGR8888 Out of bound height * pitch combination
[19:23:05] [PASSED] ABGR8888 Large buffer offset
[19:23:05] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[19:23:05] [PASSED] ABGR8888 Valid buffer modifier
[19:23:05] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[19:23:05] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[19:23:05] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[19:23:05] [PASSED] NV12 Normal sizes
[19:23:05] [PASSED] NV12 Max sizes
[19:23:05] [PASSED] NV12 Invalid pitch
[19:23:05] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[19:23:05] [PASSED] NV12 different  modifier per-plane
[19:23:05] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[19:23:05] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[19:23:05] [PASSED] NV12 Modifier for inexistent plane
[19:23:05] [PASSED] NV12 Handle for inexistent plane
[19:23:05] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[19:23:05] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[19:23:05] [PASSED] YVU420 Normal sizes
[19:23:05] [PASSED] YVU420 Max sizes
[19:23:05] [PASSED] YVU420 Invalid pitch
[19:23:05] [PASSED] YVU420 Different pitches
[19:23:05] [PASSED] YVU420 Different buffer offsets/pitches
[19:23:05] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[19:23:05] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[19:23:05] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[19:23:05] [PASSED] YVU420 Valid modifier
[19:23:05] [PASSED] YVU420 Different modifiers per plane
[19:23:05] [PASSED] YVU420 Modifier for inexistent plane
[19:23:05] [PASSED] X0L2 Normal sizes
[19:23:05] [PASSED] X0L2 Max sizes
[19:23:05] [PASSED] X0L2 Invalid pitch
[19:23:05] [PASSED] X0L2 Pitch greater than minimum required
[19:23:05] [PASSED] X0L2 Handle for inexistent plane
[19:23:05] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[19:23:05] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[19:23:05] [PASSED] X0L2 Valid modifier
[19:23:05] [PASSED] X0L2 Modifier for inexistent plane
[19:23:05] =========== [PASSED] drm_test_framebuffer_create ===========
[19:23:05] ================= [PASSED] drm_framebuffer =================
[19:23:05] ================ drm_gem_shmem (8 subtests) ================
[19:23:05] [PASSED] drm_gem_shmem_test_obj_create
[19:23:05] [PASSED] drm_gem_shmem_test_obj_create_private
[19:23:05] [PASSED] drm_gem_shmem_test_pin_pages
[19:23:05] [PASSED] drm_gem_shmem_test_vmap
[19:23:05] [PASSED] drm_gem_shmem_test_get_pages_sgt
[19:23:05] [PASSED] drm_gem_shmem_test_get_sg_table
[19:23:05] [PASSED] drm_gem_shmem_test_madvise
[19:23:05] [PASSED] drm_gem_shmem_test_purge
[19:23:05] ================== [PASSED] drm_gem_shmem ==================
[19:23:05] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[19:23:05] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[19:23:05] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[19:23:05] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[19:23:05] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[19:23:05] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[19:23:05] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[19:23:05] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[19:23:05] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[19:23:05] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[19:23:05] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[19:23:05] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[19:23:05] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[19:23:05] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[19:23:05] [PASSED] drm_test_check_output_bpc_dvi
[19:23:05] [PASSED] drm_test_check_output_bpc_format_vic_1
[19:23:05] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[19:23:05] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[19:23:05] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[19:23:05] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[19:23:05] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[19:23:05] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[19:23:05] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[19:23:05] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[19:23:05] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[19:23:05] [PASSED] drm_test_check_broadcast_rgb_value
[19:23:05] [PASSED] drm_test_check_bpc_8_value
[19:23:05] [PASSED] drm_test_check_bpc_10_value
[19:23:05] [PASSED] drm_test_check_bpc_12_value
[19:23:05] [PASSED] drm_test_check_format_value
[19:23:05] [PASSED] drm_test_check_tmds_char_value
[19:23:05] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[19:23:05] ================= drm_managed (2 subtests) =================
[19:23:05] [PASSED] drm_test_managed_release_action
[19:23:05] [PASSED] drm_test_managed_run_action
[19:23:05] =================== [PASSED] drm_managed ===================
[19:23:05] =================== drm_mm (6 subtests) ====================
[19:23:05] [PASSED] drm_test_mm_init
[19:23:05] [PASSED] drm_test_mm_debug
[19:23:05] [PASSED] drm_test_mm_align32
[19:23:05] [PASSED] drm_test_mm_align64
[19:23:05] [PASSED] drm_test_mm_lowest
[19:23:05] [PASSED] drm_test_mm_highest
[19:23:05] ===================== [PASSED] drm_mm ======================
[19:23:05] ============= drm_modes_analog_tv (4 subtests) =============
[19:23:05] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[19:23:05] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[19:23:05] [PASSED] drm_test_modes_analog_tv_pal_576i
[19:23:05] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[19:23:05] =============== [PASSED] drm_modes_analog_tv ===============
[19:23:05] ============== drm_plane_helper (2 subtests) ===============
[19:23:05] =============== drm_test_check_plane_state  ================
[19:23:05] [PASSED] clipping_simple
[19:23:05] [PASSED] clipping_rotate_reflect
[19:23:05] [PASSED] positioning_simple
[19:23:05] [PASSED] upscaling
[19:23:05] [PASSED] downscaling
[19:23:05] [PASSED] rounding1
[19:23:05] [PASSED] rounding2
[19:23:05] [PASSED] rounding3
[19:23:05] [PASSED] rounding4
[19:23:05] =========== [PASSED] drm_test_check_plane_state ============
[19:23:05] =========== drm_test_check_invalid_plane_state  ============
[19:23:05] [PASSED] positioning_invalid
[19:23:05] [PASSED] upscaling_invalid
[19:23:05] [PASSED] downscaling_invalid
[19:23:05] ======= [PASSED] drm_test_check_invalid_plane_state ========
[19:23:05] ================ [PASSED] drm_plane_helper =================
stty: 'standard input': Inappropriate ioctl for device
[19:23:05] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[19:23:05] ====== drm_test_connector_helper_tv_get_modes_check  =======
[19:23:05] [PASSED] None
[19:23:05] [PASSED] PAL
[19:23:05] [PASSED] NTSC
[19:23:05] [PASSED] Both, NTSC Default
[19:23:05] [PASSED] Both, PAL Default
[19:23:05] [PASSED] Both, NTSC Default, with PAL on command-line
[19:23:05] [PASSED] Both, PAL Default, with NTSC on command-line
[19:23:05] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[19:23:05] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[19:23:05] ================== drm_rect (9 subtests) ===================
[19:23:05] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[19:23:05] [PASSED] drm_test_rect_clip_scaled_not_clipped
[19:23:05] [PASSED] drm_test_rect_clip_scaled_clipped
[19:23:05] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[19:23:05] ================= drm_test_rect_intersect  =================
[19:23:05] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[19:23:05] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[19:23:05] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[19:23:05] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[19:23:05] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[19:23:05] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[19:23:05] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[19:23:05] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[19:23:05] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[19:23:05] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[19:23:05] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[19:23:05] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[19:23:05] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[19:23:05] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[19:23:05] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[19:23:05] ============= [PASSED] drm_test_rect_intersect =============
[19:23:05] ================ drm_test_rect_calc_hscale  ================
[19:23:05] [PASSED] normal use
[19:23:05] [PASSED] out of max range
[19:23:05] [PASSED] out of min range
[19:23:05] [PASSED] zero dst
[19:23:05] [PASSED] negative src
[19:23:05] [PASSED] negative dst
[19:23:05] ============ [PASSED] drm_test_rect_calc_hscale ============
[19:23:05] ================ drm_test_rect_calc_vscale  ================
[19:23:05] [PASSED] normal use
[19:23:05] [PASSED] out of max range
[19:23:05] [PASSED] out of min range
[19:23:05] [PASSED] zero dst
[19:23:05] [PASSED] negative src
[19:23:05] [PASSED] negative dst
[19:23:05] ============ [PASSED] drm_test_rect_calc_vscale ============
[19:23:05] ================== drm_test_rect_rotate  ===================
[19:23:05] [PASSED] reflect-x
[19:23:05] [PASSED] reflect-y
[19:23:05] [PASSED] rotate-0
[19:23:05] [PASSED] rotate-90
[19:23:05] [PASSED] rotate-180
[19:23:05] [PASSED] rotate-270
[19:23:05] ============== [PASSED] drm_test_rect_rotate ===============
[19:23:05] ================ drm_test_rect_rotate_inv  =================
[19:23:05] [PASSED] reflect-x
[19:23:05] [PASSED] reflect-y
[19:23:05] [PASSED] rotate-0
[19:23:05] [PASSED] rotate-90
[19:23:05] [PASSED] rotate-180
[19:23:05] [PASSED] rotate-270
[19:23:05] ============ [PASSED] drm_test_rect_rotate_inv =============
[19:23:05] ==================== [PASSED] drm_rect =====================
[19:23:05] ============================================================
[19:23:05] Testing complete. Ran 511 tests: passed: 511
[19:23:05] Elapsed time: 23.433s total, 1.725s configuring, 21.489s building, 0.203s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


