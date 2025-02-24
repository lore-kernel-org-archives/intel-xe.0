Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41793C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 18:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0938310E0C8;
	Mon, 24 Feb 2025 18:46:32 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AE710E0C8;
 Mon, 24 Feb 2025 18:46:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_LOBF_enablement_fix_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Feb 2025 18:46:31 -0000
Message-ID: <174042279121.1687394.11061311763226423980@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224080847.326350-1-animesh.manna@intel.com>
In-Reply-To: <20250224080847.326350-1-animesh.manna@intel.com>
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

Series: LOBF enablement fix (rev3)
URL   : https://patchwork.freedesktop.org/series/142278/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[18:45:25] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:45:29] Building KUnit Kernel ...
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

[18:45:55] Starting KUnit Kernel (1/1)...
[18:45:55] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[18:45:55] ================== guc_buf (11 subtests) ===================
[18:45:55] [PASSED] test_smallest
[18:45:55] [PASSED] test_largest
[18:45:55] [PASSED] test_granular
[18:45:55] [PASSED] test_unique
[18:45:55] [PASSED] test_overlap
[18:45:55] [PASSED] test_reusable
[18:45:55] [PASSED] test_too_big
[18:45:55] [PASSED] test_flush
[18:45:55] [PASSED] test_lookup
[18:45:55] [PASSED] test_data
[18:45:55] [PASSED] test_class
[18:45:55] ===================== [PASSED] guc_buf =====================
[18:45:55] =================== guc_dbm (7 subtests) ===================
[18:45:55] [PASSED] test_empty
[18:45:55] [PASSED] test_default
[18:45:55] ======================== test_size  ========================
[18:45:55] [PASSED] 4
[18:45:55] [PASSED] 8
[18:45:55] [PASSED] 32
[18:45:55] [PASSED] 256
[18:45:55] ==================== [PASSED] test_size ====================
[18:45:55] ======================= test_reuse  ========================
[18:45:55] [PASSED] 4
[18:45:55] [PASSED] 8
[18:45:55] [PASSED] 32
[18:45:55] [PASSED] 256
[18:45:55] =================== [PASSED] test_reuse ====================
[18:45:55] =================== test_range_overlap  ====================
[18:45:55] [PASSED] 4
[18:45:55] [PASSED] 8
[18:45:55] [PASSED] 32
[18:45:55] [PASSED] 256
[18:45:55] =============== [PASSED] test_range_overlap ================
[18:45:55] =================== test_range_compact  ====================
[18:45:55] [PASSED] 4
[18:45:55] [PASSED] 8
[18:45:55] [PASSED] 32
[18:45:55] [PASSED] 256
[18:45:55] =============== [PASSED] test_range_compact ================
[18:45:55] ==================== test_range_spare  =====================
[18:45:55] [PASSED] 4
[18:45:55] [PASSED] 8
[18:45:55] [PASSED] 32
[18:45:55] [PASSED] 256
[18:45:55] ================ [PASSED] test_range_spare =================
[18:45:55] ===================== [PASSED] guc_dbm =====================
[18:45:55] =================== guc_idm (6 subtests) ===================
[18:45:55] [PASSED] bad_init
[18:45:55] [PASSED] no_init
[18:45:55] [PASSED] init_fini
[18:45:55] [PASSED] check_used
[18:45:55] [PASSED] check_quota
[18:45:55] [PASSED] check_all
[18:45:55] ===================== [PASSED] guc_idm =====================
[18:45:55] ================== no_relay (3 subtests) ===================
[18:45:55] [PASSED] xe_drops_guc2pf_if_not_ready
[18:45:55] [PASSED] xe_drops_guc2vf_if_not_ready
[18:45:55] [PASSED] xe_rejects_send_if_not_ready
[18:45:55] ==================== [PASSED] no_relay =====================
[18:45:55] ================== pf_relay (14 subtests) ==================
[18:45:55] [PASSED] pf_rejects_guc2pf_too_short
[18:45:55] [PASSED] pf_rejects_guc2pf_too_long
[18:45:55] [PASSED] pf_rejects_guc2pf_no_payload
[18:45:55] [PASSED] pf_fails_no_payload
[18:45:55] [PASSED] pf_fails_bad_origin
[18:45:55] [PASSED] pf_fails_bad_type
[18:45:55] [PASSED] pf_txn_reports_error
[18:45:55] [PASSED] pf_txn_sends_pf2guc
[18:45:55] [PASSED] pf_sends_pf2guc
[18:45:55] [SKIPPED] pf_loopback_nop
[18:45:55] [SKIPPED] pf_loopback_echo
[18:45:55] [SKIPPED] pf_loopback_fail
[18:45:55] [SKIPPED] pf_loopback_busy
[18:45:55] [SKIPPED] pf_loopback_retry
[18:45:55] ==================== [PASSED] pf_relay =====================
[18:45:55] ================== vf_relay (3 subtests) ===================
[18:45:55] [PASSED] vf_rejects_guc2vf_too_short
[18:45:55] [PASSED] vf_rejects_guc2vf_too_long
[18:45:55] [PASSED] vf_rejects_guc2vf_no_payload
[18:45:55] ==================== [PASSED] vf_relay =====================
[18:45:55] ================= pf_service (11 subtests) =================
[18:45:55] [PASSED] pf_negotiate_any
[18:45:55] [PASSED] pf_negotiate_base_match
[18:45:55] [PASSED] pf_negotiate_base_newer
[18:45:55] [PASSED] pf_negotiate_base_next
[18:45:55] [SKIPPED] pf_negotiate_base_older
[18:45:55] [PASSED] pf_negotiate_base_prev
[18:45:55] [PASSED] pf_negotiate_latest_match
[18:45:55] [PASSED] pf_negotiate_latest_newer
[18:45:55] [PASSED] pf_negotiate_latest_next
[18:45:55] [SKIPPED] pf_negotiate_latest_older
[18:45:55] [SKIPPED] pf_negotiate_latest_prev
[18:45:55] =================== [PASSED] pf_service ====================
[18:45:55] ===================== lmtt (1 subtest) =====================
[18:45:55] ======================== test_ops  =========================
[18:45:55] [PASSED] 2-level
[18:45:55] [PASSED] multi-level
[18:45:55] ==================== [PASSED] test_ops =====================
[18:45:55] ====================== [PASSED] lmtt =======================
[18:45:55] =================== xe_mocs (2 subtests) ===================
[18:45:55] ================ xe_live_mocs_kernel_kunit  ================
[18:45:55] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[18:45:55] ================ xe_live_mocs_reset_kunit  =================
[18:45:55] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[18:45:55] ==================== [SKIPPED] xe_mocs =====================
[18:45:55] ================= xe_migrate (2 subtests) ==================
[18:45:55] ================= xe_migrate_sanity_kunit  =================
[18:45:55] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[18:45:55] ================== xe_validate_ccs_kunit  ==================
[18:45:55] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[18:45:55] =================== [SKIPPED] xe_migrate ===================
[18:45:55] ================== xe_dma_buf (1 subtest) ==================
[18:45:55] ==================== xe_dma_buf_kunit  =====================
[18:45:55] ================ [SKIPPED] xe_dma_buf_kunit ================
[18:45:55] =================== [SKIPPED] xe_dma_buf ===================
[18:45:55] ================= xe_bo_shrink (1 subtest) =================
[18:45:55] =================== xe_bo_shrink_kunit  ====================
[18:45:55] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[18:45:55] ================== [SKIPPED] xe_bo_shrink ==================
[18:45:55] ==================== xe_bo (2 subtests) ====================
[18:45:55] ================== xe_ccs_migrate_kunit  ===================
[18:45:55] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
stty: 'standard input': Inappropriate ioctl for device
[18:45:55] ==================== xe_bo_evict_kunit  ====================
[18:45:55] =============== [SKIPPED] xe_bo_evict_kunit ================
[18:45:55] ===================== [SKIPPED] xe_bo ======================
[18:45:55] ==================== args (11 subtests) ====================
[18:45:55] [PASSED] count_args_test
[18:45:55] [PASSED] call_args_example
[18:45:55] [PASSED] call_args_test
[18:45:55] [PASSED] drop_first_arg_example
[18:45:55] [PASSED] drop_first_arg_test
[18:45:55] [PASSED] first_arg_example
[18:45:55] [PASSED] first_arg_test
[18:45:55] [PASSED] last_arg_example
[18:45:55] [PASSED] last_arg_test
[18:45:55] [PASSED] pick_arg_example
[18:45:55] [PASSED] sep_comma_example
[18:45:55] ====================== [PASSED] args =======================
[18:45:55] =================== xe_pci (2 subtests) ====================
[18:45:55] [PASSED] xe_gmdid_graphics_ip
[18:45:55] [PASSED] xe_gmdid_media_ip
[18:45:55] ===================== [PASSED] xe_pci ======================
[18:45:55] =================== xe_rtp (2 subtests) ====================
[18:45:55] =============== xe_rtp_process_to_sr_tests  ================
[18:45:55] [PASSED] coalesce-same-reg
[18:45:55] [PASSED] no-match-no-add
[18:45:55] [PASSED] match-or
[18:45:55] [PASSED] match-or-xfail
[18:45:55] [PASSED] no-match-no-add-multiple-rules
[18:45:55] [PASSED] two-regs-two-entries
[18:45:55] [PASSED] clr-one-set-other
[18:45:55] [PASSED] set-field
[18:45:55] [PASSED] conflict-duplicate
[18:45:55] [PASSED] conflict-not-disjoint
[18:45:55] [PASSED] conflict-reg-type
[18:45:55] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[18:45:55] ================== xe_rtp_process_tests  ===================
[18:45:55] [PASSED] active1
[18:45:55] [PASSED] active2
[18:45:55] [PASSED] active-inactive
[18:45:55] [PASSED] inactive-active
[18:45:55] [PASSED] inactive-1st_or_active-inactive
[18:45:55] [PASSED] inactive-2nd_or_active-inactive
[18:45:55] [PASSED] inactive-last_or_active-inactive
[18:45:55] [PASSED] inactive-no_or_active-inactive
[18:45:55] ============== [PASSED] xe_rtp_process_tests ===============
[18:45:55] ===================== [PASSED] xe_rtp ======================
[18:45:55] ==================== xe_wa (1 subtest) =====================
[18:45:55] ======================== xe_wa_gt  =========================
[18:45:55] [PASSED] TIGERLAKE (B0)
[18:45:55] [PASSED] DG1 (A0)
[18:45:55] [PASSED] DG1 (B0)
[18:45:55] [PASSED] ALDERLAKE_S (A0)
[18:45:55] [PASSED] ALDERLAKE_S (B0)
[18:45:55] [PASSED] ALDERLAKE_S (C0)
[18:45:55] [PASSED] ALDERLAKE_S (D0)
[18:45:55] [PASSED] ALDERLAKE_P (A0)
[18:45:55] [PASSED] ALDERLAKE_P (B0)
[18:45:55] [PASSED] ALDERLAKE_P (C0)
[18:45:55] [PASSED] ALDERLAKE_S_RPLS (D0)
[18:45:55] [PASSED] ALDERLAKE_P_RPLU (E0)
[18:45:55] [PASSED] DG2_G10 (C0)
[18:45:55] [PASSED] DG2_G11 (B1)
[18:45:55] [PASSED] DG2_G12 (A1)
[18:45:55] [PASSED] METEORLAKE (g:A0, m:A0)
[18:45:55] [PASSED] METEORLAKE (g:A0, m:A0)
[18:45:55] [PASSED] METEORLAKE (g:A0, m:A0)
[18:45:55] [PASSED] LUNARLAKE (g:A0, m:A0)
[18:45:55] [PASSED] LUNARLAKE (g:B0, m:A0)
[18:45:55] [PASSED] BATTLEMAGE (g:A0, m:A1)
[18:45:55] ==================== [PASSED] xe_wa_gt =====================
[18:45:55] ====================== [PASSED] xe_wa ======================
[18:45:55] ============================================================
[18:45:55] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[18:45:55] Elapsed time: 30.265s total, 4.120s configuring, 25.879s building, 0.252s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[18:45:55] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:45:57] Building KUnit Kernel ...
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

[18:46:18] Starting KUnit Kernel (1/1)...
[18:46:18] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[18:46:18] =========== drm_validate_clone_mode (2 subtests) ===========
[18:46:18] ============== drm_test_check_in_clone_mode  ===============
[18:46:18] [PASSED] in_clone_mode
[18:46:18] [PASSED] not_in_clone_mode
[18:46:18] ========== [PASSED] drm_test_check_in_clone_mode ===========
[18:46:18] =============== drm_test_check_valid_clones  ===============
[18:46:18] [PASSED] not_in_clone_mode
[18:46:18] [PASSED] valid_clone
[18:46:18] [PASSED] invalid_clone
[18:46:18] =========== [PASSED] drm_test_check_valid_clones ===========
[18:46:18] ============= [PASSED] drm_validate_clone_mode =============
[18:46:18] ============= drm_validate_modeset (1 subtest) =============
[18:46:18] [PASSED] drm_test_check_connector_changed_modeset
[18:46:18] ============== [PASSED] drm_validate_modeset ===============
[18:46:18] ================== drm_buddy (7 subtests) ==================
[18:46:18] [PASSED] drm_test_buddy_alloc_limit
[18:46:18] [PASSED] drm_test_buddy_alloc_optimistic
[18:46:18] [PASSED] drm_test_buddy_alloc_pessimistic
[18:46:18] [PASSED] drm_test_buddy_alloc_pathological
[18:46:18] [PASSED] drm_test_buddy_alloc_contiguous
[18:46:18] [PASSED] drm_test_buddy_alloc_clear
[18:46:18] [PASSED] drm_test_buddy_alloc_range_bias
[18:46:18] ==================== [PASSED] drm_buddy ====================
[18:46:18] ============= drm_cmdline_parser (40 subtests) =============
[18:46:18] [PASSED] drm_test_cmdline_force_d_only
[18:46:18] [PASSED] drm_test_cmdline_force_D_only_dvi
[18:46:18] [PASSED] drm_test_cmdline_force_D_only_hdmi
[18:46:18] [PASSED] drm_test_cmdline_force_D_only_not_digital
[18:46:18] [PASSED] drm_test_cmdline_force_e_only
[18:46:18] [PASSED] drm_test_cmdline_res
[18:46:18] [PASSED] drm_test_cmdline_res_vesa
[18:46:18] [PASSED] drm_test_cmdline_res_vesa_rblank
[18:46:18] [PASSED] drm_test_cmdline_res_rblank
[18:46:18] [PASSED] drm_test_cmdline_res_bpp
[18:46:18] [PASSED] drm_test_cmdline_res_refresh
[18:46:18] [PASSED] drm_test_cmdline_res_bpp_refresh
[18:46:18] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[18:46:18] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[18:46:18] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[18:46:18] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[18:46:18] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[18:46:18] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[18:46:18] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[18:46:18] [PASSED] drm_test_cmdline_res_margins_force_on
[18:46:18] [PASSED] drm_test_cmdline_res_vesa_margins
[18:46:18] [PASSED] drm_test_cmdline_name
[18:46:18] [PASSED] drm_test_cmdline_name_bpp
[18:46:18] [PASSED] drm_test_cmdline_name_option
[18:46:18] [PASSED] drm_test_cmdline_name_bpp_option
[18:46:18] [PASSED] drm_test_cmdline_rotate_0
[18:46:18] [PASSED] drm_test_cmdline_rotate_90
[18:46:18] [PASSED] drm_test_cmdline_rotate_180
[18:46:18] [PASSED] drm_test_cmdline_rotate_270
[18:46:18] [PASSED] drm_test_cmdline_hmirror
[18:46:18] [PASSED] drm_test_cmdline_vmirror
[18:46:18] [PASSED] drm_test_cmdline_margin_options
[18:46:18] [PASSED] drm_test_cmdline_multiple_options
[18:46:18] [PASSED] drm_test_cmdline_bpp_extra_and_option
[18:46:18] [PASSED] drm_test_cmdline_extra_and_option
[18:46:18] [PASSED] drm_test_cmdline_freestanding_options
[18:46:18] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[18:46:18] [PASSED] drm_test_cmdline_panel_orientation
[18:46:18] ================ drm_test_cmdline_invalid  =================
[18:46:18] [PASSED] margin_only
[18:46:18] [PASSED] interlace_only
[18:46:18] [PASSED] res_missing_x
[18:46:18] [PASSED] res_missing_y
[18:46:18] [PASSED] res_bad_y
[18:46:18] [PASSED] res_missing_y_bpp
[18:46:18] [PASSED] res_bad_bpp
[18:46:18] [PASSED] res_bad_refresh
[18:46:18] [PASSED] res_bpp_refresh_force_on_off
[18:46:18] [PASSED] res_invalid_mode
[18:46:18] [PASSED] res_bpp_wrong_place_mode
[18:46:18] [PASSED] name_bpp_refresh
[18:46:18] [PASSED] name_refresh
[18:46:18] [PASSED] name_refresh_wrong_mode
[18:46:18] [PASSED] name_refresh_invalid_mode
[18:46:18] [PASSED] rotate_multiple
[18:46:18] [PASSED] rotate_invalid_val
[18:46:18] [PASSED] rotate_truncated
[18:46:18] [PASSED] invalid_option
[18:46:18] [PASSED] invalid_tv_option
[18:46:18] [PASSED] truncated_tv_option
[18:46:18] ============ [PASSED] drm_test_cmdline_invalid =============
[18:46:18] =============== drm_test_cmdline_tv_options  ===============
[18:46:18] [PASSED] NTSC
[18:46:18] [PASSED] NTSC_443
[18:46:18] [PASSED] NTSC_J
[18:46:18] [PASSED] PAL
[18:46:18] [PASSED] PAL_M
[18:46:18] [PASSED] PAL_N
[18:46:18] [PASSED] SECAM
[18:46:18] [PASSED] MONO_525
[18:46:18] [PASSED] MONO_625
[18:46:18] =========== [PASSED] drm_test_cmdline_tv_options ===========
[18:46:18] =============== [PASSED] drm_cmdline_parser ================
[18:46:18] ========== drmm_connector_hdmi_init (20 subtests) ==========
[18:46:18] [PASSED] drm_test_connector_hdmi_init_valid
[18:46:18] [PASSED] drm_test_connector_hdmi_init_bpc_8
[18:46:18] [PASSED] drm_test_connector_hdmi_init_bpc_10
[18:46:18] [PASSED] drm_test_connector_hdmi_init_bpc_12
[18:46:18] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[18:46:18] [PASSED] drm_test_connector_hdmi_init_bpc_null
[18:46:18] [PASSED] drm_test_connector_hdmi_init_formats_empty
[18:46:18] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[18:46:18] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[18:46:18] [PASSED] supported_formats=0x9 yuv420_allowed=1
[18:46:18] [PASSED] supported_formats=0x9 yuv420_allowed=0
[18:46:18] [PASSED] supported_formats=0x3 yuv420_allowed=1
[18:46:18] [PASSED] supported_formats=0x3 yuv420_allowed=0
[18:46:18] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[18:46:18] [PASSED] drm_test_connector_hdmi_init_null_ddc
[18:46:18] [PASSED] drm_test_connector_hdmi_init_null_product
[18:46:18] [PASSED] drm_test_connector_hdmi_init_null_vendor
[18:46:18] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[18:46:18] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[18:46:18] [PASSED] drm_test_connector_hdmi_init_product_valid
[18:46:18] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[18:46:18] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[18:46:18] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[18:46:18] ========= drm_test_connector_hdmi_init_type_valid  =========
[18:46:18] [PASSED] HDMI-A
[18:46:18] [PASSED] HDMI-B
[18:46:18] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[18:46:18] ======== drm_test_connector_hdmi_init_type_invalid  ========
[18:46:18] [PASSED] Unknown
[18:46:18] [PASSED] VGA
[18:46:18] [PASSED] DVI-I
[18:46:18] [PASSED] DVI-D
[18:46:18] [PASSED] DVI-A
[18:46:18] [PASSED] Composite
[18:46:18] [PASSED] SVIDEO
[18:46:18] [PASSED] LVDS
[18:46:18] [PASSED] Component
[18:46:18] [PASSED] DIN
[18:46:18] [PASSED] DP
[18:46:18] [PASSED] TV
[18:46:18] [PASSED] eDP
[18:46:18] [PASSED] Virtual
[18:46:18] [PASSED] DSI
[18:46:18] [PASSED] DPI
[18:46:18] [PASSED] Writeback
[18:46:18] [PASSED] SPI
[18:46:18] [PASSED] USB
[18:46:18] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[18:46:18] ============ [PASSED] drmm_connector_hdmi_init =============
[18:46:18] ============= drmm_connector_init (3 subtests) =============
[18:46:18] [PASSED] drm_test_drmm_connector_init
[18:46:18] [PASSED] drm_test_drmm_connector_init_null_ddc
[18:46:18] ========= drm_test_drmm_connector_init_type_valid  =========
[18:46:18] [PASSED] Unknown
[18:46:18] [PASSED] VGA
[18:46:18] [PASSED] DVI-I
[18:46:18] [PASSED] DVI-D
[18:46:18] [PASSED] DVI-A
[18:46:18] [PASSED] Composite
[18:46:18] [PASSED] SVIDEO
[18:46:18] [PASSED] LVDS
[18:46:18] [PASSED] Component
[18:46:18] [PASSED] DIN
[18:46:18] [PASSED] DP
[18:46:18] [PASSED] HDMI-A
[18:46:18] [PASSED] HDMI-B
[18:46:18] [PASSED] TV
[18:46:18] [PASSED] eDP
[18:46:18] [PASSED] Virtual
[18:46:18] [PASSED] DSI
[18:46:18] [PASSED] DPI
[18:46:18] [PASSED] Writeback
[18:46:18] [PASSED] SPI
[18:46:18] [PASSED] USB
[18:46:18] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[18:46:18] =============== [PASSED] drmm_connector_init ===============
[18:46:18] ========= drm_connector_dynamic_init (6 subtests) ==========
[18:46:18] [PASSED] drm_test_drm_connector_dynamic_init
[18:46:18] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[18:46:18] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[18:46:18] [PASSED] drm_test_drm_connector_dynamic_init_properties
[18:46:18] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[18:46:18] [PASSED] Unknown
[18:46:18] [PASSED] VGA
[18:46:18] [PASSED] DVI-I
[18:46:18] [PASSED] DVI-D
[18:46:18] [PASSED] DVI-A
[18:46:18] [PASSED] Composite
[18:46:18] [PASSED] SVIDEO
[18:46:18] [PASSED] LVDS
[18:46:18] [PASSED] Component
[18:46:18] [PASSED] DIN
[18:46:18] [PASSED] DP
[18:46:18] [PASSED] HDMI-A
[18:46:18] [PASSED] HDMI-B
[18:46:18] [PASSED] TV
[18:46:18] [PASSED] eDP
[18:46:18] [PASSED] Virtual
[18:46:18] [PASSED] DSI
[18:46:18] [PASSED] DPI
[18:46:18] [PASSED] Writeback
[18:46:18] [PASSED] SPI
[18:46:18] [PASSED] USB
[18:46:18] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[18:46:18] ======== drm_test_drm_connector_dynamic_init_name  =========
[18:46:18] [PASSED] Unknown
[18:46:18] [PASSED] VGA
[18:46:18] [PASSED] DVI-I
[18:46:18] [PASSED] DVI-D
[18:46:18] [PASSED] DVI-A
[18:46:18] [PASSED] Composite
[18:46:18] [PASSED] SVIDEO
[18:46:18] [PASSED] LVDS
[18:46:18] [PASSED] Component
[18:46:18] [PASSED] DIN
[18:46:18] [PASSED] DP
[18:46:18] [PASSED] HDMI-A
[18:46:18] [PASSED] HDMI-B
[18:46:18] [PASSED] TV
[18:46:18] [PASSED] eDP
[18:46:18] [PASSED] Virtual
[18:46:18] [PASSED] DSI
[18:46:18] [PASSED] DPI
[18:46:18] [PASSED] Writeback
[18:46:18] [PASSED] SPI
[18:46:18] [PASSED] USB
[18:46:18] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[18:46:18] =========== [PASSED] drm_connector_dynamic_init ============
[18:46:18] ==== drm_connector_dynamic_register_early (4 subtests) =====
[18:46:18] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[18:46:18] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[18:46:18] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[18:46:18] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[18:46:18] ====== [PASSED] drm_connector_dynamic_register_early =======
[18:46:18] ======= drm_connector_dynamic_register (7 subtests) ========
[18:46:18] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[18:46:18] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[18:46:18] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[18:46:18] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[18:46:18] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[18:46:18] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[18:46:18] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[18:46:18] ========= [PASSED] drm_connector_dynamic_register ==========
[18:46:18] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[18:46:18] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[18:46:18] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[18:46:18] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[18:46:18] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[18:46:18] ========== drm_test_get_tv_mode_from_name_valid  ===========
[18:46:18] [PASSED] NTSC
[18:46:18] [PASSED] NTSC-443
[18:46:18] [PASSED] NTSC-J
[18:46:18] [PASSED] PAL
[18:46:18] [PASSED] PAL-M
[18:46:18] [PASSED] PAL-N
[18:46:18] [PASSED] SECAM
[18:46:18] [PASSED] Mono
[18:46:18] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[18:46:18] [PASSED] drm_test_get_tv_mode_from_name_truncated
[18:46:18] ============ [PASSED] drm_get_tv_mode_from_name ============
[18:46:18] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[18:46:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[18:46:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[18:46:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[18:46:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[18:46:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[18:46:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[18:46:18] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[18:46:18] [PASSED] VIC 96
[18:46:18] [PASSED] VIC 97
[18:46:18] [PASSED] VIC 101
[18:46:18] [PASSED] VIC 102
[18:46:18] [PASSED] VIC 106
[18:46:18] [PASSED] VIC 107
[18:46:18] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[18:46:18] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[18:46:18] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[18:46:18] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[18:46:18] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[18:46:18] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[18:46:18] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[18:46:18] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[18:46:18] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[18:46:18] [PASSED] Automatic
[18:46:18] [PASSED] Full
[18:46:18] [PASSED] Limited 16:235
[18:46:18] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[18:46:18] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[18:46:18] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[18:46:18] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[18:46:18] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[18:46:18] [PASSED] RGB
[18:46:18] [PASSED] YUV 4:2:0
[18:46:18] [PASSED] YUV 4:2:2
[18:46:18] [PASSED] YUV 4:4:4
[18:46:18] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[18:46:18] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[18:46:18] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[18:46:18] ============= drm_damage_helper (21 subtests) ==============
[18:46:18] [PASSED] drm_test_damage_iter_no_damage
[18:46:18] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[18:46:18] [PASSED] drm_test_damage_iter_no_damage_src_moved
[18:46:18] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[18:46:18] [PASSED] drm_test_damage_iter_no_damage_not_visible
[18:46:18] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[18:46:18] [PASSED] drm_test_damage_iter_no_damage_no_fb
[18:46:18] [PASSED] drm_test_damage_iter_simple_damage
[18:46:18] [PASSED] drm_test_damage_iter_single_damage
[18:46:18] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[18:46:18] [PASSED] drm_test_damage_iter_single_damage_outside_src
[18:46:18] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[18:46:18] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[18:46:18] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[18:46:18] [PASSED] drm_test_damage_iter_single_damage_src_moved
[18:46:18] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[18:46:18] [PASSED] drm_test_damage_iter_damage
[18:46:18] [PASSED] drm_test_damage_iter_damage_one_intersect
[18:46:18] [PASSED] drm_test_damage_iter_damage_one_outside
[18:46:18] [PASSED] drm_test_damage_iter_damage_src_moved
[18:46:18] [PASSED] drm_test_damage_iter_damage_not_visible
[18:46:18] ================ [PASSED] drm_damage_helper ================
[18:46:18] ============== drm_dp_mst_helper (3 subtests) ==============
[18:46:18] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[18:46:18] [PASSED] Clock 154000 BPP 30 DSC disabled
[18:46:18] [PASSED] Clock 234000 BPP 30 DSC disabled
[18:46:18] [PASSED] Clock 297000 BPP 24 DSC disabled
[18:46:18] [PASSED] Clock 332880 BPP 24 DSC enabled
[18:46:18] [PASSED] Clock 324540 BPP 24 DSC enabled
[18:46:18] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[18:46:18] ============== drm_test_dp_mst_calc_pbn_div  ===============
[18:46:18] [PASSED] Link rate 2000000 lane count 4
[18:46:18] [PASSED] Link rate 2000000 lane count 2
[18:46:18] [PASSED] Link rate 2000000 lane count 1
[18:46:18] [PASSED] Link rate 1350000 lane count 4
[18:46:18] [PASSED] Link rate 1350000 lane count 2
[18:46:18] [PASSED] Link rate 1350000 lane count 1
[18:46:18] [PASSED] Link rate 1000000 lane count 4
[18:46:18] [PASSED] Link rate 1000000 lane count 2
[18:46:18] [PASSED] Link rate 1000000 lane count 1
[18:46:18] [PASSED] Link rate 810000 lane count 4
[18:46:18] [PASSED] Link rate 810000 lane count 2
[18:46:18] [PASSED] Link rate 810000 lane count 1
[18:46:18] [PASSED] Link rate 540000 lane count 4
[18:46:18] [PASSED] Link rate 540000 lane count 2
[18:46:18] [PASSED] Link rate 540000 lane count 1
[18:46:18] [PASSED] Link rate 270000 lane count 4
[18:46:18] [PASSED] Link rate 270000 lane count 2
[18:46:18] [PASSED] Link rate 270000 lane count 1
[18:46:18] [PASSED] Link rate 162000 lane count 4
[18:46:18] [PASSED] Link rate 162000 lane count 2
[18:46:18] [PASSED] Link rate 162000 lane count 1
[18:46:18] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[18:46:18] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[18:46:18] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[18:46:18] [PASSED] DP_POWER_UP_PHY with port number
[18:46:18] [PASSED] DP_POWER_DOWN_PHY with port number
[18:46:18] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[18:46:18] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[18:46:18] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[18:46:18] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[18:46:18] [PASSED] DP_QUERY_PAYLOAD with port number
[18:46:18] [PASSED] DP_QUERY_PAYLOAD with VCPI
[18:46:18] [PASSED] DP_REMOTE_DPCD_READ with port number
[18:46:18] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[18:46:18] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[18:46:18] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[18:46:18] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[18:46:18] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[18:46:18] [PASSED] DP_REMOTE_I2C_READ with port number
[18:46:18] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[18:46:18] [PASSED] DP_REMOTE_I2C_READ with transactions array
[18:46:18] [PASSED] DP_REMOTE_I2C_WRITE with port number
[18:46:18] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[18:46:18] [PASSED] DP_REMOTE_I2C_WRITE with data array
[18:46:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[18:46:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[18:46:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[18:46:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[18:46:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[18:46:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[18:46:18] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[18:46:18] ================ [PASSED] drm_dp_mst_helper ================
[18:46:18] ================== drm_exec (7 subtests) ===================
[18:46:18] [PASSED] sanitycheck
[18:46:18] [PASSED] test_lock
[18:46:18] [PASSED] test_lock_unlock
[18:46:18] [PASSED] test_duplicates
[18:46:18] [PASSED] test_prepare
[18:46:18] [PASSED] test_prepare_array
[18:46:18] [PASSED] test_multiple_loops
[18:46:18] ==================== [PASSED] drm_exec =====================
[18:46:18] =========== drm_format_helper_test (17 subtests) ===========
[18:46:18] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[18:46:18] [PASSED] single_pixel_source_buffer
[18:46:18] [PASSED] single_pixel_clip_rectangle
[18:46:18] [PASSED] well_known_colors
[18:46:18] [PASSED] destination_pitch
[18:46:18] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[18:46:18] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[18:46:18] [PASSED] single_pixel_source_buffer
[18:46:18] [PASSED] single_pixel_clip_rectangle
[18:46:18] [PASSED] well_known_colors
[18:46:18] [PASSED] destination_pitch
[18:46:18] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[18:46:18] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[18:46:18] [PASSED] single_pixel_source_buffer
[18:46:18] [PASSED] single_pixel_clip_rectangle
[18:46:18] [PASSED] well_known_colors
[18:46:18] [PASSED] destination_pitch
[18:46:18] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[18:46:18] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[18:46:18] [PASSED] single_pixel_source_buffer
[18:46:18] [PASSED] single_pixel_clip_rectangle
[18:46:18] [PASSED] well_known_colors
[18:46:18] [PASSED] destination_pitch
[18:46:18] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[18:46:18] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[18:46:18] [PASSED] single_pixel_source_buffer
[18:46:18] [PASSED] single_pixel_clip_rectangle
[18:46:18] [PASSED] well_known_colors
[18:46:18] [PASSED] destination_pitch
[18:46:18] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[18:46:18] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[18:46:18] [PASSED] single_pixel_source_buffer
[18:46:18] [PASSED] single_pixel_clip_rectangle
[18:46:18] [PASSED] well_known_colors
[18:46:18] [PASSED] destination_pitch
[18:46:18] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[18:46:18] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[18:46:18] [PASSED] single_pixel_source_buffer
[18:46:18] [PASSED] single_pixel_clip_rectangle
[18:46:18] [PASSED] well_known_colors
[18:46:18] [PASSED] destination_pitch
[18:46:18] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[18:46:18] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[18:46:18] [PASSED] single_pixel_source_buffer
[18:46:18] [PASSED] single_pixel_clip_rectangle
[18:46:18] [PASSED] well_known_colors
[18:46:18] [PASSED] destination_pitch
[18:46:18] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[18:46:18] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[18:46:18] [PASSED] single_pixel_source_buffer
[18:46:18] [PASSED] single_pixel_clip_rectangle
[18:46:18] [PASSED] well_known_colors
[18:46:18] [PASSED] destination_pitch
[18:46:18] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[18:46:18] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[18:46:18] [PASSED] single_pixel_source_buffer
[18:46:18] [PASSED] single_pixel_clip_rectangle
[18:46:18] [PASSED] well_known_colors
[18:46:18] [PASSED] destination_pitch
[18:46:18] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[18:46:18] ============== drm_test_fb_xrgb8888_to_mono  ===============
[18:46:18] [PASSED] single_pixel_source_buffer
[18:46:18] [PASSED] single_pixel_clip_rectangle
[18:46:18] [PASSED] well_known_colors
[18:46:18] [PASSED] destination_pitch
[18:46:18] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[18:46:18] ==================== drm_test_fb_swab  =====================
[18:46:18] [PASSED] single_pixel_source_buffer
[18:46:18] [PASSED] single_pixel_clip_rectangle
[18:46:18] [PASSED] well_known_colors
[18:46:18] [PASSED] destination_pitch
[18:46:18] ================ [PASSED] drm_test_fb_swab =================
[18:46:18] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[18:46:18] [PASSED] single_pixel_source_buffer
[18:46:18] [PASSED] single_pixel_clip_rectangle
[18:46:18] [PASSED] well_known_colors
[18:46:18] [PASSED] destination_pitch
[18:46:18] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[18:46:18] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[18:46:18] [PASSED] single_pixel_source_buffer
[18:46:18] [PASSED] single_pixel_clip_rectangle
[18:46:18] [PASSED] well_known_colors
[18:46:18] [PASSED] destination_pitch
[18:46:18] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[18:46:18] ================= drm_test_fb_clip_offset  =================
[18:46:18] [PASSED] pass through
[18:46:18] [PASSED] horizontal offset
[18:46:18] [PASSED] vertical offset
[18:46:18] [PASSED] horizontal and vertical offset
[18:46:18] [PASSED] horizontal offset (custom pitch)
[18:46:18] [PASSED] vertical offset (custom pitch)
[18:46:18] [PASSED] horizontal and vertical offset (custom pitch)
[18:46:18] ============= [PASSED] drm_test_fb_clip_offset =============
[18:46:18] ============== drm_test_fb_build_fourcc_list  ==============
[18:46:18] [PASSED] no native formats
[18:46:18] [PASSED] XRGB8888 as native format
[18:46:18] [PASSED] remove duplicates
[18:46:18] [PASSED] convert alpha formats
[18:46:18] [PASSED] random formats
[18:46:18] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[18:46:18] =================== drm_test_fb_memcpy  ====================
[18:46:18] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[18:46:18] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[18:46:18] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[18:46:18] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[18:46:18] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[18:46:18] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[18:46:18] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[18:46:18] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[18:46:18] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[18:46:18] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[18:46:18] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[18:46:18] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[18:46:18] =============== [PASSED] drm_test_fb_memcpy ================
[18:46:18] ============= [PASSED] drm_format_helper_test ==============
[18:46:18] ================= drm_format (18 subtests) =================
[18:46:18] [PASSED] drm_test_format_block_width_invalid
[18:46:18] [PASSED] drm_test_format_block_width_one_plane
[18:46:18] [PASSED] drm_test_format_block_width_two_plane
[18:46:18] [PASSED] drm_test_format_block_width_three_plane
[18:46:18] [PASSED] drm_test_format_block_width_tiled
[18:46:18] [PASSED] drm_test_format_block_height_invalid
[18:46:18] [PASSED] drm_test_format_block_height_one_plane
[18:46:18] [PASSED] drm_test_format_block_height_two_plane
[18:46:18] [PASSED] drm_test_format_block_height_three_plane
[18:46:18] [PASSED] drm_test_format_block_height_tiled
[18:46:18] [PASSED] drm_test_format_min_pitch_invalid
[18:46:18] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[18:46:18] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[18:46:18] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[18:46:18] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[18:46:18] [PASSED] drm_test_format_min_pitch_two_plane
[18:46:18] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[18:46:18] [PASSED] drm_test_format_min_pitch_tiled
[18:46:18] =================== [PASSED] drm_format ====================
[18:46:18] ============== drm_framebuffer (10 subtests) ===============
[18:46:18] ========== drm_test_framebuffer_check_src_coords  ==========
[18:46:18] [PASSED] Success: source fits into fb
[18:46:18] [PASSED] Fail: overflowing fb with x-axis coordinate
[18:46:18] [PASSED] Fail: overflowing fb with y-axis coordinate
[18:46:18] [PASSED] Fail: overflowing fb with source width
[18:46:18] [PASSED] Fail: overflowing fb with source height
[18:46:18] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[18:46:18] [PASSED] drm_test_framebuffer_cleanup
[18:46:18] =============== drm_test_framebuffer_create  ===============
[18:46:18] [PASSED] ABGR8888 normal sizes
[18:46:18] [PASSED] ABGR8888 max sizes
[18:46:18] [PASSED] ABGR8888 pitch greater than min required
[18:46:18] [PASSED] ABGR8888 pitch less than min required
[18:46:18] [PASSED] ABGR8888 Invalid width
[18:46:18] [PASSED] ABGR8888 Invalid buffer handle
[18:46:18] [PASSED] No pixel format
[18:46:18] [PASSED] ABGR8888 Width 0
[18:46:18] [PASSED] ABGR8888 Height 0
[18:46:18] [PASSED] ABGR8888 Out of bound height * pitch combination
[18:46:18] [PASSED] ABGR8888 Large buffer offset
[18:46:18] [PASSED] ABGR8888 Buffer offset for inexistent plane
[18:46:18] [PASSED] ABGR8888 Invalid flag
[18:46:18] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[18:46:18] [PASSED] ABGR8888 Valid buffer modifier
[18:46:18] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[18:46:18] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[18:46:18] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[18:46:18] [PASSED] NV12 Normal sizes
[18:46:18] [PASSED] NV12 Max sizes
[18:46:18] [PASSED] NV12 Invalid pitch
[18:46:18] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[18:46:18] [PASSED] NV12 different  modifier per-plane
[18:46:18] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[18:46:18] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[18:46:18] [PASSED] NV12 Modifier for inexistent plane
[18:46:18] [PASSED] NV12 Handle for inexistent plane
[18:46:18] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[18:46:18] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[18:46:18] [PASSED] YVU420 Normal sizes
[18:46:18] [PASSED] YVU420 Max sizes
[18:46:18] [PASSED] YVU420 Invalid pitch
[18:46:18] [PASSED] YVU420 Different pitches
[18:46:18] [PASSED] YVU420 Different buffer offsets/pitches
[18:46:18] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[18:46:18] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[18:46:18] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[18:46:18] [PASSED] YVU420 Valid modifier
[18:46:18] [PASSED] YVU420 Different modifiers per plane
[18:46:18] [PASSED] YVU420 Modifier for inexistent plane
[18:46:18] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[18:46:18] [PASSED] X0L2 Normal sizes
[18:46:18] [PASSED] X0L2 Max sizes
[18:46:18] [PASSED] X0L2 Invalid pitch
[18:46:18] [PASSED] X0L2 Pitch greater than minimum required
[18:46:18] [PASSED] X0L2 Handle for inexistent plane
[18:46:18] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[18:46:18] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[18:46:18] [PASSED] X0L2 Valid modifier
[18:46:18] [PASSED] X0L2 Modifier for inexistent plane
[18:46:18] =========== [PASSED] drm_test_framebuffer_create ===========
[18:46:18] [PASSED] drm_test_framebuffer_free
[18:46:18] [PASSED] drm_test_framebuffer_init
[18:46:18] [PASSED] drm_test_framebuffer_init_bad_format
[18:46:18] [PASSED] drm_test_framebuffer_init_dev_mismatch
[18:46:18] [PASSED] drm_test_framebuffer_lookup
[18:46:18] [PASSED] drm_test_framebuffer_lookup_inexistent
[18:46:18] [PASSED] drm_test_framebuffer_modifiers_not_supported
[18:46:18] ================= [PASSED] drm_framebuffer =================
[18:46:18] ================ drm_gem_shmem (8 subtests) ================
[18:46:18] [PASSED] drm_gem_shmem_test_obj_create
[18:46:18] [PASSED] drm_gem_shmem_test_obj_create_private
[18:46:18] [PASSED] drm_gem_shmem_test_pin_pages
[18:46:18] [PASSED] drm_gem_shmem_test_vmap
[18:46:18] [PASSED] drm_gem_shmem_test_get_pages_sgt
[18:46:18] [PASSED] drm_gem_shmem_test_get_sg_table
[18:46:18] [PASSED] drm_gem_shmem_test_madvise
[18:46:18] [PASSED] drm_gem_shmem_test_purge
[18:46:18] ================== [PASSED] drm_gem_shmem ==================
[18:46:18] === drm_atomic_helper_connector_hdmi_check (23 subtests) ===
[18:46:18] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[18:46:18] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[18:46:18] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[18:46:18] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[18:46:18] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[18:46:18] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[18:46:18] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[18:46:18] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[18:46:18] [PASSED] drm_test_check_disable_connector
[18:46:18] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[18:46:18] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[18:46:18] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[18:46:18] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[18:46:18] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[18:46:18] [PASSED] drm_test_check_output_bpc_dvi
[18:46:18] [PASSED] drm_test_check_output_bpc_format_vic_1
[18:46:18] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[18:46:18] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[18:46:18] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[18:46:18] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[18:46:18] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[18:46:18] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[18:46:18] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[18:46:18] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[18:46:18] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[18:46:18] [PASSED] drm_test_check_broadcast_rgb_value
[18:46:18] [PASSED] drm_test_check_bpc_8_value
[18:46:18] [PASSED] drm_test_check_bpc_10_value
[18:46:18] [PASSED] drm_test_check_bpc_12_value
[18:46:18] [PASSED] drm_test_check_format_value
[18:46:18] [PASSED] drm_test_check_tmds_char_value
[18:46:18] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[18:46:18] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[18:46:18] [PASSED] drm_test_check_mode_valid
[18:46:18] [PASSED] drm_test_check_mode_valid_reject
[18:46:18] [PASSED] drm_test_check_mode_valid_reject_rate
[18:46:18] [PASSED] drm_test_check_mode_valid_reject_max_clock
[18:46:18] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[18:46:18] ================= drm_managed (2 subtests) =================
[18:46:18] [PASSED] drm_test_managed_release_action
[18:46:18] [PASSED] drm_test_managed_run_action
[18:46:18] =================== [PASSED] drm_managed ===================
[18:46:18] =================== drm_mm (6 subtests) ====================
[18:46:18] [PASSED] drm_test_mm_init
[18:46:18] [PASSED] drm_test_mm_debug
[18:46:18] [PASSED] drm_test_mm_align32
[18:46:18] [PASSED] drm_test_mm_align64
[18:46:18] [PASSED] drm_test_mm_lowest
[18:46:18] [PASSED] drm_test_mm_highest
[18:46:18] ===================== [PASSED] drm_mm ======================
[18:46:18] ============= drm_modes_analog_tv (5 subtests) =============
[18:46:18] [PASSED] drm_test_modes_analog_tv_mono_576i
[18:46:18] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[18:46:18] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[18:46:18] [PASSED] drm_test_modes_analog_tv_pal_576i
[18:46:18] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[18:46:18] =============== [PASSED] drm_modes_analog_tv ===============
[18:46:18] ============== drm_plane_helper (2 subtests) ===============
[18:46:18] =============== drm_test_check_plane_state  ================
[18:46:18] [PASSED] clipping_simple
[18:46:18] [PASSED] clipping_rotate_reflect
[18:46:18] [PASSED] positioning_simple
[18:46:18] [PASSED] upscaling
[18:46:18] [PASSED] downscaling
[18:46:18] [PASSED] rounding1
[18:46:18] [PASSED] rounding2
[18:46:18] [PASSED] rounding3
[18:46:18] [PASSED] rounding4
[18:46:18] =========== [PASSED] drm_test_check_plane_state ============
[18:46:18] =========== drm_test_check_invalid_plane_state  ============
[18:46:18] [PASSED] positioning_invalid
[18:46:18] [PASSED] upscaling_invalid
[18:46:18] [PASSED] downscaling_invalid
[18:46:18] ======= [PASSED] drm_test_check_invalid_plane_state ========
[18:46:18] ================ [PASSED] drm_plane_helper =================
[18:46:18] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[18:46:18] ====== drm_test_connector_helper_tv_get_modes_check  =======
[18:46:18] [PASSED] None
[18:46:18] [PASSED] PAL
[18:46:18] [PASSED] NTSC
[18:46:18] [PASSED] Both, NTSC Default
[18:46:18] [PASSED] Both, PAL Default
[18:46:18] [PASSED] Both, NTSC Default, with PAL on command-line
[18:46:18] [PASSED] Both, PAL Default, with NTSC on command-line
[18:46:18] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[18:46:18] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[18:46:18] ================== drm_rect (9 subtests) ===================
[18:46:18] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[18:46:18] [PASSED] drm_test_rect_clip_scaled_not_clipped
[18:46:18] [PASSED] drm_test_rect_clip_scaled_clipped
[18:46:18] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[18:46:18] ================= drm_test_rect_intersect  =================
[18:46:18] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[18:46:18] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[18:46:18] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[18:46:18] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[18:46:18] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[18:46:18] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[18:46:18] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[18:46:18] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[18:46:18] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[18:46:18] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[18:46:18] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[18:46:18] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[18:46:18] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[18:46:18] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[18:46:18] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[18:46:18] ============= [PASSED] drm_test_rect_intersect =============
[18:46:18] ================ drm_test_rect_calc_hscale  ================
[18:46:18] [PASSED] normal use
[18:46:18] [PASSED] out of max range
[18:46:18] [PASSED] out of min range
[18:46:18] [PASSED] zero dst
[18:46:18] [PASSED] negative src
[18:46:18] [PASSED] negative dst
[18:46:18] ============ [PASSED] drm_test_rect_calc_hscale ============
[18:46:18] ================ drm_test_rect_calc_vscale  ================
[18:46:18] [PASSED] normal use
[18:46:18] [PASSED] out of max range
[18:46:18] [PASSED] out of min range
[18:46:18] [PASSED] zero dst
[18:46:18] [PASSED] negative src
[18:46:18] [PASSED] negative dst
[18:46:18] ============ [PASSED] drm_test_rect_calc_vscale ============
[18:46:18] ================== drm_test_rect_rotate  ===================
[18:46:18] [PASSED] reflect-x
[18:46:18] [PASSED] reflect-y
[18:46:18] [PASSED] rotate-0
[18:46:18] [PASSED] rotate-90
[18:46:18] [PASSED] rotate-180
[18:46:18] [PASSED] rotate-270
stty: 'standard input': Inappropriate ioctl for device
[18:46:18] ============== [PASSED] drm_test_rect_rotate ===============
[18:46:18] ================ drm_test_rect_rotate_inv  =================
[18:46:18] [PASSED] reflect-x
[18:46:18] [PASSED] reflect-y
[18:46:18] [PASSED] rotate-0
[18:46:18] [PASSED] rotate-90
[18:46:18] [PASSED] rotate-180
[18:46:18] [PASSED] rotate-270
[18:46:18] ============ [PASSED] drm_test_rect_rotate_inv =============
[18:46:18] ==================== [PASSED] drm_rect =====================
[18:46:18] ============================================================
[18:46:18] Testing complete. Ran 598 tests: passed: 598
[18:46:18] Elapsed time: 23.019s total, 1.666s configuring, 21.136s building, 0.184s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[18:46:18] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:46:20] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
[18:46:28] Starting KUnit Kernel (1/1)...
[18:46:28] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[18:46:28] ================= ttm_device (5 subtests) ==================
[18:46:28] [PASSED] ttm_device_init_basic
[18:46:28] [PASSED] ttm_device_init_multiple
[18:46:28] [PASSED] ttm_device_fini_basic
[18:46:28] [PASSED] ttm_device_init_no_vma_man
[18:46:28] ================== ttm_device_init_pools  ==================
[18:46:28] [PASSED] No DMA allocations, no DMA32 required
[18:46:28] [PASSED] DMA allocations, DMA32 required
[18:46:28] [PASSED] No DMA allocations, DMA32 required
[18:46:28] [PASSED] DMA allocations, no DMA32 required
[18:46:28] ============== [PASSED] ttm_device_init_pools ==============
[18:46:28] =================== [PASSED] ttm_device ====================
[18:46:28] ================== ttm_pool (8 subtests) ===================
[18:46:28] ================== ttm_pool_alloc_basic  ===================
[18:46:28] [PASSED] One page
[18:46:28] [PASSED] More than one page
[18:46:28] [PASSED] Above the allocation limit
[18:46:28] [PASSED] One page, with coherent DMA mappings enabled
[18:46:28] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[18:46:28] ============== [PASSED] ttm_pool_alloc_basic ===============
[18:46:28] ============== ttm_pool_alloc_basic_dma_addr  ==============
[18:46:28] [PASSED] One page
[18:46:28] [PASSED] More than one page
[18:46:28] [PASSED] Above the allocation limit
[18:46:28] [PASSED] One page, with coherent DMA mappings enabled
[18:46:28] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[18:46:28] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[18:46:28] [PASSED] ttm_pool_alloc_order_caching_match
[18:46:28] [PASSED] ttm_pool_alloc_caching_mismatch
[18:46:28] [PASSED] ttm_pool_alloc_order_mismatch
[18:46:28] [PASSED] ttm_pool_free_dma_alloc
[18:46:28] [PASSED] ttm_pool_free_no_dma_alloc
[18:46:28] [PASSED] ttm_pool_fini_basic
[18:46:28] ==================== [PASSED] ttm_pool =====================
[18:46:28] ================ ttm_resource (8 subtests) =================
[18:46:28] ================= ttm_resource_init_basic  =================
[18:46:28] [PASSED] Init resource in TTM_PL_SYSTEM
[18:46:28] [PASSED] Init resource in TTM_PL_VRAM
[18:46:28] [PASSED] Init resource in a private placement
[18:46:28] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[18:46:28] ============= [PASSED] ttm_resource_init_basic =============
[18:46:28] [PASSED] ttm_resource_init_pinned
[18:46:28] [PASSED] ttm_resource_fini_basic
[18:46:28] [PASSED] ttm_resource_manager_init_basic
[18:46:28] [PASSED] ttm_resource_manager_usage_basic
[18:46:28] [PASSED] ttm_resource_manager_set_used_basic
[18:46:28] [PASSED] ttm_sys_man_alloc_basic
[18:46:28] [PASSED] ttm_sys_man_free_basic
[18:46:28] ================== [PASSED] ttm_resource ===================
[18:46:28] =================== ttm_tt (15 subtests) ===================
[18:46:28] ==================== ttm_tt_init_basic  ====================
[18:46:28] [PASSED] Page-aligned size
[18:46:28] [PASSED] Extra pages requested
[18:46:28] ================ [PASSED] ttm_tt_init_basic ================
[18:46:28] [PASSED] ttm_tt_init_misaligned
[18:46:28] [PASSED] ttm_tt_fini_basic
[18:46:28] [PASSED] ttm_tt_fini_sg
[18:46:28] [PASSED] ttm_tt_fini_shmem
[18:46:28] [PASSED] ttm_tt_create_basic
[18:46:28] [PASSED] ttm_tt_create_invalid_bo_type
[18:46:28] [PASSED] ttm_tt_create_ttm_exists
[18:46:28] [PASSED] ttm_tt_create_failed
[18:46:28] [PASSED] ttm_tt_destroy_basic
[18:46:28] [PASSED] ttm_tt_populate_null_ttm
[18:46:28] [PASSED] ttm_tt_populate_populated_ttm
[18:46:28] [PASSED] ttm_tt_unpopulate_basic
[18:46:28] [PASSED] ttm_tt_unpopulate_empty_ttm
[18:46:28] [PASSED] ttm_tt_swapin_basic
[18:46:28] ===================== [PASSED] ttm_tt ======================
[18:46:28] =================== ttm_bo (14 subtests) ===================
[18:46:28] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[18:46:28] [PASSED] Cannot be interrupted and sleeps
[18:46:28] [PASSED] Cannot be interrupted, locks straight away
[18:46:28] [PASSED] Can be interrupted, sleeps
[18:46:28] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[18:46:28] [PASSED] ttm_bo_reserve_locked_no_sleep
[18:46:28] [PASSED] ttm_bo_reserve_no_wait_ticket
[18:46:28] [PASSED] ttm_bo_reserve_double_resv
[18:46:28] [PASSED] ttm_bo_reserve_interrupted
[18:46:28] [PASSED] ttm_bo_reserve_deadlock
[18:46:28] [PASSED] ttm_bo_unreserve_basic
[18:46:28] [PASSED] ttm_bo_unreserve_pinned
[18:46:28] [PASSED] ttm_bo_unreserve_bulk
[18:46:28] [PASSED] ttm_bo_put_basic
[18:46:28] [PASSED] ttm_bo_put_shared_resv
[18:46:28] [PASSED] ttm_bo_pin_basic
[18:46:28] [PASSED] ttm_bo_pin_unpin_resource
[18:46:28] [PASSED] ttm_bo_multiple_pin_one_unpin
[18:46:28] ===================== [PASSED] ttm_bo ======================
[18:46:28] ============== ttm_bo_validate (22 subtests) ===============
[18:46:28] ============== ttm_bo_init_reserved_sys_man  ===============
[18:46:28] [PASSED] Buffer object for userspace
[18:46:28] [PASSED] Kernel buffer object
[18:46:28] [PASSED] Shared buffer object
[18:46:28] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[18:46:28] ============== ttm_bo_init_reserved_mock_man  ==============
[18:46:28] [PASSED] Buffer object for userspace
[18:46:28] [PASSED] Kernel buffer object
[18:46:28] [PASSED] Shared buffer object
[18:46:28] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[18:46:28] [PASSED] ttm_bo_init_reserved_resv
[18:46:28] ================== ttm_bo_validate_basic  ==================
[18:46:28] [PASSED] Buffer object for userspace
[18:46:28] [PASSED] Kernel buffer object
[18:46:28] [PASSED] Shared buffer object
[18:46:28] ============== [PASSED] ttm_bo_validate_basic ==============
[18:46:28] [PASSED] ttm_bo_validate_invalid_placement
[18:46:28] ============= ttm_bo_validate_same_placement  ==============
[18:46:28] [PASSED] System manager
[18:46:28] [PASSED] VRAM manager
[18:46:28] ========= [PASSED] ttm_bo_validate_same_placement ==========
[18:46:28] [PASSED] ttm_bo_validate_failed_alloc
[18:46:28] [PASSED] ttm_bo_validate_pinned
[18:46:28] [PASSED] ttm_bo_validate_busy_placement
[18:46:28] ================ ttm_bo_validate_multihop  =================
[18:46:28] [PASSED] Buffer object for userspace
[18:46:28] [PASSED] Kernel buffer object
[18:46:28] [PASSED] Shared buffer object
[18:46:28] ============ [PASSED] ttm_bo_validate_multihop =============
[18:46:28] ========== ttm_bo_validate_no_placement_signaled  ==========
[18:46:28] [PASSED] Buffer object in system domain, no page vector
[18:46:28] [PASSED] Buffer object in system domain with an existing page vector
[18:46:28] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[18:46:28] ======== ttm_bo_validate_no_placement_not_signaled  ========
[18:46:28] [PASSED] Buffer object for userspace
[18:46:28] [PASSED] Kernel buffer object
[18:46:28] [PASSED] Shared buffer object
[18:46:28] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[18:46:28] [PASSED] ttm_bo_validate_move_fence_signaled
[18:46:28] ========= ttm_bo_validate_move_fence_not_signaled  =========
[18:46:28] [PASSED] Waits for GPU
[18:46:28] [PASSED] Tries to lock straight away
[18:46:28] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[18:46:28] [PASSED] ttm_bo_validate_swapout
[18:46:28] [PASSED] ttm_bo_validate_happy_evict
[18:46:28] [PASSED] ttm_bo_validate_all_pinned_evict
[18:46:28] [PASSED] ttm_bo_validate_allowed_only_evict
[18:46:28] [PASSED] ttm_bo_validate_deleted_evict
[18:46:28] [PASSED] ttm_bo_validate_busy_domain_evict
[18:46:28] [PASSED] ttm_bo_validate_evict_gutting
[18:46:28] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[18:46:28] ================= [PASSED] ttm_bo_validate =================
[18:46:28] ============================================================
[18:46:28] Testing complete. Ran 102 tests: passed: 102
[18:46:28] Elapsed time: 9.957s total, 1.665s configuring, 7.675s building, 0.520s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


