Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAF9CA5FF0
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 12:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D12310E214;
	Mon,  5 Oct 2026 12:31:41 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406DA10E214;
 Mon,  5 Oct 2026 12:31:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/i915/dp=3A_don=27t_touch_t?=
 =?utf-8?q?he_AUX_engine_while_it=27s_still_busy?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Oct 2026 12:31:40 -0000
Message-ID: <179120350025.240158.1992608743034926632@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261005122302.110968-1-luciano.coelho@intel.com>
In-Reply-To: <20261005122302.110968-1-luciano.coelho@intel.com>
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

Series: drm/i915/dp: don't touch the AUX engine while it's still busy
URL   : https://patchwork.freedesktop.org/series/175554/
State : success

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[12:29:34] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:29:39] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[12:30:00] Starting KUnit Kernel (1/1)...
[12:30:00] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[12:30:00] ============= refcount_interrupt (4 subtests) ==============
[12:30:00] [PASSED] test_single_irq_change
[12:30:00] [PASSED] test_nested_irq_change
[12:30:00] [PASSED] test_multiple_irq_change
[12:30:00] [PASSED] test_irq_save
[12:30:00] =============== [PASSED] refcount_interrupt ================
[12:30:00] ================= gpu_buddy (14 subtests) ==================
[12:30:00] [PASSED] gpu_test_buddy_alloc_limit
[12:30:00] [PASSED] gpu_test_buddy_alloc_optimistic
[12:30:00] [PASSED] gpu_test_buddy_alloc_pessimistic
[12:30:00] [PASSED] gpu_test_buddy_alloc_pathological
[12:30:00] [PASSED] gpu_test_buddy_alloc_contiguous
[12:30:00] [PASSED] gpu_test_buddy_alloc_clear
[12:30:00] [PASSED] gpu_test_buddy_alloc_range
[12:30:00] [PASSED] gpu_test_buddy_alloc_range_bias
[12:30:01] [PASSED] gpu_test_buddy_fragmentation_performance
[12:30:02] [PASSED] gpu_test_buddy_dirty_tracker_performance
[12:30:02] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[12:30:02] [PASSED] gpu_test_buddy_offset_aligned_allocation
[12:30:02] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[12:30:02] [PASSED] gpu_test_buddy_addr_to_block
[12:30:02] ==================== [PASSED] gpu_buddy ====================
[12:30:02] ============================================================
[12:30:02] Testing complete. Ran 18 tests: passed: 18
[12:30:02] Elapsed time: 27.366s total, 4.357s configuring, 20.840s building, 2.113s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[12:30:02] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:30:04] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[12:30:38] Starting KUnit Kernel (1/1)...
[12:30:38] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[12:30:38] ============= refcount_interrupt (4 subtests) ==============
[12:30:38] [PASSED] test_single_irq_change
[12:30:38] [PASSED] test_nested_irq_change
[12:30:38] [PASSED] test_multiple_irq_change
[12:30:38] [PASSED] test_irq_save
[12:30:38] =============== [PASSED] refcount_interrupt ================
[12:30:38] ================== guc_buf (11 subtests) ===================
[12:30:38] [PASSED] test_smallest
[12:30:38] [PASSED] test_largest
[12:30:38] [PASSED] test_granular
[12:30:38] [PASSED] test_unique
[12:30:38] [PASSED] test_overlap
[12:30:38] [PASSED] test_reusable
[12:30:38] [PASSED] test_too_big
[12:30:38] [PASSED] test_flush
[12:30:38] [PASSED] test_lookup
[12:30:38] [PASSED] test_data
[12:30:38] [PASSED] test_class
[12:30:38] ===================== [PASSED] guc_buf =====================
[12:30:38] =================== guc_dbm (7 subtests) ===================
[12:30:38] [PASSED] test_empty
[12:30:38] [PASSED] test_default
[12:30:38] ======================== test_size  ========================
[12:30:38] [PASSED] 4
[12:30:38] [PASSED] 8
[12:30:38] [PASSED] 32
[12:30:38] [PASSED] 256
[12:30:38] ==================== [PASSED] test_size ====================
[12:30:38] ======================= test_reuse  ========================
[12:30:38] [PASSED] 4
[12:30:38] [PASSED] 8
[12:30:38] [PASSED] 32
[12:30:38] [PASSED] 256
[12:30:38] =================== [PASSED] test_reuse ====================
[12:30:38] =================== test_range_overlap  ====================
[12:30:38] [PASSED] 4
[12:30:38] [PASSED] 8
[12:30:38] [PASSED] 32
[12:30:38] [PASSED] 256
[12:30:38] =============== [PASSED] test_range_overlap ================
[12:30:38] =================== test_range_compact  ====================
[12:30:38] [PASSED] 4
[12:30:38] [PASSED] 8
[12:30:38] [PASSED] 32
[12:30:38] [PASSED] 256
[12:30:38] =============== [PASSED] test_range_compact ================
[12:30:38] ==================== test_range_spare  =====================
[12:30:38] [PASSED] 4
[12:30:38] [PASSED] 8
[12:30:38] [PASSED] 32
[12:30:38] [PASSED] 256
[12:30:38] ================ [PASSED] test_range_spare =================
[12:30:38] ===================== [PASSED] guc_dbm =====================
[12:30:38] =================== guc_idm (6 subtests) ===================
[12:30:38] [PASSED] bad_init
[12:30:38] [PASSED] no_init
[12:30:38] [PASSED] init_fini
[12:30:38] [PASSED] check_used
[12:30:38] [PASSED] check_quota
[12:30:38] [PASSED] check_all
[12:30:38] ===================== [PASSED] guc_idm =====================
[12:30:38] ============== guc_klv_helpers (13 subtests) ===============
[12:30:38] [PASSED] test_count
[12:30:38] [PASSED] test_encode_u32
[12:30:38] [PASSED] test_encode_u64
[12:30:38] [PASSED] test_encode_string
[12:30:38] [PASSED] test_encode_object_raw
[12:30:38] [PASSED] test_encode_object_klv
[12:30:38] [PASSED] test_encode_object_nested
[12:30:38] [PASSED] test_encode_object_basic
[12:30:38] ===================== test_decode_u16  =====================
[12:30:38] [PASSED] empty
[12:30:38] [PASSED] valid
[12:30:38] [PASSED] max
[12:30:38] [PASSED] big
[12:30:38] [PASSED] long
[12:30:38] ================= [PASSED] test_decode_u16 =================
[12:30:38] ===================== test_decode_u32  =====================
[12:30:38] [PASSED] empty
[12:30:38] [PASSED] valid
[12:30:38] [PASSED] max
[12:30:38] [PASSED] long
[12:30:38] ================= [PASSED] test_decode_u32 =================
[12:30:38] ===================== test_decode_u64  =====================
[12:30:38] [PASSED] empty
[12:30:38] [PASSED] short
[12:30:38] [PASSED] valid
[12:30:38] [PASSED] max
[12:30:38] [PASSED] long
[12:30:38] ================= [PASSED] test_decode_u64 =================
[12:30:38] ===================== test_decode_str  =====================
[12:30:38] [PASSED] empty
[12:30:38] [PASSED] one
[12:30:38] [PASSED] one_trash
[12:30:38] [PASSED] two
[12:30:38] [PASSED] two_trash
[12:30:38] [PASSED] three
[12:30:38] [PASSED] dword
[12:30:38] [PASSED] four
[12:30:38] [PASSED] five
[12:30:38] [PASSED] six
[12:30:38] [PASSED] seven
[12:30:38] [PASSED] qword
[12:30:38] ================= [PASSED] test_decode_str =================
[12:30:38] [PASSED] test_print
[12:30:38] ================= [PASSED] guc_klv_helpers =================
[12:30:38] =================== xe_log (4 subtests) ====================
[12:30:38] [PASSED] demo_cper
[12:30:38] [PASSED] demo_dmesg
[12:30:38] ======================= test_dmesg  ========================
[12:30:38] [PASSED] test_fatal
[12:30:38] [PASSED] test_fatal_tile
[12:30:38] [PASSED] test_fatal_gt
[12:30:38] [PASSED] test_fatal_comp
[12:30:38] [PASSED] test_fatal_comp_tile
[12:30:38] [PASSED] test_fatal_comp_gt
[12:30:38] [PASSED] test_fatal_all
[12:30:38] [PASSED] test_recoverable
[12:30:38] [PASSED] test_recoverable_tile
[12:30:38] [PASSED] test_recoverable_gt
[12:30:38] [PASSED] test_recoverable_comp
[12:30:38] [PASSED] test_recoverable_comp_tile
[12:30:38] [PASSED] test_recoverable_comp_gt
[12:30:38] [PASSED] test_recoverable_all
[12:30:38] [PASSED] test_info
[12:30:38] [PASSED] test_info_tile
[12:30:38] [PASSED] test_info_gt
[12:30:38] [PASSED] test_info_err
[12:30:38] [PASSED] test_info_comp
[12:30:38] [PASSED] test_info_comp_tile
[12:30:38] [PASSED] test_info_comp_gt
[12:30:38] [PASSED] test_info_all
[12:30:38] [PASSED] test_hw_fatal
[12:30:38] [PASSED] test_hw_recoverable
[12:30:38] [PASSED] test_hw_corrected
[12:30:38] [PASSED] test_hw_informational
[12:30:38] =================== [PASSED] test_dmesg ====================
[12:30:38] ====================== test_invalid  =======================
[12:30:38] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[12:30:38] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[12:30:38] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[12:30:38] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[12:30:38] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[12:30:38] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[12:30:38] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[12:30:38] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[12:30:38] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[12:30:38] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[12:30:38] ================== [SKIPPED] test_invalid ==================
[12:30:38] ===================== [PASSED] xe_log ======================
[12:30:38] ================== no_relay (3 subtests) ===================
[12:30:38] [PASSED] xe_drops_guc2pf_if_not_ready
[12:30:38] [PASSED] xe_drops_guc2vf_if_not_ready
[12:30:38] [PASSED] xe_rejects_send_if_not_ready
[12:30:38] ==================== [PASSED] no_relay =====================
[12:30:38] ================== pf_relay (14 subtests) ==================
[12:30:38] [PASSED] pf_rejects_guc2pf_too_short
[12:30:38] [PASSED] pf_rejects_guc2pf_too_long
[12:30:38] [PASSED] pf_rejects_guc2pf_no_payload
[12:30:38] [PASSED] pf_fails_no_payload
[12:30:38] [PASSED] pf_fails_bad_origin
[12:30:38] [PASSED] pf_fails_bad_type
[12:30:38] [PASSED] pf_txn_reports_error
[12:30:38] [PASSED] pf_txn_sends_pf2guc
[12:30:38] [PASSED] pf_sends_pf2guc
[12:30:38] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[12:30:38] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[12:30:38] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[12:30:38] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[12:30:38] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[12:30:38] ==================== [PASSED] pf_relay =====================
[12:30:38] ================== vf_relay (3 subtests) ===================
[12:30:38] [PASSED] vf_rejects_guc2vf_too_short
[12:30:38] [PASSED] vf_rejects_guc2vf_too_long
[12:30:38] [PASSED] vf_rejects_guc2vf_no_payload
[12:30:38] ==================== [PASSED] vf_relay =====================
[12:30:38] ================ pf_gt_config (9 subtests) =================
[12:30:38] [PASSED] fair_contexts_1vf
[12:30:38] [PASSED] fair_doorbells_1vf
[12:30:38] [PASSED] fair_ggtt_1vf
[12:30:38] ====================== fair_vram_1vf  ======================
[12:30:38] [PASSED] 3.50 GiB
[12:30:38] [PASSED] 11.5 GiB
[12:30:38] [PASSED] 15.5 GiB
[12:30:38] [PASSED] 31.5 GiB
[12:30:38] [PASSED] 63.5 GiB
[12:30:38] [PASSED] 1.91 GiB
[12:30:38] ================== [PASSED] fair_vram_1vf ==================
[12:30:38] ================ fair_vram_1vf_admin_only  =================
[12:30:38] [PASSED] 3.50 GiB
[12:30:38] [PASSED] 11.5 GiB
[12:30:38] [PASSED] 15.5 GiB
[12:30:38] [PASSED] 31.5 GiB
[12:30:38] [PASSED] 63.5 GiB
[12:30:38] [PASSED] 1.91 GiB
[12:30:38] ============ [PASSED] fair_vram_1vf_admin_only =============
[12:30:38] ====================== fair_contexts  ======================
[12:30:38] [PASSED] 1 VF
[12:30:38] [PASSED] 2 VFs
[12:30:38] [PASSED] 3 VFs
[12:30:38] [PASSED] 4 VFs
[12:30:38] [PASSED] 5 VFs
[12:30:38] [PASSED] 6 VFs
[12:30:38] [PASSED] 7 VFs
[12:30:38] [PASSED] 8 VFs
[12:30:38] [PASSED] 9 VFs
[12:30:38] [PASSED] 10 VFs
[12:30:38] [PASSED] 11 VFs
[12:30:38] [PASSED] 12 VFs
[12:30:38] [PASSED] 13 VFs
[12:30:38] [PASSED] 14 VFs
[12:30:38] [PASSED] 15 VFs
[12:30:38] [PASSED] 16 VFs
[12:30:38] [PASSED] 17 VFs
[12:30:38] [PASSED] 18 VFs
[12:30:38] [PASSED] 19 VFs
[12:30:38] [PASSED] 20 VFs
[12:30:38] [PASSED] 21 VFs
[12:30:38] [PASSED] 22 VFs
[12:30:38] [PASSED] 23 VFs
[12:30:38] [PASSED] 24 VFs
[12:30:38] [PASSED] 25 VFs
[12:30:38] [PASSED] 26 VFs
[12:30:38] [PASSED] 27 VFs
[12:30:38] [PASSED] 28 VFs
[12:30:38] [PASSED] 29 VFs
[12:30:38] [PASSED] 30 VFs
[12:30:38] [PASSED] 31 VFs
[12:30:38] [PASSED] 32 VFs
[12:30:38] [PASSED] 33 VFs
[12:30:38] [PASSED] 34 VFs
[12:30:38] [PASSED] 35 VFs
[12:30:38] [PASSED] 36 VFs
[12:30:38] [PASSED] 37 VFs
[12:30:38] [PASSED] 38 VFs
[12:30:38] [PASSED] 39 VFs
[12:30:38] [PASSED] 40 VFs
[12:30:38] [PASSED] 41 VFs
[12:30:38] [PASSED] 42 VFs
[12:30:38] [PASSED] 43 VFs
[12:30:38] [PASSED] 44 VFs
[12:30:38] [PASSED] 45 VFs
[12:30:38] [PASSED] 46 VFs
[12:30:38] [PASSED] 47 VFs
[12:30:38] [PASSED] 48 VFs
[12:30:38] [PASSED] 49 VFs
[12:30:38] [PASSED] 50 VFs
[12:30:38] [PASSED] 51 VFs
[12:30:38] [PASSED] 52 VFs
[12:30:38] [PASSED] 53 VFs
[12:30:38] [PASSED] 54 VFs
[12:30:38] [PASSED] 55 VFs
[12:30:38] [PASSED] 56 VFs
[12:30:38] [PASSED] 57 VFs
[12:30:38] [PASSED] 58 VFs
[12:30:38] [PASSED] 59 VFs
[12:30:38] [PASSED] 60 VFs
[12:30:38] [PASSED] 61 VFs
[12:30:38] [PASSED] 62 VFs
[12:30:38] [PASSED] 63 VFs
[12:30:38] ================== [PASSED] fair_contexts ==================
[12:30:38] ===================== fair_doorbells  ======================
[12:30:38] [PASSED] 1 VF
[12:30:38] [PASSED] 2 VFs
[12:30:38] [PASSED] 3 VFs
[12:30:38] [PASSED] 4 VFs
[12:30:38] [PASSED] 5 VFs
[12:30:38] [PASSED] 6 VFs
[12:30:38] [PASSED] 7 VFs
[12:30:38] [PASSED] 8 VFs
[12:30:38] [PASSED] 9 VFs
[12:30:38] [PASSED] 10 VFs
[12:30:38] [PASSED] 11 VFs
[12:30:38] [PASSED] 12 VFs
[12:30:38] [PASSED] 13 VFs
[12:30:38] [PASSED] 14 VFs
[12:30:38] [PASSED] 15 VFs
[12:30:38] [PASSED] 16 VFs
[12:30:38] [PASSED] 17 VFs
[12:30:38] [PASSED] 18 VFs
[12:30:38] [PASSED] 19 VFs
[12:30:38] [PASSED] 20 VFs
[12:30:38] [PASSED] 21 VFs
[12:30:38] [PASSED] 22 VFs
[12:30:38] [PASSED] 23 VFs
[12:30:38] [PASSED] 24 VFs
[12:30:38] [PASSED] 25 VFs
[12:30:38] [PASSED] 26 VFs
[12:30:38] [PASSED] 27 VFs
[12:30:38] [PASSED] 28 VFs
[12:30:38] [PASSED] 29 VFs
[12:30:38] [PASSED] 30 VFs
[12:30:38] [PASSED] 31 VFs
[12:30:38] [PASSED] 32 VFs
[12:30:38] [PASSED] 33 VFs
[12:30:38] [PASSED] 34 VFs
[12:30:38] [PASSED] 35 VFs
[12:30:38] [PASSED] 36 VFs
[12:30:38] [PASSED] 37 VFs
[12:30:38] [PASSED] 38 VFs
[12:30:38] [PASSED] 39 VFs
[12:30:38] [PASSED] 40 VFs
[12:30:38] [PASSED] 41 VFs
[12:30:38] [PASSED] 42 VFs
[12:30:38] [PASSED] 43 VFs
[12:30:38] [PASSED] 44 VFs
[12:30:38] [PASSED] 45 VFs
[12:30:38] [PASSED] 46 VFs
[12:30:38] [PASSED] 47 VFs
[12:30:38] [PASSED] 48 VFs
[12:30:38] [PASSED] 49 VFs
[12:30:38] [PASSED] 50 VFs
[12:30:38] [PASSED] 51 VFs
[12:30:38] [PASSED] 52 VFs
[12:30:38] [PASSED] 53 VFs
[12:30:38] [PASSED] 54 VFs
[12:30:38] [PASSED] 55 VFs
[12:30:38] [PASSED] 56 VFs
[12:30:38] [PASSED] 57 VFs
[12:30:38] [PASSED] 58 VFs
[12:30:38] [PASSED] 59 VFs
[12:30:38] [PASSED] 60 VFs
[12:30:38] [PASSED] 61 VFs
[12:30:38] [PASSED] 62 VFs
[12:30:38] [PASSED] 63 VFs
[12:30:38] ================= [PASSED] fair_doorbells ==================
[12:30:38] ======================== fair_ggtt  ========================
[12:30:38] [PASSED] 1 VF
[12:30:38] [PASSED] 2 VFs
[12:30:38] [PASSED] 3 VFs
[12:30:38] [PASSED] 4 VFs
[12:30:38] [PASSED] 5 VFs
[12:30:38] [PASSED] 6 VFs
[12:30:38] [PASSED] 7 VFs
[12:30:38] [PASSED] 8 VFs
[12:30:38] [PASSED] 9 VFs
[12:30:38] [PASSED] 10 VFs
[12:30:38] [PASSED] 11 VFs
[12:30:38] [PASSED] 12 VFs
[12:30:38] [PASSED] 13 VFs
[12:30:38] [PASSED] 14 VFs
[12:30:38] [PASSED] 15 VFs
[12:30:38] [PASSED] 16 VFs
[12:30:38] [PASSED] 17 VFs
[12:30:38] [PASSED] 18 VFs
[12:30:38] [PASSED] 19 VFs
[12:30:38] [PASSED] 20 VFs
[12:30:38] [PASSED] 21 VFs
[12:30:38] [PASSED] 22 VFs
[12:30:38] [PASSED] 23 VFs
[12:30:38] [PASSED] 24 VFs
[12:30:38] [PASSED] 25 VFs
[12:30:38] [PASSED] 26 VFs
[12:30:38] [PASSED] 27 VFs
[12:30:38] [PASSED] 28 VFs
[12:30:38] [PASSED] 29 VFs
[12:30:38] [PASSED] 30 VFs
[12:30:38] [PASSED] 31 VFs
[12:30:38] [PASSED] 32 VFs
[12:30:38] [PASSED] 33 VFs
[12:30:38] [PASSED] 34 VFs
[12:30:38] [PASSED] 35 VFs
[12:30:38] [PASSED] 36 VFs
[12:30:38] [PASSED] 37 VFs
[12:30:38] [PASSED] 38 VFs
[12:30:38] [PASSED] 39 VFs
[12:30:38] [PASSED] 40 VFs
[12:30:38] [PASSED] 41 VFs
[12:30:38] [PASSED] 42 VFs
[12:30:38] [PASSED] 43 VFs
[12:30:38] [PASSED] 44 VFs
[12:30:38] [PASSED] 45 VFs
[12:30:38] [PASSED] 46 VFs
[12:30:38] [PASSED] 47 VFs
[12:30:38] [PASSED] 48 VFs
[12:30:38] [PASSED] 49 VFs
[12:30:38] [PASSED] 50 VFs
[12:30:38] [PASSED] 51 VFs
[12:30:38] [PASSED] 52 VFs
[12:30:38] [PASSED] 53 VFs
[12:30:38] [PASSED] 54 VFs
[12:30:38] [PASSED] 55 VFs
[12:30:38] [PASSED] 56 VFs
[12:30:38] [PASSED] 57 VFs
[12:30:38] [PASSED] 58 VFs
[12:30:38] [PASSED] 59 VFs
[12:30:38] [PASSED] 60 VFs
[12:30:38] [PASSED] 61 VFs
[12:30:38] [PASSED] 62 VFs
[12:30:38] [PASSED] 63 VFs
[12:30:38] ==================== [PASSED] fair_ggtt ====================
[12:30:38] ======================== fair_vram  ========================
[12:30:38] [PASSED] 1 VF
[12:30:38] [PASSED] 2 VFs
[12:30:38] [PASSED] 3 VFs
[12:30:38] [PASSED] 4 VFs
[12:30:38] [PASSED] 5 VFs
[12:30:38] [PASSED] 6 VFs
[12:30:38] [PASSED] 7 VFs
[12:30:38] [PASSED] 8 VFs
[12:30:38] [PASSED] 9 VFs
[12:30:38] [PASSED] 10 VFs
[12:30:38] [PASSED] 11 VFs
[12:30:38] [PASSED] 12 VFs
[12:30:38] [PASSED] 13 VFs
[12:30:38] [PASSED] 14 VFs
[12:30:38] [PASSED] 15 VFs
[12:30:38] [PASSED] 16 VFs
[12:30:38] [PASSED] 17 VFs
[12:30:38] [PASSED] 18 VFs
[12:30:38] [PASSED] 19 VFs
[12:30:38] [PASSED] 20 VFs
[12:30:38] [PASSED] 21 VFs
[12:30:38] [PASSED] 22 VFs
[12:30:38] [PASSED] 23 VFs
[12:30:38] [PASSED] 24 VFs
[12:30:38] [PASSED] 25 VFs
[12:30:38] [PASSED] 26 VFs
[12:30:38] [PASSED] 27 VFs
[12:30:38] [PASSED] 28 VFs
[12:30:38] [PASSED] 29 VFs
[12:30:38] [PASSED] 30 VFs
[12:30:38] [PASSED] 31 VFs
[12:30:38] [PASSED] 32 VFs
[12:30:38] [PASSED] 33 VFs
[12:30:38] [PASSED] 34 VFs
[12:30:38] [PASSED] 35 VFs
[12:30:38] [PASSED] 36 VFs
[12:30:38] [PASSED] 37 VFs
[12:30:38] [PASSED] 38 VFs
[12:30:38] [PASSED] 39 VFs
[12:30:38] [PASSED] 40 VFs
[12:30:38] [PASSED] 41 VFs
[12:30:38] [PASSED] 42 VFs
[12:30:38] [PASSED] 43 VFs
[12:30:38] [PASSED] 44 VFs
[12:30:38] [PASSED] 45 VFs
[12:30:38] [PASSED] 46 VFs
[12:30:38] [PASSED] 47 VFs
[12:30:38] [PASSED] 48 VFs
[12:30:38] [PASSED] 49 VFs
[12:30:38] [PASSED] 50 VFs
[12:30:38] [PASSED] 51 VFs
[12:30:38] [PASSED] 52 VFs
[12:30:38] [PASSED] 53 VFs
[12:30:38] [PASSED] 54 VFs
[12:30:38] [PASSED] 55 VFs
[12:30:38] [PASSED] 56 VFs
[12:30:38] [PASSED] 57 VFs
[12:30:38] [PASSED] 58 VFs
[12:30:38] [PASSED] 59 VFs
[12:30:38] [PASSED] 60 VFs
[12:30:39] [PASSED] 61 VFs
[12:30:39] [PASSED] 62 VFs
[12:30:39] [PASSED] 63 VFs
[12:30:39] ==================== [PASSED] fair_vram ====================
[12:30:39] ================== [PASSED] pf_gt_config ===================
[12:30:39] ===================== lmtt (1 subtest) =====================
[12:30:39] ======================== test_ops  =========================
[12:30:39] [PASSED] 2-level
[12:30:39] [PASSED] multi-level
[12:30:39] ==================== [PASSED] test_ops =====================
[12:30:39] ====================== [PASSED] lmtt =======================
[12:30:39] ================= sriov_packet (1 subtest) =================
[12:30:39] [PASSED] test_descriptor_init
[12:30:39] ================== [PASSED] sriov_packet ===================
[12:30:39] ================= pf_service (11 subtests) =================
[12:30:39] [PASSED] pf_negotiate_any
[12:30:39] [PASSED] pf_negotiate_base_match
[12:30:39] [PASSED] pf_negotiate_base_newer
[12:30:39] [PASSED] pf_negotiate_base_next
[12:30:39] [SKIPPED] pf_negotiate_base_older (no older minor)
[12:30:39] [PASSED] pf_negotiate_base_prev
[12:30:39] [PASSED] pf_negotiate_latest_match
[12:30:39] [PASSED] pf_negotiate_latest_newer
[12:30:39] [PASSED] pf_negotiate_latest_next
[12:30:39] [SKIPPED] pf_negotiate_latest_older (no older minor)
[12:30:39] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[12:30:39] =================== [PASSED] pf_service ====================
[12:30:39] ================= xe_guc_g2g (2 subtests) ==================
[12:30:39] ============== xe_live_guc_g2g_kunit_default  ==============
[12:30:39] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[12:30:39] ============== xe_live_guc_g2g_kunit_allmem  ===============
[12:30:39] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[12:30:39] =================== [SKIPPED] xe_guc_g2g ===================
[12:30:39] =================== xe_mocs (2 subtests) ===================
[12:30:39] ================ xe_live_mocs_kernel_kunit  ================
[12:30:39] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[12:30:39] ================ xe_live_mocs_reset_kunit  =================
[12:30:39] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[12:30:39] ==================== [SKIPPED] xe_mocs =====================
[12:30:39] ================= xe_migrate (2 subtests) ==================
[12:30:39] ================= xe_migrate_sanity_kunit  =================
[12:30:39] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[12:30:39] ================== xe_validate_ccs_kunit  ==================
[12:30:39] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[12:30:39] =================== [SKIPPED] xe_migrate ===================
[12:30:39] ================== xe_dma_buf (1 subtest) ==================
[12:30:39] ==================== xe_dma_buf_kunit  =====================
[12:30:39] ================ [SKIPPED] xe_dma_buf_kunit ================
[12:30:39] =================== [SKIPPED] xe_dma_buf ===================
[12:30:39] ================= xe_bo_shrink (1 subtest) =================
[12:30:39] =================== xe_bo_shrink_kunit  ====================
[12:30:39] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[12:30:39] ================== [SKIPPED] xe_bo_shrink ==================
[12:30:39] ==================== xe_bo (2 subtests) ====================
[12:30:39] ================== xe_ccs_migrate_kunit  ===================
[12:30:39] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[12:30:39] ==================== xe_bo_evict_kunit  ====================
[12:30:39] =============== [SKIPPED] xe_bo_evict_kunit ================
[12:30:39] ===================== [SKIPPED] xe_bo ======================
[12:30:39] =================== xe_any (9 subtests) ====================
[12:30:39] [PASSED] test_to_xe
[12:30:39] [PASSED] test_to_dev
[12:30:39] [PASSED] test_to_pdev
[12:30:39] [PASSED] test_to_drm
[12:30:39] [PASSED] test_if_pdev
[12:30:39] [PASSED] test_if_xe
[12:30:39] [PASSED] test_if_tile
[12:30:39] [PASSED] test_if_gt
[12:30:39] [PASSED] test_to_id
[12:30:39] ===================== [PASSED] xe_any ======================
[12:30:39] ==================== args (13 subtests) ====================
[12:30:39] [PASSED] count_args_test
[12:30:39] [PASSED] call_args_example
[12:30:39] [PASSED] call_args_test
[12:30:39] [PASSED] drop_first_arg_example
[12:30:39] [PASSED] drop_first_arg_test
[12:30:39] [PASSED] first_arg_example
[12:30:39] [PASSED] first_arg_test
[12:30:39] [PASSED] last_arg_example
[12:30:39] [PASSED] last_arg_test
[12:30:39] [PASSED] pick_arg_example
[12:30:39] [PASSED] if_args_example
[12:30:39] [PASSED] if_args_test
[12:30:39] [PASSED] sep_comma_example
[12:30:39] ====================== [PASSED] args =======================
[12:30:39] =================== xe_pci (3 subtests) ====================
[12:30:39] ==================== check_graphics_ip  ====================
[12:30:39] [PASSED] 12.00 Xe_LP
[12:30:39] [PASSED] 12.10 Xe_LP+
[12:30:39] [PASSED] 12.55 Xe_HPG
[12:30:39] [PASSED] 12.60 Xe_HPC
[12:30:39] [PASSED] 12.70 Xe_LPG
[12:30:39] [PASSED] 12.71 Xe_LPG
[12:30:39] [PASSED] 12.74 Xe_LPG+
[12:30:39] [PASSED] 20.01 Xe2_HPG
[12:30:39] [PASSED] 20.02 Xe2_HPG
[12:30:39] [PASSED] 20.04 Xe2_LPG
[12:30:39] [PASSED] 30.00 Xe3_LPG
[12:30:39] [PASSED] 30.01 Xe3_LPG
[12:30:39] [PASSED] 30.03 Xe3_LPG
[12:30:39] [PASSED] 30.04 Xe3_LPG
[12:30:39] [PASSED] 30.05 Xe3_LPG
[12:30:39] [PASSED] 35.10 Xe3p_LPG
[12:30:39] [PASSED] 35.11 Xe3p_XPC
[12:30:39] ================ [PASSED] check_graphics_ip ================
[12:30:39] ===================== check_media_ip  ======================
[12:30:39] [PASSED] 12.00 Xe_M
[12:30:39] [PASSED] 12.55 Xe_HPM
[12:30:39] [PASSED] 13.00 Xe_LPM+
[12:30:39] [PASSED] 13.01 Xe2_HPM
[12:30:39] [PASSED] 20.00 Xe2_LPM
[12:30:39] [PASSED] 30.00 Xe3_LPM
[12:30:39] [PASSED] 30.02 Xe3_LPM
[12:30:39] [PASSED] 35.00 Xe3p_LPM
[12:30:39] [PASSED] 35.03 Xe3p_HPM
[12:30:39] ================= [PASSED] check_media_ip ==================
[12:30:39] =================== check_platform_desc  ===================
[12:30:39] [PASSED] 0x9A60 (TIGERLAKE)
[12:30:39] [PASSED] 0x9A68 (TIGERLAKE)
[12:30:39] [PASSED] 0x9A70 (TIGERLAKE)
[12:30:39] [PASSED] 0x9A40 (TIGERLAKE)
[12:30:39] [PASSED] 0x9A49 (TIGERLAKE)
[12:30:39] [PASSED] 0x9A59 (TIGERLAKE)
[12:30:39] [PASSED] 0x9A78 (TIGERLAKE)
[12:30:39] [PASSED] 0x9AC0 (TIGERLAKE)
[12:30:39] [PASSED] 0x9AC9 (TIGERLAKE)
[12:30:39] [PASSED] 0x9AD9 (TIGERLAKE)
[12:30:39] [PASSED] 0x9AF8 (TIGERLAKE)
[12:30:39] [PASSED] 0x4C80 (ROCKETLAKE)
[12:30:39] [PASSED] 0x4C8A (ROCKETLAKE)
[12:30:39] [PASSED] 0x4C8B (ROCKETLAKE)
[12:30:39] [PASSED] 0x4C8C (ROCKETLAKE)
[12:30:39] [PASSED] 0x4C90 (ROCKETLAKE)
[12:30:39] [PASSED] 0x4C9A (ROCKETLAKE)
[12:30:39] [PASSED] 0x4680 (ALDERLAKE_S)
[12:30:39] [PASSED] 0x4682 (ALDERLAKE_S)
[12:30:39] [PASSED] 0x4688 (ALDERLAKE_S)
[12:30:39] [PASSED] 0x468A (ALDERLAKE_S)
[12:30:39] [PASSED] 0x468B (ALDERLAKE_S)
[12:30:39] [PASSED] 0x4690 (ALDERLAKE_S)
[12:30:39] [PASSED] 0x4692 (ALDERLAKE_S)
[12:30:39] [PASSED] 0x4693 (ALDERLAKE_S)
[12:30:39] [PASSED] 0x46A0 (ALDERLAKE_P)
[12:30:39] [PASSED] 0x46A1 (ALDERLAKE_P)
[12:30:39] [PASSED] 0x46A2 (ALDERLAKE_P)
[12:30:39] [PASSED] 0x46A3 (ALDERLAKE_P)
[12:30:39] [PASSED] 0x46A6 (ALDERLAKE_P)
[12:30:39] [PASSED] 0x46A8 (ALDERLAKE_P)
[12:30:39] [PASSED] 0x46AA (ALDERLAKE_P)
[12:30:39] [PASSED] 0x462A (ALDERLAKE_P)
[12:30:39] [PASSED] 0x4626 (ALDERLAKE_P)
[12:30:39] [PASSED] 0x4628 (ALDERLAKE_P)
[12:30:39] [PASSED] 0x46B0 (ALDERLAKE_P)
[12:30:39] [PASSED] 0x46B1 (ALDERLAKE_P)
[12:30:39] [PASSED] 0x46B2 (ALDERLAKE_P)
[12:30:39] [PASSED] 0x46B3 (ALDERLAKE_P)
[12:30:39] [PASSED] 0x46C0 (ALDERLAKE_P)
[12:30:39] [PASSED] 0x46C1 (ALDERLAKE_P)
[12:30:39] [PASSED] 0x46C2 (ALDERLAKE_P)
[12:30:39] [PASSED] 0x46C3 (ALDERLAKE_P)
[12:30:39] [PASSED] 0x46D0 (ALDERLAKE_N)
[12:30:39] [PASSED] 0x46D1 (ALDERLAKE_N)
[12:30:39] [PASSED] 0x46D2 (ALDERLAKE_N)
[12:30:39] [PASSED] 0x46D3 (ALDERLAKE_N)
[12:30:39] [PASSED] 0x46D4 (ALDERLAKE_N)
[12:30:39] [PASSED] 0xA721 (ALDERLAKE_P)
[12:30:39] [PASSED] 0xA7A1 (ALDERLAKE_P)
[12:30:39] [PASSED] 0xA7A9 (ALDERLAKE_P)
[12:30:39] [PASSED] 0xA7AC (ALDERLAKE_P)
[12:30:39] [PASSED] 0xA7AD (ALDERLAKE_P)
[12:30:39] [PASSED] 0xA720 (ALDERLAKE_P)
[12:30:39] [PASSED] 0xA7A0 (ALDERLAKE_P)
[12:30:39] [PASSED] 0xA7A8 (ALDERLAKE_P)
[12:30:39] [PASSED] 0xA7AA (ALDERLAKE_P)
[12:30:39] [PASSED] 0xA7AB (ALDERLAKE_P)
[12:30:39] [PASSED] 0xA780 (ALDERLAKE_S)
[12:30:39] [PASSED] 0xA781 (ALDERLAKE_S)
[12:30:39] [PASSED] 0xA782 (ALDERLAKE_S)
[12:30:39] [PASSED] 0xA783 (ALDERLAKE_S)
[12:30:39] [PASSED] 0xA788 (ALDERLAKE_S)
[12:30:39] [PASSED] 0xA789 (ALDERLAKE_S)
[12:30:39] [PASSED] 0xA78A (ALDERLAKE_S)
[12:30:39] [PASSED] 0xA78B (ALDERLAKE_S)
[12:30:39] [PASSED] 0x4905 (DG1)
[12:30:39] [PASSED] 0x4906 (DG1)
[12:30:39] [PASSED] 0x4907 (DG1)
[12:30:39] [PASSED] 0x4908 (DG1)
[12:30:39] [PASSED] 0x4909 (DG1)
[12:30:39] [PASSED] 0x56C0 (DG2)
[12:30:39] [PASSED] 0x56C2 (DG2)
[12:30:39] [PASSED] 0x56C1 (DG2)
[12:30:39] [PASSED] 0x7D51 (METEORLAKE)
[12:30:39] [PASSED] 0x7DD1 (METEORLAKE)
[12:30:39] [PASSED] 0x7D41 (METEORLAKE)
[12:30:39] [PASSED] 0x7D67 (METEORLAKE)
[12:30:39] [PASSED] 0xB640 (METEORLAKE)
[12:30:39] [PASSED] 0x56A0 (DG2)
[12:30:39] [PASSED] 0x56A1 (DG2)
[12:30:39] [PASSED] 0x56A2 (DG2)
[12:30:39] [PASSED] 0x56BE (DG2)
[12:30:39] [PASSED] 0x56BF (DG2)
[12:30:39] [PASSED] 0x5690 (DG2)
[12:30:39] [PASSED] 0x5691 (DG2)
[12:30:39] [PASSED] 0x5692 (DG2)
[12:30:39] [PASSED] 0x56A5 (DG2)
[12:30:39] [PASSED] 0x56A6 (DG2)
[12:30:39] [PASSED] 0x56B0 (DG2)
[12:30:39] [PASSED] 0x56B1 (DG2)
[12:30:39] [PASSED] 0x56BA (DG2)
[12:30:39] [PASSED] 0x56BB (DG2)
[12:30:39] [PASSED] 0x56BC (DG2)
[12:30:39] [PASSED] 0x56BD (DG2)
[12:30:39] [PASSED] 0x5693 (DG2)
[12:30:39] [PASSED] 0x5694 (DG2)
[12:30:39] [PASSED] 0x5695 (DG2)
[12:30:39] [PASSED] 0x56A3 (DG2)
[12:30:39] [PASSED] 0x56A4 (DG2)
[12:30:39] [PASSED] 0x56B2 (DG2)
[12:30:39] [PASSED] 0x56B3 (DG2)
[12:30:39] [PASSED] 0x5696 (DG2)
[12:30:39] [PASSED] 0x5697 (DG2)
[12:30:39] [PASSED] 0xB69 (PVC)
[12:30:39] [PASSED] 0xB6E (PVC)
[12:30:39] [PASSED] 0xBD4 (PVC)
[12:30:39] [PASSED] 0xBD5 (PVC)
[12:30:39] [PASSED] 0xBD6 (PVC)
[12:30:39] [PASSED] 0xBD7 (PVC)
[12:30:39] [PASSED] 0xBD8 (PVC)
[12:30:39] [PASSED] 0xBD9 (PVC)
[12:30:39] [PASSED] 0xBDA (PVC)
[12:30:39] [PASSED] 0xBDB (PVC)
[12:30:39] [PASSED] 0xBE0 (PVC)
[12:30:39] [PASSED] 0xBE1 (PVC)
[12:30:39] [PASSED] 0xBE5 (PVC)
[12:30:39] [PASSED] 0x7D40 (METEORLAKE)
[12:30:39] [PASSED] 0x7D45 (METEORLAKE)
[12:30:39] [PASSED] 0x7D55 (METEORLAKE)
[12:30:39] [PASSED] 0x7D60 (METEORLAKE)
[12:30:39] [PASSED] 0x7DD5 (METEORLAKE)
[12:30:39] [PASSED] 0x6420 (LUNARLAKE)
[12:30:39] [PASSED] 0x64A0 (LUNARLAKE)
[12:30:39] [PASSED] 0x64B0 (LUNARLAKE)
[12:30:39] [PASSED] 0xE202 (BATTLEMAGE)
[12:30:39] [PASSED] 0xE209 (BATTLEMAGE)
[12:30:39] [PASSED] 0xE20B (BATTLEMAGE)
[12:30:39] [PASSED] 0xE20C (BATTLEMAGE)
[12:30:39] [PASSED] 0xE20D (BATTLEMAGE)
[12:30:39] [PASSED] 0xE210 (BATTLEMAGE)
[12:30:39] [PASSED] 0xE211 (BATTLEMAGE)
[12:30:39] [PASSED] 0xE212 (BATTLEMAGE)
[12:30:39] [PASSED] 0xE216 (BATTLEMAGE)
[12:30:39] [PASSED] 0xE220 (BATTLEMAGE)
[12:30:39] [PASSED] 0xE221 (BATTLEMAGE)
[12:30:39] [PASSED] 0xE222 (BATTLEMAGE)
[12:30:39] [PASSED] 0xE223 (BATTLEMAGE)
[12:30:39] [PASSED] 0xB080 (PANTHERLAKE)
[12:30:39] [PASSED] 0xB081 (PANTHERLAKE)
[12:30:39] [PASSED] 0xB082 (PANTHERLAKE)
[12:30:39] [PASSED] 0xB083 (PANTHERLAKE)
[12:30:39] [PASSED] 0xB084 (PANTHERLAKE)
[12:30:39] [PASSED] 0xB085 (PANTHERLAKE)
[12:30:39] [PASSED] 0xB086 (PANTHERLAKE)
[12:30:39] [PASSED] 0xB087 (PANTHERLAKE)
[12:30:39] [PASSED] 0xB08F (PANTHERLAKE)
[12:30:39] [PASSED] 0xB090 (PANTHERLAKE)
[12:30:39] [PASSED] 0xB0A0 (PANTHERLAKE)
[12:30:39] [PASSED] 0xB0A1 (PANTHERLAKE)
[12:30:39] [PASSED] 0xB0B0 (PANTHERLAKE)
[12:30:39] [PASSED] 0xFD80 (PANTHERLAKE)
[12:30:39] [PASSED] 0xFD81 (PANTHERLAKE)
[12:30:39] [PASSED] 0xD740 (NOVALAKE_S)
[12:30:39] [PASSED] 0xD741 (NOVALAKE_S)
[12:30:39] [PASSED] 0xD742 (NOVALAKE_S)
[12:30:39] [PASSED] 0xD743 (NOVALAKE_S)
[12:30:39] [PASSED] 0xD745 (NOVALAKE_S)
[12:30:39] [PASSED] 0xD74A (NOVALAKE_S)
[12:30:39] [PASSED] 0xD74B (NOVALAKE_S)
[12:30:39] [PASSED] 0x674C (CRESCENTISLAND)
[12:30:39] [PASSED] 0x674D (CRESCENTISLAND)
[12:30:39] [PASSED] 0x674E (CRESCENTISLAND)
[12:30:39] [PASSED] 0x674F (CRESCENTISLAND)
[12:30:39] [PASSED] 0x6750 (CRESCENTISLAND)
[12:30:39] [PASSED] 0x6751 (CRESCENTISLAND)
[12:30:39] [PASSED] 0xD750 (NOVALAKE_P)
[12:30:39] [PASSED] 0xD751 (NOVALAKE_P)
[12:30:39] [PASSED] 0xD752 (NOVALAKE_P)
[12:30:39] [PASSED] 0xD753 (NOVALAKE_P)
[12:30:39] [PASSED] 0xD754 (NOVALAKE_P)
[12:30:39] [PASSED] 0xD755 (NOVALAKE_P)
[12:30:39] [PASSED] 0xD756 (NOVALAKE_P)
[12:30:39] [PASSED] 0xD757 (NOVALAKE_P)
[12:30:39] [PASSED] 0xD75F (NOVALAKE_P)
[12:30:39] =============== [PASSED] check_platform_desc ===============
[12:30:39] ===================== [PASSED] xe_pci ======================
[12:30:39] ============= xe_rtp_tables_test (5 subtests) ==============
[12:30:39] ================== xe_rtp_table_gt_test  ===================
[12:30:39] [PASSED] gt_was/14011060649
[12:30:39] [PASSED] gt_was/14011059788
[12:30:39] [PASSED] gt_was/14015795083
[12:30:39] [PASSED] gt_was/16021867713
[12:30:39] [PASSED] gt_was/14019449301
[12:30:39] [PASSED] gt_was/16028005424
[12:30:39] [PASSED] gt_was/14026578760
[12:30:39] [PASSED] gt_was/1409420604
[12:30:39] [PASSED] gt_was/1408615072
[12:30:39] [PASSED] gt_was/22010523718
[12:30:39] [PASSED] gt_was/14011006942
[12:30:39] [PASSED] gt_was/14014830051
[12:30:39] [PASSED] gt_was/18018781329
[12:30:39] [PASSED] gt_was/1509235366
[12:30:39] [PASSED] gt_was/18018781329
[12:30:39] [PASSED] gt_was/16016694945
[12:30:39] [PASSED] gt_was/14018575942
[12:30:39] [PASSED] gt_was/22016670082
[12:30:39] [PASSED] gt_was/22016670082
[12:30:39] [PASSED] gt_was/14017421178
[12:30:39] [PASSED] gt_was/16025250150
[12:30:39] [PASSED] gt_was/14021871409
[12:30:39] [PASSED] gt_was/16021865536
[12:30:39] [PASSED] gt_was/14021486841
[12:30:39] [PASSED] gt_was/14025160223
[12:30:39] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[12:30:39] [PASSED] gt_was/14025635424
[12:30:39] [PASSED] gt_was/16028005424
[12:30:39] ============== [PASSED] xe_rtp_table_gt_test ===============
[12:30:39] ================== xe_rtp_table_gt_test  ===================
[12:30:39] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[12:30:39] [PASSED] gt_tunings/Tuning: 32B Access Enable
[12:30:39] [PASSED] gt_tunings/Tuning: L3 cache
[12:30:39] [PASSED] gt_tunings/Tuning: L3 cache - media
[12:30:39] [PASSED] gt_tunings/Tuning: Compression Overfetch
[12:30:39] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[12:30:39] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[12:30:39] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[12:30:39] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[12:30:39] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[12:30:39] [PASSED] gt_tunings/Tuning: Stateless compression control
[12:30:39] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[12:30:39] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[12:30:39] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[12:30:39] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[12:30:39] [PASSED] gt_tunings/Tuning: Force All Non-Compressible Memory Reads to be 256B Overfetches
[12:30:39] ============== [PASSED] xe_rtp_table_gt_test ===============
[12:30:39] ================== xe_rtp_table_oob_test  ==================
[12:30:39] [PASSED] oob_was/1607983814
[12:30:39] [PASSED] oob_was/16010904313
[12:30:39] [PASSED] oob_was/18022495364
[12:30:39] [PASSED] oob_was/22012773006
[12:30:39] [PASSED] oob_was/14014475959
[12:30:39] [PASSED] oob_was/22011391025
[12:30:39] [PASSED] oob_was/22012727170
[12:30:39] [PASSED] oob_was/22012727685
[12:30:39] [PASSED] oob_was/22016596838
[12:30:39] [PASSED] oob_was/18020744125
[12:30:39] [PASSED] oob_was/1409600907
[12:30:39] [PASSED] oob_was/22014953428
[12:30:39] [PASSED] oob_was/16017236439
[12:30:39] [PASSED] oob_was/14019821291
[12:30:39] [PASSED] oob_was/14015076503
[12:30:39] [PASSED] oob_was/22016122933
[12:30:39] [PASSED] oob_was/14018913170
[12:30:39] [PASSED] oob_was/14018094691
[12:30:39] [PASSED] oob_was/18024947630
[12:30:39] [PASSED] oob_was/16022287689
[12:30:39] [PASSED] oob_was/13011645652
[12:30:39] [PASSED] oob_was/14022293748
[12:30:39] [PASSED] oob_was/22019794406
[12:30:39] [PASSED] oob_was/22019338487
[12:30:39] [PASSED] oob_was/16023588340
[12:30:39] [PASSED] oob_was/14019789679
[12:30:39] [PASSED] oob_was/14022866841
[12:30:39] [PASSED] oob_was/16021333562
[12:30:39] [PASSED] oob_was/14016712196
[12:30:39] [PASSED] oob_was/14015568240
[12:30:39] [PASSED] oob_was/18013179988
[12:30:39] [PASSED] oob_was/1508761755
[12:30:39] [PASSED] oob_was/16023105232
[12:30:39] [PASSED] oob_was/16026508708
[12:30:39] [PASSED] oob_was/14020001231
[12:30:39] [PASSED] oob_was/16023683509
[12:30:39] [PASSED] oob_was/14025515070
[12:30:39] [PASSED] oob_was/15015404425_disable
[12:30:39] [PASSED] oob_was/16026007364
[12:30:39] [PASSED] oob_was/14020316580
[12:30:39] [PASSED] oob_was/14025883347
[12:30:39] [PASSED] oob_was/16029380221
[12:30:39] [PASSED] oob_was/22022079272
[12:30:39] [PASSED] oob_was/16029897822
[12:30:39] [PASSED] oob_was/14027054324
[12:30:39] [PASSED] oob_was/14025941587
[12:30:39] [PASSED] oob_was/16030224309
[12:30:39] ============== [PASSED] xe_rtp_table_oob_test ==============
[12:30:39] ================ xe_rtp_table_dev_oob_test  ================
[12:30:39] [PASSED] device_oob_was/22010954014
[12:30:39] [PASSED] device_oob_was/15015404425
[12:30:39] [PASSED] device_oob_was/22019338487_display
[12:30:39] [PASSED] device_oob_was/14022085890
[12:30:39] [PASSED] device_oob_was/14026539277
[12:30:39] [PASSED] device_oob_was/14026633728
[12:30:39] [PASSED] device_oob_was/14026746987
[12:30:39] [PASSED] device_oob_was/14026779378
[12:30:39] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[12:30:39] ========== xe_rtp_table_missing_upper_bound_test  ==========
[12:30:39] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[12:30:39] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[12:30:39] [PASSED] register_whitelist/1806527549
[12:30:39] [PASSED] register_whitelist/allow_read_ctx_timestamp
[12:30:39] [PASSED] register_whitelist/allow_read_queue_timestamp
[12:30:39] [PASSED] register_whitelist/16014440446
[12:30:39] [PASSED] register_whitelist/16017236439
[12:30:39] [PASSED] register_whitelist/16020183090
[12:30:39] [PASSED] register_whitelist/14024997852
[12:30:39] [PASSED] register_whitelist/14024997852
[12:30:39] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[12:30:39] =============== [PASSED] xe_rtp_tables_test ================
[12:30:39] =================== xe_rtp (3 subtests) ====================
[12:30:39] =================== xe_rtp_rules_tests  ====================
[12:30:39] [PASSED] no
[12:30:39] [PASSED] yes
[12:30:39] [PASSED] no-and-no
[12:30:39] [PASSED] no-and-yes
[12:30:39] [PASSED] yes-and-no
[12:30:39] [PASSED] yes-and-yes
[12:30:39] [PASSED] no-or-no
[12:30:39] [PASSED] no-or-yes
[12:30:39] [PASSED] yes-or-no
[12:30:39] [PASSED] yes-or-yes
[12:30:39] [PASSED] no-yes-or-yes-no
[12:30:39] [PASSED] no-yes-or-yes-yes
[12:30:39] [PASSED] yes-yes-or-no-yes
[12:30:39] [PASSED] yes-yes-or-yes-yes
[12:30:39] [PASSED] no-no-or-yes-or-no
[12:30:39] [PASSED] or
[12:30:39] [PASSED] or-yes
[12:30:39] [PASSED] or-no
[12:30:39] [PASSED] yes-or
[12:30:39] [PASSED] no-or
[12:30:39] [PASSED] no-or-or-yes
[12:30:39] [PASSED] yes-or-or-no
[12:30:39] [PASSED] no-or-or-no
[12:30:39] [PASSED] missing-context-engine-class
[12:30:39] [PASSED] missing-context-engine-class-or-yes
[12:30:39] [PASSED] missing-context-engine-class-or-or-yes
[12:30:39] =============== [PASSED] xe_rtp_rules_tests ================
[12:30:39] =============== xe_rtp_process_to_sr_tests  ================
[12:30:39] [PASSED] coalesce-same-reg
[12:30:39] [PASSED] coalesce-same-reg-literal-and-func
[12:30:39] [PASSED] no-match-no-add
[12:30:39] [PASSED] two-regs-two-entries
[12:30:39] [PASSED] clr-one-set-other
[12:30:39] [PASSED] set-field
[12:30:39] [PASSED] conflict-duplicate
[12:30:39] [PASSED] conflict-not-disjoint
[12:30:39] [PASSED] conflict-not-disjoint-literal-and-func
[12:30:39] [PASSED] conflict-reg-type
[12:30:39] [PASSED] bad-mcr-reg-forced-to-regular
[12:30:39] [PASSED] bad-regular-reg-forced-to-mcr
[12:30:39] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[12:30:39] ================== xe_rtp_process_tests  ===================
[12:30:39] [PASSED] active1
[12:30:39] [PASSED] active2
[12:30:39] [PASSED] active-inactive
[12:30:39] [PASSED] inactive-active
[12:30:39] [PASSED] inactive-active-inactive
[12:30:39] [PASSED] inactive-inactive-inactive
[12:30:39] ============== [PASSED] xe_rtp_process_tests ===============
[12:30:39] ===================== [PASSED] xe_rtp ======================
[12:30:39] ==================== xe_wa (1 subtest) =====================
[12:30:39] ======================== xe_wa_gt  =========================
[12:30:39] [PASSED] TIGERLAKE B0
[12:30:39] [PASSED] DG1 A0
[12:30:39] [PASSED] DG1 B0
[12:30:39] [PASSED] ALDERLAKE_S A0
[12:30:39] [PASSED] ALDERLAKE_S B0
[12:30:39] [PASSED] ALDERLAKE_S C0
[12:30:39] [PASSED] ALDERLAKE_S D0
[12:30:39] [PASSED] ALDERLAKE_P A0
[12:30:39] [PASSED] ALDERLAKE_P B0
[12:30:39] [PASSED] ALDERLAKE_P C0
[12:30:39] [PASSED] ALDERLAKE_S RPLS D0
[12:30:39] [PASSED] ALDERLAKE_P RPLU E0
[12:30:39] [PASSED] DG2 G10 C0
[12:30:39] [PASSED] DG2 G11 B1
[12:30:39] [PASSED] DG2 G12 A1
[12:30:39] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[12:30:39] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[12:30:39] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[12:30:39] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[12:30:39] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[12:30:39] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[12:30:39] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[12:30:39] ==================== [PASSED] xe_wa_gt =====================
[12:30:39] ====================== [PASSED] xe_wa ======================
[12:30:39] ============================================================
[12:30:39] Testing complete. Ran 825 tests: passed: 797, skipped: 28
[12:30:39] Elapsed time: 36.865s total, 1.781s configuring, 34.318s building, 0.716s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[12:30:39] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:30:41] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[12:31:06] Starting KUnit Kernel (1/1)...
[12:31:06] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[12:31:06] ============= refcount_interrupt (4 subtests) ==============
[12:31:06] [PASSED] test_single_irq_change
[12:31:06] [PASSED] test_nested_irq_change
[12:31:06] [PASSED] test_multiple_irq_change
[12:31:06] [PASSED] test_irq_save
[12:31:06] =============== [PASSED] refcount_interrupt ================
[12:31:06] ============ drm_test_pick_cmdline (2 subtests) ============
[12:31:06] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[12:31:06] =============== drm_test_pick_cmdline_named  ===============
[12:31:06] [PASSED] NTSC
[12:31:06] [PASSED] NTSC-J
[12:31:06] [PASSED] PAL
[12:31:06] [PASSED] PAL-M
[12:31:06] =========== [PASSED] drm_test_pick_cmdline_named ===========
[12:31:06] ============== [PASSED] drm_test_pick_cmdline ==============
[12:31:06] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[12:31:06] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[12:31:06] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[12:31:06] =========== drm_validate_clone_mode (2 subtests) ===========
[12:31:06] ============== drm_test_check_in_clone_mode  ===============
[12:31:06] [PASSED] in_clone_mode
[12:31:06] [PASSED] not_in_clone_mode
[12:31:06] ========== [PASSED] drm_test_check_in_clone_mode ===========
[12:31:06] =============== drm_test_check_valid_clones  ===============
[12:31:06] [PASSED] not_in_clone_mode
[12:31:06] [PASSED] valid_clone
[12:31:06] [PASSED] invalid_clone
[12:31:06] =========== [PASSED] drm_test_check_valid_clones ===========
[12:31:06] ============= [PASSED] drm_validate_clone_mode =============
[12:31:06] ============= drm_validate_modeset (1 subtest) =============
[12:31:06] [PASSED] drm_test_check_connector_changed_modeset
[12:31:06] ============== [PASSED] drm_validate_modeset ===============
[12:31:06] ====== drm_test_bridge_get_current_state (1 subtest) =======
[12:31:06] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[12:31:06] ======== [PASSED] drm_test_bridge_get_current_state ========
[12:31:06] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[12:31:06] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[12:31:06] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[12:31:06] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[12:31:06] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[12:31:06] ============== drm_bridge_alloc (2 subtests) ===============
[12:31:06] [PASSED] drm_test_drm_bridge_alloc_basic
[12:31:06] [PASSED] drm_test_drm_bridge_alloc_get_put
[12:31:06] ================ [PASSED] drm_bridge_alloc =================
[12:31:06] ============= drm_bridge_bus_fmt (5 subtests) ==============
[12:31:06] [PASSED] drm_test_bridge_rgb_yuv_rgb
[12:31:06] [PASSED] drm_test_bridge_must_convert_to_yuv444
[12:31:06] [PASSED] drm_test_bridge_hdmi_auto_rgb
[12:31:06] [PASSED] drm_test_bridge_auto_first
[12:31:06] [PASSED] drm_test_bridge_rgb_yuv_no_path
[12:31:06] =============== [PASSED] drm_bridge_bus_fmt ================
[12:31:06] ============= drm_cmdline_parser (40 subtests) =============
[12:31:06] [PASSED] drm_test_cmdline_force_d_only
[12:31:06] [PASSED] drm_test_cmdline_force_D_only_dvi
[12:31:06] [PASSED] drm_test_cmdline_force_D_only_hdmi
[12:31:06] [PASSED] drm_test_cmdline_force_D_only_not_digital
[12:31:06] [PASSED] drm_test_cmdline_force_e_only
[12:31:06] [PASSED] drm_test_cmdline_res
[12:31:06] [PASSED] drm_test_cmdline_res_vesa
[12:31:06] [PASSED] drm_test_cmdline_res_vesa_rblank
[12:31:06] [PASSED] drm_test_cmdline_res_rblank
[12:31:06] [PASSED] drm_test_cmdline_res_bpp
[12:31:06] [PASSED] drm_test_cmdline_res_refresh
[12:31:06] [PASSED] drm_test_cmdline_res_bpp_refresh
[12:31:06] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[12:31:06] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[12:31:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[12:31:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[12:31:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[12:31:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[12:31:06] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[12:31:06] [PASSED] drm_test_cmdline_res_margins_force_on
[12:31:06] [PASSED] drm_test_cmdline_res_vesa_margins
[12:31:06] [PASSED] drm_test_cmdline_name
[12:31:06] [PASSED] drm_test_cmdline_name_bpp
[12:31:06] [PASSED] drm_test_cmdline_name_option
[12:31:06] [PASSED] drm_test_cmdline_name_bpp_option
[12:31:06] [PASSED] drm_test_cmdline_rotate_0
[12:31:06] [PASSED] drm_test_cmdline_rotate_90
[12:31:06] [PASSED] drm_test_cmdline_rotate_180
[12:31:06] [PASSED] drm_test_cmdline_rotate_270
[12:31:06] [PASSED] drm_test_cmdline_hmirror
[12:31:06] [PASSED] drm_test_cmdline_vmirror
[12:31:06] [PASSED] drm_test_cmdline_margin_options
[12:31:06] [PASSED] drm_test_cmdline_multiple_options
[12:31:06] [PASSED] drm_test_cmdline_bpp_extra_and_option
[12:31:06] [PASSED] drm_test_cmdline_extra_and_option
[12:31:06] [PASSED] drm_test_cmdline_freestanding_options
[12:31:06] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[12:31:06] [PASSED] drm_test_cmdline_panel_orientation
[12:31:06] ================ drm_test_cmdline_invalid  =================
[12:31:06] [PASSED] margin_only
[12:31:06] [PASSED] interlace_only
[12:31:06] [PASSED] res_missing_x
[12:31:06] [PASSED] res_missing_y
[12:31:06] [PASSED] res_bad_y
[12:31:06] [PASSED] res_missing_y_bpp
[12:31:06] [PASSED] res_bad_bpp
[12:31:06] [PASSED] res_bad_refresh
[12:31:06] [PASSED] res_bpp_refresh_force_on_off
[12:31:06] [PASSED] res_invalid_mode
[12:31:06] [PASSED] res_bpp_wrong_place_mode
[12:31:06] [PASSED] name_bpp_refresh
[12:31:06] [PASSED] name_refresh
[12:31:06] [PASSED] name_refresh_wrong_mode
[12:31:06] [PASSED] name_refresh_invalid_mode
[12:31:06] [PASSED] rotate_multiple
[12:31:06] [PASSED] rotate_invalid_val
[12:31:06] [PASSED] rotate_truncated
[12:31:06] [PASSED] invalid_option
[12:31:06] [PASSED] invalid_tv_option
[12:31:06] [PASSED] truncated_tv_option
[12:31:06] ============ [PASSED] drm_test_cmdline_invalid =============
[12:31:06] =============== drm_test_cmdline_tv_options  ===============
[12:31:06] [PASSED] NTSC
[12:31:06] [PASSED] NTSC_443
[12:31:06] [PASSED] NTSC_J
[12:31:06] [PASSED] PAL
[12:31:06] [PASSED] PAL_M
[12:31:06] [PASSED] PAL_N
[12:31:06] [PASSED] SECAM
[12:31:06] [PASSED] MONO_525
[12:31:06] [PASSED] MONO_625
[12:31:06] =========== [PASSED] drm_test_cmdline_tv_options ===========
[12:31:06] =============== [PASSED] drm_cmdline_parser ================
[12:31:06] ========== drmm_connector_hdmi_init (20 subtests) ==========
[12:31:06] [PASSED] drm_test_connector_hdmi_init_valid
[12:31:06] [PASSED] drm_test_connector_hdmi_init_bpc_8
[12:31:06] [PASSED] drm_test_connector_hdmi_init_bpc_10
[12:31:06] [PASSED] drm_test_connector_hdmi_init_bpc_12
[12:31:06] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[12:31:06] [PASSED] drm_test_connector_hdmi_init_bpc_null
[12:31:06] [PASSED] drm_test_connector_hdmi_init_formats_empty
[12:31:06] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[12:31:06] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[12:31:06] [PASSED] supported_formats=0x9 yuv420_allowed=1
[12:31:06] [PASSED] supported_formats=0x9 yuv420_allowed=0
[12:31:06] [PASSED] supported_formats=0x5 yuv420_allowed=1
[12:31:06] [PASSED] supported_formats=0x5 yuv420_allowed=0
[12:31:06] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[12:31:06] [PASSED] drm_test_connector_hdmi_init_null_ddc
[12:31:06] [PASSED] drm_test_connector_hdmi_init_null_product
[12:31:06] [PASSED] drm_test_connector_hdmi_init_null_vendor
[12:31:06] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[12:31:06] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[12:31:06] [PASSED] drm_test_connector_hdmi_init_product_valid
[12:31:06] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[12:31:06] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[12:31:06] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[12:31:06] ========= drm_test_connector_hdmi_init_type_valid  =========
[12:31:06] [PASSED] HDMI-A
[12:31:06] [PASSED] HDMI-B
[12:31:06] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[12:31:06] ======== drm_test_connector_hdmi_init_type_invalid  ========
[12:31:06] [PASSED] Unknown
[12:31:06] [PASSED] VGA
[12:31:06] [PASSED] DVI-I
[12:31:06] [PASSED] DVI-D
[12:31:06] [PASSED] DVI-A
[12:31:06] [PASSED] Composite
[12:31:06] [PASSED] SVIDEO
[12:31:06] [PASSED] LVDS
[12:31:06] [PASSED] Component
[12:31:06] [PASSED] DIN
[12:31:06] [PASSED] DP
[12:31:06] [PASSED] TV
[12:31:06] [PASSED] eDP
[12:31:06] [PASSED] Virtual
[12:31:06] [PASSED] DSI
[12:31:06] [PASSED] DPI
[12:31:06] [PASSED] Writeback
[12:31:06] [PASSED] SPI
[12:31:06] [PASSED] USB
[12:31:06] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[12:31:06] ============ [PASSED] drmm_connector_hdmi_init =============
[12:31:06] ============= drmm_connector_init (3 subtests) =============
[12:31:06] [PASSED] drm_test_drmm_connector_init
[12:31:06] [PASSED] drm_test_drmm_connector_init_null_ddc
[12:31:06] ========= drm_test_drmm_connector_init_type_valid  =========
[12:31:06] [PASSED] Unknown
[12:31:06] [PASSED] VGA
[12:31:06] [PASSED] DVI-I
[12:31:06] [PASSED] DVI-D
[12:31:06] [PASSED] DVI-A
[12:31:06] [PASSED] Composite
[12:31:06] [PASSED] SVIDEO
[12:31:06] [PASSED] LVDS
[12:31:06] [PASSED] Component
[12:31:06] [PASSED] DIN
[12:31:06] [PASSED] DP
[12:31:06] [PASSED] HDMI-A
[12:31:06] [PASSED] HDMI-B
[12:31:06] [PASSED] TV
[12:31:06] [PASSED] eDP
[12:31:06] [PASSED] Virtual
[12:31:06] [PASSED] DSI
[12:31:06] [PASSED] DPI
[12:31:06] [PASSED] Writeback
[12:31:06] [PASSED] SPI
[12:31:06] [PASSED] USB
[12:31:06] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[12:31:06] =============== [PASSED] drmm_connector_init ===============
[12:31:06] ========= drm_connector_dynamic_init (6 subtests) ==========
[12:31:06] [PASSED] drm_test_drm_connector_dynamic_init
[12:31:06] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[12:31:06] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[12:31:06] [PASSED] drm_test_drm_connector_dynamic_init_properties
[12:31:06] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[12:31:06] [PASSED] Unknown
[12:31:06] [PASSED] VGA
[12:31:06] [PASSED] DVI-I
[12:31:06] [PASSED] DVI-D
[12:31:06] [PASSED] DVI-A
[12:31:06] [PASSED] Composite
[12:31:06] [PASSED] SVIDEO
[12:31:06] [PASSED] LVDS
[12:31:06] [PASSED] Component
[12:31:06] [PASSED] DIN
[12:31:06] [PASSED] DP
[12:31:06] [PASSED] HDMI-A
[12:31:06] [PASSED] HDMI-B
[12:31:06] [PASSED] TV
[12:31:06] [PASSED] eDP
[12:31:06] [PASSED] Virtual
[12:31:06] [PASSED] DSI
[12:31:06] [PASSED] DPI
[12:31:06] [PASSED] Writeback
[12:31:06] [PASSED] SPI
[12:31:06] [PASSED] USB
[12:31:06] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[12:31:06] ======== drm_test_drm_connector_dynamic_init_name  =========
[12:31:06] [PASSED] Unknown
[12:31:06] [PASSED] VGA
[12:31:06] [PASSED] DVI-I
[12:31:06] [PASSED] DVI-D
[12:31:06] [PASSED] DVI-A
[12:31:06] [PASSED] Composite
[12:31:06] [PASSED] SVIDEO
[12:31:06] [PASSED] LVDS
[12:31:06] [PASSED] Component
[12:31:06] [PASSED] DIN
[12:31:06] [PASSED] DP
[12:31:06] [PASSED] HDMI-A
[12:31:06] [PASSED] HDMI-B
[12:31:06] [PASSED] TV
[12:31:06] [PASSED] eDP
[12:31:06] [PASSED] Virtual
[12:31:06] [PASSED] DSI
[12:31:06] [PASSED] DPI
[12:31:06] [PASSED] Writeback
[12:31:06] [PASSED] SPI
[12:31:06] [PASSED] USB
[12:31:06] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[12:31:06] =========== [PASSED] drm_connector_dynamic_init ============
[12:31:06] ==== drm_connector_dynamic_register_early (4 subtests) =====
[12:31:06] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[12:31:06] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[12:31:06] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[12:31:06] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[12:31:06] ====== [PASSED] drm_connector_dynamic_register_early =======
[12:31:06] ======= drm_connector_dynamic_register (7 subtests) ========
[12:31:06] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[12:31:06] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[12:31:06] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[12:31:06] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[12:31:06] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[12:31:06] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[12:31:06] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[12:31:06] ========= [PASSED] drm_connector_dynamic_register ==========
[12:31:06] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[12:31:06] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[12:31:06] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[12:31:06] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[12:31:06] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[12:31:06] ========== drm_test_get_tv_mode_from_name_valid  ===========
[12:31:06] [PASSED] NTSC
[12:31:06] [PASSED] NTSC-443
[12:31:06] [PASSED] NTSC-J
[12:31:06] [PASSED] PAL
[12:31:06] [PASSED] PAL-M
[12:31:06] [PASSED] PAL-N
[12:31:06] [PASSED] SECAM
[12:31:06] [PASSED] Mono
[12:31:06] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[12:31:06] [PASSED] drm_test_get_tv_mode_from_name_truncated
[12:31:06] ============ [PASSED] drm_get_tv_mode_from_name ============
[12:31:06] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[12:31:06] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[12:31:06] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[12:31:06] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[12:31:06] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[12:31:06] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[12:31:06] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[12:31:06] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[12:31:06] [PASSED] VIC 96
[12:31:06] [PASSED] VIC 97
[12:31:06] [PASSED] VIC 101
[12:31:06] [PASSED] VIC 102
[12:31:06] [PASSED] VIC 106
[12:31:06] [PASSED] VIC 107
[12:31:06] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[12:31:06] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[12:31:06] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[12:31:06] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[12:31:06] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[12:31:06] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[12:31:06] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[12:31:06] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[12:31:06] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[12:31:06] [PASSED] Automatic
[12:31:06] [PASSED] Full
[12:31:06] [PASSED] Limited 16:235
[12:31:06] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[12:31:06] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[12:31:06] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[12:31:06] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[12:31:06] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[12:31:06] [PASSED] RGB
[12:31:06] [PASSED] YUV 4:2:0
[12:31:06] [PASSED] YUV 4:2:2
[12:31:06] [PASSED] YUV 4:4:4
[12:31:06] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[12:31:06] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[12:31:06] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[12:31:06] ============= drm_damage_helper (21 subtests) ==============
[12:31:06] [PASSED] drm_test_damage_iter_no_damage
[12:31:06] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[12:31:06] [PASSED] drm_test_damage_iter_no_damage_src_moved
[12:31:06] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[12:31:06] [PASSED] drm_test_damage_iter_no_damage_not_visible
[12:31:06] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[12:31:06] [PASSED] drm_test_damage_iter_no_damage_no_fb
[12:31:06] [PASSED] drm_test_damage_iter_simple_damage
[12:31:06] [PASSED] drm_test_damage_iter_single_damage
[12:31:06] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[12:31:06] [PASSED] drm_test_damage_iter_single_damage_outside_src
[12:31:06] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[12:31:06] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[12:31:06] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[12:31:06] [PASSED] drm_test_damage_iter_single_damage_src_moved
[12:31:06] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[12:31:06] [PASSED] drm_test_damage_iter_damage
[12:31:06] [PASSED] drm_test_damage_iter_damage_one_intersect
[12:31:06] [PASSED] drm_test_damage_iter_damage_one_outside
[12:31:06] [PASSED] drm_test_damage_iter_damage_src_moved
[12:31:06] [PASSED] drm_test_damage_iter_damage_not_visible
[12:31:06] ================ [PASSED] drm_damage_helper ================
[12:31:06] ============== drm_dp_mst_helper (3 subtests) ==============
[12:31:06] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[12:31:06] [PASSED] Clock 154000 BPP 30 DSC disabled
[12:31:06] [PASSED] Clock 234000 BPP 30 DSC disabled
[12:31:06] [PASSED] Clock 297000 BPP 24 DSC disabled
[12:31:06] [PASSED] Clock 332880 BPP 24 DSC enabled
[12:31:06] [PASSED] Clock 324540 BPP 24 DSC enabled
[12:31:06] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[12:31:06] ============== drm_test_dp_mst_calc_pbn_div  ===============
[12:31:06] [PASSED] Link rate 2000000 lane count 4
[12:31:06] [PASSED] Link rate 2000000 lane count 2
[12:31:06] [PASSED] Link rate 2000000 lane count 1
[12:31:06] [PASSED] Link rate 1350000 lane count 4
[12:31:06] [PASSED] Link rate 1350000 lane count 2
[12:31:06] [PASSED] Link rate 1350000 lane count 1
[12:31:06] [PASSED] Link rate 1000000 lane count 4
[12:31:06] [PASSED] Link rate 1000000 lane count 2
[12:31:06] [PASSED] Link rate 1000000 lane count 1
[12:31:06] [PASSED] Link rate 810000 lane count 4
[12:31:06] [PASSED] Link rate 810000 lane count 2
[12:31:06] [PASSED] Link rate 810000 lane count 1
[12:31:06] [PASSED] Link rate 540000 lane count 4
[12:31:06] [PASSED] Link rate 540000 lane count 2
[12:31:06] [PASSED] Link rate 540000 lane count 1
[12:31:06] [PASSED] Link rate 270000 lane count 4
[12:31:06] [PASSED] Link rate 270000 lane count 2
[12:31:06] [PASSED] Link rate 270000 lane count 1
[12:31:06] [PASSED] Link rate 162000 lane count 4
[12:31:06] [PASSED] Link rate 162000 lane count 2
[12:31:06] [PASSED] Link rate 162000 lane count 1
[12:31:06] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[12:31:06] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[12:31:06] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[12:31:06] [PASSED] DP_POWER_UP_PHY with port number
[12:31:06] [PASSED] DP_POWER_DOWN_PHY with port number
[12:31:06] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[12:31:06] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[12:31:06] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[12:31:06] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[12:31:06] [PASSED] DP_QUERY_PAYLOAD with port number
[12:31:06] [PASSED] DP_QUERY_PAYLOAD with VCPI
[12:31:06] [PASSED] DP_REMOTE_DPCD_READ with port number
[12:31:06] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[12:31:06] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[12:31:06] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[12:31:06] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[12:31:06] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[12:31:06] [PASSED] DP_REMOTE_I2C_READ with port number
[12:31:06] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[12:31:06] [PASSED] DP_REMOTE_I2C_READ with transactions array
[12:31:06] [PASSED] DP_REMOTE_I2C_WRITE with port number
[12:31:06] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[12:31:06] [PASSED] DP_REMOTE_I2C_WRITE with data array
[12:31:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[12:31:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[12:31:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[12:31:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[12:31:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[12:31:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[12:31:06] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[12:31:06] ================ [PASSED] drm_dp_mst_helper ================
[12:31:06] ================== drm_exec (7 subtests) ===================
[12:31:06] [PASSED] sanitycheck
[12:31:06] [PASSED] test_lock
[12:31:06] [PASSED] test_lock_unlock
[12:31:06] [PASSED] test_duplicates
[12:31:06] [PASSED] test_prepare
[12:31:06] [PASSED] test_prepare_array
[12:31:06] [PASSED] test_multiple_loops
[12:31:06] ==================== [PASSED] drm_exec =====================
[12:31:06] =========== drm_format_helper_test (17 subtests) ===========
[12:31:06] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[12:31:06] [PASSED] single_pixel_source_buffer
[12:31:06] [PASSED] single_pixel_clip_rectangle
[12:31:06] [PASSED] well_known_colors
[12:31:06] [PASSED] destination_pitch
[12:31:06] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[12:31:06] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[12:31:06] [PASSED] single_pixel_source_buffer
[12:31:06] [PASSED] single_pixel_clip_rectangle
[12:31:06] [PASSED] well_known_colors
[12:31:06] [PASSED] destination_pitch
[12:31:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[12:31:06] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[12:31:06] [PASSED] single_pixel_source_buffer
[12:31:06] [PASSED] single_pixel_clip_rectangle
[12:31:06] [PASSED] well_known_colors
[12:31:06] [PASSED] destination_pitch
[12:31:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[12:31:06] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[12:31:06] [PASSED] single_pixel_source_buffer
[12:31:06] [PASSED] single_pixel_clip_rectangle
[12:31:06] [PASSED] well_known_colors
[12:31:06] [PASSED] destination_pitch
[12:31:06] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[12:31:06] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[12:31:06] [PASSED] single_pixel_source_buffer
[12:31:06] [PASSED] single_pixel_clip_rectangle
[12:31:06] [PASSED] well_known_colors
[12:31:06] [PASSED] destination_pitch
[12:31:06] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[12:31:06] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[12:31:06] [PASSED] single_pixel_source_buffer
[12:31:06] [PASSED] single_pixel_clip_rectangle
[12:31:06] [PASSED] well_known_colors
[12:31:06] [PASSED] destination_pitch
[12:31:06] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[12:31:06] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[12:31:06] [PASSED] single_pixel_source_buffer
[12:31:06] [PASSED] single_pixel_clip_rectangle
[12:31:06] [PASSED] well_known_colors
[12:31:06] [PASSED] destination_pitch
[12:31:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[12:31:06] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[12:31:06] [PASSED] single_pixel_source_buffer
[12:31:06] [PASSED] single_pixel_clip_rectangle
[12:31:06] [PASSED] well_known_colors
[12:31:06] [PASSED] destination_pitch
[12:31:06] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[12:31:06] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[12:31:06] [PASSED] single_pixel_source_buffer
[12:31:06] [PASSED] single_pixel_clip_rectangle
[12:31:06] [PASSED] well_known_colors
[12:31:06] [PASSED] destination_pitch
[12:31:06] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[12:31:06] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[12:31:06] [PASSED] single_pixel_source_buffer
[12:31:06] [PASSED] single_pixel_clip_rectangle
[12:31:06] [PASSED] well_known_colors
[12:31:06] [PASSED] destination_pitch
[12:31:06] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[12:31:06] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[12:31:06] [PASSED] single_pixel_source_buffer
[12:31:06] [PASSED] single_pixel_clip_rectangle
[12:31:06] [PASSED] well_known_colors
[12:31:06] [PASSED] destination_pitch
[12:31:06] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[12:31:06] ============== drm_test_fb_xrgb8888_to_mono  ===============
[12:31:06] [PASSED] single_pixel_source_buffer
[12:31:06] [PASSED] single_pixel_clip_rectangle
[12:31:06] [PASSED] well_known_colors
[12:31:06] [PASSED] destination_pitch
[12:31:06] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[12:31:06] ==================== drm_test_fb_swab  =====================
[12:31:06] [PASSED] single_pixel_source_buffer
[12:31:06] [PASSED] single_pixel_clip_rectangle
[12:31:06] [PASSED] well_known_colors
[12:31:06] [PASSED] destination_pitch
[12:31:06] ================ [PASSED] drm_test_fb_swab =================
[12:31:06] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[12:31:06] [PASSED] single_pixel_source_buffer
[12:31:06] [PASSED] single_pixel_clip_rectangle
[12:31:06] [PASSED] well_known_colors
[12:31:06] [PASSED] destination_pitch
[12:31:06] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[12:31:06] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[12:31:06] [PASSED] single_pixel_source_buffer
[12:31:06] [PASSED] single_pixel_clip_rectangle
[12:31:06] [PASSED] well_known_colors
[12:31:06] [PASSED] destination_pitch
[12:31:06] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[12:31:06] ================= drm_test_fb_clip_offset  =================
[12:31:06] [PASSED] pass through
[12:31:06] [PASSED] horizontal offset
[12:31:06] [PASSED] vertical offset
[12:31:06] [PASSED] horizontal and vertical offset
[12:31:06] [PASSED] horizontal offset (custom pitch)
[12:31:06] [PASSED] vertical offset (custom pitch)
[12:31:06] [PASSED] horizontal and vertical offset (custom pitch)
[12:31:06] ============= [PASSED] drm_test_fb_clip_offset =============
[12:31:06] =================== drm_test_fb_memcpy  ====================
[12:31:06] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[12:31:06] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[12:31:06] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[12:31:06] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[12:31:06] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[12:31:06] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[12:31:06] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[12:31:06] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[12:31:06] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[12:31:06] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[12:31:06] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[12:31:06] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[12:31:06] =============== [PASSED] drm_test_fb_memcpy ================
[12:31:06] ============= [PASSED] drm_format_helper_test ==============
[12:31:06] ================= drm_format (18 subtests) =================
[12:31:06] [PASSED] drm_test_format_block_width_invalid
[12:31:06] [PASSED] drm_test_format_block_width_one_plane
[12:31:06] [PASSED] drm_test_format_block_width_two_plane
[12:31:06] [PASSED] drm_test_format_block_width_three_plane
[12:31:06] [PASSED] drm_test_format_block_width_tiled
[12:31:06] [PASSED] drm_test_format_block_height_invalid
[12:31:06] [PASSED] drm_test_format_block_height_one_plane
[12:31:06] [PASSED] drm_test_format_block_height_two_plane
[12:31:06] [PASSED] drm_test_format_block_height_three_plane
[12:31:06] [PASSED] drm_test_format_block_height_tiled
[12:31:06] [PASSED] drm_test_format_min_pitch_invalid
[12:31:06] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[12:31:06] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[12:31:06] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[12:31:06] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[12:31:06] [PASSED] drm_test_format_min_pitch_two_plane
[12:31:06] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[12:31:06] [PASSED] drm_test_format_min_pitch_tiled
[12:31:06] =================== [PASSED] drm_format ====================
[12:31:06] ============== drm_framebuffer (10 subtests) ===============
[12:31:06] ========== drm_test_framebuffer_check_src_coords  ==========
[12:31:06] [PASSED] Success: source fits into fb
[12:31:06] [PASSED] Fail: overflowing fb with x-axis coordinate
[12:31:06] [PASSED] Fail: overflowing fb with y-axis coordinate
[12:31:06] [PASSED] Fail: overflowing fb with source width
[12:31:06] [PASSED] Fail: overflowing fb with source height
[12:31:06] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[12:31:06] [PASSED] drm_test_framebuffer_cleanup
[12:31:06] =============== drm_test_framebuffer_create  ===============
[12:31:06] [PASSED] ABGR8888 normal sizes
[12:31:06] [PASSED] ABGR8888 max sizes
[12:31:06] [PASSED] ABGR8888 pitch greater than min required
[12:31:06] [PASSED] ABGR8888 pitch less than min required
[12:31:06] [PASSED] ABGR8888 Invalid width
[12:31:06] [PASSED] ABGR8888 Invalid buffer handle
[12:31:06] [PASSED] No pixel format
[12:31:06] [PASSED] ABGR8888 Width 0
[12:31:06] [PASSED] ABGR8888 Height 0
[12:31:06] [PASSED] ABGR8888 Out of bound height * pitch combination
[12:31:06] [PASSED] ABGR8888 Large buffer offset
[12:31:06] [PASSED] ABGR8888 Buffer offset for inexistent plane
[12:31:06] [PASSED] ABGR8888 Invalid flag
[12:31:06] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[12:31:06] [PASSED] ABGR8888 Valid buffer modifier
[12:31:06] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[12:31:06] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[12:31:06] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[12:31:06] [PASSED] NV12 Normal sizes
[12:31:06] [PASSED] NV12 Max sizes
[12:31:06] [PASSED] NV12 Invalid pitch
[12:31:06] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[12:31:06] [PASSED] NV12 different  modifier per-plane
[12:31:06] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[12:31:06] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[12:31:06] [PASSED] NV12 Modifier for inexistent plane
[12:31:06] [PASSED] NV12 Handle for inexistent plane
[12:31:06] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[12:31:06] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[12:31:06] [PASSED] YVU420 Normal sizes
[12:31:06] [PASSED] YVU420 Max sizes
[12:31:06] [PASSED] YVU420 Invalid pitch
[12:31:06] [PASSED] YVU420 Different pitches
[12:31:06] [PASSED] YVU420 Different buffer offsets/pitches
[12:31:06] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[12:31:06] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[12:31:06] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[12:31:06] [PASSED] YVU420 Valid modifier
[12:31:06] [PASSED] YVU420 Different modifiers per plane
[12:31:06] [PASSED] YVU420 Modifier for inexistent plane
[12:31:06] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[12:31:06] [PASSED] X0L2 Normal sizes
[12:31:06] [PASSED] X0L2 Max sizes
[12:31:06] [PASSED] X0L2 Invalid pitch
[12:31:06] [PASSED] X0L2 Pitch greater than minimum required
[12:31:06] [PASSED] X0L2 Handle for inexistent plane
[12:31:06] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[12:31:06] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[12:31:06] [PASSED] X0L2 Valid modifier
[12:31:06] [PASSED] X0L2 Modifier for inexistent plane
[12:31:06] =========== [PASSED] drm_test_framebuffer_create ===========
[12:31:06] [PASSED] drm_test_framebuffer_free
[12:31:06] [PASSED] drm_test_framebuffer_init
[12:31:06] [PASSED] drm_test_framebuffer_init_bad_format
[12:31:06] [PASSED] drm_test_framebuffer_init_dev_mismatch
[12:31:06] [PASSED] drm_test_framebuffer_lookup
[12:31:06] [PASSED] drm_test_framebuffer_lookup_inexistent
[12:31:06] [PASSED] drm_test_framebuffer_modifiers_not_supported
[12:31:06] ================= [PASSED] drm_framebuffer =================
[12:31:06] ================ drm_gem_shmem (8 subtests) ================
[12:31:06] [PASSED] drm_gem_shmem_test_obj_create
[12:31:06] [PASSED] drm_gem_shmem_test_obj_create_private
[12:31:06] [PASSED] drm_gem_shmem_test_pin_pages
[12:31:06] [PASSED] drm_gem_shmem_test_vmap
[12:31:06] [PASSED] drm_gem_shmem_test_get_sg_table
[12:31:06] [PASSED] drm_gem_shmem_test_get_pages_sgt
[12:31:06] [PASSED] drm_gem_shmem_test_madvise
[12:31:06] [PASSED] drm_gem_shmem_test_purge
[12:31:06] ================== [PASSED] drm_gem_shmem ==================
[12:31:06] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[12:31:06] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[12:31:06] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[12:31:06] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[12:31:06] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[12:31:06] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[12:31:06] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[12:31:06] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[12:31:06] [PASSED] Automatic
[12:31:06] [PASSED] Full
[12:31:06] [PASSED] Limited 16:235
[12:31:06] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[12:31:06] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[12:31:06] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[12:31:06] [PASSED] drm_test_check_disable_connector
[12:31:06] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[12:31:06] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[12:31:06] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[12:31:06] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[12:31:06] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[12:31:06] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[12:31:06] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[12:31:06] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[12:31:06] [PASSED] drm_test_check_output_bpc_dvi
[12:31:06] [PASSED] drm_test_check_output_bpc_format_vic_1
[12:31:06] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[12:31:06] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[12:31:06] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[12:31:06] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[12:31:06] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[12:31:06] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[12:31:06] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[12:31:06] ============ drm_test_check_hdmi_color_format  =============
[12:31:06] [PASSED] AUTO -> RGB
[12:31:06] [PASSED] YCBCR422 -> YUV422
[12:31:06] [PASSED] YCBCR420 -> YUV420
[12:31:06] [PASSED] YCBCR444 -> YUV444
[12:31:06] [PASSED] RGB -> RGB
[12:31:06] ======== [PASSED] drm_test_check_hdmi_color_format =========
[12:31:06] ======== drm_test_check_hdmi_color_format_420_only  ========
[12:31:06] [PASSED] RGB should fail
[12:31:06] [PASSED] YUV444 should fail
[12:31:06] [PASSED] YUV422 should fail
[12:31:06] [PASSED] YUV420 should work
[12:31:06] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[12:31:06] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[12:31:06] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[12:31:06] [PASSED] drm_test_check_broadcast_rgb_value
[12:31:06] [PASSED] drm_test_check_bpc_8_value
[12:31:06] [PASSED] drm_test_check_bpc_10_value
[12:31:06] [PASSED] drm_test_check_bpc_12_value
[12:31:06] [PASSED] drm_test_check_format_value
[12:31:06] [PASSED] drm_test_check_tmds_char_value
[12:31:06] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[12:31:06] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[12:31:06] [PASSED] drm_test_check_mode_valid
[12:31:06] [PASSED] drm_test_check_mode_valid_reject
[12:31:06] [PASSED] drm_test_check_mode_valid_reject_rate
[12:31:06] [PASSED] drm_test_check_mode_valid_reject_max_clock
[12:31:06] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[12:31:06] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[12:31:06] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[12:31:06] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[12:31:06] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[12:31:06] [PASSED] drm_test_check_infoframes
[12:31:06] [PASSED] drm_test_check_reject_avi_infoframe
[12:31:06] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[12:31:06] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[12:31:06] [PASSED] drm_test_check_reject_audio_infoframe
[12:31:06] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[12:31:06] ================= drm_managed (2 subtests) =================
[12:31:06] [PASSED] drm_test_managed_release_action
[12:31:06] [PASSED] drm_test_managed_run_action
[12:31:06] =================== [PASSED] drm_managed ===================
[12:31:06] =================== drm_mm (6 subtests) ====================
[12:31:06] [PASSED] drm_test_mm_init
[12:31:06] [PASSED] drm_test_mm_debug
[12:31:06] [PASSED] drm_test_mm_align32
[12:31:06] [PASSED] drm_test_mm_align64
[12:31:06] [PASSED] drm_test_mm_lowest
[12:31:06] [PASSED] drm_test_mm_highest
[12:31:06] ===================== [PASSED] drm_mm ======================
[12:31:06] ============= drm_modes_analog_tv (5 subtests) =============
[12:31:06] [PASSED] drm_test_modes_analog_tv_mono_576i
[12:31:06] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[12:31:06] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[12:31:06] [PASSED] drm_test_modes_analog_tv_pal_576i
[12:31:06] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[12:31:06] =============== [PASSED] drm_modes_analog_tv ===============
[12:31:06] ============== drm_panic_helper (3 subtests) ===============
[12:31:06] ============= drm_test_panic_screen_user_map  ==============
[12:31:06] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[12:31:06] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[12:31:06] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[12:31:06] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[12:31:06] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[12:31:06] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[12:31:06] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[12:31:06] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[12:31:07] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[12:31:07] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[12:31:07] ========= [PASSED] drm_test_panic_screen_user_map ==========
[12:31:07] ============= drm_test_panic_screen_user_page  =============
[12:31:07] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[12:31:07] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[12:31:07] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[12:31:07] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[12:31:07] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[12:31:07] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[12:31:07] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[12:31:07] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[12:31:07] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[12:31:07] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[12:31:07] ========= [PASSED] drm_test_panic_screen_user_page =========
[12:31:07] ========== drm_test_panic_screen_user_set_pixel  ===========
[12:31:07] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[12:31:07] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[12:31:07] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[12:31:07] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[12:31:07] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[12:31:07] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[12:31:07] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[12:31:07] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[12:31:07] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[12:31:07] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[12:31:07] ====== [PASSED] drm_test_panic_screen_user_set_pixel =======
[12:31:07] ================ [PASSED] drm_panic_helper =================
[12:31:07] ============== drm_plane_helper (2 subtests) ===============
[12:31:07] =============== drm_test_check_plane_state  ================
[12:31:07] [PASSED] clipping_simple
[12:31:07] [PASSED] clipping_rotate_reflect
[12:31:07] [PASSED] positioning_simple
[12:31:07] [PASSED] upscaling
[12:31:07] [PASSED] downscaling
[12:31:07] [PASSED] rounding1
[12:31:07] [PASSED] rounding2
[12:31:07] [PASSED] rounding3
[12:31:07] [PASSED] rounding4
[12:31:07] =========== [PASSED] drm_test_check_plane_state ============
[12:31:07] =========== drm_test_check_invalid_plane_state  ============
[12:31:07] [PASSED] positioning_invalid
[12:31:07] [PASSED] upscaling_invalid
[12:31:07] [PASSED] downscaling_invalid
[12:31:07] ======= [PASSED] drm_test_check_invalid_plane_state ========
[12:31:07] ================ [PASSED] drm_plane_helper =================
[12:31:07] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[12:31:07] ====== drm_test_connector_helper_tv_get_modes_check  =======
[12:31:07] [PASSED] None
[12:31:07] [PASSED] PAL
[12:31:07] [PASSED] NTSC
[12:31:07] [PASSED] Both, NTSC Default
[12:31:07] [PASSED] Both, PAL Default
[12:31:07] [PASSED] Both, NTSC Default, with PAL on command-line
[12:31:07] [PASSED] Both, PAL Default, with NTSC on command-line
[12:31:07] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[12:31:07] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[12:31:07] ================== drm_rect (9 subtests) ===================
[12:31:07] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[12:31:07] [PASSED] drm_test_rect_clip_scaled_not_clipped
[12:31:07] [PASSED] drm_test_rect_clip_scaled_clipped
[12:31:07] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[12:31:07] ================= drm_test_rect_intersect  =================
[12:31:07] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[12:31:07] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[12:31:07] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[12:31:07] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[12:31:07] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[12:31:07] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[12:31:07] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[12:31:07] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[12:31:07] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[12:31:07] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[12:31:07] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[12:31:07] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[12:31:07] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[12:31:07] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[12:31:07] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[12:31:07] ============= [PASSED] drm_test_rect_intersect =============
[12:31:07] ================ drm_test_rect_calc_hscale  ================
[12:31:07] [PASSED] normal use
[12:31:07] [PASSED] out of max range
[12:31:07] [PASSED] out of min range
[12:31:07] [PASSED] zero dst
[12:31:07] [PASSED] negative src
[12:31:07] [PASSED] negative dst
[12:31:07] ============ [PASSED] drm_test_rect_calc_hscale ============
[12:31:07] ================ drm_test_rect_calc_vscale  ================
[12:31:07] [PASSED] normal use
[12:31:07] [PASSED] out of max range
[12:31:07] [PASSED] out of min range
[12:31:07] [PASSED] zero dst
[12:31:07] [PASSED] negative src
[12:31:07] [PASSED] negative dst
[12:31:07] ============ [PASSED] drm_test_rect_calc_vscale ============
[12:31:07] ================== drm_test_rect_rotate  ===================
[12:31:07] [PASSED] reflect-x
[12:31:07] [PASSED] reflect-y
[12:31:07] [PASSED] rotate-0
[12:31:07] [PASSED] rotate-90
[12:31:07] [PASSED] rotate-180
[12:31:07] [PASSED] rotate-270
[12:31:07] ============== [PASSED] drm_test_rect_rotate ===============
[12:31:07] ================ drm_test_rect_rotate_inv  =================
[12:31:07] [PASSED] reflect-x
[12:31:07] [PASSED] reflect-y
[12:31:07] [PASSED] rotate-0
[12:31:07] [PASSED] rotate-90
[12:31:07] [PASSED] rotate-180
[12:31:07] [PASSED] rotate-270
[12:31:07] ============ [PASSED] drm_test_rect_rotate_inv =============
[12:31:07] ==================== [PASSED] drm_rect =====================
[12:31:07] ============ drm_sysfb_modeset_test (1 subtest) ============
[12:31:07] ============ drm_test_sysfb_build_fourcc_list  =============
[12:31:07] [PASSED] no native formats
[12:31:07] [PASSED] XRGB8888 as native format
[12:31:07] [PASSED] remove duplicates
[12:31:07] [PASSED] convert alpha formats
[12:31:07] [PASSED] random formats
[12:31:07] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[12:31:07] ============= [PASSED] drm_sysfb_modeset_test ==============
[12:31:07] ================== drm_fixp (2 subtests) ===================
[12:31:07] [PASSED] drm_test_int2fixp
[12:31:07] [PASSED] drm_test_sm2fixp
[12:31:07] ==================== [PASSED] drm_fixp =====================
[12:31:07] ============================================================
[12:31:07] Testing complete. Ran 671 tests: passed: 671
[12:31:07] Elapsed time: 27.939s total, 1.803s configuring, 25.671s building, 0.420s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[12:31:07] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:31:09] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[12:31:19] Starting KUnit Kernel (1/1)...
[12:31:19] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[12:31:19] ============= refcount_interrupt (4 subtests) ==============
[12:31:19] [PASSED] test_single_irq_change
[12:31:19] [PASSED] test_nested_irq_change
[12:31:19] [PASSED] test_multiple_irq_change
[12:31:19] [PASSED] test_irq_save
[12:31:19] =============== [PASSED] refcount_interrupt ================
[12:31:19] ================= ttm_device (5 subtests) ==================
[12:31:19] [PASSED] ttm_device_init_basic
[12:31:19] [PASSED] ttm_device_init_multiple
[12:31:19] [PASSED] ttm_device_fini_basic
[12:31:19] [PASSED] ttm_device_init_no_vma_man
[12:31:19] ================== ttm_device_init_pools  ==================
[12:31:19] [PASSED] No DMA allocations, no DMA32 required
[12:31:19] [PASSED] DMA allocations, DMA32 required
[12:31:19] [PASSED] No DMA allocations, DMA32 required
[12:31:19] [PASSED] DMA allocations, no DMA32 required
[12:31:19] ============== [PASSED] ttm_device_init_pools ==============
[12:31:19] =================== [PASSED] ttm_device ====================
[12:31:19] ================== ttm_pool (8 subtests) ===================
[12:31:19] ================== ttm_pool_alloc_basic  ===================
[12:31:19] [PASSED] One page
[12:31:19] [PASSED] More than one page
[12:31:19] [PASSED] Above the allocation limit
[12:31:19] [PASSED] One page, with coherent DMA mappings enabled
[12:31:19] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[12:31:19] ============== [PASSED] ttm_pool_alloc_basic ===============
[12:31:19] ============== ttm_pool_alloc_basic_dma_addr  ==============
[12:31:19] [PASSED] One page
[12:31:19] [PASSED] More than one page
[12:31:19] [PASSED] Above the allocation limit
[12:31:19] [PASSED] One page, with coherent DMA mappings enabled
[12:31:19] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[12:31:19] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[12:31:19] [PASSED] ttm_pool_alloc_order_caching_match
[12:31:19] [PASSED] ttm_pool_alloc_caching_mismatch
[12:31:19] [PASSED] ttm_pool_alloc_order_mismatch
[12:31:19] [PASSED] ttm_pool_free_dma_alloc
[12:31:19] [PASSED] ttm_pool_free_no_dma_alloc
[12:31:19] [PASSED] ttm_pool_fini_basic
[12:31:19] ==================== [PASSED] ttm_pool =====================
[12:31:19] ================ ttm_resource (8 subtests) =================
[12:31:19] ================= ttm_resource_init_basic  =================
[12:31:19] [PASSED] Init resource in TTM_PL_SYSTEM
[12:31:19] [PASSED] Init resource in TTM_PL_VRAM
[12:31:19] [PASSED] Init resource in a private placement
[12:31:19] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[12:31:19] ============= [PASSED] ttm_resource_init_basic =============
[12:31:19] [PASSED] ttm_resource_init_pinned
[12:31:19] [PASSED] ttm_resource_fini_basic
[12:31:19] [PASSED] ttm_resource_manager_init_basic
[12:31:19] [PASSED] ttm_resource_manager_usage_basic
[12:31:19] [PASSED] ttm_resource_manager_set_used_basic
[12:31:19] [PASSED] ttm_sys_man_alloc_basic
[12:31:19] [PASSED] ttm_sys_man_free_basic
[12:31:19] ================== [PASSED] ttm_resource ===================
[12:31:19] =================== ttm_tt (15 subtests) ===================
[12:31:19] ==================== ttm_tt_init_basic  ====================
[12:31:19] [PASSED] Page-aligned size
[12:31:19] [PASSED] Extra pages requested
[12:31:19] ================ [PASSED] ttm_tt_init_basic ================
[12:31:19] [PASSED] ttm_tt_init_misaligned
[12:31:19] [PASSED] ttm_tt_fini_basic
[12:31:19] [PASSED] ttm_tt_fini_sg
[12:31:19] [PASSED] ttm_tt_fini_shmem
[12:31:19] [PASSED] ttm_tt_create_basic
[12:31:19] [PASSED] ttm_tt_create_invalid_bo_type
[12:31:19] [PASSED] ttm_tt_create_ttm_exists
[12:31:19] [PASSED] ttm_tt_create_failed
[12:31:19] [PASSED] ttm_tt_destroy_basic
[12:31:19] [PASSED] ttm_tt_populate_null_ttm
[12:31:19] [PASSED] ttm_tt_populate_populated_ttm
[12:31:19] [PASSED] ttm_tt_unpopulate_basic
[12:31:19] [PASSED] ttm_tt_unpopulate_empty_ttm
[12:31:19] [PASSED] ttm_tt_swapin_basic
[12:31:19] ===================== [PASSED] ttm_tt ======================
[12:31:19] =================== ttm_bo (14 subtests) ===================
[12:31:19] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[12:31:19] [PASSED] Cannot be interrupted and sleeps
[12:31:19] [PASSED] Cannot be interrupted, locks straight away
[12:31:19] [PASSED] Can be interrupted, sleeps
[12:31:19] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[12:31:19] [PASSED] ttm_bo_reserve_locked_no_sleep
[12:31:19] [PASSED] ttm_bo_reserve_no_wait_ticket
[12:31:19] [PASSED] ttm_bo_reserve_double_resv
[12:31:19] [PASSED] ttm_bo_reserve_interrupted
[12:31:19] [PASSED] ttm_bo_reserve_deadlock
[12:31:19] [PASSED] ttm_bo_unreserve_basic
[12:31:19] [PASSED] ttm_bo_unreserve_pinned
[12:31:19] [PASSED] ttm_bo_unreserve_bulk
[12:31:19] [PASSED] ttm_bo_fini_basic
[12:31:19] [PASSED] ttm_bo_fini_shared_resv
[12:31:19] [PASSED] ttm_bo_pin_basic
[12:31:19] [PASSED] ttm_bo_pin_unpin_resource
[12:31:19] [PASSED] ttm_bo_multiple_pin_one_unpin
[12:31:19] ===================== [PASSED] ttm_bo ======================
[12:31:19] ============== ttm_bo_validate (22 subtests) ===============
[12:31:19] ============== ttm_bo_init_reserved_sys_man  ===============
[12:31:19] [PASSED] Buffer object for userspace
[12:31:19] [PASSED] Kernel buffer object
[12:31:19] [PASSED] Shared buffer object
[12:31:19] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[12:31:19] ============== ttm_bo_init_reserved_mock_man  ==============
[12:31:19] [PASSED] Buffer object for userspace
[12:31:19] [PASSED] Kernel buffer object
[12:31:19] [PASSED] Shared buffer object
[12:31:19] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[12:31:19] [PASSED] ttm_bo_init_reserved_resv
[12:31:19] ================== ttm_bo_validate_basic  ==================
[12:31:19] [PASSED] Buffer object for userspace
[12:31:19] [PASSED] Kernel buffer object
[12:31:19] [PASSED] Shared buffer object
[12:31:19] ============== [PASSED] ttm_bo_validate_basic ==============
[12:31:19] [PASSED] ttm_bo_validate_invalid_placement
[12:31:19] ============= ttm_bo_validate_same_placement  ==============
[12:31:19] [PASSED] System manager
[12:31:19] [PASSED] VRAM manager
[12:31:19] ========= [PASSED] ttm_bo_validate_same_placement ==========
[12:31:19] [PASSED] ttm_bo_validate_failed_alloc
[12:31:19] [PASSED] ttm_bo_validate_pinned
[12:31:19] [PASSED] ttm_bo_validate_busy_placement
[12:31:19] ================ ttm_bo_validate_multihop  =================
[12:31:19] [PASSED] Buffer object for userspace
[12:31:19] [PASSED] Kernel buffer object
[12:31:19] [PASSED] Shared buffer object
[12:31:19] ============ [PASSED] ttm_bo_validate_multihop =============
[12:31:19] ========== ttm_bo_validate_no_placement_signaled  ==========
[12:31:19] [PASSED] Buffer object in system domain, no page vector
[12:31:19] [PASSED] Buffer object in system domain with an existing page vector
[12:31:19] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[12:31:19] ======== ttm_bo_validate_no_placement_not_signaled  ========
[12:31:19] [PASSED] Buffer object for userspace
[12:31:19] [PASSED] Kernel buffer object
[12:31:19] [PASSED] Shared buffer object
[12:31:19] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[12:31:19] [PASSED] ttm_bo_validate_move_fence_signaled
[12:31:19] ========= ttm_bo_validate_move_fence_not_signaled  =========
[12:31:19] [PASSED] Waits for GPU
[12:31:19] [PASSED] Tries to lock straight away
[12:31:19] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[12:31:19] [PASSED] ttm_bo_validate_swapout
[12:31:19] [PASSED] ttm_bo_validate_happy_evict
[12:31:19] [PASSED] ttm_bo_validate_all_pinned_evict
[12:31:19] [PASSED] ttm_bo_validate_allowed_only_evict
[12:31:19] [PASSED] ttm_bo_validate_deleted_evict
[12:31:19] [PASSED] ttm_bo_validate_busy_domain_evict
[12:31:19] [PASSED] ttm_bo_validate_evict_gutting
[12:31:19] [PASSED] ttm_bo_validate_recrusive_evict
[12:31:19] ================= [PASSED] ttm_bo_validate =================
[12:31:19] ============================================================
[12:31:19] Testing complete. Ran 106 tests: passed: 106
[12:31:19] Elapsed time: 12.268s total, 1.807s configuring, 10.246s building, 0.183s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/dma-buf/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[12:31:19] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:31:21] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[12:31:30] Starting KUnit Kernel (1/1)...
[12:31:30] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[12:31:30] ============= refcount_interrupt (4 subtests) ==============
[12:31:30] [PASSED] test_single_irq_change
[12:31:30] [PASSED] test_nested_irq_change
[12:31:30] [PASSED] test_multiple_irq_change
[12:31:30] [PASSED] test_irq_save
[12:31:30] =============== [PASSED] refcount_interrupt ================
[12:31:30] =============== dma-buf-fence (12 subtests) ================
[12:31:30] [PASSED] test_sanitycheck
[12:31:30] [PASSED] test_signaling
[12:31:30] [PASSED] test_add_callback
[12:31:30] [PASSED] test_late_add_callback
[12:31:30] [PASSED] test_rm_callback
[12:31:30] [PASSED] test_late_rm_callback
[12:31:30] [PASSED] test_status
[12:31:30] [PASSED] test_error
[12:31:30] [PASSED] test_wait
[12:31:30] [PASSED] test_wait_timeout
[12:31:30] [PASSED] test_stub
[12:31:30] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[12:31:30] ================== [PASSED] dma-buf-fence ==================
[12:31:30] ============ dma-buf-fence-chain (11 subtests) =============
[12:31:30] [PASSED] test_sanitycheck
[12:31:30] [PASSED] test_find_seqno
[12:31:30] [PASSED] test_find_signaled
[12:31:30] [PASSED] test_find_out_of_order
[12:31:35] [PASSED] test_find_gap
[12:31:35] [PASSED] test_find_race
[12:31:35] [PASSED] test_signal_forward
[12:31:35] [PASSED] test_signal_backward
[12:31:35] [PASSED] test_wait_forward
[12:31:35] [PASSED] test_wait_backward
[12:31:35] [PASSED] test_wait_random
[12:31:35] =============== [PASSED] dma-buf-fence-chain ===============
[12:31:35] ============ dma-buf-fence-unwrap (10 subtests) ============
[12:31:35] [PASSED] test_sanitycheck
[12:31:35] [PASSED] test_unwrap_array
[12:31:35] [PASSED] test_unwrap_chain
[12:31:35] [PASSED] test_unwrap_chain_array
[12:31:35] [PASSED] test_unwrap_merge
[12:31:35] [PASSED] test_unwrap_merge_duplicate
[12:31:35] [PASSED] test_unwrap_merge_seqno
[12:31:35] [PASSED] test_unwrap_merge_order
[12:31:35] [PASSED] test_unwrap_merge_complex
[12:31:35] [PASSED] test_unwrap_merge_complex_seqno
[12:31:35] ============== [PASSED] dma-buf-fence-unwrap ===============
[12:31:35] ================ dma-buf-resv (5 subtests) =================
[12:31:35] [PASSED] test_sanitycheck
[12:31:35] ===================== test_signaling  ======================
[12:31:35] [PASSED] kernel
[12:31:35] [PASSED] write
[12:31:35] [PASSED] read
[12:31:35] [PASSED] bookkeep
[12:31:35] ================= [PASSED] test_signaling ==================
[12:31:35] ====================== test_for_each  ======================
[12:31:35] [PASSED] kernel
[12:31:35] [PASSED] write
[12:31:35] [PASSED] read
[12:31:35] [PASSED] bookkeep
[12:31:35] ================== [PASSED] test_for_each ==================
[12:31:35] ================= test_for_each_unlocked  ==================
[12:31:35] [PASSED] kernel
[12:31:35] [PASSED] write
[12:31:35] [PASSED] read
[12:31:35] [PASSED] bookkeep
[12:31:35] ============= [PASSED] test_for_each_unlocked ==============
[12:31:35] ===================== test_get_fences  =====================
[12:31:35] [PASSED] kernel
[12:31:35] [PASSED] write
[12:31:35] [PASSED] read
[12:31:35] [PASSED] bookkeep
[12:31:35] ================= [PASSED] test_get_fences =================
[12:31:35] ================== [PASSED] dma-buf-resv ===================
[12:31:35] ============================================================
[12:31:35] Testing complete. Ran 54 tests: passed: 53, skipped: 1
[12:31:35] Elapsed time: 15.900s total, 1.723s configuring, 8.906s building, 5.266s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


