Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400AEC79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 18:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF39910E2C8;
	Thu, 10 Sep 2026 18:47:08 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F24F10E2C8;
 Thu, 10 Sep 2026 18:47:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/hwmon=3A_Update_hwmon_t?=
 =?utf-8?q?hermal_mailbox_handling_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Sep 2026 18:47:08 -0000
Message-ID: <178906602844.147924.9496464658994126043@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260910182756.638830-1-karthik.poosa@intel.com>
In-Reply-To: <20260910182756.638830-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Update hwmon thermal mailbox handling (rev3)
URL   : https://patchwork.freedesktop.org/series/172689/
State : success

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[18:45:05] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:45:09] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[18:45:29] Starting KUnit Kernel (1/1)...
[18:45:29] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[18:45:29] ============= refcount_interrupt (4 subtests) ==============
[18:45:29] [PASSED] test_single_irq_change
[18:45:29] [PASSED] test_nested_irq_change
[18:45:29] [PASSED] test_multiple_irq_change
[18:45:29] [PASSED] test_irq_save
[18:45:29] =============== [PASSED] refcount_interrupt ================
[18:45:29] ================= gpu_buddy (14 subtests) ==================
[18:45:29] [PASSED] gpu_test_buddy_alloc_limit
[18:45:29] [PASSED] gpu_test_buddy_alloc_optimistic
[18:45:29] [PASSED] gpu_test_buddy_alloc_pessimistic
[18:45:29] [PASSED] gpu_test_buddy_alloc_pathological
[18:45:29] [PASSED] gpu_test_buddy_alloc_contiguous
[18:45:29] [PASSED] gpu_test_buddy_alloc_clear
[18:45:29] [PASSED] gpu_test_buddy_alloc_range
[18:45:30] [PASSED] gpu_test_buddy_alloc_range_bias
[18:45:31] [PASSED] gpu_test_buddy_fragmentation_performance
[18:45:31] [PASSED] gpu_test_buddy_dirty_tracker_performance
[18:45:31] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[18:45:31] [PASSED] gpu_test_buddy_offset_aligned_allocation
[18:45:31] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[18:45:31] [PASSED] gpu_test_buddy_addr_to_block
[18:45:31] ==================== [PASSED] gpu_buddy ====================
[18:45:31] ============================================================
[18:45:31] Testing complete. Ran 18 tests: passed: 18
[18:45:31] Elapsed time: 26.697s total, 4.392s configuring, 20.388s building, 1.874s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[18:45:31] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:45:33] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[18:46:07] Starting KUnit Kernel (1/1)...
[18:46:07] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[18:46:07] ============= refcount_interrupt (4 subtests) ==============
[18:46:07] [PASSED] test_single_irq_change
[18:46:07] [PASSED] test_nested_irq_change
[18:46:07] [PASSED] test_multiple_irq_change
[18:46:07] [PASSED] test_irq_save
[18:46:07] =============== [PASSED] refcount_interrupt ================
[18:46:07] ================== guc_buf (11 subtests) ===================
[18:46:07] [PASSED] test_smallest
[18:46:07] [PASSED] test_largest
[18:46:07] [PASSED] test_granular
[18:46:07] [PASSED] test_unique
[18:46:07] [PASSED] test_overlap
[18:46:07] [PASSED] test_reusable
[18:46:07] [PASSED] test_too_big
[18:46:07] [PASSED] test_flush
[18:46:07] [PASSED] test_lookup
[18:46:07] [PASSED] test_data
[18:46:07] [PASSED] test_class
[18:46:07] ===================== [PASSED] guc_buf =====================
[18:46:07] =================== guc_dbm (7 subtests) ===================
[18:46:07] [PASSED] test_empty
[18:46:07] [PASSED] test_default
[18:46:07] ======================== test_size  ========================
[18:46:07] [PASSED] 4
[18:46:07] [PASSED] 8
[18:46:07] [PASSED] 32
[18:46:07] [PASSED] 256
[18:46:07] ==================== [PASSED] test_size ====================
[18:46:07] ======================= test_reuse  ========================
[18:46:07] [PASSED] 4
[18:46:07] [PASSED] 8
[18:46:07] [PASSED] 32
[18:46:07] [PASSED] 256
[18:46:07] =================== [PASSED] test_reuse ====================
[18:46:07] =================== test_range_overlap  ====================
[18:46:07] [PASSED] 4
[18:46:07] [PASSED] 8
[18:46:07] [PASSED] 32
[18:46:07] [PASSED] 256
[18:46:07] =============== [PASSED] test_range_overlap ================
[18:46:07] =================== test_range_compact  ====================
[18:46:07] [PASSED] 4
[18:46:07] [PASSED] 8
[18:46:07] [PASSED] 32
[18:46:07] [PASSED] 256
[18:46:07] =============== [PASSED] test_range_compact ================
[18:46:07] ==================== test_range_spare  =====================
[18:46:07] [PASSED] 4
[18:46:07] [PASSED] 8
[18:46:07] [PASSED] 32
[18:46:07] [PASSED] 256
[18:46:07] ================ [PASSED] test_range_spare =================
[18:46:07] ===================== [PASSED] guc_dbm =====================
[18:46:07] =================== guc_idm (6 subtests) ===================
[18:46:07] [PASSED] bad_init
[18:46:07] [PASSED] no_init
[18:46:07] [PASSED] init_fini
[18:46:07] [PASSED] check_used
[18:46:07] [PASSED] check_quota
[18:46:07] [PASSED] check_all
[18:46:07] ===================== [PASSED] guc_idm =====================
[18:46:07] =============== guc_klv_helpers (9 subtests) ===============
[18:46:07] [PASSED] test_count
[18:46:07] [PASSED] test_encode_u32
[18:46:07] [PASSED] test_encode_u64
[18:46:07] [PASSED] test_encode_string
[18:46:07] [PASSED] test_encode_object_raw
[18:46:07] [PASSED] test_encode_object_klv
[18:46:07] [PASSED] test_encode_object_nested
[18:46:07] [PASSED] test_encode_object_basic
[18:46:07] [PASSED] test_print
[18:46:07] ================= [PASSED] guc_klv_helpers =================
[18:46:07] =================== xe_log (4 subtests) ====================
[18:46:07] [PASSED] demo_cper
[18:46:07] [PASSED] demo_dmesg
[18:46:07] ======================= test_dmesg  ========================
[18:46:07] [PASSED] test_fatal
[18:46:07] [PASSED] test_fatal_tile
[18:46:07] [PASSED] test_fatal_gt
[18:46:07] [PASSED] test_fatal_comp
[18:46:07] [PASSED] test_fatal_comp_tile
[18:46:07] [PASSED] test_fatal_comp_gt
[18:46:07] [PASSED] test_fatal_all
[18:46:07] [PASSED] test_recoverable
[18:46:07] [PASSED] test_recoverable_tile
[18:46:07] [PASSED] test_recoverable_gt
[18:46:07] [PASSED] test_recoverable_comp
[18:46:07] [PASSED] test_recoverable_comp_tile
[18:46:07] [PASSED] test_recoverable_comp_gt
[18:46:07] [PASSED] test_recoverable_all
[18:46:07] [PASSED] test_info
[18:46:07] [PASSED] test_info_tile
[18:46:07] [PASSED] test_info_gt
[18:46:07] [PASSED] test_info_err
[18:46:07] [PASSED] test_info_comp
[18:46:07] [PASSED] test_info_comp_tile
[18:46:07] [PASSED] test_info_comp_gt
[18:46:07] [PASSED] test_info_all
[18:46:07] [PASSED] test_hw_fatal
[18:46:07] [PASSED] test_hw_recoverable
[18:46:07] [PASSED] test_hw_corrected
[18:46:07] [PASSED] test_hw_informational
[18:46:07] =================== [PASSED] test_dmesg ====================
[18:46:07] ====================== test_invalid  =======================
[18:46:07] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[18:46:07] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[18:46:07] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[18:46:07] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[18:46:07] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[18:46:07] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[18:46:07] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[18:46:07] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[18:46:07] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[18:46:07] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[18:46:07] ================== [SKIPPED] test_invalid ==================
[18:46:07] ===================== [PASSED] xe_log ======================
[18:46:07] ================== no_relay (3 subtests) ===================
[18:46:07] [PASSED] xe_drops_guc2pf_if_not_ready
[18:46:07] [PASSED] xe_drops_guc2vf_if_not_ready
[18:46:07] [PASSED] xe_rejects_send_if_not_ready
[18:46:07] ==================== [PASSED] no_relay =====================
[18:46:07] ================== pf_relay (14 subtests) ==================
[18:46:07] [PASSED] pf_rejects_guc2pf_too_short
[18:46:07] [PASSED] pf_rejects_guc2pf_too_long
[18:46:07] [PASSED] pf_rejects_guc2pf_no_payload
[18:46:07] [PASSED] pf_fails_no_payload
[18:46:07] [PASSED] pf_fails_bad_origin
[18:46:07] [PASSED] pf_fails_bad_type
[18:46:07] [PASSED] pf_txn_reports_error
[18:46:07] [PASSED] pf_txn_sends_pf2guc
[18:46:07] [PASSED] pf_sends_pf2guc
[18:46:07] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[18:46:07] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[18:46:07] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[18:46:07] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[18:46:07] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[18:46:07] ==================== [PASSED] pf_relay =====================
[18:46:07] ================== vf_relay (3 subtests) ===================
[18:46:07] [PASSED] vf_rejects_guc2vf_too_short
[18:46:07] [PASSED] vf_rejects_guc2vf_too_long
[18:46:07] [PASSED] vf_rejects_guc2vf_no_payload
[18:46:07] ==================== [PASSED] vf_relay =====================
[18:46:07] ================ pf_gt_config (9 subtests) =================
[18:46:07] [PASSED] fair_contexts_1vf
[18:46:07] [PASSED] fair_doorbells_1vf
[18:46:07] [PASSED] fair_ggtt_1vf
[18:46:07] ====================== fair_vram_1vf  ======================
[18:46:07] [PASSED] 3.50 GiB
[18:46:07] [PASSED] 11.5 GiB
[18:46:07] [PASSED] 15.5 GiB
[18:46:07] [PASSED] 31.5 GiB
[18:46:07] [PASSED] 63.5 GiB
[18:46:07] [PASSED] 1.91 GiB
[18:46:07] ================== [PASSED] fair_vram_1vf ==================
[18:46:07] ================ fair_vram_1vf_admin_only  =================
[18:46:07] [PASSED] 3.50 GiB
[18:46:07] [PASSED] 11.5 GiB
[18:46:07] [PASSED] 15.5 GiB
[18:46:07] [PASSED] 31.5 GiB
[18:46:07] [PASSED] 63.5 GiB
[18:46:07] [PASSED] 1.91 GiB
[18:46:07] ============ [PASSED] fair_vram_1vf_admin_only =============
[18:46:07] ====================== fair_contexts  ======================
[18:46:07] [PASSED] 1 VF
[18:46:07] [PASSED] 2 VFs
[18:46:07] [PASSED] 3 VFs
[18:46:07] [PASSED] 4 VFs
[18:46:07] [PASSED] 5 VFs
[18:46:07] [PASSED] 6 VFs
[18:46:07] [PASSED] 7 VFs
[18:46:07] [PASSED] 8 VFs
[18:46:07] [PASSED] 9 VFs
[18:46:07] [PASSED] 10 VFs
[18:46:07] [PASSED] 11 VFs
[18:46:07] [PASSED] 12 VFs
[18:46:07] [PASSED] 13 VFs
[18:46:07] [PASSED] 14 VFs
[18:46:07] [PASSED] 15 VFs
[18:46:07] [PASSED] 16 VFs
[18:46:07] [PASSED] 17 VFs
[18:46:07] [PASSED] 18 VFs
[18:46:07] [PASSED] 19 VFs
[18:46:07] [PASSED] 20 VFs
[18:46:07] [PASSED] 21 VFs
[18:46:07] [PASSED] 22 VFs
[18:46:07] [PASSED] 23 VFs
[18:46:07] [PASSED] 24 VFs
[18:46:07] [PASSED] 25 VFs
[18:46:07] [PASSED] 26 VFs
[18:46:07] [PASSED] 27 VFs
[18:46:07] [PASSED] 28 VFs
[18:46:07] [PASSED] 29 VFs
[18:46:07] [PASSED] 30 VFs
[18:46:07] [PASSED] 31 VFs
[18:46:07] [PASSED] 32 VFs
[18:46:07] [PASSED] 33 VFs
[18:46:07] [PASSED] 34 VFs
[18:46:07] [PASSED] 35 VFs
[18:46:07] [PASSED] 36 VFs
[18:46:07] [PASSED] 37 VFs
[18:46:07] [PASSED] 38 VFs
[18:46:07] [PASSED] 39 VFs
[18:46:07] [PASSED] 40 VFs
[18:46:07] [PASSED] 41 VFs
[18:46:07] [PASSED] 42 VFs
[18:46:07] [PASSED] 43 VFs
[18:46:07] [PASSED] 44 VFs
[18:46:07] [PASSED] 45 VFs
[18:46:07] [PASSED] 46 VFs
[18:46:07] [PASSED] 47 VFs
[18:46:07] [PASSED] 48 VFs
[18:46:07] [PASSED] 49 VFs
[18:46:07] [PASSED] 50 VFs
[18:46:07] [PASSED] 51 VFs
[18:46:07] [PASSED] 52 VFs
[18:46:07] [PASSED] 53 VFs
[18:46:07] [PASSED] 54 VFs
[18:46:07] [PASSED] 55 VFs
[18:46:07] [PASSED] 56 VFs
[18:46:07] [PASSED] 57 VFs
[18:46:07] [PASSED] 58 VFs
[18:46:07] [PASSED] 59 VFs
[18:46:07] [PASSED] 60 VFs
[18:46:07] [PASSED] 61 VFs
[18:46:07] [PASSED] 62 VFs
[18:46:07] [PASSED] 63 VFs
[18:46:07] ================== [PASSED] fair_contexts ==================
[18:46:07] ===================== fair_doorbells  ======================
[18:46:07] [PASSED] 1 VF
[18:46:07] [PASSED] 2 VFs
[18:46:07] [PASSED] 3 VFs
[18:46:07] [PASSED] 4 VFs
[18:46:07] [PASSED] 5 VFs
[18:46:07] [PASSED] 6 VFs
[18:46:07] [PASSED] 7 VFs
[18:46:07] [PASSED] 8 VFs
[18:46:07] [PASSED] 9 VFs
[18:46:07] [PASSED] 10 VFs
[18:46:07] [PASSED] 11 VFs
[18:46:07] [PASSED] 12 VFs
[18:46:07] [PASSED] 13 VFs
[18:46:07] [PASSED] 14 VFs
[18:46:07] [PASSED] 15 VFs
[18:46:07] [PASSED] 16 VFs
[18:46:07] [PASSED] 17 VFs
[18:46:07] [PASSED] 18 VFs
[18:46:07] [PASSED] 19 VFs
[18:46:07] [PASSED] 20 VFs
[18:46:07] [PASSED] 21 VFs
[18:46:07] [PASSED] 22 VFs
[18:46:07] [PASSED] 23 VFs
[18:46:07] [PASSED] 24 VFs
[18:46:07] [PASSED] 25 VFs
[18:46:07] [PASSED] 26 VFs
[18:46:07] [PASSED] 27 VFs
[18:46:07] [PASSED] 28 VFs
[18:46:07] [PASSED] 29 VFs
[18:46:07] [PASSED] 30 VFs
[18:46:07] [PASSED] 31 VFs
[18:46:07] [PASSED] 32 VFs
[18:46:07] [PASSED] 33 VFs
[18:46:07] [PASSED] 34 VFs
[18:46:07] [PASSED] 35 VFs
[18:46:07] [PASSED] 36 VFs
[18:46:07] [PASSED] 37 VFs
[18:46:07] [PASSED] 38 VFs
[18:46:07] [PASSED] 39 VFs
[18:46:07] [PASSED] 40 VFs
[18:46:07] [PASSED] 41 VFs
[18:46:07] [PASSED] 42 VFs
[18:46:07] [PASSED] 43 VFs
[18:46:07] [PASSED] 44 VFs
[18:46:07] [PASSED] 45 VFs
[18:46:07] [PASSED] 46 VFs
[18:46:07] [PASSED] 47 VFs
[18:46:07] [PASSED] 48 VFs
[18:46:07] [PASSED] 49 VFs
[18:46:07] [PASSED] 50 VFs
[18:46:07] [PASSED] 51 VFs
[18:46:07] [PASSED] 52 VFs
[18:46:07] [PASSED] 53 VFs
[18:46:07] [PASSED] 54 VFs
[18:46:07] [PASSED] 55 VFs
[18:46:07] [PASSED] 56 VFs
[18:46:07] [PASSED] 57 VFs
[18:46:07] [PASSED] 58 VFs
[18:46:07] [PASSED] 59 VFs
[18:46:07] [PASSED] 60 VFs
[18:46:07] [PASSED] 61 VFs
[18:46:07] [PASSED] 62 VFs
[18:46:07] [PASSED] 63 VFs
[18:46:07] ================= [PASSED] fair_doorbells ==================
[18:46:07] ======================== fair_ggtt  ========================
[18:46:07] [PASSED] 1 VF
[18:46:07] [PASSED] 2 VFs
[18:46:07] [PASSED] 3 VFs
[18:46:07] [PASSED] 4 VFs
[18:46:07] [PASSED] 5 VFs
[18:46:07] [PASSED] 6 VFs
[18:46:07] [PASSED] 7 VFs
[18:46:07] [PASSED] 8 VFs
[18:46:07] [PASSED] 9 VFs
[18:46:07] [PASSED] 10 VFs
[18:46:07] [PASSED] 11 VFs
[18:46:07] [PASSED] 12 VFs
[18:46:07] [PASSED] 13 VFs
[18:46:07] [PASSED] 14 VFs
[18:46:07] [PASSED] 15 VFs
[18:46:07] [PASSED] 16 VFs
[18:46:07] [PASSED] 17 VFs
[18:46:07] [PASSED] 18 VFs
[18:46:07] [PASSED] 19 VFs
[18:46:07] [PASSED] 20 VFs
[18:46:07] [PASSED] 21 VFs
[18:46:07] [PASSED] 22 VFs
[18:46:07] [PASSED] 23 VFs
[18:46:07] [PASSED] 24 VFs
[18:46:07] [PASSED] 25 VFs
[18:46:07] [PASSED] 26 VFs
[18:46:07] [PASSED] 27 VFs
[18:46:07] [PASSED] 28 VFs
[18:46:07] [PASSED] 29 VFs
[18:46:07] [PASSED] 30 VFs
[18:46:07] [PASSED] 31 VFs
[18:46:07] [PASSED] 32 VFs
[18:46:07] [PASSED] 33 VFs
[18:46:07] [PASSED] 34 VFs
[18:46:07] [PASSED] 35 VFs
[18:46:07] [PASSED] 36 VFs
[18:46:07] [PASSED] 37 VFs
[18:46:07] [PASSED] 38 VFs
[18:46:07] [PASSED] 39 VFs
[18:46:07] [PASSED] 40 VFs
[18:46:07] [PASSED] 41 VFs
[18:46:07] [PASSED] 42 VFs
[18:46:07] [PASSED] 43 VFs
[18:46:07] [PASSED] 44 VFs
[18:46:07] [PASSED] 45 VFs
[18:46:07] [PASSED] 46 VFs
[18:46:07] [PASSED] 47 VFs
[18:46:07] [PASSED] 48 VFs
[18:46:07] [PASSED] 49 VFs
[18:46:07] [PASSED] 50 VFs
[18:46:07] [PASSED] 51 VFs
[18:46:07] [PASSED] 52 VFs
[18:46:07] [PASSED] 53 VFs
[18:46:07] [PASSED] 54 VFs
[18:46:07] [PASSED] 55 VFs
[18:46:07] [PASSED] 56 VFs
[18:46:07] [PASSED] 57 VFs
[18:46:07] [PASSED] 58 VFs
[18:46:07] [PASSED] 59 VFs
[18:46:07] [PASSED] 60 VFs
[18:46:07] [PASSED] 61 VFs
[18:46:07] [PASSED] 62 VFs
[18:46:07] [PASSED] 63 VFs
[18:46:07] ==================== [PASSED] fair_ggtt ====================
[18:46:07] ======================== fair_vram  ========================
[18:46:07] [PASSED] 1 VF
[18:46:07] [PASSED] 2 VFs
[18:46:07] [PASSED] 3 VFs
[18:46:07] [PASSED] 4 VFs
[18:46:07] [PASSED] 5 VFs
[18:46:07] [PASSED] 6 VFs
[18:46:07] [PASSED] 7 VFs
[18:46:07] [PASSED] 8 VFs
[18:46:07] [PASSED] 9 VFs
[18:46:07] [PASSED] 10 VFs
[18:46:07] [PASSED] 11 VFs
[18:46:07] [PASSED] 12 VFs
[18:46:07] [PASSED] 13 VFs
[18:46:08] [PASSED] 14 VFs
[18:46:08] [PASSED] 15 VFs
[18:46:08] [PASSED] 16 VFs
[18:46:08] [PASSED] 17 VFs
[18:46:08] [PASSED] 18 VFs
[18:46:08] [PASSED] 19 VFs
[18:46:08] [PASSED] 20 VFs
[18:46:08] [PASSED] 21 VFs
[18:46:08] [PASSED] 22 VFs
[18:46:08] [PASSED] 23 VFs
[18:46:08] [PASSED] 24 VFs
[18:46:08] [PASSED] 25 VFs
[18:46:08] [PASSED] 26 VFs
[18:46:08] [PASSED] 27 VFs
[18:46:08] [PASSED] 28 VFs
[18:46:08] [PASSED] 29 VFs
[18:46:08] [PASSED] 30 VFs
[18:46:08] [PASSED] 31 VFs
[18:46:08] [PASSED] 32 VFs
[18:46:08] [PASSED] 33 VFs
[18:46:08] [PASSED] 34 VFs
[18:46:08] [PASSED] 35 VFs
[18:46:08] [PASSED] 36 VFs
[18:46:08] [PASSED] 37 VFs
[18:46:08] [PASSED] 38 VFs
[18:46:08] [PASSED] 39 VFs
[18:46:08] [PASSED] 40 VFs
[18:46:08] [PASSED] 41 VFs
[18:46:08] [PASSED] 42 VFs
[18:46:08] [PASSED] 43 VFs
[18:46:08] [PASSED] 44 VFs
[18:46:08] [PASSED] 45 VFs
[18:46:08] [PASSED] 46 VFs
[18:46:08] [PASSED] 47 VFs
[18:46:08] [PASSED] 48 VFs
[18:46:08] [PASSED] 49 VFs
[18:46:08] [PASSED] 50 VFs
[18:46:08] [PASSED] 51 VFs
[18:46:08] [PASSED] 52 VFs
[18:46:08] [PASSED] 53 VFs
[18:46:08] [PASSED] 54 VFs
[18:46:08] [PASSED] 55 VFs
[18:46:08] [PASSED] 56 VFs
[18:46:08] [PASSED] 57 VFs
[18:46:08] [PASSED] 58 VFs
[18:46:08] [PASSED] 59 VFs
[18:46:08] [PASSED] 60 VFs
[18:46:08] [PASSED] 61 VFs
[18:46:08] [PASSED] 62 VFs
[18:46:08] [PASSED] 63 VFs
[18:46:08] ==================== [PASSED] fair_vram ====================
[18:46:08] ================== [PASSED] pf_gt_config ===================
[18:46:08] ===================== lmtt (1 subtest) =====================
[18:46:08] ======================== test_ops  =========================
[18:46:08] [PASSED] 2-level
[18:46:08] [PASSED] multi-level
[18:46:08] ==================== [PASSED] test_ops =====================
[18:46:08] ====================== [PASSED] lmtt =======================
[18:46:08] ================= sriov_packet (1 subtest) =================
[18:46:08] [PASSED] test_descriptor_init
[18:46:08] ================== [PASSED] sriov_packet ===================
[18:46:08] ================= pf_service (11 subtests) =================
[18:46:08] [PASSED] pf_negotiate_any
[18:46:08] [PASSED] pf_negotiate_base_match
[18:46:08] [PASSED] pf_negotiate_base_newer
[18:46:08] [PASSED] pf_negotiate_base_next
[18:46:08] [SKIPPED] pf_negotiate_base_older (no older minor)
[18:46:08] [PASSED] pf_negotiate_base_prev
[18:46:08] [PASSED] pf_negotiate_latest_match
[18:46:08] [PASSED] pf_negotiate_latest_newer
[18:46:08] [PASSED] pf_negotiate_latest_next
[18:46:08] [SKIPPED] pf_negotiate_latest_older (no older minor)
[18:46:08] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[18:46:08] =================== [PASSED] pf_service ====================
[18:46:08] ================= xe_guc_g2g (2 subtests) ==================
[18:46:08] ============== xe_live_guc_g2g_kunit_default  ==============
[18:46:08] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[18:46:08] ============== xe_live_guc_g2g_kunit_allmem  ===============
[18:46:08] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[18:46:08] =================== [SKIPPED] xe_guc_g2g ===================
[18:46:08] =================== xe_mocs (2 subtests) ===================
[18:46:08] ================ xe_live_mocs_kernel_kunit  ================
[18:46:08] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[18:46:08] ================ xe_live_mocs_reset_kunit  =================
[18:46:08] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[18:46:08] ==================== [SKIPPED] xe_mocs =====================
[18:46:08] ================= xe_migrate (2 subtests) ==================
[18:46:08] ================= xe_migrate_sanity_kunit  =================
[18:46:08] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[18:46:08] ================== xe_validate_ccs_kunit  ==================
[18:46:08] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[18:46:08] =================== [SKIPPED] xe_migrate ===================
[18:46:08] ================== xe_dma_buf (1 subtest) ==================
[18:46:08] ==================== xe_dma_buf_kunit  =====================
[18:46:08] ================ [SKIPPED] xe_dma_buf_kunit ================
[18:46:08] =================== [SKIPPED] xe_dma_buf ===================
[18:46:08] ================= xe_bo_shrink (1 subtest) =================
[18:46:08] =================== xe_bo_shrink_kunit  ====================
[18:46:08] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[18:46:08] ================== [SKIPPED] xe_bo_shrink ==================
[18:46:08] ==================== xe_bo (2 subtests) ====================
[18:46:08] ================== xe_ccs_migrate_kunit  ===================
[18:46:08] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[18:46:08] ==================== xe_bo_evict_kunit  ====================
[18:46:08] =============== [SKIPPED] xe_bo_evict_kunit ================
[18:46:08] ===================== [SKIPPED] xe_bo ======================
[18:46:08] =================== xe_any (9 subtests) ====================
[18:46:08] [PASSED] test_to_xe
[18:46:08] [PASSED] test_to_dev
[18:46:08] [PASSED] test_to_pdev
[18:46:08] [PASSED] test_to_drm
[18:46:08] [PASSED] test_if_pdev
[18:46:08] [PASSED] test_if_xe
[18:46:08] [PASSED] test_if_tile
[18:46:08] [PASSED] test_if_gt
[18:46:08] [PASSED] test_to_id
[18:46:08] ===================== [PASSED] xe_any ======================
[18:46:08] ==================== args (13 subtests) ====================
[18:46:08] [PASSED] count_args_test
[18:46:08] [PASSED] call_args_example
[18:46:08] [PASSED] call_args_test
[18:46:08] [PASSED] drop_first_arg_example
[18:46:08] [PASSED] drop_first_arg_test
[18:46:08] [PASSED] first_arg_example
[18:46:08] [PASSED] first_arg_test
[18:46:08] [PASSED] last_arg_example
[18:46:08] [PASSED] last_arg_test
[18:46:08] [PASSED] pick_arg_example
[18:46:08] [PASSED] if_args_example
[18:46:08] [PASSED] if_args_test
[18:46:08] [PASSED] sep_comma_example
[18:46:08] ====================== [PASSED] args =======================
[18:46:08] =================== xe_pci (3 subtests) ====================
[18:46:08] ==================== check_graphics_ip  ====================
[18:46:08] [PASSED] 12.00 Xe_LP
[18:46:08] [PASSED] 12.10 Xe_LP+
[18:46:08] [PASSED] 12.55 Xe_HPG
[18:46:08] [PASSED] 12.60 Xe_HPC
[18:46:08] [PASSED] 12.70 Xe_LPG
[18:46:08] [PASSED] 12.71 Xe_LPG
[18:46:08] [PASSED] 12.74 Xe_LPG+
[18:46:08] [PASSED] 20.01 Xe2_HPG
[18:46:08] [PASSED] 20.02 Xe2_HPG
[18:46:08] [PASSED] 20.04 Xe2_LPG
[18:46:08] [PASSED] 30.00 Xe3_LPG
[18:46:08] [PASSED] 30.01 Xe3_LPG
[18:46:08] [PASSED] 30.03 Xe3_LPG
[18:46:08] [PASSED] 30.04 Xe3_LPG
[18:46:08] [PASSED] 30.05 Xe3_LPG
[18:46:08] [PASSED] 35.10 Xe3p_LPG
[18:46:08] [PASSED] 35.11 Xe3p_XPC
[18:46:08] ================ [PASSED] check_graphics_ip ================
[18:46:08] ===================== check_media_ip  ======================
[18:46:08] [PASSED] 12.00 Xe_M
[18:46:08] [PASSED] 12.55 Xe_HPM
[18:46:08] [PASSED] 13.00 Xe_LPM+
[18:46:08] [PASSED] 13.01 Xe2_HPM
[18:46:08] [PASSED] 20.00 Xe2_LPM
[18:46:08] [PASSED] 30.00 Xe3_LPM
[18:46:08] [PASSED] 30.02 Xe3_LPM
[18:46:08] [PASSED] 35.00 Xe3p_LPM
[18:46:08] [PASSED] 35.03 Xe3p_HPM
[18:46:08] ================= [PASSED] check_media_ip ==================
[18:46:08] =================== check_platform_desc  ===================
[18:46:08] [PASSED] 0x9A60 (TIGERLAKE)
[18:46:08] [PASSED] 0x9A68 (TIGERLAKE)
[18:46:08] [PASSED] 0x9A70 (TIGERLAKE)
[18:46:08] [PASSED] 0x9A40 (TIGERLAKE)
[18:46:08] [PASSED] 0x9A49 (TIGERLAKE)
[18:46:08] [PASSED] 0x9A59 (TIGERLAKE)
[18:46:08] [PASSED] 0x9A78 (TIGERLAKE)
[18:46:08] [PASSED] 0x9AC0 (TIGERLAKE)
[18:46:08] [PASSED] 0x9AC9 (TIGERLAKE)
[18:46:08] [PASSED] 0x9AD9 (TIGERLAKE)
[18:46:08] [PASSED] 0x9AF8 (TIGERLAKE)
[18:46:08] [PASSED] 0x4C80 (ROCKETLAKE)
[18:46:08] [PASSED] 0x4C8A (ROCKETLAKE)
[18:46:08] [PASSED] 0x4C8B (ROCKETLAKE)
[18:46:08] [PASSED] 0x4C8C (ROCKETLAKE)
[18:46:08] [PASSED] 0x4C90 (ROCKETLAKE)
[18:46:08] [PASSED] 0x4C9A (ROCKETLAKE)
[18:46:08] [PASSED] 0x4680 (ALDERLAKE_S)
[18:46:08] [PASSED] 0x4682 (ALDERLAKE_S)
[18:46:08] [PASSED] 0x4688 (ALDERLAKE_S)
[18:46:08] [PASSED] 0x468A (ALDERLAKE_S)
[18:46:08] [PASSED] 0x468B (ALDERLAKE_S)
[18:46:08] [PASSED] 0x4690 (ALDERLAKE_S)
[18:46:08] [PASSED] 0x4692 (ALDERLAKE_S)
[18:46:08] [PASSED] 0x4693 (ALDERLAKE_S)
[18:46:08] [PASSED] 0x46A0 (ALDERLAKE_P)
[18:46:08] [PASSED] 0x46A1 (ALDERLAKE_P)
[18:46:08] [PASSED] 0x46A2 (ALDERLAKE_P)
[18:46:08] [PASSED] 0x46A3 (ALDERLAKE_P)
[18:46:08] [PASSED] 0x46A6 (ALDERLAKE_P)
[18:46:08] [PASSED] 0x46A8 (ALDERLAKE_P)
[18:46:08] [PASSED] 0x46AA (ALDERLAKE_P)
[18:46:08] [PASSED] 0x462A (ALDERLAKE_P)
[18:46:08] [PASSED] 0x4626 (ALDERLAKE_P)
[18:46:08] [PASSED] 0x4628 (ALDERLAKE_P)
[18:46:08] [PASSED] 0x46B0 (ALDERLAKE_P)
[18:46:08] [PASSED] 0x46B1 (ALDERLAKE_P)
[18:46:08] [PASSED] 0x46B2 (ALDERLAKE_P)
[18:46:08] [PASSED] 0x46B3 (ALDERLAKE_P)
[18:46:08] [PASSED] 0x46C0 (ALDERLAKE_P)
[18:46:08] [PASSED] 0x46C1 (ALDERLAKE_P)
[18:46:08] [PASSED] 0x46C2 (ALDERLAKE_P)
[18:46:08] [PASSED] 0x46C3 (ALDERLAKE_P)
[18:46:08] [PASSED] 0x46D0 (ALDERLAKE_N)
[18:46:08] [PASSED] 0x46D1 (ALDERLAKE_N)
[18:46:08] [PASSED] 0x46D2 (ALDERLAKE_N)
[18:46:08] [PASSED] 0x46D3 (ALDERLAKE_N)
[18:46:08] [PASSED] 0x46D4 (ALDERLAKE_N)
[18:46:08] [PASSED] 0xA721 (ALDERLAKE_P)
[18:46:08] [PASSED] 0xA7A1 (ALDERLAKE_P)
[18:46:08] [PASSED] 0xA7A9 (ALDERLAKE_P)
[18:46:08] [PASSED] 0xA7AC (ALDERLAKE_P)
[18:46:08] [PASSED] 0xA7AD (ALDERLAKE_P)
[18:46:08] [PASSED] 0xA720 (ALDERLAKE_P)
[18:46:08] [PASSED] 0xA7A0 (ALDERLAKE_P)
[18:46:08] [PASSED] 0xA7A8 (ALDERLAKE_P)
[18:46:08] [PASSED] 0xA7AA (ALDERLAKE_P)
[18:46:08] [PASSED] 0xA7AB (ALDERLAKE_P)
[18:46:08] [PASSED] 0xA780 (ALDERLAKE_S)
[18:46:08] [PASSED] 0xA781 (ALDERLAKE_S)
[18:46:08] [PASSED] 0xA782 (ALDERLAKE_S)
[18:46:08] [PASSED] 0xA783 (ALDERLAKE_S)
[18:46:08] [PASSED] 0xA788 (ALDERLAKE_S)
[18:46:08] [PASSED] 0xA789 (ALDERLAKE_S)
[18:46:08] [PASSED] 0xA78A (ALDERLAKE_S)
[18:46:08] [PASSED] 0xA78B (ALDERLAKE_S)
[18:46:08] [PASSED] 0x4905 (DG1)
[18:46:08] [PASSED] 0x4906 (DG1)
[18:46:08] [PASSED] 0x4907 (DG1)
[18:46:08] [PASSED] 0x4908 (DG1)
[18:46:08] [PASSED] 0x4909 (DG1)
[18:46:08] [PASSED] 0x56C0 (DG2)
[18:46:08] [PASSED] 0x56C2 (DG2)
[18:46:08] [PASSED] 0x56C1 (DG2)
[18:46:08] [PASSED] 0x7D51 (METEORLAKE)
[18:46:08] [PASSED] 0x7DD1 (METEORLAKE)
[18:46:08] [PASSED] 0x7D41 (METEORLAKE)
[18:46:08] [PASSED] 0x7D67 (METEORLAKE)
[18:46:08] [PASSED] 0xB640 (METEORLAKE)
[18:46:08] [PASSED] 0x56A0 (DG2)
[18:46:08] [PASSED] 0x56A1 (DG2)
[18:46:08] [PASSED] 0x56A2 (DG2)
[18:46:08] [PASSED] 0x56BE (DG2)
[18:46:08] [PASSED] 0x56BF (DG2)
[18:46:08] [PASSED] 0x5690 (DG2)
[18:46:08] [PASSED] 0x5691 (DG2)
[18:46:08] [PASSED] 0x5692 (DG2)
[18:46:08] [PASSED] 0x56A5 (DG2)
[18:46:08] [PASSED] 0x56A6 (DG2)
[18:46:08] [PASSED] 0x56B0 (DG2)
[18:46:08] [PASSED] 0x56B1 (DG2)
[18:46:08] [PASSED] 0x56BA (DG2)
[18:46:08] [PASSED] 0x56BB (DG2)
[18:46:08] [PASSED] 0x56BC (DG2)
[18:46:08] [PASSED] 0x56BD (DG2)
[18:46:08] [PASSED] 0x5693 (DG2)
[18:46:08] [PASSED] 0x5694 (DG2)
[18:46:08] [PASSED] 0x5695 (DG2)
[18:46:08] [PASSED] 0x56A3 (DG2)
[18:46:08] [PASSED] 0x56A4 (DG2)
[18:46:08] [PASSED] 0x56B2 (DG2)
[18:46:08] [PASSED] 0x56B3 (DG2)
[18:46:08] [PASSED] 0x5696 (DG2)
[18:46:08] [PASSED] 0x5697 (DG2)
[18:46:08] [PASSED] 0xB69 (PVC)
[18:46:08] [PASSED] 0xB6E (PVC)
[18:46:08] [PASSED] 0xBD4 (PVC)
[18:46:08] [PASSED] 0xBD5 (PVC)
[18:46:08] [PASSED] 0xBD6 (PVC)
[18:46:08] [PASSED] 0xBD7 (PVC)
[18:46:08] [PASSED] 0xBD8 (PVC)
[18:46:08] [PASSED] 0xBD9 (PVC)
[18:46:08] [PASSED] 0xBDA (PVC)
[18:46:08] [PASSED] 0xBDB (PVC)
[18:46:08] [PASSED] 0xBE0 (PVC)
[18:46:08] [PASSED] 0xBE1 (PVC)
[18:46:08] [PASSED] 0xBE5 (PVC)
[18:46:08] [PASSED] 0x7D40 (METEORLAKE)
[18:46:08] [PASSED] 0x7D45 (METEORLAKE)
[18:46:08] [PASSED] 0x7D55 (METEORLAKE)
[18:46:08] [PASSED] 0x7D60 (METEORLAKE)
[18:46:08] [PASSED] 0x7DD5 (METEORLAKE)
[18:46:08] [PASSED] 0x6420 (LUNARLAKE)
[18:46:08] [PASSED] 0x64A0 (LUNARLAKE)
[18:46:08] [PASSED] 0x64B0 (LUNARLAKE)
[18:46:08] [PASSED] 0xE202 (BATTLEMAGE)
[18:46:08] [PASSED] 0xE209 (BATTLEMAGE)
[18:46:08] [PASSED] 0xE20B (BATTLEMAGE)
[18:46:08] [PASSED] 0xE20C (BATTLEMAGE)
[18:46:08] [PASSED] 0xE20D (BATTLEMAGE)
[18:46:08] [PASSED] 0xE210 (BATTLEMAGE)
[18:46:08] [PASSED] 0xE211 (BATTLEMAGE)
[18:46:08] [PASSED] 0xE212 (BATTLEMAGE)
[18:46:08] [PASSED] 0xE216 (BATTLEMAGE)
[18:46:08] [PASSED] 0xE220 (BATTLEMAGE)
[18:46:08] [PASSED] 0xE221 (BATTLEMAGE)
[18:46:08] [PASSED] 0xE222 (BATTLEMAGE)
[18:46:08] [PASSED] 0xE223 (BATTLEMAGE)
[18:46:08] [PASSED] 0xB080 (PANTHERLAKE)
[18:46:08] [PASSED] 0xB081 (PANTHERLAKE)
[18:46:08] [PASSED] 0xB082 (PANTHERLAKE)
[18:46:08] [PASSED] 0xB083 (PANTHERLAKE)
[18:46:08] [PASSED] 0xB084 (PANTHERLAKE)
[18:46:08] [PASSED] 0xB085 (PANTHERLAKE)
[18:46:08] [PASSED] 0xB086 (PANTHERLAKE)
[18:46:08] [PASSED] 0xB087 (PANTHERLAKE)
[18:46:08] [PASSED] 0xB08F (PANTHERLAKE)
[18:46:08] [PASSED] 0xB090 (PANTHERLAKE)
[18:46:08] [PASSED] 0xB0A0 (PANTHERLAKE)
[18:46:08] [PASSED] 0xB0B0 (PANTHERLAKE)
[18:46:08] [PASSED] 0xFD80 (PANTHERLAKE)
[18:46:08] [PASSED] 0xFD81 (PANTHERLAKE)
[18:46:08] [PASSED] 0xD740 (NOVALAKE_S)
[18:46:08] [PASSED] 0xD741 (NOVALAKE_S)
[18:46:08] [PASSED] 0xD742 (NOVALAKE_S)
[18:46:08] [PASSED] 0xD743 (NOVALAKE_S)
[18:46:08] [PASSED] 0xD745 (NOVALAKE_S)
[18:46:08] [PASSED] 0xD74A (NOVALAKE_S)
[18:46:08] [PASSED] 0xD74B (NOVALAKE_S)
[18:46:08] [PASSED] 0x674C (CRESCENTISLAND)
[18:46:08] [PASSED] 0x674D (CRESCENTISLAND)
[18:46:08] [PASSED] 0x674E (CRESCENTISLAND)
[18:46:08] [PASSED] 0x674F (CRESCENTISLAND)
[18:46:08] [PASSED] 0x6750 (CRESCENTISLAND)
[18:46:08] [PASSED] 0xD750 (NOVALAKE_P)
[18:46:08] [PASSED] 0xD751 (NOVALAKE_P)
[18:46:08] [PASSED] 0xD752 (NOVALAKE_P)
[18:46:08] [PASSED] 0xD753 (NOVALAKE_P)
[18:46:08] [PASSED] 0xD754 (NOVALAKE_P)
[18:46:08] [PASSED] 0xD755 (NOVALAKE_P)
[18:46:08] [PASSED] 0xD756 (NOVALAKE_P)
[18:46:08] [PASSED] 0xD757 (NOVALAKE_P)
[18:46:08] [PASSED] 0xD75F (NOVALAKE_P)
[18:46:08] =============== [PASSED] check_platform_desc ===============
[18:46:08] ===================== [PASSED] xe_pci ======================
[18:46:08] ============= xe_rtp_tables_test (5 subtests) ==============
[18:46:08] ================== xe_rtp_table_gt_test  ===================
[18:46:08] [PASSED] gt_was/14011060649
[18:46:08] [PASSED] gt_was/14011059788
[18:46:08] [PASSED] gt_was/14015795083
[18:46:08] [PASSED] gt_was/16021867713
[18:46:08] [PASSED] gt_was/14019449301
[18:46:08] [PASSED] gt_was/16028005424
[18:46:08] [PASSED] gt_was/14026578760
[18:46:08] [PASSED] gt_was/1409420604
[18:46:08] [PASSED] gt_was/1408615072
[18:46:08] [PASSED] gt_was/22010523718
[18:46:08] [PASSED] gt_was/14011006942
[18:46:08] [PASSED] gt_was/14014830051
[18:46:08] [PASSED] gt_was/18018781329
[18:46:08] [PASSED] gt_was/1509235366
[18:46:08] [PASSED] gt_was/18018781329
[18:46:08] [PASSED] gt_was/16016694945
[18:46:08] [PASSED] gt_was/14018575942
[18:46:08] [PASSED] gt_was/22016670082
[18:46:08] [PASSED] gt_was/22016670082
[18:46:08] [PASSED] gt_was/14017421178
[18:46:08] [PASSED] gt_was/16025250150
[18:46:08] [PASSED] gt_was/14021871409
[18:46:08] [PASSED] gt_was/16021865536
[18:46:08] [PASSED] gt_was/14021486841
[18:46:08] [PASSED] gt_was/14025160223
[18:46:08] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[18:46:08] [PASSED] gt_was/14025635424
[18:46:08] [PASSED] gt_was/16028005424
[18:46:08] ============== [PASSED] xe_rtp_table_gt_test ===============
[18:46:08] ================== xe_rtp_table_gt_test  ===================
[18:46:08] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[18:46:08] [PASSED] gt_tunings/Tuning: 32B Access Enable
[18:46:08] [PASSED] gt_tunings/Tuning: L3 cache
[18:46:08] [PASSED] gt_tunings/Tuning: L3 cache - media
[18:46:08] [PASSED] gt_tunings/Tuning: Compression Overfetch
[18:46:08] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[18:46:08] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[18:46:08] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[18:46:08] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[18:46:08] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[18:46:08] [PASSED] gt_tunings/Tuning: Stateless compression control
[18:46:08] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[18:46:08] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[18:46:08] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[18:46:08] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[18:46:08] ============== [PASSED] xe_rtp_table_gt_test ===============
[18:46:08] ================== xe_rtp_table_oob_test  ==================
[18:46:08] [PASSED] oob_was/1607983814
[18:46:08] [PASSED] oob_was/16010904313
[18:46:08] [PASSED] oob_was/18022495364
[18:46:08] [PASSED] oob_was/22012773006
[18:46:08] [PASSED] oob_was/14014475959
[18:46:08] [PASSED] oob_was/22011391025
[18:46:08] [PASSED] oob_was/22012727170
[18:46:08] [PASSED] oob_was/22012727685
[18:46:08] [PASSED] oob_was/22016596838
[18:46:08] [PASSED] oob_was/18020744125
[18:46:08] [PASSED] oob_was/1409600907
[18:46:08] [PASSED] oob_was/22014953428
[18:46:08] [PASSED] oob_was/16017236439
[18:46:08] [PASSED] oob_was/14019821291
[18:46:08] [PASSED] oob_was/14015076503
[18:46:08] [PASSED] oob_was/14018913170
[18:46:08] [PASSED] oob_was/14018094691
[18:46:08] [PASSED] oob_was/18024947630
[18:46:08] [PASSED] oob_was/16022287689
[18:46:08] [PASSED] oob_was/13011645652
[18:46:08] [PASSED] oob_was/14022293748
[18:46:08] [PASSED] oob_was/22019794406
[18:46:08] [PASSED] oob_was/22019338487
[18:46:08] [PASSED] oob_was/16023588340
[18:46:08] [PASSED] oob_was/14019789679
[18:46:08] [PASSED] oob_was/14022866841
[18:46:08] [PASSED] oob_was/16021333562
[18:46:08] [PASSED] oob_was/14016712196
[18:46:08] [PASSED] oob_was/14015568240
[18:46:08] [PASSED] oob_was/18013179988
[18:46:08] [PASSED] oob_was/1508761755
[18:46:08] [PASSED] oob_was/16023105232
[18:46:08] [PASSED] oob_was/16026508708
[18:46:08] [PASSED] oob_was/14020001231
[18:46:08] [PASSED] oob_was/16023683509
[18:46:08] [PASSED] oob_was/14025515070
[18:46:08] [PASSED] oob_was/15015404425_disable
[18:46:08] [PASSED] oob_was/16026007364
[18:46:08] [PASSED] oob_was/14020316580
[18:46:08] [PASSED] oob_was/14025883347
[18:46:08] [PASSED] oob_was/16029380221
[18:46:08] [PASSED] oob_was/22022079272
[18:46:08] [PASSED] oob_was/16029897822
[18:46:08] [PASSED] oob_was/14027054324
[18:46:08] ============== [PASSED] xe_rtp_table_oob_test ==============
[18:46:08] ================ xe_rtp_table_dev_oob_test  ================
[18:46:08] [PASSED] device_oob_was/22010954014
[18:46:08] [PASSED] device_oob_was/15015404425
[18:46:08] [PASSED] device_oob_was/22019338487_display
[18:46:08] [PASSED] device_oob_was/14022085890
[18:46:08] [PASSED] device_oob_was/14026539277
[18:46:08] [PASSED] device_oob_was/14026633728
[18:46:08] [PASSED] device_oob_was/14026746987
[18:46:08] [PASSED] device_oob_was/14026779378
[18:46:08] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[18:46:08] ========== xe_rtp_table_missing_upper_bound_test  ==========
[18:46:08] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[18:46:08] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[18:46:08] [PASSED] register_whitelist/1806527549
[18:46:08] [PASSED] register_whitelist/allow_read_ctx_timestamp
[18:46:08] [PASSED] register_whitelist/allow_read_queue_timestamp
[18:46:08] [PASSED] register_whitelist/16014440446
[18:46:08] [PASSED] register_whitelist/16017236439
[18:46:08] [PASSED] register_whitelist/16020183090
[18:46:08] [PASSED] register_whitelist/14024997852
[18:46:08] [PASSED] register_whitelist/14024997852
[18:46:08] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[18:46:08] =============== [PASSED] xe_rtp_tables_test ================
[18:46:08] =================== xe_rtp (3 subtests) ====================
[18:46:08] =================== xe_rtp_rules_tests  ====================
[18:46:08] [PASSED] no
[18:46:08] [PASSED] yes
[18:46:08] [PASSED] no-and-no
[18:46:08] [PASSED] no-and-yes
[18:46:08] [PASSED] yes-and-no
[18:46:08] [PASSED] yes-and-yes
[18:46:08] [PASSED] no-or-no
[18:46:08] [PASSED] no-or-yes
[18:46:08] [PASSED] yes-or-no
[18:46:08] [PASSED] yes-or-yes
[18:46:08] [PASSED] no-yes-or-yes-no
[18:46:08] [PASSED] no-yes-or-yes-yes
[18:46:08] [PASSED] yes-yes-or-no-yes
[18:46:08] [PASSED] yes-yes-or-yes-yes
[18:46:08] [PASSED] no-no-or-yes-or-no
[18:46:08] [PASSED] or
[18:46:08] [PASSED] or-yes
[18:46:08] [PASSED] or-no
[18:46:08] [PASSED] yes-or
[18:46:08] [PASSED] no-or
[18:46:08] [PASSED] no-or-or-yes
[18:46:08] [PASSED] yes-or-or-no
[18:46:08] [PASSED] no-or-or-no
[18:46:08] [PASSED] missing-context-engine-class
[18:46:08] [PASSED] missing-context-engine-class-or-yes
[18:46:08] [PASSED] missing-context-engine-class-or-or-yes
[18:46:08] =============== [PASSED] xe_rtp_rules_tests ================
[18:46:08] =============== xe_rtp_process_to_sr_tests  ================
[18:46:08] [PASSED] coalesce-same-reg
[18:46:08] [PASSED] coalesce-same-reg-literal-and-func
[18:46:08] [PASSED] no-match-no-add
[18:46:08] [PASSED] two-regs-two-entries
[18:46:08] [PASSED] clr-one-set-other
[18:46:08] [PASSED] set-field
[18:46:08] [PASSED] conflict-duplicate
[18:46:08] [PASSED] conflict-not-disjoint
[18:46:08] [PASSED] conflict-not-disjoint-literal-and-func
[18:46:08] [PASSED] conflict-reg-type
[18:46:08] [PASSED] bad-mcr-reg-forced-to-regular
[18:46:08] [PASSED] bad-regular-reg-forced-to-mcr
[18:46:08] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[18:46:08] ================== xe_rtp_process_tests  ===================
[18:46:08] [PASSED] active1
[18:46:08] [PASSED] active2
[18:46:08] [PASSED] active-inactive
[18:46:08] [PASSED] inactive-active
[18:46:08] [PASSED] inactive-active-inactive
[18:46:08] [PASSED] inactive-inactive-inactive
[18:46:08] ============== [PASSED] xe_rtp_process_tests ===============
[18:46:08] ===================== [PASSED] xe_rtp ======================
[18:46:08] ==================== xe_wa (1 subtest) =====================
[18:46:08] ======================== xe_wa_gt  =========================
[18:46:08] [PASSED] TIGERLAKE B0
[18:46:08] [PASSED] DG1 A0
[18:46:08] [PASSED] DG1 B0
[18:46:08] [PASSED] ALDERLAKE_S A0
[18:46:08] [PASSED] ALDERLAKE_S B0
[18:46:08] [PASSED] ALDERLAKE_S C0
[18:46:08] [PASSED] ALDERLAKE_S D0
[18:46:08] [PASSED] ALDERLAKE_P A0
[18:46:08] [PASSED] ALDERLAKE_P B0
[18:46:08] [PASSED] ALDERLAKE_P C0
[18:46:08] [PASSED] ALDERLAKE_S RPLS D0
[18:46:08] [PASSED] ALDERLAKE_P RPLU E0
[18:46:08] [PASSED] DG2 G10 C0
[18:46:08] [PASSED] DG2 G11 B1
[18:46:08] [PASSED] DG2 G12 A1
[18:46:08] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[18:46:08] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[18:46:08] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[18:46:08] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[18:46:08] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[18:46:08] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[18:46:08] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[18:46:08] ==================== [PASSED] xe_wa_gt =====================
[18:46:08] ====================== [PASSED] xe_wa ======================
[18:46:08] ============================================================
[18:46:08] Testing complete. Ran 793 tests: passed: 765, skipped: 28
[18:46:08] Elapsed time: 36.190s total, 1.804s configuring, 33.670s building, 0.703s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[18:46:08] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:46:10] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[18:46:34] Starting KUnit Kernel (1/1)...
[18:46:34] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[18:46:34] ============= refcount_interrupt (4 subtests) ==============
[18:46:34] [PASSED] test_single_irq_change
[18:46:34] [PASSED] test_nested_irq_change
[18:46:34] [PASSED] test_multiple_irq_change
[18:46:34] [PASSED] test_irq_save
[18:46:34] =============== [PASSED] refcount_interrupt ================
[18:46:34] ============ drm_test_pick_cmdline (2 subtests) ============
[18:46:34] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[18:46:34] =============== drm_test_pick_cmdline_named  ===============
[18:46:34] [PASSED] NTSC
[18:46:34] [PASSED] NTSC-J
[18:46:34] [PASSED] PAL
[18:46:34] [PASSED] PAL-M
[18:46:34] =========== [PASSED] drm_test_pick_cmdline_named ===========
[18:46:34] ============== [PASSED] drm_test_pick_cmdline ==============
[18:46:34] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[18:46:34] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[18:46:34] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[18:46:34] =========== drm_validate_clone_mode (2 subtests) ===========
[18:46:34] ============== drm_test_check_in_clone_mode  ===============
[18:46:34] [PASSED] in_clone_mode
[18:46:34] [PASSED] not_in_clone_mode
[18:46:34] ========== [PASSED] drm_test_check_in_clone_mode ===========
[18:46:34] =============== drm_test_check_valid_clones  ===============
[18:46:34] [PASSED] not_in_clone_mode
[18:46:34] [PASSED] valid_clone
[18:46:34] [PASSED] invalid_clone
[18:46:34] =========== [PASSED] drm_test_check_valid_clones ===========
[18:46:34] ============= [PASSED] drm_validate_clone_mode =============
[18:46:34] ============= drm_validate_modeset (1 subtest) =============
[18:46:34] [PASSED] drm_test_check_connector_changed_modeset
[18:46:34] ============== [PASSED] drm_validate_modeset ===============
[18:46:34] ====== drm_test_bridge_get_current_state (1 subtest) =======
[18:46:34] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[18:46:34] ======== [PASSED] drm_test_bridge_get_current_state ========
[18:46:34] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[18:46:34] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[18:46:34] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[18:46:34] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[18:46:34] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[18:46:34] ============== drm_bridge_alloc (2 subtests) ===============
[18:46:34] [PASSED] drm_test_drm_bridge_alloc_basic
[18:46:34] [PASSED] drm_test_drm_bridge_alloc_get_put
[18:46:34] ================ [PASSED] drm_bridge_alloc =================
[18:46:34] ============= drm_bridge_bus_fmt (5 subtests) ==============
[18:46:34] [PASSED] drm_test_bridge_rgb_yuv_rgb
[18:46:34] [PASSED] drm_test_bridge_must_convert_to_yuv444
[18:46:34] [PASSED] drm_test_bridge_hdmi_auto_rgb
[18:46:34] [PASSED] drm_test_bridge_auto_first
[18:46:34] [PASSED] drm_test_bridge_rgb_yuv_no_path
[18:46:34] =============== [PASSED] drm_bridge_bus_fmt ================
[18:46:34] ============= drm_cmdline_parser (40 subtests) =============
[18:46:34] [PASSED] drm_test_cmdline_force_d_only
[18:46:34] [PASSED] drm_test_cmdline_force_D_only_dvi
[18:46:34] [PASSED] drm_test_cmdline_force_D_only_hdmi
[18:46:34] [PASSED] drm_test_cmdline_force_D_only_not_digital
[18:46:34] [PASSED] drm_test_cmdline_force_e_only
[18:46:34] [PASSED] drm_test_cmdline_res
[18:46:34] [PASSED] drm_test_cmdline_res_vesa
[18:46:34] [PASSED] drm_test_cmdline_res_vesa_rblank
[18:46:34] [PASSED] drm_test_cmdline_res_rblank
[18:46:34] [PASSED] drm_test_cmdline_res_bpp
[18:46:34] [PASSED] drm_test_cmdline_res_refresh
[18:46:34] [PASSED] drm_test_cmdline_res_bpp_refresh
[18:46:34] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[18:46:34] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[18:46:34] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[18:46:34] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[18:46:34] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[18:46:34] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[18:46:34] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[18:46:34] [PASSED] drm_test_cmdline_res_margins_force_on
[18:46:34] [PASSED] drm_test_cmdline_res_vesa_margins
[18:46:34] [PASSED] drm_test_cmdline_name
[18:46:34] [PASSED] drm_test_cmdline_name_bpp
[18:46:34] [PASSED] drm_test_cmdline_name_option
[18:46:34] [PASSED] drm_test_cmdline_name_bpp_option
[18:46:34] [PASSED] drm_test_cmdline_rotate_0
[18:46:34] [PASSED] drm_test_cmdline_rotate_90
[18:46:34] [PASSED] drm_test_cmdline_rotate_180
[18:46:34] [PASSED] drm_test_cmdline_rotate_270
[18:46:34] [PASSED] drm_test_cmdline_hmirror
[18:46:34] [PASSED] drm_test_cmdline_vmirror
[18:46:34] [PASSED] drm_test_cmdline_margin_options
[18:46:34] [PASSED] drm_test_cmdline_multiple_options
[18:46:34] [PASSED] drm_test_cmdline_bpp_extra_and_option
[18:46:34] [PASSED] drm_test_cmdline_extra_and_option
[18:46:34] [PASSED] drm_test_cmdline_freestanding_options
[18:46:34] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[18:46:34] [PASSED] drm_test_cmdline_panel_orientation
[18:46:35] ================ drm_test_cmdline_invalid  =================
[18:46:35] [PASSED] margin_only
[18:46:35] [PASSED] interlace_only
[18:46:35] [PASSED] res_missing_x
[18:46:35] [PASSED] res_missing_y
[18:46:35] [PASSED] res_bad_y
[18:46:35] [PASSED] res_missing_y_bpp
[18:46:35] [PASSED] res_bad_bpp
[18:46:35] [PASSED] res_bad_refresh
[18:46:35] [PASSED] res_bpp_refresh_force_on_off
[18:46:35] [PASSED] res_invalid_mode
[18:46:35] [PASSED] res_bpp_wrong_place_mode
[18:46:35] [PASSED] name_bpp_refresh
[18:46:35] [PASSED] name_refresh
[18:46:35] [PASSED] name_refresh_wrong_mode
[18:46:35] [PASSED] name_refresh_invalid_mode
[18:46:35] [PASSED] rotate_multiple
[18:46:35] [PASSED] rotate_invalid_val
[18:46:35] [PASSED] rotate_truncated
[18:46:35] [PASSED] invalid_option
[18:46:35] [PASSED] invalid_tv_option
[18:46:35] [PASSED] truncated_tv_option
[18:46:35] ============ [PASSED] drm_test_cmdline_invalid =============
[18:46:35] =============== drm_test_cmdline_tv_options  ===============
[18:46:35] [PASSED] NTSC
[18:46:35] [PASSED] NTSC_443
[18:46:35] [PASSED] NTSC_J
[18:46:35] [PASSED] PAL
[18:46:35] [PASSED] PAL_M
[18:46:35] [PASSED] PAL_N
[18:46:35] [PASSED] SECAM
[18:46:35] [PASSED] MONO_525
[18:46:35] [PASSED] MONO_625
[18:46:35] =========== [PASSED] drm_test_cmdline_tv_options ===========
[18:46:35] =============== [PASSED] drm_cmdline_parser ================
[18:46:35] ========== drmm_connector_hdmi_init (20 subtests) ==========
[18:46:35] [PASSED] drm_test_connector_hdmi_init_valid
[18:46:35] [PASSED] drm_test_connector_hdmi_init_bpc_8
[18:46:35] [PASSED] drm_test_connector_hdmi_init_bpc_10
[18:46:35] [PASSED] drm_test_connector_hdmi_init_bpc_12
[18:46:35] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[18:46:35] [PASSED] drm_test_connector_hdmi_init_bpc_null
[18:46:35] [PASSED] drm_test_connector_hdmi_init_formats_empty
[18:46:35] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[18:46:35] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[18:46:35] [PASSED] supported_formats=0x9 yuv420_allowed=1
[18:46:35] [PASSED] supported_formats=0x9 yuv420_allowed=0
[18:46:35] [PASSED] supported_formats=0x5 yuv420_allowed=1
[18:46:35] [PASSED] supported_formats=0x5 yuv420_allowed=0
[18:46:35] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[18:46:35] [PASSED] drm_test_connector_hdmi_init_null_ddc
[18:46:35] [PASSED] drm_test_connector_hdmi_init_null_product
[18:46:35] [PASSED] drm_test_connector_hdmi_init_null_vendor
[18:46:35] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[18:46:35] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[18:46:35] [PASSED] drm_test_connector_hdmi_init_product_valid
[18:46:35] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[18:46:35] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[18:46:35] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[18:46:35] ========= drm_test_connector_hdmi_init_type_valid  =========
[18:46:35] [PASSED] HDMI-A
[18:46:35] [PASSED] HDMI-B
[18:46:35] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[18:46:35] ======== drm_test_connector_hdmi_init_type_invalid  ========
[18:46:35] [PASSED] Unknown
[18:46:35] [PASSED] VGA
[18:46:35] [PASSED] DVI-I
[18:46:35] [PASSED] DVI-D
[18:46:35] [PASSED] DVI-A
[18:46:35] [PASSED] Composite
[18:46:35] [PASSED] SVIDEO
[18:46:35] [PASSED] LVDS
[18:46:35] [PASSED] Component
[18:46:35] [PASSED] DIN
[18:46:35] [PASSED] DP
[18:46:35] [PASSED] TV
[18:46:35] [PASSED] eDP
[18:46:35] [PASSED] Virtual
[18:46:35] [PASSED] DSI
[18:46:35] [PASSED] DPI
[18:46:35] [PASSED] Writeback
[18:46:35] [PASSED] SPI
[18:46:35] [PASSED] USB
[18:46:35] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[18:46:35] ============ [PASSED] drmm_connector_hdmi_init =============
[18:46:35] ============= drmm_connector_init (3 subtests) =============
[18:46:35] [PASSED] drm_test_drmm_connector_init
[18:46:35] [PASSED] drm_test_drmm_connector_init_null_ddc
[18:46:35] ========= drm_test_drmm_connector_init_type_valid  =========
[18:46:35] [PASSED] Unknown
[18:46:35] [PASSED] VGA
[18:46:35] [PASSED] DVI-I
[18:46:35] [PASSED] DVI-D
[18:46:35] [PASSED] DVI-A
[18:46:35] [PASSED] Composite
[18:46:35] [PASSED] SVIDEO
[18:46:35] [PASSED] LVDS
[18:46:35] [PASSED] Component
[18:46:35] [PASSED] DIN
[18:46:35] [PASSED] DP
[18:46:35] [PASSED] HDMI-A
[18:46:35] [PASSED] HDMI-B
[18:46:35] [PASSED] TV
[18:46:35] [PASSED] eDP
[18:46:35] [PASSED] Virtual
[18:46:35] [PASSED] DSI
[18:46:35] [PASSED] DPI
[18:46:35] [PASSED] Writeback
[18:46:35] [PASSED] SPI
[18:46:35] [PASSED] USB
[18:46:35] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[18:46:35] =============== [PASSED] drmm_connector_init ===============
[18:46:35] ========= drm_connector_dynamic_init (6 subtests) ==========
[18:46:35] [PASSED] drm_test_drm_connector_dynamic_init
[18:46:35] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[18:46:35] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[18:46:35] [PASSED] drm_test_drm_connector_dynamic_init_properties
[18:46:35] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[18:46:35] [PASSED] Unknown
[18:46:35] [PASSED] VGA
[18:46:35] [PASSED] DVI-I
[18:46:35] [PASSED] DVI-D
[18:46:35] [PASSED] DVI-A
[18:46:35] [PASSED] Composite
[18:46:35] [PASSED] SVIDEO
[18:46:35] [PASSED] LVDS
[18:46:35] [PASSED] Component
[18:46:35] [PASSED] DIN
[18:46:35] [PASSED] DP
[18:46:35] [PASSED] HDMI-A
[18:46:35] [PASSED] HDMI-B
[18:46:35] [PASSED] TV
[18:46:35] [PASSED] eDP
[18:46:35] [PASSED] Virtual
[18:46:35] [PASSED] DSI
[18:46:35] [PASSED] DPI
[18:46:35] [PASSED] Writeback
[18:46:35] [PASSED] SPI
[18:46:35] [PASSED] USB
[18:46:35] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[18:46:35] ======== drm_test_drm_connector_dynamic_init_name  =========
[18:46:35] [PASSED] Unknown
[18:46:35] [PASSED] VGA
[18:46:35] [PASSED] DVI-I
[18:46:35] [PASSED] DVI-D
[18:46:35] [PASSED] DVI-A
[18:46:35] [PASSED] Composite
[18:46:35] [PASSED] SVIDEO
[18:46:35] [PASSED] LVDS
[18:46:35] [PASSED] Component
[18:46:35] [PASSED] DIN
[18:46:35] [PASSED] DP
[18:46:35] [PASSED] HDMI-A
[18:46:35] [PASSED] HDMI-B
[18:46:35] [PASSED] TV
[18:46:35] [PASSED] eDP
[18:46:35] [PASSED] Virtual
[18:46:35] [PASSED] DSI
[18:46:35] [PASSED] DPI
[18:46:35] [PASSED] Writeback
[18:46:35] [PASSED] SPI
[18:46:35] [PASSED] USB
[18:46:35] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[18:46:35] =========== [PASSED] drm_connector_dynamic_init ============
[18:46:35] ==== drm_connector_dynamic_register_early (4 subtests) =====
[18:46:35] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[18:46:35] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[18:46:35] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[18:46:35] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[18:46:35] ====== [PASSED] drm_connector_dynamic_register_early =======
[18:46:35] ======= drm_connector_dynamic_register (7 subtests) ========
[18:46:35] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[18:46:35] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[18:46:35] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[18:46:35] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[18:46:35] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[18:46:35] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[18:46:35] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[18:46:35] ========= [PASSED] drm_connector_dynamic_register ==========
[18:46:35] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[18:46:35] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[18:46:35] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[18:46:35] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[18:46:35] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[18:46:35] ========== drm_test_get_tv_mode_from_name_valid  ===========
[18:46:35] [PASSED] NTSC
[18:46:35] [PASSED] NTSC-443
[18:46:35] [PASSED] NTSC-J
[18:46:35] [PASSED] PAL
[18:46:35] [PASSED] PAL-M
[18:46:35] [PASSED] PAL-N
[18:46:35] [PASSED] SECAM
[18:46:35] [PASSED] Mono
[18:46:35] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[18:46:35] [PASSED] drm_test_get_tv_mode_from_name_truncated
[18:46:35] ============ [PASSED] drm_get_tv_mode_from_name ============
[18:46:35] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[18:46:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[18:46:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[18:46:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[18:46:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[18:46:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[18:46:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[18:46:35] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[18:46:35] [PASSED] VIC 96
[18:46:35] [PASSED] VIC 97
[18:46:35] [PASSED] VIC 101
[18:46:35] [PASSED] VIC 102
[18:46:35] [PASSED] VIC 106
[18:46:35] [PASSED] VIC 107
[18:46:35] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[18:46:35] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[18:46:35] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[18:46:35] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[18:46:35] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[18:46:35] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[18:46:35] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[18:46:35] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[18:46:35] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[18:46:35] [PASSED] Automatic
[18:46:35] [PASSED] Full
[18:46:35] [PASSED] Limited 16:235
[18:46:35] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[18:46:35] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[18:46:35] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[18:46:35] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[18:46:35] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[18:46:35] [PASSED] RGB
[18:46:35] [PASSED] YUV 4:2:0
[18:46:35] [PASSED] YUV 4:2:2
[18:46:35] [PASSED] YUV 4:4:4
[18:46:35] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[18:46:35] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[18:46:35] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[18:46:35] ============= drm_damage_helper (21 subtests) ==============
[18:46:35] [PASSED] drm_test_damage_iter_no_damage
[18:46:35] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[18:46:35] [PASSED] drm_test_damage_iter_no_damage_src_moved
[18:46:35] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[18:46:35] [PASSED] drm_test_damage_iter_no_damage_not_visible
[18:46:35] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[18:46:35] [PASSED] drm_test_damage_iter_no_damage_no_fb
[18:46:35] [PASSED] drm_test_damage_iter_simple_damage
[18:46:35] [PASSED] drm_test_damage_iter_single_damage
[18:46:35] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[18:46:35] [PASSED] drm_test_damage_iter_single_damage_outside_src
[18:46:35] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[18:46:35] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[18:46:35] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[18:46:35] [PASSED] drm_test_damage_iter_single_damage_src_moved
[18:46:35] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[18:46:35] [PASSED] drm_test_damage_iter_damage
[18:46:35] [PASSED] drm_test_damage_iter_damage_one_intersect
[18:46:35] [PASSED] drm_test_damage_iter_damage_one_outside
[18:46:35] [PASSED] drm_test_damage_iter_damage_src_moved
[18:46:35] [PASSED] drm_test_damage_iter_damage_not_visible
[18:46:35] ================ [PASSED] drm_damage_helper ================
[18:46:35] ============== drm_dp_mst_helper (3 subtests) ==============
[18:46:35] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[18:46:35] [PASSED] Clock 154000 BPP 30 DSC disabled
[18:46:35] [PASSED] Clock 234000 BPP 30 DSC disabled
[18:46:35] [PASSED] Clock 297000 BPP 24 DSC disabled
[18:46:35] [PASSED] Clock 332880 BPP 24 DSC enabled
[18:46:35] [PASSED] Clock 324540 BPP 24 DSC enabled
[18:46:35] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[18:46:35] ============== drm_test_dp_mst_calc_pbn_div  ===============
[18:46:35] [PASSED] Link rate 2000000 lane count 4
[18:46:35] [PASSED] Link rate 2000000 lane count 2
[18:46:35] [PASSED] Link rate 2000000 lane count 1
[18:46:35] [PASSED] Link rate 1350000 lane count 4
[18:46:35] [PASSED] Link rate 1350000 lane count 2
[18:46:35] [PASSED] Link rate 1350000 lane count 1
[18:46:35] [PASSED] Link rate 1000000 lane count 4
[18:46:35] [PASSED] Link rate 1000000 lane count 2
[18:46:35] [PASSED] Link rate 1000000 lane count 1
[18:46:35] [PASSED] Link rate 810000 lane count 4
[18:46:35] [PASSED] Link rate 810000 lane count 2
[18:46:35] [PASSED] Link rate 810000 lane count 1
[18:46:35] [PASSED] Link rate 540000 lane count 4
[18:46:35] [PASSED] Link rate 540000 lane count 2
[18:46:35] [PASSED] Link rate 540000 lane count 1
[18:46:35] [PASSED] Link rate 270000 lane count 4
[18:46:35] [PASSED] Link rate 270000 lane count 2
[18:46:35] [PASSED] Link rate 270000 lane count 1
[18:46:35] [PASSED] Link rate 162000 lane count 4
[18:46:35] [PASSED] Link rate 162000 lane count 2
[18:46:35] [PASSED] Link rate 162000 lane count 1
[18:46:35] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[18:46:35] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[18:46:35] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[18:46:35] [PASSED] DP_POWER_UP_PHY with port number
[18:46:35] [PASSED] DP_POWER_DOWN_PHY with port number
[18:46:35] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[18:46:35] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[18:46:35] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[18:46:35] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[18:46:35] [PASSED] DP_QUERY_PAYLOAD with port number
[18:46:35] [PASSED] DP_QUERY_PAYLOAD with VCPI
[18:46:35] [PASSED] DP_REMOTE_DPCD_READ with port number
[18:46:35] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[18:46:35] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[18:46:35] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[18:46:35] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[18:46:35] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[18:46:35] [PASSED] DP_REMOTE_I2C_READ with port number
[18:46:35] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[18:46:35] [PASSED] DP_REMOTE_I2C_READ with transactions array
[18:46:35] [PASSED] DP_REMOTE_I2C_WRITE with port number
[18:46:35] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[18:46:35] [PASSED] DP_REMOTE_I2C_WRITE with data array
[18:46:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[18:46:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[18:46:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[18:46:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[18:46:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[18:46:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[18:46:35] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[18:46:35] ================ [PASSED] drm_dp_mst_helper ================
[18:46:35] ================== drm_exec (7 subtests) ===================
[18:46:35] [PASSED] sanitycheck
[18:46:35] [PASSED] test_lock
[18:46:35] [PASSED] test_lock_unlock
[18:46:35] [PASSED] test_duplicates
[18:46:35] [PASSED] test_prepare
[18:46:35] [PASSED] test_prepare_array
[18:46:35] [PASSED] test_multiple_loops
[18:46:35] ==================== [PASSED] drm_exec =====================
[18:46:35] =========== drm_format_helper_test (17 subtests) ===========
[18:46:35] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[18:46:35] [PASSED] single_pixel_source_buffer
[18:46:35] [PASSED] single_pixel_clip_rectangle
[18:46:35] [PASSED] well_known_colors
[18:46:35] [PASSED] destination_pitch
[18:46:35] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[18:46:35] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[18:46:35] [PASSED] single_pixel_source_buffer
[18:46:35] [PASSED] single_pixel_clip_rectangle
[18:46:35] [PASSED] well_known_colors
[18:46:35] [PASSED] destination_pitch
[18:46:35] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[18:46:35] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[18:46:35] [PASSED] single_pixel_source_buffer
[18:46:35] [PASSED] single_pixel_clip_rectangle
[18:46:35] [PASSED] well_known_colors
[18:46:35] [PASSED] destination_pitch
[18:46:35] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[18:46:35] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[18:46:35] [PASSED] single_pixel_source_buffer
[18:46:35] [PASSED] single_pixel_clip_rectangle
[18:46:35] [PASSED] well_known_colors
[18:46:35] [PASSED] destination_pitch
[18:46:35] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[18:46:35] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[18:46:35] [PASSED] single_pixel_source_buffer
[18:46:35] [PASSED] single_pixel_clip_rectangle
[18:46:35] [PASSED] well_known_colors
[18:46:35] [PASSED] destination_pitch
[18:46:35] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[18:46:35] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[18:46:35] [PASSED] single_pixel_source_buffer
[18:46:35] [PASSED] single_pixel_clip_rectangle
[18:46:35] [PASSED] well_known_colors
[18:46:35] [PASSED] destination_pitch
[18:46:35] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[18:46:35] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[18:46:35] [PASSED] single_pixel_source_buffer
[18:46:35] [PASSED] single_pixel_clip_rectangle
[18:46:35] [PASSED] well_known_colors
[18:46:35] [PASSED] destination_pitch
[18:46:35] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[18:46:35] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[18:46:35] [PASSED] single_pixel_source_buffer
[18:46:35] [PASSED] single_pixel_clip_rectangle
[18:46:35] [PASSED] well_known_colors
[18:46:35] [PASSED] destination_pitch
[18:46:35] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[18:46:35] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[18:46:35] [PASSED] single_pixel_source_buffer
[18:46:35] [PASSED] single_pixel_clip_rectangle
[18:46:35] [PASSED] well_known_colors
[18:46:35] [PASSED] destination_pitch
[18:46:35] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[18:46:35] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[18:46:35] [PASSED] single_pixel_source_buffer
[18:46:35] [PASSED] single_pixel_clip_rectangle
[18:46:35] [PASSED] well_known_colors
[18:46:35] [PASSED] destination_pitch
[18:46:35] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[18:46:35] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[18:46:35] [PASSED] single_pixel_source_buffer
[18:46:35] [PASSED] single_pixel_clip_rectangle
[18:46:35] [PASSED] well_known_colors
[18:46:35] [PASSED] destination_pitch
[18:46:35] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[18:46:35] ============== drm_test_fb_xrgb8888_to_mono  ===============
[18:46:35] [PASSED] single_pixel_source_buffer
[18:46:35] [PASSED] single_pixel_clip_rectangle
[18:46:35] [PASSED] well_known_colors
[18:46:35] [PASSED] destination_pitch
[18:46:35] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[18:46:35] ==================== drm_test_fb_swab  =====================
[18:46:35] [PASSED] single_pixel_source_buffer
[18:46:35] [PASSED] single_pixel_clip_rectangle
[18:46:35] [PASSED] well_known_colors
[18:46:35] [PASSED] destination_pitch
[18:46:35] ================ [PASSED] drm_test_fb_swab =================
[18:46:35] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[18:46:35] [PASSED] single_pixel_source_buffer
[18:46:35] [PASSED] single_pixel_clip_rectangle
[18:46:35] [PASSED] well_known_colors
[18:46:35] [PASSED] destination_pitch
[18:46:35] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[18:46:35] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[18:46:35] [PASSED] single_pixel_source_buffer
[18:46:35] [PASSED] single_pixel_clip_rectangle
[18:46:35] [PASSED] well_known_colors
[18:46:35] [PASSED] destination_pitch
[18:46:35] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[18:46:35] ================= drm_test_fb_clip_offset  =================
[18:46:35] [PASSED] pass through
[18:46:35] [PASSED] horizontal offset
[18:46:35] [PASSED] vertical offset
[18:46:35] [PASSED] horizontal and vertical offset
[18:46:35] [PASSED] horizontal offset (custom pitch)
[18:46:35] [PASSED] vertical offset (custom pitch)
[18:46:35] [PASSED] horizontal and vertical offset (custom pitch)
[18:46:35] ============= [PASSED] drm_test_fb_clip_offset =============
[18:46:35] =================== drm_test_fb_memcpy  ====================
[18:46:35] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[18:46:35] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[18:46:35] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[18:46:35] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[18:46:35] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[18:46:35] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[18:46:35] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[18:46:35] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[18:46:35] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[18:46:35] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[18:46:35] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[18:46:35] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[18:46:35] =============== [PASSED] drm_test_fb_memcpy ================
[18:46:35] ============= [PASSED] drm_format_helper_test ==============
[18:46:35] ================= drm_format (18 subtests) =================
[18:46:35] [PASSED] drm_test_format_block_width_invalid
[18:46:35] [PASSED] drm_test_format_block_width_one_plane
[18:46:35] [PASSED] drm_test_format_block_width_two_plane
[18:46:35] [PASSED] drm_test_format_block_width_three_plane
[18:46:35] [PASSED] drm_test_format_block_width_tiled
[18:46:35] [PASSED] drm_test_format_block_height_invalid
[18:46:35] [PASSED] drm_test_format_block_height_one_plane
[18:46:35] [PASSED] drm_test_format_block_height_two_plane
[18:46:35] [PASSED] drm_test_format_block_height_three_plane
[18:46:35] [PASSED] drm_test_format_block_height_tiled
[18:46:35] [PASSED] drm_test_format_min_pitch_invalid
[18:46:35] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[18:46:35] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[18:46:35] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[18:46:35] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[18:46:35] [PASSED] drm_test_format_min_pitch_two_plane
[18:46:35] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[18:46:35] [PASSED] drm_test_format_min_pitch_tiled
[18:46:35] =================== [PASSED] drm_format ====================
[18:46:35] ============== drm_framebuffer (10 subtests) ===============
[18:46:35] ========== drm_test_framebuffer_check_src_coords  ==========
[18:46:35] [PASSED] Success: source fits into fb
[18:46:35] [PASSED] Fail: overflowing fb with x-axis coordinate
[18:46:35] [PASSED] Fail: overflowing fb with y-axis coordinate
[18:46:35] [PASSED] Fail: overflowing fb with source width
[18:46:35] [PASSED] Fail: overflowing fb with source height
[18:46:35] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[18:46:35] [PASSED] drm_test_framebuffer_cleanup
[18:46:35] =============== drm_test_framebuffer_create  ===============
[18:46:35] [PASSED] ABGR8888 normal sizes
[18:46:35] [PASSED] ABGR8888 max sizes
[18:46:35] [PASSED] ABGR8888 pitch greater than min required
[18:46:35] [PASSED] ABGR8888 pitch less than min required
[18:46:35] [PASSED] ABGR8888 Invalid width
[18:46:35] [PASSED] ABGR8888 Invalid buffer handle
[18:46:35] [PASSED] No pixel format
[18:46:35] [PASSED] ABGR8888 Width 0
[18:46:35] [PASSED] ABGR8888 Height 0
[18:46:35] [PASSED] ABGR8888 Out of bound height * pitch combination
[18:46:35] [PASSED] ABGR8888 Large buffer offset
[18:46:35] [PASSED] ABGR8888 Buffer offset for inexistent plane
[18:46:35] [PASSED] ABGR8888 Invalid flag
[18:46:35] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[18:46:35] [PASSED] ABGR8888 Valid buffer modifier
[18:46:35] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[18:46:35] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[18:46:35] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[18:46:35] [PASSED] NV12 Normal sizes
[18:46:35] [PASSED] NV12 Max sizes
[18:46:35] [PASSED] NV12 Invalid pitch
[18:46:35] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[18:46:35] [PASSED] NV12 different  modifier per-plane
[18:46:35] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[18:46:35] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[18:46:35] [PASSED] NV12 Modifier for inexistent plane
[18:46:35] [PASSED] NV12 Handle for inexistent plane
[18:46:35] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[18:46:35] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[18:46:35] [PASSED] YVU420 Normal sizes
[18:46:35] [PASSED] YVU420 Max sizes
[18:46:35] [PASSED] YVU420 Invalid pitch
[18:46:35] [PASSED] YVU420 Different pitches
[18:46:35] [PASSED] YVU420 Different buffer offsets/pitches
[18:46:35] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[18:46:35] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[18:46:35] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[18:46:35] [PASSED] YVU420 Valid modifier
[18:46:35] [PASSED] YVU420 Different modifiers per plane
[18:46:35] [PASSED] YVU420 Modifier for inexistent plane
[18:46:35] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[18:46:35] [PASSED] X0L2 Normal sizes
[18:46:35] [PASSED] X0L2 Max sizes
[18:46:35] [PASSED] X0L2 Invalid pitch
[18:46:35] [PASSED] X0L2 Pitch greater than minimum required
[18:46:35] [PASSED] X0L2 Handle for inexistent plane
[18:46:35] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[18:46:35] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[18:46:35] [PASSED] X0L2 Valid modifier
[18:46:35] [PASSED] X0L2 Modifier for inexistent plane
[18:46:35] =========== [PASSED] drm_test_framebuffer_create ===========
[18:46:35] [PASSED] drm_test_framebuffer_free
[18:46:35] [PASSED] drm_test_framebuffer_init
[18:46:35] [PASSED] drm_test_framebuffer_init_bad_format
[18:46:35] [PASSED] drm_test_framebuffer_init_dev_mismatch
[18:46:35] [PASSED] drm_test_framebuffer_lookup
[18:46:35] [PASSED] drm_test_framebuffer_lookup_inexistent
[18:46:35] [PASSED] drm_test_framebuffer_modifiers_not_supported
[18:46:35] ================= [PASSED] drm_framebuffer =================
[18:46:35] ================ drm_gem_shmem (8 subtests) ================
[18:46:35] [PASSED] drm_gem_shmem_test_obj_create
[18:46:35] [PASSED] drm_gem_shmem_test_obj_create_private
[18:46:35] [PASSED] drm_gem_shmem_test_pin_pages
[18:46:35] [PASSED] drm_gem_shmem_test_vmap
[18:46:35] [PASSED] drm_gem_shmem_test_get_sg_table
[18:46:35] [PASSED] drm_gem_shmem_test_get_pages_sgt
[18:46:35] [PASSED] drm_gem_shmem_test_madvise
[18:46:35] [PASSED] drm_gem_shmem_test_purge
[18:46:35] ================== [PASSED] drm_gem_shmem ==================
[18:46:35] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[18:46:35] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[18:46:35] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[18:46:35] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[18:46:35] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[18:46:35] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[18:46:35] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[18:46:35] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[18:46:35] [PASSED] Automatic
[18:46:35] [PASSED] Full
[18:46:35] [PASSED] Limited 16:235
[18:46:35] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[18:46:35] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[18:46:35] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[18:46:35] [PASSED] drm_test_check_disable_connector
[18:46:35] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[18:46:35] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[18:46:35] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[18:46:35] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[18:46:35] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[18:46:35] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[18:46:35] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[18:46:35] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[18:46:35] [PASSED] drm_test_check_output_bpc_dvi
[18:46:35] [PASSED] drm_test_check_output_bpc_format_vic_1
[18:46:35] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[18:46:35] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[18:46:35] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[18:46:35] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[18:46:35] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[18:46:35] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[18:46:35] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[18:46:35] ============ drm_test_check_hdmi_color_format  =============
[18:46:35] [PASSED] AUTO -> RGB
[18:46:35] [PASSED] YCBCR422 -> YUV422
[18:46:35] [PASSED] YCBCR420 -> YUV420
[18:46:35] [PASSED] YCBCR444 -> YUV444
[18:46:35] [PASSED] RGB -> RGB
[18:46:35] ======== [PASSED] drm_test_check_hdmi_color_format =========
[18:46:35] ======== drm_test_check_hdmi_color_format_420_only  ========
[18:46:35] [PASSED] RGB should fail
[18:46:35] [PASSED] YUV444 should fail
[18:46:35] [PASSED] YUV422 should fail
[18:46:35] [PASSED] YUV420 should work
[18:46:35] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[18:46:35] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[18:46:35] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[18:46:35] [PASSED] drm_test_check_broadcast_rgb_value
[18:46:35] [PASSED] drm_test_check_bpc_8_value
[18:46:35] [PASSED] drm_test_check_bpc_10_value
[18:46:35] [PASSED] drm_test_check_bpc_12_value
[18:46:35] [PASSED] drm_test_check_format_value
[18:46:35] [PASSED] drm_test_check_tmds_char_value
[18:46:35] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[18:46:35] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[18:46:35] [PASSED] drm_test_check_mode_valid
[18:46:35] [PASSED] drm_test_check_mode_valid_reject
[18:46:35] [PASSED] drm_test_check_mode_valid_reject_rate
[18:46:35] [PASSED] drm_test_check_mode_valid_reject_max_clock
[18:46:35] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[18:46:35] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[18:46:35] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[18:46:35] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[18:46:35] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[18:46:35] [PASSED] drm_test_check_infoframes
[18:46:35] [PASSED] drm_test_check_reject_avi_infoframe
[18:46:35] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[18:46:35] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[18:46:35] [PASSED] drm_test_check_reject_audio_infoframe
[18:46:35] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[18:46:35] ================= drm_managed (2 subtests) =================
[18:46:35] [PASSED] drm_test_managed_release_action
[18:46:35] [PASSED] drm_test_managed_run_action
[18:46:35] =================== [PASSED] drm_managed ===================
[18:46:35] =================== drm_mm (6 subtests) ====================
[18:46:35] [PASSED] drm_test_mm_init
[18:46:35] [PASSED] drm_test_mm_debug
[18:46:35] [PASSED] drm_test_mm_align32
[18:46:35] [PASSED] drm_test_mm_align64
[18:46:35] [PASSED] drm_test_mm_lowest
[18:46:35] [PASSED] drm_test_mm_highest
[18:46:35] ===================== [PASSED] drm_mm ======================
[18:46:35] ============= drm_modes_analog_tv (5 subtests) =============
[18:46:35] [PASSED] drm_test_modes_analog_tv_mono_576i
[18:46:35] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[18:46:35] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[18:46:35] [PASSED] drm_test_modes_analog_tv_pal_576i
[18:46:35] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[18:46:35] =============== [PASSED] drm_modes_analog_tv ===============
[18:46:35] ============== drm_plane_helper (2 subtests) ===============
[18:46:35] =============== drm_test_check_plane_state  ================
[18:46:35] [PASSED] clipping_simple
[18:46:35] [PASSED] clipping_rotate_reflect
[18:46:35] [PASSED] positioning_simple
[18:46:35] [PASSED] upscaling
[18:46:35] [PASSED] downscaling
[18:46:35] [PASSED] rounding1
[18:46:35] [PASSED] rounding2
[18:46:35] [PASSED] rounding3
[18:46:35] [PASSED] rounding4
[18:46:35] =========== [PASSED] drm_test_check_plane_state ============
[18:46:35] =========== drm_test_check_invalid_plane_state  ============
[18:46:35] [PASSED] positioning_invalid
[18:46:35] [PASSED] upscaling_invalid
[18:46:35] [PASSED] downscaling_invalid
[18:46:35] ======= [PASSED] drm_test_check_invalid_plane_state ========
[18:46:35] ================ [PASSED] drm_plane_helper =================
[18:46:35] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[18:46:35] ====== drm_test_connector_helper_tv_get_modes_check  =======
[18:46:35] [PASSED] None
[18:46:35] [PASSED] PAL
[18:46:35] [PASSED] NTSC
[18:46:35] [PASSED] Both, NTSC Default
[18:46:35] [PASSED] Both, PAL Default
[18:46:35] [PASSED] Both, NTSC Default, with PAL on command-line
[18:46:35] [PASSED] Both, PAL Default, with NTSC on command-line
[18:46:35] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[18:46:35] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[18:46:35] ================== drm_rect (9 subtests) ===================
[18:46:35] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[18:46:35] [PASSED] drm_test_rect_clip_scaled_not_clipped
[18:46:35] [PASSED] drm_test_rect_clip_scaled_clipped
[18:46:35] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[18:46:35] ================= drm_test_rect_intersect  =================
[18:46:35] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[18:46:35] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[18:46:35] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[18:46:35] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[18:46:35] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[18:46:35] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[18:46:35] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[18:46:35] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[18:46:35] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[18:46:35] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[18:46:35] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[18:46:35] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[18:46:35] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[18:46:35] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[18:46:35] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[18:46:35] ============= [PASSED] drm_test_rect_intersect =============
[18:46:35] ================ drm_test_rect_calc_hscale  ================
[18:46:35] [PASSED] normal use
[18:46:35] [PASSED] out of max range
[18:46:35] [PASSED] out of min range
[18:46:35] [PASSED] zero dst
[18:46:35] [PASSED] negative src
[18:46:35] [PASSED] negative dst
[18:46:35] ============ [PASSED] drm_test_rect_calc_hscale ============
[18:46:35] ================ drm_test_rect_calc_vscale  ================
[18:46:35] [PASSED] normal use
[18:46:35] [PASSED] out of max range
[18:46:35] [PASSED] out of min range
[18:46:35] [PASSED] zero dst
[18:46:35] [PASSED] negative src
[18:46:35] [PASSED] negative dst
[18:46:35] ============ [PASSED] drm_test_rect_calc_vscale ============
[18:46:35] ================== drm_test_rect_rotate  ===================
[18:46:35] [PASSED] reflect-x
[18:46:35] [PASSED] reflect-y
[18:46:35] [PASSED] rotate-0
[18:46:35] [PASSED] rotate-90
[18:46:35] [PASSED] rotate-180
[18:46:35] [PASSED] rotate-270
[18:46:35] ============== [PASSED] drm_test_rect_rotate ===============
[18:46:35] ================ drm_test_rect_rotate_inv  =================
[18:46:35] [PASSED] reflect-x
[18:46:35] [PASSED] reflect-y
[18:46:35] [PASSED] rotate-0
[18:46:35] [PASSED] rotate-90
[18:46:35] [PASSED] rotate-180
[18:46:35] [PASSED] rotate-270
[18:46:35] ============ [PASSED] drm_test_rect_rotate_inv =============
[18:46:35] ==================== [PASSED] drm_rect =====================
[18:46:35] ============ drm_sysfb_modeset_test (1 subtest) ============
[18:46:35] ============ drm_test_sysfb_build_fourcc_list  =============
[18:46:35] [PASSED] no native formats
[18:46:35] [PASSED] XRGB8888 as native format
[18:46:35] [PASSED] remove duplicates
[18:46:35] [PASSED] convert alpha formats
[18:46:35] [PASSED] random formats
[18:46:35] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[18:46:35] ============= [PASSED] drm_sysfb_modeset_test ==============
[18:46:35] ================== drm_fixp (2 subtests) ===================
[18:46:35] [PASSED] drm_test_int2fixp
[18:46:35] [PASSED] drm_test_sm2fixp
[18:46:35] ==================== [PASSED] drm_fixp =====================
[18:46:35] ============================================================
[18:46:35] Testing complete. Ran 641 tests: passed: 641
[18:46:35] Elapsed time: 26.790s total, 1.820s configuring, 24.805s building, 0.138s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[18:46:35] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:46:37] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[18:46:47] Starting KUnit Kernel (1/1)...
[18:46:47] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[18:46:47] ============= refcount_interrupt (4 subtests) ==============
[18:46:47] [PASSED] test_single_irq_change
[18:46:47] [PASSED] test_nested_irq_change
[18:46:47] [PASSED] test_multiple_irq_change
[18:46:47] [PASSED] test_irq_save
[18:46:47] =============== [PASSED] refcount_interrupt ================
[18:46:47] ================= ttm_device (5 subtests) ==================
[18:46:47] [PASSED] ttm_device_init_basic
[18:46:47] [PASSED] ttm_device_init_multiple
[18:46:47] [PASSED] ttm_device_fini_basic
[18:46:47] [PASSED] ttm_device_init_no_vma_man
[18:46:47] ================== ttm_device_init_pools  ==================
[18:46:47] [PASSED] No DMA allocations, no DMA32 required
[18:46:47] [PASSED] DMA allocations, DMA32 required
[18:46:47] [PASSED] No DMA allocations, DMA32 required
[18:46:47] [PASSED] DMA allocations, no DMA32 required
[18:46:47] ============== [PASSED] ttm_device_init_pools ==============
[18:46:47] =================== [PASSED] ttm_device ====================
[18:46:47] ================== ttm_pool (8 subtests) ===================
[18:46:47] ================== ttm_pool_alloc_basic  ===================
[18:46:47] [PASSED] One page
[18:46:47] [PASSED] More than one page
[18:46:47] [PASSED] Above the allocation limit
[18:46:47] [PASSED] One page, with coherent DMA mappings enabled
[18:46:47] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[18:46:47] ============== [PASSED] ttm_pool_alloc_basic ===============
[18:46:47] ============== ttm_pool_alloc_basic_dma_addr  ==============
[18:46:47] [PASSED] One page
[18:46:47] [PASSED] More than one page
[18:46:47] [PASSED] Above the allocation limit
[18:46:47] [PASSED] One page, with coherent DMA mappings enabled
[18:46:47] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[18:46:47] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[18:46:47] [PASSED] ttm_pool_alloc_order_caching_match
[18:46:47] [PASSED] ttm_pool_alloc_caching_mismatch
[18:46:47] [PASSED] ttm_pool_alloc_order_mismatch
[18:46:47] [PASSED] ttm_pool_free_dma_alloc
[18:46:47] [PASSED] ttm_pool_free_no_dma_alloc
[18:46:47] [PASSED] ttm_pool_fini_basic
[18:46:47] ==================== [PASSED] ttm_pool =====================
[18:46:47] ================ ttm_resource (8 subtests) =================
[18:46:47] ================= ttm_resource_init_basic  =================
[18:46:47] [PASSED] Init resource in TTM_PL_SYSTEM
[18:46:47] [PASSED] Init resource in TTM_PL_VRAM
[18:46:47] [PASSED] Init resource in a private placement
[18:46:47] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[18:46:47] ============= [PASSED] ttm_resource_init_basic =============
[18:46:47] [PASSED] ttm_resource_init_pinned
[18:46:47] [PASSED] ttm_resource_fini_basic
[18:46:47] [PASSED] ttm_resource_manager_init_basic
[18:46:47] [PASSED] ttm_resource_manager_usage_basic
[18:46:47] [PASSED] ttm_resource_manager_set_used_basic
[18:46:47] [PASSED] ttm_sys_man_alloc_basic
[18:46:47] [PASSED] ttm_sys_man_free_basic
[18:46:47] ================== [PASSED] ttm_resource ===================
[18:46:47] =================== ttm_tt (15 subtests) ===================
[18:46:47] ==================== ttm_tt_init_basic  ====================
[18:46:47] [PASSED] Page-aligned size
[18:46:47] [PASSED] Extra pages requested
[18:46:47] ================ [PASSED] ttm_tt_init_basic ================
[18:46:47] [PASSED] ttm_tt_init_misaligned
[18:46:47] [PASSED] ttm_tt_fini_basic
[18:46:47] [PASSED] ttm_tt_fini_sg
[18:46:47] [PASSED] ttm_tt_fini_shmem
[18:46:47] [PASSED] ttm_tt_create_basic
[18:46:47] [PASSED] ttm_tt_create_invalid_bo_type
[18:46:47] [PASSED] ttm_tt_create_ttm_exists
[18:46:47] [PASSED] ttm_tt_create_failed
[18:46:47] [PASSED] ttm_tt_destroy_basic
[18:46:47] [PASSED] ttm_tt_populate_null_ttm
[18:46:47] [PASSED] ttm_tt_populate_populated_ttm
[18:46:47] [PASSED] ttm_tt_unpopulate_basic
[18:46:47] [PASSED] ttm_tt_unpopulate_empty_ttm
[18:46:47] [PASSED] ttm_tt_swapin_basic
[18:46:47] ===================== [PASSED] ttm_tt ======================
[18:46:47] =================== ttm_bo (14 subtests) ===================
[18:46:47] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[18:46:47] [PASSED] Cannot be interrupted and sleeps
[18:46:47] [PASSED] Cannot be interrupted, locks straight away
[18:46:47] [PASSED] Can be interrupted, sleeps
[18:46:47] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[18:46:47] [PASSED] ttm_bo_reserve_locked_no_sleep
[18:46:47] [PASSED] ttm_bo_reserve_no_wait_ticket
[18:46:47] [PASSED] ttm_bo_reserve_double_resv
[18:46:47] [PASSED] ttm_bo_reserve_interrupted
[18:46:47] [PASSED] ttm_bo_reserve_deadlock
[18:46:47] [PASSED] ttm_bo_unreserve_basic
[18:46:47] [PASSED] ttm_bo_unreserve_pinned
[18:46:47] [PASSED] ttm_bo_unreserve_bulk
[18:46:47] [PASSED] ttm_bo_fini_basic
[18:46:47] [PASSED] ttm_bo_fini_shared_resv
[18:46:47] [PASSED] ttm_bo_pin_basic
[18:46:47] [PASSED] ttm_bo_pin_unpin_resource
[18:46:47] [PASSED] ttm_bo_multiple_pin_one_unpin
[18:46:47] ===================== [PASSED] ttm_bo ======================
[18:46:47] ============== ttm_bo_validate (22 subtests) ===============
[18:46:47] ============== ttm_bo_init_reserved_sys_man  ===============
[18:46:47] [PASSED] Buffer object for userspace
[18:46:47] [PASSED] Kernel buffer object
[18:46:47] [PASSED] Shared buffer object
[18:46:47] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[18:46:47] ============== ttm_bo_init_reserved_mock_man  ==============
[18:46:47] [PASSED] Buffer object for userspace
[18:46:47] [PASSED] Kernel buffer object
[18:46:47] [PASSED] Shared buffer object
[18:46:47] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[18:46:47] [PASSED] ttm_bo_init_reserved_resv
[18:46:47] ================== ttm_bo_validate_basic  ==================
[18:46:47] [PASSED] Buffer object for userspace
[18:46:47] [PASSED] Kernel buffer object
[18:46:47] [PASSED] Shared buffer object
[18:46:47] ============== [PASSED] ttm_bo_validate_basic ==============
[18:46:47] [PASSED] ttm_bo_validate_invalid_placement
[18:46:47] ============= ttm_bo_validate_same_placement  ==============
[18:46:47] [PASSED] System manager
[18:46:47] [PASSED] VRAM manager
[18:46:47] ========= [PASSED] ttm_bo_validate_same_placement ==========
[18:46:47] [PASSED] ttm_bo_validate_failed_alloc
[18:46:47] [PASSED] ttm_bo_validate_pinned
[18:46:47] [PASSED] ttm_bo_validate_busy_placement
[18:46:47] ================ ttm_bo_validate_multihop  =================
[18:46:47] [PASSED] Buffer object for userspace
[18:46:47] [PASSED] Kernel buffer object
[18:46:47] [PASSED] Shared buffer object
[18:46:47] ============ [PASSED] ttm_bo_validate_multihop =============
[18:46:47] ========== ttm_bo_validate_no_placement_signaled  ==========
[18:46:47] [PASSED] Buffer object in system domain, no page vector
[18:46:47] [PASSED] Buffer object in system domain with an existing page vector
[18:46:47] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[18:46:47] ======== ttm_bo_validate_no_placement_not_signaled  ========
[18:46:47] [PASSED] Buffer object for userspace
[18:46:47] [PASSED] Kernel buffer object
[18:46:47] [PASSED] Shared buffer object
[18:46:47] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[18:46:47] [PASSED] ttm_bo_validate_move_fence_signaled
[18:46:47] ========= ttm_bo_validate_move_fence_not_signaled  =========
[18:46:47] [PASSED] Waits for GPU
[18:46:47] [PASSED] Tries to lock straight away
[18:46:47] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[18:46:47] [PASSED] ttm_bo_validate_swapout
[18:46:47] [PASSED] ttm_bo_validate_happy_evict
[18:46:47] [PASSED] ttm_bo_validate_all_pinned_evict
[18:46:47] [PASSED] ttm_bo_validate_allowed_only_evict
[18:46:47] [PASSED] ttm_bo_validate_deleted_evict
[18:46:47] [PASSED] ttm_bo_validate_busy_domain_evict
[18:46:47] [PASSED] ttm_bo_validate_evict_gutting
[18:46:47] [PASSED] ttm_bo_validate_recrusive_evict
[18:46:47] ================= [PASSED] ttm_bo_validate =================
[18:46:47] ============================================================
[18:46:47] Testing complete. Ran 106 tests: passed: 106
[18:46:47] Elapsed time: 11.997s total, 1.794s configuring, 9.988s building, 0.179s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/dma-buf/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[18:46:47] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:46:49] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[18:46:57] Starting KUnit Kernel (1/1)...
[18:46:57] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[18:46:57] ============= refcount_interrupt (4 subtests) ==============
[18:46:57] [PASSED] test_single_irq_change
[18:46:57] [PASSED] test_nested_irq_change
[18:46:57] [PASSED] test_multiple_irq_change
[18:46:57] [PASSED] test_irq_save
[18:46:57] =============== [PASSED] refcount_interrupt ================
[18:46:57] =============== dma-buf-fence (12 subtests) ================
[18:46:57] [PASSED] test_sanitycheck
[18:46:57] [PASSED] test_signaling
[18:46:57] [PASSED] test_add_callback
[18:46:57] [PASSED] test_late_add_callback
[18:46:57] [PASSED] test_rm_callback
[18:46:57] [PASSED] test_late_rm_callback
[18:46:57] [PASSED] test_status
[18:46:57] [PASSED] test_error
[18:46:57] [PASSED] test_wait
[18:46:57] [PASSED] test_wait_timeout
[18:46:57] [PASSED] test_stub
[18:46:57] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[18:46:57] ================== [PASSED] dma-buf-fence ==================
[18:46:57] ============ dma-buf-fence-chain (11 subtests) =============
[18:46:57] [PASSED] test_sanitycheck
[18:46:57] [PASSED] test_find_seqno
[18:46:57] [PASSED] test_find_signaled
[18:46:57] [PASSED] test_find_out_of_order
[18:47:03] [PASSED] test_find_gap
[18:47:03] [PASSED] test_find_race
[18:47:03] [PASSED] test_signal_forward
[18:47:03] [PASSED] test_signal_backward
[18:47:03] [PASSED] test_wait_forward
[18:47:03] [PASSED] test_wait_backward
[18:47:03] [PASSED] test_wait_random
[18:47:03] =============== [PASSED] dma-buf-fence-chain ===============
[18:47:03] ============ dma-buf-fence-unwrap (10 subtests) ============
[18:47:03] [PASSED] test_sanitycheck
[18:47:03] [PASSED] test_unwrap_array
[18:47:03] [PASSED] test_unwrap_chain
[18:47:03] [PASSED] test_unwrap_chain_array
[18:47:03] [PASSED] test_unwrap_merge
[18:47:03] [PASSED] test_unwrap_merge_duplicate
[18:47:03] [PASSED] test_unwrap_merge_seqno
[18:47:03] [PASSED] test_unwrap_merge_order
[18:47:03] [PASSED] test_unwrap_merge_complex
[18:47:03] [PASSED] test_unwrap_merge_complex_seqno
[18:47:03] ============== [PASSED] dma-buf-fence-unwrap ===============
[18:47:03] ================ dma-buf-resv (5 subtests) =================
[18:47:03] [PASSED] test_sanitycheck
[18:47:03] ===================== test_signaling  ======================
[18:47:03] [PASSED] kernel
[18:47:03] [PASSED] write
[18:47:03] [PASSED] read
[18:47:03] [PASSED] bookkeep
[18:47:03] ================= [PASSED] test_signaling ==================
[18:47:03] ====================== test_for_each  ======================
[18:47:03] [PASSED] kernel
[18:47:03] [PASSED] write
[18:47:03] [PASSED] read
[18:47:03] [PASSED] bookkeep
[18:47:03] ================== [PASSED] test_for_each ==================
[18:47:03] ================= test_for_each_unlocked  ==================
[18:47:03] [PASSED] kernel
[18:47:03] [PASSED] write
[18:47:03] [PASSED] read
[18:47:03] [PASSED] bookkeep
[18:47:03] ============= [PASSED] test_for_each_unlocked ==============
[18:47:03] ===================== test_get_fences  =====================
[18:47:03] [PASSED] kernel
[18:47:03] [PASSED] write
[18:47:03] [PASSED] read
[18:47:03] [PASSED] bookkeep
[18:47:03] ================= [PASSED] test_get_fences =================
[18:47:03] ================== [PASSED] dma-buf-resv ===================
[18:47:03] ============================================================
[18:47:03] Testing complete. Ran 54 tests: passed: 53, skipped: 1
[18:47:03] Elapsed time: 15.822s total, 1.803s configuring, 8.697s building, 5.283s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


