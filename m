Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652E5C88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 07:21:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170F310E244;
	Tue, 15 Sep 2026 07:21:32 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEEE10E244;
 Tue, 15 Sep 2026 07:21:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_KUnit_test_for_VF_provisioning?=
 =?utf-8?q?_error_handling_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Sep 2026 07:21:31 -0000
Message-ID: <178945689149.162877.6631411778236776817@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260915071159.51402-12-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260915071159.51402-12-satyanarayana.k.v.p@intel.com>
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

Series: KUnit test for VF provisioning error handling (rev8)
URL   : https://patchwork.freedesktop.org/series/170198/
State : success

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[07:19:25] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:19:30] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[07:19:51] Starting KUnit Kernel (1/1)...
[07:19:51] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[07:19:51] ============= refcount_interrupt (4 subtests) ==============
[07:19:51] [PASSED] test_single_irq_change
[07:19:51] [PASSED] test_nested_irq_change
[07:19:51] [PASSED] test_multiple_irq_change
[07:19:51] [PASSED] test_irq_save
[07:19:51] =============== [PASSED] refcount_interrupt ================
[07:19:51] ================= gpu_buddy (14 subtests) ==================
[07:19:51] [PASSED] gpu_test_buddy_alloc_limit
[07:19:51] [PASSED] gpu_test_buddy_alloc_optimistic
[07:19:51] [PASSED] gpu_test_buddy_alloc_pessimistic
[07:19:51] [PASSED] gpu_test_buddy_alloc_pathological
[07:19:51] [PASSED] gpu_test_buddy_alloc_contiguous
[07:19:51] [PASSED] gpu_test_buddy_alloc_clear
[07:19:51] [PASSED] gpu_test_buddy_alloc_range
[07:19:51] [PASSED] gpu_test_buddy_alloc_range_bias
[07:19:52] [PASSED] gpu_test_buddy_fragmentation_performance
[07:19:53] [PASSED] gpu_test_buddy_dirty_tracker_performance
[07:19:53] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[07:19:53] [PASSED] gpu_test_buddy_offset_aligned_allocation
[07:19:53] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[07:19:53] [PASSED] gpu_test_buddy_addr_to_block
[07:19:53] ==================== [PASSED] gpu_buddy ====================
[07:19:53] ============================================================
[07:19:53] Testing complete. Ran 18 tests: passed: 18
[07:19:53] Elapsed time: 27.236s total, 4.363s configuring, 20.655s building, 2.140s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[07:19:53] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:19:55] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[07:20:29] Starting KUnit Kernel (1/1)...
[07:20:29] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[07:20:29] ============= refcount_interrupt (4 subtests) ==============
[07:20:29] [PASSED] test_single_irq_change
[07:20:29] [PASSED] test_nested_irq_change
[07:20:29] [PASSED] test_multiple_irq_change
[07:20:29] [PASSED] test_irq_save
[07:20:29] =============== [PASSED] refcount_interrupt ================
[07:20:29] ================== guc_buf (11 subtests) ===================
[07:20:29] [PASSED] test_smallest
[07:20:29] [PASSED] test_largest
[07:20:29] [PASSED] test_granular
[07:20:29] [PASSED] test_unique
[07:20:29] [PASSED] test_overlap
[07:20:29] [PASSED] test_reusable
[07:20:29] [PASSED] test_too_big
[07:20:29] [PASSED] test_flush
[07:20:29] [PASSED] test_lookup
[07:20:29] [PASSED] test_data
[07:20:29] [PASSED] test_class
[07:20:29] ===================== [PASSED] guc_buf =====================
[07:20:29] =================== guc_dbm (7 subtests) ===================
[07:20:29] [PASSED] test_empty
[07:20:29] [PASSED] test_default
[07:20:29] ======================== test_size  ========================
[07:20:29] [PASSED] 4
[07:20:29] [PASSED] 8
[07:20:29] [PASSED] 32
[07:20:29] [PASSED] 256
[07:20:29] ==================== [PASSED] test_size ====================
[07:20:29] ======================= test_reuse  ========================
[07:20:29] [PASSED] 4
[07:20:29] [PASSED] 8
[07:20:29] [PASSED] 32
[07:20:29] [PASSED] 256
[07:20:29] =================== [PASSED] test_reuse ====================
[07:20:30] =================== test_range_overlap  ====================
[07:20:30] [PASSED] 4
[07:20:30] [PASSED] 8
[07:20:30] [PASSED] 32
[07:20:30] [PASSED] 256
[07:20:30] =============== [PASSED] test_range_overlap ================
[07:20:30] =================== test_range_compact  ====================
[07:20:30] [PASSED] 4
[07:20:30] [PASSED] 8
[07:20:30] [PASSED] 32
[07:20:30] [PASSED] 256
[07:20:30] =============== [PASSED] test_range_compact ================
[07:20:30] ==================== test_range_spare  =====================
[07:20:30] [PASSED] 4
[07:20:30] [PASSED] 8
[07:20:30] [PASSED] 32
[07:20:30] [PASSED] 256
[07:20:30] ================ [PASSED] test_range_spare =================
[07:20:30] ===================== [PASSED] guc_dbm =====================
[07:20:30] =================== guc_idm (6 subtests) ===================
[07:20:30] [PASSED] bad_init
[07:20:30] [PASSED] no_init
[07:20:30] [PASSED] init_fini
[07:20:30] [PASSED] check_used
[07:20:30] [PASSED] check_quota
[07:20:30] [PASSED] check_all
[07:20:30] ===================== [PASSED] guc_idm =====================
[07:20:30] =============== guc_klv_helpers (9 subtests) ===============
[07:20:30] [PASSED] test_count
[07:20:30] [PASSED] test_encode_u32
[07:20:30] [PASSED] test_encode_u64
[07:20:30] [PASSED] test_encode_string
[07:20:30] [PASSED] test_encode_object_raw
[07:20:30] [PASSED] test_encode_object_klv
[07:20:30] [PASSED] test_encode_object_nested
[07:20:30] [PASSED] test_encode_object_basic
[07:20:30] [PASSED] test_print
[07:20:30] ================= [PASSED] guc_klv_helpers =================
[07:20:30] =================== xe_log (4 subtests) ====================
[07:20:30] [PASSED] demo_cper
[07:20:30] [PASSED] demo_dmesg
[07:20:30] ======================= test_dmesg  ========================
[07:20:30] [PASSED] test_fatal
[07:20:30] [PASSED] test_fatal_tile
[07:20:30] [PASSED] test_fatal_gt
[07:20:30] [PASSED] test_fatal_comp
[07:20:30] [PASSED] test_fatal_comp_tile
[07:20:30] [PASSED] test_fatal_comp_gt
[07:20:30] [PASSED] test_fatal_all
[07:20:30] [PASSED] test_recoverable
[07:20:30] [PASSED] test_recoverable_tile
[07:20:30] [PASSED] test_recoverable_gt
[07:20:30] [PASSED] test_recoverable_comp
[07:20:30] [PASSED] test_recoverable_comp_tile
[07:20:30] [PASSED] test_recoverable_comp_gt
[07:20:30] [PASSED] test_recoverable_all
[07:20:30] [PASSED] test_info
[07:20:30] [PASSED] test_info_tile
[07:20:30] [PASSED] test_info_gt
[07:20:30] [PASSED] test_info_err
[07:20:30] [PASSED] test_info_comp
[07:20:30] [PASSED] test_info_comp_tile
[07:20:30] [PASSED] test_info_comp_gt
[07:20:30] [PASSED] test_info_all
[07:20:30] [PASSED] test_hw_fatal
[07:20:30] [PASSED] test_hw_recoverable
[07:20:30] [PASSED] test_hw_corrected
[07:20:30] [PASSED] test_hw_informational
[07:20:30] =================== [PASSED] test_dmesg ====================
[07:20:30] ====================== test_invalid  =======================
[07:20:30] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[07:20:30] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[07:20:30] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[07:20:30] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[07:20:30] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[07:20:30] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[07:20:30] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[07:20:30] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[07:20:30] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[07:20:30] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[07:20:30] ================== [SKIPPED] test_invalid ==================
[07:20:30] ===================== [PASSED] xe_log ======================
[07:20:30] ================ vf_gt_config (5 subtests) =================
[07:20:30] ======================== test_ctxs  ========================
[07:20:30] [PASSED] same
[07:20:30] [PASSED] none
[07:20:30] [PASSED] overflow
[07:20:30] [PASSED] lost
[07:20:30] [PASSED] reduced
[07:20:30] [PASSED] increased
[07:20:30] [PASSED] proto_error
[07:20:30] [PASSED] IO_error
[07:20:30] ==================== [PASSED] test_ctxs ====================
[07:20:30] ======================== test_dbs  =========================
[07:20:30] [PASSED] same
[07:20:30] [PASSED] none
[07:20:30] [PASSED] overflow
[07:20:30] [PASSED] lost
[07:20:30] [PASSED] reduced
[07:20:30] [PASSED] increased
[07:20:30] [PASSED] proto_error
[07:20:30] [PASSED] IO_error
[07:20:30] ==================== [PASSED] test_dbs =====================
[07:20:30] ======================== test_vram  ========================
[07:20:30] [PASSED] same
[07:20:30] [PASSED] none
[07:20:30] [PASSED] increased
[07:20:30] [PASSED] lost
[07:20:30] [PASSED] reduced
[07:20:30] [PASSED] unaligned
[07:20:30] [PASSED] proto_error
[07:20:30] [PASSED] IO_error
[07:20:30] ==================== [PASSED] test_vram ====================
[07:20:30] ======================== test_ggtt  ========================
[07:20:30] [PASSED] same
[07:20:30] [PASSED] query_on_init
[07:20:30] [PASSED] none
[07:20:30] [PASSED] overflow
[07:20:30] [PASSED] overflow_query_on_init
[07:20:30] [PASSED] lost
[07:20:30] [PASSED] lost_on_init
[07:20:30] [PASSED] reduced
[07:20:30] [PASSED] increased
[07:20:30] [PASSED] unaligned_size_4K
[07:20:30] [PASSED] unaligned_size_4K_on_init
[07:20:30] [PASSED] unaligned_base_4K
[07:20:30] [PASSED] unaligned_base_4K_on_init
[07:20:30] [PASSED] proto_error
[07:20:30] [PASSED] IO_error
[07:20:30] [PASSED] out_of_bounds_size_on_init
[07:20:30] ==================== [PASSED] test_ggtt ====================
[07:20:30] ====================== test_guc_mmio  ======================
[07:20:30] [PASSED] same
[07:20:30] [PASSED] none
[07:20:30] [PASSED] overflow
[07:20:30] [PASSED] lost
[07:20:30] [PASSED] invalid
[07:20:30] [PASSED] proto_error
[07:20:30] [PASSED] IO_error
[07:20:30] ================== [PASSED] test_guc_mmio ==================
[07:20:30] ================== [PASSED] vf_gt_config ===================
[07:20:30] ================== no_relay (3 subtests) ===================
[07:20:30] [PASSED] xe_drops_guc2pf_if_not_ready
[07:20:30] [PASSED] xe_drops_guc2vf_if_not_ready
[07:20:30] [PASSED] xe_rejects_send_if_not_ready
[07:20:30] ==================== [PASSED] no_relay =====================
[07:20:30] ================== pf_relay (14 subtests) ==================
[07:20:30] [PASSED] pf_rejects_guc2pf_too_short
[07:20:30] [PASSED] pf_rejects_guc2pf_too_long
[07:20:30] [PASSED] pf_rejects_guc2pf_no_payload
[07:20:30] [PASSED] pf_fails_no_payload
[07:20:30] [PASSED] pf_fails_bad_origin
[07:20:30] [PASSED] pf_fails_bad_type
[07:20:30] [PASSED] pf_txn_reports_error
[07:20:30] [PASSED] pf_txn_sends_pf2guc
[07:20:30] [PASSED] pf_sends_pf2guc
[07:20:30] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[07:20:30] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[07:20:30] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[07:20:30] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[07:20:30] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[07:20:30] ==================== [PASSED] pf_relay =====================
[07:20:30] ================== vf_relay (3 subtests) ===================
[07:20:30] [PASSED] vf_rejects_guc2vf_too_short
[07:20:30] [PASSED] vf_rejects_guc2vf_too_long
[07:20:30] [PASSED] vf_rejects_guc2vf_no_payload
[07:20:30] ==================== [PASSED] vf_relay =====================
[07:20:30] ================ pf_gt_config (9 subtests) =================
[07:20:30] [PASSED] fair_contexts_1vf
[07:20:30] [PASSED] fair_doorbells_1vf
[07:20:30] [PASSED] fair_ggtt_1vf
[07:20:30] ====================== fair_vram_1vf  ======================
[07:20:30] [PASSED] 3.50 GiB
[07:20:30] [PASSED] 11.5 GiB
[07:20:30] [PASSED] 15.5 GiB
[07:20:30] [PASSED] 31.5 GiB
[07:20:30] [PASSED] 63.5 GiB
[07:20:30] [PASSED] 1.91 GiB
[07:20:30] ================== [PASSED] fair_vram_1vf ==================
[07:20:30] ================ fair_vram_1vf_admin_only  =================
[07:20:30] [PASSED] 3.50 GiB
[07:20:30] [PASSED] 11.5 GiB
[07:20:30] [PASSED] 15.5 GiB
[07:20:30] [PASSED] 31.5 GiB
[07:20:30] [PASSED] 63.5 GiB
[07:20:30] [PASSED] 1.91 GiB
[07:20:30] ============ [PASSED] fair_vram_1vf_admin_only =============
[07:20:30] ====================== fair_contexts  ======================
[07:20:30] [PASSED] 1 VF
[07:20:30] [PASSED] 2 VFs
[07:20:30] [PASSED] 3 VFs
[07:20:30] [PASSED] 4 VFs
[07:20:30] [PASSED] 5 VFs
[07:20:30] [PASSED] 6 VFs
[07:20:30] [PASSED] 7 VFs
[07:20:30] [PASSED] 8 VFs
[07:20:30] [PASSED] 9 VFs
[07:20:30] [PASSED] 10 VFs
[07:20:30] [PASSED] 11 VFs
[07:20:30] [PASSED] 12 VFs
[07:20:30] [PASSED] 13 VFs
[07:20:30] [PASSED] 14 VFs
[07:20:30] [PASSED] 15 VFs
[07:20:30] [PASSED] 16 VFs
[07:20:30] [PASSED] 17 VFs
[07:20:30] [PASSED] 18 VFs
[07:20:30] [PASSED] 19 VFs
[07:20:30] [PASSED] 20 VFs
[07:20:30] [PASSED] 21 VFs
[07:20:30] [PASSED] 22 VFs
[07:20:30] [PASSED] 23 VFs
[07:20:30] [PASSED] 24 VFs
[07:20:30] [PASSED] 25 VFs
[07:20:30] [PASSED] 26 VFs
[07:20:30] [PASSED] 27 VFs
[07:20:30] [PASSED] 28 VFs
[07:20:30] [PASSED] 29 VFs
[07:20:30] [PASSED] 30 VFs
[07:20:30] [PASSED] 31 VFs
[07:20:30] [PASSED] 32 VFs
[07:20:30] [PASSED] 33 VFs
[07:20:30] [PASSED] 34 VFs
[07:20:30] [PASSED] 35 VFs
[07:20:30] [PASSED] 36 VFs
[07:20:30] [PASSED] 37 VFs
[07:20:30] [PASSED] 38 VFs
[07:20:30] [PASSED] 39 VFs
[07:20:30] [PASSED] 40 VFs
[07:20:30] [PASSED] 41 VFs
[07:20:30] [PASSED] 42 VFs
[07:20:30] [PASSED] 43 VFs
[07:20:30] [PASSED] 44 VFs
[07:20:30] [PASSED] 45 VFs
[07:20:30] [PASSED] 46 VFs
[07:20:30] [PASSED] 47 VFs
[07:20:30] [PASSED] 48 VFs
[07:20:30] [PASSED] 49 VFs
[07:20:30] [PASSED] 50 VFs
[07:20:30] [PASSED] 51 VFs
[07:20:30] [PASSED] 52 VFs
[07:20:30] [PASSED] 53 VFs
[07:20:30] [PASSED] 54 VFs
[07:20:30] [PASSED] 55 VFs
[07:20:30] [PASSED] 56 VFs
[07:20:30] [PASSED] 57 VFs
[07:20:30] [PASSED] 58 VFs
[07:20:30] [PASSED] 59 VFs
[07:20:30] [PASSED] 60 VFs
[07:20:30] [PASSED] 61 VFs
[07:20:30] [PASSED] 62 VFs
[07:20:30] [PASSED] 63 VFs
[07:20:30] ================== [PASSED] fair_contexts ==================
[07:20:30] ===================== fair_doorbells  ======================
[07:20:30] [PASSED] 1 VF
[07:20:30] [PASSED] 2 VFs
[07:20:30] [PASSED] 3 VFs
[07:20:30] [PASSED] 4 VFs
[07:20:30] [PASSED] 5 VFs
[07:20:30] [PASSED] 6 VFs
[07:20:30] [PASSED] 7 VFs
[07:20:30] [PASSED] 8 VFs
[07:20:30] [PASSED] 9 VFs
[07:20:30] [PASSED] 10 VFs
[07:20:30] [PASSED] 11 VFs
[07:20:30] [PASSED] 12 VFs
[07:20:30] [PASSED] 13 VFs
[07:20:30] [PASSED] 14 VFs
[07:20:30] [PASSED] 15 VFs
[07:20:30] [PASSED] 16 VFs
[07:20:30] [PASSED] 17 VFs
[07:20:30] [PASSED] 18 VFs
[07:20:30] [PASSED] 19 VFs
[07:20:30] [PASSED] 20 VFs
[07:20:30] [PASSED] 21 VFs
[07:20:30] [PASSED] 22 VFs
[07:20:30] [PASSED] 23 VFs
[07:20:30] [PASSED] 24 VFs
[07:20:30] [PASSED] 25 VFs
[07:20:30] [PASSED] 26 VFs
[07:20:30] [PASSED] 27 VFs
[07:20:30] [PASSED] 28 VFs
[07:20:30] [PASSED] 29 VFs
[07:20:30] [PASSED] 30 VFs
[07:20:30] [PASSED] 31 VFs
[07:20:30] [PASSED] 32 VFs
[07:20:30] [PASSED] 33 VFs
[07:20:30] [PASSED] 34 VFs
[07:20:30] [PASSED] 35 VFs
[07:20:30] [PASSED] 36 VFs
[07:20:30] [PASSED] 37 VFs
[07:20:30] [PASSED] 38 VFs
[07:20:30] [PASSED] 39 VFs
[07:20:30] [PASSED] 40 VFs
[07:20:30] [PASSED] 41 VFs
[07:20:30] [PASSED] 42 VFs
[07:20:30] [PASSED] 43 VFs
[07:20:30] [PASSED] 44 VFs
[07:20:30] [PASSED] 45 VFs
[07:20:30] [PASSED] 46 VFs
[07:20:30] [PASSED] 47 VFs
[07:20:30] [PASSED] 48 VFs
[07:20:30] [PASSED] 49 VFs
[07:20:30] [PASSED] 50 VFs
[07:20:30] [PASSED] 51 VFs
[07:20:30] [PASSED] 52 VFs
[07:20:30] [PASSED] 53 VFs
[07:20:30] [PASSED] 54 VFs
[07:20:30] [PASSED] 55 VFs
[07:20:30] [PASSED] 56 VFs
[07:20:30] [PASSED] 57 VFs
[07:20:30] [PASSED] 58 VFs
[07:20:30] [PASSED] 59 VFs
[07:20:30] [PASSED] 60 VFs
[07:20:30] [PASSED] 61 VFs
[07:20:30] [PASSED] 62 VFs
[07:20:30] [PASSED] 63 VFs
[07:20:30] ================= [PASSED] fair_doorbells ==================
[07:20:30] ======================== fair_ggtt  ========================
[07:20:30] [PASSED] 1 VF
[07:20:30] [PASSED] 2 VFs
[07:20:30] [PASSED] 3 VFs
[07:20:30] [PASSED] 4 VFs
[07:20:30] [PASSED] 5 VFs
[07:20:30] [PASSED] 6 VFs
[07:20:30] [PASSED] 7 VFs
[07:20:30] [PASSED] 8 VFs
[07:20:30] [PASSED] 9 VFs
[07:20:30] [PASSED] 10 VFs
[07:20:30] [PASSED] 11 VFs
[07:20:30] [PASSED] 12 VFs
[07:20:30] [PASSED] 13 VFs
[07:20:30] [PASSED] 14 VFs
[07:20:30] [PASSED] 15 VFs
[07:20:30] [PASSED] 16 VFs
[07:20:30] [PASSED] 17 VFs
[07:20:30] [PASSED] 18 VFs
[07:20:30] [PASSED] 19 VFs
[07:20:30] [PASSED] 20 VFs
[07:20:30] [PASSED] 21 VFs
[07:20:30] [PASSED] 22 VFs
[07:20:30] [PASSED] 23 VFs
[07:20:30] [PASSED] 24 VFs
[07:20:30] [PASSED] 25 VFs
[07:20:30] [PASSED] 26 VFs
[07:20:30] [PASSED] 27 VFs
[07:20:30] [PASSED] 28 VFs
[07:20:30] [PASSED] 29 VFs
[07:20:30] [PASSED] 30 VFs
[07:20:30] [PASSED] 31 VFs
[07:20:30] [PASSED] 32 VFs
[07:20:30] [PASSED] 33 VFs
[07:20:30] [PASSED] 34 VFs
[07:20:30] [PASSED] 35 VFs
[07:20:30] [PASSED] 36 VFs
[07:20:30] [PASSED] 37 VFs
[07:20:30] [PASSED] 38 VFs
[07:20:30] [PASSED] 39 VFs
[07:20:30] [PASSED] 40 VFs
[07:20:30] [PASSED] 41 VFs
[07:20:30] [PASSED] 42 VFs
[07:20:30] [PASSED] 43 VFs
[07:20:30] [PASSED] 44 VFs
[07:20:30] [PASSED] 45 VFs
[07:20:30] [PASSED] 46 VFs
[07:20:30] [PASSED] 47 VFs
[07:20:30] [PASSED] 48 VFs
[07:20:30] [PASSED] 49 VFs
[07:20:30] [PASSED] 50 VFs
[07:20:30] [PASSED] 51 VFs
[07:20:30] [PASSED] 52 VFs
[07:20:30] [PASSED] 53 VFs
[07:20:30] [PASSED] 54 VFs
[07:20:30] [PASSED] 55 VFs
[07:20:30] [PASSED] 56 VFs
[07:20:30] [PASSED] 57 VFs
[07:20:30] [PASSED] 58 VFs
[07:20:30] [PASSED] 59 VFs
[07:20:30] [PASSED] 60 VFs
[07:20:30] [PASSED] 61 VFs
[07:20:30] [PASSED] 62 VFs
[07:20:30] [PASSED] 63 VFs
[07:20:30] ==================== [PASSED] fair_ggtt ====================
[07:20:30] ======================== fair_vram  ========================
[07:20:30] [PASSED] 1 VF
[07:20:30] [PASSED] 2 VFs
[07:20:30] [PASSED] 3 VFs
[07:20:30] [PASSED] 4 VFs
[07:20:30] [PASSED] 5 VFs
[07:20:30] [PASSED] 6 VFs
[07:20:30] [PASSED] 7 VFs
[07:20:30] [PASSED] 8 VFs
[07:20:30] [PASSED] 9 VFs
[07:20:30] [PASSED] 10 VFs
[07:20:30] [PASSED] 11 VFs
[07:20:30] [PASSED] 12 VFs
[07:20:30] [PASSED] 13 VFs
[07:20:30] [PASSED] 14 VFs
[07:20:30] [PASSED] 15 VFs
[07:20:30] [PASSED] 16 VFs
[07:20:30] [PASSED] 17 VFs
[07:20:30] [PASSED] 18 VFs
[07:20:30] [PASSED] 19 VFs
[07:20:30] [PASSED] 20 VFs
[07:20:30] [PASSED] 21 VFs
[07:20:30] [PASSED] 22 VFs
[07:20:30] [PASSED] 23 VFs
[07:20:30] [PASSED] 24 VFs
[07:20:30] [PASSED] 25 VFs
[07:20:30] [PASSED] 26 VFs
[07:20:30] [PASSED] 27 VFs
[07:20:30] [PASSED] 28 VFs
[07:20:30] [PASSED] 29 VFs
[07:20:30] [PASSED] 30 VFs
[07:20:30] [PASSED] 31 VFs
[07:20:30] [PASSED] 32 VFs
[07:20:30] [PASSED] 33 VFs
[07:20:30] [PASSED] 34 VFs
[07:20:30] [PASSED] 35 VFs
[07:20:30] [PASSED] 36 VFs
[07:20:30] [PASSED] 37 VFs
[07:20:30] [PASSED] 38 VFs
[07:20:30] [PASSED] 39 VFs
[07:20:30] [PASSED] 40 VFs
[07:20:30] [PASSED] 41 VFs
[07:20:30] [PASSED] 42 VFs
[07:20:30] [PASSED] 43 VFs
[07:20:30] [PASSED] 44 VFs
[07:20:30] [PASSED] 45 VFs
[07:20:30] [PASSED] 46 VFs
[07:20:30] [PASSED] 47 VFs
[07:20:30] [PASSED] 48 VFs
[07:20:30] [PASSED] 49 VFs
[07:20:30] [PASSED] 50 VFs
[07:20:30] [PASSED] 51 VFs
[07:20:30] [PASSED] 52 VFs
[07:20:30] [PASSED] 53 VFs
[07:20:30] [PASSED] 54 VFs
[07:20:30] [PASSED] 55 VFs
[07:20:30] [PASSED] 56 VFs
[07:20:30] [PASSED] 57 VFs
[07:20:30] [PASSED] 58 VFs
[07:20:30] [PASSED] 59 VFs
[07:20:30] [PASSED] 60 VFs
[07:20:30] [PASSED] 61 VFs
[07:20:30] [PASSED] 62 VFs
[07:20:30] [PASSED] 63 VFs
[07:20:30] ==================== [PASSED] fair_vram ====================
[07:20:30] ================== [PASSED] pf_gt_config ===================
[07:20:30] ===================== lmtt (1 subtest) =====================
[07:20:30] ======================== test_ops  =========================
[07:20:30] [PASSED] 2-level
[07:20:30] [PASSED] multi-level
[07:20:30] ==================== [PASSED] test_ops =====================
[07:20:30] ====================== [PASSED] lmtt =======================
[07:20:30] ================= sriov_packet (1 subtest) =================
[07:20:30] [PASSED] test_descriptor_init
[07:20:30] ================== [PASSED] sriov_packet ===================
[07:20:30] ================= pf_service (11 subtests) =================
[07:20:30] [PASSED] pf_negotiate_any
[07:20:30] [PASSED] pf_negotiate_base_match
[07:20:30] [PASSED] pf_negotiate_base_newer
[07:20:30] [PASSED] pf_negotiate_base_next
[07:20:30] [SKIPPED] pf_negotiate_base_older (no older minor)
[07:20:30] [PASSED] pf_negotiate_base_prev
[07:20:30] [PASSED] pf_negotiate_latest_match
[07:20:30] [PASSED] pf_negotiate_latest_newer
[07:20:30] [PASSED] pf_negotiate_latest_next
[07:20:30] [SKIPPED] pf_negotiate_latest_older (no older minor)
[07:20:30] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[07:20:30] =================== [PASSED] pf_service ====================
[07:20:30] ================= xe_guc_g2g (2 subtests) ==================
[07:20:30] ============== xe_live_guc_g2g_kunit_default  ==============
[07:20:30] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[07:20:30] ============== xe_live_guc_g2g_kunit_allmem  ===============
[07:20:30] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[07:20:30] =================== [SKIPPED] xe_guc_g2g ===================
[07:20:30] =================== xe_mocs (2 subtests) ===================
[07:20:30] ================ xe_live_mocs_kernel_kunit  ================
[07:20:30] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[07:20:30] ================ xe_live_mocs_reset_kunit  =================
[07:20:30] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[07:20:30] ==================== [SKIPPED] xe_mocs =====================
[07:20:30] ================= xe_migrate (2 subtests) ==================
[07:20:30] ================= xe_migrate_sanity_kunit  =================
[07:20:30] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[07:20:30] ================== xe_validate_ccs_kunit  ==================
[07:20:30] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[07:20:30] =================== [SKIPPED] xe_migrate ===================
[07:20:30] ================== xe_dma_buf (1 subtest) ==================
[07:20:30] ==================== xe_dma_buf_kunit  =====================
[07:20:30] ================ [SKIPPED] xe_dma_buf_kunit ================
[07:20:30] =================== [SKIPPED] xe_dma_buf ===================
[07:20:30] ================= xe_bo_shrink (1 subtest) =================
[07:20:30] =================== xe_bo_shrink_kunit  ====================
[07:20:30] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[07:20:30] ================== [SKIPPED] xe_bo_shrink ==================
[07:20:30] ==================== xe_bo (2 subtests) ====================
[07:20:30] ================== xe_ccs_migrate_kunit  ===================
[07:20:30] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[07:20:30] ==================== xe_bo_evict_kunit  ====================
[07:20:30] =============== [SKIPPED] xe_bo_evict_kunit ================
[07:20:30] ===================== [SKIPPED] xe_bo ======================
[07:20:30] =================== xe_any (9 subtests) ====================
[07:20:30] [PASSED] test_to_xe
[07:20:30] [PASSED] test_to_dev
[07:20:30] [PASSED] test_to_pdev
[07:20:30] [PASSED] test_to_drm
[07:20:30] [PASSED] test_if_pdev
[07:20:30] [PASSED] test_if_xe
[07:20:30] [PASSED] test_if_tile
[07:20:30] [PASSED] test_if_gt
[07:20:30] [PASSED] test_to_id
[07:20:30] ===================== [PASSED] xe_any ======================
[07:20:30] ==================== args (13 subtests) ====================
[07:20:30] [PASSED] count_args_test
[07:20:30] [PASSED] call_args_example
[07:20:30] [PASSED] call_args_test
[07:20:30] [PASSED] drop_first_arg_example
[07:20:30] [PASSED] drop_first_arg_test
[07:20:30] [PASSED] first_arg_example
[07:20:30] [PASSED] first_arg_test
[07:20:30] [PASSED] last_arg_example
[07:20:30] [PASSED] last_arg_test
[07:20:30] [PASSED] pick_arg_example
[07:20:30] [PASSED] if_args_example
[07:20:30] [PASSED] if_args_test
[07:20:30] [PASSED] sep_comma_example
[07:20:30] ====================== [PASSED] args =======================
[07:20:30] =================== xe_pci (3 subtests) ====================
[07:20:30] ==================== check_graphics_ip  ====================
[07:20:30] [PASSED] 12.00 Xe_LP
[07:20:30] [PASSED] 12.10 Xe_LP+
[07:20:30] [PASSED] 12.55 Xe_HPG
[07:20:30] [PASSED] 12.60 Xe_HPC
[07:20:30] [PASSED] 12.70 Xe_LPG
[07:20:30] [PASSED] 12.71 Xe_LPG
[07:20:30] [PASSED] 12.74 Xe_LPG+
[07:20:30] [PASSED] 20.01 Xe2_HPG
[07:20:30] [PASSED] 20.02 Xe2_HPG
[07:20:30] [PASSED] 20.04 Xe2_LPG
[07:20:30] [PASSED] 30.00 Xe3_LPG
[07:20:30] [PASSED] 30.01 Xe3_LPG
[07:20:30] [PASSED] 30.03 Xe3_LPG
[07:20:30] [PASSED] 30.04 Xe3_LPG
[07:20:30] [PASSED] 30.05 Xe3_LPG
[07:20:30] [PASSED] 35.10 Xe3p_LPG
[07:20:30] [PASSED] 35.11 Xe3p_XPC
[07:20:30] ================ [PASSED] check_graphics_ip ================
[07:20:30] ===================== check_media_ip  ======================
[07:20:30] [PASSED] 12.00 Xe_M
[07:20:30] [PASSED] 12.55 Xe_HPM
[07:20:30] [PASSED] 13.00 Xe_LPM+
[07:20:30] [PASSED] 13.01 Xe2_HPM
[07:20:30] [PASSED] 20.00 Xe2_LPM
[07:20:30] [PASSED] 30.00 Xe3_LPM
[07:20:30] [PASSED] 30.02 Xe3_LPM
[07:20:30] [PASSED] 35.00 Xe3p_LPM
[07:20:30] [PASSED] 35.03 Xe3p_HPM
[07:20:30] ================= [PASSED] check_media_ip ==================
[07:20:30] =================== check_platform_desc  ===================
[07:20:30] [PASSED] 0x9A60 (TIGERLAKE)
[07:20:30] [PASSED] 0x9A68 (TIGERLAKE)
[07:20:30] [PASSED] 0x9A70 (TIGERLAKE)
[07:20:30] [PASSED] 0x9A40 (TIGERLAKE)
[07:20:30] [PASSED] 0x9A49 (TIGERLAKE)
[07:20:30] [PASSED] 0x9A59 (TIGERLAKE)
[07:20:30] [PASSED] 0x9A78 (TIGERLAKE)
[07:20:30] [PASSED] 0x9AC0 (TIGERLAKE)
[07:20:30] [PASSED] 0x9AC9 (TIGERLAKE)
[07:20:30] [PASSED] 0x9AD9 (TIGERLAKE)
[07:20:30] [PASSED] 0x9AF8 (TIGERLAKE)
[07:20:30] [PASSED] 0x4C80 (ROCKETLAKE)
[07:20:30] [PASSED] 0x4C8A (ROCKETLAKE)
[07:20:30] [PASSED] 0x4C8B (ROCKETLAKE)
[07:20:30] [PASSED] 0x4C8C (ROCKETLAKE)
[07:20:30] [PASSED] 0x4C90 (ROCKETLAKE)
[07:20:30] [PASSED] 0x4C9A (ROCKETLAKE)
[07:20:30] [PASSED] 0x4680 (ALDERLAKE_S)
[07:20:30] [PASSED] 0x4682 (ALDERLAKE_S)
[07:20:30] [PASSED] 0x4688 (ALDERLAKE_S)
[07:20:30] [PASSED] 0x468A (ALDERLAKE_S)
[07:20:30] [PASSED] 0x468B (ALDERLAKE_S)
[07:20:30] [PASSED] 0x4690 (ALDERLAKE_S)
[07:20:30] [PASSED] 0x4692 (ALDERLAKE_S)
[07:20:30] [PASSED] 0x4693 (ALDERLAKE_S)
[07:20:30] [PASSED] 0x46A0 (ALDERLAKE_P)
[07:20:30] [PASSED] 0x46A1 (ALDERLAKE_P)
[07:20:30] [PASSED] 0x46A2 (ALDERLAKE_P)
[07:20:30] [PASSED] 0x46A3 (ALDERLAKE_P)
[07:20:30] [PASSED] 0x46A6 (ALDERLAKE_P)
[07:20:30] [PASSED] 0x46A8 (ALDERLAKE_P)
[07:20:30] [PASSED] 0x46AA (ALDERLAKE_P)
[07:20:30] [PASSED] 0x462A (ALDERLAKE_P)
[07:20:30] [PASSED] 0x4626 (ALDERLAKE_P)
[07:20:30] [PASSED] 0x4628 (ALDERLAKE_P)
[07:20:30] [PASSED] 0x46B0 (ALDERLAKE_P)
[07:20:30] [PASSED] 0x46B1 (ALDERLAKE_P)
[07:20:30] [PASSED] 0x46B2 (ALDERLAKE_P)
[07:20:30] [PASSED] 0x46B3 (ALDERLAKE_P)
[07:20:30] [PASSED] 0x46C0 (ALDERLAKE_P)
[07:20:30] [PASSED] 0x46C1 (ALDERLAKE_P)
[07:20:30] [PASSED] 0x46C2 (ALDERLAKE_P)
[07:20:30] [PASSED] 0x46C3 (ALDERLAKE_P)
[07:20:30] [PASSED] 0x46D0 (ALDERLAKE_N)
[07:20:30] [PASSED] 0x46D1 (ALDERLAKE_N)
[07:20:30] [PASSED] 0x46D2 (ALDERLAKE_N)
[07:20:30] [PASSED] 0x46D3 (ALDERLAKE_N)
[07:20:30] [PASSED] 0x46D4 (ALDERLAKE_N)
[07:20:30] [PASSED] 0xA721 (ALDERLAKE_P)
[07:20:30] [PASSED] 0xA7A1 (ALDERLAKE_P)
[07:20:30] [PASSED] 0xA7A9 (ALDERLAKE_P)
[07:20:30] [PASSED] 0xA7AC (ALDERLAKE_P)
[07:20:30] [PASSED] 0xA7AD (ALDERLAKE_P)
[07:20:30] [PASSED] 0xA720 (ALDERLAKE_P)
[07:20:30] [PASSED] 0xA7A0 (ALDERLAKE_P)
[07:20:30] [PASSED] 0xA7A8 (ALDERLAKE_P)
[07:20:30] [PASSED] 0xA7AA (ALDERLAKE_P)
[07:20:30] [PASSED] 0xA7AB (ALDERLAKE_P)
[07:20:30] [PASSED] 0xA780 (ALDERLAKE_S)
[07:20:30] [PASSED] 0xA781 (ALDERLAKE_S)
[07:20:30] [PASSED] 0xA782 (ALDERLAKE_S)
[07:20:30] [PASSED] 0xA783 (ALDERLAKE_S)
[07:20:30] [PASSED] 0xA788 (ALDERLAKE_S)
[07:20:30] [PASSED] 0xA789 (ALDERLAKE_S)
[07:20:30] [PASSED] 0xA78A (ALDERLAKE_S)
[07:20:30] [PASSED] 0xA78B (ALDERLAKE_S)
[07:20:30] [PASSED] 0x4905 (DG1)
[07:20:30] [PASSED] 0x4906 (DG1)
[07:20:30] [PASSED] 0x4907 (DG1)
[07:20:30] [PASSED] 0x4908 (DG1)
[07:20:30] [PASSED] 0x4909 (DG1)
[07:20:30] [PASSED] 0x56C0 (DG2)
[07:20:30] [PASSED] 0x56C2 (DG2)
[07:20:30] [PASSED] 0x56C1 (DG2)
[07:20:30] [PASSED] 0x7D51 (METEORLAKE)
[07:20:30] [PASSED] 0x7DD1 (METEORLAKE)
[07:20:30] [PASSED] 0x7D41 (METEORLAKE)
[07:20:30] [PASSED] 0x7D67 (METEORLAKE)
[07:20:30] [PASSED] 0xB640 (METEORLAKE)
[07:20:30] [PASSED] 0x56A0 (DG2)
[07:20:30] [PASSED] 0x56A1 (DG2)
[07:20:30] [PASSED] 0x56A2 (DG2)
[07:20:30] [PASSED] 0x56BE (DG2)
[07:20:30] [PASSED] 0x56BF (DG2)
[07:20:30] [PASSED] 0x5690 (DG2)
[07:20:30] [PASSED] 0x5691 (DG2)
[07:20:30] [PASSED] 0x5692 (DG2)
[07:20:30] [PASSED] 0x56A5 (DG2)
[07:20:30] [PASSED] 0x56A6 (DG2)
[07:20:30] [PASSED] 0x56B0 (DG2)
[07:20:30] [PASSED] 0x56B1 (DG2)
[07:20:30] [PASSED] 0x56BA (DG2)
[07:20:30] [PASSED] 0x56BB (DG2)
[07:20:30] [PASSED] 0x56BC (DG2)
[07:20:30] [PASSED] 0x56BD (DG2)
[07:20:30] [PASSED] 0x5693 (DG2)
[07:20:30] [PASSED] 0x5694 (DG2)
[07:20:30] [PASSED] 0x5695 (DG2)
[07:20:30] [PASSED] 0x56A3 (DG2)
[07:20:30] [PASSED] 0x56A4 (DG2)
[07:20:30] [PASSED] 0x56B2 (DG2)
[07:20:30] [PASSED] 0x56B3 (DG2)
[07:20:30] [PASSED] 0x5696 (DG2)
[07:20:30] [PASSED] 0x5697 (DG2)
[07:20:30] [PASSED] 0xB69 (PVC)
[07:20:30] [PASSED] 0xB6E (PVC)
[07:20:30] [PASSED] 0xBD4 (PVC)
[07:20:30] [PASSED] 0xBD5 (PVC)
[07:20:30] [PASSED] 0xBD6 (PVC)
[07:20:30] [PASSED] 0xBD7 (PVC)
[07:20:30] [PASSED] 0xBD8 (PVC)
[07:20:30] [PASSED] 0xBD9 (PVC)
[07:20:30] [PASSED] 0xBDA (PVC)
[07:20:30] [PASSED] 0xBDB (PVC)
[07:20:30] [PASSED] 0xBE0 (PVC)
[07:20:30] [PASSED] 0xBE1 (PVC)
[07:20:30] [PASSED] 0xBE5 (PVC)
[07:20:30] [PASSED] 0x7D40 (METEORLAKE)
[07:20:30] [PASSED] 0x7D45 (METEORLAKE)
[07:20:30] [PASSED] 0x7D55 (METEORLAKE)
[07:20:30] [PASSED] 0x7D60 (METEORLAKE)
[07:20:30] [PASSED] 0x7DD5 (METEORLAKE)
[07:20:30] [PASSED] 0x6420 (LUNARLAKE)
[07:20:30] [PASSED] 0x64A0 (LUNARLAKE)
[07:20:30] [PASSED] 0x64B0 (LUNARLAKE)
[07:20:30] [PASSED] 0xE202 (BATTLEMAGE)
[07:20:30] [PASSED] 0xE209 (BATTLEMAGE)
[07:20:30] [PASSED] 0xE20B (BATTLEMAGE)
[07:20:30] [PASSED] 0xE20C (BATTLEMAGE)
[07:20:30] [PASSED] 0xE20D (BATTLEMAGE)
[07:20:30] [PASSED] 0xE210 (BATTLEMAGE)
[07:20:30] [PASSED] 0xE211 (BATTLEMAGE)
[07:20:30] [PASSED] 0xE212 (BATTLEMAGE)
[07:20:30] [PASSED] 0xE216 (BATTLEMAGE)
[07:20:30] [PASSED] 0xE220 (BATTLEMAGE)
[07:20:30] [PASSED] 0xE221 (BATTLEMAGE)
[07:20:30] [PASSED] 0xE222 (BATTLEMAGE)
[07:20:30] [PASSED] 0xE223 (BATTLEMAGE)
[07:20:30] [PASSED] 0xB080 (PANTHERLAKE)
[07:20:30] [PASSED] 0xB081 (PANTHERLAKE)
[07:20:30] [PASSED] 0xB082 (PANTHERLAKE)
[07:20:30] [PASSED] 0xB083 (PANTHERLAKE)
[07:20:30] [PASSED] 0xB084 (PANTHERLAKE)
[07:20:30] [PASSED] 0xB085 (PANTHERLAKE)
[07:20:30] [PASSED] 0xB086 (PANTHERLAKE)
[07:20:30] [PASSED] 0xB087 (PANTHERLAKE)
[07:20:30] [PASSED] 0xB08F (PANTHERLAKE)
[07:20:30] [PASSED] 0xB090 (PANTHERLAKE)
[07:20:30] [PASSED] 0xB0A0 (PANTHERLAKE)
[07:20:30] [PASSED] 0xB0B0 (PANTHERLAKE)
[07:20:30] [PASSED] 0xFD80 (PANTHERLAKE)
[07:20:30] [PASSED] 0xFD81 (PANTHERLAKE)
[07:20:30] [PASSED] 0xD740 (NOVALAKE_S)
[07:20:30] [PASSED] 0xD741 (NOVALAKE_S)
[07:20:30] [PASSED] 0xD742 (NOVALAKE_S)
[07:20:30] [PASSED] 0xD743 (NOVALAKE_S)
[07:20:30] [PASSED] 0xD745 (NOVALAKE_S)
[07:20:30] [PASSED] 0xD74A (NOVALAKE_S)
[07:20:30] [PASSED] 0xD74B (NOVALAKE_S)
[07:20:30] [PASSED] 0x674C (CRESCENTISLAND)
[07:20:30] [PASSED] 0x674D (CRESCENTISLAND)
[07:20:30] [PASSED] 0x674E (CRESCENTISLAND)
[07:20:30] [PASSED] 0x674F (CRESCENTISLAND)
[07:20:30] [PASSED] 0x6750 (CRESCENTISLAND)
[07:20:30] [PASSED] 0xD750 (NOVALAKE_P)
[07:20:30] [PASSED] 0xD751 (NOVALAKE_P)
[07:20:30] [PASSED] 0xD752 (NOVALAKE_P)
[07:20:30] [PASSED] 0xD753 (NOVALAKE_P)
[07:20:30] [PASSED] 0xD754 (NOVALAKE_P)
[07:20:30] [PASSED] 0xD755 (NOVALAKE_P)
[07:20:30] [PASSED] 0xD756 (NOVALAKE_P)
[07:20:30] [PASSED] 0xD757 (NOVALAKE_P)
[07:20:30] [PASSED] 0xD75F (NOVALAKE_P)
[07:20:30] =============== [PASSED] check_platform_desc ===============
[07:20:30] ===================== [PASSED] xe_pci ======================
[07:20:30] ============= xe_rtp_tables_test (5 subtests) ==============
[07:20:30] ================== xe_rtp_table_gt_test  ===================
[07:20:30] [PASSED] gt_was/14011060649
[07:20:30] [PASSED] gt_was/14011059788
[07:20:30] [PASSED] gt_was/14015795083
[07:20:30] [PASSED] gt_was/16021867713
[07:20:30] [PASSED] gt_was/14019449301
[07:20:30] [PASSED] gt_was/16028005424
[07:20:30] [PASSED] gt_was/14026578760
[07:20:30] [PASSED] gt_was/1409420604
[07:20:30] [PASSED] gt_was/1408615072
[07:20:30] [PASSED] gt_was/22010523718
[07:20:30] [PASSED] gt_was/14011006942
[07:20:30] [PASSED] gt_was/14014830051
[07:20:30] [PASSED] gt_was/18018781329
[07:20:30] [PASSED] gt_was/1509235366
[07:20:30] [PASSED] gt_was/18018781329
[07:20:30] [PASSED] gt_was/16016694945
[07:20:30] [PASSED] gt_was/14018575942
[07:20:30] [PASSED] gt_was/22016670082
[07:20:30] [PASSED] gt_was/22016670082
[07:20:30] [PASSED] gt_was/14017421178
[07:20:30] [PASSED] gt_was/16025250150
[07:20:30] [PASSED] gt_was/14021871409
[07:20:30] [PASSED] gt_was/16021865536
[07:20:30] [PASSED] gt_was/14021486841
[07:20:30] [PASSED] gt_was/14025160223
[07:20:30] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[07:20:30] [PASSED] gt_was/14025635424
[07:20:30] [PASSED] gt_was/16028005424
[07:20:30] ============== [PASSED] xe_rtp_table_gt_test ===============
[07:20:30] ================== xe_rtp_table_gt_test  ===================
[07:20:30] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[07:20:30] [PASSED] gt_tunings/Tuning: 32B Access Enable
[07:20:30] [PASSED] gt_tunings/Tuning: L3 cache
[07:20:30] [PASSED] gt_tunings/Tuning: L3 cache - media
[07:20:30] [PASSED] gt_tunings/Tuning: Compression Overfetch
[07:20:30] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[07:20:30] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[07:20:30] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[07:20:30] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[07:20:30] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[07:20:30] [PASSED] gt_tunings/Tuning: Stateless compression control
[07:20:30] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[07:20:30] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[07:20:30] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[07:20:30] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[07:20:30] ============== [PASSED] xe_rtp_table_gt_test ===============
[07:20:30] ================== xe_rtp_table_oob_test  ==================
[07:20:30] [PASSED] oob_was/1607983814
[07:20:30] [PASSED] oob_was/16010904313
[07:20:30] [PASSED] oob_was/18022495364
[07:20:30] [PASSED] oob_was/22012773006
[07:20:30] [PASSED] oob_was/14014475959
[07:20:30] [PASSED] oob_was/22011391025
[07:20:30] [PASSED] oob_was/22012727170
[07:20:30] [PASSED] oob_was/22012727685
[07:20:30] [PASSED] oob_was/22016596838
[07:20:30] [PASSED] oob_was/18020744125
[07:20:30] [PASSED] oob_was/1409600907
[07:20:30] [PASSED] oob_was/22014953428
[07:20:30] [PASSED] oob_was/16017236439
[07:20:30] [PASSED] oob_was/14019821291
[07:20:30] [PASSED] oob_was/14015076503
[07:20:30] [PASSED] oob_was/14018913170
[07:20:30] [PASSED] oob_was/14018094691
[07:20:30] [PASSED] oob_was/18024947630
[07:20:30] [PASSED] oob_was/16022287689
[07:20:30] [PASSED] oob_was/13011645652
[07:20:30] [PASSED] oob_was/14022293748
[07:20:30] [PASSED] oob_was/22019794406
[07:20:30] [PASSED] oob_was/22019338487
[07:20:30] [PASSED] oob_was/16023588340
[07:20:30] [PASSED] oob_was/14019789679
[07:20:30] [PASSED] oob_was/14022866841
[07:20:30] [PASSED] oob_was/16021333562
[07:20:30] [PASSED] oob_was/14016712196
[07:20:30] [PASSED] oob_was/14015568240
[07:20:30] [PASSED] oob_was/18013179988
[07:20:30] [PASSED] oob_was/1508761755
[07:20:30] [PASSED] oob_was/16023105232
[07:20:30] [PASSED] oob_was/16026508708
[07:20:30] [PASSED] oob_was/14020001231
[07:20:30] [PASSED] oob_was/16023683509
[07:20:30] [PASSED] oob_was/14025515070
[07:20:30] [PASSED] oob_was/15015404425_disable
[07:20:30] [PASSED] oob_was/16026007364
[07:20:30] [PASSED] oob_was/14020316580
[07:20:30] [PASSED] oob_was/14025883347
[07:20:30] [PASSED] oob_was/16029380221
[07:20:30] [PASSED] oob_was/22022079272
[07:20:30] [PASSED] oob_was/16029897822
[07:20:30] [PASSED] oob_was/14027054324
[07:20:30] ============== [PASSED] xe_rtp_table_oob_test ==============
[07:20:30] ================ xe_rtp_table_dev_oob_test  ================
[07:20:30] [PASSED] device_oob_was/22010954014
[07:20:30] [PASSED] device_oob_was/15015404425
[07:20:30] [PASSED] device_oob_was/22019338487_display
[07:20:30] [PASSED] device_oob_was/14022085890
[07:20:30] [PASSED] device_oob_was/14026539277
[07:20:30] [PASSED] device_oob_was/14026633728
[07:20:30] [PASSED] device_oob_was/14026746987
[07:20:30] [PASSED] device_oob_was/14026779378
[07:20:30] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[07:20:30] ========== xe_rtp_table_missing_upper_bound_test  ==========
[07:20:30] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[07:20:30] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[07:20:30] [PASSED] register_whitelist/1806527549
[07:20:30] [PASSED] register_whitelist/allow_read_ctx_timestamp
[07:20:30] [PASSED] register_whitelist/allow_read_queue_timestamp
[07:20:30] [PASSED] register_whitelist/16014440446
[07:20:30] [PASSED] register_whitelist/16017236439
[07:20:30] [PASSED] register_whitelist/16020183090
[07:20:30] [PASSED] register_whitelist/14024997852
[07:20:30] [PASSED] register_whitelist/14024997852
[07:20:30] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[07:20:30] =============== [PASSED] xe_rtp_tables_test ================
[07:20:30] =================== xe_rtp (3 subtests) ====================
[07:20:30] =================== xe_rtp_rules_tests  ====================
[07:20:30] [PASSED] no
[07:20:30] [PASSED] yes
[07:20:30] [PASSED] no-and-no
[07:20:30] [PASSED] no-and-yes
[07:20:30] [PASSED] yes-and-no
[07:20:30] [PASSED] yes-and-yes
[07:20:30] [PASSED] no-or-no
[07:20:30] [PASSED] no-or-yes
[07:20:30] [PASSED] yes-or-no
[07:20:30] [PASSED] yes-or-yes
[07:20:30] [PASSED] no-yes-or-yes-no
[07:20:30] [PASSED] no-yes-or-yes-yes
[07:20:30] [PASSED] yes-yes-or-no-yes
[07:20:30] [PASSED] yes-yes-or-yes-yes
[07:20:30] [PASSED] no-no-or-yes-or-no
[07:20:30] [PASSED] or
[07:20:30] [PASSED] or-yes
[07:20:30] [PASSED] or-no
[07:20:30] [PASSED] yes-or
[07:20:30] [PASSED] no-or
[07:20:30] [PASSED] no-or-or-yes
[07:20:30] [PASSED] yes-or-or-no
[07:20:30] [PASSED] no-or-or-no
[07:20:30] [PASSED] missing-context-engine-class
[07:20:30] [PASSED] missing-context-engine-class-or-yes
[07:20:30] [PASSED] missing-context-engine-class-or-or-yes
[07:20:30] =============== [PASSED] xe_rtp_rules_tests ================
[07:20:30] =============== xe_rtp_process_to_sr_tests  ================
[07:20:30] [PASSED] coalesce-same-reg
[07:20:30] [PASSED] coalesce-same-reg-literal-and-func
[07:20:30] [PASSED] no-match-no-add
[07:20:30] [PASSED] two-regs-two-entries
[07:20:30] [PASSED] clr-one-set-other
[07:20:30] [PASSED] set-field
[07:20:30] [PASSED] conflict-duplicate
[07:20:30] [PASSED] conflict-not-disjoint
[07:20:30] [PASSED] conflict-not-disjoint-literal-and-func
[07:20:30] [PASSED] conflict-reg-type
[07:20:30] [PASSED] bad-mcr-reg-forced-to-regular
[07:20:30] [PASSED] bad-regular-reg-forced-to-mcr
[07:20:30] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[07:20:30] ================== xe_rtp_process_tests  ===================
[07:20:30] [PASSED] active1
[07:20:30] [PASSED] active2
[07:20:30] [PASSED] active-inactive
[07:20:30] [PASSED] inactive-active
[07:20:30] [PASSED] inactive-active-inactive
[07:20:30] [PASSED] inactive-inactive-inactive
[07:20:30] ============== [PASSED] xe_rtp_process_tests ===============
[07:20:30] ===================== [PASSED] xe_rtp ======================
[07:20:30] ==================== xe_wa (1 subtest) =====================
[07:20:30] ======================== xe_wa_gt  =========================
[07:20:30] [PASSED] TIGERLAKE B0
[07:20:30] [PASSED] DG1 A0
[07:20:30] [PASSED] DG1 B0
[07:20:30] [PASSED] ALDERLAKE_S A0
[07:20:30] [PASSED] ALDERLAKE_S B0
[07:20:30] [PASSED] ALDERLAKE_S C0
[07:20:30] [PASSED] ALDERLAKE_S D0
[07:20:30] [PASSED] ALDERLAKE_P A0
[07:20:30] [PASSED] ALDERLAKE_P B0
[07:20:30] [PASSED] ALDERLAKE_P C0
[07:20:30] [PASSED] ALDERLAKE_S RPLS D0
[07:20:30] [PASSED] ALDERLAKE_P RPLU E0
[07:20:30] [PASSED] DG2 G10 C0
[07:20:30] [PASSED] DG2 G11 B1
[07:20:30] [PASSED] DG2 G12 A1
[07:20:30] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[07:20:30] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[07:20:30] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[07:20:30] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[07:20:30] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[07:20:30] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[07:20:30] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[07:20:30] ==================== [PASSED] xe_wa_gt =====================
[07:20:30] ====================== [PASSED] xe_wa ======================
[07:20:30] ============================================================
[07:20:30] Testing complete. Ran 840 tests: passed: 812, skipped: 28
[07:20:30] Elapsed time: 37.178s total, 1.842s configuring, 34.569s building, 0.754s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[07:20:30] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:20:32] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[07:20:57] Starting KUnit Kernel (1/1)...
[07:20:57] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[07:20:57] ============= refcount_interrupt (4 subtests) ==============
[07:20:57] [PASSED] test_single_irq_change
[07:20:57] [PASSED] test_nested_irq_change
[07:20:57] [PASSED] test_multiple_irq_change
[07:20:57] [PASSED] test_irq_save
[07:20:57] =============== [PASSED] refcount_interrupt ================
[07:20:57] ============ drm_test_pick_cmdline (2 subtests) ============
[07:20:57] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[07:20:57] =============== drm_test_pick_cmdline_named  ===============
[07:20:57] [PASSED] NTSC
[07:20:57] [PASSED] NTSC-J
[07:20:57] [PASSED] PAL
[07:20:57] [PASSED] PAL-M
[07:20:57] =========== [PASSED] drm_test_pick_cmdline_named ===========
[07:20:57] ============== [PASSED] drm_test_pick_cmdline ==============
[07:20:57] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[07:20:57] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[07:20:57] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[07:20:57] =========== drm_validate_clone_mode (2 subtests) ===========
[07:20:57] ============== drm_test_check_in_clone_mode  ===============
[07:20:57] [PASSED] in_clone_mode
[07:20:57] [PASSED] not_in_clone_mode
[07:20:57] ========== [PASSED] drm_test_check_in_clone_mode ===========
[07:20:57] =============== drm_test_check_valid_clones  ===============
[07:20:57] [PASSED] not_in_clone_mode
[07:20:57] [PASSED] valid_clone
[07:20:57] [PASSED] invalid_clone
[07:20:57] =========== [PASSED] drm_test_check_valid_clones ===========
[07:20:57] ============= [PASSED] drm_validate_clone_mode =============
[07:20:57] ============= drm_validate_modeset (1 subtest) =============
[07:20:57] [PASSED] drm_test_check_connector_changed_modeset
[07:20:57] ============== [PASSED] drm_validate_modeset ===============
[07:20:57] ====== drm_test_bridge_get_current_state (1 subtest) =======
[07:20:57] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[07:20:57] ======== [PASSED] drm_test_bridge_get_current_state ========
[07:20:57] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[07:20:57] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[07:20:57] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[07:20:57] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[07:20:57] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[07:20:57] ============== drm_bridge_alloc (2 subtests) ===============
[07:20:57] [PASSED] drm_test_drm_bridge_alloc_basic
[07:20:57] [PASSED] drm_test_drm_bridge_alloc_get_put
[07:20:57] ================ [PASSED] drm_bridge_alloc =================
[07:20:57] ============= drm_bridge_bus_fmt (5 subtests) ==============
[07:20:57] [PASSED] drm_test_bridge_rgb_yuv_rgb
[07:20:57] [PASSED] drm_test_bridge_must_convert_to_yuv444
[07:20:57] [PASSED] drm_test_bridge_hdmi_auto_rgb
[07:20:57] [PASSED] drm_test_bridge_auto_first
[07:20:57] [PASSED] drm_test_bridge_rgb_yuv_no_path
[07:20:57] =============== [PASSED] drm_bridge_bus_fmt ================
[07:20:57] ============= drm_cmdline_parser (40 subtests) =============
[07:20:57] [PASSED] drm_test_cmdline_force_d_only
[07:20:57] [PASSED] drm_test_cmdline_force_D_only_dvi
[07:20:57] [PASSED] drm_test_cmdline_force_D_only_hdmi
[07:20:57] [PASSED] drm_test_cmdline_force_D_only_not_digital
[07:20:57] [PASSED] drm_test_cmdline_force_e_only
[07:20:57] [PASSED] drm_test_cmdline_res
[07:20:57] [PASSED] drm_test_cmdline_res_vesa
[07:20:57] [PASSED] drm_test_cmdline_res_vesa_rblank
[07:20:57] [PASSED] drm_test_cmdline_res_rblank
[07:20:57] [PASSED] drm_test_cmdline_res_bpp
[07:20:57] [PASSED] drm_test_cmdline_res_refresh
[07:20:57] [PASSED] drm_test_cmdline_res_bpp_refresh
[07:20:57] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[07:20:57] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[07:20:57] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[07:20:57] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[07:20:57] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[07:20:57] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[07:20:57] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[07:20:57] [PASSED] drm_test_cmdline_res_margins_force_on
[07:20:57] [PASSED] drm_test_cmdline_res_vesa_margins
[07:20:57] [PASSED] drm_test_cmdline_name
[07:20:57] [PASSED] drm_test_cmdline_name_bpp
[07:20:57] [PASSED] drm_test_cmdline_name_option
[07:20:57] [PASSED] drm_test_cmdline_name_bpp_option
[07:20:57] [PASSED] drm_test_cmdline_rotate_0
[07:20:57] [PASSED] drm_test_cmdline_rotate_90
[07:20:57] [PASSED] drm_test_cmdline_rotate_180
[07:20:57] [PASSED] drm_test_cmdline_rotate_270
[07:20:57] [PASSED] drm_test_cmdline_hmirror
[07:20:57] [PASSED] drm_test_cmdline_vmirror
[07:20:57] [PASSED] drm_test_cmdline_margin_options
[07:20:57] [PASSED] drm_test_cmdline_multiple_options
[07:20:57] [PASSED] drm_test_cmdline_bpp_extra_and_option
[07:20:57] [PASSED] drm_test_cmdline_extra_and_option
[07:20:57] [PASSED] drm_test_cmdline_freestanding_options
[07:20:57] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[07:20:57] [PASSED] drm_test_cmdline_panel_orientation
[07:20:57] ================ drm_test_cmdline_invalid  =================
[07:20:57] [PASSED] margin_only
[07:20:57] [PASSED] interlace_only
[07:20:57] [PASSED] res_missing_x
[07:20:57] [PASSED] res_missing_y
[07:20:57] [PASSED] res_bad_y
[07:20:57] [PASSED] res_missing_y_bpp
[07:20:57] [PASSED] res_bad_bpp
[07:20:57] [PASSED] res_bad_refresh
[07:20:57] [PASSED] res_bpp_refresh_force_on_off
[07:20:57] [PASSED] res_invalid_mode
[07:20:57] [PASSED] res_bpp_wrong_place_mode
[07:20:57] [PASSED] name_bpp_refresh
[07:20:57] [PASSED] name_refresh
[07:20:57] [PASSED] name_refresh_wrong_mode
[07:20:57] [PASSED] name_refresh_invalid_mode
[07:20:57] [PASSED] rotate_multiple
[07:20:57] [PASSED] rotate_invalid_val
[07:20:57] [PASSED] rotate_truncated
[07:20:57] [PASSED] invalid_option
[07:20:57] [PASSED] invalid_tv_option
[07:20:57] [PASSED] truncated_tv_option
[07:20:57] ============ [PASSED] drm_test_cmdline_invalid =============
[07:20:57] =============== drm_test_cmdline_tv_options  ===============
[07:20:57] [PASSED] NTSC
[07:20:57] [PASSED] NTSC_443
[07:20:57] [PASSED] NTSC_J
[07:20:57] [PASSED] PAL
[07:20:57] [PASSED] PAL_M
[07:20:57] [PASSED] PAL_N
[07:20:57] [PASSED] SECAM
[07:20:57] [PASSED] MONO_525
[07:20:57] [PASSED] MONO_625
[07:20:57] =========== [PASSED] drm_test_cmdline_tv_options ===========
[07:20:57] =============== [PASSED] drm_cmdline_parser ================
[07:20:57] ========== drmm_connector_hdmi_init (20 subtests) ==========
[07:20:57] [PASSED] drm_test_connector_hdmi_init_valid
[07:20:57] [PASSED] drm_test_connector_hdmi_init_bpc_8
[07:20:57] [PASSED] drm_test_connector_hdmi_init_bpc_10
[07:20:57] [PASSED] drm_test_connector_hdmi_init_bpc_12
[07:20:57] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[07:20:57] [PASSED] drm_test_connector_hdmi_init_bpc_null
[07:20:57] [PASSED] drm_test_connector_hdmi_init_formats_empty
[07:20:57] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[07:20:57] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[07:20:57] [PASSED] supported_formats=0x9 yuv420_allowed=1
[07:20:57] [PASSED] supported_formats=0x9 yuv420_allowed=0
[07:20:57] [PASSED] supported_formats=0x5 yuv420_allowed=1
[07:20:57] [PASSED] supported_formats=0x5 yuv420_allowed=0
[07:20:57] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[07:20:57] [PASSED] drm_test_connector_hdmi_init_null_ddc
[07:20:57] [PASSED] drm_test_connector_hdmi_init_null_product
[07:20:57] [PASSED] drm_test_connector_hdmi_init_null_vendor
[07:20:57] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[07:20:57] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[07:20:57] [PASSED] drm_test_connector_hdmi_init_product_valid
[07:20:57] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[07:20:57] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[07:20:57] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[07:20:57] ========= drm_test_connector_hdmi_init_type_valid  =========
[07:20:57] [PASSED] HDMI-A
[07:20:57] [PASSED] HDMI-B
[07:20:57] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[07:20:57] ======== drm_test_connector_hdmi_init_type_invalid  ========
[07:20:57] [PASSED] Unknown
[07:20:57] [PASSED] VGA
[07:20:57] [PASSED] DVI-I
[07:20:57] [PASSED] DVI-D
[07:20:57] [PASSED] DVI-A
[07:20:57] [PASSED] Composite
[07:20:57] [PASSED] SVIDEO
[07:20:57] [PASSED] LVDS
[07:20:57] [PASSED] Component
[07:20:57] [PASSED] DIN
[07:20:57] [PASSED] DP
[07:20:57] [PASSED] TV
[07:20:57] [PASSED] eDP
[07:20:57] [PASSED] Virtual
[07:20:57] [PASSED] DSI
[07:20:57] [PASSED] DPI
[07:20:57] [PASSED] Writeback
[07:20:57] [PASSED] SPI
[07:20:57] [PASSED] USB
[07:20:57] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[07:20:57] ============ [PASSED] drmm_connector_hdmi_init =============
[07:20:57] ============= drmm_connector_init (3 subtests) =============
[07:20:57] [PASSED] drm_test_drmm_connector_init
[07:20:57] [PASSED] drm_test_drmm_connector_init_null_ddc
[07:20:57] ========= drm_test_drmm_connector_init_type_valid  =========
[07:20:57] [PASSED] Unknown
[07:20:57] [PASSED] VGA
[07:20:57] [PASSED] DVI-I
[07:20:57] [PASSED] DVI-D
[07:20:57] [PASSED] DVI-A
[07:20:57] [PASSED] Composite
[07:20:57] [PASSED] SVIDEO
[07:20:57] [PASSED] LVDS
[07:20:57] [PASSED] Component
[07:20:57] [PASSED] DIN
[07:20:57] [PASSED] DP
[07:20:57] [PASSED] HDMI-A
[07:20:57] [PASSED] HDMI-B
[07:20:57] [PASSED] TV
[07:20:57] [PASSED] eDP
[07:20:57] [PASSED] Virtual
[07:20:57] [PASSED] DSI
[07:20:57] [PASSED] DPI
[07:20:57] [PASSED] Writeback
[07:20:57] [PASSED] SPI
[07:20:57] [PASSED] USB
[07:20:57] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[07:20:57] =============== [PASSED] drmm_connector_init ===============
[07:20:57] ========= drm_connector_dynamic_init (6 subtests) ==========
[07:20:57] [PASSED] drm_test_drm_connector_dynamic_init
[07:20:57] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[07:20:57] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[07:20:57] [PASSED] drm_test_drm_connector_dynamic_init_properties
[07:20:57] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[07:20:57] [PASSED] Unknown
[07:20:57] [PASSED] VGA
[07:20:57] [PASSED] DVI-I
[07:20:57] [PASSED] DVI-D
[07:20:57] [PASSED] DVI-A
[07:20:57] [PASSED] Composite
[07:20:57] [PASSED] SVIDEO
[07:20:57] [PASSED] LVDS
[07:20:57] [PASSED] Component
[07:20:57] [PASSED] DIN
[07:20:57] [PASSED] DP
[07:20:57] [PASSED] HDMI-A
[07:20:57] [PASSED] HDMI-B
[07:20:57] [PASSED] TV
[07:20:57] [PASSED] eDP
[07:20:57] [PASSED] Virtual
[07:20:57] [PASSED] DSI
[07:20:57] [PASSED] DPI
[07:20:57] [PASSED] Writeback
[07:20:57] [PASSED] SPI
[07:20:57] [PASSED] USB
[07:20:57] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[07:20:57] ======== drm_test_drm_connector_dynamic_init_name  =========
[07:20:57] [PASSED] Unknown
[07:20:57] [PASSED] VGA
[07:20:57] [PASSED] DVI-I
[07:20:57] [PASSED] DVI-D
[07:20:57] [PASSED] DVI-A
[07:20:57] [PASSED] Composite
[07:20:57] [PASSED] SVIDEO
[07:20:57] [PASSED] LVDS
[07:20:57] [PASSED] Component
[07:20:57] [PASSED] DIN
[07:20:57] [PASSED] DP
[07:20:57] [PASSED] HDMI-A
[07:20:57] [PASSED] HDMI-B
[07:20:57] [PASSED] TV
[07:20:57] [PASSED] eDP
[07:20:57] [PASSED] Virtual
[07:20:57] [PASSED] DSI
[07:20:57] [PASSED] DPI
[07:20:57] [PASSED] Writeback
[07:20:57] [PASSED] SPI
[07:20:57] [PASSED] USB
[07:20:57] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[07:20:57] =========== [PASSED] drm_connector_dynamic_init ============
[07:20:57] ==== drm_connector_dynamic_register_early (4 subtests) =====
[07:20:57] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[07:20:57] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[07:20:57] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[07:20:57] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[07:20:57] ====== [PASSED] drm_connector_dynamic_register_early =======
[07:20:57] ======= drm_connector_dynamic_register (7 subtests) ========
[07:20:57] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[07:20:57] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[07:20:57] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[07:20:57] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[07:20:57] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[07:20:57] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[07:20:57] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[07:20:57] ========= [PASSED] drm_connector_dynamic_register ==========
[07:20:57] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[07:20:57] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[07:20:57] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[07:20:57] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[07:20:57] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[07:20:57] ========== drm_test_get_tv_mode_from_name_valid  ===========
[07:20:57] [PASSED] NTSC
[07:20:57] [PASSED] NTSC-443
[07:20:57] [PASSED] NTSC-J
[07:20:57] [PASSED] PAL
[07:20:57] [PASSED] PAL-M
[07:20:57] [PASSED] PAL-N
[07:20:57] [PASSED] SECAM
[07:20:57] [PASSED] Mono
[07:20:57] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[07:20:57] [PASSED] drm_test_get_tv_mode_from_name_truncated
[07:20:57] ============ [PASSED] drm_get_tv_mode_from_name ============
[07:20:57] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[07:20:57] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[07:20:57] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[07:20:57] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[07:20:57] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[07:20:57] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[07:20:57] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[07:20:57] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[07:20:57] [PASSED] VIC 96
[07:20:57] [PASSED] VIC 97
[07:20:57] [PASSED] VIC 101
[07:20:57] [PASSED] VIC 102
[07:20:57] [PASSED] VIC 106
[07:20:57] [PASSED] VIC 107
[07:20:57] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[07:20:57] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[07:20:57] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[07:20:57] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[07:20:57] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[07:20:57] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[07:20:57] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[07:20:57] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[07:20:57] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[07:20:57] [PASSED] Automatic
[07:20:57] [PASSED] Full
[07:20:57] [PASSED] Limited 16:235
[07:20:57] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[07:20:57] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[07:20:57] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[07:20:57] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[07:20:57] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[07:20:57] [PASSED] RGB
[07:20:57] [PASSED] YUV 4:2:0
[07:20:57] [PASSED] YUV 4:2:2
[07:20:57] [PASSED] YUV 4:4:4
[07:20:57] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[07:20:57] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[07:20:57] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[07:20:57] ============= drm_damage_helper (21 subtests) ==============
[07:20:57] [PASSED] drm_test_damage_iter_no_damage
[07:20:57] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[07:20:57] [PASSED] drm_test_damage_iter_no_damage_src_moved
[07:20:57] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[07:20:57] [PASSED] drm_test_damage_iter_no_damage_not_visible
[07:20:57] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[07:20:57] [PASSED] drm_test_damage_iter_no_damage_no_fb
[07:20:57] [PASSED] drm_test_damage_iter_simple_damage
[07:20:57] [PASSED] drm_test_damage_iter_single_damage
[07:20:57] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[07:20:57] [PASSED] drm_test_damage_iter_single_damage_outside_src
[07:20:57] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[07:20:57] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[07:20:57] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[07:20:57] [PASSED] drm_test_damage_iter_single_damage_src_moved
[07:20:57] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[07:20:57] [PASSED] drm_test_damage_iter_damage
[07:20:57] [PASSED] drm_test_damage_iter_damage_one_intersect
[07:20:57] [PASSED] drm_test_damage_iter_damage_one_outside
[07:20:57] [PASSED] drm_test_damage_iter_damage_src_moved
[07:20:57] [PASSED] drm_test_damage_iter_damage_not_visible
[07:20:57] ================ [PASSED] drm_damage_helper ================
[07:20:57] ============== drm_dp_mst_helper (3 subtests) ==============
[07:20:57] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[07:20:57] [PASSED] Clock 154000 BPP 30 DSC disabled
[07:20:57] [PASSED] Clock 234000 BPP 30 DSC disabled
[07:20:57] [PASSED] Clock 297000 BPP 24 DSC disabled
[07:20:57] [PASSED] Clock 332880 BPP 24 DSC enabled
[07:20:57] [PASSED] Clock 324540 BPP 24 DSC enabled
[07:20:57] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[07:20:57] ============== drm_test_dp_mst_calc_pbn_div  ===============
[07:20:57] [PASSED] Link rate 2000000 lane count 4
[07:20:57] [PASSED] Link rate 2000000 lane count 2
[07:20:57] [PASSED] Link rate 2000000 lane count 1
[07:20:57] [PASSED] Link rate 1350000 lane count 4
[07:20:57] [PASSED] Link rate 1350000 lane count 2
[07:20:57] [PASSED] Link rate 1350000 lane count 1
[07:20:57] [PASSED] Link rate 1000000 lane count 4
[07:20:57] [PASSED] Link rate 1000000 lane count 2
[07:20:57] [PASSED] Link rate 1000000 lane count 1
[07:20:57] [PASSED] Link rate 810000 lane count 4
[07:20:57] [PASSED] Link rate 810000 lane count 2
[07:20:57] [PASSED] Link rate 810000 lane count 1
[07:20:57] [PASSED] Link rate 540000 lane count 4
[07:20:57] [PASSED] Link rate 540000 lane count 2
[07:20:57] [PASSED] Link rate 540000 lane count 1
[07:20:57] [PASSED] Link rate 270000 lane count 4
[07:20:57] [PASSED] Link rate 270000 lane count 2
[07:20:57] [PASSED] Link rate 270000 lane count 1
[07:20:57] [PASSED] Link rate 162000 lane count 4
[07:20:57] [PASSED] Link rate 162000 lane count 2
[07:20:57] [PASSED] Link rate 162000 lane count 1
[07:20:57] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[07:20:57] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[07:20:57] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[07:20:57] [PASSED] DP_POWER_UP_PHY with port number
[07:20:57] [PASSED] DP_POWER_DOWN_PHY with port number
[07:20:57] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[07:20:57] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[07:20:57] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[07:20:57] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[07:20:57] [PASSED] DP_QUERY_PAYLOAD with port number
[07:20:57] [PASSED] DP_QUERY_PAYLOAD with VCPI
[07:20:57] [PASSED] DP_REMOTE_DPCD_READ with port number
[07:20:57] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[07:20:57] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[07:20:57] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[07:20:57] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[07:20:57] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[07:20:57] [PASSED] DP_REMOTE_I2C_READ with port number
[07:20:57] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[07:20:57] [PASSED] DP_REMOTE_I2C_READ with transactions array
[07:20:57] [PASSED] DP_REMOTE_I2C_WRITE with port number
[07:20:57] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[07:20:57] [PASSED] DP_REMOTE_I2C_WRITE with data array
[07:20:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[07:20:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[07:20:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[07:20:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[07:20:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[07:20:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[07:20:57] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[07:20:57] ================ [PASSED] drm_dp_mst_helper ================
[07:20:57] ================== drm_exec (7 subtests) ===================
[07:20:57] [PASSED] sanitycheck
[07:20:57] [PASSED] test_lock
[07:20:57] [PASSED] test_lock_unlock
[07:20:57] [PASSED] test_duplicates
[07:20:57] [PASSED] test_prepare
[07:20:57] [PASSED] test_prepare_array
[07:20:57] [PASSED] test_multiple_loops
[07:20:57] ==================== [PASSED] drm_exec =====================
[07:20:57] =========== drm_format_helper_test (17 subtests) ===========
[07:20:57] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[07:20:57] [PASSED] single_pixel_source_buffer
[07:20:57] [PASSED] single_pixel_clip_rectangle
[07:20:57] [PASSED] well_known_colors
[07:20:57] [PASSED] destination_pitch
[07:20:57] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[07:20:57] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[07:20:57] [PASSED] single_pixel_source_buffer
[07:20:57] [PASSED] single_pixel_clip_rectangle
[07:20:57] [PASSED] well_known_colors
[07:20:57] [PASSED] destination_pitch
[07:20:57] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[07:20:57] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[07:20:57] [PASSED] single_pixel_source_buffer
[07:20:57] [PASSED] single_pixel_clip_rectangle
[07:20:57] [PASSED] well_known_colors
[07:20:57] [PASSED] destination_pitch
[07:20:57] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[07:20:57] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[07:20:57] [PASSED] single_pixel_source_buffer
[07:20:57] [PASSED] single_pixel_clip_rectangle
[07:20:57] [PASSED] well_known_colors
[07:20:57] [PASSED] destination_pitch
[07:20:57] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[07:20:57] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[07:20:57] [PASSED] single_pixel_source_buffer
[07:20:57] [PASSED] single_pixel_clip_rectangle
[07:20:57] [PASSED] well_known_colors
[07:20:57] [PASSED] destination_pitch
[07:20:57] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[07:20:57] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[07:20:57] [PASSED] single_pixel_source_buffer
[07:20:57] [PASSED] single_pixel_clip_rectangle
[07:20:57] [PASSED] well_known_colors
[07:20:57] [PASSED] destination_pitch
[07:20:57] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[07:20:57] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[07:20:57] [PASSED] single_pixel_source_buffer
[07:20:57] [PASSED] single_pixel_clip_rectangle
[07:20:57] [PASSED] well_known_colors
[07:20:57] [PASSED] destination_pitch
[07:20:57] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[07:20:57] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[07:20:57] [PASSED] single_pixel_source_buffer
[07:20:57] [PASSED] single_pixel_clip_rectangle
[07:20:57] [PASSED] well_known_colors
[07:20:57] [PASSED] destination_pitch
[07:20:57] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[07:20:57] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[07:20:57] [PASSED] single_pixel_source_buffer
[07:20:57] [PASSED] single_pixel_clip_rectangle
[07:20:57] [PASSED] well_known_colors
[07:20:57] [PASSED] destination_pitch
[07:20:57] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[07:20:57] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[07:20:57] [PASSED] single_pixel_source_buffer
[07:20:57] [PASSED] single_pixel_clip_rectangle
[07:20:57] [PASSED] well_known_colors
[07:20:57] [PASSED] destination_pitch
[07:20:57] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[07:20:57] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[07:20:57] [PASSED] single_pixel_source_buffer
[07:20:57] [PASSED] single_pixel_clip_rectangle
[07:20:57] [PASSED] well_known_colors
[07:20:57] [PASSED] destination_pitch
[07:20:57] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[07:20:57] ============== drm_test_fb_xrgb8888_to_mono  ===============
[07:20:57] [PASSED] single_pixel_source_buffer
[07:20:57] [PASSED] single_pixel_clip_rectangle
[07:20:57] [PASSED] well_known_colors
[07:20:57] [PASSED] destination_pitch
[07:20:57] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[07:20:57] ==================== drm_test_fb_swab  =====================
[07:20:57] [PASSED] single_pixel_source_buffer
[07:20:57] [PASSED] single_pixel_clip_rectangle
[07:20:57] [PASSED] well_known_colors
[07:20:57] [PASSED] destination_pitch
[07:20:57] ================ [PASSED] drm_test_fb_swab =================
[07:20:57] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[07:20:57] [PASSED] single_pixel_source_buffer
[07:20:57] [PASSED] single_pixel_clip_rectangle
[07:20:57] [PASSED] well_known_colors
[07:20:57] [PASSED] destination_pitch
[07:20:57] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[07:20:57] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[07:20:57] [PASSED] single_pixel_source_buffer
[07:20:57] [PASSED] single_pixel_clip_rectangle
[07:20:57] [PASSED] well_known_colors
[07:20:57] [PASSED] destination_pitch
[07:20:57] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[07:20:57] ================= drm_test_fb_clip_offset  =================
[07:20:57] [PASSED] pass through
[07:20:57] [PASSED] horizontal offset
[07:20:57] [PASSED] vertical offset
[07:20:57] [PASSED] horizontal and vertical offset
[07:20:57] [PASSED] horizontal offset (custom pitch)
[07:20:57] [PASSED] vertical offset (custom pitch)
[07:20:57] [PASSED] horizontal and vertical offset (custom pitch)
[07:20:57] ============= [PASSED] drm_test_fb_clip_offset =============
[07:20:57] =================== drm_test_fb_memcpy  ====================
[07:20:57] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[07:20:57] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[07:20:57] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[07:20:57] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[07:20:57] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[07:20:57] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[07:20:57] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[07:20:57] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[07:20:57] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[07:20:57] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[07:20:57] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[07:20:57] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[07:20:57] =============== [PASSED] drm_test_fb_memcpy ================
[07:20:57] ============= [PASSED] drm_format_helper_test ==============
[07:20:57] ================= drm_format (18 subtests) =================
[07:20:57] [PASSED] drm_test_format_block_width_invalid
[07:20:57] [PASSED] drm_test_format_block_width_one_plane
[07:20:57] [PASSED] drm_test_format_block_width_two_plane
[07:20:57] [PASSED] drm_test_format_block_width_three_plane
[07:20:57] [PASSED] drm_test_format_block_width_tiled
[07:20:57] [PASSED] drm_test_format_block_height_invalid
[07:20:57] [PASSED] drm_test_format_block_height_one_plane
[07:20:57] [PASSED] drm_test_format_block_height_two_plane
[07:20:57] [PASSED] drm_test_format_block_height_three_plane
[07:20:57] [PASSED] drm_test_format_block_height_tiled
[07:20:57] [PASSED] drm_test_format_min_pitch_invalid
[07:20:57] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[07:20:57] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[07:20:57] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[07:20:57] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[07:20:57] [PASSED] drm_test_format_min_pitch_two_plane
[07:20:57] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[07:20:57] [PASSED] drm_test_format_min_pitch_tiled
[07:20:57] =================== [PASSED] drm_format ====================
[07:20:57] ============== drm_framebuffer (10 subtests) ===============
[07:20:57] ========== drm_test_framebuffer_check_src_coords  ==========
[07:20:57] [PASSED] Success: source fits into fb
[07:20:57] [PASSED] Fail: overflowing fb with x-axis coordinate
[07:20:57] [PASSED] Fail: overflowing fb with y-axis coordinate
[07:20:57] [PASSED] Fail: overflowing fb with source width
[07:20:57] [PASSED] Fail: overflowing fb with source height
[07:20:57] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[07:20:57] [PASSED] drm_test_framebuffer_cleanup
[07:20:57] =============== drm_test_framebuffer_create  ===============
[07:20:57] [PASSED] ABGR8888 normal sizes
[07:20:57] [PASSED] ABGR8888 max sizes
[07:20:57] [PASSED] ABGR8888 pitch greater than min required
[07:20:57] [PASSED] ABGR8888 pitch less than min required
[07:20:57] [PASSED] ABGR8888 Invalid width
[07:20:57] [PASSED] ABGR8888 Invalid buffer handle
[07:20:57] [PASSED] No pixel format
[07:20:57] [PASSED] ABGR8888 Width 0
[07:20:57] [PASSED] ABGR8888 Height 0
[07:20:57] [PASSED] ABGR8888 Out of bound height * pitch combination
[07:20:57] [PASSED] ABGR8888 Large buffer offset
[07:20:57] [PASSED] ABGR8888 Buffer offset for inexistent plane
[07:20:57] [PASSED] ABGR8888 Invalid flag
[07:20:57] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[07:20:57] [PASSED] ABGR8888 Valid buffer modifier
[07:20:57] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[07:20:57] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[07:20:57] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[07:20:57] [PASSED] NV12 Normal sizes
[07:20:57] [PASSED] NV12 Max sizes
[07:20:57] [PASSED] NV12 Invalid pitch
[07:20:57] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[07:20:57] [PASSED] NV12 different  modifier per-plane
[07:20:57] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[07:20:57] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[07:20:57] [PASSED] NV12 Modifier for inexistent plane
[07:20:57] [PASSED] NV12 Handle for inexistent plane
[07:20:57] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[07:20:57] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[07:20:57] [PASSED] YVU420 Normal sizes
[07:20:57] [PASSED] YVU420 Max sizes
[07:20:57] [PASSED] YVU420 Invalid pitch
[07:20:57] [PASSED] YVU420 Different pitches
[07:20:57] [PASSED] YVU420 Different buffer offsets/pitches
[07:20:57] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[07:20:57] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[07:20:57] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[07:20:57] [PASSED] YVU420 Valid modifier
[07:20:57] [PASSED] YVU420 Different modifiers per plane
[07:20:57] [PASSED] YVU420 Modifier for inexistent plane
[07:20:57] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[07:20:57] [PASSED] X0L2 Normal sizes
[07:20:57] [PASSED] X0L2 Max sizes
[07:20:57] [PASSED] X0L2 Invalid pitch
[07:20:57] [PASSED] X0L2 Pitch greater than minimum required
[07:20:57] [PASSED] X0L2 Handle for inexistent plane
[07:20:57] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[07:20:57] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[07:20:57] [PASSED] X0L2 Valid modifier
[07:20:57] [PASSED] X0L2 Modifier for inexistent plane
[07:20:57] =========== [PASSED] drm_test_framebuffer_create ===========
[07:20:57] [PASSED] drm_test_framebuffer_free
[07:20:57] [PASSED] drm_test_framebuffer_init
[07:20:57] [PASSED] drm_test_framebuffer_init_bad_format
[07:20:57] [PASSED] drm_test_framebuffer_init_dev_mismatch
[07:20:57] [PASSED] drm_test_framebuffer_lookup
[07:20:57] [PASSED] drm_test_framebuffer_lookup_inexistent
[07:20:57] [PASSED] drm_test_framebuffer_modifiers_not_supported
[07:20:57] ================= [PASSED] drm_framebuffer =================
[07:20:57] ================ drm_gem_shmem (8 subtests) ================
[07:20:57] [PASSED] drm_gem_shmem_test_obj_create
[07:20:57] [PASSED] drm_gem_shmem_test_obj_create_private
[07:20:57] [PASSED] drm_gem_shmem_test_pin_pages
[07:20:57] [PASSED] drm_gem_shmem_test_vmap
[07:20:57] [PASSED] drm_gem_shmem_test_get_sg_table
[07:20:57] [PASSED] drm_gem_shmem_test_get_pages_sgt
[07:20:57] [PASSED] drm_gem_shmem_test_madvise
[07:20:57] [PASSED] drm_gem_shmem_test_purge
[07:20:57] ================== [PASSED] drm_gem_shmem ==================
[07:20:57] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[07:20:57] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[07:20:57] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[07:20:57] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[07:20:57] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[07:20:57] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[07:20:57] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[07:20:57] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[07:20:57] [PASSED] Automatic
[07:20:57] [PASSED] Full
[07:20:57] [PASSED] Limited 16:235
[07:20:57] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[07:20:57] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[07:20:57] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[07:20:57] [PASSED] drm_test_check_disable_connector
[07:20:57] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[07:20:57] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[07:20:57] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[07:20:57] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[07:20:57] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[07:20:57] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[07:20:57] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[07:20:57] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[07:20:57] [PASSED] drm_test_check_output_bpc_dvi
[07:20:57] [PASSED] drm_test_check_output_bpc_format_vic_1
[07:20:57] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[07:20:57] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[07:20:57] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[07:20:57] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[07:20:57] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[07:20:57] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[07:20:57] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[07:20:57] ============ drm_test_check_hdmi_color_format  =============
[07:20:57] [PASSED] AUTO -> RGB
[07:20:57] [PASSED] YCBCR422 -> YUV422
[07:20:57] [PASSED] YCBCR420 -> YUV420
[07:20:57] [PASSED] YCBCR444 -> YUV444
[07:20:57] [PASSED] RGB -> RGB
[07:20:57] ======== [PASSED] drm_test_check_hdmi_color_format =========
[07:20:57] ======== drm_test_check_hdmi_color_format_420_only  ========
[07:20:57] [PASSED] RGB should fail
[07:20:57] [PASSED] YUV444 should fail
[07:20:57] [PASSED] YUV422 should fail
[07:20:57] [PASSED] YUV420 should work
[07:20:57] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[07:20:57] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[07:20:57] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[07:20:57] [PASSED] drm_test_check_broadcast_rgb_value
[07:20:57] [PASSED] drm_test_check_bpc_8_value
[07:20:57] [PASSED] drm_test_check_bpc_10_value
[07:20:57] [PASSED] drm_test_check_bpc_12_value
[07:20:57] [PASSED] drm_test_check_format_value
[07:20:57] [PASSED] drm_test_check_tmds_char_value
[07:20:57] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[07:20:57] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[07:20:57] [PASSED] drm_test_check_mode_valid
[07:20:57] [PASSED] drm_test_check_mode_valid_reject
[07:20:57] [PASSED] drm_test_check_mode_valid_reject_rate
[07:20:57] [PASSED] drm_test_check_mode_valid_reject_max_clock
[07:20:57] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[07:20:57] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[07:20:57] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[07:20:57] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[07:20:57] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[07:20:57] [PASSED] drm_test_check_infoframes
[07:20:57] [PASSED] drm_test_check_reject_avi_infoframe
[07:20:57] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[07:20:57] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[07:20:57] [PASSED] drm_test_check_reject_audio_infoframe
[07:20:57] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[07:20:57] ================= drm_managed (2 subtests) =================
[07:20:57] [PASSED] drm_test_managed_release_action
[07:20:57] [PASSED] drm_test_managed_run_action
[07:20:57] =================== [PASSED] drm_managed ===================
[07:20:57] =================== drm_mm (6 subtests) ====================
[07:20:57] [PASSED] drm_test_mm_init
[07:20:57] [PASSED] drm_test_mm_debug
[07:20:57] [PASSED] drm_test_mm_align32
[07:20:57] [PASSED] drm_test_mm_align64
[07:20:57] [PASSED] drm_test_mm_lowest
[07:20:57] [PASSED] drm_test_mm_highest
[07:20:57] ===================== [PASSED] drm_mm ======================
[07:20:57] ============= drm_modes_analog_tv (5 subtests) =============
[07:20:57] [PASSED] drm_test_modes_analog_tv_mono_576i
[07:20:57] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[07:20:57] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[07:20:57] [PASSED] drm_test_modes_analog_tv_pal_576i
[07:20:57] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[07:20:57] =============== [PASSED] drm_modes_analog_tv ===============
[07:20:57] ============== drm_plane_helper (2 subtests) ===============
[07:20:57] =============== drm_test_check_plane_state  ================
[07:20:57] [PASSED] clipping_simple
[07:20:57] [PASSED] clipping_rotate_reflect
[07:20:57] [PASSED] positioning_simple
[07:20:57] [PASSED] upscaling
[07:20:57] [PASSED] downscaling
[07:20:57] [PASSED] rounding1
[07:20:57] [PASSED] rounding2
[07:20:57] [PASSED] rounding3
[07:20:57] [PASSED] rounding4
[07:20:57] =========== [PASSED] drm_test_check_plane_state ============
[07:20:57] =========== drm_test_check_invalid_plane_state  ============
[07:20:57] [PASSED] positioning_invalid
[07:20:57] [PASSED] upscaling_invalid
[07:20:57] [PASSED] downscaling_invalid
[07:20:57] ======= [PASSED] drm_test_check_invalid_plane_state ========
[07:20:57] ================ [PASSED] drm_plane_helper =================
[07:20:57] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[07:20:57] ====== drm_test_connector_helper_tv_get_modes_check  =======
[07:20:57] [PASSED] None
[07:20:57] [PASSED] PAL
[07:20:57] [PASSED] NTSC
[07:20:57] [PASSED] Both, NTSC Default
[07:20:57] [PASSED] Both, PAL Default
[07:20:57] [PASSED] Both, NTSC Default, with PAL on command-line
[07:20:57] [PASSED] Both, PAL Default, with NTSC on command-line
[07:20:57] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[07:20:57] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[07:20:57] ================== drm_rect (9 subtests) ===================
[07:20:57] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[07:20:57] [PASSED] drm_test_rect_clip_scaled_not_clipped
[07:20:57] [PASSED] drm_test_rect_clip_scaled_clipped
[07:20:57] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[07:20:57] ================= drm_test_rect_intersect  =================
[07:20:57] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[07:20:57] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[07:20:57] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[07:20:57] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[07:20:57] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[07:20:57] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[07:20:57] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[07:20:57] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[07:20:57] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[07:20:57] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[07:20:57] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[07:20:57] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[07:20:57] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[07:20:57] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[07:20:57] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[07:20:57] ============= [PASSED] drm_test_rect_intersect =============
[07:20:57] ================ drm_test_rect_calc_hscale  ================
[07:20:57] [PASSED] normal use
[07:20:57] [PASSED] out of max range
[07:20:57] [PASSED] out of min range
[07:20:57] [PASSED] zero dst
[07:20:57] [PASSED] negative src
[07:20:57] [PASSED] negative dst
[07:20:57] ============ [PASSED] drm_test_rect_calc_hscale ============
[07:20:57] ================ drm_test_rect_calc_vscale  ================
[07:20:57] [PASSED] normal use
[07:20:57] [PASSED] out of max range
[07:20:57] [PASSED] out of min range
[07:20:57] [PASSED] zero dst
[07:20:57] [PASSED] negative src
[07:20:57] [PASSED] negative dst
[07:20:57] ============ [PASSED] drm_test_rect_calc_vscale ============
[07:20:57] ================== drm_test_rect_rotate  ===================
[07:20:57] [PASSED] reflect-x
[07:20:57] [PASSED] reflect-y
[07:20:57] [PASSED] rotate-0
[07:20:57] [PASSED] rotate-90
[07:20:57] [PASSED] rotate-180
[07:20:57] [PASSED] rotate-270
[07:20:57] ============== [PASSED] drm_test_rect_rotate ===============
[07:20:57] ================ drm_test_rect_rotate_inv  =================
[07:20:57] [PASSED] reflect-x
[07:20:57] [PASSED] reflect-y
[07:20:57] [PASSED] rotate-0
[07:20:57] [PASSED] rotate-90
[07:20:57] [PASSED] rotate-180
[07:20:57] [PASSED] rotate-270
[07:20:57] ============ [PASSED] drm_test_rect_rotate_inv =============
[07:20:57] ==================== [PASSED] drm_rect =====================
[07:20:57] ============ drm_sysfb_modeset_test (1 subtest) ============
[07:20:57] ============ drm_test_sysfb_build_fourcc_list  =============
[07:20:57] [PASSED] no native formats
[07:20:57] [PASSED] XRGB8888 as native format
[07:20:57] [PASSED] remove duplicates
[07:20:57] [PASSED] convert alpha formats
[07:20:57] [PASSED] random formats
[07:20:57] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[07:20:57] ============= [PASSED] drm_sysfb_modeset_test ==============
[07:20:57] ================== drm_fixp (2 subtests) ===================
[07:20:57] [PASSED] drm_test_int2fixp
[07:20:57] [PASSED] drm_test_sm2fixp
[07:20:57] ==================== [PASSED] drm_fixp =====================
[07:20:57] ============================================================
[07:20:57] Testing complete. Ran 641 tests: passed: 641
[07:20:57] Elapsed time: 27.135s total, 1.836s configuring, 25.131s building, 0.146s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[07:20:57] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:20:59] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[07:21:09] Starting KUnit Kernel (1/1)...
[07:21:09] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[07:21:09] ============= refcount_interrupt (4 subtests) ==============
[07:21:09] [PASSED] test_single_irq_change
[07:21:09] [PASSED] test_nested_irq_change
[07:21:09] [PASSED] test_multiple_irq_change
[07:21:09] [PASSED] test_irq_save
[07:21:09] =============== [PASSED] refcount_interrupt ================
[07:21:09] ================= ttm_device (5 subtests) ==================
[07:21:09] [PASSED] ttm_device_init_basic
[07:21:09] [PASSED] ttm_device_init_multiple
[07:21:09] [PASSED] ttm_device_fini_basic
[07:21:09] [PASSED] ttm_device_init_no_vma_man
[07:21:09] ================== ttm_device_init_pools  ==================
[07:21:09] [PASSED] No DMA allocations, no DMA32 required
[07:21:09] [PASSED] DMA allocations, DMA32 required
[07:21:09] [PASSED] No DMA allocations, DMA32 required
[07:21:09] [PASSED] DMA allocations, no DMA32 required
[07:21:09] ============== [PASSED] ttm_device_init_pools ==============
[07:21:09] =================== [PASSED] ttm_device ====================
[07:21:09] ================== ttm_pool (8 subtests) ===================
[07:21:09] ================== ttm_pool_alloc_basic  ===================
[07:21:09] [PASSED] One page
[07:21:09] [PASSED] More than one page
[07:21:09] [PASSED] Above the allocation limit
[07:21:09] [PASSED] One page, with coherent DMA mappings enabled
[07:21:09] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[07:21:09] ============== [PASSED] ttm_pool_alloc_basic ===============
[07:21:09] ============== ttm_pool_alloc_basic_dma_addr  ==============
[07:21:09] [PASSED] One page
[07:21:09] [PASSED] More than one page
[07:21:09] [PASSED] Above the allocation limit
[07:21:09] [PASSED] One page, with coherent DMA mappings enabled
[07:21:09] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[07:21:09] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[07:21:09] [PASSED] ttm_pool_alloc_order_caching_match
[07:21:09] [PASSED] ttm_pool_alloc_caching_mismatch
[07:21:09] [PASSED] ttm_pool_alloc_order_mismatch
[07:21:09] [PASSED] ttm_pool_free_dma_alloc
[07:21:09] [PASSED] ttm_pool_free_no_dma_alloc
[07:21:09] [PASSED] ttm_pool_fini_basic
[07:21:09] ==================== [PASSED] ttm_pool =====================
[07:21:09] ================ ttm_resource (8 subtests) =================
[07:21:09] ================= ttm_resource_init_basic  =================
[07:21:09] [PASSED] Init resource in TTM_PL_SYSTEM
[07:21:09] [PASSED] Init resource in TTM_PL_VRAM
[07:21:09] [PASSED] Init resource in a private placement
[07:21:09] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[07:21:09] ============= [PASSED] ttm_resource_init_basic =============
[07:21:09] [PASSED] ttm_resource_init_pinned
[07:21:09] [PASSED] ttm_resource_fini_basic
[07:21:09] [PASSED] ttm_resource_manager_init_basic
[07:21:09] [PASSED] ttm_resource_manager_usage_basic
[07:21:09] [PASSED] ttm_resource_manager_set_used_basic
[07:21:09] [PASSED] ttm_sys_man_alloc_basic
[07:21:09] [PASSED] ttm_sys_man_free_basic
[07:21:09] ================== [PASSED] ttm_resource ===================
[07:21:09] =================== ttm_tt (15 subtests) ===================
[07:21:09] ==================== ttm_tt_init_basic  ====================
[07:21:09] [PASSED] Page-aligned size
[07:21:09] [PASSED] Extra pages requested
[07:21:09] ================ [PASSED] ttm_tt_init_basic ================
[07:21:09] [PASSED] ttm_tt_init_misaligned
[07:21:09] [PASSED] ttm_tt_fini_basic
[07:21:09] [PASSED] ttm_tt_fini_sg
[07:21:09] [PASSED] ttm_tt_fini_shmem
[07:21:09] [PASSED] ttm_tt_create_basic
[07:21:09] [PASSED] ttm_tt_create_invalid_bo_type
[07:21:09] [PASSED] ttm_tt_create_ttm_exists
[07:21:09] [PASSED] ttm_tt_create_failed
[07:21:09] [PASSED] ttm_tt_destroy_basic
[07:21:09] [PASSED] ttm_tt_populate_null_ttm
[07:21:09] [PASSED] ttm_tt_populate_populated_ttm
[07:21:09] [PASSED] ttm_tt_unpopulate_basic
[07:21:09] [PASSED] ttm_tt_unpopulate_empty_ttm
[07:21:09] [PASSED] ttm_tt_swapin_basic
[07:21:09] ===================== [PASSED] ttm_tt ======================
[07:21:09] =================== ttm_bo (14 subtests) ===================
[07:21:09] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[07:21:09] [PASSED] Cannot be interrupted and sleeps
[07:21:09] [PASSED] Cannot be interrupted, locks straight away
[07:21:09] [PASSED] Can be interrupted, sleeps
[07:21:09] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[07:21:09] [PASSED] ttm_bo_reserve_locked_no_sleep
[07:21:09] [PASSED] ttm_bo_reserve_no_wait_ticket
[07:21:10] [PASSED] ttm_bo_reserve_double_resv
[07:21:10] [PASSED] ttm_bo_reserve_interrupted
[07:21:10] [PASSED] ttm_bo_reserve_deadlock
[07:21:10] [PASSED] ttm_bo_unreserve_basic
[07:21:10] [PASSED] ttm_bo_unreserve_pinned
[07:21:10] [PASSED] ttm_bo_unreserve_bulk
[07:21:10] [PASSED] ttm_bo_fini_basic
[07:21:10] [PASSED] ttm_bo_fini_shared_resv
[07:21:10] [PASSED] ttm_bo_pin_basic
[07:21:10] [PASSED] ttm_bo_pin_unpin_resource
[07:21:10] [PASSED] ttm_bo_multiple_pin_one_unpin
[07:21:10] ===================== [PASSED] ttm_bo ======================
[07:21:10] ============== ttm_bo_validate (22 subtests) ===============
[07:21:10] ============== ttm_bo_init_reserved_sys_man  ===============
[07:21:10] [PASSED] Buffer object for userspace
[07:21:10] [PASSED] Kernel buffer object
[07:21:10] [PASSED] Shared buffer object
[07:21:10] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[07:21:10] ============== ttm_bo_init_reserved_mock_man  ==============
[07:21:10] [PASSED] Buffer object for userspace
[07:21:10] [PASSED] Kernel buffer object
[07:21:10] [PASSED] Shared buffer object
[07:21:10] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[07:21:10] [PASSED] ttm_bo_init_reserved_resv
[07:21:10] ================== ttm_bo_validate_basic  ==================
[07:21:10] [PASSED] Buffer object for userspace
[07:21:10] [PASSED] Kernel buffer object
[07:21:10] [PASSED] Shared buffer object
[07:21:10] ============== [PASSED] ttm_bo_validate_basic ==============
[07:21:10] [PASSED] ttm_bo_validate_invalid_placement
[07:21:10] ============= ttm_bo_validate_same_placement  ==============
[07:21:10] [PASSED] System manager
[07:21:10] [PASSED] VRAM manager
[07:21:10] ========= [PASSED] ttm_bo_validate_same_placement ==========
[07:21:10] [PASSED] ttm_bo_validate_failed_alloc
[07:21:10] [PASSED] ttm_bo_validate_pinned
[07:21:10] [PASSED] ttm_bo_validate_busy_placement
[07:21:10] ================ ttm_bo_validate_multihop  =================
[07:21:10] [PASSED] Buffer object for userspace
[07:21:10] [PASSED] Kernel buffer object
[07:21:10] [PASSED] Shared buffer object
[07:21:10] ============ [PASSED] ttm_bo_validate_multihop =============
[07:21:10] ========== ttm_bo_validate_no_placement_signaled  ==========
[07:21:10] [PASSED] Buffer object in system domain, no page vector
[07:21:10] [PASSED] Buffer object in system domain with an existing page vector
[07:21:10] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[07:21:10] ======== ttm_bo_validate_no_placement_not_signaled  ========
[07:21:10] [PASSED] Buffer object for userspace
[07:21:10] [PASSED] Kernel buffer object
[07:21:10] [PASSED] Shared buffer object
[07:21:10] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[07:21:10] [PASSED] ttm_bo_validate_move_fence_signaled
[07:21:10] ========= ttm_bo_validate_move_fence_not_signaled  =========
[07:21:10] [PASSED] Waits for GPU
[07:21:10] [PASSED] Tries to lock straight away
[07:21:10] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[07:21:10] [PASSED] ttm_bo_validate_swapout
[07:21:10] [PASSED] ttm_bo_validate_happy_evict
[07:21:10] [PASSED] ttm_bo_validate_all_pinned_evict
[07:21:10] [PASSED] ttm_bo_validate_allowed_only_evict
[07:21:10] [PASSED] ttm_bo_validate_deleted_evict
[07:21:10] [PASSED] ttm_bo_validate_busy_domain_evict
[07:21:10] [PASSED] ttm_bo_validate_evict_gutting
[07:21:10] [PASSED] ttm_bo_validate_recrusive_evict
[07:21:10] ================= [PASSED] ttm_bo_validate =================
[07:21:10] ============================================================
[07:21:10] Testing complete. Ran 106 tests: passed: 106
[07:21:10] Elapsed time: 12.175s total, 1.824s configuring, 10.086s building, 0.230s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/dma-buf/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[07:21:10] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:21:12] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[07:21:20] Starting KUnit Kernel (1/1)...
[07:21:20] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[07:21:20] ============= refcount_interrupt (4 subtests) ==============
[07:21:20] [PASSED] test_single_irq_change
[07:21:20] [PASSED] test_nested_irq_change
[07:21:20] [PASSED] test_multiple_irq_change
[07:21:20] [PASSED] test_irq_save
[07:21:20] =============== [PASSED] refcount_interrupt ================
[07:21:20] =============== dma-buf-fence (12 subtests) ================
[07:21:20] [PASSED] test_sanitycheck
[07:21:20] [PASSED] test_signaling
[07:21:20] [PASSED] test_add_callback
[07:21:20] [PASSED] test_late_add_callback
[07:21:20] [PASSED] test_rm_callback
[07:21:20] [PASSED] test_late_rm_callback
[07:21:20] [PASSED] test_status
[07:21:20] [PASSED] test_error
[07:21:20] [PASSED] test_wait
[07:21:20] [PASSED] test_wait_timeout
[07:21:20] [PASSED] test_stub
[07:21:20] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[07:21:20] ================== [PASSED] dma-buf-fence ==================
[07:21:20] ============ dma-buf-fence-chain (11 subtests) =============
[07:21:20] [PASSED] test_sanitycheck
[07:21:20] [PASSED] test_find_seqno
[07:21:20] [PASSED] test_find_signaled
[07:21:20] [PASSED] test_find_out_of_order
[07:21:25] [PASSED] test_find_gap
[07:21:25] [PASSED] test_find_race
[07:21:25] [PASSED] test_signal_forward
[07:21:25] [PASSED] test_signal_backward
[07:21:26] [PASSED] test_wait_forward
[07:21:26] [PASSED] test_wait_backward
[07:21:26] [PASSED] test_wait_random
[07:21:26] =============== [PASSED] dma-buf-fence-chain ===============
[07:21:26] ============ dma-buf-fence-unwrap (10 subtests) ============
[07:21:26] [PASSED] test_sanitycheck
[07:21:26] [PASSED] test_unwrap_array
[07:21:26] [PASSED] test_unwrap_chain
[07:21:26] [PASSED] test_unwrap_chain_array
[07:21:26] [PASSED] test_unwrap_merge
[07:21:26] [PASSED] test_unwrap_merge_duplicate
[07:21:26] [PASSED] test_unwrap_merge_seqno
[07:21:26] [PASSED] test_unwrap_merge_order
[07:21:26] [PASSED] test_unwrap_merge_complex
[07:21:26] [PASSED] test_unwrap_merge_complex_seqno
[07:21:26] ============== [PASSED] dma-buf-fence-unwrap ===============
[07:21:26] ================ dma-buf-resv (5 subtests) =================
[07:21:26] [PASSED] test_sanitycheck
[07:21:26] ===================== test_signaling  ======================
[07:21:26] [PASSED] kernel
[07:21:26] [PASSED] write
[07:21:26] [PASSED] read
[07:21:26] [PASSED] bookkeep
[07:21:26] ================= [PASSED] test_signaling ==================
[07:21:26] ====================== test_for_each  ======================
[07:21:26] [PASSED] kernel
[07:21:26] [PASSED] write
[07:21:26] [PASSED] read
[07:21:26] [PASSED] bookkeep
[07:21:26] ================== [PASSED] test_for_each ==================
[07:21:26] ================= test_for_each_unlocked  ==================
[07:21:26] [PASSED] kernel
[07:21:26] [PASSED] write
[07:21:26] [PASSED] read
[07:21:26] [PASSED] bookkeep
[07:21:26] ============= [PASSED] test_for_each_unlocked ==============
[07:21:26] ===================== test_get_fences  =====================
[07:21:26] [PASSED] kernel
[07:21:26] [PASSED] write
[07:21:26] [PASSED] read
[07:21:26] [PASSED] bookkeep
[07:21:26] ================= [PASSED] test_get_fences =================
[07:21:26] ================== [PASSED] dma-buf-resv ===================
[07:21:26] ============================================================
[07:21:26] Testing complete. Ran 54 tests: passed: 53, skipped: 1
[07:21:26] Elapsed time: 15.774s total, 1.818s configuring, 8.685s building, 5.268s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


