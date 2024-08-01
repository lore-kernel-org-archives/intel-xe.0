Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C8CC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 15:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C11E10E8EA;
	Thu,  1 Aug 2024 15:47:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24BB10E8D1;
 Thu,  1 Aug 2024 15:47:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Faster_devcoredump_and_fixes_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Aug 2024 15:47:14 -0000
Message-ID: <172252723498.488394.4131637469798780765@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801154118.2547543-1-matthew.brost@intel.com>
In-Reply-To: <20240801154118.2547543-1-matthew.brost@intel.com>
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

Series: Faster devcoredump and fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/136770/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[15:46:06] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:46:11] Building KUnit Kernel ...
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

[15:46:37] Starting KUnit Kernel (1/1)...
[15:46:37] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[15:46:37] =================== guc_dbm (7 subtests) ===================
[15:46:37] [PASSED] test_empty
[15:46:37] [PASSED] test_default
[15:46:37] ======================== test_size  ========================
[15:46:37] [PASSED] 4
[15:46:37] [PASSED] 8
[15:46:37] [PASSED] 32
[15:46:37] [PASSED] 256
[15:46:37] ==================== [PASSED] test_size ====================
[15:46:37] ======================= test_reuse  ========================
[15:46:37] [PASSED] 4
[15:46:37] [PASSED] 8
[15:46:37] [PASSED] 32
[15:46:37] [PASSED] 256
[15:46:37] =================== [PASSED] test_reuse ====================
[15:46:37] =================== test_range_overlap  ====================
[15:46:37] [PASSED] 4
[15:46:37] [PASSED] 8
[15:46:37] [PASSED] 32
[15:46:37] [PASSED] 256
[15:46:37] =============== [PASSED] test_range_overlap ================
[15:46:37] =================== test_range_compact  ====================
[15:46:37] [PASSED] 4
[15:46:37] [PASSED] 8
[15:46:37] [PASSED] 32
[15:46:37] [PASSED] 256
[15:46:37] =============== [PASSED] test_range_compact ================
[15:46:37] ==================== test_range_spare  =====================
[15:46:37] [PASSED] 4
[15:46:37] [PASSED] 8
[15:46:37] [PASSED] 32
[15:46:37] [PASSED] 256
[15:46:37] ================ [PASSED] test_range_spare =================
[15:46:37] ===================== [PASSED] guc_dbm =====================
[15:46:37] =================== guc_idm (6 subtests) ===================
[15:46:37] [PASSED] bad_init
[15:46:37] [PASSED] no_init
[15:46:37] [PASSED] init_fini
[15:46:37] [PASSED] check_used
[15:46:37] [PASSED] check_quota
[15:46:37] [PASSED] check_all
[15:46:37] ===================== [PASSED] guc_idm =====================
[15:46:37] ================== no_relay (3 subtests) ===================
[15:46:37] [PASSED] xe_drops_guc2pf_if_not_ready
[15:46:37] [PASSED] xe_drops_guc2vf_if_not_ready
[15:46:37] [PASSED] xe_rejects_send_if_not_ready
[15:46:37] ==================== [PASSED] no_relay =====================
[15:46:37] ================== pf_relay (14 subtests) ==================
[15:46:37] [PASSED] pf_rejects_guc2pf_too_short
[15:46:37] [PASSED] pf_rejects_guc2pf_too_long
[15:46:37] [PASSED] pf_rejects_guc2pf_no_payload
[15:46:37] [PASSED] pf_fails_no_payload
[15:46:37] [PASSED] pf_fails_bad_origin
[15:46:37] [PASSED] pf_fails_bad_type
[15:46:37] [PASSED] pf_txn_reports_error
[15:46:37] [PASSED] pf_txn_sends_pf2guc
[15:46:37] [PASSED] pf_sends_pf2guc
[15:46:37] [SKIPPED] pf_loopback_nop
[15:46:37] [SKIPPED] pf_loopback_echo
[15:46:37] [SKIPPED] pf_loopback_fail
[15:46:37] [SKIPPED] pf_loopback_busy
[15:46:37] [SKIPPED] pf_loopback_retry
[15:46:37] ==================== [PASSED] pf_relay =====================
[15:46:37] ================== vf_relay (3 subtests) ===================
[15:46:37] [PASSED] vf_rejects_guc2vf_too_short
[15:46:37] [PASSED] vf_rejects_guc2vf_too_long
[15:46:37] [PASSED] vf_rejects_guc2vf_no_payload
[15:46:37] ==================== [PASSED] vf_relay =====================
[15:46:37] ================= pf_service (11 subtests) =================
[15:46:37] [PASSED] pf_negotiate_any
[15:46:37] [PASSED] pf_negotiate_base_match
[15:46:37] [PASSED] pf_negotiate_base_newer
[15:46:37] [PASSED] pf_negotiate_base_next
[15:46:37] [SKIPPED] pf_negotiate_base_older
[15:46:37] [PASSED] pf_negotiate_base_prev
[15:46:37] [PASSED] pf_negotiate_latest_match
[15:46:37] [PASSED] pf_negotiate_latest_newer
[15:46:37] [PASSED] pf_negotiate_latest_next
[15:46:37] [SKIPPED] pf_negotiate_latest_older
[15:46:37] [SKIPPED] pf_negotiate_latest_prev
[15:46:37] =================== [PASSED] pf_service ====================
[15:46:37] ===================== lmtt (1 subtest) =====================
[15:46:37] ======================== test_ops  =========================
[15:46:37] [PASSED] 2-level
[15:46:37] [PASSED] multi-level
[15:46:37] ==================== [PASSED] test_ops =====================
[15:46:37] ====================== [PASSED] lmtt =======================
[15:46:37] =================== xe_mocs (2 subtests) ===================
[15:46:37] ================ xe_live_mocs_kernel_kunit  ================
[15:46:37] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[15:46:37] ================ xe_live_mocs_reset_kunit  =================
[15:46:37] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[15:46:37] ==================== [SKIPPED] xe_mocs =====================
[15:46:37] ================= xe_migrate (2 subtests) ==================
[15:46:37] ================= xe_migrate_sanity_kunit  =================
[15:46:37] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[15:46:37] ================== xe_validate_ccs_kunit  ==================
[15:46:37] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[15:46:37] =================== [SKIPPED] xe_migrate ===================
[15:46:37] ================== xe_dma_buf (1 subtest) ==================
[15:46:37] ==================== xe_dma_buf_kunit  =====================
[15:46:37] ================ [SKIPPED] xe_dma_buf_kunit ================
[15:46:37] =================== [SKIPPED] xe_dma_buf ===================
[15:46:37] ==================== xe_bo (2 subtests) ====================
[15:46:37] ================== xe_ccs_migrate_kunit  ===================
[15:46:37] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[15:46:37] ==================== xe_bo_evict_kunit  ====================
[15:46:37] =============== [SKIPPED] xe_bo_evict_kunit ================
[15:46:37] ===================== [SKIPPED] xe_bo ======================
[15:46:37] ==================== args (11 subtests) ====================
[15:46:37] [PASSED] count_args_test
[15:46:37] [PASSED] call_args_example
[15:46:37] [PASSED] call_args_test
[15:46:37] [PASSED] drop_first_arg_example
[15:46:37] [PASSED] drop_first_arg_test
[15:46:37] [PASSED] first_arg_example
[15:46:37] [PASSED] first_arg_test
[15:46:37] [PASSED] last_arg_example
[15:46:37] [PASSED] last_arg_test
[15:46:37] [PASSED] pick_arg_example
[15:46:37] [PASSED] sep_comma_example
[15:46:37] ====================== [PASSED] args =======================
[15:46:37] =================== xe_pci (2 subtests) ====================
stty: 'standard input': Inappropriate ioctl for device
[15:46:37] [PASSED] xe_gmdid_graphics_ip
[15:46:37] [PASSED] xe_gmdid_media_ip
[15:46:37] ===================== [PASSED] xe_pci ======================
[15:46:37] =================== xe_rtp (2 subtests) ====================
[15:46:37] =============== xe_rtp_process_to_sr_tests  ================
[15:46:37] [PASSED] coalesce-same-reg
[15:46:37] [PASSED] no-match-no-add
[15:46:37] [PASSED] match-or
[15:46:37] [PASSED] match-or-xfail
[15:46:37] [PASSED] no-match-no-add-multiple-rules
[15:46:37] [PASSED] two-regs-two-entries
[15:46:37] [PASSED] clr-one-set-other
[15:46:37] [PASSED] set-field
[15:46:37] [PASSED] conflict-duplicate
[15:46:37] [PASSED] conflict-not-disjoint
[15:46:37] [PASSED] conflict-reg-type
[15:46:37] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[15:46:37] ================== xe_rtp_process_tests  ===================
[15:46:37] [PASSED] active1
[15:46:37] [PASSED] active2
[15:46:37] [PASSED] active-inactive
[15:46:37] [PASSED] inactive-active
[15:46:37] [PASSED] inactive-1st_or_active-inactive
[15:46:37] [PASSED] inactive-2nd_or_active-inactive
[15:46:37] [PASSED] inactive-last_or_active-inactive
[15:46:37] [PASSED] inactive-no_or_active-inactive
[15:46:37] ============== [PASSED] xe_rtp_process_tests ===============
[15:46:37] ===================== [PASSED] xe_rtp ======================
[15:46:37] ==================== xe_wa (1 subtest) =====================
[15:46:37] ======================== xe_wa_gt  =========================
[15:46:37] [PASSED] TIGERLAKE (B0)
[15:46:37] [PASSED] DG1 (A0)
[15:46:37] [PASSED] DG1 (B0)
[15:46:37] [PASSED] ALDERLAKE_S (A0)
[15:46:37] [PASSED] ALDERLAKE_S (B0)
[15:46:37] [PASSED] ALDERLAKE_S (C0)
[15:46:37] [PASSED] ALDERLAKE_S (D0)
[15:46:37] [PASSED] ALDERLAKE_P (A0)
[15:46:37] [PASSED] ALDERLAKE_P (B0)
[15:46:37] [PASSED] ALDERLAKE_P (C0)
[15:46:37] [PASSED] ALDERLAKE_S_RPLS (D0)
[15:46:37] [PASSED] ALDERLAKE_P_RPLU (E0)
[15:46:37] [PASSED] DG2_G10 (C0)
[15:46:37] [PASSED] DG2_G11 (B1)
[15:46:37] [PASSED] DG2_G12 (A1)
[15:46:37] [PASSED] METEORLAKE (g:A0, m:A0)
[15:46:37] [PASSED] METEORLAKE (g:A0, m:A0)
[15:46:37] [PASSED] METEORLAKE (g:A0, m:A0)
[15:46:37] [PASSED] LUNARLAKE (g:A0, m:A0)
[15:46:37] [PASSED] LUNARLAKE (g:B0, m:A0)
[15:46:37] [PASSED] BATTLEMAGE (g:A0, m:A1)
[15:46:37] ==================== [PASSED] xe_wa_gt =====================
[15:46:37] ====================== [PASSED] xe_wa ======================
[15:46:37] ============================================================
[15:46:37] Testing complete. Ran 121 tests: passed: 106, skipped: 15
[15:46:37] Elapsed time: 30.426s total, 4.190s configuring, 25.960s building, 0.236s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[15:46:37] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:46:39] Building KUnit Kernel ...
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

[15:47:00] Starting KUnit Kernel (1/1)...
[15:47:00] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[15:47:00] ============ drm_test_pick_cmdline (2 subtests) ============
[15:47:00] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[15:47:00] =============== drm_test_pick_cmdline_named  ===============
[15:47:00] [PASSED] NTSC
[15:47:00] [PASSED] NTSC-J
[15:47:00] [PASSED] PAL
[15:47:00] [PASSED] PAL-M
[15:47:00] =========== [PASSED] drm_test_pick_cmdline_named ===========
[15:47:00] ============== [PASSED] drm_test_pick_cmdline ==============
[15:47:00] ================== drm_buddy (7 subtests) ==================
[15:47:00] [PASSED] drm_test_buddy_alloc_limit
[15:47:00] [PASSED] drm_test_buddy_alloc_optimistic
[15:47:00] [PASSED] drm_test_buddy_alloc_pessimistic
[15:47:00] [PASSED] drm_test_buddy_alloc_pathological
[15:47:00] [PASSED] drm_test_buddy_alloc_contiguous
[15:47:00] [PASSED] drm_test_buddy_alloc_clear
[15:47:00] [PASSED] drm_test_buddy_alloc_range_bias
[15:47:00] ==================== [PASSED] drm_buddy ====================
[15:47:00] ============= drm_cmdline_parser (40 subtests) =============
[15:47:00] [PASSED] drm_test_cmdline_force_d_only
[15:47:00] [PASSED] drm_test_cmdline_force_D_only_dvi
[15:47:00] [PASSED] drm_test_cmdline_force_D_only_hdmi
[15:47:00] [PASSED] drm_test_cmdline_force_D_only_not_digital
[15:47:00] [PASSED] drm_test_cmdline_force_e_only
[15:47:00] [PASSED] drm_test_cmdline_res
[15:47:00] [PASSED] drm_test_cmdline_res_vesa
[15:47:00] [PASSED] drm_test_cmdline_res_vesa_rblank
[15:47:00] [PASSED] drm_test_cmdline_res_rblank
[15:47:00] [PASSED] drm_test_cmdline_res_bpp
[15:47:00] [PASSED] drm_test_cmdline_res_refresh
[15:47:00] [PASSED] drm_test_cmdline_res_bpp_refresh
[15:47:00] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[15:47:00] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[15:47:00] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[15:47:00] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[15:47:00] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[15:47:00] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[15:47:00] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[15:47:00] [PASSED] drm_test_cmdline_res_margins_force_on
[15:47:00] [PASSED] drm_test_cmdline_res_vesa_margins
[15:47:00] [PASSED] drm_test_cmdline_name
[15:47:00] [PASSED] drm_test_cmdline_name_bpp
[15:47:00] [PASSED] drm_test_cmdline_name_option
[15:47:00] [PASSED] drm_test_cmdline_name_bpp_option
[15:47:00] [PASSED] drm_test_cmdline_rotate_0
[15:47:00] [PASSED] drm_test_cmdline_rotate_90
[15:47:00] [PASSED] drm_test_cmdline_rotate_180
[15:47:00] [PASSED] drm_test_cmdline_rotate_270
[15:47:00] [PASSED] drm_test_cmdline_hmirror
[15:47:00] [PASSED] drm_test_cmdline_vmirror
[15:47:00] [PASSED] drm_test_cmdline_margin_options
[15:47:00] [PASSED] drm_test_cmdline_multiple_options
[15:47:00] [PASSED] drm_test_cmdline_bpp_extra_and_option
[15:47:00] [PASSED] drm_test_cmdline_extra_and_option
[15:47:00] [PASSED] drm_test_cmdline_freestanding_options
[15:47:00] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[15:47:00] [PASSED] drm_test_cmdline_panel_orientation
[15:47:00] ================ drm_test_cmdline_invalid  =================
[15:47:00] [PASSED] margin_only
[15:47:00] [PASSED] interlace_only
[15:47:00] [PASSED] res_missing_x
[15:47:00] [PASSED] res_missing_y
[15:47:00] [PASSED] res_bad_y
[15:47:00] [PASSED] res_missing_y_bpp
[15:47:00] [PASSED] res_bad_bpp
[15:47:00] [PASSED] res_bad_refresh
[15:47:00] [PASSED] res_bpp_refresh_force_on_off
[15:47:00] [PASSED] res_invalid_mode
[15:47:00] [PASSED] res_bpp_wrong_place_mode
[15:47:00] [PASSED] name_bpp_refresh
[15:47:00] [PASSED] name_refresh
[15:47:00] [PASSED] name_refresh_wrong_mode
[15:47:00] [PASSED] name_refresh_invalid_mode
[15:47:00] [PASSED] rotate_multiple
[15:47:00] [PASSED] rotate_invalid_val
[15:47:00] [PASSED] rotate_truncated
[15:47:00] [PASSED] invalid_option
[15:47:00] [PASSED] invalid_tv_option
[15:47:00] [PASSED] truncated_tv_option
[15:47:00] ============ [PASSED] drm_test_cmdline_invalid =============
[15:47:00] =============== drm_test_cmdline_tv_options  ===============
[15:47:00] [PASSED] NTSC
[15:47:00] [PASSED] NTSC_443
[15:47:00] [PASSED] NTSC_J
[15:47:00] [PASSED] PAL
[15:47:00] [PASSED] PAL_M
[15:47:00] [PASSED] PAL_N
[15:47:00] [PASSED] SECAM
[15:47:00] [PASSED] MONO_525
[15:47:00] [PASSED] MONO_625
[15:47:00] =========== [PASSED] drm_test_cmdline_tv_options ===========
[15:47:00] =============== [PASSED] drm_cmdline_parser ================
[15:47:00] ========== drmm_connector_hdmi_init (19 subtests) ==========
[15:47:00] [PASSED] drm_test_connector_hdmi_init_valid
[15:47:00] [PASSED] drm_test_connector_hdmi_init_bpc_8
[15:47:00] [PASSED] drm_test_connector_hdmi_init_bpc_10
[15:47:00] [PASSED] drm_test_connector_hdmi_init_bpc_12
[15:47:00] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[15:47:00] [PASSED] drm_test_connector_hdmi_init_bpc_null
[15:47:00] [PASSED] drm_test_connector_hdmi_init_formats_empty
[15:47:00] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[15:47:00] [PASSED] drm_test_connector_hdmi_init_null_ddc
[15:47:00] [PASSED] drm_test_connector_hdmi_init_null_product
[15:47:00] [PASSED] drm_test_connector_hdmi_init_null_vendor
[15:47:00] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[15:47:00] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[15:47:00] [PASSED] drm_test_connector_hdmi_init_product_valid
[15:47:00] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[15:47:00] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[15:47:00] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[15:47:00] ========= drm_test_connector_hdmi_init_type_valid  =========
[15:47:00] [PASSED] HDMI-A
[15:47:00] [PASSED] HDMI-B
[15:47:00] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[15:47:00] ======== drm_test_connector_hdmi_init_type_invalid  ========
[15:47:00] [PASSED] Unknown
[15:47:00] [PASSED] VGA
[15:47:00] [PASSED] DVI-I
[15:47:00] [PASSED] DVI-D
[15:47:00] [PASSED] DVI-A
[15:47:00] [PASSED] Composite
[15:47:00] [PASSED] SVIDEO
[15:47:00] [PASSED] LVDS
[15:47:00] [PASSED] Component
[15:47:00] [PASSED] DIN
[15:47:00] [PASSED] DP
[15:47:00] [PASSED] TV
[15:47:00] [PASSED] eDP
[15:47:00] [PASSED] Virtual
[15:47:00] [PASSED] DSI
[15:47:00] [PASSED] DPI
[15:47:00] [PASSED] Writeback
[15:47:00] [PASSED] SPI
[15:47:00] [PASSED] USB
[15:47:00] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[15:47:00] ============ [PASSED] drmm_connector_hdmi_init =============
[15:47:00] ============= drmm_connector_init (3 subtests) =============
[15:47:00] [PASSED] drm_test_drmm_connector_init
[15:47:00] [PASSED] drm_test_drmm_connector_init_null_ddc
[15:47:00] ========= drm_test_drmm_connector_init_type_valid  =========
[15:47:00] [PASSED] Unknown
[15:47:00] [PASSED] VGA
[15:47:00] [PASSED] DVI-I
[15:47:00] [PASSED] DVI-D
[15:47:00] [PASSED] DVI-A
[15:47:00] [PASSED] Composite
[15:47:00] [PASSED] SVIDEO
[15:47:00] [PASSED] LVDS
[15:47:00] [PASSED] Component
[15:47:00] [PASSED] DIN
[15:47:00] [PASSED] DP
[15:47:00] [PASSED] HDMI-A
[15:47:00] [PASSED] HDMI-B
[15:47:00] [PASSED] TV
[15:47:00] [PASSED] eDP
[15:47:00] [PASSED] Virtual
[15:47:00] [PASSED] DSI
[15:47:00] [PASSED] DPI
[15:47:00] [PASSED] Writeback
[15:47:00] [PASSED] SPI
[15:47:00] [PASSED] USB
[15:47:00] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[15:47:00] =============== [PASSED] drmm_connector_init ===============
[15:47:00] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[15:47:00] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[15:47:00] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[15:47:00] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[15:47:00] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[15:47:00] ========== drm_test_get_tv_mode_from_name_valid  ===========
[15:47:00] [PASSED] NTSC
[15:47:00] [PASSED] NTSC-443
[15:47:00] [PASSED] NTSC-J
[15:47:00] [PASSED] PAL
[15:47:00] [PASSED] PAL-M
[15:47:00] [PASSED] PAL-N
[15:47:00] [PASSED] SECAM
[15:47:00] [PASSED] Mono
[15:47:00] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[15:47:00] [PASSED] drm_test_get_tv_mode_from_name_truncated
[15:47:00] ============ [PASSED] drm_get_tv_mode_from_name ============
[15:47:00] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[15:47:00] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[15:47:00] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[15:47:00] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[15:47:00] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[15:47:00] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[15:47:00] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[15:47:00] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[15:47:00] [PASSED] VIC 96
[15:47:00] [PASSED] VIC 97
[15:47:00] [PASSED] VIC 101
[15:47:00] [PASSED] VIC 102
[15:47:00] [PASSED] VIC 106
[15:47:00] [PASSED] VIC 107
[15:47:00] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[15:47:00] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[15:47:00] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[15:47:00] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[15:47:00] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[15:47:00] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[15:47:00] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[15:47:00] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[15:47:00] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[15:47:00] [PASSED] Automatic
[15:47:00] [PASSED] Full
[15:47:00] [PASSED] Limited 16:235
[15:47:00] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[15:47:00] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[15:47:00] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[15:47:00] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[15:47:00] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[15:47:00] [PASSED] RGB
[15:47:00] [PASSED] YUV 4:2:0
[15:47:00] [PASSED] YUV 4:2:2
[15:47:00] [PASSED] YUV 4:4:4
[15:47:00] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[15:47:00] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[15:47:00] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[15:47:00] ============= drm_damage_helper (21 subtests) ==============
[15:47:00] [PASSED] drm_test_damage_iter_no_damage
[15:47:00] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[15:47:00] [PASSED] drm_test_damage_iter_no_damage_src_moved
[15:47:00] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[15:47:00] [PASSED] drm_test_damage_iter_no_damage_not_visible
[15:47:00] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[15:47:00] [PASSED] drm_test_damage_iter_no_damage_no_fb
[15:47:00] [PASSED] drm_test_damage_iter_simple_damage
[15:47:00] [PASSED] drm_test_damage_iter_single_damage
[15:47:00] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[15:47:00] [PASSED] drm_test_damage_iter_single_damage_outside_src
[15:47:00] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[15:47:00] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[15:47:00] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[15:47:00] [PASSED] drm_test_damage_iter_single_damage_src_moved
[15:47:00] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[15:47:00] [PASSED] drm_test_damage_iter_damage
[15:47:00] [PASSED] drm_test_damage_iter_damage_one_intersect
[15:47:00] [PASSED] drm_test_damage_iter_damage_one_outside
[15:47:00] [PASSED] drm_test_damage_iter_damage_src_moved
[15:47:00] [PASSED] drm_test_damage_iter_damage_not_visible
[15:47:00] ================ [PASSED] drm_damage_helper ================
[15:47:00] ============== drm_dp_mst_helper (3 subtests) ==============
[15:47:00] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[15:47:00] [PASSED] Clock 154000 BPP 30 DSC disabled
[15:47:00] [PASSED] Clock 234000 BPP 30 DSC disabled
[15:47:00] [PASSED] Clock 297000 BPP 24 DSC disabled
[15:47:00] [PASSED] Clock 332880 BPP 24 DSC enabled
[15:47:00] [PASSED] Clock 324540 BPP 24 DSC enabled
[15:47:00] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[15:47:00] ============== drm_test_dp_mst_calc_pbn_div  ===============
[15:47:00] [PASSED] Link rate 2000000 lane count 4
[15:47:00] [PASSED] Link rate 2000000 lane count 2
[15:47:00] [PASSED] Link rate 2000000 lane count 1
[15:47:00] [PASSED] Link rate 1350000 lane count 4
[15:47:00] [PASSED] Link rate 1350000 lane count 2
[15:47:00] [PASSED] Link rate 1350000 lane count 1
[15:47:00] [PASSED] Link rate 1000000 lane count 4
[15:47:00] [PASSED] Link rate 1000000 lane count 2
[15:47:00] [PASSED] Link rate 1000000 lane count 1
[15:47:00] [PASSED] Link rate 810000 lane count 4
[15:47:00] [PASSED] Link rate 810000 lane count 2
[15:47:00] [PASSED] Link rate 810000 lane count 1
[15:47:00] [PASSED] Link rate 540000 lane count 4
[15:47:00] [PASSED] Link rate 540000 lane count 2
[15:47:00] [PASSED] Link rate 540000 lane count 1
[15:47:00] [PASSED] Link rate 270000 lane count 4
[15:47:00] [PASSED] Link rate 270000 lane count 2
[15:47:00] [PASSED] Link rate 270000 lane count 1
[15:47:00] [PASSED] Link rate 162000 lane count 4
[15:47:00] [PASSED] Link rate 162000 lane count 2
[15:47:00] [PASSED] Link rate 162000 lane count 1
[15:47:00] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[15:47:00] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[15:47:00] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[15:47:00] [PASSED] DP_POWER_UP_PHY with port number
[15:47:00] [PASSED] DP_POWER_DOWN_PHY with port number
[15:47:00] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[15:47:00] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[15:47:00] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[15:47:00] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[15:47:00] [PASSED] DP_QUERY_PAYLOAD with port number
[15:47:00] [PASSED] DP_QUERY_PAYLOAD with VCPI
[15:47:00] [PASSED] DP_REMOTE_DPCD_READ with port number
[15:47:00] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[15:47:00] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[15:47:00] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[15:47:00] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[15:47:00] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[15:47:00] [PASSED] DP_REMOTE_I2C_READ with port number
[15:47:00] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[15:47:00] [PASSED] DP_REMOTE_I2C_READ with transactions array
[15:47:00] [PASSED] DP_REMOTE_I2C_WRITE with port number
[15:47:00] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[15:47:00] [PASSED] DP_REMOTE_I2C_WRITE with data array
[15:47:00] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[15:47:00] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[15:47:00] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[15:47:00] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[15:47:00] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[15:47:00] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[15:47:00] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[15:47:00] ================ [PASSED] drm_dp_mst_helper ================
[15:47:00] ================== drm_exec (7 subtests) ===================
[15:47:00] [PASSED] sanitycheck
[15:47:00] [PASSED] test_lock
[15:47:00] [PASSED] test_lock_unlock
[15:47:00] [PASSED] test_duplicates
[15:47:00] [PASSED] test_prepare
[15:47:00] [PASSED] test_prepare_array
[15:47:00] [PASSED] test_multiple_loops
[15:47:00] ==================== [PASSED] drm_exec =====================
[15:47:00] =========== drm_format_helper_test (17 subtests) ===========
[15:47:00] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[15:47:00] [PASSED] single_pixel_source_buffer
[15:47:00] [PASSED] single_pixel_clip_rectangle
[15:47:00] [PASSED] well_known_colors
[15:47:00] [PASSED] destination_pitch
[15:47:00] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[15:47:00] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[15:47:00] [PASSED] single_pixel_source_buffer
[15:47:00] [PASSED] single_pixel_clip_rectangle
[15:47:00] [PASSED] well_known_colors
[15:47:00] [PASSED] destination_pitch
[15:47:00] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[15:47:00] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[15:47:00] [PASSED] single_pixel_source_buffer
[15:47:00] [PASSED] single_pixel_clip_rectangle
[15:47:00] [PASSED] well_known_colors
[15:47:00] [PASSED] destination_pitch
[15:47:00] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[15:47:00] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[15:47:00] [PASSED] single_pixel_source_buffer
[15:47:00] [PASSED] single_pixel_clip_rectangle
[15:47:00] [PASSED] well_known_colors
[15:47:00] [PASSED] destination_pitch
[15:47:00] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[15:47:00] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[15:47:00] [PASSED] single_pixel_source_buffer
[15:47:00] [PASSED] single_pixel_clip_rectangle
[15:47:00] [PASSED] well_known_colors
[15:47:00] [PASSED] destination_pitch
[15:47:00] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[15:47:00] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[15:47:00] [PASSED] single_pixel_source_buffer
[15:47:00] [PASSED] single_pixel_clip_rectangle
[15:47:00] [PASSED] well_known_colors
[15:47:00] [PASSED] destination_pitch
[15:47:00] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[15:47:00] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[15:47:00] [PASSED] single_pixel_source_buffer
[15:47:00] [PASSED] single_pixel_clip_rectangle
[15:47:00] [PASSED] well_known_colors
[15:47:00] [PASSED] destination_pitch
[15:47:00] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[15:47:00] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[15:47:00] [PASSED] single_pixel_source_buffer
[15:47:00] [PASSED] single_pixel_clip_rectangle
[15:47:00] [PASSED] well_known_colors
[15:47:00] [PASSED] destination_pitch
[15:47:00] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[15:47:00] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[15:47:00] [PASSED] single_pixel_source_buffer
[15:47:00] [PASSED] single_pixel_clip_rectangle
[15:47:00] [PASSED] well_known_colors
[15:47:00] [PASSED] destination_pitch
[15:47:00] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[15:47:00] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[15:47:00] [PASSED] single_pixel_source_buffer
[15:47:00] [PASSED] single_pixel_clip_rectangle
[15:47:00] [PASSED] well_known_colors
[15:47:00] [PASSED] destination_pitch
[15:47:00] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[15:47:00] ============== drm_test_fb_xrgb8888_to_mono  ===============
[15:47:00] [PASSED] single_pixel_source_buffer
[15:47:00] [PASSED] single_pixel_clip_rectangle
[15:47:00] [PASSED] well_known_colors
[15:47:00] [PASSED] destination_pitch
[15:47:00] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[15:47:00] ==================== drm_test_fb_swab  =====================
[15:47:00] [PASSED] single_pixel_source_buffer
[15:47:00] [PASSED] single_pixel_clip_rectangle
[15:47:00] [PASSED] well_known_colors
[15:47:00] [PASSED] destination_pitch
[15:47:00] ================ [PASSED] drm_test_fb_swab =================
[15:47:00] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[15:47:00] [PASSED] single_pixel_source_buffer
[15:47:00] [PASSED] single_pixel_clip_rectangle
[15:47:00] [PASSED] well_known_colors
[15:47:00] [PASSED] destination_pitch
[15:47:00] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[15:47:00] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[15:47:00] [PASSED] single_pixel_source_buffer
[15:47:00] [PASSED] single_pixel_clip_rectangle
[15:47:00] [PASSED] well_known_colors
[15:47:00] [PASSED] destination_pitch
[15:47:00] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[15:47:00] ================= drm_test_fb_clip_offset  =================
[15:47:00] [PASSED] pass through
[15:47:00] [PASSED] horizontal offset
[15:47:00] [PASSED] vertical offset
[15:47:00] [PASSED] horizontal and vertical offset
[15:47:00] [PASSED] horizontal offset (custom pitch)
[15:47:00] [PASSED] vertical offset (custom pitch)
[15:47:00] [PASSED] horizontal and vertical offset (custom pitch)
[15:47:00] ============= [PASSED] drm_test_fb_clip_offset =============
[15:47:00] ============== drm_test_fb_build_fourcc_list  ==============
[15:47:00] [PASSED] no native formats
[15:47:00] [PASSED] XRGB8888 as native format
[15:47:00] [PASSED] remove duplicates
[15:47:00] [PASSED] convert alpha formats
[15:47:00] [PASSED] random formats
[15:47:00] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[15:47:00] =================== drm_test_fb_memcpy  ====================
[15:47:00] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[15:47:00] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[15:47:00] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[15:47:00] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[15:47:00] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[15:47:00] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[15:47:00] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[15:47:00] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[15:47:00] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[15:47:00] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[15:47:00] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[15:47:00] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[15:47:00] =============== [PASSED] drm_test_fb_memcpy ================
[15:47:00] ============= [PASSED] drm_format_helper_test ==============
[15:47:00] ================= drm_format (18 subtests) =================
[15:47:00] [PASSED] drm_test_format_block_width_invalid
[15:47:00] [PASSED] drm_test_format_block_width_one_plane
[15:47:00] [PASSED] drm_test_format_block_width_two_plane
[15:47:00] [PASSED] drm_test_format_block_width_three_plane
[15:47:00] [PASSED] drm_test_format_block_width_tiled
[15:47:00] [PASSED] drm_test_format_block_height_invalid
[15:47:00] [PASSED] drm_test_format_block_height_one_plane
[15:47:00] [PASSED] drm_test_format_block_height_two_plane
[15:47:00] [PASSED] drm_test_format_block_height_three_plane
[15:47:00] [PASSED] drm_test_format_block_height_tiled
[15:47:00] [PASSED] drm_test_format_min_pitch_invalid
[15:47:00] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[15:47:00] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[15:47:00] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[15:47:00] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[15:47:00] [PASSED] drm_test_format_min_pitch_two_plane
[15:47:00] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[15:47:00] [PASSED] drm_test_format_min_pitch_tiled
[15:47:00] =================== [PASSED] drm_format ====================
[15:47:00] =============== drm_framebuffer (1 subtest) ================
[15:47:00] =============== drm_test_framebuffer_create  ===============
[15:47:00] [PASSED] ABGR8888 normal sizes
[15:47:00] [PASSED] ABGR8888 max sizes
[15:47:00] [PASSED] ABGR8888 pitch greater than min required
[15:47:00] [PASSED] ABGR8888 pitch less than min required
[15:47:00] [PASSED] ABGR8888 Invalid width
[15:47:00] [PASSED] ABGR8888 Invalid buffer handle
[15:47:00] [PASSED] No pixel format
[15:47:00] [PASSED] ABGR8888 Width 0
[15:47:00] [PASSED] ABGR8888 Height 0
[15:47:00] [PASSED] ABGR8888 Out of bound height * pitch combination
[15:47:00] [PASSED] ABGR8888 Large buffer offset
[15:47:00] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[15:47:00] [PASSED] ABGR8888 Valid buffer modifier
[15:47:00] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[15:47:00] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[15:47:00] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[15:47:00] [PASSED] NV12 Normal sizes
[15:47:00] [PASSED] NV12 Max sizes
[15:47:00] [PASSED] NV12 Invalid pitch
[15:47:00] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[15:47:00] [PASSED] NV12 different  modifier per-plane
[15:47:00] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[15:47:00] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[15:47:00] [PASSED] NV12 Modifier for inexistent plane
[15:47:00] [PASSED] NV12 Handle for inexistent plane
[15:47:00] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[15:47:00] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[15:47:00] [PASSED] YVU420 Normal sizes
[15:47:00] [PASSED] YVU420 Max sizes
[15:47:00] [PASSED] YVU420 Invalid pitch
[15:47:00] [PASSED] YVU420 Different pitches
[15:47:00] [PASSED] YVU420 Different buffer offsets/pitches
[15:47:00] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[15:47:00] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[15:47:00] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[15:47:00] [PASSED] YVU420 Valid modifier
[15:47:00] [PASSED] YVU420 Different modifiers per plane
[15:47:00] [PASSED] YVU420 Modifier for inexistent plane
[15:47:00] [PASSED] X0L2 Normal sizes
[15:47:00] [PASSED] X0L2 Max sizes
[15:47:00] [PASSED] X0L2 Invalid pitch
[15:47:00] [PASSED] X0L2 Pitch greater than minimum required
[15:47:00] [PASSED] X0L2 Handle for inexistent plane
[15:47:00] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[15:47:00] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[15:47:00] [PASSED] X0L2 Valid modifier
[15:47:00] [PASSED] X0L2 Modifier for inexistent plane
[15:47:00] =========== [PASSED] drm_test_framebuffer_create ===========
[15:47:00] ================= [PASSED] drm_framebuffer =================
[15:47:00] ================ drm_gem_shmem (8 subtests) ================
[15:47:00] [PASSED] drm_gem_shmem_test_obj_create
[15:47:00] [PASSED] drm_gem_shmem_test_obj_create_private
[15:47:00] [PASSED] drm_gem_shmem_test_pin_pages
[15:47:00] [PASSED] drm_gem_shmem_test_vmap
[15:47:00] [PASSED] drm_gem_shmem_test_get_pages_sgt
[15:47:00] [PASSED] drm_gem_shmem_test_get_sg_table
[15:47:00] [PASSED] drm_gem_shmem_test_madvise
[15:47:00] [PASSED] drm_gem_shmem_test_purge
[15:47:00] ================== [PASSED] drm_gem_shmem ==================
[15:47:00] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[15:47:00] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[15:47:00] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[15:47:00] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[15:47:00] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[15:47:00] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[15:47:00] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[15:47:00] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[15:47:00] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[15:47:00] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[15:47:00] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[15:47:00] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[15:47:00] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[15:47:00] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[15:47:00] [PASSED] drm_test_check_output_bpc_dvi
[15:47:00] [PASSED] drm_test_check_output_bpc_format_vic_1
[15:47:00] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[15:47:00] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[15:47:00] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[15:47:00] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[15:47:00] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[15:47:00] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[15:47:00] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[15:47:00] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[15:47:00] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[15:47:00] [PASSED] drm_test_check_broadcast_rgb_value
[15:47:00] [PASSED] drm_test_check_bpc_8_value
[15:47:00] [PASSED] drm_test_check_bpc_10_value
[15:47:00] [PASSED] drm_test_check_bpc_12_value
[15:47:00] [PASSED] drm_test_check_format_value
[15:47:00] [PASSED] drm_test_check_tmds_char_value
[15:47:00] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[15:47:00] ================= drm_managed (2 subtests) =================
[15:47:00] [PASSED] drm_test_managed_release_action
[15:47:00] [PASSED] drm_test_managed_run_action
[15:47:00] =================== [PASSED] drm_managed ===================
[15:47:00] =================== drm_mm (6 subtests) ====================
[15:47:00] [PASSED] drm_test_mm_init
[15:47:00] [PASSED] drm_test_mm_debug
[15:47:00] [PASSED] drm_test_mm_align32
[15:47:00] [PASSED] drm_test_mm_align64
[15:47:00] [PASSED] drm_test_mm_lowest
[15:47:00] [PASSED] drm_test_mm_highest
[15:47:00] ===================== [PASSED] drm_mm ======================
[15:47:00] ============= drm_modes_analog_tv (5 subtests) =============
[15:47:00] [PASSED] drm_test_modes_analog_tv_mono_576i
[15:47:00] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[15:47:00] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[15:47:00] [PASSED] drm_test_modes_analog_tv_pal_576i
[15:47:00] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[15:47:00] =============== [PASSED] drm_modes_analog_tv ===============
[15:47:00] ============== drm_plane_helper (2 subtests) ===============
[15:47:00] =============== drm_test_check_plane_state  ================
[15:47:00] [PASSED] clipping_simple
[15:47:00] [PASSED] clipping_rotate_reflect
[15:47:00] [PASSED] positioning_simple
[15:47:00] [PASSED] upscaling
[15:47:00] [PASSED] downscaling
[15:47:00] [PASSED] rounding1
[15:47:00] [PASSED] rounding2
[15:47:00] [PASSED] rounding3
[15:47:00] [PASSED] rounding4
[15:47:00] =========== [PASSED] drm_test_check_plane_state ============
[15:47:00] =========== drm_test_check_invalid_plane_state  ============
[15:47:00] [PASSED] positioning_invalid
[15:47:00] [PASSED] upscaling_invalid
stty: 'standard input': Inappropriate ioctl for device
[15:47:00] [PASSED] downscaling_invalid
[15:47:00] ======= [PASSED] drm_test_check_invalid_plane_state ========
[15:47:00] ================ [PASSED] drm_plane_helper =================
[15:47:00] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[15:47:00] ====== drm_test_connector_helper_tv_get_modes_check  =======
[15:47:00] [PASSED] None
[15:47:00] [PASSED] PAL
[15:47:00] [PASSED] NTSC
[15:47:00] [PASSED] Both, NTSC Default
[15:47:00] [PASSED] Both, PAL Default
[15:47:00] [PASSED] Both, NTSC Default, with PAL on command-line
[15:47:00] [PASSED] Both, PAL Default, with NTSC on command-line
[15:47:00] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[15:47:00] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[15:47:00] ================== drm_rect (9 subtests) ===================
[15:47:00] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[15:47:00] [PASSED] drm_test_rect_clip_scaled_not_clipped
[15:47:00] [PASSED] drm_test_rect_clip_scaled_clipped
[15:47:00] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[15:47:00] ================= drm_test_rect_intersect  =================
[15:47:00] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[15:47:00] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[15:47:00] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[15:47:00] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[15:47:00] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[15:47:00] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[15:47:00] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[15:47:00] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[15:47:00] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[15:47:00] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[15:47:00] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[15:47:00] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[15:47:00] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[15:47:00] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[15:47:00] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[15:47:00] ============= [PASSED] drm_test_rect_intersect =============
[15:47:00] ================ drm_test_rect_calc_hscale  ================
[15:47:00] [PASSED] normal use
[15:47:00] [PASSED] out of max range
[15:47:00] [PASSED] out of min range
[15:47:00] [PASSED] zero dst
[15:47:00] [PASSED] negative src
[15:47:00] [PASSED] negative dst
[15:47:00] ============ [PASSED] drm_test_rect_calc_hscale ============
[15:47:00] ================ drm_test_rect_calc_vscale  ================
[15:47:00] [PASSED] normal use
[15:47:00] [PASSED] out of max range
[15:47:00] [PASSED] out of min range
[15:47:00] [PASSED] zero dst
[15:47:00] [PASSED] negative src
[15:47:00] [PASSED] negative dst
[15:47:00] ============ [PASSED] drm_test_rect_calc_vscale ============
[15:47:00] ================== drm_test_rect_rotate  ===================
[15:47:00] [PASSED] reflect-x
[15:47:00] [PASSED] reflect-y
[15:47:00] [PASSED] rotate-0
[15:47:00] [PASSED] rotate-90
[15:47:00] [PASSED] rotate-180
[15:47:00] [PASSED] rotate-270
[15:47:00] ============== [PASSED] drm_test_rect_rotate ===============
[15:47:00] ================ drm_test_rect_rotate_inv  =================
[15:47:00] [PASSED] reflect-x
[15:47:00] [PASSED] reflect-y
[15:47:00] [PASSED] rotate-0
[15:47:00] [PASSED] rotate-90
[15:47:00] [PASSED] rotate-180
[15:47:00] [PASSED] rotate-270
[15:47:00] ============ [PASSED] drm_test_rect_rotate_inv =============
[15:47:00] ==================== [PASSED] drm_rect =====================
[15:47:00] ============================================================
[15:47:00] Testing complete. Ran 515 tests: passed: 515
[15:47:00] Elapsed time: 23.503s total, 1.736s configuring, 21.539s building, 0.204s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[15:47:00] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:47:02] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[15:47:11] Starting KUnit Kernel (1/1)...
[15:47:11] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[15:47:11] ================= ttm_device (5 subtests) ==================
[15:47:11] [PASSED] ttm_device_init_basic
[15:47:11] [PASSED] ttm_device_init_multiple
[15:47:11] [PASSED] ttm_device_fini_basic
[15:47:11] [PASSED] ttm_device_init_no_vma_man
[15:47:11] ================== ttm_device_init_pools  ==================
[15:47:11] [PASSED] No DMA allocations, no DMA32 required
[15:47:11] [PASSED] DMA allocations, DMA32 required
[15:47:11] [PASSED] No DMA allocations, DMA32 required
[15:47:11] [PASSED] DMA allocations, no DMA32 required
[15:47:11] ============== [PASSED] ttm_device_init_pools ==============
[15:47:11] =================== [PASSED] ttm_device ====================
[15:47:11] ================== ttm_pool (8 subtests) ===================
[15:47:11] ================== ttm_pool_alloc_basic  ===================
[15:47:11] [PASSED] One page
[15:47:11] [PASSED] More than one page
[15:47:11] [PASSED] Above the allocation limit
[15:47:11] [PASSED] One page, with coherent DMA mappings enabled
[15:47:11] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[15:47:11] ============== [PASSED] ttm_pool_alloc_basic ===============
[15:47:11] ============== ttm_pool_alloc_basic_dma_addr  ==============
[15:47:11] [PASSED] One page
[15:47:11] [PASSED] More than one page
[15:47:11] [PASSED] Above the allocation limit
[15:47:11] [PASSED] One page, with coherent DMA mappings enabled
[15:47:11] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[15:47:11] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[15:47:11] [PASSED] ttm_pool_alloc_order_caching_match
[15:47:11] [PASSED] ttm_pool_alloc_caching_mismatch
[15:47:11] [PASSED] ttm_pool_alloc_order_mismatch
[15:47:11] [PASSED] ttm_pool_free_dma_alloc
[15:47:11] [PASSED] ttm_pool_free_no_dma_alloc
[15:47:11] [PASSED] ttm_pool_fini_basic
[15:47:11] ==================== [PASSED] ttm_pool =====================
[15:47:11] ================ ttm_resource (8 subtests) =================
[15:47:11] ================= ttm_resource_init_basic  =================
[15:47:11] [PASSED] Init resource in TTM_PL_SYSTEM
[15:47:11] [PASSED] Init resource in TTM_PL_VRAM
[15:47:11] [PASSED] Init resource in a private placement
[15:47:11] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[15:47:11] ============= [PASSED] ttm_resource_init_basic =============
[15:47:11] [PASSED] ttm_resource_init_pinned
[15:47:11] [PASSED] ttm_resource_fini_basic
[15:47:11] [PASSED] ttm_resource_manager_init_basic
[15:47:11] [PASSED] ttm_resource_manager_usage_basic
[15:47:11] [PASSED] ttm_resource_manager_set_used_basic
[15:47:11] [PASSED] ttm_sys_man_alloc_basic
[15:47:11] [PASSED] ttm_sys_man_free_basic
[15:47:11] ================== [PASSED] ttm_resource ===================
[15:47:11] =================== ttm_tt (15 subtests) ===================
[15:47:11] ==================== ttm_tt_init_basic  ====================
[15:47:11] [PASSED] Page-aligned size
[15:47:11] [PASSED] Extra pages requested
[15:47:11] ================ [PASSED] ttm_tt_init_basic ================
[15:47:11] [PASSED] ttm_tt_init_misaligned
[15:47:11] [PASSED] ttm_tt_fini_basic
[15:47:11] [PASSED] ttm_tt_fini_sg
[15:47:11] [PASSED] ttm_tt_fini_shmem
[15:47:11] [PASSED] ttm_tt_create_basic
[15:47:11] [PASSED] ttm_tt_create_invalid_bo_type
[15:47:11] [PASSED] ttm_tt_create_ttm_exists
[15:47:11] [PASSED] ttm_tt_create_failed
[15:47:11] [PASSED] ttm_tt_destroy_basic
[15:47:11] [PASSED] ttm_tt_populate_null_ttm
[15:47:11] [PASSED] ttm_tt_populate_populated_ttm
[15:47:11] [PASSED] ttm_tt_unpopulate_basic
[15:47:11] [PASSED] ttm_tt_unpopulate_empty_ttm
[15:47:11] [PASSED] ttm_tt_swapin_basic
[15:47:11] ===================== [PASSED] ttm_tt ======================
[15:47:11] =================== ttm_bo (14 subtests) ===================
[15:47:11] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[15:47:11] [PASSED] Cannot be interrupted and sleeps
[15:47:11] [PASSED] Cannot be interrupted, locks straight away
[15:47:11] [PASSED] Can be interrupted, sleeps
[15:47:11] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[15:47:11] [PASSED] ttm_bo_reserve_locked_no_sleep
[15:47:11] [PASSED] ttm_bo_reserve_no_wait_ticket
[15:47:11] [PASSED] ttm_bo_reserve_double_resv
[15:47:11] [PASSED] ttm_bo_reserve_interrupted
[15:47:11] [PASSED] ttm_bo_reserve_deadlock
[15:47:11] [PASSED] ttm_bo_unreserve_basic
[15:47:11] [PASSED] ttm_bo_unreserve_pinned
[15:47:11] [PASSED] ttm_bo_unreserve_bulk
[15:47:11] [PASSED] ttm_bo_put_basic
[15:47:11] [PASSED] ttm_bo_put_shared_resv
[15:47:11] [PASSED] ttm_bo_pin_basic
[15:47:11] [PASSED] ttm_bo_pin_unpin_resource
[15:47:11] [PASSED] ttm_bo_multiple_pin_one_unpin
[15:47:11] ===================== [PASSED] ttm_bo ======================
[15:47:11] ============== ttm_bo_validate (22 subtests) ===============
[15:47:11] ============== ttm_bo_init_reserved_sys_man  ===============
[15:47:11] [PASSED] Buffer object for userspace
[15:47:11] [PASSED] Kernel buffer object
[15:47:11] [PASSED] Shared buffer object
[15:47:11] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[15:47:11] ============== ttm_bo_init_reserved_mock_man  ==============
[15:47:11] [PASSED] Buffer object for userspace
[15:47:11] [PASSED] Kernel buffer object
[15:47:11] [PASSED] Shared buffer object
[15:47:11] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[15:47:11] [PASSED] ttm_bo_init_reserved_resv
[15:47:11] ================== ttm_bo_validate_basic  ==================
[15:47:11] [PASSED] Buffer object for userspace
[15:47:11] [PASSED] Kernel buffer object
[15:47:11] [PASSED] Shared buffer object
[15:47:11] ============== [PASSED] ttm_bo_validate_basic ==============
[15:47:11] [PASSED] ttm_bo_validate_invalid_placement
[15:47:11] ============= ttm_bo_validate_same_placement  ==============
[15:47:11] [PASSED] System manager
[15:47:11] [PASSED] VRAM manager
[15:47:11] ========= [PASSED] ttm_bo_validate_same_placement ==========
[15:47:11] [PASSED] ttm_bo_validate_failed_alloc
[15:47:11] [PASSED] ttm_bo_validate_pinned
[15:47:11] [PASSED] ttm_bo_validate_busy_placement
[15:47:11] ================ ttm_bo_validate_multihop  =================
[15:47:11] [PASSED] Buffer object for userspace
[15:47:11] [PASSED] Kernel buffer object
[15:47:11] [PASSED] Shared buffer object
[15:47:11] ============ [PASSED] ttm_bo_validate_multihop =============
[15:47:11] ========== ttm_bo_validate_no_placement_signaled  ==========
[15:47:11] [PASSED] Buffer object in system domain, no page vector
[15:47:11] [PASSED] Buffer object in system domain with an existing page vector
[15:47:11] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[15:47:11] ======== ttm_bo_validate_no_placement_not_signaled  ========
[15:47:11] [PASSED] Buffer object for userspace
[15:47:11] [PASSED] Kernel buffer object
[15:47:11] [PASSED] Shared buffer object
[15:47:11] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[15:47:11] [PASSED] ttm_bo_validate_move_fence_signaled
[15:47:11] ========= ttm_bo_validate_move_fence_not_signaled  =========
[15:47:11] [PASSED] Waits for GPU
[15:47:11] [PASSED] Tries to lock straight away
[15:47:12] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[15:47:12] [PASSED] ttm_bo_validate_swapout
[15:47:12] [PASSED] ttm_bo_validate_happy_evict
[15:47:12] [PASSED] ttm_bo_validate_all_pinned_evict
[15:47:12] [PASSED] ttm_bo_validate_allowed_only_evict
[15:47:12] [PASSED] ttm_bo_validate_deleted_evict
[15:47:12] [PASSED] ttm_bo_validate_busy_domain_evict
[15:47:12] [PASSED] ttm_bo_validate_evict_gutting
[15:47:12] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[15:47:12] ================= [PASSED] ttm_bo_validate =================
[15:47:12] ============================================================
[15:47:12] Testing complete. Ran 102 tests: passed: 102
[15:47:12] Elapsed time: 11.138s total, 1.718s configuring, 8.799s building, 0.517s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


