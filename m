Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7245C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 20:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4A010E4DD;
	Mon, 10 Mar 2025 20:04:43 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B46310E4DD;
 Mon, 10 Mar 2025 20:04:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/i915/xe3lpd=3A_Update_band?=
 =?utf-8?q?width_parameters_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Mar 2025 20:04:42 -0000
Message-ID: <174163708263.15832.6537568364226012997@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250310-xe3lpd-bandwidth-update-v4-0-4191964b034d@intel.com>
In-Reply-To: <20250310-xe3lpd-bandwidth-update-v4-0-4191964b034d@intel.com>
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

Series: drm/i915/xe3lpd: Update bandwidth parameters (rev4)
URL   : https://patchwork.freedesktop.org/series/144440/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[20:03:35] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:03:39] Building KUnit Kernel ...
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

[20:04:06] Starting KUnit Kernel (1/1)...
[20:04:06] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[20:04:06] ================== guc_buf (11 subtests) ===================
[20:04:06] [PASSED] test_smallest
[20:04:06] [PASSED] test_largest
[20:04:06] [PASSED] test_granular
[20:04:06] [PASSED] test_unique
[20:04:06] [PASSED] test_overlap
[20:04:06] [PASSED] test_reusable
[20:04:06] [PASSED] test_too_big
[20:04:06] [PASSED] test_flush
[20:04:06] [PASSED] test_lookup
[20:04:06] [PASSED] test_data
[20:04:06] [PASSED] test_class
[20:04:06] ===================== [PASSED] guc_buf =====================
[20:04:06] =================== guc_dbm (7 subtests) ===================
[20:04:06] [PASSED] test_empty
[20:04:06] [PASSED] test_default
[20:04:06] ======================== test_size  ========================
[20:04:06] [PASSED] 4
[20:04:06] [PASSED] 8
[20:04:06] [PASSED] 32
[20:04:06] [PASSED] 256
[20:04:06] ==================== [PASSED] test_size ====================
[20:04:06] ======================= test_reuse  ========================
[20:04:06] [PASSED] 4
[20:04:06] [PASSED] 8
[20:04:06] [PASSED] 32
[20:04:06] [PASSED] 256
[20:04:06] =================== [PASSED] test_reuse ====================
[20:04:06] =================== test_range_overlap  ====================
[20:04:06] [PASSED] 4
[20:04:06] [PASSED] 8
[20:04:06] [PASSED] 32
[20:04:06] [PASSED] 256
[20:04:06] =============== [PASSED] test_range_overlap ================
[20:04:06] =================== test_range_compact  ====================
[20:04:06] [PASSED] 4
[20:04:06] [PASSED] 8
[20:04:06] [PASSED] 32
[20:04:06] [PASSED] 256
[20:04:06] =============== [PASSED] test_range_compact ================
[20:04:06] ==================== test_range_spare  =====================
[20:04:06] [PASSED] 4
[20:04:06] [PASSED] 8
[20:04:06] [PASSED] 32
[20:04:06] [PASSED] 256
[20:04:06] ================ [PASSED] test_range_spare =================
[20:04:06] ===================== [PASSED] guc_dbm =====================
[20:04:06] =================== guc_idm (6 subtests) ===================
[20:04:06] [PASSED] bad_init
[20:04:06] [PASSED] no_init
[20:04:06] [PASSED] init_fini
[20:04:06] [PASSED] check_used
[20:04:06] [PASSED] check_quota
[20:04:06] [PASSED] check_all
[20:04:06] ===================== [PASSED] guc_idm =====================
[20:04:06] ================== no_relay (3 subtests) ===================
[20:04:06] [PASSED] xe_drops_guc2pf_if_not_ready
[20:04:06] [PASSED] xe_drops_guc2vf_if_not_ready
[20:04:06] [PASSED] xe_rejects_send_if_not_ready
[20:04:06] ==================== [PASSED] no_relay =====================
[20:04:06] ================== pf_relay (14 subtests) ==================
[20:04:06] [PASSED] pf_rejects_guc2pf_too_short
[20:04:06] [PASSED] pf_rejects_guc2pf_too_long
[20:04:06] [PASSED] pf_rejects_guc2pf_no_payload
[20:04:06] [PASSED] pf_fails_no_payload
[20:04:06] [PASSED] pf_fails_bad_origin
[20:04:06] [PASSED] pf_fails_bad_type
[20:04:06] [PASSED] pf_txn_reports_error
[20:04:06] [PASSED] pf_txn_sends_pf2guc
[20:04:06] [PASSED] pf_sends_pf2guc
[20:04:06] [SKIPPED] pf_loopback_nop
[20:04:06] [SKIPPED] pf_loopback_echo
[20:04:06] [SKIPPED] pf_loopback_fail
[20:04:06] [SKIPPED] pf_loopback_busy
[20:04:06] [SKIPPED] pf_loopback_retry
[20:04:06] ==================== [PASSED] pf_relay =====================
[20:04:06] ================== vf_relay (3 subtests) ===================
[20:04:06] [PASSED] vf_rejects_guc2vf_too_short
[20:04:06] [PASSED] vf_rejects_guc2vf_too_long
[20:04:06] [PASSED] vf_rejects_guc2vf_no_payload
[20:04:06] ==================== [PASSED] vf_relay =====================
[20:04:06] ================= pf_service (11 subtests) =================
[20:04:06] [PASSED] pf_negotiate_any
[20:04:06] [PASSED] pf_negotiate_base_match
[20:04:06] [PASSED] pf_negotiate_base_newer
[20:04:06] [PASSED] pf_negotiate_base_next
[20:04:06] [SKIPPED] pf_negotiate_base_older
[20:04:06] [PASSED] pf_negotiate_base_prev
[20:04:06] [PASSED] pf_negotiate_latest_match
[20:04:06] [PASSED] pf_negotiate_latest_newer
[20:04:06] [PASSED] pf_negotiate_latest_next
[20:04:06] [SKIPPED] pf_negotiate_latest_older
[20:04:06] [SKIPPED] pf_negotiate_latest_prev
[20:04:06] =================== [PASSED] pf_service ====================
[20:04:06] ===================== lmtt (1 subtest) =====================
[20:04:06] ======================== test_ops  =========================
[20:04:06] [PASSED] 2-level
[20:04:06] [PASSED] multi-level
[20:04:06] ==================== [PASSED] test_ops =====================
[20:04:06] ====================== [PASSED] lmtt =======================
[20:04:06] =================== xe_mocs (2 subtests) ===================
[20:04:06] ================ xe_live_mocs_kernel_kunit  ================
[20:04:06] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[20:04:06] ================ xe_live_mocs_reset_kunit  =================
[20:04:06] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[20:04:06] ==================== [SKIPPED] xe_mocs =====================
[20:04:06] ================= xe_migrate (2 subtests) ==================
[20:04:06] ================= xe_migrate_sanity_kunit  =================
[20:04:06] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[20:04:06] ================== xe_validate_ccs_kunit  ==================
[20:04:06] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[20:04:06] =================== [SKIPPED] xe_migrate ===================
[20:04:06] ================== xe_dma_buf (1 subtest) ==================
[20:04:06] ==================== xe_dma_buf_kunit  =====================
[20:04:06] ================ [SKIPPED] xe_dma_buf_kunit ================
[20:04:06] =================== [SKIPPED] xe_dma_buf ===================
[20:04:06] ================= xe_bo_shrink (1 subtest) =================
[20:04:06] =================== xe_bo_shrink_kunit  ====================
[20:04:06] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[20:04:06] ================== [SKIPPED] xe_bo_shrink ==================
[20:04:06] ==================== xe_bo (2 subtests) ====================
[20:04:06] ================== xe_ccs_migrate_kunit  ===================
[20:04:06] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
stty: 'standard input': Inappropriate ioctl for device
[20:04:06] ==================== xe_bo_evict_kunit  ====================
[20:04:06] =============== [SKIPPED] xe_bo_evict_kunit ================
[20:04:06] ===================== [SKIPPED] xe_bo ======================
[20:04:06] ==================== args (11 subtests) ====================
[20:04:06] [PASSED] count_args_test
[20:04:06] [PASSED] call_args_example
[20:04:06] [PASSED] call_args_test
[20:04:06] [PASSED] drop_first_arg_example
[20:04:06] [PASSED] drop_first_arg_test
[20:04:06] [PASSED] first_arg_example
[20:04:06] [PASSED] first_arg_test
[20:04:06] [PASSED] last_arg_example
[20:04:06] [PASSED] last_arg_test
[20:04:06] [PASSED] pick_arg_example
[20:04:06] [PASSED] sep_comma_example
[20:04:06] ====================== [PASSED] args =======================
[20:04:06] =================== xe_pci (2 subtests) ====================
[20:04:06] [PASSED] xe_gmdid_graphics_ip
[20:04:06] [PASSED] xe_gmdid_media_ip
[20:04:06] ===================== [PASSED] xe_pci ======================
[20:04:06] =================== xe_rtp (2 subtests) ====================
[20:04:06] =============== xe_rtp_process_to_sr_tests  ================
[20:04:06] [PASSED] coalesce-same-reg
[20:04:06] [PASSED] no-match-no-add
[20:04:06] [PASSED] match-or
[20:04:06] [PASSED] match-or-xfail
[20:04:06] [PASSED] no-match-no-add-multiple-rules
[20:04:06] [PASSED] two-regs-two-entries
[20:04:06] [PASSED] clr-one-set-other
[20:04:06] [PASSED] set-field
[20:04:06] [PASSED] conflict-duplicate
[20:04:06] [PASSED] conflict-not-disjoint
[20:04:06] [PASSED] conflict-reg-type
[20:04:06] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[20:04:06] ================== xe_rtp_process_tests  ===================
[20:04:06] [PASSED] active1
[20:04:06] [PASSED] active2
[20:04:06] [PASSED] active-inactive
[20:04:06] [PASSED] inactive-active
[20:04:06] [PASSED] inactive-1st_or_active-inactive
[20:04:06] [PASSED] inactive-2nd_or_active-inactive
[20:04:06] [PASSED] inactive-last_or_active-inactive
[20:04:06] [PASSED] inactive-no_or_active-inactive
[20:04:06] ============== [PASSED] xe_rtp_process_tests ===============
[20:04:06] ===================== [PASSED] xe_rtp ======================
[20:04:06] ==================== xe_wa (1 subtest) =====================
[20:04:06] ======================== xe_wa_gt  =========================
[20:04:06] [PASSED] TIGERLAKE (B0)
[20:04:06] [PASSED] DG1 (A0)
[20:04:06] [PASSED] DG1 (B0)
[20:04:06] [PASSED] ALDERLAKE_S (A0)
[20:04:06] [PASSED] ALDERLAKE_S (B0)
[20:04:06] [PASSED] ALDERLAKE_S (C0)
[20:04:06] [PASSED] ALDERLAKE_S (D0)
[20:04:06] [PASSED] ALDERLAKE_P (A0)
[20:04:06] [PASSED] ALDERLAKE_P (B0)
[20:04:06] [PASSED] ALDERLAKE_P (C0)
[20:04:06] [PASSED] ALDERLAKE_S_RPLS (D0)
[20:04:06] [PASSED] ALDERLAKE_P_RPLU (E0)
[20:04:06] [PASSED] DG2_G10 (C0)
[20:04:06] [PASSED] DG2_G11 (B1)
[20:04:06] [PASSED] DG2_G12 (A1)
[20:04:06] [PASSED] METEORLAKE (g:A0, m:A0)
[20:04:06] [PASSED] METEORLAKE (g:A0, m:A0)
[20:04:06] [PASSED] METEORLAKE (g:A0, m:A0)
[20:04:06] [PASSED] LUNARLAKE (g:A0, m:A0)
[20:04:06] [PASSED] LUNARLAKE (g:B0, m:A0)
[20:04:06] [PASSED] BATTLEMAGE (g:A0, m:A1)
[20:04:06] ==================== [PASSED] xe_wa_gt =====================
[20:04:06] ====================== [PASSED] xe_wa ======================
[20:04:06] ============================================================
[20:04:06] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[20:04:06] Elapsed time: 30.782s total, 4.197s configuring, 26.319s building, 0.252s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[20:04:06] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:04:08] Building KUnit Kernel ...
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

[20:04:29] Starting KUnit Kernel (1/1)...
[20:04:29] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[20:04:29] =========== drm_validate_clone_mode (2 subtests) ===========
[20:04:29] ============== drm_test_check_in_clone_mode  ===============
[20:04:29] [PASSED] in_clone_mode
[20:04:29] [PASSED] not_in_clone_mode
[20:04:29] ========== [PASSED] drm_test_check_in_clone_mode ===========
[20:04:29] =============== drm_test_check_valid_clones  ===============
[20:04:29] [PASSED] not_in_clone_mode
[20:04:29] [PASSED] valid_clone
[20:04:29] [PASSED] invalid_clone
[20:04:29] =========== [PASSED] drm_test_check_valid_clones ===========
[20:04:29] ============= [PASSED] drm_validate_clone_mode =============
[20:04:29] ============= drm_validate_modeset (1 subtest) =============
[20:04:29] [PASSED] drm_test_check_connector_changed_modeset
[20:04:29] ============== [PASSED] drm_validate_modeset ===============
[20:04:29] ================== drm_buddy (7 subtests) ==================
[20:04:29] [PASSED] drm_test_buddy_alloc_limit
[20:04:29] [PASSED] drm_test_buddy_alloc_optimistic
[20:04:29] [PASSED] drm_test_buddy_alloc_pessimistic
[20:04:29] [PASSED] drm_test_buddy_alloc_pathological
[20:04:29] [PASSED] drm_test_buddy_alloc_contiguous
[20:04:29] [PASSED] drm_test_buddy_alloc_clear
[20:04:29] [PASSED] drm_test_buddy_alloc_range_bias
[20:04:29] ==================== [PASSED] drm_buddy ====================
[20:04:29] ============= drm_cmdline_parser (40 subtests) =============
[20:04:29] [PASSED] drm_test_cmdline_force_d_only
[20:04:29] [PASSED] drm_test_cmdline_force_D_only_dvi
[20:04:29] [PASSED] drm_test_cmdline_force_D_only_hdmi
[20:04:29] [PASSED] drm_test_cmdline_force_D_only_not_digital
[20:04:29] [PASSED] drm_test_cmdline_force_e_only
[20:04:29] [PASSED] drm_test_cmdline_res
[20:04:29] [PASSED] drm_test_cmdline_res_vesa
[20:04:29] [PASSED] drm_test_cmdline_res_vesa_rblank
[20:04:29] [PASSED] drm_test_cmdline_res_rblank
[20:04:29] [PASSED] drm_test_cmdline_res_bpp
[20:04:29] [PASSED] drm_test_cmdline_res_refresh
[20:04:29] [PASSED] drm_test_cmdline_res_bpp_refresh
[20:04:29] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[20:04:29] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[20:04:29] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[20:04:29] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[20:04:29] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[20:04:29] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[20:04:29] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[20:04:29] [PASSED] drm_test_cmdline_res_margins_force_on
[20:04:29] [PASSED] drm_test_cmdline_res_vesa_margins
[20:04:29] [PASSED] drm_test_cmdline_name
[20:04:29] [PASSED] drm_test_cmdline_name_bpp
[20:04:29] [PASSED] drm_test_cmdline_name_option
[20:04:29] [PASSED] drm_test_cmdline_name_bpp_option
[20:04:29] [PASSED] drm_test_cmdline_rotate_0
[20:04:29] [PASSED] drm_test_cmdline_rotate_90
[20:04:29] [PASSED] drm_test_cmdline_rotate_180
[20:04:29] [PASSED] drm_test_cmdline_rotate_270
[20:04:29] [PASSED] drm_test_cmdline_hmirror
[20:04:29] [PASSED] drm_test_cmdline_vmirror
[20:04:29] [PASSED] drm_test_cmdline_margin_options
[20:04:29] [PASSED] drm_test_cmdline_multiple_options
[20:04:29] [PASSED] drm_test_cmdline_bpp_extra_and_option
[20:04:29] [PASSED] drm_test_cmdline_extra_and_option
[20:04:29] [PASSED] drm_test_cmdline_freestanding_options
[20:04:29] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[20:04:29] [PASSED] drm_test_cmdline_panel_orientation
[20:04:29] ================ drm_test_cmdline_invalid  =================
[20:04:29] [PASSED] margin_only
[20:04:29] [PASSED] interlace_only
[20:04:29] [PASSED] res_missing_x
[20:04:29] [PASSED] res_missing_y
[20:04:29] [PASSED] res_bad_y
[20:04:29] [PASSED] res_missing_y_bpp
[20:04:29] [PASSED] res_bad_bpp
[20:04:29] [PASSED] res_bad_refresh
[20:04:29] [PASSED] res_bpp_refresh_force_on_off
[20:04:29] [PASSED] res_invalid_mode
[20:04:29] [PASSED] res_bpp_wrong_place_mode
[20:04:29] [PASSED] name_bpp_refresh
[20:04:29] [PASSED] name_refresh
[20:04:29] [PASSED] name_refresh_wrong_mode
[20:04:29] [PASSED] name_refresh_invalid_mode
[20:04:29] [PASSED] rotate_multiple
[20:04:29] [PASSED] rotate_invalid_val
[20:04:29] [PASSED] rotate_truncated
[20:04:29] [PASSED] invalid_option
[20:04:29] [PASSED] invalid_tv_option
[20:04:29] [PASSED] truncated_tv_option
[20:04:29] ============ [PASSED] drm_test_cmdline_invalid =============
[20:04:29] =============== drm_test_cmdline_tv_options  ===============
[20:04:29] [PASSED] NTSC
[20:04:29] [PASSED] NTSC_443
[20:04:29] [PASSED] NTSC_J
[20:04:29] [PASSED] PAL
[20:04:29] [PASSED] PAL_M
[20:04:29] [PASSED] PAL_N
[20:04:29] [PASSED] SECAM
[20:04:29] [PASSED] MONO_525
[20:04:29] [PASSED] MONO_625
[20:04:29] =========== [PASSED] drm_test_cmdline_tv_options ===========
[20:04:29] =============== [PASSED] drm_cmdline_parser ================
[20:04:29] ========== drmm_connector_hdmi_init (20 subtests) ==========
[20:04:29] [PASSED] drm_test_connector_hdmi_init_valid
[20:04:29] [PASSED] drm_test_connector_hdmi_init_bpc_8
[20:04:29] [PASSED] drm_test_connector_hdmi_init_bpc_10
[20:04:29] [PASSED] drm_test_connector_hdmi_init_bpc_12
[20:04:29] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[20:04:29] [PASSED] drm_test_connector_hdmi_init_bpc_null
[20:04:29] [PASSED] drm_test_connector_hdmi_init_formats_empty
[20:04:29] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[20:04:29] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[20:04:29] [PASSED] supported_formats=0x9 yuv420_allowed=1
[20:04:29] [PASSED] supported_formats=0x9 yuv420_allowed=0
[20:04:29] [PASSED] supported_formats=0x3 yuv420_allowed=1
[20:04:29] [PASSED] supported_formats=0x3 yuv420_allowed=0
[20:04:29] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[20:04:29] [PASSED] drm_test_connector_hdmi_init_null_ddc
[20:04:29] [PASSED] drm_test_connector_hdmi_init_null_product
[20:04:29] [PASSED] drm_test_connector_hdmi_init_null_vendor
[20:04:29] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[20:04:29] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[20:04:29] [PASSED] drm_test_connector_hdmi_init_product_valid
[20:04:29] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[20:04:29] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[20:04:29] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[20:04:29] ========= drm_test_connector_hdmi_init_type_valid  =========
[20:04:29] [PASSED] HDMI-A
[20:04:29] [PASSED] HDMI-B
[20:04:29] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[20:04:29] ======== drm_test_connector_hdmi_init_type_invalid  ========
[20:04:29] [PASSED] Unknown
[20:04:29] [PASSED] VGA
[20:04:29] [PASSED] DVI-I
[20:04:29] [PASSED] DVI-D
[20:04:29] [PASSED] DVI-A
[20:04:29] [PASSED] Composite
[20:04:29] [PASSED] SVIDEO
[20:04:29] [PASSED] LVDS
[20:04:29] [PASSED] Component
[20:04:29] [PASSED] DIN
[20:04:29] [PASSED] DP
[20:04:29] [PASSED] TV
[20:04:29] [PASSED] eDP
[20:04:29] [PASSED] Virtual
[20:04:29] [PASSED] DSI
[20:04:29] [PASSED] DPI
[20:04:29] [PASSED] Writeback
[20:04:29] [PASSED] SPI
[20:04:29] [PASSED] USB
[20:04:29] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[20:04:29] ============ [PASSED] drmm_connector_hdmi_init =============
[20:04:29] ============= drmm_connector_init (3 subtests) =============
[20:04:29] [PASSED] drm_test_drmm_connector_init
[20:04:29] [PASSED] drm_test_drmm_connector_init_null_ddc
[20:04:29] ========= drm_test_drmm_connector_init_type_valid  =========
[20:04:29] [PASSED] Unknown
[20:04:29] [PASSED] VGA
[20:04:29] [PASSED] DVI-I
[20:04:29] [PASSED] DVI-D
[20:04:29] [PASSED] DVI-A
[20:04:29] [PASSED] Composite
[20:04:29] [PASSED] SVIDEO
[20:04:29] [PASSED] LVDS
[20:04:29] [PASSED] Component
[20:04:29] [PASSED] DIN
[20:04:29] [PASSED] DP
[20:04:29] [PASSED] HDMI-A
[20:04:29] [PASSED] HDMI-B
[20:04:29] [PASSED] TV
[20:04:29] [PASSED] eDP
[20:04:29] [PASSED] Virtual
[20:04:29] [PASSED] DSI
[20:04:29] [PASSED] DPI
[20:04:29] [PASSED] Writeback
[20:04:29] [PASSED] SPI
[20:04:29] [PASSED] USB
[20:04:29] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[20:04:29] =============== [PASSED] drmm_connector_init ===============
[20:04:29] ========= drm_connector_dynamic_init (6 subtests) ==========
[20:04:29] [PASSED] drm_test_drm_connector_dynamic_init
[20:04:29] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[20:04:29] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[20:04:29] [PASSED] drm_test_drm_connector_dynamic_init_properties
[20:04:29] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[20:04:29] [PASSED] Unknown
[20:04:29] [PASSED] VGA
[20:04:29] [PASSED] DVI-I
[20:04:29] [PASSED] DVI-D
[20:04:29] [PASSED] DVI-A
[20:04:29] [PASSED] Composite
[20:04:29] [PASSED] SVIDEO
[20:04:29] [PASSED] LVDS
[20:04:29] [PASSED] Component
[20:04:29] [PASSED] DIN
[20:04:29] [PASSED] DP
[20:04:29] [PASSED] HDMI-A
[20:04:29] [PASSED] HDMI-B
[20:04:29] [PASSED] TV
[20:04:29] [PASSED] eDP
[20:04:29] [PASSED] Virtual
[20:04:29] [PASSED] DSI
[20:04:29] [PASSED] DPI
[20:04:29] [PASSED] Writeback
[20:04:29] [PASSED] SPI
[20:04:29] [PASSED] USB
[20:04:29] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[20:04:29] ======== drm_test_drm_connector_dynamic_init_name  =========
[20:04:29] [PASSED] Unknown
[20:04:29] [PASSED] VGA
[20:04:29] [PASSED] DVI-I
[20:04:29] [PASSED] DVI-D
[20:04:29] [PASSED] DVI-A
[20:04:29] [PASSED] Composite
[20:04:29] [PASSED] SVIDEO
[20:04:29] [PASSED] LVDS
[20:04:29] [PASSED] Component
[20:04:29] [PASSED] DIN
[20:04:29] [PASSED] DP
[20:04:29] [PASSED] HDMI-A
[20:04:29] [PASSED] HDMI-B
[20:04:29] [PASSED] TV
[20:04:29] [PASSED] eDP
[20:04:29] [PASSED] Virtual
[20:04:29] [PASSED] DSI
[20:04:29] [PASSED] DPI
[20:04:29] [PASSED] Writeback
[20:04:29] [PASSED] SPI
[20:04:29] [PASSED] USB
[20:04:29] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[20:04:29] =========== [PASSED] drm_connector_dynamic_init ============
[20:04:29] ==== drm_connector_dynamic_register_early (4 subtests) =====
[20:04:29] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[20:04:29] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[20:04:29] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[20:04:29] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[20:04:29] ====== [PASSED] drm_connector_dynamic_register_early =======
[20:04:29] ======= drm_connector_dynamic_register (7 subtests) ========
[20:04:29] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[20:04:29] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[20:04:29] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[20:04:29] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[20:04:29] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[20:04:29] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[20:04:29] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[20:04:29] ========= [PASSED] drm_connector_dynamic_register ==========
[20:04:29] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[20:04:29] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[20:04:29] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[20:04:29] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[20:04:29] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[20:04:29] ========== drm_test_get_tv_mode_from_name_valid  ===========
[20:04:29] [PASSED] NTSC
[20:04:29] [PASSED] NTSC-443
[20:04:29] [PASSED] NTSC-J
[20:04:29] [PASSED] PAL
[20:04:29] [PASSED] PAL-M
[20:04:29] [PASSED] PAL-N
[20:04:29] [PASSED] SECAM
[20:04:29] [PASSED] Mono
[20:04:29] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[20:04:29] [PASSED] drm_test_get_tv_mode_from_name_truncated
[20:04:29] ============ [PASSED] drm_get_tv_mode_from_name ============
[20:04:29] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[20:04:29] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[20:04:29] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[20:04:29] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[20:04:29] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[20:04:29] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[20:04:29] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[20:04:29] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[20:04:29] [PASSED] VIC 96
[20:04:29] [PASSED] VIC 97
[20:04:29] [PASSED] VIC 101
[20:04:29] [PASSED] VIC 102
[20:04:29] [PASSED] VIC 106
[20:04:29] [PASSED] VIC 107
[20:04:29] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[20:04:29] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[20:04:29] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[20:04:29] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[20:04:29] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[20:04:29] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[20:04:29] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[20:04:29] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[20:04:29] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[20:04:29] [PASSED] Automatic
[20:04:29] [PASSED] Full
[20:04:29] [PASSED] Limited 16:235
[20:04:29] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[20:04:29] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[20:04:29] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[20:04:29] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[20:04:29] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[20:04:29] [PASSED] RGB
[20:04:29] [PASSED] YUV 4:2:0
[20:04:29] [PASSED] YUV 4:2:2
[20:04:29] [PASSED] YUV 4:4:4
[20:04:29] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[20:04:29] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[20:04:29] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[20:04:29] ============= drm_damage_helper (21 subtests) ==============
[20:04:29] [PASSED] drm_test_damage_iter_no_damage
[20:04:29] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[20:04:29] [PASSED] drm_test_damage_iter_no_damage_src_moved
[20:04:29] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[20:04:29] [PASSED] drm_test_damage_iter_no_damage_not_visible
[20:04:29] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[20:04:29] [PASSED] drm_test_damage_iter_no_damage_no_fb
[20:04:29] [PASSED] drm_test_damage_iter_simple_damage
[20:04:29] [PASSED] drm_test_damage_iter_single_damage
[20:04:29] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[20:04:29] [PASSED] drm_test_damage_iter_single_damage_outside_src
[20:04:29] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[20:04:29] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[20:04:29] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[20:04:29] [PASSED] drm_test_damage_iter_single_damage_src_moved
[20:04:29] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[20:04:29] [PASSED] drm_test_damage_iter_damage
[20:04:29] [PASSED] drm_test_damage_iter_damage_one_intersect
[20:04:29] [PASSED] drm_test_damage_iter_damage_one_outside
[20:04:29] [PASSED] drm_test_damage_iter_damage_src_moved
[20:04:29] [PASSED] drm_test_damage_iter_damage_not_visible
[20:04:29] ================ [PASSED] drm_damage_helper ================
[20:04:29] ============== drm_dp_mst_helper (3 subtests) ==============
[20:04:29] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[20:04:29] [PASSED] Clock 154000 BPP 30 DSC disabled
[20:04:29] [PASSED] Clock 234000 BPP 30 DSC disabled
[20:04:29] [PASSED] Clock 297000 BPP 24 DSC disabled
[20:04:29] [PASSED] Clock 332880 BPP 24 DSC enabled
[20:04:29] [PASSED] Clock 324540 BPP 24 DSC enabled
[20:04:29] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[20:04:29] ============== drm_test_dp_mst_calc_pbn_div  ===============
[20:04:29] [PASSED] Link rate 2000000 lane count 4
[20:04:29] [PASSED] Link rate 2000000 lane count 2
[20:04:29] [PASSED] Link rate 2000000 lane count 1
[20:04:29] [PASSED] Link rate 1350000 lane count 4
[20:04:29] [PASSED] Link rate 1350000 lane count 2
[20:04:29] [PASSED] Link rate 1350000 lane count 1
[20:04:29] [PASSED] Link rate 1000000 lane count 4
[20:04:29] [PASSED] Link rate 1000000 lane count 2
[20:04:29] [PASSED] Link rate 1000000 lane count 1
[20:04:29] [PASSED] Link rate 810000 lane count 4
[20:04:29] [PASSED] Link rate 810000 lane count 2
[20:04:29] [PASSED] Link rate 810000 lane count 1
[20:04:29] [PASSED] Link rate 540000 lane count 4
[20:04:29] [PASSED] Link rate 540000 lane count 2
[20:04:29] [PASSED] Link rate 540000 lane count 1
[20:04:29] [PASSED] Link rate 270000 lane count 4
[20:04:29] [PASSED] Link rate 270000 lane count 2
[20:04:29] [PASSED] Link rate 270000 lane count 1
[20:04:29] [PASSED] Link rate 162000 lane count 4
[20:04:29] [PASSED] Link rate 162000 lane count 2
[20:04:29] [PASSED] Link rate 162000 lane count 1
[20:04:29] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[20:04:29] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[20:04:29] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[20:04:29] [PASSED] DP_POWER_UP_PHY with port number
[20:04:29] [PASSED] DP_POWER_DOWN_PHY with port number
[20:04:29] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[20:04:29] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[20:04:29] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[20:04:29] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[20:04:29] [PASSED] DP_QUERY_PAYLOAD with port number
[20:04:29] [PASSED] DP_QUERY_PAYLOAD with VCPI
[20:04:29] [PASSED] DP_REMOTE_DPCD_READ with port number
[20:04:29] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[20:04:29] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[20:04:29] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[20:04:29] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[20:04:29] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[20:04:29] [PASSED] DP_REMOTE_I2C_READ with port number
[20:04:29] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[20:04:29] [PASSED] DP_REMOTE_I2C_READ with transactions array
[20:04:29] [PASSED] DP_REMOTE_I2C_WRITE with port number
[20:04:29] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[20:04:29] [PASSED] DP_REMOTE_I2C_WRITE with data array
[20:04:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[20:04:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[20:04:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[20:04:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[20:04:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[20:04:29] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[20:04:29] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[20:04:29] ================ [PASSED] drm_dp_mst_helper ================
[20:04:29] ================== drm_exec (7 subtests) ===================
[20:04:29] [PASSED] sanitycheck
[20:04:29] [PASSED] test_lock
[20:04:29] [PASSED] test_lock_unlock
[20:04:29] [PASSED] test_duplicates
[20:04:29] [PASSED] test_prepare
[20:04:29] [PASSED] test_prepare_array
[20:04:29] [PASSED] test_multiple_loops
[20:04:29] ==================== [PASSED] drm_exec =====================
[20:04:29] =========== drm_format_helper_test (18 subtests) ===========
[20:04:29] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[20:04:29] [PASSED] single_pixel_source_buffer
[20:04:29] [PASSED] single_pixel_clip_rectangle
[20:04:29] [PASSED] well_known_colors
[20:04:29] [PASSED] destination_pitch
[20:04:29] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[20:04:29] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[20:04:29] [PASSED] single_pixel_source_buffer
[20:04:29] [PASSED] single_pixel_clip_rectangle
[20:04:29] [PASSED] well_known_colors
[20:04:29] [PASSED] destination_pitch
[20:04:29] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[20:04:29] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[20:04:29] [PASSED] single_pixel_source_buffer
[20:04:29] [PASSED] single_pixel_clip_rectangle
[20:04:29] [PASSED] well_known_colors
[20:04:29] [PASSED] destination_pitch
[20:04:29] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[20:04:29] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[20:04:29] [PASSED] single_pixel_source_buffer
[20:04:29] [PASSED] single_pixel_clip_rectangle
[20:04:29] [PASSED] well_known_colors
[20:04:29] [PASSED] destination_pitch
[20:04:29] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[20:04:29] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[20:04:29] [PASSED] single_pixel_source_buffer
[20:04:29] [PASSED] single_pixel_clip_rectangle
[20:04:29] [PASSED] well_known_colors
[20:04:29] [PASSED] destination_pitch
[20:04:29] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[20:04:29] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[20:04:29] [PASSED] single_pixel_source_buffer
[20:04:29] [PASSED] single_pixel_clip_rectangle
[20:04:29] [PASSED] well_known_colors
[20:04:29] [PASSED] destination_pitch
[20:04:29] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[20:04:29] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[20:04:29] [PASSED] single_pixel_source_buffer
[20:04:29] [PASSED] single_pixel_clip_rectangle
[20:04:29] [PASSED] well_known_colors
[20:04:29] [PASSED] destination_pitch
[20:04:29] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[20:04:29] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[20:04:29] [PASSED] single_pixel_source_buffer
[20:04:29] [PASSED] single_pixel_clip_rectangle
[20:04:29] [PASSED] well_known_colors
[20:04:29] [PASSED] destination_pitch
[20:04:29] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[20:04:29] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[20:04:29] [PASSED] single_pixel_source_buffer
[20:04:29] [PASSED] single_pixel_clip_rectangle
[20:04:29] [PASSED] well_known_colors
[20:04:29] [PASSED] destination_pitch
[20:04:29] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[20:04:29] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[20:04:29] [PASSED] single_pixel_source_buffer
[20:04:29] [PASSED] single_pixel_clip_rectangle
[20:04:29] [PASSED] well_known_colors
[20:04:29] [PASSED] destination_pitch
[20:04:29] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[20:04:29] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[20:04:29] [PASSED] single_pixel_source_buffer
[20:04:29] [PASSED] single_pixel_clip_rectangle
[20:04:29] [PASSED] well_known_colors
[20:04:29] [PASSED] destination_pitch
[20:04:29] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[20:04:29] ============== drm_test_fb_xrgb8888_to_mono  ===============
[20:04:29] [PASSED] single_pixel_source_buffer
[20:04:29] [PASSED] single_pixel_clip_rectangle
[20:04:29] [PASSED] well_known_colors
[20:04:29] [PASSED] destination_pitch
[20:04:29] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[20:04:29] ==================== drm_test_fb_swab  =====================
[20:04:29] [PASSED] single_pixel_source_buffer
[20:04:29] [PASSED] single_pixel_clip_rectangle
[20:04:29] [PASSED] well_known_colors
[20:04:29] [PASSED] destination_pitch
[20:04:29] ================ [PASSED] drm_test_fb_swab =================
[20:04:29] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[20:04:29] [PASSED] single_pixel_source_buffer
[20:04:29] [PASSED] single_pixel_clip_rectangle
[20:04:29] [PASSED] well_known_colors
[20:04:29] [PASSED] destination_pitch
[20:04:29] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[20:04:29] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[20:04:29] [PASSED] single_pixel_source_buffer
[20:04:29] [PASSED] single_pixel_clip_rectangle
[20:04:29] [PASSED] well_known_colors
[20:04:29] [PASSED] destination_pitch
[20:04:29] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[20:04:29] ================= drm_test_fb_clip_offset  =================
[20:04:29] [PASSED] pass through
[20:04:29] [PASSED] horizontal offset
[20:04:29] [PASSED] vertical offset
[20:04:29] [PASSED] horizontal and vertical offset
[20:04:29] [PASSED] horizontal offset (custom pitch)
[20:04:29] [PASSED] vertical offset (custom pitch)
[20:04:29] [PASSED] horizontal and vertical offset (custom pitch)
[20:04:29] ============= [PASSED] drm_test_fb_clip_offset =============
[20:04:29] ============== drm_test_fb_build_fourcc_list  ==============
[20:04:29] [PASSED] no native formats
[20:04:29] [PASSED] XRGB8888 as native format
[20:04:29] [PASSED] remove duplicates
[20:04:29] [PASSED] convert alpha formats
[20:04:29] [PASSED] random formats
[20:04:29] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[20:04:29] =================== drm_test_fb_memcpy  ====================
[20:04:29] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[20:04:29] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[20:04:29] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[20:04:29] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[20:04:29] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[20:04:29] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[20:04:29] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[20:04:29] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[20:04:29] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[20:04:29] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[20:04:29] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[20:04:29] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[20:04:29] =============== [PASSED] drm_test_fb_memcpy ================
[20:04:29] ============= [PASSED] drm_format_helper_test ==============
[20:04:29] ================= drm_format (18 subtests) =================
[20:04:29] [PASSED] drm_test_format_block_width_invalid
[20:04:29] [PASSED] drm_test_format_block_width_one_plane
[20:04:29] [PASSED] drm_test_format_block_width_two_plane
[20:04:29] [PASSED] drm_test_format_block_width_three_plane
[20:04:29] [PASSED] drm_test_format_block_width_tiled
[20:04:29] [PASSED] drm_test_format_block_height_invalid
[20:04:29] [PASSED] drm_test_format_block_height_one_plane
[20:04:29] [PASSED] drm_test_format_block_height_two_plane
[20:04:29] [PASSED] drm_test_format_block_height_three_plane
[20:04:29] [PASSED] drm_test_format_block_height_tiled
[20:04:29] [PASSED] drm_test_format_min_pitch_invalid
[20:04:29] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[20:04:29] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[20:04:29] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[20:04:29] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[20:04:29] [PASSED] drm_test_format_min_pitch_two_plane
[20:04:29] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[20:04:29] [PASSED] drm_test_format_min_pitch_tiled
[20:04:29] =================== [PASSED] drm_format ====================
[20:04:29] ============== drm_framebuffer (10 subtests) ===============
[20:04:29] ========== drm_test_framebuffer_check_src_coords  ==========
[20:04:29] [PASSED] Success: source fits into fb
[20:04:29] [PASSED] Fail: overflowing fb with x-axis coordinate
[20:04:29] [PASSED] Fail: overflowing fb with y-axis coordinate
[20:04:29] [PASSED] Fail: overflowing fb with source width
[20:04:29] [PASSED] Fail: overflowing fb with source height
[20:04:29] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[20:04:29] [PASSED] drm_test_framebuffer_cleanup
[20:04:29] =============== drm_test_framebuffer_create  ===============
[20:04:29] [PASSED] ABGR8888 normal sizes
[20:04:29] [PASSED] ABGR8888 max sizes
[20:04:29] [PASSED] ABGR8888 pitch greater than min required
[20:04:29] [PASSED] ABGR8888 pitch less than min required
[20:04:29] [PASSED] ABGR8888 Invalid width
[20:04:29] [PASSED] ABGR8888 Invalid buffer handle
[20:04:29] [PASSED] No pixel format
[20:04:29] [PASSED] ABGR8888 Width 0
[20:04:29] [PASSED] ABGR8888 Height 0
[20:04:29] [PASSED] ABGR8888 Out of bound height * pitch combination
[20:04:29] [PASSED] ABGR8888 Large buffer offset
[20:04:29] [PASSED] ABGR8888 Buffer offset for inexistent plane
[20:04:29] [PASSED] ABGR8888 Invalid flag
[20:04:29] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[20:04:29] [PASSED] ABGR8888 Valid buffer modifier
[20:04:29] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[20:04:29] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[20:04:29] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[20:04:29] [PASSED] NV12 Normal sizes
[20:04:29] [PASSED] NV12 Max sizes
[20:04:29] [PASSED] NV12 Invalid pitch
[20:04:29] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[20:04:29] [PASSED] NV12 different  modifier per-plane
[20:04:29] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[20:04:29] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[20:04:29] [PASSED] NV12 Modifier for inexistent plane
[20:04:29] [PASSED] NV12 Handle for inexistent plane
[20:04:29] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[20:04:29] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[20:04:29] [PASSED] YVU420 Normal sizes
[20:04:29] [PASSED] YVU420 Max sizes
[20:04:29] [PASSED] YVU420 Invalid pitch
[20:04:29] [PASSED] YVU420 Different pitches
[20:04:29] [PASSED] YVU420 Different buffer offsets/pitches
[20:04:29] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[20:04:29] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[20:04:29] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[20:04:29] [PASSED] YVU420 Valid modifier
[20:04:29] [PASSED] YVU420 Different modifiers per plane
[20:04:29] [PASSED] YVU420 Modifier for inexistent plane
[20:04:29] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[20:04:29] [PASSED] X0L2 Normal sizes
[20:04:29] [PASSED] X0L2 Max sizes
[20:04:29] [PASSED] X0L2 Invalid pitch
[20:04:29] [PASSED] X0L2 Pitch greater than minimum required
[20:04:29] [PASSED] X0L2 Handle for inexistent plane
[20:04:29] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[20:04:29] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[20:04:29] [PASSED] X0L2 Valid modifier
[20:04:29] [PASSED] X0L2 Modifier for inexistent plane
[20:04:29] =========== [PASSED] drm_test_framebuffer_create ===========
[20:04:29] [PASSED] drm_test_framebuffer_free
[20:04:29] [PASSED] drm_test_framebuffer_init
[20:04:29] [PASSED] drm_test_framebuffer_init_bad_format
[20:04:29] [PASSED] drm_test_framebuffer_init_dev_mismatch
[20:04:29] [PASSED] drm_test_framebuffer_lookup
[20:04:29] [PASSED] drm_test_framebuffer_lookup_inexistent
[20:04:29] [PASSED] drm_test_framebuffer_modifiers_not_supported
[20:04:29] ================= [PASSED] drm_framebuffer =================
[20:04:29] ================ drm_gem_shmem (8 subtests) ================
[20:04:29] [PASSED] drm_gem_shmem_test_obj_create
[20:04:29] [PASSED] drm_gem_shmem_test_obj_create_private
[20:04:29] [PASSED] drm_gem_shmem_test_pin_pages
[20:04:29] [PASSED] drm_gem_shmem_test_vmap
[20:04:29] [PASSED] drm_gem_shmem_test_get_pages_sgt
[20:04:29] [PASSED] drm_gem_shmem_test_get_sg_table
[20:04:29] [PASSED] drm_gem_shmem_test_madvise
[20:04:29] [PASSED] drm_gem_shmem_test_purge
[20:04:29] ================== [PASSED] drm_gem_shmem ==================
[20:04:29] === drm_atomic_helper_connector_hdmi_check (23 subtests) ===
[20:04:29] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[20:04:29] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[20:04:29] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[20:04:29] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[20:04:29] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[20:04:29] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[20:04:29] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[20:04:29] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[20:04:29] [PASSED] drm_test_check_disable_connector
[20:04:29] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[20:04:29] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[20:04:29] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[20:04:29] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[20:04:29] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[20:04:29] [PASSED] drm_test_check_output_bpc_dvi
[20:04:29] [PASSED] drm_test_check_output_bpc_format_vic_1
[20:04:29] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[20:04:29] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[20:04:29] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[20:04:29] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[20:04:29] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[20:04:29] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[20:04:29] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[20:04:29] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[20:04:29] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[20:04:29] [PASSED] drm_test_check_broadcast_rgb_value
[20:04:29] [PASSED] drm_test_check_bpc_8_value
[20:04:29] [PASSED] drm_test_check_bpc_10_value
[20:04:29] [PASSED] drm_test_check_bpc_12_value
[20:04:29] [PASSED] drm_test_check_format_value
[20:04:29] [PASSED] drm_test_check_tmds_char_value
[20:04:29] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[20:04:29] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[20:04:29] [PASSED] drm_test_check_mode_valid
[20:04:29] [PASSED] drm_test_check_mode_valid_reject
[20:04:29] [PASSED] drm_test_check_mode_valid_reject_rate
[20:04:29] [PASSED] drm_test_check_mode_valid_reject_max_clock
[20:04:29] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[20:04:29] ================= drm_managed (2 subtests) =================
[20:04:29] [PASSED] drm_test_managed_release_action
[20:04:29] [PASSED] drm_test_managed_run_action
[20:04:29] =================== [PASSED] drm_managed ===================
[20:04:29] =================== drm_mm (6 subtests) ====================
[20:04:29] [PASSED] drm_test_mm_init
[20:04:29] [PASSED] drm_test_mm_debug
[20:04:29] [PASSED] drm_test_mm_align32
[20:04:29] [PASSED] drm_test_mm_align64
[20:04:29] [PASSED] drm_test_mm_lowest
[20:04:29] [PASSED] drm_test_mm_highest
[20:04:29] ===================== [PASSED] drm_mm ======================
[20:04:29] ============= drm_modes_analog_tv (5 subtests) =============
[20:04:29] [PASSED] drm_test_modes_analog_tv_mono_576i
[20:04:29] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[20:04:29] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[20:04:29] [PASSED] drm_test_modes_analog_tv_pal_576i
[20:04:29] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[20:04:29] =============== [PASSED] drm_modes_analog_tv ===============
[20:04:29] ============== drm_plane_helper (2 subtests) ===============
[20:04:29] =============== drm_test_check_plane_state  ================
[20:04:29] [PASSED] clipping_simple
[20:04:29] [PASSED] clipping_rotate_reflect
[20:04:29] [PASSED] positioning_simple
[20:04:29] [PASSED] upscaling
[20:04:29] [PASSED] downscaling
[20:04:29] [PASSED] rounding1
[20:04:29] [PASSED] rounding2
[20:04:29] [PASSED] rounding3
[20:04:29] [PASSED] rounding4
[20:04:29] =========== [PASSED] drm_test_check_plane_state ============
[20:04:29] =========== drm_test_check_invalid_plane_state  ============
[20:04:29] [PASSED] positioning_invalid
[20:04:29] [PASSED] upscaling_invalid
[20:04:29] [PASSED] downscaling_invalid
[20:04:29] ======= [PASSED] drm_test_check_invalid_plane_state ========
[20:04:29] ================ [PASSED] drm_plane_helper =================
[20:04:29] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[20:04:29] ====== drm_test_connector_helper_tv_get_modes_check  =======
[20:04:29] [PASSED] None
[20:04:29] [PASSED] PAL
[20:04:29] [PASSED] NTSC
[20:04:29] [PASSED] Both, NTSC Default
[20:04:29] [PASSED] Both, PAL Default
[20:04:29] [PASSED] Both, NTSC Default, with PAL on command-line
[20:04:29] [PASSED] Both, PAL Default, with NTSC on command-line
[20:04:29] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[20:04:29] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[20:04:29] ================== drm_rect (9 subtests) ===================
[20:04:29] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[20:04:29] [PASSED] drm_test_rect_clip_scaled_not_clipped
[20:04:29] [PASSED] drm_test_rect_clip_scaled_clipped
[20:04:29] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[20:04:29] ================= drm_test_rect_intersect  =================
[20:04:29] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[20:04:29] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[20:04:29] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[20:04:29] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[20:04:29] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[20:04:29] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[20:04:29] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[20:04:29] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[20:04:29] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[20:04:29] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[20:04:29] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[20:04:29] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[20:04:29] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[20:04:29] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[20:04:29] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[20:04:29] ============= [PASSED] drm_test_rect_intersect =============
[20:04:29] ================ drm_test_rect_calc_hscale  ================
[20:04:29] [PASSED] normal use
[20:04:29] [PASSED] out of max range
[20:04:29] [PASSED] out of min range
[20:04:29] [PASSED] zero dst
[20:04:29] [PASSED] negative src
[20:04:29] [PASSED] negative dst
[20:04:29] ============ [PASSED] drm_test_rect_calc_hscale ============
[20:04:29] ================ drm_test_rect_calc_vscale  ================
[20:04:29] [PASSED] normal use
[20:04:29] [PASSED] out of max range
[20:04:29] [PASSED] out of min range
[20:04:29] [PASSED] zero dst
[20:04:29] [PASSED] negative src
[20:04:29] [PASSED] negative dst
stty: 'standard input': Inappropriate ioctl for device
[20:04:29] ============ [PASSED] drm_test_rect_calc_vscale ============
[20:04:29] ================== drm_test_rect_rotate  ===================
[20:04:29] [PASSED] reflect-x
[20:04:29] [PASSED] reflect-y
[20:04:29] [PASSED] rotate-0
[20:04:29] [PASSED] rotate-90
[20:04:29] [PASSED] rotate-180
[20:04:29] [PASSED] rotate-270
[20:04:29] ============== [PASSED] drm_test_rect_rotate ===============
[20:04:29] ================ drm_test_rect_rotate_inv  =================
[20:04:29] [PASSED] reflect-x
[20:04:29] [PASSED] reflect-y
[20:04:29] [PASSED] rotate-0
[20:04:29] [PASSED] rotate-90
[20:04:29] [PASSED] rotate-180
[20:04:29] [PASSED] rotate-270
[20:04:29] ============ [PASSED] drm_test_rect_rotate_inv =============
[20:04:29] ==================== [PASSED] drm_rect =====================
[20:04:29] ============================================================
[20:04:29] Testing complete. Ran 602 tests: passed: 602
[20:04:29] Elapsed time: 23.191s total, 1.692s configuring, 21.282s building, 0.179s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[20:04:29] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:04:31] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
[20:04:39] Starting KUnit Kernel (1/1)...
[20:04:39] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[20:04:39] ================= ttm_device (5 subtests) ==================
[20:04:39] [PASSED] ttm_device_init_basic
[20:04:39] [PASSED] ttm_device_init_multiple
[20:04:39] [PASSED] ttm_device_fini_basic
[20:04:39] [PASSED] ttm_device_init_no_vma_man
[20:04:39] ================== ttm_device_init_pools  ==================
[20:04:39] [PASSED] No DMA allocations, no DMA32 required
[20:04:39] [PASSED] DMA allocations, DMA32 required
[20:04:39] [PASSED] No DMA allocations, DMA32 required
[20:04:39] [PASSED] DMA allocations, no DMA32 required
[20:04:39] ============== [PASSED] ttm_device_init_pools ==============
[20:04:39] =================== [PASSED] ttm_device ====================
[20:04:39] ================== ttm_pool (8 subtests) ===================
[20:04:39] ================== ttm_pool_alloc_basic  ===================
[20:04:39] [PASSED] One page
[20:04:39] [PASSED] More than one page
[20:04:39] [PASSED] Above the allocation limit
[20:04:39] [PASSED] One page, with coherent DMA mappings enabled
[20:04:39] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[20:04:39] ============== [PASSED] ttm_pool_alloc_basic ===============
[20:04:39] ============== ttm_pool_alloc_basic_dma_addr  ==============
[20:04:39] [PASSED] One page
[20:04:39] [PASSED] More than one page
[20:04:39] [PASSED] Above the allocation limit
[20:04:39] [PASSED] One page, with coherent DMA mappings enabled
[20:04:39] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[20:04:39] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[20:04:39] [PASSED] ttm_pool_alloc_order_caching_match
[20:04:39] [PASSED] ttm_pool_alloc_caching_mismatch
[20:04:39] [PASSED] ttm_pool_alloc_order_mismatch
[20:04:39] [PASSED] ttm_pool_free_dma_alloc
[20:04:39] [PASSED] ttm_pool_free_no_dma_alloc
[20:04:39] [PASSED] ttm_pool_fini_basic
[20:04:39] ==================== [PASSED] ttm_pool =====================
[20:04:39] ================ ttm_resource (8 subtests) =================
[20:04:39] ================= ttm_resource_init_basic  =================
[20:04:39] [PASSED] Init resource in TTM_PL_SYSTEM
[20:04:39] [PASSED] Init resource in TTM_PL_VRAM
[20:04:39] [PASSED] Init resource in a private placement
[20:04:39] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[20:04:39] ============= [PASSED] ttm_resource_init_basic =============
[20:04:39] [PASSED] ttm_resource_init_pinned
[20:04:39] [PASSED] ttm_resource_fini_basic
[20:04:39] [PASSED] ttm_resource_manager_init_basic
[20:04:39] [PASSED] ttm_resource_manager_usage_basic
[20:04:39] [PASSED] ttm_resource_manager_set_used_basic
[20:04:39] [PASSED] ttm_sys_man_alloc_basic
[20:04:39] [PASSED] ttm_sys_man_free_basic
[20:04:39] ================== [PASSED] ttm_resource ===================
[20:04:39] =================== ttm_tt (15 subtests) ===================
[20:04:39] ==================== ttm_tt_init_basic  ====================
[20:04:39] [PASSED] Page-aligned size
[20:04:39] [PASSED] Extra pages requested
[20:04:39] ================ [PASSED] ttm_tt_init_basic ================
[20:04:39] [PASSED] ttm_tt_init_misaligned
[20:04:39] [PASSED] ttm_tt_fini_basic
[20:04:39] [PASSED] ttm_tt_fini_sg
[20:04:39] [PASSED] ttm_tt_fini_shmem
[20:04:39] [PASSED] ttm_tt_create_basic
[20:04:39] [PASSED] ttm_tt_create_invalid_bo_type
[20:04:39] [PASSED] ttm_tt_create_ttm_exists
[20:04:39] [PASSED] ttm_tt_create_failed
[20:04:39] [PASSED] ttm_tt_destroy_basic
[20:04:39] [PASSED] ttm_tt_populate_null_ttm
[20:04:39] [PASSED] ttm_tt_populate_populated_ttm
[20:04:39] [PASSED] ttm_tt_unpopulate_basic
[20:04:39] [PASSED] ttm_tt_unpopulate_empty_ttm
[20:04:39] [PASSED] ttm_tt_swapin_basic
[20:04:39] ===================== [PASSED] ttm_tt ======================
[20:04:39] =================== ttm_bo (14 subtests) ===================
[20:04:39] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[20:04:39] [PASSED] Cannot be interrupted and sleeps
[20:04:39] [PASSED] Cannot be interrupted, locks straight away
[20:04:39] [PASSED] Can be interrupted, sleeps
[20:04:39] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[20:04:39] [PASSED] ttm_bo_reserve_locked_no_sleep
[20:04:39] [PASSED] ttm_bo_reserve_no_wait_ticket
[20:04:39] [PASSED] ttm_bo_reserve_double_resv
[20:04:39] [PASSED] ttm_bo_reserve_interrupted
[20:04:39] [PASSED] ttm_bo_reserve_deadlock
[20:04:39] [PASSED] ttm_bo_unreserve_basic
[20:04:39] [PASSED] ttm_bo_unreserve_pinned
[20:04:39] [PASSED] ttm_bo_unreserve_bulk
[20:04:39] [PASSED] ttm_bo_put_basic
[20:04:39] [PASSED] ttm_bo_put_shared_resv
[20:04:39] [PASSED] ttm_bo_pin_basic
[20:04:39] [PASSED] ttm_bo_pin_unpin_resource
[20:04:39] [PASSED] ttm_bo_multiple_pin_one_unpin
[20:04:39] ===================== [PASSED] ttm_bo ======================
[20:04:39] ============== ttm_bo_validate (22 subtests) ===============
[20:04:39] ============== ttm_bo_init_reserved_sys_man  ===============
[20:04:39] [PASSED] Buffer object for userspace
[20:04:39] [PASSED] Kernel buffer object
[20:04:39] [PASSED] Shared buffer object
[20:04:39] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[20:04:39] ============== ttm_bo_init_reserved_mock_man  ==============
[20:04:39] [PASSED] Buffer object for userspace
[20:04:39] [PASSED] Kernel buffer object
[20:04:39] [PASSED] Shared buffer object
[20:04:39] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[20:04:39] [PASSED] ttm_bo_init_reserved_resv
[20:04:39] ================== ttm_bo_validate_basic  ==================
[20:04:39] [PASSED] Buffer object for userspace
[20:04:39] [PASSED] Kernel buffer object
[20:04:39] [PASSED] Shared buffer object
[20:04:39] ============== [PASSED] ttm_bo_validate_basic ==============
[20:04:39] [PASSED] ttm_bo_validate_invalid_placement
[20:04:39] ============= ttm_bo_validate_same_placement  ==============
[20:04:39] [PASSED] System manager
[20:04:39] [PASSED] VRAM manager
[20:04:39] ========= [PASSED] ttm_bo_validate_same_placement ==========
[20:04:39] [PASSED] ttm_bo_validate_failed_alloc
[20:04:39] [PASSED] ttm_bo_validate_pinned
[20:04:39] [PASSED] ttm_bo_validate_busy_placement
[20:04:39] ================ ttm_bo_validate_multihop  =================
[20:04:39] [PASSED] Buffer object for userspace
[20:04:39] [PASSED] Kernel buffer object
[20:04:39] [PASSED] Shared buffer object
[20:04:39] ============ [PASSED] ttm_bo_validate_multihop =============
[20:04:39] ========== ttm_bo_validate_no_placement_signaled  ==========
[20:04:39] [PASSED] Buffer object in system domain, no page vector
[20:04:39] [PASSED] Buffer object in system domain with an existing page vector
[20:04:39] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[20:04:39] ======== ttm_bo_validate_no_placement_not_signaled  ========
[20:04:39] [PASSED] Buffer object for userspace
[20:04:39] [PASSED] Kernel buffer object
[20:04:39] [PASSED] Shared buffer object
[20:04:39] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[20:04:39] [PASSED] ttm_bo_validate_move_fence_signaled
[20:04:39] ========= ttm_bo_validate_move_fence_not_signaled  =========
[20:04:39] [PASSED] Waits for GPU
[20:04:39] [PASSED] Tries to lock straight away
[20:04:39] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[20:04:39] [PASSED] ttm_bo_validate_swapout
[20:04:39] [PASSED] ttm_bo_validate_happy_evict
[20:04:39] [PASSED] ttm_bo_validate_all_pinned_evict
[20:04:39] [PASSED] ttm_bo_validate_allowed_only_evict
[20:04:39] [PASSED] ttm_bo_validate_deleted_evict
[20:04:39] [PASSED] ttm_bo_validate_busy_domain_evict
[20:04:39] [PASSED] ttm_bo_validate_evict_gutting
[20:04:39] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[20:04:39] ================= [PASSED] ttm_bo_validate =================
[20:04:39] ============================================================
[20:04:39] Testing complete. Ran 102 tests: passed: 102
[20:04:39] Elapsed time: 10.004s total, 1.633s configuring, 7.703s building, 0.569s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


