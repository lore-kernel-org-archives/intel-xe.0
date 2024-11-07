Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB6FD5AE71
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 08:49:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8966610E306;
	Thu,  7 Nov 2024 08:49:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4326310E7C5;
 Thu,  7 Nov 2024 08:49:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/xe3lpg=3A_Add_Wa=5F1602?=
 =?utf-8?q?4792527_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: apoorva.singh@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Nov 2024 08:49:47 -0000
Message-ID: <173096938726.1420836.13094305531351995228@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241107082158.1436637-1-apoorva.singh@intel.com>
In-Reply-To: <20241107082158.1436637-1-apoorva.singh@intel.com>
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

Series: drm/xe/xe3lpg: Add Wa_16024792527 (rev3)
URL   : https://patchwork.freedesktop.org/series/140666/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[08:48:37] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:48:42] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
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

[08:49:10] Starting KUnit Kernel (1/1)...
[08:49:10] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[08:49:10] =================== guc_dbm (7 subtests) ===================
[08:49:10] [PASSED] test_empty
[08:49:10] [PASSED] test_default
[08:49:10] ======================== test_size  ========================
[08:49:10] [PASSED] 4
[08:49:10] [PASSED] 8
[08:49:10] [PASSED] 32
[08:49:10] [PASSED] 256
[08:49:10] ==================== [PASSED] test_size ====================
[08:49:10] ======================= test_reuse  ========================
[08:49:10] [PASSED] 4
[08:49:10] [PASSED] 8
[08:49:10] [PASSED] 32
[08:49:10] [PASSED] 256
[08:49:10] =================== [PASSED] test_reuse ====================
[08:49:10] =================== test_range_overlap  ====================
[08:49:10] [PASSED] 4
[08:49:10] [PASSED] 8
[08:49:10] [PASSED] 32
[08:49:10] [PASSED] 256
[08:49:10] =============== [PASSED] test_range_overlap ================
[08:49:10] =================== test_range_compact  ====================
[08:49:10] [PASSED] 4
[08:49:10] [PASSED] 8
[08:49:10] [PASSED] 32
[08:49:10] [PASSED] 256
[08:49:10] =============== [PASSED] test_range_compact ================
[08:49:10] ==================== test_range_spare  =====================
[08:49:10] [PASSED] 4
[08:49:10] [PASSED] 8
[08:49:10] [PASSED] 32
[08:49:10] [PASSED] 256
[08:49:10] ================ [PASSED] test_range_spare =================
[08:49:10] ===================== [PASSED] guc_dbm =====================
[08:49:10] =================== guc_idm (6 subtests) ===================
[08:49:10] [PASSED] bad_init
[08:49:10] [PASSED] no_init
[08:49:10] [PASSED] init_fini
[08:49:10] [PASSED] check_used
[08:49:10] [PASSED] check_quota
[08:49:10] [PASSED] check_all
[08:49:10] ===================== [PASSED] guc_idm =====================
[08:49:10] ================== no_relay (3 subtests) ===================
[08:49:10] [PASSED] xe_drops_guc2pf_if_not_ready
[08:49:10] [PASSED] xe_drops_guc2vf_if_not_ready
[08:49:10] [PASSED] xe_rejects_send_if_not_ready
[08:49:10] ==================== [PASSED] no_relay =====================
[08:49:10] ================== pf_relay (14 subtests) ==================
[08:49:10] [PASSED] pf_rejects_guc2pf_too_short
[08:49:10] [PASSED] pf_rejects_guc2pf_too_long
[08:49:10] [PASSED] pf_rejects_guc2pf_no_payload
[08:49:10] [PASSED] pf_fails_no_payload
[08:49:10] [PASSED] pf_fails_bad_origin
[08:49:10] [PASSED] pf_fails_bad_type
[08:49:10] [PASSED] pf_txn_reports_error
[08:49:10] [PASSED] pf_txn_sends_pf2guc
[08:49:10] [PASSED] pf_sends_pf2guc
[08:49:10] [SKIPPED] pf_loopback_nop
[08:49:10] [SKIPPED] pf_loopback_echo
[08:49:10] [SKIPPED] pf_loopback_fail
[08:49:10] [SKIPPED] pf_loopback_busy
[08:49:10] [SKIPPED] pf_loopback_retry
[08:49:10] ==================== [PASSED] pf_relay =====================
[08:49:10] ================== vf_relay (3 subtests) ===================
[08:49:10] [PASSED] vf_rejects_guc2vf_too_short
[08:49:10] [PASSED] vf_rejects_guc2vf_too_long
[08:49:10] [PASSED] vf_rejects_guc2vf_no_payload
[08:49:10] ==================== [PASSED] vf_relay =====================
[08:49:10] ================= pf_service (11 subtests) =================
[08:49:10] [PASSED] pf_negotiate_any
[08:49:10] [PASSED] pf_negotiate_base_match
[08:49:10] [PASSED] pf_negotiate_base_newer
[08:49:10] [PASSED] pf_negotiate_base_next
[08:49:10] [SKIPPED] pf_negotiate_base_older
[08:49:10] [PASSED] pf_negotiate_base_prev
[08:49:10] [PASSED] pf_negotiate_latest_match
[08:49:10] [PASSED] pf_negotiate_latest_newer
[08:49:10] [PASSED] pf_negotiate_latest_next
[08:49:10] [SKIPPED] pf_negotiate_latest_older
[08:49:10] [SKIPPED] pf_negotiate_latest_prev
[08:49:10] =================== [PASSED] pf_service ====================
[08:49:10] ===================== lmtt (1 subtest) =====================
[08:49:10] ======================== test_ops  =========================
[08:49:10] [PASSED] 2-level
[08:49:10] [PASSED] multi-level
[08:49:10] ==================== [PASSED] test_ops =====================
[08:49:10] ====================== [PASSED] lmtt =======================
[08:49:10] =================== xe_mocs (2 subtests) ===================
[08:49:10] ================ xe_live_mocs_kernel_kunit  ================
[08:49:10] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[08:49:10] ================ xe_live_mocs_reset_kunit  =================
[08:49:10] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[08:49:10] ==================== [SKIPPED] xe_mocs =====================
[08:49:10] ================= xe_migrate (2 subtests) ==================
[08:49:10] ================= xe_migrate_sanity_kunit  =================
[08:49:10] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[08:49:10] ================== xe_validate_ccs_kunit  ==================
[08:49:10] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[08:49:10] =================== [SKIPPED] xe_migrate ===================
[08:49:10] ================== xe_dma_buf (1 subtest) ==================
[08:49:10] ==================== xe_dma_buf_kunit  =====================
[08:49:10] ================ [SKIPPED] xe_dma_buf_kunit ================
[08:49:10] =================== [SKIPPED] xe_dma_buf ===================
[08:49:10] ==================== xe_bo (3 subtests) ====================
[08:49:10] ================== xe_ccs_migrate_kunit  ===================
[08:49:10] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[08:49:10] ==================== xe_bo_evict_kunit  ====================
[08:49:10] =============== [SKIPPED] xe_bo_evict_kunit ================
[08:49:10] =================== xe_bo_shrink_kunit  ====================
[08:49:10] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[08:49:10] ===================== [SKIPPED] xe_bo ======================
[08:49:10] ==================== args (11 subtests) ====================
[08:49:10] [PASSED] count_args_test
[08:49:10] [PASSED] call_args_example
[08:49:10] [PASSED] call_args_test
[08:49:10] [PASSED] drop_first_arg_example
[08:49:10] [PASSED] drop_first_arg_test
[08:49:10] [PASSED] first_arg_example
[08:49:10] [PASSED] first_arg_test
[08:49:10] [PASSED] last_arg_example
[08:49:10] [PASSED] last_arg_test
[08:49:10] [PASSED] pick_arg_example
[08:49:10] [PASSED] sep_comma_examplestty: 'standard input': Inappropriate ioctl for device

[08:49:10] ====================== [PASSED] args =======================
[08:49:10] =================== xe_pci (2 subtests) ====================
[08:49:10] [PASSED] xe_gmdid_graphics_ip
[08:49:10] [PASSED] xe_gmdid_media_ip
[08:49:10] ===================== [PASSED] xe_pci ======================
[08:49:10] =================== xe_rtp (2 subtests) ====================
[08:49:10] =============== xe_rtp_process_to_sr_tests  ================
[08:49:10] [PASSED] coalesce-same-reg
[08:49:10] [PASSED] no-match-no-add
[08:49:10] [PASSED] match-or
[08:49:10] [PASSED] match-or-xfail
[08:49:10] [PASSED] no-match-no-add-multiple-rules
[08:49:10] [PASSED] two-regs-two-entries
[08:49:10] [PASSED] clr-one-set-other
[08:49:10] [PASSED] set-field
[08:49:10] [PASSED] conflict-duplicate
[08:49:10] [PASSED] conflict-not-disjoint
[08:49:10] [PASSED] conflict-reg-type
[08:49:10] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[08:49:10] ================== xe_rtp_process_tests  ===================
[08:49:10] [PASSED] active1
[08:49:10] [PASSED] active2
[08:49:10] [PASSED] active-inactive
[08:49:10] [PASSED] inactive-active
[08:49:10] [PASSED] inactive-1st_or_active-inactive
[08:49:10] [PASSED] inactive-2nd_or_active-inactive
[08:49:10] [PASSED] inactive-last_or_active-inactive
[08:49:10] [PASSED] inactive-no_or_active-inactive
[08:49:10] ============== [PASSED] xe_rtp_process_tests ===============
[08:49:10] ===================== [PASSED] xe_rtp ======================
[08:49:10] ==================== xe_wa (1 subtest) =====================
[08:49:10] ======================== xe_wa_gt  =========================
[08:49:10] [PASSED] TIGERLAKE (B0)
[08:49:10] [PASSED] DG1 (A0)
[08:49:10] [PASSED] DG1 (B0)
[08:49:10] [PASSED] ALDERLAKE_S (A0)
[08:49:10] [PASSED] ALDERLAKE_S (B0)
[08:49:10] [PASSED] ALDERLAKE_S (C0)
[08:49:10] [PASSED] ALDERLAKE_S (D0)
[08:49:10] [PASSED] ALDERLAKE_P (A0)
[08:49:10] [PASSED] ALDERLAKE_P (B0)
[08:49:10] [PASSED] ALDERLAKE_P (C0)
[08:49:10] [PASSED] ALDERLAKE_S_RPLS (D0)
[08:49:10] [PASSED] ALDERLAKE_P_RPLU (E0)
[08:49:10] [PASSED] DG2_G10 (C0)
[08:49:10] [PASSED] DG2_G11 (B1)
[08:49:10] [PASSED] DG2_G12 (A1)
[08:49:10] [PASSED] METEORLAKE (g:A0, m:A0)
[08:49:10] [PASSED] METEORLAKE (g:A0, m:A0)
[08:49:10] [PASSED] METEORLAKE (g:A0, m:A0)
[08:49:10] [PASSED] LUNARLAKE (g:A0, m:A0)
[08:49:10] [PASSED] LUNARLAKE (g:B0, m:A0)
[08:49:10] [PASSED] BATTLEMAGE (g:A0, m:A1)
[08:49:10] ==================== [PASSED] xe_wa_gt =====================
[08:49:10] ====================== [PASSED] xe_wa ======================
[08:49:10] ============================================================
[08:49:10] Testing complete. Ran 122 tests: passed: 106, skipped: 16
[08:49:10] Elapsed time: 32.820s total, 4.484s configuring, 28.070s building, 0.221s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[08:49:10] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:49:12] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
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

[08:49:34] Starting KUnit Kernel (1/1)...
[08:49:34] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[08:49:34] ================== drm_buddy (7 subtests) ==================
[08:49:34] [PASSED] drm_test_buddy_alloc_limit
[08:49:34] [PASSED] drm_test_buddy_alloc_optimistic
[08:49:34] [PASSED] drm_test_buddy_alloc_pessimistic
[08:49:34] [PASSED] drm_test_buddy_alloc_pathological
[08:49:34] [PASSED] drm_test_buddy_alloc_contiguous
[08:49:34] [PASSED] drm_test_buddy_alloc_clear
[08:49:34] [PASSED] drm_test_buddy_alloc_range_bias
[08:49:34] ==================== [PASSED] drm_buddy ====================
[08:49:34] ============= drm_cmdline_parser (40 subtests) =============
[08:49:34] [PASSED] drm_test_cmdline_force_d_only
[08:49:34] [PASSED] drm_test_cmdline_force_D_only_dvi
[08:49:34] [PASSED] drm_test_cmdline_force_D_only_hdmi
[08:49:34] [PASSED] drm_test_cmdline_force_D_only_not_digital
[08:49:34] [PASSED] drm_test_cmdline_force_e_only
[08:49:34] [PASSED] drm_test_cmdline_res
[08:49:34] [PASSED] drm_test_cmdline_res_vesa
[08:49:34] [PASSED] drm_test_cmdline_res_vesa_rblank
[08:49:34] [PASSED] drm_test_cmdline_res_rblank
[08:49:34] [PASSED] drm_test_cmdline_res_bpp
[08:49:34] [PASSED] drm_test_cmdline_res_refresh
[08:49:34] [PASSED] drm_test_cmdline_res_bpp_refresh
[08:49:34] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[08:49:34] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[08:49:34] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[08:49:34] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[08:49:34] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[08:49:34] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[08:49:34] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[08:49:34] [PASSED] drm_test_cmdline_res_margins_force_on
[08:49:34] [PASSED] drm_test_cmdline_res_vesa_margins
[08:49:34] [PASSED] drm_test_cmdline_name
[08:49:34] [PASSED] drm_test_cmdline_name_bpp
[08:49:34] [PASSED] drm_test_cmdline_name_option
[08:49:34] [PASSED] drm_test_cmdline_name_bpp_option
[08:49:34] [PASSED] drm_test_cmdline_rotate_0
[08:49:34] [PASSED] drm_test_cmdline_rotate_90
[08:49:34] [PASSED] drm_test_cmdline_rotate_180
[08:49:34] [PASSED] drm_test_cmdline_rotate_270
[08:49:34] [PASSED] drm_test_cmdline_hmirror
[08:49:34] [PASSED] drm_test_cmdline_vmirror
[08:49:34] [PASSED] drm_test_cmdline_margin_options
[08:49:34] [PASSED] drm_test_cmdline_multiple_options
[08:49:34] [PASSED] drm_test_cmdline_bpp_extra_and_option
[08:49:34] [PASSED] drm_test_cmdline_extra_and_option
[08:49:34] [PASSED] drm_test_cmdline_freestanding_options
[08:49:34] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[08:49:34] [PASSED] drm_test_cmdline_panel_orientation
[08:49:34] ================ drm_test_cmdline_invalid  =================
[08:49:34] [PASSED] margin_only
[08:49:34] [PASSED] interlace_only
[08:49:34] [PASSED] res_missing_x
[08:49:34] [PASSED] res_missing_y
[08:49:34] [PASSED] res_bad_y
[08:49:34] [PASSED] res_missing_y_bpp
[08:49:34] [PASSED] res_bad_bpp
[08:49:34] [PASSED] res_bad_refresh
[08:49:34] [PASSED] res_bpp_refresh_force_on_off
[08:49:34] [PASSED] res_invalid_mode
[08:49:34] [PASSED] res_bpp_wrong_place_mode
[08:49:34] [PASSED] name_bpp_refresh
[08:49:34] [PASSED] name_refresh
[08:49:34] [PASSED] name_refresh_wrong_mode
[08:49:34] [PASSED] name_refresh_invalid_mode
[08:49:34] [PASSED] rotate_multiple
[08:49:34] [PASSED] rotate_invalid_val
[08:49:34] [PASSED] rotate_truncated
[08:49:34] [PASSED] invalid_option
[08:49:34] [PASSED] invalid_tv_option
[08:49:34] [PASSED] truncated_tv_option
[08:49:34] ============ [PASSED] drm_test_cmdline_invalid =============
[08:49:34] =============== drm_test_cmdline_tv_options  ===============
[08:49:34] [PASSED] NTSC
[08:49:34] [PASSED] NTSC_443
[08:49:34] [PASSED] NTSC_J
[08:49:34] [PASSED] PAL
[08:49:34] [PASSED] PAL_M
[08:49:34] [PASSED] PAL_N
[08:49:34] [PASSED] SECAM
[08:49:34] [PASSED] MONO_525
[08:49:34] [PASSED] MONO_625
[08:49:34] =========== [PASSED] drm_test_cmdline_tv_options ===========
[08:49:34] =============== [PASSED] drm_cmdline_parser ================
[08:49:34] ========== drmm_connector_hdmi_init (19 subtests) ==========
[08:49:34] [PASSED] drm_test_connector_hdmi_init_valid
[08:49:34] [PASSED] drm_test_connector_hdmi_init_bpc_8
[08:49:34] [PASSED] drm_test_connector_hdmi_init_bpc_10
[08:49:34] [PASSED] drm_test_connector_hdmi_init_bpc_12
[08:49:34] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[08:49:34] [PASSED] drm_test_connector_hdmi_init_bpc_null
[08:49:34] [PASSED] drm_test_connector_hdmi_init_formats_empty
[08:49:34] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[08:49:34] [PASSED] drm_test_connector_hdmi_init_null_ddc
[08:49:34] [PASSED] drm_test_connector_hdmi_init_null_product
[08:49:34] [PASSED] drm_test_connector_hdmi_init_null_vendor
[08:49:34] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[08:49:34] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[08:49:34] [PASSED] drm_test_connector_hdmi_init_product_valid
[08:49:34] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[08:49:34] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[08:49:34] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[08:49:34] ========= drm_test_connector_hdmi_init_type_valid  =========
[08:49:34] [PASSED] HDMI-A
[08:49:34] [PASSED] HDMI-B
[08:49:34] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[08:49:34] ======== drm_test_connector_hdmi_init_type_invalid  ========
[08:49:34] [PASSED] Unknown
[08:49:34] [PASSED] VGA
[08:49:34] [PASSED] DVI-I
[08:49:34] [PASSED] DVI-D
[08:49:34] [PASSED] DVI-A
[08:49:34] [PASSED] Composite
[08:49:34] [PASSED] SVIDEO
[08:49:34] [PASSED] LVDS
[08:49:34] [PASSED] Component
[08:49:34] [PASSED] DIN
[08:49:34] [PASSED] DP
[08:49:34] [PASSED] TV
[08:49:34] [PASSED] eDP
[08:49:34] [PASSED] Virtual
[08:49:34] [PASSED] DSI
[08:49:34] [PASSED] DPI
[08:49:34] [PASSED] Writeback
[08:49:34] [PASSED] SPI
[08:49:34] [PASSED] USB
[08:49:34] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[08:49:34] ============ [PASSED] drmm_connector_hdmi_init =============
[08:49:34] ============= drmm_connector_init (3 subtests) =============
[08:49:34] [PASSED] drm_test_drmm_connector_init
[08:49:34] [PASSED] drm_test_drmm_connector_init_null_ddc
[08:49:34] ========= drm_test_drmm_connector_init_type_valid  =========
[08:49:34] [PASSED] Unknown
[08:49:34] [PASSED] VGA
[08:49:34] [PASSED] DVI-I
[08:49:34] [PASSED] DVI-D
[08:49:34] [PASSED] DVI-A
[08:49:34] [PASSED] Composite
[08:49:34] [PASSED] SVIDEO
[08:49:34] [PASSED] LVDS
[08:49:34] [PASSED] Component
[08:49:34] [PASSED] DIN
[08:49:34] [PASSED] DP
[08:49:34] [PASSED] HDMI-A
[08:49:34] [PASSED] HDMI-B
[08:49:34] [PASSED] TV
[08:49:34] [PASSED] eDP
[08:49:34] [PASSED] Virtual
[08:49:34] [PASSED] DSI
[08:49:34] [PASSED] DPI
[08:49:34] [PASSED] Writeback
[08:49:34] [PASSED] SPI
[08:49:34] [PASSED] USB
[08:49:34] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[08:49:34] =============== [PASSED] drmm_connector_init ===============
[08:49:34] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[08:49:34] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[08:49:34] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[08:49:34] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[08:49:34] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[08:49:34] ========== drm_test_get_tv_mode_from_name_valid  ===========
[08:49:34] [PASSED] NTSC
[08:49:34] [PASSED] NTSC-443
[08:49:34] [PASSED] NTSC-J
[08:49:34] [PASSED] PAL
[08:49:34] [PASSED] PAL-M
[08:49:34] [PASSED] PAL-N
[08:49:34] [PASSED] SECAM
[08:49:34] [PASSED] Mono
[08:49:34] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[08:49:34] [PASSED] drm_test_get_tv_mode_from_name_truncated
[08:49:34] ============ [PASSED] drm_get_tv_mode_from_name ============
[08:49:34] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[08:49:34] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[08:49:34] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[08:49:34] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[08:49:34] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[08:49:34] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[08:49:34] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[08:49:34] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[08:49:34] [PASSED] VIC 96
[08:49:34] [PASSED] VIC 97
[08:49:34] [PASSED] VIC 101
[08:49:34] [PASSED] VIC 102
[08:49:34] [PASSED] VIC 106
[08:49:34] [PASSED] VIC 107
[08:49:34] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[08:49:34] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[08:49:34] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[08:49:34] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[08:49:34] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[08:49:34] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[08:49:34] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[08:49:34] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[08:49:34] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[08:49:34] [PASSED] Automatic
[08:49:34] [PASSED] Full
[08:49:34] [PASSED] Limited 16:235
[08:49:34] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[08:49:34] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[08:49:34] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[08:49:34] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[08:49:34] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[08:49:34] [PASSED] RGB
[08:49:34] [PASSED] YUV 4:2:0
[08:49:34] [PASSED] YUV 4:2:2
[08:49:34] [PASSED] YUV 4:4:4
[08:49:34] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[08:49:34] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[08:49:34] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[08:49:34] ============= drm_damage_helper (21 subtests) ==============
[08:49:34] [PASSED] drm_test_damage_iter_no_damage
[08:49:34] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[08:49:34] [PASSED] drm_test_damage_iter_no_damage_src_moved
[08:49:34] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[08:49:34] [PASSED] drm_test_damage_iter_no_damage_not_visible
[08:49:34] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[08:49:34] [PASSED] drm_test_damage_iter_no_damage_no_fb
[08:49:34] [PASSED] drm_test_damage_iter_simple_damage
[08:49:34] [PASSED] drm_test_damage_iter_single_damage
[08:49:34] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[08:49:34] [PASSED] drm_test_damage_iter_single_damage_outside_src
[08:49:34] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[08:49:34] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[08:49:34] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[08:49:34] [PASSED] drm_test_damage_iter_single_damage_src_moved
[08:49:34] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[08:49:34] [PASSED] drm_test_damage_iter_damage
[08:49:34] [PASSED] drm_test_damage_iter_damage_one_intersect
[08:49:34] [PASSED] drm_test_damage_iter_damage_one_outside
[08:49:34] [PASSED] drm_test_damage_iter_damage_src_moved
[08:49:34] [PASSED] drm_test_damage_iter_damage_not_visible
[08:49:34] ================ [PASSED] drm_damage_helper ================
[08:49:34] ============== drm_dp_mst_helper (3 subtests) ==============
[08:49:34] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[08:49:34] [PASSED] Clock 154000 BPP 30 DSC disabled
[08:49:34] [PASSED] Clock 234000 BPP 30 DSC disabled
[08:49:34] [PASSED] Clock 297000 BPP 24 DSC disabled
[08:49:34] [PASSED] Clock 332880 BPP 24 DSC enabled
[08:49:34] [PASSED] Clock 324540 BPP 24 DSC enabled
[08:49:34] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[08:49:34] ============== drm_test_dp_mst_calc_pbn_div  ===============
[08:49:34] [PASSED] Link rate 2000000 lane count 4
[08:49:34] [PASSED] Link rate 2000000 lane count 2
[08:49:34] [PASSED] Link rate 2000000 lane count 1
[08:49:34] [PASSED] Link rate 1350000 lane count 4
[08:49:34] [PASSED] Link rate 1350000 lane count 2
[08:49:34] [PASSED] Link rate 1350000 lane count 1
[08:49:34] [PASSED] Link rate 1000000 lane count 4
[08:49:34] [PASSED] Link rate 1000000 lane count 2
[08:49:34] [PASSED] Link rate 1000000 lane count 1
[08:49:34] [PASSED] Link rate 810000 lane count 4
[08:49:34] [PASSED] Link rate 810000 lane count 2
[08:49:34] [PASSED] Link rate 810000 lane count 1
[08:49:34] [PASSED] Link rate 540000 lane count 4
[08:49:34] [PASSED] Link rate 540000 lane count 2
[08:49:34] [PASSED] Link rate 540000 lane count 1
[08:49:34] [PASSED] Link rate 270000 lane count 4
[08:49:34] [PASSED] Link rate 270000 lane count 2
[08:49:34] [PASSED] Link rate 270000 lane count 1
[08:49:34] [PASSED] Link rate 162000 lane count 4
[08:49:34] [PASSED] Link rate 162000 lane count 2
[08:49:34] [PASSED] Link rate 162000 lane count 1
[08:49:34] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[08:49:34] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[08:49:34] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[08:49:34] [PASSED] DP_POWER_UP_PHY with port number
[08:49:34] [PASSED] DP_POWER_DOWN_PHY with port number
[08:49:34] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[08:49:34] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[08:49:34] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[08:49:34] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[08:49:34] [PASSED] DP_QUERY_PAYLOAD with port number
[08:49:34] [PASSED] DP_QUERY_PAYLOAD with VCPI
[08:49:34] [PASSED] DP_REMOTE_DPCD_READ with port number
[08:49:34] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[08:49:34] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[08:49:34] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[08:49:34] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[08:49:34] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[08:49:34] [PASSED] DP_REMOTE_I2C_READ with port number
[08:49:34] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[08:49:34] [PASSED] DP_REMOTE_I2C_READ with transactions array
[08:49:34] [PASSED] DP_REMOTE_I2C_WRITE with port number
[08:49:34] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[08:49:34] [PASSED] DP_REMOTE_I2C_WRITE with data array
[08:49:34] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[08:49:34] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[08:49:34] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[08:49:34] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[08:49:34] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[08:49:34] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[08:49:34] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[08:49:34] ================ [PASSED] drm_dp_mst_helper ================
[08:49:34] ================== drm_exec (7 subtests) ===================
[08:49:34] [PASSED] sanitycheck
[08:49:34] [PASSED] test_lock
[08:49:34] [PASSED] test_lock_unlock
[08:49:34] [PASSED] test_duplicates
[08:49:34] [PASSED] test_prepare
[08:49:34] [PASSED] test_prepare_array
[08:49:34] [PASSED] test_multiple_loops
[08:49:34] ==================== [PASSED] drm_exec =====================
[08:49:34] =========== drm_format_helper_test (17 subtests) ===========
[08:49:34] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[08:49:34] [PASSED] single_pixel_source_buffer
[08:49:34] [PASSED] single_pixel_clip_rectangle
[08:49:34] [PASSED] well_known_colors
[08:49:34] [PASSED] destination_pitch
[08:49:34] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[08:49:34] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[08:49:34] [PASSED] single_pixel_source_buffer
[08:49:34] [PASSED] single_pixel_clip_rectangle
[08:49:34] [PASSED] well_known_colors
[08:49:34] [PASSED] destination_pitch
[08:49:34] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[08:49:34] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[08:49:34] [PASSED] single_pixel_source_buffer
[08:49:34] [PASSED] single_pixel_clip_rectangle
[08:49:34] [PASSED] well_known_colors
[08:49:34] [PASSED] destination_pitch
[08:49:34] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[08:49:34] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[08:49:34] [PASSED] single_pixel_source_buffer
[08:49:34] [PASSED] single_pixel_clip_rectangle
[08:49:34] [PASSED] well_known_colors
[08:49:34] [PASSED] destination_pitch
[08:49:34] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[08:49:34] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[08:49:34] [PASSED] single_pixel_source_buffer
[08:49:34] [PASSED] single_pixel_clip_rectangle
[08:49:34] [PASSED] well_known_colors
[08:49:34] [PASSED] destination_pitch
[08:49:34] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[08:49:34] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[08:49:34] [PASSED] single_pixel_source_buffer
[08:49:34] [PASSED] single_pixel_clip_rectangle
[08:49:34] [PASSED] well_known_colors
[08:49:34] [PASSED] destination_pitch
[08:49:34] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[08:49:34] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[08:49:34] [PASSED] single_pixel_source_buffer
[08:49:34] [PASSED] single_pixel_clip_rectangle
[08:49:34] [PASSED] well_known_colors
[08:49:34] [PASSED] destination_pitch
[08:49:34] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[08:49:34] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[08:49:34] [PASSED] single_pixel_source_buffer
[08:49:34] [PASSED] single_pixel_clip_rectangle
[08:49:34] [PASSED] well_known_colors
[08:49:34] [PASSED] destination_pitch
[08:49:34] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[08:49:34] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[08:49:34] [PASSED] single_pixel_source_buffer
[08:49:34] [PASSED] single_pixel_clip_rectangle
[08:49:34] [PASSED] well_known_colors
[08:49:34] [PASSED] destination_pitch
[08:49:34] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[08:49:34] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[08:49:34] [PASSED] single_pixel_source_buffer
[08:49:34] [PASSED] single_pixel_clip_rectangle
[08:49:34] [PASSED] well_known_colors
[08:49:34] [PASSED] destination_pitch
[08:49:34] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[08:49:34] ============== drm_test_fb_xrgb8888_to_mono  ===============
[08:49:34] [PASSED] single_pixel_source_buffer
[08:49:34] [PASSED] single_pixel_clip_rectangle
[08:49:34] [PASSED] well_known_colors
[08:49:34] [PASSED] destination_pitch
[08:49:34] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[08:49:34] ==================== drm_test_fb_swab  =====================
[08:49:34] [PASSED] single_pixel_source_buffer
[08:49:34] [PASSED] single_pixel_clip_rectangle
[08:49:34] [PASSED] well_known_colors
[08:49:34] [PASSED] destination_pitch
[08:49:34] ================ [PASSED] drm_test_fb_swab =================
[08:49:34] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[08:49:34] [PASSED] single_pixel_source_buffer
[08:49:34] [PASSED] single_pixel_clip_rectangle
[08:49:34] [PASSED] well_known_colors
[08:49:34] [PASSED] destination_pitch
[08:49:34] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[08:49:34] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[08:49:34] [PASSED] single_pixel_source_buffer
[08:49:34] [PASSED] single_pixel_clip_rectangle
[08:49:34] [PASSED] well_known_colors
[08:49:34] [PASSED] destination_pitch
[08:49:34] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[08:49:34] ================= drm_test_fb_clip_offset  =================
[08:49:34] [PASSED] pass through
[08:49:34] [PASSED] horizontal offset
[08:49:34] [PASSED] vertical offset
[08:49:34] [PASSED] horizontal and vertical offset
[08:49:34] [PASSED] horizontal offset (custom pitch)
[08:49:34] [PASSED] vertical offset (custom pitch)
[08:49:34] [PASSED] horizontal and vertical offset (custom pitch)
[08:49:34] ============= [PASSED] drm_test_fb_clip_offset =============
[08:49:34] ============== drm_test_fb_build_fourcc_list  ==============
[08:49:34] [PASSED] no native formats
[08:49:34] [PASSED] XRGB8888 as native format
[08:49:34] [PASSED] remove duplicates
[08:49:34] [PASSED] convert alpha formats
[08:49:34] [PASSED] random formats
[08:49:34] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[08:49:34] =================== drm_test_fb_memcpy  ====================
[08:49:34] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[08:49:34] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[08:49:34] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[08:49:34] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[08:49:34] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[08:49:34] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[08:49:34] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[08:49:34] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[08:49:34] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[08:49:34] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[08:49:34] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[08:49:34] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[08:49:34] =============== [PASSED] drm_test_fb_memcpy ================
[08:49:34] ============= [PASSED] drm_format_helper_test ==============
[08:49:34] ================= drm_format (18 subtests) =================
[08:49:34] [PASSED] drm_test_format_block_width_invalid
[08:49:34] [PASSED] drm_test_format_block_width_one_plane
[08:49:34] [PASSED] drm_test_format_block_width_two_plane
[08:49:34] [PASSED] drm_test_format_block_width_three_plane
[08:49:34] [PASSED] drm_test_format_block_width_tiled
[08:49:34] [PASSED] drm_test_format_block_height_invalid
[08:49:34] [PASSED] drm_test_format_block_height_one_plane
[08:49:34] [PASSED] drm_test_format_block_height_two_plane
[08:49:34] [PASSED] drm_test_format_block_height_three_plane
[08:49:34] [PASSED] drm_test_format_block_height_tiled
[08:49:34] [PASSED] drm_test_format_min_pitch_invalid
[08:49:34] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[08:49:34] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[08:49:34] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[08:49:34] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[08:49:34] [PASSED] drm_test_format_min_pitch_two_plane
[08:49:34] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[08:49:34] [PASSED] drm_test_format_min_pitch_tiled
[08:49:34] =================== [PASSED] drm_format ====================
[08:49:34] ============== drm_framebuffer (10 subtests) ===============
[08:49:34] ========== drm_test_framebuffer_check_src_coords  ==========
[08:49:34] [PASSED] Success: source fits into fb
[08:49:34] [PASSED] Fail: overflowing fb with x-axis coordinate
[08:49:34] [PASSED] Fail: overflowing fb with y-axis coordinate
[08:49:34] [PASSED] Fail: overflowing fb with source width
[08:49:34] [PASSED] Fail: overflowing fb with source height
[08:49:34] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[08:49:34] [PASSED] drm_test_framebuffer_cleanup
[08:49:34] =============== drm_test_framebuffer_create  ===============
[08:49:34] [PASSED] ABGR8888 normal sizes
[08:49:34] [PASSED] ABGR8888 max sizes
[08:49:34] [PASSED] ABGR8888 pitch greater than min required
[08:49:34] [PASSED] ABGR8888 pitch less than min required
[08:49:34] [PASSED] ABGR8888 Invalid width
[08:49:34] [PASSED] ABGR8888 Invalid buffer handle
[08:49:34] [PASSED] No pixel format
[08:49:34] [PASSED] ABGR8888 Width 0
[08:49:34] [PASSED] ABGR8888 Height 0
[08:49:34] [PASSED] ABGR8888 Out of bound height * pitch combination
[08:49:34] [PASSED] ABGR8888 Large buffer offset
[08:49:34] [PASSED] ABGR8888 Buffer offset for inexistent plane
[08:49:34] [PASSED] ABGR8888 Invalid flag
[08:49:34] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[08:49:34] [PASSED] ABGR8888 Valid buffer modifier
[08:49:34] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[08:49:34] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[08:49:34] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[08:49:34] [PASSED] NV12 Normal sizes
[08:49:34] [PASSED] NV12 Max sizes
[08:49:34] [PASSED] NV12 Invalid pitch
[08:49:34] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[08:49:34] [PASSED] NV12 different  modifier per-plane
[08:49:34] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[08:49:34] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[08:49:34] [PASSED] NV12 Modifier for inexistent plane
[08:49:34] [PASSED] NV12 Handle for inexistent plane
[08:49:34] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[08:49:34] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[08:49:34] [PASSED] YVU420 Normal sizes
[08:49:34] [PASSED] YVU420 Max sizes
[08:49:34] [PASSED] YVU420 Invalid pitch
[08:49:34] [PASSED] YVU420 Different pitches
[08:49:34] [PASSED] YVU420 Different buffer offsets/pitches
[08:49:34] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[08:49:34] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[08:49:34] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[08:49:34] [PASSED] YVU420 Valid modifier
[08:49:34] [PASSED] YVU420 Different modifiers per plane
[08:49:34] [PASSED] YVU420 Modifier for inexistent plane
[08:49:34] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[08:49:34] [PASSED] X0L2 Normal sizes
[08:49:34] [PASSED] X0L2 Max sizes
[08:49:34] [PASSED] X0L2 Invalid pitch
[08:49:34] [PASSED] X0L2 Pitch greater than minimum required
[08:49:34] [PASSED] X0L2 Handle for inexistent plane
[08:49:34] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[08:49:34] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[08:49:34] [PASSED] X0L2 Valid modifier
[08:49:34] [PASSED] X0L2 Modifier for inexistent plane
[08:49:34] =========== [PASSED] drm_test_framebuffer_create ===========
[08:49:34] [PASSED] drm_test_framebuffer_free
[08:49:34] [PASSED] drm_test_framebuffer_init
[08:49:34] [PASSED] drm_test_framebuffer_init_bad_format
[08:49:34] [PASSED] drm_test_framebuffer_init_dev_mismatch
[08:49:34] [PASSED] drm_test_framebuffer_lookup
[08:49:34] [PASSED] drm_test_framebuffer_lookup_inexistent
[08:49:34] [PASSED] drm_test_framebuffer_modifiers_not_supported
[08:49:34] ================= [PASSED] drm_framebuffer =================
[08:49:34] ================ drm_gem_shmem (8 subtests) ================
[08:49:34] [PASSED] drm_gem_shmem_test_obj_create
[08:49:34] [PASSED] drm_gem_shmem_test_obj_create_private
[08:49:34] [PASSED] drm_gem_shmem_test_pin_pages
[08:49:34] [PASSED] drm_gem_shmem_test_vmap
[08:49:34] [PASSED] drm_gem_shmem_test_get_pages_sgt
[08:49:34] [PASSED] drm_gem_shmem_test_get_sg_table
[08:49:34] [PASSED] drm_gem_shmem_test_madvise
[08:49:34] [PASSED] drm_gem_shmem_test_purge
[08:49:34] ================== [PASSED] drm_gem_shmem ==================
[08:49:34] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[08:49:34] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[08:49:34] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[08:49:34] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[08:49:34] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[08:49:34] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[08:49:34] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[08:49:34] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[08:49:34] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[08:49:34] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[08:49:34] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[08:49:34] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[08:49:34] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[08:49:34] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[08:49:34] [PASSED] drm_test_check_output_bpc_dvi
[08:49:34] [PASSED] drm_test_check_output_bpc_format_vic_1
[08:49:34] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[08:49:34] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[08:49:34] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[08:49:34] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[08:49:34] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[08:49:34] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[08:49:34] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[08:49:34] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[08:49:34] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[08:49:34] [PASSED] drm_test_check_broadcast_rgb_value
[08:49:34] [PASSED] drm_test_check_bpc_8_value
[08:49:34] [PASSED] drm_test_check_bpc_10_value
[08:49:34] [PASSED] drm_test_check_bpc_12_value
[08:49:34] [PASSED] drm_test_check_format_value
[08:49:34] [PASSED] drm_test_check_tmds_char_value
[08:49:34] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[08:49:34] ================= drm_managed (2 subtests) =================
[08:49:34] [PASSED] drm_test_managed_release_action
[08:49:34] [PASSED] drm_test_managed_run_action
[08:49:34] =================== [PASSED] drm_managed ===================
[08:49:34] =================== drm_mm (6 subtests) ====================
[08:49:34] [PASSED] drm_test_mm_init
[08:49:34] [PASSED] drm_test_mm_debug
[08:49:34] [PASSED] drm_test_mm_align32
[08:49:34] [PASSED] drm_test_mm_align64
[08:49:34] [PASSED] drm_test_mm_lowest
[08:49:34] [PASSED] drm_test_mm_highest
[08:49:34] ===================== [PASSED] drm_mm ======================
[08:49:34] ============= drm_modes_analog_tv (5 subtests) =============
[08:49:34] [PASSED] drm_test_modes_analog_tv_mono_576i
[08:49:34] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[08:49:34] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[08:49:34] [PASSED] drm_test_modes_analog_tv_pal_576i
[08:49:34] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[08:49:34] =============== [PASSED] drm_modes_analog_tv ===============
stty: 'standard input': Inappropriate ioctl for device
[08:49:34] ============== drm_plane_helper (2 subtests) ===============
[08:49:34] =============== drm_test_check_plane_state  ================
[08:49:34] [PASSED] clipping_simple
[08:49:34] [PASSED] clipping_rotate_reflect
[08:49:34] [PASSED] positioning_simple
[08:49:34] [PASSED] upscaling
[08:49:34] [PASSED] downscaling
[08:49:34] [PASSED] rounding1
[08:49:34] [PASSED] rounding2
[08:49:34] [PASSED] rounding3
[08:49:34] [PASSED] rounding4
[08:49:34] =========== [PASSED] drm_test_check_plane_state ============
[08:49:34] =========== drm_test_check_invalid_plane_state  ============
[08:49:34] [PASSED] positioning_invalid
[08:49:34] [PASSED] upscaling_invalid
[08:49:34] [PASSED] downscaling_invalid
[08:49:34] ======= [PASSED] drm_test_check_invalid_plane_state ========
[08:49:34] ================ [PASSED] drm_plane_helper =================
[08:49:34] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[08:49:34] ====== drm_test_connector_helper_tv_get_modes_check  =======
[08:49:34] [PASSED] None
[08:49:34] [PASSED] PAL
[08:49:34] [PASSED] NTSC
[08:49:34] [PASSED] Both, NTSC Default
[08:49:34] [PASSED] Both, PAL Default
[08:49:34] [PASSED] Both, NTSC Default, with PAL on command-line
[08:49:34] [PASSED] Both, PAL Default, with NTSC on command-line
[08:49:34] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[08:49:34] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[08:49:34] ================== drm_rect (9 subtests) ===================
[08:49:34] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[08:49:34] [PASSED] drm_test_rect_clip_scaled_not_clipped
[08:49:34] [PASSED] drm_test_rect_clip_scaled_clipped
[08:49:34] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[08:49:34] ================= drm_test_rect_intersect  =================
[08:49:34] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[08:49:34] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[08:49:34] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[08:49:34] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[08:49:34] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[08:49:34] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[08:49:34] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[08:49:34] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[08:49:34] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[08:49:34] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[08:49:34] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[08:49:34] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[08:49:34] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[08:49:34] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[08:49:34] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[08:49:34] ============= [PASSED] drm_test_rect_intersect =============
[08:49:34] ================ drm_test_rect_calc_hscale  ================
[08:49:34] [PASSED] normal use
[08:49:34] [PASSED] out of max range
[08:49:34] [PASSED] out of min range
[08:49:34] [PASSED] zero dst
[08:49:34] [PASSED] negative src
[08:49:34] [PASSED] negative dst
[08:49:34] ============ [PASSED] drm_test_rect_calc_hscale ============
[08:49:34] ================ drm_test_rect_calc_vscale  ================
[08:49:34] [PASSED] normal use
[08:49:34] [PASSED] out of max range
[08:49:34] [PASSED] out of min range
[08:49:34] [PASSED] zero dst
[08:49:34] [PASSED] negative src
[08:49:34] [PASSED] negative dst
[08:49:34] ============ [PASSED] drm_test_rect_calc_vscale ============
[08:49:34] ================== drm_test_rect_rotate  ===================
[08:49:34] [PASSED] reflect-x
[08:49:34] [PASSED] reflect-y
[08:49:34] [PASSED] rotate-0
[08:49:34] [PASSED] rotate-90
[08:49:34] [PASSED] rotate-180
[08:49:34] [PASSED] rotate-270
[08:49:34] ============== [PASSED] drm_test_rect_rotate ===============
[08:49:34] ================ drm_test_rect_rotate_inv  =================
[08:49:34] [PASSED] reflect-x
[08:49:34] [PASSED] reflect-y
[08:49:34] [PASSED] rotate-0
[08:49:34] [PASSED] rotate-90
[08:49:34] [PASSED] rotate-180
[08:49:34] [PASSED] rotate-270
[08:49:34] ============ [PASSED] drm_test_rect_rotate_inv =============
[08:49:34] ==================== [PASSED] drm_rect =====================
[08:49:34] ============================================================
[08:49:34] Testing complete. Ran 526 tests: passed: 526
[08:49:34] Elapsed time: 24.296s total, 1.666s configuring, 22.465s building, 0.156s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[08:49:35] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:49:36] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
[08:49:44] Starting KUnit Kernel (1/1)...
[08:49:44] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[08:49:44] ================= ttm_device (5 subtests) ==================
[08:49:44] [PASSED] ttm_device_init_basic
[08:49:44] [PASSED] ttm_device_init_multiple
[08:49:44] [PASSED] ttm_device_fini_basic
[08:49:44] [PASSED] ttm_device_init_no_vma_man
[08:49:44] ================== ttm_device_init_pools  ==================
[08:49:44] [PASSED] No DMA allocations, no DMA32 required
[08:49:44] [PASSED] DMA allocations, DMA32 required
[08:49:44] [PASSED] No DMA allocations, DMA32 required
[08:49:44] [PASSED] DMA allocations, no DMA32 required
[08:49:44] ============== [PASSED] ttm_device_init_pools ==============
[08:49:44] =================== [PASSED] ttm_device ====================
[08:49:44] ================== ttm_pool (8 subtests) ===================
[08:49:44] ================== ttm_pool_alloc_basic  ===================
[08:49:44] [PASSED] One page
[08:49:44] [PASSED] More than one page
[08:49:44] [PASSED] Above the allocation limit
[08:49:44] [PASSED] One page, with coherent DMA mappings enabled
[08:49:44] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[08:49:44] ============== [PASSED] ttm_pool_alloc_basic ===============
[08:49:44] ============== ttm_pool_alloc_basic_dma_addr  ==============
[08:49:44] [PASSED] One page
[08:49:44] [PASSED] More than one page
[08:49:44] [PASSED] Above the allocation limit
[08:49:44] [PASSED] One page, with coherent DMA mappings enabled
[08:49:44] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[08:49:44] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[08:49:44] [PASSED] ttm_pool_alloc_order_caching_match
[08:49:44] [PASSED] ttm_pool_alloc_caching_mismatch
[08:49:44] [PASSED] ttm_pool_alloc_order_mismatch
[08:49:44] [PASSED] ttm_pool_free_dma_alloc
[08:49:44] [PASSED] ttm_pool_free_no_dma_alloc
[08:49:44] [PASSED] ttm_pool_fini_basic
[08:49:44] ==================== [PASSED] ttm_pool =====================
[08:49:44] ================ ttm_resource (8 subtests) =================
[08:49:44] ================= ttm_resource_init_basic  =================
[08:49:44] [PASSED] Init resource in TTM_PL_SYSTEM
[08:49:44] [PASSED] Init resource in TTM_PL_VRAM
[08:49:44] [PASSED] Init resource in a private placement
[08:49:44] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[08:49:44] ============= [PASSED] ttm_resource_init_basic =============
[08:49:44] [PASSED] ttm_resource_init_pinned
[08:49:44] [PASSED] ttm_resource_fini_basic
[08:49:44] [PASSED] ttm_resource_manager_init_basic
[08:49:44] [PASSED] ttm_resource_manager_usage_basic
[08:49:44] [PASSED] ttm_resource_manager_set_used_basic
[08:49:44] [PASSED] ttm_sys_man_alloc_basic
[08:49:44] [PASSED] ttm_sys_man_free_basic
[08:49:44] ================== [PASSED] ttm_resource ===================
[08:49:44] =================== ttm_tt (15 subtests) ===================
[08:49:44] ==================== ttm_tt_init_basic  ====================
[08:49:44] [PASSED] Page-aligned size
[08:49:44] [PASSED] Extra pages requested
[08:49:44] ================ [PASSED] ttm_tt_init_basic ================
[08:49:44] [PASSED] ttm_tt_init_misaligned
[08:49:44] [PASSED] ttm_tt_fini_basic
[08:49:44] [PASSED] ttm_tt_fini_sg
[08:49:44] [PASSED] ttm_tt_fini_shmem
[08:49:44] [PASSED] ttm_tt_create_basic
[08:49:44] [PASSED] ttm_tt_create_invalid_bo_type
[08:49:44] [PASSED] ttm_tt_create_ttm_exists
[08:49:44] [PASSED] ttm_tt_create_failed
[08:49:44] [PASSED] ttm_tt_destroy_basic
[08:49:44] [PASSED] ttm_tt_populate_null_ttm
[08:49:44] [PASSED] ttm_tt_populate_populated_ttm
[08:49:44] [PASSED] ttm_tt_unpopulate_basic
[08:49:44] [PASSED] ttm_tt_unpopulate_empty_ttm
[08:49:44] [PASSED] ttm_tt_swapin_basic
[08:49:44] ===================== [PASSED] ttm_tt ======================
[08:49:44] =================== ttm_bo (14 subtests) ===================
[08:49:44] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[08:49:44] [PASSED] Cannot be interrupted and sleeps
[08:49:44] [PASSED] Cannot be interrupted, locks straight away
[08:49:44] [PASSED] Can be interrupted, sleeps
[08:49:44] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[08:49:44] [PASSED] ttm_bo_reserve_locked_no_sleep
[08:49:44] [PASSED] ttm_bo_reserve_no_wait_ticket
[08:49:44] [PASSED] ttm_bo_reserve_double_resv
[08:49:44] [PASSED] ttm_bo_reserve_interrupted
[08:49:44] [PASSED] ttm_bo_reserve_deadlock
[08:49:44] [PASSED] ttm_bo_unreserve_basic
[08:49:44] [PASSED] ttm_bo_unreserve_pinned
[08:49:44] [PASSED] ttm_bo_unreserve_bulk
[08:49:44] [PASSED] ttm_bo_put_basic
[08:49:44] [PASSED] ttm_bo_put_shared_resv
[08:49:44] [PASSED] ttm_bo_pin_basic
[08:49:44] [PASSED] ttm_bo_pin_unpin_resource
[08:49:44] [PASSED] ttm_bo_multiple_pin_one_unpin
[08:49:44] ===================== [PASSED] ttm_bo ======================
[08:49:44] ============== ttm_bo_validate (22 subtests) ===============
[08:49:44] ============== ttm_bo_init_reserved_sys_man  ===============
[08:49:44] [PASSED] Buffer object for userspace
[08:49:44] [PASSED] Kernel buffer object
[08:49:44] [PASSED] Shared buffer object
[08:49:44] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[08:49:44] ============== ttm_bo_init_reserved_mock_man  ==============
[08:49:44] [PASSED] Buffer object for userspace
[08:49:44] [PASSED] Kernel buffer object
[08:49:44] [PASSED] Shared buffer object
[08:49:44] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[08:49:44] [PASSED] ttm_bo_init_reserved_resv
[08:49:44] ================== ttm_bo_validate_basic  ==================
[08:49:44] [PASSED] Buffer object for userspace
[08:49:44] [PASSED] Kernel buffer object
[08:49:44] [PASSED] Shared buffer object
[08:49:44] ============== [PASSED] ttm_bo_validate_basic ==============
[08:49:44] [PASSED] ttm_bo_validate_invalid_placement
[08:49:44] ============= ttm_bo_validate_same_placement  ==============
[08:49:44] [PASSED] System manager
[08:49:44] [PASSED] VRAM manager
[08:49:44] ========= [PASSED] ttm_bo_validate_same_placement ==========
[08:49:44] [PASSED] ttm_bo_validate_failed_alloc
[08:49:44] [PASSED] ttm_bo_validate_pinned
[08:49:44] [PASSED] ttm_bo_validate_busy_placement
[08:49:44] ================ ttm_bo_validate_multihop  =================
[08:49:44] [PASSED] Buffer object for userspace
[08:49:44] [PASSED] Kernel buffer object
[08:49:44] [PASSED] Shared buffer object
[08:49:44] ============ [PASSED] ttm_bo_validate_multihop =============
[08:49:44] ========== ttm_bo_validate_no_placement_signaled  ==========
[08:49:44] [PASSED] Buffer object in system domain, no page vector
[08:49:44] [PASSED] Buffer object in system domain with an existing page vector
[08:49:44] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[08:49:44] ======== ttm_bo_validate_no_placement_not_signaled  ========
[08:49:44] [PASSED] Buffer object for userspace
[08:49:44] [PASSED] Kernel buffer object
[08:49:44] [PASSED] Shared buffer object
[08:49:44] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[08:49:44] [PASSED] ttm_bo_validate_move_fence_signaled
[08:49:44] ========= ttm_bo_validate_move_fence_not_signaled  =========
[08:49:44] [PASSED] Waits for GPU
[08:49:44] [PASSED] Tries to lock straight away
[08:49:44] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[08:49:44] [PASSED] ttm_bo_validate_swapout
[08:49:44] [PASSED] ttm_bo_validate_happy_evict
[08:49:44] [PASSED] ttm_bo_validate_all_pinned_evict
[08:49:44] [PASSED] ttm_bo_validate_allowed_only_evict
[08:49:44] [PASSED] ttm_bo_validate_deleted_evict
[08:49:44] [PASSED] ttm_bo_validate_busy_domain_evict
[08:49:44] [PASSED] ttm_bo_validate_evict_gutting
[08:49:44] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[08:49:44] ================= [PASSED] ttm_bo_validate =================
[08:49:44] ============================================================
[08:49:44] Testing complete. Ran 102 tests: passed: 102
[08:49:44] Elapsed time: 9.799s total, 1.556s configuring, 7.575s building, 0.553s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


