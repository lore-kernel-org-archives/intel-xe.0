Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA2EC25B78
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 00:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D7710E25E;
	Wed,  5 Jun 2024 00:21:21 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D9010E25E;
 Wed,  5 Jun 2024 00:21:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Access_port_only_aft?=
 =?utf-8?q?er_lock_acquired_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Jun 2024 00:21:18 -0000
Message-ID: <171754687859.2266479.17783880511670920555@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240604104516.766058-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240604104516.766058-1-tejas.upadhyay@intel.com>
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

Series: drm/xe: Access port only after lock acquired (rev2)
URL   : https://patchwork.freedesktop.org/series/134427/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[00:20:22] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:20:27] Building KUnit Kernel ...
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

[00:20:52] Starting KUnit Kernel (1/1)...
[00:20:52] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[00:20:52] =================== guc_dbm (7 subtests) ===================
[00:20:52] [PASSED] test_empty
[00:20:52] [PASSED] test_default
[00:20:52] ======================== test_size  ========================
[00:20:52] [PASSED] 4
[00:20:52] [PASSED] 8
[00:20:52] [PASSED] 32
[00:20:52] [PASSED] 256
[00:20:52] ==================== [PASSED] test_size ====================
[00:20:52] ======================= test_reuse  ========================
[00:20:52] [PASSED] 4
[00:20:52] [PASSED] 8
[00:20:52] [PASSED] 32
[00:20:52] [PASSED] 256
[00:20:52] =================== [PASSED] test_reuse ====================
[00:20:52] =================== test_range_overlap  ====================
[00:20:52] [PASSED] 4
[00:20:52] [PASSED] 8
[00:20:52] [PASSED] 32
[00:20:52] [PASSED] 256
[00:20:52] =============== [PASSED] test_range_overlap ================
[00:20:52] =================== test_range_compact  ====================
[00:20:52] [PASSED] 4
[00:20:52] [PASSED] 8
[00:20:52] [PASSED] 32
[00:20:52] [PASSED] 256
[00:20:52] =============== [PASSED] test_range_compact ================
[00:20:52] ==================== test_range_spare  =====================
[00:20:52] [PASSED] 4
[00:20:52] [PASSED] 8
[00:20:52] [PASSED] 32
[00:20:52] [PASSED] 256
[00:20:52] ================ [PASSED] test_range_spare =================
[00:20:52] ===================== [PASSED] guc_dbm =====================
[00:20:52] =================== guc_idm (6 subtests) ===================
[00:20:52] [PASSED] bad_init
[00:20:52] [PASSED] no_init
[00:20:52] [PASSED] init_fini
[00:20:52] [PASSED] check_used
[00:20:52] [PASSED] check_quota
[00:20:52] [PASSED] check_all
[00:20:52] ===================== [PASSED] guc_idm =====================
[00:20:52] ================== no_relay (3 subtests) ===================
[00:20:52] [PASSED] xe_drops_guc2pf_if_not_ready
[00:20:52] [PASSED] xe_drops_guc2vf_if_not_ready
[00:20:52] [PASSED] xe_rejects_send_if_not_ready
[00:20:52] ==================== [PASSED] no_relay =====================
[00:20:52] ================== pf_relay (14 subtests) ==================
[00:20:52] [PASSED] pf_rejects_guc2pf_too_short
[00:20:52] [PASSED] pf_rejects_guc2pf_too_long
[00:20:52] [PASSED] pf_rejects_guc2pf_no_payload
[00:20:52] [PASSED] pf_fails_no_payload
[00:20:52] [PASSED] pf_fails_bad_origin
[00:20:52] [PASSED] pf_fails_bad_type
[00:20:52] [PASSED] pf_txn_reports_error
[00:20:52] [PASSED] pf_txn_sends_pf2guc
[00:20:52] [PASSED] pf_sends_pf2guc
[00:20:52] [SKIPPED] pf_loopback_nop
[00:20:52] [SKIPPED] pf_loopback_echo
[00:20:52] [SKIPPED] pf_loopback_fail
[00:20:52] [SKIPPED] pf_loopback_busy
[00:20:52] [SKIPPED] pf_loopback_retry
[00:20:52] ==================== [PASSED] pf_relay =====================
[00:20:52] ================== vf_relay (3 subtests) ===================
[00:20:52] [PASSED] vf_rejects_guc2vf_too_short
[00:20:52] [PASSED] vf_rejects_guc2vf_too_long
[00:20:52] [PASSED] vf_rejects_guc2vf_no_payload
[00:20:52] ==================== [PASSED] vf_relay =====================
[00:20:52] ================= pf_service (11 subtests) =================
[00:20:52] [PASSED] pf_negotiate_any
[00:20:52] [PASSED] pf_negotiate_base_match
[00:20:52] [PASSED] pf_negotiate_base_newer
[00:20:52] [PASSED] pf_negotiate_base_next
[00:20:52] [SKIPPED] pf_negotiate_base_older
[00:20:52] [PASSED] pf_negotiate_base_prev
[00:20:52] [PASSED] pf_negotiate_latest_match
[00:20:52] [PASSED] pf_negotiate_latest_newer
[00:20:52] [PASSED] pf_negotiate_latest_next
[00:20:52] [SKIPPED] pf_negotiate_latest_older
[00:20:52] [SKIPPED] pf_negotiate_latest_prev
[00:20:52] =================== [PASSED] pf_service ====================
[00:20:52] ===================== lmtt (1 subtest) =====================
[00:20:52] ======================== test_ops  =========================
[00:20:52] [PASSED] 2-level
[00:20:52] [PASSED] multi-level
[00:20:52] ==================== [PASSED] test_ops =====================
[00:20:52] ====================== [PASSED] lmtt =======================
[00:20:52] ==================== xe_bo (2 subtests) ====================
[00:20:52] [SKIPPED] xe_ccs_migrate_kunit
[00:20:52] [SKIPPED] xe_bo_evict_kunit
[00:20:52] ===================== [SKIPPED] xe_bo ======================
[00:20:52] ================== xe_dma_buf (1 subtest) ==================
[00:20:52] [SKIPPED] xe_dma_buf_kunit
[00:20:52] =================== [SKIPPED] xe_dma_buf ===================
[00:20:52] ================== xe_migrate (1 subtest) ==================
[00:20:52] [SKIPPED] xe_migrate_sanity_kunit
[00:20:52] =================== [SKIPPED] xe_migrate ===================
[00:20:52] =================== xe_mocs (2 subtests) ===================
[00:20:52] [SKIPPED] xe_live_mocs_kernel_kunit
[00:20:52] [SKIPPED] xe_live_mocs_reset_kunit
[00:20:52] ==================== [SKIPPED] xe_mocs =====================
[00:20:52] ==================== args (11 subtests) ====================
[00:20:52] [PASSED] count_args_test
[00:20:52] [PASSED] call_args_example
[00:20:52] [PASSED] call_args_test
[00:20:52] [PASSED] drop_first_arg_example
[00:20:52] [PASSED] drop_first_arg_test
[00:20:52] [PASSED] first_arg_example
[00:20:52] [PASSED] first_arg_test
[00:20:52] [PASSED] last_arg_example
[00:20:52] [PASSED] last_arg_test
[00:20:52] [PASSED] pick_arg_example
[00:20:52] [PASSED] sep_comma_example
[00:20:52] ====================== [PASSED] args =======================
[00:20:52] =================== xe_pci (2 subtests) ====================
[00:20:52] [PASSED] xe_gmdid_graphics_ip
[00:20:52] [PASSED] xe_gmdid_media_ip
[00:20:52] ===================== [PASSED] xe_pci ======================
[00:20:52] ==================== xe_rtp (1 subtest) ====================
[00:20:52] ================== xe_rtp_process_tests  ===================
[00:20:52] [PASSED] coalesce-same-reg
[00:20:52] [PASSED] no-match-no-add
[00:20:52] [PASSED] no-match-no-add-multiple-rules
[00:20:52] [PASSED] two-regs-two-entries
[00:20:52] [PASSED] clr-one-set-other
[00:20:52] [PASSED] set-field
[00:20:52] [PASSED] conflict-duplicate
[00:20:52] [PASSED] conflict-not-disjoint
[00:20:52] [PASSED] conflict-reg-type
[00:20:52] ============== [PASSED] xe_rtp_process_tests ===============
stty: 'standard input': Inappropriate ioctl for device
[00:20:52] ===================== [PASSED] xe_rtp ======================
[00:20:52] ==================== xe_wa (1 subtest) =====================
[00:20:52] ======================== xe_wa_gt  =========================
[00:20:52] [PASSED] TIGERLAKE (B0)
[00:20:52] [PASSED] DG1 (A0)
[00:20:52] [PASSED] DG1 (B0)
[00:20:52] [PASSED] ALDERLAKE_S (A0)
[00:20:52] [PASSED] ALDERLAKE_S (B0)
[00:20:52] [PASSED] ALDERLAKE_S (C0)
[00:20:52] [PASSED] ALDERLAKE_S (D0)
[00:20:52] [PASSED] ALDERLAKE_P (A0)
[00:20:52] [PASSED] ALDERLAKE_P (B0)
[00:20:52] [PASSED] ALDERLAKE_P (C0)
[00:20:52] [PASSED] ALDERLAKE_S_RPLS (D0)
[00:20:52] [PASSED] ALDERLAKE_P_RPLU (E0)
[00:20:52] [PASSED] DG2_G10 (C0)
[00:20:52] [PASSED] DG2_G11 (B1)
[00:20:52] [PASSED] DG2_G12 (A1)
[00:20:52] [PASSED] METEORLAKE (g:A0, m:A0)
[00:20:52] [PASSED] METEORLAKE (g:A0, m:A0)
[00:20:52] [PASSED] METEORLAKE (g:A0, m:A0)
[00:20:52] [PASSED] LUNARLAKE (g:A0, m:A0)
[00:20:52] [PASSED] LUNARLAKE (g:B0, m:A0)
[00:20:52] ==================== [PASSED] xe_wa_gt =====================
[00:20:52] ====================== [PASSED] xe_wa ======================
[00:20:52] ============================================================
[00:20:52] Testing complete. Ran 109 tests: passed: 95, skipped: 14
[00:20:52] Elapsed time: 29.632s total, 4.265s configuring, 25.096s building, 0.221s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[00:20:52] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:20:54] Building KUnit Kernel ...
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

[00:21:15] Starting KUnit Kernel (1/1)...
[00:21:15] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[00:21:15] ============ drm_test_pick_cmdline (2 subtests) ============
[00:21:15] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[00:21:15] =============== drm_test_pick_cmdline_named  ===============
[00:21:15] [PASSED] NTSC
[00:21:15] [PASSED] NTSC-J
[00:21:15] [PASSED] PAL
[00:21:15] [PASSED] PAL-M
[00:21:15] =========== [PASSED] drm_test_pick_cmdline_named ===========
[00:21:15] ============== [PASSED] drm_test_pick_cmdline ==============
[00:21:15] ================== drm_buddy (7 subtests) ==================
[00:21:15] [PASSED] drm_test_buddy_alloc_limit
[00:21:15] [PASSED] drm_test_buddy_alloc_optimistic
[00:21:15] [PASSED] drm_test_buddy_alloc_pessimistic
[00:21:15] [PASSED] drm_test_buddy_alloc_pathological
[00:21:15] [PASSED] drm_test_buddy_alloc_contiguous
[00:21:15] [PASSED] drm_test_buddy_alloc_clear
[00:21:15] [PASSED] drm_test_buddy_alloc_range_bias
[00:21:15] ==================== [PASSED] drm_buddy ====================
[00:21:15] ============= drm_cmdline_parser (40 subtests) =============
[00:21:15] [PASSED] drm_test_cmdline_force_d_only
[00:21:15] [PASSED] drm_test_cmdline_force_D_only_dvi
[00:21:15] [PASSED] drm_test_cmdline_force_D_only_hdmi
[00:21:15] [PASSED] drm_test_cmdline_force_D_only_not_digital
[00:21:15] [PASSED] drm_test_cmdline_force_e_only
[00:21:15] [PASSED] drm_test_cmdline_res
[00:21:15] [PASSED] drm_test_cmdline_res_vesa
[00:21:15] [PASSED] drm_test_cmdline_res_vesa_rblank
[00:21:15] [PASSED] drm_test_cmdline_res_rblank
[00:21:15] [PASSED] drm_test_cmdline_res_bpp
[00:21:15] [PASSED] drm_test_cmdline_res_refresh
[00:21:15] [PASSED] drm_test_cmdline_res_bpp_refresh
[00:21:15] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[00:21:15] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[00:21:15] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[00:21:15] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[00:21:15] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[00:21:15] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[00:21:15] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[00:21:15] [PASSED] drm_test_cmdline_res_margins_force_on
[00:21:15] [PASSED] drm_test_cmdline_res_vesa_margins
[00:21:15] [PASSED] drm_test_cmdline_name
[00:21:15] [PASSED] drm_test_cmdline_name_bpp
[00:21:15] [PASSED] drm_test_cmdline_name_option
[00:21:15] [PASSED] drm_test_cmdline_name_bpp_option
[00:21:15] [PASSED] drm_test_cmdline_rotate_0
[00:21:15] [PASSED] drm_test_cmdline_rotate_90
[00:21:15] [PASSED] drm_test_cmdline_rotate_180
[00:21:15] [PASSED] drm_test_cmdline_rotate_270
[00:21:15] [PASSED] drm_test_cmdline_hmirror
[00:21:15] [PASSED] drm_test_cmdline_vmirror
[00:21:15] [PASSED] drm_test_cmdline_margin_options
[00:21:15] [PASSED] drm_test_cmdline_multiple_options
[00:21:15] [PASSED] drm_test_cmdline_bpp_extra_and_option
[00:21:15] [PASSED] drm_test_cmdline_extra_and_option
[00:21:15] [PASSED] drm_test_cmdline_freestanding_options
[00:21:15] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[00:21:15] [PASSED] drm_test_cmdline_panel_orientation
[00:21:15] ================ drm_test_cmdline_invalid  =================
[00:21:15] [PASSED] margin_only
[00:21:15] [PASSED] interlace_only
[00:21:15] [PASSED] res_missing_x
[00:21:15] [PASSED] res_missing_y
[00:21:15] [PASSED] res_bad_y
[00:21:15] [PASSED] res_missing_y_bpp
[00:21:15] [PASSED] res_bad_bpp
[00:21:15] [PASSED] res_bad_refresh
[00:21:15] [PASSED] res_bpp_refresh_force_on_off
[00:21:15] [PASSED] res_invalid_mode
[00:21:15] [PASSED] res_bpp_wrong_place_mode
[00:21:15] [PASSED] name_bpp_refresh
[00:21:15] [PASSED] name_refresh
[00:21:15] [PASSED] name_refresh_wrong_mode
[00:21:15] [PASSED] name_refresh_invalid_mode
[00:21:15] [PASSED] rotate_multiple
[00:21:15] [PASSED] rotate_invalid_val
[00:21:15] [PASSED] rotate_truncated
[00:21:15] [PASSED] invalid_option
[00:21:15] [PASSED] invalid_tv_option
[00:21:15] [PASSED] truncated_tv_option
[00:21:15] ============ [PASSED] drm_test_cmdline_invalid =============
[00:21:15] =============== drm_test_cmdline_tv_options  ===============
[00:21:15] [PASSED] NTSC
[00:21:15] [PASSED] NTSC_443
[00:21:15] [PASSED] NTSC_J
[00:21:15] [PASSED] PAL
[00:21:15] [PASSED] PAL_M
[00:21:15] [PASSED] PAL_N
[00:21:15] [PASSED] SECAM
[00:21:15] =========== [PASSED] drm_test_cmdline_tv_options ===========
[00:21:15] =============== [PASSED] drm_cmdline_parser ================
[00:21:15] ========== drmm_connector_hdmi_init (19 subtests) ==========
[00:21:15] [PASSED] drm_test_connector_hdmi_init_valid
[00:21:15] [PASSED] drm_test_connector_hdmi_init_bpc_8
[00:21:15] [PASSED] drm_test_connector_hdmi_init_bpc_10
[00:21:15] [PASSED] drm_test_connector_hdmi_init_bpc_12
[00:21:15] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[00:21:15] [PASSED] drm_test_connector_hdmi_init_bpc_null
[00:21:15] [PASSED] drm_test_connector_hdmi_init_formats_empty
[00:21:15] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[00:21:15] [PASSED] drm_test_connector_hdmi_init_null_ddc
[00:21:15] [PASSED] drm_test_connector_hdmi_init_null_product
[00:21:15] [PASSED] drm_test_connector_hdmi_init_null_vendor
[00:21:15] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[00:21:15] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[00:21:15] [PASSED] drm_test_connector_hdmi_init_product_valid
[00:21:15] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[00:21:15] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[00:21:15] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[00:21:15] ========= drm_test_connector_hdmi_init_type_valid  =========
[00:21:15] [PASSED] HDMI-A
[00:21:15] [PASSED] HDMI-B
[00:21:15] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[00:21:15] ======== drm_test_connector_hdmi_init_type_invalid  ========
[00:21:15] [PASSED] Unknown
[00:21:15] [PASSED] VGA
[00:21:15] [PASSED] DVI-I
[00:21:15] [PASSED] DVI-D
[00:21:15] [PASSED] DVI-A
[00:21:15] [PASSED] Composite
[00:21:15] [PASSED] SVIDEO
[00:21:15] [PASSED] LVDS
[00:21:15] [PASSED] Component
[00:21:15] [PASSED] DIN
[00:21:15] [PASSED] DP
[00:21:15] [PASSED] TV
[00:21:15] [PASSED] eDP
[00:21:15] [PASSED] Virtual
[00:21:15] [PASSED] DSI
[00:21:15] [PASSED] DPI
[00:21:15] [PASSED] Writeback
[00:21:15] [PASSED] SPI
[00:21:15] [PASSED] USB
[00:21:15] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[00:21:15] ============ [PASSED] drmm_connector_hdmi_init =============
[00:21:15] ============= drmm_connector_init (3 subtests) =============
[00:21:15] [PASSED] drm_test_drmm_connector_init
[00:21:15] [PASSED] drm_test_drmm_connector_init_null_ddc
[00:21:15] ========= drm_test_drmm_connector_init_type_valid  =========
[00:21:15] [PASSED] Unknown
[00:21:15] [PASSED] VGA
[00:21:15] [PASSED] DVI-I
[00:21:15] [PASSED] DVI-D
[00:21:15] [PASSED] DVI-A
[00:21:15] [PASSED] Composite
[00:21:15] [PASSED] SVIDEO
[00:21:15] [PASSED] LVDS
[00:21:15] [PASSED] Component
[00:21:15] [PASSED] DIN
[00:21:15] [PASSED] DP
[00:21:15] [PASSED] HDMI-A
[00:21:15] [PASSED] HDMI-B
[00:21:15] [PASSED] TV
[00:21:15] [PASSED] eDP
[00:21:15] [PASSED] Virtual
[00:21:15] [PASSED] DSI
[00:21:15] [PASSED] DPI
[00:21:15] [PASSED] Writeback
[00:21:15] [PASSED] SPI
[00:21:15] [PASSED] USB
[00:21:15] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[00:21:15] =============== [PASSED] drmm_connector_init ===============
[00:21:15] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[00:21:15] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[00:21:15] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[00:21:15] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[00:21:15] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[00:21:15] ========== drm_test_get_tv_mode_from_name_valid  ===========
[00:21:15] [PASSED] NTSC
[00:21:15] [PASSED] NTSC-443
[00:21:15] [PASSED] NTSC-J
[00:21:15] [PASSED] PAL
[00:21:15] [PASSED] PAL-M
[00:21:15] [PASSED] PAL-N
[00:21:15] [PASSED] SECAM
[00:21:15] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[00:21:15] [PASSED] drm_test_get_tv_mode_from_name_truncated
[00:21:15] ============ [PASSED] drm_get_tv_mode_from_name ============
[00:21:15] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[00:21:15] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[00:21:15] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[00:21:15] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[00:21:15] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[00:21:15] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[00:21:15] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[00:21:15] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[00:21:15] [PASSED] VIC 96
[00:21:15] [PASSED] VIC 97
[00:21:15] [PASSED] VIC 101
[00:21:15] [PASSED] VIC 102
[00:21:15] [PASSED] VIC 106
[00:21:15] [PASSED] VIC 107
[00:21:15] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[00:21:15] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[00:21:15] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[00:21:15] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[00:21:15] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[00:21:15] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[00:21:15] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[00:21:15] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[00:21:15] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[00:21:15] [PASSED] Automatic
[00:21:15] [PASSED] Full
[00:21:15] [PASSED] Limited 16:235
[00:21:15] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[00:21:15] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[00:21:15] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[00:21:15] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[00:21:15] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[00:21:15] [PASSED] RGB
[00:21:15] [PASSED] YUV 4:2:0
[00:21:15] [PASSED] YUV 4:2:2
[00:21:15] [PASSED] YUV 4:4:4
[00:21:15] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[00:21:16] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[00:21:16] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[00:21:16] ============= drm_damage_helper (21 subtests) ==============
[00:21:16] [PASSED] drm_test_damage_iter_no_damage
[00:21:16] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[00:21:16] [PASSED] drm_test_damage_iter_no_damage_src_moved
[00:21:16] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[00:21:16] [PASSED] drm_test_damage_iter_no_damage_not_visible
[00:21:16] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[00:21:16] [PASSED] drm_test_damage_iter_no_damage_no_fb
[00:21:16] [PASSED] drm_test_damage_iter_simple_damage
[00:21:16] [PASSED] drm_test_damage_iter_single_damage
[00:21:16] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[00:21:16] [PASSED] drm_test_damage_iter_single_damage_outside_src
[00:21:16] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[00:21:16] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[00:21:16] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[00:21:16] [PASSED] drm_test_damage_iter_single_damage_src_moved
[00:21:16] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[00:21:16] [PASSED] drm_test_damage_iter_damage
[00:21:16] [PASSED] drm_test_damage_iter_damage_one_intersect
[00:21:16] [PASSED] drm_test_damage_iter_damage_one_outside
[00:21:16] [PASSED] drm_test_damage_iter_damage_src_moved
[00:21:16] [PASSED] drm_test_damage_iter_damage_not_visible
[00:21:16] ================ [PASSED] drm_damage_helper ================
[00:21:16] ============== drm_dp_mst_helper (3 subtests) ==============
[00:21:16] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[00:21:16] [PASSED] Clock 154000 BPP 30 DSC disabled
[00:21:16] [PASSED] Clock 234000 BPP 30 DSC disabled
[00:21:16] [PASSED] Clock 297000 BPP 24 DSC disabled
[00:21:16] [PASSED] Clock 332880 BPP 24 DSC enabled
[00:21:16] [PASSED] Clock 324540 BPP 24 DSC enabled
[00:21:16] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[00:21:16] ============== drm_test_dp_mst_calc_pbn_div  ===============
[00:21:16] [PASSED] Link rate 2000000 lane count 4
[00:21:16] [PASSED] Link rate 2000000 lane count 2
[00:21:16] [PASSED] Link rate 2000000 lane count 1
[00:21:16] [PASSED] Link rate 1350000 lane count 4
[00:21:16] [PASSED] Link rate 1350000 lane count 2
[00:21:16] [PASSED] Link rate 1350000 lane count 1
[00:21:16] [PASSED] Link rate 1000000 lane count 4
[00:21:16] [PASSED] Link rate 1000000 lane count 2
[00:21:16] [PASSED] Link rate 1000000 lane count 1
[00:21:16] [PASSED] Link rate 810000 lane count 4
[00:21:16] [PASSED] Link rate 810000 lane count 2
[00:21:16] [PASSED] Link rate 810000 lane count 1
[00:21:16] [PASSED] Link rate 540000 lane count 4
[00:21:16] [PASSED] Link rate 540000 lane count 2
[00:21:16] [PASSED] Link rate 540000 lane count 1
[00:21:16] [PASSED] Link rate 270000 lane count 4
[00:21:16] [PASSED] Link rate 270000 lane count 2
[00:21:16] [PASSED] Link rate 270000 lane count 1
[00:21:16] [PASSED] Link rate 162000 lane count 4
[00:21:16] [PASSED] Link rate 162000 lane count 2
[00:21:16] [PASSED] Link rate 162000 lane count 1
[00:21:16] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[00:21:16] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[00:21:16] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[00:21:16] [PASSED] DP_POWER_UP_PHY with port number
[00:21:16] [PASSED] DP_POWER_DOWN_PHY with port number
[00:21:16] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[00:21:16] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[00:21:16] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[00:21:16] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[00:21:16] [PASSED] DP_QUERY_PAYLOAD with port number
[00:21:16] [PASSED] DP_QUERY_PAYLOAD with VCPI
[00:21:16] [PASSED] DP_REMOTE_DPCD_READ with port number
[00:21:16] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[00:21:16] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[00:21:16] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[00:21:16] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[00:21:16] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[00:21:16] [PASSED] DP_REMOTE_I2C_READ with port number
[00:21:16] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[00:21:16] [PASSED] DP_REMOTE_I2C_READ with transactions array
[00:21:16] [PASSED] DP_REMOTE_I2C_WRITE with port number
[00:21:16] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[00:21:16] [PASSED] DP_REMOTE_I2C_WRITE with data array
[00:21:16] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[00:21:16] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[00:21:16] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[00:21:16] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[00:21:16] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[00:21:16] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[00:21:16] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[00:21:16] ================ [PASSED] drm_dp_mst_helper ================
[00:21:16] ================== drm_exec (7 subtests) ===================
[00:21:16] [PASSED] sanitycheck
[00:21:16] [PASSED] test_lock
[00:21:16] [PASSED] test_lock_unlock
[00:21:16] [PASSED] test_duplicates
[00:21:16] [PASSED] test_prepare
[00:21:16] [PASSED] test_prepare_array
[00:21:16] [PASSED] test_multiple_loops
[00:21:16] ==================== [PASSED] drm_exec =====================
[00:21:16] =========== drm_format_helper_test (17 subtests) ===========
[00:21:16] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[00:21:16] [PASSED] single_pixel_source_buffer
[00:21:16] [PASSED] single_pixel_clip_rectangle
[00:21:16] [PASSED] well_known_colors
[00:21:16] [PASSED] destination_pitch
[00:21:16] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[00:21:16] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[00:21:16] [PASSED] single_pixel_source_buffer
[00:21:16] [PASSED] single_pixel_clip_rectangle
[00:21:16] [PASSED] well_known_colors
[00:21:16] [PASSED] destination_pitch
[00:21:16] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[00:21:16] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[00:21:16] [PASSED] single_pixel_source_buffer
[00:21:16] [PASSED] single_pixel_clip_rectangle
[00:21:16] [PASSED] well_known_colors
[00:21:16] [PASSED] destination_pitch
[00:21:16] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[00:21:16] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[00:21:16] [PASSED] single_pixel_source_buffer
[00:21:16] [PASSED] single_pixel_clip_rectangle
[00:21:16] [PASSED] well_known_colors
[00:21:16] [PASSED] destination_pitch
[00:21:16] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[00:21:16] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[00:21:16] [PASSED] single_pixel_source_buffer
[00:21:16] [PASSED] single_pixel_clip_rectangle
[00:21:16] [PASSED] well_known_colors
[00:21:16] [PASSED] destination_pitch
[00:21:16] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[00:21:16] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[00:21:16] [PASSED] single_pixel_source_buffer
[00:21:16] [PASSED] single_pixel_clip_rectangle
[00:21:16] [PASSED] well_known_colors
[00:21:16] [PASSED] destination_pitch
[00:21:16] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[00:21:16] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[00:21:16] [PASSED] single_pixel_source_buffer
[00:21:16] [PASSED] single_pixel_clip_rectangle
[00:21:16] [PASSED] well_known_colors
[00:21:16] [PASSED] destination_pitch
[00:21:16] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[00:21:16] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[00:21:16] [PASSED] single_pixel_source_buffer
[00:21:16] [PASSED] single_pixel_clip_rectangle
[00:21:16] [PASSED] well_known_colors
[00:21:16] [PASSED] destination_pitch
[00:21:16] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[00:21:16] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[00:21:16] [PASSED] single_pixel_source_buffer
[00:21:16] [PASSED] single_pixel_clip_rectangle
[00:21:16] [PASSED] well_known_colors
[00:21:16] [PASSED] destination_pitch
[00:21:16] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[00:21:16] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[00:21:16] [PASSED] single_pixel_source_buffer
[00:21:16] [PASSED] single_pixel_clip_rectangle
[00:21:16] [PASSED] well_known_colors
[00:21:16] [PASSED] destination_pitch
[00:21:16] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[00:21:16] ============== drm_test_fb_xrgb8888_to_mono  ===============
[00:21:16] [PASSED] single_pixel_source_buffer
[00:21:16] [PASSED] single_pixel_clip_rectangle
[00:21:16] [PASSED] well_known_colors
[00:21:16] [PASSED] destination_pitch
[00:21:16] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[00:21:16] ==================== drm_test_fb_swab  =====================
[00:21:16] [PASSED] single_pixel_source_buffer
[00:21:16] [PASSED] single_pixel_clip_rectangle
[00:21:16] [PASSED] well_known_colors
[00:21:16] [PASSED] destination_pitch
[00:21:16] ================ [PASSED] drm_test_fb_swab =================
[00:21:16] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[00:21:16] [PASSED] single_pixel_source_buffer
[00:21:16] [PASSED] single_pixel_clip_rectangle
[00:21:16] [PASSED] well_known_colors
[00:21:16] [PASSED] destination_pitch
[00:21:16] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[00:21:16] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[00:21:16] [PASSED] single_pixel_source_buffer
[00:21:16] [PASSED] single_pixel_clip_rectangle
[00:21:16] [PASSED] well_known_colors
[00:21:16] [PASSED] destination_pitch
[00:21:16] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[00:21:16] ================= drm_test_fb_clip_offset  =================
[00:21:16] [PASSED] pass through
[00:21:16] [PASSED] horizontal offset
[00:21:16] [PASSED] vertical offset
[00:21:16] [PASSED] horizontal and vertical offset
[00:21:16] [PASSED] horizontal offset (custom pitch)
[00:21:16] [PASSED] vertical offset (custom pitch)
[00:21:16] [PASSED] horizontal and vertical offset (custom pitch)
[00:21:16] ============= [PASSED] drm_test_fb_clip_offset =============
[00:21:16] ============== drm_test_fb_build_fourcc_list  ==============
[00:21:16] [PASSED] no native formats
[00:21:16] [PASSED] XRGB8888 as native format
[00:21:16] [PASSED] remove duplicates
[00:21:16] [PASSED] convert alpha formats
[00:21:16] [PASSED] random formats
[00:21:16] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[00:21:16] =================== drm_test_fb_memcpy  ====================
[00:21:16] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[00:21:16] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[00:21:16] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[00:21:16] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[00:21:16] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[00:21:16] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[00:21:16] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[00:21:16] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[00:21:16] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[00:21:16] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[00:21:16] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[00:21:16] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[00:21:16] =============== [PASSED] drm_test_fb_memcpy ================
[00:21:16] ============= [PASSED] drm_format_helper_test ==============
[00:21:16] ================= drm_format (18 subtests) =================
[00:21:16] [PASSED] drm_test_format_block_width_invalid
[00:21:16] [PASSED] drm_test_format_block_width_one_plane
[00:21:16] [PASSED] drm_test_format_block_width_two_plane
[00:21:16] [PASSED] drm_test_format_block_width_three_plane
[00:21:16] [PASSED] drm_test_format_block_width_tiled
[00:21:16] [PASSED] drm_test_format_block_height_invalid
[00:21:16] [PASSED] drm_test_format_block_height_one_plane
[00:21:16] [PASSED] drm_test_format_block_height_two_plane
[00:21:16] [PASSED] drm_test_format_block_height_three_plane
[00:21:16] [PASSED] drm_test_format_block_height_tiled
[00:21:16] [PASSED] drm_test_format_min_pitch_invalid
[00:21:16] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[00:21:16] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[00:21:16] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[00:21:16] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[00:21:16] [PASSED] drm_test_format_min_pitch_two_plane
[00:21:16] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[00:21:16] [PASSED] drm_test_format_min_pitch_tiled
[00:21:16] =================== [PASSED] drm_format ====================
[00:21:16] =============== drm_framebuffer (1 subtest) ================
[00:21:16] =============== drm_test_framebuffer_create  ===============
[00:21:16] [PASSED] ABGR8888 normal sizes
[00:21:16] [PASSED] ABGR8888 max sizes
[00:21:16] [PASSED] ABGR8888 pitch greater than min required
[00:21:16] [PASSED] ABGR8888 pitch less than min required
[00:21:16] [PASSED] ABGR8888 Invalid width
[00:21:16] [PASSED] ABGR8888 Invalid buffer handle
[00:21:16] [PASSED] No pixel format
[00:21:16] [PASSED] ABGR8888 Width 0
[00:21:16] [PASSED] ABGR8888 Height 0
[00:21:16] [PASSED] ABGR8888 Out of bound height * pitch combination
[00:21:16] [PASSED] ABGR8888 Large buffer offset
[00:21:16] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[00:21:16] [PASSED] ABGR8888 Valid buffer modifier
[00:21:16] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[00:21:16] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[00:21:16] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[00:21:16] [PASSED] NV12 Normal sizes
[00:21:16] [PASSED] NV12 Max sizes
[00:21:16] [PASSED] NV12 Invalid pitch
[00:21:16] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[00:21:16] [PASSED] NV12 different  modifier per-plane
[00:21:16] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[00:21:16] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[00:21:16] [PASSED] NV12 Modifier for inexistent plane
[00:21:16] [PASSED] NV12 Handle for inexistent plane
[00:21:16] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[00:21:16] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[00:21:16] [PASSED] YVU420 Normal sizes
[00:21:16] [PASSED] YVU420 Max sizes
[00:21:16] [PASSED] YVU420 Invalid pitch
[00:21:16] [PASSED] YVU420 Different pitches
[00:21:16] [PASSED] YVU420 Different buffer offsets/pitches
[00:21:16] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[00:21:16] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[00:21:16] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[00:21:16] [PASSED] YVU420 Valid modifier
[00:21:16] [PASSED] YVU420 Different modifiers per plane
[00:21:16] [PASSED] YVU420 Modifier for inexistent plane
[00:21:16] [PASSED] X0L2 Normal sizes
[00:21:16] [PASSED] X0L2 Max sizes
[00:21:16] [PASSED] X0L2 Invalid pitch
[00:21:16] [PASSED] X0L2 Pitch greater than minimum required
[00:21:16] [PASSED] X0L2 Handle for inexistent plane
[00:21:16] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[00:21:16] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[00:21:16] [PASSED] X0L2 Valid modifier
[00:21:16] [PASSED] X0L2 Modifier for inexistent plane
[00:21:16] =========== [PASSED] drm_test_framebuffer_create ===========
[00:21:16] ================= [PASSED] drm_framebuffer =================
[00:21:16] ================ drm_gem_shmem (8 subtests) ================
[00:21:16] [PASSED] drm_gem_shmem_test_obj_create
[00:21:16] [PASSED] drm_gem_shmem_test_obj_create_private
[00:21:16] [PASSED] drm_gem_shmem_test_pin_pages
[00:21:16] [PASSED] drm_gem_shmem_test_vmap
[00:21:16] [PASSED] drm_gem_shmem_test_get_pages_sgt
[00:21:16] [PASSED] drm_gem_shmem_test_get_sg_table
[00:21:16] [PASSED] drm_gem_shmem_test_madvise
[00:21:16] [PASSED] drm_gem_shmem_test_purge
[00:21:16] ================== [PASSED] drm_gem_shmem ==================
[00:21:16] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[00:21:16] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[00:21:16] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[00:21:16] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[00:21:16] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[00:21:16] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[00:21:16] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[00:21:16] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[00:21:16] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[00:21:16] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[00:21:16] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[00:21:16] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[00:21:16] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[00:21:16] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[00:21:16] [PASSED] drm_test_check_output_bpc_dvi
[00:21:16] [PASSED] drm_test_check_output_bpc_format_vic_1
[00:21:16] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[00:21:16] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[00:21:16] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[00:21:16] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[00:21:16] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[00:21:16] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[00:21:16] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[00:21:16] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[00:21:16] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[00:21:16] [PASSED] drm_test_check_broadcast_rgb_value
[00:21:16] [PASSED] drm_test_check_bpc_8_value
[00:21:16] [PASSED] drm_test_check_bpc_10_value
[00:21:16] [PASSED] drm_test_check_bpc_12_value
[00:21:16] [PASSED] drm_test_check_format_value
[00:21:16] [PASSED] drm_test_check_tmds_char_value
[00:21:16] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[00:21:16] ================= drm_managed (2 subtests) =================
[00:21:16] [PASSED] drm_test_managed_release_action
[00:21:16] [PASSED] drm_test_managed_run_action
[00:21:16] =================== [PASSED] drm_managed ===================
[00:21:16] =================== drm_mm (6 subtests) ====================
[00:21:16] [PASSED] drm_test_mm_init
[00:21:16] [PASSED] drm_test_mm_debug
[00:21:16] [PASSED] drm_test_mm_align32
[00:21:16] [PASSED] drm_test_mm_align64
[00:21:16] [PASSED] drm_test_mm_lowest
[00:21:16] [PASSED] drm_test_mm_highest
[00:21:16] ===================== [PASSED] drm_mm ======================
[00:21:16] ============= drm_modes_analog_tv (4 subtests) =============
[00:21:16] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[00:21:16] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[00:21:16] [PASSED] drm_test_modes_analog_tv_pal_576i
[00:21:16] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[00:21:16] =============== [PASSED] drm_modes_analog_tv ===============
[00:21:16] ============== drm_plane_helper (2 subtests) ===============
[00:21:16] =============== drm_test_check_plane_state  ================
[00:21:16] [PASSED] clipping_simple
[00:21:16] [PASSED] clipping_rotate_reflect
[00:21:16] [PASSED] positioning_simple
[00:21:16] [PASSED] upscaling
[00:21:16] [PASSED] downscaling
[00:21:16] [PASSED] rounding1
[00:21:16] [PASSED] rounding2
[00:21:16] [PASSED] rounding3
[00:21:16] [PASSED] rounding4
[00:21:16] =========== [PASSED] drm_test_check_plane_state ============
[00:21:16] =========== drm_test_check_invalid_plane_state  ============
[00:21:16] [PASSED] positioning_invalid
[00:21:16] [PASSED] upscaling_invalid
[00:21:16] [PASSED] downscaling_invalid
[00:21:16] ======= [PASSED] drm_test_check_invalid_plane_state ========
[00:21:16] ================ [PASSED] drm_plane_helper =================
stty: 'standard input': Inappropriate ioctl for device
[00:21:16] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[00:21:16] ====== drm_test_connector_helper_tv_get_modes_check  =======
[00:21:16] [PASSED] None
[00:21:16] [PASSED] PAL
[00:21:16] [PASSED] NTSC
[00:21:16] [PASSED] Both, NTSC Default
[00:21:16] [PASSED] Both, PAL Default
[00:21:16] [PASSED] Both, NTSC Default, with PAL on command-line
[00:21:16] [PASSED] Both, PAL Default, with NTSC on command-line
[00:21:16] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[00:21:16] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[00:21:16] ================== drm_rect (9 subtests) ===================
[00:21:16] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[00:21:16] [PASSED] drm_test_rect_clip_scaled_not_clipped
[00:21:16] [PASSED] drm_test_rect_clip_scaled_clipped
[00:21:16] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[00:21:16] ================= drm_test_rect_intersect  =================
[00:21:16] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[00:21:16] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[00:21:16] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[00:21:16] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[00:21:16] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[00:21:16] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[00:21:16] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[00:21:16] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[00:21:16] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[00:21:16] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[00:21:16] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[00:21:16] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[00:21:16] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[00:21:16] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[00:21:16] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[00:21:16] ============= [PASSED] drm_test_rect_intersect =============
[00:21:16] ================ drm_test_rect_calc_hscale  ================
[00:21:16] [PASSED] normal use
[00:21:16] [PASSED] out of max range
[00:21:16] [PASSED] out of min range
[00:21:16] [PASSED] zero dst
[00:21:16] [PASSED] negative src
[00:21:16] [PASSED] negative dst
[00:21:16] ============ [PASSED] drm_test_rect_calc_hscale ============
[00:21:16] ================ drm_test_rect_calc_vscale  ================
[00:21:16] [PASSED] normal use
[00:21:16] [PASSED] out of max range
[00:21:16] [PASSED] out of min range
[00:21:16] [PASSED] zero dst
[00:21:16] [PASSED] negative src
[00:21:16] [PASSED] negative dst
[00:21:16] ============ [PASSED] drm_test_rect_calc_vscale ============
[00:21:16] ================== drm_test_rect_rotate  ===================
[00:21:16] [PASSED] reflect-x
[00:21:16] [PASSED] reflect-y
[00:21:16] [PASSED] rotate-0
[00:21:16] [PASSED] rotate-90
[00:21:16] [PASSED] rotate-180
[00:21:16] [PASSED] rotate-270
[00:21:16] ============== [PASSED] drm_test_rect_rotate ===============
[00:21:16] ================ drm_test_rect_rotate_inv  =================
[00:21:16] [PASSED] reflect-x
[00:21:16] [PASSED] reflect-y
[00:21:16] [PASSED] rotate-0
[00:21:16] [PASSED] rotate-90
[00:21:16] [PASSED] rotate-180
[00:21:16] [PASSED] rotate-270
[00:21:16] ============ [PASSED] drm_test_rect_rotate_inv =============
[00:21:16] ==================== [PASSED] drm_rect =====================
[00:21:16] ============================================================
[00:21:16] Testing complete. Ran 511 tests: passed: 511
[00:21:16] Elapsed time: 23.399s total, 1.726s configuring, 21.480s building, 0.190s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


