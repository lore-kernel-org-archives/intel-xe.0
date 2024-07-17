Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB763C3DA62
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 20:00:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A3B10E3FE;
	Wed, 17 Jul 2024 20:00:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A85E10E3D9;
 Wed, 17 Jul 2024 20:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Convert_live_tests_to_paramete?=
 =?utf-8?q?rized_style_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Jul 2024 20:00:27 -0000
Message-ID: <172124642729.271338.5378707417726253630@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240717195155.442-1-michal.wajdeczko@intel.com>
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

Series: Convert live tests to parameterized style (rev2)
URL   : https://patchwork.freedesktop.org/series/136163/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[19:59:02] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:59:06] Building KUnit Kernel ...
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

[19:59:31] Starting KUnit Kernel (1/1)...
[19:59:31] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[19:59:31] =================== guc_dbm (7 subtests) ===================
[19:59:31] [PASSED] test_empty
[19:59:31] [PASSED] test_default
[19:59:31] ======================== test_size  ========================
[19:59:31] [PASSED] 4
[19:59:31] [PASSED] 8
[19:59:31] [PASSED] 32
[19:59:31] [PASSED] 256
[19:59:31] ==================== [PASSED] test_size ====================
[19:59:31] ======================= test_reuse  ========================
[19:59:31] [PASSED] 4
[19:59:31] [PASSED] 8
[19:59:31] [PASSED] 32
[19:59:31] [PASSED] 256
[19:59:31] =================== [PASSED] test_reuse ====================
[19:59:31] =================== test_range_overlap  ====================
[19:59:31] [PASSED] 4
[19:59:31] [PASSED] 8
[19:59:31] [PASSED] 32
[19:59:31] [PASSED] 256
[19:59:31] =============== [PASSED] test_range_overlap ================
[19:59:31] =================== test_range_compact  ====================
[19:59:31] [PASSED] 4
[19:59:31] [PASSED] 8
[19:59:31] [PASSED] 32
[19:59:31] [PASSED] 256
[19:59:31] =============== [PASSED] test_range_compact ================
[19:59:31] ==================== test_range_spare  =====================
[19:59:31] [PASSED] 4
[19:59:31] [PASSED] 8
[19:59:31] [PASSED] 32
[19:59:31] [PASSED] 256
[19:59:31] ================ [PASSED] test_range_spare =================
[19:59:31] ===================== [PASSED] guc_dbm =====================
[19:59:31] =================== guc_idm (6 subtests) ===================
[19:59:31] [PASSED] bad_init
[19:59:31] [PASSED] no_init
[19:59:31] [PASSED] init_fini
[19:59:31] [PASSED] check_used
[19:59:31] [PASSED] check_quota
[19:59:31] [PASSED] check_all
[19:59:31] ===================== [PASSED] guc_idm =====================
[19:59:31] ================== no_relay (3 subtests) ===================
[19:59:31] [PASSED] xe_drops_guc2pf_if_not_ready
[19:59:31] [PASSED] xe_drops_guc2vf_if_not_ready
[19:59:31] [PASSED] xe_rejects_send_if_not_ready
[19:59:31] ==================== [PASSED] no_relay =====================
[19:59:31] ================== pf_relay (14 subtests) ==================
[19:59:31] [PASSED] pf_rejects_guc2pf_too_short
[19:59:31] [PASSED] pf_rejects_guc2pf_too_long
[19:59:31] [PASSED] pf_rejects_guc2pf_no_payload
[19:59:31] [PASSED] pf_fails_no_payload
[19:59:31] [PASSED] pf_fails_bad_origin
[19:59:31] [PASSED] pf_fails_bad_type
[19:59:31] [PASSED] pf_txn_reports_error
[19:59:31] [PASSED] pf_txn_sends_pf2guc
[19:59:31] [PASSED] pf_sends_pf2guc
[19:59:31] [SKIPPED] pf_loopback_nop
[19:59:31] [SKIPPED] pf_loopback_echo
[19:59:31] [SKIPPED] pf_loopback_fail
[19:59:31] [SKIPPED] pf_loopback_busy
[19:59:31] [SKIPPED] pf_loopback_retry
[19:59:31] ==================== [PASSED] pf_relay =====================
[19:59:31] ================== vf_relay (3 subtests) ===================
[19:59:31] [PASSED] vf_rejects_guc2vf_too_short
[19:59:31] [PASSED] vf_rejects_guc2vf_too_long
[19:59:31] [PASSED] vf_rejects_guc2vf_no_payload
[19:59:31] ==================== [PASSED] vf_relay =====================
[19:59:31] ================= pf_service (11 subtests) =================
[19:59:31] [PASSED] pf_negotiate_any
[19:59:31] [PASSED] pf_negotiate_base_match
[19:59:31] [PASSED] pf_negotiate_base_newer
[19:59:31] [PASSED] pf_negotiate_base_next
[19:59:31] [SKIPPED] pf_negotiate_base_older
[19:59:31] [PASSED] pf_negotiate_base_prev
[19:59:31] [PASSED] pf_negotiate_latest_match
[19:59:31] [PASSED] pf_negotiate_latest_newer
[19:59:31] [PASSED] pf_negotiate_latest_next
[19:59:31] [SKIPPED] pf_negotiate_latest_older
[19:59:31] [SKIPPED] pf_negotiate_latest_prev
[19:59:31] =================== [PASSED] pf_service ====================
[19:59:31] ===================== lmtt (1 subtest) =====================
[19:59:31] ======================== test_ops  =========================
[19:59:31] [PASSED] 2-level
[19:59:31] [PASSED] multi-level
[19:59:31] ==================== [PASSED] test_ops =====================
[19:59:31] ====================== [PASSED] lmtt =======================
[19:59:31] =================== xe_mocs (2 subtests) ===================
[19:59:31] ================ xe_live_mocs_kernel_kunit  ================
[19:59:31] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[19:59:31] ================ xe_live_mocs_reset_kunit  =================
[19:59:31] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[19:59:31] ==================== [SKIPPED] xe_mocs =====================
[19:59:31] ================== xe_migrate (1 subtest) ==================
[19:59:31] ================= xe_migrate_sanity_kunit  =================
[19:59:31] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[19:59:31] =================== [SKIPPED] xe_migrate ===================
[19:59:31] ================== xe_dma_buf (1 subtest) ==================
[19:59:31] ==================== xe_dma_buf_kunit  =====================
[19:59:31] ================ [SKIPPED] xe_dma_buf_kunit ================
[19:59:31] =================== [SKIPPED] xe_dma_buf ===================
[19:59:31] ==================== xe_bo (2 subtests) ====================
[19:59:31] ================== xe_ccs_migrate_kunit  ===================
[19:59:31] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[19:59:31] ==================== xe_bo_evict_kunit  ====================
[19:59:31] =============== [SKIPPED] xe_bo_evict_kunit ================
[19:59:31] ===================== [SKIPPED] xe_bo ======================
[19:59:31] ==================== args (11 subtests) ====================
[19:59:31] [PASSED] count_args_test
[19:59:31] [PASSED] call_args_example
[19:59:31] [PASSED] call_args_test
[19:59:31] [PASSED] drop_first_arg_example
[19:59:31] [PASSED] drop_first_arg_test
[19:59:31] [PASSED] first_arg_example
[19:59:31] [PASSED] first_arg_test
[19:59:31] [PASSED] last_arg_example
[19:59:31] [PASSED] last_arg_test
[19:59:31] [PASSED] pick_arg_example
[19:59:31] [PASSED] sep_comma_example
[19:59:31] ====================== [PASSED] args =======================
[19:59:31] =================== xe_pci (2 subtests) ====================
[19:59:31] [PASSED] xe_gmdid_graphics_ip
[19:59:31] [PASSED] xe_gmdid_media_ip
[19:59:31] ===================== [PASSED] xe_pci ======================
stty: 'standard input': Inappropriate ioctl for device
[19:59:31] ==================== xe_rtp (1 subtest) ====================
[19:59:31] ================== xe_rtp_process_tests  ===================
[19:59:31] [PASSED] coalesce-same-reg
[19:59:31] [PASSED] no-match-no-add
[19:59:31] [PASSED] match-or
[19:59:31] [PASSED] match-or-xfail
[19:59:31] [PASSED] no-match-no-add-multiple-rules
[19:59:31] [PASSED] two-regs-two-entries
[19:59:31] [PASSED] clr-one-set-other
[19:59:31] [PASSED] set-field
[19:59:31] [PASSED] conflict-duplicate
[19:59:31] [PASSED] conflict-not-disjoint
[19:59:31] [PASSED] conflict-reg-type
[19:59:31] ============== [PASSED] xe_rtp_process_tests ===============
[19:59:31] ===================== [PASSED] xe_rtp ======================
[19:59:31] ==================== xe_wa (1 subtest) =====================
[19:59:31] ======================== xe_wa_gt  =========================
[19:59:31] [PASSED] TIGERLAKE (B0)
[19:59:31] [PASSED] DG1 (A0)
[19:59:31] [PASSED] DG1 (B0)
[19:59:31] [PASSED] ALDERLAKE_S (A0)
[19:59:31] [PASSED] ALDERLAKE_S (B0)
[19:59:31] [PASSED] ALDERLAKE_S (C0)
[19:59:31] [PASSED] ALDERLAKE_S (D0)
[19:59:31] [PASSED] ALDERLAKE_P (A0)
[19:59:31] [PASSED] ALDERLAKE_P (B0)
[19:59:31] [PASSED] ALDERLAKE_P (C0)
[19:59:31] [PASSED] ALDERLAKE_S_RPLS (D0)
[19:59:31] [PASSED] ALDERLAKE_P_RPLU (E0)
[19:59:31] [PASSED] DG2_G10 (C0)
[19:59:31] [PASSED] DG2_G11 (B1)
[19:59:31] [PASSED] DG2_G12 (A1)
[19:59:31] [PASSED] METEORLAKE (g:A0, m:A0)
[19:59:31] [PASSED] METEORLAKE (g:A0, m:A0)
[19:59:31] [PASSED] METEORLAKE (g:A0, m:A0)
[19:59:31] [PASSED] LUNARLAKE (g:A0, m:A0)
[19:59:31] [PASSED] LUNARLAKE (g:B0, m:A0)
[19:59:31] ==================== [PASSED] xe_wa_gt =====================
[19:59:31] ====================== [PASSED] xe_wa ======================
[19:59:31] ============================================================
[19:59:31] Testing complete. Ran 111 tests: passed: 97, skipped: 14
[19:59:31] Elapsed time: 29.784s total, 4.215s configuring, 25.350s building, 0.205s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[19:59:31] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:59:33] Building KUnit Kernel ...
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

[19:59:55] Starting KUnit Kernel (1/1)...
[19:59:55] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[19:59:55] ============ drm_test_pick_cmdline (2 subtests) ============
[19:59:55] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[19:59:55] =============== drm_test_pick_cmdline_named  ===============
[19:59:55] [PASSED] NTSC
[19:59:55] [PASSED] NTSC-J
[19:59:55] [PASSED] PAL
[19:59:55] [PASSED] PAL-M
[19:59:55] =========== [PASSED] drm_test_pick_cmdline_named ===========
[19:59:55] ============== [PASSED] drm_test_pick_cmdline ==============
[19:59:55] ================== drm_buddy (7 subtests) ==================
[19:59:55] [PASSED] drm_test_buddy_alloc_limit
[19:59:55] [PASSED] drm_test_buddy_alloc_optimistic
[19:59:55] [PASSED] drm_test_buddy_alloc_pessimistic
[19:59:55] [PASSED] drm_test_buddy_alloc_pathological
[19:59:55] [PASSED] drm_test_buddy_alloc_contiguous
[19:59:55] [PASSED] drm_test_buddy_alloc_clear
[19:59:55] [PASSED] drm_test_buddy_alloc_range_bias
[19:59:55] ==================== [PASSED] drm_buddy ====================
[19:59:55] ============= drm_cmdline_parser (40 subtests) =============
[19:59:55] [PASSED] drm_test_cmdline_force_d_only
[19:59:55] [PASSED] drm_test_cmdline_force_D_only_dvi
[19:59:55] [PASSED] drm_test_cmdline_force_D_only_hdmi
[19:59:55] [PASSED] drm_test_cmdline_force_D_only_not_digital
[19:59:55] [PASSED] drm_test_cmdline_force_e_only
[19:59:55] [PASSED] drm_test_cmdline_res
[19:59:55] [PASSED] drm_test_cmdline_res_vesa
[19:59:55] [PASSED] drm_test_cmdline_res_vesa_rblank
[19:59:55] [PASSED] drm_test_cmdline_res_rblank
[19:59:55] [PASSED] drm_test_cmdline_res_bpp
[19:59:55] [PASSED] drm_test_cmdline_res_refresh
[19:59:55] [PASSED] drm_test_cmdline_res_bpp_refresh
[19:59:55] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[19:59:55] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[19:59:55] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[19:59:55] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[19:59:55] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[19:59:55] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[19:59:55] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[19:59:55] [PASSED] drm_test_cmdline_res_margins_force_on
[19:59:55] [PASSED] drm_test_cmdline_res_vesa_margins
[19:59:55] [PASSED] drm_test_cmdline_name
[19:59:55] [PASSED] drm_test_cmdline_name_bpp
[19:59:55] [PASSED] drm_test_cmdline_name_option
[19:59:55] [PASSED] drm_test_cmdline_name_bpp_option
[19:59:55] [PASSED] drm_test_cmdline_rotate_0
[19:59:55] [PASSED] drm_test_cmdline_rotate_90
[19:59:55] [PASSED] drm_test_cmdline_rotate_180
[19:59:55] [PASSED] drm_test_cmdline_rotate_270
[19:59:55] [PASSED] drm_test_cmdline_hmirror
[19:59:55] [PASSED] drm_test_cmdline_vmirror
[19:59:55] [PASSED] drm_test_cmdline_margin_options
[19:59:55] [PASSED] drm_test_cmdline_multiple_options
[19:59:55] [PASSED] drm_test_cmdline_bpp_extra_and_option
[19:59:55] [PASSED] drm_test_cmdline_extra_and_option
[19:59:55] [PASSED] drm_test_cmdline_freestanding_options
[19:59:55] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[19:59:55] [PASSED] drm_test_cmdline_panel_orientation
[19:59:55] ================ drm_test_cmdline_invalid  =================
[19:59:55] [PASSED] margin_only
[19:59:55] [PASSED] interlace_only
[19:59:55] [PASSED] res_missing_x
[19:59:55] [PASSED] res_missing_y
[19:59:55] [PASSED] res_bad_y
[19:59:55] [PASSED] res_missing_y_bpp
[19:59:55] [PASSED] res_bad_bpp
[19:59:55] [PASSED] res_bad_refresh
[19:59:55] [PASSED] res_bpp_refresh_force_on_off
[19:59:55] [PASSED] res_invalid_mode
[19:59:55] [PASSED] res_bpp_wrong_place_mode
[19:59:55] [PASSED] name_bpp_refresh
[19:59:55] [PASSED] name_refresh
[19:59:55] [PASSED] name_refresh_wrong_mode
[19:59:55] [PASSED] name_refresh_invalid_mode
[19:59:55] [PASSED] rotate_multiple
[19:59:55] [PASSED] rotate_invalid_val
[19:59:55] [PASSED] rotate_truncated
[19:59:55] [PASSED] invalid_option
[19:59:55] [PASSED] invalid_tv_option
[19:59:55] [PASSED] truncated_tv_option
[19:59:55] ============ [PASSED] drm_test_cmdline_invalid =============
[19:59:55] =============== drm_test_cmdline_tv_options  ===============
[19:59:55] [PASSED] NTSC
[19:59:55] [PASSED] NTSC_443
[19:59:55] [PASSED] NTSC_J
[19:59:55] [PASSED] PAL
[19:59:55] [PASSED] PAL_M
[19:59:55] [PASSED] PAL_N
[19:59:55] [PASSED] SECAM
[19:59:55] [PASSED] MONO_525
[19:59:55] [PASSED] MONO_625
[19:59:55] =========== [PASSED] drm_test_cmdline_tv_options ===========
[19:59:55] =============== [PASSED] drm_cmdline_parser ================
[19:59:55] ========== drmm_connector_hdmi_init (19 subtests) ==========
[19:59:55] [PASSED] drm_test_connector_hdmi_init_valid
[19:59:55] [PASSED] drm_test_connector_hdmi_init_bpc_8
[19:59:55] [PASSED] drm_test_connector_hdmi_init_bpc_10
[19:59:55] [PASSED] drm_test_connector_hdmi_init_bpc_12
[19:59:55] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[19:59:55] [PASSED] drm_test_connector_hdmi_init_bpc_null
[19:59:55] [PASSED] drm_test_connector_hdmi_init_formats_empty
[19:59:55] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[19:59:55] [PASSED] drm_test_connector_hdmi_init_null_ddc
[19:59:55] [PASSED] drm_test_connector_hdmi_init_null_product
[19:59:55] [PASSED] drm_test_connector_hdmi_init_null_vendor
[19:59:55] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[19:59:55] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[19:59:55] [PASSED] drm_test_connector_hdmi_init_product_valid
[19:59:55] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[19:59:55] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[19:59:55] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[19:59:55] ========= drm_test_connector_hdmi_init_type_valid  =========
[19:59:55] [PASSED] HDMI-A
[19:59:55] [PASSED] HDMI-B
[19:59:55] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[19:59:55] ======== drm_test_connector_hdmi_init_type_invalid  ========
[19:59:55] [PASSED] Unknown
[19:59:55] [PASSED] VGA
[19:59:55] [PASSED] DVI-I
[19:59:55] [PASSED] DVI-D
[19:59:55] [PASSED] DVI-A
[19:59:55] [PASSED] Composite
[19:59:55] [PASSED] SVIDEO
[19:59:55] [PASSED] LVDS
[19:59:55] [PASSED] Component
[19:59:55] [PASSED] DIN
[19:59:55] [PASSED] DP
[19:59:55] [PASSED] TV
[19:59:55] [PASSED] eDP
[19:59:55] [PASSED] Virtual
[19:59:55] [PASSED] DSI
[19:59:55] [PASSED] DPI
[19:59:55] [PASSED] Writeback
[19:59:55] [PASSED] SPI
[19:59:55] [PASSED] USB
[19:59:55] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[19:59:55] ============ [PASSED] drmm_connector_hdmi_init =============
[19:59:55] ============= drmm_connector_init (3 subtests) =============
[19:59:55] [PASSED] drm_test_drmm_connector_init
[19:59:55] [PASSED] drm_test_drmm_connector_init_null_ddc
[19:59:55] ========= drm_test_drmm_connector_init_type_valid  =========
[19:59:55] [PASSED] Unknown
[19:59:55] [PASSED] VGA
[19:59:55] [PASSED] DVI-I
[19:59:55] [PASSED] DVI-D
[19:59:55] [PASSED] DVI-A
[19:59:55] [PASSED] Composite
[19:59:55] [PASSED] SVIDEO
[19:59:55] [PASSED] LVDS
[19:59:55] [PASSED] Component
[19:59:55] [PASSED] DIN
[19:59:55] [PASSED] DP
[19:59:55] [PASSED] HDMI-A
[19:59:55] [PASSED] HDMI-B
[19:59:55] [PASSED] TV
[19:59:55] [PASSED] eDP
[19:59:55] [PASSED] Virtual
[19:59:55] [PASSED] DSI
[19:59:55] [PASSED] DPI
[19:59:55] [PASSED] Writeback
[19:59:55] [PASSED] SPI
[19:59:55] [PASSED] USB
[19:59:55] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[19:59:55] =============== [PASSED] drmm_connector_init ===============
[19:59:55] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[19:59:55] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[19:59:55] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[19:59:55] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[19:59:55] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[19:59:55] ========== drm_test_get_tv_mode_from_name_valid  ===========
[19:59:55] [PASSED] NTSC
[19:59:55] [PASSED] NTSC-443
[19:59:55] [PASSED] NTSC-J
[19:59:55] [PASSED] PAL
[19:59:55] [PASSED] PAL-M
[19:59:55] [PASSED] PAL-N
[19:59:55] [PASSED] SECAM
[19:59:55] [PASSED] Mono
[19:59:55] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[19:59:55] [PASSED] drm_test_get_tv_mode_from_name_truncated
[19:59:55] ============ [PASSED] drm_get_tv_mode_from_name ============
[19:59:55] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[19:59:55] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[19:59:55] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[19:59:55] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[19:59:55] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[19:59:55] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[19:59:55] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[19:59:55] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[19:59:55] [PASSED] VIC 96
[19:59:55] [PASSED] VIC 97
[19:59:55] [PASSED] VIC 101
[19:59:55] [PASSED] VIC 102
[19:59:55] [PASSED] VIC 106
[19:59:55] [PASSED] VIC 107
[19:59:55] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[19:59:55] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[19:59:55] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[19:59:55] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[19:59:55] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[19:59:55] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[19:59:55] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[19:59:55] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[19:59:55] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[19:59:55] [PASSED] Automatic
[19:59:55] [PASSED] Full
[19:59:55] [PASSED] Limited 16:235
[19:59:55] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[19:59:55] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[19:59:55] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[19:59:55] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[19:59:55] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[19:59:55] [PASSED] RGB
[19:59:55] [PASSED] YUV 4:2:0
[19:59:55] [PASSED] YUV 4:2:2
[19:59:55] [PASSED] YUV 4:4:4
[19:59:55] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[19:59:55] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[19:59:55] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[19:59:55] ============= drm_damage_helper (21 subtests) ==============
[19:59:55] [PASSED] drm_test_damage_iter_no_damage
[19:59:55] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[19:59:55] [PASSED] drm_test_damage_iter_no_damage_src_moved
[19:59:55] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[19:59:55] [PASSED] drm_test_damage_iter_no_damage_not_visible
[19:59:55] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[19:59:55] [PASSED] drm_test_damage_iter_no_damage_no_fb
[19:59:55] [PASSED] drm_test_damage_iter_simple_damage
[19:59:55] [PASSED] drm_test_damage_iter_single_damage
[19:59:55] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[19:59:55] [PASSED] drm_test_damage_iter_single_damage_outside_src
[19:59:55] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[19:59:55] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[19:59:55] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[19:59:55] [PASSED] drm_test_damage_iter_single_damage_src_moved
[19:59:55] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[19:59:55] [PASSED] drm_test_damage_iter_damage
[19:59:55] [PASSED] drm_test_damage_iter_damage_one_intersect
[19:59:55] [PASSED] drm_test_damage_iter_damage_one_outside
[19:59:55] [PASSED] drm_test_damage_iter_damage_src_moved
[19:59:55] [PASSED] drm_test_damage_iter_damage_not_visible
[19:59:55] ================ [PASSED] drm_damage_helper ================
[19:59:55] ============== drm_dp_mst_helper (3 subtests) ==============
[19:59:55] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[19:59:55] [PASSED] Clock 154000 BPP 30 DSC disabled
[19:59:55] [PASSED] Clock 234000 BPP 30 DSC disabled
[19:59:55] [PASSED] Clock 297000 BPP 24 DSC disabled
[19:59:55] [PASSED] Clock 332880 BPP 24 DSC enabled
[19:59:55] [PASSED] Clock 324540 BPP 24 DSC enabled
[19:59:55] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[19:59:55] ============== drm_test_dp_mst_calc_pbn_div  ===============
[19:59:55] [PASSED] Link rate 2000000 lane count 4
[19:59:55] [PASSED] Link rate 2000000 lane count 2
[19:59:55] [PASSED] Link rate 2000000 lane count 1
[19:59:55] [PASSED] Link rate 1350000 lane count 4
[19:59:55] [PASSED] Link rate 1350000 lane count 2
[19:59:55] [PASSED] Link rate 1350000 lane count 1
[19:59:55] [PASSED] Link rate 1000000 lane count 4
[19:59:55] [PASSED] Link rate 1000000 lane count 2
[19:59:55] [PASSED] Link rate 1000000 lane count 1
[19:59:55] [PASSED] Link rate 810000 lane count 4
[19:59:55] [PASSED] Link rate 810000 lane count 2
[19:59:55] [PASSED] Link rate 810000 lane count 1
[19:59:55] [PASSED] Link rate 540000 lane count 4
[19:59:55] [PASSED] Link rate 540000 lane count 2
[19:59:55] [PASSED] Link rate 540000 lane count 1
[19:59:55] [PASSED] Link rate 270000 lane count 4
[19:59:55] [PASSED] Link rate 270000 lane count 2
[19:59:55] [PASSED] Link rate 270000 lane count 1
[19:59:55] [PASSED] Link rate 162000 lane count 4
[19:59:55] [PASSED] Link rate 162000 lane count 2
[19:59:55] [PASSED] Link rate 162000 lane count 1
[19:59:55] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[19:59:55] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[19:59:55] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[19:59:55] [PASSED] DP_POWER_UP_PHY with port number
[19:59:55] [PASSED] DP_POWER_DOWN_PHY with port number
[19:59:55] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[19:59:55] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[19:59:55] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[19:59:55] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[19:59:55] [PASSED] DP_QUERY_PAYLOAD with port number
[19:59:55] [PASSED] DP_QUERY_PAYLOAD with VCPI
[19:59:55] [PASSED] DP_REMOTE_DPCD_READ with port number
[19:59:55] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[19:59:55] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[19:59:55] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[19:59:55] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[19:59:55] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[19:59:55] [PASSED] DP_REMOTE_I2C_READ with port number
[19:59:55] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[19:59:55] [PASSED] DP_REMOTE_I2C_READ with transactions array
[19:59:55] [PASSED] DP_REMOTE_I2C_WRITE with port number
[19:59:55] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[19:59:55] [PASSED] DP_REMOTE_I2C_WRITE with data array
[19:59:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[19:59:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[19:59:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[19:59:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[19:59:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[19:59:55] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[19:59:55] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[19:59:55] ================ [PASSED] drm_dp_mst_helper ================
[19:59:55] ================== drm_exec (7 subtests) ===================
[19:59:55] [PASSED] sanitycheck
[19:59:55] [PASSED] test_lock
[19:59:55] [PASSED] test_lock_unlock
[19:59:55] [PASSED] test_duplicates
[19:59:55] [PASSED] test_prepare
[19:59:55] [PASSED] test_prepare_array
[19:59:55] [PASSED] test_multiple_loops
[19:59:55] ==================== [PASSED] drm_exec =====================
[19:59:55] =========== drm_format_helper_test (17 subtests) ===========
[19:59:55] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[19:59:55] [PASSED] single_pixel_source_buffer
[19:59:55] [PASSED] single_pixel_clip_rectangle
[19:59:55] [PASSED] well_known_colors
[19:59:55] [PASSED] destination_pitch
[19:59:55] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[19:59:55] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[19:59:55] [PASSED] single_pixel_source_buffer
[19:59:55] [PASSED] single_pixel_clip_rectangle
[19:59:55] [PASSED] well_known_colors
[19:59:55] [PASSED] destination_pitch
[19:59:55] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[19:59:55] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[19:59:55] [PASSED] single_pixel_source_buffer
[19:59:55] [PASSED] single_pixel_clip_rectangle
[19:59:55] [PASSED] well_known_colors
[19:59:55] [PASSED] destination_pitch
[19:59:55] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[19:59:55] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[19:59:55] [PASSED] single_pixel_source_buffer
[19:59:55] [PASSED] single_pixel_clip_rectangle
[19:59:55] [PASSED] well_known_colors
[19:59:55] [PASSED] destination_pitch
[19:59:55] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[19:59:55] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[19:59:55] [PASSED] single_pixel_source_buffer
[19:59:55] [PASSED] single_pixel_clip_rectangle
[19:59:55] [PASSED] well_known_colors
[19:59:55] [PASSED] destination_pitch
[19:59:55] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[19:59:55] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[19:59:55] [PASSED] single_pixel_source_buffer
[19:59:55] [PASSED] single_pixel_clip_rectangle
[19:59:55] [PASSED] well_known_colors
[19:59:55] [PASSED] destination_pitch
[19:59:55] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[19:59:55] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[19:59:55] [PASSED] single_pixel_source_buffer
[19:59:55] [PASSED] single_pixel_clip_rectangle
[19:59:55] [PASSED] well_known_colors
[19:59:55] [PASSED] destination_pitch
[19:59:55] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[19:59:55] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[19:59:55] [PASSED] single_pixel_source_buffer
[19:59:55] [PASSED] single_pixel_clip_rectangle
[19:59:55] [PASSED] well_known_colors
[19:59:55] [PASSED] destination_pitch
[19:59:55] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[19:59:55] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[19:59:55] [PASSED] single_pixel_source_buffer
[19:59:55] [PASSED] single_pixel_clip_rectangle
[19:59:55] [PASSED] well_known_colors
[19:59:55] [PASSED] destination_pitch
[19:59:55] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[19:59:55] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[19:59:55] [PASSED] single_pixel_source_buffer
[19:59:55] [PASSED] single_pixel_clip_rectangle
[19:59:55] [PASSED] well_known_colors
[19:59:55] [PASSED] destination_pitch
[19:59:55] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[19:59:55] ============== drm_test_fb_xrgb8888_to_mono  ===============
[19:59:55] [PASSED] single_pixel_source_buffer
[19:59:55] [PASSED] single_pixel_clip_rectangle
[19:59:55] [PASSED] well_known_colors
[19:59:55] [PASSED] destination_pitch
[19:59:55] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[19:59:55] ==================== drm_test_fb_swab  =====================
[19:59:55] [PASSED] single_pixel_source_buffer
[19:59:55] [PASSED] single_pixel_clip_rectangle
[19:59:55] [PASSED] well_known_colors
[19:59:55] [PASSED] destination_pitch
[19:59:55] ================ [PASSED] drm_test_fb_swab =================
[19:59:55] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[19:59:55] [PASSED] single_pixel_source_buffer
[19:59:55] [PASSED] single_pixel_clip_rectangle
[19:59:55] [PASSED] well_known_colors
[19:59:55] [PASSED] destination_pitch
[19:59:55] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[19:59:55] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[19:59:55] [PASSED] single_pixel_source_buffer
[19:59:55] [PASSED] single_pixel_clip_rectangle
[19:59:55] [PASSED] well_known_colors
[19:59:55] [PASSED] destination_pitch
[19:59:55] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[19:59:55] ================= drm_test_fb_clip_offset  =================
[19:59:55] [PASSED] pass through
[19:59:55] [PASSED] horizontal offset
[19:59:55] [PASSED] vertical offset
[19:59:55] [PASSED] horizontal and vertical offset
[19:59:55] [PASSED] horizontal offset (custom pitch)
[19:59:55] [PASSED] vertical offset (custom pitch)
[19:59:55] [PASSED] horizontal and vertical offset (custom pitch)
[19:59:55] ============= [PASSED] drm_test_fb_clip_offset =============
[19:59:55] ============== drm_test_fb_build_fourcc_list  ==============
[19:59:55] [PASSED] no native formats
[19:59:55] [PASSED] XRGB8888 as native format
[19:59:55] [PASSED] remove duplicates
[19:59:55] [PASSED] convert alpha formats
[19:59:55] [PASSED] random formats
[19:59:55] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[19:59:55] =================== drm_test_fb_memcpy  ====================
[19:59:55] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[19:59:55] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[19:59:55] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[19:59:55] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[19:59:55] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[19:59:55] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[19:59:55] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[19:59:55] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[19:59:55] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[19:59:55] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[19:59:55] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[19:59:55] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[19:59:55] =============== [PASSED] drm_test_fb_memcpy ================
[19:59:55] ============= [PASSED] drm_format_helper_test ==============
[19:59:55] ================= drm_format (18 subtests) =================
[19:59:55] [PASSED] drm_test_format_block_width_invalid
[19:59:55] [PASSED] drm_test_format_block_width_one_plane
[19:59:55] [PASSED] drm_test_format_block_width_two_plane
[19:59:55] [PASSED] drm_test_format_block_width_three_plane
[19:59:55] [PASSED] drm_test_format_block_width_tiled
[19:59:55] [PASSED] drm_test_format_block_height_invalid
[19:59:55] [PASSED] drm_test_format_block_height_one_plane
[19:59:55] [PASSED] drm_test_format_block_height_two_plane
[19:59:55] [PASSED] drm_test_format_block_height_three_plane
[19:59:55] [PASSED] drm_test_format_block_height_tiled
[19:59:55] [PASSED] drm_test_format_min_pitch_invalid
[19:59:55] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[19:59:55] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[19:59:55] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[19:59:55] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[19:59:55] [PASSED] drm_test_format_min_pitch_two_plane
[19:59:55] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[19:59:55] [PASSED] drm_test_format_min_pitch_tiled
[19:59:55] =================== [PASSED] drm_format ====================
[19:59:55] =============== drm_framebuffer (1 subtest) ================
[19:59:55] =============== drm_test_framebuffer_create  ===============
[19:59:55] [PASSED] ABGR8888 normal sizes
[19:59:55] [PASSED] ABGR8888 max sizes
[19:59:55] [PASSED] ABGR8888 pitch greater than min required
[19:59:55] [PASSED] ABGR8888 pitch less than min required
[19:59:55] [PASSED] ABGR8888 Invalid width
[19:59:55] [PASSED] ABGR8888 Invalid buffer handle
[19:59:55] [PASSED] No pixel format
[19:59:55] [PASSED] ABGR8888 Width 0
[19:59:55] [PASSED] ABGR8888 Height 0
[19:59:55] [PASSED] ABGR8888 Out of bound height * pitch combination
[19:59:55] [PASSED] ABGR8888 Large buffer offset
[19:59:55] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[19:59:55] [PASSED] ABGR8888 Valid buffer modifier
[19:59:55] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[19:59:55] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[19:59:55] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[19:59:55] [PASSED] NV12 Normal sizes
[19:59:55] [PASSED] NV12 Max sizes
[19:59:55] [PASSED] NV12 Invalid pitch
[19:59:55] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[19:59:55] [PASSED] NV12 different  modifier per-plane
[19:59:55] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[19:59:55] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[19:59:55] [PASSED] NV12 Modifier for inexistent plane
[19:59:55] [PASSED] NV12 Handle for inexistent plane
[19:59:55] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[19:59:55] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[19:59:55] [PASSED] YVU420 Normal sizes
[19:59:55] [PASSED] YVU420 Max sizes
[19:59:55] [PASSED] YVU420 Invalid pitch
[19:59:55] [PASSED] YVU420 Different pitches
[19:59:55] [PASSED] YVU420 Different buffer offsets/pitches
[19:59:55] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[19:59:55] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[19:59:55] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[19:59:55] [PASSED] YVU420 Valid modifier
[19:59:55] [PASSED] YVU420 Different modifiers per plane
[19:59:55] [PASSED] YVU420 Modifier for inexistent plane
[19:59:55] [PASSED] X0L2 Normal sizes
[19:59:55] [PASSED] X0L2 Max sizes
[19:59:55] [PASSED] X0L2 Invalid pitch
[19:59:55] [PASSED] X0L2 Pitch greater than minimum required
[19:59:55] [PASSED] X0L2 Handle for inexistent plane
[19:59:55] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[19:59:55] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[19:59:55] [PASSED] X0L2 Valid modifier
[19:59:55] [PASSED] X0L2 Modifier for inexistent plane
[19:59:55] =========== [PASSED] drm_test_framebuffer_create ===========
[19:59:55] ================= [PASSED] drm_framebuffer =================
[19:59:55] ================ drm_gem_shmem (8 subtests) ================
[19:59:55] [PASSED] drm_gem_shmem_test_obj_create
[19:59:55] [PASSED] drm_gem_shmem_test_obj_create_private
[19:59:55] [PASSED] drm_gem_shmem_test_pin_pages
[19:59:55] [PASSED] drm_gem_shmem_test_vmap
[19:59:55] [PASSED] drm_gem_shmem_test_get_pages_sgt
[19:59:55] [PASSED] drm_gem_shmem_test_get_sg_table
[19:59:55] [PASSED] drm_gem_shmem_test_madvise
[19:59:55] [PASSED] drm_gem_shmem_test_purge
[19:59:55] ================== [PASSED] drm_gem_shmem ==================
[19:59:55] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[19:59:55] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[19:59:55] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[19:59:55] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[19:59:55] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[19:59:55] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[19:59:55] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[19:59:55] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[19:59:55] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[19:59:55] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[19:59:55] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[19:59:55] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[19:59:55] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[19:59:55] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[19:59:55] [PASSED] drm_test_check_output_bpc_dvi
[19:59:55] [PASSED] drm_test_check_output_bpc_format_vic_1
[19:59:55] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[19:59:55] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[19:59:55] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[19:59:55] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[19:59:55] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[19:59:55] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[19:59:55] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[19:59:55] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[19:59:55] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[19:59:55] [PASSED] drm_test_check_broadcast_rgb_value
[19:59:55] [PASSED] drm_test_check_bpc_8_value
[19:59:55] [PASSED] drm_test_check_bpc_10_value
[19:59:55] [PASSED] drm_test_check_bpc_12_value
[19:59:55] [PASSED] drm_test_check_format_value
[19:59:55] [PASSED] drm_test_check_tmds_char_value
[19:59:55] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[19:59:55] ================= drm_managed (2 subtests) =================
[19:59:55] [PASSED] drm_test_managed_release_action
[19:59:55] [PASSED] drm_test_managed_run_action
[19:59:55] =================== [PASSED] drm_managed ===================
[19:59:55] =================== drm_mm (6 subtests) ====================
[19:59:55] [PASSED] drm_test_mm_init
[19:59:55] [PASSED] drm_test_mm_debug
[19:59:55] [PASSED] drm_test_mm_align32
[19:59:55] [PASSED] drm_test_mm_align64
[19:59:55] [PASSED] drm_test_mm_lowest
[19:59:55] [PASSED] drm_test_mm_highest
[19:59:55] ===================== [PASSED] drm_mm ======================
[19:59:55] ============= drm_modes_analog_tv (5 subtests) =============
[19:59:55] [PASSED] drm_test_modes_analog_tv_mono_576i
[19:59:55] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[19:59:55] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[19:59:55] [PASSED] drm_test_modes_analog_tv_pal_576i
[19:59:55] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[19:59:55] =============== [PASSED] drm_modes_analog_tv ===============
[19:59:55] ============== drm_plane_helper (2 subtests) ===============
[19:59:55] =============== drm_test_check_plane_state  ================
[19:59:55] [PASSED] clipping_simple
[19:59:55] [PASSED] clipping_rotate_reflect
[19:59:55] [PASSED] positioning_simple
[19:59:55] [PASSED] upscaling
[19:59:55] [PASSED] downscaling
[19:59:55] [PASSED] rounding1
[19:59:55] [PASSED] rounding2
[19:59:55] [PASSED] rounding3
[19:59:55] [PASSED] rounding4
[19:59:55] =========== [PASSED] drm_test_check_plane_state ============
[19:59:55] =========== drm_test_check_invalid_plane_state  ============
[19:59:55] [PASSED] positioning_invalid
[19:59:55] [PASSED] upscaling_invalid
stty: 'standard input': Inappropriate ioctl for device
[19:59:55] [PASSED] downscaling_invalid
[19:59:55] ======= [PASSED] drm_test_check_invalid_plane_state ========
[19:59:55] ================ [PASSED] drm_plane_helper =================
[19:59:55] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[19:59:55] ====== drm_test_connector_helper_tv_get_modes_check  =======
[19:59:55] [PASSED] None
[19:59:55] [PASSED] PAL
[19:59:55] [PASSED] NTSC
[19:59:55] [PASSED] Both, NTSC Default
[19:59:55] [PASSED] Both, PAL Default
[19:59:55] [PASSED] Both, NTSC Default, with PAL on command-line
[19:59:55] [PASSED] Both, PAL Default, with NTSC on command-line
[19:59:55] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[19:59:55] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[19:59:55] ================== drm_rect (9 subtests) ===================
[19:59:55] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[19:59:55] [PASSED] drm_test_rect_clip_scaled_not_clipped
[19:59:55] [PASSED] drm_test_rect_clip_scaled_clipped
[19:59:55] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[19:59:55] ================= drm_test_rect_intersect  =================
[19:59:55] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[19:59:55] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[19:59:55] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[19:59:55] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[19:59:55] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[19:59:55] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[19:59:55] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[19:59:55] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[19:59:55] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[19:59:55] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[19:59:55] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[19:59:55] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[19:59:55] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[19:59:55] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[19:59:55] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[19:59:55] ============= [PASSED] drm_test_rect_intersect =============
[19:59:55] ================ drm_test_rect_calc_hscale  ================
[19:59:55] [PASSED] normal use
[19:59:55] [PASSED] out of max range
[19:59:55] [PASSED] out of min range
[19:59:55] [PASSED] zero dst
[19:59:55] [PASSED] negative src
[19:59:55] [PASSED] negative dst
[19:59:55] ============ [PASSED] drm_test_rect_calc_hscale ============
[19:59:55] ================ drm_test_rect_calc_vscale  ================
[19:59:55] [PASSED] normal use
[19:59:55] [PASSED] out of max range
[19:59:55] [PASSED] out of min range
[19:59:55] [PASSED] zero dst
[19:59:55] [PASSED] negative src
[19:59:55] [PASSED] negative dst
[19:59:55] ============ [PASSED] drm_test_rect_calc_vscale ============
[19:59:55] ================== drm_test_rect_rotate  ===================
[19:59:55] [PASSED] reflect-x
[19:59:55] [PASSED] reflect-y
[19:59:55] [PASSED] rotate-0
[19:59:55] [PASSED] rotate-90
[19:59:55] [PASSED] rotate-180
[19:59:55] [PASSED] rotate-270
[19:59:55] ============== [PASSED] drm_test_rect_rotate ===============
[19:59:55] ================ drm_test_rect_rotate_inv  =================
[19:59:55] [PASSED] reflect-x
[19:59:55] [PASSED] reflect-y
[19:59:55] [PASSED] rotate-0
[19:59:55] [PASSED] rotate-90
[19:59:55] [PASSED] rotate-180
[19:59:55] [PASSED] rotate-270
[19:59:55] ============ [PASSED] drm_test_rect_rotate_inv =============
[19:59:55] ==================== [PASSED] drm_rect =====================
[19:59:55] ============================================================
[19:59:55] Testing complete. Ran 515 tests: passed: 515
[19:59:55] Elapsed time: 23.606s total, 1.711s configuring, 21.676s building, 0.203s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[19:59:55] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:59:57] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[20:00:06] Starting KUnit Kernel (1/1)...
[20:00:06] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[20:00:06] ================= ttm_device (5 subtests) ==================
[20:00:06] [PASSED] ttm_device_init_basic
[20:00:06] [PASSED] ttm_device_init_multiple
[20:00:06] [PASSED] ttm_device_fini_basic
[20:00:06] [PASSED] ttm_device_init_no_vma_man
[20:00:06] ================== ttm_device_init_pools  ==================
[20:00:06] [PASSED] No DMA allocations, no DMA32 required
[20:00:06] [PASSED] DMA allocations, DMA32 required
[20:00:06] [PASSED] No DMA allocations, DMA32 required
[20:00:06] [PASSED] DMA allocations, no DMA32 required
[20:00:06] ============== [PASSED] ttm_device_init_pools ==============
[20:00:06] =================== [PASSED] ttm_device ====================
[20:00:06] ================== ttm_pool (8 subtests) ===================
[20:00:06] ================== ttm_pool_alloc_basic  ===================
[20:00:06] [PASSED] One page
[20:00:06] [PASSED] More than one page
[20:00:06] [PASSED] Above the allocation limit
[20:00:06] [PASSED] One page, with coherent DMA mappings enabled
[20:00:06] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[20:00:06] ============== [PASSED] ttm_pool_alloc_basic ===============
[20:00:06] ============== ttm_pool_alloc_basic_dma_addr  ==============
[20:00:06] [PASSED] One page
[20:00:06] [PASSED] More than one page
[20:00:06] [PASSED] Above the allocation limit
[20:00:06] [PASSED] One page, with coherent DMA mappings enabled
[20:00:06] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[20:00:06] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[20:00:06] [PASSED] ttm_pool_alloc_order_caching_match
[20:00:06] [PASSED] ttm_pool_alloc_caching_mismatch
[20:00:06] [PASSED] ttm_pool_alloc_order_mismatch
[20:00:06] [PASSED] ttm_pool_free_dma_alloc
[20:00:06] [PASSED] ttm_pool_free_no_dma_alloc
[20:00:06] [PASSED] ttm_pool_fini_basic
[20:00:06] ==================== [PASSED] ttm_pool =====================
[20:00:06] ================ ttm_resource (8 subtests) =================
[20:00:06] ================= ttm_resource_init_basic  =================
[20:00:06] [PASSED] Init resource in TTM_PL_SYSTEM
[20:00:06] [PASSED] Init resource in TTM_PL_VRAM
[20:00:06] [PASSED] Init resource in a private placement
[20:00:06] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[20:00:06] ============= [PASSED] ttm_resource_init_basic =============
[20:00:06] [PASSED] ttm_resource_init_pinned
[20:00:06] [PASSED] ttm_resource_fini_basic
[20:00:06] [PASSED] ttm_resource_manager_init_basic
[20:00:06] [PASSED] ttm_resource_manager_usage_basic
[20:00:06] [PASSED] ttm_resource_manager_set_used_basic
[20:00:06] [PASSED] ttm_sys_man_alloc_basic
[20:00:06] [PASSED] ttm_sys_man_free_basic
[20:00:06] ================== [PASSED] ttm_resource ===================
[20:00:06] =================== ttm_tt (15 subtests) ===================
[20:00:06] ==================== ttm_tt_init_basic  ====================
[20:00:06] [PASSED] Page-aligned size
[20:00:06] [PASSED] Extra pages requested
[20:00:06] ================ [PASSED] ttm_tt_init_basic ================
[20:00:06] [PASSED] ttm_tt_init_misaligned
[20:00:06] [PASSED] ttm_tt_fini_basic
[20:00:06] [PASSED] ttm_tt_fini_sg
[20:00:06] [PASSED] ttm_tt_fini_shmem
[20:00:06] [PASSED] ttm_tt_create_basic
[20:00:06] [PASSED] ttm_tt_create_invalid_bo_type
[20:00:06] [PASSED] ttm_tt_create_ttm_exists
[20:00:06] [PASSED] ttm_tt_create_failed
[20:00:06] [PASSED] ttm_tt_destroy_basic
[20:00:06] [PASSED] ttm_tt_populate_null_ttm
[20:00:06] [PASSED] ttm_tt_populate_populated_ttm
[20:00:06] [PASSED] ttm_tt_unpopulate_basic
[20:00:06] [PASSED] ttm_tt_unpopulate_empty_ttm
[20:00:06] [PASSED] ttm_tt_swapin_basic
[20:00:06] ===================== [PASSED] ttm_tt ======================
[20:00:06] =================== ttm_bo (14 subtests) ===================
[20:00:06] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[20:00:06] [PASSED] Cannot be interrupted and sleeps
[20:00:06] [PASSED] Cannot be interrupted, locks straight away
[20:00:06] [PASSED] Can be interrupted, sleeps
[20:00:06] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[20:00:06] [PASSED] ttm_bo_reserve_locked_no_sleep
[20:00:06] [PASSED] ttm_bo_reserve_no_wait_ticket
[20:00:06] [PASSED] ttm_bo_reserve_double_resv
[20:00:06] [PASSED] ttm_bo_reserve_interrupted
[20:00:06] [PASSED] ttm_bo_reserve_deadlock
[20:00:06] [PASSED] ttm_bo_unreserve_basic
[20:00:06] [PASSED] ttm_bo_unreserve_pinned
[20:00:06] [PASSED] ttm_bo_unreserve_bulk
[20:00:06] [PASSED] ttm_bo_put_basic
[20:00:06] [PASSED] ttm_bo_put_shared_resv
[20:00:06] [PASSED] ttm_bo_pin_basic
[20:00:06] [PASSED] ttm_bo_pin_unpin_resource
[20:00:06] [PASSED] ttm_bo_multiple_pin_one_unpin
[20:00:06] ===================== [PASSED] ttm_bo ======================
[20:00:06] ============== ttm_bo_validate (22 subtests) ===============
[20:00:06] ============== ttm_bo_init_reserved_sys_man  ===============
[20:00:06] [PASSED] Buffer object for userspace
[20:00:06] [PASSED] Kernel buffer object
[20:00:06] [PASSED] Shared buffer object
[20:00:06] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[20:00:06] ============== ttm_bo_init_reserved_mock_man  ==============
[20:00:06] [PASSED] Buffer object for userspace
[20:00:06] [PASSED] Kernel buffer object
[20:00:06] [PASSED] Shared buffer object
[20:00:06] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[20:00:06] [PASSED] ttm_bo_init_reserved_resv
[20:00:06] ================== ttm_bo_validate_basic  ==================
[20:00:06] [PASSED] Buffer object for userspace
[20:00:06] [PASSED] Kernel buffer object
[20:00:06] [PASSED] Shared buffer object
[20:00:06] ============== [PASSED] ttm_bo_validate_basic ==============
[20:00:06] [PASSED] ttm_bo_validate_invalid_placement
[20:00:06] ============= ttm_bo_validate_same_placement  ==============
[20:00:06] [PASSED] System manager
[20:00:06] [PASSED] VRAM manager
[20:00:06] ========= [PASSED] ttm_bo_validate_same_placement ==========
[20:00:06] [PASSED] ttm_bo_validate_failed_alloc
[20:00:06] [PASSED] ttm_bo_validate_pinned
[20:00:06] [PASSED] ttm_bo_validate_busy_placement
[20:00:06] ================ ttm_bo_validate_multihop  =================
[20:00:06] [PASSED] Buffer object for userspace
[20:00:06] [PASSED] Kernel buffer object
[20:00:06] [PASSED] Shared buffer object
[20:00:06] ============ [PASSED] ttm_bo_validate_multihop =============
[20:00:06] ========== ttm_bo_validate_no_placement_signaled  ==========
[20:00:06] [PASSED] Buffer object in system domain, no page vector
[20:00:06] [PASSED] Buffer object in system domain with an existing page vector
[20:00:06] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[20:00:06] ======== ttm_bo_validate_no_placement_not_signaled  ========
[20:00:06] [PASSED] Buffer object for userspace
[20:00:06] [PASSED] Kernel buffer object
[20:00:06] [PASSED] Shared buffer object
[20:00:06] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[20:00:06] [PASSED] ttm_bo_validate_move_fence_signaled
[20:00:06] ========= ttm_bo_validate_move_fence_not_signaled  =========
[20:00:06] [PASSED] Waits for GPU
[20:00:06] [PASSED] Tries to lock straight away
[20:00:06] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[20:00:06] [PASSED] ttm_bo_validate_swapout
[20:00:06] [PASSED] ttm_bo_validate_happy_evict
[20:00:06] [PASSED] ttm_bo_validate_all_pinned_evict
[20:00:06] [PASSED] ttm_bo_validate_allowed_only_evict
[20:00:06] [PASSED] ttm_bo_validate_deleted_evict
[20:00:06] [PASSED] ttm_bo_validate_busy_domain_evict
[20:00:06] [PASSED] ttm_bo_validate_evict_gutting
[20:00:06] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[20:00:06] ================= [PASSED] ttm_bo_validate =================
[20:00:06] ============================================================
[20:00:06] Testing complete. Ran 102 tests: passed: 102
[20:00:06] Elapsed time: 11.255s total, 1.719s configuring, 8.863s building, 0.582s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


