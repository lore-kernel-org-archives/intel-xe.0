Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5250DD29FA5
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 00:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFCB10E03C;
	Thu,  7 Nov 2024 00:39:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F51D10E03C;
 Thu,  7 Nov 2024 00:39:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Take_job_list_lock_i?=
 =?utf-8?q?n_xe=5Fsched=5Ffirst=5Fpending=5Fjob_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Nov 2024 00:39:55 -0000
Message-ID: <173093999551.1419545.14500032222806877160@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241105160327.2970277-1-nirmoy.das@intel.com>
In-Reply-To: <20241105160327.2970277-1-nirmoy.das@intel.com>
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

Series: drm/xe: Take job list lock in xe_sched_first_pending_job (rev2)
URL   : https://patchwork.freedesktop.org/series/140957/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[00:38:45] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:38:49] Building KUnit Kernel ...
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

[00:39:17] Starting KUnit Kernel (1/1)...
[00:39:17] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[00:39:17] =================== guc_dbm (7 subtests) ===================
[00:39:17] [PASSED] test_empty
[00:39:17] [PASSED] test_default
[00:39:17] ======================== test_size  ========================
[00:39:17] [PASSED] 4
[00:39:17] [PASSED] 8
[00:39:17] [PASSED] 32
[00:39:17] [PASSED] 256
[00:39:17] ==================== [PASSED] test_size ====================
[00:39:17] ======================= test_reuse  ========================
[00:39:17] [PASSED] 4
[00:39:17] [PASSED] 8
[00:39:17] [PASSED] 32
[00:39:17] [PASSED] 256
[00:39:17] =================== [PASSED] test_reuse ====================
[00:39:17] =================== test_range_overlap  ====================
[00:39:17] [PASSED] 4
[00:39:17] [PASSED] 8
[00:39:17] [PASSED] 32
[00:39:17] [PASSED] 256
[00:39:17] =============== [PASSED] test_range_overlap ================
[00:39:17] =================== test_range_compact  ====================
[00:39:17] [PASSED] 4
[00:39:17] [PASSED] 8
[00:39:17] [PASSED] 32
[00:39:17] [PASSED] 256
[00:39:17] =============== [PASSED] test_range_compact ================
[00:39:17] ==================== test_range_spare  =====================
[00:39:17] [PASSED] 4
[00:39:17] [PASSED] 8
[00:39:17] [PASSED] 32
[00:39:17] [PASSED] 256
[00:39:17] ================ [PASSED] test_range_spare =================
[00:39:17] ===================== [PASSED] guc_dbm =====================
[00:39:17] =================== guc_idm (6 subtests) ===================
[00:39:17] [PASSED] bad_init
[00:39:17] [PASSED] no_init
[00:39:17] [PASSED] init_fini
[00:39:17] [PASSED] check_used
[00:39:17] [PASSED] check_quota
[00:39:17] [PASSED] check_all
[00:39:17] ===================== [PASSED] guc_idm =====================
[00:39:17] ================== no_relay (3 subtests) ===================
[00:39:17] [PASSED] xe_drops_guc2pf_if_not_ready
[00:39:17] [PASSED] xe_drops_guc2vf_if_not_ready
[00:39:17] [PASSED] xe_rejects_send_if_not_ready
[00:39:17] ==================== [PASSED] no_relay =====================
[00:39:17] ================== pf_relay (14 subtests) ==================
[00:39:17] [PASSED] pf_rejects_guc2pf_too_short
[00:39:17] [PASSED] pf_rejects_guc2pf_too_long
[00:39:17] [PASSED] pf_rejects_guc2pf_no_payload
[00:39:17] [PASSED] pf_fails_no_payload
[00:39:17] [PASSED] pf_fails_bad_origin
[00:39:17] [PASSED] pf_fails_bad_type
[00:39:17] [PASSED] pf_txn_reports_error
[00:39:17] [PASSED] pf_txn_sends_pf2guc
[00:39:17] [PASSED] pf_sends_pf2guc
[00:39:17] [SKIPPED] pf_loopback_nop
[00:39:17] [SKIPPED] pf_loopback_echo
[00:39:17] [SKIPPED] pf_loopback_fail
[00:39:17] [SKIPPED] pf_loopback_busy
[00:39:17] [SKIPPED] pf_loopback_retry
[00:39:17] ==================== [PASSED] pf_relay =====================
[00:39:17] ================== vf_relay (3 subtests) ===================
[00:39:17] [PASSED] vf_rejects_guc2vf_too_short
[00:39:17] [PASSED] vf_rejects_guc2vf_too_long
[00:39:17] [PASSED] vf_rejects_guc2vf_no_payload
[00:39:17] ==================== [PASSED] vf_relay =====================
[00:39:17] ================= pf_service (11 subtests) =================
[00:39:17] [PASSED] pf_negotiate_any
[00:39:17] [PASSED] pf_negotiate_base_match
[00:39:17] [PASSED] pf_negotiate_base_newer
[00:39:17] [PASSED] pf_negotiate_base_next
[00:39:17] [SKIPPED] pf_negotiate_base_older
[00:39:17] [PASSED] pf_negotiate_base_prev
[00:39:17] [PASSED] pf_negotiate_latest_match
[00:39:17] [PASSED] pf_negotiate_latest_newer
[00:39:17] [PASSED] pf_negotiate_latest_next
[00:39:17] [SKIPPED] pf_negotiate_latest_older
[00:39:18] [SKIPPED] pf_negotiate_latest_prev
[00:39:18] =================== [PASSED] pf_service ====================
[00:39:18] ===================== lmtt (1 subtest) =====================
[00:39:18] ======================== test_ops  =========================
[00:39:18] [PASSED] 2-level
[00:39:18] [PASSED] multi-level
[00:39:18] ==================== [PASSED] test_ops =====================
[00:39:18] ====================== [PASSED] lmtt =======================
[00:39:18] =================== xe_mocs (2 subtests) ===================
[00:39:18] ================ xe_live_mocs_kernel_kunit  ================
[00:39:18] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[00:39:18] ================ xe_live_mocs_reset_kunit  =================
[00:39:18] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[00:39:18] ==================== [SKIPPED] xe_mocs =====================
[00:39:18] ================= xe_migrate (2 subtests) ==================
[00:39:18] ================= xe_migrate_sanity_kunit  =================
[00:39:18] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[00:39:18] ================== xe_validate_ccs_kunit  ==================
[00:39:18] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[00:39:18] =================== [SKIPPED] xe_migrate ===================
[00:39:18] ================== xe_dma_buf (1 subtest) ==================
[00:39:18] ==================== xe_dma_buf_kunit  =====================
[00:39:18] ================ [SKIPPED] xe_dma_buf_kunit ================
[00:39:18] =================== [SKIPPED] xe_dma_buf ===================
[00:39:18] ==================== xe_bo (3 subtests) ====================
[00:39:18] ================== xe_ccs_migrate_kunit  ===================
[00:39:18] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[00:39:18] ==================== xe_bo_evict_kunit  ====================
[00:39:18] =============== [SKIPPED] xe_bo_evict_kunit ================
[00:39:18] =================== xe_bo_shrink_kunit  ====================
[00:39:18] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[00:39:18] ===================== [SKIPPED] xe_bo ======================
[00:39:18] ==================== args (11 subtests) ====================
[00:39:18] [PASSED] count_args_test
[00:39:18] [PASSED] call_args_example
[00:39:18] [PASSED] call_args_test
[00:39:18] [PASSED] drop_first_arg_example
[00:39:18] [PASSED] drop_first_arg_test
[00:39:18] [PASSED] first_arg_example
[00:39:18] [PASSED] first_arg_test
[00:39:18] [PASSED] last_arg_example
[00:39:18] [PASSED] last_arg_test
[00:39:18] [PASSED] pick_arg_example
[00:39:18] [PASSED] sep_comma_examplestty: 'standard input': Inappropriate ioctl for device

[00:39:18] ====================== [PASSED] args =======================
[00:39:18] =================== xe_pci (2 subtests) ====================
[00:39:18] [PASSED] xe_gmdid_graphics_ip
[00:39:18] [PASSED] xe_gmdid_media_ip
[00:39:18] ===================== [PASSED] xe_pci ======================
[00:39:18] =================== xe_rtp (2 subtests) ====================
[00:39:18] =============== xe_rtp_process_to_sr_tests  ================
[00:39:18] [PASSED] coalesce-same-reg
[00:39:18] [PASSED] no-match-no-add
[00:39:18] [PASSED] match-or
[00:39:18] [PASSED] match-or-xfail
[00:39:18] [PASSED] no-match-no-add-multiple-rules
[00:39:18] [PASSED] two-regs-two-entries
[00:39:18] [PASSED] clr-one-set-other
[00:39:18] [PASSED] set-field
[00:39:18] [PASSED] conflict-duplicate
[00:39:18] [PASSED] conflict-not-disjoint
[00:39:18] [PASSED] conflict-reg-type
[00:39:18] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[00:39:18] ================== xe_rtp_process_tests  ===================
[00:39:18] [PASSED] active1
[00:39:18] [PASSED] active2
[00:39:18] [PASSED] active-inactive
[00:39:18] [PASSED] inactive-active
[00:39:18] [PASSED] inactive-1st_or_active-inactive
[00:39:18] [PASSED] inactive-2nd_or_active-inactive
[00:39:18] [PASSED] inactive-last_or_active-inactive
[00:39:18] [PASSED] inactive-no_or_active-inactive
[00:39:18] ============== [PASSED] xe_rtp_process_tests ===============
[00:39:18] ===================== [PASSED] xe_rtp ======================
[00:39:18] ==================== xe_wa (1 subtest) =====================
[00:39:18] ======================== xe_wa_gt  =========================
[00:39:18] [PASSED] TIGERLAKE (B0)
[00:39:18] [PASSED] DG1 (A0)
[00:39:18] [PASSED] DG1 (B0)
[00:39:18] [PASSED] ALDERLAKE_S (A0)
[00:39:18] [PASSED] ALDERLAKE_S (B0)
[00:39:18] [PASSED] ALDERLAKE_S (C0)
[00:39:18] [PASSED] ALDERLAKE_S (D0)
[00:39:18] [PASSED] ALDERLAKE_P (A0)
[00:39:18] [PASSED] ALDERLAKE_P (B0)
[00:39:18] [PASSED] ALDERLAKE_P (C0)
[00:39:18] [PASSED] ALDERLAKE_S_RPLS (D0)
[00:39:18] [PASSED] ALDERLAKE_P_RPLU (E0)
[00:39:18] [PASSED] DG2_G10 (C0)
[00:39:18] [PASSED] DG2_G11 (B1)
[00:39:18] [PASSED] DG2_G12 (A1)
[00:39:18] [PASSED] METEORLAKE (g:A0, m:A0)
[00:39:18] [PASSED] METEORLAKE (g:A0, m:A0)
[00:39:18] [PASSED] METEORLAKE (g:A0, m:A0)
[00:39:18] [PASSED] LUNARLAKE (g:A0, m:A0)
[00:39:18] [PASSED] LUNARLAKE (g:B0, m:A0)
[00:39:18] [PASSED] BATTLEMAGE (g:A0, m:A1)
[00:39:18] ==================== [PASSED] xe_wa_gt =====================
[00:39:18] ====================== [PASSED] xe_wa ======================
[00:39:18] ============================================================
[00:39:18] Testing complete. Ran 122 tests: passed: 106, skipped: 16
[00:39:18] Elapsed time: 32.799s total, 4.428s configuring, 28.104s building, 0.221s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[00:39:18] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:39:19] Building KUnit Kernel ...
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

[00:39:42] Starting KUnit Kernel (1/1)...
[00:39:42] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[00:39:42] ================== drm_buddy (7 subtests) ==================
[00:39:42] [PASSED] drm_test_buddy_alloc_limit
[00:39:42] [PASSED] drm_test_buddy_alloc_optimistic
[00:39:42] [PASSED] drm_test_buddy_alloc_pessimistic
[00:39:42] [PASSED] drm_test_buddy_alloc_pathological
[00:39:42] [PASSED] drm_test_buddy_alloc_contiguous
[00:39:42] [PASSED] drm_test_buddy_alloc_clear
[00:39:42] [PASSED] drm_test_buddy_alloc_range_bias
[00:39:42] ==================== [PASSED] drm_buddy ====================
[00:39:42] ============= drm_cmdline_parser (40 subtests) =============
[00:39:42] [PASSED] drm_test_cmdline_force_d_only
[00:39:42] [PASSED] drm_test_cmdline_force_D_only_dvi
[00:39:42] [PASSED] drm_test_cmdline_force_D_only_hdmi
[00:39:42] [PASSED] drm_test_cmdline_force_D_only_not_digital
[00:39:42] [PASSED] drm_test_cmdline_force_e_only
[00:39:42] [PASSED] drm_test_cmdline_res
[00:39:42] [PASSED] drm_test_cmdline_res_vesa
[00:39:42] [PASSED] drm_test_cmdline_res_vesa_rblank
[00:39:42] [PASSED] drm_test_cmdline_res_rblank
[00:39:42] [PASSED] drm_test_cmdline_res_bpp
[00:39:42] [PASSED] drm_test_cmdline_res_refresh
[00:39:42] [PASSED] drm_test_cmdline_res_bpp_refresh
[00:39:42] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[00:39:42] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[00:39:42] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[00:39:42] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[00:39:42] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[00:39:42] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[00:39:42] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[00:39:42] [PASSED] drm_test_cmdline_res_margins_force_on
[00:39:42] [PASSED] drm_test_cmdline_res_vesa_margins
[00:39:42] [PASSED] drm_test_cmdline_name
[00:39:42] [PASSED] drm_test_cmdline_name_bpp
[00:39:42] [PASSED] drm_test_cmdline_name_option
[00:39:42] [PASSED] drm_test_cmdline_name_bpp_option
[00:39:42] [PASSED] drm_test_cmdline_rotate_0
[00:39:42] [PASSED] drm_test_cmdline_rotate_90
[00:39:42] [PASSED] drm_test_cmdline_rotate_180
[00:39:42] [PASSED] drm_test_cmdline_rotate_270
[00:39:42] [PASSED] drm_test_cmdline_hmirror
[00:39:42] [PASSED] drm_test_cmdline_vmirror
[00:39:42] [PASSED] drm_test_cmdline_margin_options
[00:39:42] [PASSED] drm_test_cmdline_multiple_options
[00:39:42] [PASSED] drm_test_cmdline_bpp_extra_and_option
[00:39:42] [PASSED] drm_test_cmdline_extra_and_option
[00:39:42] [PASSED] drm_test_cmdline_freestanding_options
[00:39:42] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[00:39:42] [PASSED] drm_test_cmdline_panel_orientation
[00:39:42] ================ drm_test_cmdline_invalid  =================
[00:39:42] [PASSED] margin_only
[00:39:42] [PASSED] interlace_only
[00:39:42] [PASSED] res_missing_x
[00:39:42] [PASSED] res_missing_y
[00:39:42] [PASSED] res_bad_y
[00:39:42] [PASSED] res_missing_y_bpp
[00:39:42] [PASSED] res_bad_bpp
[00:39:42] [PASSED] res_bad_refresh
[00:39:42] [PASSED] res_bpp_refresh_force_on_off
[00:39:42] [PASSED] res_invalid_mode
[00:39:42] [PASSED] res_bpp_wrong_place_mode
[00:39:42] [PASSED] name_bpp_refresh
[00:39:42] [PASSED] name_refresh
[00:39:42] [PASSED] name_refresh_wrong_mode
[00:39:42] [PASSED] name_refresh_invalid_mode
[00:39:42] [PASSED] rotate_multiple
[00:39:42] [PASSED] rotate_invalid_val
[00:39:42] [PASSED] rotate_truncated
[00:39:42] [PASSED] invalid_option
[00:39:42] [PASSED] invalid_tv_option
[00:39:42] [PASSED] truncated_tv_option
[00:39:42] ============ [PASSED] drm_test_cmdline_invalid =============
[00:39:42] =============== drm_test_cmdline_tv_options  ===============
[00:39:42] [PASSED] NTSC
[00:39:42] [PASSED] NTSC_443
[00:39:42] [PASSED] NTSC_J
[00:39:42] [PASSED] PAL
[00:39:42] [PASSED] PAL_M
[00:39:42] [PASSED] PAL_N
[00:39:42] [PASSED] SECAM
[00:39:42] [PASSED] MONO_525
[00:39:42] [PASSED] MONO_625
[00:39:42] =========== [PASSED] drm_test_cmdline_tv_options ===========
[00:39:42] =============== [PASSED] drm_cmdline_parser ================
[00:39:42] ========== drmm_connector_hdmi_init (19 subtests) ==========
[00:39:42] [PASSED] drm_test_connector_hdmi_init_valid
[00:39:42] [PASSED] drm_test_connector_hdmi_init_bpc_8
[00:39:42] [PASSED] drm_test_connector_hdmi_init_bpc_10
[00:39:42] [PASSED] drm_test_connector_hdmi_init_bpc_12
[00:39:42] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[00:39:42] [PASSED] drm_test_connector_hdmi_init_bpc_null
[00:39:42] [PASSED] drm_test_connector_hdmi_init_formats_empty
[00:39:42] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[00:39:42] [PASSED] drm_test_connector_hdmi_init_null_ddc
[00:39:42] [PASSED] drm_test_connector_hdmi_init_null_product
[00:39:42] [PASSED] drm_test_connector_hdmi_init_null_vendor
[00:39:42] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[00:39:42] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[00:39:42] [PASSED] drm_test_connector_hdmi_init_product_valid
[00:39:42] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[00:39:42] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[00:39:42] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[00:39:42] ========= drm_test_connector_hdmi_init_type_valid  =========
[00:39:42] [PASSED] HDMI-A
[00:39:42] [PASSED] HDMI-B
[00:39:42] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[00:39:42] ======== drm_test_connector_hdmi_init_type_invalid  ========
[00:39:42] [PASSED] Unknown
[00:39:42] [PASSED] VGA
[00:39:42] [PASSED] DVI-I
[00:39:42] [PASSED] DVI-D
[00:39:42] [PASSED] DVI-A
[00:39:42] [PASSED] Composite
[00:39:42] [PASSED] SVIDEO
[00:39:42] [PASSED] LVDS
[00:39:42] [PASSED] Component
[00:39:42] [PASSED] DIN
[00:39:42] [PASSED] DP
[00:39:42] [PASSED] TV
[00:39:42] [PASSED] eDP
[00:39:42] [PASSED] Virtual
[00:39:42] [PASSED] DSI
[00:39:42] [PASSED] DPI
[00:39:42] [PASSED] Writeback
[00:39:42] [PASSED] SPI
[00:39:42] [PASSED] USB
[00:39:42] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[00:39:42] ============ [PASSED] drmm_connector_hdmi_init =============
[00:39:42] ============= drmm_connector_init (3 subtests) =============
[00:39:42] [PASSED] drm_test_drmm_connector_init
[00:39:42] [PASSED] drm_test_drmm_connector_init_null_ddc
[00:39:42] ========= drm_test_drmm_connector_init_type_valid  =========
[00:39:42] [PASSED] Unknown
[00:39:42] [PASSED] VGA
[00:39:42] [PASSED] DVI-I
[00:39:42] [PASSED] DVI-D
[00:39:42] [PASSED] DVI-A
[00:39:42] [PASSED] Composite
[00:39:42] [PASSED] SVIDEO
[00:39:42] [PASSED] LVDS
[00:39:42] [PASSED] Component
[00:39:42] [PASSED] DIN
[00:39:42] [PASSED] DP
[00:39:42] [PASSED] HDMI-A
[00:39:42] [PASSED] HDMI-B
[00:39:42] [PASSED] TV
[00:39:42] [PASSED] eDP
[00:39:42] [PASSED] Virtual
[00:39:42] [PASSED] DSI
[00:39:42] [PASSED] DPI
[00:39:42] [PASSED] Writeback
[00:39:42] [PASSED] SPI
[00:39:42] [PASSED] USB
[00:39:42] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[00:39:42] =============== [PASSED] drmm_connector_init ===============
[00:39:42] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[00:39:42] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[00:39:42] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[00:39:42] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[00:39:42] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[00:39:42] ========== drm_test_get_tv_mode_from_name_valid  ===========
[00:39:42] [PASSED] NTSC
[00:39:42] [PASSED] NTSC-443
[00:39:42] [PASSED] NTSC-J
[00:39:42] [PASSED] PAL
[00:39:42] [PASSED] PAL-M
[00:39:42] [PASSED] PAL-N
[00:39:42] [PASSED] SECAM
[00:39:42] [PASSED] Mono
[00:39:42] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[00:39:42] [PASSED] drm_test_get_tv_mode_from_name_truncated
[00:39:42] ============ [PASSED] drm_get_tv_mode_from_name ============
[00:39:42] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[00:39:42] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[00:39:42] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[00:39:42] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[00:39:42] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[00:39:42] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[00:39:42] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[00:39:42] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[00:39:42] [PASSED] VIC 96
[00:39:42] [PASSED] VIC 97
[00:39:42] [PASSED] VIC 101
[00:39:42] [PASSED] VIC 102
[00:39:42] [PASSED] VIC 106
[00:39:42] [PASSED] VIC 107
[00:39:42] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[00:39:42] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[00:39:42] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[00:39:42] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[00:39:42] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[00:39:42] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[00:39:42] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[00:39:42] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[00:39:42] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[00:39:42] [PASSED] Automatic
[00:39:42] [PASSED] Full
[00:39:42] [PASSED] Limited 16:235
[00:39:42] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[00:39:42] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[00:39:42] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[00:39:42] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[00:39:42] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[00:39:42] [PASSED] RGB
[00:39:42] [PASSED] YUV 4:2:0
[00:39:42] [PASSED] YUV 4:2:2
[00:39:42] [PASSED] YUV 4:4:4
[00:39:42] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[00:39:42] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[00:39:42] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[00:39:42] ============= drm_damage_helper (21 subtests) ==============
[00:39:42] [PASSED] drm_test_damage_iter_no_damage
[00:39:42] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[00:39:42] [PASSED] drm_test_damage_iter_no_damage_src_moved
[00:39:42] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[00:39:42] [PASSED] drm_test_damage_iter_no_damage_not_visible
[00:39:42] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[00:39:42] [PASSED] drm_test_damage_iter_no_damage_no_fb
[00:39:42] [PASSED] drm_test_damage_iter_simple_damage
[00:39:42] [PASSED] drm_test_damage_iter_single_damage
[00:39:42] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[00:39:42] [PASSED] drm_test_damage_iter_single_damage_outside_src
[00:39:42] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[00:39:42] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[00:39:42] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[00:39:42] [PASSED] drm_test_damage_iter_single_damage_src_moved
[00:39:42] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[00:39:42] [PASSED] drm_test_damage_iter_damage
[00:39:42] [PASSED] drm_test_damage_iter_damage_one_intersect
[00:39:42] [PASSED] drm_test_damage_iter_damage_one_outside
[00:39:42] [PASSED] drm_test_damage_iter_damage_src_moved
[00:39:42] [PASSED] drm_test_damage_iter_damage_not_visible
[00:39:42] ================ [PASSED] drm_damage_helper ================
[00:39:42] ============== drm_dp_mst_helper (3 subtests) ==============
[00:39:42] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[00:39:42] [PASSED] Clock 154000 BPP 30 DSC disabled
[00:39:42] [PASSED] Clock 234000 BPP 30 DSC disabled
[00:39:42] [PASSED] Clock 297000 BPP 24 DSC disabled
[00:39:42] [PASSED] Clock 332880 BPP 24 DSC enabled
[00:39:42] [PASSED] Clock 324540 BPP 24 DSC enabled
[00:39:42] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[00:39:42] ============== drm_test_dp_mst_calc_pbn_div  ===============
[00:39:42] [PASSED] Link rate 2000000 lane count 4
[00:39:42] [PASSED] Link rate 2000000 lane count 2
[00:39:42] [PASSED] Link rate 2000000 lane count 1
[00:39:42] [PASSED] Link rate 1350000 lane count 4
[00:39:42] [PASSED] Link rate 1350000 lane count 2
[00:39:42] [PASSED] Link rate 1350000 lane count 1
[00:39:42] [PASSED] Link rate 1000000 lane count 4
[00:39:42] [PASSED] Link rate 1000000 lane count 2
[00:39:42] [PASSED] Link rate 1000000 lane count 1
[00:39:42] [PASSED] Link rate 810000 lane count 4
[00:39:42] [PASSED] Link rate 810000 lane count 2
[00:39:42] [PASSED] Link rate 810000 lane count 1
[00:39:42] [PASSED] Link rate 540000 lane count 4
[00:39:42] [PASSED] Link rate 540000 lane count 2
[00:39:42] [PASSED] Link rate 540000 lane count 1
[00:39:42] [PASSED] Link rate 270000 lane count 4
[00:39:42] [PASSED] Link rate 270000 lane count 2
[00:39:42] [PASSED] Link rate 270000 lane count 1
[00:39:42] [PASSED] Link rate 162000 lane count 4
[00:39:42] [PASSED] Link rate 162000 lane count 2
[00:39:42] [PASSED] Link rate 162000 lane count 1
[00:39:42] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[00:39:42] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[00:39:42] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[00:39:42] [PASSED] DP_POWER_UP_PHY with port number
[00:39:42] [PASSED] DP_POWER_DOWN_PHY with port number
[00:39:42] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[00:39:42] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[00:39:42] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[00:39:42] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[00:39:42] [PASSED] DP_QUERY_PAYLOAD with port number
[00:39:42] [PASSED] DP_QUERY_PAYLOAD with VCPI
[00:39:42] [PASSED] DP_REMOTE_DPCD_READ with port number
[00:39:42] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[00:39:42] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[00:39:42] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[00:39:42] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[00:39:42] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[00:39:42] [PASSED] DP_REMOTE_I2C_READ with port number
[00:39:42] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[00:39:42] [PASSED] DP_REMOTE_I2C_READ with transactions array
[00:39:42] [PASSED] DP_REMOTE_I2C_WRITE with port number
[00:39:42] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[00:39:42] [PASSED] DP_REMOTE_I2C_WRITE with data array
[00:39:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[00:39:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[00:39:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[00:39:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[00:39:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[00:39:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[00:39:42] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[00:39:42] ================ [PASSED] drm_dp_mst_helper ================
[00:39:42] ================== drm_exec (7 subtests) ===================
[00:39:42] [PASSED] sanitycheck
[00:39:42] [PASSED] test_lock
[00:39:42] [PASSED] test_lock_unlock
[00:39:42] [PASSED] test_duplicates
[00:39:42] [PASSED] test_prepare
[00:39:42] [PASSED] test_prepare_array
[00:39:42] [PASSED] test_multiple_loops
[00:39:42] ==================== [PASSED] drm_exec =====================
[00:39:42] =========== drm_format_helper_test (17 subtests) ===========
[00:39:42] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[00:39:42] [PASSED] single_pixel_source_buffer
[00:39:42] [PASSED] single_pixel_clip_rectangle
[00:39:42] [PASSED] well_known_colors
[00:39:42] [PASSED] destination_pitch
[00:39:42] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[00:39:42] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[00:39:42] [PASSED] single_pixel_source_buffer
[00:39:42] [PASSED] single_pixel_clip_rectangle
[00:39:42] [PASSED] well_known_colors
[00:39:42] [PASSED] destination_pitch
[00:39:42] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[00:39:42] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[00:39:42] [PASSED] single_pixel_source_buffer
[00:39:42] [PASSED] single_pixel_clip_rectangle
[00:39:42] [PASSED] well_known_colors
[00:39:42] [PASSED] destination_pitch
[00:39:42] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[00:39:42] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[00:39:42] [PASSED] single_pixel_source_buffer
[00:39:42] [PASSED] single_pixel_clip_rectangle
[00:39:42] [PASSED] well_known_colors
[00:39:42] [PASSED] destination_pitch
[00:39:42] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[00:39:42] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[00:39:42] [PASSED] single_pixel_source_buffer
[00:39:42] [PASSED] single_pixel_clip_rectangle
[00:39:42] [PASSED] well_known_colors
[00:39:42] [PASSED] destination_pitch
[00:39:42] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[00:39:42] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[00:39:42] [PASSED] single_pixel_source_buffer
[00:39:42] [PASSED] single_pixel_clip_rectangle
[00:39:42] [PASSED] well_known_colors
[00:39:42] [PASSED] destination_pitch
[00:39:42] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[00:39:42] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[00:39:42] [PASSED] single_pixel_source_buffer
[00:39:42] [PASSED] single_pixel_clip_rectangle
[00:39:42] [PASSED] well_known_colors
[00:39:42] [PASSED] destination_pitch
[00:39:42] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[00:39:42] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[00:39:42] [PASSED] single_pixel_source_buffer
[00:39:42] [PASSED] single_pixel_clip_rectangle
[00:39:42] [PASSED] well_known_colors
[00:39:42] [PASSED] destination_pitch
[00:39:42] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[00:39:42] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[00:39:42] [PASSED] single_pixel_source_buffer
[00:39:42] [PASSED] single_pixel_clip_rectangle
[00:39:42] [PASSED] well_known_colors
[00:39:42] [PASSED] destination_pitch
[00:39:42] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[00:39:42] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[00:39:42] [PASSED] single_pixel_source_buffer
[00:39:42] [PASSED] single_pixel_clip_rectangle
[00:39:42] [PASSED] well_known_colors
[00:39:42] [PASSED] destination_pitch
[00:39:42] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[00:39:42] ============== drm_test_fb_xrgb8888_to_mono  ===============
[00:39:42] [PASSED] single_pixel_source_buffer
[00:39:42] [PASSED] single_pixel_clip_rectangle
[00:39:42] [PASSED] well_known_colors
[00:39:42] [PASSED] destination_pitch
[00:39:42] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[00:39:42] ==================== drm_test_fb_swab  =====================
[00:39:42] [PASSED] single_pixel_source_buffer
[00:39:42] [PASSED] single_pixel_clip_rectangle
[00:39:42] [PASSED] well_known_colors
[00:39:42] [PASSED] destination_pitch
[00:39:42] ================ [PASSED] drm_test_fb_swab =================
[00:39:42] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[00:39:42] [PASSED] single_pixel_source_buffer
[00:39:42] [PASSED] single_pixel_clip_rectangle
[00:39:42] [PASSED] well_known_colors
[00:39:42] [PASSED] destination_pitch
[00:39:42] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[00:39:42] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[00:39:42] [PASSED] single_pixel_source_buffer
[00:39:42] [PASSED] single_pixel_clip_rectangle
[00:39:42] [PASSED] well_known_colors
[00:39:42] [PASSED] destination_pitch
[00:39:42] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[00:39:42] ================= drm_test_fb_clip_offset  =================
[00:39:42] [PASSED] pass through
[00:39:42] [PASSED] horizontal offset
[00:39:42] [PASSED] vertical offset
[00:39:42] [PASSED] horizontal and vertical offset
[00:39:42] [PASSED] horizontal offset (custom pitch)
[00:39:42] [PASSED] vertical offset (custom pitch)
[00:39:42] [PASSED] horizontal and vertical offset (custom pitch)
[00:39:42] ============= [PASSED] drm_test_fb_clip_offset =============
[00:39:42] ============== drm_test_fb_build_fourcc_list  ==============
[00:39:42] [PASSED] no native formats
[00:39:42] [PASSED] XRGB8888 as native format
[00:39:42] [PASSED] remove duplicates
[00:39:42] [PASSED] convert alpha formats
[00:39:42] [PASSED] random formats
[00:39:42] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[00:39:42] =================== drm_test_fb_memcpy  ====================
[00:39:42] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[00:39:42] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[00:39:42] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[00:39:42] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[00:39:42] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[00:39:42] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[00:39:42] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[00:39:42] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[00:39:42] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[00:39:42] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[00:39:42] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[00:39:42] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[00:39:42] =============== [PASSED] drm_test_fb_memcpy ================
[00:39:42] ============= [PASSED] drm_format_helper_test ==============
[00:39:42] ================= drm_format (18 subtests) =================
[00:39:42] [PASSED] drm_test_format_block_width_invalid
[00:39:42] [PASSED] drm_test_format_block_width_one_plane
[00:39:42] [PASSED] drm_test_format_block_width_two_plane
[00:39:42] [PASSED] drm_test_format_block_width_three_plane
[00:39:42] [PASSED] drm_test_format_block_width_tiled
[00:39:42] [PASSED] drm_test_format_block_height_invalid
[00:39:42] [PASSED] drm_test_format_block_height_one_plane
[00:39:42] [PASSED] drm_test_format_block_height_two_plane
[00:39:42] [PASSED] drm_test_format_block_height_three_plane
[00:39:42] [PASSED] drm_test_format_block_height_tiled
[00:39:42] [PASSED] drm_test_format_min_pitch_invalid
[00:39:42] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[00:39:42] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[00:39:42] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[00:39:42] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[00:39:42] [PASSED] drm_test_format_min_pitch_two_plane
[00:39:42] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[00:39:42] [PASSED] drm_test_format_min_pitch_tiled
[00:39:42] =================== [PASSED] drm_format ====================
[00:39:42] ============== drm_framebuffer (10 subtests) ===============
[00:39:42] ========== drm_test_framebuffer_check_src_coords  ==========
[00:39:42] [PASSED] Success: source fits into fb
[00:39:42] [PASSED] Fail: overflowing fb with x-axis coordinate
[00:39:42] [PASSED] Fail: overflowing fb with y-axis coordinate
[00:39:42] [PASSED] Fail: overflowing fb with source width
[00:39:42] [PASSED] Fail: overflowing fb with source height
[00:39:42] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[00:39:42] [PASSED] drm_test_framebuffer_cleanup
[00:39:42] =============== drm_test_framebuffer_create  ===============
[00:39:42] [PASSED] ABGR8888 normal sizes
[00:39:42] [PASSED] ABGR8888 max sizes
[00:39:42] [PASSED] ABGR8888 pitch greater than min required
[00:39:42] [PASSED] ABGR8888 pitch less than min required
[00:39:42] [PASSED] ABGR8888 Invalid width
[00:39:42] [PASSED] ABGR8888 Invalid buffer handle
[00:39:42] [PASSED] No pixel format
[00:39:42] [PASSED] ABGR8888 Width 0
[00:39:42] [PASSED] ABGR8888 Height 0
[00:39:42] [PASSED] ABGR8888 Out of bound height * pitch combination
[00:39:42] [PASSED] ABGR8888 Large buffer offset
[00:39:42] [PASSED] ABGR8888 Buffer offset for inexistent plane
[00:39:42] [PASSED] ABGR8888 Invalid flag
[00:39:42] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[00:39:42] [PASSED] ABGR8888 Valid buffer modifier
[00:39:42] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[00:39:42] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[00:39:42] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[00:39:42] [PASSED] NV12 Normal sizes
[00:39:42] [PASSED] NV12 Max sizes
[00:39:42] [PASSED] NV12 Invalid pitch
[00:39:42] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[00:39:42] [PASSED] NV12 different  modifier per-plane
[00:39:42] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[00:39:42] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[00:39:42] [PASSED] NV12 Modifier for inexistent plane
[00:39:42] [PASSED] NV12 Handle for inexistent plane
[00:39:42] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[00:39:42] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[00:39:42] [PASSED] YVU420 Normal sizes
[00:39:42] [PASSED] YVU420 Max sizes
[00:39:42] [PASSED] YVU420 Invalid pitch
[00:39:42] [PASSED] YVU420 Different pitches
[00:39:42] [PASSED] YVU420 Different buffer offsets/pitches
[00:39:42] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[00:39:42] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[00:39:42] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[00:39:42] [PASSED] YVU420 Valid modifier
[00:39:42] [PASSED] YVU420 Different modifiers per plane
[00:39:42] [PASSED] YVU420 Modifier for inexistent plane
[00:39:42] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[00:39:42] [PASSED] X0L2 Normal sizes
[00:39:42] [PASSED] X0L2 Max sizes
[00:39:42] [PASSED] X0L2 Invalid pitch
[00:39:42] [PASSED] X0L2 Pitch greater than minimum required
[00:39:42] [PASSED] X0L2 Handle for inexistent plane
[00:39:42] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[00:39:42] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[00:39:42] [PASSED] X0L2 Valid modifier
[00:39:42] [PASSED] X0L2 Modifier for inexistent plane
[00:39:42] =========== [PASSED] drm_test_framebuffer_create ===========
[00:39:42] [PASSED] drm_test_framebuffer_free
[00:39:42] [PASSED] drm_test_framebuffer_init
[00:39:42] [PASSED] drm_test_framebuffer_init_bad_format
[00:39:42] [PASSED] drm_test_framebuffer_init_dev_mismatch
[00:39:42] [PASSED] drm_test_framebuffer_lookup
[00:39:42] [PASSED] drm_test_framebuffer_lookup_inexistent
[00:39:42] [PASSED] drm_test_framebuffer_modifiers_not_supported
[00:39:42] ================= [PASSED] drm_framebuffer =================
[00:39:42] ================ drm_gem_shmem (8 subtests) ================
[00:39:42] [PASSED] drm_gem_shmem_test_obj_create
[00:39:42] [PASSED] drm_gem_shmem_test_obj_create_private
[00:39:42] [PASSED] drm_gem_shmem_test_pin_pages
[00:39:42] [PASSED] drm_gem_shmem_test_vmap
[00:39:42] [PASSED] drm_gem_shmem_test_get_pages_sgt
[00:39:42] [PASSED] drm_gem_shmem_test_get_sg_table
[00:39:42] [PASSED] drm_gem_shmem_test_madvise
[00:39:42] [PASSED] drm_gem_shmem_test_purge
[00:39:42] ================== [PASSED] drm_gem_shmem ==================
[00:39:42] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[00:39:42] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[00:39:42] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[00:39:42] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[00:39:42] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[00:39:42] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[00:39:42] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[00:39:42] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[00:39:42] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[00:39:42] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[00:39:42] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[00:39:42] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[00:39:42] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[00:39:42] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[00:39:42] [PASSED] drm_test_check_output_bpc_dvi
[00:39:42] [PASSED] drm_test_check_output_bpc_format_vic_1
[00:39:42] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[00:39:42] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[00:39:42] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[00:39:42] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[00:39:42] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[00:39:42] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[00:39:42] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[00:39:42] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[00:39:42] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[00:39:42] [PASSED] drm_test_check_broadcast_rgb_value
[00:39:42] [PASSED] drm_test_check_bpc_8_value
[00:39:42] [PASSED] drm_test_check_bpc_10_value
[00:39:42] [PASSED] drm_test_check_bpc_12_value
[00:39:42] [PASSED] drm_test_check_format_value
[00:39:42] [PASSED] drm_test_check_tmds_char_value
[00:39:42] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[00:39:42] ================= drm_managed (2 subtests) =================
[00:39:42] [PASSED] drm_test_managed_release_action
[00:39:42] [PASSED] drm_test_managed_run_action
[00:39:42] =================== [PASSED] drm_managed ===================
[00:39:42] =================== drm_mm (6 subtests) ====================
[00:39:42] [PASSED] drm_test_mm_init
[00:39:42] [PASSED] drm_test_mm_debug
[00:39:42] [PASSED] drm_test_mm_align32
[00:39:42] [PASSED] drm_test_mm_align64
[00:39:42] [PASSED] drm_test_mm_lowest
[00:39:42] [PASSED] drm_test_mm_highest
[00:39:42] ===================== [PASSED] drm_mm ======================
[00:39:42] ============= drm_modes_analog_tv (5 subtests) =============
[00:39:42] [PASSED] drm_test_modes_analog_tv_mono_576i
[00:39:42] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[00:39:42] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[00:39:42] [PASSED] drm_test_modes_analog_tv_pal_576i
[00:39:42] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[00:39:42] =============== [PASSED] drm_modes_analog_tv ===============
stty: 'standard input': Inappropriate ioctl for device
[00:39:42] ============== drm_plane_helper (2 subtests) ===============
[00:39:42] =============== drm_test_check_plane_state  ================
[00:39:42] [PASSED] clipping_simple
[00:39:42] [PASSED] clipping_rotate_reflect
[00:39:42] [PASSED] positioning_simple
[00:39:42] [PASSED] upscaling
[00:39:42] [PASSED] downscaling
[00:39:42] [PASSED] rounding1
[00:39:42] [PASSED] rounding2
[00:39:42] [PASSED] rounding3
[00:39:42] [PASSED] rounding4
[00:39:42] =========== [PASSED] drm_test_check_plane_state ============
[00:39:42] =========== drm_test_check_invalid_plane_state  ============
[00:39:42] [PASSED] positioning_invalid
[00:39:42] [PASSED] upscaling_invalid
[00:39:42] [PASSED] downscaling_invalid
[00:39:42] ======= [PASSED] drm_test_check_invalid_plane_state ========
[00:39:42] ================ [PASSED] drm_plane_helper =================
[00:39:42] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[00:39:42] ====== drm_test_connector_helper_tv_get_modes_check  =======
[00:39:42] [PASSED] None
[00:39:42] [PASSED] PAL
[00:39:42] [PASSED] NTSC
[00:39:42] [PASSED] Both, NTSC Default
[00:39:42] [PASSED] Both, PAL Default
[00:39:42] [PASSED] Both, NTSC Default, with PAL on command-line
[00:39:42] [PASSED] Both, PAL Default, with NTSC on command-line
[00:39:42] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[00:39:42] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[00:39:42] ================== drm_rect (9 subtests) ===================
[00:39:42] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[00:39:42] [PASSED] drm_test_rect_clip_scaled_not_clipped
[00:39:42] [PASSED] drm_test_rect_clip_scaled_clipped
[00:39:42] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[00:39:42] ================= drm_test_rect_intersect  =================
[00:39:42] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[00:39:42] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[00:39:42] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[00:39:42] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[00:39:42] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[00:39:42] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[00:39:42] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[00:39:42] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[00:39:42] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[00:39:42] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[00:39:42] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[00:39:42] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[00:39:42] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[00:39:42] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[00:39:42] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[00:39:42] ============= [PASSED] drm_test_rect_intersect =============
[00:39:42] ================ drm_test_rect_calc_hscale  ================
[00:39:42] [PASSED] normal use
[00:39:42] [PASSED] out of max range
[00:39:42] [PASSED] out of min range
[00:39:42] [PASSED] zero dst
[00:39:42] [PASSED] negative src
[00:39:42] [PASSED] negative dst
[00:39:42] ============ [PASSED] drm_test_rect_calc_hscale ============
[00:39:42] ================ drm_test_rect_calc_vscale  ================
[00:39:42] [PASSED] normal use
[00:39:42] [PASSED] out of max range
[00:39:42] [PASSED] out of min range
[00:39:42] [PASSED] zero dst
[00:39:42] [PASSED] negative src
[00:39:42] [PASSED] negative dst
[00:39:42] ============ [PASSED] drm_test_rect_calc_vscale ============
[00:39:42] ================== drm_test_rect_rotate  ===================
[00:39:42] [PASSED] reflect-x
[00:39:42] [PASSED] reflect-y
[00:39:42] [PASSED] rotate-0
[00:39:42] [PASSED] rotate-90
[00:39:42] [PASSED] rotate-180
[00:39:42] [PASSED] rotate-270
[00:39:42] ============== [PASSED] drm_test_rect_rotate ===============
[00:39:42] ================ drm_test_rect_rotate_inv  =================
[00:39:42] [PASSED] reflect-x
[00:39:42] [PASSED] reflect-y
[00:39:42] [PASSED] rotate-0
[00:39:42] [PASSED] rotate-90
[00:39:42] [PASSED] rotate-180
[00:39:42] [PASSED] rotate-270
[00:39:42] ============ [PASSED] drm_test_rect_rotate_inv =============
[00:39:42] ==================== [PASSED] drm_rect =====================
[00:39:42] ============================================================
[00:39:42] Testing complete. Ran 526 tests: passed: 526
[00:39:42] Elapsed time: 24.766s total, 1.667s configuring, 22.880s building, 0.177s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[00:39:43] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:39:44] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
[00:39:52] Starting KUnit Kernel (1/1)...
[00:39:52] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[00:39:52] ================= ttm_device (5 subtests) ==================
[00:39:52] [PASSED] ttm_device_init_basic
[00:39:52] [PASSED] ttm_device_init_multiple
[00:39:52] [PASSED] ttm_device_fini_basic
[00:39:52] [PASSED] ttm_device_init_no_vma_man
[00:39:52] ================== ttm_device_init_pools  ==================
[00:39:52] [PASSED] No DMA allocations, no DMA32 required
[00:39:52] [PASSED] DMA allocations, DMA32 required
[00:39:52] [PASSED] No DMA allocations, DMA32 required
[00:39:52] [PASSED] DMA allocations, no DMA32 required
[00:39:52] ============== [PASSED] ttm_device_init_pools ==============
[00:39:52] =================== [PASSED] ttm_device ====================
[00:39:52] ================== ttm_pool (8 subtests) ===================
[00:39:52] ================== ttm_pool_alloc_basic  ===================
[00:39:52] [PASSED] One page
[00:39:52] [PASSED] More than one page
[00:39:52] [PASSED] Above the allocation limit
[00:39:52] [PASSED] One page, with coherent DMA mappings enabled
[00:39:52] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[00:39:52] ============== [PASSED] ttm_pool_alloc_basic ===============
[00:39:52] ============== ttm_pool_alloc_basic_dma_addr  ==============
[00:39:52] [PASSED] One page
[00:39:52] [PASSED] More than one page
[00:39:52] [PASSED] Above the allocation limit
[00:39:52] [PASSED] One page, with coherent DMA mappings enabled
[00:39:52] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[00:39:52] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[00:39:52] [PASSED] ttm_pool_alloc_order_caching_match
[00:39:52] [PASSED] ttm_pool_alloc_caching_mismatch
[00:39:52] [PASSED] ttm_pool_alloc_order_mismatch
[00:39:52] [PASSED] ttm_pool_free_dma_alloc
[00:39:52] [PASSED] ttm_pool_free_no_dma_alloc
[00:39:52] [PASSED] ttm_pool_fini_basic
[00:39:52] ==================== [PASSED] ttm_pool =====================
[00:39:52] ================ ttm_resource (8 subtests) =================
[00:39:52] ================= ttm_resource_init_basic  =================
[00:39:52] [PASSED] Init resource in TTM_PL_SYSTEM
[00:39:52] [PASSED] Init resource in TTM_PL_VRAM
[00:39:52] [PASSED] Init resource in a private placement
[00:39:52] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[00:39:52] ============= [PASSED] ttm_resource_init_basic =============
[00:39:52] [PASSED] ttm_resource_init_pinned
[00:39:52] [PASSED] ttm_resource_fini_basic
[00:39:52] [PASSED] ttm_resource_manager_init_basic
[00:39:52] [PASSED] ttm_resource_manager_usage_basic
[00:39:52] [PASSED] ttm_resource_manager_set_used_basic
[00:39:52] [PASSED] ttm_sys_man_alloc_basic
[00:39:52] [PASSED] ttm_sys_man_free_basic
[00:39:52] ================== [PASSED] ttm_resource ===================
[00:39:52] =================== ttm_tt (15 subtests) ===================
[00:39:52] ==================== ttm_tt_init_basic  ====================
[00:39:52] [PASSED] Page-aligned size
[00:39:52] [PASSED] Extra pages requested
[00:39:52] ================ [PASSED] ttm_tt_init_basic ================
[00:39:52] [PASSED] ttm_tt_init_misaligned
[00:39:52] [PASSED] ttm_tt_fini_basic
[00:39:52] [PASSED] ttm_tt_fini_sg
[00:39:52] [PASSED] ttm_tt_fini_shmem
[00:39:52] [PASSED] ttm_tt_create_basic
[00:39:52] [PASSED] ttm_tt_create_invalid_bo_type
[00:39:52] [PASSED] ttm_tt_create_ttm_exists
[00:39:52] [PASSED] ttm_tt_create_failed
[00:39:52] [PASSED] ttm_tt_destroy_basic
[00:39:52] [PASSED] ttm_tt_populate_null_ttm
[00:39:52] [PASSED] ttm_tt_populate_populated_ttm
[00:39:52] [PASSED] ttm_tt_unpopulate_basic
[00:39:52] [PASSED] ttm_tt_unpopulate_empty_ttm
[00:39:52] [PASSED] ttm_tt_swapin_basic
[00:39:52] ===================== [PASSED] ttm_tt ======================
[00:39:52] =================== ttm_bo (14 subtests) ===================
[00:39:52] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[00:39:52] [PASSED] Cannot be interrupted and sleeps
[00:39:52] [PASSED] Cannot be interrupted, locks straight away
[00:39:52] [PASSED] Can be interrupted, sleeps
[00:39:52] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[00:39:52] [PASSED] ttm_bo_reserve_locked_no_sleep
[00:39:52] [PASSED] ttm_bo_reserve_no_wait_ticket
[00:39:52] [PASSED] ttm_bo_reserve_double_resv
[00:39:52] [PASSED] ttm_bo_reserve_interrupted
[00:39:52] [PASSED] ttm_bo_reserve_deadlock
[00:39:52] [PASSED] ttm_bo_unreserve_basic
[00:39:52] [PASSED] ttm_bo_unreserve_pinned
[00:39:52] [PASSED] ttm_bo_unreserve_bulk
[00:39:52] [PASSED] ttm_bo_put_basic
[00:39:52] [PASSED] ttm_bo_put_shared_resv
[00:39:52] [PASSED] ttm_bo_pin_basic
[00:39:52] [PASSED] ttm_bo_pin_unpin_resource
[00:39:52] [PASSED] ttm_bo_multiple_pin_one_unpin
[00:39:52] ===================== [PASSED] ttm_bo ======================
[00:39:52] ============== ttm_bo_validate (22 subtests) ===============
[00:39:52] ============== ttm_bo_init_reserved_sys_man  ===============
[00:39:52] [PASSED] Buffer object for userspace
[00:39:52] [PASSED] Kernel buffer object
[00:39:52] [PASSED] Shared buffer object
[00:39:52] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[00:39:52] ============== ttm_bo_init_reserved_mock_man  ==============
[00:39:52] [PASSED] Buffer object for userspace
[00:39:52] [PASSED] Kernel buffer object
[00:39:52] [PASSED] Shared buffer object
[00:39:52] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[00:39:52] [PASSED] ttm_bo_init_reserved_resv
[00:39:52] ================== ttm_bo_validate_basic  ==================
[00:39:52] [PASSED] Buffer object for userspace
[00:39:52] [PASSED] Kernel buffer object
[00:39:52] [PASSED] Shared buffer object
[00:39:52] ============== [PASSED] ttm_bo_validate_basic ==============
[00:39:52] [PASSED] ttm_bo_validate_invalid_placement
[00:39:52] ============= ttm_bo_validate_same_placement  ==============
[00:39:52] [PASSED] System manager
[00:39:52] [PASSED] VRAM manager
[00:39:52] ========= [PASSED] ttm_bo_validate_same_placement ==========
[00:39:52] [PASSED] ttm_bo_validate_failed_alloc
[00:39:52] [PASSED] ttm_bo_validate_pinned
[00:39:52] [PASSED] ttm_bo_validate_busy_placement
[00:39:52] ================ ttm_bo_validate_multihop  =================
[00:39:52] [PASSED] Buffer object for userspace
[00:39:52] [PASSED] Kernel buffer object
[00:39:52] [PASSED] Shared buffer object
[00:39:52] ============ [PASSED] ttm_bo_validate_multihop =============
[00:39:52] ========== ttm_bo_validate_no_placement_signaled  ==========
[00:39:52] [PASSED] Buffer object in system domain, no page vector
[00:39:52] [PASSED] Buffer object in system domain with an existing page vector
[00:39:52] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[00:39:52] ======== ttm_bo_validate_no_placement_not_signaled  ========
[00:39:52] [PASSED] Buffer object for userspace
[00:39:52] [PASSED] Kernel buffer object
[00:39:52] [PASSED] Shared buffer object
[00:39:52] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[00:39:52] [PASSED] ttm_bo_validate_move_fence_signaled
[00:39:52] ========= ttm_bo_validate_move_fence_not_signaled  =========
[00:39:52] [PASSED] Waits for GPU
[00:39:52] [PASSED] Tries to lock straight away
[00:39:52] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[00:39:52] [PASSED] ttm_bo_validate_swapout
[00:39:52] [PASSED] ttm_bo_validate_happy_evict
[00:39:52] [PASSED] ttm_bo_validate_all_pinned_evict
[00:39:52] [PASSED] ttm_bo_validate_allowed_only_evict
[00:39:52] [PASSED] ttm_bo_validate_deleted_evict
[00:39:52] [PASSED] ttm_bo_validate_busy_domain_evict
[00:39:52] [PASSED] ttm_bo_validate_evict_gutting
[00:39:52] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[00:39:52] ================= [PASSED] ttm_bo_validate =================
[00:39:52] ============================================================
[00:39:52] Testing complete. Ran 102 tests: passed: 102
[00:39:52] Elapsed time: 9.900s total, 1.646s configuring, 7.637s building, 0.538s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


