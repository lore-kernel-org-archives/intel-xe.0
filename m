Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95112C27C43
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 13:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FD710E380;
	Thu, 30 May 2024 13:27:46 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC6E10E380;
 Thu, 30 May 2024 13:27:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm=3A_move_Intel_drm_headers_?=
 =?utf-8?q?to_a_subdirectory_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 May 2024 13:27:41 -0000
Message-ID: <171707566183.2238285.13077608816921393230@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1717075103.git.jani.nikula@intel.com>
In-Reply-To: <cover.1717075103.git.jani.nikula@intel.com>
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

Series: drm: move Intel drm headers to a subdirectory (rev4)
URL   : https://patchwork.freedesktop.org/series/132263/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[13:26:44] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:26:49] Building KUnit Kernel ...
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

[13:27:15] Starting KUnit Kernel (1/1)...
[13:27:15] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[13:27:15] =================== guc_dbm (7 subtests) ===================
[13:27:15] [PASSED] test_empty
[13:27:15] [PASSED] test_default
[13:27:15] ======================== test_size  ========================
[13:27:15] [PASSED] 4
[13:27:15] [PASSED] 8
[13:27:15] [PASSED] 32
[13:27:15] [PASSED] 256
[13:27:15] ==================== [PASSED] test_size ====================
[13:27:15] ======================= test_reuse  ========================
[13:27:15] [PASSED] 4
[13:27:15] [PASSED] 8
[13:27:15] [PASSED] 32
[13:27:15] [PASSED] 256
[13:27:15] =================== [PASSED] test_reuse ====================
[13:27:15] =================== test_range_overlap  ====================
[13:27:15] [PASSED] 4
[13:27:15] [PASSED] 8
[13:27:15] [PASSED] 32
[13:27:15] [PASSED] 256
[13:27:15] =============== [PASSED] test_range_overlap ================
[13:27:15] =================== test_range_compact  ====================
[13:27:15] [PASSED] 4
[13:27:15] [PASSED] 8
[13:27:15] [PASSED] 32
[13:27:15] [PASSED] 256
[13:27:15] =============== [PASSED] test_range_compact ================
[13:27:15] ==================== test_range_spare  =====================
[13:27:15] [PASSED] 4
[13:27:15] [PASSED] 8
[13:27:15] [PASSED] 32
[13:27:15] [PASSED] 256
[13:27:15] ================ [PASSED] test_range_spare =================
[13:27:15] ===================== [PASSED] guc_dbm =====================
[13:27:15] =================== guc_idm (6 subtests) ===================
[13:27:15] [PASSED] bad_init
[13:27:15] [PASSED] no_init
[13:27:15] [PASSED] init_fini
[13:27:15] [PASSED] check_used
[13:27:15] [PASSED] check_quota
[13:27:15] [PASSED] check_all
[13:27:15] ===================== [PASSED] guc_idm =====================
[13:27:15] ================== no_relay (3 subtests) ===================
[13:27:15] [PASSED] xe_drops_guc2pf_if_not_ready
[13:27:15] [PASSED] xe_drops_guc2vf_if_not_ready
[13:27:15] [PASSED] xe_rejects_send_if_not_ready
[13:27:15] ==================== [PASSED] no_relay =====================
[13:27:15] ================== pf_relay (14 subtests) ==================
[13:27:15] [PASSED] pf_rejects_guc2pf_too_short
[13:27:15] [PASSED] pf_rejects_guc2pf_too_long
[13:27:15] [PASSED] pf_rejects_guc2pf_no_payload
[13:27:15] [PASSED] pf_fails_no_payload
[13:27:15] [PASSED] pf_fails_bad_origin
[13:27:15] [PASSED] pf_fails_bad_type
[13:27:15] [PASSED] pf_txn_reports_error
[13:27:15] [PASSED] pf_txn_sends_pf2guc
[13:27:15] [PASSED] pf_sends_pf2guc
[13:27:15] [SKIPPED] pf_loopback_nop
[13:27:15] [SKIPPED] pf_loopback_echo
[13:27:15] [SKIPPED] pf_loopback_fail
[13:27:15] [SKIPPED] pf_loopback_busy
[13:27:15] [SKIPPED] pf_loopback_retry
[13:27:15] ==================== [PASSED] pf_relay =====================
[13:27:15] ================== vf_relay (3 subtests) ===================
[13:27:15] [PASSED] vf_rejects_guc2vf_too_short
[13:27:15] [PASSED] vf_rejects_guc2vf_too_long
[13:27:15] [PASSED] vf_rejects_guc2vf_no_payload
[13:27:15] ==================== [PASSED] vf_relay =====================
[13:27:15] ================= pf_service (11 subtests) =================
[13:27:15] [PASSED] pf_negotiate_any
[13:27:15] [PASSED] pf_negotiate_base_match
[13:27:15] [PASSED] pf_negotiate_base_newer
[13:27:15] [PASSED] pf_negotiate_base_next
[13:27:15] [SKIPPED] pf_negotiate_base_older
[13:27:15] [PASSED] pf_negotiate_base_prev
[13:27:15] [PASSED] pf_negotiate_latest_match
[13:27:15] [PASSED] pf_negotiate_latest_newer
[13:27:15] [PASSED] pf_negotiate_latest_next
[13:27:15] [SKIPPED] pf_negotiate_latest_older
[13:27:15] [SKIPPED] pf_negotiate_latest_prev
[13:27:15] =================== [PASSED] pf_service ====================
[13:27:15] ===================== lmtt (1 subtest) =====================
[13:27:15] ======================== test_ops  =========================
[13:27:15] [PASSED] 2-level
[13:27:15] [PASSED] multi-level
[13:27:15] ==================== [PASSED] test_ops =====================
[13:27:15] ====================== [PASSED] lmtt =======================
[13:27:15] ==================== xe_bo (2 subtests) ====================
[13:27:15] [SKIPPED] xe_ccs_migrate_kunit
[13:27:15] [SKIPPED] xe_bo_evict_kunit
[13:27:15] ===================== [SKIPPED] xe_bo ======================
[13:27:15] ================== xe_dma_buf (1 subtest) ==================
[13:27:15] [SKIPPED] xe_dma_buf_kunit
[13:27:15] =================== [SKIPPED] xe_dma_buf ===================
[13:27:15] ================== xe_migrate (1 subtest) ==================
[13:27:15] [SKIPPED] xe_migrate_sanity_kunit
[13:27:15] =================== [SKIPPED] xe_migrate ===================
[13:27:15] =================== xe_mocs (2 subtests) ===================
[13:27:15] [SKIPPED] xe_live_mocs_kernel_kunit
[13:27:15] [SKIPPED] xe_live_mocs_reset_kunit
[13:27:15] ==================== [SKIPPED] xe_mocs =====================
[13:27:15] ==================== args (11 subtests) ====================
[13:27:15] [PASSED] count_args_test
[13:27:15] [PASSED] call_args_example
[13:27:15] [PASSED] call_args_test
[13:27:15] [PASSED] drop_first_arg_example
[13:27:15] [PASSED] drop_first_arg_test
[13:27:15] [PASSED] first_arg_example
[13:27:15] [PASSED] first_arg_test
[13:27:15] [PASSED] last_arg_example
[13:27:15] [PASSED] last_arg_test
[13:27:15] [PASSED] pick_arg_example
[13:27:15] [PASSED] sep_comma_example
[13:27:15] ====================== [PASSED] args =======================
[13:27:15] =================== xe_pci (2 subtests) ====================
[13:27:15] [PASSED] xe_gmdid_graphics_ip
[13:27:15] [PASSED] xe_gmdid_media_ip
[13:27:15] ===================== [PASSED] xe_pci ======================
[13:27:15] ==================== xe_rtp (1 subtest) ====================
[13:27:15] ================== xe_rtp_process_tests  ===================
[13:27:15] [PASSED] coalesce-same-reg
[13:27:15] [PASSED] no-match-no-add
[13:27:15] [PASSED] no-match-no-add-multiple-rules
[13:27:15] [PASSED] two-regs-two-entries
[13:27:15] [PASSED] clr-one-set-other
[13:27:15] [PASSED] set-field
[13:27:15] [PASSED] conflict-duplicate
[13:27:15] [PASSED] conflict-not-disjoint
[13:27:15] [PASSED] conflict-reg-type
[13:27:15] ============== [PASSED] xe_rtp_process_tests ===============
stty: 'standard input': Inappropriate ioctl for device
[13:27:15] ===================== [PASSED] xe_rtp ======================
[13:27:15] ==================== xe_wa (1 subtest) =====================
[13:27:15] ======================== xe_wa_gt  =========================
[13:27:15] [PASSED] TIGERLAKE (B0)
[13:27:15] [PASSED] DG1 (A0)
[13:27:15] [PASSED] DG1 (B0)
[13:27:15] [PASSED] ALDERLAKE_S (A0)
[13:27:15] [PASSED] ALDERLAKE_S (B0)
[13:27:15] [PASSED] ALDERLAKE_S (C0)
[13:27:15] [PASSED] ALDERLAKE_S (D0)
[13:27:15] [PASSED] ALDERLAKE_P (A0)
[13:27:15] [PASSED] ALDERLAKE_P (B0)
[13:27:15] [PASSED] ALDERLAKE_P (C0)
[13:27:15] [PASSED] ALDERLAKE_S_RPLS (D0)
[13:27:15] [PASSED] ALDERLAKE_P_RPLU (E0)
[13:27:15] [PASSED] DG2_G10 (C0)
[13:27:15] [PASSED] DG2_G11 (B1)
[13:27:15] [PASSED] DG2_G12 (A1)
[13:27:15] [PASSED] METEORLAKE (g:A0, m:A0)
[13:27:15] [PASSED] METEORLAKE (g:A0, m:A0)
[13:27:15] [PASSED] METEORLAKE (g:A0, m:A0)
[13:27:15] [PASSED] LUNARLAKE (g:A0, m:A0)
[13:27:15] [PASSED] LUNARLAKE (g:B0, m:A0)
[13:27:15] ==================== [PASSED] xe_wa_gt =====================
[13:27:15] ====================== [PASSED] xe_wa ======================
[13:27:15] ============================================================
[13:27:15] Testing complete. Ran 109 tests: passed: 95, skipped: 14
[13:27:15] Elapsed time: 30.710s total, 4.269s configuring, 26.220s building, 0.178s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[13:27:15] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:27:17] Building KUnit Kernel ...
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

[13:27:38] Starting KUnit Kernel (1/1)...
[13:27:38] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[13:27:38] ============ drm_test_pick_cmdline (2 subtests) ============
[13:27:38] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[13:27:38] =============== drm_test_pick_cmdline_named  ===============
[13:27:38] [PASSED] NTSC
[13:27:38] [PASSED] NTSC-J
[13:27:38] [PASSED] PAL
[13:27:38] [PASSED] PAL-M
[13:27:38] =========== [PASSED] drm_test_pick_cmdline_named ===========
[13:27:38] ============== [PASSED] drm_test_pick_cmdline ==============
[13:27:38] ================== drm_buddy (7 subtests) ==================
[13:27:38] [PASSED] drm_test_buddy_alloc_limit
[13:27:38] [PASSED] drm_test_buddy_alloc_optimistic
[13:27:38] [PASSED] drm_test_buddy_alloc_pessimistic
[13:27:38] [PASSED] drm_test_buddy_alloc_pathological
[13:27:38] [PASSED] drm_test_buddy_alloc_contiguous
[13:27:38] [PASSED] drm_test_buddy_alloc_clear
[13:27:38] [PASSED] drm_test_buddy_alloc_range_bias
[13:27:38] ==================== [PASSED] drm_buddy ====================
[13:27:38] ============= drm_cmdline_parser (40 subtests) =============
[13:27:38] [PASSED] drm_test_cmdline_force_d_only
[13:27:38] [PASSED] drm_test_cmdline_force_D_only_dvi
[13:27:38] [PASSED] drm_test_cmdline_force_D_only_hdmi
[13:27:38] [PASSED] drm_test_cmdline_force_D_only_not_digital
[13:27:38] [PASSED] drm_test_cmdline_force_e_only
[13:27:38] [PASSED] drm_test_cmdline_res
[13:27:38] [PASSED] drm_test_cmdline_res_vesa
[13:27:38] [PASSED] drm_test_cmdline_res_vesa_rblank
[13:27:38] [PASSED] drm_test_cmdline_res_rblank
[13:27:38] [PASSED] drm_test_cmdline_res_bpp
[13:27:38] [PASSED] drm_test_cmdline_res_refresh
[13:27:38] [PASSED] drm_test_cmdline_res_bpp_refresh
[13:27:38] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[13:27:38] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[13:27:38] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[13:27:38] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[13:27:38] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[13:27:38] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[13:27:38] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[13:27:38] [PASSED] drm_test_cmdline_res_margins_force_on
[13:27:38] [PASSED] drm_test_cmdline_res_vesa_margins
[13:27:38] [PASSED] drm_test_cmdline_name
[13:27:38] [PASSED] drm_test_cmdline_name_bpp
[13:27:38] [PASSED] drm_test_cmdline_name_option
[13:27:38] [PASSED] drm_test_cmdline_name_bpp_option
[13:27:38] [PASSED] drm_test_cmdline_rotate_0
[13:27:38] [PASSED] drm_test_cmdline_rotate_90
[13:27:38] [PASSED] drm_test_cmdline_rotate_180
[13:27:38] [PASSED] drm_test_cmdline_rotate_270
[13:27:38] [PASSED] drm_test_cmdline_hmirror
[13:27:38] [PASSED] drm_test_cmdline_vmirror
[13:27:38] [PASSED] drm_test_cmdline_margin_options
[13:27:38] [PASSED] drm_test_cmdline_multiple_options
[13:27:38] [PASSED] drm_test_cmdline_bpp_extra_and_option
[13:27:38] [PASSED] drm_test_cmdline_extra_and_option
[13:27:38] [PASSED] drm_test_cmdline_freestanding_options
[13:27:38] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[13:27:38] [PASSED] drm_test_cmdline_panel_orientation
[13:27:38] ================ drm_test_cmdline_invalid  =================
[13:27:38] [PASSED] margin_only
[13:27:38] [PASSED] interlace_only
[13:27:38] [PASSED] res_missing_x
[13:27:38] [PASSED] res_missing_y
[13:27:38] [PASSED] res_bad_y
[13:27:38] [PASSED] res_missing_y_bpp
[13:27:38] [PASSED] res_bad_bpp
[13:27:38] [PASSED] res_bad_refresh
[13:27:38] [PASSED] res_bpp_refresh_force_on_off
[13:27:38] [PASSED] res_invalid_mode
[13:27:38] [PASSED] res_bpp_wrong_place_mode
[13:27:38] [PASSED] name_bpp_refresh
[13:27:38] [PASSED] name_refresh
[13:27:38] [PASSED] name_refresh_wrong_mode
[13:27:38] [PASSED] name_refresh_invalid_mode
[13:27:38] [PASSED] rotate_multiple
[13:27:38] [PASSED] rotate_invalid_val
[13:27:38] [PASSED] rotate_truncated
[13:27:38] [PASSED] invalid_option
[13:27:38] [PASSED] invalid_tv_option
[13:27:38] [PASSED] truncated_tv_option
[13:27:38] ============ [PASSED] drm_test_cmdline_invalid =============
[13:27:38] =============== drm_test_cmdline_tv_options  ===============
[13:27:38] [PASSED] NTSC
[13:27:38] [PASSED] NTSC_443
[13:27:38] [PASSED] NTSC_J
[13:27:38] [PASSED] PAL
[13:27:38] [PASSED] PAL_M
[13:27:38] [PASSED] PAL_N
[13:27:38] [PASSED] SECAM
[13:27:38] =========== [PASSED] drm_test_cmdline_tv_options ===========
[13:27:38] =============== [PASSED] drm_cmdline_parser ================
[13:27:38] ========== drmm_connector_hdmi_init (19 subtests) ==========
[13:27:38] [PASSED] drm_test_connector_hdmi_init_valid
[13:27:38] [PASSED] drm_test_connector_hdmi_init_bpc_8
[13:27:38] [PASSED] drm_test_connector_hdmi_init_bpc_10
[13:27:38] [PASSED] drm_test_connector_hdmi_init_bpc_12
[13:27:38] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[13:27:38] [PASSED] drm_test_connector_hdmi_init_bpc_null
[13:27:38] [PASSED] drm_test_connector_hdmi_init_formats_empty
[13:27:38] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[13:27:38] [PASSED] drm_test_connector_hdmi_init_null_ddc
[13:27:38] [PASSED] drm_test_connector_hdmi_init_null_product
[13:27:38] [PASSED] drm_test_connector_hdmi_init_null_vendor
[13:27:38] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[13:27:38] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[13:27:38] [PASSED] drm_test_connector_hdmi_init_product_valid
[13:27:38] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[13:27:38] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[13:27:38] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[13:27:38] ========= drm_test_connector_hdmi_init_type_valid  =========
[13:27:38] [PASSED] HDMI-A
[13:27:38] [PASSED] HDMI-B
[13:27:38] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[13:27:38] ======== drm_test_connector_hdmi_init_type_invalid  ========
[13:27:38] [PASSED] Unknown
[13:27:38] [PASSED] VGA
[13:27:38] [PASSED] DVI-I
[13:27:38] [PASSED] DVI-D
[13:27:38] [PASSED] DVI-A
[13:27:38] [PASSED] Composite
[13:27:38] [PASSED] SVIDEO
[13:27:38] [PASSED] LVDS
[13:27:38] [PASSED] Component
[13:27:38] [PASSED] DIN
[13:27:38] [PASSED] DP
[13:27:38] [PASSED] TV
[13:27:38] [PASSED] eDP
[13:27:38] [PASSED] Virtual
[13:27:38] [PASSED] DSI
[13:27:38] [PASSED] DPI
[13:27:38] [PASSED] Writeback
[13:27:38] [PASSED] SPI
[13:27:38] [PASSED] USB
[13:27:38] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[13:27:38] ============ [PASSED] drmm_connector_hdmi_init =============
[13:27:38] ============= drmm_connector_init (3 subtests) =============
[13:27:38] [PASSED] drm_test_drmm_connector_init
[13:27:38] [PASSED] drm_test_drmm_connector_init_null_ddc
[13:27:38] ========= drm_test_drmm_connector_init_type_valid  =========
[13:27:38] [PASSED] Unknown
[13:27:38] [PASSED] VGA
[13:27:38] [PASSED] DVI-I
[13:27:38] [PASSED] DVI-D
[13:27:38] [PASSED] DVI-A
[13:27:38] [PASSED] Composite
[13:27:38] [PASSED] SVIDEO
[13:27:38] [PASSED] LVDS
[13:27:38] [PASSED] Component
[13:27:38] [PASSED] DIN
[13:27:38] [PASSED] DP
[13:27:38] [PASSED] HDMI-A
[13:27:38] [PASSED] HDMI-B
[13:27:38] [PASSED] TV
[13:27:38] [PASSED] eDP
[13:27:38] [PASSED] Virtual
[13:27:38] [PASSED] DSI
[13:27:38] [PASSED] DPI
[13:27:38] [PASSED] Writeback
[13:27:38] [PASSED] SPI
[13:27:38] [PASSED] USB
[13:27:38] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[13:27:38] =============== [PASSED] drmm_connector_init ===============
[13:27:38] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[13:27:38] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[13:27:38] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[13:27:38] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[13:27:38] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[13:27:38] ========== drm_test_get_tv_mode_from_name_valid  ===========
[13:27:38] [PASSED] NTSC
[13:27:38] [PASSED] NTSC-443
[13:27:38] [PASSED] NTSC-J
[13:27:38] [PASSED] PAL
[13:27:38] [PASSED] PAL-M
[13:27:38] [PASSED] PAL-N
[13:27:38] [PASSED] SECAM
[13:27:38] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[13:27:38] [PASSED] drm_test_get_tv_mode_from_name_truncated
[13:27:38] ============ [PASSED] drm_get_tv_mode_from_name ============
[13:27:38] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[13:27:38] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[13:27:38] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[13:27:38] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[13:27:38] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[13:27:38] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[13:27:38] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[13:27:38] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[13:27:38] [PASSED] VIC 96
[13:27:38] [PASSED] VIC 97
[13:27:38] [PASSED] VIC 101
[13:27:38] [PASSED] VIC 102
[13:27:38] [PASSED] VIC 106
[13:27:38] [PASSED] VIC 107
[13:27:38] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[13:27:38] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[13:27:38] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[13:27:38] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[13:27:38] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[13:27:38] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[13:27:38] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[13:27:38] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[13:27:38] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[13:27:38] [PASSED] Automatic
[13:27:38] [PASSED] Full
[13:27:38] [PASSED] Limited 16:235
[13:27:38] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[13:27:38] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[13:27:38] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[13:27:38] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[13:27:38] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[13:27:39] [PASSED] RGB
[13:27:39] [PASSED] YUV 4:2:0
[13:27:39] [PASSED] YUV 4:2:2
[13:27:39] [PASSED] YUV 4:4:4
[13:27:39] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[13:27:39] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[13:27:39] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[13:27:39] ============= drm_damage_helper (21 subtests) ==============
[13:27:39] [PASSED] drm_test_damage_iter_no_damage
[13:27:39] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[13:27:39] [PASSED] drm_test_damage_iter_no_damage_src_moved
[13:27:39] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[13:27:39] [PASSED] drm_test_damage_iter_no_damage_not_visible
[13:27:39] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[13:27:39] [PASSED] drm_test_damage_iter_no_damage_no_fb
[13:27:39] [PASSED] drm_test_damage_iter_simple_damage
[13:27:39] [PASSED] drm_test_damage_iter_single_damage
[13:27:39] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[13:27:39] [PASSED] drm_test_damage_iter_single_damage_outside_src
[13:27:39] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[13:27:39] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[13:27:39] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[13:27:39] [PASSED] drm_test_damage_iter_single_damage_src_moved
[13:27:39] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[13:27:39] [PASSED] drm_test_damage_iter_damage
[13:27:39] [PASSED] drm_test_damage_iter_damage_one_intersect
[13:27:39] [PASSED] drm_test_damage_iter_damage_one_outside
[13:27:39] [PASSED] drm_test_damage_iter_damage_src_moved
[13:27:39] [PASSED] drm_test_damage_iter_damage_not_visible
[13:27:39] ================ [PASSED] drm_damage_helper ================
[13:27:39] ============== drm_dp_mst_helper (3 subtests) ==============
[13:27:39] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[13:27:39] [PASSED] Clock 154000 BPP 30 DSC disabled
[13:27:39] [PASSED] Clock 234000 BPP 30 DSC disabled
[13:27:39] [PASSED] Clock 297000 BPP 24 DSC disabled
[13:27:39] [PASSED] Clock 332880 BPP 24 DSC enabled
[13:27:39] [PASSED] Clock 324540 BPP 24 DSC enabled
[13:27:39] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[13:27:39] ============== drm_test_dp_mst_calc_pbn_div  ===============
[13:27:39] [PASSED] Link rate 2000000 lane count 4
[13:27:39] [PASSED] Link rate 2000000 lane count 2
[13:27:39] [PASSED] Link rate 2000000 lane count 1
[13:27:39] [PASSED] Link rate 1350000 lane count 4
[13:27:39] [PASSED] Link rate 1350000 lane count 2
[13:27:39] [PASSED] Link rate 1350000 lane count 1
[13:27:39] [PASSED] Link rate 1000000 lane count 4
[13:27:39] [PASSED] Link rate 1000000 lane count 2
[13:27:39] [PASSED] Link rate 1000000 lane count 1
[13:27:39] [PASSED] Link rate 810000 lane count 4
[13:27:39] [PASSED] Link rate 810000 lane count 2
[13:27:39] [PASSED] Link rate 810000 lane count 1
[13:27:39] [PASSED] Link rate 540000 lane count 4
[13:27:39] [PASSED] Link rate 540000 lane count 2
[13:27:39] [PASSED] Link rate 540000 lane count 1
[13:27:39] [PASSED] Link rate 270000 lane count 4
[13:27:39] [PASSED] Link rate 270000 lane count 2
[13:27:39] [PASSED] Link rate 270000 lane count 1
[13:27:39] [PASSED] Link rate 162000 lane count 4
[13:27:39] [PASSED] Link rate 162000 lane count 2
[13:27:39] [PASSED] Link rate 162000 lane count 1
[13:27:39] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[13:27:39] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[13:27:39] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[13:27:39] [PASSED] DP_POWER_UP_PHY with port number
[13:27:39] [PASSED] DP_POWER_DOWN_PHY with port number
[13:27:39] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[13:27:39] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[13:27:39] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[13:27:39] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[13:27:39] [PASSED] DP_QUERY_PAYLOAD with port number
[13:27:39] [PASSED] DP_QUERY_PAYLOAD with VCPI
[13:27:39] [PASSED] DP_REMOTE_DPCD_READ with port number
[13:27:39] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[13:27:39] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[13:27:39] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[13:27:39] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[13:27:39] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[13:27:39] [PASSED] DP_REMOTE_I2C_READ with port number
[13:27:39] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[13:27:39] [PASSED] DP_REMOTE_I2C_READ with transactions array
[13:27:39] [PASSED] DP_REMOTE_I2C_WRITE with port number
[13:27:39] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[13:27:39] [PASSED] DP_REMOTE_I2C_WRITE with data array
[13:27:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[13:27:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[13:27:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[13:27:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[13:27:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[13:27:39] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[13:27:39] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[13:27:39] ================ [PASSED] drm_dp_mst_helper ================
[13:27:39] ================== drm_exec (7 subtests) ===================
[13:27:39] [PASSED] sanitycheck
[13:27:39] [PASSED] test_lock
[13:27:39] [PASSED] test_lock_unlock
[13:27:39] [PASSED] test_duplicates
[13:27:39] [PASSED] test_prepare
[13:27:39] [PASSED] test_prepare_array
[13:27:39] [PASSED] test_multiple_loops
[13:27:39] ==================== [PASSED] drm_exec =====================
[13:27:39] =========== drm_format_helper_test (17 subtests) ===========
[13:27:39] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[13:27:39] [PASSED] single_pixel_source_buffer
[13:27:39] [PASSED] single_pixel_clip_rectangle
[13:27:39] [PASSED] well_known_colors
[13:27:39] [PASSED] destination_pitch
[13:27:39] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[13:27:39] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[13:27:39] [PASSED] single_pixel_source_buffer
[13:27:39] [PASSED] single_pixel_clip_rectangle
[13:27:39] [PASSED] well_known_colors
[13:27:39] [PASSED] destination_pitch
[13:27:39] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[13:27:39] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[13:27:39] [PASSED] single_pixel_source_buffer
[13:27:39] [PASSED] single_pixel_clip_rectangle
[13:27:39] [PASSED] well_known_colors
[13:27:39] [PASSED] destination_pitch
[13:27:39] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[13:27:39] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[13:27:39] [PASSED] single_pixel_source_buffer
[13:27:39] [PASSED] single_pixel_clip_rectangle
[13:27:39] [PASSED] well_known_colors
[13:27:39] [PASSED] destination_pitch
[13:27:39] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[13:27:39] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[13:27:39] [PASSED] single_pixel_source_buffer
[13:27:39] [PASSED] single_pixel_clip_rectangle
[13:27:39] [PASSED] well_known_colors
[13:27:39] [PASSED] destination_pitch
[13:27:39] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[13:27:39] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[13:27:39] [PASSED] single_pixel_source_buffer
[13:27:39] [PASSED] single_pixel_clip_rectangle
[13:27:39] [PASSED] well_known_colors
[13:27:39] [PASSED] destination_pitch
[13:27:39] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[13:27:39] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[13:27:39] [PASSED] single_pixel_source_buffer
[13:27:39] [PASSED] single_pixel_clip_rectangle
[13:27:39] [PASSED] well_known_colors
[13:27:39] [PASSED] destination_pitch
[13:27:39] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[13:27:39] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[13:27:39] [PASSED] single_pixel_source_buffer
[13:27:39] [PASSED] single_pixel_clip_rectangle
[13:27:39] [PASSED] well_known_colors
[13:27:39] [PASSED] destination_pitch
[13:27:39] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[13:27:39] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[13:27:39] [PASSED] single_pixel_source_buffer
[13:27:39] [PASSED] single_pixel_clip_rectangle
[13:27:39] [PASSED] well_known_colors
[13:27:39] [PASSED] destination_pitch
[13:27:39] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[13:27:39] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[13:27:39] [PASSED] single_pixel_source_buffer
[13:27:39] [PASSED] single_pixel_clip_rectangle
[13:27:39] [PASSED] well_known_colors
[13:27:39] [PASSED] destination_pitch
[13:27:39] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[13:27:39] ============== drm_test_fb_xrgb8888_to_mono  ===============
[13:27:39] [PASSED] single_pixel_source_buffer
[13:27:39] [PASSED] single_pixel_clip_rectangle
[13:27:39] [PASSED] well_known_colors
[13:27:39] [PASSED] destination_pitch
[13:27:39] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[13:27:39] ==================== drm_test_fb_swab  =====================
[13:27:39] [PASSED] single_pixel_source_buffer
[13:27:39] [PASSED] single_pixel_clip_rectangle
[13:27:39] [PASSED] well_known_colors
[13:27:39] [PASSED] destination_pitch
[13:27:39] ================ [PASSED] drm_test_fb_swab =================
[13:27:39] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[13:27:39] [PASSED] single_pixel_source_buffer
[13:27:39] [PASSED] single_pixel_clip_rectangle
[13:27:39] [PASSED] well_known_colors
[13:27:39] [PASSED] destination_pitch
[13:27:39] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[13:27:39] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[13:27:39] [PASSED] single_pixel_source_buffer
[13:27:39] [PASSED] single_pixel_clip_rectangle
[13:27:39] [PASSED] well_known_colors
[13:27:39] [PASSED] destination_pitch
[13:27:39] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[13:27:39] ================= drm_test_fb_clip_offset  =================
[13:27:39] [PASSED] pass through
[13:27:39] [PASSED] horizontal offset
[13:27:39] [PASSED] vertical offset
[13:27:39] [PASSED] horizontal and vertical offset
[13:27:39] [PASSED] horizontal offset (custom pitch)
[13:27:39] [PASSED] vertical offset (custom pitch)
[13:27:39] [PASSED] horizontal and vertical offset (custom pitch)
[13:27:39] ============= [PASSED] drm_test_fb_clip_offset =============
[13:27:39] ============== drm_test_fb_build_fourcc_list  ==============
[13:27:39] [PASSED] no native formats
[13:27:39] [PASSED] XRGB8888 as native format
[13:27:39] [PASSED] remove duplicates
[13:27:39] [PASSED] convert alpha formats
[13:27:39] [PASSED] random formats
[13:27:39] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[13:27:39] =================== drm_test_fb_memcpy  ====================
[13:27:39] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[13:27:39] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[13:27:39] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[13:27:39] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[13:27:39] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[13:27:39] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[13:27:39] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[13:27:39] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[13:27:39] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[13:27:39] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[13:27:39] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[13:27:39] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[13:27:39] =============== [PASSED] drm_test_fb_memcpy ================
[13:27:39] ============= [PASSED] drm_format_helper_test ==============
[13:27:39] ================= drm_format (18 subtests) =================
[13:27:39] [PASSED] drm_test_format_block_width_invalid
[13:27:39] [PASSED] drm_test_format_block_width_one_plane
[13:27:39] [PASSED] drm_test_format_block_width_two_plane
[13:27:39] [PASSED] drm_test_format_block_width_three_plane
[13:27:39] [PASSED] drm_test_format_block_width_tiled
[13:27:39] [PASSED] drm_test_format_block_height_invalid
[13:27:39] [PASSED] drm_test_format_block_height_one_plane
[13:27:39] [PASSED] drm_test_format_block_height_two_plane
[13:27:39] [PASSED] drm_test_format_block_height_three_plane
[13:27:39] [PASSED] drm_test_format_block_height_tiled
[13:27:39] [PASSED] drm_test_format_min_pitch_invalid
[13:27:39] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[13:27:39] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[13:27:39] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[13:27:39] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[13:27:39] [PASSED] drm_test_format_min_pitch_two_plane
[13:27:39] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[13:27:39] [PASSED] drm_test_format_min_pitch_tiled
[13:27:39] =================== [PASSED] drm_format ====================
[13:27:39] =============== drm_framebuffer (1 subtest) ================
[13:27:39] =============== drm_test_framebuffer_create  ===============
[13:27:39] [PASSED] ABGR8888 normal sizes
[13:27:39] [PASSED] ABGR8888 max sizes
[13:27:39] [PASSED] ABGR8888 pitch greater than min required
[13:27:39] [PASSED] ABGR8888 pitch less than min required
[13:27:39] [PASSED] ABGR8888 Invalid width
[13:27:39] [PASSED] ABGR8888 Invalid buffer handle
[13:27:39] [PASSED] No pixel format
[13:27:39] [PASSED] ABGR8888 Width 0
[13:27:39] [PASSED] ABGR8888 Height 0
[13:27:39] [PASSED] ABGR8888 Out of bound height * pitch combination
[13:27:39] [PASSED] ABGR8888 Large buffer offset
[13:27:39] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[13:27:39] [PASSED] ABGR8888 Valid buffer modifier
[13:27:39] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[13:27:39] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[13:27:39] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[13:27:39] [PASSED] NV12 Normal sizes
[13:27:39] [PASSED] NV12 Max sizes
[13:27:39] [PASSED] NV12 Invalid pitch
[13:27:39] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[13:27:39] [PASSED] NV12 different  modifier per-plane
[13:27:39] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[13:27:39] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[13:27:39] [PASSED] NV12 Modifier for inexistent plane
[13:27:39] [PASSED] NV12 Handle for inexistent plane
[13:27:39] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[13:27:39] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[13:27:39] [PASSED] YVU420 Normal sizes
[13:27:39] [PASSED] YVU420 Max sizes
[13:27:39] [PASSED] YVU420 Invalid pitch
[13:27:39] [PASSED] YVU420 Different pitches
[13:27:39] [PASSED] YVU420 Different buffer offsets/pitches
[13:27:39] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[13:27:39] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[13:27:39] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[13:27:39] [PASSED] YVU420 Valid modifier
[13:27:39] [PASSED] YVU420 Different modifiers per plane
[13:27:39] [PASSED] YVU420 Modifier for inexistent plane
[13:27:39] [PASSED] X0L2 Normal sizes
[13:27:39] [PASSED] X0L2 Max sizes
[13:27:39] [PASSED] X0L2 Invalid pitch
[13:27:39] [PASSED] X0L2 Pitch greater than minimum required
[13:27:39] [PASSED] X0L2 Handle for inexistent plane
[13:27:39] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[13:27:39] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[13:27:39] [PASSED] X0L2 Valid modifier
[13:27:39] [PASSED] X0L2 Modifier for inexistent plane
[13:27:39] =========== [PASSED] drm_test_framebuffer_create ===========
[13:27:39] ================= [PASSED] drm_framebuffer =================
[13:27:39] ================ drm_gem_shmem (8 subtests) ================
[13:27:39] [PASSED] drm_gem_shmem_test_obj_create
[13:27:39] [PASSED] drm_gem_shmem_test_obj_create_private
[13:27:39] [PASSED] drm_gem_shmem_test_pin_pages
[13:27:39] [PASSED] drm_gem_shmem_test_vmap
[13:27:39] [PASSED] drm_gem_shmem_test_get_pages_sgt
[13:27:39] [PASSED] drm_gem_shmem_test_get_sg_table
[13:27:39] [PASSED] drm_gem_shmem_test_madvise
[13:27:39] [PASSED] drm_gem_shmem_test_purge
[13:27:39] ================== [PASSED] drm_gem_shmem ==================
[13:27:39] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[13:27:39] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[13:27:39] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[13:27:39] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[13:27:39] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[13:27:39] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[13:27:39] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[13:27:39] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[13:27:39] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[13:27:39] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[13:27:39] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[13:27:39] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[13:27:39] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[13:27:39] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[13:27:39] [PASSED] drm_test_check_output_bpc_dvi
[13:27:39] [PASSED] drm_test_check_output_bpc_format_vic_1
[13:27:39] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[13:27:39] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[13:27:39] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[13:27:39] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[13:27:39] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[13:27:39] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[13:27:39] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[13:27:39] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[13:27:39] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[13:27:39] [PASSED] drm_test_check_broadcast_rgb_value
[13:27:39] [PASSED] drm_test_check_bpc_8_value
[13:27:39] [PASSED] drm_test_check_bpc_10_value
[13:27:39] [PASSED] drm_test_check_bpc_12_value
[13:27:39] [PASSED] drm_test_check_format_value
[13:27:39] [PASSED] drm_test_check_tmds_char_value
[13:27:39] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[13:27:39] ================= drm_managed (2 subtests) =================
[13:27:39] [PASSED] drm_test_managed_release_action
[13:27:39] [PASSED] drm_test_managed_run_action
[13:27:39] =================== [PASSED] drm_managed ===================
[13:27:39] =================== drm_mm (6 subtests) ====================
[13:27:39] [PASSED] drm_test_mm_init
[13:27:39] [PASSED] drm_test_mm_debug
[13:27:39] [PASSED] drm_test_mm_align32
[13:27:39] [PASSED] drm_test_mm_align64
[13:27:39] [PASSED] drm_test_mm_lowest
[13:27:39] [PASSED] drm_test_mm_highest
[13:27:39] ===================== [PASSED] drm_mm ======================
[13:27:39] ============= drm_modes_analog_tv (4 subtests) =============
[13:27:39] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[13:27:39] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[13:27:39] [PASSED] drm_test_modes_analog_tv_pal_576i
[13:27:39] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[13:27:39] =============== [PASSED] drm_modes_analog_tv ===============
[13:27:39] ============== drm_plane_helper (2 subtests) ===============
[13:27:39] =============== drm_test_check_plane_state  ================
[13:27:39] [PASSED] clipping_simple
[13:27:39] [PASSED] clipping_rotate_reflect
[13:27:39] [PASSED] positioning_simple
[13:27:39] [PASSED] upscaling
[13:27:39] [PASSED] downscaling
[13:27:39] [PASSED] rounding1
[13:27:39] [PASSED] rounding2
[13:27:39] [PASSED] rounding3
[13:27:39] [PASSED] rounding4
[13:27:39] =========== [PASSED] drm_test_check_plane_state ============
[13:27:39] =========== drm_test_check_invalid_plane_state  ============
[13:27:39] [PASSED] positioning_invalid
[13:27:39] [PASSED] upscaling_invalid
[13:27:39] [PASSED] downscaling_invalid
[13:27:39] ======= [PASSED] drm_test_check_invalid_plane_state ========
[13:27:39] ================ [PASSED] drm_plane_helper =================
stty: 'standard input': Inappropriate ioctl for device
[13:27:39] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[13:27:39] ====== drm_test_connector_helper_tv_get_modes_check  =======
[13:27:39] [PASSED] None
[13:27:39] [PASSED] PAL
[13:27:39] [PASSED] NTSC
[13:27:39] [PASSED] Both, NTSC Default
[13:27:39] [PASSED] Both, PAL Default
[13:27:39] [PASSED] Both, NTSC Default, with PAL on command-line
[13:27:39] [PASSED] Both, PAL Default, with NTSC on command-line
[13:27:39] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[13:27:39] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[13:27:39] ================== drm_rect (9 subtests) ===================
[13:27:39] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[13:27:39] [PASSED] drm_test_rect_clip_scaled_not_clipped
[13:27:39] [PASSED] drm_test_rect_clip_scaled_clipped
[13:27:39] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[13:27:39] ================= drm_test_rect_intersect  =================
[13:27:39] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[13:27:39] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[13:27:39] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[13:27:39] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[13:27:39] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[13:27:39] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[13:27:39] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[13:27:39] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[13:27:39] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[13:27:39] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[13:27:39] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[13:27:39] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[13:27:39] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[13:27:39] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[13:27:39] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[13:27:39] ============= [PASSED] drm_test_rect_intersect =============
[13:27:39] ================ drm_test_rect_calc_hscale  ================
[13:27:39] [PASSED] normal use
[13:27:39] [PASSED] out of max range
[13:27:39] [PASSED] out of min range
[13:27:39] [PASSED] zero dst
[13:27:39] [PASSED] negative src
[13:27:39] [PASSED] negative dst
[13:27:39] ============ [PASSED] drm_test_rect_calc_hscale ============
[13:27:39] ================ drm_test_rect_calc_vscale  ================
[13:27:39] [PASSED] normal use
[13:27:39] [PASSED] out of max range
[13:27:39] [PASSED] out of min range
[13:27:39] [PASSED] zero dst
[13:27:39] [PASSED] negative src
[13:27:39] [PASSED] negative dst
[13:27:39] ============ [PASSED] drm_test_rect_calc_vscale ============
[13:27:39] ================== drm_test_rect_rotate  ===================
[13:27:39] [PASSED] reflect-x
[13:27:39] [PASSED] reflect-y
[13:27:39] [PASSED] rotate-0
[13:27:39] [PASSED] rotate-90
[13:27:39] [PASSED] rotate-180
[13:27:39] [PASSED] rotate-270
[13:27:39] ============== [PASSED] drm_test_rect_rotate ===============
[13:27:39] ================ drm_test_rect_rotate_inv  =================
[13:27:39] [PASSED] reflect-x
[13:27:39] [PASSED] reflect-y
[13:27:39] [PASSED] rotate-0
[13:27:39] [PASSED] rotate-90
[13:27:39] [PASSED] rotate-180
[13:27:39] [PASSED] rotate-270
[13:27:39] ============ [PASSED] drm_test_rect_rotate_inv =============
[13:27:39] ==================== [PASSED] drm_rect =====================
[13:27:39] ============================================================
[13:27:39] Testing complete. Ran 511 tests: passed: 511
[13:27:39] Elapsed time: 23.375s total, 1.714s configuring, 21.468s building, 0.190s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


