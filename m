Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526BDC30653
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 21:36:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E59810E165;
	Wed, 26 Jun 2024 21:36:21 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE60E10E165;
 Wed, 26 Jun 2024 21:36:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/mcr=3A_Avoid_clobbering?=
 =?utf-8?q?_DSS_steering?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jun 2024 21:36:19 -0000
Message-ID: <171943777971.162560.4815034611343692260@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626210536.1620176-2-matthew.d.roper@intel.com>
In-Reply-To: <20240626210536.1620176-2-matthew.d.roper@intel.com>
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

Series: drm/xe/mcr: Avoid clobbering DSS steering
URL   : https://patchwork.freedesktop.org/series/135452/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[21:35:11] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:35:15] Building KUnit Kernel ...
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

[21:35:41] Starting KUnit Kernel (1/1)...
[21:35:41] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[21:35:41] =================== guc_dbm (7 subtests) ===================
[21:35:41] [PASSED] test_empty
[21:35:41] [PASSED] test_default
[21:35:41] ======================== test_size  ========================
[21:35:41] [PASSED] 4
[21:35:41] [PASSED] 8
[21:35:41] [PASSED] 32
[21:35:41] [PASSED] 256
[21:35:41] ==================== [PASSED] test_size ====================
[21:35:41] ======================= test_reuse  ========================
[21:35:41] [PASSED] 4
[21:35:41] [PASSED] 8
[21:35:41] [PASSED] 32
[21:35:41] [PASSED] 256
[21:35:41] =================== [PASSED] test_reuse ====================
[21:35:41] =================== test_range_overlap  ====================
[21:35:41] [PASSED] 4
[21:35:41] [PASSED] 8
[21:35:41] [PASSED] 32
[21:35:41] [PASSED] 256
[21:35:41] =============== [PASSED] test_range_overlap ================
[21:35:41] =================== test_range_compact  ====================
[21:35:41] [PASSED] 4
[21:35:41] [PASSED] 8
[21:35:41] [PASSED] 32
[21:35:41] [PASSED] 256
[21:35:41] =============== [PASSED] test_range_compact ================
[21:35:41] ==================== test_range_spare  =====================
[21:35:41] [PASSED] 4
[21:35:41] [PASSED] 8
[21:35:41] [PASSED] 32
[21:35:41] [PASSED] 256
[21:35:41] ================ [PASSED] test_range_spare =================
[21:35:41] ===================== [PASSED] guc_dbm =====================
[21:35:41] =================== guc_idm (6 subtests) ===================
[21:35:41] [PASSED] bad_init
[21:35:41] [PASSED] no_init
[21:35:41] [PASSED] init_fini
[21:35:41] [PASSED] check_used
[21:35:41] [PASSED] check_quota
[21:35:41] [PASSED] check_all
[21:35:41] ===================== [PASSED] guc_idm =====================
[21:35:41] ================== no_relay (3 subtests) ===================
[21:35:41] [PASSED] xe_drops_guc2pf_if_not_ready
[21:35:41] [PASSED] xe_drops_guc2vf_if_not_ready
[21:35:41] [PASSED] xe_rejects_send_if_not_ready
[21:35:41] ==================== [PASSED] no_relay =====================
[21:35:41] ================== pf_relay (14 subtests) ==================
[21:35:41] [PASSED] pf_rejects_guc2pf_too_short
[21:35:41] [PASSED] pf_rejects_guc2pf_too_long
[21:35:41] [PASSED] pf_rejects_guc2pf_no_payload
[21:35:41] [PASSED] pf_fails_no_payload
[21:35:41] [PASSED] pf_fails_bad_origin
[21:35:41] [PASSED] pf_fails_bad_type
[21:35:41] [PASSED] pf_txn_reports_error
[21:35:41] [PASSED] pf_txn_sends_pf2guc
[21:35:41] [PASSED] pf_sends_pf2guc
[21:35:41] [SKIPPED] pf_loopback_nop
[21:35:41] [SKIPPED] pf_loopback_echo
[21:35:41] [SKIPPED] pf_loopback_fail
[21:35:41] [SKIPPED] pf_loopback_busy
[21:35:41] [SKIPPED] pf_loopback_retry
[21:35:41] ==================== [PASSED] pf_relay =====================
[21:35:41] ================== vf_relay (3 subtests) ===================
[21:35:41] [PASSED] vf_rejects_guc2vf_too_short
[21:35:41] [PASSED] vf_rejects_guc2vf_too_long
[21:35:41] [PASSED] vf_rejects_guc2vf_no_payload
[21:35:41] ==================== [PASSED] vf_relay =====================
[21:35:41] ================= pf_service (11 subtests) =================
[21:35:41] [PASSED] pf_negotiate_any
[21:35:41] [PASSED] pf_negotiate_base_match
[21:35:41] [PASSED] pf_negotiate_base_newer
[21:35:41] [PASSED] pf_negotiate_base_next
[21:35:41] [SKIPPED] pf_negotiate_base_older
[21:35:41] [PASSED] pf_negotiate_base_prev
[21:35:41] [PASSED] pf_negotiate_latest_match
[21:35:41] [PASSED] pf_negotiate_latest_newer
[21:35:41] [PASSED] pf_negotiate_latest_next
[21:35:41] [SKIPPED] pf_negotiate_latest_older
[21:35:41] [SKIPPED] pf_negotiate_latest_prev
[21:35:41] =================== [PASSED] pf_service ====================
[21:35:41] ===================== lmtt (1 subtest) =====================
[21:35:41] ======================== test_ops  =========================
[21:35:41] [PASSED] 2-level
[21:35:41] [PASSED] multi-level
[21:35:41] ==================== [PASSED] test_ops =====================
[21:35:41] ====================== [PASSED] lmtt =======================
[21:35:41] ==================== xe_bo (2 subtests) ====================
[21:35:41] [SKIPPED] xe_ccs_migrate_kunit
[21:35:41] [SKIPPED] xe_bo_evict_kunit
[21:35:41] ===================== [SKIPPED] xe_bo ======================
[21:35:41] ================== xe_dma_buf (1 subtest) ==================
[21:35:41] [SKIPPED] xe_dma_buf_kunit
[21:35:41] =================== [SKIPPED] xe_dma_buf ===================
[21:35:41] ================== xe_migrate (1 subtest) ==================
[21:35:41] [SKIPPED] xe_migrate_sanity_kunit
[21:35:41] =================== [SKIPPED] xe_migrate ===================
[21:35:41] =================== xe_mocs (2 subtests) ===================
[21:35:41] [SKIPPED] xe_live_mocs_kernel_kunit
[21:35:41] [SKIPPED] xe_live_mocs_reset_kunit
[21:35:41] ==================== [SKIPPED] xe_mocs =====================
[21:35:41] ==================== args (11 subtests) ====================
[21:35:41] [PASSED] count_args_test
[21:35:41] [PASSED] call_args_example
[21:35:41] [PASSED] call_args_test
[21:35:41] [PASSED] drop_first_arg_example
[21:35:41] [PASSED] drop_first_arg_test
[21:35:41] [PASSED] first_arg_example
[21:35:41] [PASSED] first_arg_test
[21:35:41] [PASSED] last_arg_example
[21:35:41] [PASSED] last_arg_test
[21:35:41] [PASSED] pick_arg_example
[21:35:41] [PASSED] sep_comma_example
[21:35:41] ====================== [PASSED] args =======================
[21:35:41] =================== xe_pci (2 subtests) ====================
[21:35:41] [PASSED] xe_gmdid_graphics_ip
[21:35:41] [PASSED] xe_gmdid_media_ip
[21:35:41] ===================== [PASSED] xe_pci ======================
[21:35:41] ==================== xe_rtp (1 subtest) ====================
[21:35:41] ================== xe_rtp_process_tests  ===================
[21:35:41] [PASSED] coalesce-same-reg
[21:35:41] [PASSED] no-match-no-add
[21:35:41] [PASSED] match-or
[21:35:41] [PASSED] match-or-xfail
[21:35:41] [PASSED] no-match-no-add-multiple-rules
[21:35:41] [PASSED] two-regs-two-entries
[21:35:41] [PASSED] clr-one-set-other
[21:35:41] [PASSED] set-field
[21:35:41] [PASSED] conflict-duplicate
[21:35:41] [PASSED] conflict-not-disjoint
[21:35:41] [PASSED] conflict-reg-type
stty: 'standard input': Inappropriate ioctl for device
[21:35:41] ============== [PASSED] xe_rtp_process_tests ===============
[21:35:41] ===================== [PASSED] xe_rtp ======================
[21:35:41] ==================== xe_wa (1 subtest) =====================
[21:35:41] ======================== xe_wa_gt  =========================
[21:35:41] [PASSED] TIGERLAKE (B0)
[21:35:41] [PASSED] DG1 (A0)
[21:35:41] [PASSED] DG1 (B0)
[21:35:41] [PASSED] ALDERLAKE_S (A0)
[21:35:41] [PASSED] ALDERLAKE_S (B0)
[21:35:41] [PASSED] ALDERLAKE_S (C0)
[21:35:41] [PASSED] ALDERLAKE_S (D0)
[21:35:41] [PASSED] ALDERLAKE_P (A0)
[21:35:41] [PASSED] ALDERLAKE_P (B0)
[21:35:41] [PASSED] ALDERLAKE_P (C0)
[21:35:41] [PASSED] ALDERLAKE_S_RPLS (D0)
[21:35:41] [PASSED] ALDERLAKE_P_RPLU (E0)
[21:35:41] [PASSED] DG2_G10 (C0)
[21:35:41] [PASSED] DG2_G11 (B1)
[21:35:41] [PASSED] DG2_G12 (A1)
[21:35:41] [PASSED] METEORLAKE (g:A0, m:A0)
[21:35:41] [PASSED] METEORLAKE (g:A0, m:A0)
[21:35:41] [PASSED] METEORLAKE (g:A0, m:A0)
[21:35:41] [PASSED] LUNARLAKE (g:A0, m:A0)
[21:35:41] [PASSED] LUNARLAKE (g:B0, m:A0)
[21:35:41] ==================== [PASSED] xe_wa_gt =====================
[21:35:41] ====================== [PASSED] xe_wa ======================
[21:35:41] ============================================================
[21:35:41] Testing complete. Ran 111 tests: passed: 97, skipped: 14
[21:35:41] Elapsed time: 29.796s total, 4.244s configuring, 25.277s building, 0.231s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[21:35:41] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:35:43] Building KUnit Kernel ...
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

[21:36:04] Starting KUnit Kernel (1/1)...
[21:36:04] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[21:36:04] ============ drm_test_pick_cmdline (2 subtests) ============
[21:36:04] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[21:36:04] =============== drm_test_pick_cmdline_named  ===============
[21:36:04] [PASSED] NTSC
[21:36:04] [PASSED] NTSC-J
[21:36:04] [PASSED] PAL
[21:36:04] [PASSED] PAL-M
[21:36:04] =========== [PASSED] drm_test_pick_cmdline_named ===========
[21:36:04] ============== [PASSED] drm_test_pick_cmdline ==============
[21:36:04] ================== drm_buddy (7 subtests) ==================
[21:36:04] [PASSED] drm_test_buddy_alloc_limit
[21:36:04] [PASSED] drm_test_buddy_alloc_optimistic
[21:36:04] [PASSED] drm_test_buddy_alloc_pessimistic
[21:36:04] [PASSED] drm_test_buddy_alloc_pathological
[21:36:04] [PASSED] drm_test_buddy_alloc_contiguous
[21:36:04] [PASSED] drm_test_buddy_alloc_clear
[21:36:04] [PASSED] drm_test_buddy_alloc_range_bias
[21:36:04] ==================== [PASSED] drm_buddy ====================
[21:36:04] ============= drm_cmdline_parser (40 subtests) =============
[21:36:04] [PASSED] drm_test_cmdline_force_d_only
[21:36:04] [PASSED] drm_test_cmdline_force_D_only_dvi
[21:36:04] [PASSED] drm_test_cmdline_force_D_only_hdmi
[21:36:04] [PASSED] drm_test_cmdline_force_D_only_not_digital
[21:36:04] [PASSED] drm_test_cmdline_force_e_only
[21:36:04] [PASSED] drm_test_cmdline_res
[21:36:04] [PASSED] drm_test_cmdline_res_vesa
[21:36:04] [PASSED] drm_test_cmdline_res_vesa_rblank
[21:36:04] [PASSED] drm_test_cmdline_res_rblank
[21:36:04] [PASSED] drm_test_cmdline_res_bpp
[21:36:04] [PASSED] drm_test_cmdline_res_refresh
[21:36:04] [PASSED] drm_test_cmdline_res_bpp_refresh
[21:36:04] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[21:36:04] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[21:36:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[21:36:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[21:36:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[21:36:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[21:36:04] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[21:36:04] [PASSED] drm_test_cmdline_res_margins_force_on
[21:36:04] [PASSED] drm_test_cmdline_res_vesa_margins
[21:36:04] [PASSED] drm_test_cmdline_name
[21:36:04] [PASSED] drm_test_cmdline_name_bpp
[21:36:04] [PASSED] drm_test_cmdline_name_option
[21:36:04] [PASSED] drm_test_cmdline_name_bpp_option
[21:36:04] [PASSED] drm_test_cmdline_rotate_0
[21:36:04] [PASSED] drm_test_cmdline_rotate_90
[21:36:04] [PASSED] drm_test_cmdline_rotate_180
[21:36:04] [PASSED] drm_test_cmdline_rotate_270
[21:36:04] [PASSED] drm_test_cmdline_hmirror
[21:36:04] [PASSED] drm_test_cmdline_vmirror
[21:36:04] [PASSED] drm_test_cmdline_margin_options
[21:36:04] [PASSED] drm_test_cmdline_multiple_options
[21:36:04] [PASSED] drm_test_cmdline_bpp_extra_and_option
[21:36:04] [PASSED] drm_test_cmdline_extra_and_option
[21:36:04] [PASSED] drm_test_cmdline_freestanding_options
[21:36:04] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[21:36:04] [PASSED] drm_test_cmdline_panel_orientation
[21:36:04] ================ drm_test_cmdline_invalid  =================
[21:36:04] [PASSED] margin_only
[21:36:04] [PASSED] interlace_only
[21:36:04] [PASSED] res_missing_x
[21:36:04] [PASSED] res_missing_y
[21:36:04] [PASSED] res_bad_y
[21:36:04] [PASSED] res_missing_y_bpp
[21:36:04] [PASSED] res_bad_bpp
[21:36:04] [PASSED] res_bad_refresh
[21:36:04] [PASSED] res_bpp_refresh_force_on_off
[21:36:04] [PASSED] res_invalid_mode
[21:36:04] [PASSED] res_bpp_wrong_place_mode
[21:36:04] [PASSED] name_bpp_refresh
[21:36:04] [PASSED] name_refresh
[21:36:04] [PASSED] name_refresh_wrong_mode
[21:36:04] [PASSED] name_refresh_invalid_mode
[21:36:04] [PASSED] rotate_multiple
[21:36:04] [PASSED] rotate_invalid_val
[21:36:04] [PASSED] rotate_truncated
[21:36:04] [PASSED] invalid_option
[21:36:04] [PASSED] invalid_tv_option
[21:36:04] [PASSED] truncated_tv_option
[21:36:04] ============ [PASSED] drm_test_cmdline_invalid =============
[21:36:04] =============== drm_test_cmdline_tv_options  ===============
[21:36:04] [PASSED] NTSC
[21:36:04] [PASSED] NTSC_443
[21:36:04] [PASSED] NTSC_J
[21:36:04] [PASSED] PAL
[21:36:04] [PASSED] PAL_M
[21:36:04] [PASSED] PAL_N
[21:36:04] [PASSED] SECAM
[21:36:04] =========== [PASSED] drm_test_cmdline_tv_options ===========
[21:36:04] =============== [PASSED] drm_cmdline_parser ================
[21:36:04] ========== drmm_connector_hdmi_init (19 subtests) ==========
[21:36:04] [PASSED] drm_test_connector_hdmi_init_valid
[21:36:04] [PASSED] drm_test_connector_hdmi_init_bpc_8
[21:36:04] [PASSED] drm_test_connector_hdmi_init_bpc_10
[21:36:04] [PASSED] drm_test_connector_hdmi_init_bpc_12
[21:36:04] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[21:36:04] [PASSED] drm_test_connector_hdmi_init_bpc_null
[21:36:04] [PASSED] drm_test_connector_hdmi_init_formats_empty
[21:36:04] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[21:36:04] [PASSED] drm_test_connector_hdmi_init_null_ddc
[21:36:04] [PASSED] drm_test_connector_hdmi_init_null_product
[21:36:04] [PASSED] drm_test_connector_hdmi_init_null_vendor
[21:36:04] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[21:36:04] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[21:36:04] [PASSED] drm_test_connector_hdmi_init_product_valid
[21:36:04] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[21:36:04] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[21:36:04] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[21:36:04] ========= drm_test_connector_hdmi_init_type_valid  =========
[21:36:04] [PASSED] HDMI-A
[21:36:04] [PASSED] HDMI-B
[21:36:04] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[21:36:04] ======== drm_test_connector_hdmi_init_type_invalid  ========
[21:36:04] [PASSED] Unknown
[21:36:04] [PASSED] VGA
[21:36:04] [PASSED] DVI-I
[21:36:04] [PASSED] DVI-D
[21:36:04] [PASSED] DVI-A
[21:36:04] [PASSED] Composite
[21:36:04] [PASSED] SVIDEO
[21:36:04] [PASSED] LVDS
[21:36:04] [PASSED] Component
[21:36:04] [PASSED] DIN
[21:36:04] [PASSED] DP
[21:36:04] [PASSED] TV
[21:36:04] [PASSED] eDP
[21:36:04] [PASSED] Virtual
[21:36:04] [PASSED] DSI
[21:36:04] [PASSED] DPI
[21:36:04] [PASSED] Writeback
[21:36:04] [PASSED] SPI
[21:36:04] [PASSED] USB
[21:36:04] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[21:36:04] ============ [PASSED] drmm_connector_hdmi_init =============
[21:36:04] ============= drmm_connector_init (3 subtests) =============
[21:36:04] [PASSED] drm_test_drmm_connector_init
[21:36:04] [PASSED] drm_test_drmm_connector_init_null_ddc
[21:36:04] ========= drm_test_drmm_connector_init_type_valid  =========
[21:36:04] [PASSED] Unknown
[21:36:04] [PASSED] VGA
[21:36:04] [PASSED] DVI-I
[21:36:04] [PASSED] DVI-D
[21:36:04] [PASSED] DVI-A
[21:36:04] [PASSED] Composite
[21:36:04] [PASSED] SVIDEO
[21:36:04] [PASSED] LVDS
[21:36:04] [PASSED] Component
[21:36:04] [PASSED] DIN
[21:36:04] [PASSED] DP
[21:36:04] [PASSED] HDMI-A
[21:36:04] [PASSED] HDMI-B
[21:36:04] [PASSED] TV
[21:36:04] [PASSED] eDP
[21:36:04] [PASSED] Virtual
[21:36:04] [PASSED] DSI
[21:36:04] [PASSED] DPI
[21:36:04] [PASSED] Writeback
[21:36:04] [PASSED] SPI
[21:36:04] [PASSED] USB
[21:36:04] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[21:36:04] =============== [PASSED] drmm_connector_init ===============
[21:36:04] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[21:36:04] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[21:36:04] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[21:36:04] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[21:36:04] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[21:36:04] ========== drm_test_get_tv_mode_from_name_valid  ===========
[21:36:04] [PASSED] NTSC
[21:36:04] [PASSED] NTSC-443
[21:36:04] [PASSED] NTSC-J
[21:36:04] [PASSED] PAL
[21:36:04] [PASSED] PAL-M
[21:36:04] [PASSED] PAL-N
[21:36:04] [PASSED] SECAM
[21:36:04] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[21:36:04] [PASSED] drm_test_get_tv_mode_from_name_truncated
[21:36:04] ============ [PASSED] drm_get_tv_mode_from_name ============
[21:36:04] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[21:36:04] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[21:36:04] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[21:36:04] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[21:36:04] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[21:36:04] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[21:36:04] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[21:36:04] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[21:36:04] [PASSED] VIC 96
[21:36:04] [PASSED] VIC 97
[21:36:04] [PASSED] VIC 101
[21:36:04] [PASSED] VIC 102
[21:36:04] [PASSED] VIC 106
[21:36:04] [PASSED] VIC 107
[21:36:04] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[21:36:04] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[21:36:04] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[21:36:04] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[21:36:04] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[21:36:04] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[21:36:04] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[21:36:04] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[21:36:04] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[21:36:04] [PASSED] Automatic
[21:36:04] [PASSED] Full
[21:36:04] [PASSED] Limited 16:235
[21:36:04] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[21:36:04] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[21:36:04] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[21:36:04] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[21:36:04] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[21:36:04] [PASSED] RGB
[21:36:04] [PASSED] YUV 4:2:0
[21:36:04] [PASSED] YUV 4:2:2
[21:36:04] [PASSED] YUV 4:4:4
[21:36:04] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[21:36:04] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[21:36:04] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[21:36:04] ============= drm_damage_helper (21 subtests) ==============
[21:36:04] [PASSED] drm_test_damage_iter_no_damage
[21:36:04] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[21:36:04] [PASSED] drm_test_damage_iter_no_damage_src_moved
[21:36:04] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[21:36:04] [PASSED] drm_test_damage_iter_no_damage_not_visible
[21:36:04] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[21:36:04] [PASSED] drm_test_damage_iter_no_damage_no_fb
[21:36:04] [PASSED] drm_test_damage_iter_simple_damage
[21:36:04] [PASSED] drm_test_damage_iter_single_damage
[21:36:04] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[21:36:04] [PASSED] drm_test_damage_iter_single_damage_outside_src
[21:36:04] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[21:36:04] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[21:36:04] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[21:36:04] [PASSED] drm_test_damage_iter_single_damage_src_moved
[21:36:04] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[21:36:04] [PASSED] drm_test_damage_iter_damage
[21:36:04] [PASSED] drm_test_damage_iter_damage_one_intersect
[21:36:04] [PASSED] drm_test_damage_iter_damage_one_outside
[21:36:04] [PASSED] drm_test_damage_iter_damage_src_moved
[21:36:04] [PASSED] drm_test_damage_iter_damage_not_visible
[21:36:04] ================ [PASSED] drm_damage_helper ================
[21:36:04] ============== drm_dp_mst_helper (3 subtests) ==============
[21:36:04] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[21:36:04] [PASSED] Clock 154000 BPP 30 DSC disabled
[21:36:04] [PASSED] Clock 234000 BPP 30 DSC disabled
[21:36:04] [PASSED] Clock 297000 BPP 24 DSC disabled
[21:36:04] [PASSED] Clock 332880 BPP 24 DSC enabled
[21:36:04] [PASSED] Clock 324540 BPP 24 DSC enabled
[21:36:04] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[21:36:04] ============== drm_test_dp_mst_calc_pbn_div  ===============
[21:36:04] [PASSED] Link rate 2000000 lane count 4
[21:36:04] [PASSED] Link rate 2000000 lane count 2
[21:36:04] [PASSED] Link rate 2000000 lane count 1
[21:36:04] [PASSED] Link rate 1350000 lane count 4
[21:36:04] [PASSED] Link rate 1350000 lane count 2
[21:36:04] [PASSED] Link rate 1350000 lane count 1
[21:36:04] [PASSED] Link rate 1000000 lane count 4
[21:36:04] [PASSED] Link rate 1000000 lane count 2
[21:36:04] [PASSED] Link rate 1000000 lane count 1
[21:36:04] [PASSED] Link rate 810000 lane count 4
[21:36:04] [PASSED] Link rate 810000 lane count 2
[21:36:04] [PASSED] Link rate 810000 lane count 1
[21:36:04] [PASSED] Link rate 540000 lane count 4
[21:36:04] [PASSED] Link rate 540000 lane count 2
[21:36:04] [PASSED] Link rate 540000 lane count 1
[21:36:04] [PASSED] Link rate 270000 lane count 4
[21:36:04] [PASSED] Link rate 270000 lane count 2
[21:36:04] [PASSED] Link rate 270000 lane count 1
[21:36:04] [PASSED] Link rate 162000 lane count 4
[21:36:04] [PASSED] Link rate 162000 lane count 2
[21:36:04] [PASSED] Link rate 162000 lane count 1
[21:36:04] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[21:36:04] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[21:36:04] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[21:36:04] [PASSED] DP_POWER_UP_PHY with port number
[21:36:04] [PASSED] DP_POWER_DOWN_PHY with port number
[21:36:04] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[21:36:04] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[21:36:04] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[21:36:04] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[21:36:04] [PASSED] DP_QUERY_PAYLOAD with port number
[21:36:04] [PASSED] DP_QUERY_PAYLOAD with VCPI
[21:36:04] [PASSED] DP_REMOTE_DPCD_READ with port number
[21:36:04] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[21:36:04] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[21:36:04] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[21:36:04] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[21:36:04] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[21:36:04] [PASSED] DP_REMOTE_I2C_READ with port number
[21:36:04] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[21:36:04] [PASSED] DP_REMOTE_I2C_READ with transactions array
[21:36:04] [PASSED] DP_REMOTE_I2C_WRITE with port number
[21:36:04] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[21:36:04] [PASSED] DP_REMOTE_I2C_WRITE with data array
[21:36:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[21:36:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[21:36:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[21:36:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[21:36:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[21:36:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[21:36:04] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[21:36:04] ================ [PASSED] drm_dp_mst_helper ================
[21:36:04] ================== drm_exec (7 subtests) ===================
[21:36:04] [PASSED] sanitycheck
[21:36:04] [PASSED] test_lock
[21:36:04] [PASSED] test_lock_unlock
[21:36:04] [PASSED] test_duplicates
[21:36:04] [PASSED] test_prepare
[21:36:04] [PASSED] test_prepare_array
[21:36:04] [PASSED] test_multiple_loops
[21:36:04] ==================== [PASSED] drm_exec =====================
[21:36:04] =========== drm_format_helper_test (17 subtests) ===========
[21:36:04] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[21:36:04] [PASSED] single_pixel_source_buffer
[21:36:04] [PASSED] single_pixel_clip_rectangle
[21:36:04] [PASSED] well_known_colors
[21:36:04] [PASSED] destination_pitch
[21:36:04] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[21:36:04] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[21:36:04] [PASSED] single_pixel_source_buffer
[21:36:04] [PASSED] single_pixel_clip_rectangle
[21:36:04] [PASSED] well_known_colors
[21:36:04] [PASSED] destination_pitch
[21:36:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[21:36:04] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[21:36:04] [PASSED] single_pixel_source_buffer
[21:36:04] [PASSED] single_pixel_clip_rectangle
[21:36:04] [PASSED] well_known_colors
[21:36:04] [PASSED] destination_pitch
[21:36:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[21:36:04] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[21:36:04] [PASSED] single_pixel_source_buffer
[21:36:04] [PASSED] single_pixel_clip_rectangle
[21:36:04] [PASSED] well_known_colors
[21:36:04] [PASSED] destination_pitch
[21:36:04] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[21:36:04] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[21:36:04] [PASSED] single_pixel_source_buffer
[21:36:04] [PASSED] single_pixel_clip_rectangle
[21:36:04] [PASSED] well_known_colors
[21:36:04] [PASSED] destination_pitch
[21:36:04] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[21:36:04] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[21:36:04] [PASSED] single_pixel_source_buffer
[21:36:04] [PASSED] single_pixel_clip_rectangle
[21:36:04] [PASSED] well_known_colors
[21:36:04] [PASSED] destination_pitch
[21:36:04] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[21:36:04] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[21:36:04] [PASSED] single_pixel_source_buffer
[21:36:04] [PASSED] single_pixel_clip_rectangle
[21:36:04] [PASSED] well_known_colors
[21:36:04] [PASSED] destination_pitch
[21:36:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[21:36:04] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[21:36:04] [PASSED] single_pixel_source_buffer
[21:36:04] [PASSED] single_pixel_clip_rectangle
[21:36:04] [PASSED] well_known_colors
[21:36:04] [PASSED] destination_pitch
[21:36:04] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[21:36:04] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[21:36:04] [PASSED] single_pixel_source_buffer
[21:36:04] [PASSED] single_pixel_clip_rectangle
[21:36:04] [PASSED] well_known_colors
[21:36:04] [PASSED] destination_pitch
[21:36:04] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[21:36:04] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[21:36:04] [PASSED] single_pixel_source_buffer
[21:36:04] [PASSED] single_pixel_clip_rectangle
[21:36:04] [PASSED] well_known_colors
[21:36:04] [PASSED] destination_pitch
[21:36:04] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[21:36:04] ============== drm_test_fb_xrgb8888_to_mono  ===============
[21:36:04] [PASSED] single_pixel_source_buffer
[21:36:04] [PASSED] single_pixel_clip_rectangle
[21:36:04] [PASSED] well_known_colors
[21:36:04] [PASSED] destination_pitch
[21:36:04] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[21:36:04] ==================== drm_test_fb_swab  =====================
[21:36:04] [PASSED] single_pixel_source_buffer
[21:36:04] [PASSED] single_pixel_clip_rectangle
[21:36:04] [PASSED] well_known_colors
[21:36:04] [PASSED] destination_pitch
[21:36:04] ================ [PASSED] drm_test_fb_swab =================
[21:36:04] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[21:36:04] [PASSED] single_pixel_source_buffer
[21:36:04] [PASSED] single_pixel_clip_rectangle
[21:36:04] [PASSED] well_known_colors
[21:36:04] [PASSED] destination_pitch
[21:36:04] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[21:36:04] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[21:36:04] [PASSED] single_pixel_source_buffer
[21:36:04] [PASSED] single_pixel_clip_rectangle
[21:36:04] [PASSED] well_known_colors
[21:36:04] [PASSED] destination_pitch
[21:36:04] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[21:36:04] ================= drm_test_fb_clip_offset  =================
[21:36:04] [PASSED] pass through
[21:36:04] [PASSED] horizontal offset
[21:36:04] [PASSED] vertical offset
[21:36:04] [PASSED] horizontal and vertical offset
[21:36:04] [PASSED] horizontal offset (custom pitch)
[21:36:04] [PASSED] vertical offset (custom pitch)
[21:36:04] [PASSED] horizontal and vertical offset (custom pitch)
[21:36:04] ============= [PASSED] drm_test_fb_clip_offset =============
[21:36:04] ============== drm_test_fb_build_fourcc_list  ==============
[21:36:04] [PASSED] no native formats
[21:36:04] [PASSED] XRGB8888 as native format
[21:36:04] [PASSED] remove duplicates
[21:36:04] [PASSED] convert alpha formats
[21:36:04] [PASSED] random formats
[21:36:04] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[21:36:04] =================== drm_test_fb_memcpy  ====================
[21:36:04] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[21:36:04] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[21:36:04] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[21:36:04] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[21:36:04] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[21:36:04] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[21:36:04] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[21:36:04] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[21:36:04] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[21:36:04] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[21:36:04] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[21:36:04] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[21:36:04] =============== [PASSED] drm_test_fb_memcpy ================
[21:36:04] ============= [PASSED] drm_format_helper_test ==============
[21:36:04] ================= drm_format (18 subtests) =================
[21:36:04] [PASSED] drm_test_format_block_width_invalid
[21:36:04] [PASSED] drm_test_format_block_width_one_plane
[21:36:04] [PASSED] drm_test_format_block_width_two_plane
[21:36:04] [PASSED] drm_test_format_block_width_three_plane
[21:36:04] [PASSED] drm_test_format_block_width_tiled
[21:36:04] [PASSED] drm_test_format_block_height_invalid
[21:36:04] [PASSED] drm_test_format_block_height_one_plane
[21:36:04] [PASSED] drm_test_format_block_height_two_plane
[21:36:04] [PASSED] drm_test_format_block_height_three_plane
[21:36:04] [PASSED] drm_test_format_block_height_tiled
[21:36:04] [PASSED] drm_test_format_min_pitch_invalid
[21:36:04] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[21:36:04] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[21:36:04] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[21:36:04] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[21:36:04] [PASSED] drm_test_format_min_pitch_two_plane
[21:36:04] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[21:36:04] [PASSED] drm_test_format_min_pitch_tiled
[21:36:04] =================== [PASSED] drm_format ====================
[21:36:04] =============== drm_framebuffer (1 subtest) ================
[21:36:04] =============== drm_test_framebuffer_create  ===============
[21:36:04] [PASSED] ABGR8888 normal sizes
[21:36:04] [PASSED] ABGR8888 max sizes
[21:36:04] [PASSED] ABGR8888 pitch greater than min required
[21:36:04] [PASSED] ABGR8888 pitch less than min required
[21:36:04] [PASSED] ABGR8888 Invalid width
[21:36:04] [PASSED] ABGR8888 Invalid buffer handle
[21:36:04] [PASSED] No pixel format
[21:36:04] [PASSED] ABGR8888 Width 0
[21:36:04] [PASSED] ABGR8888 Height 0
[21:36:04] [PASSED] ABGR8888 Out of bound height * pitch combination
[21:36:04] [PASSED] ABGR8888 Large buffer offset
[21:36:04] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[21:36:04] [PASSED] ABGR8888 Valid buffer modifier
[21:36:04] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[21:36:04] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[21:36:04] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[21:36:04] [PASSED] NV12 Normal sizes
[21:36:04] [PASSED] NV12 Max sizes
[21:36:04] [PASSED] NV12 Invalid pitch
[21:36:04] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[21:36:04] [PASSED] NV12 different  modifier per-plane
[21:36:04] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[21:36:04] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[21:36:04] [PASSED] NV12 Modifier for inexistent plane
[21:36:04] [PASSED] NV12 Handle for inexistent plane
[21:36:04] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[21:36:04] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[21:36:04] [PASSED] YVU420 Normal sizes
[21:36:04] [PASSED] YVU420 Max sizes
[21:36:04] [PASSED] YVU420 Invalid pitch
[21:36:04] [PASSED] YVU420 Different pitches
[21:36:04] [PASSED] YVU420 Different buffer offsets/pitches
[21:36:04] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[21:36:04] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[21:36:04] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[21:36:04] [PASSED] YVU420 Valid modifier
[21:36:04] [PASSED] YVU420 Different modifiers per plane
[21:36:04] [PASSED] YVU420 Modifier for inexistent plane
[21:36:04] [PASSED] X0L2 Normal sizes
[21:36:04] [PASSED] X0L2 Max sizes
[21:36:04] [PASSED] X0L2 Invalid pitch
[21:36:04] [PASSED] X0L2 Pitch greater than minimum required
[21:36:04] [PASSED] X0L2 Handle for inexistent plane
[21:36:04] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[21:36:04] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[21:36:04] [PASSED] X0L2 Valid modifier
[21:36:04] [PASSED] X0L2 Modifier for inexistent plane
[21:36:04] =========== [PASSED] drm_test_framebuffer_create ===========
[21:36:04] ================= [PASSED] drm_framebuffer =================
[21:36:04] ================ drm_gem_shmem (8 subtests) ================
[21:36:04] [PASSED] drm_gem_shmem_test_obj_create
[21:36:04] [PASSED] drm_gem_shmem_test_obj_create_private
[21:36:04] [PASSED] drm_gem_shmem_test_pin_pages
[21:36:04] [PASSED] drm_gem_shmem_test_vmap
[21:36:04] [PASSED] drm_gem_shmem_test_get_pages_sgt
[21:36:04] [PASSED] drm_gem_shmem_test_get_sg_table
[21:36:04] [PASSED] drm_gem_shmem_test_madvise
[21:36:04] [PASSED] drm_gem_shmem_test_purge
[21:36:04] ================== [PASSED] drm_gem_shmem ==================
[21:36:04] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[21:36:04] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[21:36:04] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[21:36:04] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[21:36:04] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[21:36:04] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[21:36:04] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[21:36:04] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[21:36:04] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[21:36:04] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[21:36:04] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[21:36:04] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[21:36:04] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[21:36:04] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[21:36:04] [PASSED] drm_test_check_output_bpc_dvi
[21:36:04] [PASSED] drm_test_check_output_bpc_format_vic_1
[21:36:04] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[21:36:04] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[21:36:04] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[21:36:04] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[21:36:04] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[21:36:04] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[21:36:04] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[21:36:04] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[21:36:04] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[21:36:04] [PASSED] drm_test_check_broadcast_rgb_value
[21:36:04] [PASSED] drm_test_check_bpc_8_value
[21:36:04] [PASSED] drm_test_check_bpc_10_value
[21:36:04] [PASSED] drm_test_check_bpc_12_value
[21:36:04] [PASSED] drm_test_check_format_value
[21:36:04] [PASSED] drm_test_check_tmds_char_value
[21:36:04] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[21:36:04] ================= drm_managed (2 subtests) =================
[21:36:04] [PASSED] drm_test_managed_release_action
[21:36:04] [PASSED] drm_test_managed_run_action
[21:36:04] =================== [PASSED] drm_managed ===================
[21:36:04] =================== drm_mm (6 subtests) ====================
[21:36:04] [PASSED] drm_test_mm_init
[21:36:04] [PASSED] drm_test_mm_debug
[21:36:04] [PASSED] drm_test_mm_align32
[21:36:04] [PASSED] drm_test_mm_align64
[21:36:04] [PASSED] drm_test_mm_lowest
[21:36:04] [PASSED] drm_test_mm_highest
[21:36:04] ===================== [PASSED] drm_mm ======================
[21:36:04] ============= drm_modes_analog_tv (4 subtests) =============
[21:36:04] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[21:36:04] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[21:36:04] [PASSED] drm_test_modes_analog_tv_pal_576i
[21:36:04] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[21:36:04] =============== [PASSED] drm_modes_analog_tv ===============
[21:36:04] ============== drm_plane_helper (2 subtests) ===============
[21:36:04] =============== drm_test_check_plane_state  ================
[21:36:04] [PASSED] clipping_simple
[21:36:04] [PASSED] clipping_rotate_reflect
[21:36:04] [PASSED] positioning_simple
[21:36:04] [PASSED] upscaling
[21:36:04] [PASSED] downscaling
[21:36:04] [PASSED] rounding1
[21:36:04] [PASSED] rounding2
[21:36:04] [PASSED] rounding3
[21:36:04] [PASSED] rounding4
[21:36:04] =========== [PASSED] drm_test_check_plane_state ============
[21:36:04] =========== drm_test_check_invalid_plane_state  ============
[21:36:04] [PASSED] positioning_invalid
[21:36:04] [PASSED] upscaling_invalid
[21:36:04] [PASSED] downscaling_invalid
[21:36:04] ======= [PASSED] drm_test_check_invalid_plane_state ========
[21:36:04] ================ [PASSED] drm_plane_helper =================
stty: 'standard input': Inappropriate ioctl for device
[21:36:04] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[21:36:04] ====== drm_test_connector_helper_tv_get_modes_check  =======
[21:36:04] [PASSED] None
[21:36:04] [PASSED] PAL
[21:36:04] [PASSED] NTSC
[21:36:04] [PASSED] Both, NTSC Default
[21:36:04] [PASSED] Both, PAL Default
[21:36:04] [PASSED] Both, NTSC Default, with PAL on command-line
[21:36:04] [PASSED] Both, PAL Default, with NTSC on command-line
[21:36:04] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[21:36:04] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[21:36:04] ================== drm_rect (9 subtests) ===================
[21:36:04] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[21:36:04] [PASSED] drm_test_rect_clip_scaled_not_clipped
[21:36:04] [PASSED] drm_test_rect_clip_scaled_clipped
[21:36:04] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[21:36:04] ================= drm_test_rect_intersect  =================
[21:36:04] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[21:36:04] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[21:36:04] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[21:36:04] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[21:36:04] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[21:36:04] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[21:36:04] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[21:36:04] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[21:36:04] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[21:36:04] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[21:36:04] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[21:36:04] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[21:36:04] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[21:36:04] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[21:36:04] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[21:36:04] ============= [PASSED] drm_test_rect_intersect =============
[21:36:04] ================ drm_test_rect_calc_hscale  ================
[21:36:04] [PASSED] normal use
[21:36:04] [PASSED] out of max range
[21:36:04] [PASSED] out of min range
[21:36:04] [PASSED] zero dst
[21:36:04] [PASSED] negative src
[21:36:04] [PASSED] negative dst
[21:36:04] ============ [PASSED] drm_test_rect_calc_hscale ============
[21:36:04] ================ drm_test_rect_calc_vscale  ================
[21:36:04] [PASSED] normal use
[21:36:04] [PASSED] out of max range
[21:36:04] [PASSED] out of min range
[21:36:04] [PASSED] zero dst
[21:36:04] [PASSED] negative src
[21:36:04] [PASSED] negative dst
[21:36:04] ============ [PASSED] drm_test_rect_calc_vscale ============
[21:36:04] ================== drm_test_rect_rotate  ===================
[21:36:04] [PASSED] reflect-x
[21:36:04] [PASSED] reflect-y
[21:36:04] [PASSED] rotate-0
[21:36:04] [PASSED] rotate-90
[21:36:04] [PASSED] rotate-180
[21:36:04] [PASSED] rotate-270
[21:36:04] ============== [PASSED] drm_test_rect_rotate ===============
[21:36:04] ================ drm_test_rect_rotate_inv  =================
[21:36:04] [PASSED] reflect-x
[21:36:04] [PASSED] reflect-y
[21:36:04] [PASSED] rotate-0
[21:36:04] [PASSED] rotate-90
[21:36:04] [PASSED] rotate-180
[21:36:04] [PASSED] rotate-270
[21:36:04] ============ [PASSED] drm_test_rect_rotate_inv =============
[21:36:04] ==================== [PASSED] drm_rect =====================
[21:36:04] ============================================================
[21:36:04] Testing complete. Ran 511 tests: passed: 511
[21:36:04] Elapsed time: 23.418s total, 1.720s configuring, 21.443s building, 0.202s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[21:36:04] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:36:06] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[21:36:15] Starting KUnit Kernel (1/1)...
[21:36:15] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[21:36:15] ================= ttm_device (5 subtests) ==================
[21:36:15] [PASSED] ttm_device_init_basic
[21:36:15] [PASSED] ttm_device_init_multiple
[21:36:15] [PASSED] ttm_device_fini_basic
[21:36:15] [PASSED] ttm_device_init_no_vma_man
[21:36:15] ================== ttm_device_init_pools  ==================
[21:36:15] [PASSED] No DMA allocations, no DMA32 required
[21:36:15] [PASSED] DMA allocations, DMA32 required
[21:36:15] [PASSED] No DMA allocations, DMA32 required
[21:36:15] [PASSED] DMA allocations, no DMA32 required
[21:36:15] ============== [PASSED] ttm_device_init_pools ==============
[21:36:15] =================== [PASSED] ttm_device ====================
[21:36:15] ================== ttm_pool (8 subtests) ===================
[21:36:15] ================== ttm_pool_alloc_basic  ===================
[21:36:15] [PASSED] One page
[21:36:15] [PASSED] More than one page
[21:36:15] [PASSED] Above the allocation limit
[21:36:15] [PASSED] One page, with coherent DMA mappings enabled
[21:36:15] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[21:36:15] ============== [PASSED] ttm_pool_alloc_basic ===============
[21:36:15] ============== ttm_pool_alloc_basic_dma_addr  ==============
[21:36:15] [PASSED] One page
[21:36:15] [PASSED] More than one page
[21:36:15] [PASSED] Above the allocation limit
[21:36:15] [PASSED] One page, with coherent DMA mappings enabled
[21:36:15] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[21:36:15] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[21:36:15] [PASSED] ttm_pool_alloc_order_caching_match
[21:36:15] [PASSED] ttm_pool_alloc_caching_mismatch
[21:36:15] [PASSED] ttm_pool_alloc_order_mismatch
[21:36:15] [PASSED] ttm_pool_free_dma_alloc
[21:36:15] [PASSED] ttm_pool_free_no_dma_alloc
[21:36:15] [PASSED] ttm_pool_fini_basic
[21:36:15] ==================== [PASSED] ttm_pool =====================
[21:36:15] ================ ttm_resource (8 subtests) =================
[21:36:15] ================= ttm_resource_init_basic  =================
[21:36:15] [PASSED] Init resource in TTM_PL_SYSTEM
[21:36:15] [PASSED] Init resource in TTM_PL_VRAM
[21:36:15] [PASSED] Init resource in a private placement
[21:36:15] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[21:36:15] ============= [PASSED] ttm_resource_init_basic =============
[21:36:15] [PASSED] ttm_resource_init_pinned
[21:36:15] [PASSED] ttm_resource_fini_basic
[21:36:15] [PASSED] ttm_resource_manager_init_basic
[21:36:15] [PASSED] ttm_resource_manager_usage_basic
[21:36:15] [PASSED] ttm_resource_manager_set_used_basic
[21:36:15] [PASSED] ttm_sys_man_alloc_basic
[21:36:15] [PASSED] ttm_sys_man_free_basic
[21:36:15] ================== [PASSED] ttm_resource ===================
[21:36:15] =================== ttm_tt (15 subtests) ===================
[21:36:15] ==================== ttm_tt_init_basic  ====================
[21:36:15] [PASSED] Page-aligned size
[21:36:15] [PASSED] Extra pages requested
[21:36:15] ================ [PASSED] ttm_tt_init_basic ================
[21:36:15] [PASSED] ttm_tt_init_misaligned
[21:36:15] [PASSED] ttm_tt_fini_basic
[21:36:15] [PASSED] ttm_tt_fini_sg
[21:36:15] [PASSED] ttm_tt_fini_shmem
[21:36:15] [PASSED] ttm_tt_create_basic
[21:36:15] [PASSED] ttm_tt_create_invalid_bo_type
[21:36:15] [PASSED] ttm_tt_create_ttm_exists
[21:36:15] [PASSED] ttm_tt_create_failed
[21:36:15] [PASSED] ttm_tt_destroy_basic
[21:36:15] [PASSED] ttm_tt_populate_null_ttm
[21:36:15] [PASSED] ttm_tt_populate_populated_ttm
[21:36:15] [PASSED] ttm_tt_unpopulate_basic
[21:36:15] [PASSED] ttm_tt_unpopulate_empty_ttm
[21:36:15] [PASSED] ttm_tt_swapin_basic
[21:36:15] ===================== [PASSED] ttm_tt ======================
[21:36:15] =================== ttm_bo (14 subtests) ===================
[21:36:15] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[21:36:15] [PASSED] Cannot be interrupted and sleeps
[21:36:15] [PASSED] Cannot be interrupted, locks straight away
[21:36:15] [PASSED] Can be interrupted, sleeps
[21:36:15] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[21:36:15] [PASSED] ttm_bo_reserve_locked_no_sleep
[21:36:15] [PASSED] ttm_bo_reserve_no_wait_ticket
[21:36:15] [PASSED] ttm_bo_reserve_double_resv
[21:36:15] [PASSED] ttm_bo_reserve_interrupted
[21:36:15] [PASSED] ttm_bo_reserve_deadlock
[21:36:15] [PASSED] ttm_bo_unreserve_basic
[21:36:15] [PASSED] ttm_bo_unreserve_pinned
[21:36:15] [PASSED] ttm_bo_unreserve_bulk
[21:36:15] [PASSED] ttm_bo_put_basic
[21:36:15] [PASSED] ttm_bo_put_shared_resv
[21:36:15] [PASSED] ttm_bo_pin_basic
[21:36:15] [PASSED] ttm_bo_pin_unpin_resource
[21:36:15] [PASSED] ttm_bo_multiple_pin_one_unpin
[21:36:15] ===================== [PASSED] ttm_bo ======================
[21:36:15] ============== ttm_bo_validate (22 subtests) ===============
[21:36:15] ============== ttm_bo_init_reserved_sys_man  ===============
[21:36:15] [PASSED] Buffer object for userspace
[21:36:15] [PASSED] Kernel buffer object
[21:36:15] [PASSED] Shared buffer object
[21:36:15] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[21:36:15] ============== ttm_bo_init_reserved_mock_man  ==============
[21:36:15] [PASSED] Buffer object for userspace
[21:36:15] [PASSED] Kernel buffer object
[21:36:15] [PASSED] Shared buffer object
[21:36:15] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[21:36:15] [PASSED] ttm_bo_init_reserved_resv
[21:36:15] ================== ttm_bo_validate_basic  ==================
[21:36:15] [PASSED] Buffer object for userspace
[21:36:15] [PASSED] Kernel buffer object
[21:36:15] [PASSED] Shared buffer object
[21:36:15] ============== [PASSED] ttm_bo_validate_basic ==============
[21:36:15] [PASSED] ttm_bo_validate_invalid_placement
[21:36:15] ============= ttm_bo_validate_same_placement  ==============
[21:36:15] [PASSED] System manager
[21:36:15] [PASSED] VRAM manager
[21:36:15] ========= [PASSED] ttm_bo_validate_same_placement ==========
[21:36:15] [PASSED] ttm_bo_validate_failed_alloc
[21:36:15] [PASSED] ttm_bo_validate_pinned
[21:36:15] [PASSED] ttm_bo_validate_busy_placement
[21:36:15] ================ ttm_bo_validate_multihop  =================
[21:36:15] [PASSED] Buffer object for userspace
[21:36:15] [PASSED] Kernel buffer object
[21:36:15] [PASSED] Shared buffer object
[21:36:15] ============ [PASSED] ttm_bo_validate_multihop =============
[21:36:15] ========== ttm_bo_validate_no_placement_signaled  ==========
[21:36:15] [PASSED] Buffer object in system domain, no page vector
[21:36:15] [PASSED] Buffer object in system domain with an existing page vector
[21:36:15] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[21:36:15] ======== ttm_bo_validate_no_placement_not_signaled  ========
[21:36:15] [PASSED] Buffer object for userspace
[21:36:15] [PASSED] Kernel buffer object
[21:36:15] [PASSED] Shared buffer object
[21:36:15] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[21:36:15] [PASSED] ttm_bo_validate_move_fence_signaled
[21:36:15] ========= ttm_bo_validate_move_fence_not_signaled  =========
[21:36:15] [PASSED] Waits for GPU
[21:36:15] [PASSED] Tries to lock straight away
[21:36:15] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[21:36:15] [PASSED] ttm_bo_validate_swapout
[21:36:15] [PASSED] ttm_bo_validate_happy_evict
[21:36:15] [PASSED] ttm_bo_validate_all_pinned_evict
[21:36:15] [PASSED] ttm_bo_validate_allowed_only_evict
[21:36:15] [PASSED] ttm_bo_validate_deleted_evict
[21:36:15] [PASSED] ttm_bo_validate_busy_domain_evict
[21:36:15] [PASSED] ttm_bo_validate_evict_gutting
[21:36:15] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[21:36:15] ================= [PASSED] ttm_bo_validate =================
[21:36:15] ============================================================
[21:36:15] Testing complete. Ran 102 tests: passed: 102
[21:36:16] Elapsed time: 11.182s total, 1.730s configuring, 8.781s building, 0.558s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


