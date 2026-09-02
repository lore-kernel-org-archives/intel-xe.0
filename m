Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E17FC61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 17:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299D910F2EE;
	Wed,  2 Sep 2026 17:43:56 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B377F10F2EE;
 Wed,  2 Sep 2026 17:43:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_perf=3A_Add_some_null_ptr_chec?=
 =?utf-8?q?ks_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Sep 2026 17:43:54 -0000
Message-ID: <178837103471.114734.7360142797277031729@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260902154852.742844-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260902154852.742844-1-vinay.belgaumkar@intel.com>
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

Series: perf: Add some null ptr checks (rev3)
URL   : https://patchwork.freedesktop.org/series/173178/
State : success

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[17:41:51] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:41:56] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:42:17] Starting KUnit Kernel (1/1)...
[17:42:17] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:42:17] ============= refcount_interrupt (4 subtests) ==============
[17:42:17] [PASSED] test_single_irq_change
[17:42:17] [PASSED] test_nested_irq_change
[17:42:17] [PASSED] test_multiple_irq_change
[17:42:17] [PASSED] test_irq_save
[17:42:17] =============== [PASSED] refcount_interrupt ================
[17:42:17] ================= gpu_buddy (14 subtests) ==================
[17:42:17] [PASSED] gpu_test_buddy_alloc_limit
[17:42:17] [PASSED] gpu_test_buddy_alloc_optimistic
[17:42:17] [PASSED] gpu_test_buddy_alloc_pessimistic
[17:42:17] [PASSED] gpu_test_buddy_alloc_pathological
[17:42:17] [PASSED] gpu_test_buddy_alloc_contiguous
[17:42:17] [PASSED] gpu_test_buddy_alloc_clear
[17:42:17] [PASSED] gpu_test_buddy_alloc_range
[17:42:17] [PASSED] gpu_test_buddy_alloc_range_bias
[17:42:18] [PASSED] gpu_test_buddy_fragmentation_performance
[17:42:19] [PASSED] gpu_test_buddy_dirty_tracker_performance
[17:42:19] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[17:42:19] [PASSED] gpu_test_buddy_offset_aligned_allocation
[17:42:19] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[17:42:19] [PASSED] gpu_test_buddy_addr_to_block
[17:42:19] ==================== [PASSED] gpu_buddy ====================
[17:42:19] ============================================================
[17:42:19] Testing complete. Ran 18 tests: passed: 18
[17:42:19] Elapsed time: 27.264s total, 4.459s configuring, 20.737s building, 2.013s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[17:42:19] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:42:21] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:42:55] Starting KUnit Kernel (1/1)...
[17:42:55] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:42:55] ============= refcount_interrupt (4 subtests) ==============
[17:42:55] [PASSED] test_single_irq_change
[17:42:55] [PASSED] test_nested_irq_change
[17:42:55] [PASSED] test_multiple_irq_change
[17:42:55] [PASSED] test_irq_save
[17:42:55] =============== [PASSED] refcount_interrupt ================
[17:42:55] ================== guc_buf (11 subtests) ===================
[17:42:55] [PASSED] test_smallest
[17:42:55] [PASSED] test_largest
[17:42:55] [PASSED] test_granular
[17:42:55] [PASSED] test_unique
[17:42:55] [PASSED] test_overlap
[17:42:55] [PASSED] test_reusable
[17:42:55] [PASSED] test_too_big
[17:42:55] [PASSED] test_flush
[17:42:55] [PASSED] test_lookup
[17:42:55] [PASSED] test_data
[17:42:55] [PASSED] test_class
[17:42:55] ===================== [PASSED] guc_buf =====================
[17:42:55] =================== guc_dbm (7 subtests) ===================
[17:42:55] [PASSED] test_empty
[17:42:55] [PASSED] test_default
[17:42:55] ======================== test_size  ========================
[17:42:55] [PASSED] 4
[17:42:55] [PASSED] 8
[17:42:55] [PASSED] 32
[17:42:55] [PASSED] 256
[17:42:55] ==================== [PASSED] test_size ====================
[17:42:55] ======================= test_reuse  ========================
[17:42:55] [PASSED] 4
[17:42:55] [PASSED] 8
[17:42:55] [PASSED] 32
[17:42:55] [PASSED] 256
[17:42:55] =================== [PASSED] test_reuse ====================
[17:42:55] =================== test_range_overlap  ====================
[17:42:55] [PASSED] 4
[17:42:55] [PASSED] 8
[17:42:55] [PASSED] 32
[17:42:55] [PASSED] 256
[17:42:55] =============== [PASSED] test_range_overlap ================
[17:42:55] =================== test_range_compact  ====================
[17:42:55] [PASSED] 4
[17:42:55] [PASSED] 8
[17:42:55] [PASSED] 32
[17:42:55] [PASSED] 256
[17:42:55] =============== [PASSED] test_range_compact ================
[17:42:55] ==================== test_range_spare  =====================
[17:42:55] [PASSED] 4
[17:42:55] [PASSED] 8
[17:42:55] [PASSED] 32
[17:42:55] [PASSED] 256
[17:42:55] ================ [PASSED] test_range_spare =================
[17:42:55] ===================== [PASSED] guc_dbm =====================
[17:42:55] =================== guc_idm (6 subtests) ===================
[17:42:55] [PASSED] bad_init
[17:42:55] [PASSED] no_init
[17:42:55] [PASSED] init_fini
[17:42:55] [PASSED] check_used
[17:42:55] [PASSED] check_quota
[17:42:55] [PASSED] check_all
[17:42:55] ===================== [PASSED] guc_idm =====================
[17:42:55] =============== guc_klv_helpers (9 subtests) ===============
[17:42:55] [PASSED] test_count
[17:42:55] [PASSED] test_encode_u32
[17:42:55] [PASSED] test_encode_u64
[17:42:55] [PASSED] test_encode_string
[17:42:55] [PASSED] test_encode_object_raw
[17:42:55] [PASSED] test_encode_object_klv
[17:42:55] [PASSED] test_encode_object_nested
[17:42:55] [PASSED] test_encode_object_basic
[17:42:55] [PASSED] test_print
[17:42:55] ================= [PASSED] guc_klv_helpers =================
[17:42:55] =================== xe_log (4 subtests) ====================
[17:42:55] [PASSED] demo_cper
[17:42:55] [PASSED] demo_dmesg
[17:42:55] ======================= test_dmesg  ========================
[17:42:55] [PASSED] test_fatal
[17:42:55] [PASSED] test_fatal_tile
[17:42:55] [PASSED] test_fatal_gt
[17:42:55] [PASSED] test_fatal_comp
[17:42:55] [PASSED] test_fatal_comp_tile
[17:42:55] [PASSED] test_fatal_comp_gt
[17:42:55] [PASSED] test_fatal_all
[17:42:55] [PASSED] test_recoverable
[17:42:55] [PASSED] test_recoverable_tile
[17:42:55] [PASSED] test_recoverable_gt
[17:42:55] [PASSED] test_recoverable_comp
[17:42:55] [PASSED] test_recoverable_comp_tile
[17:42:55] [PASSED] test_recoverable_comp_gt
[17:42:55] [PASSED] test_recoverable_all
[17:42:55] [PASSED] test_info
[17:42:55] [PASSED] test_info_tile
[17:42:55] [PASSED] test_info_gt
[17:42:55] [PASSED] test_info_err
[17:42:55] [PASSED] test_info_comp
[17:42:55] [PASSED] test_info_comp_tile
[17:42:55] [PASSED] test_info_comp_gt
[17:42:55] [PASSED] test_info_all
[17:42:55] [PASSED] test_hw_fatal
[17:42:55] [PASSED] test_hw_recoverable
[17:42:55] [PASSED] test_hw_corrected
[17:42:55] [PASSED] test_hw_informational
[17:42:55] =================== [PASSED] test_dmesg ====================
[17:42:55] ====================== test_invalid  =======================
[17:42:55] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[17:42:55] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[17:42:55] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[17:42:55] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[17:42:55] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[17:42:55] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[17:42:55] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[17:42:55] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[17:42:55] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[17:42:55] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[17:42:55] ================== [SKIPPED] test_invalid ==================
[17:42:55] ===================== [PASSED] xe_log ======================
[17:42:55] ================== no_relay (3 subtests) ===================
[17:42:55] [PASSED] xe_drops_guc2pf_if_not_ready
[17:42:55] [PASSED] xe_drops_guc2vf_if_not_ready
[17:42:55] [PASSED] xe_rejects_send_if_not_ready
[17:42:55] ==================== [PASSED] no_relay =====================
[17:42:55] ================== pf_relay (14 subtests) ==================
[17:42:55] [PASSED] pf_rejects_guc2pf_too_short
[17:42:55] [PASSED] pf_rejects_guc2pf_too_long
[17:42:55] [PASSED] pf_rejects_guc2pf_no_payload
[17:42:55] [PASSED] pf_fails_no_payload
[17:42:55] [PASSED] pf_fails_bad_origin
[17:42:55] [PASSED] pf_fails_bad_type
[17:42:55] [PASSED] pf_txn_reports_error
[17:42:55] [PASSED] pf_txn_sends_pf2guc
[17:42:55] [PASSED] pf_sends_pf2guc
[17:42:55] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[17:42:55] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[17:42:55] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[17:42:55] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[17:42:55] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[17:42:55] ==================== [PASSED] pf_relay =====================
[17:42:55] ================== vf_relay (3 subtests) ===================
[17:42:55] [PASSED] vf_rejects_guc2vf_too_short
[17:42:55] [PASSED] vf_rejects_guc2vf_too_long
[17:42:55] [PASSED] vf_rejects_guc2vf_no_payload
[17:42:55] ==================== [PASSED] vf_relay =====================
[17:42:55] ================ pf_gt_config (9 subtests) =================
[17:42:55] [PASSED] fair_contexts_1vf
[17:42:55] [PASSED] fair_doorbells_1vf
[17:42:55] [PASSED] fair_ggtt_1vf
[17:42:55] ====================== fair_vram_1vf  ======================
[17:42:55] [PASSED] 3.50 GiB
[17:42:55] [PASSED] 11.5 GiB
[17:42:55] [PASSED] 15.5 GiB
[17:42:55] [PASSED] 31.5 GiB
[17:42:55] [PASSED] 63.5 GiB
[17:42:55] [PASSED] 1.91 GiB
[17:42:55] ================== [PASSED] fair_vram_1vf ==================
[17:42:55] ================ fair_vram_1vf_admin_only  =================
[17:42:55] [PASSED] 3.50 GiB
[17:42:55] [PASSED] 11.5 GiB
[17:42:55] [PASSED] 15.5 GiB
[17:42:55] [PASSED] 31.5 GiB
[17:42:55] [PASSED] 63.5 GiB
[17:42:55] [PASSED] 1.91 GiB
[17:42:55] ============ [PASSED] fair_vram_1vf_admin_only =============
[17:42:55] ====================== fair_contexts  ======================
[17:42:55] [PASSED] 1 VF
[17:42:55] [PASSED] 2 VFs
[17:42:55] [PASSED] 3 VFs
[17:42:55] [PASSED] 4 VFs
[17:42:55] [PASSED] 5 VFs
[17:42:55] [PASSED] 6 VFs
[17:42:55] [PASSED] 7 VFs
[17:42:55] [PASSED] 8 VFs
[17:42:55] [PASSED] 9 VFs
[17:42:55] [PASSED] 10 VFs
[17:42:55] [PASSED] 11 VFs
[17:42:55] [PASSED] 12 VFs
[17:42:55] [PASSED] 13 VFs
[17:42:55] [PASSED] 14 VFs
[17:42:55] [PASSED] 15 VFs
[17:42:55] [PASSED] 16 VFs
[17:42:55] [PASSED] 17 VFs
[17:42:55] [PASSED] 18 VFs
[17:42:55] [PASSED] 19 VFs
[17:42:55] [PASSED] 20 VFs
[17:42:55] [PASSED] 21 VFs
[17:42:55] [PASSED] 22 VFs
[17:42:55] [PASSED] 23 VFs
[17:42:55] [PASSED] 24 VFs
[17:42:55] [PASSED] 25 VFs
[17:42:55] [PASSED] 26 VFs
[17:42:55] [PASSED] 27 VFs
[17:42:55] [PASSED] 28 VFs
[17:42:55] [PASSED] 29 VFs
[17:42:55] [PASSED] 30 VFs
[17:42:55] [PASSED] 31 VFs
[17:42:55] [PASSED] 32 VFs
[17:42:55] [PASSED] 33 VFs
[17:42:55] [PASSED] 34 VFs
[17:42:55] [PASSED] 35 VFs
[17:42:55] [PASSED] 36 VFs
[17:42:55] [PASSED] 37 VFs
[17:42:55] [PASSED] 38 VFs
[17:42:55] [PASSED] 39 VFs
[17:42:55] [PASSED] 40 VFs
[17:42:55] [PASSED] 41 VFs
[17:42:55] [PASSED] 42 VFs
[17:42:55] [PASSED] 43 VFs
[17:42:55] [PASSED] 44 VFs
[17:42:55] [PASSED] 45 VFs
[17:42:55] [PASSED] 46 VFs
[17:42:55] [PASSED] 47 VFs
[17:42:55] [PASSED] 48 VFs
[17:42:55] [PASSED] 49 VFs
[17:42:55] [PASSED] 50 VFs
[17:42:55] [PASSED] 51 VFs
[17:42:55] [PASSED] 52 VFs
[17:42:55] [PASSED] 53 VFs
[17:42:55] [PASSED] 54 VFs
[17:42:55] [PASSED] 55 VFs
[17:42:55] [PASSED] 56 VFs
[17:42:55] [PASSED] 57 VFs
[17:42:55] [PASSED] 58 VFs
[17:42:55] [PASSED] 59 VFs
[17:42:55] [PASSED] 60 VFs
[17:42:55] [PASSED] 61 VFs
[17:42:55] [PASSED] 62 VFs
[17:42:55] [PASSED] 63 VFs
[17:42:55] ================== [PASSED] fair_contexts ==================
[17:42:55] ===================== fair_doorbells  ======================
[17:42:55] [PASSED] 1 VF
[17:42:55] [PASSED] 2 VFs
[17:42:55] [PASSED] 3 VFs
[17:42:55] [PASSED] 4 VFs
[17:42:55] [PASSED] 5 VFs
[17:42:55] [PASSED] 6 VFs
[17:42:55] [PASSED] 7 VFs
[17:42:55] [PASSED] 8 VFs
[17:42:55] [PASSED] 9 VFs
[17:42:55] [PASSED] 10 VFs
[17:42:55] [PASSED] 11 VFs
[17:42:55] [PASSED] 12 VFs
[17:42:55] [PASSED] 13 VFs
[17:42:55] [PASSED] 14 VFs
[17:42:55] [PASSED] 15 VFs
[17:42:55] [PASSED] 16 VFs
[17:42:55] [PASSED] 17 VFs
[17:42:55] [PASSED] 18 VFs
[17:42:55] [PASSED] 19 VFs
[17:42:55] [PASSED] 20 VFs
[17:42:55] [PASSED] 21 VFs
[17:42:55] [PASSED] 22 VFs
[17:42:55] [PASSED] 23 VFs
[17:42:55] [PASSED] 24 VFs
[17:42:55] [PASSED] 25 VFs
[17:42:55] [PASSED] 26 VFs
[17:42:55] [PASSED] 27 VFs
[17:42:55] [PASSED] 28 VFs
[17:42:55] [PASSED] 29 VFs
[17:42:55] [PASSED] 30 VFs
[17:42:55] [PASSED] 31 VFs
[17:42:55] [PASSED] 32 VFs
[17:42:55] [PASSED] 33 VFs
[17:42:55] [PASSED] 34 VFs
[17:42:55] [PASSED] 35 VFs
[17:42:55] [PASSED] 36 VFs
[17:42:55] [PASSED] 37 VFs
[17:42:55] [PASSED] 38 VFs
[17:42:55] [PASSED] 39 VFs
[17:42:55] [PASSED] 40 VFs
[17:42:55] [PASSED] 41 VFs
[17:42:55] [PASSED] 42 VFs
[17:42:55] [PASSED] 43 VFs
[17:42:55] [PASSED] 44 VFs
[17:42:55] [PASSED] 45 VFs
[17:42:55] [PASSED] 46 VFs
[17:42:55] [PASSED] 47 VFs
[17:42:55] [PASSED] 48 VFs
[17:42:55] [PASSED] 49 VFs
[17:42:55] [PASSED] 50 VFs
[17:42:55] [PASSED] 51 VFs
[17:42:55] [PASSED] 52 VFs
[17:42:55] [PASSED] 53 VFs
[17:42:55] [PASSED] 54 VFs
[17:42:55] [PASSED] 55 VFs
[17:42:55] [PASSED] 56 VFs
[17:42:55] [PASSED] 57 VFs
[17:42:55] [PASSED] 58 VFs
[17:42:55] [PASSED] 59 VFs
[17:42:55] [PASSED] 60 VFs
[17:42:55] [PASSED] 61 VFs
[17:42:55] [PASSED] 62 VFs
[17:42:55] [PASSED] 63 VFs
[17:42:55] ================= [PASSED] fair_doorbells ==================
[17:42:55] ======================== fair_ggtt  ========================
[17:42:55] [PASSED] 1 VF
[17:42:55] [PASSED] 2 VFs
[17:42:55] [PASSED] 3 VFs
[17:42:55] [PASSED] 4 VFs
[17:42:55] [PASSED] 5 VFs
[17:42:55] [PASSED] 6 VFs
[17:42:55] [PASSED] 7 VFs
[17:42:55] [PASSED] 8 VFs
[17:42:55] [PASSED] 9 VFs
[17:42:55] [PASSED] 10 VFs
[17:42:55] [PASSED] 11 VFs
[17:42:55] [PASSED] 12 VFs
[17:42:55] [PASSED] 13 VFs
[17:42:55] [PASSED] 14 VFs
[17:42:55] [PASSED] 15 VFs
[17:42:55] [PASSED] 16 VFs
[17:42:55] [PASSED] 17 VFs
[17:42:55] [PASSED] 18 VFs
[17:42:55] [PASSED] 19 VFs
[17:42:55] [PASSED] 20 VFs
[17:42:55] [PASSED] 21 VFs
[17:42:55] [PASSED] 22 VFs
[17:42:55] [PASSED] 23 VFs
[17:42:55] [PASSED] 24 VFs
[17:42:55] [PASSED] 25 VFs
[17:42:55] [PASSED] 26 VFs
[17:42:55] [PASSED] 27 VFs
[17:42:55] [PASSED] 28 VFs
[17:42:55] [PASSED] 29 VFs
[17:42:55] [PASSED] 30 VFs
[17:42:55] [PASSED] 31 VFs
[17:42:55] [PASSED] 32 VFs
[17:42:55] [PASSED] 33 VFs
[17:42:55] [PASSED] 34 VFs
[17:42:55] [PASSED] 35 VFs
[17:42:55] [PASSED] 36 VFs
[17:42:55] [PASSED] 37 VFs
[17:42:55] [PASSED] 38 VFs
[17:42:55] [PASSED] 39 VFs
[17:42:55] [PASSED] 40 VFs
[17:42:55] [PASSED] 41 VFs
[17:42:55] [PASSED] 42 VFs
[17:42:55] [PASSED] 43 VFs
[17:42:55] [PASSED] 44 VFs
[17:42:55] [PASSED] 45 VFs
[17:42:55] [PASSED] 46 VFs
[17:42:55] [PASSED] 47 VFs
[17:42:55] [PASSED] 48 VFs
[17:42:55] [PASSED] 49 VFs
[17:42:55] [PASSED] 50 VFs
[17:42:55] [PASSED] 51 VFs
[17:42:55] [PASSED] 52 VFs
[17:42:55] [PASSED] 53 VFs
[17:42:55] [PASSED] 54 VFs
[17:42:55] [PASSED] 55 VFs
[17:42:55] [PASSED] 56 VFs
[17:42:55] [PASSED] 57 VFs
[17:42:55] [PASSED] 58 VFs
[17:42:55] [PASSED] 59 VFs
[17:42:55] [PASSED] 60 VFs
[17:42:55] [PASSED] 61 VFs
[17:42:55] [PASSED] 62 VFs
[17:42:55] [PASSED] 63 VFs
[17:42:55] ==================== [PASSED] fair_ggtt ====================
[17:42:55] ======================== fair_vram  ========================
[17:42:55] [PASSED] 1 VF
[17:42:55] [PASSED] 2 VFs
[17:42:55] [PASSED] 3 VFs
[17:42:55] [PASSED] 4 VFs
[17:42:55] [PASSED] 5 VFs
[17:42:55] [PASSED] 6 VFs
[17:42:55] [PASSED] 7 VFs
[17:42:55] [PASSED] 8 VFs
[17:42:55] [PASSED] 9 VFs
[17:42:55] [PASSED] 10 VFs
[17:42:55] [PASSED] 11 VFs
[17:42:55] [PASSED] 12 VFs
[17:42:55] [PASSED] 13 VFs
[17:42:55] [PASSED] 14 VFs
[17:42:55] [PASSED] 15 VFs
[17:42:55] [PASSED] 16 VFs
[17:42:55] [PASSED] 17 VFs
[17:42:55] [PASSED] 18 VFs
[17:42:55] [PASSED] 19 VFs
[17:42:55] [PASSED] 20 VFs
[17:42:55] [PASSED] 21 VFs
[17:42:55] [PASSED] 22 VFs
[17:42:55] [PASSED] 23 VFs
[17:42:55] [PASSED] 24 VFs
[17:42:55] [PASSED] 25 VFs
[17:42:55] [PASSED] 26 VFs
[17:42:55] [PASSED] 27 VFs
[17:42:55] [PASSED] 28 VFs
[17:42:55] [PASSED] 29 VFs
[17:42:55] [PASSED] 30 VFs
[17:42:55] [PASSED] 31 VFs
[17:42:55] [PASSED] 32 VFs
[17:42:55] [PASSED] 33 VFs
[17:42:55] [PASSED] 34 VFs
[17:42:55] [PASSED] 35 VFs
[17:42:55] [PASSED] 36 VFs
[17:42:55] [PASSED] 37 VFs
[17:42:55] [PASSED] 38 VFs
[17:42:55] [PASSED] 39 VFs
[17:42:55] [PASSED] 40 VFs
[17:42:55] [PASSED] 41 VFs
[17:42:55] [PASSED] 42 VFs
[17:42:55] [PASSED] 43 VFs
[17:42:55] [PASSED] 44 VFs
[17:42:55] [PASSED] 45 VFs
[17:42:55] [PASSED] 46 VFs
[17:42:55] [PASSED] 47 VFs
[17:42:55] [PASSED] 48 VFs
[17:42:55] [PASSED] 49 VFs
[17:42:55] [PASSED] 50 VFs
[17:42:55] [PASSED] 51 VFs
[17:42:55] [PASSED] 52 VFs
[17:42:55] [PASSED] 53 VFs
[17:42:55] [PASSED] 54 VFs
[17:42:55] [PASSED] 55 VFs
[17:42:55] [PASSED] 56 VFs
[17:42:56] [PASSED] 57 VFs
[17:42:56] [PASSED] 58 VFs
[17:42:56] [PASSED] 59 VFs
[17:42:56] [PASSED] 60 VFs
[17:42:56] [PASSED] 61 VFs
[17:42:56] [PASSED] 62 VFs
[17:42:56] [PASSED] 63 VFs
[17:42:56] ==================== [PASSED] fair_vram ====================
[17:42:56] ================== [PASSED] pf_gt_config ===================
[17:42:56] ===================== lmtt (1 subtest) =====================
[17:42:56] ======================== test_ops  =========================
[17:42:56] [PASSED] 2-level
[17:42:56] [PASSED] multi-level
[17:42:56] ==================== [PASSED] test_ops =====================
[17:42:56] ====================== [PASSED] lmtt =======================
[17:42:56] ================= sriov_packet (1 subtest) =================
[17:42:56] [PASSED] test_descriptor_init
[17:42:56] ================== [PASSED] sriov_packet ===================
[17:42:56] ================= pf_service (11 subtests) =================
[17:42:56] [PASSED] pf_negotiate_any
[17:42:56] [PASSED] pf_negotiate_base_match
[17:42:56] [PASSED] pf_negotiate_base_newer
[17:42:56] [PASSED] pf_negotiate_base_next
[17:42:56] [SKIPPED] pf_negotiate_base_older (no older minor)
[17:42:56] [PASSED] pf_negotiate_base_prev
[17:42:56] [PASSED] pf_negotiate_latest_match
[17:42:56] [PASSED] pf_negotiate_latest_newer
[17:42:56] [PASSED] pf_negotiate_latest_next
[17:42:56] [SKIPPED] pf_negotiate_latest_older (no older minor)
[17:42:56] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[17:42:56] =================== [PASSED] pf_service ====================
[17:42:56] ================= xe_guc_g2g (2 subtests) ==================
[17:42:56] ============== xe_live_guc_g2g_kunit_default  ==============
[17:42:56] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[17:42:56] ============== xe_live_guc_g2g_kunit_allmem  ===============
[17:42:56] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[17:42:56] =================== [SKIPPED] xe_guc_g2g ===================
[17:42:56] =================== xe_mocs (2 subtests) ===================
[17:42:56] ================ xe_live_mocs_kernel_kunit  ================
[17:42:56] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[17:42:56] ================ xe_live_mocs_reset_kunit  =================
[17:42:56] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[17:42:56] ==================== [SKIPPED] xe_mocs =====================
[17:42:56] ================= xe_migrate (2 subtests) ==================
[17:42:56] ================= xe_migrate_sanity_kunit  =================
[17:42:56] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[17:42:56] ================== xe_validate_ccs_kunit  ==================
[17:42:56] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[17:42:56] =================== [SKIPPED] xe_migrate ===================
[17:42:56] ================== xe_dma_buf (1 subtest) ==================
[17:42:56] ==================== xe_dma_buf_kunit  =====================
[17:42:56] ================ [SKIPPED] xe_dma_buf_kunit ================
[17:42:56] =================== [SKIPPED] xe_dma_buf ===================
[17:42:56] ================= xe_bo_shrink (1 subtest) =================
[17:42:56] =================== xe_bo_shrink_kunit  ====================
[17:42:56] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[17:42:56] ================== [SKIPPED] xe_bo_shrink ==================
[17:42:56] ==================== xe_bo (2 subtests) ====================
[17:42:56] ================== xe_ccs_migrate_kunit  ===================
[17:42:56] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[17:42:56] ==================== xe_bo_evict_kunit  ====================
[17:42:56] =============== [SKIPPED] xe_bo_evict_kunit ================
[17:42:56] ===================== [SKIPPED] xe_bo ======================
[17:42:56] =================== xe_any (9 subtests) ====================
[17:42:56] [PASSED] test_to_xe
[17:42:56] [PASSED] test_to_dev
[17:42:56] [PASSED] test_to_pdev
[17:42:56] [PASSED] test_to_drm
[17:42:56] [PASSED] test_if_pdev
[17:42:56] [PASSED] test_if_xe
[17:42:56] [PASSED] test_if_tile
[17:42:56] [PASSED] test_if_gt
[17:42:56] [PASSED] test_to_id
[17:42:56] ===================== [PASSED] xe_any ======================
[17:42:56] ==================== args (13 subtests) ====================
[17:42:56] [PASSED] count_args_test
[17:42:56] [PASSED] call_args_example
[17:42:56] [PASSED] call_args_test
[17:42:56] [PASSED] drop_first_arg_example
[17:42:56] [PASSED] drop_first_arg_test
[17:42:56] [PASSED] first_arg_example
[17:42:56] [PASSED] first_arg_test
[17:42:56] [PASSED] last_arg_example
[17:42:56] [PASSED] last_arg_test
[17:42:56] [PASSED] pick_arg_example
[17:42:56] [PASSED] if_args_example
[17:42:56] [PASSED] if_args_test
[17:42:56] [PASSED] sep_comma_example
[17:42:56] ====================== [PASSED] args =======================
[17:42:56] =================== xe_pci (3 subtests) ====================
[17:42:56] ==================== check_graphics_ip  ====================
[17:42:56] [PASSED] 12.00 Xe_LP
[17:42:56] [PASSED] 12.10 Xe_LP+
[17:42:56] [PASSED] 12.55 Xe_HPG
[17:42:56] [PASSED] 12.60 Xe_HPC
[17:42:56] [PASSED] 12.70 Xe_LPG
[17:42:56] [PASSED] 12.71 Xe_LPG
[17:42:56] [PASSED] 12.74 Xe_LPG+
[17:42:56] [PASSED] 20.01 Xe2_HPG
[17:42:56] [PASSED] 20.02 Xe2_HPG
[17:42:56] [PASSED] 20.04 Xe2_LPG
[17:42:56] [PASSED] 30.00 Xe3_LPG
[17:42:56] [PASSED] 30.01 Xe3_LPG
[17:42:56] [PASSED] 30.03 Xe3_LPG
[17:42:56] [PASSED] 30.04 Xe3_LPG
[17:42:56] [PASSED] 30.05 Xe3_LPG
[17:42:56] [PASSED] 35.10 Xe3p_LPG
[17:42:56] [PASSED] 35.11 Xe3p_XPC
[17:42:56] ================ [PASSED] check_graphics_ip ================
[17:42:56] ===================== check_media_ip  ======================
[17:42:56] [PASSED] 12.00 Xe_M
[17:42:56] [PASSED] 12.55 Xe_HPM
[17:42:56] [PASSED] 13.00 Xe_LPM+
[17:42:56] [PASSED] 13.01 Xe2_HPM
[17:42:56] [PASSED] 20.00 Xe2_LPM
[17:42:56] [PASSED] 30.00 Xe3_LPM
[17:42:56] [PASSED] 30.02 Xe3_LPM
[17:42:56] [PASSED] 35.00 Xe3p_LPM
[17:42:56] [PASSED] 35.03 Xe3p_HPM
[17:42:56] ================= [PASSED] check_media_ip ==================
[17:42:56] =================== check_platform_desc  ===================
[17:42:56] [PASSED] 0x9A60 (TIGERLAKE)
[17:42:56] [PASSED] 0x9A68 (TIGERLAKE)
[17:42:56] [PASSED] 0x9A70 (TIGERLAKE)
[17:42:56] [PASSED] 0x9A40 (TIGERLAKE)
[17:42:56] [PASSED] 0x9A49 (TIGERLAKE)
[17:42:56] [PASSED] 0x9A59 (TIGERLAKE)
[17:42:56] [PASSED] 0x9A78 (TIGERLAKE)
[17:42:56] [PASSED] 0x9AC0 (TIGERLAKE)
[17:42:56] [PASSED] 0x9AC9 (TIGERLAKE)
[17:42:56] [PASSED] 0x9AD9 (TIGERLAKE)
[17:42:56] [PASSED] 0x9AF8 (TIGERLAKE)
[17:42:56] [PASSED] 0x4C80 (ROCKETLAKE)
[17:42:56] [PASSED] 0x4C8A (ROCKETLAKE)
[17:42:56] [PASSED] 0x4C8B (ROCKETLAKE)
[17:42:56] [PASSED] 0x4C8C (ROCKETLAKE)
[17:42:56] [PASSED] 0x4C90 (ROCKETLAKE)
[17:42:56] [PASSED] 0x4C9A (ROCKETLAKE)
[17:42:56] [PASSED] 0x4680 (ALDERLAKE_S)
[17:42:56] [PASSED] 0x4682 (ALDERLAKE_S)
[17:42:56] [PASSED] 0x4688 (ALDERLAKE_S)
[17:42:56] [PASSED] 0x468A (ALDERLAKE_S)
[17:42:56] [PASSED] 0x468B (ALDERLAKE_S)
[17:42:56] [PASSED] 0x4690 (ALDERLAKE_S)
[17:42:56] [PASSED] 0x4692 (ALDERLAKE_S)
[17:42:56] [PASSED] 0x4693 (ALDERLAKE_S)
[17:42:56] [PASSED] 0x46A0 (ALDERLAKE_P)
[17:42:56] [PASSED] 0x46A1 (ALDERLAKE_P)
[17:42:56] [PASSED] 0x46A2 (ALDERLAKE_P)
[17:42:56] [PASSED] 0x46A3 (ALDERLAKE_P)
[17:42:56] [PASSED] 0x46A6 (ALDERLAKE_P)
[17:42:56] [PASSED] 0x46A8 (ALDERLAKE_P)
[17:42:56] [PASSED] 0x46AA (ALDERLAKE_P)
[17:42:56] [PASSED] 0x462A (ALDERLAKE_P)
[17:42:56] [PASSED] 0x4626 (ALDERLAKE_P)
[17:42:56] [PASSED] 0x4628 (ALDERLAKE_P)
[17:42:56] [PASSED] 0x46B0 (ALDERLAKE_P)
[17:42:56] [PASSED] 0x46B1 (ALDERLAKE_P)
[17:42:56] [PASSED] 0x46B2 (ALDERLAKE_P)
[17:42:56] [PASSED] 0x46B3 (ALDERLAKE_P)
[17:42:56] [PASSED] 0x46C0 (ALDERLAKE_P)
[17:42:56] [PASSED] 0x46C1 (ALDERLAKE_P)
[17:42:56] [PASSED] 0x46C2 (ALDERLAKE_P)
[17:42:56] [PASSED] 0x46C3 (ALDERLAKE_P)
[17:42:56] [PASSED] 0x46D0 (ALDERLAKE_N)
[17:42:56] [PASSED] 0x46D1 (ALDERLAKE_N)
[17:42:56] [PASSED] 0x46D2 (ALDERLAKE_N)
[17:42:56] [PASSED] 0x46D3 (ALDERLAKE_N)
[17:42:56] [PASSED] 0x46D4 (ALDERLAKE_N)
[17:42:56] [PASSED] 0xA721 (ALDERLAKE_P)
[17:42:56] [PASSED] 0xA7A1 (ALDERLAKE_P)
[17:42:56] [PASSED] 0xA7A9 (ALDERLAKE_P)
[17:42:56] [PASSED] 0xA7AC (ALDERLAKE_P)
[17:42:56] [PASSED] 0xA7AD (ALDERLAKE_P)
[17:42:56] [PASSED] 0xA720 (ALDERLAKE_P)
[17:42:56] [PASSED] 0xA7A0 (ALDERLAKE_P)
[17:42:56] [PASSED] 0xA7A8 (ALDERLAKE_P)
[17:42:56] [PASSED] 0xA7AA (ALDERLAKE_P)
[17:42:56] [PASSED] 0xA7AB (ALDERLAKE_P)
[17:42:56] [PASSED] 0xA780 (ALDERLAKE_S)
[17:42:56] [PASSED] 0xA781 (ALDERLAKE_S)
[17:42:56] [PASSED] 0xA782 (ALDERLAKE_S)
[17:42:56] [PASSED] 0xA783 (ALDERLAKE_S)
[17:42:56] [PASSED] 0xA788 (ALDERLAKE_S)
[17:42:56] [PASSED] 0xA789 (ALDERLAKE_S)
[17:42:56] [PASSED] 0xA78A (ALDERLAKE_S)
[17:42:56] [PASSED] 0xA78B (ALDERLAKE_S)
[17:42:56] [PASSED] 0x4905 (DG1)
[17:42:56] [PASSED] 0x4906 (DG1)
[17:42:56] [PASSED] 0x4907 (DG1)
[17:42:56] [PASSED] 0x4908 (DG1)
[17:42:56] [PASSED] 0x4909 (DG1)
[17:42:56] [PASSED] 0x56C0 (DG2)
[17:42:56] [PASSED] 0x56C2 (DG2)
[17:42:56] [PASSED] 0x56C1 (DG2)
[17:42:56] [PASSED] 0x7D51 (METEORLAKE)
[17:42:56] [PASSED] 0x7DD1 (METEORLAKE)
[17:42:56] [PASSED] 0x7D41 (METEORLAKE)
[17:42:56] [PASSED] 0x7D67 (METEORLAKE)
[17:42:56] [PASSED] 0xB640 (METEORLAKE)
[17:42:56] [PASSED] 0x56A0 (DG2)
[17:42:56] [PASSED] 0x56A1 (DG2)
[17:42:56] [PASSED] 0x56A2 (DG2)
[17:42:56] [PASSED] 0x56BE (DG2)
[17:42:56] [PASSED] 0x56BF (DG2)
[17:42:56] [PASSED] 0x5690 (DG2)
[17:42:56] [PASSED] 0x5691 (DG2)
[17:42:56] [PASSED] 0x5692 (DG2)
[17:42:56] [PASSED] 0x56A5 (DG2)
[17:42:56] [PASSED] 0x56A6 (DG2)
[17:42:56] [PASSED] 0x56B0 (DG2)
[17:42:56] [PASSED] 0x56B1 (DG2)
[17:42:56] [PASSED] 0x56BA (DG2)
[17:42:56] [PASSED] 0x56BB (DG2)
[17:42:56] [PASSED] 0x56BC (DG2)
[17:42:56] [PASSED] 0x56BD (DG2)
[17:42:56] [PASSED] 0x5693 (DG2)
[17:42:56] [PASSED] 0x5694 (DG2)
[17:42:56] [PASSED] 0x5695 (DG2)
[17:42:56] [PASSED] 0x56A3 (DG2)
[17:42:56] [PASSED] 0x56A4 (DG2)
[17:42:56] [PASSED] 0x56B2 (DG2)
[17:42:56] [PASSED] 0x56B3 (DG2)
[17:42:56] [PASSED] 0x5696 (DG2)
[17:42:56] [PASSED] 0x5697 (DG2)
[17:42:56] [PASSED] 0xB69 (PVC)
[17:42:56] [PASSED] 0xB6E (PVC)
[17:42:56] [PASSED] 0xBD4 (PVC)
[17:42:56] [PASSED] 0xBD5 (PVC)
[17:42:56] [PASSED] 0xBD6 (PVC)
[17:42:56] [PASSED] 0xBD7 (PVC)
[17:42:56] [PASSED] 0xBD8 (PVC)
[17:42:56] [PASSED] 0xBD9 (PVC)
[17:42:56] [PASSED] 0xBDA (PVC)
[17:42:56] [PASSED] 0xBDB (PVC)
[17:42:56] [PASSED] 0xBE0 (PVC)
[17:42:56] [PASSED] 0xBE1 (PVC)
[17:42:56] [PASSED] 0xBE5 (PVC)
[17:42:56] [PASSED] 0x7D40 (METEORLAKE)
[17:42:56] [PASSED] 0x7D45 (METEORLAKE)
[17:42:56] [PASSED] 0x7D55 (METEORLAKE)
[17:42:56] [PASSED] 0x7D60 (METEORLAKE)
[17:42:56] [PASSED] 0x7DD5 (METEORLAKE)
[17:42:56] [PASSED] 0x6420 (LUNARLAKE)
[17:42:56] [PASSED] 0x64A0 (LUNARLAKE)
[17:42:56] [PASSED] 0x64B0 (LUNARLAKE)
[17:42:56] [PASSED] 0xE202 (BATTLEMAGE)
[17:42:56] [PASSED] 0xE209 (BATTLEMAGE)
[17:42:56] [PASSED] 0xE20B (BATTLEMAGE)
[17:42:56] [PASSED] 0xE20C (BATTLEMAGE)
[17:42:56] [PASSED] 0xE20D (BATTLEMAGE)
[17:42:56] [PASSED] 0xE210 (BATTLEMAGE)
[17:42:56] [PASSED] 0xE211 (BATTLEMAGE)
[17:42:56] [PASSED] 0xE212 (BATTLEMAGE)
[17:42:56] [PASSED] 0xE216 (BATTLEMAGE)
[17:42:56] [PASSED] 0xE220 (BATTLEMAGE)
[17:42:56] [PASSED] 0xE221 (BATTLEMAGE)
[17:42:56] [PASSED] 0xE222 (BATTLEMAGE)
[17:42:56] [PASSED] 0xE223 (BATTLEMAGE)
[17:42:56] [PASSED] 0xB080 (PANTHERLAKE)
[17:42:56] [PASSED] 0xB081 (PANTHERLAKE)
[17:42:56] [PASSED] 0xB082 (PANTHERLAKE)
[17:42:56] [PASSED] 0xB083 (PANTHERLAKE)
[17:42:56] [PASSED] 0xB084 (PANTHERLAKE)
[17:42:56] [PASSED] 0xB085 (PANTHERLAKE)
[17:42:56] [PASSED] 0xB086 (PANTHERLAKE)
[17:42:56] [PASSED] 0xB087 (PANTHERLAKE)
[17:42:56] [PASSED] 0xB08F (PANTHERLAKE)
[17:42:56] [PASSED] 0xB090 (PANTHERLAKE)
[17:42:56] [PASSED] 0xB0A0 (PANTHERLAKE)
[17:42:56] [PASSED] 0xB0B0 (PANTHERLAKE)
[17:42:56] [PASSED] 0xFD80 (PANTHERLAKE)
[17:42:56] [PASSED] 0xFD81 (PANTHERLAKE)
[17:42:56] [PASSED] 0xD740 (NOVALAKE_S)
[17:42:56] [PASSED] 0xD741 (NOVALAKE_S)
[17:42:56] [PASSED] 0xD742 (NOVALAKE_S)
[17:42:56] [PASSED] 0xD743 (NOVALAKE_S)
[17:42:56] [PASSED] 0xD745 (NOVALAKE_S)
[17:42:56] [PASSED] 0xD74A (NOVALAKE_S)
[17:42:56] [PASSED] 0xD74B (NOVALAKE_S)
[17:42:56] [PASSED] 0x674C (CRESCENTISLAND)
[17:42:56] [PASSED] 0x674D (CRESCENTISLAND)
[17:42:56] [PASSED] 0x674E (CRESCENTISLAND)
[17:42:56] [PASSED] 0x674F (CRESCENTISLAND)
[17:42:56] [PASSED] 0x6750 (CRESCENTISLAND)
[17:42:56] [PASSED] 0xD750 (NOVALAKE_P)
[17:42:56] [PASSED] 0xD751 (NOVALAKE_P)
[17:42:56] [PASSED] 0xD752 (NOVALAKE_P)
[17:42:56] [PASSED] 0xD753 (NOVALAKE_P)
[17:42:56] [PASSED] 0xD754 (NOVALAKE_P)
[17:42:56] [PASSED] 0xD755 (NOVALAKE_P)
[17:42:56] [PASSED] 0xD756 (NOVALAKE_P)
[17:42:56] [PASSED] 0xD757 (NOVALAKE_P)
[17:42:56] [PASSED] 0xD75F (NOVALAKE_P)
[17:42:56] =============== [PASSED] check_platform_desc ===============
[17:42:56] ===================== [PASSED] xe_pci ======================
[17:42:56] ============= xe_rtp_tables_test (5 subtests) ==============
[17:42:56] ================== xe_rtp_table_gt_test  ===================
[17:42:56] [PASSED] gt_was/14011060649
[17:42:56] [PASSED] gt_was/14011059788
[17:42:56] [PASSED] gt_was/14015795083
[17:42:56] [PASSED] gt_was/16021867713
[17:42:56] [PASSED] gt_was/14019449301
[17:42:56] [PASSED] gt_was/16028005424
[17:42:56] [PASSED] gt_was/14026578760
[17:42:56] [PASSED] gt_was/1409420604
[17:42:56] [PASSED] gt_was/1408615072
[17:42:56] [PASSED] gt_was/22010523718
[17:42:56] [PASSED] gt_was/14011006942
[17:42:56] [PASSED] gt_was/14014830051
[17:42:56] [PASSED] gt_was/18018781329
[17:42:56] [PASSED] gt_was/1509235366
[17:42:56] [PASSED] gt_was/18018781329
[17:42:56] [PASSED] gt_was/16016694945
[17:42:56] [PASSED] gt_was/14018575942
[17:42:56] [PASSED] gt_was/22016670082
[17:42:56] [PASSED] gt_was/22016670082
[17:42:56] [PASSED] gt_was/14017421178
[17:42:56] [PASSED] gt_was/16025250150
[17:42:56] [PASSED] gt_was/14021871409
[17:42:56] [PASSED] gt_was/16021865536
[17:42:56] [PASSED] gt_was/14021486841
[17:42:56] [PASSED] gt_was/14025160223
[17:42:56] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[17:42:56] [PASSED] gt_was/14025635424
[17:42:56] [PASSED] gt_was/16028005424
[17:42:56] ============== [PASSED] xe_rtp_table_gt_test ===============
[17:42:56] ================== xe_rtp_table_gt_test  ===================
[17:42:56] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[17:42:56] [PASSED] gt_tunings/Tuning: 32B Access Enable
[17:42:56] [PASSED] gt_tunings/Tuning: L3 cache
[17:42:56] [PASSED] gt_tunings/Tuning: L3 cache - media
[17:42:56] [PASSED] gt_tunings/Tuning: Compression Overfetch
[17:42:56] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[17:42:56] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[17:42:56] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[17:42:56] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[17:42:56] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[17:42:56] [PASSED] gt_tunings/Tuning: Stateless compression control
[17:42:56] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[17:42:56] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[17:42:56] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[17:42:56] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[17:42:56] ============== [PASSED] xe_rtp_table_gt_test ===============
[17:42:56] ================== xe_rtp_table_oob_test  ==================
[17:42:56] [PASSED] oob_was/1607983814
[17:42:56] [PASSED] oob_was/16010904313
[17:42:56] [PASSED] oob_was/18022495364
[17:42:56] [PASSED] oob_was/22012773006
[17:42:56] [PASSED] oob_was/14014475959
[17:42:56] [PASSED] oob_was/22011391025
[17:42:56] [PASSED] oob_was/22012727170
[17:42:56] [PASSED] oob_was/22012727685
[17:42:56] [PASSED] oob_was/22016596838
[17:42:56] [PASSED] oob_was/18020744125
[17:42:56] [PASSED] oob_was/1409600907
[17:42:56] [PASSED] oob_was/22014953428
[17:42:56] [PASSED] oob_was/16017236439
[17:42:56] [PASSED] oob_was/14019821291
[17:42:56] [PASSED] oob_was/14015076503
[17:42:56] [PASSED] oob_was/14018913170
[17:42:56] [PASSED] oob_was/14018094691
[17:42:56] [PASSED] oob_was/18024947630
[17:42:56] [PASSED] oob_was/16022287689
[17:42:56] [PASSED] oob_was/13011645652
[17:42:56] [PASSED] oob_was/14022293748
[17:42:56] [PASSED] oob_was/22019794406
[17:42:56] [PASSED] oob_was/22019338487
[17:42:56] [PASSED] oob_was/16023588340
[17:42:56] [PASSED] oob_was/14019789679
[17:42:56] [PASSED] oob_was/14022866841
[17:42:56] [PASSED] oob_was/16021333562
[17:42:56] [PASSED] oob_was/14016712196
[17:42:56] [PASSED] oob_was/14015568240
[17:42:56] [PASSED] oob_was/18013179988
[17:42:56] [PASSED] oob_was/1508761755
[17:42:56] [PASSED] oob_was/16023105232
[17:42:56] [PASSED] oob_was/16026508708
[17:42:56] [PASSED] oob_was/14020001231
[17:42:56] [PASSED] oob_was/16023683509
[17:42:56] [PASSED] oob_was/14025515070
[17:42:56] [PASSED] oob_was/15015404425_disable
[17:42:56] [PASSED] oob_was/16026007364
[17:42:56] [PASSED] oob_was/14020316580
[17:42:56] [PASSED] oob_was/14025883347
[17:42:56] [PASSED] oob_was/16029380221
[17:42:56] [PASSED] oob_was/22022079272
[17:42:56] [PASSED] oob_was/16029897822
[17:42:56] [PASSED] oob_was/14027054324
[17:42:56] ============== [PASSED] xe_rtp_table_oob_test ==============
[17:42:56] ================ xe_rtp_table_dev_oob_test  ================
[17:42:56] [PASSED] device_oob_was/22010954014
[17:42:56] [PASSED] device_oob_was/15015404425
[17:42:56] [PASSED] device_oob_was/22019338487_display
[17:42:56] [PASSED] device_oob_was/14022085890
[17:42:56] [PASSED] device_oob_was/14026539277
[17:42:56] [PASSED] device_oob_was/14026633728
[17:42:56] [PASSED] device_oob_was/14026746987
[17:42:56] [PASSED] device_oob_was/14026779378
[17:42:56] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[17:42:56] ========== xe_rtp_table_missing_upper_bound_test  ==========
[17:42:56] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[17:42:56] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[17:42:56] [PASSED] register_whitelist/1806527549
[17:42:56] [PASSED] register_whitelist/allow_read_ctx_timestamp
[17:42:56] [PASSED] register_whitelist/allow_read_queue_timestamp
[17:42:56] [PASSED] register_whitelist/16014440446
[17:42:56] [PASSED] register_whitelist/16017236439
[17:42:56] [PASSED] register_whitelist/16020183090
[17:42:56] [PASSED] register_whitelist/14024997852
[17:42:56] [PASSED] register_whitelist/14024997852
[17:42:56] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[17:42:56] =============== [PASSED] xe_rtp_tables_test ================
[17:42:56] =================== xe_rtp (3 subtests) ====================
[17:42:56] =================== xe_rtp_rules_tests  ====================
[17:42:56] [PASSED] no
[17:42:56] [PASSED] yes
[17:42:56] [PASSED] no-and-no
[17:42:56] [PASSED] no-and-yes
[17:42:56] [PASSED] yes-and-no
[17:42:56] [PASSED] yes-and-yes
[17:42:56] [PASSED] no-or-no
[17:42:56] [PASSED] no-or-yes
[17:42:56] [PASSED] yes-or-no
[17:42:56] [PASSED] yes-or-yes
[17:42:56] [PASSED] no-yes-or-yes-no
[17:42:56] [PASSED] no-yes-or-yes-yes
[17:42:56] [PASSED] yes-yes-or-no-yes
[17:42:56] [PASSED] yes-yes-or-yes-yes
[17:42:56] [PASSED] no-no-or-yes-or-no
[17:42:56] [PASSED] or
[17:42:56] [PASSED] or-yes
[17:42:56] [PASSED] or-no
[17:42:56] [PASSED] yes-or
[17:42:56] [PASSED] no-or
[17:42:56] [PASSED] no-or-or-yes
[17:42:56] [PASSED] yes-or-or-no
[17:42:56] [PASSED] no-or-or-no
[17:42:56] [PASSED] missing-context-engine-class
[17:42:56] [PASSED] missing-context-engine-class-or-yes
[17:42:56] [PASSED] missing-context-engine-class-or-or-yes
[17:42:56] =============== [PASSED] xe_rtp_rules_tests ================
[17:42:56] =============== xe_rtp_process_to_sr_tests  ================
[17:42:56] [PASSED] coalesce-same-reg
[17:42:56] [PASSED] coalesce-same-reg-literal-and-func
[17:42:56] [PASSED] no-match-no-add
[17:42:56] [PASSED] two-regs-two-entries
[17:42:56] [PASSED] clr-one-set-other
[17:42:56] [PASSED] set-field
[17:42:56] [PASSED] conflict-duplicate
[17:42:56] [PASSED] conflict-not-disjoint
[17:42:56] [PASSED] conflict-not-disjoint-literal-and-func
[17:42:56] [PASSED] conflict-reg-type
[17:42:56] [PASSED] bad-mcr-reg-forced-to-regular
[17:42:56] [PASSED] bad-regular-reg-forced-to-mcr
[17:42:56] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[17:42:56] ================== xe_rtp_process_tests  ===================
[17:42:56] [PASSED] active1
[17:42:56] [PASSED] active2
[17:42:56] [PASSED] active-inactive
[17:42:56] [PASSED] inactive-active
[17:42:56] [PASSED] inactive-active-inactive
[17:42:56] [PASSED] inactive-inactive-inactive
[17:42:56] ============== [PASSED] xe_rtp_process_tests ===============
[17:42:56] ===================== [PASSED] xe_rtp ======================
[17:42:56] ==================== xe_wa (1 subtest) =====================
[17:42:56] ======================== xe_wa_gt  =========================
[17:42:56] [PASSED] TIGERLAKE B0
[17:42:56] [PASSED] DG1 A0
[17:42:56] [PASSED] DG1 B0
[17:42:56] [PASSED] ALDERLAKE_S A0
[17:42:56] [PASSED] ALDERLAKE_S B0
[17:42:56] [PASSED] ALDERLAKE_S C0
[17:42:56] [PASSED] ALDERLAKE_S D0
[17:42:56] [PASSED] ALDERLAKE_P A0
[17:42:56] [PASSED] ALDERLAKE_P B0
[17:42:56] [PASSED] ALDERLAKE_P C0
[17:42:56] [PASSED] ALDERLAKE_S RPLS D0
[17:42:56] [PASSED] ALDERLAKE_P RPLU E0
[17:42:56] [PASSED] DG2 G10 C0
[17:42:56] [PASSED] DG2 G11 B1
[17:42:56] [PASSED] DG2 G12 A1
[17:42:56] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[17:42:56] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[17:42:56] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[17:42:56] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[17:42:56] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[17:42:56] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[17:42:56] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[17:42:56] ==================== [PASSED] xe_wa_gt =====================
[17:42:56] ====================== [PASSED] xe_wa ======================
[17:42:56] ============================================================
[17:42:56] Testing complete. Ran 793 tests: passed: 765, skipped: 28
[17:42:56] Elapsed time: 36.840s total, 1.784s configuring, 34.341s building, 0.691s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[17:42:56] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:42:58] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:43:23] Starting KUnit Kernel (1/1)...
[17:43:23] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:43:23] ============= refcount_interrupt (4 subtests) ==============
[17:43:23] [PASSED] test_single_irq_change
[17:43:23] [PASSED] test_nested_irq_change
[17:43:23] [PASSED] test_multiple_irq_change
[17:43:23] [PASSED] test_irq_save
[17:43:23] =============== [PASSED] refcount_interrupt ================
[17:43:23] ============ drm_test_pick_cmdline (2 subtests) ============
[17:43:23] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[17:43:23] =============== drm_test_pick_cmdline_named  ===============
[17:43:23] [PASSED] NTSC
[17:43:23] [PASSED] NTSC-J
[17:43:23] [PASSED] PAL
[17:43:23] [PASSED] PAL-M
[17:43:23] =========== [PASSED] drm_test_pick_cmdline_named ===========
[17:43:23] ============== [PASSED] drm_test_pick_cmdline ==============
[17:43:23] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[17:43:23] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[17:43:23] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[17:43:23] =========== drm_validate_clone_mode (2 subtests) ===========
[17:43:23] ============== drm_test_check_in_clone_mode  ===============
[17:43:23] [PASSED] in_clone_mode
[17:43:23] [PASSED] not_in_clone_mode
[17:43:23] ========== [PASSED] drm_test_check_in_clone_mode ===========
[17:43:23] =============== drm_test_check_valid_clones  ===============
[17:43:23] [PASSED] not_in_clone_mode
[17:43:23] [PASSED] valid_clone
[17:43:23] [PASSED] invalid_clone
[17:43:23] =========== [PASSED] drm_test_check_valid_clones ===========
[17:43:23] ============= [PASSED] drm_validate_clone_mode =============
[17:43:23] ============= drm_validate_modeset (1 subtest) =============
[17:43:23] [PASSED] drm_test_check_connector_changed_modeset
[17:43:23] ============== [PASSED] drm_validate_modeset ===============
[17:43:23] ====== drm_test_bridge_get_current_state (1 subtest) =======
[17:43:23] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[17:43:23] ======== [PASSED] drm_test_bridge_get_current_state ========
[17:43:23] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[17:43:23] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[17:43:23] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[17:43:23] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[17:43:23] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[17:43:23] ============== drm_bridge_alloc (2 subtests) ===============
[17:43:23] [PASSED] drm_test_drm_bridge_alloc_basic
[17:43:23] [PASSED] drm_test_drm_bridge_alloc_get_put
[17:43:23] ================ [PASSED] drm_bridge_alloc =================
[17:43:23] ============= drm_bridge_bus_fmt (5 subtests) ==============
[17:43:23] [PASSED] drm_test_bridge_rgb_yuv_rgb
[17:43:23] [PASSED] drm_test_bridge_must_convert_to_yuv444
[17:43:23] [PASSED] drm_test_bridge_hdmi_auto_rgb
[17:43:23] [PASSED] drm_test_bridge_auto_first
[17:43:23] [PASSED] drm_test_bridge_rgb_yuv_no_path
[17:43:23] =============== [PASSED] drm_bridge_bus_fmt ================
[17:43:23] ============= drm_cmdline_parser (40 subtests) =============
[17:43:23] [PASSED] drm_test_cmdline_force_d_only
[17:43:23] [PASSED] drm_test_cmdline_force_D_only_dvi
[17:43:23] [PASSED] drm_test_cmdline_force_D_only_hdmi
[17:43:23] [PASSED] drm_test_cmdline_force_D_only_not_digital
[17:43:23] [PASSED] drm_test_cmdline_force_e_only
[17:43:23] [PASSED] drm_test_cmdline_res
[17:43:23] [PASSED] drm_test_cmdline_res_vesa
[17:43:23] [PASSED] drm_test_cmdline_res_vesa_rblank
[17:43:23] [PASSED] drm_test_cmdline_res_rblank
[17:43:23] [PASSED] drm_test_cmdline_res_bpp
[17:43:23] [PASSED] drm_test_cmdline_res_refresh
[17:43:23] [PASSED] drm_test_cmdline_res_bpp_refresh
[17:43:23] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[17:43:23] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[17:43:23] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[17:43:23] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[17:43:23] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[17:43:23] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[17:43:23] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[17:43:23] [PASSED] drm_test_cmdline_res_margins_force_on
[17:43:23] [PASSED] drm_test_cmdline_res_vesa_margins
[17:43:23] [PASSED] drm_test_cmdline_name
[17:43:23] [PASSED] drm_test_cmdline_name_bpp
[17:43:23] [PASSED] drm_test_cmdline_name_option
[17:43:23] [PASSED] drm_test_cmdline_name_bpp_option
[17:43:23] [PASSED] drm_test_cmdline_rotate_0
[17:43:23] [PASSED] drm_test_cmdline_rotate_90
[17:43:23] [PASSED] drm_test_cmdline_rotate_180
[17:43:23] [PASSED] drm_test_cmdline_rotate_270
[17:43:23] [PASSED] drm_test_cmdline_hmirror
[17:43:23] [PASSED] drm_test_cmdline_vmirror
[17:43:23] [PASSED] drm_test_cmdline_margin_options
[17:43:23] [PASSED] drm_test_cmdline_multiple_options
[17:43:23] [PASSED] drm_test_cmdline_bpp_extra_and_option
[17:43:23] [PASSED] drm_test_cmdline_extra_and_option
[17:43:23] [PASSED] drm_test_cmdline_freestanding_options
[17:43:23] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[17:43:23] [PASSED] drm_test_cmdline_panel_orientation
[17:43:23] ================ drm_test_cmdline_invalid  =================
[17:43:23] [PASSED] margin_only
[17:43:23] [PASSED] interlace_only
[17:43:23] [PASSED] res_missing_x
[17:43:23] [PASSED] res_missing_y
[17:43:23] [PASSED] res_bad_y
[17:43:23] [PASSED] res_missing_y_bpp
[17:43:23] [PASSED] res_bad_bpp
[17:43:23] [PASSED] res_bad_refresh
[17:43:23] [PASSED] res_bpp_refresh_force_on_off
[17:43:23] [PASSED] res_invalid_mode
[17:43:23] [PASSED] res_bpp_wrong_place_mode
[17:43:23] [PASSED] name_bpp_refresh
[17:43:23] [PASSED] name_refresh
[17:43:23] [PASSED] name_refresh_wrong_mode
[17:43:23] [PASSED] name_refresh_invalid_mode
[17:43:23] [PASSED] rotate_multiple
[17:43:23] [PASSED] rotate_invalid_val
[17:43:23] [PASSED] rotate_truncated
[17:43:23] [PASSED] invalid_option
[17:43:23] [PASSED] invalid_tv_option
[17:43:23] [PASSED] truncated_tv_option
[17:43:23] ============ [PASSED] drm_test_cmdline_invalid =============
[17:43:23] =============== drm_test_cmdline_tv_options  ===============
[17:43:23] [PASSED] NTSC
[17:43:23] [PASSED] NTSC_443
[17:43:23] [PASSED] NTSC_J
[17:43:23] [PASSED] PAL
[17:43:23] [PASSED] PAL_M
[17:43:23] [PASSED] PAL_N
[17:43:23] [PASSED] SECAM
[17:43:23] [PASSED] MONO_525
[17:43:23] [PASSED] MONO_625
[17:43:23] =========== [PASSED] drm_test_cmdline_tv_options ===========
[17:43:23] =============== [PASSED] drm_cmdline_parser ================
[17:43:23] ========== drmm_connector_hdmi_init (20 subtests) ==========
[17:43:23] [PASSED] drm_test_connector_hdmi_init_valid
[17:43:23] [PASSED] drm_test_connector_hdmi_init_bpc_8
[17:43:23] [PASSED] drm_test_connector_hdmi_init_bpc_10
[17:43:23] [PASSED] drm_test_connector_hdmi_init_bpc_12
[17:43:23] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[17:43:23] [PASSED] drm_test_connector_hdmi_init_bpc_null
[17:43:23] [PASSED] drm_test_connector_hdmi_init_formats_empty
[17:43:23] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[17:43:23] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[17:43:23] [PASSED] supported_formats=0x9 yuv420_allowed=1
[17:43:23] [PASSED] supported_formats=0x9 yuv420_allowed=0
[17:43:23] [PASSED] supported_formats=0x5 yuv420_allowed=1
[17:43:23] [PASSED] supported_formats=0x5 yuv420_allowed=0
[17:43:23] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[17:43:23] [PASSED] drm_test_connector_hdmi_init_null_ddc
[17:43:23] [PASSED] drm_test_connector_hdmi_init_null_product
[17:43:23] [PASSED] drm_test_connector_hdmi_init_null_vendor
[17:43:23] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[17:43:23] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[17:43:23] [PASSED] drm_test_connector_hdmi_init_product_valid
[17:43:23] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[17:43:23] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[17:43:23] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[17:43:23] ========= drm_test_connector_hdmi_init_type_valid  =========
[17:43:23] [PASSED] HDMI-A
[17:43:23] [PASSED] HDMI-B
[17:43:23] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[17:43:23] ======== drm_test_connector_hdmi_init_type_invalid  ========
[17:43:23] [PASSED] Unknown
[17:43:23] [PASSED] VGA
[17:43:23] [PASSED] DVI-I
[17:43:23] [PASSED] DVI-D
[17:43:23] [PASSED] DVI-A
[17:43:23] [PASSED] Composite
[17:43:23] [PASSED] SVIDEO
[17:43:23] [PASSED] LVDS
[17:43:23] [PASSED] Component
[17:43:23] [PASSED] DIN
[17:43:23] [PASSED] DP
[17:43:23] [PASSED] TV
[17:43:23] [PASSED] eDP
[17:43:23] [PASSED] Virtual
[17:43:23] [PASSED] DSI
[17:43:23] [PASSED] DPI
[17:43:23] [PASSED] Writeback
[17:43:23] [PASSED] SPI
[17:43:23] [PASSED] USB
[17:43:23] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[17:43:23] ============ [PASSED] drmm_connector_hdmi_init =============
[17:43:23] ============= drmm_connector_init (3 subtests) =============
[17:43:23] [PASSED] drm_test_drmm_connector_init
[17:43:23] [PASSED] drm_test_drmm_connector_init_null_ddc
[17:43:23] ========= drm_test_drmm_connector_init_type_valid  =========
[17:43:23] [PASSED] Unknown
[17:43:23] [PASSED] VGA
[17:43:23] [PASSED] DVI-I
[17:43:23] [PASSED] DVI-D
[17:43:23] [PASSED] DVI-A
[17:43:23] [PASSED] Composite
[17:43:23] [PASSED] SVIDEO
[17:43:23] [PASSED] LVDS
[17:43:23] [PASSED] Component
[17:43:23] [PASSED] DIN
[17:43:23] [PASSED] DP
[17:43:23] [PASSED] HDMI-A
[17:43:23] [PASSED] HDMI-B
[17:43:23] [PASSED] TV
[17:43:23] [PASSED] eDP
[17:43:23] [PASSED] Virtual
[17:43:23] [PASSED] DSI
[17:43:23] [PASSED] DPI
[17:43:23] [PASSED] Writeback
[17:43:23] [PASSED] SPI
[17:43:23] [PASSED] USB
[17:43:23] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[17:43:23] =============== [PASSED] drmm_connector_init ===============
[17:43:23] ========= drm_connector_dynamic_init (6 subtests) ==========
[17:43:23] [PASSED] drm_test_drm_connector_dynamic_init
[17:43:23] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[17:43:23] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[17:43:23] [PASSED] drm_test_drm_connector_dynamic_init_properties
[17:43:23] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[17:43:23] [PASSED] Unknown
[17:43:23] [PASSED] VGA
[17:43:23] [PASSED] DVI-I
[17:43:23] [PASSED] DVI-D
[17:43:23] [PASSED] DVI-A
[17:43:23] [PASSED] Composite
[17:43:23] [PASSED] SVIDEO
[17:43:23] [PASSED] LVDS
[17:43:23] [PASSED] Component
[17:43:23] [PASSED] DIN
[17:43:23] [PASSED] DP
[17:43:23] [PASSED] HDMI-A
[17:43:23] [PASSED] HDMI-B
[17:43:23] [PASSED] TV
[17:43:23] [PASSED] eDP
[17:43:23] [PASSED] Virtual
[17:43:23] [PASSED] DSI
[17:43:23] [PASSED] DPI
[17:43:23] [PASSED] Writeback
[17:43:23] [PASSED] SPI
[17:43:23] [PASSED] USB
[17:43:23] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[17:43:23] ======== drm_test_drm_connector_dynamic_init_name  =========
[17:43:23] [PASSED] Unknown
[17:43:23] [PASSED] VGA
[17:43:23] [PASSED] DVI-I
[17:43:23] [PASSED] DVI-D
[17:43:23] [PASSED] DVI-A
[17:43:23] [PASSED] Composite
[17:43:23] [PASSED] SVIDEO
[17:43:23] [PASSED] LVDS
[17:43:23] [PASSED] Component
[17:43:23] [PASSED] DIN
[17:43:23] [PASSED] DP
[17:43:23] [PASSED] HDMI-A
[17:43:23] [PASSED] HDMI-B
[17:43:23] [PASSED] TV
[17:43:23] [PASSED] eDP
[17:43:23] [PASSED] Virtual
[17:43:23] [PASSED] DSI
[17:43:23] [PASSED] DPI
[17:43:23] [PASSED] Writeback
[17:43:23] [PASSED] SPI
[17:43:23] [PASSED] USB
[17:43:23] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[17:43:23] =========== [PASSED] drm_connector_dynamic_init ============
[17:43:23] ==== drm_connector_dynamic_register_early (4 subtests) =====
[17:43:23] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[17:43:23] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[17:43:23] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[17:43:23] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[17:43:23] ====== [PASSED] drm_connector_dynamic_register_early =======
[17:43:23] ======= drm_connector_dynamic_register (7 subtests) ========
[17:43:23] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[17:43:23] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[17:43:23] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[17:43:23] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[17:43:23] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[17:43:23] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[17:43:23] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[17:43:23] ========= [PASSED] drm_connector_dynamic_register ==========
[17:43:23] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[17:43:23] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[17:43:23] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[17:43:23] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[17:43:23] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[17:43:23] ========== drm_test_get_tv_mode_from_name_valid  ===========
[17:43:23] [PASSED] NTSC
[17:43:23] [PASSED] NTSC-443
[17:43:23] [PASSED] NTSC-J
[17:43:23] [PASSED] PAL
[17:43:23] [PASSED] PAL-M
[17:43:23] [PASSED] PAL-N
[17:43:23] [PASSED] SECAM
[17:43:23] [PASSED] Mono
[17:43:23] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[17:43:23] [PASSED] drm_test_get_tv_mode_from_name_truncated
[17:43:23] ============ [PASSED] drm_get_tv_mode_from_name ============
[17:43:23] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[17:43:23] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[17:43:23] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[17:43:23] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[17:43:23] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[17:43:23] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[17:43:23] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[17:43:23] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[17:43:23] [PASSED] VIC 96
[17:43:23] [PASSED] VIC 97
[17:43:23] [PASSED] VIC 101
[17:43:23] [PASSED] VIC 102
[17:43:23] [PASSED] VIC 106
[17:43:23] [PASSED] VIC 107
[17:43:23] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[17:43:23] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[17:43:23] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[17:43:23] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[17:43:23] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[17:43:23] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[17:43:23] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[17:43:23] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[17:43:23] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[17:43:23] [PASSED] Automatic
[17:43:23] [PASSED] Full
[17:43:23] [PASSED] Limited 16:235
[17:43:23] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[17:43:23] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[17:43:23] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[17:43:23] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[17:43:23] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[17:43:23] [PASSED] RGB
[17:43:23] [PASSED] YUV 4:2:0
[17:43:23] [PASSED] YUV 4:2:2
[17:43:23] [PASSED] YUV 4:4:4
[17:43:23] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[17:43:23] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[17:43:23] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[17:43:23] ============= drm_damage_helper (21 subtests) ==============
[17:43:23] [PASSED] drm_test_damage_iter_no_damage
[17:43:23] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[17:43:23] [PASSED] drm_test_damage_iter_no_damage_src_moved
[17:43:23] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[17:43:23] [PASSED] drm_test_damage_iter_no_damage_not_visible
[17:43:23] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[17:43:23] [PASSED] drm_test_damage_iter_no_damage_no_fb
[17:43:23] [PASSED] drm_test_damage_iter_simple_damage
[17:43:23] [PASSED] drm_test_damage_iter_single_damage
[17:43:23] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[17:43:23] [PASSED] drm_test_damage_iter_single_damage_outside_src
[17:43:23] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[17:43:23] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[17:43:23] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[17:43:23] [PASSED] drm_test_damage_iter_single_damage_src_moved
[17:43:23] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[17:43:23] [PASSED] drm_test_damage_iter_damage
[17:43:23] [PASSED] drm_test_damage_iter_damage_one_intersect
[17:43:23] [PASSED] drm_test_damage_iter_damage_one_outside
[17:43:23] [PASSED] drm_test_damage_iter_damage_src_moved
[17:43:23] [PASSED] drm_test_damage_iter_damage_not_visible
[17:43:23] ================ [PASSED] drm_damage_helper ================
[17:43:23] ============== drm_dp_mst_helper (3 subtests) ==============
[17:43:23] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[17:43:23] [PASSED] Clock 154000 BPP 30 DSC disabled
[17:43:23] [PASSED] Clock 234000 BPP 30 DSC disabled
[17:43:23] [PASSED] Clock 297000 BPP 24 DSC disabled
[17:43:23] [PASSED] Clock 332880 BPP 24 DSC enabled
[17:43:23] [PASSED] Clock 324540 BPP 24 DSC enabled
[17:43:23] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[17:43:23] ============== drm_test_dp_mst_calc_pbn_div  ===============
[17:43:23] [PASSED] Link rate 2000000 lane count 4
[17:43:23] [PASSED] Link rate 2000000 lane count 2
[17:43:23] [PASSED] Link rate 2000000 lane count 1
[17:43:23] [PASSED] Link rate 1350000 lane count 4
[17:43:23] [PASSED] Link rate 1350000 lane count 2
[17:43:23] [PASSED] Link rate 1350000 lane count 1
[17:43:23] [PASSED] Link rate 1000000 lane count 4
[17:43:23] [PASSED] Link rate 1000000 lane count 2
[17:43:23] [PASSED] Link rate 1000000 lane count 1
[17:43:23] [PASSED] Link rate 810000 lane count 4
[17:43:23] [PASSED] Link rate 810000 lane count 2
[17:43:23] [PASSED] Link rate 810000 lane count 1
[17:43:23] [PASSED] Link rate 540000 lane count 4
[17:43:23] [PASSED] Link rate 540000 lane count 2
[17:43:23] [PASSED] Link rate 540000 lane count 1
[17:43:23] [PASSED] Link rate 270000 lane count 4
[17:43:23] [PASSED] Link rate 270000 lane count 2
[17:43:23] [PASSED] Link rate 270000 lane count 1
[17:43:23] [PASSED] Link rate 162000 lane count 4
[17:43:23] [PASSED] Link rate 162000 lane count 2
[17:43:23] [PASSED] Link rate 162000 lane count 1
[17:43:23] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[17:43:23] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[17:43:23] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[17:43:23] [PASSED] DP_POWER_UP_PHY with port number
[17:43:23] [PASSED] DP_POWER_DOWN_PHY with port number
[17:43:23] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[17:43:23] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[17:43:23] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[17:43:23] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[17:43:23] [PASSED] DP_QUERY_PAYLOAD with port number
[17:43:23] [PASSED] DP_QUERY_PAYLOAD with VCPI
[17:43:23] [PASSED] DP_REMOTE_DPCD_READ with port number
[17:43:23] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[17:43:23] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[17:43:23] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[17:43:23] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[17:43:23] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[17:43:23] [PASSED] DP_REMOTE_I2C_READ with port number
[17:43:23] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[17:43:23] [PASSED] DP_REMOTE_I2C_READ with transactions array
[17:43:23] [PASSED] DP_REMOTE_I2C_WRITE with port number
[17:43:23] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[17:43:23] [PASSED] DP_REMOTE_I2C_WRITE with data array
[17:43:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[17:43:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[17:43:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[17:43:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[17:43:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[17:43:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[17:43:23] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[17:43:23] ================ [PASSED] drm_dp_mst_helper ================
[17:43:23] ================== drm_exec (7 subtests) ===================
[17:43:23] [PASSED] sanitycheck
[17:43:23] [PASSED] test_lock
[17:43:23] [PASSED] test_lock_unlock
[17:43:23] [PASSED] test_duplicates
[17:43:23] [PASSED] test_prepare
[17:43:23] [PASSED] test_prepare_array
[17:43:23] [PASSED] test_multiple_loops
[17:43:23] ==================== [PASSED] drm_exec =====================
[17:43:23] =========== drm_format_helper_test (17 subtests) ===========
[17:43:23] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[17:43:23] [PASSED] single_pixel_source_buffer
[17:43:23] [PASSED] single_pixel_clip_rectangle
[17:43:23] [PASSED] well_known_colors
[17:43:23] [PASSED] destination_pitch
[17:43:23] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[17:43:23] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[17:43:23] [PASSED] single_pixel_source_buffer
[17:43:23] [PASSED] single_pixel_clip_rectangle
[17:43:23] [PASSED] well_known_colors
[17:43:23] [PASSED] destination_pitch
[17:43:23] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[17:43:23] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[17:43:23] [PASSED] single_pixel_source_buffer
[17:43:23] [PASSED] single_pixel_clip_rectangle
[17:43:23] [PASSED] well_known_colors
[17:43:23] [PASSED] destination_pitch
[17:43:23] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[17:43:23] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[17:43:23] [PASSED] single_pixel_source_buffer
[17:43:23] [PASSED] single_pixel_clip_rectangle
[17:43:23] [PASSED] well_known_colors
[17:43:23] [PASSED] destination_pitch
[17:43:23] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[17:43:23] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[17:43:23] [PASSED] single_pixel_source_buffer
[17:43:23] [PASSED] single_pixel_clip_rectangle
[17:43:23] [PASSED] well_known_colors
[17:43:23] [PASSED] destination_pitch
[17:43:23] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[17:43:23] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[17:43:23] [PASSED] single_pixel_source_buffer
[17:43:23] [PASSED] single_pixel_clip_rectangle
[17:43:23] [PASSED] well_known_colors
[17:43:23] [PASSED] destination_pitch
[17:43:23] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[17:43:23] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[17:43:23] [PASSED] single_pixel_source_buffer
[17:43:23] [PASSED] single_pixel_clip_rectangle
[17:43:23] [PASSED] well_known_colors
[17:43:23] [PASSED] destination_pitch
[17:43:23] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[17:43:23] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[17:43:23] [PASSED] single_pixel_source_buffer
[17:43:23] [PASSED] single_pixel_clip_rectangle
[17:43:23] [PASSED] well_known_colors
[17:43:23] [PASSED] destination_pitch
[17:43:23] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[17:43:23] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[17:43:23] [PASSED] single_pixel_source_buffer
[17:43:23] [PASSED] single_pixel_clip_rectangle
[17:43:23] [PASSED] well_known_colors
[17:43:23] [PASSED] destination_pitch
[17:43:23] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[17:43:23] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[17:43:23] [PASSED] single_pixel_source_buffer
[17:43:23] [PASSED] single_pixel_clip_rectangle
[17:43:23] [PASSED] well_known_colors
[17:43:23] [PASSED] destination_pitch
[17:43:23] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[17:43:23] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[17:43:23] [PASSED] single_pixel_source_buffer
[17:43:23] [PASSED] single_pixel_clip_rectangle
[17:43:23] [PASSED] well_known_colors
[17:43:23] [PASSED] destination_pitch
[17:43:23] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[17:43:23] ============== drm_test_fb_xrgb8888_to_mono  ===============
[17:43:23] [PASSED] single_pixel_source_buffer
[17:43:23] [PASSED] single_pixel_clip_rectangle
[17:43:23] [PASSED] well_known_colors
[17:43:23] [PASSED] destination_pitch
[17:43:23] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[17:43:23] ==================== drm_test_fb_swab  =====================
[17:43:23] [PASSED] single_pixel_source_buffer
[17:43:23] [PASSED] single_pixel_clip_rectangle
[17:43:23] [PASSED] well_known_colors
[17:43:23] [PASSED] destination_pitch
[17:43:23] ================ [PASSED] drm_test_fb_swab =================
[17:43:23] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[17:43:23] [PASSED] single_pixel_source_buffer
[17:43:23] [PASSED] single_pixel_clip_rectangle
[17:43:23] [PASSED] well_known_colors
[17:43:23] [PASSED] destination_pitch
[17:43:23] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[17:43:23] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[17:43:23] [PASSED] single_pixel_source_buffer
[17:43:23] [PASSED] single_pixel_clip_rectangle
[17:43:23] [PASSED] well_known_colors
[17:43:23] [PASSED] destination_pitch
[17:43:23] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[17:43:23] ================= drm_test_fb_clip_offset  =================
[17:43:23] [PASSED] pass through
[17:43:23] [PASSED] horizontal offset
[17:43:23] [PASSED] vertical offset
[17:43:23] [PASSED] horizontal and vertical offset
[17:43:23] [PASSED] horizontal offset (custom pitch)
[17:43:23] [PASSED] vertical offset (custom pitch)
[17:43:23] [PASSED] horizontal and vertical offset (custom pitch)
[17:43:23] ============= [PASSED] drm_test_fb_clip_offset =============
[17:43:23] =================== drm_test_fb_memcpy  ====================
[17:43:23] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[17:43:23] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[17:43:23] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[17:43:23] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[17:43:23] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[17:43:23] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[17:43:23] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[17:43:23] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[17:43:23] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[17:43:23] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[17:43:23] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[17:43:23] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[17:43:23] =============== [PASSED] drm_test_fb_memcpy ================
[17:43:23] ============= [PASSED] drm_format_helper_test ==============
[17:43:23] ================= drm_format (18 subtests) =================
[17:43:23] [PASSED] drm_test_format_block_width_invalid
[17:43:23] [PASSED] drm_test_format_block_width_one_plane
[17:43:23] [PASSED] drm_test_format_block_width_two_plane
[17:43:23] [PASSED] drm_test_format_block_width_three_plane
[17:43:23] [PASSED] drm_test_format_block_width_tiled
[17:43:23] [PASSED] drm_test_format_block_height_invalid
[17:43:23] [PASSED] drm_test_format_block_height_one_plane
[17:43:23] [PASSED] drm_test_format_block_height_two_plane
[17:43:23] [PASSED] drm_test_format_block_height_three_plane
[17:43:23] [PASSED] drm_test_format_block_height_tiled
[17:43:23] [PASSED] drm_test_format_min_pitch_invalid
[17:43:23] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[17:43:23] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[17:43:23] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[17:43:23] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[17:43:23] [PASSED] drm_test_format_min_pitch_two_plane
[17:43:23] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[17:43:23] [PASSED] drm_test_format_min_pitch_tiled
[17:43:23] =================== [PASSED] drm_format ====================
[17:43:23] ============== drm_framebuffer (10 subtests) ===============
[17:43:23] ========== drm_test_framebuffer_check_src_coords  ==========
[17:43:23] [PASSED] Success: source fits into fb
[17:43:23] [PASSED] Fail: overflowing fb with x-axis coordinate
[17:43:23] [PASSED] Fail: overflowing fb with y-axis coordinate
[17:43:23] [PASSED] Fail: overflowing fb with source width
[17:43:23] [PASSED] Fail: overflowing fb with source height
[17:43:23] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[17:43:23] [PASSED] drm_test_framebuffer_cleanup
[17:43:23] =============== drm_test_framebuffer_create  ===============
[17:43:23] [PASSED] ABGR8888 normal sizes
[17:43:23] [PASSED] ABGR8888 max sizes
[17:43:23] [PASSED] ABGR8888 pitch greater than min required
[17:43:23] [PASSED] ABGR8888 pitch less than min required
[17:43:23] [PASSED] ABGR8888 Invalid width
[17:43:23] [PASSED] ABGR8888 Invalid buffer handle
[17:43:23] [PASSED] No pixel format
[17:43:23] [PASSED] ABGR8888 Width 0
[17:43:23] [PASSED] ABGR8888 Height 0
[17:43:23] [PASSED] ABGR8888 Out of bound height * pitch combination
[17:43:23] [PASSED] ABGR8888 Large buffer offset
[17:43:23] [PASSED] ABGR8888 Buffer offset for inexistent plane
[17:43:23] [PASSED] ABGR8888 Invalid flag
[17:43:23] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[17:43:23] [PASSED] ABGR8888 Valid buffer modifier
[17:43:23] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[17:43:23] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[17:43:23] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[17:43:23] [PASSED] NV12 Normal sizes
[17:43:23] [PASSED] NV12 Max sizes
[17:43:23] [PASSED] NV12 Invalid pitch
[17:43:23] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[17:43:23] [PASSED] NV12 different  modifier per-plane
[17:43:23] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[17:43:23] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[17:43:23] [PASSED] NV12 Modifier for inexistent plane
[17:43:23] [PASSED] NV12 Handle for inexistent plane
[17:43:23] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[17:43:23] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[17:43:23] [PASSED] YVU420 Normal sizes
[17:43:23] [PASSED] YVU420 Max sizes
[17:43:23] [PASSED] YVU420 Invalid pitch
[17:43:23] [PASSED] YVU420 Different pitches
[17:43:23] [PASSED] YVU420 Different buffer offsets/pitches
[17:43:23] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[17:43:23] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[17:43:23] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[17:43:23] [PASSED] YVU420 Valid modifier
[17:43:23] [PASSED] YVU420 Different modifiers per plane
[17:43:23] [PASSED] YVU420 Modifier for inexistent plane
[17:43:23] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[17:43:23] [PASSED] X0L2 Normal sizes
[17:43:23] [PASSED] X0L2 Max sizes
[17:43:23] [PASSED] X0L2 Invalid pitch
[17:43:23] [PASSED] X0L2 Pitch greater than minimum required
[17:43:23] [PASSED] X0L2 Handle for inexistent plane
[17:43:23] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[17:43:23] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[17:43:23] [PASSED] X0L2 Valid modifier
[17:43:23] [PASSED] X0L2 Modifier for inexistent plane
[17:43:23] =========== [PASSED] drm_test_framebuffer_create ===========
[17:43:23] [PASSED] drm_test_framebuffer_free
[17:43:23] [PASSED] drm_test_framebuffer_init
[17:43:23] [PASSED] drm_test_framebuffer_init_bad_format
[17:43:23] [PASSED] drm_test_framebuffer_init_dev_mismatch
[17:43:23] [PASSED] drm_test_framebuffer_lookup
[17:43:23] [PASSED] drm_test_framebuffer_lookup_inexistent
[17:43:23] [PASSED] drm_test_framebuffer_modifiers_not_supported
[17:43:23] ================= [PASSED] drm_framebuffer =================
[17:43:23] ================ drm_gem_shmem (8 subtests) ================
[17:43:23] [PASSED] drm_gem_shmem_test_obj_create
[17:43:23] [PASSED] drm_gem_shmem_test_obj_create_private
[17:43:23] [PASSED] drm_gem_shmem_test_pin_pages
[17:43:23] [PASSED] drm_gem_shmem_test_vmap
[17:43:23] [PASSED] drm_gem_shmem_test_get_sg_table
[17:43:23] [PASSED] drm_gem_shmem_test_get_pages_sgt
[17:43:23] [PASSED] drm_gem_shmem_test_madvise
[17:43:23] [PASSED] drm_gem_shmem_test_purge
[17:43:23] ================== [PASSED] drm_gem_shmem ==================
[17:43:23] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[17:43:23] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[17:43:23] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[17:43:23] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[17:43:23] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[17:43:23] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[17:43:23] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[17:43:23] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[17:43:23] [PASSED] Automatic
[17:43:23] [PASSED] Full
[17:43:23] [PASSED] Limited 16:235
[17:43:23] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[17:43:23] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[17:43:23] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[17:43:23] [PASSED] drm_test_check_disable_connector
[17:43:23] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[17:43:23] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[17:43:23] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[17:43:23] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[17:43:23] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[17:43:23] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[17:43:23] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[17:43:23] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[17:43:23] [PASSED] drm_test_check_output_bpc_dvi
[17:43:23] [PASSED] drm_test_check_output_bpc_format_vic_1
[17:43:23] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[17:43:23] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[17:43:23] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[17:43:23] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[17:43:23] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[17:43:23] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[17:43:23] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[17:43:23] ============ drm_test_check_hdmi_color_format  =============
[17:43:23] [PASSED] AUTO -> RGB
[17:43:23] [PASSED] YCBCR422 -> YUV422
[17:43:23] [PASSED] YCBCR420 -> YUV420
[17:43:23] [PASSED] YCBCR444 -> YUV444
[17:43:23] [PASSED] RGB -> RGB
[17:43:23] ======== [PASSED] drm_test_check_hdmi_color_format =========
[17:43:23] ======== drm_test_check_hdmi_color_format_420_only  ========
[17:43:23] [PASSED] RGB should fail
[17:43:23] [PASSED] YUV444 should fail
[17:43:23] [PASSED] YUV422 should fail
[17:43:23] [PASSED] YUV420 should work
[17:43:23] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[17:43:23] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[17:43:23] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[17:43:23] [PASSED] drm_test_check_broadcast_rgb_value
[17:43:23] [PASSED] drm_test_check_bpc_8_value
[17:43:23] [PASSED] drm_test_check_bpc_10_value
[17:43:23] [PASSED] drm_test_check_bpc_12_value
[17:43:23] [PASSED] drm_test_check_format_value
[17:43:23] [PASSED] drm_test_check_tmds_char_value
[17:43:23] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[17:43:23] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[17:43:23] [PASSED] drm_test_check_mode_valid
[17:43:23] [PASSED] drm_test_check_mode_valid_reject
[17:43:23] [PASSED] drm_test_check_mode_valid_reject_rate
[17:43:23] [PASSED] drm_test_check_mode_valid_reject_max_clock
[17:43:23] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[17:43:23] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[17:43:23] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[17:43:23] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[17:43:23] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[17:43:23] [PASSED] drm_test_check_infoframes
[17:43:23] [PASSED] drm_test_check_reject_avi_infoframe
[17:43:23] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[17:43:23] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[17:43:23] [PASSED] drm_test_check_reject_audio_infoframe
[17:43:23] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[17:43:23] ================= drm_managed (2 subtests) =================
[17:43:23] [PASSED] drm_test_managed_release_action
[17:43:23] [PASSED] drm_test_managed_run_action
[17:43:23] =================== [PASSED] drm_managed ===================
[17:43:23] =================== drm_mm (6 subtests) ====================
[17:43:23] [PASSED] drm_test_mm_init
[17:43:23] [PASSED] drm_test_mm_debug
[17:43:23] [PASSED] drm_test_mm_align32
[17:43:23] [PASSED] drm_test_mm_align64
[17:43:23] [PASSED] drm_test_mm_lowest
[17:43:23] [PASSED] drm_test_mm_highest
[17:43:23] ===================== [PASSED] drm_mm ======================
[17:43:23] ============= drm_modes_analog_tv (5 subtests) =============
[17:43:23] [PASSED] drm_test_modes_analog_tv_mono_576i
[17:43:23] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[17:43:23] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[17:43:23] [PASSED] drm_test_modes_analog_tv_pal_576i
[17:43:23] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[17:43:23] =============== [PASSED] drm_modes_analog_tv ===============
[17:43:23] ============== drm_plane_helper (2 subtests) ===============
[17:43:23] =============== drm_test_check_plane_state  ================
[17:43:23] [PASSED] clipping_simple
[17:43:23] [PASSED] clipping_rotate_reflect
[17:43:23] [PASSED] positioning_simple
[17:43:23] [PASSED] upscaling
[17:43:23] [PASSED] downscaling
[17:43:23] [PASSED] rounding1
[17:43:23] [PASSED] rounding2
[17:43:23] [PASSED] rounding3
[17:43:23] [PASSED] rounding4
[17:43:23] =========== [PASSED] drm_test_check_plane_state ============
[17:43:23] =========== drm_test_check_invalid_plane_state  ============
[17:43:23] [PASSED] positioning_invalid
[17:43:23] [PASSED] upscaling_invalid
[17:43:23] [PASSED] downscaling_invalid
[17:43:23] ======= [PASSED] drm_test_check_invalid_plane_state ========
[17:43:23] ================ [PASSED] drm_plane_helper =================
[17:43:23] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[17:43:23] ====== drm_test_connector_helper_tv_get_modes_check  =======
[17:43:23] [PASSED] None
[17:43:23] [PASSED] PAL
[17:43:23] [PASSED] NTSC
[17:43:23] [PASSED] Both, NTSC Default
[17:43:23] [PASSED] Both, PAL Default
[17:43:23] [PASSED] Both, NTSC Default, with PAL on command-line
[17:43:23] [PASSED] Both, PAL Default, with NTSC on command-line
[17:43:23] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[17:43:23] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[17:43:23] ================== drm_rect (9 subtests) ===================
[17:43:23] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[17:43:23] [PASSED] drm_test_rect_clip_scaled_not_clipped
[17:43:23] [PASSED] drm_test_rect_clip_scaled_clipped
[17:43:23] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[17:43:23] ================= drm_test_rect_intersect  =================
[17:43:23] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[17:43:23] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[17:43:23] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[17:43:23] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[17:43:23] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[17:43:23] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[17:43:23] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[17:43:23] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[17:43:23] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[17:43:23] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[17:43:23] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[17:43:23] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[17:43:23] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[17:43:23] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[17:43:23] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[17:43:23] ============= [PASSED] drm_test_rect_intersect =============
[17:43:23] ================ drm_test_rect_calc_hscale  ================
[17:43:23] [PASSED] normal use
[17:43:23] [PASSED] out of max range
[17:43:23] [PASSED] out of min range
[17:43:23] [PASSED] zero dst
[17:43:23] [PASSED] negative src
[17:43:23] [PASSED] negative dst
[17:43:23] ============ [PASSED] drm_test_rect_calc_hscale ============
[17:43:23] ================ drm_test_rect_calc_vscale  ================
[17:43:23] [PASSED] normal use
[17:43:23] [PASSED] out of max range
[17:43:23] [PASSED] out of min range
[17:43:23] [PASSED] zero dst
[17:43:23] [PASSED] negative src
[17:43:23] [PASSED] negative dst
[17:43:23] ============ [PASSED] drm_test_rect_calc_vscale ============
[17:43:23] ================== drm_test_rect_rotate  ===================
[17:43:23] [PASSED] reflect-x
[17:43:23] [PASSED] reflect-y
[17:43:23] [PASSED] rotate-0
[17:43:23] [PASSED] rotate-90
[17:43:23] [PASSED] rotate-180
[17:43:23] [PASSED] rotate-270
[17:43:23] ============== [PASSED] drm_test_rect_rotate ===============
[17:43:23] ================ drm_test_rect_rotate_inv  =================
[17:43:23] [PASSED] reflect-x
[17:43:23] [PASSED] reflect-y
[17:43:23] [PASSED] rotate-0
[17:43:23] [PASSED] rotate-90
[17:43:23] [PASSED] rotate-180
[17:43:23] [PASSED] rotate-270
[17:43:23] ============ [PASSED] drm_test_rect_rotate_inv =============
[17:43:23] ==================== [PASSED] drm_rect =====================
[17:43:23] ============ drm_sysfb_modeset_test (1 subtest) ============
[17:43:23] ============ drm_test_sysfb_build_fourcc_list  =============
[17:43:23] [PASSED] no native formats
[17:43:23] [PASSED] XRGB8888 as native format
[17:43:23] [PASSED] remove duplicates
[17:43:23] [PASSED] convert alpha formats
[17:43:23] [PASSED] random formats
[17:43:23] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[17:43:23] ============= [PASSED] drm_sysfb_modeset_test ==============
[17:43:23] ================== drm_fixp (2 subtests) ===================
[17:43:23] [PASSED] drm_test_int2fixp
[17:43:23] [PASSED] drm_test_sm2fixp
[17:43:23] ==================== [PASSED] drm_fixp =====================
[17:43:23] ============================================================
[17:43:23] Testing complete. Ran 641 tests: passed: 641
[17:43:23] Elapsed time: 27.010s total, 1.819s configuring, 25.025s building, 0.145s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[17:43:23] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:43:25] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:43:35] Starting KUnit Kernel (1/1)...
[17:43:35] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:43:35] ============= refcount_interrupt (4 subtests) ==============
[17:43:35] [PASSED] test_single_irq_change
[17:43:35] [PASSED] test_nested_irq_change
[17:43:35] [PASSED] test_multiple_irq_change
[17:43:35] [PASSED] test_irq_save
[17:43:35] =============== [PASSED] refcount_interrupt ================
[17:43:35] ================= ttm_device (5 subtests) ==================
[17:43:35] [PASSED] ttm_device_init_basic
[17:43:35] [PASSED] ttm_device_init_multiple
[17:43:35] [PASSED] ttm_device_fini_basic
[17:43:35] [PASSED] ttm_device_init_no_vma_man
[17:43:35] ================== ttm_device_init_pools  ==================
[17:43:35] [PASSED] No DMA allocations, no DMA32 required
[17:43:35] [PASSED] DMA allocations, DMA32 required
[17:43:35] [PASSED] No DMA allocations, DMA32 required
[17:43:35] [PASSED] DMA allocations, no DMA32 required
[17:43:35] ============== [PASSED] ttm_device_init_pools ==============
[17:43:35] =================== [PASSED] ttm_device ====================
[17:43:35] ================== ttm_pool (8 subtests) ===================
[17:43:35] ================== ttm_pool_alloc_basic  ===================
[17:43:35] [PASSED] One page
[17:43:35] [PASSED] More than one page
[17:43:35] [PASSED] Above the allocation limit
[17:43:35] [PASSED] One page, with coherent DMA mappings enabled
[17:43:35] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[17:43:35] ============== [PASSED] ttm_pool_alloc_basic ===============
[17:43:35] ============== ttm_pool_alloc_basic_dma_addr  ==============
[17:43:35] [PASSED] One page
[17:43:35] [PASSED] More than one page
[17:43:35] [PASSED] Above the allocation limit
[17:43:35] [PASSED] One page, with coherent DMA mappings enabled
[17:43:35] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[17:43:35] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[17:43:35] [PASSED] ttm_pool_alloc_order_caching_match
[17:43:35] [PASSED] ttm_pool_alloc_caching_mismatch
[17:43:35] [PASSED] ttm_pool_alloc_order_mismatch
[17:43:35] [PASSED] ttm_pool_free_dma_alloc
[17:43:35] [PASSED] ttm_pool_free_no_dma_alloc
[17:43:35] [PASSED] ttm_pool_fini_basic
[17:43:35] ==================== [PASSED] ttm_pool =====================
[17:43:35] ================ ttm_resource (8 subtests) =================
[17:43:35] ================= ttm_resource_init_basic  =================
[17:43:35] [PASSED] Init resource in TTM_PL_SYSTEM
[17:43:35] [PASSED] Init resource in TTM_PL_VRAM
[17:43:35] [PASSED] Init resource in a private placement
[17:43:35] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[17:43:35] ============= [PASSED] ttm_resource_init_basic =============
[17:43:35] [PASSED] ttm_resource_init_pinned
[17:43:35] [PASSED] ttm_resource_fini_basic
[17:43:35] [PASSED] ttm_resource_manager_init_basic
[17:43:35] [PASSED] ttm_resource_manager_usage_basic
[17:43:35] [PASSED] ttm_resource_manager_set_used_basic
[17:43:35] [PASSED] ttm_sys_man_alloc_basic
[17:43:35] [PASSED] ttm_sys_man_free_basic
[17:43:35] ================== [PASSED] ttm_resource ===================
[17:43:35] =================== ttm_tt (15 subtests) ===================
[17:43:35] ==================== ttm_tt_init_basic  ====================
[17:43:35] [PASSED] Page-aligned size
[17:43:35] [PASSED] Extra pages requested
[17:43:35] ================ [PASSED] ttm_tt_init_basic ================
[17:43:35] [PASSED] ttm_tt_init_misaligned
[17:43:35] [PASSED] ttm_tt_fini_basic
[17:43:35] [PASSED] ttm_tt_fini_sg
[17:43:35] [PASSED] ttm_tt_fini_shmem
[17:43:35] [PASSED] ttm_tt_create_basic
[17:43:35] [PASSED] ttm_tt_create_invalid_bo_type
[17:43:35] [PASSED] ttm_tt_create_ttm_exists
[17:43:35] [PASSED] ttm_tt_create_failed
[17:43:35] [PASSED] ttm_tt_destroy_basic
[17:43:35] [PASSED] ttm_tt_populate_null_ttm
[17:43:35] [PASSED] ttm_tt_populate_populated_ttm
[17:43:35] [PASSED] ttm_tt_unpopulate_basic
[17:43:35] [PASSED] ttm_tt_unpopulate_empty_ttm
[17:43:35] [PASSED] ttm_tt_swapin_basic
[17:43:35] ===================== [PASSED] ttm_tt ======================
[17:43:35] =================== ttm_bo (14 subtests) ===================
[17:43:35] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[17:43:35] [PASSED] Cannot be interrupted and sleeps
[17:43:35] [PASSED] Cannot be interrupted, locks straight away
[17:43:35] [PASSED] Can be interrupted, sleeps
[17:43:35] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[17:43:35] [PASSED] ttm_bo_reserve_locked_no_sleep
[17:43:35] [PASSED] ttm_bo_reserve_no_wait_ticket
[17:43:35] [PASSED] ttm_bo_reserve_double_resv
[17:43:35] [PASSED] ttm_bo_reserve_interrupted
[17:43:35] [PASSED] ttm_bo_reserve_deadlock
[17:43:35] [PASSED] ttm_bo_unreserve_basic
[17:43:35] [PASSED] ttm_bo_unreserve_pinned
[17:43:35] [PASSED] ttm_bo_unreserve_bulk
[17:43:35] [PASSED] ttm_bo_fini_basic
[17:43:35] [PASSED] ttm_bo_fini_shared_resv
[17:43:35] [PASSED] ttm_bo_pin_basic
[17:43:35] [PASSED] ttm_bo_pin_unpin_resource
[17:43:35] [PASSED] ttm_bo_multiple_pin_one_unpin
[17:43:35] ===================== [PASSED] ttm_bo ======================
[17:43:35] ============== ttm_bo_validate (22 subtests) ===============
[17:43:35] ============== ttm_bo_init_reserved_sys_man  ===============
[17:43:35] [PASSED] Buffer object for userspace
[17:43:35] [PASSED] Kernel buffer object
[17:43:35] [PASSED] Shared buffer object
[17:43:35] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[17:43:35] ============== ttm_bo_init_reserved_mock_man  ==============
[17:43:35] [PASSED] Buffer object for userspace
[17:43:35] [PASSED] Kernel buffer object
[17:43:35] [PASSED] Shared buffer object
[17:43:35] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[17:43:35] [PASSED] ttm_bo_init_reserved_resv
[17:43:35] ================== ttm_bo_validate_basic  ==================
[17:43:35] [PASSED] Buffer object for userspace
[17:43:35] [PASSED] Kernel buffer object
[17:43:35] [PASSED] Shared buffer object
[17:43:35] ============== [PASSED] ttm_bo_validate_basic ==============
[17:43:35] [PASSED] ttm_bo_validate_invalid_placement
[17:43:35] ============= ttm_bo_validate_same_placement  ==============
[17:43:35] [PASSED] System manager
[17:43:35] [PASSED] VRAM manager
[17:43:35] ========= [PASSED] ttm_bo_validate_same_placement ==========
[17:43:35] [PASSED] ttm_bo_validate_failed_alloc
[17:43:35] [PASSED] ttm_bo_validate_pinned
[17:43:35] [PASSED] ttm_bo_validate_busy_placement
[17:43:35] ================ ttm_bo_validate_multihop  =================
[17:43:35] [PASSED] Buffer object for userspace
[17:43:35] [PASSED] Kernel buffer object
[17:43:35] [PASSED] Shared buffer object
[17:43:35] ============ [PASSED] ttm_bo_validate_multihop =============
[17:43:35] ========== ttm_bo_validate_no_placement_signaled  ==========
[17:43:35] [PASSED] Buffer object in system domain, no page vector
[17:43:35] [PASSED] Buffer object in system domain with an existing page vector
[17:43:35] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[17:43:35] ======== ttm_bo_validate_no_placement_not_signaled  ========
[17:43:35] [PASSED] Buffer object for userspace
[17:43:35] [PASSED] Kernel buffer object
[17:43:35] [PASSED] Shared buffer object
[17:43:35] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[17:43:35] [PASSED] ttm_bo_validate_move_fence_signaled
[17:43:35] ========= ttm_bo_validate_move_fence_not_signaled  =========
[17:43:35] [PASSED] Waits for GPU
[17:43:35] [PASSED] Tries to lock straight away
[17:43:35] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[17:43:35] [PASSED] ttm_bo_validate_swapout
[17:43:35] [PASSED] ttm_bo_validate_happy_evict
[17:43:35] [PASSED] ttm_bo_validate_all_pinned_evict
[17:43:35] [PASSED] ttm_bo_validate_allowed_only_evict
[17:43:35] [PASSED] ttm_bo_validate_deleted_evict
[17:43:35] [PASSED] ttm_bo_validate_busy_domain_evict
[17:43:35] [PASSED] ttm_bo_validate_evict_gutting
[17:43:35] [PASSED] ttm_bo_validate_recrusive_evict
[17:43:35] ================= [PASSED] ttm_bo_validate =================
[17:43:35] ============================================================
[17:43:35] Testing complete. Ran 106 tests: passed: 106
[17:43:35] Elapsed time: 12.107s total, 1.797s configuring, 10.044s building, 0.231s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/dma-buf/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[17:43:35] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:43:37] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:43:46] Starting KUnit Kernel (1/1)...
[17:43:46] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:43:46] ============= refcount_interrupt (4 subtests) ==============
[17:43:46] [PASSED] test_single_irq_change
[17:43:46] [PASSED] test_nested_irq_change
[17:43:46] [PASSED] test_multiple_irq_change
[17:43:46] [PASSED] test_irq_save
[17:43:46] =============== [PASSED] refcount_interrupt ================
[17:43:46] =============== dma-buf-fence (12 subtests) ================
[17:43:46] [PASSED] test_sanitycheck
[17:43:46] [PASSED] test_signaling
[17:43:46] [PASSED] test_add_callback
[17:43:46] [PASSED] test_late_add_callback
[17:43:46] [PASSED] test_rm_callback
[17:43:46] [PASSED] test_late_rm_callback
[17:43:46] [PASSED] test_status
[17:43:46] [PASSED] test_error
[17:43:46] [PASSED] test_wait
[17:43:46] [PASSED] test_wait_timeout
[17:43:46] [PASSED] test_stub
[17:43:46] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[17:43:46] ================== [PASSED] dma-buf-fence ==================
[17:43:46] ============ dma-buf-fence-chain (11 subtests) =============
[17:43:46] [PASSED] test_sanitycheck
[17:43:46] [PASSED] test_find_seqno
[17:43:46] [PASSED] test_find_signaled
[17:43:46] [PASSED] test_find_out_of_order
[17:43:51] [PASSED] test_find_gap
[17:43:51] [PASSED] test_find_race
[17:43:51] [PASSED] test_signal_forward
[17:43:51] [PASSED] test_signal_backward
[17:43:51] [PASSED] test_wait_forward
[17:43:51] [PASSED] test_wait_backward
[17:43:51] [PASSED] test_wait_random
[17:43:51] =============== [PASSED] dma-buf-fence-chain ===============
[17:43:51] ============ dma-buf-fence-unwrap (10 subtests) ============
[17:43:51] [PASSED] test_sanitycheck
[17:43:51] [PASSED] test_unwrap_array
[17:43:51] [PASSED] test_unwrap_chain
[17:43:51] [PASSED] test_unwrap_chain_array
[17:43:51] [PASSED] test_unwrap_merge
[17:43:51] [PASSED] test_unwrap_merge_duplicate
[17:43:51] [PASSED] test_unwrap_merge_seqno
[17:43:51] [PASSED] test_unwrap_merge_order
[17:43:51] [PASSED] test_unwrap_merge_complex
[17:43:51] [PASSED] test_unwrap_merge_complex_seqno
[17:43:51] ============== [PASSED] dma-buf-fence-unwrap ===============
[17:43:51] ================ dma-buf-resv (5 subtests) =================
[17:43:51] [PASSED] test_sanitycheck
[17:43:51] ===================== test_signaling  ======================
[17:43:51] [PASSED] kernel
[17:43:51] [PASSED] write
[17:43:51] [PASSED] read
[17:43:51] [PASSED] bookkeep
[17:43:51] ================= [PASSED] test_signaling ==================
[17:43:51] ====================== test_for_each  ======================
[17:43:51] [PASSED] kernel
[17:43:51] [PASSED] write
[17:43:51] [PASSED] read
[17:43:51] [PASSED] bookkeep
[17:43:51] ================== [PASSED] test_for_each ==================
[17:43:51] ================= test_for_each_unlocked  ==================
[17:43:51] [PASSED] kernel
[17:43:51] [PASSED] write
[17:43:51] [PASSED] read
[17:43:51] [PASSED] bookkeep
[17:43:51] ============= [PASSED] test_for_each_unlocked ==============
[17:43:51] ===================== test_get_fences  =====================
[17:43:51] [PASSED] kernel
[17:43:51] [PASSED] write
[17:43:51] [PASSED] read
[17:43:51] [PASSED] bookkeep
[17:43:51] ================= [PASSED] test_get_fences =================
[17:43:51] ================== [PASSED] dma-buf-resv ===================
[17:43:51] ============================================================
[17:43:51] Testing complete. Ran 54 tests: passed: 53, skipped: 1
[17:43:51] Elapsed time: 15.758s total, 1.765s configuring, 8.721s building, 5.263s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


