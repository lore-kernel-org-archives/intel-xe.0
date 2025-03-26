Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC0CC3600C
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 22:34:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2F510E78B;
	Wed, 26 Mar 2025 22:34:16 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F5810E78A;
 Wed, 26 Mar 2025 22:34:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Ensure_fixed=5Fslice?=
 =?utf-8?q?=5Fmode_gets_set_after_ccs=5Fmode_change?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Mar 2025 22:34:15 -0000
Message-ID: <174302845507.7863.15458462430502548066@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250326222720.26913-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20250326222720.26913-1-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe: Ensure fixed_slice_mode gets set after ccs_mode change
URL   : https://patchwork.freedesktop.org/series/146830/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[22:33:08] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:33:12] Building KUnit Kernel ...
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

[22:33:39] Starting KUnit Kernel (1/1)...
[22:33:39] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:33:39] ================== guc_buf (11 subtests) ===================
[22:33:39] [PASSED] test_smallest
[22:33:39] [PASSED] test_largest
[22:33:39] [PASSED] test_granular
[22:33:39] [PASSED] test_unique
[22:33:39] [PASSED] test_overlap
[22:33:39] [PASSED] test_reusable
[22:33:39] [PASSED] test_too_big
[22:33:39] [PASSED] test_flush
[22:33:39] [PASSED] test_lookup
[22:33:39] [PASSED] test_data
[22:33:39] [PASSED] test_class
[22:33:39] ===================== [PASSED] guc_buf =====================
[22:33:39] =================== guc_dbm (7 subtests) ===================
[22:33:39] [PASSED] test_empty
[22:33:39] [PASSED] test_default
[22:33:39] ======================== test_size  ========================
[22:33:39] [PASSED] 4
[22:33:39] [PASSED] 8
[22:33:39] [PASSED] 32
[22:33:39] [PASSED] 256
[22:33:39] ==================== [PASSED] test_size ====================
[22:33:39] ======================= test_reuse  ========================
[22:33:39] [PASSED] 4
[22:33:39] [PASSED] 8
[22:33:39] [PASSED] 32
[22:33:39] [PASSED] 256
[22:33:39] =================== [PASSED] test_reuse ====================
[22:33:39] =================== test_range_overlap  ====================
[22:33:39] [PASSED] 4
[22:33:39] [PASSED] 8
[22:33:39] [PASSED] 32
[22:33:39] [PASSED] 256
[22:33:39] =============== [PASSED] test_range_overlap ================
[22:33:39] =================== test_range_compact  ====================
[22:33:39] [PASSED] 4
[22:33:39] [PASSED] 8
[22:33:39] [PASSED] 32
[22:33:39] [PASSED] 256
[22:33:39] =============== [PASSED] test_range_compact ================
[22:33:39] ==================== test_range_spare  =====================
[22:33:39] [PASSED] 4
[22:33:39] [PASSED] 8
[22:33:39] [PASSED] 32
[22:33:39] [PASSED] 256
[22:33:39] ================ [PASSED] test_range_spare =================
[22:33:39] ===================== [PASSED] guc_dbm =====================
[22:33:39] =================== guc_idm (6 subtests) ===================
[22:33:39] [PASSED] bad_init
[22:33:39] [PASSED] no_init
[22:33:39] [PASSED] init_fini
[22:33:39] [PASSED] check_used
[22:33:39] [PASSED] check_quota
[22:33:39] [PASSED] check_all
[22:33:39] ===================== [PASSED] guc_idm =====================
[22:33:39] ================== no_relay (3 subtests) ===================
[22:33:39] [PASSED] xe_drops_guc2pf_if_not_ready
[22:33:39] [PASSED] xe_drops_guc2vf_if_not_ready
[22:33:39] [PASSED] xe_rejects_send_if_not_ready
[22:33:39] ==================== [PASSED] no_relay =====================
[22:33:39] ================== pf_relay (14 subtests) ==================
[22:33:39] [PASSED] pf_rejects_guc2pf_too_short
[22:33:39] [PASSED] pf_rejects_guc2pf_too_long
[22:33:39] [PASSED] pf_rejects_guc2pf_no_payload
[22:33:39] [PASSED] pf_fails_no_payload
[22:33:39] [PASSED] pf_fails_bad_origin
[22:33:39] [PASSED] pf_fails_bad_type
[22:33:39] [PASSED] pf_txn_reports_error
[22:33:39] [PASSED] pf_txn_sends_pf2guc
[22:33:39] [PASSED] pf_sends_pf2guc
[22:33:39] [SKIPPED] pf_loopback_nop
[22:33:39] [SKIPPED] pf_loopback_echo
[22:33:39] [SKIPPED] pf_loopback_fail
[22:33:39] [SKIPPED] pf_loopback_busy
[22:33:39] [SKIPPED] pf_loopback_retry
[22:33:39] ==================== [PASSED] pf_relay =====================
[22:33:39] ================== vf_relay (3 subtests) ===================
[22:33:39] [PASSED] vf_rejects_guc2vf_too_short
[22:33:39] [PASSED] vf_rejects_guc2vf_too_long
[22:33:39] [PASSED] vf_rejects_guc2vf_no_payload
[22:33:39] ==================== [PASSED] vf_relay =====================
[22:33:39] ================= pf_service (11 subtests) =================
[22:33:39] [PASSED] pf_negotiate_any
[22:33:39] [PASSED] pf_negotiate_base_match
[22:33:39] [PASSED] pf_negotiate_base_newer
[22:33:39] [PASSED] pf_negotiate_base_next
[22:33:39] [SKIPPED] pf_negotiate_base_older
[22:33:39] [PASSED] pf_negotiate_base_prev
[22:33:39] [PASSED] pf_negotiate_latest_match
[22:33:39] [PASSED] pf_negotiate_latest_newer
[22:33:39] [PASSED] pf_negotiate_latest_next
[22:33:39] [SKIPPED] pf_negotiate_latest_older
[22:33:39] [SKIPPED] pf_negotiate_latest_prev
[22:33:39] =================== [PASSED] pf_service ====================
[22:33:39] ===================== lmtt (1 subtest) =====================
[22:33:39] ======================== test_ops  =========================
[22:33:39] [PASSED] 2-level
[22:33:39] [PASSED] multi-level
[22:33:39] ==================== [PASSED] test_ops =====================
[22:33:39] ====================== [PASSED] lmtt =======================
[22:33:39] =================== xe_mocs (2 subtests) ===================
[22:33:39] ================ xe_live_mocs_kernel_kunit  ================
[22:33:39] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[22:33:39] ================ xe_live_mocs_reset_kunit  =================
[22:33:39] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[22:33:39] ==================== [SKIPPED] xe_mocs =====================
[22:33:39] ================= xe_migrate (2 subtests) ==================
[22:33:39] ================= xe_migrate_sanity_kunit  =================
[22:33:39] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[22:33:39] ================== xe_validate_ccs_kunit  ==================
[22:33:39] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[22:33:39] =================== [SKIPPED] xe_migrate ===================
[22:33:39] ================== xe_dma_buf (1 subtest) ==================
[22:33:39] ==================== xe_dma_buf_kunit  =====================
[22:33:39] ================ [SKIPPED] xe_dma_buf_kunit ================
[22:33:39] =================== [SKIPPED] xe_dma_buf ===================
[22:33:39] ================= xe_bo_shrink (1 subtest) =================
[22:33:39] =================== xe_bo_shrink_kunit  ====================
[22:33:39] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[22:33:39] ================== [SKIPPED] xe_bo_shrink ==================
[22:33:39] ==================== xe_bo (2 subtests) ====================
[22:33:39] ================== xe_ccs_migrate_kunit  ===================
[22:33:39] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
stty: 'standard input': Inappropriate ioctl for device
[22:33:39] ==================== xe_bo_evict_kunit  ====================
[22:33:39] =============== [SKIPPED] xe_bo_evict_kunit ================
[22:33:39] ===================== [SKIPPED] xe_bo ======================
[22:33:39] ==================== args (11 subtests) ====================
[22:33:39] [PASSED] count_args_test
[22:33:39] [PASSED] call_args_example
[22:33:39] [PASSED] call_args_test
[22:33:39] [PASSED] drop_first_arg_example
[22:33:39] [PASSED] drop_first_arg_test
[22:33:39] [PASSED] first_arg_example
[22:33:39] [PASSED] first_arg_test
[22:33:39] [PASSED] last_arg_example
[22:33:39] [PASSED] last_arg_test
[22:33:39] [PASSED] pick_arg_example
[22:33:39] [PASSED] sep_comma_example
[22:33:39] ====================== [PASSED] args =======================
[22:33:39] =================== xe_pci (2 subtests) ====================
[22:33:39] [PASSED] xe_gmdid_graphics_ip
[22:33:39] [PASSED] xe_gmdid_media_ip
[22:33:39] ===================== [PASSED] xe_pci ======================
[22:33:39] =================== xe_rtp (2 subtests) ====================
[22:33:39] =============== xe_rtp_process_to_sr_tests  ================
[22:33:39] [PASSED] coalesce-same-reg
[22:33:39] [PASSED] no-match-no-add
[22:33:39] [PASSED] match-or
[22:33:39] [PASSED] match-or-xfail
[22:33:39] [PASSED] no-match-no-add-multiple-rules
[22:33:39] [PASSED] two-regs-two-entries
[22:33:39] [PASSED] clr-one-set-other
[22:33:39] [PASSED] set-field
[22:33:39] [PASSED] conflict-duplicate
[22:33:39] [PASSED] conflict-not-disjoint
[22:33:39] [PASSED] conflict-reg-type
[22:33:39] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[22:33:39] ================== xe_rtp_process_tests  ===================
[22:33:39] [PASSED] active1
[22:33:39] [PASSED] active2
[22:33:39] [PASSED] active-inactive
[22:33:39] [PASSED] inactive-active
[22:33:39] [PASSED] inactive-1st_or_active-inactive
[22:33:39] [PASSED] inactive-2nd_or_active-inactive
[22:33:39] [PASSED] inactive-last_or_active-inactive
[22:33:39] [PASSED] inactive-no_or_active-inactive
[22:33:39] ============== [PASSED] xe_rtp_process_tests ===============
[22:33:39] ===================== [PASSED] xe_rtp ======================
[22:33:39] ==================== xe_wa (1 subtest) =====================
[22:33:39] ======================== xe_wa_gt  =========================
[22:33:39] [PASSED] TIGERLAKE (B0)
[22:33:39] [PASSED] DG1 (A0)
[22:33:39] [PASSED] DG1 (B0)
[22:33:39] [PASSED] ALDERLAKE_S (A0)
[22:33:39] [PASSED] ALDERLAKE_S (B0)
[22:33:39] [PASSED] ALDERLAKE_S (C0)
[22:33:39] [PASSED] ALDERLAKE_S (D0)
[22:33:39] [PASSED] ALDERLAKE_P (A0)
[22:33:39] [PASSED] ALDERLAKE_P (B0)
[22:33:39] [PASSED] ALDERLAKE_P (C0)
[22:33:39] [PASSED] ALDERLAKE_S_RPLS (D0)
[22:33:39] [PASSED] ALDERLAKE_P_RPLU (E0)
[22:33:39] [PASSED] DG2_G10 (C0)
[22:33:39] [PASSED] DG2_G11 (B1)
[22:33:39] [PASSED] DG2_G12 (A1)
[22:33:39] [PASSED] METEORLAKE (g:A0, m:A0)
[22:33:39] [PASSED] METEORLAKE (g:A0, m:A0)
[22:33:39] [PASSED] METEORLAKE (g:A0, m:A0)
[22:33:39] [PASSED] LUNARLAKE (g:A0, m:A0)
[22:33:39] [PASSED] LUNARLAKE (g:B0, m:A0)
[22:33:39] [PASSED] BATTLEMAGE (g:A0, m:A1)
[22:33:39] ==================== [PASSED] xe_wa_gt =====================
[22:33:39] ====================== [PASSED] xe_wa ======================
[22:33:39] ============================================================
[22:33:39] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[22:33:39] Elapsed time: 30.784s total, 4.197s configuring, 26.322s building, 0.244s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[22:33:39] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:33:41] Building KUnit Kernel ...
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

[22:34:01] Starting KUnit Kernel (1/1)...
[22:34:01] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:34:02] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[22:34:02] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[22:34:02] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[22:34:02] =========== drm_validate_clone_mode (2 subtests) ===========
[22:34:02] ============== drm_test_check_in_clone_mode  ===============
[22:34:02] [PASSED] in_clone_mode
[22:34:02] [PASSED] not_in_clone_mode
[22:34:02] ========== [PASSED] drm_test_check_in_clone_mode ===========
[22:34:02] =============== drm_test_check_valid_clones  ===============
[22:34:02] [PASSED] not_in_clone_mode
[22:34:02] [PASSED] valid_clone
[22:34:02] [PASSED] invalid_clone
[22:34:02] =========== [PASSED] drm_test_check_valid_clones ===========
[22:34:02] ============= [PASSED] drm_validate_clone_mode =============
[22:34:02] ============= drm_validate_modeset (1 subtest) =============
[22:34:02] [PASSED] drm_test_check_connector_changed_modeset
[22:34:02] ============== [PASSED] drm_validate_modeset ===============
[22:34:02] ====== drm_test_bridge_get_current_state (2 subtests) ======
[22:34:02] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[22:34:02] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[22:34:02] ======== [PASSED] drm_test_bridge_get_current_state ========
[22:34:02] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[22:34:02] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[22:34:02] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[22:34:02] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[22:34:02] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[22:34:02] ================== drm_buddy (7 subtests) ==================
[22:34:02] [PASSED] drm_test_buddy_alloc_limit
[22:34:02] [PASSED] drm_test_buddy_alloc_optimistic
[22:34:02] [PASSED] drm_test_buddy_alloc_pessimistic
[22:34:02] [PASSED] drm_test_buddy_alloc_pathological
[22:34:02] [PASSED] drm_test_buddy_alloc_contiguous
[22:34:02] [PASSED] drm_test_buddy_alloc_clear
[22:34:02] [PASSED] drm_test_buddy_alloc_range_bias
[22:34:02] ==================== [PASSED] drm_buddy ====================
[22:34:02] ============= drm_cmdline_parser (40 subtests) =============
[22:34:02] [PASSED] drm_test_cmdline_force_d_only
[22:34:02] [PASSED] drm_test_cmdline_force_D_only_dvi
[22:34:02] [PASSED] drm_test_cmdline_force_D_only_hdmi
[22:34:02] [PASSED] drm_test_cmdline_force_D_only_not_digital
[22:34:02] [PASSED] drm_test_cmdline_force_e_only
[22:34:02] [PASSED] drm_test_cmdline_res
[22:34:02] [PASSED] drm_test_cmdline_res_vesa
[22:34:02] [PASSED] drm_test_cmdline_res_vesa_rblank
[22:34:02] [PASSED] drm_test_cmdline_res_rblank
[22:34:02] [PASSED] drm_test_cmdline_res_bpp
[22:34:02] [PASSED] drm_test_cmdline_res_refresh
[22:34:02] [PASSED] drm_test_cmdline_res_bpp_refresh
[22:34:02] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[22:34:02] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[22:34:02] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[22:34:02] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[22:34:02] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[22:34:02] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[22:34:02] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[22:34:02] [PASSED] drm_test_cmdline_res_margins_force_on
[22:34:02] [PASSED] drm_test_cmdline_res_vesa_margins
[22:34:02] [PASSED] drm_test_cmdline_name
[22:34:02] [PASSED] drm_test_cmdline_name_bpp
[22:34:02] [PASSED] drm_test_cmdline_name_option
[22:34:02] [PASSED] drm_test_cmdline_name_bpp_option
[22:34:02] [PASSED] drm_test_cmdline_rotate_0
[22:34:02] [PASSED] drm_test_cmdline_rotate_90
[22:34:02] [PASSED] drm_test_cmdline_rotate_180
[22:34:02] [PASSED] drm_test_cmdline_rotate_270
[22:34:02] [PASSED] drm_test_cmdline_hmirror
[22:34:02] [PASSED] drm_test_cmdline_vmirror
[22:34:02] [PASSED] drm_test_cmdline_margin_options
[22:34:02] [PASSED] drm_test_cmdline_multiple_options
[22:34:02] [PASSED] drm_test_cmdline_bpp_extra_and_option
[22:34:02] [PASSED] drm_test_cmdline_extra_and_option
[22:34:02] [PASSED] drm_test_cmdline_freestanding_options
[22:34:02] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[22:34:02] [PASSED] drm_test_cmdline_panel_orientation
[22:34:02] ================ drm_test_cmdline_invalid  =================
[22:34:02] [PASSED] margin_only
[22:34:02] [PASSED] interlace_only
[22:34:02] [PASSED] res_missing_x
[22:34:02] [PASSED] res_missing_y
[22:34:02] [PASSED] res_bad_y
[22:34:02] [PASSED] res_missing_y_bpp
[22:34:02] [PASSED] res_bad_bpp
[22:34:02] [PASSED] res_bad_refresh
[22:34:02] [PASSED] res_bpp_refresh_force_on_off
[22:34:02] [PASSED] res_invalid_mode
[22:34:02] [PASSED] res_bpp_wrong_place_mode
[22:34:02] [PASSED] name_bpp_refresh
[22:34:02] [PASSED] name_refresh
[22:34:02] [PASSED] name_refresh_wrong_mode
[22:34:02] [PASSED] name_refresh_invalid_mode
[22:34:02] [PASSED] rotate_multiple
[22:34:02] [PASSED] rotate_invalid_val
[22:34:02] [PASSED] rotate_truncated
[22:34:02] [PASSED] invalid_option
[22:34:02] [PASSED] invalid_tv_option
[22:34:02] [PASSED] truncated_tv_option
[22:34:02] ============ [PASSED] drm_test_cmdline_invalid =============
[22:34:02] =============== drm_test_cmdline_tv_options  ===============
[22:34:02] [PASSED] NTSC
[22:34:02] [PASSED] NTSC_443
[22:34:02] [PASSED] NTSC_J
[22:34:02] [PASSED] PAL
[22:34:02] [PASSED] PAL_M
[22:34:02] [PASSED] PAL_N
[22:34:02] [PASSED] SECAM
[22:34:02] [PASSED] MONO_525
[22:34:02] [PASSED] MONO_625
[22:34:02] =========== [PASSED] drm_test_cmdline_tv_options ===========
[22:34:02] =============== [PASSED] drm_cmdline_parser ================
[22:34:02] ========== drmm_connector_hdmi_init (20 subtests) ==========
[22:34:02] [PASSED] drm_test_connector_hdmi_init_valid
[22:34:02] [PASSED] drm_test_connector_hdmi_init_bpc_8
[22:34:02] [PASSED] drm_test_connector_hdmi_init_bpc_10
[22:34:02] [PASSED] drm_test_connector_hdmi_init_bpc_12
[22:34:02] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[22:34:02] [PASSED] drm_test_connector_hdmi_init_bpc_null
[22:34:02] [PASSED] drm_test_connector_hdmi_init_formats_empty
[22:34:02] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[22:34:02] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[22:34:02] [PASSED] supported_formats=0x9 yuv420_allowed=1
[22:34:02] [PASSED] supported_formats=0x9 yuv420_allowed=0
[22:34:02] [PASSED] supported_formats=0x3 yuv420_allowed=1
[22:34:02] [PASSED] supported_formats=0x3 yuv420_allowed=0
[22:34:02] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[22:34:02] [PASSED] drm_test_connector_hdmi_init_null_ddc
[22:34:02] [PASSED] drm_test_connector_hdmi_init_null_product
[22:34:02] [PASSED] drm_test_connector_hdmi_init_null_vendor
[22:34:02] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[22:34:02] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[22:34:02] [PASSED] drm_test_connector_hdmi_init_product_valid
[22:34:02] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[22:34:02] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[22:34:02] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[22:34:02] ========= drm_test_connector_hdmi_init_type_valid  =========
[22:34:02] [PASSED] HDMI-A
[22:34:02] [PASSED] HDMI-B
[22:34:02] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[22:34:02] ======== drm_test_connector_hdmi_init_type_invalid  ========
[22:34:02] [PASSED] Unknown
[22:34:02] [PASSED] VGA
[22:34:02] [PASSED] DVI-I
[22:34:02] [PASSED] DVI-D
[22:34:02] [PASSED] DVI-A
[22:34:02] [PASSED] Composite
[22:34:02] [PASSED] SVIDEO
[22:34:02] [PASSED] LVDS
[22:34:02] [PASSED] Component
[22:34:02] [PASSED] DIN
[22:34:02] [PASSED] DP
[22:34:02] [PASSED] TV
[22:34:02] [PASSED] eDP
[22:34:02] [PASSED] Virtual
[22:34:02] [PASSED] DSI
[22:34:02] [PASSED] DPI
[22:34:02] [PASSED] Writeback
[22:34:02] [PASSED] SPI
[22:34:02] [PASSED] USB
[22:34:02] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[22:34:02] ============ [PASSED] drmm_connector_hdmi_init =============
[22:34:02] ============= drmm_connector_init (3 subtests) =============
[22:34:02] [PASSED] drm_test_drmm_connector_init
[22:34:02] [PASSED] drm_test_drmm_connector_init_null_ddc
[22:34:02] ========= drm_test_drmm_connector_init_type_valid  =========
[22:34:02] [PASSED] Unknown
[22:34:02] [PASSED] VGA
[22:34:02] [PASSED] DVI-I
[22:34:02] [PASSED] DVI-D
[22:34:02] [PASSED] DVI-A
[22:34:02] [PASSED] Composite
[22:34:02] [PASSED] SVIDEO
[22:34:02] [PASSED] LVDS
[22:34:02] [PASSED] Component
[22:34:02] [PASSED] DIN
[22:34:02] [PASSED] DP
[22:34:02] [PASSED] HDMI-A
[22:34:02] [PASSED] HDMI-B
[22:34:02] [PASSED] TV
[22:34:02] [PASSED] eDP
[22:34:02] [PASSED] Virtual
[22:34:02] [PASSED] DSI
[22:34:02] [PASSED] DPI
[22:34:02] [PASSED] Writeback
[22:34:02] [PASSED] SPI
[22:34:02] [PASSED] USB
[22:34:02] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[22:34:02] =============== [PASSED] drmm_connector_init ===============
[22:34:02] ========= drm_connector_dynamic_init (6 subtests) ==========
[22:34:02] [PASSED] drm_test_drm_connector_dynamic_init
[22:34:02] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[22:34:02] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[22:34:02] [PASSED] drm_test_drm_connector_dynamic_init_properties
[22:34:02] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[22:34:02] [PASSED] Unknown
[22:34:02] [PASSED] VGA
[22:34:02] [PASSED] DVI-I
[22:34:02] [PASSED] DVI-D
[22:34:02] [PASSED] DVI-A
[22:34:02] [PASSED] Composite
[22:34:02] [PASSED] SVIDEO
[22:34:02] [PASSED] LVDS
[22:34:02] [PASSED] Component
[22:34:02] [PASSED] DIN
[22:34:02] [PASSED] DP
[22:34:02] [PASSED] HDMI-A
[22:34:02] [PASSED] HDMI-B
[22:34:02] [PASSED] TV
[22:34:02] [PASSED] eDP
[22:34:02] [PASSED] Virtual
[22:34:02] [PASSED] DSI
[22:34:02] [PASSED] DPI
[22:34:02] [PASSED] Writeback
[22:34:02] [PASSED] SPI
[22:34:02] [PASSED] USB
[22:34:02] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[22:34:02] ======== drm_test_drm_connector_dynamic_init_name  =========
[22:34:02] [PASSED] Unknown
[22:34:02] [PASSED] VGA
[22:34:02] [PASSED] DVI-I
[22:34:02] [PASSED] DVI-D
[22:34:02] [PASSED] DVI-A
[22:34:02] [PASSED] Composite
[22:34:02] [PASSED] SVIDEO
[22:34:02] [PASSED] LVDS
[22:34:02] [PASSED] Component
[22:34:02] [PASSED] DIN
[22:34:02] [PASSED] DP
[22:34:02] [PASSED] HDMI-A
[22:34:02] [PASSED] HDMI-B
[22:34:02] [PASSED] TV
[22:34:02] [PASSED] eDP
[22:34:02] [PASSED] Virtual
[22:34:02] [PASSED] DSI
[22:34:02] [PASSED] DPI
[22:34:02] [PASSED] Writeback
[22:34:02] [PASSED] SPI
[22:34:02] [PASSED] USB
[22:34:02] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[22:34:02] =========== [PASSED] drm_connector_dynamic_init ============
[22:34:02] ==== drm_connector_dynamic_register_early (4 subtests) =====
[22:34:02] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[22:34:02] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[22:34:02] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[22:34:02] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[22:34:02] ====== [PASSED] drm_connector_dynamic_register_early =======
[22:34:02] ======= drm_connector_dynamic_register (7 subtests) ========
[22:34:02] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[22:34:02] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[22:34:02] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[22:34:02] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[22:34:02] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[22:34:02] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[22:34:02] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[22:34:02] ========= [PASSED] drm_connector_dynamic_register ==========
[22:34:02] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[22:34:02] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[22:34:02] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[22:34:02] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[22:34:02] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[22:34:02] ========== drm_test_get_tv_mode_from_name_valid  ===========
[22:34:02] [PASSED] NTSC
[22:34:02] [PASSED] NTSC-443
[22:34:02] [PASSED] NTSC-J
[22:34:02] [PASSED] PAL
[22:34:02] [PASSED] PAL-M
[22:34:02] [PASSED] PAL-N
[22:34:02] [PASSED] SECAM
[22:34:02] [PASSED] Mono
[22:34:02] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[22:34:02] [PASSED] drm_test_get_tv_mode_from_name_truncated
[22:34:02] ============ [PASSED] drm_get_tv_mode_from_name ============
[22:34:02] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[22:34:02] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[22:34:02] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[22:34:02] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[22:34:02] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[22:34:02] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[22:34:02] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[22:34:02] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[22:34:02] [PASSED] VIC 96
[22:34:02] [PASSED] VIC 97
[22:34:02] [PASSED] VIC 101
[22:34:02] [PASSED] VIC 102
[22:34:02] [PASSED] VIC 106
[22:34:02] [PASSED] VIC 107
[22:34:02] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[22:34:02] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[22:34:02] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[22:34:02] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[22:34:02] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[22:34:02] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[22:34:02] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[22:34:02] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[22:34:02] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[22:34:02] [PASSED] Automatic
[22:34:02] [PASSED] Full
[22:34:02] [PASSED] Limited 16:235
[22:34:02] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[22:34:02] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[22:34:02] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[22:34:02] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[22:34:02] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[22:34:02] [PASSED] RGB
[22:34:02] [PASSED] YUV 4:2:0
[22:34:02] [PASSED] YUV 4:2:2
[22:34:02] [PASSED] YUV 4:4:4
[22:34:02] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[22:34:02] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[22:34:02] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[22:34:02] ============= drm_damage_helper (21 subtests) ==============
[22:34:02] [PASSED] drm_test_damage_iter_no_damage
[22:34:02] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[22:34:02] [PASSED] drm_test_damage_iter_no_damage_src_moved
[22:34:02] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[22:34:02] [PASSED] drm_test_damage_iter_no_damage_not_visible
[22:34:02] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[22:34:02] [PASSED] drm_test_damage_iter_no_damage_no_fb
[22:34:02] [PASSED] drm_test_damage_iter_simple_damage
[22:34:02] [PASSED] drm_test_damage_iter_single_damage
[22:34:02] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[22:34:02] [PASSED] drm_test_damage_iter_single_damage_outside_src
[22:34:02] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[22:34:02] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[22:34:02] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[22:34:02] [PASSED] drm_test_damage_iter_single_damage_src_moved
[22:34:02] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[22:34:02] [PASSED] drm_test_damage_iter_damage
[22:34:02] [PASSED] drm_test_damage_iter_damage_one_intersect
[22:34:02] [PASSED] drm_test_damage_iter_damage_one_outside
[22:34:02] [PASSED] drm_test_damage_iter_damage_src_moved
[22:34:02] [PASSED] drm_test_damage_iter_damage_not_visible
[22:34:02] ================ [PASSED] drm_damage_helper ================
[22:34:02] ============== drm_dp_mst_helper (3 subtests) ==============
[22:34:02] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[22:34:02] [PASSED] Clock 154000 BPP 30 DSC disabled
[22:34:02] [PASSED] Clock 234000 BPP 30 DSC disabled
[22:34:02] [PASSED] Clock 297000 BPP 24 DSC disabled
[22:34:02] [PASSED] Clock 332880 BPP 24 DSC enabled
[22:34:02] [PASSED] Clock 324540 BPP 24 DSC enabled
[22:34:02] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[22:34:02] ============== drm_test_dp_mst_calc_pbn_div  ===============
[22:34:02] [PASSED] Link rate 2000000 lane count 4
[22:34:02] [PASSED] Link rate 2000000 lane count 2
[22:34:02] [PASSED] Link rate 2000000 lane count 1
[22:34:02] [PASSED] Link rate 1350000 lane count 4
[22:34:02] [PASSED] Link rate 1350000 lane count 2
[22:34:02] [PASSED] Link rate 1350000 lane count 1
[22:34:02] [PASSED] Link rate 1000000 lane count 4
[22:34:02] [PASSED] Link rate 1000000 lane count 2
[22:34:02] [PASSED] Link rate 1000000 lane count 1
[22:34:02] [PASSED] Link rate 810000 lane count 4
[22:34:02] [PASSED] Link rate 810000 lane count 2
[22:34:02] [PASSED] Link rate 810000 lane count 1
[22:34:02] [PASSED] Link rate 540000 lane count 4
[22:34:02] [PASSED] Link rate 540000 lane count 2
[22:34:02] [PASSED] Link rate 540000 lane count 1
[22:34:02] [PASSED] Link rate 270000 lane count 4
[22:34:02] [PASSED] Link rate 270000 lane count 2
[22:34:02] [PASSED] Link rate 270000 lane count 1
[22:34:02] [PASSED] Link rate 162000 lane count 4
[22:34:02] [PASSED] Link rate 162000 lane count 2
[22:34:02] [PASSED] Link rate 162000 lane count 1
[22:34:02] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[22:34:02] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[22:34:02] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[22:34:02] [PASSED] DP_POWER_UP_PHY with port number
[22:34:02] [PASSED] DP_POWER_DOWN_PHY with port number
[22:34:02] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[22:34:02] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[22:34:02] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[22:34:02] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[22:34:02] [PASSED] DP_QUERY_PAYLOAD with port number
[22:34:02] [PASSED] DP_QUERY_PAYLOAD with VCPI
[22:34:02] [PASSED] DP_REMOTE_DPCD_READ with port number
[22:34:02] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[22:34:02] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[22:34:02] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[22:34:02] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[22:34:02] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[22:34:02] [PASSED] DP_REMOTE_I2C_READ with port number
[22:34:02] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[22:34:02] [PASSED] DP_REMOTE_I2C_READ with transactions array
[22:34:02] [PASSED] DP_REMOTE_I2C_WRITE with port number
[22:34:02] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[22:34:02] [PASSED] DP_REMOTE_I2C_WRITE with data array
[22:34:02] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[22:34:02] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[22:34:02] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[22:34:02] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[22:34:02] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[22:34:02] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[22:34:02] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[22:34:02] ================ [PASSED] drm_dp_mst_helper ================
[22:34:02] ================== drm_exec (7 subtests) ===================
[22:34:02] [PASSED] sanitycheck
[22:34:02] [PASSED] test_lock
[22:34:02] [PASSED] test_lock_unlock
[22:34:02] [PASSED] test_duplicates
[22:34:02] [PASSED] test_prepare
[22:34:02] [PASSED] test_prepare_array
[22:34:02] [PASSED] test_multiple_loops
[22:34:02] ==================== [PASSED] drm_exec =====================
[22:34:02] =========== drm_format_helper_test (18 subtests) ===========
[22:34:02] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[22:34:02] [PASSED] single_pixel_source_buffer
[22:34:02] [PASSED] single_pixel_clip_rectangle
[22:34:02] [PASSED] well_known_colors
[22:34:02] [PASSED] destination_pitch
[22:34:02] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[22:34:02] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[22:34:02] [PASSED] single_pixel_source_buffer
[22:34:02] [PASSED] single_pixel_clip_rectangle
[22:34:02] [PASSED] well_known_colors
[22:34:02] [PASSED] destination_pitch
[22:34:02] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[22:34:02] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[22:34:02] [PASSED] single_pixel_source_buffer
[22:34:02] [PASSED] single_pixel_clip_rectangle
[22:34:02] [PASSED] well_known_colors
[22:34:02] [PASSED] destination_pitch
[22:34:02] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[22:34:02] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[22:34:02] [PASSED] single_pixel_source_buffer
[22:34:02] [PASSED] single_pixel_clip_rectangle
[22:34:02] [PASSED] well_known_colors
[22:34:02] [PASSED] destination_pitch
[22:34:02] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[22:34:02] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[22:34:02] [PASSED] single_pixel_source_buffer
[22:34:02] [PASSED] single_pixel_clip_rectangle
[22:34:02] [PASSED] well_known_colors
[22:34:02] [PASSED] destination_pitch
[22:34:02] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[22:34:02] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[22:34:02] [PASSED] single_pixel_source_buffer
[22:34:02] [PASSED] single_pixel_clip_rectangle
[22:34:02] [PASSED] well_known_colors
[22:34:02] [PASSED] destination_pitch
[22:34:02] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[22:34:02] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[22:34:02] [PASSED] single_pixel_source_buffer
[22:34:02] [PASSED] single_pixel_clip_rectangle
[22:34:02] [PASSED] well_known_colors
[22:34:02] [PASSED] destination_pitch
[22:34:02] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[22:34:02] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[22:34:02] [PASSED] single_pixel_source_buffer
[22:34:02] [PASSED] single_pixel_clip_rectangle
[22:34:02] [PASSED] well_known_colors
[22:34:02] [PASSED] destination_pitch
[22:34:02] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[22:34:02] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[22:34:02] [PASSED] single_pixel_source_buffer
[22:34:02] [PASSED] single_pixel_clip_rectangle
[22:34:02] [PASSED] well_known_colors
[22:34:02] [PASSED] destination_pitch
[22:34:02] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[22:34:02] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[22:34:02] [PASSED] single_pixel_source_buffer
[22:34:02] [PASSED] single_pixel_clip_rectangle
[22:34:02] [PASSED] well_known_colors
[22:34:02] [PASSED] destination_pitch
[22:34:02] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[22:34:02] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[22:34:02] [PASSED] single_pixel_source_buffer
[22:34:02] [PASSED] single_pixel_clip_rectangle
[22:34:02] [PASSED] well_known_colors
[22:34:02] [PASSED] destination_pitch
[22:34:02] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[22:34:02] ============== drm_test_fb_xrgb8888_to_mono  ===============
[22:34:02] [PASSED] single_pixel_source_buffer
[22:34:02] [PASSED] single_pixel_clip_rectangle
[22:34:02] [PASSED] well_known_colors
[22:34:02] [PASSED] destination_pitch
[22:34:02] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[22:34:02] ==================== drm_test_fb_swab  =====================
[22:34:02] [PASSED] single_pixel_source_buffer
[22:34:02] [PASSED] single_pixel_clip_rectangle
[22:34:02] [PASSED] well_known_colors
[22:34:02] [PASSED] destination_pitch
[22:34:02] ================ [PASSED] drm_test_fb_swab =================
[22:34:02] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[22:34:02] [PASSED] single_pixel_source_buffer
[22:34:02] [PASSED] single_pixel_clip_rectangle
[22:34:02] [PASSED] well_known_colors
[22:34:02] [PASSED] destination_pitch
[22:34:02] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[22:34:02] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[22:34:02] [PASSED] single_pixel_source_buffer
[22:34:02] [PASSED] single_pixel_clip_rectangle
[22:34:02] [PASSED] well_known_colors
[22:34:02] [PASSED] destination_pitch
[22:34:02] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[22:34:02] ================= drm_test_fb_clip_offset  =================
[22:34:02] [PASSED] pass through
[22:34:02] [PASSED] horizontal offset
[22:34:02] [PASSED] vertical offset
[22:34:02] [PASSED] horizontal and vertical offset
[22:34:02] [PASSED] horizontal offset (custom pitch)
[22:34:02] [PASSED] vertical offset (custom pitch)
[22:34:02] [PASSED] horizontal and vertical offset (custom pitch)
[22:34:02] ============= [PASSED] drm_test_fb_clip_offset =============
[22:34:02] ============== drm_test_fb_build_fourcc_list  ==============
[22:34:02] [PASSED] no native formats
[22:34:02] [PASSED] XRGB8888 as native format
[22:34:02] [PASSED] remove duplicates
[22:34:02] [PASSED] convert alpha formats
[22:34:02] [PASSED] random formats
[22:34:02] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[22:34:02] =================== drm_test_fb_memcpy  ====================
[22:34:02] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[22:34:02] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[22:34:02] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[22:34:02] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[22:34:02] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[22:34:02] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[22:34:02] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[22:34:02] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[22:34:02] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[22:34:02] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[22:34:02] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[22:34:02] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[22:34:02] =============== [PASSED] drm_test_fb_memcpy ================
[22:34:02] ============= [PASSED] drm_format_helper_test ==============
[22:34:02] ================= drm_format (18 subtests) =================
[22:34:02] [PASSED] drm_test_format_block_width_invalid
[22:34:02] [PASSED] drm_test_format_block_width_one_plane
[22:34:02] [PASSED] drm_test_format_block_width_two_plane
[22:34:02] [PASSED] drm_test_format_block_width_three_plane
[22:34:02] [PASSED] drm_test_format_block_width_tiled
[22:34:02] [PASSED] drm_test_format_block_height_invalid
[22:34:02] [PASSED] drm_test_format_block_height_one_plane
[22:34:02] [PASSED] drm_test_format_block_height_two_plane
[22:34:02] [PASSED] drm_test_format_block_height_three_plane
[22:34:02] [PASSED] drm_test_format_block_height_tiled
[22:34:02] [PASSED] drm_test_format_min_pitch_invalid
[22:34:02] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[22:34:02] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[22:34:02] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[22:34:02] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[22:34:02] [PASSED] drm_test_format_min_pitch_two_plane
[22:34:02] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[22:34:02] [PASSED] drm_test_format_min_pitch_tiled
[22:34:02] =================== [PASSED] drm_format ====================
[22:34:02] ============== drm_framebuffer (10 subtests) ===============
[22:34:02] ========== drm_test_framebuffer_check_src_coords  ==========
[22:34:02] [PASSED] Success: source fits into fb
[22:34:02] [PASSED] Fail: overflowing fb with x-axis coordinate
[22:34:02] [PASSED] Fail: overflowing fb with y-axis coordinate
[22:34:02] [PASSED] Fail: overflowing fb with source width
[22:34:02] [PASSED] Fail: overflowing fb with source height
[22:34:02] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[22:34:02] [PASSED] drm_test_framebuffer_cleanup
[22:34:02] =============== drm_test_framebuffer_create  ===============
[22:34:02] [PASSED] ABGR8888 normal sizes
[22:34:02] [PASSED] ABGR8888 max sizes
[22:34:02] [PASSED] ABGR8888 pitch greater than min required
[22:34:02] [PASSED] ABGR8888 pitch less than min required
[22:34:02] [PASSED] ABGR8888 Invalid width
[22:34:02] [PASSED] ABGR8888 Invalid buffer handle
[22:34:02] [PASSED] No pixel format
[22:34:02] [PASSED] ABGR8888 Width 0
[22:34:02] [PASSED] ABGR8888 Height 0
[22:34:02] [PASSED] ABGR8888 Out of bound height * pitch combination
[22:34:02] [PASSED] ABGR8888 Large buffer offset
[22:34:02] [PASSED] ABGR8888 Buffer offset for inexistent plane
[22:34:02] [PASSED] ABGR8888 Invalid flag
[22:34:02] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[22:34:02] [PASSED] ABGR8888 Valid buffer modifier
[22:34:02] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[22:34:02] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[22:34:02] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[22:34:02] [PASSED] NV12 Normal sizes
[22:34:02] [PASSED] NV12 Max sizes
[22:34:02] [PASSED] NV12 Invalid pitch
[22:34:02] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[22:34:02] [PASSED] NV12 different  modifier per-plane
[22:34:02] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[22:34:02] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[22:34:02] [PASSED] NV12 Modifier for inexistent plane
[22:34:02] [PASSED] NV12 Handle for inexistent plane
[22:34:02] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[22:34:02] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[22:34:02] [PASSED] YVU420 Normal sizes
[22:34:02] [PASSED] YVU420 Max sizes
[22:34:02] [PASSED] YVU420 Invalid pitch
[22:34:02] [PASSED] YVU420 Different pitches
[22:34:02] [PASSED] YVU420 Different buffer offsets/pitches
[22:34:02] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[22:34:02] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[22:34:02] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[22:34:02] [PASSED] YVU420 Valid modifier
[22:34:02] [PASSED] YVU420 Different modifiers per plane
[22:34:02] [PASSED] YVU420 Modifier for inexistent plane
[22:34:02] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[22:34:02] [PASSED] X0L2 Normal sizes
[22:34:02] [PASSED] X0L2 Max sizes
[22:34:02] [PASSED] X0L2 Invalid pitch
[22:34:02] [PASSED] X0L2 Pitch greater than minimum required
[22:34:02] [PASSED] X0L2 Handle for inexistent plane
[22:34:02] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[22:34:02] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[22:34:02] [PASSED] X0L2 Valid modifier
[22:34:02] [PASSED] X0L2 Modifier for inexistent plane
[22:34:02] =========== [PASSED] drm_test_framebuffer_create ===========
[22:34:02] [PASSED] drm_test_framebuffer_free
[22:34:02] [PASSED] drm_test_framebuffer_init
[22:34:02] [PASSED] drm_test_framebuffer_init_bad_format
[22:34:02] [PASSED] drm_test_framebuffer_init_dev_mismatch
[22:34:02] [PASSED] drm_test_framebuffer_lookup
[22:34:02] [PASSED] drm_test_framebuffer_lookup_inexistent
[22:34:02] [PASSED] drm_test_framebuffer_modifiers_not_supported
[22:34:02] ================= [PASSED] drm_framebuffer =================
[22:34:02] ================ drm_gem_shmem (8 subtests) ================
[22:34:02] [PASSED] drm_gem_shmem_test_obj_create
[22:34:02] [PASSED] drm_gem_shmem_test_obj_create_private
[22:34:02] [PASSED] drm_gem_shmem_test_pin_pages
[22:34:02] [PASSED] drm_gem_shmem_test_vmap
[22:34:02] [PASSED] drm_gem_shmem_test_get_pages_sgt
[22:34:02] [PASSED] drm_gem_shmem_test_get_sg_table
[22:34:02] [PASSED] drm_gem_shmem_test_madvise
[22:34:02] [PASSED] drm_gem_shmem_test_purge
[22:34:02] ================== [PASSED] drm_gem_shmem ==================
[22:34:02] === drm_atomic_helper_connector_hdmi_check (23 subtests) ===
[22:34:02] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[22:34:02] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[22:34:02] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[22:34:02] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[22:34:02] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[22:34:02] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[22:34:02] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[22:34:02] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[22:34:02] [PASSED] drm_test_check_disable_connector
[22:34:02] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[22:34:02] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[22:34:02] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[22:34:02] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[22:34:02] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[22:34:02] [PASSED] drm_test_check_output_bpc_dvi
[22:34:02] [PASSED] drm_test_check_output_bpc_format_vic_1
[22:34:02] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[22:34:02] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[22:34:02] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[22:34:02] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[22:34:02] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[22:34:02] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[22:34:02] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[22:34:02] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[22:34:02] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[22:34:02] [PASSED] drm_test_check_broadcast_rgb_value
[22:34:02] [PASSED] drm_test_check_bpc_8_value
[22:34:02] [PASSED] drm_test_check_bpc_10_value
[22:34:02] [PASSED] drm_test_check_bpc_12_value
[22:34:02] [PASSED] drm_test_check_format_value
[22:34:02] [PASSED] drm_test_check_tmds_char_value
[22:34:02] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[22:34:02] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[22:34:02] [PASSED] drm_test_check_mode_valid
[22:34:02] [PASSED] drm_test_check_mode_valid_reject
[22:34:02] [PASSED] drm_test_check_mode_valid_reject_rate
[22:34:02] [PASSED] drm_test_check_mode_valid_reject_max_clock
[22:34:02] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[22:34:02] ================= drm_managed (2 subtests) =================
[22:34:02] [PASSED] drm_test_managed_release_action
[22:34:02] [PASSED] drm_test_managed_run_action
[22:34:02] =================== [PASSED] drm_managed ===================
[22:34:02] =================== drm_mm (6 subtests) ====================
[22:34:02] [PASSED] drm_test_mm_init
[22:34:02] [PASSED] drm_test_mm_debug
[22:34:02] [PASSED] drm_test_mm_align32
[22:34:02] [PASSED] drm_test_mm_align64
[22:34:02] [PASSED] drm_test_mm_lowest
[22:34:02] [PASSED] drm_test_mm_highest
[22:34:02] ===================== [PASSED] drm_mm ======================
[22:34:02] ============= drm_modes_analog_tv (5 subtests) =============
[22:34:02] [PASSED] drm_test_modes_analog_tv_mono_576i
[22:34:02] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[22:34:02] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[22:34:02] [PASSED] drm_test_modes_analog_tv_pal_576i
[22:34:02] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[22:34:02] =============== [PASSED] drm_modes_analog_tv ===============
[22:34:02] ============== drm_plane_helper (2 subtests) ===============
[22:34:02] =============== drm_test_check_plane_state  ================
[22:34:02] [PASSED] clipping_simple
[22:34:02] [PASSED] clipping_rotate_reflect
[22:34:02] [PASSED] positioning_simple
[22:34:02] [PASSED] upscaling
[22:34:02] [PASSED] downscaling
[22:34:02] [PASSED] rounding1
[22:34:02] [PASSED] rounding2
[22:34:02] [PASSED] rounding3
[22:34:02] [PASSED] rounding4
[22:34:02] =========== [PASSED] drm_test_check_plane_state ============
[22:34:02] =========== drm_test_check_invalid_plane_state  ============
[22:34:02] [PASSED] positioning_invalid
[22:34:02] [PASSED] upscaling_invalid
[22:34:02] [PASSED] downscaling_invalid
[22:34:02] ======= [PASSED] drm_test_check_invalid_plane_state ========
[22:34:02] ================ [PASSED] drm_plane_helper =================
[22:34:02] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[22:34:02] ====== drm_test_connector_helper_tv_get_modes_check  =======
[22:34:02] [PASSED] None
[22:34:02] [PASSED] PAL
[22:34:02] [PASSED] NTSC
[22:34:02] [PASSED] Both, NTSC Default
[22:34:02] [PASSED] Both, PAL Default
[22:34:02] [PASSED] Both, NTSC Default, with PAL on command-line
[22:34:02] [PASSED] Both, PAL Default, with NTSC on command-line
[22:34:02] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[22:34:02] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[22:34:02] ================== drm_rect (9 subtests) ===================
[22:34:02] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[22:34:02] [PASSED] drm_test_rect_clip_scaled_not_clipped
[22:34:02] [PASSED] drm_test_rect_clip_scaled_clipped
[22:34:02] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[22:34:02] ================= drm_test_rect_intersect  =================
[22:34:02] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[22:34:02] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[22:34:02] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[22:34:02] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[22:34:02] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[22:34:02] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[22:34:02] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[22:34:02] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[22:34:02] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[22:34:02] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[22:34:02] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[22:34:02] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[22:34:02] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[22:34:02] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
stty: 'standard input': Inappropriate ioctl for device
[22:34:02] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[22:34:02] ============= [PASSED] drm_test_rect_intersect =============
[22:34:02] ================ drm_test_rect_calc_hscale  ================
[22:34:02] [PASSED] normal use
[22:34:02] [PASSED] out of max range
[22:34:02] [PASSED] out of min range
[22:34:02] [PASSED] zero dst
[22:34:02] [PASSED] negative src
[22:34:02] [PASSED] negative dst
[22:34:02] ============ [PASSED] drm_test_rect_calc_hscale ============
[22:34:02] ================ drm_test_rect_calc_vscale  ================
[22:34:02] [PASSED] normal use
[22:34:02] [PASSED] out of max range
[22:34:02] [PASSED] out of min range
[22:34:02] [PASSED] zero dst
[22:34:02] [PASSED] negative src
[22:34:02] [PASSED] negative dst
[22:34:02] ============ [PASSED] drm_test_rect_calc_vscale ============
[22:34:02] ================== drm_test_rect_rotate  ===================
[22:34:02] [PASSED] reflect-x
[22:34:02] [PASSED] reflect-y
[22:34:02] [PASSED] rotate-0
[22:34:02] [PASSED] rotate-90
[22:34:02] [PASSED] rotate-180
[22:34:02] [PASSED] rotate-270
[22:34:02] ============== [PASSED] drm_test_rect_rotate ===============
[22:34:02] ================ drm_test_rect_rotate_inv  =================
[22:34:02] [PASSED] reflect-x
[22:34:02] [PASSED] reflect-y
[22:34:02] [PASSED] rotate-0
[22:34:02] [PASSED] rotate-90
[22:34:02] [PASSED] rotate-180
[22:34:02] [PASSED] rotate-270
[22:34:02] ============ [PASSED] drm_test_rect_rotate_inv =============
[22:34:02] ==================== [PASSED] drm_rect =====================
[22:34:02] ============================================================
[22:34:02] Testing complete. Ran 608 tests: passed: 608
[22:34:02] Elapsed time: 22.742s total, 1.710s configuring, 20.813s building, 0.185s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[22:34:02] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:34:03] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
[22:34:11] Starting KUnit Kernel (1/1)...
[22:34:11] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:34:11] ================= ttm_device (5 subtests) ==================
[22:34:11] [PASSED] ttm_device_init_basic
[22:34:11] [PASSED] ttm_device_init_multiple
[22:34:11] [PASSED] ttm_device_fini_basic
[22:34:11] [PASSED] ttm_device_init_no_vma_man
[22:34:11] ================== ttm_device_init_pools  ==================
[22:34:11] [PASSED] No DMA allocations, no DMA32 required
[22:34:11] [PASSED] DMA allocations, DMA32 required
[22:34:11] [PASSED] No DMA allocations, DMA32 required
[22:34:11] [PASSED] DMA allocations, no DMA32 required
[22:34:11] ============== [PASSED] ttm_device_init_pools ==============
[22:34:11] =================== [PASSED] ttm_device ====================
[22:34:11] ================== ttm_pool (8 subtests) ===================
[22:34:11] ================== ttm_pool_alloc_basic  ===================
[22:34:11] [PASSED] One page
[22:34:11] [PASSED] More than one page
[22:34:11] [PASSED] Above the allocation limit
[22:34:11] [PASSED] One page, with coherent DMA mappings enabled
[22:34:11] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[22:34:11] ============== [PASSED] ttm_pool_alloc_basic ===============
[22:34:11] ============== ttm_pool_alloc_basic_dma_addr  ==============
[22:34:11] [PASSED] One page
[22:34:11] [PASSED] More than one page
[22:34:11] [PASSED] Above the allocation limit
[22:34:11] [PASSED] One page, with coherent DMA mappings enabled
[22:34:11] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[22:34:11] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[22:34:11] [PASSED] ttm_pool_alloc_order_caching_match
[22:34:11] [PASSED] ttm_pool_alloc_caching_mismatch
[22:34:11] [PASSED] ttm_pool_alloc_order_mismatch
[22:34:11] [PASSED] ttm_pool_free_dma_alloc
[22:34:11] [PASSED] ttm_pool_free_no_dma_alloc
[22:34:11] [PASSED] ttm_pool_fini_basic
[22:34:11] ==================== [PASSED] ttm_pool =====================
[22:34:11] ================ ttm_resource (8 subtests) =================
[22:34:11] ================= ttm_resource_init_basic  =================
[22:34:11] [PASSED] Init resource in TTM_PL_SYSTEM
[22:34:11] [PASSED] Init resource in TTM_PL_VRAM
[22:34:11] [PASSED] Init resource in a private placement
[22:34:11] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[22:34:11] ============= [PASSED] ttm_resource_init_basic =============
[22:34:11] [PASSED] ttm_resource_init_pinned
[22:34:11] [PASSED] ttm_resource_fini_basic
[22:34:11] [PASSED] ttm_resource_manager_init_basic
[22:34:11] [PASSED] ttm_resource_manager_usage_basic
[22:34:11] [PASSED] ttm_resource_manager_set_used_basic
[22:34:11] [PASSED] ttm_sys_man_alloc_basic
[22:34:11] [PASSED] ttm_sys_man_free_basic
[22:34:11] ================== [PASSED] ttm_resource ===================
[22:34:11] =================== ttm_tt (15 subtests) ===================
[22:34:11] ==================== ttm_tt_init_basic  ====================
[22:34:11] [PASSED] Page-aligned size
[22:34:11] [PASSED] Extra pages requested
[22:34:11] ================ [PASSED] ttm_tt_init_basic ================
[22:34:11] [PASSED] ttm_tt_init_misaligned
[22:34:11] [PASSED] ttm_tt_fini_basic
[22:34:11] [PASSED] ttm_tt_fini_sg
[22:34:11] [PASSED] ttm_tt_fini_shmem
[22:34:11] [PASSED] ttm_tt_create_basic
[22:34:11] [PASSED] ttm_tt_create_invalid_bo_type
[22:34:11] [PASSED] ttm_tt_create_ttm_exists
[22:34:11] [PASSED] ttm_tt_create_failed
[22:34:11] [PASSED] ttm_tt_destroy_basic
[22:34:11] [PASSED] ttm_tt_populate_null_ttm
[22:34:11] [PASSED] ttm_tt_populate_populated_ttm
[22:34:11] [PASSED] ttm_tt_unpopulate_basic
[22:34:11] [PASSED] ttm_tt_unpopulate_empty_ttm
[22:34:11] [PASSED] ttm_tt_swapin_basic
[22:34:11] ===================== [PASSED] ttm_tt ======================
[22:34:11] =================== ttm_bo (14 subtests) ===================
[22:34:11] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[22:34:11] [PASSED] Cannot be interrupted and sleeps
[22:34:11] [PASSED] Cannot be interrupted, locks straight away
[22:34:11] [PASSED] Can be interrupted, sleeps
[22:34:11] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[22:34:11] [PASSED] ttm_bo_reserve_locked_no_sleep
[22:34:11] [PASSED] ttm_bo_reserve_no_wait_ticket
[22:34:11] [PASSED] ttm_bo_reserve_double_resv
[22:34:11] [PASSED] ttm_bo_reserve_interrupted
[22:34:11] [PASSED] ttm_bo_reserve_deadlock
[22:34:11] [PASSED] ttm_bo_unreserve_basic
[22:34:11] [PASSED] ttm_bo_unreserve_pinned
[22:34:11] [PASSED] ttm_bo_unreserve_bulk
[22:34:11] [PASSED] ttm_bo_put_basic
[22:34:11] [PASSED] ttm_bo_put_shared_resv
[22:34:11] [PASSED] ttm_bo_pin_basic
[22:34:11] [PASSED] ttm_bo_pin_unpin_resource
[22:34:11] [PASSED] ttm_bo_multiple_pin_one_unpin
[22:34:11] ===================== [PASSED] ttm_bo ======================
[22:34:11] ============== ttm_bo_validate (22 subtests) ===============
[22:34:11] ============== ttm_bo_init_reserved_sys_man  ===============
[22:34:11] [PASSED] Buffer object for userspace
[22:34:11] [PASSED] Kernel buffer object
[22:34:11] [PASSED] Shared buffer object
[22:34:11] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[22:34:11] ============== ttm_bo_init_reserved_mock_man  ==============
[22:34:11] [PASSED] Buffer object for userspace
[22:34:11] [PASSED] Kernel buffer object
[22:34:11] [PASSED] Shared buffer object
[22:34:11] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[22:34:11] [PASSED] ttm_bo_init_reserved_resv
[22:34:11] ================== ttm_bo_validate_basic  ==================
[22:34:11] [PASSED] Buffer object for userspace
[22:34:11] [PASSED] Kernel buffer object
[22:34:11] [PASSED] Shared buffer object
[22:34:11] ============== [PASSED] ttm_bo_validate_basic ==============
[22:34:11] [PASSED] ttm_bo_validate_invalid_placement
[22:34:11] ============= ttm_bo_validate_same_placement  ==============
[22:34:11] [PASSED] System manager
[22:34:11] [PASSED] VRAM manager
[22:34:11] ========= [PASSED] ttm_bo_validate_same_placement ==========
[22:34:11] [PASSED] ttm_bo_validate_failed_alloc
[22:34:11] [PASSED] ttm_bo_validate_pinned
[22:34:11] [PASSED] ttm_bo_validate_busy_placement
[22:34:11] ================ ttm_bo_validate_multihop  =================
[22:34:11] [PASSED] Buffer object for userspace
[22:34:11] [PASSED] Kernel buffer object
[22:34:11] [PASSED] Shared buffer object
[22:34:11] ============ [PASSED] ttm_bo_validate_multihop =============
[22:34:11] ========== ttm_bo_validate_no_placement_signaled  ==========
[22:34:11] [PASSED] Buffer object in system domain, no page vector
[22:34:11] [PASSED] Buffer object in system domain with an existing page vector
[22:34:11] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[22:34:11] ======== ttm_bo_validate_no_placement_not_signaled  ========
[22:34:11] [PASSED] Buffer object for userspace
[22:34:11] [PASSED] Kernel buffer object
[22:34:11] [PASSED] Shared buffer object
[22:34:11] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[22:34:11] [PASSED] ttm_bo_validate_move_fence_signaled
[22:34:11] ========= ttm_bo_validate_move_fence_not_signaled  =========
[22:34:11] [PASSED] Waits for GPU
[22:34:11] [PASSED] Tries to lock straight away
[22:34:12] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[22:34:12] [PASSED] ttm_bo_validate_swapout
[22:34:12] [PASSED] ttm_bo_validate_happy_evict
[22:34:12] [PASSED] ttm_bo_validate_all_pinned_evict
[22:34:12] [PASSED] ttm_bo_validate_allowed_only_evict
[22:34:12] [PASSED] ttm_bo_validate_deleted_evict
[22:34:12] [PASSED] ttm_bo_validate_busy_domain_evict
[22:34:12] [PASSED] ttm_bo_validate_evict_gutting
[22:34:12] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[22:34:12] ================= [PASSED] ttm_bo_validate =================
[22:34:12] ============================================================
[22:34:12] Testing complete. Ran 102 tests: passed: 102
[22:34:12] Elapsed time: 10.075s total, 1.693s configuring, 7.765s building, 0.524s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


