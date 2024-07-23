Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E066C3DA70
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 01:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAEC10E1CD;
	Tue, 23 Jul 2024 01:08:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D6710E1CD;
 Tue, 23 Jul 2024 01:08:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Fix_xe=5Fpt=5Fabort?=
 =?utf-8?q?=5Funbind?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Jul 2024 01:08:07 -0000
Message-ID: <172169688741.358523.14392029635719647392@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240723010230.1652707-1-matthew.brost@intel.com>
In-Reply-To: <20240723010230.1652707-1-matthew.brost@intel.com>
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

Series: drm/xe: Fix xe_pt_abort_unbind
URL   : https://patchwork.freedesktop.org/series/136363/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[01:06:59] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:07:03] Building KUnit Kernel ...
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

[01:07:28] Starting KUnit Kernel (1/1)...
[01:07:28] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:07:29] =================== guc_dbm (7 subtests) ===================
[01:07:29] [PASSED] test_empty
[01:07:29] [PASSED] test_default
[01:07:29] ======================== test_size  ========================
[01:07:29] [PASSED] 4
[01:07:29] [PASSED] 8
[01:07:29] [PASSED] 32
[01:07:29] [PASSED] 256
[01:07:29] ==================== [PASSED] test_size ====================
[01:07:29] ======================= test_reuse  ========================
[01:07:29] [PASSED] 4
[01:07:29] [PASSED] 8
[01:07:29] [PASSED] 32
[01:07:29] [PASSED] 256
[01:07:29] =================== [PASSED] test_reuse ====================
[01:07:29] =================== test_range_overlap  ====================
[01:07:29] [PASSED] 4
[01:07:29] [PASSED] 8
[01:07:29] [PASSED] 32
[01:07:29] [PASSED] 256
[01:07:29] =============== [PASSED] test_range_overlap ================
[01:07:29] =================== test_range_compact  ====================
[01:07:29] [PASSED] 4
[01:07:29] [PASSED] 8
[01:07:29] [PASSED] 32
[01:07:29] [PASSED] 256
[01:07:29] =============== [PASSED] test_range_compact ================
[01:07:29] ==================== test_range_spare  =====================
[01:07:29] [PASSED] 4
[01:07:29] [PASSED] 8
[01:07:29] [PASSED] 32
[01:07:29] [PASSED] 256
[01:07:29] ================ [PASSED] test_range_spare =================
[01:07:29] ===================== [PASSED] guc_dbm =====================
[01:07:29] =================== guc_idm (6 subtests) ===================
[01:07:29] [PASSED] bad_init
[01:07:29] [PASSED] no_init
[01:07:29] [PASSED] init_fini
[01:07:29] [PASSED] check_used
[01:07:29] [PASSED] check_quota
[01:07:29] [PASSED] check_all
[01:07:29] ===================== [PASSED] guc_idm =====================
[01:07:29] ================== no_relay (3 subtests) ===================
[01:07:29] [PASSED] xe_drops_guc2pf_if_not_ready
[01:07:29] [PASSED] xe_drops_guc2vf_if_not_ready
[01:07:29] [PASSED] xe_rejects_send_if_not_ready
[01:07:29] ==================== [PASSED] no_relay =====================
[01:07:29] ================== pf_relay (14 subtests) ==================
[01:07:29] [PASSED] pf_rejects_guc2pf_too_short
[01:07:29] [PASSED] pf_rejects_guc2pf_too_long
[01:07:29] [PASSED] pf_rejects_guc2pf_no_payload
[01:07:29] [PASSED] pf_fails_no_payload
[01:07:29] [PASSED] pf_fails_bad_origin
[01:07:29] [PASSED] pf_fails_bad_type
[01:07:29] [PASSED] pf_txn_reports_error
[01:07:29] [PASSED] pf_txn_sends_pf2guc
[01:07:29] [PASSED] pf_sends_pf2guc
[01:07:29] [SKIPPED] pf_loopback_nop
[01:07:29] [SKIPPED] pf_loopback_echo
[01:07:29] [SKIPPED] pf_loopback_fail
[01:07:29] [SKIPPED] pf_loopback_busy
[01:07:29] [SKIPPED] pf_loopback_retry
[01:07:29] ==================== [PASSED] pf_relay =====================
[01:07:29] ================== vf_relay (3 subtests) ===================
[01:07:29] [PASSED] vf_rejects_guc2vf_too_short
[01:07:29] [PASSED] vf_rejects_guc2vf_too_long
[01:07:29] [PASSED] vf_rejects_guc2vf_no_payload
[01:07:29] ==================== [PASSED] vf_relay =====================
[01:07:29] ================= pf_service (11 subtests) =================
[01:07:29] [PASSED] pf_negotiate_any
[01:07:29] [PASSED] pf_negotiate_base_match
[01:07:29] [PASSED] pf_negotiate_base_newer
[01:07:29] [PASSED] pf_negotiate_base_next
[01:07:29] [SKIPPED] pf_negotiate_base_older
[01:07:29] [PASSED] pf_negotiate_base_prev
[01:07:29] [PASSED] pf_negotiate_latest_match
[01:07:29] [PASSED] pf_negotiate_latest_newer
[01:07:29] [PASSED] pf_negotiate_latest_next
[01:07:29] [SKIPPED] pf_negotiate_latest_older
[01:07:29] [SKIPPED] pf_negotiate_latest_prev
[01:07:29] =================== [PASSED] pf_service ====================
[01:07:29] ===================== lmtt (1 subtest) =====================
[01:07:29] ======================== test_ops  =========================
[01:07:29] [PASSED] 2-level
[01:07:29] [PASSED] multi-level
[01:07:29] ==================== [PASSED] test_ops =====================
[01:07:29] ====================== [PASSED] lmtt =======================
[01:07:29] =================== xe_mocs (2 subtests) ===================
[01:07:29] ================ xe_live_mocs_kernel_kunit  ================
[01:07:29] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[01:07:29] ================ xe_live_mocs_reset_kunit  =================
[01:07:29] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[01:07:29] ==================== [SKIPPED] xe_mocs =====================
[01:07:29] ================= xe_migrate (2 subtests) ==================
[01:07:29] ================= xe_migrate_sanity_kunit  =================
[01:07:29] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[01:07:29] ================== xe_validate_ccs_kunit  ==================
[01:07:29] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[01:07:29] =================== [SKIPPED] xe_migrate ===================
[01:07:29] ================== xe_dma_buf (1 subtest) ==================
[01:07:29] ==================== xe_dma_buf_kunit  =====================
[01:07:29] ================ [SKIPPED] xe_dma_buf_kunit ================
[01:07:29] =================== [SKIPPED] xe_dma_buf ===================
[01:07:29] ==================== xe_bo (2 subtests) ====================
[01:07:29] ================== xe_ccs_migrate_kunit  ===================
[01:07:29] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[01:07:29] ==================== xe_bo_evict_kunit  ====================
[01:07:29] =============== [SKIPPED] xe_bo_evict_kunit ================
[01:07:29] ===================== [SKIPPED] xe_bo ======================
[01:07:29] ==================== args (11 subtests) ====================
[01:07:29] [PASSED] count_args_test
[01:07:29] [PASSED] call_args_example
[01:07:29] [PASSED] call_args_test
[01:07:29] [PASSED] drop_first_arg_example
[01:07:29] [PASSED] drop_first_arg_test
[01:07:29] [PASSED] first_arg_example
[01:07:29] [PASSED] first_arg_test
[01:07:29] [PASSED] last_arg_example
[01:07:29] [PASSED] last_arg_test
[01:07:29] [PASSED] pick_arg_example
[01:07:29] [PASSED] sep_comma_example
[01:07:29] ====================== [PASSED] args =======================
[01:07:29] =================== xe_pci (2 subtests) ====================
stty: 'standard input': Inappropriate ioctl for device
[01:07:29] [PASSED] xe_gmdid_graphics_ip
[01:07:29] [PASSED] xe_gmdid_media_ip
[01:07:29] ===================== [PASSED] xe_pci ======================
[01:07:29] ==================== xe_rtp (1 subtest) ====================
[01:07:29] ================== xe_rtp_process_tests  ===================
[01:07:29] [PASSED] coalesce-same-reg
[01:07:29] [PASSED] no-match-no-add
[01:07:29] [PASSED] match-or
[01:07:29] [PASSED] match-or-xfail
[01:07:29] [PASSED] no-match-no-add-multiple-rules
[01:07:29] [PASSED] two-regs-two-entries
[01:07:29] [PASSED] clr-one-set-other
[01:07:29] [PASSED] set-field
[01:07:29] [PASSED] conflict-duplicate
[01:07:29] [PASSED] conflict-not-disjoint
[01:07:29] [PASSED] conflict-reg-type
[01:07:29] ============== [PASSED] xe_rtp_process_tests ===============
[01:07:29] ===================== [PASSED] xe_rtp ======================
[01:07:29] ==================== xe_wa (1 subtest) =====================
[01:07:29] ======================== xe_wa_gt  =========================
[01:07:29] [PASSED] TIGERLAKE (B0)
[01:07:29] [PASSED] DG1 (A0)
[01:07:29] [PASSED] DG1 (B0)
[01:07:29] [PASSED] ALDERLAKE_S (A0)
[01:07:29] [PASSED] ALDERLAKE_S (B0)
[01:07:29] [PASSED] ALDERLAKE_S (C0)
[01:07:29] [PASSED] ALDERLAKE_S (D0)
[01:07:29] [PASSED] ALDERLAKE_P (A0)
[01:07:29] [PASSED] ALDERLAKE_P (B0)
[01:07:29] [PASSED] ALDERLAKE_P (C0)
[01:07:29] [PASSED] ALDERLAKE_S_RPLS (D0)
[01:07:29] [PASSED] ALDERLAKE_P_RPLU (E0)
[01:07:29] [PASSED] DG2_G10 (C0)
[01:07:29] [PASSED] DG2_G11 (B1)
[01:07:29] [PASSED] DG2_G12 (A1)
[01:07:29] [PASSED] METEORLAKE (g:A0, m:A0)
[01:07:29] [PASSED] METEORLAKE (g:A0, m:A0)
[01:07:29] [PASSED] METEORLAKE (g:A0, m:A0)
[01:07:29] [PASSED] LUNARLAKE (g:A0, m:A0)
[01:07:29] [PASSED] LUNARLAKE (g:B0, m:A0)
[01:07:29] ==================== [PASSED] xe_wa_gt =====================
[01:07:29] ====================== [PASSED] xe_wa ======================
[01:07:29] ============================================================
[01:07:29] Testing complete. Ran 112 tests: passed: 97, skipped: 15
[01:07:29] Elapsed time: 29.751s total, 4.278s configuring, 25.252s building, 0.208s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[01:07:29] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:07:30] Building KUnit Kernel ...
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

[01:07:52] Starting KUnit Kernel (1/1)...
[01:07:52] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:07:52] ============ drm_test_pick_cmdline (2 subtests) ============
[01:07:52] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[01:07:52] =============== drm_test_pick_cmdline_named  ===============
[01:07:52] [PASSED] NTSC
[01:07:52] [PASSED] NTSC-J
[01:07:52] [PASSED] PAL
[01:07:52] [PASSED] PAL-M
[01:07:52] =========== [PASSED] drm_test_pick_cmdline_named ===========
[01:07:52] ============== [PASSED] drm_test_pick_cmdline ==============
[01:07:52] ================== drm_buddy (7 subtests) ==================
[01:07:52] [PASSED] drm_test_buddy_alloc_limit
[01:07:52] [PASSED] drm_test_buddy_alloc_optimistic
[01:07:52] [PASSED] drm_test_buddy_alloc_pessimistic
[01:07:52] [PASSED] drm_test_buddy_alloc_pathological
[01:07:52] [PASSED] drm_test_buddy_alloc_contiguous
[01:07:52] [PASSED] drm_test_buddy_alloc_clear
[01:07:52] [PASSED] drm_test_buddy_alloc_range_bias
[01:07:52] ==================== [PASSED] drm_buddy ====================
[01:07:52] ============= drm_cmdline_parser (40 subtests) =============
[01:07:52] [PASSED] drm_test_cmdline_force_d_only
[01:07:52] [PASSED] drm_test_cmdline_force_D_only_dvi
[01:07:52] [PASSED] drm_test_cmdline_force_D_only_hdmi
[01:07:52] [PASSED] drm_test_cmdline_force_D_only_not_digital
[01:07:52] [PASSED] drm_test_cmdline_force_e_only
[01:07:52] [PASSED] drm_test_cmdline_res
[01:07:52] [PASSED] drm_test_cmdline_res_vesa
[01:07:52] [PASSED] drm_test_cmdline_res_vesa_rblank
[01:07:52] [PASSED] drm_test_cmdline_res_rblank
[01:07:52] [PASSED] drm_test_cmdline_res_bpp
[01:07:52] [PASSED] drm_test_cmdline_res_refresh
[01:07:52] [PASSED] drm_test_cmdline_res_bpp_refresh
[01:07:52] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[01:07:52] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[01:07:52] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[01:07:52] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[01:07:52] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[01:07:52] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[01:07:52] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[01:07:52] [PASSED] drm_test_cmdline_res_margins_force_on
[01:07:52] [PASSED] drm_test_cmdline_res_vesa_margins
[01:07:52] [PASSED] drm_test_cmdline_name
[01:07:52] [PASSED] drm_test_cmdline_name_bpp
[01:07:52] [PASSED] drm_test_cmdline_name_option
[01:07:52] [PASSED] drm_test_cmdline_name_bpp_option
[01:07:52] [PASSED] drm_test_cmdline_rotate_0
[01:07:52] [PASSED] drm_test_cmdline_rotate_90
[01:07:52] [PASSED] drm_test_cmdline_rotate_180
[01:07:52] [PASSED] drm_test_cmdline_rotate_270
[01:07:52] [PASSED] drm_test_cmdline_hmirror
[01:07:52] [PASSED] drm_test_cmdline_vmirror
[01:07:52] [PASSED] drm_test_cmdline_margin_options
[01:07:52] [PASSED] drm_test_cmdline_multiple_options
[01:07:52] [PASSED] drm_test_cmdline_bpp_extra_and_option
[01:07:52] [PASSED] drm_test_cmdline_extra_and_option
[01:07:52] [PASSED] drm_test_cmdline_freestanding_options
[01:07:52] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[01:07:52] [PASSED] drm_test_cmdline_panel_orientation
[01:07:52] ================ drm_test_cmdline_invalid  =================
[01:07:52] [PASSED] margin_only
[01:07:52] [PASSED] interlace_only
[01:07:52] [PASSED] res_missing_x
[01:07:52] [PASSED] res_missing_y
[01:07:52] [PASSED] res_bad_y
[01:07:52] [PASSED] res_missing_y_bpp
[01:07:52] [PASSED] res_bad_bpp
[01:07:52] [PASSED] res_bad_refresh
[01:07:52] [PASSED] res_bpp_refresh_force_on_off
[01:07:52] [PASSED] res_invalid_mode
[01:07:52] [PASSED] res_bpp_wrong_place_mode
[01:07:52] [PASSED] name_bpp_refresh
[01:07:52] [PASSED] name_refresh
[01:07:52] [PASSED] name_refresh_wrong_mode
[01:07:52] [PASSED] name_refresh_invalid_mode
[01:07:52] [PASSED] rotate_multiple
[01:07:52] [PASSED] rotate_invalid_val
[01:07:52] [PASSED] rotate_truncated
[01:07:52] [PASSED] invalid_option
[01:07:52] [PASSED] invalid_tv_option
[01:07:52] [PASSED] truncated_tv_option
[01:07:52] ============ [PASSED] drm_test_cmdline_invalid =============
[01:07:52] =============== drm_test_cmdline_tv_options  ===============
[01:07:52] [PASSED] NTSC
[01:07:52] [PASSED] NTSC_443
[01:07:52] [PASSED] NTSC_J
[01:07:52] [PASSED] PAL
[01:07:52] [PASSED] PAL_M
[01:07:52] [PASSED] PAL_N
[01:07:52] [PASSED] SECAM
[01:07:52] [PASSED] MONO_525
[01:07:52] [PASSED] MONO_625
[01:07:52] =========== [PASSED] drm_test_cmdline_tv_options ===========
[01:07:52] =============== [PASSED] drm_cmdline_parser ================
[01:07:52] ========== drmm_connector_hdmi_init (19 subtests) ==========
[01:07:52] [PASSED] drm_test_connector_hdmi_init_valid
[01:07:52] [PASSED] drm_test_connector_hdmi_init_bpc_8
[01:07:52] [PASSED] drm_test_connector_hdmi_init_bpc_10
[01:07:52] [PASSED] drm_test_connector_hdmi_init_bpc_12
[01:07:52] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[01:07:52] [PASSED] drm_test_connector_hdmi_init_bpc_null
[01:07:52] [PASSED] drm_test_connector_hdmi_init_formats_empty
[01:07:52] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[01:07:52] [PASSED] drm_test_connector_hdmi_init_null_ddc
[01:07:52] [PASSED] drm_test_connector_hdmi_init_null_product
[01:07:52] [PASSED] drm_test_connector_hdmi_init_null_vendor
[01:07:52] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[01:07:52] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[01:07:52] [PASSED] drm_test_connector_hdmi_init_product_valid
[01:07:52] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[01:07:52] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[01:07:52] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[01:07:52] ========= drm_test_connector_hdmi_init_type_valid  =========
[01:07:52] [PASSED] HDMI-A
[01:07:52] [PASSED] HDMI-B
[01:07:52] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[01:07:52] ======== drm_test_connector_hdmi_init_type_invalid  ========
[01:07:52] [PASSED] Unknown
[01:07:52] [PASSED] VGA
[01:07:52] [PASSED] DVI-I
[01:07:52] [PASSED] DVI-D
[01:07:52] [PASSED] DVI-A
[01:07:52] [PASSED] Composite
[01:07:52] [PASSED] SVIDEO
[01:07:52] [PASSED] LVDS
[01:07:52] [PASSED] Component
[01:07:52] [PASSED] DIN
[01:07:52] [PASSED] DP
[01:07:52] [PASSED] TV
[01:07:52] [PASSED] eDP
[01:07:52] [PASSED] Virtual
[01:07:52] [PASSED] DSI
[01:07:52] [PASSED] DPI
[01:07:52] [PASSED] Writeback
[01:07:52] [PASSED] SPI
[01:07:52] [PASSED] USB
[01:07:52] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[01:07:52] ============ [PASSED] drmm_connector_hdmi_init =============
[01:07:52] ============= drmm_connector_init (3 subtests) =============
[01:07:52] [PASSED] drm_test_drmm_connector_init
[01:07:52] [PASSED] drm_test_drmm_connector_init_null_ddc
[01:07:52] ========= drm_test_drmm_connector_init_type_valid  =========
[01:07:52] [PASSED] Unknown
[01:07:52] [PASSED] VGA
[01:07:52] [PASSED] DVI-I
[01:07:52] [PASSED] DVI-D
[01:07:52] [PASSED] DVI-A
[01:07:52] [PASSED] Composite
[01:07:52] [PASSED] SVIDEO
[01:07:52] [PASSED] LVDS
[01:07:52] [PASSED] Component
[01:07:52] [PASSED] DIN
[01:07:52] [PASSED] DP
[01:07:52] [PASSED] HDMI-A
[01:07:52] [PASSED] HDMI-B
[01:07:52] [PASSED] TV
[01:07:52] [PASSED] eDP
[01:07:52] [PASSED] Virtual
[01:07:52] [PASSED] DSI
[01:07:52] [PASSED] DPI
[01:07:52] [PASSED] Writeback
[01:07:52] [PASSED] SPI
[01:07:52] [PASSED] USB
[01:07:52] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[01:07:52] =============== [PASSED] drmm_connector_init ===============
[01:07:52] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[01:07:52] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[01:07:52] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[01:07:52] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[01:07:52] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[01:07:52] ========== drm_test_get_tv_mode_from_name_valid  ===========
[01:07:52] [PASSED] NTSC
[01:07:52] [PASSED] NTSC-443
[01:07:52] [PASSED] NTSC-J
[01:07:52] [PASSED] PAL
[01:07:52] [PASSED] PAL-M
[01:07:52] [PASSED] PAL-N
[01:07:52] [PASSED] SECAM
[01:07:52] [PASSED] Mono
[01:07:52] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[01:07:52] [PASSED] drm_test_get_tv_mode_from_name_truncated
[01:07:52] ============ [PASSED] drm_get_tv_mode_from_name ============
[01:07:52] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[01:07:52] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[01:07:52] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[01:07:52] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[01:07:52] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[01:07:52] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[01:07:52] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[01:07:52] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[01:07:52] [PASSED] VIC 96
[01:07:52] [PASSED] VIC 97
[01:07:52] [PASSED] VIC 101
[01:07:52] [PASSED] VIC 102
[01:07:52] [PASSED] VIC 106
[01:07:52] [PASSED] VIC 107
[01:07:52] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[01:07:52] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[01:07:52] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[01:07:52] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[01:07:52] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[01:07:52] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[01:07:52] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[01:07:52] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[01:07:52] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[01:07:52] [PASSED] Automatic
[01:07:52] [PASSED] Full
[01:07:52] [PASSED] Limited 16:235
[01:07:52] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[01:07:52] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[01:07:52] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[01:07:52] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[01:07:52] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[01:07:52] [PASSED] RGB
[01:07:52] [PASSED] YUV 4:2:0
[01:07:52] [PASSED] YUV 4:2:2
[01:07:52] [PASSED] YUV 4:4:4
[01:07:52] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[01:07:52] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[01:07:52] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[01:07:52] ============= drm_damage_helper (21 subtests) ==============
[01:07:52] [PASSED] drm_test_damage_iter_no_damage
[01:07:52] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[01:07:52] [PASSED] drm_test_damage_iter_no_damage_src_moved
[01:07:52] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[01:07:52] [PASSED] drm_test_damage_iter_no_damage_not_visible
[01:07:52] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[01:07:52] [PASSED] drm_test_damage_iter_no_damage_no_fb
[01:07:52] [PASSED] drm_test_damage_iter_simple_damage
[01:07:52] [PASSED] drm_test_damage_iter_single_damage
[01:07:52] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[01:07:52] [PASSED] drm_test_damage_iter_single_damage_outside_src
[01:07:52] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[01:07:52] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[01:07:52] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[01:07:52] [PASSED] drm_test_damage_iter_single_damage_src_moved
[01:07:52] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[01:07:52] [PASSED] drm_test_damage_iter_damage
[01:07:52] [PASSED] drm_test_damage_iter_damage_one_intersect
[01:07:52] [PASSED] drm_test_damage_iter_damage_one_outside
[01:07:52] [PASSED] drm_test_damage_iter_damage_src_moved
[01:07:52] [PASSED] drm_test_damage_iter_damage_not_visible
[01:07:52] ================ [PASSED] drm_damage_helper ================
[01:07:52] ============== drm_dp_mst_helper (3 subtests) ==============
[01:07:52] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[01:07:52] [PASSED] Clock 154000 BPP 30 DSC disabled
[01:07:52] [PASSED] Clock 234000 BPP 30 DSC disabled
[01:07:52] [PASSED] Clock 297000 BPP 24 DSC disabled
[01:07:52] [PASSED] Clock 332880 BPP 24 DSC enabled
[01:07:52] [PASSED] Clock 324540 BPP 24 DSC enabled
[01:07:52] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[01:07:52] ============== drm_test_dp_mst_calc_pbn_div  ===============
[01:07:52] [PASSED] Link rate 2000000 lane count 4
[01:07:52] [PASSED] Link rate 2000000 lane count 2
[01:07:52] [PASSED] Link rate 2000000 lane count 1
[01:07:52] [PASSED] Link rate 1350000 lane count 4
[01:07:52] [PASSED] Link rate 1350000 lane count 2
[01:07:52] [PASSED] Link rate 1350000 lane count 1
[01:07:52] [PASSED] Link rate 1000000 lane count 4
[01:07:52] [PASSED] Link rate 1000000 lane count 2
[01:07:52] [PASSED] Link rate 1000000 lane count 1
[01:07:52] [PASSED] Link rate 810000 lane count 4
[01:07:52] [PASSED] Link rate 810000 lane count 2
[01:07:52] [PASSED] Link rate 810000 lane count 1
[01:07:52] [PASSED] Link rate 540000 lane count 4
[01:07:52] [PASSED] Link rate 540000 lane count 2
[01:07:52] [PASSED] Link rate 540000 lane count 1
[01:07:52] [PASSED] Link rate 270000 lane count 4
[01:07:52] [PASSED] Link rate 270000 lane count 2
[01:07:52] [PASSED] Link rate 270000 lane count 1
[01:07:52] [PASSED] Link rate 162000 lane count 4
[01:07:52] [PASSED] Link rate 162000 lane count 2
[01:07:52] [PASSED] Link rate 162000 lane count 1
[01:07:52] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[01:07:52] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[01:07:52] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[01:07:52] [PASSED] DP_POWER_UP_PHY with port number
[01:07:52] [PASSED] DP_POWER_DOWN_PHY with port number
[01:07:52] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[01:07:52] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[01:07:52] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[01:07:52] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[01:07:52] [PASSED] DP_QUERY_PAYLOAD with port number
[01:07:52] [PASSED] DP_QUERY_PAYLOAD with VCPI
[01:07:52] [PASSED] DP_REMOTE_DPCD_READ with port number
[01:07:52] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[01:07:52] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[01:07:52] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[01:07:52] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[01:07:52] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[01:07:52] [PASSED] DP_REMOTE_I2C_READ with port number
[01:07:52] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[01:07:52] [PASSED] DP_REMOTE_I2C_READ with transactions array
[01:07:52] [PASSED] DP_REMOTE_I2C_WRITE with port number
[01:07:52] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[01:07:52] [PASSED] DP_REMOTE_I2C_WRITE with data array
[01:07:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[01:07:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[01:07:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[01:07:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[01:07:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[01:07:52] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[01:07:52] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[01:07:52] ================ [PASSED] drm_dp_mst_helper ================
[01:07:52] ================== drm_exec (7 subtests) ===================
[01:07:52] [PASSED] sanitycheck
[01:07:52] [PASSED] test_lock
[01:07:52] [PASSED] test_lock_unlock
[01:07:52] [PASSED] test_duplicates
[01:07:52] [PASSED] test_prepare
[01:07:52] [PASSED] test_prepare_array
[01:07:52] [PASSED] test_multiple_loops
[01:07:52] ==================== [PASSED] drm_exec =====================
[01:07:52] =========== drm_format_helper_test (17 subtests) ===========
[01:07:52] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[01:07:52] [PASSED] single_pixel_source_buffer
[01:07:52] [PASSED] single_pixel_clip_rectangle
[01:07:52] [PASSED] well_known_colors
[01:07:52] [PASSED] destination_pitch
[01:07:52] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[01:07:52] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[01:07:52] [PASSED] single_pixel_source_buffer
[01:07:52] [PASSED] single_pixel_clip_rectangle
[01:07:52] [PASSED] well_known_colors
[01:07:52] [PASSED] destination_pitch
[01:07:52] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[01:07:52] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[01:07:52] [PASSED] single_pixel_source_buffer
[01:07:52] [PASSED] single_pixel_clip_rectangle
[01:07:52] [PASSED] well_known_colors
[01:07:52] [PASSED] destination_pitch
[01:07:52] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[01:07:52] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[01:07:52] [PASSED] single_pixel_source_buffer
[01:07:52] [PASSED] single_pixel_clip_rectangle
[01:07:52] [PASSED] well_known_colors
[01:07:52] [PASSED] destination_pitch
[01:07:52] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[01:07:52] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[01:07:52] [PASSED] single_pixel_source_buffer
[01:07:52] [PASSED] single_pixel_clip_rectangle
[01:07:52] [PASSED] well_known_colors
[01:07:52] [PASSED] destination_pitch
[01:07:52] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[01:07:52] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[01:07:52] [PASSED] single_pixel_source_buffer
[01:07:52] [PASSED] single_pixel_clip_rectangle
[01:07:52] [PASSED] well_known_colors
[01:07:52] [PASSED] destination_pitch
[01:07:52] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[01:07:52] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[01:07:52] [PASSED] single_pixel_source_buffer
[01:07:52] [PASSED] single_pixel_clip_rectangle
[01:07:52] [PASSED] well_known_colors
[01:07:52] [PASSED] destination_pitch
[01:07:52] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[01:07:52] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[01:07:52] [PASSED] single_pixel_source_buffer
[01:07:52] [PASSED] single_pixel_clip_rectangle
[01:07:52] [PASSED] well_known_colors
[01:07:52] [PASSED] destination_pitch
[01:07:52] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[01:07:52] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[01:07:52] [PASSED] single_pixel_source_buffer
[01:07:52] [PASSED] single_pixel_clip_rectangle
[01:07:52] [PASSED] well_known_colors
[01:07:52] [PASSED] destination_pitch
[01:07:52] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[01:07:52] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[01:07:52] [PASSED] single_pixel_source_buffer
[01:07:52] [PASSED] single_pixel_clip_rectangle
[01:07:52] [PASSED] well_known_colors
[01:07:52] [PASSED] destination_pitch
[01:07:52] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[01:07:52] ============== drm_test_fb_xrgb8888_to_mono  ===============
[01:07:52] [PASSED] single_pixel_source_buffer
[01:07:52] [PASSED] single_pixel_clip_rectangle
[01:07:52] [PASSED] well_known_colors
[01:07:52] [PASSED] destination_pitch
[01:07:52] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[01:07:52] ==================== drm_test_fb_swab  =====================
[01:07:52] [PASSED] single_pixel_source_buffer
[01:07:52] [PASSED] single_pixel_clip_rectangle
[01:07:52] [PASSED] well_known_colors
[01:07:52] [PASSED] destination_pitch
[01:07:52] ================ [PASSED] drm_test_fb_swab =================
[01:07:52] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[01:07:52] [PASSED] single_pixel_source_buffer
[01:07:52] [PASSED] single_pixel_clip_rectangle
[01:07:52] [PASSED] well_known_colors
[01:07:52] [PASSED] destination_pitch
[01:07:52] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[01:07:52] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[01:07:52] [PASSED] single_pixel_source_buffer
[01:07:52] [PASSED] single_pixel_clip_rectangle
[01:07:52] [PASSED] well_known_colors
[01:07:52] [PASSED] destination_pitch
[01:07:52] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[01:07:52] ================= drm_test_fb_clip_offset  =================
[01:07:52] [PASSED] pass through
[01:07:52] [PASSED] horizontal offset
[01:07:52] [PASSED] vertical offset
[01:07:52] [PASSED] horizontal and vertical offset
[01:07:52] [PASSED] horizontal offset (custom pitch)
[01:07:52] [PASSED] vertical offset (custom pitch)
[01:07:52] [PASSED] horizontal and vertical offset (custom pitch)
[01:07:52] ============= [PASSED] drm_test_fb_clip_offset =============
[01:07:52] ============== drm_test_fb_build_fourcc_list  ==============
[01:07:52] [PASSED] no native formats
[01:07:52] [PASSED] XRGB8888 as native format
[01:07:52] [PASSED] remove duplicates
[01:07:52] [PASSED] convert alpha formats
[01:07:52] [PASSED] random formats
[01:07:52] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[01:07:52] =================== drm_test_fb_memcpy  ====================
[01:07:52] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[01:07:52] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[01:07:52] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[01:07:52] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[01:07:52] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[01:07:52] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[01:07:52] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[01:07:52] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[01:07:52] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[01:07:52] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[01:07:52] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[01:07:52] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[01:07:52] =============== [PASSED] drm_test_fb_memcpy ================
[01:07:52] ============= [PASSED] drm_format_helper_test ==============
[01:07:52] ================= drm_format (18 subtests) =================
[01:07:52] [PASSED] drm_test_format_block_width_invalid
[01:07:52] [PASSED] drm_test_format_block_width_one_plane
[01:07:52] [PASSED] drm_test_format_block_width_two_plane
[01:07:52] [PASSED] drm_test_format_block_width_three_plane
[01:07:52] [PASSED] drm_test_format_block_width_tiled
[01:07:52] [PASSED] drm_test_format_block_height_invalid
[01:07:52] [PASSED] drm_test_format_block_height_one_plane
[01:07:52] [PASSED] drm_test_format_block_height_two_plane
[01:07:52] [PASSED] drm_test_format_block_height_three_plane
[01:07:52] [PASSED] drm_test_format_block_height_tiled
[01:07:52] [PASSED] drm_test_format_min_pitch_invalid
[01:07:52] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[01:07:52] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[01:07:52] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[01:07:52] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[01:07:52] [PASSED] drm_test_format_min_pitch_two_plane
[01:07:52] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[01:07:52] [PASSED] drm_test_format_min_pitch_tiled
[01:07:52] =================== [PASSED] drm_format ====================
[01:07:52] =============== drm_framebuffer (1 subtest) ================
[01:07:52] =============== drm_test_framebuffer_create  ===============
[01:07:52] [PASSED] ABGR8888 normal sizes
[01:07:52] [PASSED] ABGR8888 max sizes
[01:07:52] [PASSED] ABGR8888 pitch greater than min required
[01:07:52] [PASSED] ABGR8888 pitch less than min required
[01:07:52] [PASSED] ABGR8888 Invalid width
[01:07:52] [PASSED] ABGR8888 Invalid buffer handle
[01:07:52] [PASSED] No pixel format
[01:07:52] [PASSED] ABGR8888 Width 0
[01:07:52] [PASSED] ABGR8888 Height 0
[01:07:52] [PASSED] ABGR8888 Out of bound height * pitch combination
[01:07:52] [PASSED] ABGR8888 Large buffer offset
[01:07:52] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[01:07:52] [PASSED] ABGR8888 Valid buffer modifier
[01:07:52] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[01:07:52] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[01:07:52] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[01:07:52] [PASSED] NV12 Normal sizes
[01:07:52] [PASSED] NV12 Max sizes
[01:07:52] [PASSED] NV12 Invalid pitch
[01:07:52] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[01:07:52] [PASSED] NV12 different  modifier per-plane
[01:07:52] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[01:07:52] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[01:07:52] [PASSED] NV12 Modifier for inexistent plane
[01:07:52] [PASSED] NV12 Handle for inexistent plane
[01:07:52] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[01:07:52] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[01:07:52] [PASSED] YVU420 Normal sizes
[01:07:52] [PASSED] YVU420 Max sizes
[01:07:52] [PASSED] YVU420 Invalid pitch
[01:07:52] [PASSED] YVU420 Different pitches
[01:07:52] [PASSED] YVU420 Different buffer offsets/pitches
[01:07:52] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[01:07:52] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[01:07:52] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[01:07:52] [PASSED] YVU420 Valid modifier
[01:07:52] [PASSED] YVU420 Different modifiers per plane
[01:07:52] [PASSED] YVU420 Modifier for inexistent plane
[01:07:52] [PASSED] X0L2 Normal sizes
[01:07:52] [PASSED] X0L2 Max sizes
[01:07:52] [PASSED] X0L2 Invalid pitch
[01:07:52] [PASSED] X0L2 Pitch greater than minimum required
[01:07:52] [PASSED] X0L2 Handle for inexistent plane
[01:07:52] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[01:07:52] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[01:07:52] [PASSED] X0L2 Valid modifier
[01:07:52] [PASSED] X0L2 Modifier for inexistent plane
[01:07:52] =========== [PASSED] drm_test_framebuffer_create ===========
[01:07:52] ================= [PASSED] drm_framebuffer =================
[01:07:52] ================ drm_gem_shmem (8 subtests) ================
[01:07:52] [PASSED] drm_gem_shmem_test_obj_create
[01:07:52] [PASSED] drm_gem_shmem_test_obj_create_private
[01:07:52] [PASSED] drm_gem_shmem_test_pin_pages
[01:07:52] [PASSED] drm_gem_shmem_test_vmap
[01:07:52] [PASSED] drm_gem_shmem_test_get_pages_sgt
[01:07:52] [PASSED] drm_gem_shmem_test_get_sg_table
[01:07:52] [PASSED] drm_gem_shmem_test_madvise
[01:07:52] [PASSED] drm_gem_shmem_test_purge
[01:07:52] ================== [PASSED] drm_gem_shmem ==================
[01:07:52] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[01:07:52] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[01:07:52] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[01:07:52] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[01:07:52] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[01:07:52] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[01:07:52] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[01:07:52] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[01:07:52] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[01:07:52] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[01:07:52] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[01:07:52] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[01:07:52] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[01:07:52] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[01:07:52] [PASSED] drm_test_check_output_bpc_dvi
[01:07:52] [PASSED] drm_test_check_output_bpc_format_vic_1
[01:07:52] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[01:07:52] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[01:07:52] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[01:07:52] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[01:07:52] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[01:07:52] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[01:07:52] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[01:07:52] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[01:07:52] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[01:07:52] [PASSED] drm_test_check_broadcast_rgb_value
[01:07:52] [PASSED] drm_test_check_bpc_8_value
[01:07:52] [PASSED] drm_test_check_bpc_10_value
[01:07:52] [PASSED] drm_test_check_bpc_12_value
[01:07:52] [PASSED] drm_test_check_format_value
[01:07:52] [PASSED] drm_test_check_tmds_char_value
[01:07:52] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[01:07:52] ================= drm_managed (2 subtests) =================
[01:07:52] [PASSED] drm_test_managed_release_action
[01:07:52] [PASSED] drm_test_managed_run_action
[01:07:52] =================== [PASSED] drm_managed ===================
[01:07:52] =================== drm_mm (6 subtests) ====================
[01:07:52] [PASSED] drm_test_mm_init
[01:07:52] [PASSED] drm_test_mm_debug
[01:07:52] [PASSED] drm_test_mm_align32
[01:07:52] [PASSED] drm_test_mm_align64
[01:07:52] [PASSED] drm_test_mm_lowest
[01:07:52] [PASSED] drm_test_mm_highest
[01:07:52] ===================== [PASSED] drm_mm ======================
[01:07:52] ============= drm_modes_analog_tv (5 subtests) =============
[01:07:52] [PASSED] drm_test_modes_analog_tv_mono_576i
[01:07:52] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[01:07:52] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[01:07:52] [PASSED] drm_test_modes_analog_tv_pal_576i
[01:07:52] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[01:07:52] =============== [PASSED] drm_modes_analog_tv ===============
[01:07:52] ============== drm_plane_helper (2 subtests) ===============
[01:07:52] =============== drm_test_check_plane_state  ================
[01:07:52] [PASSED] clipping_simple
[01:07:52] [PASSED] clipping_rotate_reflect
[01:07:52] [PASSED] positioning_simple
[01:07:52] [PASSED] upscaling
[01:07:52] [PASSED] downscaling
[01:07:52] [PASSED] rounding1
[01:07:52] [PASSED] rounding2
[01:07:52] [PASSED] rounding3
[01:07:52] [PASSED] rounding4
[01:07:52] =========== [PASSED] drm_test_check_plane_state ============
[01:07:52] =========== drm_test_check_invalid_plane_state  ============
[01:07:52] [PASSED] positioning_invalid
[01:07:52] [PASSED] upscaling_invalid
stty: 'standard input': Inappropriate ioctl for device
[01:07:52] [PASSED] downscaling_invalid
[01:07:52] ======= [PASSED] drm_test_check_invalid_plane_state ========
[01:07:52] ================ [PASSED] drm_plane_helper =================
[01:07:52] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[01:07:52] ====== drm_test_connector_helper_tv_get_modes_check  =======
[01:07:52] [PASSED] None
[01:07:52] [PASSED] PAL
[01:07:52] [PASSED] NTSC
[01:07:52] [PASSED] Both, NTSC Default
[01:07:52] [PASSED] Both, PAL Default
[01:07:52] [PASSED] Both, NTSC Default, with PAL on command-line
[01:07:52] [PASSED] Both, PAL Default, with NTSC on command-line
[01:07:52] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[01:07:52] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[01:07:52] ================== drm_rect (9 subtests) ===================
[01:07:52] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[01:07:52] [PASSED] drm_test_rect_clip_scaled_not_clipped
[01:07:52] [PASSED] drm_test_rect_clip_scaled_clipped
[01:07:52] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[01:07:52] ================= drm_test_rect_intersect  =================
[01:07:52] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[01:07:52] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[01:07:52] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[01:07:52] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[01:07:52] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[01:07:52] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[01:07:52] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[01:07:52] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[01:07:52] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[01:07:52] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[01:07:52] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[01:07:52] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[01:07:52] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[01:07:52] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[01:07:52] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[01:07:52] ============= [PASSED] drm_test_rect_intersect =============
[01:07:52] ================ drm_test_rect_calc_hscale  ================
[01:07:52] [PASSED] normal use
[01:07:52] [PASSED] out of max range
[01:07:52] [PASSED] out of min range
[01:07:52] [PASSED] zero dst
[01:07:52] [PASSED] negative src
[01:07:52] [PASSED] negative dst
[01:07:52] ============ [PASSED] drm_test_rect_calc_hscale ============
[01:07:52] ================ drm_test_rect_calc_vscale  ================
[01:07:52] [PASSED] normal use
[01:07:52] [PASSED] out of max range
[01:07:52] [PASSED] out of min range
[01:07:52] [PASSED] zero dst
[01:07:52] [PASSED] negative src
[01:07:52] [PASSED] negative dst
[01:07:52] ============ [PASSED] drm_test_rect_calc_vscale ============
[01:07:52] ================== drm_test_rect_rotate  ===================
[01:07:52] [PASSED] reflect-x
[01:07:52] [PASSED] reflect-y
[01:07:52] [PASSED] rotate-0
[01:07:52] [PASSED] rotate-90
[01:07:52] [PASSED] rotate-180
[01:07:52] [PASSED] rotate-270
[01:07:52] ============== [PASSED] drm_test_rect_rotate ===============
[01:07:52] ================ drm_test_rect_rotate_inv  =================
[01:07:52] [PASSED] reflect-x
[01:07:52] [PASSED] reflect-y
[01:07:52] [PASSED] rotate-0
[01:07:52] [PASSED] rotate-90
[01:07:52] [PASSED] rotate-180
[01:07:52] [PASSED] rotate-270
[01:07:52] ============ [PASSED] drm_test_rect_rotate_inv =============
[01:07:52] ==================== [PASSED] drm_rect =====================
[01:07:52] ============================================================
[01:07:52] Testing complete. Ran 515 tests: passed: 515
[01:07:52] Elapsed time: 23.661s total, 1.712s configuring, 21.764s building, 0.151s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[01:07:52] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:07:54] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[01:08:03] Starting KUnit Kernel (1/1)...
[01:08:03] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:08:03] ================= ttm_device (5 subtests) ==================
[01:08:03] [PASSED] ttm_device_init_basic
[01:08:03] [PASSED] ttm_device_init_multiple
[01:08:03] [PASSED] ttm_device_fini_basic
[01:08:03] [PASSED] ttm_device_init_no_vma_man
[01:08:03] ================== ttm_device_init_pools  ==================
[01:08:03] [PASSED] No DMA allocations, no DMA32 required
[01:08:03] [PASSED] DMA allocations, DMA32 required
[01:08:03] [PASSED] No DMA allocations, DMA32 required
[01:08:03] [PASSED] DMA allocations, no DMA32 required
[01:08:03] ============== [PASSED] ttm_device_init_pools ==============
[01:08:03] =================== [PASSED] ttm_device ====================
[01:08:03] ================== ttm_pool (8 subtests) ===================
[01:08:03] ================== ttm_pool_alloc_basic  ===================
[01:08:03] [PASSED] One page
[01:08:03] [PASSED] More than one page
[01:08:03] [PASSED] Above the allocation limit
[01:08:03] [PASSED] One page, with coherent DMA mappings enabled
[01:08:03] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[01:08:03] ============== [PASSED] ttm_pool_alloc_basic ===============
[01:08:03] ============== ttm_pool_alloc_basic_dma_addr  ==============
[01:08:03] [PASSED] One page
[01:08:03] [PASSED] More than one page
[01:08:03] [PASSED] Above the allocation limit
[01:08:03] [PASSED] One page, with coherent DMA mappings enabled
[01:08:03] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[01:08:03] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[01:08:03] [PASSED] ttm_pool_alloc_order_caching_match
[01:08:03] [PASSED] ttm_pool_alloc_caching_mismatch
[01:08:03] [PASSED] ttm_pool_alloc_order_mismatch
[01:08:03] [PASSED] ttm_pool_free_dma_alloc
[01:08:03] [PASSED] ttm_pool_free_no_dma_alloc
[01:08:03] [PASSED] ttm_pool_fini_basic
[01:08:03] ==================== [PASSED] ttm_pool =====================
[01:08:03] ================ ttm_resource (8 subtests) =================
[01:08:03] ================= ttm_resource_init_basic  =================
[01:08:03] [PASSED] Init resource in TTM_PL_SYSTEM
[01:08:03] [PASSED] Init resource in TTM_PL_VRAM
[01:08:03] [PASSED] Init resource in a private placement
[01:08:03] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[01:08:03] ============= [PASSED] ttm_resource_init_basic =============
[01:08:03] [PASSED] ttm_resource_init_pinned
[01:08:03] [PASSED] ttm_resource_fini_basic
[01:08:03] [PASSED] ttm_resource_manager_init_basic
[01:08:03] [PASSED] ttm_resource_manager_usage_basic
[01:08:03] [PASSED] ttm_resource_manager_set_used_basic
[01:08:03] [PASSED] ttm_sys_man_alloc_basic
[01:08:03] [PASSED] ttm_sys_man_free_basic
[01:08:03] ================== [PASSED] ttm_resource ===================
[01:08:03] =================== ttm_tt (15 subtests) ===================
[01:08:03] ==================== ttm_tt_init_basic  ====================
[01:08:03] [PASSED] Page-aligned size
[01:08:03] [PASSED] Extra pages requested
[01:08:03] ================ [PASSED] ttm_tt_init_basic ================
[01:08:03] [PASSED] ttm_tt_init_misaligned
[01:08:03] [PASSED] ttm_tt_fini_basic
[01:08:03] [PASSED] ttm_tt_fini_sg
[01:08:03] [PASSED] ttm_tt_fini_shmem
[01:08:03] [PASSED] ttm_tt_create_basic
[01:08:03] [PASSED] ttm_tt_create_invalid_bo_type
[01:08:03] [PASSED] ttm_tt_create_ttm_exists
[01:08:03] [PASSED] ttm_tt_create_failed
[01:08:03] [PASSED] ttm_tt_destroy_basic
[01:08:03] [PASSED] ttm_tt_populate_null_ttm
[01:08:03] [PASSED] ttm_tt_populate_populated_ttm
[01:08:03] [PASSED] ttm_tt_unpopulate_basic
[01:08:03] [PASSED] ttm_tt_unpopulate_empty_ttm
[01:08:03] [PASSED] ttm_tt_swapin_basic
[01:08:03] ===================== [PASSED] ttm_tt ======================
[01:08:03] =================== ttm_bo (14 subtests) ===================
[01:08:03] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[01:08:03] [PASSED] Cannot be interrupted and sleeps
[01:08:03] [PASSED] Cannot be interrupted, locks straight away
[01:08:03] [PASSED] Can be interrupted, sleeps
[01:08:03] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[01:08:03] [PASSED] ttm_bo_reserve_locked_no_sleep
[01:08:03] [PASSED] ttm_bo_reserve_no_wait_ticket
[01:08:03] [PASSED] ttm_bo_reserve_double_resv
[01:08:03] [PASSED] ttm_bo_reserve_interrupted
[01:08:03] [PASSED] ttm_bo_reserve_deadlock
[01:08:03] [PASSED] ttm_bo_unreserve_basic
[01:08:03] [PASSED] ttm_bo_unreserve_pinned
[01:08:03] [PASSED] ttm_bo_unreserve_bulk
[01:08:03] [PASSED] ttm_bo_put_basic
[01:08:03] [PASSED] ttm_bo_put_shared_resv
[01:08:03] [PASSED] ttm_bo_pin_basic
[01:08:03] [PASSED] ttm_bo_pin_unpin_resource
[01:08:03] [PASSED] ttm_bo_multiple_pin_one_unpin
[01:08:03] ===================== [PASSED] ttm_bo ======================
[01:08:03] ============== ttm_bo_validate (22 subtests) ===============
[01:08:03] ============== ttm_bo_init_reserved_sys_man  ===============
[01:08:03] [PASSED] Buffer object for userspace
[01:08:03] [PASSED] Kernel buffer object
[01:08:03] [PASSED] Shared buffer object
[01:08:03] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[01:08:03] ============== ttm_bo_init_reserved_mock_man  ==============
[01:08:03] [PASSED] Buffer object for userspace
[01:08:03] [PASSED] Kernel buffer object
[01:08:03] [PASSED] Shared buffer object
[01:08:03] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[01:08:03] [PASSED] ttm_bo_init_reserved_resv
[01:08:03] ================== ttm_bo_validate_basic  ==================
[01:08:03] [PASSED] Buffer object for userspace
[01:08:03] [PASSED] Kernel buffer object
[01:08:03] [PASSED] Shared buffer object
[01:08:03] ============== [PASSED] ttm_bo_validate_basic ==============
[01:08:03] [PASSED] ttm_bo_validate_invalid_placement
[01:08:03] ============= ttm_bo_validate_same_placement  ==============
[01:08:03] [PASSED] System manager
[01:08:03] [PASSED] VRAM manager
[01:08:03] ========= [PASSED] ttm_bo_validate_same_placement ==========
[01:08:03] [PASSED] ttm_bo_validate_failed_alloc
[01:08:03] [PASSED] ttm_bo_validate_pinned
[01:08:03] [PASSED] ttm_bo_validate_busy_placement
[01:08:03] ================ ttm_bo_validate_multihop  =================
[01:08:03] [PASSED] Buffer object for userspace
[01:08:03] [PASSED] Kernel buffer object
[01:08:03] [PASSED] Shared buffer object
[01:08:03] ============ [PASSED] ttm_bo_validate_multihop =============
[01:08:03] ========== ttm_bo_validate_no_placement_signaled  ==========
[01:08:03] [PASSED] Buffer object in system domain, no page vector
[01:08:03] [PASSED] Buffer object in system domain with an existing page vector
[01:08:03] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[01:08:03] ======== ttm_bo_validate_no_placement_not_signaled  ========
[01:08:03] [PASSED] Buffer object for userspace
[01:08:03] [PASSED] Kernel buffer object
[01:08:03] [PASSED] Shared buffer object
[01:08:03] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[01:08:03] [PASSED] ttm_bo_validate_move_fence_signaled
[01:08:03] ========= ttm_bo_validate_move_fence_not_signaled  =========
[01:08:03] [PASSED] Waits for GPU
[01:08:03] [PASSED] Tries to lock straight away
[01:08:04] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[01:08:04] [PASSED] ttm_bo_validate_swapout
[01:08:04] [PASSED] ttm_bo_validate_happy_evict
[01:08:04] [PASSED] ttm_bo_validate_all_pinned_evict
[01:08:04] [PASSED] ttm_bo_validate_allowed_only_evict
[01:08:04] [PASSED] ttm_bo_validate_deleted_evict
[01:08:04] [PASSED] ttm_bo_validate_busy_domain_evict
[01:08:04] [PASSED] ttm_bo_validate_evict_gutting
[01:08:04] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[01:08:04] ================= [PASSED] ttm_bo_validate =================
[01:08:04] ============================================================
[01:08:04] Testing complete. Ran 102 tests: passed: 102
[01:08:04] Elapsed time: 11.142s total, 1.707s configuring, 8.763s building, 0.604s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


