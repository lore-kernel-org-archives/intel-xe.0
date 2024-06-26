Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064EFC2BBCA
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 02:49:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A990B10E0A6;
	Wed, 26 Jun 2024 02:49:08 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7532910E0A6;
 Wed, 26 Jun 2024 02:49:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/oa=3A_Add_NO=5FPREEMPT_?=
 =?utf-8?q?property_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jun 2024 02:49:06 -0000
Message-ID: <171937014647.158965.11714050912812646532@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626021343.1054590-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240626021343.1054590-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: Add NO_PREEMPT property (rev5)
URL   : https://patchwork.freedesktop.org/series/135382/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[02:47:58] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:48:02] Building KUnit Kernel ...
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

[02:48:28] Starting KUnit Kernel (1/1)...
[02:48:28] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[02:48:28] =================== guc_dbm (7 subtests) ===================
[02:48:28] [PASSED] test_empty
[02:48:28] [PASSED] test_default
[02:48:28] ======================== test_size  ========================
[02:48:28] [PASSED] 4
[02:48:28] [PASSED] 8
[02:48:28] [PASSED] 32
[02:48:28] [PASSED] 256
[02:48:28] ==================== [PASSED] test_size ====================
[02:48:28] ======================= test_reuse  ========================
[02:48:28] [PASSED] 4
[02:48:28] [PASSED] 8
[02:48:28] [PASSED] 32
[02:48:28] [PASSED] 256
[02:48:28] =================== [PASSED] test_reuse ====================
[02:48:28] =================== test_range_overlap  ====================
[02:48:28] [PASSED] 4
[02:48:28] [PASSED] 8
[02:48:28] [PASSED] 32
[02:48:28] [PASSED] 256
[02:48:28] =============== [PASSED] test_range_overlap ================
[02:48:28] =================== test_range_compact  ====================
[02:48:28] [PASSED] 4
[02:48:28] [PASSED] 8
[02:48:28] [PASSED] 32
[02:48:28] [PASSED] 256
[02:48:28] =============== [PASSED] test_range_compact ================
[02:48:28] ==================== test_range_spare  =====================
[02:48:28] [PASSED] 4
[02:48:28] [PASSED] 8
[02:48:28] [PASSED] 32
[02:48:28] [PASSED] 256
[02:48:28] ================ [PASSED] test_range_spare =================
[02:48:28] ===================== [PASSED] guc_dbm =====================
[02:48:28] =================== guc_idm (6 subtests) ===================
[02:48:28] [PASSED] bad_init
[02:48:28] [PASSED] no_init
[02:48:28] [PASSED] init_fini
[02:48:28] [PASSED] check_used
[02:48:28] [PASSED] check_quota
[02:48:28] [PASSED] check_all
[02:48:28] ===================== [PASSED] guc_idm =====================
[02:48:28] ================== no_relay (3 subtests) ===================
[02:48:28] [PASSED] xe_drops_guc2pf_if_not_ready
[02:48:28] [PASSED] xe_drops_guc2vf_if_not_ready
[02:48:28] [PASSED] xe_rejects_send_if_not_ready
[02:48:28] ==================== [PASSED] no_relay =====================
[02:48:28] ================== pf_relay (14 subtests) ==================
[02:48:28] [PASSED] pf_rejects_guc2pf_too_short
[02:48:28] [PASSED] pf_rejects_guc2pf_too_long
[02:48:28] [PASSED] pf_rejects_guc2pf_no_payload
[02:48:28] [PASSED] pf_fails_no_payload
[02:48:28] [PASSED] pf_fails_bad_origin
[02:48:28] [PASSED] pf_fails_bad_type
[02:48:28] [PASSED] pf_txn_reports_error
[02:48:28] [PASSED] pf_txn_sends_pf2guc
[02:48:28] [PASSED] pf_sends_pf2guc
[02:48:28] [SKIPPED] pf_loopback_nop
[02:48:28] [SKIPPED] pf_loopback_echo
[02:48:28] [SKIPPED] pf_loopback_fail
[02:48:28] [SKIPPED] pf_loopback_busy
[02:48:28] [SKIPPED] pf_loopback_retry
[02:48:28] ==================== [PASSED] pf_relay =====================
[02:48:28] ================== vf_relay (3 subtests) ===================
[02:48:28] [PASSED] vf_rejects_guc2vf_too_short
[02:48:28] [PASSED] vf_rejects_guc2vf_too_long
[02:48:28] [PASSED] vf_rejects_guc2vf_no_payload
[02:48:28] ==================== [PASSED] vf_relay =====================
[02:48:28] ================= pf_service (11 subtests) =================
[02:48:28] [PASSED] pf_negotiate_any
[02:48:28] [PASSED] pf_negotiate_base_match
[02:48:28] [PASSED] pf_negotiate_base_newer
[02:48:28] [PASSED] pf_negotiate_base_next
[02:48:28] [SKIPPED] pf_negotiate_base_older
[02:48:28] [PASSED] pf_negotiate_base_prev
[02:48:28] [PASSED] pf_negotiate_latest_match
[02:48:28] [PASSED] pf_negotiate_latest_newer
[02:48:28] [PASSED] pf_negotiate_latest_next
[02:48:28] [SKIPPED] pf_negotiate_latest_older
[02:48:28] [SKIPPED] pf_negotiate_latest_prev
[02:48:28] =================== [PASSED] pf_service ====================
[02:48:28] ===================== lmtt (1 subtest) =====================
[02:48:28] ======================== test_ops  =========================
[02:48:28] [PASSED] 2-level
[02:48:28] [PASSED] multi-level
[02:48:28] ==================== [PASSED] test_ops =====================
[02:48:28] ====================== [PASSED] lmtt =======================
[02:48:28] ==================== xe_bo (2 subtests) ====================
[02:48:28] [SKIPPED] xe_ccs_migrate_kunit
[02:48:28] [SKIPPED] xe_bo_evict_kunit
[02:48:28] ===================== [SKIPPED] xe_bo ======================
[02:48:28] ================== xe_dma_buf (1 subtest) ==================
[02:48:28] [SKIPPED] xe_dma_buf_kunit
[02:48:28] =================== [SKIPPED] xe_dma_buf ===================
[02:48:28] ================== xe_migrate (1 subtest) ==================
[02:48:28] [SKIPPED] xe_migrate_sanity_kunit
[02:48:28] =================== [SKIPPED] xe_migrate ===================
[02:48:28] =================== xe_mocs (2 subtests) ===================
[02:48:28] [SKIPPED] xe_live_mocs_kernel_kunit
[02:48:28] [SKIPPED] xe_live_mocs_reset_kunit
[02:48:28] ==================== [SKIPPED] xe_mocs =====================
[02:48:28] ==================== args (11 subtests) ====================
[02:48:28] [PASSED] count_args_test
[02:48:28] [PASSED] call_args_example
[02:48:28] [PASSED] call_args_test
[02:48:28] [PASSED] drop_first_arg_example
[02:48:28] [PASSED] drop_first_arg_test
[02:48:28] [PASSED] first_arg_example
[02:48:28] [PASSED] first_arg_test
[02:48:28] [PASSED] last_arg_example
[02:48:28] [PASSED] last_arg_test
[02:48:28] [PASSED] pick_arg_example
[02:48:28] [PASSED] sep_comma_example
[02:48:28] ====================== [PASSED] args =======================
[02:48:28] =================== xe_pci (2 subtests) ====================
[02:48:28] [PASSED] xe_gmdid_graphics_ip
[02:48:28] [PASSED] xe_gmdid_media_ip
[02:48:28] ===================== [PASSED] xe_pci ======================
[02:48:28] ==================== xe_rtp (1 subtest) ====================
[02:48:28] ================== xe_rtp_process_tests  ===================
[02:48:28] [PASSED] coalesce-same-reg
[02:48:28] [PASSED] no-match-no-add
[02:48:28] [PASSED] match-or
[02:48:28] [PASSED] match-or-xfail
[02:48:28] [PASSED] no-match-no-add-multiple-rules
[02:48:28] [PASSED] two-regs-two-entries
[02:48:28] [PASSED] clr-one-set-other
[02:48:28] [PASSED] set-field
[02:48:28] [PASSED] conflict-duplicate
[02:48:28] [PASSED] conflict-not-disjoint
[02:48:28] [PASSED] conflict-reg-type
stty: 'standard input': Inappropriate ioctl for device
[02:48:28] ============== [PASSED] xe_rtp_process_tests ===============
[02:48:28] ===================== [PASSED] xe_rtp ======================
[02:48:28] ==================== xe_wa (1 subtest) =====================
[02:48:28] ======================== xe_wa_gt  =========================
[02:48:28] [PASSED] TIGERLAKE (B0)
[02:48:28] [PASSED] DG1 (A0)
[02:48:28] [PASSED] DG1 (B0)
[02:48:28] [PASSED] ALDERLAKE_S (A0)
[02:48:28] [PASSED] ALDERLAKE_S (B0)
[02:48:28] [PASSED] ALDERLAKE_S (C0)
[02:48:28] [PASSED] ALDERLAKE_S (D0)
[02:48:28] [PASSED] ALDERLAKE_P (A0)
[02:48:28] [PASSED] ALDERLAKE_P (B0)
[02:48:28] [PASSED] ALDERLAKE_P (C0)
[02:48:28] [PASSED] ALDERLAKE_S_RPLS (D0)
[02:48:28] [PASSED] ALDERLAKE_P_RPLU (E0)
[02:48:28] [PASSED] DG2_G10 (C0)
[02:48:28] [PASSED] DG2_G11 (B1)
[02:48:28] [PASSED] DG2_G12 (A1)
[02:48:28] [PASSED] METEORLAKE (g:A0, m:A0)
[02:48:28] [PASSED] METEORLAKE (g:A0, m:A0)
[02:48:28] [PASSED] METEORLAKE (g:A0, m:A0)
[02:48:28] [PASSED] LUNARLAKE (g:A0, m:A0)
[02:48:28] [PASSED] LUNARLAKE (g:B0, m:A0)
[02:48:28] ==================== [PASSED] xe_wa_gt =====================
[02:48:28] ====================== [PASSED] xe_wa ======================
[02:48:28] ============================================================
[02:48:28] Testing complete. Ran 111 tests: passed: 97, skipped: 14
[02:48:28] Elapsed time: 29.972s total, 4.270s configuring, 25.430s building, 0.221s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[02:48:28] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:48:30] Building KUnit Kernel ...
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

[02:48:51] Starting KUnit Kernel (1/1)...
[02:48:51] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[02:48:51] ============ drm_test_pick_cmdline (2 subtests) ============
[02:48:51] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[02:48:51] =============== drm_test_pick_cmdline_named  ===============
[02:48:51] [PASSED] NTSC
[02:48:51] [PASSED] NTSC-J
[02:48:51] [PASSED] PAL
[02:48:51] [PASSED] PAL-M
[02:48:51] =========== [PASSED] drm_test_pick_cmdline_named ===========
[02:48:51] ============== [PASSED] drm_test_pick_cmdline ==============
[02:48:51] ================== drm_buddy (7 subtests) ==================
[02:48:51] [PASSED] drm_test_buddy_alloc_limit
[02:48:51] [PASSED] drm_test_buddy_alloc_optimistic
[02:48:51] [PASSED] drm_test_buddy_alloc_pessimistic
[02:48:51] [PASSED] drm_test_buddy_alloc_pathological
[02:48:51] [PASSED] drm_test_buddy_alloc_contiguous
[02:48:51] [PASSED] drm_test_buddy_alloc_clear
[02:48:51] [PASSED] drm_test_buddy_alloc_range_bias
[02:48:51] ==================== [PASSED] drm_buddy ====================
[02:48:51] ============= drm_cmdline_parser (40 subtests) =============
[02:48:51] [PASSED] drm_test_cmdline_force_d_only
[02:48:51] [PASSED] drm_test_cmdline_force_D_only_dvi
[02:48:51] [PASSED] drm_test_cmdline_force_D_only_hdmi
[02:48:51] [PASSED] drm_test_cmdline_force_D_only_not_digital
[02:48:51] [PASSED] drm_test_cmdline_force_e_only
[02:48:51] [PASSED] drm_test_cmdline_res
[02:48:51] [PASSED] drm_test_cmdline_res_vesa
[02:48:51] [PASSED] drm_test_cmdline_res_vesa_rblank
[02:48:51] [PASSED] drm_test_cmdline_res_rblank
[02:48:51] [PASSED] drm_test_cmdline_res_bpp
[02:48:51] [PASSED] drm_test_cmdline_res_refresh
[02:48:51] [PASSED] drm_test_cmdline_res_bpp_refresh
[02:48:51] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[02:48:51] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[02:48:51] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[02:48:51] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[02:48:51] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[02:48:51] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[02:48:51] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[02:48:51] [PASSED] drm_test_cmdline_res_margins_force_on
[02:48:51] [PASSED] drm_test_cmdline_res_vesa_margins
[02:48:51] [PASSED] drm_test_cmdline_name
[02:48:51] [PASSED] drm_test_cmdline_name_bpp
[02:48:51] [PASSED] drm_test_cmdline_name_option
[02:48:51] [PASSED] drm_test_cmdline_name_bpp_option
[02:48:51] [PASSED] drm_test_cmdline_rotate_0
[02:48:51] [PASSED] drm_test_cmdline_rotate_90
[02:48:51] [PASSED] drm_test_cmdline_rotate_180
[02:48:51] [PASSED] drm_test_cmdline_rotate_270
[02:48:51] [PASSED] drm_test_cmdline_hmirror
[02:48:51] [PASSED] drm_test_cmdline_vmirror
[02:48:51] [PASSED] drm_test_cmdline_margin_options
[02:48:51] [PASSED] drm_test_cmdline_multiple_options
[02:48:51] [PASSED] drm_test_cmdline_bpp_extra_and_option
[02:48:51] [PASSED] drm_test_cmdline_extra_and_option
[02:48:51] [PASSED] drm_test_cmdline_freestanding_options
[02:48:51] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[02:48:51] [PASSED] drm_test_cmdline_panel_orientation
[02:48:51] ================ drm_test_cmdline_invalid  =================
[02:48:51] [PASSED] margin_only
[02:48:51] [PASSED] interlace_only
[02:48:51] [PASSED] res_missing_x
[02:48:51] [PASSED] res_missing_y
[02:48:51] [PASSED] res_bad_y
[02:48:51] [PASSED] res_missing_y_bpp
[02:48:51] [PASSED] res_bad_bpp
[02:48:51] [PASSED] res_bad_refresh
[02:48:51] [PASSED] res_bpp_refresh_force_on_off
[02:48:51] [PASSED] res_invalid_mode
[02:48:51] [PASSED] res_bpp_wrong_place_mode
[02:48:51] [PASSED] name_bpp_refresh
[02:48:51] [PASSED] name_refresh
[02:48:51] [PASSED] name_refresh_wrong_mode
[02:48:51] [PASSED] name_refresh_invalid_mode
[02:48:51] [PASSED] rotate_multiple
[02:48:51] [PASSED] rotate_invalid_val
[02:48:51] [PASSED] rotate_truncated
[02:48:51] [PASSED] invalid_option
[02:48:51] [PASSED] invalid_tv_option
[02:48:51] [PASSED] truncated_tv_option
[02:48:51] ============ [PASSED] drm_test_cmdline_invalid =============
[02:48:51] =============== drm_test_cmdline_tv_options  ===============
[02:48:51] [PASSED] NTSC
[02:48:51] [PASSED] NTSC_443
[02:48:51] [PASSED] NTSC_J
[02:48:51] [PASSED] PAL
[02:48:51] [PASSED] PAL_M
[02:48:51] [PASSED] PAL_N
[02:48:51] [PASSED] SECAM
[02:48:51] =========== [PASSED] drm_test_cmdline_tv_options ===========
[02:48:51] =============== [PASSED] drm_cmdline_parser ================
[02:48:51] ========== drmm_connector_hdmi_init (19 subtests) ==========
[02:48:51] [PASSED] drm_test_connector_hdmi_init_valid
[02:48:51] [PASSED] drm_test_connector_hdmi_init_bpc_8
[02:48:51] [PASSED] drm_test_connector_hdmi_init_bpc_10
[02:48:51] [PASSED] drm_test_connector_hdmi_init_bpc_12
[02:48:51] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[02:48:51] [PASSED] drm_test_connector_hdmi_init_bpc_null
[02:48:51] [PASSED] drm_test_connector_hdmi_init_formats_empty
[02:48:51] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[02:48:51] [PASSED] drm_test_connector_hdmi_init_null_ddc
[02:48:51] [PASSED] drm_test_connector_hdmi_init_null_product
[02:48:51] [PASSED] drm_test_connector_hdmi_init_null_vendor
[02:48:51] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[02:48:51] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[02:48:51] [PASSED] drm_test_connector_hdmi_init_product_valid
[02:48:51] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[02:48:51] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[02:48:51] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[02:48:51] ========= drm_test_connector_hdmi_init_type_valid  =========
[02:48:51] [PASSED] HDMI-A
[02:48:51] [PASSED] HDMI-B
[02:48:51] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[02:48:51] ======== drm_test_connector_hdmi_init_type_invalid  ========
[02:48:51] [PASSED] Unknown
[02:48:51] [PASSED] VGA
[02:48:51] [PASSED] DVI-I
[02:48:51] [PASSED] DVI-D
[02:48:51] [PASSED] DVI-A
[02:48:51] [PASSED] Composite
[02:48:51] [PASSED] SVIDEO
[02:48:51] [PASSED] LVDS
[02:48:51] [PASSED] Component
[02:48:51] [PASSED] DIN
[02:48:51] [PASSED] DP
[02:48:51] [PASSED] TV
[02:48:51] [PASSED] eDP
[02:48:51] [PASSED] Virtual
[02:48:51] [PASSED] DSI
[02:48:51] [PASSED] DPI
[02:48:51] [PASSED] Writeback
[02:48:51] [PASSED] SPI
[02:48:51] [PASSED] USB
[02:48:51] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[02:48:51] ============ [PASSED] drmm_connector_hdmi_init =============
[02:48:51] ============= drmm_connector_init (3 subtests) =============
[02:48:51] [PASSED] drm_test_drmm_connector_init
[02:48:51] [PASSED] drm_test_drmm_connector_init_null_ddc
[02:48:51] ========= drm_test_drmm_connector_init_type_valid  =========
[02:48:51] [PASSED] Unknown
[02:48:51] [PASSED] VGA
[02:48:51] [PASSED] DVI-I
[02:48:51] [PASSED] DVI-D
[02:48:51] [PASSED] DVI-A
[02:48:51] [PASSED] Composite
[02:48:51] [PASSED] SVIDEO
[02:48:51] [PASSED] LVDS
[02:48:51] [PASSED] Component
[02:48:51] [PASSED] DIN
[02:48:51] [PASSED] DP
[02:48:51] [PASSED] HDMI-A
[02:48:51] [PASSED] HDMI-B
[02:48:51] [PASSED] TV
[02:48:51] [PASSED] eDP
[02:48:51] [PASSED] Virtual
[02:48:51] [PASSED] DSI
[02:48:51] [PASSED] DPI
[02:48:51] [PASSED] Writeback
[02:48:51] [PASSED] SPI
[02:48:51] [PASSED] USB
[02:48:51] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[02:48:51] =============== [PASSED] drmm_connector_init ===============
[02:48:51] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[02:48:51] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[02:48:51] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[02:48:51] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[02:48:51] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[02:48:51] ========== drm_test_get_tv_mode_from_name_valid  ===========
[02:48:51] [PASSED] NTSC
[02:48:51] [PASSED] NTSC-443
[02:48:51] [PASSED] NTSC-J
[02:48:51] [PASSED] PAL
[02:48:51] [PASSED] PAL-M
[02:48:51] [PASSED] PAL-N
[02:48:51] [PASSED] SECAM
[02:48:51] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[02:48:51] [PASSED] drm_test_get_tv_mode_from_name_truncated
[02:48:51] ============ [PASSED] drm_get_tv_mode_from_name ============
[02:48:51] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[02:48:51] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[02:48:51] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[02:48:51] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[02:48:51] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[02:48:51] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[02:48:51] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[02:48:51] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[02:48:51] [PASSED] VIC 96
[02:48:51] [PASSED] VIC 97
[02:48:51] [PASSED] VIC 101
[02:48:51] [PASSED] VIC 102
[02:48:51] [PASSED] VIC 106
[02:48:51] [PASSED] VIC 107
[02:48:51] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[02:48:51] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[02:48:51] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[02:48:51] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[02:48:51] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[02:48:51] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[02:48:51] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[02:48:51] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[02:48:51] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[02:48:51] [PASSED] Automatic
[02:48:51] [PASSED] Full
[02:48:51] [PASSED] Limited 16:235
[02:48:51] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[02:48:51] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[02:48:51] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[02:48:51] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[02:48:51] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[02:48:51] [PASSED] RGB
[02:48:51] [PASSED] YUV 4:2:0
[02:48:51] [PASSED] YUV 4:2:2
[02:48:51] [PASSED] YUV 4:4:4
[02:48:51] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[02:48:51] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[02:48:51] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[02:48:51] ============= drm_damage_helper (21 subtests) ==============
[02:48:51] [PASSED] drm_test_damage_iter_no_damage
[02:48:51] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[02:48:51] [PASSED] drm_test_damage_iter_no_damage_src_moved
[02:48:51] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[02:48:51] [PASSED] drm_test_damage_iter_no_damage_not_visible
[02:48:51] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[02:48:51] [PASSED] drm_test_damage_iter_no_damage_no_fb
[02:48:51] [PASSED] drm_test_damage_iter_simple_damage
[02:48:51] [PASSED] drm_test_damage_iter_single_damage
[02:48:51] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[02:48:51] [PASSED] drm_test_damage_iter_single_damage_outside_src
[02:48:51] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[02:48:51] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[02:48:51] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[02:48:51] [PASSED] drm_test_damage_iter_single_damage_src_moved
[02:48:51] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[02:48:51] [PASSED] drm_test_damage_iter_damage
[02:48:51] [PASSED] drm_test_damage_iter_damage_one_intersect
[02:48:51] [PASSED] drm_test_damage_iter_damage_one_outside
[02:48:51] [PASSED] drm_test_damage_iter_damage_src_moved
[02:48:51] [PASSED] drm_test_damage_iter_damage_not_visible
[02:48:51] ================ [PASSED] drm_damage_helper ================
[02:48:51] ============== drm_dp_mst_helper (3 subtests) ==============
[02:48:51] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[02:48:51] [PASSED] Clock 154000 BPP 30 DSC disabled
[02:48:51] [PASSED] Clock 234000 BPP 30 DSC disabled
[02:48:51] [PASSED] Clock 297000 BPP 24 DSC disabled
[02:48:51] [PASSED] Clock 332880 BPP 24 DSC enabled
[02:48:51] [PASSED] Clock 324540 BPP 24 DSC enabled
[02:48:51] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[02:48:51] ============== drm_test_dp_mst_calc_pbn_div  ===============
[02:48:51] [PASSED] Link rate 2000000 lane count 4
[02:48:51] [PASSED] Link rate 2000000 lane count 2
[02:48:51] [PASSED] Link rate 2000000 lane count 1
[02:48:51] [PASSED] Link rate 1350000 lane count 4
[02:48:51] [PASSED] Link rate 1350000 lane count 2
[02:48:51] [PASSED] Link rate 1350000 lane count 1
[02:48:51] [PASSED] Link rate 1000000 lane count 4
[02:48:51] [PASSED] Link rate 1000000 lane count 2
[02:48:51] [PASSED] Link rate 1000000 lane count 1
[02:48:51] [PASSED] Link rate 810000 lane count 4
[02:48:51] [PASSED] Link rate 810000 lane count 2
[02:48:51] [PASSED] Link rate 810000 lane count 1
[02:48:51] [PASSED] Link rate 540000 lane count 4
[02:48:51] [PASSED] Link rate 540000 lane count 2
[02:48:51] [PASSED] Link rate 540000 lane count 1
[02:48:51] [PASSED] Link rate 270000 lane count 4
[02:48:51] [PASSED] Link rate 270000 lane count 2
[02:48:51] [PASSED] Link rate 270000 lane count 1
[02:48:51] [PASSED] Link rate 162000 lane count 4
[02:48:51] [PASSED] Link rate 162000 lane count 2
[02:48:51] [PASSED] Link rate 162000 lane count 1
[02:48:51] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[02:48:51] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[02:48:51] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[02:48:51] [PASSED] DP_POWER_UP_PHY with port number
[02:48:51] [PASSED] DP_POWER_DOWN_PHY with port number
[02:48:51] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[02:48:51] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[02:48:51] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[02:48:51] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[02:48:51] [PASSED] DP_QUERY_PAYLOAD with port number
[02:48:51] [PASSED] DP_QUERY_PAYLOAD with VCPI
[02:48:51] [PASSED] DP_REMOTE_DPCD_READ with port number
[02:48:51] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[02:48:51] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[02:48:51] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[02:48:51] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[02:48:51] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[02:48:51] [PASSED] DP_REMOTE_I2C_READ with port number
[02:48:51] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[02:48:51] [PASSED] DP_REMOTE_I2C_READ with transactions array
[02:48:51] [PASSED] DP_REMOTE_I2C_WRITE with port number
[02:48:51] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[02:48:51] [PASSED] DP_REMOTE_I2C_WRITE with data array
[02:48:51] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[02:48:51] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[02:48:51] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[02:48:51] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[02:48:51] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[02:48:51] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[02:48:51] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[02:48:51] ================ [PASSED] drm_dp_mst_helper ================
[02:48:51] ================== drm_exec (7 subtests) ===================
[02:48:51] [PASSED] sanitycheck
[02:48:51] [PASSED] test_lock
[02:48:51] [PASSED] test_lock_unlock
[02:48:51] [PASSED] test_duplicates
[02:48:51] [PASSED] test_prepare
[02:48:51] [PASSED] test_prepare_array
[02:48:51] [PASSED] test_multiple_loops
[02:48:51] ==================== [PASSED] drm_exec =====================
[02:48:51] =========== drm_format_helper_test (17 subtests) ===========
[02:48:51] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[02:48:51] [PASSED] single_pixel_source_buffer
[02:48:51] [PASSED] single_pixel_clip_rectangle
[02:48:51] [PASSED] well_known_colors
[02:48:51] [PASSED] destination_pitch
[02:48:51] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[02:48:51] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[02:48:51] [PASSED] single_pixel_source_buffer
[02:48:51] [PASSED] single_pixel_clip_rectangle
[02:48:51] [PASSED] well_known_colors
[02:48:51] [PASSED] destination_pitch
[02:48:51] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[02:48:51] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[02:48:51] [PASSED] single_pixel_source_buffer
[02:48:51] [PASSED] single_pixel_clip_rectangle
[02:48:51] [PASSED] well_known_colors
[02:48:51] [PASSED] destination_pitch
[02:48:51] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[02:48:51] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[02:48:51] [PASSED] single_pixel_source_buffer
[02:48:51] [PASSED] single_pixel_clip_rectangle
[02:48:51] [PASSED] well_known_colors
[02:48:51] [PASSED] destination_pitch
[02:48:51] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[02:48:51] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[02:48:51] [PASSED] single_pixel_source_buffer
[02:48:51] [PASSED] single_pixel_clip_rectangle
[02:48:51] [PASSED] well_known_colors
[02:48:51] [PASSED] destination_pitch
[02:48:51] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[02:48:51] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[02:48:51] [PASSED] single_pixel_source_buffer
[02:48:51] [PASSED] single_pixel_clip_rectangle
[02:48:51] [PASSED] well_known_colors
[02:48:51] [PASSED] destination_pitch
[02:48:51] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[02:48:51] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[02:48:51] [PASSED] single_pixel_source_buffer
[02:48:51] [PASSED] single_pixel_clip_rectangle
[02:48:51] [PASSED] well_known_colors
[02:48:51] [PASSED] destination_pitch
[02:48:51] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[02:48:51] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[02:48:51] [PASSED] single_pixel_source_buffer
[02:48:51] [PASSED] single_pixel_clip_rectangle
[02:48:51] [PASSED] well_known_colors
[02:48:51] [PASSED] destination_pitch
[02:48:51] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[02:48:51] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[02:48:51] [PASSED] single_pixel_source_buffer
[02:48:51] [PASSED] single_pixel_clip_rectangle
[02:48:51] [PASSED] well_known_colors
[02:48:51] [PASSED] destination_pitch
[02:48:51] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[02:48:51] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[02:48:51] [PASSED] single_pixel_source_buffer
[02:48:51] [PASSED] single_pixel_clip_rectangle
[02:48:51] [PASSED] well_known_colors
[02:48:51] [PASSED] destination_pitch
[02:48:51] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[02:48:51] ============== drm_test_fb_xrgb8888_to_mono  ===============
[02:48:51] [PASSED] single_pixel_source_buffer
[02:48:51] [PASSED] single_pixel_clip_rectangle
[02:48:51] [PASSED] well_known_colors
[02:48:51] [PASSED] destination_pitch
[02:48:51] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[02:48:51] ==================== drm_test_fb_swab  =====================
[02:48:51] [PASSED] single_pixel_source_buffer
[02:48:51] [PASSED] single_pixel_clip_rectangle
[02:48:51] [PASSED] well_known_colors
[02:48:51] [PASSED] destination_pitch
[02:48:51] ================ [PASSED] drm_test_fb_swab =================
[02:48:51] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[02:48:51] [PASSED] single_pixel_source_buffer
[02:48:51] [PASSED] single_pixel_clip_rectangle
[02:48:51] [PASSED] well_known_colors
[02:48:51] [PASSED] destination_pitch
[02:48:51] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[02:48:51] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[02:48:51] [PASSED] single_pixel_source_buffer
[02:48:51] [PASSED] single_pixel_clip_rectangle
[02:48:51] [PASSED] well_known_colors
[02:48:51] [PASSED] destination_pitch
[02:48:51] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[02:48:51] ================= drm_test_fb_clip_offset  =================
[02:48:51] [PASSED] pass through
[02:48:51] [PASSED] horizontal offset
[02:48:51] [PASSED] vertical offset
[02:48:51] [PASSED] horizontal and vertical offset
[02:48:51] [PASSED] horizontal offset (custom pitch)
[02:48:51] [PASSED] vertical offset (custom pitch)
[02:48:51] [PASSED] horizontal and vertical offset (custom pitch)
[02:48:51] ============= [PASSED] drm_test_fb_clip_offset =============
[02:48:51] ============== drm_test_fb_build_fourcc_list  ==============
[02:48:51] [PASSED] no native formats
[02:48:51] [PASSED] XRGB8888 as native format
[02:48:51] [PASSED] remove duplicates
[02:48:51] [PASSED] convert alpha formats
[02:48:51] [PASSED] random formats
[02:48:51] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[02:48:51] =================== drm_test_fb_memcpy  ====================
[02:48:51] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[02:48:51] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[02:48:51] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[02:48:51] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[02:48:51] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[02:48:51] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[02:48:51] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[02:48:51] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[02:48:51] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[02:48:51] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[02:48:51] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[02:48:51] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[02:48:51] =============== [PASSED] drm_test_fb_memcpy ================
[02:48:51] ============= [PASSED] drm_format_helper_test ==============
[02:48:51] ================= drm_format (18 subtests) =================
[02:48:51] [PASSED] drm_test_format_block_width_invalid
[02:48:51] [PASSED] drm_test_format_block_width_one_plane
[02:48:51] [PASSED] drm_test_format_block_width_two_plane
[02:48:51] [PASSED] drm_test_format_block_width_three_plane
[02:48:51] [PASSED] drm_test_format_block_width_tiled
[02:48:51] [PASSED] drm_test_format_block_height_invalid
[02:48:51] [PASSED] drm_test_format_block_height_one_plane
[02:48:51] [PASSED] drm_test_format_block_height_two_plane
[02:48:51] [PASSED] drm_test_format_block_height_three_plane
[02:48:51] [PASSED] drm_test_format_block_height_tiled
[02:48:51] [PASSED] drm_test_format_min_pitch_invalid
[02:48:51] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[02:48:51] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[02:48:51] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[02:48:51] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[02:48:51] [PASSED] drm_test_format_min_pitch_two_plane
[02:48:51] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[02:48:51] [PASSED] drm_test_format_min_pitch_tiled
[02:48:51] =================== [PASSED] drm_format ====================
[02:48:51] =============== drm_framebuffer (1 subtest) ================
[02:48:51] =============== drm_test_framebuffer_create  ===============
[02:48:51] [PASSED] ABGR8888 normal sizes
[02:48:51] [PASSED] ABGR8888 max sizes
[02:48:51] [PASSED] ABGR8888 pitch greater than min required
[02:48:51] [PASSED] ABGR8888 pitch less than min required
[02:48:51] [PASSED] ABGR8888 Invalid width
[02:48:51] [PASSED] ABGR8888 Invalid buffer handle
[02:48:51] [PASSED] No pixel format
[02:48:51] [PASSED] ABGR8888 Width 0
[02:48:51] [PASSED] ABGR8888 Height 0
[02:48:51] [PASSED] ABGR8888 Out of bound height * pitch combination
[02:48:51] [PASSED] ABGR8888 Large buffer offset
[02:48:51] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[02:48:51] [PASSED] ABGR8888 Valid buffer modifier
[02:48:51] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[02:48:51] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[02:48:51] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[02:48:51] [PASSED] NV12 Normal sizes
[02:48:51] [PASSED] NV12 Max sizes
[02:48:51] [PASSED] NV12 Invalid pitch
[02:48:51] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[02:48:51] [PASSED] NV12 different  modifier per-plane
[02:48:51] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[02:48:51] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[02:48:51] [PASSED] NV12 Modifier for inexistent plane
[02:48:51] [PASSED] NV12 Handle for inexistent plane
[02:48:51] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[02:48:51] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[02:48:51] [PASSED] YVU420 Normal sizes
[02:48:51] [PASSED] YVU420 Max sizes
[02:48:51] [PASSED] YVU420 Invalid pitch
[02:48:51] [PASSED] YVU420 Different pitches
[02:48:51] [PASSED] YVU420 Different buffer offsets/pitches
[02:48:51] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[02:48:51] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[02:48:51] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[02:48:51] [PASSED] YVU420 Valid modifier
[02:48:51] [PASSED] YVU420 Different modifiers per plane
[02:48:51] [PASSED] YVU420 Modifier for inexistent plane
[02:48:51] [PASSED] X0L2 Normal sizes
[02:48:51] [PASSED] X0L2 Max sizes
[02:48:51] [PASSED] X0L2 Invalid pitch
[02:48:51] [PASSED] X0L2 Pitch greater than minimum required
[02:48:51] [PASSED] X0L2 Handle for inexistent plane
[02:48:51] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[02:48:51] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[02:48:51] [PASSED] X0L2 Valid modifier
[02:48:51] [PASSED] X0L2 Modifier for inexistent plane
[02:48:51] =========== [PASSED] drm_test_framebuffer_create ===========
[02:48:51] ================= [PASSED] drm_framebuffer =================
[02:48:51] ================ drm_gem_shmem (8 subtests) ================
[02:48:51] [PASSED] drm_gem_shmem_test_obj_create
[02:48:51] [PASSED] drm_gem_shmem_test_obj_create_private
[02:48:51] [PASSED] drm_gem_shmem_test_pin_pages
[02:48:51] [PASSED] drm_gem_shmem_test_vmap
[02:48:51] [PASSED] drm_gem_shmem_test_get_pages_sgt
[02:48:51] [PASSED] drm_gem_shmem_test_get_sg_table
[02:48:51] [PASSED] drm_gem_shmem_test_madvise
[02:48:51] [PASSED] drm_gem_shmem_test_purge
[02:48:51] ================== [PASSED] drm_gem_shmem ==================
[02:48:51] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[02:48:51] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[02:48:51] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[02:48:51] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[02:48:51] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[02:48:51] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[02:48:51] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[02:48:51] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[02:48:51] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[02:48:51] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[02:48:51] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[02:48:51] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[02:48:51] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[02:48:51] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[02:48:51] [PASSED] drm_test_check_output_bpc_dvi
[02:48:51] [PASSED] drm_test_check_output_bpc_format_vic_1
[02:48:51] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[02:48:51] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[02:48:51] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[02:48:51] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[02:48:51] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[02:48:51] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[02:48:51] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[02:48:51] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[02:48:51] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[02:48:51] [PASSED] drm_test_check_broadcast_rgb_value
[02:48:51] [PASSED] drm_test_check_bpc_8_value
[02:48:51] [PASSED] drm_test_check_bpc_10_value
[02:48:51] [PASSED] drm_test_check_bpc_12_value
[02:48:51] [PASSED] drm_test_check_format_value
[02:48:51] [PASSED] drm_test_check_tmds_char_value
[02:48:51] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[02:48:51] ================= drm_managed (2 subtests) =================
[02:48:51] [PASSED] drm_test_managed_release_action
[02:48:51] [PASSED] drm_test_managed_run_action
[02:48:51] =================== [PASSED] drm_managed ===================
[02:48:51] =================== drm_mm (6 subtests) ====================
[02:48:51] [PASSED] drm_test_mm_init
[02:48:51] [PASSED] drm_test_mm_debug
[02:48:51] [PASSED] drm_test_mm_align32
[02:48:51] [PASSED] drm_test_mm_align64
[02:48:51] [PASSED] drm_test_mm_lowest
[02:48:51] [PASSED] drm_test_mm_highest
[02:48:51] ===================== [PASSED] drm_mm ======================
[02:48:51] ============= drm_modes_analog_tv (4 subtests) =============
[02:48:51] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[02:48:51] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[02:48:51] [PASSED] drm_test_modes_analog_tv_pal_576i
[02:48:51] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[02:48:51] =============== [PASSED] drm_modes_analog_tv ===============
[02:48:51] ============== drm_plane_helper (2 subtests) ===============
[02:48:51] =============== drm_test_check_plane_state  ================
[02:48:51] [PASSED] clipping_simple
[02:48:51] [PASSED] clipping_rotate_reflect
[02:48:51] [PASSED] positioning_simple
[02:48:51] [PASSED] upscaling
[02:48:51] [PASSED] downscaling
[02:48:51] [PASSED] rounding1
[02:48:51] [PASSED] rounding2
[02:48:51] [PASSED] rounding3
[02:48:51] [PASSED] rounding4
[02:48:51] =========== [PASSED] drm_test_check_plane_state ============
[02:48:51] =========== drm_test_check_invalid_plane_state  ============
[02:48:51] [PASSED] positioning_invalid
[02:48:51] [PASSED] upscaling_invalid
[02:48:51] [PASSED] downscaling_invalid
[02:48:51] ======= [PASSED] drm_test_check_invalid_plane_state ========
[02:48:51] ================ [PASSED] drm_plane_helper =================
stty: 'standard input': Inappropriate ioctl for device
[02:48:51] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[02:48:51] ====== drm_test_connector_helper_tv_get_modes_check  =======
[02:48:51] [PASSED] None
[02:48:51] [PASSED] PAL
[02:48:51] [PASSED] NTSC
[02:48:51] [PASSED] Both, NTSC Default
[02:48:51] [PASSED] Both, PAL Default
[02:48:51] [PASSED] Both, NTSC Default, with PAL on command-line
[02:48:51] [PASSED] Both, PAL Default, with NTSC on command-line
[02:48:51] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[02:48:51] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[02:48:51] ================== drm_rect (9 subtests) ===================
[02:48:51] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[02:48:51] [PASSED] drm_test_rect_clip_scaled_not_clipped
[02:48:51] [PASSED] drm_test_rect_clip_scaled_clipped
[02:48:51] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[02:48:51] ================= drm_test_rect_intersect  =================
[02:48:51] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[02:48:51] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[02:48:51] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[02:48:51] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[02:48:51] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[02:48:51] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[02:48:51] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[02:48:51] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[02:48:51] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[02:48:51] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[02:48:51] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[02:48:51] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[02:48:51] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[02:48:51] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[02:48:51] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[02:48:51] ============= [PASSED] drm_test_rect_intersect =============
[02:48:51] ================ drm_test_rect_calc_hscale  ================
[02:48:51] [PASSED] normal use
[02:48:51] [PASSED] out of max range
[02:48:51] [PASSED] out of min range
[02:48:51] [PASSED] zero dst
[02:48:51] [PASSED] negative src
[02:48:51] [PASSED] negative dst
[02:48:51] ============ [PASSED] drm_test_rect_calc_hscale ============
[02:48:51] ================ drm_test_rect_calc_vscale  ================
[02:48:51] [PASSED] normal use
[02:48:51] [PASSED] out of max range
[02:48:51] [PASSED] out of min range
[02:48:51] [PASSED] zero dst
[02:48:51] [PASSED] negative src
[02:48:51] [PASSED] negative dst
[02:48:51] ============ [PASSED] drm_test_rect_calc_vscale ============
[02:48:51] ================== drm_test_rect_rotate  ===================
[02:48:51] [PASSED] reflect-x
[02:48:51] [PASSED] reflect-y
[02:48:51] [PASSED] rotate-0
[02:48:51] [PASSED] rotate-90
[02:48:51] [PASSED] rotate-180
[02:48:51] [PASSED] rotate-270
[02:48:51] ============== [PASSED] drm_test_rect_rotate ===============
[02:48:51] ================ drm_test_rect_rotate_inv  =================
[02:48:51] [PASSED] reflect-x
[02:48:51] [PASSED] reflect-y
[02:48:51] [PASSED] rotate-0
[02:48:51] [PASSED] rotate-90
[02:48:51] [PASSED] rotate-180
[02:48:51] [PASSED] rotate-270
[02:48:51] ============ [PASSED] drm_test_rect_rotate_inv =============
[02:48:51] ==================== [PASSED] drm_rect =====================
[02:48:51] ============================================================
[02:48:51] Testing complete. Ran 511 tests: passed: 511
[02:48:52] Elapsed time: 23.395s total, 1.743s configuring, 21.454s building, 0.145s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[02:48:52] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:48:53] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[02:49:02] Starting KUnit Kernel (1/1)...
[02:49:02] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[02:49:02] ================= ttm_device (5 subtests) ==================
[02:49:02] [PASSED] ttm_device_init_basic
[02:49:02] [PASSED] ttm_device_init_multiple
[02:49:02] [PASSED] ttm_device_fini_basic
[02:49:02] [PASSED] ttm_device_init_no_vma_man
[02:49:02] ================== ttm_device_init_pools  ==================
[02:49:02] [PASSED] No DMA allocations, no DMA32 required
[02:49:02] [PASSED] DMA allocations, DMA32 required
[02:49:02] [PASSED] No DMA allocations, DMA32 required
[02:49:02] [PASSED] DMA allocations, no DMA32 required
[02:49:02] ============== [PASSED] ttm_device_init_pools ==============
[02:49:02] =================== [PASSED] ttm_device ====================
[02:49:02] ================== ttm_pool (8 subtests) ===================
[02:49:02] ================== ttm_pool_alloc_basic  ===================
[02:49:02] [PASSED] One page
[02:49:02] [PASSED] More than one page
[02:49:02] [PASSED] Above the allocation limit
[02:49:02] [PASSED] One page, with coherent DMA mappings enabled
[02:49:02] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[02:49:02] ============== [PASSED] ttm_pool_alloc_basic ===============
[02:49:02] ============== ttm_pool_alloc_basic_dma_addr  ==============
[02:49:02] [PASSED] One page
[02:49:02] [PASSED] More than one page
[02:49:02] [PASSED] Above the allocation limit
[02:49:02] [PASSED] One page, with coherent DMA mappings enabled
[02:49:02] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[02:49:02] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[02:49:02] [PASSED] ttm_pool_alloc_order_caching_match
[02:49:02] [PASSED] ttm_pool_alloc_caching_mismatch
[02:49:02] [PASSED] ttm_pool_alloc_order_mismatch
[02:49:02] [PASSED] ttm_pool_free_dma_alloc
[02:49:02] [PASSED] ttm_pool_free_no_dma_alloc
[02:49:02] [PASSED] ttm_pool_fini_basic
[02:49:02] ==================== [PASSED] ttm_pool =====================
[02:49:02] ================ ttm_resource (8 subtests) =================
[02:49:02] ================= ttm_resource_init_basic  =================
[02:49:02] [PASSED] Init resource in TTM_PL_SYSTEM
[02:49:02] [PASSED] Init resource in TTM_PL_VRAM
[02:49:02] [PASSED] Init resource in a private placement
[02:49:02] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[02:49:02] ============= [PASSED] ttm_resource_init_basic =============
[02:49:02] [PASSED] ttm_resource_init_pinned
[02:49:02] [PASSED] ttm_resource_fini_basic
[02:49:02] [PASSED] ttm_resource_manager_init_basic
[02:49:02] [PASSED] ttm_resource_manager_usage_basic
[02:49:02] [PASSED] ttm_resource_manager_set_used_basic
[02:49:02] [PASSED] ttm_sys_man_alloc_basic
[02:49:02] [PASSED] ttm_sys_man_free_basic
[02:49:02] ================== [PASSED] ttm_resource ===================
[02:49:02] =================== ttm_tt (15 subtests) ===================
[02:49:02] ==================== ttm_tt_init_basic  ====================
[02:49:02] [PASSED] Page-aligned size
[02:49:02] [PASSED] Extra pages requested
[02:49:02] ================ [PASSED] ttm_tt_init_basic ================
[02:49:02] [PASSED] ttm_tt_init_misaligned
[02:49:02] [PASSED] ttm_tt_fini_basic
[02:49:02] [PASSED] ttm_tt_fini_sg
[02:49:02] [PASSED] ttm_tt_fini_shmem
[02:49:02] [PASSED] ttm_tt_create_basic
[02:49:02] [PASSED] ttm_tt_create_invalid_bo_type
[02:49:02] [PASSED] ttm_tt_create_ttm_exists
[02:49:02] [PASSED] ttm_tt_create_failed
[02:49:02] [PASSED] ttm_tt_destroy_basic
[02:49:02] [PASSED] ttm_tt_populate_null_ttm
[02:49:02] [PASSED] ttm_tt_populate_populated_ttm
[02:49:02] [PASSED] ttm_tt_unpopulate_basic
[02:49:02] [PASSED] ttm_tt_unpopulate_empty_ttm
[02:49:02] [PASSED] ttm_tt_swapin_basic
[02:49:02] ===================== [PASSED] ttm_tt ======================
[02:49:02] =================== ttm_bo (14 subtests) ===================
[02:49:02] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[02:49:02] [PASSED] Cannot be interrupted and sleeps
[02:49:02] [PASSED] Cannot be interrupted, locks straight away
[02:49:02] [PASSED] Can be interrupted, sleeps
[02:49:02] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[02:49:02] [PASSED] ttm_bo_reserve_locked_no_sleep
[02:49:02] [PASSED] ttm_bo_reserve_no_wait_ticket
[02:49:03] [PASSED] ttm_bo_reserve_double_resv
[02:49:03] [PASSED] ttm_bo_reserve_interrupted
[02:49:03] [PASSED] ttm_bo_reserve_deadlock
[02:49:03] [PASSED] ttm_bo_unreserve_basic
[02:49:03] [PASSED] ttm_bo_unreserve_pinned
[02:49:03] [PASSED] ttm_bo_unreserve_bulk
[02:49:03] [PASSED] ttm_bo_put_basic
[02:49:03] [PASSED] ttm_bo_put_shared_resv
[02:49:03] [PASSED] ttm_bo_pin_basic
[02:49:03] [PASSED] ttm_bo_pin_unpin_resource
[02:49:03] [PASSED] ttm_bo_multiple_pin_one_unpin
[02:49:03] ===================== [PASSED] ttm_bo ======================
[02:49:03] ============== ttm_bo_validate (22 subtests) ===============
[02:49:03] ============== ttm_bo_init_reserved_sys_man  ===============
[02:49:03] [PASSED] Buffer object for userspace
[02:49:03] [PASSED] Kernel buffer object
[02:49:03] [PASSED] Shared buffer object
[02:49:03] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[02:49:03] ============== ttm_bo_init_reserved_mock_man  ==============
[02:49:03] [PASSED] Buffer object for userspace
[02:49:03] [PASSED] Kernel buffer object
[02:49:03] [PASSED] Shared buffer object
[02:49:03] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[02:49:03] [PASSED] ttm_bo_init_reserved_resv
[02:49:03] ================== ttm_bo_validate_basic  ==================
[02:49:03] [PASSED] Buffer object for userspace
[02:49:03] [PASSED] Kernel buffer object
[02:49:03] [PASSED] Shared buffer object
[02:49:03] ============== [PASSED] ttm_bo_validate_basic ==============
[02:49:03] [PASSED] ttm_bo_validate_invalid_placement
[02:49:03] ============= ttm_bo_validate_same_placement  ==============
[02:49:03] [PASSED] System manager
[02:49:03] [PASSED] VRAM manager
[02:49:03] ========= [PASSED] ttm_bo_validate_same_placement ==========
[02:49:03] [PASSED] ttm_bo_validate_failed_alloc
[02:49:03] [PASSED] ttm_bo_validate_pinned
[02:49:03] [PASSED] ttm_bo_validate_busy_placement
[02:49:03] ================ ttm_bo_validate_multihop  =================
[02:49:03] [PASSED] Buffer object for userspace
[02:49:03] [PASSED] Kernel buffer object
[02:49:03] [PASSED] Shared buffer object
[02:49:03] ============ [PASSED] ttm_bo_validate_multihop =============
[02:49:03] ========== ttm_bo_validate_no_placement_signaled  ==========
[02:49:03] [PASSED] Buffer object in system domain, no page vector
[02:49:03] [PASSED] Buffer object in system domain with an existing page vector
[02:49:03] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[02:49:03] ======== ttm_bo_validate_no_placement_not_signaled  ========
[02:49:03] [PASSED] Buffer object for userspace
[02:49:03] [PASSED] Kernel buffer object
[02:49:03] [PASSED] Shared buffer object
[02:49:03] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[02:49:03] [PASSED] ttm_bo_validate_move_fence_signaled
[02:49:03] ========= ttm_bo_validate_move_fence_not_signaled  =========
[02:49:03] [PASSED] Waits for GPU
[02:49:03] [PASSED] Tries to lock straight away
[02:49:03] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[02:49:03] [PASSED] ttm_bo_validate_swapout
[02:49:03] [PASSED] ttm_bo_validate_happy_evict
[02:49:03] [PASSED] ttm_bo_validate_all_pinned_evict
[02:49:03] [PASSED] ttm_bo_validate_allowed_only_evict
[02:49:03] [PASSED] ttm_bo_validate_deleted_evict
[02:49:03] [PASSED] ttm_bo_validate_busy_domain_evict
[02:49:03] [PASSED] ttm_bo_validate_evict_gutting
[02:49:03] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[02:49:03] ================= [PASSED] ttm_bo_validate =================
[02:49:03] ============================================================
[02:49:03] Testing complete. Ran 102 tests: passed: 102
[02:49:03] Elapsed time: 11.380s total, 1.720s configuring, 8.989s building, 0.583s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


