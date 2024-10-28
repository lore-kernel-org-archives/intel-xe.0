Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2270DD13595
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 04:20:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3C610E32B;
	Mon, 28 Oct 2024 04:20:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7C210E32A;
 Mon, 28 Oct 2024 04:20:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/hdcp=3A_Add_check_to_re?=
 =?utf-8?q?move_hdcp2_compatibilty_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Oct 2024 04:20:42 -0000
Message-ID: <173008924250.1353079.11049854012025550331@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241022055655.1902-1-suraj.kandpal@intel.com>
In-Reply-To: <20241022055655.1902-1-suraj.kandpal@intel.com>
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

Series: drm/xe/hdcp: Add check to remove hdcp2 compatibilty (rev5)
URL   : https://patchwork.freedesktop.org/series/140292/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[04:19:32] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:19:37] Building KUnit Kernel ...
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

[04:20:04] Starting KUnit Kernel (1/1)...
[04:20:04] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[04:20:05] =================== guc_dbm (7 subtests) ===================
[04:20:05] [PASSED] test_empty
[04:20:05] [PASSED] test_default
[04:20:05] ======================== test_size  ========================
[04:20:05] [PASSED] 4
[04:20:05] [PASSED] 8
[04:20:05] [PASSED] 32
[04:20:05] [PASSED] 256
[04:20:05] ==================== [PASSED] test_size ====================
[04:20:05] ======================= test_reuse  ========================
[04:20:05] [PASSED] 4
[04:20:05] [PASSED] 8
[04:20:05] [PASSED] 32
[04:20:05] [PASSED] 256
[04:20:05] =================== [PASSED] test_reuse ====================
[04:20:05] =================== test_range_overlap  ====================
[04:20:05] [PASSED] 4
[04:20:05] [PASSED] 8
[04:20:05] [PASSED] 32
[04:20:05] [PASSED] 256
[04:20:05] =============== [PASSED] test_range_overlap ================
[04:20:05] =================== test_range_compact  ====================
[04:20:05] [PASSED] 4
[04:20:05] [PASSED] 8
[04:20:05] [PASSED] 32
[04:20:05] [PASSED] 256
[04:20:05] =============== [PASSED] test_range_compact ================
[04:20:05] ==================== test_range_spare  =====================
[04:20:05] [PASSED] 4
[04:20:05] [PASSED] 8
[04:20:05] [PASSED] 32
[04:20:05] [PASSED] 256
[04:20:05] ================ [PASSED] test_range_spare =================
[04:20:05] ===================== [PASSED] guc_dbm =====================
[04:20:05] =================== guc_idm (6 subtests) ===================
[04:20:05] [PASSED] bad_init
[04:20:05] [PASSED] no_init
[04:20:05] [PASSED] init_fini
[04:20:05] [PASSED] check_used
[04:20:05] [PASSED] check_quota
[04:20:05] [PASSED] check_all
[04:20:05] ===================== [PASSED] guc_idm =====================
[04:20:05] ================== no_relay (3 subtests) ===================
[04:20:05] [PASSED] xe_drops_guc2pf_if_not_ready
[04:20:05] [PASSED] xe_drops_guc2vf_if_not_ready
[04:20:05] [PASSED] xe_rejects_send_if_not_ready
[04:20:05] ==================== [PASSED] no_relay =====================
[04:20:05] ================== pf_relay (14 subtests) ==================
[04:20:05] [PASSED] pf_rejects_guc2pf_too_short
[04:20:05] [PASSED] pf_rejects_guc2pf_too_long
[04:20:05] [PASSED] pf_rejects_guc2pf_no_payload
[04:20:05] [PASSED] pf_fails_no_payload
[04:20:05] [PASSED] pf_fails_bad_origin
[04:20:05] [PASSED] pf_fails_bad_type
[04:20:05] [PASSED] pf_txn_reports_error
[04:20:05] [PASSED] pf_txn_sends_pf2guc
[04:20:05] [PASSED] pf_sends_pf2guc
[04:20:05] [SKIPPED] pf_loopback_nop
[04:20:05] [SKIPPED] pf_loopback_echo
[04:20:05] [SKIPPED] pf_loopback_fail
[04:20:05] [SKIPPED] pf_loopback_busy
[04:20:05] [SKIPPED] pf_loopback_retry
[04:20:05] ==================== [PASSED] pf_relay =====================
[04:20:05] ================== vf_relay (3 subtests) ===================
[04:20:05] [PASSED] vf_rejects_guc2vf_too_short
[04:20:05] [PASSED] vf_rejects_guc2vf_too_long
[04:20:05] [PASSED] vf_rejects_guc2vf_no_payload
[04:20:05] ==================== [PASSED] vf_relay =====================
[04:20:05] ================= pf_service (11 subtests) =================
[04:20:05] [PASSED] pf_negotiate_any
[04:20:05] [PASSED] pf_negotiate_base_match
[04:20:05] [PASSED] pf_negotiate_base_newer
[04:20:05] [PASSED] pf_negotiate_base_next
[04:20:05] [SKIPPED] pf_negotiate_base_older
[04:20:05] [PASSED] pf_negotiate_base_prev
[04:20:05] [PASSED] pf_negotiate_latest_match
[04:20:05] [PASSED] pf_negotiate_latest_newer
[04:20:05] [PASSED] pf_negotiate_latest_next
[04:20:05] [SKIPPED] pf_negotiate_latest_older
[04:20:05] [SKIPPED] pf_negotiate_latest_prev
[04:20:05] =================== [PASSED] pf_service ====================
[04:20:05] ===================== lmtt (1 subtest) =====================
[04:20:05] ======================== test_ops  =========================
[04:20:05] [PASSED] 2-level
[04:20:05] [PASSED] multi-level
[04:20:05] ==================== [PASSED] test_ops =====================
[04:20:05] ====================== [PASSED] lmtt =======================
[04:20:05] =================== xe_mocs (2 subtests) ===================
[04:20:05] ================ xe_live_mocs_kernel_kunit  ================
[04:20:05] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[04:20:05] ================ xe_live_mocs_reset_kunit  =================
[04:20:05] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[04:20:05] ==================== [SKIPPED] xe_mocs =====================
[04:20:05] ================= xe_migrate (2 subtests) ==================
[04:20:05] ================= xe_migrate_sanity_kunit  =================
[04:20:05] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[04:20:05] ================== xe_validate_ccs_kunit  ==================
[04:20:05] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[04:20:05] =================== [SKIPPED] xe_migrate ===================
[04:20:05] ================== xe_dma_buf (1 subtest) ==================
[04:20:05] ==================== xe_dma_buf_kunit  =====================
[04:20:05] ================ [SKIPPED] xe_dma_buf_kunit ================
[04:20:05] =================== [SKIPPED] xe_dma_buf ===================
[04:20:05] ==================== xe_bo (3 subtests) ====================
[04:20:05] ================== xe_ccs_migrate_kunit  ===================
[04:20:05] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[04:20:05] ==================== xe_bo_evict_kunit  ====================
[04:20:05] =============== [SKIPPED] xe_bo_evict_kunit ================
[04:20:05] =================== xe_bo_shrink_kunit  ====================
[04:20:05] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[04:20:05] ===================== [SKIPPED] xe_bo ======================
[04:20:05] ==================== args (11 subtests) ====================
[04:20:05] [PASSED] count_args_test
[04:20:05] [PASSED] call_args_example
[04:20:05] [PASSED] call_args_test
[04:20:05] [PASSED] drop_first_arg_example
[04:20:05] [PASSED] drop_first_arg_test
[04:20:05] [PASSED] first_arg_example
[04:20:05] [PASSED] first_arg_test
[04:20:05] [PASSED] last_arg_example
[04:20:05] [PASSED] last_arg_test
[04:20:05] [PASSED] pick_arg_example
[04:20:05] [PASSED] sep_comma_examplestty: 'standard input': Inappropriate ioctl for device

[04:20:05] ====================== [PASSED] args =======================
[04:20:05] =================== xe_pci (2 subtests) ====================
[04:20:05] [PASSED] xe_gmdid_graphics_ip
[04:20:05] [PASSED] xe_gmdid_media_ip
[04:20:05] ===================== [PASSED] xe_pci ======================
[04:20:05] =================== xe_rtp (2 subtests) ====================
[04:20:05] =============== xe_rtp_process_to_sr_tests  ================
[04:20:05] [PASSED] coalesce-same-reg
[04:20:05] [PASSED] no-match-no-add
[04:20:05] [PASSED] match-or
[04:20:05] [PASSED] match-or-xfail
[04:20:05] [PASSED] no-match-no-add-multiple-rules
[04:20:05] [PASSED] two-regs-two-entries
[04:20:05] [PASSED] clr-one-set-other
[04:20:05] [PASSED] set-field
[04:20:05] [PASSED] conflict-duplicate
[04:20:05] [PASSED] conflict-not-disjoint
[04:20:05] [PASSED] conflict-reg-type
[04:20:05] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[04:20:05] ================== xe_rtp_process_tests  ===================
[04:20:05] [PASSED] active1
[04:20:05] [PASSED] active2
[04:20:05] [PASSED] active-inactive
[04:20:05] [PASSED] inactive-active
[04:20:05] [PASSED] inactive-1st_or_active-inactive
[04:20:05] [PASSED] inactive-2nd_or_active-inactive
[04:20:05] [PASSED] inactive-last_or_active-inactive
[04:20:05] [PASSED] inactive-no_or_active-inactive
[04:20:05] ============== [PASSED] xe_rtp_process_tests ===============
[04:20:05] ===================== [PASSED] xe_rtp ======================
[04:20:05] ==================== xe_wa (1 subtest) =====================
[04:20:05] ======================== xe_wa_gt  =========================
[04:20:05] [PASSED] TIGERLAKE (B0)
[04:20:05] [PASSED] DG1 (A0)
[04:20:05] [PASSED] DG1 (B0)
[04:20:05] [PASSED] ALDERLAKE_S (A0)
[04:20:05] [PASSED] ALDERLAKE_S (B0)
[04:20:05] [PASSED] ALDERLAKE_S (C0)
[04:20:05] [PASSED] ALDERLAKE_S (D0)
[04:20:05] [PASSED] ALDERLAKE_P (A0)
[04:20:05] [PASSED] ALDERLAKE_P (B0)
[04:20:05] [PASSED] ALDERLAKE_P (C0)
[04:20:05] [PASSED] ALDERLAKE_S_RPLS (D0)
[04:20:05] [PASSED] ALDERLAKE_P_RPLU (E0)
[04:20:05] [PASSED] DG2_G10 (C0)
[04:20:05] [PASSED] DG2_G11 (B1)
[04:20:05] [PASSED] DG2_G12 (A1)
[04:20:05] [PASSED] METEORLAKE (g:A0, m:A0)
[04:20:05] [PASSED] METEORLAKE (g:A0, m:A0)
[04:20:05] [PASSED] METEORLAKE (g:A0, m:A0)
[04:20:05] [PASSED] LUNARLAKE (g:A0, m:A0)
[04:20:05] [PASSED] LUNARLAKE (g:B0, m:A0)
[04:20:05] [PASSED] BATTLEMAGE (g:A0, m:A1)
[04:20:05] ==================== [PASSED] xe_wa_gt =====================
[04:20:05] ====================== [PASSED] xe_wa ======================
[04:20:05] ============================================================
[04:20:05] Testing complete. Ran 122 tests: passed: 106, skipped: 16
[04:20:05] Elapsed time: 32.664s total, 4.433s configuring, 27.964s building, 0.215s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[04:20:05] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:20:07] Building KUnit Kernel ...
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

[04:20:29] Starting KUnit Kernel (1/1)...
[04:20:29] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[04:20:29] ================== drm_buddy (7 subtests) ==================
[04:20:29] [PASSED] drm_test_buddy_alloc_limit
[04:20:29] [PASSED] drm_test_buddy_alloc_optimistic
[04:20:29] [PASSED] drm_test_buddy_alloc_pessimistic
[04:20:29] [PASSED] drm_test_buddy_alloc_pathological
[04:20:29] [PASSED] drm_test_buddy_alloc_contiguous
[04:20:29] [PASSED] drm_test_buddy_alloc_clear
[04:20:29] [PASSED] drm_test_buddy_alloc_range_bias
[04:20:29] ==================== [PASSED] drm_buddy ====================
[04:20:29] ============= drm_cmdline_parser (40 subtests) =============
[04:20:29] [PASSED] drm_test_cmdline_force_d_only
[04:20:29] [PASSED] drm_test_cmdline_force_D_only_dvi
[04:20:29] [PASSED] drm_test_cmdline_force_D_only_hdmi
[04:20:29] [PASSED] drm_test_cmdline_force_D_only_not_digital
[04:20:29] [PASSED] drm_test_cmdline_force_e_only
[04:20:29] [PASSED] drm_test_cmdline_res
[04:20:29] [PASSED] drm_test_cmdline_res_vesa
[04:20:29] [PASSED] drm_test_cmdline_res_vesa_rblank
[04:20:29] [PASSED] drm_test_cmdline_res_rblank
[04:20:29] [PASSED] drm_test_cmdline_res_bpp
[04:20:29] [PASSED] drm_test_cmdline_res_refresh
[04:20:29] [PASSED] drm_test_cmdline_res_bpp_refresh
[04:20:29] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[04:20:29] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[04:20:29] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[04:20:29] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[04:20:29] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[04:20:29] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[04:20:29] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[04:20:29] [PASSED] drm_test_cmdline_res_margins_force_on
[04:20:29] [PASSED] drm_test_cmdline_res_vesa_margins
[04:20:29] [PASSED] drm_test_cmdline_name
[04:20:29] [PASSED] drm_test_cmdline_name_bpp
[04:20:29] [PASSED] drm_test_cmdline_name_option
[04:20:29] [PASSED] drm_test_cmdline_name_bpp_option
[04:20:29] [PASSED] drm_test_cmdline_rotate_0
[04:20:29] [PASSED] drm_test_cmdline_rotate_90
[04:20:29] [PASSED] drm_test_cmdline_rotate_180
[04:20:29] [PASSED] drm_test_cmdline_rotate_270
[04:20:29] [PASSED] drm_test_cmdline_hmirror
[04:20:29] [PASSED] drm_test_cmdline_vmirror
[04:20:29] [PASSED] drm_test_cmdline_margin_options
[04:20:29] [PASSED] drm_test_cmdline_multiple_options
[04:20:29] [PASSED] drm_test_cmdline_bpp_extra_and_option
[04:20:29] [PASSED] drm_test_cmdline_extra_and_option
[04:20:29] [PASSED] drm_test_cmdline_freestanding_options
[04:20:29] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[04:20:29] [PASSED] drm_test_cmdline_panel_orientation
[04:20:29] ================ drm_test_cmdline_invalid  =================
[04:20:29] [PASSED] margin_only
[04:20:29] [PASSED] interlace_only
[04:20:29] [PASSED] res_missing_x
[04:20:29] [PASSED] res_missing_y
[04:20:29] [PASSED] res_bad_y
[04:20:29] [PASSED] res_missing_y_bpp
[04:20:29] [PASSED] res_bad_bpp
[04:20:29] [PASSED] res_bad_refresh
[04:20:29] [PASSED] res_bpp_refresh_force_on_off
[04:20:29] [PASSED] res_invalid_mode
[04:20:29] [PASSED] res_bpp_wrong_place_mode
[04:20:29] [PASSED] name_bpp_refresh
[04:20:29] [PASSED] name_refresh
[04:20:29] [PASSED] name_refresh_wrong_mode
[04:20:29] [PASSED] name_refresh_invalid_mode
[04:20:29] [PASSED] rotate_multiple
[04:20:29] [PASSED] rotate_invalid_val
[04:20:29] [PASSED] rotate_truncated
[04:20:29] [PASSED] invalid_option
[04:20:29] [PASSED] invalid_tv_option
[04:20:29] [PASSED] truncated_tv_option
[04:20:29] ============ [PASSED] drm_test_cmdline_invalid =============
[04:20:29] =============== drm_test_cmdline_tv_options  ===============
[04:20:29] [PASSED] NTSC
[04:20:29] [PASSED] NTSC_443
[04:20:29] [PASSED] NTSC_J
[04:20:29] [PASSED] PAL
[04:20:29] [PASSED] PAL_M
[04:20:29] [PASSED] PAL_N
[04:20:29] [PASSED] SECAM
[04:20:29] [PASSED] MONO_525
[04:20:29] [PASSED] MONO_625
[04:20:29] =========== [PASSED] drm_test_cmdline_tv_options ===========
[04:20:29] =============== [PASSED] drm_cmdline_parser ================
[04:20:29] ========== drmm_connector_hdmi_init (19 subtests) ==========
[04:20:29] [PASSED] drm_test_connector_hdmi_init_valid
[04:20:29] [PASSED] drm_test_connector_hdmi_init_bpc_8
[04:20:29] [PASSED] drm_test_connector_hdmi_init_bpc_10
[04:20:29] [PASSED] drm_test_connector_hdmi_init_bpc_12
[04:20:29] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[04:20:29] [PASSED] drm_test_connector_hdmi_init_bpc_null
[04:20:29] [PASSED] drm_test_connector_hdmi_init_formats_empty
[04:20:29] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[04:20:29] [PASSED] drm_test_connector_hdmi_init_null_ddc
[04:20:29] [PASSED] drm_test_connector_hdmi_init_null_product
[04:20:29] [PASSED] drm_test_connector_hdmi_init_null_vendor
[04:20:29] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[04:20:29] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[04:20:29] [PASSED] drm_test_connector_hdmi_init_product_valid
[04:20:29] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[04:20:29] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[04:20:29] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[04:20:29] ========= drm_test_connector_hdmi_init_type_valid  =========
[04:20:29] [PASSED] HDMI-A
[04:20:29] [PASSED] HDMI-B
[04:20:29] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[04:20:29] ======== drm_test_connector_hdmi_init_type_invalid  ========
[04:20:29] [PASSED] Unknown
[04:20:29] [PASSED] VGA
[04:20:29] [PASSED] DVI-I
[04:20:29] [PASSED] DVI-D
[04:20:29] [PASSED] DVI-A
[04:20:29] [PASSED] Composite
[04:20:29] [PASSED] SVIDEO
[04:20:29] [PASSED] LVDS
[04:20:29] [PASSED] Component
[04:20:29] [PASSED] DIN
[04:20:29] [PASSED] DP
[04:20:29] [PASSED] TV
[04:20:29] [PASSED] eDP
[04:20:29] [PASSED] Virtual
[04:20:29] [PASSED] DSI
[04:20:29] [PASSED] DPI
[04:20:29] [PASSED] Writeback
[04:20:29] [PASSED] SPI
[04:20:29] [PASSED] USB
[04:20:29] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[04:20:29] ============ [PASSED] drmm_connector_hdmi_init =============
[04:20:29] ============= drmm_connector_init (3 subtests) =============
[04:20:29] [PASSED] drm_test_drmm_connector_init
[04:20:29] [PASSED] drm_test_drmm_connector_init_null_ddc
[04:20:29] ========= drm_test_drmm_connector_init_type_valid  =========
[04:20:29] [PASSED] Unknown
[04:20:29] [PASSED] VGA
[04:20:29] [PASSED] DVI-I
[04:20:29] [PASSED] DVI-D
[04:20:29] [PASSED] DVI-A
[04:20:29] [PASSED] Composite
[04:20:29] [PASSED] SVIDEO
[04:20:29] [PASSED] LVDS
[04:20:29] [PASSED] Component
[04:20:29] [PASSED] DIN
[04:20:29] [PASSED] DP
[04:20:29] [PASSED] HDMI-A
[04:20:29] [PASSED] HDMI-B
[04:20:29] [PASSED] TV
[04:20:29] [PASSED] eDP
[04:20:29] [PASSED] Virtual
[04:20:29] [PASSED] DSI
[04:20:29] [PASSED] DPI
[04:20:29] [PASSED] Writeback
[04:20:29] [PASSED] SPI
[04:20:29] [PASSED] USB
[04:20:29] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[04:20:29] =============== [PASSED] drmm_connector_init ===============
[04:20:29] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[04:20:29] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[04:20:29] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[04:20:29] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[04:20:29] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[04:20:29] ========== drm_test_get_tv_mode_from_name_valid  ===========
[04:20:29] [PASSED] NTSC
[04:20:29] [PASSED] NTSC-443
[04:20:29] [PASSED] NTSC-J
[04:20:29] [PASSED] PAL
[04:20:29] [PASSED] PAL-M
[04:20:29] [PASSED] PAL-N
[04:20:29] [PASSED] SECAM
[04:20:29] [PASSED] Mono
[04:20:29] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[04:20:29] [PASSED] drm_test_get_tv_mode_from_name_truncated
[04:20:29] ============ [PASSED] drm_get_tv_mode_from_name ============
[04:20:29] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[04:20:29] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[04:20:29] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[04:20:29] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[04:20:29] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[04:20:29] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[04:20:29] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[04:20:29] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[04:20:29] [PASSED] VIC 96
[04:20:29] [PASSED] VIC 97
[04:20:29] [PASSED] VIC 101
[04:20:29] [PASSED] VIC 102
[04:20:29] [PASSED] VIC 106
[04:20:29] [PASSED] VIC 107
[04:20:29] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[04:20:29] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[04:20:29] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[04:20:29] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[04:20:29] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[04:20:29] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[04:20:29] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[04:20:29] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[04:20:29] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[04:20:29] [PASSED] Automatic
[04:20:29] [PASSED] Full
[04:20:29] [PASSED] Limited 16:235
[04:20:29] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[04:20:29] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[04:20:29] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[04:20:29] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[04:20:29] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[04:20:29] [PASSED] RGB
[04:20:29] [PASSED] YUV 4:2:0
[04:20:29] [PASSED] YUV 4:2:2
[04:20:29] [PASSED] YUV 4:4:4
[04:20:29] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[04:20:29] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[04:20:29] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[04:20:29] ============= drm_damage_helper (21 subtests) ==============
[04:20:29] [PASSED] drm_test_damage_iter_no_damage
[04:20:29] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[04:20:29] [PASSED] drm_test_damage_iter_no_damage_src_moved
[04:20:29] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[04:20:29] [PASSED] drm_test_damage_iter_no_damage_not_visible
[04:20:29] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[04:20:29] [PASSED] drm_test_damage_iter_no_damage_no_fb
[04:20:29] [PASSED] drm_test_damage_iter_simple_damage
[04:20:29] [PASSED] drm_test_damage_iter_single_damage
[04:20:29] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[04:20:29] [PASSED] drm_test_damage_iter_single_damage_outside_src
[04:20:29] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[04:20:29] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[04:20:29] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[04:20:29] [PASSED] drm_test_damage_iter_single_damage_src_moved
[04:20:29] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[04:20:29] [PASSED] drm_test_damage_iter_damage
[04:20:29] [PASSED] drm_test_damage_iter_damage_one_intersect
[04:20:29] [PASSED] drm_test_damage_iter_damage_one_outside
[04:20:29] [PASSED] drm_test_damage_iter_damage_src_moved
[04:20:29] [PASSED] drm_test_damage_iter_damage_not_visible
[04:20:29] ================ [PASSED] drm_damage_helper ================
[04:20:29] ============== drm_dp_mst_helper (3 subtests) ==============
[04:20:29] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[04:20:29] [PASSED] Clock 154000 BPP 30 DSC disabled
[04:20:29] [PASSED] Clock 234000 BPP 30 DSC disabled
[04:20:29] [PASSED] Clock 297000 BPP 24 DSC disabled
[04:20:29] [PASSED] Clock 332880 BPP 24 DSC enabled
[04:20:29] [PASSED] Clock 324540 BPP 24 DSC enabled
[04:20:29] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[04:20:29] ============== drm_test_dp_mst_calc_pbn_div  ===============
[04:20:29] [PASSED] Link rate 2000000 lane count 4
[04:20:29] [PASSED] Link rate 2000000 lane count 2
[04:20:29] [PASSED] Link rate 2000000 lane count 1
[04:20:29] [PASSED] Link rate 1350000 lane count 4
[04:20:29] [PASSED] Link rate 1350000 lane count 2
[04:20:29] [PASSED] Link rate 1350000 lane count 1
[04:20:29] [PASSED] Link rate 1000000 lane count 4
[04:20:29] [PASSED] Link rate 1000000 lane count 2
[04:20:29] [PASSED] Link rate 1000000 lane count 1
[04:20:29] [PASSED] Link rate 810000 lane count 4
[04:20:29] [PASSED] Link rate 810000 lane count 2
[04:20:29] [PASSED] Link rate 810000 lane count 1
[04:20:29] [PASSED] Link rate 540000 lane count 4
[04:20:29] [PASSED] Link rate 540000 lane count 2
[04:20:29] [PASSED] Link rate 540000 lane count 1
[04:20:29] [PASSED] Link rate 270000 lane count 4
[04:20:29] [PASSED] Link rate 270000 lane count 2
[04:20:29] [PASSED] Link rate 270000 lane count 1
[04:20:29] [PASSED] Link rate 162000 lane count 4
[04:20:29] [PASSED] Link rate 162000 lane count 2
[04:20:29] [PASSED] Link rate 162000 lane count 1
[04:20:29] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[04:20:29] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[04:20:29] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[04:20:29] [PASSED] DP_POWER_UP_PHY with port number
[04:20:29] [PASSED] DP_POWER_DOWN_PHY with port number
[04:20:29] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[04:20:29] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[04:20:29] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[04:20:29] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[04:20:29] [PASSED] DP_QUERY_PAYLOAD with port number
[04:20:29] [PASSED] DP_QUERY_PAYLOAD with VCPI
[04:20:29] [PASSED] DP_REMOTE_DPCD_READ with port number
[04:20:29] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[04:20:29] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[04:20:29] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[04:20:29] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[04:20:29] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[04:20:29] [PASSED] DP_REMOTE_I2C_READ with port number
[04:20:29] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[04:20:29] [PASSED] DP_REMOTE_I2C_READ with transactions array
[04:20:29] [PASSED] DP_REMOTE_I2C_WRITE with port number
[04:20:29] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[04:20:29] [PASSED] DP_REMOTE_I2C_WRITE with data array
[04:20:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[04:20:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[04:20:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[04:20:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[04:20:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[04:20:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[04:20:29] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[04:20:29] ================ [PASSED] drm_dp_mst_helper ================
[04:20:29] ================== drm_exec (7 subtests) ===================
[04:20:29] [PASSED] sanitycheck
[04:20:29] [PASSED] test_lock
[04:20:29] [PASSED] test_lock_unlock
[04:20:29] [PASSED] test_duplicates
[04:20:29] [PASSED] test_prepare
[04:20:29] [PASSED] test_prepare_array
[04:20:29] [PASSED] test_multiple_loops
[04:20:29] ==================== [PASSED] drm_exec =====================
[04:20:29] =========== drm_format_helper_test (17 subtests) ===========
[04:20:29] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[04:20:29] [PASSED] single_pixel_source_buffer
[04:20:29] [PASSED] single_pixel_clip_rectangle
[04:20:29] [PASSED] well_known_colors
[04:20:29] [PASSED] destination_pitch
[04:20:29] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[04:20:29] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[04:20:29] [PASSED] single_pixel_source_buffer
[04:20:29] [PASSED] single_pixel_clip_rectangle
[04:20:29] [PASSED] well_known_colors
[04:20:29] [PASSED] destination_pitch
[04:20:29] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[04:20:29] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[04:20:29] [PASSED] single_pixel_source_buffer
[04:20:29] [PASSED] single_pixel_clip_rectangle
[04:20:29] [PASSED] well_known_colors
[04:20:29] [PASSED] destination_pitch
[04:20:29] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[04:20:29] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[04:20:29] [PASSED] single_pixel_source_buffer
[04:20:29] [PASSED] single_pixel_clip_rectangle
[04:20:29] [PASSED] well_known_colors
[04:20:29] [PASSED] destination_pitch
[04:20:29] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[04:20:29] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[04:20:29] [PASSED] single_pixel_source_buffer
[04:20:29] [PASSED] single_pixel_clip_rectangle
[04:20:29] [PASSED] well_known_colors
[04:20:29] [PASSED] destination_pitch
[04:20:29] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[04:20:29] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[04:20:29] [PASSED] single_pixel_source_buffer
[04:20:29] [PASSED] single_pixel_clip_rectangle
[04:20:29] [PASSED] well_known_colors
[04:20:29] [PASSED] destination_pitch
[04:20:29] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[04:20:29] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[04:20:29] [PASSED] single_pixel_source_buffer
[04:20:29] [PASSED] single_pixel_clip_rectangle
[04:20:29] [PASSED] well_known_colors
[04:20:29] [PASSED] destination_pitch
[04:20:29] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[04:20:29] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[04:20:29] [PASSED] single_pixel_source_buffer
[04:20:29] [PASSED] single_pixel_clip_rectangle
[04:20:29] [PASSED] well_known_colors
[04:20:29] [PASSED] destination_pitch
[04:20:29] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[04:20:29] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[04:20:29] [PASSED] single_pixel_source_buffer
[04:20:29] [PASSED] single_pixel_clip_rectangle
[04:20:29] [PASSED] well_known_colors
[04:20:29] [PASSED] destination_pitch
[04:20:29] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[04:20:29] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[04:20:29] [PASSED] single_pixel_source_buffer
[04:20:29] [PASSED] single_pixel_clip_rectangle
[04:20:29] [PASSED] well_known_colors
[04:20:29] [PASSED] destination_pitch
[04:20:29] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[04:20:29] ============== drm_test_fb_xrgb8888_to_mono  ===============
[04:20:29] [PASSED] single_pixel_source_buffer
[04:20:29] [PASSED] single_pixel_clip_rectangle
[04:20:29] [PASSED] well_known_colors
[04:20:29] [PASSED] destination_pitch
[04:20:29] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[04:20:29] ==================== drm_test_fb_swab  =====================
[04:20:29] [PASSED] single_pixel_source_buffer
[04:20:29] [PASSED] single_pixel_clip_rectangle
[04:20:29] [PASSED] well_known_colors
[04:20:29] [PASSED] destination_pitch
[04:20:29] ================ [PASSED] drm_test_fb_swab =================
[04:20:29] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[04:20:29] [PASSED] single_pixel_source_buffer
[04:20:29] [PASSED] single_pixel_clip_rectangle
[04:20:29] [PASSED] well_known_colors
[04:20:29] [PASSED] destination_pitch
[04:20:29] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[04:20:29] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[04:20:29] [PASSED] single_pixel_source_buffer
[04:20:29] [PASSED] single_pixel_clip_rectangle
[04:20:29] [PASSED] well_known_colors
[04:20:29] [PASSED] destination_pitch
[04:20:29] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[04:20:29] ================= drm_test_fb_clip_offset  =================
[04:20:29] [PASSED] pass through
[04:20:29] [PASSED] horizontal offset
[04:20:29] [PASSED] vertical offset
[04:20:29] [PASSED] horizontal and vertical offset
[04:20:29] [PASSED] horizontal offset (custom pitch)
[04:20:29] [PASSED] vertical offset (custom pitch)
[04:20:29] [PASSED] horizontal and vertical offset (custom pitch)
[04:20:29] ============= [PASSED] drm_test_fb_clip_offset =============
[04:20:29] ============== drm_test_fb_build_fourcc_list  ==============
[04:20:29] [PASSED] no native formats
[04:20:29] [PASSED] XRGB8888 as native format
[04:20:29] [PASSED] remove duplicates
[04:20:29] [PASSED] convert alpha formats
[04:20:29] [PASSED] random formats
[04:20:29] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[04:20:29] =================== drm_test_fb_memcpy  ====================
[04:20:29] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[04:20:29] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[04:20:29] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[04:20:29] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[04:20:29] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[04:20:29] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[04:20:29] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[04:20:29] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[04:20:29] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[04:20:29] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[04:20:29] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[04:20:29] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[04:20:29] =============== [PASSED] drm_test_fb_memcpy ================
[04:20:29] ============= [PASSED] drm_format_helper_test ==============
[04:20:29] ================= drm_format (18 subtests) =================
[04:20:29] [PASSED] drm_test_format_block_width_invalid
[04:20:29] [PASSED] drm_test_format_block_width_one_plane
[04:20:29] [PASSED] drm_test_format_block_width_two_plane
[04:20:29] [PASSED] drm_test_format_block_width_three_plane
[04:20:29] [PASSED] drm_test_format_block_width_tiled
[04:20:29] [PASSED] drm_test_format_block_height_invalid
[04:20:29] [PASSED] drm_test_format_block_height_one_plane
[04:20:29] [PASSED] drm_test_format_block_height_two_plane
[04:20:29] [PASSED] drm_test_format_block_height_three_plane
[04:20:29] [PASSED] drm_test_format_block_height_tiled
[04:20:29] [PASSED] drm_test_format_min_pitch_invalid
[04:20:29] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[04:20:29] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[04:20:29] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[04:20:29] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[04:20:29] [PASSED] drm_test_format_min_pitch_two_plane
[04:20:29] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[04:20:29] [PASSED] drm_test_format_min_pitch_tiled
[04:20:29] =================== [PASSED] drm_format ====================
[04:20:29] ============== drm_framebuffer (10 subtests) ===============
[04:20:29] ========== drm_test_framebuffer_check_src_coords  ==========
[04:20:29] [PASSED] Success: source fits into fb
[04:20:29] [PASSED] Fail: overflowing fb with x-axis coordinate
[04:20:29] [PASSED] Fail: overflowing fb with y-axis coordinate
[04:20:29] [PASSED] Fail: overflowing fb with source width
[04:20:29] [PASSED] Fail: overflowing fb with source height
[04:20:29] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[04:20:29] [PASSED] drm_test_framebuffer_cleanup
[04:20:29] =============== drm_test_framebuffer_create  ===============
[04:20:29] [PASSED] ABGR8888 normal sizes
[04:20:29] [PASSED] ABGR8888 max sizes
[04:20:29] [PASSED] ABGR8888 pitch greater than min required
[04:20:29] [PASSED] ABGR8888 pitch less than min required
[04:20:29] [PASSED] ABGR8888 Invalid width
[04:20:29] [PASSED] ABGR8888 Invalid buffer handle
[04:20:29] [PASSED] No pixel format
[04:20:29] [PASSED] ABGR8888 Width 0
[04:20:29] [PASSED] ABGR8888 Height 0
[04:20:29] [PASSED] ABGR8888 Out of bound height * pitch combination
[04:20:29] [PASSED] ABGR8888 Large buffer offset
[04:20:29] [PASSED] ABGR8888 Buffer offset for inexistent plane
[04:20:29] [PASSED] ABGR8888 Invalid flag
[04:20:29] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[04:20:29] [PASSED] ABGR8888 Valid buffer modifier
[04:20:29] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[04:20:29] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[04:20:29] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[04:20:29] [PASSED] NV12 Normal sizes
[04:20:29] [PASSED] NV12 Max sizes
[04:20:29] [PASSED] NV12 Invalid pitch
[04:20:29] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[04:20:29] [PASSED] NV12 different  modifier per-plane
[04:20:29] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[04:20:29] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[04:20:29] [PASSED] NV12 Modifier for inexistent plane
[04:20:29] [PASSED] NV12 Handle for inexistent plane
[04:20:29] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[04:20:29] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[04:20:29] [PASSED] YVU420 Normal sizes
[04:20:29] [PASSED] YVU420 Max sizes
[04:20:29] [PASSED] YVU420 Invalid pitch
[04:20:29] [PASSED] YVU420 Different pitches
[04:20:29] [PASSED] YVU420 Different buffer offsets/pitches
[04:20:29] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[04:20:29] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[04:20:29] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[04:20:29] [PASSED] YVU420 Valid modifier
[04:20:29] [PASSED] YVU420 Different modifiers per plane
[04:20:29] [PASSED] YVU420 Modifier for inexistent plane
[04:20:29] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[04:20:29] [PASSED] X0L2 Normal sizes
[04:20:29] [PASSED] X0L2 Max sizes
[04:20:29] [PASSED] X0L2 Invalid pitch
[04:20:29] [PASSED] X0L2 Pitch greater than minimum required
[04:20:29] [PASSED] X0L2 Handle for inexistent plane
[04:20:29] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[04:20:29] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[04:20:29] [PASSED] X0L2 Valid modifier
[04:20:29] [PASSED] X0L2 Modifier for inexistent plane
[04:20:29] =========== [PASSED] drm_test_framebuffer_create ===========
[04:20:29] [PASSED] drm_test_framebuffer_free
[04:20:29] [PASSED] drm_test_framebuffer_init
[04:20:29] [PASSED] drm_test_framebuffer_init_bad_format
[04:20:29] [PASSED] drm_test_framebuffer_init_dev_mismatch
[04:20:29] [PASSED] drm_test_framebuffer_lookup
[04:20:29] [PASSED] drm_test_framebuffer_lookup_inexistent
[04:20:29] [PASSED] drm_test_framebuffer_modifiers_not_supported
[04:20:29] ================= [PASSED] drm_framebuffer =================
[04:20:29] ================ drm_gem_shmem (8 subtests) ================
[04:20:29] [PASSED] drm_gem_shmem_test_obj_create
[04:20:29] [PASSED] drm_gem_shmem_test_obj_create_private
[04:20:29] [PASSED] drm_gem_shmem_test_pin_pages
[04:20:29] [PASSED] drm_gem_shmem_test_vmap
[04:20:29] [PASSED] drm_gem_shmem_test_get_pages_sgt
[04:20:29] [PASSED] drm_gem_shmem_test_get_sg_table
[04:20:29] [PASSED] drm_gem_shmem_test_madvise
[04:20:29] [PASSED] drm_gem_shmem_test_purge
[04:20:29] ================== [PASSED] drm_gem_shmem ==================
[04:20:29] === drm_atomic_helper_connector_hdmi_check (22 subtests) ===
[04:20:29] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[04:20:29] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[04:20:29] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[04:20:29] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[04:20:29] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[04:20:29] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[04:20:29] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[04:20:29] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[04:20:29] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[04:20:29] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[04:20:29] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[04:20:29] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[04:20:29] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[04:20:29] [PASSED] drm_test_check_output_bpc_dvi
[04:20:29] [PASSED] drm_test_check_output_bpc_format_vic_1
[04:20:29] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[04:20:29] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[04:20:29] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[04:20:29] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[04:20:29] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[04:20:29] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[04:20:29] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[04:20:29] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[04:20:29] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[04:20:29] [PASSED] drm_test_check_broadcast_rgb_value
[04:20:29] [PASSED] drm_test_check_bpc_8_value
[04:20:29] [PASSED] drm_test_check_bpc_10_value
[04:20:29] [PASSED] drm_test_check_bpc_12_value
[04:20:29] [PASSED] drm_test_check_format_value
[04:20:29] [PASSED] drm_test_check_tmds_char_value
[04:20:29] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[04:20:29] ================= drm_managed (2 subtests) =================
[04:20:29] [PASSED] drm_test_managed_release_action
[04:20:29] [PASSED] drm_test_managed_run_action
[04:20:29] =================== [PASSED] drm_managed ===================
[04:20:29] =================== drm_mm (6 subtests) ====================
[04:20:29] [PASSED] drm_test_mm_init
[04:20:29] [PASSED] drm_test_mm_debug
[04:20:29] [PASSED] drm_test_mm_align32
[04:20:29] [PASSED] drm_test_mm_align64
[04:20:29] [PASSED] drm_test_mm_lowest
[04:20:29] [PASSED] drm_test_mm_highest
[04:20:29] ===================== [PASSED] drm_mm ======================
[04:20:29] ============= drm_modes_analog_tv (5 subtests) =============
[04:20:29] [PASSED] drm_test_modes_analog_tv_mono_576i
[04:20:29] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[04:20:29] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[04:20:29] [PASSED] drm_test_modes_analog_tv_pal_576i
[04:20:29] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[04:20:29] =============== [PASSED] drm_modes_analog_tv ===============
stty: 'standard input': Inappropriate ioctl for device
[04:20:29] ============== drm_plane_helper (2 subtests) ===============
[04:20:29] =============== drm_test_check_plane_state  ================
[04:20:29] [PASSED] clipping_simple
[04:20:29] [PASSED] clipping_rotate_reflect
[04:20:29] [PASSED] positioning_simple
[04:20:29] [PASSED] upscaling
[04:20:29] [PASSED] downscaling
[04:20:29] [PASSED] rounding1
[04:20:29] [PASSED] rounding2
[04:20:29] [PASSED] rounding3
[04:20:29] [PASSED] rounding4
[04:20:29] =========== [PASSED] drm_test_check_plane_state ============
[04:20:29] =========== drm_test_check_invalid_plane_state  ============
[04:20:29] [PASSED] positioning_invalid
[04:20:29] [PASSED] upscaling_invalid
[04:20:29] [PASSED] downscaling_invalid
[04:20:29] ======= [PASSED] drm_test_check_invalid_plane_state ========
[04:20:29] ================ [PASSED] drm_plane_helper =================
[04:20:29] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[04:20:29] ====== drm_test_connector_helper_tv_get_modes_check  =======
[04:20:29] [PASSED] None
[04:20:29] [PASSED] PAL
[04:20:29] [PASSED] NTSC
[04:20:29] [PASSED] Both, NTSC Default
[04:20:29] [PASSED] Both, PAL Default
[04:20:29] [PASSED] Both, NTSC Default, with PAL on command-line
[04:20:29] [PASSED] Both, PAL Default, with NTSC on command-line
[04:20:29] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[04:20:29] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[04:20:29] ================== drm_rect (9 subtests) ===================
[04:20:29] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[04:20:29] [PASSED] drm_test_rect_clip_scaled_not_clipped
[04:20:29] [PASSED] drm_test_rect_clip_scaled_clipped
[04:20:29] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[04:20:29] ================= drm_test_rect_intersect  =================
[04:20:29] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[04:20:29] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[04:20:29] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[04:20:29] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[04:20:29] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[04:20:29] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[04:20:29] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[04:20:29] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[04:20:29] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[04:20:29] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[04:20:29] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[04:20:29] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[04:20:29] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[04:20:29] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[04:20:29] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[04:20:29] ============= [PASSED] drm_test_rect_intersect =============
[04:20:29] ================ drm_test_rect_calc_hscale  ================
[04:20:29] [PASSED] normal use
[04:20:29] [PASSED] out of max range
[04:20:29] [PASSED] out of min range
[04:20:29] [PASSED] zero dst
[04:20:29] [PASSED] negative src
[04:20:29] [PASSED] negative dst
[04:20:29] ============ [PASSED] drm_test_rect_calc_hscale ============
[04:20:29] ================ drm_test_rect_calc_vscale  ================
[04:20:29] [PASSED] normal use
[04:20:29] [PASSED] out of max range
[04:20:29] [PASSED] out of min range
[04:20:29] [PASSED] zero dst
[04:20:29] [PASSED] negative src
[04:20:29] [PASSED] negative dst
[04:20:29] ============ [PASSED] drm_test_rect_calc_vscale ============
[04:20:29] ================== drm_test_rect_rotate  ===================
[04:20:29] [PASSED] reflect-x
[04:20:29] [PASSED] reflect-y
[04:20:29] [PASSED] rotate-0
[04:20:29] [PASSED] rotate-90
[04:20:29] [PASSED] rotate-180
[04:20:29] [PASSED] rotate-270
[04:20:29] ============== [PASSED] drm_test_rect_rotate ===============
[04:20:29] ================ drm_test_rect_rotate_inv  =================
[04:20:29] [PASSED] reflect-x
[04:20:29] [PASSED] reflect-y
[04:20:29] [PASSED] rotate-0
[04:20:29] [PASSED] rotate-90
[04:20:29] [PASSED] rotate-180
[04:20:29] [PASSED] rotate-270
[04:20:29] ============ [PASSED] drm_test_rect_rotate_inv =============
[04:20:29] ==================== [PASSED] drm_rect =====================
[04:20:29] ============================================================
[04:20:29] Testing complete. Ran 526 tests: passed: 526
[04:20:29] Elapsed time: 24.502s total, 1.676s configuring, 22.647s building, 0.177s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[04:20:29] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:20:31] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
[04:20:39] Starting KUnit Kernel (1/1)...
[04:20:39] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[04:20:39] ================= ttm_device (5 subtests) ==================
[04:20:39] [PASSED] ttm_device_init_basic
[04:20:39] [PASSED] ttm_device_init_multiple
[04:20:39] [PASSED] ttm_device_fini_basic
[04:20:39] [PASSED] ttm_device_init_no_vma_man
[04:20:39] ================== ttm_device_init_pools  ==================
[04:20:39] [PASSED] No DMA allocations, no DMA32 required
[04:20:39] [PASSED] DMA allocations, DMA32 required
[04:20:39] [PASSED] No DMA allocations, DMA32 required
[04:20:39] [PASSED] DMA allocations, no DMA32 required
[04:20:39] ============== [PASSED] ttm_device_init_pools ==============
[04:20:39] =================== [PASSED] ttm_device ====================
[04:20:39] ================== ttm_pool (8 subtests) ===================
[04:20:39] ================== ttm_pool_alloc_basic  ===================
[04:20:39] [PASSED] One page
[04:20:39] [PASSED] More than one page
[04:20:39] [PASSED] Above the allocation limit
[04:20:39] [PASSED] One page, with coherent DMA mappings enabled
[04:20:39] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[04:20:39] ============== [PASSED] ttm_pool_alloc_basic ===============
[04:20:39] ============== ttm_pool_alloc_basic_dma_addr  ==============
[04:20:39] [PASSED] One page
[04:20:39] [PASSED] More than one page
[04:20:39] [PASSED] Above the allocation limit
[04:20:39] [PASSED] One page, with coherent DMA mappings enabled
[04:20:39] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[04:20:39] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[04:20:39] [PASSED] ttm_pool_alloc_order_caching_match
[04:20:39] [PASSED] ttm_pool_alloc_caching_mismatch
[04:20:39] [PASSED] ttm_pool_alloc_order_mismatch
[04:20:39] [PASSED] ttm_pool_free_dma_alloc
[04:20:39] [PASSED] ttm_pool_free_no_dma_alloc
[04:20:39] [PASSED] ttm_pool_fini_basic
[04:20:39] ==================== [PASSED] ttm_pool =====================
[04:20:39] ================ ttm_resource (8 subtests) =================
[04:20:39] ================= ttm_resource_init_basic  =================
[04:20:39] [PASSED] Init resource in TTM_PL_SYSTEM
[04:20:39] [PASSED] Init resource in TTM_PL_VRAM
[04:20:39] [PASSED] Init resource in a private placement
[04:20:39] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[04:20:39] ============= [PASSED] ttm_resource_init_basic =============
[04:20:39] [PASSED] ttm_resource_init_pinned
[04:20:39] [PASSED] ttm_resource_fini_basic
[04:20:39] [PASSED] ttm_resource_manager_init_basic
[04:20:39] [PASSED] ttm_resource_manager_usage_basic
[04:20:39] [PASSED] ttm_resource_manager_set_used_basic
[04:20:39] [PASSED] ttm_sys_man_alloc_basic
[04:20:39] [PASSED] ttm_sys_man_free_basic
[04:20:39] ================== [PASSED] ttm_resource ===================
[04:20:39] =================== ttm_tt (15 subtests) ===================
[04:20:39] ==================== ttm_tt_init_basic  ====================
[04:20:39] [PASSED] Page-aligned size
[04:20:39] [PASSED] Extra pages requested
[04:20:39] ================ [PASSED] ttm_tt_init_basic ================
[04:20:39] [PASSED] ttm_tt_init_misaligned
[04:20:39] [PASSED] ttm_tt_fini_basic
[04:20:39] [PASSED] ttm_tt_fini_sg
[04:20:39] [PASSED] ttm_tt_fini_shmem
[04:20:39] [PASSED] ttm_tt_create_basic
[04:20:39] [PASSED] ttm_tt_create_invalid_bo_type
[04:20:39] [PASSED] ttm_tt_create_ttm_exists
[04:20:39] [PASSED] ttm_tt_create_failed
[04:20:39] [PASSED] ttm_tt_destroy_basic
[04:20:39] [PASSED] ttm_tt_populate_null_ttm
[04:20:39] [PASSED] ttm_tt_populate_populated_ttm
[04:20:39] [PASSED] ttm_tt_unpopulate_basic
[04:20:39] [PASSED] ttm_tt_unpopulate_empty_ttm
[04:20:39] [PASSED] ttm_tt_swapin_basic
[04:20:39] ===================== [PASSED] ttm_tt ======================
[04:20:39] =================== ttm_bo (14 subtests) ===================
[04:20:39] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[04:20:39] [PASSED] Cannot be interrupted and sleeps
[04:20:39] [PASSED] Cannot be interrupted, locks straight away
[04:20:39] [PASSED] Can be interrupted, sleeps
[04:20:39] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[04:20:39] [PASSED] ttm_bo_reserve_locked_no_sleep
[04:20:39] [PASSED] ttm_bo_reserve_no_wait_ticket
[04:20:39] [PASSED] ttm_bo_reserve_double_resv
[04:20:39] [PASSED] ttm_bo_reserve_interrupted
[04:20:39] [PASSED] ttm_bo_reserve_deadlock
[04:20:39] [PASSED] ttm_bo_unreserve_basic
[04:20:39] [PASSED] ttm_bo_unreserve_pinned
[04:20:39] [PASSED] ttm_bo_unreserve_bulk
[04:20:39] [PASSED] ttm_bo_put_basic
[04:20:39] [PASSED] ttm_bo_put_shared_resv
[04:20:39] [PASSED] ttm_bo_pin_basic
[04:20:39] [PASSED] ttm_bo_pin_unpin_resource
[04:20:39] [PASSED] ttm_bo_multiple_pin_one_unpin
[04:20:39] ===================== [PASSED] ttm_bo ======================
[04:20:39] ============== ttm_bo_validate (22 subtests) ===============
[04:20:39] ============== ttm_bo_init_reserved_sys_man  ===============
[04:20:39] [PASSED] Buffer object for userspace
[04:20:39] [PASSED] Kernel buffer object
[04:20:39] [PASSED] Shared buffer object
[04:20:39] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[04:20:39] ============== ttm_bo_init_reserved_mock_man  ==============
[04:20:39] [PASSED] Buffer object for userspace
[04:20:39] [PASSED] Kernel buffer object
[04:20:39] [PASSED] Shared buffer object
[04:20:39] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[04:20:39] [PASSED] ttm_bo_init_reserved_resv
[04:20:39] ================== ttm_bo_validate_basic  ==================
[04:20:39] [PASSED] Buffer object for userspace
[04:20:39] [PASSED] Kernel buffer object
[04:20:39] [PASSED] Shared buffer object
[04:20:39] ============== [PASSED] ttm_bo_validate_basic ==============
[04:20:39] [PASSED] ttm_bo_validate_invalid_placement
[04:20:39] ============= ttm_bo_validate_same_placement  ==============
[04:20:39] [PASSED] System manager
[04:20:39] [PASSED] VRAM manager
[04:20:39] ========= [PASSED] ttm_bo_validate_same_placement ==========
[04:20:39] [PASSED] ttm_bo_validate_failed_alloc
[04:20:39] [PASSED] ttm_bo_validate_pinned
[04:20:39] [PASSED] ttm_bo_validate_busy_placement
[04:20:39] ================ ttm_bo_validate_multihop  =================
[04:20:39] [PASSED] Buffer object for userspace
[04:20:39] [PASSED] Kernel buffer object
[04:20:39] [PASSED] Shared buffer object
[04:20:39] ============ [PASSED] ttm_bo_validate_multihop =============
[04:20:39] ========== ttm_bo_validate_no_placement_signaled  ==========
[04:20:39] [PASSED] Buffer object in system domain, no page vector
[04:20:39] [PASSED] Buffer object in system domain with an existing page vector
[04:20:39] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[04:20:39] ======== ttm_bo_validate_no_placement_not_signaled  ========
[04:20:39] [PASSED] Buffer object for userspace
[04:20:39] [PASSED] Kernel buffer object
[04:20:39] [PASSED] Shared buffer object
[04:20:39] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[04:20:39] [PASSED] ttm_bo_validate_move_fence_signaled
[04:20:39] ========= ttm_bo_validate_move_fence_not_signaled  =========
[04:20:39] [PASSED] Waits for GPU
[04:20:39] [PASSED] Tries to lock straight away
[04:20:39] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[04:20:39] [PASSED] ttm_bo_validate_swapout
[04:20:39] [PASSED] ttm_bo_validate_happy_evict
[04:20:39] [PASSED] ttm_bo_validate_all_pinned_evict
[04:20:39] [PASSED] ttm_bo_validate_allowed_only_evict
[04:20:39] [PASSED] ttm_bo_validate_deleted_evict
[04:20:39] [PASSED] ttm_bo_validate_busy_domain_evict
[04:20:39] [PASSED] ttm_bo_validate_evict_gutting
[04:20:39] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[04:20:39] ================= [PASSED] ttm_bo_validate =================
[04:20:39] ============================================================
[04:20:39] Testing complete. Ran 102 tests: passed: 102
[04:20:39] Elapsed time: 9.988s total, 1.595s configuring, 7.726s building, 0.560s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


