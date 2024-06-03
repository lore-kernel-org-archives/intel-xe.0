Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D805AC25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 09:03:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6436610E0EE;
	Mon,  3 Jun 2024 09:03:28 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA53510E0EE;
 Mon,  3 Jun 2024 09:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Use_missing_lock_in_?=
 =?utf-8?q?relay=5Fneeds=5Fworker?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Jun 2024 09:03:26 -0000
Message-ID: <171740540688.2261314.1107883489415157518@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240603081723.18775-1-nirmoy.das@intel.com>
In-Reply-To: <20240603081723.18775-1-nirmoy.das@intel.com>
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

Series: drm/xe: Use missing lock in relay_needs_worker
URL   : https://patchwork.freedesktop.org/series/134355/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[09:02:30] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:02:35] Building KUnit Kernel ...
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

[09:03:00] Starting KUnit Kernel (1/1)...
[09:03:00] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[09:03:00] =================== guc_dbm (7 subtests) ===================
[09:03:00] [PASSED] test_empty
[09:03:00] [PASSED] test_default
[09:03:00] ======================== test_size  ========================
[09:03:00] [PASSED] 4
[09:03:00] [PASSED] 8
[09:03:00] [PASSED] 32
[09:03:00] [PASSED] 256
[09:03:00] ==================== [PASSED] test_size ====================
[09:03:00] ======================= test_reuse  ========================
[09:03:00] [PASSED] 4
[09:03:00] [PASSED] 8
[09:03:00] [PASSED] 32
[09:03:00] [PASSED] 256
[09:03:00] =================== [PASSED] test_reuse ====================
[09:03:00] =================== test_range_overlap  ====================
[09:03:00] [PASSED] 4
[09:03:00] [PASSED] 8
[09:03:00] [PASSED] 32
[09:03:00] [PASSED] 256
[09:03:00] =============== [PASSED] test_range_overlap ================
[09:03:00] =================== test_range_compact  ====================
[09:03:00] [PASSED] 4
[09:03:00] [PASSED] 8
[09:03:00] [PASSED] 32
[09:03:00] [PASSED] 256
[09:03:00] =============== [PASSED] test_range_compact ================
[09:03:00] ==================== test_range_spare  =====================
[09:03:00] [PASSED] 4
[09:03:00] [PASSED] 8
[09:03:00] [PASSED] 32
[09:03:00] [PASSED] 256
[09:03:00] ================ [PASSED] test_range_spare =================
[09:03:00] ===================== [PASSED] guc_dbm =====================
[09:03:00] =================== guc_idm (6 subtests) ===================
[09:03:00] [PASSED] bad_init
[09:03:00] [PASSED] no_init
[09:03:00] [PASSED] init_fini
[09:03:00] [PASSED] check_used
[09:03:00] [PASSED] check_quota
[09:03:00] [PASSED] check_all
[09:03:00] ===================== [PASSED] guc_idm =====================
[09:03:00] ================== no_relay (3 subtests) ===================
[09:03:00] [PASSED] xe_drops_guc2pf_if_not_ready
[09:03:00] [PASSED] xe_drops_guc2vf_if_not_ready
[09:03:00] [PASSED] xe_rejects_send_if_not_ready
[09:03:00] ==================== [PASSED] no_relay =====================
[09:03:00] ================== pf_relay (14 subtests) ==================
[09:03:00] [PASSED] pf_rejects_guc2pf_too_short
[09:03:00] [PASSED] pf_rejects_guc2pf_too_long
[09:03:00] [PASSED] pf_rejects_guc2pf_no_payload
[09:03:00] [PASSED] pf_fails_no_payload
[09:03:00] [PASSED] pf_fails_bad_origin
[09:03:00] [PASSED] pf_fails_bad_type
[09:03:00] [PASSED] pf_txn_reports_error
[09:03:00] [PASSED] pf_txn_sends_pf2guc
[09:03:00] [PASSED] pf_sends_pf2guc
[09:03:00] [SKIPPED] pf_loopback_nop
[09:03:00] [SKIPPED] pf_loopback_echo
[09:03:00] [SKIPPED] pf_loopback_fail
[09:03:00] [SKIPPED] pf_loopback_busy
[09:03:00] [SKIPPED] pf_loopback_retry
[09:03:00] ==================== [PASSED] pf_relay =====================
[09:03:00] ================== vf_relay (3 subtests) ===================
[09:03:00] [PASSED] vf_rejects_guc2vf_too_short
[09:03:00] [PASSED] vf_rejects_guc2vf_too_long
[09:03:00] [PASSED] vf_rejects_guc2vf_no_payload
[09:03:00] ==================== [PASSED] vf_relay =====================
[09:03:00] ================= pf_service (11 subtests) =================
[09:03:00] [PASSED] pf_negotiate_any
[09:03:00] [PASSED] pf_negotiate_base_match
[09:03:00] [PASSED] pf_negotiate_base_newer
[09:03:00] [PASSED] pf_negotiate_base_next
[09:03:00] [SKIPPED] pf_negotiate_base_older
[09:03:00] [PASSED] pf_negotiate_base_prev
[09:03:00] [PASSED] pf_negotiate_latest_match
[09:03:00] [PASSED] pf_negotiate_latest_newer
[09:03:00] [PASSED] pf_negotiate_latest_next
[09:03:00] [SKIPPED] pf_negotiate_latest_older
[09:03:00] [SKIPPED] pf_negotiate_latest_prev
[09:03:00] =================== [PASSED] pf_service ====================
[09:03:00] ===================== lmtt (1 subtest) =====================
[09:03:00] ======================== test_ops  =========================
[09:03:00] [PASSED] 2-level
[09:03:00] [PASSED] multi-level
[09:03:00] ==================== [PASSED] test_ops =====================
[09:03:00] ====================== [PASSED] lmtt =======================
[09:03:00] ==================== xe_bo (2 subtests) ====================
[09:03:00] [SKIPPED] xe_ccs_migrate_kunit
[09:03:00] [SKIPPED] xe_bo_evict_kunit
[09:03:00] ===================== [SKIPPED] xe_bo ======================
[09:03:00] ================== xe_dma_buf (1 subtest) ==================
[09:03:00] [SKIPPED] xe_dma_buf_kunit
[09:03:00] =================== [SKIPPED] xe_dma_buf ===================
[09:03:00] ================== xe_migrate (1 subtest) ==================
[09:03:00] [SKIPPED] xe_migrate_sanity_kunit
[09:03:00] =================== [SKIPPED] xe_migrate ===================
[09:03:00] =================== xe_mocs (2 subtests) ===================
[09:03:00] [SKIPPED] xe_live_mocs_kernel_kunit
[09:03:00] [SKIPPED] xe_live_mocs_reset_kunit
[09:03:00] ==================== [SKIPPED] xe_mocs =====================
[09:03:00] ==================== args (11 subtests) ====================
[09:03:00] [PASSED] count_args_test
[09:03:00] [PASSED] call_args_example
[09:03:00] [PASSED] call_args_test
[09:03:00] [PASSED] drop_first_arg_example
[09:03:00] [PASSED] drop_first_arg_test
[09:03:00] [PASSED] first_arg_example
[09:03:00] [PASSED] first_arg_test
[09:03:00] [PASSED] last_arg_example
[09:03:00] [PASSED] last_arg_test
[09:03:00] [PASSED] pick_arg_example
[09:03:00] [PASSED] sep_comma_example
[09:03:00] ====================== [PASSED] args =======================
[09:03:00] =================== xe_pci (2 subtests) ====================
[09:03:00] [PASSED] xe_gmdid_graphics_ip
[09:03:00] [PASSED] xe_gmdid_media_ip
[09:03:00] ===================== [PASSED] xe_pci ======================
[09:03:00] ==================== xe_rtp (1 subtest) ====================
[09:03:00] ================== xe_rtp_process_tests  ===================
[09:03:00] [PASSED] coalesce-same-reg
[09:03:00] [PASSED] no-match-no-add
[09:03:00] [PASSED] no-match-no-add-multiple-rules
[09:03:00] [PASSED] two-regs-two-entries
[09:03:00] [PASSED] clr-one-set-other
[09:03:00] [PASSED] set-field
[09:03:00] [PASSED] conflict-duplicate
[09:03:00] [PASSED] conflict-not-disjoint
[09:03:00] [PASSED] conflict-reg-type
[09:03:00] ============== [PASSED] xe_rtp_process_tests ===============
stty: 'standard input': Inappropriate ioctl for device
[09:03:00] ===================== [PASSED] xe_rtp ======================
[09:03:00] ==================== xe_wa (1 subtest) =====================
[09:03:00] ======================== xe_wa_gt  =========================
[09:03:00] [PASSED] TIGERLAKE (B0)
[09:03:00] [PASSED] DG1 (A0)
[09:03:00] [PASSED] DG1 (B0)
[09:03:00] [PASSED] ALDERLAKE_S (A0)
[09:03:00] [PASSED] ALDERLAKE_S (B0)
[09:03:00] [PASSED] ALDERLAKE_S (C0)
[09:03:00] [PASSED] ALDERLAKE_S (D0)
[09:03:00] [PASSED] ALDERLAKE_P (A0)
[09:03:00] [PASSED] ALDERLAKE_P (B0)
[09:03:00] [PASSED] ALDERLAKE_P (C0)
[09:03:00] [PASSED] ALDERLAKE_S_RPLS (D0)
[09:03:00] [PASSED] ALDERLAKE_P_RPLU (E0)
[09:03:00] [PASSED] DG2_G10 (C0)
[09:03:00] [PASSED] DG2_G11 (B1)
[09:03:00] [PASSED] DG2_G12 (A1)
[09:03:00] [PASSED] METEORLAKE (g:A0, m:A0)
[09:03:00] [PASSED] METEORLAKE (g:A0, m:A0)
[09:03:00] [PASSED] METEORLAKE (g:A0, m:A0)
[09:03:00] [PASSED] LUNARLAKE (g:A0, m:A0)
[09:03:00] [PASSED] LUNARLAKE (g:B0, m:A0)
[09:03:00] ==================== [PASSED] xe_wa_gt =====================
[09:03:00] ====================== [PASSED] xe_wa ======================
[09:03:00] ============================================================
[09:03:00] Testing complete. Ran 109 tests: passed: 95, skipped: 14
[09:03:00] Elapsed time: 29.802s total, 4.265s configuring, 25.266s building, 0.227s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[09:03:00] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:03:02] Building KUnit Kernel ...
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

[09:03:23] Starting KUnit Kernel (1/1)...
[09:03:23] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[09:03:23] ============ drm_test_pick_cmdline (2 subtests) ============
[09:03:23] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[09:03:23] =============== drm_test_pick_cmdline_named  ===============
[09:03:23] [PASSED] NTSC
[09:03:23] [PASSED] NTSC-J
[09:03:23] [PASSED] PAL
[09:03:23] [PASSED] PAL-M
[09:03:23] =========== [PASSED] drm_test_pick_cmdline_named ===========
[09:03:23] ============== [PASSED] drm_test_pick_cmdline ==============
[09:03:23] ================== drm_buddy (7 subtests) ==================
[09:03:23] [PASSED] drm_test_buddy_alloc_limit
[09:03:23] [PASSED] drm_test_buddy_alloc_optimistic
[09:03:23] [PASSED] drm_test_buddy_alloc_pessimistic
[09:03:23] [PASSED] drm_test_buddy_alloc_pathological
[09:03:23] [PASSED] drm_test_buddy_alloc_contiguous
[09:03:23] [PASSED] drm_test_buddy_alloc_clear
[09:03:23] [PASSED] drm_test_buddy_alloc_range_bias
[09:03:23] ==================== [PASSED] drm_buddy ====================
[09:03:23] ============= drm_cmdline_parser (40 subtests) =============
[09:03:23] [PASSED] drm_test_cmdline_force_d_only
[09:03:23] [PASSED] drm_test_cmdline_force_D_only_dvi
[09:03:23] [PASSED] drm_test_cmdline_force_D_only_hdmi
[09:03:23] [PASSED] drm_test_cmdline_force_D_only_not_digital
[09:03:23] [PASSED] drm_test_cmdline_force_e_only
[09:03:23] [PASSED] drm_test_cmdline_res
[09:03:23] [PASSED] drm_test_cmdline_res_vesa
[09:03:23] [PASSED] drm_test_cmdline_res_vesa_rblank
[09:03:23] [PASSED] drm_test_cmdline_res_rblank
[09:03:23] [PASSED] drm_test_cmdline_res_bpp
[09:03:23] [PASSED] drm_test_cmdline_res_refresh
[09:03:23] [PASSED] drm_test_cmdline_res_bpp_refresh
[09:03:23] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[09:03:23] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[09:03:23] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[09:03:23] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[09:03:23] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[09:03:23] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[09:03:23] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[09:03:23] [PASSED] drm_test_cmdline_res_margins_force_on
[09:03:23] [PASSED] drm_test_cmdline_res_vesa_margins
[09:03:23] [PASSED] drm_test_cmdline_name
[09:03:23] [PASSED] drm_test_cmdline_name_bpp
[09:03:23] [PASSED] drm_test_cmdline_name_option
[09:03:23] [PASSED] drm_test_cmdline_name_bpp_option
[09:03:23] [PASSED] drm_test_cmdline_rotate_0
[09:03:23] [PASSED] drm_test_cmdline_rotate_90
[09:03:23] [PASSED] drm_test_cmdline_rotate_180
[09:03:23] [PASSED] drm_test_cmdline_rotate_270
[09:03:23] [PASSED] drm_test_cmdline_hmirror
[09:03:23] [PASSED] drm_test_cmdline_vmirror
[09:03:23] [PASSED] drm_test_cmdline_margin_options
[09:03:23] [PASSED] drm_test_cmdline_multiple_options
[09:03:23] [PASSED] drm_test_cmdline_bpp_extra_and_option
[09:03:23] [PASSED] drm_test_cmdline_extra_and_option
[09:03:23] [PASSED] drm_test_cmdline_freestanding_options
[09:03:23] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[09:03:23] [PASSED] drm_test_cmdline_panel_orientation
[09:03:23] ================ drm_test_cmdline_invalid  =================
[09:03:23] [PASSED] margin_only
[09:03:23] [PASSED] interlace_only
[09:03:23] [PASSED] res_missing_x
[09:03:23] [PASSED] res_missing_y
[09:03:23] [PASSED] res_bad_y
[09:03:23] [PASSED] res_missing_y_bpp
[09:03:23] [PASSED] res_bad_bpp
[09:03:23] [PASSED] res_bad_refresh
[09:03:23] [PASSED] res_bpp_refresh_force_on_off
[09:03:23] [PASSED] res_invalid_mode
[09:03:23] [PASSED] res_bpp_wrong_place_mode
[09:03:23] [PASSED] name_bpp_refresh
[09:03:23] [PASSED] name_refresh
[09:03:23] [PASSED] name_refresh_wrong_mode
[09:03:23] [PASSED] name_refresh_invalid_mode
[09:03:23] [PASSED] rotate_multiple
[09:03:23] [PASSED] rotate_invalid_val
[09:03:23] [PASSED] rotate_truncated
[09:03:23] [PASSED] invalid_option
[09:03:23] [PASSED] invalid_tv_option
[09:03:23] [PASSED] truncated_tv_option
[09:03:23] ============ [PASSED] drm_test_cmdline_invalid =============
[09:03:23] =============== drm_test_cmdline_tv_options  ===============
[09:03:23] [PASSED] NTSC
[09:03:23] [PASSED] NTSC_443
[09:03:23] [PASSED] NTSC_J
[09:03:23] [PASSED] PAL
[09:03:23] [PASSED] PAL_M
[09:03:23] [PASSED] PAL_N
[09:03:23] [PASSED] SECAM
[09:03:23] =========== [PASSED] drm_test_cmdline_tv_options ===========
[09:03:23] =============== [PASSED] drm_cmdline_parser ================
[09:03:23] ========== drmm_connector_hdmi_init (19 subtests) ==========
[09:03:23] [PASSED] drm_test_connector_hdmi_init_valid
[09:03:23] [PASSED] drm_test_connector_hdmi_init_bpc_8
[09:03:23] [PASSED] drm_test_connector_hdmi_init_bpc_10
[09:03:23] [PASSED] drm_test_connector_hdmi_init_bpc_12
[09:03:23] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[09:03:23] [PASSED] drm_test_connector_hdmi_init_bpc_null
[09:03:23] [PASSED] drm_test_connector_hdmi_init_formats_empty
[09:03:23] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[09:03:23] [PASSED] drm_test_connector_hdmi_init_null_ddc
[09:03:23] [PASSED] drm_test_connector_hdmi_init_null_product
[09:03:23] [PASSED] drm_test_connector_hdmi_init_null_vendor
[09:03:23] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[09:03:23] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[09:03:23] [PASSED] drm_test_connector_hdmi_init_product_valid
[09:03:23] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[09:03:23] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[09:03:23] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[09:03:23] ========= drm_test_connector_hdmi_init_type_valid  =========
[09:03:23] [PASSED] HDMI-A
[09:03:23] [PASSED] HDMI-B
[09:03:23] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[09:03:23] ======== drm_test_connector_hdmi_init_type_invalid  ========
[09:03:23] [PASSED] Unknown
[09:03:23] [PASSED] VGA
[09:03:23] [PASSED] DVI-I
[09:03:23] [PASSED] DVI-D
[09:03:23] [PASSED] DVI-A
[09:03:23] [PASSED] Composite
[09:03:23] [PASSED] SVIDEO
[09:03:23] [PASSED] LVDS
[09:03:23] [PASSED] Component
[09:03:23] [PASSED] DIN
[09:03:23] [PASSED] DP
[09:03:23] [PASSED] TV
[09:03:23] [PASSED] eDP
[09:03:23] [PASSED] Virtual
[09:03:23] [PASSED] DSI
[09:03:23] [PASSED] DPI
[09:03:23] [PASSED] Writeback
[09:03:23] [PASSED] SPI
[09:03:23] [PASSED] USB
[09:03:23] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[09:03:23] ============ [PASSED] drmm_connector_hdmi_init =============
[09:03:23] ============= drmm_connector_init (3 subtests) =============
[09:03:23] [PASSED] drm_test_drmm_connector_init
[09:03:23] [PASSED] drm_test_drmm_connector_init_null_ddc
[09:03:23] ========= drm_test_drmm_connector_init_type_valid  =========
[09:03:23] [PASSED] Unknown
[09:03:23] [PASSED] VGA
[09:03:23] [PASSED] DVI-I
[09:03:23] [PASSED] DVI-D
[09:03:23] [PASSED] DVI-A
[09:03:23] [PASSED] Composite
[09:03:23] [PASSED] SVIDEO
[09:03:23] [PASSED] LVDS
[09:03:23] [PASSED] Component
[09:03:23] [PASSED] DIN
[09:03:23] [PASSED] DP
[09:03:23] [PASSED] HDMI-A
[09:03:23] [PASSED] HDMI-B
[09:03:23] [PASSED] TV
[09:03:23] [PASSED] eDP
[09:03:23] [PASSED] Virtual
[09:03:23] [PASSED] DSI
[09:03:23] [PASSED] DPI
[09:03:23] [PASSED] Writeback
[09:03:23] [PASSED] SPI
[09:03:23] [PASSED] USB
[09:03:23] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[09:03:23] =============== [PASSED] drmm_connector_init ===============
[09:03:23] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[09:03:23] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[09:03:23] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[09:03:23] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[09:03:23] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[09:03:23] ========== drm_test_get_tv_mode_from_name_valid  ===========
[09:03:23] [PASSED] NTSC
[09:03:23] [PASSED] NTSC-443
[09:03:23] [PASSED] NTSC-J
[09:03:23] [PASSED] PAL
[09:03:23] [PASSED] PAL-M
[09:03:23] [PASSED] PAL-N
[09:03:23] [PASSED] SECAM
[09:03:23] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[09:03:23] [PASSED] drm_test_get_tv_mode_from_name_truncated
[09:03:23] ============ [PASSED] drm_get_tv_mode_from_name ============
[09:03:23] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[09:03:23] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[09:03:23] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[09:03:23] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[09:03:23] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[09:03:23] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[09:03:23] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[09:03:23] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[09:03:23] [PASSED] VIC 96
[09:03:23] [PASSED] VIC 97
[09:03:23] [PASSED] VIC 101
[09:03:23] [PASSED] VIC 102
[09:03:23] [PASSED] VIC 106
[09:03:23] [PASSED] VIC 107
[09:03:23] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[09:03:23] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[09:03:23] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[09:03:23] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[09:03:23] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[09:03:23] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[09:03:23] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[09:03:23] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[09:03:23] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[09:03:23] [PASSED] Automatic
[09:03:23] [PASSED] Full
[09:03:23] [PASSED] Limited 16:235
[09:03:23] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[09:03:23] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[09:03:23] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[09:03:23] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[09:03:23] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[09:03:23] [PASSED] RGB
[09:03:23] [PASSED] YUV 4:2:0
[09:03:23] [PASSED] YUV 4:2:2
[09:03:23] [PASSED] YUV 4:4:4
[09:03:23] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[09:03:23] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[09:03:23] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[09:03:23] ============= drm_damage_helper (21 subtests) ==============
[09:03:23] [PASSED] drm_test_damage_iter_no_damage
[09:03:23] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[09:03:23] [PASSED] drm_test_damage_iter_no_damage_src_moved
[09:03:23] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[09:03:23] [PASSED] drm_test_damage_iter_no_damage_not_visible
[09:03:23] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[09:03:23] [PASSED] drm_test_damage_iter_no_damage_no_fb
[09:03:23] [PASSED] drm_test_damage_iter_simple_damage
[09:03:23] [PASSED] drm_test_damage_iter_single_damage
[09:03:23] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[09:03:23] [PASSED] drm_test_damage_iter_single_damage_outside_src
[09:03:23] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[09:03:23] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[09:03:23] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[09:03:23] [PASSED] drm_test_damage_iter_single_damage_src_moved
[09:03:23] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[09:03:23] [PASSED] drm_test_damage_iter_damage
[09:03:23] [PASSED] drm_test_damage_iter_damage_one_intersect
[09:03:23] [PASSED] drm_test_damage_iter_damage_one_outside
[09:03:23] [PASSED] drm_test_damage_iter_damage_src_moved
[09:03:23] [PASSED] drm_test_damage_iter_damage_not_visible
[09:03:23] ================ [PASSED] drm_damage_helper ================
[09:03:23] ============== drm_dp_mst_helper (3 subtests) ==============
[09:03:23] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[09:03:23] [PASSED] Clock 154000 BPP 30 DSC disabled
[09:03:23] [PASSED] Clock 234000 BPP 30 DSC disabled
[09:03:23] [PASSED] Clock 297000 BPP 24 DSC disabled
[09:03:23] [PASSED] Clock 332880 BPP 24 DSC enabled
[09:03:23] [PASSED] Clock 324540 BPP 24 DSC enabled
[09:03:23] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[09:03:23] ============== drm_test_dp_mst_calc_pbn_div  ===============
[09:03:23] [PASSED] Link rate 2000000 lane count 4
[09:03:23] [PASSED] Link rate 2000000 lane count 2
[09:03:23] [PASSED] Link rate 2000000 lane count 1
[09:03:23] [PASSED] Link rate 1350000 lane count 4
[09:03:23] [PASSED] Link rate 1350000 lane count 2
[09:03:23] [PASSED] Link rate 1350000 lane count 1
[09:03:23] [PASSED] Link rate 1000000 lane count 4
[09:03:23] [PASSED] Link rate 1000000 lane count 2
[09:03:23] [PASSED] Link rate 1000000 lane count 1
[09:03:23] [PASSED] Link rate 810000 lane count 4
[09:03:23] [PASSED] Link rate 810000 lane count 2
[09:03:23] [PASSED] Link rate 810000 lane count 1
[09:03:23] [PASSED] Link rate 540000 lane count 4
[09:03:23] [PASSED] Link rate 540000 lane count 2
[09:03:23] [PASSED] Link rate 540000 lane count 1
[09:03:23] [PASSED] Link rate 270000 lane count 4
[09:03:23] [PASSED] Link rate 270000 lane count 2
[09:03:23] [PASSED] Link rate 270000 lane count 1
[09:03:23] [PASSED] Link rate 162000 lane count 4
[09:03:23] [PASSED] Link rate 162000 lane count 2
[09:03:23] [PASSED] Link rate 162000 lane count 1
[09:03:23] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[09:03:23] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[09:03:23] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[09:03:23] [PASSED] DP_POWER_UP_PHY with port number
[09:03:23] [PASSED] DP_POWER_DOWN_PHY with port number
[09:03:23] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[09:03:23] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[09:03:23] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[09:03:23] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[09:03:23] [PASSED] DP_QUERY_PAYLOAD with port number
[09:03:23] [PASSED] DP_QUERY_PAYLOAD with VCPI
[09:03:23] [PASSED] DP_REMOTE_DPCD_READ with port number
[09:03:23] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[09:03:23] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[09:03:23] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[09:03:23] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[09:03:23] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[09:03:23] [PASSED] DP_REMOTE_I2C_READ with port number
[09:03:23] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[09:03:23] [PASSED] DP_REMOTE_I2C_READ with transactions array
[09:03:23] [PASSED] DP_REMOTE_I2C_WRITE with port number
[09:03:23] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[09:03:23] [PASSED] DP_REMOTE_I2C_WRITE with data array
[09:03:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[09:03:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[09:03:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[09:03:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[09:03:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[09:03:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[09:03:23] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[09:03:23] ================ [PASSED] drm_dp_mst_helper ================
[09:03:23] ================== drm_exec (7 subtests) ===================
[09:03:23] [PASSED] sanitycheck
[09:03:23] [PASSED] test_lock
[09:03:23] [PASSED] test_lock_unlock
[09:03:23] [PASSED] test_duplicates
[09:03:23] [PASSED] test_prepare
[09:03:23] [PASSED] test_prepare_array
[09:03:23] [PASSED] test_multiple_loops
[09:03:23] ==================== [PASSED] drm_exec =====================
[09:03:23] =========== drm_format_helper_test (17 subtests) ===========
[09:03:23] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[09:03:23] [PASSED] single_pixel_source_buffer
[09:03:23] [PASSED] single_pixel_clip_rectangle
[09:03:23] [PASSED] well_known_colors
[09:03:23] [PASSED] destination_pitch
[09:03:23] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[09:03:23] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[09:03:23] [PASSED] single_pixel_source_buffer
[09:03:23] [PASSED] single_pixel_clip_rectangle
[09:03:23] [PASSED] well_known_colors
[09:03:23] [PASSED] destination_pitch
[09:03:23] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[09:03:23] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[09:03:23] [PASSED] single_pixel_source_buffer
[09:03:23] [PASSED] single_pixel_clip_rectangle
[09:03:23] [PASSED] well_known_colors
[09:03:23] [PASSED] destination_pitch
[09:03:23] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[09:03:23] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[09:03:23] [PASSED] single_pixel_source_buffer
[09:03:23] [PASSED] single_pixel_clip_rectangle
[09:03:23] [PASSED] well_known_colors
[09:03:23] [PASSED] destination_pitch
[09:03:23] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[09:03:23] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[09:03:23] [PASSED] single_pixel_source_buffer
[09:03:23] [PASSED] single_pixel_clip_rectangle
[09:03:23] [PASSED] well_known_colors
[09:03:23] [PASSED] destination_pitch
[09:03:23] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[09:03:23] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[09:03:23] [PASSED] single_pixel_source_buffer
[09:03:23] [PASSED] single_pixel_clip_rectangle
[09:03:23] [PASSED] well_known_colors
[09:03:23] [PASSED] destination_pitch
[09:03:23] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[09:03:23] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[09:03:23] [PASSED] single_pixel_source_buffer
[09:03:23] [PASSED] single_pixel_clip_rectangle
[09:03:23] [PASSED] well_known_colors
[09:03:23] [PASSED] destination_pitch
[09:03:23] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[09:03:23] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[09:03:23] [PASSED] single_pixel_source_buffer
[09:03:23] [PASSED] single_pixel_clip_rectangle
[09:03:23] [PASSED] well_known_colors
[09:03:23] [PASSED] destination_pitch
[09:03:23] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[09:03:23] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[09:03:23] [PASSED] single_pixel_source_buffer
[09:03:23] [PASSED] single_pixel_clip_rectangle
[09:03:23] [PASSED] well_known_colors
[09:03:23] [PASSED] destination_pitch
[09:03:23] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[09:03:23] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[09:03:23] [PASSED] single_pixel_source_buffer
[09:03:23] [PASSED] single_pixel_clip_rectangle
[09:03:23] [PASSED] well_known_colors
[09:03:23] [PASSED] destination_pitch
[09:03:23] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[09:03:23] ============== drm_test_fb_xrgb8888_to_mono  ===============
[09:03:23] [PASSED] single_pixel_source_buffer
[09:03:23] [PASSED] single_pixel_clip_rectangle
[09:03:23] [PASSED] well_known_colors
[09:03:23] [PASSED] destination_pitch
[09:03:23] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[09:03:23] ==================== drm_test_fb_swab  =====================
[09:03:23] [PASSED] single_pixel_source_buffer
[09:03:23] [PASSED] single_pixel_clip_rectangle
[09:03:23] [PASSED] well_known_colors
[09:03:23] [PASSED] destination_pitch
[09:03:23] ================ [PASSED] drm_test_fb_swab =================
[09:03:23] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[09:03:23] [PASSED] single_pixel_source_buffer
[09:03:23] [PASSED] single_pixel_clip_rectangle
[09:03:23] [PASSED] well_known_colors
[09:03:23] [PASSED] destination_pitch
[09:03:23] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[09:03:23] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[09:03:23] [PASSED] single_pixel_source_buffer
[09:03:23] [PASSED] single_pixel_clip_rectangle
[09:03:23] [PASSED] well_known_colors
[09:03:23] [PASSED] destination_pitch
[09:03:23] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[09:03:23] ================= drm_test_fb_clip_offset  =================
[09:03:23] [PASSED] pass through
[09:03:23] [PASSED] horizontal offset
[09:03:23] [PASSED] vertical offset
[09:03:23] [PASSED] horizontal and vertical offset
[09:03:23] [PASSED] horizontal offset (custom pitch)
[09:03:23] [PASSED] vertical offset (custom pitch)
[09:03:23] [PASSED] horizontal and vertical offset (custom pitch)
[09:03:23] ============= [PASSED] drm_test_fb_clip_offset =============
[09:03:23] ============== drm_test_fb_build_fourcc_list  ==============
[09:03:23] [PASSED] no native formats
[09:03:23] [PASSED] XRGB8888 as native format
[09:03:23] [PASSED] remove duplicates
[09:03:23] [PASSED] convert alpha formats
[09:03:23] [PASSED] random formats
[09:03:23] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[09:03:23] =================== drm_test_fb_memcpy  ====================
[09:03:23] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[09:03:23] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[09:03:23] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[09:03:23] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[09:03:23] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[09:03:23] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[09:03:23] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[09:03:23] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[09:03:23] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[09:03:23] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[09:03:23] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[09:03:23] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[09:03:23] =============== [PASSED] drm_test_fb_memcpy ================
[09:03:23] ============= [PASSED] drm_format_helper_test ==============
[09:03:23] ================= drm_format (18 subtests) =================
[09:03:23] [PASSED] drm_test_format_block_width_invalid
[09:03:23] [PASSED] drm_test_format_block_width_one_plane
[09:03:23] [PASSED] drm_test_format_block_width_two_plane
[09:03:23] [PASSED] drm_test_format_block_width_three_plane
[09:03:23] [PASSED] drm_test_format_block_width_tiled
[09:03:23] [PASSED] drm_test_format_block_height_invalid
[09:03:23] [PASSED] drm_test_format_block_height_one_plane
[09:03:23] [PASSED] drm_test_format_block_height_two_plane
[09:03:23] [PASSED] drm_test_format_block_height_three_plane
[09:03:23] [PASSED] drm_test_format_block_height_tiled
[09:03:23] [PASSED] drm_test_format_min_pitch_invalid
[09:03:23] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[09:03:23] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[09:03:23] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[09:03:23] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[09:03:23] [PASSED] drm_test_format_min_pitch_two_plane
[09:03:23] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[09:03:23] [PASSED] drm_test_format_min_pitch_tiled
[09:03:23] =================== [PASSED] drm_format ====================
[09:03:23] =============== drm_framebuffer (1 subtest) ================
[09:03:23] =============== drm_test_framebuffer_create  ===============
[09:03:23] [PASSED] ABGR8888 normal sizes
[09:03:23] [PASSED] ABGR8888 max sizes
[09:03:23] [PASSED] ABGR8888 pitch greater than min required
[09:03:23] [PASSED] ABGR8888 pitch less than min required
[09:03:23] [PASSED] ABGR8888 Invalid width
[09:03:23] [PASSED] ABGR8888 Invalid buffer handle
[09:03:23] [PASSED] No pixel format
[09:03:23] [PASSED] ABGR8888 Width 0
[09:03:23] [PASSED] ABGR8888 Height 0
[09:03:23] [PASSED] ABGR8888 Out of bound height * pitch combination
[09:03:23] [PASSED] ABGR8888 Large buffer offset
[09:03:23] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[09:03:23] [PASSED] ABGR8888 Valid buffer modifier
[09:03:23] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[09:03:23] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[09:03:23] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[09:03:23] [PASSED] NV12 Normal sizes
[09:03:23] [PASSED] NV12 Max sizes
[09:03:23] [PASSED] NV12 Invalid pitch
[09:03:23] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[09:03:23] [PASSED] NV12 different  modifier per-plane
[09:03:23] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[09:03:23] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[09:03:23] [PASSED] NV12 Modifier for inexistent plane
[09:03:23] [PASSED] NV12 Handle for inexistent plane
[09:03:23] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[09:03:23] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[09:03:23] [PASSED] YVU420 Normal sizes
[09:03:23] [PASSED] YVU420 Max sizes
[09:03:23] [PASSED] YVU420 Invalid pitch
[09:03:23] [PASSED] YVU420 Different pitches
[09:03:23] [PASSED] YVU420 Different buffer offsets/pitches
[09:03:23] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[09:03:23] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[09:03:23] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[09:03:23] [PASSED] YVU420 Valid modifier
[09:03:23] [PASSED] YVU420 Different modifiers per plane
[09:03:23] [PASSED] YVU420 Modifier for inexistent plane
[09:03:23] [PASSED] X0L2 Normal sizes
[09:03:23] [PASSED] X0L2 Max sizes
[09:03:23] [PASSED] X0L2 Invalid pitch
[09:03:23] [PASSED] X0L2 Pitch greater than minimum required
[09:03:23] [PASSED] X0L2 Handle for inexistent plane
[09:03:23] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[09:03:23] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[09:03:23] [PASSED] X0L2 Valid modifier
[09:03:23] [PASSED] X0L2 Modifier for inexistent plane
[09:03:23] =========== [PASSED] drm_test_framebuffer_create ===========
[09:03:23] ================= [PASSED] drm_framebuffer =================
[09:03:23] ================ drm_gem_shmem (8 subtests) ================
[09:03:23] [PASSED] drm_gem_shmem_test_obj_create
[09:03:23] [PASSED] drm_gem_shmem_test_obj_create_private
[09:03:23] [PASSED] drm_gem_shmem_test_pin_pages
[09:03:23] [PASSED] drm_gem_shmem_test_vmap
[09:03:23] [PASSED] drm_gem_shmem_test_get_pages_sgt
[09:03:23] [PASSED] drm_gem_shmem_test_get_sg_table
[09:03:23] [PASSED] drm_gem_shmem_test_madvise
[09:03:23] [PASSED] drm_gem_shmem_test_purge
[09:03:23] ================== [PASSED] drm_gem_shmem ==================
[09:03:23] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[09:03:23] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[09:03:23] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[09:03:23] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[09:03:23] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[09:03:23] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[09:03:23] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[09:03:23] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[09:03:23] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[09:03:23] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[09:03:23] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[09:03:23] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[09:03:23] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[09:03:23] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[09:03:23] [PASSED] drm_test_check_output_bpc_dvi
[09:03:23] [PASSED] drm_test_check_output_bpc_format_vic_1
[09:03:23] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[09:03:23] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[09:03:23] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[09:03:23] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[09:03:23] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[09:03:23] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[09:03:23] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[09:03:23] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[09:03:23] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[09:03:23] [PASSED] drm_test_check_broadcast_rgb_value
[09:03:23] [PASSED] drm_test_check_bpc_8_value
[09:03:23] [PASSED] drm_test_check_bpc_10_value
[09:03:23] [PASSED] drm_test_check_bpc_12_value
[09:03:23] [PASSED] drm_test_check_format_value
[09:03:23] [PASSED] drm_test_check_tmds_char_value
[09:03:23] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[09:03:23] ================= drm_managed (2 subtests) =================
[09:03:23] [PASSED] drm_test_managed_release_action
[09:03:23] [PASSED] drm_test_managed_run_action
[09:03:23] =================== [PASSED] drm_managed ===================
[09:03:23] =================== drm_mm (6 subtests) ====================
[09:03:23] [PASSED] drm_test_mm_init
[09:03:23] [PASSED] drm_test_mm_debug
[09:03:23] [PASSED] drm_test_mm_align32
[09:03:23] [PASSED] drm_test_mm_align64
[09:03:23] [PASSED] drm_test_mm_lowest
[09:03:23] [PASSED] drm_test_mm_highest
[09:03:23] ===================== [PASSED] drm_mm ======================
[09:03:23] ============= drm_modes_analog_tv (4 subtests) =============
[09:03:23] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[09:03:23] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[09:03:23] [PASSED] drm_test_modes_analog_tv_pal_576i
[09:03:23] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[09:03:23] =============== [PASSED] drm_modes_analog_tv ===============
[09:03:23] ============== drm_plane_helper (2 subtests) ===============
[09:03:23] =============== drm_test_check_plane_state  ================
[09:03:23] [PASSED] clipping_simple
[09:03:23] [PASSED] clipping_rotate_reflect
[09:03:23] [PASSED] positioning_simple
[09:03:23] [PASSED] upscaling
[09:03:23] [PASSED] downscaling
[09:03:23] [PASSED] rounding1
[09:03:23] [PASSED] rounding2
[09:03:23] [PASSED] rounding3
[09:03:23] [PASSED] rounding4
[09:03:23] =========== [PASSED] drm_test_check_plane_state ============
[09:03:23] =========== drm_test_check_invalid_plane_state  ============
[09:03:23] [PASSED] positioning_invalid
[09:03:23] [PASSED] upscaling_invalid
[09:03:23] [PASSED] downscaling_invalid
[09:03:23] ======= [PASSED] drm_test_check_invalid_plane_state ========
[09:03:23] ================ [PASSED] drm_plane_helper =================
stty: 'standard input': Inappropriate ioctl for device
[09:03:23] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[09:03:23] ====== drm_test_connector_helper_tv_get_modes_check  =======
[09:03:23] [PASSED] None
[09:03:23] [PASSED] PAL
[09:03:23] [PASSED] NTSC
[09:03:23] [PASSED] Both, NTSC Default
[09:03:23] [PASSED] Both, PAL Default
[09:03:23] [PASSED] Both, NTSC Default, with PAL on command-line
[09:03:23] [PASSED] Both, PAL Default, with NTSC on command-line
[09:03:23] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[09:03:23] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[09:03:23] ================== drm_rect (9 subtests) ===================
[09:03:23] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[09:03:23] [PASSED] drm_test_rect_clip_scaled_not_clipped
[09:03:23] [PASSED] drm_test_rect_clip_scaled_clipped
[09:03:23] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[09:03:23] ================= drm_test_rect_intersect  =================
[09:03:23] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[09:03:23] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[09:03:23] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[09:03:23] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[09:03:23] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[09:03:23] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[09:03:23] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[09:03:23] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[09:03:23] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[09:03:23] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[09:03:23] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[09:03:23] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[09:03:23] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[09:03:23] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[09:03:23] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[09:03:23] ============= [PASSED] drm_test_rect_intersect =============
[09:03:23] ================ drm_test_rect_calc_hscale  ================
[09:03:23] [PASSED] normal use
[09:03:23] [PASSED] out of max range
[09:03:23] [PASSED] out of min range
[09:03:23] [PASSED] zero dst
[09:03:23] [PASSED] negative src
[09:03:23] [PASSED] negative dst
[09:03:23] ============ [PASSED] drm_test_rect_calc_hscale ============
[09:03:23] ================ drm_test_rect_calc_vscale  ================
[09:03:23] [PASSED] normal use
[09:03:23] [PASSED] out of max range
[09:03:23] [PASSED] out of min range
[09:03:23] [PASSED] zero dst
[09:03:23] [PASSED] negative src
[09:03:23] [PASSED] negative dst
[09:03:23] ============ [PASSED] drm_test_rect_calc_vscale ============
[09:03:23] ================== drm_test_rect_rotate  ===================
[09:03:23] [PASSED] reflect-x
[09:03:23] [PASSED] reflect-y
[09:03:23] [PASSED] rotate-0
[09:03:23] [PASSED] rotate-90
[09:03:23] [PASSED] rotate-180
[09:03:23] [PASSED] rotate-270
[09:03:23] ============== [PASSED] drm_test_rect_rotate ===============
[09:03:23] ================ drm_test_rect_rotate_inv  =================
[09:03:23] [PASSED] reflect-x
[09:03:23] [PASSED] reflect-y
[09:03:23] [PASSED] rotate-0
[09:03:23] [PASSED] rotate-90
[09:03:23] [PASSED] rotate-180
[09:03:23] [PASSED] rotate-270
[09:03:23] ============ [PASSED] drm_test_rect_rotate_inv =============
[09:03:23] ==================== [PASSED] drm_rect =====================
[09:03:23] ============================================================
[09:03:23] Testing complete. Ran 511 tests: passed: 511
[09:03:23] Elapsed time: 23.098s total, 1.708s configuring, 21.206s building, 0.149s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


