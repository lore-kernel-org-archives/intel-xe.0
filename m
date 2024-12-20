Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C37E7718A
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 03:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C591810EE41;
	Fri, 20 Dec 2024 03:01:03 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD16610E0CA;
 Fri, 20 Dec 2024 03:01:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Fixes_for_MI=5FREPORT=5FPERF?=
 =?utf-8?q?=5FCOUNT_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Dec 2024 03:01:02 -0000
Message-ID: <173466366276.635747.18212740575333419233@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241220002234.554135-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20241220002234.554135-1-umesh.nerlige.ramappa@intel.com>
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

Series: Fixes for MI_REPORT_PERF_COUNT (rev4)
URL   : https://patchwork.freedesktop.org/series/141811/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[02:59:51] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:59:56] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
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

[03:00:24] Starting KUnit Kernel (1/1)...
[03:00:24] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[03:00:25] =================== guc_dbm (7 subtests) ===================
[03:00:25] [PASSED] test_empty
[03:00:25] [PASSED] test_default
[03:00:25] ======================== test_size  ========================
[03:00:25] [PASSED] 4
[03:00:25] [PASSED] 8
[03:00:25] [PASSED] 32
[03:00:25] [PASSED] 256
[03:00:25] ==================== [PASSED] test_size ====================
[03:00:25] ======================= test_reuse  ========================
[03:00:25] [PASSED] 4
[03:00:25] [PASSED] 8
[03:00:25] [PASSED] 32
[03:00:25] [PASSED] 256
[03:00:25] =================== [PASSED] test_reuse ====================
[03:00:25] =================== test_range_overlap  ====================
[03:00:25] [PASSED] 4
[03:00:25] [PASSED] 8
[03:00:25] [PASSED] 32
[03:00:25] [PASSED] 256
[03:00:25] =============== [PASSED] test_range_overlap ================
[03:00:25] =================== test_range_compact  ====================
[03:00:25] [PASSED] 4
[03:00:25] [PASSED] 8
[03:00:25] [PASSED] 32
[03:00:25] [PASSED] 256
[03:00:25] =============== [PASSED] test_range_compact ================
[03:00:25] ==================== test_range_spare  =====================
[03:00:25] [PASSED] 4
[03:00:25] [PASSED] 8
[03:00:25] [PASSED] 32
[03:00:25] [PASSED] 256
[03:00:25] ================ [PASSED] test_range_spare =================
[03:00:25] ===================== [PASSED] guc_dbm =====================
[03:00:25] =================== guc_idm (6 subtests) ===================
[03:00:25] [PASSED] bad_init
[03:00:25] [PASSED] no_init
[03:00:25] [PASSED] init_fini
[03:00:25] [PASSED] check_used
[03:00:25] [PASSED] check_quota
[03:00:25] [PASSED] check_all
[03:00:25] ===================== [PASSED] guc_idm =====================
[03:00:25] ================== no_relay (3 subtests) ===================
[03:00:25] [PASSED] xe_drops_guc2pf_if_not_ready
[03:00:25] [PASSED] xe_drops_guc2vf_if_not_ready
[03:00:25] [PASSED] xe_rejects_send_if_not_ready
[03:00:25] ==================== [PASSED] no_relay =====================
[03:00:25] ================== pf_relay (14 subtests) ==================
[03:00:25] [PASSED] pf_rejects_guc2pf_too_short
[03:00:25] [PASSED] pf_rejects_guc2pf_too_long
[03:00:25] [PASSED] pf_rejects_guc2pf_no_payload
[03:00:25] [PASSED] pf_fails_no_payload
[03:00:25] [PASSED] pf_fails_bad_origin
[03:00:25] [PASSED] pf_fails_bad_type
[03:00:25] [PASSED] pf_txn_reports_error
[03:00:25] [PASSED] pf_txn_sends_pf2guc
[03:00:25] [PASSED] pf_sends_pf2guc
[03:00:25] [SKIPPED] pf_loopback_nop
[03:00:25] [SKIPPED] pf_loopback_echo
[03:00:25] [SKIPPED] pf_loopback_fail
[03:00:25] [SKIPPED] pf_loopback_busy
[03:00:25] [SKIPPED] pf_loopback_retry
[03:00:25] ==================== [PASSED] pf_relay =====================
[03:00:25] ================== vf_relay (3 subtests) ===================
[03:00:25] [PASSED] vf_rejects_guc2vf_too_short
[03:00:25] [PASSED] vf_rejects_guc2vf_too_long
[03:00:25] [PASSED] vf_rejects_guc2vf_no_payload
[03:00:25] ==================== [PASSED] vf_relay =====================
[03:00:25] ================= pf_service (11 subtests) =================
[03:00:25] [PASSED] pf_negotiate_any
[03:00:25] [PASSED] pf_negotiate_base_match
[03:00:25] [PASSED] pf_negotiate_base_newer
[03:00:25] [PASSED] pf_negotiate_base_next
[03:00:25] [SKIPPED] pf_negotiate_base_older
[03:00:25] [PASSED] pf_negotiate_base_prev
[03:00:25] [PASSED] pf_negotiate_latest_match
[03:00:25] [PASSED] pf_negotiate_latest_newer
[03:00:25] [PASSED] pf_negotiate_latest_next
[03:00:25] [SKIPPED] pf_negotiate_latest_older
[03:00:25] [SKIPPED] pf_negotiate_latest_prev
[03:00:25] =================== [PASSED] pf_service ====================
[03:00:25] ===================== lmtt (1 subtest) =====================
[03:00:25] ======================== test_ops  =========================
[03:00:25] [PASSED] 2-level
[03:00:25] [PASSED] multi-level
[03:00:25] ==================== [PASSED] test_ops =====================
[03:00:25] ====================== [PASSED] lmtt =======================
[03:00:25] =================== xe_mocs (2 subtests) ===================
[03:00:25] ================ xe_live_mocs_kernel_kunit  ================
[03:00:25] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[03:00:25] ================ xe_live_mocs_reset_kunit  =================
[03:00:25] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[03:00:25] ==================== [SKIPPED] xe_mocs =====================
[03:00:25] ================= xe_migrate (2 subtests) ==================
[03:00:25] ================= xe_migrate_sanity_kunit  =================
[03:00:25] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[03:00:25] ================== xe_validate_ccs_kunit  ==================
[03:00:25] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[03:00:25] =================== [SKIPPED] xe_migrate ===================
[03:00:25] ================== xe_dma_buf (1 subtest) ==================
[03:00:25] ==================== xe_dma_buf_kunit  =====================
[03:00:25] ================ [SKIPPED] xe_dma_buf_kunit ================
[03:00:25] =================== [SKIPPED] xe_dma_buf ===================
[03:00:25] ================= xe_bo_shrink (1 subtest) =================
[03:00:25] =================== xe_bo_shrink_kunit  ====================
[03:00:25] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[03:00:25] ================== [SKIPPED] xe_bo_shrink ==================
[03:00:25] ==================== xe_bo (2 subtests) ====================
[03:00:25] ================== xe_ccs_migrate_kunit  ===================
[03:00:25] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[03:00:25] ==================== xe_bo_evict_kunit  ====================
[03:00:25] =============== [SKIPPED] xe_bo_evict_kunit ================
[03:00:25] ===================== [SKIPPED] xe_bo ======================
[03:00:25] ==================== args (11 subtests) ====================
[03:00:25] [PASSED] count_args_test
[03:00:25] [PASSED] call_args_example
[03:00:25] [PASSED] call_args_test
[03:00:25] [PASSED] drop_first_arg_example
[03:00:25] [PASSED] drop_first_arg_test
[03:00:25] [PASSED] first_arg_example
[03:00:25] [PASSED] first_arg_test
stty: 'standard input': Inappropriate ioctl for device
[03:00:25] [PASSED] last_arg_example
[03:00:25] [PASSED] last_arg_test
[03:00:25] [PASSED] pick_arg_example
[03:00:25] [PASSED] sep_comma_example
[03:00:25] ====================== [PASSED] args =======================
[03:00:25] =================== xe_pci (2 subtests) ====================
[03:00:25] [PASSED] xe_gmdid_graphics_ip
[03:00:25] [PASSED] xe_gmdid_media_ip
[03:00:25] ===================== [PASSED] xe_pci ======================
[03:00:25] =================== xe_rtp (2 subtests) ====================
[03:00:25] =============== xe_rtp_process_to_sr_tests  ================
[03:00:25] [PASSED] coalesce-same-reg
[03:00:25] [PASSED] no-match-no-add
[03:00:25] [PASSED] match-or
[03:00:25] [PASSED] match-or-xfail
[03:00:25] [PASSED] no-match-no-add-multiple-rules
[03:00:25] [PASSED] two-regs-two-entries
[03:00:25] [PASSED] clr-one-set-other
[03:00:25] [PASSED] set-field
[03:00:25] [PASSED] conflict-duplicate
[03:00:25] [PASSED] conflict-not-disjoint
[03:00:25] [PASSED] conflict-reg-type
[03:00:25] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[03:00:25] ================== xe_rtp_process_tests  ===================
[03:00:25] [PASSED] active1
[03:00:25] [PASSED] active2
[03:00:25] [PASSED] active-inactive
[03:00:25] [PASSED] inactive-active
[03:00:25] [PASSED] inactive-1st_or_active-inactive
[03:00:25] [PASSED] inactive-2nd_or_active-inactive
[03:00:25] [PASSED] inactive-last_or_active-inactive
[03:00:25] [PASSED] inactive-no_or_active-inactive
[03:00:25] ============== [PASSED] xe_rtp_process_tests ===============
[03:00:25] ===================== [PASSED] xe_rtp ======================
[03:00:25] ==================== xe_wa (1 subtest) =====================
[03:00:25] ======================== xe_wa_gt  =========================
[03:00:25] [PASSED] TIGERLAKE (B0)
[03:00:25] [PASSED] DG1 (A0)
[03:00:25] [PASSED] DG1 (B0)
[03:00:25] [PASSED] ALDERLAKE_S (A0)
[03:00:25] [PASSED] ALDERLAKE_S (B0)
[03:00:25] [PASSED] ALDERLAKE_S (C0)
[03:00:25] [PASSED] ALDERLAKE_S (D0)
[03:00:25] [PASSED] ALDERLAKE_P (A0)
[03:00:25] [PASSED] ALDERLAKE_P (B0)
[03:00:25] [PASSED] ALDERLAKE_P (C0)
[03:00:25] [PASSED] ALDERLAKE_S_RPLS (D0)
[03:00:25] [PASSED] ALDERLAKE_P_RPLU (E0)
[03:00:25] [PASSED] DG2_G10 (C0)
[03:00:25] [PASSED] DG2_G11 (B1)
[03:00:25] [PASSED] DG2_G12 (A1)
[03:00:25] [PASSED] METEORLAKE (g:A0, m:A0)
[03:00:25] [PASSED] METEORLAKE (g:A0, m:A0)
[03:00:25] [PASSED] METEORLAKE (g:A0, m:A0)
[03:00:25] [PASSED] LUNARLAKE (g:A0, m:A0)
[03:00:25] [PASSED] LUNARLAKE (g:B0, m:A0)
[03:00:25] [PASSED] BATTLEMAGE (g:A0, m:A1)
[03:00:25] ==================== [PASSED] xe_wa_gt =====================
[03:00:25] ====================== [PASSED] xe_wa ======================
[03:00:25] ============================================================
[03:00:25] Testing complete. Ran 122 tests: passed: 106, skipped: 16
[03:00:25] Elapsed time: 33.328s total, 4.414s configuring, 28.648s building, 0.244s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[03:00:25] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[03:00:26] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
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

[03:00:49] Starting KUnit Kernel (1/1)...
[03:00:49] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[03:00:49] ================== drm_buddy (7 subtests) ==================
[03:00:49] [PASSED] drm_test_buddy_alloc_limit
[03:00:49] [PASSED] drm_test_buddy_alloc_optimistic
[03:00:49] [PASSED] drm_test_buddy_alloc_pessimistic
[03:00:49] [PASSED] drm_test_buddy_alloc_pathological
[03:00:49] [PASSED] drm_test_buddy_alloc_contiguous
[03:00:49] [PASSED] drm_test_buddy_alloc_clear
[03:00:49] [PASSED] drm_test_buddy_alloc_range_bias
[03:00:49] ==================== [PASSED] drm_buddy ====================
[03:00:49] ============= drm_cmdline_parser (40 subtests) =============
[03:00:49] [PASSED] drm_test_cmdline_force_d_only
[03:00:49] [PASSED] drm_test_cmdline_force_D_only_dvi
[03:00:49] [PASSED] drm_test_cmdline_force_D_only_hdmi
[03:00:49] [PASSED] drm_test_cmdline_force_D_only_not_digital
[03:00:49] [PASSED] drm_test_cmdline_force_e_only
[03:00:49] [PASSED] drm_test_cmdline_res
[03:00:49] [PASSED] drm_test_cmdline_res_vesa
[03:00:49] [PASSED] drm_test_cmdline_res_vesa_rblank
[03:00:49] [PASSED] drm_test_cmdline_res_rblank
[03:00:49] [PASSED] drm_test_cmdline_res_bpp
[03:00:49] [PASSED] drm_test_cmdline_res_refresh
[03:00:49] [PASSED] drm_test_cmdline_res_bpp_refresh
[03:00:49] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[03:00:49] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[03:00:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[03:00:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[03:00:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[03:00:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[03:00:49] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[03:00:49] [PASSED] drm_test_cmdline_res_margins_force_on
[03:00:49] [PASSED] drm_test_cmdline_res_vesa_margins
[03:00:49] [PASSED] drm_test_cmdline_name
[03:00:49] [PASSED] drm_test_cmdline_name_bpp
[03:00:49] [PASSED] drm_test_cmdline_name_option
[03:00:49] [PASSED] drm_test_cmdline_name_bpp_option
[03:00:49] [PASSED] drm_test_cmdline_rotate_0
[03:00:49] [PASSED] drm_test_cmdline_rotate_90
[03:00:49] [PASSED] drm_test_cmdline_rotate_180
[03:00:49] [PASSED] drm_test_cmdline_rotate_270
[03:00:49] [PASSED] drm_test_cmdline_hmirror
[03:00:49] [PASSED] drm_test_cmdline_vmirror
[03:00:49] [PASSED] drm_test_cmdline_margin_options
[03:00:49] [PASSED] drm_test_cmdline_multiple_options
[03:00:49] [PASSED] drm_test_cmdline_bpp_extra_and_option
[03:00:49] [PASSED] drm_test_cmdline_extra_and_option
[03:00:49] [PASSED] drm_test_cmdline_freestanding_options
[03:00:49] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[03:00:49] [PASSED] drm_test_cmdline_panel_orientation
[03:00:49] ================ drm_test_cmdline_invalid  =================
[03:00:49] [PASSED] margin_only
[03:00:49] [PASSED] interlace_only
[03:00:49] [PASSED] res_missing_x
[03:00:49] [PASSED] res_missing_y
[03:00:49] [PASSED] res_bad_y
[03:00:49] [PASSED] res_missing_y_bpp
[03:00:49] [PASSED] res_bad_bpp
[03:00:49] [PASSED] res_bad_refresh
[03:00:49] [PASSED] res_bpp_refresh_force_on_off
[03:00:49] [PASSED] res_invalid_mode
[03:00:49] [PASSED] res_bpp_wrong_place_mode
[03:00:49] [PASSED] name_bpp_refresh
[03:00:49] [PASSED] name_refresh
[03:00:49] [PASSED] name_refresh_wrong_mode
[03:00:49] [PASSED] name_refresh_invalid_mode
[03:00:49] [PASSED] rotate_multiple
[03:00:49] [PASSED] rotate_invalid_val
[03:00:49] [PASSED] rotate_truncated
[03:00:49] [PASSED] invalid_option
[03:00:49] [PASSED] invalid_tv_option
[03:00:49] [PASSED] truncated_tv_option
[03:00:49] ============ [PASSED] drm_test_cmdline_invalid =============
[03:00:49] =============== drm_test_cmdline_tv_options  ===============
[03:00:49] [PASSED] NTSC
[03:00:49] [PASSED] NTSC_443
[03:00:49] [PASSED] NTSC_J
[03:00:49] [PASSED] PAL
[03:00:49] [PASSED] PAL_M
[03:00:49] [PASSED] PAL_N
[03:00:49] [PASSED] SECAM
[03:00:49] [PASSED] MONO_525
[03:00:49] [PASSED] MONO_625
[03:00:49] =========== [PASSED] drm_test_cmdline_tv_options ===========
[03:00:49] =============== [PASSED] drm_cmdline_parser ================
[03:00:49] ========== drmm_connector_hdmi_init (19 subtests) ==========
[03:00:49] [PASSED] drm_test_connector_hdmi_init_valid
[03:00:49] [PASSED] drm_test_connector_hdmi_init_bpc_8
[03:00:49] [PASSED] drm_test_connector_hdmi_init_bpc_10
[03:00:49] [PASSED] drm_test_connector_hdmi_init_bpc_12
[03:00:49] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[03:00:49] [PASSED] drm_test_connector_hdmi_init_bpc_null
[03:00:49] [PASSED] drm_test_connector_hdmi_init_formats_empty
[03:00:49] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[03:00:49] [PASSED] drm_test_connector_hdmi_init_null_ddc
[03:00:49] [PASSED] drm_test_connector_hdmi_init_null_product
[03:00:49] [PASSED] drm_test_connector_hdmi_init_null_vendor
[03:00:49] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[03:00:49] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[03:00:49] [PASSED] drm_test_connector_hdmi_init_product_valid
[03:00:49] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[03:00:49] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[03:00:49] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[03:00:49] ========= drm_test_connector_hdmi_init_type_valid  =========
[03:00:49] [PASSED] HDMI-A
[03:00:49] [PASSED] HDMI-B
[03:00:49] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[03:00:49] ======== drm_test_connector_hdmi_init_type_invalid  ========
[03:00:49] [PASSED] Unknown
[03:00:49] [PASSED] VGA
[03:00:49] [PASSED] DVI-I
[03:00:49] [PASSED] DVI-D
[03:00:49] [PASSED] DVI-A
[03:00:49] [PASSED] Composite
[03:00:49] [PASSED] SVIDEO
[03:00:49] [PASSED] LVDS
[03:00:49] [PASSED] Component
[03:00:49] [PASSED] DIN
[03:00:49] [PASSED] DP
[03:00:49] [PASSED] TV
[03:00:49] [PASSED] eDP
[03:00:49] [PASSED] Virtual
[03:00:49] [PASSED] DSI
[03:00:49] [PASSED] DPI
[03:00:49] [PASSED] Writeback
[03:00:49] [PASSED] SPI
[03:00:49] [PASSED] USB
[03:00:49] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[03:00:49] ============ [PASSED] drmm_connector_hdmi_init =============
[03:00:49] ============= drmm_connector_init (3 subtests) =============
[03:00:49] [PASSED] drm_test_drmm_connector_init
[03:00:49] [PASSED] drm_test_drmm_connector_init_null_ddc
[03:00:49] ========= drm_test_drmm_connector_init_type_valid  =========
[03:00:49] [PASSED] Unknown
[03:00:49] [PASSED] VGA
[03:00:49] [PASSED] DVI-I
[03:00:49] [PASSED] DVI-D
[03:00:49] [PASSED] DVI-A
[03:00:49] [PASSED] Composite
[03:00:49] [PASSED] SVIDEO
[03:00:49] [PASSED] LVDS
[03:00:49] [PASSED] Component
[03:00:49] [PASSED] DIN
[03:00:49] [PASSED] DP
[03:00:49] [PASSED] HDMI-A
[03:00:49] [PASSED] HDMI-B
[03:00:49] [PASSED] TV
[03:00:49] [PASSED] eDP
[03:00:49] [PASSED] Virtual
[03:00:49] [PASSED] DSI
[03:00:49] [PASSED] DPI
[03:00:49] [PASSED] Writeback
[03:00:49] [PASSED] SPI
[03:00:49] [PASSED] USB
[03:00:49] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[03:00:49] =============== [PASSED] drmm_connector_init ===============
[03:00:49] ========= drm_connector_dynamic_init (6 subtests) ==========
[03:00:49] [PASSED] drm_test_drm_connector_dynamic_init
[03:00:49] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[03:00:49] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[03:00:49] [PASSED] drm_test_drm_connector_dynamic_init_properties
[03:00:49] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[03:00:49] [PASSED] Unknown
[03:00:49] [PASSED] VGA
[03:00:49] [PASSED] DVI-I
[03:00:49] [PASSED] DVI-D
[03:00:49] [PASSED] DVI-A
[03:00:49] [PASSED] Composite
[03:00:49] [PASSED] SVIDEO
[03:00:49] [PASSED] LVDS
[03:00:49] [PASSED] Component
[03:00:49] [PASSED] DIN
[03:00:49] [PASSED] DP
[03:00:49] [PASSED] HDMI-A
[03:00:49] [PASSED] HDMI-B
[03:00:49] [PASSED] TV
[03:00:49] [PASSED] eDP
[03:00:49] [PASSED] Virtual
[03:00:49] [PASSED] DSI
[03:00:49] [PASSED] DPI
[03:00:49] [PASSED] Writeback
[03:00:49] [PASSED] SPI
[03:00:49] [PASSED] USB
[03:00:49] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[03:00:49] ======== drm_test_drm_connector_dynamic_init_name  =========
[03:00:49] [PASSED] Unknown
[03:00:49] [PASSED] VGA
[03:00:49] [PASSED] DVI-I
[03:00:49] [PASSED] DVI-D
[03:00:49] [PASSED] DVI-A
[03:00:49] [PASSED] Composite
[03:00:49] [PASSED] SVIDEO
[03:00:49] [PASSED] LVDS
[03:00:49] [PASSED] Component
[03:00:49] [PASSED] DIN
[03:00:49] [PASSED] DP
[03:00:49] [PASSED] HDMI-A
[03:00:49] [PASSED] HDMI-B
[03:00:49] [PASSED] TV
[03:00:49] [PASSED] eDP
[03:00:49] [PASSED] Virtual
[03:00:49] [PASSED] DSI
[03:00:49] [PASSED] DPI
[03:00:49] [PASSED] Writeback
[03:00:49] [PASSED] SPI
[03:00:49] [PASSED] USB
[03:00:49] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[03:00:49] =========== [PASSED] drm_connector_dynamic_init ============
[03:00:49] ==== drm_connector_dynamic_register_early (4 subtests) =====
[03:00:49] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[03:00:49] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[03:00:49] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[03:00:49] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[03:00:49] ====== [PASSED] drm_connector_dynamic_register_early =======
[03:00:49] ======= drm_connector_dynamic_register (7 subtests) ========
[03:00:49] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[03:00:49] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[03:00:49] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[03:00:49] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[03:00:49] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[03:00:49] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[03:00:49] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[03:00:49] ========= [PASSED] drm_connector_dynamic_register ==========
[03:00:49] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[03:00:49] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[03:00:49] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[03:00:49] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[03:00:49] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[03:00:49] ========== drm_test_get_tv_mode_from_name_valid  ===========
[03:00:49] [PASSED] NTSC
[03:00:49] [PASSED] NTSC-443
[03:00:49] [PASSED] NTSC-J
[03:00:49] [PASSED] PAL
[03:00:49] [PASSED] PAL-M
[03:00:49] [PASSED] PAL-N
[03:00:49] [PASSED] SECAM
[03:00:49] [PASSED] Mono
[03:00:49] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[03:00:49] [PASSED] drm_test_get_tv_mode_from_name_truncated
[03:00:49] ============ [PASSED] drm_get_tv_mode_from_name ============
[03:00:49] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[03:00:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[03:00:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[03:00:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[03:00:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[03:00:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[03:00:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[03:00:49] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[03:00:49] [PASSED] VIC 96
[03:00:49] [PASSED] VIC 97
[03:00:49] [PASSED] VIC 101
[03:00:49] [PASSED] VIC 102
[03:00:49] [PASSED] VIC 106
[03:00:49] [PASSED] VIC 107
[03:00:49] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[03:00:49] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[03:00:49] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[03:00:49] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[03:00:49] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[03:00:49] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[03:00:49] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[03:00:49] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[03:00:49] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[03:00:49] [PASSED] Automatic
[03:00:49] [PASSED] Full
[03:00:49] [PASSED] Limited 16:235
[03:00:49] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[03:00:49] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[03:00:49] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[03:00:49] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[03:00:49] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[03:00:49] [PASSED] RGB
[03:00:49] [PASSED] YUV 4:2:0
[03:00:49] [PASSED] YUV 4:2:2
[03:00:49] [PASSED] YUV 4:4:4
[03:00:49] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[03:00:49] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[03:00:49] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[03:00:49] ============= drm_damage_helper (21 subtests) ==============
[03:00:49] [PASSED] drm_test_damage_iter_no_damage
[03:00:49] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[03:00:49] [PASSED] drm_test_damage_iter_no_damage_src_moved
[03:00:49] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[03:00:49] [PASSED] drm_test_damage_iter_no_damage_not_visible
[03:00:49] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[03:00:49] [PASSED] drm_test_damage_iter_no_damage_no_fb
[03:00:49] [PASSED] drm_test_damage_iter_simple_damage
[03:00:49] [PASSED] drm_test_damage_iter_single_damage
[03:00:49] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[03:00:49] [PASSED] drm_test_damage_iter_single_damage_outside_src
[03:00:49] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[03:00:49] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[03:00:49] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[03:00:49] [PASSED] drm_test_damage_iter_single_damage_src_moved
[03:00:49] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[03:00:49] [PASSED] drm_test_damage_iter_damage
[03:00:49] [PASSED] drm_test_damage_iter_damage_one_intersect
[03:00:49] [PASSED] drm_test_damage_iter_damage_one_outside
[03:00:49] [PASSED] drm_test_damage_iter_damage_src_moved
[03:00:49] [PASSED] drm_test_damage_iter_damage_not_visible
[03:00:49] ================ [PASSED] drm_damage_helper ================
[03:00:49] ============== drm_dp_mst_helper (3 subtests) ==============
[03:00:49] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[03:00:49] [PASSED] Clock 154000 BPP 30 DSC disabled
[03:00:49] [PASSED] Clock 234000 BPP 30 DSC disabled
[03:00:49] [PASSED] Clock 297000 BPP 24 DSC disabled
[03:00:49] [PASSED] Clock 332880 BPP 24 DSC enabled
[03:00:49] [PASSED] Clock 324540 BPP 24 DSC enabled
[03:00:49] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[03:00:49] ============== drm_test_dp_mst_calc_pbn_div  ===============
[03:00:49] [PASSED] Link rate 2000000 lane count 4
[03:00:49] [PASSED] Link rate 2000000 lane count 2
[03:00:49] [PASSED] Link rate 2000000 lane count 1
[03:00:49] [PASSED] Link rate 1350000 lane count 4
[03:00:49] [PASSED] Link rate 1350000 lane count 2
[03:00:49] [PASSED] Link rate 1350000 lane count 1
[03:00:49] [PASSED] Link rate 1000000 lane count 4
[03:00:49] [PASSED] Link rate 1000000 lane count 2
[03:00:49] [PASSED] Link rate 1000000 lane count 1
[03:00:49] [PASSED] Link rate 810000 lane count 4
[03:00:49] [PASSED] Link rate 810000 lane count 2
[03:00:49] [PASSED] Link rate 810000 lane count 1
[03:00:49] [PASSED] Link rate 540000 lane count 4
[03:00:49] [PASSED] Link rate 540000 lane count 2
[03:00:49] [PASSED] Link rate 540000 lane count 1
[03:00:49] [PASSED] Link rate 270000 lane count 4
[03:00:49] [PASSED] Link rate 270000 lane count 2
[03:00:49] [PASSED] Link rate 270000 lane count 1
[03:00:49] [PASSED] Link rate 162000 lane count 4
[03:00:49] [PASSED] Link rate 162000 lane count 2
[03:00:49] [PASSED] Link rate 162000 lane count 1
[03:00:49] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[03:00:49] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[03:00:49] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[03:00:49] [PASSED] DP_POWER_UP_PHY with port number
[03:00:49] [PASSED] DP_POWER_DOWN_PHY with port number
[03:00:49] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[03:00:49] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[03:00:49] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[03:00:49] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[03:00:49] [PASSED] DP_QUERY_PAYLOAD with port number
[03:00:49] [PASSED] DP_QUERY_PAYLOAD with VCPI
[03:00:49] [PASSED] DP_REMOTE_DPCD_READ with port number
[03:00:49] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[03:00:49] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[03:00:49] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[03:00:49] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[03:00:49] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[03:00:49] [PASSED] DP_REMOTE_I2C_READ with port number
[03:00:49] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[03:00:49] [PASSED] DP_REMOTE_I2C_READ with transactions array
[03:00:49] [PASSED] DP_REMOTE_I2C_WRITE with port number
[03:00:49] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[03:00:49] [PASSED] DP_REMOTE_I2C_WRITE with data array
[03:00:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[03:00:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[03:00:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[03:00:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[03:00:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[03:00:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[03:00:49] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[03:00:49] ================ [PASSED] drm_dp_mst_helper ================
[03:00:49] ================== drm_exec (7 subtests) ===================
[03:00:49] [PASSED] sanitycheck
[03:00:49] [PASSED] test_lock
[03:00:49] [PASSED] test_lock_unlock
[03:00:49] [PASSED] test_duplicates
[03:00:49] [PASSED] test_prepare
[03:00:49] [PASSED] test_prepare_array
[03:00:49] [PASSED] test_multiple_loops
[03:00:49] ==================== [PASSED] drm_exec =====================
[03:00:49] =========== drm_format_helper_test (17 subtests) ===========
[03:00:49] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[03:00:49] [PASSED] single_pixel_source_buffer
[03:00:49] [PASSED] single_pixel_clip_rectangle
[03:00:49] [PASSED] well_known_colors
[03:00:49] [PASSED] destination_pitch
[03:00:49] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[03:00:49] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[03:00:49] [PASSED] single_pixel_source_buffer
[03:00:49] [PASSED] single_pixel_clip_rectangle
[03:00:49] [PASSED] well_known_colors
[03:00:49] [PASSED] destination_pitch
[03:00:49] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[03:00:49] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[03:00:49] [PASSED] single_pixel_source_buffer
[03:00:49] [PASSED] single_pixel_clip_rectangle
[03:00:49] [PASSED] well_known_colors
[03:00:49] [PASSED] destination_pitch
[03:00:49] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[03:00:49] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[03:00:49] [PASSED] single_pixel_source_buffer
[03:00:49] [PASSED] single_pixel_clip_rectangle
[03:00:49] [PASSED] well_known_colors
[03:00:49] [PASSED] destination_pitch
[03:00:49] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[03:00:49] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[03:00:49] [PASSED] single_pixel_source_buffer
[03:00:49] [PASSED] single_pixel_clip_rectangle
[03:00:49] [PASSED] well_known_colors
[03:00:49] [PASSED] destination_pitch
[03:00:49] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[03:00:49] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[03:00:49] [PASSED] single_pixel_source_buffer
[03:00:49] [PASSED] single_pixel_clip_rectangle
[03:00:49] [PASSED] well_known_colors
[03:00:49] [PASSED] destination_pitch
[03:00:49] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[03:00:49] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[03:00:49] [PASSED] single_pixel_source_buffer
[03:00:49] [PASSED] single_pixel_clip_rectangle
[03:00:49] [PASSED] well_known_colors
[03:00:49] [PASSED] destination_pitch
[03:00:49] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[03:00:49] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[03:00:49] [PASSED] single_pixel_source_buffer
[03:00:49] [PASSED] single_pixel_clip_rectangle
[03:00:49] [PASSED] well_known_colors
[03:00:49] [PASSED] destination_pitch
[03:00:49] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[03:00:49] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[03:00:49] [PASSED] single_pixel_source_buffer
[03:00:49] [PASSED] single_pixel_clip_rectangle
[03:00:49] [PASSED] well_known_colors
[03:00:49] [PASSED] destination_pitch
[03:00:49] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[03:00:49] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[03:00:49] [PASSED] single_pixel_source_buffer
[03:00:49] [PASSED] single_pixel_clip_rectangle
[03:00:49] [PASSED] well_known_colors
[03:00:49] [PASSED] destination_pitch
[03:00:49] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[03:00:49] ============== drm_test_fb_xrgb8888_to_mono  ===============
[03:00:49] [PASSED] single_pixel_source_buffer
[03:00:49] [PASSED] single_pixel_clip_rectangle
[03:00:49] [PASSED] well_known_colors
[03:00:49] [PASSED] destination_pitch
[03:00:49] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[03:00:49] ==================== drm_test_fb_swab  =====================
[03:00:49] [PASSED] single_pixel_source_buffer
[03:00:49] [PASSED] single_pixel_clip_rectangle
[03:00:49] [PASSED] well_known_colors
[03:00:49] [PASSED] destination_pitch
[03:00:49] ================ [PASSED] drm_test_fb_swab =================
[03:00:49] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[03:00:49] [PASSED] single_pixel_source_buffer
[03:00:49] [PASSED] single_pixel_clip_rectangle
[03:00:49] [PASSED] well_known_colors
[03:00:49] [PASSED] destination_pitch
[03:00:49] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[03:00:49] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[03:00:49] [PASSED] single_pixel_source_buffer
[03:00:49] [PASSED] single_pixel_clip_rectangle
[03:00:49] [PASSED] well_known_colors
[03:00:49] [PASSED] destination_pitch
[03:00:49] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[03:00:49] ================= drm_test_fb_clip_offset  =================
[03:00:49] [PASSED] pass through
[03:00:49] [PASSED] horizontal offset
[03:00:49] [PASSED] vertical offset
[03:00:49] [PASSED] horizontal and vertical offset
[03:00:49] [PASSED] horizontal offset (custom pitch)
[03:00:49] [PASSED] vertical offset (custom pitch)
[03:00:49] [PASSED] horizontal and vertical offset (custom pitch)
[03:00:49] ============= [PASSED] drm_test_fb_clip_offset =============
[03:00:49] ============== drm_test_fb_build_fourcc_list  ==============
[03:00:49] [PASSED] no native formats
[03:00:49] [PASSED] XRGB8888 as native format
[03:00:49] [PASSED] remove duplicates
[03:00:49] [PASSED] convert alpha formats
[03:00:49] [PASSED] random formats
[03:00:49] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[03:00:49] =================== drm_test_fb_memcpy  ====================
[03:00:49] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[03:00:49] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[03:00:49] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[03:00:49] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[03:00:49] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[03:00:49] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[03:00:49] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[03:00:49] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[03:00:49] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[03:00:49] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[03:00:49] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[03:00:49] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[03:00:49] =============== [PASSED] drm_test_fb_memcpy ================
[03:00:49] ============= [PASSED] drm_format_helper_test ==============
[03:00:49] ================= drm_format (18 subtests) =================
[03:00:49] [PASSED] drm_test_format_block_width_invalid
[03:00:49] [PASSED] drm_test_format_block_width_one_plane
[03:00:49] [PASSED] drm_test_format_block_width_two_plane
[03:00:49] [PASSED] drm_test_format_block_width_three_plane
[03:00:49] [PASSED] drm_test_format_block_width_tiled
[03:00:49] [PASSED] drm_test_format_block_height_invalid
[03:00:49] [PASSED] drm_test_format_block_height_one_plane
[03:00:49] [PASSED] drm_test_format_block_height_two_plane
[03:00:49] [PASSED] drm_test_format_block_height_three_plane
[03:00:49] [PASSED] drm_test_format_block_height_tiled
[03:00:49] [PASSED] drm_test_format_min_pitch_invalid
[03:00:49] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[03:00:49] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[03:00:49] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[03:00:49] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[03:00:49] [PASSED] drm_test_format_min_pitch_two_plane
[03:00:49] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[03:00:49] [PASSED] drm_test_format_min_pitch_tiled
[03:00:49] =================== [PASSED] drm_format ====================
[03:00:49] ============== drm_framebuffer (10 subtests) ===============
[03:00:49] ========== drm_test_framebuffer_check_src_coords  ==========
[03:00:49] [PASSED] Success: source fits into fb
[03:00:49] [PASSED] Fail: overflowing fb with x-axis coordinate
[03:00:49] [PASSED] Fail: overflowing fb with y-axis coordinate
[03:00:49] [PASSED] Fail: overflowing fb with source width
[03:00:49] [PASSED] Fail: overflowing fb with source height
[03:00:49] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[03:00:49] [PASSED] drm_test_framebuffer_cleanup
[03:00:49] =============== drm_test_framebuffer_create  ===============
[03:00:49] [PASSED] ABGR8888 normal sizes
[03:00:49] [PASSED] ABGR8888 max sizes
[03:00:49] [PASSED] ABGR8888 pitch greater than min required
[03:00:49] [PASSED] ABGR8888 pitch less than min required
[03:00:49] [PASSED] ABGR8888 Invalid width
[03:00:49] [PASSED] ABGR8888 Invalid buffer handle
[03:00:49] [PASSED] No pixel format
[03:00:49] [PASSED] ABGR8888 Width 0
[03:00:49] [PASSED] ABGR8888 Height 0
[03:00:49] [PASSED] ABGR8888 Out of bound height * pitch combination
[03:00:49] [PASSED] ABGR8888 Large buffer offset
[03:00:49] [PASSED] ABGR8888 Buffer offset for inexistent plane
[03:00:49] [PASSED] ABGR8888 Invalid flag
[03:00:49] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[03:00:49] [PASSED] ABGR8888 Valid buffer modifier
[03:00:49] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[03:00:49] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[03:00:49] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[03:00:49] [PASSED] NV12 Normal sizes
[03:00:49] [PASSED] NV12 Max sizes
[03:00:49] [PASSED] NV12 Invalid pitch
[03:00:49] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[03:00:49] [PASSED] NV12 different  modifier per-plane
[03:00:49] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[03:00:49] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[03:00:49] [PASSED] NV12 Modifier for inexistent plane
[03:00:49] [PASSED] NV12 Handle for inexistent plane
[03:00:49] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[03:00:49] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[03:00:49] [PASSED] YVU420 Normal sizes
[03:00:49] [PASSED] YVU420 Max sizes
[03:00:49] [PASSED] YVU420 Invalid pitch
[03:00:49] [PASSED] YVU420 Different pitches
[03:00:49] [PASSED] YVU420 Different buffer offsets/pitches
[03:00:49] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[03:00:49] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[03:00:49] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[03:00:49] [PASSED] YVU420 Valid modifier
[03:00:49] [PASSED] YVU420 Different modifiers per plane
[03:00:49] [PASSED] YVU420 Modifier for inexistent plane
[03:00:49] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[03:00:49] [PASSED] X0L2 Normal sizes
[03:00:49] [PASSED] X0L2 Max sizes
[03:00:49] [PASSED] X0L2 Invalid pitch
[03:00:49] [PASSED] X0L2 Pitch greater than minimum required
[03:00:49] [PASSED] X0L2 Handle for inexistent plane
[03:00:49] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[03:00:49] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[03:00:49] [PASSED] X0L2 Valid modifier
[03:00:49] [PASSED] X0L2 Modifier for inexistent plane
[03:00:49] =========== [PASSED] drm_test_framebuffer_create ===========
[03:00:49] [PASSED] drm_test_framebuffer_free
[03:00:49] [PASSED] drm_test_framebuffer_init
[03:00:49] [PASSED] drm_test_framebuffer_init_bad_format
[03:00:49] [PASSED] drm_test_framebuffer_init_dev_mismatch
[03:00:49] [PASSED] drm_test_framebuffer_lookup
[03:00:49] [PASSED] drm_test_framebuffer_lookup_inexistent
[03:00:49] [PASSED] drm_test_framebuffer_modifiers_not_supported
[03:00:49] ================= [PASSED] drm_framebuffer =================
[03:00:49] ================ drm_gem_shmem (8 subtests) ================
[03:00:49] [PASSED] drm_gem_shmem_test_obj_create
[03:00:49] [PASSED] drm_gem_shmem_test_obj_create_private
[03:00:49] [PASSED] drm_gem_shmem_test_pin_pages
[03:00:49] [PASSED] drm_gem_shmem_test_vmap
[03:00:49] [PASSED] drm_gem_shmem_test_get_pages_sgt
[03:00:49] [PASSED] drm_gem_shmem_test_get_sg_table
[03:00:49] [PASSED] drm_gem_shmem_test_madvise
[03:00:49] [PASSED] drm_gem_shmem_test_purge
[03:00:49] ================== [PASSED] drm_gem_shmem ==================
[03:00:49] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[03:00:49] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[03:00:49] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
stty: 'standard input': Inappropriate ioctl for device
[03:00:49] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[03:00:49] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[03:00:49] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[03:00:49] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[03:00:49] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[03:00:49] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[03:00:49] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[03:00:49] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[03:00:49] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[03:00:49] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[03:00:49] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[03:00:49] [PASSED] drm_test_check_output_bpc_dvi
[03:00:49] [PASSED] drm_test_check_output_bpc_format_vic_1
[03:00:49] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[03:00:49] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[03:00:49] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[03:00:49] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[03:00:49] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[03:00:49] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[03:00:49] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[03:00:49] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[03:00:49] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[03:00:49] [PASSED] drm_test_check_broadcast_rgb_value
[03:00:49] [PASSED] drm_test_check_bpc_8_value
[03:00:49] [PASSED] drm_test_check_bpc_10_value
[03:00:49] [PASSED] drm_test_check_bpc_12_value
[03:00:49] [PASSED] drm_test_check_format_value
[03:00:49] [PASSED] drm_test_check_tmds_char_value
[03:00:49] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[03:00:49] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[03:00:49] [PASSED] drm_test_check_mode_valid
[03:00:49] [PASSED] drm_test_check_mode_valid_reject
[03:00:49] [PASSED] drm_test_check_mode_valid_reject_rate
[03:00:49] [PASSED] drm_test_check_mode_valid_reject_max_clock
[03:00:49] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[03:00:49] ================= drm_managed (2 subtests) =================
[03:00:49] [PASSED] drm_test_managed_release_action
[03:00:49] [PASSED] drm_test_managed_run_action
[03:00:49] =================== [PASSED] drm_managed ===================
[03:00:49] =================== drm_mm (6 subtests) ====================
[03:00:49] [PASSED] drm_test_mm_init
[03:00:49] [PASSED] drm_test_mm_debug
[03:00:49] [PASSED] drm_test_mm_align32
[03:00:49] [PASSED] drm_test_mm_align64
[03:00:49] [PASSED] drm_test_mm_lowest
[03:00:49] [PASSED] drm_test_mm_highest
[03:00:49] ===================== [PASSED] drm_mm ======================
[03:00:49] ============= drm_modes_analog_tv (5 subtests) =============
[03:00:49] [PASSED] drm_test_modes_analog_tv_mono_576i
[03:00:49] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[03:00:49] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[03:00:49] [PASSED] drm_test_modes_analog_tv_pal_576i
[03:00:49] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[03:00:49] =============== [PASSED] drm_modes_analog_tv ===============
[03:00:49] ============== drm_plane_helper (2 subtests) ===============
[03:00:49] =============== drm_test_check_plane_state  ================
[03:00:49] [PASSED] clipping_simple
[03:00:49] [PASSED] clipping_rotate_reflect
[03:00:49] [PASSED] positioning_simple
[03:00:49] [PASSED] upscaling
[03:00:49] [PASSED] downscaling
[03:00:49] [PASSED] rounding1
[03:00:49] [PASSED] rounding2
[03:00:49] [PASSED] rounding3
[03:00:49] [PASSED] rounding4
[03:00:49] =========== [PASSED] drm_test_check_plane_state ============
[03:00:49] =========== drm_test_check_invalid_plane_state  ============
[03:00:49] [PASSED] positioning_invalid
[03:00:49] [PASSED] upscaling_invalid
[03:00:49] [PASSED] downscaling_invalid
[03:00:49] ======= [PASSED] drm_test_check_invalid_plane_state ========
[03:00:49] ================ [PASSED] drm_plane_helper =================
[03:00:49] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[03:00:49] ====== drm_test_connector_helper_tv_get_modes_check  =======
[03:00:49] [PASSED] None
[03:00:49] [PASSED] PAL
[03:00:49] [PASSED] NTSC
[03:00:49] [PASSED] Both, NTSC Default
[03:00:49] [PASSED] Both, PAL Default
[03:00:49] [PASSED] Both, NTSC Default, with PAL on command-line
[03:00:49] [PASSED] Both, PAL Default, with NTSC on command-line
[03:00:49] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[03:00:49] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[03:00:49] ================== drm_rect (9 subtests) ===================
[03:00:49] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[03:00:49] [PASSED] drm_test_rect_clip_scaled_not_clipped
[03:00:49] [PASSED] drm_test_rect_clip_scaled_clipped
[03:00:49] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[03:00:49] ================= drm_test_rect_intersect  =================
[03:00:49] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[03:00:49] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[03:00:49] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[03:00:49] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[03:00:49] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[03:00:49] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[03:00:49] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[03:00:49] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[03:00:49] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[03:00:49] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[03:00:49] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[03:00:49] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[03:00:49] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[03:00:49] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[03:00:49] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[03:00:49] ============= [PASSED] drm_test_rect_intersect =============
[03:00:49] ================ drm_test_rect_calc_hscale  ================
[03:00:49] [PASSED] normal use
[03:00:49] [PASSED] out of max range
[03:00:49] [PASSED] out of min range
[03:00:49] [PASSED] zero dst
[03:00:49] [PASSED] negative src
[03:00:49] [PASSED] negative dst
[03:00:49] ============ [PASSED] drm_test_rect_calc_hscale ============
[03:00:49] ================ drm_test_rect_calc_vscale  ================
[03:00:49] [PASSED] normal use
[03:00:49] [PASSED] out of max range
[03:00:49] [PASSED] out of min range
[03:00:49] [PASSED] zero dst
[03:00:49] [PASSED] negative src
[03:00:49] [PASSED] negative dst
[03:00:49] ============ [PASSED] drm_test_rect_calc_vscale ============
[03:00:49] ================== drm_test_rect_rotate  ===================
[03:00:49] [PASSED] reflect-x
[03:00:49] [PASSED] reflect-y
[03:00:49] [PASSED] rotate-0
[03:00:49] [PASSED] rotate-90
[03:00:49] [PASSED] rotate-180
[03:00:49] [PASSED] rotate-270
[03:00:49] ============== [PASSED] drm_test_rect_rotate ===============
[03:00:49] ================ drm_test_rect_rotate_inv  =================
[03:00:49] [PASSED] reflect-x
[03:00:49] [PASSED] reflect-y
[03:00:49] [PASSED] rotate-0
[03:00:49] [PASSED] rotate-90
[03:00:49] [PASSED] rotate-180
[03:00:49] [PASSED] rotate-270
[03:00:49] ============ [PASSED] drm_test_rect_rotate_inv =============
[03:00:49] ==================== [PASSED] drm_rect =====================
[03:00:49] ============================================================
[03:00:49] Testing complete. Ran 587 tests: passed: 587
[03:00:49] Elapsed time: 24.675s total, 1.669s configuring, 22.789s building, 0.182s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[03:00:50] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[03:00:51] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
[03:00:59] Starting KUnit Kernel (1/1)...
[03:00:59] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[03:00:59] ================= ttm_device (5 subtests) ==================
[03:00:59] [PASSED] ttm_device_init_basic
[03:00:59] [PASSED] ttm_device_init_multiple
[03:00:59] [PASSED] ttm_device_fini_basic
[03:00:59] [PASSED] ttm_device_init_no_vma_man
[03:00:59] ================== ttm_device_init_pools  ==================
[03:00:59] [PASSED] No DMA allocations, no DMA32 required
[03:00:59] [PASSED] DMA allocations, DMA32 required
[03:00:59] [PASSED] No DMA allocations, DMA32 required
[03:00:59] [PASSED] DMA allocations, no DMA32 required
[03:00:59] ============== [PASSED] ttm_device_init_pools ==============
[03:00:59] =================== [PASSED] ttm_device ====================
[03:00:59] ================== ttm_pool (8 subtests) ===================
[03:00:59] ================== ttm_pool_alloc_basic  ===================
[03:00:59] [PASSED] One page
[03:00:59] [PASSED] More than one page
[03:00:59] [PASSED] Above the allocation limit
[03:00:59] [PASSED] One page, with coherent DMA mappings enabled
[03:00:59] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[03:00:59] ============== [PASSED] ttm_pool_alloc_basic ===============
[03:00:59] ============== ttm_pool_alloc_basic_dma_addr  ==============
[03:00:59] [PASSED] One page
[03:00:59] [PASSED] More than one page
[03:00:59] [PASSED] Above the allocation limit
[03:00:59] [PASSED] One page, with coherent DMA mappings enabled
[03:00:59] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[03:00:59] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[03:00:59] [PASSED] ttm_pool_alloc_order_caching_match
[03:00:59] [PASSED] ttm_pool_alloc_caching_mismatch
[03:00:59] [PASSED] ttm_pool_alloc_order_mismatch
[03:00:59] [PASSED] ttm_pool_free_dma_alloc
[03:00:59] [PASSED] ttm_pool_free_no_dma_alloc
[03:00:59] [PASSED] ttm_pool_fini_basic
[03:00:59] ==================== [PASSED] ttm_pool =====================
[03:00:59] ================ ttm_resource (8 subtests) =================
[03:00:59] ================= ttm_resource_init_basic  =================
[03:00:59] [PASSED] Init resource in TTM_PL_SYSTEM
[03:00:59] [PASSED] Init resource in TTM_PL_VRAM
[03:00:59] [PASSED] Init resource in a private placement
[03:00:59] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[03:00:59] ============= [PASSED] ttm_resource_init_basic =============
[03:00:59] [PASSED] ttm_resource_init_pinned
[03:00:59] [PASSED] ttm_resource_fini_basic
[03:00:59] [PASSED] ttm_resource_manager_init_basic
[03:00:59] [PASSED] ttm_resource_manager_usage_basic
[03:00:59] [PASSED] ttm_resource_manager_set_used_basic
[03:00:59] [PASSED] ttm_sys_man_alloc_basic
[03:00:59] [PASSED] ttm_sys_man_free_basic
[03:00:59] ================== [PASSED] ttm_resource ===================
[03:00:59] =================== ttm_tt (15 subtests) ===================
[03:00:59] ==================== ttm_tt_init_basic  ====================
[03:00:59] [PASSED] Page-aligned size
[03:00:59] [PASSED] Extra pages requested
[03:00:59] ================ [PASSED] ttm_tt_init_basic ================
[03:00:59] [PASSED] ttm_tt_init_misaligned
[03:00:59] [PASSED] ttm_tt_fini_basic
[03:00:59] [PASSED] ttm_tt_fini_sg
[03:00:59] [PASSED] ttm_tt_fini_shmem
[03:00:59] [PASSED] ttm_tt_create_basic
[03:00:59] [PASSED] ttm_tt_create_invalid_bo_type
[03:00:59] [PASSED] ttm_tt_create_ttm_exists
[03:00:59] [PASSED] ttm_tt_create_failed
[03:00:59] [PASSED] ttm_tt_destroy_basic
[03:00:59] [PASSED] ttm_tt_populate_null_ttm
[03:00:59] [PASSED] ttm_tt_populate_populated_ttm
[03:00:59] [PASSED] ttm_tt_unpopulate_basic
[03:00:59] [PASSED] ttm_tt_unpopulate_empty_ttm
[03:00:59] [PASSED] ttm_tt_swapin_basic
[03:00:59] ===================== [PASSED] ttm_tt ======================
[03:00:59] =================== ttm_bo (14 subtests) ===================
[03:00:59] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[03:00:59] [PASSED] Cannot be interrupted and sleeps
[03:00:59] [PASSED] Cannot be interrupted, locks straight away
[03:00:59] [PASSED] Can be interrupted, sleeps
[03:00:59] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[03:00:59] [PASSED] ttm_bo_reserve_locked_no_sleep
[03:00:59] [PASSED] ttm_bo_reserve_no_wait_ticket
[03:00:59] [PASSED] ttm_bo_reserve_double_resv
[03:00:59] [PASSED] ttm_bo_reserve_interrupted
[03:00:59] [PASSED] ttm_bo_reserve_deadlock
[03:00:59] [PASSED] ttm_bo_unreserve_basic
[03:00:59] [PASSED] ttm_bo_unreserve_pinned
[03:00:59] [PASSED] ttm_bo_unreserve_bulk
[03:00:59] [PASSED] ttm_bo_put_basic
[03:00:59] [PASSED] ttm_bo_put_shared_resv
[03:00:59] [PASSED] ttm_bo_pin_basic
[03:00:59] [PASSED] ttm_bo_pin_unpin_resource
[03:00:59] [PASSED] ttm_bo_multiple_pin_one_unpin
[03:00:59] ===================== [PASSED] ttm_bo ======================
[03:00:59] ============== ttm_bo_validate (22 subtests) ===============
[03:00:59] ============== ttm_bo_init_reserved_sys_man  ===============
[03:00:59] [PASSED] Buffer object for userspace
[03:00:59] [PASSED] Kernel buffer object
[03:00:59] [PASSED] Shared buffer object
[03:00:59] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[03:00:59] ============== ttm_bo_init_reserved_mock_man  ==============
[03:00:59] [PASSED] Buffer object for userspace
[03:00:59] [PASSED] Kernel buffer object
[03:00:59] [PASSED] Shared buffer object
[03:00:59] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[03:00:59] [PASSED] ttm_bo_init_reserved_resv
[03:00:59] ================== ttm_bo_validate_basic  ==================
[03:00:59] [PASSED] Buffer object for userspace
[03:00:59] [PASSED] Kernel buffer object
[03:00:59] [PASSED] Shared buffer object
[03:00:59] ============== [PASSED] ttm_bo_validate_basic ==============
[03:00:59] [PASSED] ttm_bo_validate_invalid_placement
[03:00:59] ============= ttm_bo_validate_same_placement  ==============
[03:00:59] [PASSED] System manager
[03:00:59] [PASSED] VRAM manager
[03:00:59] ========= [PASSED] ttm_bo_validate_same_placement ==========
[03:00:59] [PASSED] ttm_bo_validate_failed_alloc
[03:00:59] [PASSED] ttm_bo_validate_pinned
[03:00:59] [PASSED] ttm_bo_validate_busy_placement
[03:00:59] ================ ttm_bo_validate_multihop  =================
[03:00:59] [PASSED] Buffer object for userspace
[03:00:59] [PASSED] Kernel buffer object
[03:00:59] [PASSED] Shared buffer object
[03:00:59] ============ [PASSED] ttm_bo_validate_multihop =============
[03:00:59] ========== ttm_bo_validate_no_placement_signaled  ==========
[03:00:59] [PASSED] Buffer object in system domain, no page vector
[03:00:59] [PASSED] Buffer object in system domain with an existing page vector
[03:00:59] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[03:00:59] ======== ttm_bo_validate_no_placement_not_signaled  ========
[03:00:59] [PASSED] Buffer object for userspace
[03:00:59] [PASSED] Kernel buffer object
[03:00:59] [PASSED] Shared buffer object
[03:00:59] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[03:00:59] [PASSED] ttm_bo_validate_move_fence_signaled
[03:00:59] ========= ttm_bo_validate_move_fence_not_signaled  =========
[03:00:59] [PASSED] Waits for GPU
[03:00:59] [PASSED] Tries to lock straight away
[03:01:00] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[03:01:00] [PASSED] ttm_bo_validate_swapout
[03:01:00] [PASSED] ttm_bo_validate_happy_evict
[03:01:00] [PASSED] ttm_bo_validate_all_pinned_evict
[03:01:00] [PASSED] ttm_bo_validate_allowed_only_evict
[03:01:00] [PASSED] ttm_bo_validate_deleted_evict
[03:01:00] [PASSED] ttm_bo_validate_busy_domain_evict
[03:01:00] [PASSED] ttm_bo_validate_evict_gutting
[03:01:00] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[03:01:00] ================= [PASSED] ttm_bo_validate =================
[03:01:00] ============================================================
[03:01:00] Testing complete. Ran 102 tests: passed: 102
[03:01:00] Elapsed time: 10.166s total, 1.662s configuring, 7.836s building, 0.569s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


