Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8B6D5C0C3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 13:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C98D10E9A3;
	Fri,  8 Nov 2024 13:11:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B1710E9A0;
 Fri,  8 Nov 2024 13:11:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/i915/dmc=5Fwl=3A_Fixes_and?=
 =?utf-8?q?_enablement_for_Xe3=5FLPD_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Nov 2024 13:11:03 -0000
Message-ID: <173107146302.1426848.17847844948777913462@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241108130218.24125-1-gustavo.sousa@intel.com>
In-Reply-To: <20241108130218.24125-1-gustavo.sousa@intel.com>
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

Series: drm/i915/dmc_wl: Fixes and enablement for Xe3_LPD (rev4)
URL   : https://patchwork.freedesktop.org/series/140283/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[13:09:52] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:09:56] Building KUnit Kernel ...
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

[13:10:25] Starting KUnit Kernel (1/1)...
[13:10:25] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[13:10:25] =================== guc_dbm (7 subtests) ===================
[13:10:25] [PASSED] test_empty
[13:10:25] [PASSED] test_default
[13:10:25] ======================== test_size  ========================
[13:10:25] [PASSED] 4
[13:10:25] [PASSED] 8
[13:10:25] [PASSED] 32
[13:10:25] [PASSED] 256
[13:10:25] ==================== [PASSED] test_size ====================
[13:10:25] ======================= test_reuse  ========================
[13:10:25] [PASSED] 4
[13:10:25] [PASSED] 8
[13:10:25] [PASSED] 32
[13:10:25] [PASSED] 256
[13:10:25] =================== [PASSED] test_reuse ====================
[13:10:25] =================== test_range_overlap  ====================
[13:10:25] [PASSED] 4
[13:10:25] [PASSED] 8
[13:10:25] [PASSED] 32
[13:10:25] [PASSED] 256
[13:10:25] =============== [PASSED] test_range_overlap ================
[13:10:25] =================== test_range_compact  ====================
[13:10:25] [PASSED] 4
[13:10:25] [PASSED] 8
[13:10:25] [PASSED] 32
[13:10:25] [PASSED] 256
[13:10:25] =============== [PASSED] test_range_compact ================
[13:10:25] ==================== test_range_spare  =====================
[13:10:25] [PASSED] 4
[13:10:25] [PASSED] 8
[13:10:25] [PASSED] 32
[13:10:25] [PASSED] 256
[13:10:25] ================ [PASSED] test_range_spare =================
[13:10:25] ===================== [PASSED] guc_dbm =====================
[13:10:25] =================== guc_idm (6 subtests) ===================
[13:10:25] [PASSED] bad_init
[13:10:25] [PASSED] no_init
[13:10:25] [PASSED] init_fini
[13:10:25] [PASSED] check_used
[13:10:25] [PASSED] check_quota
[13:10:25] [PASSED] check_all
[13:10:25] ===================== [PASSED] guc_idm =====================
[13:10:25] ================== no_relay (3 subtests) ===================
[13:10:25] [PASSED] xe_drops_guc2pf_if_not_ready
[13:10:25] [PASSED] xe_drops_guc2vf_if_not_ready
[13:10:25] [PASSED] xe_rejects_send_if_not_ready
[13:10:25] ==================== [PASSED] no_relay =====================
[13:10:25] ================== pf_relay (14 subtests) ==================
[13:10:25] [PASSED] pf_rejects_guc2pf_too_short
[13:10:25] [PASSED] pf_rejects_guc2pf_too_long
[13:10:25] [PASSED] pf_rejects_guc2pf_no_payload
[13:10:25] [PASSED] pf_fails_no_payload
[13:10:25] [PASSED] pf_fails_bad_origin
[13:10:25] [PASSED] pf_fails_bad_type
[13:10:25] [PASSED] pf_txn_reports_error
[13:10:25] [PASSED] pf_txn_sends_pf2guc
[13:10:25] [PASSED] pf_sends_pf2guc
[13:10:25] [SKIPPED] pf_loopback_nop
[13:10:25] [SKIPPED] pf_loopback_echo
[13:10:25] [SKIPPED] pf_loopback_fail
[13:10:25] [SKIPPED] pf_loopback_busy
[13:10:25] [SKIPPED] pf_loopback_retry
[13:10:25] ==================== [PASSED] pf_relay =====================
[13:10:25] ================== vf_relay (3 subtests) ===================
[13:10:25] [PASSED] vf_rejects_guc2vf_too_short
[13:10:25] [PASSED] vf_rejects_guc2vf_too_long
[13:10:25] [PASSED] vf_rejects_guc2vf_no_payload
[13:10:25] ==================== [PASSED] vf_relay =====================
[13:10:25] ================= pf_service (11 subtests) =================
[13:10:25] [PASSED] pf_negotiate_any
[13:10:25] [PASSED] pf_negotiate_base_match
[13:10:25] [PASSED] pf_negotiate_base_newer
[13:10:25] [PASSED] pf_negotiate_base_next
[13:10:25] [SKIPPED] pf_negotiate_base_older
[13:10:25] [PASSED] pf_negotiate_base_prev
[13:10:25] [PASSED] pf_negotiate_latest_match
[13:10:25] [PASSED] pf_negotiate_latest_newer
[13:10:25] [PASSED] pf_negotiate_latest_next
[13:10:25] [SKIPPED] pf_negotiate_latest_older
[13:10:25] [SKIPPED] pf_negotiate_latest_prev
[13:10:25] =================== [PASSED] pf_service ====================
[13:10:25] ===================== lmtt (1 subtest) =====================
[13:10:25] ======================== test_ops  =========================
[13:10:25] [PASSED] 2-level
[13:10:25] [PASSED] multi-level
[13:10:25] ==================== [PASSED] test_ops =====================
[13:10:25] ====================== [PASSED] lmtt =======================
[13:10:25] =================== xe_mocs (2 subtests) ===================
[13:10:25] ================ xe_live_mocs_kernel_kunit  ================
[13:10:25] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[13:10:25] ================ xe_live_mocs_reset_kunit  =================
[13:10:25] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[13:10:25] ==================== [SKIPPED] xe_mocs =====================
[13:10:25] ================= xe_migrate (2 subtests) ==================
[13:10:25] ================= xe_migrate_sanity_kunit  =================
[13:10:25] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[13:10:25] ================== xe_validate_ccs_kunit  ==================
[13:10:25] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[13:10:25] =================== [SKIPPED] xe_migrate ===================
[13:10:25] ================== xe_dma_buf (1 subtest) ==================
[13:10:25] ==================== xe_dma_buf_kunit  =====================
[13:10:25] ================ [SKIPPED] xe_dma_buf_kunit ================
[13:10:25] =================== [SKIPPED] xe_dma_buf ===================
[13:10:25] ==================== xe_bo (3 subtests) ====================
[13:10:25] ================== xe_ccs_migrate_kunit  ===================
[13:10:25] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[13:10:25] ==================== xe_bo_evict_kunit  ====================
[13:10:25] =============== [SKIPPED] xe_bo_evict_kunit ================
[13:10:25] =================== xe_bo_shrink_kunit  ====================
[13:10:25] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[13:10:25] ===================== [SKIPPED] xe_bo ======================
[13:10:25] ==================== args (11 subtests) ====================
[13:10:25] [PASSED] count_args_test
[13:10:25] [PASSED] call_args_example
[13:10:25] [PASSED] call_args_test
[13:10:25] [PASSED] drop_first_arg_example
[13:10:25] [PASSED] drop_first_arg_test
[13:10:25] [PASSED] first_arg_example
[13:10:25] [PASSED] first_arg_test
[13:10:25] [PASSED] last_arg_example
[13:10:25] [PASSED] last_arg_test
[13:10:25] [PASSED] pick_arg_example
[13:10:25] [PASSED] sep_comma_examplestty: 'standard input': Inappropriate ioctl for device

[13:10:25] ====================== [PASSED] args =======================
[13:10:25] =================== xe_pci (2 subtests) ====================
[13:10:25] [PASSED] xe_gmdid_graphics_ip
[13:10:25] [PASSED] xe_gmdid_media_ip
[13:10:25] ===================== [PASSED] xe_pci ======================
[13:10:25] =================== xe_rtp (2 subtests) ====================
[13:10:25] =============== xe_rtp_process_to_sr_tests  ================
[13:10:25] [PASSED] coalesce-same-reg
[13:10:25] [PASSED] no-match-no-add
[13:10:25] [PASSED] match-or
[13:10:25] [PASSED] match-or-xfail
[13:10:25] [PASSED] no-match-no-add-multiple-rules
[13:10:25] [PASSED] two-regs-two-entries
[13:10:25] [PASSED] clr-one-set-other
[13:10:25] [PASSED] set-field
[13:10:25] [PASSED] conflict-duplicate
[13:10:25] [PASSED] conflict-not-disjoint
[13:10:25] [PASSED] conflict-reg-type
[13:10:25] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[13:10:25] ================== xe_rtp_process_tests  ===================
[13:10:25] [PASSED] active1
[13:10:25] [PASSED] active2
[13:10:25] [PASSED] active-inactive
[13:10:25] [PASSED] inactive-active
[13:10:25] [PASSED] inactive-1st_or_active-inactive
[13:10:25] [PASSED] inactive-2nd_or_active-inactive
[13:10:25] [PASSED] inactive-last_or_active-inactive
[13:10:25] [PASSED] inactive-no_or_active-inactive
[13:10:25] ============== [PASSED] xe_rtp_process_tests ===============
[13:10:25] ===================== [PASSED] xe_rtp ======================
[13:10:25] ==================== xe_wa (1 subtest) =====================
[13:10:25] ======================== xe_wa_gt  =========================
[13:10:25] [PASSED] TIGERLAKE (B0)
[13:10:25] [PASSED] DG1 (A0)
[13:10:25] [PASSED] DG1 (B0)
[13:10:25] [PASSED] ALDERLAKE_S (A0)
[13:10:25] [PASSED] ALDERLAKE_S (B0)
[13:10:25] [PASSED] ALDERLAKE_S (C0)
[13:10:25] [PASSED] ALDERLAKE_S (D0)
[13:10:25] [PASSED] ALDERLAKE_P (A0)
[13:10:25] [PASSED] ALDERLAKE_P (B0)
[13:10:25] [PASSED] ALDERLAKE_P (C0)
[13:10:25] [PASSED] ALDERLAKE_S_RPLS (D0)
[13:10:25] [PASSED] ALDERLAKE_P_RPLU (E0)
[13:10:25] [PASSED] DG2_G10 (C0)
[13:10:25] [PASSED] DG2_G11 (B1)
[13:10:25] [PASSED] DG2_G12 (A1)
[13:10:25] [PASSED] METEORLAKE (g:A0, m:A0)
[13:10:25] [PASSED] METEORLAKE (g:A0, m:A0)
[13:10:25] [PASSED] METEORLAKE (g:A0, m:A0)
[13:10:25] [PASSED] LUNARLAKE (g:A0, m:A0)
[13:10:25] [PASSED] LUNARLAKE (g:B0, m:A0)
[13:10:25] [PASSED] BATTLEMAGE (g:A0, m:A1)
[13:10:25] ==================== [PASSED] xe_wa_gt =====================
[13:10:25] ====================== [PASSED] xe_wa ======================
[13:10:25] ============================================================
[13:10:25] Testing complete. Ran 122 tests: passed: 106, skipped: 16
[13:10:25] Elapsed time: 32.688s total, 4.420s configuring, 28.053s building, 0.210s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[13:10:25] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:10:26] Building KUnit Kernel ...
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

[13:10:50] Starting KUnit Kernel (1/1)...
[13:10:50] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[13:10:50] ================== drm_buddy (7 subtests) ==================
[13:10:50] [PASSED] drm_test_buddy_alloc_limit
[13:10:50] [PASSED] drm_test_buddy_alloc_optimistic
[13:10:50] [PASSED] drm_test_buddy_alloc_pessimistic
[13:10:50] [PASSED] drm_test_buddy_alloc_pathological
[13:10:50] [PASSED] drm_test_buddy_alloc_contiguous
[13:10:50] [PASSED] drm_test_buddy_alloc_clear
[13:10:50] [PASSED] drm_test_buddy_alloc_range_bias
[13:10:50] ==================== [PASSED] drm_buddy ====================
[13:10:50] ============= drm_cmdline_parser (40 subtests) =============
[13:10:50] [PASSED] drm_test_cmdline_force_d_only
[13:10:50] [PASSED] drm_test_cmdline_force_D_only_dvi
[13:10:50] [PASSED] drm_test_cmdline_force_D_only_hdmi
[13:10:50] [PASSED] drm_test_cmdline_force_D_only_not_digital
[13:10:50] [PASSED] drm_test_cmdline_force_e_only
[13:10:50] [PASSED] drm_test_cmdline_res
[13:10:50] [PASSED] drm_test_cmdline_res_vesa
[13:10:50] [PASSED] drm_test_cmdline_res_vesa_rblank
[13:10:50] [PASSED] drm_test_cmdline_res_rblank
[13:10:50] [PASSED] drm_test_cmdline_res_bpp
[13:10:50] [PASSED] drm_test_cmdline_res_refresh
[13:10:50] [PASSED] drm_test_cmdline_res_bpp_refresh
[13:10:50] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[13:10:50] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[13:10:50] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[13:10:50] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[13:10:50] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[13:10:50] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[13:10:50] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[13:10:50] [PASSED] drm_test_cmdline_res_margins_force_on
[13:10:50] [PASSED] drm_test_cmdline_res_vesa_margins
[13:10:50] [PASSED] drm_test_cmdline_name
[13:10:50] [PASSED] drm_test_cmdline_name_bpp
[13:10:50] [PASSED] drm_test_cmdline_name_option
[13:10:50] [PASSED] drm_test_cmdline_name_bpp_option
[13:10:50] [PASSED] drm_test_cmdline_rotate_0
[13:10:50] [PASSED] drm_test_cmdline_rotate_90
[13:10:50] [PASSED] drm_test_cmdline_rotate_180
[13:10:50] [PASSED] drm_test_cmdline_rotate_270
[13:10:50] [PASSED] drm_test_cmdline_hmirror
[13:10:50] [PASSED] drm_test_cmdline_vmirror
[13:10:50] [PASSED] drm_test_cmdline_margin_options
[13:10:50] [PASSED] drm_test_cmdline_multiple_options
[13:10:50] [PASSED] drm_test_cmdline_bpp_extra_and_option
[13:10:50] [PASSED] drm_test_cmdline_extra_and_option
[13:10:50] [PASSED] drm_test_cmdline_freestanding_options
[13:10:50] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[13:10:50] [PASSED] drm_test_cmdline_panel_orientation
[13:10:50] ================ drm_test_cmdline_invalid  =================
[13:10:50] [PASSED] margin_only
[13:10:50] [PASSED] interlace_only
[13:10:50] [PASSED] res_missing_x
[13:10:50] [PASSED] res_missing_y
[13:10:50] [PASSED] res_bad_y
[13:10:50] [PASSED] res_missing_y_bpp
[13:10:50] [PASSED] res_bad_bpp
[13:10:50] [PASSED] res_bad_refresh
[13:10:50] [PASSED] res_bpp_refresh_force_on_off
[13:10:50] [PASSED] res_invalid_mode
[13:10:50] [PASSED] res_bpp_wrong_place_mode
[13:10:50] [PASSED] name_bpp_refresh
[13:10:50] [PASSED] name_refresh
[13:10:50] [PASSED] name_refresh_wrong_mode
[13:10:50] [PASSED] name_refresh_invalid_mode
[13:10:50] [PASSED] rotate_multiple
[13:10:50] [PASSED] rotate_invalid_val
[13:10:50] [PASSED] rotate_truncated
[13:10:50] [PASSED] invalid_option
[13:10:50] [PASSED] invalid_tv_option
[13:10:50] [PASSED] truncated_tv_option
[13:10:50] ============ [PASSED] drm_test_cmdline_invalid =============
[13:10:50] =============== drm_test_cmdline_tv_options  ===============
[13:10:50] [PASSED] NTSC
[13:10:50] [PASSED] NTSC_443
[13:10:50] [PASSED] NTSC_J
[13:10:50] [PASSED] PAL
[13:10:50] [PASSED] PAL_M
[13:10:50] [PASSED] PAL_N
[13:10:50] [PASSED] SECAM
[13:10:50] [PASSED] MONO_525
[13:10:50] [PASSED] MONO_625
[13:10:50] =========== [PASSED] drm_test_cmdline_tv_options ===========
[13:10:50] =============== [PASSED] drm_cmdline_parser ================
[13:10:50] ========== drmm_connector_hdmi_init (19 subtests) ==========
[13:10:50] [PASSED] drm_test_connector_hdmi_init_valid
[13:10:50] [PASSED] drm_test_connector_hdmi_init_bpc_8
[13:10:50] [PASSED] drm_test_connector_hdmi_init_bpc_10
[13:10:50] [PASSED] drm_test_connector_hdmi_init_bpc_12
[13:10:50] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[13:10:50] [PASSED] drm_test_connector_hdmi_init_bpc_null
[13:10:50] [PASSED] drm_test_connector_hdmi_init_formats_empty
[13:10:50] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[13:10:50] [PASSED] drm_test_connector_hdmi_init_null_ddc
[13:10:50] [PASSED] drm_test_connector_hdmi_init_null_product
[13:10:50] [PASSED] drm_test_connector_hdmi_init_null_vendor
[13:10:50] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[13:10:50] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[13:10:50] [PASSED] drm_test_connector_hdmi_init_product_valid
[13:10:50] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[13:10:50] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[13:10:50] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[13:10:50] ========= drm_test_connector_hdmi_init_type_valid  =========
[13:10:50] [PASSED] HDMI-A
[13:10:50] [PASSED] HDMI-B
[13:10:50] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[13:10:50] ======== drm_test_connector_hdmi_init_type_invalid  ========
[13:10:50] [PASSED] Unknown
[13:10:50] [PASSED] VGA
[13:10:50] [PASSED] DVI-I
[13:10:50] [PASSED] DVI-D
[13:10:50] [PASSED] DVI-A
[13:10:50] [PASSED] Composite
[13:10:50] [PASSED] SVIDEO
[13:10:50] [PASSED] LVDS
[13:10:50] [PASSED] Component
[13:10:50] [PASSED] DIN
[13:10:50] [PASSED] DP
[13:10:50] [PASSED] TV
[13:10:50] [PASSED] eDP
[13:10:50] [PASSED] Virtual
[13:10:50] [PASSED] DSI
[13:10:50] [PASSED] DPI
[13:10:50] [PASSED] Writeback
[13:10:50] [PASSED] SPI
[13:10:50] [PASSED] USB
[13:10:50] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[13:10:50] ============ [PASSED] drmm_connector_hdmi_init =============
[13:10:50] ============= drmm_connector_init (3 subtests) =============
[13:10:50] [PASSED] drm_test_drmm_connector_init
[13:10:50] [PASSED] drm_test_drmm_connector_init_null_ddc
[13:10:50] ========= drm_test_drmm_connector_init_type_valid  =========
[13:10:50] [PASSED] Unknown
[13:10:50] [PASSED] VGA
[13:10:50] [PASSED] DVI-I
[13:10:50] [PASSED] DVI-D
[13:10:50] [PASSED] DVI-A
[13:10:50] [PASSED] Composite
[13:10:50] [PASSED] SVIDEO
[13:10:50] [PASSED] LVDS
[13:10:50] [PASSED] Component
[13:10:50] [PASSED] DIN
[13:10:50] [PASSED] DP
[13:10:50] [PASSED] HDMI-A
[13:10:50] [PASSED] HDMI-B
[13:10:50] [PASSED] TV
[13:10:50] [PASSED] eDP
[13:10:50] [PASSED] Virtual
[13:10:50] [PASSED] DSI
[13:10:50] [PASSED] DPI
[13:10:50] [PASSED] Writeback
[13:10:50] [PASSED] SPI
[13:10:50] [PASSED] USB
[13:10:50] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[13:10:50] =============== [PASSED] drmm_connector_init ===============
[13:10:50] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[13:10:50] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[13:10:50] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[13:10:50] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[13:10:50] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[13:10:50] ========== drm_test_get_tv_mode_from_name_valid  ===========
[13:10:50] [PASSED] NTSC
[13:10:50] [PASSED] NTSC-443
[13:10:50] [PASSED] NTSC-J
[13:10:50] [PASSED] PAL
[13:10:50] [PASSED] PAL-M
[13:10:50] [PASSED] PAL-N
[13:10:50] [PASSED] SECAM
[13:10:50] [PASSED] Mono
[13:10:50] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[13:10:50] [PASSED] drm_test_get_tv_mode_from_name_truncated
[13:10:50] ============ [PASSED] drm_get_tv_mode_from_name ============
[13:10:50] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[13:10:50] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[13:10:50] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[13:10:50] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[13:10:50] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[13:10:50] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[13:10:50] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[13:10:50] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[13:10:50] [PASSED] VIC 96
[13:10:50] [PASSED] VIC 97
[13:10:50] [PASSED] VIC 101
[13:10:50] [PASSED] VIC 102
[13:10:50] [PASSED] VIC 106
[13:10:50] [PASSED] VIC 107
[13:10:50] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[13:10:50] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[13:10:50] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[13:10:50] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[13:10:50] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[13:10:50] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[13:10:50] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[13:10:50] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[13:10:50] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[13:10:50] [PASSED] Automatic
[13:10:50] [PASSED] Full
[13:10:50] [PASSED] Limited 16:235
[13:10:50] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[13:10:50] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[13:10:50] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[13:10:50] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[13:10:50] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[13:10:50] [PASSED] RGB
[13:10:50] [PASSED] YUV 4:2:0
[13:10:50] [PASSED] YUV 4:2:2
[13:10:50] [PASSED] YUV 4:4:4
[13:10:50] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[13:10:50] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[13:10:50] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[13:10:50] ============= drm_damage_helper (21 subtests) ==============
[13:10:50] [PASSED] drm_test_damage_iter_no_damage
[13:10:50] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[13:10:50] [PASSED] drm_test_damage_iter_no_damage_src_moved
[13:10:50] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[13:10:50] [PASSED] drm_test_damage_iter_no_damage_not_visible
[13:10:50] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[13:10:50] [PASSED] drm_test_damage_iter_no_damage_no_fb
[13:10:50] [PASSED] drm_test_damage_iter_simple_damage
[13:10:50] [PASSED] drm_test_damage_iter_single_damage
[13:10:50] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[13:10:50] [PASSED] drm_test_damage_iter_single_damage_outside_src
[13:10:50] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[13:10:50] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[13:10:50] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[13:10:50] [PASSED] drm_test_damage_iter_single_damage_src_moved
[13:10:50] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[13:10:50] [PASSED] drm_test_damage_iter_damage
[13:10:50] [PASSED] drm_test_damage_iter_damage_one_intersect
[13:10:50] [PASSED] drm_test_damage_iter_damage_one_outside
[13:10:50] [PASSED] drm_test_damage_iter_damage_src_moved
[13:10:50] [PASSED] drm_test_damage_iter_damage_not_visible
[13:10:50] ================ [PASSED] drm_damage_helper ================
[13:10:50] ============== drm_dp_mst_helper (3 subtests) ==============
[13:10:50] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[13:10:50] [PASSED] Clock 154000 BPP 30 DSC disabled
[13:10:50] [PASSED] Clock 234000 BPP 30 DSC disabled
[13:10:50] [PASSED] Clock 297000 BPP 24 DSC disabled
[13:10:50] [PASSED] Clock 332880 BPP 24 DSC enabled
[13:10:50] [PASSED] Clock 324540 BPP 24 DSC enabled
[13:10:50] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[13:10:50] ============== drm_test_dp_mst_calc_pbn_div  ===============
[13:10:50] [PASSED] Link rate 2000000 lane count 4
[13:10:50] [PASSED] Link rate 2000000 lane count 2
[13:10:50] [PASSED] Link rate 2000000 lane count 1
[13:10:50] [PASSED] Link rate 1350000 lane count 4
[13:10:50] [PASSED] Link rate 1350000 lane count 2
[13:10:50] [PASSED] Link rate 1350000 lane count 1
[13:10:50] [PASSED] Link rate 1000000 lane count 4
[13:10:50] [PASSED] Link rate 1000000 lane count 2
[13:10:50] [PASSED] Link rate 1000000 lane count 1
[13:10:50] [PASSED] Link rate 810000 lane count 4
[13:10:50] [PASSED] Link rate 810000 lane count 2
[13:10:50] [PASSED] Link rate 810000 lane count 1
[13:10:50] [PASSED] Link rate 540000 lane count 4
[13:10:50] [PASSED] Link rate 540000 lane count 2
[13:10:50] [PASSED] Link rate 540000 lane count 1
[13:10:50] [PASSED] Link rate 270000 lane count 4
[13:10:50] [PASSED] Link rate 270000 lane count 2
[13:10:50] [PASSED] Link rate 270000 lane count 1
[13:10:50] [PASSED] Link rate 162000 lane count 4
[13:10:50] [PASSED] Link rate 162000 lane count 2
[13:10:50] [PASSED] Link rate 162000 lane count 1
[13:10:50] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[13:10:50] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[13:10:50] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[13:10:50] [PASSED] DP_POWER_UP_PHY with port number
[13:10:50] [PASSED] DP_POWER_DOWN_PHY with port number
[13:10:50] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[13:10:50] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[13:10:50] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[13:10:50] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[13:10:50] [PASSED] DP_QUERY_PAYLOAD with port number
[13:10:50] [PASSED] DP_QUERY_PAYLOAD with VCPI
[13:10:50] [PASSED] DP_REMOTE_DPCD_READ with port number
[13:10:50] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[13:10:50] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[13:10:50] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[13:10:50] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[13:10:50] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[13:10:50] [PASSED] DP_REMOTE_I2C_READ with port number
[13:10:50] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[13:10:50] [PASSED] DP_REMOTE_I2C_READ with transactions array
[13:10:50] [PASSED] DP_REMOTE_I2C_WRITE with port number
[13:10:50] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[13:10:50] [PASSED] DP_REMOTE_I2C_WRITE with data array
[13:10:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[13:10:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[13:10:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[13:10:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[13:10:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[13:10:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[13:10:50] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[13:10:50] ================ [PASSED] drm_dp_mst_helper ================
[13:10:50] ================== drm_exec (7 subtests) ===================
[13:10:50] [PASSED] sanitycheck
[13:10:50] [PASSED] test_lock
[13:10:50] [PASSED] test_lock_unlock
[13:10:50] [PASSED] test_duplicates
[13:10:50] [PASSED] test_prepare
[13:10:50] [PASSED] test_prepare_array
[13:10:50] [PASSED] test_multiple_loops
[13:10:50] ==================== [PASSED] drm_exec =====================
[13:10:50] =========== drm_format_helper_test (17 subtests) ===========
[13:10:50] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[13:10:50] [PASSED] single_pixel_source_buffer
[13:10:50] [PASSED] single_pixel_clip_rectangle
[13:10:50] [PASSED] well_known_colors
[13:10:50] [PASSED] destination_pitch
[13:10:50] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[13:10:50] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[13:10:50] [PASSED] single_pixel_source_buffer
[13:10:50] [PASSED] single_pixel_clip_rectangle
[13:10:50] [PASSED] well_known_colors
[13:10:50] [PASSED] destination_pitch
[13:10:50] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[13:10:50] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[13:10:50] [PASSED] single_pixel_source_buffer
[13:10:50] [PASSED] single_pixel_clip_rectangle
[13:10:50] [PASSED] well_known_colors
[13:10:50] [PASSED] destination_pitch
[13:10:50] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[13:10:50] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[13:10:50] [PASSED] single_pixel_source_buffer
[13:10:50] [PASSED] single_pixel_clip_rectangle
[13:10:50] [PASSED] well_known_colors
[13:10:50] [PASSED] destination_pitch
[13:10:50] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[13:10:50] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[13:10:50] [PASSED] single_pixel_source_buffer
[13:10:50] [PASSED] single_pixel_clip_rectangle
[13:10:50] [PASSED] well_known_colors
[13:10:50] [PASSED] destination_pitch
[13:10:50] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[13:10:50] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[13:10:50] [PASSED] single_pixel_source_buffer
[13:10:50] [PASSED] single_pixel_clip_rectangle
[13:10:50] [PASSED] well_known_colors
[13:10:50] [PASSED] destination_pitch
[13:10:50] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[13:10:50] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[13:10:50] [PASSED] single_pixel_source_buffer
[13:10:50] [PASSED] single_pixel_clip_rectangle
[13:10:50] [PASSED] well_known_colors
[13:10:50] [PASSED] destination_pitch
[13:10:50] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[13:10:50] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[13:10:50] [PASSED] single_pixel_source_buffer
[13:10:50] [PASSED] single_pixel_clip_rectangle
[13:10:50] [PASSED] well_known_colors
[13:10:50] [PASSED] destination_pitch
[13:10:50] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[13:10:50] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[13:10:50] [PASSED] single_pixel_source_buffer
[13:10:50] [PASSED] single_pixel_clip_rectangle
[13:10:50] [PASSED] well_known_colors
[13:10:50] [PASSED] destination_pitch
[13:10:50] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[13:10:50] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[13:10:50] [PASSED] single_pixel_source_buffer
[13:10:50] [PASSED] single_pixel_clip_rectangle
[13:10:50] [PASSED] well_known_colors
[13:10:50] [PASSED] destination_pitch
[13:10:50] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[13:10:50] ============== drm_test_fb_xrgb8888_to_mono  ===============
[13:10:50] [PASSED] single_pixel_source_buffer
[13:10:50] [PASSED] single_pixel_clip_rectangle
[13:10:50] [PASSED] well_known_colors
[13:10:50] [PASSED] destination_pitch
[13:10:50] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[13:10:50] ==================== drm_test_fb_swab  =====================
[13:10:50] [PASSED] single_pixel_source_buffer
[13:10:50] [PASSED] single_pixel_clip_rectangle
[13:10:50] [PASSED] well_known_colors
[13:10:50] [PASSED] destination_pitch
[13:10:50] ================ [PASSED] drm_test_fb_swab =================
[13:10:50] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[13:10:50] [PASSED] single_pixel_source_buffer
[13:10:50] [PASSED] single_pixel_clip_rectangle
[13:10:50] [PASSED] well_known_colors
[13:10:50] [PASSED] destination_pitch
[13:10:50] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[13:10:50] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[13:10:50] [PASSED] single_pixel_source_buffer
[13:10:50] [PASSED] single_pixel_clip_rectangle
[13:10:50] [PASSED] well_known_colors
[13:10:50] [PASSED] destination_pitch
[13:10:50] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[13:10:50] ================= drm_test_fb_clip_offset  =================
[13:10:50] [PASSED] pass through
[13:10:50] [PASSED] horizontal offset
[13:10:50] [PASSED] vertical offset
[13:10:50] [PASSED] horizontal and vertical offset
[13:10:50] [PASSED] horizontal offset (custom pitch)
[13:10:50] [PASSED] vertical offset (custom pitch)
[13:10:50] [PASSED] horizontal and vertical offset (custom pitch)
[13:10:50] ============= [PASSED] drm_test_fb_clip_offset =============
[13:10:50] ============== drm_test_fb_build_fourcc_list  ==============
[13:10:50] [PASSED] no native formats
[13:10:50] [PASSED] XRGB8888 as native format
[13:10:50] [PASSED] remove duplicates
[13:10:50] [PASSED] convert alpha formats
[13:10:50] [PASSED] random formats
[13:10:50] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[13:10:50] =================== drm_test_fb_memcpy  ====================
[13:10:50] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[13:10:50] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[13:10:50] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[13:10:50] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[13:10:50] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[13:10:50] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[13:10:50] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[13:10:50] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[13:10:50] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[13:10:50] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[13:10:50] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[13:10:50] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[13:10:50] =============== [PASSED] drm_test_fb_memcpy ================
[13:10:50] ============= [PASSED] drm_format_helper_test ==============
[13:10:50] ================= drm_format (18 subtests) =================
[13:10:50] [PASSED] drm_test_format_block_width_invalid
[13:10:50] [PASSED] drm_test_format_block_width_one_plane
[13:10:50] [PASSED] drm_test_format_block_width_two_plane
[13:10:50] [PASSED] drm_test_format_block_width_three_plane
[13:10:50] [PASSED] drm_test_format_block_width_tiled
[13:10:50] [PASSED] drm_test_format_block_height_invalid
[13:10:50] [PASSED] drm_test_format_block_height_one_plane
[13:10:50] [PASSED] drm_test_format_block_height_two_plane
[13:10:50] [PASSED] drm_test_format_block_height_three_plane
[13:10:50] [PASSED] drm_test_format_block_height_tiled
[13:10:50] [PASSED] drm_test_format_min_pitch_invalid
[13:10:50] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[13:10:50] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[13:10:50] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[13:10:50] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[13:10:50] [PASSED] drm_test_format_min_pitch_two_plane
[13:10:50] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[13:10:50] [PASSED] drm_test_format_min_pitch_tiled
[13:10:50] =================== [PASSED] drm_format ====================
[13:10:50] ============== drm_framebuffer (10 subtests) ===============
[13:10:50] ========== drm_test_framebuffer_check_src_coords  ==========
[13:10:50] [PASSED] Success: source fits into fb
[13:10:50] [PASSED] Fail: overflowing fb with x-axis coordinate
[13:10:50] [PASSED] Fail: overflowing fb with y-axis coordinate
[13:10:50] [PASSED] Fail: overflowing fb with source width
[13:10:50] [PASSED] Fail: overflowing fb with source height
[13:10:50] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[13:10:50] [PASSED] drm_test_framebuffer_cleanup
[13:10:50] =============== drm_test_framebuffer_create  ===============
[13:10:50] [PASSED] ABGR8888 normal sizes
[13:10:50] [PASSED] ABGR8888 max sizes
[13:10:50] [PASSED] ABGR8888 pitch greater than min required
[13:10:50] [PASSED] ABGR8888 pitch less than min required
[13:10:50] [PASSED] ABGR8888 Invalid width
[13:10:50] [PASSED] ABGR8888 Invalid buffer handle
[13:10:50] [PASSED] No pixel format
[13:10:50] [PASSED] ABGR8888 Width 0
[13:10:50] [PASSED] ABGR8888 Height 0
[13:10:50] [PASSED] ABGR8888 Out of bound height * pitch combination
[13:10:50] [PASSED] ABGR8888 Large buffer offset
[13:10:50] [PASSED] ABGR8888 Buffer offset for inexistent plane
[13:10:50] [PASSED] ABGR8888 Invalid flag
[13:10:50] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[13:10:50] [PASSED] ABGR8888 Valid buffer modifier
[13:10:50] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[13:10:50] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[13:10:50] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[13:10:50] [PASSED] NV12 Normal sizes
[13:10:50] [PASSED] NV12 Max sizes
[13:10:50] [PASSED] NV12 Invalid pitch
[13:10:50] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[13:10:50] [PASSED] NV12 different  modifier per-plane
[13:10:50] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[13:10:50] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[13:10:50] [PASSED] NV12 Modifier for inexistent plane
[13:10:50] [PASSED] NV12 Handle for inexistent plane
[13:10:50] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[13:10:50] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[13:10:50] [PASSED] YVU420 Normal sizes
[13:10:50] [PASSED] YVU420 Max sizes
[13:10:50] [PASSED] YVU420 Invalid pitch
[13:10:50] [PASSED] YVU420 Different pitches
[13:10:50] [PASSED] YVU420 Different buffer offsets/pitches
[13:10:50] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[13:10:50] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[13:10:50] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[13:10:50] [PASSED] YVU420 Valid modifier
[13:10:50] [PASSED] YVU420 Different modifiers per plane
[13:10:50] [PASSED] YVU420 Modifier for inexistent plane
[13:10:50] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[13:10:50] [PASSED] X0L2 Normal sizes
[13:10:50] [PASSED] X0L2 Max sizes
[13:10:50] [PASSED] X0L2 Invalid pitch
[13:10:50] [PASSED] X0L2 Pitch greater than minimum required
[13:10:50] [PASSED] X0L2 Handle for inexistent plane
[13:10:50] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[13:10:50] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[13:10:50] [PASSED] X0L2 Valid modifier
[13:10:50] [PASSED] X0L2 Modifier for inexistent plane
[13:10:50] =========== [PASSED] drm_test_framebuffer_create ===========
[13:10:50] [PASSED] drm_test_framebuffer_free
[13:10:50] [PASSED] drm_test_framebuffer_init
[13:10:50] [PASSED] drm_test_framebuffer_init_bad_format
[13:10:50] [PASSED] drm_test_framebuffer_init_dev_mismatch
[13:10:50] [PASSED] drm_test_framebuffer_lookup
[13:10:50] [PASSED] drm_test_framebuffer_lookup_inexistent
[13:10:50] [PASSED] drm_test_framebuffer_modifiers_not_supported
[13:10:50] ================= [PASSED] drm_framebuffer =================
[13:10:50] ================ drm_gem_shmem (8 subtests) ================
[13:10:50] [PASSED] drm_gem_shmem_test_obj_create
[13:10:50] [PASSED] drm_gem_shmem_test_obj_create_private
[13:10:50] [PASSED] drm_gem_shmem_test_pin_pages
[13:10:50] [PASSED] drm_gem_shmem_test_vmap
[13:10:50] [PASSED] drm_gem_shmem_test_get_pages_sgt
[13:10:50] [PASSED] drm_gem_shmem_test_get_sg_table
[13:10:50] [PASSED] drm_gem_shmem_test_madvise
[13:10:50] [PASSED] drm_gem_shmem_test_purge
[13:10:50] ================== [PASSED] drm_gem_shmem ==================
[13:10:50] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[13:10:50] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[13:10:50] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[13:10:50] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[13:10:50] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[13:10:50] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[13:10:50] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[13:10:50] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[13:10:50] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[13:10:50] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[13:10:50] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[13:10:50] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[13:10:50] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[13:10:50] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[13:10:50] [PASSED] drm_test_check_output_bpc_dvi
[13:10:50] [PASSED] drm_test_check_output_bpc_format_vic_1
[13:10:50] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[13:10:50] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[13:10:50] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[13:10:50] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[13:10:50] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[13:10:50] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[13:10:50] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[13:10:50] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[13:10:50] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[13:10:50] [PASSED] drm_test_check_broadcast_rgb_value
[13:10:50] [PASSED] drm_test_check_bpc_8_value
[13:10:50] [PASSED] drm_test_check_bpc_10_value
[13:10:50] [PASSED] drm_test_check_bpc_12_value
[13:10:50] [PASSED] drm_test_check_format_value
[13:10:50] [PASSED] drm_test_check_tmds_char_value
[13:10:50] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[13:10:50] ================= drm_managed (2 subtests) =================
[13:10:50] [PASSED] drm_test_managed_release_action
[13:10:50] [PASSED] drm_test_managed_run_action
[13:10:50] =================== [PASSED] drm_managed ===================
[13:10:50] =================== drm_mm (6 subtests) ====================
[13:10:50] [PASSED] drm_test_mm_init
[13:10:50] [PASSED] drm_test_mm_debug
[13:10:50] [PASSED] drm_test_mm_align32
[13:10:50] [PASSED] drm_test_mm_align64
[13:10:50] [PASSED] drm_test_mm_lowest
[13:10:50] [PASSED] drm_test_mm_highest
[13:10:50] ===================== [PASSED] drm_mm ======================
[13:10:50] ============= drm_modes_analog_tv (5 subtests) =============
[13:10:50] [PASSED] drm_test_modes_analog_tv_mono_576i
[13:10:50] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[13:10:50] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[13:10:50] [PASSED] drm_test_modes_analog_tv_pal_576i
[13:10:50] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[13:10:50] =============== [PASSED] drm_modes_analog_tv ===============
stty: 'standard input': Inappropriate ioctl for device
[13:10:50] ============== drm_plane_helper (2 subtests) ===============
[13:10:50] =============== drm_test_check_plane_state  ================
[13:10:50] [PASSED] clipping_simple
[13:10:50] [PASSED] clipping_rotate_reflect
[13:10:50] [PASSED] positioning_simple
[13:10:50] [PASSED] upscaling
[13:10:50] [PASSED] downscaling
[13:10:50] [PASSED] rounding1
[13:10:50] [PASSED] rounding2
[13:10:50] [PASSED] rounding3
[13:10:50] [PASSED] rounding4
[13:10:50] =========== [PASSED] drm_test_check_plane_state ============
[13:10:50] =========== drm_test_check_invalid_plane_state  ============
[13:10:50] [PASSED] positioning_invalid
[13:10:50] [PASSED] upscaling_invalid
[13:10:50] [PASSED] downscaling_invalid
[13:10:50] ======= [PASSED] drm_test_check_invalid_plane_state ========
[13:10:50] ================ [PASSED] drm_plane_helper =================
[13:10:50] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[13:10:50] ====== drm_test_connector_helper_tv_get_modes_check  =======
[13:10:50] [PASSED] None
[13:10:50] [PASSED] PAL
[13:10:50] [PASSED] NTSC
[13:10:50] [PASSED] Both, NTSC Default
[13:10:50] [PASSED] Both, PAL Default
[13:10:50] [PASSED] Both, NTSC Default, with PAL on command-line
[13:10:50] [PASSED] Both, PAL Default, with NTSC on command-line
[13:10:50] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[13:10:50] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[13:10:50] ================== drm_rect (9 subtests) ===================
[13:10:50] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[13:10:50] [PASSED] drm_test_rect_clip_scaled_not_clipped
[13:10:50] [PASSED] drm_test_rect_clip_scaled_clipped
[13:10:50] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[13:10:50] ================= drm_test_rect_intersect  =================
[13:10:50] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[13:10:50] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[13:10:50] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[13:10:50] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[13:10:50] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[13:10:50] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[13:10:50] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[13:10:50] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[13:10:50] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[13:10:50] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[13:10:50] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[13:10:50] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[13:10:50] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[13:10:50] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[13:10:50] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[13:10:50] ============= [PASSED] drm_test_rect_intersect =============
[13:10:50] ================ drm_test_rect_calc_hscale  ================
[13:10:50] [PASSED] normal use
[13:10:50] [PASSED] out of max range
[13:10:50] [PASSED] out of min range
[13:10:50] [PASSED] zero dst
[13:10:50] [PASSED] negative src
[13:10:50] [PASSED] negative dst
[13:10:50] ============ [PASSED] drm_test_rect_calc_hscale ============
[13:10:50] ================ drm_test_rect_calc_vscale  ================
[13:10:50] [PASSED] normal use
[13:10:50] [PASSED] out of max range
[13:10:50] [PASSED] out of min range
[13:10:50] [PASSED] zero dst
[13:10:50] [PASSED] negative src
[13:10:50] [PASSED] negative dst
[13:10:50] ============ [PASSED] drm_test_rect_calc_vscale ============
[13:10:50] ================== drm_test_rect_rotate  ===================
[13:10:50] [PASSED] reflect-x
[13:10:50] [PASSED] reflect-y
[13:10:50] [PASSED] rotate-0
[13:10:50] [PASSED] rotate-90
[13:10:50] [PASSED] rotate-180
[13:10:50] [PASSED] rotate-270
[13:10:50] ============== [PASSED] drm_test_rect_rotate ===============
[13:10:50] ================ drm_test_rect_rotate_inv  =================
[13:10:50] [PASSED] reflect-x
[13:10:50] [PASSED] reflect-y
[13:10:50] [PASSED] rotate-0
[13:10:50] [PASSED] rotate-90
[13:10:50] [PASSED] rotate-180
[13:10:50] [PASSED] rotate-270
[13:10:50] ============ [PASSED] drm_test_rect_rotate_inv =============
[13:10:50] ==================== [PASSED] drm_rect =====================
[13:10:50] ============================================================
[13:10:50] Testing complete. Ran 526 tests: passed: 526
[13:10:50] Elapsed time: 24.886s total, 1.671s configuring, 23.045s building, 0.168s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[13:10:50] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:10:51] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
[13:10:59] Starting KUnit Kernel (1/1)...
[13:10:59] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[13:10:59] ================= ttm_device (5 subtests) ==================
[13:10:59] [PASSED] ttm_device_init_basic
[13:10:59] [PASSED] ttm_device_init_multiple
[13:10:59] [PASSED] ttm_device_fini_basic
[13:10:59] [PASSED] ttm_device_init_no_vma_man
[13:10:59] ================== ttm_device_init_pools  ==================
[13:10:59] [PASSED] No DMA allocations, no DMA32 required
[13:10:59] [PASSED] DMA allocations, DMA32 required
[13:10:59] [PASSED] No DMA allocations, DMA32 required
[13:10:59] [PASSED] DMA allocations, no DMA32 required
[13:10:59] ============== [PASSED] ttm_device_init_pools ==============
[13:10:59] =================== [PASSED] ttm_device ====================
[13:10:59] ================== ttm_pool (8 subtests) ===================
[13:10:59] ================== ttm_pool_alloc_basic  ===================
[13:10:59] [PASSED] One page
[13:10:59] [PASSED] More than one page
[13:10:59] [PASSED] Above the allocation limit
[13:10:59] [PASSED] One page, with coherent DMA mappings enabled
[13:10:59] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[13:10:59] ============== [PASSED] ttm_pool_alloc_basic ===============
[13:10:59] ============== ttm_pool_alloc_basic_dma_addr  ==============
[13:10:59] [PASSED] One page
[13:10:59] [PASSED] More than one page
[13:10:59] [PASSED] Above the allocation limit
[13:10:59] [PASSED] One page, with coherent DMA mappings enabled
[13:10:59] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[13:10:59] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[13:10:59] [PASSED] ttm_pool_alloc_order_caching_match
[13:10:59] [PASSED] ttm_pool_alloc_caching_mismatch
[13:10:59] [PASSED] ttm_pool_alloc_order_mismatch
[13:10:59] [PASSED] ttm_pool_free_dma_alloc
[13:10:59] [PASSED] ttm_pool_free_no_dma_alloc
[13:10:59] [PASSED] ttm_pool_fini_basic
[13:10:59] ==================== [PASSED] ttm_pool =====================
[13:10:59] ================ ttm_resource (8 subtests) =================
[13:10:59] ================= ttm_resource_init_basic  =================
[13:10:59] [PASSED] Init resource in TTM_PL_SYSTEM
[13:10:59] [PASSED] Init resource in TTM_PL_VRAM
[13:10:59] [PASSED] Init resource in a private placement
[13:10:59] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[13:10:59] ============= [PASSED] ttm_resource_init_basic =============
[13:10:59] [PASSED] ttm_resource_init_pinned
[13:10:59] [PASSED] ttm_resource_fini_basic
[13:10:59] [PASSED] ttm_resource_manager_init_basic
[13:10:59] [PASSED] ttm_resource_manager_usage_basic
[13:10:59] [PASSED] ttm_resource_manager_set_used_basic
[13:10:59] [PASSED] ttm_sys_man_alloc_basic
[13:10:59] [PASSED] ttm_sys_man_free_basic
[13:10:59] ================== [PASSED] ttm_resource ===================
[13:10:59] =================== ttm_tt (15 subtests) ===================
[13:10:59] ==================== ttm_tt_init_basic  ====================
[13:10:59] [PASSED] Page-aligned size
[13:10:59] [PASSED] Extra pages requested
[13:10:59] ================ [PASSED] ttm_tt_init_basic ================
[13:10:59] [PASSED] ttm_tt_init_misaligned
[13:10:59] [PASSED] ttm_tt_fini_basic
[13:10:59] [PASSED] ttm_tt_fini_sg
[13:10:59] [PASSED] ttm_tt_fini_shmem
[13:10:59] [PASSED] ttm_tt_create_basic
[13:10:59] [PASSED] ttm_tt_create_invalid_bo_type
[13:10:59] [PASSED] ttm_tt_create_ttm_exists
[13:10:59] [PASSED] ttm_tt_create_failed
[13:10:59] [PASSED] ttm_tt_destroy_basic
[13:10:59] [PASSED] ttm_tt_populate_null_ttm
[13:10:59] [PASSED] ttm_tt_populate_populated_ttm
[13:10:59] [PASSED] ttm_tt_unpopulate_basic
[13:10:59] [PASSED] ttm_tt_unpopulate_empty_ttm
[13:10:59] [PASSED] ttm_tt_swapin_basic
[13:10:59] ===================== [PASSED] ttm_tt ======================
[13:10:59] =================== ttm_bo (14 subtests) ===================
[13:10:59] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[13:10:59] [PASSED] Cannot be interrupted and sleeps
[13:10:59] [PASSED] Cannot be interrupted, locks straight away
[13:10:59] [PASSED] Can be interrupted, sleeps
[13:10:59] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[13:10:59] [PASSED] ttm_bo_reserve_locked_no_sleep
[13:10:59] [PASSED] ttm_bo_reserve_no_wait_ticket
[13:10:59] [PASSED] ttm_bo_reserve_double_resv
[13:10:59] [PASSED] ttm_bo_reserve_interrupted
[13:10:59] [PASSED] ttm_bo_reserve_deadlock
[13:10:59] [PASSED] ttm_bo_unreserve_basic
[13:10:59] [PASSED] ttm_bo_unreserve_pinned
[13:10:59] [PASSED] ttm_bo_unreserve_bulk
[13:10:59] [PASSED] ttm_bo_put_basic
[13:10:59] [PASSED] ttm_bo_put_shared_resv
[13:10:59] [PASSED] ttm_bo_pin_basic
[13:10:59] [PASSED] ttm_bo_pin_unpin_resource
[13:10:59] [PASSED] ttm_bo_multiple_pin_one_unpin
[13:10:59] ===================== [PASSED] ttm_bo ======================
[13:10:59] ============== ttm_bo_validate (22 subtests) ===============
[13:10:59] ============== ttm_bo_init_reserved_sys_man  ===============
[13:10:59] [PASSED] Buffer object for userspace
[13:10:59] [PASSED] Kernel buffer object
[13:10:59] [PASSED] Shared buffer object
[13:10:59] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[13:10:59] ============== ttm_bo_init_reserved_mock_man  ==============
[13:10:59] [PASSED] Buffer object for userspace
[13:10:59] [PASSED] Kernel buffer object
[13:10:59] [PASSED] Shared buffer object
[13:10:59] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[13:10:59] [PASSED] ttm_bo_init_reserved_resv
[13:10:59] ================== ttm_bo_validate_basic  ==================
[13:10:59] [PASSED] Buffer object for userspace
[13:10:59] [PASSED] Kernel buffer object
[13:10:59] [PASSED] Shared buffer object
[13:10:59] ============== [PASSED] ttm_bo_validate_basic ==============
[13:10:59] [PASSED] ttm_bo_validate_invalid_placement
[13:10:59] ============= ttm_bo_validate_same_placement  ==============
[13:10:59] [PASSED] System manager
[13:10:59] [PASSED] VRAM manager
[13:10:59] ========= [PASSED] ttm_bo_validate_same_placement ==========
[13:10:59] [PASSED] ttm_bo_validate_failed_alloc
[13:10:59] [PASSED] ttm_bo_validate_pinned
[13:10:59] [PASSED] ttm_bo_validate_busy_placement
[13:10:59] ================ ttm_bo_validate_multihop  =================
[13:10:59] [PASSED] Buffer object for userspace
[13:10:59] [PASSED] Kernel buffer object
[13:10:59] [PASSED] Shared buffer object
[13:10:59] ============ [PASSED] ttm_bo_validate_multihop =============
[13:10:59] ========== ttm_bo_validate_no_placement_signaled  ==========
[13:10:59] [PASSED] Buffer object in system domain, no page vector
[13:10:59] [PASSED] Buffer object in system domain with an existing page vector
[13:10:59] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[13:10:59] ======== ttm_bo_validate_no_placement_not_signaled  ========
[13:10:59] [PASSED] Buffer object for userspace
[13:10:59] [PASSED] Kernel buffer object
[13:10:59] [PASSED] Shared buffer object
[13:10:59] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[13:10:59] [PASSED] ttm_bo_validate_move_fence_signaled
[13:10:59] ========= ttm_bo_validate_move_fence_not_signaled  =========
[13:10:59] [PASSED] Waits for GPU
[13:10:59] [PASSED] Tries to lock straight away
[13:11:00] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[13:11:00] [PASSED] ttm_bo_validate_swapout
[13:11:00] [PASSED] ttm_bo_validate_happy_evict
[13:11:00] [PASSED] ttm_bo_validate_all_pinned_evict
[13:11:00] [PASSED] ttm_bo_validate_allowed_only_evict
[13:11:00] [PASSED] ttm_bo_validate_deleted_evict
[13:11:00] [PASSED] ttm_bo_validate_busy_domain_evict
[13:11:00] [PASSED] ttm_bo_validate_evict_gutting
[13:11:00] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[13:11:00] ================= [PASSED] ttm_bo_validate =================
[13:11:00] ============================================================
[13:11:00] Testing complete. Ran 102 tests: passed: 102
[13:11:00] Elapsed time: 9.962s total, 1.677s configuring, 7.618s building, 0.541s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


