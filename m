Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EE4C27C79
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 00:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F95410E196;
	Tue, 18 Jun 2024 00:44:29 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF5E10E196;
 Tue, 18 Jun 2024 00:44:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Simplify_locking_in_?=
 =?utf-8?q?new=5Fvma_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jun 2024 00:44:28 -0000
Message-ID: <171867146819.99140.13863260953341794207@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240618003859.3239239-1-matthew.brost@intel.com>
In-Reply-To: <20240618003859.3239239-1-matthew.brost@intel.com>
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

Series: drm/xe: Simplify locking in new_vma (rev2)
URL   : https://patchwork.freedesktop.org/series/134979/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[00:43:22] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:43:26] Building KUnit Kernel ...
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

[00:43:51] Starting KUnit Kernel (1/1)...
[00:43:51] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[00:43:51] =================== guc_dbm (7 subtests) ===================
[00:43:51] [PASSED] test_empty
[00:43:51] [PASSED] test_default
[00:43:51] ======================== test_size  ========================
[00:43:51] [PASSED] 4
[00:43:51] [PASSED] 8
[00:43:51] [PASSED] 32
[00:43:51] [PASSED] 256
[00:43:51] ==================== [PASSED] test_size ====================
[00:43:51] ======================= test_reuse  ========================
[00:43:51] [PASSED] 4
[00:43:51] [PASSED] 8
[00:43:51] [PASSED] 32
[00:43:51] [PASSED] 256
[00:43:51] =================== [PASSED] test_reuse ====================
[00:43:51] =================== test_range_overlap  ====================
[00:43:51] [PASSED] 4
[00:43:51] [PASSED] 8
[00:43:51] [PASSED] 32
[00:43:51] [PASSED] 256
[00:43:51] =============== [PASSED] test_range_overlap ================
[00:43:51] =================== test_range_compact  ====================
[00:43:51] [PASSED] 4
[00:43:51] [PASSED] 8
[00:43:51] [PASSED] 32
[00:43:51] [PASSED] 256
[00:43:51] =============== [PASSED] test_range_compact ================
[00:43:51] ==================== test_range_spare  =====================
[00:43:51] [PASSED] 4
[00:43:51] [PASSED] 8
[00:43:51] [PASSED] 32
[00:43:51] [PASSED] 256
[00:43:51] ================ [PASSED] test_range_spare =================
[00:43:51] ===================== [PASSED] guc_dbm =====================
[00:43:51] =================== guc_idm (6 subtests) ===================
[00:43:51] [PASSED] bad_init
[00:43:51] [PASSED] no_init
[00:43:51] [PASSED] init_fini
[00:43:51] [PASSED] check_used
[00:43:51] [PASSED] check_quota
[00:43:51] [PASSED] check_all
[00:43:51] ===================== [PASSED] guc_idm =====================
[00:43:51] ================== no_relay (3 subtests) ===================
[00:43:51] [PASSED] xe_drops_guc2pf_if_not_ready
[00:43:51] [PASSED] xe_drops_guc2vf_if_not_ready
[00:43:51] [PASSED] xe_rejects_send_if_not_ready
[00:43:51] ==================== [PASSED] no_relay =====================
[00:43:51] ================== pf_relay (14 subtests) ==================
[00:43:51] [PASSED] pf_rejects_guc2pf_too_short
[00:43:51] [PASSED] pf_rejects_guc2pf_too_long
[00:43:51] [PASSED] pf_rejects_guc2pf_no_payload
[00:43:51] [PASSED] pf_fails_no_payload
[00:43:51] [PASSED] pf_fails_bad_origin
[00:43:51] [PASSED] pf_fails_bad_type
[00:43:51] [PASSED] pf_txn_reports_error
[00:43:51] [PASSED] pf_txn_sends_pf2guc
[00:43:51] [PASSED] pf_sends_pf2guc
[00:43:51] [SKIPPED] pf_loopback_nop
[00:43:51] [SKIPPED] pf_loopback_echo
[00:43:51] [SKIPPED] pf_loopback_fail
[00:43:51] [SKIPPED] pf_loopback_busy
[00:43:51] [SKIPPED] pf_loopback_retry
[00:43:51] ==================== [PASSED] pf_relay =====================
[00:43:51] ================== vf_relay (3 subtests) ===================
[00:43:51] [PASSED] vf_rejects_guc2vf_too_short
[00:43:51] [PASSED] vf_rejects_guc2vf_too_long
[00:43:51] [PASSED] vf_rejects_guc2vf_no_payload
[00:43:51] ==================== [PASSED] vf_relay =====================
[00:43:51] ================= pf_service (11 subtests) =================
[00:43:51] [PASSED] pf_negotiate_any
[00:43:51] [PASSED] pf_negotiate_base_match
[00:43:51] [PASSED] pf_negotiate_base_newer
[00:43:51] [PASSED] pf_negotiate_base_next
[00:43:51] [SKIPPED] pf_negotiate_base_older
[00:43:51] [PASSED] pf_negotiate_base_prev
[00:43:51] [PASSED] pf_negotiate_latest_match
[00:43:51] [PASSED] pf_negotiate_latest_newer
[00:43:51] [PASSED] pf_negotiate_latest_next
[00:43:51] [SKIPPED] pf_negotiate_latest_older
[00:43:51] [SKIPPED] pf_negotiate_latest_prev
[00:43:51] =================== [PASSED] pf_service ====================
[00:43:51] ===================== lmtt (1 subtest) =====================
[00:43:51] ======================== test_ops  =========================
[00:43:51] [PASSED] 2-level
[00:43:51] [PASSED] multi-level
[00:43:51] ==================== [PASSED] test_ops =====================
[00:43:51] ====================== [PASSED] lmtt =======================
[00:43:51] ==================== xe_bo (2 subtests) ====================
[00:43:51] [SKIPPED] xe_ccs_migrate_kunit
[00:43:51] [SKIPPED] xe_bo_evict_kunit
[00:43:51] ===================== [SKIPPED] xe_bo ======================
[00:43:51] ================== xe_dma_buf (1 subtest) ==================
[00:43:51] [SKIPPED] xe_dma_buf_kunit
[00:43:51] =================== [SKIPPED] xe_dma_buf ===================
[00:43:51] ================== xe_migrate (1 subtest) ==================
[00:43:51] [SKIPPED] xe_migrate_sanity_kunit
[00:43:51] =================== [SKIPPED] xe_migrate ===================
[00:43:51] =================== xe_mocs (2 subtests) ===================
[00:43:51] [SKIPPED] xe_live_mocs_kernel_kunit
[00:43:51] [SKIPPED] xe_live_mocs_reset_kunit
[00:43:51] ==================== [SKIPPED] xe_mocs =====================
[00:43:51] ==================== args (11 subtests) ====================
[00:43:51] [PASSED] count_args_test
[00:43:51] [PASSED] call_args_example
[00:43:51] [PASSED] call_args_test
[00:43:51] [PASSED] drop_first_arg_example
[00:43:51] [PASSED] drop_first_arg_test
[00:43:51] [PASSED] first_arg_example
[00:43:51] [PASSED] first_arg_test
[00:43:51] [PASSED] last_arg_example
[00:43:51] [PASSED] last_arg_test
[00:43:51] [PASSED] pick_arg_example
[00:43:51] [PASSED] sep_comma_example
[00:43:51] ====================== [PASSED] args =======================
[00:43:51] =================== xe_pci (2 subtests) ====================
[00:43:51] [PASSED] xe_gmdid_graphics_ip
[00:43:51] [PASSED] xe_gmdid_media_ip
[00:43:51] ===================== [PASSED] xe_pci ======================
[00:43:51] ==================== xe_rtp (1 subtest) ====================
[00:43:51] ================== xe_rtp_process_tests  ===================
[00:43:51] [PASSED] coalesce-same-reg
[00:43:51] [PASSED] no-match-no-add
[00:43:51] [PASSED] no-match-no-add-multiple-rules
[00:43:51] [PASSED] two-regs-two-entries
[00:43:51] [PASSED] clr-one-set-other
[00:43:51] [PASSED] set-field
[00:43:51] [PASSED] conflict-duplicate
[00:43:51] [PASSED] conflict-not-disjoint
[00:43:51] [PASSED] conflict-reg-type
[00:43:51] ============== [PASSED] xe_rtp_process_tests ===============
stty: 'standard input': Inappropriate ioctl for device
[00:43:51] ===================== [PASSED] xe_rtp ======================
[00:43:51] ==================== xe_wa (1 subtest) =====================
[00:43:51] ======================== xe_wa_gt  =========================
[00:43:51] [PASSED] TIGERLAKE (B0)
[00:43:51] [PASSED] DG1 (A0)
[00:43:51] [PASSED] DG1 (B0)
[00:43:51] [PASSED] ALDERLAKE_S (A0)
[00:43:51] [PASSED] ALDERLAKE_S (B0)
[00:43:51] [PASSED] ALDERLAKE_S (C0)
[00:43:51] [PASSED] ALDERLAKE_S (D0)
[00:43:51] [PASSED] ALDERLAKE_P (A0)
[00:43:51] [PASSED] ALDERLAKE_P (B0)
[00:43:51] [PASSED] ALDERLAKE_P (C0)
[00:43:51] [PASSED] ALDERLAKE_S_RPLS (D0)
[00:43:51] [PASSED] ALDERLAKE_P_RPLU (E0)
[00:43:51] [PASSED] DG2_G10 (C0)
[00:43:51] [PASSED] DG2_G11 (B1)
[00:43:51] [PASSED] DG2_G12 (A1)
[00:43:51] [PASSED] METEORLAKE (g:A0, m:A0)
[00:43:51] [PASSED] METEORLAKE (g:A0, m:A0)
[00:43:51] [PASSED] METEORLAKE (g:A0, m:A0)
[00:43:51] [PASSED] LUNARLAKE (g:A0, m:A0)
[00:43:51] [PASSED] LUNARLAKE (g:B0, m:A0)
[00:43:51] ==================== [PASSED] xe_wa_gt =====================
[00:43:51] ====================== [PASSED] xe_wa ======================
[00:43:51] ============================================================
[00:43:51] Testing complete. Ran 109 tests: passed: 95, skipped: 14
[00:43:51] Elapsed time: 29.749s total, 4.231s configuring, 25.248s building, 0.227s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[00:43:52] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:43:53] Building KUnit Kernel ...
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

[00:44:15] Starting KUnit Kernel (1/1)...
[00:44:15] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[00:44:15] ============ drm_test_pick_cmdline (2 subtests) ============
[00:44:15] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[00:44:15] =============== drm_test_pick_cmdline_named  ===============
[00:44:15] [PASSED] NTSC
[00:44:15] [PASSED] NTSC-J
[00:44:15] [PASSED] PAL
[00:44:15] [PASSED] PAL-M
[00:44:15] =========== [PASSED] drm_test_pick_cmdline_named ===========
[00:44:15] ============== [PASSED] drm_test_pick_cmdline ==============
[00:44:15] ================== drm_buddy (7 subtests) ==================
[00:44:15] [PASSED] drm_test_buddy_alloc_limit
[00:44:15] [PASSED] drm_test_buddy_alloc_optimistic
[00:44:15] [PASSED] drm_test_buddy_alloc_pessimistic
[00:44:15] [PASSED] drm_test_buddy_alloc_pathological
[00:44:15] [PASSED] drm_test_buddy_alloc_contiguous
[00:44:15] [PASSED] drm_test_buddy_alloc_clear
[00:44:15] [PASSED] drm_test_buddy_alloc_range_bias
[00:44:15] ==================== [PASSED] drm_buddy ====================
[00:44:15] ============= drm_cmdline_parser (40 subtests) =============
[00:44:15] [PASSED] drm_test_cmdline_force_d_only
[00:44:15] [PASSED] drm_test_cmdline_force_D_only_dvi
[00:44:15] [PASSED] drm_test_cmdline_force_D_only_hdmi
[00:44:15] [PASSED] drm_test_cmdline_force_D_only_not_digital
[00:44:15] [PASSED] drm_test_cmdline_force_e_only
[00:44:15] [PASSED] drm_test_cmdline_res
[00:44:15] [PASSED] drm_test_cmdline_res_vesa
[00:44:15] [PASSED] drm_test_cmdline_res_vesa_rblank
[00:44:15] [PASSED] drm_test_cmdline_res_rblank
[00:44:15] [PASSED] drm_test_cmdline_res_bpp
[00:44:15] [PASSED] drm_test_cmdline_res_refresh
[00:44:15] [PASSED] drm_test_cmdline_res_bpp_refresh
[00:44:15] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[00:44:15] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[00:44:15] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[00:44:15] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[00:44:15] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[00:44:15] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[00:44:15] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[00:44:15] [PASSED] drm_test_cmdline_res_margins_force_on
[00:44:15] [PASSED] drm_test_cmdline_res_vesa_margins
[00:44:15] [PASSED] drm_test_cmdline_name
[00:44:15] [PASSED] drm_test_cmdline_name_bpp
[00:44:15] [PASSED] drm_test_cmdline_name_option
[00:44:15] [PASSED] drm_test_cmdline_name_bpp_option
[00:44:15] [PASSED] drm_test_cmdline_rotate_0
[00:44:15] [PASSED] drm_test_cmdline_rotate_90
[00:44:15] [PASSED] drm_test_cmdline_rotate_180
[00:44:15] [PASSED] drm_test_cmdline_rotate_270
[00:44:15] [PASSED] drm_test_cmdline_hmirror
[00:44:15] [PASSED] drm_test_cmdline_vmirror
[00:44:15] [PASSED] drm_test_cmdline_margin_options
[00:44:15] [PASSED] drm_test_cmdline_multiple_options
[00:44:15] [PASSED] drm_test_cmdline_bpp_extra_and_option
[00:44:15] [PASSED] drm_test_cmdline_extra_and_option
[00:44:15] [PASSED] drm_test_cmdline_freestanding_options
[00:44:15] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[00:44:15] [PASSED] drm_test_cmdline_panel_orientation
[00:44:15] ================ drm_test_cmdline_invalid  =================
[00:44:15] [PASSED] margin_only
[00:44:15] [PASSED] interlace_only
[00:44:15] [PASSED] res_missing_x
[00:44:15] [PASSED] res_missing_y
[00:44:15] [PASSED] res_bad_y
[00:44:15] [PASSED] res_missing_y_bpp
[00:44:15] [PASSED] res_bad_bpp
[00:44:15] [PASSED] res_bad_refresh
[00:44:15] [PASSED] res_bpp_refresh_force_on_off
[00:44:15] [PASSED] res_invalid_mode
[00:44:15] [PASSED] res_bpp_wrong_place_mode
[00:44:15] [PASSED] name_bpp_refresh
[00:44:15] [PASSED] name_refresh
[00:44:15] [PASSED] name_refresh_wrong_mode
[00:44:15] [PASSED] name_refresh_invalid_mode
[00:44:15] [PASSED] rotate_multiple
[00:44:15] [PASSED] rotate_invalid_val
[00:44:15] [PASSED] rotate_truncated
[00:44:15] [PASSED] invalid_option
[00:44:15] [PASSED] invalid_tv_option
[00:44:15] [PASSED] truncated_tv_option
[00:44:15] ============ [PASSED] drm_test_cmdline_invalid =============
[00:44:15] =============== drm_test_cmdline_tv_options  ===============
[00:44:15] [PASSED] NTSC
[00:44:15] [PASSED] NTSC_443
[00:44:15] [PASSED] NTSC_J
[00:44:15] [PASSED] PAL
[00:44:15] [PASSED] PAL_M
[00:44:15] [PASSED] PAL_N
[00:44:15] [PASSED] SECAM
[00:44:15] =========== [PASSED] drm_test_cmdline_tv_options ===========
[00:44:15] =============== [PASSED] drm_cmdline_parser ================
[00:44:15] ========== drmm_connector_hdmi_init (19 subtests) ==========
[00:44:15] [PASSED] drm_test_connector_hdmi_init_valid
[00:44:15] [PASSED] drm_test_connector_hdmi_init_bpc_8
[00:44:15] [PASSED] drm_test_connector_hdmi_init_bpc_10
[00:44:15] [PASSED] drm_test_connector_hdmi_init_bpc_12
[00:44:15] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[00:44:15] [PASSED] drm_test_connector_hdmi_init_bpc_null
[00:44:15] [PASSED] drm_test_connector_hdmi_init_formats_empty
[00:44:15] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[00:44:15] [PASSED] drm_test_connector_hdmi_init_null_ddc
[00:44:15] [PASSED] drm_test_connector_hdmi_init_null_product
[00:44:15] [PASSED] drm_test_connector_hdmi_init_null_vendor
[00:44:15] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[00:44:15] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[00:44:15] [PASSED] drm_test_connector_hdmi_init_product_valid
[00:44:15] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[00:44:15] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[00:44:15] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[00:44:15] ========= drm_test_connector_hdmi_init_type_valid  =========
[00:44:15] [PASSED] HDMI-A
[00:44:15] [PASSED] HDMI-B
[00:44:15] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[00:44:15] ======== drm_test_connector_hdmi_init_type_invalid  ========
[00:44:15] [PASSED] Unknown
[00:44:15] [PASSED] VGA
[00:44:15] [PASSED] DVI-I
[00:44:15] [PASSED] DVI-D
[00:44:15] [PASSED] DVI-A
[00:44:15] [PASSED] Composite
[00:44:15] [PASSED] SVIDEO
[00:44:15] [PASSED] LVDS
[00:44:15] [PASSED] Component
[00:44:15] [PASSED] DIN
[00:44:15] [PASSED] DP
[00:44:15] [PASSED] TV
[00:44:15] [PASSED] eDP
[00:44:15] [PASSED] Virtual
[00:44:15] [PASSED] DSI
[00:44:15] [PASSED] DPI
[00:44:15] [PASSED] Writeback
[00:44:15] [PASSED] SPI
[00:44:15] [PASSED] USB
[00:44:15] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[00:44:15] ============ [PASSED] drmm_connector_hdmi_init =============
[00:44:15] ============= drmm_connector_init (3 subtests) =============
[00:44:15] [PASSED] drm_test_drmm_connector_init
[00:44:15] [PASSED] drm_test_drmm_connector_init_null_ddc
[00:44:15] ========= drm_test_drmm_connector_init_type_valid  =========
[00:44:15] [PASSED] Unknown
[00:44:15] [PASSED] VGA
[00:44:15] [PASSED] DVI-I
[00:44:15] [PASSED] DVI-D
[00:44:15] [PASSED] DVI-A
[00:44:15] [PASSED] Composite
[00:44:15] [PASSED] SVIDEO
[00:44:15] [PASSED] LVDS
[00:44:15] [PASSED] Component
[00:44:15] [PASSED] DIN
[00:44:15] [PASSED] DP
[00:44:15] [PASSED] HDMI-A
[00:44:15] [PASSED] HDMI-B
[00:44:15] [PASSED] TV
[00:44:15] [PASSED] eDP
[00:44:15] [PASSED] Virtual
[00:44:15] [PASSED] DSI
[00:44:15] [PASSED] DPI
[00:44:15] [PASSED] Writeback
[00:44:15] [PASSED] SPI
[00:44:15] [PASSED] USB
[00:44:15] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[00:44:15] =============== [PASSED] drmm_connector_init ===============
[00:44:15] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[00:44:15] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[00:44:15] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[00:44:15] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[00:44:15] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[00:44:15] ========== drm_test_get_tv_mode_from_name_valid  ===========
[00:44:15] [PASSED] NTSC
[00:44:15] [PASSED] NTSC-443
[00:44:15] [PASSED] NTSC-J
[00:44:15] [PASSED] PAL
[00:44:15] [PASSED] PAL-M
[00:44:15] [PASSED] PAL-N
[00:44:15] [PASSED] SECAM
[00:44:15] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[00:44:15] [PASSED] drm_test_get_tv_mode_from_name_truncated
[00:44:15] ============ [PASSED] drm_get_tv_mode_from_name ============
[00:44:15] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[00:44:15] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[00:44:15] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[00:44:15] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[00:44:15] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[00:44:15] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[00:44:15] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[00:44:15] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[00:44:15] [PASSED] VIC 96
[00:44:15] [PASSED] VIC 97
[00:44:15] [PASSED] VIC 101
[00:44:15] [PASSED] VIC 102
[00:44:15] [PASSED] VIC 106
[00:44:15] [PASSED] VIC 107
[00:44:15] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[00:44:15] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[00:44:15] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[00:44:15] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[00:44:15] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[00:44:15] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[00:44:15] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[00:44:15] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[00:44:15] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[00:44:15] [PASSED] Automatic
[00:44:15] [PASSED] Full
[00:44:15] [PASSED] Limited 16:235
[00:44:15] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[00:44:15] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[00:44:15] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[00:44:15] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[00:44:15] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[00:44:15] [PASSED] RGB
[00:44:15] [PASSED] YUV 4:2:0
[00:44:15] [PASSED] YUV 4:2:2
[00:44:15] [PASSED] YUV 4:4:4
[00:44:15] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[00:44:15] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[00:44:15] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[00:44:15] ============= drm_damage_helper (21 subtests) ==============
[00:44:15] [PASSED] drm_test_damage_iter_no_damage
[00:44:15] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[00:44:15] [PASSED] drm_test_damage_iter_no_damage_src_moved
[00:44:15] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[00:44:15] [PASSED] drm_test_damage_iter_no_damage_not_visible
[00:44:15] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[00:44:15] [PASSED] drm_test_damage_iter_no_damage_no_fb
[00:44:15] [PASSED] drm_test_damage_iter_simple_damage
[00:44:15] [PASSED] drm_test_damage_iter_single_damage
[00:44:15] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[00:44:15] [PASSED] drm_test_damage_iter_single_damage_outside_src
[00:44:15] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[00:44:15] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[00:44:15] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[00:44:15] [PASSED] drm_test_damage_iter_single_damage_src_moved
[00:44:15] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[00:44:15] [PASSED] drm_test_damage_iter_damage
[00:44:15] [PASSED] drm_test_damage_iter_damage_one_intersect
[00:44:15] [PASSED] drm_test_damage_iter_damage_one_outside
[00:44:15] [PASSED] drm_test_damage_iter_damage_src_moved
[00:44:15] [PASSED] drm_test_damage_iter_damage_not_visible
[00:44:15] ================ [PASSED] drm_damage_helper ================
[00:44:15] ============== drm_dp_mst_helper (3 subtests) ==============
[00:44:15] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[00:44:15] [PASSED] Clock 154000 BPP 30 DSC disabled
[00:44:15] [PASSED] Clock 234000 BPP 30 DSC disabled
[00:44:15] [PASSED] Clock 297000 BPP 24 DSC disabled
[00:44:15] [PASSED] Clock 332880 BPP 24 DSC enabled
[00:44:15] [PASSED] Clock 324540 BPP 24 DSC enabled
[00:44:15] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[00:44:15] ============== drm_test_dp_mst_calc_pbn_div  ===============
[00:44:15] [PASSED] Link rate 2000000 lane count 4
[00:44:15] [PASSED] Link rate 2000000 lane count 2
[00:44:15] [PASSED] Link rate 2000000 lane count 1
[00:44:15] [PASSED] Link rate 1350000 lane count 4
[00:44:15] [PASSED] Link rate 1350000 lane count 2
[00:44:15] [PASSED] Link rate 1350000 lane count 1
[00:44:15] [PASSED] Link rate 1000000 lane count 4
[00:44:15] [PASSED] Link rate 1000000 lane count 2
[00:44:15] [PASSED] Link rate 1000000 lane count 1
[00:44:15] [PASSED] Link rate 810000 lane count 4
[00:44:15] [PASSED] Link rate 810000 lane count 2
[00:44:15] [PASSED] Link rate 810000 lane count 1
[00:44:15] [PASSED] Link rate 540000 lane count 4
[00:44:15] [PASSED] Link rate 540000 lane count 2
[00:44:15] [PASSED] Link rate 540000 lane count 1
[00:44:15] [PASSED] Link rate 270000 lane count 4
[00:44:15] [PASSED] Link rate 270000 lane count 2
[00:44:15] [PASSED] Link rate 270000 lane count 1
[00:44:15] [PASSED] Link rate 162000 lane count 4
[00:44:15] [PASSED] Link rate 162000 lane count 2
[00:44:15] [PASSED] Link rate 162000 lane count 1
[00:44:15] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[00:44:15] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[00:44:15] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[00:44:15] [PASSED] DP_POWER_UP_PHY with port number
[00:44:15] [PASSED] DP_POWER_DOWN_PHY with port number
[00:44:15] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[00:44:15] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[00:44:15] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[00:44:15] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[00:44:15] [PASSED] DP_QUERY_PAYLOAD with port number
[00:44:15] [PASSED] DP_QUERY_PAYLOAD with VCPI
[00:44:15] [PASSED] DP_REMOTE_DPCD_READ with port number
[00:44:15] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[00:44:15] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[00:44:15] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[00:44:15] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[00:44:15] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[00:44:15] [PASSED] DP_REMOTE_I2C_READ with port number
[00:44:15] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[00:44:15] [PASSED] DP_REMOTE_I2C_READ with transactions array
[00:44:15] [PASSED] DP_REMOTE_I2C_WRITE with port number
[00:44:15] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[00:44:15] [PASSED] DP_REMOTE_I2C_WRITE with data array
[00:44:15] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[00:44:15] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[00:44:15] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[00:44:15] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[00:44:15] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[00:44:15] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[00:44:15] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[00:44:15] ================ [PASSED] drm_dp_mst_helper ================
[00:44:15] ================== drm_exec (7 subtests) ===================
[00:44:15] [PASSED] sanitycheck
[00:44:15] [PASSED] test_lock
[00:44:15] [PASSED] test_lock_unlock
[00:44:15] [PASSED] test_duplicates
[00:44:15] [PASSED] test_prepare
[00:44:15] [PASSED] test_prepare_array
[00:44:15] [PASSED] test_multiple_loops
[00:44:15] ==================== [PASSED] drm_exec =====================
[00:44:15] =========== drm_format_helper_test (17 subtests) ===========
[00:44:15] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[00:44:15] [PASSED] single_pixel_source_buffer
[00:44:15] [PASSED] single_pixel_clip_rectangle
[00:44:15] [PASSED] well_known_colors
[00:44:15] [PASSED] destination_pitch
[00:44:15] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[00:44:15] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[00:44:15] [PASSED] single_pixel_source_buffer
[00:44:15] [PASSED] single_pixel_clip_rectangle
[00:44:15] [PASSED] well_known_colors
[00:44:15] [PASSED] destination_pitch
[00:44:15] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[00:44:15] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[00:44:15] [PASSED] single_pixel_source_buffer
[00:44:15] [PASSED] single_pixel_clip_rectangle
[00:44:15] [PASSED] well_known_colors
[00:44:15] [PASSED] destination_pitch
[00:44:15] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[00:44:15] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[00:44:15] [PASSED] single_pixel_source_buffer
[00:44:15] [PASSED] single_pixel_clip_rectangle
[00:44:15] [PASSED] well_known_colors
[00:44:15] [PASSED] destination_pitch
[00:44:15] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[00:44:15] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[00:44:15] [PASSED] single_pixel_source_buffer
[00:44:15] [PASSED] single_pixel_clip_rectangle
[00:44:15] [PASSED] well_known_colors
[00:44:15] [PASSED] destination_pitch
[00:44:15] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[00:44:15] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[00:44:15] [PASSED] single_pixel_source_buffer
[00:44:15] [PASSED] single_pixel_clip_rectangle
[00:44:15] [PASSED] well_known_colors
[00:44:15] [PASSED] destination_pitch
[00:44:15] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[00:44:15] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[00:44:15] [PASSED] single_pixel_source_buffer
[00:44:15] [PASSED] single_pixel_clip_rectangle
[00:44:15] [PASSED] well_known_colors
[00:44:15] [PASSED] destination_pitch
[00:44:15] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[00:44:15] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[00:44:15] [PASSED] single_pixel_source_buffer
[00:44:15] [PASSED] single_pixel_clip_rectangle
[00:44:15] [PASSED] well_known_colors
[00:44:15] [PASSED] destination_pitch
[00:44:15] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[00:44:15] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[00:44:15] [PASSED] single_pixel_source_buffer
[00:44:15] [PASSED] single_pixel_clip_rectangle
[00:44:15] [PASSED] well_known_colors
[00:44:15] [PASSED] destination_pitch
[00:44:15] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[00:44:15] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[00:44:15] [PASSED] single_pixel_source_buffer
[00:44:15] [PASSED] single_pixel_clip_rectangle
[00:44:15] [PASSED] well_known_colors
[00:44:15] [PASSED] destination_pitch
[00:44:15] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[00:44:15] ============== drm_test_fb_xrgb8888_to_mono  ===============
[00:44:15] [PASSED] single_pixel_source_buffer
[00:44:15] [PASSED] single_pixel_clip_rectangle
[00:44:15] [PASSED] well_known_colors
[00:44:15] [PASSED] destination_pitch
[00:44:15] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[00:44:15] ==================== drm_test_fb_swab  =====================
[00:44:15] [PASSED] single_pixel_source_buffer
[00:44:15] [PASSED] single_pixel_clip_rectangle
[00:44:15] [PASSED] well_known_colors
[00:44:15] [PASSED] destination_pitch
[00:44:15] ================ [PASSED] drm_test_fb_swab =================
[00:44:15] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[00:44:15] [PASSED] single_pixel_source_buffer
[00:44:15] [PASSED] single_pixel_clip_rectangle
[00:44:15] [PASSED] well_known_colors
[00:44:15] [PASSED] destination_pitch
[00:44:15] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[00:44:15] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[00:44:15] [PASSED] single_pixel_source_buffer
[00:44:15] [PASSED] single_pixel_clip_rectangle
[00:44:15] [PASSED] well_known_colors
[00:44:15] [PASSED] destination_pitch
[00:44:15] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[00:44:15] ================= drm_test_fb_clip_offset  =================
[00:44:15] [PASSED] pass through
[00:44:15] [PASSED] horizontal offset
[00:44:15] [PASSED] vertical offset
[00:44:15] [PASSED] horizontal and vertical offset
[00:44:15] [PASSED] horizontal offset (custom pitch)
[00:44:15] [PASSED] vertical offset (custom pitch)
[00:44:15] [PASSED] horizontal and vertical offset (custom pitch)
[00:44:15] ============= [PASSED] drm_test_fb_clip_offset =============
[00:44:15] ============== drm_test_fb_build_fourcc_list  ==============
[00:44:15] [PASSED] no native formats
[00:44:15] [PASSED] XRGB8888 as native format
[00:44:15] [PASSED] remove duplicates
[00:44:15] [PASSED] convert alpha formats
[00:44:15] [PASSED] random formats
[00:44:15] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[00:44:15] =================== drm_test_fb_memcpy  ====================
[00:44:15] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[00:44:15] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[00:44:15] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[00:44:15] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[00:44:15] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[00:44:15] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[00:44:15] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[00:44:15] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[00:44:15] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[00:44:15] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[00:44:15] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[00:44:15] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[00:44:15] =============== [PASSED] drm_test_fb_memcpy ================
[00:44:15] ============= [PASSED] drm_format_helper_test ==============
[00:44:15] ================= drm_format (18 subtests) =================
[00:44:15] [PASSED] drm_test_format_block_width_invalid
[00:44:15] [PASSED] drm_test_format_block_width_one_plane
[00:44:15] [PASSED] drm_test_format_block_width_two_plane
[00:44:15] [PASSED] drm_test_format_block_width_three_plane
[00:44:15] [PASSED] drm_test_format_block_width_tiled
[00:44:15] [PASSED] drm_test_format_block_height_invalid
[00:44:15] [PASSED] drm_test_format_block_height_one_plane
[00:44:15] [PASSED] drm_test_format_block_height_two_plane
[00:44:15] [PASSED] drm_test_format_block_height_three_plane
[00:44:15] [PASSED] drm_test_format_block_height_tiled
[00:44:15] [PASSED] drm_test_format_min_pitch_invalid
[00:44:15] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[00:44:15] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[00:44:15] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[00:44:15] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[00:44:15] [PASSED] drm_test_format_min_pitch_two_plane
[00:44:15] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[00:44:15] [PASSED] drm_test_format_min_pitch_tiled
[00:44:15] =================== [PASSED] drm_format ====================
[00:44:15] =============== drm_framebuffer (1 subtest) ================
[00:44:15] =============== drm_test_framebuffer_create  ===============
[00:44:15] [PASSED] ABGR8888 normal sizes
[00:44:15] [PASSED] ABGR8888 max sizes
[00:44:15] [PASSED] ABGR8888 pitch greater than min required
[00:44:15] [PASSED] ABGR8888 pitch less than min required
[00:44:15] [PASSED] ABGR8888 Invalid width
[00:44:15] [PASSED] ABGR8888 Invalid buffer handle
[00:44:15] [PASSED] No pixel format
[00:44:15] [PASSED] ABGR8888 Width 0
[00:44:15] [PASSED] ABGR8888 Height 0
[00:44:15] [PASSED] ABGR8888 Out of bound height * pitch combination
[00:44:15] [PASSED] ABGR8888 Large buffer offset
[00:44:15] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[00:44:15] [PASSED] ABGR8888 Valid buffer modifier
[00:44:15] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[00:44:15] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[00:44:15] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[00:44:15] [PASSED] NV12 Normal sizes
[00:44:15] [PASSED] NV12 Max sizes
[00:44:15] [PASSED] NV12 Invalid pitch
[00:44:15] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[00:44:15] [PASSED] NV12 different  modifier per-plane
[00:44:15] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[00:44:15] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[00:44:15] [PASSED] NV12 Modifier for inexistent plane
[00:44:15] [PASSED] NV12 Handle for inexistent plane
[00:44:15] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[00:44:15] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[00:44:15] [PASSED] YVU420 Normal sizes
[00:44:15] [PASSED] YVU420 Max sizes
[00:44:15] [PASSED] YVU420 Invalid pitch
[00:44:15] [PASSED] YVU420 Different pitches
[00:44:15] [PASSED] YVU420 Different buffer offsets/pitches
[00:44:15] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[00:44:15] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[00:44:15] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[00:44:15] [PASSED] YVU420 Valid modifier
[00:44:15] [PASSED] YVU420 Different modifiers per plane
[00:44:15] [PASSED] YVU420 Modifier for inexistent plane
[00:44:15] [PASSED] X0L2 Normal sizes
[00:44:15] [PASSED] X0L2 Max sizes
[00:44:15] [PASSED] X0L2 Invalid pitch
[00:44:15] [PASSED] X0L2 Pitch greater than minimum required
[00:44:15] [PASSED] X0L2 Handle for inexistent plane
[00:44:15] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[00:44:15] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[00:44:15] [PASSED] X0L2 Valid modifier
[00:44:15] [PASSED] X0L2 Modifier for inexistent plane
[00:44:15] =========== [PASSED] drm_test_framebuffer_create ===========
[00:44:15] ================= [PASSED] drm_framebuffer =================
[00:44:15] ================ drm_gem_shmem (8 subtests) ================
[00:44:15] [PASSED] drm_gem_shmem_test_obj_create
[00:44:15] [PASSED] drm_gem_shmem_test_obj_create_private
[00:44:15] [PASSED] drm_gem_shmem_test_pin_pages
[00:44:15] [PASSED] drm_gem_shmem_test_vmap
[00:44:15] [PASSED] drm_gem_shmem_test_get_pages_sgt
[00:44:15] [PASSED] drm_gem_shmem_test_get_sg_table
[00:44:15] [PASSED] drm_gem_shmem_test_madvise
[00:44:15] [PASSED] drm_gem_shmem_test_purge
[00:44:15] ================== [PASSED] drm_gem_shmem ==================
[00:44:15] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[00:44:15] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[00:44:15] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[00:44:15] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[00:44:15] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[00:44:15] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[00:44:15] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[00:44:15] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[00:44:15] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[00:44:15] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[00:44:15] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[00:44:15] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[00:44:15] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[00:44:15] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[00:44:15] [PASSED] drm_test_check_output_bpc_dvi
[00:44:15] [PASSED] drm_test_check_output_bpc_format_vic_1
[00:44:15] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[00:44:15] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[00:44:15] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[00:44:15] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[00:44:15] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[00:44:15] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[00:44:15] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[00:44:15] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[00:44:15] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[00:44:15] [PASSED] drm_test_check_broadcast_rgb_value
[00:44:15] [PASSED] drm_test_check_bpc_8_value
[00:44:15] [PASSED] drm_test_check_bpc_10_value
[00:44:15] [PASSED] drm_test_check_bpc_12_value
[00:44:15] [PASSED] drm_test_check_format_value
[00:44:15] [PASSED] drm_test_check_tmds_char_value
[00:44:15] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[00:44:15] ================= drm_managed (2 subtests) =================
[00:44:15] [PASSED] drm_test_managed_release_action
[00:44:15] [PASSED] drm_test_managed_run_action
[00:44:15] =================== [PASSED] drm_managed ===================
[00:44:15] =================== drm_mm (6 subtests) ====================
[00:44:15] [PASSED] drm_test_mm_init
[00:44:15] [PASSED] drm_test_mm_debug
[00:44:15] [PASSED] drm_test_mm_align32
[00:44:15] [PASSED] drm_test_mm_align64
[00:44:15] [PASSED] drm_test_mm_lowest
[00:44:15] [PASSED] drm_test_mm_highest
[00:44:15] ===================== [PASSED] drm_mm ======================
[00:44:15] ============= drm_modes_analog_tv (4 subtests) =============
[00:44:15] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[00:44:15] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[00:44:15] [PASSED] drm_test_modes_analog_tv_pal_576i
[00:44:15] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[00:44:15] =============== [PASSED] drm_modes_analog_tv ===============
[00:44:15] ============== drm_plane_helper (2 subtests) ===============
[00:44:15] =============== drm_test_check_plane_state  ================
[00:44:15] [PASSED] clipping_simple
[00:44:15] [PASSED] clipping_rotate_reflect
[00:44:15] [PASSED] positioning_simple
[00:44:15] [PASSED] upscaling
[00:44:15] [PASSED] downscaling
[00:44:15] [PASSED] rounding1
[00:44:15] [PASSED] rounding2
[00:44:15] [PASSED] rounding3
[00:44:15] [PASSED] rounding4
[00:44:15] =========== [PASSED] drm_test_check_plane_state ============
[00:44:15] =========== drm_test_check_invalid_plane_state  ============
[00:44:15] [PASSED] positioning_invalid
[00:44:15] [PASSED] upscaling_invalid
[00:44:15] [PASSED] downscaling_invalid
[00:44:15] ======= [PASSED] drm_test_check_invalid_plane_state ========
[00:44:15] ================ [PASSED] drm_plane_helper =================
stty: 'standard input': Inappropriate ioctl for device
[00:44:15] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[00:44:15] ====== drm_test_connector_helper_tv_get_modes_check  =======
[00:44:15] [PASSED] None
[00:44:15] [PASSED] PAL
[00:44:15] [PASSED] NTSC
[00:44:15] [PASSED] Both, NTSC Default
[00:44:15] [PASSED] Both, PAL Default
[00:44:15] [PASSED] Both, NTSC Default, with PAL on command-line
[00:44:15] [PASSED] Both, PAL Default, with NTSC on command-line
[00:44:15] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[00:44:15] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[00:44:15] ================== drm_rect (9 subtests) ===================
[00:44:15] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[00:44:15] [PASSED] drm_test_rect_clip_scaled_not_clipped
[00:44:15] [PASSED] drm_test_rect_clip_scaled_clipped
[00:44:15] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[00:44:15] ================= drm_test_rect_intersect  =================
[00:44:15] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[00:44:15] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[00:44:15] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[00:44:15] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[00:44:15] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[00:44:15] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[00:44:15] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[00:44:15] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[00:44:15] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[00:44:15] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[00:44:15] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[00:44:15] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[00:44:15] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[00:44:15] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[00:44:15] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[00:44:15] ============= [PASSED] drm_test_rect_intersect =============
[00:44:15] ================ drm_test_rect_calc_hscale  ================
[00:44:15] [PASSED] normal use
[00:44:15] [PASSED] out of max range
[00:44:15] [PASSED] out of min range
[00:44:15] [PASSED] zero dst
[00:44:15] [PASSED] negative src
[00:44:15] [PASSED] negative dst
[00:44:15] ============ [PASSED] drm_test_rect_calc_hscale ============
[00:44:15] ================ drm_test_rect_calc_vscale  ================
[00:44:15] [PASSED] normal use
[00:44:15] [PASSED] out of max range
[00:44:15] [PASSED] out of min range
[00:44:15] [PASSED] zero dst
[00:44:15] [PASSED] negative src
[00:44:15] [PASSED] negative dst
[00:44:15] ============ [PASSED] drm_test_rect_calc_vscale ============
[00:44:15] ================== drm_test_rect_rotate  ===================
[00:44:15] [PASSED] reflect-x
[00:44:15] [PASSED] reflect-y
[00:44:15] [PASSED] rotate-0
[00:44:15] [PASSED] rotate-90
[00:44:15] [PASSED] rotate-180
[00:44:15] [PASSED] rotate-270
[00:44:15] ============== [PASSED] drm_test_rect_rotate ===============
[00:44:15] ================ drm_test_rect_rotate_inv  =================
[00:44:15] [PASSED] reflect-x
[00:44:15] [PASSED] reflect-y
[00:44:15] [PASSED] rotate-0
[00:44:15] [PASSED] rotate-90
[00:44:15] [PASSED] rotate-180
[00:44:15] [PASSED] rotate-270
[00:44:15] ============ [PASSED] drm_test_rect_rotate_inv =============
[00:44:15] ==================== [PASSED] drm_rect =====================
[00:44:15] ============================================================
[00:44:15] Testing complete. Ran 511 tests: passed: 511
[00:44:15] Elapsed time: 23.248s total, 1.711s configuring, 21.351s building, 0.152s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[00:44:15] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:44:17] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[00:44:25] Starting KUnit Kernel (1/1)...
[00:44:25] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[00:44:25] ================= ttm_device (5 subtests) ==================
[00:44:25] [PASSED] ttm_device_init_basic
[00:44:25] [PASSED] ttm_device_init_multiple
[00:44:25] [PASSED] ttm_device_fini_basic
[00:44:25] [PASSED] ttm_device_init_no_vma_man
[00:44:25] ================== ttm_device_init_pools  ==================
[00:44:25] [PASSED] No DMA allocations, no DMA32 required
[00:44:25] [PASSED] DMA allocations, DMA32 required
[00:44:25] [PASSED] No DMA allocations, DMA32 required
[00:44:25] [PASSED] DMA allocations, no DMA32 required
[00:44:25] ============== [PASSED] ttm_device_init_pools ==============
[00:44:25] =================== [PASSED] ttm_device ====================
[00:44:25] ================== ttm_pool (8 subtests) ===================
[00:44:25] ================== ttm_pool_alloc_basic  ===================
[00:44:25] [PASSED] One page
[00:44:25] [PASSED] More than one page
[00:44:25] [PASSED] Above the allocation limit
[00:44:25] [PASSED] One page, with coherent DMA mappings enabled
[00:44:25] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[00:44:25] ============== [PASSED] ttm_pool_alloc_basic ===============
[00:44:25] ============== ttm_pool_alloc_basic_dma_addr  ==============
[00:44:25] [PASSED] One page
[00:44:25] [PASSED] More than one page
[00:44:25] [PASSED] Above the allocation limit
[00:44:25] [PASSED] One page, with coherent DMA mappings enabled
[00:44:25] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[00:44:25] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[00:44:25] [PASSED] ttm_pool_alloc_order_caching_match
[00:44:25] [PASSED] ttm_pool_alloc_caching_mismatch
[00:44:25] [PASSED] ttm_pool_alloc_order_mismatch
[00:44:25] [PASSED] ttm_pool_free_dma_alloc
[00:44:25] [PASSED] ttm_pool_free_no_dma_alloc
[00:44:25] [PASSED] ttm_pool_fini_basic
[00:44:25] ==================== [PASSED] ttm_pool =====================
[00:44:25] ================ ttm_resource (8 subtests) =================
[00:44:25] ================= ttm_resource_init_basic  =================
[00:44:25] [PASSED] Init resource in TTM_PL_SYSTEM
[00:44:25] [PASSED] Init resource in TTM_PL_VRAM
[00:44:25] [PASSED] Init resource in a private placement
[00:44:25] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[00:44:25] ============= [PASSED] ttm_resource_init_basic =============
[00:44:25] [PASSED] ttm_resource_init_pinned
[00:44:25] [PASSED] ttm_resource_fini_basic
[00:44:25] [PASSED] ttm_resource_manager_init_basic
[00:44:25] [PASSED] ttm_resource_manager_usage_basic
[00:44:25] [PASSED] ttm_resource_manager_set_used_basic
[00:44:25] [PASSED] ttm_sys_man_alloc_basic
[00:44:25] [PASSED] ttm_sys_man_free_basic
[00:44:25] ================== [PASSED] ttm_resource ===================
[00:44:25] =================== ttm_tt (10 subtests) ===================
[00:44:25] ==================== ttm_tt_init_basic  ====================
[00:44:25] [PASSED] Page-aligned size
[00:44:25] [PASSED] Extra pages requested
[00:44:25] ================ [PASSED] ttm_tt_init_basic ================
[00:44:25] [PASSED] ttm_tt_init_misaligned
[00:44:25] [PASSED] ttm_tt_fini_basic
[00:44:25] [PASSED] ttm_tt_fini_sg
[00:44:25] [PASSED] ttm_tt_fini_shmem
[00:44:25] [PASSED] ttm_tt_create_basic
[00:44:25] [PASSED] ttm_tt_create_invalid_bo_type
[00:44:25] [PASSED] ttm_tt_create_ttm_exists
[00:44:25] [PASSED] ttm_tt_create_failed
[00:44:25] [PASSED] ttm_tt_destroy_basic
[00:44:25] ===================== [PASSED] ttm_tt ======================
[00:44:25] =================== ttm_bo (14 subtests) ===================
[00:44:25] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[00:44:25] [PASSED] Cannot be interrupted and sleeps
[00:44:25] [PASSED] Cannot be interrupted, locks straight away
[00:44:25] [PASSED] Can be interrupted, sleeps
[00:44:25] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[00:44:25] [PASSED] ttm_bo_reserve_locked_no_sleep
[00:44:25] [PASSED] ttm_bo_reserve_no_wait_ticket
[00:44:25] [PASSED] ttm_bo_reserve_double_resv
[00:44:25] [PASSED] ttm_bo_reserve_interrupted
[00:44:25] [PASSED] ttm_bo_reserve_deadlock
[00:44:25] [PASSED] ttm_bo_unreserve_basic
[00:44:25] [PASSED] ttm_bo_unreserve_pinned
[00:44:25] [PASSED] ttm_bo_unreserve_bulk
[00:44:25] [PASSED] ttm_bo_put_basic
[00:44:25] [PASSED] ttm_bo_put_shared_resv
[00:44:25] [PASSED] ttm_bo_pin_basic
[00:44:25] [PASSED] ttm_bo_pin_unpin_resource
[00:44:25] [PASSED] ttm_bo_multiple_pin_one_unpin
[00:44:25] ===================== [PASSED] ttm_bo ======================
[00:44:25] ============================================================
[00:44:25] Testing complete. Ran 62 tests: passed: 62
[00:44:25] Elapsed time: 10.518s total, 1.738s configuring, 8.560s building, 0.185s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


