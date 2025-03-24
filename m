Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80842C36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 23:43:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4793610E096;
	Mon, 24 Mar 2025 23:43:04 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E19010E096;
 Mon, 24 Mar 2025 23:43:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/xe=5Fvm=3A_Implement_xe?=
 =?utf-8?q?=5Fvm=5Fget=5Fproperty=5Fioctl_=28rev13=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Mar 2025 23:43:03 -0000
Message-ID: <174285978338.75091.12962246000147589394@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250324230931.63840-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250324230931.63840-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_vm: Implement xe_vm_get_property_ioctl (rev13)
URL   : https://patchwork.freedesktop.org/series/145529/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[23:41:56] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:42:00] Building KUnit Kernel ...
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

[23:42:27] Starting KUnit Kernel (1/1)...
[23:42:27] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:42:27] ================== guc_buf (11 subtests) ===================
[23:42:27] [PASSED] test_smallest
[23:42:27] [PASSED] test_largest
[23:42:27] [PASSED] test_granular
[23:42:27] [PASSED] test_unique
[23:42:27] [PASSED] test_overlap
[23:42:27] [PASSED] test_reusable
[23:42:27] [PASSED] test_too_big
[23:42:27] [PASSED] test_flush
[23:42:27] [PASSED] test_lookup
[23:42:27] [PASSED] test_data
[23:42:27] [PASSED] test_class
[23:42:27] ===================== [PASSED] guc_buf =====================
[23:42:27] =================== guc_dbm (7 subtests) ===================
[23:42:27] [PASSED] test_empty
[23:42:27] [PASSED] test_default
[23:42:27] ======================== test_size  ========================
[23:42:27] [PASSED] 4
[23:42:27] [PASSED] 8
[23:42:27] [PASSED] 32
[23:42:27] [PASSED] 256
[23:42:27] ==================== [PASSED] test_size ====================
[23:42:27] ======================= test_reuse  ========================
[23:42:27] [PASSED] 4
[23:42:27] [PASSED] 8
[23:42:27] [PASSED] 32
[23:42:27] [PASSED] 256
[23:42:27] =================== [PASSED] test_reuse ====================
[23:42:27] =================== test_range_overlap  ====================
[23:42:27] [PASSED] 4
[23:42:27] [PASSED] 8
[23:42:27] [PASSED] 32
[23:42:27] [PASSED] 256
[23:42:27] =============== [PASSED] test_range_overlap ================
[23:42:27] =================== test_range_compact  ====================
[23:42:27] [PASSED] 4
[23:42:27] [PASSED] 8
[23:42:27] [PASSED] 32
[23:42:27] [PASSED] 256
[23:42:27] =============== [PASSED] test_range_compact ================
[23:42:27] ==================== test_range_spare  =====================
[23:42:27] [PASSED] 4
[23:42:27] [PASSED] 8
[23:42:27] [PASSED] 32
[23:42:27] [PASSED] 256
[23:42:27] ================ [PASSED] test_range_spare =================
[23:42:27] ===================== [PASSED] guc_dbm =====================
[23:42:27] =================== guc_idm (6 subtests) ===================
[23:42:27] [PASSED] bad_init
[23:42:27] [PASSED] no_init
[23:42:27] [PASSED] init_fini
[23:42:27] [PASSED] check_used
[23:42:27] [PASSED] check_quota
[23:42:27] [PASSED] check_all
[23:42:27] ===================== [PASSED] guc_idm =====================
[23:42:27] ================== no_relay (3 subtests) ===================
[23:42:27] [PASSED] xe_drops_guc2pf_if_not_ready
[23:42:27] [PASSED] xe_drops_guc2vf_if_not_ready
[23:42:27] [PASSED] xe_rejects_send_if_not_ready
[23:42:27] ==================== [PASSED] no_relay =====================
[23:42:27] ================== pf_relay (14 subtests) ==================
[23:42:27] [PASSED] pf_rejects_guc2pf_too_short
[23:42:27] [PASSED] pf_rejects_guc2pf_too_long
[23:42:27] [PASSED] pf_rejects_guc2pf_no_payload
[23:42:27] [PASSED] pf_fails_no_payload
[23:42:27] [PASSED] pf_fails_bad_origin
[23:42:27] [PASSED] pf_fails_bad_type
[23:42:27] [PASSED] pf_txn_reports_error
[23:42:27] [PASSED] pf_txn_sends_pf2guc
[23:42:27] [PASSED] pf_sends_pf2guc
[23:42:27] [SKIPPED] pf_loopback_nop
[23:42:27] [SKIPPED] pf_loopback_echo
[23:42:27] [SKIPPED] pf_loopback_fail
[23:42:27] [SKIPPED] pf_loopback_busy
[23:42:27] [SKIPPED] pf_loopback_retry
[23:42:27] ==================== [PASSED] pf_relay =====================
[23:42:27] ================== vf_relay (3 subtests) ===================
[23:42:27] [PASSED] vf_rejects_guc2vf_too_short
[23:42:27] [PASSED] vf_rejects_guc2vf_too_long
[23:42:27] [PASSED] vf_rejects_guc2vf_no_payload
[23:42:27] ==================== [PASSED] vf_relay =====================
[23:42:27] ================= pf_service (11 subtests) =================
[23:42:27] [PASSED] pf_negotiate_any
[23:42:27] [PASSED] pf_negotiate_base_match
[23:42:27] [PASSED] pf_negotiate_base_newer
[23:42:27] [PASSED] pf_negotiate_base_next
[23:42:27] [SKIPPED] pf_negotiate_base_older
[23:42:27] [PASSED] pf_negotiate_base_prev
[23:42:27] [PASSED] pf_negotiate_latest_match
[23:42:27] [PASSED] pf_negotiate_latest_newer
[23:42:27] [PASSED] pf_negotiate_latest_next
[23:42:27] [SKIPPED] pf_negotiate_latest_older
[23:42:27] [SKIPPED] pf_negotiate_latest_prev
[23:42:27] =================== [PASSED] pf_service ====================
[23:42:27] ===================== lmtt (1 subtest) =====================
[23:42:27] ======================== test_ops  =========================
[23:42:27] [PASSED] 2-level
[23:42:27] [PASSED] multi-level
[23:42:27] ==================== [PASSED] test_ops =====================
[23:42:27] ====================== [PASSED] lmtt =======================
[23:42:27] =================== xe_mocs (2 subtests) ===================
[23:42:27] ================ xe_live_mocs_kernel_kunit  ================
[23:42:27] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[23:42:27] ================ xe_live_mocs_reset_kunit  =================
[23:42:27] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[23:42:27] ==================== [SKIPPED] xe_mocs =====================
[23:42:27] ================= xe_migrate (2 subtests) ==================
[23:42:27] ================= xe_migrate_sanity_kunit  =================
[23:42:27] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[23:42:27] ================== xe_validate_ccs_kunit  ==================
[23:42:27] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[23:42:27] =================== [SKIPPED] xe_migrate ===================
[23:42:27] ================== xe_dma_buf (1 subtest) ==================
[23:42:27] ==================== xe_dma_buf_kunit  =====================
[23:42:27] ================ [SKIPPED] xe_dma_buf_kunit ================
[23:42:27] =================== [SKIPPED] xe_dma_buf ===================
[23:42:27] ================= xe_bo_shrink (1 subtest) =================
[23:42:27] =================== xe_bo_shrink_kunit  ====================
[23:42:27] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[23:42:27] ================== [SKIPPED] xe_bo_shrink ==================
[23:42:27] ==================== xe_bo (2 subtests) ====================
[23:42:27] ================== xe_ccs_migrate_kunit  ===================
[23:42:27] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
stty: 'standard input': Inappropriate ioctl for device
[23:42:27] ==================== xe_bo_evict_kunit  ====================
[23:42:27] =============== [SKIPPED] xe_bo_evict_kunit ================
[23:42:27] ===================== [SKIPPED] xe_bo ======================
[23:42:27] ==================== args (11 subtests) ====================
[23:42:27] [PASSED] count_args_test
[23:42:27] [PASSED] call_args_example
[23:42:27] [PASSED] call_args_test
[23:42:27] [PASSED] drop_first_arg_example
[23:42:27] [PASSED] drop_first_arg_test
[23:42:27] [PASSED] first_arg_example
[23:42:27] [PASSED] first_arg_test
[23:42:27] [PASSED] last_arg_example
[23:42:27] [PASSED] last_arg_test
[23:42:27] [PASSED] pick_arg_example
[23:42:27] [PASSED] sep_comma_example
[23:42:27] ====================== [PASSED] args =======================
[23:42:27] =================== xe_pci (2 subtests) ====================
[23:42:27] [PASSED] xe_gmdid_graphics_ip
[23:42:27] [PASSED] xe_gmdid_media_ip
[23:42:27] ===================== [PASSED] xe_pci ======================
[23:42:27] =================== xe_rtp (2 subtests) ====================
[23:42:27] =============== xe_rtp_process_to_sr_tests  ================
[23:42:27] [PASSED] coalesce-same-reg
[23:42:27] [PASSED] no-match-no-add
[23:42:27] [PASSED] match-or
[23:42:27] [PASSED] match-or-xfail
[23:42:27] [PASSED] no-match-no-add-multiple-rules
[23:42:27] [PASSED] two-regs-two-entries
[23:42:27] [PASSED] clr-one-set-other
[23:42:27] [PASSED] set-field
[23:42:27] [PASSED] conflict-duplicate
[23:42:27] [PASSED] conflict-not-disjoint
[23:42:27] [PASSED] conflict-reg-type
[23:42:27] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[23:42:27] ================== xe_rtp_process_tests  ===================
[23:42:27] [PASSED] active1
[23:42:27] [PASSED] active2
[23:42:27] [PASSED] active-inactive
[23:42:27] [PASSED] inactive-active
[23:42:27] [PASSED] inactive-1st_or_active-inactive
[23:42:27] [PASSED] inactive-2nd_or_active-inactive
[23:42:27] [PASSED] inactive-last_or_active-inactive
[23:42:27] [PASSED] inactive-no_or_active-inactive
[23:42:27] ============== [PASSED] xe_rtp_process_tests ===============
[23:42:27] ===================== [PASSED] xe_rtp ======================
[23:42:27] ==================== xe_wa (1 subtest) =====================
[23:42:27] ======================== xe_wa_gt  =========================
[23:42:27] [PASSED] TIGERLAKE (B0)
[23:42:27] [PASSED] DG1 (A0)
[23:42:27] [PASSED] DG1 (B0)
[23:42:27] [PASSED] ALDERLAKE_S (A0)
[23:42:27] [PASSED] ALDERLAKE_S (B0)
[23:42:27] [PASSED] ALDERLAKE_S (C0)
[23:42:27] [PASSED] ALDERLAKE_S (D0)
[23:42:27] [PASSED] ALDERLAKE_P (A0)
[23:42:27] [PASSED] ALDERLAKE_P (B0)
[23:42:27] [PASSED] ALDERLAKE_P (C0)
[23:42:27] [PASSED] ALDERLAKE_S_RPLS (D0)
[23:42:27] [PASSED] ALDERLAKE_P_RPLU (E0)
[23:42:27] [PASSED] DG2_G10 (C0)
[23:42:27] [PASSED] DG2_G11 (B1)
[23:42:27] [PASSED] DG2_G12 (A1)
[23:42:27] [PASSED] METEORLAKE (g:A0, m:A0)
[23:42:27] [PASSED] METEORLAKE (g:A0, m:A0)
[23:42:27] [PASSED] METEORLAKE (g:A0, m:A0)
[23:42:27] [PASSED] LUNARLAKE (g:A0, m:A0)
[23:42:27] [PASSED] LUNARLAKE (g:B0, m:A0)
[23:42:27] [PASSED] BATTLEMAGE (g:A0, m:A1)
[23:42:27] ==================== [PASSED] xe_wa_gt =====================
[23:42:27] ====================== [PASSED] xe_wa ======================
[23:42:27] ============================================================
[23:42:27] Testing complete. Ran 133 tests: passed: 117, skipped: 16
[23:42:27] Elapsed time: 30.773s total, 4.171s configuring, 26.335s building, 0.252s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[23:42:27] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:42:29] Building KUnit Kernel ...
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

[23:42:50] Starting KUnit Kernel (1/1)...
[23:42:50] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:42:50] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[23:42:50] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[23:42:50] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[23:42:50] =========== drm_validate_clone_mode (2 subtests) ===========
[23:42:50] ============== drm_test_check_in_clone_mode  ===============
[23:42:50] [PASSED] in_clone_mode
[23:42:50] [PASSED] not_in_clone_mode
[23:42:50] ========== [PASSED] drm_test_check_in_clone_mode ===========
[23:42:50] =============== drm_test_check_valid_clones  ===============
[23:42:50] [PASSED] not_in_clone_mode
[23:42:50] [PASSED] valid_clone
[23:42:50] [PASSED] invalid_clone
[23:42:50] =========== [PASSED] drm_test_check_valid_clones ===========
[23:42:50] ============= [PASSED] drm_validate_clone_mode =============
[23:42:50] ============= drm_validate_modeset (1 subtest) =============
[23:42:50] [PASSED] drm_test_check_connector_changed_modeset
[23:42:50] ============== [PASSED] drm_validate_modeset ===============
[23:42:50] ====== drm_test_bridge_get_current_state (2 subtests) ======
[23:42:50] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[23:42:50] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[23:42:50] ======== [PASSED] drm_test_bridge_get_current_state ========
[23:42:50] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[23:42:50] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[23:42:50] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[23:42:50] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[23:42:50] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[23:42:50] ================== drm_buddy (7 subtests) ==================
[23:42:50] [PASSED] drm_test_buddy_alloc_limit
[23:42:50] [PASSED] drm_test_buddy_alloc_optimistic
[23:42:50] [PASSED] drm_test_buddy_alloc_pessimistic
[23:42:50] [PASSED] drm_test_buddy_alloc_pathological
[23:42:50] [PASSED] drm_test_buddy_alloc_contiguous
[23:42:50] [PASSED] drm_test_buddy_alloc_clear
[23:42:50] [PASSED] drm_test_buddy_alloc_range_bias
[23:42:50] ==================== [PASSED] drm_buddy ====================
[23:42:50] ============= drm_cmdline_parser (40 subtests) =============
[23:42:50] [PASSED] drm_test_cmdline_force_d_only
[23:42:50] [PASSED] drm_test_cmdline_force_D_only_dvi
[23:42:50] [PASSED] drm_test_cmdline_force_D_only_hdmi
[23:42:50] [PASSED] drm_test_cmdline_force_D_only_not_digital
[23:42:50] [PASSED] drm_test_cmdline_force_e_only
[23:42:50] [PASSED] drm_test_cmdline_res
[23:42:50] [PASSED] drm_test_cmdline_res_vesa
[23:42:50] [PASSED] drm_test_cmdline_res_vesa_rblank
[23:42:50] [PASSED] drm_test_cmdline_res_rblank
[23:42:50] [PASSED] drm_test_cmdline_res_bpp
[23:42:50] [PASSED] drm_test_cmdline_res_refresh
[23:42:50] [PASSED] drm_test_cmdline_res_bpp_refresh
[23:42:50] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[23:42:50] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[23:42:50] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[23:42:50] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[23:42:50] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[23:42:50] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[23:42:50] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[23:42:50] [PASSED] drm_test_cmdline_res_margins_force_on
[23:42:50] [PASSED] drm_test_cmdline_res_vesa_margins
[23:42:50] [PASSED] drm_test_cmdline_name
[23:42:50] [PASSED] drm_test_cmdline_name_bpp
[23:42:50] [PASSED] drm_test_cmdline_name_option
[23:42:50] [PASSED] drm_test_cmdline_name_bpp_option
[23:42:50] [PASSED] drm_test_cmdline_rotate_0
[23:42:50] [PASSED] drm_test_cmdline_rotate_90
[23:42:50] [PASSED] drm_test_cmdline_rotate_180
[23:42:50] [PASSED] drm_test_cmdline_rotate_270
[23:42:50] [PASSED] drm_test_cmdline_hmirror
[23:42:50] [PASSED] drm_test_cmdline_vmirror
[23:42:50] [PASSED] drm_test_cmdline_margin_options
[23:42:50] [PASSED] drm_test_cmdline_multiple_options
[23:42:50] [PASSED] drm_test_cmdline_bpp_extra_and_option
[23:42:50] [PASSED] drm_test_cmdline_extra_and_option
[23:42:50] [PASSED] drm_test_cmdline_freestanding_options
[23:42:50] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[23:42:50] [PASSED] drm_test_cmdline_panel_orientation
[23:42:50] ================ drm_test_cmdline_invalid  =================
[23:42:50] [PASSED] margin_only
[23:42:50] [PASSED] interlace_only
[23:42:50] [PASSED] res_missing_x
[23:42:50] [PASSED] res_missing_y
[23:42:50] [PASSED] res_bad_y
[23:42:50] [PASSED] res_missing_y_bpp
[23:42:50] [PASSED] res_bad_bpp
[23:42:50] [PASSED] res_bad_refresh
[23:42:50] [PASSED] res_bpp_refresh_force_on_off
[23:42:50] [PASSED] res_invalid_mode
[23:42:50] [PASSED] res_bpp_wrong_place_mode
[23:42:50] [PASSED] name_bpp_refresh
[23:42:50] [PASSED] name_refresh
[23:42:50] [PASSED] name_refresh_wrong_mode
[23:42:50] [PASSED] name_refresh_invalid_mode
[23:42:50] [PASSED] rotate_multiple
[23:42:50] [PASSED] rotate_invalid_val
[23:42:50] [PASSED] rotate_truncated
[23:42:50] [PASSED] invalid_option
[23:42:50] [PASSED] invalid_tv_option
[23:42:50] [PASSED] truncated_tv_option
[23:42:50] ============ [PASSED] drm_test_cmdline_invalid =============
[23:42:50] =============== drm_test_cmdline_tv_options  ===============
[23:42:50] [PASSED] NTSC
[23:42:50] [PASSED] NTSC_443
[23:42:50] [PASSED] NTSC_J
[23:42:50] [PASSED] PAL
[23:42:50] [PASSED] PAL_M
[23:42:50] [PASSED] PAL_N
[23:42:50] [PASSED] SECAM
[23:42:50] [PASSED] MONO_525
[23:42:50] [PASSED] MONO_625
[23:42:50] =========== [PASSED] drm_test_cmdline_tv_options ===========
[23:42:50] =============== [PASSED] drm_cmdline_parser ================
[23:42:50] ========== drmm_connector_hdmi_init (20 subtests) ==========
[23:42:50] [PASSED] drm_test_connector_hdmi_init_valid
[23:42:50] [PASSED] drm_test_connector_hdmi_init_bpc_8
[23:42:50] [PASSED] drm_test_connector_hdmi_init_bpc_10
[23:42:50] [PASSED] drm_test_connector_hdmi_init_bpc_12
[23:42:50] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[23:42:50] [PASSED] drm_test_connector_hdmi_init_bpc_null
[23:42:50] [PASSED] drm_test_connector_hdmi_init_formats_empty
[23:42:50] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[23:42:50] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[23:42:50] [PASSED] supported_formats=0x9 yuv420_allowed=1
[23:42:50] [PASSED] supported_formats=0x9 yuv420_allowed=0
[23:42:50] [PASSED] supported_formats=0x3 yuv420_allowed=1
[23:42:50] [PASSED] supported_formats=0x3 yuv420_allowed=0
[23:42:50] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[23:42:50] [PASSED] drm_test_connector_hdmi_init_null_ddc
[23:42:50] [PASSED] drm_test_connector_hdmi_init_null_product
[23:42:50] [PASSED] drm_test_connector_hdmi_init_null_vendor
[23:42:50] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[23:42:50] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[23:42:50] [PASSED] drm_test_connector_hdmi_init_product_valid
[23:42:50] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[23:42:50] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[23:42:50] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[23:42:50] ========= drm_test_connector_hdmi_init_type_valid  =========
[23:42:50] [PASSED] HDMI-A
[23:42:50] [PASSED] HDMI-B
[23:42:50] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[23:42:50] ======== drm_test_connector_hdmi_init_type_invalid  ========
[23:42:50] [PASSED] Unknown
[23:42:50] [PASSED] VGA
[23:42:50] [PASSED] DVI-I
[23:42:50] [PASSED] DVI-D
[23:42:50] [PASSED] DVI-A
[23:42:50] [PASSED] Composite
[23:42:50] [PASSED] SVIDEO
[23:42:50] [PASSED] LVDS
[23:42:50] [PASSED] Component
[23:42:50] [PASSED] DIN
[23:42:50] [PASSED] DP
[23:42:50] [PASSED] TV
[23:42:50] [PASSED] eDP
[23:42:50] [PASSED] Virtual
[23:42:50] [PASSED] DSI
[23:42:50] [PASSED] DPI
[23:42:50] [PASSED] Writeback
[23:42:50] [PASSED] SPI
[23:42:50] [PASSED] USB
[23:42:50] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[23:42:50] ============ [PASSED] drmm_connector_hdmi_init =============
[23:42:50] ============= drmm_connector_init (3 subtests) =============
[23:42:50] [PASSED] drm_test_drmm_connector_init
[23:42:50] [PASSED] drm_test_drmm_connector_init_null_ddc
[23:42:50] ========= drm_test_drmm_connector_init_type_valid  =========
[23:42:50] [PASSED] Unknown
[23:42:50] [PASSED] VGA
[23:42:50] [PASSED] DVI-I
[23:42:50] [PASSED] DVI-D
[23:42:50] [PASSED] DVI-A
[23:42:50] [PASSED] Composite
[23:42:50] [PASSED] SVIDEO
[23:42:50] [PASSED] LVDS
[23:42:50] [PASSED] Component
[23:42:50] [PASSED] DIN
[23:42:50] [PASSED] DP
[23:42:50] [PASSED] HDMI-A
[23:42:50] [PASSED] HDMI-B
[23:42:50] [PASSED] TV
[23:42:50] [PASSED] eDP
[23:42:50] [PASSED] Virtual
[23:42:50] [PASSED] DSI
[23:42:50] [PASSED] DPI
[23:42:50] [PASSED] Writeback
[23:42:50] [PASSED] SPI
[23:42:50] [PASSED] USB
[23:42:50] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[23:42:50] =============== [PASSED] drmm_connector_init ===============
[23:42:50] ========= drm_connector_dynamic_init (6 subtests) ==========
[23:42:50] [PASSED] drm_test_drm_connector_dynamic_init
[23:42:50] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[23:42:50] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[23:42:50] [PASSED] drm_test_drm_connector_dynamic_init_properties
[23:42:50] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[23:42:50] [PASSED] Unknown
[23:42:50] [PASSED] VGA
[23:42:50] [PASSED] DVI-I
[23:42:50] [PASSED] DVI-D
[23:42:50] [PASSED] DVI-A
[23:42:50] [PASSED] Composite
[23:42:50] [PASSED] SVIDEO
[23:42:50] [PASSED] LVDS
[23:42:50] [PASSED] Component
[23:42:50] [PASSED] DIN
[23:42:50] [PASSED] DP
[23:42:50] [PASSED] HDMI-A
[23:42:50] [PASSED] HDMI-B
[23:42:50] [PASSED] TV
[23:42:50] [PASSED] eDP
[23:42:50] [PASSED] Virtual
[23:42:50] [PASSED] DSI
[23:42:50] [PASSED] DPI
[23:42:50] [PASSED] Writeback
[23:42:50] [PASSED] SPI
[23:42:50] [PASSED] USB
[23:42:50] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[23:42:50] ======== drm_test_drm_connector_dynamic_init_name  =========
[23:42:50] [PASSED] Unknown
[23:42:50] [PASSED] VGA
[23:42:50] [PASSED] DVI-I
[23:42:50] [PASSED] DVI-D
[23:42:50] [PASSED] DVI-A
[23:42:50] [PASSED] Composite
[23:42:50] [PASSED] SVIDEO
[23:42:50] [PASSED] LVDS
[23:42:50] [PASSED] Component
[23:42:50] [PASSED] DIN
[23:42:50] [PASSED] DP
[23:42:50] [PASSED] HDMI-A
[23:42:50] [PASSED] HDMI-B
[23:42:50] [PASSED] TV
[23:42:50] [PASSED] eDP
[23:42:50] [PASSED] Virtual
[23:42:50] [PASSED] DSI
[23:42:50] [PASSED] DPI
[23:42:50] [PASSED] Writeback
[23:42:50] [PASSED] SPI
[23:42:50] [PASSED] USB
[23:42:50] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[23:42:50] =========== [PASSED] drm_connector_dynamic_init ============
[23:42:50] ==== drm_connector_dynamic_register_early (4 subtests) =====
[23:42:50] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[23:42:50] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[23:42:50] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[23:42:50] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[23:42:50] ====== [PASSED] drm_connector_dynamic_register_early =======
[23:42:50] ======= drm_connector_dynamic_register (7 subtests) ========
[23:42:50] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[23:42:50] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[23:42:50] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[23:42:50] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[23:42:50] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[23:42:50] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[23:42:50] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[23:42:50] ========= [PASSED] drm_connector_dynamic_register ==========
[23:42:50] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[23:42:50] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[23:42:50] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[23:42:50] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[23:42:50] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[23:42:50] ========== drm_test_get_tv_mode_from_name_valid  ===========
[23:42:50] [PASSED] NTSC
[23:42:50] [PASSED] NTSC-443
[23:42:50] [PASSED] NTSC-J
[23:42:50] [PASSED] PAL
[23:42:50] [PASSED] PAL-M
[23:42:50] [PASSED] PAL-N
[23:42:50] [PASSED] SECAM
[23:42:50] [PASSED] Mono
[23:42:50] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[23:42:50] [PASSED] drm_test_get_tv_mode_from_name_truncated
[23:42:50] ============ [PASSED] drm_get_tv_mode_from_name ============
[23:42:50] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[23:42:50] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[23:42:50] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[23:42:50] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[23:42:50] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[23:42:50] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[23:42:50] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[23:42:50] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[23:42:50] [PASSED] VIC 96
[23:42:50] [PASSED] VIC 97
[23:42:50] [PASSED] VIC 101
[23:42:50] [PASSED] VIC 102
[23:42:50] [PASSED] VIC 106
[23:42:50] [PASSED] VIC 107
[23:42:50] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[23:42:50] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[23:42:50] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[23:42:50] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[23:42:50] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[23:42:50] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[23:42:50] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[23:42:50] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[23:42:50] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[23:42:50] [PASSED] Automatic
[23:42:50] [PASSED] Full
[23:42:50] [PASSED] Limited 16:235
[23:42:50] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[23:42:50] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[23:42:50] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[23:42:50] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[23:42:50] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[23:42:50] [PASSED] RGB
[23:42:50] [PASSED] YUV 4:2:0
[23:42:50] [PASSED] YUV 4:2:2
[23:42:50] [PASSED] YUV 4:4:4
[23:42:50] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[23:42:50] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[23:42:50] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[23:42:50] ============= drm_damage_helper (21 subtests) ==============
[23:42:50] [PASSED] drm_test_damage_iter_no_damage
[23:42:50] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[23:42:50] [PASSED] drm_test_damage_iter_no_damage_src_moved
[23:42:50] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[23:42:50] [PASSED] drm_test_damage_iter_no_damage_not_visible
[23:42:50] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[23:42:50] [PASSED] drm_test_damage_iter_no_damage_no_fb
[23:42:50] [PASSED] drm_test_damage_iter_simple_damage
[23:42:50] [PASSED] drm_test_damage_iter_single_damage
[23:42:50] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[23:42:50] [PASSED] drm_test_damage_iter_single_damage_outside_src
[23:42:50] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[23:42:50] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[23:42:50] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[23:42:50] [PASSED] drm_test_damage_iter_single_damage_src_moved
[23:42:50] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[23:42:50] [PASSED] drm_test_damage_iter_damage
[23:42:50] [PASSED] drm_test_damage_iter_damage_one_intersect
[23:42:50] [PASSED] drm_test_damage_iter_damage_one_outside
[23:42:50] [PASSED] drm_test_damage_iter_damage_src_moved
[23:42:50] [PASSED] drm_test_damage_iter_damage_not_visible
[23:42:50] ================ [PASSED] drm_damage_helper ================
[23:42:50] ============== drm_dp_mst_helper (3 subtests) ==============
[23:42:50] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[23:42:50] [PASSED] Clock 154000 BPP 30 DSC disabled
[23:42:50] [PASSED] Clock 234000 BPP 30 DSC disabled
[23:42:50] [PASSED] Clock 297000 BPP 24 DSC disabled
[23:42:50] [PASSED] Clock 332880 BPP 24 DSC enabled
[23:42:50] [PASSED] Clock 324540 BPP 24 DSC enabled
[23:42:50] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[23:42:50] ============== drm_test_dp_mst_calc_pbn_div  ===============
[23:42:50] [PASSED] Link rate 2000000 lane count 4
[23:42:50] [PASSED] Link rate 2000000 lane count 2
[23:42:50] [PASSED] Link rate 2000000 lane count 1
[23:42:50] [PASSED] Link rate 1350000 lane count 4
[23:42:50] [PASSED] Link rate 1350000 lane count 2
[23:42:50] [PASSED] Link rate 1350000 lane count 1
[23:42:50] [PASSED] Link rate 1000000 lane count 4
[23:42:50] [PASSED] Link rate 1000000 lane count 2
[23:42:50] [PASSED] Link rate 1000000 lane count 1
[23:42:50] [PASSED] Link rate 810000 lane count 4
[23:42:50] [PASSED] Link rate 810000 lane count 2
[23:42:50] [PASSED] Link rate 810000 lane count 1
[23:42:50] [PASSED] Link rate 540000 lane count 4
[23:42:50] [PASSED] Link rate 540000 lane count 2
[23:42:50] [PASSED] Link rate 540000 lane count 1
[23:42:50] [PASSED] Link rate 270000 lane count 4
[23:42:50] [PASSED] Link rate 270000 lane count 2
[23:42:50] [PASSED] Link rate 270000 lane count 1
[23:42:50] [PASSED] Link rate 162000 lane count 4
[23:42:50] [PASSED] Link rate 162000 lane count 2
[23:42:50] [PASSED] Link rate 162000 lane count 1
[23:42:50] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[23:42:50] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[23:42:50] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[23:42:50] [PASSED] DP_POWER_UP_PHY with port number
[23:42:50] [PASSED] DP_POWER_DOWN_PHY with port number
[23:42:50] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[23:42:50] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[23:42:50] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[23:42:50] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[23:42:50] [PASSED] DP_QUERY_PAYLOAD with port number
[23:42:50] [PASSED] DP_QUERY_PAYLOAD with VCPI
[23:42:50] [PASSED] DP_REMOTE_DPCD_READ with port number
[23:42:50] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[23:42:50] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[23:42:50] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[23:42:50] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[23:42:50] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[23:42:50] [PASSED] DP_REMOTE_I2C_READ with port number
[23:42:50] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[23:42:50] [PASSED] DP_REMOTE_I2C_READ with transactions array
[23:42:50] [PASSED] DP_REMOTE_I2C_WRITE with port number
[23:42:50] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[23:42:50] [PASSED] DP_REMOTE_I2C_WRITE with data array
[23:42:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[23:42:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[23:42:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[23:42:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[23:42:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[23:42:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[23:42:50] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[23:42:50] ================ [PASSED] drm_dp_mst_helper ================
[23:42:50] ================== drm_exec (7 subtests) ===================
[23:42:50] [PASSED] sanitycheck
[23:42:50] [PASSED] test_lock
[23:42:50] [PASSED] test_lock_unlock
[23:42:50] [PASSED] test_duplicates
[23:42:50] [PASSED] test_prepare
[23:42:50] [PASSED] test_prepare_array
[23:42:50] [PASSED] test_multiple_loops
[23:42:50] ==================== [PASSED] drm_exec =====================
[23:42:50] =========== drm_format_helper_test (18 subtests) ===========
[23:42:50] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[23:42:50] [PASSED] single_pixel_source_buffer
[23:42:50] [PASSED] single_pixel_clip_rectangle
[23:42:50] [PASSED] well_known_colors
[23:42:50] [PASSED] destination_pitch
[23:42:50] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[23:42:50] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[23:42:50] [PASSED] single_pixel_source_buffer
[23:42:50] [PASSED] single_pixel_clip_rectangle
[23:42:50] [PASSED] well_known_colors
[23:42:50] [PASSED] destination_pitch
[23:42:50] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[23:42:50] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[23:42:50] [PASSED] single_pixel_source_buffer
[23:42:50] [PASSED] single_pixel_clip_rectangle
[23:42:50] [PASSED] well_known_colors
[23:42:50] [PASSED] destination_pitch
[23:42:50] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[23:42:50] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[23:42:50] [PASSED] single_pixel_source_buffer
[23:42:50] [PASSED] single_pixel_clip_rectangle
[23:42:50] [PASSED] well_known_colors
[23:42:50] [PASSED] destination_pitch
[23:42:50] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[23:42:50] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[23:42:50] [PASSED] single_pixel_source_buffer
[23:42:50] [PASSED] single_pixel_clip_rectangle
[23:42:50] [PASSED] well_known_colors
[23:42:50] [PASSED] destination_pitch
[23:42:50] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[23:42:50] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[23:42:50] [PASSED] single_pixel_source_buffer
[23:42:50] [PASSED] single_pixel_clip_rectangle
[23:42:50] [PASSED] well_known_colors
[23:42:50] [PASSED] destination_pitch
[23:42:50] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[23:42:50] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[23:42:50] [PASSED] single_pixel_source_buffer
[23:42:50] [PASSED] single_pixel_clip_rectangle
[23:42:50] [PASSED] well_known_colors
[23:42:50] [PASSED] destination_pitch
[23:42:50] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[23:42:50] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[23:42:50] [PASSED] single_pixel_source_buffer
[23:42:50] [PASSED] single_pixel_clip_rectangle
[23:42:50] [PASSED] well_known_colors
[23:42:50] [PASSED] destination_pitch
[23:42:50] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[23:42:50] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[23:42:50] [PASSED] single_pixel_source_buffer
[23:42:50] [PASSED] single_pixel_clip_rectangle
[23:42:50] [PASSED] well_known_colors
[23:42:50] [PASSED] destination_pitch
[23:42:50] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[23:42:50] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[23:42:50] [PASSED] single_pixel_source_buffer
[23:42:50] [PASSED] single_pixel_clip_rectangle
[23:42:50] [PASSED] well_known_colors
[23:42:50] [PASSED] destination_pitch
[23:42:50] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[23:42:50] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[23:42:50] [PASSED] single_pixel_source_buffer
[23:42:50] [PASSED] single_pixel_clip_rectangle
[23:42:50] [PASSED] well_known_colors
[23:42:50] [PASSED] destination_pitch
[23:42:50] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[23:42:50] ============== drm_test_fb_xrgb8888_to_mono  ===============
[23:42:50] [PASSED] single_pixel_source_buffer
[23:42:50] [PASSED] single_pixel_clip_rectangle
[23:42:50] [PASSED] well_known_colors
[23:42:50] [PASSED] destination_pitch
[23:42:50] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[23:42:50] ==================== drm_test_fb_swab  =====================
[23:42:50] [PASSED] single_pixel_source_buffer
[23:42:50] [PASSED] single_pixel_clip_rectangle
[23:42:50] [PASSED] well_known_colors
[23:42:50] [PASSED] destination_pitch
[23:42:50] ================ [PASSED] drm_test_fb_swab =================
[23:42:50] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[23:42:50] [PASSED] single_pixel_source_buffer
[23:42:50] [PASSED] single_pixel_clip_rectangle
[23:42:50] [PASSED] well_known_colors
[23:42:50] [PASSED] destination_pitch
[23:42:50] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[23:42:50] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[23:42:50] [PASSED] single_pixel_source_buffer
[23:42:50] [PASSED] single_pixel_clip_rectangle
[23:42:50] [PASSED] well_known_colors
[23:42:50] [PASSED] destination_pitch
[23:42:50] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[23:42:50] ================= drm_test_fb_clip_offset  =================
[23:42:50] [PASSED] pass through
[23:42:50] [PASSED] horizontal offset
[23:42:50] [PASSED] vertical offset
[23:42:50] [PASSED] horizontal and vertical offset
[23:42:50] [PASSED] horizontal offset (custom pitch)
[23:42:50] [PASSED] vertical offset (custom pitch)
[23:42:50] [PASSED] horizontal and vertical offset (custom pitch)
[23:42:50] ============= [PASSED] drm_test_fb_clip_offset =============
[23:42:50] ============== drm_test_fb_build_fourcc_list  ==============
[23:42:50] [PASSED] no native formats
[23:42:50] [PASSED] XRGB8888 as native format
[23:42:50] [PASSED] remove duplicates
[23:42:50] [PASSED] convert alpha formats
[23:42:50] [PASSED] random formats
[23:42:50] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[23:42:50] =================== drm_test_fb_memcpy  ====================
[23:42:50] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[23:42:50] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[23:42:50] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[23:42:50] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[23:42:50] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[23:42:50] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[23:42:50] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[23:42:50] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[23:42:50] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[23:42:50] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[23:42:50] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[23:42:50] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[23:42:50] =============== [PASSED] drm_test_fb_memcpy ================
[23:42:50] ============= [PASSED] drm_format_helper_test ==============
[23:42:50] ================= drm_format (18 subtests) =================
[23:42:50] [PASSED] drm_test_format_block_width_invalid
[23:42:50] [PASSED] drm_test_format_block_width_one_plane
[23:42:50] [PASSED] drm_test_format_block_width_two_plane
[23:42:50] [PASSED] drm_test_format_block_width_three_plane
[23:42:50] [PASSED] drm_test_format_block_width_tiled
[23:42:50] [PASSED] drm_test_format_block_height_invalid
[23:42:50] [PASSED] drm_test_format_block_height_one_plane
[23:42:50] [PASSED] drm_test_format_block_height_two_plane
[23:42:50] [PASSED] drm_test_format_block_height_three_plane
[23:42:50] [PASSED] drm_test_format_block_height_tiled
[23:42:50] [PASSED] drm_test_format_min_pitch_invalid
[23:42:50] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[23:42:50] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[23:42:50] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[23:42:50] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[23:42:50] [PASSED] drm_test_format_min_pitch_two_plane
[23:42:50] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[23:42:50] [PASSED] drm_test_format_min_pitch_tiled
[23:42:50] =================== [PASSED] drm_format ====================
[23:42:50] ============== drm_framebuffer (10 subtests) ===============
[23:42:50] ========== drm_test_framebuffer_check_src_coords  ==========
[23:42:50] [PASSED] Success: source fits into fb
[23:42:50] [PASSED] Fail: overflowing fb with x-axis coordinate
[23:42:50] [PASSED] Fail: overflowing fb with y-axis coordinate
[23:42:50] [PASSED] Fail: overflowing fb with source width
[23:42:50] [PASSED] Fail: overflowing fb with source height
[23:42:50] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[23:42:50] [PASSED] drm_test_framebuffer_cleanup
[23:42:50] =============== drm_test_framebuffer_create  ===============
[23:42:50] [PASSED] ABGR8888 normal sizes
[23:42:50] [PASSED] ABGR8888 max sizes
[23:42:50] [PASSED] ABGR8888 pitch greater than min required
[23:42:50] [PASSED] ABGR8888 pitch less than min required
[23:42:50] [PASSED] ABGR8888 Invalid width
[23:42:50] [PASSED] ABGR8888 Invalid buffer handle
[23:42:50] [PASSED] No pixel format
[23:42:50] [PASSED] ABGR8888 Width 0
[23:42:50] [PASSED] ABGR8888 Height 0
[23:42:50] [PASSED] ABGR8888 Out of bound height * pitch combination
[23:42:50] [PASSED] ABGR8888 Large buffer offset
[23:42:50] [PASSED] ABGR8888 Buffer offset for inexistent plane
[23:42:50] [PASSED] ABGR8888 Invalid flag
[23:42:50] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[23:42:50] [PASSED] ABGR8888 Valid buffer modifier
[23:42:50] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[23:42:50] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[23:42:50] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[23:42:50] [PASSED] NV12 Normal sizes
[23:42:50] [PASSED] NV12 Max sizes
[23:42:50] [PASSED] NV12 Invalid pitch
[23:42:50] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[23:42:50] [PASSED] NV12 different  modifier per-plane
[23:42:50] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[23:42:50] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[23:42:50] [PASSED] NV12 Modifier for inexistent plane
[23:42:50] [PASSED] NV12 Handle for inexistent plane
[23:42:50] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[23:42:50] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[23:42:50] [PASSED] YVU420 Normal sizes
[23:42:50] [PASSED] YVU420 Max sizes
[23:42:50] [PASSED] YVU420 Invalid pitch
[23:42:50] [PASSED] YVU420 Different pitches
[23:42:50] [PASSED] YVU420 Different buffer offsets/pitches
[23:42:50] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[23:42:50] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[23:42:50] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[23:42:50] [PASSED] YVU420 Valid modifier
[23:42:50] [PASSED] YVU420 Different modifiers per plane
[23:42:50] [PASSED] YVU420 Modifier for inexistent plane
[23:42:50] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[23:42:50] [PASSED] X0L2 Normal sizes
[23:42:50] [PASSED] X0L2 Max sizes
[23:42:50] [PASSED] X0L2 Invalid pitch
[23:42:50] [PASSED] X0L2 Pitch greater than minimum required
[23:42:50] [PASSED] X0L2 Handle for inexistent plane
[23:42:50] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[23:42:50] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[23:42:50] [PASSED] X0L2 Valid modifier
[23:42:50] [PASSED] X0L2 Modifier for inexistent plane
[23:42:50] =========== [PASSED] drm_test_framebuffer_create ===========
[23:42:50] [PASSED] drm_test_framebuffer_free
[23:42:50] [PASSED] drm_test_framebuffer_init
[23:42:50] [PASSED] drm_test_framebuffer_init_bad_format
[23:42:50] [PASSED] drm_test_framebuffer_init_dev_mismatch
[23:42:50] [PASSED] drm_test_framebuffer_lookup
[23:42:50] [PASSED] drm_test_framebuffer_lookup_inexistent
[23:42:50] [PASSED] drm_test_framebuffer_modifiers_not_supported
[23:42:50] ================= [PASSED] drm_framebuffer =================
[23:42:50] ================ drm_gem_shmem (8 subtests) ================
[23:42:50] [PASSED] drm_gem_shmem_test_obj_create
[23:42:50] [PASSED] drm_gem_shmem_test_obj_create_private
[23:42:50] [PASSED] drm_gem_shmem_test_pin_pages
[23:42:50] [PASSED] drm_gem_shmem_test_vmap
[23:42:50] [PASSED] drm_gem_shmem_test_get_pages_sgt
[23:42:50] [PASSED] drm_gem_shmem_test_get_sg_table
[23:42:50] [PASSED] drm_gem_shmem_test_madvise
[23:42:50] [PASSED] drm_gem_shmem_test_purge
[23:42:50] ================== [PASSED] drm_gem_shmem ==================
[23:42:50] === drm_atomic_helper_connector_hdmi_check (23 subtests) ===
[23:42:50] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[23:42:50] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[23:42:50] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[23:42:50] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[23:42:50] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[23:42:50] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[23:42:50] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[23:42:50] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[23:42:50] [PASSED] drm_test_check_disable_connector
[23:42:50] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[23:42:50] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback
[23:42:50] [PASSED] drm_test_check_max_tmds_rate_format_fallback
[23:42:50] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[23:42:50] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[23:42:50] [PASSED] drm_test_check_output_bpc_dvi
[23:42:50] [PASSED] drm_test_check_output_bpc_format_vic_1
[23:42:50] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[23:42:50] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[23:42:50] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[23:42:50] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[23:42:50] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[23:42:50] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[23:42:50] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[23:42:50] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[23:42:50] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[23:42:50] [PASSED] drm_test_check_broadcast_rgb_value
[23:42:50] [PASSED] drm_test_check_bpc_8_value
[23:42:50] [PASSED] drm_test_check_bpc_10_value
[23:42:50] [PASSED] drm_test_check_bpc_12_value
[23:42:50] [PASSED] drm_test_check_format_value
[23:42:50] [PASSED] drm_test_check_tmds_char_value
[23:42:50] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[23:42:50] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[23:42:50] [PASSED] drm_test_check_mode_valid
[23:42:50] [PASSED] drm_test_check_mode_valid_reject
[23:42:50] [PASSED] drm_test_check_mode_valid_reject_rate
[23:42:50] [PASSED] drm_test_check_mode_valid_reject_max_clock
[23:42:50] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[23:42:50] ================= drm_managed (2 subtests) =================
[23:42:50] [PASSED] drm_test_managed_release_action
[23:42:50] [PASSED] drm_test_managed_run_action
[23:42:50] =================== [PASSED] drm_managed ===================
[23:42:50] =================== drm_mm (6 subtests) ====================
[23:42:50] [PASSED] drm_test_mm_init
[23:42:50] [PASSED] drm_test_mm_debug
[23:42:50] [PASSED] drm_test_mm_align32
[23:42:50] [PASSED] drm_test_mm_align64
[23:42:50] [PASSED] drm_test_mm_lowest
[23:42:50] [PASSED] drm_test_mm_highest
[23:42:50] ===================== [PASSED] drm_mm ======================
[23:42:50] ============= drm_modes_analog_tv (5 subtests) =============
[23:42:50] [PASSED] drm_test_modes_analog_tv_mono_576i
[23:42:50] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[23:42:50] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[23:42:50] [PASSED] drm_test_modes_analog_tv_pal_576i
[23:42:50] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[23:42:50] =============== [PASSED] drm_modes_analog_tv ===============
[23:42:50] ============== drm_plane_helper (2 subtests) ===============
[23:42:50] =============== drm_test_check_plane_state  ================
[23:42:50] [PASSED] clipping_simple
[23:42:50] [PASSED] clipping_rotate_reflect
[23:42:50] [PASSED] positioning_simple
[23:42:50] [PASSED] upscaling
[23:42:50] [PASSED] downscaling
[23:42:50] [PASSED] rounding1
[23:42:50] [PASSED] rounding2
[23:42:50] [PASSED] rounding3
[23:42:50] [PASSED] rounding4
[23:42:50] =========== [PASSED] drm_test_check_plane_state ============
[23:42:50] =========== drm_test_check_invalid_plane_state  ============
[23:42:50] [PASSED] positioning_invalid
[23:42:50] [PASSED] upscaling_invalid
[23:42:50] [PASSED] downscaling_invalid
[23:42:50] ======= [PASSED] drm_test_check_invalid_plane_state ========
[23:42:50] ================ [PASSED] drm_plane_helper =================
[23:42:50] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[23:42:50] ====== drm_test_connector_helper_tv_get_modes_check  =======
[23:42:50] [PASSED] None
[23:42:50] [PASSED] PAL
[23:42:50] [PASSED] NTSC
[23:42:50] [PASSED] Both, NTSC Default
[23:42:50] [PASSED] Both, PAL Default
[23:42:50] [PASSED] Both, NTSC Default, with PAL on command-line
[23:42:50] [PASSED] Both, PAL Default, with NTSC on command-line
[23:42:50] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[23:42:50] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[23:42:50] ================== drm_rect (9 subtests) ===================
[23:42:50] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[23:42:50] [PASSED] drm_test_rect_clip_scaled_not_clipped
[23:42:50] [PASSED] drm_test_rect_clip_scaled_clipped
[23:42:50] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[23:42:50] ================= drm_test_rect_intersect  =================
[23:42:50] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[23:42:50] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[23:42:50] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[23:42:50] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[23:42:50] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[23:42:50] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[23:42:50] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[23:42:50] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[23:42:50] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[23:42:50] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[23:42:50] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[23:42:50] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[23:42:50] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[23:42:50] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
stty: 'standard input': Inappropriate ioctl for device
[23:42:50] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[23:42:50] ============= [PASSED] drm_test_rect_intersect =============
[23:42:50] ================ drm_test_rect_calc_hscale  ================
[23:42:50] [PASSED] normal use
[23:42:50] [PASSED] out of max range
[23:42:50] [PASSED] out of min range
[23:42:50] [PASSED] zero dst
[23:42:50] [PASSED] negative src
[23:42:50] [PASSED] negative dst
[23:42:50] ============ [PASSED] drm_test_rect_calc_hscale ============
[23:42:50] ================ drm_test_rect_calc_vscale  ================
[23:42:50] [PASSED] normal use
[23:42:50] [PASSED] out of max range
[23:42:50] [PASSED] out of min range
[23:42:50] [PASSED] zero dst
[23:42:50] [PASSED] negative src
[23:42:50] [PASSED] negative dst
[23:42:50] ============ [PASSED] drm_test_rect_calc_vscale ============
[23:42:50] ================== drm_test_rect_rotate  ===================
[23:42:50] [PASSED] reflect-x
[23:42:50] [PASSED] reflect-y
[23:42:50] [PASSED] rotate-0
[23:42:50] [PASSED] rotate-90
[23:42:50] [PASSED] rotate-180
[23:42:50] [PASSED] rotate-270
[23:42:50] ============== [PASSED] drm_test_rect_rotate ===============
[23:42:50] ================ drm_test_rect_rotate_inv  =================
[23:42:50] [PASSED] reflect-x
[23:42:50] [PASSED] reflect-y
[23:42:50] [PASSED] rotate-0
[23:42:50] [PASSED] rotate-90
[23:42:50] [PASSED] rotate-180
[23:42:50] [PASSED] rotate-270
[23:42:50] ============ [PASSED] drm_test_rect_rotate_inv =============
[23:42:50] ==================== [PASSED] drm_rect =====================
[23:42:50] ============================================================
[23:42:50] Testing complete. Ran 608 tests: passed: 608
[23:42:50] Elapsed time: 23.091s total, 1.661s configuring, 21.264s building, 0.130s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[23:42:50] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:42:52] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
[23:43:00] Starting KUnit Kernel (1/1)...
[23:43:00] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:43:00] ================= ttm_device (5 subtests) ==================
[23:43:00] [PASSED] ttm_device_init_basic
[23:43:00] [PASSED] ttm_device_init_multiple
[23:43:00] [PASSED] ttm_device_fini_basic
[23:43:00] [PASSED] ttm_device_init_no_vma_man
[23:43:00] ================== ttm_device_init_pools  ==================
[23:43:00] [PASSED] No DMA allocations, no DMA32 required
[23:43:00] [PASSED] DMA allocations, DMA32 required
[23:43:00] [PASSED] No DMA allocations, DMA32 required
[23:43:00] [PASSED] DMA allocations, no DMA32 required
[23:43:00] ============== [PASSED] ttm_device_init_pools ==============
[23:43:00] =================== [PASSED] ttm_device ====================
[23:43:00] ================== ttm_pool (8 subtests) ===================
[23:43:00] ================== ttm_pool_alloc_basic  ===================
[23:43:00] [PASSED] One page
[23:43:00] [PASSED] More than one page
[23:43:00] [PASSED] Above the allocation limit
[23:43:00] [PASSED] One page, with coherent DMA mappings enabled
[23:43:00] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[23:43:00] ============== [PASSED] ttm_pool_alloc_basic ===============
[23:43:00] ============== ttm_pool_alloc_basic_dma_addr  ==============
[23:43:00] [PASSED] One page
[23:43:00] [PASSED] More than one page
[23:43:00] [PASSED] Above the allocation limit
[23:43:00] [PASSED] One page, with coherent DMA mappings enabled
[23:43:00] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[23:43:00] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[23:43:00] [PASSED] ttm_pool_alloc_order_caching_match
[23:43:00] [PASSED] ttm_pool_alloc_caching_mismatch
[23:43:00] [PASSED] ttm_pool_alloc_order_mismatch
[23:43:00] [PASSED] ttm_pool_free_dma_alloc
[23:43:00] [PASSED] ttm_pool_free_no_dma_alloc
[23:43:00] [PASSED] ttm_pool_fini_basic
[23:43:00] ==================== [PASSED] ttm_pool =====================
[23:43:00] ================ ttm_resource (8 subtests) =================
[23:43:00] ================= ttm_resource_init_basic  =================
[23:43:00] [PASSED] Init resource in TTM_PL_SYSTEM
[23:43:00] [PASSED] Init resource in TTM_PL_VRAM
[23:43:00] [PASSED] Init resource in a private placement
[23:43:00] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[23:43:00] ============= [PASSED] ttm_resource_init_basic =============
[23:43:00] [PASSED] ttm_resource_init_pinned
[23:43:00] [PASSED] ttm_resource_fini_basic
[23:43:00] [PASSED] ttm_resource_manager_init_basic
[23:43:00] [PASSED] ttm_resource_manager_usage_basic
[23:43:00] [PASSED] ttm_resource_manager_set_used_basic
[23:43:00] [PASSED] ttm_sys_man_alloc_basic
[23:43:00] [PASSED] ttm_sys_man_free_basic
[23:43:00] ================== [PASSED] ttm_resource ===================
[23:43:00] =================== ttm_tt (15 subtests) ===================
[23:43:00] ==================== ttm_tt_init_basic  ====================
[23:43:00] [PASSED] Page-aligned size
[23:43:00] [PASSED] Extra pages requested
[23:43:00] ================ [PASSED] ttm_tt_init_basic ================
[23:43:00] [PASSED] ttm_tt_init_misaligned
[23:43:00] [PASSED] ttm_tt_fini_basic
[23:43:00] [PASSED] ttm_tt_fini_sg
[23:43:00] [PASSED] ttm_tt_fini_shmem
[23:43:00] [PASSED] ttm_tt_create_basic
[23:43:00] [PASSED] ttm_tt_create_invalid_bo_type
[23:43:00] [PASSED] ttm_tt_create_ttm_exists
[23:43:00] [PASSED] ttm_tt_create_failed
[23:43:00] [PASSED] ttm_tt_destroy_basic
[23:43:00] [PASSED] ttm_tt_populate_null_ttm
[23:43:00] [PASSED] ttm_tt_populate_populated_ttm
[23:43:00] [PASSED] ttm_tt_unpopulate_basic
[23:43:00] [PASSED] ttm_tt_unpopulate_empty_ttm
[23:43:00] [PASSED] ttm_tt_swapin_basic
[23:43:00] ===================== [PASSED] ttm_tt ======================
[23:43:00] =================== ttm_bo (14 subtests) ===================
[23:43:00] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[23:43:00] [PASSED] Cannot be interrupted and sleeps
[23:43:00] [PASSED] Cannot be interrupted, locks straight away
[23:43:00] [PASSED] Can be interrupted, sleeps
[23:43:00] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[23:43:00] [PASSED] ttm_bo_reserve_locked_no_sleep
[23:43:00] [PASSED] ttm_bo_reserve_no_wait_ticket
[23:43:00] [PASSED] ttm_bo_reserve_double_resv
[23:43:00] [PASSED] ttm_bo_reserve_interrupted
[23:43:00] [PASSED] ttm_bo_reserve_deadlock
[23:43:00] [PASSED] ttm_bo_unreserve_basic
[23:43:00] [PASSED] ttm_bo_unreserve_pinned
[23:43:00] [PASSED] ttm_bo_unreserve_bulk
[23:43:00] [PASSED] ttm_bo_put_basic
[23:43:00] [PASSED] ttm_bo_put_shared_resv
[23:43:00] [PASSED] ttm_bo_pin_basic
[23:43:00] [PASSED] ttm_bo_pin_unpin_resource
[23:43:00] [PASSED] ttm_bo_multiple_pin_one_unpin
[23:43:00] ===================== [PASSED] ttm_bo ======================
[23:43:00] ============== ttm_bo_validate (22 subtests) ===============
[23:43:00] ============== ttm_bo_init_reserved_sys_man  ===============
[23:43:00] [PASSED] Buffer object for userspace
[23:43:00] [PASSED] Kernel buffer object
[23:43:00] [PASSED] Shared buffer object
[23:43:00] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[23:43:00] ============== ttm_bo_init_reserved_mock_man  ==============
[23:43:00] [PASSED] Buffer object for userspace
[23:43:00] [PASSED] Kernel buffer object
[23:43:00] [PASSED] Shared buffer object
[23:43:00] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[23:43:00] [PASSED] ttm_bo_init_reserved_resv
[23:43:00] ================== ttm_bo_validate_basic  ==================
[23:43:00] [PASSED] Buffer object for userspace
[23:43:00] [PASSED] Kernel buffer object
[23:43:00] [PASSED] Shared buffer object
[23:43:00] ============== [PASSED] ttm_bo_validate_basic ==============
[23:43:00] [PASSED] ttm_bo_validate_invalid_placement
[23:43:00] ============= ttm_bo_validate_same_placement  ==============
[23:43:00] [PASSED] System manager
[23:43:00] [PASSED] VRAM manager
[23:43:00] ========= [PASSED] ttm_bo_validate_same_placement ==========
[23:43:00] [PASSED] ttm_bo_validate_failed_alloc
[23:43:00] [PASSED] ttm_bo_validate_pinned
[23:43:00] [PASSED] ttm_bo_validate_busy_placement
[23:43:00] ================ ttm_bo_validate_multihop  =================
[23:43:00] [PASSED] Buffer object for userspace
[23:43:00] [PASSED] Kernel buffer object
[23:43:00] [PASSED] Shared buffer object
[23:43:00] ============ [PASSED] ttm_bo_validate_multihop =============
[23:43:00] ========== ttm_bo_validate_no_placement_signaled  ==========
[23:43:00] [PASSED] Buffer object in system domain, no page vector
[23:43:00] [PASSED] Buffer object in system domain with an existing page vector
[23:43:00] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[23:43:00] ======== ttm_bo_validate_no_placement_not_signaled  ========
[23:43:00] [PASSED] Buffer object for userspace
[23:43:00] [PASSED] Kernel buffer object
[23:43:00] [PASSED] Shared buffer object
[23:43:00] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[23:43:00] [PASSED] ttm_bo_validate_move_fence_signaled
[23:43:00] ========= ttm_bo_validate_move_fence_not_signaled  =========
[23:43:00] [PASSED] Waits for GPU
[23:43:00] [PASSED] Tries to lock straight away
[23:43:00] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[23:43:00] [PASSED] ttm_bo_validate_swapout
[23:43:00] [PASSED] ttm_bo_validate_happy_evict
[23:43:00] [PASSED] ttm_bo_validate_all_pinned_evict
[23:43:00] [PASSED] ttm_bo_validate_allowed_only_evict
[23:43:00] [PASSED] ttm_bo_validate_deleted_evict
[23:43:00] [PASSED] ttm_bo_validate_busy_domain_evict
[23:43:00] [PASSED] ttm_bo_validate_evict_gutting
[23:43:00] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[23:43:00] ================= [PASSED] ttm_bo_validate =================
[23:43:00] ============================================================
[23:43:00] Testing complete. Ran 102 tests: passed: 102
[23:43:00] Elapsed time: 9.923s total, 1.631s configuring, 7.624s building, 0.558s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


