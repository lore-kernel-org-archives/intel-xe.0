Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C683C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 17:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F97C10EC1A;
	Fri,  7 Jun 2024 17:32:24 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6852410EC1A;
 Fri,  7 Jun 2024 17:32:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?b?4pyTIENJLktVbml0OiBzdWNjZXNzIGZvciBkcm0veGU6IEludHJvZHVjZSB4ZV9n?=
 =?utf-8?b?dF9kYmdfcHJpbnRlcigp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Jun 2024 17:32:22 -0000
Message-ID: <171778154242.27586.13683009462390331752@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240607172607.1680-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240607172607.1680-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Introduce xe_gt_dbg_printer()
URL   : https://patchwork.freedesktop.org/series/134630/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[17:31:26] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:31:30] Building KUnit Kernel ...
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

[17:31:56] Starting KUnit Kernel (1/1)...
[17:31:56] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:31:56] =================== guc_dbm (7 subtests) ===================
[17:31:56] [PASSED] test_empty
[17:31:56] [PASSED] test_default
[17:31:56] ======================== test_size  ========================
[17:31:56] [PASSED] 4
[17:31:56] [PASSED] 8
[17:31:56] [PASSED] 32
[17:31:56] [PASSED] 256
[17:31:56] ==================== [PASSED] test_size ====================
[17:31:56] ======================= test_reuse  ========================
[17:31:56] [PASSED] 4
[17:31:56] [PASSED] 8
[17:31:56] [PASSED] 32
[17:31:56] [PASSED] 256
[17:31:56] =================== [PASSED] test_reuse ====================
[17:31:56] =================== test_range_overlap  ====================
[17:31:56] [PASSED] 4
[17:31:56] [PASSED] 8
[17:31:56] [PASSED] 32
[17:31:56] [PASSED] 256
[17:31:56] =============== [PASSED] test_range_overlap ================
[17:31:56] =================== test_range_compact  ====================
[17:31:56] [PASSED] 4
[17:31:56] [PASSED] 8
[17:31:56] [PASSED] 32
[17:31:56] [PASSED] 256
[17:31:56] =============== [PASSED] test_range_compact ================
[17:31:56] ==================== test_range_spare  =====================
[17:31:56] [PASSED] 4
[17:31:56] [PASSED] 8
[17:31:56] [PASSED] 32
[17:31:56] [PASSED] 256
[17:31:56] ================ [PASSED] test_range_spare =================
[17:31:56] ===================== [PASSED] guc_dbm =====================
[17:31:56] =================== guc_idm (6 subtests) ===================
[17:31:56] [PASSED] bad_init
[17:31:56] [PASSED] no_init
[17:31:56] [PASSED] init_fini
[17:31:56] [PASSED] check_used
[17:31:56] [PASSED] check_quota
[17:31:56] [PASSED] check_all
[17:31:56] ===================== [PASSED] guc_idm =====================
[17:31:56] ================== no_relay (3 subtests) ===================
[17:31:56] [PASSED] xe_drops_guc2pf_if_not_ready
[17:31:56] [PASSED] xe_drops_guc2vf_if_not_ready
[17:31:56] [PASSED] xe_rejects_send_if_not_ready
[17:31:56] ==================== [PASSED] no_relay =====================
[17:31:56] ================== pf_relay (14 subtests) ==================
[17:31:56] [PASSED] pf_rejects_guc2pf_too_short
[17:31:56] [PASSED] pf_rejects_guc2pf_too_long
[17:31:56] [PASSED] pf_rejects_guc2pf_no_payload
[17:31:56] [PASSED] pf_fails_no_payload
[17:31:56] [PASSED] pf_fails_bad_origin
[17:31:56] [PASSED] pf_fails_bad_type
[17:31:56] [PASSED] pf_txn_reports_error
[17:31:56] [PASSED] pf_txn_sends_pf2guc
[17:31:56] [PASSED] pf_sends_pf2guc
[17:31:56] [SKIPPED] pf_loopback_nop
[17:31:56] [SKIPPED] pf_loopback_echo
[17:31:56] [SKIPPED] pf_loopback_fail
[17:31:56] [SKIPPED] pf_loopback_busy
[17:31:56] [SKIPPED] pf_loopback_retry
[17:31:56] ==================== [PASSED] pf_relay =====================
[17:31:56] ================== vf_relay (3 subtests) ===================
[17:31:56] [PASSED] vf_rejects_guc2vf_too_short
[17:31:56] [PASSED] vf_rejects_guc2vf_too_long
[17:31:56] [PASSED] vf_rejects_guc2vf_no_payload
[17:31:56] ==================== [PASSED] vf_relay =====================
[17:31:56] ================= pf_service (11 subtests) =================
[17:31:56] [PASSED] pf_negotiate_any
[17:31:56] [PASSED] pf_negotiate_base_match
[17:31:56] [PASSED] pf_negotiate_base_newer
[17:31:56] [PASSED] pf_negotiate_base_next
[17:31:56] [SKIPPED] pf_negotiate_base_older
[17:31:56] [PASSED] pf_negotiate_base_prev
[17:31:56] [PASSED] pf_negotiate_latest_match
[17:31:56] [PASSED] pf_negotiate_latest_newer
[17:31:56] [PASSED] pf_negotiate_latest_next
[17:31:56] [SKIPPED] pf_negotiate_latest_older
[17:31:56] [SKIPPED] pf_negotiate_latest_prev
[17:31:56] =================== [PASSED] pf_service ====================
[17:31:56] ===================== lmtt (1 subtest) =====================
[17:31:56] ======================== test_ops  =========================
[17:31:56] [PASSED] 2-level
[17:31:56] [PASSED] multi-level
[17:31:56] ==================== [PASSED] test_ops =====================
[17:31:56] ====================== [PASSED] lmtt =======================
[17:31:56] ==================== xe_bo (2 subtests) ====================
[17:31:56] [SKIPPED] xe_ccs_migrate_kunit
[17:31:56] [SKIPPED] xe_bo_evict_kunit
[17:31:56] ===================== [SKIPPED] xe_bo ======================
[17:31:56] ================== xe_dma_buf (1 subtest) ==================
[17:31:56] [SKIPPED] xe_dma_buf_kunit
[17:31:56] =================== [SKIPPED] xe_dma_buf ===================
[17:31:56] ================== xe_migrate (1 subtest) ==================
[17:31:56] [SKIPPED] xe_migrate_sanity_kunit
[17:31:56] =================== [SKIPPED] xe_migrate ===================
[17:31:56] =================== xe_mocs (2 subtests) ===================
[17:31:56] [SKIPPED] xe_live_mocs_kernel_kunit
[17:31:56] [SKIPPED] xe_live_mocs_reset_kunit
[17:31:56] ==================== [SKIPPED] xe_mocs =====================
[17:31:56] ==================== args (11 subtests) ====================
[17:31:56] [PASSED] count_args_test
[17:31:56] [PASSED] call_args_example
[17:31:56] [PASSED] call_args_test
[17:31:56] [PASSED] drop_first_arg_example
[17:31:56] [PASSED] drop_first_arg_test
[17:31:56] [PASSED] first_arg_example
[17:31:56] [PASSED] first_arg_test
[17:31:56] [PASSED] last_arg_example
[17:31:56] [PASSED] last_arg_test
[17:31:56] [PASSED] pick_arg_example
[17:31:56] [PASSED] sep_comma_example
[17:31:56] ====================== [PASSED] args =======================
[17:31:56] =================== xe_pci (2 subtests) ====================
[17:31:56] [PASSED] xe_gmdid_graphics_ip
[17:31:56] [PASSED] xe_gmdid_media_ip
[17:31:56] ===================== [PASSED] xe_pci ======================
[17:31:56] ==================== xe_rtp (1 subtest) ====================
[17:31:56] ================== xe_rtp_process_tests  ===================
[17:31:56] [PASSED] coalesce-same-reg
[17:31:56] [PASSED] no-match-no-add
[17:31:56] [PASSED] no-match-no-add-multiple-rules
[17:31:56] [PASSED] two-regs-two-entries
[17:31:56] [PASSED] clr-one-set-other
[17:31:56] [PASSED] set-field
[17:31:56] [PASSED] conflict-duplicate
[17:31:56] [PASSED] conflict-not-disjoint
[17:31:56] [PASSED] conflict-reg-type
[17:31:56] ============== [PASSED] xe_rtp_process_tests ===============
stty: 'standard input': Inappropriate ioctl for device
[17:31:56] ===================== [PASSED] xe_rtp ======================
[17:31:56] ==================== xe_wa (1 subtest) =====================
[17:31:56] ======================== xe_wa_gt  =========================
[17:31:56] [PASSED] TIGERLAKE (B0)
[17:31:56] [PASSED] DG1 (A0)
[17:31:56] [PASSED] DG1 (B0)
[17:31:56] [PASSED] ALDERLAKE_S (A0)
[17:31:56] [PASSED] ALDERLAKE_S (B0)
[17:31:56] [PASSED] ALDERLAKE_S (C0)
[17:31:56] [PASSED] ALDERLAKE_S (D0)
[17:31:56] [PASSED] ALDERLAKE_P (A0)
[17:31:56] [PASSED] ALDERLAKE_P (B0)
[17:31:56] [PASSED] ALDERLAKE_P (C0)
[17:31:56] [PASSED] ALDERLAKE_S_RPLS (D0)
[17:31:56] [PASSED] ALDERLAKE_P_RPLU (E0)
[17:31:56] [PASSED] DG2_G10 (C0)
[17:31:56] [PASSED] DG2_G11 (B1)
[17:31:56] [PASSED] DG2_G12 (A1)
[17:31:56] [PASSED] METEORLAKE (g:A0, m:A0)
[17:31:56] [PASSED] METEORLAKE (g:A0, m:A0)
[17:31:56] [PASSED] METEORLAKE (g:A0, m:A0)
[17:31:56] [PASSED] LUNARLAKE (g:A0, m:A0)
[17:31:56] [PASSED] LUNARLAKE (g:B0, m:A0)
[17:31:56] ==================== [PASSED] xe_wa_gt =====================
[17:31:56] ====================== [PASSED] xe_wa ======================
[17:31:56] ============================================================
[17:31:56] Testing complete. Ran 109 tests: passed: 95, skipped: 14
[17:31:56] Elapsed time: 29.690s total, 4.239s configuring, 25.181s building, 0.225s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[17:31:56] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:31:58] Building KUnit Kernel ...
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

[17:32:19] Starting KUnit Kernel (1/1)...
[17:32:19] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:32:19] ============ drm_test_pick_cmdline (2 subtests) ============
[17:32:19] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[17:32:19] =============== drm_test_pick_cmdline_named  ===============
[17:32:19] [PASSED] NTSC
[17:32:19] [PASSED] NTSC-J
[17:32:19] [PASSED] PAL
[17:32:19] [PASSED] PAL-M
[17:32:19] =========== [PASSED] drm_test_pick_cmdline_named ===========
[17:32:19] ============== [PASSED] drm_test_pick_cmdline ==============
[17:32:19] ================== drm_buddy (7 subtests) ==================
[17:32:19] [PASSED] drm_test_buddy_alloc_limit
[17:32:19] [PASSED] drm_test_buddy_alloc_optimistic
[17:32:19] [PASSED] drm_test_buddy_alloc_pessimistic
[17:32:19] [PASSED] drm_test_buddy_alloc_pathological
[17:32:19] [PASSED] drm_test_buddy_alloc_contiguous
[17:32:19] [PASSED] drm_test_buddy_alloc_clear
[17:32:19] [PASSED] drm_test_buddy_alloc_range_bias
[17:32:19] ==================== [PASSED] drm_buddy ====================
[17:32:19] ============= drm_cmdline_parser (40 subtests) =============
[17:32:19] [PASSED] drm_test_cmdline_force_d_only
[17:32:19] [PASSED] drm_test_cmdline_force_D_only_dvi
[17:32:19] [PASSED] drm_test_cmdline_force_D_only_hdmi
[17:32:19] [PASSED] drm_test_cmdline_force_D_only_not_digital
[17:32:19] [PASSED] drm_test_cmdline_force_e_only
[17:32:19] [PASSED] drm_test_cmdline_res
[17:32:19] [PASSED] drm_test_cmdline_res_vesa
[17:32:19] [PASSED] drm_test_cmdline_res_vesa_rblank
[17:32:19] [PASSED] drm_test_cmdline_res_rblank
[17:32:19] [PASSED] drm_test_cmdline_res_bpp
[17:32:19] [PASSED] drm_test_cmdline_res_refresh
[17:32:19] [PASSED] drm_test_cmdline_res_bpp_refresh
[17:32:19] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[17:32:19] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[17:32:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[17:32:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[17:32:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[17:32:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[17:32:19] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[17:32:19] [PASSED] drm_test_cmdline_res_margins_force_on
[17:32:19] [PASSED] drm_test_cmdline_res_vesa_margins
[17:32:19] [PASSED] drm_test_cmdline_name
[17:32:19] [PASSED] drm_test_cmdline_name_bpp
[17:32:19] [PASSED] drm_test_cmdline_name_option
[17:32:19] [PASSED] drm_test_cmdline_name_bpp_option
[17:32:19] [PASSED] drm_test_cmdline_rotate_0
[17:32:19] [PASSED] drm_test_cmdline_rotate_90
[17:32:19] [PASSED] drm_test_cmdline_rotate_180
[17:32:19] [PASSED] drm_test_cmdline_rotate_270
[17:32:19] [PASSED] drm_test_cmdline_hmirror
[17:32:19] [PASSED] drm_test_cmdline_vmirror
[17:32:19] [PASSED] drm_test_cmdline_margin_options
[17:32:19] [PASSED] drm_test_cmdline_multiple_options
[17:32:19] [PASSED] drm_test_cmdline_bpp_extra_and_option
[17:32:19] [PASSED] drm_test_cmdline_extra_and_option
[17:32:19] [PASSED] drm_test_cmdline_freestanding_options
[17:32:19] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[17:32:19] [PASSED] drm_test_cmdline_panel_orientation
[17:32:19] ================ drm_test_cmdline_invalid  =================
[17:32:19] [PASSED] margin_only
[17:32:19] [PASSED] interlace_only
[17:32:19] [PASSED] res_missing_x
[17:32:19] [PASSED] res_missing_y
[17:32:19] [PASSED] res_bad_y
[17:32:19] [PASSED] res_missing_y_bpp
[17:32:19] [PASSED] res_bad_bpp
[17:32:19] [PASSED] res_bad_refresh
[17:32:19] [PASSED] res_bpp_refresh_force_on_off
[17:32:19] [PASSED] res_invalid_mode
[17:32:19] [PASSED] res_bpp_wrong_place_mode
[17:32:19] [PASSED] name_bpp_refresh
[17:32:19] [PASSED] name_refresh
[17:32:19] [PASSED] name_refresh_wrong_mode
[17:32:19] [PASSED] name_refresh_invalid_mode
[17:32:19] [PASSED] rotate_multiple
[17:32:19] [PASSED] rotate_invalid_val
[17:32:19] [PASSED] rotate_truncated
[17:32:19] [PASSED] invalid_option
[17:32:19] [PASSED] invalid_tv_option
[17:32:19] [PASSED] truncated_tv_option
[17:32:19] ============ [PASSED] drm_test_cmdline_invalid =============
[17:32:19] =============== drm_test_cmdline_tv_options  ===============
[17:32:19] [PASSED] NTSC
[17:32:19] [PASSED] NTSC_443
[17:32:19] [PASSED] NTSC_J
[17:32:19] [PASSED] PAL
[17:32:19] [PASSED] PAL_M
[17:32:19] [PASSED] PAL_N
[17:32:19] [PASSED] SECAM
[17:32:19] =========== [PASSED] drm_test_cmdline_tv_options ===========
[17:32:19] =============== [PASSED] drm_cmdline_parser ================
[17:32:19] ========== drmm_connector_hdmi_init (19 subtests) ==========
[17:32:19] [PASSED] drm_test_connector_hdmi_init_valid
[17:32:19] [PASSED] drm_test_connector_hdmi_init_bpc_8
[17:32:19] [PASSED] drm_test_connector_hdmi_init_bpc_10
[17:32:19] [PASSED] drm_test_connector_hdmi_init_bpc_12
[17:32:19] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[17:32:19] [PASSED] drm_test_connector_hdmi_init_bpc_null
[17:32:19] [PASSED] drm_test_connector_hdmi_init_formats_empty
[17:32:19] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[17:32:19] [PASSED] drm_test_connector_hdmi_init_null_ddc
[17:32:19] [PASSED] drm_test_connector_hdmi_init_null_product
[17:32:19] [PASSED] drm_test_connector_hdmi_init_null_vendor
[17:32:19] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[17:32:19] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[17:32:19] [PASSED] drm_test_connector_hdmi_init_product_valid
[17:32:19] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[17:32:19] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[17:32:19] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[17:32:19] ========= drm_test_connector_hdmi_init_type_valid  =========
[17:32:19] [PASSED] HDMI-A
[17:32:19] [PASSED] HDMI-B
[17:32:19] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[17:32:19] ======== drm_test_connector_hdmi_init_type_invalid  ========
[17:32:19] [PASSED] Unknown
[17:32:19] [PASSED] VGA
[17:32:19] [PASSED] DVI-I
[17:32:19] [PASSED] DVI-D
[17:32:19] [PASSED] DVI-A
[17:32:19] [PASSED] Composite
[17:32:19] [PASSED] SVIDEO
[17:32:19] [PASSED] LVDS
[17:32:19] [PASSED] Component
[17:32:19] [PASSED] DIN
[17:32:19] [PASSED] DP
[17:32:19] [PASSED] TV
[17:32:19] [PASSED] eDP
[17:32:19] [PASSED] Virtual
[17:32:19] [PASSED] DSI
[17:32:19] [PASSED] DPI
[17:32:19] [PASSED] Writeback
[17:32:19] [PASSED] SPI
[17:32:19] [PASSED] USB
[17:32:19] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[17:32:19] ============ [PASSED] drmm_connector_hdmi_init =============
[17:32:19] ============= drmm_connector_init (3 subtests) =============
[17:32:19] [PASSED] drm_test_drmm_connector_init
[17:32:19] [PASSED] drm_test_drmm_connector_init_null_ddc
[17:32:19] ========= drm_test_drmm_connector_init_type_valid  =========
[17:32:19] [PASSED] Unknown
[17:32:19] [PASSED] VGA
[17:32:19] [PASSED] DVI-I
[17:32:19] [PASSED] DVI-D
[17:32:19] [PASSED] DVI-A
[17:32:19] [PASSED] Composite
[17:32:19] [PASSED] SVIDEO
[17:32:19] [PASSED] LVDS
[17:32:19] [PASSED] Component
[17:32:19] [PASSED] DIN
[17:32:19] [PASSED] DP
[17:32:19] [PASSED] HDMI-A
[17:32:19] [PASSED] HDMI-B
[17:32:19] [PASSED] TV
[17:32:19] [PASSED] eDP
[17:32:19] [PASSED] Virtual
[17:32:19] [PASSED] DSI
[17:32:19] [PASSED] DPI
[17:32:19] [PASSED] Writeback
[17:32:19] [PASSED] SPI
[17:32:19] [PASSED] USB
[17:32:19] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[17:32:19] =============== [PASSED] drmm_connector_init ===============
[17:32:19] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[17:32:19] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[17:32:19] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[17:32:19] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[17:32:19] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[17:32:19] ========== drm_test_get_tv_mode_from_name_valid  ===========
[17:32:19] [PASSED] NTSC
[17:32:19] [PASSED] NTSC-443
[17:32:19] [PASSED] NTSC-J
[17:32:19] [PASSED] PAL
[17:32:19] [PASSED] PAL-M
[17:32:19] [PASSED] PAL-N
[17:32:19] [PASSED] SECAM
[17:32:19] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[17:32:19] [PASSED] drm_test_get_tv_mode_from_name_truncated
[17:32:19] ============ [PASSED] drm_get_tv_mode_from_name ============
[17:32:19] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[17:32:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[17:32:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[17:32:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[17:32:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[17:32:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[17:32:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[17:32:19] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[17:32:19] [PASSED] VIC 96
[17:32:19] [PASSED] VIC 97
[17:32:19] [PASSED] VIC 101
[17:32:19] [PASSED] VIC 102
[17:32:19] [PASSED] VIC 106
[17:32:19] [PASSED] VIC 107
[17:32:19] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[17:32:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[17:32:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[17:32:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[17:32:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[17:32:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[17:32:19] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[17:32:19] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[17:32:19] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[17:32:19] [PASSED] Automatic
[17:32:19] [PASSED] Full
[17:32:19] [PASSED] Limited 16:235
[17:32:19] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[17:32:19] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[17:32:19] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[17:32:19] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[17:32:19] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[17:32:19] [PASSED] RGB
[17:32:19] [PASSED] YUV 4:2:0
[17:32:19] [PASSED] YUV 4:2:2
[17:32:19] [PASSED] YUV 4:4:4
[17:32:19] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[17:32:19] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[17:32:19] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[17:32:19] ============= drm_damage_helper (21 subtests) ==============
[17:32:19] [PASSED] drm_test_damage_iter_no_damage
[17:32:19] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[17:32:19] [PASSED] drm_test_damage_iter_no_damage_src_moved
[17:32:19] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[17:32:19] [PASSED] drm_test_damage_iter_no_damage_not_visible
[17:32:19] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[17:32:19] [PASSED] drm_test_damage_iter_no_damage_no_fb
[17:32:19] [PASSED] drm_test_damage_iter_simple_damage
[17:32:19] [PASSED] drm_test_damage_iter_single_damage
[17:32:19] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[17:32:19] [PASSED] drm_test_damage_iter_single_damage_outside_src
[17:32:19] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[17:32:19] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[17:32:19] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[17:32:19] [PASSED] drm_test_damage_iter_single_damage_src_moved
[17:32:19] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[17:32:19] [PASSED] drm_test_damage_iter_damage
[17:32:19] [PASSED] drm_test_damage_iter_damage_one_intersect
[17:32:19] [PASSED] drm_test_damage_iter_damage_one_outside
[17:32:19] [PASSED] drm_test_damage_iter_damage_src_moved
[17:32:19] [PASSED] drm_test_damage_iter_damage_not_visible
[17:32:19] ================ [PASSED] drm_damage_helper ================
[17:32:19] ============== drm_dp_mst_helper (3 subtests) ==============
[17:32:19] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[17:32:19] [PASSED] Clock 154000 BPP 30 DSC disabled
[17:32:19] [PASSED] Clock 234000 BPP 30 DSC disabled
[17:32:19] [PASSED] Clock 297000 BPP 24 DSC disabled
[17:32:19] [PASSED] Clock 332880 BPP 24 DSC enabled
[17:32:19] [PASSED] Clock 324540 BPP 24 DSC enabled
[17:32:19] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[17:32:19] ============== drm_test_dp_mst_calc_pbn_div  ===============
[17:32:19] [PASSED] Link rate 2000000 lane count 4
[17:32:19] [PASSED] Link rate 2000000 lane count 2
[17:32:19] [PASSED] Link rate 2000000 lane count 1
[17:32:19] [PASSED] Link rate 1350000 lane count 4
[17:32:19] [PASSED] Link rate 1350000 lane count 2
[17:32:19] [PASSED] Link rate 1350000 lane count 1
[17:32:19] [PASSED] Link rate 1000000 lane count 4
[17:32:19] [PASSED] Link rate 1000000 lane count 2
[17:32:19] [PASSED] Link rate 1000000 lane count 1
[17:32:19] [PASSED] Link rate 810000 lane count 4
[17:32:19] [PASSED] Link rate 810000 lane count 2
[17:32:19] [PASSED] Link rate 810000 lane count 1
[17:32:19] [PASSED] Link rate 540000 lane count 4
[17:32:19] [PASSED] Link rate 540000 lane count 2
[17:32:19] [PASSED] Link rate 540000 lane count 1
[17:32:19] [PASSED] Link rate 270000 lane count 4
[17:32:19] [PASSED] Link rate 270000 lane count 2
[17:32:19] [PASSED] Link rate 270000 lane count 1
[17:32:19] [PASSED] Link rate 162000 lane count 4
[17:32:19] [PASSED] Link rate 162000 lane count 2
[17:32:19] [PASSED] Link rate 162000 lane count 1
[17:32:19] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[17:32:19] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[17:32:19] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[17:32:19] [PASSED] DP_POWER_UP_PHY with port number
[17:32:19] [PASSED] DP_POWER_DOWN_PHY with port number
[17:32:19] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[17:32:19] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[17:32:19] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[17:32:19] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[17:32:19] [PASSED] DP_QUERY_PAYLOAD with port number
[17:32:19] [PASSED] DP_QUERY_PAYLOAD with VCPI
[17:32:19] [PASSED] DP_REMOTE_DPCD_READ with port number
[17:32:19] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[17:32:19] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[17:32:19] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[17:32:19] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[17:32:19] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[17:32:19] [PASSED] DP_REMOTE_I2C_READ with port number
[17:32:19] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[17:32:19] [PASSED] DP_REMOTE_I2C_READ with transactions array
[17:32:19] [PASSED] DP_REMOTE_I2C_WRITE with port number
[17:32:19] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[17:32:19] [PASSED] DP_REMOTE_I2C_WRITE with data array
[17:32:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[17:32:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[17:32:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[17:32:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[17:32:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[17:32:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[17:32:19] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[17:32:19] ================ [PASSED] drm_dp_mst_helper ================
[17:32:19] ================== drm_exec (7 subtests) ===================
[17:32:19] [PASSED] sanitycheck
[17:32:19] [PASSED] test_lock
[17:32:19] [PASSED] test_lock_unlock
[17:32:19] [PASSED] test_duplicates
[17:32:19] [PASSED] test_prepare
[17:32:19] [PASSED] test_prepare_array
[17:32:19] [PASSED] test_multiple_loops
[17:32:19] ==================== [PASSED] drm_exec =====================
[17:32:19] =========== drm_format_helper_test (17 subtests) ===========
[17:32:19] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[17:32:19] [PASSED] single_pixel_source_buffer
[17:32:19] [PASSED] single_pixel_clip_rectangle
[17:32:19] [PASSED] well_known_colors
[17:32:19] [PASSED] destination_pitch
[17:32:19] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[17:32:19] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[17:32:19] [PASSED] single_pixel_source_buffer
[17:32:19] [PASSED] single_pixel_clip_rectangle
[17:32:19] [PASSED] well_known_colors
[17:32:19] [PASSED] destination_pitch
[17:32:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[17:32:19] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[17:32:19] [PASSED] single_pixel_source_buffer
[17:32:19] [PASSED] single_pixel_clip_rectangle
[17:32:19] [PASSED] well_known_colors
[17:32:19] [PASSED] destination_pitch
[17:32:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[17:32:19] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[17:32:19] [PASSED] single_pixel_source_buffer
[17:32:19] [PASSED] single_pixel_clip_rectangle
[17:32:19] [PASSED] well_known_colors
[17:32:19] [PASSED] destination_pitch
[17:32:19] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[17:32:19] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[17:32:19] [PASSED] single_pixel_source_buffer
[17:32:19] [PASSED] single_pixel_clip_rectangle
[17:32:19] [PASSED] well_known_colors
[17:32:19] [PASSED] destination_pitch
[17:32:19] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[17:32:19] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[17:32:19] [PASSED] single_pixel_source_buffer
[17:32:19] [PASSED] single_pixel_clip_rectangle
[17:32:19] [PASSED] well_known_colors
[17:32:19] [PASSED] destination_pitch
[17:32:19] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[17:32:19] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[17:32:19] [PASSED] single_pixel_source_buffer
[17:32:19] [PASSED] single_pixel_clip_rectangle
[17:32:19] [PASSED] well_known_colors
[17:32:19] [PASSED] destination_pitch
[17:32:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[17:32:19] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[17:32:19] [PASSED] single_pixel_source_buffer
[17:32:19] [PASSED] single_pixel_clip_rectangle
[17:32:19] [PASSED] well_known_colors
[17:32:19] [PASSED] destination_pitch
[17:32:19] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[17:32:19] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[17:32:19] [PASSED] single_pixel_source_buffer
[17:32:19] [PASSED] single_pixel_clip_rectangle
[17:32:19] [PASSED] well_known_colors
[17:32:19] [PASSED] destination_pitch
[17:32:19] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[17:32:19] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[17:32:19] [PASSED] single_pixel_source_buffer
[17:32:19] [PASSED] single_pixel_clip_rectangle
[17:32:19] [PASSED] well_known_colors
[17:32:19] [PASSED] destination_pitch
[17:32:19] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[17:32:19] ============== drm_test_fb_xrgb8888_to_mono  ===============
[17:32:19] [PASSED] single_pixel_source_buffer
[17:32:19] [PASSED] single_pixel_clip_rectangle
[17:32:19] [PASSED] well_known_colors
[17:32:19] [PASSED] destination_pitch
[17:32:19] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[17:32:19] ==================== drm_test_fb_swab  =====================
[17:32:19] [PASSED] single_pixel_source_buffer
[17:32:19] [PASSED] single_pixel_clip_rectangle
[17:32:19] [PASSED] well_known_colors
[17:32:19] [PASSED] destination_pitch
[17:32:19] ================ [PASSED] drm_test_fb_swab =================
[17:32:19] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[17:32:19] [PASSED] single_pixel_source_buffer
[17:32:19] [PASSED] single_pixel_clip_rectangle
[17:32:19] [PASSED] well_known_colors
[17:32:19] [PASSED] destination_pitch
[17:32:19] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[17:32:19] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[17:32:19] [PASSED] single_pixel_source_buffer
[17:32:19] [PASSED] single_pixel_clip_rectangle
[17:32:19] [PASSED] well_known_colors
[17:32:19] [PASSED] destination_pitch
[17:32:19] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[17:32:19] ================= drm_test_fb_clip_offset  =================
[17:32:19] [PASSED] pass through
[17:32:19] [PASSED] horizontal offset
[17:32:19] [PASSED] vertical offset
[17:32:19] [PASSED] horizontal and vertical offset
[17:32:19] [PASSED] horizontal offset (custom pitch)
[17:32:19] [PASSED] vertical offset (custom pitch)
[17:32:19] [PASSED] horizontal and vertical offset (custom pitch)
[17:32:19] ============= [PASSED] drm_test_fb_clip_offset =============
[17:32:19] ============== drm_test_fb_build_fourcc_list  ==============
[17:32:19] [PASSED] no native formats
[17:32:19] [PASSED] XRGB8888 as native format
[17:32:19] [PASSED] remove duplicates
[17:32:19] [PASSED] convert alpha formats
[17:32:19] [PASSED] random formats
[17:32:19] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[17:32:19] =================== drm_test_fb_memcpy  ====================
[17:32:19] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[17:32:19] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[17:32:19] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[17:32:19] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[17:32:19] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[17:32:19] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[17:32:19] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[17:32:19] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[17:32:19] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[17:32:19] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[17:32:19] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[17:32:19] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[17:32:19] =============== [PASSED] drm_test_fb_memcpy ================
[17:32:19] ============= [PASSED] drm_format_helper_test ==============
[17:32:19] ================= drm_format (18 subtests) =================
[17:32:19] [PASSED] drm_test_format_block_width_invalid
[17:32:19] [PASSED] drm_test_format_block_width_one_plane
[17:32:19] [PASSED] drm_test_format_block_width_two_plane
[17:32:19] [PASSED] drm_test_format_block_width_three_plane
[17:32:19] [PASSED] drm_test_format_block_width_tiled
[17:32:19] [PASSED] drm_test_format_block_height_invalid
[17:32:19] [PASSED] drm_test_format_block_height_one_plane
[17:32:19] [PASSED] drm_test_format_block_height_two_plane
[17:32:19] [PASSED] drm_test_format_block_height_three_plane
[17:32:19] [PASSED] drm_test_format_block_height_tiled
[17:32:19] [PASSED] drm_test_format_min_pitch_invalid
[17:32:19] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[17:32:19] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[17:32:19] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[17:32:19] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[17:32:19] [PASSED] drm_test_format_min_pitch_two_plane
[17:32:19] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[17:32:19] [PASSED] drm_test_format_min_pitch_tiled
[17:32:19] =================== [PASSED] drm_format ====================
[17:32:19] =============== drm_framebuffer (1 subtest) ================
[17:32:19] =============== drm_test_framebuffer_create  ===============
[17:32:19] [PASSED] ABGR8888 normal sizes
[17:32:19] [PASSED] ABGR8888 max sizes
[17:32:19] [PASSED] ABGR8888 pitch greater than min required
[17:32:19] [PASSED] ABGR8888 pitch less than min required
[17:32:19] [PASSED] ABGR8888 Invalid width
[17:32:19] [PASSED] ABGR8888 Invalid buffer handle
[17:32:19] [PASSED] No pixel format
[17:32:19] [PASSED] ABGR8888 Width 0
[17:32:19] [PASSED] ABGR8888 Height 0
[17:32:19] [PASSED] ABGR8888 Out of bound height * pitch combination
[17:32:19] [PASSED] ABGR8888 Large buffer offset
[17:32:19] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[17:32:19] [PASSED] ABGR8888 Valid buffer modifier
[17:32:19] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[17:32:19] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[17:32:19] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[17:32:19] [PASSED] NV12 Normal sizes
[17:32:19] [PASSED] NV12 Max sizes
[17:32:19] [PASSED] NV12 Invalid pitch
[17:32:19] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[17:32:19] [PASSED] NV12 different  modifier per-plane
[17:32:19] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[17:32:19] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[17:32:19] [PASSED] NV12 Modifier for inexistent plane
[17:32:19] [PASSED] NV12 Handle for inexistent plane
[17:32:19] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[17:32:19] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[17:32:19] [PASSED] YVU420 Normal sizes
[17:32:19] [PASSED] YVU420 Max sizes
[17:32:19] [PASSED] YVU420 Invalid pitch
[17:32:19] [PASSED] YVU420 Different pitches
[17:32:19] [PASSED] YVU420 Different buffer offsets/pitches
[17:32:19] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[17:32:19] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[17:32:19] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[17:32:19] [PASSED] YVU420 Valid modifier
[17:32:19] [PASSED] YVU420 Different modifiers per plane
[17:32:19] [PASSED] YVU420 Modifier for inexistent plane
[17:32:19] [PASSED] X0L2 Normal sizes
[17:32:19] [PASSED] X0L2 Max sizes
[17:32:19] [PASSED] X0L2 Invalid pitch
[17:32:19] [PASSED] X0L2 Pitch greater than minimum required
[17:32:19] [PASSED] X0L2 Handle for inexistent plane
[17:32:19] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[17:32:19] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[17:32:19] [PASSED] X0L2 Valid modifier
[17:32:19] [PASSED] X0L2 Modifier for inexistent plane
[17:32:19] =========== [PASSED] drm_test_framebuffer_create ===========
[17:32:19] ================= [PASSED] drm_framebuffer =================
[17:32:19] ================ drm_gem_shmem (8 subtests) ================
[17:32:19] [PASSED] drm_gem_shmem_test_obj_create
[17:32:19] [PASSED] drm_gem_shmem_test_obj_create_private
[17:32:19] [PASSED] drm_gem_shmem_test_pin_pages
[17:32:19] [PASSED] drm_gem_shmem_test_vmap
[17:32:19] [PASSED] drm_gem_shmem_test_get_pages_sgt
[17:32:19] [PASSED] drm_gem_shmem_test_get_sg_table
[17:32:19] [PASSED] drm_gem_shmem_test_madvise
[17:32:19] [PASSED] drm_gem_shmem_test_purge
[17:32:19] ================== [PASSED] drm_gem_shmem ==================
[17:32:19] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[17:32:19] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[17:32:19] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[17:32:19] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[17:32:19] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[17:32:19] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[17:32:19] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[17:32:19] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[17:32:19] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[17:32:19] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[17:32:19] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[17:32:19] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[17:32:19] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[17:32:19] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[17:32:19] [PASSED] drm_test_check_output_bpc_dvi
[17:32:19] [PASSED] drm_test_check_output_bpc_format_vic_1
[17:32:19] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[17:32:19] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[17:32:19] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[17:32:19] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[17:32:19] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[17:32:19] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[17:32:19] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[17:32:19] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[17:32:19] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[17:32:19] [PASSED] drm_test_check_broadcast_rgb_value
[17:32:19] [PASSED] drm_test_check_bpc_8_value
[17:32:19] [PASSED] drm_test_check_bpc_10_value
[17:32:19] [PASSED] drm_test_check_bpc_12_value
[17:32:19] [PASSED] drm_test_check_format_value
[17:32:19] [PASSED] drm_test_check_tmds_char_value
[17:32:19] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[17:32:19] ================= drm_managed (2 subtests) =================
[17:32:19] [PASSED] drm_test_managed_release_action
[17:32:19] [PASSED] drm_test_managed_run_action
[17:32:19] =================== [PASSED] drm_managed ===================
[17:32:19] =================== drm_mm (6 subtests) ====================
[17:32:19] [PASSED] drm_test_mm_init
[17:32:19] [PASSED] drm_test_mm_debug
[17:32:19] [PASSED] drm_test_mm_align32
[17:32:19] [PASSED] drm_test_mm_align64
[17:32:19] [PASSED] drm_test_mm_lowest
[17:32:19] [PASSED] drm_test_mm_highest
[17:32:19] ===================== [PASSED] drm_mm ======================
[17:32:19] ============= drm_modes_analog_tv (4 subtests) =============
[17:32:19] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[17:32:19] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[17:32:19] [PASSED] drm_test_modes_analog_tv_pal_576i
[17:32:19] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[17:32:19] =============== [PASSED] drm_modes_analog_tv ===============
[17:32:19] ============== drm_plane_helper (2 subtests) ===============
[17:32:19] =============== drm_test_check_plane_state  ================
[17:32:19] [PASSED] clipping_simple
[17:32:19] [PASSED] clipping_rotate_reflect
[17:32:19] [PASSED] positioning_simple
[17:32:19] [PASSED] upscaling
[17:32:19] [PASSED] downscaling
[17:32:19] [PASSED] rounding1
[17:32:19] [PASSED] rounding2
[17:32:19] [PASSED] rounding3
[17:32:19] [PASSED] rounding4
[17:32:19] =========== [PASSED] drm_test_check_plane_state ============
[17:32:19] =========== drm_test_check_invalid_plane_state  ============
[17:32:19] [PASSED] positioning_invalid
[17:32:19] [PASSED] upscaling_invalid
[17:32:19] [PASSED] downscaling_invalid
[17:32:19] ======= [PASSED] drm_test_check_invalid_plane_state ========
[17:32:19] ================ [PASSED] drm_plane_helper =================
stty: 'standard input': Inappropriate ioctl for device
[17:32:19] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[17:32:19] ====== drm_test_connector_helper_tv_get_modes_check  =======
[17:32:19] [PASSED] None
[17:32:19] [PASSED] PAL
[17:32:19] [PASSED] NTSC
[17:32:19] [PASSED] Both, NTSC Default
[17:32:19] [PASSED] Both, PAL Default
[17:32:19] [PASSED] Both, NTSC Default, with PAL on command-line
[17:32:19] [PASSED] Both, PAL Default, with NTSC on command-line
[17:32:19] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[17:32:19] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[17:32:19] ================== drm_rect (9 subtests) ===================
[17:32:19] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[17:32:19] [PASSED] drm_test_rect_clip_scaled_not_clipped
[17:32:19] [PASSED] drm_test_rect_clip_scaled_clipped
[17:32:19] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[17:32:19] ================= drm_test_rect_intersect  =================
[17:32:19] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[17:32:19] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[17:32:19] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[17:32:19] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[17:32:19] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[17:32:19] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[17:32:19] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[17:32:19] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[17:32:19] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[17:32:19] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[17:32:19] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[17:32:19] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[17:32:19] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[17:32:19] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[17:32:19] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[17:32:19] ============= [PASSED] drm_test_rect_intersect =============
[17:32:19] ================ drm_test_rect_calc_hscale  ================
[17:32:19] [PASSED] normal use
[17:32:19] [PASSED] out of max range
[17:32:19] [PASSED] out of min range
[17:32:19] [PASSED] zero dst
[17:32:19] [PASSED] negative src
[17:32:19] [PASSED] negative dst
[17:32:19] ============ [PASSED] drm_test_rect_calc_hscale ============
[17:32:19] ================ drm_test_rect_calc_vscale  ================
[17:32:19] [PASSED] normal use
[17:32:19] [PASSED] out of max range
[17:32:19] [PASSED] out of min range
[17:32:19] [PASSED] zero dst
[17:32:19] [PASSED] negative src
[17:32:19] [PASSED] negative dst
[17:32:19] ============ [PASSED] drm_test_rect_calc_vscale ============
[17:32:19] ================== drm_test_rect_rotate  ===================
[17:32:19] [PASSED] reflect-x
[17:32:19] [PASSED] reflect-y
[17:32:19] [PASSED] rotate-0
[17:32:19] [PASSED] rotate-90
[17:32:19] [PASSED] rotate-180
[17:32:19] [PASSED] rotate-270
[17:32:19] ============== [PASSED] drm_test_rect_rotate ===============
[17:32:19] ================ drm_test_rect_rotate_inv  =================
[17:32:19] [PASSED] reflect-x
[17:32:19] [PASSED] reflect-y
[17:32:19] [PASSED] rotate-0
[17:32:19] [PASSED] rotate-90
[17:32:19] [PASSED] rotate-180
[17:32:19] [PASSED] rotate-270
[17:32:19] ============ [PASSED] drm_test_rect_rotate_inv =============
[17:32:19] ==================== [PASSED] drm_rect =====================
[17:32:19] ============================================================
[17:32:19] Testing complete. Ran 511 tests: passed: 511
[17:32:19] Elapsed time: 23.224s total, 1.708s configuring, 21.382s building, 0.130s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


