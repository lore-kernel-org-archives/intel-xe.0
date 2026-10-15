Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05216CC6B33
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 10:44:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FEB10EBC4;
	Thu, 15 Oct 2026 10:44:40 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335B910EBC4;
 Thu, 15 Oct 2026 10:44:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/madvise=3A_use_already_?=
 =?utf-8?q?clamped_pat=5Findex?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Oct 2026 10:44:40 -0000
Message-ID: <179206108019.28301.16773590672825344892@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261015103415.442931-2-matthew.auld@intel.com>
In-Reply-To: <20261015103415.442931-2-matthew.auld@intel.com>
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

Series: drm/xe/madvise: use already clamped pat_index
URL   : https://patchwork.freedesktop.org/series/176204/
State : success

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[10:42:32] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:42:36] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[10:42:56] Starting KUnit Kernel (1/1)...
[10:42:56] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:42:56] ================= gpu_buddy (14 subtests) ==================
[10:42:56] [PASSED] gpu_test_buddy_alloc_limit
[10:42:56] [PASSED] gpu_test_buddy_alloc_optimistic
[10:42:56] [PASSED] gpu_test_buddy_alloc_pessimistic
[10:42:56] [PASSED] gpu_test_buddy_alloc_pathological
[10:42:56] [PASSED] gpu_test_buddy_alloc_contiguous
[10:42:56] [PASSED] gpu_test_buddy_alloc_clear
[10:42:56] [PASSED] gpu_test_buddy_alloc_range
[10:42:57] [PASSED] gpu_test_buddy_alloc_range_bias
[10:42:58] [PASSED] gpu_test_buddy_fragmentation_performance
[10:42:58] [PASSED] gpu_test_buddy_dirty_tracker_performance
[10:42:58] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[10:42:58] [PASSED] gpu_test_buddy_offset_aligned_allocation
[10:42:58] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[10:42:58] [PASSED] gpu_test_buddy_addr_to_block
[10:42:58] ==================== [PASSED] gpu_buddy ====================
[10:42:58] ============================================================
[10:42:58] Testing complete. Ran 14 tests: passed: 14
[10:42:58] Elapsed time: 26.586s total, 4.489s configuring, 20.179s building, 1.845s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[10:42:58] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:43:00] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[10:43:38] Starting KUnit Kernel (1/1)...
[10:43:38] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:43:39] ================== guc_buf (11 subtests) ===================
[10:43:39] [PASSED] test_smallest
[10:43:39] [PASSED] test_largest
[10:43:39] [PASSED] test_granular
[10:43:39] [PASSED] test_unique
[10:43:39] [PASSED] test_overlap
[10:43:39] [PASSED] test_reusable
[10:43:39] [PASSED] test_too_big
[10:43:39] [PASSED] test_flush
[10:43:39] [PASSED] test_lookup
[10:43:39] [PASSED] test_data
[10:43:39] [PASSED] test_class
[10:43:39] ===================== [PASSED] guc_buf =====================
[10:43:39] =================== guc_dbm (7 subtests) ===================
[10:43:39] [PASSED] test_empty
[10:43:39] [PASSED] test_default
[10:43:39] ======================== test_size  ========================
[10:43:39] [PASSED] 4
[10:43:39] [PASSED] 8
[10:43:39] [PASSED] 32
[10:43:39] [PASSED] 256
[10:43:39] ==================== [PASSED] test_size ====================
[10:43:39] ======================= test_reuse  ========================
[10:43:39] [PASSED] 4
[10:43:39] [PASSED] 8
[10:43:39] [PASSED] 32
[10:43:39] [PASSED] 256
[10:43:39] =================== [PASSED] test_reuse ====================
[10:43:39] =================== test_range_overlap  ====================
[10:43:39] [PASSED] 4
[10:43:39] [PASSED] 8
[10:43:39] [PASSED] 32
[10:43:39] [PASSED] 256
[10:43:39] =============== [PASSED] test_range_overlap ================
[10:43:39] =================== test_range_compact  ====================
[10:43:39] [PASSED] 4
[10:43:39] [PASSED] 8
[10:43:39] [PASSED] 32
[10:43:39] [PASSED] 256
[10:43:39] =============== [PASSED] test_range_compact ================
[10:43:39] ==================== test_range_spare  =====================
[10:43:39] [PASSED] 4
[10:43:39] [PASSED] 8
[10:43:39] [PASSED] 32
[10:43:39] [PASSED] 256
[10:43:39] ================ [PASSED] test_range_spare =================
[10:43:39] ===================== [PASSED] guc_dbm =====================
[10:43:39] =================== guc_idm (6 subtests) ===================
[10:43:39] [PASSED] bad_init
[10:43:39] [PASSED] no_init
[10:43:39] [PASSED] init_fini
[10:43:39] [PASSED] check_used
[10:43:39] [PASSED] check_quota
[10:43:39] [PASSED] check_all
[10:43:39] ===================== [PASSED] guc_idm =====================
[10:43:39] ============== guc_klv_helpers (13 subtests) ===============
[10:43:39] [PASSED] test_count
[10:43:39] [PASSED] test_encode_u32
[10:43:39] [PASSED] test_encode_u64
[10:43:39] [PASSED] test_encode_string
[10:43:39] [PASSED] test_encode_object_raw
[10:43:39] [PASSED] test_encode_object_klv
[10:43:39] [PASSED] test_encode_object_nested
[10:43:39] [PASSED] test_encode_object_basic
[10:43:39] ===================== test_decode_u16  =====================
[10:43:39] [PASSED] empty
[10:43:39] [PASSED] valid
[10:43:39] [PASSED] max
[10:43:39] [PASSED] big
[10:43:39] [PASSED] long
[10:43:39] ================= [PASSED] test_decode_u16 =================
[10:43:39] ===================== test_decode_u32  =====================
[10:43:39] [PASSED] empty
[10:43:39] [PASSED] valid
[10:43:39] [PASSED] max
[10:43:39] [PASSED] long
[10:43:39] ================= [PASSED] test_decode_u32 =================
[10:43:39] ===================== test_decode_u64  =====================
[10:43:39] [PASSED] empty
[10:43:39] [PASSED] short
[10:43:39] [PASSED] valid
[10:43:39] [PASSED] max
[10:43:39] [PASSED] long
[10:43:39] ================= [PASSED] test_decode_u64 =================
[10:43:39] ===================== test_decode_str  =====================
[10:43:39] [PASSED] empty
[10:43:39] [PASSED] one
[10:43:39] [PASSED] one_trash
[10:43:39] [PASSED] two
[10:43:39] [PASSED] two_trash
[10:43:39] [PASSED] three
[10:43:39] [PASSED] dword
[10:43:39] [PASSED] four
[10:43:39] [PASSED] five
[10:43:39] [PASSED] six
[10:43:39] [PASSED] seven
[10:43:39] [PASSED] qword
[10:43:39] ================= [PASSED] test_decode_str =================
[10:43:39] [PASSED] test_print
[10:43:39] ================= [PASSED] guc_klv_helpers =================
[10:43:39] =================== xe_log (4 subtests) ====================
[10:43:39] [PASSED] demo_cper
[10:43:39] [PASSED] demo_dmesg
[10:43:39] ======================= test_dmesg  ========================
[10:43:39] [PASSED] test_fatal
[10:43:39] [PASSED] test_fatal_tile
[10:43:39] [PASSED] test_fatal_gt
[10:43:39] [PASSED] test_fatal_comp
[10:43:39] [PASSED] test_fatal_comp_tile
[10:43:39] [PASSED] test_fatal_comp_gt
[10:43:39] [PASSED] test_fatal_all
[10:43:39] [PASSED] test_recoverable
[10:43:39] [PASSED] test_recoverable_tile
[10:43:39] [PASSED] test_recoverable_gt
[10:43:39] [PASSED] test_recoverable_comp
[10:43:39] [PASSED] test_recoverable_comp_tile
[10:43:39] [PASSED] test_recoverable_comp_gt
[10:43:39] [PASSED] test_recoverable_all
[10:43:39] [PASSED] test_info
[10:43:39] [PASSED] test_info_tile
[10:43:39] [PASSED] test_info_gt
[10:43:39] [PASSED] test_info_err
[10:43:39] [PASSED] test_info_comp
[10:43:39] [PASSED] test_info_comp_tile
[10:43:39] [PASSED] test_info_comp_gt
[10:43:39] [PASSED] test_info_all
[10:43:39] [PASSED] test_hw_fatal
[10:43:39] [PASSED] test_hw_recoverable
[10:43:39] [PASSED] test_hw_corrected
[10:43:39] [PASSED] test_hw_informational
[10:43:39] =================== [PASSED] test_dmesg ====================
[10:43:39] ====================== test_invalid  =======================
[10:43:39] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[10:43:39] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[10:43:39] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[10:43:39] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[10:43:39] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[10:43:39] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[10:43:39] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[10:43:39] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[10:43:39] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[10:43:39] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[10:43:39] ================== [SKIPPED] test_invalid ==================
[10:43:39] ===================== [PASSED] xe_log ======================
[10:43:39] ================== no_relay (3 subtests) ===================
[10:43:39] [PASSED] xe_drops_guc2pf_if_not_ready
[10:43:39] [PASSED] xe_drops_guc2vf_if_not_ready
[10:43:39] [PASSED] xe_rejects_send_if_not_ready
[10:43:39] ==================== [PASSED] no_relay =====================
[10:43:39] ================== pf_relay (14 subtests) ==================
[10:43:39] [PASSED] pf_rejects_guc2pf_too_short
[10:43:39] [PASSED] pf_rejects_guc2pf_too_long
[10:43:39] [PASSED] pf_rejects_guc2pf_no_payload
[10:43:39] [PASSED] pf_fails_no_payload
[10:43:39] [PASSED] pf_fails_bad_origin
[10:43:39] [PASSED] pf_fails_bad_type
[10:43:39] [PASSED] pf_txn_reports_error
[10:43:39] [PASSED] pf_txn_sends_pf2guc
[10:43:39] [PASSED] pf_sends_pf2guc
[10:43:39] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[10:43:39] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[10:43:39] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[10:43:39] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[10:43:39] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[10:43:39] ==================== [PASSED] pf_relay =====================
[10:43:39] ================== vf_relay (3 subtests) ===================
[10:43:39] [PASSED] vf_rejects_guc2vf_too_short
[10:43:39] [PASSED] vf_rejects_guc2vf_too_long
[10:43:39] [PASSED] vf_rejects_guc2vf_no_payload
[10:43:39] ==================== [PASSED] vf_relay =====================
[10:43:39] ================ pf_gt_config (9 subtests) =================
[10:43:39] [PASSED] fair_contexts_1vf
[10:43:39] [PASSED] fair_doorbells_1vf
[10:43:39] [PASSED] fair_ggtt_1vf
[10:43:39] ====================== fair_vram_1vf  ======================
[10:43:39] [PASSED] 3.50 GiB
[10:43:39] [PASSED] 11.5 GiB
[10:43:39] [PASSED] 15.5 GiB
[10:43:39] [PASSED] 31.5 GiB
[10:43:39] [PASSED] 63.5 GiB
[10:43:39] [PASSED] 1.91 GiB
[10:43:39] ================== [PASSED] fair_vram_1vf ==================
[10:43:39] ================ fair_vram_1vf_admin_only  =================
[10:43:39] [PASSED] 3.50 GiB
[10:43:39] [PASSED] 11.5 GiB
[10:43:39] [PASSED] 15.5 GiB
[10:43:39] [PASSED] 31.5 GiB
[10:43:39] [PASSED] 63.5 GiB
[10:43:39] [PASSED] 1.91 GiB
[10:43:39] ============ [PASSED] fair_vram_1vf_admin_only =============
[10:43:39] ====================== fair_contexts  ======================
[10:43:39] [PASSED] 1 VF
[10:43:39] [PASSED] 2 VFs
[10:43:39] [PASSED] 3 VFs
[10:43:39] [PASSED] 4 VFs
[10:43:39] [PASSED] 5 VFs
[10:43:39] [PASSED] 6 VFs
[10:43:39] [PASSED] 7 VFs
[10:43:39] [PASSED] 8 VFs
[10:43:39] [PASSED] 9 VFs
[10:43:39] [PASSED] 10 VFs
[10:43:39] [PASSED] 11 VFs
[10:43:39] [PASSED] 12 VFs
[10:43:39] [PASSED] 13 VFs
[10:43:39] [PASSED] 14 VFs
[10:43:39] [PASSED] 15 VFs
[10:43:39] [PASSED] 16 VFs
[10:43:39] [PASSED] 17 VFs
[10:43:39] [PASSED] 18 VFs
[10:43:39] [PASSED] 19 VFs
[10:43:39] [PASSED] 20 VFs
[10:43:39] [PASSED] 21 VFs
[10:43:39] [PASSED] 22 VFs
[10:43:39] [PASSED] 23 VFs
[10:43:39] [PASSED] 24 VFs
[10:43:39] [PASSED] 25 VFs
[10:43:39] [PASSED] 26 VFs
[10:43:39] [PASSED] 27 VFs
[10:43:39] [PASSED] 28 VFs
[10:43:39] [PASSED] 29 VFs
[10:43:39] [PASSED] 30 VFs
[10:43:39] [PASSED] 31 VFs
[10:43:39] [PASSED] 32 VFs
[10:43:39] [PASSED] 33 VFs
[10:43:39] [PASSED] 34 VFs
[10:43:39] [PASSED] 35 VFs
[10:43:39] [PASSED] 36 VFs
[10:43:39] [PASSED] 37 VFs
[10:43:39] [PASSED] 38 VFs
[10:43:39] [PASSED] 39 VFs
[10:43:39] [PASSED] 40 VFs
[10:43:39] [PASSED] 41 VFs
[10:43:39] [PASSED] 42 VFs
[10:43:39] [PASSED] 43 VFs
[10:43:39] [PASSED] 44 VFs
[10:43:39] [PASSED] 45 VFs
[10:43:39] [PASSED] 46 VFs
[10:43:39] [PASSED] 47 VFs
[10:43:39] [PASSED] 48 VFs
[10:43:39] [PASSED] 49 VFs
[10:43:39] [PASSED] 50 VFs
[10:43:39] [PASSED] 51 VFs
[10:43:39] [PASSED] 52 VFs
[10:43:39] [PASSED] 53 VFs
[10:43:39] [PASSED] 54 VFs
[10:43:39] [PASSED] 55 VFs
[10:43:39] [PASSED] 56 VFs
[10:43:39] [PASSED] 57 VFs
[10:43:39] [PASSED] 58 VFs
[10:43:39] [PASSED] 59 VFs
[10:43:39] [PASSED] 60 VFs
[10:43:39] [PASSED] 61 VFs
[10:43:39] [PASSED] 62 VFs
[10:43:39] [PASSED] 63 VFs
[10:43:39] ================== [PASSED] fair_contexts ==================
[10:43:39] ===================== fair_doorbells  ======================
[10:43:39] [PASSED] 1 VF
[10:43:39] [PASSED] 2 VFs
[10:43:39] [PASSED] 3 VFs
[10:43:39] [PASSED] 4 VFs
[10:43:39] [PASSED] 5 VFs
[10:43:39] [PASSED] 6 VFs
[10:43:39] [PASSED] 7 VFs
[10:43:39] [PASSED] 8 VFs
[10:43:39] [PASSED] 9 VFs
[10:43:39] [PASSED] 10 VFs
[10:43:39] [PASSED] 11 VFs
[10:43:39] [PASSED] 12 VFs
[10:43:39] [PASSED] 13 VFs
[10:43:39] [PASSED] 14 VFs
[10:43:39] [PASSED] 15 VFs
[10:43:39] [PASSED] 16 VFs
[10:43:39] [PASSED] 17 VFs
[10:43:39] [PASSED] 18 VFs
[10:43:39] [PASSED] 19 VFs
[10:43:39] [PASSED] 20 VFs
[10:43:39] [PASSED] 21 VFs
[10:43:39] [PASSED] 22 VFs
[10:43:39] [PASSED] 23 VFs
[10:43:39] [PASSED] 24 VFs
[10:43:39] [PASSED] 25 VFs
[10:43:39] [PASSED] 26 VFs
[10:43:39] [PASSED] 27 VFs
[10:43:39] [PASSED] 28 VFs
[10:43:39] [PASSED] 29 VFs
[10:43:39] [PASSED] 30 VFs
[10:43:39] [PASSED] 31 VFs
[10:43:39] [PASSED] 32 VFs
[10:43:39] [PASSED] 33 VFs
[10:43:39] [PASSED] 34 VFs
[10:43:39] [PASSED] 35 VFs
[10:43:39] [PASSED] 36 VFs
[10:43:39] [PASSED] 37 VFs
[10:43:39] [PASSED] 38 VFs
[10:43:39] [PASSED] 39 VFs
[10:43:39] [PASSED] 40 VFs
[10:43:39] [PASSED] 41 VFs
[10:43:39] [PASSED] 42 VFs
[10:43:39] [PASSED] 43 VFs
[10:43:39] [PASSED] 44 VFs
[10:43:39] [PASSED] 45 VFs
[10:43:39] [PASSED] 46 VFs
[10:43:39] [PASSED] 47 VFs
[10:43:39] [PASSED] 48 VFs
[10:43:39] [PASSED] 49 VFs
[10:43:39] [PASSED] 50 VFs
[10:43:39] [PASSED] 51 VFs
[10:43:39] [PASSED] 52 VFs
[10:43:39] [PASSED] 53 VFs
[10:43:39] [PASSED] 54 VFs
[10:43:39] [PASSED] 55 VFs
[10:43:39] [PASSED] 56 VFs
[10:43:39] [PASSED] 57 VFs
[10:43:39] [PASSED] 58 VFs
[10:43:39] [PASSED] 59 VFs
[10:43:39] [PASSED] 60 VFs
[10:43:39] [PASSED] 61 VFs
[10:43:39] [PASSED] 62 VFs
[10:43:39] [PASSED] 63 VFs
[10:43:39] ================= [PASSED] fair_doorbells ==================
[10:43:39] ======================== fair_ggtt  ========================
[10:43:39] [PASSED] 1 VF
[10:43:39] [PASSED] 2 VFs
[10:43:39] [PASSED] 3 VFs
[10:43:39] [PASSED] 4 VFs
[10:43:39] [PASSED] 5 VFs
[10:43:39] [PASSED] 6 VFs
[10:43:39] [PASSED] 7 VFs
[10:43:39] [PASSED] 8 VFs
[10:43:39] [PASSED] 9 VFs
[10:43:39] [PASSED] 10 VFs
[10:43:39] [PASSED] 11 VFs
[10:43:39] [PASSED] 12 VFs
[10:43:39] [PASSED] 13 VFs
[10:43:39] [PASSED] 14 VFs
[10:43:39] [PASSED] 15 VFs
[10:43:39] [PASSED] 16 VFs
[10:43:39] [PASSED] 17 VFs
[10:43:39] [PASSED] 18 VFs
[10:43:39] [PASSED] 19 VFs
[10:43:39] [PASSED] 20 VFs
[10:43:39] [PASSED] 21 VFs
[10:43:39] [PASSED] 22 VFs
[10:43:39] [PASSED] 23 VFs
[10:43:39] [PASSED] 24 VFs
[10:43:39] [PASSED] 25 VFs
[10:43:39] [PASSED] 26 VFs
[10:43:39] [PASSED] 27 VFs
[10:43:39] [PASSED] 28 VFs
[10:43:39] [PASSED] 29 VFs
[10:43:39] [PASSED] 30 VFs
[10:43:39] [PASSED] 31 VFs
[10:43:39] [PASSED] 32 VFs
[10:43:39] [PASSED] 33 VFs
[10:43:39] [PASSED] 34 VFs
[10:43:39] [PASSED] 35 VFs
[10:43:39] [PASSED] 36 VFs
[10:43:39] [PASSED] 37 VFs
[10:43:39] [PASSED] 38 VFs
[10:43:39] [PASSED] 39 VFs
[10:43:39] [PASSED] 40 VFs
[10:43:39] [PASSED] 41 VFs
[10:43:39] [PASSED] 42 VFs
[10:43:39] [PASSED] 43 VFs
[10:43:39] [PASSED] 44 VFs
[10:43:39] [PASSED] 45 VFs
[10:43:39] [PASSED] 46 VFs
[10:43:39] [PASSED] 47 VFs
[10:43:39] [PASSED] 48 VFs
[10:43:39] [PASSED] 49 VFs
[10:43:39] [PASSED] 50 VFs
[10:43:39] [PASSED] 51 VFs
[10:43:39] [PASSED] 52 VFs
[10:43:39] [PASSED] 53 VFs
[10:43:39] [PASSED] 54 VFs
[10:43:39] [PASSED] 55 VFs
[10:43:39] [PASSED] 56 VFs
[10:43:39] [PASSED] 57 VFs
[10:43:39] [PASSED] 58 VFs
[10:43:39] [PASSED] 59 VFs
[10:43:39] [PASSED] 60 VFs
[10:43:39] [PASSED] 61 VFs
[10:43:39] [PASSED] 62 VFs
[10:43:39] [PASSED] 63 VFs
[10:43:39] ==================== [PASSED] fair_ggtt ====================
[10:43:39] ======================== fair_vram  ========================
[10:43:39] [PASSED] 1 VF
[10:43:39] [PASSED] 2 VFs
[10:43:39] [PASSED] 3 VFs
[10:43:39] [PASSED] 4 VFs
[10:43:39] [PASSED] 5 VFs
[10:43:39] [PASSED] 6 VFs
[10:43:39] [PASSED] 7 VFs
[10:43:39] [PASSED] 8 VFs
[10:43:39] [PASSED] 9 VFs
[10:43:39] [PASSED] 10 VFs
[10:43:39] [PASSED] 11 VFs
[10:43:39] [PASSED] 12 VFs
[10:43:39] [PASSED] 13 VFs
[10:43:39] [PASSED] 14 VFs
[10:43:39] [PASSED] 15 VFs
[10:43:39] [PASSED] 16 VFs
[10:43:39] [PASSED] 17 VFs
[10:43:39] [PASSED] 18 VFs
[10:43:39] [PASSED] 19 VFs
[10:43:39] [PASSED] 20 VFs
[10:43:39] [PASSED] 21 VFs
[10:43:39] [PASSED] 22 VFs
[10:43:39] [PASSED] 23 VFs
[10:43:39] [PASSED] 24 VFs
[10:43:39] [PASSED] 25 VFs
[10:43:39] [PASSED] 26 VFs
[10:43:39] [PASSED] 27 VFs
[10:43:39] [PASSED] 28 VFs
[10:43:39] [PASSED] 29 VFs
[10:43:39] [PASSED] 30 VFs
[10:43:39] [PASSED] 31 VFs
[10:43:39] [PASSED] 32 VFs
[10:43:39] [PASSED] 33 VFs
[10:43:39] [PASSED] 34 VFs
[10:43:39] [PASSED] 35 VFs
[10:43:39] [PASSED] 36 VFs
[10:43:39] [PASSED] 37 VFs
[10:43:39] [PASSED] 38 VFs
[10:43:39] [PASSED] 39 VFs
[10:43:39] [PASSED] 40 VFs
[10:43:39] [PASSED] 41 VFs
[10:43:39] [PASSED] 42 VFs
[10:43:39] [PASSED] 43 VFs
[10:43:39] [PASSED] 44 VFs
[10:43:39] [PASSED] 45 VFs
[10:43:39] [PASSED] 46 VFs
[10:43:39] [PASSED] 47 VFs
[10:43:39] [PASSED] 48 VFs
[10:43:39] [PASSED] 49 VFs
[10:43:39] [PASSED] 50 VFs
[10:43:39] [PASSED] 51 VFs
[10:43:39] [PASSED] 52 VFs
[10:43:39] [PASSED] 53 VFs
[10:43:39] [PASSED] 54 VFs
[10:43:39] [PASSED] 55 VFs
[10:43:39] [PASSED] 56 VFs
[10:43:39] [PASSED] 57 VFs
[10:43:39] [PASSED] 58 VFs
[10:43:39] [PASSED] 59 VFs
[10:43:39] [PASSED] 60 VFs
[10:43:39] [PASSED] 61 VFs
[10:43:39] [PASSED] 62 VFs
[10:43:39] [PASSED] 63 VFs
[10:43:39] ==================== [PASSED] fair_vram ====================
[10:43:39] ================== [PASSED] pf_gt_config ===================
[10:43:39] ===================== lmtt (1 subtest) =====================
[10:43:39] ======================== test_ops  =========================
[10:43:39] [PASSED] 2-level
[10:43:39] [PASSED] multi-level
[10:43:39] ==================== [PASSED] test_ops =====================
[10:43:39] ====================== [PASSED] lmtt =======================
[10:43:39] ================= sriov_packet (1 subtest) =================
[10:43:39] [PASSED] test_descriptor_init
[10:43:39] ================== [PASSED] sriov_packet ===================
[10:43:39] ================= pf_service (11 subtests) =================
[10:43:39] [PASSED] pf_negotiate_any
[10:43:39] [PASSED] pf_negotiate_base_match
[10:43:39] [PASSED] pf_negotiate_base_newer
[10:43:39] [PASSED] pf_negotiate_base_next
[10:43:39] [SKIPPED] pf_negotiate_base_older (no older minor)
[10:43:39] [PASSED] pf_negotiate_base_prev
[10:43:39] [PASSED] pf_negotiate_latest_match
[10:43:39] [PASSED] pf_negotiate_latest_newer
[10:43:39] [PASSED] pf_negotiate_latest_next
[10:43:39] [SKIPPED] pf_negotiate_latest_older (no older minor)
[10:43:39] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[10:43:39] =================== [PASSED] pf_service ====================
[10:43:39] ================= xe_guc_g2g (2 subtests) ==================
[10:43:39] ============== xe_live_guc_g2g_kunit_default  ==============
[10:43:39] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[10:43:39] ============== xe_live_guc_g2g_kunit_allmem  ===============
[10:43:39] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[10:43:39] =================== [SKIPPED] xe_guc_g2g ===================
[10:43:39] =================== xe_mocs (2 subtests) ===================
[10:43:39] ================ xe_live_mocs_kernel_kunit  ================
[10:43:39] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[10:43:39] ================ xe_live_mocs_reset_kunit  =================
[10:43:39] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[10:43:39] ==================== [SKIPPED] xe_mocs =====================
[10:43:39] ================= xe_migrate (2 subtests) ==================
[10:43:39] ================= xe_migrate_sanity_kunit  =================
[10:43:39] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[10:43:39] ================== xe_validate_ccs_kunit  ==================
[10:43:39] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[10:43:39] =================== [SKIPPED] xe_migrate ===================
[10:43:39] ================== xe_dma_buf (1 subtest) ==================
[10:43:39] ==================== xe_dma_buf_kunit  =====================
[10:43:39] ================ [SKIPPED] xe_dma_buf_kunit ================
[10:43:39] =================== [SKIPPED] xe_dma_buf ===================
[10:43:39] ================= xe_bo_shrink (1 subtest) =================
[10:43:39] =================== xe_bo_shrink_kunit  ====================
[10:43:39] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[10:43:39] ================== [SKIPPED] xe_bo_shrink ==================
[10:43:39] ==================== xe_bo (2 subtests) ====================
[10:43:39] ================== xe_ccs_migrate_kunit  ===================
[10:43:39] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[10:43:39] ==================== xe_bo_evict_kunit  ====================
[10:43:39] =============== [SKIPPED] xe_bo_evict_kunit ================
[10:43:39] ===================== [SKIPPED] xe_bo ======================
[10:43:39] =================== xe_any (9 subtests) ====================
[10:43:39] [PASSED] test_to_xe
[10:43:39] [PASSED] test_to_dev
[10:43:39] [PASSED] test_to_pdev
[10:43:39] [PASSED] test_to_drm
[10:43:39] [PASSED] test_if_pdev
[10:43:39] [PASSED] test_if_xe
[10:43:39] [PASSED] test_if_tile
[10:43:39] [PASSED] test_if_gt
[10:43:39] [PASSED] test_to_id
[10:43:39] ===================== [PASSED] xe_any ======================
[10:43:39] ==================== args (13 subtests) ====================
[10:43:39] [PASSED] count_args_test
[10:43:39] [PASSED] call_args_example
[10:43:39] [PASSED] call_args_test
[10:43:39] [PASSED] drop_first_arg_example
[10:43:39] [PASSED] drop_first_arg_test
[10:43:39] [PASSED] first_arg_example
[10:43:39] [PASSED] first_arg_test
[10:43:39] [PASSED] last_arg_example
[10:43:39] [PASSED] last_arg_test
[10:43:39] [PASSED] pick_arg_example
[10:43:39] [PASSED] if_args_example
[10:43:39] [PASSED] if_args_test
[10:43:39] [PASSED] sep_comma_example
[10:43:39] ====================== [PASSED] args =======================
[10:43:39] =================== xe_pci (3 subtests) ====================
[10:43:39] ==================== check_graphics_ip  ====================
[10:43:39] [PASSED] 12.00 Xe_LP
[10:43:39] [PASSED] 12.10 Xe_LP+
[10:43:39] [PASSED] 12.55 Xe_HPG
[10:43:39] [PASSED] 12.60 Xe_HPC
[10:43:39] [PASSED] 12.70 Xe_LPG
[10:43:39] [PASSED] 12.71 Xe_LPG
[10:43:39] [PASSED] 12.74 Xe_LPG+
[10:43:39] [PASSED] 20.01 Xe2_HPG
[10:43:39] [PASSED] 20.02 Xe2_HPG
[10:43:39] [PASSED] 20.04 Xe2_LPG
[10:43:39] [PASSED] 30.00 Xe3_LPG
[10:43:39] [PASSED] 30.01 Xe3_LPG
[10:43:39] [PASSED] 30.03 Xe3_LPG
[10:43:39] [PASSED] 30.04 Xe3_LPG
[10:43:39] [PASSED] 30.05 Xe3_LPG
[10:43:39] [PASSED] 35.10 Xe3p_LPG
[10:43:39] [PASSED] 35.11 Xe3p_XPC
[10:43:39] ================ [PASSED] check_graphics_ip ================
[10:43:39] ===================== check_media_ip  ======================
[10:43:39] [PASSED] 12.00 Xe_M
[10:43:39] [PASSED] 12.55 Xe_HPM
[10:43:39] [PASSED] 13.00 Xe_LPM+
[10:43:39] [PASSED] 13.01 Xe2_HPM
[10:43:39] [PASSED] 20.00 Xe2_LPM
[10:43:39] [PASSED] 30.00 Xe3_LPM
[10:43:39] [PASSED] 30.02 Xe3_LPM
[10:43:39] [PASSED] 35.00 Xe3p_LPM
[10:43:39] [PASSED] 35.03 Xe3p_HPM
[10:43:39] ================= [PASSED] check_media_ip ==================
[10:43:39] =================== check_platform_desc  ===================
[10:43:39] [PASSED] 0x9A60 (TIGERLAKE)
[10:43:39] [PASSED] 0x9A68 (TIGERLAKE)
[10:43:39] [PASSED] 0x9A70 (TIGERLAKE)
[10:43:39] [PASSED] 0x9A40 (TIGERLAKE)
[10:43:39] [PASSED] 0x9A49 (TIGERLAKE)
[10:43:39] [PASSED] 0x9A59 (TIGERLAKE)
[10:43:39] [PASSED] 0x9A78 (TIGERLAKE)
[10:43:39] [PASSED] 0x9AC0 (TIGERLAKE)
[10:43:39] [PASSED] 0x9AC9 (TIGERLAKE)
[10:43:39] [PASSED] 0x9AD9 (TIGERLAKE)
[10:43:39] [PASSED] 0x9AF8 (TIGERLAKE)
[10:43:39] [PASSED] 0x4C80 (ROCKETLAKE)
[10:43:39] [PASSED] 0x4C8A (ROCKETLAKE)
[10:43:39] [PASSED] 0x4C8B (ROCKETLAKE)
[10:43:39] [PASSED] 0x4C8C (ROCKETLAKE)
[10:43:39] [PASSED] 0x4C90 (ROCKETLAKE)
[10:43:39] [PASSED] 0x4C9A (ROCKETLAKE)
[10:43:39] [PASSED] 0x4680 (ALDERLAKE_S)
[10:43:39] [PASSED] 0x4682 (ALDERLAKE_S)
[10:43:39] [PASSED] 0x4688 (ALDERLAKE_S)
[10:43:39] [PASSED] 0x468A (ALDERLAKE_S)
[10:43:39] [PASSED] 0x468B (ALDERLAKE_S)
[10:43:39] [PASSED] 0x4690 (ALDERLAKE_S)
[10:43:39] [PASSED] 0x4692 (ALDERLAKE_S)
[10:43:39] [PASSED] 0x4693 (ALDERLAKE_S)
[10:43:39] [PASSED] 0x46A0 (ALDERLAKE_P)
[10:43:39] [PASSED] 0x46A1 (ALDERLAKE_P)
[10:43:39] [PASSED] 0x46A2 (ALDERLAKE_P)
[10:43:39] [PASSED] 0x46A3 (ALDERLAKE_P)
[10:43:39] [PASSED] 0x46A6 (ALDERLAKE_P)
[10:43:39] [PASSED] 0x46A8 (ALDERLAKE_P)
[10:43:39] [PASSED] 0x46AA (ALDERLAKE_P)
[10:43:39] [PASSED] 0x462A (ALDERLAKE_P)
[10:43:39] [PASSED] 0x4626 (ALDERLAKE_P)
[10:43:39] [PASSED] 0x4628 (ALDERLAKE_P)
[10:43:39] [PASSED] 0x46B0 (ALDERLAKE_P)
[10:43:39] [PASSED] 0x46B1 (ALDERLAKE_P)
[10:43:39] [PASSED] 0x46B2 (ALDERLAKE_P)
[10:43:39] [PASSED] 0x46B3 (ALDERLAKE_P)
[10:43:39] [PASSED] 0x46C0 (ALDERLAKE_P)
[10:43:39] [PASSED] 0x46C1 (ALDERLAKE_P)
[10:43:39] [PASSED] 0x46C2 (ALDERLAKE_P)
[10:43:39] [PASSED] 0x46C3 (ALDERLAKE_P)
[10:43:39] [PASSED] 0x46D0 (ALDERLAKE_N)
[10:43:39] [PASSED] 0x46D1 (ALDERLAKE_N)
[10:43:39] [PASSED] 0x46D2 (ALDERLAKE_N)
[10:43:39] [PASSED] 0x46D3 (ALDERLAKE_N)
[10:43:39] [PASSED] 0x46D4 (ALDERLAKE_N)
[10:43:39] [PASSED] 0xA721 (ALDERLAKE_P)
[10:43:39] [PASSED] 0xA7A1 (ALDERLAKE_P)
[10:43:39] [PASSED] 0xA7A9 (ALDERLAKE_P)
[10:43:39] [PASSED] 0xA7AC (ALDERLAKE_P)
[10:43:39] [PASSED] 0xA7AD (ALDERLAKE_P)
[10:43:39] [PASSED] 0xA720 (ALDERLAKE_P)
[10:43:39] [PASSED] 0xA7A0 (ALDERLAKE_P)
[10:43:39] [PASSED] 0xA7A8 (ALDERLAKE_P)
[10:43:39] [PASSED] 0xA7AA (ALDERLAKE_P)
[10:43:39] [PASSED] 0xA7AB (ALDERLAKE_P)
[10:43:39] [PASSED] 0xA780 (ALDERLAKE_S)
[10:43:39] [PASSED] 0xA781 (ALDERLAKE_S)
[10:43:39] [PASSED] 0xA782 (ALDERLAKE_S)
[10:43:39] [PASSED] 0xA783 (ALDERLAKE_S)
[10:43:39] [PASSED] 0xA788 (ALDERLAKE_S)
[10:43:39] [PASSED] 0xA789 (ALDERLAKE_S)
[10:43:39] [PASSED] 0xA78A (ALDERLAKE_S)
[10:43:39] [PASSED] 0xA78B (ALDERLAKE_S)
[10:43:39] [PASSED] 0x4905 (DG1)
[10:43:39] [PASSED] 0x4906 (DG1)
[10:43:39] [PASSED] 0x4907 (DG1)
[10:43:39] [PASSED] 0x4908 (DG1)
[10:43:39] [PASSED] 0x4909 (DG1)
[10:43:39] [PASSED] 0x56C0 (DG2)
[10:43:39] [PASSED] 0x56C2 (DG2)
[10:43:39] [PASSED] 0x56C1 (DG2)
[10:43:39] [PASSED] 0x7D51 (METEORLAKE)
[10:43:39] [PASSED] 0x7DD1 (METEORLAKE)
[10:43:39] [PASSED] 0x7D41 (METEORLAKE)
[10:43:39] [PASSED] 0x7D67 (METEORLAKE)
[10:43:39] [PASSED] 0xB640 (METEORLAKE)
[10:43:39] [PASSED] 0x56A0 (DG2)
[10:43:39] [PASSED] 0x56A1 (DG2)
[10:43:39] [PASSED] 0x56A2 (DG2)
[10:43:39] [PASSED] 0x56BE (DG2)
[10:43:39] [PASSED] 0x56BF (DG2)
[10:43:39] [PASSED] 0x5690 (DG2)
[10:43:39] [PASSED] 0x5691 (DG2)
[10:43:39] [PASSED] 0x5692 (DG2)
[10:43:39] [PASSED] 0x56A5 (DG2)
[10:43:39] [PASSED] 0x56A6 (DG2)
[10:43:39] [PASSED] 0x56B0 (DG2)
[10:43:39] [PASSED] 0x56B1 (DG2)
[10:43:39] [PASSED] 0x56BA (DG2)
[10:43:39] [PASSED] 0x56BB (DG2)
[10:43:39] [PASSED] 0x56BC (DG2)
[10:43:39] [PASSED] 0x56BD (DG2)
[10:43:39] [PASSED] 0x5693 (DG2)
[10:43:39] [PASSED] 0x5694 (DG2)
[10:43:39] [PASSED] 0x5695 (DG2)
[10:43:39] [PASSED] 0x56A3 (DG2)
[10:43:39] [PASSED] 0x56A4 (DG2)
[10:43:39] [PASSED] 0x56B2 (DG2)
[10:43:39] [PASSED] 0x56B3 (DG2)
[10:43:39] [PASSED] 0x5696 (DG2)
[10:43:39] [PASSED] 0x5697 (DG2)
[10:43:39] [PASSED] 0xB69 (PVC)
[10:43:39] [PASSED] 0xB6E (PVC)
[10:43:39] [PASSED] 0xBD4 (PVC)
[10:43:39] [PASSED] 0xBD5 (PVC)
[10:43:39] [PASSED] 0xBD6 (PVC)
[10:43:39] [PASSED] 0xBD7 (PVC)
[10:43:39] [PASSED] 0xBD8 (PVC)
[10:43:39] [PASSED] 0xBD9 (PVC)
[10:43:39] [PASSED] 0xBDA (PVC)
[10:43:39] [PASSED] 0xBDB (PVC)
[10:43:39] [PASSED] 0xBE0 (PVC)
[10:43:39] [PASSED] 0xBE1 (PVC)
[10:43:39] [PASSED] 0xBE5 (PVC)
[10:43:39] [PASSED] 0x7D40 (METEORLAKE)
[10:43:39] [PASSED] 0x7D45 (METEORLAKE)
[10:43:39] [PASSED] 0x7D55 (METEORLAKE)
[10:43:39] [PASSED] 0x7D60 (METEORLAKE)
[10:43:39] [PASSED] 0x7DD5 (METEORLAKE)
[10:43:39] [PASSED] 0x6420 (LUNARLAKE)
[10:43:39] [PASSED] 0x64A0 (LUNARLAKE)
[10:43:39] [PASSED] 0x64B0 (LUNARLAKE)
[10:43:39] [PASSED] 0xE202 (BATTLEMAGE)
[10:43:39] [PASSED] 0xE209 (BATTLEMAGE)
[10:43:39] [PASSED] 0xE20B (BATTLEMAGE)
[10:43:39] [PASSED] 0xE20C (BATTLEMAGE)
[10:43:39] [PASSED] 0xE20D (BATTLEMAGE)
[10:43:39] [PASSED] 0xE210 (BATTLEMAGE)
[10:43:39] [PASSED] 0xE211 (BATTLEMAGE)
[10:43:39] [PASSED] 0xE212 (BATTLEMAGE)
[10:43:39] [PASSED] 0xE216 (BATTLEMAGE)
[10:43:39] [PASSED] 0xE220 (BATTLEMAGE)
[10:43:39] [PASSED] 0xE221 (BATTLEMAGE)
[10:43:39] [PASSED] 0xE222 (BATTLEMAGE)
[10:43:39] [PASSED] 0xE223 (BATTLEMAGE)
[10:43:39] [PASSED] 0xB080 (PANTHERLAKE)
[10:43:39] [PASSED] 0xB081 (PANTHERLAKE)
[10:43:39] [PASSED] 0xB082 (PANTHERLAKE)
[10:43:39] [PASSED] 0xB083 (PANTHERLAKE)
[10:43:39] [PASSED] 0xB084 (PANTHERLAKE)
[10:43:39] [PASSED] 0xB085 (PANTHERLAKE)
[10:43:39] [PASSED] 0xB086 (PANTHERLAKE)
[10:43:39] [PASSED] 0xB087 (PANTHERLAKE)
[10:43:39] [PASSED] 0xB08F (PANTHERLAKE)
[10:43:39] [PASSED] 0xB090 (PANTHERLAKE)
[10:43:39] [PASSED] 0xB0A0 (PANTHERLAKE)
[10:43:39] [PASSED] 0xB0A1 (PANTHERLAKE)
[10:43:39] [PASSED] 0xB0B0 (PANTHERLAKE)
[10:43:39] [PASSED] 0xFD80 (PANTHERLAKE)
[10:43:39] [PASSED] 0xFD81 (PANTHERLAKE)
[10:43:39] [PASSED] 0xD740 (NOVALAKE_S)
[10:43:39] [PASSED] 0xD741 (NOVALAKE_S)
[10:43:39] [PASSED] 0xD742 (NOVALAKE_S)
[10:43:39] [PASSED] 0xD743 (NOVALAKE_S)
[10:43:39] [PASSED] 0xD745 (NOVALAKE_S)
[10:43:39] [PASSED] 0xD74A (NOVALAKE_S)
[10:43:39] [PASSED] 0xD74B (NOVALAKE_S)
[10:43:39] [PASSED] 0x674C (CRESCENTISLAND)
[10:43:39] [PASSED] 0x674D (CRESCENTISLAND)
[10:43:39] [PASSED] 0x674E (CRESCENTISLAND)
[10:43:39] [PASSED] 0x674F (CRESCENTISLAND)
[10:43:39] [PASSED] 0x6750 (CRESCENTISLAND)
[10:43:39] [PASSED] 0x6751 (CRESCENTISLAND)
[10:43:39] [PASSED] 0xD750 (NOVALAKE_P)
[10:43:39] [PASSED] 0xD751 (NOVALAKE_P)
[10:43:39] [PASSED] 0xD752 (NOVALAKE_P)
[10:43:39] [PASSED] 0xD753 (NOVALAKE_P)
[10:43:39] [PASSED] 0xD754 (NOVALAKE_P)
[10:43:39] [PASSED] 0xD755 (NOVALAKE_P)
[10:43:39] [PASSED] 0xD756 (NOVALAKE_P)
[10:43:39] [PASSED] 0xD757 (NOVALAKE_P)
[10:43:39] [PASSED] 0xD75F (NOVALAKE_P)
[10:43:39] =============== [PASSED] check_platform_desc ===============
[10:43:39] ===================== [PASSED] xe_pci ======================
[10:43:39] ============= xe_rtp_tables_test (5 subtests) ==============
[10:43:39] ================== xe_rtp_table_gt_test  ===================
[10:43:39] [PASSED] gt_was/14011060649
[10:43:39] [PASSED] gt_was/14011059788
[10:43:39] [PASSED] gt_was/14015795083
[10:43:39] [PASSED] gt_was/16021867713
[10:43:39] [PASSED] gt_was/14019449301
[10:43:39] [PASSED] gt_was/16028005424
[10:43:39] [PASSED] gt_was/14026578760
[10:43:39] [PASSED] gt_was/1409420604
[10:43:39] [PASSED] gt_was/1408615072
[10:43:39] [PASSED] gt_was/22010523718
[10:43:39] [PASSED] gt_was/14011006942
[10:43:39] [PASSED] gt_was/14014830051
[10:43:39] [PASSED] gt_was/18018781329
[10:43:39] [PASSED] gt_was/1509235366
[10:43:39] [PASSED] gt_was/18018781329
[10:43:39] [PASSED] gt_was/16016694945
[10:43:39] [PASSED] gt_was/14018575942
[10:43:39] [PASSED] gt_was/22016670082
[10:43:39] [PASSED] gt_was/22016670082
[10:43:39] [PASSED] gt_was/14017421178
[10:43:39] [PASSED] gt_was/16025250150
[10:43:39] [PASSED] gt_was/14021871409
[10:43:39] [PASSED] gt_was/16021865536
[10:43:39] [PASSED] gt_was/14021486841
[10:43:39] [PASSED] gt_was/14025160223
[10:43:39] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[10:43:39] [PASSED] gt_was/14025635424
[10:43:39] [PASSED] gt_was/16028005424
[10:43:39] ============== [PASSED] xe_rtp_table_gt_test ===============
[10:43:39] ================== xe_rtp_table_gt_test  ===================
[10:43:39] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[10:43:39] [PASSED] gt_tunings/Tuning: 32B Access Enable
[10:43:39] [PASSED] gt_tunings/Tuning: L3 cache
[10:43:39] [PASSED] gt_tunings/Tuning: L3 cache - media
[10:43:39] [PASSED] gt_tunings/Tuning: Compression Overfetch
[10:43:39] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[10:43:39] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[10:43:39] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[10:43:39] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[10:43:39] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[10:43:39] [PASSED] gt_tunings/Tuning: Stateless compression control
[10:43:39] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[10:43:39] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[10:43:39] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[10:43:39] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[10:43:39] [PASSED] gt_tunings/Tuning: Force All Non-Compressible Memory Reads to be 256B Overfetches
[10:43:39] ============== [PASSED] xe_rtp_table_gt_test ===============
[10:43:39] ================== xe_rtp_table_oob_test  ==================
[10:43:39] [PASSED] oob_was/1607983814
[10:43:39] [PASSED] oob_was/16010904313
[10:43:39] [PASSED] oob_was/18022495364
[10:43:39] [PASSED] oob_was/22012773006
[10:43:39] [PASSED] oob_was/14014475959
[10:43:39] [PASSED] oob_was/22011391025
[10:43:39] [PASSED] oob_was/22012727170
[10:43:39] [PASSED] oob_was/22012727685
[10:43:39] [PASSED] oob_was/22016596838
[10:43:39] [PASSED] oob_was/18020744125
[10:43:39] [PASSED] oob_was/1409600907
[10:43:39] [PASSED] oob_was/22014953428
[10:43:39] [PASSED] oob_was/16017236439
[10:43:39] [PASSED] oob_was/14019821291
[10:43:39] [PASSED] oob_was/14015076503
[10:43:39] [PASSED] oob_was/22016122933
[10:43:39] [PASSED] oob_was/14018913170
[10:43:39] [PASSED] oob_was/14018094691
[10:43:39] [PASSED] oob_was/18024947630
[10:43:39] [PASSED] oob_was/16022287689
[10:43:39] [PASSED] oob_was/13011645652
[10:43:39] [PASSED] oob_was/14022293748
[10:43:39] [PASSED] oob_was/22019794406
[10:43:39] [PASSED] oob_was/22019338487
[10:43:39] [PASSED] oob_was/16023588340
[10:43:39] [PASSED] oob_was/14019789679
[10:43:39] [PASSED] oob_was/14022866841
[10:43:39] [PASSED] oob_was/16021333562
[10:43:39] [PASSED] oob_was/14016712196
[10:43:39] [PASSED] oob_was/14015568240
[10:43:39] [PASSED] oob_was/18013179988
[10:43:39] [PASSED] oob_was/1508761755
[10:43:39] [PASSED] oob_was/16023105232
[10:43:39] [PASSED] oob_was/16026508708
[10:43:39] [PASSED] oob_was/14020001231
[10:43:39] [PASSED] oob_was/16023683509
[10:43:39] [PASSED] oob_was/14025515070
[10:43:39] [PASSED] oob_was/15015404425_disable
[10:43:39] [PASSED] oob_was/16026007364
[10:43:39] [PASSED] oob_was/14020316580
[10:43:39] [PASSED] oob_was/14025883347
[10:43:39] [PASSED] oob_was/16029380221
[10:43:39] [PASSED] oob_was/22022079272
[10:43:39] [PASSED] oob_was/16029897822
[10:43:39] [PASSED] oob_was/14027054324
[10:43:39] [PASSED] oob_was/14025941587
[10:43:39] [PASSED] oob_was/16030224309
[10:43:39] ============== [PASSED] xe_rtp_table_oob_test ==============
[10:43:39] ================ xe_rtp_table_dev_oob_test  ================
[10:43:39] [PASSED] device_oob_was/22010954014
[10:43:39] [PASSED] device_oob_was/15015404425
[10:43:39] [PASSED] device_oob_was/22019338487_display
[10:43:39] [PASSED] device_oob_was/14022085890
[10:43:39] [PASSED] device_oob_was/14026539277
[10:43:39] [PASSED] device_oob_was/14026633728
[10:43:39] [PASSED] device_oob_was/14026746987
[10:43:39] [PASSED] device_oob_was/14026779378
[10:43:39] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[10:43:39] ========== xe_rtp_table_missing_upper_bound_test  ==========
[10:43:39] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[10:43:39] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[10:43:39] [PASSED] register_whitelist/1806527549
[10:43:39] [PASSED] register_whitelist/allow_read_ctx_timestamp
[10:43:39] [PASSED] register_whitelist/allow_read_queue_timestamp
[10:43:39] [PASSED] register_whitelist/16014440446
[10:43:39] [PASSED] register_whitelist/16017236439
[10:43:39] [PASSED] register_whitelist/16020183090
[10:43:39] [PASSED] register_whitelist/14024997852
[10:43:39] [PASSED] register_whitelist/14024997852
[10:43:39] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[10:43:39] =============== [PASSED] xe_rtp_tables_test ================
[10:43:39] =================== xe_rtp (3 subtests) ====================
[10:43:39] =================== xe_rtp_rules_tests  ====================
[10:43:39] [PASSED] no
[10:43:39] [PASSED] yes
[10:43:39] [PASSED] no-and-no
[10:43:39] [PASSED] no-and-yes
[10:43:39] [PASSED] yes-and-no
[10:43:39] [PASSED] yes-and-yes
[10:43:39] [PASSED] no-or-no
[10:43:39] [PASSED] no-or-yes
[10:43:39] [PASSED] yes-or-no
[10:43:39] [PASSED] yes-or-yes
[10:43:39] [PASSED] no-yes-or-yes-no
[10:43:39] [PASSED] no-yes-or-yes-yes
[10:43:39] [PASSED] yes-yes-or-no-yes
[10:43:39] [PASSED] yes-yes-or-yes-yes
[10:43:39] [PASSED] no-no-or-yes-or-no
[10:43:39] [PASSED] or
[10:43:39] [PASSED] or-yes
[10:43:39] [PASSED] or-no
[10:43:39] [PASSED] yes-or
[10:43:39] [PASSED] no-or
[10:43:39] [PASSED] no-or-or-yes
[10:43:39] [PASSED] yes-or-or-no
[10:43:39] [PASSED] no-or-or-no
[10:43:39] [PASSED] missing-context-engine-class
[10:43:39] [PASSED] missing-context-engine-class-or-yes
[10:43:39] [PASSED] missing-context-engine-class-or-or-yes
[10:43:39] =============== [PASSED] xe_rtp_rules_tests ================
[10:43:39] =============== xe_rtp_process_to_sr_tests  ================
[10:43:39] [PASSED] coalesce-same-reg
[10:43:39] [PASSED] coalesce-same-reg-literal-and-func
[10:43:39] [PASSED] no-match-no-add
[10:43:39] [PASSED] two-regs-two-entries
[10:43:39] [PASSED] clr-one-set-other
[10:43:39] [PASSED] set-field
[10:43:39] [PASSED] conflict-duplicate
[10:43:39] [PASSED] conflict-not-disjoint
[10:43:39] [PASSED] conflict-not-disjoint-literal-and-func
[10:43:39] [PASSED] conflict-reg-type
[10:43:39] [PASSED] bad-mcr-reg-forced-to-regular
[10:43:39] [PASSED] bad-regular-reg-forced-to-mcr
[10:43:39] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[10:43:39] ================== xe_rtp_process_tests  ===================
[10:43:39] [PASSED] active1
[10:43:39] [PASSED] active2
[10:43:39] [PASSED] active-inactive
[10:43:39] [PASSED] inactive-active
[10:43:39] [PASSED] inactive-active-inactive
[10:43:39] [PASSED] inactive-inactive-inactive
[10:43:39] ============== [PASSED] xe_rtp_process_tests ===============
[10:43:39] ===================== [PASSED] xe_rtp ======================
[10:43:39] ==================== xe_wa (1 subtest) =====================
[10:43:39] ======================== xe_wa_gt  =========================
[10:43:39] [PASSED] TIGERLAKE B0
[10:43:39] [PASSED] DG1 A0
[10:43:39] [PASSED] DG1 B0
[10:43:39] [PASSED] ALDERLAKE_S A0
[10:43:39] [PASSED] ALDERLAKE_S B0
[10:43:39] [PASSED] ALDERLAKE_S C0
[10:43:39] [PASSED] ALDERLAKE_S D0
[10:43:39] [PASSED] ALDERLAKE_P A0
[10:43:39] [PASSED] ALDERLAKE_P B0
[10:43:39] [PASSED] ALDERLAKE_P C0
[10:43:39] [PASSED] ALDERLAKE_S RPLS D0
[10:43:39] [PASSED] ALDERLAKE_P RPLU E0
[10:43:39] [PASSED] DG2 G10 C0
[10:43:39] [PASSED] DG2 G11 B1
[10:43:39] [PASSED] DG2 G12 A1
[10:43:39] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[10:43:39] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[10:43:39] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[10:43:39] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[10:43:39] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[10:43:39] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[10:43:39] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[10:43:39] ==================== [PASSED] xe_wa_gt =====================
[10:43:39] ====================== [PASSED] xe_wa ======================
[10:43:39] ============================================================
[10:43:39] Testing complete. Ran 821 tests: passed: 793, skipped: 28
[10:43:39] Elapsed time: 40.603s total, 1.861s configuring, 38.026s building, 0.704s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[10:43:39] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:43:41] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[10:44:06] Starting KUnit Kernel (1/1)...
[10:44:06] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:44:06] ============ drm_test_pick_cmdline (2 subtests) ============
[10:44:06] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[10:44:06] =============== drm_test_pick_cmdline_named  ===============
[10:44:06] [PASSED] NTSC
[10:44:06] [PASSED] NTSC-J
[10:44:06] [PASSED] PAL
[10:44:06] [PASSED] PAL-M
[10:44:06] =========== [PASSED] drm_test_pick_cmdline_named ===========
[10:44:06] ============== [PASSED] drm_test_pick_cmdline ==============
[10:44:06] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[10:44:06] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[10:44:06] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[10:44:06] =========== drm_validate_clone_mode (2 subtests) ===========
[10:44:06] ============== drm_test_check_in_clone_mode  ===============
[10:44:06] [PASSED] in_clone_mode
[10:44:06] [PASSED] not_in_clone_mode
[10:44:06] ========== [PASSED] drm_test_check_in_clone_mode ===========
[10:44:06] =============== drm_test_check_valid_clones  ===============
[10:44:06] [PASSED] not_in_clone_mode
[10:44:06] [PASSED] valid_clone
[10:44:06] [PASSED] invalid_clone
[10:44:06] =========== [PASSED] drm_test_check_valid_clones ===========
[10:44:06] ============= [PASSED] drm_validate_clone_mode =============
[10:44:06] ============= drm_validate_modeset (1 subtest) =============
[10:44:06] [PASSED] drm_test_check_connector_changed_modeset
[10:44:06] ============== [PASSED] drm_validate_modeset ===============
[10:44:06] ====== drm_test_bridge_get_current_state (1 subtest) =======
[10:44:06] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[10:44:06] ======== [PASSED] drm_test_bridge_get_current_state ========
[10:44:06] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[10:44:06] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[10:44:06] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[10:44:06] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[10:44:06] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[10:44:06] ============== drm_bridge_alloc (2 subtests) ===============
[10:44:06] [PASSED] drm_test_drm_bridge_alloc_basic
[10:44:06] [PASSED] drm_test_drm_bridge_alloc_get_put
[10:44:06] ================ [PASSED] drm_bridge_alloc =================
[10:44:06] ============= drm_bridge_bus_fmt (5 subtests) ==============
[10:44:06] [PASSED] drm_test_bridge_rgb_yuv_rgb
[10:44:06] [PASSED] drm_test_bridge_must_convert_to_yuv444
[10:44:06] [PASSED] drm_test_bridge_hdmi_auto_rgb
[10:44:06] [PASSED] drm_test_bridge_auto_first
[10:44:06] [PASSED] drm_test_bridge_rgb_yuv_no_path
[10:44:06] =============== [PASSED] drm_bridge_bus_fmt ================
[10:44:06] ============= drm_cmdline_parser (40 subtests) =============
[10:44:06] [PASSED] drm_test_cmdline_force_d_only
[10:44:06] [PASSED] drm_test_cmdline_force_D_only_dvi
[10:44:06] [PASSED] drm_test_cmdline_force_D_only_hdmi
[10:44:06] [PASSED] drm_test_cmdline_force_D_only_not_digital
[10:44:06] [PASSED] drm_test_cmdline_force_e_only
[10:44:06] [PASSED] drm_test_cmdline_res
[10:44:06] [PASSED] drm_test_cmdline_res_vesa
[10:44:06] [PASSED] drm_test_cmdline_res_vesa_rblank
[10:44:06] [PASSED] drm_test_cmdline_res_rblank
[10:44:06] [PASSED] drm_test_cmdline_res_bpp
[10:44:06] [PASSED] drm_test_cmdline_res_refresh
[10:44:06] [PASSED] drm_test_cmdline_res_bpp_refresh
[10:44:06] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[10:44:06] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[10:44:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[10:44:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[10:44:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[10:44:06] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[10:44:06] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[10:44:06] [PASSED] drm_test_cmdline_res_margins_force_on
[10:44:06] [PASSED] drm_test_cmdline_res_vesa_margins
[10:44:06] [PASSED] drm_test_cmdline_name
[10:44:06] [PASSED] drm_test_cmdline_name_bpp
[10:44:06] [PASSED] drm_test_cmdline_name_option
[10:44:06] [PASSED] drm_test_cmdline_name_bpp_option
[10:44:06] [PASSED] drm_test_cmdline_rotate_0
[10:44:06] [PASSED] drm_test_cmdline_rotate_90
[10:44:06] [PASSED] drm_test_cmdline_rotate_180
[10:44:06] [PASSED] drm_test_cmdline_rotate_270
[10:44:06] [PASSED] drm_test_cmdline_hmirror
[10:44:06] [PASSED] drm_test_cmdline_vmirror
[10:44:06] [PASSED] drm_test_cmdline_margin_options
[10:44:06] [PASSED] drm_test_cmdline_multiple_options
[10:44:06] [PASSED] drm_test_cmdline_bpp_extra_and_option
[10:44:06] [PASSED] drm_test_cmdline_extra_and_option
[10:44:06] [PASSED] drm_test_cmdline_freestanding_options
[10:44:06] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[10:44:06] [PASSED] drm_test_cmdline_panel_orientation
[10:44:06] ================ drm_test_cmdline_invalid  =================
[10:44:06] [PASSED] margin_only
[10:44:06] [PASSED] interlace_only
[10:44:06] [PASSED] res_missing_x
[10:44:06] [PASSED] res_missing_y
[10:44:06] [PASSED] res_bad_y
[10:44:06] [PASSED] res_missing_y_bpp
[10:44:06] [PASSED] res_bad_bpp
[10:44:06] [PASSED] res_bad_refresh
[10:44:06] [PASSED] res_bpp_refresh_force_on_off
[10:44:06] [PASSED] res_invalid_mode
[10:44:06] [PASSED] res_bpp_wrong_place_mode
[10:44:06] [PASSED] name_bpp_refresh
[10:44:06] [PASSED] name_refresh
[10:44:06] [PASSED] name_refresh_wrong_mode
[10:44:06] [PASSED] name_refresh_invalid_mode
[10:44:06] [PASSED] rotate_multiple
[10:44:06] [PASSED] rotate_invalid_val
[10:44:06] [PASSED] rotate_truncated
[10:44:06] [PASSED] invalid_option
[10:44:06] [PASSED] invalid_tv_option
[10:44:06] [PASSED] truncated_tv_option
[10:44:06] ============ [PASSED] drm_test_cmdline_invalid =============
[10:44:06] =============== drm_test_cmdline_tv_options  ===============
[10:44:06] [PASSED] NTSC
[10:44:06] [PASSED] NTSC_443
[10:44:06] [PASSED] NTSC_J
[10:44:06] [PASSED] PAL
[10:44:06] [PASSED] PAL_M
[10:44:06] [PASSED] PAL_N
[10:44:06] [PASSED] SECAM
[10:44:06] [PASSED] MONO_525
[10:44:06] [PASSED] MONO_625
[10:44:06] =========== [PASSED] drm_test_cmdline_tv_options ===========
[10:44:06] =============== [PASSED] drm_cmdline_parser ================
[10:44:06] ========== drmm_connector_hdmi_init (20 subtests) ==========
[10:44:06] [PASSED] drm_test_connector_hdmi_init_valid
[10:44:06] [PASSED] drm_test_connector_hdmi_init_bpc_8
[10:44:06] [PASSED] drm_test_connector_hdmi_init_bpc_10
[10:44:06] [PASSED] drm_test_connector_hdmi_init_bpc_12
[10:44:06] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[10:44:06] [PASSED] drm_test_connector_hdmi_init_bpc_null
[10:44:06] [PASSED] drm_test_connector_hdmi_init_formats_empty
[10:44:06] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[10:44:06] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[10:44:06] [PASSED] supported_formats=0x9 yuv420_allowed=1
[10:44:06] [PASSED] supported_formats=0x9 yuv420_allowed=0
[10:44:06] [PASSED] supported_formats=0x5 yuv420_allowed=1
[10:44:06] [PASSED] supported_formats=0x5 yuv420_allowed=0
[10:44:06] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[10:44:06] [PASSED] drm_test_connector_hdmi_init_null_ddc
[10:44:06] [PASSED] drm_test_connector_hdmi_init_null_product
[10:44:06] [PASSED] drm_test_connector_hdmi_init_null_vendor
[10:44:06] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[10:44:06] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[10:44:06] [PASSED] drm_test_connector_hdmi_init_product_valid
[10:44:06] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[10:44:06] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[10:44:06] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[10:44:06] ========= drm_test_connector_hdmi_init_type_valid  =========
[10:44:06] [PASSED] HDMI-A
[10:44:06] [PASSED] HDMI-B
[10:44:06] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[10:44:06] ======== drm_test_connector_hdmi_init_type_invalid  ========
[10:44:06] [PASSED] Unknown
[10:44:06] [PASSED] VGA
[10:44:06] [PASSED] DVI-I
[10:44:06] [PASSED] DVI-D
[10:44:06] [PASSED] DVI-A
[10:44:06] [PASSED] Composite
[10:44:06] [PASSED] SVIDEO
[10:44:06] [PASSED] LVDS
[10:44:06] [PASSED] Component
[10:44:06] [PASSED] DIN
[10:44:06] [PASSED] DP
[10:44:06] [PASSED] TV
[10:44:06] [PASSED] eDP
[10:44:06] [PASSED] Virtual
[10:44:06] [PASSED] DSI
[10:44:06] [PASSED] DPI
[10:44:06] [PASSED] Writeback
[10:44:06] [PASSED] SPI
[10:44:06] [PASSED] USB
[10:44:06] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[10:44:06] ============ [PASSED] drmm_connector_hdmi_init =============
[10:44:06] ============= drmm_connector_init (3 subtests) =============
[10:44:06] [PASSED] drm_test_drmm_connector_init
[10:44:06] [PASSED] drm_test_drmm_connector_init_null_ddc
[10:44:06] ========= drm_test_drmm_connector_init_type_valid  =========
[10:44:06] [PASSED] Unknown
[10:44:06] [PASSED] VGA
[10:44:06] [PASSED] DVI-I
[10:44:06] [PASSED] DVI-D
[10:44:06] [PASSED] DVI-A
[10:44:06] [PASSED] Composite
[10:44:06] [PASSED] SVIDEO
[10:44:06] [PASSED] LVDS
[10:44:06] [PASSED] Component
[10:44:06] [PASSED] DIN
[10:44:06] [PASSED] DP
[10:44:06] [PASSED] HDMI-A
[10:44:06] [PASSED] HDMI-B
[10:44:06] [PASSED] TV
[10:44:06] [PASSED] eDP
[10:44:06] [PASSED] Virtual
[10:44:06] [PASSED] DSI
[10:44:06] [PASSED] DPI
[10:44:06] [PASSED] Writeback
[10:44:06] [PASSED] SPI
[10:44:06] [PASSED] USB
[10:44:06] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[10:44:06] =============== [PASSED] drmm_connector_init ===============
[10:44:06] ========= drm_connector_dynamic_init (6 subtests) ==========
[10:44:06] [PASSED] drm_test_drm_connector_dynamic_init
[10:44:06] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[10:44:06] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[10:44:06] [PASSED] drm_test_drm_connector_dynamic_init_properties
[10:44:06] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[10:44:06] [PASSED] Unknown
[10:44:06] [PASSED] VGA
[10:44:06] [PASSED] DVI-I
[10:44:06] [PASSED] DVI-D
[10:44:06] [PASSED] DVI-A
[10:44:06] [PASSED] Composite
[10:44:06] [PASSED] SVIDEO
[10:44:06] [PASSED] LVDS
[10:44:06] [PASSED] Component
[10:44:06] [PASSED] DIN
[10:44:06] [PASSED] DP
[10:44:06] [PASSED] HDMI-A
[10:44:06] [PASSED] HDMI-B
[10:44:06] [PASSED] TV
[10:44:06] [PASSED] eDP
[10:44:06] [PASSED] Virtual
[10:44:06] [PASSED] DSI
[10:44:06] [PASSED] DPI
[10:44:06] [PASSED] Writeback
[10:44:06] [PASSED] SPI
[10:44:06] [PASSED] USB
[10:44:06] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[10:44:06] ======== drm_test_drm_connector_dynamic_init_name  =========
[10:44:06] [PASSED] Unknown
[10:44:06] [PASSED] VGA
[10:44:06] [PASSED] DVI-I
[10:44:06] [PASSED] DVI-D
[10:44:06] [PASSED] DVI-A
[10:44:06] [PASSED] Composite
[10:44:06] [PASSED] SVIDEO
[10:44:06] [PASSED] LVDS
[10:44:06] [PASSED] Component
[10:44:06] [PASSED] DIN
[10:44:06] [PASSED] DP
[10:44:06] [PASSED] HDMI-A
[10:44:06] [PASSED] HDMI-B
[10:44:06] [PASSED] TV
[10:44:06] [PASSED] eDP
[10:44:06] [PASSED] Virtual
[10:44:06] [PASSED] DSI
[10:44:06] [PASSED] DPI
[10:44:06] [PASSED] Writeback
[10:44:06] [PASSED] SPI
[10:44:06] [PASSED] USB
[10:44:06] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[10:44:06] =========== [PASSED] drm_connector_dynamic_init ============
[10:44:06] ==== drm_connector_dynamic_register_early (4 subtests) =====
[10:44:06] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[10:44:06] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[10:44:06] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[10:44:06] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[10:44:06] ====== [PASSED] drm_connector_dynamic_register_early =======
[10:44:06] ======= drm_connector_dynamic_register (7 subtests) ========
[10:44:06] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[10:44:06] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[10:44:06] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[10:44:06] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[10:44:06] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[10:44:06] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[10:44:06] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[10:44:06] ========= [PASSED] drm_connector_dynamic_register ==========
[10:44:06] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[10:44:06] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[10:44:06] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[10:44:06] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[10:44:06] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[10:44:06] ========== drm_test_get_tv_mode_from_name_valid  ===========
[10:44:06] [PASSED] NTSC
[10:44:06] [PASSED] NTSC-443
[10:44:06] [PASSED] NTSC-J
[10:44:06] [PASSED] PAL
[10:44:06] [PASSED] PAL-M
[10:44:06] [PASSED] PAL-N
[10:44:06] [PASSED] SECAM
[10:44:06] [PASSED] Mono
[10:44:06] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[10:44:06] [PASSED] drm_test_get_tv_mode_from_name_truncated
[10:44:06] ============ [PASSED] drm_get_tv_mode_from_name ============
[10:44:06] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[10:44:06] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[10:44:06] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[10:44:06] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[10:44:06] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[10:44:06] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[10:44:06] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[10:44:06] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[10:44:06] [PASSED] VIC 96
[10:44:06] [PASSED] VIC 97
[10:44:06] [PASSED] VIC 101
[10:44:06] [PASSED] VIC 102
[10:44:06] [PASSED] VIC 106
[10:44:06] [PASSED] VIC 107
[10:44:06] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[10:44:06] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[10:44:06] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[10:44:06] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[10:44:06] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[10:44:06] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[10:44:06] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[10:44:06] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[10:44:06] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[10:44:06] [PASSED] Automatic
[10:44:06] [PASSED] Full
[10:44:06] [PASSED] Limited 16:235
[10:44:06] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[10:44:06] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[10:44:06] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[10:44:06] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[10:44:06] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[10:44:06] [PASSED] RGB
[10:44:06] [PASSED] YUV 4:2:0
[10:44:06] [PASSED] YUV 4:2:2
[10:44:06] [PASSED] YUV 4:4:4
[10:44:06] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[10:44:06] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[10:44:06] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[10:44:06] ============= drm_damage_helper (21 subtests) ==============
[10:44:06] [PASSED] drm_test_damage_iter_no_damage
[10:44:06] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[10:44:06] [PASSED] drm_test_damage_iter_no_damage_src_moved
[10:44:06] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[10:44:06] [PASSED] drm_test_damage_iter_no_damage_not_visible
[10:44:06] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[10:44:06] [PASSED] drm_test_damage_iter_no_damage_no_fb
[10:44:06] [PASSED] drm_test_damage_iter_simple_damage
[10:44:06] [PASSED] drm_test_damage_iter_single_damage
[10:44:06] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[10:44:06] [PASSED] drm_test_damage_iter_single_damage_outside_src
[10:44:06] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[10:44:06] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[10:44:06] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[10:44:06] [PASSED] drm_test_damage_iter_single_damage_src_moved
[10:44:06] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[10:44:06] [PASSED] drm_test_damage_iter_damage
[10:44:06] [PASSED] drm_test_damage_iter_damage_one_intersect
[10:44:06] [PASSED] drm_test_damage_iter_damage_one_outside
[10:44:06] [PASSED] drm_test_damage_iter_damage_src_moved
[10:44:06] [PASSED] drm_test_damage_iter_damage_not_visible
[10:44:06] ================ [PASSED] drm_damage_helper ================
[10:44:06] ============== drm_dp_mst_helper (3 subtests) ==============
[10:44:06] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[10:44:06] [PASSED] Clock 154000 BPP 30 DSC disabled
[10:44:06] [PASSED] Clock 234000 BPP 30 DSC disabled
[10:44:06] [PASSED] Clock 297000 BPP 24 DSC disabled
[10:44:06] [PASSED] Clock 332880 BPP 24 DSC enabled
[10:44:06] [PASSED] Clock 324540 BPP 24 DSC enabled
[10:44:06] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[10:44:06] ============== drm_test_dp_mst_calc_pbn_div  ===============
[10:44:06] [PASSED] Link rate 2000000 lane count 4
[10:44:06] [PASSED] Link rate 2000000 lane count 2
[10:44:06] [PASSED] Link rate 2000000 lane count 1
[10:44:06] [PASSED] Link rate 1350000 lane count 4
[10:44:06] [PASSED] Link rate 1350000 lane count 2
[10:44:06] [PASSED] Link rate 1350000 lane count 1
[10:44:06] [PASSED] Link rate 1000000 lane count 4
[10:44:06] [PASSED] Link rate 1000000 lane count 2
[10:44:06] [PASSED] Link rate 1000000 lane count 1
[10:44:06] [PASSED] Link rate 810000 lane count 4
[10:44:06] [PASSED] Link rate 810000 lane count 2
[10:44:06] [PASSED] Link rate 810000 lane count 1
[10:44:06] [PASSED] Link rate 540000 lane count 4
[10:44:06] [PASSED] Link rate 540000 lane count 2
[10:44:06] [PASSED] Link rate 540000 lane count 1
[10:44:06] [PASSED] Link rate 270000 lane count 4
[10:44:06] [PASSED] Link rate 270000 lane count 2
[10:44:06] [PASSED] Link rate 270000 lane count 1
[10:44:06] [PASSED] Link rate 162000 lane count 4
[10:44:06] [PASSED] Link rate 162000 lane count 2
[10:44:06] [PASSED] Link rate 162000 lane count 1
[10:44:06] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[10:44:06] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[10:44:06] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[10:44:06] [PASSED] DP_POWER_UP_PHY with port number
[10:44:06] [PASSED] DP_POWER_DOWN_PHY with port number
[10:44:06] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[10:44:06] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[10:44:06] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[10:44:06] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[10:44:06] [PASSED] DP_QUERY_PAYLOAD with port number
[10:44:06] [PASSED] DP_QUERY_PAYLOAD with VCPI
[10:44:06] [PASSED] DP_REMOTE_DPCD_READ with port number
[10:44:06] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[10:44:06] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[10:44:06] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[10:44:06] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[10:44:06] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[10:44:06] [PASSED] DP_REMOTE_I2C_READ with port number
[10:44:06] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[10:44:06] [PASSED] DP_REMOTE_I2C_READ with transactions array
[10:44:06] [PASSED] DP_REMOTE_I2C_WRITE with port number
[10:44:06] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[10:44:06] [PASSED] DP_REMOTE_I2C_WRITE with data array
[10:44:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[10:44:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[10:44:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[10:44:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[10:44:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[10:44:06] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[10:44:06] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[10:44:06] ================ [PASSED] drm_dp_mst_helper ================
[10:44:06] ================== drm_exec (7 subtests) ===================
[10:44:06] [PASSED] sanitycheck
[10:44:06] [PASSED] test_lock
[10:44:06] [PASSED] test_lock_unlock
[10:44:06] [PASSED] test_duplicates
[10:44:06] [PASSED] test_prepare
[10:44:06] [PASSED] test_prepare_array
[10:44:06] [PASSED] test_multiple_loops
[10:44:06] ==================== [PASSED] drm_exec =====================
[10:44:06] =========== drm_format_helper_test (17 subtests) ===========
[10:44:06] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[10:44:06] [PASSED] single_pixel_source_buffer
[10:44:06] [PASSED] single_pixel_clip_rectangle
[10:44:06] [PASSED] well_known_colors
[10:44:06] [PASSED] destination_pitch
[10:44:06] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[10:44:06] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[10:44:06] [PASSED] single_pixel_source_buffer
[10:44:06] [PASSED] single_pixel_clip_rectangle
[10:44:06] [PASSED] well_known_colors
[10:44:06] [PASSED] destination_pitch
[10:44:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[10:44:06] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[10:44:06] [PASSED] single_pixel_source_buffer
[10:44:06] [PASSED] single_pixel_clip_rectangle
[10:44:06] [PASSED] well_known_colors
[10:44:06] [PASSED] destination_pitch
[10:44:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[10:44:06] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[10:44:06] [PASSED] single_pixel_source_buffer
[10:44:06] [PASSED] single_pixel_clip_rectangle
[10:44:06] [PASSED] well_known_colors
[10:44:06] [PASSED] destination_pitch
[10:44:06] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[10:44:06] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[10:44:06] [PASSED] single_pixel_source_buffer
[10:44:06] [PASSED] single_pixel_clip_rectangle
[10:44:06] [PASSED] well_known_colors
[10:44:06] [PASSED] destination_pitch
[10:44:06] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[10:44:06] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[10:44:06] [PASSED] single_pixel_source_buffer
[10:44:06] [PASSED] single_pixel_clip_rectangle
[10:44:06] [PASSED] well_known_colors
[10:44:06] [PASSED] destination_pitch
[10:44:06] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[10:44:06] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[10:44:06] [PASSED] single_pixel_source_buffer
[10:44:06] [PASSED] single_pixel_clip_rectangle
[10:44:06] [PASSED] well_known_colors
[10:44:06] [PASSED] destination_pitch
[10:44:06] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[10:44:06] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[10:44:06] [PASSED] single_pixel_source_buffer
[10:44:06] [PASSED] single_pixel_clip_rectangle
[10:44:06] [PASSED] well_known_colors
[10:44:06] [PASSED] destination_pitch
[10:44:06] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[10:44:06] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[10:44:06] [PASSED] single_pixel_source_buffer
[10:44:06] [PASSED] single_pixel_clip_rectangle
[10:44:06] [PASSED] well_known_colors
[10:44:06] [PASSED] destination_pitch
[10:44:06] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[10:44:06] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[10:44:06] [PASSED] single_pixel_source_buffer
[10:44:06] [PASSED] single_pixel_clip_rectangle
[10:44:06] [PASSED] well_known_colors
[10:44:06] [PASSED] destination_pitch
[10:44:06] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[10:44:06] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[10:44:06] [PASSED] single_pixel_source_buffer
[10:44:06] [PASSED] single_pixel_clip_rectangle
[10:44:06] [PASSED] well_known_colors
[10:44:06] [PASSED] destination_pitch
[10:44:06] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[10:44:06] ============== drm_test_fb_xrgb8888_to_mono  ===============
[10:44:06] [PASSED] single_pixel_source_buffer
[10:44:06] [PASSED] single_pixel_clip_rectangle
[10:44:06] [PASSED] well_known_colors
[10:44:06] [PASSED] destination_pitch
[10:44:06] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[10:44:06] ==================== drm_test_fb_swab  =====================
[10:44:06] [PASSED] single_pixel_source_buffer
[10:44:06] [PASSED] single_pixel_clip_rectangle
[10:44:06] [PASSED] well_known_colors
[10:44:06] [PASSED] destination_pitch
[10:44:06] ================ [PASSED] drm_test_fb_swab =================
[10:44:06] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[10:44:06] [PASSED] single_pixel_source_buffer
[10:44:06] [PASSED] single_pixel_clip_rectangle
[10:44:06] [PASSED] well_known_colors
[10:44:06] [PASSED] destination_pitch
[10:44:06] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[10:44:06] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[10:44:06] [PASSED] single_pixel_source_buffer
[10:44:06] [PASSED] single_pixel_clip_rectangle
[10:44:06] [PASSED] well_known_colors
[10:44:06] [PASSED] destination_pitch
[10:44:06] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[10:44:06] ================= drm_test_fb_clip_offset  =================
[10:44:06] [PASSED] pass through
[10:44:06] [PASSED] horizontal offset
[10:44:06] [PASSED] vertical offset
[10:44:06] [PASSED] horizontal and vertical offset
[10:44:06] [PASSED] horizontal offset (custom pitch)
[10:44:06] [PASSED] vertical offset (custom pitch)
[10:44:06] [PASSED] horizontal and vertical offset (custom pitch)
[10:44:06] ============= [PASSED] drm_test_fb_clip_offset =============
[10:44:06] =================== drm_test_fb_memcpy  ====================
[10:44:06] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[10:44:06] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[10:44:06] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[10:44:06] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[10:44:06] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[10:44:06] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[10:44:06] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[10:44:06] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[10:44:06] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[10:44:06] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[10:44:06] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[10:44:06] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[10:44:06] =============== [PASSED] drm_test_fb_memcpy ================
[10:44:06] ============= [PASSED] drm_format_helper_test ==============
[10:44:06] ================= drm_format (18 subtests) =================
[10:44:06] [PASSED] drm_test_format_block_width_invalid
[10:44:06] [PASSED] drm_test_format_block_width_one_plane
[10:44:06] [PASSED] drm_test_format_block_width_two_plane
[10:44:06] [PASSED] drm_test_format_block_width_three_plane
[10:44:06] [PASSED] drm_test_format_block_width_tiled
[10:44:06] [PASSED] drm_test_format_block_height_invalid
[10:44:06] [PASSED] drm_test_format_block_height_one_plane
[10:44:06] [PASSED] drm_test_format_block_height_two_plane
[10:44:06] [PASSED] drm_test_format_block_height_three_plane
[10:44:06] [PASSED] drm_test_format_block_height_tiled
[10:44:06] [PASSED] drm_test_format_min_pitch_invalid
[10:44:06] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[10:44:06] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[10:44:06] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[10:44:06] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[10:44:06] [PASSED] drm_test_format_min_pitch_two_plane
[10:44:06] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[10:44:06] [PASSED] drm_test_format_min_pitch_tiled
[10:44:06] =================== [PASSED] drm_format ====================
[10:44:06] ============== drm_framebuffer (10 subtests) ===============
[10:44:06] ========== drm_test_framebuffer_check_src_coords  ==========
[10:44:06] [PASSED] Success: source fits into fb
[10:44:06] [PASSED] Fail: overflowing fb with x-axis coordinate
[10:44:06] [PASSED] Fail: overflowing fb with y-axis coordinate
[10:44:06] [PASSED] Fail: overflowing fb with source width
[10:44:06] [PASSED] Fail: overflowing fb with source height
[10:44:06] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[10:44:06] [PASSED] drm_test_framebuffer_cleanup
[10:44:06] =============== drm_test_framebuffer_create  ===============
[10:44:06] [PASSED] ABGR8888 normal sizes
[10:44:06] [PASSED] ABGR8888 max sizes
[10:44:06] [PASSED] ABGR8888 pitch greater than min required
[10:44:06] [PASSED] ABGR8888 pitch less than min required
[10:44:06] [PASSED] ABGR8888 Invalid width
[10:44:06] [PASSED] ABGR8888 Invalid buffer handle
[10:44:06] [PASSED] No pixel format
[10:44:06] [PASSED] ABGR8888 Width 0
[10:44:06] [PASSED] ABGR8888 Height 0
[10:44:06] [PASSED] ABGR8888 Out of bound height * pitch combination
[10:44:06] [PASSED] ABGR8888 Large buffer offset
[10:44:06] [PASSED] ABGR8888 Buffer offset for inexistent plane
[10:44:06] [PASSED] ABGR8888 Invalid flag
[10:44:06] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[10:44:06] [PASSED] ABGR8888 Valid buffer modifier
[10:44:06] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[10:44:06] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[10:44:06] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[10:44:06] [PASSED] NV12 Normal sizes
[10:44:06] [PASSED] NV12 Max sizes
[10:44:06] [PASSED] NV12 Invalid pitch
[10:44:06] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[10:44:06] [PASSED] NV12 different  modifier per-plane
[10:44:06] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[10:44:06] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[10:44:06] [PASSED] NV12 Modifier for inexistent plane
[10:44:06] [PASSED] NV12 Handle for inexistent plane
[10:44:06] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[10:44:06] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[10:44:06] [PASSED] YVU420 Normal sizes
[10:44:06] [PASSED] YVU420 Max sizes
[10:44:06] [PASSED] YVU420 Invalid pitch
[10:44:06] [PASSED] YVU420 Different pitches
[10:44:06] [PASSED] YVU420 Different buffer offsets/pitches
[10:44:06] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[10:44:06] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[10:44:06] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[10:44:06] [PASSED] YVU420 Valid modifier
[10:44:06] [PASSED] YVU420 Different modifiers per plane
[10:44:06] [PASSED] YVU420 Modifier for inexistent plane
[10:44:06] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[10:44:06] [PASSED] X0L2 Normal sizes
[10:44:06] [PASSED] X0L2 Max sizes
[10:44:06] [PASSED] X0L2 Invalid pitch
[10:44:06] [PASSED] X0L2 Pitch greater than minimum required
[10:44:06] [PASSED] X0L2 Handle for inexistent plane
[10:44:06] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[10:44:06] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[10:44:06] [PASSED] X0L2 Valid modifier
[10:44:06] [PASSED] X0L2 Modifier for inexistent plane
[10:44:06] =========== [PASSED] drm_test_framebuffer_create ===========
[10:44:06] [PASSED] drm_test_framebuffer_free
[10:44:06] [PASSED] drm_test_framebuffer_init
[10:44:06] [PASSED] drm_test_framebuffer_init_bad_format
[10:44:06] [PASSED] drm_test_framebuffer_init_dev_mismatch
[10:44:06] [PASSED] drm_test_framebuffer_lookup
[10:44:06] [PASSED] drm_test_framebuffer_lookup_inexistent
[10:44:06] [PASSED] drm_test_framebuffer_modifiers_not_supported
[10:44:06] ================= [PASSED] drm_framebuffer =================
[10:44:06] ================ drm_gem_shmem (8 subtests) ================
[10:44:06] [PASSED] drm_gem_shmem_test_obj_create
[10:44:06] [PASSED] drm_gem_shmem_test_obj_create_private
[10:44:06] [PASSED] drm_gem_shmem_test_pin_pages
[10:44:06] [PASSED] drm_gem_shmem_test_vmap
[10:44:06] [PASSED] drm_gem_shmem_test_get_sg_table
[10:44:06] [PASSED] drm_gem_shmem_test_get_pages_sgt
[10:44:06] [PASSED] drm_gem_shmem_test_madvise
[10:44:06] [PASSED] drm_gem_shmem_test_purge
[10:44:06] ================== [PASSED] drm_gem_shmem ==================
[10:44:06] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[10:44:06] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[10:44:06] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[10:44:06] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[10:44:06] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[10:44:06] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[10:44:06] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[10:44:06] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[10:44:06] [PASSED] Automatic
[10:44:06] [PASSED] Full
[10:44:06] [PASSED] Limited 16:235
[10:44:06] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[10:44:06] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[10:44:06] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[10:44:06] [PASSED] drm_test_check_disable_connector
[10:44:06] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[10:44:06] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[10:44:06] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[10:44:06] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[10:44:06] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[10:44:06] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[10:44:06] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[10:44:06] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[10:44:06] [PASSED] drm_test_check_output_bpc_dvi
[10:44:06] [PASSED] drm_test_check_output_bpc_format_vic_1
[10:44:06] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[10:44:06] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[10:44:06] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[10:44:06] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[10:44:06] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[10:44:06] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[10:44:06] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[10:44:06] ============ drm_test_check_hdmi_color_format  =============
[10:44:06] [PASSED] AUTO -> RGB
[10:44:06] [PASSED] YCBCR422 -> YUV422
[10:44:06] [PASSED] YCBCR420 -> YUV420
[10:44:06] [PASSED] YCBCR444 -> YUV444
[10:44:06] [PASSED] RGB -> RGB
[10:44:06] ======== [PASSED] drm_test_check_hdmi_color_format =========
[10:44:06] ======== drm_test_check_hdmi_color_format_420_only  ========
[10:44:06] [PASSED] RGB should fail
[10:44:06] [PASSED] YUV444 should fail
[10:44:06] [PASSED] YUV422 should fail
[10:44:06] [PASSED] YUV420 should work
[10:44:06] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[10:44:06] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[10:44:06] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[10:44:06] [PASSED] drm_test_check_broadcast_rgb_value
[10:44:06] [PASSED] drm_test_check_bpc_8_value
[10:44:06] [PASSED] drm_test_check_bpc_10_value
[10:44:06] [PASSED] drm_test_check_bpc_12_value
[10:44:06] [PASSED] drm_test_check_format_value
[10:44:06] [PASSED] drm_test_check_tmds_char_value
[10:44:06] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[10:44:06] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[10:44:06] [PASSED] drm_test_check_mode_valid
[10:44:06] [PASSED] drm_test_check_mode_valid_reject
[10:44:06] [PASSED] drm_test_check_mode_valid_reject_rate
[10:44:06] [PASSED] drm_test_check_mode_valid_reject_max_clock
[10:44:06] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[10:44:06] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[10:44:06] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[10:44:06] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[10:44:06] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[10:44:06] [PASSED] drm_test_check_infoframes
[10:44:06] [PASSED] drm_test_check_reject_avi_infoframe
[10:44:06] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[10:44:06] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[10:44:06] [PASSED] drm_test_check_reject_audio_infoframe
[10:44:06] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[10:44:06] ================= drm_managed (2 subtests) =================
[10:44:06] [PASSED] drm_test_managed_release_action
[10:44:06] [PASSED] drm_test_managed_run_action
[10:44:06] =================== [PASSED] drm_managed ===================
[10:44:06] =================== drm_mm (6 subtests) ====================
[10:44:06] [PASSED] drm_test_mm_init
[10:44:06] [PASSED] drm_test_mm_debug
[10:44:06] [PASSED] drm_test_mm_align32
[10:44:06] [PASSED] drm_test_mm_align64
[10:44:06] [PASSED] drm_test_mm_lowest
[10:44:06] [PASSED] drm_test_mm_highest
[10:44:06] ===================== [PASSED] drm_mm ======================
[10:44:06] ============= drm_modes_analog_tv (5 subtests) =============
[10:44:06] [PASSED] drm_test_modes_analog_tv_mono_576i
[10:44:06] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[10:44:06] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[10:44:06] [PASSED] drm_test_modes_analog_tv_pal_576i
[10:44:06] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[10:44:06] =============== [PASSED] drm_modes_analog_tv ===============
[10:44:06] ============== drm_panic_helper (3 subtests) ===============
[10:44:06] ============= drm_test_panic_screen_user_map  ==============
[10:44:06] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[10:44:06] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[10:44:06] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[10:44:06] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[10:44:06] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[10:44:06] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[10:44:06] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[10:44:06] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[10:44:06] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[10:44:06] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[10:44:06] ========= [PASSED] drm_test_panic_screen_user_map ==========
[10:44:06] ============= drm_test_panic_screen_user_page  =============
[10:44:06] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[10:44:06] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[10:44:06] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[10:44:06] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[10:44:06] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[10:44:06] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[10:44:06] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[10:44:06] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[10:44:06] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[10:44:06] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[10:44:06] ========= [PASSED] drm_test_panic_screen_user_page =========
[10:44:06] ========== drm_test_panic_screen_user_set_pixel  ===========
[10:44:06] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[10:44:06] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[10:44:06] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[10:44:06] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[10:44:06] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[10:44:06] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[10:44:06] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[10:44:06] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[10:44:06] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[10:44:06] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[10:44:06] ====== [PASSED] drm_test_panic_screen_user_set_pixel =======
[10:44:06] ================ [PASSED] drm_panic_helper =================
[10:44:06] ============== drm_plane_helper (2 subtests) ===============
[10:44:06] =============== drm_test_check_plane_state  ================
[10:44:06] [PASSED] clipping_simple
[10:44:06] [PASSED] clipping_rotate_reflect
[10:44:06] [PASSED] positioning_simple
[10:44:06] [PASSED] upscaling
[10:44:06] [PASSED] downscaling
[10:44:06] [PASSED] rounding1
[10:44:06] [PASSED] rounding2
[10:44:06] [PASSED] rounding3
[10:44:06] [PASSED] rounding4
[10:44:06] =========== [PASSED] drm_test_check_plane_state ============
[10:44:06] =========== drm_test_check_invalid_plane_state  ============
[10:44:06] [PASSED] positioning_invalid
[10:44:06] [PASSED] upscaling_invalid
[10:44:06] [PASSED] downscaling_invalid
[10:44:06] ======= [PASSED] drm_test_check_invalid_plane_state ========
[10:44:06] ================ [PASSED] drm_plane_helper =================
[10:44:06] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[10:44:06] ====== drm_test_connector_helper_tv_get_modes_check  =======
[10:44:06] [PASSED] None
[10:44:06] [PASSED] PAL
[10:44:06] [PASSED] NTSC
[10:44:06] [PASSED] Both, NTSC Default
[10:44:06] [PASSED] Both, PAL Default
[10:44:06] [PASSED] Both, NTSC Default, with PAL on command-line
[10:44:06] [PASSED] Both, PAL Default, with NTSC on command-line
[10:44:06] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[10:44:06] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[10:44:06] ================== drm_rect (9 subtests) ===================
[10:44:06] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[10:44:06] [PASSED] drm_test_rect_clip_scaled_not_clipped
[10:44:06] [PASSED] drm_test_rect_clip_scaled_clipped
[10:44:06] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[10:44:06] ================= drm_test_rect_intersect  =================
[10:44:06] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[10:44:06] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[10:44:06] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[10:44:06] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[10:44:06] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[10:44:06] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[10:44:06] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[10:44:06] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[10:44:06] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[10:44:06] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[10:44:06] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[10:44:06] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[10:44:06] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[10:44:06] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[10:44:06] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[10:44:06] ============= [PASSED] drm_test_rect_intersect =============
[10:44:06] ================ drm_test_rect_calc_hscale  ================
[10:44:06] [PASSED] normal use
[10:44:06] [PASSED] out of max range
[10:44:06] [PASSED] out of min range
[10:44:06] [PASSED] zero dst
[10:44:06] [PASSED] negative src
[10:44:06] [PASSED] negative dst
[10:44:06] ============ [PASSED] drm_test_rect_calc_hscale ============
[10:44:06] ================ drm_test_rect_calc_vscale  ================
[10:44:06] [PASSED] normal use
[10:44:06] [PASSED] out of max range
[10:44:06] [PASSED] out of min range
[10:44:06] [PASSED] zero dst
[10:44:06] [PASSED] negative src
[10:44:06] [PASSED] negative dst
[10:44:06] ============ [PASSED] drm_test_rect_calc_vscale ============
[10:44:06] ================== drm_test_rect_rotate  ===================
[10:44:06] [PASSED] reflect-x
[10:44:06] [PASSED] reflect-y
[10:44:06] [PASSED] rotate-0
[10:44:06] [PASSED] rotate-90
[10:44:06] [PASSED] rotate-180
[10:44:06] [PASSED] rotate-270
[10:44:06] ============== [PASSED] drm_test_rect_rotate ===============
[10:44:06] ================ drm_test_rect_rotate_inv  =================
[10:44:06] [PASSED] reflect-x
[10:44:06] [PASSED] reflect-y
[10:44:06] [PASSED] rotate-0
[10:44:06] [PASSED] rotate-90
[10:44:06] [PASSED] rotate-180
[10:44:06] [PASSED] rotate-270
[10:44:06] ============ [PASSED] drm_test_rect_rotate_inv =============
[10:44:06] ==================== [PASSED] drm_rect =====================
[10:44:06] ============ drm_sysfb_modeset_test (1 subtest) ============
[10:44:06] ============ drm_test_sysfb_build_fourcc_list  =============
[10:44:06] [PASSED] no native formats
[10:44:06] [PASSED] XRGB8888 as native format
[10:44:06] [PASSED] remove duplicates
[10:44:06] [PASSED] convert alpha formats
[10:44:06] [PASSED] random formats
[10:44:06] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[10:44:06] ============= [PASSED] drm_sysfb_modeset_test ==============
[10:44:06] ================== drm_fixp (2 subtests) ===================
[10:44:06] [PASSED] drm_test_int2fixp
[10:44:06] [PASSED] drm_test_sm2fixp
[10:44:06] ==================== [PASSED] drm_fixp =====================
[10:44:06] ============================================================
[10:44:06] Testing complete. Ran 667 tests: passed: 667
[10:44:06] Elapsed time: 27.203s total, 1.890s configuring, 24.848s building, 0.413s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[10:44:07] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:44:08] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[10:44:18] Starting KUnit Kernel (1/1)...
[10:44:18] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:44:18] ================= ttm_device (5 subtests) ==================
[10:44:18] [PASSED] ttm_device_init_basic
[10:44:18] [PASSED] ttm_device_init_multiple
[10:44:18] [PASSED] ttm_device_fini_basic
[10:44:18] [PASSED] ttm_device_init_no_vma_man
[10:44:18] ================== ttm_device_init_pools  ==================
[10:44:18] [PASSED] No DMA allocations, no DMA32 required
[10:44:18] [PASSED] DMA allocations, DMA32 required
[10:44:18] [PASSED] No DMA allocations, DMA32 required
[10:44:18] [PASSED] DMA allocations, no DMA32 required
[10:44:18] ============== [PASSED] ttm_device_init_pools ==============
[10:44:18] =================== [PASSED] ttm_device ====================
[10:44:18] ================== ttm_pool (8 subtests) ===================
[10:44:18] ================== ttm_pool_alloc_basic  ===================
[10:44:18] [PASSED] One page
[10:44:18] [PASSED] More than one page
[10:44:18] [PASSED] Above the allocation limit
[10:44:18] [PASSED] One page, with coherent DMA mappings enabled
[10:44:18] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[10:44:18] ============== [PASSED] ttm_pool_alloc_basic ===============
[10:44:18] ============== ttm_pool_alloc_basic_dma_addr  ==============
[10:44:18] [PASSED] One page
[10:44:18] [PASSED] More than one page
[10:44:18] [PASSED] Above the allocation limit
[10:44:18] [PASSED] One page, with coherent DMA mappings enabled
[10:44:18] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[10:44:18] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[10:44:18] [PASSED] ttm_pool_alloc_order_caching_match
[10:44:18] [PASSED] ttm_pool_alloc_caching_mismatch
[10:44:18] [PASSED] ttm_pool_alloc_order_mismatch
[10:44:18] [PASSED] ttm_pool_free_dma_alloc
[10:44:18] [PASSED] ttm_pool_free_no_dma_alloc
[10:44:18] [PASSED] ttm_pool_fini_basic
[10:44:18] ==================== [PASSED] ttm_pool =====================
[10:44:18] ================ ttm_resource (8 subtests) =================
[10:44:18] ================= ttm_resource_init_basic  =================
[10:44:18] [PASSED] Init resource in TTM_PL_SYSTEM
[10:44:18] [PASSED] Init resource in TTM_PL_VRAM
[10:44:18] [PASSED] Init resource in a private placement
[10:44:18] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[10:44:18] ============= [PASSED] ttm_resource_init_basic =============
[10:44:18] [PASSED] ttm_resource_init_pinned
[10:44:18] [PASSED] ttm_resource_fini_basic
[10:44:18] [PASSED] ttm_resource_manager_init_basic
[10:44:18] [PASSED] ttm_resource_manager_usage_basic
[10:44:18] [PASSED] ttm_resource_manager_set_used_basic
[10:44:18] [PASSED] ttm_sys_man_alloc_basic
[10:44:18] [PASSED] ttm_sys_man_free_basic
[10:44:18] ================== [PASSED] ttm_resource ===================
[10:44:18] =================== ttm_tt (15 subtests) ===================
[10:44:18] ==================== ttm_tt_init_basic  ====================
[10:44:18] [PASSED] Page-aligned size
[10:44:18] [PASSED] Extra pages requested
[10:44:18] ================ [PASSED] ttm_tt_init_basic ================
[10:44:18] [PASSED] ttm_tt_init_misaligned
[10:44:18] [PASSED] ttm_tt_fini_basic
[10:44:18] [PASSED] ttm_tt_fini_sg
[10:44:18] [PASSED] ttm_tt_fini_shmem
[10:44:18] [PASSED] ttm_tt_create_basic
[10:44:18] [PASSED] ttm_tt_create_invalid_bo_type
[10:44:18] [PASSED] ttm_tt_create_ttm_exists
[10:44:18] [PASSED] ttm_tt_create_failed
[10:44:18] [PASSED] ttm_tt_destroy_basic
[10:44:18] [PASSED] ttm_tt_populate_null_ttm
[10:44:18] [PASSED] ttm_tt_populate_populated_ttm
[10:44:18] [PASSED] ttm_tt_unpopulate_basic
[10:44:18] [PASSED] ttm_tt_unpopulate_empty_ttm
[10:44:18] [PASSED] ttm_tt_swapin_basic
[10:44:18] ===================== [PASSED] ttm_tt ======================
[10:44:18] =================== ttm_bo (14 subtests) ===================
[10:44:18] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[10:44:18] [PASSED] Cannot be interrupted and sleeps
[10:44:18] [PASSED] Cannot be interrupted, locks straight away
[10:44:18] [PASSED] Can be interrupted, sleeps
[10:44:18] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[10:44:18] [PASSED] ttm_bo_reserve_locked_no_sleep
[10:44:18] [PASSED] ttm_bo_reserve_no_wait_ticket
[10:44:18] [PASSED] ttm_bo_reserve_double_resv
[10:44:18] [PASSED] ttm_bo_reserve_interrupted
[10:44:18] [PASSED] ttm_bo_reserve_deadlock
[10:44:18] [PASSED] ttm_bo_unreserve_basic
[10:44:18] [PASSED] ttm_bo_unreserve_pinned
[10:44:18] [PASSED] ttm_bo_unreserve_bulk
[10:44:18] [PASSED] ttm_bo_fini_basic
[10:44:18] [PASSED] ttm_bo_fini_shared_resv
[10:44:18] [PASSED] ttm_bo_pin_basic
[10:44:18] [PASSED] ttm_bo_pin_unpin_resource
[10:44:18] [PASSED] ttm_bo_multiple_pin_one_unpin
[10:44:18] ===================== [PASSED] ttm_bo ======================
[10:44:18] ============== ttm_bo_validate (22 subtests) ===============
[10:44:18] ============== ttm_bo_init_reserved_sys_man  ===============
[10:44:18] [PASSED] Buffer object for userspace
[10:44:18] [PASSED] Kernel buffer object
[10:44:18] [PASSED] Shared buffer object
[10:44:18] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[10:44:18] ============== ttm_bo_init_reserved_mock_man  ==============
[10:44:18] [PASSED] Buffer object for userspace
[10:44:18] [PASSED] Kernel buffer object
[10:44:18] [PASSED] Shared buffer object
[10:44:18] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[10:44:18] [PASSED] ttm_bo_init_reserved_resv
[10:44:18] ================== ttm_bo_validate_basic  ==================
[10:44:18] [PASSED] Buffer object for userspace
[10:44:18] [PASSED] Kernel buffer object
[10:44:18] [PASSED] Shared buffer object
[10:44:18] ============== [PASSED] ttm_bo_validate_basic ==============
[10:44:18] [PASSED] ttm_bo_validate_invalid_placement
[10:44:18] ============= ttm_bo_validate_same_placement  ==============
[10:44:18] [PASSED] System manager
[10:44:18] [PASSED] VRAM manager
[10:44:18] ========= [PASSED] ttm_bo_validate_same_placement ==========
[10:44:18] [PASSED] ttm_bo_validate_failed_alloc
[10:44:18] [PASSED] ttm_bo_validate_pinned
[10:44:18] [PASSED] ttm_bo_validate_busy_placement
[10:44:18] ================ ttm_bo_validate_multihop  =================
[10:44:18] [PASSED] Buffer object for userspace
[10:44:18] [PASSED] Kernel buffer object
[10:44:18] [PASSED] Shared buffer object
[10:44:18] ============ [PASSED] ttm_bo_validate_multihop =============
[10:44:18] ========== ttm_bo_validate_no_placement_signaled  ==========
[10:44:18] [PASSED] Buffer object in system domain, no page vector
[10:44:18] [PASSED] Buffer object in system domain with an existing page vector
[10:44:18] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[10:44:18] ======== ttm_bo_validate_no_placement_not_signaled  ========
[10:44:18] [PASSED] Buffer object for userspace
[10:44:18] [PASSED] Kernel buffer object
[10:44:18] [PASSED] Shared buffer object
[10:44:18] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[10:44:18] [PASSED] ttm_bo_validate_move_fence_signaled
[10:44:18] ========= ttm_bo_validate_move_fence_not_signaled  =========
[10:44:18] [PASSED] Waits for GPU
[10:44:18] [PASSED] Tries to lock straight away
[10:44:18] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[10:44:18] [PASSED] ttm_bo_validate_swapout
[10:44:18] [PASSED] ttm_bo_validate_happy_evict
[10:44:18] [PASSED] ttm_bo_validate_all_pinned_evict
[10:44:18] [PASSED] ttm_bo_validate_allowed_only_evict
[10:44:18] [PASSED] ttm_bo_validate_deleted_evict
[10:44:18] [PASSED] ttm_bo_validate_busy_domain_evict
[10:44:18] [PASSED] ttm_bo_validate_evict_gutting
[10:44:18] [PASSED] ttm_bo_validate_recrusive_evict
[10:44:18] ================= [PASSED] ttm_bo_validate =================
[10:44:18] ============================================================
[10:44:18] Testing complete. Ran 102 tests: passed: 102
[10:44:19] Elapsed time: 11.989s total, 1.813s configuring, 9.961s building, 0.180s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/dma-buf/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[10:44:19] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:44:20] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[10:44:29] Starting KUnit Kernel (1/1)...
[10:44:29] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:44:29] =============== dma-buf-fence (12 subtests) ================
[10:44:29] [PASSED] test_sanitycheck
[10:44:29] [PASSED] test_signaling
[10:44:29] [PASSED] test_add_callback
[10:44:29] [PASSED] test_late_add_callback
[10:44:29] [PASSED] test_rm_callback
[10:44:29] [PASSED] test_late_rm_callback
[10:44:29] [PASSED] test_status
[10:44:29] [PASSED] test_error
[10:44:29] [PASSED] test_wait
[10:44:29] [PASSED] test_wait_timeout
[10:44:29] [PASSED] test_stub
[10:44:29] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[10:44:29] ================== [PASSED] dma-buf-fence ==================
[10:44:29] ============ dma-buf-fence-chain (11 subtests) =============
[10:44:29] [PASSED] test_sanitycheck
[10:44:29] [PASSED] test_find_seqno
[10:44:29] [PASSED] test_find_signaled
[10:44:29] [PASSED] test_find_out_of_order
[10:44:35] [PASSED] test_find_gap
[10:44:35] [PASSED] test_find_race
[10:44:35] [PASSED] test_signal_forward
[10:44:35] [PASSED] test_signal_backward
[10:44:35] [PASSED] test_wait_forward
[10:44:35] [PASSED] test_wait_backward
[10:44:35] [PASSED] test_wait_random
[10:44:35] =============== [PASSED] dma-buf-fence-chain ===============
[10:44:35] ============ dma-buf-fence-unwrap (11 subtests) ============
[10:44:35] [PASSED] test_sanitycheck
[10:44:35] [PASSED] test_unwrap_array
[10:44:35] [PASSED] test_unwrap_chain
[10:44:35] [PASSED] test_unwrap_chain_array
[10:44:35] [PASSED] test_unwrap_merge
[10:44:35] [PASSED] test_unwrap_merge_duplicate
[10:44:35] [PASSED] test_unwrap_merge_seqno
[10:44:35] [PASSED] test_unwrap_merge_order
[10:44:35] [PASSED] test_unwrap_merge_complex
[10:44:35] [PASSED] test_unwrap_merge_complex_seqno
[10:44:35] [PASSED] test_dedup_empty
[10:44:35] ============== [PASSED] dma-buf-fence-unwrap ===============
[10:44:35] ================ dma-buf-resv (5 subtests) =================
[10:44:35] [PASSED] test_sanitycheck
[10:44:35] ===================== test_signaling  ======================
[10:44:35] [PASSED] kernel
[10:44:35] [PASSED] write
[10:44:35] [PASSED] read
[10:44:35] [PASSED] bookkeep
[10:44:35] ================= [PASSED] test_signaling ==================
[10:44:35] ====================== test_for_each  ======================
[10:44:35] [PASSED] kernel
[10:44:35] [PASSED] write
[10:44:35] [PASSED] read
[10:44:35] [PASSED] bookkeep
[10:44:35] ================== [PASSED] test_for_each ==================
[10:44:35] ================= test_for_each_unlocked  ==================
[10:44:35] [PASSED] kernel
[10:44:35] [PASSED] write
[10:44:35] [PASSED] read
[10:44:35] [PASSED] bookkeep
[10:44:35] ============= [PASSED] test_for_each_unlocked ==============
[10:44:35] ===================== test_get_fences  =====================
[10:44:35] [PASSED] kernel
[10:44:35] [PASSED] write
[10:44:35] [PASSED] read
[10:44:35] [PASSED] bookkeep
[10:44:35] ================= [PASSED] test_get_fences =================
[10:44:35] ================== [PASSED] dma-buf-resv ===================
[10:44:35] ============================================================
[10:44:35] Testing complete. Ran 51 tests: passed: 50, skipped: 1
[10:44:35] Elapsed time: 16.070s total, 1.848s configuring, 8.851s building, 5.333s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


