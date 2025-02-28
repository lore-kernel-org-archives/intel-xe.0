Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A2AC19776
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 05:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD3A10EC04;
	Fri, 28 Feb 2025 05:42:59 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C8010EC04;
 Fri, 28 Feb 2025 05:42:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/i915/vdsc=3A_Use_the_DSC_c?=
 =?utf-8?q?onfig_tables_for_DSI_panels_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Feb 2025 05:42:57 -0000
Message-ID: <174072137774.3068640.11731761751473700449@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228051041.397020-1-suraj.kandpal@intel.com>
In-Reply-To: <20250228051041.397020-1-suraj.kandpal@intel.com>
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

Series: drm/i915/vdsc: Use the DSC config tables for DSI panels (rev4)
URL   : https://patchwork.freedesktop.org/series/145560/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[05:41:52] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:41:56] Building KUnit Kernel ...
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

[05:42:22] Starting KUnit Kernel (1/1)...
[05:42:22] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:42:22] ================== guc_buf (11 subtests) ===================
[05:42:22] [PASSED] test_smallest
[05:42:22] [PASSED] test_largest
[05:42:22] [PASSED] test_granular
[05:42:22] [PASSED] test_unique
[05:42:22] [PASSED] test_overlap
[05:42:22] [PASSED] test_reusable
[05:42:22] [PASSED] test_too_big
[05:42:22] [PASSED] test_flush
[05:42:22] [PASSED] test_lookup
[05:42:22] [PASSED] test_data
[05:42:22] [PASSED] test_class
[05:42:22] ===================== [PASSED] guc_buf =====================
[05:42:22] =================== guc_dbm (7 subtests) ===================
[05:42:22] [PASSED] test_empty
[05:42:22] [PASSED] test_default
[05:42:22] ======================== test_size  ========================
[05:42:22] [PASSED] 4
[05:42:22] [PASSED] 8
[05:42:22] [PASSED] 32
[05:42:22] [PASSED] 256
[05:42:22] ==================== [PASSED] test_size ====================
[05:42:22] ======================= test_reuse  ========================
[05:42:22] [PASSED] 4
[05:42:22] [PASSED] 8
[05:42:22] [PASSED] 32
[05:42:22] [PASSED] 256
[05:42:22] =================== [PASSED] test_reuse ====================
[05:42:22] =================== test_range_overlap  ====================
[05:42:22] [PASSED] 4
[05:42:22] [PASSED] 8
[05:42:22] [PASSED] 32
[05:42:22] [PASSED] 256
[05:42:22] =============== [PASSED] test_range_overlap ================
[05:42:22] =================== test_range_compact  ====================
[05:42:22] [PASSED] 4
[05:42:22] [PASSED] 8
[05:42:22] [PASSED] 32
[05:42:22] [PASSED] 256
[05:42:22] =============== [PASSED] test_range_compact ================
[05:42:22] ==================== test_range_spare  =====================
[05:42:22] [PASSED] 4
[05:42:22] [PASSED] 8
[05:42:22] [PASSED] 32
[05:42:22] [PASSED] 256
[05:42:22] ================ [PASSED] test_range_spare =================
[05:42:22] ===================== [PASSED] guc_dbm =====================
[05:42:22] =================== guc_idm (6 subtests) ===================
[05:42:22] [PASSED] bad_init
[05:42:22] [PASSED] no_init
[05:42:22] [PASSED] init_fini
[05:42:22] [PASSED] check_used
[05:42:22] [PASSED] check_quota
[05:42:22] [PASSED] check_all
[05:42:22] ===================== [PASSED] guc_idm =====================
[05:42:22] ================== no_relay (3 subtests) ===================
[05:42:22] [PASSED] xe_drops_guc2pf_if_not_ready
[05:42:22] [PASSED] xe_drops_guc2vf_if_not_ready
[05:42:22] [PASSED] xe_rejects_send_if_not_ready
[05:42:22] ==================== [PASSED] no_relay =====================
[05:42:22] ================== pf_relay (14 subtests) ==================
[05:42:22] [PASSED] pf_rejects_guc2pf_too_short
[05:42:22] [PASSED] pf_rejects_guc2pf_too_long
[05:42:22] [PASSED] pf_rejects_guc2pf_no_payload
[05:42:22] [PASSED] pf_fails_no_payload
[05:42:22] [PASSED] pf_fails_bad_origin
[05:42:22] [PASSED] pf_fails_bad_type
[05:42:22] [PASSED] pf_txn_reports_error
[05:42:22] [PASSED] pf_txn_sends_pf2guc
[05:42:22] [PASSED] pf_sends_pf2guc
[05:42:22] [SKIPPED] pf_loopback_nop
[05:42:22] [SKIPPED] pf_loopback_echo
[05:42:22] [SKIPPED] pf_loopback_fail
[05:42:22] [SKIPPED] pf_loopback_busy
[05:42:22] [SKIPPED] pf_loopback_retry
[05:42:22] ==================== [PASSED] pf_relay =====================
[05:42:22] ================== vf_relay (3 subtests) ===================
[05:42:22] [PASSED] vf_rejects_guc2vf_too_short
[05:42:22] [PASSED] vf_rejects_guc2vf_too_long
[05:42:22] [PASSED] vf_rejects_guc2vf_no_payload
[05:42:22] ==================== [PASSED] vf_relay =====================
[05:42:22] ================= pf_service (11 subtests) =================
[05:42:22] [PASSED] pf_negotiate_any
[05:42:22] [PASSED] pf_negotiate_base_match
[05:42:22] [PASSED] pf_negotiate_base_newer
[05:42:22] [PASSED] pf_negotiate_base_next
[05:42:22] [SKIPPED] pf_negotiate_base_older
[05:42:22] [PASSED] pf_negotiate_base_prev
[05:42:22] [PASSED] pf_negotiate_latest_match
[05:42:22] [PASSED] pf_negotiate_latest_newer
[05:42:22] [PASSED] pf_negotiate_latest_next
[05:42:22] [SKIPPED] pf_negotiate_latest_older
[05:42:22] [SKIPPED] pf_negotiate_latest_prev
[05:42:22] =================== [PASSED] pf_service ====================
[05:42:22] ===================== lmtt (1 subtest) =====================
[05:42:22] ======================== test_ops  =========================
[05:42:22] [PASSED] 2-level
[05:42:22] [PASSED] multi-level
[05:42:22] ==================== [PASSED] test_ops =====================
[05:42:22] ====================== [PASSED] lmtt =======================
[05:42:22] =================== xe_mocs (2 subtests) ===================
[05:42:22] ================ xe_live_mocs_kernel_kunit  ================
[05:42:22] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[05:42:22] ================ xe_live_mocs_reset_kunit  =================
[05:42:22] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[05:42:22] ==================== [SKIPPED] xe_mocs =====================
[05:42:22] ================= xe_migrate (2 subtests) ==================
[05:42:22] ================= xe_migrate_sanity_kunit  =================
[05:42:22] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[05:42:22] ================== xe_validate_ccs_kunit  ==================
[05:42:22] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[05:42:22] =================== [SKIPPED] xe_migrate ===================
[05:42:22] ================== xe_dma_buf (1 subtest) ==================
[05:42:22] ==================== xe_dma_buf_kunit  =====================
[05:42:22] ================ [SKIPPED] xe_dma_buf_kunit ================
[05:42:22] =================== [SKIPPED] xe_dma_buf ===================
[05:42:22] ================= xe_bo_shrink (1 subtest) =================
[05:42:22] =================== xe_bo_shrink_kunit  ====================
[05:42:22] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[05:42:22] ================== [SKIPPED] xe_bo_shrink ==================
[05:42:22] ==================== xe_bo (2 subtests) ====================
[05:42:22] ================== xe_ccs_migrate_kunit  ===================
[05:42:22] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
stty: 'standard input': Inappropriate ioctl for device
[05:42:22] ==================== xe_bo_evict_kunit  ====================
[05:42:22] =============== [SKIPPED] xe_bo_evict_kunit ================
[05:42:22] ===================== [SKIPPED] xe_bo ======================
[05:42:22] ==================== args (11 subtests) ====================
[05:42:22] [PASSED] count_args_test
[05:42:22] [PASSED] call_args_example
[05:42:22] [PASSED] call_args_test
[05:42:22] [PASSED] drop_first_arg_example
[05:42:22] [PASSED] drop_first_arg_test
[05:42:22] [PASSED] first_arg_example
[05:42:22] [PASSED] first_arg_test
[05:42:22] [PASSED] last_arg_example
[05:42:22] [PASSED] last_arg_test
[05:42:22] [PASSED] pick_arg_example
[05:42:22] [PASSED] sep_comma_example
[05:42:22] ====================== [PASSED] args =======================
[05:42:22] =================== xe_pci (2 subtests) ====================
[05:42:22] [PASSED] xe_gmdid_graphics_ip
[05:42:22] [PASSED] xe_gmdid_media_ip
[05:42:22] ===================== [PASSED] xe_pci ======================
[05:42:22] =================== xe_rtp (2 subtests) ====================
[05:42:22] =============== xe_rtp_process_to_sr_tests  ================
[05:42:22] [PASSED] coalesce-same-reg
[05:42:22] [PASSED] no-match-no-add
[05:42:22] [PASSED] match-or
[05:42:22] [PASSED] match-or-xfail
[05:42:22] [PASSED] no-match-no-add-multiple-rules
[05:42:22] [PASSED] two-regs-two-entries
[05:42:22] [PASSED] clr-one-set-other
[05:42:22] [PASSED] set-field
[05:42:22] [PASSED] conflict-duplicate
[05:42:22] [PASSED] conflict-not-disjoint
[05:42:22] [PASSED] conflict-reg-type
[05:42:22] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[05:42:22] ================== xe_rtp_process_tests  ===================
[05:42:22] [PASSED] active1
[05:42:22] [PASSED] active2
[05:42:22] [PASSED] active-inactive
[05:42:22] [PASSED] inactive-active
[05:42:22] [PASSED] inactive-1st_or_active-inactive
[05:42:22] [PASSED] inactive-2nd_or_active-inactive
[05:42:22] [PASSED] inactive-last_or_active-inactive
[05:42:22] [PASSED] inactive-no_or_active-inactive
[05:42:22] ============== [PASSED] xe_rtp_process_tests ===============
[05:42:22] ===================== [PASSED] xe_rtp ======================
[05:42:22] ==================== xe_wa (1 subtest) =====================
[05:42:22] ======================== xe_wa_gt  =========================
[05:42:22] [PASSED] TIGERLAKE (B0)
[05:42:22] [PASSED] DG1 (A0)
[05:42:22] [PASSED] DG1 (B0)
[05:42:22] [PASSED] ALDERLAKE_S (A0)
[05:42:22] [PASSED] ALDERLAKE_S (B0)
[05:42:22] [PASSED] ALDERLAKE_S (C0)
[05:42:22] [PASSED] ALDERLAKE_S (D0)
[05:42:22] [PASSED] ALDERLAKE_P (A0)
[05:42:22] [PASSED] ALDERLAKE_P (B0)
[05:42:22] [PASSED] ALDERLAKE_P (C0)
[05:42:22] [PASSED] ALDERLAKE_S_RPLS (D0)
[05:42:22] [PASSED] ALDERLAKE_P_RPLU (E0)
[05:42:22] [PASSED] DG2_G10 (C0)
[05:42:22] [PASSED] DG2_G11 (B1)
[05:42:22] [PASSED] DG2_G12 (A1)
[05:42:22] [PASSED] METEORLAKE (g:A0, m:A0)
[05:42:22] [PASSED] METEORLAKE (g:A0, m:A0)
[05:42:22] [PASSED] METEORLAKE (g:A0, m:A0)
[05:42:22] [PASSED] LUNARLAKE (g:A0, m:A0)
[05:42:22] [PASSED] LUNARLAKE (g:B0, m:A0)
[05:42:22] [PASSED] BATTLEMAGE (g:A0, m:A1)
[05:42:22] ==================== [PASSED] xe_wa_gt =====================
[05:42:22] ====================== [PASSED] xe_wa ======================
[05:42:22] ============================================================
[05:42:22] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[05:42:22] Elapsed time: 30.431s total, 4.154s configuring, 26.010s building, 0.253s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[05:42:22] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:42:24] Building KUnit Kernel ...
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

[05:42:45] Starting KUnit Kernel (1/1)...
[05:42:45] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:42:45] =========== drm_validate_clone_mode (2 subtests) ===========
[05:42:45] ============== drm_test_check_in_clone_mode  ===============
[05:42:45] [PASSED] in_clone_mode
[05:42:45] [PASSED] not_in_clone_mode
[05:42:45] ========== [PASSED] drm_test_check_in_clone_mode ===========
[05:42:45] =============== drm_test_check_valid_clones  ===============
[05:42:45] [PASSED] not_in_clone_mode
[05:42:45] [PASSED] valid_clone
[05:42:45] [PASSED] invalid_clone
[05:42:45] =========== [PASSED] drm_test_check_valid_clones ===========
[05:42:45] ============= [PASSED] drm_validate_clone_mode =============
[05:42:45] ============= drm_validate_modeset (1 subtest) =============
[05:42:45] [PASSED] drm_test_check_connector_changed_modeset
[05:42:45] ============== [PASSED] drm_validate_modeset ===============
[05:42:45] ================== drm_buddy (7 subtests) ==================
[05:42:45] [PASSED] drm_test_buddy_alloc_limit
[05:42:45] [PASSED] drm_test_buddy_alloc_optimistic
[05:42:45] [PASSED] drm_test_buddy_alloc_pessimistic
[05:42:45] [PASSED] drm_test_buddy_alloc_pathological
[05:42:45] [PASSED] drm_test_buddy_alloc_contiguous
[05:42:45] [PASSED] drm_test_buddy_alloc_clear
[05:42:45] [PASSED] drm_test_buddy_alloc_range_bias
[05:42:45] ==================== [PASSED] drm_buddy ====================
[05:42:45] ============= drm_cmdline_parser (40 subtests) =============
[05:42:45] [PASSED] drm_test_cmdline_force_d_only
[05:42:45] [PASSED] drm_test_cmdline_force_D_only_dvi
[05:42:45] [PASSED] drm_test_cmdline_force_D_only_hdmi
[05:42:45] [PASSED] drm_test_cmdline_force_D_only_not_digital
[05:42:45] [PASSED] drm_test_cmdline_force_e_only
[05:42:45] [PASSED] drm_test_cmdline_res
[05:42:45] [PASSED] drm_test_cmdline_res_vesa
[05:42:45] [PASSED] drm_test_cmdline_res_vesa_rblank
[05:42:45] [PASSED] drm_test_cmdline_res_rblank
[05:42:45] [PASSED] drm_test_cmdline_res_bpp
[05:42:45] [PASSED] drm_test_cmdline_res_refresh
[05:42:45] [PASSED] drm_test_cmdline_res_bpp_refresh
[05:42:45] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[05:42:45] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[05:42:45] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[05:42:45] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[05:42:45] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[05:42:45] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[05:42:45] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[05:42:45] [PASSED] drm_test_cmdline_res_margins_force_on
[05:42:45] [PASSED] drm_test_cmdline_res_vesa_margins
[05:42:45] [PASSED] drm_test_cmdline_name
[05:42:45] [PASSED] drm_test_cmdline_name_bpp
[05:42:45] [PASSED] drm_test_cmdline_name_option
[05:42:45] [PASSED] drm_test_cmdline_name_bpp_option
[05:42:45] [PASSED] drm_test_cmdline_rotate_0
[05:42:45] [PASSED] drm_test_cmdline_rotate_90
[05:42:45] [PASSED] drm_test_cmdline_rotate_180
[05:42:45] [PASSED] drm_test_cmdline_rotate_270
[05:42:45] [PASSED] drm_test_cmdline_hmirror
[05:42:45] [PASSED] drm_test_cmdline_vmirror
[05:42:45] [PASSED] drm_test_cmdline_margin_options
[05:42:45] [PASSED] drm_test_cmdline_multiple_options
[05:42:45] [PASSED] drm_test_cmdline_bpp_extra_and_option
[05:42:45] [PASSED] drm_test_cmdline_extra_and_option
[05:42:45] [PASSED] drm_test_cmdline_freestanding_options
[05:42:45] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[05:42:45] [PASSED] drm_test_cmdline_panel_orientation
[05:42:45] ================ drm_test_cmdline_invalid  =================
[05:42:45] [PASSED] margin_only
[05:42:45] [PASSED] interlace_only
[05:42:45] [PASSED] res_missing_x
[05:42:45] [PASSED] res_missing_y
[05:42:45] [PASSED] res_bad_y
[05:42:45] [PASSED] res_missing_y_bpp
[05:42:45] [PASSED] res_bad_bpp
[05:42:45] [PASSED] res_bad_refresh
[05:42:45] [PASSED] res_bpp_refresh_force_on_off
[05:42:45] [PASSED] res_invalid_mode
[05:42:45] [PASSED] res_bpp_wrong_place_mode
[05:42:45] [PASSED] name_bpp_refresh
[05:42:45] [PASSED] name_refresh
[05:42:45] [PASSED] name_refresh_wrong_mode
[05:42:45] [PASSED] name_refresh_invalid_mode
[05:42:45] [PASSED] rotate_multiple
[05:42:45] [PASSED] rotate_invalid_val
[05:42:45] [PASSED] rotate_truncated
[05:42:45] [PASSED] invalid_option
[05:42:45] [PASSED] invalid_tv_option
[05:42:45] [PASSED] truncated_tv_option
[05:42:45] ============ [PASSED] drm_test_cmdline_invalid =============
[05:42:45] =============== drm_test_cmdline_tv_options  ===============
[05:42:45] [PASSED] NTSC
[05:42:45] [PASSED] NTSC_443
[05:42:45] [PASSED] NTSC_J
[05:42:45] [PASSED] PAL
[05:42:45] [PASSED] PAL_M
[05:42:45] [PASSED] PAL_N
[05:42:45] [PASSED] SECAM
[05:42:45] [PASSED] MONO_525
[05:42:45] [PASSED] MONO_625
[05:42:45] =========== [PASSED] drm_test_cmdline_tv_options ===========
[05:42:45] =============== [PASSED] drm_cmdline_parser ================
[05:42:45] ========== drmm_connector_hdmi_init (20 subtests) ==========
[05:42:45] [PASSED] drm_test_connector_hdmi_init_valid
[05:42:45] [PASSED] drm_test_connector_hdmi_init_bpc_8
[05:42:45] [PASSED] drm_test_connector_hdmi_init_bpc_10
[05:42:45] [PASSED] drm_test_connector_hdmi_init_bpc_12
[05:42:45] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[05:42:45] [PASSED] drm_test_connector_hdmi_init_bpc_null
[05:42:45] [PASSED] drm_test_connector_hdmi_init_formats_empty
[05:42:45] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[05:42:45] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[05:42:45] [PASSED] supported_formats=0x9 yuv420_allowed=1
[05:42:45] [PASSED] supported_formats=0x9 yuv420_allowed=0
[05:42:45] [PASSED] supported_formats=0x3 yuv420_allowed=1
[05:42:45] [PASSED] supported_formats=0x3 yuv420_allowed=0
[05:42:45] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[05:42:45] [PASSED] drm_test_connector_hdmi_init_null_ddc
[05:42:45] [PASSED] drm_test_connector_hdmi_init_null_product
[05:42:45] [PASSED] drm_test_connector_hdmi_init_null_vendor
[05:42:45] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[05:42:45] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[05:42:45] [PASSED] drm_test_connector_hdmi_init_product_valid
[05:42:45] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[05:42:45] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[05:42:45] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[05:42:45] ========= drm_test_connector_hdmi_init_type_valid  =========
[05:42:45] [PASSED] HDMI-A
[05:42:45] [PASSED] HDMI-B
[05:42:45] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[05:42:45] ======== drm_test_connector_hdmi_init_type_invalid  ========
[05:42:45] [PASSED] Unknown
[05:42:45] [PASSED] VGA
[05:42:45] [PASSED] DVI-I
[05:42:45] [PASSED] DVI-D
[05:42:45] [PASSED] DVI-A
[05:42:45] [PASSED] Composite
[05:42:45] [PASSED] SVIDEO
[05:42:45] [PASSED] LVDS
[05:42:45] [PASSED] Component
[05:42:45] [PASSED] DIN
[05:42:45] [PASSED] DP
[05:42:45] [PASSED] TV
[05:42:45] [PASSED] eDP
[05:42:45] [PASSED] Virtual
[05:42:45] [PASSED] DSI
[05:42:45] [PASSED] DPI
[05:42:45] [PASSED] Writeback
[05:42:45] [PASSED] SPI
[05:42:45] [PASSED] USB
[05:42:45] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[05:42:45] ============ [PASSED] drmm_connector_hdmi_init =============
[05:42:45] ============= drmm_connector_init (3 subtests) =============
[05:42:45] [PASSED] drm_test_drmm_connector_init
[05:42:45] [PASSED] drm_test_drmm_connector_init_null_ddc
[05:42:45] ========= drm_test_drmm_connector_init_type_valid  =========
[05:42:45] [PASSED] Unknown
[05:42:45] [PASSED] VGA
[05:42:45] [PASSED] DVI-I
[05:42:45] [PASSED] DVI-D
[05:42:45] [PASSED] DVI-A
[05:42:45] [PASSED] Composite
[05:42:45] [PASSED] SVIDEO
[05:42:45] [PASSED] LVDS
[05:42:45] [PASSED] Component
[05:42:45] [PASSED] DIN
[05:42:45] [PASSED] DP
[05:42:45] [PASSED] HDMI-A
[05:42:45] [PASSED] HDMI-B
[05:42:45] [PASSED] TV
[05:42:45] [PASSED] eDP
[05:42:45] [PASSED] Virtual
[05:42:45] [PASSED] DSI
[05:42:45] [PASSED] DPI
[05:42:45] [PASSED] Writeback
[05:42:45] [PASSED] SPI
[05:42:45] [PASSED] USB
[05:42:45] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[05:42:45] =============== [PASSED] drmm_connector_init ===============
[05:42:45] ========= drm_connector_dynamic_init (6 subtests) ==========
[05:42:45] [PASSED] drm_test_drm_connector_dynamic_init
[05:42:45] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[05:42:45] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[05:42:45] [PASSED] drm_test_drm_connector_dynamic_init_properties
[05:42:45] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[05:42:45] [PASSED] Unknown
[05:42:45] [PASSED] VGA
[05:42:45] [PASSED] DVI-I
[05:42:45] [PASSED] DVI-D
[05:42:45] [PASSED] DVI-A
[05:42:45] [PASSED] Composite
[05:42:45] [PASSED] SVIDEO
[05:42:45] [PASSED] LVDS
[05:42:45] [PASSED] Component
[05:42:45] [PASSED] DIN
[05:42:45] [PASSED] DP
[05:42:45] [PASSED] HDMI-A
[05:42:45] [PASSED] HDMI-B
[05:42:45] [PASSED] TV
[05:42:45] [PASSED] eDP
[05:42:45] [PASSED] Virtual
[05:42:45] [PASSED] DSI
[05:42:45] [PASSED] DPI
[05:42:45] [PASSED] Writeback
[05:42:45] [PASSED] SPI
[05:42:45] [PASSED] USB
[05:42:45] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[05:42:45] ======== drm_test_drm_connector_dynamic_init_name  =========
[05:42:45] [PASSED] Unknown
[05:42:45] [PASSED] VGA
[05:42:45] [PASSED] DVI-I
[05:42:45] [PASSED] DVI-D
[05:42:45] [PASSED] DVI-A
[05:42:45] [PASSED] Composite
[05:42:45] [PASSED] SVIDEO
[05:42:45] [PASSED] LVDS
[05:42:45] [PASSED] Component
[05:42:45] [PASSED] DIN
[05:42:45] [PASSED] DP
[05:42:45] [PASSED] HDMI-A
[05:42:45] [PASSED] HDMI-B
[05:42:45] [PASSED] TV
[05:42:45] [PASSED] eDP
[05:42:45] [PASSED] Virtual
[05:42:45] [PASSED] DSI
[05:42:45] [PASSED] DPI
[05:42:45] [PASSED] Writeback
[05:42:45] [PASSED] SPI
[05:42:45] [PASSED] USB
[05:42:45] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[05:42:45] =========== [PASSED] drm_connector_dynamic_init ============
[05:42:45] ==== drm_connector_dynamic_register_early (4 subtests) =====
[05:42:45] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[05:42:45] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[05:42:45] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[05:42:45] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[05:42:45] ====== [PASSED] drm_connector_dynamic_register_early =======
[05:42:45] ======= drm_connector_dynamic_register (7 subtests) ========
[05:42:45] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[05:42:45] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[05:42:45] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[05:42:45] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[05:42:45] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[05:42:45] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[05:42:45] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[05:42:45] ========= [PASSED] drm_connector_dynamic_register ==========
[05:42:45] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[05:42:45] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[05:42:45] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[05:42:45] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[05:42:45] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[05:42:45] ========== drm_test_get_tv_mode_from_name_valid  ===========
[05:42:45] [PASSED] NTSC
[05:42:45] [PASSED] NTSC-443
[05:42:45] [PASSED] NTSC-J
[05:42:45] [PASSED] PAL
[05:42:45] [PASSED] PAL-M
[05:42:45] [PASSED] PAL-N
[05:42:45] [PASSED] SECAM
[05:42:45] [PASSED] Mono
[05:42:45] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[05:42:45] [PASSED] drm_test_get_tv_mode_from_name_truncated
[05:42:45] ============ [PASSED] drm_get_tv_mode_from_name ============
[05:42:45] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[05:42:45] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[05:42:45] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[05:42:45] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[05:42:45] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[05:42:45] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[05:42:45] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[05:42:45] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[05:42:45] [PASSED] VIC 96
[05:42:45] [PASSED] VIC 97
[05:42:45] [PASSED] VIC 101
[05:42:45] [PASSED] VIC 102
[05:42:45] [PASSED] VIC 106
[05:42:45] [PASSED] VIC 107
[05:42:45] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[05:42:45] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[05:42:45] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[05:42:45] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[05:42:45] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[05:42:45] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[05:42:45] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[05:42:45] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[05:42:45] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[05:42:45] [PASSED] Automatic
[05:42:45] [PASSED] Full
[05:42:45] [PASSED] Limited 16:235
[05:42:45] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[05:42:45] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[05:42:45] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[05:42:45] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[05:42:45] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[05:42:45] [PASSED] RGB
[05:42:45] [PASSED] YUV 4:2:0
[05:42:45] [PASSED] YUV 4:2:2
[05:42:45] [PASSED] YUV 4:4:4
[05:42:45] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[05:42:45] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[05:42:45] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[05:42:45] ============= drm_damage_helper (21 subtests) ==============
[05:42:45] [PASSED] drm_test_damage_iter_no_damage
[05:42:45] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[05:42:45] [PASSED] drm_test_damage_iter_no_damage_src_moved
[05:42:45] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[05:42:45] [PASSED] drm_test_damage_iter_no_damage_not_visible
[05:42:45] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[05:42:45] [PASSED] drm_test_damage_iter_no_damage_no_fb
[05:42:45] [PASSED] drm_test_damage_iter_simple_damage
[05:42:45] [PASSED] drm_test_damage_iter_single_damage
[05:42:45] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[05:42:45] [PASSED] drm_test_damage_iter_single_damage_outside_src
[05:42:45] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[05:42:45] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[05:42:45] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[05:42:45] [PASSED] drm_test_damage_iter_single_damage_src_moved
[05:42:45] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[05:42:45] [PASSED] drm_test_damage_iter_damage
[05:42:45] [PASSED] drm_test_damage_iter_damage_one_intersect
[05:42:45] [PASSED] drm_test_damage_iter_damage_one_outside
[05:42:45] [PASSED] drm_test_damage_iter_damage_src_moved
[05:42:45] [PASSED] drm_test_damage_iter_damage_not_visible
[05:42:45] ================ [PASSED] drm_damage_helper ================
[05:42:45] ============== drm_dp_mst_helper (3 subtests) ==============
[05:42:45] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[05:42:45] [PASSED] Clock 154000 BPP 30 DSC disabled
[05:42:45] [PASSED] Clock 234000 BPP 30 DSC disabled
[05:42:45] [PASSED] Clock 297000 BPP 24 DSC disabled
[05:42:45] [PASSED] Clock 332880 BPP 24 DSC enabled
[05:42:45] [PASSED] Clock 324540 BPP 24 DSC enabled
[05:42:45] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[05:42:45] ============== drm_test_dp_mst_calc_pbn_div  ===============
[05:42:45] [PASSED] Link rate 2000000 lane count 4
[05:42:45] [PASSED] Link rate 2000000 lane count 2
[05:42:45] [PASSED] Link rate 2000000 lane count 1
[05:42:45] [PASSED] Link rate 1350000 lane count 4
[05:42:45] [PASSED] Link rate 1350000 lane count 2
[05:42:45] [PASSED] Link rate 1350000 lane count 1
[05:42:45] [PASSED] Link rate 1000000 lane count 4
[05:42:45] [PASSED] Link rate 1000000 lane count 2
[05:42:45] [PASSED] Link rate 1000000 lane count 1
[05:42:45] [PASSED] Link rate 810000 lane count 4
[05:42:45] [PASSED] Link rate 810000 lane count 2
[05:42:45] [PASSED] Link rate 810000 lane count 1
[05:42:45] [PASSED] Link rate 540000 lane count 4
[05:42:45] [PASSED] Link rate 540000 lane count 2
[05:42:45] [PASSED] Link rate 540000 lane count 1
[05:42:45] [PASSED] Link rate 270000 lane count 4
[05:42:45] [PASSED] Link rate 270000 lane count 2
[05:42:45] [PASSED] Link rate 270000 lane count 1
[05:42:45] [PASSED] Link rate 162000 lane count 4
[05:42:45] [PASSED] Link rate 162000 lane count 2
[05:42:45] [PASSED] Link rate 162000 lane count 1
[05:42:45] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[05:42:45] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[05:42:45] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[05:42:45] [PASSED] DP_POWER_UP_PHY with port number
[05:42:45] [PASSED] DP_POWER_DOWN_PHY with port number
[05:42:45] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[05:42:45] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[05:42:45] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[05:42:45] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[05:42:45] [PASSED] DP_QUERY_PAYLOAD with port number
[05:42:45] [PASSED] DP_QUERY_PAYLOAD with VCPI
[05:42:45] [PASSED] DP_REMOTE_DPCD_READ with port number
[05:42:45] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[05:42:45] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[05:42:45] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[05:42:45] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[05:42:45] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[05:42:45] [PASSED] DP_REMOTE_I2C_READ with port number
[05:42:45] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[05:42:45] [PASSED] DP_REMOTE_I2C_READ with transactions array
[05:42:45] [PASSED] DP_REMOTE_I2C_WRITE with port number
[05:42:45] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[05:42:45] [PASSED] DP_REMOTE_I2C_WRITE with data array
[05:42:45] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[05:42:45] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[05:42:45] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[05:42:45] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[05:42:45] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[05:42:45] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[05:42:45] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[05:42:45] ================ [PASSED] drm_dp_mst_helper ================
[05:42:45] ================== drm_exec (7 subtests) ===================
[05:42:45] [PASSED] sanitycheck
[05:42:45] [PASSED] test_lock
[05:42:45] [PASSED] test_lock_unlock
[05:42:45] [PASSED] test_duplicates
[05:42:45] [PASSED] test_prepare
[05:42:45] [PASSED] test_prepare_array
[05:42:45] [PASSED] test_multiple_loops
[05:42:45] ==================== [PASSED] drm_exec =====================
[05:42:45] =========== drm_format_helper_test (17 subtests) ===========
[05:42:45] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[05:42:45] [PASSED] single_pixel_source_buffer
[05:42:45] [PASSED] single_pixel_clip_rectangle
[05:42:45] [PASSED] well_known_colors
[05:42:45] [PASSED] destination_pitch
[05:42:45] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[05:42:45] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[05:42:45] [PASSED] single_pixel_source_buffer
[05:42:45] [PASSED] single_pixel_clip_rectangle
[05:42:45] [PASSED] well_known_colors
[05:42:45] [PASSED] destination_pitch
[05:42:45] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[05:42:45] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[05:42:45] [PASSED] single_pixel_source_buffer
[05:42:45] [PASSED] single_pixel_clip_rectangle
[05:42:45] [PASSED] well_known_colors
[05:42:45] [PASSED] destination_pitch
[05:42:45] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[05:42:45] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[05:42:45] [PASSED] single_pixel_source_buffer
[05:42:45] [PASSED] single_pixel_clip_rectangle
[05:42:45] [PASSED] well_known_colors
[05:42:45] [PASSED] destination_pitch
[05:42:45] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[05:42:45] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[05:42:45] [PASSED] single_pixel_source_buffer
[05:42:45] [PASSED] single_pixel_clip_rectangle
[05:42:45] [PASSED] well_known_colors
[05:42:45] [PASSED] destination_pitch
[05:42:45] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[05:42:45] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[05:42:45] [PASSED] single_pixel_source_buffer
[05:42:45] [PASSED] single_pixel_clip_rectangle
[05:42:45] [PASSED] well_known_colors
[05:42:45] [PASSED] destination_pitch
[05:42:45] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[05:42:45] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[05:42:45] [PASSED] single_pixel_source_buffer
[05:42:45] [PASSED] single_pixel_clip_rectangle
[05:42:45] [PASSED] well_known_colors
[05:42:45] [PASSED] destination_pitch
[05:42:45] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[05:42:45] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[05:42:45] [PASSED] single_pixel_source_buffer
[05:42:45] [PASSED] single_pixel_clip_rectangle
[05:42:45] [PASSED] well_known_colors
[05:42:45] [PASSED] destination_pitch
[05:42:45] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[05:42:45] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[05:42:45] [PASSED] single_pixel_source_buffer
[05:42:45] [PASSED] single_pixel_clip_rectangle
[05:42:45] [PASSED] well_known_colors
[05:42:45] [PASSED] destination_pitch
[05:42:45] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[05:42:45] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[05:42:45] [PASSED] single_pixel_source_buffer
[05:42:45] [PASSED] single_pixel_clip_rectangle
[05:42:45] [PASSED] well_known_colors
[05:42:45] [PASSED] destination_pitch
[05:42:45] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[05:42:45] ============== drm_test_fb_xrgb8888_to_mono  ===============
[05:42:45] [PASSED] single_pixel_source_buffer
[05:42:45] [PASSED] single_pixel_clip_rectangle
[05:42:45] [PASSED] well_known_colors
[05:42:45] [PASSED] destination_pitch
[05:42:45] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[05:42:45] ==================== drm_test_fb_swab  =====================
[05:42:45] [PASSED] single_pixel_source_buffer
[05:42:45] [PASSED] single_pixel_clip_rectangle
[05:42:45] [PASSED] well_known_colors
[05:42:45] [PASSED] destination_pitch
[05:42:45] ================ [PASSED] drm_test_fb_swab =================
[05:42:45] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[05:42:45] [PASSED] single_pixel_source_buffer
[05:42:45] [PASSED] single_pixel_clip_rectangle
[05:42:45] [PASSED] well_known_colors
[05:42:45] [PASSED] destination_pitch
[05:42:45] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[05:42:45] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[05:42:45] [PASSED] single_pixel_source_buffer
[05:42:45] [PASSED] single_pixel_clip_rectangle
[05:42:45] [PASSED] well_known_colors
[05:42:45] [PASSED] destination_pitch
[05:42:45] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[05:42:45] ================= drm_test_fb_clip_offset  =================
[05:42:45] [PASSED] pass through
[05:42:45] [PASSED] horizontal offset
[05:42:45] [PASSED] vertical offset
[05:42:45] [PASSED] horizontal and vertical offset
[05:42:45] [PASSED] horizontal offset (custom pitch)
[05:42:45] [PASSED] vertical offset (custom pitch)
[05:42:45] [PASSED] horizontal and vertical offset (custom pitch)
[05:42:45] ============= [PASSED] drm_test_fb_clip_offset =============
[05:42:45] ============== drm_test_fb_build_fourcc_list  ==============
[05:42:45] [PASSED] no native formats
[05:42:45] [PASSED] XRGB8888 as native format
[05:42:45] [PASSED] remove duplicates
[05:42:45] [PASSED] convert alpha formats
[05:42:45] [PASSED] random formats
[05:42:45] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[05:42:45] =================== drm_test_fb_memcpy  ====================
[05:42:45] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[05:42:45] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[05:42:45] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[05:42:45] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[05:42:45] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[05:42:45] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[05:42:45] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[05:42:45] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[05:42:45] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[05:42:45] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[05:42:45] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[05:42:45] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[05:42:45] =============== [PASSED] drm_test_fb_memcpy ================
[05:42:45] ============= [PASSED] drm_format_helper_test ==============
[05:42:45] ================= drm_format (18 subtests) =================
[05:42:45] [PASSED] drm_test_format_block_width_invalid
[05:42:45] [PASSED] drm_test_format_block_width_one_plane
[05:42:45] [PASSED] drm_test_format_block_width_two_plane
[05:42:45] [PASSED] drm_test_format_block_width_three_plane
[05:42:45] [PASSED] drm_test_format_block_width_tiled
[05:42:45] [PASSED] drm_test_format_block_height_invalid
[05:42:45] [PASSED] drm_test_format_block_height_one_plane
[05:42:45] [PASSED] drm_test_format_block_height_two_plane
[05:42:45] [PASSED] drm_test_format_block_height_three_plane
[05:42:45] [PASSED] drm_test_format_block_height_tiled
[05:42:45] [PASSED] drm_test_format_min_pitch_invalid
[05:42:45] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[05:42:45] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[05:42:45] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[05:42:45] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[05:42:45] [PASSED] drm_test_format_min_pitch_two_plane
[05:42:45] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[05:42:45] [PASSED] drm_test_format_min_pitch_tiled
[05:42:45] =================== [PASSED] drm_format ====================
[05:42:45] ============== drm_framebuffer (10 subtests) ===============
[05:42:45] ========== drm_test_framebuffer_check_src_coords  ==========
[05:42:45] [PASSED] Success: source fits into fb
[05:42:45] [PASSED] Fail: overflowing fb with x-axis coordinate
[05:42:45] [PASSED] Fail: overflowing fb with y-axis coordinate
[05:42:45] [PASSED] Fail: overflowing fb with source width
[05:42:45] [PASSED] Fail: overflowing fb with source height
[05:42:45] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[05:42:45] [PASSED] drm_test_framebuffer_cleanup
[05:42:45] =============== drm_test_framebuffer_create  ===============
[05:42:45] [PASSED] ABGR8888 normal sizes
[05:42:45] [PASSED] ABGR8888 max sizes
[05:42:45] [PASSED] ABGR8888 pitch greater than min required
[05:42:45] [PASSED] ABGR8888 pitch less than min required
[05:42:45] [PASSED] ABGR8888 Invalid width
[05:42:45] [PASSED] ABGR8888 Invalid buffer handle
[05:42:45] [PASSED] No pixel format
[05:42:45] [PASSED] ABGR8888 Width 0
[05:42:45] [PASSED] ABGR8888 Height 0
[05:42:45] [PASSED] ABGR8888 Out of bound height * pitch combination
[05:42:45] [PASSED] ABGR8888 Large buffer offset
[05:42:45] [PASSED] ABGR8888 Buffer offset for inexistent plane
[05:42:45] [PASSED] ABGR8888 Invalid flag
[05:42:45] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[05:42:45] [PASSED] ABGR8888 Valid buffer modifier
[05:42:45] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[05:42:45] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[05:42:45] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[05:42:45] [PASSED] NV12 Normal sizes
[05:42:45] [PASSED] NV12 Max sizes
[05:42:45] [PASSED] NV12 Invalid pitch
[05:42:45] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[05:42:45] [PASSED] NV12 different  modifier per-plane
[05:42:45] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[05:42:45] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[05:42:45] [PASSED] NV12 Modifier for inexistent plane
[05:42:45] [PASSED] NV12 Handle for inexistent plane
[05:42:45] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[05:42:45] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[05:42:45] [PASSED] YVU420 Normal sizes
[05:42:45] [PASSED] YVU420 Max sizes
[05:42:45] [PASSED] YVU420 Invalid pitch
[05:42:45] [PASSED] YVU420 Different pitches
[05:42:45] [PASSED] YVU420 Different buffer offsets/pitches
[05:42:45] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[05:42:45] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[05:42:45] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[05:42:45] [PASSED] YVU420 Valid modifier
[05:42:45] [PASSED] YVU420 Different modifiers per plane
[05:42:45] [PASSED] YVU420 Modifier for inexistent plane
[05:42:45] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[05:42:45] [PASSED] X0L2 Normal sizes
[05:42:45] [PASSED] X0L2 Max sizes
[05:42:45] [PASSED] X0L2 Invalid pitch
[05:42:45] [PASSED] X0L2 Pitch greater than minimum required
[05:42:45] [PASSED] X0L2 Handle for inexistent plane
[05:42:45] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[05:42:45] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[05:42:45] [PASSED] X0L2 Valid modifier
[05:42:45] [PASSED] X0L2 Modifier for inexistent plane
[05:42:45] =========== [PASSED] drm_test_framebuffer_create ===========
[05:42:45] [PASSED] drm_test_framebuffer_free
[05:42:45] [PASSED] drm_test_framebuffer_init
[05:42:45] [PASSED] drm_test_framebuffer_init_bad_format
[05:42:45] [PASSED] drm_test_framebuffer_init_dev_mismatch
[05:42:45] [PASSED] drm_test_framebuffer_lookup
[05:42:45] [PASSED] drm_test_framebuffer_lookup_inexistent
[05:42:45] [PASSED] drm_test_framebuffer_modifiers_not_supported
[05:42:45] ================= [PASSED] drm_framebuffer =================
[05:42:45] ================ drm_gem_shmem (8 subtests) ================
[05:42:45] [PASSED] drm_gem_shmem_test_obj_create
[05:42:45] [PASSED] drm_gem_shmem_test_obj_create_private
[05:42:45] [PASSED] drm_gem_shmem_test_pin_pages
[05:42:45] [PASSED] drm_gem_shmem_test_vmap
[05:42:45] [PASSED] drm_gem_shmem_test_get_pages_sgt
[05:42:45] [PASSED] drm_gem_shmem_test_get_sg_table
[05:42:45] [PASSED] drm_gem_shmem_test_madvise
[05:42:45] [PASSED] drm_gem_shmem_test_purge
[05:42:45] ================== [PASSED] drm_gem_shmem ==================
[05:42:45] === drm_atomic_helper_connector_hdmi_check (23 subtests) ===
[05:42:45] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[05:42:45] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[05:42:45] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[05:42:45] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[05:42:45] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[05:42:45] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[05:42:45] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[05:42:45] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[05:42:45] [PASSED] drm_test_check_disable_connector
[05:42:45] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[05:42:45] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[05:42:45] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[05:42:45] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[05:42:45] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[05:42:45] [PASSED] drm_test_check_output_bpc_dvi
[05:42:45] [PASSED] drm_test_check_output_bpc_format_vic_1
[05:42:45] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[05:42:45] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[05:42:45] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[05:42:45] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[05:42:45] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[05:42:45] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[05:42:45] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[05:42:45] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[05:42:45] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[05:42:45] [PASSED] drm_test_check_broadcast_rgb_value
[05:42:45] [PASSED] drm_test_check_bpc_8_value
[05:42:45] [PASSED] drm_test_check_bpc_10_value
[05:42:45] [PASSED] drm_test_check_bpc_12_value
[05:42:45] [PASSED] drm_test_check_format_value
[05:42:45] [PASSED] drm_test_check_tmds_char_value
[05:42:45] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[05:42:45] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[05:42:45] [PASSED] drm_test_check_mode_valid
[05:42:45] [PASSED] drm_test_check_mode_valid_reject
[05:42:45] [PASSED] drm_test_check_mode_valid_reject_rate
[05:42:45] [PASSED] drm_test_check_mode_valid_reject_max_clock
[05:42:45] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[05:42:45] ================= drm_managed (2 subtests) =================
[05:42:45] [PASSED] drm_test_managed_release_action
[05:42:45] [PASSED] drm_test_managed_run_action
[05:42:45] =================== [PASSED] drm_managed ===================
[05:42:45] =================== drm_mm (6 subtests) ====================
[05:42:45] [PASSED] drm_test_mm_init
[05:42:45] [PASSED] drm_test_mm_debug
[05:42:45] [PASSED] drm_test_mm_align32
[05:42:45] [PASSED] drm_test_mm_align64
[05:42:45] [PASSED] drm_test_mm_lowest
[05:42:45] [PASSED] drm_test_mm_highest
[05:42:45] ===================== [PASSED] drm_mm ======================
[05:42:45] ============= drm_modes_analog_tv (5 subtests) =============
[05:42:45] [PASSED] drm_test_modes_analog_tv_mono_576i
[05:42:45] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[05:42:45] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[05:42:45] [PASSED] drm_test_modes_analog_tv_pal_576i
[05:42:45] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[05:42:45] =============== [PASSED] drm_modes_analog_tv ===============
[05:42:45] ============== drm_plane_helper (2 subtests) ===============
[05:42:45] =============== drm_test_check_plane_state  ================
[05:42:45] [PASSED] clipping_simple
[05:42:45] [PASSED] clipping_rotate_reflect
[05:42:45] [PASSED] positioning_simple
[05:42:45] [PASSED] upscaling
[05:42:45] [PASSED] downscaling
[05:42:45] [PASSED] rounding1
[05:42:45] [PASSED] rounding2
[05:42:45] [PASSED] rounding3
[05:42:45] [PASSED] rounding4
[05:42:45] =========== [PASSED] drm_test_check_plane_state ============
[05:42:45] =========== drm_test_check_invalid_plane_state  ============
[05:42:45] [PASSED] positioning_invalid
[05:42:45] [PASSED] upscaling_invalid
[05:42:45] [PASSED] downscaling_invalid
[05:42:45] ======= [PASSED] drm_test_check_invalid_plane_state ========
[05:42:45] ================ [PASSED] drm_plane_helper =================
[05:42:45] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[05:42:45] ====== drm_test_connector_helper_tv_get_modes_check  =======
[05:42:45] [PASSED] None
[05:42:45] [PASSED] PAL
[05:42:45] [PASSED] NTSC
[05:42:45] [PASSED] Both, NTSC Default
[05:42:45] [PASSED] Both, PAL Default
[05:42:45] [PASSED] Both, NTSC Default, with PAL on command-line
[05:42:45] [PASSED] Both, PAL Default, with NTSC on command-line
[05:42:45] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[05:42:45] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[05:42:45] ================== drm_rect (9 subtests) ===================
[05:42:45] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[05:42:45] [PASSED] drm_test_rect_clip_scaled_not_clipped
[05:42:45] [PASSED] drm_test_rect_clip_scaled_clipped
[05:42:45] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[05:42:45] ================= drm_test_rect_intersect  =================
[05:42:45] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[05:42:45] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[05:42:45] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[05:42:45] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[05:42:45] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[05:42:45] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[05:42:45] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[05:42:45] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[05:42:45] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[05:42:45] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[05:42:45] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[05:42:45] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[05:42:45] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[05:42:45] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[05:42:45] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[05:42:45] ============= [PASSED] drm_test_rect_intersect =============
[05:42:45] ================ drm_test_rect_calc_hscale  ================
[05:42:45] [PASSED] normal use
[05:42:45] [PASSED] out of max range
[05:42:45] [PASSED] out of min range
[05:42:45] [PASSED] zero dst
[05:42:45] [PASSED] negative src
[05:42:45] [PASSED] negative dst
[05:42:45] ============ [PASSED] drm_test_rect_calc_hscale ============
[05:42:45] ================ drm_test_rect_calc_vscale  ================
[05:42:45] [PASSED] normal use
[05:42:45] [PASSED] out of max range
[05:42:45] [PASSED] out of min range
[05:42:45] [PASSED] zero dst
[05:42:45] [PASSED] negative src
[05:42:45] [PASSED] negative dst
[05:42:45] ============ [PASSED] drm_test_rect_calc_vscale ============
[05:42:45] ================== drm_test_rect_rotate  ===================
[05:42:45] [PASSED] reflect-x
[05:42:45] [PASSED] reflect-y
[05:42:45] [PASSED] rotate-0
[05:42:45] [PASSED] rotate-90
[05:42:45] [PASSED] rotate-180
[05:42:45] [PASSED] rotate-270
stty: 'standard input': Inappropriate ioctl for device
[05:42:45] ============== [PASSED] drm_test_rect_rotate ===============
[05:42:45] ================ drm_test_rect_rotate_inv  =================
[05:42:45] [PASSED] reflect-x
[05:42:45] [PASSED] reflect-y
[05:42:45] [PASSED] rotate-0
[05:42:45] [PASSED] rotate-90
[05:42:45] [PASSED] rotate-180
[05:42:45] [PASSED] rotate-270
[05:42:45] ============ [PASSED] drm_test_rect_rotate_inv =============
[05:42:45] ==================== [PASSED] drm_rect =====================
[05:42:45] ============================================================
[05:42:45] Testing complete. Ran 598 tests: passed: 598
[05:42:45] Elapsed time: 22.595s total, 1.624s configuring, 20.805s building, 0.146s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[05:42:45] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:42:46] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
[05:42:54] Starting KUnit Kernel (1/1)...
[05:42:54] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:42:54] ================= ttm_device (5 subtests) ==================
[05:42:54] [PASSED] ttm_device_init_basic
[05:42:54] [PASSED] ttm_device_init_multiple
[05:42:54] [PASSED] ttm_device_fini_basic
[05:42:54] [PASSED] ttm_device_init_no_vma_man
[05:42:54] ================== ttm_device_init_pools  ==================
[05:42:54] [PASSED] No DMA allocations, no DMA32 required
[05:42:54] [PASSED] DMA allocations, DMA32 required
[05:42:54] [PASSED] No DMA allocations, DMA32 required
[05:42:54] [PASSED] DMA allocations, no DMA32 required
[05:42:54] ============== [PASSED] ttm_device_init_pools ==============
[05:42:54] =================== [PASSED] ttm_device ====================
[05:42:54] ================== ttm_pool (8 subtests) ===================
[05:42:54] ================== ttm_pool_alloc_basic  ===================
[05:42:54] [PASSED] One page
[05:42:54] [PASSED] More than one page
[05:42:54] [PASSED] Above the allocation limit
[05:42:54] [PASSED] One page, with coherent DMA mappings enabled
[05:42:54] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[05:42:54] ============== [PASSED] ttm_pool_alloc_basic ===============
[05:42:54] ============== ttm_pool_alloc_basic_dma_addr  ==============
[05:42:54] [PASSED] One page
[05:42:54] [PASSED] More than one page
[05:42:54] [PASSED] Above the allocation limit
[05:42:54] [PASSED] One page, with coherent DMA mappings enabled
[05:42:54] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[05:42:54] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[05:42:54] [PASSED] ttm_pool_alloc_order_caching_match
[05:42:54] [PASSED] ttm_pool_alloc_caching_mismatch
[05:42:54] [PASSED] ttm_pool_alloc_order_mismatch
[05:42:54] [PASSED] ttm_pool_free_dma_alloc
[05:42:54] [PASSED] ttm_pool_free_no_dma_alloc
[05:42:54] [PASSED] ttm_pool_fini_basic
[05:42:54] ==================== [PASSED] ttm_pool =====================
[05:42:54] ================ ttm_resource (8 subtests) =================
[05:42:54] ================= ttm_resource_init_basic  =================
[05:42:54] [PASSED] Init resource in TTM_PL_SYSTEM
[05:42:54] [PASSED] Init resource in TTM_PL_VRAM
[05:42:54] [PASSED] Init resource in a private placement
[05:42:54] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[05:42:54] ============= [PASSED] ttm_resource_init_basic =============
[05:42:54] [PASSED] ttm_resource_init_pinned
[05:42:54] [PASSED] ttm_resource_fini_basic
[05:42:54] [PASSED] ttm_resource_manager_init_basic
[05:42:54] [PASSED] ttm_resource_manager_usage_basic
[05:42:54] [PASSED] ttm_resource_manager_set_used_basic
[05:42:54] [PASSED] ttm_sys_man_alloc_basic
[05:42:54] [PASSED] ttm_sys_man_free_basic
[05:42:54] ================== [PASSED] ttm_resource ===================
[05:42:54] =================== ttm_tt (15 subtests) ===================
[05:42:54] ==================== ttm_tt_init_basic  ====================
[05:42:54] [PASSED] Page-aligned size
[05:42:54] [PASSED] Extra pages requested
[05:42:54] ================ [PASSED] ttm_tt_init_basic ================
[05:42:54] [PASSED] ttm_tt_init_misaligned
[05:42:54] [PASSED] ttm_tt_fini_basic
[05:42:54] [PASSED] ttm_tt_fini_sg
[05:42:54] [PASSED] ttm_tt_fini_shmem
[05:42:54] [PASSED] ttm_tt_create_basic
[05:42:54] [PASSED] ttm_tt_create_invalid_bo_type
[05:42:54] [PASSED] ttm_tt_create_ttm_exists
[05:42:54] [PASSED] ttm_tt_create_failed
[05:42:54] [PASSED] ttm_tt_destroy_basic
[05:42:54] [PASSED] ttm_tt_populate_null_ttm
[05:42:54] [PASSED] ttm_tt_populate_populated_ttm
[05:42:54] [PASSED] ttm_tt_unpopulate_basic
[05:42:54] [PASSED] ttm_tt_unpopulate_empty_ttm
[05:42:54] [PASSED] ttm_tt_swapin_basic
[05:42:54] ===================== [PASSED] ttm_tt ======================
[05:42:54] =================== ttm_bo (14 subtests) ===================
[05:42:54] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[05:42:54] [PASSED] Cannot be interrupted and sleeps
[05:42:54] [PASSED] Cannot be interrupted, locks straight away
[05:42:54] [PASSED] Can be interrupted, sleeps
[05:42:54] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[05:42:54] [PASSED] ttm_bo_reserve_locked_no_sleep
[05:42:54] [PASSED] ttm_bo_reserve_no_wait_ticket
[05:42:54] [PASSED] ttm_bo_reserve_double_resv
[05:42:54] [PASSED] ttm_bo_reserve_interrupted
[05:42:54] [PASSED] ttm_bo_reserve_deadlock
[05:42:54] [PASSED] ttm_bo_unreserve_basic
[05:42:54] [PASSED] ttm_bo_unreserve_pinned
[05:42:54] [PASSED] ttm_bo_unreserve_bulk
[05:42:54] [PASSED] ttm_bo_put_basic
[05:42:54] [PASSED] ttm_bo_put_shared_resv
[05:42:54] [PASSED] ttm_bo_pin_basic
[05:42:54] [PASSED] ttm_bo_pin_unpin_resource
[05:42:54] [PASSED] ttm_bo_multiple_pin_one_unpin
[05:42:54] ===================== [PASSED] ttm_bo ======================
[05:42:54] ============== ttm_bo_validate (22 subtests) ===============
[05:42:54] ============== ttm_bo_init_reserved_sys_man  ===============
[05:42:54] [PASSED] Buffer object for userspace
[05:42:54] [PASSED] Kernel buffer object
[05:42:54] [PASSED] Shared buffer object
[05:42:54] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[05:42:54] ============== ttm_bo_init_reserved_mock_man  ==============
[05:42:54] [PASSED] Buffer object for userspace
[05:42:54] [PASSED] Kernel buffer object
[05:42:54] [PASSED] Shared buffer object
[05:42:54] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[05:42:54] [PASSED] ttm_bo_init_reserved_resv
[05:42:54] ================== ttm_bo_validate_basic  ==================
[05:42:54] [PASSED] Buffer object for userspace
[05:42:54] [PASSED] Kernel buffer object
[05:42:54] [PASSED] Shared buffer object
[05:42:54] ============== [PASSED] ttm_bo_validate_basic ==============
[05:42:54] [PASSED] ttm_bo_validate_invalid_placement
[05:42:54] ============= ttm_bo_validate_same_placement  ==============
[05:42:54] [PASSED] System manager
[05:42:54] [PASSED] VRAM manager
[05:42:54] ========= [PASSED] ttm_bo_validate_same_placement ==========
[05:42:54] [PASSED] ttm_bo_validate_failed_alloc
[05:42:54] [PASSED] ttm_bo_validate_pinned
[05:42:54] [PASSED] ttm_bo_validate_busy_placement
[05:42:54] ================ ttm_bo_validate_multihop  =================
[05:42:54] [PASSED] Buffer object for userspace
[05:42:54] [PASSED] Kernel buffer object
[05:42:54] [PASSED] Shared buffer object
[05:42:54] ============ [PASSED] ttm_bo_validate_multihop =============
[05:42:54] ========== ttm_bo_validate_no_placement_signaled  ==========
[05:42:54] [PASSED] Buffer object in system domain, no page vector
[05:42:54] [PASSED] Buffer object in system domain with an existing page vector
[05:42:54] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[05:42:54] ======== ttm_bo_validate_no_placement_not_signaled  ========
[05:42:54] [PASSED] Buffer object for userspace
[05:42:54] [PASSED] Kernel buffer object
[05:42:54] [PASSED] Shared buffer object
[05:42:54] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[05:42:54] [PASSED] ttm_bo_validate_move_fence_signaled
[05:42:54] ========= ttm_bo_validate_move_fence_not_signaled  =========
[05:42:54] [PASSED] Waits for GPU
[05:42:54] [PASSED] Tries to lock straight away
[05:42:54] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[05:42:54] [PASSED] ttm_bo_validate_swapout
[05:42:54] [PASSED] ttm_bo_validate_happy_evict
[05:42:54] [PASSED] ttm_bo_validate_all_pinned_evict
[05:42:54] [PASSED] ttm_bo_validate_allowed_only_evict
[05:42:54] [PASSED] ttm_bo_validate_deleted_evict
[05:42:54] [PASSED] ttm_bo_validate_busy_domain_evict
[05:42:54] [PASSED] ttm_bo_validate_evict_gutting
[05:42:54] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[05:42:54] ================= [PASSED] ttm_bo_validate =================
[05:42:54] ============================================================
[05:42:54] Testing complete. Ran 102 tests: passed: 102
[05:42:55] Elapsed time: 9.769s total, 1.511s configuring, 7.592s building, 0.570s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


