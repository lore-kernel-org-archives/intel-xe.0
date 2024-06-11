Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF72C25B76
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 06:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0352D10E154;
	Tue, 11 Jun 2024 06:10:26 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BF210E154;
 Tue, 11 Jun 2024 06:10:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Prepare_Xe_force-wake_code_for?=
 =?utf-8?q?_VFs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Jun 2024 06:10:24 -0000
Message-ID: <171808622468.66199.5511494135095475782@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240610183757.1812-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240610183757.1812-1-michal.wajdeczko@intel.com>
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

Series: Prepare Xe force-wake code for VFs (rev2)
URL   : https://patchwork.freedesktop.org/series/134690/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[06:09:25] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:09:30] Building KUnit Kernel ...
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

[06:09:55] Starting KUnit Kernel (1/1)...
[06:09:55] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[06:09:55] =================== guc_dbm (7 subtests) ===================
[06:09:55] [PASSED] test_empty
[06:09:55] [PASSED] test_default
[06:09:55] ======================== test_size  ========================
[06:09:55] [PASSED] 4
[06:09:55] [PASSED] 8
[06:09:55] [PASSED] 32
[06:09:55] [PASSED] 256
[06:09:55] ==================== [PASSED] test_size ====================
[06:09:55] ======================= test_reuse  ========================
[06:09:55] [PASSED] 4
[06:09:55] [PASSED] 8
[06:09:55] [PASSED] 32
[06:09:55] [PASSED] 256
[06:09:55] =================== [PASSED] test_reuse ====================
[06:09:55] =================== test_range_overlap  ====================
[06:09:55] [PASSED] 4
[06:09:55] [PASSED] 8
[06:09:55] [PASSED] 32
[06:09:55] [PASSED] 256
[06:09:55] =============== [PASSED] test_range_overlap ================
[06:09:55] =================== test_range_compact  ====================
[06:09:55] [PASSED] 4
[06:09:55] [PASSED] 8
[06:09:55] [PASSED] 32
[06:09:55] [PASSED] 256
[06:09:55] =============== [PASSED] test_range_compact ================
[06:09:55] ==================== test_range_spare  =====================
[06:09:55] [PASSED] 4
[06:09:55] [PASSED] 8
[06:09:55] [PASSED] 32
[06:09:55] [PASSED] 256
[06:09:55] ================ [PASSED] test_range_spare =================
[06:09:55] ===================== [PASSED] guc_dbm =====================
[06:09:55] =================== guc_idm (6 subtests) ===================
[06:09:55] [PASSED] bad_init
[06:09:55] [PASSED] no_init
[06:09:55] [PASSED] init_fini
[06:09:55] [PASSED] check_used
[06:09:55] [PASSED] check_quota
[06:09:55] [PASSED] check_all
[06:09:55] ===================== [PASSED] guc_idm =====================
[06:09:55] ================== no_relay (3 subtests) ===================
[06:09:55] [PASSED] xe_drops_guc2pf_if_not_ready
[06:09:55] [PASSED] xe_drops_guc2vf_if_not_ready
[06:09:55] [PASSED] xe_rejects_send_if_not_ready
[06:09:55] ==================== [PASSED] no_relay =====================
[06:09:55] ================== pf_relay (14 subtests) ==================
[06:09:55] [PASSED] pf_rejects_guc2pf_too_short
[06:09:55] [PASSED] pf_rejects_guc2pf_too_long
[06:09:55] [PASSED] pf_rejects_guc2pf_no_payload
[06:09:55] [PASSED] pf_fails_no_payload
[06:09:55] [PASSED] pf_fails_bad_origin
[06:09:55] [PASSED] pf_fails_bad_type
[06:09:55] [PASSED] pf_txn_reports_error
[06:09:55] [PASSED] pf_txn_sends_pf2guc
[06:09:55] [PASSED] pf_sends_pf2guc
[06:09:55] [SKIPPED] pf_loopback_nop
[06:09:55] [SKIPPED] pf_loopback_echo
[06:09:55] [SKIPPED] pf_loopback_fail
[06:09:55] [SKIPPED] pf_loopback_busy
[06:09:55] [SKIPPED] pf_loopback_retry
[06:09:55] ==================== [PASSED] pf_relay =====================
[06:09:55] ================== vf_relay (3 subtests) ===================
[06:09:55] [PASSED] vf_rejects_guc2vf_too_short
[06:09:55] [PASSED] vf_rejects_guc2vf_too_long
[06:09:55] [PASSED] vf_rejects_guc2vf_no_payload
[06:09:55] ==================== [PASSED] vf_relay =====================
[06:09:55] ================= pf_service (11 subtests) =================
[06:09:55] [PASSED] pf_negotiate_any
[06:09:55] [PASSED] pf_negotiate_base_match
[06:09:55] [PASSED] pf_negotiate_base_newer
[06:09:55] [PASSED] pf_negotiate_base_next
[06:09:55] [SKIPPED] pf_negotiate_base_older
[06:09:55] [PASSED] pf_negotiate_base_prev
[06:09:55] [PASSED] pf_negotiate_latest_match
[06:09:55] [PASSED] pf_negotiate_latest_newer
[06:09:55] [PASSED] pf_negotiate_latest_next
[06:09:55] [SKIPPED] pf_negotiate_latest_older
[06:09:55] [SKIPPED] pf_negotiate_latest_prev
[06:09:55] =================== [PASSED] pf_service ====================
[06:09:55] ===================== lmtt (1 subtest) =====================
[06:09:55] ======================== test_ops  =========================
[06:09:55] [PASSED] 2-level
[06:09:55] [PASSED] multi-level
[06:09:55] ==================== [PASSED] test_ops =====================
[06:09:55] ====================== [PASSED] lmtt =======================
[06:09:55] ==================== xe_bo (2 subtests) ====================
[06:09:55] [SKIPPED] xe_ccs_migrate_kunit
[06:09:55] [SKIPPED] xe_bo_evict_kunit
[06:09:55] ===================== [SKIPPED] xe_bo ======================
[06:09:55] ================== xe_dma_buf (1 subtest) ==================
[06:09:55] [SKIPPED] xe_dma_buf_kunit
[06:09:55] =================== [SKIPPED] xe_dma_buf ===================
[06:09:55] ================== xe_migrate (1 subtest) ==================
[06:09:55] [SKIPPED] xe_migrate_sanity_kunit
[06:09:55] =================== [SKIPPED] xe_migrate ===================
[06:09:55] =================== xe_mocs (2 subtests) ===================
[06:09:55] [SKIPPED] xe_live_mocs_kernel_kunit
[06:09:55] [SKIPPED] xe_live_mocs_reset_kunit
[06:09:55] ==================== [SKIPPED] xe_mocs =====================
[06:09:55] ==================== args (11 subtests) ====================
[06:09:55] [PASSED] count_args_test
[06:09:55] [PASSED] call_args_example
[06:09:55] [PASSED] call_args_test
[06:09:55] [PASSED] drop_first_arg_example
[06:09:55] [PASSED] drop_first_arg_test
[06:09:55] [PASSED] first_arg_example
[06:09:55] [PASSED] first_arg_test
[06:09:55] [PASSED] last_arg_example
[06:09:55] [PASSED] last_arg_test
[06:09:55] [PASSED] pick_arg_example
[06:09:55] [PASSED] sep_comma_example
[06:09:55] ====================== [PASSED] args =======================
[06:09:55] =================== xe_pci (2 subtests) ====================
[06:09:55] [PASSED] xe_gmdid_graphics_ip
[06:09:55] [PASSED] xe_gmdid_media_ip
[06:09:55] ===================== [PASSED] xe_pci ======================
[06:09:55] ==================== xe_rtp (1 subtest) ====================
[06:09:55] ================== xe_rtp_process_tests  ===================
[06:09:55] [PASSED] coalesce-same-reg
[06:09:55] [PASSED] no-match-no-add
[06:09:55] [PASSED] no-match-no-add-multiple-rules
[06:09:55] [PASSED] two-regs-two-entries
[06:09:55] [PASSED] clr-one-set-other
[06:09:55] [PASSED] set-field
[06:09:55] [PASSED] conflict-duplicate
[06:09:55] [PASSED] conflict-not-disjoint
[06:09:55] [PASSED] conflict-reg-type
[06:09:55] ============== [PASSED] xe_rtp_process_tests ===============
stty: 'standard input': Inappropriate ioctl for device
[06:09:55] ===================== [PASSED] xe_rtp ======================
[06:09:55] ==================== xe_wa (1 subtest) =====================
[06:09:55] ======================== xe_wa_gt  =========================
[06:09:55] [PASSED] TIGERLAKE (B0)
[06:09:55] [PASSED] DG1 (A0)
[06:09:55] [PASSED] DG1 (B0)
[06:09:55] [PASSED] ALDERLAKE_S (A0)
[06:09:55] [PASSED] ALDERLAKE_S (B0)
[06:09:55] [PASSED] ALDERLAKE_S (C0)
[06:09:55] [PASSED] ALDERLAKE_S (D0)
[06:09:55] [PASSED] ALDERLAKE_P (A0)
[06:09:55] [PASSED] ALDERLAKE_P (B0)
[06:09:55] [PASSED] ALDERLAKE_P (C0)
[06:09:55] [PASSED] ALDERLAKE_S_RPLS (D0)
[06:09:55] [PASSED] ALDERLAKE_P_RPLU (E0)
[06:09:55] [PASSED] DG2_G10 (C0)
[06:09:55] [PASSED] DG2_G11 (B1)
[06:09:55] [PASSED] DG2_G12 (A1)
[06:09:55] [PASSED] METEORLAKE (g:A0, m:A0)
[06:09:55] [PASSED] METEORLAKE (g:A0, m:A0)
[06:09:55] [PASSED] METEORLAKE (g:A0, m:A0)
[06:09:55] [PASSED] LUNARLAKE (g:A0, m:A0)
[06:09:55] [PASSED] LUNARLAKE (g:B0, m:A0)
[06:09:55] ==================== [PASSED] xe_wa_gt =====================
[06:09:55] ====================== [PASSED] xe_wa ======================
[06:09:55] ============================================================
[06:09:55] Testing complete. Ran 109 tests: passed: 95, skipped: 14
[06:09:55] Elapsed time: 29.664s total, 4.219s configuring, 25.174s building, 0.217s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[06:09:55] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:09:57] Building KUnit Kernel ...
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

[06:10:18] Starting KUnit Kernel (1/1)...
[06:10:18] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[06:10:19] ============ drm_test_pick_cmdline (2 subtests) ============
[06:10:19] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[06:10:19] =============== drm_test_pick_cmdline_named  ===============
[06:10:19] [PASSED] NTSC
[06:10:19] [PASSED] NTSC-J
[06:10:19] [PASSED] PAL
[06:10:19] [PASSED] PAL-M
[06:10:19] =========== [PASSED] drm_test_pick_cmdline_named ===========
[06:10:19] ============== [PASSED] drm_test_pick_cmdline ==============
[06:10:19] ================== drm_buddy (7 subtests) ==================
[06:10:19] [PASSED] drm_test_buddy_alloc_limit
[06:10:19] [PASSED] drm_test_buddy_alloc_optimistic
[06:10:19] [PASSED] drm_test_buddy_alloc_pessimistic
[06:10:19] [PASSED] drm_test_buddy_alloc_pathological
[06:10:19] [PASSED] drm_test_buddy_alloc_contiguous
[06:10:19] [PASSED] drm_test_buddy_alloc_clear
[06:10:19] [PASSED] drm_test_buddy_alloc_range_bias
[06:10:19] ==================== [PASSED] drm_buddy ====================
[06:10:19] ============= drm_cmdline_parser (40 subtests) =============
[06:10:19] [PASSED] drm_test_cmdline_force_d_only
[06:10:19] [PASSED] drm_test_cmdline_force_D_only_dvi
[06:10:19] [PASSED] drm_test_cmdline_force_D_only_hdmi
[06:10:19] [PASSED] drm_test_cmdline_force_D_only_not_digital
[06:10:19] [PASSED] drm_test_cmdline_force_e_only
[06:10:19] [PASSED] drm_test_cmdline_res
[06:10:19] [PASSED] drm_test_cmdline_res_vesa
[06:10:19] [PASSED] drm_test_cmdline_res_vesa_rblank
[06:10:19] [PASSED] drm_test_cmdline_res_rblank
[06:10:19] [PASSED] drm_test_cmdline_res_bpp
[06:10:19] [PASSED] drm_test_cmdline_res_refresh
[06:10:19] [PASSED] drm_test_cmdline_res_bpp_refresh
[06:10:19] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[06:10:19] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[06:10:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[06:10:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[06:10:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[06:10:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[06:10:19] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[06:10:19] [PASSED] drm_test_cmdline_res_margins_force_on
[06:10:19] [PASSED] drm_test_cmdline_res_vesa_margins
[06:10:19] [PASSED] drm_test_cmdline_name
[06:10:19] [PASSED] drm_test_cmdline_name_bpp
[06:10:19] [PASSED] drm_test_cmdline_name_option
[06:10:19] [PASSED] drm_test_cmdline_name_bpp_option
[06:10:19] [PASSED] drm_test_cmdline_rotate_0
[06:10:19] [PASSED] drm_test_cmdline_rotate_90
[06:10:19] [PASSED] drm_test_cmdline_rotate_180
[06:10:19] [PASSED] drm_test_cmdline_rotate_270
[06:10:19] [PASSED] drm_test_cmdline_hmirror
[06:10:19] [PASSED] drm_test_cmdline_vmirror
[06:10:19] [PASSED] drm_test_cmdline_margin_options
[06:10:19] [PASSED] drm_test_cmdline_multiple_options
[06:10:19] [PASSED] drm_test_cmdline_bpp_extra_and_option
[06:10:19] [PASSED] drm_test_cmdline_extra_and_option
[06:10:19] [PASSED] drm_test_cmdline_freestanding_options
[06:10:19] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[06:10:19] [PASSED] drm_test_cmdline_panel_orientation
[06:10:19] ================ drm_test_cmdline_invalid  =================
[06:10:19] [PASSED] margin_only
[06:10:19] [PASSED] interlace_only
[06:10:19] [PASSED] res_missing_x
[06:10:19] [PASSED] res_missing_y
[06:10:19] [PASSED] res_bad_y
[06:10:19] [PASSED] res_missing_y_bpp
[06:10:19] [PASSED] res_bad_bpp
[06:10:19] [PASSED] res_bad_refresh
[06:10:19] [PASSED] res_bpp_refresh_force_on_off
[06:10:19] [PASSED] res_invalid_mode
[06:10:19] [PASSED] res_bpp_wrong_place_mode
[06:10:19] [PASSED] name_bpp_refresh
[06:10:19] [PASSED] name_refresh
[06:10:19] [PASSED] name_refresh_wrong_mode
[06:10:19] [PASSED] name_refresh_invalid_mode
[06:10:19] [PASSED] rotate_multiple
[06:10:19] [PASSED] rotate_invalid_val
[06:10:19] [PASSED] rotate_truncated
[06:10:19] [PASSED] invalid_option
[06:10:19] [PASSED] invalid_tv_option
[06:10:19] [PASSED] truncated_tv_option
[06:10:19] ============ [PASSED] drm_test_cmdline_invalid =============
[06:10:19] =============== drm_test_cmdline_tv_options  ===============
[06:10:19] [PASSED] NTSC
[06:10:19] [PASSED] NTSC_443
[06:10:19] [PASSED] NTSC_J
[06:10:19] [PASSED] PAL
[06:10:19] [PASSED] PAL_M
[06:10:19] [PASSED] PAL_N
[06:10:19] [PASSED] SECAM
[06:10:19] =========== [PASSED] drm_test_cmdline_tv_options ===========
[06:10:19] =============== [PASSED] drm_cmdline_parser ================
[06:10:19] ========== drmm_connector_hdmi_init (19 subtests) ==========
[06:10:19] [PASSED] drm_test_connector_hdmi_init_valid
[06:10:19] [PASSED] drm_test_connector_hdmi_init_bpc_8
[06:10:19] [PASSED] drm_test_connector_hdmi_init_bpc_10
[06:10:19] [PASSED] drm_test_connector_hdmi_init_bpc_12
[06:10:19] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[06:10:19] [PASSED] drm_test_connector_hdmi_init_bpc_null
[06:10:19] [PASSED] drm_test_connector_hdmi_init_formats_empty
[06:10:19] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[06:10:19] [PASSED] drm_test_connector_hdmi_init_null_ddc
[06:10:19] [PASSED] drm_test_connector_hdmi_init_null_product
[06:10:19] [PASSED] drm_test_connector_hdmi_init_null_vendor
[06:10:19] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[06:10:19] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[06:10:19] [PASSED] drm_test_connector_hdmi_init_product_valid
[06:10:19] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[06:10:19] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[06:10:19] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[06:10:19] ========= drm_test_connector_hdmi_init_type_valid  =========
[06:10:19] [PASSED] HDMI-A
[06:10:19] [PASSED] HDMI-B
[06:10:19] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[06:10:19] ======== drm_test_connector_hdmi_init_type_invalid  ========
[06:10:19] [PASSED] Unknown
[06:10:19] [PASSED] VGA
[06:10:19] [PASSED] DVI-I
[06:10:19] [PASSED] DVI-D
[06:10:19] [PASSED] DVI-A
[06:10:19] [PASSED] Composite
[06:10:19] [PASSED] SVIDEO
[06:10:19] [PASSED] LVDS
[06:10:19] [PASSED] Component
[06:10:19] [PASSED] DIN
[06:10:19] [PASSED] DP
[06:10:19] [PASSED] TV
[06:10:19] [PASSED] eDP
[06:10:19] [PASSED] Virtual
[06:10:19] [PASSED] DSI
[06:10:19] [PASSED] DPI
[06:10:19] [PASSED] Writeback
[06:10:19] [PASSED] SPI
[06:10:19] [PASSED] USB
[06:10:19] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[06:10:19] ============ [PASSED] drmm_connector_hdmi_init =============
[06:10:19] ============= drmm_connector_init (3 subtests) =============
[06:10:19] [PASSED] drm_test_drmm_connector_init
[06:10:19] [PASSED] drm_test_drmm_connector_init_null_ddc
[06:10:19] ========= drm_test_drmm_connector_init_type_valid  =========
[06:10:19] [PASSED] Unknown
[06:10:19] [PASSED] VGA
[06:10:19] [PASSED] DVI-I
[06:10:19] [PASSED] DVI-D
[06:10:19] [PASSED] DVI-A
[06:10:19] [PASSED] Composite
[06:10:19] [PASSED] SVIDEO
[06:10:19] [PASSED] LVDS
[06:10:19] [PASSED] Component
[06:10:19] [PASSED] DIN
[06:10:19] [PASSED] DP
[06:10:19] [PASSED] HDMI-A
[06:10:19] [PASSED] HDMI-B
[06:10:19] [PASSED] TV
[06:10:19] [PASSED] eDP
[06:10:19] [PASSED] Virtual
[06:10:19] [PASSED] DSI
[06:10:19] [PASSED] DPI
[06:10:19] [PASSED] Writeback
[06:10:19] [PASSED] SPI
[06:10:19] [PASSED] USB
[06:10:19] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[06:10:19] =============== [PASSED] drmm_connector_init ===============
[06:10:19] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[06:10:19] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[06:10:19] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[06:10:19] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[06:10:19] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[06:10:19] ========== drm_test_get_tv_mode_from_name_valid  ===========
[06:10:19] [PASSED] NTSC
[06:10:19] [PASSED] NTSC-443
[06:10:19] [PASSED] NTSC-J
[06:10:19] [PASSED] PAL
[06:10:19] [PASSED] PAL-M
[06:10:19] [PASSED] PAL-N
[06:10:19] [PASSED] SECAM
[06:10:19] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[06:10:19] [PASSED] drm_test_get_tv_mode_from_name_truncated
[06:10:19] ============ [PASSED] drm_get_tv_mode_from_name ============
[06:10:19] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[06:10:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[06:10:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[06:10:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[06:10:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[06:10:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[06:10:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[06:10:19] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[06:10:19] [PASSED] VIC 96
[06:10:19] [PASSED] VIC 97
[06:10:19] [PASSED] VIC 101
[06:10:19] [PASSED] VIC 102
[06:10:19] [PASSED] VIC 106
[06:10:19] [PASSED] VIC 107
[06:10:19] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[06:10:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[06:10:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[06:10:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[06:10:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[06:10:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[06:10:19] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[06:10:19] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[06:10:19] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[06:10:19] [PASSED] Automatic
[06:10:19] [PASSED] Full
[06:10:19] [PASSED] Limited 16:235
[06:10:19] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[06:10:19] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[06:10:19] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[06:10:19] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[06:10:19] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[06:10:19] [PASSED] RGB
[06:10:19] [PASSED] YUV 4:2:0
[06:10:19] [PASSED] YUV 4:2:2
[06:10:19] [PASSED] YUV 4:4:4
[06:10:19] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[06:10:19] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[06:10:19] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[06:10:19] ============= drm_damage_helper (21 subtests) ==============
[06:10:19] [PASSED] drm_test_damage_iter_no_damage
[06:10:19] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[06:10:19] [PASSED] drm_test_damage_iter_no_damage_src_moved
[06:10:19] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[06:10:19] [PASSED] drm_test_damage_iter_no_damage_not_visible
[06:10:19] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[06:10:19] [PASSED] drm_test_damage_iter_no_damage_no_fb
[06:10:19] [PASSED] drm_test_damage_iter_simple_damage
[06:10:19] [PASSED] drm_test_damage_iter_single_damage
[06:10:19] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[06:10:19] [PASSED] drm_test_damage_iter_single_damage_outside_src
[06:10:19] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[06:10:19] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[06:10:19] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[06:10:19] [PASSED] drm_test_damage_iter_single_damage_src_moved
[06:10:19] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[06:10:19] [PASSED] drm_test_damage_iter_damage
[06:10:19] [PASSED] drm_test_damage_iter_damage_one_intersect
[06:10:19] [PASSED] drm_test_damage_iter_damage_one_outside
[06:10:19] [PASSED] drm_test_damage_iter_damage_src_moved
[06:10:19] [PASSED] drm_test_damage_iter_damage_not_visible
[06:10:19] ================ [PASSED] drm_damage_helper ================
[06:10:19] ============== drm_dp_mst_helper (3 subtests) ==============
[06:10:19] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[06:10:19] [PASSED] Clock 154000 BPP 30 DSC disabled
[06:10:19] [PASSED] Clock 234000 BPP 30 DSC disabled
[06:10:19] [PASSED] Clock 297000 BPP 24 DSC disabled
[06:10:19] [PASSED] Clock 332880 BPP 24 DSC enabled
[06:10:19] [PASSED] Clock 324540 BPP 24 DSC enabled
[06:10:19] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[06:10:19] ============== drm_test_dp_mst_calc_pbn_div  ===============
[06:10:19] [PASSED] Link rate 2000000 lane count 4
[06:10:19] [PASSED] Link rate 2000000 lane count 2
[06:10:19] [PASSED] Link rate 2000000 lane count 1
[06:10:19] [PASSED] Link rate 1350000 lane count 4
[06:10:19] [PASSED] Link rate 1350000 lane count 2
[06:10:19] [PASSED] Link rate 1350000 lane count 1
[06:10:19] [PASSED] Link rate 1000000 lane count 4
[06:10:19] [PASSED] Link rate 1000000 lane count 2
[06:10:19] [PASSED] Link rate 1000000 lane count 1
[06:10:19] [PASSED] Link rate 810000 lane count 4
[06:10:19] [PASSED] Link rate 810000 lane count 2
[06:10:19] [PASSED] Link rate 810000 lane count 1
[06:10:19] [PASSED] Link rate 540000 lane count 4
[06:10:19] [PASSED] Link rate 540000 lane count 2
[06:10:19] [PASSED] Link rate 540000 lane count 1
[06:10:19] [PASSED] Link rate 270000 lane count 4
[06:10:19] [PASSED] Link rate 270000 lane count 2
[06:10:19] [PASSED] Link rate 270000 lane count 1
[06:10:19] [PASSED] Link rate 162000 lane count 4
[06:10:19] [PASSED] Link rate 162000 lane count 2
[06:10:19] [PASSED] Link rate 162000 lane count 1
[06:10:19] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[06:10:19] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[06:10:19] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[06:10:19] [PASSED] DP_POWER_UP_PHY with port number
[06:10:19] [PASSED] DP_POWER_DOWN_PHY with port number
[06:10:19] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[06:10:19] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[06:10:19] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[06:10:19] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[06:10:19] [PASSED] DP_QUERY_PAYLOAD with port number
[06:10:19] [PASSED] DP_QUERY_PAYLOAD with VCPI
[06:10:19] [PASSED] DP_REMOTE_DPCD_READ with port number
[06:10:19] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[06:10:19] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[06:10:19] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[06:10:19] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[06:10:19] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[06:10:19] [PASSED] DP_REMOTE_I2C_READ with port number
[06:10:19] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[06:10:19] [PASSED] DP_REMOTE_I2C_READ with transactions array
[06:10:19] [PASSED] DP_REMOTE_I2C_WRITE with port number
[06:10:19] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[06:10:19] [PASSED] DP_REMOTE_I2C_WRITE with data array
[06:10:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[06:10:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[06:10:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[06:10:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[06:10:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[06:10:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[06:10:19] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[06:10:19] ================ [PASSED] drm_dp_mst_helper ================
[06:10:19] ================== drm_exec (7 subtests) ===================
[06:10:19] [PASSED] sanitycheck
[06:10:19] [PASSED] test_lock
[06:10:19] [PASSED] test_lock_unlock
[06:10:19] [PASSED] test_duplicates
[06:10:19] [PASSED] test_prepare
[06:10:19] [PASSED] test_prepare_array
[06:10:19] [PASSED] test_multiple_loops
[06:10:19] ==================== [PASSED] drm_exec =====================
[06:10:19] =========== drm_format_helper_test (17 subtests) ===========
[06:10:19] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[06:10:19] [PASSED] single_pixel_source_buffer
[06:10:19] [PASSED] single_pixel_clip_rectangle
[06:10:19] [PASSED] well_known_colors
[06:10:19] [PASSED] destination_pitch
[06:10:19] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[06:10:19] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[06:10:19] [PASSED] single_pixel_source_buffer
[06:10:19] [PASSED] single_pixel_clip_rectangle
[06:10:19] [PASSED] well_known_colors
[06:10:19] [PASSED] destination_pitch
[06:10:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[06:10:19] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[06:10:19] [PASSED] single_pixel_source_buffer
[06:10:19] [PASSED] single_pixel_clip_rectangle
[06:10:19] [PASSED] well_known_colors
[06:10:19] [PASSED] destination_pitch
[06:10:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[06:10:19] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[06:10:19] [PASSED] single_pixel_source_buffer
[06:10:19] [PASSED] single_pixel_clip_rectangle
[06:10:19] [PASSED] well_known_colors
[06:10:19] [PASSED] destination_pitch
[06:10:19] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[06:10:19] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[06:10:19] [PASSED] single_pixel_source_buffer
[06:10:19] [PASSED] single_pixel_clip_rectangle
[06:10:19] [PASSED] well_known_colors
[06:10:19] [PASSED] destination_pitch
[06:10:19] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[06:10:19] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[06:10:19] [PASSED] single_pixel_source_buffer
[06:10:19] [PASSED] single_pixel_clip_rectangle
[06:10:19] [PASSED] well_known_colors
[06:10:19] [PASSED] destination_pitch
[06:10:19] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[06:10:19] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[06:10:19] [PASSED] single_pixel_source_buffer
[06:10:19] [PASSED] single_pixel_clip_rectangle
[06:10:19] [PASSED] well_known_colors
[06:10:19] [PASSED] destination_pitch
[06:10:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[06:10:19] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[06:10:19] [PASSED] single_pixel_source_buffer
[06:10:19] [PASSED] single_pixel_clip_rectangle
[06:10:19] [PASSED] well_known_colors
[06:10:19] [PASSED] destination_pitch
[06:10:19] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[06:10:19] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[06:10:19] [PASSED] single_pixel_source_buffer
[06:10:19] [PASSED] single_pixel_clip_rectangle
[06:10:19] [PASSED] well_known_colors
[06:10:19] [PASSED] destination_pitch
[06:10:19] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[06:10:19] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[06:10:19] [PASSED] single_pixel_source_buffer
[06:10:19] [PASSED] single_pixel_clip_rectangle
[06:10:19] [PASSED] well_known_colors
[06:10:19] [PASSED] destination_pitch
[06:10:19] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[06:10:19] ============== drm_test_fb_xrgb8888_to_mono  ===============
[06:10:19] [PASSED] single_pixel_source_buffer
[06:10:19] [PASSED] single_pixel_clip_rectangle
[06:10:19] [PASSED] well_known_colors
[06:10:19] [PASSED] destination_pitch
[06:10:19] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[06:10:19] ==================== drm_test_fb_swab  =====================
[06:10:19] [PASSED] single_pixel_source_buffer
[06:10:19] [PASSED] single_pixel_clip_rectangle
[06:10:19] [PASSED] well_known_colors
[06:10:19] [PASSED] destination_pitch
[06:10:19] ================ [PASSED] drm_test_fb_swab =================
[06:10:19] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[06:10:19] [PASSED] single_pixel_source_buffer
[06:10:19] [PASSED] single_pixel_clip_rectangle
[06:10:19] [PASSED] well_known_colors
[06:10:19] [PASSED] destination_pitch
[06:10:19] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[06:10:19] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[06:10:19] [PASSED] single_pixel_source_buffer
[06:10:19] [PASSED] single_pixel_clip_rectangle
[06:10:19] [PASSED] well_known_colors
[06:10:19] [PASSED] destination_pitch
[06:10:19] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[06:10:19] ================= drm_test_fb_clip_offset  =================
[06:10:19] [PASSED] pass through
[06:10:19] [PASSED] horizontal offset
[06:10:19] [PASSED] vertical offset
[06:10:19] [PASSED] horizontal and vertical offset
[06:10:19] [PASSED] horizontal offset (custom pitch)
[06:10:19] [PASSED] vertical offset (custom pitch)
[06:10:19] [PASSED] horizontal and vertical offset (custom pitch)
[06:10:19] ============= [PASSED] drm_test_fb_clip_offset =============
[06:10:19] ============== drm_test_fb_build_fourcc_list  ==============
[06:10:19] [PASSED] no native formats
[06:10:19] [PASSED] XRGB8888 as native format
[06:10:19] [PASSED] remove duplicates
[06:10:19] [PASSED] convert alpha formats
[06:10:19] [PASSED] random formats
[06:10:19] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[06:10:19] =================== drm_test_fb_memcpy  ====================
[06:10:19] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[06:10:19] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[06:10:19] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[06:10:19] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[06:10:19] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[06:10:19] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[06:10:19] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[06:10:19] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[06:10:19] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[06:10:19] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[06:10:19] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[06:10:19] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[06:10:19] =============== [PASSED] drm_test_fb_memcpy ================
[06:10:19] ============= [PASSED] drm_format_helper_test ==============
[06:10:19] ================= drm_format (18 subtests) =================
[06:10:19] [PASSED] drm_test_format_block_width_invalid
[06:10:19] [PASSED] drm_test_format_block_width_one_plane
[06:10:19] [PASSED] drm_test_format_block_width_two_plane
[06:10:19] [PASSED] drm_test_format_block_width_three_plane
[06:10:19] [PASSED] drm_test_format_block_width_tiled
[06:10:19] [PASSED] drm_test_format_block_height_invalid
[06:10:19] [PASSED] drm_test_format_block_height_one_plane
[06:10:19] [PASSED] drm_test_format_block_height_two_plane
[06:10:19] [PASSED] drm_test_format_block_height_three_plane
[06:10:19] [PASSED] drm_test_format_block_height_tiled
[06:10:19] [PASSED] drm_test_format_min_pitch_invalid
[06:10:19] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[06:10:19] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[06:10:19] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[06:10:19] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[06:10:19] [PASSED] drm_test_format_min_pitch_two_plane
[06:10:19] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[06:10:19] [PASSED] drm_test_format_min_pitch_tiled
[06:10:19] =================== [PASSED] drm_format ====================
[06:10:19] =============== drm_framebuffer (1 subtest) ================
[06:10:19] =============== drm_test_framebuffer_create  ===============
[06:10:19] [PASSED] ABGR8888 normal sizes
[06:10:19] [PASSED] ABGR8888 max sizes
[06:10:19] [PASSED] ABGR8888 pitch greater than min required
[06:10:19] [PASSED] ABGR8888 pitch less than min required
[06:10:19] [PASSED] ABGR8888 Invalid width
[06:10:19] [PASSED] ABGR8888 Invalid buffer handle
[06:10:19] [PASSED] No pixel format
[06:10:19] [PASSED] ABGR8888 Width 0
[06:10:19] [PASSED] ABGR8888 Height 0
[06:10:19] [PASSED] ABGR8888 Out of bound height * pitch combination
[06:10:19] [PASSED] ABGR8888 Large buffer offset
[06:10:19] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[06:10:19] [PASSED] ABGR8888 Valid buffer modifier
[06:10:19] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[06:10:19] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[06:10:19] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[06:10:19] [PASSED] NV12 Normal sizes
[06:10:19] [PASSED] NV12 Max sizes
[06:10:19] [PASSED] NV12 Invalid pitch
[06:10:19] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[06:10:19] [PASSED] NV12 different  modifier per-plane
[06:10:19] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[06:10:19] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[06:10:19] [PASSED] NV12 Modifier for inexistent plane
[06:10:19] [PASSED] NV12 Handle for inexistent plane
[06:10:19] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[06:10:19] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[06:10:19] [PASSED] YVU420 Normal sizes
[06:10:19] [PASSED] YVU420 Max sizes
[06:10:19] [PASSED] YVU420 Invalid pitch
[06:10:19] [PASSED] YVU420 Different pitches
[06:10:19] [PASSED] YVU420 Different buffer offsets/pitches
[06:10:19] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[06:10:19] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[06:10:19] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[06:10:19] [PASSED] YVU420 Valid modifier
[06:10:19] [PASSED] YVU420 Different modifiers per plane
[06:10:19] [PASSED] YVU420 Modifier for inexistent plane
[06:10:19] [PASSED] X0L2 Normal sizes
[06:10:19] [PASSED] X0L2 Max sizes
[06:10:19] [PASSED] X0L2 Invalid pitch
[06:10:19] [PASSED] X0L2 Pitch greater than minimum required
[06:10:19] [PASSED] X0L2 Handle for inexistent plane
[06:10:19] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[06:10:19] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[06:10:19] [PASSED] X0L2 Valid modifier
[06:10:19] [PASSED] X0L2 Modifier for inexistent plane
[06:10:19] =========== [PASSED] drm_test_framebuffer_create ===========
[06:10:19] ================= [PASSED] drm_framebuffer =================
[06:10:19] ================ drm_gem_shmem (8 subtests) ================
[06:10:19] [PASSED] drm_gem_shmem_test_obj_create
[06:10:19] [PASSED] drm_gem_shmem_test_obj_create_private
[06:10:19] [PASSED] drm_gem_shmem_test_pin_pages
[06:10:19] [PASSED] drm_gem_shmem_test_vmap
[06:10:19] [PASSED] drm_gem_shmem_test_get_pages_sgt
[06:10:19] [PASSED] drm_gem_shmem_test_get_sg_table
[06:10:19] [PASSED] drm_gem_shmem_test_madvise
[06:10:19] [PASSED] drm_gem_shmem_test_purge
[06:10:19] ================== [PASSED] drm_gem_shmem ==================
[06:10:19] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[06:10:19] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[06:10:19] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[06:10:19] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[06:10:19] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[06:10:19] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[06:10:19] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[06:10:19] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[06:10:19] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[06:10:19] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[06:10:19] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[06:10:19] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[06:10:19] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[06:10:19] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[06:10:19] [PASSED] drm_test_check_output_bpc_dvi
[06:10:19] [PASSED] drm_test_check_output_bpc_format_vic_1
[06:10:19] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[06:10:19] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[06:10:19] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[06:10:19] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[06:10:19] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[06:10:19] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[06:10:19] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[06:10:19] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[06:10:19] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[06:10:19] [PASSED] drm_test_check_broadcast_rgb_value
[06:10:19] [PASSED] drm_test_check_bpc_8_value
[06:10:19] [PASSED] drm_test_check_bpc_10_value
[06:10:19] [PASSED] drm_test_check_bpc_12_value
[06:10:19] [PASSED] drm_test_check_format_value
[06:10:19] [PASSED] drm_test_check_tmds_char_value
[06:10:19] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[06:10:19] ================= drm_managed (2 subtests) =================
[06:10:19] [PASSED] drm_test_managed_release_action
[06:10:19] [PASSED] drm_test_managed_run_action
[06:10:19] =================== [PASSED] drm_managed ===================
[06:10:19] =================== drm_mm (6 subtests) ====================
[06:10:19] [PASSED] drm_test_mm_init
[06:10:19] [PASSED] drm_test_mm_debug
[06:10:19] [PASSED] drm_test_mm_align32
[06:10:19] [PASSED] drm_test_mm_align64
[06:10:19] [PASSED] drm_test_mm_lowest
[06:10:19] [PASSED] drm_test_mm_highest
[06:10:19] ===================== [PASSED] drm_mm ======================
[06:10:19] ============= drm_modes_analog_tv (4 subtests) =============
[06:10:19] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[06:10:19] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[06:10:19] [PASSED] drm_test_modes_analog_tv_pal_576i
[06:10:19] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[06:10:19] =============== [PASSED] drm_modes_analog_tv ===============
[06:10:19] ============== drm_plane_helper (2 subtests) ===============
[06:10:19] =============== drm_test_check_plane_state  ================
[06:10:19] [PASSED] clipping_simple
[06:10:19] [PASSED] clipping_rotate_reflect
[06:10:19] [PASSED] positioning_simple
[06:10:19] [PASSED] upscaling
[06:10:19] [PASSED] downscaling
[06:10:19] [PASSED] rounding1
[06:10:19] [PASSED] rounding2
[06:10:19] [PASSED] rounding3
[06:10:19] [PASSED] rounding4
[06:10:19] =========== [PASSED] drm_test_check_plane_state ============
[06:10:19] =========== drm_test_check_invalid_plane_state  ============
[06:10:19] [PASSED] positioning_invalid
[06:10:19] [PASSED] upscaling_invalid
[06:10:19] [PASSED] downscaling_invalid
[06:10:19] ======= [PASSED] drm_test_check_invalid_plane_state ========
[06:10:19] ================ [PASSED] drm_plane_helper =================
stty: 'standard input': Inappropriate ioctl for device
[06:10:19] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[06:10:19] ====== drm_test_connector_helper_tv_get_modes_check  =======
[06:10:19] [PASSED] None
[06:10:19] [PASSED] PAL
[06:10:19] [PASSED] NTSC
[06:10:19] [PASSED] Both, NTSC Default
[06:10:19] [PASSED] Both, PAL Default
[06:10:19] [PASSED] Both, NTSC Default, with PAL on command-line
[06:10:19] [PASSED] Both, PAL Default, with NTSC on command-line
[06:10:19] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[06:10:19] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[06:10:19] ================== drm_rect (9 subtests) ===================
[06:10:19] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[06:10:19] [PASSED] drm_test_rect_clip_scaled_not_clipped
[06:10:19] [PASSED] drm_test_rect_clip_scaled_clipped
[06:10:19] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[06:10:19] ================= drm_test_rect_intersect  =================
[06:10:19] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[06:10:19] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[06:10:19] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[06:10:19] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[06:10:19] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[06:10:19] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[06:10:19] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[06:10:19] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[06:10:19] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[06:10:19] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[06:10:19] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[06:10:19] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[06:10:19] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[06:10:19] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[06:10:19] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[06:10:19] ============= [PASSED] drm_test_rect_intersect =============
[06:10:19] ================ drm_test_rect_calc_hscale  ================
[06:10:19] [PASSED] normal use
[06:10:19] [PASSED] out of max range
[06:10:19] [PASSED] out of min range
[06:10:19] [PASSED] zero dst
[06:10:19] [PASSED] negative src
[06:10:19] [PASSED] negative dst
[06:10:19] ============ [PASSED] drm_test_rect_calc_hscale ============
[06:10:19] ================ drm_test_rect_calc_vscale  ================
[06:10:19] [PASSED] normal use
[06:10:19] [PASSED] out of max range
[06:10:19] [PASSED] out of min range
[06:10:19] [PASSED] zero dst
[06:10:19] [PASSED] negative src
[06:10:19] [PASSED] negative dst
[06:10:19] ============ [PASSED] drm_test_rect_calc_vscale ============
[06:10:19] ================== drm_test_rect_rotate  ===================
[06:10:19] [PASSED] reflect-x
[06:10:19] [PASSED] reflect-y
[06:10:19] [PASSED] rotate-0
[06:10:19] [PASSED] rotate-90
[06:10:19] [PASSED] rotate-180
[06:10:19] [PASSED] rotate-270
[06:10:19] ============== [PASSED] drm_test_rect_rotate ===============
[06:10:19] ================ drm_test_rect_rotate_inv  =================
[06:10:19] [PASSED] reflect-x
[06:10:19] [PASSED] reflect-y
[06:10:19] [PASSED] rotate-0
[06:10:19] [PASSED] rotate-90
[06:10:19] [PASSED] rotate-180
[06:10:19] [PASSED] rotate-270
[06:10:19] ============ [PASSED] drm_test_rect_rotate_inv =============
[06:10:19] ==================== [PASSED] drm_rect =====================
[06:10:19] ============================================================
[06:10:19] Testing complete. Ran 511 tests: passed: 511
[06:10:19] Elapsed time: 23.482s total, 1.712s configuring, 21.586s building, 0.181s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


