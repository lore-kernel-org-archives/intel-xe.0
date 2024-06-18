Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE363C2BA18
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 12:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB4D10E677;
	Tue, 18 Jun 2024 12:58:47 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35B010E674;
 Tue, 18 Jun 2024 12:58:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_series_starting_with_=5Bv2=2C1?=
 =?utf-8?q?/3=5D_drm/i915=3A_Move_encoder_suspend/shutdown_helpers_to_intel?=
 =?utf-8?q?=5Fencoder=2Ec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jun 2024 12:58:45 -0000
Message-ID: <171871552592.103670.13554662615271558992@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240618125255.4080303-1-imre.deak@intel.com>
In-Reply-To: <20240618125255.4080303-1-imre.deak@intel.com>
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

Series: series starting with [v2,1/3] drm/i915: Move encoder suspend/shutdown helpers to intel_encoder.c
URL   : https://patchwork.freedesktop.org/series/135013/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[12:57:39] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:57:43] Building KUnit Kernel ...
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

[12:58:09] Starting KUnit Kernel (1/1)...
[12:58:09] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[12:58:09] =================== guc_dbm (7 subtests) ===================
[12:58:09] [PASSED] test_empty
[12:58:09] [PASSED] test_default
[12:58:09] ======================== test_size  ========================
[12:58:09] [PASSED] 4
[12:58:09] [PASSED] 8
[12:58:09] [PASSED] 32
[12:58:09] [PASSED] 256
[12:58:09] ==================== [PASSED] test_size ====================
[12:58:09] ======================= test_reuse  ========================
[12:58:09] [PASSED] 4
[12:58:09] [PASSED] 8
[12:58:09] [PASSED] 32
[12:58:09] [PASSED] 256
[12:58:09] =================== [PASSED] test_reuse ====================
[12:58:09] =================== test_range_overlap  ====================
[12:58:09] [PASSED] 4
[12:58:09] [PASSED] 8
[12:58:09] [PASSED] 32
[12:58:09] [PASSED] 256
[12:58:09] =============== [PASSED] test_range_overlap ================
[12:58:09] =================== test_range_compact  ====================
[12:58:09] [PASSED] 4
[12:58:09] [PASSED] 8
[12:58:09] [PASSED] 32
[12:58:09] [PASSED] 256
[12:58:09] =============== [PASSED] test_range_compact ================
[12:58:09] ==================== test_range_spare  =====================
[12:58:09] [PASSED] 4
[12:58:09] [PASSED] 8
[12:58:09] [PASSED] 32
[12:58:09] [PASSED] 256
[12:58:09] ================ [PASSED] test_range_spare =================
[12:58:09] ===================== [PASSED] guc_dbm =====================
[12:58:09] =================== guc_idm (6 subtests) ===================
[12:58:09] [PASSED] bad_init
[12:58:09] [PASSED] no_init
[12:58:09] [PASSED] init_fini
[12:58:09] [PASSED] check_used
[12:58:09] [PASSED] check_quota
[12:58:09] [PASSED] check_all
[12:58:09] ===================== [PASSED] guc_idm =====================
[12:58:09] ================== no_relay (3 subtests) ===================
[12:58:09] [PASSED] xe_drops_guc2pf_if_not_ready
[12:58:09] [PASSED] xe_drops_guc2vf_if_not_ready
[12:58:09] [PASSED] xe_rejects_send_if_not_ready
[12:58:09] ==================== [PASSED] no_relay =====================
[12:58:09] ================== pf_relay (14 subtests) ==================
[12:58:09] [PASSED] pf_rejects_guc2pf_too_short
[12:58:09] [PASSED] pf_rejects_guc2pf_too_long
[12:58:09] [PASSED] pf_rejects_guc2pf_no_payload
[12:58:09] [PASSED] pf_fails_no_payload
[12:58:09] [PASSED] pf_fails_bad_origin
[12:58:09] [PASSED] pf_fails_bad_type
[12:58:09] [PASSED] pf_txn_reports_error
[12:58:09] [PASSED] pf_txn_sends_pf2guc
[12:58:09] [PASSED] pf_sends_pf2guc
[12:58:09] [SKIPPED] pf_loopback_nop
[12:58:09] [SKIPPED] pf_loopback_echo
[12:58:09] [SKIPPED] pf_loopback_fail
[12:58:09] [SKIPPED] pf_loopback_busy
[12:58:09] [SKIPPED] pf_loopback_retry
[12:58:09] ==================== [PASSED] pf_relay =====================
[12:58:09] ================== vf_relay (3 subtests) ===================
[12:58:09] [PASSED] vf_rejects_guc2vf_too_short
[12:58:09] [PASSED] vf_rejects_guc2vf_too_long
[12:58:09] [PASSED] vf_rejects_guc2vf_no_payload
[12:58:09] ==================== [PASSED] vf_relay =====================
[12:58:09] ================= pf_service (11 subtests) =================
[12:58:09] [PASSED] pf_negotiate_any
[12:58:09] [PASSED] pf_negotiate_base_match
[12:58:09] [PASSED] pf_negotiate_base_newer
[12:58:09] [PASSED] pf_negotiate_base_next
[12:58:09] [SKIPPED] pf_negotiate_base_older
[12:58:09] [PASSED] pf_negotiate_base_prev
[12:58:09] [PASSED] pf_negotiate_latest_match
[12:58:09] [PASSED] pf_negotiate_latest_newer
[12:58:09] [PASSED] pf_negotiate_latest_next
[12:58:09] [SKIPPED] pf_negotiate_latest_older
[12:58:09] [SKIPPED] pf_negotiate_latest_prev
[12:58:09] =================== [PASSED] pf_service ====================
[12:58:09] ===================== lmtt (1 subtest) =====================
[12:58:09] ======================== test_ops  =========================
[12:58:09] [PASSED] 2-level
[12:58:09] [PASSED] multi-level
[12:58:09] ==================== [PASSED] test_ops =====================
[12:58:09] ====================== [PASSED] lmtt =======================
[12:58:09] ==================== xe_bo (2 subtests) ====================
[12:58:09] [SKIPPED] xe_ccs_migrate_kunit
[12:58:09] [SKIPPED] xe_bo_evict_kunit
[12:58:09] ===================== [SKIPPED] xe_bo ======================
[12:58:09] ================== xe_dma_buf (1 subtest) ==================
[12:58:09] [SKIPPED] xe_dma_buf_kunit
[12:58:09] =================== [SKIPPED] xe_dma_buf ===================
[12:58:09] ================== xe_migrate (1 subtest) ==================
[12:58:09] [SKIPPED] xe_migrate_sanity_kunit
[12:58:09] =================== [SKIPPED] xe_migrate ===================
[12:58:09] =================== xe_mocs (2 subtests) ===================
[12:58:09] [SKIPPED] xe_live_mocs_kernel_kunit
[12:58:09] [SKIPPED] xe_live_mocs_reset_kunit
[12:58:09] ==================== [SKIPPED] xe_mocs =====================
[12:58:09] ==================== args (11 subtests) ====================
[12:58:09] [PASSED] count_args_test
[12:58:09] [PASSED] call_args_example
[12:58:09] [PASSED] call_args_test
[12:58:09] [PASSED] drop_first_arg_example
[12:58:09] [PASSED] drop_first_arg_test
[12:58:09] [PASSED] first_arg_example
[12:58:09] [PASSED] first_arg_test
[12:58:09] [PASSED] last_arg_example
[12:58:09] [PASSED] last_arg_test
[12:58:09] [PASSED] pick_arg_example
[12:58:09] [PASSED] sep_comma_example
[12:58:09] ====================== [PASSED] args =======================
[12:58:09] =================== xe_pci (2 subtests) ====================
[12:58:09] [PASSED] xe_gmdid_graphics_ip
[12:58:09] [PASSED] xe_gmdid_media_ip
[12:58:09] ===================== [PASSED] xe_pci ======================
[12:58:09] ==================== xe_rtp (1 subtest) ====================
[12:58:09] ================== xe_rtp_process_tests  ===================
[12:58:09] [PASSED] coalesce-same-reg
[12:58:09] [PASSED] no-match-no-add
[12:58:09] [PASSED] no-match-no-add-multiple-rules
[12:58:09] [PASSED] two-regs-two-entries
[12:58:09] [PASSED] clr-one-set-other
[12:58:09] [PASSED] set-field
[12:58:09] [PASSED] conflict-duplicate
[12:58:09] [PASSED] conflict-not-disjoint
[12:58:09] [PASSED] conflict-reg-type
[12:58:09] ============== [PASSED] xe_rtp_process_tests ===============
stty: 'standard input': Inappropriate ioctl for device
[12:58:09] ===================== [PASSED] xe_rtp ======================
[12:58:09] ==================== xe_wa (1 subtest) =====================
[12:58:09] ======================== xe_wa_gt  =========================
[12:58:09] [PASSED] TIGERLAKE (B0)
[12:58:09] [PASSED] DG1 (A0)
[12:58:09] [PASSED] DG1 (B0)
[12:58:09] [PASSED] ALDERLAKE_S (A0)
[12:58:09] [PASSED] ALDERLAKE_S (B0)
[12:58:09] [PASSED] ALDERLAKE_S (C0)
[12:58:09] [PASSED] ALDERLAKE_S (D0)
[12:58:09] [PASSED] ALDERLAKE_P (A0)
[12:58:09] [PASSED] ALDERLAKE_P (B0)
[12:58:09] [PASSED] ALDERLAKE_P (C0)
[12:58:09] [PASSED] ALDERLAKE_S_RPLS (D0)
[12:58:09] [PASSED] ALDERLAKE_P_RPLU (E0)
[12:58:09] [PASSED] DG2_G10 (C0)
[12:58:09] [PASSED] DG2_G11 (B1)
[12:58:09] [PASSED] DG2_G12 (A1)
[12:58:09] [PASSED] METEORLAKE (g:A0, m:A0)
[12:58:09] [PASSED] METEORLAKE (g:A0, m:A0)
[12:58:09] [PASSED] METEORLAKE (g:A0, m:A0)
[12:58:09] [PASSED] LUNARLAKE (g:A0, m:A0)
[12:58:09] [PASSED] LUNARLAKE (g:B0, m:A0)
[12:58:09] ==================== [PASSED] xe_wa_gt =====================
[12:58:09] ====================== [PASSED] xe_wa ======================
[12:58:09] ============================================================
[12:58:09] Testing complete. Ran 109 tests: passed: 95, skipped: 14
[12:58:09] Elapsed time: 29.764s total, 4.235s configuring, 25.256s building, 0.230s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[12:58:09] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:58:11] Building KUnit Kernel ...
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

[12:58:32] Starting KUnit Kernel (1/1)...
[12:58:32] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[12:58:32] ============ drm_test_pick_cmdline (2 subtests) ============
[12:58:32] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[12:58:32] =============== drm_test_pick_cmdline_named  ===============
[12:58:32] [PASSED] NTSC
[12:58:32] [PASSED] NTSC-J
[12:58:32] [PASSED] PAL
[12:58:32] [PASSED] PAL-M
[12:58:32] =========== [PASSED] drm_test_pick_cmdline_named ===========
[12:58:32] ============== [PASSED] drm_test_pick_cmdline ==============
[12:58:32] ================== drm_buddy (7 subtests) ==================
[12:58:32] [PASSED] drm_test_buddy_alloc_limit
[12:58:32] [PASSED] drm_test_buddy_alloc_optimistic
[12:58:32] [PASSED] drm_test_buddy_alloc_pessimistic
[12:58:32] [PASSED] drm_test_buddy_alloc_pathological
[12:58:32] [PASSED] drm_test_buddy_alloc_contiguous
[12:58:32] [PASSED] drm_test_buddy_alloc_clear
[12:58:32] [PASSED] drm_test_buddy_alloc_range_bias
[12:58:32] ==================== [PASSED] drm_buddy ====================
[12:58:32] ============= drm_cmdline_parser (40 subtests) =============
[12:58:32] [PASSED] drm_test_cmdline_force_d_only
[12:58:32] [PASSED] drm_test_cmdline_force_D_only_dvi
[12:58:32] [PASSED] drm_test_cmdline_force_D_only_hdmi
[12:58:32] [PASSED] drm_test_cmdline_force_D_only_not_digital
[12:58:32] [PASSED] drm_test_cmdline_force_e_only
[12:58:32] [PASSED] drm_test_cmdline_res
[12:58:32] [PASSED] drm_test_cmdline_res_vesa
[12:58:32] [PASSED] drm_test_cmdline_res_vesa_rblank
[12:58:32] [PASSED] drm_test_cmdline_res_rblank
[12:58:32] [PASSED] drm_test_cmdline_res_bpp
[12:58:32] [PASSED] drm_test_cmdline_res_refresh
[12:58:32] [PASSED] drm_test_cmdline_res_bpp_refresh
[12:58:32] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[12:58:32] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[12:58:32] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[12:58:32] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[12:58:32] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[12:58:32] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[12:58:32] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[12:58:32] [PASSED] drm_test_cmdline_res_margins_force_on
[12:58:32] [PASSED] drm_test_cmdline_res_vesa_margins
[12:58:32] [PASSED] drm_test_cmdline_name
[12:58:32] [PASSED] drm_test_cmdline_name_bpp
[12:58:32] [PASSED] drm_test_cmdline_name_option
[12:58:32] [PASSED] drm_test_cmdline_name_bpp_option
[12:58:32] [PASSED] drm_test_cmdline_rotate_0
[12:58:32] [PASSED] drm_test_cmdline_rotate_90
[12:58:32] [PASSED] drm_test_cmdline_rotate_180
[12:58:32] [PASSED] drm_test_cmdline_rotate_270
[12:58:32] [PASSED] drm_test_cmdline_hmirror
[12:58:32] [PASSED] drm_test_cmdline_vmirror
[12:58:32] [PASSED] drm_test_cmdline_margin_options
[12:58:32] [PASSED] drm_test_cmdline_multiple_options
[12:58:32] [PASSED] drm_test_cmdline_bpp_extra_and_option
[12:58:32] [PASSED] drm_test_cmdline_extra_and_option
[12:58:32] [PASSED] drm_test_cmdline_freestanding_options
[12:58:32] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[12:58:32] [PASSED] drm_test_cmdline_panel_orientation
[12:58:32] ================ drm_test_cmdline_invalid  =================
[12:58:32] [PASSED] margin_only
[12:58:32] [PASSED] interlace_only
[12:58:32] [PASSED] res_missing_x
[12:58:32] [PASSED] res_missing_y
[12:58:32] [PASSED] res_bad_y
[12:58:32] [PASSED] res_missing_y_bpp
[12:58:32] [PASSED] res_bad_bpp
[12:58:32] [PASSED] res_bad_refresh
[12:58:32] [PASSED] res_bpp_refresh_force_on_off
[12:58:32] [PASSED] res_invalid_mode
[12:58:32] [PASSED] res_bpp_wrong_place_mode
[12:58:32] [PASSED] name_bpp_refresh
[12:58:32] [PASSED] name_refresh
[12:58:32] [PASSED] name_refresh_wrong_mode
[12:58:32] [PASSED] name_refresh_invalid_mode
[12:58:32] [PASSED] rotate_multiple
[12:58:32] [PASSED] rotate_invalid_val
[12:58:32] [PASSED] rotate_truncated
[12:58:32] [PASSED] invalid_option
[12:58:32] [PASSED] invalid_tv_option
[12:58:32] [PASSED] truncated_tv_option
[12:58:32] ============ [PASSED] drm_test_cmdline_invalid =============
[12:58:32] =============== drm_test_cmdline_tv_options  ===============
[12:58:32] [PASSED] NTSC
[12:58:32] [PASSED] NTSC_443
[12:58:32] [PASSED] NTSC_J
[12:58:32] [PASSED] PAL
[12:58:32] [PASSED] PAL_M
[12:58:32] [PASSED] PAL_N
[12:58:32] [PASSED] SECAM
[12:58:32] =========== [PASSED] drm_test_cmdline_tv_options ===========
[12:58:32] =============== [PASSED] drm_cmdline_parser ================
[12:58:32] ========== drmm_connector_hdmi_init (19 subtests) ==========
[12:58:32] [PASSED] drm_test_connector_hdmi_init_valid
[12:58:32] [PASSED] drm_test_connector_hdmi_init_bpc_8
[12:58:32] [PASSED] drm_test_connector_hdmi_init_bpc_10
[12:58:32] [PASSED] drm_test_connector_hdmi_init_bpc_12
[12:58:32] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[12:58:32] [PASSED] drm_test_connector_hdmi_init_bpc_null
[12:58:32] [PASSED] drm_test_connector_hdmi_init_formats_empty
[12:58:32] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[12:58:32] [PASSED] drm_test_connector_hdmi_init_null_ddc
[12:58:32] [PASSED] drm_test_connector_hdmi_init_null_product
[12:58:32] [PASSED] drm_test_connector_hdmi_init_null_vendor
[12:58:32] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[12:58:32] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[12:58:32] [PASSED] drm_test_connector_hdmi_init_product_valid
[12:58:32] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[12:58:32] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[12:58:32] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[12:58:32] ========= drm_test_connector_hdmi_init_type_valid  =========
[12:58:32] [PASSED] HDMI-A
[12:58:32] [PASSED] HDMI-B
[12:58:32] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[12:58:32] ======== drm_test_connector_hdmi_init_type_invalid  ========
[12:58:32] [PASSED] Unknown
[12:58:32] [PASSED] VGA
[12:58:32] [PASSED] DVI-I
[12:58:32] [PASSED] DVI-D
[12:58:32] [PASSED] DVI-A
[12:58:32] [PASSED] Composite
[12:58:32] [PASSED] SVIDEO
[12:58:32] [PASSED] LVDS
[12:58:32] [PASSED] Component
[12:58:32] [PASSED] DIN
[12:58:32] [PASSED] DP
[12:58:32] [PASSED] TV
[12:58:32] [PASSED] eDP
[12:58:32] [PASSED] Virtual
[12:58:32] [PASSED] DSI
[12:58:32] [PASSED] DPI
[12:58:32] [PASSED] Writeback
[12:58:32] [PASSED] SPI
[12:58:32] [PASSED] USB
[12:58:32] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[12:58:32] ============ [PASSED] drmm_connector_hdmi_init =============
[12:58:32] ============= drmm_connector_init (3 subtests) =============
[12:58:32] [PASSED] drm_test_drmm_connector_init
[12:58:32] [PASSED] drm_test_drmm_connector_init_null_ddc
[12:58:32] ========= drm_test_drmm_connector_init_type_valid  =========
[12:58:32] [PASSED] Unknown
[12:58:32] [PASSED] VGA
[12:58:32] [PASSED] DVI-I
[12:58:32] [PASSED] DVI-D
[12:58:32] [PASSED] DVI-A
[12:58:32] [PASSED] Composite
[12:58:32] [PASSED] SVIDEO
[12:58:32] [PASSED] LVDS
[12:58:32] [PASSED] Component
[12:58:32] [PASSED] DIN
[12:58:32] [PASSED] DP
[12:58:32] [PASSED] HDMI-A
[12:58:32] [PASSED] HDMI-B
[12:58:32] [PASSED] TV
[12:58:32] [PASSED] eDP
[12:58:32] [PASSED] Virtual
[12:58:32] [PASSED] DSI
[12:58:32] [PASSED] DPI
[12:58:32] [PASSED] Writeback
[12:58:32] [PASSED] SPI
[12:58:32] [PASSED] USB
[12:58:32] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[12:58:32] =============== [PASSED] drmm_connector_init ===============
[12:58:32] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[12:58:32] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[12:58:32] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[12:58:32] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[12:58:32] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[12:58:32] ========== drm_test_get_tv_mode_from_name_valid  ===========
[12:58:32] [PASSED] NTSC
[12:58:32] [PASSED] NTSC-443
[12:58:32] [PASSED] NTSC-J
[12:58:32] [PASSED] PAL
[12:58:32] [PASSED] PAL-M
[12:58:32] [PASSED] PAL-N
[12:58:32] [PASSED] SECAM
[12:58:32] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[12:58:32] [PASSED] drm_test_get_tv_mode_from_name_truncated
[12:58:32] ============ [PASSED] drm_get_tv_mode_from_name ============
[12:58:32] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[12:58:32] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[12:58:32] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[12:58:32] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[12:58:32] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[12:58:32] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[12:58:32] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[12:58:32] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[12:58:32] [PASSED] VIC 96
[12:58:32] [PASSED] VIC 97
[12:58:32] [PASSED] VIC 101
[12:58:32] [PASSED] VIC 102
[12:58:32] [PASSED] VIC 106
[12:58:32] [PASSED] VIC 107
[12:58:32] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[12:58:32] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[12:58:32] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[12:58:32] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[12:58:32] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[12:58:32] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[12:58:32] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[12:58:32] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[12:58:32] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[12:58:32] [PASSED] Automatic
[12:58:32] [PASSED] Full
[12:58:32] [PASSED] Limited 16:235
[12:58:32] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[12:58:32] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[12:58:32] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[12:58:32] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[12:58:32] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[12:58:32] [PASSED] RGB
[12:58:32] [PASSED] YUV 4:2:0
[12:58:32] [PASSED] YUV 4:2:2
[12:58:32] [PASSED] YUV 4:4:4
[12:58:32] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[12:58:32] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[12:58:32] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[12:58:32] ============= drm_damage_helper (21 subtests) ==============
[12:58:32] [PASSED] drm_test_damage_iter_no_damage
[12:58:32] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[12:58:32] [PASSED] drm_test_damage_iter_no_damage_src_moved
[12:58:32] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[12:58:32] [PASSED] drm_test_damage_iter_no_damage_not_visible
[12:58:32] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[12:58:32] [PASSED] drm_test_damage_iter_no_damage_no_fb
[12:58:32] [PASSED] drm_test_damage_iter_simple_damage
[12:58:32] [PASSED] drm_test_damage_iter_single_damage
[12:58:32] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[12:58:32] [PASSED] drm_test_damage_iter_single_damage_outside_src
[12:58:32] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[12:58:32] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[12:58:32] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[12:58:32] [PASSED] drm_test_damage_iter_single_damage_src_moved
[12:58:32] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[12:58:32] [PASSED] drm_test_damage_iter_damage
[12:58:32] [PASSED] drm_test_damage_iter_damage_one_intersect
[12:58:32] [PASSED] drm_test_damage_iter_damage_one_outside
[12:58:32] [PASSED] drm_test_damage_iter_damage_src_moved
[12:58:32] [PASSED] drm_test_damage_iter_damage_not_visible
[12:58:32] ================ [PASSED] drm_damage_helper ================
[12:58:32] ============== drm_dp_mst_helper (3 subtests) ==============
[12:58:32] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[12:58:32] [PASSED] Clock 154000 BPP 30 DSC disabled
[12:58:32] [PASSED] Clock 234000 BPP 30 DSC disabled
[12:58:32] [PASSED] Clock 297000 BPP 24 DSC disabled
[12:58:32] [PASSED] Clock 332880 BPP 24 DSC enabled
[12:58:32] [PASSED] Clock 324540 BPP 24 DSC enabled
[12:58:32] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[12:58:32] ============== drm_test_dp_mst_calc_pbn_div  ===============
[12:58:32] [PASSED] Link rate 2000000 lane count 4
[12:58:32] [PASSED] Link rate 2000000 lane count 2
[12:58:32] [PASSED] Link rate 2000000 lane count 1
[12:58:32] [PASSED] Link rate 1350000 lane count 4
[12:58:32] [PASSED] Link rate 1350000 lane count 2
[12:58:32] [PASSED] Link rate 1350000 lane count 1
[12:58:32] [PASSED] Link rate 1000000 lane count 4
[12:58:32] [PASSED] Link rate 1000000 lane count 2
[12:58:32] [PASSED] Link rate 1000000 lane count 1
[12:58:32] [PASSED] Link rate 810000 lane count 4
[12:58:32] [PASSED] Link rate 810000 lane count 2
[12:58:32] [PASSED] Link rate 810000 lane count 1
[12:58:32] [PASSED] Link rate 540000 lane count 4
[12:58:32] [PASSED] Link rate 540000 lane count 2
[12:58:32] [PASSED] Link rate 540000 lane count 1
[12:58:32] [PASSED] Link rate 270000 lane count 4
[12:58:32] [PASSED] Link rate 270000 lane count 2
[12:58:32] [PASSED] Link rate 270000 lane count 1
[12:58:32] [PASSED] Link rate 162000 lane count 4
[12:58:32] [PASSED] Link rate 162000 lane count 2
[12:58:32] [PASSED] Link rate 162000 lane count 1
[12:58:32] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[12:58:32] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[12:58:32] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[12:58:32] [PASSED] DP_POWER_UP_PHY with port number
[12:58:32] [PASSED] DP_POWER_DOWN_PHY with port number
[12:58:32] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[12:58:32] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[12:58:32] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[12:58:32] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[12:58:32] [PASSED] DP_QUERY_PAYLOAD with port number
[12:58:32] [PASSED] DP_QUERY_PAYLOAD with VCPI
[12:58:32] [PASSED] DP_REMOTE_DPCD_READ with port number
[12:58:32] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[12:58:32] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[12:58:32] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[12:58:32] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[12:58:32] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[12:58:32] [PASSED] DP_REMOTE_I2C_READ with port number
[12:58:32] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[12:58:32] [PASSED] DP_REMOTE_I2C_READ with transactions array
[12:58:32] [PASSED] DP_REMOTE_I2C_WRITE with port number
[12:58:32] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[12:58:32] [PASSED] DP_REMOTE_I2C_WRITE with data array
[12:58:32] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[12:58:32] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[12:58:32] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[12:58:32] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[12:58:32] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[12:58:32] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[12:58:32] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[12:58:32] ================ [PASSED] drm_dp_mst_helper ================
[12:58:32] ================== drm_exec (7 subtests) ===================
[12:58:32] [PASSED] sanitycheck
[12:58:32] [PASSED] test_lock
[12:58:32] [PASSED] test_lock_unlock
[12:58:32] [PASSED] test_duplicates
[12:58:32] [PASSED] test_prepare
[12:58:32] [PASSED] test_prepare_array
[12:58:32] [PASSED] test_multiple_loops
[12:58:32] ==================== [PASSED] drm_exec =====================
[12:58:32] =========== drm_format_helper_test (17 subtests) ===========
[12:58:32] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[12:58:32] [PASSED] single_pixel_source_buffer
[12:58:32] [PASSED] single_pixel_clip_rectangle
[12:58:32] [PASSED] well_known_colors
[12:58:32] [PASSED] destination_pitch
[12:58:32] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[12:58:32] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[12:58:32] [PASSED] single_pixel_source_buffer
[12:58:32] [PASSED] single_pixel_clip_rectangle
[12:58:32] [PASSED] well_known_colors
[12:58:32] [PASSED] destination_pitch
[12:58:32] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[12:58:32] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[12:58:32] [PASSED] single_pixel_source_buffer
[12:58:32] [PASSED] single_pixel_clip_rectangle
[12:58:32] [PASSED] well_known_colors
[12:58:32] [PASSED] destination_pitch
[12:58:32] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[12:58:32] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[12:58:32] [PASSED] single_pixel_source_buffer
[12:58:32] [PASSED] single_pixel_clip_rectangle
[12:58:32] [PASSED] well_known_colors
[12:58:32] [PASSED] destination_pitch
[12:58:32] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[12:58:32] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[12:58:32] [PASSED] single_pixel_source_buffer
[12:58:32] [PASSED] single_pixel_clip_rectangle
[12:58:32] [PASSED] well_known_colors
[12:58:32] [PASSED] destination_pitch
[12:58:32] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[12:58:32] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[12:58:32] [PASSED] single_pixel_source_buffer
[12:58:32] [PASSED] single_pixel_clip_rectangle
[12:58:32] [PASSED] well_known_colors
[12:58:32] [PASSED] destination_pitch
[12:58:32] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[12:58:32] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[12:58:32] [PASSED] single_pixel_source_buffer
[12:58:32] [PASSED] single_pixel_clip_rectangle
[12:58:32] [PASSED] well_known_colors
[12:58:32] [PASSED] destination_pitch
[12:58:32] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[12:58:32] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[12:58:32] [PASSED] single_pixel_source_buffer
[12:58:32] [PASSED] single_pixel_clip_rectangle
[12:58:32] [PASSED] well_known_colors
[12:58:32] [PASSED] destination_pitch
[12:58:32] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[12:58:32] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[12:58:32] [PASSED] single_pixel_source_buffer
[12:58:32] [PASSED] single_pixel_clip_rectangle
[12:58:32] [PASSED] well_known_colors
[12:58:32] [PASSED] destination_pitch
[12:58:32] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[12:58:32] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[12:58:32] [PASSED] single_pixel_source_buffer
[12:58:32] [PASSED] single_pixel_clip_rectangle
[12:58:32] [PASSED] well_known_colors
[12:58:32] [PASSED] destination_pitch
[12:58:32] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[12:58:32] ============== drm_test_fb_xrgb8888_to_mono  ===============
[12:58:32] [PASSED] single_pixel_source_buffer
[12:58:32] [PASSED] single_pixel_clip_rectangle
[12:58:32] [PASSED] well_known_colors
[12:58:32] [PASSED] destination_pitch
[12:58:32] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[12:58:32] ==================== drm_test_fb_swab  =====================
[12:58:32] [PASSED] single_pixel_source_buffer
[12:58:32] [PASSED] single_pixel_clip_rectangle
[12:58:32] [PASSED] well_known_colors
[12:58:32] [PASSED] destination_pitch
[12:58:32] ================ [PASSED] drm_test_fb_swab =================
[12:58:32] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[12:58:32] [PASSED] single_pixel_source_buffer
[12:58:32] [PASSED] single_pixel_clip_rectangle
[12:58:32] [PASSED] well_known_colors
[12:58:32] [PASSED] destination_pitch
[12:58:32] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[12:58:32] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[12:58:32] [PASSED] single_pixel_source_buffer
[12:58:32] [PASSED] single_pixel_clip_rectangle
[12:58:32] [PASSED] well_known_colors
[12:58:32] [PASSED] destination_pitch
[12:58:32] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[12:58:32] ================= drm_test_fb_clip_offset  =================
[12:58:32] [PASSED] pass through
[12:58:32] [PASSED] horizontal offset
[12:58:32] [PASSED] vertical offset
[12:58:32] [PASSED] horizontal and vertical offset
[12:58:32] [PASSED] horizontal offset (custom pitch)
[12:58:32] [PASSED] vertical offset (custom pitch)
[12:58:32] [PASSED] horizontal and vertical offset (custom pitch)
[12:58:32] ============= [PASSED] drm_test_fb_clip_offset =============
[12:58:32] ============== drm_test_fb_build_fourcc_list  ==============
[12:58:32] [PASSED] no native formats
[12:58:32] [PASSED] XRGB8888 as native format
[12:58:32] [PASSED] remove duplicates
[12:58:32] [PASSED] convert alpha formats
[12:58:32] [PASSED] random formats
[12:58:32] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[12:58:32] =================== drm_test_fb_memcpy  ====================
[12:58:32] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[12:58:32] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[12:58:32] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[12:58:32] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[12:58:32] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[12:58:32] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[12:58:32] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[12:58:32] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[12:58:32] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[12:58:32] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[12:58:32] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[12:58:32] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[12:58:32] =============== [PASSED] drm_test_fb_memcpy ================
[12:58:32] ============= [PASSED] drm_format_helper_test ==============
[12:58:32] ================= drm_format (18 subtests) =================
[12:58:32] [PASSED] drm_test_format_block_width_invalid
[12:58:32] [PASSED] drm_test_format_block_width_one_plane
[12:58:32] [PASSED] drm_test_format_block_width_two_plane
[12:58:32] [PASSED] drm_test_format_block_width_three_plane
[12:58:32] [PASSED] drm_test_format_block_width_tiled
[12:58:32] [PASSED] drm_test_format_block_height_invalid
[12:58:32] [PASSED] drm_test_format_block_height_one_plane
[12:58:32] [PASSED] drm_test_format_block_height_two_plane
[12:58:32] [PASSED] drm_test_format_block_height_three_plane
[12:58:32] [PASSED] drm_test_format_block_height_tiled
[12:58:32] [PASSED] drm_test_format_min_pitch_invalid
[12:58:32] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[12:58:32] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[12:58:32] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[12:58:32] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[12:58:32] [PASSED] drm_test_format_min_pitch_two_plane
[12:58:32] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[12:58:32] [PASSED] drm_test_format_min_pitch_tiled
[12:58:32] =================== [PASSED] drm_format ====================
[12:58:32] =============== drm_framebuffer (1 subtest) ================
[12:58:32] =============== drm_test_framebuffer_create  ===============
[12:58:32] [PASSED] ABGR8888 normal sizes
[12:58:32] [PASSED] ABGR8888 max sizes
[12:58:32] [PASSED] ABGR8888 pitch greater than min required
[12:58:32] [PASSED] ABGR8888 pitch less than min required
[12:58:32] [PASSED] ABGR8888 Invalid width
[12:58:32] [PASSED] ABGR8888 Invalid buffer handle
[12:58:32] [PASSED] No pixel format
[12:58:32] [PASSED] ABGR8888 Width 0
[12:58:32] [PASSED] ABGR8888 Height 0
[12:58:32] [PASSED] ABGR8888 Out of bound height * pitch combination
[12:58:32] [PASSED] ABGR8888 Large buffer offset
[12:58:32] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[12:58:32] [PASSED] ABGR8888 Valid buffer modifier
[12:58:32] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[12:58:32] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[12:58:32] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[12:58:32] [PASSED] NV12 Normal sizes
[12:58:32] [PASSED] NV12 Max sizes
[12:58:32] [PASSED] NV12 Invalid pitch
[12:58:32] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[12:58:32] [PASSED] NV12 different  modifier per-plane
[12:58:32] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[12:58:32] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[12:58:32] [PASSED] NV12 Modifier for inexistent plane
[12:58:32] [PASSED] NV12 Handle for inexistent plane
[12:58:32] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[12:58:32] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[12:58:32] [PASSED] YVU420 Normal sizes
[12:58:32] [PASSED] YVU420 Max sizes
[12:58:32] [PASSED] YVU420 Invalid pitch
[12:58:32] [PASSED] YVU420 Different pitches
[12:58:32] [PASSED] YVU420 Different buffer offsets/pitches
[12:58:32] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[12:58:32] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[12:58:32] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[12:58:32] [PASSED] YVU420 Valid modifier
[12:58:32] [PASSED] YVU420 Different modifiers per plane
[12:58:32] [PASSED] YVU420 Modifier for inexistent plane
[12:58:32] [PASSED] X0L2 Normal sizes
[12:58:32] [PASSED] X0L2 Max sizes
[12:58:32] [PASSED] X0L2 Invalid pitch
[12:58:32] [PASSED] X0L2 Pitch greater than minimum required
[12:58:32] [PASSED] X0L2 Handle for inexistent plane
[12:58:32] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[12:58:32] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[12:58:32] [PASSED] X0L2 Valid modifier
[12:58:32] [PASSED] X0L2 Modifier for inexistent plane
[12:58:32] =========== [PASSED] drm_test_framebuffer_create ===========
[12:58:32] ================= [PASSED] drm_framebuffer =================
[12:58:32] ================ drm_gem_shmem (8 subtests) ================
[12:58:32] [PASSED] drm_gem_shmem_test_obj_create
[12:58:32] [PASSED] drm_gem_shmem_test_obj_create_private
[12:58:32] [PASSED] drm_gem_shmem_test_pin_pages
[12:58:32] [PASSED] drm_gem_shmem_test_vmap
[12:58:32] [PASSED] drm_gem_shmem_test_get_pages_sgt
[12:58:32] [PASSED] drm_gem_shmem_test_get_sg_table
[12:58:32] [PASSED] drm_gem_shmem_test_madvise
[12:58:32] [PASSED] drm_gem_shmem_test_purge
[12:58:32] ================== [PASSED] drm_gem_shmem ==================
[12:58:32] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[12:58:32] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[12:58:32] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[12:58:32] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[12:58:32] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[12:58:32] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[12:58:32] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[12:58:32] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[12:58:32] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[12:58:32] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[12:58:32] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[12:58:32] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[12:58:32] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[12:58:32] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[12:58:32] [PASSED] drm_test_check_output_bpc_dvi
[12:58:32] [PASSED] drm_test_check_output_bpc_format_vic_1
[12:58:32] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[12:58:32] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[12:58:32] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[12:58:32] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[12:58:32] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[12:58:32] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[12:58:32] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[12:58:32] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[12:58:32] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[12:58:32] [PASSED] drm_test_check_broadcast_rgb_value
[12:58:32] [PASSED] drm_test_check_bpc_8_value
[12:58:32] [PASSED] drm_test_check_bpc_10_value
[12:58:32] [PASSED] drm_test_check_bpc_12_value
[12:58:32] [PASSED] drm_test_check_format_value
[12:58:32] [PASSED] drm_test_check_tmds_char_value
[12:58:32] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[12:58:32] ================= drm_managed (2 subtests) =================
[12:58:32] [PASSED] drm_test_managed_release_action
[12:58:32] [PASSED] drm_test_managed_run_action
[12:58:32] =================== [PASSED] drm_managed ===================
[12:58:32] =================== drm_mm (6 subtests) ====================
[12:58:32] [PASSED] drm_test_mm_init
[12:58:32] [PASSED] drm_test_mm_debug
[12:58:32] [PASSED] drm_test_mm_align32
[12:58:32] [PASSED] drm_test_mm_align64
[12:58:32] [PASSED] drm_test_mm_lowest
[12:58:32] [PASSED] drm_test_mm_highest
[12:58:32] ===================== [PASSED] drm_mm ======================
[12:58:32] ============= drm_modes_analog_tv (4 subtests) =============
[12:58:32] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[12:58:32] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[12:58:32] [PASSED] drm_test_modes_analog_tv_pal_576i
[12:58:32] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[12:58:32] =============== [PASSED] drm_modes_analog_tv ===============
[12:58:32] ============== drm_plane_helper (2 subtests) ===============
[12:58:32] =============== drm_test_check_plane_state  ================
[12:58:32] [PASSED] clipping_simple
[12:58:32] [PASSED] clipping_rotate_reflect
[12:58:32] [PASSED] positioning_simple
[12:58:32] [PASSED] upscaling
[12:58:32] [PASSED] downscaling
[12:58:32] [PASSED] rounding1
[12:58:32] [PASSED] rounding2
[12:58:32] [PASSED] rounding3
[12:58:32] [PASSED] rounding4
[12:58:32] =========== [PASSED] drm_test_check_plane_state ============
[12:58:32] =========== drm_test_check_invalid_plane_state  ============
[12:58:32] [PASSED] positioning_invalid
[12:58:32] [PASSED] upscaling_invalid
[12:58:32] [PASSED] downscaling_invalid
[12:58:32] ======= [PASSED] drm_test_check_invalid_plane_state ========
[12:58:32] ================ [PASSED] drm_plane_helper =================
stty: 'standard input': Inappropriate ioctl for device
[12:58:32] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[12:58:32] ====== drm_test_connector_helper_tv_get_modes_check  =======
[12:58:32] [PASSED] None
[12:58:32] [PASSED] PAL
[12:58:32] [PASSED] NTSC
[12:58:32] [PASSED] Both, NTSC Default
[12:58:32] [PASSED] Both, PAL Default
[12:58:32] [PASSED] Both, NTSC Default, with PAL on command-line
[12:58:32] [PASSED] Both, PAL Default, with NTSC on command-line
[12:58:32] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[12:58:32] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[12:58:32] ================== drm_rect (9 subtests) ===================
[12:58:32] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[12:58:32] [PASSED] drm_test_rect_clip_scaled_not_clipped
[12:58:32] [PASSED] drm_test_rect_clip_scaled_clipped
[12:58:32] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[12:58:32] ================= drm_test_rect_intersect  =================
[12:58:32] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[12:58:32] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[12:58:32] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[12:58:32] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[12:58:32] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[12:58:32] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[12:58:32] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[12:58:32] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[12:58:32] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[12:58:32] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[12:58:32] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[12:58:32] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[12:58:32] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[12:58:32] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[12:58:32] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[12:58:32] ============= [PASSED] drm_test_rect_intersect =============
[12:58:32] ================ drm_test_rect_calc_hscale  ================
[12:58:32] [PASSED] normal use
[12:58:32] [PASSED] out of max range
[12:58:32] [PASSED] out of min range
[12:58:32] [PASSED] zero dst
[12:58:32] [PASSED] negative src
[12:58:32] [PASSED] negative dst
[12:58:32] ============ [PASSED] drm_test_rect_calc_hscale ============
[12:58:32] ================ drm_test_rect_calc_vscale  ================
[12:58:32] [PASSED] normal use
[12:58:32] [PASSED] out of max range
[12:58:32] [PASSED] out of min range
[12:58:32] [PASSED] zero dst
[12:58:32] [PASSED] negative src
[12:58:32] [PASSED] negative dst
[12:58:32] ============ [PASSED] drm_test_rect_calc_vscale ============
[12:58:32] ================== drm_test_rect_rotate  ===================
[12:58:32] [PASSED] reflect-x
[12:58:32] [PASSED] reflect-y
[12:58:32] [PASSED] rotate-0
[12:58:32] [PASSED] rotate-90
[12:58:32] [PASSED] rotate-180
[12:58:32] [PASSED] rotate-270
[12:58:32] ============== [PASSED] drm_test_rect_rotate ===============
[12:58:32] ================ drm_test_rect_rotate_inv  =================
[12:58:32] [PASSED] reflect-x
[12:58:32] [PASSED] reflect-y
[12:58:32] [PASSED] rotate-0
[12:58:32] [PASSED] rotate-90
[12:58:32] [PASSED] rotate-180
[12:58:32] [PASSED] rotate-270
[12:58:32] ============ [PASSED] drm_test_rect_rotate_inv =============
[12:58:32] ==================== [PASSED] drm_rect =====================
[12:58:32] ============================================================
[12:58:32] Testing complete. Ran 511 tests: passed: 511
[12:58:32] Elapsed time: 23.297s total, 1.724s configuring, 21.403s building, 0.155s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[12:58:32] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:58:34] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[12:58:43] Starting KUnit Kernel (1/1)...
[12:58:43] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[12:58:43] ================= ttm_device (5 subtests) ==================
[12:58:43] [PASSED] ttm_device_init_basic
[12:58:43] [PASSED] ttm_device_init_multiple
[12:58:43] [PASSED] ttm_device_fini_basic
[12:58:43] [PASSED] ttm_device_init_no_vma_man
[12:58:43] ================== ttm_device_init_pools  ==================
[12:58:43] [PASSED] No DMA allocations, no DMA32 required
[12:58:43] [PASSED] DMA allocations, DMA32 required
[12:58:43] [PASSED] No DMA allocations, DMA32 required
[12:58:43] [PASSED] DMA allocations, no DMA32 required
[12:58:43] ============== [PASSED] ttm_device_init_pools ==============
[12:58:43] =================== [PASSED] ttm_device ====================
[12:58:43] ================== ttm_pool (8 subtests) ===================
[12:58:43] ================== ttm_pool_alloc_basic  ===================
[12:58:43] [PASSED] One page
[12:58:43] [PASSED] More than one page
[12:58:43] [PASSED] Above the allocation limit
[12:58:43] [PASSED] One page, with coherent DMA mappings enabled
[12:58:43] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[12:58:43] ============== [PASSED] ttm_pool_alloc_basic ===============
[12:58:43] ============== ttm_pool_alloc_basic_dma_addr  ==============
[12:58:43] [PASSED] One page
[12:58:43] [PASSED] More than one page
[12:58:43] [PASSED] Above the allocation limit
[12:58:43] [PASSED] One page, with coherent DMA mappings enabled
[12:58:43] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[12:58:43] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[12:58:43] [PASSED] ttm_pool_alloc_order_caching_match
[12:58:43] [PASSED] ttm_pool_alloc_caching_mismatch
[12:58:43] [PASSED] ttm_pool_alloc_order_mismatch
[12:58:43] [PASSED] ttm_pool_free_dma_alloc
[12:58:43] [PASSED] ttm_pool_free_no_dma_alloc
[12:58:43] [PASSED] ttm_pool_fini_basic
[12:58:43] ==================== [PASSED] ttm_pool =====================
[12:58:43] ================ ttm_resource (8 subtests) =================
[12:58:43] ================= ttm_resource_init_basic  =================
[12:58:43] [PASSED] Init resource in TTM_PL_SYSTEM
[12:58:43] [PASSED] Init resource in TTM_PL_VRAM
[12:58:43] [PASSED] Init resource in a private placement
[12:58:43] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[12:58:43] ============= [PASSED] ttm_resource_init_basic =============
[12:58:43] [PASSED] ttm_resource_init_pinned
[12:58:43] [PASSED] ttm_resource_fini_basic
[12:58:43] [PASSED] ttm_resource_manager_init_basic
[12:58:43] [PASSED] ttm_resource_manager_usage_basic
[12:58:43] [PASSED] ttm_resource_manager_set_used_basic
[12:58:43] [PASSED] ttm_sys_man_alloc_basic
[12:58:43] [PASSED] ttm_sys_man_free_basic
[12:58:43] ================== [PASSED] ttm_resource ===================
[12:58:43] =================== ttm_tt (10 subtests) ===================
[12:58:43] ==================== ttm_tt_init_basic  ====================
[12:58:43] [PASSED] Page-aligned size
[12:58:43] [PASSED] Extra pages requested
[12:58:43] ================ [PASSED] ttm_tt_init_basic ================
[12:58:43] [PASSED] ttm_tt_init_misaligned
[12:58:43] [PASSED] ttm_tt_fini_basic
[12:58:43] [PASSED] ttm_tt_fini_sg
[12:58:43] [PASSED] ttm_tt_fini_shmem
[12:58:43] [PASSED] ttm_tt_create_basic
[12:58:43] [PASSED] ttm_tt_create_invalid_bo_type
[12:58:43] [PASSED] ttm_tt_create_ttm_exists
[12:58:43] [PASSED] ttm_tt_create_failed
[12:58:43] [PASSED] ttm_tt_destroy_basic
[12:58:43] ===================== [PASSED] ttm_tt ======================
[12:58:43] =================== ttm_bo (14 subtests) ===================
[12:58:43] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[12:58:43] [PASSED] Cannot be interrupted and sleeps
[12:58:43] [PASSED] Cannot be interrupted, locks straight away
[12:58:43] [PASSED] Can be interrupted, sleeps
[12:58:43] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[12:58:43] [PASSED] ttm_bo_reserve_locked_no_sleep
[12:58:43] [PASSED] ttm_bo_reserve_no_wait_ticket
[12:58:43] [PASSED] ttm_bo_reserve_double_resv
[12:58:43] [PASSED] ttm_bo_reserve_interrupted
[12:58:43] [PASSED] ttm_bo_reserve_deadlock
[12:58:43] [PASSED] ttm_bo_unreserve_basic
[12:58:43] [PASSED] ttm_bo_unreserve_pinned
[12:58:43] [PASSED] ttm_bo_unreserve_bulk
[12:58:43] [PASSED] ttm_bo_put_basic
[12:58:43] [PASSED] ttm_bo_put_shared_resv
[12:58:43] [PASSED] ttm_bo_pin_basic
[12:58:43] [PASSED] ttm_bo_pin_unpin_resource
[12:58:43] [PASSED] ttm_bo_multiple_pin_one_unpin
[12:58:43] ===================== [PASSED] ttm_bo ======================
[12:58:43] ============================================================
[12:58:43] Testing complete. Ran 62 tests: passed: 62
[12:58:43] Elapsed time: 10.486s total, 1.685s configuring, 8.581s building, 0.179s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


