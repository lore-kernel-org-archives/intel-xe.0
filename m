Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAB9D17141
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 21:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB8E10E5A9;
	Mon, 21 Oct 2024 21:40:53 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7E110E056;
 Mon, 21 Oct 2024 21:40:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Fix_non-contiguous_VRAM_BO_acc?=
 =?utf-8?q?ess_in_Xe_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 21:40:51 -0000
Message-ID: <172954685147.1306617.16651978149157961590@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021211835.1675640-1-matthew.brost@intel.com>
In-Reply-To: <20241021211835.1675640-1-matthew.brost@intel.com>
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

Series: Fix non-contiguous VRAM BO access in Xe (rev5)
URL   : https://patchwork.freedesktop.org/series/140200/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[21:39:42] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:39:46] Building KUnit Kernel ...
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

[21:40:14] Starting KUnit Kernel (1/1)...
[21:40:14] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[21:40:14] =================== guc_dbm (7 subtests) ===================
[21:40:14] [PASSED] test_empty
[21:40:14] [PASSED] test_default
[21:40:14] ======================== test_size  ========================
[21:40:14] [PASSED] 4
[21:40:14] [PASSED] 8
[21:40:14] [PASSED] 32
[21:40:14] [PASSED] 256
[21:40:14] ==================== [PASSED] test_size ====================
[21:40:14] ======================= test_reuse  ========================
[21:40:14] [PASSED] 4
[21:40:14] [PASSED] 8
[21:40:14] [PASSED] 32
[21:40:14] [PASSED] 256
[21:40:14] =================== [PASSED] test_reuse ====================
[21:40:14] =================== test_range_overlap  ====================
[21:40:14] [PASSED] 4
[21:40:14] [PASSED] 8
[21:40:14] [PASSED] 32
[21:40:14] [PASSED] 256
[21:40:14] =============== [PASSED] test_range_overlap ================
[21:40:14] =================== test_range_compact  ====================
[21:40:14] [PASSED] 4
[21:40:14] [PASSED] 8
[21:40:14] [PASSED] 32
[21:40:14] [PASSED] 256
[21:40:14] =============== [PASSED] test_range_compact ================
[21:40:14] ==================== test_range_spare  =====================
[21:40:14] [PASSED] 4
[21:40:14] [PASSED] 8
[21:40:14] [PASSED] 32
[21:40:14] [PASSED] 256
[21:40:14] ================ [PASSED] test_range_spare =================
[21:40:14] ===================== [PASSED] guc_dbm =====================
[21:40:14] =================== guc_idm (6 subtests) ===================
[21:40:14] [PASSED] bad_init
[21:40:14] [PASSED] no_init
[21:40:14] [PASSED] init_fini
[21:40:14] [PASSED] check_used
[21:40:14] [PASSED] check_quota
[21:40:14] [PASSED] check_all
[21:40:14] ===================== [PASSED] guc_idm =====================
[21:40:14] ================== no_relay (3 subtests) ===================
[21:40:14] [PASSED] xe_drops_guc2pf_if_not_ready
[21:40:14] [PASSED] xe_drops_guc2vf_if_not_ready
[21:40:14] [PASSED] xe_rejects_send_if_not_ready
[21:40:14] ==================== [PASSED] no_relay =====================
[21:40:14] ================== pf_relay (14 subtests) ==================
[21:40:14] [PASSED] pf_rejects_guc2pf_too_short
[21:40:14] [PASSED] pf_rejects_guc2pf_too_long
[21:40:14] [PASSED] pf_rejects_guc2pf_no_payload
[21:40:14] [PASSED] pf_fails_no_payload
[21:40:14] [PASSED] pf_fails_bad_origin
[21:40:14] [PASSED] pf_fails_bad_type
[21:40:14] [PASSED] pf_txn_reports_error
[21:40:14] [PASSED] pf_txn_sends_pf2guc
[21:40:14] [PASSED] pf_sends_pf2guc
[21:40:14] [SKIPPED] pf_loopback_nop
[21:40:14] [SKIPPED] pf_loopback_echo
[21:40:14] [SKIPPED] pf_loopback_fail
[21:40:14] [SKIPPED] pf_loopback_busy
[21:40:14] [SKIPPED] pf_loopback_retry
[21:40:14] ==================== [PASSED] pf_relay =====================
[21:40:14] ================== vf_relay (3 subtests) ===================
[21:40:14] [PASSED] vf_rejects_guc2vf_too_short
[21:40:14] [PASSED] vf_rejects_guc2vf_too_long
[21:40:14] [PASSED] vf_rejects_guc2vf_no_payload
[21:40:14] ==================== [PASSED] vf_relay =====================
[21:40:14] ================= pf_service (11 subtests) =================
[21:40:14] [PASSED] pf_negotiate_any
[21:40:14] [PASSED] pf_negotiate_base_match
[21:40:14] [PASSED] pf_negotiate_base_newer
[21:40:14] [PASSED] pf_negotiate_base_next
[21:40:14] [SKIPPED] pf_negotiate_base_older
[21:40:14] [PASSED] pf_negotiate_base_prev
[21:40:14] [PASSED] pf_negotiate_latest_match
[21:40:14] [PASSED] pf_negotiate_latest_newer
[21:40:14] [PASSED] pf_negotiate_latest_next
[21:40:14] [SKIPPED] pf_negotiate_latest_older
[21:40:14] [SKIPPED] pf_negotiate_latest_prev
[21:40:14] =================== [PASSED] pf_service ====================
[21:40:14] ===================== lmtt (1 subtest) =====================
[21:40:14] ======================== test_ops  =========================
[21:40:14] [PASSED] 2-level
[21:40:14] [PASSED] multi-level
[21:40:14] ==================== [PASSED] test_ops =====================
[21:40:14] ====================== [PASSED] lmtt =======================
[21:40:14] =================== xe_mocs (2 subtests) ===================
[21:40:14] ================ xe_live_mocs_kernel_kunit  ================
[21:40:14] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[21:40:14] ================ xe_live_mocs_reset_kunit  =================
[21:40:14] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[21:40:14] ==================== [SKIPPED] xe_mocs =====================
[21:40:14] ================= xe_migrate (2 subtests) ==================
[21:40:14] ================= xe_migrate_sanity_kunit  =================
[21:40:14] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[21:40:14] ================== xe_validate_ccs_kunit  ==================
[21:40:14] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[21:40:14] =================== [SKIPPED] xe_migrate ===================
[21:40:14] ================== xe_dma_buf (1 subtest) ==================
[21:40:14] ==================== xe_dma_buf_kunit  =====================
[21:40:14] ================ [SKIPPED] xe_dma_buf_kunit ================
[21:40:14] =================== [SKIPPED] xe_dma_buf ===================
[21:40:14] ==================== xe_bo (3 subtests) ====================
[21:40:14] ================== xe_ccs_migrate_kunit  ===================
[21:40:14] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[21:40:14] ==================== xe_bo_evict_kunit  ====================
[21:40:14] =============== [SKIPPED] xe_bo_evict_kunit ================
[21:40:14] =================== xe_bo_shrink_kunit  ====================
[21:40:14] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[21:40:14] ===================== [SKIPPED] xe_bo ======================
[21:40:14] ==================== args (11 subtests) ====================
[21:40:14] [PASSED] count_args_test
[21:40:14] [PASSED] call_args_example
[21:40:14] [PASSED] call_args_test
[21:40:14] [PASSED] drop_first_arg_example
[21:40:14] [PASSED] drop_first_arg_test
[21:40:14] [PASSED] first_arg_example
[21:40:14] [PASSED] first_arg_test
[21:40:14] [PASSED] last_arg_example
[21:40:14] [PASSED] last_arg_test
[21:40:14] [PASSED] pick_arg_example
[21:40:14] [PASSED] sep_comma_examplestty: 'standard input': Inappropriate ioctl for device

[21:40:14] ====================== [PASSED] args =======================
[21:40:14] =================== xe_pci (2 subtests) ====================
[21:40:14] [PASSED] xe_gmdid_graphics_ip
[21:40:14] [PASSED] xe_gmdid_media_ip
[21:40:14] ===================== [PASSED] xe_pci ======================
[21:40:14] =================== xe_rtp (2 subtests) ====================
[21:40:14] =============== xe_rtp_process_to_sr_tests  ================
[21:40:14] [PASSED] coalesce-same-reg
[21:40:14] [PASSED] no-match-no-add
[21:40:14] [PASSED] match-or
[21:40:14] [PASSED] match-or-xfail
[21:40:14] [PASSED] no-match-no-add-multiple-rules
[21:40:14] [PASSED] two-regs-two-entries
[21:40:14] [PASSED] clr-one-set-other
[21:40:14] [PASSED] set-field
[21:40:14] [PASSED] conflict-duplicate
[21:40:14] [PASSED] conflict-not-disjoint
[21:40:14] [PASSED] conflict-reg-type
[21:40:14] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[21:40:14] ================== xe_rtp_process_tests  ===================
[21:40:14] [PASSED] active1
[21:40:14] [PASSED] active2
[21:40:14] [PASSED] active-inactive
[21:40:14] [PASSED] inactive-active
[21:40:14] [PASSED] inactive-1st_or_active-inactive
[21:40:14] [PASSED] inactive-2nd_or_active-inactive
[21:40:14] [PASSED] inactive-last_or_active-inactive
[21:40:14] [PASSED] inactive-no_or_active-inactive
[21:40:14] ============== [PASSED] xe_rtp_process_tests ===============
[21:40:14] ===================== [PASSED] xe_rtp ======================
[21:40:14] ==================== xe_wa (1 subtest) =====================
[21:40:14] ======================== xe_wa_gt  =========================
[21:40:14] [PASSED] TIGERLAKE (B0)
[21:40:14] [PASSED] DG1 (A0)
[21:40:14] [PASSED] DG1 (B0)
[21:40:14] [PASSED] ALDERLAKE_S (A0)
[21:40:14] [PASSED] ALDERLAKE_S (B0)
[21:40:14] [PASSED] ALDERLAKE_S (C0)
[21:40:14] [PASSED] ALDERLAKE_S (D0)
[21:40:14] [PASSED] ALDERLAKE_P (A0)
[21:40:14] [PASSED] ALDERLAKE_P (B0)
[21:40:14] [PASSED] ALDERLAKE_P (C0)
[21:40:14] [PASSED] ALDERLAKE_S_RPLS (D0)
[21:40:14] [PASSED] ALDERLAKE_P_RPLU (E0)
[21:40:14] [PASSED] DG2_G10 (C0)
[21:40:14] [PASSED] DG2_G11 (B1)
[21:40:14] [PASSED] DG2_G12 (A1)
[21:40:14] [PASSED] METEORLAKE (g:A0, m:A0)
[21:40:14] [PASSED] METEORLAKE (g:A0, m:A0)
[21:40:14] [PASSED] METEORLAKE (g:A0, m:A0)
[21:40:14] [PASSED] LUNARLAKE (g:A0, m:A0)
[21:40:14] [PASSED] LUNARLAKE (g:B0, m:A0)
[21:40:14] [PASSED] BATTLEMAGE (g:A0, m:A1)
[21:40:14] ==================== [PASSED] xe_wa_gt =====================
[21:40:14] ====================== [PASSED] xe_wa ======================
[21:40:14] ============================================================
[21:40:14] Testing complete. Ran 122 tests: passed: 106, skipped: 16
[21:40:14] Elapsed time: 32.295s total, 4.416s configuring, 27.614s building, 0.219s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[21:40:14] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:40:16] Building KUnit Kernel ...
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

[21:40:38] Starting KUnit Kernel (1/1)...
[21:40:38] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[21:40:39] ================== drm_buddy (7 subtests) ==================
[21:40:39] [PASSED] drm_test_buddy_alloc_limit
[21:40:39] [PASSED] drm_test_buddy_alloc_optimistic
[21:40:39] [PASSED] drm_test_buddy_alloc_pessimistic
[21:40:39] [PASSED] drm_test_buddy_alloc_pathological
[21:40:39] [PASSED] drm_test_buddy_alloc_contiguous
[21:40:39] [PASSED] drm_test_buddy_alloc_clear
[21:40:39] [PASSED] drm_test_buddy_alloc_range_bias
[21:40:39] ==================== [PASSED] drm_buddy ====================
[21:40:39] ============= drm_cmdline_parser (40 subtests) =============
[21:40:39] [PASSED] drm_test_cmdline_force_d_only
[21:40:39] [PASSED] drm_test_cmdline_force_D_only_dvi
[21:40:39] [PASSED] drm_test_cmdline_force_D_only_hdmi
[21:40:39] [PASSED] drm_test_cmdline_force_D_only_not_digital
[21:40:39] [PASSED] drm_test_cmdline_force_e_only
[21:40:39] [PASSED] drm_test_cmdline_res
[21:40:39] [PASSED] drm_test_cmdline_res_vesa
[21:40:39] [PASSED] drm_test_cmdline_res_vesa_rblank
[21:40:39] [PASSED] drm_test_cmdline_res_rblank
[21:40:39] [PASSED] drm_test_cmdline_res_bpp
[21:40:39] [PASSED] drm_test_cmdline_res_refresh
[21:40:39] [PASSED] drm_test_cmdline_res_bpp_refresh
[21:40:39] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[21:40:39] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[21:40:39] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[21:40:39] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[21:40:39] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[21:40:39] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[21:40:39] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[21:40:39] [PASSED] drm_test_cmdline_res_margins_force_on
[21:40:39] [PASSED] drm_test_cmdline_res_vesa_margins
[21:40:39] [PASSED] drm_test_cmdline_name
[21:40:39] [PASSED] drm_test_cmdline_name_bpp
[21:40:39] [PASSED] drm_test_cmdline_name_option
[21:40:39] [PASSED] drm_test_cmdline_name_bpp_option
[21:40:39] [PASSED] drm_test_cmdline_rotate_0
[21:40:39] [PASSED] drm_test_cmdline_rotate_90
[21:40:39] [PASSED] drm_test_cmdline_rotate_180
[21:40:39] [PASSED] drm_test_cmdline_rotate_270
[21:40:39] [PASSED] drm_test_cmdline_hmirror
[21:40:39] [PASSED] drm_test_cmdline_vmirror
[21:40:39] [PASSED] drm_test_cmdline_margin_options
[21:40:39] [PASSED] drm_test_cmdline_multiple_options
[21:40:39] [PASSED] drm_test_cmdline_bpp_extra_and_option
[21:40:39] [PASSED] drm_test_cmdline_extra_and_option
[21:40:39] [PASSED] drm_test_cmdline_freestanding_options
[21:40:39] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[21:40:39] [PASSED] drm_test_cmdline_panel_orientation
[21:40:39] ================ drm_test_cmdline_invalid  =================
[21:40:39] [PASSED] margin_only
[21:40:39] [PASSED] interlace_only
[21:40:39] [PASSED] res_missing_x
[21:40:39] [PASSED] res_missing_y
[21:40:39] [PASSED] res_bad_y
[21:40:39] [PASSED] res_missing_y_bpp
[21:40:39] [PASSED] res_bad_bpp
[21:40:39] [PASSED] res_bad_refresh
[21:40:39] [PASSED] res_bpp_refresh_force_on_off
[21:40:39] [PASSED] res_invalid_mode
[21:40:39] [PASSED] res_bpp_wrong_place_mode
[21:40:39] [PASSED] name_bpp_refresh
[21:40:39] [PASSED] name_refresh
[21:40:39] [PASSED] name_refresh_wrong_mode
[21:40:39] [PASSED] name_refresh_invalid_mode
[21:40:39] [PASSED] rotate_multiple
[21:40:39] [PASSED] rotate_invalid_val
[21:40:39] [PASSED] rotate_truncated
[21:40:39] [PASSED] invalid_option
[21:40:39] [PASSED] invalid_tv_option
[21:40:39] [PASSED] truncated_tv_option
[21:40:39] ============ [PASSED] drm_test_cmdline_invalid =============
[21:40:39] =============== drm_test_cmdline_tv_options  ===============
[21:40:39] [PASSED] NTSC
[21:40:39] [PASSED] NTSC_443
[21:40:39] [PASSED] NTSC_J
[21:40:39] [PASSED] PAL
[21:40:39] [PASSED] PAL_M
[21:40:39] [PASSED] PAL_N
[21:40:39] [PASSED] SECAM
[21:40:39] [PASSED] MONO_525
[21:40:39] [PASSED] MONO_625
[21:40:39] =========== [PASSED] drm_test_cmdline_tv_options ===========
[21:40:39] =============== [PASSED] drm_cmdline_parser ================
[21:40:39] ========== drmm_connector_hdmi_init (19 subtests) ==========
[21:40:39] [PASSED] drm_test_connector_hdmi_init_valid
[21:40:39] [PASSED] drm_test_connector_hdmi_init_bpc_8
[21:40:39] [PASSED] drm_test_connector_hdmi_init_bpc_10
[21:40:39] [PASSED] drm_test_connector_hdmi_init_bpc_12
[21:40:39] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[21:40:39] [PASSED] drm_test_connector_hdmi_init_bpc_null
[21:40:39] [PASSED] drm_test_connector_hdmi_init_formats_empty
[21:40:39] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[21:40:39] [PASSED] drm_test_connector_hdmi_init_null_ddc
[21:40:39] [PASSED] drm_test_connector_hdmi_init_null_product
[21:40:39] [PASSED] drm_test_connector_hdmi_init_null_vendor
[21:40:39] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[21:40:39] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[21:40:39] [PASSED] drm_test_connector_hdmi_init_product_valid
[21:40:39] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[21:40:39] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[21:40:39] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[21:40:39] ========= drm_test_connector_hdmi_init_type_valid  =========
[21:40:39] [PASSED] HDMI-A
[21:40:39] [PASSED] HDMI-B
[21:40:39] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[21:40:39] ======== drm_test_connector_hdmi_init_type_invalid  ========
[21:40:39] [PASSED] Unknown
[21:40:39] [PASSED] VGA
[21:40:39] [PASSED] DVI-I
[21:40:39] [PASSED] DVI-D
[21:40:39] [PASSED] DVI-A
[21:40:39] [PASSED] Composite
[21:40:39] [PASSED] SVIDEO
[21:40:39] [PASSED] LVDS
[21:40:39] [PASSED] Component
[21:40:39] [PASSED] DIN
[21:40:39] [PASSED] DP
[21:40:39] [PASSED] TV
[21:40:39] [PASSED] eDP
[21:40:39] [PASSED] Virtual
[21:40:39] [PASSED] DSI
[21:40:39] [PASSED] DPI
[21:40:39] [PASSED] Writeback
[21:40:39] [PASSED] SPI
[21:40:39] [PASSED] USB
[21:40:39] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[21:40:39] ============ [PASSED] drmm_connector_hdmi_init =============
[21:40:39] ============= drmm_connector_init (3 subtests) =============
[21:40:39] [PASSED] drm_test_drmm_connector_init
[21:40:39] [PASSED] drm_test_drmm_connector_init_null_ddc
[21:40:39] ========= drm_test_drmm_connector_init_type_valid  =========
[21:40:39] [PASSED] Unknown
[21:40:39] [PASSED] VGA
[21:40:39] [PASSED] DVI-I
[21:40:39] [PASSED] DVI-D
[21:40:39] [PASSED] DVI-A
[21:40:39] [PASSED] Composite
[21:40:39] [PASSED] SVIDEO
[21:40:39] [PASSED] LVDS
[21:40:39] [PASSED] Component
[21:40:39] [PASSED] DIN
[21:40:39] [PASSED] DP
[21:40:39] [PASSED] HDMI-A
[21:40:39] [PASSED] HDMI-B
[21:40:39] [PASSED] TV
[21:40:39] [PASSED] eDP
[21:40:39] [PASSED] Virtual
[21:40:39] [PASSED] DSI
[21:40:39] [PASSED] DPI
[21:40:39] [PASSED] Writeback
[21:40:39] [PASSED] SPI
[21:40:39] [PASSED] USB
[21:40:39] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[21:40:39] =============== [PASSED] drmm_connector_init ===============
[21:40:39] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[21:40:39] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[21:40:39] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[21:40:39] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[21:40:39] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[21:40:39] ========== drm_test_get_tv_mode_from_name_valid  ===========
[21:40:39] [PASSED] NTSC
[21:40:39] [PASSED] NTSC-443
[21:40:39] [PASSED] NTSC-J
[21:40:39] [PASSED] PAL
[21:40:39] [PASSED] PAL-M
[21:40:39] [PASSED] PAL-N
[21:40:39] [PASSED] SECAM
[21:40:39] [PASSED] Mono
[21:40:39] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[21:40:39] [PASSED] drm_test_get_tv_mode_from_name_truncated
[21:40:39] ============ [PASSED] drm_get_tv_mode_from_name ============
[21:40:39] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[21:40:39] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[21:40:39] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[21:40:39] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[21:40:39] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[21:40:39] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[21:40:39] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[21:40:39] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[21:40:39] [PASSED] VIC 96
[21:40:39] [PASSED] VIC 97
[21:40:39] [PASSED] VIC 101
[21:40:39] [PASSED] VIC 102
[21:40:39] [PASSED] VIC 106
[21:40:39] [PASSED] VIC 107
[21:40:39] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[21:40:39] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[21:40:39] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[21:40:39] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[21:40:39] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[21:40:39] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[21:40:39] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[21:40:39] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[21:40:39] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[21:40:39] [PASSED] Automatic
[21:40:39] [PASSED] Full
[21:40:39] [PASSED] Limited 16:235
[21:40:39] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[21:40:39] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[21:40:39] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[21:40:39] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[21:40:39] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[21:40:39] [PASSED] RGB
[21:40:39] [PASSED] YUV 4:2:0
[21:40:39] [PASSED] YUV 4:2:2
[21:40:39] [PASSED] YUV 4:4:4
[21:40:39] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[21:40:39] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[21:40:39] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[21:40:39] ============= drm_damage_helper (21 subtests) ==============
[21:40:39] [PASSED] drm_test_damage_iter_no_damage
[21:40:39] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[21:40:39] [PASSED] drm_test_damage_iter_no_damage_src_moved
[21:40:39] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[21:40:39] [PASSED] drm_test_damage_iter_no_damage_not_visible
[21:40:39] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[21:40:39] [PASSED] drm_test_damage_iter_no_damage_no_fb
[21:40:39] [PASSED] drm_test_damage_iter_simple_damage
[21:40:39] [PASSED] drm_test_damage_iter_single_damage
[21:40:39] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[21:40:39] [PASSED] drm_test_damage_iter_single_damage_outside_src
[21:40:39] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[21:40:39] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[21:40:39] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[21:40:39] [PASSED] drm_test_damage_iter_single_damage_src_moved
[21:40:39] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[21:40:39] [PASSED] drm_test_damage_iter_damage
[21:40:39] [PASSED] drm_test_damage_iter_damage_one_intersect
[21:40:39] [PASSED] drm_test_damage_iter_damage_one_outside
[21:40:39] [PASSED] drm_test_damage_iter_damage_src_moved
[21:40:39] [PASSED] drm_test_damage_iter_damage_not_visible
[21:40:39] ================ [PASSED] drm_damage_helper ================
[21:40:39] ============== drm_dp_mst_helper (3 subtests) ==============
[21:40:39] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[21:40:39] [PASSED] Clock 154000 BPP 30 DSC disabled
[21:40:39] [PASSED] Clock 234000 BPP 30 DSC disabled
[21:40:39] [PASSED] Clock 297000 BPP 24 DSC disabled
[21:40:39] [PASSED] Clock 332880 BPP 24 DSC enabled
[21:40:39] [PASSED] Clock 324540 BPP 24 DSC enabled
[21:40:39] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[21:40:39] ============== drm_test_dp_mst_calc_pbn_div  ===============
[21:40:39] [PASSED] Link rate 2000000 lane count 4
[21:40:39] [PASSED] Link rate 2000000 lane count 2
[21:40:39] [PASSED] Link rate 2000000 lane count 1
[21:40:39] [PASSED] Link rate 1350000 lane count 4
[21:40:39] [PASSED] Link rate 1350000 lane count 2
[21:40:39] [PASSED] Link rate 1350000 lane count 1
[21:40:39] [PASSED] Link rate 1000000 lane count 4
[21:40:39] [PASSED] Link rate 1000000 lane count 2
[21:40:39] [PASSED] Link rate 1000000 lane count 1
[21:40:39] [PASSED] Link rate 810000 lane count 4
[21:40:39] [PASSED] Link rate 810000 lane count 2
[21:40:39] [PASSED] Link rate 810000 lane count 1
[21:40:39] [PASSED] Link rate 540000 lane count 4
[21:40:39] [PASSED] Link rate 540000 lane count 2
[21:40:39] [PASSED] Link rate 540000 lane count 1
[21:40:39] [PASSED] Link rate 270000 lane count 4
[21:40:39] [PASSED] Link rate 270000 lane count 2
[21:40:39] [PASSED] Link rate 270000 lane count 1
[21:40:39] [PASSED] Link rate 162000 lane count 4
[21:40:39] [PASSED] Link rate 162000 lane count 2
[21:40:39] [PASSED] Link rate 162000 lane count 1
[21:40:39] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[21:40:39] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[21:40:39] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[21:40:39] [PASSED] DP_POWER_UP_PHY with port number
[21:40:39] [PASSED] DP_POWER_DOWN_PHY with port number
[21:40:39] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[21:40:39] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[21:40:39] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[21:40:39] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[21:40:39] [PASSED] DP_QUERY_PAYLOAD with port number
[21:40:39] [PASSED] DP_QUERY_PAYLOAD with VCPI
[21:40:39] [PASSED] DP_REMOTE_DPCD_READ with port number
[21:40:39] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[21:40:39] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[21:40:39] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[21:40:39] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[21:40:39] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[21:40:39] [PASSED] DP_REMOTE_I2C_READ with port number
[21:40:39] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[21:40:39] [PASSED] DP_REMOTE_I2C_READ with transactions array
[21:40:39] [PASSED] DP_REMOTE_I2C_WRITE with port number
[21:40:39] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[21:40:39] [PASSED] DP_REMOTE_I2C_WRITE with data array
[21:40:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[21:40:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[21:40:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[21:40:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[21:40:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[21:40:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[21:40:39] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[21:40:39] ================ [PASSED] drm_dp_mst_helper ================
[21:40:39] ================== drm_exec (7 subtests) ===================
[21:40:39] [PASSED] sanitycheck
[21:40:39] [PASSED] test_lock
[21:40:39] [PASSED] test_lock_unlock
[21:40:39] [PASSED] test_duplicates
[21:40:39] [PASSED] test_prepare
[21:40:39] [PASSED] test_prepare_array
[21:40:39] [PASSED] test_multiple_loops
[21:40:39] ==================== [PASSED] drm_exec =====================
[21:40:39] =========== drm_format_helper_test (17 subtests) ===========
[21:40:39] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[21:40:39] [PASSED] single_pixel_source_buffer
[21:40:39] [PASSED] single_pixel_clip_rectangle
[21:40:39] [PASSED] well_known_colors
[21:40:39] [PASSED] destination_pitch
[21:40:39] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[21:40:39] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[21:40:39] [PASSED] single_pixel_source_buffer
[21:40:39] [PASSED] single_pixel_clip_rectangle
[21:40:39] [PASSED] well_known_colors
[21:40:39] [PASSED] destination_pitch
[21:40:39] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[21:40:39] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[21:40:39] [PASSED] single_pixel_source_buffer
[21:40:39] [PASSED] single_pixel_clip_rectangle
[21:40:39] [PASSED] well_known_colors
[21:40:39] [PASSED] destination_pitch
[21:40:39] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[21:40:39] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[21:40:39] [PASSED] single_pixel_source_buffer
[21:40:39] [PASSED] single_pixel_clip_rectangle
[21:40:39] [PASSED] well_known_colors
[21:40:39] [PASSED] destination_pitch
[21:40:39] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[21:40:39] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[21:40:39] [PASSED] single_pixel_source_buffer
[21:40:39] [PASSED] single_pixel_clip_rectangle
[21:40:39] [PASSED] well_known_colors
[21:40:39] [PASSED] destination_pitch
[21:40:39] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[21:40:39] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[21:40:39] [PASSED] single_pixel_source_buffer
[21:40:39] [PASSED] single_pixel_clip_rectangle
[21:40:39] [PASSED] well_known_colors
[21:40:39] [PASSED] destination_pitch
[21:40:39] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[21:40:39] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[21:40:39] [PASSED] single_pixel_source_buffer
[21:40:39] [PASSED] single_pixel_clip_rectangle
[21:40:39] [PASSED] well_known_colors
[21:40:39] [PASSED] destination_pitch
[21:40:39] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[21:40:39] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[21:40:39] [PASSED] single_pixel_source_buffer
[21:40:39] [PASSED] single_pixel_clip_rectangle
[21:40:39] [PASSED] well_known_colors
[21:40:39] [PASSED] destination_pitch
[21:40:39] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[21:40:39] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[21:40:39] [PASSED] single_pixel_source_buffer
[21:40:39] [PASSED] single_pixel_clip_rectangle
[21:40:39] [PASSED] well_known_colors
[21:40:39] [PASSED] destination_pitch
[21:40:39] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[21:40:39] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[21:40:39] [PASSED] single_pixel_source_buffer
[21:40:39] [PASSED] single_pixel_clip_rectangle
[21:40:39] [PASSED] well_known_colors
[21:40:39] [PASSED] destination_pitch
[21:40:39] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[21:40:39] ============== drm_test_fb_xrgb8888_to_mono  ===============
[21:40:39] [PASSED] single_pixel_source_buffer
[21:40:39] [PASSED] single_pixel_clip_rectangle
[21:40:39] [PASSED] well_known_colors
[21:40:39] [PASSED] destination_pitch
[21:40:39] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[21:40:39] ==================== drm_test_fb_swab  =====================
[21:40:39] [PASSED] single_pixel_source_buffer
[21:40:39] [PASSED] single_pixel_clip_rectangle
[21:40:39] [PASSED] well_known_colors
[21:40:39] [PASSED] destination_pitch
[21:40:39] ================ [PASSED] drm_test_fb_swab =================
[21:40:39] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[21:40:39] [PASSED] single_pixel_source_buffer
[21:40:39] [PASSED] single_pixel_clip_rectangle
[21:40:39] [PASSED] well_known_colors
[21:40:39] [PASSED] destination_pitch
[21:40:39] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[21:40:39] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[21:40:39] [PASSED] single_pixel_source_buffer
[21:40:39] [PASSED] single_pixel_clip_rectangle
[21:40:39] [PASSED] well_known_colors
[21:40:39] [PASSED] destination_pitch
[21:40:39] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[21:40:39] ================= drm_test_fb_clip_offset  =================
[21:40:39] [PASSED] pass through
[21:40:39] [PASSED] horizontal offset
[21:40:39] [PASSED] vertical offset
[21:40:39] [PASSED] horizontal and vertical offset
[21:40:39] [PASSED] horizontal offset (custom pitch)
[21:40:39] [PASSED] vertical offset (custom pitch)
[21:40:39] [PASSED] horizontal and vertical offset (custom pitch)
[21:40:39] ============= [PASSED] drm_test_fb_clip_offset =============
[21:40:39] ============== drm_test_fb_build_fourcc_list  ==============
[21:40:39] [PASSED] no native formats
[21:40:39] [PASSED] XRGB8888 as native format
[21:40:39] [PASSED] remove duplicates
[21:40:39] [PASSED] convert alpha formats
[21:40:39] [PASSED] random formats
[21:40:39] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[21:40:39] =================== drm_test_fb_memcpy  ====================
[21:40:39] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[21:40:39] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[21:40:39] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[21:40:39] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[21:40:39] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[21:40:39] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[21:40:39] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[21:40:39] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[21:40:39] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[21:40:39] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[21:40:39] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[21:40:39] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[21:40:39] =============== [PASSED] drm_test_fb_memcpy ================
[21:40:39] ============= [PASSED] drm_format_helper_test ==============
[21:40:39] ================= drm_format (18 subtests) =================
[21:40:39] [PASSED] drm_test_format_block_width_invalid
[21:40:39] [PASSED] drm_test_format_block_width_one_plane
[21:40:39] [PASSED] drm_test_format_block_width_two_plane
[21:40:39] [PASSED] drm_test_format_block_width_three_plane
[21:40:39] [PASSED] drm_test_format_block_width_tiled
[21:40:39] [PASSED] drm_test_format_block_height_invalid
[21:40:39] [PASSED] drm_test_format_block_height_one_plane
[21:40:39] [PASSED] drm_test_format_block_height_two_plane
[21:40:39] [PASSED] drm_test_format_block_height_three_plane
[21:40:39] [PASSED] drm_test_format_block_height_tiled
[21:40:39] [PASSED] drm_test_format_min_pitch_invalid
[21:40:39] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[21:40:39] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[21:40:39] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[21:40:39] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[21:40:39] [PASSED] drm_test_format_min_pitch_two_plane
[21:40:39] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[21:40:39] [PASSED] drm_test_format_min_pitch_tiled
[21:40:39] =================== [PASSED] drm_format ====================
[21:40:39] ============== drm_framebuffer (10 subtests) ===============
[21:40:39] ========== drm_test_framebuffer_check_src_coords  ==========
[21:40:39] [PASSED] Success: source fits into fb
[21:40:39] [PASSED] Fail: overflowing fb with x-axis coordinate
[21:40:39] [PASSED] Fail: overflowing fb with y-axis coordinate
[21:40:39] [PASSED] Fail: overflowing fb with source width
[21:40:39] [PASSED] Fail: overflowing fb with source height
[21:40:39] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[21:40:39] [PASSED] drm_test_framebuffer_cleanup
[21:40:39] =============== drm_test_framebuffer_create  ===============
[21:40:39] [PASSED] ABGR8888 normal sizes
[21:40:39] [PASSED] ABGR8888 max sizes
[21:40:39] [PASSED] ABGR8888 pitch greater than min required
[21:40:39] [PASSED] ABGR8888 pitch less than min required
[21:40:39] [PASSED] ABGR8888 Invalid width
[21:40:39] [PASSED] ABGR8888 Invalid buffer handle
[21:40:39] [PASSED] No pixel format
[21:40:39] [PASSED] ABGR8888 Width 0
[21:40:39] [PASSED] ABGR8888 Height 0
[21:40:39] [PASSED] ABGR8888 Out of bound height * pitch combination
[21:40:39] [PASSED] ABGR8888 Large buffer offset
[21:40:39] [PASSED] ABGR8888 Buffer offset for inexistent plane
[21:40:39] [PASSED] ABGR8888 Invalid flag
[21:40:39] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[21:40:39] [PASSED] ABGR8888 Valid buffer modifier
[21:40:39] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[21:40:39] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[21:40:39] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[21:40:39] [PASSED] NV12 Normal sizes
[21:40:39] [PASSED] NV12 Max sizes
[21:40:39] [PASSED] NV12 Invalid pitch
[21:40:39] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[21:40:39] [PASSED] NV12 different  modifier per-plane
[21:40:39] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[21:40:39] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[21:40:39] [PASSED] NV12 Modifier for inexistent plane
[21:40:39] [PASSED] NV12 Handle for inexistent plane
[21:40:39] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[21:40:39] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[21:40:39] [PASSED] YVU420 Normal sizes
[21:40:39] [PASSED] YVU420 Max sizes
[21:40:39] [PASSED] YVU420 Invalid pitch
[21:40:39] [PASSED] YVU420 Different pitches
[21:40:39] [PASSED] YVU420 Different buffer offsets/pitches
[21:40:39] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[21:40:39] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[21:40:39] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[21:40:39] [PASSED] YVU420 Valid modifier
[21:40:39] [PASSED] YVU420 Different modifiers per plane
[21:40:39] [PASSED] YVU420 Modifier for inexistent plane
[21:40:39] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[21:40:39] [PASSED] X0L2 Normal sizes
[21:40:39] [PASSED] X0L2 Max sizes
[21:40:39] [PASSED] X0L2 Invalid pitch
[21:40:39] [PASSED] X0L2 Pitch greater than minimum required
[21:40:39] [PASSED] X0L2 Handle for inexistent plane
[21:40:39] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[21:40:39] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[21:40:39] [PASSED] X0L2 Valid modifier
[21:40:39] [PASSED] X0L2 Modifier for inexistent plane
[21:40:39] =========== [PASSED] drm_test_framebuffer_create ===========
[21:40:39] [PASSED] drm_test_framebuffer_free
[21:40:39] [PASSED] drm_test_framebuffer_init
[21:40:39] [PASSED] drm_test_framebuffer_init_bad_format
[21:40:39] [PASSED] drm_test_framebuffer_init_dev_mismatch
[21:40:39] [PASSED] drm_test_framebuffer_lookup
[21:40:39] [PASSED] drm_test_framebuffer_lookup_inexistent
[21:40:39] [PASSED] drm_test_framebuffer_modifiers_not_supported
[21:40:39] ================= [PASSED] drm_framebuffer =================
[21:40:39] ================ drm_gem_shmem (8 subtests) ================
[21:40:39] [PASSED] drm_gem_shmem_test_obj_create
[21:40:39] [PASSED] drm_gem_shmem_test_obj_create_private
[21:40:39] [PASSED] drm_gem_shmem_test_pin_pages
[21:40:39] [PASSED] drm_gem_shmem_test_vmap
[21:40:39] [PASSED] drm_gem_shmem_test_get_pages_sgt
[21:40:39] [PASSED] drm_gem_shmem_test_get_sg_table
[21:40:39] [PASSED] drm_gem_shmem_test_madvise
[21:40:39] [PASSED] drm_gem_shmem_test_purge
[21:40:39] ================== [PASSED] drm_gem_shmem ==================
[21:40:39] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[21:40:39] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[21:40:39] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[21:40:39] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[21:40:39] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[21:40:39] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[21:40:39] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[21:40:39] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[21:40:39] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[21:40:39] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[21:40:39] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[21:40:39] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[21:40:39] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[21:40:39] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[21:40:39] [PASSED] drm_test_check_output_bpc_dvi
[21:40:39] [PASSED] drm_test_check_output_bpc_format_vic_1
[21:40:39] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[21:40:39] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[21:40:39] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[21:40:39] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[21:40:39] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[21:40:39] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[21:40:39] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[21:40:39] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[21:40:39] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[21:40:39] [PASSED] drm_test_check_broadcast_rgb_value
[21:40:39] [PASSED] drm_test_check_bpc_8_value
[21:40:39] [PASSED] drm_test_check_bpc_10_value
[21:40:39] [PASSED] drm_test_check_bpc_12_value
[21:40:39] [PASSED] drm_test_check_format_value
[21:40:39] [PASSED] drm_test_check_tmds_char_value
[21:40:39] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[21:40:39] ================= drm_managed (2 subtests) =================
[21:40:39] [PASSED] drm_test_managed_release_action
[21:40:39] [PASSED] drm_test_managed_run_action
[21:40:39] =================== [PASSED] drm_managed ===================
[21:40:39] =================== drm_mm (6 subtests) ====================
[21:40:39] [PASSED] drm_test_mm_init
[21:40:39] [PASSED] drm_test_mm_debug
[21:40:39] [PASSED] drm_test_mm_align32
[21:40:39] [PASSED] drm_test_mm_align64
[21:40:39] [PASSED] drm_test_mm_lowest
[21:40:39] [PASSED] drm_test_mm_highest
[21:40:39] ===================== [PASSED] drm_mm ======================
[21:40:39] ============= drm_modes_analog_tv (5 subtests) =============
[21:40:39] [PASSED] drm_test_modes_analog_tv_mono_576i
[21:40:39] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[21:40:39] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[21:40:39] [PASSED] drm_test_modes_analog_tv_pal_576i
[21:40:39] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[21:40:39] =============== [PASSED] drm_modes_analog_tv ===============
stty: 'standard input': Inappropriate ioctl for device
[21:40:39] ============== drm_plane_helper (2 subtests) ===============
[21:40:39] =============== drm_test_check_plane_state  ================
[21:40:39] [PASSED] clipping_simple
[21:40:39] [PASSED] clipping_rotate_reflect
[21:40:39] [PASSED] positioning_simple
[21:40:39] [PASSED] upscaling
[21:40:39] [PASSED] downscaling
[21:40:39] [PASSED] rounding1
[21:40:39] [PASSED] rounding2
[21:40:39] [PASSED] rounding3
[21:40:39] [PASSED] rounding4
[21:40:39] =========== [PASSED] drm_test_check_plane_state ============
[21:40:39] =========== drm_test_check_invalid_plane_state  ============
[21:40:39] [PASSED] positioning_invalid
[21:40:39] [PASSED] upscaling_invalid
[21:40:39] [PASSED] downscaling_invalid
[21:40:39] ======= [PASSED] drm_test_check_invalid_plane_state ========
[21:40:39] ================ [PASSED] drm_plane_helper =================
[21:40:39] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[21:40:39] ====== drm_test_connector_helper_tv_get_modes_check  =======
[21:40:39] [PASSED] None
[21:40:39] [PASSED] PAL
[21:40:39] [PASSED] NTSC
[21:40:39] [PASSED] Both, NTSC Default
[21:40:39] [PASSED] Both, PAL Default
[21:40:39] [PASSED] Both, NTSC Default, with PAL on command-line
[21:40:39] [PASSED] Both, PAL Default, with NTSC on command-line
[21:40:39] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[21:40:39] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[21:40:39] ================== drm_rect (9 subtests) ===================
[21:40:39] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[21:40:39] [PASSED] drm_test_rect_clip_scaled_not_clipped
[21:40:39] [PASSED] drm_test_rect_clip_scaled_clipped
[21:40:39] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[21:40:39] ================= drm_test_rect_intersect  =================
[21:40:39] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[21:40:39] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[21:40:39] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[21:40:39] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[21:40:39] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[21:40:39] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[21:40:39] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[21:40:39] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[21:40:39] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[21:40:39] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[21:40:39] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[21:40:39] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[21:40:39] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[21:40:39] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[21:40:39] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[21:40:39] ============= [PASSED] drm_test_rect_intersect =============
[21:40:39] ================ drm_test_rect_calc_hscale  ================
[21:40:39] [PASSED] normal use
[21:40:39] [PASSED] out of max range
[21:40:39] [PASSED] out of min range
[21:40:39] [PASSED] zero dst
[21:40:39] [PASSED] negative src
[21:40:39] [PASSED] negative dst
[21:40:39] ============ [PASSED] drm_test_rect_calc_hscale ============
[21:40:39] ================ drm_test_rect_calc_vscale  ================
[21:40:39] [PASSED] normal use
[21:40:39] [PASSED] out of max range
[21:40:39] [PASSED] out of min range
[21:40:39] [PASSED] zero dst
[21:40:39] [PASSED] negative src
[21:40:39] [PASSED] negative dst
[21:40:39] ============ [PASSED] drm_test_rect_calc_vscale ============
[21:40:39] ================== drm_test_rect_rotate  ===================
[21:40:39] [PASSED] reflect-x
[21:40:39] [PASSED] reflect-y
[21:40:39] [PASSED] rotate-0
[21:40:39] [PASSED] rotate-90
[21:40:39] [PASSED] rotate-180
[21:40:39] [PASSED] rotate-270
[21:40:39] ============== [PASSED] drm_test_rect_rotate ===============
[21:40:39] ================ drm_test_rect_rotate_inv  =================
[21:40:39] [PASSED] reflect-x
[21:40:39] [PASSED] reflect-y
[21:40:39] [PASSED] rotate-0
[21:40:39] [PASSED] rotate-90
[21:40:39] [PASSED] rotate-180
[21:40:39] [PASSED] rotate-270
[21:40:39] ============ [PASSED] drm_test_rect_rotate_inv =============
[21:40:39] ==================== [PASSED] drm_rect =====================
[21:40:39] ============================================================
[21:40:39] Testing complete. Ran 526 tests: passed: 526
[21:40:39] Elapsed time: 24.455s total, 1.680s configuring, 22.610s building, 0.161s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[21:40:39] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:40:40] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
[21:40:48] Starting KUnit Kernel (1/1)...
[21:40:48] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[21:40:48] ================= ttm_device (5 subtests) ==================
[21:40:48] [PASSED] ttm_device_init_basic
[21:40:48] [PASSED] ttm_device_init_multiple
[21:40:48] [PASSED] ttm_device_fini_basic
[21:40:48] [PASSED] ttm_device_init_no_vma_man
[21:40:48] ================== ttm_device_init_pools  ==================
[21:40:48] [PASSED] No DMA allocations, no DMA32 required
[21:40:48] [PASSED] DMA allocations, DMA32 required
[21:40:48] [PASSED] No DMA allocations, DMA32 required
[21:40:48] [PASSED] DMA allocations, no DMA32 required
[21:40:48] ============== [PASSED] ttm_device_init_pools ==============
[21:40:48] =================== [PASSED] ttm_device ====================
[21:40:48] ================== ttm_pool (8 subtests) ===================
[21:40:48] ================== ttm_pool_alloc_basic  ===================
[21:40:48] [PASSED] One page
[21:40:48] [PASSED] More than one page
[21:40:48] [PASSED] Above the allocation limit
[21:40:48] [PASSED] One page, with coherent DMA mappings enabled
[21:40:48] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[21:40:48] ============== [PASSED] ttm_pool_alloc_basic ===============
[21:40:48] ============== ttm_pool_alloc_basic_dma_addr  ==============
[21:40:48] [PASSED] One page
[21:40:48] [PASSED] More than one page
[21:40:48] [PASSED] Above the allocation limit
[21:40:48] [PASSED] One page, with coherent DMA mappings enabled
[21:40:48] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[21:40:48] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[21:40:48] [PASSED] ttm_pool_alloc_order_caching_match
[21:40:48] [PASSED] ttm_pool_alloc_caching_mismatch
[21:40:48] [PASSED] ttm_pool_alloc_order_mismatch
[21:40:48] [PASSED] ttm_pool_free_dma_alloc
[21:40:48] [PASSED] ttm_pool_free_no_dma_alloc
[21:40:48] [PASSED] ttm_pool_fini_basic
[21:40:48] ==================== [PASSED] ttm_pool =====================
[21:40:48] ================ ttm_resource (8 subtests) =================
[21:40:48] ================= ttm_resource_init_basic  =================
[21:40:48] [PASSED] Init resource in TTM_PL_SYSTEM
[21:40:48] [PASSED] Init resource in TTM_PL_VRAM
[21:40:48] [PASSED] Init resource in a private placement
[21:40:48] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[21:40:48] ============= [PASSED] ttm_resource_init_basic =============
[21:40:48] [PASSED] ttm_resource_init_pinned
[21:40:48] [PASSED] ttm_resource_fini_basic
[21:40:48] [PASSED] ttm_resource_manager_init_basic
[21:40:48] [PASSED] ttm_resource_manager_usage_basic
[21:40:48] [PASSED] ttm_resource_manager_set_used_basic
[21:40:48] [PASSED] ttm_sys_man_alloc_basic
[21:40:48] [PASSED] ttm_sys_man_free_basic
[21:40:48] ================== [PASSED] ttm_resource ===================
[21:40:48] =================== ttm_tt (15 subtests) ===================
[21:40:48] ==================== ttm_tt_init_basic  ====================
[21:40:48] [PASSED] Page-aligned size
[21:40:48] [PASSED] Extra pages requested
[21:40:48] ================ [PASSED] ttm_tt_init_basic ================
[21:40:48] [PASSED] ttm_tt_init_misaligned
[21:40:48] [PASSED] ttm_tt_fini_basic
[21:40:48] [PASSED] ttm_tt_fini_sg
[21:40:48] [PASSED] ttm_tt_fini_shmem
[21:40:48] [PASSED] ttm_tt_create_basic
[21:40:48] [PASSED] ttm_tt_create_invalid_bo_type
[21:40:48] [PASSED] ttm_tt_create_ttm_exists
[21:40:48] [PASSED] ttm_tt_create_failed
[21:40:48] [PASSED] ttm_tt_destroy_basic
[21:40:48] [PASSED] ttm_tt_populate_null_ttm
[21:40:48] [PASSED] ttm_tt_populate_populated_ttm
[21:40:48] [PASSED] ttm_tt_unpopulate_basic
[21:40:48] [PASSED] ttm_tt_unpopulate_empty_ttm
[21:40:48] [PASSED] ttm_tt_swapin_basic
[21:40:48] ===================== [PASSED] ttm_tt ======================
[21:40:48] =================== ttm_bo (14 subtests) ===================
[21:40:48] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[21:40:48] [PASSED] Cannot be interrupted and sleeps
[21:40:48] [PASSED] Cannot be interrupted, locks straight away
[21:40:48] [PASSED] Can be interrupted, sleeps
[21:40:48] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[21:40:48] [PASSED] ttm_bo_reserve_locked_no_sleep
[21:40:48] [PASSED] ttm_bo_reserve_no_wait_ticket
[21:40:48] [PASSED] ttm_bo_reserve_double_resv
[21:40:48] [PASSED] ttm_bo_reserve_interrupted
[21:40:48] [PASSED] ttm_bo_reserve_deadlock
[21:40:48] [PASSED] ttm_bo_unreserve_basic
[21:40:48] [PASSED] ttm_bo_unreserve_pinned
[21:40:48] [PASSED] ttm_bo_unreserve_bulk
[21:40:48] [PASSED] ttm_bo_put_basic
[21:40:48] [PASSED] ttm_bo_put_shared_resv
[21:40:48] [PASSED] ttm_bo_pin_basic
[21:40:48] [PASSED] ttm_bo_pin_unpin_resource
[21:40:48] [PASSED] ttm_bo_multiple_pin_one_unpin
[21:40:48] ===================== [PASSED] ttm_bo ======================
[21:40:48] ============== ttm_bo_validate (22 subtests) ===============
[21:40:48] ============== ttm_bo_init_reserved_sys_man  ===============
[21:40:48] [PASSED] Buffer object for userspace
[21:40:48] [PASSED] Kernel buffer object
[21:40:48] [PASSED] Shared buffer object
[21:40:48] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[21:40:48] ============== ttm_bo_init_reserved_mock_man  ==============
[21:40:48] [PASSED] Buffer object for userspace
[21:40:48] [PASSED] Kernel buffer object
[21:40:48] [PASSED] Shared buffer object
[21:40:48] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[21:40:48] [PASSED] ttm_bo_init_reserved_resv
[21:40:48] ================== ttm_bo_validate_basic  ==================
[21:40:48] [PASSED] Buffer object for userspace
[21:40:48] [PASSED] Kernel buffer object
[21:40:48] [PASSED] Shared buffer object
[21:40:48] ============== [PASSED] ttm_bo_validate_basic ==============
[21:40:48] [PASSED] ttm_bo_validate_invalid_placement
[21:40:48] ============= ttm_bo_validate_same_placement  ==============
[21:40:48] [PASSED] System manager
[21:40:48] [PASSED] VRAM manager
[21:40:48] ========= [PASSED] ttm_bo_validate_same_placement ==========
[21:40:48] [PASSED] ttm_bo_validate_failed_alloc
[21:40:48] [PASSED] ttm_bo_validate_pinned
[21:40:48] [PASSED] ttm_bo_validate_busy_placement
[21:40:48] ================ ttm_bo_validate_multihop  =================
[21:40:48] [PASSED] Buffer object for userspace
[21:40:48] [PASSED] Kernel buffer object
[21:40:48] [PASSED] Shared buffer object
[21:40:48] ============ [PASSED] ttm_bo_validate_multihop =============
[21:40:48] ========== ttm_bo_validate_no_placement_signaled  ==========
[21:40:48] [PASSED] Buffer object in system domain, no page vector
[21:40:48] [PASSED] Buffer object in system domain with an existing page vector
[21:40:48] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[21:40:48] ======== ttm_bo_validate_no_placement_not_signaled  ========
[21:40:48] [PASSED] Buffer object for userspace
[21:40:48] [PASSED] Kernel buffer object
[21:40:48] [PASSED] Shared buffer object
[21:40:48] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[21:40:48] [PASSED] ttm_bo_validate_move_fence_signaled
[21:40:48] ========= ttm_bo_validate_move_fence_not_signaled  =========
[21:40:48] [PASSED] Waits for GPU
[21:40:48] [PASSED] Tries to lock straight away
[21:40:49] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[21:40:49] [PASSED] ttm_bo_validate_swapout
[21:40:49] [PASSED] ttm_bo_validate_happy_evict
[21:40:49] [PASSED] ttm_bo_validate_all_pinned_evict
[21:40:49] [PASSED] ttm_bo_validate_allowed_only_evict
[21:40:49] [PASSED] ttm_bo_validate_deleted_evict
[21:40:49] [PASSED] ttm_bo_validate_busy_domain_evict
[21:40:49] [PASSED] ttm_bo_validate_evict_gutting
[21:40:49] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[21:40:49] ================= [PASSED] ttm_bo_validate =================
[21:40:49] ============================================================
[21:40:49] Testing complete. Ran 102 tests: passed: 102
[21:40:49] Elapsed time: 9.942s total, 1.678s configuring, 7.598s building, 0.546s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


