Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB13C27C52
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 08:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC42110E707;
	Wed,  5 Jun 2024 08:18:15 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108B910E70D;
 Wed,  5 Jun 2024 08:18:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_flush_engine_buffers?=
 =?utf-8?q?_before_signalling_user_fence_on_all_engines_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Jun 2024 08:18:13 -0000
Message-ID: <171757549306.105.17626953682862649748@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240605-fix_user_fence_posted-v3-0-06e7932f784a@intel.com>
In-Reply-To: <20240605-fix_user_fence_posted-v3-0-06e7932f784a@intel.com>
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

Series: drm/xe: flush engine buffers before signalling user fence on all engines (rev2)
URL   : https://patchwork.freedesktop.org/series/134432/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[08:17:16] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:17:21] Building KUnit Kernel ...
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

[08:17:46] Starting KUnit Kernel (1/1)...
[08:17:46] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[08:17:46] =================== guc_dbm (7 subtests) ===================
[08:17:46] [PASSED] test_empty
[08:17:46] [PASSED] test_default
[08:17:46] ======================== test_size  ========================
[08:17:46] [PASSED] 4
[08:17:46] [PASSED] 8
[08:17:46] [PASSED] 32
[08:17:46] [PASSED] 256
[08:17:46] ==================== [PASSED] test_size ====================
[08:17:46] ======================= test_reuse  ========================
[08:17:46] [PASSED] 4
[08:17:46] [PASSED] 8
[08:17:46] [PASSED] 32
[08:17:46] [PASSED] 256
[08:17:46] =================== [PASSED] test_reuse ====================
[08:17:46] =================== test_range_overlap  ====================
[08:17:46] [PASSED] 4
[08:17:46] [PASSED] 8
[08:17:46] [PASSED] 32
[08:17:46] [PASSED] 256
[08:17:46] =============== [PASSED] test_range_overlap ================
[08:17:46] =================== test_range_compact  ====================
[08:17:46] [PASSED] 4
[08:17:46] [PASSED] 8
[08:17:46] [PASSED] 32
[08:17:46] [PASSED] 256
[08:17:46] =============== [PASSED] test_range_compact ================
[08:17:46] ==================== test_range_spare  =====================
[08:17:46] [PASSED] 4
[08:17:46] [PASSED] 8
[08:17:46] [PASSED] 32
[08:17:46] [PASSED] 256
[08:17:46] ================ [PASSED] test_range_spare =================
[08:17:46] ===================== [PASSED] guc_dbm =====================
[08:17:46] =================== guc_idm (6 subtests) ===================
[08:17:46] [PASSED] bad_init
[08:17:46] [PASSED] no_init
[08:17:46] [PASSED] init_fini
[08:17:46] [PASSED] check_used
[08:17:46] [PASSED] check_quota
[08:17:46] [PASSED] check_all
[08:17:46] ===================== [PASSED] guc_idm =====================
[08:17:46] ================== no_relay (3 subtests) ===================
[08:17:46] [PASSED] xe_drops_guc2pf_if_not_ready
[08:17:46] [PASSED] xe_drops_guc2vf_if_not_ready
[08:17:46] [PASSED] xe_rejects_send_if_not_ready
[08:17:46] ==================== [PASSED] no_relay =====================
[08:17:46] ================== pf_relay (14 subtests) ==================
[08:17:46] [PASSED] pf_rejects_guc2pf_too_short
[08:17:46] [PASSED] pf_rejects_guc2pf_too_long
[08:17:46] [PASSED] pf_rejects_guc2pf_no_payload
[08:17:46] [PASSED] pf_fails_no_payload
[08:17:46] [PASSED] pf_fails_bad_origin
[08:17:46] [PASSED] pf_fails_bad_type
[08:17:46] [PASSED] pf_txn_reports_error
[08:17:46] [PASSED] pf_txn_sends_pf2guc
[08:17:46] [PASSED] pf_sends_pf2guc
[08:17:46] [SKIPPED] pf_loopback_nop
[08:17:46] [SKIPPED] pf_loopback_echo
[08:17:46] [SKIPPED] pf_loopback_fail
[08:17:46] [SKIPPED] pf_loopback_busy
[08:17:46] [SKIPPED] pf_loopback_retry
[08:17:46] ==================== [PASSED] pf_relay =====================
[08:17:46] ================== vf_relay (3 subtests) ===================
[08:17:46] [PASSED] vf_rejects_guc2vf_too_short
[08:17:46] [PASSED] vf_rejects_guc2vf_too_long
[08:17:46] [PASSED] vf_rejects_guc2vf_no_payload
[08:17:46] ==================== [PASSED] vf_relay =====================
[08:17:46] ================= pf_service (11 subtests) =================
[08:17:46] [PASSED] pf_negotiate_any
[08:17:46] [PASSED] pf_negotiate_base_match
[08:17:46] [PASSED] pf_negotiate_base_newer
[08:17:46] [PASSED] pf_negotiate_base_next
[08:17:46] [SKIPPED] pf_negotiate_base_older
[08:17:46] [PASSED] pf_negotiate_base_prev
[08:17:46] [PASSED] pf_negotiate_latest_match
[08:17:46] [PASSED] pf_negotiate_latest_newer
[08:17:46] [PASSED] pf_negotiate_latest_next
[08:17:46] [SKIPPED] pf_negotiate_latest_older
[08:17:46] [SKIPPED] pf_negotiate_latest_prev
[08:17:46] =================== [PASSED] pf_service ====================
[08:17:46] ===================== lmtt (1 subtest) =====================
[08:17:46] ======================== test_ops  =========================
[08:17:46] [PASSED] 2-level
[08:17:46] [PASSED] multi-level
[08:17:46] ==================== [PASSED] test_ops =====================
[08:17:46] ====================== [PASSED] lmtt =======================
[08:17:46] ==================== xe_bo (2 subtests) ====================
[08:17:46] [SKIPPED] xe_ccs_migrate_kunit
[08:17:46] [SKIPPED] xe_bo_evict_kunit
[08:17:46] ===================== [SKIPPED] xe_bo ======================
[08:17:46] ================== xe_dma_buf (1 subtest) ==================
[08:17:46] [SKIPPED] xe_dma_buf_kunit
[08:17:46] =================== [SKIPPED] xe_dma_buf ===================
[08:17:46] ================== xe_migrate (1 subtest) ==================
[08:17:46] [SKIPPED] xe_migrate_sanity_kunit
[08:17:46] =================== [SKIPPED] xe_migrate ===================
[08:17:46] =================== xe_mocs (2 subtests) ===================
[08:17:46] [SKIPPED] xe_live_mocs_kernel_kunit
[08:17:46] [SKIPPED] xe_live_mocs_reset_kunit
[08:17:46] ==================== [SKIPPED] xe_mocs =====================
[08:17:46] ==================== args (11 subtests) ====================
[08:17:46] [PASSED] count_args_test
[08:17:46] [PASSED] call_args_example
[08:17:46] [PASSED] call_args_test
[08:17:46] [PASSED] drop_first_arg_example
[08:17:46] [PASSED] drop_first_arg_test
[08:17:46] [PASSED] first_arg_example
[08:17:46] [PASSED] first_arg_test
[08:17:46] [PASSED] last_arg_example
[08:17:46] [PASSED] last_arg_test
[08:17:46] [PASSED] pick_arg_example
[08:17:46] [PASSED] sep_comma_example
[08:17:46] ====================== [PASSED] args =======================
[08:17:46] =================== xe_pci (2 subtests) ====================
[08:17:46] [PASSED] xe_gmdid_graphics_ip
[08:17:46] [PASSED] xe_gmdid_media_ip
[08:17:46] ===================== [PASSED] xe_pci ======================
[08:17:46] ==================== xe_rtp (1 subtest) ====================
[08:17:46] ================== xe_rtp_process_tests  ===================
[08:17:46] [PASSED] coalesce-same-reg
[08:17:46] [PASSED] no-match-no-add
[08:17:46] [PASSED] no-match-no-add-multiple-rules
[08:17:46] [PASSED] two-regs-two-entries
[08:17:46] [PASSED] clr-one-set-other
[08:17:46] [PASSED] set-field
[08:17:46] [PASSED] conflict-duplicate
[08:17:46] [PASSED] conflict-not-disjoint
[08:17:46] [PASSED] conflict-reg-type
[08:17:46] ============== [PASSED] xe_rtp_process_tests ===============
stty: 'standard input': Inappropriate ioctl for device
[08:17:46] ===================== [PASSED] xe_rtp ======================
[08:17:46] ==================== xe_wa (1 subtest) =====================
[08:17:46] ======================== xe_wa_gt  =========================
[08:17:46] [PASSED] TIGERLAKE (B0)
[08:17:46] [PASSED] DG1 (A0)
[08:17:46] [PASSED] DG1 (B0)
[08:17:46] [PASSED] ALDERLAKE_S (A0)
[08:17:46] [PASSED] ALDERLAKE_S (B0)
[08:17:46] [PASSED] ALDERLAKE_S (C0)
[08:17:46] [PASSED] ALDERLAKE_S (D0)
[08:17:46] [PASSED] ALDERLAKE_P (A0)
[08:17:46] [PASSED] ALDERLAKE_P (B0)
[08:17:46] [PASSED] ALDERLAKE_P (C0)
[08:17:46] [PASSED] ALDERLAKE_S_RPLS (D0)
[08:17:46] [PASSED] ALDERLAKE_P_RPLU (E0)
[08:17:46] [PASSED] DG2_G10 (C0)
[08:17:46] [PASSED] DG2_G11 (B1)
[08:17:46] [PASSED] DG2_G12 (A1)
[08:17:46] [PASSED] METEORLAKE (g:A0, m:A0)
[08:17:46] [PASSED] METEORLAKE (g:A0, m:A0)
[08:17:46] [PASSED] METEORLAKE (g:A0, m:A0)
[08:17:46] [PASSED] LUNARLAKE (g:A0, m:A0)
[08:17:46] [PASSED] LUNARLAKE (g:B0, m:A0)
[08:17:46] ==================== [PASSED] xe_wa_gt =====================
[08:17:46] ====================== [PASSED] xe_wa ======================
[08:17:46] ============================================================
[08:17:46] Testing complete. Ran 109 tests: passed: 95, skipped: 14
[08:17:47] Elapsed time: 30.211s total, 4.286s configuring, 25.656s building, 0.228s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[08:17:47] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:17:48] Building KUnit Kernel ...
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

[08:18:10] Starting KUnit Kernel (1/1)...
[08:18:10] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[08:18:10] ============ drm_test_pick_cmdline (2 subtests) ============
[08:18:10] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[08:18:10] =============== drm_test_pick_cmdline_named  ===============
[08:18:10] [PASSED] NTSC
[08:18:10] [PASSED] NTSC-J
[08:18:10] [PASSED] PAL
[08:18:10] [PASSED] PAL-M
[08:18:10] =========== [PASSED] drm_test_pick_cmdline_named ===========
[08:18:10] ============== [PASSED] drm_test_pick_cmdline ==============
[08:18:10] ================== drm_buddy (7 subtests) ==================
[08:18:10] [PASSED] drm_test_buddy_alloc_limit
[08:18:10] [PASSED] drm_test_buddy_alloc_optimistic
[08:18:10] [PASSED] drm_test_buddy_alloc_pessimistic
[08:18:10] [PASSED] drm_test_buddy_alloc_pathological
[08:18:10] [PASSED] drm_test_buddy_alloc_contiguous
[08:18:10] [PASSED] drm_test_buddy_alloc_clear
[08:18:10] [PASSED] drm_test_buddy_alloc_range_bias
[08:18:10] ==================== [PASSED] drm_buddy ====================
[08:18:10] ============= drm_cmdline_parser (40 subtests) =============
[08:18:10] [PASSED] drm_test_cmdline_force_d_only
[08:18:10] [PASSED] drm_test_cmdline_force_D_only_dvi
[08:18:10] [PASSED] drm_test_cmdline_force_D_only_hdmi
[08:18:10] [PASSED] drm_test_cmdline_force_D_only_not_digital
[08:18:10] [PASSED] drm_test_cmdline_force_e_only
[08:18:10] [PASSED] drm_test_cmdline_res
[08:18:10] [PASSED] drm_test_cmdline_res_vesa
[08:18:10] [PASSED] drm_test_cmdline_res_vesa_rblank
[08:18:10] [PASSED] drm_test_cmdline_res_rblank
[08:18:10] [PASSED] drm_test_cmdline_res_bpp
[08:18:10] [PASSED] drm_test_cmdline_res_refresh
[08:18:10] [PASSED] drm_test_cmdline_res_bpp_refresh
[08:18:10] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[08:18:10] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[08:18:10] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[08:18:10] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[08:18:10] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[08:18:10] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[08:18:10] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[08:18:10] [PASSED] drm_test_cmdline_res_margins_force_on
[08:18:10] [PASSED] drm_test_cmdline_res_vesa_margins
[08:18:10] [PASSED] drm_test_cmdline_name
[08:18:10] [PASSED] drm_test_cmdline_name_bpp
[08:18:10] [PASSED] drm_test_cmdline_name_option
[08:18:10] [PASSED] drm_test_cmdline_name_bpp_option
[08:18:10] [PASSED] drm_test_cmdline_rotate_0
[08:18:10] [PASSED] drm_test_cmdline_rotate_90
[08:18:10] [PASSED] drm_test_cmdline_rotate_180
[08:18:10] [PASSED] drm_test_cmdline_rotate_270
[08:18:10] [PASSED] drm_test_cmdline_hmirror
[08:18:10] [PASSED] drm_test_cmdline_vmirror
[08:18:10] [PASSED] drm_test_cmdline_margin_options
[08:18:10] [PASSED] drm_test_cmdline_multiple_options
[08:18:10] [PASSED] drm_test_cmdline_bpp_extra_and_option
[08:18:10] [PASSED] drm_test_cmdline_extra_and_option
[08:18:10] [PASSED] drm_test_cmdline_freestanding_options
[08:18:10] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[08:18:10] [PASSED] drm_test_cmdline_panel_orientation
[08:18:10] ================ drm_test_cmdline_invalid  =================
[08:18:10] [PASSED] margin_only
[08:18:10] [PASSED] interlace_only
[08:18:10] [PASSED] res_missing_x
[08:18:10] [PASSED] res_missing_y
[08:18:10] [PASSED] res_bad_y
[08:18:10] [PASSED] res_missing_y_bpp
[08:18:10] [PASSED] res_bad_bpp
[08:18:10] [PASSED] res_bad_refresh
[08:18:10] [PASSED] res_bpp_refresh_force_on_off
[08:18:10] [PASSED] res_invalid_mode
[08:18:10] [PASSED] res_bpp_wrong_place_mode
[08:18:10] [PASSED] name_bpp_refresh
[08:18:10] [PASSED] name_refresh
[08:18:10] [PASSED] name_refresh_wrong_mode
[08:18:10] [PASSED] name_refresh_invalid_mode
[08:18:10] [PASSED] rotate_multiple
[08:18:10] [PASSED] rotate_invalid_val
[08:18:10] [PASSED] rotate_truncated
[08:18:10] [PASSED] invalid_option
[08:18:10] [PASSED] invalid_tv_option
[08:18:10] [PASSED] truncated_tv_option
[08:18:10] ============ [PASSED] drm_test_cmdline_invalid =============
[08:18:10] =============== drm_test_cmdline_tv_options  ===============
[08:18:10] [PASSED] NTSC
[08:18:10] [PASSED] NTSC_443
[08:18:10] [PASSED] NTSC_J
[08:18:10] [PASSED] PAL
[08:18:10] [PASSED] PAL_M
[08:18:10] [PASSED] PAL_N
[08:18:10] [PASSED] SECAM
[08:18:10] =========== [PASSED] drm_test_cmdline_tv_options ===========
[08:18:10] =============== [PASSED] drm_cmdline_parser ================
[08:18:10] ========== drmm_connector_hdmi_init (19 subtests) ==========
[08:18:10] [PASSED] drm_test_connector_hdmi_init_valid
[08:18:10] [PASSED] drm_test_connector_hdmi_init_bpc_8
[08:18:10] [PASSED] drm_test_connector_hdmi_init_bpc_10
[08:18:10] [PASSED] drm_test_connector_hdmi_init_bpc_12
[08:18:10] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[08:18:10] [PASSED] drm_test_connector_hdmi_init_bpc_null
[08:18:10] [PASSED] drm_test_connector_hdmi_init_formats_empty
[08:18:10] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[08:18:10] [PASSED] drm_test_connector_hdmi_init_null_ddc
[08:18:10] [PASSED] drm_test_connector_hdmi_init_null_product
[08:18:10] [PASSED] drm_test_connector_hdmi_init_null_vendor
[08:18:10] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[08:18:10] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[08:18:10] [PASSED] drm_test_connector_hdmi_init_product_valid
[08:18:10] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[08:18:10] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[08:18:10] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[08:18:10] ========= drm_test_connector_hdmi_init_type_valid  =========
[08:18:10] [PASSED] HDMI-A
[08:18:10] [PASSED] HDMI-B
[08:18:10] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[08:18:10] ======== drm_test_connector_hdmi_init_type_invalid  ========
[08:18:10] [PASSED] Unknown
[08:18:10] [PASSED] VGA
[08:18:10] [PASSED] DVI-I
[08:18:10] [PASSED] DVI-D
[08:18:10] [PASSED] DVI-A
[08:18:10] [PASSED] Composite
[08:18:10] [PASSED] SVIDEO
[08:18:10] [PASSED] LVDS
[08:18:10] [PASSED] Component
[08:18:10] [PASSED] DIN
[08:18:10] [PASSED] DP
[08:18:10] [PASSED] TV
[08:18:10] [PASSED] eDP
[08:18:10] [PASSED] Virtual
[08:18:10] [PASSED] DSI
[08:18:10] [PASSED] DPI
[08:18:10] [PASSED] Writeback
[08:18:10] [PASSED] SPI
[08:18:10] [PASSED] USB
[08:18:10] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[08:18:10] ============ [PASSED] drmm_connector_hdmi_init =============
[08:18:10] ============= drmm_connector_init (3 subtests) =============
[08:18:10] [PASSED] drm_test_drmm_connector_init
[08:18:10] [PASSED] drm_test_drmm_connector_init_null_ddc
[08:18:10] ========= drm_test_drmm_connector_init_type_valid  =========
[08:18:10] [PASSED] Unknown
[08:18:10] [PASSED] VGA
[08:18:10] [PASSED] DVI-I
[08:18:10] [PASSED] DVI-D
[08:18:10] [PASSED] DVI-A
[08:18:10] [PASSED] Composite
[08:18:10] [PASSED] SVIDEO
[08:18:10] [PASSED] LVDS
[08:18:10] [PASSED] Component
[08:18:10] [PASSED] DIN
[08:18:10] [PASSED] DP
[08:18:10] [PASSED] HDMI-A
[08:18:10] [PASSED] HDMI-B
[08:18:10] [PASSED] TV
[08:18:10] [PASSED] eDP
[08:18:10] [PASSED] Virtual
[08:18:10] [PASSED] DSI
[08:18:10] [PASSED] DPI
[08:18:10] [PASSED] Writeback
[08:18:10] [PASSED] SPI
[08:18:10] [PASSED] USB
[08:18:10] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[08:18:10] =============== [PASSED] drmm_connector_init ===============
[08:18:10] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[08:18:10] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[08:18:10] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[08:18:10] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[08:18:10] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[08:18:10] ========== drm_test_get_tv_mode_from_name_valid  ===========
[08:18:10] [PASSED] NTSC
[08:18:10] [PASSED] NTSC-443
[08:18:10] [PASSED] NTSC-J
[08:18:10] [PASSED] PAL
[08:18:10] [PASSED] PAL-M
[08:18:10] [PASSED] PAL-N
[08:18:10] [PASSED] SECAM
[08:18:10] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[08:18:10] [PASSED] drm_test_get_tv_mode_from_name_truncated
[08:18:10] ============ [PASSED] drm_get_tv_mode_from_name ============
[08:18:10] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[08:18:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[08:18:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[08:18:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[08:18:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[08:18:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[08:18:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[08:18:10] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[08:18:10] [PASSED] VIC 96
[08:18:10] [PASSED] VIC 97
[08:18:10] [PASSED] VIC 101
[08:18:10] [PASSED] VIC 102
[08:18:10] [PASSED] VIC 106
[08:18:10] [PASSED] VIC 107
[08:18:10] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[08:18:10] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[08:18:10] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[08:18:10] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[08:18:10] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[08:18:10] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[08:18:10] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[08:18:10] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[08:18:10] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[08:18:10] [PASSED] Automatic
[08:18:10] [PASSED] Full
[08:18:10] [PASSED] Limited 16:235
[08:18:10] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[08:18:10] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[08:18:10] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[08:18:10] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[08:18:10] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[08:18:10] [PASSED] RGB
[08:18:10] [PASSED] YUV 4:2:0
[08:18:10] [PASSED] YUV 4:2:2
[08:18:10] [PASSED] YUV 4:4:4
[08:18:10] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[08:18:10] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[08:18:10] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[08:18:10] ============= drm_damage_helper (21 subtests) ==============
[08:18:10] [PASSED] drm_test_damage_iter_no_damage
[08:18:10] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[08:18:10] [PASSED] drm_test_damage_iter_no_damage_src_moved
[08:18:10] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[08:18:10] [PASSED] drm_test_damage_iter_no_damage_not_visible
[08:18:10] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[08:18:10] [PASSED] drm_test_damage_iter_no_damage_no_fb
[08:18:10] [PASSED] drm_test_damage_iter_simple_damage
[08:18:10] [PASSED] drm_test_damage_iter_single_damage
[08:18:10] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[08:18:10] [PASSED] drm_test_damage_iter_single_damage_outside_src
[08:18:10] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[08:18:10] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[08:18:10] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[08:18:10] [PASSED] drm_test_damage_iter_single_damage_src_moved
[08:18:10] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[08:18:10] [PASSED] drm_test_damage_iter_damage
[08:18:10] [PASSED] drm_test_damage_iter_damage_one_intersect
[08:18:10] [PASSED] drm_test_damage_iter_damage_one_outside
[08:18:10] [PASSED] drm_test_damage_iter_damage_src_moved
[08:18:10] [PASSED] drm_test_damage_iter_damage_not_visible
[08:18:10] ================ [PASSED] drm_damage_helper ================
[08:18:10] ============== drm_dp_mst_helper (3 subtests) ==============
[08:18:10] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[08:18:10] [PASSED] Clock 154000 BPP 30 DSC disabled
[08:18:10] [PASSED] Clock 234000 BPP 30 DSC disabled
[08:18:10] [PASSED] Clock 297000 BPP 24 DSC disabled
[08:18:10] [PASSED] Clock 332880 BPP 24 DSC enabled
[08:18:10] [PASSED] Clock 324540 BPP 24 DSC enabled
[08:18:10] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[08:18:10] ============== drm_test_dp_mst_calc_pbn_div  ===============
[08:18:10] [PASSED] Link rate 2000000 lane count 4
[08:18:10] [PASSED] Link rate 2000000 lane count 2
[08:18:10] [PASSED] Link rate 2000000 lane count 1
[08:18:10] [PASSED] Link rate 1350000 lane count 4
[08:18:10] [PASSED] Link rate 1350000 lane count 2
[08:18:10] [PASSED] Link rate 1350000 lane count 1
[08:18:10] [PASSED] Link rate 1000000 lane count 4
[08:18:10] [PASSED] Link rate 1000000 lane count 2
[08:18:10] [PASSED] Link rate 1000000 lane count 1
[08:18:10] [PASSED] Link rate 810000 lane count 4
[08:18:10] [PASSED] Link rate 810000 lane count 2
[08:18:10] [PASSED] Link rate 810000 lane count 1
[08:18:10] [PASSED] Link rate 540000 lane count 4
[08:18:10] [PASSED] Link rate 540000 lane count 2
[08:18:10] [PASSED] Link rate 540000 lane count 1
[08:18:10] [PASSED] Link rate 270000 lane count 4
[08:18:10] [PASSED] Link rate 270000 lane count 2
[08:18:10] [PASSED] Link rate 270000 lane count 1
[08:18:10] [PASSED] Link rate 162000 lane count 4
[08:18:10] [PASSED] Link rate 162000 lane count 2
[08:18:10] [PASSED] Link rate 162000 lane count 1
[08:18:10] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[08:18:10] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[08:18:10] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[08:18:10] [PASSED] DP_POWER_UP_PHY with port number
[08:18:10] [PASSED] DP_POWER_DOWN_PHY with port number
[08:18:10] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[08:18:10] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[08:18:10] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[08:18:10] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[08:18:10] [PASSED] DP_QUERY_PAYLOAD with port number
[08:18:10] [PASSED] DP_QUERY_PAYLOAD with VCPI
[08:18:10] [PASSED] DP_REMOTE_DPCD_READ with port number
[08:18:10] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[08:18:10] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[08:18:10] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[08:18:10] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[08:18:10] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[08:18:10] [PASSED] DP_REMOTE_I2C_READ with port number
[08:18:10] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[08:18:10] [PASSED] DP_REMOTE_I2C_READ with transactions array
[08:18:10] [PASSED] DP_REMOTE_I2C_WRITE with port number
[08:18:10] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[08:18:10] [PASSED] DP_REMOTE_I2C_WRITE with data array
[08:18:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[08:18:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[08:18:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[08:18:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[08:18:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[08:18:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[08:18:10] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[08:18:10] ================ [PASSED] drm_dp_mst_helper ================
[08:18:10] ================== drm_exec (7 subtests) ===================
[08:18:10] [PASSED] sanitycheck
[08:18:10] [PASSED] test_lock
[08:18:10] [PASSED] test_lock_unlock
[08:18:10] [PASSED] test_duplicates
[08:18:10] [PASSED] test_prepare
[08:18:10] [PASSED] test_prepare_array
[08:18:10] [PASSED] test_multiple_loops
[08:18:10] ==================== [PASSED] drm_exec =====================
[08:18:10] =========== drm_format_helper_test (17 subtests) ===========
[08:18:10] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[08:18:10] [PASSED] single_pixel_source_buffer
[08:18:10] [PASSED] single_pixel_clip_rectangle
[08:18:10] [PASSED] well_known_colors
[08:18:10] [PASSED] destination_pitch
[08:18:10] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[08:18:10] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[08:18:10] [PASSED] single_pixel_source_buffer
[08:18:10] [PASSED] single_pixel_clip_rectangle
[08:18:10] [PASSED] well_known_colors
[08:18:10] [PASSED] destination_pitch
[08:18:10] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[08:18:10] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[08:18:10] [PASSED] single_pixel_source_buffer
[08:18:10] [PASSED] single_pixel_clip_rectangle
[08:18:10] [PASSED] well_known_colors
[08:18:10] [PASSED] destination_pitch
[08:18:10] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[08:18:10] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[08:18:10] [PASSED] single_pixel_source_buffer
[08:18:10] [PASSED] single_pixel_clip_rectangle
[08:18:10] [PASSED] well_known_colors
[08:18:10] [PASSED] destination_pitch
[08:18:10] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[08:18:10] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[08:18:10] [PASSED] single_pixel_source_buffer
[08:18:10] [PASSED] single_pixel_clip_rectangle
[08:18:10] [PASSED] well_known_colors
[08:18:10] [PASSED] destination_pitch
[08:18:10] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[08:18:10] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[08:18:10] [PASSED] single_pixel_source_buffer
[08:18:10] [PASSED] single_pixel_clip_rectangle
[08:18:10] [PASSED] well_known_colors
[08:18:10] [PASSED] destination_pitch
[08:18:10] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[08:18:10] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[08:18:10] [PASSED] single_pixel_source_buffer
[08:18:10] [PASSED] single_pixel_clip_rectangle
[08:18:10] [PASSED] well_known_colors
[08:18:10] [PASSED] destination_pitch
[08:18:10] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[08:18:10] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[08:18:10] [PASSED] single_pixel_source_buffer
[08:18:10] [PASSED] single_pixel_clip_rectangle
[08:18:10] [PASSED] well_known_colors
[08:18:10] [PASSED] destination_pitch
[08:18:10] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[08:18:10] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[08:18:10] [PASSED] single_pixel_source_buffer
[08:18:10] [PASSED] single_pixel_clip_rectangle
[08:18:10] [PASSED] well_known_colors
[08:18:10] [PASSED] destination_pitch
[08:18:10] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[08:18:10] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[08:18:10] [PASSED] single_pixel_source_buffer
[08:18:10] [PASSED] single_pixel_clip_rectangle
[08:18:10] [PASSED] well_known_colors
[08:18:10] [PASSED] destination_pitch
[08:18:10] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[08:18:10] ============== drm_test_fb_xrgb8888_to_mono  ===============
[08:18:10] [PASSED] single_pixel_source_buffer
[08:18:10] [PASSED] single_pixel_clip_rectangle
[08:18:10] [PASSED] well_known_colors
[08:18:10] [PASSED] destination_pitch
[08:18:10] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[08:18:10] ==================== drm_test_fb_swab  =====================
[08:18:10] [PASSED] single_pixel_source_buffer
[08:18:10] [PASSED] single_pixel_clip_rectangle
[08:18:10] [PASSED] well_known_colors
[08:18:10] [PASSED] destination_pitch
[08:18:10] ================ [PASSED] drm_test_fb_swab =================
[08:18:10] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[08:18:10] [PASSED] single_pixel_source_buffer
[08:18:10] [PASSED] single_pixel_clip_rectangle
[08:18:10] [PASSED] well_known_colors
[08:18:10] [PASSED] destination_pitch
[08:18:10] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[08:18:10] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[08:18:10] [PASSED] single_pixel_source_buffer
[08:18:10] [PASSED] single_pixel_clip_rectangle
[08:18:10] [PASSED] well_known_colors
[08:18:10] [PASSED] destination_pitch
[08:18:10] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[08:18:10] ================= drm_test_fb_clip_offset  =================
[08:18:10] [PASSED] pass through
[08:18:10] [PASSED] horizontal offset
[08:18:10] [PASSED] vertical offset
[08:18:10] [PASSED] horizontal and vertical offset
[08:18:10] [PASSED] horizontal offset (custom pitch)
[08:18:10] [PASSED] vertical offset (custom pitch)
[08:18:10] [PASSED] horizontal and vertical offset (custom pitch)
[08:18:10] ============= [PASSED] drm_test_fb_clip_offset =============
[08:18:10] ============== drm_test_fb_build_fourcc_list  ==============
[08:18:10] [PASSED] no native formats
[08:18:10] [PASSED] XRGB8888 as native format
[08:18:10] [PASSED] remove duplicates
[08:18:10] [PASSED] convert alpha formats
[08:18:10] [PASSED] random formats
[08:18:10] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[08:18:10] =================== drm_test_fb_memcpy  ====================
[08:18:10] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[08:18:10] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[08:18:10] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[08:18:10] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[08:18:10] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[08:18:10] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[08:18:10] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[08:18:10] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[08:18:10] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[08:18:10] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[08:18:10] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[08:18:10] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[08:18:10] =============== [PASSED] drm_test_fb_memcpy ================
[08:18:10] ============= [PASSED] drm_format_helper_test ==============
[08:18:10] ================= drm_format (18 subtests) =================
[08:18:10] [PASSED] drm_test_format_block_width_invalid
[08:18:10] [PASSED] drm_test_format_block_width_one_plane
[08:18:10] [PASSED] drm_test_format_block_width_two_plane
[08:18:10] [PASSED] drm_test_format_block_width_three_plane
[08:18:10] [PASSED] drm_test_format_block_width_tiled
[08:18:10] [PASSED] drm_test_format_block_height_invalid
[08:18:10] [PASSED] drm_test_format_block_height_one_plane
[08:18:10] [PASSED] drm_test_format_block_height_two_plane
[08:18:10] [PASSED] drm_test_format_block_height_three_plane
[08:18:10] [PASSED] drm_test_format_block_height_tiled
[08:18:10] [PASSED] drm_test_format_min_pitch_invalid
[08:18:10] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[08:18:10] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[08:18:10] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[08:18:10] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[08:18:10] [PASSED] drm_test_format_min_pitch_two_plane
[08:18:10] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[08:18:10] [PASSED] drm_test_format_min_pitch_tiled
[08:18:10] =================== [PASSED] drm_format ====================
[08:18:10] =============== drm_framebuffer (1 subtest) ================
[08:18:10] =============== drm_test_framebuffer_create  ===============
[08:18:10] [PASSED] ABGR8888 normal sizes
[08:18:10] [PASSED] ABGR8888 max sizes
[08:18:10] [PASSED] ABGR8888 pitch greater than min required
[08:18:10] [PASSED] ABGR8888 pitch less than min required
[08:18:10] [PASSED] ABGR8888 Invalid width
[08:18:10] [PASSED] ABGR8888 Invalid buffer handle
[08:18:10] [PASSED] No pixel format
[08:18:10] [PASSED] ABGR8888 Width 0
[08:18:10] [PASSED] ABGR8888 Height 0
[08:18:10] [PASSED] ABGR8888 Out of bound height * pitch combination
[08:18:10] [PASSED] ABGR8888 Large buffer offset
[08:18:10] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[08:18:10] [PASSED] ABGR8888 Valid buffer modifier
[08:18:10] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[08:18:10] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[08:18:10] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[08:18:10] [PASSED] NV12 Normal sizes
[08:18:10] [PASSED] NV12 Max sizes
[08:18:10] [PASSED] NV12 Invalid pitch
[08:18:10] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[08:18:10] [PASSED] NV12 different  modifier per-plane
[08:18:10] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[08:18:10] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[08:18:10] [PASSED] NV12 Modifier for inexistent plane
[08:18:10] [PASSED] NV12 Handle for inexistent plane
[08:18:10] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[08:18:10] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[08:18:10] [PASSED] YVU420 Normal sizes
[08:18:10] [PASSED] YVU420 Max sizes
[08:18:10] [PASSED] YVU420 Invalid pitch
[08:18:10] [PASSED] YVU420 Different pitches
[08:18:10] [PASSED] YVU420 Different buffer offsets/pitches
[08:18:10] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[08:18:10] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[08:18:10] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[08:18:10] [PASSED] YVU420 Valid modifier
[08:18:10] [PASSED] YVU420 Different modifiers per plane
[08:18:10] [PASSED] YVU420 Modifier for inexistent plane
[08:18:10] [PASSED] X0L2 Normal sizes
[08:18:10] [PASSED] X0L2 Max sizes
[08:18:10] [PASSED] X0L2 Invalid pitch
[08:18:10] [PASSED] X0L2 Pitch greater than minimum required
[08:18:10] [PASSED] X0L2 Handle for inexistent plane
[08:18:10] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[08:18:10] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[08:18:10] [PASSED] X0L2 Valid modifier
[08:18:10] [PASSED] X0L2 Modifier for inexistent plane
[08:18:10] =========== [PASSED] drm_test_framebuffer_create ===========
[08:18:10] ================= [PASSED] drm_framebuffer =================
[08:18:10] ================ drm_gem_shmem (8 subtests) ================
[08:18:10] [PASSED] drm_gem_shmem_test_obj_create
[08:18:10] [PASSED] drm_gem_shmem_test_obj_create_private
[08:18:10] [PASSED] drm_gem_shmem_test_pin_pages
[08:18:10] [PASSED] drm_gem_shmem_test_vmap
[08:18:10] [PASSED] drm_gem_shmem_test_get_pages_sgt
[08:18:10] [PASSED] drm_gem_shmem_test_get_sg_table
[08:18:10] [PASSED] drm_gem_shmem_test_madvise
[08:18:10] [PASSED] drm_gem_shmem_test_purge
[08:18:10] ================== [PASSED] drm_gem_shmem ==================
[08:18:10] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[08:18:10] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[08:18:10] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[08:18:10] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[08:18:10] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[08:18:10] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[08:18:10] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[08:18:10] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[08:18:10] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[08:18:10] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[08:18:10] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[08:18:10] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[08:18:10] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[08:18:10] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[08:18:10] [PASSED] drm_test_check_output_bpc_dvi
[08:18:10] [PASSED] drm_test_check_output_bpc_format_vic_1
[08:18:10] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[08:18:10] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[08:18:10] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[08:18:10] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[08:18:10] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[08:18:10] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[08:18:10] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[08:18:10] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[08:18:10] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[08:18:10] [PASSED] drm_test_check_broadcast_rgb_value
[08:18:10] [PASSED] drm_test_check_bpc_8_value
[08:18:10] [PASSED] drm_test_check_bpc_10_value
[08:18:10] [PASSED] drm_test_check_bpc_12_value
[08:18:10] [PASSED] drm_test_check_format_value
[08:18:10] [PASSED] drm_test_check_tmds_char_value
[08:18:10] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[08:18:10] ================= drm_managed (2 subtests) =================
[08:18:10] [PASSED] drm_test_managed_release_action
[08:18:10] [PASSED] drm_test_managed_run_action
[08:18:10] =================== [PASSED] drm_managed ===================
[08:18:10] =================== drm_mm (6 subtests) ====================
[08:18:10] [PASSED] drm_test_mm_init
[08:18:10] [PASSED] drm_test_mm_debug
[08:18:10] [PASSED] drm_test_mm_align32
[08:18:10] [PASSED] drm_test_mm_align64
[08:18:10] [PASSED] drm_test_mm_lowest
[08:18:10] [PASSED] drm_test_mm_highest
[08:18:10] ===================== [PASSED] drm_mm ======================
[08:18:10] ============= drm_modes_analog_tv (4 subtests) =============
[08:18:10] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[08:18:10] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[08:18:10] [PASSED] drm_test_modes_analog_tv_pal_576i
[08:18:10] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[08:18:10] =============== [PASSED] drm_modes_analog_tv ===============
[08:18:10] ============== drm_plane_helper (2 subtests) ===============
[08:18:10] =============== drm_test_check_plane_state  ================
[08:18:10] [PASSED] clipping_simple
[08:18:10] [PASSED] clipping_rotate_reflect
[08:18:10] [PASSED] positioning_simple
[08:18:10] [PASSED] upscaling
[08:18:10] [PASSED] downscaling
[08:18:10] [PASSED] rounding1
[08:18:10] [PASSED] rounding2
[08:18:10] [PASSED] rounding3
[08:18:10] [PASSED] rounding4
[08:18:10] =========== [PASSED] drm_test_check_plane_state ============
[08:18:10] =========== drm_test_check_invalid_plane_state  ============
[08:18:10] [PASSED] positioning_invalid
[08:18:10] [PASSED] upscaling_invalid
[08:18:10] [PASSED] downscaling_invalid
[08:18:10] ======= [PASSED] drm_test_check_invalid_plane_state ========
[08:18:10] ================ [PASSED] drm_plane_helper =================
stty: 'standard input': Inappropriate ioctl for device
[08:18:10] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[08:18:10] ====== drm_test_connector_helper_tv_get_modes_check  =======
[08:18:10] [PASSED] None
[08:18:10] [PASSED] PAL
[08:18:10] [PASSED] NTSC
[08:18:10] [PASSED] Both, NTSC Default
[08:18:10] [PASSED] Both, PAL Default
[08:18:10] [PASSED] Both, NTSC Default, with PAL on command-line
[08:18:10] [PASSED] Both, PAL Default, with NTSC on command-line
[08:18:10] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[08:18:10] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[08:18:10] ================== drm_rect (9 subtests) ===================
[08:18:10] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[08:18:10] [PASSED] drm_test_rect_clip_scaled_not_clipped
[08:18:10] [PASSED] drm_test_rect_clip_scaled_clipped
[08:18:10] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[08:18:10] ================= drm_test_rect_intersect  =================
[08:18:10] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[08:18:10] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[08:18:10] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[08:18:10] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[08:18:10] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[08:18:10] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[08:18:10] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[08:18:10] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[08:18:10] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[08:18:10] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[08:18:10] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[08:18:10] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[08:18:10] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[08:18:10] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[08:18:10] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[08:18:10] ============= [PASSED] drm_test_rect_intersect =============
[08:18:10] ================ drm_test_rect_calc_hscale  ================
[08:18:10] [PASSED] normal use
[08:18:10] [PASSED] out of max range
[08:18:10] [PASSED] out of min range
[08:18:10] [PASSED] zero dst
[08:18:10] [PASSED] negative src
[08:18:10] [PASSED] negative dst
[08:18:10] ============ [PASSED] drm_test_rect_calc_hscale ============
[08:18:10] ================ drm_test_rect_calc_vscale  ================
[08:18:10] [PASSED] normal use
[08:18:10] [PASSED] out of max range
[08:18:10] [PASSED] out of min range
[08:18:10] [PASSED] zero dst
[08:18:10] [PASSED] negative src
[08:18:10] [PASSED] negative dst
[08:18:10] ============ [PASSED] drm_test_rect_calc_vscale ============
[08:18:10] ================== drm_test_rect_rotate  ===================
[08:18:10] [PASSED] reflect-x
[08:18:10] [PASSED] reflect-y
[08:18:10] [PASSED] rotate-0
[08:18:10] [PASSED] rotate-90
[08:18:10] [PASSED] rotate-180
[08:18:10] [PASSED] rotate-270
[08:18:10] ============== [PASSED] drm_test_rect_rotate ===============
[08:18:10] ================ drm_test_rect_rotate_inv  =================
[08:18:10] [PASSED] reflect-x
[08:18:10] [PASSED] reflect-y
[08:18:10] [PASSED] rotate-0
[08:18:10] [PASSED] rotate-90
[08:18:10] [PASSED] rotate-180
[08:18:10] [PASSED] rotate-270
[08:18:10] ============ [PASSED] drm_test_rect_rotate_inv =============
[08:18:10] ==================== [PASSED] drm_rect =====================
[08:18:10] ============================================================
[08:18:10] Testing complete. Ran 511 tests: passed: 511
[08:18:10] Elapsed time: 23.385s total, 1.733s configuring, 21.426s building, 0.195s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


