Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78B5C25B7C
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 12:08:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7766B10E04D;
	Mon, 27 May 2024 12:08:47 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13B210E04D;
 Mon, 27 May 2024 12:08:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/pf=3A_Update_the_LMTT_w?=
 =?utf-8?q?hen_freeing_VF_GT_config?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 May 2024 12:08:44 -0000
Message-ID: <171681172491.2212767.1162838593837164754@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240527115408.1064-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240527115408.1064-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Update the LMTT when freeing VF GT config
URL   : https://patchwork.freedesktop.org/series/134077/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[12:07:44] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:07:48] Building KUnit Kernel ...
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

[12:08:15] Starting KUnit Kernel (1/1)...
[12:08:15] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[12:08:15] =================== guc_dbm (7 subtests) ===================
[12:08:15] [PASSED] test_empty
[12:08:15] [PASSED] test_default
[12:08:15] ======================== test_size  ========================
[12:08:15] [PASSED] 4
[12:08:15] [PASSED] 8
[12:08:15] [PASSED] 32
[12:08:15] [PASSED] 256
[12:08:15] ==================== [PASSED] test_size ====================
[12:08:15] ======================= test_reuse  ========================
[12:08:15] [PASSED] 4
[12:08:15] [PASSED] 8
[12:08:15] [PASSED] 32
[12:08:15] [PASSED] 256
[12:08:15] =================== [PASSED] test_reuse ====================
[12:08:15] =================== test_range_overlap  ====================
[12:08:15] [PASSED] 4
[12:08:15] [PASSED] 8
[12:08:15] [PASSED] 32
[12:08:15] [PASSED] 256
[12:08:15] =============== [PASSED] test_range_overlap ================
[12:08:15] =================== test_range_compact  ====================
[12:08:15] [PASSED] 4
[12:08:15] [PASSED] 8
[12:08:15] [PASSED] 32
[12:08:15] [PASSED] 256
[12:08:15] =============== [PASSED] test_range_compact ================
[12:08:15] ==================== test_range_spare  =====================
[12:08:15] [PASSED] 4
[12:08:15] [PASSED] 8
[12:08:15] [PASSED] 32
[12:08:15] [PASSED] 256
[12:08:15] ================ [PASSED] test_range_spare =================
[12:08:15] ===================== [PASSED] guc_dbm =====================
[12:08:15] =================== guc_idm (6 subtests) ===================
[12:08:15] [PASSED] bad_init
[12:08:15] [PASSED] no_init
[12:08:15] [PASSED] init_fini
[12:08:15] [PASSED] check_used
[12:08:15] [PASSED] check_quota
[12:08:15] [PASSED] check_all
[12:08:15] ===================== [PASSED] guc_idm =====================
[12:08:15] ================== no_relay (3 subtests) ===================
[12:08:15] [PASSED] xe_drops_guc2pf_if_not_ready
[12:08:15] [PASSED] xe_drops_guc2vf_if_not_ready
[12:08:15] [PASSED] xe_rejects_send_if_not_ready
[12:08:15] ==================== [PASSED] no_relay =====================
[12:08:15] ================== pf_relay (14 subtests) ==================
[12:08:15] [PASSED] pf_rejects_guc2pf_too_short
[12:08:15] [PASSED] pf_rejects_guc2pf_too_long
[12:08:15] [PASSED] pf_rejects_guc2pf_no_payload
[12:08:15] [PASSED] pf_fails_no_payload
[12:08:15] [PASSED] pf_fails_bad_origin
[12:08:15] [PASSED] pf_fails_bad_type
[12:08:15] [PASSED] pf_txn_reports_error
[12:08:15] [PASSED] pf_txn_sends_pf2guc
[12:08:15] [PASSED] pf_sends_pf2guc
[12:08:15] [SKIPPED] pf_loopback_nop
[12:08:15] [SKIPPED] pf_loopback_echo
[12:08:15] [SKIPPED] pf_loopback_fail
[12:08:15] [SKIPPED] pf_loopback_busy
[12:08:15] [SKIPPED] pf_loopback_retry
[12:08:15] ==================== [PASSED] pf_relay =====================
[12:08:15] ================== vf_relay (3 subtests) ===================
[12:08:15] [PASSED] vf_rejects_guc2vf_too_short
[12:08:15] [PASSED] vf_rejects_guc2vf_too_long
[12:08:15] [PASSED] vf_rejects_guc2vf_no_payload
[12:08:15] ==================== [PASSED] vf_relay =====================
[12:08:15] ================= pf_service (11 subtests) =================
[12:08:15] [PASSED] pf_negotiate_any
[12:08:15] [PASSED] pf_negotiate_base_match
[12:08:15] [PASSED] pf_negotiate_base_newer
[12:08:15] [PASSED] pf_negotiate_base_next
[12:08:15] [SKIPPED] pf_negotiate_base_older
[12:08:15] [PASSED] pf_negotiate_base_prev
[12:08:15] [PASSED] pf_negotiate_latest_match
[12:08:15] [PASSED] pf_negotiate_latest_newer
[12:08:15] [PASSED] pf_negotiate_latest_next
[12:08:15] [SKIPPED] pf_negotiate_latest_older
[12:08:15] [SKIPPED] pf_negotiate_latest_prev
[12:08:15] =================== [PASSED] pf_service ====================
[12:08:15] ===================== lmtt (1 subtest) =====================
[12:08:15] ======================== test_ops  =========================
[12:08:15] [PASSED] 2-level
[12:08:15] [PASSED] multi-level
[12:08:15] ==================== [PASSED] test_ops =====================
[12:08:15] ====================== [PASSED] lmtt =======================
[12:08:15] ==================== xe_bo (2 subtests) ====================
[12:08:15] [SKIPPED] xe_ccs_migrate_kunit
[12:08:15] [SKIPPED] xe_bo_evict_kunit
[12:08:15] ===================== [SKIPPED] xe_bo ======================
[12:08:15] ================== xe_dma_buf (1 subtest) ==================
[12:08:15] [SKIPPED] xe_dma_buf_kunit
[12:08:15] =================== [SKIPPED] xe_dma_buf ===================
[12:08:15] ================== xe_migrate (1 subtest) ==================
[12:08:15] [SKIPPED] xe_migrate_sanity_kunit
[12:08:15] =================== [SKIPPED] xe_migrate ===================
[12:08:15] =================== xe_mocs (2 subtests) ===================
[12:08:15] [SKIPPED] xe_live_mocs_kernel_kunit
[12:08:15] [SKIPPED] xe_live_mocs_reset_kunit
[12:08:15] ==================== [SKIPPED] xe_mocs =====================
[12:08:15] ==================== args (11 subtests) ====================
[12:08:15] [PASSED] count_args_test
[12:08:15] [PASSED] call_args_example
[12:08:15] [PASSED] call_args_test
[12:08:15] [PASSED] drop_first_arg_example
[12:08:15] [PASSED] drop_first_arg_test
[12:08:15] [PASSED] first_arg_example
[12:08:15] [PASSED] first_arg_test
[12:08:15] [PASSED] last_arg_example
[12:08:15] [PASSED] last_arg_test
[12:08:15] [PASSED] pick_arg_example
[12:08:15] [PASSED] sep_comma_example
[12:08:15] ====================== [PASSED] args =======================
[12:08:15] =================== xe_pci (2 subtests) ====================
[12:08:15] [PASSED] xe_gmdid_graphics_ip
[12:08:15] [PASSED] xe_gmdid_media_ip
[12:08:15] ===================== [PASSED] xe_pci ======================
[12:08:15] ==================== xe_rtp (1 subtest) ====================
[12:08:15] ================== xe_rtp_process_tests  ===================
[12:08:15] [PASSED] coalesce-same-reg
[12:08:15] [PASSED] no-match-no-add
[12:08:15] [PASSED] no-match-no-add-multiple-rules
[12:08:15] [PASSED] two-regs-two-entries
[12:08:15] [PASSED] clr-one-set-other
[12:08:15] [PASSED] set-field
[12:08:15] [PASSED] conflict-duplicate
[12:08:15] [PASSED] conflict-not-disjoint
[12:08:15] [PASSED] conflict-reg-type
[12:08:15] ============== [PASSED] xe_rtp_process_tests ===============
stty: 'standard input': Inappropriate ioctl for device
[12:08:15] ===================== [PASSED] xe_rtp ======================
[12:08:15] ==================== xe_wa (1 subtest) =====================
[12:08:15] ======================== xe_wa_gt  =========================
[12:08:15] [PASSED] TIGERLAKE (B0)
[12:08:15] [PASSED] DG1 (A0)
[12:08:15] [PASSED] DG1 (B0)
[12:08:15] [PASSED] ALDERLAKE_S (A0)
[12:08:15] [PASSED] ALDERLAKE_S (B0)
[12:08:15] [PASSED] ALDERLAKE_S (C0)
[12:08:15] [PASSED] ALDERLAKE_S (D0)
[12:08:15] [PASSED] ALDERLAKE_P (A0)
[12:08:15] [PASSED] ALDERLAKE_P (B0)
[12:08:15] [PASSED] ALDERLAKE_P (C0)
[12:08:15] [PASSED] ALDERLAKE_S_RPLS (D0)
[12:08:15] [PASSED] ALDERLAKE_P_RPLU (E0)
[12:08:15] [PASSED] DG2_G10 (C0)
[12:08:15] [PASSED] DG2_G11 (B1)
[12:08:15] [PASSED] DG2_G12 (A1)
[12:08:15] [PASSED] METEORLAKE (g:A0, m:A0)
[12:08:15] [PASSED] METEORLAKE (g:A0, m:A0)
[12:08:15] [PASSED] METEORLAKE (g:A0, m:A0)
[12:08:15] [PASSED] LUNARLAKE (g:A0, m:A0)
[12:08:15] [PASSED] LUNARLAKE (g:B0, m:A0)
[12:08:15] ==================== [PASSED] xe_wa_gt =====================
[12:08:15] ====================== [PASSED] xe_wa ======================
[12:08:15] ============================================================
[12:08:15] Testing complete. Ran 109 tests: passed: 95, skipped: 14
[12:08:15] Elapsed time: 31.244s total, 4.260s configuring, 26.713s building, 0.217s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[12:08:15] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:08:17] Building KUnit Kernel ...
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

[12:08:38] Starting KUnit Kernel (1/1)...
[12:08:38] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[12:08:38] ============ drm_test_pick_cmdline (2 subtests) ============
[12:08:38] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[12:08:38] =============== drm_test_pick_cmdline_named  ===============
[12:08:38] [PASSED] NTSC
[12:08:38] [PASSED] NTSC-J
[12:08:38] [PASSED] PAL
[12:08:38] [PASSED] PAL-M
[12:08:38] =========== [PASSED] drm_test_pick_cmdline_named ===========
[12:08:38] ============== [PASSED] drm_test_pick_cmdline ==============
[12:08:38] ================== drm_buddy (7 subtests) ==================
[12:08:38] [PASSED] drm_test_buddy_alloc_limit
[12:08:38] [PASSED] drm_test_buddy_alloc_optimistic
[12:08:38] [PASSED] drm_test_buddy_alloc_pessimistic
[12:08:38] [PASSED] drm_test_buddy_alloc_pathological
[12:08:38] [PASSED] drm_test_buddy_alloc_contiguous
[12:08:38] [PASSED] drm_test_buddy_alloc_clear
[12:08:38] [PASSED] drm_test_buddy_alloc_range_bias
[12:08:38] ==================== [PASSED] drm_buddy ====================
[12:08:38] ============= drm_cmdline_parser (40 subtests) =============
[12:08:38] [PASSED] drm_test_cmdline_force_d_only
[12:08:38] [PASSED] drm_test_cmdline_force_D_only_dvi
[12:08:38] [PASSED] drm_test_cmdline_force_D_only_hdmi
[12:08:38] [PASSED] drm_test_cmdline_force_D_only_not_digital
[12:08:38] [PASSED] drm_test_cmdline_force_e_only
[12:08:38] [PASSED] drm_test_cmdline_res
[12:08:38] [PASSED] drm_test_cmdline_res_vesa
[12:08:38] [PASSED] drm_test_cmdline_res_vesa_rblank
[12:08:38] [PASSED] drm_test_cmdline_res_rblank
[12:08:38] [PASSED] drm_test_cmdline_res_bpp
[12:08:38] [PASSED] drm_test_cmdline_res_refresh
[12:08:38] [PASSED] drm_test_cmdline_res_bpp_refresh
[12:08:38] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[12:08:38] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[12:08:38] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[12:08:38] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[12:08:38] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[12:08:38] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[12:08:38] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[12:08:38] [PASSED] drm_test_cmdline_res_margins_force_on
[12:08:38] [PASSED] drm_test_cmdline_res_vesa_margins
[12:08:38] [PASSED] drm_test_cmdline_name
[12:08:38] [PASSED] drm_test_cmdline_name_bpp
[12:08:38] [PASSED] drm_test_cmdline_name_option
[12:08:38] [PASSED] drm_test_cmdline_name_bpp_option
[12:08:38] [PASSED] drm_test_cmdline_rotate_0
[12:08:38] [PASSED] drm_test_cmdline_rotate_90
[12:08:38] [PASSED] drm_test_cmdline_rotate_180
[12:08:38] [PASSED] drm_test_cmdline_rotate_270
[12:08:38] [PASSED] drm_test_cmdline_hmirror
[12:08:38] [PASSED] drm_test_cmdline_vmirror
[12:08:38] [PASSED] drm_test_cmdline_margin_options
[12:08:38] [PASSED] drm_test_cmdline_multiple_options
[12:08:38] [PASSED] drm_test_cmdline_bpp_extra_and_option
[12:08:38] [PASSED] drm_test_cmdline_extra_and_option
[12:08:38] [PASSED] drm_test_cmdline_freestanding_options
[12:08:38] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[12:08:38] [PASSED] drm_test_cmdline_panel_orientation
[12:08:38] ================ drm_test_cmdline_invalid  =================
[12:08:38] [PASSED] margin_only
[12:08:38] [PASSED] interlace_only
[12:08:38] [PASSED] res_missing_x
[12:08:38] [PASSED] res_missing_y
[12:08:38] [PASSED] res_bad_y
[12:08:38] [PASSED] res_missing_y_bpp
[12:08:38] [PASSED] res_bad_bpp
[12:08:38] [PASSED] res_bad_refresh
[12:08:38] [PASSED] res_bpp_refresh_force_on_off
[12:08:38] [PASSED] res_invalid_mode
[12:08:38] [PASSED] res_bpp_wrong_place_mode
[12:08:38] [PASSED] name_bpp_refresh
[12:08:38] [PASSED] name_refresh
[12:08:38] [PASSED] name_refresh_wrong_mode
[12:08:38] [PASSED] name_refresh_invalid_mode
[12:08:38] [PASSED] rotate_multiple
[12:08:38] [PASSED] rotate_invalid_val
[12:08:38] [PASSED] rotate_truncated
[12:08:38] [PASSED] invalid_option
[12:08:38] [PASSED] invalid_tv_option
[12:08:38] [PASSED] truncated_tv_option
[12:08:38] ============ [PASSED] drm_test_cmdline_invalid =============
[12:08:38] =============== drm_test_cmdline_tv_options  ===============
[12:08:38] [PASSED] NTSC
[12:08:38] [PASSED] NTSC_443
[12:08:38] [PASSED] NTSC_J
[12:08:38] [PASSED] PAL
[12:08:38] [PASSED] PAL_M
[12:08:38] [PASSED] PAL_N
[12:08:38] [PASSED] SECAM
[12:08:38] =========== [PASSED] drm_test_cmdline_tv_options ===========
[12:08:38] =============== [PASSED] drm_cmdline_parser ================
[12:08:38] ============= drmm_connector_init (3 subtests) =============
[12:08:38] [PASSED] drm_test_drmm_connector_init
[12:08:38] [PASSED] drm_test_drmm_connector_init_null_ddc
[12:08:38] ========= drm_test_drmm_connector_init_type_valid  =========
[12:08:38] [PASSED] Unknown
[12:08:38] [PASSED] VGA
[12:08:38] [PASSED] DVI-I
[12:08:38] [PASSED] DVI-D
[12:08:38] [PASSED] DVI-A
[12:08:38] [PASSED] Composite
[12:08:38] [PASSED] SVIDEO
[12:08:38] [PASSED] LVDS
[12:08:38] [PASSED] Component
[12:08:38] [PASSED] DIN
[12:08:38] [PASSED] DP
[12:08:38] [PASSED] HDMI-A
[12:08:38] [PASSED] HDMI-B
[12:08:38] [PASSED] TV
[12:08:38] [PASSED] eDP
[12:08:38] [PASSED] Virtual
[12:08:38] [PASSED] DSI
[12:08:38] [PASSED] DPI
[12:08:38] [PASSED] Writeback
[12:08:38] [PASSED] SPI
[12:08:38] [PASSED] USB
[12:08:38] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[12:08:38] =============== [PASSED] drmm_connector_init ===============
[12:08:38] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[12:08:38] ========== drm_test_get_tv_mode_from_name_valid  ===========
[12:08:38] [PASSED] NTSC
[12:08:38] [PASSED] NTSC-443
[12:08:38] [PASSED] NTSC-J
[12:08:38] [PASSED] PAL
[12:08:38] [PASSED] PAL-M
[12:08:38] [PASSED] PAL-N
[12:08:38] [PASSED] SECAM
[12:08:38] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[12:08:38] [PASSED] drm_test_get_tv_mode_from_name_truncated
[12:08:38] ============ [PASSED] drm_get_tv_mode_from_name ============
[12:08:38] ============= drm_damage_helper (21 subtests) ==============
[12:08:38] [PASSED] drm_test_damage_iter_no_damage
[12:08:38] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[12:08:38] [PASSED] drm_test_damage_iter_no_damage_src_moved
[12:08:38] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[12:08:38] [PASSED] drm_test_damage_iter_no_damage_not_visible
[12:08:38] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[12:08:38] [PASSED] drm_test_damage_iter_no_damage_no_fb
[12:08:38] [PASSED] drm_test_damage_iter_simple_damage
[12:08:38] [PASSED] drm_test_damage_iter_single_damage
[12:08:38] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[12:08:38] [PASSED] drm_test_damage_iter_single_damage_outside_src
[12:08:38] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[12:08:38] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[12:08:38] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[12:08:38] [PASSED] drm_test_damage_iter_single_damage_src_moved
[12:08:38] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[12:08:38] [PASSED] drm_test_damage_iter_damage
[12:08:38] [PASSED] drm_test_damage_iter_damage_one_intersect
[12:08:38] [PASSED] drm_test_damage_iter_damage_one_outside
[12:08:38] [PASSED] drm_test_damage_iter_damage_src_moved
[12:08:38] [PASSED] drm_test_damage_iter_damage_not_visible
[12:08:38] ================ [PASSED] drm_damage_helper ================
[12:08:38] ============== drm_dp_mst_helper (3 subtests) ==============
[12:08:38] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[12:08:38] [PASSED] Clock 154000 BPP 30 DSC disabled
[12:08:38] [PASSED] Clock 234000 BPP 30 DSC disabled
[12:08:38] [PASSED] Clock 297000 BPP 24 DSC disabled
[12:08:38] [PASSED] Clock 332880 BPP 24 DSC enabled
[12:08:38] [PASSED] Clock 324540 BPP 24 DSC enabled
[12:08:38] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[12:08:38] ============== drm_test_dp_mst_calc_pbn_div  ===============
[12:08:38] [PASSED] Link rate 2000000 lane count 4
[12:08:38] [PASSED] Link rate 2000000 lane count 2
[12:08:38] [PASSED] Link rate 2000000 lane count 1
[12:08:38] [PASSED] Link rate 1350000 lane count 4
[12:08:38] [PASSED] Link rate 1350000 lane count 2
[12:08:38] [PASSED] Link rate 1350000 lane count 1
[12:08:38] [PASSED] Link rate 1000000 lane count 4
[12:08:38] [PASSED] Link rate 1000000 lane count 2
[12:08:38] [PASSED] Link rate 1000000 lane count 1
[12:08:38] [PASSED] Link rate 810000 lane count 4
[12:08:38] [PASSED] Link rate 810000 lane count 2
[12:08:38] [PASSED] Link rate 810000 lane count 1
[12:08:38] [PASSED] Link rate 540000 lane count 4
[12:08:38] [PASSED] Link rate 540000 lane count 2
[12:08:38] [PASSED] Link rate 540000 lane count 1
[12:08:38] [PASSED] Link rate 270000 lane count 4
[12:08:38] [PASSED] Link rate 270000 lane count 2
[12:08:38] [PASSED] Link rate 270000 lane count 1
[12:08:38] [PASSED] Link rate 162000 lane count 4
[12:08:38] [PASSED] Link rate 162000 lane count 2
[12:08:38] [PASSED] Link rate 162000 lane count 1
[12:08:38] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[12:08:38] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[12:08:38] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[12:08:38] [PASSED] DP_POWER_UP_PHY with port number
[12:08:38] [PASSED] DP_POWER_DOWN_PHY with port number
[12:08:38] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[12:08:38] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[12:08:38] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[12:08:38] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[12:08:38] [PASSED] DP_QUERY_PAYLOAD with port number
[12:08:38] [PASSED] DP_QUERY_PAYLOAD with VCPI
[12:08:38] [PASSED] DP_REMOTE_DPCD_READ with port number
[12:08:38] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[12:08:38] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[12:08:38] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[12:08:38] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[12:08:38] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[12:08:38] [PASSED] DP_REMOTE_I2C_READ with port number
[12:08:38] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[12:08:38] [PASSED] DP_REMOTE_I2C_READ with transactions array
[12:08:38] [PASSED] DP_REMOTE_I2C_WRITE with port number
[12:08:38] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[12:08:38] [PASSED] DP_REMOTE_I2C_WRITE with data array
[12:08:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[12:08:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[12:08:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[12:08:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[12:08:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[12:08:38] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[12:08:38] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[12:08:38] ================ [PASSED] drm_dp_mst_helper ================
[12:08:38] ================== drm_exec (7 subtests) ===================
[12:08:38] [PASSED] sanitycheck
[12:08:38] [PASSED] test_lock
[12:08:38] [PASSED] test_lock_unlock
[12:08:38] [PASSED] test_duplicates
[12:08:38] [PASSED] test_prepare
[12:08:38] [PASSED] test_prepare_array
[12:08:38] [PASSED] test_multiple_loops
[12:08:38] ==================== [PASSED] drm_exec =====================
[12:08:38] =========== drm_format_helper_test (17 subtests) ===========
[12:08:38] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[12:08:38] [PASSED] single_pixel_source_buffer
[12:08:38] [PASSED] single_pixel_clip_rectangle
[12:08:38] [PASSED] well_known_colors
[12:08:38] [PASSED] destination_pitch
[12:08:38] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[12:08:38] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[12:08:38] [PASSED] single_pixel_source_buffer
[12:08:38] [PASSED] single_pixel_clip_rectangle
[12:08:38] [PASSED] well_known_colors
[12:08:38] [PASSED] destination_pitch
[12:08:38] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[12:08:38] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[12:08:38] [PASSED] single_pixel_source_buffer
[12:08:38] [PASSED] single_pixel_clip_rectangle
[12:08:38] [PASSED] well_known_colors
[12:08:38] [PASSED] destination_pitch
[12:08:38] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[12:08:38] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[12:08:38] [PASSED] single_pixel_source_buffer
[12:08:38] [PASSED] single_pixel_clip_rectangle
[12:08:38] [PASSED] well_known_colors
[12:08:38] [PASSED] destination_pitch
[12:08:38] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[12:08:38] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[12:08:38] [PASSED] single_pixel_source_buffer
[12:08:38] [PASSED] single_pixel_clip_rectangle
[12:08:38] [PASSED] well_known_colors
[12:08:38] [PASSED] destination_pitch
[12:08:38] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[12:08:38] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[12:08:38] [PASSED] single_pixel_source_buffer
[12:08:38] [PASSED] single_pixel_clip_rectangle
[12:08:38] [PASSED] well_known_colors
[12:08:38] [PASSED] destination_pitch
[12:08:38] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[12:08:38] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[12:08:38] [PASSED] single_pixel_source_buffer
[12:08:38] [PASSED] single_pixel_clip_rectangle
[12:08:38] [PASSED] well_known_colors
[12:08:38] [PASSED] destination_pitch
[12:08:38] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[12:08:38] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[12:08:38] [PASSED] single_pixel_source_buffer
[12:08:38] [PASSED] single_pixel_clip_rectangle
[12:08:38] [PASSED] well_known_colors
[12:08:38] [PASSED] destination_pitch
[12:08:38] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[12:08:38] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[12:08:38] [PASSED] single_pixel_source_buffer
[12:08:38] [PASSED] single_pixel_clip_rectangle
[12:08:38] [PASSED] well_known_colors
[12:08:38] [PASSED] destination_pitch
[12:08:38] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[12:08:38] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[12:08:38] [PASSED] single_pixel_source_buffer
[12:08:38] [PASSED] single_pixel_clip_rectangle
[12:08:38] [PASSED] well_known_colors
[12:08:38] [PASSED] destination_pitch
[12:08:38] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[12:08:38] ============== drm_test_fb_xrgb8888_to_mono  ===============
[12:08:38] [PASSED] single_pixel_source_buffer
[12:08:38] [PASSED] single_pixel_clip_rectangle
[12:08:38] [PASSED] well_known_colors
[12:08:38] [PASSED] destination_pitch
[12:08:38] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[12:08:38] ==================== drm_test_fb_swab  =====================
[12:08:38] [PASSED] single_pixel_source_buffer
[12:08:38] [PASSED] single_pixel_clip_rectangle
[12:08:38] [PASSED] well_known_colors
[12:08:38] [PASSED] destination_pitch
[12:08:38] ================ [PASSED] drm_test_fb_swab =================
[12:08:38] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[12:08:38] [PASSED] single_pixel_source_buffer
[12:08:38] [PASSED] single_pixel_clip_rectangle
[12:08:38] [PASSED] well_known_colors
[12:08:38] [PASSED] destination_pitch
[12:08:38] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[12:08:38] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[12:08:38] [PASSED] single_pixel_source_buffer
[12:08:38] [PASSED] single_pixel_clip_rectangle
[12:08:38] [PASSED] well_known_colors
[12:08:38] [PASSED] destination_pitch
[12:08:38] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[12:08:38] ================= drm_test_fb_clip_offset  =================
[12:08:38] [PASSED] pass through
[12:08:38] [PASSED] horizontal offset
[12:08:38] [PASSED] vertical offset
[12:08:38] [PASSED] horizontal and vertical offset
[12:08:38] [PASSED] horizontal offset (custom pitch)
[12:08:38] [PASSED] vertical offset (custom pitch)
[12:08:38] [PASSED] horizontal and vertical offset (custom pitch)
[12:08:38] ============= [PASSED] drm_test_fb_clip_offset =============
[12:08:38] ============== drm_test_fb_build_fourcc_list  ==============
[12:08:38] [PASSED] no native formats
[12:08:38] [PASSED] XRGB8888 as native format
[12:08:38] [PASSED] remove duplicates
[12:08:38] [PASSED] convert alpha formats
[12:08:38] [PASSED] random formats
[12:08:38] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[12:08:38] =================== drm_test_fb_memcpy  ====================
[12:08:38] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[12:08:38] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[12:08:38] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[12:08:38] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[12:08:38] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[12:08:38] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[12:08:38] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[12:08:38] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[12:08:38] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[12:08:38] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[12:08:38] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[12:08:38] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[12:08:38] =============== [PASSED] drm_test_fb_memcpy ================
[12:08:38] ============= [PASSED] drm_format_helper_test ==============
[12:08:38] ================= drm_format (18 subtests) =================
[12:08:38] [PASSED] drm_test_format_block_width_invalid
[12:08:38] [PASSED] drm_test_format_block_width_one_plane
[12:08:38] [PASSED] drm_test_format_block_width_two_plane
[12:08:38] [PASSED] drm_test_format_block_width_three_plane
[12:08:38] [PASSED] drm_test_format_block_width_tiled
[12:08:38] [PASSED] drm_test_format_block_height_invalid
[12:08:38] [PASSED] drm_test_format_block_height_one_plane
[12:08:38] [PASSED] drm_test_format_block_height_two_plane
[12:08:38] [PASSED] drm_test_format_block_height_three_plane
[12:08:38] [PASSED] drm_test_format_block_height_tiled
[12:08:38] [PASSED] drm_test_format_min_pitch_invalid
[12:08:38] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[12:08:38] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[12:08:38] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[12:08:38] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[12:08:38] [PASSED] drm_test_format_min_pitch_two_plane
[12:08:38] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[12:08:38] [PASSED] drm_test_format_min_pitch_tiled
[12:08:38] =================== [PASSED] drm_format ====================
[12:08:38] =============== drm_framebuffer (1 subtest) ================
[12:08:38] =============== drm_test_framebuffer_create  ===============
[12:08:38] [PASSED] ABGR8888 normal sizes
[12:08:38] [PASSED] ABGR8888 max sizes
[12:08:38] [PASSED] ABGR8888 pitch greater than min required
[12:08:38] [PASSED] ABGR8888 pitch less than min required
[12:08:38] [PASSED] ABGR8888 Invalid width
[12:08:38] [PASSED] ABGR8888 Invalid buffer handle
[12:08:38] [PASSED] No pixel format
[12:08:38] [PASSED] ABGR8888 Width 0
[12:08:38] [PASSED] ABGR8888 Height 0
[12:08:38] [PASSED] ABGR8888 Out of bound height * pitch combination
[12:08:38] [PASSED] ABGR8888 Large buffer offset
[12:08:38] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[12:08:38] [PASSED] ABGR8888 Valid buffer modifier
[12:08:38] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[12:08:38] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[12:08:38] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[12:08:38] [PASSED] NV12 Normal sizes
[12:08:38] [PASSED] NV12 Max sizes
[12:08:38] [PASSED] NV12 Invalid pitch
[12:08:38] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[12:08:38] [PASSED] NV12 different  modifier per-plane
[12:08:38] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[12:08:38] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[12:08:38] [PASSED] NV12 Modifier for inexistent plane
[12:08:38] [PASSED] NV12 Handle for inexistent plane
[12:08:38] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[12:08:38] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[12:08:38] [PASSED] YVU420 Normal sizes
[12:08:38] [PASSED] YVU420 Max sizes
[12:08:38] [PASSED] YVU420 Invalid pitch
[12:08:38] [PASSED] YVU420 Different pitches
[12:08:38] [PASSED] YVU420 Different buffer offsets/pitches
[12:08:38] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[12:08:38] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[12:08:38] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[12:08:38] [PASSED] YVU420 Valid modifier
[12:08:38] [PASSED] YVU420 Different modifiers per plane
[12:08:38] [PASSED] YVU420 Modifier for inexistent plane
[12:08:38] [PASSED] X0L2 Normal sizes
[12:08:38] [PASSED] X0L2 Max sizes
[12:08:38] [PASSED] X0L2 Invalid pitch
[12:08:38] [PASSED] X0L2 Pitch greater than minimum required
[12:08:38] [PASSED] X0L2 Handle for inexistent plane
[12:08:38] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[12:08:38] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[12:08:38] [PASSED] X0L2 Valid modifier
[12:08:38] [PASSED] X0L2 Modifier for inexistent plane
[12:08:38] =========== [PASSED] drm_test_framebuffer_create ===========
[12:08:38] ================= [PASSED] drm_framebuffer =================
[12:08:38] ================ drm_gem_shmem (8 subtests) ================
[12:08:38] [PASSED] drm_gem_shmem_test_obj_create
[12:08:38] [PASSED] drm_gem_shmem_test_obj_create_private
[12:08:38] [PASSED] drm_gem_shmem_test_pin_pages
[12:08:38] [PASSED] drm_gem_shmem_test_vmap
[12:08:38] [PASSED] drm_gem_shmem_test_get_pages_sgt
[12:08:38] [PASSED] drm_gem_shmem_test_get_sg_table
[12:08:38] [PASSED] drm_gem_shmem_test_madvise
[12:08:38] [PASSED] drm_gem_shmem_test_purge
[12:08:38] ================== [PASSED] drm_gem_shmem ==================
[12:08:38] ================= drm_managed (2 subtests) =================
[12:08:38] [PASSED] drm_test_managed_release_action
[12:08:38] [PASSED] drm_test_managed_run_action
[12:08:38] =================== [PASSED] drm_managed ===================
stty: 'standard input': Inappropriate ioctl for device
[12:08:38] =================== drm_mm (6 subtests) ====================
[12:08:38] [PASSED] drm_test_mm_init
[12:08:38] [PASSED] drm_test_mm_debug
[12:08:38] [PASSED] drm_test_mm_align32
[12:08:38] [PASSED] drm_test_mm_align64
[12:08:38] [PASSED] drm_test_mm_lowest
[12:08:38] [PASSED] drm_test_mm_highest
[12:08:38] ===================== [PASSED] drm_mm ======================
[12:08:38] ============= drm_modes_analog_tv (4 subtests) =============
[12:08:38] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[12:08:38] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[12:08:38] [PASSED] drm_test_modes_analog_tv_pal_576i
[12:08:38] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[12:08:38] =============== [PASSED] drm_modes_analog_tv ===============
[12:08:38] ============== drm_plane_helper (2 subtests) ===============
[12:08:38] =============== drm_test_check_plane_state  ================
[12:08:38] [PASSED] clipping_simple
[12:08:38] [PASSED] clipping_rotate_reflect
[12:08:38] [PASSED] positioning_simple
[12:08:38] [PASSED] upscaling
[12:08:38] [PASSED] downscaling
[12:08:38] [PASSED] rounding1
[12:08:38] [PASSED] rounding2
[12:08:38] [PASSED] rounding3
[12:08:38] [PASSED] rounding4
[12:08:38] =========== [PASSED] drm_test_check_plane_state ============
[12:08:38] =========== drm_test_check_invalid_plane_state  ============
[12:08:38] [PASSED] positioning_invalid
[12:08:38] [PASSED] upscaling_invalid
[12:08:38] [PASSED] downscaling_invalid
[12:08:38] ======= [PASSED] drm_test_check_invalid_plane_state ========
[12:08:38] ================ [PASSED] drm_plane_helper =================
[12:08:38] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[12:08:38] ====== drm_test_connector_helper_tv_get_modes_check  =======
[12:08:38] [PASSED] None
[12:08:38] [PASSED] PAL
[12:08:38] [PASSED] NTSC
[12:08:38] [PASSED] Both, NTSC Default
[12:08:38] [PASSED] Both, PAL Default
[12:08:38] [PASSED] Both, NTSC Default, with PAL on command-line
[12:08:38] [PASSED] Both, PAL Default, with NTSC on command-line
[12:08:38] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[12:08:38] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[12:08:38] ================== drm_rect (9 subtests) ===================
[12:08:38] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[12:08:38] [PASSED] drm_test_rect_clip_scaled_not_clipped
[12:08:38] [PASSED] drm_test_rect_clip_scaled_clipped
[12:08:38] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[12:08:38] ================= drm_test_rect_intersect  =================
[12:08:38] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[12:08:38] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[12:08:38] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[12:08:38] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[12:08:38] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[12:08:38] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[12:08:38] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[12:08:38] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[12:08:38] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[12:08:38] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[12:08:38] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[12:08:38] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[12:08:38] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[12:08:38] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[12:08:38] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[12:08:38] ============= [PASSED] drm_test_rect_intersect =============
[12:08:38] ================ drm_test_rect_calc_hscale  ================
[12:08:38] [PASSED] normal use
[12:08:38] [PASSED] out of max range
[12:08:38] [PASSED] out of min range
[12:08:38] [PASSED] zero dst
[12:08:38] [PASSED] negative src
[12:08:38] [PASSED] negative dst
[12:08:38] ============ [PASSED] drm_test_rect_calc_hscale ============
[12:08:38] ================ drm_test_rect_calc_vscale  ================
[12:08:38] [PASSED] normal use
[12:08:38] [PASSED] out of max range
[12:08:38] [PASSED] out of min range
[12:08:38] [PASSED] zero dst
[12:08:38] [PASSED] negative src
[12:08:38] [PASSED] negative dst
[12:08:38] ============ [PASSED] drm_test_rect_calc_vscale ============
[12:08:38] ================== drm_test_rect_rotate  ===================
[12:08:38] [PASSED] reflect-x
[12:08:38] [PASSED] reflect-y
[12:08:38] [PASSED] rotate-0
[12:08:38] [PASSED] rotate-90
[12:08:38] [PASSED] rotate-180
[12:08:38] [PASSED] rotate-270
[12:08:38] ============== [PASSED] drm_test_rect_rotate ===============
[12:08:38] ================ drm_test_rect_rotate_inv  =================
[12:08:38] [PASSED] reflect-x
[12:08:38] [PASSED] reflect-y
[12:08:38] [PASSED] rotate-0
[12:08:38] [PASSED] rotate-90
[12:08:38] [PASSED] rotate-180
[12:08:38] [PASSED] rotate-270
[12:08:38] ============ [PASSED] drm_test_rect_rotate_inv =============
[12:08:38] ==================== [PASSED] drm_rect =====================
[12:08:38] ============================================================
[12:08:38] Testing complete. Ran 417 tests: passed: 417
[12:08:38] Elapsed time: 22.943s total, 1.748s configuring, 20.975s building, 0.198s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


