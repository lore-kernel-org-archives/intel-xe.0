Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB62C35FFA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Mar 2025 10:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6333210E073;
	Wed, 19 Mar 2025 10:51:34 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6418910E073;
 Wed, 19 Mar 2025 10:51:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_xe-only_patches_from?=
 =?utf-8?q?_the_multi-device_GPUSVM_series_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Mar 2025 10:51:33 -0000
Message-ID: <174238149340.53310.1562948992081401594@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250317104132.8200-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250317104132.8200-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: xe-only patches from the multi-device GPUSVM series (rev2)
URL   : https://patchwork.freedesktop.org/series/146383/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[10:50:24] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:50:28] Building KUnit Kernel ...
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

[10:50:54] Starting KUnit Kernel (1/1)...
[10:50:54] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:50:54] ================== guc_buf (11 subtests) ===================
[10:50:54] [PASSED] test_smallest
[10:50:54] [PASSED] test_largest
[10:50:54] [PASSED] test_granular
[10:50:54] [PASSED] test_unique
[10:50:54] [PASSED] test_overlap
[10:50:54] [PASSED] test_reusable
[10:50:54] [PASSED] test_too_big
[10:50:54] [PASSED] test_flush
[10:50:54] [PASSED] test_lookup
[10:50:54] [PASSED] test_data
[10:50:54] [PASSED] test_class
[10:50:54] ===================== [PASSED] guc_buf =====================
[10:50:54] =================== guc_dbm (7 subtests) ===================
[10:50:54] [PASSED] test_empty
[10:50:54] [PASSED] test_default
[10:50:54] ======================== test_size  ========================
[10:50:54] [PASSED] 4
[10:50:54] [PASSED] 8
[10:50:54] [PASSED] 32
[10:50:54] [PASSED] 256
[10:50:54] ==================== [PASSED] test_size ====================
[10:50:54] ======================= test_reuse  ========================
[10:50:54] [PASSED] 4
[10:50:54] [PASSED] 8
[10:50:54] [PASSED] 32
[10:50:54] [PASSED] 256
[10:50:54] =================== [PASSED] test_reuse ====================
[10:50:54] =================== test_range_overlap  ====================
[10:50:54] [PASSED] 4
[10:50:54] [PASSED] 8
[10:50:54] [PASSED] 32
[10:50:54] [PASSED] 256
[10:50:54] =============== [PASSED] test_range_overlap ================
[10:50:54] =================== test_range_compact  ====================
[10:50:54] [PASSED] 4
[10:50:54] [PASSED] 8
[10:50:54] [PASSED] 32
[10:50:54] [PASSED] 256
[10:50:54] =============== [PASSED] test_range_compact ================
[10:50:54] ==================== test_range_spare  =====================
[10:50:54] [PASSED] 4
[10:50:54] [PASSED] 8
[10:50:54] [PASSED] 32
[10:50:54] [PASSED] 256
[10:50:54] ================ [PASSED] test_range_spare =================
[10:50:54] ===================== [PASSED] guc_dbm =====================
[10:50:54] =================== guc_idm (6 subtests) ===================
[10:50:54] [PASSED] bad_init
[10:50:54] [PASSED] no_init
[10:50:54] [PASSED] init_fini
[10:50:54] [PASSED] check_used
[10:50:54] [PASSED] check_quota
[10:50:54] [PASSED] check_all
[10:50:54] ===================== [PASSED] guc_idm =====================
[10:50:54] ================== no_relay (3 subtests) ===================
[10:50:54] [PASSED] xe_drops_guc2pf_if_not_ready
[10:50:54] [PASSED] xe_drops_guc2vf_if_not_ready
[10:50:54] [PASSED] xe_rejects_send_if_not_ready
[10:50:54] ==================== [PASSED] no_relay =====================
[10:50:54] ================== pf_relay (14 subtests) ==================
[10:50:54] [PASSED] pf_rejects_guc2pf_too_short
[10:50:54] [PASSED] pf_rejects_guc2pf_too_long
[10:50:54] [PASSED] pf_rejects_guc2pf_no_payload
[10:50:54] [PASSED] pf_fails_no_payload
[10:50:54] [PASSED] pf_fails_bad_origin
[10:50:54] [PASSED] pf_fails_bad_type
[10:50:54] [PASSED] pf_txn_reports_error
[10:50:54] [PASSED] pf_txn_sends_pf2guc
[10:50:54] [PASSED] pf_sends_pf2guc
[10:50:54] [SKIPPED] pf_loopback_nop
[10:50:54] [SKIPPED] pf_loopback_echo
[10:50:54] [SKIPPED] pf_loopback_fail
[10:50:54] [SKIPPED] pf_loopback_busy
[10:50:54] [SKIPPED] pf_loopback_retry
[10:50:54] ==================== [PASSED] pf_relay =====================
[10:50:54] ================== vf_relay (3 subtests) ===================
[10:50:54] [PASSED] vf_rejects_guc2vf_too_short
[10:50:54] [PASSED] vf_rejects_guc2vf_too_long
[10:50:54] [PASSED] vf_rejects_guc2vf_no_payload
[10:50:54] ==================== [PASSED] vf_relay =====================
[10:50:54] ================= pf_service (11 subtests) =================
[10:50:54] [PASSED] pf_negotiate_any
[10:50:54] [PASSED] pf_negotiate_base_match
[10:50:54] [PASSED] pf_negotiate_base_newer
[10:50:54] [PASSED] pf_negotiate_base_next
[10:50:54] [SKIPPED] pf_negotiate_base_older
[10:50:54] [PASSED] pf_negotiate_base_prev
[10:50:54] [PASSED] pf_negotiate_latest_match
[10:50:54] [PASSED] pf_negotiate_latest_newer
[10:50:54] [PASSED] pf_negotiate_latest_next
[10:50:54] [SKIPPED] pf_negotiate_latest_older
[10:50:54] [SKIPPED] pf_negotiate_latest_prev
[10:50:54] =================== [PASSED] pf_service ====================
[10:50:54] ===================== lmtt (1 subtest) =====================
[10:50:54] ======================== test_ops  =========================
[10:50:54] [PASSED] 2-level
[10:50:54] [PASSED] multi-level
[10:50:54] ==================== [PASSED] test_ops =====================
[10:50:54] ====================== [PASSED] lmtt =======================
[10:50:54] =================== xe_mocs (2 subtests) ===================
[10:50:54] ================ xe_live_mocs_kernel_kunit  ================
[10:50:54] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[10:50:54] ================ xe_live_mocs_reset_kunit  =================
[10:50:54] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[10:50:54] ==================== [SKIPPED] xe_mocs =====================
[10:50:54] ================= xe_migrate (2 subtests) ==================
[10:50:54] ================= xe_migrate_sanity_kunit  =================
[10:50:54] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[10:50:54] ================== xe_validate_ccs_kunit  ==================
[10:50:54] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[10:50:54] =================== [SKIPPED] xe_migrate ===================
[10:50:54] ================== xe_dma_buf (1 subtest) ==================
[10:50:54] ==================== xe_dma_buf_kunit  =====================
[10:50:54] ================ [SKIPPED] xe_dma_buf_kunit ================
[10:50:54] =================== [SKIPPED] xe_dma_buf ===================
[10:50:54] ================= xe_bo_shrink (1 subtest) =================
[10:50:54] =================== xe_bo_shrink_kunit  ====================
[10:50:54] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[10:50:54] ================== [SKIPPED] xe_bo_shrink ==================
[10:50:54] ==================== xe_bo (2 subtests) ====================
[10:50:54] ================== xe_ccs_migrate_kunit  ===================
[10:50:54] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
stty: 'standard input': Inappropriate ioctl for device
[10:50:54] ==================== xe_bo_evict_kunit  ====================
[10:50:54] =============== [SKIPPED] xe_bo_evict_kunit ================
[10:50:54] ===================== [SKIPPED] xe_bo ======================
[10:50:54] ==================== args (11 subtests) ====================
[10:50:54] [PASSED] count_args_test
[10:50:54] [PASSED] call_args_example
[10:50:54] [PASSED] call_args_test
[10:50:54] [PASSED] drop_first_arg_example
[10:50:54] [PASSED] drop_first_arg_test
[10:50:54] [PASSED] first_arg_example
[10:50:54] [PASSED] first_arg_test
[10:50:54] [PASSED] last_arg_example
[10:50:54] [PASSED] last_arg_test
[10:50:54] [PASSED] pick_arg_example
[10:50:54] [PASSED] sep_comma_example
[10:50:54] ====================== [PASSED] args =======================
[10:50:54] =================== xe_pci (2 subtests) ====================
[10:50:54] [PASSED] xe_gmdid_graphics_ip
[10:50:54] [PASSED] xe_gmdid_media_ip
[10:50:54] ===================== [PASSED] xe_pci ======================
[10:50:54] =================== xe_rtp (2 subtests) ====================
[10:50:54] =============== xe_rtp_process_to_sr_tests  ================
[10:50:54] [PASSED] coalesce-same-reg
[10:50:54] [PASSED] no-match-no-add
[10:50:54] [PASSED] match-or
[10:50:54] [PASSED] match-or-xfail
[10:50:54] [PASSED] no-match-no-add-multiple-rules
[10:50:54] [PASSED] two-regs-two-entries
[10:50:54] [PASSED] clr-one-set-other
[10:50:54] [PASSED] set-field
[10:50:54] [PASSED] conflict-duplicate
[10:50:54] [PASSED] conflict-not-disjoint
[10:50:54] [PASSED] conflict-reg-type
[10:50:54] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[10:50:54] ================== xe_rtp_process_tests  ===================
[10:50:54] [PASSED] active1
[10:50:54] [PASSED] active2
[10:50:54] [PASSED] active-inactive
[10:50:54] [PASSED] inactive-active
[10:50:54] [PASSED] inactive-1st_or_active-inactive
[10:50:54] [PASSED] inactive-2nd_or_active-inactive
[10:50:54] [PASSED] inactive-last_or_active-inactive
[10:50:54] [PASSED] inactive-no_or_active-inactive
[10:50:54] ============== [PASSED] xe_rtp_process_tests ===============
[10:50:54] ===================== [PASSED] xe_rtp ======================
[10:50:54] ==================== xe_wa (1 subtest) =====================
[10:50:54] ======================== xe_wa_gt  =========================
[10:50:54] [PASSED] TIGERLAKE (B0)
[10:50:54] [PASSED] DG1 (A0)
[10:50:54] [PASSED] DG1 (B0)
[10:50:54] [PASSED] ALDERLAKE_S (A0)
[10:50:54] [PASSED] ALDERLAKE_S (B0)
[10:50:54] [PASSED] ALDERLAKE_S (C0)
[10:50:54] [PASSED] ALDERLAKE_S (D0)
[10:50:54] [PASSED] ALDERLAKE_P (A0)
[10:50:54] [PASSED] ALDERLAKE_P (B0)
[10:50:54] [PASSED] ALDERLAKE_P (C0)
[10:50:54] [PASSED] ALDERLAKE_S_RPLS (D0)
[10:50:54] [PASSED] ALDERLAKE_P_RPLU (E0)
[10:50:54] [PASSED] DG2_G10 (C0)
[10:50:54] [PASSED] DG2_G11 (B1)
[10:50:54] [PASSED] DG2_G12 (A1)
[10:50:54] [PASSED] METEORLAKE (g:A0, m:A0)
[10:50:54] [PASSED] METEORLAKE (g:A0, m:A0)
[10:50:54] [PASSED] METEORLAKE (g:A0, m:A0)
[10:50:54] [PASSED] LUNARLAKE (g:A0, m:A0)
[10:50:54] [PASSED] LUNARLAKE (g:B0, m:A0)
[10:50:54] [PASSED] BATTLEMAGE (g:A0, m:A1)
[10:50:54] ==================== [PASSED] xe_wa_gt =====================
[10:50:54] ====================== [PASSED] xe_wa ======================
[10:50:54] ============================================================
[10:50:54] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[10:50:54] Elapsed time: 30.601s total, 4.193s configuring, 26.142s building, 0.251s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[10:50:54] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:50:56] Building KUnit Kernel ...
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

[10:51:17] Starting KUnit Kernel (1/1)...
[10:51:17] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:51:17] =========== drm_validate_clone_mode (2 subtests) ===========
[10:51:17] ============== drm_test_check_in_clone_mode  ===============
[10:51:17] [PASSED] in_clone_mode
[10:51:17] [PASSED] not_in_clone_mode
[10:51:17] ========== [PASSED] drm_test_check_in_clone_mode ===========
[10:51:17] =============== drm_test_check_valid_clones  ===============
[10:51:17] [PASSED] not_in_clone_mode
[10:51:17] [PASSED] valid_clone
[10:51:17] [PASSED] invalid_clone
[10:51:17] =========== [PASSED] drm_test_check_valid_clones ===========
[10:51:17] ============= [PASSED] drm_validate_clone_mode =============
[10:51:17] ============= drm_validate_modeset (1 subtest) =============
[10:51:17] [PASSED] drm_test_check_connector_changed_modeset
[10:51:17] ============== [PASSED] drm_validate_modeset ===============
[10:51:17] ================== drm_buddy (7 subtests) ==================
[10:51:17] [PASSED] drm_test_buddy_alloc_limit
[10:51:17] [PASSED] drm_test_buddy_alloc_optimistic
[10:51:17] [PASSED] drm_test_buddy_alloc_pessimistic
[10:51:17] [PASSED] drm_test_buddy_alloc_pathological
[10:51:17] [PASSED] drm_test_buddy_alloc_contiguous
[10:51:17] [PASSED] drm_test_buddy_alloc_clear
[10:51:17] [PASSED] drm_test_buddy_alloc_range_bias
[10:51:17] ==================== [PASSED] drm_buddy ====================
[10:51:17] ============= drm_cmdline_parser (40 subtests) =============
[10:51:17] [PASSED] drm_test_cmdline_force_d_only
[10:51:17] [PASSED] drm_test_cmdline_force_D_only_dvi
[10:51:17] [PASSED] drm_test_cmdline_force_D_only_hdmi
[10:51:17] [PASSED] drm_test_cmdline_force_D_only_not_digital
[10:51:17] [PASSED] drm_test_cmdline_force_e_only
[10:51:17] [PASSED] drm_test_cmdline_res
[10:51:17] [PASSED] drm_test_cmdline_res_vesa
[10:51:17] [PASSED] drm_test_cmdline_res_vesa_rblank
[10:51:17] [PASSED] drm_test_cmdline_res_rblank
[10:51:17] [PASSED] drm_test_cmdline_res_bpp
[10:51:17] [PASSED] drm_test_cmdline_res_refresh
[10:51:17] [PASSED] drm_test_cmdline_res_bpp_refresh
[10:51:17] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[10:51:17] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[10:51:17] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[10:51:17] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[10:51:17] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[10:51:17] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[10:51:17] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[10:51:17] [PASSED] drm_test_cmdline_res_margins_force_on
[10:51:17] [PASSED] drm_test_cmdline_res_vesa_margins
[10:51:17] [PASSED] drm_test_cmdline_name
[10:51:17] [PASSED] drm_test_cmdline_name_bpp
[10:51:17] [PASSED] drm_test_cmdline_name_option
[10:51:17] [PASSED] drm_test_cmdline_name_bpp_option
[10:51:17] [PASSED] drm_test_cmdline_rotate_0
[10:51:17] [PASSED] drm_test_cmdline_rotate_90
[10:51:17] [PASSED] drm_test_cmdline_rotate_180
[10:51:17] [PASSED] drm_test_cmdline_rotate_270
[10:51:17] [PASSED] drm_test_cmdline_hmirror
[10:51:17] [PASSED] drm_test_cmdline_vmirror
[10:51:17] [PASSED] drm_test_cmdline_margin_options
[10:51:17] [PASSED] drm_test_cmdline_multiple_options
[10:51:17] [PASSED] drm_test_cmdline_bpp_extra_and_option
[10:51:17] [PASSED] drm_test_cmdline_extra_and_option
[10:51:17] [PASSED] drm_test_cmdline_freestanding_options
[10:51:17] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[10:51:17] [PASSED] drm_test_cmdline_panel_orientation
[10:51:17] ================ drm_test_cmdline_invalid  =================
[10:51:17] [PASSED] margin_only
[10:51:17] [PASSED] interlace_only
[10:51:17] [PASSED] res_missing_x
[10:51:17] [PASSED] res_missing_y
[10:51:17] [PASSED] res_bad_y
[10:51:17] [PASSED] res_missing_y_bpp
[10:51:17] [PASSED] res_bad_bpp
[10:51:17] [PASSED] res_bad_refresh
[10:51:17] [PASSED] res_bpp_refresh_force_on_off
[10:51:17] [PASSED] res_invalid_mode
[10:51:17] [PASSED] res_bpp_wrong_place_mode
[10:51:17] [PASSED] name_bpp_refresh
[10:51:17] [PASSED] name_refresh
[10:51:17] [PASSED] name_refresh_wrong_mode
[10:51:17] [PASSED] name_refresh_invalid_mode
[10:51:17] [PASSED] rotate_multiple
[10:51:17] [PASSED] rotate_invalid_val
[10:51:17] [PASSED] rotate_truncated
[10:51:17] [PASSED] invalid_option
[10:51:17] [PASSED] invalid_tv_option
[10:51:17] [PASSED] truncated_tv_option
[10:51:17] ============ [PASSED] drm_test_cmdline_invalid =============
[10:51:17] =============== drm_test_cmdline_tv_options  ===============
[10:51:17] [PASSED] NTSC
[10:51:17] [PASSED] NTSC_443
[10:51:17] [PASSED] NTSC_J
[10:51:17] [PASSED] PAL
[10:51:17] [PASSED] PAL_M
[10:51:17] [PASSED] PAL_N
[10:51:17] [PASSED] SECAM
[10:51:17] [PASSED] MONO_525
[10:51:17] [PASSED] MONO_625
[10:51:17] =========== [PASSED] drm_test_cmdline_tv_options ===========
[10:51:17] =============== [PASSED] drm_cmdline_parser ================
[10:51:17] ========== drmm_connector_hdmi_init (20 subtests) ==========
[10:51:17] [PASSED] drm_test_connector_hdmi_init_valid
[10:51:17] [PASSED] drm_test_connector_hdmi_init_bpc_8
[10:51:17] [PASSED] drm_test_connector_hdmi_init_bpc_10
[10:51:17] [PASSED] drm_test_connector_hdmi_init_bpc_12
[10:51:17] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[10:51:17] [PASSED] drm_test_connector_hdmi_init_bpc_null
[10:51:17] [PASSED] drm_test_connector_hdmi_init_formats_empty
[10:51:17] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[10:51:17] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[10:51:17] [PASSED] supported_formats=0x9 yuv420_allowed=1
[10:51:17] [PASSED] supported_formats=0x9 yuv420_allowed=0
[10:51:17] [PASSED] supported_formats=0x3 yuv420_allowed=1
[10:51:17] [PASSED] supported_formats=0x3 yuv420_allowed=0
[10:51:17] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[10:51:17] [PASSED] drm_test_connector_hdmi_init_null_ddc
[10:51:17] [PASSED] drm_test_connector_hdmi_init_null_product
[10:51:17] [PASSED] drm_test_connector_hdmi_init_null_vendor
[10:51:17] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[10:51:17] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[10:51:17] [PASSED] drm_test_connector_hdmi_init_product_valid
[10:51:17] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[10:51:17] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[10:51:17] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[10:51:17] ========= drm_test_connector_hdmi_init_type_valid  =========
[10:51:17] [PASSED] HDMI-A
[10:51:17] [PASSED] HDMI-B
[10:51:17] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[10:51:17] ======== drm_test_connector_hdmi_init_type_invalid  ========
[10:51:17] [PASSED] Unknown
[10:51:17] [PASSED] VGA
[10:51:17] [PASSED] DVI-I
[10:51:17] [PASSED] DVI-D
[10:51:17] [PASSED] DVI-A
[10:51:17] [PASSED] Composite
[10:51:17] [PASSED] SVIDEO
[10:51:17] [PASSED] LVDS
[10:51:17] [PASSED] Component
[10:51:17] [PASSED] DIN
[10:51:17] [PASSED] DP
[10:51:17] [PASSED] TV
[10:51:17] [PASSED] eDP
[10:51:17] [PASSED] Virtual
[10:51:17] [PASSED] DSI
[10:51:17] [PASSED] DPI
[10:51:17] [PASSED] Writeback
[10:51:17] [PASSED] SPI
[10:51:17] [PASSED] USB
[10:51:17] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[10:51:17] ============ [PASSED] drmm_connector_hdmi_init =============
[10:51:17] ============= drmm_connector_init (3 subtests) =============
[10:51:17] [PASSED] drm_test_drmm_connector_init
[10:51:17] [PASSED] drm_test_drmm_connector_init_null_ddc
[10:51:17] ========= drm_test_drmm_connector_init_type_valid  =========
[10:51:17] [PASSED] Unknown
[10:51:17] [PASSED] VGA
[10:51:17] [PASSED] DVI-I
[10:51:17] [PASSED] DVI-D
[10:51:17] [PASSED] DVI-A
[10:51:17] [PASSED] Composite
[10:51:17] [PASSED] SVIDEO
[10:51:17] [PASSED] LVDS
[10:51:17] [PASSED] Component
[10:51:17] [PASSED] DIN
[10:51:17] [PASSED] DP
[10:51:17] [PASSED] HDMI-A
[10:51:17] [PASSED] HDMI-B
[10:51:17] [PASSED] TV
[10:51:17] [PASSED] eDP
[10:51:17] [PASSED] Virtual
[10:51:17] [PASSED] DSI
[10:51:17] [PASSED] DPI
[10:51:17] [PASSED] Writeback
[10:51:17] [PASSED] SPI
[10:51:17] [PASSED] USB
[10:51:17] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[10:51:17] =============== [PASSED] drmm_connector_init ===============
[10:51:17] ========= drm_connector_dynamic_init (6 subtests) ==========
[10:51:17] [PASSED] drm_test_drm_connector_dynamic_init
[10:51:17] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[10:51:17] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[10:51:17] [PASSED] drm_test_drm_connector_dynamic_init_properties
[10:51:17] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[10:51:17] [PASSED] Unknown
[10:51:17] [PASSED] VGA
[10:51:17] [PASSED] DVI-I
[10:51:17] [PASSED] DVI-D
[10:51:17] [PASSED] DVI-A
[10:51:17] [PASSED] Composite
[10:51:17] [PASSED] SVIDEO
[10:51:17] [PASSED] LVDS
[10:51:17] [PASSED] Component
[10:51:17] [PASSED] DIN
[10:51:17] [PASSED] DP
[10:51:17] [PASSED] HDMI-A
[10:51:17] [PASSED] HDMI-B
[10:51:17] [PASSED] TV
[10:51:17] [PASSED] eDP
[10:51:17] [PASSED] Virtual
[10:51:17] [PASSED] DSI
[10:51:17] [PASSED] DPI
[10:51:17] [PASSED] Writeback
[10:51:17] [PASSED] SPI
[10:51:17] [PASSED] USB
[10:51:17] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[10:51:17] ======== drm_test_drm_connector_dynamic_init_name  =========
[10:51:17] [PASSED] Unknown
[10:51:17] [PASSED] VGA
[10:51:17] [PASSED] DVI-I
[10:51:17] [PASSED] DVI-D
[10:51:17] [PASSED] DVI-A
[10:51:17] [PASSED] Composite
[10:51:17] [PASSED] SVIDEO
[10:51:17] [PASSED] LVDS
[10:51:17] [PASSED] Component
[10:51:17] [PASSED] DIN
[10:51:17] [PASSED] DP
[10:51:17] [PASSED] HDMI-A
[10:51:17] [PASSED] HDMI-B
[10:51:17] [PASSED] TV
[10:51:17] [PASSED] eDP
[10:51:17] [PASSED] Virtual
[10:51:17] [PASSED] DSI
[10:51:17] [PASSED] DPI
[10:51:17] [PASSED] Writeback
[10:51:17] [PASSED] SPI
[10:51:17] [PASSED] USB
[10:51:17] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[10:51:17] =========== [PASSED] drm_connector_dynamic_init ============
[10:51:17] ==== drm_connector_dynamic_register_early (4 subtests) =====
[10:51:17] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[10:51:17] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[10:51:17] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[10:51:17] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[10:51:17] ====== [PASSED] drm_connector_dynamic_register_early =======
[10:51:17] ======= drm_connector_dynamic_register (7 subtests) ========
[10:51:17] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[10:51:17] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[10:51:17] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[10:51:17] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[10:51:17] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[10:51:17] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[10:51:17] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[10:51:17] ========= [PASSED] drm_connector_dynamic_register ==========
[10:51:17] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[10:51:17] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[10:51:17] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[10:51:17] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[10:51:17] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[10:51:17] ========== drm_test_get_tv_mode_from_name_valid  ===========
[10:51:17] [PASSED] NTSC
[10:51:17] [PASSED] NTSC-443
[10:51:17] [PASSED] NTSC-J
[10:51:17] [PASSED] PAL
[10:51:17] [PASSED] PAL-M
[10:51:17] [PASSED] PAL-N
[10:51:17] [PASSED] SECAM
[10:51:17] [PASSED] Mono
[10:51:17] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[10:51:17] [PASSED] drm_test_get_tv_mode_from_name_truncated
[10:51:17] ============ [PASSED] drm_get_tv_mode_from_name ============
[10:51:17] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[10:51:17] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[10:51:17] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[10:51:17] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[10:51:17] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[10:51:17] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[10:51:17] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[10:51:17] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[10:51:17] [PASSED] VIC 96
[10:51:17] [PASSED] VIC 97
[10:51:17] [PASSED] VIC 101
[10:51:17] [PASSED] VIC 102
[10:51:17] [PASSED] VIC 106
[10:51:17] [PASSED] VIC 107
[10:51:17] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[10:51:17] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[10:51:17] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[10:51:17] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[10:51:17] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[10:51:17] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[10:51:17] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[10:51:17] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[10:51:17] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[10:51:17] [PASSED] Automatic
[10:51:17] [PASSED] Full
[10:51:17] [PASSED] Limited 16:235
[10:51:17] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[10:51:17] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[10:51:17] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[10:51:17] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[10:51:17] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[10:51:17] [PASSED] RGB
[10:51:17] [PASSED] YUV 4:2:0
[10:51:17] [PASSED] YUV 4:2:2
[10:51:17] [PASSED] YUV 4:4:4
[10:51:17] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[10:51:17] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[10:51:17] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[10:51:17] ============= drm_damage_helper (21 subtests) ==============
[10:51:17] [PASSED] drm_test_damage_iter_no_damage
[10:51:17] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[10:51:17] [PASSED] drm_test_damage_iter_no_damage_src_moved
[10:51:17] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[10:51:17] [PASSED] drm_test_damage_iter_no_damage_not_visible
[10:51:17] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[10:51:17] [PASSED] drm_test_damage_iter_no_damage_no_fb
[10:51:17] [PASSED] drm_test_damage_iter_simple_damage
[10:51:17] [PASSED] drm_test_damage_iter_single_damage
[10:51:17] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[10:51:17] [PASSED] drm_test_damage_iter_single_damage_outside_src
[10:51:17] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[10:51:17] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[10:51:17] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[10:51:17] [PASSED] drm_test_damage_iter_single_damage_src_moved
[10:51:17] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[10:51:17] [PASSED] drm_test_damage_iter_damage
[10:51:17] [PASSED] drm_test_damage_iter_damage_one_intersect
[10:51:17] [PASSED] drm_test_damage_iter_damage_one_outside
[10:51:17] [PASSED] drm_test_damage_iter_damage_src_moved
[10:51:17] [PASSED] drm_test_damage_iter_damage_not_visible
[10:51:17] ================ [PASSED] drm_damage_helper ================
[10:51:17] ============== drm_dp_mst_helper (3 subtests) ==============
[10:51:17] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[10:51:17] [PASSED] Clock 154000 BPP 30 DSC disabled
[10:51:17] [PASSED] Clock 234000 BPP 30 DSC disabled
[10:51:17] [PASSED] Clock 297000 BPP 24 DSC disabled
[10:51:17] [PASSED] Clock 332880 BPP 24 DSC enabled
[10:51:17] [PASSED] Clock 324540 BPP 24 DSC enabled
[10:51:17] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[10:51:17] ============== drm_test_dp_mst_calc_pbn_div  ===============
[10:51:17] [PASSED] Link rate 2000000 lane count 4
[10:51:17] [PASSED] Link rate 2000000 lane count 2
[10:51:17] [PASSED] Link rate 2000000 lane count 1
[10:51:17] [PASSED] Link rate 1350000 lane count 4
[10:51:17] [PASSED] Link rate 1350000 lane count 2
[10:51:17] [PASSED] Link rate 1350000 lane count 1
[10:51:17] [PASSED] Link rate 1000000 lane count 4
[10:51:17] [PASSED] Link rate 1000000 lane count 2
[10:51:17] [PASSED] Link rate 1000000 lane count 1
[10:51:17] [PASSED] Link rate 810000 lane count 4
[10:51:17] [PASSED] Link rate 810000 lane count 2
[10:51:17] [PASSED] Link rate 810000 lane count 1
[10:51:17] [PASSED] Link rate 540000 lane count 4
[10:51:17] [PASSED] Link rate 540000 lane count 2
[10:51:17] [PASSED] Link rate 540000 lane count 1
[10:51:17] [PASSED] Link rate 270000 lane count 4
[10:51:17] [PASSED] Link rate 270000 lane count 2
[10:51:17] [PASSED] Link rate 270000 lane count 1
[10:51:17] [PASSED] Link rate 162000 lane count 4
[10:51:17] [PASSED] Link rate 162000 lane count 2
[10:51:17] [PASSED] Link rate 162000 lane count 1
[10:51:17] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[10:51:17] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[10:51:17] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[10:51:17] [PASSED] DP_POWER_UP_PHY with port number
[10:51:17] [PASSED] DP_POWER_DOWN_PHY with port number
[10:51:17] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[10:51:17] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[10:51:17] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[10:51:17] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[10:51:17] [PASSED] DP_QUERY_PAYLOAD with port number
[10:51:17] [PASSED] DP_QUERY_PAYLOAD with VCPI
[10:51:17] [PASSED] DP_REMOTE_DPCD_READ with port number
[10:51:17] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[10:51:17] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[10:51:17] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[10:51:17] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[10:51:17] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[10:51:17] [PASSED] DP_REMOTE_I2C_READ with port number
[10:51:17] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[10:51:17] [PASSED] DP_REMOTE_I2C_READ with transactions array
[10:51:17] [PASSED] DP_REMOTE_I2C_WRITE with port number
[10:51:17] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[10:51:17] [PASSED] DP_REMOTE_I2C_WRITE with data array
[10:51:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[10:51:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[10:51:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[10:51:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[10:51:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[10:51:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[10:51:17] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[10:51:17] ================ [PASSED] drm_dp_mst_helper ================
[10:51:17] ================== drm_exec (7 subtests) ===================
[10:51:17] [PASSED] sanitycheck
[10:51:17] [PASSED] test_lock
[10:51:17] [PASSED] test_lock_unlock
[10:51:17] [PASSED] test_duplicates
[10:51:17] [PASSED] test_prepare
[10:51:17] [PASSED] test_prepare_array
[10:51:17] [PASSED] test_multiple_loops
[10:51:17] ==================== [PASSED] drm_exec =====================
[10:51:17] =========== drm_format_helper_test (18 subtests) ===========
[10:51:17] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[10:51:17] [PASSED] single_pixel_source_buffer
[10:51:17] [PASSED] single_pixel_clip_rectangle
[10:51:17] [PASSED] well_known_colors
[10:51:17] [PASSED] destination_pitch
[10:51:17] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[10:51:17] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[10:51:17] [PASSED] single_pixel_source_buffer
[10:51:17] [PASSED] single_pixel_clip_rectangle
[10:51:17] [PASSED] well_known_colors
[10:51:17] [PASSED] destination_pitch
[10:51:17] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[10:51:17] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[10:51:17] [PASSED] single_pixel_source_buffer
[10:51:17] [PASSED] single_pixel_clip_rectangle
[10:51:17] [PASSED] well_known_colors
[10:51:17] [PASSED] destination_pitch
[10:51:17] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[10:51:17] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[10:51:17] [PASSED] single_pixel_source_buffer
[10:51:17] [PASSED] single_pixel_clip_rectangle
[10:51:17] [PASSED] well_known_colors
[10:51:17] [PASSED] destination_pitch
[10:51:17] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[10:51:17] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[10:51:17] [PASSED] single_pixel_source_buffer
[10:51:17] [PASSED] single_pixel_clip_rectangle
[10:51:17] [PASSED] well_known_colors
[10:51:17] [PASSED] destination_pitch
[10:51:17] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[10:51:17] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[10:51:17] [PASSED] single_pixel_source_buffer
[10:51:17] [PASSED] single_pixel_clip_rectangle
[10:51:17] [PASSED] well_known_colors
[10:51:17] [PASSED] destination_pitch
[10:51:17] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[10:51:17] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[10:51:17] [PASSED] single_pixel_source_buffer
[10:51:17] [PASSED] single_pixel_clip_rectangle
[10:51:17] [PASSED] well_known_colors
[10:51:17] [PASSED] destination_pitch
[10:51:17] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[10:51:17] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[10:51:17] [PASSED] single_pixel_source_buffer
[10:51:17] [PASSED] single_pixel_clip_rectangle
[10:51:17] [PASSED] well_known_colors
[10:51:17] [PASSED] destination_pitch
[10:51:17] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[10:51:17] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[10:51:17] [PASSED] single_pixel_source_buffer
[10:51:17] [PASSED] single_pixel_clip_rectangle
[10:51:17] [PASSED] well_known_colors
[10:51:17] [PASSED] destination_pitch
[10:51:17] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[10:51:17] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[10:51:17] [PASSED] single_pixel_source_buffer
[10:51:17] [PASSED] single_pixel_clip_rectangle
[10:51:17] [PASSED] well_known_colors
[10:51:17] [PASSED] destination_pitch
[10:51:17] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[10:51:17] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[10:51:17] [PASSED] single_pixel_source_buffer
[10:51:17] [PASSED] single_pixel_clip_rectangle
[10:51:17] [PASSED] well_known_colors
[10:51:17] [PASSED] destination_pitch
[10:51:17] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[10:51:17] ============== drm_test_fb_xrgb8888_to_mono  ===============
[10:51:17] [PASSED] single_pixel_source_buffer
[10:51:17] [PASSED] single_pixel_clip_rectangle
[10:51:17] [PASSED] well_known_colors
[10:51:17] [PASSED] destination_pitch
[10:51:17] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[10:51:17] ==================== drm_test_fb_swab  =====================
[10:51:17] [PASSED] single_pixel_source_buffer
[10:51:17] [PASSED] single_pixel_clip_rectangle
[10:51:17] [PASSED] well_known_colors
[10:51:17] [PASSED] destination_pitch
[10:51:17] ================ [PASSED] drm_test_fb_swab =================
[10:51:17] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[10:51:17] [PASSED] single_pixel_source_buffer
[10:51:17] [PASSED] single_pixel_clip_rectangle
[10:51:17] [PASSED] well_known_colors
[10:51:17] [PASSED] destination_pitch
[10:51:17] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[10:51:17] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[10:51:17] [PASSED] single_pixel_source_buffer
[10:51:17] [PASSED] single_pixel_clip_rectangle
[10:51:17] [PASSED] well_known_colors
[10:51:17] [PASSED] destination_pitch
[10:51:17] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[10:51:17] ================= drm_test_fb_clip_offset  =================
[10:51:17] [PASSED] pass through
[10:51:17] [PASSED] horizontal offset
[10:51:17] [PASSED] vertical offset
[10:51:17] [PASSED] horizontal and vertical offset
[10:51:17] [PASSED] horizontal offset (custom pitch)
[10:51:17] [PASSED] vertical offset (custom pitch)
[10:51:17] [PASSED] horizontal and vertical offset (custom pitch)
[10:51:17] ============= [PASSED] drm_test_fb_clip_offset =============
[10:51:17] ============== drm_test_fb_build_fourcc_list  ==============
[10:51:17] [PASSED] no native formats
[10:51:17] [PASSED] XRGB8888 as native format
[10:51:17] [PASSED] remove duplicates
[10:51:17] [PASSED] convert alpha formats
[10:51:17] [PASSED] random formats
[10:51:17] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[10:51:17] =================== drm_test_fb_memcpy  ====================
[10:51:17] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[10:51:17] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[10:51:17] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[10:51:17] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[10:51:17] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[10:51:17] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[10:51:17] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[10:51:17] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[10:51:17] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[10:51:17] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[10:51:17] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[10:51:17] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[10:51:17] =============== [PASSED] drm_test_fb_memcpy ================
[10:51:17] ============= [PASSED] drm_format_helper_test ==============
[10:51:17] ================= drm_format (18 subtests) =================
[10:51:17] [PASSED] drm_test_format_block_width_invalid
[10:51:17] [PASSED] drm_test_format_block_width_one_plane
[10:51:17] [PASSED] drm_test_format_block_width_two_plane
[10:51:17] [PASSED] drm_test_format_block_width_three_plane
[10:51:17] [PASSED] drm_test_format_block_width_tiled
[10:51:17] [PASSED] drm_test_format_block_height_invalid
[10:51:17] [PASSED] drm_test_format_block_height_one_plane
[10:51:17] [PASSED] drm_test_format_block_height_two_plane
[10:51:17] [PASSED] drm_test_format_block_height_three_plane
[10:51:17] [PASSED] drm_test_format_block_height_tiled
[10:51:17] [PASSED] drm_test_format_min_pitch_invalid
[10:51:17] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[10:51:17] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[10:51:17] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[10:51:17] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[10:51:17] [PASSED] drm_test_format_min_pitch_two_plane
[10:51:17] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[10:51:17] [PASSED] drm_test_format_min_pitch_tiled
[10:51:17] =================== [PASSED] drm_format ====================
[10:51:17] ============== drm_framebuffer (10 subtests) ===============
[10:51:17] ========== drm_test_framebuffer_check_src_coords  ==========
[10:51:17] [PASSED] Success: source fits into fb
[10:51:17] [PASSED] Fail: overflowing fb with x-axis coordinate
[10:51:17] [PASSED] Fail: overflowing fb with y-axis coordinate
[10:51:17] [PASSED] Fail: overflowing fb with source width
[10:51:17] [PASSED] Fail: overflowing fb with source height
[10:51:17] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[10:51:17] [PASSED] drm_test_framebuffer_cleanup
[10:51:17] =============== drm_test_framebuffer_create  ===============
[10:51:17] [PASSED] ABGR8888 normal sizes
[10:51:17] [PASSED] ABGR8888 max sizes
[10:51:17] [PASSED] ABGR8888 pitch greater than min required
[10:51:17] [PASSED] ABGR8888 pitch less than min required
[10:51:17] [PASSED] ABGR8888 Invalid width
[10:51:17] [PASSED] ABGR8888 Invalid buffer handle
[10:51:17] [PASSED] No pixel format
[10:51:17] [PASSED] ABGR8888 Width 0
[10:51:17] [PASSED] ABGR8888 Height 0
[10:51:17] [PASSED] ABGR8888 Out of bound height * pitch combination
[10:51:17] [PASSED] ABGR8888 Large buffer offset
[10:51:17] [PASSED] ABGR8888 Buffer offset for inexistent plane
[10:51:17] [PASSED] ABGR8888 Invalid flag
[10:51:17] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[10:51:17] [PASSED] ABGR8888 Valid buffer modifier
[10:51:17] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[10:51:17] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[10:51:17] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[10:51:17] [PASSED] NV12 Normal sizes
[10:51:17] [PASSED] NV12 Max sizes
[10:51:17] [PASSED] NV12 Invalid pitch
[10:51:17] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[10:51:17] [PASSED] NV12 different  modifier per-plane
[10:51:17] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[10:51:17] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[10:51:17] [PASSED] NV12 Modifier for inexistent plane
[10:51:17] [PASSED] NV12 Handle for inexistent plane
[10:51:17] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[10:51:17] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[10:51:17] [PASSED] YVU420 Normal sizes
[10:51:17] [PASSED] YVU420 Max sizes
[10:51:17] [PASSED] YVU420 Invalid pitch
[10:51:17] [PASSED] YVU420 Different pitches
[10:51:17] [PASSED] YVU420 Different buffer offsets/pitches
[10:51:17] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[10:51:17] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[10:51:17] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[10:51:17] [PASSED] YVU420 Valid modifier
[10:51:17] [PASSED] YVU420 Different modifiers per plane
[10:51:17] [PASSED] YVU420 Modifier for inexistent plane
[10:51:17] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[10:51:17] [PASSED] X0L2 Normal sizes
[10:51:17] [PASSED] X0L2 Max sizes
[10:51:17] [PASSED] X0L2 Invalid pitch
[10:51:17] [PASSED] X0L2 Pitch greater than minimum required
[10:51:17] [PASSED] X0L2 Handle for inexistent plane
[10:51:17] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[10:51:17] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[10:51:17] [PASSED] X0L2 Valid modifier
[10:51:17] [PASSED] X0L2 Modifier for inexistent plane
[10:51:17] =========== [PASSED] drm_test_framebuffer_create ===========
[10:51:17] [PASSED] drm_test_framebuffer_free
[10:51:17] [PASSED] drm_test_framebuffer_init
[10:51:17] [PASSED] drm_test_framebuffer_init_bad_format
[10:51:17] [PASSED] drm_test_framebuffer_init_dev_mismatch
[10:51:17] [PASSED] drm_test_framebuffer_lookup
[10:51:17] [PASSED] drm_test_framebuffer_lookup_inexistent
[10:51:17] [PASSED] drm_test_framebuffer_modifiers_not_supported
[10:51:17] ================= [PASSED] drm_framebuffer =================
[10:51:17] ================ drm_gem_shmem (8 subtests) ================
[10:51:17] [PASSED] drm_gem_shmem_test_obj_create
[10:51:17] [PASSED] drm_gem_shmem_test_obj_create_private
[10:51:17] [PASSED] drm_gem_shmem_test_pin_pages
[10:51:17] [PASSED] drm_gem_shmem_test_vmap
[10:51:17] [PASSED] drm_gem_shmem_test_get_pages_sgt
[10:51:17] [PASSED] drm_gem_shmem_test_get_sg_table
[10:51:17] [PASSED] drm_gem_shmem_test_madvise
[10:51:17] [PASSED] drm_gem_shmem_test_purge
[10:51:17] ================== [PASSED] drm_gem_shmem ==================
[10:51:17] === drm_atomic_helper_connector_hdmi_check (23 subtests) ===
[10:51:17] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[10:51:17] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[10:51:17] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[10:51:17] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[10:51:17] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[10:51:17] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[10:51:17] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[10:51:17] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[10:51:17] [PASSED] drm_test_check_disable_connector
[10:51:17] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[10:51:17] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[10:51:17] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[10:51:17] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[10:51:17] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[10:51:17] [PASSED] drm_test_check_output_bpc_dvi
[10:51:17] [PASSED] drm_test_check_output_bpc_format_vic_1
[10:51:17] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[10:51:17] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[10:51:17] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[10:51:17] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[10:51:17] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[10:51:17] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[10:51:17] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[10:51:17] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[10:51:17] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[10:51:17] [PASSED] drm_test_check_broadcast_rgb_value
[10:51:17] [PASSED] drm_test_check_bpc_8_value
[10:51:17] [PASSED] drm_test_check_bpc_10_value
[10:51:17] [PASSED] drm_test_check_bpc_12_value
[10:51:17] [PASSED] drm_test_check_format_value
[10:51:17] [PASSED] drm_test_check_tmds_char_value
[10:51:17] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[10:51:17] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[10:51:17] [PASSED] drm_test_check_mode_valid
[10:51:17] [PASSED] drm_test_check_mode_valid_reject
[10:51:17] [PASSED] drm_test_check_mode_valid_reject_rate
[10:51:17] [PASSED] drm_test_check_mode_valid_reject_max_clock
[10:51:17] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[10:51:17] ================= drm_managed (2 subtests) =================
[10:51:17] [PASSED] drm_test_managed_release_action
[10:51:17] [PASSED] drm_test_managed_run_action
[10:51:17] =================== [PASSED] drm_managed ===================
[10:51:17] =================== drm_mm (6 subtests) ====================
[10:51:17] [PASSED] drm_test_mm_init
[10:51:17] [PASSED] drm_test_mm_debug
[10:51:17] [PASSED] drm_test_mm_align32
[10:51:17] [PASSED] drm_test_mm_align64
[10:51:17] [PASSED] drm_test_mm_lowest
[10:51:17] [PASSED] drm_test_mm_highest
[10:51:17] ===================== [PASSED] drm_mm ======================
[10:51:17] ============= drm_modes_analog_tv (5 subtests) =============
[10:51:17] [PASSED] drm_test_modes_analog_tv_mono_576i
[10:51:17] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[10:51:17] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[10:51:17] [PASSED] drm_test_modes_analog_tv_pal_576i
[10:51:17] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[10:51:17] =============== [PASSED] drm_modes_analog_tv ===============
[10:51:17] ============== drm_plane_helper (2 subtests) ===============
[10:51:17] =============== drm_test_check_plane_state  ================
[10:51:17] [PASSED] clipping_simple
[10:51:17] [PASSED] clipping_rotate_reflect
[10:51:17] [PASSED] positioning_simple
[10:51:17] [PASSED] upscaling
[10:51:17] [PASSED] downscaling
[10:51:17] [PASSED] rounding1
[10:51:17] [PASSED] rounding2
[10:51:17] [PASSED] rounding3
[10:51:17] [PASSED] rounding4
[10:51:17] =========== [PASSED] drm_test_check_plane_state ============
[10:51:17] =========== drm_test_check_invalid_plane_state  ============
[10:51:17] [PASSED] positioning_invalid
[10:51:17] [PASSED] upscaling_invalid
[10:51:17] [PASSED] downscaling_invalid
[10:51:17] ======= [PASSED] drm_test_check_invalid_plane_state ========
[10:51:17] ================ [PASSED] drm_plane_helper =================
[10:51:17] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[10:51:17] ====== drm_test_connector_helper_tv_get_modes_check  =======
[10:51:17] [PASSED] None
[10:51:17] [PASSED] PAL
[10:51:17] [PASSED] NTSC
[10:51:17] [PASSED] Both, NTSC Default
[10:51:17] [PASSED] Both, PAL Default
[10:51:17] [PASSED] Both, NTSC Default, with PAL on command-line
[10:51:17] [PASSED] Both, PAL Default, with NTSC on command-line
[10:51:17] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[10:51:17] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[10:51:17] ================== drm_rect (9 subtests) ===================
[10:51:17] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[10:51:17] [PASSED] drm_test_rect_clip_scaled_not_clipped
[10:51:17] [PASSED] drm_test_rect_clip_scaled_clipped
[10:51:17] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[10:51:17] ================= drm_test_rect_intersect  =================
[10:51:17] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[10:51:17] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[10:51:17] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[10:51:17] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[10:51:17] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[10:51:17] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[10:51:17] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[10:51:17] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[10:51:17] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[10:51:17] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[10:51:17] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[10:51:17] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[10:51:17] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[10:51:17] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[10:51:17] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[10:51:17] ============= [PASSED] drm_test_rect_intersect =============
[10:51:17] ================ drm_test_rect_calc_hscale  ================
[10:51:17] [PASSED] normal use
[10:51:17] [PASSED] out of max range
[10:51:17] [PASSED] out of min range
[10:51:17] [PASSED] zero dst
[10:51:17] [PASSED] negative src
[10:51:17] [PASSED] negative dst
[10:51:17] ============ [PASSED] drm_test_rect_calc_hscale ============
[10:51:17] ================ drm_test_rect_calc_vscale  ================
[10:51:17] [PASSED] normal use
[10:51:17] [PASSED] out of max range
[10:51:17] [PASSED] out of min range
[10:51:17] [PASSED] zero dst
[10:51:17] [PASSED] negative src
[10:51:17] [PASSED] negative dst
stty: 'standard input': Inappropriate ioctl for device
[10:51:17] ============ [PASSED] drm_test_rect_calc_vscale ============
[10:51:17] ================== drm_test_rect_rotate  ===================
[10:51:17] [PASSED] reflect-x
[10:51:17] [PASSED] reflect-y
[10:51:17] [PASSED] rotate-0
[10:51:17] [PASSED] rotate-90
[10:51:17] [PASSED] rotate-180
[10:51:17] [PASSED] rotate-270
[10:51:17] ============== [PASSED] drm_test_rect_rotate ===============
[10:51:17] ================ drm_test_rect_rotate_inv  =================
[10:51:17] [PASSED] reflect-x
[10:51:17] [PASSED] reflect-y
[10:51:17] [PASSED] rotate-0
[10:51:17] [PASSED] rotate-90
[10:51:17] [PASSED] rotate-180
[10:51:17] [PASSED] rotate-270
[10:51:17] ============ [PASSED] drm_test_rect_rotate_inv =============
[10:51:17] ==================== [PASSED] drm_rect =====================
[10:51:17] ============================================================
[10:51:17] Testing complete. Ran 602 tests: passed: 602
[10:51:17] Elapsed time: 22.522s total, 1.653s configuring, 20.699s building, 0.140s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[10:51:17] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:51:19] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
[10:51:26] Starting KUnit Kernel (1/1)...
[10:51:26] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:51:26] ================= ttm_device (5 subtests) ==================
[10:51:26] [PASSED] ttm_device_init_basic
[10:51:26] [PASSED] ttm_device_init_multiple
[10:51:26] [PASSED] ttm_device_fini_basic
[10:51:26] [PASSED] ttm_device_init_no_vma_man
[10:51:26] ================== ttm_device_init_pools  ==================
[10:51:26] [PASSED] No DMA allocations, no DMA32 required
[10:51:26] [PASSED] DMA allocations, DMA32 required
[10:51:26] [PASSED] No DMA allocations, DMA32 required
[10:51:26] [PASSED] DMA allocations, no DMA32 required
[10:51:26] ============== [PASSED] ttm_device_init_pools ==============
[10:51:26] =================== [PASSED] ttm_device ====================
[10:51:26] ================== ttm_pool (8 subtests) ===================
[10:51:26] ================== ttm_pool_alloc_basic  ===================
[10:51:26] [PASSED] One page
[10:51:26] [PASSED] More than one page
[10:51:26] [PASSED] Above the allocation limit
[10:51:26] [PASSED] One page, with coherent DMA mappings enabled
[10:51:26] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[10:51:26] ============== [PASSED] ttm_pool_alloc_basic ===============
[10:51:26] ============== ttm_pool_alloc_basic_dma_addr  ==============
[10:51:26] [PASSED] One page
[10:51:26] [PASSED] More than one page
[10:51:26] [PASSED] Above the allocation limit
[10:51:26] [PASSED] One page, with coherent DMA mappings enabled
[10:51:26] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[10:51:26] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[10:51:26] [PASSED] ttm_pool_alloc_order_caching_match
[10:51:26] [PASSED] ttm_pool_alloc_caching_mismatch
[10:51:26] [PASSED] ttm_pool_alloc_order_mismatch
[10:51:26] [PASSED] ttm_pool_free_dma_alloc
[10:51:26] [PASSED] ttm_pool_free_no_dma_alloc
[10:51:26] [PASSED] ttm_pool_fini_basic
[10:51:26] ==================== [PASSED] ttm_pool =====================
[10:51:26] ================ ttm_resource (8 subtests) =================
[10:51:26] ================= ttm_resource_init_basic  =================
[10:51:26] [PASSED] Init resource in TTM_PL_SYSTEM
[10:51:26] [PASSED] Init resource in TTM_PL_VRAM
[10:51:26] [PASSED] Init resource in a private placement
[10:51:26] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[10:51:26] ============= [PASSED] ttm_resource_init_basic =============
[10:51:26] [PASSED] ttm_resource_init_pinned
[10:51:26] [PASSED] ttm_resource_fini_basic
[10:51:26] [PASSED] ttm_resource_manager_init_basic
[10:51:26] [PASSED] ttm_resource_manager_usage_basic
[10:51:26] [PASSED] ttm_resource_manager_set_used_basic
[10:51:26] [PASSED] ttm_sys_man_alloc_basic
[10:51:26] [PASSED] ttm_sys_man_free_basic
[10:51:26] ================== [PASSED] ttm_resource ===================
[10:51:26] =================== ttm_tt (15 subtests) ===================
[10:51:26] ==================== ttm_tt_init_basic  ====================
[10:51:26] [PASSED] Page-aligned size
[10:51:26] [PASSED] Extra pages requested
[10:51:26] ================ [PASSED] ttm_tt_init_basic ================
[10:51:26] [PASSED] ttm_tt_init_misaligned
[10:51:26] [PASSED] ttm_tt_fini_basic
[10:51:26] [PASSED] ttm_tt_fini_sg
[10:51:26] [PASSED] ttm_tt_fini_shmem
[10:51:26] [PASSED] ttm_tt_create_basic
[10:51:26] [PASSED] ttm_tt_create_invalid_bo_type
[10:51:26] [PASSED] ttm_tt_create_ttm_exists
[10:51:26] [PASSED] ttm_tt_create_failed
[10:51:26] [PASSED] ttm_tt_destroy_basic
[10:51:26] [PASSED] ttm_tt_populate_null_ttm
[10:51:26] [PASSED] ttm_tt_populate_populated_ttm
[10:51:26] [PASSED] ttm_tt_unpopulate_basic
[10:51:26] [PASSED] ttm_tt_unpopulate_empty_ttm
[10:51:26] [PASSED] ttm_tt_swapin_basic
[10:51:26] ===================== [PASSED] ttm_tt ======================
[10:51:26] =================== ttm_bo (14 subtests) ===================
[10:51:26] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[10:51:26] [PASSED] Cannot be interrupted and sleeps
[10:51:26] [PASSED] Cannot be interrupted, locks straight away
[10:51:26] [PASSED] Can be interrupted, sleeps
[10:51:26] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[10:51:26] [PASSED] ttm_bo_reserve_locked_no_sleep
[10:51:26] [PASSED] ttm_bo_reserve_no_wait_ticket
[10:51:26] [PASSED] ttm_bo_reserve_double_resv
[10:51:26] [PASSED] ttm_bo_reserve_interrupted
[10:51:26] [PASSED] ttm_bo_reserve_deadlock
[10:51:26] [PASSED] ttm_bo_unreserve_basic
[10:51:26] [PASSED] ttm_bo_unreserve_pinned
[10:51:26] [PASSED] ttm_bo_unreserve_bulk
[10:51:26] [PASSED] ttm_bo_put_basic
[10:51:26] [PASSED] ttm_bo_put_shared_resv
[10:51:26] [PASSED] ttm_bo_pin_basic
[10:51:26] [PASSED] ttm_bo_pin_unpin_resource
[10:51:26] [PASSED] ttm_bo_multiple_pin_one_unpin
[10:51:26] ===================== [PASSED] ttm_bo ======================
[10:51:26] ============== ttm_bo_validate (22 subtests) ===============
[10:51:26] ============== ttm_bo_init_reserved_sys_man  ===============
[10:51:26] [PASSED] Buffer object for userspace
[10:51:26] [PASSED] Kernel buffer object
[10:51:26] [PASSED] Shared buffer object
[10:51:26] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[10:51:26] ============== ttm_bo_init_reserved_mock_man  ==============
[10:51:26] [PASSED] Buffer object for userspace
[10:51:26] [PASSED] Kernel buffer object
[10:51:26] [PASSED] Shared buffer object
[10:51:26] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[10:51:26] [PASSED] ttm_bo_init_reserved_resv
[10:51:26] ================== ttm_bo_validate_basic  ==================
[10:51:26] [PASSED] Buffer object for userspace
[10:51:26] [PASSED] Kernel buffer object
[10:51:26] [PASSED] Shared buffer object
[10:51:26] ============== [PASSED] ttm_bo_validate_basic ==============
[10:51:26] [PASSED] ttm_bo_validate_invalid_placement
[10:51:26] ============= ttm_bo_validate_same_placement  ==============
[10:51:26] [PASSED] System manager
[10:51:26] [PASSED] VRAM manager
[10:51:26] ========= [PASSED] ttm_bo_validate_same_placement ==========
[10:51:26] [PASSED] ttm_bo_validate_failed_alloc
[10:51:26] [PASSED] ttm_bo_validate_pinned
[10:51:26] [PASSED] ttm_bo_validate_busy_placement
[10:51:26] ================ ttm_bo_validate_multihop  =================
[10:51:26] [PASSED] Buffer object for userspace
[10:51:26] [PASSED] Kernel buffer object
[10:51:26] [PASSED] Shared buffer object
[10:51:26] ============ [PASSED] ttm_bo_validate_multihop =============
[10:51:26] ========== ttm_bo_validate_no_placement_signaled  ==========
[10:51:26] [PASSED] Buffer object in system domain, no page vector
[10:51:26] [PASSED] Buffer object in system domain with an existing page vector
[10:51:26] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[10:51:26] ======== ttm_bo_validate_no_placement_not_signaled  ========
[10:51:26] [PASSED] Buffer object for userspace
[10:51:26] [PASSED] Kernel buffer object
[10:51:26] [PASSED] Shared buffer object
[10:51:26] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[10:51:26] [PASSED] ttm_bo_validate_move_fence_signaled
[10:51:26] ========= ttm_bo_validate_move_fence_not_signaled  =========
[10:51:26] [PASSED] Waits for GPU
[10:51:26] [PASSED] Tries to lock straight away
[10:51:27] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[10:51:27] [PASSED] ttm_bo_validate_swapout
[10:51:27] [PASSED] ttm_bo_validate_happy_evict
[10:51:27] [PASSED] ttm_bo_validate_all_pinned_evict
[10:51:27] [PASSED] ttm_bo_validate_allowed_only_evict
[10:51:27] [PASSED] ttm_bo_validate_deleted_evict
[10:51:27] [PASSED] ttm_bo_validate_busy_domain_evict
[10:51:27] [PASSED] ttm_bo_validate_evict_gutting
[10:51:27] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[10:51:27] ================= [PASSED] ttm_bo_validate =================
[10:51:27] ============================================================
[10:51:27] Testing complete. Ran 102 tests: passed: 102
[10:51:27] Elapsed time: 9.996s total, 1.667s configuring, 7.712s building, 0.527s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


