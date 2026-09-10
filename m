Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340E8C79FB7
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 05:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF85710E23E;
	Thu, 10 Sep 2026 05:45:45 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099F010E1D4;
 Thu, 10 Sep 2026 05:45:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Skip_clearing_purged?=
 =?utf-8?q?_page-table_BOs_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Sep 2026 05:45:45 -0000
Message-ID: <178901914502.145406.2445247392859876995@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260909111620.1276402-2-tejas.upadhyay@intel.com>
In-Reply-To: <20260909111620.1276402-2-tejas.upadhyay@intel.com>
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

Series: drm/xe: Skip clearing purged page-table BOs (rev5)
URL   : https://patchwork.freedesktop.org/series/173375/
State : success

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[05:43:43] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:43:48] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[05:44:08] Starting KUnit Kernel (1/1)...
[05:44:08] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:44:08] ============= refcount_interrupt (4 subtests) ==============
[05:44:08] [PASSED] test_single_irq_change
[05:44:08] [PASSED] test_nested_irq_change
[05:44:08] [PASSED] test_multiple_irq_change
[05:44:08] [PASSED] test_irq_save
[05:44:08] =============== [PASSED] refcount_interrupt ================
[05:44:08] ================= gpu_buddy (14 subtests) ==================
[05:44:08] [PASSED] gpu_test_buddy_alloc_limit
[05:44:08] [PASSED] gpu_test_buddy_alloc_optimistic
[05:44:08] [PASSED] gpu_test_buddy_alloc_pessimistic
[05:44:08] [PASSED] gpu_test_buddy_alloc_pathological
[05:44:08] [PASSED] gpu_test_buddy_alloc_contiguous
[05:44:08] [PASSED] gpu_test_buddy_alloc_clear
[05:44:08] [PASSED] gpu_test_buddy_alloc_range
[05:44:09] [PASSED] gpu_test_buddy_alloc_range_bias
[05:44:09] [PASSED] gpu_test_buddy_fragmentation_performance
[05:44:10] [PASSED] gpu_test_buddy_dirty_tracker_performance
[05:44:10] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[05:44:10] [PASSED] gpu_test_buddy_offset_aligned_allocation
[05:44:10] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[05:44:10] [PASSED] gpu_test_buddy_addr_to_block
[05:44:10] ==================== [PASSED] gpu_buddy ====================
[05:44:10] ============================================================
[05:44:10] Testing complete. Ran 18 tests: passed: 18
[05:44:10] Elapsed time: 26.877s total, 4.461s configuring, 20.499s building, 1.865s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[05:44:10] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:44:12] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[05:44:46] Starting KUnit Kernel (1/1)...
[05:44:46] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:44:46] ============= refcount_interrupt (4 subtests) ==============
[05:44:46] [PASSED] test_single_irq_change
[05:44:46] [PASSED] test_nested_irq_change
[05:44:46] [PASSED] test_multiple_irq_change
[05:44:46] [PASSED] test_irq_save
[05:44:46] =============== [PASSED] refcount_interrupt ================
[05:44:46] ================== guc_buf (11 subtests) ===================
[05:44:46] [PASSED] test_smallest
[05:44:46] [PASSED] test_largest
[05:44:46] [PASSED] test_granular
[05:44:46] [PASSED] test_unique
[05:44:46] [PASSED] test_overlap
[05:44:46] [PASSED] test_reusable
[05:44:46] [PASSED] test_too_big
[05:44:46] [PASSED] test_flush
[05:44:46] [PASSED] test_lookup
[05:44:46] [PASSED] test_data
[05:44:46] [PASSED] test_class
[05:44:46] ===================== [PASSED] guc_buf =====================
[05:44:46] =================== guc_dbm (7 subtests) ===================
[05:44:46] [PASSED] test_empty
[05:44:46] [PASSED] test_default
[05:44:46] ======================== test_size  ========================
[05:44:46] [PASSED] 4
[05:44:46] [PASSED] 8
[05:44:46] [PASSED] 32
[05:44:46] [PASSED] 256
[05:44:46] ==================== [PASSED] test_size ====================
[05:44:46] ======================= test_reuse  ========================
[05:44:46] [PASSED] 4
[05:44:46] [PASSED] 8
[05:44:46] [PASSED] 32
[05:44:46] [PASSED] 256
[05:44:46] =================== [PASSED] test_reuse ====================
[05:44:46] =================== test_range_overlap  ====================
[05:44:46] [PASSED] 4
[05:44:46] [PASSED] 8
[05:44:46] [PASSED] 32
[05:44:46] [PASSED] 256
[05:44:46] =============== [PASSED] test_range_overlap ================
[05:44:46] =================== test_range_compact  ====================
[05:44:46] [PASSED] 4
[05:44:46] [PASSED] 8
[05:44:46] [PASSED] 32
[05:44:46] [PASSED] 256
[05:44:46] =============== [PASSED] test_range_compact ================
[05:44:46] ==================== test_range_spare  =====================
[05:44:46] [PASSED] 4
[05:44:46] [PASSED] 8
[05:44:46] [PASSED] 32
[05:44:46] [PASSED] 256
[05:44:46] ================ [PASSED] test_range_spare =================
[05:44:46] ===================== [PASSED] guc_dbm =====================
[05:44:46] =================== guc_idm (6 subtests) ===================
[05:44:46] [PASSED] bad_init
[05:44:46] [PASSED] no_init
[05:44:46] [PASSED] init_fini
[05:44:46] [PASSED] check_used
[05:44:46] [PASSED] check_quota
[05:44:46] [PASSED] check_all
[05:44:46] ===================== [PASSED] guc_idm =====================
[05:44:46] =============== guc_klv_helpers (9 subtests) ===============
[05:44:46] [PASSED] test_count
[05:44:46] [PASSED] test_encode_u32
[05:44:46] [PASSED] test_encode_u64
[05:44:46] [PASSED] test_encode_string
[05:44:46] [PASSED] test_encode_object_raw
[05:44:46] [PASSED] test_encode_object_klv
[05:44:46] [PASSED] test_encode_object_nested
[05:44:46] [PASSED] test_encode_object_basic
[05:44:46] [PASSED] test_print
[05:44:46] ================= [PASSED] guc_klv_helpers =================
[05:44:46] =================== xe_log (4 subtests) ====================
[05:44:46] [PASSED] demo_cper
[05:44:46] [PASSED] demo_dmesg
[05:44:46] ======================= test_dmesg  ========================
[05:44:46] [PASSED] test_fatal
[05:44:46] [PASSED] test_fatal_tile
[05:44:46] [PASSED] test_fatal_gt
[05:44:46] [PASSED] test_fatal_comp
[05:44:46] [PASSED] test_fatal_comp_tile
[05:44:46] [PASSED] test_fatal_comp_gt
[05:44:46] [PASSED] test_fatal_all
[05:44:46] [PASSED] test_recoverable
[05:44:46] [PASSED] test_recoverable_tile
[05:44:46] [PASSED] test_recoverable_gt
[05:44:46] [PASSED] test_recoverable_comp
[05:44:46] [PASSED] test_recoverable_comp_tile
[05:44:46] [PASSED] test_recoverable_comp_gt
[05:44:46] [PASSED] test_recoverable_all
[05:44:46] [PASSED] test_info
[05:44:46] [PASSED] test_info_tile
[05:44:46] [PASSED] test_info_gt
[05:44:46] [PASSED] test_info_err
[05:44:46] [PASSED] test_info_comp
[05:44:46] [PASSED] test_info_comp_tile
[05:44:46] [PASSED] test_info_comp_gt
[05:44:46] [PASSED] test_info_all
[05:44:46] [PASSED] test_hw_fatal
[05:44:46] [PASSED] test_hw_recoverable
[05:44:46] [PASSED] test_hw_corrected
[05:44:46] [PASSED] test_hw_informational
[05:44:46] =================== [PASSED] test_dmesg ====================
[05:44:46] ====================== test_invalid  =======================
[05:44:46] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[05:44:46] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[05:44:46] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[05:44:46] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[05:44:46] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[05:44:46] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[05:44:46] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[05:44:46] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[05:44:46] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[05:44:46] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[05:44:46] ================== [SKIPPED] test_invalid ==================
[05:44:46] ===================== [PASSED] xe_log ======================
[05:44:46] ================== no_relay (3 subtests) ===================
[05:44:46] [PASSED] xe_drops_guc2pf_if_not_ready
[05:44:46] [PASSED] xe_drops_guc2vf_if_not_ready
[05:44:46] [PASSED] xe_rejects_send_if_not_ready
[05:44:46] ==================== [PASSED] no_relay =====================
[05:44:46] ================== pf_relay (14 subtests) ==================
[05:44:46] [PASSED] pf_rejects_guc2pf_too_short
[05:44:46] [PASSED] pf_rejects_guc2pf_too_long
[05:44:46] [PASSED] pf_rejects_guc2pf_no_payload
[05:44:46] [PASSED] pf_fails_no_payload
[05:44:46] [PASSED] pf_fails_bad_origin
[05:44:46] [PASSED] pf_fails_bad_type
[05:44:46] [PASSED] pf_txn_reports_error
[05:44:46] [PASSED] pf_txn_sends_pf2guc
[05:44:46] [PASSED] pf_sends_pf2guc
[05:44:46] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[05:44:46] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[05:44:46] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[05:44:46] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[05:44:46] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[05:44:46] ==================== [PASSED] pf_relay =====================
[05:44:46] ================== vf_relay (3 subtests) ===================
[05:44:46] [PASSED] vf_rejects_guc2vf_too_short
[05:44:46] [PASSED] vf_rejects_guc2vf_too_long
[05:44:46] [PASSED] vf_rejects_guc2vf_no_payload
[05:44:46] ==================== [PASSED] vf_relay =====================
[05:44:46] ================ pf_gt_config (9 subtests) =================
[05:44:46] [PASSED] fair_contexts_1vf
[05:44:46] [PASSED] fair_doorbells_1vf
[05:44:46] [PASSED] fair_ggtt_1vf
[05:44:46] ====================== fair_vram_1vf  ======================
[05:44:46] [PASSED] 3.50 GiB
[05:44:46] [PASSED] 11.5 GiB
[05:44:46] [PASSED] 15.5 GiB
[05:44:46] [PASSED] 31.5 GiB
[05:44:46] [PASSED] 63.5 GiB
[05:44:46] [PASSED] 1.91 GiB
[05:44:46] ================== [PASSED] fair_vram_1vf ==================
[05:44:46] ================ fair_vram_1vf_admin_only  =================
[05:44:46] [PASSED] 3.50 GiB
[05:44:46] [PASSED] 11.5 GiB
[05:44:46] [PASSED] 15.5 GiB
[05:44:46] [PASSED] 31.5 GiB
[05:44:46] [PASSED] 63.5 GiB
[05:44:46] [PASSED] 1.91 GiB
[05:44:46] ============ [PASSED] fair_vram_1vf_admin_only =============
[05:44:46] ====================== fair_contexts  ======================
[05:44:46] [PASSED] 1 VF
[05:44:46] [PASSED] 2 VFs
[05:44:46] [PASSED] 3 VFs
[05:44:46] [PASSED] 4 VFs
[05:44:46] [PASSED] 5 VFs
[05:44:46] [PASSED] 6 VFs
[05:44:46] [PASSED] 7 VFs
[05:44:46] [PASSED] 8 VFs
[05:44:46] [PASSED] 9 VFs
[05:44:46] [PASSED] 10 VFs
[05:44:46] [PASSED] 11 VFs
[05:44:46] [PASSED] 12 VFs
[05:44:46] [PASSED] 13 VFs
[05:44:46] [PASSED] 14 VFs
[05:44:46] [PASSED] 15 VFs
[05:44:46] [PASSED] 16 VFs
[05:44:46] [PASSED] 17 VFs
[05:44:46] [PASSED] 18 VFs
[05:44:46] [PASSED] 19 VFs
[05:44:46] [PASSED] 20 VFs
[05:44:46] [PASSED] 21 VFs
[05:44:46] [PASSED] 22 VFs
[05:44:46] [PASSED] 23 VFs
[05:44:46] [PASSED] 24 VFs
[05:44:46] [PASSED] 25 VFs
[05:44:46] [PASSED] 26 VFs
[05:44:46] [PASSED] 27 VFs
[05:44:46] [PASSED] 28 VFs
[05:44:46] [PASSED] 29 VFs
[05:44:46] [PASSED] 30 VFs
[05:44:46] [PASSED] 31 VFs
[05:44:46] [PASSED] 32 VFs
[05:44:46] [PASSED] 33 VFs
[05:44:46] [PASSED] 34 VFs
[05:44:46] [PASSED] 35 VFs
[05:44:46] [PASSED] 36 VFs
[05:44:46] [PASSED] 37 VFs
[05:44:46] [PASSED] 38 VFs
[05:44:46] [PASSED] 39 VFs
[05:44:46] [PASSED] 40 VFs
[05:44:46] [PASSED] 41 VFs
[05:44:46] [PASSED] 42 VFs
[05:44:46] [PASSED] 43 VFs
[05:44:46] [PASSED] 44 VFs
[05:44:46] [PASSED] 45 VFs
[05:44:46] [PASSED] 46 VFs
[05:44:46] [PASSED] 47 VFs
[05:44:46] [PASSED] 48 VFs
[05:44:46] [PASSED] 49 VFs
[05:44:46] [PASSED] 50 VFs
[05:44:46] [PASSED] 51 VFs
[05:44:46] [PASSED] 52 VFs
[05:44:46] [PASSED] 53 VFs
[05:44:46] [PASSED] 54 VFs
[05:44:46] [PASSED] 55 VFs
[05:44:46] [PASSED] 56 VFs
[05:44:46] [PASSED] 57 VFs
[05:44:46] [PASSED] 58 VFs
[05:44:46] [PASSED] 59 VFs
[05:44:46] [PASSED] 60 VFs
[05:44:46] [PASSED] 61 VFs
[05:44:46] [PASSED] 62 VFs
[05:44:46] [PASSED] 63 VFs
[05:44:46] ================== [PASSED] fair_contexts ==================
[05:44:46] ===================== fair_doorbells  ======================
[05:44:46] [PASSED] 1 VF
[05:44:46] [PASSED] 2 VFs
[05:44:46] [PASSED] 3 VFs
[05:44:46] [PASSED] 4 VFs
[05:44:46] [PASSED] 5 VFs
[05:44:46] [PASSED] 6 VFs
[05:44:46] [PASSED] 7 VFs
[05:44:46] [PASSED] 8 VFs
[05:44:46] [PASSED] 9 VFs
[05:44:46] [PASSED] 10 VFs
[05:44:46] [PASSED] 11 VFs
[05:44:46] [PASSED] 12 VFs
[05:44:46] [PASSED] 13 VFs
[05:44:46] [PASSED] 14 VFs
[05:44:46] [PASSED] 15 VFs
[05:44:46] [PASSED] 16 VFs
[05:44:46] [PASSED] 17 VFs
[05:44:46] [PASSED] 18 VFs
[05:44:46] [PASSED] 19 VFs
[05:44:46] [PASSED] 20 VFs
[05:44:46] [PASSED] 21 VFs
[05:44:46] [PASSED] 22 VFs
[05:44:46] [PASSED] 23 VFs
[05:44:46] [PASSED] 24 VFs
[05:44:46] [PASSED] 25 VFs
[05:44:46] [PASSED] 26 VFs
[05:44:46] [PASSED] 27 VFs
[05:44:46] [PASSED] 28 VFs
[05:44:46] [PASSED] 29 VFs
[05:44:46] [PASSED] 30 VFs
[05:44:46] [PASSED] 31 VFs
[05:44:46] [PASSED] 32 VFs
[05:44:46] [PASSED] 33 VFs
[05:44:46] [PASSED] 34 VFs
[05:44:46] [PASSED] 35 VFs
[05:44:46] [PASSED] 36 VFs
[05:44:46] [PASSED] 37 VFs
[05:44:46] [PASSED] 38 VFs
[05:44:46] [PASSED] 39 VFs
[05:44:46] [PASSED] 40 VFs
[05:44:46] [PASSED] 41 VFs
[05:44:46] [PASSED] 42 VFs
[05:44:46] [PASSED] 43 VFs
[05:44:46] [PASSED] 44 VFs
[05:44:46] [PASSED] 45 VFs
[05:44:46] [PASSED] 46 VFs
[05:44:46] [PASSED] 47 VFs
[05:44:46] [PASSED] 48 VFs
[05:44:46] [PASSED] 49 VFs
[05:44:46] [PASSED] 50 VFs
[05:44:46] [PASSED] 51 VFs
[05:44:46] [PASSED] 52 VFs
[05:44:46] [PASSED] 53 VFs
[05:44:46] [PASSED] 54 VFs
[05:44:46] [PASSED] 55 VFs
[05:44:46] [PASSED] 56 VFs
[05:44:46] [PASSED] 57 VFs
[05:44:46] [PASSED] 58 VFs
[05:44:46] [PASSED] 59 VFs
[05:44:46] [PASSED] 60 VFs
[05:44:46] [PASSED] 61 VFs
[05:44:46] [PASSED] 62 VFs
[05:44:46] [PASSED] 63 VFs
[05:44:46] ================= [PASSED] fair_doorbells ==================
[05:44:46] ======================== fair_ggtt  ========================
[05:44:46] [PASSED] 1 VF
[05:44:46] [PASSED] 2 VFs
[05:44:46] [PASSED] 3 VFs
[05:44:46] [PASSED] 4 VFs
[05:44:46] [PASSED] 5 VFs
[05:44:46] [PASSED] 6 VFs
[05:44:46] [PASSED] 7 VFs
[05:44:46] [PASSED] 8 VFs
[05:44:46] [PASSED] 9 VFs
[05:44:46] [PASSED] 10 VFs
[05:44:46] [PASSED] 11 VFs
[05:44:46] [PASSED] 12 VFs
[05:44:46] [PASSED] 13 VFs
[05:44:46] [PASSED] 14 VFs
[05:44:46] [PASSED] 15 VFs
[05:44:46] [PASSED] 16 VFs
[05:44:46] [PASSED] 17 VFs
[05:44:46] [PASSED] 18 VFs
[05:44:46] [PASSED] 19 VFs
[05:44:46] [PASSED] 20 VFs
[05:44:46] [PASSED] 21 VFs
[05:44:46] [PASSED] 22 VFs
[05:44:46] [PASSED] 23 VFs
[05:44:46] [PASSED] 24 VFs
[05:44:46] [PASSED] 25 VFs
[05:44:46] [PASSED] 26 VFs
[05:44:46] [PASSED] 27 VFs
[05:44:46] [PASSED] 28 VFs
[05:44:46] [PASSED] 29 VFs
[05:44:46] [PASSED] 30 VFs
[05:44:46] [PASSED] 31 VFs
[05:44:46] [PASSED] 32 VFs
[05:44:46] [PASSED] 33 VFs
[05:44:46] [PASSED] 34 VFs
[05:44:46] [PASSED] 35 VFs
[05:44:46] [PASSED] 36 VFs
[05:44:46] [PASSED] 37 VFs
[05:44:46] [PASSED] 38 VFs
[05:44:46] [PASSED] 39 VFs
[05:44:46] [PASSED] 40 VFs
[05:44:46] [PASSED] 41 VFs
[05:44:46] [PASSED] 42 VFs
[05:44:46] [PASSED] 43 VFs
[05:44:46] [PASSED] 44 VFs
[05:44:46] [PASSED] 45 VFs
[05:44:46] [PASSED] 46 VFs
[05:44:46] [PASSED] 47 VFs
[05:44:46] [PASSED] 48 VFs
[05:44:46] [PASSED] 49 VFs
[05:44:46] [PASSED] 50 VFs
[05:44:46] [PASSED] 51 VFs
[05:44:46] [PASSED] 52 VFs
[05:44:46] [PASSED] 53 VFs
[05:44:46] [PASSED] 54 VFs
[05:44:46] [PASSED] 55 VFs
[05:44:46] [PASSED] 56 VFs
[05:44:46] [PASSED] 57 VFs
[05:44:46] [PASSED] 58 VFs
[05:44:46] [PASSED] 59 VFs
[05:44:46] [PASSED] 60 VFs
[05:44:46] [PASSED] 61 VFs
[05:44:46] [PASSED] 62 VFs
[05:44:46] [PASSED] 63 VFs
[05:44:46] ==================== [PASSED] fair_ggtt ====================
[05:44:46] ======================== fair_vram  ========================
[05:44:46] [PASSED] 1 VF
[05:44:46] [PASSED] 2 VFs
[05:44:46] [PASSED] 3 VFs
[05:44:46] [PASSED] 4 VFs
[05:44:46] [PASSED] 5 VFs
[05:44:46] [PASSED] 6 VFs
[05:44:46] [PASSED] 7 VFs
[05:44:46] [PASSED] 8 VFs
[05:44:46] [PASSED] 9 VFs
[05:44:46] [PASSED] 10 VFs
[05:44:46] [PASSED] 11 VFs
[05:44:46] [PASSED] 12 VFs
[05:44:46] [PASSED] 13 VFs
[05:44:46] [PASSED] 14 VFs
[05:44:46] [PASSED] 15 VFs
[05:44:46] [PASSED] 16 VFs
[05:44:46] [PASSED] 17 VFs
[05:44:46] [PASSED] 18 VFs
[05:44:46] [PASSED] 19 VFs
[05:44:46] [PASSED] 20 VFs
[05:44:46] [PASSED] 21 VFs
[05:44:46] [PASSED] 22 VFs
[05:44:46] [PASSED] 23 VFs
[05:44:46] [PASSED] 24 VFs
[05:44:46] [PASSED] 25 VFs
[05:44:46] [PASSED] 26 VFs
[05:44:46] [PASSED] 27 VFs
[05:44:46] [PASSED] 28 VFs
[05:44:46] [PASSED] 29 VFs
[05:44:46] [PASSED] 30 VFs
[05:44:46] [PASSED] 31 VFs
[05:44:46] [PASSED] 32 VFs
[05:44:46] [PASSED] 33 VFs
[05:44:46] [PASSED] 34 VFs
[05:44:46] [PASSED] 35 VFs
[05:44:46] [PASSED] 36 VFs
[05:44:46] [PASSED] 37 VFs
[05:44:46] [PASSED] 38 VFs
[05:44:46] [PASSED] 39 VFs
[05:44:46] [PASSED] 40 VFs
[05:44:46] [PASSED] 41 VFs
[05:44:46] [PASSED] 42 VFs
[05:44:46] [PASSED] 43 VFs
[05:44:46] [PASSED] 44 VFs
[05:44:46] [PASSED] 45 VFs
[05:44:46] [PASSED] 46 VFs
[05:44:46] [PASSED] 47 VFs
[05:44:46] [PASSED] 48 VFs
[05:44:46] [PASSED] 49 VFs
[05:44:46] [PASSED] 50 VFs
[05:44:46] [PASSED] 51 VFs
[05:44:46] [PASSED] 52 VFs
[05:44:46] [PASSED] 53 VFs
[05:44:46] [PASSED] 54 VFs
[05:44:46] [PASSED] 55 VFs
[05:44:46] [PASSED] 56 VFs
[05:44:46] [PASSED] 57 VFs
[05:44:46] [PASSED] 58 VFs
[05:44:46] [PASSED] 59 VFs
[05:44:46] [PASSED] 60 VFs
[05:44:46] [PASSED] 61 VFs
[05:44:46] [PASSED] 62 VFs
[05:44:46] [PASSED] 63 VFs
[05:44:46] ==================== [PASSED] fair_vram ====================
[05:44:46] ================== [PASSED] pf_gt_config ===================
[05:44:46] ===================== lmtt (1 subtest) =====================
[05:44:46] ======================== test_ops  =========================
[05:44:46] [PASSED] 2-level
[05:44:46] [PASSED] multi-level
[05:44:46] ==================== [PASSED] test_ops =====================
[05:44:46] ====================== [PASSED] lmtt =======================
[05:44:46] ================= sriov_packet (1 subtest) =================
[05:44:46] [PASSED] test_descriptor_init
[05:44:46] ================== [PASSED] sriov_packet ===================
[05:44:46] ================= pf_service (11 subtests) =================
[05:44:46] [PASSED] pf_negotiate_any
[05:44:46] [PASSED] pf_negotiate_base_match
[05:44:46] [PASSED] pf_negotiate_base_newer
[05:44:46] [PASSED] pf_negotiate_base_next
[05:44:46] [SKIPPED] pf_negotiate_base_older (no older minor)
[05:44:46] [PASSED] pf_negotiate_base_prev
[05:44:46] [PASSED] pf_negotiate_latest_match
[05:44:46] [PASSED] pf_negotiate_latest_newer
[05:44:46] [PASSED] pf_negotiate_latest_next
[05:44:46] [SKIPPED] pf_negotiate_latest_older (no older minor)
[05:44:46] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[05:44:46] =================== [PASSED] pf_service ====================
[05:44:46] ================= xe_guc_g2g (2 subtests) ==================
[05:44:46] ============== xe_live_guc_g2g_kunit_default  ==============
[05:44:46] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[05:44:46] ============== xe_live_guc_g2g_kunit_allmem  ===============
[05:44:46] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[05:44:46] =================== [SKIPPED] xe_guc_g2g ===================
[05:44:46] =================== xe_mocs (2 subtests) ===================
[05:44:46] ================ xe_live_mocs_kernel_kunit  ================
[05:44:46] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[05:44:46] ================ xe_live_mocs_reset_kunit  =================
[05:44:46] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[05:44:46] ==================== [SKIPPED] xe_mocs =====================
[05:44:46] ================= xe_migrate (2 subtests) ==================
[05:44:46] ================= xe_migrate_sanity_kunit  =================
[05:44:46] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[05:44:46] ================== xe_validate_ccs_kunit  ==================
[05:44:46] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[05:44:46] =================== [SKIPPED] xe_migrate ===================
[05:44:46] ================== xe_dma_buf (1 subtest) ==================
[05:44:46] ==================== xe_dma_buf_kunit  =====================
[05:44:46] ================ [SKIPPED] xe_dma_buf_kunit ================
[05:44:46] =================== [SKIPPED] xe_dma_buf ===================
[05:44:46] ================= xe_bo_shrink (1 subtest) =================
[05:44:46] =================== xe_bo_shrink_kunit  ====================
[05:44:46] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[05:44:46] ================== [SKIPPED] xe_bo_shrink ==================
[05:44:46] ==================== xe_bo (2 subtests) ====================
[05:44:46] ================== xe_ccs_migrate_kunit  ===================
[05:44:46] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[05:44:46] ==================== xe_bo_evict_kunit  ====================
[05:44:46] =============== [SKIPPED] xe_bo_evict_kunit ================
[05:44:46] ===================== [SKIPPED] xe_bo ======================
[05:44:46] =================== xe_any (9 subtests) ====================
[05:44:46] [PASSED] test_to_xe
[05:44:46] [PASSED] test_to_dev
[05:44:46] [PASSED] test_to_pdev
[05:44:46] [PASSED] test_to_drm
[05:44:46] [PASSED] test_if_pdev
[05:44:46] [PASSED] test_if_xe
[05:44:46] [PASSED] test_if_tile
[05:44:46] [PASSED] test_if_gt
[05:44:46] [PASSED] test_to_id
[05:44:46] ===================== [PASSED] xe_any ======================
[05:44:46] ==================== args (13 subtests) ====================
[05:44:46] [PASSED] count_args_test
[05:44:46] [PASSED] call_args_example
[05:44:46] [PASSED] call_args_test
[05:44:46] [PASSED] drop_first_arg_example
[05:44:46] [PASSED] drop_first_arg_test
[05:44:46] [PASSED] first_arg_example
[05:44:46] [PASSED] first_arg_test
[05:44:46] [PASSED] last_arg_example
[05:44:46] [PASSED] last_arg_test
[05:44:46] [PASSED] pick_arg_example
[05:44:46] [PASSED] if_args_example
[05:44:46] [PASSED] if_args_test
[05:44:46] [PASSED] sep_comma_example
[05:44:46] ====================== [PASSED] args =======================
[05:44:46] =================== xe_pci (3 subtests) ====================
[05:44:46] ==================== check_graphics_ip  ====================
[05:44:46] [PASSED] 12.00 Xe_LP
[05:44:46] [PASSED] 12.10 Xe_LP+
[05:44:46] [PASSED] 12.55 Xe_HPG
[05:44:46] [PASSED] 12.60 Xe_HPC
[05:44:46] [PASSED] 12.70 Xe_LPG
[05:44:46] [PASSED] 12.71 Xe_LPG
[05:44:46] [PASSED] 12.74 Xe_LPG+
[05:44:46] [PASSED] 20.01 Xe2_HPG
[05:44:46] [PASSED] 20.02 Xe2_HPG
[05:44:46] [PASSED] 20.04 Xe2_LPG
[05:44:46] [PASSED] 30.00 Xe3_LPG
[05:44:46] [PASSED] 30.01 Xe3_LPG
[05:44:46] [PASSED] 30.03 Xe3_LPG
[05:44:46] [PASSED] 30.04 Xe3_LPG
[05:44:46] [PASSED] 30.05 Xe3_LPG
[05:44:46] [PASSED] 35.10 Xe3p_LPG
[05:44:46] [PASSED] 35.11 Xe3p_XPC
[05:44:46] ================ [PASSED] check_graphics_ip ================
[05:44:46] ===================== check_media_ip  ======================
[05:44:46] [PASSED] 12.00 Xe_M
[05:44:46] [PASSED] 12.55 Xe_HPM
[05:44:46] [PASSED] 13.00 Xe_LPM+
[05:44:46] [PASSED] 13.01 Xe2_HPM
[05:44:46] [PASSED] 20.00 Xe2_LPM
[05:44:46] [PASSED] 30.00 Xe3_LPM
[05:44:46] [PASSED] 30.02 Xe3_LPM
[05:44:46] [PASSED] 35.00 Xe3p_LPM
[05:44:46] [PASSED] 35.03 Xe3p_HPM
[05:44:46] ================= [PASSED] check_media_ip ==================
[05:44:46] =================== check_platform_desc  ===================
[05:44:46] [PASSED] 0x9A60 (TIGERLAKE)
[05:44:46] [PASSED] 0x9A68 (TIGERLAKE)
[05:44:46] [PASSED] 0x9A70 (TIGERLAKE)
[05:44:46] [PASSED] 0x9A40 (TIGERLAKE)
[05:44:46] [PASSED] 0x9A49 (TIGERLAKE)
[05:44:46] [PASSED] 0x9A59 (TIGERLAKE)
[05:44:46] [PASSED] 0x9A78 (TIGERLAKE)
[05:44:46] [PASSED] 0x9AC0 (TIGERLAKE)
[05:44:46] [PASSED] 0x9AC9 (TIGERLAKE)
[05:44:46] [PASSED] 0x9AD9 (TIGERLAKE)
[05:44:46] [PASSED] 0x9AF8 (TIGERLAKE)
[05:44:46] [PASSED] 0x4C80 (ROCKETLAKE)
[05:44:46] [PASSED] 0x4C8A (ROCKETLAKE)
[05:44:46] [PASSED] 0x4C8B (ROCKETLAKE)
[05:44:46] [PASSED] 0x4C8C (ROCKETLAKE)
[05:44:46] [PASSED] 0x4C90 (ROCKETLAKE)
[05:44:46] [PASSED] 0x4C9A (ROCKETLAKE)
[05:44:46] [PASSED] 0x4680 (ALDERLAKE_S)
[05:44:46] [PASSED] 0x4682 (ALDERLAKE_S)
[05:44:46] [PASSED] 0x4688 (ALDERLAKE_S)
[05:44:46] [PASSED] 0x468A (ALDERLAKE_S)
[05:44:46] [PASSED] 0x468B (ALDERLAKE_S)
[05:44:46] [PASSED] 0x4690 (ALDERLAKE_S)
[05:44:46] [PASSED] 0x4692 (ALDERLAKE_S)
[05:44:46] [PASSED] 0x4693 (ALDERLAKE_S)
[05:44:46] [PASSED] 0x46A0 (ALDERLAKE_P)
[05:44:46] [PASSED] 0x46A1 (ALDERLAKE_P)
[05:44:46] [PASSED] 0x46A2 (ALDERLAKE_P)
[05:44:46] [PASSED] 0x46A3 (ALDERLAKE_P)
[05:44:46] [PASSED] 0x46A6 (ALDERLAKE_P)
[05:44:46] [PASSED] 0x46A8 (ALDERLAKE_P)
[05:44:46] [PASSED] 0x46AA (ALDERLAKE_P)
[05:44:46] [PASSED] 0x462A (ALDERLAKE_P)
[05:44:46] [PASSED] 0x4626 (ALDERLAKE_P)
[05:44:46] [PASSED] 0x4628 (ALDERLAKE_P)
[05:44:46] [PASSED] 0x46B0 (ALDERLAKE_P)
[05:44:46] [PASSED] 0x46B1 (ALDERLAKE_P)
[05:44:46] [PASSED] 0x46B2 (ALDERLAKE_P)
[05:44:46] [PASSED] 0x46B3 (ALDERLAKE_P)
[05:44:46] [PASSED] 0x46C0 (ALDERLAKE_P)
[05:44:46] [PASSED] 0x46C1 (ALDERLAKE_P)
[05:44:46] [PASSED] 0x46C2 (ALDERLAKE_P)
[05:44:46] [PASSED] 0x46C3 (ALDERLAKE_P)
[05:44:46] [PASSED] 0x46D0 (ALDERLAKE_N)
[05:44:46] [PASSED] 0x46D1 (ALDERLAKE_N)
[05:44:46] [PASSED] 0x46D2 (ALDERLAKE_N)
[05:44:46] [PASSED] 0x46D3 (ALDERLAKE_N)
[05:44:46] [PASSED] 0x46D4 (ALDERLAKE_N)
[05:44:46] [PASSED] 0xA721 (ALDERLAKE_P)
[05:44:46] [PASSED] 0xA7A1 (ALDERLAKE_P)
[05:44:46] [PASSED] 0xA7A9 (ALDERLAKE_P)
[05:44:46] [PASSED] 0xA7AC (ALDERLAKE_P)
[05:44:46] [PASSED] 0xA7AD (ALDERLAKE_P)
[05:44:46] [PASSED] 0xA720 (ALDERLAKE_P)
[05:44:46] [PASSED] 0xA7A0 (ALDERLAKE_P)
[05:44:46] [PASSED] 0xA7A8 (ALDERLAKE_P)
[05:44:46] [PASSED] 0xA7AA (ALDERLAKE_P)
[05:44:46] [PASSED] 0xA7AB (ALDERLAKE_P)
[05:44:46] [PASSED] 0xA780 (ALDERLAKE_S)
[05:44:46] [PASSED] 0xA781 (ALDERLAKE_S)
[05:44:46] [PASSED] 0xA782 (ALDERLAKE_S)
[05:44:46] [PASSED] 0xA783 (ALDERLAKE_S)
[05:44:46] [PASSED] 0xA788 (ALDERLAKE_S)
[05:44:46] [PASSED] 0xA789 (ALDERLAKE_S)
[05:44:46] [PASSED] 0xA78A (ALDERLAKE_S)
[05:44:46] [PASSED] 0xA78B (ALDERLAKE_S)
[05:44:46] [PASSED] 0x4905 (DG1)
[05:44:46] [PASSED] 0x4906 (DG1)
[05:44:46] [PASSED] 0x4907 (DG1)
[05:44:46] [PASSED] 0x4908 (DG1)
[05:44:46] [PASSED] 0x4909 (DG1)
[05:44:46] [PASSED] 0x56C0 (DG2)
[05:44:46] [PASSED] 0x56C2 (DG2)
[05:44:46] [PASSED] 0x56C1 (DG2)
[05:44:46] [PASSED] 0x7D51 (METEORLAKE)
[05:44:46] [PASSED] 0x7DD1 (METEORLAKE)
[05:44:46] [PASSED] 0x7D41 (METEORLAKE)
[05:44:46] [PASSED] 0x7D67 (METEORLAKE)
[05:44:46] [PASSED] 0xB640 (METEORLAKE)
[05:44:46] [PASSED] 0x56A0 (DG2)
[05:44:46] [PASSED] 0x56A1 (DG2)
[05:44:46] [PASSED] 0x56A2 (DG2)
[05:44:46] [PASSED] 0x56BE (DG2)
[05:44:46] [PASSED] 0x56BF (DG2)
[05:44:46] [PASSED] 0x5690 (DG2)
[05:44:46] [PASSED] 0x5691 (DG2)
[05:44:46] [PASSED] 0x5692 (DG2)
[05:44:46] [PASSED] 0x56A5 (DG2)
[05:44:46] [PASSED] 0x56A6 (DG2)
[05:44:46] [PASSED] 0x56B0 (DG2)
[05:44:46] [PASSED] 0x56B1 (DG2)
[05:44:46] [PASSED] 0x56BA (DG2)
[05:44:46] [PASSED] 0x56BB (DG2)
[05:44:46] [PASSED] 0x56BC (DG2)
[05:44:46] [PASSED] 0x56BD (DG2)
[05:44:46] [PASSED] 0x5693 (DG2)
[05:44:46] [PASSED] 0x5694 (DG2)
[05:44:46] [PASSED] 0x5695 (DG2)
[05:44:46] [PASSED] 0x56A3 (DG2)
[05:44:46] [PASSED] 0x56A4 (DG2)
[05:44:46] [PASSED] 0x56B2 (DG2)
[05:44:46] [PASSED] 0x56B3 (DG2)
[05:44:46] [PASSED] 0x5696 (DG2)
[05:44:46] [PASSED] 0x5697 (DG2)
[05:44:46] [PASSED] 0xB69 (PVC)
[05:44:46] [PASSED] 0xB6E (PVC)
[05:44:46] [PASSED] 0xBD4 (PVC)
[05:44:46] [PASSED] 0xBD5 (PVC)
[05:44:46] [PASSED] 0xBD6 (PVC)
[05:44:46] [PASSED] 0xBD7 (PVC)
[05:44:46] [PASSED] 0xBD8 (PVC)
[05:44:46] [PASSED] 0xBD9 (PVC)
[05:44:46] [PASSED] 0xBDA (PVC)
[05:44:46] [PASSED] 0xBDB (PVC)
[05:44:46] [PASSED] 0xBE0 (PVC)
[05:44:46] [PASSED] 0xBE1 (PVC)
[05:44:46] [PASSED] 0xBE5 (PVC)
[05:44:46] [PASSED] 0x7D40 (METEORLAKE)
[05:44:46] [PASSED] 0x7D45 (METEORLAKE)
[05:44:46] [PASSED] 0x7D55 (METEORLAKE)
[05:44:46] [PASSED] 0x7D60 (METEORLAKE)
[05:44:46] [PASSED] 0x7DD5 (METEORLAKE)
[05:44:46] [PASSED] 0x6420 (LUNARLAKE)
[05:44:46] [PASSED] 0x64A0 (LUNARLAKE)
[05:44:46] [PASSED] 0x64B0 (LUNARLAKE)
[05:44:46] [PASSED] 0xE202 (BATTLEMAGE)
[05:44:46] [PASSED] 0xE209 (BATTLEMAGE)
[05:44:46] [PASSED] 0xE20B (BATTLEMAGE)
[05:44:46] [PASSED] 0xE20C (BATTLEMAGE)
[05:44:46] [PASSED] 0xE20D (BATTLEMAGE)
[05:44:46] [PASSED] 0xE210 (BATTLEMAGE)
[05:44:46] [PASSED] 0xE211 (BATTLEMAGE)
[05:44:46] [PASSED] 0xE212 (BATTLEMAGE)
[05:44:46] [PASSED] 0xE216 (BATTLEMAGE)
[05:44:46] [PASSED] 0xE220 (BATTLEMAGE)
[05:44:46] [PASSED] 0xE221 (BATTLEMAGE)
[05:44:46] [PASSED] 0xE222 (BATTLEMAGE)
[05:44:46] [PASSED] 0xE223 (BATTLEMAGE)
[05:44:46] [PASSED] 0xB080 (PANTHERLAKE)
[05:44:46] [PASSED] 0xB081 (PANTHERLAKE)
[05:44:46] [PASSED] 0xB082 (PANTHERLAKE)
[05:44:46] [PASSED] 0xB083 (PANTHERLAKE)
[05:44:46] [PASSED] 0xB084 (PANTHERLAKE)
[05:44:46] [PASSED] 0xB085 (PANTHERLAKE)
[05:44:46] [PASSED] 0xB086 (PANTHERLAKE)
[05:44:46] [PASSED] 0xB087 (PANTHERLAKE)
[05:44:46] [PASSED] 0xB08F (PANTHERLAKE)
[05:44:46] [PASSED] 0xB090 (PANTHERLAKE)
[05:44:46] [PASSED] 0xB0A0 (PANTHERLAKE)
[05:44:46] [PASSED] 0xB0B0 (PANTHERLAKE)
[05:44:46] [PASSED] 0xFD80 (PANTHERLAKE)
[05:44:46] [PASSED] 0xFD81 (PANTHERLAKE)
[05:44:46] [PASSED] 0xD740 (NOVALAKE_S)
[05:44:46] [PASSED] 0xD741 (NOVALAKE_S)
[05:44:46] [PASSED] 0xD742 (NOVALAKE_S)
[05:44:46] [PASSED] 0xD743 (NOVALAKE_S)
[05:44:46] [PASSED] 0xD745 (NOVALAKE_S)
[05:44:46] [PASSED] 0xD74A (NOVALAKE_S)
[05:44:46] [PASSED] 0xD74B (NOVALAKE_S)
[05:44:46] [PASSED] 0x674C (CRESCENTISLAND)
[05:44:46] [PASSED] 0x674D (CRESCENTISLAND)
[05:44:46] [PASSED] 0x674E (CRESCENTISLAND)
[05:44:46] [PASSED] 0x674F (CRESCENTISLAND)
[05:44:46] [PASSED] 0x6750 (CRESCENTISLAND)
[05:44:46] [PASSED] 0xD750 (NOVALAKE_P)
[05:44:46] [PASSED] 0xD751 (NOVALAKE_P)
[05:44:46] [PASSED] 0xD752 (NOVALAKE_P)
[05:44:46] [PASSED] 0xD753 (NOVALAKE_P)
[05:44:46] [PASSED] 0xD754 (NOVALAKE_P)
[05:44:46] [PASSED] 0xD755 (NOVALAKE_P)
[05:44:46] [PASSED] 0xD756 (NOVALAKE_P)
[05:44:46] [PASSED] 0xD757 (NOVALAKE_P)
[05:44:46] [PASSED] 0xD75F (NOVALAKE_P)
[05:44:46] =============== [PASSED] check_platform_desc ===============
[05:44:46] ===================== [PASSED] xe_pci ======================
[05:44:46] ============= xe_rtp_tables_test (5 subtests) ==============
[05:44:46] ================== xe_rtp_table_gt_test  ===================
[05:44:46] [PASSED] gt_was/14011060649
[05:44:46] [PASSED] gt_was/14011059788
[05:44:46] [PASSED] gt_was/14015795083
[05:44:46] [PASSED] gt_was/16021867713
[05:44:46] [PASSED] gt_was/14019449301
[05:44:46] [PASSED] gt_was/16028005424
[05:44:46] [PASSED] gt_was/14026578760
[05:44:46] [PASSED] gt_was/1409420604
[05:44:46] [PASSED] gt_was/1408615072
[05:44:46] [PASSED] gt_was/22010523718
[05:44:46] [PASSED] gt_was/14011006942
[05:44:46] [PASSED] gt_was/14014830051
[05:44:46] [PASSED] gt_was/18018781329
[05:44:46] [PASSED] gt_was/1509235366
[05:44:46] [PASSED] gt_was/18018781329
[05:44:46] [PASSED] gt_was/16016694945
[05:44:46] [PASSED] gt_was/14018575942
[05:44:46] [PASSED] gt_was/22016670082
[05:44:46] [PASSED] gt_was/22016670082
[05:44:46] [PASSED] gt_was/14017421178
[05:44:46] [PASSED] gt_was/16025250150
[05:44:46] [PASSED] gt_was/14021871409
[05:44:46] [PASSED] gt_was/16021865536
[05:44:46] [PASSED] gt_was/14021486841
[05:44:46] [PASSED] gt_was/14025160223
[05:44:46] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[05:44:46] [PASSED] gt_was/14025635424
[05:44:46] [PASSED] gt_was/16028005424
[05:44:46] ============== [PASSED] xe_rtp_table_gt_test ===============
[05:44:46] ================== xe_rtp_table_gt_test  ===================
[05:44:46] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[05:44:46] [PASSED] gt_tunings/Tuning: 32B Access Enable
[05:44:46] [PASSED] gt_tunings/Tuning: L3 cache
[05:44:46] [PASSED] gt_tunings/Tuning: L3 cache - media
[05:44:46] [PASSED] gt_tunings/Tuning: Compression Overfetch
[05:44:46] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[05:44:46] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[05:44:46] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[05:44:46] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[05:44:46] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[05:44:46] [PASSED] gt_tunings/Tuning: Stateless compression control
[05:44:46] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[05:44:46] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[05:44:46] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[05:44:46] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[05:44:46] ============== [PASSED] xe_rtp_table_gt_test ===============
[05:44:46] ================== xe_rtp_table_oob_test  ==================
[05:44:46] [PASSED] oob_was/1607983814
[05:44:46] [PASSED] oob_was/16010904313
[05:44:46] [PASSED] oob_was/18022495364
[05:44:46] [PASSED] oob_was/22012773006
[05:44:46] [PASSED] oob_was/14014475959
[05:44:46] [PASSED] oob_was/22011391025
[05:44:46] [PASSED] oob_was/22012727170
[05:44:46] [PASSED] oob_was/22012727685
[05:44:46] [PASSED] oob_was/22016596838
[05:44:46] [PASSED] oob_was/18020744125
[05:44:46] [PASSED] oob_was/1409600907
[05:44:46] [PASSED] oob_was/22014953428
[05:44:46] [PASSED] oob_was/16017236439
[05:44:46] [PASSED] oob_was/14019821291
[05:44:46] [PASSED] oob_was/14015076503
[05:44:46] [PASSED] oob_was/14018913170
[05:44:46] [PASSED] oob_was/14018094691
[05:44:46] [PASSED] oob_was/18024947630
[05:44:46] [PASSED] oob_was/16022287689
[05:44:46] [PASSED] oob_was/13011645652
[05:44:46] [PASSED] oob_was/14022293748
[05:44:46] [PASSED] oob_was/22019794406
[05:44:46] [PASSED] oob_was/22019338487
[05:44:46] [PASSED] oob_was/16023588340
[05:44:46] [PASSED] oob_was/14019789679
[05:44:46] [PASSED] oob_was/14022866841
[05:44:46] [PASSED] oob_was/16021333562
[05:44:46] [PASSED] oob_was/14016712196
[05:44:46] [PASSED] oob_was/14015568240
[05:44:46] [PASSED] oob_was/18013179988
[05:44:46] [PASSED] oob_was/1508761755
[05:44:46] [PASSED] oob_was/16023105232
[05:44:46] [PASSED] oob_was/16026508708
[05:44:46] [PASSED] oob_was/14020001231
[05:44:46] [PASSED] oob_was/16023683509
[05:44:46] [PASSED] oob_was/14025515070
[05:44:46] [PASSED] oob_was/15015404425_disable
[05:44:46] [PASSED] oob_was/16026007364
[05:44:46] [PASSED] oob_was/14020316580
[05:44:46] [PASSED] oob_was/14025883347
[05:44:46] [PASSED] oob_was/16029380221
[05:44:46] [PASSED] oob_was/22022079272
[05:44:46] [PASSED] oob_was/16029897822
[05:44:46] [PASSED] oob_was/14027054324
[05:44:46] ============== [PASSED] xe_rtp_table_oob_test ==============
[05:44:46] ================ xe_rtp_table_dev_oob_test  ================
[05:44:46] [PASSED] device_oob_was/22010954014
[05:44:46] [PASSED] device_oob_was/15015404425
[05:44:46] [PASSED] device_oob_was/22019338487_display
[05:44:46] [PASSED] device_oob_was/14022085890
[05:44:46] [PASSED] device_oob_was/14026539277
[05:44:46] [PASSED] device_oob_was/14026633728
[05:44:46] [PASSED] device_oob_was/14026746987
[05:44:46] [PASSED] device_oob_was/14026779378
[05:44:46] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[05:44:46] ========== xe_rtp_table_missing_upper_bound_test  ==========
[05:44:46] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[05:44:46] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[05:44:46] [PASSED] register_whitelist/1806527549
[05:44:46] [PASSED] register_whitelist/allow_read_ctx_timestamp
[05:44:46] [PASSED] register_whitelist/allow_read_queue_timestamp
[05:44:46] [PASSED] register_whitelist/16014440446
[05:44:46] [PASSED] register_whitelist/16017236439
[05:44:46] [PASSED] register_whitelist/16020183090
[05:44:46] [PASSED] register_whitelist/14024997852
[05:44:46] [PASSED] register_whitelist/14024997852
[05:44:46] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[05:44:46] =============== [PASSED] xe_rtp_tables_test ================
[05:44:46] =================== xe_rtp (3 subtests) ====================
[05:44:47] =================== xe_rtp_rules_tests  ====================
[05:44:47] [PASSED] no
[05:44:47] [PASSED] yes
[05:44:47] [PASSED] no-and-no
[05:44:47] [PASSED] no-and-yes
[05:44:47] [PASSED] yes-and-no
[05:44:47] [PASSED] yes-and-yes
[05:44:47] [PASSED] no-or-no
[05:44:47] [PASSED] no-or-yes
[05:44:47] [PASSED] yes-or-no
[05:44:47] [PASSED] yes-or-yes
[05:44:47] [PASSED] no-yes-or-yes-no
[05:44:47] [PASSED] no-yes-or-yes-yes
[05:44:47] [PASSED] yes-yes-or-no-yes
[05:44:47] [PASSED] yes-yes-or-yes-yes
[05:44:47] [PASSED] no-no-or-yes-or-no
[05:44:47] [PASSED] or
[05:44:47] [PASSED] or-yes
[05:44:47] [PASSED] or-no
[05:44:47] [PASSED] yes-or
[05:44:47] [PASSED] no-or
[05:44:47] [PASSED] no-or-or-yes
[05:44:47] [PASSED] yes-or-or-no
[05:44:47] [PASSED] no-or-or-no
[05:44:47] [PASSED] missing-context-engine-class
[05:44:47] [PASSED] missing-context-engine-class-or-yes
[05:44:47] [PASSED] missing-context-engine-class-or-or-yes
[05:44:47] =============== [PASSED] xe_rtp_rules_tests ================
[05:44:47] =============== xe_rtp_process_to_sr_tests  ================
[05:44:47] [PASSED] coalesce-same-reg
[05:44:47] [PASSED] coalesce-same-reg-literal-and-func
[05:44:47] [PASSED] no-match-no-add
[05:44:47] [PASSED] two-regs-two-entries
[05:44:47] [PASSED] clr-one-set-other
[05:44:47] [PASSED] set-field
[05:44:47] [PASSED] conflict-duplicate
[05:44:47] [PASSED] conflict-not-disjoint
[05:44:47] [PASSED] conflict-not-disjoint-literal-and-func
[05:44:47] [PASSED] conflict-reg-type
[05:44:47] [PASSED] bad-mcr-reg-forced-to-regular
[05:44:47] [PASSED] bad-regular-reg-forced-to-mcr
[05:44:47] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[05:44:47] ================== xe_rtp_process_tests  ===================
[05:44:47] [PASSED] active1
[05:44:47] [PASSED] active2
[05:44:47] [PASSED] active-inactive
[05:44:47] [PASSED] inactive-active
[05:44:47] [PASSED] inactive-active-inactive
[05:44:47] [PASSED] inactive-inactive-inactive
[05:44:47] ============== [PASSED] xe_rtp_process_tests ===============
[05:44:47] ===================== [PASSED] xe_rtp ======================
[05:44:47] ==================== xe_wa (1 subtest) =====================
[05:44:47] ======================== xe_wa_gt  =========================
[05:44:47] [PASSED] TIGERLAKE B0
[05:44:47] [PASSED] DG1 A0
[05:44:47] [PASSED] DG1 B0
[05:44:47] [PASSED] ALDERLAKE_S A0
[05:44:47] [PASSED] ALDERLAKE_S B0
[05:44:47] [PASSED] ALDERLAKE_S C0
[05:44:47] [PASSED] ALDERLAKE_S D0
[05:44:47] [PASSED] ALDERLAKE_P A0
[05:44:47] [PASSED] ALDERLAKE_P B0
[05:44:47] [PASSED] ALDERLAKE_P C0
[05:44:47] [PASSED] ALDERLAKE_S RPLS D0
[05:44:47] [PASSED] ALDERLAKE_P RPLU E0
[05:44:47] [PASSED] DG2 G10 C0
[05:44:47] [PASSED] DG2 G11 B1
[05:44:47] [PASSED] DG2 G12 A1
[05:44:47] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[05:44:47] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[05:44:47] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[05:44:47] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[05:44:47] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[05:44:47] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[05:44:47] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[05:44:47] ==================== [PASSED] xe_wa_gt =====================
[05:44:47] ====================== [PASSED] xe_wa ======================
[05:44:47] ============================================================
[05:44:47] Testing complete. Ran 793 tests: passed: 765, skipped: 28
[05:44:47] Elapsed time: 36.332s total, 1.796s configuring, 33.770s building, 0.720s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[05:44:47] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:44:49] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[05:45:13] Starting KUnit Kernel (1/1)...
[05:45:13] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:45:13] ============= refcount_interrupt (4 subtests) ==============
[05:45:13] [PASSED] test_single_irq_change
[05:45:13] [PASSED] test_nested_irq_change
[05:45:13] [PASSED] test_multiple_irq_change
[05:45:13] [PASSED] test_irq_save
[05:45:13] =============== [PASSED] refcount_interrupt ================
[05:45:13] ============ drm_test_pick_cmdline (2 subtests) ============
[05:45:13] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[05:45:13] =============== drm_test_pick_cmdline_named  ===============
[05:45:13] [PASSED] NTSC
[05:45:13] [PASSED] NTSC-J
[05:45:13] [PASSED] PAL
[05:45:13] [PASSED] PAL-M
[05:45:13] =========== [PASSED] drm_test_pick_cmdline_named ===========
[05:45:13] ============== [PASSED] drm_test_pick_cmdline ==============
[05:45:13] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[05:45:13] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[05:45:13] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[05:45:13] =========== drm_validate_clone_mode (2 subtests) ===========
[05:45:13] ============== drm_test_check_in_clone_mode  ===============
[05:45:13] [PASSED] in_clone_mode
[05:45:13] [PASSED] not_in_clone_mode
[05:45:13] ========== [PASSED] drm_test_check_in_clone_mode ===========
[05:45:13] =============== drm_test_check_valid_clones  ===============
[05:45:13] [PASSED] not_in_clone_mode
[05:45:13] [PASSED] valid_clone
[05:45:13] [PASSED] invalid_clone
[05:45:13] =========== [PASSED] drm_test_check_valid_clones ===========
[05:45:13] ============= [PASSED] drm_validate_clone_mode =============
[05:45:13] ============= drm_validate_modeset (1 subtest) =============
[05:45:13] [PASSED] drm_test_check_connector_changed_modeset
[05:45:13] ============== [PASSED] drm_validate_modeset ===============
[05:45:13] ====== drm_test_bridge_get_current_state (1 subtest) =======
[05:45:13] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[05:45:13] ======== [PASSED] drm_test_bridge_get_current_state ========
[05:45:13] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[05:45:13] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[05:45:13] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[05:45:13] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[05:45:13] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[05:45:13] ============== drm_bridge_alloc (2 subtests) ===============
[05:45:13] [PASSED] drm_test_drm_bridge_alloc_basic
[05:45:13] [PASSED] drm_test_drm_bridge_alloc_get_put
[05:45:13] ================ [PASSED] drm_bridge_alloc =================
[05:45:13] ============= drm_bridge_bus_fmt (5 subtests) ==============
[05:45:13] [PASSED] drm_test_bridge_rgb_yuv_rgb
[05:45:13] [PASSED] drm_test_bridge_must_convert_to_yuv444
[05:45:13] [PASSED] drm_test_bridge_hdmi_auto_rgb
[05:45:13] [PASSED] drm_test_bridge_auto_first
[05:45:13] [PASSED] drm_test_bridge_rgb_yuv_no_path
[05:45:13] =============== [PASSED] drm_bridge_bus_fmt ================
[05:45:13] ============= drm_cmdline_parser (40 subtests) =============
[05:45:13] [PASSED] drm_test_cmdline_force_d_only
[05:45:13] [PASSED] drm_test_cmdline_force_D_only_dvi
[05:45:13] [PASSED] drm_test_cmdline_force_D_only_hdmi
[05:45:13] [PASSED] drm_test_cmdline_force_D_only_not_digital
[05:45:13] [PASSED] drm_test_cmdline_force_e_only
[05:45:13] [PASSED] drm_test_cmdline_res
[05:45:13] [PASSED] drm_test_cmdline_res_vesa
[05:45:13] [PASSED] drm_test_cmdline_res_vesa_rblank
[05:45:13] [PASSED] drm_test_cmdline_res_rblank
[05:45:13] [PASSED] drm_test_cmdline_res_bpp
[05:45:13] [PASSED] drm_test_cmdline_res_refresh
[05:45:13] [PASSED] drm_test_cmdline_res_bpp_refresh
[05:45:13] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[05:45:13] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[05:45:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[05:45:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[05:45:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[05:45:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[05:45:13] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[05:45:13] [PASSED] drm_test_cmdline_res_margins_force_on
[05:45:13] [PASSED] drm_test_cmdline_res_vesa_margins
[05:45:13] [PASSED] drm_test_cmdline_name
[05:45:13] [PASSED] drm_test_cmdline_name_bpp
[05:45:13] [PASSED] drm_test_cmdline_name_option
[05:45:13] [PASSED] drm_test_cmdline_name_bpp_option
[05:45:13] [PASSED] drm_test_cmdline_rotate_0
[05:45:13] [PASSED] drm_test_cmdline_rotate_90
[05:45:13] [PASSED] drm_test_cmdline_rotate_180
[05:45:13] [PASSED] drm_test_cmdline_rotate_270
[05:45:13] [PASSED] drm_test_cmdline_hmirror
[05:45:13] [PASSED] drm_test_cmdline_vmirror
[05:45:13] [PASSED] drm_test_cmdline_margin_options
[05:45:13] [PASSED] drm_test_cmdline_multiple_options
[05:45:13] [PASSED] drm_test_cmdline_bpp_extra_and_option
[05:45:13] [PASSED] drm_test_cmdline_extra_and_option
[05:45:13] [PASSED] drm_test_cmdline_freestanding_options
[05:45:13] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[05:45:13] [PASSED] drm_test_cmdline_panel_orientation
[05:45:13] ================ drm_test_cmdline_invalid  =================
[05:45:13] [PASSED] margin_only
[05:45:13] [PASSED] interlace_only
[05:45:13] [PASSED] res_missing_x
[05:45:13] [PASSED] res_missing_y
[05:45:13] [PASSED] res_bad_y
[05:45:13] [PASSED] res_missing_y_bpp
[05:45:13] [PASSED] res_bad_bpp
[05:45:13] [PASSED] res_bad_refresh
[05:45:13] [PASSED] res_bpp_refresh_force_on_off
[05:45:13] [PASSED] res_invalid_mode
[05:45:13] [PASSED] res_bpp_wrong_place_mode
[05:45:13] [PASSED] name_bpp_refresh
[05:45:13] [PASSED] name_refresh
[05:45:13] [PASSED] name_refresh_wrong_mode
[05:45:13] [PASSED] name_refresh_invalid_mode
[05:45:13] [PASSED] rotate_multiple
[05:45:13] [PASSED] rotate_invalid_val
[05:45:13] [PASSED] rotate_truncated
[05:45:13] [PASSED] invalid_option
[05:45:13] [PASSED] invalid_tv_option
[05:45:13] [PASSED] truncated_tv_option
[05:45:13] ============ [PASSED] drm_test_cmdline_invalid =============
[05:45:13] =============== drm_test_cmdline_tv_options  ===============
[05:45:13] [PASSED] NTSC
[05:45:13] [PASSED] NTSC_443
[05:45:13] [PASSED] NTSC_J
[05:45:13] [PASSED] PAL
[05:45:13] [PASSED] PAL_M
[05:45:13] [PASSED] PAL_N
[05:45:13] [PASSED] SECAM
[05:45:13] [PASSED] MONO_525
[05:45:13] [PASSED] MONO_625
[05:45:13] =========== [PASSED] drm_test_cmdline_tv_options ===========
[05:45:13] =============== [PASSED] drm_cmdline_parser ================
[05:45:13] ========== drmm_connector_hdmi_init (20 subtests) ==========
[05:45:13] [PASSED] drm_test_connector_hdmi_init_valid
[05:45:13] [PASSED] drm_test_connector_hdmi_init_bpc_8
[05:45:13] [PASSED] drm_test_connector_hdmi_init_bpc_10
[05:45:13] [PASSED] drm_test_connector_hdmi_init_bpc_12
[05:45:13] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[05:45:13] [PASSED] drm_test_connector_hdmi_init_bpc_null
[05:45:13] [PASSED] drm_test_connector_hdmi_init_formats_empty
[05:45:13] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[05:45:13] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[05:45:13] [PASSED] supported_formats=0x9 yuv420_allowed=1
[05:45:13] [PASSED] supported_formats=0x9 yuv420_allowed=0
[05:45:13] [PASSED] supported_formats=0x5 yuv420_allowed=1
[05:45:13] [PASSED] supported_formats=0x5 yuv420_allowed=0
[05:45:13] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[05:45:13] [PASSED] drm_test_connector_hdmi_init_null_ddc
[05:45:13] [PASSED] drm_test_connector_hdmi_init_null_product
[05:45:13] [PASSED] drm_test_connector_hdmi_init_null_vendor
[05:45:13] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[05:45:13] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[05:45:13] [PASSED] drm_test_connector_hdmi_init_product_valid
[05:45:13] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[05:45:13] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[05:45:13] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[05:45:13] ========= drm_test_connector_hdmi_init_type_valid  =========
[05:45:13] [PASSED] HDMI-A
[05:45:13] [PASSED] HDMI-B
[05:45:13] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[05:45:13] ======== drm_test_connector_hdmi_init_type_invalid  ========
[05:45:13] [PASSED] Unknown
[05:45:13] [PASSED] VGA
[05:45:13] [PASSED] DVI-I
[05:45:13] [PASSED] DVI-D
[05:45:13] [PASSED] DVI-A
[05:45:13] [PASSED] Composite
[05:45:13] [PASSED] SVIDEO
[05:45:13] [PASSED] LVDS
[05:45:13] [PASSED] Component
[05:45:13] [PASSED] DIN
[05:45:13] [PASSED] DP
[05:45:13] [PASSED] TV
[05:45:13] [PASSED] eDP
[05:45:13] [PASSED] Virtual
[05:45:13] [PASSED] DSI
[05:45:13] [PASSED] DPI
[05:45:13] [PASSED] Writeback
[05:45:13] [PASSED] SPI
[05:45:13] [PASSED] USB
[05:45:13] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[05:45:13] ============ [PASSED] drmm_connector_hdmi_init =============
[05:45:13] ============= drmm_connector_init (3 subtests) =============
[05:45:13] [PASSED] drm_test_drmm_connector_init
[05:45:13] [PASSED] drm_test_drmm_connector_init_null_ddc
[05:45:13] ========= drm_test_drmm_connector_init_type_valid  =========
[05:45:13] [PASSED] Unknown
[05:45:13] [PASSED] VGA
[05:45:13] [PASSED] DVI-I
[05:45:13] [PASSED] DVI-D
[05:45:13] [PASSED] DVI-A
[05:45:13] [PASSED] Composite
[05:45:13] [PASSED] SVIDEO
[05:45:13] [PASSED] LVDS
[05:45:13] [PASSED] Component
[05:45:13] [PASSED] DIN
[05:45:13] [PASSED] DP
[05:45:13] [PASSED] HDMI-A
[05:45:13] [PASSED] HDMI-B
[05:45:13] [PASSED] TV
[05:45:13] [PASSED] eDP
[05:45:13] [PASSED] Virtual
[05:45:13] [PASSED] DSI
[05:45:13] [PASSED] DPI
[05:45:13] [PASSED] Writeback
[05:45:13] [PASSED] SPI
[05:45:13] [PASSED] USB
[05:45:13] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[05:45:13] =============== [PASSED] drmm_connector_init ===============
[05:45:13] ========= drm_connector_dynamic_init (6 subtests) ==========
[05:45:13] [PASSED] drm_test_drm_connector_dynamic_init
[05:45:13] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[05:45:13] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[05:45:13] [PASSED] drm_test_drm_connector_dynamic_init_properties
[05:45:13] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[05:45:13] [PASSED] Unknown
[05:45:13] [PASSED] VGA
[05:45:13] [PASSED] DVI-I
[05:45:13] [PASSED] DVI-D
[05:45:13] [PASSED] DVI-A
[05:45:13] [PASSED] Composite
[05:45:13] [PASSED] SVIDEO
[05:45:13] [PASSED] LVDS
[05:45:13] [PASSED] Component
[05:45:13] [PASSED] DIN
[05:45:13] [PASSED] DP
[05:45:13] [PASSED] HDMI-A
[05:45:13] [PASSED] HDMI-B
[05:45:13] [PASSED] TV
[05:45:13] [PASSED] eDP
[05:45:13] [PASSED] Virtual
[05:45:13] [PASSED] DSI
[05:45:13] [PASSED] DPI
[05:45:13] [PASSED] Writeback
[05:45:13] [PASSED] SPI
[05:45:13] [PASSED] USB
[05:45:13] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[05:45:13] ======== drm_test_drm_connector_dynamic_init_name  =========
[05:45:13] [PASSED] Unknown
[05:45:13] [PASSED] VGA
[05:45:13] [PASSED] DVI-I
[05:45:13] [PASSED] DVI-D
[05:45:13] [PASSED] DVI-A
[05:45:13] [PASSED] Composite
[05:45:13] [PASSED] SVIDEO
[05:45:13] [PASSED] LVDS
[05:45:13] [PASSED] Component
[05:45:13] [PASSED] DIN
[05:45:13] [PASSED] DP
[05:45:13] [PASSED] HDMI-A
[05:45:13] [PASSED] HDMI-B
[05:45:13] [PASSED] TV
[05:45:13] [PASSED] eDP
[05:45:13] [PASSED] Virtual
[05:45:13] [PASSED] DSI
[05:45:13] [PASSED] DPI
[05:45:13] [PASSED] Writeback
[05:45:13] [PASSED] SPI
[05:45:13] [PASSED] USB
[05:45:13] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[05:45:13] =========== [PASSED] drm_connector_dynamic_init ============
[05:45:13] ==== drm_connector_dynamic_register_early (4 subtests) =====
[05:45:13] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[05:45:13] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[05:45:13] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[05:45:13] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[05:45:13] ====== [PASSED] drm_connector_dynamic_register_early =======
[05:45:13] ======= drm_connector_dynamic_register (7 subtests) ========
[05:45:13] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[05:45:13] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[05:45:13] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[05:45:13] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[05:45:13] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[05:45:13] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[05:45:13] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[05:45:13] ========= [PASSED] drm_connector_dynamic_register ==========
[05:45:13] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[05:45:13] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[05:45:13] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[05:45:13] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[05:45:13] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[05:45:13] ========== drm_test_get_tv_mode_from_name_valid  ===========
[05:45:13] [PASSED] NTSC
[05:45:13] [PASSED] NTSC-443
[05:45:13] [PASSED] NTSC-J
[05:45:13] [PASSED] PAL
[05:45:13] [PASSED] PAL-M
[05:45:13] [PASSED] PAL-N
[05:45:13] [PASSED] SECAM
[05:45:13] [PASSED] Mono
[05:45:13] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[05:45:13] [PASSED] drm_test_get_tv_mode_from_name_truncated
[05:45:13] ============ [PASSED] drm_get_tv_mode_from_name ============
[05:45:13] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[05:45:13] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[05:45:13] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[05:45:13] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[05:45:13] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[05:45:13] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[05:45:13] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[05:45:13] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[05:45:13] [PASSED] VIC 96
[05:45:13] [PASSED] VIC 97
[05:45:13] [PASSED] VIC 101
[05:45:13] [PASSED] VIC 102
[05:45:13] [PASSED] VIC 106
[05:45:13] [PASSED] VIC 107
[05:45:13] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[05:45:13] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[05:45:13] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[05:45:13] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[05:45:13] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[05:45:13] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[05:45:13] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[05:45:13] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[05:45:13] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[05:45:13] [PASSED] Automatic
[05:45:13] [PASSED] Full
[05:45:13] [PASSED] Limited 16:235
[05:45:13] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[05:45:13] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[05:45:13] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[05:45:13] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[05:45:13] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[05:45:13] [PASSED] RGB
[05:45:13] [PASSED] YUV 4:2:0
[05:45:13] [PASSED] YUV 4:2:2
[05:45:13] [PASSED] YUV 4:4:4
[05:45:13] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[05:45:13] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[05:45:13] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[05:45:13] ============= drm_damage_helper (21 subtests) ==============
[05:45:13] [PASSED] drm_test_damage_iter_no_damage
[05:45:13] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[05:45:13] [PASSED] drm_test_damage_iter_no_damage_src_moved
[05:45:13] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[05:45:13] [PASSED] drm_test_damage_iter_no_damage_not_visible
[05:45:13] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[05:45:13] [PASSED] drm_test_damage_iter_no_damage_no_fb
[05:45:13] [PASSED] drm_test_damage_iter_simple_damage
[05:45:13] [PASSED] drm_test_damage_iter_single_damage
[05:45:13] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[05:45:13] [PASSED] drm_test_damage_iter_single_damage_outside_src
[05:45:13] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[05:45:13] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[05:45:13] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[05:45:13] [PASSED] drm_test_damage_iter_single_damage_src_moved
[05:45:13] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[05:45:13] [PASSED] drm_test_damage_iter_damage
[05:45:13] [PASSED] drm_test_damage_iter_damage_one_intersect
[05:45:13] [PASSED] drm_test_damage_iter_damage_one_outside
[05:45:13] [PASSED] drm_test_damage_iter_damage_src_moved
[05:45:13] [PASSED] drm_test_damage_iter_damage_not_visible
[05:45:13] ================ [PASSED] drm_damage_helper ================
[05:45:13] ============== drm_dp_mst_helper (3 subtests) ==============
[05:45:13] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[05:45:13] [PASSED] Clock 154000 BPP 30 DSC disabled
[05:45:13] [PASSED] Clock 234000 BPP 30 DSC disabled
[05:45:13] [PASSED] Clock 297000 BPP 24 DSC disabled
[05:45:13] [PASSED] Clock 332880 BPP 24 DSC enabled
[05:45:13] [PASSED] Clock 324540 BPP 24 DSC enabled
[05:45:13] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[05:45:13] ============== drm_test_dp_mst_calc_pbn_div  ===============
[05:45:13] [PASSED] Link rate 2000000 lane count 4
[05:45:13] [PASSED] Link rate 2000000 lane count 2
[05:45:13] [PASSED] Link rate 2000000 lane count 1
[05:45:13] [PASSED] Link rate 1350000 lane count 4
[05:45:13] [PASSED] Link rate 1350000 lane count 2
[05:45:13] [PASSED] Link rate 1350000 lane count 1
[05:45:13] [PASSED] Link rate 1000000 lane count 4
[05:45:13] [PASSED] Link rate 1000000 lane count 2
[05:45:13] [PASSED] Link rate 1000000 lane count 1
[05:45:13] [PASSED] Link rate 810000 lane count 4
[05:45:13] [PASSED] Link rate 810000 lane count 2
[05:45:13] [PASSED] Link rate 810000 lane count 1
[05:45:13] [PASSED] Link rate 540000 lane count 4
[05:45:13] [PASSED] Link rate 540000 lane count 2
[05:45:13] [PASSED] Link rate 540000 lane count 1
[05:45:13] [PASSED] Link rate 270000 lane count 4
[05:45:13] [PASSED] Link rate 270000 lane count 2
[05:45:13] [PASSED] Link rate 270000 lane count 1
[05:45:13] [PASSED] Link rate 162000 lane count 4
[05:45:13] [PASSED] Link rate 162000 lane count 2
[05:45:13] [PASSED] Link rate 162000 lane count 1
[05:45:13] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[05:45:13] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[05:45:13] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[05:45:13] [PASSED] DP_POWER_UP_PHY with port number
[05:45:13] [PASSED] DP_POWER_DOWN_PHY with port number
[05:45:13] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[05:45:13] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[05:45:13] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[05:45:13] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[05:45:13] [PASSED] DP_QUERY_PAYLOAD with port number
[05:45:13] [PASSED] DP_QUERY_PAYLOAD with VCPI
[05:45:13] [PASSED] DP_REMOTE_DPCD_READ with port number
[05:45:13] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[05:45:13] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[05:45:13] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[05:45:13] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[05:45:13] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[05:45:13] [PASSED] DP_REMOTE_I2C_READ with port number
[05:45:13] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[05:45:13] [PASSED] DP_REMOTE_I2C_READ with transactions array
[05:45:13] [PASSED] DP_REMOTE_I2C_WRITE with port number
[05:45:13] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[05:45:13] [PASSED] DP_REMOTE_I2C_WRITE with data array
[05:45:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[05:45:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[05:45:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[05:45:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[05:45:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[05:45:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[05:45:13] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[05:45:13] ================ [PASSED] drm_dp_mst_helper ================
[05:45:13] ================== drm_exec (7 subtests) ===================
[05:45:13] [PASSED] sanitycheck
[05:45:13] [PASSED] test_lock
[05:45:13] [PASSED] test_lock_unlock
[05:45:13] [PASSED] test_duplicates
[05:45:13] [PASSED] test_prepare
[05:45:13] [PASSED] test_prepare_array
[05:45:13] [PASSED] test_multiple_loops
[05:45:13] ==================== [PASSED] drm_exec =====================
[05:45:13] =========== drm_format_helper_test (17 subtests) ===========
[05:45:13] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[05:45:13] [PASSED] single_pixel_source_buffer
[05:45:13] [PASSED] single_pixel_clip_rectangle
[05:45:13] [PASSED] well_known_colors
[05:45:13] [PASSED] destination_pitch
[05:45:13] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[05:45:13] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[05:45:13] [PASSED] single_pixel_source_buffer
[05:45:13] [PASSED] single_pixel_clip_rectangle
[05:45:13] [PASSED] well_known_colors
[05:45:13] [PASSED] destination_pitch
[05:45:13] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[05:45:13] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[05:45:13] [PASSED] single_pixel_source_buffer
[05:45:13] [PASSED] single_pixel_clip_rectangle
[05:45:13] [PASSED] well_known_colors
[05:45:13] [PASSED] destination_pitch
[05:45:13] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[05:45:13] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[05:45:13] [PASSED] single_pixel_source_buffer
[05:45:13] [PASSED] single_pixel_clip_rectangle
[05:45:13] [PASSED] well_known_colors
[05:45:13] [PASSED] destination_pitch
[05:45:13] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[05:45:13] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[05:45:13] [PASSED] single_pixel_source_buffer
[05:45:13] [PASSED] single_pixel_clip_rectangle
[05:45:13] [PASSED] well_known_colors
[05:45:13] [PASSED] destination_pitch
[05:45:13] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[05:45:13] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[05:45:13] [PASSED] single_pixel_source_buffer
[05:45:13] [PASSED] single_pixel_clip_rectangle
[05:45:13] [PASSED] well_known_colors
[05:45:13] [PASSED] destination_pitch
[05:45:13] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[05:45:13] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[05:45:13] [PASSED] single_pixel_source_buffer
[05:45:13] [PASSED] single_pixel_clip_rectangle
[05:45:13] [PASSED] well_known_colors
[05:45:13] [PASSED] destination_pitch
[05:45:13] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[05:45:13] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[05:45:13] [PASSED] single_pixel_source_buffer
[05:45:13] [PASSED] single_pixel_clip_rectangle
[05:45:13] [PASSED] well_known_colors
[05:45:13] [PASSED] destination_pitch
[05:45:13] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[05:45:13] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[05:45:13] [PASSED] single_pixel_source_buffer
[05:45:13] [PASSED] single_pixel_clip_rectangle
[05:45:13] [PASSED] well_known_colors
[05:45:13] [PASSED] destination_pitch
[05:45:13] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[05:45:13] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[05:45:13] [PASSED] single_pixel_source_buffer
[05:45:13] [PASSED] single_pixel_clip_rectangle
[05:45:13] [PASSED] well_known_colors
[05:45:13] [PASSED] destination_pitch
[05:45:13] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[05:45:13] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[05:45:13] [PASSED] single_pixel_source_buffer
[05:45:13] [PASSED] single_pixel_clip_rectangle
[05:45:13] [PASSED] well_known_colors
[05:45:13] [PASSED] destination_pitch
[05:45:13] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[05:45:13] ============== drm_test_fb_xrgb8888_to_mono  ===============
[05:45:13] [PASSED] single_pixel_source_buffer
[05:45:13] [PASSED] single_pixel_clip_rectangle
[05:45:13] [PASSED] well_known_colors
[05:45:13] [PASSED] destination_pitch
[05:45:13] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[05:45:13] ==================== drm_test_fb_swab  =====================
[05:45:13] [PASSED] single_pixel_source_buffer
[05:45:13] [PASSED] single_pixel_clip_rectangle
[05:45:13] [PASSED] well_known_colors
[05:45:13] [PASSED] destination_pitch
[05:45:13] ================ [PASSED] drm_test_fb_swab =================
[05:45:13] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[05:45:13] [PASSED] single_pixel_source_buffer
[05:45:13] [PASSED] single_pixel_clip_rectangle
[05:45:13] [PASSED] well_known_colors
[05:45:13] [PASSED] destination_pitch
[05:45:13] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[05:45:13] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[05:45:13] [PASSED] single_pixel_source_buffer
[05:45:13] [PASSED] single_pixel_clip_rectangle
[05:45:13] [PASSED] well_known_colors
[05:45:13] [PASSED] destination_pitch
[05:45:13] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[05:45:13] ================= drm_test_fb_clip_offset  =================
[05:45:13] [PASSED] pass through
[05:45:13] [PASSED] horizontal offset
[05:45:13] [PASSED] vertical offset
[05:45:13] [PASSED] horizontal and vertical offset
[05:45:13] [PASSED] horizontal offset (custom pitch)
[05:45:13] [PASSED] vertical offset (custom pitch)
[05:45:13] [PASSED] horizontal and vertical offset (custom pitch)
[05:45:13] ============= [PASSED] drm_test_fb_clip_offset =============
[05:45:13] =================== drm_test_fb_memcpy  ====================
[05:45:13] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[05:45:13] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[05:45:13] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[05:45:13] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[05:45:13] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[05:45:13] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[05:45:13] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[05:45:13] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[05:45:13] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[05:45:13] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[05:45:13] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[05:45:13] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[05:45:13] =============== [PASSED] drm_test_fb_memcpy ================
[05:45:13] ============= [PASSED] drm_format_helper_test ==============
[05:45:13] ================= drm_format (18 subtests) =================
[05:45:13] [PASSED] drm_test_format_block_width_invalid
[05:45:13] [PASSED] drm_test_format_block_width_one_plane
[05:45:13] [PASSED] drm_test_format_block_width_two_plane
[05:45:13] [PASSED] drm_test_format_block_width_three_plane
[05:45:13] [PASSED] drm_test_format_block_width_tiled
[05:45:13] [PASSED] drm_test_format_block_height_invalid
[05:45:13] [PASSED] drm_test_format_block_height_one_plane
[05:45:13] [PASSED] drm_test_format_block_height_two_plane
[05:45:13] [PASSED] drm_test_format_block_height_three_plane
[05:45:13] [PASSED] drm_test_format_block_height_tiled
[05:45:13] [PASSED] drm_test_format_min_pitch_invalid
[05:45:13] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[05:45:13] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[05:45:13] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[05:45:13] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[05:45:13] [PASSED] drm_test_format_min_pitch_two_plane
[05:45:13] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[05:45:13] [PASSED] drm_test_format_min_pitch_tiled
[05:45:13] =================== [PASSED] drm_format ====================
[05:45:13] ============== drm_framebuffer (10 subtests) ===============
[05:45:13] ========== drm_test_framebuffer_check_src_coords  ==========
[05:45:13] [PASSED] Success: source fits into fb
[05:45:13] [PASSED] Fail: overflowing fb with x-axis coordinate
[05:45:13] [PASSED] Fail: overflowing fb with y-axis coordinate
[05:45:13] [PASSED] Fail: overflowing fb with source width
[05:45:13] [PASSED] Fail: overflowing fb with source height
[05:45:13] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[05:45:13] [PASSED] drm_test_framebuffer_cleanup
[05:45:13] =============== drm_test_framebuffer_create  ===============
[05:45:13] [PASSED] ABGR8888 normal sizes
[05:45:13] [PASSED] ABGR8888 max sizes
[05:45:13] [PASSED] ABGR8888 pitch greater than min required
[05:45:13] [PASSED] ABGR8888 pitch less than min required
[05:45:13] [PASSED] ABGR8888 Invalid width
[05:45:13] [PASSED] ABGR8888 Invalid buffer handle
[05:45:13] [PASSED] No pixel format
[05:45:13] [PASSED] ABGR8888 Width 0
[05:45:13] [PASSED] ABGR8888 Height 0
[05:45:13] [PASSED] ABGR8888 Out of bound height * pitch combination
[05:45:13] [PASSED] ABGR8888 Large buffer offset
[05:45:13] [PASSED] ABGR8888 Buffer offset for inexistent plane
[05:45:13] [PASSED] ABGR8888 Invalid flag
[05:45:13] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[05:45:13] [PASSED] ABGR8888 Valid buffer modifier
[05:45:13] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[05:45:13] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[05:45:13] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[05:45:13] [PASSED] NV12 Normal sizes
[05:45:13] [PASSED] NV12 Max sizes
[05:45:13] [PASSED] NV12 Invalid pitch
[05:45:13] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[05:45:13] [PASSED] NV12 different  modifier per-plane
[05:45:13] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[05:45:13] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[05:45:13] [PASSED] NV12 Modifier for inexistent plane
[05:45:13] [PASSED] NV12 Handle for inexistent plane
[05:45:13] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[05:45:13] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[05:45:13] [PASSED] YVU420 Normal sizes
[05:45:13] [PASSED] YVU420 Max sizes
[05:45:13] [PASSED] YVU420 Invalid pitch
[05:45:13] [PASSED] YVU420 Different pitches
[05:45:13] [PASSED] YVU420 Different buffer offsets/pitches
[05:45:13] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[05:45:13] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[05:45:13] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[05:45:13] [PASSED] YVU420 Valid modifier
[05:45:13] [PASSED] YVU420 Different modifiers per plane
[05:45:13] [PASSED] YVU420 Modifier for inexistent plane
[05:45:13] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[05:45:13] [PASSED] X0L2 Normal sizes
[05:45:13] [PASSED] X0L2 Max sizes
[05:45:13] [PASSED] X0L2 Invalid pitch
[05:45:13] [PASSED] X0L2 Pitch greater than minimum required
[05:45:13] [PASSED] X0L2 Handle for inexistent plane
[05:45:13] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[05:45:13] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[05:45:13] [PASSED] X0L2 Valid modifier
[05:45:13] [PASSED] X0L2 Modifier for inexistent plane
[05:45:13] =========== [PASSED] drm_test_framebuffer_create ===========
[05:45:13] [PASSED] drm_test_framebuffer_free
[05:45:13] [PASSED] drm_test_framebuffer_init
[05:45:13] [PASSED] drm_test_framebuffer_init_bad_format
[05:45:13] [PASSED] drm_test_framebuffer_init_dev_mismatch
[05:45:13] [PASSED] drm_test_framebuffer_lookup
[05:45:13] [PASSED] drm_test_framebuffer_lookup_inexistent
[05:45:13] [PASSED] drm_test_framebuffer_modifiers_not_supported
[05:45:13] ================= [PASSED] drm_framebuffer =================
[05:45:13] ================ drm_gem_shmem (8 subtests) ================
[05:45:13] [PASSED] drm_gem_shmem_test_obj_create
[05:45:13] [PASSED] drm_gem_shmem_test_obj_create_private
[05:45:13] [PASSED] drm_gem_shmem_test_pin_pages
[05:45:13] [PASSED] drm_gem_shmem_test_vmap
[05:45:13] [PASSED] drm_gem_shmem_test_get_sg_table
[05:45:13] [PASSED] drm_gem_shmem_test_get_pages_sgt
[05:45:13] [PASSED] drm_gem_shmem_test_madvise
[05:45:13] [PASSED] drm_gem_shmem_test_purge
[05:45:13] ================== [PASSED] drm_gem_shmem ==================
[05:45:13] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[05:45:13] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[05:45:13] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[05:45:13] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[05:45:13] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[05:45:13] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[05:45:13] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[05:45:13] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[05:45:13] [PASSED] Automatic
[05:45:13] [PASSED] Full
[05:45:13] [PASSED] Limited 16:235
[05:45:13] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[05:45:13] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[05:45:13] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[05:45:13] [PASSED] drm_test_check_disable_connector
[05:45:13] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[05:45:13] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[05:45:13] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[05:45:13] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[05:45:13] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[05:45:13] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[05:45:13] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[05:45:13] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[05:45:13] [PASSED] drm_test_check_output_bpc_dvi
[05:45:13] [PASSED] drm_test_check_output_bpc_format_vic_1
[05:45:13] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[05:45:13] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[05:45:13] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[05:45:13] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[05:45:13] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[05:45:13] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[05:45:13] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[05:45:13] ============ drm_test_check_hdmi_color_format  =============
[05:45:13] [PASSED] AUTO -> RGB
[05:45:13] [PASSED] YCBCR422 -> YUV422
[05:45:13] [PASSED] YCBCR420 -> YUV420
[05:45:13] [PASSED] YCBCR444 -> YUV444
[05:45:13] [PASSED] RGB -> RGB
[05:45:13] ======== [PASSED] drm_test_check_hdmi_color_format =========
[05:45:13] ======== drm_test_check_hdmi_color_format_420_only  ========
[05:45:13] [PASSED] RGB should fail
[05:45:13] [PASSED] YUV444 should fail
[05:45:13] [PASSED] YUV422 should fail
[05:45:13] [PASSED] YUV420 should work
[05:45:13] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[05:45:13] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[05:45:13] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[05:45:13] [PASSED] drm_test_check_broadcast_rgb_value
[05:45:13] [PASSED] drm_test_check_bpc_8_value
[05:45:13] [PASSED] drm_test_check_bpc_10_value
[05:45:13] [PASSED] drm_test_check_bpc_12_value
[05:45:13] [PASSED] drm_test_check_format_value
[05:45:13] [PASSED] drm_test_check_tmds_char_value
[05:45:13] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[05:45:13] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[05:45:13] [PASSED] drm_test_check_mode_valid
[05:45:13] [PASSED] drm_test_check_mode_valid_reject
[05:45:13] [PASSED] drm_test_check_mode_valid_reject_rate
[05:45:13] [PASSED] drm_test_check_mode_valid_reject_max_clock
[05:45:13] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[05:45:13] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[05:45:13] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[05:45:13] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[05:45:13] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[05:45:13] [PASSED] drm_test_check_infoframes
[05:45:13] [PASSED] drm_test_check_reject_avi_infoframe
[05:45:13] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[05:45:13] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[05:45:13] [PASSED] drm_test_check_reject_audio_infoframe
[05:45:13] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[05:45:13] ================= drm_managed (2 subtests) =================
[05:45:13] [PASSED] drm_test_managed_release_action
[05:45:13] [PASSED] drm_test_managed_run_action
[05:45:13] =================== [PASSED] drm_managed ===================
[05:45:13] =================== drm_mm (6 subtests) ====================
[05:45:13] [PASSED] drm_test_mm_init
[05:45:13] [PASSED] drm_test_mm_debug
[05:45:13] [PASSED] drm_test_mm_align32
[05:45:13] [PASSED] drm_test_mm_align64
[05:45:13] [PASSED] drm_test_mm_lowest
[05:45:13] [PASSED] drm_test_mm_highest
[05:45:13] ===================== [PASSED] drm_mm ======================
[05:45:13] ============= drm_modes_analog_tv (5 subtests) =============
[05:45:13] [PASSED] drm_test_modes_analog_tv_mono_576i
[05:45:13] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[05:45:13] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[05:45:13] [PASSED] drm_test_modes_analog_tv_pal_576i
[05:45:13] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[05:45:13] =============== [PASSED] drm_modes_analog_tv ===============
[05:45:13] ============== drm_plane_helper (2 subtests) ===============
[05:45:13] =============== drm_test_check_plane_state  ================
[05:45:13] [PASSED] clipping_simple
[05:45:13] [PASSED] clipping_rotate_reflect
[05:45:13] [PASSED] positioning_simple
[05:45:13] [PASSED] upscaling
[05:45:13] [PASSED] downscaling
[05:45:13] [PASSED] rounding1
[05:45:13] [PASSED] rounding2
[05:45:13] [PASSED] rounding3
[05:45:13] [PASSED] rounding4
[05:45:13] =========== [PASSED] drm_test_check_plane_state ============
[05:45:13] =========== drm_test_check_invalid_plane_state  ============
[05:45:13] [PASSED] positioning_invalid
[05:45:13] [PASSED] upscaling_invalid
[05:45:13] [PASSED] downscaling_invalid
[05:45:13] ======= [PASSED] drm_test_check_invalid_plane_state ========
[05:45:13] ================ [PASSED] drm_plane_helper =================
[05:45:13] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[05:45:13] ====== drm_test_connector_helper_tv_get_modes_check  =======
[05:45:13] [PASSED] None
[05:45:13] [PASSED] PAL
[05:45:13] [PASSED] NTSC
[05:45:13] [PASSED] Both, NTSC Default
[05:45:13] [PASSED] Both, PAL Default
[05:45:13] [PASSED] Both, NTSC Default, with PAL on command-line
[05:45:13] [PASSED] Both, PAL Default, with NTSC on command-line
[05:45:13] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[05:45:13] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[05:45:13] ================== drm_rect (9 subtests) ===================
[05:45:13] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[05:45:13] [PASSED] drm_test_rect_clip_scaled_not_clipped
[05:45:13] [PASSED] drm_test_rect_clip_scaled_clipped
[05:45:13] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[05:45:13] ================= drm_test_rect_intersect  =================
[05:45:13] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[05:45:13] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[05:45:13] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[05:45:13] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[05:45:13] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[05:45:13] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[05:45:13] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[05:45:13] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[05:45:13] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[05:45:13] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[05:45:13] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[05:45:13] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[05:45:13] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[05:45:13] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[05:45:13] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[05:45:13] ============= [PASSED] drm_test_rect_intersect =============
[05:45:13] ================ drm_test_rect_calc_hscale  ================
[05:45:13] [PASSED] normal use
[05:45:13] [PASSED] out of max range
[05:45:13] [PASSED] out of min range
[05:45:13] [PASSED] zero dst
[05:45:13] [PASSED] negative src
[05:45:13] [PASSED] negative dst
[05:45:13] ============ [PASSED] drm_test_rect_calc_hscale ============
[05:45:13] ================ drm_test_rect_calc_vscale  ================
[05:45:13] [PASSED] normal use
[05:45:13] [PASSED] out of max range
[05:45:13] [PASSED] out of min range
[05:45:13] [PASSED] zero dst
[05:45:13] [PASSED] negative src
[05:45:13] [PASSED] negative dst
[05:45:13] ============ [PASSED] drm_test_rect_calc_vscale ============
[05:45:13] ================== drm_test_rect_rotate  ===================
[05:45:13] [PASSED] reflect-x
[05:45:13] [PASSED] reflect-y
[05:45:13] [PASSED] rotate-0
[05:45:13] [PASSED] rotate-90
[05:45:13] [PASSED] rotate-180
[05:45:13] [PASSED] rotate-270
[05:45:13] ============== [PASSED] drm_test_rect_rotate ===============
[05:45:13] ================ drm_test_rect_rotate_inv  =================
[05:45:13] [PASSED] reflect-x
[05:45:13] [PASSED] reflect-y
[05:45:13] [PASSED] rotate-0
[05:45:13] [PASSED] rotate-90
[05:45:13] [PASSED] rotate-180
[05:45:13] [PASSED] rotate-270
[05:45:13] ============ [PASSED] drm_test_rect_rotate_inv =============
[05:45:13] ==================== [PASSED] drm_rect =====================
[05:45:13] ============ drm_sysfb_modeset_test (1 subtest) ============
[05:45:13] ============ drm_test_sysfb_build_fourcc_list  =============
[05:45:13] [PASSED] no native formats
[05:45:13] [PASSED] XRGB8888 as native format
[05:45:13] [PASSED] remove duplicates
[05:45:13] [PASSED] convert alpha formats
[05:45:13] [PASSED] random formats
[05:45:13] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[05:45:13] ============= [PASSED] drm_sysfb_modeset_test ==============
[05:45:13] ================== drm_fixp (2 subtests) ===================
[05:45:13] [PASSED] drm_test_int2fixp
[05:45:13] [PASSED] drm_test_sm2fixp
[05:45:13] ==================== [PASSED] drm_fixp =====================
[05:45:13] ============================================================
[05:45:13] Testing complete. Ran 641 tests: passed: 641
[05:45:13] Elapsed time: 26.539s total, 1.764s configuring, 24.610s building, 0.152s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[05:45:13] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:45:15] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[05:45:25] Starting KUnit Kernel (1/1)...
[05:45:25] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:45:25] ============= refcount_interrupt (4 subtests) ==============
[05:45:25] [PASSED] test_single_irq_change
[05:45:25] [PASSED] test_nested_irq_change
[05:45:25] [PASSED] test_multiple_irq_change
[05:45:25] [PASSED] test_irq_save
[05:45:25] =============== [PASSED] refcount_interrupt ================
[05:45:25] ================= ttm_device (5 subtests) ==================
[05:45:25] [PASSED] ttm_device_init_basic
[05:45:25] [PASSED] ttm_device_init_multiple
[05:45:25] [PASSED] ttm_device_fini_basic
[05:45:25] [PASSED] ttm_device_init_no_vma_man
[05:45:25] ================== ttm_device_init_pools  ==================
[05:45:25] [PASSED] No DMA allocations, no DMA32 required
[05:45:25] [PASSED] DMA allocations, DMA32 required
[05:45:25] [PASSED] No DMA allocations, DMA32 required
[05:45:25] [PASSED] DMA allocations, no DMA32 required
[05:45:25] ============== [PASSED] ttm_device_init_pools ==============
[05:45:25] =================== [PASSED] ttm_device ====================
[05:45:25] ================== ttm_pool (8 subtests) ===================
[05:45:25] ================== ttm_pool_alloc_basic  ===================
[05:45:25] [PASSED] One page
[05:45:25] [PASSED] More than one page
[05:45:25] [PASSED] Above the allocation limit
[05:45:25] [PASSED] One page, with coherent DMA mappings enabled
[05:45:25] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[05:45:25] ============== [PASSED] ttm_pool_alloc_basic ===============
[05:45:25] ============== ttm_pool_alloc_basic_dma_addr  ==============
[05:45:25] [PASSED] One page
[05:45:25] [PASSED] More than one page
[05:45:25] [PASSED] Above the allocation limit
[05:45:25] [PASSED] One page, with coherent DMA mappings enabled
[05:45:25] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[05:45:25] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[05:45:25] [PASSED] ttm_pool_alloc_order_caching_match
[05:45:25] [PASSED] ttm_pool_alloc_caching_mismatch
[05:45:25] [PASSED] ttm_pool_alloc_order_mismatch
[05:45:25] [PASSED] ttm_pool_free_dma_alloc
[05:45:25] [PASSED] ttm_pool_free_no_dma_alloc
[05:45:25] [PASSED] ttm_pool_fini_basic
[05:45:25] ==================== [PASSED] ttm_pool =====================
[05:45:25] ================ ttm_resource (8 subtests) =================
[05:45:25] ================= ttm_resource_init_basic  =================
[05:45:25] [PASSED] Init resource in TTM_PL_SYSTEM
[05:45:25] [PASSED] Init resource in TTM_PL_VRAM
[05:45:25] [PASSED] Init resource in a private placement
[05:45:25] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[05:45:25] ============= [PASSED] ttm_resource_init_basic =============
[05:45:25] [PASSED] ttm_resource_init_pinned
[05:45:25] [PASSED] ttm_resource_fini_basic
[05:45:25] [PASSED] ttm_resource_manager_init_basic
[05:45:25] [PASSED] ttm_resource_manager_usage_basic
[05:45:25] [PASSED] ttm_resource_manager_set_used_basic
[05:45:25] [PASSED] ttm_sys_man_alloc_basic
[05:45:25] [PASSED] ttm_sys_man_free_basic
[05:45:25] ================== [PASSED] ttm_resource ===================
[05:45:25] =================== ttm_tt (15 subtests) ===================
[05:45:25] ==================== ttm_tt_init_basic  ====================
[05:45:25] [PASSED] Page-aligned size
[05:45:25] [PASSED] Extra pages requested
[05:45:25] ================ [PASSED] ttm_tt_init_basic ================
[05:45:25] [PASSED] ttm_tt_init_misaligned
[05:45:25] [PASSED] ttm_tt_fini_basic
[05:45:25] [PASSED] ttm_tt_fini_sg
[05:45:25] [PASSED] ttm_tt_fini_shmem
[05:45:25] [PASSED] ttm_tt_create_basic
[05:45:25] [PASSED] ttm_tt_create_invalid_bo_type
[05:45:25] [PASSED] ttm_tt_create_ttm_exists
[05:45:25] [PASSED] ttm_tt_create_failed
[05:45:25] [PASSED] ttm_tt_destroy_basic
[05:45:25] [PASSED] ttm_tt_populate_null_ttm
[05:45:25] [PASSED] ttm_tt_populate_populated_ttm
[05:45:25] [PASSED] ttm_tt_unpopulate_basic
[05:45:25] [PASSED] ttm_tt_unpopulate_empty_ttm
[05:45:25] [PASSED] ttm_tt_swapin_basic
[05:45:25] ===================== [PASSED] ttm_tt ======================
[05:45:25] =================== ttm_bo (14 subtests) ===================
[05:45:25] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[05:45:25] [PASSED] Cannot be interrupted and sleeps
[05:45:25] [PASSED] Cannot be interrupted, locks straight away
[05:45:25] [PASSED] Can be interrupted, sleeps
[05:45:25] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[05:45:25] [PASSED] ttm_bo_reserve_locked_no_sleep
[05:45:25] [PASSED] ttm_bo_reserve_no_wait_ticket
[05:45:25] [PASSED] ttm_bo_reserve_double_resv
[05:45:25] [PASSED] ttm_bo_reserve_interrupted
[05:45:25] [PASSED] ttm_bo_reserve_deadlock
[05:45:25] [PASSED] ttm_bo_unreserve_basic
[05:45:25] [PASSED] ttm_bo_unreserve_pinned
[05:45:25] [PASSED] ttm_bo_unreserve_bulk
[05:45:25] [PASSED] ttm_bo_fini_basic
[05:45:25] [PASSED] ttm_bo_fini_shared_resv
[05:45:25] [PASSED] ttm_bo_pin_basic
[05:45:25] [PASSED] ttm_bo_pin_unpin_resource
[05:45:25] [PASSED] ttm_bo_multiple_pin_one_unpin
[05:45:25] ===================== [PASSED] ttm_bo ======================
[05:45:25] ============== ttm_bo_validate (22 subtests) ===============
[05:45:25] ============== ttm_bo_init_reserved_sys_man  ===============
[05:45:25] [PASSED] Buffer object for userspace
[05:45:25] [PASSED] Kernel buffer object
[05:45:25] [PASSED] Shared buffer object
[05:45:25] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[05:45:25] ============== ttm_bo_init_reserved_mock_man  ==============
[05:45:25] [PASSED] Buffer object for userspace
[05:45:25] [PASSED] Kernel buffer object
[05:45:25] [PASSED] Shared buffer object
[05:45:25] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[05:45:25] [PASSED] ttm_bo_init_reserved_resv
[05:45:25] ================== ttm_bo_validate_basic  ==================
[05:45:25] [PASSED] Buffer object for userspace
[05:45:25] [PASSED] Kernel buffer object
[05:45:25] [PASSED] Shared buffer object
[05:45:25] ============== [PASSED] ttm_bo_validate_basic ==============
[05:45:25] [PASSED] ttm_bo_validate_invalid_placement
[05:45:25] ============= ttm_bo_validate_same_placement  ==============
[05:45:25] [PASSED] System manager
[05:45:25] [PASSED] VRAM manager
[05:45:25] ========= [PASSED] ttm_bo_validate_same_placement ==========
[05:45:25] [PASSED] ttm_bo_validate_failed_alloc
[05:45:25] [PASSED] ttm_bo_validate_pinned
[05:45:25] [PASSED] ttm_bo_validate_busy_placement
[05:45:25] ================ ttm_bo_validate_multihop  =================
[05:45:25] [PASSED] Buffer object for userspace
[05:45:25] [PASSED] Kernel buffer object
[05:45:25] [PASSED] Shared buffer object
[05:45:25] ============ [PASSED] ttm_bo_validate_multihop =============
[05:45:25] ========== ttm_bo_validate_no_placement_signaled  ==========
[05:45:25] [PASSED] Buffer object in system domain, no page vector
[05:45:25] [PASSED] Buffer object in system domain with an existing page vector
[05:45:25] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[05:45:25] ======== ttm_bo_validate_no_placement_not_signaled  ========
[05:45:25] [PASSED] Buffer object for userspace
[05:45:25] [PASSED] Kernel buffer object
[05:45:25] [PASSED] Shared buffer object
[05:45:25] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[05:45:25] [PASSED] ttm_bo_validate_move_fence_signaled
[05:45:25] ========= ttm_bo_validate_move_fence_not_signaled  =========
[05:45:25] [PASSED] Waits for GPU
[05:45:25] [PASSED] Tries to lock straight away
[05:45:25] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[05:45:25] [PASSED] ttm_bo_validate_swapout
[05:45:25] [PASSED] ttm_bo_validate_happy_evict
[05:45:25] [PASSED] ttm_bo_validate_all_pinned_evict
[05:45:25] [PASSED] ttm_bo_validate_allowed_only_evict
[05:45:25] [PASSED] ttm_bo_validate_deleted_evict
[05:45:25] [PASSED] ttm_bo_validate_busy_domain_evict
[05:45:25] [PASSED] ttm_bo_validate_evict_gutting
[05:45:25] [PASSED] ttm_bo_validate_recrusive_evict
[05:45:25] ================= [PASSED] ttm_bo_validate =================
[05:45:25] ============================================================
[05:45:25] Testing complete. Ran 106 tests: passed: 106
[05:45:25] Elapsed time: 11.969s total, 1.786s configuring, 9.969s building, 0.180s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/dma-buf/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[05:45:26] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:45:27] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[05:45:36] Starting KUnit Kernel (1/1)...
[05:45:36] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:45:36] ============= refcount_interrupt (4 subtests) ==============
[05:45:36] [PASSED] test_single_irq_change
[05:45:36] [PASSED] test_nested_irq_change
[05:45:36] [PASSED] test_multiple_irq_change
[05:45:36] [PASSED] test_irq_save
[05:45:36] =============== [PASSED] refcount_interrupt ================
[05:45:36] =============== dma-buf-fence (12 subtests) ================
[05:45:36] [PASSED] test_sanitycheck
[05:45:36] [PASSED] test_signaling
[05:45:36] [PASSED] test_add_callback
[05:45:36] [PASSED] test_late_add_callback
[05:45:36] [PASSED] test_rm_callback
[05:45:36] [PASSED] test_late_rm_callback
[05:45:36] [PASSED] test_status
[05:45:36] [PASSED] test_error
[05:45:36] [PASSED] test_wait
[05:45:36] [PASSED] test_wait_timeout
[05:45:36] [PASSED] test_stub
[05:45:36] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[05:45:36] ================== [PASSED] dma-buf-fence ==================
[05:45:36] ============ dma-buf-fence-chain (11 subtests) =============
[05:45:36] [PASSED] test_sanitycheck
[05:45:36] [PASSED] test_find_seqno
[05:45:36] [PASSED] test_find_signaled
[05:45:36] [PASSED] test_find_out_of_order
[05:45:41] [PASSED] test_find_gap
[05:45:41] [PASSED] test_find_race
[05:45:41] [PASSED] test_signal_forward
[05:45:41] [PASSED] test_signal_backward
[05:45:41] [PASSED] test_wait_forward
[05:45:41] [PASSED] test_wait_backward
[05:45:41] [PASSED] test_wait_random
[05:45:41] =============== [PASSED] dma-buf-fence-chain ===============
[05:45:41] ============ dma-buf-fence-unwrap (10 subtests) ============
[05:45:41] [PASSED] test_sanitycheck
[05:45:41] [PASSED] test_unwrap_array
[05:45:41] [PASSED] test_unwrap_chain
[05:45:41] [PASSED] test_unwrap_chain_array
[05:45:41] [PASSED] test_unwrap_merge
[05:45:41] [PASSED] test_unwrap_merge_duplicate
[05:45:41] [PASSED] test_unwrap_merge_seqno
[05:45:41] [PASSED] test_unwrap_merge_order
[05:45:41] [PASSED] test_unwrap_merge_complex
[05:45:41] [PASSED] test_unwrap_merge_complex_seqno
[05:45:41] ============== [PASSED] dma-buf-fence-unwrap ===============
[05:45:41] ================ dma-buf-resv (5 subtests) =================
[05:45:41] [PASSED] test_sanitycheck
[05:45:41] ===================== test_signaling  ======================
[05:45:41] [PASSED] kernel
[05:45:41] [PASSED] write
[05:45:41] [PASSED] read
[05:45:41] [PASSED] bookkeep
[05:45:41] ================= [PASSED] test_signaling ==================
[05:45:41] ====================== test_for_each  ======================
[05:45:41] [PASSED] kernel
[05:45:41] [PASSED] write
[05:45:41] [PASSED] read
[05:45:41] [PASSED] bookkeep
[05:45:41] ================== [PASSED] test_for_each ==================
[05:45:41] ================= test_for_each_unlocked  ==================
[05:45:41] [PASSED] kernel
[05:45:41] [PASSED] write
[05:45:41] [PASSED] read
[05:45:41] [PASSED] bookkeep
[05:45:41] ============= [PASSED] test_for_each_unlocked ==============
[05:45:41] ===================== test_get_fences  =====================
[05:45:41] [PASSED] kernel
[05:45:41] [PASSED] write
[05:45:41] [PASSED] read
[05:45:41] [PASSED] bookkeep
[05:45:41] ================= [PASSED] test_get_fences =================
[05:45:41] ================== [PASSED] dma-buf-resv ===================
[05:45:41] ============================================================
[05:45:41] Testing complete. Ran 54 tests: passed: 53, skipped: 1
[05:45:41] Elapsed time: 15.790s total, 1.759s configuring, 8.709s building, 5.281s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


