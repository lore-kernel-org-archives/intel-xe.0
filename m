Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AC5C27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 04:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43E010EC1D;
	Fri, 14 Jun 2024 04:32:34 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF73110EC1D;
 Fri, 14 Jun 2024 04:32:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_CMRR_patch_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Jun 2024 04:32:32 -0000
Message-ID: <171833955270.77190.16163488171617783363@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614042558.376983-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20240614042558.376983-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: CMRR patch fixes
URL   : https://patchwork.freedesktop.org/series/134864/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[04:31:24] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:31:28] Building KUnit Kernel ...
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

[04:31:53] Starting KUnit Kernel (1/1)...
[04:31:53] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[04:31:54] =================== guc_dbm (7 subtests) ===================
[04:31:54] [PASSED] test_empty
[04:31:54] [PASSED] test_default
[04:31:54] ======================== test_size  ========================
[04:31:54] [PASSED] 4
[04:31:54] [PASSED] 8
[04:31:54] [PASSED] 32
[04:31:54] [PASSED] 256
[04:31:54] ==================== [PASSED] test_size ====================
[04:31:54] ======================= test_reuse  ========================
[04:31:54] [PASSED] 4
[04:31:54] [PASSED] 8
[04:31:54] [PASSED] 32
[04:31:54] [PASSED] 256
[04:31:54] =================== [PASSED] test_reuse ====================
[04:31:54] =================== test_range_overlap  ====================
[04:31:54] [PASSED] 4
[04:31:54] [PASSED] 8
[04:31:54] [PASSED] 32
[04:31:54] [PASSED] 256
[04:31:54] =============== [PASSED] test_range_overlap ================
[04:31:54] =================== test_range_compact  ====================
[04:31:54] [PASSED] 4
[04:31:54] [PASSED] 8
[04:31:54] [PASSED] 32
[04:31:54] [PASSED] 256
[04:31:54] =============== [PASSED] test_range_compact ================
[04:31:54] ==================== test_range_spare  =====================
[04:31:54] [PASSED] 4
[04:31:54] [PASSED] 8
[04:31:54] [PASSED] 32
[04:31:54] [PASSED] 256
[04:31:54] ================ [PASSED] test_range_spare =================
[04:31:54] ===================== [PASSED] guc_dbm =====================
[04:31:54] =================== guc_idm (6 subtests) ===================
[04:31:54] [PASSED] bad_init
[04:31:54] [PASSED] no_init
[04:31:54] [PASSED] init_fini
[04:31:54] [PASSED] check_used
[04:31:54] [PASSED] check_quota
[04:31:54] [PASSED] check_all
[04:31:54] ===================== [PASSED] guc_idm =====================
[04:31:54] ================== no_relay (3 subtests) ===================
[04:31:54] [PASSED] xe_drops_guc2pf_if_not_ready
[04:31:54] [PASSED] xe_drops_guc2vf_if_not_ready
[04:31:54] [PASSED] xe_rejects_send_if_not_ready
[04:31:54] ==================== [PASSED] no_relay =====================
[04:31:54] ================== pf_relay (14 subtests) ==================
[04:31:54] [PASSED] pf_rejects_guc2pf_too_short
[04:31:54] [PASSED] pf_rejects_guc2pf_too_long
[04:31:54] [PASSED] pf_rejects_guc2pf_no_payload
[04:31:54] [PASSED] pf_fails_no_payload
[04:31:54] [PASSED] pf_fails_bad_origin
[04:31:54] [PASSED] pf_fails_bad_type
[04:31:54] [PASSED] pf_txn_reports_error
[04:31:54] [PASSED] pf_txn_sends_pf2guc
[04:31:54] [PASSED] pf_sends_pf2guc
[04:31:54] [SKIPPED] pf_loopback_nop
[04:31:54] [SKIPPED] pf_loopback_echo
[04:31:54] [SKIPPED] pf_loopback_fail
[04:31:54] [SKIPPED] pf_loopback_busy
[04:31:54] [SKIPPED] pf_loopback_retry
[04:31:54] ==================== [PASSED] pf_relay =====================
[04:31:54] ================== vf_relay (3 subtests) ===================
[04:31:54] [PASSED] vf_rejects_guc2vf_too_short
[04:31:54] [PASSED] vf_rejects_guc2vf_too_long
[04:31:54] [PASSED] vf_rejects_guc2vf_no_payload
[04:31:54] ==================== [PASSED] vf_relay =====================
[04:31:54] ================= pf_service (11 subtests) =================
[04:31:54] [PASSED] pf_negotiate_any
[04:31:54] [PASSED] pf_negotiate_base_match
[04:31:54] [PASSED] pf_negotiate_base_newer
[04:31:54] [PASSED] pf_negotiate_base_next
[04:31:54] [SKIPPED] pf_negotiate_base_older
[04:31:54] [PASSED] pf_negotiate_base_prev
[04:31:54] [PASSED] pf_negotiate_latest_match
[04:31:54] [PASSED] pf_negotiate_latest_newer
[04:31:54] [PASSED] pf_negotiate_latest_next
[04:31:54] [SKIPPED] pf_negotiate_latest_older
[04:31:54] [SKIPPED] pf_negotiate_latest_prev
[04:31:54] =================== [PASSED] pf_service ====================
[04:31:54] ===================== lmtt (1 subtest) =====================
[04:31:54] ======================== test_ops  =========================
[04:31:54] [PASSED] 2-level
[04:31:54] [PASSED] multi-level
[04:31:54] ==================== [PASSED] test_ops =====================
[04:31:54] ====================== [PASSED] lmtt =======================
[04:31:54] ==================== xe_bo (2 subtests) ====================
[04:31:54] [SKIPPED] xe_ccs_migrate_kunit
[04:31:54] [SKIPPED] xe_bo_evict_kunit
[04:31:54] ===================== [SKIPPED] xe_bo ======================
[04:31:54] ================== xe_dma_buf (1 subtest) ==================
[04:31:54] [SKIPPED] xe_dma_buf_kunit
[04:31:54] =================== [SKIPPED] xe_dma_buf ===================
[04:31:54] ================== xe_migrate (1 subtest) ==================
[04:31:54] [SKIPPED] xe_migrate_sanity_kunit
[04:31:54] =================== [SKIPPED] xe_migrate ===================
[04:31:54] =================== xe_mocs (2 subtests) ===================
[04:31:54] [SKIPPED] xe_live_mocs_kernel_kunit
[04:31:54] [SKIPPED] xe_live_mocs_reset_kunit
[04:31:54] ==================== [SKIPPED] xe_mocs =====================
[04:31:54] ==================== args (11 subtests) ====================
[04:31:54] [PASSED] count_args_test
[04:31:54] [PASSED] call_args_example
[04:31:54] [PASSED] call_args_test
[04:31:54] [PASSED] drop_first_arg_example
[04:31:54] [PASSED] drop_first_arg_test
[04:31:54] [PASSED] first_arg_example
[04:31:54] [PASSED] first_arg_test
[04:31:54] [PASSED] last_arg_example
[04:31:54] [PASSED] last_arg_test
[04:31:54] [PASSED] pick_arg_example
[04:31:54] [PASSED] sep_comma_example
[04:31:54] ====================== [PASSED] args =======================
[04:31:54] =================== xe_pci (2 subtests) ====================
[04:31:54] [PASSED] xe_gmdid_graphics_ip
[04:31:54] [PASSED] xe_gmdid_media_ip
[04:31:54] ===================== [PASSED] xe_pci ======================
[04:31:54] ==================== xe_rtp (1 subtest) ====================
[04:31:54] ================== xe_rtp_process_tests  ===================
[04:31:54] [PASSED] coalesce-same-reg
[04:31:54] [PASSED] no-match-no-add
[04:31:54] [PASSED] no-match-no-add-multiple-rules
[04:31:54] [PASSED] two-regs-two-entries
[04:31:54] [PASSED] clr-one-set-other
[04:31:54] [PASSED] set-field
[04:31:54] [PASSED] conflict-duplicate
[04:31:54] [PASSED] conflict-not-disjoint
[04:31:54] [PASSED] conflict-reg-type
[04:31:54] ============== [PASSED] xe_rtp_process_tests ===============
stty: 'standard input': Inappropriate ioctl for device
[04:31:54] ===================== [PASSED] xe_rtp ======================
[04:31:54] ==================== xe_wa (1 subtest) =====================
[04:31:54] ======================== xe_wa_gt  =========================
[04:31:54] [PASSED] TIGERLAKE (B0)
[04:31:54] [PASSED] DG1 (A0)
[04:31:54] [PASSED] DG1 (B0)
[04:31:54] [PASSED] ALDERLAKE_S (A0)
[04:31:54] [PASSED] ALDERLAKE_S (B0)
[04:31:54] [PASSED] ALDERLAKE_S (C0)
[04:31:54] [PASSED] ALDERLAKE_S (D0)
[04:31:54] [PASSED] ALDERLAKE_P (A0)
[04:31:54] [PASSED] ALDERLAKE_P (B0)
[04:31:54] [PASSED] ALDERLAKE_P (C0)
[04:31:54] [PASSED] ALDERLAKE_S_RPLS (D0)
[04:31:54] [PASSED] ALDERLAKE_P_RPLU (E0)
[04:31:54] [PASSED] DG2_G10 (C0)
[04:31:54] [PASSED] DG2_G11 (B1)
[04:31:54] [PASSED] DG2_G12 (A1)
[04:31:54] [PASSED] METEORLAKE (g:A0, m:A0)
[04:31:54] [PASSED] METEORLAKE (g:A0, m:A0)
[04:31:54] [PASSED] METEORLAKE (g:A0, m:A0)
[04:31:54] [PASSED] LUNARLAKE (g:A0, m:A0)
[04:31:54] [PASSED] LUNARLAKE (g:B0, m:A0)
[04:31:54] ==================== [PASSED] xe_wa_gt =====================
[04:31:54] ====================== [PASSED] xe_wa ======================
[04:31:54] ============================================================
[04:31:54] Testing complete. Ran 109 tests: passed: 95, skipped: 14
[04:31:54] Elapsed time: 29.925s total, 4.276s configuring, 25.328s building, 0.290s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[04:31:54] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:31:56] Building KUnit Kernel ...
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

[04:32:17] Starting KUnit Kernel (1/1)...
[04:32:17] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[04:32:17] ============ drm_test_pick_cmdline (2 subtests) ============
[04:32:17] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[04:32:17] =============== drm_test_pick_cmdline_named  ===============
[04:32:17] [PASSED] NTSC
[04:32:17] [PASSED] NTSC-J
[04:32:17] [PASSED] PAL
[04:32:17] [PASSED] PAL-M
[04:32:17] =========== [PASSED] drm_test_pick_cmdline_named ===========
[04:32:17] ============== [PASSED] drm_test_pick_cmdline ==============
[04:32:17] ================== drm_buddy (7 subtests) ==================
[04:32:17] [PASSED] drm_test_buddy_alloc_limit
[04:32:17] [PASSED] drm_test_buddy_alloc_optimistic
[04:32:17] [PASSED] drm_test_buddy_alloc_pessimistic
[04:32:17] [PASSED] drm_test_buddy_alloc_pathological
[04:32:17] [PASSED] drm_test_buddy_alloc_contiguous
[04:32:17] [PASSED] drm_test_buddy_alloc_clear
[04:32:17] [PASSED] drm_test_buddy_alloc_range_bias
[04:32:17] ==================== [PASSED] drm_buddy ====================
[04:32:17] ============= drm_cmdline_parser (40 subtests) =============
[04:32:17] [PASSED] drm_test_cmdline_force_d_only
[04:32:17] [PASSED] drm_test_cmdline_force_D_only_dvi
[04:32:17] [PASSED] drm_test_cmdline_force_D_only_hdmi
[04:32:17] [PASSED] drm_test_cmdline_force_D_only_not_digital
[04:32:17] [PASSED] drm_test_cmdline_force_e_only
[04:32:17] [PASSED] drm_test_cmdline_res
[04:32:17] [PASSED] drm_test_cmdline_res_vesa
[04:32:17] [PASSED] drm_test_cmdline_res_vesa_rblank
[04:32:17] [PASSED] drm_test_cmdline_res_rblank
[04:32:17] [PASSED] drm_test_cmdline_res_bpp
[04:32:17] [PASSED] drm_test_cmdline_res_refresh
[04:32:17] [PASSED] drm_test_cmdline_res_bpp_refresh
[04:32:17] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[04:32:17] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[04:32:17] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[04:32:17] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[04:32:17] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[04:32:17] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[04:32:17] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[04:32:17] [PASSED] drm_test_cmdline_res_margins_force_on
[04:32:17] [PASSED] drm_test_cmdline_res_vesa_margins
[04:32:17] [PASSED] drm_test_cmdline_name
[04:32:17] [PASSED] drm_test_cmdline_name_bpp
[04:32:17] [PASSED] drm_test_cmdline_name_option
[04:32:17] [PASSED] drm_test_cmdline_name_bpp_option
[04:32:17] [PASSED] drm_test_cmdline_rotate_0
[04:32:17] [PASSED] drm_test_cmdline_rotate_90
[04:32:17] [PASSED] drm_test_cmdline_rotate_180
[04:32:17] [PASSED] drm_test_cmdline_rotate_270
[04:32:17] [PASSED] drm_test_cmdline_hmirror
[04:32:17] [PASSED] drm_test_cmdline_vmirror
[04:32:17] [PASSED] drm_test_cmdline_margin_options
[04:32:17] [PASSED] drm_test_cmdline_multiple_options
[04:32:17] [PASSED] drm_test_cmdline_bpp_extra_and_option
[04:32:17] [PASSED] drm_test_cmdline_extra_and_option
[04:32:17] [PASSED] drm_test_cmdline_freestanding_options
[04:32:17] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[04:32:17] [PASSED] drm_test_cmdline_panel_orientation
[04:32:17] ================ drm_test_cmdline_invalid  =================
[04:32:17] [PASSED] margin_only
[04:32:17] [PASSED] interlace_only
[04:32:17] [PASSED] res_missing_x
[04:32:17] [PASSED] res_missing_y
[04:32:17] [PASSED] res_bad_y
[04:32:17] [PASSED] res_missing_y_bpp
[04:32:17] [PASSED] res_bad_bpp
[04:32:17] [PASSED] res_bad_refresh
[04:32:17] [PASSED] res_bpp_refresh_force_on_off
[04:32:17] [PASSED] res_invalid_mode
[04:32:17] [PASSED] res_bpp_wrong_place_mode
[04:32:17] [PASSED] name_bpp_refresh
[04:32:17] [PASSED] name_refresh
[04:32:17] [PASSED] name_refresh_wrong_mode
[04:32:17] [PASSED] name_refresh_invalid_mode
[04:32:17] [PASSED] rotate_multiple
[04:32:17] [PASSED] rotate_invalid_val
[04:32:17] [PASSED] rotate_truncated
[04:32:17] [PASSED] invalid_option
[04:32:17] [PASSED] invalid_tv_option
[04:32:17] [PASSED] truncated_tv_option
[04:32:17] ============ [PASSED] drm_test_cmdline_invalid =============
[04:32:17] =============== drm_test_cmdline_tv_options  ===============
[04:32:17] [PASSED] NTSC
[04:32:17] [PASSED] NTSC_443
[04:32:17] [PASSED] NTSC_J
[04:32:17] [PASSED] PAL
[04:32:17] [PASSED] PAL_M
[04:32:17] [PASSED] PAL_N
[04:32:17] [PASSED] SECAM
[04:32:17] =========== [PASSED] drm_test_cmdline_tv_options ===========
[04:32:17] =============== [PASSED] drm_cmdline_parser ================
[04:32:17] ========== drmm_connector_hdmi_init (19 subtests) ==========
[04:32:17] [PASSED] drm_test_connector_hdmi_init_valid
[04:32:17] [PASSED] drm_test_connector_hdmi_init_bpc_8
[04:32:17] [PASSED] drm_test_connector_hdmi_init_bpc_10
[04:32:17] [PASSED] drm_test_connector_hdmi_init_bpc_12
[04:32:17] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[04:32:17] [PASSED] drm_test_connector_hdmi_init_bpc_null
[04:32:17] [PASSED] drm_test_connector_hdmi_init_formats_empty
[04:32:17] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[04:32:17] [PASSED] drm_test_connector_hdmi_init_null_ddc
[04:32:17] [PASSED] drm_test_connector_hdmi_init_null_product
[04:32:17] [PASSED] drm_test_connector_hdmi_init_null_vendor
[04:32:17] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[04:32:17] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[04:32:17] [PASSED] drm_test_connector_hdmi_init_product_valid
[04:32:17] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[04:32:17] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[04:32:17] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[04:32:17] ========= drm_test_connector_hdmi_init_type_valid  =========
[04:32:17] [PASSED] HDMI-A
[04:32:17] [PASSED] HDMI-B
[04:32:17] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[04:32:17] ======== drm_test_connector_hdmi_init_type_invalid  ========
[04:32:17] [PASSED] Unknown
[04:32:17] [PASSED] VGA
[04:32:17] [PASSED] DVI-I
[04:32:17] [PASSED] DVI-D
[04:32:17] [PASSED] DVI-A
[04:32:17] [PASSED] Composite
[04:32:17] [PASSED] SVIDEO
[04:32:17] [PASSED] LVDS
[04:32:17] [PASSED] Component
[04:32:17] [PASSED] DIN
[04:32:17] [PASSED] DP
[04:32:17] [PASSED] TV
[04:32:17] [PASSED] eDP
[04:32:17] [PASSED] Virtual
[04:32:17] [PASSED] DSI
[04:32:17] [PASSED] DPI
[04:32:17] [PASSED] Writeback
[04:32:17] [PASSED] SPI
[04:32:17] [PASSED] USB
[04:32:17] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[04:32:17] ============ [PASSED] drmm_connector_hdmi_init =============
[04:32:17] ============= drmm_connector_init (3 subtests) =============
[04:32:17] [PASSED] drm_test_drmm_connector_init
[04:32:17] [PASSED] drm_test_drmm_connector_init_null_ddc
[04:32:17] ========= drm_test_drmm_connector_init_type_valid  =========
[04:32:17] [PASSED] Unknown
[04:32:17] [PASSED] VGA
[04:32:17] [PASSED] DVI-I
[04:32:17] [PASSED] DVI-D
[04:32:17] [PASSED] DVI-A
[04:32:17] [PASSED] Composite
[04:32:17] [PASSED] SVIDEO
[04:32:17] [PASSED] LVDS
[04:32:17] [PASSED] Component
[04:32:17] [PASSED] DIN
[04:32:17] [PASSED] DP
[04:32:17] [PASSED] HDMI-A
[04:32:17] [PASSED] HDMI-B
[04:32:17] [PASSED] TV
[04:32:17] [PASSED] eDP
[04:32:17] [PASSED] Virtual
[04:32:17] [PASSED] DSI
[04:32:17] [PASSED] DPI
[04:32:17] [PASSED] Writeback
[04:32:17] [PASSED] SPI
[04:32:17] [PASSED] USB
[04:32:17] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[04:32:17] =============== [PASSED] drmm_connector_init ===============
[04:32:17] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[04:32:17] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[04:32:17] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[04:32:17] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[04:32:17] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[04:32:17] ========== drm_test_get_tv_mode_from_name_valid  ===========
[04:32:17] [PASSED] NTSC
[04:32:17] [PASSED] NTSC-443
[04:32:17] [PASSED] NTSC-J
[04:32:17] [PASSED] PAL
[04:32:17] [PASSED] PAL-M
[04:32:17] [PASSED] PAL-N
[04:32:17] [PASSED] SECAM
[04:32:17] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[04:32:17] [PASSED] drm_test_get_tv_mode_from_name_truncated
[04:32:17] ============ [PASSED] drm_get_tv_mode_from_name ============
[04:32:17] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[04:32:17] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[04:32:17] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[04:32:17] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[04:32:17] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[04:32:17] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[04:32:17] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[04:32:17] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[04:32:17] [PASSED] VIC 96
[04:32:17] [PASSED] VIC 97
[04:32:17] [PASSED] VIC 101
[04:32:17] [PASSED] VIC 102
[04:32:17] [PASSED] VIC 106
[04:32:17] [PASSED] VIC 107
[04:32:17] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[04:32:17] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[04:32:17] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[04:32:17] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[04:32:17] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[04:32:17] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[04:32:17] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[04:32:17] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[04:32:17] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[04:32:17] [PASSED] Automatic
[04:32:17] [PASSED] Full
[04:32:17] [PASSED] Limited 16:235
[04:32:17] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[04:32:17] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[04:32:17] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[04:32:17] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[04:32:17] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[04:32:17] [PASSED] RGB
[04:32:17] [PASSED] YUV 4:2:0
[04:32:17] [PASSED] YUV 4:2:2
[04:32:17] [PASSED] YUV 4:4:4
[04:32:17] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[04:32:17] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[04:32:17] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[04:32:17] ============= drm_damage_helper (21 subtests) ==============
[04:32:17] [PASSED] drm_test_damage_iter_no_damage
[04:32:17] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[04:32:17] [PASSED] drm_test_damage_iter_no_damage_src_moved
[04:32:17] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[04:32:17] [PASSED] drm_test_damage_iter_no_damage_not_visible
[04:32:17] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[04:32:17] [PASSED] drm_test_damage_iter_no_damage_no_fb
[04:32:17] [PASSED] drm_test_damage_iter_simple_damage
[04:32:17] [PASSED] drm_test_damage_iter_single_damage
[04:32:17] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[04:32:17] [PASSED] drm_test_damage_iter_single_damage_outside_src
[04:32:17] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[04:32:17] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[04:32:17] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[04:32:17] [PASSED] drm_test_damage_iter_single_damage_src_moved
[04:32:17] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[04:32:17] [PASSED] drm_test_damage_iter_damage
[04:32:17] [PASSED] drm_test_damage_iter_damage_one_intersect
[04:32:17] [PASSED] drm_test_damage_iter_damage_one_outside
[04:32:17] [PASSED] drm_test_damage_iter_damage_src_moved
[04:32:17] [PASSED] drm_test_damage_iter_damage_not_visible
[04:32:17] ================ [PASSED] drm_damage_helper ================
[04:32:17] ============== drm_dp_mst_helper (3 subtests) ==============
[04:32:17] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[04:32:17] [PASSED] Clock 154000 BPP 30 DSC disabled
[04:32:17] [PASSED] Clock 234000 BPP 30 DSC disabled
[04:32:17] [PASSED] Clock 297000 BPP 24 DSC disabled
[04:32:17] [PASSED] Clock 332880 BPP 24 DSC enabled
[04:32:17] [PASSED] Clock 324540 BPP 24 DSC enabled
[04:32:17] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[04:32:17] ============== drm_test_dp_mst_calc_pbn_div  ===============
[04:32:17] [PASSED] Link rate 2000000 lane count 4
[04:32:17] [PASSED] Link rate 2000000 lane count 2
[04:32:17] [PASSED] Link rate 2000000 lane count 1
[04:32:17] [PASSED] Link rate 1350000 lane count 4
[04:32:17] [PASSED] Link rate 1350000 lane count 2
[04:32:17] [PASSED] Link rate 1350000 lane count 1
[04:32:17] [PASSED] Link rate 1000000 lane count 4
[04:32:17] [PASSED] Link rate 1000000 lane count 2
[04:32:17] [PASSED] Link rate 1000000 lane count 1
[04:32:17] [PASSED] Link rate 810000 lane count 4
[04:32:17] [PASSED] Link rate 810000 lane count 2
[04:32:17] [PASSED] Link rate 810000 lane count 1
[04:32:17] [PASSED] Link rate 540000 lane count 4
[04:32:17] [PASSED] Link rate 540000 lane count 2
[04:32:17] [PASSED] Link rate 540000 lane count 1
[04:32:17] [PASSED] Link rate 270000 lane count 4
[04:32:17] [PASSED] Link rate 270000 lane count 2
[04:32:17] [PASSED] Link rate 270000 lane count 1
[04:32:17] [PASSED] Link rate 162000 lane count 4
[04:32:17] [PASSED] Link rate 162000 lane count 2
[04:32:17] [PASSED] Link rate 162000 lane count 1
[04:32:17] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[04:32:17] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[04:32:17] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[04:32:17] [PASSED] DP_POWER_UP_PHY with port number
[04:32:17] [PASSED] DP_POWER_DOWN_PHY with port number
[04:32:17] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[04:32:17] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[04:32:17] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[04:32:17] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[04:32:17] [PASSED] DP_QUERY_PAYLOAD with port number
[04:32:17] [PASSED] DP_QUERY_PAYLOAD with VCPI
[04:32:17] [PASSED] DP_REMOTE_DPCD_READ with port number
[04:32:17] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[04:32:17] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[04:32:17] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[04:32:17] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[04:32:17] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[04:32:17] [PASSED] DP_REMOTE_I2C_READ with port number
[04:32:17] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[04:32:17] [PASSED] DP_REMOTE_I2C_READ with transactions array
[04:32:17] [PASSED] DP_REMOTE_I2C_WRITE with port number
[04:32:17] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[04:32:17] [PASSED] DP_REMOTE_I2C_WRITE with data array
[04:32:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[04:32:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[04:32:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[04:32:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[04:32:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[04:32:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[04:32:17] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[04:32:17] ================ [PASSED] drm_dp_mst_helper ================
[04:32:17] ================== drm_exec (7 subtests) ===================
[04:32:17] [PASSED] sanitycheck
[04:32:17] [PASSED] test_lock
[04:32:17] [PASSED] test_lock_unlock
[04:32:17] [PASSED] test_duplicates
[04:32:17] [PASSED] test_prepare
[04:32:17] [PASSED] test_prepare_array
[04:32:17] [PASSED] test_multiple_loops
[04:32:17] ==================== [PASSED] drm_exec =====================
[04:32:17] =========== drm_format_helper_test (17 subtests) ===========
[04:32:17] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[04:32:17] [PASSED] single_pixel_source_buffer
[04:32:17] [PASSED] single_pixel_clip_rectangle
[04:32:17] [PASSED] well_known_colors
[04:32:17] [PASSED] destination_pitch
[04:32:17] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[04:32:17] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[04:32:17] [PASSED] single_pixel_source_buffer
[04:32:17] [PASSED] single_pixel_clip_rectangle
[04:32:17] [PASSED] well_known_colors
[04:32:17] [PASSED] destination_pitch
[04:32:17] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[04:32:17] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[04:32:17] [PASSED] single_pixel_source_buffer
[04:32:17] [PASSED] single_pixel_clip_rectangle
[04:32:17] [PASSED] well_known_colors
[04:32:17] [PASSED] destination_pitch
[04:32:17] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[04:32:17] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[04:32:17] [PASSED] single_pixel_source_buffer
[04:32:17] [PASSED] single_pixel_clip_rectangle
[04:32:17] [PASSED] well_known_colors
[04:32:17] [PASSED] destination_pitch
[04:32:17] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[04:32:17] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[04:32:17] [PASSED] single_pixel_source_buffer
[04:32:17] [PASSED] single_pixel_clip_rectangle
[04:32:17] [PASSED] well_known_colors
[04:32:17] [PASSED] destination_pitch
[04:32:17] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[04:32:17] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[04:32:17] [PASSED] single_pixel_source_buffer
[04:32:17] [PASSED] single_pixel_clip_rectangle
[04:32:17] [PASSED] well_known_colors
[04:32:17] [PASSED] destination_pitch
[04:32:17] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[04:32:17] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[04:32:17] [PASSED] single_pixel_source_buffer
[04:32:17] [PASSED] single_pixel_clip_rectangle
[04:32:17] [PASSED] well_known_colors
[04:32:17] [PASSED] destination_pitch
[04:32:17] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[04:32:17] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[04:32:17] [PASSED] single_pixel_source_buffer
[04:32:17] [PASSED] single_pixel_clip_rectangle
[04:32:17] [PASSED] well_known_colors
[04:32:17] [PASSED] destination_pitch
[04:32:17] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[04:32:17] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[04:32:17] [PASSED] single_pixel_source_buffer
[04:32:17] [PASSED] single_pixel_clip_rectangle
[04:32:17] [PASSED] well_known_colors
[04:32:17] [PASSED] destination_pitch
[04:32:17] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[04:32:17] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[04:32:17] [PASSED] single_pixel_source_buffer
[04:32:17] [PASSED] single_pixel_clip_rectangle
[04:32:17] [PASSED] well_known_colors
[04:32:17] [PASSED] destination_pitch
[04:32:17] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[04:32:17] ============== drm_test_fb_xrgb8888_to_mono  ===============
[04:32:17] [PASSED] single_pixel_source_buffer
[04:32:17] [PASSED] single_pixel_clip_rectangle
[04:32:17] [PASSED] well_known_colors
[04:32:17] [PASSED] destination_pitch
[04:32:17] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[04:32:17] ==================== drm_test_fb_swab  =====================
[04:32:17] [PASSED] single_pixel_source_buffer
[04:32:17] [PASSED] single_pixel_clip_rectangle
[04:32:17] [PASSED] well_known_colors
[04:32:17] [PASSED] destination_pitch
[04:32:17] ================ [PASSED] drm_test_fb_swab =================
[04:32:17] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[04:32:17] [PASSED] single_pixel_source_buffer
[04:32:17] [PASSED] single_pixel_clip_rectangle
[04:32:17] [PASSED] well_known_colors
[04:32:17] [PASSED] destination_pitch
[04:32:17] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[04:32:17] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[04:32:17] [PASSED] single_pixel_source_buffer
[04:32:17] [PASSED] single_pixel_clip_rectangle
[04:32:17] [PASSED] well_known_colors
[04:32:17] [PASSED] destination_pitch
[04:32:17] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[04:32:17] ================= drm_test_fb_clip_offset  =================
[04:32:17] [PASSED] pass through
[04:32:17] [PASSED] horizontal offset
[04:32:17] [PASSED] vertical offset
[04:32:17] [PASSED] horizontal and vertical offset
[04:32:17] [PASSED] horizontal offset (custom pitch)
[04:32:17] [PASSED] vertical offset (custom pitch)
[04:32:17] [PASSED] horizontal and vertical offset (custom pitch)
[04:32:17] ============= [PASSED] drm_test_fb_clip_offset =============
[04:32:17] ============== drm_test_fb_build_fourcc_list  ==============
[04:32:17] [PASSED] no native formats
[04:32:17] [PASSED] XRGB8888 as native format
[04:32:17] [PASSED] remove duplicates
[04:32:17] [PASSED] convert alpha formats
[04:32:17] [PASSED] random formats
[04:32:17] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[04:32:17] =================== drm_test_fb_memcpy  ====================
[04:32:17] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[04:32:17] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[04:32:17] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[04:32:17] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[04:32:17] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[04:32:17] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[04:32:17] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[04:32:17] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[04:32:17] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[04:32:17] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[04:32:17] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[04:32:17] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[04:32:17] =============== [PASSED] drm_test_fb_memcpy ================
[04:32:17] ============= [PASSED] drm_format_helper_test ==============
[04:32:17] ================= drm_format (18 subtests) =================
[04:32:17] [PASSED] drm_test_format_block_width_invalid
[04:32:17] [PASSED] drm_test_format_block_width_one_plane
[04:32:17] [PASSED] drm_test_format_block_width_two_plane
[04:32:17] [PASSED] drm_test_format_block_width_three_plane
[04:32:17] [PASSED] drm_test_format_block_width_tiled
[04:32:17] [PASSED] drm_test_format_block_height_invalid
[04:32:17] [PASSED] drm_test_format_block_height_one_plane
[04:32:17] [PASSED] drm_test_format_block_height_two_plane
[04:32:17] [PASSED] drm_test_format_block_height_three_plane
[04:32:17] [PASSED] drm_test_format_block_height_tiled
[04:32:17] [PASSED] drm_test_format_min_pitch_invalid
[04:32:17] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[04:32:17] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[04:32:17] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[04:32:17] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[04:32:17] [PASSED] drm_test_format_min_pitch_two_plane
[04:32:17] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[04:32:17] [PASSED] drm_test_format_min_pitch_tiled
[04:32:17] =================== [PASSED] drm_format ====================
[04:32:17] =============== drm_framebuffer (1 subtest) ================
[04:32:17] =============== drm_test_framebuffer_create  ===============
[04:32:17] [PASSED] ABGR8888 normal sizes
[04:32:17] [PASSED] ABGR8888 max sizes
[04:32:17] [PASSED] ABGR8888 pitch greater than min required
[04:32:17] [PASSED] ABGR8888 pitch less than min required
[04:32:17] [PASSED] ABGR8888 Invalid width
[04:32:17] [PASSED] ABGR8888 Invalid buffer handle
[04:32:17] [PASSED] No pixel format
[04:32:17] [PASSED] ABGR8888 Width 0
[04:32:17] [PASSED] ABGR8888 Height 0
[04:32:17] [PASSED] ABGR8888 Out of bound height * pitch combination
[04:32:17] [PASSED] ABGR8888 Large buffer offset
[04:32:17] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[04:32:17] [PASSED] ABGR8888 Valid buffer modifier
[04:32:17] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[04:32:17] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[04:32:17] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[04:32:17] [PASSED] NV12 Normal sizes
[04:32:17] [PASSED] NV12 Max sizes
[04:32:17] [PASSED] NV12 Invalid pitch
[04:32:17] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[04:32:17] [PASSED] NV12 different  modifier per-plane
[04:32:17] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[04:32:17] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[04:32:17] [PASSED] NV12 Modifier for inexistent plane
[04:32:17] [PASSED] NV12 Handle for inexistent plane
[04:32:17] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[04:32:17] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[04:32:17] [PASSED] YVU420 Normal sizes
[04:32:17] [PASSED] YVU420 Max sizes
[04:32:17] [PASSED] YVU420 Invalid pitch
[04:32:17] [PASSED] YVU420 Different pitches
[04:32:17] [PASSED] YVU420 Different buffer offsets/pitches
[04:32:17] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[04:32:17] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[04:32:17] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[04:32:17] [PASSED] YVU420 Valid modifier
[04:32:17] [PASSED] YVU420 Different modifiers per plane
[04:32:17] [PASSED] YVU420 Modifier for inexistent plane
[04:32:17] [PASSED] X0L2 Normal sizes
[04:32:17] [PASSED] X0L2 Max sizes
[04:32:17] [PASSED] X0L2 Invalid pitch
[04:32:17] [PASSED] X0L2 Pitch greater than minimum required
[04:32:17] [PASSED] X0L2 Handle for inexistent plane
[04:32:17] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[04:32:17] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[04:32:17] [PASSED] X0L2 Valid modifier
[04:32:17] [PASSED] X0L2 Modifier for inexistent plane
[04:32:17] =========== [PASSED] drm_test_framebuffer_create ===========
[04:32:17] ================= [PASSED] drm_framebuffer =================
[04:32:17] ================ drm_gem_shmem (8 subtests) ================
[04:32:17] [PASSED] drm_gem_shmem_test_obj_create
[04:32:17] [PASSED] drm_gem_shmem_test_obj_create_private
[04:32:17] [PASSED] drm_gem_shmem_test_pin_pages
[04:32:17] [PASSED] drm_gem_shmem_test_vmap
[04:32:17] [PASSED] drm_gem_shmem_test_get_pages_sgt
[04:32:17] [PASSED] drm_gem_shmem_test_get_sg_table
[04:32:17] [PASSED] drm_gem_shmem_test_madvise
[04:32:17] [PASSED] drm_gem_shmem_test_purge
[04:32:17] ================== [PASSED] drm_gem_shmem ==================
[04:32:17] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[04:32:17] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[04:32:17] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[04:32:17] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[04:32:17] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[04:32:17] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[04:32:17] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[04:32:17] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[04:32:17] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[04:32:17] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[04:32:17] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[04:32:17] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[04:32:17] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[04:32:17] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[04:32:17] [PASSED] drm_test_check_output_bpc_dvi
[04:32:17] [PASSED] drm_test_check_output_bpc_format_vic_1
[04:32:17] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[04:32:17] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[04:32:17] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[04:32:17] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[04:32:17] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[04:32:17] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[04:32:17] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[04:32:17] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[04:32:17] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[04:32:17] [PASSED] drm_test_check_broadcast_rgb_value
[04:32:17] [PASSED] drm_test_check_bpc_8_value
[04:32:17] [PASSED] drm_test_check_bpc_10_value
[04:32:17] [PASSED] drm_test_check_bpc_12_value
[04:32:17] [PASSED] drm_test_check_format_value
[04:32:17] [PASSED] drm_test_check_tmds_char_value
[04:32:17] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[04:32:17] ================= drm_managed (2 subtests) =================
[04:32:17] [PASSED] drm_test_managed_release_action
[04:32:17] [PASSED] drm_test_managed_run_action
[04:32:17] =================== [PASSED] drm_managed ===================
[04:32:17] =================== drm_mm (6 subtests) ====================
[04:32:17] [PASSED] drm_test_mm_init
[04:32:17] [PASSED] drm_test_mm_debug
[04:32:17] [PASSED] drm_test_mm_align32
[04:32:17] [PASSED] drm_test_mm_align64
[04:32:17] [PASSED] drm_test_mm_lowest
[04:32:17] [PASSED] drm_test_mm_highest
[04:32:17] ===================== [PASSED] drm_mm ======================
[04:32:17] ============= drm_modes_analog_tv (4 subtests) =============
[04:32:17] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[04:32:17] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[04:32:17] [PASSED] drm_test_modes_analog_tv_pal_576i
[04:32:17] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[04:32:17] =============== [PASSED] drm_modes_analog_tv ===============
[04:32:17] ============== drm_plane_helper (2 subtests) ===============
[04:32:17] =============== drm_test_check_plane_state  ================
[04:32:17] [PASSED] clipping_simple
[04:32:17] [PASSED] clipping_rotate_reflect
[04:32:17] [PASSED] positioning_simple
[04:32:17] [PASSED] upscaling
[04:32:17] [PASSED] downscaling
[04:32:17] [PASSED] rounding1
[04:32:17] [PASSED] rounding2
[04:32:17] [PASSED] rounding3
[04:32:17] [PASSED] rounding4
[04:32:17] =========== [PASSED] drm_test_check_plane_state ============
[04:32:17] =========== drm_test_check_invalid_plane_state  ============
[04:32:17] [PASSED] positioning_invalid
[04:32:17] [PASSED] upscaling_invalid
[04:32:17] [PASSED] downscaling_invalid
[04:32:17] ======= [PASSED] drm_test_check_invalid_plane_state ========
[04:32:17] ================ [PASSED] drm_plane_helper =================
stty: 'standard input': Inappropriate ioctl for device
[04:32:17] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[04:32:17] ====== drm_test_connector_helper_tv_get_modes_check  =======
[04:32:17] [PASSED] None
[04:32:17] [PASSED] PAL
[04:32:17] [PASSED] NTSC
[04:32:17] [PASSED] Both, NTSC Default
[04:32:17] [PASSED] Both, PAL Default
[04:32:17] [PASSED] Both, NTSC Default, with PAL on command-line
[04:32:17] [PASSED] Both, PAL Default, with NTSC on command-line
[04:32:17] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[04:32:17] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[04:32:17] ================== drm_rect (9 subtests) ===================
[04:32:17] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[04:32:17] [PASSED] drm_test_rect_clip_scaled_not_clipped
[04:32:17] [PASSED] drm_test_rect_clip_scaled_clipped
[04:32:17] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[04:32:17] ================= drm_test_rect_intersect  =================
[04:32:17] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[04:32:17] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[04:32:17] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[04:32:17] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[04:32:17] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[04:32:17] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[04:32:17] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[04:32:17] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[04:32:17] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[04:32:17] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[04:32:17] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[04:32:17] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[04:32:17] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[04:32:17] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[04:32:17] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[04:32:17] ============= [PASSED] drm_test_rect_intersect =============
[04:32:17] ================ drm_test_rect_calc_hscale  ================
[04:32:17] [PASSED] normal use
[04:32:17] [PASSED] out of max range
[04:32:17] [PASSED] out of min range
[04:32:17] [PASSED] zero dst
[04:32:17] [PASSED] negative src
[04:32:17] [PASSED] negative dst
[04:32:17] ============ [PASSED] drm_test_rect_calc_hscale ============
[04:32:17] ================ drm_test_rect_calc_vscale  ================
[04:32:17] [PASSED] normal use
[04:32:17] [PASSED] out of max range
[04:32:17] [PASSED] out of min range
[04:32:17] [PASSED] zero dst
[04:32:17] [PASSED] negative src
[04:32:17] [PASSED] negative dst
[04:32:17] ============ [PASSED] drm_test_rect_calc_vscale ============
[04:32:17] ================== drm_test_rect_rotate  ===================
[04:32:17] [PASSED] reflect-x
[04:32:17] [PASSED] reflect-y
[04:32:17] [PASSED] rotate-0
[04:32:17] [PASSED] rotate-90
[04:32:17] [PASSED] rotate-180
[04:32:17] [PASSED] rotate-270
[04:32:17] ============== [PASSED] drm_test_rect_rotate ===============
[04:32:17] ================ drm_test_rect_rotate_inv  =================
[04:32:17] [PASSED] reflect-x
[04:32:17] [PASSED] reflect-y
[04:32:17] [PASSED] rotate-0
[04:32:17] [PASSED] rotate-90
[04:32:17] [PASSED] rotate-180
[04:32:17] [PASSED] rotate-270
[04:32:17] ============ [PASSED] drm_test_rect_rotate_inv =============
[04:32:17] ==================== [PASSED] drm_rect =====================
[04:32:17] ============================================================
[04:32:17] Testing complete. Ran 511 tests: passed: 511
[04:32:18] Elapsed time: 23.736s total, 1.719s configuring, 21.833s building, 0.151s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[04:32:18] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:32:19] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[04:32:28] Starting KUnit Kernel (1/1)...
[04:32:28] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[04:32:28] ================= ttm_device (5 subtests) ==================
[04:32:28] [PASSED] ttm_device_init_basic
[04:32:28] [PASSED] ttm_device_init_multiple
[04:32:28] [PASSED] ttm_device_fini_basic
[04:32:28] [PASSED] ttm_device_init_no_vma_man
[04:32:28] ================== ttm_device_init_pools  ==================
[04:32:28] [PASSED] No DMA allocations, no DMA32 required
[04:32:28] [PASSED] DMA allocations, DMA32 required
[04:32:28] [PASSED] No DMA allocations, DMA32 required
[04:32:28] [PASSED] DMA allocations, no DMA32 required
[04:32:28] ============== [PASSED] ttm_device_init_pools ==============
[04:32:28] =================== [PASSED] ttm_device ====================
[04:32:28] ================== ttm_pool (8 subtests) ===================
[04:32:28] ================== ttm_pool_alloc_basic  ===================
[04:32:28] [PASSED] One page
[04:32:28] [PASSED] More than one page
[04:32:28] [PASSED] Above the allocation limit
[04:32:28] [PASSED] One page, with coherent DMA mappings enabled
[04:32:28] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[04:32:28] ============== [PASSED] ttm_pool_alloc_basic ===============
[04:32:28] ============== ttm_pool_alloc_basic_dma_addr  ==============
[04:32:28] [PASSED] One page
[04:32:28] [PASSED] More than one page
[04:32:28] [PASSED] Above the allocation limit
[04:32:28] [PASSED] One page, with coherent DMA mappings enabled
[04:32:28] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[04:32:28] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[04:32:28] [PASSED] ttm_pool_alloc_order_caching_match
[04:32:28] [PASSED] ttm_pool_alloc_caching_mismatch
[04:32:28] [PASSED] ttm_pool_alloc_order_mismatch
[04:32:28] [PASSED] ttm_pool_free_dma_alloc
[04:32:28] [PASSED] ttm_pool_free_no_dma_alloc
[04:32:28] [PASSED] ttm_pool_fini_basic
[04:32:28] ==================== [PASSED] ttm_pool =====================
[04:32:28] ================ ttm_resource (8 subtests) =================
[04:32:28] ================= ttm_resource_init_basic  =================
[04:32:28] [PASSED] Init resource in TTM_PL_SYSTEM
[04:32:28] [PASSED] Init resource in TTM_PL_VRAM
[04:32:28] [PASSED] Init resource in a private placement
[04:32:28] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[04:32:28] ============= [PASSED] ttm_resource_init_basic =============
[04:32:28] [PASSED] ttm_resource_init_pinned
[04:32:28] [PASSED] ttm_resource_fini_basic
[04:32:28] [PASSED] ttm_resource_manager_init_basic
[04:32:28] [PASSED] ttm_resource_manager_usage_basic
[04:32:28] [PASSED] ttm_resource_manager_set_used_basic
[04:32:28] [PASSED] ttm_sys_man_alloc_basic
[04:32:28] [PASSED] ttm_sys_man_free_basic
[04:32:28] ================== [PASSED] ttm_resource ===================
[04:32:28] =================== ttm_tt (10 subtests) ===================
[04:32:28] ==================== ttm_tt_init_basic  ====================
[04:32:28] [PASSED] Page-aligned size
[04:32:28] [PASSED] Extra pages requested
[04:32:28] ================ [PASSED] ttm_tt_init_basic ================
[04:32:28] [PASSED] ttm_tt_init_misaligned
[04:32:28] [PASSED] ttm_tt_fini_basic
[04:32:28] [PASSED] ttm_tt_fini_sg
[04:32:28] [PASSED] ttm_tt_fini_shmem
[04:32:28] [PASSED] ttm_tt_create_basic
[04:32:28] [PASSED] ttm_tt_create_invalid_bo_type
[04:32:28] [PASSED] ttm_tt_create_ttm_exists
[04:32:28] [PASSED] ttm_tt_create_failed
[04:32:28] [PASSED] ttm_tt_destroy_basic
[04:32:28] ===================== [PASSED] ttm_tt ======================
[04:32:28] =================== ttm_bo (14 subtests) ===================
[04:32:28] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[04:32:28] [PASSED] Cannot be interrupted and sleeps
[04:32:28] [PASSED] Cannot be interrupted, locks straight away
[04:32:28] [PASSED] Can be interrupted, sleeps
[04:32:28] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[04:32:28] [PASSED] ttm_bo_reserve_locked_no_sleep
[04:32:28] [PASSED] ttm_bo_reserve_no_wait_ticket
[04:32:28] [PASSED] ttm_bo_reserve_double_resv
[04:32:28] [PASSED] ttm_bo_reserve_interrupted
[04:32:28] [PASSED] ttm_bo_reserve_deadlock
[04:32:28] [PASSED] ttm_bo_unreserve_basic
[04:32:28] [PASSED] ttm_bo_unreserve_pinned
[04:32:28] [PASSED] ttm_bo_unreserve_bulk
[04:32:28] [PASSED] ttm_bo_put_basic
[04:32:28] [PASSED] ttm_bo_put_shared_resv
[04:32:28] [PASSED] ttm_bo_pin_basic
[04:32:28] [PASSED] ttm_bo_pin_unpin_resource
[04:32:28] [PASSED] ttm_bo_multiple_pin_one_unpin
[04:32:28] ===================== [PASSED] ttm_bo ======================
[04:32:28] ============================================================
[04:32:28] Testing complete. Ran 62 tests: passed: 62
[04:32:28] Elapsed time: 10.397s total, 1.684s configuring, 8.544s building, 0.137s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


