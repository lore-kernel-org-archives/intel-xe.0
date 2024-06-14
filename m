Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92F1C27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 12:01:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A34A10ED0F;
	Fri, 14 Jun 2024 12:01:54 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B44710E24F;
 Fri, 14 Jun 2024 12:01:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_TTM_shrinker_helpers_and_xe_bu?=
 =?utf-8?q?ffer_object_shrinker_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Jun 2024 12:01:51 -0000
Message-ID: <171836651162.77190.10448543755080571965@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614102548.4364-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240614102548.4364-1-thomas.hellstrom@linux.intel.com>
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

Series: TTM shrinker helpers and xe buffer object shrinker (rev4)
URL   : https://patchwork.freedesktop.org/series/131815/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[12:00:46] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:00:50] Building KUnit Kernel ...
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

[12:01:16] Starting KUnit Kernel (1/1)...
[12:01:16] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[12:01:16] =================== guc_dbm (7 subtests) ===================
[12:01:16] [PASSED] test_empty
[12:01:16] [PASSED] test_default
[12:01:16] ======================== test_size  ========================
[12:01:16] [PASSED] 4
[12:01:16] [PASSED] 8
[12:01:16] [PASSED] 32
[12:01:16] [PASSED] 256
[12:01:16] ==================== [PASSED] test_size ====================
[12:01:16] ======================= test_reuse  ========================
[12:01:16] [PASSED] 4
[12:01:16] [PASSED] 8
[12:01:16] [PASSED] 32
[12:01:16] [PASSED] 256
[12:01:16] =================== [PASSED] test_reuse ====================
[12:01:16] =================== test_range_overlap  ====================
[12:01:16] [PASSED] 4
[12:01:16] [PASSED] 8
[12:01:16] [PASSED] 32
[12:01:16] [PASSED] 256
[12:01:16] =============== [PASSED] test_range_overlap ================
[12:01:16] =================== test_range_compact  ====================
[12:01:16] [PASSED] 4
[12:01:16] [PASSED] 8
[12:01:16] [PASSED] 32
[12:01:16] [PASSED] 256
[12:01:16] =============== [PASSED] test_range_compact ================
[12:01:16] ==================== test_range_spare  =====================
[12:01:16] [PASSED] 4
[12:01:16] [PASSED] 8
[12:01:16] [PASSED] 32
[12:01:16] [PASSED] 256
[12:01:16] ================ [PASSED] test_range_spare =================
[12:01:16] ===================== [PASSED] guc_dbm =====================
[12:01:16] =================== guc_idm (6 subtests) ===================
[12:01:16] [PASSED] bad_init
[12:01:16] [PASSED] no_init
[12:01:16] [PASSED] init_fini
[12:01:16] [PASSED] check_used
[12:01:16] [PASSED] check_quota
[12:01:16] [PASSED] check_all
[12:01:16] ===================== [PASSED] guc_idm =====================
[12:01:16] ================== no_relay (3 subtests) ===================
[12:01:16] [PASSED] xe_drops_guc2pf_if_not_ready
[12:01:16] [PASSED] xe_drops_guc2vf_if_not_ready
[12:01:16] [PASSED] xe_rejects_send_if_not_ready
[12:01:16] ==================== [PASSED] no_relay =====================
[12:01:16] ================== pf_relay (14 subtests) ==================
[12:01:16] [PASSED] pf_rejects_guc2pf_too_short
[12:01:16] [PASSED] pf_rejects_guc2pf_too_long
[12:01:16] [PASSED] pf_rejects_guc2pf_no_payload
[12:01:16] [PASSED] pf_fails_no_payload
[12:01:16] [PASSED] pf_fails_bad_origin
[12:01:16] [PASSED] pf_fails_bad_type
[12:01:16] [PASSED] pf_txn_reports_error
[12:01:16] [PASSED] pf_txn_sends_pf2guc
[12:01:16] [PASSED] pf_sends_pf2guc
[12:01:16] [SKIPPED] pf_loopback_nop
[12:01:16] [SKIPPED] pf_loopback_echo
[12:01:16] [SKIPPED] pf_loopback_fail
[12:01:16] [SKIPPED] pf_loopback_busy
[12:01:16] [SKIPPED] pf_loopback_retry
[12:01:16] ==================== [PASSED] pf_relay =====================
[12:01:16] ================== vf_relay (3 subtests) ===================
[12:01:16] [PASSED] vf_rejects_guc2vf_too_short
[12:01:16] [PASSED] vf_rejects_guc2vf_too_long
[12:01:16] [PASSED] vf_rejects_guc2vf_no_payload
[12:01:16] ==================== [PASSED] vf_relay =====================
[12:01:16] ================= pf_service (11 subtests) =================
[12:01:16] [PASSED] pf_negotiate_any
[12:01:16] [PASSED] pf_negotiate_base_match
[12:01:16] [PASSED] pf_negotiate_base_newer
[12:01:16] [PASSED] pf_negotiate_base_next
[12:01:16] [SKIPPED] pf_negotiate_base_older
[12:01:16] [PASSED] pf_negotiate_base_prev
[12:01:16] [PASSED] pf_negotiate_latest_match
[12:01:16] [PASSED] pf_negotiate_latest_newer
[12:01:16] [PASSED] pf_negotiate_latest_next
[12:01:16] [SKIPPED] pf_negotiate_latest_older
[12:01:16] [SKIPPED] pf_negotiate_latest_prev
[12:01:16] =================== [PASSED] pf_service ====================
[12:01:16] ===================== lmtt (1 subtest) =====================
[12:01:16] ======================== test_ops  =========================
[12:01:16] [PASSED] 2-level
[12:01:16] [PASSED] multi-level
[12:01:16] ==================== [PASSED] test_ops =====================
[12:01:16] ====================== [PASSED] lmtt =======================
[12:01:16] ==================== xe_bo (3 subtests) ====================
[12:01:16] [SKIPPED] xe_ccs_migrate_kunit
[12:01:16] [SKIPPED] xe_bo_evict_kunit
[12:01:16] [SKIPPED] xe_bo_shrink_kunit
[12:01:16] ===================== [SKIPPED] xe_bo ======================
[12:01:16] ================== xe_dma_buf (1 subtest) ==================
[12:01:16] [SKIPPED] xe_dma_buf_kunit
[12:01:16] =================== [SKIPPED] xe_dma_buf ===================
[12:01:16] ================== xe_migrate (1 subtest) ==================
[12:01:16] [SKIPPED] xe_migrate_sanity_kunit
[12:01:16] =================== [SKIPPED] xe_migrate ===================
[12:01:16] =================== xe_mocs (2 subtests) ===================
[12:01:16] [SKIPPED] xe_live_mocs_kernel_kunit
[12:01:16] [SKIPPED] xe_live_mocs_reset_kunit
[12:01:16] ==================== [SKIPPED] xe_mocs =====================
[12:01:16] ==================== args (11 subtests) ====================
[12:01:16] [PASSED] count_args_test
[12:01:16] [PASSED] call_args_example
[12:01:16] [PASSED] call_args_test
[12:01:16] [PASSED] drop_first_arg_example
[12:01:16] [PASSED] drop_first_arg_test
[12:01:16] [PASSED] first_arg_example
[12:01:16] [PASSED] first_arg_test
[12:01:16] [PASSED] last_arg_example
[12:01:16] [PASSED] last_arg_test
[12:01:16] [PASSED] pick_arg_example
[12:01:16] [PASSED] sep_comma_example
[12:01:16] ====================== [PASSED] args =======================
[12:01:16] =================== xe_pci (2 subtests) ====================
[12:01:16] [PASSED] xe_gmdid_graphics_ip
[12:01:16] [PASSED] xe_gmdid_media_ip
[12:01:16] ===================== [PASSED] xe_pci ======================
[12:01:16] ==================== xe_rtp (1 subtest) ====================
[12:01:16] ================== xe_rtp_process_tests  ===================
[12:01:16] [PASSED] coalesce-same-reg
[12:01:16] [PASSED] no-match-no-add
[12:01:16] [PASSED] no-match-no-add-multiple-rules
[12:01:16] [PASSED] two-regs-two-entries
[12:01:16] [PASSED] clr-one-set-other
[12:01:16] [PASSED] set-field
[12:01:16] [PASSED] conflict-duplicate
[12:01:16] [PASSED] conflict-not-disjoint
[12:01:16] [PASSED] conflict-reg-type
[12:01:16] ============== [PASSED] xe_rtp_process_tests ===============
stty: 'standard input': Inappropriate ioctl for device
[12:01:16] ===================== [PASSED] xe_rtp ======================
[12:01:16] ==================== xe_wa (1 subtest) =====================
[12:01:16] ======================== xe_wa_gt  =========================
[12:01:16] [PASSED] TIGERLAKE (B0)
[12:01:16] [PASSED] DG1 (A0)
[12:01:16] [PASSED] DG1 (B0)
[12:01:16] [PASSED] ALDERLAKE_S (A0)
[12:01:16] [PASSED] ALDERLAKE_S (B0)
[12:01:16] [PASSED] ALDERLAKE_S (C0)
[12:01:16] [PASSED] ALDERLAKE_S (D0)
[12:01:16] [PASSED] ALDERLAKE_P (A0)
[12:01:16] [PASSED] ALDERLAKE_P (B0)
[12:01:16] [PASSED] ALDERLAKE_P (C0)
[12:01:16] [PASSED] ALDERLAKE_S_RPLS (D0)
[12:01:16] [PASSED] ALDERLAKE_P_RPLU (E0)
[12:01:16] [PASSED] DG2_G10 (C0)
[12:01:16] [PASSED] DG2_G11 (B1)
[12:01:16] [PASSED] DG2_G12 (A1)
[12:01:16] [PASSED] METEORLAKE (g:A0, m:A0)
[12:01:16] [PASSED] METEORLAKE (g:A0, m:A0)
[12:01:16] [PASSED] METEORLAKE (g:A0, m:A0)
[12:01:16] [PASSED] LUNARLAKE (g:A0, m:A0)
[12:01:16] [PASSED] LUNARLAKE (g:B0, m:A0)
[12:01:16] ==================== [PASSED] xe_wa_gt =====================
[12:01:16] ====================== [PASSED] xe_wa ======================
[12:01:16] ============================================================
[12:01:16] Testing complete. Ran 110 tests: passed: 95, skipped: 15
[12:01:16] Elapsed time: 29.745s total, 4.258s configuring, 25.216s building, 0.217s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[12:01:16] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:01:18] Building KUnit Kernel ...
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

[12:01:40] Starting KUnit Kernel (1/1)...
[12:01:40] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[12:01:40] ============ drm_test_pick_cmdline (2 subtests) ============
[12:01:40] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[12:01:40] =============== drm_test_pick_cmdline_named  ===============
[12:01:40] [PASSED] NTSC
[12:01:40] [PASSED] NTSC-J
[12:01:40] [PASSED] PAL
[12:01:40] [PASSED] PAL-M
[12:01:40] =========== [PASSED] drm_test_pick_cmdline_named ===========
[12:01:40] ============== [PASSED] drm_test_pick_cmdline ==============
[12:01:40] ================== drm_buddy (7 subtests) ==================
[12:01:40] [PASSED] drm_test_buddy_alloc_limit
[12:01:40] [PASSED] drm_test_buddy_alloc_optimistic
[12:01:40] [PASSED] drm_test_buddy_alloc_pessimistic
[12:01:40] [PASSED] drm_test_buddy_alloc_pathological
[12:01:40] [PASSED] drm_test_buddy_alloc_contiguous
[12:01:40] [PASSED] drm_test_buddy_alloc_clear
[12:01:40] [PASSED] drm_test_buddy_alloc_range_bias
[12:01:40] ==================== [PASSED] drm_buddy ====================
[12:01:40] ============= drm_cmdline_parser (40 subtests) =============
[12:01:40] [PASSED] drm_test_cmdline_force_d_only
[12:01:40] [PASSED] drm_test_cmdline_force_D_only_dvi
[12:01:40] [PASSED] drm_test_cmdline_force_D_only_hdmi
[12:01:40] [PASSED] drm_test_cmdline_force_D_only_not_digital
[12:01:40] [PASSED] drm_test_cmdline_force_e_only
[12:01:40] [PASSED] drm_test_cmdline_res
[12:01:40] [PASSED] drm_test_cmdline_res_vesa
[12:01:40] [PASSED] drm_test_cmdline_res_vesa_rblank
[12:01:40] [PASSED] drm_test_cmdline_res_rblank
[12:01:40] [PASSED] drm_test_cmdline_res_bpp
[12:01:40] [PASSED] drm_test_cmdline_res_refresh
[12:01:40] [PASSED] drm_test_cmdline_res_bpp_refresh
[12:01:40] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[12:01:40] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[12:01:40] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[12:01:40] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[12:01:40] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[12:01:40] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[12:01:40] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[12:01:40] [PASSED] drm_test_cmdline_res_margins_force_on
[12:01:40] [PASSED] drm_test_cmdline_res_vesa_margins
[12:01:40] [PASSED] drm_test_cmdline_name
[12:01:40] [PASSED] drm_test_cmdline_name_bpp
[12:01:40] [PASSED] drm_test_cmdline_name_option
[12:01:40] [PASSED] drm_test_cmdline_name_bpp_option
[12:01:40] [PASSED] drm_test_cmdline_rotate_0
[12:01:40] [PASSED] drm_test_cmdline_rotate_90
[12:01:40] [PASSED] drm_test_cmdline_rotate_180
[12:01:40] [PASSED] drm_test_cmdline_rotate_270
[12:01:40] [PASSED] drm_test_cmdline_hmirror
[12:01:40] [PASSED] drm_test_cmdline_vmirror
[12:01:40] [PASSED] drm_test_cmdline_margin_options
[12:01:40] [PASSED] drm_test_cmdline_multiple_options
[12:01:40] [PASSED] drm_test_cmdline_bpp_extra_and_option
[12:01:40] [PASSED] drm_test_cmdline_extra_and_option
[12:01:40] [PASSED] drm_test_cmdline_freestanding_options
[12:01:40] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[12:01:40] [PASSED] drm_test_cmdline_panel_orientation
[12:01:40] ================ drm_test_cmdline_invalid  =================
[12:01:40] [PASSED] margin_only
[12:01:40] [PASSED] interlace_only
[12:01:40] [PASSED] res_missing_x
[12:01:40] [PASSED] res_missing_y
[12:01:40] [PASSED] res_bad_y
[12:01:40] [PASSED] res_missing_y_bpp
[12:01:40] [PASSED] res_bad_bpp
[12:01:40] [PASSED] res_bad_refresh
[12:01:40] [PASSED] res_bpp_refresh_force_on_off
[12:01:40] [PASSED] res_invalid_mode
[12:01:40] [PASSED] res_bpp_wrong_place_mode
[12:01:40] [PASSED] name_bpp_refresh
[12:01:40] [PASSED] name_refresh
[12:01:40] [PASSED] name_refresh_wrong_mode
[12:01:40] [PASSED] name_refresh_invalid_mode
[12:01:40] [PASSED] rotate_multiple
[12:01:40] [PASSED] rotate_invalid_val
[12:01:40] [PASSED] rotate_truncated
[12:01:40] [PASSED] invalid_option
[12:01:40] [PASSED] invalid_tv_option
[12:01:40] [PASSED] truncated_tv_option
[12:01:40] ============ [PASSED] drm_test_cmdline_invalid =============
[12:01:40] =============== drm_test_cmdline_tv_options  ===============
[12:01:40] [PASSED] NTSC
[12:01:40] [PASSED] NTSC_443
[12:01:40] [PASSED] NTSC_J
[12:01:40] [PASSED] PAL
[12:01:40] [PASSED] PAL_M
[12:01:40] [PASSED] PAL_N
[12:01:40] [PASSED] SECAM
[12:01:40] =========== [PASSED] drm_test_cmdline_tv_options ===========
[12:01:40] =============== [PASSED] drm_cmdline_parser ================
[12:01:40] ========== drmm_connector_hdmi_init (19 subtests) ==========
[12:01:40] [PASSED] drm_test_connector_hdmi_init_valid
[12:01:40] [PASSED] drm_test_connector_hdmi_init_bpc_8
[12:01:40] [PASSED] drm_test_connector_hdmi_init_bpc_10
[12:01:40] [PASSED] drm_test_connector_hdmi_init_bpc_12
[12:01:40] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[12:01:40] [PASSED] drm_test_connector_hdmi_init_bpc_null
[12:01:40] [PASSED] drm_test_connector_hdmi_init_formats_empty
[12:01:40] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[12:01:40] [PASSED] drm_test_connector_hdmi_init_null_ddc
[12:01:40] [PASSED] drm_test_connector_hdmi_init_null_product
[12:01:40] [PASSED] drm_test_connector_hdmi_init_null_vendor
[12:01:40] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[12:01:40] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[12:01:40] [PASSED] drm_test_connector_hdmi_init_product_valid
[12:01:40] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[12:01:40] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[12:01:40] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[12:01:40] ========= drm_test_connector_hdmi_init_type_valid  =========
[12:01:40] [PASSED] HDMI-A
[12:01:40] [PASSED] HDMI-B
[12:01:40] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[12:01:40] ======== drm_test_connector_hdmi_init_type_invalid  ========
[12:01:40] [PASSED] Unknown
[12:01:40] [PASSED] VGA
[12:01:40] [PASSED] DVI-I
[12:01:40] [PASSED] DVI-D
[12:01:40] [PASSED] DVI-A
[12:01:40] [PASSED] Composite
[12:01:40] [PASSED] SVIDEO
[12:01:40] [PASSED] LVDS
[12:01:40] [PASSED] Component
[12:01:40] [PASSED] DIN
[12:01:40] [PASSED] DP
[12:01:40] [PASSED] TV
[12:01:40] [PASSED] eDP
[12:01:40] [PASSED] Virtual
[12:01:40] [PASSED] DSI
[12:01:40] [PASSED] DPI
[12:01:40] [PASSED] Writeback
[12:01:40] [PASSED] SPI
[12:01:40] [PASSED] USB
[12:01:40] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[12:01:40] ============ [PASSED] drmm_connector_hdmi_init =============
[12:01:40] ============= drmm_connector_init (3 subtests) =============
[12:01:40] [PASSED] drm_test_drmm_connector_init
[12:01:40] [PASSED] drm_test_drmm_connector_init_null_ddc
[12:01:40] ========= drm_test_drmm_connector_init_type_valid  =========
[12:01:40] [PASSED] Unknown
[12:01:40] [PASSED] VGA
[12:01:40] [PASSED] DVI-I
[12:01:40] [PASSED] DVI-D
[12:01:40] [PASSED] DVI-A
[12:01:40] [PASSED] Composite
[12:01:40] [PASSED] SVIDEO
[12:01:40] [PASSED] LVDS
[12:01:40] [PASSED] Component
[12:01:40] [PASSED] DIN
[12:01:40] [PASSED] DP
[12:01:40] [PASSED] HDMI-A
[12:01:40] [PASSED] HDMI-B
[12:01:40] [PASSED] TV
[12:01:40] [PASSED] eDP
[12:01:40] [PASSED] Virtual
[12:01:40] [PASSED] DSI
[12:01:40] [PASSED] DPI
[12:01:40] [PASSED] Writeback
[12:01:40] [PASSED] SPI
[12:01:40] [PASSED] USB
[12:01:40] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[12:01:40] =============== [PASSED] drmm_connector_init ===============
[12:01:40] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[12:01:40] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[12:01:40] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[12:01:40] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[12:01:40] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[12:01:40] ========== drm_test_get_tv_mode_from_name_valid  ===========
[12:01:40] [PASSED] NTSC
[12:01:40] [PASSED] NTSC-443
[12:01:40] [PASSED] NTSC-J
[12:01:40] [PASSED] PAL
[12:01:40] [PASSED] PAL-M
[12:01:40] [PASSED] PAL-N
[12:01:40] [PASSED] SECAM
[12:01:40] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[12:01:40] [PASSED] drm_test_get_tv_mode_from_name_truncated
[12:01:40] ============ [PASSED] drm_get_tv_mode_from_name ============
[12:01:40] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[12:01:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[12:01:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[12:01:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[12:01:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[12:01:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[12:01:40] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[12:01:40] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[12:01:40] [PASSED] VIC 96
[12:01:40] [PASSED] VIC 97
[12:01:40] [PASSED] VIC 101
[12:01:40] [PASSED] VIC 102
[12:01:40] [PASSED] VIC 106
[12:01:40] [PASSED] VIC 107
[12:01:40] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[12:01:40] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[12:01:40] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[12:01:40] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[12:01:40] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[12:01:40] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[12:01:40] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[12:01:40] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[12:01:40] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[12:01:40] [PASSED] Automatic
[12:01:40] [PASSED] Full
[12:01:40] [PASSED] Limited 16:235
[12:01:40] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[12:01:40] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[12:01:40] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[12:01:40] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[12:01:40] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[12:01:40] [PASSED] RGB
[12:01:40] [PASSED] YUV 4:2:0
[12:01:40] [PASSED] YUV 4:2:2
[12:01:40] [PASSED] YUV 4:4:4
[12:01:40] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[12:01:40] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[12:01:40] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[12:01:40] ============= drm_damage_helper (21 subtests) ==============
[12:01:40] [PASSED] drm_test_damage_iter_no_damage
[12:01:40] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[12:01:40] [PASSED] drm_test_damage_iter_no_damage_src_moved
[12:01:40] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[12:01:40] [PASSED] drm_test_damage_iter_no_damage_not_visible
[12:01:40] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[12:01:40] [PASSED] drm_test_damage_iter_no_damage_no_fb
[12:01:40] [PASSED] drm_test_damage_iter_simple_damage
[12:01:40] [PASSED] drm_test_damage_iter_single_damage
[12:01:40] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[12:01:40] [PASSED] drm_test_damage_iter_single_damage_outside_src
[12:01:40] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[12:01:40] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[12:01:40] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[12:01:40] [PASSED] drm_test_damage_iter_single_damage_src_moved
[12:01:40] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[12:01:40] [PASSED] drm_test_damage_iter_damage
[12:01:40] [PASSED] drm_test_damage_iter_damage_one_intersect
[12:01:40] [PASSED] drm_test_damage_iter_damage_one_outside
[12:01:40] [PASSED] drm_test_damage_iter_damage_src_moved
[12:01:40] [PASSED] drm_test_damage_iter_damage_not_visible
[12:01:40] ================ [PASSED] drm_damage_helper ================
[12:01:40] ============== drm_dp_mst_helper (3 subtests) ==============
[12:01:40] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[12:01:40] [PASSED] Clock 154000 BPP 30 DSC disabled
[12:01:40] [PASSED] Clock 234000 BPP 30 DSC disabled
[12:01:40] [PASSED] Clock 297000 BPP 24 DSC disabled
[12:01:40] [PASSED] Clock 332880 BPP 24 DSC enabled
[12:01:40] [PASSED] Clock 324540 BPP 24 DSC enabled
[12:01:40] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[12:01:40] ============== drm_test_dp_mst_calc_pbn_div  ===============
[12:01:40] [PASSED] Link rate 2000000 lane count 4
[12:01:40] [PASSED] Link rate 2000000 lane count 2
[12:01:40] [PASSED] Link rate 2000000 lane count 1
[12:01:40] [PASSED] Link rate 1350000 lane count 4
[12:01:40] [PASSED] Link rate 1350000 lane count 2
[12:01:40] [PASSED] Link rate 1350000 lane count 1
[12:01:40] [PASSED] Link rate 1000000 lane count 4
[12:01:40] [PASSED] Link rate 1000000 lane count 2
[12:01:40] [PASSED] Link rate 1000000 lane count 1
[12:01:40] [PASSED] Link rate 810000 lane count 4
[12:01:40] [PASSED] Link rate 810000 lane count 2
[12:01:40] [PASSED] Link rate 810000 lane count 1
[12:01:40] [PASSED] Link rate 540000 lane count 4
[12:01:40] [PASSED] Link rate 540000 lane count 2
[12:01:40] [PASSED] Link rate 540000 lane count 1
[12:01:40] [PASSED] Link rate 270000 lane count 4
[12:01:40] [PASSED] Link rate 270000 lane count 2
[12:01:40] [PASSED] Link rate 270000 lane count 1
[12:01:40] [PASSED] Link rate 162000 lane count 4
[12:01:40] [PASSED] Link rate 162000 lane count 2
[12:01:40] [PASSED] Link rate 162000 lane count 1
[12:01:40] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[12:01:40] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[12:01:40] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[12:01:40] [PASSED] DP_POWER_UP_PHY with port number
[12:01:40] [PASSED] DP_POWER_DOWN_PHY with port number
[12:01:40] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[12:01:40] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[12:01:40] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[12:01:40] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[12:01:40] [PASSED] DP_QUERY_PAYLOAD with port number
[12:01:40] [PASSED] DP_QUERY_PAYLOAD with VCPI
[12:01:40] [PASSED] DP_REMOTE_DPCD_READ with port number
[12:01:40] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[12:01:40] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[12:01:40] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[12:01:40] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[12:01:40] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[12:01:40] [PASSED] DP_REMOTE_I2C_READ with port number
[12:01:40] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[12:01:40] [PASSED] DP_REMOTE_I2C_READ with transactions array
[12:01:40] [PASSED] DP_REMOTE_I2C_WRITE with port number
[12:01:40] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[12:01:40] [PASSED] DP_REMOTE_I2C_WRITE with data array
[12:01:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[12:01:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[12:01:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[12:01:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[12:01:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[12:01:40] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[12:01:40] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[12:01:40] ================ [PASSED] drm_dp_mst_helper ================
[12:01:40] ================== drm_exec (7 subtests) ===================
[12:01:40] [PASSED] sanitycheck
[12:01:40] [PASSED] test_lock
[12:01:40] [PASSED] test_lock_unlock
[12:01:40] [PASSED] test_duplicates
[12:01:40] [PASSED] test_prepare
[12:01:40] [PASSED] test_prepare_array
[12:01:40] [PASSED] test_multiple_loops
[12:01:40] ==================== [PASSED] drm_exec =====================
[12:01:40] =========== drm_format_helper_test (17 subtests) ===========
[12:01:40] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[12:01:40] [PASSED] single_pixel_source_buffer
[12:01:40] [PASSED] single_pixel_clip_rectangle
[12:01:40] [PASSED] well_known_colors
[12:01:40] [PASSED] destination_pitch
[12:01:40] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[12:01:40] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[12:01:40] [PASSED] single_pixel_source_buffer
[12:01:40] [PASSED] single_pixel_clip_rectangle
[12:01:40] [PASSED] well_known_colors
[12:01:40] [PASSED] destination_pitch
[12:01:40] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[12:01:40] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[12:01:40] [PASSED] single_pixel_source_buffer
[12:01:40] [PASSED] single_pixel_clip_rectangle
[12:01:40] [PASSED] well_known_colors
[12:01:40] [PASSED] destination_pitch
[12:01:40] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[12:01:40] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[12:01:40] [PASSED] single_pixel_source_buffer
[12:01:40] [PASSED] single_pixel_clip_rectangle
[12:01:40] [PASSED] well_known_colors
[12:01:40] [PASSED] destination_pitch
[12:01:40] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[12:01:40] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[12:01:40] [PASSED] single_pixel_source_buffer
[12:01:40] [PASSED] single_pixel_clip_rectangle
[12:01:40] [PASSED] well_known_colors
[12:01:40] [PASSED] destination_pitch
[12:01:40] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[12:01:40] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[12:01:40] [PASSED] single_pixel_source_buffer
[12:01:40] [PASSED] single_pixel_clip_rectangle
[12:01:40] [PASSED] well_known_colors
[12:01:40] [PASSED] destination_pitch
[12:01:40] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[12:01:40] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[12:01:40] [PASSED] single_pixel_source_buffer
[12:01:40] [PASSED] single_pixel_clip_rectangle
[12:01:40] [PASSED] well_known_colors
[12:01:40] [PASSED] destination_pitch
[12:01:40] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[12:01:40] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[12:01:40] [PASSED] single_pixel_source_buffer
[12:01:40] [PASSED] single_pixel_clip_rectangle
[12:01:40] [PASSED] well_known_colors
[12:01:40] [PASSED] destination_pitch
[12:01:40] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[12:01:40] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[12:01:40] [PASSED] single_pixel_source_buffer
[12:01:40] [PASSED] single_pixel_clip_rectangle
[12:01:40] [PASSED] well_known_colors
[12:01:40] [PASSED] destination_pitch
[12:01:40] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[12:01:40] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[12:01:40] [PASSED] single_pixel_source_buffer
[12:01:40] [PASSED] single_pixel_clip_rectangle
[12:01:40] [PASSED] well_known_colors
[12:01:40] [PASSED] destination_pitch
[12:01:40] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[12:01:40] ============== drm_test_fb_xrgb8888_to_mono  ===============
[12:01:40] [PASSED] single_pixel_source_buffer
[12:01:40] [PASSED] single_pixel_clip_rectangle
[12:01:40] [PASSED] well_known_colors
[12:01:40] [PASSED] destination_pitch
[12:01:40] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[12:01:40] ==================== drm_test_fb_swab  =====================
[12:01:40] [PASSED] single_pixel_source_buffer
[12:01:40] [PASSED] single_pixel_clip_rectangle
[12:01:40] [PASSED] well_known_colors
[12:01:40] [PASSED] destination_pitch
[12:01:40] ================ [PASSED] drm_test_fb_swab =================
[12:01:40] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[12:01:40] [PASSED] single_pixel_source_buffer
[12:01:40] [PASSED] single_pixel_clip_rectangle
[12:01:40] [PASSED] well_known_colors
[12:01:40] [PASSED] destination_pitch
[12:01:40] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[12:01:40] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[12:01:40] [PASSED] single_pixel_source_buffer
[12:01:40] [PASSED] single_pixel_clip_rectangle
[12:01:40] [PASSED] well_known_colors
[12:01:40] [PASSED] destination_pitch
[12:01:40] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[12:01:40] ================= drm_test_fb_clip_offset  =================
[12:01:40] [PASSED] pass through
[12:01:40] [PASSED] horizontal offset
[12:01:40] [PASSED] vertical offset
[12:01:40] [PASSED] horizontal and vertical offset
[12:01:40] [PASSED] horizontal offset (custom pitch)
[12:01:40] [PASSED] vertical offset (custom pitch)
[12:01:40] [PASSED] horizontal and vertical offset (custom pitch)
[12:01:40] ============= [PASSED] drm_test_fb_clip_offset =============
[12:01:40] ============== drm_test_fb_build_fourcc_list  ==============
[12:01:40] [PASSED] no native formats
[12:01:40] [PASSED] XRGB8888 as native format
[12:01:40] [PASSED] remove duplicates
[12:01:40] [PASSED] convert alpha formats
[12:01:40] [PASSED] random formats
[12:01:40] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[12:01:40] =================== drm_test_fb_memcpy  ====================
[12:01:40] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[12:01:40] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[12:01:40] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[12:01:40] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[12:01:40] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[12:01:40] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[12:01:40] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[12:01:40] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[12:01:40] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[12:01:40] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[12:01:40] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[12:01:40] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[12:01:40] =============== [PASSED] drm_test_fb_memcpy ================
[12:01:40] ============= [PASSED] drm_format_helper_test ==============
[12:01:40] ================= drm_format (18 subtests) =================
[12:01:40] [PASSED] drm_test_format_block_width_invalid
[12:01:40] [PASSED] drm_test_format_block_width_one_plane
[12:01:40] [PASSED] drm_test_format_block_width_two_plane
[12:01:40] [PASSED] drm_test_format_block_width_three_plane
[12:01:40] [PASSED] drm_test_format_block_width_tiled
[12:01:40] [PASSED] drm_test_format_block_height_invalid
[12:01:40] [PASSED] drm_test_format_block_height_one_plane
[12:01:40] [PASSED] drm_test_format_block_height_two_plane
[12:01:40] [PASSED] drm_test_format_block_height_three_plane
[12:01:40] [PASSED] drm_test_format_block_height_tiled
[12:01:40] [PASSED] drm_test_format_min_pitch_invalid
[12:01:40] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[12:01:40] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[12:01:40] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[12:01:40] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[12:01:40] [PASSED] drm_test_format_min_pitch_two_plane
[12:01:40] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[12:01:40] [PASSED] drm_test_format_min_pitch_tiled
[12:01:40] =================== [PASSED] drm_format ====================
[12:01:40] =============== drm_framebuffer (1 subtest) ================
[12:01:40] =============== drm_test_framebuffer_create  ===============
[12:01:40] [PASSED] ABGR8888 normal sizes
[12:01:40] [PASSED] ABGR8888 max sizes
[12:01:40] [PASSED] ABGR8888 pitch greater than min required
[12:01:40] [PASSED] ABGR8888 pitch less than min required
[12:01:40] [PASSED] ABGR8888 Invalid width
[12:01:40] [PASSED] ABGR8888 Invalid buffer handle
[12:01:40] [PASSED] No pixel format
[12:01:40] [PASSED] ABGR8888 Width 0
[12:01:40] [PASSED] ABGR8888 Height 0
[12:01:40] [PASSED] ABGR8888 Out of bound height * pitch combination
[12:01:40] [PASSED] ABGR8888 Large buffer offset
[12:01:40] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[12:01:40] [PASSED] ABGR8888 Valid buffer modifier
[12:01:40] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[12:01:40] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[12:01:40] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[12:01:40] [PASSED] NV12 Normal sizes
[12:01:40] [PASSED] NV12 Max sizes
[12:01:40] [PASSED] NV12 Invalid pitch
[12:01:40] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[12:01:40] [PASSED] NV12 different  modifier per-plane
[12:01:40] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[12:01:40] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[12:01:40] [PASSED] NV12 Modifier for inexistent plane
[12:01:40] [PASSED] NV12 Handle for inexistent plane
[12:01:40] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[12:01:40] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[12:01:40] [PASSED] YVU420 Normal sizes
[12:01:40] [PASSED] YVU420 Max sizes
[12:01:40] [PASSED] YVU420 Invalid pitch
[12:01:40] [PASSED] YVU420 Different pitches
[12:01:40] [PASSED] YVU420 Different buffer offsets/pitches
[12:01:40] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[12:01:40] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[12:01:40] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[12:01:40] [PASSED] YVU420 Valid modifier
[12:01:40] [PASSED] YVU420 Different modifiers per plane
[12:01:40] [PASSED] YVU420 Modifier for inexistent plane
[12:01:40] [PASSED] X0L2 Normal sizes
[12:01:40] [PASSED] X0L2 Max sizes
[12:01:40] [PASSED] X0L2 Invalid pitch
[12:01:40] [PASSED] X0L2 Pitch greater than minimum required
[12:01:40] [PASSED] X0L2 Handle for inexistent plane
[12:01:40] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[12:01:40] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[12:01:40] [PASSED] X0L2 Valid modifier
[12:01:40] [PASSED] X0L2 Modifier for inexistent plane
[12:01:40] =========== [PASSED] drm_test_framebuffer_create ===========
[12:01:40] ================= [PASSED] drm_framebuffer =================
[12:01:40] ================ drm_gem_shmem (8 subtests) ================
[12:01:40] [PASSED] drm_gem_shmem_test_obj_create
[12:01:40] [PASSED] drm_gem_shmem_test_obj_create_private
[12:01:40] [PASSED] drm_gem_shmem_test_pin_pages
[12:01:40] [PASSED] drm_gem_shmem_test_vmap
[12:01:40] [PASSED] drm_gem_shmem_test_get_pages_sgt
[12:01:40] [PASSED] drm_gem_shmem_test_get_sg_table
[12:01:40] [PASSED] drm_gem_shmem_test_madvise
[12:01:40] [PASSED] drm_gem_shmem_test_purge
[12:01:40] ================== [PASSED] drm_gem_shmem ==================
[12:01:40] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[12:01:40] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[12:01:40] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[12:01:40] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[12:01:40] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[12:01:40] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[12:01:40] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[12:01:40] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[12:01:40] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[12:01:40] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[12:01:40] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[12:01:40] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[12:01:40] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[12:01:40] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[12:01:40] [PASSED] drm_test_check_output_bpc_dvi
[12:01:40] [PASSED] drm_test_check_output_bpc_format_vic_1
[12:01:40] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[12:01:40] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[12:01:40] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[12:01:40] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[12:01:40] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[12:01:40] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[12:01:40] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[12:01:40] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[12:01:40] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[12:01:40] [PASSED] drm_test_check_broadcast_rgb_value
[12:01:40] [PASSED] drm_test_check_bpc_8_value
[12:01:40] [PASSED] drm_test_check_bpc_10_value
[12:01:40] [PASSED] drm_test_check_bpc_12_value
[12:01:40] [PASSED] drm_test_check_format_value
[12:01:40] [PASSED] drm_test_check_tmds_char_value
[12:01:40] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[12:01:40] ================= drm_managed (2 subtests) =================
[12:01:40] [PASSED] drm_test_managed_release_action
[12:01:40] [PASSED] drm_test_managed_run_action
[12:01:40] =================== [PASSED] drm_managed ===================
[12:01:40] =================== drm_mm (6 subtests) ====================
[12:01:40] [PASSED] drm_test_mm_init
[12:01:40] [PASSED] drm_test_mm_debug
[12:01:40] [PASSED] drm_test_mm_align32
[12:01:40] [PASSED] drm_test_mm_align64
[12:01:40] [PASSED] drm_test_mm_lowest
[12:01:40] [PASSED] drm_test_mm_highest
[12:01:40] ===================== [PASSED] drm_mm ======================
[12:01:40] ============= drm_modes_analog_tv (4 subtests) =============
[12:01:40] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[12:01:40] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[12:01:40] [PASSED] drm_test_modes_analog_tv_pal_576i
[12:01:40] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[12:01:40] =============== [PASSED] drm_modes_analog_tv ===============
[12:01:40] ============== drm_plane_helper (2 subtests) ===============
[12:01:40] =============== drm_test_check_plane_state  ================
[12:01:40] [PASSED] clipping_simple
[12:01:40] [PASSED] clipping_rotate_reflect
[12:01:40] [PASSED] positioning_simple
[12:01:40] [PASSED] upscaling
[12:01:40] [PASSED] downscaling
[12:01:40] [PASSED] rounding1
[12:01:40] [PASSED] rounding2
[12:01:40] [PASSED] rounding3
[12:01:40] [PASSED] rounding4
[12:01:40] =========== [PASSED] drm_test_check_plane_state ============
[12:01:40] =========== drm_test_check_invalid_plane_state  ============
[12:01:40] [PASSED] positioning_invalid
[12:01:40] [PASSED] upscaling_invalid
[12:01:40] [PASSED] downscaling_invalid
[12:01:40] ======= [PASSED] drm_test_check_invalid_plane_state ========
[12:01:40] ================ [PASSED] drm_plane_helper =================
stty: 'standard input': Inappropriate ioctl for device
[12:01:40] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[12:01:40] ====== drm_test_connector_helper_tv_get_modes_check  =======
[12:01:40] [PASSED] None
[12:01:40] [PASSED] PAL
[12:01:40] [PASSED] NTSC
[12:01:40] [PASSED] Both, NTSC Default
[12:01:40] [PASSED] Both, PAL Default
[12:01:40] [PASSED] Both, NTSC Default, with PAL on command-line
[12:01:40] [PASSED] Both, PAL Default, with NTSC on command-line
[12:01:40] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[12:01:40] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[12:01:40] ================== drm_rect (9 subtests) ===================
[12:01:40] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[12:01:40] [PASSED] drm_test_rect_clip_scaled_not_clipped
[12:01:40] [PASSED] drm_test_rect_clip_scaled_clipped
[12:01:40] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[12:01:40] ================= drm_test_rect_intersect  =================
[12:01:40] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[12:01:40] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[12:01:40] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[12:01:40] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[12:01:40] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[12:01:40] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[12:01:40] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[12:01:40] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[12:01:40] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[12:01:40] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[12:01:40] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[12:01:40] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[12:01:40] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[12:01:40] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[12:01:40] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[12:01:40] ============= [PASSED] drm_test_rect_intersect =============
[12:01:40] ================ drm_test_rect_calc_hscale  ================
[12:01:40] [PASSED] normal use
[12:01:40] [PASSED] out of max range
[12:01:40] [PASSED] out of min range
[12:01:40] [PASSED] zero dst
[12:01:40] [PASSED] negative src
[12:01:40] [PASSED] negative dst
[12:01:40] ============ [PASSED] drm_test_rect_calc_hscale ============
[12:01:40] ================ drm_test_rect_calc_vscale  ================
[12:01:40] [PASSED] normal use
[12:01:40] [PASSED] out of max range
[12:01:40] [PASSED] out of min range
[12:01:40] [PASSED] zero dst
[12:01:40] [PASSED] negative src
[12:01:40] [PASSED] negative dst
[12:01:40] ============ [PASSED] drm_test_rect_calc_vscale ============
[12:01:40] ================== drm_test_rect_rotate  ===================
[12:01:40] [PASSED] reflect-x
[12:01:40] [PASSED] reflect-y
[12:01:40] [PASSED] rotate-0
[12:01:40] [PASSED] rotate-90
[12:01:40] [PASSED] rotate-180
[12:01:40] [PASSED] rotate-270
[12:01:40] ============== [PASSED] drm_test_rect_rotate ===============
[12:01:40] ================ drm_test_rect_rotate_inv  =================
[12:01:40] [PASSED] reflect-x
[12:01:40] [PASSED] reflect-y
[12:01:40] [PASSED] rotate-0
[12:01:40] [PASSED] rotate-90
[12:01:40] [PASSED] rotate-180
[12:01:40] [PASSED] rotate-270
[12:01:40] ============ [PASSED] drm_test_rect_rotate_inv =============
[12:01:40] ==================== [PASSED] drm_rect =====================
[12:01:40] ============================================================
[12:01:40] Testing complete. Ran 511 tests: passed: 511
[12:01:40] Elapsed time: 23.965s total, 1.700s configuring, 22.094s building, 0.155s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
ERROR:root:In file included from ../include/linux/build_bug.h:5,
                 from ../include/linux/container_of.h:5,
                 from ../include/linux/list.h:5,
                 from ../include/drm/ttm/ttm_resource.h:29,
                 from ../drivers/gpu/drm/ttm/tests/ttm_resource_test.c:5:
../drivers/gpu/drm/ttm/tests/ttm_resource_test.c: In function ‘ttm_resource_fini_basic’:
../drivers/gpu/drm/ttm/tests/ttm_resource_test.c:201:37: error: passing argument 1 of ‘list_empty’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  201 |  KUNIT_ASSERT_TRUE(test, list_empty(&res->lru));
      |                                     ^~~~~~~~~
      |                                     |
      |                                     struct ttm_lru_item *
../include/linux/compiler.h:76:40: note: in definition of macro ‘likely’
   76 | # define likely(x) __builtin_expect(!!(x), 1)
      |                                        ^
../include/kunit/test.h:668:2: note: in expansion of macro ‘KUNIT_UNARY_ASSERTION’
  668 |  KUNIT_UNARY_ASSERTION(test,            \
      |  ^~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1232:2: note: in expansion of macro ‘KUNIT_TRUE_MSG_ASSERTION’
 1232 |  KUNIT_TRUE_MSG_ASSERTION(test,            \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1229:2: note: in expansion of macro ‘KUNIT_ASSERT_TRUE_MSG’
 1229 |  KUNIT_ASSERT_TRUE_MSG(test, condition, NULL)
      |  ^~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/tests/ttm_resource_test.c:201:2: note: in expansion of macro ‘KUNIT_ASSERT_TRUE’
  201 |  KUNIT_ASSERT_TRUE(test, list_empty(&res->lru));
      |  ^~~~~~~~~~~~~~~~~
In file included from ../include/drm/ttm/ttm_resource.h:29,
                 from ../drivers/gpu/drm/ttm/tests/ttm_resource_test.c:5:
../include/linux/list.h:371:54: note: expected ‘const struct list_head *’ but argument is of type ‘struct ttm_lru_item *’
  371 | static inline int list_empty(const struct list_head *head)
      |                              ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
In file included from ../include/drm/drm_kunit_helpers.h:10,
                 from ../drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h:13,
                 from ../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:17:
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c: In function ‘ttm_bo_unreserve_basic’:
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:268:17: error: passing argument 1 of ‘list_is_last’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  268 |    list_is_last(&res1->lru, &man->lru[bo->priority]), 1);
      |                 ^~~~~~~~~~
      |                 |
      |                 struct ttm_lru_item *
../include/kunit/test.h:707:15: note: in definition of macro ‘KUNIT_BASE_BINARY_ASSERTION’
  707 |  const typeof(left) __left = (left);           \
      |               ^~~~
../include/kunit/test.h:1271:2: note: in expansion of macro ‘KUNIT_BINARY_INT_ASSERTION’
 1271 |  KUNIT_BINARY_INT_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1268:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ_MSG’
 1268 |  KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
      |  ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:267:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ’
  267 |  KUNIT_ASSERT_EQ(test,
      |  ^~~~~~~~~~~~~~~
In file included from ../include/linux/mutex.h:15,
                 from ../include/linux/ww_mutex.h:20,
                 from ../include/linux/dma-resv.h:42,
                 from ../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:5:
../include/linux/list.h:352:56: note: expected ‘const struct list_head *’ but argument is of type ‘struct ttm_lru_item *’
  352 | static inline int list_is_last(const struct list_head *list, const struct list_head *head)
      |                                ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
In file included from ../include/drm/drm_kunit_helpers.h:10,
                 from ../drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h:13,
                 from ../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:17:
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:268:17: error: passing argument 1 of ‘list_is_last’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  268 |    list_is_last(&res1->lru, &man->lru[bo->priority]), 1);
      |                 ^~~~~~~~~~
      |                 |
      |                 struct ttm_lru_item *
../include/kunit/test.h:707:31: note: in definition of macro ‘KUNIT_BASE_BINARY_ASSERTION’
  707 |  const typeof(left) __left = (left);           \
      |                               ^~~~
../include/kunit/test.h:1271:2: note: in expansion of macro ‘KUNIT_BINARY_INT_ASSERTION’
 1271 |  KUNIT_BINARY_INT_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1268:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ_MSG’
 1268 |  KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
      |  ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:267:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ’
  267 |  KUNIT_ASSERT_EQ(test,
      |  ^~~~~~~~~~~~~~~
In file included from ../include/linux/mutex.h:15,
                 from ../include/linux/ww_mutex.h:20,
                 from ../include/linux/dma-resv.h:42,
                 from ../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:5:
../include/linux/list.h:352:56: note: expected ‘const struct list_head *’ but argument is of type ‘struct ttm_lru_item *’
  352 | static inline int list_is_last(const struct list_head *list, const struct list_head *head)
      |                                ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
In file included from ../include/drm/drm_kunit_helpers.h:10,
                 from ../drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h:13,
                 from ../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:17:
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c: In function ‘ttm_bo_unreserve_pinned’:
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:305:17: error: passing argument 1 of ‘list_is_last’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  305 |    list_is_last(&res2->lru, &priv->ttm_dev->pinned), 1);
      |                 ^~~~~~~~~~
      |                 |
      |                 struct ttm_lru_item *
../include/kunit/test.h:707:15: note: in definition of macro ‘KUNIT_BASE_BINARY_ASSERTION’
  707 |  const typeof(left) __left = (left);           \
      |               ^~~~
../include/kunit/test.h:1271:2: note: in expansion of macro ‘KUNIT_BINARY_INT_ASSERTION’
 1271 |  KUNIT_BINARY_INT_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1268:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ_MSG’
 1268 |  KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
      |  ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:304:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ’
  304 |  KUNIT_ASSERT_EQ(test,
      |  ^~~~~~~~~~~~~~~
In file included from ../include/linux/mutex.h:15,
                 from ../include/linux/ww_mutex.h:20,
                 from ../include/linux/dma-resv.h:42,
                 from ../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:5:
../include/linux/list.h:352:56: note: expected ‘const struct list_head *’ but argument is of type ‘struct ttm_lru_item *’
  352 | static inline int list_is_last(const struct list_head *list, const struct list_head *head)
      |                                ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
In file included from ../include/drm/drm_kunit_helpers.h:10,
                 from ../drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h:13,
                 from ../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:17:
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:305:17: error: passing argument 1 of ‘list_is_last’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  305 |    list_is_last(&res2->lru, &priv->ttm_dev->pinned), 1);
      |                 ^~~~~~~~~~
      |                 |
      |                 struct ttm_lru_item *
../include/kunit/test.h:707:31: note: in definition of macro ‘KUNIT_BASE_BINARY_ASSERTION’
  707 |  const typeof(left) __left = (left);           \
      |                               ^~~~
../include/kunit/test.h:1271:2: note: in expansion of macro ‘KUNIT_BINARY_INT_ASSERTION’
 1271 |  KUNIT_BINARY_INT_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1268:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ_MSG’
 1268 |  KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
      |  ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:304:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ’
  304 |  KUNIT_ASSERT_EQ(test,
      |  ^~~~~~~~~~~~~~~
In file included from ../include/linux/mutex.h:15,
                 from ../include/linux/ww_mutex.h:20,
                 from ../include/linux/dma-resv.h:42,
                 from ../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:5:
../include/linux/list.h:352:56: note: expected ‘const struct list_head *’ but argument is of type ‘struct ttm_lru_item *’
  352 | static inline int list_is_last(const struct list_head *list, const struct list_head *head)
      |                                ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
In file included from ../include/drm/drm_kunit_helpers.h:10,
                 from ../drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h:13,
                 from ../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:17:
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:309:17: error: passing argument 1 of ‘list_is_last’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  309 |    list_is_last(&res1->lru, &priv->ttm_dev->pinned), 1);
      |                 ^~~~~~~~~~
      |                 |
      |                 struct ttm_lru_item *
../include/kunit/test.h:707:15: note: in definition of macro ‘KUNIT_BASE_BINARY_ASSERTION’
  707 |  const typeof(left) __left = (left);           \
      |               ^~~~
../include/kunit/test.h:1271:2: note: in expansion of macro ‘KUNIT_BINARY_INT_ASSERTION’
 1271 |  KUNIT_BINARY_INT_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1268:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ_MSG’
 1268 |  KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
      |  ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:308:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ’
  308 |  KUNIT_ASSERT_EQ(test,
      |  ^~~~~~~~~~~~~~~
In file included from ../include/linux/mutex.h:15,
                 from ../include/linux/ww_mutex.h:20,
                 from ../include/linux/dma-resv.h:42,
                 from ../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:5:
../include/linux/list.h:352:56: note: expected ‘const struct list_head *’ but argument is of type ‘struct ttm_lru_item *’
  352 | static inline int list_is_last(const struct list_head *list, const struct list_head *head)
      |                                ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
In file included from ../include/drm/drm_kunit_helpers.h:10,
                 from ../drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h:13,
                 from ../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:17:
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:309:17: error: passing argument 1 of ‘list_is_last’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  309 |    list_is_last(&res1->lru, &priv->ttm_dev->pinned), 1);
      |                 ^~~~~~~~~~
      |                 |
      |                 struct ttm_lru_item *
../include/kunit/test.h:707:31: note: in definition of macro ‘KUNIT_BASE_BINARY_ASSERTION’
  707 |  const typeof(left) __left = (left);           \
      |                               ^~~~
../include/kunit/test.h:1271:2: note: in expansion of macro ‘KUNIT_BINARY_INT_ASSERTION’
 1271 |  KUNIT_BINARY_INT_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1268:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ_MSG’
 1268 |  KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
      |  ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:308:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ’
  308 |  KUNIT_ASSERT_EQ(test,
      |  ^~~~~~~~~~~~~~~
In file included from ../include/linux/mutex.h:15,
                 from ../include/linux/ww_mutex.h:20,
                 from ../include/linux/dma-resv.h:42,
                 from ../drivers/gpu/drm/ttm/tests/ttm_bo_test.c:5:
../include/linux/list.h:352:56: note: expected ‘const struct list_head *’ but argument is of type ‘struct ttm_lru_item *’
  352 | static inline int list_is_last(const struct list_head *list, const struct list_head *head)
      |                                ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
cc1: some warnings being treated as errors
make[8]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/ttm/tests/ttm_resource_test.o] Error 1
make[8]: *** Waiting for unfinished jobs....
cc1: some warnings being treated as errors
make[8]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/ttm/tests/ttm_bo_test.o] Error 1
make[7]: *** [../scripts/Makefile.build:485: drivers/gpu/drm/ttm/tests] Error 2
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:485: drivers/gpu/drm/ttm] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:485: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:485: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:485: drivers] Error 2
make[2]: *** [/kernel/Makefile:1934: .] Error 2
make[1]: *** [/kernel/Makefile:240: __sub-make] Error 2
make: *** [Makefile:240: __sub-make] Error 2

[12:01:40] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:01:42] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


