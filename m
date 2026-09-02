Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68223C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 23:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C31210E073;
	Wed,  2 Sep 2026 23:48:42 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B2C10E068;
 Wed,  2 Sep 2026 23:48:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/guc=3A_Compress_GuC_log?=
 =?utf-8?q?_and_CTB_dump_with_zstd_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Sep 2026 23:48:41 -0000
Message-ID: <178839292171.115637.11348657084712950181@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260902234039.885267-4-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20260902234039.885267-4-alan.previn.teres.alexis@intel.com>
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

Series: drm/xe/guc: Compress GuC log and CTB dump with zstd (rev4)
URL   : https://patchwork.freedesktop.org/series/170589/
State : success

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[23:46:34] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:46:39] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[23:46:59] Starting KUnit Kernel (1/1)...
[23:46:59] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:46:59] ============= refcount_interrupt (4 subtests) ==============
[23:46:59] [PASSED] test_single_irq_change
[23:46:59] [PASSED] test_nested_irq_change
[23:46:59] [PASSED] test_multiple_irq_change
[23:46:59] [PASSED] test_irq_save
[23:46:59] =============== [PASSED] refcount_interrupt ================
[23:46:59] ================= gpu_buddy (14 subtests) ==================
[23:46:59] [PASSED] gpu_test_buddy_alloc_limit
[23:46:59] [PASSED] gpu_test_buddy_alloc_optimistic
[23:46:59] [PASSED] gpu_test_buddy_alloc_pessimistic
[23:46:59] [PASSED] gpu_test_buddy_alloc_pathological
[23:46:59] [PASSED] gpu_test_buddy_alloc_contiguous
[23:46:59] [PASSED] gpu_test_buddy_alloc_clear
[23:46:59] [PASSED] gpu_test_buddy_alloc_range
[23:47:00] [PASSED] gpu_test_buddy_alloc_range_bias
[23:47:00] [PASSED] gpu_test_buddy_fragmentation_performance
[23:47:01] [PASSED] gpu_test_buddy_dirty_tracker_performance
[23:47:01] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[23:47:01] [PASSED] gpu_test_buddy_offset_aligned_allocation
[23:47:01] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[23:47:01] [PASSED] gpu_test_buddy_addr_to_block
[23:47:01] ==================== [PASSED] gpu_buddy ====================
[23:47:01] ============================================================
[23:47:01] Testing complete. Ran 18 tests: passed: 18
[23:47:01] Elapsed time: 27.007s total, 4.486s configuring, 20.603s building, 1.853s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[23:47:01] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:47:03] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[23:47:42] Starting KUnit Kernel (1/1)...
[23:47:42] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:47:42] ============= refcount_interrupt (4 subtests) ==============
[23:47:42] [PASSED] test_single_irq_change
[23:47:42] [PASSED] test_nested_irq_change
[23:47:42] [PASSED] test_multiple_irq_change
[23:47:42] [PASSED] test_irq_save
[23:47:42] =============== [PASSED] refcount_interrupt ================
[23:47:42] ================== guc_buf (11 subtests) ===================
[23:47:42] [PASSED] test_smallest
[23:47:42] [PASSED] test_largest
[23:47:42] [PASSED] test_granular
[23:47:42] [PASSED] test_unique
[23:47:42] [PASSED] test_overlap
[23:47:42] [PASSED] test_reusable
[23:47:42] [PASSED] test_too_big
[23:47:42] [PASSED] test_flush
[23:47:42] [PASSED] test_lookup
[23:47:42] [PASSED] test_data
[23:47:42] [PASSED] test_class
[23:47:42] ===================== [PASSED] guc_buf =====================
[23:47:42] =================== guc_dbm (7 subtests) ===================
[23:47:42] [PASSED] test_empty
[23:47:42] [PASSED] test_default
[23:47:42] ======================== test_size  ========================
[23:47:42] [PASSED] 4
[23:47:42] [PASSED] 8
[23:47:42] [PASSED] 32
[23:47:42] [PASSED] 256
[23:47:42] ==================== [PASSED] test_size ====================
[23:47:42] ======================= test_reuse  ========================
[23:47:42] [PASSED] 4
[23:47:42] [PASSED] 8
[23:47:42] [PASSED] 32
[23:47:42] [PASSED] 256
[23:47:42] =================== [PASSED] test_reuse ====================
[23:47:42] =================== test_range_overlap  ====================
[23:47:42] [PASSED] 4
[23:47:42] [PASSED] 8
[23:47:42] [PASSED] 32
[23:47:42] [PASSED] 256
[23:47:42] =============== [PASSED] test_range_overlap ================
[23:47:42] =================== test_range_compact  ====================
[23:47:42] [PASSED] 4
[23:47:42] [PASSED] 8
[23:47:42] [PASSED] 32
[23:47:42] [PASSED] 256
[23:47:42] =============== [PASSED] test_range_compact ================
[23:47:42] ==================== test_range_spare  =====================
[23:47:42] [PASSED] 4
[23:47:42] [PASSED] 8
[23:47:42] [PASSED] 32
[23:47:42] [PASSED] 256
[23:47:42] ================ [PASSED] test_range_spare =================
[23:47:42] ===================== [PASSED] guc_dbm =====================
[23:47:42] =================== guc_idm (6 subtests) ===================
[23:47:42] [PASSED] bad_init
[23:47:42] [PASSED] no_init
[23:47:42] [PASSED] init_fini
[23:47:42] [PASSED] check_used
[23:47:42] [PASSED] check_quota
[23:47:42] [PASSED] check_all
[23:47:42] ===================== [PASSED] guc_idm =====================
[23:47:42] =============== guc_klv_helpers (9 subtests) ===============
[23:47:42] [PASSED] test_count
[23:47:42] [PASSED] test_encode_u32
[23:47:42] [PASSED] test_encode_u64
[23:47:42] [PASSED] test_encode_string
[23:47:42] [PASSED] test_encode_object_raw
[23:47:42] [PASSED] test_encode_object_klv
[23:47:42] [PASSED] test_encode_object_nested
[23:47:42] [PASSED] test_encode_object_basic
[23:47:42] [PASSED] test_print
[23:47:42] ================= [PASSED] guc_klv_helpers =================
[23:47:42] =================== xe_log (4 subtests) ====================
[23:47:42] [PASSED] demo_cper
[23:47:42] [PASSED] demo_dmesg
[23:47:42] ======================= test_dmesg  ========================
[23:47:42] [PASSED] test_fatal
[23:47:42] [PASSED] test_fatal_tile
[23:47:42] [PASSED] test_fatal_gt
[23:47:42] [PASSED] test_fatal_comp
[23:47:42] [PASSED] test_fatal_comp_tile
[23:47:42] [PASSED] test_fatal_comp_gt
[23:47:42] [PASSED] test_fatal_all
[23:47:42] [PASSED] test_recoverable
[23:47:42] [PASSED] test_recoverable_tile
[23:47:42] [PASSED] test_recoverable_gt
[23:47:42] [PASSED] test_recoverable_comp
[23:47:42] [PASSED] test_recoverable_comp_tile
[23:47:42] [PASSED] test_recoverable_comp_gt
[23:47:42] [PASSED] test_recoverable_all
[23:47:42] [PASSED] test_info
[23:47:42] [PASSED] test_info_tile
[23:47:42] [PASSED] test_info_gt
[23:47:42] [PASSED] test_info_err
[23:47:42] [PASSED] test_info_comp
[23:47:42] [PASSED] test_info_comp_tile
[23:47:42] [PASSED] test_info_comp_gt
[23:47:42] [PASSED] test_info_all
[23:47:42] [PASSED] test_hw_fatal
[23:47:42] [PASSED] test_hw_recoverable
[23:47:42] [PASSED] test_hw_corrected
[23:47:42] [PASSED] test_hw_informational
[23:47:42] =================== [PASSED] test_dmesg ====================
[23:47:42] ====================== test_invalid  =======================
[23:47:42] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[23:47:42] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[23:47:42] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[23:47:42] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[23:47:42] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[23:47:42] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[23:47:42] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[23:47:42] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[23:47:42] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[23:47:42] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[23:47:42] ================== [SKIPPED] test_invalid ==================
[23:47:42] ===================== [PASSED] xe_log ======================
[23:47:42] ================== no_relay (3 subtests) ===================
[23:47:42] [PASSED] xe_drops_guc2pf_if_not_ready
[23:47:42] [PASSED] xe_drops_guc2vf_if_not_ready
[23:47:42] [PASSED] xe_rejects_send_if_not_ready
[23:47:42] ==================== [PASSED] no_relay =====================
[23:47:42] ================== pf_relay (14 subtests) ==================
[23:47:42] [PASSED] pf_rejects_guc2pf_too_short
[23:47:42] [PASSED] pf_rejects_guc2pf_too_long
[23:47:42] [PASSED] pf_rejects_guc2pf_no_payload
[23:47:42] [PASSED] pf_fails_no_payload
[23:47:42] [PASSED] pf_fails_bad_origin
[23:47:42] [PASSED] pf_fails_bad_type
[23:47:42] [PASSED] pf_txn_reports_error
[23:47:42] [PASSED] pf_txn_sends_pf2guc
[23:47:42] [PASSED] pf_sends_pf2guc
[23:47:42] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[23:47:42] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[23:47:42] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[23:47:42] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[23:47:42] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[23:47:42] ==================== [PASSED] pf_relay =====================
[23:47:42] ================== vf_relay (3 subtests) ===================
[23:47:42] [PASSED] vf_rejects_guc2vf_too_short
[23:47:42] [PASSED] vf_rejects_guc2vf_too_long
[23:47:42] [PASSED] vf_rejects_guc2vf_no_payload
[23:47:42] ==================== [PASSED] vf_relay =====================
[23:47:42] ================ pf_gt_config (9 subtests) =================
[23:47:42] [PASSED] fair_contexts_1vf
[23:47:42] [PASSED] fair_doorbells_1vf
[23:47:42] [PASSED] fair_ggtt_1vf
[23:47:42] ====================== fair_vram_1vf  ======================
[23:47:42] [PASSED] 3.50 GiB
[23:47:42] [PASSED] 11.5 GiB
[23:47:42] [PASSED] 15.5 GiB
[23:47:42] [PASSED] 31.5 GiB
[23:47:42] [PASSED] 63.5 GiB
[23:47:42] [PASSED] 1.91 GiB
[23:47:42] ================== [PASSED] fair_vram_1vf ==================
[23:47:42] ================ fair_vram_1vf_admin_only  =================
[23:47:42] [PASSED] 3.50 GiB
[23:47:42] [PASSED] 11.5 GiB
[23:47:42] [PASSED] 15.5 GiB
[23:47:42] [PASSED] 31.5 GiB
[23:47:42] [PASSED] 63.5 GiB
[23:47:42] [PASSED] 1.91 GiB
[23:47:42] ============ [PASSED] fair_vram_1vf_admin_only =============
[23:47:42] ====================== fair_contexts  ======================
[23:47:42] [PASSED] 1 VF
[23:47:42] [PASSED] 2 VFs
[23:47:42] [PASSED] 3 VFs
[23:47:42] [PASSED] 4 VFs
[23:47:42] [PASSED] 5 VFs
[23:47:42] [PASSED] 6 VFs
[23:47:42] [PASSED] 7 VFs
[23:47:42] [PASSED] 8 VFs
[23:47:42] [PASSED] 9 VFs
[23:47:42] [PASSED] 10 VFs
[23:47:42] [PASSED] 11 VFs
[23:47:42] [PASSED] 12 VFs
[23:47:42] [PASSED] 13 VFs
[23:47:42] [PASSED] 14 VFs
[23:47:42] [PASSED] 15 VFs
[23:47:42] [PASSED] 16 VFs
[23:47:42] [PASSED] 17 VFs
[23:47:42] [PASSED] 18 VFs
[23:47:42] [PASSED] 19 VFs
[23:47:42] [PASSED] 20 VFs
[23:47:42] [PASSED] 21 VFs
[23:47:42] [PASSED] 22 VFs
[23:47:42] [PASSED] 23 VFs
[23:47:42] [PASSED] 24 VFs
[23:47:42] [PASSED] 25 VFs
[23:47:42] [PASSED] 26 VFs
[23:47:42] [PASSED] 27 VFs
[23:47:42] [PASSED] 28 VFs
[23:47:42] [PASSED] 29 VFs
[23:47:42] [PASSED] 30 VFs
[23:47:42] [PASSED] 31 VFs
[23:47:42] [PASSED] 32 VFs
[23:47:42] [PASSED] 33 VFs
[23:47:42] [PASSED] 34 VFs
[23:47:42] [PASSED] 35 VFs
[23:47:42] [PASSED] 36 VFs
[23:47:42] [PASSED] 37 VFs
[23:47:42] [PASSED] 38 VFs
[23:47:42] [PASSED] 39 VFs
[23:47:42] [PASSED] 40 VFs
[23:47:42] [PASSED] 41 VFs
[23:47:42] [PASSED] 42 VFs
[23:47:42] [PASSED] 43 VFs
[23:47:42] [PASSED] 44 VFs
[23:47:42] [PASSED] 45 VFs
[23:47:42] [PASSED] 46 VFs
[23:47:42] [PASSED] 47 VFs
[23:47:42] [PASSED] 48 VFs
[23:47:42] [PASSED] 49 VFs
[23:47:42] [PASSED] 50 VFs
[23:47:42] [PASSED] 51 VFs
[23:47:42] [PASSED] 52 VFs
[23:47:42] [PASSED] 53 VFs
[23:47:42] [PASSED] 54 VFs
[23:47:42] [PASSED] 55 VFs
[23:47:42] [PASSED] 56 VFs
[23:47:42] [PASSED] 57 VFs
[23:47:42] [PASSED] 58 VFs
[23:47:42] [PASSED] 59 VFs
[23:47:42] [PASSED] 60 VFs
[23:47:42] [PASSED] 61 VFs
[23:47:42] [PASSED] 62 VFs
[23:47:42] [PASSED] 63 VFs
[23:47:42] ================== [PASSED] fair_contexts ==================
[23:47:42] ===================== fair_doorbells  ======================
[23:47:42] [PASSED] 1 VF
[23:47:42] [PASSED] 2 VFs
[23:47:42] [PASSED] 3 VFs
[23:47:42] [PASSED] 4 VFs
[23:47:42] [PASSED] 5 VFs
[23:47:42] [PASSED] 6 VFs
[23:47:42] [PASSED] 7 VFs
[23:47:42] [PASSED] 8 VFs
[23:47:42] [PASSED] 9 VFs
[23:47:42] [PASSED] 10 VFs
[23:47:42] [PASSED] 11 VFs
[23:47:42] [PASSED] 12 VFs
[23:47:42] [PASSED] 13 VFs
[23:47:42] [PASSED] 14 VFs
[23:47:42] [PASSED] 15 VFs
[23:47:42] [PASSED] 16 VFs
[23:47:42] [PASSED] 17 VFs
[23:47:42] [PASSED] 18 VFs
[23:47:42] [PASSED] 19 VFs
[23:47:42] [PASSED] 20 VFs
[23:47:42] [PASSED] 21 VFs
[23:47:42] [PASSED] 22 VFs
[23:47:42] [PASSED] 23 VFs
[23:47:42] [PASSED] 24 VFs
[23:47:42] [PASSED] 25 VFs
[23:47:42] [PASSED] 26 VFs
[23:47:42] [PASSED] 27 VFs
[23:47:42] [PASSED] 28 VFs
[23:47:42] [PASSED] 29 VFs
[23:47:42] [PASSED] 30 VFs
[23:47:42] [PASSED] 31 VFs
[23:47:42] [PASSED] 32 VFs
[23:47:42] [PASSED] 33 VFs
[23:47:42] [PASSED] 34 VFs
[23:47:42] [PASSED] 35 VFs
[23:47:42] [PASSED] 36 VFs
[23:47:42] [PASSED] 37 VFs
[23:47:42] [PASSED] 38 VFs
[23:47:42] [PASSED] 39 VFs
[23:47:42] [PASSED] 40 VFs
[23:47:42] [PASSED] 41 VFs
[23:47:42] [PASSED] 42 VFs
[23:47:42] [PASSED] 43 VFs
[23:47:42] [PASSED] 44 VFs
[23:47:42] [PASSED] 45 VFs
[23:47:42] [PASSED] 46 VFs
[23:47:42] [PASSED] 47 VFs
[23:47:42] [PASSED] 48 VFs
[23:47:42] [PASSED] 49 VFs
[23:47:42] [PASSED] 50 VFs
[23:47:42] [PASSED] 51 VFs
[23:47:42] [PASSED] 52 VFs
[23:47:42] [PASSED] 53 VFs
[23:47:42] [PASSED] 54 VFs
[23:47:42] [PASSED] 55 VFs
[23:47:42] [PASSED] 56 VFs
[23:47:42] [PASSED] 57 VFs
[23:47:42] [PASSED] 58 VFs
[23:47:42] [PASSED] 59 VFs
[23:47:42] [PASSED] 60 VFs
[23:47:42] [PASSED] 61 VFs
[23:47:42] [PASSED] 62 VFs
[23:47:42] [PASSED] 63 VFs
[23:47:42] ================= [PASSED] fair_doorbells ==================
[23:47:42] ======================== fair_ggtt  ========================
[23:47:42] [PASSED] 1 VF
[23:47:42] [PASSED] 2 VFs
[23:47:42] [PASSED] 3 VFs
[23:47:42] [PASSED] 4 VFs
[23:47:42] [PASSED] 5 VFs
[23:47:42] [PASSED] 6 VFs
[23:47:42] [PASSED] 7 VFs
[23:47:42] [PASSED] 8 VFs
[23:47:42] [PASSED] 9 VFs
[23:47:42] [PASSED] 10 VFs
[23:47:42] [PASSED] 11 VFs
[23:47:42] [PASSED] 12 VFs
[23:47:42] [PASSED] 13 VFs
[23:47:42] [PASSED] 14 VFs
[23:47:42] [PASSED] 15 VFs
[23:47:42] [PASSED] 16 VFs
[23:47:42] [PASSED] 17 VFs
[23:47:42] [PASSED] 18 VFs
[23:47:42] [PASSED] 19 VFs
[23:47:42] [PASSED] 20 VFs
[23:47:42] [PASSED] 21 VFs
[23:47:42] [PASSED] 22 VFs
[23:47:42] [PASSED] 23 VFs
[23:47:42] [PASSED] 24 VFs
[23:47:42] [PASSED] 25 VFs
[23:47:42] [PASSED] 26 VFs
[23:47:42] [PASSED] 27 VFs
[23:47:42] [PASSED] 28 VFs
[23:47:42] [PASSED] 29 VFs
[23:47:42] [PASSED] 30 VFs
[23:47:42] [PASSED] 31 VFs
[23:47:42] [PASSED] 32 VFs
[23:47:42] [PASSED] 33 VFs
[23:47:42] [PASSED] 34 VFs
[23:47:42] [PASSED] 35 VFs
[23:47:42] [PASSED] 36 VFs
[23:47:42] [PASSED] 37 VFs
[23:47:42] [PASSED] 38 VFs
[23:47:42] [PASSED] 39 VFs
[23:47:42] [PASSED] 40 VFs
[23:47:42] [PASSED] 41 VFs
[23:47:42] [PASSED] 42 VFs
[23:47:42] [PASSED] 43 VFs
[23:47:42] [PASSED] 44 VFs
[23:47:42] [PASSED] 45 VFs
[23:47:42] [PASSED] 46 VFs
[23:47:42] [PASSED] 47 VFs
[23:47:42] [PASSED] 48 VFs
[23:47:42] [PASSED] 49 VFs
[23:47:42] [PASSED] 50 VFs
[23:47:42] [PASSED] 51 VFs
[23:47:42] [PASSED] 52 VFs
[23:47:42] [PASSED] 53 VFs
[23:47:42] [PASSED] 54 VFs
[23:47:42] [PASSED] 55 VFs
[23:47:42] [PASSED] 56 VFs
[23:47:42] [PASSED] 57 VFs
[23:47:42] [PASSED] 58 VFs
[23:47:42] [PASSED] 59 VFs
[23:47:42] [PASSED] 60 VFs
[23:47:42] [PASSED] 61 VFs
[23:47:42] [PASSED] 62 VFs
[23:47:42] [PASSED] 63 VFs
[23:47:42] ==================== [PASSED] fair_ggtt ====================
[23:47:42] ======================== fair_vram  ========================
[23:47:42] [PASSED] 1 VF
[23:47:42] [PASSED] 2 VFs
[23:47:42] [PASSED] 3 VFs
[23:47:42] [PASSED] 4 VFs
[23:47:42] [PASSED] 5 VFs
[23:47:42] [PASSED] 6 VFs
[23:47:42] [PASSED] 7 VFs
[23:47:42] [PASSED] 8 VFs
[23:47:42] [PASSED] 9 VFs
[23:47:42] [PASSED] 10 VFs
[23:47:42] [PASSED] 11 VFs
[23:47:42] [PASSED] 12 VFs
[23:47:42] [PASSED] 13 VFs
[23:47:42] [PASSED] 14 VFs
[23:47:42] [PASSED] 15 VFs
[23:47:42] [PASSED] 16 VFs
[23:47:42] [PASSED] 17 VFs
[23:47:42] [PASSED] 18 VFs
[23:47:42] [PASSED] 19 VFs
[23:47:42] [PASSED] 20 VFs
[23:47:42] [PASSED] 21 VFs
[23:47:42] [PASSED] 22 VFs
[23:47:42] [PASSED] 23 VFs
[23:47:42] [PASSED] 24 VFs
[23:47:42] [PASSED] 25 VFs
[23:47:42] [PASSED] 26 VFs
[23:47:42] [PASSED] 27 VFs
[23:47:42] [PASSED] 28 VFs
[23:47:42] [PASSED] 29 VFs
[23:47:42] [PASSED] 30 VFs
[23:47:42] [PASSED] 31 VFs
[23:47:42] [PASSED] 32 VFs
[23:47:42] [PASSED] 33 VFs
[23:47:42] [PASSED] 34 VFs
[23:47:42] [PASSED] 35 VFs
[23:47:42] [PASSED] 36 VFs
[23:47:42] [PASSED] 37 VFs
[23:47:42] [PASSED] 38 VFs
[23:47:42] [PASSED] 39 VFs
[23:47:42] [PASSED] 40 VFs
[23:47:42] [PASSED] 41 VFs
[23:47:42] [PASSED] 42 VFs
[23:47:42] [PASSED] 43 VFs
[23:47:42] [PASSED] 44 VFs
[23:47:42] [PASSED] 45 VFs
[23:47:42] [PASSED] 46 VFs
[23:47:42] [PASSED] 47 VFs
[23:47:42] [PASSED] 48 VFs
[23:47:42] [PASSED] 49 VFs
[23:47:42] [PASSED] 50 VFs
[23:47:42] [PASSED] 51 VFs
[23:47:42] [PASSED] 52 VFs
[23:47:42] [PASSED] 53 VFs
[23:47:42] [PASSED] 54 VFs
[23:47:42] [PASSED] 55 VFs
[23:47:42] [PASSED] 56 VFs
[23:47:42] [PASSED] 57 VFs
[23:47:42] [PASSED] 58 VFs
[23:47:42] [PASSED] 59 VFs
[23:47:42] [PASSED] 60 VFs
[23:47:42] [PASSED] 61 VFs
[23:47:42] [PASSED] 62 VFs
[23:47:42] [PASSED] 63 VFs
[23:47:42] ==================== [PASSED] fair_vram ====================
[23:47:42] ================== [PASSED] pf_gt_config ===================
[23:47:42] ===================== lmtt (1 subtest) =====================
[23:47:42] ======================== test_ops  =========================
[23:47:42] [PASSED] 2-level
[23:47:42] [PASSED] multi-level
[23:47:42] ==================== [PASSED] test_ops =====================
[23:47:42] ====================== [PASSED] lmtt =======================
[23:47:42] ================= sriov_packet (1 subtest) =================
[23:47:42] [PASSED] test_descriptor_init
[23:47:42] ================== [PASSED] sriov_packet ===================
[23:47:42] ================= pf_service (11 subtests) =================
[23:47:42] [PASSED] pf_negotiate_any
[23:47:42] [PASSED] pf_negotiate_base_match
[23:47:42] [PASSED] pf_negotiate_base_newer
[23:47:42] [PASSED] pf_negotiate_base_next
[23:47:42] [SKIPPED] pf_negotiate_base_older (no older minor)
[23:47:42] [PASSED] pf_negotiate_base_prev
[23:47:42] [PASSED] pf_negotiate_latest_match
[23:47:42] [PASSED] pf_negotiate_latest_newer
[23:47:42] [PASSED] pf_negotiate_latest_next
[23:47:42] [SKIPPED] pf_negotiate_latest_older (no older minor)
[23:47:42] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[23:47:42] =================== [PASSED] pf_service ====================
[23:47:42] ================= xe_guc_g2g (2 subtests) ==================
[23:47:42] ============== xe_live_guc_g2g_kunit_default  ==============
[23:47:42] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[23:47:42] ============== xe_live_guc_g2g_kunit_allmem  ===============
[23:47:42] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[23:47:42] =================== [SKIPPED] xe_guc_g2g ===================
[23:47:42] =================== xe_mocs (2 subtests) ===================
[23:47:42] ================ xe_live_mocs_kernel_kunit  ================
[23:47:42] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[23:47:42] ================ xe_live_mocs_reset_kunit  =================
[23:47:42] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[23:47:42] ==================== [SKIPPED] xe_mocs =====================
[23:47:42] ================= xe_migrate (2 subtests) ==================
[23:47:42] ================= xe_migrate_sanity_kunit  =================
[23:47:42] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[23:47:42] ================== xe_validate_ccs_kunit  ==================
[23:47:42] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[23:47:42] =================== [SKIPPED] xe_migrate ===================
[23:47:42] ================== xe_dma_buf (1 subtest) ==================
[23:47:42] ==================== xe_dma_buf_kunit  =====================
[23:47:42] ================ [SKIPPED] xe_dma_buf_kunit ================
[23:47:42] =================== [SKIPPED] xe_dma_buf ===================
[23:47:42] ================= xe_bo_shrink (1 subtest) =================
[23:47:42] =================== xe_bo_shrink_kunit  ====================
[23:47:42] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[23:47:42] ================== [SKIPPED] xe_bo_shrink ==================
[23:47:42] ==================== xe_bo (2 subtests) ====================
[23:47:42] ================== xe_ccs_migrate_kunit  ===================
[23:47:42] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[23:47:42] ==================== xe_bo_evict_kunit  ====================
[23:47:42] =============== [SKIPPED] xe_bo_evict_kunit ================
[23:47:42] ===================== [SKIPPED] xe_bo ======================
[23:47:42] =================== xe_any (9 subtests) ====================
[23:47:42] [PASSED] test_to_xe
[23:47:42] [PASSED] test_to_dev
[23:47:42] [PASSED] test_to_pdev
[23:47:42] [PASSED] test_to_drm
[23:47:42] [PASSED] test_if_pdev
[23:47:42] [PASSED] test_if_xe
[23:47:42] [PASSED] test_if_tile
[23:47:42] [PASSED] test_if_gt
[23:47:42] [PASSED] test_to_id
[23:47:42] ===================== [PASSED] xe_any ======================
[23:47:42] ==================== args (13 subtests) ====================
[23:47:42] [PASSED] count_args_test
[23:47:42] [PASSED] call_args_example
[23:47:42] [PASSED] call_args_test
[23:47:42] [PASSED] drop_first_arg_example
[23:47:42] [PASSED] drop_first_arg_test
[23:47:42] [PASSED] first_arg_example
[23:47:42] [PASSED] first_arg_test
[23:47:42] [PASSED] last_arg_example
[23:47:42] [PASSED] last_arg_test
[23:47:42] [PASSED] pick_arg_example
[23:47:42] [PASSED] if_args_example
[23:47:42] [PASSED] if_args_test
[23:47:42] [PASSED] sep_comma_example
[23:47:42] ====================== [PASSED] args =======================
[23:47:42] =================== xe_pci (3 subtests) ====================
[23:47:42] ==================== check_graphics_ip  ====================
[23:47:42] [PASSED] 12.00 Xe_LP
[23:47:42] [PASSED] 12.10 Xe_LP+
[23:47:42] [PASSED] 12.55 Xe_HPG
[23:47:42] [PASSED] 12.60 Xe_HPC
[23:47:42] [PASSED] 12.70 Xe_LPG
[23:47:42] [PASSED] 12.71 Xe_LPG
[23:47:42] [PASSED] 12.74 Xe_LPG+
[23:47:42] [PASSED] 20.01 Xe2_HPG
[23:47:42] [PASSED] 20.02 Xe2_HPG
[23:47:42] [PASSED] 20.04 Xe2_LPG
[23:47:42] [PASSED] 30.00 Xe3_LPG
[23:47:42] [PASSED] 30.01 Xe3_LPG
[23:47:42] [PASSED] 30.03 Xe3_LPG
[23:47:42] [PASSED] 30.04 Xe3_LPG
[23:47:42] [PASSED] 30.05 Xe3_LPG
[23:47:42] [PASSED] 35.10 Xe3p_LPG
[23:47:42] [PASSED] 35.11 Xe3p_XPC
[23:47:42] ================ [PASSED] check_graphics_ip ================
[23:47:42] ===================== check_media_ip  ======================
[23:47:42] [PASSED] 12.00 Xe_M
[23:47:42] [PASSED] 12.55 Xe_HPM
[23:47:42] [PASSED] 13.00 Xe_LPM+
[23:47:42] [PASSED] 13.01 Xe2_HPM
[23:47:42] [PASSED] 20.00 Xe2_LPM
[23:47:42] [PASSED] 30.00 Xe3_LPM
[23:47:42] [PASSED] 30.02 Xe3_LPM
[23:47:42] [PASSED] 35.00 Xe3p_LPM
[23:47:42] [PASSED] 35.03 Xe3p_HPM
[23:47:42] ================= [PASSED] check_media_ip ==================
[23:47:42] =================== check_platform_desc  ===================
[23:47:42] [PASSED] 0x9A60 (TIGERLAKE)
[23:47:42] [PASSED] 0x9A68 (TIGERLAKE)
[23:47:42] [PASSED] 0x9A70 (TIGERLAKE)
[23:47:42] [PASSED] 0x9A40 (TIGERLAKE)
[23:47:42] [PASSED] 0x9A49 (TIGERLAKE)
[23:47:42] [PASSED] 0x9A59 (TIGERLAKE)
[23:47:42] [PASSED] 0x9A78 (TIGERLAKE)
[23:47:42] [PASSED] 0x9AC0 (TIGERLAKE)
[23:47:42] [PASSED] 0x9AC9 (TIGERLAKE)
[23:47:42] [PASSED] 0x9AD9 (TIGERLAKE)
[23:47:42] [PASSED] 0x9AF8 (TIGERLAKE)
[23:47:42] [PASSED] 0x4C80 (ROCKETLAKE)
[23:47:42] [PASSED] 0x4C8A (ROCKETLAKE)
[23:47:42] [PASSED] 0x4C8B (ROCKETLAKE)
[23:47:42] [PASSED] 0x4C8C (ROCKETLAKE)
[23:47:42] [PASSED] 0x4C90 (ROCKETLAKE)
[23:47:42] [PASSED] 0x4C9A (ROCKETLAKE)
[23:47:42] [PASSED] 0x4680 (ALDERLAKE_S)
[23:47:42] [PASSED] 0x4682 (ALDERLAKE_S)
[23:47:42] [PASSED] 0x4688 (ALDERLAKE_S)
[23:47:42] [PASSED] 0x468A (ALDERLAKE_S)
[23:47:42] [PASSED] 0x468B (ALDERLAKE_S)
[23:47:42] [PASSED] 0x4690 (ALDERLAKE_S)
[23:47:42] [PASSED] 0x4692 (ALDERLAKE_S)
[23:47:42] [PASSED] 0x4693 (ALDERLAKE_S)
[23:47:42] [PASSED] 0x46A0 (ALDERLAKE_P)
[23:47:42] [PASSED] 0x46A1 (ALDERLAKE_P)
[23:47:42] [PASSED] 0x46A2 (ALDERLAKE_P)
[23:47:42] [PASSED] 0x46A3 (ALDERLAKE_P)
[23:47:42] [PASSED] 0x46A6 (ALDERLAKE_P)
[23:47:42] [PASSED] 0x46A8 (ALDERLAKE_P)
[23:47:42] [PASSED] 0x46AA (ALDERLAKE_P)
[23:47:42] [PASSED] 0x462A (ALDERLAKE_P)
[23:47:42] [PASSED] 0x4626 (ALDERLAKE_P)
[23:47:42] [PASSED] 0x4628 (ALDERLAKE_P)
[23:47:42] [PASSED] 0x46B0 (ALDERLAKE_P)
[23:47:42] [PASSED] 0x46B1 (ALDERLAKE_P)
[23:47:42] [PASSED] 0x46B2 (ALDERLAKE_P)
[23:47:42] [PASSED] 0x46B3 (ALDERLAKE_P)
[23:47:42] [PASSED] 0x46C0 (ALDERLAKE_P)
[23:47:42] [PASSED] 0x46C1 (ALDERLAKE_P)
[23:47:42] [PASSED] 0x46C2 (ALDERLAKE_P)
[23:47:42] [PASSED] 0x46C3 (ALDERLAKE_P)
[23:47:42] [PASSED] 0x46D0 (ALDERLAKE_N)
[23:47:42] [PASSED] 0x46D1 (ALDERLAKE_N)
[23:47:42] [PASSED] 0x46D2 (ALDERLAKE_N)
[23:47:42] [PASSED] 0x46D3 (ALDERLAKE_N)
[23:47:42] [PASSED] 0x46D4 (ALDERLAKE_N)
[23:47:42] [PASSED] 0xA721 (ALDERLAKE_P)
[23:47:42] [PASSED] 0xA7A1 (ALDERLAKE_P)
[23:47:42] [PASSED] 0xA7A9 (ALDERLAKE_P)
[23:47:42] [PASSED] 0xA7AC (ALDERLAKE_P)
[23:47:42] [PASSED] 0xA7AD (ALDERLAKE_P)
[23:47:42] [PASSED] 0xA720 (ALDERLAKE_P)
[23:47:42] [PASSED] 0xA7A0 (ALDERLAKE_P)
[23:47:42] [PASSED] 0xA7A8 (ALDERLAKE_P)
[23:47:42] [PASSED] 0xA7AA (ALDERLAKE_P)
[23:47:42] [PASSED] 0xA7AB (ALDERLAKE_P)
[23:47:42] [PASSED] 0xA780 (ALDERLAKE_S)
[23:47:42] [PASSED] 0xA781 (ALDERLAKE_S)
[23:47:42] [PASSED] 0xA782 (ALDERLAKE_S)
[23:47:42] [PASSED] 0xA783 (ALDERLAKE_S)
[23:47:42] [PASSED] 0xA788 (ALDERLAKE_S)
[23:47:42] [PASSED] 0xA789 (ALDERLAKE_S)
[23:47:42] [PASSED] 0xA78A (ALDERLAKE_S)
[23:47:42] [PASSED] 0xA78B (ALDERLAKE_S)
[23:47:42] [PASSED] 0x4905 (DG1)
[23:47:42] [PASSED] 0x4906 (DG1)
[23:47:42] [PASSED] 0x4907 (DG1)
[23:47:42] [PASSED] 0x4908 (DG1)
[23:47:42] [PASSED] 0x4909 (DG1)
[23:47:42] [PASSED] 0x56C0 (DG2)
[23:47:42] [PASSED] 0x56C2 (DG2)
[23:47:42] [PASSED] 0x56C1 (DG2)
[23:47:42] [PASSED] 0x7D51 (METEORLAKE)
[23:47:42] [PASSED] 0x7DD1 (METEORLAKE)
[23:47:42] [PASSED] 0x7D41 (METEORLAKE)
[23:47:42] [PASSED] 0x7D67 (METEORLAKE)
[23:47:42] [PASSED] 0xB640 (METEORLAKE)
[23:47:42] [PASSED] 0x56A0 (DG2)
[23:47:42] [PASSED] 0x56A1 (DG2)
[23:47:42] [PASSED] 0x56A2 (DG2)
[23:47:42] [PASSED] 0x56BE (DG2)
[23:47:42] [PASSED] 0x56BF (DG2)
[23:47:42] [PASSED] 0x5690 (DG2)
[23:47:42] [PASSED] 0x5691 (DG2)
[23:47:42] [PASSED] 0x5692 (DG2)
[23:47:42] [PASSED] 0x56A5 (DG2)
[23:47:42] [PASSED] 0x56A6 (DG2)
[23:47:42] [PASSED] 0x56B0 (DG2)
[23:47:42] [PASSED] 0x56B1 (DG2)
[23:47:42] [PASSED] 0x56BA (DG2)
[23:47:42] [PASSED] 0x56BB (DG2)
[23:47:42] [PASSED] 0x56BC (DG2)
[23:47:42] [PASSED] 0x56BD (DG2)
[23:47:42] [PASSED] 0x5693 (DG2)
[23:47:42] [PASSED] 0x5694 (DG2)
[23:47:42] [PASSED] 0x5695 (DG2)
[23:47:42] [PASSED] 0x56A3 (DG2)
[23:47:42] [PASSED] 0x56A4 (DG2)
[23:47:42] [PASSED] 0x56B2 (DG2)
[23:47:42] [PASSED] 0x56B3 (DG2)
[23:47:42] [PASSED] 0x5696 (DG2)
[23:47:42] [PASSED] 0x5697 (DG2)
[23:47:42] [PASSED] 0xB69 (PVC)
[23:47:42] [PASSED] 0xB6E (PVC)
[23:47:42] [PASSED] 0xBD4 (PVC)
[23:47:42] [PASSED] 0xBD5 (PVC)
[23:47:42] [PASSED] 0xBD6 (PVC)
[23:47:42] [PASSED] 0xBD7 (PVC)
[23:47:42] [PASSED] 0xBD8 (PVC)
[23:47:42] [PASSED] 0xBD9 (PVC)
[23:47:42] [PASSED] 0xBDA (PVC)
[23:47:42] [PASSED] 0xBDB (PVC)
[23:47:42] [PASSED] 0xBE0 (PVC)
[23:47:42] [PASSED] 0xBE1 (PVC)
[23:47:42] [PASSED] 0xBE5 (PVC)
[23:47:42] [PASSED] 0x7D40 (METEORLAKE)
[23:47:42] [PASSED] 0x7D45 (METEORLAKE)
[23:47:42] [PASSED] 0x7D55 (METEORLAKE)
[23:47:42] [PASSED] 0x7D60 (METEORLAKE)
[23:47:42] [PASSED] 0x7DD5 (METEORLAKE)
[23:47:42] [PASSED] 0x6420 (LUNARLAKE)
[23:47:42] [PASSED] 0x64A0 (LUNARLAKE)
[23:47:42] [PASSED] 0x64B0 (LUNARLAKE)
[23:47:42] [PASSED] 0xE202 (BATTLEMAGE)
[23:47:42] [PASSED] 0xE209 (BATTLEMAGE)
[23:47:42] [PASSED] 0xE20B (BATTLEMAGE)
[23:47:42] [PASSED] 0xE20C (BATTLEMAGE)
[23:47:42] [PASSED] 0xE20D (BATTLEMAGE)
[23:47:42] [PASSED] 0xE210 (BATTLEMAGE)
[23:47:42] [PASSED] 0xE211 (BATTLEMAGE)
[23:47:42] [PASSED] 0xE212 (BATTLEMAGE)
[23:47:42] [PASSED] 0xE216 (BATTLEMAGE)
[23:47:42] [PASSED] 0xE220 (BATTLEMAGE)
[23:47:42] [PASSED] 0xE221 (BATTLEMAGE)
[23:47:42] [PASSED] 0xE222 (BATTLEMAGE)
[23:47:42] [PASSED] 0xE223 (BATTLEMAGE)
[23:47:42] [PASSED] 0xB080 (PANTHERLAKE)
[23:47:42] [PASSED] 0xB081 (PANTHERLAKE)
[23:47:42] [PASSED] 0xB082 (PANTHERLAKE)
[23:47:42] [PASSED] 0xB083 (PANTHERLAKE)
[23:47:42] [PASSED] 0xB084 (PANTHERLAKE)
[23:47:42] [PASSED] 0xB085 (PANTHERLAKE)
[23:47:42] [PASSED] 0xB086 (PANTHERLAKE)
[23:47:42] [PASSED] 0xB087 (PANTHERLAKE)
[23:47:42] [PASSED] 0xB08F (PANTHERLAKE)
[23:47:42] [PASSED] 0xB090 (PANTHERLAKE)
[23:47:42] [PASSED] 0xB0A0 (PANTHERLAKE)
[23:47:42] [PASSED] 0xB0B0 (PANTHERLAKE)
[23:47:42] [PASSED] 0xFD80 (PANTHERLAKE)
[23:47:42] [PASSED] 0xFD81 (PANTHERLAKE)
[23:47:42] [PASSED] 0xD740 (NOVALAKE_S)
[23:47:42] [PASSED] 0xD741 (NOVALAKE_S)
[23:47:42] [PASSED] 0xD742 (NOVALAKE_S)
[23:47:42] [PASSED] 0xD743 (NOVALAKE_S)
[23:47:42] [PASSED] 0xD745 (NOVALAKE_S)
[23:47:42] [PASSED] 0xD74A (NOVALAKE_S)
[23:47:42] [PASSED] 0xD74B (NOVALAKE_S)
[23:47:42] [PASSED] 0x674C (CRESCENTISLAND)
[23:47:42] [PASSED] 0x674D (CRESCENTISLAND)
[23:47:42] [PASSED] 0x674E (CRESCENTISLAND)
[23:47:42] [PASSED] 0x674F (CRESCENTISLAND)
[23:47:42] [PASSED] 0x6750 (CRESCENTISLAND)
[23:47:42] [PASSED] 0xD750 (NOVALAKE_P)
[23:47:42] [PASSED] 0xD751 (NOVALAKE_P)
[23:47:42] [PASSED] 0xD752 (NOVALAKE_P)
[23:47:42] [PASSED] 0xD753 (NOVALAKE_P)
[23:47:42] [PASSED] 0xD754 (NOVALAKE_P)
[23:47:42] [PASSED] 0xD755 (NOVALAKE_P)
[23:47:42] [PASSED] 0xD756 (NOVALAKE_P)
[23:47:42] [PASSED] 0xD757 (NOVALAKE_P)
[23:47:42] [PASSED] 0xD75F (NOVALAKE_P)
[23:47:42] =============== [PASSED] check_platform_desc ===============
[23:47:42] ===================== [PASSED] xe_pci ======================
[23:47:42] ============= xe_rtp_tables_test (5 subtests) ==============
[23:47:42] ================== xe_rtp_table_gt_test  ===================
[23:47:42] [PASSED] gt_was/14011060649
[23:47:42] [PASSED] gt_was/14011059788
[23:47:42] [PASSED] gt_was/14015795083
[23:47:42] [PASSED] gt_was/16021867713
[23:47:42] [PASSED] gt_was/14019449301
[23:47:42] [PASSED] gt_was/16028005424
[23:47:42] [PASSED] gt_was/14026578760
[23:47:42] [PASSED] gt_was/1409420604
[23:47:42] [PASSED] gt_was/1408615072
[23:47:42] [PASSED] gt_was/22010523718
[23:47:42] [PASSED] gt_was/14011006942
[23:47:42] [PASSED] gt_was/14014830051
[23:47:42] [PASSED] gt_was/18018781329
[23:47:42] [PASSED] gt_was/1509235366
[23:47:42] [PASSED] gt_was/18018781329
[23:47:42] [PASSED] gt_was/16016694945
[23:47:42] [PASSED] gt_was/14018575942
[23:47:42] [PASSED] gt_was/22016670082
[23:47:42] [PASSED] gt_was/22016670082
[23:47:42] [PASSED] gt_was/14017421178
[23:47:42] [PASSED] gt_was/16025250150
[23:47:42] [PASSED] gt_was/14021871409
[23:47:42] [PASSED] gt_was/16021865536
[23:47:42] [PASSED] gt_was/14021486841
[23:47:42] [PASSED] gt_was/14025160223
[23:47:42] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[23:47:42] [PASSED] gt_was/14025635424
[23:47:42] [PASSED] gt_was/16028005424
[23:47:42] ============== [PASSED] xe_rtp_table_gt_test ===============
[23:47:42] ================== xe_rtp_table_gt_test  ===================
[23:47:42] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[23:47:42] [PASSED] gt_tunings/Tuning: 32B Access Enable
[23:47:42] [PASSED] gt_tunings/Tuning: L3 cache
[23:47:42] [PASSED] gt_tunings/Tuning: L3 cache - media
[23:47:42] [PASSED] gt_tunings/Tuning: Compression Overfetch
[23:47:42] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[23:47:42] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[23:47:42] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[23:47:42] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[23:47:42] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[23:47:42] [PASSED] gt_tunings/Tuning: Stateless compression control
[23:47:42] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[23:47:42] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[23:47:42] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[23:47:42] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[23:47:42] ============== [PASSED] xe_rtp_table_gt_test ===============
[23:47:42] ================== xe_rtp_table_oob_test  ==================
[23:47:42] [PASSED] oob_was/1607983814
[23:47:42] [PASSED] oob_was/16010904313
[23:47:42] [PASSED] oob_was/18022495364
[23:47:42] [PASSED] oob_was/22012773006
[23:47:42] [PASSED] oob_was/14014475959
[23:47:42] [PASSED] oob_was/22011391025
[23:47:42] [PASSED] oob_was/22012727170
[23:47:42] [PASSED] oob_was/22012727685
[23:47:42] [PASSED] oob_was/22016596838
[23:47:42] [PASSED] oob_was/18020744125
[23:47:42] [PASSED] oob_was/1409600907
[23:47:42] [PASSED] oob_was/22014953428
[23:47:42] [PASSED] oob_was/16017236439
[23:47:42] [PASSED] oob_was/14019821291
[23:47:42] [PASSED] oob_was/14015076503
[23:47:42] [PASSED] oob_was/14018913170
[23:47:42] [PASSED] oob_was/14018094691
[23:47:42] [PASSED] oob_was/18024947630
[23:47:42] [PASSED] oob_was/16022287689
[23:47:42] [PASSED] oob_was/13011645652
[23:47:42] [PASSED] oob_was/14022293748
[23:47:42] [PASSED] oob_was/22019794406
[23:47:42] [PASSED] oob_was/22019338487
[23:47:42] [PASSED] oob_was/16023588340
[23:47:42] [PASSED] oob_was/14019789679
[23:47:42] [PASSED] oob_was/14022866841
[23:47:42] [PASSED] oob_was/16021333562
[23:47:42] [PASSED] oob_was/14016712196
[23:47:42] [PASSED] oob_was/14015568240
[23:47:42] [PASSED] oob_was/18013179988
[23:47:42] [PASSED] oob_was/1508761755
[23:47:42] [PASSED] oob_was/16023105232
[23:47:42] [PASSED] oob_was/16026508708
[23:47:42] [PASSED] oob_was/14020001231
[23:47:42] [PASSED] oob_was/16023683509
[23:47:42] [PASSED] oob_was/14025515070
[23:47:42] [PASSED] oob_was/15015404425_disable
[23:47:42] [PASSED] oob_was/16026007364
[23:47:42] [PASSED] oob_was/14020316580
[23:47:42] [PASSED] oob_was/14025883347
[23:47:42] [PASSED] oob_was/16029380221
[23:47:42] [PASSED] oob_was/22022079272
[23:47:42] [PASSED] oob_was/16029897822
[23:47:42] [PASSED] oob_was/14027054324
[23:47:42] ============== [PASSED] xe_rtp_table_oob_test ==============
[23:47:42] ================ xe_rtp_table_dev_oob_test  ================
[23:47:42] [PASSED] device_oob_was/22010954014
[23:47:42] [PASSED] device_oob_was/15015404425
[23:47:42] [PASSED] device_oob_was/22019338487_display
[23:47:42] [PASSED] device_oob_was/14022085890
[23:47:42] [PASSED] device_oob_was/14026539277
[23:47:42] [PASSED] device_oob_was/14026633728
[23:47:42] [PASSED] device_oob_was/14026746987
[23:47:42] [PASSED] device_oob_was/14026779378
[23:47:42] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[23:47:42] ========== xe_rtp_table_missing_upper_bound_test  ==========
[23:47:42] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[23:47:42] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[23:47:42] [PASSED] register_whitelist/1806527549
[23:47:42] [PASSED] register_whitelist/allow_read_ctx_timestamp
[23:47:42] [PASSED] register_whitelist/allow_read_queue_timestamp
[23:47:42] [PASSED] register_whitelist/16014440446
[23:47:42] [PASSED] register_whitelist/16017236439
[23:47:42] [PASSED] register_whitelist/16020183090
[23:47:42] [PASSED] register_whitelist/14024997852
[23:47:42] [PASSED] register_whitelist/14024997852
[23:47:42] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[23:47:42] =============== [PASSED] xe_rtp_tables_test ================
[23:47:42] =================== xe_rtp (3 subtests) ====================
[23:47:42] =================== xe_rtp_rules_tests  ====================
[23:47:42] [PASSED] no
[23:47:42] [PASSED] yes
[23:47:42] [PASSED] no-and-no
[23:47:42] [PASSED] no-and-yes
[23:47:42] [PASSED] yes-and-no
[23:47:42] [PASSED] yes-and-yes
[23:47:42] [PASSED] no-or-no
[23:47:42] [PASSED] no-or-yes
[23:47:42] [PASSED] yes-or-no
[23:47:42] [PASSED] yes-or-yes
[23:47:42] [PASSED] no-yes-or-yes-no
[23:47:42] [PASSED] no-yes-or-yes-yes
[23:47:42] [PASSED] yes-yes-or-no-yes
[23:47:42] [PASSED] yes-yes-or-yes-yes
[23:47:42] [PASSED] no-no-or-yes-or-no
[23:47:42] [PASSED] or
[23:47:42] [PASSED] or-yes
[23:47:42] [PASSED] or-no
[23:47:42] [PASSED] yes-or
[23:47:42] [PASSED] no-or
[23:47:42] [PASSED] no-or-or-yes
[23:47:42] [PASSED] yes-or-or-no
[23:47:42] [PASSED] no-or-or-no
[23:47:42] [PASSED] missing-context-engine-class
[23:47:42] [PASSED] missing-context-engine-class-or-yes
[23:47:42] [PASSED] missing-context-engine-class-or-or-yes
[23:47:42] =============== [PASSED] xe_rtp_rules_tests ================
[23:47:42] =============== xe_rtp_process_to_sr_tests  ================
[23:47:42] [PASSED] coalesce-same-reg
[23:47:42] [PASSED] coalesce-same-reg-literal-and-func
[23:47:42] [PASSED] no-match-no-add
[23:47:42] [PASSED] two-regs-two-entries
[23:47:42] [PASSED] clr-one-set-other
[23:47:42] [PASSED] set-field
[23:47:42] [PASSED] conflict-duplicate
[23:47:42] [PASSED] conflict-not-disjoint
[23:47:42] [PASSED] conflict-not-disjoint-literal-and-func
[23:47:42] [PASSED] conflict-reg-type
[23:47:42] [PASSED] bad-mcr-reg-forced-to-regular
[23:47:42] [PASSED] bad-regular-reg-forced-to-mcr
[23:47:42] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[23:47:42] ================== xe_rtp_process_tests  ===================
[23:47:42] [PASSED] active1
[23:47:42] [PASSED] active2
[23:47:42] [PASSED] active-inactive
[23:47:42] [PASSED] inactive-active
[23:47:42] [PASSED] inactive-active-inactive
[23:47:42] [PASSED] inactive-inactive-inactive
[23:47:42] ============== [PASSED] xe_rtp_process_tests ===============
[23:47:42] ===================== [PASSED] xe_rtp ======================
[23:47:42] ==================== xe_wa (1 subtest) =====================
[23:47:42] ======================== xe_wa_gt  =========================
[23:47:42] [PASSED] TIGERLAKE B0
[23:47:42] [PASSED] DG1 A0
[23:47:42] [PASSED] DG1 B0
[23:47:42] [PASSED] ALDERLAKE_S A0
[23:47:42] [PASSED] ALDERLAKE_S B0
[23:47:42] [PASSED] ALDERLAKE_S C0
[23:47:42] [PASSED] ALDERLAKE_S D0
[23:47:42] [PASSED] ALDERLAKE_P A0
[23:47:42] [PASSED] ALDERLAKE_P B0
[23:47:42] [PASSED] ALDERLAKE_P C0
[23:47:42] [PASSED] ALDERLAKE_S RPLS D0
[23:47:42] [PASSED] ALDERLAKE_P RPLU E0
[23:47:42] [PASSED] DG2 G10 C0
[23:47:42] [PASSED] DG2 G11 B1
[23:47:42] [PASSED] DG2 G12 A1
[23:47:42] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[23:47:42] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[23:47:42] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[23:47:42] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[23:47:42] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[23:47:42] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[23:47:42] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[23:47:42] ==================== [PASSED] xe_wa_gt =====================
[23:47:42] ====================== [PASSED] xe_wa ======================
[23:47:42] ============================================================
[23:47:42] Testing complete. Ran 793 tests: passed: 765, skipped: 28
[23:47:42] Elapsed time: 41.014s total, 1.788s configuring, 38.509s building, 0.684s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[23:47:42] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:47:44] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[23:48:09] Starting KUnit Kernel (1/1)...
[23:48:09] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:48:09] ============= refcount_interrupt (4 subtests) ==============
[23:48:09] [PASSED] test_single_irq_change
[23:48:09] [PASSED] test_nested_irq_change
[23:48:09] [PASSED] test_multiple_irq_change
[23:48:09] [PASSED] test_irq_save
[23:48:09] =============== [PASSED] refcount_interrupt ================
[23:48:09] ============ drm_test_pick_cmdline (2 subtests) ============
[23:48:09] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[23:48:09] =============== drm_test_pick_cmdline_named  ===============
[23:48:09] [PASSED] NTSC
[23:48:09] [PASSED] NTSC-J
[23:48:09] [PASSED] PAL
[23:48:09] [PASSED] PAL-M
[23:48:09] =========== [PASSED] drm_test_pick_cmdline_named ===========
[23:48:09] ============== [PASSED] drm_test_pick_cmdline ==============
[23:48:09] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[23:48:09] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[23:48:09] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[23:48:09] =========== drm_validate_clone_mode (2 subtests) ===========
[23:48:09] ============== drm_test_check_in_clone_mode  ===============
[23:48:09] [PASSED] in_clone_mode
[23:48:09] [PASSED] not_in_clone_mode
[23:48:09] ========== [PASSED] drm_test_check_in_clone_mode ===========
[23:48:09] =============== drm_test_check_valid_clones  ===============
[23:48:09] [PASSED] not_in_clone_mode
[23:48:09] [PASSED] valid_clone
[23:48:09] [PASSED] invalid_clone
[23:48:09] =========== [PASSED] drm_test_check_valid_clones ===========
[23:48:09] ============= [PASSED] drm_validate_clone_mode =============
[23:48:09] ============= drm_validate_modeset (1 subtest) =============
[23:48:09] [PASSED] drm_test_check_connector_changed_modeset
[23:48:09] ============== [PASSED] drm_validate_modeset ===============
[23:48:09] ====== drm_test_bridge_get_current_state (1 subtest) =======
[23:48:09] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[23:48:09] ======== [PASSED] drm_test_bridge_get_current_state ========
[23:48:09] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[23:48:09] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[23:48:09] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[23:48:09] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[23:48:09] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[23:48:09] ============== drm_bridge_alloc (2 subtests) ===============
[23:48:09] [PASSED] drm_test_drm_bridge_alloc_basic
[23:48:09] [PASSED] drm_test_drm_bridge_alloc_get_put
[23:48:09] ================ [PASSED] drm_bridge_alloc =================
[23:48:09] ============= drm_bridge_bus_fmt (5 subtests) ==============
[23:48:09] [PASSED] drm_test_bridge_rgb_yuv_rgb
[23:48:09] [PASSED] drm_test_bridge_must_convert_to_yuv444
[23:48:09] [PASSED] drm_test_bridge_hdmi_auto_rgb
[23:48:09] [PASSED] drm_test_bridge_auto_first
[23:48:09] [PASSED] drm_test_bridge_rgb_yuv_no_path
[23:48:09] =============== [PASSED] drm_bridge_bus_fmt ================
[23:48:09] ============= drm_cmdline_parser (40 subtests) =============
[23:48:09] [PASSED] drm_test_cmdline_force_d_only
[23:48:09] [PASSED] drm_test_cmdline_force_D_only_dvi
[23:48:09] [PASSED] drm_test_cmdline_force_D_only_hdmi
[23:48:09] [PASSED] drm_test_cmdline_force_D_only_not_digital
[23:48:09] [PASSED] drm_test_cmdline_force_e_only
[23:48:09] [PASSED] drm_test_cmdline_res
[23:48:09] [PASSED] drm_test_cmdline_res_vesa
[23:48:09] [PASSED] drm_test_cmdline_res_vesa_rblank
[23:48:09] [PASSED] drm_test_cmdline_res_rblank
[23:48:09] [PASSED] drm_test_cmdline_res_bpp
[23:48:09] [PASSED] drm_test_cmdline_res_refresh
[23:48:09] [PASSED] drm_test_cmdline_res_bpp_refresh
[23:48:09] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[23:48:09] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[23:48:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[23:48:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[23:48:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[23:48:09] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[23:48:09] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[23:48:09] [PASSED] drm_test_cmdline_res_margins_force_on
[23:48:09] [PASSED] drm_test_cmdline_res_vesa_margins
[23:48:09] [PASSED] drm_test_cmdline_name
[23:48:09] [PASSED] drm_test_cmdline_name_bpp
[23:48:09] [PASSED] drm_test_cmdline_name_option
[23:48:09] [PASSED] drm_test_cmdline_name_bpp_option
[23:48:09] [PASSED] drm_test_cmdline_rotate_0
[23:48:09] [PASSED] drm_test_cmdline_rotate_90
[23:48:09] [PASSED] drm_test_cmdline_rotate_180
[23:48:09] [PASSED] drm_test_cmdline_rotate_270
[23:48:09] [PASSED] drm_test_cmdline_hmirror
[23:48:09] [PASSED] drm_test_cmdline_vmirror
[23:48:09] [PASSED] drm_test_cmdline_margin_options
[23:48:09] [PASSED] drm_test_cmdline_multiple_options
[23:48:09] [PASSED] drm_test_cmdline_bpp_extra_and_option
[23:48:09] [PASSED] drm_test_cmdline_extra_and_option
[23:48:09] [PASSED] drm_test_cmdline_freestanding_options
[23:48:09] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[23:48:09] [PASSED] drm_test_cmdline_panel_orientation
[23:48:09] ================ drm_test_cmdline_invalid  =================
[23:48:09] [PASSED] margin_only
[23:48:09] [PASSED] interlace_only
[23:48:09] [PASSED] res_missing_x
[23:48:09] [PASSED] res_missing_y
[23:48:09] [PASSED] res_bad_y
[23:48:09] [PASSED] res_missing_y_bpp
[23:48:09] [PASSED] res_bad_bpp
[23:48:09] [PASSED] res_bad_refresh
[23:48:09] [PASSED] res_bpp_refresh_force_on_off
[23:48:09] [PASSED] res_invalid_mode
[23:48:09] [PASSED] res_bpp_wrong_place_mode
[23:48:09] [PASSED] name_bpp_refresh
[23:48:09] [PASSED] name_refresh
[23:48:09] [PASSED] name_refresh_wrong_mode
[23:48:09] [PASSED] name_refresh_invalid_mode
[23:48:09] [PASSED] rotate_multiple
[23:48:09] [PASSED] rotate_invalid_val
[23:48:09] [PASSED] rotate_truncated
[23:48:09] [PASSED] invalid_option
[23:48:09] [PASSED] invalid_tv_option
[23:48:09] [PASSED] truncated_tv_option
[23:48:09] ============ [PASSED] drm_test_cmdline_invalid =============
[23:48:09] =============== drm_test_cmdline_tv_options  ===============
[23:48:09] [PASSED] NTSC
[23:48:09] [PASSED] NTSC_443
[23:48:09] [PASSED] NTSC_J
[23:48:09] [PASSED] PAL
[23:48:09] [PASSED] PAL_M
[23:48:09] [PASSED] PAL_N
[23:48:09] [PASSED] SECAM
[23:48:09] [PASSED] MONO_525
[23:48:09] [PASSED] MONO_625
[23:48:09] =========== [PASSED] drm_test_cmdline_tv_options ===========
[23:48:09] =============== [PASSED] drm_cmdline_parser ================
[23:48:09] ========== drmm_connector_hdmi_init (20 subtests) ==========
[23:48:09] [PASSED] drm_test_connector_hdmi_init_valid
[23:48:09] [PASSED] drm_test_connector_hdmi_init_bpc_8
[23:48:09] [PASSED] drm_test_connector_hdmi_init_bpc_10
[23:48:09] [PASSED] drm_test_connector_hdmi_init_bpc_12
[23:48:09] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[23:48:09] [PASSED] drm_test_connector_hdmi_init_bpc_null
[23:48:09] [PASSED] drm_test_connector_hdmi_init_formats_empty
[23:48:09] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[23:48:09] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[23:48:09] [PASSED] supported_formats=0x9 yuv420_allowed=1
[23:48:09] [PASSED] supported_formats=0x9 yuv420_allowed=0
[23:48:09] [PASSED] supported_formats=0x5 yuv420_allowed=1
[23:48:09] [PASSED] supported_formats=0x5 yuv420_allowed=0
[23:48:09] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[23:48:09] [PASSED] drm_test_connector_hdmi_init_null_ddc
[23:48:09] [PASSED] drm_test_connector_hdmi_init_null_product
[23:48:09] [PASSED] drm_test_connector_hdmi_init_null_vendor
[23:48:09] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[23:48:09] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[23:48:09] [PASSED] drm_test_connector_hdmi_init_product_valid
[23:48:09] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[23:48:09] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[23:48:09] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[23:48:09] ========= drm_test_connector_hdmi_init_type_valid  =========
[23:48:09] [PASSED] HDMI-A
[23:48:09] [PASSED] HDMI-B
[23:48:09] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[23:48:09] ======== drm_test_connector_hdmi_init_type_invalid  ========
[23:48:09] [PASSED] Unknown
[23:48:09] [PASSED] VGA
[23:48:09] [PASSED] DVI-I
[23:48:09] [PASSED] DVI-D
[23:48:09] [PASSED] DVI-A
[23:48:09] [PASSED] Composite
[23:48:09] [PASSED] SVIDEO
[23:48:09] [PASSED] LVDS
[23:48:09] [PASSED] Component
[23:48:09] [PASSED] DIN
[23:48:09] [PASSED] DP
[23:48:09] [PASSED] TV
[23:48:09] [PASSED] eDP
[23:48:09] [PASSED] Virtual
[23:48:09] [PASSED] DSI
[23:48:09] [PASSED] DPI
[23:48:09] [PASSED] Writeback
[23:48:09] [PASSED] SPI
[23:48:09] [PASSED] USB
[23:48:09] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[23:48:09] ============ [PASSED] drmm_connector_hdmi_init =============
[23:48:09] ============= drmm_connector_init (3 subtests) =============
[23:48:09] [PASSED] drm_test_drmm_connector_init
[23:48:09] [PASSED] drm_test_drmm_connector_init_null_ddc
[23:48:09] ========= drm_test_drmm_connector_init_type_valid  =========
[23:48:09] [PASSED] Unknown
[23:48:09] [PASSED] VGA
[23:48:09] [PASSED] DVI-I
[23:48:09] [PASSED] DVI-D
[23:48:09] [PASSED] DVI-A
[23:48:09] [PASSED] Composite
[23:48:09] [PASSED] SVIDEO
[23:48:09] [PASSED] LVDS
[23:48:09] [PASSED] Component
[23:48:09] [PASSED] DIN
[23:48:09] [PASSED] DP
[23:48:09] [PASSED] HDMI-A
[23:48:09] [PASSED] HDMI-B
[23:48:09] [PASSED] TV
[23:48:09] [PASSED] eDP
[23:48:09] [PASSED] Virtual
[23:48:09] [PASSED] DSI
[23:48:09] [PASSED] DPI
[23:48:09] [PASSED] Writeback
[23:48:09] [PASSED] SPI
[23:48:09] [PASSED] USB
[23:48:09] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[23:48:09] =============== [PASSED] drmm_connector_init ===============
[23:48:09] ========= drm_connector_dynamic_init (6 subtests) ==========
[23:48:09] [PASSED] drm_test_drm_connector_dynamic_init
[23:48:09] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[23:48:09] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[23:48:09] [PASSED] drm_test_drm_connector_dynamic_init_properties
[23:48:09] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[23:48:09] [PASSED] Unknown
[23:48:09] [PASSED] VGA
[23:48:09] [PASSED] DVI-I
[23:48:09] [PASSED] DVI-D
[23:48:09] [PASSED] DVI-A
[23:48:09] [PASSED] Composite
[23:48:09] [PASSED] SVIDEO
[23:48:09] [PASSED] LVDS
[23:48:09] [PASSED] Component
[23:48:09] [PASSED] DIN
[23:48:09] [PASSED] DP
[23:48:09] [PASSED] HDMI-A
[23:48:09] [PASSED] HDMI-B
[23:48:09] [PASSED] TV
[23:48:09] [PASSED] eDP
[23:48:09] [PASSED] Virtual
[23:48:09] [PASSED] DSI
[23:48:09] [PASSED] DPI
[23:48:09] [PASSED] Writeback
[23:48:09] [PASSED] SPI
[23:48:09] [PASSED] USB
[23:48:09] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[23:48:09] ======== drm_test_drm_connector_dynamic_init_name  =========
[23:48:09] [PASSED] Unknown
[23:48:09] [PASSED] VGA
[23:48:09] [PASSED] DVI-I
[23:48:09] [PASSED] DVI-D
[23:48:09] [PASSED] DVI-A
[23:48:09] [PASSED] Composite
[23:48:09] [PASSED] SVIDEO
[23:48:09] [PASSED] LVDS
[23:48:09] [PASSED] Component
[23:48:09] [PASSED] DIN
[23:48:09] [PASSED] DP
[23:48:09] [PASSED] HDMI-A
[23:48:09] [PASSED] HDMI-B
[23:48:09] [PASSED] TV
[23:48:09] [PASSED] eDP
[23:48:09] [PASSED] Virtual
[23:48:09] [PASSED] DSI
[23:48:09] [PASSED] DPI
[23:48:09] [PASSED] Writeback
[23:48:09] [PASSED] SPI
[23:48:09] [PASSED] USB
[23:48:09] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[23:48:09] =========== [PASSED] drm_connector_dynamic_init ============
[23:48:09] ==== drm_connector_dynamic_register_early (4 subtests) =====
[23:48:09] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[23:48:09] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[23:48:09] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[23:48:09] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[23:48:09] ====== [PASSED] drm_connector_dynamic_register_early =======
[23:48:09] ======= drm_connector_dynamic_register (7 subtests) ========
[23:48:09] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[23:48:09] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[23:48:09] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[23:48:09] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[23:48:09] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[23:48:09] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[23:48:09] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[23:48:09] ========= [PASSED] drm_connector_dynamic_register ==========
[23:48:09] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[23:48:09] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[23:48:10] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[23:48:10] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[23:48:10] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[23:48:10] ========== drm_test_get_tv_mode_from_name_valid  ===========
[23:48:10] [PASSED] NTSC
[23:48:10] [PASSED] NTSC-443
[23:48:10] [PASSED] NTSC-J
[23:48:10] [PASSED] PAL
[23:48:10] [PASSED] PAL-M
[23:48:10] [PASSED] PAL-N
[23:48:10] [PASSED] SECAM
[23:48:10] [PASSED] Mono
[23:48:10] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[23:48:10] [PASSED] drm_test_get_tv_mode_from_name_truncated
[23:48:10] ============ [PASSED] drm_get_tv_mode_from_name ============
[23:48:10] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[23:48:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[23:48:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[23:48:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[23:48:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[23:48:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[23:48:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[23:48:10] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[23:48:10] [PASSED] VIC 96
[23:48:10] [PASSED] VIC 97
[23:48:10] [PASSED] VIC 101
[23:48:10] [PASSED] VIC 102
[23:48:10] [PASSED] VIC 106
[23:48:10] [PASSED] VIC 107
[23:48:10] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[23:48:10] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[23:48:10] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[23:48:10] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[23:48:10] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[23:48:10] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[23:48:10] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[23:48:10] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[23:48:10] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[23:48:10] [PASSED] Automatic
[23:48:10] [PASSED] Full
[23:48:10] [PASSED] Limited 16:235
[23:48:10] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[23:48:10] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[23:48:10] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[23:48:10] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[23:48:10] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[23:48:10] [PASSED] RGB
[23:48:10] [PASSED] YUV 4:2:0
[23:48:10] [PASSED] YUV 4:2:2
[23:48:10] [PASSED] YUV 4:4:4
[23:48:10] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[23:48:10] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[23:48:10] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[23:48:10] ============= drm_damage_helper (21 subtests) ==============
[23:48:10] [PASSED] drm_test_damage_iter_no_damage
[23:48:10] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[23:48:10] [PASSED] drm_test_damage_iter_no_damage_src_moved
[23:48:10] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[23:48:10] [PASSED] drm_test_damage_iter_no_damage_not_visible
[23:48:10] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[23:48:10] [PASSED] drm_test_damage_iter_no_damage_no_fb
[23:48:10] [PASSED] drm_test_damage_iter_simple_damage
[23:48:10] [PASSED] drm_test_damage_iter_single_damage
[23:48:10] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[23:48:10] [PASSED] drm_test_damage_iter_single_damage_outside_src
[23:48:10] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[23:48:10] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[23:48:10] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[23:48:10] [PASSED] drm_test_damage_iter_single_damage_src_moved
[23:48:10] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[23:48:10] [PASSED] drm_test_damage_iter_damage
[23:48:10] [PASSED] drm_test_damage_iter_damage_one_intersect
[23:48:10] [PASSED] drm_test_damage_iter_damage_one_outside
[23:48:10] [PASSED] drm_test_damage_iter_damage_src_moved
[23:48:10] [PASSED] drm_test_damage_iter_damage_not_visible
[23:48:10] ================ [PASSED] drm_damage_helper ================
[23:48:10] ============== drm_dp_mst_helper (3 subtests) ==============
[23:48:10] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[23:48:10] [PASSED] Clock 154000 BPP 30 DSC disabled
[23:48:10] [PASSED] Clock 234000 BPP 30 DSC disabled
[23:48:10] [PASSED] Clock 297000 BPP 24 DSC disabled
[23:48:10] [PASSED] Clock 332880 BPP 24 DSC enabled
[23:48:10] [PASSED] Clock 324540 BPP 24 DSC enabled
[23:48:10] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[23:48:10] ============== drm_test_dp_mst_calc_pbn_div  ===============
[23:48:10] [PASSED] Link rate 2000000 lane count 4
[23:48:10] [PASSED] Link rate 2000000 lane count 2
[23:48:10] [PASSED] Link rate 2000000 lane count 1
[23:48:10] [PASSED] Link rate 1350000 lane count 4
[23:48:10] [PASSED] Link rate 1350000 lane count 2
[23:48:10] [PASSED] Link rate 1350000 lane count 1
[23:48:10] [PASSED] Link rate 1000000 lane count 4
[23:48:10] [PASSED] Link rate 1000000 lane count 2
[23:48:10] [PASSED] Link rate 1000000 lane count 1
[23:48:10] [PASSED] Link rate 810000 lane count 4
[23:48:10] [PASSED] Link rate 810000 lane count 2
[23:48:10] [PASSED] Link rate 810000 lane count 1
[23:48:10] [PASSED] Link rate 540000 lane count 4
[23:48:10] [PASSED] Link rate 540000 lane count 2
[23:48:10] [PASSED] Link rate 540000 lane count 1
[23:48:10] [PASSED] Link rate 270000 lane count 4
[23:48:10] [PASSED] Link rate 270000 lane count 2
[23:48:10] [PASSED] Link rate 270000 lane count 1
[23:48:10] [PASSED] Link rate 162000 lane count 4
[23:48:10] [PASSED] Link rate 162000 lane count 2
[23:48:10] [PASSED] Link rate 162000 lane count 1
[23:48:10] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[23:48:10] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[23:48:10] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[23:48:10] [PASSED] DP_POWER_UP_PHY with port number
[23:48:10] [PASSED] DP_POWER_DOWN_PHY with port number
[23:48:10] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[23:48:10] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[23:48:10] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[23:48:10] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[23:48:10] [PASSED] DP_QUERY_PAYLOAD with port number
[23:48:10] [PASSED] DP_QUERY_PAYLOAD with VCPI
[23:48:10] [PASSED] DP_REMOTE_DPCD_READ with port number
[23:48:10] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[23:48:10] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[23:48:10] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[23:48:10] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[23:48:10] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[23:48:10] [PASSED] DP_REMOTE_I2C_READ with port number
[23:48:10] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[23:48:10] [PASSED] DP_REMOTE_I2C_READ with transactions array
[23:48:10] [PASSED] DP_REMOTE_I2C_WRITE with port number
[23:48:10] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[23:48:10] [PASSED] DP_REMOTE_I2C_WRITE with data array
[23:48:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[23:48:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[23:48:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[23:48:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[23:48:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[23:48:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[23:48:10] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[23:48:10] ================ [PASSED] drm_dp_mst_helper ================
[23:48:10] ================== drm_exec (7 subtests) ===================
[23:48:10] [PASSED] sanitycheck
[23:48:10] [PASSED] test_lock
[23:48:10] [PASSED] test_lock_unlock
[23:48:10] [PASSED] test_duplicates
[23:48:10] [PASSED] test_prepare
[23:48:10] [PASSED] test_prepare_array
[23:48:10] [PASSED] test_multiple_loops
[23:48:10] ==================== [PASSED] drm_exec =====================
[23:48:10] =========== drm_format_helper_test (17 subtests) ===========
[23:48:10] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[23:48:10] [PASSED] single_pixel_source_buffer
[23:48:10] [PASSED] single_pixel_clip_rectangle
[23:48:10] [PASSED] well_known_colors
[23:48:10] [PASSED] destination_pitch
[23:48:10] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[23:48:10] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[23:48:10] [PASSED] single_pixel_source_buffer
[23:48:10] [PASSED] single_pixel_clip_rectangle
[23:48:10] [PASSED] well_known_colors
[23:48:10] [PASSED] destination_pitch
[23:48:10] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[23:48:10] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[23:48:10] [PASSED] single_pixel_source_buffer
[23:48:10] [PASSED] single_pixel_clip_rectangle
[23:48:10] [PASSED] well_known_colors
[23:48:10] [PASSED] destination_pitch
[23:48:10] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[23:48:10] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[23:48:10] [PASSED] single_pixel_source_buffer
[23:48:10] [PASSED] single_pixel_clip_rectangle
[23:48:10] [PASSED] well_known_colors
[23:48:10] [PASSED] destination_pitch
[23:48:10] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[23:48:10] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[23:48:10] [PASSED] single_pixel_source_buffer
[23:48:10] [PASSED] single_pixel_clip_rectangle
[23:48:10] [PASSED] well_known_colors
[23:48:10] [PASSED] destination_pitch
[23:48:10] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[23:48:10] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[23:48:10] [PASSED] single_pixel_source_buffer
[23:48:10] [PASSED] single_pixel_clip_rectangle
[23:48:10] [PASSED] well_known_colors
[23:48:10] [PASSED] destination_pitch
[23:48:10] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[23:48:10] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[23:48:10] [PASSED] single_pixel_source_buffer
[23:48:10] [PASSED] single_pixel_clip_rectangle
[23:48:10] [PASSED] well_known_colors
[23:48:10] [PASSED] destination_pitch
[23:48:10] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[23:48:10] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[23:48:10] [PASSED] single_pixel_source_buffer
[23:48:10] [PASSED] single_pixel_clip_rectangle
[23:48:10] [PASSED] well_known_colors
[23:48:10] [PASSED] destination_pitch
[23:48:10] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[23:48:10] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[23:48:10] [PASSED] single_pixel_source_buffer
[23:48:10] [PASSED] single_pixel_clip_rectangle
[23:48:10] [PASSED] well_known_colors
[23:48:10] [PASSED] destination_pitch
[23:48:10] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[23:48:10] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[23:48:10] [PASSED] single_pixel_source_buffer
[23:48:10] [PASSED] single_pixel_clip_rectangle
[23:48:10] [PASSED] well_known_colors
[23:48:10] [PASSED] destination_pitch
[23:48:10] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[23:48:10] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[23:48:10] [PASSED] single_pixel_source_buffer
[23:48:10] [PASSED] single_pixel_clip_rectangle
[23:48:10] [PASSED] well_known_colors
[23:48:10] [PASSED] destination_pitch
[23:48:10] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[23:48:10] ============== drm_test_fb_xrgb8888_to_mono  ===============
[23:48:10] [PASSED] single_pixel_source_buffer
[23:48:10] [PASSED] single_pixel_clip_rectangle
[23:48:10] [PASSED] well_known_colors
[23:48:10] [PASSED] destination_pitch
[23:48:10] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[23:48:10] ==================== drm_test_fb_swab  =====================
[23:48:10] [PASSED] single_pixel_source_buffer
[23:48:10] [PASSED] single_pixel_clip_rectangle
[23:48:10] [PASSED] well_known_colors
[23:48:10] [PASSED] destination_pitch
[23:48:10] ================ [PASSED] drm_test_fb_swab =================
[23:48:10] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[23:48:10] [PASSED] single_pixel_source_buffer
[23:48:10] [PASSED] single_pixel_clip_rectangle
[23:48:10] [PASSED] well_known_colors
[23:48:10] [PASSED] destination_pitch
[23:48:10] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[23:48:10] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[23:48:10] [PASSED] single_pixel_source_buffer
[23:48:10] [PASSED] single_pixel_clip_rectangle
[23:48:10] [PASSED] well_known_colors
[23:48:10] [PASSED] destination_pitch
[23:48:10] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[23:48:10] ================= drm_test_fb_clip_offset  =================
[23:48:10] [PASSED] pass through
[23:48:10] [PASSED] horizontal offset
[23:48:10] [PASSED] vertical offset
[23:48:10] [PASSED] horizontal and vertical offset
[23:48:10] [PASSED] horizontal offset (custom pitch)
[23:48:10] [PASSED] vertical offset (custom pitch)
[23:48:10] [PASSED] horizontal and vertical offset (custom pitch)
[23:48:10] ============= [PASSED] drm_test_fb_clip_offset =============
[23:48:10] =================== drm_test_fb_memcpy  ====================
[23:48:10] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[23:48:10] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[23:48:10] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[23:48:10] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[23:48:10] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[23:48:10] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[23:48:10] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[23:48:10] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[23:48:10] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[23:48:10] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[23:48:10] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[23:48:10] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[23:48:10] =============== [PASSED] drm_test_fb_memcpy ================
[23:48:10] ============= [PASSED] drm_format_helper_test ==============
[23:48:10] ================= drm_format (18 subtests) =================
[23:48:10] [PASSED] drm_test_format_block_width_invalid
[23:48:10] [PASSED] drm_test_format_block_width_one_plane
[23:48:10] [PASSED] drm_test_format_block_width_two_plane
[23:48:10] [PASSED] drm_test_format_block_width_three_plane
[23:48:10] [PASSED] drm_test_format_block_width_tiled
[23:48:10] [PASSED] drm_test_format_block_height_invalid
[23:48:10] [PASSED] drm_test_format_block_height_one_plane
[23:48:10] [PASSED] drm_test_format_block_height_two_plane
[23:48:10] [PASSED] drm_test_format_block_height_three_plane
[23:48:10] [PASSED] drm_test_format_block_height_tiled
[23:48:10] [PASSED] drm_test_format_min_pitch_invalid
[23:48:10] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[23:48:10] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[23:48:10] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[23:48:10] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[23:48:10] [PASSED] drm_test_format_min_pitch_two_plane
[23:48:10] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[23:48:10] [PASSED] drm_test_format_min_pitch_tiled
[23:48:10] =================== [PASSED] drm_format ====================
[23:48:10] ============== drm_framebuffer (10 subtests) ===============
[23:48:10] ========== drm_test_framebuffer_check_src_coords  ==========
[23:48:10] [PASSED] Success: source fits into fb
[23:48:10] [PASSED] Fail: overflowing fb with x-axis coordinate
[23:48:10] [PASSED] Fail: overflowing fb with y-axis coordinate
[23:48:10] [PASSED] Fail: overflowing fb with source width
[23:48:10] [PASSED] Fail: overflowing fb with source height
[23:48:10] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[23:48:10] [PASSED] drm_test_framebuffer_cleanup
[23:48:10] =============== drm_test_framebuffer_create  ===============
[23:48:10] [PASSED] ABGR8888 normal sizes
[23:48:10] [PASSED] ABGR8888 max sizes
[23:48:10] [PASSED] ABGR8888 pitch greater than min required
[23:48:10] [PASSED] ABGR8888 pitch less than min required
[23:48:10] [PASSED] ABGR8888 Invalid width
[23:48:10] [PASSED] ABGR8888 Invalid buffer handle
[23:48:10] [PASSED] No pixel format
[23:48:10] [PASSED] ABGR8888 Width 0
[23:48:10] [PASSED] ABGR8888 Height 0
[23:48:10] [PASSED] ABGR8888 Out of bound height * pitch combination
[23:48:10] [PASSED] ABGR8888 Large buffer offset
[23:48:10] [PASSED] ABGR8888 Buffer offset for inexistent plane
[23:48:10] [PASSED] ABGR8888 Invalid flag
[23:48:10] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[23:48:10] [PASSED] ABGR8888 Valid buffer modifier
[23:48:10] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[23:48:10] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[23:48:10] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[23:48:10] [PASSED] NV12 Normal sizes
[23:48:10] [PASSED] NV12 Max sizes
[23:48:10] [PASSED] NV12 Invalid pitch
[23:48:10] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[23:48:10] [PASSED] NV12 different  modifier per-plane
[23:48:10] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[23:48:10] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[23:48:10] [PASSED] NV12 Modifier for inexistent plane
[23:48:10] [PASSED] NV12 Handle for inexistent plane
[23:48:10] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[23:48:10] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[23:48:10] [PASSED] YVU420 Normal sizes
[23:48:10] [PASSED] YVU420 Max sizes
[23:48:10] [PASSED] YVU420 Invalid pitch
[23:48:10] [PASSED] YVU420 Different pitches
[23:48:10] [PASSED] YVU420 Different buffer offsets/pitches
[23:48:10] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[23:48:10] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[23:48:10] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[23:48:10] [PASSED] YVU420 Valid modifier
[23:48:10] [PASSED] YVU420 Different modifiers per plane
[23:48:10] [PASSED] YVU420 Modifier for inexistent plane
[23:48:10] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[23:48:10] [PASSED] X0L2 Normal sizes
[23:48:10] [PASSED] X0L2 Max sizes
[23:48:10] [PASSED] X0L2 Invalid pitch
[23:48:10] [PASSED] X0L2 Pitch greater than minimum required
[23:48:10] [PASSED] X0L2 Handle for inexistent plane
[23:48:10] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[23:48:10] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[23:48:10] [PASSED] X0L2 Valid modifier
[23:48:10] [PASSED] X0L2 Modifier for inexistent plane
[23:48:10] =========== [PASSED] drm_test_framebuffer_create ===========
[23:48:10] [PASSED] drm_test_framebuffer_free
[23:48:10] [PASSED] drm_test_framebuffer_init
[23:48:10] [PASSED] drm_test_framebuffer_init_bad_format
[23:48:10] [PASSED] drm_test_framebuffer_init_dev_mismatch
[23:48:10] [PASSED] drm_test_framebuffer_lookup
[23:48:10] [PASSED] drm_test_framebuffer_lookup_inexistent
[23:48:10] [PASSED] drm_test_framebuffer_modifiers_not_supported
[23:48:10] ================= [PASSED] drm_framebuffer =================
[23:48:10] ================ drm_gem_shmem (8 subtests) ================
[23:48:10] [PASSED] drm_gem_shmem_test_obj_create
[23:48:10] [PASSED] drm_gem_shmem_test_obj_create_private
[23:48:10] [PASSED] drm_gem_shmem_test_pin_pages
[23:48:10] [PASSED] drm_gem_shmem_test_vmap
[23:48:10] [PASSED] drm_gem_shmem_test_get_sg_table
[23:48:10] [PASSED] drm_gem_shmem_test_get_pages_sgt
[23:48:10] [PASSED] drm_gem_shmem_test_madvise
[23:48:10] [PASSED] drm_gem_shmem_test_purge
[23:48:10] ================== [PASSED] drm_gem_shmem ==================
[23:48:10] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[23:48:10] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[23:48:10] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[23:48:10] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[23:48:10] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[23:48:10] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[23:48:10] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[23:48:10] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[23:48:10] [PASSED] Automatic
[23:48:10] [PASSED] Full
[23:48:10] [PASSED] Limited 16:235
[23:48:10] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[23:48:10] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[23:48:10] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[23:48:10] [PASSED] drm_test_check_disable_connector
[23:48:10] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[23:48:10] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[23:48:10] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[23:48:10] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[23:48:10] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[23:48:10] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[23:48:10] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[23:48:10] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[23:48:10] [PASSED] drm_test_check_output_bpc_dvi
[23:48:10] [PASSED] drm_test_check_output_bpc_format_vic_1
[23:48:10] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[23:48:10] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[23:48:10] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[23:48:10] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[23:48:10] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[23:48:10] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[23:48:10] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[23:48:10] ============ drm_test_check_hdmi_color_format  =============
[23:48:10] [PASSED] AUTO -> RGB
[23:48:10] [PASSED] YCBCR422 -> YUV422
[23:48:10] [PASSED] YCBCR420 -> YUV420
[23:48:10] [PASSED] YCBCR444 -> YUV444
[23:48:10] [PASSED] RGB -> RGB
[23:48:10] ======== [PASSED] drm_test_check_hdmi_color_format =========
[23:48:10] ======== drm_test_check_hdmi_color_format_420_only  ========
[23:48:10] [PASSED] RGB should fail
[23:48:10] [PASSED] YUV444 should fail
[23:48:10] [PASSED] YUV422 should fail
[23:48:10] [PASSED] YUV420 should work
[23:48:10] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[23:48:10] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[23:48:10] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[23:48:10] [PASSED] drm_test_check_broadcast_rgb_value
[23:48:10] [PASSED] drm_test_check_bpc_8_value
[23:48:10] [PASSED] drm_test_check_bpc_10_value
[23:48:10] [PASSED] drm_test_check_bpc_12_value
[23:48:10] [PASSED] drm_test_check_format_value
[23:48:10] [PASSED] drm_test_check_tmds_char_value
[23:48:10] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[23:48:10] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[23:48:10] [PASSED] drm_test_check_mode_valid
[23:48:10] [PASSED] drm_test_check_mode_valid_reject
[23:48:10] [PASSED] drm_test_check_mode_valid_reject_rate
[23:48:10] [PASSED] drm_test_check_mode_valid_reject_max_clock
[23:48:10] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[23:48:10] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[23:48:10] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[23:48:10] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[23:48:10] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[23:48:10] [PASSED] drm_test_check_infoframes
[23:48:10] [PASSED] drm_test_check_reject_avi_infoframe
[23:48:10] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[23:48:10] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[23:48:10] [PASSED] drm_test_check_reject_audio_infoframe
[23:48:10] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[23:48:10] ================= drm_managed (2 subtests) =================
[23:48:10] [PASSED] drm_test_managed_release_action
[23:48:10] [PASSED] drm_test_managed_run_action
[23:48:10] =================== [PASSED] drm_managed ===================
[23:48:10] =================== drm_mm (6 subtests) ====================
[23:48:10] [PASSED] drm_test_mm_init
[23:48:10] [PASSED] drm_test_mm_debug
[23:48:10] [PASSED] drm_test_mm_align32
[23:48:10] [PASSED] drm_test_mm_align64
[23:48:10] [PASSED] drm_test_mm_lowest
[23:48:10] [PASSED] drm_test_mm_highest
[23:48:10] ===================== [PASSED] drm_mm ======================
[23:48:10] ============= drm_modes_analog_tv (5 subtests) =============
[23:48:10] [PASSED] drm_test_modes_analog_tv_mono_576i
[23:48:10] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[23:48:10] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[23:48:10] [PASSED] drm_test_modes_analog_tv_pal_576i
[23:48:10] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[23:48:10] =============== [PASSED] drm_modes_analog_tv ===============
[23:48:10] ============== drm_plane_helper (2 subtests) ===============
[23:48:10] =============== drm_test_check_plane_state  ================
[23:48:10] [PASSED] clipping_simple
[23:48:10] [PASSED] clipping_rotate_reflect
[23:48:10] [PASSED] positioning_simple
[23:48:10] [PASSED] upscaling
[23:48:10] [PASSED] downscaling
[23:48:10] [PASSED] rounding1
[23:48:10] [PASSED] rounding2
[23:48:10] [PASSED] rounding3
[23:48:10] [PASSED] rounding4
[23:48:10] =========== [PASSED] drm_test_check_plane_state ============
[23:48:10] =========== drm_test_check_invalid_plane_state  ============
[23:48:10] [PASSED] positioning_invalid
[23:48:10] [PASSED] upscaling_invalid
[23:48:10] [PASSED] downscaling_invalid
[23:48:10] ======= [PASSED] drm_test_check_invalid_plane_state ========
[23:48:10] ================ [PASSED] drm_plane_helper =================
[23:48:10] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[23:48:10] ====== drm_test_connector_helper_tv_get_modes_check  =======
[23:48:10] [PASSED] None
[23:48:10] [PASSED] PAL
[23:48:10] [PASSED] NTSC
[23:48:10] [PASSED] Both, NTSC Default
[23:48:10] [PASSED] Both, PAL Default
[23:48:10] [PASSED] Both, NTSC Default, with PAL on command-line
[23:48:10] [PASSED] Both, PAL Default, with NTSC on command-line
[23:48:10] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[23:48:10] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[23:48:10] ================== drm_rect (9 subtests) ===================
[23:48:10] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[23:48:10] [PASSED] drm_test_rect_clip_scaled_not_clipped
[23:48:10] [PASSED] drm_test_rect_clip_scaled_clipped
[23:48:10] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[23:48:10] ================= drm_test_rect_intersect  =================
[23:48:10] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[23:48:10] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[23:48:10] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[23:48:10] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[23:48:10] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[23:48:10] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[23:48:10] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[23:48:10] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[23:48:10] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[23:48:10] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[23:48:10] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[23:48:10] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[23:48:10] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[23:48:10] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[23:48:10] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[23:48:10] ============= [PASSED] drm_test_rect_intersect =============
[23:48:10] ================ drm_test_rect_calc_hscale  ================
[23:48:10] [PASSED] normal use
[23:48:10] [PASSED] out of max range
[23:48:10] [PASSED] out of min range
[23:48:10] [PASSED] zero dst
[23:48:10] [PASSED] negative src
[23:48:10] [PASSED] negative dst
[23:48:10] ============ [PASSED] drm_test_rect_calc_hscale ============
[23:48:10] ================ drm_test_rect_calc_vscale  ================
[23:48:10] [PASSED] normal use
[23:48:10] [PASSED] out of max range
[23:48:10] [PASSED] out of min range
[23:48:10] [PASSED] zero dst
[23:48:10] [PASSED] negative src
[23:48:10] [PASSED] negative dst
[23:48:10] ============ [PASSED] drm_test_rect_calc_vscale ============
[23:48:10] ================== drm_test_rect_rotate  ===================
[23:48:10] [PASSED] reflect-x
[23:48:10] [PASSED] reflect-y
[23:48:10] [PASSED] rotate-0
[23:48:10] [PASSED] rotate-90
[23:48:10] [PASSED] rotate-180
[23:48:10] [PASSED] rotate-270
[23:48:10] ============== [PASSED] drm_test_rect_rotate ===============
[23:48:10] ================ drm_test_rect_rotate_inv  =================
[23:48:10] [PASSED] reflect-x
[23:48:10] [PASSED] reflect-y
[23:48:10] [PASSED] rotate-0
[23:48:10] [PASSED] rotate-90
[23:48:10] [PASSED] rotate-180
[23:48:10] [PASSED] rotate-270
[23:48:10] ============ [PASSED] drm_test_rect_rotate_inv =============
[23:48:10] ==================== [PASSED] drm_rect =====================
[23:48:10] ============ drm_sysfb_modeset_test (1 subtest) ============
[23:48:10] ============ drm_test_sysfb_build_fourcc_list  =============
[23:48:10] [PASSED] no native formats
[23:48:10] [PASSED] XRGB8888 as native format
[23:48:10] [PASSED] remove duplicates
[23:48:10] [PASSED] convert alpha formats
[23:48:10] [PASSED] random formats
[23:48:10] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[23:48:10] ============= [PASSED] drm_sysfb_modeset_test ==============
[23:48:10] ================== drm_fixp (2 subtests) ===================
[23:48:10] [PASSED] drm_test_int2fixp
[23:48:10] [PASSED] drm_test_sm2fixp
[23:48:10] ==================== [PASSED] drm_fixp =====================
[23:48:10] ============================================================
[23:48:10] Testing complete. Ran 641 tests: passed: 641
[23:48:10] Elapsed time: 27.106s total, 1.798s configuring, 25.090s building, 0.194s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[23:48:10] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:48:11] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[23:48:22] Starting KUnit Kernel (1/1)...
[23:48:22] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:48:22] ============= refcount_interrupt (4 subtests) ==============
[23:48:22] [PASSED] test_single_irq_change
[23:48:22] [PASSED] test_nested_irq_change
[23:48:22] [PASSED] test_multiple_irq_change
[23:48:22] [PASSED] test_irq_save
[23:48:22] =============== [PASSED] refcount_interrupt ================
[23:48:22] ================= ttm_device (5 subtests) ==================
[23:48:22] [PASSED] ttm_device_init_basic
[23:48:22] [PASSED] ttm_device_init_multiple
[23:48:22] [PASSED] ttm_device_fini_basic
[23:48:22] [PASSED] ttm_device_init_no_vma_man
[23:48:22] ================== ttm_device_init_pools  ==================
[23:48:22] [PASSED] No DMA allocations, no DMA32 required
[23:48:22] [PASSED] DMA allocations, DMA32 required
[23:48:22] [PASSED] No DMA allocations, DMA32 required
[23:48:22] [PASSED] DMA allocations, no DMA32 required
[23:48:22] ============== [PASSED] ttm_device_init_pools ==============
[23:48:22] =================== [PASSED] ttm_device ====================
[23:48:22] ================== ttm_pool (8 subtests) ===================
[23:48:22] ================== ttm_pool_alloc_basic  ===================
[23:48:22] [PASSED] One page
[23:48:22] [PASSED] More than one page
[23:48:22] [PASSED] Above the allocation limit
[23:48:22] [PASSED] One page, with coherent DMA mappings enabled
[23:48:22] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[23:48:22] ============== [PASSED] ttm_pool_alloc_basic ===============
[23:48:22] ============== ttm_pool_alloc_basic_dma_addr  ==============
[23:48:22] [PASSED] One page
[23:48:22] [PASSED] More than one page
[23:48:22] [PASSED] Above the allocation limit
[23:48:22] [PASSED] One page, with coherent DMA mappings enabled
[23:48:22] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[23:48:22] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[23:48:22] [PASSED] ttm_pool_alloc_order_caching_match
[23:48:22] [PASSED] ttm_pool_alloc_caching_mismatch
[23:48:22] [PASSED] ttm_pool_alloc_order_mismatch
[23:48:22] [PASSED] ttm_pool_free_dma_alloc
[23:48:22] [PASSED] ttm_pool_free_no_dma_alloc
[23:48:22] [PASSED] ttm_pool_fini_basic
[23:48:22] ==================== [PASSED] ttm_pool =====================
[23:48:22] ================ ttm_resource (8 subtests) =================
[23:48:22] ================= ttm_resource_init_basic  =================
[23:48:22] [PASSED] Init resource in TTM_PL_SYSTEM
[23:48:22] [PASSED] Init resource in TTM_PL_VRAM
[23:48:22] [PASSED] Init resource in a private placement
[23:48:22] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[23:48:22] ============= [PASSED] ttm_resource_init_basic =============
[23:48:22] [PASSED] ttm_resource_init_pinned
[23:48:22] [PASSED] ttm_resource_fini_basic
[23:48:22] [PASSED] ttm_resource_manager_init_basic
[23:48:22] [PASSED] ttm_resource_manager_usage_basic
[23:48:22] [PASSED] ttm_resource_manager_set_used_basic
[23:48:22] [PASSED] ttm_sys_man_alloc_basic
[23:48:22] [PASSED] ttm_sys_man_free_basic
[23:48:22] ================== [PASSED] ttm_resource ===================
[23:48:22] =================== ttm_tt (15 subtests) ===================
[23:48:22] ==================== ttm_tt_init_basic  ====================
[23:48:22] [PASSED] Page-aligned size
[23:48:22] [PASSED] Extra pages requested
[23:48:22] ================ [PASSED] ttm_tt_init_basic ================
[23:48:22] [PASSED] ttm_tt_init_misaligned
[23:48:22] [PASSED] ttm_tt_fini_basic
[23:48:22] [PASSED] ttm_tt_fini_sg
[23:48:22] [PASSED] ttm_tt_fini_shmem
[23:48:22] [PASSED] ttm_tt_create_basic
[23:48:22] [PASSED] ttm_tt_create_invalid_bo_type
[23:48:22] [PASSED] ttm_tt_create_ttm_exists
[23:48:22] [PASSED] ttm_tt_create_failed
[23:48:22] [PASSED] ttm_tt_destroy_basic
[23:48:22] [PASSED] ttm_tt_populate_null_ttm
[23:48:22] [PASSED] ttm_tt_populate_populated_ttm
[23:48:22] [PASSED] ttm_tt_unpopulate_basic
[23:48:22] [PASSED] ttm_tt_unpopulate_empty_ttm
[23:48:22] [PASSED] ttm_tt_swapin_basic
[23:48:22] ===================== [PASSED] ttm_tt ======================
[23:48:22] =================== ttm_bo (14 subtests) ===================
[23:48:22] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[23:48:22] [PASSED] Cannot be interrupted and sleeps
[23:48:22] [PASSED] Cannot be interrupted, locks straight away
[23:48:22] [PASSED] Can be interrupted, sleeps
[23:48:22] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[23:48:22] [PASSED] ttm_bo_reserve_locked_no_sleep
[23:48:22] [PASSED] ttm_bo_reserve_no_wait_ticket
[23:48:22] [PASSED] ttm_bo_reserve_double_resv
[23:48:22] [PASSED] ttm_bo_reserve_interrupted
[23:48:22] [PASSED] ttm_bo_reserve_deadlock
[23:48:22] [PASSED] ttm_bo_unreserve_basic
[23:48:22] [PASSED] ttm_bo_unreserve_pinned
[23:48:22] [PASSED] ttm_bo_unreserve_bulk
[23:48:22] [PASSED] ttm_bo_fini_basic
[23:48:22] [PASSED] ttm_bo_fini_shared_resv
[23:48:22] [PASSED] ttm_bo_pin_basic
[23:48:22] [PASSED] ttm_bo_pin_unpin_resource
[23:48:22] [PASSED] ttm_bo_multiple_pin_one_unpin
[23:48:22] ===================== [PASSED] ttm_bo ======================
[23:48:22] ============== ttm_bo_validate (22 subtests) ===============
[23:48:22] ============== ttm_bo_init_reserved_sys_man  ===============
[23:48:22] [PASSED] Buffer object for userspace
[23:48:22] [PASSED] Kernel buffer object
[23:48:22] [PASSED] Shared buffer object
[23:48:22] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[23:48:22] ============== ttm_bo_init_reserved_mock_man  ==============
[23:48:22] [PASSED] Buffer object for userspace
[23:48:22] [PASSED] Kernel buffer object
[23:48:22] [PASSED] Shared buffer object
[23:48:22] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[23:48:22] [PASSED] ttm_bo_init_reserved_resv
[23:48:22] ================== ttm_bo_validate_basic  ==================
[23:48:22] [PASSED] Buffer object for userspace
[23:48:22] [PASSED] Kernel buffer object
[23:48:22] [PASSED] Shared buffer object
[23:48:22] ============== [PASSED] ttm_bo_validate_basic ==============
[23:48:22] [PASSED] ttm_bo_validate_invalid_placement
[23:48:22] ============= ttm_bo_validate_same_placement  ==============
[23:48:22] [PASSED] System manager
[23:48:22] [PASSED] VRAM manager
[23:48:22] ========= [PASSED] ttm_bo_validate_same_placement ==========
[23:48:22] [PASSED] ttm_bo_validate_failed_alloc
[23:48:22] [PASSED] ttm_bo_validate_pinned
[23:48:22] [PASSED] ttm_bo_validate_busy_placement
[23:48:22] ================ ttm_bo_validate_multihop  =================
[23:48:22] [PASSED] Buffer object for userspace
[23:48:22] [PASSED] Kernel buffer object
[23:48:22] [PASSED] Shared buffer object
[23:48:22] ============ [PASSED] ttm_bo_validate_multihop =============
[23:48:22] ========== ttm_bo_validate_no_placement_signaled  ==========
[23:48:22] [PASSED] Buffer object in system domain, no page vector
[23:48:22] [PASSED] Buffer object in system domain with an existing page vector
[23:48:22] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[23:48:22] ======== ttm_bo_validate_no_placement_not_signaled  ========
[23:48:22] [PASSED] Buffer object for userspace
[23:48:22] [PASSED] Kernel buffer object
[23:48:22] [PASSED] Shared buffer object
[23:48:22] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[23:48:22] [PASSED] ttm_bo_validate_move_fence_signaled
[23:48:22] ========= ttm_bo_validate_move_fence_not_signaled  =========
[23:48:22] [PASSED] Waits for GPU
[23:48:22] [PASSED] Tries to lock straight away
[23:48:22] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[23:48:22] [PASSED] ttm_bo_validate_swapout
[23:48:22] [PASSED] ttm_bo_validate_happy_evict
[23:48:22] [PASSED] ttm_bo_validate_all_pinned_evict
[23:48:22] [PASSED] ttm_bo_validate_allowed_only_evict
[23:48:22] [PASSED] ttm_bo_validate_deleted_evict
[23:48:22] [PASSED] ttm_bo_validate_busy_domain_evict
[23:48:22] [PASSED] ttm_bo_validate_evict_gutting
[23:48:22] [PASSED] ttm_bo_validate_recrusive_evict
[23:48:22] ================= [PASSED] ttm_bo_validate =================
[23:48:22] ============================================================
[23:48:22] Testing complete. Ran 106 tests: passed: 106
[23:48:22] Elapsed time: 12.056s total, 1.787s configuring, 10.054s building, 0.175s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/dma-buf/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[23:48:22] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:48:24] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[23:48:32] Starting KUnit Kernel (1/1)...
[23:48:32] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:48:32] ============= refcount_interrupt (4 subtests) ==============
[23:48:32] [PASSED] test_single_irq_change
[23:48:32] [PASSED] test_nested_irq_change
[23:48:32] [PASSED] test_multiple_irq_change
[23:48:32] [PASSED] test_irq_save
[23:48:32] =============== [PASSED] refcount_interrupt ================
[23:48:32] =============== dma-buf-fence (12 subtests) ================
[23:48:32] [PASSED] test_sanitycheck
[23:48:32] [PASSED] test_signaling
[23:48:32] [PASSED] test_add_callback
[23:48:32] [PASSED] test_late_add_callback
[23:48:32] [PASSED] test_rm_callback
[23:48:32] [PASSED] test_late_rm_callback
[23:48:32] [PASSED] test_status
[23:48:32] [PASSED] test_error
[23:48:33] [PASSED] test_wait
[23:48:33] [PASSED] test_wait_timeout
[23:48:33] [PASSED] test_stub
[23:48:33] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[23:48:33] ================== [PASSED] dma-buf-fence ==================
[23:48:33] ============ dma-buf-fence-chain (11 subtests) =============
[23:48:33] [PASSED] test_sanitycheck
[23:48:33] [PASSED] test_find_seqno
[23:48:33] [PASSED] test_find_signaled
[23:48:33] [PASSED] test_find_out_of_order
[23:48:38] [PASSED] test_find_gap
[23:48:38] [PASSED] test_find_race
[23:48:38] [PASSED] test_signal_forward
[23:48:38] [PASSED] test_signal_backward
[23:48:38] [PASSED] test_wait_forward
[23:48:38] [PASSED] test_wait_backward
[23:48:38] [PASSED] test_wait_random
[23:48:38] =============== [PASSED] dma-buf-fence-chain ===============
[23:48:38] ============ dma-buf-fence-unwrap (10 subtests) ============
[23:48:38] [PASSED] test_sanitycheck
[23:48:38] [PASSED] test_unwrap_array
[23:48:38] [PASSED] test_unwrap_chain
[23:48:38] [PASSED] test_unwrap_chain_array
[23:48:38] [PASSED] test_unwrap_merge
[23:48:38] [PASSED] test_unwrap_merge_duplicate
[23:48:38] [PASSED] test_unwrap_merge_seqno
[23:48:38] [PASSED] test_unwrap_merge_order
[23:48:38] [PASSED] test_unwrap_merge_complex
[23:48:38] [PASSED] test_unwrap_merge_complex_seqno
[23:48:38] ============== [PASSED] dma-buf-fence-unwrap ===============
[23:48:38] ================ dma-buf-resv (5 subtests) =================
[23:48:38] [PASSED] test_sanitycheck
[23:48:38] ===================== test_signaling  ======================
[23:48:38] [PASSED] kernel
[23:48:38] [PASSED] write
[23:48:38] [PASSED] read
[23:48:38] [PASSED] bookkeep
[23:48:38] ================= [PASSED] test_signaling ==================
[23:48:38] ====================== test_for_each  ======================
[23:48:38] [PASSED] kernel
[23:48:38] [PASSED] write
[23:48:38] [PASSED] read
[23:48:38] [PASSED] bookkeep
[23:48:38] ================== [PASSED] test_for_each ==================
[23:48:38] ================= test_for_each_unlocked  ==================
[23:48:38] [PASSED] kernel
[23:48:38] [PASSED] write
[23:48:38] [PASSED] read
[23:48:38] [PASSED] bookkeep
[23:48:38] ============= [PASSED] test_for_each_unlocked ==============
[23:48:38] ===================== test_get_fences  =====================
[23:48:38] [PASSED] kernel
[23:48:38] [PASSED] write
[23:48:38] [PASSED] read
[23:48:38] [PASSED] bookkeep
[23:48:38] ================= [PASSED] test_get_fences =================
[23:48:38] ================== [PASSED] dma-buf-resv ===================
[23:48:38] ============================================================
[23:48:38] Testing complete. Ran 54 tests: passed: 53, skipped: 1
[23:48:38] Elapsed time: 15.780s total, 1.807s configuring, 8.701s building, 5.265s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


