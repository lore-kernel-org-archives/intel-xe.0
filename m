Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6BBC25B79
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 14:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F22810F53A;
	Mon, 27 May 2024 14:07:06 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DBB10E328;
 Mon, 27 May 2024 14:07:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Allow_migrate_vm_gpu?=
 =?utf-8?q?_submissions_from_reclaim_context?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 May 2024 14:07:03 -0000
Message-ID: <171681882353.2213173.14513385058730263028@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240527135912.152156-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240527135912.152156-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Allow migrate vm gpu submissions from reclaim context
URL   : https://patchwork.freedesktop.org/series/134087/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[14:06:06] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:06:11] Building KUnit Kernel ...
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

[14:06:37] Starting KUnit Kernel (1/1)...
[14:06:37] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[14:06:37] =================== guc_dbm (7 subtests) ===================
[14:06:37] [PASSED] test_empty
[14:06:37] [PASSED] test_default
[14:06:37] ======================== test_size  ========================
[14:06:37] [PASSED] 4
[14:06:37] [PASSED] 8
[14:06:37] [PASSED] 32
[14:06:37] [PASSED] 256
[14:06:37] ==================== [PASSED] test_size ====================
[14:06:37] ======================= test_reuse  ========================
[14:06:37] [PASSED] 4
[14:06:37] [PASSED] 8
[14:06:37] [PASSED] 32
[14:06:37] [PASSED] 256
[14:06:37] =================== [PASSED] test_reuse ====================
[14:06:37] =================== test_range_overlap  ====================
[14:06:37] [PASSED] 4
[14:06:37] [PASSED] 8
[14:06:37] [PASSED] 32
[14:06:37] [PASSED] 256
[14:06:37] =============== [PASSED] test_range_overlap ================
[14:06:37] =================== test_range_compact  ====================
[14:06:37] [PASSED] 4
[14:06:37] [PASSED] 8
[14:06:37] [PASSED] 32
[14:06:37] [PASSED] 256
[14:06:37] =============== [PASSED] test_range_compact ================
[14:06:37] ==================== test_range_spare  =====================
[14:06:37] [PASSED] 4
[14:06:37] [PASSED] 8
[14:06:37] [PASSED] 32
[14:06:37] [PASSED] 256
[14:06:37] ================ [PASSED] test_range_spare =================
[14:06:37] ===================== [PASSED] guc_dbm =====================
[14:06:37] =================== guc_idm (6 subtests) ===================
[14:06:37] [PASSED] bad_init
[14:06:37] [PASSED] no_init
[14:06:37] [PASSED] init_fini
[14:06:37] [PASSED] check_used
[14:06:37] [PASSED] check_quota
[14:06:37] [PASSED] check_all
[14:06:37] ===================== [PASSED] guc_idm =====================
[14:06:37] ================== no_relay (3 subtests) ===================
[14:06:37] [PASSED] xe_drops_guc2pf_if_not_ready
[14:06:37] [PASSED] xe_drops_guc2vf_if_not_ready
[14:06:37] [PASSED] xe_rejects_send_if_not_ready
[14:06:37] ==================== [PASSED] no_relay =====================
[14:06:37] ================== pf_relay (14 subtests) ==================
[14:06:37] [PASSED] pf_rejects_guc2pf_too_short
[14:06:37] [PASSED] pf_rejects_guc2pf_too_long
[14:06:37] [PASSED] pf_rejects_guc2pf_no_payload
[14:06:37] [PASSED] pf_fails_no_payload
[14:06:37] [PASSED] pf_fails_bad_origin
[14:06:37] [PASSED] pf_fails_bad_type
[14:06:37] [PASSED] pf_txn_reports_error
[14:06:37] [PASSED] pf_txn_sends_pf2guc
[14:06:37] [PASSED] pf_sends_pf2guc
[14:06:37] [SKIPPED] pf_loopback_nop
[14:06:37] [SKIPPED] pf_loopback_echo
[14:06:37] [SKIPPED] pf_loopback_fail
[14:06:37] [SKIPPED] pf_loopback_busy
[14:06:37] [SKIPPED] pf_loopback_retry
[14:06:37] ==================== [PASSED] pf_relay =====================
[14:06:37] ================== vf_relay (3 subtests) ===================
[14:06:37] [PASSED] vf_rejects_guc2vf_too_short
[14:06:37] [PASSED] vf_rejects_guc2vf_too_long
[14:06:37] [PASSED] vf_rejects_guc2vf_no_payload
[14:06:37] ==================== [PASSED] vf_relay =====================
[14:06:37] ================= pf_service (11 subtests) =================
[14:06:37] [PASSED] pf_negotiate_any
[14:06:37] [PASSED] pf_negotiate_base_match
[14:06:37] [PASSED] pf_negotiate_base_newer
[14:06:37] [PASSED] pf_negotiate_base_next
[14:06:37] [SKIPPED] pf_negotiate_base_older
[14:06:37] [PASSED] pf_negotiate_base_prev
[14:06:37] [PASSED] pf_negotiate_latest_match
[14:06:37] [PASSED] pf_negotiate_latest_newer
[14:06:37] [PASSED] pf_negotiate_latest_next
[14:06:37] [SKIPPED] pf_negotiate_latest_older
[14:06:37] [SKIPPED] pf_negotiate_latest_prev
[14:06:37] =================== [PASSED] pf_service ====================
[14:06:37] ===================== lmtt (1 subtest) =====================
[14:06:37] ======================== test_ops  =========================
[14:06:37] [PASSED] 2-level
[14:06:37] [PASSED] multi-level
[14:06:37] ==================== [PASSED] test_ops =====================
[14:06:37] ====================== [PASSED] lmtt =======================
[14:06:37] ==================== xe_bo (2 subtests) ====================
[14:06:37] [SKIPPED] xe_ccs_migrate_kunit
[14:06:37] [SKIPPED] xe_bo_evict_kunit
[14:06:37] ===================== [SKIPPED] xe_bo ======================
[14:06:37] ================== xe_dma_buf (1 subtest) ==================
[14:06:37] [SKIPPED] xe_dma_buf_kunit
[14:06:37] =================== [SKIPPED] xe_dma_buf ===================
[14:06:37] ================== xe_migrate (1 subtest) ==================
[14:06:37] [SKIPPED] xe_migrate_sanity_kunit
[14:06:37] =================== [SKIPPED] xe_migrate ===================
[14:06:37] =================== xe_mocs (2 subtests) ===================
[14:06:37] [SKIPPED] xe_live_mocs_kernel_kunit
[14:06:37] [SKIPPED] xe_live_mocs_reset_kunit
[14:06:37] ==================== [SKIPPED] xe_mocs =====================
[14:06:37] ==================== args (11 subtests) ====================
[14:06:37] [PASSED] count_args_test
[14:06:37] [PASSED] call_args_example
[14:06:37] [PASSED] call_args_test
[14:06:37] [PASSED] drop_first_arg_example
[14:06:37] [PASSED] drop_first_arg_test
[14:06:37] [PASSED] first_arg_example
[14:06:37] [PASSED] first_arg_test
[14:06:37] [PASSED] last_arg_example
[14:06:37] [PASSED] last_arg_test
[14:06:37] [PASSED] pick_arg_example
[14:06:37] [PASSED] sep_comma_example
[14:06:37] ====================== [PASSED] args =======================
[14:06:37] =================== xe_pci (2 subtests) ====================
[14:06:37] [PASSED] xe_gmdid_graphics_ip
[14:06:37] [PASSED] xe_gmdid_media_ip
[14:06:37] ===================== [PASSED] xe_pci ======================
[14:06:37] ==================== xe_rtp (1 subtest) ====================
[14:06:37] ================== xe_rtp_process_tests  ===================
[14:06:37] [PASSED] coalesce-same-reg
[14:06:37] [PASSED] no-match-no-add
[14:06:37] [PASSED] no-match-no-add-multiple-rules
[14:06:37] [PASSED] two-regs-two-entries
[14:06:37] [PASSED] clr-one-set-other
[14:06:37] [PASSED] set-field
[14:06:37] [PASSED] conflict-duplicate
[14:06:37] [PASSED] conflict-not-disjoint
[14:06:37] [PASSED] conflict-reg-type
[14:06:37] ============== [PASSED] xe_rtp_process_tests ===============
stty: 'standard input': Inappropriate ioctl for device
[14:06:37] ===================== [PASSED] xe_rtp ======================
[14:06:37] ==================== xe_wa (1 subtest) =====================
[14:06:37] ======================== xe_wa_gt  =========================
[14:06:37] [PASSED] TIGERLAKE (B0)
[14:06:37] [PASSED] DG1 (A0)
[14:06:37] [PASSED] DG1 (B0)
[14:06:37] [PASSED] ALDERLAKE_S (A0)
[14:06:37] [PASSED] ALDERLAKE_S (B0)
[14:06:37] [PASSED] ALDERLAKE_S (C0)
[14:06:37] [PASSED] ALDERLAKE_S (D0)
[14:06:37] [PASSED] ALDERLAKE_P (A0)
[14:06:37] [PASSED] ALDERLAKE_P (B0)
[14:06:37] [PASSED] ALDERLAKE_P (C0)
[14:06:37] [PASSED] ALDERLAKE_S_RPLS (D0)
[14:06:37] [PASSED] ALDERLAKE_P_RPLU (E0)
[14:06:37] [PASSED] DG2_G10 (C0)
[14:06:37] [PASSED] DG2_G11 (B1)
[14:06:37] [PASSED] DG2_G12 (A1)
[14:06:37] [PASSED] METEORLAKE (g:A0, m:A0)
[14:06:37] [PASSED] METEORLAKE (g:A0, m:A0)
[14:06:37] [PASSED] METEORLAKE (g:A0, m:A0)
[14:06:37] [PASSED] LUNARLAKE (g:A0, m:A0)
[14:06:37] [PASSED] LUNARLAKE (g:B0, m:A0)
[14:06:37] ==================== [PASSED] xe_wa_gt =====================
[14:06:37] ====================== [PASSED] xe_wa ======================
[14:06:37] ============================================================
[14:06:37] Testing complete. Ran 109 tests: passed: 95, skipped: 14
[14:06:37] Elapsed time: 30.771s total, 4.284s configuring, 26.267s building, 0.174s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[14:06:37] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:06:39] Building KUnit Kernel ...
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

[14:07:00] Starting KUnit Kernel (1/1)...
[14:07:00] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[14:07:00] ============ drm_test_pick_cmdline (2 subtests) ============
[14:07:00] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[14:07:00] =============== drm_test_pick_cmdline_named  ===============
[14:07:00] [PASSED] NTSC
[14:07:00] [PASSED] NTSC-J
[14:07:00] [PASSED] PAL
[14:07:00] [PASSED] PAL-M
[14:07:00] =========== [PASSED] drm_test_pick_cmdline_named ===========
[14:07:00] ============== [PASSED] drm_test_pick_cmdline ==============
[14:07:00] ================== drm_buddy (7 subtests) ==================
[14:07:00] [PASSED] drm_test_buddy_alloc_limit
[14:07:00] [PASSED] drm_test_buddy_alloc_optimistic
[14:07:00] [PASSED] drm_test_buddy_alloc_pessimistic
[14:07:00] [PASSED] drm_test_buddy_alloc_pathological
[14:07:00] [PASSED] drm_test_buddy_alloc_contiguous
[14:07:00] [PASSED] drm_test_buddy_alloc_clear
[14:07:00] [PASSED] drm_test_buddy_alloc_range_bias
[14:07:00] ==================== [PASSED] drm_buddy ====================
[14:07:00] ============= drm_cmdline_parser (40 subtests) =============
[14:07:00] [PASSED] drm_test_cmdline_force_d_only
[14:07:00] [PASSED] drm_test_cmdline_force_D_only_dvi
[14:07:00] [PASSED] drm_test_cmdline_force_D_only_hdmi
[14:07:00] [PASSED] drm_test_cmdline_force_D_only_not_digital
[14:07:00] [PASSED] drm_test_cmdline_force_e_only
[14:07:00] [PASSED] drm_test_cmdline_res
[14:07:00] [PASSED] drm_test_cmdline_res_vesa
[14:07:00] [PASSED] drm_test_cmdline_res_vesa_rblank
[14:07:00] [PASSED] drm_test_cmdline_res_rblank
[14:07:00] [PASSED] drm_test_cmdline_res_bpp
[14:07:00] [PASSED] drm_test_cmdline_res_refresh
[14:07:00] [PASSED] drm_test_cmdline_res_bpp_refresh
[14:07:00] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[14:07:00] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[14:07:00] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[14:07:00] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[14:07:00] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[14:07:00] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[14:07:00] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[14:07:00] [PASSED] drm_test_cmdline_res_margins_force_on
[14:07:00] [PASSED] drm_test_cmdline_res_vesa_margins
[14:07:00] [PASSED] drm_test_cmdline_name
[14:07:00] [PASSED] drm_test_cmdline_name_bpp
[14:07:00] [PASSED] drm_test_cmdline_name_option
[14:07:00] [PASSED] drm_test_cmdline_name_bpp_option
[14:07:00] [PASSED] drm_test_cmdline_rotate_0
[14:07:00] [PASSED] drm_test_cmdline_rotate_90
[14:07:00] [PASSED] drm_test_cmdline_rotate_180
[14:07:00] [PASSED] drm_test_cmdline_rotate_270
[14:07:00] [PASSED] drm_test_cmdline_hmirror
[14:07:00] [PASSED] drm_test_cmdline_vmirror
[14:07:00] [PASSED] drm_test_cmdline_margin_options
[14:07:00] [PASSED] drm_test_cmdline_multiple_options
[14:07:00] [PASSED] drm_test_cmdline_bpp_extra_and_option
[14:07:00] [PASSED] drm_test_cmdline_extra_and_option
[14:07:00] [PASSED] drm_test_cmdline_freestanding_options
[14:07:00] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[14:07:00] [PASSED] drm_test_cmdline_panel_orientation
[14:07:00] ================ drm_test_cmdline_invalid  =================
[14:07:00] [PASSED] margin_only
[14:07:00] [PASSED] interlace_only
[14:07:00] [PASSED] res_missing_x
[14:07:00] [PASSED] res_missing_y
[14:07:00] [PASSED] res_bad_y
[14:07:00] [PASSED] res_missing_y_bpp
[14:07:00] [PASSED] res_bad_bpp
[14:07:00] [PASSED] res_bad_refresh
[14:07:00] [PASSED] res_bpp_refresh_force_on_off
[14:07:00] [PASSED] res_invalid_mode
[14:07:00] [PASSED] res_bpp_wrong_place_mode
[14:07:00] [PASSED] name_bpp_refresh
[14:07:00] [PASSED] name_refresh
[14:07:00] [PASSED] name_refresh_wrong_mode
[14:07:00] [PASSED] name_refresh_invalid_mode
[14:07:00] [PASSED] rotate_multiple
[14:07:00] [PASSED] rotate_invalid_val
[14:07:00] [PASSED] rotate_truncated
[14:07:00] [PASSED] invalid_option
[14:07:00] [PASSED] invalid_tv_option
[14:07:00] [PASSED] truncated_tv_option
[14:07:00] ============ [PASSED] drm_test_cmdline_invalid =============
[14:07:00] =============== drm_test_cmdline_tv_options  ===============
[14:07:00] [PASSED] NTSC
[14:07:00] [PASSED] NTSC_443
[14:07:00] [PASSED] NTSC_J
[14:07:00] [PASSED] PAL
[14:07:00] [PASSED] PAL_M
[14:07:00] [PASSED] PAL_N
[14:07:00] [PASSED] SECAM
[14:07:00] =========== [PASSED] drm_test_cmdline_tv_options ===========
[14:07:00] =============== [PASSED] drm_cmdline_parser ================
[14:07:00] ============= drmm_connector_init (3 subtests) =============
[14:07:00] [PASSED] drm_test_drmm_connector_init
[14:07:00] [PASSED] drm_test_drmm_connector_init_null_ddc
[14:07:00] ========= drm_test_drmm_connector_init_type_valid  =========
[14:07:00] [PASSED] Unknown
[14:07:00] [PASSED] VGA
[14:07:00] [PASSED] DVI-I
[14:07:00] [PASSED] DVI-D
[14:07:00] [PASSED] DVI-A
[14:07:00] [PASSED] Composite
[14:07:00] [PASSED] SVIDEO
[14:07:00] [PASSED] LVDS
[14:07:00] [PASSED] Component
[14:07:00] [PASSED] DIN
[14:07:00] [PASSED] DP
[14:07:00] [PASSED] HDMI-A
[14:07:00] [PASSED] HDMI-B
[14:07:00] [PASSED] TV
[14:07:00] [PASSED] eDP
[14:07:00] [PASSED] Virtual
[14:07:00] [PASSED] DSI
[14:07:00] [PASSED] DPI
[14:07:00] [PASSED] Writeback
[14:07:00] [PASSED] SPI
[14:07:00] [PASSED] USB
[14:07:00] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[14:07:00] =============== [PASSED] drmm_connector_init ===============
[14:07:00] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[14:07:00] ========== drm_test_get_tv_mode_from_name_valid  ===========
[14:07:00] [PASSED] NTSC
[14:07:00] [PASSED] NTSC-443
[14:07:00] [PASSED] NTSC-J
[14:07:00] [PASSED] PAL
[14:07:00] [PASSED] PAL-M
[14:07:00] [PASSED] PAL-N
[14:07:00] [PASSED] SECAM
[14:07:00] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[14:07:00] [PASSED] drm_test_get_tv_mode_from_name_truncated
[14:07:00] ============ [PASSED] drm_get_tv_mode_from_name ============
[14:07:00] ============= drm_damage_helper (21 subtests) ==============
[14:07:00] [PASSED] drm_test_damage_iter_no_damage
[14:07:00] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[14:07:00] [PASSED] drm_test_damage_iter_no_damage_src_moved
[14:07:00] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[14:07:00] [PASSED] drm_test_damage_iter_no_damage_not_visible
[14:07:00] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[14:07:00] [PASSED] drm_test_damage_iter_no_damage_no_fb
[14:07:00] [PASSED] drm_test_damage_iter_simple_damage
[14:07:00] [PASSED] drm_test_damage_iter_single_damage
[14:07:00] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[14:07:00] [PASSED] drm_test_damage_iter_single_damage_outside_src
[14:07:00] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[14:07:00] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[14:07:00] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[14:07:00] [PASSED] drm_test_damage_iter_single_damage_src_moved
[14:07:00] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[14:07:00] [PASSED] drm_test_damage_iter_damage
[14:07:00] [PASSED] drm_test_damage_iter_damage_one_intersect
[14:07:00] [PASSED] drm_test_damage_iter_damage_one_outside
[14:07:00] [PASSED] drm_test_damage_iter_damage_src_moved
[14:07:00] [PASSED] drm_test_damage_iter_damage_not_visible
[14:07:00] ================ [PASSED] drm_damage_helper ================
[14:07:00] ============== drm_dp_mst_helper (3 subtests) ==============
[14:07:00] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[14:07:00] [PASSED] Clock 154000 BPP 30 DSC disabled
[14:07:00] [PASSED] Clock 234000 BPP 30 DSC disabled
[14:07:00] [PASSED] Clock 297000 BPP 24 DSC disabled
[14:07:00] [PASSED] Clock 332880 BPP 24 DSC enabled
[14:07:00] [PASSED] Clock 324540 BPP 24 DSC enabled
[14:07:00] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[14:07:00] ============== drm_test_dp_mst_calc_pbn_div  ===============
[14:07:00] [PASSED] Link rate 2000000 lane count 4
[14:07:00] [PASSED] Link rate 2000000 lane count 2
[14:07:00] [PASSED] Link rate 2000000 lane count 1
[14:07:00] [PASSED] Link rate 1350000 lane count 4
[14:07:00] [PASSED] Link rate 1350000 lane count 2
[14:07:00] [PASSED] Link rate 1350000 lane count 1
[14:07:00] [PASSED] Link rate 1000000 lane count 4
[14:07:00] [PASSED] Link rate 1000000 lane count 2
[14:07:00] [PASSED] Link rate 1000000 lane count 1
[14:07:00] [PASSED] Link rate 810000 lane count 4
[14:07:00] [PASSED] Link rate 810000 lane count 2
[14:07:00] [PASSED] Link rate 810000 lane count 1
[14:07:00] [PASSED] Link rate 540000 lane count 4
[14:07:00] [PASSED] Link rate 540000 lane count 2
[14:07:00] [PASSED] Link rate 540000 lane count 1
[14:07:00] [PASSED] Link rate 270000 lane count 4
[14:07:00] [PASSED] Link rate 270000 lane count 2
[14:07:00] [PASSED] Link rate 270000 lane count 1
[14:07:00] [PASSED] Link rate 162000 lane count 4
[14:07:00] [PASSED] Link rate 162000 lane count 2
[14:07:00] [PASSED] Link rate 162000 lane count 1
[14:07:00] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[14:07:00] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[14:07:00] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[14:07:00] [PASSED] DP_POWER_UP_PHY with port number
[14:07:00] [PASSED] DP_POWER_DOWN_PHY with port number
[14:07:00] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[14:07:00] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[14:07:00] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[14:07:00] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[14:07:00] [PASSED] DP_QUERY_PAYLOAD with port number
[14:07:00] [PASSED] DP_QUERY_PAYLOAD with VCPI
[14:07:00] [PASSED] DP_REMOTE_DPCD_READ with port number
[14:07:00] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[14:07:00] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[14:07:00] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[14:07:00] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[14:07:00] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[14:07:00] [PASSED] DP_REMOTE_I2C_READ with port number
[14:07:00] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[14:07:00] [PASSED] DP_REMOTE_I2C_READ with transactions array
[14:07:00] [PASSED] DP_REMOTE_I2C_WRITE with port number
[14:07:00] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[14:07:00] [PASSED] DP_REMOTE_I2C_WRITE with data array
[14:07:00] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[14:07:00] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[14:07:00] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[14:07:00] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[14:07:00] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[14:07:00] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[14:07:00] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[14:07:00] ================ [PASSED] drm_dp_mst_helper ================
[14:07:00] ================== drm_exec (7 subtests) ===================
[14:07:00] [PASSED] sanitycheck
[14:07:00] [PASSED] test_lock
[14:07:00] [PASSED] test_lock_unlock
[14:07:00] [PASSED] test_duplicates
[14:07:00] [PASSED] test_prepare
[14:07:00] [PASSED] test_prepare_array
[14:07:00] [PASSED] test_multiple_loops
[14:07:00] ==================== [PASSED] drm_exec =====================
[14:07:00] =========== drm_format_helper_test (17 subtests) ===========
[14:07:00] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[14:07:00] [PASSED] single_pixel_source_buffer
[14:07:00] [PASSED] single_pixel_clip_rectangle
[14:07:00] [PASSED] well_known_colors
[14:07:00] [PASSED] destination_pitch
[14:07:00] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[14:07:00] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[14:07:00] [PASSED] single_pixel_source_buffer
[14:07:00] [PASSED] single_pixel_clip_rectangle
[14:07:00] [PASSED] well_known_colors
[14:07:00] [PASSED] destination_pitch
[14:07:00] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[14:07:00] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[14:07:00] [PASSED] single_pixel_source_buffer
[14:07:00] [PASSED] single_pixel_clip_rectangle
[14:07:00] [PASSED] well_known_colors
[14:07:00] [PASSED] destination_pitch
[14:07:00] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[14:07:00] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[14:07:00] [PASSED] single_pixel_source_buffer
[14:07:00] [PASSED] single_pixel_clip_rectangle
[14:07:00] [PASSED] well_known_colors
[14:07:00] [PASSED] destination_pitch
[14:07:00] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[14:07:00] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[14:07:00] [PASSED] single_pixel_source_buffer
[14:07:00] [PASSED] single_pixel_clip_rectangle
[14:07:00] [PASSED] well_known_colors
[14:07:00] [PASSED] destination_pitch
[14:07:00] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[14:07:00] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[14:07:00] [PASSED] single_pixel_source_buffer
[14:07:00] [PASSED] single_pixel_clip_rectangle
[14:07:00] [PASSED] well_known_colors
[14:07:00] [PASSED] destination_pitch
[14:07:00] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[14:07:00] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[14:07:00] [PASSED] single_pixel_source_buffer
[14:07:00] [PASSED] single_pixel_clip_rectangle
[14:07:00] [PASSED] well_known_colors
[14:07:00] [PASSED] destination_pitch
[14:07:00] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[14:07:00] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[14:07:00] [PASSED] single_pixel_source_buffer
[14:07:00] [PASSED] single_pixel_clip_rectangle
[14:07:00] [PASSED] well_known_colors
[14:07:00] [PASSED] destination_pitch
[14:07:00] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[14:07:00] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[14:07:00] [PASSED] single_pixel_source_buffer
[14:07:00] [PASSED] single_pixel_clip_rectangle
[14:07:00] [PASSED] well_known_colors
[14:07:00] [PASSED] destination_pitch
[14:07:00] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[14:07:00] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[14:07:00] [PASSED] single_pixel_source_buffer
[14:07:00] [PASSED] single_pixel_clip_rectangle
[14:07:00] [PASSED] well_known_colors
[14:07:00] [PASSED] destination_pitch
[14:07:00] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[14:07:00] ============== drm_test_fb_xrgb8888_to_mono  ===============
[14:07:00] [PASSED] single_pixel_source_buffer
[14:07:00] [PASSED] single_pixel_clip_rectangle
[14:07:00] [PASSED] well_known_colors
[14:07:00] [PASSED] destination_pitch
[14:07:00] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[14:07:00] ==================== drm_test_fb_swab  =====================
[14:07:00] [PASSED] single_pixel_source_buffer
[14:07:00] [PASSED] single_pixel_clip_rectangle
[14:07:00] [PASSED] well_known_colors
[14:07:00] [PASSED] destination_pitch
[14:07:00] ================ [PASSED] drm_test_fb_swab =================
[14:07:00] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[14:07:00] [PASSED] single_pixel_source_buffer
[14:07:00] [PASSED] single_pixel_clip_rectangle
[14:07:00] [PASSED] well_known_colors
[14:07:00] [PASSED] destination_pitch
[14:07:00] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[14:07:00] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[14:07:00] [PASSED] single_pixel_source_buffer
[14:07:00] [PASSED] single_pixel_clip_rectangle
[14:07:00] [PASSED] well_known_colors
[14:07:00] [PASSED] destination_pitch
[14:07:00] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[14:07:00] ================= drm_test_fb_clip_offset  =================
[14:07:00] [PASSED] pass through
[14:07:00] [PASSED] horizontal offset
[14:07:00] [PASSED] vertical offset
[14:07:00] [PASSED] horizontal and vertical offset
[14:07:00] [PASSED] horizontal offset (custom pitch)
[14:07:00] [PASSED] vertical offset (custom pitch)
[14:07:00] [PASSED] horizontal and vertical offset (custom pitch)
[14:07:00] ============= [PASSED] drm_test_fb_clip_offset =============
[14:07:00] ============== drm_test_fb_build_fourcc_list  ==============
[14:07:00] [PASSED] no native formats
[14:07:00] [PASSED] XRGB8888 as native format
[14:07:00] [PASSED] remove duplicates
[14:07:00] [PASSED] convert alpha formats
[14:07:00] [PASSED] random formats
[14:07:00] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[14:07:00] =================== drm_test_fb_memcpy  ====================
[14:07:00] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[14:07:00] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[14:07:00] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[14:07:00] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[14:07:00] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[14:07:00] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[14:07:00] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[14:07:00] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[14:07:00] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[14:07:00] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[14:07:00] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[14:07:00] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[14:07:00] =============== [PASSED] drm_test_fb_memcpy ================
[14:07:00] ============= [PASSED] drm_format_helper_test ==============
[14:07:00] ================= drm_format (18 subtests) =================
[14:07:00] [PASSED] drm_test_format_block_width_invalid
[14:07:00] [PASSED] drm_test_format_block_width_one_plane
[14:07:00] [PASSED] drm_test_format_block_width_two_plane
[14:07:00] [PASSED] drm_test_format_block_width_three_plane
[14:07:00] [PASSED] drm_test_format_block_width_tiled
[14:07:00] [PASSED] drm_test_format_block_height_invalid
[14:07:00] [PASSED] drm_test_format_block_height_one_plane
[14:07:00] [PASSED] drm_test_format_block_height_two_plane
[14:07:00] [PASSED] drm_test_format_block_height_three_plane
[14:07:00] [PASSED] drm_test_format_block_height_tiled
[14:07:00] [PASSED] drm_test_format_min_pitch_invalid
[14:07:00] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[14:07:00] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[14:07:00] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[14:07:00] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[14:07:00] [PASSED] drm_test_format_min_pitch_two_plane
[14:07:00] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[14:07:00] [PASSED] drm_test_format_min_pitch_tiled
[14:07:00] =================== [PASSED] drm_format ====================
[14:07:00] =============== drm_framebuffer (1 subtest) ================
[14:07:00] =============== drm_test_framebuffer_create  ===============
[14:07:00] [PASSED] ABGR8888 normal sizes
[14:07:00] [PASSED] ABGR8888 max sizes
[14:07:00] [PASSED] ABGR8888 pitch greater than min required
[14:07:00] [PASSED] ABGR8888 pitch less than min required
[14:07:00] [PASSED] ABGR8888 Invalid width
[14:07:00] [PASSED] ABGR8888 Invalid buffer handle
[14:07:00] [PASSED] No pixel format
[14:07:00] [PASSED] ABGR8888 Width 0
[14:07:00] [PASSED] ABGR8888 Height 0
[14:07:00] [PASSED] ABGR8888 Out of bound height * pitch combination
[14:07:00] [PASSED] ABGR8888 Large buffer offset
[14:07:00] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[14:07:00] [PASSED] ABGR8888 Valid buffer modifier
[14:07:00] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[14:07:00] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[14:07:00] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[14:07:00] [PASSED] NV12 Normal sizes
[14:07:00] [PASSED] NV12 Max sizes
[14:07:00] [PASSED] NV12 Invalid pitch
[14:07:00] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[14:07:00] [PASSED] NV12 different  modifier per-plane
[14:07:00] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[14:07:00] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[14:07:00] [PASSED] NV12 Modifier for inexistent plane
[14:07:00] [PASSED] NV12 Handle for inexistent plane
[14:07:00] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[14:07:00] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[14:07:00] [PASSED] YVU420 Normal sizes
[14:07:00] [PASSED] YVU420 Max sizes
[14:07:00] [PASSED] YVU420 Invalid pitch
[14:07:00] [PASSED] YVU420 Different pitches
[14:07:00] [PASSED] YVU420 Different buffer offsets/pitches
[14:07:00] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[14:07:00] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[14:07:00] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[14:07:00] [PASSED] YVU420 Valid modifier
[14:07:00] [PASSED] YVU420 Different modifiers per plane
[14:07:00] [PASSED] YVU420 Modifier for inexistent plane
[14:07:00] [PASSED] X0L2 Normal sizes
[14:07:00] [PASSED] X0L2 Max sizes
[14:07:00] [PASSED] X0L2 Invalid pitch
[14:07:00] [PASSED] X0L2 Pitch greater than minimum required
[14:07:00] [PASSED] X0L2 Handle for inexistent plane
[14:07:00] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[14:07:00] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[14:07:00] [PASSED] X0L2 Valid modifier
[14:07:00] [PASSED] X0L2 Modifier for inexistent plane
[14:07:00] =========== [PASSED] drm_test_framebuffer_create ===========
[14:07:00] ================= [PASSED] drm_framebuffer =================
[14:07:00] ================ drm_gem_shmem (8 subtests) ================
[14:07:00] [PASSED] drm_gem_shmem_test_obj_create
[14:07:00] [PASSED] drm_gem_shmem_test_obj_create_private
[14:07:00] [PASSED] drm_gem_shmem_test_pin_pages
[14:07:00] [PASSED] drm_gem_shmem_test_vmap
[14:07:00] [PASSED] drm_gem_shmem_test_get_pages_sgt
[14:07:00] [PASSED] drm_gem_shmem_test_get_sg_table
[14:07:00] [PASSED] drm_gem_shmem_test_madvise
[14:07:00] [PASSED] drm_gem_shmem_test_purge
[14:07:00] ================== [PASSED] drm_gem_shmem ==================
[14:07:00] ================= drm_managed (2 subtests) =================
[14:07:00] [PASSED] drm_test_managed_release_action
[14:07:00] [PASSED] drm_test_managed_run_action
[14:07:00] =================== [PASSED] drm_managed ===================
stty: 'standard input': Inappropriate ioctl for device
[14:07:00] =================== drm_mm (6 subtests) ====================
[14:07:00] [PASSED] drm_test_mm_init
[14:07:00] [PASSED] drm_test_mm_debug
[14:07:00] [PASSED] drm_test_mm_align32
[14:07:00] [PASSED] drm_test_mm_align64
[14:07:00] [PASSED] drm_test_mm_lowest
[14:07:00] [PASSED] drm_test_mm_highest
[14:07:00] ===================== [PASSED] drm_mm ======================
[14:07:00] ============= drm_modes_analog_tv (4 subtests) =============
[14:07:00] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[14:07:00] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[14:07:00] [PASSED] drm_test_modes_analog_tv_pal_576i
[14:07:00] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[14:07:00] =============== [PASSED] drm_modes_analog_tv ===============
[14:07:00] ============== drm_plane_helper (2 subtests) ===============
[14:07:00] =============== drm_test_check_plane_state  ================
[14:07:00] [PASSED] clipping_simple
[14:07:00] [PASSED] clipping_rotate_reflect
[14:07:00] [PASSED] positioning_simple
[14:07:00] [PASSED] upscaling
[14:07:00] [PASSED] downscaling
[14:07:00] [PASSED] rounding1
[14:07:00] [PASSED] rounding2
[14:07:00] [PASSED] rounding3
[14:07:00] [PASSED] rounding4
[14:07:00] =========== [PASSED] drm_test_check_plane_state ============
[14:07:00] =========== drm_test_check_invalid_plane_state  ============
[14:07:00] [PASSED] positioning_invalid
[14:07:00] [PASSED] upscaling_invalid
[14:07:00] [PASSED] downscaling_invalid
[14:07:00] ======= [PASSED] drm_test_check_invalid_plane_state ========
[14:07:00] ================ [PASSED] drm_plane_helper =================
[14:07:00] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[14:07:00] ====== drm_test_connector_helper_tv_get_modes_check  =======
[14:07:00] [PASSED] None
[14:07:00] [PASSED] PAL
[14:07:00] [PASSED] NTSC
[14:07:00] [PASSED] Both, NTSC Default
[14:07:00] [PASSED] Both, PAL Default
[14:07:00] [PASSED] Both, NTSC Default, with PAL on command-line
[14:07:00] [PASSED] Both, PAL Default, with NTSC on command-line
[14:07:00] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[14:07:00] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[14:07:00] ================== drm_rect (9 subtests) ===================
[14:07:00] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[14:07:00] [PASSED] drm_test_rect_clip_scaled_not_clipped
[14:07:00] [PASSED] drm_test_rect_clip_scaled_clipped
[14:07:00] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[14:07:00] ================= drm_test_rect_intersect  =================
[14:07:00] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[14:07:00] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[14:07:00] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[14:07:00] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[14:07:00] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[14:07:00] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[14:07:00] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[14:07:00] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[14:07:00] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[14:07:00] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[14:07:00] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[14:07:00] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[14:07:00] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[14:07:00] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[14:07:00] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[14:07:00] ============= [PASSED] drm_test_rect_intersect =============
[14:07:00] ================ drm_test_rect_calc_hscale  ================
[14:07:00] [PASSED] normal use
[14:07:00] [PASSED] out of max range
[14:07:00] [PASSED] out of min range
[14:07:00] [PASSED] zero dst
[14:07:00] [PASSED] negative src
[14:07:00] [PASSED] negative dst
[14:07:00] ============ [PASSED] drm_test_rect_calc_hscale ============
[14:07:00] ================ drm_test_rect_calc_vscale  ================
[14:07:00] [PASSED] normal use
[14:07:00] [PASSED] out of max range
[14:07:00] [PASSED] out of min range
[14:07:00] [PASSED] zero dst
[14:07:00] [PASSED] negative src
[14:07:00] [PASSED] negative dst
[14:07:00] ============ [PASSED] drm_test_rect_calc_vscale ============
[14:07:00] ================== drm_test_rect_rotate  ===================
[14:07:00] [PASSED] reflect-x
[14:07:00] [PASSED] reflect-y
[14:07:00] [PASSED] rotate-0
[14:07:00] [PASSED] rotate-90
[14:07:00] [PASSED] rotate-180
[14:07:00] [PASSED] rotate-270
[14:07:00] ============== [PASSED] drm_test_rect_rotate ===============
[14:07:00] ================ drm_test_rect_rotate_inv  =================
[14:07:00] [PASSED] reflect-x
[14:07:00] [PASSED] reflect-y
[14:07:00] [PASSED] rotate-0
[14:07:00] [PASSED] rotate-90
[14:07:00] [PASSED] rotate-180
[14:07:00] [PASSED] rotate-270
[14:07:00] ============ [PASSED] drm_test_rect_rotate_inv =============
[14:07:00] ==================== [PASSED] drm_rect =====================
[14:07:00] ============================================================
[14:07:00] Testing complete. Ran 417 tests: passed: 417
[14:07:00] Elapsed time: 23.055s total, 1.712s configuring, 21.194s building, 0.147s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


