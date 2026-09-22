Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBB9C982FE
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 04:43:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249DD10E5A8;
	Tue, 22 Sep 2026 04:43:25 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C26510E5A8;
 Tue, 22 Sep 2026 04:43:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Refresh_TTM_LRU_on_SVM_prefetc?=
 =?utf-8?q?h_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Sep 2026 04:43:23 -0000
Message-ID: <179005220336.190304.7516591702082474990@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260922043759.3057442-6-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260922043759.3057442-6-himal.prasad.ghimiray@intel.com>
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

Series: Refresh TTM LRU on SVM prefetch (rev3)
URL   : https://patchwork.freedesktop.org/series/174276/
State : success

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[04:41:18] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:41:22] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[04:41:43] Starting KUnit Kernel (1/1)...
[04:41:43] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[04:41:43] ============= refcount_interrupt (4 subtests) ==============
[04:41:43] [PASSED] test_single_irq_change
[04:41:43] [PASSED] test_nested_irq_change
[04:41:43] [PASSED] test_multiple_irq_change
[04:41:43] [PASSED] test_irq_save
[04:41:43] =============== [PASSED] refcount_interrupt ================
[04:41:43] ================= gpu_buddy (14 subtests) ==================
[04:41:43] [PASSED] gpu_test_buddy_alloc_limit
[04:41:43] [PASSED] gpu_test_buddy_alloc_optimistic
[04:41:43] [PASSED] gpu_test_buddy_alloc_pessimistic
[04:41:43] [PASSED] gpu_test_buddy_alloc_pathological
[04:41:43] [PASSED] gpu_test_buddy_alloc_contiguous
[04:41:43] [PASSED] gpu_test_buddy_alloc_clear
[04:41:43] [PASSED] gpu_test_buddy_alloc_range
[04:41:43] [PASSED] gpu_test_buddy_alloc_range_bias
[04:41:44] [PASSED] gpu_test_buddy_fragmentation_performance
[04:41:45] [PASSED] gpu_test_buddy_dirty_tracker_performance
[04:41:45] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[04:41:45] [PASSED] gpu_test_buddy_offset_aligned_allocation
[04:41:45] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[04:41:45] [PASSED] gpu_test_buddy_addr_to_block
[04:41:45] ==================== [PASSED] gpu_buddy ====================
[04:41:45] ============================================================
[04:41:45] Testing complete. Ran 18 tests: passed: 18
[04:41:45] Elapsed time: 27.344s total, 4.445s configuring, 20.982s building, 1.874s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[04:41:45] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:41:47] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[04:42:21] Starting KUnit Kernel (1/1)...
[04:42:21] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[04:42:22] ============= refcount_interrupt (4 subtests) ==============
[04:42:22] [PASSED] test_single_irq_change
[04:42:22] [PASSED] test_nested_irq_change
[04:42:22] [PASSED] test_multiple_irq_change
[04:42:22] [PASSED] test_irq_save
[04:42:22] =============== [PASSED] refcount_interrupt ================
[04:42:22] ================== guc_buf (11 subtests) ===================
[04:42:22] [PASSED] test_smallest
[04:42:22] [PASSED] test_largest
[04:42:22] [PASSED] test_granular
[04:42:22] [PASSED] test_unique
[04:42:22] [PASSED] test_overlap
[04:42:22] [PASSED] test_reusable
[04:42:22] [PASSED] test_too_big
[04:42:22] [PASSED] test_flush
[04:42:22] [PASSED] test_lookup
[04:42:22] [PASSED] test_data
[04:42:22] [PASSED] test_class
[04:42:22] ===================== [PASSED] guc_buf =====================
[04:42:22] =================== guc_dbm (7 subtests) ===================
[04:42:22] [PASSED] test_empty
[04:42:22] [PASSED] test_default
[04:42:22] ======================== test_size  ========================
[04:42:22] [PASSED] 4
[04:42:22] [PASSED] 8
[04:42:22] [PASSED] 32
[04:42:22] [PASSED] 256
[04:42:22] ==================== [PASSED] test_size ====================
[04:42:22] ======================= test_reuse  ========================
[04:42:22] [PASSED] 4
[04:42:22] [PASSED] 8
[04:42:22] [PASSED] 32
[04:42:22] [PASSED] 256
[04:42:22] =================== [PASSED] test_reuse ====================
[04:42:22] =================== test_range_overlap  ====================
[04:42:22] [PASSED] 4
[04:42:22] [PASSED] 8
[04:42:22] [PASSED] 32
[04:42:22] [PASSED] 256
[04:42:22] =============== [PASSED] test_range_overlap ================
[04:42:22] =================== test_range_compact  ====================
[04:42:22] [PASSED] 4
[04:42:22] [PASSED] 8
[04:42:22] [PASSED] 32
[04:42:22] [PASSED] 256
[04:42:22] =============== [PASSED] test_range_compact ================
[04:42:22] ==================== test_range_spare  =====================
[04:42:22] [PASSED] 4
[04:42:22] [PASSED] 8
[04:42:22] [PASSED] 32
[04:42:22] [PASSED] 256
[04:42:22] ================ [PASSED] test_range_spare =================
[04:42:22] ===================== [PASSED] guc_dbm =====================
[04:42:22] =================== guc_idm (6 subtests) ===================
[04:42:22] [PASSED] bad_init
[04:42:22] [PASSED] no_init
[04:42:22] [PASSED] init_fini
[04:42:22] [PASSED] check_used
[04:42:22] [PASSED] check_quota
[04:42:22] [PASSED] check_all
[04:42:22] ===================== [PASSED] guc_idm =====================
[04:42:22] ============== guc_klv_helpers (13 subtests) ===============
[04:42:22] [PASSED] test_count
[04:42:22] [PASSED] test_encode_u32
[04:42:22] [PASSED] test_encode_u64
[04:42:22] [PASSED] test_encode_string
[04:42:22] [PASSED] test_encode_object_raw
[04:42:22] [PASSED] test_encode_object_klv
[04:42:22] [PASSED] test_encode_object_nested
[04:42:22] [PASSED] test_encode_object_basic
[04:42:22] ===================== test_decode_u16  =====================
[04:42:22] [PASSED] empty
[04:42:22] [PASSED] valid
[04:42:22] [PASSED] max
[04:42:22] [PASSED] big
[04:42:22] [PASSED] long
[04:42:22] ================= [PASSED] test_decode_u16 =================
[04:42:22] ===================== test_decode_u32  =====================
[04:42:22] [PASSED] empty
[04:42:22] [PASSED] valid
[04:42:22] [PASSED] max
[04:42:22] [PASSED] long
[04:42:22] ================= [PASSED] test_decode_u32 =================
[04:42:22] ===================== test_decode_u64  =====================
[04:42:22] [PASSED] empty
[04:42:22] [PASSED] short
[04:42:22] [PASSED] valid
[04:42:22] [PASSED] max
[04:42:22] [PASSED] long
[04:42:22] ================= [PASSED] test_decode_u64 =================
[04:42:22] ===================== test_decode_str  =====================
[04:42:22] [PASSED] empty
[04:42:22] [PASSED] one
[04:42:22] [PASSED] one_trash
[04:42:22] [PASSED] two
[04:42:22] [PASSED] two_trash
[04:42:22] [PASSED] three
[04:42:22] [PASSED] dword
[04:42:22] [PASSED] four
[04:42:22] [PASSED] five
[04:42:22] [PASSED] six
[04:42:22] [PASSED] seven
[04:42:22] [PASSED] qword
[04:42:22] ================= [PASSED] test_decode_str =================
[04:42:22] [PASSED] test_print
[04:42:22] ================= [PASSED] guc_klv_helpers =================
[04:42:22] =================== xe_log (4 subtests) ====================
[04:42:22] [PASSED] demo_cper
[04:42:22] [PASSED] demo_dmesg
[04:42:22] ======================= test_dmesg  ========================
[04:42:22] [PASSED] test_fatal
[04:42:22] [PASSED] test_fatal_tile
[04:42:22] [PASSED] test_fatal_gt
[04:42:22] [PASSED] test_fatal_comp
[04:42:22] [PASSED] test_fatal_comp_tile
[04:42:22] [PASSED] test_fatal_comp_gt
[04:42:22] [PASSED] test_fatal_all
[04:42:22] [PASSED] test_recoverable
[04:42:22] [PASSED] test_recoverable_tile
[04:42:22] [PASSED] test_recoverable_gt
[04:42:22] [PASSED] test_recoverable_comp
[04:42:22] [PASSED] test_recoverable_comp_tile
[04:42:22] [PASSED] test_recoverable_comp_gt
[04:42:22] [PASSED] test_recoverable_all
[04:42:22] [PASSED] test_info
[04:42:22] [PASSED] test_info_tile
[04:42:22] [PASSED] test_info_gt
[04:42:22] [PASSED] test_info_err
[04:42:22] [PASSED] test_info_comp
[04:42:22] [PASSED] test_info_comp_tile
[04:42:22] [PASSED] test_info_comp_gt
[04:42:22] [PASSED] test_info_all
[04:42:22] [PASSED] test_hw_fatal
[04:42:22] [PASSED] test_hw_recoverable
[04:42:22] [PASSED] test_hw_corrected
[04:42:22] [PASSED] test_hw_informational
[04:42:22] =================== [PASSED] test_dmesg ====================
[04:42:22] ====================== test_invalid  =======================
[04:42:22] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[04:42:22] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[04:42:22] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[04:42:22] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[04:42:22] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[04:42:22] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[04:42:22] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[04:42:22] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[04:42:22] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[04:42:22] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[04:42:22] ================== [SKIPPED] test_invalid ==================
[04:42:22] ===================== [PASSED] xe_log ======================
[04:42:22] ================== no_relay (3 subtests) ===================
[04:42:22] [PASSED] xe_drops_guc2pf_if_not_ready
[04:42:22] [PASSED] xe_drops_guc2vf_if_not_ready
[04:42:22] [PASSED] xe_rejects_send_if_not_ready
[04:42:22] ==================== [PASSED] no_relay =====================
[04:42:22] ================== pf_relay (14 subtests) ==================
[04:42:22] [PASSED] pf_rejects_guc2pf_too_short
[04:42:22] [PASSED] pf_rejects_guc2pf_too_long
[04:42:22] [PASSED] pf_rejects_guc2pf_no_payload
[04:42:22] [PASSED] pf_fails_no_payload
[04:42:22] [PASSED] pf_fails_bad_origin
[04:42:22] [PASSED] pf_fails_bad_type
[04:42:22] [PASSED] pf_txn_reports_error
[04:42:22] [PASSED] pf_txn_sends_pf2guc
[04:42:22] [PASSED] pf_sends_pf2guc
[04:42:22] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[04:42:22] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[04:42:22] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[04:42:22] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[04:42:22] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[04:42:22] ==================== [PASSED] pf_relay =====================
[04:42:22] ================== vf_relay (3 subtests) ===================
[04:42:22] [PASSED] vf_rejects_guc2vf_too_short
[04:42:22] [PASSED] vf_rejects_guc2vf_too_long
[04:42:22] [PASSED] vf_rejects_guc2vf_no_payload
[04:42:22] ==================== [PASSED] vf_relay =====================
[04:42:22] ================ pf_gt_config (9 subtests) =================
[04:42:22] [PASSED] fair_contexts_1vf
[04:42:22] [PASSED] fair_doorbells_1vf
[04:42:22] [PASSED] fair_ggtt_1vf
[04:42:22] ====================== fair_vram_1vf  ======================
[04:42:22] [PASSED] 3.50 GiB
[04:42:22] [PASSED] 11.5 GiB
[04:42:22] [PASSED] 15.5 GiB
[04:42:22] [PASSED] 31.5 GiB
[04:42:22] [PASSED] 63.5 GiB
[04:42:22] [PASSED] 1.91 GiB
[04:42:22] ================== [PASSED] fair_vram_1vf ==================
[04:42:22] ================ fair_vram_1vf_admin_only  =================
[04:42:22] [PASSED] 3.50 GiB
[04:42:22] [PASSED] 11.5 GiB
[04:42:22] [PASSED] 15.5 GiB
[04:42:22] [PASSED] 31.5 GiB
[04:42:22] [PASSED] 63.5 GiB
[04:42:22] [PASSED] 1.91 GiB
[04:42:22] ============ [PASSED] fair_vram_1vf_admin_only =============
[04:42:22] ====================== fair_contexts  ======================
[04:42:22] [PASSED] 1 VF
[04:42:22] [PASSED] 2 VFs
[04:42:22] [PASSED] 3 VFs
[04:42:22] [PASSED] 4 VFs
[04:42:22] [PASSED] 5 VFs
[04:42:22] [PASSED] 6 VFs
[04:42:22] [PASSED] 7 VFs
[04:42:22] [PASSED] 8 VFs
[04:42:22] [PASSED] 9 VFs
[04:42:22] [PASSED] 10 VFs
[04:42:22] [PASSED] 11 VFs
[04:42:22] [PASSED] 12 VFs
[04:42:22] [PASSED] 13 VFs
[04:42:22] [PASSED] 14 VFs
[04:42:22] [PASSED] 15 VFs
[04:42:22] [PASSED] 16 VFs
[04:42:22] [PASSED] 17 VFs
[04:42:22] [PASSED] 18 VFs
[04:42:22] [PASSED] 19 VFs
[04:42:22] [PASSED] 20 VFs
[04:42:22] [PASSED] 21 VFs
[04:42:22] [PASSED] 22 VFs
[04:42:22] [PASSED] 23 VFs
[04:42:22] [PASSED] 24 VFs
[04:42:22] [PASSED] 25 VFs
[04:42:22] [PASSED] 26 VFs
[04:42:22] [PASSED] 27 VFs
[04:42:22] [PASSED] 28 VFs
[04:42:22] [PASSED] 29 VFs
[04:42:22] [PASSED] 30 VFs
[04:42:22] [PASSED] 31 VFs
[04:42:22] [PASSED] 32 VFs
[04:42:22] [PASSED] 33 VFs
[04:42:22] [PASSED] 34 VFs
[04:42:22] [PASSED] 35 VFs
[04:42:22] [PASSED] 36 VFs
[04:42:22] [PASSED] 37 VFs
[04:42:22] [PASSED] 38 VFs
[04:42:22] [PASSED] 39 VFs
[04:42:22] [PASSED] 40 VFs
[04:42:22] [PASSED] 41 VFs
[04:42:22] [PASSED] 42 VFs
[04:42:22] [PASSED] 43 VFs
[04:42:22] [PASSED] 44 VFs
[04:42:22] [PASSED] 45 VFs
[04:42:22] [PASSED] 46 VFs
[04:42:22] [PASSED] 47 VFs
[04:42:22] [PASSED] 48 VFs
[04:42:22] [PASSED] 49 VFs
[04:42:22] [PASSED] 50 VFs
[04:42:22] [PASSED] 51 VFs
[04:42:22] [PASSED] 52 VFs
[04:42:22] [PASSED] 53 VFs
[04:42:22] [PASSED] 54 VFs
[04:42:22] [PASSED] 55 VFs
[04:42:22] [PASSED] 56 VFs
[04:42:22] [PASSED] 57 VFs
[04:42:22] [PASSED] 58 VFs
[04:42:22] [PASSED] 59 VFs
[04:42:22] [PASSED] 60 VFs
[04:42:22] [PASSED] 61 VFs
[04:42:22] [PASSED] 62 VFs
[04:42:22] [PASSED] 63 VFs
[04:42:22] ================== [PASSED] fair_contexts ==================
[04:42:22] ===================== fair_doorbells  ======================
[04:42:22] [PASSED] 1 VF
[04:42:22] [PASSED] 2 VFs
[04:42:22] [PASSED] 3 VFs
[04:42:22] [PASSED] 4 VFs
[04:42:22] [PASSED] 5 VFs
[04:42:22] [PASSED] 6 VFs
[04:42:22] [PASSED] 7 VFs
[04:42:22] [PASSED] 8 VFs
[04:42:22] [PASSED] 9 VFs
[04:42:22] [PASSED] 10 VFs
[04:42:22] [PASSED] 11 VFs
[04:42:22] [PASSED] 12 VFs
[04:42:22] [PASSED] 13 VFs
[04:42:22] [PASSED] 14 VFs
[04:42:22] [PASSED] 15 VFs
[04:42:22] [PASSED] 16 VFs
[04:42:22] [PASSED] 17 VFs
[04:42:22] [PASSED] 18 VFs
[04:42:22] [PASSED] 19 VFs
[04:42:22] [PASSED] 20 VFs
[04:42:22] [PASSED] 21 VFs
[04:42:22] [PASSED] 22 VFs
[04:42:22] [PASSED] 23 VFs
[04:42:22] [PASSED] 24 VFs
[04:42:22] [PASSED] 25 VFs
[04:42:22] [PASSED] 26 VFs
[04:42:22] [PASSED] 27 VFs
[04:42:22] [PASSED] 28 VFs
[04:42:22] [PASSED] 29 VFs
[04:42:22] [PASSED] 30 VFs
[04:42:22] [PASSED] 31 VFs
[04:42:22] [PASSED] 32 VFs
[04:42:22] [PASSED] 33 VFs
[04:42:22] [PASSED] 34 VFs
[04:42:22] [PASSED] 35 VFs
[04:42:22] [PASSED] 36 VFs
[04:42:22] [PASSED] 37 VFs
[04:42:22] [PASSED] 38 VFs
[04:42:22] [PASSED] 39 VFs
[04:42:22] [PASSED] 40 VFs
[04:42:22] [PASSED] 41 VFs
[04:42:22] [PASSED] 42 VFs
[04:42:22] [PASSED] 43 VFs
[04:42:22] [PASSED] 44 VFs
[04:42:22] [PASSED] 45 VFs
[04:42:22] [PASSED] 46 VFs
[04:42:22] [PASSED] 47 VFs
[04:42:22] [PASSED] 48 VFs
[04:42:22] [PASSED] 49 VFs
[04:42:22] [PASSED] 50 VFs
[04:42:22] [PASSED] 51 VFs
[04:42:22] [PASSED] 52 VFs
[04:42:22] [PASSED] 53 VFs
[04:42:22] [PASSED] 54 VFs
[04:42:22] [PASSED] 55 VFs
[04:42:22] [PASSED] 56 VFs
[04:42:22] [PASSED] 57 VFs
[04:42:22] [PASSED] 58 VFs
[04:42:22] [PASSED] 59 VFs
[04:42:22] [PASSED] 60 VFs
[04:42:22] [PASSED] 61 VFs
[04:42:22] [PASSED] 62 VFs
[04:42:22] [PASSED] 63 VFs
[04:42:22] ================= [PASSED] fair_doorbells ==================
[04:42:22] ======================== fair_ggtt  ========================
[04:42:22] [PASSED] 1 VF
[04:42:22] [PASSED] 2 VFs
[04:42:22] [PASSED] 3 VFs
[04:42:22] [PASSED] 4 VFs
[04:42:22] [PASSED] 5 VFs
[04:42:22] [PASSED] 6 VFs
[04:42:22] [PASSED] 7 VFs
[04:42:22] [PASSED] 8 VFs
[04:42:22] [PASSED] 9 VFs
[04:42:22] [PASSED] 10 VFs
[04:42:22] [PASSED] 11 VFs
[04:42:22] [PASSED] 12 VFs
[04:42:22] [PASSED] 13 VFs
[04:42:22] [PASSED] 14 VFs
[04:42:22] [PASSED] 15 VFs
[04:42:22] [PASSED] 16 VFs
[04:42:22] [PASSED] 17 VFs
[04:42:22] [PASSED] 18 VFs
[04:42:22] [PASSED] 19 VFs
[04:42:22] [PASSED] 20 VFs
[04:42:22] [PASSED] 21 VFs
[04:42:22] [PASSED] 22 VFs
[04:42:22] [PASSED] 23 VFs
[04:42:22] [PASSED] 24 VFs
[04:42:22] [PASSED] 25 VFs
[04:42:22] [PASSED] 26 VFs
[04:42:22] [PASSED] 27 VFs
[04:42:22] [PASSED] 28 VFs
[04:42:22] [PASSED] 29 VFs
[04:42:22] [PASSED] 30 VFs
[04:42:22] [PASSED] 31 VFs
[04:42:22] [PASSED] 32 VFs
[04:42:22] [PASSED] 33 VFs
[04:42:22] [PASSED] 34 VFs
[04:42:22] [PASSED] 35 VFs
[04:42:22] [PASSED] 36 VFs
[04:42:22] [PASSED] 37 VFs
[04:42:22] [PASSED] 38 VFs
[04:42:22] [PASSED] 39 VFs
[04:42:22] [PASSED] 40 VFs
[04:42:22] [PASSED] 41 VFs
[04:42:22] [PASSED] 42 VFs
[04:42:22] [PASSED] 43 VFs
[04:42:22] [PASSED] 44 VFs
[04:42:22] [PASSED] 45 VFs
[04:42:22] [PASSED] 46 VFs
[04:42:22] [PASSED] 47 VFs
[04:42:22] [PASSED] 48 VFs
[04:42:22] [PASSED] 49 VFs
[04:42:22] [PASSED] 50 VFs
[04:42:22] [PASSED] 51 VFs
[04:42:22] [PASSED] 52 VFs
[04:42:22] [PASSED] 53 VFs
[04:42:22] [PASSED] 54 VFs
[04:42:22] [PASSED] 55 VFs
[04:42:22] [PASSED] 56 VFs
[04:42:22] [PASSED] 57 VFs
[04:42:22] [PASSED] 58 VFs
[04:42:22] [PASSED] 59 VFs
[04:42:22] [PASSED] 60 VFs
[04:42:22] [PASSED] 61 VFs
[04:42:22] [PASSED] 62 VFs
[04:42:22] [PASSED] 63 VFs
[04:42:22] ==================== [PASSED] fair_ggtt ====================
[04:42:22] ======================== fair_vram  ========================
[04:42:22] [PASSED] 1 VF
[04:42:22] [PASSED] 2 VFs
[04:42:22] [PASSED] 3 VFs
[04:42:22] [PASSED] 4 VFs
[04:42:22] [PASSED] 5 VFs
[04:42:22] [PASSED] 6 VFs
[04:42:22] [PASSED] 7 VFs
[04:42:22] [PASSED] 8 VFs
[04:42:22] [PASSED] 9 VFs
[04:42:22] [PASSED] 10 VFs
[04:42:22] [PASSED] 11 VFs
[04:42:22] [PASSED] 12 VFs
[04:42:22] [PASSED] 13 VFs
[04:42:22] [PASSED] 14 VFs
[04:42:22] [PASSED] 15 VFs
[04:42:22] [PASSED] 16 VFs
[04:42:22] [PASSED] 17 VFs
[04:42:22] [PASSED] 18 VFs
[04:42:22] [PASSED] 19 VFs
[04:42:22] [PASSED] 20 VFs
[04:42:22] [PASSED] 21 VFs
[04:42:22] [PASSED] 22 VFs
[04:42:22] [PASSED] 23 VFs
[04:42:22] [PASSED] 24 VFs
[04:42:22] [PASSED] 25 VFs
[04:42:22] [PASSED] 26 VFs
[04:42:22] [PASSED] 27 VFs
[04:42:22] [PASSED] 28 VFs
[04:42:22] [PASSED] 29 VFs
[04:42:22] [PASSED] 30 VFs
[04:42:22] [PASSED] 31 VFs
[04:42:22] [PASSED] 32 VFs
[04:42:22] [PASSED] 33 VFs
[04:42:22] [PASSED] 34 VFs
[04:42:22] [PASSED] 35 VFs
[04:42:22] [PASSED] 36 VFs
[04:42:22] [PASSED] 37 VFs
[04:42:22] [PASSED] 38 VFs
[04:42:22] [PASSED] 39 VFs
[04:42:22] [PASSED] 40 VFs
[04:42:22] [PASSED] 41 VFs
[04:42:22] [PASSED] 42 VFs
[04:42:22] [PASSED] 43 VFs
[04:42:22] [PASSED] 44 VFs
[04:42:22] [PASSED] 45 VFs
[04:42:22] [PASSED] 46 VFs
[04:42:22] [PASSED] 47 VFs
[04:42:22] [PASSED] 48 VFs
[04:42:22] [PASSED] 49 VFs
[04:42:22] [PASSED] 50 VFs
[04:42:22] [PASSED] 51 VFs
[04:42:22] [PASSED] 52 VFs
[04:42:22] [PASSED] 53 VFs
[04:42:22] [PASSED] 54 VFs
[04:42:22] [PASSED] 55 VFs
[04:42:22] [PASSED] 56 VFs
[04:42:22] [PASSED] 57 VFs
[04:42:22] [PASSED] 58 VFs
[04:42:22] [PASSED] 59 VFs
[04:42:22] [PASSED] 60 VFs
[04:42:22] [PASSED] 61 VFs
[04:42:22] [PASSED] 62 VFs
[04:42:22] [PASSED] 63 VFs
[04:42:22] ==================== [PASSED] fair_vram ====================
[04:42:22] ================== [PASSED] pf_gt_config ===================
[04:42:22] ===================== lmtt (1 subtest) =====================
[04:42:22] ======================== test_ops  =========================
[04:42:22] [PASSED] 2-level
[04:42:22] [PASSED] multi-level
[04:42:22] ==================== [PASSED] test_ops =====================
[04:42:22] ====================== [PASSED] lmtt =======================
[04:42:22] ================= sriov_packet (1 subtest) =================
[04:42:22] [PASSED] test_descriptor_init
[04:42:22] ================== [PASSED] sriov_packet ===================
[04:42:22] ================= pf_service (11 subtests) =================
[04:42:22] [PASSED] pf_negotiate_any
[04:42:22] [PASSED] pf_negotiate_base_match
[04:42:22] [PASSED] pf_negotiate_base_newer
[04:42:22] [PASSED] pf_negotiate_base_next
[04:42:22] [SKIPPED] pf_negotiate_base_older (no older minor)
[04:42:22] [PASSED] pf_negotiate_base_prev
[04:42:22] [PASSED] pf_negotiate_latest_match
[04:42:22] [PASSED] pf_negotiate_latest_newer
[04:42:22] [PASSED] pf_negotiate_latest_next
[04:42:22] [SKIPPED] pf_negotiate_latest_older (no older minor)
[04:42:22] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[04:42:22] =================== [PASSED] pf_service ====================
[04:42:22] ================= xe_guc_g2g (2 subtests) ==================
[04:42:22] ============== xe_live_guc_g2g_kunit_default  ==============
[04:42:22] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[04:42:22] ============== xe_live_guc_g2g_kunit_allmem  ===============
[04:42:22] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[04:42:22] =================== [SKIPPED] xe_guc_g2g ===================
[04:42:22] =================== xe_mocs (2 subtests) ===================
[04:42:22] ================ xe_live_mocs_kernel_kunit  ================
[04:42:22] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[04:42:22] ================ xe_live_mocs_reset_kunit  =================
[04:42:22] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[04:42:22] ==================== [SKIPPED] xe_mocs =====================
[04:42:22] ================= xe_migrate (2 subtests) ==================
[04:42:22] ================= xe_migrate_sanity_kunit  =================
[04:42:22] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[04:42:22] ================== xe_validate_ccs_kunit  ==================
[04:42:22] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[04:42:22] =================== [SKIPPED] xe_migrate ===================
[04:42:22] ================== xe_dma_buf (1 subtest) ==================
[04:42:22] ==================== xe_dma_buf_kunit  =====================
[04:42:22] ================ [SKIPPED] xe_dma_buf_kunit ================
[04:42:22] =================== [SKIPPED] xe_dma_buf ===================
[04:42:22] ================= xe_bo_shrink (1 subtest) =================
[04:42:22] =================== xe_bo_shrink_kunit  ====================
[04:42:22] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[04:42:22] ================== [SKIPPED] xe_bo_shrink ==================
[04:42:22] ==================== xe_bo (2 subtests) ====================
[04:42:22] ================== xe_ccs_migrate_kunit  ===================
[04:42:22] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[04:42:22] ==================== xe_bo_evict_kunit  ====================
[04:42:22] =============== [SKIPPED] xe_bo_evict_kunit ================
[04:42:22] ===================== [SKIPPED] xe_bo ======================
[04:42:22] =================== xe_any (9 subtests) ====================
[04:42:22] [PASSED] test_to_xe
[04:42:22] [PASSED] test_to_dev
[04:42:22] [PASSED] test_to_pdev
[04:42:22] [PASSED] test_to_drm
[04:42:22] [PASSED] test_if_pdev
[04:42:22] [PASSED] test_if_xe
[04:42:22] [PASSED] test_if_tile
[04:42:22] [PASSED] test_if_gt
[04:42:22] [PASSED] test_to_id
[04:42:22] ===================== [PASSED] xe_any ======================
[04:42:22] ==================== args (13 subtests) ====================
[04:42:22] [PASSED] count_args_test
[04:42:22] [PASSED] call_args_example
[04:42:22] [PASSED] call_args_test
[04:42:22] [PASSED] drop_first_arg_example
[04:42:22] [PASSED] drop_first_arg_test
[04:42:22] [PASSED] first_arg_example
[04:42:22] [PASSED] first_arg_test
[04:42:22] [PASSED] last_arg_example
[04:42:22] [PASSED] last_arg_test
[04:42:22] [PASSED] pick_arg_example
[04:42:22] [PASSED] if_args_example
[04:42:22] [PASSED] if_args_test
[04:42:22] [PASSED] sep_comma_example
[04:42:22] ====================== [PASSED] args =======================
[04:42:22] =================== xe_pci (3 subtests) ====================
[04:42:22] ==================== check_graphics_ip  ====================
[04:42:22] [PASSED] 12.00 Xe_LP
[04:42:22] [PASSED] 12.10 Xe_LP+
[04:42:22] [PASSED] 12.55 Xe_HPG
[04:42:22] [PASSED] 12.60 Xe_HPC
[04:42:22] [PASSED] 12.70 Xe_LPG
[04:42:22] [PASSED] 12.71 Xe_LPG
[04:42:22] [PASSED] 12.74 Xe_LPG+
[04:42:22] [PASSED] 20.01 Xe2_HPG
[04:42:22] [PASSED] 20.02 Xe2_HPG
[04:42:22] [PASSED] 20.04 Xe2_LPG
[04:42:22] [PASSED] 30.00 Xe3_LPG
[04:42:22] [PASSED] 30.01 Xe3_LPG
[04:42:22] [PASSED] 30.03 Xe3_LPG
[04:42:22] [PASSED] 30.04 Xe3_LPG
[04:42:22] [PASSED] 30.05 Xe3_LPG
[04:42:22] [PASSED] 35.10 Xe3p_LPG
[04:42:22] [PASSED] 35.11 Xe3p_XPC
[04:42:22] ================ [PASSED] check_graphics_ip ================
[04:42:22] ===================== check_media_ip  ======================
[04:42:22] [PASSED] 12.00 Xe_M
[04:42:22] [PASSED] 12.55 Xe_HPM
[04:42:22] [PASSED] 13.00 Xe_LPM+
[04:42:22] [PASSED] 13.01 Xe2_HPM
[04:42:22] [PASSED] 20.00 Xe2_LPM
[04:42:22] [PASSED] 30.00 Xe3_LPM
[04:42:22] [PASSED] 30.02 Xe3_LPM
[04:42:22] [PASSED] 35.00 Xe3p_LPM
[04:42:22] [PASSED] 35.03 Xe3p_HPM
[04:42:22] ================= [PASSED] check_media_ip ==================
[04:42:22] =================== check_platform_desc  ===================
[04:42:22] [PASSED] 0x9A60 (TIGERLAKE)
[04:42:22] [PASSED] 0x9A68 (TIGERLAKE)
[04:42:22] [PASSED] 0x9A70 (TIGERLAKE)
[04:42:22] [PASSED] 0x9A40 (TIGERLAKE)
[04:42:22] [PASSED] 0x9A49 (TIGERLAKE)
[04:42:22] [PASSED] 0x9A59 (TIGERLAKE)
[04:42:22] [PASSED] 0x9A78 (TIGERLAKE)
[04:42:22] [PASSED] 0x9AC0 (TIGERLAKE)
[04:42:22] [PASSED] 0x9AC9 (TIGERLAKE)
[04:42:22] [PASSED] 0x9AD9 (TIGERLAKE)
[04:42:22] [PASSED] 0x9AF8 (TIGERLAKE)
[04:42:22] [PASSED] 0x4C80 (ROCKETLAKE)
[04:42:22] [PASSED] 0x4C8A (ROCKETLAKE)
[04:42:22] [PASSED] 0x4C8B (ROCKETLAKE)
[04:42:22] [PASSED] 0x4C8C (ROCKETLAKE)
[04:42:22] [PASSED] 0x4C90 (ROCKETLAKE)
[04:42:22] [PASSED] 0x4C9A (ROCKETLAKE)
[04:42:22] [PASSED] 0x4680 (ALDERLAKE_S)
[04:42:22] [PASSED] 0x4682 (ALDERLAKE_S)
[04:42:22] [PASSED] 0x4688 (ALDERLAKE_S)
[04:42:22] [PASSED] 0x468A (ALDERLAKE_S)
[04:42:22] [PASSED] 0x468B (ALDERLAKE_S)
[04:42:22] [PASSED] 0x4690 (ALDERLAKE_S)
[04:42:22] [PASSED] 0x4692 (ALDERLAKE_S)
[04:42:22] [PASSED] 0x4693 (ALDERLAKE_S)
[04:42:22] [PASSED] 0x46A0 (ALDERLAKE_P)
[04:42:22] [PASSED] 0x46A1 (ALDERLAKE_P)
[04:42:22] [PASSED] 0x46A2 (ALDERLAKE_P)
[04:42:22] [PASSED] 0x46A3 (ALDERLAKE_P)
[04:42:22] [PASSED] 0x46A6 (ALDERLAKE_P)
[04:42:22] [PASSED] 0x46A8 (ALDERLAKE_P)
[04:42:22] [PASSED] 0x46AA (ALDERLAKE_P)
[04:42:22] [PASSED] 0x462A (ALDERLAKE_P)
[04:42:22] [PASSED] 0x4626 (ALDERLAKE_P)
[04:42:22] [PASSED] 0x4628 (ALDERLAKE_P)
[04:42:22] [PASSED] 0x46B0 (ALDERLAKE_P)
[04:42:22] [PASSED] 0x46B1 (ALDERLAKE_P)
[04:42:22] [PASSED] 0x46B2 (ALDERLAKE_P)
[04:42:22] [PASSED] 0x46B3 (ALDERLAKE_P)
[04:42:22] [PASSED] 0x46C0 (ALDERLAKE_P)
[04:42:22] [PASSED] 0x46C1 (ALDERLAKE_P)
[04:42:22] [PASSED] 0x46C2 (ALDERLAKE_P)
[04:42:22] [PASSED] 0x46C3 (ALDERLAKE_P)
[04:42:22] [PASSED] 0x46D0 (ALDERLAKE_N)
[04:42:22] [PASSED] 0x46D1 (ALDERLAKE_N)
[04:42:22] [PASSED] 0x46D2 (ALDERLAKE_N)
[04:42:22] [PASSED] 0x46D3 (ALDERLAKE_N)
[04:42:22] [PASSED] 0x46D4 (ALDERLAKE_N)
[04:42:22] [PASSED] 0xA721 (ALDERLAKE_P)
[04:42:22] [PASSED] 0xA7A1 (ALDERLAKE_P)
[04:42:22] [PASSED] 0xA7A9 (ALDERLAKE_P)
[04:42:22] [PASSED] 0xA7AC (ALDERLAKE_P)
[04:42:22] [PASSED] 0xA7AD (ALDERLAKE_P)
[04:42:22] [PASSED] 0xA720 (ALDERLAKE_P)
[04:42:22] [PASSED] 0xA7A0 (ALDERLAKE_P)
[04:42:22] [PASSED] 0xA7A8 (ALDERLAKE_P)
[04:42:22] [PASSED] 0xA7AA (ALDERLAKE_P)
[04:42:22] [PASSED] 0xA7AB (ALDERLAKE_P)
[04:42:22] [PASSED] 0xA780 (ALDERLAKE_S)
[04:42:22] [PASSED] 0xA781 (ALDERLAKE_S)
[04:42:22] [PASSED] 0xA782 (ALDERLAKE_S)
[04:42:22] [PASSED] 0xA783 (ALDERLAKE_S)
[04:42:22] [PASSED] 0xA788 (ALDERLAKE_S)
[04:42:22] [PASSED] 0xA789 (ALDERLAKE_S)
[04:42:22] [PASSED] 0xA78A (ALDERLAKE_S)
[04:42:22] [PASSED] 0xA78B (ALDERLAKE_S)
[04:42:22] [PASSED] 0x4905 (DG1)
[04:42:22] [PASSED] 0x4906 (DG1)
[04:42:22] [PASSED] 0x4907 (DG1)
[04:42:22] [PASSED] 0x4908 (DG1)
[04:42:22] [PASSED] 0x4909 (DG1)
[04:42:22] [PASSED] 0x56C0 (DG2)
[04:42:22] [PASSED] 0x56C2 (DG2)
[04:42:22] [PASSED] 0x56C1 (DG2)
[04:42:22] [PASSED] 0x7D51 (METEORLAKE)
[04:42:22] [PASSED] 0x7DD1 (METEORLAKE)
[04:42:22] [PASSED] 0x7D41 (METEORLAKE)
[04:42:22] [PASSED] 0x7D67 (METEORLAKE)
[04:42:22] [PASSED] 0xB640 (METEORLAKE)
[04:42:22] [PASSED] 0x56A0 (DG2)
[04:42:22] [PASSED] 0x56A1 (DG2)
[04:42:22] [PASSED] 0x56A2 (DG2)
[04:42:22] [PASSED] 0x56BE (DG2)
[04:42:22] [PASSED] 0x56BF (DG2)
[04:42:22] [PASSED] 0x5690 (DG2)
[04:42:22] [PASSED] 0x5691 (DG2)
[04:42:22] [PASSED] 0x5692 (DG2)
[04:42:22] [PASSED] 0x56A5 (DG2)
[04:42:22] [PASSED] 0x56A6 (DG2)
[04:42:22] [PASSED] 0x56B0 (DG2)
[04:42:22] [PASSED] 0x56B1 (DG2)
[04:42:22] [PASSED] 0x56BA (DG2)
[04:42:22] [PASSED] 0x56BB (DG2)
[04:42:22] [PASSED] 0x56BC (DG2)
[04:42:22] [PASSED] 0x56BD (DG2)
[04:42:22] [PASSED] 0x5693 (DG2)
[04:42:22] [PASSED] 0x5694 (DG2)
[04:42:22] [PASSED] 0x5695 (DG2)
[04:42:22] [PASSED] 0x56A3 (DG2)
[04:42:22] [PASSED] 0x56A4 (DG2)
[04:42:22] [PASSED] 0x56B2 (DG2)
[04:42:22] [PASSED] 0x56B3 (DG2)
[04:42:22] [PASSED] 0x5696 (DG2)
[04:42:22] [PASSED] 0x5697 (DG2)
[04:42:22] [PASSED] 0xB69 (PVC)
[04:42:22] [PASSED] 0xB6E (PVC)
[04:42:22] [PASSED] 0xBD4 (PVC)
[04:42:22] [PASSED] 0xBD5 (PVC)
[04:42:22] [PASSED] 0xBD6 (PVC)
[04:42:22] [PASSED] 0xBD7 (PVC)
[04:42:22] [PASSED] 0xBD8 (PVC)
[04:42:22] [PASSED] 0xBD9 (PVC)
[04:42:22] [PASSED] 0xBDA (PVC)
[04:42:22] [PASSED] 0xBDB (PVC)
[04:42:22] [PASSED] 0xBE0 (PVC)
[04:42:22] [PASSED] 0xBE1 (PVC)
[04:42:22] [PASSED] 0xBE5 (PVC)
[04:42:22] [PASSED] 0x7D40 (METEORLAKE)
[04:42:22] [PASSED] 0x7D45 (METEORLAKE)
[04:42:22] [PASSED] 0x7D55 (METEORLAKE)
[04:42:22] [PASSED] 0x7D60 (METEORLAKE)
[04:42:22] [PASSED] 0x7DD5 (METEORLAKE)
[04:42:22] [PASSED] 0x6420 (LUNARLAKE)
[04:42:22] [PASSED] 0x64A0 (LUNARLAKE)
[04:42:22] [PASSED] 0x64B0 (LUNARLAKE)
[04:42:22] [PASSED] 0xE202 (BATTLEMAGE)
[04:42:22] [PASSED] 0xE209 (BATTLEMAGE)
[04:42:22] [PASSED] 0xE20B (BATTLEMAGE)
[04:42:22] [PASSED] 0xE20C (BATTLEMAGE)
[04:42:22] [PASSED] 0xE20D (BATTLEMAGE)
[04:42:22] [PASSED] 0xE210 (BATTLEMAGE)
[04:42:22] [PASSED] 0xE211 (BATTLEMAGE)
[04:42:22] [PASSED] 0xE212 (BATTLEMAGE)
[04:42:22] [PASSED] 0xE216 (BATTLEMAGE)
[04:42:22] [PASSED] 0xE220 (BATTLEMAGE)
[04:42:22] [PASSED] 0xE221 (BATTLEMAGE)
[04:42:22] [PASSED] 0xE222 (BATTLEMAGE)
[04:42:22] [PASSED] 0xE223 (BATTLEMAGE)
[04:42:22] [PASSED] 0xB080 (PANTHERLAKE)
[04:42:22] [PASSED] 0xB081 (PANTHERLAKE)
[04:42:22] [PASSED] 0xB082 (PANTHERLAKE)
[04:42:22] [PASSED] 0xB083 (PANTHERLAKE)
[04:42:22] [PASSED] 0xB084 (PANTHERLAKE)
[04:42:22] [PASSED] 0xB085 (PANTHERLAKE)
[04:42:22] [PASSED] 0xB086 (PANTHERLAKE)
[04:42:22] [PASSED] 0xB087 (PANTHERLAKE)
[04:42:22] [PASSED] 0xB08F (PANTHERLAKE)
[04:42:22] [PASSED] 0xB090 (PANTHERLAKE)
[04:42:22] [PASSED] 0xB0A0 (PANTHERLAKE)
[04:42:22] [PASSED] 0xB0B0 (PANTHERLAKE)
[04:42:22] [PASSED] 0xFD80 (PANTHERLAKE)
[04:42:22] [PASSED] 0xFD81 (PANTHERLAKE)
[04:42:22] [PASSED] 0xD740 (NOVALAKE_S)
[04:42:22] [PASSED] 0xD741 (NOVALAKE_S)
[04:42:22] [PASSED] 0xD742 (NOVALAKE_S)
[04:42:22] [PASSED] 0xD743 (NOVALAKE_S)
[04:42:22] [PASSED] 0xD745 (NOVALAKE_S)
[04:42:22] [PASSED] 0xD74A (NOVALAKE_S)
[04:42:22] [PASSED] 0xD74B (NOVALAKE_S)
[04:42:22] [PASSED] 0x674C (CRESCENTISLAND)
[04:42:22] [PASSED] 0x674D (CRESCENTISLAND)
[04:42:22] [PASSED] 0x674E (CRESCENTISLAND)
[04:42:22] [PASSED] 0x674F (CRESCENTISLAND)
[04:42:22] [PASSED] 0x6750 (CRESCENTISLAND)
[04:42:22] [PASSED] 0xD750 (NOVALAKE_P)
[04:42:22] [PASSED] 0xD751 (NOVALAKE_P)
[04:42:22] [PASSED] 0xD752 (NOVALAKE_P)
[04:42:22] [PASSED] 0xD753 (NOVALAKE_P)
[04:42:22] [PASSED] 0xD754 (NOVALAKE_P)
[04:42:22] [PASSED] 0xD755 (NOVALAKE_P)
[04:42:22] [PASSED] 0xD756 (NOVALAKE_P)
[04:42:22] [PASSED] 0xD757 (NOVALAKE_P)
[04:42:22] [PASSED] 0xD75F (NOVALAKE_P)
[04:42:22] =============== [PASSED] check_platform_desc ===============
[04:42:22] ===================== [PASSED] xe_pci ======================
[04:42:22] ============= xe_rtp_tables_test (5 subtests) ==============
[04:42:22] ================== xe_rtp_table_gt_test  ===================
[04:42:22] [PASSED] gt_was/14011060649
[04:42:22] [PASSED] gt_was/14011059788
[04:42:22] [PASSED] gt_was/14015795083
[04:42:22] [PASSED] gt_was/16021867713
[04:42:22] [PASSED] gt_was/14019449301
[04:42:22] [PASSED] gt_was/16028005424
[04:42:22] [PASSED] gt_was/14026578760
[04:42:22] [PASSED] gt_was/1409420604
[04:42:22] [PASSED] gt_was/1408615072
[04:42:22] [PASSED] gt_was/22010523718
[04:42:22] [PASSED] gt_was/14011006942
[04:42:22] [PASSED] gt_was/14014830051
[04:42:22] [PASSED] gt_was/18018781329
[04:42:22] [PASSED] gt_was/1509235366
[04:42:22] [PASSED] gt_was/18018781329
[04:42:22] [PASSED] gt_was/16016694945
[04:42:22] [PASSED] gt_was/14018575942
[04:42:22] [PASSED] gt_was/22016670082
[04:42:22] [PASSED] gt_was/22016670082
[04:42:22] [PASSED] gt_was/14017421178
[04:42:22] [PASSED] gt_was/16025250150
[04:42:22] [PASSED] gt_was/14021871409
[04:42:22] [PASSED] gt_was/16021865536
[04:42:22] [PASSED] gt_was/14021486841
[04:42:22] [PASSED] gt_was/14025160223
[04:42:22] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[04:42:22] [PASSED] gt_was/14025635424
[04:42:22] [PASSED] gt_was/16028005424
[04:42:22] ============== [PASSED] xe_rtp_table_gt_test ===============
[04:42:22] ================== xe_rtp_table_gt_test  ===================
[04:42:22] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[04:42:22] [PASSED] gt_tunings/Tuning: 32B Access Enable
[04:42:22] [PASSED] gt_tunings/Tuning: L3 cache
[04:42:22] [PASSED] gt_tunings/Tuning: L3 cache - media
[04:42:22] [PASSED] gt_tunings/Tuning: Compression Overfetch
[04:42:22] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[04:42:22] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[04:42:22] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[04:42:22] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[04:42:22] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[04:42:22] [PASSED] gt_tunings/Tuning: Stateless compression control
[04:42:22] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[04:42:22] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[04:42:22] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[04:42:22] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[04:42:22] ============== [PASSED] xe_rtp_table_gt_test ===============
[04:42:22] ================== xe_rtp_table_oob_test  ==================
[04:42:22] [PASSED] oob_was/1607983814
[04:42:22] [PASSED] oob_was/16010904313
[04:42:22] [PASSED] oob_was/18022495364
[04:42:22] [PASSED] oob_was/22012773006
[04:42:22] [PASSED] oob_was/14014475959
[04:42:22] [PASSED] oob_was/22011391025
[04:42:22] [PASSED] oob_was/22012727170
[04:42:22] [PASSED] oob_was/22012727685
[04:42:22] [PASSED] oob_was/22016596838
[04:42:22] [PASSED] oob_was/18020744125
[04:42:22] [PASSED] oob_was/1409600907
[04:42:22] [PASSED] oob_was/22014953428
[04:42:22] [PASSED] oob_was/16017236439
[04:42:22] [PASSED] oob_was/14019821291
[04:42:22] [PASSED] oob_was/14015076503
[04:42:22] [PASSED] oob_was/14018913170
[04:42:22] [PASSED] oob_was/14018094691
[04:42:22] [PASSED] oob_was/18024947630
[04:42:22] [PASSED] oob_was/16022287689
[04:42:22] [PASSED] oob_was/13011645652
[04:42:22] [PASSED] oob_was/14022293748
[04:42:22] [PASSED] oob_was/22019794406
[04:42:22] [PASSED] oob_was/22019338487
[04:42:22] [PASSED] oob_was/16023588340
[04:42:22] [PASSED] oob_was/14019789679
[04:42:22] [PASSED] oob_was/14022866841
[04:42:22] [PASSED] oob_was/16021333562
[04:42:22] [PASSED] oob_was/14016712196
[04:42:22] [PASSED] oob_was/14015568240
[04:42:22] [PASSED] oob_was/18013179988
[04:42:22] [PASSED] oob_was/1508761755
[04:42:22] [PASSED] oob_was/16023105232
[04:42:22] [PASSED] oob_was/16026508708
[04:42:22] [PASSED] oob_was/14020001231
[04:42:22] [PASSED] oob_was/16023683509
[04:42:22] [PASSED] oob_was/14025515070
[04:42:22] [PASSED] oob_was/15015404425_disable
[04:42:22] [PASSED] oob_was/16026007364
[04:42:22] [PASSED] oob_was/14020316580
[04:42:22] [PASSED] oob_was/14025883347
[04:42:22] [PASSED] oob_was/16029380221
[04:42:22] [PASSED] oob_was/22022079272
[04:42:22] [PASSED] oob_was/16029897822
[04:42:22] [PASSED] oob_was/14027054324
[04:42:22] ============== [PASSED] xe_rtp_table_oob_test ==============
[04:42:22] ================ xe_rtp_table_dev_oob_test  ================
[04:42:22] [PASSED] device_oob_was/22010954014
[04:42:22] [PASSED] device_oob_was/15015404425
[04:42:22] [PASSED] device_oob_was/22019338487_display
[04:42:22] [PASSED] device_oob_was/14022085890
[04:42:22] [PASSED] device_oob_was/14026539277
[04:42:22] [PASSED] device_oob_was/14026633728
[04:42:22] [PASSED] device_oob_was/14026746987
[04:42:22] [PASSED] device_oob_was/14026779378
[04:42:22] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[04:42:22] ========== xe_rtp_table_missing_upper_bound_test  ==========
[04:42:22] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[04:42:22] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[04:42:22] [PASSED] register_whitelist/1806527549
[04:42:22] [PASSED] register_whitelist/allow_read_ctx_timestamp
[04:42:22] [PASSED] register_whitelist/allow_read_queue_timestamp
[04:42:22] [PASSED] register_whitelist/16014440446
[04:42:22] [PASSED] register_whitelist/16017236439
[04:42:22] [PASSED] register_whitelist/16020183090
[04:42:22] [PASSED] register_whitelist/14024997852
[04:42:22] [PASSED] register_whitelist/14024997852
[04:42:22] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[04:42:22] =============== [PASSED] xe_rtp_tables_test ================
[04:42:22] =================== xe_rtp (3 subtests) ====================
[04:42:22] =================== xe_rtp_rules_tests  ====================
[04:42:22] [PASSED] no
[04:42:22] [PASSED] yes
[04:42:22] [PASSED] no-and-no
[04:42:22] [PASSED] no-and-yes
[04:42:22] [PASSED] yes-and-no
[04:42:22] [PASSED] yes-and-yes
[04:42:22] [PASSED] no-or-no
[04:42:22] [PASSED] no-or-yes
[04:42:22] [PASSED] yes-or-no
[04:42:22] [PASSED] yes-or-yes
[04:42:22] [PASSED] no-yes-or-yes-no
[04:42:22] [PASSED] no-yes-or-yes-yes
[04:42:22] [PASSED] yes-yes-or-no-yes
[04:42:22] [PASSED] yes-yes-or-yes-yes
[04:42:22] [PASSED] no-no-or-yes-or-no
[04:42:22] [PASSED] or
[04:42:22] [PASSED] or-yes
[04:42:22] [PASSED] or-no
[04:42:22] [PASSED] yes-or
[04:42:22] [PASSED] no-or
[04:42:22] [PASSED] no-or-or-yes
[04:42:22] [PASSED] yes-or-or-no
[04:42:22] [PASSED] no-or-or-no
[04:42:22] [PASSED] missing-context-engine-class
[04:42:22] [PASSED] missing-context-engine-class-or-yes
[04:42:22] [PASSED] missing-context-engine-class-or-or-yes
[04:42:22] =============== [PASSED] xe_rtp_rules_tests ================
[04:42:22] =============== xe_rtp_process_to_sr_tests  ================
[04:42:22] [PASSED] coalesce-same-reg
[04:42:22] [PASSED] coalesce-same-reg-literal-and-func
[04:42:22] [PASSED] no-match-no-add
[04:42:22] [PASSED] two-regs-two-entries
[04:42:22] [PASSED] clr-one-set-other
[04:42:22] [PASSED] set-field
[04:42:22] [PASSED] conflict-duplicate
[04:42:22] [PASSED] conflict-not-disjoint
[04:42:22] [PASSED] conflict-not-disjoint-literal-and-func
[04:42:22] [PASSED] conflict-reg-type
[04:42:22] [PASSED] bad-mcr-reg-forced-to-regular
[04:42:22] [PASSED] bad-regular-reg-forced-to-mcr
[04:42:22] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[04:42:22] ================== xe_rtp_process_tests  ===================
[04:42:22] [PASSED] active1
[04:42:22] [PASSED] active2
[04:42:22] [PASSED] active-inactive
[04:42:22] [PASSED] inactive-active
[04:42:22] [PASSED] inactive-active-inactive
[04:42:22] [PASSED] inactive-inactive-inactive
[04:42:22] ============== [PASSED] xe_rtp_process_tests ===============
[04:42:22] ===================== [PASSED] xe_rtp ======================
[04:42:22] ==================== xe_wa (1 subtest) =====================
[04:42:22] ======================== xe_wa_gt  =========================
[04:42:22] [PASSED] TIGERLAKE B0
[04:42:22] [PASSED] DG1 A0
[04:42:22] [PASSED] DG1 B0
[04:42:22] [PASSED] ALDERLAKE_S A0
[04:42:22] [PASSED] ALDERLAKE_S B0
[04:42:22] [PASSED] ALDERLAKE_S C0
[04:42:22] [PASSED] ALDERLAKE_S D0
[04:42:22] [PASSED] ALDERLAKE_P A0
[04:42:22] [PASSED] ALDERLAKE_P B0
[04:42:22] [PASSED] ALDERLAKE_P C0
[04:42:22] [PASSED] ALDERLAKE_S RPLS D0
[04:42:22] [PASSED] ALDERLAKE_P RPLU E0
[04:42:22] [PASSED] DG2 G10 C0
[04:42:22] [PASSED] DG2 G11 B1
[04:42:22] [PASSED] DG2 G12 A1
[04:42:22] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[04:42:22] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[04:42:22] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[04:42:22] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[04:42:22] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[04:42:22] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[04:42:22] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[04:42:22] ==================== [PASSED] xe_wa_gt =====================
[04:42:22] ====================== [PASSED] xe_wa ======================
[04:42:22] ============================================================
[04:42:22] Testing complete. Ran 819 tests: passed: 791, skipped: 28
[04:42:22] Elapsed time: 37.077s total, 1.808s configuring, 34.502s building, 0.723s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[04:42:22] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:42:24] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[04:42:49] Starting KUnit Kernel (1/1)...
[04:42:49] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[04:42:49] ============= refcount_interrupt (4 subtests) ==============
[04:42:49] [PASSED] test_single_irq_change
[04:42:49] [PASSED] test_nested_irq_change
[04:42:49] [PASSED] test_multiple_irq_change
[04:42:49] [PASSED] test_irq_save
[04:42:49] =============== [PASSED] refcount_interrupt ================
[04:42:49] ============ drm_test_pick_cmdline (2 subtests) ============
[04:42:49] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[04:42:49] =============== drm_test_pick_cmdline_named  ===============
[04:42:49] [PASSED] NTSC
[04:42:49] [PASSED] NTSC-J
[04:42:49] [PASSED] PAL
[04:42:49] [PASSED] PAL-M
[04:42:49] =========== [PASSED] drm_test_pick_cmdline_named ===========
[04:42:49] ============== [PASSED] drm_test_pick_cmdline ==============
[04:42:49] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[04:42:49] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[04:42:49] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[04:42:49] =========== drm_validate_clone_mode (2 subtests) ===========
[04:42:49] ============== drm_test_check_in_clone_mode  ===============
[04:42:49] [PASSED] in_clone_mode
[04:42:49] [PASSED] not_in_clone_mode
[04:42:49] ========== [PASSED] drm_test_check_in_clone_mode ===========
[04:42:49] =============== drm_test_check_valid_clones  ===============
[04:42:49] [PASSED] not_in_clone_mode
[04:42:49] [PASSED] valid_clone
[04:42:49] [PASSED] invalid_clone
[04:42:49] =========== [PASSED] drm_test_check_valid_clones ===========
[04:42:49] ============= [PASSED] drm_validate_clone_mode =============
[04:42:49] ============= drm_validate_modeset (1 subtest) =============
[04:42:49] [PASSED] drm_test_check_connector_changed_modeset
[04:42:49] ============== [PASSED] drm_validate_modeset ===============
[04:42:49] ====== drm_test_bridge_get_current_state (1 subtest) =======
[04:42:49] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[04:42:49] ======== [PASSED] drm_test_bridge_get_current_state ========
[04:42:49] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[04:42:49] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[04:42:49] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[04:42:49] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[04:42:49] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[04:42:49] ============== drm_bridge_alloc (2 subtests) ===============
[04:42:49] [PASSED] drm_test_drm_bridge_alloc_basic
[04:42:49] [PASSED] drm_test_drm_bridge_alloc_get_put
[04:42:49] ================ [PASSED] drm_bridge_alloc =================
[04:42:49] ============= drm_bridge_bus_fmt (5 subtests) ==============
[04:42:49] [PASSED] drm_test_bridge_rgb_yuv_rgb
[04:42:49] [PASSED] drm_test_bridge_must_convert_to_yuv444
[04:42:49] [PASSED] drm_test_bridge_hdmi_auto_rgb
[04:42:49] [PASSED] drm_test_bridge_auto_first
[04:42:49] [PASSED] drm_test_bridge_rgb_yuv_no_path
[04:42:49] =============== [PASSED] drm_bridge_bus_fmt ================
[04:42:49] ============= drm_cmdline_parser (40 subtests) =============
[04:42:49] [PASSED] drm_test_cmdline_force_d_only
[04:42:49] [PASSED] drm_test_cmdline_force_D_only_dvi
[04:42:49] [PASSED] drm_test_cmdline_force_D_only_hdmi
[04:42:49] [PASSED] drm_test_cmdline_force_D_only_not_digital
[04:42:49] [PASSED] drm_test_cmdline_force_e_only
[04:42:49] [PASSED] drm_test_cmdline_res
[04:42:49] [PASSED] drm_test_cmdline_res_vesa
[04:42:49] [PASSED] drm_test_cmdline_res_vesa_rblank
[04:42:49] [PASSED] drm_test_cmdline_res_rblank
[04:42:49] [PASSED] drm_test_cmdline_res_bpp
[04:42:49] [PASSED] drm_test_cmdline_res_refresh
[04:42:49] [PASSED] drm_test_cmdline_res_bpp_refresh
[04:42:49] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[04:42:49] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[04:42:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[04:42:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[04:42:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[04:42:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[04:42:49] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[04:42:49] [PASSED] drm_test_cmdline_res_margins_force_on
[04:42:49] [PASSED] drm_test_cmdline_res_vesa_margins
[04:42:49] [PASSED] drm_test_cmdline_name
[04:42:49] [PASSED] drm_test_cmdline_name_bpp
[04:42:49] [PASSED] drm_test_cmdline_name_option
[04:42:49] [PASSED] drm_test_cmdline_name_bpp_option
[04:42:49] [PASSED] drm_test_cmdline_rotate_0
[04:42:49] [PASSED] drm_test_cmdline_rotate_90
[04:42:49] [PASSED] drm_test_cmdline_rotate_180
[04:42:49] [PASSED] drm_test_cmdline_rotate_270
[04:42:49] [PASSED] drm_test_cmdline_hmirror
[04:42:49] [PASSED] drm_test_cmdline_vmirror
[04:42:49] [PASSED] drm_test_cmdline_margin_options
[04:42:49] [PASSED] drm_test_cmdline_multiple_options
[04:42:49] [PASSED] drm_test_cmdline_bpp_extra_and_option
[04:42:49] [PASSED] drm_test_cmdline_extra_and_option
[04:42:49] [PASSED] drm_test_cmdline_freestanding_options
[04:42:49] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[04:42:49] [PASSED] drm_test_cmdline_panel_orientation
[04:42:49] ================ drm_test_cmdline_invalid  =================
[04:42:49] [PASSED] margin_only
[04:42:49] [PASSED] interlace_only
[04:42:49] [PASSED] res_missing_x
[04:42:49] [PASSED] res_missing_y
[04:42:49] [PASSED] res_bad_y
[04:42:49] [PASSED] res_missing_y_bpp
[04:42:49] [PASSED] res_bad_bpp
[04:42:49] [PASSED] res_bad_refresh
[04:42:49] [PASSED] res_bpp_refresh_force_on_off
[04:42:49] [PASSED] res_invalid_mode
[04:42:49] [PASSED] res_bpp_wrong_place_mode
[04:42:49] [PASSED] name_bpp_refresh
[04:42:49] [PASSED] name_refresh
[04:42:49] [PASSED] name_refresh_wrong_mode
[04:42:49] [PASSED] name_refresh_invalid_mode
[04:42:49] [PASSED] rotate_multiple
[04:42:49] [PASSED] rotate_invalid_val
[04:42:49] [PASSED] rotate_truncated
[04:42:49] [PASSED] invalid_option
[04:42:49] [PASSED] invalid_tv_option
[04:42:49] [PASSED] truncated_tv_option
[04:42:49] ============ [PASSED] drm_test_cmdline_invalid =============
[04:42:49] =============== drm_test_cmdline_tv_options  ===============
[04:42:49] [PASSED] NTSC
[04:42:49] [PASSED] NTSC_443
[04:42:49] [PASSED] NTSC_J
[04:42:49] [PASSED] PAL
[04:42:49] [PASSED] PAL_M
[04:42:49] [PASSED] PAL_N
[04:42:49] [PASSED] SECAM
[04:42:49] [PASSED] MONO_525
[04:42:49] [PASSED] MONO_625
[04:42:49] =========== [PASSED] drm_test_cmdline_tv_options ===========
[04:42:49] =============== [PASSED] drm_cmdline_parser ================
[04:42:49] ========== drmm_connector_hdmi_init (20 subtests) ==========
[04:42:49] [PASSED] drm_test_connector_hdmi_init_valid
[04:42:49] [PASSED] drm_test_connector_hdmi_init_bpc_8
[04:42:49] [PASSED] drm_test_connector_hdmi_init_bpc_10
[04:42:49] [PASSED] drm_test_connector_hdmi_init_bpc_12
[04:42:49] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[04:42:49] [PASSED] drm_test_connector_hdmi_init_bpc_null
[04:42:49] [PASSED] drm_test_connector_hdmi_init_formats_empty
[04:42:49] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[04:42:49] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[04:42:49] [PASSED] supported_formats=0x9 yuv420_allowed=1
[04:42:49] [PASSED] supported_formats=0x9 yuv420_allowed=0
[04:42:49] [PASSED] supported_formats=0x5 yuv420_allowed=1
[04:42:49] [PASSED] supported_formats=0x5 yuv420_allowed=0
[04:42:49] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[04:42:49] [PASSED] drm_test_connector_hdmi_init_null_ddc
[04:42:49] [PASSED] drm_test_connector_hdmi_init_null_product
[04:42:49] [PASSED] drm_test_connector_hdmi_init_null_vendor
[04:42:49] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[04:42:49] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[04:42:49] [PASSED] drm_test_connector_hdmi_init_product_valid
[04:42:49] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[04:42:49] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[04:42:49] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[04:42:49] ========= drm_test_connector_hdmi_init_type_valid  =========
[04:42:49] [PASSED] HDMI-A
[04:42:49] [PASSED] HDMI-B
[04:42:49] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[04:42:49] ======== drm_test_connector_hdmi_init_type_invalid  ========
[04:42:49] [PASSED] Unknown
[04:42:49] [PASSED] VGA
[04:42:49] [PASSED] DVI-I
[04:42:49] [PASSED] DVI-D
[04:42:49] [PASSED] DVI-A
[04:42:49] [PASSED] Composite
[04:42:49] [PASSED] SVIDEO
[04:42:49] [PASSED] LVDS
[04:42:49] [PASSED] Component
[04:42:49] [PASSED] DIN
[04:42:49] [PASSED] DP
[04:42:49] [PASSED] TV
[04:42:49] [PASSED] eDP
[04:42:49] [PASSED] Virtual
[04:42:49] [PASSED] DSI
[04:42:49] [PASSED] DPI
[04:42:49] [PASSED] Writeback
[04:42:49] [PASSED] SPI
[04:42:49] [PASSED] USB
[04:42:49] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[04:42:49] ============ [PASSED] drmm_connector_hdmi_init =============
[04:42:49] ============= drmm_connector_init (3 subtests) =============
[04:42:49] [PASSED] drm_test_drmm_connector_init
[04:42:49] [PASSED] drm_test_drmm_connector_init_null_ddc
[04:42:49] ========= drm_test_drmm_connector_init_type_valid  =========
[04:42:49] [PASSED] Unknown
[04:42:49] [PASSED] VGA
[04:42:49] [PASSED] DVI-I
[04:42:49] [PASSED] DVI-D
[04:42:49] [PASSED] DVI-A
[04:42:49] [PASSED] Composite
[04:42:49] [PASSED] SVIDEO
[04:42:49] [PASSED] LVDS
[04:42:49] [PASSED] Component
[04:42:49] [PASSED] DIN
[04:42:49] [PASSED] DP
[04:42:49] [PASSED] HDMI-A
[04:42:49] [PASSED] HDMI-B
[04:42:49] [PASSED] TV
[04:42:49] [PASSED] eDP
[04:42:49] [PASSED] Virtual
[04:42:49] [PASSED] DSI
[04:42:49] [PASSED] DPI
[04:42:49] [PASSED] Writeback
[04:42:49] [PASSED] SPI
[04:42:49] [PASSED] USB
[04:42:49] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[04:42:49] =============== [PASSED] drmm_connector_init ===============
[04:42:49] ========= drm_connector_dynamic_init (6 subtests) ==========
[04:42:49] [PASSED] drm_test_drm_connector_dynamic_init
[04:42:49] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[04:42:49] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[04:42:49] [PASSED] drm_test_drm_connector_dynamic_init_properties
[04:42:49] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[04:42:49] [PASSED] Unknown
[04:42:49] [PASSED] VGA
[04:42:49] [PASSED] DVI-I
[04:42:49] [PASSED] DVI-D
[04:42:49] [PASSED] DVI-A
[04:42:49] [PASSED] Composite
[04:42:49] [PASSED] SVIDEO
[04:42:49] [PASSED] LVDS
[04:42:49] [PASSED] Component
[04:42:49] [PASSED] DIN
[04:42:49] [PASSED] DP
[04:42:49] [PASSED] HDMI-A
[04:42:49] [PASSED] HDMI-B
[04:42:49] [PASSED] TV
[04:42:49] [PASSED] eDP
[04:42:49] [PASSED] Virtual
[04:42:49] [PASSED] DSI
[04:42:49] [PASSED] DPI
[04:42:49] [PASSED] Writeback
[04:42:49] [PASSED] SPI
[04:42:49] [PASSED] USB
[04:42:49] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[04:42:49] ======== drm_test_drm_connector_dynamic_init_name  =========
[04:42:49] [PASSED] Unknown
[04:42:49] [PASSED] VGA
[04:42:49] [PASSED] DVI-I
[04:42:49] [PASSED] DVI-D
[04:42:49] [PASSED] DVI-A
[04:42:49] [PASSED] Composite
[04:42:49] [PASSED] SVIDEO
[04:42:49] [PASSED] LVDS
[04:42:49] [PASSED] Component
[04:42:49] [PASSED] DIN
[04:42:49] [PASSED] DP
[04:42:49] [PASSED] HDMI-A
[04:42:49] [PASSED] HDMI-B
[04:42:49] [PASSED] TV
[04:42:49] [PASSED] eDP
[04:42:49] [PASSED] Virtual
[04:42:49] [PASSED] DSI
[04:42:49] [PASSED] DPI
[04:42:49] [PASSED] Writeback
[04:42:49] [PASSED] SPI
[04:42:49] [PASSED] USB
[04:42:49] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[04:42:49] =========== [PASSED] drm_connector_dynamic_init ============
[04:42:49] ==== drm_connector_dynamic_register_early (4 subtests) =====
[04:42:49] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[04:42:49] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[04:42:49] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[04:42:49] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[04:42:49] ====== [PASSED] drm_connector_dynamic_register_early =======
[04:42:49] ======= drm_connector_dynamic_register (7 subtests) ========
[04:42:49] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[04:42:49] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[04:42:49] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[04:42:49] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[04:42:49] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[04:42:49] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[04:42:49] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[04:42:49] ========= [PASSED] drm_connector_dynamic_register ==========
[04:42:49] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[04:42:49] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[04:42:49] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[04:42:49] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[04:42:49] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[04:42:49] ========== drm_test_get_tv_mode_from_name_valid  ===========
[04:42:49] [PASSED] NTSC
[04:42:49] [PASSED] NTSC-443
[04:42:49] [PASSED] NTSC-J
[04:42:49] [PASSED] PAL
[04:42:49] [PASSED] PAL-M
[04:42:49] [PASSED] PAL-N
[04:42:49] [PASSED] SECAM
[04:42:49] [PASSED] Mono
[04:42:49] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[04:42:49] [PASSED] drm_test_get_tv_mode_from_name_truncated
[04:42:49] ============ [PASSED] drm_get_tv_mode_from_name ============
[04:42:49] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[04:42:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[04:42:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[04:42:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[04:42:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[04:42:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[04:42:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[04:42:49] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[04:42:49] [PASSED] VIC 96
[04:42:49] [PASSED] VIC 97
[04:42:49] [PASSED] VIC 101
[04:42:49] [PASSED] VIC 102
[04:42:49] [PASSED] VIC 106
[04:42:49] [PASSED] VIC 107
[04:42:49] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[04:42:49] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[04:42:49] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[04:42:49] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[04:42:49] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[04:42:49] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[04:42:49] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[04:42:49] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[04:42:49] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[04:42:49] [PASSED] Automatic
[04:42:49] [PASSED] Full
[04:42:49] [PASSED] Limited 16:235
[04:42:49] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[04:42:49] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[04:42:49] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[04:42:49] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[04:42:49] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[04:42:49] [PASSED] RGB
[04:42:49] [PASSED] YUV 4:2:0
[04:42:49] [PASSED] YUV 4:2:2
[04:42:49] [PASSED] YUV 4:4:4
[04:42:49] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[04:42:49] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[04:42:49] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[04:42:49] ============= drm_damage_helper (21 subtests) ==============
[04:42:49] [PASSED] drm_test_damage_iter_no_damage
[04:42:49] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[04:42:49] [PASSED] drm_test_damage_iter_no_damage_src_moved
[04:42:49] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[04:42:49] [PASSED] drm_test_damage_iter_no_damage_not_visible
[04:42:49] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[04:42:49] [PASSED] drm_test_damage_iter_no_damage_no_fb
[04:42:49] [PASSED] drm_test_damage_iter_simple_damage
[04:42:49] [PASSED] drm_test_damage_iter_single_damage
[04:42:49] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[04:42:49] [PASSED] drm_test_damage_iter_single_damage_outside_src
[04:42:49] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[04:42:49] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[04:42:49] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[04:42:49] [PASSED] drm_test_damage_iter_single_damage_src_moved
[04:42:49] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[04:42:49] [PASSED] drm_test_damage_iter_damage
[04:42:49] [PASSED] drm_test_damage_iter_damage_one_intersect
[04:42:49] [PASSED] drm_test_damage_iter_damage_one_outside
[04:42:49] [PASSED] drm_test_damage_iter_damage_src_moved
[04:42:49] [PASSED] drm_test_damage_iter_damage_not_visible
[04:42:49] ================ [PASSED] drm_damage_helper ================
[04:42:49] ============== drm_dp_mst_helper (3 subtests) ==============
[04:42:49] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[04:42:49] [PASSED] Clock 154000 BPP 30 DSC disabled
[04:42:49] [PASSED] Clock 234000 BPP 30 DSC disabled
[04:42:49] [PASSED] Clock 297000 BPP 24 DSC disabled
[04:42:49] [PASSED] Clock 332880 BPP 24 DSC enabled
[04:42:49] [PASSED] Clock 324540 BPP 24 DSC enabled
[04:42:49] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[04:42:49] ============== drm_test_dp_mst_calc_pbn_div  ===============
[04:42:49] [PASSED] Link rate 2000000 lane count 4
[04:42:49] [PASSED] Link rate 2000000 lane count 2
[04:42:49] [PASSED] Link rate 2000000 lane count 1
[04:42:49] [PASSED] Link rate 1350000 lane count 4
[04:42:49] [PASSED] Link rate 1350000 lane count 2
[04:42:49] [PASSED] Link rate 1350000 lane count 1
[04:42:49] [PASSED] Link rate 1000000 lane count 4
[04:42:49] [PASSED] Link rate 1000000 lane count 2
[04:42:49] [PASSED] Link rate 1000000 lane count 1
[04:42:49] [PASSED] Link rate 810000 lane count 4
[04:42:49] [PASSED] Link rate 810000 lane count 2
[04:42:49] [PASSED] Link rate 810000 lane count 1
[04:42:49] [PASSED] Link rate 540000 lane count 4
[04:42:49] [PASSED] Link rate 540000 lane count 2
[04:42:49] [PASSED] Link rate 540000 lane count 1
[04:42:49] [PASSED] Link rate 270000 lane count 4
[04:42:49] [PASSED] Link rate 270000 lane count 2
[04:42:49] [PASSED] Link rate 270000 lane count 1
[04:42:49] [PASSED] Link rate 162000 lane count 4
[04:42:49] [PASSED] Link rate 162000 lane count 2
[04:42:49] [PASSED] Link rate 162000 lane count 1
[04:42:49] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[04:42:49] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[04:42:49] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[04:42:49] [PASSED] DP_POWER_UP_PHY with port number
[04:42:49] [PASSED] DP_POWER_DOWN_PHY with port number
[04:42:49] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[04:42:49] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[04:42:49] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[04:42:49] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[04:42:49] [PASSED] DP_QUERY_PAYLOAD with port number
[04:42:49] [PASSED] DP_QUERY_PAYLOAD with VCPI
[04:42:49] [PASSED] DP_REMOTE_DPCD_READ with port number
[04:42:49] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[04:42:49] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[04:42:49] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[04:42:49] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[04:42:49] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[04:42:49] [PASSED] DP_REMOTE_I2C_READ with port number
[04:42:49] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[04:42:49] [PASSED] DP_REMOTE_I2C_READ with transactions array
[04:42:49] [PASSED] DP_REMOTE_I2C_WRITE with port number
[04:42:49] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[04:42:49] [PASSED] DP_REMOTE_I2C_WRITE with data array
[04:42:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[04:42:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[04:42:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[04:42:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[04:42:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[04:42:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[04:42:49] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[04:42:49] ================ [PASSED] drm_dp_mst_helper ================
[04:42:49] ================== drm_exec (7 subtests) ===================
[04:42:49] [PASSED] sanitycheck
[04:42:49] [PASSED] test_lock
[04:42:49] [PASSED] test_lock_unlock
[04:42:49] [PASSED] test_duplicates
[04:42:49] [PASSED] test_prepare
[04:42:49] [PASSED] test_prepare_array
[04:42:49] [PASSED] test_multiple_loops
[04:42:49] ==================== [PASSED] drm_exec =====================
[04:42:49] =========== drm_format_helper_test (17 subtests) ===========
[04:42:49] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[04:42:49] [PASSED] single_pixel_source_buffer
[04:42:49] [PASSED] single_pixel_clip_rectangle
[04:42:49] [PASSED] well_known_colors
[04:42:49] [PASSED] destination_pitch
[04:42:49] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[04:42:49] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[04:42:49] [PASSED] single_pixel_source_buffer
[04:42:49] [PASSED] single_pixel_clip_rectangle
[04:42:49] [PASSED] well_known_colors
[04:42:49] [PASSED] destination_pitch
[04:42:49] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[04:42:49] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[04:42:49] [PASSED] single_pixel_source_buffer
[04:42:49] [PASSED] single_pixel_clip_rectangle
[04:42:49] [PASSED] well_known_colors
[04:42:49] [PASSED] destination_pitch
[04:42:49] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[04:42:49] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[04:42:49] [PASSED] single_pixel_source_buffer
[04:42:49] [PASSED] single_pixel_clip_rectangle
[04:42:49] [PASSED] well_known_colors
[04:42:49] [PASSED] destination_pitch
[04:42:49] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[04:42:49] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[04:42:49] [PASSED] single_pixel_source_buffer
[04:42:49] [PASSED] single_pixel_clip_rectangle
[04:42:49] [PASSED] well_known_colors
[04:42:49] [PASSED] destination_pitch
[04:42:49] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[04:42:49] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[04:42:49] [PASSED] single_pixel_source_buffer
[04:42:49] [PASSED] single_pixel_clip_rectangle
[04:42:49] [PASSED] well_known_colors
[04:42:49] [PASSED] destination_pitch
[04:42:49] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[04:42:49] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[04:42:49] [PASSED] single_pixel_source_buffer
[04:42:49] [PASSED] single_pixel_clip_rectangle
[04:42:49] [PASSED] well_known_colors
[04:42:49] [PASSED] destination_pitch
[04:42:49] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[04:42:49] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[04:42:49] [PASSED] single_pixel_source_buffer
[04:42:49] [PASSED] single_pixel_clip_rectangle
[04:42:49] [PASSED] well_known_colors
[04:42:49] [PASSED] destination_pitch
[04:42:49] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[04:42:49] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[04:42:49] [PASSED] single_pixel_source_buffer
[04:42:49] [PASSED] single_pixel_clip_rectangle
[04:42:49] [PASSED] well_known_colors
[04:42:49] [PASSED] destination_pitch
[04:42:49] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[04:42:49] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[04:42:49] [PASSED] single_pixel_source_buffer
[04:42:49] [PASSED] single_pixel_clip_rectangle
[04:42:49] [PASSED] well_known_colors
[04:42:49] [PASSED] destination_pitch
[04:42:49] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[04:42:49] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[04:42:49] [PASSED] single_pixel_source_buffer
[04:42:49] [PASSED] single_pixel_clip_rectangle
[04:42:49] [PASSED] well_known_colors
[04:42:49] [PASSED] destination_pitch
[04:42:49] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[04:42:49] ============== drm_test_fb_xrgb8888_to_mono  ===============
[04:42:49] [PASSED] single_pixel_source_buffer
[04:42:49] [PASSED] single_pixel_clip_rectangle
[04:42:49] [PASSED] well_known_colors
[04:42:49] [PASSED] destination_pitch
[04:42:49] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[04:42:49] ==================== drm_test_fb_swab  =====================
[04:42:49] [PASSED] single_pixel_source_buffer
[04:42:49] [PASSED] single_pixel_clip_rectangle
[04:42:49] [PASSED] well_known_colors
[04:42:49] [PASSED] destination_pitch
[04:42:49] ================ [PASSED] drm_test_fb_swab =================
[04:42:49] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[04:42:49] [PASSED] single_pixel_source_buffer
[04:42:49] [PASSED] single_pixel_clip_rectangle
[04:42:49] [PASSED] well_known_colors
[04:42:49] [PASSED] destination_pitch
[04:42:49] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[04:42:49] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[04:42:49] [PASSED] single_pixel_source_buffer
[04:42:49] [PASSED] single_pixel_clip_rectangle
[04:42:49] [PASSED] well_known_colors
[04:42:49] [PASSED] destination_pitch
[04:42:49] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[04:42:49] ================= drm_test_fb_clip_offset  =================
[04:42:49] [PASSED] pass through
[04:42:49] [PASSED] horizontal offset
[04:42:49] [PASSED] vertical offset
[04:42:49] [PASSED] horizontal and vertical offset
[04:42:49] [PASSED] horizontal offset (custom pitch)
[04:42:49] [PASSED] vertical offset (custom pitch)
[04:42:49] [PASSED] horizontal and vertical offset (custom pitch)
[04:42:49] ============= [PASSED] drm_test_fb_clip_offset =============
[04:42:49] =================== drm_test_fb_memcpy  ====================
[04:42:49] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[04:42:49] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[04:42:49] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[04:42:49] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[04:42:49] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[04:42:49] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[04:42:49] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[04:42:49] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[04:42:49] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[04:42:49] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[04:42:49] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[04:42:49] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[04:42:49] =============== [PASSED] drm_test_fb_memcpy ================
[04:42:49] ============= [PASSED] drm_format_helper_test ==============
[04:42:49] ================= drm_format (18 subtests) =================
[04:42:49] [PASSED] drm_test_format_block_width_invalid
[04:42:49] [PASSED] drm_test_format_block_width_one_plane
[04:42:49] [PASSED] drm_test_format_block_width_two_plane
[04:42:49] [PASSED] drm_test_format_block_width_three_plane
[04:42:49] [PASSED] drm_test_format_block_width_tiled
[04:42:49] [PASSED] drm_test_format_block_height_invalid
[04:42:49] [PASSED] drm_test_format_block_height_one_plane
[04:42:49] [PASSED] drm_test_format_block_height_two_plane
[04:42:49] [PASSED] drm_test_format_block_height_three_plane
[04:42:49] [PASSED] drm_test_format_block_height_tiled
[04:42:49] [PASSED] drm_test_format_min_pitch_invalid
[04:42:49] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[04:42:49] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[04:42:49] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[04:42:49] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[04:42:49] [PASSED] drm_test_format_min_pitch_two_plane
[04:42:49] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[04:42:49] [PASSED] drm_test_format_min_pitch_tiled
[04:42:49] =================== [PASSED] drm_format ====================
[04:42:49] ============== drm_framebuffer (10 subtests) ===============
[04:42:49] ========== drm_test_framebuffer_check_src_coords  ==========
[04:42:49] [PASSED] Success: source fits into fb
[04:42:49] [PASSED] Fail: overflowing fb with x-axis coordinate
[04:42:49] [PASSED] Fail: overflowing fb with y-axis coordinate
[04:42:49] [PASSED] Fail: overflowing fb with source width
[04:42:49] [PASSED] Fail: overflowing fb with source height
[04:42:49] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[04:42:49] [PASSED] drm_test_framebuffer_cleanup
[04:42:49] =============== drm_test_framebuffer_create  ===============
[04:42:49] [PASSED] ABGR8888 normal sizes
[04:42:49] [PASSED] ABGR8888 max sizes
[04:42:49] [PASSED] ABGR8888 pitch greater than min required
[04:42:49] [PASSED] ABGR8888 pitch less than min required
[04:42:49] [PASSED] ABGR8888 Invalid width
[04:42:49] [PASSED] ABGR8888 Invalid buffer handle
[04:42:49] [PASSED] No pixel format
[04:42:49] [PASSED] ABGR8888 Width 0
[04:42:49] [PASSED] ABGR8888 Height 0
[04:42:49] [PASSED] ABGR8888 Out of bound height * pitch combination
[04:42:49] [PASSED] ABGR8888 Large buffer offset
[04:42:49] [PASSED] ABGR8888 Buffer offset for inexistent plane
[04:42:49] [PASSED] ABGR8888 Invalid flag
[04:42:49] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[04:42:49] [PASSED] ABGR8888 Valid buffer modifier
[04:42:49] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[04:42:49] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[04:42:49] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[04:42:49] [PASSED] NV12 Normal sizes
[04:42:49] [PASSED] NV12 Max sizes
[04:42:49] [PASSED] NV12 Invalid pitch
[04:42:49] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[04:42:49] [PASSED] NV12 different  modifier per-plane
[04:42:49] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[04:42:49] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[04:42:49] [PASSED] NV12 Modifier for inexistent plane
[04:42:49] [PASSED] NV12 Handle for inexistent plane
[04:42:49] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[04:42:49] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[04:42:49] [PASSED] YVU420 Normal sizes
[04:42:49] [PASSED] YVU420 Max sizes
[04:42:49] [PASSED] YVU420 Invalid pitch
[04:42:49] [PASSED] YVU420 Different pitches
[04:42:49] [PASSED] YVU420 Different buffer offsets/pitches
[04:42:49] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[04:42:49] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[04:42:49] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[04:42:49] [PASSED] YVU420 Valid modifier
[04:42:49] [PASSED] YVU420 Different modifiers per plane
[04:42:49] [PASSED] YVU420 Modifier for inexistent plane
[04:42:49] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[04:42:49] [PASSED] X0L2 Normal sizes
[04:42:49] [PASSED] X0L2 Max sizes
[04:42:49] [PASSED] X0L2 Invalid pitch
[04:42:49] [PASSED] X0L2 Pitch greater than minimum required
[04:42:49] [PASSED] X0L2 Handle for inexistent plane
[04:42:49] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[04:42:49] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[04:42:49] [PASSED] X0L2 Valid modifier
[04:42:49] [PASSED] X0L2 Modifier for inexistent plane
[04:42:49] =========== [PASSED] drm_test_framebuffer_create ===========
[04:42:49] [PASSED] drm_test_framebuffer_free
[04:42:49] [PASSED] drm_test_framebuffer_init
[04:42:49] [PASSED] drm_test_framebuffer_init_bad_format
[04:42:49] [PASSED] drm_test_framebuffer_init_dev_mismatch
[04:42:49] [PASSED] drm_test_framebuffer_lookup
[04:42:49] [PASSED] drm_test_framebuffer_lookup_inexistent
[04:42:49] [PASSED] drm_test_framebuffer_modifiers_not_supported
[04:42:49] ================= [PASSED] drm_framebuffer =================
[04:42:49] ================ drm_gem_shmem (8 subtests) ================
[04:42:49] [PASSED] drm_gem_shmem_test_obj_create
[04:42:49] [PASSED] drm_gem_shmem_test_obj_create_private
[04:42:49] [PASSED] drm_gem_shmem_test_pin_pages
[04:42:49] [PASSED] drm_gem_shmem_test_vmap
[04:42:49] [PASSED] drm_gem_shmem_test_get_sg_table
[04:42:49] [PASSED] drm_gem_shmem_test_get_pages_sgt
[04:42:49] [PASSED] drm_gem_shmem_test_madvise
[04:42:49] [PASSED] drm_gem_shmem_test_purge
[04:42:49] ================== [PASSED] drm_gem_shmem ==================
[04:42:49] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[04:42:49] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[04:42:49] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[04:42:49] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[04:42:49] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[04:42:49] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[04:42:49] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[04:42:49] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[04:42:49] [PASSED] Automatic
[04:42:49] [PASSED] Full
[04:42:49] [PASSED] Limited 16:235
[04:42:49] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[04:42:49] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[04:42:49] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[04:42:49] [PASSED] drm_test_check_disable_connector
[04:42:49] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[04:42:49] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[04:42:49] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[04:42:49] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[04:42:49] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[04:42:49] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[04:42:49] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[04:42:49] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[04:42:49] [PASSED] drm_test_check_output_bpc_dvi
[04:42:49] [PASSED] drm_test_check_output_bpc_format_vic_1
[04:42:49] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[04:42:49] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[04:42:49] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[04:42:49] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[04:42:49] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[04:42:49] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[04:42:49] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[04:42:49] ============ drm_test_check_hdmi_color_format  =============
[04:42:49] [PASSED] AUTO -> RGB
[04:42:49] [PASSED] YCBCR422 -> YUV422
[04:42:49] [PASSED] YCBCR420 -> YUV420
[04:42:49] [PASSED] YCBCR444 -> YUV444
[04:42:49] [PASSED] RGB -> RGB
[04:42:49] ======== [PASSED] drm_test_check_hdmi_color_format =========
[04:42:49] ======== drm_test_check_hdmi_color_format_420_only  ========
[04:42:49] [PASSED] RGB should fail
[04:42:49] [PASSED] YUV444 should fail
[04:42:49] [PASSED] YUV422 should fail
[04:42:49] [PASSED] YUV420 should work
[04:42:49] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[04:42:49] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[04:42:49] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[04:42:49] [PASSED] drm_test_check_broadcast_rgb_value
[04:42:49] [PASSED] drm_test_check_bpc_8_value
[04:42:49] [PASSED] drm_test_check_bpc_10_value
[04:42:49] [PASSED] drm_test_check_bpc_12_value
[04:42:49] [PASSED] drm_test_check_format_value
[04:42:49] [PASSED] drm_test_check_tmds_char_value
[04:42:49] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[04:42:49] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[04:42:49] [PASSED] drm_test_check_mode_valid
[04:42:49] [PASSED] drm_test_check_mode_valid_reject
[04:42:49] [PASSED] drm_test_check_mode_valid_reject_rate
[04:42:49] [PASSED] drm_test_check_mode_valid_reject_max_clock
[04:42:49] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[04:42:49] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[04:42:49] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[04:42:49] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[04:42:49] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[04:42:49] [PASSED] drm_test_check_infoframes
[04:42:49] [PASSED] drm_test_check_reject_avi_infoframe
[04:42:49] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[04:42:49] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[04:42:49] [PASSED] drm_test_check_reject_audio_infoframe
[04:42:49] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[04:42:49] ================= drm_managed (2 subtests) =================
[04:42:49] [PASSED] drm_test_managed_release_action
[04:42:49] [PASSED] drm_test_managed_run_action
[04:42:49] =================== [PASSED] drm_managed ===================
[04:42:49] =================== drm_mm (6 subtests) ====================
[04:42:49] [PASSED] drm_test_mm_init
[04:42:49] [PASSED] drm_test_mm_debug
[04:42:49] [PASSED] drm_test_mm_align32
[04:42:49] [PASSED] drm_test_mm_align64
[04:42:49] [PASSED] drm_test_mm_lowest
[04:42:49] [PASSED] drm_test_mm_highest
[04:42:49] ===================== [PASSED] drm_mm ======================
[04:42:49] ============= drm_modes_analog_tv (5 subtests) =============
[04:42:49] [PASSED] drm_test_modes_analog_tv_mono_576i
[04:42:49] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[04:42:49] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[04:42:49] [PASSED] drm_test_modes_analog_tv_pal_576i
[04:42:49] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[04:42:49] =============== [PASSED] drm_modes_analog_tv ===============
[04:42:49] ============== drm_panic_helper (3 subtests) ===============
[04:42:49] ============= drm_test_panic_screen_user_map  ==============
[04:42:49] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[04:42:49] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[04:42:49] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[04:42:49] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[04:42:49] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[04:42:49] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[04:42:49] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[04:42:49] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[04:42:50] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[04:42:50] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[04:42:50] ========= [PASSED] drm_test_panic_screen_user_map ==========
[04:42:50] ============= drm_test_panic_screen_user_page  =============
[04:42:50] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[04:42:50] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[04:42:50] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[04:42:50] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[04:42:50] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[04:42:50] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[04:42:50] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[04:42:50] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[04:42:50] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[04:42:50] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[04:42:50] ========= [PASSED] drm_test_panic_screen_user_page =========
[04:42:50] ========== drm_test_panic_screen_user_set_pixel  ===========
[04:42:50] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[04:42:50] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[04:42:50] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[04:42:50] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[04:42:50] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[04:42:50] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[04:42:50] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[04:42:50] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[04:42:50] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[04:42:50] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[04:42:50] ====== [PASSED] drm_test_panic_screen_user_set_pixel =======
[04:42:50] ================ [PASSED] drm_panic_helper =================
[04:42:50] ============== drm_plane_helper (2 subtests) ===============
[04:42:50] =============== drm_test_check_plane_state  ================
[04:42:50] [PASSED] clipping_simple
[04:42:50] [PASSED] clipping_rotate_reflect
[04:42:50] [PASSED] positioning_simple
[04:42:50] [PASSED] upscaling
[04:42:50] [PASSED] downscaling
[04:42:50] [PASSED] rounding1
[04:42:50] [PASSED] rounding2
[04:42:50] [PASSED] rounding3
[04:42:50] [PASSED] rounding4
[04:42:50] =========== [PASSED] drm_test_check_plane_state ============
[04:42:50] =========== drm_test_check_invalid_plane_state  ============
[04:42:50] [PASSED] positioning_invalid
[04:42:50] [PASSED] upscaling_invalid
[04:42:50] [PASSED] downscaling_invalid
[04:42:50] ======= [PASSED] drm_test_check_invalid_plane_state ========
[04:42:50] ================ [PASSED] drm_plane_helper =================
[04:42:50] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[04:42:50] ====== drm_test_connector_helper_tv_get_modes_check  =======
[04:42:50] [PASSED] None
[04:42:50] [PASSED] PAL
[04:42:50] [PASSED] NTSC
[04:42:50] [PASSED] Both, NTSC Default
[04:42:50] [PASSED] Both, PAL Default
[04:42:50] [PASSED] Both, NTSC Default, with PAL on command-line
[04:42:50] [PASSED] Both, PAL Default, with NTSC on command-line
[04:42:50] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[04:42:50] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[04:42:50] ================== drm_rect (9 subtests) ===================
[04:42:50] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[04:42:50] [PASSED] drm_test_rect_clip_scaled_not_clipped
[04:42:50] [PASSED] drm_test_rect_clip_scaled_clipped
[04:42:50] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[04:42:50] ================= drm_test_rect_intersect  =================
[04:42:50] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[04:42:50] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[04:42:50] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[04:42:50] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[04:42:50] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[04:42:50] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[04:42:50] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[04:42:50] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[04:42:50] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[04:42:50] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[04:42:50] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[04:42:50] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[04:42:50] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[04:42:50] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[04:42:50] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[04:42:50] ============= [PASSED] drm_test_rect_intersect =============
[04:42:50] ================ drm_test_rect_calc_hscale  ================
[04:42:50] [PASSED] normal use
[04:42:50] [PASSED] out of max range
[04:42:50] [PASSED] out of min range
[04:42:50] [PASSED] zero dst
[04:42:50] [PASSED] negative src
[04:42:50] [PASSED] negative dst
[04:42:50] ============ [PASSED] drm_test_rect_calc_hscale ============
[04:42:50] ================ drm_test_rect_calc_vscale  ================
[04:42:50] [PASSED] normal use
[04:42:50] [PASSED] out of max range
[04:42:50] [PASSED] out of min range
[04:42:50] [PASSED] zero dst
[04:42:50] [PASSED] negative src
[04:42:50] [PASSED] negative dst
[04:42:50] ============ [PASSED] drm_test_rect_calc_vscale ============
[04:42:50] ================== drm_test_rect_rotate  ===================
[04:42:50] [PASSED] reflect-x
[04:42:50] [PASSED] reflect-y
[04:42:50] [PASSED] rotate-0
[04:42:50] [PASSED] rotate-90
[04:42:50] [PASSED] rotate-180
[04:42:50] [PASSED] rotate-270
[04:42:50] ============== [PASSED] drm_test_rect_rotate ===============
[04:42:50] ================ drm_test_rect_rotate_inv  =================
[04:42:50] [PASSED] reflect-x
[04:42:50] [PASSED] reflect-y
[04:42:50] [PASSED] rotate-0
[04:42:50] [PASSED] rotate-90
[04:42:50] [PASSED] rotate-180
[04:42:50] [PASSED] rotate-270
[04:42:50] ============ [PASSED] drm_test_rect_rotate_inv =============
[04:42:50] ==================== [PASSED] drm_rect =====================
[04:42:50] ============ drm_sysfb_modeset_test (1 subtest) ============
[04:42:50] ============ drm_test_sysfb_build_fourcc_list  =============
[04:42:50] [PASSED] no native formats
[04:42:50] [PASSED] XRGB8888 as native format
[04:42:50] [PASSED] remove duplicates
[04:42:50] [PASSED] convert alpha formats
[04:42:50] [PASSED] random formats
[04:42:50] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[04:42:50] ============= [PASSED] drm_sysfb_modeset_test ==============
[04:42:50] ================== drm_fixp (2 subtests) ===================
[04:42:50] [PASSED] drm_test_int2fixp
[04:42:50] [PASSED] drm_test_sm2fixp
[04:42:50] ==================== [PASSED] drm_fixp =====================
[04:42:50] ============================================================
[04:42:50] Testing complete. Ran 671 tests: passed: 671
[04:42:50] Elapsed time: 27.425s total, 1.811s configuring, 25.195s building, 0.413s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[04:42:50] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:42:52] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[04:43:02] Starting KUnit Kernel (1/1)...
[04:43:02] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[04:43:02] ============= refcount_interrupt (4 subtests) ==============
[04:43:02] [PASSED] test_single_irq_change
[04:43:02] [PASSED] test_nested_irq_change
[04:43:02] [PASSED] test_multiple_irq_change
[04:43:02] [PASSED] test_irq_save
[04:43:02] =============== [PASSED] refcount_interrupt ================
[04:43:02] ================= ttm_device (5 subtests) ==================
[04:43:02] [PASSED] ttm_device_init_basic
[04:43:02] [PASSED] ttm_device_init_multiple
[04:43:02] [PASSED] ttm_device_fini_basic
[04:43:02] [PASSED] ttm_device_init_no_vma_man
[04:43:02] ================== ttm_device_init_pools  ==================
[04:43:02] [PASSED] No DMA allocations, no DMA32 required
[04:43:02] [PASSED] DMA allocations, DMA32 required
[04:43:02] [PASSED] No DMA allocations, DMA32 required
[04:43:02] [PASSED] DMA allocations, no DMA32 required
[04:43:02] ============== [PASSED] ttm_device_init_pools ==============
[04:43:02] =================== [PASSED] ttm_device ====================
[04:43:02] ================== ttm_pool (8 subtests) ===================
[04:43:02] ================== ttm_pool_alloc_basic  ===================
[04:43:02] [PASSED] One page
[04:43:02] [PASSED] More than one page
[04:43:02] [PASSED] Above the allocation limit
[04:43:02] [PASSED] One page, with coherent DMA mappings enabled
[04:43:02] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[04:43:02] ============== [PASSED] ttm_pool_alloc_basic ===============
[04:43:02] ============== ttm_pool_alloc_basic_dma_addr  ==============
[04:43:02] [PASSED] One page
[04:43:02] [PASSED] More than one page
[04:43:02] [PASSED] Above the allocation limit
[04:43:02] [PASSED] One page, with coherent DMA mappings enabled
[04:43:02] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[04:43:02] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[04:43:02] [PASSED] ttm_pool_alloc_order_caching_match
[04:43:02] [PASSED] ttm_pool_alloc_caching_mismatch
[04:43:02] [PASSED] ttm_pool_alloc_order_mismatch
[04:43:02] [PASSED] ttm_pool_free_dma_alloc
[04:43:02] [PASSED] ttm_pool_free_no_dma_alloc
[04:43:02] [PASSED] ttm_pool_fini_basic
[04:43:02] ==================== [PASSED] ttm_pool =====================
[04:43:02] ================ ttm_resource (8 subtests) =================
[04:43:02] ================= ttm_resource_init_basic  =================
[04:43:02] [PASSED] Init resource in TTM_PL_SYSTEM
[04:43:02] [PASSED] Init resource in TTM_PL_VRAM
[04:43:02] [PASSED] Init resource in a private placement
[04:43:02] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[04:43:02] ============= [PASSED] ttm_resource_init_basic =============
[04:43:02] [PASSED] ttm_resource_init_pinned
[04:43:02] [PASSED] ttm_resource_fini_basic
[04:43:02] [PASSED] ttm_resource_manager_init_basic
[04:43:02] [PASSED] ttm_resource_manager_usage_basic
[04:43:02] [PASSED] ttm_resource_manager_set_used_basic
[04:43:02] [PASSED] ttm_sys_man_alloc_basic
[04:43:02] [PASSED] ttm_sys_man_free_basic
[04:43:02] ================== [PASSED] ttm_resource ===================
[04:43:02] =================== ttm_tt (15 subtests) ===================
[04:43:02] ==================== ttm_tt_init_basic  ====================
[04:43:02] [PASSED] Page-aligned size
[04:43:02] [PASSED] Extra pages requested
[04:43:02] ================ [PASSED] ttm_tt_init_basic ================
[04:43:02] [PASSED] ttm_tt_init_misaligned
[04:43:02] [PASSED] ttm_tt_fini_basic
[04:43:02] [PASSED] ttm_tt_fini_sg
[04:43:02] [PASSED] ttm_tt_fini_shmem
[04:43:02] [PASSED] ttm_tt_create_basic
[04:43:02] [PASSED] ttm_tt_create_invalid_bo_type
[04:43:02] [PASSED] ttm_tt_create_ttm_exists
[04:43:02] [PASSED] ttm_tt_create_failed
[04:43:02] [PASSED] ttm_tt_destroy_basic
[04:43:02] [PASSED] ttm_tt_populate_null_ttm
[04:43:02] [PASSED] ttm_tt_populate_populated_ttm
[04:43:02] [PASSED] ttm_tt_unpopulate_basic
[04:43:02] [PASSED] ttm_tt_unpopulate_empty_ttm
[04:43:02] [PASSED] ttm_tt_swapin_basic
[04:43:02] ===================== [PASSED] ttm_tt ======================
[04:43:02] =================== ttm_bo (14 subtests) ===================
[04:43:02] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[04:43:02] [PASSED] Cannot be interrupted and sleeps
[04:43:02] [PASSED] Cannot be interrupted, locks straight away
[04:43:02] [PASSED] Can be interrupted, sleeps
[04:43:02] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[04:43:02] [PASSED] ttm_bo_reserve_locked_no_sleep
[04:43:02] [PASSED] ttm_bo_reserve_no_wait_ticket
[04:43:02] [PASSED] ttm_bo_reserve_double_resv
[04:43:02] [PASSED] ttm_bo_reserve_interrupted
[04:43:02] [PASSED] ttm_bo_reserve_deadlock
[04:43:02] [PASSED] ttm_bo_unreserve_basic
[04:43:02] [PASSED] ttm_bo_unreserve_pinned
[04:43:02] [PASSED] ttm_bo_unreserve_bulk
[04:43:02] [PASSED] ttm_bo_fini_basic
[04:43:02] [PASSED] ttm_bo_fini_shared_resv
[04:43:02] [PASSED] ttm_bo_pin_basic
[04:43:02] [PASSED] ttm_bo_pin_unpin_resource
[04:43:02] [PASSED] ttm_bo_multiple_pin_one_unpin
[04:43:02] ===================== [PASSED] ttm_bo ======================
[04:43:02] ============== ttm_bo_validate (22 subtests) ===============
[04:43:02] ============== ttm_bo_init_reserved_sys_man  ===============
[04:43:02] [PASSED] Buffer object for userspace
[04:43:02] [PASSED] Kernel buffer object
[04:43:02] [PASSED] Shared buffer object
[04:43:02] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[04:43:02] ============== ttm_bo_init_reserved_mock_man  ==============
[04:43:02] [PASSED] Buffer object for userspace
[04:43:02] [PASSED] Kernel buffer object
[04:43:02] [PASSED] Shared buffer object
[04:43:02] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[04:43:02] [PASSED] ttm_bo_init_reserved_resv
[04:43:02] ================== ttm_bo_validate_basic  ==================
[04:43:02] [PASSED] Buffer object for userspace
[04:43:02] [PASSED] Kernel buffer object
[04:43:02] [PASSED] Shared buffer object
[04:43:02] ============== [PASSED] ttm_bo_validate_basic ==============
[04:43:02] [PASSED] ttm_bo_validate_invalid_placement
[04:43:02] ============= ttm_bo_validate_same_placement  ==============
[04:43:02] [PASSED] System manager
[04:43:02] [PASSED] VRAM manager
[04:43:02] ========= [PASSED] ttm_bo_validate_same_placement ==========
[04:43:02] [PASSED] ttm_bo_validate_failed_alloc
[04:43:02] [PASSED] ttm_bo_validate_pinned
[04:43:02] [PASSED] ttm_bo_validate_busy_placement
[04:43:02] ================ ttm_bo_validate_multihop  =================
[04:43:02] [PASSED] Buffer object for userspace
[04:43:02] [PASSED] Kernel buffer object
[04:43:02] [PASSED] Shared buffer object
[04:43:02] ============ [PASSED] ttm_bo_validate_multihop =============
[04:43:02] ========== ttm_bo_validate_no_placement_signaled  ==========
[04:43:02] [PASSED] Buffer object in system domain, no page vector
[04:43:02] [PASSED] Buffer object in system domain with an existing page vector
[04:43:02] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[04:43:02] ======== ttm_bo_validate_no_placement_not_signaled  ========
[04:43:02] [PASSED] Buffer object for userspace
[04:43:02] [PASSED] Kernel buffer object
[04:43:02] [PASSED] Shared buffer object
[04:43:02] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[04:43:02] [PASSED] ttm_bo_validate_move_fence_signaled
[04:43:02] ========= ttm_bo_validate_move_fence_not_signaled  =========
[04:43:02] [PASSED] Waits for GPU
[04:43:02] [PASSED] Tries to lock straight away
[04:43:02] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[04:43:02] [PASSED] ttm_bo_validate_swapout
[04:43:02] [PASSED] ttm_bo_validate_happy_evict
[04:43:02] [PASSED] ttm_bo_validate_all_pinned_evict
[04:43:02] [PASSED] ttm_bo_validate_allowed_only_evict
[04:43:02] [PASSED] ttm_bo_validate_deleted_evict
[04:43:02] [PASSED] ttm_bo_validate_busy_domain_evict
[04:43:02] [PASSED] ttm_bo_validate_evict_gutting
[04:43:02] [PASSED] ttm_bo_validate_recrusive_evict
[04:43:02] ================= [PASSED] ttm_bo_validate =================
[04:43:02] ============================================================
[04:43:02] Testing complete. Ran 106 tests: passed: 106
[04:43:02] Elapsed time: 12.059s total, 1.773s configuring, 10.071s building, 0.174s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/dma-buf/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[04:43:02] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:43:04] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[04:43:13] Starting KUnit Kernel (1/1)...
[04:43:13] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[04:43:13] ============= refcount_interrupt (4 subtests) ==============
[04:43:13] [PASSED] test_single_irq_change
[04:43:13] [PASSED] test_nested_irq_change
[04:43:13] [PASSED] test_multiple_irq_change
[04:43:13] [PASSED] test_irq_save
[04:43:13] =============== [PASSED] refcount_interrupt ================
[04:43:13] =============== dma-buf-fence (12 subtests) ================
[04:43:13] [PASSED] test_sanitycheck
[04:43:13] [PASSED] test_signaling
[04:43:13] [PASSED] test_add_callback
[04:43:13] [PASSED] test_late_add_callback
[04:43:13] [PASSED] test_rm_callback
[04:43:13] [PASSED] test_late_rm_callback
[04:43:13] [PASSED] test_status
[04:43:13] [PASSED] test_error
[04:43:13] [PASSED] test_wait
[04:43:13] [PASSED] test_wait_timeout
[04:43:13] [PASSED] test_stub
[04:43:13] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[04:43:13] ================== [PASSED] dma-buf-fence ==================
[04:43:13] ============ dma-buf-fence-chain (11 subtests) =============
[04:43:13] [PASSED] test_sanitycheck
[04:43:13] [PASSED] test_find_seqno
[04:43:13] [PASSED] test_find_signaled
[04:43:13] [PASSED] test_find_out_of_order
[04:43:18] [PASSED] test_find_gap
[04:43:18] [PASSED] test_find_race
[04:43:18] [PASSED] test_signal_forward
[04:43:18] [PASSED] test_signal_backward
[04:43:18] [PASSED] test_wait_forward
[04:43:18] [PASSED] test_wait_backward
[04:43:18] [PASSED] test_wait_random
[04:43:18] =============== [PASSED] dma-buf-fence-chain ===============
[04:43:18] ============ dma-buf-fence-unwrap (10 subtests) ============
[04:43:18] [PASSED] test_sanitycheck
[04:43:18] [PASSED] test_unwrap_array
[04:43:18] [PASSED] test_unwrap_chain
[04:43:18] [PASSED] test_unwrap_chain_array
[04:43:18] [PASSED] test_unwrap_merge
[04:43:18] [PASSED] test_unwrap_merge_duplicate
[04:43:18] [PASSED] test_unwrap_merge_seqno
[04:43:18] [PASSED] test_unwrap_merge_order
[04:43:18] [PASSED] test_unwrap_merge_complex
[04:43:18] [PASSED] test_unwrap_merge_complex_seqno
[04:43:18] ============== [PASSED] dma-buf-fence-unwrap ===============
[04:43:18] ================ dma-buf-resv (5 subtests) =================
[04:43:18] [PASSED] test_sanitycheck
[04:43:18] ===================== test_signaling  ======================
[04:43:18] [PASSED] kernel
[04:43:18] [PASSED] write
[04:43:18] [PASSED] read
[04:43:18] [PASSED] bookkeep
[04:43:18] ================= [PASSED] test_signaling ==================
[04:43:18] ====================== test_for_each  ======================
[04:43:18] [PASSED] kernel
[04:43:18] [PASSED] write
[04:43:18] [PASSED] read
[04:43:18] [PASSED] bookkeep
[04:43:18] ================== [PASSED] test_for_each ==================
[04:43:18] ================= test_for_each_unlocked  ==================
[04:43:18] [PASSED] kernel
[04:43:18] [PASSED] write
[04:43:18] [PASSED] read
[04:43:18] [PASSED] bookkeep
[04:43:18] ============= [PASSED] test_for_each_unlocked ==============
[04:43:18] ===================== test_get_fences  =====================
[04:43:18] [PASSED] kernel
[04:43:18] [PASSED] write
[04:43:18] [PASSED] read
[04:43:18] [PASSED] bookkeep
[04:43:18] ================= [PASSED] test_get_fences =================
[04:43:18] ================== [PASSED] dma-buf-resv ===================
[04:43:18] ============================================================
[04:43:18] Testing complete. Ran 54 tests: passed: 53, skipped: 1
[04:43:18] Elapsed time: 15.987s total, 1.818s configuring, 8.797s building, 5.347s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


