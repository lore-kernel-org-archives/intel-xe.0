Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F47DC98310
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 06:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3435110E711;
	Thu, 24 Sep 2026 06:06:55 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A019B10E711;
 Thu, 24 Sep 2026 06:06:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/i915/display=3A_Couple_of_?=
 =?utf-8?q?DC3co_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Sep 2026 06:06:53 -0000
Message-ID: <179023001364.201188.11614736723615498021@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260924055734.2138787-1-suraj.kandpal@intel.com>
In-Reply-To: <20260924055734.2138787-1-suraj.kandpal@intel.com>
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

Series: drm/i915/display: Couple of DC3co fixes
URL   : https://patchwork.freedesktop.org/series/174867/
State : success

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[06:04:47] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:04:52] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[06:05:13] Starting KUnit Kernel (1/1)...
[06:05:13] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[06:05:13] ============= refcount_interrupt (4 subtests) ==============
[06:05:13] [PASSED] test_single_irq_change
[06:05:13] [PASSED] test_nested_irq_change
[06:05:13] [PASSED] test_multiple_irq_change
[06:05:13] [PASSED] test_irq_save
[06:05:13] =============== [PASSED] refcount_interrupt ================
[06:05:13] ================= gpu_buddy (14 subtests) ==================
[06:05:13] [PASSED] gpu_test_buddy_alloc_limit
[06:05:13] [PASSED] gpu_test_buddy_alloc_optimistic
[06:05:13] [PASSED] gpu_test_buddy_alloc_pessimistic
[06:05:13] [PASSED] gpu_test_buddy_alloc_pathological
[06:05:13] [PASSED] gpu_test_buddy_alloc_contiguous
[06:05:13] [PASSED] gpu_test_buddy_alloc_clear
[06:05:13] [PASSED] gpu_test_buddy_alloc_range
[06:05:13] [PASSED] gpu_test_buddy_alloc_range_bias
[06:05:14] [PASSED] gpu_test_buddy_fragmentation_performance
[06:05:15] [PASSED] gpu_test_buddy_dirty_tracker_performance
[06:05:15] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[06:05:15] [PASSED] gpu_test_buddy_offset_aligned_allocation
[06:05:15] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[06:05:15] [PASSED] gpu_test_buddy_addr_to_block
[06:05:15] ==================== [PASSED] gpu_buddy ====================
[06:05:15] ============================================================
[06:05:15] Testing complete. Ran 18 tests: passed: 18
[06:05:15] Elapsed time: 27.173s total, 4.348s configuring, 20.707s building, 2.047s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[06:05:15] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:05:17] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[06:05:51] Starting KUnit Kernel (1/1)...
[06:05:51] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[06:05:51] ============= refcount_interrupt (4 subtests) ==============
[06:05:51] [PASSED] test_single_irq_change
[06:05:51] [PASSED] test_nested_irq_change
[06:05:51] [PASSED] test_multiple_irq_change
[06:05:51] [PASSED] test_irq_save
[06:05:51] =============== [PASSED] refcount_interrupt ================
[06:05:51] ================== guc_buf (11 subtests) ===================
[06:05:51] [PASSED] test_smallest
[06:05:51] [PASSED] test_largest
[06:05:51] [PASSED] test_granular
[06:05:51] [PASSED] test_unique
[06:05:51] [PASSED] test_overlap
[06:05:51] [PASSED] test_reusable
[06:05:51] [PASSED] test_too_big
[06:05:51] [PASSED] test_flush
[06:05:51] [PASSED] test_lookup
[06:05:51] [PASSED] test_data
[06:05:51] [PASSED] test_class
[06:05:51] ===================== [PASSED] guc_buf =====================
[06:05:51] =================== guc_dbm (7 subtests) ===================
[06:05:51] [PASSED] test_empty
[06:05:51] [PASSED] test_default
[06:05:51] ======================== test_size  ========================
[06:05:51] [PASSED] 4
[06:05:51] [PASSED] 8
[06:05:51] [PASSED] 32
[06:05:51] [PASSED] 256
[06:05:51] ==================== [PASSED] test_size ====================
[06:05:51] ======================= test_reuse  ========================
[06:05:51] [PASSED] 4
[06:05:51] [PASSED] 8
[06:05:51] [PASSED] 32
[06:05:51] [PASSED] 256
[06:05:51] =================== [PASSED] test_reuse ====================
[06:05:51] =================== test_range_overlap  ====================
[06:05:51] [PASSED] 4
[06:05:51] [PASSED] 8
[06:05:51] [PASSED] 32
[06:05:51] [PASSED] 256
[06:05:51] =============== [PASSED] test_range_overlap ================
[06:05:51] =================== test_range_compact  ====================
[06:05:51] [PASSED] 4
[06:05:51] [PASSED] 8
[06:05:51] [PASSED] 32
[06:05:51] [PASSED] 256
[06:05:51] =============== [PASSED] test_range_compact ================
[06:05:51] ==================== test_range_spare  =====================
[06:05:51] [PASSED] 4
[06:05:51] [PASSED] 8
[06:05:51] [PASSED] 32
[06:05:51] [PASSED] 256
[06:05:51] ================ [PASSED] test_range_spare =================
[06:05:51] ===================== [PASSED] guc_dbm =====================
[06:05:51] =================== guc_idm (6 subtests) ===================
[06:05:51] [PASSED] bad_init
[06:05:51] [PASSED] no_init
[06:05:51] [PASSED] init_fini
[06:05:51] [PASSED] check_used
[06:05:51] [PASSED] check_quota
[06:05:51] [PASSED] check_all
[06:05:51] ===================== [PASSED] guc_idm =====================
[06:05:51] ============== guc_klv_helpers (13 subtests) ===============
[06:05:51] [PASSED] test_count
[06:05:51] [PASSED] test_encode_u32
[06:05:51] [PASSED] test_encode_u64
[06:05:51] [PASSED] test_encode_string
[06:05:51] [PASSED] test_encode_object_raw
[06:05:51] [PASSED] test_encode_object_klv
[06:05:51] [PASSED] test_encode_object_nested
[06:05:51] [PASSED] test_encode_object_basic
[06:05:51] ===================== test_decode_u16  =====================
[06:05:51] [PASSED] empty
[06:05:51] [PASSED] valid
[06:05:51] [PASSED] max
[06:05:51] [PASSED] big
[06:05:51] [PASSED] long
[06:05:51] ================= [PASSED] test_decode_u16 =================
[06:05:51] ===================== test_decode_u32  =====================
[06:05:51] [PASSED] empty
[06:05:51] [PASSED] valid
[06:05:51] [PASSED] max
[06:05:51] [PASSED] long
[06:05:51] ================= [PASSED] test_decode_u32 =================
[06:05:51] ===================== test_decode_u64  =====================
[06:05:51] [PASSED] empty
[06:05:51] [PASSED] short
[06:05:51] [PASSED] valid
[06:05:51] [PASSED] max
[06:05:51] [PASSED] long
[06:05:51] ================= [PASSED] test_decode_u64 =================
[06:05:51] ===================== test_decode_str  =====================
[06:05:51] [PASSED] empty
[06:05:51] [PASSED] one
[06:05:51] [PASSED] one_trash
[06:05:51] [PASSED] two
[06:05:51] [PASSED] two_trash
[06:05:51] [PASSED] three
[06:05:51] [PASSED] dword
[06:05:51] [PASSED] four
[06:05:51] [PASSED] five
[06:05:51] [PASSED] six
[06:05:51] [PASSED] seven
[06:05:51] [PASSED] qword
[06:05:51] ================= [PASSED] test_decode_str =================
[06:05:51] [PASSED] test_print
[06:05:51] ================= [PASSED] guc_klv_helpers =================
[06:05:51] =================== xe_log (4 subtests) ====================
[06:05:51] [PASSED] demo_cper
[06:05:51] [PASSED] demo_dmesg
[06:05:51] ======================= test_dmesg  ========================
[06:05:51] [PASSED] test_fatal
[06:05:51] [PASSED] test_fatal_tile
[06:05:51] [PASSED] test_fatal_gt
[06:05:51] [PASSED] test_fatal_comp
[06:05:51] [PASSED] test_fatal_comp_tile
[06:05:51] [PASSED] test_fatal_comp_gt
[06:05:51] [PASSED] test_fatal_all
[06:05:51] [PASSED] test_recoverable
[06:05:51] [PASSED] test_recoverable_tile
[06:05:51] [PASSED] test_recoverable_gt
[06:05:51] [PASSED] test_recoverable_comp
[06:05:51] [PASSED] test_recoverable_comp_tile
[06:05:51] [PASSED] test_recoverable_comp_gt
[06:05:51] [PASSED] test_recoverable_all
[06:05:51] [PASSED] test_info
[06:05:51] [PASSED] test_info_tile
[06:05:51] [PASSED] test_info_gt
[06:05:51] [PASSED] test_info_err
[06:05:51] [PASSED] test_info_comp
[06:05:51] [PASSED] test_info_comp_tile
[06:05:51] [PASSED] test_info_comp_gt
[06:05:51] [PASSED] test_info_all
[06:05:51] [PASSED] test_hw_fatal
[06:05:51] [PASSED] test_hw_recoverable
[06:05:51] [PASSED] test_hw_corrected
[06:05:51] [PASSED] test_hw_informational
[06:05:51] =================== [PASSED] test_dmesg ====================
[06:05:51] ====================== test_invalid  =======================
[06:05:51] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[06:05:51] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[06:05:51] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[06:05:51] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[06:05:51] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[06:05:51] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[06:05:51] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[06:05:51] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[06:05:51] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[06:05:51] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[06:05:51] ================== [SKIPPED] test_invalid ==================
[06:05:51] ===================== [PASSED] xe_log ======================
[06:05:51] ================== no_relay (3 subtests) ===================
[06:05:51] [PASSED] xe_drops_guc2pf_if_not_ready
[06:05:51] [PASSED] xe_drops_guc2vf_if_not_ready
[06:05:51] [PASSED] xe_rejects_send_if_not_ready
[06:05:51] ==================== [PASSED] no_relay =====================
[06:05:51] ================== pf_relay (14 subtests) ==================
[06:05:51] [PASSED] pf_rejects_guc2pf_too_short
[06:05:51] [PASSED] pf_rejects_guc2pf_too_long
[06:05:51] [PASSED] pf_rejects_guc2pf_no_payload
[06:05:51] [PASSED] pf_fails_no_payload
[06:05:51] [PASSED] pf_fails_bad_origin
[06:05:51] [PASSED] pf_fails_bad_type
[06:05:51] [PASSED] pf_txn_reports_error
[06:05:51] [PASSED] pf_txn_sends_pf2guc
[06:05:51] [PASSED] pf_sends_pf2guc
[06:05:51] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[06:05:51] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[06:05:51] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[06:05:51] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[06:05:51] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[06:05:51] ==================== [PASSED] pf_relay =====================
[06:05:51] ================== vf_relay (3 subtests) ===================
[06:05:51] [PASSED] vf_rejects_guc2vf_too_short
[06:05:51] [PASSED] vf_rejects_guc2vf_too_long
[06:05:51] [PASSED] vf_rejects_guc2vf_no_payload
[06:05:51] ==================== [PASSED] vf_relay =====================
[06:05:51] ================ pf_gt_config (9 subtests) =================
[06:05:51] [PASSED] fair_contexts_1vf
[06:05:51] [PASSED] fair_doorbells_1vf
[06:05:51] [PASSED] fair_ggtt_1vf
[06:05:51] ====================== fair_vram_1vf  ======================
[06:05:51] [PASSED] 3.50 GiB
[06:05:51] [PASSED] 11.5 GiB
[06:05:51] [PASSED] 15.5 GiB
[06:05:51] [PASSED] 31.5 GiB
[06:05:51] [PASSED] 63.5 GiB
[06:05:51] [PASSED] 1.91 GiB
[06:05:51] ================== [PASSED] fair_vram_1vf ==================
[06:05:51] ================ fair_vram_1vf_admin_only  =================
[06:05:51] [PASSED] 3.50 GiB
[06:05:51] [PASSED] 11.5 GiB
[06:05:51] [PASSED] 15.5 GiB
[06:05:51] [PASSED] 31.5 GiB
[06:05:51] [PASSED] 63.5 GiB
[06:05:51] [PASSED] 1.91 GiB
[06:05:51] ============ [PASSED] fair_vram_1vf_admin_only =============
[06:05:51] ====================== fair_contexts  ======================
[06:05:51] [PASSED] 1 VF
[06:05:51] [PASSED] 2 VFs
[06:05:51] [PASSED] 3 VFs
[06:05:51] [PASSED] 4 VFs
[06:05:51] [PASSED] 5 VFs
[06:05:51] [PASSED] 6 VFs
[06:05:51] [PASSED] 7 VFs
[06:05:51] [PASSED] 8 VFs
[06:05:51] [PASSED] 9 VFs
[06:05:51] [PASSED] 10 VFs
[06:05:51] [PASSED] 11 VFs
[06:05:51] [PASSED] 12 VFs
[06:05:51] [PASSED] 13 VFs
[06:05:51] [PASSED] 14 VFs
[06:05:51] [PASSED] 15 VFs
[06:05:51] [PASSED] 16 VFs
[06:05:51] [PASSED] 17 VFs
[06:05:51] [PASSED] 18 VFs
[06:05:51] [PASSED] 19 VFs
[06:05:51] [PASSED] 20 VFs
[06:05:51] [PASSED] 21 VFs
[06:05:51] [PASSED] 22 VFs
[06:05:51] [PASSED] 23 VFs
[06:05:51] [PASSED] 24 VFs
[06:05:51] [PASSED] 25 VFs
[06:05:51] [PASSED] 26 VFs
[06:05:51] [PASSED] 27 VFs
[06:05:51] [PASSED] 28 VFs
[06:05:51] [PASSED] 29 VFs
[06:05:51] [PASSED] 30 VFs
[06:05:51] [PASSED] 31 VFs
[06:05:51] [PASSED] 32 VFs
[06:05:51] [PASSED] 33 VFs
[06:05:51] [PASSED] 34 VFs
[06:05:51] [PASSED] 35 VFs
[06:05:51] [PASSED] 36 VFs
[06:05:51] [PASSED] 37 VFs
[06:05:51] [PASSED] 38 VFs
[06:05:51] [PASSED] 39 VFs
[06:05:51] [PASSED] 40 VFs
[06:05:51] [PASSED] 41 VFs
[06:05:51] [PASSED] 42 VFs
[06:05:51] [PASSED] 43 VFs
[06:05:51] [PASSED] 44 VFs
[06:05:51] [PASSED] 45 VFs
[06:05:51] [PASSED] 46 VFs
[06:05:51] [PASSED] 47 VFs
[06:05:51] [PASSED] 48 VFs
[06:05:51] [PASSED] 49 VFs
[06:05:51] [PASSED] 50 VFs
[06:05:51] [PASSED] 51 VFs
[06:05:51] [PASSED] 52 VFs
[06:05:51] [PASSED] 53 VFs
[06:05:51] [PASSED] 54 VFs
[06:05:51] [PASSED] 55 VFs
[06:05:51] [PASSED] 56 VFs
[06:05:51] [PASSED] 57 VFs
[06:05:51] [PASSED] 58 VFs
[06:05:51] [PASSED] 59 VFs
[06:05:51] [PASSED] 60 VFs
[06:05:51] [PASSED] 61 VFs
[06:05:51] [PASSED] 62 VFs
[06:05:51] [PASSED] 63 VFs
[06:05:51] ================== [PASSED] fair_contexts ==================
[06:05:51] ===================== fair_doorbells  ======================
[06:05:51] [PASSED] 1 VF
[06:05:51] [PASSED] 2 VFs
[06:05:51] [PASSED] 3 VFs
[06:05:51] [PASSED] 4 VFs
[06:05:51] [PASSED] 5 VFs
[06:05:51] [PASSED] 6 VFs
[06:05:51] [PASSED] 7 VFs
[06:05:51] [PASSED] 8 VFs
[06:05:51] [PASSED] 9 VFs
[06:05:51] [PASSED] 10 VFs
[06:05:51] [PASSED] 11 VFs
[06:05:51] [PASSED] 12 VFs
[06:05:51] [PASSED] 13 VFs
[06:05:51] [PASSED] 14 VFs
[06:05:51] [PASSED] 15 VFs
[06:05:51] [PASSED] 16 VFs
[06:05:51] [PASSED] 17 VFs
[06:05:51] [PASSED] 18 VFs
[06:05:51] [PASSED] 19 VFs
[06:05:51] [PASSED] 20 VFs
[06:05:51] [PASSED] 21 VFs
[06:05:51] [PASSED] 22 VFs
[06:05:51] [PASSED] 23 VFs
[06:05:51] [PASSED] 24 VFs
[06:05:51] [PASSED] 25 VFs
[06:05:51] [PASSED] 26 VFs
[06:05:51] [PASSED] 27 VFs
[06:05:51] [PASSED] 28 VFs
[06:05:51] [PASSED] 29 VFs
[06:05:51] [PASSED] 30 VFs
[06:05:51] [PASSED] 31 VFs
[06:05:51] [PASSED] 32 VFs
[06:05:51] [PASSED] 33 VFs
[06:05:51] [PASSED] 34 VFs
[06:05:51] [PASSED] 35 VFs
[06:05:51] [PASSED] 36 VFs
[06:05:51] [PASSED] 37 VFs
[06:05:51] [PASSED] 38 VFs
[06:05:51] [PASSED] 39 VFs
[06:05:51] [PASSED] 40 VFs
[06:05:51] [PASSED] 41 VFs
[06:05:51] [PASSED] 42 VFs
[06:05:51] [PASSED] 43 VFs
[06:05:51] [PASSED] 44 VFs
[06:05:51] [PASSED] 45 VFs
[06:05:51] [PASSED] 46 VFs
[06:05:51] [PASSED] 47 VFs
[06:05:51] [PASSED] 48 VFs
[06:05:51] [PASSED] 49 VFs
[06:05:51] [PASSED] 50 VFs
[06:05:51] [PASSED] 51 VFs
[06:05:51] [PASSED] 52 VFs
[06:05:51] [PASSED] 53 VFs
[06:05:51] [PASSED] 54 VFs
[06:05:51] [PASSED] 55 VFs
[06:05:51] [PASSED] 56 VFs
[06:05:51] [PASSED] 57 VFs
[06:05:51] [PASSED] 58 VFs
[06:05:51] [PASSED] 59 VFs
[06:05:51] [PASSED] 60 VFs
[06:05:51] [PASSED] 61 VFs
[06:05:51] [PASSED] 62 VFs
[06:05:51] [PASSED] 63 VFs
[06:05:51] ================= [PASSED] fair_doorbells ==================
[06:05:51] ======================== fair_ggtt  ========================
[06:05:51] [PASSED] 1 VF
[06:05:51] [PASSED] 2 VFs
[06:05:51] [PASSED] 3 VFs
[06:05:51] [PASSED] 4 VFs
[06:05:51] [PASSED] 5 VFs
[06:05:51] [PASSED] 6 VFs
[06:05:51] [PASSED] 7 VFs
[06:05:51] [PASSED] 8 VFs
[06:05:51] [PASSED] 9 VFs
[06:05:51] [PASSED] 10 VFs
[06:05:51] [PASSED] 11 VFs
[06:05:51] [PASSED] 12 VFs
[06:05:51] [PASSED] 13 VFs
[06:05:51] [PASSED] 14 VFs
[06:05:51] [PASSED] 15 VFs
[06:05:51] [PASSED] 16 VFs
[06:05:51] [PASSED] 17 VFs
[06:05:51] [PASSED] 18 VFs
[06:05:51] [PASSED] 19 VFs
[06:05:51] [PASSED] 20 VFs
[06:05:51] [PASSED] 21 VFs
[06:05:51] [PASSED] 22 VFs
[06:05:51] [PASSED] 23 VFs
[06:05:51] [PASSED] 24 VFs
[06:05:51] [PASSED] 25 VFs
[06:05:51] [PASSED] 26 VFs
[06:05:51] [PASSED] 27 VFs
[06:05:51] [PASSED] 28 VFs
[06:05:51] [PASSED] 29 VFs
[06:05:51] [PASSED] 30 VFs
[06:05:51] [PASSED] 31 VFs
[06:05:51] [PASSED] 32 VFs
[06:05:51] [PASSED] 33 VFs
[06:05:51] [PASSED] 34 VFs
[06:05:51] [PASSED] 35 VFs
[06:05:51] [PASSED] 36 VFs
[06:05:51] [PASSED] 37 VFs
[06:05:51] [PASSED] 38 VFs
[06:05:51] [PASSED] 39 VFs
[06:05:51] [PASSED] 40 VFs
[06:05:51] [PASSED] 41 VFs
[06:05:51] [PASSED] 42 VFs
[06:05:51] [PASSED] 43 VFs
[06:05:51] [PASSED] 44 VFs
[06:05:51] [PASSED] 45 VFs
[06:05:51] [PASSED] 46 VFs
[06:05:51] [PASSED] 47 VFs
[06:05:52] [PASSED] 48 VFs
[06:05:52] [PASSED] 49 VFs
[06:05:52] [PASSED] 50 VFs
[06:05:52] [PASSED] 51 VFs
[06:05:52] [PASSED] 52 VFs
[06:05:52] [PASSED] 53 VFs
[06:05:52] [PASSED] 54 VFs
[06:05:52] [PASSED] 55 VFs
[06:05:52] [PASSED] 56 VFs
[06:05:52] [PASSED] 57 VFs
[06:05:52] [PASSED] 58 VFs
[06:05:52] [PASSED] 59 VFs
[06:05:52] [PASSED] 60 VFs
[06:05:52] [PASSED] 61 VFs
[06:05:52] [PASSED] 62 VFs
[06:05:52] [PASSED] 63 VFs
[06:05:52] ==================== [PASSED] fair_ggtt ====================
[06:05:52] ======================== fair_vram  ========================
[06:05:52] [PASSED] 1 VF
[06:05:52] [PASSED] 2 VFs
[06:05:52] [PASSED] 3 VFs
[06:05:52] [PASSED] 4 VFs
[06:05:52] [PASSED] 5 VFs
[06:05:52] [PASSED] 6 VFs
[06:05:52] [PASSED] 7 VFs
[06:05:52] [PASSED] 8 VFs
[06:05:52] [PASSED] 9 VFs
[06:05:52] [PASSED] 10 VFs
[06:05:52] [PASSED] 11 VFs
[06:05:52] [PASSED] 12 VFs
[06:05:52] [PASSED] 13 VFs
[06:05:52] [PASSED] 14 VFs
[06:05:52] [PASSED] 15 VFs
[06:05:52] [PASSED] 16 VFs
[06:05:52] [PASSED] 17 VFs
[06:05:52] [PASSED] 18 VFs
[06:05:52] [PASSED] 19 VFs
[06:05:52] [PASSED] 20 VFs
[06:05:52] [PASSED] 21 VFs
[06:05:52] [PASSED] 22 VFs
[06:05:52] [PASSED] 23 VFs
[06:05:52] [PASSED] 24 VFs
[06:05:52] [PASSED] 25 VFs
[06:05:52] [PASSED] 26 VFs
[06:05:52] [PASSED] 27 VFs
[06:05:52] [PASSED] 28 VFs
[06:05:52] [PASSED] 29 VFs
[06:05:52] [PASSED] 30 VFs
[06:05:52] [PASSED] 31 VFs
[06:05:52] [PASSED] 32 VFs
[06:05:52] [PASSED] 33 VFs
[06:05:52] [PASSED] 34 VFs
[06:05:52] [PASSED] 35 VFs
[06:05:52] [PASSED] 36 VFs
[06:05:52] [PASSED] 37 VFs
[06:05:52] [PASSED] 38 VFs
[06:05:52] [PASSED] 39 VFs
[06:05:52] [PASSED] 40 VFs
[06:05:52] [PASSED] 41 VFs
[06:05:52] [PASSED] 42 VFs
[06:05:52] [PASSED] 43 VFs
[06:05:52] [PASSED] 44 VFs
[06:05:52] [PASSED] 45 VFs
[06:05:52] [PASSED] 46 VFs
[06:05:52] [PASSED] 47 VFs
[06:05:52] [PASSED] 48 VFs
[06:05:52] [PASSED] 49 VFs
[06:05:52] [PASSED] 50 VFs
[06:05:52] [PASSED] 51 VFs
[06:05:52] [PASSED] 52 VFs
[06:05:52] [PASSED] 53 VFs
[06:05:52] [PASSED] 54 VFs
[06:05:52] [PASSED] 55 VFs
[06:05:52] [PASSED] 56 VFs
[06:05:52] [PASSED] 57 VFs
[06:05:52] [PASSED] 58 VFs
[06:05:52] [PASSED] 59 VFs
[06:05:52] [PASSED] 60 VFs
[06:05:52] [PASSED] 61 VFs
[06:05:52] [PASSED] 62 VFs
[06:05:52] [PASSED] 63 VFs
[06:05:52] ==================== [PASSED] fair_vram ====================
[06:05:52] ================== [PASSED] pf_gt_config ===================
[06:05:52] ===================== lmtt (1 subtest) =====================
[06:05:52] ======================== test_ops  =========================
[06:05:52] [PASSED] 2-level
[06:05:52] [PASSED] multi-level
[06:05:52] ==================== [PASSED] test_ops =====================
[06:05:52] ====================== [PASSED] lmtt =======================
[06:05:52] ================= sriov_packet (1 subtest) =================
[06:05:52] [PASSED] test_descriptor_init
[06:05:52] ================== [PASSED] sriov_packet ===================
[06:05:52] ================= pf_service (11 subtests) =================
[06:05:52] [PASSED] pf_negotiate_any
[06:05:52] [PASSED] pf_negotiate_base_match
[06:05:52] [PASSED] pf_negotiate_base_newer
[06:05:52] [PASSED] pf_negotiate_base_next
[06:05:52] [SKIPPED] pf_negotiate_base_older (no older minor)
[06:05:52] [PASSED] pf_negotiate_base_prev
[06:05:52] [PASSED] pf_negotiate_latest_match
[06:05:52] [PASSED] pf_negotiate_latest_newer
[06:05:52] [PASSED] pf_negotiate_latest_next
[06:05:52] [SKIPPED] pf_negotiate_latest_older (no older minor)
[06:05:52] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[06:05:52] =================== [PASSED] pf_service ====================
[06:05:52] ================= xe_guc_g2g (2 subtests) ==================
[06:05:52] ============== xe_live_guc_g2g_kunit_default  ==============
[06:05:52] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[06:05:52] ============== xe_live_guc_g2g_kunit_allmem  ===============
[06:05:52] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[06:05:52] =================== [SKIPPED] xe_guc_g2g ===================
[06:05:52] =================== xe_mocs (2 subtests) ===================
[06:05:52] ================ xe_live_mocs_kernel_kunit  ================
[06:05:52] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[06:05:52] ================ xe_live_mocs_reset_kunit  =================
[06:05:52] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[06:05:52] ==================== [SKIPPED] xe_mocs =====================
[06:05:52] ================= xe_migrate (2 subtests) ==================
[06:05:52] ================= xe_migrate_sanity_kunit  =================
[06:05:52] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[06:05:52] ================== xe_validate_ccs_kunit  ==================
[06:05:52] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[06:05:52] =================== [SKIPPED] xe_migrate ===================
[06:05:52] ================== xe_dma_buf (1 subtest) ==================
[06:05:52] ==================== xe_dma_buf_kunit  =====================
[06:05:52] ================ [SKIPPED] xe_dma_buf_kunit ================
[06:05:52] =================== [SKIPPED] xe_dma_buf ===================
[06:05:52] ================= xe_bo_shrink (1 subtest) =================
[06:05:52] =================== xe_bo_shrink_kunit  ====================
[06:05:52] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[06:05:52] ================== [SKIPPED] xe_bo_shrink ==================
[06:05:52] ==================== xe_bo (2 subtests) ====================
[06:05:52] ================== xe_ccs_migrate_kunit  ===================
[06:05:52] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[06:05:52] ==================== xe_bo_evict_kunit  ====================
[06:05:52] =============== [SKIPPED] xe_bo_evict_kunit ================
[06:05:52] ===================== [SKIPPED] xe_bo ======================
[06:05:52] =================== xe_any (9 subtests) ====================
[06:05:52] [PASSED] test_to_xe
[06:05:52] [PASSED] test_to_dev
[06:05:52] [PASSED] test_to_pdev
[06:05:52] [PASSED] test_to_drm
[06:05:52] [PASSED] test_if_pdev
[06:05:52] [PASSED] test_if_xe
[06:05:52] [PASSED] test_if_tile
[06:05:52] [PASSED] test_if_gt
[06:05:52] [PASSED] test_to_id
[06:05:52] ===================== [PASSED] xe_any ======================
[06:05:52] ==================== args (13 subtests) ====================
[06:05:52] [PASSED] count_args_test
[06:05:52] [PASSED] call_args_example
[06:05:52] [PASSED] call_args_test
[06:05:52] [PASSED] drop_first_arg_example
[06:05:52] [PASSED] drop_first_arg_test
[06:05:52] [PASSED] first_arg_example
[06:05:52] [PASSED] first_arg_test
[06:05:52] [PASSED] last_arg_example
[06:05:52] [PASSED] last_arg_test
[06:05:52] [PASSED] pick_arg_example
[06:05:52] [PASSED] if_args_example
[06:05:52] [PASSED] if_args_test
[06:05:52] [PASSED] sep_comma_example
[06:05:52] ====================== [PASSED] args =======================
[06:05:52] =================== xe_pci (3 subtests) ====================
[06:05:52] ==================== check_graphics_ip  ====================
[06:05:52] [PASSED] 12.00 Xe_LP
[06:05:52] [PASSED] 12.10 Xe_LP+
[06:05:52] [PASSED] 12.55 Xe_HPG
[06:05:52] [PASSED] 12.60 Xe_HPC
[06:05:52] [PASSED] 12.70 Xe_LPG
[06:05:52] [PASSED] 12.71 Xe_LPG
[06:05:52] [PASSED] 12.74 Xe_LPG+
[06:05:52] [PASSED] 20.01 Xe2_HPG
[06:05:52] [PASSED] 20.02 Xe2_HPG
[06:05:52] [PASSED] 20.04 Xe2_LPG
[06:05:52] [PASSED] 30.00 Xe3_LPG
[06:05:52] [PASSED] 30.01 Xe3_LPG
[06:05:52] [PASSED] 30.03 Xe3_LPG
[06:05:52] [PASSED] 30.04 Xe3_LPG
[06:05:52] [PASSED] 30.05 Xe3_LPG
[06:05:52] [PASSED] 35.10 Xe3p_LPG
[06:05:52] [PASSED] 35.11 Xe3p_XPC
[06:05:52] ================ [PASSED] check_graphics_ip ================
[06:05:52] ===================== check_media_ip  ======================
[06:05:52] [PASSED] 12.00 Xe_M
[06:05:52] [PASSED] 12.55 Xe_HPM
[06:05:52] [PASSED] 13.00 Xe_LPM+
[06:05:52] [PASSED] 13.01 Xe2_HPM
[06:05:52] [PASSED] 20.00 Xe2_LPM
[06:05:52] [PASSED] 30.00 Xe3_LPM
[06:05:52] [PASSED] 30.02 Xe3_LPM
[06:05:52] [PASSED] 35.00 Xe3p_LPM
[06:05:52] [PASSED] 35.03 Xe3p_HPM
[06:05:52] ================= [PASSED] check_media_ip ==================
[06:05:52] =================== check_platform_desc  ===================
[06:05:52] [PASSED] 0x9A60 (TIGERLAKE)
[06:05:52] [PASSED] 0x9A68 (TIGERLAKE)
[06:05:52] [PASSED] 0x9A70 (TIGERLAKE)
[06:05:52] [PASSED] 0x9A40 (TIGERLAKE)
[06:05:52] [PASSED] 0x9A49 (TIGERLAKE)
[06:05:52] [PASSED] 0x9A59 (TIGERLAKE)
[06:05:52] [PASSED] 0x9A78 (TIGERLAKE)
[06:05:52] [PASSED] 0x9AC0 (TIGERLAKE)
[06:05:52] [PASSED] 0x9AC9 (TIGERLAKE)
[06:05:52] [PASSED] 0x9AD9 (TIGERLAKE)
[06:05:52] [PASSED] 0x9AF8 (TIGERLAKE)
[06:05:52] [PASSED] 0x4C80 (ROCKETLAKE)
[06:05:52] [PASSED] 0x4C8A (ROCKETLAKE)
[06:05:52] [PASSED] 0x4C8B (ROCKETLAKE)
[06:05:52] [PASSED] 0x4C8C (ROCKETLAKE)
[06:05:52] [PASSED] 0x4C90 (ROCKETLAKE)
[06:05:52] [PASSED] 0x4C9A (ROCKETLAKE)
[06:05:52] [PASSED] 0x4680 (ALDERLAKE_S)
[06:05:52] [PASSED] 0x4682 (ALDERLAKE_S)
[06:05:52] [PASSED] 0x4688 (ALDERLAKE_S)
[06:05:52] [PASSED] 0x468A (ALDERLAKE_S)
[06:05:52] [PASSED] 0x468B (ALDERLAKE_S)
[06:05:52] [PASSED] 0x4690 (ALDERLAKE_S)
[06:05:52] [PASSED] 0x4692 (ALDERLAKE_S)
[06:05:52] [PASSED] 0x4693 (ALDERLAKE_S)
[06:05:52] [PASSED] 0x46A0 (ALDERLAKE_P)
[06:05:52] [PASSED] 0x46A1 (ALDERLAKE_P)
[06:05:52] [PASSED] 0x46A2 (ALDERLAKE_P)
[06:05:52] [PASSED] 0x46A3 (ALDERLAKE_P)
[06:05:52] [PASSED] 0x46A6 (ALDERLAKE_P)
[06:05:52] [PASSED] 0x46A8 (ALDERLAKE_P)
[06:05:52] [PASSED] 0x46AA (ALDERLAKE_P)
[06:05:52] [PASSED] 0x462A (ALDERLAKE_P)
[06:05:52] [PASSED] 0x4626 (ALDERLAKE_P)
[06:05:52] [PASSED] 0x4628 (ALDERLAKE_P)
[06:05:52] [PASSED] 0x46B0 (ALDERLAKE_P)
[06:05:52] [PASSED] 0x46B1 (ALDERLAKE_P)
[06:05:52] [PASSED] 0x46B2 (ALDERLAKE_P)
[06:05:52] [PASSED] 0x46B3 (ALDERLAKE_P)
[06:05:52] [PASSED] 0x46C0 (ALDERLAKE_P)
[06:05:52] [PASSED] 0x46C1 (ALDERLAKE_P)
[06:05:52] [PASSED] 0x46C2 (ALDERLAKE_P)
[06:05:52] [PASSED] 0x46C3 (ALDERLAKE_P)
[06:05:52] [PASSED] 0x46D0 (ALDERLAKE_N)
[06:05:52] [PASSED] 0x46D1 (ALDERLAKE_N)
[06:05:52] [PASSED] 0x46D2 (ALDERLAKE_N)
[06:05:52] [PASSED] 0x46D3 (ALDERLAKE_N)
[06:05:52] [PASSED] 0x46D4 (ALDERLAKE_N)
[06:05:52] [PASSED] 0xA721 (ALDERLAKE_P)
[06:05:52] [PASSED] 0xA7A1 (ALDERLAKE_P)
[06:05:52] [PASSED] 0xA7A9 (ALDERLAKE_P)
[06:05:52] [PASSED] 0xA7AC (ALDERLAKE_P)
[06:05:52] [PASSED] 0xA7AD (ALDERLAKE_P)
[06:05:52] [PASSED] 0xA720 (ALDERLAKE_P)
[06:05:52] [PASSED] 0xA7A0 (ALDERLAKE_P)
[06:05:52] [PASSED] 0xA7A8 (ALDERLAKE_P)
[06:05:52] [PASSED] 0xA7AA (ALDERLAKE_P)
[06:05:52] [PASSED] 0xA7AB (ALDERLAKE_P)
[06:05:52] [PASSED] 0xA780 (ALDERLAKE_S)
[06:05:52] [PASSED] 0xA781 (ALDERLAKE_S)
[06:05:52] [PASSED] 0xA782 (ALDERLAKE_S)
[06:05:52] [PASSED] 0xA783 (ALDERLAKE_S)
[06:05:52] [PASSED] 0xA788 (ALDERLAKE_S)
[06:05:52] [PASSED] 0xA789 (ALDERLAKE_S)
[06:05:52] [PASSED] 0xA78A (ALDERLAKE_S)
[06:05:52] [PASSED] 0xA78B (ALDERLAKE_S)
[06:05:52] [PASSED] 0x4905 (DG1)
[06:05:52] [PASSED] 0x4906 (DG1)
[06:05:52] [PASSED] 0x4907 (DG1)
[06:05:52] [PASSED] 0x4908 (DG1)
[06:05:52] [PASSED] 0x4909 (DG1)
[06:05:52] [PASSED] 0x56C0 (DG2)
[06:05:52] [PASSED] 0x56C2 (DG2)
[06:05:52] [PASSED] 0x56C1 (DG2)
[06:05:52] [PASSED] 0x7D51 (METEORLAKE)
[06:05:52] [PASSED] 0x7DD1 (METEORLAKE)
[06:05:52] [PASSED] 0x7D41 (METEORLAKE)
[06:05:52] [PASSED] 0x7D67 (METEORLAKE)
[06:05:52] [PASSED] 0xB640 (METEORLAKE)
[06:05:52] [PASSED] 0x56A0 (DG2)
[06:05:52] [PASSED] 0x56A1 (DG2)
[06:05:52] [PASSED] 0x56A2 (DG2)
[06:05:52] [PASSED] 0x56BE (DG2)
[06:05:52] [PASSED] 0x56BF (DG2)
[06:05:52] [PASSED] 0x5690 (DG2)
[06:05:52] [PASSED] 0x5691 (DG2)
[06:05:52] [PASSED] 0x5692 (DG2)
[06:05:52] [PASSED] 0x56A5 (DG2)
[06:05:52] [PASSED] 0x56A6 (DG2)
[06:05:52] [PASSED] 0x56B0 (DG2)
[06:05:52] [PASSED] 0x56B1 (DG2)
[06:05:52] [PASSED] 0x56BA (DG2)
[06:05:52] [PASSED] 0x56BB (DG2)
[06:05:52] [PASSED] 0x56BC (DG2)
[06:05:52] [PASSED] 0x56BD (DG2)
[06:05:52] [PASSED] 0x5693 (DG2)
[06:05:52] [PASSED] 0x5694 (DG2)
[06:05:52] [PASSED] 0x5695 (DG2)
[06:05:52] [PASSED] 0x56A3 (DG2)
[06:05:52] [PASSED] 0x56A4 (DG2)
[06:05:52] [PASSED] 0x56B2 (DG2)
[06:05:52] [PASSED] 0x56B3 (DG2)
[06:05:52] [PASSED] 0x5696 (DG2)
[06:05:52] [PASSED] 0x5697 (DG2)
[06:05:52] [PASSED] 0xB69 (PVC)
[06:05:52] [PASSED] 0xB6E (PVC)
[06:05:52] [PASSED] 0xBD4 (PVC)
[06:05:52] [PASSED] 0xBD5 (PVC)
[06:05:52] [PASSED] 0xBD6 (PVC)
[06:05:52] [PASSED] 0xBD7 (PVC)
[06:05:52] [PASSED] 0xBD8 (PVC)
[06:05:52] [PASSED] 0xBD9 (PVC)
[06:05:52] [PASSED] 0xBDA (PVC)
[06:05:52] [PASSED] 0xBDB (PVC)
[06:05:52] [PASSED] 0xBE0 (PVC)
[06:05:52] [PASSED] 0xBE1 (PVC)
[06:05:52] [PASSED] 0xBE5 (PVC)
[06:05:52] [PASSED] 0x7D40 (METEORLAKE)
[06:05:52] [PASSED] 0x7D45 (METEORLAKE)
[06:05:52] [PASSED] 0x7D55 (METEORLAKE)
[06:05:52] [PASSED] 0x7D60 (METEORLAKE)
[06:05:52] [PASSED] 0x7DD5 (METEORLAKE)
[06:05:52] [PASSED] 0x6420 (LUNARLAKE)
[06:05:52] [PASSED] 0x64A0 (LUNARLAKE)
[06:05:52] [PASSED] 0x64B0 (LUNARLAKE)
[06:05:52] [PASSED] 0xE202 (BATTLEMAGE)
[06:05:52] [PASSED] 0xE209 (BATTLEMAGE)
[06:05:52] [PASSED] 0xE20B (BATTLEMAGE)
[06:05:52] [PASSED] 0xE20C (BATTLEMAGE)
[06:05:52] [PASSED] 0xE20D (BATTLEMAGE)
[06:05:52] [PASSED] 0xE210 (BATTLEMAGE)
[06:05:52] [PASSED] 0xE211 (BATTLEMAGE)
[06:05:52] [PASSED] 0xE212 (BATTLEMAGE)
[06:05:52] [PASSED] 0xE216 (BATTLEMAGE)
[06:05:52] [PASSED] 0xE220 (BATTLEMAGE)
[06:05:52] [PASSED] 0xE221 (BATTLEMAGE)
[06:05:52] [PASSED] 0xE222 (BATTLEMAGE)
[06:05:52] [PASSED] 0xE223 (BATTLEMAGE)
[06:05:52] [PASSED] 0xB080 (PANTHERLAKE)
[06:05:52] [PASSED] 0xB081 (PANTHERLAKE)
[06:05:52] [PASSED] 0xB082 (PANTHERLAKE)
[06:05:52] [PASSED] 0xB083 (PANTHERLAKE)
[06:05:52] [PASSED] 0xB084 (PANTHERLAKE)
[06:05:52] [PASSED] 0xB085 (PANTHERLAKE)
[06:05:52] [PASSED] 0xB086 (PANTHERLAKE)
[06:05:52] [PASSED] 0xB087 (PANTHERLAKE)
[06:05:52] [PASSED] 0xB08F (PANTHERLAKE)
[06:05:52] [PASSED] 0xB090 (PANTHERLAKE)
[06:05:52] [PASSED] 0xB0A0 (PANTHERLAKE)
[06:05:52] [PASSED] 0xB0B0 (PANTHERLAKE)
[06:05:52] [PASSED] 0xFD80 (PANTHERLAKE)
[06:05:52] [PASSED] 0xFD81 (PANTHERLAKE)
[06:05:52] [PASSED] 0xD740 (NOVALAKE_S)
[06:05:52] [PASSED] 0xD741 (NOVALAKE_S)
[06:05:52] [PASSED] 0xD742 (NOVALAKE_S)
[06:05:52] [PASSED] 0xD743 (NOVALAKE_S)
[06:05:52] [PASSED] 0xD745 (NOVALAKE_S)
[06:05:52] [PASSED] 0xD74A (NOVALAKE_S)
[06:05:52] [PASSED] 0xD74B (NOVALAKE_S)
[06:05:52] [PASSED] 0x674C (CRESCENTISLAND)
[06:05:52] [PASSED] 0x674D (CRESCENTISLAND)
[06:05:52] [PASSED] 0x674E (CRESCENTISLAND)
[06:05:52] [PASSED] 0x674F (CRESCENTISLAND)
[06:05:52] [PASSED] 0x6750 (CRESCENTISLAND)
[06:05:52] [PASSED] 0xD750 (NOVALAKE_P)
[06:05:52] [PASSED] 0xD751 (NOVALAKE_P)
[06:05:52] [PASSED] 0xD752 (NOVALAKE_P)
[06:05:52] [PASSED] 0xD753 (NOVALAKE_P)
[06:05:52] [PASSED] 0xD754 (NOVALAKE_P)
[06:05:52] [PASSED] 0xD755 (NOVALAKE_P)
[06:05:52] [PASSED] 0xD756 (NOVALAKE_P)
[06:05:52] [PASSED] 0xD757 (NOVALAKE_P)
[06:05:52] [PASSED] 0xD75F (NOVALAKE_P)
[06:05:52] =============== [PASSED] check_platform_desc ===============
[06:05:52] ===================== [PASSED] xe_pci ======================
[06:05:52] ============= xe_rtp_tables_test (5 subtests) ==============
[06:05:52] ================== xe_rtp_table_gt_test  ===================
[06:05:52] [PASSED] gt_was/14011060649
[06:05:52] [PASSED] gt_was/14011059788
[06:05:52] [PASSED] gt_was/14015795083
[06:05:52] [PASSED] gt_was/16021867713
[06:05:52] [PASSED] gt_was/14019449301
[06:05:52] [PASSED] gt_was/16028005424
[06:05:52] [PASSED] gt_was/14026578760
[06:05:52] [PASSED] gt_was/1409420604
[06:05:52] [PASSED] gt_was/1408615072
[06:05:52] [PASSED] gt_was/22010523718
[06:05:52] [PASSED] gt_was/14011006942
[06:05:52] [PASSED] gt_was/14014830051
[06:05:52] [PASSED] gt_was/18018781329
[06:05:52] [PASSED] gt_was/1509235366
[06:05:52] [PASSED] gt_was/18018781329
[06:05:52] [PASSED] gt_was/16016694945
[06:05:52] [PASSED] gt_was/14018575942
[06:05:52] [PASSED] gt_was/22016670082
[06:05:52] [PASSED] gt_was/22016670082
[06:05:52] [PASSED] gt_was/14017421178
[06:05:52] [PASSED] gt_was/16025250150
[06:05:52] [PASSED] gt_was/14021871409
[06:05:52] [PASSED] gt_was/16021865536
[06:05:52] [PASSED] gt_was/14021486841
[06:05:52] [PASSED] gt_was/14025160223
[06:05:52] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[06:05:52] [PASSED] gt_was/14025635424
[06:05:52] [PASSED] gt_was/16028005424
[06:05:52] ============== [PASSED] xe_rtp_table_gt_test ===============
[06:05:52] ================== xe_rtp_table_gt_test  ===================
[06:05:52] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[06:05:52] [PASSED] gt_tunings/Tuning: 32B Access Enable
[06:05:52] [PASSED] gt_tunings/Tuning: L3 cache
[06:05:52] [PASSED] gt_tunings/Tuning: L3 cache - media
[06:05:52] [PASSED] gt_tunings/Tuning: Compression Overfetch
[06:05:52] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[06:05:52] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[06:05:52] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[06:05:52] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[06:05:52] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[06:05:52] [PASSED] gt_tunings/Tuning: Stateless compression control
[06:05:52] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[06:05:52] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[06:05:52] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[06:05:52] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[06:05:52] ============== [PASSED] xe_rtp_table_gt_test ===============
[06:05:52] ================== xe_rtp_table_oob_test  ==================
[06:05:52] [PASSED] oob_was/1607983814
[06:05:52] [PASSED] oob_was/16010904313
[06:05:52] [PASSED] oob_was/18022495364
[06:05:52] [PASSED] oob_was/22012773006
[06:05:52] [PASSED] oob_was/14014475959
[06:05:52] [PASSED] oob_was/22011391025
[06:05:52] [PASSED] oob_was/22012727170
[06:05:52] [PASSED] oob_was/22012727685
[06:05:52] [PASSED] oob_was/22016596838
[06:05:52] [PASSED] oob_was/18020744125
[06:05:52] [PASSED] oob_was/1409600907
[06:05:52] [PASSED] oob_was/22014953428
[06:05:52] [PASSED] oob_was/16017236439
[06:05:52] [PASSED] oob_was/14019821291
[06:05:52] [PASSED] oob_was/14015076503
[06:05:52] [PASSED] oob_was/14018913170
[06:05:52] [PASSED] oob_was/14018094691
[06:05:52] [PASSED] oob_was/18024947630
[06:05:52] [PASSED] oob_was/16022287689
[06:05:52] [PASSED] oob_was/13011645652
[06:05:52] [PASSED] oob_was/14022293748
[06:05:52] [PASSED] oob_was/22019794406
[06:05:52] [PASSED] oob_was/22019338487
[06:05:52] [PASSED] oob_was/16023588340
[06:05:52] [PASSED] oob_was/14019789679
[06:05:52] [PASSED] oob_was/14022866841
[06:05:52] [PASSED] oob_was/16021333562
[06:05:52] [PASSED] oob_was/14016712196
[06:05:52] [PASSED] oob_was/14015568240
[06:05:52] [PASSED] oob_was/18013179988
[06:05:52] [PASSED] oob_was/1508761755
[06:05:52] [PASSED] oob_was/16023105232
[06:05:52] [PASSED] oob_was/16026508708
[06:05:52] [PASSED] oob_was/14020001231
[06:05:52] [PASSED] oob_was/16023683509
[06:05:52] [PASSED] oob_was/14025515070
[06:05:52] [PASSED] oob_was/15015404425_disable
[06:05:52] [PASSED] oob_was/16026007364
[06:05:52] [PASSED] oob_was/14020316580
[06:05:52] [PASSED] oob_was/14025883347
[06:05:52] [PASSED] oob_was/16029380221
[06:05:52] [PASSED] oob_was/22022079272
[06:05:52] [PASSED] oob_was/16029897822
[06:05:52] [PASSED] oob_was/14027054324
[06:05:52] [PASSED] oob_was/14025941587
[06:05:52] ============== [PASSED] xe_rtp_table_oob_test ==============
[06:05:52] ================ xe_rtp_table_dev_oob_test  ================
[06:05:52] [PASSED] device_oob_was/22010954014
[06:05:52] [PASSED] device_oob_was/15015404425
[06:05:52] [PASSED] device_oob_was/22019338487_display
[06:05:52] [PASSED] device_oob_was/14022085890
[06:05:52] [PASSED] device_oob_was/14026539277
[06:05:52] [PASSED] device_oob_was/14026633728
[06:05:52] [PASSED] device_oob_was/14026746987
[06:05:52] [PASSED] device_oob_was/14026779378
[06:05:52] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[06:05:52] ========== xe_rtp_table_missing_upper_bound_test  ==========
[06:05:52] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[06:05:52] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[06:05:52] [PASSED] register_whitelist/1806527549
[06:05:52] [PASSED] register_whitelist/allow_read_ctx_timestamp
[06:05:52] [PASSED] register_whitelist/allow_read_queue_timestamp
[06:05:52] [PASSED] register_whitelist/16014440446
[06:05:52] [PASSED] register_whitelist/16017236439
[06:05:52] [PASSED] register_whitelist/16020183090
[06:05:52] [PASSED] register_whitelist/14024997852
[06:05:52] [PASSED] register_whitelist/14024997852
[06:05:52] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[06:05:52] =============== [PASSED] xe_rtp_tables_test ================
[06:05:52] =================== xe_rtp (3 subtests) ====================
[06:05:52] =================== xe_rtp_rules_tests  ====================
[06:05:52] [PASSED] no
[06:05:52] [PASSED] yes
[06:05:52] [PASSED] no-and-no
[06:05:52] [PASSED] no-and-yes
[06:05:52] [PASSED] yes-and-no
[06:05:52] [PASSED] yes-and-yes
[06:05:52] [PASSED] no-or-no
[06:05:52] [PASSED] no-or-yes
[06:05:52] [PASSED] yes-or-no
[06:05:52] [PASSED] yes-or-yes
[06:05:52] [PASSED] no-yes-or-yes-no
[06:05:52] [PASSED] no-yes-or-yes-yes
[06:05:52] [PASSED] yes-yes-or-no-yes
[06:05:52] [PASSED] yes-yes-or-yes-yes
[06:05:52] [PASSED] no-no-or-yes-or-no
[06:05:52] [PASSED] or
[06:05:52] [PASSED] or-yes
[06:05:52] [PASSED] or-no
[06:05:52] [PASSED] yes-or
[06:05:52] [PASSED] no-or
[06:05:52] [PASSED] no-or-or-yes
[06:05:52] [PASSED] yes-or-or-no
[06:05:52] [PASSED] no-or-or-no
[06:05:52] [PASSED] missing-context-engine-class
[06:05:52] [PASSED] missing-context-engine-class-or-yes
[06:05:52] [PASSED] missing-context-engine-class-or-or-yes
[06:05:52] =============== [PASSED] xe_rtp_rules_tests ================
[06:05:52] =============== xe_rtp_process_to_sr_tests  ================
[06:05:52] [PASSED] coalesce-same-reg
[06:05:52] [PASSED] coalesce-same-reg-literal-and-func
[06:05:52] [PASSED] no-match-no-add
[06:05:52] [PASSED] two-regs-two-entries
[06:05:52] [PASSED] clr-one-set-other
[06:05:52] [PASSED] set-field
[06:05:52] [PASSED] conflict-duplicate
[06:05:52] [PASSED] conflict-not-disjoint
[06:05:52] [PASSED] conflict-not-disjoint-literal-and-func
[06:05:52] [PASSED] conflict-reg-type
[06:05:52] [PASSED] bad-mcr-reg-forced-to-regular
[06:05:52] [PASSED] bad-regular-reg-forced-to-mcr
[06:05:52] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[06:05:52] ================== xe_rtp_process_tests  ===================
[06:05:52] [PASSED] active1
[06:05:52] [PASSED] active2
[06:05:52] [PASSED] active-inactive
[06:05:52] [PASSED] inactive-active
[06:05:52] [PASSED] inactive-active-inactive
[06:05:52] [PASSED] inactive-inactive-inactive
[06:05:52] ============== [PASSED] xe_rtp_process_tests ===============
[06:05:52] ===================== [PASSED] xe_rtp ======================
[06:05:52] ==================== xe_wa (1 subtest) =====================
[06:05:52] ======================== xe_wa_gt  =========================
[06:05:52] [PASSED] TIGERLAKE B0
[06:05:52] [PASSED] DG1 A0
[06:05:52] [PASSED] DG1 B0
[06:05:52] [PASSED] ALDERLAKE_S A0
[06:05:52] [PASSED] ALDERLAKE_S B0
[06:05:52] [PASSED] ALDERLAKE_S C0
[06:05:52] [PASSED] ALDERLAKE_S D0
[06:05:52] [PASSED] ALDERLAKE_P A0
[06:05:52] [PASSED] ALDERLAKE_P B0
[06:05:52] [PASSED] ALDERLAKE_P C0
[06:05:52] [PASSED] ALDERLAKE_S RPLS D0
[06:05:52] [PASSED] ALDERLAKE_P RPLU E0
[06:05:52] [PASSED] DG2 G10 C0
[06:05:52] [PASSED] DG2 G11 B1
[06:05:52] [PASSED] DG2 G12 A1
[06:05:52] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[06:05:52] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[06:05:52] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[06:05:52] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[06:05:52] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[06:05:52] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[06:05:52] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[06:05:52] ==================== [PASSED] xe_wa_gt =====================
[06:05:52] ====================== [PASSED] xe_wa ======================
[06:05:52] ============================================================
[06:05:52] Testing complete. Ran 820 tests: passed: 792, skipped: 28
[06:05:52] Elapsed time: 36.928s total, 1.834s configuring, 34.328s building, 0.714s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[06:05:52] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:05:54] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[06:06:19] Starting KUnit Kernel (1/1)...
[06:06:19] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[06:06:19] ============= refcount_interrupt (4 subtests) ==============
[06:06:19] [PASSED] test_single_irq_change
[06:06:19] [PASSED] test_nested_irq_change
[06:06:19] [PASSED] test_multiple_irq_change
[06:06:19] [PASSED] test_irq_save
[06:06:19] =============== [PASSED] refcount_interrupt ================
[06:06:19] ============ drm_test_pick_cmdline (2 subtests) ============
[06:06:19] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[06:06:19] =============== drm_test_pick_cmdline_named  ===============
[06:06:19] [PASSED] NTSC
[06:06:19] [PASSED] NTSC-J
[06:06:19] [PASSED] PAL
[06:06:19] [PASSED] PAL-M
[06:06:19] =========== [PASSED] drm_test_pick_cmdline_named ===========
[06:06:19] ============== [PASSED] drm_test_pick_cmdline ==============
[06:06:19] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[06:06:19] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[06:06:19] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[06:06:19] =========== drm_validate_clone_mode (2 subtests) ===========
[06:06:19] ============== drm_test_check_in_clone_mode  ===============
[06:06:19] [PASSED] in_clone_mode
[06:06:19] [PASSED] not_in_clone_mode
[06:06:19] ========== [PASSED] drm_test_check_in_clone_mode ===========
[06:06:19] =============== drm_test_check_valid_clones  ===============
[06:06:19] [PASSED] not_in_clone_mode
[06:06:19] [PASSED] valid_clone
[06:06:19] [PASSED] invalid_clone
[06:06:19] =========== [PASSED] drm_test_check_valid_clones ===========
[06:06:19] ============= [PASSED] drm_validate_clone_mode =============
[06:06:19] ============= drm_validate_modeset (1 subtest) =============
[06:06:19] [PASSED] drm_test_check_connector_changed_modeset
[06:06:19] ============== [PASSED] drm_validate_modeset ===============
[06:06:19] ====== drm_test_bridge_get_current_state (1 subtest) =======
[06:06:19] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[06:06:19] ======== [PASSED] drm_test_bridge_get_current_state ========
[06:06:19] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[06:06:19] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[06:06:19] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[06:06:19] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[06:06:19] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[06:06:19] ============== drm_bridge_alloc (2 subtests) ===============
[06:06:19] [PASSED] drm_test_drm_bridge_alloc_basic
[06:06:19] [PASSED] drm_test_drm_bridge_alloc_get_put
[06:06:19] ================ [PASSED] drm_bridge_alloc =================
[06:06:19] ============= drm_bridge_bus_fmt (5 subtests) ==============
[06:06:19] [PASSED] drm_test_bridge_rgb_yuv_rgb
[06:06:19] [PASSED] drm_test_bridge_must_convert_to_yuv444
[06:06:19] [PASSED] drm_test_bridge_hdmi_auto_rgb
[06:06:19] [PASSED] drm_test_bridge_auto_first
[06:06:19] [PASSED] drm_test_bridge_rgb_yuv_no_path
[06:06:19] =============== [PASSED] drm_bridge_bus_fmt ================
[06:06:19] ============= drm_cmdline_parser (40 subtests) =============
[06:06:19] [PASSED] drm_test_cmdline_force_d_only
[06:06:19] [PASSED] drm_test_cmdline_force_D_only_dvi
[06:06:19] [PASSED] drm_test_cmdline_force_D_only_hdmi
[06:06:19] [PASSED] drm_test_cmdline_force_D_only_not_digital
[06:06:19] [PASSED] drm_test_cmdline_force_e_only
[06:06:19] [PASSED] drm_test_cmdline_res
[06:06:19] [PASSED] drm_test_cmdline_res_vesa
[06:06:19] [PASSED] drm_test_cmdline_res_vesa_rblank
[06:06:19] [PASSED] drm_test_cmdline_res_rblank
[06:06:19] [PASSED] drm_test_cmdline_res_bpp
[06:06:19] [PASSED] drm_test_cmdline_res_refresh
[06:06:19] [PASSED] drm_test_cmdline_res_bpp_refresh
[06:06:19] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[06:06:19] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[06:06:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[06:06:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[06:06:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[06:06:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[06:06:19] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[06:06:19] [PASSED] drm_test_cmdline_res_margins_force_on
[06:06:19] [PASSED] drm_test_cmdline_res_vesa_margins
[06:06:19] [PASSED] drm_test_cmdline_name
[06:06:19] [PASSED] drm_test_cmdline_name_bpp
[06:06:19] [PASSED] drm_test_cmdline_name_option
[06:06:19] [PASSED] drm_test_cmdline_name_bpp_option
[06:06:19] [PASSED] drm_test_cmdline_rotate_0
[06:06:19] [PASSED] drm_test_cmdline_rotate_90
[06:06:19] [PASSED] drm_test_cmdline_rotate_180
[06:06:19] [PASSED] drm_test_cmdline_rotate_270
[06:06:19] [PASSED] drm_test_cmdline_hmirror
[06:06:19] [PASSED] drm_test_cmdline_vmirror
[06:06:19] [PASSED] drm_test_cmdline_margin_options
[06:06:19] [PASSED] drm_test_cmdline_multiple_options
[06:06:19] [PASSED] drm_test_cmdline_bpp_extra_and_option
[06:06:19] [PASSED] drm_test_cmdline_extra_and_option
[06:06:19] [PASSED] drm_test_cmdline_freestanding_options
[06:06:19] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[06:06:19] [PASSED] drm_test_cmdline_panel_orientation
[06:06:19] ================ drm_test_cmdline_invalid  =================
[06:06:19] [PASSED] margin_only
[06:06:19] [PASSED] interlace_only
[06:06:19] [PASSED] res_missing_x
[06:06:19] [PASSED] res_missing_y
[06:06:19] [PASSED] res_bad_y
[06:06:19] [PASSED] res_missing_y_bpp
[06:06:19] [PASSED] res_bad_bpp
[06:06:19] [PASSED] res_bad_refresh
[06:06:19] [PASSED] res_bpp_refresh_force_on_off
[06:06:19] [PASSED] res_invalid_mode
[06:06:19] [PASSED] res_bpp_wrong_place_mode
[06:06:19] [PASSED] name_bpp_refresh
[06:06:19] [PASSED] name_refresh
[06:06:19] [PASSED] name_refresh_wrong_mode
[06:06:19] [PASSED] name_refresh_invalid_mode
[06:06:19] [PASSED] rotate_multiple
[06:06:19] [PASSED] rotate_invalid_val
[06:06:19] [PASSED] rotate_truncated
[06:06:19] [PASSED] invalid_option
[06:06:19] [PASSED] invalid_tv_option
[06:06:19] [PASSED] truncated_tv_option
[06:06:19] ============ [PASSED] drm_test_cmdline_invalid =============
[06:06:19] =============== drm_test_cmdline_tv_options  ===============
[06:06:19] [PASSED] NTSC
[06:06:19] [PASSED] NTSC_443
[06:06:19] [PASSED] NTSC_J
[06:06:19] [PASSED] PAL
[06:06:19] [PASSED] PAL_M
[06:06:19] [PASSED] PAL_N
[06:06:19] [PASSED] SECAM
[06:06:19] [PASSED] MONO_525
[06:06:19] [PASSED] MONO_625
[06:06:19] =========== [PASSED] drm_test_cmdline_tv_options ===========
[06:06:19] =============== [PASSED] drm_cmdline_parser ================
[06:06:19] ========== drmm_connector_hdmi_init (20 subtests) ==========
[06:06:19] [PASSED] drm_test_connector_hdmi_init_valid
[06:06:19] [PASSED] drm_test_connector_hdmi_init_bpc_8
[06:06:19] [PASSED] drm_test_connector_hdmi_init_bpc_10
[06:06:19] [PASSED] drm_test_connector_hdmi_init_bpc_12
[06:06:19] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[06:06:19] [PASSED] drm_test_connector_hdmi_init_bpc_null
[06:06:19] [PASSED] drm_test_connector_hdmi_init_formats_empty
[06:06:19] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[06:06:19] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[06:06:19] [PASSED] supported_formats=0x9 yuv420_allowed=1
[06:06:19] [PASSED] supported_formats=0x9 yuv420_allowed=0
[06:06:19] [PASSED] supported_formats=0x5 yuv420_allowed=1
[06:06:19] [PASSED] supported_formats=0x5 yuv420_allowed=0
[06:06:19] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[06:06:19] [PASSED] drm_test_connector_hdmi_init_null_ddc
[06:06:19] [PASSED] drm_test_connector_hdmi_init_null_product
[06:06:19] [PASSED] drm_test_connector_hdmi_init_null_vendor
[06:06:19] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[06:06:19] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[06:06:19] [PASSED] drm_test_connector_hdmi_init_product_valid
[06:06:19] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[06:06:19] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[06:06:19] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[06:06:19] ========= drm_test_connector_hdmi_init_type_valid  =========
[06:06:19] [PASSED] HDMI-A
[06:06:19] [PASSED] HDMI-B
[06:06:19] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[06:06:19] ======== drm_test_connector_hdmi_init_type_invalid  ========
[06:06:19] [PASSED] Unknown
[06:06:19] [PASSED] VGA
[06:06:19] [PASSED] DVI-I
[06:06:19] [PASSED] DVI-D
[06:06:19] [PASSED] DVI-A
[06:06:19] [PASSED] Composite
[06:06:19] [PASSED] SVIDEO
[06:06:19] [PASSED] LVDS
[06:06:19] [PASSED] Component
[06:06:19] [PASSED] DIN
[06:06:19] [PASSED] DP
[06:06:19] [PASSED] TV
[06:06:19] [PASSED] eDP
[06:06:19] [PASSED] Virtual
[06:06:19] [PASSED] DSI
[06:06:19] [PASSED] DPI
[06:06:19] [PASSED] Writeback
[06:06:19] [PASSED] SPI
[06:06:19] [PASSED] USB
[06:06:19] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[06:06:19] ============ [PASSED] drmm_connector_hdmi_init =============
[06:06:19] ============= drmm_connector_init (3 subtests) =============
[06:06:19] [PASSED] drm_test_drmm_connector_init
[06:06:19] [PASSED] drm_test_drmm_connector_init_null_ddc
[06:06:19] ========= drm_test_drmm_connector_init_type_valid  =========
[06:06:19] [PASSED] Unknown
[06:06:19] [PASSED] VGA
[06:06:19] [PASSED] DVI-I
[06:06:19] [PASSED] DVI-D
[06:06:19] [PASSED] DVI-A
[06:06:19] [PASSED] Composite
[06:06:19] [PASSED] SVIDEO
[06:06:19] [PASSED] LVDS
[06:06:19] [PASSED] Component
[06:06:19] [PASSED] DIN
[06:06:19] [PASSED] DP
[06:06:19] [PASSED] HDMI-A
[06:06:19] [PASSED] HDMI-B
[06:06:19] [PASSED] TV
[06:06:19] [PASSED] eDP
[06:06:19] [PASSED] Virtual
[06:06:19] [PASSED] DSI
[06:06:19] [PASSED] DPI
[06:06:19] [PASSED] Writeback
[06:06:19] [PASSED] SPI
[06:06:19] [PASSED] USB
[06:06:19] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[06:06:19] =============== [PASSED] drmm_connector_init ===============
[06:06:19] ========= drm_connector_dynamic_init (6 subtests) ==========
[06:06:19] [PASSED] drm_test_drm_connector_dynamic_init
[06:06:19] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[06:06:19] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[06:06:19] [PASSED] drm_test_drm_connector_dynamic_init_properties
[06:06:19] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[06:06:19] [PASSED] Unknown
[06:06:19] [PASSED] VGA
[06:06:19] [PASSED] DVI-I
[06:06:19] [PASSED] DVI-D
[06:06:19] [PASSED] DVI-A
[06:06:19] [PASSED] Composite
[06:06:19] [PASSED] SVIDEO
[06:06:19] [PASSED] LVDS
[06:06:19] [PASSED] Component
[06:06:19] [PASSED] DIN
[06:06:19] [PASSED] DP
[06:06:19] [PASSED] HDMI-A
[06:06:19] [PASSED] HDMI-B
[06:06:19] [PASSED] TV
[06:06:19] [PASSED] eDP
[06:06:19] [PASSED] Virtual
[06:06:19] [PASSED] DSI
[06:06:19] [PASSED] DPI
[06:06:19] [PASSED] Writeback
[06:06:19] [PASSED] SPI
[06:06:19] [PASSED] USB
[06:06:19] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[06:06:19] ======== drm_test_drm_connector_dynamic_init_name  =========
[06:06:19] [PASSED] Unknown
[06:06:19] [PASSED] VGA
[06:06:19] [PASSED] DVI-I
[06:06:19] [PASSED] DVI-D
[06:06:19] [PASSED] DVI-A
[06:06:19] [PASSED] Composite
[06:06:19] [PASSED] SVIDEO
[06:06:19] [PASSED] LVDS
[06:06:19] [PASSED] Component
[06:06:19] [PASSED] DIN
[06:06:19] [PASSED] DP
[06:06:19] [PASSED] HDMI-A
[06:06:19] [PASSED] HDMI-B
[06:06:19] [PASSED] TV
[06:06:19] [PASSED] eDP
[06:06:19] [PASSED] Virtual
[06:06:19] [PASSED] DSI
[06:06:19] [PASSED] DPI
[06:06:19] [PASSED] Writeback
[06:06:19] [PASSED] SPI
[06:06:19] [PASSED] USB
[06:06:19] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[06:06:19] =========== [PASSED] drm_connector_dynamic_init ============
[06:06:19] ==== drm_connector_dynamic_register_early (4 subtests) =====
[06:06:19] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[06:06:19] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[06:06:19] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[06:06:19] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[06:06:19] ====== [PASSED] drm_connector_dynamic_register_early =======
[06:06:19] ======= drm_connector_dynamic_register (7 subtests) ========
[06:06:19] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[06:06:19] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[06:06:19] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[06:06:19] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[06:06:19] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[06:06:19] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[06:06:19] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[06:06:19] ========= [PASSED] drm_connector_dynamic_register ==========
[06:06:19] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[06:06:19] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[06:06:19] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[06:06:19] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[06:06:19] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[06:06:19] ========== drm_test_get_tv_mode_from_name_valid  ===========
[06:06:19] [PASSED] NTSC
[06:06:19] [PASSED] NTSC-443
[06:06:19] [PASSED] NTSC-J
[06:06:19] [PASSED] PAL
[06:06:19] [PASSED] PAL-M
[06:06:19] [PASSED] PAL-N
[06:06:19] [PASSED] SECAM
[06:06:19] [PASSED] Mono
[06:06:19] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[06:06:19] [PASSED] drm_test_get_tv_mode_from_name_truncated
[06:06:19] ============ [PASSED] drm_get_tv_mode_from_name ============
[06:06:19] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[06:06:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[06:06:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[06:06:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[06:06:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[06:06:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[06:06:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[06:06:19] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[06:06:19] [PASSED] VIC 96
[06:06:19] [PASSED] VIC 97
[06:06:19] [PASSED] VIC 101
[06:06:19] [PASSED] VIC 102
[06:06:19] [PASSED] VIC 106
[06:06:19] [PASSED] VIC 107
[06:06:19] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[06:06:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[06:06:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[06:06:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[06:06:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[06:06:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[06:06:19] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[06:06:19] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[06:06:19] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[06:06:19] [PASSED] Automatic
[06:06:19] [PASSED] Full
[06:06:19] [PASSED] Limited 16:235
[06:06:19] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[06:06:19] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[06:06:19] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[06:06:19] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[06:06:19] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[06:06:19] [PASSED] RGB
[06:06:19] [PASSED] YUV 4:2:0
[06:06:19] [PASSED] YUV 4:2:2
[06:06:19] [PASSED] YUV 4:4:4
[06:06:19] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[06:06:19] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[06:06:19] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[06:06:19] ============= drm_damage_helper (21 subtests) ==============
[06:06:19] [PASSED] drm_test_damage_iter_no_damage
[06:06:19] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[06:06:19] [PASSED] drm_test_damage_iter_no_damage_src_moved
[06:06:19] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[06:06:19] [PASSED] drm_test_damage_iter_no_damage_not_visible
[06:06:19] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[06:06:19] [PASSED] drm_test_damage_iter_no_damage_no_fb
[06:06:19] [PASSED] drm_test_damage_iter_simple_damage
[06:06:19] [PASSED] drm_test_damage_iter_single_damage
[06:06:19] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[06:06:19] [PASSED] drm_test_damage_iter_single_damage_outside_src
[06:06:19] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[06:06:19] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[06:06:19] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[06:06:19] [PASSED] drm_test_damage_iter_single_damage_src_moved
[06:06:19] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[06:06:19] [PASSED] drm_test_damage_iter_damage
[06:06:19] [PASSED] drm_test_damage_iter_damage_one_intersect
[06:06:19] [PASSED] drm_test_damage_iter_damage_one_outside
[06:06:19] [PASSED] drm_test_damage_iter_damage_src_moved
[06:06:19] [PASSED] drm_test_damage_iter_damage_not_visible
[06:06:19] ================ [PASSED] drm_damage_helper ================
[06:06:19] ============== drm_dp_mst_helper (3 subtests) ==============
[06:06:19] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[06:06:19] [PASSED] Clock 154000 BPP 30 DSC disabled
[06:06:19] [PASSED] Clock 234000 BPP 30 DSC disabled
[06:06:19] [PASSED] Clock 297000 BPP 24 DSC disabled
[06:06:19] [PASSED] Clock 332880 BPP 24 DSC enabled
[06:06:19] [PASSED] Clock 324540 BPP 24 DSC enabled
[06:06:19] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[06:06:19] ============== drm_test_dp_mst_calc_pbn_div  ===============
[06:06:19] [PASSED] Link rate 2000000 lane count 4
[06:06:19] [PASSED] Link rate 2000000 lane count 2
[06:06:19] [PASSED] Link rate 2000000 lane count 1
[06:06:19] [PASSED] Link rate 1350000 lane count 4
[06:06:19] [PASSED] Link rate 1350000 lane count 2
[06:06:19] [PASSED] Link rate 1350000 lane count 1
[06:06:19] [PASSED] Link rate 1000000 lane count 4
[06:06:19] [PASSED] Link rate 1000000 lane count 2
[06:06:19] [PASSED] Link rate 1000000 lane count 1
[06:06:19] [PASSED] Link rate 810000 lane count 4
[06:06:19] [PASSED] Link rate 810000 lane count 2
[06:06:19] [PASSED] Link rate 810000 lane count 1
[06:06:19] [PASSED] Link rate 540000 lane count 4
[06:06:19] [PASSED] Link rate 540000 lane count 2
[06:06:19] [PASSED] Link rate 540000 lane count 1
[06:06:19] [PASSED] Link rate 270000 lane count 4
[06:06:19] [PASSED] Link rate 270000 lane count 2
[06:06:19] [PASSED] Link rate 270000 lane count 1
[06:06:19] [PASSED] Link rate 162000 lane count 4
[06:06:19] [PASSED] Link rate 162000 lane count 2
[06:06:19] [PASSED] Link rate 162000 lane count 1
[06:06:19] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[06:06:19] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[06:06:19] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[06:06:19] [PASSED] DP_POWER_UP_PHY with port number
[06:06:19] [PASSED] DP_POWER_DOWN_PHY with port number
[06:06:19] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[06:06:19] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[06:06:19] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[06:06:19] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[06:06:19] [PASSED] DP_QUERY_PAYLOAD with port number
[06:06:19] [PASSED] DP_QUERY_PAYLOAD with VCPI
[06:06:19] [PASSED] DP_REMOTE_DPCD_READ with port number
[06:06:19] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[06:06:19] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[06:06:19] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[06:06:19] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[06:06:19] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[06:06:19] [PASSED] DP_REMOTE_I2C_READ with port number
[06:06:19] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[06:06:19] [PASSED] DP_REMOTE_I2C_READ with transactions array
[06:06:19] [PASSED] DP_REMOTE_I2C_WRITE with port number
[06:06:19] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[06:06:19] [PASSED] DP_REMOTE_I2C_WRITE with data array
[06:06:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[06:06:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[06:06:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[06:06:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[06:06:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[06:06:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[06:06:19] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[06:06:19] ================ [PASSED] drm_dp_mst_helper ================
[06:06:19] ================== drm_exec (7 subtests) ===================
[06:06:19] [PASSED] sanitycheck
[06:06:19] [PASSED] test_lock
[06:06:19] [PASSED] test_lock_unlock
[06:06:19] [PASSED] test_duplicates
[06:06:19] [PASSED] test_prepare
[06:06:19] [PASSED] test_prepare_array
[06:06:19] [PASSED] test_multiple_loops
[06:06:19] ==================== [PASSED] drm_exec =====================
[06:06:19] =========== drm_format_helper_test (17 subtests) ===========
[06:06:19] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[06:06:19] [PASSED] single_pixel_source_buffer
[06:06:19] [PASSED] single_pixel_clip_rectangle
[06:06:19] [PASSED] well_known_colors
[06:06:19] [PASSED] destination_pitch
[06:06:19] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[06:06:19] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[06:06:19] [PASSED] single_pixel_source_buffer
[06:06:19] [PASSED] single_pixel_clip_rectangle
[06:06:19] [PASSED] well_known_colors
[06:06:19] [PASSED] destination_pitch
[06:06:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[06:06:19] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[06:06:19] [PASSED] single_pixel_source_buffer
[06:06:19] [PASSED] single_pixel_clip_rectangle
[06:06:19] [PASSED] well_known_colors
[06:06:19] [PASSED] destination_pitch
[06:06:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[06:06:19] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[06:06:19] [PASSED] single_pixel_source_buffer
[06:06:19] [PASSED] single_pixel_clip_rectangle
[06:06:19] [PASSED] well_known_colors
[06:06:19] [PASSED] destination_pitch
[06:06:19] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[06:06:19] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[06:06:19] [PASSED] single_pixel_source_buffer
[06:06:19] [PASSED] single_pixel_clip_rectangle
[06:06:19] [PASSED] well_known_colors
[06:06:19] [PASSED] destination_pitch
[06:06:19] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[06:06:19] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[06:06:19] [PASSED] single_pixel_source_buffer
[06:06:19] [PASSED] single_pixel_clip_rectangle
[06:06:19] [PASSED] well_known_colors
[06:06:19] [PASSED] destination_pitch
[06:06:19] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[06:06:19] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[06:06:19] [PASSED] single_pixel_source_buffer
[06:06:19] [PASSED] single_pixel_clip_rectangle
[06:06:19] [PASSED] well_known_colors
[06:06:19] [PASSED] destination_pitch
[06:06:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[06:06:19] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[06:06:19] [PASSED] single_pixel_source_buffer
[06:06:19] [PASSED] single_pixel_clip_rectangle
[06:06:19] [PASSED] well_known_colors
[06:06:19] [PASSED] destination_pitch
[06:06:19] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[06:06:19] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[06:06:19] [PASSED] single_pixel_source_buffer
[06:06:19] [PASSED] single_pixel_clip_rectangle
[06:06:19] [PASSED] well_known_colors
[06:06:19] [PASSED] destination_pitch
[06:06:19] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[06:06:19] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[06:06:19] [PASSED] single_pixel_source_buffer
[06:06:19] [PASSED] single_pixel_clip_rectangle
[06:06:19] [PASSED] well_known_colors
[06:06:19] [PASSED] destination_pitch
[06:06:19] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[06:06:19] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[06:06:19] [PASSED] single_pixel_source_buffer
[06:06:19] [PASSED] single_pixel_clip_rectangle
[06:06:19] [PASSED] well_known_colors
[06:06:19] [PASSED] destination_pitch
[06:06:19] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[06:06:19] ============== drm_test_fb_xrgb8888_to_mono  ===============
[06:06:19] [PASSED] single_pixel_source_buffer
[06:06:19] [PASSED] single_pixel_clip_rectangle
[06:06:19] [PASSED] well_known_colors
[06:06:19] [PASSED] destination_pitch
[06:06:19] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[06:06:19] ==================== drm_test_fb_swab  =====================
[06:06:19] [PASSED] single_pixel_source_buffer
[06:06:19] [PASSED] single_pixel_clip_rectangle
[06:06:19] [PASSED] well_known_colors
[06:06:19] [PASSED] destination_pitch
[06:06:19] ================ [PASSED] drm_test_fb_swab =================
[06:06:19] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[06:06:19] [PASSED] single_pixel_source_buffer
[06:06:19] [PASSED] single_pixel_clip_rectangle
[06:06:19] [PASSED] well_known_colors
[06:06:19] [PASSED] destination_pitch
[06:06:19] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[06:06:19] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[06:06:19] [PASSED] single_pixel_source_buffer
[06:06:19] [PASSED] single_pixel_clip_rectangle
[06:06:19] [PASSED] well_known_colors
[06:06:19] [PASSED] destination_pitch
[06:06:19] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[06:06:19] ================= drm_test_fb_clip_offset  =================
[06:06:19] [PASSED] pass through
[06:06:19] [PASSED] horizontal offset
[06:06:19] [PASSED] vertical offset
[06:06:19] [PASSED] horizontal and vertical offset
[06:06:19] [PASSED] horizontal offset (custom pitch)
[06:06:19] [PASSED] vertical offset (custom pitch)
[06:06:19] [PASSED] horizontal and vertical offset (custom pitch)
[06:06:19] ============= [PASSED] drm_test_fb_clip_offset =============
[06:06:19] =================== drm_test_fb_memcpy  ====================
[06:06:19] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[06:06:19] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[06:06:19] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[06:06:19] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[06:06:19] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[06:06:19] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[06:06:19] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[06:06:19] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[06:06:19] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[06:06:19] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[06:06:19] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[06:06:19] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[06:06:19] =============== [PASSED] drm_test_fb_memcpy ================
[06:06:19] ============= [PASSED] drm_format_helper_test ==============
[06:06:19] ================= drm_format (18 subtests) =================
[06:06:19] [PASSED] drm_test_format_block_width_invalid
[06:06:19] [PASSED] drm_test_format_block_width_one_plane
[06:06:19] [PASSED] drm_test_format_block_width_two_plane
[06:06:19] [PASSED] drm_test_format_block_width_three_plane
[06:06:19] [PASSED] drm_test_format_block_width_tiled
[06:06:19] [PASSED] drm_test_format_block_height_invalid
[06:06:19] [PASSED] drm_test_format_block_height_one_plane
[06:06:19] [PASSED] drm_test_format_block_height_two_plane
[06:06:19] [PASSED] drm_test_format_block_height_three_plane
[06:06:19] [PASSED] drm_test_format_block_height_tiled
[06:06:19] [PASSED] drm_test_format_min_pitch_invalid
[06:06:19] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[06:06:19] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[06:06:19] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[06:06:19] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[06:06:19] [PASSED] drm_test_format_min_pitch_two_plane
[06:06:19] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[06:06:19] [PASSED] drm_test_format_min_pitch_tiled
[06:06:19] =================== [PASSED] drm_format ====================
[06:06:19] ============== drm_framebuffer (10 subtests) ===============
[06:06:19] ========== drm_test_framebuffer_check_src_coords  ==========
[06:06:19] [PASSED] Success: source fits into fb
[06:06:19] [PASSED] Fail: overflowing fb with x-axis coordinate
[06:06:19] [PASSED] Fail: overflowing fb with y-axis coordinate
[06:06:19] [PASSED] Fail: overflowing fb with source width
[06:06:19] [PASSED] Fail: overflowing fb with source height
[06:06:19] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[06:06:19] [PASSED] drm_test_framebuffer_cleanup
[06:06:19] =============== drm_test_framebuffer_create  ===============
[06:06:19] [PASSED] ABGR8888 normal sizes
[06:06:19] [PASSED] ABGR8888 max sizes
[06:06:19] [PASSED] ABGR8888 pitch greater than min required
[06:06:19] [PASSED] ABGR8888 pitch less than min required
[06:06:19] [PASSED] ABGR8888 Invalid width
[06:06:19] [PASSED] ABGR8888 Invalid buffer handle
[06:06:19] [PASSED] No pixel format
[06:06:19] [PASSED] ABGR8888 Width 0
[06:06:19] [PASSED] ABGR8888 Height 0
[06:06:19] [PASSED] ABGR8888 Out of bound height * pitch combination
[06:06:19] [PASSED] ABGR8888 Large buffer offset
[06:06:19] [PASSED] ABGR8888 Buffer offset for inexistent plane
[06:06:19] [PASSED] ABGR8888 Invalid flag
[06:06:19] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[06:06:19] [PASSED] ABGR8888 Valid buffer modifier
[06:06:19] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[06:06:19] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[06:06:19] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[06:06:19] [PASSED] NV12 Normal sizes
[06:06:19] [PASSED] NV12 Max sizes
[06:06:19] [PASSED] NV12 Invalid pitch
[06:06:19] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[06:06:19] [PASSED] NV12 different  modifier per-plane
[06:06:19] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[06:06:19] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[06:06:19] [PASSED] NV12 Modifier for inexistent plane
[06:06:19] [PASSED] NV12 Handle for inexistent plane
[06:06:19] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[06:06:19] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[06:06:19] [PASSED] YVU420 Normal sizes
[06:06:19] [PASSED] YVU420 Max sizes
[06:06:19] [PASSED] YVU420 Invalid pitch
[06:06:19] [PASSED] YVU420 Different pitches
[06:06:19] [PASSED] YVU420 Different buffer offsets/pitches
[06:06:19] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[06:06:19] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[06:06:19] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[06:06:19] [PASSED] YVU420 Valid modifier
[06:06:19] [PASSED] YVU420 Different modifiers per plane
[06:06:19] [PASSED] YVU420 Modifier for inexistent plane
[06:06:19] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[06:06:19] [PASSED] X0L2 Normal sizes
[06:06:19] [PASSED] X0L2 Max sizes
[06:06:19] [PASSED] X0L2 Invalid pitch
[06:06:19] [PASSED] X0L2 Pitch greater than minimum required
[06:06:19] [PASSED] X0L2 Handle for inexistent plane
[06:06:19] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[06:06:19] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[06:06:19] [PASSED] X0L2 Valid modifier
[06:06:19] [PASSED] X0L2 Modifier for inexistent plane
[06:06:19] =========== [PASSED] drm_test_framebuffer_create ===========
[06:06:19] [PASSED] drm_test_framebuffer_free
[06:06:19] [PASSED] drm_test_framebuffer_init
[06:06:19] [PASSED] drm_test_framebuffer_init_bad_format
[06:06:19] [PASSED] drm_test_framebuffer_init_dev_mismatch
[06:06:19] [PASSED] drm_test_framebuffer_lookup
[06:06:19] [PASSED] drm_test_framebuffer_lookup_inexistent
[06:06:19] [PASSED] drm_test_framebuffer_modifiers_not_supported
[06:06:19] ================= [PASSED] drm_framebuffer =================
[06:06:19] ================ drm_gem_shmem (8 subtests) ================
[06:06:19] [PASSED] drm_gem_shmem_test_obj_create
[06:06:19] [PASSED] drm_gem_shmem_test_obj_create_private
[06:06:19] [PASSED] drm_gem_shmem_test_pin_pages
[06:06:19] [PASSED] drm_gem_shmem_test_vmap
[06:06:19] [PASSED] drm_gem_shmem_test_get_sg_table
[06:06:19] [PASSED] drm_gem_shmem_test_get_pages_sgt
[06:06:19] [PASSED] drm_gem_shmem_test_madvise
[06:06:19] [PASSED] drm_gem_shmem_test_purge
[06:06:19] ================== [PASSED] drm_gem_shmem ==================
[06:06:19] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[06:06:19] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[06:06:19] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[06:06:19] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[06:06:19] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[06:06:19] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[06:06:19] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[06:06:19] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[06:06:19] [PASSED] Automatic
[06:06:19] [PASSED] Full
[06:06:19] [PASSED] Limited 16:235
[06:06:19] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[06:06:19] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[06:06:19] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[06:06:19] [PASSED] drm_test_check_disable_connector
[06:06:19] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[06:06:19] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[06:06:19] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[06:06:19] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[06:06:19] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[06:06:19] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[06:06:19] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[06:06:19] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[06:06:19] [PASSED] drm_test_check_output_bpc_dvi
[06:06:19] [PASSED] drm_test_check_output_bpc_format_vic_1
[06:06:19] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[06:06:19] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[06:06:19] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[06:06:19] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[06:06:19] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[06:06:19] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[06:06:19] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[06:06:19] ============ drm_test_check_hdmi_color_format  =============
[06:06:19] [PASSED] AUTO -> RGB
[06:06:19] [PASSED] YCBCR422 -> YUV422
[06:06:19] [PASSED] YCBCR420 -> YUV420
[06:06:19] [PASSED] YCBCR444 -> YUV444
[06:06:19] [PASSED] RGB -> RGB
[06:06:19] ======== [PASSED] drm_test_check_hdmi_color_format =========
[06:06:19] ======== drm_test_check_hdmi_color_format_420_only  ========
[06:06:19] [PASSED] RGB should fail
[06:06:19] [PASSED] YUV444 should fail
[06:06:19] [PASSED] YUV422 should fail
[06:06:19] [PASSED] YUV420 should work
[06:06:19] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[06:06:19] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[06:06:19] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[06:06:19] [PASSED] drm_test_check_broadcast_rgb_value
[06:06:19] [PASSED] drm_test_check_bpc_8_value
[06:06:19] [PASSED] drm_test_check_bpc_10_value
[06:06:19] [PASSED] drm_test_check_bpc_12_value
[06:06:19] [PASSED] drm_test_check_format_value
[06:06:19] [PASSED] drm_test_check_tmds_char_value
[06:06:19] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[06:06:19] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[06:06:19] [PASSED] drm_test_check_mode_valid
[06:06:19] [PASSED] drm_test_check_mode_valid_reject
[06:06:19] [PASSED] drm_test_check_mode_valid_reject_rate
[06:06:19] [PASSED] drm_test_check_mode_valid_reject_max_clock
[06:06:19] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[06:06:19] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[06:06:19] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[06:06:19] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[06:06:19] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[06:06:19] [PASSED] drm_test_check_infoframes
[06:06:19] [PASSED] drm_test_check_reject_avi_infoframe
[06:06:19] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[06:06:19] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[06:06:19] [PASSED] drm_test_check_reject_audio_infoframe
[06:06:19] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[06:06:19] ================= drm_managed (2 subtests) =================
[06:06:19] [PASSED] drm_test_managed_release_action
[06:06:19] [PASSED] drm_test_managed_run_action
[06:06:19] =================== [PASSED] drm_managed ===================
[06:06:19] =================== drm_mm (6 subtests) ====================
[06:06:19] [PASSED] drm_test_mm_init
[06:06:19] [PASSED] drm_test_mm_debug
[06:06:19] [PASSED] drm_test_mm_align32
[06:06:19] [PASSED] drm_test_mm_align64
[06:06:19] [PASSED] drm_test_mm_lowest
[06:06:19] [PASSED] drm_test_mm_highest
[06:06:19] ===================== [PASSED] drm_mm ======================
[06:06:19] ============= drm_modes_analog_tv (5 subtests) =============
[06:06:19] [PASSED] drm_test_modes_analog_tv_mono_576i
[06:06:19] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[06:06:19] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[06:06:19] [PASSED] drm_test_modes_analog_tv_pal_576i
[06:06:19] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[06:06:19] =============== [PASSED] drm_modes_analog_tv ===============
[06:06:19] ============== drm_panic_helper (3 subtests) ===============
[06:06:19] ============= drm_test_panic_screen_user_map  ==============
[06:06:19] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[06:06:19] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[06:06:19] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[06:06:19] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[06:06:19] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[06:06:19] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[06:06:19] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[06:06:19] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[06:06:19] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[06:06:19] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[06:06:19] ========= [PASSED] drm_test_panic_screen_user_map ==========
[06:06:19] ============= drm_test_panic_screen_user_page  =============
[06:06:19] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[06:06:19] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[06:06:19] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[06:06:19] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[06:06:19] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[06:06:19] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[06:06:19] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[06:06:19] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[06:06:19] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[06:06:19] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[06:06:19] ========= [PASSED] drm_test_panic_screen_user_page =========
[06:06:19] ========== drm_test_panic_screen_user_set_pixel  ===========
[06:06:19] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[06:06:19] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[06:06:19] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[06:06:19] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[06:06:19] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[06:06:19] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[06:06:19] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[06:06:19] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[06:06:19] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[06:06:19] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[06:06:19] ====== [PASSED] drm_test_panic_screen_user_set_pixel =======
[06:06:19] ================ [PASSED] drm_panic_helper =================
[06:06:19] ============== drm_plane_helper (2 subtests) ===============
[06:06:19] =============== drm_test_check_plane_state  ================
[06:06:19] [PASSED] clipping_simple
[06:06:19] [PASSED] clipping_rotate_reflect
[06:06:19] [PASSED] positioning_simple
[06:06:19] [PASSED] upscaling
[06:06:19] [PASSED] downscaling
[06:06:19] [PASSED] rounding1
[06:06:19] [PASSED] rounding2
[06:06:19] [PASSED] rounding3
[06:06:19] [PASSED] rounding4
[06:06:19] =========== [PASSED] drm_test_check_plane_state ============
[06:06:19] =========== drm_test_check_invalid_plane_state  ============
[06:06:19] [PASSED] positioning_invalid
[06:06:19] [PASSED] upscaling_invalid
[06:06:19] [PASSED] downscaling_invalid
[06:06:19] ======= [PASSED] drm_test_check_invalid_plane_state ========
[06:06:19] ================ [PASSED] drm_plane_helper =================
[06:06:19] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[06:06:19] ====== drm_test_connector_helper_tv_get_modes_check  =======
[06:06:19] [PASSED] None
[06:06:19] [PASSED] PAL
[06:06:19] [PASSED] NTSC
[06:06:19] [PASSED] Both, NTSC Default
[06:06:19] [PASSED] Both, PAL Default
[06:06:19] [PASSED] Both, NTSC Default, with PAL on command-line
[06:06:19] [PASSED] Both, PAL Default, with NTSC on command-line
[06:06:19] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[06:06:19] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[06:06:19] ================== drm_rect (9 subtests) ===================
[06:06:19] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[06:06:19] [PASSED] drm_test_rect_clip_scaled_not_clipped
[06:06:19] [PASSED] drm_test_rect_clip_scaled_clipped
[06:06:19] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[06:06:19] ================= drm_test_rect_intersect  =================
[06:06:19] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[06:06:19] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[06:06:19] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[06:06:19] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[06:06:19] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[06:06:19] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[06:06:19] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[06:06:19] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[06:06:19] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[06:06:19] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[06:06:19] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[06:06:19] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[06:06:19] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[06:06:19] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[06:06:19] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[06:06:19] ============= [PASSED] drm_test_rect_intersect =============
[06:06:19] ================ drm_test_rect_calc_hscale  ================
[06:06:19] [PASSED] normal use
[06:06:19] [PASSED] out of max range
[06:06:19] [PASSED] out of min range
[06:06:19] [PASSED] zero dst
[06:06:19] [PASSED] negative src
[06:06:19] [PASSED] negative dst
[06:06:19] ============ [PASSED] drm_test_rect_calc_hscale ============
[06:06:19] ================ drm_test_rect_calc_vscale  ================
[06:06:19] [PASSED] normal use
[06:06:19] [PASSED] out of max range
[06:06:19] [PASSED] out of min range
[06:06:19] [PASSED] zero dst
[06:06:19] [PASSED] negative src
[06:06:19] [PASSED] negative dst
[06:06:19] ============ [PASSED] drm_test_rect_calc_vscale ============
[06:06:19] ================== drm_test_rect_rotate  ===================
[06:06:19] [PASSED] reflect-x
[06:06:19] [PASSED] reflect-y
[06:06:19] [PASSED] rotate-0
[06:06:19] [PASSED] rotate-90
[06:06:19] [PASSED] rotate-180
[06:06:19] [PASSED] rotate-270
[06:06:19] ============== [PASSED] drm_test_rect_rotate ===============
[06:06:19] ================ drm_test_rect_rotate_inv  =================
[06:06:19] [PASSED] reflect-x
[06:06:19] [PASSED] reflect-y
[06:06:19] [PASSED] rotate-0
[06:06:19] [PASSED] rotate-90
[06:06:19] [PASSED] rotate-180
[06:06:19] [PASSED] rotate-270
[06:06:19] ============ [PASSED] drm_test_rect_rotate_inv =============
[06:06:19] ==================== [PASSED] drm_rect =====================
[06:06:19] ============ drm_sysfb_modeset_test (1 subtest) ============
[06:06:19] ============ drm_test_sysfb_build_fourcc_list  =============
[06:06:19] [PASSED] no native formats
[06:06:19] [PASSED] XRGB8888 as native format
[06:06:19] [PASSED] remove duplicates
[06:06:19] [PASSED] convert alpha formats
[06:06:19] [PASSED] random formats
[06:06:19] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[06:06:19] ============= [PASSED] drm_sysfb_modeset_test ==============
[06:06:19] ================== drm_fixp (2 subtests) ===================
[06:06:19] [PASSED] drm_test_int2fixp
[06:06:19] [PASSED] drm_test_sm2fixp
[06:06:19] ==================== [PASSED] drm_fixp =====================
[06:06:19] ============================================================
[06:06:19] Testing complete. Ran 671 tests: passed: 671
[06:06:19] Elapsed time: 27.441s total, 1.750s configuring, 25.272s building, 0.411s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[06:06:19] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:06:21] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[06:06:31] Starting KUnit Kernel (1/1)...
[06:06:31] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[06:06:31] ============= refcount_interrupt (4 subtests) ==============
[06:06:31] [PASSED] test_single_irq_change
[06:06:31] [PASSED] test_nested_irq_change
[06:06:31] [PASSED] test_multiple_irq_change
[06:06:31] [PASSED] test_irq_save
[06:06:31] =============== [PASSED] refcount_interrupt ================
[06:06:31] ================= ttm_device (5 subtests) ==================
[06:06:31] [PASSED] ttm_device_init_basic
[06:06:31] [PASSED] ttm_device_init_multiple
[06:06:31] [PASSED] ttm_device_fini_basic
[06:06:31] [PASSED] ttm_device_init_no_vma_man
[06:06:31] ================== ttm_device_init_pools  ==================
[06:06:31] [PASSED] No DMA allocations, no DMA32 required
[06:06:31] [PASSED] DMA allocations, DMA32 required
[06:06:31] [PASSED] No DMA allocations, DMA32 required
[06:06:31] [PASSED] DMA allocations, no DMA32 required
[06:06:31] ============== [PASSED] ttm_device_init_pools ==============
[06:06:31] =================== [PASSED] ttm_device ====================
[06:06:31] ================== ttm_pool (8 subtests) ===================
[06:06:31] ================== ttm_pool_alloc_basic  ===================
[06:06:31] [PASSED] One page
[06:06:31] [PASSED] More than one page
[06:06:31] [PASSED] Above the allocation limit
[06:06:31] [PASSED] One page, with coherent DMA mappings enabled
[06:06:31] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[06:06:31] ============== [PASSED] ttm_pool_alloc_basic ===============
[06:06:31] ============== ttm_pool_alloc_basic_dma_addr  ==============
[06:06:31] [PASSED] One page
[06:06:31] [PASSED] More than one page
[06:06:31] [PASSED] Above the allocation limit
[06:06:31] [PASSED] One page, with coherent DMA mappings enabled
[06:06:31] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[06:06:31] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[06:06:31] [PASSED] ttm_pool_alloc_order_caching_match
[06:06:31] [PASSED] ttm_pool_alloc_caching_mismatch
[06:06:31] [PASSED] ttm_pool_alloc_order_mismatch
[06:06:31] [PASSED] ttm_pool_free_dma_alloc
[06:06:31] [PASSED] ttm_pool_free_no_dma_alloc
[06:06:31] [PASSED] ttm_pool_fini_basic
[06:06:31] ==================== [PASSED] ttm_pool =====================
[06:06:31] ================ ttm_resource (8 subtests) =================
[06:06:31] ================= ttm_resource_init_basic  =================
[06:06:31] [PASSED] Init resource in TTM_PL_SYSTEM
[06:06:31] [PASSED] Init resource in TTM_PL_VRAM
[06:06:31] [PASSED] Init resource in a private placement
[06:06:31] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[06:06:31] ============= [PASSED] ttm_resource_init_basic =============
[06:06:31] [PASSED] ttm_resource_init_pinned
[06:06:31] [PASSED] ttm_resource_fini_basic
[06:06:31] [PASSED] ttm_resource_manager_init_basic
[06:06:31] [PASSED] ttm_resource_manager_usage_basic
[06:06:31] [PASSED] ttm_resource_manager_set_used_basic
[06:06:31] [PASSED] ttm_sys_man_alloc_basic
[06:06:31] [PASSED] ttm_sys_man_free_basic
[06:06:31] ================== [PASSED] ttm_resource ===================
[06:06:31] =================== ttm_tt (15 subtests) ===================
[06:06:31] ==================== ttm_tt_init_basic  ====================
[06:06:31] [PASSED] Page-aligned size
[06:06:31] [PASSED] Extra pages requested
[06:06:31] ================ [PASSED] ttm_tt_init_basic ================
[06:06:31] [PASSED] ttm_tt_init_misaligned
[06:06:31] [PASSED] ttm_tt_fini_basic
[06:06:31] [PASSED] ttm_tt_fini_sg
[06:06:31] [PASSED] ttm_tt_fini_shmem
[06:06:31] [PASSED] ttm_tt_create_basic
[06:06:31] [PASSED] ttm_tt_create_invalid_bo_type
[06:06:31] [PASSED] ttm_tt_create_ttm_exists
[06:06:31] [PASSED] ttm_tt_create_failed
[06:06:31] [PASSED] ttm_tt_destroy_basic
[06:06:31] [PASSED] ttm_tt_populate_null_ttm
[06:06:31] [PASSED] ttm_tt_populate_populated_ttm
[06:06:31] [PASSED] ttm_tt_unpopulate_basic
[06:06:31] [PASSED] ttm_tt_unpopulate_empty_ttm
[06:06:31] [PASSED] ttm_tt_swapin_basic
[06:06:31] ===================== [PASSED] ttm_tt ======================
[06:06:31] =================== ttm_bo (14 subtests) ===================
[06:06:31] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[06:06:31] [PASSED] Cannot be interrupted and sleeps
[06:06:31] [PASSED] Cannot be interrupted, locks straight away
[06:06:31] [PASSED] Can be interrupted, sleeps
[06:06:31] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[06:06:31] [PASSED] ttm_bo_reserve_locked_no_sleep
[06:06:31] [PASSED] ttm_bo_reserve_no_wait_ticket
[06:06:31] [PASSED] ttm_bo_reserve_double_resv
[06:06:31] [PASSED] ttm_bo_reserve_interrupted
[06:06:31] [PASSED] ttm_bo_reserve_deadlock
[06:06:31] [PASSED] ttm_bo_unreserve_basic
[06:06:31] [PASSED] ttm_bo_unreserve_pinned
[06:06:31] [PASSED] ttm_bo_unreserve_bulk
[06:06:31] [PASSED] ttm_bo_fini_basic
[06:06:31] [PASSED] ttm_bo_fini_shared_resv
[06:06:31] [PASSED] ttm_bo_pin_basic
[06:06:31] [PASSED] ttm_bo_pin_unpin_resource
[06:06:31] [PASSED] ttm_bo_multiple_pin_one_unpin
[06:06:31] ===================== [PASSED] ttm_bo ======================
[06:06:31] ============== ttm_bo_validate (22 subtests) ===============
[06:06:31] ============== ttm_bo_init_reserved_sys_man  ===============
[06:06:31] [PASSED] Buffer object for userspace
[06:06:31] [PASSED] Kernel buffer object
[06:06:31] [PASSED] Shared buffer object
[06:06:31] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[06:06:31] ============== ttm_bo_init_reserved_mock_man  ==============
[06:06:31] [PASSED] Buffer object for userspace
[06:06:31] [PASSED] Kernel buffer object
[06:06:31] [PASSED] Shared buffer object
[06:06:31] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[06:06:31] [PASSED] ttm_bo_init_reserved_resv
[06:06:31] ================== ttm_bo_validate_basic  ==================
[06:06:31] [PASSED] Buffer object for userspace
[06:06:31] [PASSED] Kernel buffer object
[06:06:31] [PASSED] Shared buffer object
[06:06:31] ============== [PASSED] ttm_bo_validate_basic ==============
[06:06:31] [PASSED] ttm_bo_validate_invalid_placement
[06:06:31] ============= ttm_bo_validate_same_placement  ==============
[06:06:31] [PASSED] System manager
[06:06:31] [PASSED] VRAM manager
[06:06:31] ========= [PASSED] ttm_bo_validate_same_placement ==========
[06:06:31] [PASSED] ttm_bo_validate_failed_alloc
[06:06:31] [PASSED] ttm_bo_validate_pinned
[06:06:31] [PASSED] ttm_bo_validate_busy_placement
[06:06:31] ================ ttm_bo_validate_multihop  =================
[06:06:31] [PASSED] Buffer object for userspace
[06:06:31] [PASSED] Kernel buffer object
[06:06:31] [PASSED] Shared buffer object
[06:06:31] ============ [PASSED] ttm_bo_validate_multihop =============
[06:06:31] ========== ttm_bo_validate_no_placement_signaled  ==========
[06:06:31] [PASSED] Buffer object in system domain, no page vector
[06:06:31] [PASSED] Buffer object in system domain with an existing page vector
[06:06:31] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[06:06:31] ======== ttm_bo_validate_no_placement_not_signaled  ========
[06:06:31] [PASSED] Buffer object for userspace
[06:06:31] [PASSED] Kernel buffer object
[06:06:31] [PASSED] Shared buffer object
[06:06:31] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[06:06:31] [PASSED] ttm_bo_validate_move_fence_signaled
[06:06:31] ========= ttm_bo_validate_move_fence_not_signaled  =========
[06:06:31] [PASSED] Waits for GPU
[06:06:31] [PASSED] Tries to lock straight away
[06:06:31] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[06:06:31] [PASSED] ttm_bo_validate_swapout
[06:06:31] [PASSED] ttm_bo_validate_happy_evict
[06:06:31] [PASSED] ttm_bo_validate_all_pinned_evict
[06:06:31] [PASSED] ttm_bo_validate_allowed_only_evict
[06:06:31] [PASSED] ttm_bo_validate_deleted_evict
[06:06:31] [PASSED] ttm_bo_validate_busy_domain_evict
[06:06:31] [PASSED] ttm_bo_validate_evict_gutting
[06:06:31] [PASSED] ttm_bo_validate_recrusive_evict
[06:06:31] ================= [PASSED] ttm_bo_validate =================
[06:06:31] ============================================================
[06:06:31] Testing complete. Ran 106 tests: passed: 106
[06:06:31] Elapsed time: 12.006s total, 1.781s configuring, 9.961s building, 0.232s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/dma-buf/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[06:06:32] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:06:33] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[06:06:42] Starting KUnit Kernel (1/1)...
[06:06:42] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[06:06:42] ============= refcount_interrupt (4 subtests) ==============
[06:06:42] [PASSED] test_single_irq_change
[06:06:42] [PASSED] test_nested_irq_change
[06:06:42] [PASSED] test_multiple_irq_change
[06:06:42] [PASSED] test_irq_save
[06:06:42] =============== [PASSED] refcount_interrupt ================
[06:06:42] =============== dma-buf-fence (12 subtests) ================
[06:06:42] [PASSED] test_sanitycheck
[06:06:42] [PASSED] test_signaling
[06:06:42] [PASSED] test_add_callback
[06:06:42] [PASSED] test_late_add_callback
[06:06:42] [PASSED] test_rm_callback
[06:06:42] [PASSED] test_late_rm_callback
[06:06:42] [PASSED] test_status
[06:06:42] [PASSED] test_error
[06:06:42] [PASSED] test_wait
[06:06:42] [PASSED] test_wait_timeout
[06:06:42] [PASSED] test_stub
[06:06:42] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[06:06:42] ================== [PASSED] dma-buf-fence ==================
[06:06:42] ============ dma-buf-fence-chain (11 subtests) =============
[06:06:42] [PASSED] test_sanitycheck
[06:06:42] [PASSED] test_find_seqno
[06:06:42] [PASSED] test_find_signaled
[06:06:42] [PASSED] test_find_out_of_order
[06:06:47] [PASSED] test_find_gap
[06:06:47] [PASSED] test_find_race
[06:06:47] [PASSED] test_signal_forward
[06:06:48] [PASSED] test_signal_backward
[06:06:48] [PASSED] test_wait_forward
[06:06:48] [PASSED] test_wait_backward
[06:06:48] [PASSED] test_wait_random
[06:06:48] =============== [PASSED] dma-buf-fence-chain ===============
[06:06:48] ============ dma-buf-fence-unwrap (10 subtests) ============
[06:06:48] [PASSED] test_sanitycheck
[06:06:48] [PASSED] test_unwrap_array
[06:06:48] [PASSED] test_unwrap_chain
[06:06:48] [PASSED] test_unwrap_chain_array
[06:06:48] [PASSED] test_unwrap_merge
[06:06:48] [PASSED] test_unwrap_merge_duplicate
[06:06:48] [PASSED] test_unwrap_merge_seqno
[06:06:48] [PASSED] test_unwrap_merge_order
[06:06:48] [PASSED] test_unwrap_merge_complex
[06:06:48] [PASSED] test_unwrap_merge_complex_seqno
[06:06:48] ============== [PASSED] dma-buf-fence-unwrap ===============
[06:06:48] ================ dma-buf-resv (5 subtests) =================
[06:06:48] [PASSED] test_sanitycheck
[06:06:48] ===================== test_signaling  ======================
[06:06:48] [PASSED] kernel
[06:06:48] [PASSED] write
[06:06:48] [PASSED] read
[06:06:48] [PASSED] bookkeep
[06:06:48] ================= [PASSED] test_signaling ==================
[06:06:48] ====================== test_for_each  ======================
[06:06:48] [PASSED] kernel
[06:06:48] [PASSED] write
[06:06:48] [PASSED] read
[06:06:48] [PASSED] bookkeep
[06:06:48] ================== [PASSED] test_for_each ==================
[06:06:48] ================= test_for_each_unlocked  ==================
[06:06:48] [PASSED] kernel
[06:06:48] [PASSED] write
[06:06:48] [PASSED] read
[06:06:48] [PASSED] bookkeep
[06:06:48] ============= [PASSED] test_for_each_unlocked ==============
[06:06:48] ===================== test_get_fences  =====================
[06:06:48] [PASSED] kernel
[06:06:48] [PASSED] write
[06:06:48] [PASSED] read
[06:06:48] [PASSED] bookkeep
[06:06:48] ================= [PASSED] test_get_fences =================
[06:06:48] ================== [PASSED] dma-buf-resv ===================
[06:06:48] ============================================================
[06:06:48] Testing complete. Ran 54 tests: passed: 53, skipped: 1
[06:06:48] Elapsed time: 15.969s total, 1.801s configuring, 8.796s building, 5.358s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


