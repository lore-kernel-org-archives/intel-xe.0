Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5264C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 23:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B16B10E214;
	Tue, 23 Jul 2024 23:29:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C9E10E214;
 Tue, 23 Jul 2024 23:29:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/xe2=3A_Enable_Priority_?=
 =?utf-8?q?Mem_Read_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pallavi Mishra" <pallavi.mishra@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Jul 2024 23:29:11 -0000
Message-ID: <172177735127.360839.15773005368993348989@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240723233131.1122655-1-pallavi.mishra@intel.com>
In-Reply-To: <20240723233131.1122655-1-pallavi.mishra@intel.com>
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

Series: drm/xe/xe2: Enable Priority Mem Read (rev6)
URL   : https://patchwork.freedesktop.org/series/134038/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[23:28:02] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:28:06] Building KUnit Kernel ...
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

[23:28:32] Starting KUnit Kernel (1/1)...
[23:28:32] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:28:32] =================== guc_dbm (7 subtests) ===================
[23:28:32] [PASSED] test_empty
[23:28:32] [PASSED] test_default
[23:28:32] ======================== test_size  ========================
[23:28:32] [PASSED] 4
[23:28:32] [PASSED] 8
[23:28:32] [PASSED] 32
[23:28:32] [PASSED] 256
[23:28:32] ==================== [PASSED] test_size ====================
[23:28:32] ======================= test_reuse  ========================
[23:28:32] [PASSED] 4
[23:28:32] [PASSED] 8
[23:28:32] [PASSED] 32
[23:28:32] [PASSED] 256
[23:28:32] =================== [PASSED] test_reuse ====================
[23:28:32] =================== test_range_overlap  ====================
[23:28:32] [PASSED] 4
[23:28:32] [PASSED] 8
[23:28:32] [PASSED] 32
[23:28:32] [PASSED] 256
[23:28:32] =============== [PASSED] test_range_overlap ================
[23:28:32] =================== test_range_compact  ====================
[23:28:32] [PASSED] 4
[23:28:32] [PASSED] 8
[23:28:32] [PASSED] 32
[23:28:32] [PASSED] 256
[23:28:32] =============== [PASSED] test_range_compact ================
[23:28:32] ==================== test_range_spare  =====================
[23:28:32] [PASSED] 4
[23:28:32] [PASSED] 8
[23:28:32] [PASSED] 32
[23:28:32] [PASSED] 256
[23:28:32] ================ [PASSED] test_range_spare =================
[23:28:32] ===================== [PASSED] guc_dbm =====================
[23:28:32] =================== guc_idm (6 subtests) ===================
[23:28:32] [PASSED] bad_init
[23:28:32] [PASSED] no_init
[23:28:32] [PASSED] init_fini
[23:28:32] [PASSED] check_used
[23:28:32] [PASSED] check_quota
[23:28:32] [PASSED] check_all
[23:28:32] ===================== [PASSED] guc_idm =====================
[23:28:32] ================== no_relay (3 subtests) ===================
[23:28:32] [PASSED] xe_drops_guc2pf_if_not_ready
[23:28:32] [PASSED] xe_drops_guc2vf_if_not_ready
[23:28:32] [PASSED] xe_rejects_send_if_not_ready
[23:28:32] ==================== [PASSED] no_relay =====================
[23:28:32] ================== pf_relay (14 subtests) ==================
[23:28:32] [PASSED] pf_rejects_guc2pf_too_short
[23:28:32] [PASSED] pf_rejects_guc2pf_too_long
[23:28:32] [PASSED] pf_rejects_guc2pf_no_payload
[23:28:32] [PASSED] pf_fails_no_payload
[23:28:32] [PASSED] pf_fails_bad_origin
[23:28:32] [PASSED] pf_fails_bad_type
[23:28:32] [PASSED] pf_txn_reports_error
[23:28:32] [PASSED] pf_txn_sends_pf2guc
[23:28:32] [PASSED] pf_sends_pf2guc
[23:28:32] [SKIPPED] pf_loopback_nop
[23:28:32] [SKIPPED] pf_loopback_echo
[23:28:32] [SKIPPED] pf_loopback_fail
[23:28:32] [SKIPPED] pf_loopback_busy
[23:28:32] [SKIPPED] pf_loopback_retry
[23:28:32] ==================== [PASSED] pf_relay =====================
[23:28:32] ================== vf_relay (3 subtests) ===================
[23:28:32] [PASSED] vf_rejects_guc2vf_too_short
[23:28:32] [PASSED] vf_rejects_guc2vf_too_long
[23:28:32] [PASSED] vf_rejects_guc2vf_no_payload
[23:28:32] ==================== [PASSED] vf_relay =====================
[23:28:32] ================= pf_service (11 subtests) =================
[23:28:32] [PASSED] pf_negotiate_any
[23:28:32] [PASSED] pf_negotiate_base_match
[23:28:32] [PASSED] pf_negotiate_base_newer
[23:28:32] [PASSED] pf_negotiate_base_next
[23:28:32] [SKIPPED] pf_negotiate_base_older
[23:28:32] [PASSED] pf_negotiate_base_prev
[23:28:32] [PASSED] pf_negotiate_latest_match
[23:28:32] [PASSED] pf_negotiate_latest_newer
[23:28:32] [PASSED] pf_negotiate_latest_next
[23:28:32] [SKIPPED] pf_negotiate_latest_older
[23:28:32] [SKIPPED] pf_negotiate_latest_prev
[23:28:32] =================== [PASSED] pf_service ====================
[23:28:32] ===================== lmtt (1 subtest) =====================
[23:28:32] ======================== test_ops  =========================
[23:28:32] [PASSED] 2-level
[23:28:32] [PASSED] multi-level
[23:28:32] ==================== [PASSED] test_ops =====================
[23:28:32] ====================== [PASSED] lmtt =======================
[23:28:32] =================== xe_mocs (2 subtests) ===================
[23:28:32] ================ xe_live_mocs_kernel_kunit  ================
[23:28:32] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[23:28:32] ================ xe_live_mocs_reset_kunit  =================
[23:28:32] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[23:28:32] ==================== [SKIPPED] xe_mocs =====================
[23:28:32] ================= xe_migrate (2 subtests) ==================
[23:28:32] ================= xe_migrate_sanity_kunit  =================
[23:28:32] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[23:28:32] ================== xe_validate_ccs_kunit  ==================
[23:28:32] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[23:28:32] =================== [SKIPPED] xe_migrate ===================
[23:28:32] ================== xe_dma_buf (1 subtest) ==================
[23:28:32] ==================== xe_dma_buf_kunit  =====================
[23:28:32] ================ [SKIPPED] xe_dma_buf_kunit ================
[23:28:32] =================== [SKIPPED] xe_dma_buf ===================
[23:28:32] ==================== xe_bo (2 subtests) ====================
[23:28:32] ================== xe_ccs_migrate_kunit  ===================
[23:28:32] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[23:28:32] ==================== xe_bo_evict_kunit  ====================
[23:28:32] =============== [SKIPPED] xe_bo_evict_kunit ================
[23:28:32] ===================== [SKIPPED] xe_bo ======================
[23:28:32] ==================== args (11 subtests) ====================
[23:28:32] [PASSED] count_args_test
[23:28:32] [PASSED] call_args_example
[23:28:32] [PASSED] call_args_test
[23:28:32] [PASSED] drop_first_arg_example
[23:28:32] [PASSED] drop_first_arg_test
[23:28:32] [PASSED] first_arg_example
[23:28:32] [PASSED] first_arg_test
[23:28:32] [PASSED] last_arg_example
[23:28:32] [PASSED] last_arg_test
[23:28:32] [PASSED] pick_arg_example
[23:28:32] [PASSED] sep_comma_example
[23:28:32] ====================== [PASSED] args =======================
[23:28:32] =================== xe_pci (2 subtests) ====================
stty: 'standard input': Inappropriate ioctl for device
[23:28:32] [PASSED] xe_gmdid_graphics_ip
[23:28:32] [PASSED] xe_gmdid_media_ip
[23:28:32] ===================== [PASSED] xe_pci ======================
[23:28:32] ==================== xe_rtp (1 subtest) ====================
[23:28:32] ================== xe_rtp_process_tests  ===================
[23:28:32] [PASSED] coalesce-same-reg
[23:28:32] [PASSED] no-match-no-add
[23:28:32] [PASSED] match-or
[23:28:32] [PASSED] match-or-xfail
[23:28:32] [PASSED] no-match-no-add-multiple-rules
[23:28:32] [PASSED] two-regs-two-entries
[23:28:32] [PASSED] clr-one-set-other
[23:28:32] [PASSED] set-field
[23:28:32] [PASSED] conflict-duplicate
[23:28:32] [PASSED] conflict-not-disjoint
[23:28:32] [PASSED] conflict-reg-type
[23:28:32] ============== [PASSED] xe_rtp_process_tests ===============
[23:28:32] ===================== [PASSED] xe_rtp ======================
[23:28:32] ==================== xe_wa (1 subtest) =====================
[23:28:32] ======================== xe_wa_gt  =========================
[23:28:32] [PASSED] TIGERLAKE (B0)
[23:28:32] [PASSED] DG1 (A0)
[23:28:32] [PASSED] DG1 (B0)
[23:28:32] [PASSED] ALDERLAKE_S (A0)
[23:28:32] [PASSED] ALDERLAKE_S (B0)
[23:28:32] [PASSED] ALDERLAKE_S (C0)
[23:28:32] [PASSED] ALDERLAKE_S (D0)
[23:28:32] [PASSED] ALDERLAKE_P (A0)
[23:28:32] [PASSED] ALDERLAKE_P (B0)
[23:28:32] [PASSED] ALDERLAKE_P (C0)
[23:28:32] [PASSED] ALDERLAKE_S_RPLS (D0)
[23:28:32] [PASSED] ALDERLAKE_P_RPLU (E0)
[23:28:32] [PASSED] DG2_G10 (C0)
[23:28:32] [PASSED] DG2_G11 (B1)
[23:28:32] [PASSED] DG2_G12 (A1)
[23:28:32] [PASSED] METEORLAKE (g:A0, m:A0)
[23:28:32] [PASSED] METEORLAKE (g:A0, m:A0)
[23:28:32] [PASSED] METEORLAKE (g:A0, m:A0)
[23:28:32] [PASSED] LUNARLAKE (g:A0, m:A0)
[23:28:32] [PASSED] LUNARLAKE (g:B0, m:A0)
[23:28:32] ==================== [PASSED] xe_wa_gt =====================
[23:28:32] ====================== [PASSED] xe_wa ======================
[23:28:32] ============================================================
[23:28:32] Testing complete. Ran 112 tests: passed: 97, skipped: 15
[23:28:32] Elapsed time: 30.210s total, 4.243s configuring, 25.696s building, 0.219s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[23:28:33] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:28:34] Building KUnit Kernel ...
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

[23:28:56] Starting KUnit Kernel (1/1)...
[23:28:56] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:28:57] ============ drm_test_pick_cmdline (2 subtests) ============
[23:28:57] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[23:28:57] =============== drm_test_pick_cmdline_named  ===============
[23:28:57] [PASSED] NTSC
[23:28:57] [PASSED] NTSC-J
[23:28:57] [PASSED] PAL
[23:28:57] [PASSED] PAL-M
[23:28:57] =========== [PASSED] drm_test_pick_cmdline_named ===========
[23:28:57] ============== [PASSED] drm_test_pick_cmdline ==============
[23:28:57] ================== drm_buddy (7 subtests) ==================
[23:28:57] [PASSED] drm_test_buddy_alloc_limit
[23:28:57] [PASSED] drm_test_buddy_alloc_optimistic
[23:28:57] [PASSED] drm_test_buddy_alloc_pessimistic
[23:28:57] [PASSED] drm_test_buddy_alloc_pathological
[23:28:57] [PASSED] drm_test_buddy_alloc_contiguous
[23:28:57] [PASSED] drm_test_buddy_alloc_clear
[23:28:57] [PASSED] drm_test_buddy_alloc_range_bias
[23:28:57] ==================== [PASSED] drm_buddy ====================
[23:28:57] ============= drm_cmdline_parser (40 subtests) =============
[23:28:57] [PASSED] drm_test_cmdline_force_d_only
[23:28:57] [PASSED] drm_test_cmdline_force_D_only_dvi
[23:28:57] [PASSED] drm_test_cmdline_force_D_only_hdmi
[23:28:57] [PASSED] drm_test_cmdline_force_D_only_not_digital
[23:28:57] [PASSED] drm_test_cmdline_force_e_only
[23:28:57] [PASSED] drm_test_cmdline_res
[23:28:57] [PASSED] drm_test_cmdline_res_vesa
[23:28:57] [PASSED] drm_test_cmdline_res_vesa_rblank
[23:28:57] [PASSED] drm_test_cmdline_res_rblank
[23:28:57] [PASSED] drm_test_cmdline_res_bpp
[23:28:57] [PASSED] drm_test_cmdline_res_refresh
[23:28:57] [PASSED] drm_test_cmdline_res_bpp_refresh
[23:28:57] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[23:28:57] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[23:28:57] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[23:28:57] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[23:28:57] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[23:28:57] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[23:28:57] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[23:28:57] [PASSED] drm_test_cmdline_res_margins_force_on
[23:28:57] [PASSED] drm_test_cmdline_res_vesa_margins
[23:28:57] [PASSED] drm_test_cmdline_name
[23:28:57] [PASSED] drm_test_cmdline_name_bpp
[23:28:57] [PASSED] drm_test_cmdline_name_option
[23:28:57] [PASSED] drm_test_cmdline_name_bpp_option
[23:28:57] [PASSED] drm_test_cmdline_rotate_0
[23:28:57] [PASSED] drm_test_cmdline_rotate_90
[23:28:57] [PASSED] drm_test_cmdline_rotate_180
[23:28:57] [PASSED] drm_test_cmdline_rotate_270
[23:28:57] [PASSED] drm_test_cmdline_hmirror
[23:28:57] [PASSED] drm_test_cmdline_vmirror
[23:28:57] [PASSED] drm_test_cmdline_margin_options
[23:28:57] [PASSED] drm_test_cmdline_multiple_options
[23:28:57] [PASSED] drm_test_cmdline_bpp_extra_and_option
[23:28:57] [PASSED] drm_test_cmdline_extra_and_option
[23:28:57] [PASSED] drm_test_cmdline_freestanding_options
[23:28:57] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[23:28:57] [PASSED] drm_test_cmdline_panel_orientation
[23:28:57] ================ drm_test_cmdline_invalid  =================
[23:28:57] [PASSED] margin_only
[23:28:57] [PASSED] interlace_only
[23:28:57] [PASSED] res_missing_x
[23:28:57] [PASSED] res_missing_y
[23:28:57] [PASSED] res_bad_y
[23:28:57] [PASSED] res_missing_y_bpp
[23:28:57] [PASSED] res_bad_bpp
[23:28:57] [PASSED] res_bad_refresh
[23:28:57] [PASSED] res_bpp_refresh_force_on_off
[23:28:57] [PASSED] res_invalid_mode
[23:28:57] [PASSED] res_bpp_wrong_place_mode
[23:28:57] [PASSED] name_bpp_refresh
[23:28:57] [PASSED] name_refresh
[23:28:57] [PASSED] name_refresh_wrong_mode
[23:28:57] [PASSED] name_refresh_invalid_mode
[23:28:57] [PASSED] rotate_multiple
[23:28:57] [PASSED] rotate_invalid_val
[23:28:57] [PASSED] rotate_truncated
[23:28:57] [PASSED] invalid_option
[23:28:57] [PASSED] invalid_tv_option
[23:28:57] [PASSED] truncated_tv_option
[23:28:57] ============ [PASSED] drm_test_cmdline_invalid =============
[23:28:57] =============== drm_test_cmdline_tv_options  ===============
[23:28:57] [PASSED] NTSC
[23:28:57] [PASSED] NTSC_443
[23:28:57] [PASSED] NTSC_J
[23:28:57] [PASSED] PAL
[23:28:57] [PASSED] PAL_M
[23:28:57] [PASSED] PAL_N
[23:28:57] [PASSED] SECAM
[23:28:57] [PASSED] MONO_525
[23:28:57] [PASSED] MONO_625
[23:28:57] =========== [PASSED] drm_test_cmdline_tv_options ===========
[23:28:57] =============== [PASSED] drm_cmdline_parser ================
[23:28:57] ========== drmm_connector_hdmi_init (19 subtests) ==========
[23:28:57] [PASSED] drm_test_connector_hdmi_init_valid
[23:28:57] [PASSED] drm_test_connector_hdmi_init_bpc_8
[23:28:57] [PASSED] drm_test_connector_hdmi_init_bpc_10
[23:28:57] [PASSED] drm_test_connector_hdmi_init_bpc_12
[23:28:57] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[23:28:57] [PASSED] drm_test_connector_hdmi_init_bpc_null
[23:28:57] [PASSED] drm_test_connector_hdmi_init_formats_empty
[23:28:57] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[23:28:57] [PASSED] drm_test_connector_hdmi_init_null_ddc
[23:28:57] [PASSED] drm_test_connector_hdmi_init_null_product
[23:28:57] [PASSED] drm_test_connector_hdmi_init_null_vendor
[23:28:57] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[23:28:57] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[23:28:57] [PASSED] drm_test_connector_hdmi_init_product_valid
[23:28:57] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[23:28:57] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[23:28:57] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[23:28:57] ========= drm_test_connector_hdmi_init_type_valid  =========
[23:28:57] [PASSED] HDMI-A
[23:28:57] [PASSED] HDMI-B
[23:28:57] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[23:28:57] ======== drm_test_connector_hdmi_init_type_invalid  ========
[23:28:57] [PASSED] Unknown
[23:28:57] [PASSED] VGA
[23:28:57] [PASSED] DVI-I
[23:28:57] [PASSED] DVI-D
[23:28:57] [PASSED] DVI-A
[23:28:57] [PASSED] Composite
[23:28:57] [PASSED] SVIDEO
[23:28:57] [PASSED] LVDS
[23:28:57] [PASSED] Component
[23:28:57] [PASSED] DIN
[23:28:57] [PASSED] DP
[23:28:57] [PASSED] TV
[23:28:57] [PASSED] eDP
[23:28:57] [PASSED] Virtual
[23:28:57] [PASSED] DSI
[23:28:57] [PASSED] DPI
[23:28:57] [PASSED] Writeback
[23:28:57] [PASSED] SPI
[23:28:57] [PASSED] USB
[23:28:57] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[23:28:57] ============ [PASSED] drmm_connector_hdmi_init =============
[23:28:57] ============= drmm_connector_init (3 subtests) =============
[23:28:57] [PASSED] drm_test_drmm_connector_init
[23:28:57] [PASSED] drm_test_drmm_connector_init_null_ddc
[23:28:57] ========= drm_test_drmm_connector_init_type_valid  =========
[23:28:57] [PASSED] Unknown
[23:28:57] [PASSED] VGA
[23:28:57] [PASSED] DVI-I
[23:28:57] [PASSED] DVI-D
[23:28:57] [PASSED] DVI-A
[23:28:57] [PASSED] Composite
[23:28:57] [PASSED] SVIDEO
[23:28:57] [PASSED] LVDS
[23:28:57] [PASSED] Component
[23:28:57] [PASSED] DIN
[23:28:57] [PASSED] DP
[23:28:57] [PASSED] HDMI-A
[23:28:57] [PASSED] HDMI-B
[23:28:57] [PASSED] TV
[23:28:57] [PASSED] eDP
[23:28:57] [PASSED] Virtual
[23:28:57] [PASSED] DSI
[23:28:57] [PASSED] DPI
[23:28:57] [PASSED] Writeback
[23:28:57] [PASSED] SPI
[23:28:57] [PASSED] USB
[23:28:57] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[23:28:57] =============== [PASSED] drmm_connector_init ===============
[23:28:57] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[23:28:57] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[23:28:57] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[23:28:57] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[23:28:57] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[23:28:57] ========== drm_test_get_tv_mode_from_name_valid  ===========
[23:28:57] [PASSED] NTSC
[23:28:57] [PASSED] NTSC-443
[23:28:57] [PASSED] NTSC-J
[23:28:57] [PASSED] PAL
[23:28:57] [PASSED] PAL-M
[23:28:57] [PASSED] PAL-N
[23:28:57] [PASSED] SECAM
[23:28:57] [PASSED] Mono
[23:28:57] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[23:28:57] [PASSED] drm_test_get_tv_mode_from_name_truncated
[23:28:57] ============ [PASSED] drm_get_tv_mode_from_name ============
[23:28:57] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[23:28:57] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[23:28:57] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[23:28:57] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[23:28:57] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[23:28:57] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[23:28:57] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[23:28:57] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[23:28:57] [PASSED] VIC 96
[23:28:57] [PASSED] VIC 97
[23:28:57] [PASSED] VIC 101
[23:28:57] [PASSED] VIC 102
[23:28:57] [PASSED] VIC 106
[23:28:57] [PASSED] VIC 107
[23:28:57] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[23:28:57] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[23:28:57] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[23:28:57] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[23:28:57] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[23:28:57] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[23:28:57] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[23:28:57] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[23:28:57] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[23:28:57] [PASSED] Automatic
[23:28:57] [PASSED] Full
[23:28:57] [PASSED] Limited 16:235
[23:28:57] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[23:28:57] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[23:28:57] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[23:28:57] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[23:28:57] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[23:28:57] [PASSED] RGB
[23:28:57] [PASSED] YUV 4:2:0
[23:28:57] [PASSED] YUV 4:2:2
[23:28:57] [PASSED] YUV 4:4:4
[23:28:57] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[23:28:57] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[23:28:57] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[23:28:57] ============= drm_damage_helper (21 subtests) ==============
[23:28:57] [PASSED] drm_test_damage_iter_no_damage
[23:28:57] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[23:28:57] [PASSED] drm_test_damage_iter_no_damage_src_moved
[23:28:57] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[23:28:57] [PASSED] drm_test_damage_iter_no_damage_not_visible
[23:28:57] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[23:28:57] [PASSED] drm_test_damage_iter_no_damage_no_fb
[23:28:57] [PASSED] drm_test_damage_iter_simple_damage
[23:28:57] [PASSED] drm_test_damage_iter_single_damage
[23:28:57] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[23:28:57] [PASSED] drm_test_damage_iter_single_damage_outside_src
[23:28:57] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[23:28:57] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[23:28:57] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[23:28:57] [PASSED] drm_test_damage_iter_single_damage_src_moved
[23:28:57] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[23:28:57] [PASSED] drm_test_damage_iter_damage
[23:28:57] [PASSED] drm_test_damage_iter_damage_one_intersect
[23:28:57] [PASSED] drm_test_damage_iter_damage_one_outside
[23:28:57] [PASSED] drm_test_damage_iter_damage_src_moved
[23:28:57] [PASSED] drm_test_damage_iter_damage_not_visible
[23:28:57] ================ [PASSED] drm_damage_helper ================
[23:28:57] ============== drm_dp_mst_helper (3 subtests) ==============
[23:28:57] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[23:28:57] [PASSED] Clock 154000 BPP 30 DSC disabled
[23:28:57] [PASSED] Clock 234000 BPP 30 DSC disabled
[23:28:57] [PASSED] Clock 297000 BPP 24 DSC disabled
[23:28:57] [PASSED] Clock 332880 BPP 24 DSC enabled
[23:28:57] [PASSED] Clock 324540 BPP 24 DSC enabled
[23:28:57] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[23:28:57] ============== drm_test_dp_mst_calc_pbn_div  ===============
[23:28:57] [PASSED] Link rate 2000000 lane count 4
[23:28:57] [PASSED] Link rate 2000000 lane count 2
[23:28:57] [PASSED] Link rate 2000000 lane count 1
[23:28:57] [PASSED] Link rate 1350000 lane count 4
[23:28:57] [PASSED] Link rate 1350000 lane count 2
[23:28:57] [PASSED] Link rate 1350000 lane count 1
[23:28:57] [PASSED] Link rate 1000000 lane count 4
[23:28:57] [PASSED] Link rate 1000000 lane count 2
[23:28:57] [PASSED] Link rate 1000000 lane count 1
[23:28:57] [PASSED] Link rate 810000 lane count 4
[23:28:57] [PASSED] Link rate 810000 lane count 2
[23:28:57] [PASSED] Link rate 810000 lane count 1
[23:28:57] [PASSED] Link rate 540000 lane count 4
[23:28:57] [PASSED] Link rate 540000 lane count 2
[23:28:57] [PASSED] Link rate 540000 lane count 1
[23:28:57] [PASSED] Link rate 270000 lane count 4
[23:28:57] [PASSED] Link rate 270000 lane count 2
[23:28:57] [PASSED] Link rate 270000 lane count 1
[23:28:57] [PASSED] Link rate 162000 lane count 4
[23:28:57] [PASSED] Link rate 162000 lane count 2
[23:28:57] [PASSED] Link rate 162000 lane count 1
[23:28:57] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[23:28:57] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[23:28:57] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[23:28:57] [PASSED] DP_POWER_UP_PHY with port number
[23:28:57] [PASSED] DP_POWER_DOWN_PHY with port number
[23:28:57] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[23:28:57] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[23:28:57] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[23:28:57] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[23:28:57] [PASSED] DP_QUERY_PAYLOAD with port number
[23:28:57] [PASSED] DP_QUERY_PAYLOAD with VCPI
[23:28:57] [PASSED] DP_REMOTE_DPCD_READ with port number
[23:28:57] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[23:28:57] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[23:28:57] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[23:28:57] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[23:28:57] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[23:28:57] [PASSED] DP_REMOTE_I2C_READ with port number
[23:28:57] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[23:28:57] [PASSED] DP_REMOTE_I2C_READ with transactions array
[23:28:57] [PASSED] DP_REMOTE_I2C_WRITE with port number
[23:28:57] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[23:28:57] [PASSED] DP_REMOTE_I2C_WRITE with data array
[23:28:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[23:28:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[23:28:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[23:28:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[23:28:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[23:28:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[23:28:57] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[23:28:57] ================ [PASSED] drm_dp_mst_helper ================
[23:28:57] ================== drm_exec (7 subtests) ===================
[23:28:57] [PASSED] sanitycheck
[23:28:57] [PASSED] test_lock
[23:28:57] [PASSED] test_lock_unlock
[23:28:57] [PASSED] test_duplicates
[23:28:57] [PASSED] test_prepare
[23:28:57] [PASSED] test_prepare_array
[23:28:57] [PASSED] test_multiple_loops
[23:28:57] ==================== [PASSED] drm_exec =====================
[23:28:57] =========== drm_format_helper_test (17 subtests) ===========
[23:28:57] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[23:28:57] [PASSED] single_pixel_source_buffer
[23:28:57] [PASSED] single_pixel_clip_rectangle
[23:28:57] [PASSED] well_known_colors
[23:28:57] [PASSED] destination_pitch
[23:28:57] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[23:28:57] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[23:28:57] [PASSED] single_pixel_source_buffer
[23:28:57] [PASSED] single_pixel_clip_rectangle
[23:28:57] [PASSED] well_known_colors
[23:28:57] [PASSED] destination_pitch
[23:28:57] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[23:28:57] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[23:28:57] [PASSED] single_pixel_source_buffer
[23:28:57] [PASSED] single_pixel_clip_rectangle
[23:28:57] [PASSED] well_known_colors
[23:28:57] [PASSED] destination_pitch
[23:28:57] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[23:28:57] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[23:28:57] [PASSED] single_pixel_source_buffer
[23:28:57] [PASSED] single_pixel_clip_rectangle
[23:28:57] [PASSED] well_known_colors
[23:28:57] [PASSED] destination_pitch
[23:28:57] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[23:28:57] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[23:28:57] [PASSED] single_pixel_source_buffer
[23:28:57] [PASSED] single_pixel_clip_rectangle
[23:28:57] [PASSED] well_known_colors
[23:28:57] [PASSED] destination_pitch
[23:28:57] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[23:28:57] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[23:28:57] [PASSED] single_pixel_source_buffer
[23:28:57] [PASSED] single_pixel_clip_rectangle
[23:28:57] [PASSED] well_known_colors
[23:28:57] [PASSED] destination_pitch
[23:28:57] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[23:28:57] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[23:28:57] [PASSED] single_pixel_source_buffer
[23:28:57] [PASSED] single_pixel_clip_rectangle
[23:28:57] [PASSED] well_known_colors
[23:28:57] [PASSED] destination_pitch
[23:28:57] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[23:28:57] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[23:28:57] [PASSED] single_pixel_source_buffer
[23:28:57] [PASSED] single_pixel_clip_rectangle
[23:28:57] [PASSED] well_known_colors
[23:28:57] [PASSED] destination_pitch
[23:28:57] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[23:28:57] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[23:28:57] [PASSED] single_pixel_source_buffer
[23:28:57] [PASSED] single_pixel_clip_rectangle
[23:28:57] [PASSED] well_known_colors
[23:28:57] [PASSED] destination_pitch
[23:28:57] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[23:28:57] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[23:28:57] [PASSED] single_pixel_source_buffer
[23:28:57] [PASSED] single_pixel_clip_rectangle
[23:28:57] [PASSED] well_known_colors
[23:28:57] [PASSED] destination_pitch
[23:28:57] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[23:28:57] ============== drm_test_fb_xrgb8888_to_mono  ===============
[23:28:57] [PASSED] single_pixel_source_buffer
[23:28:57] [PASSED] single_pixel_clip_rectangle
[23:28:57] [PASSED] well_known_colors
[23:28:57] [PASSED] destination_pitch
[23:28:57] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[23:28:57] ==================== drm_test_fb_swab  =====================
[23:28:57] [PASSED] single_pixel_source_buffer
[23:28:57] [PASSED] single_pixel_clip_rectangle
[23:28:57] [PASSED] well_known_colors
[23:28:57] [PASSED] destination_pitch
[23:28:57] ================ [PASSED] drm_test_fb_swab =================
[23:28:57] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[23:28:57] [PASSED] single_pixel_source_buffer
[23:28:57] [PASSED] single_pixel_clip_rectangle
[23:28:57] [PASSED] well_known_colors
[23:28:57] [PASSED] destination_pitch
[23:28:57] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[23:28:57] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[23:28:57] [PASSED] single_pixel_source_buffer
[23:28:57] [PASSED] single_pixel_clip_rectangle
[23:28:57] [PASSED] well_known_colors
[23:28:57] [PASSED] destination_pitch
[23:28:57] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[23:28:57] ================= drm_test_fb_clip_offset  =================
[23:28:57] [PASSED] pass through
[23:28:57] [PASSED] horizontal offset
[23:28:57] [PASSED] vertical offset
[23:28:57] [PASSED] horizontal and vertical offset
[23:28:57] [PASSED] horizontal offset (custom pitch)
[23:28:57] [PASSED] vertical offset (custom pitch)
[23:28:57] [PASSED] horizontal and vertical offset (custom pitch)
[23:28:57] ============= [PASSED] drm_test_fb_clip_offset =============
[23:28:57] ============== drm_test_fb_build_fourcc_list  ==============
[23:28:57] [PASSED] no native formats
[23:28:57] [PASSED] XRGB8888 as native format
[23:28:57] [PASSED] remove duplicates
[23:28:57] [PASSED] convert alpha formats
[23:28:57] [PASSED] random formats
[23:28:57] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[23:28:57] =================== drm_test_fb_memcpy  ====================
[23:28:57] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[23:28:57] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[23:28:57] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[23:28:57] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[23:28:57] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[23:28:57] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[23:28:57] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[23:28:57] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[23:28:57] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[23:28:57] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[23:28:57] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[23:28:57] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[23:28:57] =============== [PASSED] drm_test_fb_memcpy ================
[23:28:57] ============= [PASSED] drm_format_helper_test ==============
[23:28:57] ================= drm_format (18 subtests) =================
[23:28:57] [PASSED] drm_test_format_block_width_invalid
[23:28:57] [PASSED] drm_test_format_block_width_one_plane
[23:28:57] [PASSED] drm_test_format_block_width_two_plane
[23:28:57] [PASSED] drm_test_format_block_width_three_plane
[23:28:57] [PASSED] drm_test_format_block_width_tiled
[23:28:57] [PASSED] drm_test_format_block_height_invalid
[23:28:57] [PASSED] drm_test_format_block_height_one_plane
[23:28:57] [PASSED] drm_test_format_block_height_two_plane
[23:28:57] [PASSED] drm_test_format_block_height_three_plane
[23:28:57] [PASSED] drm_test_format_block_height_tiled
[23:28:57] [PASSED] drm_test_format_min_pitch_invalid
[23:28:57] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[23:28:57] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[23:28:57] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[23:28:57] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[23:28:57] [PASSED] drm_test_format_min_pitch_two_plane
[23:28:57] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[23:28:57] [PASSED] drm_test_format_min_pitch_tiled
[23:28:57] =================== [PASSED] drm_format ====================
[23:28:57] =============== drm_framebuffer (1 subtest) ================
[23:28:57] =============== drm_test_framebuffer_create  ===============
[23:28:57] [PASSED] ABGR8888 normal sizes
[23:28:57] [PASSED] ABGR8888 max sizes
[23:28:57] [PASSED] ABGR8888 pitch greater than min required
[23:28:57] [PASSED] ABGR8888 pitch less than min required
[23:28:57] [PASSED] ABGR8888 Invalid width
[23:28:57] [PASSED] ABGR8888 Invalid buffer handle
[23:28:57] [PASSED] No pixel format
[23:28:57] [PASSED] ABGR8888 Width 0
[23:28:57] [PASSED] ABGR8888 Height 0
[23:28:57] [PASSED] ABGR8888 Out of bound height * pitch combination
[23:28:57] [PASSED] ABGR8888 Large buffer offset
[23:28:57] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[23:28:57] [PASSED] ABGR8888 Valid buffer modifier
[23:28:57] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[23:28:57] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[23:28:57] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[23:28:57] [PASSED] NV12 Normal sizes
[23:28:57] [PASSED] NV12 Max sizes
[23:28:57] [PASSED] NV12 Invalid pitch
[23:28:57] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[23:28:57] [PASSED] NV12 different  modifier per-plane
[23:28:57] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[23:28:57] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[23:28:57] [PASSED] NV12 Modifier for inexistent plane
[23:28:57] [PASSED] NV12 Handle for inexistent plane
[23:28:57] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[23:28:57] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[23:28:57] [PASSED] YVU420 Normal sizes
[23:28:57] [PASSED] YVU420 Max sizes
[23:28:57] [PASSED] YVU420 Invalid pitch
[23:28:57] [PASSED] YVU420 Different pitches
[23:28:57] [PASSED] YVU420 Different buffer offsets/pitches
[23:28:57] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[23:28:57] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[23:28:57] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[23:28:57] [PASSED] YVU420 Valid modifier
[23:28:57] [PASSED] YVU420 Different modifiers per plane
[23:28:57] [PASSED] YVU420 Modifier for inexistent plane
[23:28:57] [PASSED] X0L2 Normal sizes
[23:28:57] [PASSED] X0L2 Max sizes
[23:28:57] [PASSED] X0L2 Invalid pitch
[23:28:57] [PASSED] X0L2 Pitch greater than minimum required
[23:28:57] [PASSED] X0L2 Handle for inexistent plane
[23:28:57] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[23:28:57] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[23:28:57] [PASSED] X0L2 Valid modifier
[23:28:57] [PASSED] X0L2 Modifier for inexistent plane
[23:28:57] =========== [PASSED] drm_test_framebuffer_create ===========
[23:28:57] ================= [PASSED] drm_framebuffer =================
[23:28:57] ================ drm_gem_shmem (8 subtests) ================
[23:28:57] [PASSED] drm_gem_shmem_test_obj_create
[23:28:57] [PASSED] drm_gem_shmem_test_obj_create_private
[23:28:57] [PASSED] drm_gem_shmem_test_pin_pages
[23:28:57] [PASSED] drm_gem_shmem_test_vmap
[23:28:57] [PASSED] drm_gem_shmem_test_get_pages_sgt
[23:28:57] [PASSED] drm_gem_shmem_test_get_sg_table
[23:28:57] [PASSED] drm_gem_shmem_test_madvise
[23:28:57] [PASSED] drm_gem_shmem_test_purge
[23:28:57] ================== [PASSED] drm_gem_shmem ==================
[23:28:57] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[23:28:57] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[23:28:57] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[23:28:57] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[23:28:57] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[23:28:57] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[23:28:57] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[23:28:57] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[23:28:57] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[23:28:57] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[23:28:57] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[23:28:57] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[23:28:57] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[23:28:57] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[23:28:57] [PASSED] drm_test_check_output_bpc_dvi
[23:28:57] [PASSED] drm_test_check_output_bpc_format_vic_1
[23:28:57] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[23:28:57] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[23:28:57] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[23:28:57] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[23:28:57] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[23:28:57] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[23:28:57] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[23:28:57] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[23:28:57] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[23:28:57] [PASSED] drm_test_check_broadcast_rgb_value
[23:28:57] [PASSED] drm_test_check_bpc_8_value
[23:28:57] [PASSED] drm_test_check_bpc_10_value
[23:28:57] [PASSED] drm_test_check_bpc_12_value
[23:28:57] [PASSED] drm_test_check_format_value
[23:28:57] [PASSED] drm_test_check_tmds_char_value
[23:28:57] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[23:28:57] ================= drm_managed (2 subtests) =================
[23:28:57] [PASSED] drm_test_managed_release_action
[23:28:57] [PASSED] drm_test_managed_run_action
[23:28:57] =================== [PASSED] drm_managed ===================
[23:28:57] =================== drm_mm (6 subtests) ====================
[23:28:57] [PASSED] drm_test_mm_init
[23:28:57] [PASSED] drm_test_mm_debug
[23:28:57] [PASSED] drm_test_mm_align32
[23:28:57] [PASSED] drm_test_mm_align64
[23:28:57] [PASSED] drm_test_mm_lowest
[23:28:57] [PASSED] drm_test_mm_highest
[23:28:57] ===================== [PASSED] drm_mm ======================
[23:28:57] ============= drm_modes_analog_tv (5 subtests) =============
[23:28:57] [PASSED] drm_test_modes_analog_tv_mono_576i
[23:28:57] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[23:28:57] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[23:28:57] [PASSED] drm_test_modes_analog_tv_pal_576i
[23:28:57] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[23:28:57] =============== [PASSED] drm_modes_analog_tv ===============
[23:28:57] ============== drm_plane_helper (2 subtests) ===============
[23:28:57] =============== drm_test_check_plane_state  ================
[23:28:57] [PASSED] clipping_simple
[23:28:57] [PASSED] clipping_rotate_reflect
[23:28:57] [PASSED] positioning_simple
[23:28:57] [PASSED] upscaling
[23:28:57] [PASSED] downscaling
[23:28:57] [PASSED] rounding1
[23:28:57] [PASSED] rounding2
[23:28:57] [PASSED] rounding3
[23:28:57] [PASSED] rounding4
[23:28:57] =========== [PASSED] drm_test_check_plane_state ============
[23:28:57] =========== drm_test_check_invalid_plane_state  ============
[23:28:57] [PASSED] positioning_invalid
[23:28:57] [PASSED] upscaling_invalid
stty: 'standard input': Inappropriate ioctl for device
[23:28:57] [PASSED] downscaling_invalid
[23:28:57] ======= [PASSED] drm_test_check_invalid_plane_state ========
[23:28:57] ================ [PASSED] drm_plane_helper =================
[23:28:57] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[23:28:57] ====== drm_test_connector_helper_tv_get_modes_check  =======
[23:28:57] [PASSED] None
[23:28:57] [PASSED] PAL
[23:28:57] [PASSED] NTSC
[23:28:57] [PASSED] Both, NTSC Default
[23:28:57] [PASSED] Both, PAL Default
[23:28:57] [PASSED] Both, NTSC Default, with PAL on command-line
[23:28:57] [PASSED] Both, PAL Default, with NTSC on command-line
[23:28:57] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[23:28:57] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[23:28:57] ================== drm_rect (9 subtests) ===================
[23:28:57] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[23:28:57] [PASSED] drm_test_rect_clip_scaled_not_clipped
[23:28:57] [PASSED] drm_test_rect_clip_scaled_clipped
[23:28:57] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[23:28:57] ================= drm_test_rect_intersect  =================
[23:28:57] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[23:28:57] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[23:28:57] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[23:28:57] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[23:28:57] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[23:28:57] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[23:28:57] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[23:28:57] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[23:28:57] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[23:28:57] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[23:28:57] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[23:28:57] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[23:28:57] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[23:28:57] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[23:28:57] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[23:28:57] ============= [PASSED] drm_test_rect_intersect =============
[23:28:57] ================ drm_test_rect_calc_hscale  ================
[23:28:57] [PASSED] normal use
[23:28:57] [PASSED] out of max range
[23:28:57] [PASSED] out of min range
[23:28:57] [PASSED] zero dst
[23:28:57] [PASSED] negative src
[23:28:57] [PASSED] negative dst
[23:28:57] ============ [PASSED] drm_test_rect_calc_hscale ============
[23:28:57] ================ drm_test_rect_calc_vscale  ================
[23:28:57] [PASSED] normal use
[23:28:57] [PASSED] out of max range
[23:28:57] [PASSED] out of min range
[23:28:57] [PASSED] zero dst
[23:28:57] [PASSED] negative src
[23:28:57] [PASSED] negative dst
[23:28:57] ============ [PASSED] drm_test_rect_calc_vscale ============
[23:28:57] ================== drm_test_rect_rotate  ===================
[23:28:57] [PASSED] reflect-x
[23:28:57] [PASSED] reflect-y
[23:28:57] [PASSED] rotate-0
[23:28:57] [PASSED] rotate-90
[23:28:57] [PASSED] rotate-180
[23:28:57] [PASSED] rotate-270
[23:28:57] ============== [PASSED] drm_test_rect_rotate ===============
[23:28:57] ================ drm_test_rect_rotate_inv  =================
[23:28:57] [PASSED] reflect-x
[23:28:57] [PASSED] reflect-y
[23:28:57] [PASSED] rotate-0
[23:28:57] [PASSED] rotate-90
[23:28:57] [PASSED] rotate-180
[23:28:57] [PASSED] rotate-270
[23:28:57] ============ [PASSED] drm_test_rect_rotate_inv =============
[23:28:57] ==================== [PASSED] drm_rect =====================
[23:28:57] ============================================================
[23:28:57] Testing complete. Ran 515 tests: passed: 515
[23:28:57] Elapsed time: 24.056s total, 1.708s configuring, 22.152s building, 0.192s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[23:28:57] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:28:58] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[23:29:07] Starting KUnit Kernel (1/1)...
[23:29:07] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:29:07] ================= ttm_device (5 subtests) ==================
[23:29:07] [PASSED] ttm_device_init_basic
[23:29:07] [PASSED] ttm_device_init_multiple
[23:29:07] [PASSED] ttm_device_fini_basic
[23:29:07] [PASSED] ttm_device_init_no_vma_man
[23:29:07] ================== ttm_device_init_pools  ==================
[23:29:07] [PASSED] No DMA allocations, no DMA32 required
[23:29:07] [PASSED] DMA allocations, DMA32 required
[23:29:07] [PASSED] No DMA allocations, DMA32 required
[23:29:07] [PASSED] DMA allocations, no DMA32 required
[23:29:07] ============== [PASSED] ttm_device_init_pools ==============
[23:29:07] =================== [PASSED] ttm_device ====================
[23:29:07] ================== ttm_pool (8 subtests) ===================
[23:29:07] ================== ttm_pool_alloc_basic  ===================
[23:29:07] [PASSED] One page
[23:29:07] [PASSED] More than one page
[23:29:07] [PASSED] Above the allocation limit
[23:29:07] [PASSED] One page, with coherent DMA mappings enabled
[23:29:07] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[23:29:07] ============== [PASSED] ttm_pool_alloc_basic ===============
[23:29:07] ============== ttm_pool_alloc_basic_dma_addr  ==============
[23:29:07] [PASSED] One page
[23:29:07] [PASSED] More than one page
[23:29:07] [PASSED] Above the allocation limit
[23:29:07] [PASSED] One page, with coherent DMA mappings enabled
[23:29:07] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[23:29:07] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[23:29:07] [PASSED] ttm_pool_alloc_order_caching_match
[23:29:07] [PASSED] ttm_pool_alloc_caching_mismatch
[23:29:07] [PASSED] ttm_pool_alloc_order_mismatch
[23:29:07] [PASSED] ttm_pool_free_dma_alloc
[23:29:07] [PASSED] ttm_pool_free_no_dma_alloc
[23:29:07] [PASSED] ttm_pool_fini_basic
[23:29:07] ==================== [PASSED] ttm_pool =====================
[23:29:07] ================ ttm_resource (8 subtests) =================
[23:29:07] ================= ttm_resource_init_basic  =================
[23:29:07] [PASSED] Init resource in TTM_PL_SYSTEM
[23:29:07] [PASSED] Init resource in TTM_PL_VRAM
[23:29:07] [PASSED] Init resource in a private placement
[23:29:07] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[23:29:07] ============= [PASSED] ttm_resource_init_basic =============
[23:29:07] [PASSED] ttm_resource_init_pinned
[23:29:07] [PASSED] ttm_resource_fini_basic
[23:29:07] [PASSED] ttm_resource_manager_init_basic
[23:29:07] [PASSED] ttm_resource_manager_usage_basic
[23:29:07] [PASSED] ttm_resource_manager_set_used_basic
[23:29:07] [PASSED] ttm_sys_man_alloc_basic
[23:29:07] [PASSED] ttm_sys_man_free_basic
[23:29:07] ================== [PASSED] ttm_resource ===================
[23:29:07] =================== ttm_tt (15 subtests) ===================
[23:29:07] ==================== ttm_tt_init_basic  ====================
[23:29:07] [PASSED] Page-aligned size
[23:29:07] [PASSED] Extra pages requested
[23:29:07] ================ [PASSED] ttm_tt_init_basic ================
[23:29:07] [PASSED] ttm_tt_init_misaligned
[23:29:07] [PASSED] ttm_tt_fini_basic
[23:29:07] [PASSED] ttm_tt_fini_sg
[23:29:07] [PASSED] ttm_tt_fini_shmem
[23:29:07] [PASSED] ttm_tt_create_basic
[23:29:07] [PASSED] ttm_tt_create_invalid_bo_type
[23:29:07] [PASSED] ttm_tt_create_ttm_exists
[23:29:07] [PASSED] ttm_tt_create_failed
[23:29:07] [PASSED] ttm_tt_destroy_basic
[23:29:07] [PASSED] ttm_tt_populate_null_ttm
[23:29:07] [PASSED] ttm_tt_populate_populated_ttm
[23:29:07] [PASSED] ttm_tt_unpopulate_basic
[23:29:07] [PASSED] ttm_tt_unpopulate_empty_ttm
[23:29:07] [PASSED] ttm_tt_swapin_basic
[23:29:07] ===================== [PASSED] ttm_tt ======================
[23:29:07] =================== ttm_bo (14 subtests) ===================
[23:29:07] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[23:29:07] [PASSED] Cannot be interrupted and sleeps
[23:29:07] [PASSED] Cannot be interrupted, locks straight away
[23:29:07] [PASSED] Can be interrupted, sleeps
[23:29:07] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[23:29:07] [PASSED] ttm_bo_reserve_locked_no_sleep
[23:29:07] [PASSED] ttm_bo_reserve_no_wait_ticket
[23:29:07] [PASSED] ttm_bo_reserve_double_resv
[23:29:07] [PASSED] ttm_bo_reserve_interrupted
[23:29:07] [PASSED] ttm_bo_reserve_deadlock
[23:29:07] [PASSED] ttm_bo_unreserve_basic
[23:29:07] [PASSED] ttm_bo_unreserve_pinned
[23:29:07] [PASSED] ttm_bo_unreserve_bulk
[23:29:07] [PASSED] ttm_bo_put_basic
[23:29:07] [PASSED] ttm_bo_put_shared_resv
[23:29:07] [PASSED] ttm_bo_pin_basic
[23:29:07] [PASSED] ttm_bo_pin_unpin_resource
[23:29:07] [PASSED] ttm_bo_multiple_pin_one_unpin
[23:29:07] ===================== [PASSED] ttm_bo ======================
[23:29:07] ============== ttm_bo_validate (22 subtests) ===============
[23:29:07] ============== ttm_bo_init_reserved_sys_man  ===============
[23:29:07] [PASSED] Buffer object for userspace
[23:29:07] [PASSED] Kernel buffer object
[23:29:07] [PASSED] Shared buffer object
[23:29:07] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[23:29:07] ============== ttm_bo_init_reserved_mock_man  ==============
[23:29:07] [PASSED] Buffer object for userspace
[23:29:07] [PASSED] Kernel buffer object
[23:29:07] [PASSED] Shared buffer object
[23:29:07] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[23:29:07] [PASSED] ttm_bo_init_reserved_resv
[23:29:07] ================== ttm_bo_validate_basic  ==================
[23:29:07] [PASSED] Buffer object for userspace
[23:29:07] [PASSED] Kernel buffer object
[23:29:07] [PASSED] Shared buffer object
[23:29:07] ============== [PASSED] ttm_bo_validate_basic ==============
[23:29:07] [PASSED] ttm_bo_validate_invalid_placement
[23:29:07] ============= ttm_bo_validate_same_placement  ==============
[23:29:07] [PASSED] System manager
[23:29:07] [PASSED] VRAM manager
[23:29:07] ========= [PASSED] ttm_bo_validate_same_placement ==========
[23:29:07] [PASSED] ttm_bo_validate_failed_alloc
[23:29:07] [PASSED] ttm_bo_validate_pinned
[23:29:07] [PASSED] ttm_bo_validate_busy_placement
[23:29:07] ================ ttm_bo_validate_multihop  =================
[23:29:07] [PASSED] Buffer object for userspace
[23:29:07] [PASSED] Kernel buffer object
[23:29:07] [PASSED] Shared buffer object
[23:29:07] ============ [PASSED] ttm_bo_validate_multihop =============
[23:29:07] ========== ttm_bo_validate_no_placement_signaled  ==========
[23:29:07] [PASSED] Buffer object in system domain, no page vector
[23:29:07] [PASSED] Buffer object in system domain with an existing page vector
[23:29:07] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[23:29:07] ======== ttm_bo_validate_no_placement_not_signaled  ========
[23:29:07] [PASSED] Buffer object for userspace
[23:29:07] [PASSED] Kernel buffer object
[23:29:07] [PASSED] Shared buffer object
[23:29:07] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[23:29:07] [PASSED] ttm_bo_validate_move_fence_signaled
[23:29:07] ========= ttm_bo_validate_move_fence_not_signaled  =========
[23:29:07] [PASSED] Waits for GPU
[23:29:07] [PASSED] Tries to lock straight away
[23:29:08] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[23:29:08] [PASSED] ttm_bo_validate_swapout
[23:29:08] [PASSED] ttm_bo_validate_happy_evict
[23:29:08] [PASSED] ttm_bo_validate_all_pinned_evict
[23:29:08] [PASSED] ttm_bo_validate_allowed_only_evict
[23:29:08] [PASSED] ttm_bo_validate_deleted_evict
[23:29:08] [PASSED] ttm_bo_validate_busy_domain_evict
[23:29:08] [PASSED] ttm_bo_validate_evict_gutting
[23:29:08] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[23:29:08] ================= [PASSED] ttm_bo_validate =================
[23:29:08] ============================================================
[23:29:08] Testing complete. Ran 102 tests: passed: 102
[23:29:08] Elapsed time: 11.149s total, 1.708s configuring, 8.771s building, 0.566s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


