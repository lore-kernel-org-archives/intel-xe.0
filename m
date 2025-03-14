Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D192C282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:44:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5289610E995;
	Fri, 14 Mar 2025 07:44:36 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34F910E994;
 Fri, 14 Mar 2025 07:44:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Apply_Wa=5F160231052?=
 =?utf-8?q?32_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Mar 2025 07:44:34 -0000
Message-ID: <174193827479.32986.1299833347876638036@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250313235850.1583584-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250313235850.1583584-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe: Apply Wa_16023105232 (rev6)
URL   : https://patchwork.freedesktop.org/series/145449/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[07:43:28] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:43:32] Building KUnit Kernel ...
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

[07:43:58] Starting KUnit Kernel (1/1)...
[07:43:58] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[07:43:58] ================== guc_buf (11 subtests) ===================
[07:43:58] [PASSED] test_smallest
[07:43:58] [PASSED] test_largest
[07:43:58] [PASSED] test_granular
[07:43:58] [PASSED] test_unique
[07:43:58] [PASSED] test_overlap
[07:43:58] [PASSED] test_reusable
[07:43:58] [PASSED] test_too_big
[07:43:58] [PASSED] test_flush
[07:43:58] [PASSED] test_lookup
[07:43:58] [PASSED] test_data
[07:43:58] [PASSED] test_class
[07:43:58] ===================== [PASSED] guc_buf =====================
[07:43:58] =================== guc_dbm (7 subtests) ===================
[07:43:58] [PASSED] test_empty
[07:43:58] [PASSED] test_default
[07:43:58] ======================== test_size  ========================
[07:43:58] [PASSED] 4
[07:43:58] [PASSED] 8
[07:43:58] [PASSED] 32
[07:43:58] [PASSED] 256
[07:43:58] ==================== [PASSED] test_size ====================
[07:43:58] ======================= test_reuse  ========================
[07:43:58] [PASSED] 4
[07:43:58] [PASSED] 8
[07:43:58] [PASSED] 32
[07:43:58] [PASSED] 256
[07:43:58] =================== [PASSED] test_reuse ====================
[07:43:58] =================== test_range_overlap  ====================
[07:43:58] [PASSED] 4
[07:43:58] [PASSED] 8
[07:43:58] [PASSED] 32
[07:43:58] [PASSED] 256
[07:43:58] =============== [PASSED] test_range_overlap ================
[07:43:58] =================== test_range_compact  ====================
[07:43:58] [PASSED] 4
[07:43:58] [PASSED] 8
[07:43:58] [PASSED] 32
[07:43:58] [PASSED] 256
[07:43:58] =============== [PASSED] test_range_compact ================
[07:43:58] ==================== test_range_spare  =====================
[07:43:58] [PASSED] 4
[07:43:58] [PASSED] 8
[07:43:58] [PASSED] 32
[07:43:58] [PASSED] 256
[07:43:58] ================ [PASSED] test_range_spare =================
[07:43:58] ===================== [PASSED] guc_dbm =====================
[07:43:58] =================== guc_idm (6 subtests) ===================
[07:43:58] [PASSED] bad_init
[07:43:58] [PASSED] no_init
[07:43:58] [PASSED] init_fini
[07:43:58] [PASSED] check_used
[07:43:59] [PASSED] check_quota
[07:43:59] [PASSED] check_all
[07:43:59] ===================== [PASSED] guc_idm =====================
[07:43:59] ================== no_relay (3 subtests) ===================
[07:43:59] [PASSED] xe_drops_guc2pf_if_not_ready
[07:43:59] [PASSED] xe_drops_guc2vf_if_not_ready
[07:43:59] [PASSED] xe_rejects_send_if_not_ready
[07:43:59] ==================== [PASSED] no_relay =====================
[07:43:59] ================== pf_relay (14 subtests) ==================
[07:43:59] [PASSED] pf_rejects_guc2pf_too_short
[07:43:59] [PASSED] pf_rejects_guc2pf_too_long
[07:43:59] [PASSED] pf_rejects_guc2pf_no_payload
[07:43:59] [PASSED] pf_fails_no_payload
[07:43:59] [PASSED] pf_fails_bad_origin
[07:43:59] [PASSED] pf_fails_bad_type
[07:43:59] [PASSED] pf_txn_reports_error
[07:43:59] [PASSED] pf_txn_sends_pf2guc
[07:43:59] [PASSED] pf_sends_pf2guc
[07:43:59] [SKIPPED] pf_loopback_nop
[07:43:59] [SKIPPED] pf_loopback_echo
[07:43:59] [SKIPPED] pf_loopback_fail
[07:43:59] [SKIPPED] pf_loopback_busy
[07:43:59] [SKIPPED] pf_loopback_retry
[07:43:59] ==================== [PASSED] pf_relay =====================
[07:43:59] ================== vf_relay (3 subtests) ===================
[07:43:59] [PASSED] vf_rejects_guc2vf_too_short
[07:43:59] [PASSED] vf_rejects_guc2vf_too_long
[07:43:59] [PASSED] vf_rejects_guc2vf_no_payload
[07:43:59] ==================== [PASSED] vf_relay =====================
[07:43:59] ================= pf_service (11 subtests) =================
[07:43:59] [PASSED] pf_negotiate_any
[07:43:59] [PASSED] pf_negotiate_base_match
[07:43:59] [PASSED] pf_negotiate_base_newer
[07:43:59] [PASSED] pf_negotiate_base_next
[07:43:59] [SKIPPED] pf_negotiate_base_older
[07:43:59] [PASSED] pf_negotiate_base_prev
[07:43:59] [PASSED] pf_negotiate_latest_match
[07:43:59] [PASSED] pf_negotiate_latest_newer
[07:43:59] [PASSED] pf_negotiate_latest_next
[07:43:59] [SKIPPED] pf_negotiate_latest_older
[07:43:59] [SKIPPED] pf_negotiate_latest_prev
[07:43:59] =================== [PASSED] pf_service ====================
[07:43:59] ===================== lmtt (1 subtest) =====================
[07:43:59] ======================== test_ops  =========================
[07:43:59] [PASSED] 2-level
[07:43:59] [PASSED] multi-level
[07:43:59] ==================== [PASSED] test_ops =====================
[07:43:59] ====================== [PASSED] lmtt =======================
[07:43:59] =================== xe_mocs (2 subtests) ===================
[07:43:59] ================ xe_live_mocs_kernel_kunit  ================
[07:43:59] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[07:43:59] ================ xe_live_mocs_reset_kunit  =================
[07:43:59] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[07:43:59] ==================== [SKIPPED] xe_mocs =====================
[07:43:59] ================= xe_migrate (2 subtests) ==================
[07:43:59] ================= xe_migrate_sanity_kunit  =================
[07:43:59] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[07:43:59] ================== xe_validate_ccs_kunit  ==================
[07:43:59] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[07:43:59] =================== [SKIPPED] xe_migrate ===================
[07:43:59] ================== xe_dma_buf (1 subtest) ==================
[07:43:59] ==================== xe_dma_buf_kunit  =====================
[07:43:59] ================ [SKIPPED] xe_dma_buf_kunit ================
[07:43:59] =================== [SKIPPED] xe_dma_buf ===================
[07:43:59] ================= xe_bo_shrink (1 subtest) =================
[07:43:59] =================== xe_bo_shrink_kunit  ====================
[07:43:59] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[07:43:59] ================== [SKIPPED] xe_bo_shrink ==================
[07:43:59] ==================== xe_bo (2 subtests) ====================
[07:43:59] ================== xe_ccs_migrate_kunit  ===================
[07:43:59] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
stty: 'standard input': Inappropriate ioctl for device
[07:43:59] ==================== xe_bo_evict_kunit  ====================
[07:43:59] =============== [SKIPPED] xe_bo_evict_kunit ================
[07:43:59] ===================== [SKIPPED] xe_bo ======================
[07:43:59] ==================== args (11 subtests) ====================
[07:43:59] [PASSED] count_args_test
[07:43:59] [PASSED] call_args_example
[07:43:59] [PASSED] call_args_test
[07:43:59] [PASSED] drop_first_arg_example
[07:43:59] [PASSED] drop_first_arg_test
[07:43:59] [PASSED] first_arg_example
[07:43:59] [PASSED] first_arg_test
[07:43:59] [PASSED] last_arg_example
[07:43:59] [PASSED] last_arg_test
[07:43:59] [PASSED] pick_arg_example
[07:43:59] [PASSED] sep_comma_example
[07:43:59] ====================== [PASSED] args =======================
[07:43:59] =================== xe_pci (2 subtests) ====================
[07:43:59] [PASSED] xe_gmdid_graphics_ip
[07:43:59] [PASSED] xe_gmdid_media_ip
[07:43:59] ===================== [PASSED] xe_pci ======================
[07:43:59] =================== xe_rtp (2 subtests) ====================
[07:43:59] =============== xe_rtp_process_to_sr_tests  ================
[07:43:59] [PASSED] coalesce-same-reg
[07:43:59] [PASSED] no-match-no-add
[07:43:59] [PASSED] match-or
[07:43:59] [PASSED] match-or-xfail
[07:43:59] [PASSED] no-match-no-add-multiple-rules
[07:43:59] [PASSED] two-regs-two-entries
[07:43:59] [PASSED] clr-one-set-other
[07:43:59] [PASSED] set-field
[07:43:59] [PASSED] conflict-duplicate
[07:43:59] [PASSED] conflict-not-disjoint
[07:43:59] [PASSED] conflict-reg-type
[07:43:59] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[07:43:59] ================== xe_rtp_process_tests  ===================
[07:43:59] [PASSED] active1
[07:43:59] [PASSED] active2
[07:43:59] [PASSED] active-inactive
[07:43:59] [PASSED] inactive-active
[07:43:59] [PASSED] inactive-1st_or_active-inactive
[07:43:59] [PASSED] inactive-2nd_or_active-inactive
[07:43:59] [PASSED] inactive-last_or_active-inactive
[07:43:59] [PASSED] inactive-no_or_active-inactive
[07:43:59] ============== [PASSED] xe_rtp_process_tests ===============
[07:43:59] ===================== [PASSED] xe_rtp ======================
[07:43:59] ==================== xe_wa (1 subtest) =====================
[07:43:59] ======================== xe_wa_gt  =========================
[07:43:59] [PASSED] TIGERLAKE (B0)
[07:43:59] [PASSED] DG1 (A0)
[07:43:59] [PASSED] DG1 (B0)
[07:43:59] [PASSED] ALDERLAKE_S (A0)
[07:43:59] [PASSED] ALDERLAKE_S (B0)
[07:43:59] [PASSED] ALDERLAKE_S (C0)
[07:43:59] [PASSED] ALDERLAKE_S (D0)
[07:43:59] [PASSED] ALDERLAKE_P (A0)
[07:43:59] [PASSED] ALDERLAKE_P (B0)
[07:43:59] [PASSED] ALDERLAKE_P (C0)
[07:43:59] [PASSED] ALDERLAKE_S_RPLS (D0)
[07:43:59] [PASSED] ALDERLAKE_P_RPLU (E0)
[07:43:59] [PASSED] DG2_G10 (C0)
[07:43:59] [PASSED] DG2_G11 (B1)
[07:43:59] [PASSED] DG2_G12 (A1)
[07:43:59] [PASSED] METEORLAKE (g:A0, m:A0)
[07:43:59] [PASSED] METEORLAKE (g:A0, m:A0)
[07:43:59] [PASSED] METEORLAKE (g:A0, m:A0)
[07:43:59] [PASSED] LUNARLAKE (g:A0, m:A0)
[07:43:59] [PASSED] LUNARLAKE (g:B0, m:A0)
[07:43:59] [PASSED] BATTLEMAGE (g:A0, m:A1)
[07:43:59] ==================== [PASSED] xe_wa_gt =====================
[07:43:59] ====================== [PASSED] xe_wa ======================
[07:43:59] ============================================================
[07:43:59] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[07:43:59] Elapsed time: 30.660s total, 4.133s configuring, 26.260s building, 0.247s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[07:43:59] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:44:00] Building KUnit Kernel ...
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

[07:44:21] Starting KUnit Kernel (1/1)...
[07:44:21] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[07:44:21] =========== drm_validate_clone_mode (2 subtests) ===========
[07:44:21] ============== drm_test_check_in_clone_mode  ===============
[07:44:21] [PASSED] in_clone_mode
[07:44:21] [PASSED] not_in_clone_mode
[07:44:21] ========== [PASSED] drm_test_check_in_clone_mode ===========
[07:44:21] =============== drm_test_check_valid_clones  ===============
[07:44:21] [PASSED] not_in_clone_mode
[07:44:21] [PASSED] valid_clone
[07:44:21] [PASSED] invalid_clone
[07:44:21] =========== [PASSED] drm_test_check_valid_clones ===========
[07:44:21] ============= [PASSED] drm_validate_clone_mode =============
[07:44:21] ============= drm_validate_modeset (1 subtest) =============
[07:44:21] [PASSED] drm_test_check_connector_changed_modeset
[07:44:21] ============== [PASSED] drm_validate_modeset ===============
[07:44:21] ================== drm_buddy (7 subtests) ==================
[07:44:21] [PASSED] drm_test_buddy_alloc_limit
[07:44:21] [PASSED] drm_test_buddy_alloc_optimistic
[07:44:21] [PASSED] drm_test_buddy_alloc_pessimistic
[07:44:21] [PASSED] drm_test_buddy_alloc_pathological
[07:44:21] [PASSED] drm_test_buddy_alloc_contiguous
[07:44:21] [PASSED] drm_test_buddy_alloc_clear
[07:44:21] [PASSED] drm_test_buddy_alloc_range_bias
[07:44:21] ==================== [PASSED] drm_buddy ====================
[07:44:21] ============= drm_cmdline_parser (40 subtests) =============
[07:44:21] [PASSED] drm_test_cmdline_force_d_only
[07:44:21] [PASSED] drm_test_cmdline_force_D_only_dvi
[07:44:21] [PASSED] drm_test_cmdline_force_D_only_hdmi
[07:44:21] [PASSED] drm_test_cmdline_force_D_only_not_digital
[07:44:21] [PASSED] drm_test_cmdline_force_e_only
[07:44:21] [PASSED] drm_test_cmdline_res
[07:44:21] [PASSED] drm_test_cmdline_res_vesa
[07:44:21] [PASSED] drm_test_cmdline_res_vesa_rblank
[07:44:21] [PASSED] drm_test_cmdline_res_rblank
[07:44:21] [PASSED] drm_test_cmdline_res_bpp
[07:44:21] [PASSED] drm_test_cmdline_res_refresh
[07:44:21] [PASSED] drm_test_cmdline_res_bpp_refresh
[07:44:21] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[07:44:21] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[07:44:21] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[07:44:21] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[07:44:21] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[07:44:21] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[07:44:21] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[07:44:21] [PASSED] drm_test_cmdline_res_margins_force_on
[07:44:21] [PASSED] drm_test_cmdline_res_vesa_margins
[07:44:21] [PASSED] drm_test_cmdline_name
[07:44:21] [PASSED] drm_test_cmdline_name_bpp
[07:44:21] [PASSED] drm_test_cmdline_name_option
[07:44:21] [PASSED] drm_test_cmdline_name_bpp_option
[07:44:21] [PASSED] drm_test_cmdline_rotate_0
[07:44:21] [PASSED] drm_test_cmdline_rotate_90
[07:44:21] [PASSED] drm_test_cmdline_rotate_180
[07:44:21] [PASSED] drm_test_cmdline_rotate_270
[07:44:21] [PASSED] drm_test_cmdline_hmirror
[07:44:21] [PASSED] drm_test_cmdline_vmirror
[07:44:21] [PASSED] drm_test_cmdline_margin_options
[07:44:21] [PASSED] drm_test_cmdline_multiple_options
[07:44:21] [PASSED] drm_test_cmdline_bpp_extra_and_option
[07:44:21] [PASSED] drm_test_cmdline_extra_and_option
[07:44:21] [PASSED] drm_test_cmdline_freestanding_options
[07:44:21] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[07:44:21] [PASSED] drm_test_cmdline_panel_orientation
[07:44:21] ================ drm_test_cmdline_invalid  =================
[07:44:21] [PASSED] margin_only
[07:44:21] [PASSED] interlace_only
[07:44:21] [PASSED] res_missing_x
[07:44:21] [PASSED] res_missing_y
[07:44:21] [PASSED] res_bad_y
[07:44:21] [PASSED] res_missing_y_bpp
[07:44:21] [PASSED] res_bad_bpp
[07:44:21] [PASSED] res_bad_refresh
[07:44:21] [PASSED] res_bpp_refresh_force_on_off
[07:44:21] [PASSED] res_invalid_mode
[07:44:21] [PASSED] res_bpp_wrong_place_mode
[07:44:21] [PASSED] name_bpp_refresh
[07:44:21] [PASSED] name_refresh
[07:44:21] [PASSED] name_refresh_wrong_mode
[07:44:21] [PASSED] name_refresh_invalid_mode
[07:44:21] [PASSED] rotate_multiple
[07:44:21] [PASSED] rotate_invalid_val
[07:44:21] [PASSED] rotate_truncated
[07:44:21] [PASSED] invalid_option
[07:44:21] [PASSED] invalid_tv_option
[07:44:21] [PASSED] truncated_tv_option
[07:44:21] ============ [PASSED] drm_test_cmdline_invalid =============
[07:44:21] =============== drm_test_cmdline_tv_options  ===============
[07:44:21] [PASSED] NTSC
[07:44:21] [PASSED] NTSC_443
[07:44:21] [PASSED] NTSC_J
[07:44:21] [PASSED] PAL
[07:44:21] [PASSED] PAL_M
[07:44:21] [PASSED] PAL_N
[07:44:21] [PASSED] SECAM
[07:44:21] [PASSED] MONO_525
[07:44:21] [PASSED] MONO_625
[07:44:21] =========== [PASSED] drm_test_cmdline_tv_options ===========
[07:44:21] =============== [PASSED] drm_cmdline_parser ================
[07:44:21] ========== drmm_connector_hdmi_init (20 subtests) ==========
[07:44:21] [PASSED] drm_test_connector_hdmi_init_valid
[07:44:21] [PASSED] drm_test_connector_hdmi_init_bpc_8
[07:44:21] [PASSED] drm_test_connector_hdmi_init_bpc_10
[07:44:21] [PASSED] drm_test_connector_hdmi_init_bpc_12
[07:44:21] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[07:44:21] [PASSED] drm_test_connector_hdmi_init_bpc_null
[07:44:21] [PASSED] drm_test_connector_hdmi_init_formats_empty
[07:44:21] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[07:44:21] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[07:44:21] [PASSED] supported_formats=0x9 yuv420_allowed=1
[07:44:21] [PASSED] supported_formats=0x9 yuv420_allowed=0
[07:44:21] [PASSED] supported_formats=0x3 yuv420_allowed=1
[07:44:21] [PASSED] supported_formats=0x3 yuv420_allowed=0
[07:44:21] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[07:44:21] [PASSED] drm_test_connector_hdmi_init_null_ddc
[07:44:21] [PASSED] drm_test_connector_hdmi_init_null_product
[07:44:21] [PASSED] drm_test_connector_hdmi_init_null_vendor
[07:44:21] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[07:44:21] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[07:44:21] [PASSED] drm_test_connector_hdmi_init_product_valid
[07:44:21] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[07:44:21] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[07:44:21] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[07:44:21] ========= drm_test_connector_hdmi_init_type_valid  =========
[07:44:21] [PASSED] HDMI-A
[07:44:21] [PASSED] HDMI-B
[07:44:21] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[07:44:21] ======== drm_test_connector_hdmi_init_type_invalid  ========
[07:44:21] [PASSED] Unknown
[07:44:21] [PASSED] VGA
[07:44:21] [PASSED] DVI-I
[07:44:21] [PASSED] DVI-D
[07:44:21] [PASSED] DVI-A
[07:44:21] [PASSED] Composite
[07:44:21] [PASSED] SVIDEO
[07:44:21] [PASSED] LVDS
[07:44:21] [PASSED] Component
[07:44:21] [PASSED] DIN
[07:44:21] [PASSED] DP
[07:44:21] [PASSED] TV
[07:44:21] [PASSED] eDP
[07:44:21] [PASSED] Virtual
[07:44:21] [PASSED] DSI
[07:44:21] [PASSED] DPI
[07:44:21] [PASSED] Writeback
[07:44:21] [PASSED] SPI
[07:44:21] [PASSED] USB
[07:44:21] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[07:44:21] ============ [PASSED] drmm_connector_hdmi_init =============
[07:44:21] ============= drmm_connector_init (3 subtests) =============
[07:44:21] [PASSED] drm_test_drmm_connector_init
[07:44:21] [PASSED] drm_test_drmm_connector_init_null_ddc
[07:44:21] ========= drm_test_drmm_connector_init_type_valid  =========
[07:44:21] [PASSED] Unknown
[07:44:21] [PASSED] VGA
[07:44:21] [PASSED] DVI-I
[07:44:21] [PASSED] DVI-D
[07:44:21] [PASSED] DVI-A
[07:44:21] [PASSED] Composite
[07:44:21] [PASSED] SVIDEO
[07:44:21] [PASSED] LVDS
[07:44:21] [PASSED] Component
[07:44:21] [PASSED] DIN
[07:44:21] [PASSED] DP
[07:44:21] [PASSED] HDMI-A
[07:44:21] [PASSED] HDMI-B
[07:44:21] [PASSED] TV
[07:44:21] [PASSED] eDP
[07:44:21] [PASSED] Virtual
[07:44:21] [PASSED] DSI
[07:44:21] [PASSED] DPI
[07:44:21] [PASSED] Writeback
[07:44:21] [PASSED] SPI
[07:44:21] [PASSED] USB
[07:44:21] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[07:44:21] =============== [PASSED] drmm_connector_init ===============
[07:44:21] ========= drm_connector_dynamic_init (6 subtests) ==========
[07:44:21] [PASSED] drm_test_drm_connector_dynamic_init
[07:44:21] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[07:44:21] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[07:44:21] [PASSED] drm_test_drm_connector_dynamic_init_properties
[07:44:21] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[07:44:21] [PASSED] Unknown
[07:44:21] [PASSED] VGA
[07:44:21] [PASSED] DVI-I
[07:44:21] [PASSED] DVI-D
[07:44:21] [PASSED] DVI-A
[07:44:21] [PASSED] Composite
[07:44:21] [PASSED] SVIDEO
[07:44:21] [PASSED] LVDS
[07:44:21] [PASSED] Component
[07:44:21] [PASSED] DIN
[07:44:21] [PASSED] DP
[07:44:21] [PASSED] HDMI-A
[07:44:21] [PASSED] HDMI-B
[07:44:21] [PASSED] TV
[07:44:21] [PASSED] eDP
[07:44:21] [PASSED] Virtual
[07:44:21] [PASSED] DSI
[07:44:21] [PASSED] DPI
[07:44:21] [PASSED] Writeback
[07:44:21] [PASSED] SPI
[07:44:21] [PASSED] USB
[07:44:21] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[07:44:21] ======== drm_test_drm_connector_dynamic_init_name  =========
[07:44:21] [PASSED] Unknown
[07:44:21] [PASSED] VGA
[07:44:21] [PASSED] DVI-I
[07:44:21] [PASSED] DVI-D
[07:44:21] [PASSED] DVI-A
[07:44:21] [PASSED] Composite
[07:44:21] [PASSED] SVIDEO
[07:44:21] [PASSED] LVDS
[07:44:21] [PASSED] Component
[07:44:21] [PASSED] DIN
[07:44:21] [PASSED] DP
[07:44:21] [PASSED] HDMI-A
[07:44:21] [PASSED] HDMI-B
[07:44:21] [PASSED] TV
[07:44:21] [PASSED] eDP
[07:44:21] [PASSED] Virtual
[07:44:21] [PASSED] DSI
[07:44:21] [PASSED] DPI
[07:44:21] [PASSED] Writeback
[07:44:21] [PASSED] SPI
[07:44:21] [PASSED] USB
[07:44:21] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[07:44:21] =========== [PASSED] drm_connector_dynamic_init ============
[07:44:21] ==== drm_connector_dynamic_register_early (4 subtests) =====
[07:44:21] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[07:44:21] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[07:44:21] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[07:44:21] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[07:44:21] ====== [PASSED] drm_connector_dynamic_register_early =======
[07:44:21] ======= drm_connector_dynamic_register (7 subtests) ========
[07:44:21] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[07:44:21] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[07:44:21] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[07:44:21] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[07:44:21] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[07:44:21] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[07:44:21] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[07:44:21] ========= [PASSED] drm_connector_dynamic_register ==========
[07:44:21] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[07:44:21] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[07:44:21] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[07:44:21] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[07:44:21] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[07:44:21] ========== drm_test_get_tv_mode_from_name_valid  ===========
[07:44:21] [PASSED] NTSC
[07:44:21] [PASSED] NTSC-443
[07:44:21] [PASSED] NTSC-J
[07:44:21] [PASSED] PAL
[07:44:21] [PASSED] PAL-M
[07:44:21] [PASSED] PAL-N
[07:44:21] [PASSED] SECAM
[07:44:21] [PASSED] Mono
[07:44:21] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[07:44:21] [PASSED] drm_test_get_tv_mode_from_name_truncated
[07:44:21] ============ [PASSED] drm_get_tv_mode_from_name ============
[07:44:21] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[07:44:21] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[07:44:21] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[07:44:21] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[07:44:21] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[07:44:21] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[07:44:21] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[07:44:21] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[07:44:21] [PASSED] VIC 96
[07:44:21] [PASSED] VIC 97
[07:44:21] [PASSED] VIC 101
[07:44:21] [PASSED] VIC 102
[07:44:21] [PASSED] VIC 106
[07:44:21] [PASSED] VIC 107
[07:44:21] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[07:44:21] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[07:44:21] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[07:44:21] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[07:44:21] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[07:44:21] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[07:44:21] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[07:44:21] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[07:44:21] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[07:44:21] [PASSED] Automatic
[07:44:21] [PASSED] Full
[07:44:21] [PASSED] Limited 16:235
[07:44:21] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[07:44:21] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[07:44:21] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[07:44:21] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[07:44:21] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[07:44:21] [PASSED] RGB
[07:44:21] [PASSED] YUV 4:2:0
[07:44:21] [PASSED] YUV 4:2:2
[07:44:21] [PASSED] YUV 4:4:4
[07:44:21] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[07:44:21] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[07:44:21] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[07:44:21] ============= drm_damage_helper (21 subtests) ==============
[07:44:21] [PASSED] drm_test_damage_iter_no_damage
[07:44:21] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[07:44:21] [PASSED] drm_test_damage_iter_no_damage_src_moved
[07:44:21] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[07:44:21] [PASSED] drm_test_damage_iter_no_damage_not_visible
[07:44:21] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[07:44:21] [PASSED] drm_test_damage_iter_no_damage_no_fb
[07:44:21] [PASSED] drm_test_damage_iter_simple_damage
[07:44:21] [PASSED] drm_test_damage_iter_single_damage
[07:44:21] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[07:44:21] [PASSED] drm_test_damage_iter_single_damage_outside_src
[07:44:21] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[07:44:21] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[07:44:21] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[07:44:21] [PASSED] drm_test_damage_iter_single_damage_src_moved
[07:44:21] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[07:44:21] [PASSED] drm_test_damage_iter_damage
[07:44:21] [PASSED] drm_test_damage_iter_damage_one_intersect
[07:44:21] [PASSED] drm_test_damage_iter_damage_one_outside
[07:44:21] [PASSED] drm_test_damage_iter_damage_src_moved
[07:44:21] [PASSED] drm_test_damage_iter_damage_not_visible
[07:44:21] ================ [PASSED] drm_damage_helper ================
[07:44:21] ============== drm_dp_mst_helper (3 subtests) ==============
[07:44:21] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[07:44:21] [PASSED] Clock 154000 BPP 30 DSC disabled
[07:44:21] [PASSED] Clock 234000 BPP 30 DSC disabled
[07:44:21] [PASSED] Clock 297000 BPP 24 DSC disabled
[07:44:21] [PASSED] Clock 332880 BPP 24 DSC enabled
[07:44:21] [PASSED] Clock 324540 BPP 24 DSC enabled
[07:44:21] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[07:44:21] ============== drm_test_dp_mst_calc_pbn_div  ===============
[07:44:21] [PASSED] Link rate 2000000 lane count 4
[07:44:21] [PASSED] Link rate 2000000 lane count 2
[07:44:21] [PASSED] Link rate 2000000 lane count 1
[07:44:21] [PASSED] Link rate 1350000 lane count 4
[07:44:21] [PASSED] Link rate 1350000 lane count 2
[07:44:21] [PASSED] Link rate 1350000 lane count 1
[07:44:21] [PASSED] Link rate 1000000 lane count 4
[07:44:21] [PASSED] Link rate 1000000 lane count 2
[07:44:21] [PASSED] Link rate 1000000 lane count 1
[07:44:21] [PASSED] Link rate 810000 lane count 4
[07:44:21] [PASSED] Link rate 810000 lane count 2
[07:44:21] [PASSED] Link rate 810000 lane count 1
[07:44:21] [PASSED] Link rate 540000 lane count 4
[07:44:21] [PASSED] Link rate 540000 lane count 2
[07:44:21] [PASSED] Link rate 540000 lane count 1
[07:44:21] [PASSED] Link rate 270000 lane count 4
[07:44:21] [PASSED] Link rate 270000 lane count 2
[07:44:21] [PASSED] Link rate 270000 lane count 1
[07:44:21] [PASSED] Link rate 162000 lane count 4
[07:44:21] [PASSED] Link rate 162000 lane count 2
[07:44:21] [PASSED] Link rate 162000 lane count 1
[07:44:21] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[07:44:21] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[07:44:21] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[07:44:21] [PASSED] DP_POWER_UP_PHY with port number
[07:44:21] [PASSED] DP_POWER_DOWN_PHY with port number
[07:44:21] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[07:44:21] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[07:44:21] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[07:44:21] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[07:44:21] [PASSED] DP_QUERY_PAYLOAD with port number
[07:44:21] [PASSED] DP_QUERY_PAYLOAD with VCPI
[07:44:21] [PASSED] DP_REMOTE_DPCD_READ with port number
[07:44:21] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[07:44:21] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[07:44:21] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[07:44:21] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[07:44:21] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[07:44:21] [PASSED] DP_REMOTE_I2C_READ with port number
[07:44:21] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[07:44:21] [PASSED] DP_REMOTE_I2C_READ with transactions array
[07:44:21] [PASSED] DP_REMOTE_I2C_WRITE with port number
[07:44:21] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[07:44:21] [PASSED] DP_REMOTE_I2C_WRITE with data array
[07:44:21] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[07:44:21] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[07:44:21] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[07:44:21] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[07:44:21] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[07:44:21] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[07:44:21] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[07:44:21] ================ [PASSED] drm_dp_mst_helper ================
[07:44:21] ================== drm_exec (7 subtests) ===================
[07:44:21] [PASSED] sanitycheck
[07:44:21] [PASSED] test_lock
[07:44:21] [PASSED] test_lock_unlock
[07:44:21] [PASSED] test_duplicates
[07:44:21] [PASSED] test_prepare
[07:44:21] [PASSED] test_prepare_array
[07:44:21] [PASSED] test_multiple_loops
[07:44:21] ==================== [PASSED] drm_exec =====================
[07:44:21] =========== drm_format_helper_test (18 subtests) ===========
[07:44:21] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[07:44:21] [PASSED] single_pixel_source_buffer
[07:44:21] [PASSED] single_pixel_clip_rectangle
[07:44:21] [PASSED] well_known_colors
[07:44:21] [PASSED] destination_pitch
[07:44:21] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[07:44:21] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[07:44:21] [PASSED] single_pixel_source_buffer
[07:44:21] [PASSED] single_pixel_clip_rectangle
[07:44:21] [PASSED] well_known_colors
[07:44:21] [PASSED] destination_pitch
[07:44:21] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[07:44:21] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[07:44:21] [PASSED] single_pixel_source_buffer
[07:44:21] [PASSED] single_pixel_clip_rectangle
[07:44:21] [PASSED] well_known_colors
[07:44:21] [PASSED] destination_pitch
[07:44:21] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[07:44:21] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[07:44:21] [PASSED] single_pixel_source_buffer
[07:44:21] [PASSED] single_pixel_clip_rectangle
[07:44:21] [PASSED] well_known_colors
[07:44:21] [PASSED] destination_pitch
[07:44:21] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[07:44:21] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[07:44:21] [PASSED] single_pixel_source_buffer
[07:44:21] [PASSED] single_pixel_clip_rectangle
[07:44:21] [PASSED] well_known_colors
[07:44:21] [PASSED] destination_pitch
[07:44:21] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[07:44:21] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[07:44:21] [PASSED] single_pixel_source_buffer
[07:44:21] [PASSED] single_pixel_clip_rectangle
[07:44:21] [PASSED] well_known_colors
[07:44:21] [PASSED] destination_pitch
[07:44:21] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[07:44:21] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[07:44:21] [PASSED] single_pixel_source_buffer
[07:44:21] [PASSED] single_pixel_clip_rectangle
[07:44:21] [PASSED] well_known_colors
[07:44:21] [PASSED] destination_pitch
[07:44:21] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[07:44:21] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[07:44:21] [PASSED] single_pixel_source_buffer
[07:44:21] [PASSED] single_pixel_clip_rectangle
[07:44:21] [PASSED] well_known_colors
[07:44:21] [PASSED] destination_pitch
[07:44:21] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[07:44:21] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[07:44:21] [PASSED] single_pixel_source_buffer
[07:44:21] [PASSED] single_pixel_clip_rectangle
[07:44:21] [PASSED] well_known_colors
[07:44:21] [PASSED] destination_pitch
[07:44:21] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[07:44:21] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[07:44:21] [PASSED] single_pixel_source_buffer
[07:44:21] [PASSED] single_pixel_clip_rectangle
[07:44:21] [PASSED] well_known_colors
[07:44:21] [PASSED] destination_pitch
[07:44:21] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[07:44:21] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[07:44:21] [PASSED] single_pixel_source_buffer
[07:44:21] [PASSED] single_pixel_clip_rectangle
[07:44:21] [PASSED] well_known_colors
[07:44:21] [PASSED] destination_pitch
[07:44:21] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[07:44:21] ============== drm_test_fb_xrgb8888_to_mono  ===============
[07:44:21] [PASSED] single_pixel_source_buffer
[07:44:21] [PASSED] single_pixel_clip_rectangle
[07:44:21] [PASSED] well_known_colors
[07:44:21] [PASSED] destination_pitch
[07:44:21] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[07:44:21] ==================== drm_test_fb_swab  =====================
[07:44:21] [PASSED] single_pixel_source_buffer
[07:44:21] [PASSED] single_pixel_clip_rectangle
[07:44:21] [PASSED] well_known_colors
[07:44:21] [PASSED] destination_pitch
[07:44:21] ================ [PASSED] drm_test_fb_swab =================
[07:44:21] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[07:44:21] [PASSED] single_pixel_source_buffer
[07:44:21] [PASSED] single_pixel_clip_rectangle
[07:44:21] [PASSED] well_known_colors
[07:44:21] [PASSED] destination_pitch
[07:44:21] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[07:44:21] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[07:44:21] [PASSED] single_pixel_source_buffer
[07:44:21] [PASSED] single_pixel_clip_rectangle
[07:44:21] [PASSED] well_known_colors
[07:44:21] [PASSED] destination_pitch
[07:44:21] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[07:44:21] ================= drm_test_fb_clip_offset  =================
[07:44:21] [PASSED] pass through
[07:44:21] [PASSED] horizontal offset
[07:44:21] [PASSED] vertical offset
[07:44:21] [PASSED] horizontal and vertical offset
[07:44:21] [PASSED] horizontal offset (custom pitch)
[07:44:21] [PASSED] vertical offset (custom pitch)
[07:44:21] [PASSED] horizontal and vertical offset (custom pitch)
[07:44:21] ============= [PASSED] drm_test_fb_clip_offset =============
[07:44:21] ============== drm_test_fb_build_fourcc_list  ==============
[07:44:21] [PASSED] no native formats
[07:44:21] [PASSED] XRGB8888 as native format
[07:44:21] [PASSED] remove duplicates
[07:44:21] [PASSED] convert alpha formats
[07:44:21] [PASSED] random formats
[07:44:21] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[07:44:21] =================== drm_test_fb_memcpy  ====================
[07:44:21] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[07:44:21] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[07:44:21] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[07:44:21] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[07:44:21] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[07:44:21] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[07:44:21] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[07:44:21] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[07:44:21] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[07:44:21] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[07:44:21] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[07:44:21] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[07:44:21] =============== [PASSED] drm_test_fb_memcpy ================
[07:44:21] ============= [PASSED] drm_format_helper_test ==============
[07:44:21] ================= drm_format (18 subtests) =================
[07:44:21] [PASSED] drm_test_format_block_width_invalid
[07:44:21] [PASSED] drm_test_format_block_width_one_plane
[07:44:21] [PASSED] drm_test_format_block_width_two_plane
[07:44:21] [PASSED] drm_test_format_block_width_three_plane
[07:44:21] [PASSED] drm_test_format_block_width_tiled
[07:44:21] [PASSED] drm_test_format_block_height_invalid
[07:44:21] [PASSED] drm_test_format_block_height_one_plane
[07:44:21] [PASSED] drm_test_format_block_height_two_plane
[07:44:21] [PASSED] drm_test_format_block_height_three_plane
[07:44:21] [PASSED] drm_test_format_block_height_tiled
[07:44:21] [PASSED] drm_test_format_min_pitch_invalid
[07:44:21] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[07:44:21] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[07:44:21] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[07:44:21] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[07:44:21] [PASSED] drm_test_format_min_pitch_two_plane
[07:44:21] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[07:44:21] [PASSED] drm_test_format_min_pitch_tiled
[07:44:21] =================== [PASSED] drm_format ====================
[07:44:21] ============== drm_framebuffer (10 subtests) ===============
[07:44:21] ========== drm_test_framebuffer_check_src_coords  ==========
[07:44:21] [PASSED] Success: source fits into fb
[07:44:21] [PASSED] Fail: overflowing fb with x-axis coordinate
[07:44:21] [PASSED] Fail: overflowing fb with y-axis coordinate
[07:44:21] [PASSED] Fail: overflowing fb with source width
[07:44:21] [PASSED] Fail: overflowing fb with source height
[07:44:21] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[07:44:21] [PASSED] drm_test_framebuffer_cleanup
[07:44:21] =============== drm_test_framebuffer_create  ===============
[07:44:21] [PASSED] ABGR8888 normal sizes
[07:44:21] [PASSED] ABGR8888 max sizes
[07:44:21] [PASSED] ABGR8888 pitch greater than min required
[07:44:21] [PASSED] ABGR8888 pitch less than min required
[07:44:21] [PASSED] ABGR8888 Invalid width
[07:44:21] [PASSED] ABGR8888 Invalid buffer handle
[07:44:21] [PASSED] No pixel format
[07:44:21] [PASSED] ABGR8888 Width 0
[07:44:21] [PASSED] ABGR8888 Height 0
[07:44:21] [PASSED] ABGR8888 Out of bound height * pitch combination
[07:44:21] [PASSED] ABGR8888 Large buffer offset
[07:44:21] [PASSED] ABGR8888 Buffer offset for inexistent plane
[07:44:21] [PASSED] ABGR8888 Invalid flag
[07:44:21] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[07:44:21] [PASSED] ABGR8888 Valid buffer modifier
[07:44:21] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[07:44:21] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[07:44:21] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[07:44:21] [PASSED] NV12 Normal sizes
[07:44:21] [PASSED] NV12 Max sizes
[07:44:21] [PASSED] NV12 Invalid pitch
[07:44:21] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[07:44:21] [PASSED] NV12 different  modifier per-plane
[07:44:21] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[07:44:21] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[07:44:21] [PASSED] NV12 Modifier for inexistent plane
[07:44:21] [PASSED] NV12 Handle for inexistent plane
[07:44:21] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[07:44:21] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[07:44:21] [PASSED] YVU420 Normal sizes
[07:44:21] [PASSED] YVU420 Max sizes
[07:44:21] [PASSED] YVU420 Invalid pitch
[07:44:21] [PASSED] YVU420 Different pitches
[07:44:21] [PASSED] YVU420 Different buffer offsets/pitches
[07:44:21] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[07:44:21] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[07:44:21] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[07:44:21] [PASSED] YVU420 Valid modifier
[07:44:21] [PASSED] YVU420 Different modifiers per plane
[07:44:21] [PASSED] YVU420 Modifier for inexistent plane
[07:44:21] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[07:44:21] [PASSED] X0L2 Normal sizes
[07:44:21] [PASSED] X0L2 Max sizes
[07:44:21] [PASSED] X0L2 Invalid pitch
[07:44:21] [PASSED] X0L2 Pitch greater than minimum required
[07:44:21] [PASSED] X0L2 Handle for inexistent plane
[07:44:21] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[07:44:21] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[07:44:21] [PASSED] X0L2 Valid modifier
[07:44:21] [PASSED] X0L2 Modifier for inexistent plane
[07:44:21] =========== [PASSED] drm_test_framebuffer_create ===========
[07:44:21] [PASSED] drm_test_framebuffer_free
[07:44:21] [PASSED] drm_test_framebuffer_init
[07:44:21] [PASSED] drm_test_framebuffer_init_bad_format
[07:44:21] [PASSED] drm_test_framebuffer_init_dev_mismatch
[07:44:21] [PASSED] drm_test_framebuffer_lookup
[07:44:21] [PASSED] drm_test_framebuffer_lookup_inexistent
[07:44:21] [PASSED] drm_test_framebuffer_modifiers_not_supported
[07:44:21] ================= [PASSED] drm_framebuffer =================
[07:44:21] ================ drm_gem_shmem (8 subtests) ================
[07:44:21] [PASSED] drm_gem_shmem_test_obj_create
[07:44:21] [PASSED] drm_gem_shmem_test_obj_create_private
[07:44:21] [PASSED] drm_gem_shmem_test_pin_pages
[07:44:21] [PASSED] drm_gem_shmem_test_vmap
[07:44:21] [PASSED] drm_gem_shmem_test_get_pages_sgt
[07:44:21] [PASSED] drm_gem_shmem_test_get_sg_table
[07:44:21] [PASSED] drm_gem_shmem_test_madvise
[07:44:21] [PASSED] drm_gem_shmem_test_purge
[07:44:21] ================== [PASSED] drm_gem_shmem ==================
[07:44:21] === drm_atomic_helper_connector_hdmi_check (23 subtests) ===
[07:44:21] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[07:44:21] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[07:44:21] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[07:44:21] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[07:44:21] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[07:44:21] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[07:44:21] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[07:44:21] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[07:44:21] [PASSED] drm_test_check_disable_connector
[07:44:21] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[07:44:21] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[07:44:21] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[07:44:21] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[07:44:21] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[07:44:21] [PASSED] drm_test_check_output_bpc_dvi
[07:44:21] [PASSED] drm_test_check_output_bpc_format_vic_1
[07:44:21] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[07:44:21] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[07:44:21] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[07:44:21] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[07:44:21] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[07:44:21] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[07:44:21] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[07:44:21] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[07:44:21] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[07:44:21] [PASSED] drm_test_check_broadcast_rgb_value
[07:44:21] [PASSED] drm_test_check_bpc_8_value
[07:44:21] [PASSED] drm_test_check_bpc_10_value
[07:44:21] [PASSED] drm_test_check_bpc_12_value
[07:44:21] [PASSED] drm_test_check_format_value
[07:44:21] [PASSED] drm_test_check_tmds_char_value
[07:44:21] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[07:44:21] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[07:44:21] [PASSED] drm_test_check_mode_valid
[07:44:21] [PASSED] drm_test_check_mode_valid_reject
[07:44:21] [PASSED] drm_test_check_mode_valid_reject_rate
[07:44:21] [PASSED] drm_test_check_mode_valid_reject_max_clock
[07:44:21] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[07:44:21] ================= drm_managed (2 subtests) =================
[07:44:21] [PASSED] drm_test_managed_release_action
[07:44:21] [PASSED] drm_test_managed_run_action
[07:44:21] =================== [PASSED] drm_managed ===================
[07:44:21] =================== drm_mm (6 subtests) ====================
[07:44:21] [PASSED] drm_test_mm_init
[07:44:21] [PASSED] drm_test_mm_debug
[07:44:21] [PASSED] drm_test_mm_align32
[07:44:21] [PASSED] drm_test_mm_align64
[07:44:21] [PASSED] drm_test_mm_lowest
[07:44:21] [PASSED] drm_test_mm_highest
[07:44:21] ===================== [PASSED] drm_mm ======================
[07:44:21] ============= drm_modes_analog_tv (5 subtests) =============
[07:44:21] [PASSED] drm_test_modes_analog_tv_mono_576i
[07:44:21] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[07:44:21] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[07:44:21] [PASSED] drm_test_modes_analog_tv_pal_576i
[07:44:21] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[07:44:21] =============== [PASSED] drm_modes_analog_tv ===============
[07:44:21] ============== drm_plane_helper (2 subtests) ===============
[07:44:21] =============== drm_test_check_plane_state  ================
[07:44:21] [PASSED] clipping_simple
[07:44:21] [PASSED] clipping_rotate_reflect
[07:44:21] [PASSED] positioning_simple
[07:44:21] [PASSED] upscaling
[07:44:21] [PASSED] downscaling
[07:44:21] [PASSED] rounding1
[07:44:21] [PASSED] rounding2
[07:44:21] [PASSED] rounding3
[07:44:21] [PASSED] rounding4
[07:44:21] =========== [PASSED] drm_test_check_plane_state ============
[07:44:21] =========== drm_test_check_invalid_plane_state  ============
[07:44:21] [PASSED] positioning_invalid
[07:44:21] [PASSED] upscaling_invalid
[07:44:21] [PASSED] downscaling_invalid
[07:44:21] ======= [PASSED] drm_test_check_invalid_plane_state ========
[07:44:21] ================ [PASSED] drm_plane_helper =================
[07:44:21] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[07:44:21] ====== drm_test_connector_helper_tv_get_modes_check  =======
[07:44:21] [PASSED] None
[07:44:21] [PASSED] PAL
[07:44:21] [PASSED] NTSC
[07:44:21] [PASSED] Both, NTSC Default
[07:44:21] [PASSED] Both, PAL Default
[07:44:21] [PASSED] Both, NTSC Default, with PAL on command-line
[07:44:21] [PASSED] Both, PAL Default, with NTSC on command-line
[07:44:21] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[07:44:21] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[07:44:21] ================== drm_rect (9 subtests) ===================
[07:44:21] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[07:44:21] [PASSED] drm_test_rect_clip_scaled_not_clipped
[07:44:21] [PASSED] drm_test_rect_clip_scaled_clipped
[07:44:21] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[07:44:21] ================= drm_test_rect_intersect  =================
[07:44:21] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[07:44:21] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[07:44:21] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[07:44:21] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[07:44:21] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[07:44:21] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[07:44:21] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[07:44:21] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[07:44:21] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[07:44:21] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[07:44:21] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[07:44:21] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[07:44:21] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[07:44:21] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[07:44:21] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[07:44:21] ============= [PASSED] drm_test_rect_intersect =============
[07:44:21] ================ drm_test_rect_calc_hscale  ================
[07:44:21] [PASSED] normal use
[07:44:21] [PASSED] out of max range
[07:44:21] [PASSED] out of min range
[07:44:21] [PASSED] zero dst
[07:44:21] [PASSED] negative src
[07:44:21] [PASSED] negative dst
[07:44:21] ============ [PASSED] drm_test_rect_calc_hscale ============
[07:44:21] ================ drm_test_rect_calc_vscale  ================
[07:44:21] [PASSED] normal use
[07:44:21] [PASSED] out of max range
[07:44:21] [PASSED] out of min range
[07:44:21] [PASSED] zero dst
[07:44:21] [PASSED] negative src
[07:44:21] [PASSED] negative dst
stty: 'standard input': Inappropriate ioctl for device
[07:44:21] ============ [PASSED] drm_test_rect_calc_vscale ============
[07:44:21] ================== drm_test_rect_rotate  ===================
[07:44:21] [PASSED] reflect-x
[07:44:21] [PASSED] reflect-y
[07:44:21] [PASSED] rotate-0
[07:44:21] [PASSED] rotate-90
[07:44:21] [PASSED] rotate-180
[07:44:21] [PASSED] rotate-270
[07:44:21] ============== [PASSED] drm_test_rect_rotate ===============
[07:44:21] ================ drm_test_rect_rotate_inv  =================
[07:44:21] [PASSED] reflect-x
[07:44:21] [PASSED] reflect-y
[07:44:21] [PASSED] rotate-0
[07:44:21] [PASSED] rotate-90
[07:44:21] [PASSED] rotate-180
[07:44:21] [PASSED] rotate-270
[07:44:21] ============ [PASSED] drm_test_rect_rotate_inv =============
[07:44:21] ==================== [PASSED] drm_rect =====================
[07:44:21] ============================================================
[07:44:21] Testing complete. Ran 602 tests: passed: 602
[07:44:21] Elapsed time: 22.714s total, 1.639s configuring, 20.905s building, 0.136s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[07:44:21] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:44:23] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
[07:44:31] Starting KUnit Kernel (1/1)...
[07:44:31] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[07:44:31] ================= ttm_device (5 subtests) ==================
[07:44:31] [PASSED] ttm_device_init_basic
[07:44:31] [PASSED] ttm_device_init_multiple
[07:44:31] [PASSED] ttm_device_fini_basic
[07:44:31] [PASSED] ttm_device_init_no_vma_man
[07:44:31] ================== ttm_device_init_pools  ==================
[07:44:31] [PASSED] No DMA allocations, no DMA32 required
[07:44:31] [PASSED] DMA allocations, DMA32 required
[07:44:31] [PASSED] No DMA allocations, DMA32 required
[07:44:31] [PASSED] DMA allocations, no DMA32 required
[07:44:31] ============== [PASSED] ttm_device_init_pools ==============
[07:44:31] =================== [PASSED] ttm_device ====================
[07:44:31] ================== ttm_pool (8 subtests) ===================
[07:44:31] ================== ttm_pool_alloc_basic  ===================
[07:44:31] [PASSED] One page
[07:44:31] [PASSED] More than one page
[07:44:31] [PASSED] Above the allocation limit
[07:44:31] [PASSED] One page, with coherent DMA mappings enabled
[07:44:31] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[07:44:31] ============== [PASSED] ttm_pool_alloc_basic ===============
[07:44:31] ============== ttm_pool_alloc_basic_dma_addr  ==============
[07:44:31] [PASSED] One page
[07:44:31] [PASSED] More than one page
[07:44:31] [PASSED] Above the allocation limit
[07:44:31] [PASSED] One page, with coherent DMA mappings enabled
[07:44:31] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[07:44:31] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[07:44:31] [PASSED] ttm_pool_alloc_order_caching_match
[07:44:31] [PASSED] ttm_pool_alloc_caching_mismatch
[07:44:31] [PASSED] ttm_pool_alloc_order_mismatch
[07:44:31] [PASSED] ttm_pool_free_dma_alloc
[07:44:31] [PASSED] ttm_pool_free_no_dma_alloc
[07:44:31] [PASSED] ttm_pool_fini_basic
[07:44:31] ==================== [PASSED] ttm_pool =====================
[07:44:31] ================ ttm_resource (8 subtests) =================
[07:44:31] ================= ttm_resource_init_basic  =================
[07:44:31] [PASSED] Init resource in TTM_PL_SYSTEM
[07:44:31] [PASSED] Init resource in TTM_PL_VRAM
[07:44:31] [PASSED] Init resource in a private placement
[07:44:31] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[07:44:31] ============= [PASSED] ttm_resource_init_basic =============
[07:44:31] [PASSED] ttm_resource_init_pinned
[07:44:31] [PASSED] ttm_resource_fini_basic
[07:44:31] [PASSED] ttm_resource_manager_init_basic
[07:44:31] [PASSED] ttm_resource_manager_usage_basic
[07:44:31] [PASSED] ttm_resource_manager_set_used_basic
[07:44:31] [PASSED] ttm_sys_man_alloc_basic
[07:44:31] [PASSED] ttm_sys_man_free_basic
[07:44:31] ================== [PASSED] ttm_resource ===================
[07:44:31] =================== ttm_tt (15 subtests) ===================
[07:44:31] ==================== ttm_tt_init_basic  ====================
[07:44:31] [PASSED] Page-aligned size
[07:44:31] [PASSED] Extra pages requested
[07:44:31] ================ [PASSED] ttm_tt_init_basic ================
[07:44:31] [PASSED] ttm_tt_init_misaligned
[07:44:31] [PASSED] ttm_tt_fini_basic
[07:44:31] [PASSED] ttm_tt_fini_sg
[07:44:31] [PASSED] ttm_tt_fini_shmem
[07:44:31] [PASSED] ttm_tt_create_basic
[07:44:31] [PASSED] ttm_tt_create_invalid_bo_type
[07:44:31] [PASSED] ttm_tt_create_ttm_exists
[07:44:31] [PASSED] ttm_tt_create_failed
[07:44:31] [PASSED] ttm_tt_destroy_basic
[07:44:31] [PASSED] ttm_tt_populate_null_ttm
[07:44:31] [PASSED] ttm_tt_populate_populated_ttm
[07:44:31] [PASSED] ttm_tt_unpopulate_basic
[07:44:31] [PASSED] ttm_tt_unpopulate_empty_ttm
[07:44:31] [PASSED] ttm_tt_swapin_basic
[07:44:31] ===================== [PASSED] ttm_tt ======================
[07:44:31] =================== ttm_bo (14 subtests) ===================
[07:44:31] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[07:44:31] [PASSED] Cannot be interrupted and sleeps
[07:44:31] [PASSED] Cannot be interrupted, locks straight away
[07:44:31] [PASSED] Can be interrupted, sleeps
[07:44:31] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[07:44:31] [PASSED] ttm_bo_reserve_locked_no_sleep
[07:44:31] [PASSED] ttm_bo_reserve_no_wait_ticket
[07:44:31] [PASSED] ttm_bo_reserve_double_resv
[07:44:31] [PASSED] ttm_bo_reserve_interrupted
[07:44:31] [PASSED] ttm_bo_reserve_deadlock
[07:44:31] [PASSED] ttm_bo_unreserve_basic
[07:44:31] [PASSED] ttm_bo_unreserve_pinned
[07:44:31] [PASSED] ttm_bo_unreserve_bulk
[07:44:31] [PASSED] ttm_bo_put_basic
[07:44:31] [PASSED] ttm_bo_put_shared_resv
[07:44:31] [PASSED] ttm_bo_pin_basic
[07:44:31] [PASSED] ttm_bo_pin_unpin_resource
[07:44:31] [PASSED] ttm_bo_multiple_pin_one_unpin
[07:44:31] ===================== [PASSED] ttm_bo ======================
[07:44:31] ============== ttm_bo_validate (22 subtests) ===============
[07:44:31] ============== ttm_bo_init_reserved_sys_man  ===============
[07:44:31] [PASSED] Buffer object for userspace
[07:44:31] [PASSED] Kernel buffer object
[07:44:31] [PASSED] Shared buffer object
[07:44:31] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[07:44:31] ============== ttm_bo_init_reserved_mock_man  ==============
[07:44:31] [PASSED] Buffer object for userspace
[07:44:31] [PASSED] Kernel buffer object
[07:44:31] [PASSED] Shared buffer object
[07:44:31] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[07:44:31] [PASSED] ttm_bo_init_reserved_resv
[07:44:31] ================== ttm_bo_validate_basic  ==================
[07:44:31] [PASSED] Buffer object for userspace
[07:44:31] [PASSED] Kernel buffer object
[07:44:31] [PASSED] Shared buffer object
[07:44:31] ============== [PASSED] ttm_bo_validate_basic ==============
[07:44:31] [PASSED] ttm_bo_validate_invalid_placement
[07:44:31] ============= ttm_bo_validate_same_placement  ==============
[07:44:31] [PASSED] System manager
[07:44:31] [PASSED] VRAM manager
[07:44:31] ========= [PASSED] ttm_bo_validate_same_placement ==========
[07:44:31] [PASSED] ttm_bo_validate_failed_alloc
[07:44:31] [PASSED] ttm_bo_validate_pinned
[07:44:31] [PASSED] ttm_bo_validate_busy_placement
[07:44:31] ================ ttm_bo_validate_multihop  =================
[07:44:31] [PASSED] Buffer object for userspace
[07:44:31] [PASSED] Kernel buffer object
[07:44:31] [PASSED] Shared buffer object
[07:44:31] ============ [PASSED] ttm_bo_validate_multihop =============
[07:44:31] ========== ttm_bo_validate_no_placement_signaled  ==========
[07:44:31] [PASSED] Buffer object in system domain, no page vector
[07:44:31] [PASSED] Buffer object in system domain with an existing page vector
[07:44:31] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[07:44:31] ======== ttm_bo_validate_no_placement_not_signaled  ========
[07:44:31] [PASSED] Buffer object for userspace
[07:44:31] [PASSED] Kernel buffer object
[07:44:31] [PASSED] Shared buffer object
[07:44:31] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[07:44:31] [PASSED] ttm_bo_validate_move_fence_signaled
[07:44:31] ========= ttm_bo_validate_move_fence_not_signaled  =========
[07:44:31] [PASSED] Waits for GPU
[07:44:31] [PASSED] Tries to lock straight away
[07:44:31] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[07:44:31] [PASSED] ttm_bo_validate_swapout
[07:44:31] [PASSED] ttm_bo_validate_happy_evict
[07:44:31] [PASSED] ttm_bo_validate_all_pinned_evict
[07:44:31] [PASSED] ttm_bo_validate_allowed_only_evict
[07:44:31] [PASSED] ttm_bo_validate_deleted_evict
[07:44:31] [PASSED] ttm_bo_validate_busy_domain_evict
[07:44:31] [PASSED] ttm_bo_validate_evict_gutting
[07:44:31] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[07:44:31] ================= [PASSED] ttm_bo_validate =================
[07:44:31] ============================================================
[07:44:31] Testing complete. Ran 102 tests: passed: 102
[07:44:31] Elapsed time: 9.998s total, 1.691s configuring, 7.640s building, 0.575s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


