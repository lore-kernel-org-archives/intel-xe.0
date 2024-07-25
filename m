Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E31FC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 16:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4080E10E89B;
	Thu, 25 Jul 2024 16:57:30 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87CD10E898;
 Thu, 25 Jul 2024 16:57:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/i915=3A_Fix_possible_int_o?=
 =?utf-8?q?verflow_in_skl=5Fddi=5Fcalculate=5Fwrpll=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nikita Zhandarovich" <n.zhandarovich@fintech.ru>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jul 2024 16:57:29 -0000
Message-ID: <172192664967.382977.6255967150458848343@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240724184911.12250-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20240724184911.12250-1-n.zhandarovich@fintech.ru>
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

Series: drm/i915: Fix possible int overflow in skl_ddi_calculate_wrpll()
URL   : https://patchwork.freedesktop.org/series/136513/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[16:56:21] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:56:25] Building KUnit Kernel ...
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

[16:56:50] Starting KUnit Kernel (1/1)...
[16:56:50] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[16:56:51] =================== guc_dbm (7 subtests) ===================
[16:56:51] [PASSED] test_empty
[16:56:51] [PASSED] test_default
[16:56:51] ======================== test_size  ========================
[16:56:51] [PASSED] 4
[16:56:51] [PASSED] 8
[16:56:51] [PASSED] 32
[16:56:51] [PASSED] 256
[16:56:51] ==================== [PASSED] test_size ====================
[16:56:51] ======================= test_reuse  ========================
[16:56:51] [PASSED] 4
[16:56:51] [PASSED] 8
[16:56:51] [PASSED] 32
[16:56:51] [PASSED] 256
[16:56:51] =================== [PASSED] test_reuse ====================
[16:56:51] =================== test_range_overlap  ====================
[16:56:51] [PASSED] 4
[16:56:51] [PASSED] 8
[16:56:51] [PASSED] 32
[16:56:51] [PASSED] 256
[16:56:51] =============== [PASSED] test_range_overlap ================
[16:56:51] =================== test_range_compact  ====================
[16:56:51] [PASSED] 4
[16:56:51] [PASSED] 8
[16:56:51] [PASSED] 32
[16:56:51] [PASSED] 256
[16:56:51] =============== [PASSED] test_range_compact ================
[16:56:51] ==================== test_range_spare  =====================
[16:56:51] [PASSED] 4
[16:56:51] [PASSED] 8
[16:56:51] [PASSED] 32
[16:56:51] [PASSED] 256
[16:56:51] ================ [PASSED] test_range_spare =================
[16:56:51] ===================== [PASSED] guc_dbm =====================
[16:56:51] =================== guc_idm (6 subtests) ===================
[16:56:51] [PASSED] bad_init
[16:56:51] [PASSED] no_init
[16:56:51] [PASSED] init_fini
[16:56:51] [PASSED] check_used
[16:56:51] [PASSED] check_quota
[16:56:51] [PASSED] check_all
[16:56:51] ===================== [PASSED] guc_idm =====================
[16:56:51] ================== no_relay (3 subtests) ===================
[16:56:51] [PASSED] xe_drops_guc2pf_if_not_ready
[16:56:51] [PASSED] xe_drops_guc2vf_if_not_ready
[16:56:51] [PASSED] xe_rejects_send_if_not_ready
[16:56:51] ==================== [PASSED] no_relay =====================
[16:56:51] ================== pf_relay (14 subtests) ==================
[16:56:51] [PASSED] pf_rejects_guc2pf_too_short
[16:56:51] [PASSED] pf_rejects_guc2pf_too_long
[16:56:51] [PASSED] pf_rejects_guc2pf_no_payload
[16:56:51] [PASSED] pf_fails_no_payload
[16:56:51] [PASSED] pf_fails_bad_origin
[16:56:51] [PASSED] pf_fails_bad_type
[16:56:51] [PASSED] pf_txn_reports_error
[16:56:51] [PASSED] pf_txn_sends_pf2guc
[16:56:51] [PASSED] pf_sends_pf2guc
[16:56:51] [SKIPPED] pf_loopback_nop
[16:56:51] [SKIPPED] pf_loopback_echo
[16:56:51] [SKIPPED] pf_loopback_fail
[16:56:51] [SKIPPED] pf_loopback_busy
[16:56:51] [SKIPPED] pf_loopback_retry
[16:56:51] ==================== [PASSED] pf_relay =====================
[16:56:51] ================== vf_relay (3 subtests) ===================
[16:56:51] [PASSED] vf_rejects_guc2vf_too_short
[16:56:51] [PASSED] vf_rejects_guc2vf_too_long
[16:56:51] [PASSED] vf_rejects_guc2vf_no_payload
[16:56:51] ==================== [PASSED] vf_relay =====================
[16:56:51] ================= pf_service (11 subtests) =================
[16:56:51] [PASSED] pf_negotiate_any
[16:56:51] [PASSED] pf_negotiate_base_match
[16:56:51] [PASSED] pf_negotiate_base_newer
[16:56:51] [PASSED] pf_negotiate_base_next
[16:56:51] [SKIPPED] pf_negotiate_base_older
[16:56:51] [PASSED] pf_negotiate_base_prev
[16:56:51] [PASSED] pf_negotiate_latest_match
[16:56:51] [PASSED] pf_negotiate_latest_newer
[16:56:51] [PASSED] pf_negotiate_latest_next
[16:56:51] [SKIPPED] pf_negotiate_latest_older
[16:56:51] [SKIPPED] pf_negotiate_latest_prev
[16:56:51] =================== [PASSED] pf_service ====================
[16:56:51] ===================== lmtt (1 subtest) =====================
[16:56:51] ======================== test_ops  =========================
[16:56:51] [PASSED] 2-level
[16:56:51] [PASSED] multi-level
[16:56:51] ==================== [PASSED] test_ops =====================
[16:56:51] ====================== [PASSED] lmtt =======================
[16:56:51] =================== xe_mocs (2 subtests) ===================
[16:56:51] ================ xe_live_mocs_kernel_kunit  ================
[16:56:51] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[16:56:51] ================ xe_live_mocs_reset_kunit  =================
[16:56:51] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[16:56:51] ==================== [SKIPPED] xe_mocs =====================
[16:56:51] ================= xe_migrate (2 subtests) ==================
[16:56:51] ================= xe_migrate_sanity_kunit  =================
[16:56:51] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[16:56:51] ================== xe_validate_ccs_kunit  ==================
[16:56:51] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[16:56:51] =================== [SKIPPED] xe_migrate ===================
[16:56:51] ================== xe_dma_buf (1 subtest) ==================
[16:56:51] ==================== xe_dma_buf_kunit  =====================
[16:56:51] ================ [SKIPPED] xe_dma_buf_kunit ================
[16:56:51] =================== [SKIPPED] xe_dma_buf ===================
[16:56:51] ==================== xe_bo (2 subtests) ====================
[16:56:51] ================== xe_ccs_migrate_kunit  ===================
[16:56:51] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[16:56:51] ==================== xe_bo_evict_kunit  ====================
[16:56:51] =============== [SKIPPED] xe_bo_evict_kunit ================
[16:56:51] ===================== [SKIPPED] xe_bo ======================
[16:56:51] ==================== args (11 subtests) ====================
[16:56:51] [PASSED] count_args_test
[16:56:51] [PASSED] call_args_example
[16:56:51] [PASSED] call_args_test
[16:56:51] [PASSED] drop_first_arg_example
[16:56:51] [PASSED] drop_first_arg_test
[16:56:51] [PASSED] first_arg_example
[16:56:51] [PASSED] first_arg_test
[16:56:51] [PASSED] last_arg_example
[16:56:51] [PASSED] last_arg_test
[16:56:51] [PASSED] pick_arg_example
[16:56:51] [PASSED] sep_comma_example
[16:56:51] ====================== [PASSED] args =======================
[16:56:51] =================== xe_pci (2 subtests) ====================
stty: 'standard input': Inappropriate ioctl for device
[16:56:51] [PASSED] xe_gmdid_graphics_ip
[16:56:51] [PASSED] xe_gmdid_media_ip
[16:56:51] ===================== [PASSED] xe_pci ======================
[16:56:51] ==================== xe_rtp (1 subtest) ====================
[16:56:51] ================== xe_rtp_process_tests  ===================
[16:56:51] [PASSED] coalesce-same-reg
[16:56:51] [PASSED] no-match-no-add
[16:56:51] [PASSED] match-or
[16:56:51] [PASSED] match-or-xfail
[16:56:51] [PASSED] no-match-no-add-multiple-rules
[16:56:51] [PASSED] two-regs-two-entries
[16:56:51] [PASSED] clr-one-set-other
[16:56:51] [PASSED] set-field
[16:56:51] [PASSED] conflict-duplicate
[16:56:51] [PASSED] conflict-not-disjoint
[16:56:51] [PASSED] conflict-reg-type
[16:56:51] ============== [PASSED] xe_rtp_process_tests ===============
[16:56:51] ===================== [PASSED] xe_rtp ======================
[16:56:51] ==================== xe_wa (1 subtest) =====================
[16:56:51] ======================== xe_wa_gt  =========================
[16:56:51] [PASSED] TIGERLAKE (B0)
[16:56:51] [PASSED] DG1 (A0)
[16:56:51] [PASSED] DG1 (B0)
[16:56:51] [PASSED] ALDERLAKE_S (A0)
[16:56:51] [PASSED] ALDERLAKE_S (B0)
[16:56:51] [PASSED] ALDERLAKE_S (C0)
[16:56:51] [PASSED] ALDERLAKE_S (D0)
[16:56:51] [PASSED] ALDERLAKE_P (A0)
[16:56:51] [PASSED] ALDERLAKE_P (B0)
[16:56:51] [PASSED] ALDERLAKE_P (C0)
[16:56:51] [PASSED] ALDERLAKE_S_RPLS (D0)
[16:56:51] [PASSED] ALDERLAKE_P_RPLU (E0)
[16:56:51] [PASSED] DG2_G10 (C0)
[16:56:51] [PASSED] DG2_G11 (B1)
[16:56:51] [PASSED] DG2_G12 (A1)
[16:56:51] [PASSED] METEORLAKE (g:A0, m:A0)
[16:56:51] [PASSED] METEORLAKE (g:A0, m:A0)
[16:56:51] [PASSED] METEORLAKE (g:A0, m:A0)
[16:56:51] [PASSED] LUNARLAKE (g:A0, m:A0)
[16:56:51] [PASSED] LUNARLAKE (g:B0, m:A0)
[16:56:51] ==================== [PASSED] xe_wa_gt =====================
[16:56:51] ====================== [PASSED] xe_wa ======================
[16:56:51] ============================================================
[16:56:51] Testing complete. Ran 112 tests: passed: 97, skipped: 15
[16:56:51] Elapsed time: 29.778s total, 4.262s configuring, 25.247s building, 0.218s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[16:56:51] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:56:53] Building KUnit Kernel ...
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

[16:57:14] Starting KUnit Kernel (1/1)...
[16:57:14] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[16:57:14] ============ drm_test_pick_cmdline (2 subtests) ============
[16:57:14] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[16:57:14] =============== drm_test_pick_cmdline_named  ===============
[16:57:14] [PASSED] NTSC
[16:57:14] [PASSED] NTSC-J
[16:57:14] [PASSED] PAL
[16:57:14] [PASSED] PAL-M
[16:57:14] =========== [PASSED] drm_test_pick_cmdline_named ===========
[16:57:14] ============== [PASSED] drm_test_pick_cmdline ==============
[16:57:14] ================== drm_buddy (7 subtests) ==================
[16:57:14] [PASSED] drm_test_buddy_alloc_limit
[16:57:14] [PASSED] drm_test_buddy_alloc_optimistic
[16:57:14] [PASSED] drm_test_buddy_alloc_pessimistic
[16:57:14] [PASSED] drm_test_buddy_alloc_pathological
[16:57:14] [PASSED] drm_test_buddy_alloc_contiguous
[16:57:14] [PASSED] drm_test_buddy_alloc_clear
[16:57:14] [PASSED] drm_test_buddy_alloc_range_bias
[16:57:14] ==================== [PASSED] drm_buddy ====================
[16:57:14] ============= drm_cmdline_parser (40 subtests) =============
[16:57:14] [PASSED] drm_test_cmdline_force_d_only
[16:57:14] [PASSED] drm_test_cmdline_force_D_only_dvi
[16:57:14] [PASSED] drm_test_cmdline_force_D_only_hdmi
[16:57:14] [PASSED] drm_test_cmdline_force_D_only_not_digital
[16:57:14] [PASSED] drm_test_cmdline_force_e_only
[16:57:14] [PASSED] drm_test_cmdline_res
[16:57:14] [PASSED] drm_test_cmdline_res_vesa
[16:57:14] [PASSED] drm_test_cmdline_res_vesa_rblank
[16:57:14] [PASSED] drm_test_cmdline_res_rblank
[16:57:14] [PASSED] drm_test_cmdline_res_bpp
[16:57:14] [PASSED] drm_test_cmdline_res_refresh
[16:57:14] [PASSED] drm_test_cmdline_res_bpp_refresh
[16:57:14] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[16:57:14] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[16:57:14] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[16:57:14] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[16:57:14] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[16:57:14] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[16:57:14] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[16:57:14] [PASSED] drm_test_cmdline_res_margins_force_on
[16:57:14] [PASSED] drm_test_cmdline_res_vesa_margins
[16:57:14] [PASSED] drm_test_cmdline_name
[16:57:14] [PASSED] drm_test_cmdline_name_bpp
[16:57:14] [PASSED] drm_test_cmdline_name_option
[16:57:14] [PASSED] drm_test_cmdline_name_bpp_option
[16:57:14] [PASSED] drm_test_cmdline_rotate_0
[16:57:14] [PASSED] drm_test_cmdline_rotate_90
[16:57:14] [PASSED] drm_test_cmdline_rotate_180
[16:57:14] [PASSED] drm_test_cmdline_rotate_270
[16:57:14] [PASSED] drm_test_cmdline_hmirror
[16:57:14] [PASSED] drm_test_cmdline_vmirror
[16:57:14] [PASSED] drm_test_cmdline_margin_options
[16:57:14] [PASSED] drm_test_cmdline_multiple_options
[16:57:14] [PASSED] drm_test_cmdline_bpp_extra_and_option
[16:57:14] [PASSED] drm_test_cmdline_extra_and_option
[16:57:14] [PASSED] drm_test_cmdline_freestanding_options
[16:57:14] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[16:57:14] [PASSED] drm_test_cmdline_panel_orientation
[16:57:14] ================ drm_test_cmdline_invalid  =================
[16:57:14] [PASSED] margin_only
[16:57:14] [PASSED] interlace_only
[16:57:14] [PASSED] res_missing_x
[16:57:14] [PASSED] res_missing_y
[16:57:14] [PASSED] res_bad_y
[16:57:14] [PASSED] res_missing_y_bpp
[16:57:14] [PASSED] res_bad_bpp
[16:57:14] [PASSED] res_bad_refresh
[16:57:14] [PASSED] res_bpp_refresh_force_on_off
[16:57:14] [PASSED] res_invalid_mode
[16:57:14] [PASSED] res_bpp_wrong_place_mode
[16:57:14] [PASSED] name_bpp_refresh
[16:57:14] [PASSED] name_refresh
[16:57:14] [PASSED] name_refresh_wrong_mode
[16:57:14] [PASSED] name_refresh_invalid_mode
[16:57:14] [PASSED] rotate_multiple
[16:57:14] [PASSED] rotate_invalid_val
[16:57:14] [PASSED] rotate_truncated
[16:57:14] [PASSED] invalid_option
[16:57:14] [PASSED] invalid_tv_option
[16:57:14] [PASSED] truncated_tv_option
[16:57:14] ============ [PASSED] drm_test_cmdline_invalid =============
[16:57:14] =============== drm_test_cmdline_tv_options  ===============
[16:57:14] [PASSED] NTSC
[16:57:14] [PASSED] NTSC_443
[16:57:14] [PASSED] NTSC_J
[16:57:14] [PASSED] PAL
[16:57:14] [PASSED] PAL_M
[16:57:14] [PASSED] PAL_N
[16:57:14] [PASSED] SECAM
[16:57:14] [PASSED] MONO_525
[16:57:14] [PASSED] MONO_625
[16:57:14] =========== [PASSED] drm_test_cmdline_tv_options ===========
[16:57:14] =============== [PASSED] drm_cmdline_parser ================
[16:57:14] ========== drmm_connector_hdmi_init (19 subtests) ==========
[16:57:14] [PASSED] drm_test_connector_hdmi_init_valid
[16:57:14] [PASSED] drm_test_connector_hdmi_init_bpc_8
[16:57:14] [PASSED] drm_test_connector_hdmi_init_bpc_10
[16:57:14] [PASSED] drm_test_connector_hdmi_init_bpc_12
[16:57:14] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[16:57:14] [PASSED] drm_test_connector_hdmi_init_bpc_null
[16:57:14] [PASSED] drm_test_connector_hdmi_init_formats_empty
[16:57:14] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[16:57:14] [PASSED] drm_test_connector_hdmi_init_null_ddc
[16:57:14] [PASSED] drm_test_connector_hdmi_init_null_product
[16:57:14] [PASSED] drm_test_connector_hdmi_init_null_vendor
[16:57:14] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[16:57:14] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[16:57:14] [PASSED] drm_test_connector_hdmi_init_product_valid
[16:57:14] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[16:57:14] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[16:57:14] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[16:57:14] ========= drm_test_connector_hdmi_init_type_valid  =========
[16:57:14] [PASSED] HDMI-A
[16:57:14] [PASSED] HDMI-B
[16:57:14] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[16:57:14] ======== drm_test_connector_hdmi_init_type_invalid  ========
[16:57:14] [PASSED] Unknown
[16:57:14] [PASSED] VGA
[16:57:14] [PASSED] DVI-I
[16:57:14] [PASSED] DVI-D
[16:57:14] [PASSED] DVI-A
[16:57:14] [PASSED] Composite
[16:57:14] [PASSED] SVIDEO
[16:57:14] [PASSED] LVDS
[16:57:14] [PASSED] Component
[16:57:14] [PASSED] DIN
[16:57:14] [PASSED] DP
[16:57:14] [PASSED] TV
[16:57:14] [PASSED] eDP
[16:57:14] [PASSED] Virtual
[16:57:14] [PASSED] DSI
[16:57:14] [PASSED] DPI
[16:57:14] [PASSED] Writeback
[16:57:14] [PASSED] SPI
[16:57:14] [PASSED] USB
[16:57:14] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[16:57:14] ============ [PASSED] drmm_connector_hdmi_init =============
[16:57:14] ============= drmm_connector_init (3 subtests) =============
[16:57:14] [PASSED] drm_test_drmm_connector_init
[16:57:14] [PASSED] drm_test_drmm_connector_init_null_ddc
[16:57:14] ========= drm_test_drmm_connector_init_type_valid  =========
[16:57:14] [PASSED] Unknown
[16:57:14] [PASSED] VGA
[16:57:14] [PASSED] DVI-I
[16:57:14] [PASSED] DVI-D
[16:57:14] [PASSED] DVI-A
[16:57:14] [PASSED] Composite
[16:57:14] [PASSED] SVIDEO
[16:57:14] [PASSED] LVDS
[16:57:14] [PASSED] Component
[16:57:14] [PASSED] DIN
[16:57:14] [PASSED] DP
[16:57:14] [PASSED] HDMI-A
[16:57:14] [PASSED] HDMI-B
[16:57:14] [PASSED] TV
[16:57:14] [PASSED] eDP
[16:57:14] [PASSED] Virtual
[16:57:14] [PASSED] DSI
[16:57:14] [PASSED] DPI
[16:57:14] [PASSED] Writeback
[16:57:14] [PASSED] SPI
[16:57:14] [PASSED] USB
[16:57:14] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[16:57:14] =============== [PASSED] drmm_connector_init ===============
[16:57:14] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[16:57:14] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[16:57:14] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[16:57:14] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[16:57:14] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[16:57:14] ========== drm_test_get_tv_mode_from_name_valid  ===========
[16:57:14] [PASSED] NTSC
[16:57:14] [PASSED] NTSC-443
[16:57:14] [PASSED] NTSC-J
[16:57:14] [PASSED] PAL
[16:57:14] [PASSED] PAL-M
[16:57:14] [PASSED] PAL-N
[16:57:14] [PASSED] SECAM
[16:57:14] [PASSED] Mono
[16:57:14] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[16:57:14] [PASSED] drm_test_get_tv_mode_from_name_truncated
[16:57:14] ============ [PASSED] drm_get_tv_mode_from_name ============
[16:57:14] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[16:57:14] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[16:57:14] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[16:57:14] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[16:57:14] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[16:57:14] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[16:57:14] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[16:57:14] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[16:57:14] [PASSED] VIC 96
[16:57:14] [PASSED] VIC 97
[16:57:14] [PASSED] VIC 101
[16:57:14] [PASSED] VIC 102
[16:57:14] [PASSED] VIC 106
[16:57:14] [PASSED] VIC 107
[16:57:14] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[16:57:14] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[16:57:14] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[16:57:14] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[16:57:14] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[16:57:14] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[16:57:14] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[16:57:14] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[16:57:14] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[16:57:14] [PASSED] Automatic
[16:57:14] [PASSED] Full
[16:57:14] [PASSED] Limited 16:235
[16:57:14] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[16:57:14] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[16:57:14] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[16:57:14] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[16:57:14] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[16:57:14] [PASSED] RGB
[16:57:14] [PASSED] YUV 4:2:0
[16:57:14] [PASSED] YUV 4:2:2
[16:57:14] [PASSED] YUV 4:4:4
[16:57:14] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[16:57:14] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[16:57:14] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[16:57:14] ============= drm_damage_helper (21 subtests) ==============
[16:57:14] [PASSED] drm_test_damage_iter_no_damage
[16:57:14] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[16:57:14] [PASSED] drm_test_damage_iter_no_damage_src_moved
[16:57:14] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[16:57:14] [PASSED] drm_test_damage_iter_no_damage_not_visible
[16:57:14] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[16:57:14] [PASSED] drm_test_damage_iter_no_damage_no_fb
[16:57:14] [PASSED] drm_test_damage_iter_simple_damage
[16:57:14] [PASSED] drm_test_damage_iter_single_damage
[16:57:14] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[16:57:14] [PASSED] drm_test_damage_iter_single_damage_outside_src
[16:57:14] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[16:57:14] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[16:57:14] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[16:57:14] [PASSED] drm_test_damage_iter_single_damage_src_moved
[16:57:14] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[16:57:14] [PASSED] drm_test_damage_iter_damage
[16:57:14] [PASSED] drm_test_damage_iter_damage_one_intersect
[16:57:14] [PASSED] drm_test_damage_iter_damage_one_outside
[16:57:14] [PASSED] drm_test_damage_iter_damage_src_moved
[16:57:14] [PASSED] drm_test_damage_iter_damage_not_visible
[16:57:14] ================ [PASSED] drm_damage_helper ================
[16:57:14] ============== drm_dp_mst_helper (3 subtests) ==============
[16:57:14] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[16:57:14] [PASSED] Clock 154000 BPP 30 DSC disabled
[16:57:14] [PASSED] Clock 234000 BPP 30 DSC disabled
[16:57:14] [PASSED] Clock 297000 BPP 24 DSC disabled
[16:57:14] [PASSED] Clock 332880 BPP 24 DSC enabled
[16:57:14] [PASSED] Clock 324540 BPP 24 DSC enabled
[16:57:14] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[16:57:14] ============== drm_test_dp_mst_calc_pbn_div  ===============
[16:57:14] [PASSED] Link rate 2000000 lane count 4
[16:57:14] [PASSED] Link rate 2000000 lane count 2
[16:57:14] [PASSED] Link rate 2000000 lane count 1
[16:57:14] [PASSED] Link rate 1350000 lane count 4
[16:57:14] [PASSED] Link rate 1350000 lane count 2
[16:57:14] [PASSED] Link rate 1350000 lane count 1
[16:57:14] [PASSED] Link rate 1000000 lane count 4
[16:57:14] [PASSED] Link rate 1000000 lane count 2
[16:57:14] [PASSED] Link rate 1000000 lane count 1
[16:57:14] [PASSED] Link rate 810000 lane count 4
[16:57:14] [PASSED] Link rate 810000 lane count 2
[16:57:14] [PASSED] Link rate 810000 lane count 1
[16:57:14] [PASSED] Link rate 540000 lane count 4
[16:57:14] [PASSED] Link rate 540000 lane count 2
[16:57:14] [PASSED] Link rate 540000 lane count 1
[16:57:14] [PASSED] Link rate 270000 lane count 4
[16:57:14] [PASSED] Link rate 270000 lane count 2
[16:57:14] [PASSED] Link rate 270000 lane count 1
[16:57:14] [PASSED] Link rate 162000 lane count 4
[16:57:14] [PASSED] Link rate 162000 lane count 2
[16:57:14] [PASSED] Link rate 162000 lane count 1
[16:57:14] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[16:57:14] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[16:57:14] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[16:57:14] [PASSED] DP_POWER_UP_PHY with port number
[16:57:14] [PASSED] DP_POWER_DOWN_PHY with port number
[16:57:14] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[16:57:14] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[16:57:14] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[16:57:14] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[16:57:14] [PASSED] DP_QUERY_PAYLOAD with port number
[16:57:14] [PASSED] DP_QUERY_PAYLOAD with VCPI
[16:57:14] [PASSED] DP_REMOTE_DPCD_READ with port number
[16:57:14] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[16:57:14] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[16:57:14] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[16:57:14] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[16:57:14] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[16:57:14] [PASSED] DP_REMOTE_I2C_READ with port number
[16:57:14] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[16:57:14] [PASSED] DP_REMOTE_I2C_READ with transactions array
[16:57:14] [PASSED] DP_REMOTE_I2C_WRITE with port number
[16:57:14] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[16:57:14] [PASSED] DP_REMOTE_I2C_WRITE with data array
[16:57:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[16:57:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[16:57:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[16:57:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[16:57:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[16:57:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[16:57:14] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[16:57:14] ================ [PASSED] drm_dp_mst_helper ================
[16:57:14] ================== drm_exec (7 subtests) ===================
[16:57:14] [PASSED] sanitycheck
[16:57:14] [PASSED] test_lock
[16:57:14] [PASSED] test_lock_unlock
[16:57:14] [PASSED] test_duplicates
[16:57:14] [PASSED] test_prepare
[16:57:14] [PASSED] test_prepare_array
[16:57:14] [PASSED] test_multiple_loops
[16:57:14] ==================== [PASSED] drm_exec =====================
[16:57:14] =========== drm_format_helper_test (17 subtests) ===========
[16:57:14] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[16:57:14] [PASSED] single_pixel_source_buffer
[16:57:14] [PASSED] single_pixel_clip_rectangle
[16:57:14] [PASSED] well_known_colors
[16:57:14] [PASSED] destination_pitch
[16:57:14] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[16:57:14] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[16:57:14] [PASSED] single_pixel_source_buffer
[16:57:14] [PASSED] single_pixel_clip_rectangle
[16:57:14] [PASSED] well_known_colors
[16:57:14] [PASSED] destination_pitch
[16:57:14] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[16:57:14] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[16:57:14] [PASSED] single_pixel_source_buffer
[16:57:14] [PASSED] single_pixel_clip_rectangle
[16:57:14] [PASSED] well_known_colors
[16:57:14] [PASSED] destination_pitch
[16:57:14] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[16:57:14] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[16:57:14] [PASSED] single_pixel_source_buffer
[16:57:14] [PASSED] single_pixel_clip_rectangle
[16:57:14] [PASSED] well_known_colors
[16:57:14] [PASSED] destination_pitch
[16:57:14] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[16:57:14] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[16:57:14] [PASSED] single_pixel_source_buffer
[16:57:14] [PASSED] single_pixel_clip_rectangle
[16:57:14] [PASSED] well_known_colors
[16:57:14] [PASSED] destination_pitch
[16:57:14] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[16:57:14] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[16:57:14] [PASSED] single_pixel_source_buffer
[16:57:14] [PASSED] single_pixel_clip_rectangle
[16:57:14] [PASSED] well_known_colors
[16:57:14] [PASSED] destination_pitch
[16:57:14] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[16:57:14] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[16:57:14] [PASSED] single_pixel_source_buffer
[16:57:14] [PASSED] single_pixel_clip_rectangle
[16:57:14] [PASSED] well_known_colors
[16:57:14] [PASSED] destination_pitch
[16:57:14] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[16:57:14] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[16:57:14] [PASSED] single_pixel_source_buffer
[16:57:14] [PASSED] single_pixel_clip_rectangle
[16:57:14] [PASSED] well_known_colors
[16:57:14] [PASSED] destination_pitch
[16:57:14] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[16:57:14] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[16:57:14] [PASSED] single_pixel_source_buffer
[16:57:14] [PASSED] single_pixel_clip_rectangle
[16:57:14] [PASSED] well_known_colors
[16:57:14] [PASSED] destination_pitch
[16:57:14] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[16:57:14] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[16:57:14] [PASSED] single_pixel_source_buffer
[16:57:14] [PASSED] single_pixel_clip_rectangle
[16:57:14] [PASSED] well_known_colors
[16:57:14] [PASSED] destination_pitch
[16:57:14] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[16:57:14] ============== drm_test_fb_xrgb8888_to_mono  ===============
[16:57:14] [PASSED] single_pixel_source_buffer
[16:57:14] [PASSED] single_pixel_clip_rectangle
[16:57:14] [PASSED] well_known_colors
[16:57:14] [PASSED] destination_pitch
[16:57:14] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[16:57:14] ==================== drm_test_fb_swab  =====================
[16:57:14] [PASSED] single_pixel_source_buffer
[16:57:14] [PASSED] single_pixel_clip_rectangle
[16:57:14] [PASSED] well_known_colors
[16:57:14] [PASSED] destination_pitch
[16:57:14] ================ [PASSED] drm_test_fb_swab =================
[16:57:14] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[16:57:14] [PASSED] single_pixel_source_buffer
[16:57:14] [PASSED] single_pixel_clip_rectangle
[16:57:14] [PASSED] well_known_colors
[16:57:14] [PASSED] destination_pitch
[16:57:14] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[16:57:14] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[16:57:14] [PASSED] single_pixel_source_buffer
[16:57:14] [PASSED] single_pixel_clip_rectangle
[16:57:14] [PASSED] well_known_colors
[16:57:14] [PASSED] destination_pitch
[16:57:14] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[16:57:14] ================= drm_test_fb_clip_offset  =================
[16:57:14] [PASSED] pass through
[16:57:14] [PASSED] horizontal offset
[16:57:14] [PASSED] vertical offset
[16:57:14] [PASSED] horizontal and vertical offset
[16:57:14] [PASSED] horizontal offset (custom pitch)
[16:57:14] [PASSED] vertical offset (custom pitch)
[16:57:14] [PASSED] horizontal and vertical offset (custom pitch)
[16:57:14] ============= [PASSED] drm_test_fb_clip_offset =============
[16:57:14] ============== drm_test_fb_build_fourcc_list  ==============
[16:57:14] [PASSED] no native formats
[16:57:14] [PASSED] XRGB8888 as native format
[16:57:14] [PASSED] remove duplicates
[16:57:14] [PASSED] convert alpha formats
[16:57:14] [PASSED] random formats
[16:57:14] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[16:57:14] =================== drm_test_fb_memcpy  ====================
[16:57:14] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[16:57:14] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[16:57:14] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[16:57:14] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[16:57:14] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[16:57:14] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[16:57:14] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[16:57:14] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[16:57:14] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[16:57:14] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[16:57:14] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[16:57:14] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[16:57:14] =============== [PASSED] drm_test_fb_memcpy ================
[16:57:14] ============= [PASSED] drm_format_helper_test ==============
[16:57:14] ================= drm_format (18 subtests) =================
[16:57:14] [PASSED] drm_test_format_block_width_invalid
[16:57:14] [PASSED] drm_test_format_block_width_one_plane
[16:57:14] [PASSED] drm_test_format_block_width_two_plane
[16:57:14] [PASSED] drm_test_format_block_width_three_plane
[16:57:14] [PASSED] drm_test_format_block_width_tiled
[16:57:14] [PASSED] drm_test_format_block_height_invalid
[16:57:14] [PASSED] drm_test_format_block_height_one_plane
[16:57:14] [PASSED] drm_test_format_block_height_two_plane
[16:57:14] [PASSED] drm_test_format_block_height_three_plane
[16:57:14] [PASSED] drm_test_format_block_height_tiled
[16:57:14] [PASSED] drm_test_format_min_pitch_invalid
[16:57:14] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[16:57:14] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[16:57:14] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[16:57:14] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[16:57:14] [PASSED] drm_test_format_min_pitch_two_plane
[16:57:14] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[16:57:14] [PASSED] drm_test_format_min_pitch_tiled
[16:57:14] =================== [PASSED] drm_format ====================
[16:57:14] =============== drm_framebuffer (1 subtest) ================
[16:57:14] =============== drm_test_framebuffer_create  ===============
[16:57:14] [PASSED] ABGR8888 normal sizes
[16:57:14] [PASSED] ABGR8888 max sizes
[16:57:14] [PASSED] ABGR8888 pitch greater than min required
[16:57:14] [PASSED] ABGR8888 pitch less than min required
[16:57:14] [PASSED] ABGR8888 Invalid width
[16:57:14] [PASSED] ABGR8888 Invalid buffer handle
[16:57:14] [PASSED] No pixel format
[16:57:14] [PASSED] ABGR8888 Width 0
[16:57:14] [PASSED] ABGR8888 Height 0
[16:57:14] [PASSED] ABGR8888 Out of bound height * pitch combination
[16:57:14] [PASSED] ABGR8888 Large buffer offset
[16:57:14] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[16:57:14] [PASSED] ABGR8888 Valid buffer modifier
[16:57:14] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[16:57:14] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[16:57:14] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[16:57:14] [PASSED] NV12 Normal sizes
[16:57:14] [PASSED] NV12 Max sizes
[16:57:14] [PASSED] NV12 Invalid pitch
[16:57:14] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[16:57:14] [PASSED] NV12 different  modifier per-plane
[16:57:14] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[16:57:14] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[16:57:14] [PASSED] NV12 Modifier for inexistent plane
[16:57:14] [PASSED] NV12 Handle for inexistent plane
[16:57:14] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[16:57:14] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[16:57:14] [PASSED] YVU420 Normal sizes
[16:57:14] [PASSED] YVU420 Max sizes
[16:57:14] [PASSED] YVU420 Invalid pitch
[16:57:14] [PASSED] YVU420 Different pitches
[16:57:14] [PASSED] YVU420 Different buffer offsets/pitches
[16:57:14] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[16:57:14] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[16:57:14] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[16:57:14] [PASSED] YVU420 Valid modifier
[16:57:14] [PASSED] YVU420 Different modifiers per plane
[16:57:14] [PASSED] YVU420 Modifier for inexistent plane
[16:57:14] [PASSED] X0L2 Normal sizes
[16:57:14] [PASSED] X0L2 Max sizes
[16:57:14] [PASSED] X0L2 Invalid pitch
[16:57:14] [PASSED] X0L2 Pitch greater than minimum required
[16:57:14] [PASSED] X0L2 Handle for inexistent plane
[16:57:14] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[16:57:14] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[16:57:14] [PASSED] X0L2 Valid modifier
[16:57:14] [PASSED] X0L2 Modifier for inexistent plane
[16:57:14] =========== [PASSED] drm_test_framebuffer_create ===========
[16:57:14] ================= [PASSED] drm_framebuffer =================
[16:57:14] ================ drm_gem_shmem (8 subtests) ================
[16:57:14] [PASSED] drm_gem_shmem_test_obj_create
[16:57:14] [PASSED] drm_gem_shmem_test_obj_create_private
[16:57:14] [PASSED] drm_gem_shmem_test_pin_pages
[16:57:14] [PASSED] drm_gem_shmem_test_vmap
[16:57:14] [PASSED] drm_gem_shmem_test_get_pages_sgt
[16:57:14] [PASSED] drm_gem_shmem_test_get_sg_table
[16:57:14] [PASSED] drm_gem_shmem_test_madvise
[16:57:14] [PASSED] drm_gem_shmem_test_purge
[16:57:14] ================== [PASSED] drm_gem_shmem ==================
[16:57:14] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[16:57:14] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[16:57:14] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[16:57:14] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[16:57:14] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[16:57:14] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[16:57:14] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[16:57:14] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[16:57:14] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[16:57:14] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[16:57:14] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[16:57:14] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[16:57:14] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[16:57:14] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[16:57:14] [PASSED] drm_test_check_output_bpc_dvi
[16:57:14] [PASSED] drm_test_check_output_bpc_format_vic_1
[16:57:14] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[16:57:14] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[16:57:14] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[16:57:14] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[16:57:14] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[16:57:14] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[16:57:14] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[16:57:14] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[16:57:14] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[16:57:14] [PASSED] drm_test_check_broadcast_rgb_value
[16:57:14] [PASSED] drm_test_check_bpc_8_value
[16:57:14] [PASSED] drm_test_check_bpc_10_value
[16:57:14] [PASSED] drm_test_check_bpc_12_value
[16:57:14] [PASSED] drm_test_check_format_value
[16:57:14] [PASSED] drm_test_check_tmds_char_value
[16:57:14] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[16:57:14] ================= drm_managed (2 subtests) =================
[16:57:14] [PASSED] drm_test_managed_release_action
[16:57:14] [PASSED] drm_test_managed_run_action
[16:57:14] =================== [PASSED] drm_managed ===================
[16:57:14] =================== drm_mm (6 subtests) ====================
[16:57:14] [PASSED] drm_test_mm_init
[16:57:14] [PASSED] drm_test_mm_debug
[16:57:14] [PASSED] drm_test_mm_align32
[16:57:14] [PASSED] drm_test_mm_align64
[16:57:14] [PASSED] drm_test_mm_lowest
[16:57:14] [PASSED] drm_test_mm_highest
[16:57:14] ===================== [PASSED] drm_mm ======================
[16:57:14] ============= drm_modes_analog_tv (5 subtests) =============
[16:57:14] [PASSED] drm_test_modes_analog_tv_mono_576i
[16:57:14] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[16:57:14] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[16:57:14] [PASSED] drm_test_modes_analog_tv_pal_576i
[16:57:14] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[16:57:14] =============== [PASSED] drm_modes_analog_tv ===============
[16:57:14] ============== drm_plane_helper (2 subtests) ===============
[16:57:14] =============== drm_test_check_plane_state  ================
[16:57:14] [PASSED] clipping_simple
[16:57:14] [PASSED] clipping_rotate_reflect
[16:57:14] [PASSED] positioning_simple
[16:57:14] [PASSED] upscaling
[16:57:14] [PASSED] downscaling
[16:57:14] [PASSED] rounding1
[16:57:14] [PASSED] rounding2
[16:57:14] [PASSED] rounding3
[16:57:14] [PASSED] rounding4
[16:57:14] =========== [PASSED] drm_test_check_plane_state ============
[16:57:14] =========== drm_test_check_invalid_plane_state  ============
[16:57:14] [PASSED] positioning_invalid
[16:57:14] [PASSED] upscaling_invalid
stty: 'standard input': Inappropriate ioctl for device
[16:57:14] [PASSED] downscaling_invalid
[16:57:14] ======= [PASSED] drm_test_check_invalid_plane_state ========
[16:57:14] ================ [PASSED] drm_plane_helper =================
[16:57:14] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[16:57:14] ====== drm_test_connector_helper_tv_get_modes_check  =======
[16:57:14] [PASSED] None
[16:57:14] [PASSED] PAL
[16:57:14] [PASSED] NTSC
[16:57:14] [PASSED] Both, NTSC Default
[16:57:14] [PASSED] Both, PAL Default
[16:57:14] [PASSED] Both, NTSC Default, with PAL on command-line
[16:57:14] [PASSED] Both, PAL Default, with NTSC on command-line
[16:57:14] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[16:57:14] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[16:57:14] ================== drm_rect (9 subtests) ===================
[16:57:14] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[16:57:14] [PASSED] drm_test_rect_clip_scaled_not_clipped
[16:57:14] [PASSED] drm_test_rect_clip_scaled_clipped
[16:57:14] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[16:57:14] ================= drm_test_rect_intersect  =================
[16:57:14] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[16:57:14] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[16:57:14] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[16:57:14] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[16:57:14] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[16:57:14] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[16:57:14] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[16:57:14] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[16:57:14] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[16:57:14] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[16:57:14] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[16:57:14] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[16:57:14] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[16:57:14] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[16:57:14] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[16:57:14] ============= [PASSED] drm_test_rect_intersect =============
[16:57:14] ================ drm_test_rect_calc_hscale  ================
[16:57:14] [PASSED] normal use
[16:57:14] [PASSED] out of max range
[16:57:14] [PASSED] out of min range
[16:57:14] [PASSED] zero dst
[16:57:14] [PASSED] negative src
[16:57:14] [PASSED] negative dst
[16:57:14] ============ [PASSED] drm_test_rect_calc_hscale ============
[16:57:14] ================ drm_test_rect_calc_vscale  ================
[16:57:14] [PASSED] normal use
[16:57:14] [PASSED] out of max range
[16:57:14] [PASSED] out of min range
[16:57:14] [PASSED] zero dst
[16:57:14] [PASSED] negative src
[16:57:14] [PASSED] negative dst
[16:57:14] ============ [PASSED] drm_test_rect_calc_vscale ============
[16:57:14] ================== drm_test_rect_rotate  ===================
[16:57:14] [PASSED] reflect-x
[16:57:14] [PASSED] reflect-y
[16:57:14] [PASSED] rotate-0
[16:57:14] [PASSED] rotate-90
[16:57:14] [PASSED] rotate-180
[16:57:14] [PASSED] rotate-270
[16:57:14] ============== [PASSED] drm_test_rect_rotate ===============
[16:57:14] ================ drm_test_rect_rotate_inv  =================
[16:57:14] [PASSED] reflect-x
[16:57:14] [PASSED] reflect-y
[16:57:14] [PASSED] rotate-0
[16:57:14] [PASSED] rotate-90
[16:57:14] [PASSED] rotate-180
[16:57:14] [PASSED] rotate-270
[16:57:14] ============ [PASSED] drm_test_rect_rotate_inv =============
[16:57:14] ==================== [PASSED] drm_rect =====================
[16:57:14] ============================================================
[16:57:14] Testing complete. Ran 515 tests: passed: 515
[16:57:14] Elapsed time: 23.518s total, 1.696s configuring, 21.626s building, 0.194s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[16:57:14] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:57:16] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[16:57:25] Starting KUnit Kernel (1/1)...
[16:57:25] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[16:57:25] ================= ttm_device (5 subtests) ==================
[16:57:25] [PASSED] ttm_device_init_basic
[16:57:25] [PASSED] ttm_device_init_multiple
[16:57:25] [PASSED] ttm_device_fini_basic
[16:57:25] [PASSED] ttm_device_init_no_vma_man
[16:57:25] ================== ttm_device_init_pools  ==================
[16:57:25] [PASSED] No DMA allocations, no DMA32 required
[16:57:25] [PASSED] DMA allocations, DMA32 required
[16:57:25] [PASSED] No DMA allocations, DMA32 required
[16:57:25] [PASSED] DMA allocations, no DMA32 required
[16:57:25] ============== [PASSED] ttm_device_init_pools ==============
[16:57:25] =================== [PASSED] ttm_device ====================
[16:57:25] ================== ttm_pool (8 subtests) ===================
[16:57:25] ================== ttm_pool_alloc_basic  ===================
[16:57:25] [PASSED] One page
[16:57:25] [PASSED] More than one page
[16:57:25] [PASSED] Above the allocation limit
[16:57:25] [PASSED] One page, with coherent DMA mappings enabled
[16:57:25] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[16:57:25] ============== [PASSED] ttm_pool_alloc_basic ===============
[16:57:25] ============== ttm_pool_alloc_basic_dma_addr  ==============
[16:57:25] [PASSED] One page
[16:57:25] [PASSED] More than one page
[16:57:25] [PASSED] Above the allocation limit
[16:57:25] [PASSED] One page, with coherent DMA mappings enabled
[16:57:25] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[16:57:25] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[16:57:25] [PASSED] ttm_pool_alloc_order_caching_match
[16:57:25] [PASSED] ttm_pool_alloc_caching_mismatch
[16:57:25] [PASSED] ttm_pool_alloc_order_mismatch
[16:57:25] [PASSED] ttm_pool_free_dma_alloc
[16:57:25] [PASSED] ttm_pool_free_no_dma_alloc
[16:57:25] [PASSED] ttm_pool_fini_basic
[16:57:25] ==================== [PASSED] ttm_pool =====================
[16:57:25] ================ ttm_resource (8 subtests) =================
[16:57:25] ================= ttm_resource_init_basic  =================
[16:57:25] [PASSED] Init resource in TTM_PL_SYSTEM
[16:57:25] [PASSED] Init resource in TTM_PL_VRAM
[16:57:25] [PASSED] Init resource in a private placement
[16:57:25] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[16:57:25] ============= [PASSED] ttm_resource_init_basic =============
[16:57:25] [PASSED] ttm_resource_init_pinned
[16:57:25] [PASSED] ttm_resource_fini_basic
[16:57:25] [PASSED] ttm_resource_manager_init_basic
[16:57:25] [PASSED] ttm_resource_manager_usage_basic
[16:57:25] [PASSED] ttm_resource_manager_set_used_basic
[16:57:25] [PASSED] ttm_sys_man_alloc_basic
[16:57:25] [PASSED] ttm_sys_man_free_basic
[16:57:25] ================== [PASSED] ttm_resource ===================
[16:57:25] =================== ttm_tt (15 subtests) ===================
[16:57:25] ==================== ttm_tt_init_basic  ====================
[16:57:25] [PASSED] Page-aligned size
[16:57:25] [PASSED] Extra pages requested
[16:57:25] ================ [PASSED] ttm_tt_init_basic ================
[16:57:25] [PASSED] ttm_tt_init_misaligned
[16:57:25] [PASSED] ttm_tt_fini_basic
[16:57:25] [PASSED] ttm_tt_fini_sg
[16:57:25] [PASSED] ttm_tt_fini_shmem
[16:57:25] [PASSED] ttm_tt_create_basic
[16:57:25] [PASSED] ttm_tt_create_invalid_bo_type
[16:57:25] [PASSED] ttm_tt_create_ttm_exists
[16:57:25] [PASSED] ttm_tt_create_failed
[16:57:25] [PASSED] ttm_tt_destroy_basic
[16:57:25] [PASSED] ttm_tt_populate_null_ttm
[16:57:25] [PASSED] ttm_tt_populate_populated_ttm
[16:57:25] [PASSED] ttm_tt_unpopulate_basic
[16:57:25] [PASSED] ttm_tt_unpopulate_empty_ttm
[16:57:25] [PASSED] ttm_tt_swapin_basic
[16:57:25] ===================== [PASSED] ttm_tt ======================
[16:57:25] =================== ttm_bo (14 subtests) ===================
[16:57:25] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[16:57:25] [PASSED] Cannot be interrupted and sleeps
[16:57:25] [PASSED] Cannot be interrupted, locks straight away
[16:57:25] [PASSED] Can be interrupted, sleeps
[16:57:25] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[16:57:25] [PASSED] ttm_bo_reserve_locked_no_sleep
[16:57:25] [PASSED] ttm_bo_reserve_no_wait_ticket
[16:57:25] [PASSED] ttm_bo_reserve_double_resv
[16:57:25] [PASSED] ttm_bo_reserve_interrupted
[16:57:25] [PASSED] ttm_bo_reserve_deadlock
[16:57:25] [PASSED] ttm_bo_unreserve_basic
[16:57:25] [PASSED] ttm_bo_unreserve_pinned
[16:57:25] [PASSED] ttm_bo_unreserve_bulk
[16:57:25] [PASSED] ttm_bo_put_basic
[16:57:25] [PASSED] ttm_bo_put_shared_resv
[16:57:25] [PASSED] ttm_bo_pin_basic
[16:57:25] [PASSED] ttm_bo_pin_unpin_resource
[16:57:25] [PASSED] ttm_bo_multiple_pin_one_unpin
[16:57:25] ===================== [PASSED] ttm_bo ======================
[16:57:25] ============== ttm_bo_validate (22 subtests) ===============
[16:57:25] ============== ttm_bo_init_reserved_sys_man  ===============
[16:57:25] [PASSED] Buffer object for userspace
[16:57:25] [PASSED] Kernel buffer object
[16:57:25] [PASSED] Shared buffer object
[16:57:25] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[16:57:25] ============== ttm_bo_init_reserved_mock_man  ==============
[16:57:25] [PASSED] Buffer object for userspace
[16:57:25] [PASSED] Kernel buffer object
[16:57:25] [PASSED] Shared buffer object
[16:57:25] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[16:57:25] [PASSED] ttm_bo_init_reserved_resv
[16:57:25] ================== ttm_bo_validate_basic  ==================
[16:57:25] [PASSED] Buffer object for userspace
[16:57:25] [PASSED] Kernel buffer object
[16:57:25] [PASSED] Shared buffer object
[16:57:25] ============== [PASSED] ttm_bo_validate_basic ==============
[16:57:25] [PASSED] ttm_bo_validate_invalid_placement
[16:57:25] ============= ttm_bo_validate_same_placement  ==============
[16:57:25] [PASSED] System manager
[16:57:25] [PASSED] VRAM manager
[16:57:25] ========= [PASSED] ttm_bo_validate_same_placement ==========
[16:57:25] [PASSED] ttm_bo_validate_failed_alloc
[16:57:25] [PASSED] ttm_bo_validate_pinned
[16:57:25] [PASSED] ttm_bo_validate_busy_placement
[16:57:25] ================ ttm_bo_validate_multihop  =================
[16:57:25] [PASSED] Buffer object for userspace
[16:57:25] [PASSED] Kernel buffer object
[16:57:25] [PASSED] Shared buffer object
[16:57:25] ============ [PASSED] ttm_bo_validate_multihop =============
[16:57:25] ========== ttm_bo_validate_no_placement_signaled  ==========
[16:57:25] [PASSED] Buffer object in system domain, no page vector
[16:57:25] [PASSED] Buffer object in system domain with an existing page vector
[16:57:25] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[16:57:25] ======== ttm_bo_validate_no_placement_not_signaled  ========
[16:57:25] [PASSED] Buffer object for userspace
[16:57:25] [PASSED] Kernel buffer object
[16:57:25] [PASSED] Shared buffer object
[16:57:25] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[16:57:25] [PASSED] ttm_bo_validate_move_fence_signaled
[16:57:25] ========= ttm_bo_validate_move_fence_not_signaled  =========
[16:57:25] [PASSED] Waits for GPU
[16:57:25] [PASSED] Tries to lock straight away
[16:57:25] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[16:57:25] [PASSED] ttm_bo_validate_swapout
[16:57:25] [PASSED] ttm_bo_validate_happy_evict
[16:57:25] [PASSED] ttm_bo_validate_all_pinned_evict
[16:57:25] [PASSED] ttm_bo_validate_allowed_only_evict
[16:57:25] [PASSED] ttm_bo_validate_deleted_evict
[16:57:25] [PASSED] ttm_bo_validate_busy_domain_evict
[16:57:25] [PASSED] ttm_bo_validate_evict_gutting
[16:57:25] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[16:57:25] ================= [PASSED] ttm_bo_validate =================
[16:57:25] ============================================================
[16:57:25] Testing complete. Ran 102 tests: passed: 102
[16:57:26] Elapsed time: 11.138s total, 1.738s configuring, 8.779s building, 0.516s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


