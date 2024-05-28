Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA53EC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 12:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7038F112269;
	Tue, 28 May 2024 12:42:17 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D528112269;
 Tue, 28 May 2024 12:42:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_xe_bo_shrinker_and_exhaustive_?=
 =?utf-8?q?eviction_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 May 2024 12:42:15 -0000
Message-ID: <171690013564.2216238.1694030787040950759@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240528123343.169970-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240528123343.169970-1-thomas.hellstrom@linux.intel.com>
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

Series: xe bo shrinker and exhaustive eviction (rev7)
URL   : https://patchwork.freedesktop.org/series/133643/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[12:41:15] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:41:19] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
../lib/iomap.c:157:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
  157 | u64 ioread64_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:164:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
  164 | u64 ioread64_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:171:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
  171 | u64 ioread64be_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:179:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
  179 | u64 ioread64be_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:265:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
  265 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:273:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
  273 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:281:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
  281 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
../lib/iomap.c:289:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
  289 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~

[12:41:46] Starting KUnit Kernel (1/1)...
[12:41:46] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[12:41:46] =================== guc_dbm (7 subtests) ===================
[12:41:46] [PASSED] test_empty
[12:41:46] [PASSED] test_default
[12:41:46] ======================== test_size  ========================
[12:41:46] [PASSED] 4
[12:41:46] [PASSED] 8
[12:41:46] [PASSED] 32
[12:41:46] [PASSED] 256
[12:41:46] ==================== [PASSED] test_size ====================
[12:41:46] ======================= test_reuse  ========================
[12:41:46] [PASSED] 4
[12:41:46] [PASSED] 8
[12:41:46] [PASSED] 32
[12:41:46] [PASSED] 256
[12:41:46] =================== [PASSED] test_reuse ====================
[12:41:46] =================== test_range_overlap  ====================
[12:41:46] [PASSED] 4
[12:41:46] [PASSED] 8
[12:41:46] [PASSED] 32
[12:41:46] [PASSED] 256
[12:41:46] =============== [PASSED] test_range_overlap ================
[12:41:46] =================== test_range_compact  ====================
[12:41:46] [PASSED] 4
[12:41:46] [PASSED] 8
[12:41:46] [PASSED] 32
[12:41:46] [PASSED] 256
[12:41:46] =============== [PASSED] test_range_compact ================
[12:41:46] ==================== test_range_spare  =====================
[12:41:46] [PASSED] 4
[12:41:46] [PASSED] 8
[12:41:46] [PASSED] 32
[12:41:46] [PASSED] 256
[12:41:46] ================ [PASSED] test_range_spare =================
[12:41:46] ===================== [PASSED] guc_dbm =====================
[12:41:46] =================== guc_idm (6 subtests) ===================
[12:41:46] [PASSED] bad_init
[12:41:46] [PASSED] no_init
[12:41:46] [PASSED] init_fini
[12:41:46] [PASSED] check_used
[12:41:46] [PASSED] check_quota
[12:41:46] [PASSED] check_all
[12:41:46] ===================== [PASSED] guc_idm =====================
[12:41:46] ================== no_relay (3 subtests) ===================
[12:41:46] [PASSED] xe_drops_guc2pf_if_not_ready
[12:41:46] [PASSED] xe_drops_guc2vf_if_not_ready
[12:41:46] [PASSED] xe_rejects_send_if_not_ready
[12:41:46] ==================== [PASSED] no_relay =====================
[12:41:46] ================== pf_relay (14 subtests) ==================
[12:41:46] [PASSED] pf_rejects_guc2pf_too_short
[12:41:46] [PASSED] pf_rejects_guc2pf_too_long
[12:41:46] [PASSED] pf_rejects_guc2pf_no_payload
[12:41:46] [PASSED] pf_fails_no_payload
[12:41:46] [PASSED] pf_fails_bad_origin
[12:41:46] [PASSED] pf_fails_bad_type
[12:41:46] [PASSED] pf_txn_reports_error
[12:41:46] [PASSED] pf_txn_sends_pf2guc
[12:41:46] [PASSED] pf_sends_pf2guc
[12:41:46] [SKIPPED] pf_loopback_nop
[12:41:46] [SKIPPED] pf_loopback_echo
[12:41:46] [SKIPPED] pf_loopback_fail
[12:41:46] [SKIPPED] pf_loopback_busy
[12:41:46] [SKIPPED] pf_loopback_retry
[12:41:46] ==================== [PASSED] pf_relay =====================
[12:41:46] ================== vf_relay (3 subtests) ===================
[12:41:46] [PASSED] vf_rejects_guc2vf_too_short
[12:41:46] [PASSED] vf_rejects_guc2vf_too_long
[12:41:46] [PASSED] vf_rejects_guc2vf_no_payload
[12:41:46] ==================== [PASSED] vf_relay =====================
[12:41:46] ================= pf_service (11 subtests) =================
[12:41:46] [PASSED] pf_negotiate_any
[12:41:46] [PASSED] pf_negotiate_base_match
[12:41:46] [PASSED] pf_negotiate_base_newer
[12:41:46] [PASSED] pf_negotiate_base_next
[12:41:46] [SKIPPED] pf_negotiate_base_older
[12:41:46] [PASSED] pf_negotiate_base_prev
[12:41:46] [PASSED] pf_negotiate_latest_match
[12:41:46] [PASSED] pf_negotiate_latest_newer
[12:41:46] [PASSED] pf_negotiate_latest_next
[12:41:46] [SKIPPED] pf_negotiate_latest_older
[12:41:46] [SKIPPED] pf_negotiate_latest_prev
[12:41:46] =================== [PASSED] pf_service ====================
[12:41:46] ===================== lmtt (1 subtest) =====================
[12:41:46] ======================== test_ops  =========================
[12:41:46] [PASSED] 2-level
[12:41:46] [PASSED] multi-level
[12:41:46] ==================== [PASSED] test_ops =====================
[12:41:46] ====================== [PASSED] lmtt =======================
[12:41:46] ==================== xe_bo (3 subtests) ====================
[12:41:46] [SKIPPED] xe_ccs_migrate_kunit
[12:41:46] [SKIPPED] xe_bo_evict_kunit
[12:41:46] [SKIPPED] xe_bo_shrink_kunit
[12:41:46] ===================== [SKIPPED] xe_bo ======================
[12:41:46] ================== xe_dma_buf (1 subtest) ==================
[12:41:46] [SKIPPED] xe_dma_buf_kunit
[12:41:46] =================== [SKIPPED] xe_dma_buf ===================
[12:41:46] ================== xe_migrate (1 subtest) ==================
[12:41:46] [SKIPPED] xe_migrate_sanity_kunit
[12:41:46] =================== [SKIPPED] xe_migrate ===================
[12:41:46] =================== xe_mocs (2 subtests) ===================
[12:41:46] [SKIPPED] xe_live_mocs_kernel_kunit
[12:41:46] [SKIPPED] xe_live_mocs_reset_kunit
[12:41:46] ==================== [SKIPPED] xe_mocs =====================
[12:41:46] ==================== args (11 subtests) ====================
[12:41:46] [PASSED] count_args_test
[12:41:46] [PASSED] call_args_example
[12:41:46] [PASSED] call_args_test
[12:41:46] [PASSED] drop_first_arg_example
[12:41:46] [PASSED] drop_first_arg_test
[12:41:46] [PASSED] first_arg_example
[12:41:46] [PASSED] first_arg_test
[12:41:46] [PASSED] last_arg_example
[12:41:46] [PASSED] last_arg_test
[12:41:46] [PASSED] pick_arg_example
[12:41:46] [PASSED] sep_comma_example
[12:41:46] ====================== [PASSED] args =======================
[12:41:46] =================== xe_pci (2 subtests) ====================
[12:41:46] [PASSED] xe_gmdid_graphics_ip
[12:41:46] [PASSED] xe_gmdid_media_ip
[12:41:46] ===================== [PASSED] xe_pci ======================
[12:41:46] ==================== xe_rtp (1 subtest) ====================
[12:41:46] ================== xe_rtp_process_tests  ===================
[12:41:46] [PASSED] coalesce-same-reg
[12:41:46] [PASSED] no-match-no-add
[12:41:46] [PASSED] no-match-no-add-multiple-rules
[12:41:46] [PASSED] two-regs-two-entries
[12:41:46] [PASSED] clr-one-set-other
[12:41:46] [PASSED] set-field
[12:41:46] [PASSED] conflict-duplicate
[12:41:46] [PASSED] conflict-not-disjoint
[12:41:46] [PASSED] conflict-reg-type
[12:41:46] ============== [PASSED] xe_rtp_process_tests ===============
stty: 'standard input': Inappropriate ioctl for device
[12:41:46] ===================== [PASSED] xe_rtp ======================
[12:41:46] ==================== xe_wa (1 subtest) =====================
[12:41:46] ======================== xe_wa_gt  =========================
[12:41:46] [PASSED] TIGERLAKE (B0)
[12:41:46] [PASSED] DG1 (A0)
[12:41:46] [PASSED] DG1 (B0)
[12:41:46] [PASSED] ALDERLAKE_S (A0)
[12:41:46] [PASSED] ALDERLAKE_S (B0)
[12:41:46] [PASSED] ALDERLAKE_S (C0)
[12:41:46] [PASSED] ALDERLAKE_S (D0)
[12:41:46] [PASSED] ALDERLAKE_P (A0)
[12:41:46] [PASSED] ALDERLAKE_P (B0)
[12:41:46] [PASSED] ALDERLAKE_P (C0)
[12:41:46] [PASSED] ALDERLAKE_S_RPLS (D0)
[12:41:46] [PASSED] ALDERLAKE_P_RPLU (E0)
[12:41:46] [PASSED] DG2_G10 (C0)
[12:41:46] [PASSED] DG2_G11 (B1)
[12:41:46] [PASSED] DG2_G12 (A1)
[12:41:46] [PASSED] METEORLAKE (g:A0, m:A0)
[12:41:46] [PASSED] METEORLAKE (g:A0, m:A0)
[12:41:46] [PASSED] METEORLAKE (g:A0, m:A0)
[12:41:46] [PASSED] LUNARLAKE (g:A0, m:A0)
[12:41:46] [PASSED] LUNARLAKE (g:B0, m:A0)
[12:41:46] ==================== [PASSED] xe_wa_gt =====================
[12:41:46] ====================== [PASSED] xe_wa ======================
[12:41:46] ============================================================
[12:41:46] Testing complete. Ran 110 tests: passed: 95, skipped: 15
[12:41:46] Elapsed time: 31.100s total, 4.229s configuring, 26.647s building, 0.177s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[12:41:46] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:41:48] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
../lib/iomap.c:157:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
  157 | u64 ioread64_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:164:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
  164 | u64 ioread64_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:171:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
  171 | u64 ioread64be_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:179:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
  179 | u64 ioread64be_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:265:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
  265 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:273:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
  273 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:281:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
  281 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
../lib/iomap.c:289:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
  289 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~

[12:42:09] Starting KUnit Kernel (1/1)...
[12:42:09] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[12:42:10] ============ drm_test_pick_cmdline (2 subtests) ============
[12:42:10] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[12:42:10] =============== drm_test_pick_cmdline_named  ===============
[12:42:10] [PASSED] NTSC
[12:42:10] [PASSED] NTSC-J
[12:42:10] [PASSED] PAL
[12:42:10] [PASSED] PAL-M
[12:42:10] =========== [PASSED] drm_test_pick_cmdline_named ===========
[12:42:10] ============== [PASSED] drm_test_pick_cmdline ==============
[12:42:10] ================== drm_buddy (7 subtests) ==================
[12:42:10] [PASSED] drm_test_buddy_alloc_limit
[12:42:10] [PASSED] drm_test_buddy_alloc_optimistic
[12:42:10] [PASSED] drm_test_buddy_alloc_pessimistic
[12:42:10] [PASSED] drm_test_buddy_alloc_pathological
[12:42:10] [PASSED] drm_test_buddy_alloc_contiguous
[12:42:10] [PASSED] drm_test_buddy_alloc_clear
[12:42:10] [PASSED] drm_test_buddy_alloc_range_bias
[12:42:10] ==================== [PASSED] drm_buddy ====================
[12:42:10] ============= drm_cmdline_parser (40 subtests) =============
[12:42:10] [PASSED] drm_test_cmdline_force_d_only
[12:42:10] [PASSED] drm_test_cmdline_force_D_only_dvi
[12:42:10] [PASSED] drm_test_cmdline_force_D_only_hdmi
[12:42:10] [PASSED] drm_test_cmdline_force_D_only_not_digital
[12:42:10] [PASSED] drm_test_cmdline_force_e_only
[12:42:10] [PASSED] drm_test_cmdline_res
[12:42:10] [PASSED] drm_test_cmdline_res_vesa
[12:42:10] [PASSED] drm_test_cmdline_res_vesa_rblank
[12:42:10] [PASSED] drm_test_cmdline_res_rblank
[12:42:10] [PASSED] drm_test_cmdline_res_bpp
[12:42:10] [PASSED] drm_test_cmdline_res_refresh
[12:42:10] [PASSED] drm_test_cmdline_res_bpp_refresh
[12:42:10] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[12:42:10] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[12:42:10] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[12:42:10] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[12:42:10] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[12:42:10] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[12:42:10] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[12:42:10] [PASSED] drm_test_cmdline_res_margins_force_on
[12:42:10] [PASSED] drm_test_cmdline_res_vesa_margins
[12:42:10] [PASSED] drm_test_cmdline_name
[12:42:10] [PASSED] drm_test_cmdline_name_bpp
[12:42:10] [PASSED] drm_test_cmdline_name_option
[12:42:10] [PASSED] drm_test_cmdline_name_bpp_option
[12:42:10] [PASSED] drm_test_cmdline_rotate_0
[12:42:10] [PASSED] drm_test_cmdline_rotate_90
[12:42:10] [PASSED] drm_test_cmdline_rotate_180
[12:42:10] [PASSED] drm_test_cmdline_rotate_270
[12:42:10] [PASSED] drm_test_cmdline_hmirror
[12:42:10] [PASSED] drm_test_cmdline_vmirror
[12:42:10] [PASSED] drm_test_cmdline_margin_options
[12:42:10] [PASSED] drm_test_cmdline_multiple_options
[12:42:10] [PASSED] drm_test_cmdline_bpp_extra_and_option
[12:42:10] [PASSED] drm_test_cmdline_extra_and_option
[12:42:10] [PASSED] drm_test_cmdline_freestanding_options
[12:42:10] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[12:42:10] [PASSED] drm_test_cmdline_panel_orientation
[12:42:10] ================ drm_test_cmdline_invalid  =================
[12:42:10] [PASSED] margin_only
[12:42:10] [PASSED] interlace_only
[12:42:10] [PASSED] res_missing_x
[12:42:10] [PASSED] res_missing_y
[12:42:10] [PASSED] res_bad_y
[12:42:10] [PASSED] res_missing_y_bpp
[12:42:10] [PASSED] res_bad_bpp
[12:42:10] [PASSED] res_bad_refresh
[12:42:10] [PASSED] res_bpp_refresh_force_on_off
[12:42:10] [PASSED] res_invalid_mode
[12:42:10] [PASSED] res_bpp_wrong_place_mode
[12:42:10] [PASSED] name_bpp_refresh
[12:42:10] [PASSED] name_refresh
[12:42:10] [PASSED] name_refresh_wrong_mode
[12:42:10] [PASSED] name_refresh_invalid_mode
[12:42:10] [PASSED] rotate_multiple
[12:42:10] [PASSED] rotate_invalid_val
[12:42:10] [PASSED] rotate_truncated
[12:42:10] [PASSED] invalid_option
[12:42:10] [PASSED] invalid_tv_option
[12:42:10] [PASSED] truncated_tv_option
[12:42:10] ============ [PASSED] drm_test_cmdline_invalid =============
[12:42:10] =============== drm_test_cmdline_tv_options  ===============
[12:42:10] [PASSED] NTSC
[12:42:10] [PASSED] NTSC_443
[12:42:10] [PASSED] NTSC_J
[12:42:10] [PASSED] PAL
[12:42:10] [PASSED] PAL_M
[12:42:10] [PASSED] PAL_N
[12:42:10] [PASSED] SECAM
[12:42:10] =========== [PASSED] drm_test_cmdline_tv_options ===========
[12:42:10] =============== [PASSED] drm_cmdline_parser ================
[12:42:10] ========== drmm_connector_hdmi_init (19 subtests) ==========
[12:42:10] [PASSED] drm_test_connector_hdmi_init_valid
[12:42:10] [PASSED] drm_test_connector_hdmi_init_bpc_8
[12:42:10] [PASSED] drm_test_connector_hdmi_init_bpc_10
[12:42:10] [PASSED] drm_test_connector_hdmi_init_bpc_12
[12:42:10] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[12:42:10] [PASSED] drm_test_connector_hdmi_init_bpc_null
[12:42:10] [PASSED] drm_test_connector_hdmi_init_formats_empty
[12:42:10] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[12:42:10] [PASSED] drm_test_connector_hdmi_init_null_ddc
[12:42:10] [PASSED] drm_test_connector_hdmi_init_null_product
[12:42:10] [PASSED] drm_test_connector_hdmi_init_null_vendor
[12:42:10] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[12:42:10] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[12:42:10] [PASSED] drm_test_connector_hdmi_init_product_valid
[12:42:10] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[12:42:10] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[12:42:10] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[12:42:10] ========= drm_test_connector_hdmi_init_type_valid  =========
[12:42:10] [PASSED] HDMI-A
[12:42:10] [PASSED] HDMI-B
[12:42:10] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[12:42:10] ======== drm_test_connector_hdmi_init_type_invalid  ========
[12:42:10] [PASSED] Unknown
[12:42:10] [PASSED] VGA
[12:42:10] [PASSED] DVI-I
[12:42:10] [PASSED] DVI-D
[12:42:10] [PASSED] DVI-A
[12:42:10] [PASSED] Composite
[12:42:10] [PASSED] SVIDEO
[12:42:10] [PASSED] LVDS
[12:42:10] [PASSED] Component
[12:42:10] [PASSED] DIN
[12:42:10] [PASSED] DP
[12:42:10] [PASSED] TV
[12:42:10] [PASSED] eDP
[12:42:10] [PASSED] Virtual
[12:42:10] [PASSED] DSI
[12:42:10] [PASSED] DPI
[12:42:10] [PASSED] Writeback
[12:42:10] [PASSED] SPI
[12:42:10] [PASSED] USB
[12:42:10] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[12:42:10] ============ [PASSED] drmm_connector_hdmi_init =============
[12:42:10] ============= drmm_connector_init (3 subtests) =============
[12:42:10] [PASSED] drm_test_drmm_connector_init
[12:42:10] [PASSED] drm_test_drmm_connector_init_null_ddc
[12:42:10] ========= drm_test_drmm_connector_init_type_valid  =========
[12:42:10] [PASSED] Unknown
[12:42:10] [PASSED] VGA
[12:42:10] [PASSED] DVI-I
[12:42:10] [PASSED] DVI-D
[12:42:10] [PASSED] DVI-A
[12:42:10] [PASSED] Composite
[12:42:10] [PASSED] SVIDEO
[12:42:10] [PASSED] LVDS
[12:42:10] [PASSED] Component
[12:42:10] [PASSED] DIN
[12:42:10] [PASSED] DP
[12:42:10] [PASSED] HDMI-A
[12:42:10] [PASSED] HDMI-B
[12:42:10] [PASSED] TV
[12:42:10] [PASSED] eDP
[12:42:10] [PASSED] Virtual
[12:42:10] [PASSED] DSI
[12:42:10] [PASSED] DPI
[12:42:10] [PASSED] Writeback
[12:42:10] [PASSED] SPI
[12:42:10] [PASSED] USB
[12:42:10] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[12:42:10] =============== [PASSED] drmm_connector_init ===============
[12:42:10] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[12:42:10] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[12:42:10] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[12:42:10] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[12:42:10] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[12:42:10] ========== drm_test_get_tv_mode_from_name_valid  ===========
[12:42:10] [PASSED] NTSC
[12:42:10] [PASSED] NTSC-443
[12:42:10] [PASSED] NTSC-J
[12:42:10] [PASSED] PAL
[12:42:10] [PASSED] PAL-M
[12:42:10] [PASSED] PAL-N
[12:42:10] [PASSED] SECAM
[12:42:10] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[12:42:10] [PASSED] drm_test_get_tv_mode_from_name_truncated
[12:42:10] ============ [PASSED] drm_get_tv_mode_from_name ============
[12:42:10] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[12:42:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[12:42:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[12:42:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[12:42:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[12:42:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[12:42:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[12:42:10] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[12:42:10] [PASSED] VIC 96
[12:42:10] [PASSED] VIC 97
[12:42:10] [PASSED] VIC 101
[12:42:10] [PASSED] VIC 102
[12:42:10] [PASSED] VIC 106
[12:42:10] [PASSED] VIC 107
[12:42:10] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[12:42:10] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[12:42:10] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[12:42:10] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[12:42:10] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[12:42:10] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[12:42:10] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[12:42:10] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[12:42:10] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[12:42:10] [PASSED] Automatic
[12:42:10] [PASSED] Full
[12:42:10] [PASSED] Limited 16:235
[12:42:10] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[12:42:10] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[12:42:10] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[12:42:10] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[12:42:10] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[12:42:10] [PASSED] RGB
[12:42:10] [PASSED] YUV 4:2:0
[12:42:10] [PASSED] YUV 4:2:2
[12:42:10] [PASSED] YUV 4:4:4
[12:42:10] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[12:42:10] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[12:42:10] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[12:42:10] ============= drm_damage_helper (21 subtests) ==============
[12:42:10] [PASSED] drm_test_damage_iter_no_damage
[12:42:10] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[12:42:10] [PASSED] drm_test_damage_iter_no_damage_src_moved
[12:42:10] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[12:42:10] [PASSED] drm_test_damage_iter_no_damage_not_visible
[12:42:10] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[12:42:10] [PASSED] drm_test_damage_iter_no_damage_no_fb
[12:42:10] [PASSED] drm_test_damage_iter_simple_damage
[12:42:10] [PASSED] drm_test_damage_iter_single_damage
[12:42:10] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[12:42:10] [PASSED] drm_test_damage_iter_single_damage_outside_src
[12:42:10] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[12:42:10] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[12:42:10] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[12:42:10] [PASSED] drm_test_damage_iter_single_damage_src_moved
[12:42:10] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[12:42:10] [PASSED] drm_test_damage_iter_damage
[12:42:10] [PASSED] drm_test_damage_iter_damage_one_intersect
[12:42:10] [PASSED] drm_test_damage_iter_damage_one_outside
[12:42:10] [PASSED] drm_test_damage_iter_damage_src_moved
[12:42:10] [PASSED] drm_test_damage_iter_damage_not_visible
[12:42:10] ================ [PASSED] drm_damage_helper ================
[12:42:10] ============== drm_dp_mst_helper (3 subtests) ==============
[12:42:10] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[12:42:10] [PASSED] Clock 154000 BPP 30 DSC disabled
[12:42:10] [PASSED] Clock 234000 BPP 30 DSC disabled
[12:42:10] [PASSED] Clock 297000 BPP 24 DSC disabled
[12:42:10] [PASSED] Clock 332880 BPP 24 DSC enabled
[12:42:10] [PASSED] Clock 324540 BPP 24 DSC enabled
[12:42:10] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[12:42:10] ============== drm_test_dp_mst_calc_pbn_div  ===============
[12:42:10] [PASSED] Link rate 2000000 lane count 4
[12:42:10] [PASSED] Link rate 2000000 lane count 2
[12:42:10] [PASSED] Link rate 2000000 lane count 1
[12:42:10] [PASSED] Link rate 1350000 lane count 4
[12:42:10] [PASSED] Link rate 1350000 lane count 2
[12:42:10] [PASSED] Link rate 1350000 lane count 1
[12:42:10] [PASSED] Link rate 1000000 lane count 4
[12:42:10] [PASSED] Link rate 1000000 lane count 2
[12:42:10] [PASSED] Link rate 1000000 lane count 1
[12:42:10] [PASSED] Link rate 810000 lane count 4
[12:42:10] [PASSED] Link rate 810000 lane count 2
[12:42:10] [PASSED] Link rate 810000 lane count 1
[12:42:10] [PASSED] Link rate 540000 lane count 4
[12:42:10] [PASSED] Link rate 540000 lane count 2
[12:42:10] [PASSED] Link rate 540000 lane count 1
[12:42:10] [PASSED] Link rate 270000 lane count 4
[12:42:10] [PASSED] Link rate 270000 lane count 2
[12:42:10] [PASSED] Link rate 270000 lane count 1
[12:42:10] [PASSED] Link rate 162000 lane count 4
[12:42:10] [PASSED] Link rate 162000 lane count 2
[12:42:10] [PASSED] Link rate 162000 lane count 1
[12:42:10] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[12:42:10] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[12:42:10] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[12:42:10] [PASSED] DP_POWER_UP_PHY with port number
[12:42:10] [PASSED] DP_POWER_DOWN_PHY with port number
[12:42:10] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[12:42:10] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[12:42:10] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[12:42:10] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[12:42:10] [PASSED] DP_QUERY_PAYLOAD with port number
[12:42:10] [PASSED] DP_QUERY_PAYLOAD with VCPI
[12:42:10] [PASSED] DP_REMOTE_DPCD_READ with port number
[12:42:10] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[12:42:10] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[12:42:10] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[12:42:10] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[12:42:10] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[12:42:10] [PASSED] DP_REMOTE_I2C_READ with port number
[12:42:10] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[12:42:10] [PASSED] DP_REMOTE_I2C_READ with transactions array
[12:42:10] [PASSED] DP_REMOTE_I2C_WRITE with port number
[12:42:10] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[12:42:10] [PASSED] DP_REMOTE_I2C_WRITE with data array
[12:42:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[12:42:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[12:42:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[12:42:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[12:42:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[12:42:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[12:42:10] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[12:42:10] ================ [PASSED] drm_dp_mst_helper ================
[12:42:10] ================== drm_exec (7 subtests) ===================
[12:42:10] [PASSED] sanitycheck
[12:42:10] [PASSED] test_lock
[12:42:10] [PASSED] test_lock_unlock
[12:42:10] [PASSED] test_duplicates
[12:42:10] [PASSED] test_prepare
[12:42:10] [PASSED] test_prepare_array
[12:42:10] [PASSED] test_multiple_loops
[12:42:10] ==================== [PASSED] drm_exec =====================
[12:42:10] =========== drm_format_helper_test (17 subtests) ===========
[12:42:10] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[12:42:10] [PASSED] single_pixel_source_buffer
[12:42:10] [PASSED] single_pixel_clip_rectangle
[12:42:10] [PASSED] well_known_colors
[12:42:10] [PASSED] destination_pitch
[12:42:10] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[12:42:10] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[12:42:10] [PASSED] single_pixel_source_buffer
[12:42:10] [PASSED] single_pixel_clip_rectangle
[12:42:10] [PASSED] well_known_colors
[12:42:10] [PASSED] destination_pitch
[12:42:10] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[12:42:10] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[12:42:10] [PASSED] single_pixel_source_buffer
[12:42:10] [PASSED] single_pixel_clip_rectangle
[12:42:10] [PASSED] well_known_colors
[12:42:10] [PASSED] destination_pitch
[12:42:10] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[12:42:10] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[12:42:10] [PASSED] single_pixel_source_buffer
[12:42:10] [PASSED] single_pixel_clip_rectangle
[12:42:10] [PASSED] well_known_colors
[12:42:10] [PASSED] destination_pitch
[12:42:10] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[12:42:10] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[12:42:10] [PASSED] single_pixel_source_buffer
[12:42:10] [PASSED] single_pixel_clip_rectangle
[12:42:10] [PASSED] well_known_colors
[12:42:10] [PASSED] destination_pitch
[12:42:10] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[12:42:10] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[12:42:10] [PASSED] single_pixel_source_buffer
[12:42:10] [PASSED] single_pixel_clip_rectangle
[12:42:10] [PASSED] well_known_colors
[12:42:10] [PASSED] destination_pitch
[12:42:10] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[12:42:10] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[12:42:10] [PASSED] single_pixel_source_buffer
[12:42:10] [PASSED] single_pixel_clip_rectangle
[12:42:10] [PASSED] well_known_colors
[12:42:10] [PASSED] destination_pitch
[12:42:10] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[12:42:10] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[12:42:10] [PASSED] single_pixel_source_buffer
[12:42:10] [PASSED] single_pixel_clip_rectangle
[12:42:10] [PASSED] well_known_colors
[12:42:10] [PASSED] destination_pitch
[12:42:10] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[12:42:10] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[12:42:10] [PASSED] single_pixel_source_buffer
[12:42:10] [PASSED] single_pixel_clip_rectangle
[12:42:10] [PASSED] well_known_colors
[12:42:10] [PASSED] destination_pitch
[12:42:10] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[12:42:10] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[12:42:10] [PASSED] single_pixel_source_buffer
[12:42:10] [PASSED] single_pixel_clip_rectangle
[12:42:10] [PASSED] well_known_colors
[12:42:10] [PASSED] destination_pitch
[12:42:10] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[12:42:10] ============== drm_test_fb_xrgb8888_to_mono  ===============
[12:42:10] [PASSED] single_pixel_source_buffer
[12:42:10] [PASSED] single_pixel_clip_rectangle
[12:42:10] [PASSED] well_known_colors
[12:42:10] [PASSED] destination_pitch
[12:42:10] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[12:42:10] ==================== drm_test_fb_swab  =====================
[12:42:10] [PASSED] single_pixel_source_buffer
[12:42:10] [PASSED] single_pixel_clip_rectangle
[12:42:10] [PASSED] well_known_colors
[12:42:10] [PASSED] destination_pitch
[12:42:10] ================ [PASSED] drm_test_fb_swab =================
[12:42:10] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[12:42:10] [PASSED] single_pixel_source_buffer
[12:42:10] [PASSED] single_pixel_clip_rectangle
[12:42:10] [PASSED] well_known_colors
[12:42:10] [PASSED] destination_pitch
[12:42:10] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[12:42:10] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[12:42:10] [PASSED] single_pixel_source_buffer
[12:42:10] [PASSED] single_pixel_clip_rectangle
[12:42:10] [PASSED] well_known_colors
[12:42:10] [PASSED] destination_pitch
[12:42:10] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[12:42:10] ================= drm_test_fb_clip_offset  =================
[12:42:10] [PASSED] pass through
[12:42:10] [PASSED] horizontal offset
[12:42:10] [PASSED] vertical offset
[12:42:10] [PASSED] horizontal and vertical offset
[12:42:10] [PASSED] horizontal offset (custom pitch)
[12:42:10] [PASSED] vertical offset (custom pitch)
[12:42:10] [PASSED] horizontal and vertical offset (custom pitch)
[12:42:10] ============= [PASSED] drm_test_fb_clip_offset =============
[12:42:10] ============== drm_test_fb_build_fourcc_list  ==============
[12:42:10] [PASSED] no native formats
[12:42:10] [PASSED] XRGB8888 as native format
[12:42:10] [PASSED] remove duplicates
[12:42:10] [PASSED] convert alpha formats
[12:42:10] [PASSED] random formats
[12:42:10] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[12:42:10] =================== drm_test_fb_memcpy  ====================
[12:42:10] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[12:42:10] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[12:42:10] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[12:42:10] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[12:42:10] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[12:42:10] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[12:42:10] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[12:42:10] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[12:42:10] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[12:42:10] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[12:42:10] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[12:42:10] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[12:42:10] =============== [PASSED] drm_test_fb_memcpy ================
[12:42:10] ============= [PASSED] drm_format_helper_test ==============
[12:42:10] ================= drm_format (18 subtests) =================
[12:42:10] [PASSED] drm_test_format_block_width_invalid
[12:42:10] [PASSED] drm_test_format_block_width_one_plane
[12:42:10] [PASSED] drm_test_format_block_width_two_plane
[12:42:10] [PASSED] drm_test_format_block_width_three_plane
[12:42:10] [PASSED] drm_test_format_block_width_tiled
[12:42:10] [PASSED] drm_test_format_block_height_invalid
[12:42:10] [PASSED] drm_test_format_block_height_one_plane
[12:42:10] [PASSED] drm_test_format_block_height_two_plane
[12:42:10] [PASSED] drm_test_format_block_height_three_plane
[12:42:10] [PASSED] drm_test_format_block_height_tiled
[12:42:10] [PASSED] drm_test_format_min_pitch_invalid
[12:42:10] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[12:42:10] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[12:42:10] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[12:42:10] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[12:42:10] [PASSED] drm_test_format_min_pitch_two_plane
[12:42:10] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[12:42:10] [PASSED] drm_test_format_min_pitch_tiled
[12:42:10] =================== [PASSED] drm_format ====================
[12:42:10] =============== drm_framebuffer (1 subtest) ================
[12:42:10] =============== drm_test_framebuffer_create  ===============
[12:42:10] [PASSED] ABGR8888 normal sizes
[12:42:10] [PASSED] ABGR8888 max sizes
[12:42:10] [PASSED] ABGR8888 pitch greater than min required
[12:42:10] [PASSED] ABGR8888 pitch less than min required
[12:42:10] [PASSED] ABGR8888 Invalid width
[12:42:10] [PASSED] ABGR8888 Invalid buffer handle
[12:42:10] [PASSED] No pixel format
[12:42:10] [PASSED] ABGR8888 Width 0
[12:42:10] [PASSED] ABGR8888 Height 0
[12:42:10] [PASSED] ABGR8888 Out of bound height * pitch combination
[12:42:10] [PASSED] ABGR8888 Large buffer offset
[12:42:10] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[12:42:10] [PASSED] ABGR8888 Valid buffer modifier
[12:42:10] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[12:42:10] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[12:42:10] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[12:42:10] [PASSED] NV12 Normal sizes
[12:42:10] [PASSED] NV12 Max sizes
[12:42:10] [PASSED] NV12 Invalid pitch
[12:42:10] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[12:42:10] [PASSED] NV12 different  modifier per-plane
[12:42:10] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[12:42:10] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[12:42:10] [PASSED] NV12 Modifier for inexistent plane
[12:42:10] [PASSED] NV12 Handle for inexistent plane
[12:42:10] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[12:42:10] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[12:42:10] [PASSED] YVU420 Normal sizes
[12:42:10] [PASSED] YVU420 Max sizes
[12:42:10] [PASSED] YVU420 Invalid pitch
[12:42:10] [PASSED] YVU420 Different pitches
[12:42:10] [PASSED] YVU420 Different buffer offsets/pitches
[12:42:10] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[12:42:10] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[12:42:10] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[12:42:10] [PASSED] YVU420 Valid modifier
[12:42:10] [PASSED] YVU420 Different modifiers per plane
[12:42:10] [PASSED] YVU420 Modifier for inexistent plane
[12:42:10] [PASSED] X0L2 Normal sizes
[12:42:10] [PASSED] X0L2 Max sizes
[12:42:10] [PASSED] X0L2 Invalid pitch
[12:42:10] [PASSED] X0L2 Pitch greater than minimum required
[12:42:10] [PASSED] X0L2 Handle for inexistent plane
[12:42:10] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[12:42:10] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[12:42:10] [PASSED] X0L2 Valid modifier
[12:42:10] [PASSED] X0L2 Modifier for inexistent plane
[12:42:10] =========== [PASSED] drm_test_framebuffer_create ===========
[12:42:10] ================= [PASSED] drm_framebuffer =================
[12:42:10] ================ drm_gem_shmem (8 subtests) ================
[12:42:10] [PASSED] drm_gem_shmem_test_obj_create
[12:42:10] [PASSED] drm_gem_shmem_test_obj_create_private
[12:42:10] [PASSED] drm_gem_shmem_test_pin_pages
[12:42:10] [PASSED] drm_gem_shmem_test_vmap
[12:42:10] [PASSED] drm_gem_shmem_test_get_pages_sgt
[12:42:10] [PASSED] drm_gem_shmem_test_get_sg_table
[12:42:10] [PASSED] drm_gem_shmem_test_madvise
[12:42:10] [PASSED] drm_gem_shmem_test_purge
[12:42:10] ================== [PASSED] drm_gem_shmem ==================
[12:42:10] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[12:42:10] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[12:42:10] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[12:42:10] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[12:42:10] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[12:42:10] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[12:42:10] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[12:42:10] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[12:42:10] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[12:42:10] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[12:42:10] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[12:42:10] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[12:42:10] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[12:42:10] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[12:42:10] [PASSED] drm_test_check_output_bpc_dvi
[12:42:10] [PASSED] drm_test_check_output_bpc_format_vic_1
[12:42:10] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[12:42:10] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[12:42:10] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[12:42:10] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[12:42:10] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[12:42:10] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[12:42:10] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[12:42:10] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[12:42:10] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[12:42:10] [PASSED] drm_test_check_broadcast_rgb_value
[12:42:10] [PASSED] drm_test_check_bpc_8_value
[12:42:10] [PASSED] drm_test_check_bpc_10_value
[12:42:10] [PASSED] drm_test_check_bpc_12_value
[12:42:10] [PASSED] drm_test_check_format_value
[12:42:10] [PASSED] drm_test_check_tmds_char_value
[12:42:10] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[12:42:10] ================= drm_managed (2 subtests) =================
[12:42:10] [PASSED] drm_test_managed_release_action
[12:42:10] [PASSED] drm_test_managed_run_action
[12:42:10] =================== [PASSED] drm_managed ===================
[12:42:10] =================== drm_mm (6 subtests) ====================
[12:42:10] [PASSED] drm_test_mm_init
[12:42:10] [PASSED] drm_test_mm_debug
[12:42:10] [PASSED] drm_test_mm_align32
[12:42:10] [PASSED] drm_test_mm_align64
[12:42:10] [PASSED] drm_test_mm_lowest
[12:42:10] [PASSED] drm_test_mm_highest
[12:42:10] ===================== [PASSED] drm_mm ======================
[12:42:10] ============= drm_modes_analog_tv (4 subtests) =============
[12:42:10] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[12:42:10] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[12:42:10] [PASSED] drm_test_modes_analog_tv_pal_576i
[12:42:10] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[12:42:10] =============== [PASSED] drm_modes_analog_tv ===============
[12:42:10] ============== drm_plane_helper (2 subtests) ===============
[12:42:10] =============== drm_test_check_plane_state  ================
[12:42:10] [PASSED] clipping_simple
[12:42:10] [PASSED] clipping_rotate_reflect
[12:42:10] [PASSED] positioning_simple
[12:42:10] [PASSED] upscaling
[12:42:10] [PASSED] downscaling
[12:42:10] [PASSED] rounding1
[12:42:10] [PASSED] rounding2
[12:42:10] [PASSED] rounding3
[12:42:10] [PASSED] rounding4
[12:42:10] =========== [PASSED] drm_test_check_plane_state ============
[12:42:10] =========== drm_test_check_invalid_plane_state  ============
[12:42:10] [PASSED] positioning_invalid
[12:42:10] [PASSED] upscaling_invalid
[12:42:10] [PASSED] downscaling_invalid
[12:42:10] ======= [PASSED] drm_test_check_invalid_plane_state ========
[12:42:10] ================ [PASSED] drm_plane_helper =================
stty: 'standard input': Inappropriate ioctl for device
[12:42:10] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[12:42:10] ====== drm_test_connector_helper_tv_get_modes_check  =======
[12:42:10] [PASSED] None
[12:42:10] [PASSED] PAL
[12:42:10] [PASSED] NTSC
[12:42:10] [PASSED] Both, NTSC Default
[12:42:10] [PASSED] Both, PAL Default
[12:42:10] [PASSED] Both, NTSC Default, with PAL on command-line
[12:42:10] [PASSED] Both, PAL Default, with NTSC on command-line
[12:42:10] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[12:42:10] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[12:42:10] ================== drm_rect (9 subtests) ===================
[12:42:10] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[12:42:10] [PASSED] drm_test_rect_clip_scaled_not_clipped
[12:42:10] [PASSED] drm_test_rect_clip_scaled_clipped
[12:42:10] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[12:42:10] ================= drm_test_rect_intersect  =================
[12:42:10] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[12:42:10] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[12:42:10] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[12:42:10] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[12:42:10] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[12:42:10] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[12:42:10] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[12:42:10] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[12:42:10] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[12:42:10] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[12:42:10] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[12:42:10] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[12:42:10] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[12:42:10] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[12:42:10] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[12:42:10] ============= [PASSED] drm_test_rect_intersect =============
[12:42:10] ================ drm_test_rect_calc_hscale  ================
[12:42:10] [PASSED] normal use
[12:42:10] [PASSED] out of max range
[12:42:10] [PASSED] out of min range
[12:42:10] [PASSED] zero dst
[12:42:10] [PASSED] negative src
[12:42:10] [PASSED] negative dst
[12:42:10] ============ [PASSED] drm_test_rect_calc_hscale ============
[12:42:10] ================ drm_test_rect_calc_vscale  ================
[12:42:10] [PASSED] normal use
[12:42:10] [PASSED] out of max range
[12:42:10] [PASSED] out of min range
[12:42:10] [PASSED] zero dst
[12:42:10] [PASSED] negative src
[12:42:10] [PASSED] negative dst
[12:42:10] ============ [PASSED] drm_test_rect_calc_vscale ============
[12:42:10] ================== drm_test_rect_rotate  ===================
[12:42:10] [PASSED] reflect-x
[12:42:10] [PASSED] reflect-y
[12:42:10] [PASSED] rotate-0
[12:42:10] [PASSED] rotate-90
[12:42:10] [PASSED] rotate-180
[12:42:10] [PASSED] rotate-270
[12:42:10] ============== [PASSED] drm_test_rect_rotate ===============
[12:42:10] ================ drm_test_rect_rotate_inv  =================
[12:42:10] [PASSED] reflect-x
[12:42:10] [PASSED] reflect-y
[12:42:10] [PASSED] rotate-0
[12:42:10] [PASSED] rotate-90
[12:42:10] [PASSED] rotate-180
[12:42:10] [PASSED] rotate-270
[12:42:10] ============ [PASSED] drm_test_rect_rotate_inv =============
[12:42:10] ==================== [PASSED] drm_rect =====================
[12:42:10] ============================================================
[12:42:10] Testing complete. Ran 511 tests: passed: 511
[12:42:10] Elapsed time: 23.807s total, 1.734s configuring, 21.852s building, 0.193s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


