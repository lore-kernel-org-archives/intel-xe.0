Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22863C98307
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 15:59:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEC710EDB3;
	Tue, 22 Sep 2026 15:59:44 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B624C10EDBC;
 Tue, 22 Sep 2026 15:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/=7Bi915=2Cxe=7D=3A_some_su?=
 =?utf-8?q?spend/shutdown/resume_unification?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Sep 2026 15:59:43 -0000
Message-ID: <179009278373.193931.5143696341242506554@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1790089118.git.jani.nikula@intel.com>
In-Reply-To: <cover.1790089118.git.jani.nikula@intel.com>
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

Series: drm/{i915,xe}: some suspend/shutdown/resume unification
URL   : https://patchwork.freedesktop.org/series/174724/
State : success

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[15:57:38] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:57:43] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[15:58:03] Starting KUnit Kernel (1/1)...
[15:58:03] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[15:58:03] ============= refcount_interrupt (4 subtests) ==============
[15:58:03] [PASSED] test_single_irq_change
[15:58:03] [PASSED] test_nested_irq_change
[15:58:03] [PASSED] test_multiple_irq_change
[15:58:03] [PASSED] test_irq_save
[15:58:03] =============== [PASSED] refcount_interrupt ================
[15:58:03] ================= gpu_buddy (14 subtests) ==================
[15:58:03] [PASSED] gpu_test_buddy_alloc_limit
[15:58:03] [PASSED] gpu_test_buddy_alloc_optimistic
[15:58:03] [PASSED] gpu_test_buddy_alloc_pessimistic
[15:58:03] [PASSED] gpu_test_buddy_alloc_pathological
[15:58:03] [PASSED] gpu_test_buddy_alloc_contiguous
[15:58:03] [PASSED] gpu_test_buddy_alloc_clear
[15:58:03] [PASSED] gpu_test_buddy_alloc_range
[15:58:03] [PASSED] gpu_test_buddy_alloc_range_bias
[15:58:04] [PASSED] gpu_test_buddy_fragmentation_performance
[15:58:05] [PASSED] gpu_test_buddy_dirty_tracker_performance
[15:58:05] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[15:58:05] [PASSED] gpu_test_buddy_offset_aligned_allocation
[15:58:05] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[15:58:05] [PASSED] gpu_test_buddy_addr_to_block
[15:58:05] ==================== [PASSED] gpu_buddy ====================
[15:58:05] ============================================================
[15:58:05] Testing complete. Ran 18 tests: passed: 18
[15:58:05] Elapsed time: 26.823s total, 4.392s configuring, 20.312s building, 2.047s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[15:58:05] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:58:07] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[15:58:41] Starting KUnit Kernel (1/1)...
[15:58:41] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[15:58:42] ============= refcount_interrupt (4 subtests) ==============
[15:58:42] [PASSED] test_single_irq_change
[15:58:42] [PASSED] test_nested_irq_change
[15:58:42] [PASSED] test_multiple_irq_change
[15:58:42] [PASSED] test_irq_save
[15:58:42] =============== [PASSED] refcount_interrupt ================
[15:58:42] ================== guc_buf (11 subtests) ===================
[15:58:42] [PASSED] test_smallest
[15:58:42] [PASSED] test_largest
[15:58:42] [PASSED] test_granular
[15:58:42] [PASSED] test_unique
[15:58:42] [PASSED] test_overlap
[15:58:42] [PASSED] test_reusable
[15:58:42] [PASSED] test_too_big
[15:58:42] [PASSED] test_flush
[15:58:42] [PASSED] test_lookup
[15:58:42] [PASSED] test_data
[15:58:42] [PASSED] test_class
[15:58:42] ===================== [PASSED] guc_buf =====================
[15:58:42] =================== guc_dbm (7 subtests) ===================
[15:58:42] [PASSED] test_empty
[15:58:42] [PASSED] test_default
[15:58:42] ======================== test_size  ========================
[15:58:42] [PASSED] 4
[15:58:42] [PASSED] 8
[15:58:42] [PASSED] 32
[15:58:42] [PASSED] 256
[15:58:42] ==================== [PASSED] test_size ====================
[15:58:42] ======================= test_reuse  ========================
[15:58:42] [PASSED] 4
[15:58:42] [PASSED] 8
[15:58:42] [PASSED] 32
[15:58:42] [PASSED] 256
[15:58:42] =================== [PASSED] test_reuse ====================
[15:58:42] =================== test_range_overlap  ====================
[15:58:42] [PASSED] 4
[15:58:42] [PASSED] 8
[15:58:42] [PASSED] 32
[15:58:42] [PASSED] 256
[15:58:42] =============== [PASSED] test_range_overlap ================
[15:58:42] =================== test_range_compact  ====================
[15:58:42] [PASSED] 4
[15:58:42] [PASSED] 8
[15:58:42] [PASSED] 32
[15:58:42] [PASSED] 256
[15:58:42] =============== [PASSED] test_range_compact ================
[15:58:42] ==================== test_range_spare  =====================
[15:58:42] [PASSED] 4
[15:58:42] [PASSED] 8
[15:58:42] [PASSED] 32
[15:58:42] [PASSED] 256
[15:58:42] ================ [PASSED] test_range_spare =================
[15:58:42] ===================== [PASSED] guc_dbm =====================
[15:58:42] =================== guc_idm (6 subtests) ===================
[15:58:42] [PASSED] bad_init
[15:58:42] [PASSED] no_init
[15:58:42] [PASSED] init_fini
[15:58:42] [PASSED] check_used
[15:58:42] [PASSED] check_quota
[15:58:42] [PASSED] check_all
[15:58:42] ===================== [PASSED] guc_idm =====================
[15:58:42] ============== guc_klv_helpers (13 subtests) ===============
[15:58:42] [PASSED] test_count
[15:58:42] [PASSED] test_encode_u32
[15:58:42] [PASSED] test_encode_u64
[15:58:42] [PASSED] test_encode_string
[15:58:42] [PASSED] test_encode_object_raw
[15:58:42] [PASSED] test_encode_object_klv
[15:58:42] [PASSED] test_encode_object_nested
[15:58:42] [PASSED] test_encode_object_basic
[15:58:42] ===================== test_decode_u16  =====================
[15:58:42] [PASSED] empty
[15:58:42] [PASSED] valid
[15:58:42] [PASSED] max
[15:58:42] [PASSED] big
[15:58:42] [PASSED] long
[15:58:42] ================= [PASSED] test_decode_u16 =================
[15:58:42] ===================== test_decode_u32  =====================
[15:58:42] [PASSED] empty
[15:58:42] [PASSED] valid
[15:58:42] [PASSED] max
[15:58:42] [PASSED] long
[15:58:42] ================= [PASSED] test_decode_u32 =================
[15:58:42] ===================== test_decode_u64  =====================
[15:58:42] [PASSED] empty
[15:58:42] [PASSED] short
[15:58:42] [PASSED] valid
[15:58:42] [PASSED] max
[15:58:42] [PASSED] long
[15:58:42] ================= [PASSED] test_decode_u64 =================
[15:58:42] ===================== test_decode_str  =====================
[15:58:42] [PASSED] empty
[15:58:42] [PASSED] one
[15:58:42] [PASSED] one_trash
[15:58:42] [PASSED] two
[15:58:42] [PASSED] two_trash
[15:58:42] [PASSED] three
[15:58:42] [PASSED] dword
[15:58:42] [PASSED] four
[15:58:42] [PASSED] five
[15:58:42] [PASSED] six
[15:58:42] [PASSED] seven
[15:58:42] [PASSED] qword
[15:58:42] ================= [PASSED] test_decode_str =================
[15:58:42] [PASSED] test_print
[15:58:42] ================= [PASSED] guc_klv_helpers =================
[15:58:42] =================== xe_log (4 subtests) ====================
[15:58:42] [PASSED] demo_cper
[15:58:42] [PASSED] demo_dmesg
[15:58:42] ======================= test_dmesg  ========================
[15:58:42] [PASSED] test_fatal
[15:58:42] [PASSED] test_fatal_tile
[15:58:42] [PASSED] test_fatal_gt
[15:58:42] [PASSED] test_fatal_comp
[15:58:42] [PASSED] test_fatal_comp_tile
[15:58:42] [PASSED] test_fatal_comp_gt
[15:58:42] [PASSED] test_fatal_all
[15:58:42] [PASSED] test_recoverable
[15:58:42] [PASSED] test_recoverable_tile
[15:58:42] [PASSED] test_recoverable_gt
[15:58:42] [PASSED] test_recoverable_comp
[15:58:42] [PASSED] test_recoverable_comp_tile
[15:58:42] [PASSED] test_recoverable_comp_gt
[15:58:42] [PASSED] test_recoverable_all
[15:58:42] [PASSED] test_info
[15:58:42] [PASSED] test_info_tile
[15:58:42] [PASSED] test_info_gt
[15:58:42] [PASSED] test_info_err
[15:58:42] [PASSED] test_info_comp
[15:58:42] [PASSED] test_info_comp_tile
[15:58:42] [PASSED] test_info_comp_gt
[15:58:42] [PASSED] test_info_all
[15:58:42] [PASSED] test_hw_fatal
[15:58:42] [PASSED] test_hw_recoverable
[15:58:42] [PASSED] test_hw_corrected
[15:58:42] [PASSED] test_hw_informational
[15:58:42] =================== [PASSED] test_dmesg ====================
[15:58:42] ====================== test_invalid  =======================
[15:58:42] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[15:58:42] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[15:58:42] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[15:58:42] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[15:58:42] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[15:58:42] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[15:58:42] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[15:58:42] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[15:58:42] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[15:58:42] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[15:58:42] ================== [SKIPPED] test_invalid ==================
[15:58:42] ===================== [PASSED] xe_log ======================
[15:58:42] ================== no_relay (3 subtests) ===================
[15:58:42] [PASSED] xe_drops_guc2pf_if_not_ready
[15:58:42] [PASSED] xe_drops_guc2vf_if_not_ready
[15:58:42] [PASSED] xe_rejects_send_if_not_ready
[15:58:42] ==================== [PASSED] no_relay =====================
[15:58:42] ================== pf_relay (14 subtests) ==================
[15:58:42] [PASSED] pf_rejects_guc2pf_too_short
[15:58:42] [PASSED] pf_rejects_guc2pf_too_long
[15:58:42] [PASSED] pf_rejects_guc2pf_no_payload
[15:58:42] [PASSED] pf_fails_no_payload
[15:58:42] [PASSED] pf_fails_bad_origin
[15:58:42] [PASSED] pf_fails_bad_type
[15:58:42] [PASSED] pf_txn_reports_error
[15:58:42] [PASSED] pf_txn_sends_pf2guc
[15:58:42] [PASSED] pf_sends_pf2guc
[15:58:42] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[15:58:42] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[15:58:42] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[15:58:42] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[15:58:42] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[15:58:42] ==================== [PASSED] pf_relay =====================
[15:58:42] ================== vf_relay (3 subtests) ===================
[15:58:42] [PASSED] vf_rejects_guc2vf_too_short
[15:58:42] [PASSED] vf_rejects_guc2vf_too_long
[15:58:42] [PASSED] vf_rejects_guc2vf_no_payload
[15:58:42] ==================== [PASSED] vf_relay =====================
[15:58:42] ================ pf_gt_config (9 subtests) =================
[15:58:42] [PASSED] fair_contexts_1vf
[15:58:42] [PASSED] fair_doorbells_1vf
[15:58:42] [PASSED] fair_ggtt_1vf
[15:58:42] ====================== fair_vram_1vf  ======================
[15:58:42] [PASSED] 3.50 GiB
[15:58:42] [PASSED] 11.5 GiB
[15:58:42] [PASSED] 15.5 GiB
[15:58:42] [PASSED] 31.5 GiB
[15:58:42] [PASSED] 63.5 GiB
[15:58:42] [PASSED] 1.91 GiB
[15:58:42] ================== [PASSED] fair_vram_1vf ==================
[15:58:42] ================ fair_vram_1vf_admin_only  =================
[15:58:42] [PASSED] 3.50 GiB
[15:58:42] [PASSED] 11.5 GiB
[15:58:42] [PASSED] 15.5 GiB
[15:58:42] [PASSED] 31.5 GiB
[15:58:42] [PASSED] 63.5 GiB
[15:58:42] [PASSED] 1.91 GiB
[15:58:42] ============ [PASSED] fair_vram_1vf_admin_only =============
[15:58:42] ====================== fair_contexts  ======================
[15:58:42] [PASSED] 1 VF
[15:58:42] [PASSED] 2 VFs
[15:58:42] [PASSED] 3 VFs
[15:58:42] [PASSED] 4 VFs
[15:58:42] [PASSED] 5 VFs
[15:58:42] [PASSED] 6 VFs
[15:58:42] [PASSED] 7 VFs
[15:58:42] [PASSED] 8 VFs
[15:58:42] [PASSED] 9 VFs
[15:58:42] [PASSED] 10 VFs
[15:58:42] [PASSED] 11 VFs
[15:58:42] [PASSED] 12 VFs
[15:58:42] [PASSED] 13 VFs
[15:58:42] [PASSED] 14 VFs
[15:58:42] [PASSED] 15 VFs
[15:58:42] [PASSED] 16 VFs
[15:58:42] [PASSED] 17 VFs
[15:58:42] [PASSED] 18 VFs
[15:58:42] [PASSED] 19 VFs
[15:58:42] [PASSED] 20 VFs
[15:58:42] [PASSED] 21 VFs
[15:58:42] [PASSED] 22 VFs
[15:58:42] [PASSED] 23 VFs
[15:58:42] [PASSED] 24 VFs
[15:58:42] [PASSED] 25 VFs
[15:58:42] [PASSED] 26 VFs
[15:58:42] [PASSED] 27 VFs
[15:58:42] [PASSED] 28 VFs
[15:58:42] [PASSED] 29 VFs
[15:58:42] [PASSED] 30 VFs
[15:58:42] [PASSED] 31 VFs
[15:58:42] [PASSED] 32 VFs
[15:58:42] [PASSED] 33 VFs
[15:58:42] [PASSED] 34 VFs
[15:58:42] [PASSED] 35 VFs
[15:58:42] [PASSED] 36 VFs
[15:58:42] [PASSED] 37 VFs
[15:58:42] [PASSED] 38 VFs
[15:58:42] [PASSED] 39 VFs
[15:58:42] [PASSED] 40 VFs
[15:58:42] [PASSED] 41 VFs
[15:58:42] [PASSED] 42 VFs
[15:58:42] [PASSED] 43 VFs
[15:58:42] [PASSED] 44 VFs
[15:58:42] [PASSED] 45 VFs
[15:58:42] [PASSED] 46 VFs
[15:58:42] [PASSED] 47 VFs
[15:58:42] [PASSED] 48 VFs
[15:58:42] [PASSED] 49 VFs
[15:58:42] [PASSED] 50 VFs
[15:58:42] [PASSED] 51 VFs
[15:58:42] [PASSED] 52 VFs
[15:58:42] [PASSED] 53 VFs
[15:58:42] [PASSED] 54 VFs
[15:58:42] [PASSED] 55 VFs
[15:58:42] [PASSED] 56 VFs
[15:58:42] [PASSED] 57 VFs
[15:58:42] [PASSED] 58 VFs
[15:58:42] [PASSED] 59 VFs
[15:58:42] [PASSED] 60 VFs
[15:58:42] [PASSED] 61 VFs
[15:58:42] [PASSED] 62 VFs
[15:58:42] [PASSED] 63 VFs
[15:58:42] ================== [PASSED] fair_contexts ==================
[15:58:42] ===================== fair_doorbells  ======================
[15:58:42] [PASSED] 1 VF
[15:58:42] [PASSED] 2 VFs
[15:58:42] [PASSED] 3 VFs
[15:58:42] [PASSED] 4 VFs
[15:58:42] [PASSED] 5 VFs
[15:58:42] [PASSED] 6 VFs
[15:58:42] [PASSED] 7 VFs
[15:58:42] [PASSED] 8 VFs
[15:58:42] [PASSED] 9 VFs
[15:58:42] [PASSED] 10 VFs
[15:58:42] [PASSED] 11 VFs
[15:58:42] [PASSED] 12 VFs
[15:58:42] [PASSED] 13 VFs
[15:58:42] [PASSED] 14 VFs
[15:58:42] [PASSED] 15 VFs
[15:58:42] [PASSED] 16 VFs
[15:58:42] [PASSED] 17 VFs
[15:58:42] [PASSED] 18 VFs
[15:58:42] [PASSED] 19 VFs
[15:58:42] [PASSED] 20 VFs
[15:58:42] [PASSED] 21 VFs
[15:58:42] [PASSED] 22 VFs
[15:58:42] [PASSED] 23 VFs
[15:58:42] [PASSED] 24 VFs
[15:58:42] [PASSED] 25 VFs
[15:58:42] [PASSED] 26 VFs
[15:58:42] [PASSED] 27 VFs
[15:58:42] [PASSED] 28 VFs
[15:58:42] [PASSED] 29 VFs
[15:58:42] [PASSED] 30 VFs
[15:58:42] [PASSED] 31 VFs
[15:58:42] [PASSED] 32 VFs
[15:58:42] [PASSED] 33 VFs
[15:58:42] [PASSED] 34 VFs
[15:58:42] [PASSED] 35 VFs
[15:58:42] [PASSED] 36 VFs
[15:58:42] [PASSED] 37 VFs
[15:58:42] [PASSED] 38 VFs
[15:58:42] [PASSED] 39 VFs
[15:58:42] [PASSED] 40 VFs
[15:58:42] [PASSED] 41 VFs
[15:58:42] [PASSED] 42 VFs
[15:58:42] [PASSED] 43 VFs
[15:58:42] [PASSED] 44 VFs
[15:58:42] [PASSED] 45 VFs
[15:58:42] [PASSED] 46 VFs
[15:58:42] [PASSED] 47 VFs
[15:58:42] [PASSED] 48 VFs
[15:58:42] [PASSED] 49 VFs
[15:58:42] [PASSED] 50 VFs
[15:58:42] [PASSED] 51 VFs
[15:58:42] [PASSED] 52 VFs
[15:58:42] [PASSED] 53 VFs
[15:58:42] [PASSED] 54 VFs
[15:58:42] [PASSED] 55 VFs
[15:58:42] [PASSED] 56 VFs
[15:58:42] [PASSED] 57 VFs
[15:58:42] [PASSED] 58 VFs
[15:58:42] [PASSED] 59 VFs
[15:58:42] [PASSED] 60 VFs
[15:58:42] [PASSED] 61 VFs
[15:58:42] [PASSED] 62 VFs
[15:58:42] [PASSED] 63 VFs
[15:58:42] ================= [PASSED] fair_doorbells ==================
[15:58:42] ======================== fair_ggtt  ========================
[15:58:42] [PASSED] 1 VF
[15:58:42] [PASSED] 2 VFs
[15:58:42] [PASSED] 3 VFs
[15:58:42] [PASSED] 4 VFs
[15:58:42] [PASSED] 5 VFs
[15:58:42] [PASSED] 6 VFs
[15:58:42] [PASSED] 7 VFs
[15:58:42] [PASSED] 8 VFs
[15:58:42] [PASSED] 9 VFs
[15:58:42] [PASSED] 10 VFs
[15:58:42] [PASSED] 11 VFs
[15:58:42] [PASSED] 12 VFs
[15:58:42] [PASSED] 13 VFs
[15:58:42] [PASSED] 14 VFs
[15:58:42] [PASSED] 15 VFs
[15:58:42] [PASSED] 16 VFs
[15:58:42] [PASSED] 17 VFs
[15:58:42] [PASSED] 18 VFs
[15:58:42] [PASSED] 19 VFs
[15:58:42] [PASSED] 20 VFs
[15:58:42] [PASSED] 21 VFs
[15:58:42] [PASSED] 22 VFs
[15:58:42] [PASSED] 23 VFs
[15:58:42] [PASSED] 24 VFs
[15:58:42] [PASSED] 25 VFs
[15:58:42] [PASSED] 26 VFs
[15:58:42] [PASSED] 27 VFs
[15:58:42] [PASSED] 28 VFs
[15:58:42] [PASSED] 29 VFs
[15:58:42] [PASSED] 30 VFs
[15:58:42] [PASSED] 31 VFs
[15:58:42] [PASSED] 32 VFs
[15:58:42] [PASSED] 33 VFs
[15:58:42] [PASSED] 34 VFs
[15:58:42] [PASSED] 35 VFs
[15:58:42] [PASSED] 36 VFs
[15:58:42] [PASSED] 37 VFs
[15:58:42] [PASSED] 38 VFs
[15:58:42] [PASSED] 39 VFs
[15:58:42] [PASSED] 40 VFs
[15:58:42] [PASSED] 41 VFs
[15:58:42] [PASSED] 42 VFs
[15:58:42] [PASSED] 43 VFs
[15:58:42] [PASSED] 44 VFs
[15:58:42] [PASSED] 45 VFs
[15:58:42] [PASSED] 46 VFs
[15:58:42] [PASSED] 47 VFs
[15:58:42] [PASSED] 48 VFs
[15:58:42] [PASSED] 49 VFs
[15:58:42] [PASSED] 50 VFs
[15:58:42] [PASSED] 51 VFs
[15:58:42] [PASSED] 52 VFs
[15:58:42] [PASSED] 53 VFs
[15:58:42] [PASSED] 54 VFs
[15:58:42] [PASSED] 55 VFs
[15:58:42] [PASSED] 56 VFs
[15:58:42] [PASSED] 57 VFs
[15:58:42] [PASSED] 58 VFs
[15:58:42] [PASSED] 59 VFs
[15:58:42] [PASSED] 60 VFs
[15:58:42] [PASSED] 61 VFs
[15:58:42] [PASSED] 62 VFs
[15:58:42] [PASSED] 63 VFs
[15:58:42] ==================== [PASSED] fair_ggtt ====================
[15:58:42] ======================== fair_vram  ========================
[15:58:42] [PASSED] 1 VF
[15:58:42] [PASSED] 2 VFs
[15:58:42] [PASSED] 3 VFs
[15:58:42] [PASSED] 4 VFs
[15:58:42] [PASSED] 5 VFs
[15:58:42] [PASSED] 6 VFs
[15:58:42] [PASSED] 7 VFs
[15:58:42] [PASSED] 8 VFs
[15:58:42] [PASSED] 9 VFs
[15:58:42] [PASSED] 10 VFs
[15:58:42] [PASSED] 11 VFs
[15:58:42] [PASSED] 12 VFs
[15:58:42] [PASSED] 13 VFs
[15:58:42] [PASSED] 14 VFs
[15:58:42] [PASSED] 15 VFs
[15:58:42] [PASSED] 16 VFs
[15:58:42] [PASSED] 17 VFs
[15:58:42] [PASSED] 18 VFs
[15:58:42] [PASSED] 19 VFs
[15:58:42] [PASSED] 20 VFs
[15:58:42] [PASSED] 21 VFs
[15:58:42] [PASSED] 22 VFs
[15:58:42] [PASSED] 23 VFs
[15:58:42] [PASSED] 24 VFs
[15:58:42] [PASSED] 25 VFs
[15:58:42] [PASSED] 26 VFs
[15:58:42] [PASSED] 27 VFs
[15:58:42] [PASSED] 28 VFs
[15:58:42] [PASSED] 29 VFs
[15:58:42] [PASSED] 30 VFs
[15:58:42] [PASSED] 31 VFs
[15:58:42] [PASSED] 32 VFs
[15:58:42] [PASSED] 33 VFs
[15:58:42] [PASSED] 34 VFs
[15:58:42] [PASSED] 35 VFs
[15:58:42] [PASSED] 36 VFs
[15:58:42] [PASSED] 37 VFs
[15:58:42] [PASSED] 38 VFs
[15:58:42] [PASSED] 39 VFs
[15:58:42] [PASSED] 40 VFs
[15:58:42] [PASSED] 41 VFs
[15:58:42] [PASSED] 42 VFs
[15:58:42] [PASSED] 43 VFs
[15:58:42] [PASSED] 44 VFs
[15:58:42] [PASSED] 45 VFs
[15:58:42] [PASSED] 46 VFs
[15:58:42] [PASSED] 47 VFs
[15:58:42] [PASSED] 48 VFs
[15:58:42] [PASSED] 49 VFs
[15:58:42] [PASSED] 50 VFs
[15:58:42] [PASSED] 51 VFs
[15:58:42] [PASSED] 52 VFs
[15:58:42] [PASSED] 53 VFs
[15:58:42] [PASSED] 54 VFs
[15:58:42] [PASSED] 55 VFs
[15:58:42] [PASSED] 56 VFs
[15:58:42] [PASSED] 57 VFs
[15:58:42] [PASSED] 58 VFs
[15:58:42] [PASSED] 59 VFs
[15:58:42] [PASSED] 60 VFs
[15:58:42] [PASSED] 61 VFs
[15:58:42] [PASSED] 62 VFs
[15:58:42] [PASSED] 63 VFs
[15:58:42] ==================== [PASSED] fair_vram ====================
[15:58:42] ================== [PASSED] pf_gt_config ===================
[15:58:42] ===================== lmtt (1 subtest) =====================
[15:58:42] ======================== test_ops  =========================
[15:58:42] [PASSED] 2-level
[15:58:42] [PASSED] multi-level
[15:58:42] ==================== [PASSED] test_ops =====================
[15:58:42] ====================== [PASSED] lmtt =======================
[15:58:42] ================= sriov_packet (1 subtest) =================
[15:58:42] [PASSED] test_descriptor_init
[15:58:42] ================== [PASSED] sriov_packet ===================
[15:58:42] ================= pf_service (11 subtests) =================
[15:58:42] [PASSED] pf_negotiate_any
[15:58:42] [PASSED] pf_negotiate_base_match
[15:58:42] [PASSED] pf_negotiate_base_newer
[15:58:42] [PASSED] pf_negotiate_base_next
[15:58:42] [SKIPPED] pf_negotiate_base_older (no older minor)
[15:58:42] [PASSED] pf_negotiate_base_prev
[15:58:42] [PASSED] pf_negotiate_latest_match
[15:58:42] [PASSED] pf_negotiate_latest_newer
[15:58:42] [PASSED] pf_negotiate_latest_next
[15:58:42] [SKIPPED] pf_negotiate_latest_older (no older minor)
[15:58:42] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[15:58:42] =================== [PASSED] pf_service ====================
[15:58:42] ================= xe_guc_g2g (2 subtests) ==================
[15:58:42] ============== xe_live_guc_g2g_kunit_default  ==============
[15:58:42] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[15:58:42] ============== xe_live_guc_g2g_kunit_allmem  ===============
[15:58:42] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[15:58:42] =================== [SKIPPED] xe_guc_g2g ===================
[15:58:42] =================== xe_mocs (2 subtests) ===================
[15:58:42] ================ xe_live_mocs_kernel_kunit  ================
[15:58:42] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[15:58:42] ================ xe_live_mocs_reset_kunit  =================
[15:58:42] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[15:58:42] ==================== [SKIPPED] xe_mocs =====================
[15:58:42] ================= xe_migrate (2 subtests) ==================
[15:58:42] ================= xe_migrate_sanity_kunit  =================
[15:58:42] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[15:58:42] ================== xe_validate_ccs_kunit  ==================
[15:58:42] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[15:58:42] =================== [SKIPPED] xe_migrate ===================
[15:58:42] ================== xe_dma_buf (1 subtest) ==================
[15:58:42] ==================== xe_dma_buf_kunit  =====================
[15:58:42] ================ [SKIPPED] xe_dma_buf_kunit ================
[15:58:42] =================== [SKIPPED] xe_dma_buf ===================
[15:58:42] ================= xe_bo_shrink (1 subtest) =================
[15:58:42] =================== xe_bo_shrink_kunit  ====================
[15:58:42] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[15:58:42] ================== [SKIPPED] xe_bo_shrink ==================
[15:58:42] ==================== xe_bo (2 subtests) ====================
[15:58:42] ================== xe_ccs_migrate_kunit  ===================
[15:58:42] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[15:58:42] ==================== xe_bo_evict_kunit  ====================
[15:58:42] =============== [SKIPPED] xe_bo_evict_kunit ================
[15:58:42] ===================== [SKIPPED] xe_bo ======================
[15:58:42] =================== xe_any (9 subtests) ====================
[15:58:42] [PASSED] test_to_xe
[15:58:42] [PASSED] test_to_dev
[15:58:42] [PASSED] test_to_pdev
[15:58:42] [PASSED] test_to_drm
[15:58:42] [PASSED] test_if_pdev
[15:58:42] [PASSED] test_if_xe
[15:58:42] [PASSED] test_if_tile
[15:58:42] [PASSED] test_if_gt
[15:58:42] [PASSED] test_to_id
[15:58:42] ===================== [PASSED] xe_any ======================
[15:58:42] ==================== args (13 subtests) ====================
[15:58:42] [PASSED] count_args_test
[15:58:42] [PASSED] call_args_example
[15:58:42] [PASSED] call_args_test
[15:58:42] [PASSED] drop_first_arg_example
[15:58:42] [PASSED] drop_first_arg_test
[15:58:42] [PASSED] first_arg_example
[15:58:42] [PASSED] first_arg_test
[15:58:42] [PASSED] last_arg_example
[15:58:42] [PASSED] last_arg_test
[15:58:42] [PASSED] pick_arg_example
[15:58:42] [PASSED] if_args_example
[15:58:42] [PASSED] if_args_test
[15:58:42] [PASSED] sep_comma_example
[15:58:42] ====================== [PASSED] args =======================
[15:58:42] =================== xe_pci (3 subtests) ====================
[15:58:42] ==================== check_graphics_ip  ====================
[15:58:42] [PASSED] 12.00 Xe_LP
[15:58:42] [PASSED] 12.10 Xe_LP+
[15:58:42] [PASSED] 12.55 Xe_HPG
[15:58:42] [PASSED] 12.60 Xe_HPC
[15:58:42] [PASSED] 12.70 Xe_LPG
[15:58:42] [PASSED] 12.71 Xe_LPG
[15:58:42] [PASSED] 12.74 Xe_LPG+
[15:58:42] [PASSED] 20.01 Xe2_HPG
[15:58:42] [PASSED] 20.02 Xe2_HPG
[15:58:42] [PASSED] 20.04 Xe2_LPG
[15:58:42] [PASSED] 30.00 Xe3_LPG
[15:58:42] [PASSED] 30.01 Xe3_LPG
[15:58:42] [PASSED] 30.03 Xe3_LPG
[15:58:42] [PASSED] 30.04 Xe3_LPG
[15:58:42] [PASSED] 30.05 Xe3_LPG
[15:58:42] [PASSED] 35.10 Xe3p_LPG
[15:58:42] [PASSED] 35.11 Xe3p_XPC
[15:58:42] ================ [PASSED] check_graphics_ip ================
[15:58:42] ===================== check_media_ip  ======================
[15:58:42] [PASSED] 12.00 Xe_M
[15:58:42] [PASSED] 12.55 Xe_HPM
[15:58:42] [PASSED] 13.00 Xe_LPM+
[15:58:42] [PASSED] 13.01 Xe2_HPM
[15:58:42] [PASSED] 20.00 Xe2_LPM
[15:58:42] [PASSED] 30.00 Xe3_LPM
[15:58:42] [PASSED] 30.02 Xe3_LPM
[15:58:42] [PASSED] 35.00 Xe3p_LPM
[15:58:42] [PASSED] 35.03 Xe3p_HPM
[15:58:42] ================= [PASSED] check_media_ip ==================
[15:58:42] =================== check_platform_desc  ===================
[15:58:42] [PASSED] 0x9A60 (TIGERLAKE)
[15:58:42] [PASSED] 0x9A68 (TIGERLAKE)
[15:58:42] [PASSED] 0x9A70 (TIGERLAKE)
[15:58:42] [PASSED] 0x9A40 (TIGERLAKE)
[15:58:42] [PASSED] 0x9A49 (TIGERLAKE)
[15:58:42] [PASSED] 0x9A59 (TIGERLAKE)
[15:58:42] [PASSED] 0x9A78 (TIGERLAKE)
[15:58:42] [PASSED] 0x9AC0 (TIGERLAKE)
[15:58:42] [PASSED] 0x9AC9 (TIGERLAKE)
[15:58:42] [PASSED] 0x9AD9 (TIGERLAKE)
[15:58:42] [PASSED] 0x9AF8 (TIGERLAKE)
[15:58:42] [PASSED] 0x4C80 (ROCKETLAKE)
[15:58:42] [PASSED] 0x4C8A (ROCKETLAKE)
[15:58:42] [PASSED] 0x4C8B (ROCKETLAKE)
[15:58:42] [PASSED] 0x4C8C (ROCKETLAKE)
[15:58:42] [PASSED] 0x4C90 (ROCKETLAKE)
[15:58:42] [PASSED] 0x4C9A (ROCKETLAKE)
[15:58:42] [PASSED] 0x4680 (ALDERLAKE_S)
[15:58:42] [PASSED] 0x4682 (ALDERLAKE_S)
[15:58:42] [PASSED] 0x4688 (ALDERLAKE_S)
[15:58:42] [PASSED] 0x468A (ALDERLAKE_S)
[15:58:42] [PASSED] 0x468B (ALDERLAKE_S)
[15:58:42] [PASSED] 0x4690 (ALDERLAKE_S)
[15:58:42] [PASSED] 0x4692 (ALDERLAKE_S)
[15:58:42] [PASSED] 0x4693 (ALDERLAKE_S)
[15:58:42] [PASSED] 0x46A0 (ALDERLAKE_P)
[15:58:42] [PASSED] 0x46A1 (ALDERLAKE_P)
[15:58:42] [PASSED] 0x46A2 (ALDERLAKE_P)
[15:58:42] [PASSED] 0x46A3 (ALDERLAKE_P)
[15:58:42] [PASSED] 0x46A6 (ALDERLAKE_P)
[15:58:42] [PASSED] 0x46A8 (ALDERLAKE_P)
[15:58:42] [PASSED] 0x46AA (ALDERLAKE_P)
[15:58:42] [PASSED] 0x462A (ALDERLAKE_P)
[15:58:42] [PASSED] 0x4626 (ALDERLAKE_P)
[15:58:42] [PASSED] 0x4628 (ALDERLAKE_P)
[15:58:42] [PASSED] 0x46B0 (ALDERLAKE_P)
[15:58:42] [PASSED] 0x46B1 (ALDERLAKE_P)
[15:58:42] [PASSED] 0x46B2 (ALDERLAKE_P)
[15:58:42] [PASSED] 0x46B3 (ALDERLAKE_P)
[15:58:42] [PASSED] 0x46C0 (ALDERLAKE_P)
[15:58:42] [PASSED] 0x46C1 (ALDERLAKE_P)
[15:58:42] [PASSED] 0x46C2 (ALDERLAKE_P)
[15:58:42] [PASSED] 0x46C3 (ALDERLAKE_P)
[15:58:42] [PASSED] 0x46D0 (ALDERLAKE_N)
[15:58:42] [PASSED] 0x46D1 (ALDERLAKE_N)
[15:58:42] [PASSED] 0x46D2 (ALDERLAKE_N)
[15:58:42] [PASSED] 0x46D3 (ALDERLAKE_N)
[15:58:42] [PASSED] 0x46D4 (ALDERLAKE_N)
[15:58:42] [PASSED] 0xA721 (ALDERLAKE_P)
[15:58:42] [PASSED] 0xA7A1 (ALDERLAKE_P)
[15:58:42] [PASSED] 0xA7A9 (ALDERLAKE_P)
[15:58:42] [PASSED] 0xA7AC (ALDERLAKE_P)
[15:58:42] [PASSED] 0xA7AD (ALDERLAKE_P)
[15:58:42] [PASSED] 0xA720 (ALDERLAKE_P)
[15:58:42] [PASSED] 0xA7A0 (ALDERLAKE_P)
[15:58:42] [PASSED] 0xA7A8 (ALDERLAKE_P)
[15:58:42] [PASSED] 0xA7AA (ALDERLAKE_P)
[15:58:42] [PASSED] 0xA7AB (ALDERLAKE_P)
[15:58:42] [PASSED] 0xA780 (ALDERLAKE_S)
[15:58:42] [PASSED] 0xA781 (ALDERLAKE_S)
[15:58:42] [PASSED] 0xA782 (ALDERLAKE_S)
[15:58:42] [PASSED] 0xA783 (ALDERLAKE_S)
[15:58:42] [PASSED] 0xA788 (ALDERLAKE_S)
[15:58:42] [PASSED] 0xA789 (ALDERLAKE_S)
[15:58:42] [PASSED] 0xA78A (ALDERLAKE_S)
[15:58:42] [PASSED] 0xA78B (ALDERLAKE_S)
[15:58:42] [PASSED] 0x4905 (DG1)
[15:58:42] [PASSED] 0x4906 (DG1)
[15:58:42] [PASSED] 0x4907 (DG1)
[15:58:42] [PASSED] 0x4908 (DG1)
[15:58:42] [PASSED] 0x4909 (DG1)
[15:58:42] [PASSED] 0x56C0 (DG2)
[15:58:42] [PASSED] 0x56C2 (DG2)
[15:58:42] [PASSED] 0x56C1 (DG2)
[15:58:42] [PASSED] 0x7D51 (METEORLAKE)
[15:58:42] [PASSED] 0x7DD1 (METEORLAKE)
[15:58:42] [PASSED] 0x7D41 (METEORLAKE)
[15:58:42] [PASSED] 0x7D67 (METEORLAKE)
[15:58:42] [PASSED] 0xB640 (METEORLAKE)
[15:58:42] [PASSED] 0x56A0 (DG2)
[15:58:42] [PASSED] 0x56A1 (DG2)
[15:58:42] [PASSED] 0x56A2 (DG2)
[15:58:42] [PASSED] 0x56BE (DG2)
[15:58:42] [PASSED] 0x56BF (DG2)
[15:58:42] [PASSED] 0x5690 (DG2)
[15:58:42] [PASSED] 0x5691 (DG2)
[15:58:42] [PASSED] 0x5692 (DG2)
[15:58:42] [PASSED] 0x56A5 (DG2)
[15:58:42] [PASSED] 0x56A6 (DG2)
[15:58:42] [PASSED] 0x56B0 (DG2)
[15:58:42] [PASSED] 0x56B1 (DG2)
[15:58:42] [PASSED] 0x56BA (DG2)
[15:58:42] [PASSED] 0x56BB (DG2)
[15:58:42] [PASSED] 0x56BC (DG2)
[15:58:42] [PASSED] 0x56BD (DG2)
[15:58:42] [PASSED] 0x5693 (DG2)
[15:58:42] [PASSED] 0x5694 (DG2)
[15:58:42] [PASSED] 0x5695 (DG2)
[15:58:42] [PASSED] 0x56A3 (DG2)
[15:58:42] [PASSED] 0x56A4 (DG2)
[15:58:42] [PASSED] 0x56B2 (DG2)
[15:58:42] [PASSED] 0x56B3 (DG2)
[15:58:42] [PASSED] 0x5696 (DG2)
[15:58:42] [PASSED] 0x5697 (DG2)
[15:58:42] [PASSED] 0xB69 (PVC)
[15:58:42] [PASSED] 0xB6E (PVC)
[15:58:42] [PASSED] 0xBD4 (PVC)
[15:58:42] [PASSED] 0xBD5 (PVC)
[15:58:42] [PASSED] 0xBD6 (PVC)
[15:58:42] [PASSED] 0xBD7 (PVC)
[15:58:42] [PASSED] 0xBD8 (PVC)
[15:58:42] [PASSED] 0xBD9 (PVC)
[15:58:42] [PASSED] 0xBDA (PVC)
[15:58:42] [PASSED] 0xBDB (PVC)
[15:58:42] [PASSED] 0xBE0 (PVC)
[15:58:42] [PASSED] 0xBE1 (PVC)
[15:58:42] [PASSED] 0xBE5 (PVC)
[15:58:42] [PASSED] 0x7D40 (METEORLAKE)
[15:58:42] [PASSED] 0x7D45 (METEORLAKE)
[15:58:42] [PASSED] 0x7D55 (METEORLAKE)
[15:58:42] [PASSED] 0x7D60 (METEORLAKE)
[15:58:42] [PASSED] 0x7DD5 (METEORLAKE)
[15:58:42] [PASSED] 0x6420 (LUNARLAKE)
[15:58:42] [PASSED] 0x64A0 (LUNARLAKE)
[15:58:42] [PASSED] 0x64B0 (LUNARLAKE)
[15:58:42] [PASSED] 0xE202 (BATTLEMAGE)
[15:58:42] [PASSED] 0xE209 (BATTLEMAGE)
[15:58:42] [PASSED] 0xE20B (BATTLEMAGE)
[15:58:42] [PASSED] 0xE20C (BATTLEMAGE)
[15:58:42] [PASSED] 0xE20D (BATTLEMAGE)
[15:58:42] [PASSED] 0xE210 (BATTLEMAGE)
[15:58:42] [PASSED] 0xE211 (BATTLEMAGE)
[15:58:42] [PASSED] 0xE212 (BATTLEMAGE)
[15:58:42] [PASSED] 0xE216 (BATTLEMAGE)
[15:58:42] [PASSED] 0xE220 (BATTLEMAGE)
[15:58:42] [PASSED] 0xE221 (BATTLEMAGE)
[15:58:42] [PASSED] 0xE222 (BATTLEMAGE)
[15:58:42] [PASSED] 0xE223 (BATTLEMAGE)
[15:58:42] [PASSED] 0xB080 (PANTHERLAKE)
[15:58:42] [PASSED] 0xB081 (PANTHERLAKE)
[15:58:42] [PASSED] 0xB082 (PANTHERLAKE)
[15:58:42] [PASSED] 0xB083 (PANTHERLAKE)
[15:58:42] [PASSED] 0xB084 (PANTHERLAKE)
[15:58:42] [PASSED] 0xB085 (PANTHERLAKE)
[15:58:42] [PASSED] 0xB086 (PANTHERLAKE)
[15:58:42] [PASSED] 0xB087 (PANTHERLAKE)
[15:58:42] [PASSED] 0xB08F (PANTHERLAKE)
[15:58:42] [PASSED] 0xB090 (PANTHERLAKE)
[15:58:42] [PASSED] 0xB0A0 (PANTHERLAKE)
[15:58:42] [PASSED] 0xB0B0 (PANTHERLAKE)
[15:58:42] [PASSED] 0xFD80 (PANTHERLAKE)
[15:58:42] [PASSED] 0xFD81 (PANTHERLAKE)
[15:58:42] [PASSED] 0xD740 (NOVALAKE_S)
[15:58:42] [PASSED] 0xD741 (NOVALAKE_S)
[15:58:42] [PASSED] 0xD742 (NOVALAKE_S)
[15:58:42] [PASSED] 0xD743 (NOVALAKE_S)
[15:58:42] [PASSED] 0xD745 (NOVALAKE_S)
[15:58:42] [PASSED] 0xD74A (NOVALAKE_S)
[15:58:42] [PASSED] 0xD74B (NOVALAKE_S)
[15:58:42] [PASSED] 0x674C (CRESCENTISLAND)
[15:58:42] [PASSED] 0x674D (CRESCENTISLAND)
[15:58:42] [PASSED] 0x674E (CRESCENTISLAND)
[15:58:42] [PASSED] 0x674F (CRESCENTISLAND)
[15:58:42] [PASSED] 0x6750 (CRESCENTISLAND)
[15:58:42] [PASSED] 0xD750 (NOVALAKE_P)
[15:58:42] [PASSED] 0xD751 (NOVALAKE_P)
[15:58:42] [PASSED] 0xD752 (NOVALAKE_P)
[15:58:42] [PASSED] 0xD753 (NOVALAKE_P)
[15:58:42] [PASSED] 0xD754 (NOVALAKE_P)
[15:58:42] [PASSED] 0xD755 (NOVALAKE_P)
[15:58:42] [PASSED] 0xD756 (NOVALAKE_P)
[15:58:42] [PASSED] 0xD757 (NOVALAKE_P)
[15:58:42] [PASSED] 0xD75F (NOVALAKE_P)
[15:58:42] =============== [PASSED] check_platform_desc ===============
[15:58:42] ===================== [PASSED] xe_pci ======================
[15:58:42] ============= xe_rtp_tables_test (5 subtests) ==============
[15:58:42] ================== xe_rtp_table_gt_test  ===================
[15:58:42] [PASSED] gt_was/14011060649
[15:58:42] [PASSED] gt_was/14011059788
[15:58:42] [PASSED] gt_was/14015795083
[15:58:42] [PASSED] gt_was/16021867713
[15:58:42] [PASSED] gt_was/14019449301
[15:58:42] [PASSED] gt_was/16028005424
[15:58:42] [PASSED] gt_was/14026578760
[15:58:42] [PASSED] gt_was/1409420604
[15:58:42] [PASSED] gt_was/1408615072
[15:58:42] [PASSED] gt_was/22010523718
[15:58:42] [PASSED] gt_was/14011006942
[15:58:42] [PASSED] gt_was/14014830051
[15:58:42] [PASSED] gt_was/18018781329
[15:58:42] [PASSED] gt_was/1509235366
[15:58:42] [PASSED] gt_was/18018781329
[15:58:42] [PASSED] gt_was/16016694945
[15:58:42] [PASSED] gt_was/14018575942
[15:58:42] [PASSED] gt_was/22016670082
[15:58:42] [PASSED] gt_was/22016670082
[15:58:42] [PASSED] gt_was/14017421178
[15:58:42] [PASSED] gt_was/16025250150
[15:58:42] [PASSED] gt_was/14021871409
[15:58:42] [PASSED] gt_was/16021865536
[15:58:42] [PASSED] gt_was/14021486841
[15:58:42] [PASSED] gt_was/14025160223
[15:58:42] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[15:58:42] [PASSED] gt_was/14025635424
[15:58:42] [PASSED] gt_was/16028005424
[15:58:42] ============== [PASSED] xe_rtp_table_gt_test ===============
[15:58:42] ================== xe_rtp_table_gt_test  ===================
[15:58:42] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[15:58:42] [PASSED] gt_tunings/Tuning: 32B Access Enable
[15:58:42] [PASSED] gt_tunings/Tuning: L3 cache
[15:58:42] [PASSED] gt_tunings/Tuning: L3 cache - media
[15:58:42] [PASSED] gt_tunings/Tuning: Compression Overfetch
[15:58:42] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[15:58:42] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[15:58:42] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[15:58:42] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[15:58:42] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[15:58:42] [PASSED] gt_tunings/Tuning: Stateless compression control
[15:58:42] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[15:58:42] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[15:58:42] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[15:58:42] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[15:58:42] ============== [PASSED] xe_rtp_table_gt_test ===============
[15:58:42] ================== xe_rtp_table_oob_test  ==================
[15:58:42] [PASSED] oob_was/1607983814
[15:58:42] [PASSED] oob_was/16010904313
[15:58:42] [PASSED] oob_was/18022495364
[15:58:42] [PASSED] oob_was/22012773006
[15:58:42] [PASSED] oob_was/14014475959
[15:58:42] [PASSED] oob_was/22011391025
[15:58:42] [PASSED] oob_was/22012727170
[15:58:42] [PASSED] oob_was/22012727685
[15:58:42] [PASSED] oob_was/22016596838
[15:58:42] [PASSED] oob_was/18020744125
[15:58:42] [PASSED] oob_was/1409600907
[15:58:42] [PASSED] oob_was/22014953428
[15:58:42] [PASSED] oob_was/16017236439
[15:58:42] [PASSED] oob_was/14019821291
[15:58:42] [PASSED] oob_was/14015076503
[15:58:42] [PASSED] oob_was/14018913170
[15:58:42] [PASSED] oob_was/14018094691
[15:58:42] [PASSED] oob_was/18024947630
[15:58:42] [PASSED] oob_was/16022287689
[15:58:42] [PASSED] oob_was/13011645652
[15:58:42] [PASSED] oob_was/14022293748
[15:58:42] [PASSED] oob_was/22019794406
[15:58:42] [PASSED] oob_was/22019338487
[15:58:42] [PASSED] oob_was/16023588340
[15:58:42] [PASSED] oob_was/14019789679
[15:58:42] [PASSED] oob_was/14022866841
[15:58:42] [PASSED] oob_was/16021333562
[15:58:42] [PASSED] oob_was/14016712196
[15:58:42] [PASSED] oob_was/14015568240
[15:58:42] [PASSED] oob_was/18013179988
[15:58:42] [PASSED] oob_was/1508761755
[15:58:42] [PASSED] oob_was/16023105232
[15:58:42] [PASSED] oob_was/16026508708
[15:58:42] [PASSED] oob_was/14020001231
[15:58:42] [PASSED] oob_was/16023683509
[15:58:42] [PASSED] oob_was/14025515070
[15:58:42] [PASSED] oob_was/15015404425_disable
[15:58:42] [PASSED] oob_was/16026007364
[15:58:42] [PASSED] oob_was/14020316580
[15:58:42] [PASSED] oob_was/14025883347
[15:58:42] [PASSED] oob_was/16029380221
[15:58:42] [PASSED] oob_was/22022079272
[15:58:42] [PASSED] oob_was/16029897822
[15:58:42] [PASSED] oob_was/14027054324
[15:58:42] [PASSED] oob_was/14025941587
[15:58:42] ============== [PASSED] xe_rtp_table_oob_test ==============
[15:58:42] ================ xe_rtp_table_dev_oob_test  ================
[15:58:42] [PASSED] device_oob_was/22010954014
[15:58:42] [PASSED] device_oob_was/15015404425
[15:58:42] [PASSED] device_oob_was/22019338487_display
[15:58:42] [PASSED] device_oob_was/14022085890
[15:58:42] [PASSED] device_oob_was/14026539277
[15:58:42] [PASSED] device_oob_was/14026633728
[15:58:42] [PASSED] device_oob_was/14026746987
[15:58:42] [PASSED] device_oob_was/14026779378
[15:58:42] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[15:58:42] ========== xe_rtp_table_missing_upper_bound_test  ==========
[15:58:42] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[15:58:42] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[15:58:42] [PASSED] register_whitelist/1806527549
[15:58:42] [PASSED] register_whitelist/allow_read_ctx_timestamp
[15:58:42] [PASSED] register_whitelist/allow_read_queue_timestamp
[15:58:42] [PASSED] register_whitelist/16014440446
[15:58:42] [PASSED] register_whitelist/16017236439
[15:58:42] [PASSED] register_whitelist/16020183090
[15:58:42] [PASSED] register_whitelist/14024997852
[15:58:42] [PASSED] register_whitelist/14024997852
[15:58:42] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[15:58:42] =============== [PASSED] xe_rtp_tables_test ================
[15:58:42] =================== xe_rtp (3 subtests) ====================
[15:58:42] =================== xe_rtp_rules_tests  ====================
[15:58:42] [PASSED] no
[15:58:42] [PASSED] yes
[15:58:42] [PASSED] no-and-no
[15:58:42] [PASSED] no-and-yes
[15:58:42] [PASSED] yes-and-no
[15:58:42] [PASSED] yes-and-yes
[15:58:42] [PASSED] no-or-no
[15:58:42] [PASSED] no-or-yes
[15:58:42] [PASSED] yes-or-no
[15:58:42] [PASSED] yes-or-yes
[15:58:42] [PASSED] no-yes-or-yes-no
[15:58:42] [PASSED] no-yes-or-yes-yes
[15:58:42] [PASSED] yes-yes-or-no-yes
[15:58:42] [PASSED] yes-yes-or-yes-yes
[15:58:42] [PASSED] no-no-or-yes-or-no
[15:58:42] [PASSED] or
[15:58:42] [PASSED] or-yes
[15:58:42] [PASSED] or-no
[15:58:42] [PASSED] yes-or
[15:58:42] [PASSED] no-or
[15:58:42] [PASSED] no-or-or-yes
[15:58:42] [PASSED] yes-or-or-no
[15:58:42] [PASSED] no-or-or-no
[15:58:42] [PASSED] missing-context-engine-class
[15:58:42] [PASSED] missing-context-engine-class-or-yes
[15:58:42] [PASSED] missing-context-engine-class-or-or-yes
[15:58:42] =============== [PASSED] xe_rtp_rules_tests ================
[15:58:42] =============== xe_rtp_process_to_sr_tests  ================
[15:58:42] [PASSED] coalesce-same-reg
[15:58:42] [PASSED] coalesce-same-reg-literal-and-func
[15:58:42] [PASSED] no-match-no-add
[15:58:42] [PASSED] two-regs-two-entries
[15:58:42] [PASSED] clr-one-set-other
[15:58:42] [PASSED] set-field
[15:58:42] [PASSED] conflict-duplicate
[15:58:42] [PASSED] conflict-not-disjoint
[15:58:42] [PASSED] conflict-not-disjoint-literal-and-func
[15:58:42] [PASSED] conflict-reg-type
[15:58:42] [PASSED] bad-mcr-reg-forced-to-regular
[15:58:42] [PASSED] bad-regular-reg-forced-to-mcr
[15:58:42] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[15:58:42] ================== xe_rtp_process_tests  ===================
[15:58:42] [PASSED] active1
[15:58:42] [PASSED] active2
[15:58:42] [PASSED] active-inactive
[15:58:42] [PASSED] inactive-active
[15:58:42] [PASSED] inactive-active-inactive
[15:58:42] [PASSED] inactive-inactive-inactive
[15:58:42] ============== [PASSED] xe_rtp_process_tests ===============
[15:58:42] ===================== [PASSED] xe_rtp ======================
[15:58:42] ==================== xe_wa (1 subtest) =====================
[15:58:42] ======================== xe_wa_gt  =========================
[15:58:42] [PASSED] TIGERLAKE B0
[15:58:42] [PASSED] DG1 A0
[15:58:42] [PASSED] DG1 B0
[15:58:42] [PASSED] ALDERLAKE_S A0
[15:58:42] [PASSED] ALDERLAKE_S B0
[15:58:42] [PASSED] ALDERLAKE_S C0
[15:58:42] [PASSED] ALDERLAKE_S D0
[15:58:42] [PASSED] ALDERLAKE_P A0
[15:58:42] [PASSED] ALDERLAKE_P B0
[15:58:42] [PASSED] ALDERLAKE_P C0
[15:58:42] [PASSED] ALDERLAKE_S RPLS D0
[15:58:42] [PASSED] ALDERLAKE_P RPLU E0
[15:58:42] [PASSED] DG2 G10 C0
[15:58:42] [PASSED] DG2 G11 B1
[15:58:42] [PASSED] DG2 G12 A1
[15:58:42] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[15:58:42] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[15:58:42] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[15:58:42] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[15:58:42] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[15:58:42] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[15:58:42] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[15:58:42] ==================== [PASSED] xe_wa_gt =====================
[15:58:42] ====================== [PASSED] xe_wa ======================
[15:58:42] ============================================================
[15:58:42] Testing complete. Ran 820 tests: passed: 792, skipped: 28
[15:58:42] Elapsed time: 37.137s total, 1.828s configuring, 34.542s building, 0.722s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[15:58:42] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:58:44] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[15:59:10] Starting KUnit Kernel (1/1)...
[15:59:10] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[15:59:10] ============= refcount_interrupt (4 subtests) ==============
[15:59:10] [PASSED] test_single_irq_change
[15:59:10] [PASSED] test_nested_irq_change
[15:59:10] [PASSED] test_multiple_irq_change
[15:59:10] [PASSED] test_irq_save
[15:59:10] =============== [PASSED] refcount_interrupt ================
[15:59:10] ============ drm_test_pick_cmdline (2 subtests) ============
[15:59:10] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[15:59:10] =============== drm_test_pick_cmdline_named  ===============
[15:59:10] [PASSED] NTSC
[15:59:10] [PASSED] NTSC-J
[15:59:10] [PASSED] PAL
[15:59:10] [PASSED] PAL-M
[15:59:10] =========== [PASSED] drm_test_pick_cmdline_named ===========
[15:59:10] ============== [PASSED] drm_test_pick_cmdline ==============
[15:59:10] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[15:59:10] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[15:59:10] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[15:59:10] =========== drm_validate_clone_mode (2 subtests) ===========
[15:59:10] ============== drm_test_check_in_clone_mode  ===============
[15:59:10] [PASSED] in_clone_mode
[15:59:10] [PASSED] not_in_clone_mode
[15:59:10] ========== [PASSED] drm_test_check_in_clone_mode ===========
[15:59:10] =============== drm_test_check_valid_clones  ===============
[15:59:10] [PASSED] not_in_clone_mode
[15:59:10] [PASSED] valid_clone
[15:59:10] [PASSED] invalid_clone
[15:59:10] =========== [PASSED] drm_test_check_valid_clones ===========
[15:59:10] ============= [PASSED] drm_validate_clone_mode =============
[15:59:10] ============= drm_validate_modeset (1 subtest) =============
[15:59:10] [PASSED] drm_test_check_connector_changed_modeset
[15:59:10] ============== [PASSED] drm_validate_modeset ===============
[15:59:10] ====== drm_test_bridge_get_current_state (1 subtest) =======
[15:59:10] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[15:59:10] ======== [PASSED] drm_test_bridge_get_current_state ========
[15:59:10] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[15:59:10] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[15:59:10] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[15:59:10] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[15:59:10] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[15:59:10] ============== drm_bridge_alloc (2 subtests) ===============
[15:59:10] [PASSED] drm_test_drm_bridge_alloc_basic
[15:59:10] [PASSED] drm_test_drm_bridge_alloc_get_put
[15:59:10] ================ [PASSED] drm_bridge_alloc =================
[15:59:10] ============= drm_bridge_bus_fmt (5 subtests) ==============
[15:59:10] [PASSED] drm_test_bridge_rgb_yuv_rgb
[15:59:10] [PASSED] drm_test_bridge_must_convert_to_yuv444
[15:59:10] [PASSED] drm_test_bridge_hdmi_auto_rgb
[15:59:10] [PASSED] drm_test_bridge_auto_first
[15:59:10] [PASSED] drm_test_bridge_rgb_yuv_no_path
[15:59:10] =============== [PASSED] drm_bridge_bus_fmt ================
[15:59:10] ============= drm_cmdline_parser (40 subtests) =============
[15:59:10] [PASSED] drm_test_cmdline_force_d_only
[15:59:10] [PASSED] drm_test_cmdline_force_D_only_dvi
[15:59:10] [PASSED] drm_test_cmdline_force_D_only_hdmi
[15:59:10] [PASSED] drm_test_cmdline_force_D_only_not_digital
[15:59:10] [PASSED] drm_test_cmdline_force_e_only
[15:59:10] [PASSED] drm_test_cmdline_res
[15:59:10] [PASSED] drm_test_cmdline_res_vesa
[15:59:10] [PASSED] drm_test_cmdline_res_vesa_rblank
[15:59:10] [PASSED] drm_test_cmdline_res_rblank
[15:59:10] [PASSED] drm_test_cmdline_res_bpp
[15:59:10] [PASSED] drm_test_cmdline_res_refresh
[15:59:10] [PASSED] drm_test_cmdline_res_bpp_refresh
[15:59:10] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[15:59:10] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[15:59:10] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[15:59:10] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[15:59:10] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[15:59:10] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[15:59:10] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[15:59:10] [PASSED] drm_test_cmdline_res_margins_force_on
[15:59:10] [PASSED] drm_test_cmdline_res_vesa_margins
[15:59:10] [PASSED] drm_test_cmdline_name
[15:59:10] [PASSED] drm_test_cmdline_name_bpp
[15:59:10] [PASSED] drm_test_cmdline_name_option
[15:59:10] [PASSED] drm_test_cmdline_name_bpp_option
[15:59:10] [PASSED] drm_test_cmdline_rotate_0
[15:59:10] [PASSED] drm_test_cmdline_rotate_90
[15:59:10] [PASSED] drm_test_cmdline_rotate_180
[15:59:10] [PASSED] drm_test_cmdline_rotate_270
[15:59:10] [PASSED] drm_test_cmdline_hmirror
[15:59:10] [PASSED] drm_test_cmdline_vmirror
[15:59:10] [PASSED] drm_test_cmdline_margin_options
[15:59:10] [PASSED] drm_test_cmdline_multiple_options
[15:59:10] [PASSED] drm_test_cmdline_bpp_extra_and_option
[15:59:10] [PASSED] drm_test_cmdline_extra_and_option
[15:59:10] [PASSED] drm_test_cmdline_freestanding_options
[15:59:10] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[15:59:10] [PASSED] drm_test_cmdline_panel_orientation
[15:59:10] ================ drm_test_cmdline_invalid  =================
[15:59:10] [PASSED] margin_only
[15:59:10] [PASSED] interlace_only
[15:59:10] [PASSED] res_missing_x
[15:59:10] [PASSED] res_missing_y
[15:59:10] [PASSED] res_bad_y
[15:59:10] [PASSED] res_missing_y_bpp
[15:59:10] [PASSED] res_bad_bpp
[15:59:10] [PASSED] res_bad_refresh
[15:59:10] [PASSED] res_bpp_refresh_force_on_off
[15:59:10] [PASSED] res_invalid_mode
[15:59:10] [PASSED] res_bpp_wrong_place_mode
[15:59:10] [PASSED] name_bpp_refresh
[15:59:10] [PASSED] name_refresh
[15:59:10] [PASSED] name_refresh_wrong_mode
[15:59:10] [PASSED] name_refresh_invalid_mode
[15:59:10] [PASSED] rotate_multiple
[15:59:10] [PASSED] rotate_invalid_val
[15:59:10] [PASSED] rotate_truncated
[15:59:10] [PASSED] invalid_option
[15:59:10] [PASSED] invalid_tv_option
[15:59:10] [PASSED] truncated_tv_option
[15:59:10] ============ [PASSED] drm_test_cmdline_invalid =============
[15:59:10] =============== drm_test_cmdline_tv_options  ===============
[15:59:10] [PASSED] NTSC
[15:59:10] [PASSED] NTSC_443
[15:59:10] [PASSED] NTSC_J
[15:59:10] [PASSED] PAL
[15:59:10] [PASSED] PAL_M
[15:59:10] [PASSED] PAL_N
[15:59:10] [PASSED] SECAM
[15:59:10] [PASSED] MONO_525
[15:59:10] [PASSED] MONO_625
[15:59:10] =========== [PASSED] drm_test_cmdline_tv_options ===========
[15:59:10] =============== [PASSED] drm_cmdline_parser ================
[15:59:10] ========== drmm_connector_hdmi_init (20 subtests) ==========
[15:59:10] [PASSED] drm_test_connector_hdmi_init_valid
[15:59:10] [PASSED] drm_test_connector_hdmi_init_bpc_8
[15:59:10] [PASSED] drm_test_connector_hdmi_init_bpc_10
[15:59:10] [PASSED] drm_test_connector_hdmi_init_bpc_12
[15:59:10] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[15:59:10] [PASSED] drm_test_connector_hdmi_init_bpc_null
[15:59:10] [PASSED] drm_test_connector_hdmi_init_formats_empty
[15:59:10] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[15:59:10] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[15:59:10] [PASSED] supported_formats=0x9 yuv420_allowed=1
[15:59:10] [PASSED] supported_formats=0x9 yuv420_allowed=0
[15:59:10] [PASSED] supported_formats=0x5 yuv420_allowed=1
[15:59:10] [PASSED] supported_formats=0x5 yuv420_allowed=0
[15:59:10] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[15:59:10] [PASSED] drm_test_connector_hdmi_init_null_ddc
[15:59:10] [PASSED] drm_test_connector_hdmi_init_null_product
[15:59:10] [PASSED] drm_test_connector_hdmi_init_null_vendor
[15:59:10] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[15:59:10] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[15:59:10] [PASSED] drm_test_connector_hdmi_init_product_valid
[15:59:10] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[15:59:10] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[15:59:10] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[15:59:10] ========= drm_test_connector_hdmi_init_type_valid  =========
[15:59:10] [PASSED] HDMI-A
[15:59:10] [PASSED] HDMI-B
[15:59:10] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[15:59:10] ======== drm_test_connector_hdmi_init_type_invalid  ========
[15:59:10] [PASSED] Unknown
[15:59:10] [PASSED] VGA
[15:59:10] [PASSED] DVI-I
[15:59:10] [PASSED] DVI-D
[15:59:10] [PASSED] DVI-A
[15:59:10] [PASSED] Composite
[15:59:10] [PASSED] SVIDEO
[15:59:10] [PASSED] LVDS
[15:59:10] [PASSED] Component
[15:59:10] [PASSED] DIN
[15:59:10] [PASSED] DP
[15:59:10] [PASSED] TV
[15:59:10] [PASSED] eDP
[15:59:10] [PASSED] Virtual
[15:59:10] [PASSED] DSI
[15:59:10] [PASSED] DPI
[15:59:10] [PASSED] Writeback
[15:59:10] [PASSED] SPI
[15:59:10] [PASSED] USB
[15:59:10] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[15:59:10] ============ [PASSED] drmm_connector_hdmi_init =============
[15:59:10] ============= drmm_connector_init (3 subtests) =============
[15:59:10] [PASSED] drm_test_drmm_connector_init
[15:59:10] [PASSED] drm_test_drmm_connector_init_null_ddc
[15:59:10] ========= drm_test_drmm_connector_init_type_valid  =========
[15:59:10] [PASSED] Unknown
[15:59:10] [PASSED] VGA
[15:59:10] [PASSED] DVI-I
[15:59:10] [PASSED] DVI-D
[15:59:10] [PASSED] DVI-A
[15:59:10] [PASSED] Composite
[15:59:10] [PASSED] SVIDEO
[15:59:10] [PASSED] LVDS
[15:59:10] [PASSED] Component
[15:59:10] [PASSED] DIN
[15:59:10] [PASSED] DP
[15:59:10] [PASSED] HDMI-A
[15:59:10] [PASSED] HDMI-B
[15:59:10] [PASSED] TV
[15:59:10] [PASSED] eDP
[15:59:10] [PASSED] Virtual
[15:59:10] [PASSED] DSI
[15:59:10] [PASSED] DPI
[15:59:10] [PASSED] Writeback
[15:59:10] [PASSED] SPI
[15:59:10] [PASSED] USB
[15:59:10] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[15:59:10] =============== [PASSED] drmm_connector_init ===============
[15:59:10] ========= drm_connector_dynamic_init (6 subtests) ==========
[15:59:10] [PASSED] drm_test_drm_connector_dynamic_init
[15:59:10] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[15:59:10] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[15:59:10] [PASSED] drm_test_drm_connector_dynamic_init_properties
[15:59:10] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[15:59:10] [PASSED] Unknown
[15:59:10] [PASSED] VGA
[15:59:10] [PASSED] DVI-I
[15:59:10] [PASSED] DVI-D
[15:59:10] [PASSED] DVI-A
[15:59:10] [PASSED] Composite
[15:59:10] [PASSED] SVIDEO
[15:59:10] [PASSED] LVDS
[15:59:10] [PASSED] Component
[15:59:10] [PASSED] DIN
[15:59:10] [PASSED] DP
[15:59:10] [PASSED] HDMI-A
[15:59:10] [PASSED] HDMI-B
[15:59:10] [PASSED] TV
[15:59:10] [PASSED] eDP
[15:59:10] [PASSED] Virtual
[15:59:10] [PASSED] DSI
[15:59:10] [PASSED] DPI
[15:59:10] [PASSED] Writeback
[15:59:10] [PASSED] SPI
[15:59:10] [PASSED] USB
[15:59:10] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[15:59:10] ======== drm_test_drm_connector_dynamic_init_name  =========
[15:59:10] [PASSED] Unknown
[15:59:10] [PASSED] VGA
[15:59:10] [PASSED] DVI-I
[15:59:10] [PASSED] DVI-D
[15:59:10] [PASSED] DVI-A
[15:59:10] [PASSED] Composite
[15:59:10] [PASSED] SVIDEO
[15:59:10] [PASSED] LVDS
[15:59:10] [PASSED] Component
[15:59:10] [PASSED] DIN
[15:59:10] [PASSED] DP
[15:59:10] [PASSED] HDMI-A
[15:59:10] [PASSED] HDMI-B
[15:59:10] [PASSED] TV
[15:59:10] [PASSED] eDP
[15:59:10] [PASSED] Virtual
[15:59:10] [PASSED] DSI
[15:59:10] [PASSED] DPI
[15:59:10] [PASSED] Writeback
[15:59:10] [PASSED] SPI
[15:59:10] [PASSED] USB
[15:59:10] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[15:59:10] =========== [PASSED] drm_connector_dynamic_init ============
[15:59:10] ==== drm_connector_dynamic_register_early (4 subtests) =====
[15:59:10] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[15:59:10] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[15:59:10] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[15:59:10] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[15:59:10] ====== [PASSED] drm_connector_dynamic_register_early =======
[15:59:10] ======= drm_connector_dynamic_register (7 subtests) ========
[15:59:10] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[15:59:10] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[15:59:10] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[15:59:10] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[15:59:10] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[15:59:10] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[15:59:10] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[15:59:10] ========= [PASSED] drm_connector_dynamic_register ==========
[15:59:10] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[15:59:10] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[15:59:10] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[15:59:10] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[15:59:10] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[15:59:10] ========== drm_test_get_tv_mode_from_name_valid  ===========
[15:59:10] [PASSED] NTSC
[15:59:10] [PASSED] NTSC-443
[15:59:10] [PASSED] NTSC-J
[15:59:10] [PASSED] PAL
[15:59:10] [PASSED] PAL-M
[15:59:10] [PASSED] PAL-N
[15:59:10] [PASSED] SECAM
[15:59:10] [PASSED] Mono
[15:59:10] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[15:59:10] [PASSED] drm_test_get_tv_mode_from_name_truncated
[15:59:10] ============ [PASSED] drm_get_tv_mode_from_name ============
[15:59:10] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[15:59:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[15:59:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[15:59:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[15:59:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[15:59:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[15:59:10] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[15:59:10] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[15:59:10] [PASSED] VIC 96
[15:59:10] [PASSED] VIC 97
[15:59:10] [PASSED] VIC 101
[15:59:10] [PASSED] VIC 102
[15:59:10] [PASSED] VIC 106
[15:59:10] [PASSED] VIC 107
[15:59:10] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[15:59:10] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[15:59:10] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[15:59:10] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[15:59:10] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[15:59:10] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[15:59:10] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[15:59:10] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[15:59:10] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[15:59:10] [PASSED] Automatic
[15:59:10] [PASSED] Full
[15:59:10] [PASSED] Limited 16:235
[15:59:10] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[15:59:10] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[15:59:10] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[15:59:10] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[15:59:10] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[15:59:10] [PASSED] RGB
[15:59:10] [PASSED] YUV 4:2:0
[15:59:10] [PASSED] YUV 4:2:2
[15:59:10] [PASSED] YUV 4:4:4
[15:59:10] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[15:59:10] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[15:59:10] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[15:59:10] ============= drm_damage_helper (21 subtests) ==============
[15:59:10] [PASSED] drm_test_damage_iter_no_damage
[15:59:10] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[15:59:10] [PASSED] drm_test_damage_iter_no_damage_src_moved
[15:59:10] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[15:59:10] [PASSED] drm_test_damage_iter_no_damage_not_visible
[15:59:10] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[15:59:10] [PASSED] drm_test_damage_iter_no_damage_no_fb
[15:59:10] [PASSED] drm_test_damage_iter_simple_damage
[15:59:10] [PASSED] drm_test_damage_iter_single_damage
[15:59:10] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[15:59:10] [PASSED] drm_test_damage_iter_single_damage_outside_src
[15:59:10] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[15:59:10] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[15:59:10] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[15:59:10] [PASSED] drm_test_damage_iter_single_damage_src_moved
[15:59:10] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[15:59:10] [PASSED] drm_test_damage_iter_damage
[15:59:10] [PASSED] drm_test_damage_iter_damage_one_intersect
[15:59:10] [PASSED] drm_test_damage_iter_damage_one_outside
[15:59:10] [PASSED] drm_test_damage_iter_damage_src_moved
[15:59:10] [PASSED] drm_test_damage_iter_damage_not_visible
[15:59:10] ================ [PASSED] drm_damage_helper ================
[15:59:10] ============== drm_dp_mst_helper (3 subtests) ==============
[15:59:10] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[15:59:10] [PASSED] Clock 154000 BPP 30 DSC disabled
[15:59:10] [PASSED] Clock 234000 BPP 30 DSC disabled
[15:59:10] [PASSED] Clock 297000 BPP 24 DSC disabled
[15:59:10] [PASSED] Clock 332880 BPP 24 DSC enabled
[15:59:10] [PASSED] Clock 324540 BPP 24 DSC enabled
[15:59:10] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[15:59:10] ============== drm_test_dp_mst_calc_pbn_div  ===============
[15:59:10] [PASSED] Link rate 2000000 lane count 4
[15:59:10] [PASSED] Link rate 2000000 lane count 2
[15:59:10] [PASSED] Link rate 2000000 lane count 1
[15:59:10] [PASSED] Link rate 1350000 lane count 4
[15:59:10] [PASSED] Link rate 1350000 lane count 2
[15:59:10] [PASSED] Link rate 1350000 lane count 1
[15:59:10] [PASSED] Link rate 1000000 lane count 4
[15:59:10] [PASSED] Link rate 1000000 lane count 2
[15:59:10] [PASSED] Link rate 1000000 lane count 1
[15:59:10] [PASSED] Link rate 810000 lane count 4
[15:59:10] [PASSED] Link rate 810000 lane count 2
[15:59:10] [PASSED] Link rate 810000 lane count 1
[15:59:10] [PASSED] Link rate 540000 lane count 4
[15:59:10] [PASSED] Link rate 540000 lane count 2
[15:59:10] [PASSED] Link rate 540000 lane count 1
[15:59:10] [PASSED] Link rate 270000 lane count 4
[15:59:10] [PASSED] Link rate 270000 lane count 2
[15:59:10] [PASSED] Link rate 270000 lane count 1
[15:59:10] [PASSED] Link rate 162000 lane count 4
[15:59:10] [PASSED] Link rate 162000 lane count 2
[15:59:10] [PASSED] Link rate 162000 lane count 1
[15:59:10] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[15:59:10] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[15:59:10] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[15:59:10] [PASSED] DP_POWER_UP_PHY with port number
[15:59:10] [PASSED] DP_POWER_DOWN_PHY with port number
[15:59:10] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[15:59:10] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[15:59:10] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[15:59:10] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[15:59:10] [PASSED] DP_QUERY_PAYLOAD with port number
[15:59:10] [PASSED] DP_QUERY_PAYLOAD with VCPI
[15:59:10] [PASSED] DP_REMOTE_DPCD_READ with port number
[15:59:10] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[15:59:10] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[15:59:10] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[15:59:10] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[15:59:10] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[15:59:10] [PASSED] DP_REMOTE_I2C_READ with port number
[15:59:10] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[15:59:10] [PASSED] DP_REMOTE_I2C_READ with transactions array
[15:59:10] [PASSED] DP_REMOTE_I2C_WRITE with port number
[15:59:10] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[15:59:10] [PASSED] DP_REMOTE_I2C_WRITE with data array
[15:59:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[15:59:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[15:59:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[15:59:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[15:59:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[15:59:10] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[15:59:10] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[15:59:10] ================ [PASSED] drm_dp_mst_helper ================
[15:59:10] ================== drm_exec (7 subtests) ===================
[15:59:10] [PASSED] sanitycheck
[15:59:10] [PASSED] test_lock
[15:59:10] [PASSED] test_lock_unlock
[15:59:10] [PASSED] test_duplicates
[15:59:10] [PASSED] test_prepare
[15:59:10] [PASSED] test_prepare_array
[15:59:10] [PASSED] test_multiple_loops
[15:59:10] ==================== [PASSED] drm_exec =====================
[15:59:10] =========== drm_format_helper_test (17 subtests) ===========
[15:59:10] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[15:59:10] [PASSED] single_pixel_source_buffer
[15:59:10] [PASSED] single_pixel_clip_rectangle
[15:59:10] [PASSED] well_known_colors
[15:59:10] [PASSED] destination_pitch
[15:59:10] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[15:59:10] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[15:59:10] [PASSED] single_pixel_source_buffer
[15:59:10] [PASSED] single_pixel_clip_rectangle
[15:59:10] [PASSED] well_known_colors
[15:59:10] [PASSED] destination_pitch
[15:59:10] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[15:59:10] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[15:59:10] [PASSED] single_pixel_source_buffer
[15:59:10] [PASSED] single_pixel_clip_rectangle
[15:59:10] [PASSED] well_known_colors
[15:59:10] [PASSED] destination_pitch
[15:59:10] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[15:59:10] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[15:59:10] [PASSED] single_pixel_source_buffer
[15:59:10] [PASSED] single_pixel_clip_rectangle
[15:59:10] [PASSED] well_known_colors
[15:59:10] [PASSED] destination_pitch
[15:59:10] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[15:59:10] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[15:59:10] [PASSED] single_pixel_source_buffer
[15:59:10] [PASSED] single_pixel_clip_rectangle
[15:59:10] [PASSED] well_known_colors
[15:59:10] [PASSED] destination_pitch
[15:59:10] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[15:59:10] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[15:59:10] [PASSED] single_pixel_source_buffer
[15:59:10] [PASSED] single_pixel_clip_rectangle
[15:59:10] [PASSED] well_known_colors
[15:59:10] [PASSED] destination_pitch
[15:59:10] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[15:59:10] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[15:59:10] [PASSED] single_pixel_source_buffer
[15:59:10] [PASSED] single_pixel_clip_rectangle
[15:59:10] [PASSED] well_known_colors
[15:59:10] [PASSED] destination_pitch
[15:59:10] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[15:59:10] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[15:59:10] [PASSED] single_pixel_source_buffer
[15:59:10] [PASSED] single_pixel_clip_rectangle
[15:59:10] [PASSED] well_known_colors
[15:59:10] [PASSED] destination_pitch
[15:59:10] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[15:59:10] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[15:59:10] [PASSED] single_pixel_source_buffer
[15:59:10] [PASSED] single_pixel_clip_rectangle
[15:59:10] [PASSED] well_known_colors
[15:59:10] [PASSED] destination_pitch
[15:59:10] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[15:59:10] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[15:59:10] [PASSED] single_pixel_source_buffer
[15:59:10] [PASSED] single_pixel_clip_rectangle
[15:59:10] [PASSED] well_known_colors
[15:59:10] [PASSED] destination_pitch
[15:59:10] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[15:59:10] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[15:59:10] [PASSED] single_pixel_source_buffer
[15:59:10] [PASSED] single_pixel_clip_rectangle
[15:59:10] [PASSED] well_known_colors
[15:59:10] [PASSED] destination_pitch
[15:59:10] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[15:59:10] ============== drm_test_fb_xrgb8888_to_mono  ===============
[15:59:10] [PASSED] single_pixel_source_buffer
[15:59:10] [PASSED] single_pixel_clip_rectangle
[15:59:10] [PASSED] well_known_colors
[15:59:10] [PASSED] destination_pitch
[15:59:10] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[15:59:10] ==================== drm_test_fb_swab  =====================
[15:59:10] [PASSED] single_pixel_source_buffer
[15:59:10] [PASSED] single_pixel_clip_rectangle
[15:59:10] [PASSED] well_known_colors
[15:59:10] [PASSED] destination_pitch
[15:59:10] ================ [PASSED] drm_test_fb_swab =================
[15:59:10] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[15:59:10] [PASSED] single_pixel_source_buffer
[15:59:10] [PASSED] single_pixel_clip_rectangle
[15:59:10] [PASSED] well_known_colors
[15:59:10] [PASSED] destination_pitch
[15:59:10] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[15:59:10] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[15:59:10] [PASSED] single_pixel_source_buffer
[15:59:10] [PASSED] single_pixel_clip_rectangle
[15:59:10] [PASSED] well_known_colors
[15:59:10] [PASSED] destination_pitch
[15:59:10] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[15:59:10] ================= drm_test_fb_clip_offset  =================
[15:59:10] [PASSED] pass through
[15:59:10] [PASSED] horizontal offset
[15:59:10] [PASSED] vertical offset
[15:59:10] [PASSED] horizontal and vertical offset
[15:59:10] [PASSED] horizontal offset (custom pitch)
[15:59:10] [PASSED] vertical offset (custom pitch)
[15:59:10] [PASSED] horizontal and vertical offset (custom pitch)
[15:59:10] ============= [PASSED] drm_test_fb_clip_offset =============
[15:59:10] =================== drm_test_fb_memcpy  ====================
[15:59:10] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[15:59:10] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[15:59:10] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[15:59:10] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[15:59:10] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[15:59:10] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[15:59:10] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[15:59:10] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[15:59:10] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[15:59:10] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[15:59:10] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[15:59:10] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[15:59:10] =============== [PASSED] drm_test_fb_memcpy ================
[15:59:10] ============= [PASSED] drm_format_helper_test ==============
[15:59:10] ================= drm_format (18 subtests) =================
[15:59:10] [PASSED] drm_test_format_block_width_invalid
[15:59:10] [PASSED] drm_test_format_block_width_one_plane
[15:59:10] [PASSED] drm_test_format_block_width_two_plane
[15:59:10] [PASSED] drm_test_format_block_width_three_plane
[15:59:10] [PASSED] drm_test_format_block_width_tiled
[15:59:10] [PASSED] drm_test_format_block_height_invalid
[15:59:10] [PASSED] drm_test_format_block_height_one_plane
[15:59:10] [PASSED] drm_test_format_block_height_two_plane
[15:59:10] [PASSED] drm_test_format_block_height_three_plane
[15:59:10] [PASSED] drm_test_format_block_height_tiled
[15:59:10] [PASSED] drm_test_format_min_pitch_invalid
[15:59:10] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[15:59:10] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[15:59:10] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[15:59:10] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[15:59:10] [PASSED] drm_test_format_min_pitch_two_plane
[15:59:10] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[15:59:10] [PASSED] drm_test_format_min_pitch_tiled
[15:59:10] =================== [PASSED] drm_format ====================
[15:59:10] ============== drm_framebuffer (10 subtests) ===============
[15:59:10] ========== drm_test_framebuffer_check_src_coords  ==========
[15:59:10] [PASSED] Success: source fits into fb
[15:59:10] [PASSED] Fail: overflowing fb with x-axis coordinate
[15:59:10] [PASSED] Fail: overflowing fb with y-axis coordinate
[15:59:10] [PASSED] Fail: overflowing fb with source width
[15:59:10] [PASSED] Fail: overflowing fb with source height
[15:59:10] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[15:59:10] [PASSED] drm_test_framebuffer_cleanup
[15:59:10] =============== drm_test_framebuffer_create  ===============
[15:59:10] [PASSED] ABGR8888 normal sizes
[15:59:10] [PASSED] ABGR8888 max sizes
[15:59:10] [PASSED] ABGR8888 pitch greater than min required
[15:59:10] [PASSED] ABGR8888 pitch less than min required
[15:59:10] [PASSED] ABGR8888 Invalid width
[15:59:10] [PASSED] ABGR8888 Invalid buffer handle
[15:59:10] [PASSED] No pixel format
[15:59:10] [PASSED] ABGR8888 Width 0
[15:59:10] [PASSED] ABGR8888 Height 0
[15:59:10] [PASSED] ABGR8888 Out of bound height * pitch combination
[15:59:10] [PASSED] ABGR8888 Large buffer offset
[15:59:10] [PASSED] ABGR8888 Buffer offset for inexistent plane
[15:59:10] [PASSED] ABGR8888 Invalid flag
[15:59:10] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[15:59:10] [PASSED] ABGR8888 Valid buffer modifier
[15:59:10] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[15:59:10] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[15:59:10] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[15:59:10] [PASSED] NV12 Normal sizes
[15:59:10] [PASSED] NV12 Max sizes
[15:59:10] [PASSED] NV12 Invalid pitch
[15:59:10] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[15:59:10] [PASSED] NV12 different  modifier per-plane
[15:59:10] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[15:59:10] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[15:59:10] [PASSED] NV12 Modifier for inexistent plane
[15:59:10] [PASSED] NV12 Handle for inexistent plane
[15:59:10] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[15:59:10] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[15:59:10] [PASSED] YVU420 Normal sizes
[15:59:10] [PASSED] YVU420 Max sizes
[15:59:10] [PASSED] YVU420 Invalid pitch
[15:59:10] [PASSED] YVU420 Different pitches
[15:59:10] [PASSED] YVU420 Different buffer offsets/pitches
[15:59:10] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[15:59:10] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[15:59:10] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[15:59:10] [PASSED] YVU420 Valid modifier
[15:59:10] [PASSED] YVU420 Different modifiers per plane
[15:59:10] [PASSED] YVU420 Modifier for inexistent plane
[15:59:10] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[15:59:10] [PASSED] X0L2 Normal sizes
[15:59:10] [PASSED] X0L2 Max sizes
[15:59:10] [PASSED] X0L2 Invalid pitch
[15:59:10] [PASSED] X0L2 Pitch greater than minimum required
[15:59:10] [PASSED] X0L2 Handle for inexistent plane
[15:59:10] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[15:59:10] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[15:59:10] [PASSED] X0L2 Valid modifier
[15:59:10] [PASSED] X0L2 Modifier for inexistent plane
[15:59:10] =========== [PASSED] drm_test_framebuffer_create ===========
[15:59:10] [PASSED] drm_test_framebuffer_free
[15:59:10] [PASSED] drm_test_framebuffer_init
[15:59:10] [PASSED] drm_test_framebuffer_init_bad_format
[15:59:10] [PASSED] drm_test_framebuffer_init_dev_mismatch
[15:59:10] [PASSED] drm_test_framebuffer_lookup
[15:59:10] [PASSED] drm_test_framebuffer_lookup_inexistent
[15:59:10] [PASSED] drm_test_framebuffer_modifiers_not_supported
[15:59:10] ================= [PASSED] drm_framebuffer =================
[15:59:10] ================ drm_gem_shmem (8 subtests) ================
[15:59:10] [PASSED] drm_gem_shmem_test_obj_create
[15:59:10] [PASSED] drm_gem_shmem_test_obj_create_private
[15:59:10] [PASSED] drm_gem_shmem_test_pin_pages
[15:59:10] [PASSED] drm_gem_shmem_test_vmap
[15:59:10] [PASSED] drm_gem_shmem_test_get_sg_table
[15:59:10] [PASSED] drm_gem_shmem_test_get_pages_sgt
[15:59:10] [PASSED] drm_gem_shmem_test_madvise
[15:59:10] [PASSED] drm_gem_shmem_test_purge
[15:59:10] ================== [PASSED] drm_gem_shmem ==================
[15:59:10] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[15:59:10] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[15:59:10] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[15:59:10] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[15:59:10] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[15:59:10] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[15:59:10] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[15:59:10] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[15:59:10] [PASSED] Automatic
[15:59:10] [PASSED] Full
[15:59:10] [PASSED] Limited 16:235
[15:59:10] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[15:59:10] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[15:59:10] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[15:59:10] [PASSED] drm_test_check_disable_connector
[15:59:10] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[15:59:10] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[15:59:10] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[15:59:10] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[15:59:10] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[15:59:10] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[15:59:10] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[15:59:10] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[15:59:10] [PASSED] drm_test_check_output_bpc_dvi
[15:59:10] [PASSED] drm_test_check_output_bpc_format_vic_1
[15:59:10] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[15:59:10] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[15:59:10] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[15:59:10] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[15:59:10] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[15:59:10] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[15:59:10] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[15:59:10] ============ drm_test_check_hdmi_color_format  =============
[15:59:10] [PASSED] AUTO -> RGB
[15:59:10] [PASSED] YCBCR422 -> YUV422
[15:59:10] [PASSED] YCBCR420 -> YUV420
[15:59:10] [PASSED] YCBCR444 -> YUV444
[15:59:10] [PASSED] RGB -> RGB
[15:59:10] ======== [PASSED] drm_test_check_hdmi_color_format =========
[15:59:10] ======== drm_test_check_hdmi_color_format_420_only  ========
[15:59:10] [PASSED] RGB should fail
[15:59:10] [PASSED] YUV444 should fail
[15:59:10] [PASSED] YUV422 should fail
[15:59:10] [PASSED] YUV420 should work
[15:59:10] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[15:59:10] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[15:59:10] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[15:59:10] [PASSED] drm_test_check_broadcast_rgb_value
[15:59:10] [PASSED] drm_test_check_bpc_8_value
[15:59:10] [PASSED] drm_test_check_bpc_10_value
[15:59:10] [PASSED] drm_test_check_bpc_12_value
[15:59:10] [PASSED] drm_test_check_format_value
[15:59:10] [PASSED] drm_test_check_tmds_char_value
[15:59:10] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[15:59:10] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[15:59:10] [PASSED] drm_test_check_mode_valid
[15:59:10] [PASSED] drm_test_check_mode_valid_reject
[15:59:10] [PASSED] drm_test_check_mode_valid_reject_rate
[15:59:10] [PASSED] drm_test_check_mode_valid_reject_max_clock
[15:59:10] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[15:59:10] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[15:59:10] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[15:59:10] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[15:59:10] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[15:59:10] [PASSED] drm_test_check_infoframes
[15:59:10] [PASSED] drm_test_check_reject_avi_infoframe
[15:59:10] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[15:59:10] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[15:59:10] [PASSED] drm_test_check_reject_audio_infoframe
[15:59:10] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[15:59:10] ================= drm_managed (2 subtests) =================
[15:59:10] [PASSED] drm_test_managed_release_action
[15:59:10] [PASSED] drm_test_managed_run_action
[15:59:10] =================== [PASSED] drm_managed ===================
[15:59:10] =================== drm_mm (6 subtests) ====================
[15:59:10] [PASSED] drm_test_mm_init
[15:59:10] [PASSED] drm_test_mm_debug
[15:59:10] [PASSED] drm_test_mm_align32
[15:59:10] [PASSED] drm_test_mm_align64
[15:59:10] [PASSED] drm_test_mm_lowest
[15:59:10] [PASSED] drm_test_mm_highest
[15:59:10] ===================== [PASSED] drm_mm ======================
[15:59:10] ============= drm_modes_analog_tv (5 subtests) =============
[15:59:10] [PASSED] drm_test_modes_analog_tv_mono_576i
[15:59:10] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[15:59:10] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[15:59:10] [PASSED] drm_test_modes_analog_tv_pal_576i
[15:59:10] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[15:59:10] =============== [PASSED] drm_modes_analog_tv ===============
[15:59:10] ============== drm_panic_helper (3 subtests) ===============
[15:59:10] ============= drm_test_panic_screen_user_map  ==============
[15:59:10] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[15:59:10] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[15:59:10] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[15:59:10] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[15:59:10] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[15:59:10] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[15:59:10] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[15:59:10] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[15:59:10] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[15:59:10] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[15:59:10] ========= [PASSED] drm_test_panic_screen_user_map ==========
[15:59:10] ============= drm_test_panic_screen_user_page  =============
[15:59:10] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[15:59:10] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[15:59:10] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[15:59:10] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[15:59:10] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[15:59:10] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[15:59:10] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[15:59:10] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[15:59:10] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[15:59:10] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[15:59:10] ========= [PASSED] drm_test_panic_screen_user_page =========
[15:59:10] ========== drm_test_panic_screen_user_set_pixel  ===========
[15:59:10] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[15:59:10] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[15:59:10] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[15:59:10] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[15:59:10] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[15:59:10] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[15:59:10] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[15:59:10] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[15:59:10] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[15:59:10] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[15:59:10] ====== [PASSED] drm_test_panic_screen_user_set_pixel =======
[15:59:10] ================ [PASSED] drm_panic_helper =================
[15:59:10] ============== drm_plane_helper (2 subtests) ===============
[15:59:10] =============== drm_test_check_plane_state  ================
[15:59:10] [PASSED] clipping_simple
[15:59:10] [PASSED] clipping_rotate_reflect
[15:59:10] [PASSED] positioning_simple
[15:59:10] [PASSED] upscaling
[15:59:10] [PASSED] downscaling
[15:59:10] [PASSED] rounding1
[15:59:10] [PASSED] rounding2
[15:59:10] [PASSED] rounding3
[15:59:10] [PASSED] rounding4
[15:59:10] =========== [PASSED] drm_test_check_plane_state ============
[15:59:10] =========== drm_test_check_invalid_plane_state  ============
[15:59:10] [PASSED] positioning_invalid
[15:59:10] [PASSED] upscaling_invalid
[15:59:10] [PASSED] downscaling_invalid
[15:59:10] ======= [PASSED] drm_test_check_invalid_plane_state ========
[15:59:10] ================ [PASSED] drm_plane_helper =================
[15:59:10] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[15:59:10] ====== drm_test_connector_helper_tv_get_modes_check  =======
[15:59:10] [PASSED] None
[15:59:10] [PASSED] PAL
[15:59:10] [PASSED] NTSC
[15:59:10] [PASSED] Both, NTSC Default
[15:59:10] [PASSED] Both, PAL Default
[15:59:10] [PASSED] Both, NTSC Default, with PAL on command-line
[15:59:10] [PASSED] Both, PAL Default, with NTSC on command-line
[15:59:10] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[15:59:10] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[15:59:10] ================== drm_rect (9 subtests) ===================
[15:59:10] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[15:59:10] [PASSED] drm_test_rect_clip_scaled_not_clipped
[15:59:10] [PASSED] drm_test_rect_clip_scaled_clipped
[15:59:10] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[15:59:10] ================= drm_test_rect_intersect  =================
[15:59:10] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[15:59:10] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[15:59:10] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[15:59:10] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[15:59:10] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[15:59:10] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[15:59:10] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[15:59:10] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[15:59:10] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[15:59:10] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[15:59:10] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[15:59:10] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[15:59:10] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[15:59:10] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[15:59:10] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[15:59:10] ============= [PASSED] drm_test_rect_intersect =============
[15:59:10] ================ drm_test_rect_calc_hscale  ================
[15:59:10] [PASSED] normal use
[15:59:10] [PASSED] out of max range
[15:59:10] [PASSED] out of min range
[15:59:10] [PASSED] zero dst
[15:59:10] [PASSED] negative src
[15:59:10] [PASSED] negative dst
[15:59:10] ============ [PASSED] drm_test_rect_calc_hscale ============
[15:59:10] ================ drm_test_rect_calc_vscale  ================
[15:59:10] [PASSED] normal use
[15:59:10] [PASSED] out of max range
[15:59:10] [PASSED] out of min range
[15:59:10] [PASSED] zero dst
[15:59:10] [PASSED] negative src
[15:59:10] [PASSED] negative dst
[15:59:10] ============ [PASSED] drm_test_rect_calc_vscale ============
[15:59:10] ================== drm_test_rect_rotate  ===================
[15:59:10] [PASSED] reflect-x
[15:59:10] [PASSED] reflect-y
[15:59:10] [PASSED] rotate-0
[15:59:10] [PASSED] rotate-90
[15:59:10] [PASSED] rotate-180
[15:59:10] [PASSED] rotate-270
[15:59:10] ============== [PASSED] drm_test_rect_rotate ===============
[15:59:10] ================ drm_test_rect_rotate_inv  =================
[15:59:10] [PASSED] reflect-x
[15:59:10] [PASSED] reflect-y
[15:59:10] [PASSED] rotate-0
[15:59:10] [PASSED] rotate-90
[15:59:10] [PASSED] rotate-180
[15:59:10] [PASSED] rotate-270
[15:59:10] ============ [PASSED] drm_test_rect_rotate_inv =============
[15:59:10] ==================== [PASSED] drm_rect =====================
[15:59:10] ============ drm_sysfb_modeset_test (1 subtest) ============
[15:59:10] ============ drm_test_sysfb_build_fourcc_list  =============
[15:59:10] [PASSED] no native formats
[15:59:10] [PASSED] XRGB8888 as native format
[15:59:10] [PASSED] remove duplicates
[15:59:10] [PASSED] convert alpha formats
[15:59:10] [PASSED] random formats
[15:59:10] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[15:59:10] ============= [PASSED] drm_sysfb_modeset_test ==============
[15:59:10] ================== drm_fixp (2 subtests) ===================
[15:59:10] [PASSED] drm_test_int2fixp
[15:59:10] [PASSED] drm_test_sm2fixp
[15:59:10] ==================== [PASSED] drm_fixp =====================
[15:59:10] ============================================================
[15:59:10] Testing complete. Ran 671 tests: passed: 671
[15:59:10] Elapsed time: 27.736s total, 1.832s configuring, 25.438s building, 0.414s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[15:59:10] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:59:12] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[15:59:22] Starting KUnit Kernel (1/1)...
[15:59:22] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[15:59:22] ============= refcount_interrupt (4 subtests) ==============
[15:59:22] [PASSED] test_single_irq_change
[15:59:22] [PASSED] test_nested_irq_change
[15:59:22] [PASSED] test_multiple_irq_change
[15:59:22] [PASSED] test_irq_save
[15:59:22] =============== [PASSED] refcount_interrupt ================
[15:59:22] ================= ttm_device (5 subtests) ==================
[15:59:22] [PASSED] ttm_device_init_basic
[15:59:22] [PASSED] ttm_device_init_multiple
[15:59:22] [PASSED] ttm_device_fini_basic
[15:59:22] [PASSED] ttm_device_init_no_vma_man
[15:59:22] ================== ttm_device_init_pools  ==================
[15:59:22] [PASSED] No DMA allocations, no DMA32 required
[15:59:22] [PASSED] DMA allocations, DMA32 required
[15:59:22] [PASSED] No DMA allocations, DMA32 required
[15:59:22] [PASSED] DMA allocations, no DMA32 required
[15:59:22] ============== [PASSED] ttm_device_init_pools ==============
[15:59:22] =================== [PASSED] ttm_device ====================
[15:59:22] ================== ttm_pool (8 subtests) ===================
[15:59:22] ================== ttm_pool_alloc_basic  ===================
[15:59:22] [PASSED] One page
[15:59:22] [PASSED] More than one page
[15:59:22] [PASSED] Above the allocation limit
[15:59:22] [PASSED] One page, with coherent DMA mappings enabled
[15:59:22] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[15:59:22] ============== [PASSED] ttm_pool_alloc_basic ===============
[15:59:22] ============== ttm_pool_alloc_basic_dma_addr  ==============
[15:59:22] [PASSED] One page
[15:59:22] [PASSED] More than one page
[15:59:22] [PASSED] Above the allocation limit
[15:59:22] [PASSED] One page, with coherent DMA mappings enabled
[15:59:22] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[15:59:22] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[15:59:22] [PASSED] ttm_pool_alloc_order_caching_match
[15:59:22] [PASSED] ttm_pool_alloc_caching_mismatch
[15:59:22] [PASSED] ttm_pool_alloc_order_mismatch
[15:59:22] [PASSED] ttm_pool_free_dma_alloc
[15:59:22] [PASSED] ttm_pool_free_no_dma_alloc
[15:59:22] [PASSED] ttm_pool_fini_basic
[15:59:22] ==================== [PASSED] ttm_pool =====================
[15:59:22] ================ ttm_resource (8 subtests) =================
[15:59:22] ================= ttm_resource_init_basic  =================
[15:59:22] [PASSED] Init resource in TTM_PL_SYSTEM
[15:59:22] [PASSED] Init resource in TTM_PL_VRAM
[15:59:22] [PASSED] Init resource in a private placement
[15:59:22] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[15:59:22] ============= [PASSED] ttm_resource_init_basic =============
[15:59:22] [PASSED] ttm_resource_init_pinned
[15:59:22] [PASSED] ttm_resource_fini_basic
[15:59:22] [PASSED] ttm_resource_manager_init_basic
[15:59:22] [PASSED] ttm_resource_manager_usage_basic
[15:59:22] [PASSED] ttm_resource_manager_set_used_basic
[15:59:22] [PASSED] ttm_sys_man_alloc_basic
[15:59:22] [PASSED] ttm_sys_man_free_basic
[15:59:22] ================== [PASSED] ttm_resource ===================
[15:59:22] =================== ttm_tt (15 subtests) ===================
[15:59:22] ==================== ttm_tt_init_basic  ====================
[15:59:22] [PASSED] Page-aligned size
[15:59:22] [PASSED] Extra pages requested
[15:59:22] ================ [PASSED] ttm_tt_init_basic ================
[15:59:22] [PASSED] ttm_tt_init_misaligned
[15:59:22] [PASSED] ttm_tt_fini_basic
[15:59:22] [PASSED] ttm_tt_fini_sg
[15:59:22] [PASSED] ttm_tt_fini_shmem
[15:59:22] [PASSED] ttm_tt_create_basic
[15:59:22] [PASSED] ttm_tt_create_invalid_bo_type
[15:59:22] [PASSED] ttm_tt_create_ttm_exists
[15:59:22] [PASSED] ttm_tt_create_failed
[15:59:22] [PASSED] ttm_tt_destroy_basic
[15:59:22] [PASSED] ttm_tt_populate_null_ttm
[15:59:22] [PASSED] ttm_tt_populate_populated_ttm
[15:59:22] [PASSED] ttm_tt_unpopulate_basic
[15:59:22] [PASSED] ttm_tt_unpopulate_empty_ttm
[15:59:22] [PASSED] ttm_tt_swapin_basic
[15:59:22] ===================== [PASSED] ttm_tt ======================
[15:59:22] =================== ttm_bo (14 subtests) ===================
[15:59:22] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[15:59:22] [PASSED] Cannot be interrupted and sleeps
[15:59:22] [PASSED] Cannot be interrupted, locks straight away
[15:59:22] [PASSED] Can be interrupted, sleeps
[15:59:22] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[15:59:22] [PASSED] ttm_bo_reserve_locked_no_sleep
[15:59:22] [PASSED] ttm_bo_reserve_no_wait_ticket
[15:59:22] [PASSED] ttm_bo_reserve_double_resv
[15:59:22] [PASSED] ttm_bo_reserve_interrupted
[15:59:22] [PASSED] ttm_bo_reserve_deadlock
[15:59:22] [PASSED] ttm_bo_unreserve_basic
[15:59:22] [PASSED] ttm_bo_unreserve_pinned
[15:59:22] [PASSED] ttm_bo_unreserve_bulk
[15:59:22] [PASSED] ttm_bo_fini_basic
[15:59:22] [PASSED] ttm_bo_fini_shared_resv
[15:59:22] [PASSED] ttm_bo_pin_basic
[15:59:22] [PASSED] ttm_bo_pin_unpin_resource
[15:59:22] [PASSED] ttm_bo_multiple_pin_one_unpin
[15:59:22] ===================== [PASSED] ttm_bo ======================
[15:59:22] ============== ttm_bo_validate (22 subtests) ===============
[15:59:22] ============== ttm_bo_init_reserved_sys_man  ===============
[15:59:22] [PASSED] Buffer object for userspace
[15:59:22] [PASSED] Kernel buffer object
[15:59:22] [PASSED] Shared buffer object
[15:59:22] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[15:59:22] ============== ttm_bo_init_reserved_mock_man  ==============
[15:59:22] [PASSED] Buffer object for userspace
[15:59:22] [PASSED] Kernel buffer object
[15:59:22] [PASSED] Shared buffer object
[15:59:22] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[15:59:22] [PASSED] ttm_bo_init_reserved_resv
[15:59:22] ================== ttm_bo_validate_basic  ==================
[15:59:22] [PASSED] Buffer object for userspace
[15:59:22] [PASSED] Kernel buffer object
[15:59:22] [PASSED] Shared buffer object
[15:59:22] ============== [PASSED] ttm_bo_validate_basic ==============
[15:59:22] [PASSED] ttm_bo_validate_invalid_placement
[15:59:22] ============= ttm_bo_validate_same_placement  ==============
[15:59:22] [PASSED] System manager
[15:59:22] [PASSED] VRAM manager
[15:59:22] ========= [PASSED] ttm_bo_validate_same_placement ==========
[15:59:22] [PASSED] ttm_bo_validate_failed_alloc
[15:59:22] [PASSED] ttm_bo_validate_pinned
[15:59:22] [PASSED] ttm_bo_validate_busy_placement
[15:59:22] ================ ttm_bo_validate_multihop  =================
[15:59:22] [PASSED] Buffer object for userspace
[15:59:22] [PASSED] Kernel buffer object
[15:59:22] [PASSED] Shared buffer object
[15:59:22] ============ [PASSED] ttm_bo_validate_multihop =============
[15:59:22] ========== ttm_bo_validate_no_placement_signaled  ==========
[15:59:22] [PASSED] Buffer object in system domain, no page vector
[15:59:22] [PASSED] Buffer object in system domain with an existing page vector
[15:59:22] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[15:59:22] ======== ttm_bo_validate_no_placement_not_signaled  ========
[15:59:22] [PASSED] Buffer object for userspace
[15:59:22] [PASSED] Kernel buffer object
[15:59:22] [PASSED] Shared buffer object
[15:59:22] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[15:59:22] [PASSED] ttm_bo_validate_move_fence_signaled
[15:59:22] ========= ttm_bo_validate_move_fence_not_signaled  =========
[15:59:22] [PASSED] Waits for GPU
[15:59:22] [PASSED] Tries to lock straight away
[15:59:22] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[15:59:22] [PASSED] ttm_bo_validate_swapout
[15:59:22] [PASSED] ttm_bo_validate_happy_evict
[15:59:22] [PASSED] ttm_bo_validate_all_pinned_evict
[15:59:22] [PASSED] ttm_bo_validate_allowed_only_evict
[15:59:22] [PASSED] ttm_bo_validate_deleted_evict
[15:59:22] [PASSED] ttm_bo_validate_busy_domain_evict
[15:59:22] [PASSED] ttm_bo_validate_evict_gutting
[15:59:22] [PASSED] ttm_bo_validate_recrusive_evict
[15:59:22] ================= [PASSED] ttm_bo_validate =================
[15:59:22] ============================================================
[15:59:22] Testing complete. Ran 106 tests: passed: 106
[15:59:22] Elapsed time: 12.073s total, 1.819s configuring, 10.039s building, 0.179s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/dma-buf/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[15:59:22] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:59:24] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[15:59:33] Starting KUnit Kernel (1/1)...
[15:59:33] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[15:59:33] ============= refcount_interrupt (4 subtests) ==============
[15:59:33] [PASSED] test_single_irq_change
[15:59:33] [PASSED] test_nested_irq_change
[15:59:33] [PASSED] test_multiple_irq_change
[15:59:33] [PASSED] test_irq_save
[15:59:33] =============== [PASSED] refcount_interrupt ================
[15:59:33] =============== dma-buf-fence (12 subtests) ================
[15:59:33] [PASSED] test_sanitycheck
[15:59:33] [PASSED] test_signaling
[15:59:33] [PASSED] test_add_callback
[15:59:33] [PASSED] test_late_add_callback
[15:59:33] [PASSED] test_rm_callback
[15:59:33] [PASSED] test_late_rm_callback
[15:59:33] [PASSED] test_status
[15:59:33] [PASSED] test_error
[15:59:33] [PASSED] test_wait
[15:59:33] [PASSED] test_wait_timeout
[15:59:33] [PASSED] test_stub
[15:59:33] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[15:59:33] ================== [PASSED] dma-buf-fence ==================
[15:59:33] ============ dma-buf-fence-chain (11 subtests) =============
[15:59:33] [PASSED] test_sanitycheck
[15:59:33] [PASSED] test_find_seqno
[15:59:33] [PASSED] test_find_signaled
[15:59:33] [PASSED] test_find_out_of_order
[15:59:38] [PASSED] test_find_gap
[15:59:38] [PASSED] test_find_race
[15:59:38] [PASSED] test_signal_forward
[15:59:38] [PASSED] test_signal_backward
[15:59:38] [PASSED] test_wait_forward
[15:59:38] [PASSED] test_wait_backward
[15:59:38] [PASSED] test_wait_random
[15:59:38] =============== [PASSED] dma-buf-fence-chain ===============
[15:59:38] ============ dma-buf-fence-unwrap (10 subtests) ============
[15:59:38] [PASSED] test_sanitycheck
[15:59:38] [PASSED] test_unwrap_array
[15:59:38] [PASSED] test_unwrap_chain
[15:59:38] [PASSED] test_unwrap_chain_array
[15:59:38] [PASSED] test_unwrap_merge
[15:59:38] [PASSED] test_unwrap_merge_duplicate
[15:59:38] [PASSED] test_unwrap_merge_seqno
[15:59:38] [PASSED] test_unwrap_merge_order
[15:59:38] [PASSED] test_unwrap_merge_complex
[15:59:38] [PASSED] test_unwrap_merge_complex_seqno
[15:59:38] ============== [PASSED] dma-buf-fence-unwrap ===============
[15:59:38] ================ dma-buf-resv (5 subtests) =================
[15:59:38] [PASSED] test_sanitycheck
[15:59:38] ===================== test_signaling  ======================
[15:59:38] [PASSED] kernel
[15:59:38] [PASSED] write
[15:59:38] [PASSED] read
[15:59:38] [PASSED] bookkeep
[15:59:38] ================= [PASSED] test_signaling ==================
[15:59:38] ====================== test_for_each  ======================
[15:59:38] [PASSED] kernel
[15:59:38] [PASSED] write
[15:59:38] [PASSED] read
[15:59:38] [PASSED] bookkeep
[15:59:38] ================== [PASSED] test_for_each ==================
[15:59:38] ================= test_for_each_unlocked  ==================
[15:59:38] [PASSED] kernel
[15:59:38] [PASSED] write
[15:59:38] [PASSED] read
[15:59:38] [PASSED] bookkeep
[15:59:38] ============= [PASSED] test_for_each_unlocked ==============
[15:59:38] ===================== test_get_fences  =====================
[15:59:38] [PASSED] kernel
[15:59:38] [PASSED] write
[15:59:38] [PASSED] read
[15:59:38] [PASSED] bookkeep
[15:59:38] ================= [PASSED] test_get_fences =================
[15:59:38] ================== [PASSED] dma-buf-resv ===================
[15:59:38] ============================================================
[15:59:38] Testing complete. Ran 54 tests: passed: 53, skipped: 1
[15:59:38] Elapsed time: 15.844s total, 1.783s configuring, 8.739s building, 5.282s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


