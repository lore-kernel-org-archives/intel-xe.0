Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1407CD13CF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 18:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACF610E395;
	Mon,  2 Sep 2024 18:00:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A231810E397;
 Mon,  2 Sep 2024 18:00:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/ttm=3A_Really_use_a_separa?=
 =?utf-8?q?te_LRU_list_for_swapped-_and_pinned_objects?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Sep 2024 18:00:57 -0000
Message-ID: <172530005765.907988.8775731609853259356@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240902154159.78871-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240902154159.78871-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/ttm: Really use a separate LRU list for swapped- and pinned objects
URL   : https://patchwork.freedesktop.org/series/138103/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[17:59:53] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:59:57] Building KUnit Kernel ...
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

[18:00:23] Starting KUnit Kernel (1/1)...
[18:00:23] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[18:00:23] =================== guc_dbm (7 subtests) ===================
[18:00:23] [PASSED] test_empty
[18:00:23] [PASSED] test_default
[18:00:23] ======================== test_size  ========================
[18:00:23] [PASSED] 4
[18:00:23] [PASSED] 8
[18:00:23] [PASSED] 32
[18:00:23] [PASSED] 256
[18:00:23] ==================== [PASSED] test_size ====================
[18:00:23] ======================= test_reuse  ========================
[18:00:23] [PASSED] 4
[18:00:23] [PASSED] 8
[18:00:23] [PASSED] 32
[18:00:23] [PASSED] 256
[18:00:23] =================== [PASSED] test_reuse ====================
[18:00:23] =================== test_range_overlap  ====================
[18:00:23] [PASSED] 4
[18:00:23] [PASSED] 8
[18:00:23] [PASSED] 32
[18:00:23] [PASSED] 256
[18:00:23] =============== [PASSED] test_range_overlap ================
[18:00:23] =================== test_range_compact  ====================
[18:00:23] [PASSED] 4
[18:00:23] [PASSED] 8
[18:00:23] [PASSED] 32
[18:00:23] [PASSED] 256
[18:00:23] =============== [PASSED] test_range_compact ================
[18:00:23] ==================== test_range_spare  =====================
[18:00:23] [PASSED] 4
[18:00:23] [PASSED] 8
[18:00:23] [PASSED] 32
[18:00:23] [PASSED] 256
[18:00:23] ================ [PASSED] test_range_spare =================
[18:00:23] ===================== [PASSED] guc_dbm =====================
[18:00:23] =================== guc_idm (6 subtests) ===================
[18:00:23] [PASSED] bad_init
[18:00:23] [PASSED] no_init
[18:00:23] [PASSED] init_fini
[18:00:23] [PASSED] check_used
[18:00:23] [PASSED] check_quota
[18:00:23] [PASSED] check_all
[18:00:23] ===================== [PASSED] guc_idm =====================
[18:00:23] ================== no_relay (3 subtests) ===================
[18:00:23] [PASSED] xe_drops_guc2pf_if_not_ready
[18:00:23] [PASSED] xe_drops_guc2vf_if_not_ready
[18:00:23] [PASSED] xe_rejects_send_if_not_ready
[18:00:23] ==================== [PASSED] no_relay =====================
[18:00:23] ================== pf_relay (14 subtests) ==================
[18:00:23] [PASSED] pf_rejects_guc2pf_too_short
[18:00:23] [PASSED] pf_rejects_guc2pf_too_long
[18:00:23] [PASSED] pf_rejects_guc2pf_no_payload
[18:00:23] [PASSED] pf_fails_no_payload
[18:00:23] [PASSED] pf_fails_bad_origin
[18:00:23] [PASSED] pf_fails_bad_type
[18:00:23] [PASSED] pf_txn_reports_error
[18:00:23] [PASSED] pf_txn_sends_pf2guc
[18:00:23] [PASSED] pf_sends_pf2guc
[18:00:23] [SKIPPED] pf_loopback_nop
[18:00:23] [SKIPPED] pf_loopback_echo
[18:00:23] [SKIPPED] pf_loopback_fail
[18:00:23] [SKIPPED] pf_loopback_busy
[18:00:23] [SKIPPED] pf_loopback_retry
[18:00:23] ==================== [PASSED] pf_relay =====================
[18:00:23] ================== vf_relay (3 subtests) ===================
[18:00:23] [PASSED] vf_rejects_guc2vf_too_short
[18:00:23] [PASSED] vf_rejects_guc2vf_too_long
[18:00:23] [PASSED] vf_rejects_guc2vf_no_payload
[18:00:23] ==================== [PASSED] vf_relay =====================
[18:00:23] ================= pf_service (11 subtests) =================
[18:00:23] [PASSED] pf_negotiate_any
[18:00:23] [PASSED] pf_negotiate_base_match
[18:00:23] [PASSED] pf_negotiate_base_newer
[18:00:23] [PASSED] pf_negotiate_base_next
[18:00:23] [SKIPPED] pf_negotiate_base_older
[18:00:23] [PASSED] pf_negotiate_base_prev
[18:00:23] [PASSED] pf_negotiate_latest_match
[18:00:23] [PASSED] pf_negotiate_latest_newer
[18:00:23] [PASSED] pf_negotiate_latest_next
[18:00:23] [SKIPPED] pf_negotiate_latest_older
[18:00:23] [SKIPPED] pf_negotiate_latest_prev
[18:00:23] =================== [PASSED] pf_service ====================
[18:00:23] ===================== lmtt (1 subtest) =====================
[18:00:23] ======================== test_ops  =========================
[18:00:23] [PASSED] 2-level
[18:00:23] [PASSED] multi-level
[18:00:23] ==================== [PASSED] test_ops =====================
[18:00:23] ====================== [PASSED] lmtt =======================
[18:00:23] =================== xe_mocs (2 subtests) ===================
[18:00:23] ================ xe_live_mocs_kernel_kunit  ================
[18:00:23] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[18:00:23] ================ xe_live_mocs_reset_kunit  =================
[18:00:23] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[18:00:23] ==================== [SKIPPED] xe_mocs =====================
[18:00:23] ================= xe_migrate (2 subtests) ==================
[18:00:23] ================= xe_migrate_sanity_kunit  =================
[18:00:23] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[18:00:23] ================== xe_validate_ccs_kunit  ==================
[18:00:23] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[18:00:23] =================== [SKIPPED] xe_migrate ===================
[18:00:23] ================== xe_dma_buf (1 subtest) ==================
[18:00:23] ==================== xe_dma_buf_kunit  =====================
[18:00:23] ================ [SKIPPED] xe_dma_buf_kunit ================
[18:00:23] =================== [SKIPPED] xe_dma_buf ===================
[18:00:23] ==================== xe_bo (2 subtests) ====================
[18:00:23] ================== xe_ccs_migrate_kunit  ===================
[18:00:23] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[18:00:23] ==================== xe_bo_evict_kunit  ====================
[18:00:23] =============== [SKIPPED] xe_bo_evict_kunit ================
[18:00:23] ===================== [SKIPPED] xe_bo ======================
[18:00:23] ==================== args (11 subtests) ====================
[18:00:23] [PASSED] count_args_test
[18:00:23] [PASSED] call_args_example
[18:00:23] [PASSED] call_args_test
[18:00:23] [PASSED] drop_first_arg_example
[18:00:23] [PASSED] drop_first_arg_test
[18:00:23] [PASSED] first_arg_example
[18:00:23] [PASSED] first_arg_test
[18:00:23] [PASSED] last_arg_example
[18:00:23] [PASSED] last_arg_test
[18:00:23] [PASSED] pick_arg_example
[18:00:23] [PASSED] sep_comma_example
[18:00:23] ====================== [PASSED] args =======================
[18:00:23] =================== xe_pci (2 subtests) ====================
stty: 'standard input': Inappropriate ioctl for device
[18:00:23] [PASSED] xe_gmdid_graphics_ip
[18:00:23] [PASSED] xe_gmdid_media_ip
[18:00:23] ===================== [PASSED] xe_pci ======================
[18:00:23] =================== xe_rtp (2 subtests) ====================
[18:00:23] =============== xe_rtp_process_to_sr_tests  ================
[18:00:23] [PASSED] coalesce-same-reg
[18:00:23] [PASSED] no-match-no-add
[18:00:23] [PASSED] match-or
[18:00:23] [PASSED] match-or-xfail
[18:00:23] [PASSED] no-match-no-add-multiple-rules
[18:00:23] [PASSED] two-regs-two-entries
[18:00:23] [PASSED] clr-one-set-other
[18:00:23] [PASSED] set-field
[18:00:23] [PASSED] conflict-duplicate
[18:00:23] [PASSED] conflict-not-disjoint
[18:00:23] [PASSED] conflict-reg-type
[18:00:23] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[18:00:23] ================== xe_rtp_process_tests  ===================
[18:00:23] [PASSED] active1
[18:00:23] [PASSED] active2
[18:00:23] [PASSED] active-inactive
[18:00:23] [PASSED] inactive-active
[18:00:23] [PASSED] inactive-1st_or_active-inactive
[18:00:23] [PASSED] inactive-2nd_or_active-inactive
[18:00:23] [PASSED] inactive-last_or_active-inactive
[18:00:23] [PASSED] inactive-no_or_active-inactive
[18:00:23] ============== [PASSED] xe_rtp_process_tests ===============
[18:00:23] ===================== [PASSED] xe_rtp ======================
[18:00:23] ==================== xe_wa (1 subtest) =====================
[18:00:23] ======================== xe_wa_gt  =========================
[18:00:23] [PASSED] TIGERLAKE (B0)
[18:00:23] [PASSED] DG1 (A0)
[18:00:23] [PASSED] DG1 (B0)
[18:00:23] [PASSED] ALDERLAKE_S (A0)
[18:00:23] [PASSED] ALDERLAKE_S (B0)
[18:00:23] [PASSED] ALDERLAKE_S (C0)
[18:00:23] [PASSED] ALDERLAKE_S (D0)
[18:00:23] [PASSED] ALDERLAKE_P (A0)
[18:00:23] [PASSED] ALDERLAKE_P (B0)
[18:00:23] [PASSED] ALDERLAKE_P (C0)
[18:00:23] [PASSED] ALDERLAKE_S_RPLS (D0)
[18:00:23] [PASSED] ALDERLAKE_P_RPLU (E0)
[18:00:23] [PASSED] DG2_G10 (C0)
[18:00:23] [PASSED] DG2_G11 (B1)
[18:00:23] [PASSED] DG2_G12 (A1)
[18:00:23] [PASSED] METEORLAKE (g:A0, m:A0)
[18:00:23] [PASSED] METEORLAKE (g:A0, m:A0)
[18:00:23] [PASSED] METEORLAKE (g:A0, m:A0)
[18:00:23] [PASSED] LUNARLAKE (g:A0, m:A0)
[18:00:23] [PASSED] LUNARLAKE (g:B0, m:A0)
[18:00:23] [PASSED] BATTLEMAGE (g:A0, m:A1)
[18:00:23] ==================== [PASSED] xe_wa_gt =====================
[18:00:23] ====================== [PASSED] xe_wa ======================
[18:00:23] ============================================================
[18:00:23] Testing complete. Ran 121 tests: passed: 106, skipped: 15
[18:00:23] Elapsed time: 30.200s total, 4.195s configuring, 25.735s building, 0.225s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[18:00:23] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:00:25] Building KUnit Kernel ...
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

[18:00:46] Starting KUnit Kernel (1/1)...
[18:00:46] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[18:00:46] ============ drm_test_pick_cmdline (2 subtests) ============
[18:00:46] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[18:00:46] =============== drm_test_pick_cmdline_named  ===============
[18:00:46] [PASSED] NTSC
[18:00:46] [PASSED] NTSC-J
[18:00:46] [PASSED] PAL
[18:00:46] [PASSED] PAL-M
[18:00:46] =========== [PASSED] drm_test_pick_cmdline_named ===========
[18:00:46] ============== [PASSED] drm_test_pick_cmdline ==============
[18:00:46] ================== drm_buddy (7 subtests) ==================
[18:00:46] [PASSED] drm_test_buddy_alloc_limit
[18:00:46] [PASSED] drm_test_buddy_alloc_optimistic
[18:00:46] [PASSED] drm_test_buddy_alloc_pessimistic
[18:00:46] [PASSED] drm_test_buddy_alloc_pathological
[18:00:46] [PASSED] drm_test_buddy_alloc_contiguous
[18:00:46] [PASSED] drm_test_buddy_alloc_clear
[18:00:46] [PASSED] drm_test_buddy_alloc_range_bias
[18:00:46] ==================== [PASSED] drm_buddy ====================
[18:00:46] ============= drm_cmdline_parser (40 subtests) =============
[18:00:46] [PASSED] drm_test_cmdline_force_d_only
[18:00:46] [PASSED] drm_test_cmdline_force_D_only_dvi
[18:00:46] [PASSED] drm_test_cmdline_force_D_only_hdmi
[18:00:46] [PASSED] drm_test_cmdline_force_D_only_not_digital
[18:00:46] [PASSED] drm_test_cmdline_force_e_only
[18:00:46] [PASSED] drm_test_cmdline_res
[18:00:46] [PASSED] drm_test_cmdline_res_vesa
[18:00:46] [PASSED] drm_test_cmdline_res_vesa_rblank
[18:00:46] [PASSED] drm_test_cmdline_res_rblank
[18:00:46] [PASSED] drm_test_cmdline_res_bpp
[18:00:46] [PASSED] drm_test_cmdline_res_refresh
[18:00:46] [PASSED] drm_test_cmdline_res_bpp_refresh
[18:00:46] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[18:00:46] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[18:00:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[18:00:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[18:00:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[18:00:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[18:00:46] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[18:00:46] [PASSED] drm_test_cmdline_res_margins_force_on
[18:00:46] [PASSED] drm_test_cmdline_res_vesa_margins
[18:00:46] [PASSED] drm_test_cmdline_name
[18:00:46] [PASSED] drm_test_cmdline_name_bpp
[18:00:46] [PASSED] drm_test_cmdline_name_option
[18:00:46] [PASSED] drm_test_cmdline_name_bpp_option
[18:00:46] [PASSED] drm_test_cmdline_rotate_0
[18:00:46] [PASSED] drm_test_cmdline_rotate_90
[18:00:46] [PASSED] drm_test_cmdline_rotate_180
[18:00:46] [PASSED] drm_test_cmdline_rotate_270
[18:00:46] [PASSED] drm_test_cmdline_hmirror
[18:00:46] [PASSED] drm_test_cmdline_vmirror
[18:00:46] [PASSED] drm_test_cmdline_margin_options
[18:00:46] [PASSED] drm_test_cmdline_multiple_options
[18:00:46] [PASSED] drm_test_cmdline_bpp_extra_and_option
[18:00:46] [PASSED] drm_test_cmdline_extra_and_option
[18:00:46] [PASSED] drm_test_cmdline_freestanding_options
[18:00:46] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[18:00:46] [PASSED] drm_test_cmdline_panel_orientation
[18:00:46] ================ drm_test_cmdline_invalid  =================
[18:00:46] [PASSED] margin_only
[18:00:46] [PASSED] interlace_only
[18:00:46] [PASSED] res_missing_x
[18:00:46] [PASSED] res_missing_y
[18:00:46] [PASSED] res_bad_y
[18:00:46] [PASSED] res_missing_y_bpp
[18:00:46] [PASSED] res_bad_bpp
[18:00:46] [PASSED] res_bad_refresh
[18:00:46] [PASSED] res_bpp_refresh_force_on_off
[18:00:46] [PASSED] res_invalid_mode
[18:00:46] [PASSED] res_bpp_wrong_place_mode
[18:00:46] [PASSED] name_bpp_refresh
[18:00:46] [PASSED] name_refresh
[18:00:46] [PASSED] name_refresh_wrong_mode
[18:00:46] [PASSED] name_refresh_invalid_mode
[18:00:46] [PASSED] rotate_multiple
[18:00:46] [PASSED] rotate_invalid_val
[18:00:46] [PASSED] rotate_truncated
[18:00:46] [PASSED] invalid_option
[18:00:46] [PASSED] invalid_tv_option
[18:00:46] [PASSED] truncated_tv_option
[18:00:46] ============ [PASSED] drm_test_cmdline_invalid =============
[18:00:46] =============== drm_test_cmdline_tv_options  ===============
[18:00:46] [PASSED] NTSC
[18:00:46] [PASSED] NTSC_443
[18:00:46] [PASSED] NTSC_J
[18:00:46] [PASSED] PAL
[18:00:46] [PASSED] PAL_M
[18:00:46] [PASSED] PAL_N
[18:00:46] [PASSED] SECAM
[18:00:46] [PASSED] MONO_525
[18:00:46] [PASSED] MONO_625
[18:00:46] =========== [PASSED] drm_test_cmdline_tv_options ===========
[18:00:46] =============== [PASSED] drm_cmdline_parser ================
[18:00:46] ========== drmm_connector_hdmi_init (19 subtests) ==========
[18:00:46] [PASSED] drm_test_connector_hdmi_init_valid
[18:00:46] [PASSED] drm_test_connector_hdmi_init_bpc_8
[18:00:46] [PASSED] drm_test_connector_hdmi_init_bpc_10
[18:00:46] [PASSED] drm_test_connector_hdmi_init_bpc_12
[18:00:46] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[18:00:46] [PASSED] drm_test_connector_hdmi_init_bpc_null
[18:00:46] [PASSED] drm_test_connector_hdmi_init_formats_empty
[18:00:46] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[18:00:46] [PASSED] drm_test_connector_hdmi_init_null_ddc
[18:00:46] [PASSED] drm_test_connector_hdmi_init_null_product
[18:00:46] [PASSED] drm_test_connector_hdmi_init_null_vendor
[18:00:46] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[18:00:46] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[18:00:46] [PASSED] drm_test_connector_hdmi_init_product_valid
[18:00:46] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[18:00:46] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[18:00:46] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[18:00:46] ========= drm_test_connector_hdmi_init_type_valid  =========
[18:00:46] [PASSED] HDMI-A
[18:00:46] [PASSED] HDMI-B
[18:00:46] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[18:00:46] ======== drm_test_connector_hdmi_init_type_invalid  ========
[18:00:46] [PASSED] Unknown
[18:00:46] [PASSED] VGA
[18:00:46] [PASSED] DVI-I
[18:00:46] [PASSED] DVI-D
[18:00:46] [PASSED] DVI-A
[18:00:46] [PASSED] Composite
[18:00:46] [PASSED] SVIDEO
[18:00:46] [PASSED] LVDS
[18:00:46] [PASSED] Component
[18:00:46] [PASSED] DIN
[18:00:46] [PASSED] DP
[18:00:46] [PASSED] TV
[18:00:46] [PASSED] eDP
[18:00:46] [PASSED] Virtual
[18:00:46] [PASSED] DSI
[18:00:46] [PASSED] DPI
[18:00:46] [PASSED] Writeback
[18:00:46] [PASSED] SPI
[18:00:46] [PASSED] USB
[18:00:46] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[18:00:46] ============ [PASSED] drmm_connector_hdmi_init =============
[18:00:46] ============= drmm_connector_init (3 subtests) =============
[18:00:46] [PASSED] drm_test_drmm_connector_init
[18:00:46] [PASSED] drm_test_drmm_connector_init_null_ddc
[18:00:46] ========= drm_test_drmm_connector_init_type_valid  =========
[18:00:46] [PASSED] Unknown
[18:00:46] [PASSED] VGA
[18:00:46] [PASSED] DVI-I
[18:00:46] [PASSED] DVI-D
[18:00:46] [PASSED] DVI-A
[18:00:46] [PASSED] Composite
[18:00:46] [PASSED] SVIDEO
[18:00:46] [PASSED] LVDS
[18:00:46] [PASSED] Component
[18:00:46] [PASSED] DIN
[18:00:46] [PASSED] DP
[18:00:46] [PASSED] HDMI-A
[18:00:46] [PASSED] HDMI-B
[18:00:46] [PASSED] TV
[18:00:46] [PASSED] eDP
[18:00:46] [PASSED] Virtual
[18:00:46] [PASSED] DSI
[18:00:46] [PASSED] DPI
[18:00:46] [PASSED] Writeback
[18:00:46] [PASSED] SPI
[18:00:46] [PASSED] USB
[18:00:46] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[18:00:46] =============== [PASSED] drmm_connector_init ===============
[18:00:46] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[18:00:46] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[18:00:46] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[18:00:46] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[18:00:46] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[18:00:46] ========== drm_test_get_tv_mode_from_name_valid  ===========
[18:00:46] [PASSED] NTSC
[18:00:46] [PASSED] NTSC-443
[18:00:46] [PASSED] NTSC-J
[18:00:46] [PASSED] PAL
[18:00:46] [PASSED] PAL-M
[18:00:46] [PASSED] PAL-N
[18:00:46] [PASSED] SECAM
[18:00:46] [PASSED] Mono
[18:00:46] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[18:00:46] [PASSED] drm_test_get_tv_mode_from_name_truncated
[18:00:46] ============ [PASSED] drm_get_tv_mode_from_name ============
[18:00:46] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[18:00:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[18:00:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[18:00:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[18:00:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[18:00:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[18:00:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[18:00:46] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[18:00:46] [PASSED] VIC 96
[18:00:46] [PASSED] VIC 97
[18:00:46] [PASSED] VIC 101
[18:00:46] [PASSED] VIC 102
[18:00:46] [PASSED] VIC 106
[18:00:46] [PASSED] VIC 107
[18:00:46] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[18:00:46] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[18:00:46] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[18:00:46] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[18:00:46] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[18:00:46] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[18:00:46] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[18:00:46] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[18:00:46] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[18:00:46] [PASSED] Automatic
[18:00:46] [PASSED] Full
[18:00:46] [PASSED] Limited 16:235
[18:00:46] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[18:00:46] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[18:00:46] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[18:00:46] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[18:00:46] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[18:00:46] [PASSED] RGB
[18:00:46] [PASSED] YUV 4:2:0
[18:00:46] [PASSED] YUV 4:2:2
[18:00:46] [PASSED] YUV 4:4:4
[18:00:46] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[18:00:46] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[18:00:46] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[18:00:46] ============= drm_damage_helper (21 subtests) ==============
[18:00:46] [PASSED] drm_test_damage_iter_no_damage
[18:00:46] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[18:00:46] [PASSED] drm_test_damage_iter_no_damage_src_moved
[18:00:46] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[18:00:46] [PASSED] drm_test_damage_iter_no_damage_not_visible
[18:00:46] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[18:00:46] [PASSED] drm_test_damage_iter_no_damage_no_fb
[18:00:46] [PASSED] drm_test_damage_iter_simple_damage
[18:00:46] [PASSED] drm_test_damage_iter_single_damage
[18:00:46] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[18:00:46] [PASSED] drm_test_damage_iter_single_damage_outside_src
[18:00:46] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[18:00:46] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[18:00:46] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[18:00:46] [PASSED] drm_test_damage_iter_single_damage_src_moved
[18:00:46] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[18:00:46] [PASSED] drm_test_damage_iter_damage
[18:00:46] [PASSED] drm_test_damage_iter_damage_one_intersect
[18:00:46] [PASSED] drm_test_damage_iter_damage_one_outside
[18:00:46] [PASSED] drm_test_damage_iter_damage_src_moved
[18:00:46] [PASSED] drm_test_damage_iter_damage_not_visible
[18:00:46] ================ [PASSED] drm_damage_helper ================
[18:00:46] ============== drm_dp_mst_helper (3 subtests) ==============
[18:00:46] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[18:00:46] [PASSED] Clock 154000 BPP 30 DSC disabled
[18:00:46] [PASSED] Clock 234000 BPP 30 DSC disabled
[18:00:46] [PASSED] Clock 297000 BPP 24 DSC disabled
[18:00:46] [PASSED] Clock 332880 BPP 24 DSC enabled
[18:00:46] [PASSED] Clock 324540 BPP 24 DSC enabled
[18:00:46] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[18:00:46] ============== drm_test_dp_mst_calc_pbn_div  ===============
[18:00:46] [PASSED] Link rate 2000000 lane count 4
[18:00:46] [PASSED] Link rate 2000000 lane count 2
[18:00:46] [PASSED] Link rate 2000000 lane count 1
[18:00:46] [PASSED] Link rate 1350000 lane count 4
[18:00:46] [PASSED] Link rate 1350000 lane count 2
[18:00:46] [PASSED] Link rate 1350000 lane count 1
[18:00:46] [PASSED] Link rate 1000000 lane count 4
[18:00:46] [PASSED] Link rate 1000000 lane count 2
[18:00:46] [PASSED] Link rate 1000000 lane count 1
[18:00:46] [PASSED] Link rate 810000 lane count 4
[18:00:46] [PASSED] Link rate 810000 lane count 2
[18:00:46] [PASSED] Link rate 810000 lane count 1
[18:00:46] [PASSED] Link rate 540000 lane count 4
[18:00:46] [PASSED] Link rate 540000 lane count 2
[18:00:46] [PASSED] Link rate 540000 lane count 1
[18:00:46] [PASSED] Link rate 270000 lane count 4
[18:00:46] [PASSED] Link rate 270000 lane count 2
[18:00:46] [PASSED] Link rate 270000 lane count 1
[18:00:46] [PASSED] Link rate 162000 lane count 4
[18:00:46] [PASSED] Link rate 162000 lane count 2
[18:00:46] [PASSED] Link rate 162000 lane count 1
[18:00:46] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[18:00:46] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[18:00:46] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[18:00:46] [PASSED] DP_POWER_UP_PHY with port number
[18:00:46] [PASSED] DP_POWER_DOWN_PHY with port number
[18:00:46] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[18:00:46] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[18:00:46] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[18:00:46] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[18:00:46] [PASSED] DP_QUERY_PAYLOAD with port number
[18:00:46] [PASSED] DP_QUERY_PAYLOAD with VCPI
[18:00:46] [PASSED] DP_REMOTE_DPCD_READ with port number
[18:00:46] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[18:00:46] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[18:00:46] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[18:00:46] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[18:00:46] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[18:00:46] [PASSED] DP_REMOTE_I2C_READ with port number
[18:00:46] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[18:00:46] [PASSED] DP_REMOTE_I2C_READ with transactions array
[18:00:46] [PASSED] DP_REMOTE_I2C_WRITE with port number
[18:00:46] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[18:00:46] [PASSED] DP_REMOTE_I2C_WRITE with data array
[18:00:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[18:00:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[18:00:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[18:00:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[18:00:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[18:00:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[18:00:46] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[18:00:46] ================ [PASSED] drm_dp_mst_helper ================
[18:00:46] ================== drm_exec (7 subtests) ===================
[18:00:46] [PASSED] sanitycheck
[18:00:46] [PASSED] test_lock
[18:00:46] [PASSED] test_lock_unlock
[18:00:46] [PASSED] test_duplicates
[18:00:46] [PASSED] test_prepare
[18:00:46] [PASSED] test_prepare_array
[18:00:46] [PASSED] test_multiple_loops
[18:00:46] ==================== [PASSED] drm_exec =====================
[18:00:46] =========== drm_format_helper_test (17 subtests) ===========
[18:00:46] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[18:00:46] [PASSED] single_pixel_source_buffer
[18:00:46] [PASSED] single_pixel_clip_rectangle
[18:00:46] [PASSED] well_known_colors
[18:00:46] [PASSED] destination_pitch
[18:00:46] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[18:00:46] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[18:00:46] [PASSED] single_pixel_source_buffer
[18:00:46] [PASSED] single_pixel_clip_rectangle
[18:00:46] [PASSED] well_known_colors
[18:00:46] [PASSED] destination_pitch
[18:00:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[18:00:46] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[18:00:46] [PASSED] single_pixel_source_buffer
[18:00:46] [PASSED] single_pixel_clip_rectangle
[18:00:46] [PASSED] well_known_colors
[18:00:46] [PASSED] destination_pitch
[18:00:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[18:00:46] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[18:00:46] [PASSED] single_pixel_source_buffer
[18:00:46] [PASSED] single_pixel_clip_rectangle
[18:00:46] [PASSED] well_known_colors
[18:00:46] [PASSED] destination_pitch
[18:00:46] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[18:00:46] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[18:00:46] [PASSED] single_pixel_source_buffer
[18:00:46] [PASSED] single_pixel_clip_rectangle
[18:00:46] [PASSED] well_known_colors
[18:00:46] [PASSED] destination_pitch
[18:00:46] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[18:00:46] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[18:00:46] [PASSED] single_pixel_source_buffer
[18:00:46] [PASSED] single_pixel_clip_rectangle
[18:00:46] [PASSED] well_known_colors
[18:00:46] [PASSED] destination_pitch
[18:00:46] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[18:00:46] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[18:00:46] [PASSED] single_pixel_source_buffer
[18:00:46] [PASSED] single_pixel_clip_rectangle
[18:00:46] [PASSED] well_known_colors
[18:00:46] [PASSED] destination_pitch
[18:00:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[18:00:46] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[18:00:46] [PASSED] single_pixel_source_buffer
[18:00:46] [PASSED] single_pixel_clip_rectangle
[18:00:46] [PASSED] well_known_colors
[18:00:46] [PASSED] destination_pitch
[18:00:46] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[18:00:46] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[18:00:46] [PASSED] single_pixel_source_buffer
[18:00:46] [PASSED] single_pixel_clip_rectangle
[18:00:46] [PASSED] well_known_colors
[18:00:46] [PASSED] destination_pitch
[18:00:46] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[18:00:46] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[18:00:46] [PASSED] single_pixel_source_buffer
[18:00:46] [PASSED] single_pixel_clip_rectangle
[18:00:46] [PASSED] well_known_colors
[18:00:46] [PASSED] destination_pitch
[18:00:46] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[18:00:46] ============== drm_test_fb_xrgb8888_to_mono  ===============
[18:00:46] [PASSED] single_pixel_source_buffer
[18:00:46] [PASSED] single_pixel_clip_rectangle
[18:00:46] [PASSED] well_known_colors
[18:00:46] [PASSED] destination_pitch
[18:00:46] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[18:00:46] ==================== drm_test_fb_swab  =====================
[18:00:46] [PASSED] single_pixel_source_buffer
[18:00:46] [PASSED] single_pixel_clip_rectangle
[18:00:46] [PASSED] well_known_colors
[18:00:46] [PASSED] destination_pitch
[18:00:46] ================ [PASSED] drm_test_fb_swab =================
[18:00:46] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[18:00:46] [PASSED] single_pixel_source_buffer
[18:00:46] [PASSED] single_pixel_clip_rectangle
[18:00:46] [PASSED] well_known_colors
[18:00:46] [PASSED] destination_pitch
[18:00:46] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[18:00:46] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[18:00:46] [PASSED] single_pixel_source_buffer
[18:00:46] [PASSED] single_pixel_clip_rectangle
[18:00:46] [PASSED] well_known_colors
[18:00:46] [PASSED] destination_pitch
[18:00:46] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[18:00:46] ================= drm_test_fb_clip_offset  =================
[18:00:46] [PASSED] pass through
[18:00:46] [PASSED] horizontal offset
[18:00:46] [PASSED] vertical offset
[18:00:46] [PASSED] horizontal and vertical offset
[18:00:46] [PASSED] horizontal offset (custom pitch)
[18:00:46] [PASSED] vertical offset (custom pitch)
[18:00:46] [PASSED] horizontal and vertical offset (custom pitch)
[18:00:46] ============= [PASSED] drm_test_fb_clip_offset =============
[18:00:46] ============== drm_test_fb_build_fourcc_list  ==============
[18:00:46] [PASSED] no native formats
[18:00:46] [PASSED] XRGB8888 as native format
[18:00:46] [PASSED] remove duplicates
[18:00:46] [PASSED] convert alpha formats
[18:00:46] [PASSED] random formats
[18:00:46] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[18:00:46] =================== drm_test_fb_memcpy  ====================
[18:00:46] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[18:00:46] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[18:00:46] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[18:00:46] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[18:00:46] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[18:00:46] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[18:00:46] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[18:00:46] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[18:00:46] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[18:00:46] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[18:00:46] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[18:00:46] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[18:00:46] =============== [PASSED] drm_test_fb_memcpy ================
[18:00:46] ============= [PASSED] drm_format_helper_test ==============
[18:00:46] ================= drm_format (18 subtests) =================
[18:00:46] [PASSED] drm_test_format_block_width_invalid
[18:00:46] [PASSED] drm_test_format_block_width_one_plane
[18:00:46] [PASSED] drm_test_format_block_width_two_plane
[18:00:46] [PASSED] drm_test_format_block_width_three_plane
[18:00:46] [PASSED] drm_test_format_block_width_tiled
[18:00:46] [PASSED] drm_test_format_block_height_invalid
[18:00:46] [PASSED] drm_test_format_block_height_one_plane
[18:00:46] [PASSED] drm_test_format_block_height_two_plane
[18:00:46] [PASSED] drm_test_format_block_height_three_plane
[18:00:46] [PASSED] drm_test_format_block_height_tiled
[18:00:46] [PASSED] drm_test_format_min_pitch_invalid
[18:00:46] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[18:00:46] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[18:00:46] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[18:00:46] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[18:00:46] [PASSED] drm_test_format_min_pitch_two_plane
[18:00:46] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[18:00:46] [PASSED] drm_test_format_min_pitch_tiled
[18:00:46] =================== [PASSED] drm_format ====================
[18:00:46] =============== drm_framebuffer (1 subtest) ================
[18:00:46] =============== drm_test_framebuffer_create  ===============
[18:00:46] [PASSED] ABGR8888 normal sizes
[18:00:46] [PASSED] ABGR8888 max sizes
[18:00:46] [PASSED] ABGR8888 pitch greater than min required
[18:00:46] [PASSED] ABGR8888 pitch less than min required
[18:00:46] [PASSED] ABGR8888 Invalid width
[18:00:46] [PASSED] ABGR8888 Invalid buffer handle
[18:00:46] [PASSED] No pixel format
[18:00:46] [PASSED] ABGR8888 Width 0
[18:00:46] [PASSED] ABGR8888 Height 0
[18:00:46] [PASSED] ABGR8888 Out of bound height * pitch combination
[18:00:46] [PASSED] ABGR8888 Large buffer offset
[18:00:46] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[18:00:46] [PASSED] ABGR8888 Valid buffer modifier
[18:00:46] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[18:00:46] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[18:00:46] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[18:00:46] [PASSED] NV12 Normal sizes
[18:00:46] [PASSED] NV12 Max sizes
[18:00:46] [PASSED] NV12 Invalid pitch
[18:00:46] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[18:00:46] [PASSED] NV12 different  modifier per-plane
[18:00:46] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[18:00:46] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[18:00:46] [PASSED] NV12 Modifier for inexistent plane
[18:00:46] [PASSED] NV12 Handle for inexistent plane
[18:00:46] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[18:00:46] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[18:00:46] [PASSED] YVU420 Normal sizes
[18:00:46] [PASSED] YVU420 Max sizes
[18:00:46] [PASSED] YVU420 Invalid pitch
[18:00:46] [PASSED] YVU420 Different pitches
[18:00:46] [PASSED] YVU420 Different buffer offsets/pitches
[18:00:46] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[18:00:46] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[18:00:46] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[18:00:46] [PASSED] YVU420 Valid modifier
[18:00:46] [PASSED] YVU420 Different modifiers per plane
[18:00:46] [PASSED] YVU420 Modifier for inexistent plane
[18:00:46] [PASSED] X0L2 Normal sizes
[18:00:46] [PASSED] X0L2 Max sizes
[18:00:46] [PASSED] X0L2 Invalid pitch
[18:00:46] [PASSED] X0L2 Pitch greater than minimum required
[18:00:46] [PASSED] X0L2 Handle for inexistent plane
[18:00:46] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[18:00:46] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[18:00:46] [PASSED] X0L2 Valid modifier
[18:00:46] [PASSED] X0L2 Modifier for inexistent plane
[18:00:46] =========== [PASSED] drm_test_framebuffer_create ===========
[18:00:46] ================= [PASSED] drm_framebuffer =================
[18:00:46] ================ drm_gem_shmem (8 subtests) ================
[18:00:46] [PASSED] drm_gem_shmem_test_obj_create
[18:00:46] [PASSED] drm_gem_shmem_test_obj_create_private
[18:00:46] [PASSED] drm_gem_shmem_test_pin_pages
[18:00:46] [PASSED] drm_gem_shmem_test_vmap
[18:00:46] [PASSED] drm_gem_shmem_test_get_pages_sgt
[18:00:46] [PASSED] drm_gem_shmem_test_get_sg_table
[18:00:46] [PASSED] drm_gem_shmem_test_madvise
[18:00:46] [PASSED] drm_gem_shmem_test_purge
[18:00:46] ================== [PASSED] drm_gem_shmem ==================
[18:00:46] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[18:00:46] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[18:00:46] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[18:00:46] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[18:00:46] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[18:00:46] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[18:00:46] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[18:00:46] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[18:00:46] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[18:00:46] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[18:00:46] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[18:00:46] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[18:00:46] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[18:00:46] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[18:00:46] [PASSED] drm_test_check_output_bpc_dvi
[18:00:46] [PASSED] drm_test_check_output_bpc_format_vic_1
[18:00:46] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[18:00:46] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[18:00:46] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[18:00:46] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[18:00:46] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[18:00:46] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[18:00:46] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[18:00:46] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[18:00:46] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[18:00:46] [PASSED] drm_test_check_broadcast_rgb_value
[18:00:46] [PASSED] drm_test_check_bpc_8_value
[18:00:46] [PASSED] drm_test_check_bpc_10_value
[18:00:46] [PASSED] drm_test_check_bpc_12_value
[18:00:46] [PASSED] drm_test_check_format_value
[18:00:46] [PASSED] drm_test_check_tmds_char_value
[18:00:46] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[18:00:46] ================= drm_managed (2 subtests) =================
[18:00:46] [PASSED] drm_test_managed_release_action
[18:00:46] [PASSED] drm_test_managed_run_action
[18:00:46] =================== [PASSED] drm_managed ===================
[18:00:46] =================== drm_mm (6 subtests) ====================
[18:00:46] [PASSED] drm_test_mm_init
[18:00:46] [PASSED] drm_test_mm_debug
[18:00:46] [PASSED] drm_test_mm_align32
[18:00:46] [PASSED] drm_test_mm_align64
[18:00:46] [PASSED] drm_test_mm_lowest
[18:00:46] [PASSED] drm_test_mm_highest
[18:00:46] ===================== [PASSED] drm_mm ======================
[18:00:46] ============= drm_modes_analog_tv (5 subtests) =============
[18:00:46] [PASSED] drm_test_modes_analog_tv_mono_576i
[18:00:46] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[18:00:46] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[18:00:46] [PASSED] drm_test_modes_analog_tv_pal_576i
[18:00:46] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[18:00:46] =============== [PASSED] drm_modes_analog_tv ===============
[18:00:46] ============== drm_plane_helper (2 subtests) ===============
[18:00:46] =============== drm_test_check_plane_state  ================
[18:00:46] [PASSED] clipping_simple
[18:00:46] [PASSED] clipping_rotate_reflect
[18:00:46] [PASSED] positioning_simple
[18:00:46] [PASSED] upscaling
[18:00:46] [PASSED] downscaling
[18:00:46] [PASSED] rounding1
[18:00:46] [PASSED] rounding2
[18:00:46] [PASSED] rounding3
[18:00:46] [PASSED] rounding4
[18:00:46] =========== [PASSED] drm_test_check_plane_state ============
[18:00:46] =========== drm_test_check_invalid_plane_state  ============
[18:00:46] [PASSED] positioning_invalid
[18:00:46] [PASSED] upscaling_invalid
stty: 'standard input': Inappropriate ioctl for device
[18:00:46] [PASSED] downscaling_invalid
[18:00:46] ======= [PASSED] drm_test_check_invalid_plane_state ========
[18:00:46] ================ [PASSED] drm_plane_helper =================
[18:00:46] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[18:00:46] ====== drm_test_connector_helper_tv_get_modes_check  =======
[18:00:46] [PASSED] None
[18:00:46] [PASSED] PAL
[18:00:46] [PASSED] NTSC
[18:00:46] [PASSED] Both, NTSC Default
[18:00:46] [PASSED] Both, PAL Default
[18:00:46] [PASSED] Both, NTSC Default, with PAL on command-line
[18:00:46] [PASSED] Both, PAL Default, with NTSC on command-line
[18:00:46] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[18:00:46] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[18:00:46] ================== drm_rect (9 subtests) ===================
[18:00:46] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[18:00:46] [PASSED] drm_test_rect_clip_scaled_not_clipped
[18:00:46] [PASSED] drm_test_rect_clip_scaled_clipped
[18:00:46] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[18:00:46] ================= drm_test_rect_intersect  =================
[18:00:46] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[18:00:46] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[18:00:46] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[18:00:46] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[18:00:46] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[18:00:46] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[18:00:46] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[18:00:46] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[18:00:46] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[18:00:46] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[18:00:46] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[18:00:46] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[18:00:46] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[18:00:46] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[18:00:46] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[18:00:46] ============= [PASSED] drm_test_rect_intersect =============
[18:00:46] ================ drm_test_rect_calc_hscale  ================
[18:00:46] [PASSED] normal use
[18:00:46] [PASSED] out of max range
[18:00:46] [PASSED] out of min range
[18:00:46] [PASSED] zero dst
[18:00:46] [PASSED] negative src
[18:00:46] [PASSED] negative dst
[18:00:46] ============ [PASSED] drm_test_rect_calc_hscale ============
[18:00:46] ================ drm_test_rect_calc_vscale  ================
[18:00:46] [PASSED] normal use
[18:00:46] [PASSED] out of max range
[18:00:46] [PASSED] out of min range
[18:00:46] [PASSED] zero dst
[18:00:46] [PASSED] negative src
[18:00:46] [PASSED] negative dst
[18:00:46] ============ [PASSED] drm_test_rect_calc_vscale ============
[18:00:46] ================== drm_test_rect_rotate  ===================
[18:00:46] [PASSED] reflect-x
[18:00:46] [PASSED] reflect-y
[18:00:46] [PASSED] rotate-0
[18:00:46] [PASSED] rotate-90
[18:00:46] [PASSED] rotate-180
[18:00:46] [PASSED] rotate-270
[18:00:46] ============== [PASSED] drm_test_rect_rotate ===============
[18:00:46] ================ drm_test_rect_rotate_inv  =================
[18:00:46] [PASSED] reflect-x
[18:00:46] [PASSED] reflect-y
[18:00:46] [PASSED] rotate-0
[18:00:46] [PASSED] rotate-90
[18:00:46] [PASSED] rotate-180
[18:00:46] [PASSED] rotate-270
[18:00:46] ============ [PASSED] drm_test_rect_rotate_inv =============
[18:00:46] ==================== [PASSED] drm_rect =====================
[18:00:46] ============================================================
[18:00:46] Testing complete. Ran 515 tests: passed: 515
[18:00:46] Elapsed time: 23.140s total, 1.737s configuring, 21.233s building, 0.155s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
ERROR:root:In file included from ../include/linux/build_bug.h:5,
                 from ../include/linux/container_of.h:5,
                 from ../include/linux/list.h:5,
                 from ../include/drm/ttm/ttm_resource.h:29,
                 from ../drivers/gpu/drm/ttm/tests/ttm_resource_test.c:5:
../drivers/gpu/drm/ttm/tests/ttm_resource_test.c: In function ‘ttm_resource_init_pinned’:
../drivers/gpu/drm/ttm/tests/ttm_resource_test.c:167:46: error: ‘struct ttm_device’ has no member named ‘pinned’
  167 |  KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
      |                                              ^~
../include/linux/compiler.h:76:40: note: in definition of macro ‘likely’
   76 | # define likely(x) __builtin_expect(!!(x), 1)
      |                                        ^
../include/kunit/test.h:685:2: note: in expansion of macro ‘KUNIT_UNARY_ASSERTION’
  685 |  KUNIT_UNARY_ASSERTION(test,            \
      |  ^~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1260:2: note: in expansion of macro ‘KUNIT_TRUE_MSG_ASSERTION’
 1260 |  KUNIT_TRUE_MSG_ASSERTION(test,            \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1257:2: note: in expansion of macro ‘KUNIT_ASSERT_TRUE_MSG’
 1257 |  KUNIT_ASSERT_TRUE_MSG(test, condition, NULL)
      |  ^~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/tests/ttm_resource_test.c:167:2: note: in expansion of macro ‘KUNIT_ASSERT_TRUE’
  167 |  KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
      |  ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/tests/ttm_resource_test.c:172:52: error: ‘struct ttm_device’ has no member named ‘pinned’
  172 |  KUNIT_ASSERT_TRUE(test, list_is_singular(&bo->bdev->pinned));
      |                                                    ^~
../include/linux/compiler.h:76:40: note: in definition of macro ‘likely’
   76 | # define likely(x) __builtin_expect(!!(x), 1)
      |                                        ^
../include/kunit/test.h:685:2: note: in expansion of macro ‘KUNIT_UNARY_ASSERTION’
  685 |  KUNIT_UNARY_ASSERTION(test,            \
      |  ^~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1260:2: note: in expansion of macro ‘KUNIT_TRUE_MSG_ASSERTION’
 1260 |  KUNIT_TRUE_MSG_ASSERTION(test,            \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1257:2: note: in expansion of macro ‘KUNIT_ASSERT_TRUE_MSG’
 1257 |  KUNIT_ASSERT_TRUE_MSG(test, condition, NULL)
      |  ^~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/tests/ttm_resource_test.c:172:2: note: in expansion of macro ‘KUNIT_ASSERT_TRUE’
  172 |  KUNIT_ASSERT_TRUE(test, list_is_singular(&bo->bdev->pinned));
      |  ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/tests/ttm_resource_test.c:178:46: error: ‘struct ttm_device’ has no member named ‘pinned’
  178 |  KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
      |                                              ^~
../include/linux/compiler.h:76:40: note: in definition of macro ‘likely’
   76 | # define likely(x) __builtin_expect(!!(x), 1)
      |                                        ^
../include/kunit/test.h:685:2: note: in expansion of macro ‘KUNIT_UNARY_ASSERTION’
  685 |  KUNIT_UNARY_ASSERTION(test,            \
      |  ^~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1260:2: note: in expansion of macro ‘KUNIT_TRUE_MSG_ASSERTION’
 1260 |  KUNIT_TRUE_MSG_ASSERTION(test,            \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1257:2: note: in expansion of macro ‘KUNIT_ASSERT_TRUE_MSG’
 1257 |  KUNIT_ASSERT_TRUE_MSG(test, condition, NULL)
      |  ^~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/tests/ttm_resource_test.c:178:2: note: in expansion of macro ‘KUNIT_ASSERT_TRUE’
  178 |  KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
      |  ^~~~~~~~~~~~~~~~~
make[8]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/ttm/tests/ttm_resource_test.o] Error 1
make[8]: *** Waiting for unfinished jobs....
In file included from ../include/drm/drm_kunit_helpers.h:10,
                 from ../drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h:13,
                 from ../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:17:
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c: In function ‘ttm_bo_unreserve_pinned’:
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:311:48: error: ‘struct ttm_device’ has no member named ‘pinned’
  311 |    list_is_last(&res2->lru.link, &priv->ttm_dev->pinned), 1);
      |                                                ^~
../include/kunit/test.h:724:15: note: in definition of macro ‘KUNIT_BASE_BINARY_ASSERTION’
  724 |  const typeof(left) __left = (left);           \
      |               ^~~~
../include/kunit/test.h:1299:2: note: in expansion of macro ‘KUNIT_BINARY_INT_ASSERTION’
 1299 |  KUNIT_BINARY_INT_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1296:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ_MSG’
 1296 |  KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
      |  ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:310:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ’
  310 |  KUNIT_ASSERT_EQ(test,
      |  ^~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:311:48: error: ‘struct ttm_device’ has no member named ‘pinned’
  311 |    list_is_last(&res2->lru.link, &priv->ttm_dev->pinned), 1);
      |                                                ^~
../include/kunit/test.h:724:31: note: in definition of macro ‘KUNIT_BASE_BINARY_ASSERTION’
  724 |  const typeof(left) __left = (left);           \
      |                               ^~~~
../include/kunit/test.h:1299:2: note: in expansion of macro ‘KUNIT_BINARY_INT_ASSERTION’
 1299 |  KUNIT_BINARY_INT_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1296:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ_MSG’
 1296 |  KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
      |  ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:310:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ’
  310 |  KUNIT_ASSERT_EQ(test,
      |  ^~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:315:48: error: ‘struct ttm_device’ has no member named ‘pinned’
  315 |    list_is_last(&res1->lru.link, &priv->ttm_dev->pinned), 1);
      |                                                ^~
../include/kunit/test.h:724:15: note: in definition of macro ‘KUNIT_BASE_BINARY_ASSERTION’
  724 |  const typeof(left) __left = (left);           \
      |               ^~~~
../include/kunit/test.h:1299:2: note: in expansion of macro ‘KUNIT_BINARY_INT_ASSERTION’
 1299 |  KUNIT_BINARY_INT_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1296:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ_MSG’
 1296 |  KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
      |  ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:314:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ’
  314 |  KUNIT_ASSERT_EQ(test,
      |  ^~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:315:48: error: ‘struct ttm_device’ has no member named ‘pinned’
  315 |    list_is_last(&res1->lru.link, &priv->ttm_dev->pinned), 1);
      |                                                ^~
../include/kunit/test.h:724:31: note: in definition of macro ‘KUNIT_BASE_BINARY_ASSERTION’
  724 |  const typeof(left) __left = (left);           \
      |                               ^~~~
../include/kunit/test.h:1299:2: note: in expansion of macro ‘KUNIT_BINARY_INT_ASSERTION’
 1299 |  KUNIT_BINARY_INT_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1296:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ_MSG’
 1296 |  KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
      |  ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:314:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ’
  314 |  KUNIT_ASSERT_EQ(test,
      |  ^~~~~~~~~~~~~~~
make[8]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/ttm/tests/ttm_bo_test.o] Error 1
make[7]: *** [../scripts/Makefile.build:485: drivers/gpu/drm/ttm/tests] Error 2
make[6]: *** [../scripts/Makefile.build:485: drivers/gpu/drm/ttm] Error 2
make[5]: *** [../scripts/Makefile.build:485: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:485: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:485: drivers] Error 2
make[2]: *** [/kernel/Makefile:1925: .] Error 2
make[1]: *** [/kernel/Makefile:224: __sub-make] Error 2
make: *** [Makefile:224: __sub-make] Error 2

[18:00:46] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:00:48] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


