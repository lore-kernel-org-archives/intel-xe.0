Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2712C2BA15
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 15:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C873891D7;
	Mon, 17 Jun 2024 15:53:33 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9235891D7;
 Mon, 17 Jun 2024 15:53:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/vf=3A_Don=27t_touch_GuC?=
 =?utf-8?q?_irq_registers_if_using_memory_irqs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Jun 2024 15:53:32 -0000
Message-ID: <171863961268.97967.12072318580403802481@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240617154736.685-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240617154736.685-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/vf: Don't touch GuC irq registers if using memory irqs
URL   : https://patchwork.freedesktop.org/series/134962/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[15:52:26] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:52:30] Building KUnit Kernel ...
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

[15:52:56] Starting KUnit Kernel (1/1)...
[15:52:56] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[15:52:56] =================== guc_dbm (7 subtests) ===================
[15:52:56] [PASSED] test_empty
[15:52:56] [PASSED] test_default
[15:52:56] ======================== test_size  ========================
[15:52:56] [PASSED] 4
[15:52:56] [PASSED] 8
[15:52:56] [PASSED] 32
[15:52:56] [PASSED] 256
[15:52:56] ==================== [PASSED] test_size ====================
[15:52:56] ======================= test_reuse  ========================
[15:52:56] [PASSED] 4
[15:52:56] [PASSED] 8
[15:52:56] [PASSED] 32
[15:52:56] [PASSED] 256
[15:52:56] =================== [PASSED] test_reuse ====================
[15:52:56] =================== test_range_overlap  ====================
[15:52:56] [PASSED] 4
[15:52:56] [PASSED] 8
[15:52:56] [PASSED] 32
[15:52:56] [PASSED] 256
[15:52:56] =============== [PASSED] test_range_overlap ================
[15:52:56] =================== test_range_compact  ====================
[15:52:56] [PASSED] 4
[15:52:56] [PASSED] 8
[15:52:56] [PASSED] 32
[15:52:56] [PASSED] 256
[15:52:56] =============== [PASSED] test_range_compact ================
[15:52:56] ==================== test_range_spare  =====================
[15:52:56] [PASSED] 4
[15:52:56] [PASSED] 8
[15:52:56] [PASSED] 32
[15:52:56] [PASSED] 256
[15:52:56] ================ [PASSED] test_range_spare =================
[15:52:56] ===================== [PASSED] guc_dbm =====================
[15:52:56] =================== guc_idm (6 subtests) ===================
[15:52:56] [PASSED] bad_init
[15:52:56] [PASSED] no_init
[15:52:56] [PASSED] init_fini
[15:52:56] [PASSED] check_used
[15:52:56] [PASSED] check_quota
[15:52:56] [PASSED] check_all
[15:52:56] ===================== [PASSED] guc_idm =====================
[15:52:56] ================== no_relay (3 subtests) ===================
[15:52:56] [PASSED] xe_drops_guc2pf_if_not_ready
[15:52:56] [PASSED] xe_drops_guc2vf_if_not_ready
[15:52:56] [PASSED] xe_rejects_send_if_not_ready
[15:52:56] ==================== [PASSED] no_relay =====================
[15:52:56] ================== pf_relay (14 subtests) ==================
[15:52:56] [PASSED] pf_rejects_guc2pf_too_short
[15:52:56] [PASSED] pf_rejects_guc2pf_too_long
[15:52:56] [PASSED] pf_rejects_guc2pf_no_payload
[15:52:56] [PASSED] pf_fails_no_payload
[15:52:56] [PASSED] pf_fails_bad_origin
[15:52:56] [PASSED] pf_fails_bad_type
[15:52:56] [PASSED] pf_txn_reports_error
[15:52:56] [PASSED] pf_txn_sends_pf2guc
[15:52:56] [PASSED] pf_sends_pf2guc
[15:52:56] [SKIPPED] pf_loopback_nop
[15:52:56] [SKIPPED] pf_loopback_echo
[15:52:56] [SKIPPED] pf_loopback_fail
[15:52:56] [SKIPPED] pf_loopback_busy
[15:52:56] [SKIPPED] pf_loopback_retry
[15:52:56] ==================== [PASSED] pf_relay =====================
[15:52:56] ================== vf_relay (3 subtests) ===================
[15:52:56] [PASSED] vf_rejects_guc2vf_too_short
[15:52:56] [PASSED] vf_rejects_guc2vf_too_long
[15:52:56] [PASSED] vf_rejects_guc2vf_no_payload
[15:52:56] ==================== [PASSED] vf_relay =====================
[15:52:56] ================= pf_service (11 subtests) =================
[15:52:56] [PASSED] pf_negotiate_any
[15:52:56] [PASSED] pf_negotiate_base_match
[15:52:56] [PASSED] pf_negotiate_base_newer
[15:52:56] [PASSED] pf_negotiate_base_next
[15:52:56] [SKIPPED] pf_negotiate_base_older
[15:52:56] [PASSED] pf_negotiate_base_prev
[15:52:56] [PASSED] pf_negotiate_latest_match
[15:52:56] [PASSED] pf_negotiate_latest_newer
[15:52:56] [PASSED] pf_negotiate_latest_next
[15:52:56] [SKIPPED] pf_negotiate_latest_older
[15:52:56] [SKIPPED] pf_negotiate_latest_prev
[15:52:56] =================== [PASSED] pf_service ====================
[15:52:56] ===================== lmtt (1 subtest) =====================
[15:52:56] ======================== test_ops  =========================
[15:52:56] [PASSED] 2-level
[15:52:56] [PASSED] multi-level
[15:52:56] ==================== [PASSED] test_ops =====================
[15:52:56] ====================== [PASSED] lmtt =======================
[15:52:56] ==================== xe_bo (2 subtests) ====================
[15:52:56] [SKIPPED] xe_ccs_migrate_kunit
[15:52:56] [SKIPPED] xe_bo_evict_kunit
[15:52:56] ===================== [SKIPPED] xe_bo ======================
[15:52:56] ================== xe_dma_buf (1 subtest) ==================
[15:52:56] [SKIPPED] xe_dma_buf_kunit
[15:52:56] =================== [SKIPPED] xe_dma_buf ===================
[15:52:56] ================== xe_migrate (1 subtest) ==================
[15:52:56] [SKIPPED] xe_migrate_sanity_kunit
[15:52:56] =================== [SKIPPED] xe_migrate ===================
[15:52:56] =================== xe_mocs (2 subtests) ===================
[15:52:56] [SKIPPED] xe_live_mocs_kernel_kunit
[15:52:56] [SKIPPED] xe_live_mocs_reset_kunit
[15:52:56] ==================== [SKIPPED] xe_mocs =====================
[15:52:56] ==================== args (11 subtests) ====================
[15:52:56] [PASSED] count_args_test
[15:52:56] [PASSED] call_args_example
[15:52:56] [PASSED] call_args_test
[15:52:56] [PASSED] drop_first_arg_example
[15:52:56] [PASSED] drop_first_arg_test
[15:52:56] [PASSED] first_arg_example
[15:52:56] [PASSED] first_arg_test
[15:52:56] [PASSED] last_arg_example
[15:52:56] [PASSED] last_arg_test
[15:52:56] [PASSED] pick_arg_example
[15:52:56] [PASSED] sep_comma_example
[15:52:56] ====================== [PASSED] args =======================
[15:52:56] =================== xe_pci (2 subtests) ====================
[15:52:56] [PASSED] xe_gmdid_graphics_ip
[15:52:56] [PASSED] xe_gmdid_media_ip
[15:52:56] ===================== [PASSED] xe_pci ======================
[15:52:56] ==================== xe_rtp (1 subtest) ====================
[15:52:56] ================== xe_rtp_process_tests  ===================
[15:52:56] [PASSED] coalesce-same-reg
[15:52:56] [PASSED] no-match-no-add
[15:52:56] [PASSED] no-match-no-add-multiple-rules
[15:52:56] [PASSED] two-regs-two-entries
[15:52:56] [PASSED] clr-one-set-other
[15:52:56] [PASSED] set-field
[15:52:56] [PASSED] conflict-duplicate
[15:52:56] [PASSED] conflict-not-disjoint
[15:52:56] [PASSED] conflict-reg-type
[15:52:56] ============== [PASSED] xe_rtp_process_tests ===============
stty: 'standard input': Inappropriate ioctl for device
[15:52:56] ===================== [PASSED] xe_rtp ======================
[15:52:56] ==================== xe_wa (1 subtest) =====================
[15:52:56] ======================== xe_wa_gt  =========================
[15:52:56] [PASSED] TIGERLAKE (B0)
[15:52:56] [PASSED] DG1 (A0)
[15:52:56] [PASSED] DG1 (B0)
[15:52:56] [PASSED] ALDERLAKE_S (A0)
[15:52:56] [PASSED] ALDERLAKE_S (B0)
[15:52:56] [PASSED] ALDERLAKE_S (C0)
[15:52:56] [PASSED] ALDERLAKE_S (D0)
[15:52:56] [PASSED] ALDERLAKE_P (A0)
[15:52:56] [PASSED] ALDERLAKE_P (B0)
[15:52:56] [PASSED] ALDERLAKE_P (C0)
[15:52:56] [PASSED] ALDERLAKE_S_RPLS (D0)
[15:52:56] [PASSED] ALDERLAKE_P_RPLU (E0)
[15:52:56] [PASSED] DG2_G10 (C0)
[15:52:56] [PASSED] DG2_G11 (B1)
[15:52:56] [PASSED] DG2_G12 (A1)
[15:52:56] [PASSED] METEORLAKE (g:A0, m:A0)
[15:52:56] [PASSED] METEORLAKE (g:A0, m:A0)
[15:52:56] [PASSED] METEORLAKE (g:A0, m:A0)
[15:52:56] [PASSED] LUNARLAKE (g:A0, m:A0)
[15:52:56] [PASSED] LUNARLAKE (g:B0, m:A0)
[15:52:56] ==================== [PASSED] xe_wa_gt =====================
[15:52:56] ====================== [PASSED] xe_wa ======================
[15:52:56] ============================================================
[15:52:56] Testing complete. Ran 109 tests: passed: 95, skipped: 14
[15:52:56] Elapsed time: 29.880s total, 4.250s configuring, 25.360s building, 0.228s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[15:52:56] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:52:58] Building KUnit Kernel ...
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

[15:53:19] Starting KUnit Kernel (1/1)...
[15:53:19] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[15:53:19] ============ drm_test_pick_cmdline (2 subtests) ============
[15:53:19] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[15:53:19] =============== drm_test_pick_cmdline_named  ===============
[15:53:19] [PASSED] NTSC
[15:53:19] [PASSED] NTSC-J
[15:53:19] [PASSED] PAL
[15:53:19] [PASSED] PAL-M
[15:53:19] =========== [PASSED] drm_test_pick_cmdline_named ===========
[15:53:19] ============== [PASSED] drm_test_pick_cmdline ==============
[15:53:19] ================== drm_buddy (7 subtests) ==================
[15:53:19] [PASSED] drm_test_buddy_alloc_limit
[15:53:19] [PASSED] drm_test_buddy_alloc_optimistic
[15:53:19] [PASSED] drm_test_buddy_alloc_pessimistic
[15:53:19] [PASSED] drm_test_buddy_alloc_pathological
[15:53:19] [PASSED] drm_test_buddy_alloc_contiguous
[15:53:19] [PASSED] drm_test_buddy_alloc_clear
[15:53:19] [PASSED] drm_test_buddy_alloc_range_bias
[15:53:19] ==================== [PASSED] drm_buddy ====================
[15:53:19] ============= drm_cmdline_parser (40 subtests) =============
[15:53:19] [PASSED] drm_test_cmdline_force_d_only
[15:53:19] [PASSED] drm_test_cmdline_force_D_only_dvi
[15:53:19] [PASSED] drm_test_cmdline_force_D_only_hdmi
[15:53:19] [PASSED] drm_test_cmdline_force_D_only_not_digital
[15:53:19] [PASSED] drm_test_cmdline_force_e_only
[15:53:19] [PASSED] drm_test_cmdline_res
[15:53:19] [PASSED] drm_test_cmdline_res_vesa
[15:53:19] [PASSED] drm_test_cmdline_res_vesa_rblank
[15:53:19] [PASSED] drm_test_cmdline_res_rblank
[15:53:19] [PASSED] drm_test_cmdline_res_bpp
[15:53:19] [PASSED] drm_test_cmdline_res_refresh
[15:53:19] [PASSED] drm_test_cmdline_res_bpp_refresh
[15:53:19] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[15:53:19] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[15:53:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[15:53:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[15:53:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[15:53:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[15:53:19] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[15:53:19] [PASSED] drm_test_cmdline_res_margins_force_on
[15:53:19] [PASSED] drm_test_cmdline_res_vesa_margins
[15:53:19] [PASSED] drm_test_cmdline_name
[15:53:19] [PASSED] drm_test_cmdline_name_bpp
[15:53:19] [PASSED] drm_test_cmdline_name_option
[15:53:19] [PASSED] drm_test_cmdline_name_bpp_option
[15:53:19] [PASSED] drm_test_cmdline_rotate_0
[15:53:19] [PASSED] drm_test_cmdline_rotate_90
[15:53:19] [PASSED] drm_test_cmdline_rotate_180
[15:53:19] [PASSED] drm_test_cmdline_rotate_270
[15:53:19] [PASSED] drm_test_cmdline_hmirror
[15:53:19] [PASSED] drm_test_cmdline_vmirror
[15:53:19] [PASSED] drm_test_cmdline_margin_options
[15:53:19] [PASSED] drm_test_cmdline_multiple_options
[15:53:19] [PASSED] drm_test_cmdline_bpp_extra_and_option
[15:53:19] [PASSED] drm_test_cmdline_extra_and_option
[15:53:19] [PASSED] drm_test_cmdline_freestanding_options
[15:53:19] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[15:53:19] [PASSED] drm_test_cmdline_panel_orientation
[15:53:19] ================ drm_test_cmdline_invalid  =================
[15:53:19] [PASSED] margin_only
[15:53:19] [PASSED] interlace_only
[15:53:19] [PASSED] res_missing_x
[15:53:19] [PASSED] res_missing_y
[15:53:19] [PASSED] res_bad_y
[15:53:19] [PASSED] res_missing_y_bpp
[15:53:19] [PASSED] res_bad_bpp
[15:53:19] [PASSED] res_bad_refresh
[15:53:19] [PASSED] res_bpp_refresh_force_on_off
[15:53:19] [PASSED] res_invalid_mode
[15:53:19] [PASSED] res_bpp_wrong_place_mode
[15:53:19] [PASSED] name_bpp_refresh
[15:53:19] [PASSED] name_refresh
[15:53:19] [PASSED] name_refresh_wrong_mode
[15:53:19] [PASSED] name_refresh_invalid_mode
[15:53:19] [PASSED] rotate_multiple
[15:53:19] [PASSED] rotate_invalid_val
[15:53:19] [PASSED] rotate_truncated
[15:53:19] [PASSED] invalid_option
[15:53:19] [PASSED] invalid_tv_option
[15:53:19] [PASSED] truncated_tv_option
[15:53:19] ============ [PASSED] drm_test_cmdline_invalid =============
[15:53:19] =============== drm_test_cmdline_tv_options  ===============
[15:53:19] [PASSED] NTSC
[15:53:19] [PASSED] NTSC_443
[15:53:19] [PASSED] NTSC_J
[15:53:19] [PASSED] PAL
[15:53:19] [PASSED] PAL_M
[15:53:19] [PASSED] PAL_N
[15:53:19] [PASSED] SECAM
[15:53:19] =========== [PASSED] drm_test_cmdline_tv_options ===========
[15:53:19] =============== [PASSED] drm_cmdline_parser ================
[15:53:19] ========== drmm_connector_hdmi_init (19 subtests) ==========
[15:53:19] [PASSED] drm_test_connector_hdmi_init_valid
[15:53:19] [PASSED] drm_test_connector_hdmi_init_bpc_8
[15:53:19] [PASSED] drm_test_connector_hdmi_init_bpc_10
[15:53:19] [PASSED] drm_test_connector_hdmi_init_bpc_12
[15:53:19] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[15:53:19] [PASSED] drm_test_connector_hdmi_init_bpc_null
[15:53:19] [PASSED] drm_test_connector_hdmi_init_formats_empty
[15:53:19] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[15:53:19] [PASSED] drm_test_connector_hdmi_init_null_ddc
[15:53:19] [PASSED] drm_test_connector_hdmi_init_null_product
[15:53:19] [PASSED] drm_test_connector_hdmi_init_null_vendor
[15:53:19] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[15:53:19] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[15:53:19] [PASSED] drm_test_connector_hdmi_init_product_valid
[15:53:19] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[15:53:19] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[15:53:19] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[15:53:19] ========= drm_test_connector_hdmi_init_type_valid  =========
[15:53:19] [PASSED] HDMI-A
[15:53:19] [PASSED] HDMI-B
[15:53:19] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[15:53:19] ======== drm_test_connector_hdmi_init_type_invalid  ========
[15:53:19] [PASSED] Unknown
[15:53:19] [PASSED] VGA
[15:53:19] [PASSED] DVI-I
[15:53:19] [PASSED] DVI-D
[15:53:19] [PASSED] DVI-A
[15:53:19] [PASSED] Composite
[15:53:19] [PASSED] SVIDEO
[15:53:19] [PASSED] LVDS
[15:53:19] [PASSED] Component
[15:53:19] [PASSED] DIN
[15:53:19] [PASSED] DP
[15:53:19] [PASSED] TV
[15:53:19] [PASSED] eDP
[15:53:19] [PASSED] Virtual
[15:53:19] [PASSED] DSI
[15:53:19] [PASSED] DPI
[15:53:19] [PASSED] Writeback
[15:53:19] [PASSED] SPI
[15:53:19] [PASSED] USB
[15:53:19] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[15:53:19] ============ [PASSED] drmm_connector_hdmi_init =============
[15:53:19] ============= drmm_connector_init (3 subtests) =============
[15:53:19] [PASSED] drm_test_drmm_connector_init
[15:53:19] [PASSED] drm_test_drmm_connector_init_null_ddc
[15:53:19] ========= drm_test_drmm_connector_init_type_valid  =========
[15:53:19] [PASSED] Unknown
[15:53:19] [PASSED] VGA
[15:53:19] [PASSED] DVI-I
[15:53:19] [PASSED] DVI-D
[15:53:19] [PASSED] DVI-A
[15:53:19] [PASSED] Composite
[15:53:19] [PASSED] SVIDEO
[15:53:19] [PASSED] LVDS
[15:53:19] [PASSED] Component
[15:53:19] [PASSED] DIN
[15:53:19] [PASSED] DP
[15:53:19] [PASSED] HDMI-A
[15:53:19] [PASSED] HDMI-B
[15:53:19] [PASSED] TV
[15:53:19] [PASSED] eDP
[15:53:19] [PASSED] Virtual
[15:53:19] [PASSED] DSI
[15:53:19] [PASSED] DPI
[15:53:19] [PASSED] Writeback
[15:53:19] [PASSED] SPI
[15:53:19] [PASSED] USB
[15:53:19] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[15:53:19] =============== [PASSED] drmm_connector_init ===============
[15:53:19] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[15:53:19] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[15:53:19] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[15:53:19] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[15:53:19] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[15:53:19] ========== drm_test_get_tv_mode_from_name_valid  ===========
[15:53:19] [PASSED] NTSC
[15:53:19] [PASSED] NTSC-443
[15:53:19] [PASSED] NTSC-J
[15:53:19] [PASSED] PAL
[15:53:19] [PASSED] PAL-M
[15:53:19] [PASSED] PAL-N
[15:53:19] [PASSED] SECAM
[15:53:19] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[15:53:19] [PASSED] drm_test_get_tv_mode_from_name_truncated
[15:53:19] ============ [PASSED] drm_get_tv_mode_from_name ============
[15:53:19] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[15:53:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[15:53:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[15:53:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[15:53:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[15:53:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[15:53:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[15:53:19] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[15:53:19] [PASSED] VIC 96
[15:53:19] [PASSED] VIC 97
[15:53:19] [PASSED] VIC 101
[15:53:19] [PASSED] VIC 102
[15:53:19] [PASSED] VIC 106
[15:53:19] [PASSED] VIC 107
[15:53:19] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[15:53:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[15:53:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[15:53:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[15:53:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[15:53:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[15:53:19] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[15:53:19] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[15:53:19] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[15:53:19] [PASSED] Automatic
[15:53:19] [PASSED] Full
[15:53:19] [PASSED] Limited 16:235
[15:53:19] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[15:53:19] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[15:53:19] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[15:53:19] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[15:53:19] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[15:53:19] [PASSED] RGB
[15:53:19] [PASSED] YUV 4:2:0
[15:53:19] [PASSED] YUV 4:2:2
[15:53:19] [PASSED] YUV 4:4:4
[15:53:19] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[15:53:19] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[15:53:19] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[15:53:19] ============= drm_damage_helper (21 subtests) ==============
[15:53:19] [PASSED] drm_test_damage_iter_no_damage
[15:53:19] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[15:53:19] [PASSED] drm_test_damage_iter_no_damage_src_moved
[15:53:19] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[15:53:19] [PASSED] drm_test_damage_iter_no_damage_not_visible
[15:53:19] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[15:53:19] [PASSED] drm_test_damage_iter_no_damage_no_fb
[15:53:19] [PASSED] drm_test_damage_iter_simple_damage
[15:53:19] [PASSED] drm_test_damage_iter_single_damage
[15:53:19] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[15:53:19] [PASSED] drm_test_damage_iter_single_damage_outside_src
[15:53:19] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[15:53:19] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[15:53:19] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[15:53:19] [PASSED] drm_test_damage_iter_single_damage_src_moved
[15:53:19] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[15:53:19] [PASSED] drm_test_damage_iter_damage
[15:53:19] [PASSED] drm_test_damage_iter_damage_one_intersect
[15:53:19] [PASSED] drm_test_damage_iter_damage_one_outside
[15:53:19] [PASSED] drm_test_damage_iter_damage_src_moved
[15:53:19] [PASSED] drm_test_damage_iter_damage_not_visible
[15:53:19] ================ [PASSED] drm_damage_helper ================
[15:53:19] ============== drm_dp_mst_helper (3 subtests) ==============
[15:53:19] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[15:53:19] [PASSED] Clock 154000 BPP 30 DSC disabled
[15:53:19] [PASSED] Clock 234000 BPP 30 DSC disabled
[15:53:19] [PASSED] Clock 297000 BPP 24 DSC disabled
[15:53:19] [PASSED] Clock 332880 BPP 24 DSC enabled
[15:53:19] [PASSED] Clock 324540 BPP 24 DSC enabled
[15:53:19] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[15:53:19] ============== drm_test_dp_mst_calc_pbn_div  ===============
[15:53:19] [PASSED] Link rate 2000000 lane count 4
[15:53:19] [PASSED] Link rate 2000000 lane count 2
[15:53:19] [PASSED] Link rate 2000000 lane count 1
[15:53:19] [PASSED] Link rate 1350000 lane count 4
[15:53:19] [PASSED] Link rate 1350000 lane count 2
[15:53:19] [PASSED] Link rate 1350000 lane count 1
[15:53:19] [PASSED] Link rate 1000000 lane count 4
[15:53:19] [PASSED] Link rate 1000000 lane count 2
[15:53:19] [PASSED] Link rate 1000000 lane count 1
[15:53:19] [PASSED] Link rate 810000 lane count 4
[15:53:19] [PASSED] Link rate 810000 lane count 2
[15:53:19] [PASSED] Link rate 810000 lane count 1
[15:53:19] [PASSED] Link rate 540000 lane count 4
[15:53:19] [PASSED] Link rate 540000 lane count 2
[15:53:19] [PASSED] Link rate 540000 lane count 1
[15:53:19] [PASSED] Link rate 270000 lane count 4
[15:53:19] [PASSED] Link rate 270000 lane count 2
[15:53:19] [PASSED] Link rate 270000 lane count 1
[15:53:19] [PASSED] Link rate 162000 lane count 4
[15:53:19] [PASSED] Link rate 162000 lane count 2
[15:53:19] [PASSED] Link rate 162000 lane count 1
[15:53:19] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[15:53:19] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[15:53:19] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[15:53:19] [PASSED] DP_POWER_UP_PHY with port number
[15:53:19] [PASSED] DP_POWER_DOWN_PHY with port number
[15:53:19] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[15:53:19] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[15:53:19] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[15:53:19] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[15:53:19] [PASSED] DP_QUERY_PAYLOAD with port number
[15:53:19] [PASSED] DP_QUERY_PAYLOAD with VCPI
[15:53:19] [PASSED] DP_REMOTE_DPCD_READ with port number
[15:53:19] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[15:53:19] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[15:53:19] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[15:53:19] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[15:53:19] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[15:53:19] [PASSED] DP_REMOTE_I2C_READ with port number
[15:53:19] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[15:53:19] [PASSED] DP_REMOTE_I2C_READ with transactions array
[15:53:19] [PASSED] DP_REMOTE_I2C_WRITE with port number
[15:53:19] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[15:53:19] [PASSED] DP_REMOTE_I2C_WRITE with data array
[15:53:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[15:53:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[15:53:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[15:53:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[15:53:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[15:53:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[15:53:19] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[15:53:19] ================ [PASSED] drm_dp_mst_helper ================
[15:53:19] ================== drm_exec (7 subtests) ===================
[15:53:19] [PASSED] sanitycheck
[15:53:19] [PASSED] test_lock
[15:53:19] [PASSED] test_lock_unlock
[15:53:19] [PASSED] test_duplicates
[15:53:19] [PASSED] test_prepare
[15:53:19] [PASSED] test_prepare_array
[15:53:19] [PASSED] test_multiple_loops
[15:53:19] ==================== [PASSED] drm_exec =====================
[15:53:19] =========== drm_format_helper_test (17 subtests) ===========
[15:53:19] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[15:53:19] [PASSED] single_pixel_source_buffer
[15:53:19] [PASSED] single_pixel_clip_rectangle
[15:53:19] [PASSED] well_known_colors
[15:53:19] [PASSED] destination_pitch
[15:53:19] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[15:53:19] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[15:53:19] [PASSED] single_pixel_source_buffer
[15:53:19] [PASSED] single_pixel_clip_rectangle
[15:53:19] [PASSED] well_known_colors
[15:53:19] [PASSED] destination_pitch
[15:53:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[15:53:19] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[15:53:19] [PASSED] single_pixel_source_buffer
[15:53:19] [PASSED] single_pixel_clip_rectangle
[15:53:19] [PASSED] well_known_colors
[15:53:19] [PASSED] destination_pitch
[15:53:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[15:53:19] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[15:53:19] [PASSED] single_pixel_source_buffer
[15:53:19] [PASSED] single_pixel_clip_rectangle
[15:53:19] [PASSED] well_known_colors
[15:53:19] [PASSED] destination_pitch
[15:53:19] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[15:53:19] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[15:53:19] [PASSED] single_pixel_source_buffer
[15:53:19] [PASSED] single_pixel_clip_rectangle
[15:53:19] [PASSED] well_known_colors
[15:53:19] [PASSED] destination_pitch
[15:53:19] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[15:53:19] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[15:53:19] [PASSED] single_pixel_source_buffer
[15:53:19] [PASSED] single_pixel_clip_rectangle
[15:53:19] [PASSED] well_known_colors
[15:53:19] [PASSED] destination_pitch
[15:53:19] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[15:53:19] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[15:53:19] [PASSED] single_pixel_source_buffer
[15:53:19] [PASSED] single_pixel_clip_rectangle
[15:53:19] [PASSED] well_known_colors
[15:53:19] [PASSED] destination_pitch
[15:53:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[15:53:19] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[15:53:19] [PASSED] single_pixel_source_buffer
[15:53:19] [PASSED] single_pixel_clip_rectangle
[15:53:19] [PASSED] well_known_colors
[15:53:19] [PASSED] destination_pitch
[15:53:19] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[15:53:19] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[15:53:19] [PASSED] single_pixel_source_buffer
[15:53:19] [PASSED] single_pixel_clip_rectangle
[15:53:19] [PASSED] well_known_colors
[15:53:19] [PASSED] destination_pitch
[15:53:19] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[15:53:19] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[15:53:19] [PASSED] single_pixel_source_buffer
[15:53:19] [PASSED] single_pixel_clip_rectangle
[15:53:19] [PASSED] well_known_colors
[15:53:19] [PASSED] destination_pitch
[15:53:19] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[15:53:19] ============== drm_test_fb_xrgb8888_to_mono  ===============
[15:53:19] [PASSED] single_pixel_source_buffer
[15:53:19] [PASSED] single_pixel_clip_rectangle
[15:53:19] [PASSED] well_known_colors
[15:53:19] [PASSED] destination_pitch
[15:53:19] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[15:53:19] ==================== drm_test_fb_swab  =====================
[15:53:19] [PASSED] single_pixel_source_buffer
[15:53:19] [PASSED] single_pixel_clip_rectangle
[15:53:19] [PASSED] well_known_colors
[15:53:19] [PASSED] destination_pitch
[15:53:19] ================ [PASSED] drm_test_fb_swab =================
[15:53:19] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[15:53:19] [PASSED] single_pixel_source_buffer
[15:53:19] [PASSED] single_pixel_clip_rectangle
[15:53:19] [PASSED] well_known_colors
[15:53:19] [PASSED] destination_pitch
[15:53:19] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[15:53:19] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[15:53:19] [PASSED] single_pixel_source_buffer
[15:53:19] [PASSED] single_pixel_clip_rectangle
[15:53:19] [PASSED] well_known_colors
[15:53:19] [PASSED] destination_pitch
[15:53:19] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[15:53:19] ================= drm_test_fb_clip_offset  =================
[15:53:19] [PASSED] pass through
[15:53:19] [PASSED] horizontal offset
[15:53:19] [PASSED] vertical offset
[15:53:19] [PASSED] horizontal and vertical offset
[15:53:19] [PASSED] horizontal offset (custom pitch)
[15:53:19] [PASSED] vertical offset (custom pitch)
[15:53:19] [PASSED] horizontal and vertical offset (custom pitch)
[15:53:19] ============= [PASSED] drm_test_fb_clip_offset =============
[15:53:19] ============== drm_test_fb_build_fourcc_list  ==============
[15:53:19] [PASSED] no native formats
[15:53:19] [PASSED] XRGB8888 as native format
[15:53:19] [PASSED] remove duplicates
[15:53:19] [PASSED] convert alpha formats
[15:53:19] [PASSED] random formats
[15:53:19] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[15:53:19] =================== drm_test_fb_memcpy  ====================
[15:53:19] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[15:53:19] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[15:53:19] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[15:53:19] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[15:53:19] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[15:53:19] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[15:53:19] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[15:53:19] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[15:53:19] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[15:53:19] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[15:53:19] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[15:53:19] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[15:53:19] =============== [PASSED] drm_test_fb_memcpy ================
[15:53:19] ============= [PASSED] drm_format_helper_test ==============
[15:53:19] ================= drm_format (18 subtests) =================
[15:53:19] [PASSED] drm_test_format_block_width_invalid
[15:53:19] [PASSED] drm_test_format_block_width_one_plane
[15:53:19] [PASSED] drm_test_format_block_width_two_plane
[15:53:19] [PASSED] drm_test_format_block_width_three_plane
[15:53:19] [PASSED] drm_test_format_block_width_tiled
[15:53:19] [PASSED] drm_test_format_block_height_invalid
[15:53:19] [PASSED] drm_test_format_block_height_one_plane
[15:53:19] [PASSED] drm_test_format_block_height_two_plane
[15:53:19] [PASSED] drm_test_format_block_height_three_plane
[15:53:19] [PASSED] drm_test_format_block_height_tiled
[15:53:19] [PASSED] drm_test_format_min_pitch_invalid
[15:53:19] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[15:53:19] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[15:53:19] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[15:53:19] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[15:53:19] [PASSED] drm_test_format_min_pitch_two_plane
[15:53:19] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[15:53:19] [PASSED] drm_test_format_min_pitch_tiled
[15:53:19] =================== [PASSED] drm_format ====================
[15:53:19] =============== drm_framebuffer (1 subtest) ================
[15:53:19] =============== drm_test_framebuffer_create  ===============
[15:53:19] [PASSED] ABGR8888 normal sizes
[15:53:19] [PASSED] ABGR8888 max sizes
[15:53:19] [PASSED] ABGR8888 pitch greater than min required
[15:53:19] [PASSED] ABGR8888 pitch less than min required
[15:53:19] [PASSED] ABGR8888 Invalid width
[15:53:19] [PASSED] ABGR8888 Invalid buffer handle
[15:53:19] [PASSED] No pixel format
[15:53:19] [PASSED] ABGR8888 Width 0
[15:53:19] [PASSED] ABGR8888 Height 0
[15:53:19] [PASSED] ABGR8888 Out of bound height * pitch combination
[15:53:19] [PASSED] ABGR8888 Large buffer offset
[15:53:19] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[15:53:19] [PASSED] ABGR8888 Valid buffer modifier
[15:53:19] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[15:53:19] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[15:53:19] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[15:53:19] [PASSED] NV12 Normal sizes
[15:53:19] [PASSED] NV12 Max sizes
[15:53:19] [PASSED] NV12 Invalid pitch
[15:53:19] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[15:53:19] [PASSED] NV12 different  modifier per-plane
[15:53:19] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[15:53:19] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[15:53:19] [PASSED] NV12 Modifier for inexistent plane
[15:53:19] [PASSED] NV12 Handle for inexistent plane
[15:53:19] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[15:53:19] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[15:53:19] [PASSED] YVU420 Normal sizes
[15:53:19] [PASSED] YVU420 Max sizes
[15:53:19] [PASSED] YVU420 Invalid pitch
[15:53:19] [PASSED] YVU420 Different pitches
[15:53:19] [PASSED] YVU420 Different buffer offsets/pitches
[15:53:19] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[15:53:19] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[15:53:19] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[15:53:19] [PASSED] YVU420 Valid modifier
[15:53:19] [PASSED] YVU420 Different modifiers per plane
[15:53:19] [PASSED] YVU420 Modifier for inexistent plane
[15:53:19] [PASSED] X0L2 Normal sizes
[15:53:19] [PASSED] X0L2 Max sizes
[15:53:19] [PASSED] X0L2 Invalid pitch
[15:53:19] [PASSED] X0L2 Pitch greater than minimum required
[15:53:19] [PASSED] X0L2 Handle for inexistent plane
[15:53:19] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[15:53:19] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[15:53:19] [PASSED] X0L2 Valid modifier
[15:53:19] [PASSED] X0L2 Modifier for inexistent plane
[15:53:19] =========== [PASSED] drm_test_framebuffer_create ===========
[15:53:19] ================= [PASSED] drm_framebuffer =================
[15:53:19] ================ drm_gem_shmem (8 subtests) ================
[15:53:19] [PASSED] drm_gem_shmem_test_obj_create
[15:53:19] [PASSED] drm_gem_shmem_test_obj_create_private
[15:53:19] [PASSED] drm_gem_shmem_test_pin_pages
[15:53:19] [PASSED] drm_gem_shmem_test_vmap
[15:53:19] [PASSED] drm_gem_shmem_test_get_pages_sgt
[15:53:19] [PASSED] drm_gem_shmem_test_get_sg_table
[15:53:19] [PASSED] drm_gem_shmem_test_madvise
[15:53:19] [PASSED] drm_gem_shmem_test_purge
[15:53:19] ================== [PASSED] drm_gem_shmem ==================
[15:53:19] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[15:53:19] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[15:53:19] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[15:53:19] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[15:53:19] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[15:53:19] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[15:53:19] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[15:53:19] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[15:53:19] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[15:53:19] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[15:53:19] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[15:53:19] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[15:53:19] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[15:53:19] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[15:53:19] [PASSED] drm_test_check_output_bpc_dvi
[15:53:19] [PASSED] drm_test_check_output_bpc_format_vic_1
[15:53:19] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[15:53:19] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[15:53:19] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[15:53:19] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[15:53:19] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[15:53:19] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[15:53:19] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[15:53:19] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[15:53:19] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[15:53:19] [PASSED] drm_test_check_broadcast_rgb_value
[15:53:19] [PASSED] drm_test_check_bpc_8_value
[15:53:19] [PASSED] drm_test_check_bpc_10_value
[15:53:19] [PASSED] drm_test_check_bpc_12_value
[15:53:19] [PASSED] drm_test_check_format_value
[15:53:19] [PASSED] drm_test_check_tmds_char_value
[15:53:19] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[15:53:19] ================= drm_managed (2 subtests) =================
[15:53:19] [PASSED] drm_test_managed_release_action
[15:53:19] [PASSED] drm_test_managed_run_action
[15:53:19] =================== [PASSED] drm_managed ===================
[15:53:19] =================== drm_mm (6 subtests) ====================
[15:53:19] [PASSED] drm_test_mm_init
[15:53:19] [PASSED] drm_test_mm_debug
[15:53:19] [PASSED] drm_test_mm_align32
[15:53:19] [PASSED] drm_test_mm_align64
[15:53:19] [PASSED] drm_test_mm_lowest
[15:53:19] [PASSED] drm_test_mm_highest
[15:53:19] ===================== [PASSED] drm_mm ======================
[15:53:19] ============= drm_modes_analog_tv (4 subtests) =============
[15:53:19] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[15:53:19] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[15:53:19] [PASSED] drm_test_modes_analog_tv_pal_576i
[15:53:19] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[15:53:19] =============== [PASSED] drm_modes_analog_tv ===============
[15:53:19] ============== drm_plane_helper (2 subtests) ===============
[15:53:19] =============== drm_test_check_plane_state  ================
[15:53:19] [PASSED] clipping_simple
[15:53:19] [PASSED] clipping_rotate_reflect
[15:53:19] [PASSED] positioning_simple
[15:53:19] [PASSED] upscaling
[15:53:19] [PASSED] downscaling
[15:53:19] [PASSED] rounding1
[15:53:19] [PASSED] rounding2
[15:53:19] [PASSED] rounding3
[15:53:19] [PASSED] rounding4
[15:53:19] =========== [PASSED] drm_test_check_plane_state ============
[15:53:19] =========== drm_test_check_invalid_plane_state  ============
[15:53:19] [PASSED] positioning_invalid
[15:53:19] [PASSED] upscaling_invalid
[15:53:19] [PASSED] downscaling_invalid
[15:53:19] ======= [PASSED] drm_test_check_invalid_plane_state ========
[15:53:19] ================ [PASSED] drm_plane_helper =================
stty: 'standard input': Inappropriate ioctl for device
[15:53:19] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[15:53:19] ====== drm_test_connector_helper_tv_get_modes_check  =======
[15:53:19] [PASSED] None
[15:53:19] [PASSED] PAL
[15:53:19] [PASSED] NTSC
[15:53:19] [PASSED] Both, NTSC Default
[15:53:19] [PASSED] Both, PAL Default
[15:53:19] [PASSED] Both, NTSC Default, with PAL on command-line
[15:53:19] [PASSED] Both, PAL Default, with NTSC on command-line
[15:53:19] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[15:53:19] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[15:53:19] ================== drm_rect (9 subtests) ===================
[15:53:19] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[15:53:19] [PASSED] drm_test_rect_clip_scaled_not_clipped
[15:53:19] [PASSED] drm_test_rect_clip_scaled_clipped
[15:53:19] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[15:53:19] ================= drm_test_rect_intersect  =================
[15:53:19] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[15:53:19] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[15:53:19] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[15:53:19] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[15:53:19] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[15:53:19] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[15:53:19] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[15:53:19] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[15:53:19] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[15:53:19] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[15:53:19] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[15:53:19] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[15:53:19] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[15:53:19] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[15:53:19] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[15:53:19] ============= [PASSED] drm_test_rect_intersect =============
[15:53:19] ================ drm_test_rect_calc_hscale  ================
[15:53:19] [PASSED] normal use
[15:53:19] [PASSED] out of max range
[15:53:19] [PASSED] out of min range
[15:53:19] [PASSED] zero dst
[15:53:19] [PASSED] negative src
[15:53:19] [PASSED] negative dst
[15:53:19] ============ [PASSED] drm_test_rect_calc_hscale ============
[15:53:19] ================ drm_test_rect_calc_vscale  ================
[15:53:19] [PASSED] normal use
[15:53:19] [PASSED] out of max range
[15:53:19] [PASSED] out of min range
[15:53:19] [PASSED] zero dst
[15:53:19] [PASSED] negative src
[15:53:19] [PASSED] negative dst
[15:53:19] ============ [PASSED] drm_test_rect_calc_vscale ============
[15:53:19] ================== drm_test_rect_rotate  ===================
[15:53:19] [PASSED] reflect-x
[15:53:19] [PASSED] reflect-y
[15:53:19] [PASSED] rotate-0
[15:53:19] [PASSED] rotate-90
[15:53:19] [PASSED] rotate-180
[15:53:19] [PASSED] rotate-270
[15:53:19] ============== [PASSED] drm_test_rect_rotate ===============
[15:53:19] ================ drm_test_rect_rotate_inv  =================
[15:53:19] [PASSED] reflect-x
[15:53:19] [PASSED] reflect-y
[15:53:19] [PASSED] rotate-0
[15:53:19] [PASSED] rotate-90
[15:53:19] [PASSED] rotate-180
[15:53:19] [PASSED] rotate-270
[15:53:19] ============ [PASSED] drm_test_rect_rotate_inv =============
[15:53:19] ==================== [PASSED] drm_rect =====================
[15:53:19] ============================================================
[15:53:19] Testing complete. Ran 511 tests: passed: 511
[15:53:19] Elapsed time: 23.350s total, 1.735s configuring, 21.422s building, 0.190s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[15:53:19] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:53:21] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[15:53:30] Starting KUnit Kernel (1/1)...
[15:53:30] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[15:53:30] ================= ttm_device (5 subtests) ==================
[15:53:30] [PASSED] ttm_device_init_basic
[15:53:30] [PASSED] ttm_device_init_multiple
[15:53:30] [PASSED] ttm_device_fini_basic
[15:53:30] [PASSED] ttm_device_init_no_vma_man
[15:53:30] ================== ttm_device_init_pools  ==================
[15:53:30] [PASSED] No DMA allocations, no DMA32 required
[15:53:30] [PASSED] DMA allocations, DMA32 required
[15:53:30] [PASSED] No DMA allocations, DMA32 required
[15:53:30] [PASSED] DMA allocations, no DMA32 required
[15:53:30] ============== [PASSED] ttm_device_init_pools ==============
[15:53:30] =================== [PASSED] ttm_device ====================
[15:53:30] ================== ttm_pool (8 subtests) ===================
[15:53:30] ================== ttm_pool_alloc_basic  ===================
[15:53:30] [PASSED] One page
[15:53:30] [PASSED] More than one page
[15:53:30] [PASSED] Above the allocation limit
[15:53:30] [PASSED] One page, with coherent DMA mappings enabled
[15:53:30] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[15:53:30] ============== [PASSED] ttm_pool_alloc_basic ===============
[15:53:30] ============== ttm_pool_alloc_basic_dma_addr  ==============
[15:53:30] [PASSED] One page
[15:53:30] [PASSED] More than one page
[15:53:30] [PASSED] Above the allocation limit
[15:53:30] [PASSED] One page, with coherent DMA mappings enabled
[15:53:30] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[15:53:30] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[15:53:30] [PASSED] ttm_pool_alloc_order_caching_match
[15:53:30] [PASSED] ttm_pool_alloc_caching_mismatch
[15:53:30] [PASSED] ttm_pool_alloc_order_mismatch
[15:53:30] [PASSED] ttm_pool_free_dma_alloc
[15:53:30] [PASSED] ttm_pool_free_no_dma_alloc
[15:53:30] [PASSED] ttm_pool_fini_basic
[15:53:30] ==================== [PASSED] ttm_pool =====================
[15:53:30] ================ ttm_resource (8 subtests) =================
[15:53:30] ================= ttm_resource_init_basic  =================
[15:53:30] [PASSED] Init resource in TTM_PL_SYSTEM
[15:53:30] [PASSED] Init resource in TTM_PL_VRAM
[15:53:30] [PASSED] Init resource in a private placement
[15:53:30] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[15:53:30] ============= [PASSED] ttm_resource_init_basic =============
[15:53:30] [PASSED] ttm_resource_init_pinned
[15:53:30] [PASSED] ttm_resource_fini_basic
[15:53:30] [PASSED] ttm_resource_manager_init_basic
[15:53:30] [PASSED] ttm_resource_manager_usage_basic
[15:53:30] [PASSED] ttm_resource_manager_set_used_basic
[15:53:30] [PASSED] ttm_sys_man_alloc_basic
[15:53:30] [PASSED] ttm_sys_man_free_basic
[15:53:30] ================== [PASSED] ttm_resource ===================
[15:53:30] =================== ttm_tt (10 subtests) ===================
[15:53:30] ==================== ttm_tt_init_basic  ====================
[15:53:30] [PASSED] Page-aligned size
[15:53:30] [PASSED] Extra pages requested
[15:53:30] ================ [PASSED] ttm_tt_init_basic ================
[15:53:30] [PASSED] ttm_tt_init_misaligned
[15:53:30] [PASSED] ttm_tt_fini_basic
[15:53:30] [PASSED] ttm_tt_fini_sg
[15:53:30] [PASSED] ttm_tt_fini_shmem
[15:53:30] [PASSED] ttm_tt_create_basic
[15:53:30] [PASSED] ttm_tt_create_invalid_bo_type
[15:53:30] [PASSED] ttm_tt_create_ttm_exists
[15:53:30] [PASSED] ttm_tt_create_failed
[15:53:30] [PASSED] ttm_tt_destroy_basic
[15:53:30] ===================== [PASSED] ttm_tt ======================
[15:53:30] =================== ttm_bo (14 subtests) ===================
[15:53:30] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[15:53:30] [PASSED] Cannot be interrupted and sleeps
[15:53:30] [PASSED] Cannot be interrupted, locks straight away
[15:53:30] [PASSED] Can be interrupted, sleeps
[15:53:30] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[15:53:30] [PASSED] ttm_bo_reserve_locked_no_sleep
[15:53:30] [PASSED] ttm_bo_reserve_no_wait_ticket
[15:53:30] [PASSED] ttm_bo_reserve_double_resv
[15:53:30] [PASSED] ttm_bo_reserve_interrupted
[15:53:30] [PASSED] ttm_bo_reserve_deadlock
[15:53:30] [PASSED] ttm_bo_unreserve_basic
[15:53:30] [PASSED] ttm_bo_unreserve_pinned
[15:53:30] [PASSED] ttm_bo_unreserve_bulk
[15:53:30] [PASSED] ttm_bo_put_basic
[15:53:30] [PASSED] ttm_bo_put_shared_resv
[15:53:30] [PASSED] ttm_bo_pin_basic
[15:53:30] [PASSED] ttm_bo_pin_unpin_resource
[15:53:30] [PASSED] ttm_bo_multiple_pin_one_unpin
[15:53:30] ===================== [PASSED] ttm_bo ======================
[15:53:30] ============================================================
[15:53:30] Testing complete. Ran 62 tests: passed: 62
[15:53:30] Elapsed time: 10.458s total, 1.707s configuring, 8.582s building, 0.133s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


