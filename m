Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A85C27C7B
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 22:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC2910EBF8;
	Thu, 13 Jun 2024 22:36:47 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCBF10EBF5;
 Thu, 13 Jun 2024 22:36:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Fix_missing_runtime_?=
 =?utf-8?q?outer_protection_for_ggtt=5Fremove=5Fnode_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jun 2024 22:36:40 -0000
Message-ID: <171831820006.76621.8906553925240438930@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240613215357.307061-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240613215357.307061-1-rodrigo.vivi@intel.com>
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

Series: drm/xe: Fix missing runtime outer protection for ggtt_remove_node (rev6)
URL   : https://patchwork.freedesktop.org/series/134308/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[22:35:33] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:35:37] Building KUnit Kernel ...
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

[22:36:03] Starting KUnit Kernel (1/1)...
[22:36:03] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:36:03] =================== guc_dbm (7 subtests) ===================
[22:36:03] [PASSED] test_empty
[22:36:03] [PASSED] test_default
[22:36:03] ======================== test_size  ========================
[22:36:03] [PASSED] 4
[22:36:03] [PASSED] 8
[22:36:03] [PASSED] 32
[22:36:03] [PASSED] 256
[22:36:03] ==================== [PASSED] test_size ====================
[22:36:03] ======================= test_reuse  ========================
[22:36:03] [PASSED] 4
[22:36:03] [PASSED] 8
[22:36:03] [PASSED] 32
[22:36:03] [PASSED] 256
[22:36:03] =================== [PASSED] test_reuse ====================
[22:36:03] =================== test_range_overlap  ====================
[22:36:03] [PASSED] 4
[22:36:03] [PASSED] 8
[22:36:03] [PASSED] 32
[22:36:03] [PASSED] 256
[22:36:03] =============== [PASSED] test_range_overlap ================
[22:36:03] =================== test_range_compact  ====================
[22:36:03] [PASSED] 4
[22:36:03] [PASSED] 8
[22:36:03] [PASSED] 32
[22:36:03] [PASSED] 256
[22:36:03] =============== [PASSED] test_range_compact ================
[22:36:03] ==================== test_range_spare  =====================
[22:36:03] [PASSED] 4
[22:36:03] [PASSED] 8
[22:36:03] [PASSED] 32
[22:36:03] [PASSED] 256
[22:36:03] ================ [PASSED] test_range_spare =================
[22:36:03] ===================== [PASSED] guc_dbm =====================
[22:36:03] =================== guc_idm (6 subtests) ===================
[22:36:03] [PASSED] bad_init
[22:36:03] [PASSED] no_init
[22:36:03] [PASSED] init_fini
[22:36:03] [PASSED] check_used
[22:36:03] [PASSED] check_quota
[22:36:03] [PASSED] check_all
[22:36:03] ===================== [PASSED] guc_idm =====================
[22:36:03] ================== no_relay (3 subtests) ===================
[22:36:03] [PASSED] xe_drops_guc2pf_if_not_ready
[22:36:03] [PASSED] xe_drops_guc2vf_if_not_ready
[22:36:03] [PASSED] xe_rejects_send_if_not_ready
[22:36:03] ==================== [PASSED] no_relay =====================
[22:36:03] ================== pf_relay (14 subtests) ==================
[22:36:03] [PASSED] pf_rejects_guc2pf_too_short
[22:36:03] [PASSED] pf_rejects_guc2pf_too_long
[22:36:03] [PASSED] pf_rejects_guc2pf_no_payload
[22:36:03] [PASSED] pf_fails_no_payload
[22:36:03] [PASSED] pf_fails_bad_origin
[22:36:03] [PASSED] pf_fails_bad_type
[22:36:03] [PASSED] pf_txn_reports_error
[22:36:03] [PASSED] pf_txn_sends_pf2guc
[22:36:03] [PASSED] pf_sends_pf2guc
[22:36:03] [SKIPPED] pf_loopback_nop
[22:36:03] [SKIPPED] pf_loopback_echo
[22:36:03] [SKIPPED] pf_loopback_fail
[22:36:03] [SKIPPED] pf_loopback_busy
[22:36:03] [SKIPPED] pf_loopback_retry
[22:36:03] ==================== [PASSED] pf_relay =====================
[22:36:03] ================== vf_relay (3 subtests) ===================
[22:36:03] [PASSED] vf_rejects_guc2vf_too_short
[22:36:03] [PASSED] vf_rejects_guc2vf_too_long
[22:36:03] [PASSED] vf_rejects_guc2vf_no_payload
[22:36:03] ==================== [PASSED] vf_relay =====================
[22:36:03] ================= pf_service (11 subtests) =================
[22:36:03] [PASSED] pf_negotiate_any
[22:36:03] [PASSED] pf_negotiate_base_match
[22:36:03] [PASSED] pf_negotiate_base_newer
[22:36:03] [PASSED] pf_negotiate_base_next
[22:36:03] [SKIPPED] pf_negotiate_base_older
[22:36:03] [PASSED] pf_negotiate_base_prev
[22:36:03] [PASSED] pf_negotiate_latest_match
[22:36:03] [PASSED] pf_negotiate_latest_newer
[22:36:03] [PASSED] pf_negotiate_latest_next
[22:36:03] [SKIPPED] pf_negotiate_latest_older
[22:36:03] [SKIPPED] pf_negotiate_latest_prev
[22:36:03] =================== [PASSED] pf_service ====================
[22:36:03] ===================== lmtt (1 subtest) =====================
[22:36:03] ======================== test_ops  =========================
[22:36:03] [PASSED] 2-level
[22:36:03] [PASSED] multi-level
[22:36:03] ==================== [PASSED] test_ops =====================
[22:36:03] ====================== [PASSED] lmtt =======================
[22:36:03] ==================== xe_bo (2 subtests) ====================
[22:36:03] [SKIPPED] xe_ccs_migrate_kunit
[22:36:03] [SKIPPED] xe_bo_evict_kunit
[22:36:03] ===================== [SKIPPED] xe_bo ======================
[22:36:03] ================== xe_dma_buf (1 subtest) ==================
[22:36:03] [SKIPPED] xe_dma_buf_kunit
[22:36:03] =================== [SKIPPED] xe_dma_buf ===================
[22:36:03] ================== xe_migrate (1 subtest) ==================
[22:36:03] [SKIPPED] xe_migrate_sanity_kunit
[22:36:03] =================== [SKIPPED] xe_migrate ===================
[22:36:03] =================== xe_mocs (2 subtests) ===================
[22:36:03] [SKIPPED] xe_live_mocs_kernel_kunit
[22:36:03] [SKIPPED] xe_live_mocs_reset_kunit
[22:36:03] ==================== [SKIPPED] xe_mocs =====================
[22:36:03] ==================== args (11 subtests) ====================
[22:36:03] [PASSED] count_args_test
[22:36:03] [PASSED] call_args_example
[22:36:03] [PASSED] call_args_test
[22:36:03] [PASSED] drop_first_arg_example
[22:36:03] [PASSED] drop_first_arg_test
[22:36:03] [PASSED] first_arg_example
[22:36:03] [PASSED] first_arg_test
[22:36:03] [PASSED] last_arg_example
[22:36:03] [PASSED] last_arg_test
[22:36:03] [PASSED] pick_arg_example
[22:36:03] [PASSED] sep_comma_example
[22:36:03] ====================== [PASSED] args =======================
[22:36:03] =================== xe_pci (2 subtests) ====================
[22:36:03] [PASSED] xe_gmdid_graphics_ip
[22:36:03] [PASSED] xe_gmdid_media_ip
[22:36:03] ===================== [PASSED] xe_pci ======================
[22:36:03] ==================== xe_rtp (1 subtest) ====================
[22:36:03] ================== xe_rtp_process_tests  ===================
[22:36:03] [PASSED] coalesce-same-reg
[22:36:03] [PASSED] no-match-no-add
[22:36:03] [PASSED] no-match-no-add-multiple-rules
[22:36:03] [PASSED] two-regs-two-entries
[22:36:03] [PASSED] clr-one-set-other
[22:36:03] [PASSED] set-field
[22:36:03] [PASSED] conflict-duplicate
[22:36:03] [PASSED] conflict-not-disjoint
[22:36:03] [PASSED] conflict-reg-type
[22:36:03] ============== [PASSED] xe_rtp_process_tests ===============
stty: 'standard input': Inappropriate ioctl for device
[22:36:03] ===================== [PASSED] xe_rtp ======================
[22:36:03] ==================== xe_wa (1 subtest) =====================
[22:36:03] ======================== xe_wa_gt  =========================
[22:36:03] [PASSED] TIGERLAKE (B0)
[22:36:03] [PASSED] DG1 (A0)
[22:36:03] [PASSED] DG1 (B0)
[22:36:03] [PASSED] ALDERLAKE_S (A0)
[22:36:03] [PASSED] ALDERLAKE_S (B0)
[22:36:03] [PASSED] ALDERLAKE_S (C0)
[22:36:03] [PASSED] ALDERLAKE_S (D0)
[22:36:03] [PASSED] ALDERLAKE_P (A0)
[22:36:03] [PASSED] ALDERLAKE_P (B0)
[22:36:03] [PASSED] ALDERLAKE_P (C0)
[22:36:03] [PASSED] ALDERLAKE_S_RPLS (D0)
[22:36:03] [PASSED] ALDERLAKE_P_RPLU (E0)
[22:36:03] [PASSED] DG2_G10 (C0)
[22:36:03] [PASSED] DG2_G11 (B1)
[22:36:03] [PASSED] DG2_G12 (A1)
[22:36:03] [PASSED] METEORLAKE (g:A0, m:A0)
[22:36:03] [PASSED] METEORLAKE (g:A0, m:A0)
[22:36:03] [PASSED] METEORLAKE (g:A0, m:A0)
[22:36:03] [PASSED] LUNARLAKE (g:A0, m:A0)
[22:36:03] [PASSED] LUNARLAKE (g:B0, m:A0)
[22:36:03] ==================== [PASSED] xe_wa_gt =====================
[22:36:03] ====================== [PASSED] xe_wa ======================
[22:36:03] ============================================================
[22:36:03] Testing complete. Ran 109 tests: passed: 95, skipped: 14
[22:36:03] Elapsed time: 29.745s total, 4.245s configuring, 25.280s building, 0.177s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[22:36:03] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:36:05] Building KUnit Kernel ...
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

[22:36:26] Starting KUnit Kernel (1/1)...
[22:36:26] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:36:26] ============ drm_test_pick_cmdline (2 subtests) ============
[22:36:26] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[22:36:26] =============== drm_test_pick_cmdline_named  ===============
[22:36:26] [PASSED] NTSC
[22:36:26] [PASSED] NTSC-J
[22:36:26] [PASSED] PAL
[22:36:26] [PASSED] PAL-M
[22:36:26] =========== [PASSED] drm_test_pick_cmdline_named ===========
[22:36:26] ============== [PASSED] drm_test_pick_cmdline ==============
[22:36:26] ================== drm_buddy (7 subtests) ==================
[22:36:26] [PASSED] drm_test_buddy_alloc_limit
[22:36:26] [PASSED] drm_test_buddy_alloc_optimistic
[22:36:26] [PASSED] drm_test_buddy_alloc_pessimistic
[22:36:26] [PASSED] drm_test_buddy_alloc_pathological
[22:36:26] [PASSED] drm_test_buddy_alloc_contiguous
[22:36:26] [PASSED] drm_test_buddy_alloc_clear
[22:36:26] [PASSED] drm_test_buddy_alloc_range_bias
[22:36:26] ==================== [PASSED] drm_buddy ====================
[22:36:26] ============= drm_cmdline_parser (40 subtests) =============
[22:36:26] [PASSED] drm_test_cmdline_force_d_only
[22:36:26] [PASSED] drm_test_cmdline_force_D_only_dvi
[22:36:26] [PASSED] drm_test_cmdline_force_D_only_hdmi
[22:36:26] [PASSED] drm_test_cmdline_force_D_only_not_digital
[22:36:26] [PASSED] drm_test_cmdline_force_e_only
[22:36:26] [PASSED] drm_test_cmdline_res
[22:36:26] [PASSED] drm_test_cmdline_res_vesa
[22:36:26] [PASSED] drm_test_cmdline_res_vesa_rblank
[22:36:26] [PASSED] drm_test_cmdline_res_rblank
[22:36:26] [PASSED] drm_test_cmdline_res_bpp
[22:36:26] [PASSED] drm_test_cmdline_res_refresh
[22:36:26] [PASSED] drm_test_cmdline_res_bpp_refresh
[22:36:26] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[22:36:26] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[22:36:26] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[22:36:26] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[22:36:26] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[22:36:26] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[22:36:26] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[22:36:26] [PASSED] drm_test_cmdline_res_margins_force_on
[22:36:26] [PASSED] drm_test_cmdline_res_vesa_margins
[22:36:26] [PASSED] drm_test_cmdline_name
[22:36:26] [PASSED] drm_test_cmdline_name_bpp
[22:36:26] [PASSED] drm_test_cmdline_name_option
[22:36:26] [PASSED] drm_test_cmdline_name_bpp_option
[22:36:26] [PASSED] drm_test_cmdline_rotate_0
[22:36:26] [PASSED] drm_test_cmdline_rotate_90
[22:36:26] [PASSED] drm_test_cmdline_rotate_180
[22:36:26] [PASSED] drm_test_cmdline_rotate_270
[22:36:26] [PASSED] drm_test_cmdline_hmirror
[22:36:26] [PASSED] drm_test_cmdline_vmirror
[22:36:26] [PASSED] drm_test_cmdline_margin_options
[22:36:26] [PASSED] drm_test_cmdline_multiple_options
[22:36:26] [PASSED] drm_test_cmdline_bpp_extra_and_option
[22:36:26] [PASSED] drm_test_cmdline_extra_and_option
[22:36:26] [PASSED] drm_test_cmdline_freestanding_options
[22:36:26] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[22:36:26] [PASSED] drm_test_cmdline_panel_orientation
[22:36:26] ================ drm_test_cmdline_invalid  =================
[22:36:26] [PASSED] margin_only
[22:36:26] [PASSED] interlace_only
[22:36:26] [PASSED] res_missing_x
[22:36:26] [PASSED] res_missing_y
[22:36:26] [PASSED] res_bad_y
[22:36:26] [PASSED] res_missing_y_bpp
[22:36:26] [PASSED] res_bad_bpp
[22:36:26] [PASSED] res_bad_refresh
[22:36:26] [PASSED] res_bpp_refresh_force_on_off
[22:36:26] [PASSED] res_invalid_mode
[22:36:26] [PASSED] res_bpp_wrong_place_mode
[22:36:26] [PASSED] name_bpp_refresh
[22:36:26] [PASSED] name_refresh
[22:36:26] [PASSED] name_refresh_wrong_mode
[22:36:26] [PASSED] name_refresh_invalid_mode
[22:36:26] [PASSED] rotate_multiple
[22:36:26] [PASSED] rotate_invalid_val
[22:36:26] [PASSED] rotate_truncated
[22:36:26] [PASSED] invalid_option
[22:36:26] [PASSED] invalid_tv_option
[22:36:26] [PASSED] truncated_tv_option
[22:36:26] ============ [PASSED] drm_test_cmdline_invalid =============
[22:36:26] =============== drm_test_cmdline_tv_options  ===============
[22:36:26] [PASSED] NTSC
[22:36:26] [PASSED] NTSC_443
[22:36:26] [PASSED] NTSC_J
[22:36:26] [PASSED] PAL
[22:36:26] [PASSED] PAL_M
[22:36:26] [PASSED] PAL_N
[22:36:26] [PASSED] SECAM
[22:36:26] =========== [PASSED] drm_test_cmdline_tv_options ===========
[22:36:26] =============== [PASSED] drm_cmdline_parser ================
[22:36:26] ========== drmm_connector_hdmi_init (19 subtests) ==========
[22:36:26] [PASSED] drm_test_connector_hdmi_init_valid
[22:36:26] [PASSED] drm_test_connector_hdmi_init_bpc_8
[22:36:26] [PASSED] drm_test_connector_hdmi_init_bpc_10
[22:36:26] [PASSED] drm_test_connector_hdmi_init_bpc_12
[22:36:26] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[22:36:26] [PASSED] drm_test_connector_hdmi_init_bpc_null
[22:36:26] [PASSED] drm_test_connector_hdmi_init_formats_empty
[22:36:26] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[22:36:26] [PASSED] drm_test_connector_hdmi_init_null_ddc
[22:36:26] [PASSED] drm_test_connector_hdmi_init_null_product
[22:36:26] [PASSED] drm_test_connector_hdmi_init_null_vendor
[22:36:26] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[22:36:26] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[22:36:26] [PASSED] drm_test_connector_hdmi_init_product_valid
[22:36:26] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[22:36:26] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[22:36:26] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[22:36:26] ========= drm_test_connector_hdmi_init_type_valid  =========
[22:36:26] [PASSED] HDMI-A
[22:36:26] [PASSED] HDMI-B
[22:36:26] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[22:36:26] ======== drm_test_connector_hdmi_init_type_invalid  ========
[22:36:26] [PASSED] Unknown
[22:36:26] [PASSED] VGA
[22:36:26] [PASSED] DVI-I
[22:36:26] [PASSED] DVI-D
[22:36:26] [PASSED] DVI-A
[22:36:26] [PASSED] Composite
[22:36:26] [PASSED] SVIDEO
[22:36:26] [PASSED] LVDS
[22:36:26] [PASSED] Component
[22:36:26] [PASSED] DIN
[22:36:26] [PASSED] DP
[22:36:26] [PASSED] TV
[22:36:26] [PASSED] eDP
[22:36:26] [PASSED] Virtual
[22:36:26] [PASSED] DSI
[22:36:26] [PASSED] DPI
[22:36:26] [PASSED] Writeback
[22:36:26] [PASSED] SPI
[22:36:26] [PASSED] USB
[22:36:26] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[22:36:26] ============ [PASSED] drmm_connector_hdmi_init =============
[22:36:26] ============= drmm_connector_init (3 subtests) =============
[22:36:26] [PASSED] drm_test_drmm_connector_init
[22:36:26] [PASSED] drm_test_drmm_connector_init_null_ddc
[22:36:26] ========= drm_test_drmm_connector_init_type_valid  =========
[22:36:26] [PASSED] Unknown
[22:36:26] [PASSED] VGA
[22:36:26] [PASSED] DVI-I
[22:36:26] [PASSED] DVI-D
[22:36:26] [PASSED] DVI-A
[22:36:26] [PASSED] Composite
[22:36:26] [PASSED] SVIDEO
[22:36:26] [PASSED] LVDS
[22:36:26] [PASSED] Component
[22:36:26] [PASSED] DIN
[22:36:26] [PASSED] DP
[22:36:26] [PASSED] HDMI-A
[22:36:26] [PASSED] HDMI-B
[22:36:26] [PASSED] TV
[22:36:26] [PASSED] eDP
[22:36:26] [PASSED] Virtual
[22:36:26] [PASSED] DSI
[22:36:26] [PASSED] DPI
[22:36:26] [PASSED] Writeback
[22:36:26] [PASSED] SPI
[22:36:26] [PASSED] USB
[22:36:26] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[22:36:26] =============== [PASSED] drmm_connector_init ===============
[22:36:26] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[22:36:26] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[22:36:26] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[22:36:26] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[22:36:26] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[22:36:26] ========== drm_test_get_tv_mode_from_name_valid  ===========
[22:36:26] [PASSED] NTSC
[22:36:26] [PASSED] NTSC-443
[22:36:26] [PASSED] NTSC-J
[22:36:26] [PASSED] PAL
[22:36:26] [PASSED] PAL-M
[22:36:26] [PASSED] PAL-N
[22:36:26] [PASSED] SECAM
[22:36:26] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[22:36:26] [PASSED] drm_test_get_tv_mode_from_name_truncated
[22:36:26] ============ [PASSED] drm_get_tv_mode_from_name ============
[22:36:26] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[22:36:26] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[22:36:26] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[22:36:26] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[22:36:26] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[22:36:26] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[22:36:26] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[22:36:26] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[22:36:26] [PASSED] VIC 96
[22:36:26] [PASSED] VIC 97
[22:36:26] [PASSED] VIC 101
[22:36:26] [PASSED] VIC 102
[22:36:26] [PASSED] VIC 106
[22:36:26] [PASSED] VIC 107
[22:36:26] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[22:36:26] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[22:36:26] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[22:36:26] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[22:36:26] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[22:36:26] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[22:36:26] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[22:36:26] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[22:36:26] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[22:36:26] [PASSED] Automatic
[22:36:26] [PASSED] Full
[22:36:26] [PASSED] Limited 16:235
[22:36:26] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[22:36:26] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[22:36:26] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[22:36:26] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[22:36:26] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[22:36:26] [PASSED] RGB
[22:36:26] [PASSED] YUV 4:2:0
[22:36:26] [PASSED] YUV 4:2:2
[22:36:26] [PASSED] YUV 4:4:4
[22:36:26] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[22:36:26] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[22:36:26] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[22:36:26] ============= drm_damage_helper (21 subtests) ==============
[22:36:26] [PASSED] drm_test_damage_iter_no_damage
[22:36:26] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[22:36:26] [PASSED] drm_test_damage_iter_no_damage_src_moved
[22:36:26] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[22:36:26] [PASSED] drm_test_damage_iter_no_damage_not_visible
[22:36:26] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[22:36:26] [PASSED] drm_test_damage_iter_no_damage_no_fb
[22:36:26] [PASSED] drm_test_damage_iter_simple_damage
[22:36:26] [PASSED] drm_test_damage_iter_single_damage
[22:36:26] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[22:36:26] [PASSED] drm_test_damage_iter_single_damage_outside_src
[22:36:26] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[22:36:26] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[22:36:26] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[22:36:26] [PASSED] drm_test_damage_iter_single_damage_src_moved
[22:36:26] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[22:36:26] [PASSED] drm_test_damage_iter_damage
[22:36:26] [PASSED] drm_test_damage_iter_damage_one_intersect
[22:36:26] [PASSED] drm_test_damage_iter_damage_one_outside
[22:36:26] [PASSED] drm_test_damage_iter_damage_src_moved
[22:36:26] [PASSED] drm_test_damage_iter_damage_not_visible
[22:36:26] ================ [PASSED] drm_damage_helper ================
[22:36:26] ============== drm_dp_mst_helper (3 subtests) ==============
[22:36:26] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[22:36:26] [PASSED] Clock 154000 BPP 30 DSC disabled
[22:36:26] [PASSED] Clock 234000 BPP 30 DSC disabled
[22:36:26] [PASSED] Clock 297000 BPP 24 DSC disabled
[22:36:26] [PASSED] Clock 332880 BPP 24 DSC enabled
[22:36:26] [PASSED] Clock 324540 BPP 24 DSC enabled
[22:36:26] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[22:36:26] ============== drm_test_dp_mst_calc_pbn_div  ===============
[22:36:26] [PASSED] Link rate 2000000 lane count 4
[22:36:26] [PASSED] Link rate 2000000 lane count 2
[22:36:26] [PASSED] Link rate 2000000 lane count 1
[22:36:26] [PASSED] Link rate 1350000 lane count 4
[22:36:26] [PASSED] Link rate 1350000 lane count 2
[22:36:26] [PASSED] Link rate 1350000 lane count 1
[22:36:26] [PASSED] Link rate 1000000 lane count 4
[22:36:26] [PASSED] Link rate 1000000 lane count 2
[22:36:26] [PASSED] Link rate 1000000 lane count 1
[22:36:26] [PASSED] Link rate 810000 lane count 4
[22:36:26] [PASSED] Link rate 810000 lane count 2
[22:36:26] [PASSED] Link rate 810000 lane count 1
[22:36:26] [PASSED] Link rate 540000 lane count 4
[22:36:26] [PASSED] Link rate 540000 lane count 2
[22:36:26] [PASSED] Link rate 540000 lane count 1
[22:36:26] [PASSED] Link rate 270000 lane count 4
[22:36:26] [PASSED] Link rate 270000 lane count 2
[22:36:26] [PASSED] Link rate 270000 lane count 1
[22:36:26] [PASSED] Link rate 162000 lane count 4
[22:36:26] [PASSED] Link rate 162000 lane count 2
[22:36:26] [PASSED] Link rate 162000 lane count 1
[22:36:26] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[22:36:26] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[22:36:26] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[22:36:26] [PASSED] DP_POWER_UP_PHY with port number
[22:36:26] [PASSED] DP_POWER_DOWN_PHY with port number
[22:36:26] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[22:36:26] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[22:36:26] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[22:36:26] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[22:36:26] [PASSED] DP_QUERY_PAYLOAD with port number
[22:36:26] [PASSED] DP_QUERY_PAYLOAD with VCPI
[22:36:26] [PASSED] DP_REMOTE_DPCD_READ with port number
[22:36:26] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[22:36:26] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[22:36:26] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[22:36:26] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[22:36:26] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[22:36:26] [PASSED] DP_REMOTE_I2C_READ with port number
[22:36:26] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[22:36:26] [PASSED] DP_REMOTE_I2C_READ with transactions array
[22:36:26] [PASSED] DP_REMOTE_I2C_WRITE with port number
[22:36:26] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[22:36:26] [PASSED] DP_REMOTE_I2C_WRITE with data array
[22:36:26] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[22:36:26] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[22:36:26] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[22:36:26] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[22:36:26] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[22:36:26] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[22:36:26] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[22:36:26] ================ [PASSED] drm_dp_mst_helper ================
[22:36:26] ================== drm_exec (7 subtests) ===================
[22:36:26] [PASSED] sanitycheck
[22:36:26] [PASSED] test_lock
[22:36:26] [PASSED] test_lock_unlock
[22:36:26] [PASSED] test_duplicates
[22:36:26] [PASSED] test_prepare
[22:36:26] [PASSED] test_prepare_array
[22:36:26] [PASSED] test_multiple_loops
[22:36:26] ==================== [PASSED] drm_exec =====================
[22:36:26] =========== drm_format_helper_test (17 subtests) ===========
[22:36:26] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[22:36:26] [PASSED] single_pixel_source_buffer
[22:36:26] [PASSED] single_pixel_clip_rectangle
[22:36:26] [PASSED] well_known_colors
[22:36:26] [PASSED] destination_pitch
[22:36:26] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[22:36:26] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[22:36:26] [PASSED] single_pixel_source_buffer
[22:36:26] [PASSED] single_pixel_clip_rectangle
[22:36:26] [PASSED] well_known_colors
[22:36:26] [PASSED] destination_pitch
[22:36:26] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[22:36:26] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[22:36:26] [PASSED] single_pixel_source_buffer
[22:36:26] [PASSED] single_pixel_clip_rectangle
[22:36:26] [PASSED] well_known_colors
[22:36:26] [PASSED] destination_pitch
[22:36:26] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[22:36:26] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[22:36:26] [PASSED] single_pixel_source_buffer
[22:36:26] [PASSED] single_pixel_clip_rectangle
[22:36:26] [PASSED] well_known_colors
[22:36:26] [PASSED] destination_pitch
[22:36:26] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[22:36:26] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[22:36:26] [PASSED] single_pixel_source_buffer
[22:36:26] [PASSED] single_pixel_clip_rectangle
[22:36:26] [PASSED] well_known_colors
[22:36:26] [PASSED] destination_pitch
[22:36:26] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[22:36:26] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[22:36:26] [PASSED] single_pixel_source_buffer
[22:36:26] [PASSED] single_pixel_clip_rectangle
[22:36:26] [PASSED] well_known_colors
[22:36:26] [PASSED] destination_pitch
[22:36:26] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[22:36:26] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[22:36:26] [PASSED] single_pixel_source_buffer
[22:36:26] [PASSED] single_pixel_clip_rectangle
[22:36:26] [PASSED] well_known_colors
[22:36:26] [PASSED] destination_pitch
[22:36:26] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[22:36:26] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[22:36:26] [PASSED] single_pixel_source_buffer
[22:36:26] [PASSED] single_pixel_clip_rectangle
[22:36:26] [PASSED] well_known_colors
[22:36:26] [PASSED] destination_pitch
[22:36:26] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[22:36:26] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[22:36:26] [PASSED] single_pixel_source_buffer
[22:36:26] [PASSED] single_pixel_clip_rectangle
[22:36:26] [PASSED] well_known_colors
[22:36:26] [PASSED] destination_pitch
[22:36:26] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[22:36:26] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[22:36:26] [PASSED] single_pixel_source_buffer
[22:36:26] [PASSED] single_pixel_clip_rectangle
[22:36:26] [PASSED] well_known_colors
[22:36:26] [PASSED] destination_pitch
[22:36:26] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[22:36:26] ============== drm_test_fb_xrgb8888_to_mono  ===============
[22:36:26] [PASSED] single_pixel_source_buffer
[22:36:26] [PASSED] single_pixel_clip_rectangle
[22:36:26] [PASSED] well_known_colors
[22:36:26] [PASSED] destination_pitch
[22:36:26] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[22:36:26] ==================== drm_test_fb_swab  =====================
[22:36:26] [PASSED] single_pixel_source_buffer
[22:36:26] [PASSED] single_pixel_clip_rectangle
[22:36:26] [PASSED] well_known_colors
[22:36:26] [PASSED] destination_pitch
[22:36:26] ================ [PASSED] drm_test_fb_swab =================
[22:36:26] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[22:36:26] [PASSED] single_pixel_source_buffer
[22:36:26] [PASSED] single_pixel_clip_rectangle
[22:36:26] [PASSED] well_known_colors
[22:36:26] [PASSED] destination_pitch
[22:36:26] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[22:36:26] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[22:36:26] [PASSED] single_pixel_source_buffer
[22:36:26] [PASSED] single_pixel_clip_rectangle
[22:36:26] [PASSED] well_known_colors
[22:36:26] [PASSED] destination_pitch
[22:36:26] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[22:36:26] ================= drm_test_fb_clip_offset  =================
[22:36:26] [PASSED] pass through
[22:36:26] [PASSED] horizontal offset
[22:36:26] [PASSED] vertical offset
[22:36:26] [PASSED] horizontal and vertical offset
[22:36:26] [PASSED] horizontal offset (custom pitch)
[22:36:26] [PASSED] vertical offset (custom pitch)
[22:36:26] [PASSED] horizontal and vertical offset (custom pitch)
[22:36:26] ============= [PASSED] drm_test_fb_clip_offset =============
[22:36:26] ============== drm_test_fb_build_fourcc_list  ==============
[22:36:26] [PASSED] no native formats
[22:36:26] [PASSED] XRGB8888 as native format
[22:36:26] [PASSED] remove duplicates
[22:36:26] [PASSED] convert alpha formats
[22:36:26] [PASSED] random formats
[22:36:26] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[22:36:26] =================== drm_test_fb_memcpy  ====================
[22:36:26] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[22:36:26] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[22:36:26] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[22:36:26] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[22:36:26] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[22:36:26] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[22:36:26] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[22:36:26] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[22:36:26] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[22:36:26] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[22:36:26] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[22:36:26] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[22:36:26] =============== [PASSED] drm_test_fb_memcpy ================
[22:36:26] ============= [PASSED] drm_format_helper_test ==============
[22:36:26] ================= drm_format (18 subtests) =================
[22:36:26] [PASSED] drm_test_format_block_width_invalid
[22:36:26] [PASSED] drm_test_format_block_width_one_plane
[22:36:26] [PASSED] drm_test_format_block_width_two_plane
[22:36:26] [PASSED] drm_test_format_block_width_three_plane
[22:36:26] [PASSED] drm_test_format_block_width_tiled
[22:36:26] [PASSED] drm_test_format_block_height_invalid
[22:36:26] [PASSED] drm_test_format_block_height_one_plane
[22:36:26] [PASSED] drm_test_format_block_height_two_plane
[22:36:26] [PASSED] drm_test_format_block_height_three_plane
[22:36:26] [PASSED] drm_test_format_block_height_tiled
[22:36:26] [PASSED] drm_test_format_min_pitch_invalid
[22:36:26] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[22:36:26] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[22:36:26] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[22:36:26] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[22:36:26] [PASSED] drm_test_format_min_pitch_two_plane
[22:36:26] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[22:36:26] [PASSED] drm_test_format_min_pitch_tiled
[22:36:26] =================== [PASSED] drm_format ====================
[22:36:26] =============== drm_framebuffer (1 subtest) ================
[22:36:26] =============== drm_test_framebuffer_create  ===============
[22:36:26] [PASSED] ABGR8888 normal sizes
[22:36:26] [PASSED] ABGR8888 max sizes
[22:36:26] [PASSED] ABGR8888 pitch greater than min required
[22:36:26] [PASSED] ABGR8888 pitch less than min required
[22:36:26] [PASSED] ABGR8888 Invalid width
[22:36:26] [PASSED] ABGR8888 Invalid buffer handle
[22:36:26] [PASSED] No pixel format
[22:36:26] [PASSED] ABGR8888 Width 0
[22:36:26] [PASSED] ABGR8888 Height 0
[22:36:26] [PASSED] ABGR8888 Out of bound height * pitch combination
[22:36:26] [PASSED] ABGR8888 Large buffer offset
[22:36:26] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[22:36:26] [PASSED] ABGR8888 Valid buffer modifier
[22:36:26] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[22:36:26] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[22:36:26] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[22:36:26] [PASSED] NV12 Normal sizes
[22:36:26] [PASSED] NV12 Max sizes
[22:36:26] [PASSED] NV12 Invalid pitch
[22:36:26] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[22:36:26] [PASSED] NV12 different  modifier per-plane
[22:36:26] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[22:36:26] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[22:36:26] [PASSED] NV12 Modifier for inexistent plane
[22:36:26] [PASSED] NV12 Handle for inexistent plane
[22:36:26] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[22:36:26] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[22:36:26] [PASSED] YVU420 Normal sizes
[22:36:26] [PASSED] YVU420 Max sizes
[22:36:26] [PASSED] YVU420 Invalid pitch
[22:36:26] [PASSED] YVU420 Different pitches
[22:36:26] [PASSED] YVU420 Different buffer offsets/pitches
[22:36:26] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[22:36:26] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[22:36:26] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[22:36:26] [PASSED] YVU420 Valid modifier
[22:36:26] [PASSED] YVU420 Different modifiers per plane
[22:36:26] [PASSED] YVU420 Modifier for inexistent plane
[22:36:26] [PASSED] X0L2 Normal sizes
[22:36:26] [PASSED] X0L2 Max sizes
[22:36:26] [PASSED] X0L2 Invalid pitch
[22:36:26] [PASSED] X0L2 Pitch greater than minimum required
[22:36:26] [PASSED] X0L2 Handle for inexistent plane
[22:36:26] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[22:36:26] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[22:36:26] [PASSED] X0L2 Valid modifier
[22:36:26] [PASSED] X0L2 Modifier for inexistent plane
[22:36:26] =========== [PASSED] drm_test_framebuffer_create ===========
[22:36:26] ================= [PASSED] drm_framebuffer =================
[22:36:26] ================ drm_gem_shmem (8 subtests) ================
[22:36:26] [PASSED] drm_gem_shmem_test_obj_create
[22:36:26] [PASSED] drm_gem_shmem_test_obj_create_private
[22:36:26] [PASSED] drm_gem_shmem_test_pin_pages
[22:36:26] [PASSED] drm_gem_shmem_test_vmap
[22:36:26] [PASSED] drm_gem_shmem_test_get_pages_sgt
[22:36:26] [PASSED] drm_gem_shmem_test_get_sg_table
[22:36:26] [PASSED] drm_gem_shmem_test_madvise
[22:36:26] [PASSED] drm_gem_shmem_test_purge
[22:36:26] ================== [PASSED] drm_gem_shmem ==================
[22:36:26] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[22:36:26] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[22:36:26] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[22:36:26] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[22:36:26] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[22:36:26] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[22:36:26] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[22:36:26] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[22:36:26] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[22:36:26] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[22:36:26] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[22:36:26] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[22:36:26] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[22:36:26] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[22:36:26] [PASSED] drm_test_check_output_bpc_dvi
[22:36:26] [PASSED] drm_test_check_output_bpc_format_vic_1
[22:36:26] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[22:36:26] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[22:36:26] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[22:36:26] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[22:36:26] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[22:36:26] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[22:36:26] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[22:36:26] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[22:36:26] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[22:36:26] [PASSED] drm_test_check_broadcast_rgb_value
[22:36:26] [PASSED] drm_test_check_bpc_8_value
[22:36:26] [PASSED] drm_test_check_bpc_10_value
[22:36:26] [PASSED] drm_test_check_bpc_12_value
[22:36:26] [PASSED] drm_test_check_format_value
[22:36:26] [PASSED] drm_test_check_tmds_char_value
[22:36:26] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[22:36:26] ================= drm_managed (2 subtests) =================
[22:36:26] [PASSED] drm_test_managed_release_action
[22:36:26] [PASSED] drm_test_managed_run_action
[22:36:26] =================== [PASSED] drm_managed ===================
[22:36:26] =================== drm_mm (6 subtests) ====================
[22:36:26] [PASSED] drm_test_mm_init
[22:36:26] [PASSED] drm_test_mm_debug
[22:36:26] [PASSED] drm_test_mm_align32
[22:36:26] [PASSED] drm_test_mm_align64
[22:36:26] [PASSED] drm_test_mm_lowest
[22:36:26] [PASSED] drm_test_mm_highest
[22:36:26] ===================== [PASSED] drm_mm ======================
[22:36:26] ============= drm_modes_analog_tv (4 subtests) =============
[22:36:26] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[22:36:26] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[22:36:26] [PASSED] drm_test_modes_analog_tv_pal_576i
[22:36:26] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[22:36:26] =============== [PASSED] drm_modes_analog_tv ===============
[22:36:26] ============== drm_plane_helper (2 subtests) ===============
[22:36:26] =============== drm_test_check_plane_state  ================
[22:36:26] [PASSED] clipping_simple
[22:36:26] [PASSED] clipping_rotate_reflect
[22:36:26] [PASSED] positioning_simple
[22:36:26] [PASSED] upscaling
[22:36:26] [PASSED] downscaling
[22:36:26] [PASSED] rounding1
[22:36:26] [PASSED] rounding2
[22:36:26] [PASSED] rounding3
[22:36:26] [PASSED] rounding4
[22:36:26] =========== [PASSED] drm_test_check_plane_state ============
[22:36:26] =========== drm_test_check_invalid_plane_state  ============
[22:36:26] [PASSED] positioning_invalid
[22:36:26] [PASSED] upscaling_invalid
[22:36:26] [PASSED] downscaling_invalid
[22:36:26] ======= [PASSED] drm_test_check_invalid_plane_state ========
[22:36:26] ================ [PASSED] drm_plane_helper =================
stty: 'standard input': Inappropriate ioctl for device
[22:36:26] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[22:36:26] ====== drm_test_connector_helper_tv_get_modes_check  =======
[22:36:26] [PASSED] None
[22:36:26] [PASSED] PAL
[22:36:26] [PASSED] NTSC
[22:36:26] [PASSED] Both, NTSC Default
[22:36:26] [PASSED] Both, PAL Default
[22:36:26] [PASSED] Both, NTSC Default, with PAL on command-line
[22:36:26] [PASSED] Both, PAL Default, with NTSC on command-line
[22:36:26] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[22:36:26] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[22:36:26] ================== drm_rect (9 subtests) ===================
[22:36:26] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[22:36:26] [PASSED] drm_test_rect_clip_scaled_not_clipped
[22:36:26] [PASSED] drm_test_rect_clip_scaled_clipped
[22:36:26] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[22:36:26] ================= drm_test_rect_intersect  =================
[22:36:26] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[22:36:26] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[22:36:26] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[22:36:26] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[22:36:26] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[22:36:26] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[22:36:26] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[22:36:26] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[22:36:26] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[22:36:26] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[22:36:26] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[22:36:26] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[22:36:26] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[22:36:26] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[22:36:26] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[22:36:26] ============= [PASSED] drm_test_rect_intersect =============
[22:36:26] ================ drm_test_rect_calc_hscale  ================
[22:36:26] [PASSED] normal use
[22:36:26] [PASSED] out of max range
[22:36:26] [PASSED] out of min range
[22:36:26] [PASSED] zero dst
[22:36:26] [PASSED] negative src
[22:36:26] [PASSED] negative dst
[22:36:26] ============ [PASSED] drm_test_rect_calc_hscale ============
[22:36:26] ================ drm_test_rect_calc_vscale  ================
[22:36:26] [PASSED] normal use
[22:36:26] [PASSED] out of max range
[22:36:26] [PASSED] out of min range
[22:36:26] [PASSED] zero dst
[22:36:26] [PASSED] negative src
[22:36:26] [PASSED] negative dst
[22:36:26] ============ [PASSED] drm_test_rect_calc_vscale ============
[22:36:26] ================== drm_test_rect_rotate  ===================
[22:36:26] [PASSED] reflect-x
[22:36:26] [PASSED] reflect-y
[22:36:26] [PASSED] rotate-0
[22:36:26] [PASSED] rotate-90
[22:36:26] [PASSED] rotate-180
[22:36:26] [PASSED] rotate-270
[22:36:26] ============== [PASSED] drm_test_rect_rotate ===============
[22:36:26] ================ drm_test_rect_rotate_inv  =================
[22:36:26] [PASSED] reflect-x
[22:36:26] [PASSED] reflect-y
[22:36:26] [PASSED] rotate-0
[22:36:26] [PASSED] rotate-90
[22:36:26] [PASSED] rotate-180
[22:36:26] [PASSED] rotate-270
[22:36:26] ============ [PASSED] drm_test_rect_rotate_inv =============
[22:36:26] ==================== [PASSED] drm_rect =====================
[22:36:26] ============================================================
[22:36:26] Testing complete. Ran 511 tests: passed: 511
[22:36:26] Elapsed time: 23.354s total, 1.728s configuring, 21.457s building, 0.149s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[22:36:26] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:36:28] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[22:36:37] Starting KUnit Kernel (1/1)...
[22:36:37] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:36:37] ================= ttm_device (5 subtests) ==================
[22:36:37] [PASSED] ttm_device_init_basic
[22:36:37] [PASSED] ttm_device_init_multiple
[22:36:37] [PASSED] ttm_device_fini_basic
[22:36:37] [PASSED] ttm_device_init_no_vma_man
[22:36:37] ================== ttm_device_init_pools  ==================
[22:36:37] [PASSED] No DMA allocations, no DMA32 required
[22:36:37] [PASSED] DMA allocations, DMA32 required
[22:36:37] [PASSED] No DMA allocations, DMA32 required
[22:36:37] [PASSED] DMA allocations, no DMA32 required
[22:36:37] ============== [PASSED] ttm_device_init_pools ==============
[22:36:37] =================== [PASSED] ttm_device ====================
[22:36:37] ================== ttm_pool (8 subtests) ===================
[22:36:37] ================== ttm_pool_alloc_basic  ===================
[22:36:37] [PASSED] One page
[22:36:37] [PASSED] More than one page
[22:36:37] [PASSED] Above the allocation limit
[22:36:37] [PASSED] One page, with coherent DMA mappings enabled
[22:36:37] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[22:36:37] ============== [PASSED] ttm_pool_alloc_basic ===============
[22:36:37] ============== ttm_pool_alloc_basic_dma_addr  ==============
[22:36:37] [PASSED] One page
[22:36:37] [PASSED] More than one page
[22:36:37] [PASSED] Above the allocation limit
[22:36:37] [PASSED] One page, with coherent DMA mappings enabled
[22:36:37] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[22:36:37] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[22:36:37] [PASSED] ttm_pool_alloc_order_caching_match
[22:36:37] [PASSED] ttm_pool_alloc_caching_mismatch
[22:36:37] [PASSED] ttm_pool_alloc_order_mismatch
[22:36:37] [PASSED] ttm_pool_free_dma_alloc
[22:36:37] [PASSED] ttm_pool_free_no_dma_alloc
[22:36:37] [PASSED] ttm_pool_fini_basic
[22:36:37] ==================== [PASSED] ttm_pool =====================
[22:36:37] ================ ttm_resource (8 subtests) =================
[22:36:37] ================= ttm_resource_init_basic  =================
[22:36:37] [PASSED] Init resource in TTM_PL_SYSTEM
[22:36:37] [PASSED] Init resource in TTM_PL_VRAM
[22:36:37] [PASSED] Init resource in a private placement
[22:36:37] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[22:36:37] ============= [PASSED] ttm_resource_init_basic =============
[22:36:37] [PASSED] ttm_resource_init_pinned
[22:36:37] [PASSED] ttm_resource_fini_basic
[22:36:37] [PASSED] ttm_resource_manager_init_basic
[22:36:37] [PASSED] ttm_resource_manager_usage_basic
[22:36:37] [PASSED] ttm_resource_manager_set_used_basic
[22:36:37] [PASSED] ttm_sys_man_alloc_basic
[22:36:37] [PASSED] ttm_sys_man_free_basic
[22:36:37] ================== [PASSED] ttm_resource ===================
[22:36:37] =================== ttm_tt (10 subtests) ===================
[22:36:37] ==================== ttm_tt_init_basic  ====================
[22:36:37] [PASSED] Page-aligned size
[22:36:37] [PASSED] Extra pages requested
[22:36:37] ================ [PASSED] ttm_tt_init_basic ================
[22:36:37] [PASSED] ttm_tt_init_misaligned
[22:36:37] [PASSED] ttm_tt_fini_basic
[22:36:37] [PASSED] ttm_tt_fini_sg
[22:36:37] [PASSED] ttm_tt_fini_shmem
[22:36:37] [PASSED] ttm_tt_create_basic
[22:36:37] [PASSED] ttm_tt_create_invalid_bo_type
[22:36:37] [PASSED] ttm_tt_create_ttm_exists
[22:36:37] [PASSED] ttm_tt_create_failed
[22:36:37] [PASSED] ttm_tt_destroy_basic
[22:36:37] ===================== [PASSED] ttm_tt ======================
[22:36:37] =================== ttm_bo (14 subtests) ===================
[22:36:37] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[22:36:37] [PASSED] Cannot be interrupted and sleeps
[22:36:37] [PASSED] Cannot be interrupted, locks straight away
[22:36:37] [PASSED] Can be interrupted, sleeps
[22:36:37] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[22:36:37] [PASSED] ttm_bo_reserve_locked_no_sleep
[22:36:37] [PASSED] ttm_bo_reserve_no_wait_ticket
[22:36:37] [PASSED] ttm_bo_reserve_double_resv
[22:36:37] [PASSED] ttm_bo_reserve_interrupted
[22:36:37] [PASSED] ttm_bo_reserve_deadlock
[22:36:37] [PASSED] ttm_bo_unreserve_basic
[22:36:37] [PASSED] ttm_bo_unreserve_pinned
[22:36:37] [PASSED] ttm_bo_unreserve_bulk
[22:36:37] [PASSED] ttm_bo_put_basic
[22:36:37] [PASSED] ttm_bo_put_shared_resv
[22:36:37] [PASSED] ttm_bo_pin_basic
[22:36:37] [PASSED] ttm_bo_pin_unpin_resource
[22:36:37] [PASSED] ttm_bo_multiple_pin_one_unpin
[22:36:37] ===================== [PASSED] ttm_bo ======================
[22:36:37] ============================================================
[22:36:37] Testing complete. Ran 62 tests: passed: 62
[22:36:37] Elapsed time: 10.476s total, 1.699s configuring, 8.607s building, 0.135s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


