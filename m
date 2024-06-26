Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A1CC30653
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 09:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C9E10E807;
	Wed, 26 Jun 2024 09:27:02 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A1810E807;
 Wed, 26 Jun 2024 09:27:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/vf=3A_Track_writes_to_i?=
 =?utf-8?q?naccessible_registers_from_VF_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jun 2024 09:27:01 -0000
Message-ID: <171939402119.159665.4702437899025074790@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626084304.1345-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240626084304.1345-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/vf: Track writes to inaccessible registers from VF (rev2)
URL   : https://patchwork.freedesktop.org/series/135295/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[09:25:53] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:25:57] Building KUnit Kernel ...
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

[09:26:22] Starting KUnit Kernel (1/1)...
[09:26:22] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[09:26:22] =================== guc_dbm (7 subtests) ===================
[09:26:22] [PASSED] test_empty
[09:26:22] [PASSED] test_default
[09:26:22] ======================== test_size  ========================
[09:26:22] [PASSED] 4
[09:26:22] [PASSED] 8
[09:26:22] [PASSED] 32
[09:26:22] [PASSED] 256
[09:26:22] ==================== [PASSED] test_size ====================
[09:26:22] ======================= test_reuse  ========================
[09:26:22] [PASSED] 4
[09:26:22] [PASSED] 8
[09:26:22] [PASSED] 32
[09:26:22] [PASSED] 256
[09:26:22] =================== [PASSED] test_reuse ====================
[09:26:22] =================== test_range_overlap  ====================
[09:26:22] [PASSED] 4
[09:26:22] [PASSED] 8
[09:26:22] [PASSED] 32
[09:26:22] [PASSED] 256
[09:26:22] =============== [PASSED] test_range_overlap ================
[09:26:22] =================== test_range_compact  ====================
[09:26:22] [PASSED] 4
[09:26:22] [PASSED] 8
[09:26:22] [PASSED] 32
[09:26:22] [PASSED] 256
[09:26:22] =============== [PASSED] test_range_compact ================
[09:26:22] ==================== test_range_spare  =====================
[09:26:22] [PASSED] 4
[09:26:22] [PASSED] 8
[09:26:22] [PASSED] 32
[09:26:22] [PASSED] 256
[09:26:22] ================ [PASSED] test_range_spare =================
[09:26:22] ===================== [PASSED] guc_dbm =====================
[09:26:22] =================== guc_idm (6 subtests) ===================
[09:26:22] [PASSED] bad_init
[09:26:22] [PASSED] no_init
[09:26:22] [PASSED] init_fini
[09:26:22] [PASSED] check_used
[09:26:22] [PASSED] check_quota
[09:26:22] [PASSED] check_all
[09:26:22] ===================== [PASSED] guc_idm =====================
[09:26:22] ================== no_relay (3 subtests) ===================
[09:26:22] [PASSED] xe_drops_guc2pf_if_not_ready
[09:26:22] [PASSED] xe_drops_guc2vf_if_not_ready
[09:26:22] [PASSED] xe_rejects_send_if_not_ready
[09:26:22] ==================== [PASSED] no_relay =====================
[09:26:22] ================== pf_relay (14 subtests) ==================
[09:26:22] [PASSED] pf_rejects_guc2pf_too_short
[09:26:22] [PASSED] pf_rejects_guc2pf_too_long
[09:26:22] [PASSED] pf_rejects_guc2pf_no_payload
[09:26:22] [PASSED] pf_fails_no_payload
[09:26:22] [PASSED] pf_fails_bad_origin
[09:26:22] [PASSED] pf_fails_bad_type
[09:26:22] [PASSED] pf_txn_reports_error
[09:26:22] [PASSED] pf_txn_sends_pf2guc
[09:26:22] [PASSED] pf_sends_pf2guc
[09:26:22] [SKIPPED] pf_loopback_nop
[09:26:22] [SKIPPED] pf_loopback_echo
[09:26:22] [SKIPPED] pf_loopback_fail
[09:26:22] [SKIPPED] pf_loopback_busy
[09:26:22] [SKIPPED] pf_loopback_retry
[09:26:22] ==================== [PASSED] pf_relay =====================
[09:26:22] ================== vf_relay (3 subtests) ===================
[09:26:22] [PASSED] vf_rejects_guc2vf_too_short
[09:26:22] [PASSED] vf_rejects_guc2vf_too_long
[09:26:22] [PASSED] vf_rejects_guc2vf_no_payload
[09:26:22] ==================== [PASSED] vf_relay =====================
[09:26:22] ================= pf_service (11 subtests) =================
[09:26:22] [PASSED] pf_negotiate_any
[09:26:22] [PASSED] pf_negotiate_base_match
[09:26:22] [PASSED] pf_negotiate_base_newer
[09:26:22] [PASSED] pf_negotiate_base_next
[09:26:22] [SKIPPED] pf_negotiate_base_older
[09:26:22] [PASSED] pf_negotiate_base_prev
[09:26:22] [PASSED] pf_negotiate_latest_match
[09:26:22] [PASSED] pf_negotiate_latest_newer
[09:26:22] [PASSED] pf_negotiate_latest_next
[09:26:22] [SKIPPED] pf_negotiate_latest_older
[09:26:22] [SKIPPED] pf_negotiate_latest_prev
[09:26:22] =================== [PASSED] pf_service ====================
[09:26:22] ===================== lmtt (1 subtest) =====================
[09:26:22] ======================== test_ops  =========================
[09:26:22] [PASSED] 2-level
[09:26:22] [PASSED] multi-level
[09:26:22] ==================== [PASSED] test_ops =====================
[09:26:22] ====================== [PASSED] lmtt =======================
[09:26:22] ==================== xe_bo (2 subtests) ====================
[09:26:22] [SKIPPED] xe_ccs_migrate_kunit
[09:26:22] [SKIPPED] xe_bo_evict_kunit
[09:26:22] ===================== [SKIPPED] xe_bo ======================
[09:26:22] ================== xe_dma_buf (1 subtest) ==================
[09:26:22] [SKIPPED] xe_dma_buf_kunit
[09:26:22] =================== [SKIPPED] xe_dma_buf ===================
[09:26:22] ================== xe_migrate (1 subtest) ==================
[09:26:22] [SKIPPED] xe_migrate_sanity_kunit
[09:26:22] =================== [SKIPPED] xe_migrate ===================
[09:26:22] =================== xe_mocs (2 subtests) ===================
[09:26:22] [SKIPPED] xe_live_mocs_kernel_kunit
[09:26:22] [SKIPPED] xe_live_mocs_reset_kunit
[09:26:22] ==================== [SKIPPED] xe_mocs =====================
[09:26:22] ==================== args (11 subtests) ====================
[09:26:22] [PASSED] count_args_test
[09:26:22] [PASSED] call_args_example
[09:26:22] [PASSED] call_args_test
[09:26:22] [PASSED] drop_first_arg_example
[09:26:22] [PASSED] drop_first_arg_test
[09:26:22] [PASSED] first_arg_example
[09:26:22] [PASSED] first_arg_test
[09:26:22] [PASSED] last_arg_example
[09:26:22] [PASSED] last_arg_test
[09:26:22] [PASSED] pick_arg_example
[09:26:22] [PASSED] sep_comma_example
[09:26:22] ====================== [PASSED] args =======================
[09:26:22] =================== xe_pci (2 subtests) ====================
[09:26:22] [PASSED] xe_gmdid_graphics_ip
[09:26:22] [PASSED] xe_gmdid_media_ip
[09:26:22] ===================== [PASSED] xe_pci ======================
[09:26:22] ==================== xe_rtp (1 subtest) ====================
[09:26:22] ================== xe_rtp_process_tests  ===================
[09:26:22] [PASSED] coalesce-same-reg
[09:26:22] [PASSED] no-match-no-add
[09:26:22] [PASSED] match-or
[09:26:22] [PASSED] match-or-xfail
[09:26:22] [PASSED] no-match-no-add-multiple-rules
[09:26:22] [PASSED] two-regs-two-entries
[09:26:22] [PASSED] clr-one-set-other
[09:26:22] [PASSED] set-field
[09:26:22] [PASSED] conflict-duplicate
[09:26:22] [PASSED] conflict-not-disjoint
[09:26:22] [PASSED] conflict-reg-type
stty: 'standard input': Inappropriate ioctl for device
[09:26:22] ============== [PASSED] xe_rtp_process_tests ===============
[09:26:22] ===================== [PASSED] xe_rtp ======================
[09:26:22] ==================== xe_wa (1 subtest) =====================
[09:26:22] ======================== xe_wa_gt  =========================
[09:26:22] [PASSED] TIGERLAKE (B0)
[09:26:22] [PASSED] DG1 (A0)
[09:26:22] [PASSED] DG1 (B0)
[09:26:22] [PASSED] ALDERLAKE_S (A0)
[09:26:22] [PASSED] ALDERLAKE_S (B0)
[09:26:22] [PASSED] ALDERLAKE_S (C0)
[09:26:22] [PASSED] ALDERLAKE_S (D0)
[09:26:22] [PASSED] ALDERLAKE_P (A0)
[09:26:22] [PASSED] ALDERLAKE_P (B0)
[09:26:22] [PASSED] ALDERLAKE_P (C0)
[09:26:22] [PASSED] ALDERLAKE_S_RPLS (D0)
[09:26:22] [PASSED] ALDERLAKE_P_RPLU (E0)
[09:26:22] [PASSED] DG2_G10 (C0)
[09:26:22] [PASSED] DG2_G11 (B1)
[09:26:22] [PASSED] DG2_G12 (A1)
[09:26:22] [PASSED] METEORLAKE (g:A0, m:A0)
[09:26:22] [PASSED] METEORLAKE (g:A0, m:A0)
[09:26:22] [PASSED] METEORLAKE (g:A0, m:A0)
[09:26:22] [PASSED] LUNARLAKE (g:A0, m:A0)
[09:26:22] [PASSED] LUNARLAKE (g:B0, m:A0)
[09:26:22] ==================== [PASSED] xe_wa_gt =====================
[09:26:22] ====================== [PASSED] xe_wa ======================
[09:26:22] ============================================================
[09:26:22] Testing complete. Ran 111 tests: passed: 97, skipped: 14
[09:26:22] Elapsed time: 29.830s total, 4.294s configuring, 25.259s building, 0.233s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[09:26:23] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:26:24] Building KUnit Kernel ...
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

[09:26:46] Starting KUnit Kernel (1/1)...
[09:26:46] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[09:26:46] ============ drm_test_pick_cmdline (2 subtests) ============
[09:26:46] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[09:26:46] =============== drm_test_pick_cmdline_named  ===============
[09:26:46] [PASSED] NTSC
[09:26:46] [PASSED] NTSC-J
[09:26:46] [PASSED] PAL
[09:26:46] [PASSED] PAL-M
[09:26:46] =========== [PASSED] drm_test_pick_cmdline_named ===========
[09:26:46] ============== [PASSED] drm_test_pick_cmdline ==============
[09:26:46] ================== drm_buddy (7 subtests) ==================
[09:26:46] [PASSED] drm_test_buddy_alloc_limit
[09:26:46] [PASSED] drm_test_buddy_alloc_optimistic
[09:26:46] [PASSED] drm_test_buddy_alloc_pessimistic
[09:26:46] [PASSED] drm_test_buddy_alloc_pathological
[09:26:46] [PASSED] drm_test_buddy_alloc_contiguous
[09:26:46] [PASSED] drm_test_buddy_alloc_clear
[09:26:46] [PASSED] drm_test_buddy_alloc_range_bias
[09:26:46] ==================== [PASSED] drm_buddy ====================
[09:26:46] ============= drm_cmdline_parser (40 subtests) =============
[09:26:46] [PASSED] drm_test_cmdline_force_d_only
[09:26:46] [PASSED] drm_test_cmdline_force_D_only_dvi
[09:26:46] [PASSED] drm_test_cmdline_force_D_only_hdmi
[09:26:46] [PASSED] drm_test_cmdline_force_D_only_not_digital
[09:26:46] [PASSED] drm_test_cmdline_force_e_only
[09:26:46] [PASSED] drm_test_cmdline_res
[09:26:46] [PASSED] drm_test_cmdline_res_vesa
[09:26:46] [PASSED] drm_test_cmdline_res_vesa_rblank
[09:26:46] [PASSED] drm_test_cmdline_res_rblank
[09:26:46] [PASSED] drm_test_cmdline_res_bpp
[09:26:46] [PASSED] drm_test_cmdline_res_refresh
[09:26:46] [PASSED] drm_test_cmdline_res_bpp_refresh
[09:26:46] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[09:26:46] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[09:26:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[09:26:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[09:26:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[09:26:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[09:26:46] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[09:26:46] [PASSED] drm_test_cmdline_res_margins_force_on
[09:26:46] [PASSED] drm_test_cmdline_res_vesa_margins
[09:26:46] [PASSED] drm_test_cmdline_name
[09:26:46] [PASSED] drm_test_cmdline_name_bpp
[09:26:46] [PASSED] drm_test_cmdline_name_option
[09:26:46] [PASSED] drm_test_cmdline_name_bpp_option
[09:26:46] [PASSED] drm_test_cmdline_rotate_0
[09:26:46] [PASSED] drm_test_cmdline_rotate_90
[09:26:46] [PASSED] drm_test_cmdline_rotate_180
[09:26:46] [PASSED] drm_test_cmdline_rotate_270
[09:26:46] [PASSED] drm_test_cmdline_hmirror
[09:26:46] [PASSED] drm_test_cmdline_vmirror
[09:26:46] [PASSED] drm_test_cmdline_margin_options
[09:26:46] [PASSED] drm_test_cmdline_multiple_options
[09:26:46] [PASSED] drm_test_cmdline_bpp_extra_and_option
[09:26:46] [PASSED] drm_test_cmdline_extra_and_option
[09:26:46] [PASSED] drm_test_cmdline_freestanding_options
[09:26:46] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[09:26:46] [PASSED] drm_test_cmdline_panel_orientation
[09:26:46] ================ drm_test_cmdline_invalid  =================
[09:26:46] [PASSED] margin_only
[09:26:46] [PASSED] interlace_only
[09:26:46] [PASSED] res_missing_x
[09:26:46] [PASSED] res_missing_y
[09:26:46] [PASSED] res_bad_y
[09:26:46] [PASSED] res_missing_y_bpp
[09:26:46] [PASSED] res_bad_bpp
[09:26:46] [PASSED] res_bad_refresh
[09:26:46] [PASSED] res_bpp_refresh_force_on_off
[09:26:46] [PASSED] res_invalid_mode
[09:26:46] [PASSED] res_bpp_wrong_place_mode
[09:26:46] [PASSED] name_bpp_refresh
[09:26:46] [PASSED] name_refresh
[09:26:46] [PASSED] name_refresh_wrong_mode
[09:26:46] [PASSED] name_refresh_invalid_mode
[09:26:46] [PASSED] rotate_multiple
[09:26:46] [PASSED] rotate_invalid_val
[09:26:46] [PASSED] rotate_truncated
[09:26:46] [PASSED] invalid_option
[09:26:46] [PASSED] invalid_tv_option
[09:26:46] [PASSED] truncated_tv_option
[09:26:46] ============ [PASSED] drm_test_cmdline_invalid =============
[09:26:46] =============== drm_test_cmdline_tv_options  ===============
[09:26:46] [PASSED] NTSC
[09:26:46] [PASSED] NTSC_443
[09:26:46] [PASSED] NTSC_J
[09:26:46] [PASSED] PAL
[09:26:46] [PASSED] PAL_M
[09:26:46] [PASSED] PAL_N
[09:26:46] [PASSED] SECAM
[09:26:46] =========== [PASSED] drm_test_cmdline_tv_options ===========
[09:26:46] =============== [PASSED] drm_cmdline_parser ================
[09:26:46] ========== drmm_connector_hdmi_init (19 subtests) ==========
[09:26:46] [PASSED] drm_test_connector_hdmi_init_valid
[09:26:46] [PASSED] drm_test_connector_hdmi_init_bpc_8
[09:26:46] [PASSED] drm_test_connector_hdmi_init_bpc_10
[09:26:46] [PASSED] drm_test_connector_hdmi_init_bpc_12
[09:26:46] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[09:26:46] [PASSED] drm_test_connector_hdmi_init_bpc_null
[09:26:46] [PASSED] drm_test_connector_hdmi_init_formats_empty
[09:26:46] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[09:26:46] [PASSED] drm_test_connector_hdmi_init_null_ddc
[09:26:46] [PASSED] drm_test_connector_hdmi_init_null_product
[09:26:46] [PASSED] drm_test_connector_hdmi_init_null_vendor
[09:26:46] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[09:26:46] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[09:26:46] [PASSED] drm_test_connector_hdmi_init_product_valid
[09:26:46] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[09:26:46] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[09:26:46] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[09:26:46] ========= drm_test_connector_hdmi_init_type_valid  =========
[09:26:46] [PASSED] HDMI-A
[09:26:46] [PASSED] HDMI-B
[09:26:46] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[09:26:46] ======== drm_test_connector_hdmi_init_type_invalid  ========
[09:26:46] [PASSED] Unknown
[09:26:46] [PASSED] VGA
[09:26:46] [PASSED] DVI-I
[09:26:46] [PASSED] DVI-D
[09:26:46] [PASSED] DVI-A
[09:26:46] [PASSED] Composite
[09:26:46] [PASSED] SVIDEO
[09:26:46] [PASSED] LVDS
[09:26:46] [PASSED] Component
[09:26:46] [PASSED] DIN
[09:26:46] [PASSED] DP
[09:26:46] [PASSED] TV
[09:26:46] [PASSED] eDP
[09:26:46] [PASSED] Virtual
[09:26:46] [PASSED] DSI
[09:26:46] [PASSED] DPI
[09:26:46] [PASSED] Writeback
[09:26:46] [PASSED] SPI
[09:26:46] [PASSED] USB
[09:26:46] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[09:26:46] ============ [PASSED] drmm_connector_hdmi_init =============
[09:26:46] ============= drmm_connector_init (3 subtests) =============
[09:26:46] [PASSED] drm_test_drmm_connector_init
[09:26:46] [PASSED] drm_test_drmm_connector_init_null_ddc
[09:26:46] ========= drm_test_drmm_connector_init_type_valid  =========
[09:26:46] [PASSED] Unknown
[09:26:46] [PASSED] VGA
[09:26:46] [PASSED] DVI-I
[09:26:46] [PASSED] DVI-D
[09:26:46] [PASSED] DVI-A
[09:26:46] [PASSED] Composite
[09:26:46] [PASSED] SVIDEO
[09:26:46] [PASSED] LVDS
[09:26:46] [PASSED] Component
[09:26:46] [PASSED] DIN
[09:26:46] [PASSED] DP
[09:26:46] [PASSED] HDMI-A
[09:26:46] [PASSED] HDMI-B
[09:26:46] [PASSED] TV
[09:26:46] [PASSED] eDP
[09:26:46] [PASSED] Virtual
[09:26:46] [PASSED] DSI
[09:26:46] [PASSED] DPI
[09:26:46] [PASSED] Writeback
[09:26:46] [PASSED] SPI
[09:26:46] [PASSED] USB
[09:26:46] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[09:26:46] =============== [PASSED] drmm_connector_init ===============
[09:26:46] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[09:26:46] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[09:26:46] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[09:26:46] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[09:26:46] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[09:26:46] ========== drm_test_get_tv_mode_from_name_valid  ===========
[09:26:46] [PASSED] NTSC
[09:26:46] [PASSED] NTSC-443
[09:26:46] [PASSED] NTSC-J
[09:26:46] [PASSED] PAL
[09:26:46] [PASSED] PAL-M
[09:26:46] [PASSED] PAL-N
[09:26:46] [PASSED] SECAM
[09:26:46] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[09:26:46] [PASSED] drm_test_get_tv_mode_from_name_truncated
[09:26:46] ============ [PASSED] drm_get_tv_mode_from_name ============
[09:26:46] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[09:26:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[09:26:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[09:26:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[09:26:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[09:26:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[09:26:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[09:26:46] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[09:26:46] [PASSED] VIC 96
[09:26:46] [PASSED] VIC 97
[09:26:46] [PASSED] VIC 101
[09:26:46] [PASSED] VIC 102
[09:26:46] [PASSED] VIC 106
[09:26:46] [PASSED] VIC 107
[09:26:46] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[09:26:46] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[09:26:46] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[09:26:46] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[09:26:46] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[09:26:46] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[09:26:46] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[09:26:46] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[09:26:46] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[09:26:46] [PASSED] Automatic
[09:26:46] [PASSED] Full
[09:26:46] [PASSED] Limited 16:235
[09:26:46] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[09:26:46] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[09:26:46] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[09:26:46] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[09:26:46] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[09:26:46] [PASSED] RGB
[09:26:46] [PASSED] YUV 4:2:0
[09:26:46] [PASSED] YUV 4:2:2
[09:26:46] [PASSED] YUV 4:4:4
[09:26:46] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[09:26:46] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[09:26:46] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[09:26:46] ============= drm_damage_helper (21 subtests) ==============
[09:26:46] [PASSED] drm_test_damage_iter_no_damage
[09:26:46] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[09:26:46] [PASSED] drm_test_damage_iter_no_damage_src_moved
[09:26:46] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[09:26:46] [PASSED] drm_test_damage_iter_no_damage_not_visible
[09:26:46] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[09:26:46] [PASSED] drm_test_damage_iter_no_damage_no_fb
[09:26:46] [PASSED] drm_test_damage_iter_simple_damage
[09:26:46] [PASSED] drm_test_damage_iter_single_damage
[09:26:46] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[09:26:46] [PASSED] drm_test_damage_iter_single_damage_outside_src
[09:26:46] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[09:26:46] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[09:26:46] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[09:26:46] [PASSED] drm_test_damage_iter_single_damage_src_moved
[09:26:46] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[09:26:46] [PASSED] drm_test_damage_iter_damage
[09:26:46] [PASSED] drm_test_damage_iter_damage_one_intersect
[09:26:46] [PASSED] drm_test_damage_iter_damage_one_outside
[09:26:46] [PASSED] drm_test_damage_iter_damage_src_moved
[09:26:46] [PASSED] drm_test_damage_iter_damage_not_visible
[09:26:46] ================ [PASSED] drm_damage_helper ================
[09:26:46] ============== drm_dp_mst_helper (3 subtests) ==============
[09:26:46] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[09:26:46] [PASSED] Clock 154000 BPP 30 DSC disabled
[09:26:46] [PASSED] Clock 234000 BPP 30 DSC disabled
[09:26:46] [PASSED] Clock 297000 BPP 24 DSC disabled
[09:26:46] [PASSED] Clock 332880 BPP 24 DSC enabled
[09:26:46] [PASSED] Clock 324540 BPP 24 DSC enabled
[09:26:46] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[09:26:46] ============== drm_test_dp_mst_calc_pbn_div  ===============
[09:26:46] [PASSED] Link rate 2000000 lane count 4
[09:26:46] [PASSED] Link rate 2000000 lane count 2
[09:26:46] [PASSED] Link rate 2000000 lane count 1
[09:26:46] [PASSED] Link rate 1350000 lane count 4
[09:26:46] [PASSED] Link rate 1350000 lane count 2
[09:26:46] [PASSED] Link rate 1350000 lane count 1
[09:26:46] [PASSED] Link rate 1000000 lane count 4
[09:26:46] [PASSED] Link rate 1000000 lane count 2
[09:26:46] [PASSED] Link rate 1000000 lane count 1
[09:26:46] [PASSED] Link rate 810000 lane count 4
[09:26:46] [PASSED] Link rate 810000 lane count 2
[09:26:46] [PASSED] Link rate 810000 lane count 1
[09:26:46] [PASSED] Link rate 540000 lane count 4
[09:26:46] [PASSED] Link rate 540000 lane count 2
[09:26:46] [PASSED] Link rate 540000 lane count 1
[09:26:46] [PASSED] Link rate 270000 lane count 4
[09:26:46] [PASSED] Link rate 270000 lane count 2
[09:26:46] [PASSED] Link rate 270000 lane count 1
[09:26:46] [PASSED] Link rate 162000 lane count 4
[09:26:46] [PASSED] Link rate 162000 lane count 2
[09:26:46] [PASSED] Link rate 162000 lane count 1
[09:26:46] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[09:26:46] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[09:26:46] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[09:26:46] [PASSED] DP_POWER_UP_PHY with port number
[09:26:46] [PASSED] DP_POWER_DOWN_PHY with port number
[09:26:46] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[09:26:46] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[09:26:46] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[09:26:46] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[09:26:46] [PASSED] DP_QUERY_PAYLOAD with port number
[09:26:46] [PASSED] DP_QUERY_PAYLOAD with VCPI
[09:26:46] [PASSED] DP_REMOTE_DPCD_READ with port number
[09:26:46] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[09:26:46] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[09:26:46] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[09:26:46] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[09:26:46] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[09:26:46] [PASSED] DP_REMOTE_I2C_READ with port number
[09:26:46] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[09:26:46] [PASSED] DP_REMOTE_I2C_READ with transactions array
[09:26:46] [PASSED] DP_REMOTE_I2C_WRITE with port number
[09:26:46] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[09:26:46] [PASSED] DP_REMOTE_I2C_WRITE with data array
[09:26:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[09:26:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[09:26:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[09:26:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[09:26:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[09:26:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[09:26:46] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[09:26:46] ================ [PASSED] drm_dp_mst_helper ================
[09:26:46] ================== drm_exec (7 subtests) ===================
[09:26:46] [PASSED] sanitycheck
[09:26:46] [PASSED] test_lock
[09:26:46] [PASSED] test_lock_unlock
[09:26:46] [PASSED] test_duplicates
[09:26:46] [PASSED] test_prepare
[09:26:46] [PASSED] test_prepare_array
[09:26:46] [PASSED] test_multiple_loops
[09:26:46] ==================== [PASSED] drm_exec =====================
[09:26:46] =========== drm_format_helper_test (17 subtests) ===========
[09:26:46] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[09:26:46] [PASSED] single_pixel_source_buffer
[09:26:46] [PASSED] single_pixel_clip_rectangle
[09:26:46] [PASSED] well_known_colors
[09:26:46] [PASSED] destination_pitch
[09:26:46] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[09:26:46] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[09:26:46] [PASSED] single_pixel_source_buffer
[09:26:46] [PASSED] single_pixel_clip_rectangle
[09:26:46] [PASSED] well_known_colors
[09:26:46] [PASSED] destination_pitch
[09:26:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[09:26:46] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[09:26:46] [PASSED] single_pixel_source_buffer
[09:26:46] [PASSED] single_pixel_clip_rectangle
[09:26:46] [PASSED] well_known_colors
[09:26:46] [PASSED] destination_pitch
[09:26:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[09:26:46] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[09:26:46] [PASSED] single_pixel_source_buffer
[09:26:46] [PASSED] single_pixel_clip_rectangle
[09:26:46] [PASSED] well_known_colors
[09:26:46] [PASSED] destination_pitch
[09:26:46] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[09:26:46] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[09:26:46] [PASSED] single_pixel_source_buffer
[09:26:46] [PASSED] single_pixel_clip_rectangle
[09:26:46] [PASSED] well_known_colors
[09:26:46] [PASSED] destination_pitch
[09:26:46] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[09:26:46] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[09:26:46] [PASSED] single_pixel_source_buffer
[09:26:46] [PASSED] single_pixel_clip_rectangle
[09:26:46] [PASSED] well_known_colors
[09:26:46] [PASSED] destination_pitch
[09:26:46] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[09:26:46] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[09:26:46] [PASSED] single_pixel_source_buffer
[09:26:46] [PASSED] single_pixel_clip_rectangle
[09:26:46] [PASSED] well_known_colors
[09:26:46] [PASSED] destination_pitch
[09:26:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[09:26:46] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[09:26:46] [PASSED] single_pixel_source_buffer
[09:26:46] [PASSED] single_pixel_clip_rectangle
[09:26:46] [PASSED] well_known_colors
[09:26:46] [PASSED] destination_pitch
[09:26:46] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[09:26:46] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[09:26:46] [PASSED] single_pixel_source_buffer
[09:26:46] [PASSED] single_pixel_clip_rectangle
[09:26:46] [PASSED] well_known_colors
[09:26:46] [PASSED] destination_pitch
[09:26:46] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[09:26:46] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[09:26:46] [PASSED] single_pixel_source_buffer
[09:26:46] [PASSED] single_pixel_clip_rectangle
[09:26:46] [PASSED] well_known_colors
[09:26:46] [PASSED] destination_pitch
[09:26:46] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[09:26:46] ============== drm_test_fb_xrgb8888_to_mono  ===============
[09:26:46] [PASSED] single_pixel_source_buffer
[09:26:46] [PASSED] single_pixel_clip_rectangle
[09:26:46] [PASSED] well_known_colors
[09:26:46] [PASSED] destination_pitch
[09:26:46] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[09:26:46] ==================== drm_test_fb_swab  =====================
[09:26:46] [PASSED] single_pixel_source_buffer
[09:26:46] [PASSED] single_pixel_clip_rectangle
[09:26:46] [PASSED] well_known_colors
[09:26:46] [PASSED] destination_pitch
[09:26:46] ================ [PASSED] drm_test_fb_swab =================
[09:26:46] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[09:26:46] [PASSED] single_pixel_source_buffer
[09:26:46] [PASSED] single_pixel_clip_rectangle
[09:26:46] [PASSED] well_known_colors
[09:26:46] [PASSED] destination_pitch
[09:26:46] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[09:26:46] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[09:26:46] [PASSED] single_pixel_source_buffer
[09:26:46] [PASSED] single_pixel_clip_rectangle
[09:26:46] [PASSED] well_known_colors
[09:26:46] [PASSED] destination_pitch
[09:26:46] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[09:26:46] ================= drm_test_fb_clip_offset  =================
[09:26:46] [PASSED] pass through
[09:26:46] [PASSED] horizontal offset
[09:26:46] [PASSED] vertical offset
[09:26:46] [PASSED] horizontal and vertical offset
[09:26:46] [PASSED] horizontal offset (custom pitch)
[09:26:46] [PASSED] vertical offset (custom pitch)
[09:26:46] [PASSED] horizontal and vertical offset (custom pitch)
[09:26:46] ============= [PASSED] drm_test_fb_clip_offset =============
[09:26:46] ============== drm_test_fb_build_fourcc_list  ==============
[09:26:46] [PASSED] no native formats
[09:26:46] [PASSED] XRGB8888 as native format
[09:26:46] [PASSED] remove duplicates
[09:26:46] [PASSED] convert alpha formats
[09:26:46] [PASSED] random formats
[09:26:46] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[09:26:46] =================== drm_test_fb_memcpy  ====================
[09:26:46] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[09:26:46] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[09:26:46] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[09:26:46] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[09:26:46] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[09:26:46] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[09:26:46] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[09:26:46] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[09:26:46] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[09:26:46] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[09:26:46] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[09:26:46] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[09:26:46] =============== [PASSED] drm_test_fb_memcpy ================
[09:26:46] ============= [PASSED] drm_format_helper_test ==============
[09:26:46] ================= drm_format (18 subtests) =================
[09:26:46] [PASSED] drm_test_format_block_width_invalid
[09:26:46] [PASSED] drm_test_format_block_width_one_plane
[09:26:46] [PASSED] drm_test_format_block_width_two_plane
[09:26:46] [PASSED] drm_test_format_block_width_three_plane
[09:26:46] [PASSED] drm_test_format_block_width_tiled
[09:26:46] [PASSED] drm_test_format_block_height_invalid
[09:26:46] [PASSED] drm_test_format_block_height_one_plane
[09:26:46] [PASSED] drm_test_format_block_height_two_plane
[09:26:46] [PASSED] drm_test_format_block_height_three_plane
[09:26:46] [PASSED] drm_test_format_block_height_tiled
[09:26:46] [PASSED] drm_test_format_min_pitch_invalid
[09:26:46] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[09:26:46] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[09:26:46] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[09:26:46] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[09:26:46] [PASSED] drm_test_format_min_pitch_two_plane
[09:26:46] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[09:26:46] [PASSED] drm_test_format_min_pitch_tiled
[09:26:46] =================== [PASSED] drm_format ====================
[09:26:46] =============== drm_framebuffer (1 subtest) ================
[09:26:46] =============== drm_test_framebuffer_create  ===============
[09:26:46] [PASSED] ABGR8888 normal sizes
[09:26:46] [PASSED] ABGR8888 max sizes
[09:26:46] [PASSED] ABGR8888 pitch greater than min required
[09:26:46] [PASSED] ABGR8888 pitch less than min required
[09:26:46] [PASSED] ABGR8888 Invalid width
[09:26:46] [PASSED] ABGR8888 Invalid buffer handle
[09:26:46] [PASSED] No pixel format
[09:26:46] [PASSED] ABGR8888 Width 0
[09:26:46] [PASSED] ABGR8888 Height 0
[09:26:46] [PASSED] ABGR8888 Out of bound height * pitch combination
[09:26:46] [PASSED] ABGR8888 Large buffer offset
[09:26:46] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[09:26:46] [PASSED] ABGR8888 Valid buffer modifier
[09:26:46] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[09:26:46] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[09:26:46] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[09:26:46] [PASSED] NV12 Normal sizes
[09:26:46] [PASSED] NV12 Max sizes
[09:26:46] [PASSED] NV12 Invalid pitch
[09:26:46] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[09:26:46] [PASSED] NV12 different  modifier per-plane
[09:26:46] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[09:26:46] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[09:26:46] [PASSED] NV12 Modifier for inexistent plane
[09:26:46] [PASSED] NV12 Handle for inexistent plane
[09:26:46] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[09:26:46] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[09:26:46] [PASSED] YVU420 Normal sizes
[09:26:46] [PASSED] YVU420 Max sizes
[09:26:46] [PASSED] YVU420 Invalid pitch
[09:26:46] [PASSED] YVU420 Different pitches
[09:26:46] [PASSED] YVU420 Different buffer offsets/pitches
[09:26:46] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[09:26:46] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[09:26:46] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[09:26:46] [PASSED] YVU420 Valid modifier
[09:26:46] [PASSED] YVU420 Different modifiers per plane
[09:26:46] [PASSED] YVU420 Modifier for inexistent plane
[09:26:46] [PASSED] X0L2 Normal sizes
[09:26:46] [PASSED] X0L2 Max sizes
[09:26:46] [PASSED] X0L2 Invalid pitch
[09:26:46] [PASSED] X0L2 Pitch greater than minimum required
[09:26:46] [PASSED] X0L2 Handle for inexistent plane
[09:26:46] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[09:26:46] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[09:26:46] [PASSED] X0L2 Valid modifier
[09:26:46] [PASSED] X0L2 Modifier for inexistent plane
[09:26:46] =========== [PASSED] drm_test_framebuffer_create ===========
[09:26:46] ================= [PASSED] drm_framebuffer =================
[09:26:46] ================ drm_gem_shmem (8 subtests) ================
[09:26:46] [PASSED] drm_gem_shmem_test_obj_create
[09:26:46] [PASSED] drm_gem_shmem_test_obj_create_private
[09:26:46] [PASSED] drm_gem_shmem_test_pin_pages
[09:26:46] [PASSED] drm_gem_shmem_test_vmap
[09:26:46] [PASSED] drm_gem_shmem_test_get_pages_sgt
[09:26:46] [PASSED] drm_gem_shmem_test_get_sg_table
[09:26:46] [PASSED] drm_gem_shmem_test_madvise
[09:26:46] [PASSED] drm_gem_shmem_test_purge
[09:26:46] ================== [PASSED] drm_gem_shmem ==================
[09:26:46] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[09:26:46] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[09:26:46] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[09:26:46] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[09:26:46] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[09:26:46] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[09:26:46] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[09:26:46] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[09:26:46] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[09:26:46] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[09:26:46] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[09:26:46] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[09:26:46] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[09:26:46] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[09:26:46] [PASSED] drm_test_check_output_bpc_dvi
[09:26:46] [PASSED] drm_test_check_output_bpc_format_vic_1
[09:26:46] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[09:26:46] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[09:26:46] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[09:26:46] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[09:26:46] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[09:26:46] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[09:26:46] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[09:26:46] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[09:26:46] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[09:26:46] [PASSED] drm_test_check_broadcast_rgb_value
[09:26:46] [PASSED] drm_test_check_bpc_8_value
[09:26:46] [PASSED] drm_test_check_bpc_10_value
[09:26:46] [PASSED] drm_test_check_bpc_12_value
[09:26:46] [PASSED] drm_test_check_format_value
[09:26:46] [PASSED] drm_test_check_tmds_char_value
[09:26:46] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[09:26:46] ================= drm_managed (2 subtests) =================
[09:26:46] [PASSED] drm_test_managed_release_action
[09:26:46] [PASSED] drm_test_managed_run_action
[09:26:46] =================== [PASSED] drm_managed ===================
[09:26:46] =================== drm_mm (6 subtests) ====================
[09:26:46] [PASSED] drm_test_mm_init
[09:26:46] [PASSED] drm_test_mm_debug
[09:26:46] [PASSED] drm_test_mm_align32
[09:26:46] [PASSED] drm_test_mm_align64
[09:26:46] [PASSED] drm_test_mm_lowest
[09:26:46] [PASSED] drm_test_mm_highest
[09:26:46] ===================== [PASSED] drm_mm ======================
[09:26:46] ============= drm_modes_analog_tv (4 subtests) =============
[09:26:46] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[09:26:46] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[09:26:46] [PASSED] drm_test_modes_analog_tv_pal_576i
[09:26:46] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[09:26:46] =============== [PASSED] drm_modes_analog_tv ===============
[09:26:46] ============== drm_plane_helper (2 subtests) ===============
[09:26:46] =============== drm_test_check_plane_state  ================
[09:26:46] [PASSED] clipping_simple
[09:26:46] [PASSED] clipping_rotate_reflect
[09:26:46] [PASSED] positioning_simple
[09:26:46] [PASSED] upscaling
[09:26:46] [PASSED] downscaling
[09:26:46] [PASSED] rounding1
[09:26:46] [PASSED] rounding2
[09:26:46] [PASSED] rounding3
[09:26:46] [PASSED] rounding4
[09:26:46] =========== [PASSED] drm_test_check_plane_state ============
[09:26:46] =========== drm_test_check_invalid_plane_state  ============
[09:26:46] [PASSED] positioning_invalid
[09:26:46] [PASSED] upscaling_invalid
[09:26:46] [PASSED] downscaling_invalid
[09:26:46] ======= [PASSED] drm_test_check_invalid_plane_state ========
[09:26:46] ================ [PASSED] drm_plane_helper =================
stty: 'standard input': Inappropriate ioctl for device
[09:26:46] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[09:26:46] ====== drm_test_connector_helper_tv_get_modes_check  =======
[09:26:46] [PASSED] None
[09:26:46] [PASSED] PAL
[09:26:46] [PASSED] NTSC
[09:26:46] [PASSED] Both, NTSC Default
[09:26:46] [PASSED] Both, PAL Default
[09:26:46] [PASSED] Both, NTSC Default, with PAL on command-line
[09:26:46] [PASSED] Both, PAL Default, with NTSC on command-line
[09:26:46] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[09:26:46] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[09:26:46] ================== drm_rect (9 subtests) ===================
[09:26:46] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[09:26:46] [PASSED] drm_test_rect_clip_scaled_not_clipped
[09:26:46] [PASSED] drm_test_rect_clip_scaled_clipped
[09:26:46] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[09:26:46] ================= drm_test_rect_intersect  =================
[09:26:46] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[09:26:46] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[09:26:46] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[09:26:46] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[09:26:46] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[09:26:46] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[09:26:46] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[09:26:46] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[09:26:46] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[09:26:46] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[09:26:46] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[09:26:46] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[09:26:46] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[09:26:46] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[09:26:46] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[09:26:46] ============= [PASSED] drm_test_rect_intersect =============
[09:26:46] ================ drm_test_rect_calc_hscale  ================
[09:26:46] [PASSED] normal use
[09:26:46] [PASSED] out of max range
[09:26:46] [PASSED] out of min range
[09:26:46] [PASSED] zero dst
[09:26:46] [PASSED] negative src
[09:26:46] [PASSED] negative dst
[09:26:46] ============ [PASSED] drm_test_rect_calc_hscale ============
[09:26:46] ================ drm_test_rect_calc_vscale  ================
[09:26:46] [PASSED] normal use
[09:26:46] [PASSED] out of max range
[09:26:46] [PASSED] out of min range
[09:26:46] [PASSED] zero dst
[09:26:46] [PASSED] negative src
[09:26:46] [PASSED] negative dst
[09:26:46] ============ [PASSED] drm_test_rect_calc_vscale ============
[09:26:46] ================== drm_test_rect_rotate  ===================
[09:26:46] [PASSED] reflect-x
[09:26:46] [PASSED] reflect-y
[09:26:46] [PASSED] rotate-0
[09:26:46] [PASSED] rotate-90
[09:26:46] [PASSED] rotate-180
[09:26:46] [PASSED] rotate-270
[09:26:46] ============== [PASSED] drm_test_rect_rotate ===============
[09:26:46] ================ drm_test_rect_rotate_inv  =================
[09:26:46] [PASSED] reflect-x
[09:26:46] [PASSED] reflect-y
[09:26:46] [PASSED] rotate-0
[09:26:46] [PASSED] rotate-90
[09:26:46] [PASSED] rotate-180
[09:26:46] [PASSED] rotate-270
[09:26:46] ============ [PASSED] drm_test_rect_rotate_inv =============
[09:26:46] ==================== [PASSED] drm_rect =====================
[09:26:46] ============================================================
[09:26:46] Testing complete. Ran 511 tests: passed: 511
[09:26:46] Elapsed time: 23.610s total, 1.721s configuring, 21.669s building, 0.203s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[09:26:46] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:26:48] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[09:26:57] Starting KUnit Kernel (1/1)...
[09:26:57] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[09:26:57] ================= ttm_device (5 subtests) ==================
[09:26:57] [PASSED] ttm_device_init_basic
[09:26:57] [PASSED] ttm_device_init_multiple
[09:26:57] [PASSED] ttm_device_fini_basic
[09:26:57] [PASSED] ttm_device_init_no_vma_man
[09:26:57] ================== ttm_device_init_pools  ==================
[09:26:57] [PASSED] No DMA allocations, no DMA32 required
[09:26:57] [PASSED] DMA allocations, DMA32 required
[09:26:57] [PASSED] No DMA allocations, DMA32 required
[09:26:57] [PASSED] DMA allocations, no DMA32 required
[09:26:57] ============== [PASSED] ttm_device_init_pools ==============
[09:26:57] =================== [PASSED] ttm_device ====================
[09:26:57] ================== ttm_pool (8 subtests) ===================
[09:26:57] ================== ttm_pool_alloc_basic  ===================
[09:26:57] [PASSED] One page
[09:26:57] [PASSED] More than one page
[09:26:57] [PASSED] Above the allocation limit
[09:26:57] [PASSED] One page, with coherent DMA mappings enabled
[09:26:57] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[09:26:57] ============== [PASSED] ttm_pool_alloc_basic ===============
[09:26:57] ============== ttm_pool_alloc_basic_dma_addr  ==============
[09:26:57] [PASSED] One page
[09:26:57] [PASSED] More than one page
[09:26:57] [PASSED] Above the allocation limit
[09:26:57] [PASSED] One page, with coherent DMA mappings enabled
[09:26:57] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[09:26:57] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[09:26:57] [PASSED] ttm_pool_alloc_order_caching_match
[09:26:57] [PASSED] ttm_pool_alloc_caching_mismatch
[09:26:57] [PASSED] ttm_pool_alloc_order_mismatch
[09:26:57] [PASSED] ttm_pool_free_dma_alloc
[09:26:57] [PASSED] ttm_pool_free_no_dma_alloc
[09:26:57] [PASSED] ttm_pool_fini_basic
[09:26:57] ==================== [PASSED] ttm_pool =====================
[09:26:57] ================ ttm_resource (8 subtests) =================
[09:26:57] ================= ttm_resource_init_basic  =================
[09:26:57] [PASSED] Init resource in TTM_PL_SYSTEM
[09:26:57] [PASSED] Init resource in TTM_PL_VRAM
[09:26:57] [PASSED] Init resource in a private placement
[09:26:57] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[09:26:57] ============= [PASSED] ttm_resource_init_basic =============
[09:26:57] [PASSED] ttm_resource_init_pinned
[09:26:57] [PASSED] ttm_resource_fini_basic
[09:26:57] [PASSED] ttm_resource_manager_init_basic
[09:26:57] [PASSED] ttm_resource_manager_usage_basic
[09:26:57] [PASSED] ttm_resource_manager_set_used_basic
[09:26:57] [PASSED] ttm_sys_man_alloc_basic
[09:26:57] [PASSED] ttm_sys_man_free_basic
[09:26:57] ================== [PASSED] ttm_resource ===================
[09:26:57] =================== ttm_tt (15 subtests) ===================
[09:26:57] ==================== ttm_tt_init_basic  ====================
[09:26:57] [PASSED] Page-aligned size
[09:26:57] [PASSED] Extra pages requested
[09:26:57] ================ [PASSED] ttm_tt_init_basic ================
[09:26:57] [PASSED] ttm_tt_init_misaligned
[09:26:57] [PASSED] ttm_tt_fini_basic
[09:26:57] [PASSED] ttm_tt_fini_sg
[09:26:57] [PASSED] ttm_tt_fini_shmem
[09:26:57] [PASSED] ttm_tt_create_basic
[09:26:57] [PASSED] ttm_tt_create_invalid_bo_type
[09:26:57] [PASSED] ttm_tt_create_ttm_exists
[09:26:57] [PASSED] ttm_tt_create_failed
[09:26:57] [PASSED] ttm_tt_destroy_basic
[09:26:57] [PASSED] ttm_tt_populate_null_ttm
[09:26:57] [PASSED] ttm_tt_populate_populated_ttm
[09:26:57] [PASSED] ttm_tt_unpopulate_basic
[09:26:57] [PASSED] ttm_tt_unpopulate_empty_ttm
[09:26:57] [PASSED] ttm_tt_swapin_basic
[09:26:57] ===================== [PASSED] ttm_tt ======================
[09:26:57] =================== ttm_bo (14 subtests) ===================
[09:26:57] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[09:26:57] [PASSED] Cannot be interrupted and sleeps
[09:26:57] [PASSED] Cannot be interrupted, locks straight away
[09:26:57] [PASSED] Can be interrupted, sleeps
[09:26:57] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[09:26:57] [PASSED] ttm_bo_reserve_locked_no_sleep
[09:26:57] [PASSED] ttm_bo_reserve_no_wait_ticket
[09:26:57] [PASSED] ttm_bo_reserve_double_resv
[09:26:57] [PASSED] ttm_bo_reserve_interrupted
[09:26:57] [PASSED] ttm_bo_reserve_deadlock
[09:26:57] [PASSED] ttm_bo_unreserve_basic
[09:26:57] [PASSED] ttm_bo_unreserve_pinned
[09:26:57] [PASSED] ttm_bo_unreserve_bulk
[09:26:57] [PASSED] ttm_bo_put_basic
[09:26:57] [PASSED] ttm_bo_put_shared_resv
[09:26:57] [PASSED] ttm_bo_pin_basic
[09:26:57] [PASSED] ttm_bo_pin_unpin_resource
[09:26:57] [PASSED] ttm_bo_multiple_pin_one_unpin
[09:26:57] ===================== [PASSED] ttm_bo ======================
[09:26:57] ============== ttm_bo_validate (22 subtests) ===============
[09:26:57] ============== ttm_bo_init_reserved_sys_man  ===============
[09:26:57] [PASSED] Buffer object for userspace
[09:26:57] [PASSED] Kernel buffer object
[09:26:57] [PASSED] Shared buffer object
[09:26:57] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[09:26:57] ============== ttm_bo_init_reserved_mock_man  ==============
[09:26:57] [PASSED] Buffer object for userspace
[09:26:57] [PASSED] Kernel buffer object
[09:26:57] [PASSED] Shared buffer object
[09:26:57] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[09:26:57] [PASSED] ttm_bo_init_reserved_resv
[09:26:57] ================== ttm_bo_validate_basic  ==================
[09:26:57] [PASSED] Buffer object for userspace
[09:26:57] [PASSED] Kernel buffer object
[09:26:57] [PASSED] Shared buffer object
[09:26:57] ============== [PASSED] ttm_bo_validate_basic ==============
[09:26:57] [PASSED] ttm_bo_validate_invalid_placement
[09:26:57] ============= ttm_bo_validate_same_placement  ==============
[09:26:57] [PASSED] System manager
[09:26:57] [PASSED] VRAM manager
[09:26:57] ========= [PASSED] ttm_bo_validate_same_placement ==========
[09:26:57] [PASSED] ttm_bo_validate_failed_alloc
[09:26:57] [PASSED] ttm_bo_validate_pinned
[09:26:57] [PASSED] ttm_bo_validate_busy_placement
[09:26:57] ================ ttm_bo_validate_multihop  =================
[09:26:57] [PASSED] Buffer object for userspace
[09:26:57] [PASSED] Kernel buffer object
[09:26:57] [PASSED] Shared buffer object
[09:26:57] ============ [PASSED] ttm_bo_validate_multihop =============
[09:26:57] ========== ttm_bo_validate_no_placement_signaled  ==========
[09:26:57] [PASSED] Buffer object in system domain, no page vector
[09:26:57] [PASSED] Buffer object in system domain with an existing page vector
[09:26:57] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[09:26:57] ======== ttm_bo_validate_no_placement_not_signaled  ========
[09:26:57] [PASSED] Buffer object for userspace
[09:26:57] [PASSED] Kernel buffer object
[09:26:57] [PASSED] Shared buffer object
[09:26:57] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[09:26:57] [PASSED] ttm_bo_validate_move_fence_signaled
[09:26:57] ========= ttm_bo_validate_move_fence_not_signaled  =========
[09:26:57] [PASSED] Waits for GPU
[09:26:57] [PASSED] Tries to lock straight away
[09:26:57] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[09:26:57] [PASSED] ttm_bo_validate_swapout
[09:26:57] [PASSED] ttm_bo_validate_happy_evict
[09:26:57] [PASSED] ttm_bo_validate_all_pinned_evict
[09:26:57] [PASSED] ttm_bo_validate_allowed_only_evict
[09:26:57] [PASSED] ttm_bo_validate_deleted_evict
[09:26:57] [PASSED] ttm_bo_validate_busy_domain_evict
[09:26:57] [PASSED] ttm_bo_validate_evict_gutting
[09:26:57] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[09:26:57] ================= [PASSED] ttm_bo_validate =================
[09:26:57] ============================================================
[09:26:57] Testing complete. Ran 102 tests: passed: 102
[09:26:57] Elapsed time: 11.225s total, 1.713s configuring, 8.841s building, 0.569s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


