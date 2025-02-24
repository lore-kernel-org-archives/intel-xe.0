Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6DDC021BB
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 14:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2ECD10E3C1;
	Mon, 24 Feb 2025 14:30:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FAC210E3C0;
 Mon, 24 Feb 2025 14:30:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_cancel_pending_job_t?=
 =?utf-8?q?imer_before_freeing_scheduler?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Feb 2025 14:30:01 -0000
Message-ID: <174040740131.1620477.3733838704533822822@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224122237.576893-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250224122237.576893-1-tejas.upadhyay@intel.com>
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

Series: drm/xe: cancel pending job timer before freeing scheduler
URL   : https://patchwork.freedesktop.org/series/145308/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[14:28:55] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:28:59] Building KUnit Kernel ...
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

[14:29:25] Starting KUnit Kernel (1/1)...
[14:29:25] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[14:29:25] ================== guc_buf (11 subtests) ===================
[14:29:25] [PASSED] test_smallest
[14:29:25] [PASSED] test_largest
[14:29:25] [PASSED] test_granular
[14:29:25] [PASSED] test_unique
[14:29:25] [PASSED] test_overlap
[14:29:25] [PASSED] test_reusable
[14:29:25] [PASSED] test_too_big
[14:29:25] [PASSED] test_flush
[14:29:25] [PASSED] test_lookup
[14:29:25] [PASSED] test_data
[14:29:25] [PASSED] test_class
[14:29:25] ===================== [PASSED] guc_buf =====================
[14:29:25] =================== guc_dbm (7 subtests) ===================
[14:29:25] [PASSED] test_empty
[14:29:25] [PASSED] test_default
[14:29:25] ======================== test_size  ========================
[14:29:25] [PASSED] 4
[14:29:25] [PASSED] 8
[14:29:25] [PASSED] 32
[14:29:25] [PASSED] 256
[14:29:25] ==================== [PASSED] test_size ====================
[14:29:25] ======================= test_reuse  ========================
[14:29:25] [PASSED] 4
[14:29:25] [PASSED] 8
[14:29:25] [PASSED] 32
[14:29:25] [PASSED] 256
[14:29:25] =================== [PASSED] test_reuse ====================
[14:29:25] =================== test_range_overlap  ====================
[14:29:25] [PASSED] 4
[14:29:25] [PASSED] 8
[14:29:25] [PASSED] 32
[14:29:25] [PASSED] 256
[14:29:25] =============== [PASSED] test_range_overlap ================
[14:29:25] =================== test_range_compact  ====================
[14:29:25] [PASSED] 4
[14:29:25] [PASSED] 8
[14:29:25] [PASSED] 32
[14:29:25] [PASSED] 256
[14:29:25] =============== [PASSED] test_range_compact ================
[14:29:25] ==================== test_range_spare  =====================
[14:29:25] [PASSED] 4
[14:29:25] [PASSED] 8
[14:29:25] [PASSED] 32
[14:29:25] [PASSED] 256
[14:29:25] ================ [PASSED] test_range_spare =================
[14:29:25] ===================== [PASSED] guc_dbm =====================
[14:29:25] =================== guc_idm (6 subtests) ===================
[14:29:25] [PASSED] bad_init
[14:29:25] [PASSED] no_init
[14:29:25] [PASSED] init_fini
[14:29:25] [PASSED] check_used
[14:29:25] [PASSED] check_quota
[14:29:25] [PASSED] check_all
[14:29:25] ===================== [PASSED] guc_idm =====================
[14:29:25] ================== no_relay (3 subtests) ===================
[14:29:25] [PASSED] xe_drops_guc2pf_if_not_ready
[14:29:25] [PASSED] xe_drops_guc2vf_if_not_ready
[14:29:25] [PASSED] xe_rejects_send_if_not_ready
[14:29:25] ==================== [PASSED] no_relay =====================
[14:29:25] ================== pf_relay (14 subtests) ==================
[14:29:25] [PASSED] pf_rejects_guc2pf_too_short
[14:29:25] [PASSED] pf_rejects_guc2pf_too_long
[14:29:25] [PASSED] pf_rejects_guc2pf_no_payload
[14:29:25] [PASSED] pf_fails_no_payload
[14:29:25] [PASSED] pf_fails_bad_origin
[14:29:25] [PASSED] pf_fails_bad_type
[14:29:25] [PASSED] pf_txn_reports_error
[14:29:25] [PASSED] pf_txn_sends_pf2guc
[14:29:25] [PASSED] pf_sends_pf2guc
[14:29:25] [SKIPPED] pf_loopback_nop
[14:29:25] [SKIPPED] pf_loopback_echo
[14:29:25] [SKIPPED] pf_loopback_fail
[14:29:25] [SKIPPED] pf_loopback_busy
[14:29:25] [SKIPPED] pf_loopback_retry
[14:29:25] ==================== [PASSED] pf_relay =====================
[14:29:25] ================== vf_relay (3 subtests) ===================
[14:29:25] [PASSED] vf_rejects_guc2vf_too_short
[14:29:25] [PASSED] vf_rejects_guc2vf_too_long
[14:29:25] [PASSED] vf_rejects_guc2vf_no_payload
[14:29:25] ==================== [PASSED] vf_relay =====================
[14:29:25] ================= pf_service (11 subtests) =================
[14:29:25] [PASSED] pf_negotiate_any
[14:29:25] [PASSED] pf_negotiate_base_match
[14:29:25] [PASSED] pf_negotiate_base_newer
[14:29:25] [PASSED] pf_negotiate_base_next
[14:29:25] [SKIPPED] pf_negotiate_base_older
[14:29:25] [PASSED] pf_negotiate_base_prev
[14:29:25] [PASSED] pf_negotiate_latest_match
[14:29:25] [PASSED] pf_negotiate_latest_newer
[14:29:25] [PASSED] pf_negotiate_latest_next
[14:29:25] [SKIPPED] pf_negotiate_latest_older
[14:29:25] [SKIPPED] pf_negotiate_latest_prev
[14:29:25] =================== [PASSED] pf_service ====================
[14:29:25] ===================== lmtt (1 subtest) =====================
[14:29:25] ======================== test_ops  =========================
[14:29:25] [PASSED] 2-level
[14:29:25] [PASSED] multi-level
[14:29:25] ==================== [PASSED] test_ops =====================
[14:29:25] ====================== [PASSED] lmtt =======================
[14:29:25] =================== xe_mocs (2 subtests) ===================
[14:29:25] ================ xe_live_mocs_kernel_kunit  ================
[14:29:25] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[14:29:25] ================ xe_live_mocs_reset_kunit  =================
[14:29:25] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[14:29:25] ==================== [SKIPPED] xe_mocs =====================
[14:29:25] ================= xe_migrate (2 subtests) ==================
[14:29:25] ================= xe_migrate_sanity_kunit  =================
[14:29:25] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[14:29:25] ================== xe_validate_ccs_kunit  ==================
[14:29:25] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[14:29:25] =================== [SKIPPED] xe_migrate ===================
[14:29:25] ================== xe_dma_buf (1 subtest) ==================
[14:29:25] ==================== xe_dma_buf_kunit  =====================
[14:29:25] ================ [SKIPPED] xe_dma_buf_kunit ================
[14:29:25] =================== [SKIPPED] xe_dma_buf ===================
[14:29:25] ================= xe_bo_shrink (1 subtest) =================
[14:29:25] =================== xe_bo_shrink_kunit  ====================
[14:29:25] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[14:29:25] ================== [SKIPPED] xe_bo_shrink ==================
[14:29:25] ==================== xe_bo (2 subtests) ====================
[14:29:25] ================== xe_ccs_migrate_kunit  ===================
[14:29:25] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
stty: 'standard input': Inappropriate ioctl for device
[14:29:25] ==================== xe_bo_evict_kunit  ====================
[14:29:25] =============== [SKIPPED] xe_bo_evict_kunit ================
[14:29:25] ===================== [SKIPPED] xe_bo ======================
[14:29:25] ==================== args (11 subtests) ====================
[14:29:25] [PASSED] count_args_test
[14:29:25] [PASSED] call_args_example
[14:29:25] [PASSED] call_args_test
[14:29:25] [PASSED] drop_first_arg_example
[14:29:25] [PASSED] drop_first_arg_test
[14:29:25] [PASSED] first_arg_example
[14:29:25] [PASSED] first_arg_test
[14:29:25] [PASSED] last_arg_example
[14:29:25] [PASSED] last_arg_test
[14:29:25] [PASSED] pick_arg_example
[14:29:25] [PASSED] sep_comma_example
[14:29:25] ====================== [PASSED] args =======================
[14:29:25] =================== xe_pci (2 subtests) ====================
[14:29:25] [PASSED] xe_gmdid_graphics_ip
[14:29:25] [PASSED] xe_gmdid_media_ip
[14:29:25] ===================== [PASSED] xe_pci ======================
[14:29:25] =================== xe_rtp (2 subtests) ====================
[14:29:25] =============== xe_rtp_process_to_sr_tests  ================
[14:29:25] [PASSED] coalesce-same-reg
[14:29:25] [PASSED] no-match-no-add
[14:29:25] [PASSED] match-or
[14:29:25] [PASSED] match-or-xfail
[14:29:25] [PASSED] no-match-no-add-multiple-rules
[14:29:25] [PASSED] two-regs-two-entries
[14:29:25] [PASSED] clr-one-set-other
[14:29:25] [PASSED] set-field
[14:29:25] [PASSED] conflict-duplicate
[14:29:25] [PASSED] conflict-not-disjoint
[14:29:25] [PASSED] conflict-reg-type
[14:29:25] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[14:29:25] ================== xe_rtp_process_tests  ===================
[14:29:25] [PASSED] active1
[14:29:25] [PASSED] active2
[14:29:25] [PASSED] active-inactive
[14:29:25] [PASSED] inactive-active
[14:29:25] [PASSED] inactive-1st_or_active-inactive
[14:29:25] [PASSED] inactive-2nd_or_active-inactive
[14:29:25] [PASSED] inactive-last_or_active-inactive
[14:29:25] [PASSED] inactive-no_or_active-inactive
[14:29:25] ============== [PASSED] xe_rtp_process_tests ===============
[14:29:25] ===================== [PASSED] xe_rtp ======================
[14:29:25] ==================== xe_wa (1 subtest) =====================
[14:29:25] ======================== xe_wa_gt  =========================
[14:29:25] [PASSED] TIGERLAKE (B0)
[14:29:25] [PASSED] DG1 (A0)
[14:29:25] [PASSED] DG1 (B0)
[14:29:25] [PASSED] ALDERLAKE_S (A0)
[14:29:25] [PASSED] ALDERLAKE_S (B0)
[14:29:25] [PASSED] ALDERLAKE_S (C0)
[14:29:25] [PASSED] ALDERLAKE_S (D0)
[14:29:25] [PASSED] ALDERLAKE_P (A0)
[14:29:25] [PASSED] ALDERLAKE_P (B0)
[14:29:25] [PASSED] ALDERLAKE_P (C0)
[14:29:25] [PASSED] ALDERLAKE_S_RPLS (D0)
[14:29:25] [PASSED] ALDERLAKE_P_RPLU (E0)
[14:29:25] [PASSED] DG2_G10 (C0)
[14:29:25] [PASSED] DG2_G11 (B1)
[14:29:25] [PASSED] DG2_G12 (A1)
[14:29:25] [PASSED] METEORLAKE (g:A0, m:A0)
[14:29:25] [PASSED] METEORLAKE (g:A0, m:A0)
[14:29:25] [PASSED] METEORLAKE (g:A0, m:A0)
[14:29:25] [PASSED] LUNARLAKE (g:A0, m:A0)
[14:29:25] [PASSED] LUNARLAKE (g:B0, m:A0)
[14:29:25] [PASSED] BATTLEMAGE (g:A0, m:A1)
[14:29:25] ==================== [PASSED] xe_wa_gt =====================
[14:29:25] ====================== [PASSED] xe_wa ======================
[14:29:25] ============================================================
[14:29:25] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[14:29:25] Elapsed time: 30.477s total, 4.158s configuring, 26.053s building, 0.257s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[14:29:25] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:29:27] Building KUnit Kernel ...
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

[14:29:48] Starting KUnit Kernel (1/1)...
[14:29:48] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[14:29:48] =========== drm_validate_clone_mode (2 subtests) ===========
[14:29:48] ============== drm_test_check_in_clone_mode  ===============
[14:29:48] [PASSED] in_clone_mode
[14:29:48] [PASSED] not_in_clone_mode
[14:29:48] ========== [PASSED] drm_test_check_in_clone_mode ===========
[14:29:48] =============== drm_test_check_valid_clones  ===============
[14:29:48] [PASSED] not_in_clone_mode
[14:29:48] [PASSED] valid_clone
[14:29:48] [PASSED] invalid_clone
[14:29:48] =========== [PASSED] drm_test_check_valid_clones ===========
[14:29:48] ============= [PASSED] drm_validate_clone_mode =============
[14:29:48] ============= drm_validate_modeset (1 subtest) =============
[14:29:48] [PASSED] drm_test_check_connector_changed_modeset
[14:29:48] ============== [PASSED] drm_validate_modeset ===============
[14:29:48] ================== drm_buddy (7 subtests) ==================
[14:29:48] [PASSED] drm_test_buddy_alloc_limit
[14:29:48] [PASSED] drm_test_buddy_alloc_optimistic
[14:29:48] [PASSED] drm_test_buddy_alloc_pessimistic
[14:29:48] [PASSED] drm_test_buddy_alloc_pathological
[14:29:48] [PASSED] drm_test_buddy_alloc_contiguous
[14:29:48] [PASSED] drm_test_buddy_alloc_clear
[14:29:48] [PASSED] drm_test_buddy_alloc_range_bias
[14:29:48] ==================== [PASSED] drm_buddy ====================
[14:29:48] ============= drm_cmdline_parser (40 subtests) =============
[14:29:48] [PASSED] drm_test_cmdline_force_d_only
[14:29:48] [PASSED] drm_test_cmdline_force_D_only_dvi
[14:29:48] [PASSED] drm_test_cmdline_force_D_only_hdmi
[14:29:48] [PASSED] drm_test_cmdline_force_D_only_not_digital
[14:29:48] [PASSED] drm_test_cmdline_force_e_only
[14:29:48] [PASSED] drm_test_cmdline_res
[14:29:48] [PASSED] drm_test_cmdline_res_vesa
[14:29:48] [PASSED] drm_test_cmdline_res_vesa_rblank
[14:29:48] [PASSED] drm_test_cmdline_res_rblank
[14:29:48] [PASSED] drm_test_cmdline_res_bpp
[14:29:48] [PASSED] drm_test_cmdline_res_refresh
[14:29:48] [PASSED] drm_test_cmdline_res_bpp_refresh
[14:29:48] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[14:29:48] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[14:29:48] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[14:29:48] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[14:29:48] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[14:29:48] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[14:29:48] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[14:29:48] [PASSED] drm_test_cmdline_res_margins_force_on
[14:29:48] [PASSED] drm_test_cmdline_res_vesa_margins
[14:29:48] [PASSED] drm_test_cmdline_name
[14:29:48] [PASSED] drm_test_cmdline_name_bpp
[14:29:48] [PASSED] drm_test_cmdline_name_option
[14:29:48] [PASSED] drm_test_cmdline_name_bpp_option
[14:29:48] [PASSED] drm_test_cmdline_rotate_0
[14:29:48] [PASSED] drm_test_cmdline_rotate_90
[14:29:48] [PASSED] drm_test_cmdline_rotate_180
[14:29:48] [PASSED] drm_test_cmdline_rotate_270
[14:29:48] [PASSED] drm_test_cmdline_hmirror
[14:29:48] [PASSED] drm_test_cmdline_vmirror
[14:29:48] [PASSED] drm_test_cmdline_margin_options
[14:29:48] [PASSED] drm_test_cmdline_multiple_options
[14:29:48] [PASSED] drm_test_cmdline_bpp_extra_and_option
[14:29:48] [PASSED] drm_test_cmdline_extra_and_option
[14:29:48] [PASSED] drm_test_cmdline_freestanding_options
[14:29:48] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[14:29:48] [PASSED] drm_test_cmdline_panel_orientation
[14:29:48] ================ drm_test_cmdline_invalid  =================
[14:29:48] [PASSED] margin_only
[14:29:48] [PASSED] interlace_only
[14:29:48] [PASSED] res_missing_x
[14:29:48] [PASSED] res_missing_y
[14:29:48] [PASSED] res_bad_y
[14:29:48] [PASSED] res_missing_y_bpp
[14:29:48] [PASSED] res_bad_bpp
[14:29:48] [PASSED] res_bad_refresh
[14:29:48] [PASSED] res_bpp_refresh_force_on_off
[14:29:48] [PASSED] res_invalid_mode
[14:29:48] [PASSED] res_bpp_wrong_place_mode
[14:29:48] [PASSED] name_bpp_refresh
[14:29:48] [PASSED] name_refresh
[14:29:48] [PASSED] name_refresh_wrong_mode
[14:29:48] [PASSED] name_refresh_invalid_mode
[14:29:48] [PASSED] rotate_multiple
[14:29:48] [PASSED] rotate_invalid_val
[14:29:48] [PASSED] rotate_truncated
[14:29:48] [PASSED] invalid_option
[14:29:48] [PASSED] invalid_tv_option
[14:29:48] [PASSED] truncated_tv_option
[14:29:48] ============ [PASSED] drm_test_cmdline_invalid =============
[14:29:48] =============== drm_test_cmdline_tv_options  ===============
[14:29:48] [PASSED] NTSC
[14:29:48] [PASSED] NTSC_443
[14:29:48] [PASSED] NTSC_J
[14:29:48] [PASSED] PAL
[14:29:48] [PASSED] PAL_M
[14:29:48] [PASSED] PAL_N
[14:29:48] [PASSED] SECAM
[14:29:48] [PASSED] MONO_525
[14:29:48] [PASSED] MONO_625
[14:29:48] =========== [PASSED] drm_test_cmdline_tv_options ===========
[14:29:48] =============== [PASSED] drm_cmdline_parser ================
[14:29:48] ========== drmm_connector_hdmi_init (20 subtests) ==========
[14:29:48] [PASSED] drm_test_connector_hdmi_init_valid
[14:29:48] [PASSED] drm_test_connector_hdmi_init_bpc_8
[14:29:48] [PASSED] drm_test_connector_hdmi_init_bpc_10
[14:29:48] [PASSED] drm_test_connector_hdmi_init_bpc_12
[14:29:48] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[14:29:48] [PASSED] drm_test_connector_hdmi_init_bpc_null
[14:29:48] [PASSED] drm_test_connector_hdmi_init_formats_empty
[14:29:48] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[14:29:48] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[14:29:48] [PASSED] supported_formats=0x9 yuv420_allowed=1
[14:29:48] [PASSED] supported_formats=0x9 yuv420_allowed=0
[14:29:48] [PASSED] supported_formats=0x3 yuv420_allowed=1
[14:29:48] [PASSED] supported_formats=0x3 yuv420_allowed=0
[14:29:48] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[14:29:48] [PASSED] drm_test_connector_hdmi_init_null_ddc
[14:29:48] [PASSED] drm_test_connector_hdmi_init_null_product
[14:29:48] [PASSED] drm_test_connector_hdmi_init_null_vendor
[14:29:48] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[14:29:48] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[14:29:48] [PASSED] drm_test_connector_hdmi_init_product_valid
[14:29:48] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[14:29:48] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[14:29:48] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[14:29:48] ========= drm_test_connector_hdmi_init_type_valid  =========
[14:29:48] [PASSED] HDMI-A
[14:29:48] [PASSED] HDMI-B
[14:29:48] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[14:29:48] ======== drm_test_connector_hdmi_init_type_invalid  ========
[14:29:48] [PASSED] Unknown
[14:29:48] [PASSED] VGA
[14:29:48] [PASSED] DVI-I
[14:29:48] [PASSED] DVI-D
[14:29:48] [PASSED] DVI-A
[14:29:48] [PASSED] Composite
[14:29:48] [PASSED] SVIDEO
[14:29:48] [PASSED] LVDS
[14:29:48] [PASSED] Component
[14:29:48] [PASSED] DIN
[14:29:48] [PASSED] DP
[14:29:48] [PASSED] TV
[14:29:48] [PASSED] eDP
[14:29:48] [PASSED] Virtual
[14:29:48] [PASSED] DSI
[14:29:48] [PASSED] DPI
[14:29:48] [PASSED] Writeback
[14:29:48] [PASSED] SPI
[14:29:48] [PASSED] USB
[14:29:48] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[14:29:48] ============ [PASSED] drmm_connector_hdmi_init =============
[14:29:48] ============= drmm_connector_init (3 subtests) =============
[14:29:48] [PASSED] drm_test_drmm_connector_init
[14:29:48] [PASSED] drm_test_drmm_connector_init_null_ddc
[14:29:48] ========= drm_test_drmm_connector_init_type_valid  =========
[14:29:48] [PASSED] Unknown
[14:29:48] [PASSED] VGA
[14:29:48] [PASSED] DVI-I
[14:29:48] [PASSED] DVI-D
[14:29:48] [PASSED] DVI-A
[14:29:48] [PASSED] Composite
[14:29:48] [PASSED] SVIDEO
[14:29:48] [PASSED] LVDS
[14:29:48] [PASSED] Component
[14:29:48] [PASSED] DIN
[14:29:48] [PASSED] DP
[14:29:48] [PASSED] HDMI-A
[14:29:48] [PASSED] HDMI-B
[14:29:48] [PASSED] TV
[14:29:48] [PASSED] eDP
[14:29:48] [PASSED] Virtual
[14:29:48] [PASSED] DSI
[14:29:48] [PASSED] DPI
[14:29:48] [PASSED] Writeback
[14:29:48] [PASSED] SPI
[14:29:48] [PASSED] USB
[14:29:48] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[14:29:48] =============== [PASSED] drmm_connector_init ===============
[14:29:48] ========= drm_connector_dynamic_init (6 subtests) ==========
[14:29:48] [PASSED] drm_test_drm_connector_dynamic_init
[14:29:48] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[14:29:48] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[14:29:48] [PASSED] drm_test_drm_connector_dynamic_init_properties
[14:29:48] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[14:29:48] [PASSED] Unknown
[14:29:48] [PASSED] VGA
[14:29:48] [PASSED] DVI-I
[14:29:48] [PASSED] DVI-D
[14:29:48] [PASSED] DVI-A
[14:29:48] [PASSED] Composite
[14:29:48] [PASSED] SVIDEO
[14:29:48] [PASSED] LVDS
[14:29:48] [PASSED] Component
[14:29:48] [PASSED] DIN
[14:29:48] [PASSED] DP
[14:29:48] [PASSED] HDMI-A
[14:29:48] [PASSED] HDMI-B
[14:29:48] [PASSED] TV
[14:29:48] [PASSED] eDP
[14:29:48] [PASSED] Virtual
[14:29:48] [PASSED] DSI
[14:29:48] [PASSED] DPI
[14:29:48] [PASSED] Writeback
[14:29:48] [PASSED] SPI
[14:29:48] [PASSED] USB
[14:29:48] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[14:29:48] ======== drm_test_drm_connector_dynamic_init_name  =========
[14:29:48] [PASSED] Unknown
[14:29:48] [PASSED] VGA
[14:29:48] [PASSED] DVI-I
[14:29:48] [PASSED] DVI-D
[14:29:48] [PASSED] DVI-A
[14:29:48] [PASSED] Composite
[14:29:48] [PASSED] SVIDEO
[14:29:48] [PASSED] LVDS
[14:29:48] [PASSED] Component
[14:29:48] [PASSED] DIN
[14:29:48] [PASSED] DP
[14:29:48] [PASSED] HDMI-A
[14:29:48] [PASSED] HDMI-B
[14:29:48] [PASSED] TV
[14:29:48] [PASSED] eDP
[14:29:48] [PASSED] Virtual
[14:29:48] [PASSED] DSI
[14:29:48] [PASSED] DPI
[14:29:48] [PASSED] Writeback
[14:29:48] [PASSED] SPI
[14:29:48] [PASSED] USB
[14:29:48] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[14:29:48] =========== [PASSED] drm_connector_dynamic_init ============
[14:29:48] ==== drm_connector_dynamic_register_early (4 subtests) =====
[14:29:48] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[14:29:48] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[14:29:48] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[14:29:48] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[14:29:48] ====== [PASSED] drm_connector_dynamic_register_early =======
[14:29:48] ======= drm_connector_dynamic_register (7 subtests) ========
[14:29:48] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[14:29:48] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[14:29:48] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[14:29:48] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[14:29:48] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[14:29:48] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[14:29:48] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[14:29:48] ========= [PASSED] drm_connector_dynamic_register ==========
[14:29:48] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[14:29:48] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[14:29:48] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[14:29:48] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[14:29:48] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[14:29:48] ========== drm_test_get_tv_mode_from_name_valid  ===========
[14:29:48] [PASSED] NTSC
[14:29:48] [PASSED] NTSC-443
[14:29:48] [PASSED] NTSC-J
[14:29:48] [PASSED] PAL
[14:29:48] [PASSED] PAL-M
[14:29:48] [PASSED] PAL-N
[14:29:48] [PASSED] SECAM
[14:29:48] [PASSED] Mono
[14:29:48] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[14:29:48] [PASSED] drm_test_get_tv_mode_from_name_truncated
[14:29:48] ============ [PASSED] drm_get_tv_mode_from_name ============
[14:29:48] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[14:29:48] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[14:29:48] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[14:29:48] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[14:29:48] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[14:29:48] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[14:29:48] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[14:29:48] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[14:29:48] [PASSED] VIC 96
[14:29:48] [PASSED] VIC 97
[14:29:48] [PASSED] VIC 101
[14:29:48] [PASSED] VIC 102
[14:29:48] [PASSED] VIC 106
[14:29:48] [PASSED] VIC 107
[14:29:48] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[14:29:48] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[14:29:48] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[14:29:48] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[14:29:48] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[14:29:48] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[14:29:48] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[14:29:48] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[14:29:48] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[14:29:48] [PASSED] Automatic
[14:29:48] [PASSED] Full
[14:29:48] [PASSED] Limited 16:235
[14:29:48] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[14:29:48] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[14:29:48] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[14:29:48] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[14:29:48] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[14:29:48] [PASSED] RGB
[14:29:48] [PASSED] YUV 4:2:0
[14:29:48] [PASSED] YUV 4:2:2
[14:29:48] [PASSED] YUV 4:4:4
[14:29:48] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[14:29:48] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[14:29:48] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[14:29:48] ============= drm_damage_helper (21 subtests) ==============
[14:29:48] [PASSED] drm_test_damage_iter_no_damage
[14:29:48] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[14:29:48] [PASSED] drm_test_damage_iter_no_damage_src_moved
[14:29:48] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[14:29:48] [PASSED] drm_test_damage_iter_no_damage_not_visible
[14:29:48] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[14:29:48] [PASSED] drm_test_damage_iter_no_damage_no_fb
[14:29:48] [PASSED] drm_test_damage_iter_simple_damage
[14:29:48] [PASSED] drm_test_damage_iter_single_damage
[14:29:48] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[14:29:48] [PASSED] drm_test_damage_iter_single_damage_outside_src
[14:29:48] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[14:29:48] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[14:29:48] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[14:29:48] [PASSED] drm_test_damage_iter_single_damage_src_moved
[14:29:48] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[14:29:48] [PASSED] drm_test_damage_iter_damage
[14:29:48] [PASSED] drm_test_damage_iter_damage_one_intersect
[14:29:48] [PASSED] drm_test_damage_iter_damage_one_outside
[14:29:48] [PASSED] drm_test_damage_iter_damage_src_moved
[14:29:48] [PASSED] drm_test_damage_iter_damage_not_visible
[14:29:48] ================ [PASSED] drm_damage_helper ================
[14:29:48] ============== drm_dp_mst_helper (3 subtests) ==============
[14:29:48] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[14:29:48] [PASSED] Clock 154000 BPP 30 DSC disabled
[14:29:48] [PASSED] Clock 234000 BPP 30 DSC disabled
[14:29:48] [PASSED] Clock 297000 BPP 24 DSC disabled
[14:29:48] [PASSED] Clock 332880 BPP 24 DSC enabled
[14:29:48] [PASSED] Clock 324540 BPP 24 DSC enabled
[14:29:48] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[14:29:48] ============== drm_test_dp_mst_calc_pbn_div  ===============
[14:29:48] [PASSED] Link rate 2000000 lane count 4
[14:29:48] [PASSED] Link rate 2000000 lane count 2
[14:29:48] [PASSED] Link rate 2000000 lane count 1
[14:29:48] [PASSED] Link rate 1350000 lane count 4
[14:29:48] [PASSED] Link rate 1350000 lane count 2
[14:29:48] [PASSED] Link rate 1350000 lane count 1
[14:29:48] [PASSED] Link rate 1000000 lane count 4
[14:29:48] [PASSED] Link rate 1000000 lane count 2
[14:29:48] [PASSED] Link rate 1000000 lane count 1
[14:29:48] [PASSED] Link rate 810000 lane count 4
[14:29:48] [PASSED] Link rate 810000 lane count 2
[14:29:48] [PASSED] Link rate 810000 lane count 1
[14:29:48] [PASSED] Link rate 540000 lane count 4
[14:29:48] [PASSED] Link rate 540000 lane count 2
[14:29:48] [PASSED] Link rate 540000 lane count 1
[14:29:48] [PASSED] Link rate 270000 lane count 4
[14:29:48] [PASSED] Link rate 270000 lane count 2
[14:29:48] [PASSED] Link rate 270000 lane count 1
[14:29:48] [PASSED] Link rate 162000 lane count 4
[14:29:48] [PASSED] Link rate 162000 lane count 2
[14:29:48] [PASSED] Link rate 162000 lane count 1
[14:29:48] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[14:29:48] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[14:29:48] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[14:29:48] [PASSED] DP_POWER_UP_PHY with port number
[14:29:48] [PASSED] DP_POWER_DOWN_PHY with port number
[14:29:48] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[14:29:48] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[14:29:48] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[14:29:48] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[14:29:48] [PASSED] DP_QUERY_PAYLOAD with port number
[14:29:48] [PASSED] DP_QUERY_PAYLOAD with VCPI
[14:29:48] [PASSED] DP_REMOTE_DPCD_READ with port number
[14:29:48] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[14:29:48] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[14:29:48] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[14:29:48] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[14:29:48] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[14:29:48] [PASSED] DP_REMOTE_I2C_READ with port number
[14:29:48] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[14:29:48] [PASSED] DP_REMOTE_I2C_READ with transactions array
[14:29:48] [PASSED] DP_REMOTE_I2C_WRITE with port number
[14:29:48] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[14:29:48] [PASSED] DP_REMOTE_I2C_WRITE with data array
[14:29:48] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[14:29:48] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[14:29:48] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[14:29:48] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[14:29:48] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[14:29:48] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[14:29:48] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[14:29:48] ================ [PASSED] drm_dp_mst_helper ================
[14:29:48] ================== drm_exec (7 subtests) ===================
[14:29:48] [PASSED] sanitycheck
[14:29:48] [PASSED] test_lock
[14:29:48] [PASSED] test_lock_unlock
[14:29:48] [PASSED] test_duplicates
[14:29:48] [PASSED] test_prepare
[14:29:48] [PASSED] test_prepare_array
[14:29:48] [PASSED] test_multiple_loops
[14:29:48] ==================== [PASSED] drm_exec =====================
[14:29:48] =========== drm_format_helper_test (17 subtests) ===========
[14:29:48] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[14:29:48] [PASSED] single_pixel_source_buffer
[14:29:48] [PASSED] single_pixel_clip_rectangle
[14:29:48] [PASSED] well_known_colors
[14:29:48] [PASSED] destination_pitch
[14:29:48] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[14:29:48] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[14:29:48] [PASSED] single_pixel_source_buffer
[14:29:48] [PASSED] single_pixel_clip_rectangle
[14:29:48] [PASSED] well_known_colors
[14:29:48] [PASSED] destination_pitch
[14:29:48] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[14:29:48] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[14:29:48] [PASSED] single_pixel_source_buffer
[14:29:48] [PASSED] single_pixel_clip_rectangle
[14:29:48] [PASSED] well_known_colors
[14:29:48] [PASSED] destination_pitch
[14:29:48] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[14:29:48] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[14:29:48] [PASSED] single_pixel_source_buffer
[14:29:48] [PASSED] single_pixel_clip_rectangle
[14:29:48] [PASSED] well_known_colors
[14:29:48] [PASSED] destination_pitch
[14:29:48] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[14:29:48] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[14:29:48] [PASSED] single_pixel_source_buffer
[14:29:48] [PASSED] single_pixel_clip_rectangle
[14:29:48] [PASSED] well_known_colors
[14:29:48] [PASSED] destination_pitch
[14:29:48] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[14:29:48] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[14:29:48] [PASSED] single_pixel_source_buffer
[14:29:48] [PASSED] single_pixel_clip_rectangle
[14:29:48] [PASSED] well_known_colors
[14:29:48] [PASSED] destination_pitch
[14:29:48] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[14:29:48] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[14:29:48] [PASSED] single_pixel_source_buffer
[14:29:48] [PASSED] single_pixel_clip_rectangle
[14:29:48] [PASSED] well_known_colors
[14:29:48] [PASSED] destination_pitch
[14:29:48] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[14:29:48] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[14:29:48] [PASSED] single_pixel_source_buffer
[14:29:48] [PASSED] single_pixel_clip_rectangle
[14:29:48] [PASSED] well_known_colors
[14:29:48] [PASSED] destination_pitch
[14:29:48] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[14:29:48] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[14:29:48] [PASSED] single_pixel_source_buffer
[14:29:48] [PASSED] single_pixel_clip_rectangle
[14:29:48] [PASSED] well_known_colors
[14:29:48] [PASSED] destination_pitch
[14:29:48] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[14:29:48] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[14:29:48] [PASSED] single_pixel_source_buffer
[14:29:48] [PASSED] single_pixel_clip_rectangle
[14:29:48] [PASSED] well_known_colors
[14:29:48] [PASSED] destination_pitch
[14:29:48] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[14:29:48] ============== drm_test_fb_xrgb8888_to_mono  ===============
[14:29:48] [PASSED] single_pixel_source_buffer
[14:29:48] [PASSED] single_pixel_clip_rectangle
[14:29:48] [PASSED] well_known_colors
[14:29:48] [PASSED] destination_pitch
[14:29:48] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[14:29:48] ==================== drm_test_fb_swab  =====================
[14:29:48] [PASSED] single_pixel_source_buffer
[14:29:48] [PASSED] single_pixel_clip_rectangle
[14:29:48] [PASSED] well_known_colors
[14:29:48] [PASSED] destination_pitch
[14:29:48] ================ [PASSED] drm_test_fb_swab =================
[14:29:48] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[14:29:48] [PASSED] single_pixel_source_buffer
[14:29:48] [PASSED] single_pixel_clip_rectangle
[14:29:48] [PASSED] well_known_colors
[14:29:48] [PASSED] destination_pitch
[14:29:48] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[14:29:48] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[14:29:48] [PASSED] single_pixel_source_buffer
[14:29:48] [PASSED] single_pixel_clip_rectangle
[14:29:48] [PASSED] well_known_colors
[14:29:48] [PASSED] destination_pitch
[14:29:48] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[14:29:48] ================= drm_test_fb_clip_offset  =================
[14:29:48] [PASSED] pass through
[14:29:48] [PASSED] horizontal offset
[14:29:48] [PASSED] vertical offset
[14:29:48] [PASSED] horizontal and vertical offset
[14:29:48] [PASSED] horizontal offset (custom pitch)
[14:29:48] [PASSED] vertical offset (custom pitch)
[14:29:48] [PASSED] horizontal and vertical offset (custom pitch)
[14:29:48] ============= [PASSED] drm_test_fb_clip_offset =============
[14:29:48] ============== drm_test_fb_build_fourcc_list  ==============
[14:29:48] [PASSED] no native formats
[14:29:48] [PASSED] XRGB8888 as native format
[14:29:48] [PASSED] remove duplicates
[14:29:48] [PASSED] convert alpha formats
[14:29:48] [PASSED] random formats
[14:29:48] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[14:29:48] =================== drm_test_fb_memcpy  ====================
[14:29:48] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[14:29:48] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[14:29:48] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[14:29:48] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[14:29:48] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[14:29:48] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[14:29:48] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[14:29:48] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[14:29:48] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[14:29:48] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[14:29:48] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[14:29:48] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[14:29:48] =============== [PASSED] drm_test_fb_memcpy ================
[14:29:48] ============= [PASSED] drm_format_helper_test ==============
[14:29:48] ================= drm_format (18 subtests) =================
[14:29:48] [PASSED] drm_test_format_block_width_invalid
[14:29:48] [PASSED] drm_test_format_block_width_one_plane
[14:29:48] [PASSED] drm_test_format_block_width_two_plane
[14:29:48] [PASSED] drm_test_format_block_width_three_plane
[14:29:48] [PASSED] drm_test_format_block_width_tiled
[14:29:48] [PASSED] drm_test_format_block_height_invalid
[14:29:48] [PASSED] drm_test_format_block_height_one_plane
[14:29:48] [PASSED] drm_test_format_block_height_two_plane
[14:29:48] [PASSED] drm_test_format_block_height_three_plane
[14:29:48] [PASSED] drm_test_format_block_height_tiled
[14:29:48] [PASSED] drm_test_format_min_pitch_invalid
[14:29:48] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[14:29:48] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[14:29:48] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[14:29:48] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[14:29:48] [PASSED] drm_test_format_min_pitch_two_plane
[14:29:48] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[14:29:48] [PASSED] drm_test_format_min_pitch_tiled
[14:29:48] =================== [PASSED] drm_format ====================
[14:29:48] ============== drm_framebuffer (10 subtests) ===============
[14:29:48] ========== drm_test_framebuffer_check_src_coords  ==========
[14:29:48] [PASSED] Success: source fits into fb
[14:29:48] [PASSED] Fail: overflowing fb with x-axis coordinate
[14:29:48] [PASSED] Fail: overflowing fb with y-axis coordinate
[14:29:48] [PASSED] Fail: overflowing fb with source width
[14:29:48] [PASSED] Fail: overflowing fb with source height
[14:29:48] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[14:29:48] [PASSED] drm_test_framebuffer_cleanup
[14:29:48] =============== drm_test_framebuffer_create  ===============
[14:29:48] [PASSED] ABGR8888 normal sizes
[14:29:48] [PASSED] ABGR8888 max sizes
[14:29:48] [PASSED] ABGR8888 pitch greater than min required
[14:29:48] [PASSED] ABGR8888 pitch less than min required
[14:29:48] [PASSED] ABGR8888 Invalid width
[14:29:48] [PASSED] ABGR8888 Invalid buffer handle
[14:29:48] [PASSED] No pixel format
[14:29:48] [PASSED] ABGR8888 Width 0
[14:29:48] [PASSED] ABGR8888 Height 0
[14:29:48] [PASSED] ABGR8888 Out of bound height * pitch combination
[14:29:48] [PASSED] ABGR8888 Large buffer offset
[14:29:48] [PASSED] ABGR8888 Buffer offset for inexistent plane
[14:29:48] [PASSED] ABGR8888 Invalid flag
[14:29:48] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[14:29:48] [PASSED] ABGR8888 Valid buffer modifier
[14:29:48] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[14:29:48] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[14:29:48] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[14:29:48] [PASSED] NV12 Normal sizes
[14:29:48] [PASSED] NV12 Max sizes
[14:29:48] [PASSED] NV12 Invalid pitch
[14:29:48] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[14:29:48] [PASSED] NV12 different  modifier per-plane
[14:29:48] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[14:29:48] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[14:29:48] [PASSED] NV12 Modifier for inexistent plane
[14:29:48] [PASSED] NV12 Handle for inexistent plane
[14:29:48] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[14:29:48] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[14:29:48] [PASSED] YVU420 Normal sizes
[14:29:48] [PASSED] YVU420 Max sizes
[14:29:48] [PASSED] YVU420 Invalid pitch
[14:29:48] [PASSED] YVU420 Different pitches
[14:29:48] [PASSED] YVU420 Different buffer offsets/pitches
[14:29:48] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[14:29:48] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[14:29:48] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[14:29:48] [PASSED] YVU420 Valid modifier
[14:29:48] [PASSED] YVU420 Different modifiers per plane
[14:29:48] [PASSED] YVU420 Modifier for inexistent plane
[14:29:48] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[14:29:48] [PASSED] X0L2 Normal sizes
[14:29:48] [PASSED] X0L2 Max sizes
[14:29:48] [PASSED] X0L2 Invalid pitch
[14:29:48] [PASSED] X0L2 Pitch greater than minimum required
[14:29:48] [PASSED] X0L2 Handle for inexistent plane
[14:29:48] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[14:29:48] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[14:29:48] [PASSED] X0L2 Valid modifier
[14:29:48] [PASSED] X0L2 Modifier for inexistent plane
[14:29:48] =========== [PASSED] drm_test_framebuffer_create ===========
[14:29:48] [PASSED] drm_test_framebuffer_free
[14:29:48] [PASSED] drm_test_framebuffer_init
[14:29:48] [PASSED] drm_test_framebuffer_init_bad_format
[14:29:48] [PASSED] drm_test_framebuffer_init_dev_mismatch
[14:29:48] [PASSED] drm_test_framebuffer_lookup
[14:29:48] [PASSED] drm_test_framebuffer_lookup_inexistent
[14:29:48] [PASSED] drm_test_framebuffer_modifiers_not_supported
[14:29:48] ================= [PASSED] drm_framebuffer =================
[14:29:48] ================ drm_gem_shmem (8 subtests) ================
[14:29:48] [PASSED] drm_gem_shmem_test_obj_create
[14:29:48] [PASSED] drm_gem_shmem_test_obj_create_private
[14:29:48] [PASSED] drm_gem_shmem_test_pin_pages
[14:29:48] [PASSED] drm_gem_shmem_test_vmap
[14:29:48] [PASSED] drm_gem_shmem_test_get_pages_sgt
[14:29:48] [PASSED] drm_gem_shmem_test_get_sg_table
[14:29:48] [PASSED] drm_gem_shmem_test_madvise
[14:29:48] [PASSED] drm_gem_shmem_test_purge
[14:29:48] ================== [PASSED] drm_gem_shmem ==================
[14:29:48] === drm_atomic_helper_connector_hdmi_check (23 subtests) ===
[14:29:48] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[14:29:48] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[14:29:48] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[14:29:48] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[14:29:48] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[14:29:48] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[14:29:48] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[14:29:48] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[14:29:48] [PASSED] drm_test_check_disable_connector
[14:29:48] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[14:29:48] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[14:29:48] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[14:29:48] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[14:29:48] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[14:29:48] [PASSED] drm_test_check_output_bpc_dvi
[14:29:48] [PASSED] drm_test_check_output_bpc_format_vic_1
[14:29:48] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[14:29:48] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[14:29:48] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[14:29:48] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[14:29:48] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[14:29:48] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[14:29:48] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[14:29:48] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[14:29:48] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[14:29:48] [PASSED] drm_test_check_broadcast_rgb_value
[14:29:48] [PASSED] drm_test_check_bpc_8_value
[14:29:48] [PASSED] drm_test_check_bpc_10_value
[14:29:48] [PASSED] drm_test_check_bpc_12_value
[14:29:48] [PASSED] drm_test_check_format_value
[14:29:48] [PASSED] drm_test_check_tmds_char_value
[14:29:48] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[14:29:48] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[14:29:48] [PASSED] drm_test_check_mode_valid
[14:29:48] [PASSED] drm_test_check_mode_valid_reject
[14:29:48] [PASSED] drm_test_check_mode_valid_reject_rate
[14:29:48] [PASSED] drm_test_check_mode_valid_reject_max_clock
[14:29:48] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[14:29:48] ================= drm_managed (2 subtests) =================
[14:29:48] [PASSED] drm_test_managed_release_action
[14:29:48] [PASSED] drm_test_managed_run_action
[14:29:48] =================== [PASSED] drm_managed ===================
[14:29:48] =================== drm_mm (6 subtests) ====================
[14:29:48] [PASSED] drm_test_mm_init
[14:29:48] [PASSED] drm_test_mm_debug
[14:29:48] [PASSED] drm_test_mm_align32
[14:29:48] [PASSED] drm_test_mm_align64
[14:29:48] [PASSED] drm_test_mm_lowest
[14:29:48] [PASSED] drm_test_mm_highest
[14:29:48] ===================== [PASSED] drm_mm ======================
[14:29:48] ============= drm_modes_analog_tv (5 subtests) =============
[14:29:48] [PASSED] drm_test_modes_analog_tv_mono_576i
[14:29:48] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[14:29:48] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[14:29:48] [PASSED] drm_test_modes_analog_tv_pal_576i
[14:29:48] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[14:29:48] =============== [PASSED] drm_modes_analog_tv ===============
[14:29:48] ============== drm_plane_helper (2 subtests) ===============
[14:29:48] =============== drm_test_check_plane_state  ================
[14:29:48] [PASSED] clipping_simple
[14:29:48] [PASSED] clipping_rotate_reflect
[14:29:48] [PASSED] positioning_simple
[14:29:48] [PASSED] upscaling
[14:29:48] [PASSED] downscaling
[14:29:48] [PASSED] rounding1
[14:29:48] [PASSED] rounding2
[14:29:48] [PASSED] rounding3
[14:29:48] [PASSED] rounding4
[14:29:48] =========== [PASSED] drm_test_check_plane_state ============
[14:29:48] =========== drm_test_check_invalid_plane_state  ============
[14:29:48] [PASSED] positioning_invalid
[14:29:48] [PASSED] upscaling_invalid
[14:29:48] [PASSED] downscaling_invalid
[14:29:48] ======= [PASSED] drm_test_check_invalid_plane_state ========
[14:29:48] ================ [PASSED] drm_plane_helper =================
[14:29:48] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[14:29:48] ====== drm_test_connector_helper_tv_get_modes_check  =======
[14:29:48] [PASSED] None
[14:29:48] [PASSED] PAL
[14:29:48] [PASSED] NTSC
[14:29:48] [PASSED] Both, NTSC Default
[14:29:48] [PASSED] Both, PAL Default
[14:29:48] [PASSED] Both, NTSC Default, with PAL on command-line
[14:29:48] [PASSED] Both, PAL Default, with NTSC on command-line
[14:29:48] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[14:29:48] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[14:29:48] ================== drm_rect (9 subtests) ===================
[14:29:48] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[14:29:48] [PASSED] drm_test_rect_clip_scaled_not_clipped
[14:29:48] [PASSED] drm_test_rect_clip_scaled_clipped
[14:29:48] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[14:29:48] ================= drm_test_rect_intersect  =================
[14:29:48] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[14:29:48] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[14:29:48] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[14:29:48] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[14:29:48] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[14:29:48] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[14:29:48] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[14:29:48] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[14:29:48] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[14:29:48] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[14:29:48] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[14:29:48] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[14:29:48] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[14:29:48] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[14:29:48] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[14:29:48] ============= [PASSED] drm_test_rect_intersect =============
[14:29:48] ================ drm_test_rect_calc_hscale  ================
[14:29:48] [PASSED] normal use
[14:29:48] [PASSED] out of max range
[14:29:48] [PASSED] out of min range
[14:29:48] [PASSED] zero dst
[14:29:48] [PASSED] negative src
[14:29:48] [PASSED] negative dst
[14:29:48] ============ [PASSED] drm_test_rect_calc_hscale ============
[14:29:48] ================ drm_test_rect_calc_vscale  ================
[14:29:48] [PASSED] normal use
[14:29:48] [PASSED] out of max range
[14:29:48] [PASSED] out of min range
[14:29:48] [PASSED] zero dst
[14:29:48] [PASSED] negative src
[14:29:48] [PASSED] negative dst
[14:29:48] ============ [PASSED] drm_test_rect_calc_vscale ============
[14:29:48] ================== drm_test_rect_rotate  ===================
[14:29:48] [PASSED] reflect-x
[14:29:48] [PASSED] reflect-y
[14:29:48] [PASSED] rotate-0
[14:29:48] [PASSED] rotate-90
[14:29:48] [PASSED] rotate-180
[14:29:48] [PASSED] rotate-270
stty: 'standard input': Inappropriate ioctl for device
[14:29:48] ============== [PASSED] drm_test_rect_rotate ===============
[14:29:48] ================ drm_test_rect_rotate_inv  =================
[14:29:48] [PASSED] reflect-x
[14:29:48] [PASSED] reflect-y
[14:29:48] [PASSED] rotate-0
[14:29:48] [PASSED] rotate-90
[14:29:48] [PASSED] rotate-180
[14:29:48] [PASSED] rotate-270
[14:29:48] ============ [PASSED] drm_test_rect_rotate_inv =============
[14:29:48] ==================== [PASSED] drm_rect =====================
[14:29:48] ============================================================
[14:29:48] Testing complete. Ran 598 tests: passed: 598
[14:29:48] Elapsed time: 23.046s total, 1.611s configuring, 21.264s building, 0.152s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[14:29:49] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:29:50] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
[14:29:58] Starting KUnit Kernel (1/1)...
[14:29:58] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[14:29:58] ================= ttm_device (5 subtests) ==================
[14:29:58] [PASSED] ttm_device_init_basic
[14:29:58] [PASSED] ttm_device_init_multiple
[14:29:58] [PASSED] ttm_device_fini_basic
[14:29:58] [PASSED] ttm_device_init_no_vma_man
[14:29:58] ================== ttm_device_init_pools  ==================
[14:29:58] [PASSED] No DMA allocations, no DMA32 required
[14:29:58] [PASSED] DMA allocations, DMA32 required
[14:29:58] [PASSED] No DMA allocations, DMA32 required
[14:29:58] [PASSED] DMA allocations, no DMA32 required
[14:29:58] ============== [PASSED] ttm_device_init_pools ==============
[14:29:58] =================== [PASSED] ttm_device ====================
[14:29:58] ================== ttm_pool (8 subtests) ===================
[14:29:58] ================== ttm_pool_alloc_basic  ===================
[14:29:58] [PASSED] One page
[14:29:58] [PASSED] More than one page
[14:29:58] [PASSED] Above the allocation limit
[14:29:58] [PASSED] One page, with coherent DMA mappings enabled
[14:29:58] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[14:29:58] ============== [PASSED] ttm_pool_alloc_basic ===============
[14:29:58] ============== ttm_pool_alloc_basic_dma_addr  ==============
[14:29:58] [PASSED] One page
[14:29:58] [PASSED] More than one page
[14:29:58] [PASSED] Above the allocation limit
[14:29:58] [PASSED] One page, with coherent DMA mappings enabled
[14:29:58] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[14:29:58] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[14:29:58] [PASSED] ttm_pool_alloc_order_caching_match
[14:29:58] [PASSED] ttm_pool_alloc_caching_mismatch
[14:29:58] [PASSED] ttm_pool_alloc_order_mismatch
[14:29:58] [PASSED] ttm_pool_free_dma_alloc
[14:29:58] [PASSED] ttm_pool_free_no_dma_alloc
[14:29:58] [PASSED] ttm_pool_fini_basic
[14:29:58] ==================== [PASSED] ttm_pool =====================
[14:29:58] ================ ttm_resource (8 subtests) =================
[14:29:58] ================= ttm_resource_init_basic  =================
[14:29:58] [PASSED] Init resource in TTM_PL_SYSTEM
[14:29:58] [PASSED] Init resource in TTM_PL_VRAM
[14:29:58] [PASSED] Init resource in a private placement
[14:29:58] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[14:29:58] ============= [PASSED] ttm_resource_init_basic =============
[14:29:58] [PASSED] ttm_resource_init_pinned
[14:29:58] [PASSED] ttm_resource_fini_basic
[14:29:58] [PASSED] ttm_resource_manager_init_basic
[14:29:58] [PASSED] ttm_resource_manager_usage_basic
[14:29:58] [PASSED] ttm_resource_manager_set_used_basic
[14:29:58] [PASSED] ttm_sys_man_alloc_basic
[14:29:58] [PASSED] ttm_sys_man_free_basic
[14:29:58] ================== [PASSED] ttm_resource ===================
[14:29:58] =================== ttm_tt (15 subtests) ===================
[14:29:58] ==================== ttm_tt_init_basic  ====================
[14:29:58] [PASSED] Page-aligned size
[14:29:58] [PASSED] Extra pages requested
[14:29:58] ================ [PASSED] ttm_tt_init_basic ================
[14:29:58] [PASSED] ttm_tt_init_misaligned
[14:29:58] [PASSED] ttm_tt_fini_basic
[14:29:58] [PASSED] ttm_tt_fini_sg
[14:29:58] [PASSED] ttm_tt_fini_shmem
[14:29:58] [PASSED] ttm_tt_create_basic
[14:29:58] [PASSED] ttm_tt_create_invalid_bo_type
[14:29:58] [PASSED] ttm_tt_create_ttm_exists
[14:29:58] [PASSED] ttm_tt_create_failed
[14:29:58] [PASSED] ttm_tt_destroy_basic
[14:29:58] [PASSED] ttm_tt_populate_null_ttm
[14:29:58] [PASSED] ttm_tt_populate_populated_ttm
[14:29:58] [PASSED] ttm_tt_unpopulate_basic
[14:29:58] [PASSED] ttm_tt_unpopulate_empty_ttm
[14:29:58] [PASSED] ttm_tt_swapin_basic
[14:29:58] ===================== [PASSED] ttm_tt ======================
[14:29:58] =================== ttm_bo (14 subtests) ===================
[14:29:58] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[14:29:58] [PASSED] Cannot be interrupted and sleeps
[14:29:58] [PASSED] Cannot be interrupted, locks straight away
[14:29:58] [PASSED] Can be interrupted, sleeps
[14:29:58] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[14:29:58] [PASSED] ttm_bo_reserve_locked_no_sleep
[14:29:58] [PASSED] ttm_bo_reserve_no_wait_ticket
[14:29:58] [PASSED] ttm_bo_reserve_double_resv
[14:29:58] [PASSED] ttm_bo_reserve_interrupted
[14:29:58] [PASSED] ttm_bo_reserve_deadlock
[14:29:58] [PASSED] ttm_bo_unreserve_basic
[14:29:58] [PASSED] ttm_bo_unreserve_pinned
[14:29:58] [PASSED] ttm_bo_unreserve_bulk
[14:29:58] [PASSED] ttm_bo_put_basic
[14:29:58] [PASSED] ttm_bo_put_shared_resv
[14:29:58] [PASSED] ttm_bo_pin_basic
[14:29:58] [PASSED] ttm_bo_pin_unpin_resource
[14:29:58] [PASSED] ttm_bo_multiple_pin_one_unpin
[14:29:58] ===================== [PASSED] ttm_bo ======================
[14:29:58] ============== ttm_bo_validate (22 subtests) ===============
[14:29:58] ============== ttm_bo_init_reserved_sys_man  ===============
[14:29:58] [PASSED] Buffer object for userspace
[14:29:58] [PASSED] Kernel buffer object
[14:29:58] [PASSED] Shared buffer object
[14:29:58] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[14:29:58] ============== ttm_bo_init_reserved_mock_man  ==============
[14:29:58] [PASSED] Buffer object for userspace
[14:29:58] [PASSED] Kernel buffer object
[14:29:58] [PASSED] Shared buffer object
[14:29:58] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[14:29:58] [PASSED] ttm_bo_init_reserved_resv
[14:29:58] ================== ttm_bo_validate_basic  ==================
[14:29:58] [PASSED] Buffer object for userspace
[14:29:58] [PASSED] Kernel buffer object
[14:29:58] [PASSED] Shared buffer object
[14:29:58] ============== [PASSED] ttm_bo_validate_basic ==============
[14:29:58] [PASSED] ttm_bo_validate_invalid_placement
[14:29:58] ============= ttm_bo_validate_same_placement  ==============
[14:29:58] [PASSED] System manager
[14:29:58] [PASSED] VRAM manager
[14:29:58] ========= [PASSED] ttm_bo_validate_same_placement ==========
[14:29:58] [PASSED] ttm_bo_validate_failed_alloc
[14:29:58] [PASSED] ttm_bo_validate_pinned
[14:29:58] [PASSED] ttm_bo_validate_busy_placement
[14:29:58] ================ ttm_bo_validate_multihop  =================
[14:29:58] [PASSED] Buffer object for userspace
[14:29:58] [PASSED] Kernel buffer object
[14:29:58] [PASSED] Shared buffer object
[14:29:58] ============ [PASSED] ttm_bo_validate_multihop =============
[14:29:58] ========== ttm_bo_validate_no_placement_signaled  ==========
[14:29:58] [PASSED] Buffer object in system domain, no page vector
[14:29:58] [PASSED] Buffer object in system domain with an existing page vector
[14:29:58] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[14:29:58] ======== ttm_bo_validate_no_placement_not_signaled  ========
[14:29:58] [PASSED] Buffer object for userspace
[14:29:58] [PASSED] Kernel buffer object
[14:29:58] [PASSED] Shared buffer object
[14:29:58] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[14:29:58] [PASSED] ttm_bo_validate_move_fence_signaled
[14:29:58] ========= ttm_bo_validate_move_fence_not_signaled  =========
[14:29:58] [PASSED] Waits for GPU
[14:29:58] [PASSED] Tries to lock straight away
[14:29:58] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[14:29:58] [PASSED] ttm_bo_validate_swapout
[14:29:58] [PASSED] ttm_bo_validate_happy_evict
[14:29:58] [PASSED] ttm_bo_validate_all_pinned_evict
[14:29:58] [PASSED] ttm_bo_validate_allowed_only_evict
[14:29:58] [PASSED] ttm_bo_validate_deleted_evict
[14:29:58] [PASSED] ttm_bo_validate_busy_domain_evict
[14:29:58] [PASSED] ttm_bo_validate_evict_gutting
[14:29:58] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[14:29:58] ================= [PASSED] ttm_bo_validate =================
[14:29:58] ============================================================
[14:29:58] Testing complete. Ran 102 tests: passed: 102
[14:29:58] Elapsed time: 9.990s total, 1.664s configuring, 7.709s building, 0.528s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


