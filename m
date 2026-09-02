Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0710DC624D4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 16:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605B210F2BE;
	Wed,  2 Sep 2026 16:24:52 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD2C10F2BE;
 Wed,  2 Sep 2026 16:24:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Add_multi=5Fqueue=5F?=
 =?utf-8?q?active=5Flrca_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Sep 2026 16:24:51 -0000
Message-ID: <178836629130.112572.12350637836549095174@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260902145016.3351123-2-varun.gupta@intel.com>
In-Reply-To: <20260902145016.3351123-2-varun.gupta@intel.com>
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

Series: drm/xe: Add multi_queue_active_lrca debugfs
URL   : https://patchwork.freedesktop.org/series/173220/
State : success

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[16:22:49] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:22:53] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[16:23:13] Starting KUnit Kernel (1/1)...
[16:23:13] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[16:23:13] ============= refcount_interrupt (4 subtests) ==============
[16:23:13] [PASSED] test_single_irq_change
[16:23:13] [PASSED] test_nested_irq_change
[16:23:13] [PASSED] test_multiple_irq_change
[16:23:13] [PASSED] test_irq_save
[16:23:13] =============== [PASSED] refcount_interrupt ================
[16:23:13] ================= gpu_buddy (14 subtests) ==================
[16:23:13] [PASSED] gpu_test_buddy_alloc_limit
[16:23:13] [PASSED] gpu_test_buddy_alloc_optimistic
[16:23:13] [PASSED] gpu_test_buddy_alloc_pessimistic
[16:23:13] [PASSED] gpu_test_buddy_alloc_pathological
[16:23:13] [PASSED] gpu_test_buddy_alloc_contiguous
[16:23:13] [PASSED] gpu_test_buddy_alloc_clear
[16:23:13] [PASSED] gpu_test_buddy_alloc_range
[16:23:14] [PASSED] gpu_test_buddy_alloc_range_bias
[16:23:14] [PASSED] gpu_test_buddy_fragmentation_performance
[16:23:15] [PASSED] gpu_test_buddy_dirty_tracker_performance
[16:23:15] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[16:23:15] [PASSED] gpu_test_buddy_offset_aligned_allocation
[16:23:15] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[16:23:15] [PASSED] gpu_test_buddy_addr_to_block
[16:23:15] ==================== [PASSED] gpu_buddy ====================
[16:23:15] ============================================================
[16:23:15] Testing complete. Ran 18 tests: passed: 18
[16:23:15] Elapsed time: 26.527s total, 4.397s configuring, 20.212s building, 1.852s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[16:23:15] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:23:17] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[16:23:51] Starting KUnit Kernel (1/1)...
[16:23:51] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[16:23:51] ============= refcount_interrupt (4 subtests) ==============
[16:23:51] [PASSED] test_single_irq_change
[16:23:51] [PASSED] test_nested_irq_change
[16:23:51] [PASSED] test_multiple_irq_change
[16:23:51] [PASSED] test_irq_save
[16:23:51] =============== [PASSED] refcount_interrupt ================
[16:23:51] ================== guc_buf (11 subtests) ===================
[16:23:51] [PASSED] test_smallest
[16:23:51] [PASSED] test_largest
[16:23:51] [PASSED] test_granular
[16:23:51] [PASSED] test_unique
[16:23:51] [PASSED] test_overlap
[16:23:51] [PASSED] test_reusable
[16:23:51] [PASSED] test_too_big
[16:23:51] [PASSED] test_flush
[16:23:51] [PASSED] test_lookup
[16:23:51] [PASSED] test_data
[16:23:51] [PASSED] test_class
[16:23:51] ===================== [PASSED] guc_buf =====================
[16:23:51] =================== guc_dbm (7 subtests) ===================
[16:23:51] [PASSED] test_empty
[16:23:51] [PASSED] test_default
[16:23:51] ======================== test_size  ========================
[16:23:51] [PASSED] 4
[16:23:51] [PASSED] 8
[16:23:51] [PASSED] 32
[16:23:51] [PASSED] 256
[16:23:51] ==================== [PASSED] test_size ====================
[16:23:51] ======================= test_reuse  ========================
[16:23:51] [PASSED] 4
[16:23:51] [PASSED] 8
[16:23:51] [PASSED] 32
[16:23:51] [PASSED] 256
[16:23:51] =================== [PASSED] test_reuse ====================
[16:23:51] =================== test_range_overlap  ====================
[16:23:51] [PASSED] 4
[16:23:51] [PASSED] 8
[16:23:51] [PASSED] 32
[16:23:51] [PASSED] 256
[16:23:51] =============== [PASSED] test_range_overlap ================
[16:23:51] =================== test_range_compact  ====================
[16:23:51] [PASSED] 4
[16:23:51] [PASSED] 8
[16:23:51] [PASSED] 32
[16:23:51] [PASSED] 256
[16:23:51] =============== [PASSED] test_range_compact ================
[16:23:51] ==================== test_range_spare  =====================
[16:23:51] [PASSED] 4
[16:23:51] [PASSED] 8
[16:23:51] [PASSED] 32
[16:23:51] [PASSED] 256
[16:23:51] ================ [PASSED] test_range_spare =================
[16:23:51] ===================== [PASSED] guc_dbm =====================
[16:23:51] =================== guc_idm (6 subtests) ===================
[16:23:51] [PASSED] bad_init
[16:23:51] [PASSED] no_init
[16:23:51] [PASSED] init_fini
[16:23:51] [PASSED] check_used
[16:23:51] [PASSED] check_quota
[16:23:51] [PASSED] check_all
[16:23:51] ===================== [PASSED] guc_idm =====================
[16:23:51] =============== guc_klv_helpers (9 subtests) ===============
[16:23:51] [PASSED] test_count
[16:23:51] [PASSED] test_encode_u32
[16:23:51] [PASSED] test_encode_u64
[16:23:51] [PASSED] test_encode_string
[16:23:51] [PASSED] test_encode_object_raw
[16:23:51] [PASSED] test_encode_object_klv
[16:23:51] [PASSED] test_encode_object_nested
[16:23:51] [PASSED] test_encode_object_basic
[16:23:51] [PASSED] test_print
[16:23:51] ================= [PASSED] guc_klv_helpers =================
[16:23:51] =================== xe_log (4 subtests) ====================
[16:23:51] [PASSED] demo_cper
[16:23:51] [PASSED] demo_dmesg
[16:23:51] ======================= test_dmesg  ========================
[16:23:51] [PASSED] test_fatal
[16:23:51] [PASSED] test_fatal_tile
[16:23:51] [PASSED] test_fatal_gt
[16:23:51] [PASSED] test_fatal_comp
[16:23:51] [PASSED] test_fatal_comp_tile
[16:23:51] [PASSED] test_fatal_comp_gt
[16:23:51] [PASSED] test_fatal_all
[16:23:51] [PASSED] test_recoverable
[16:23:51] [PASSED] test_recoverable_tile
[16:23:51] [PASSED] test_recoverable_gt
[16:23:51] [PASSED] test_recoverable_comp
[16:23:51] [PASSED] test_recoverable_comp_tile
[16:23:51] [PASSED] test_recoverable_comp_gt
[16:23:51] [PASSED] test_recoverable_all
[16:23:51] [PASSED] test_info
[16:23:51] [PASSED] test_info_tile
[16:23:51] [PASSED] test_info_gt
[16:23:51] [PASSED] test_info_err
[16:23:51] [PASSED] test_info_comp
[16:23:51] [PASSED] test_info_comp_tile
[16:23:51] [PASSED] test_info_comp_gt
[16:23:51] [PASSED] test_info_all
[16:23:51] [PASSED] test_hw_fatal
[16:23:51] [PASSED] test_hw_recoverable
[16:23:51] [PASSED] test_hw_corrected
[16:23:51] [PASSED] test_hw_informational
[16:23:51] =================== [PASSED] test_dmesg ====================
[16:23:51] ====================== test_invalid  =======================
[16:23:51] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[16:23:51] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[16:23:51] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[16:23:51] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[16:23:51] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[16:23:51] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[16:23:51] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[16:23:51] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[16:23:51] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[16:23:51] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[16:23:51] ================== [SKIPPED] test_invalid ==================
[16:23:51] ===================== [PASSED] xe_log ======================
[16:23:51] ================== no_relay (3 subtests) ===================
[16:23:51] [PASSED] xe_drops_guc2pf_if_not_ready
[16:23:51] [PASSED] xe_drops_guc2vf_if_not_ready
[16:23:51] [PASSED] xe_rejects_send_if_not_ready
[16:23:51] ==================== [PASSED] no_relay =====================
[16:23:51] ================== pf_relay (14 subtests) ==================
[16:23:51] [PASSED] pf_rejects_guc2pf_too_short
[16:23:51] [PASSED] pf_rejects_guc2pf_too_long
[16:23:51] [PASSED] pf_rejects_guc2pf_no_payload
[16:23:51] [PASSED] pf_fails_no_payload
[16:23:51] [PASSED] pf_fails_bad_origin
[16:23:51] [PASSED] pf_fails_bad_type
[16:23:51] [PASSED] pf_txn_reports_error
[16:23:51] [PASSED] pf_txn_sends_pf2guc
[16:23:51] [PASSED] pf_sends_pf2guc
[16:23:51] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[16:23:51] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[16:23:51] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[16:23:51] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[16:23:51] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[16:23:51] ==================== [PASSED] pf_relay =====================
[16:23:51] ================== vf_relay (3 subtests) ===================
[16:23:51] [PASSED] vf_rejects_guc2vf_too_short
[16:23:51] [PASSED] vf_rejects_guc2vf_too_long
[16:23:51] [PASSED] vf_rejects_guc2vf_no_payload
[16:23:51] ==================== [PASSED] vf_relay =====================
[16:23:51] ================ pf_gt_config (9 subtests) =================
[16:23:51] [PASSED] fair_contexts_1vf
[16:23:51] [PASSED] fair_doorbells_1vf
[16:23:51] [PASSED] fair_ggtt_1vf
[16:23:51] ====================== fair_vram_1vf  ======================
[16:23:51] [PASSED] 3.50 GiB
[16:23:51] [PASSED] 11.5 GiB
[16:23:51] [PASSED] 15.5 GiB
[16:23:51] [PASSED] 31.5 GiB
[16:23:51] [PASSED] 63.5 GiB
[16:23:51] [PASSED] 1.91 GiB
[16:23:51] ================== [PASSED] fair_vram_1vf ==================
[16:23:51] ================ fair_vram_1vf_admin_only  =================
[16:23:51] [PASSED] 3.50 GiB
[16:23:51] [PASSED] 11.5 GiB
[16:23:51] [PASSED] 15.5 GiB
[16:23:51] [PASSED] 31.5 GiB
[16:23:51] [PASSED] 63.5 GiB
[16:23:51] [PASSED] 1.91 GiB
[16:23:51] ============ [PASSED] fair_vram_1vf_admin_only =============
[16:23:51] ====================== fair_contexts  ======================
[16:23:51] [PASSED] 1 VF
[16:23:51] [PASSED] 2 VFs
[16:23:51] [PASSED] 3 VFs
[16:23:51] [PASSED] 4 VFs
[16:23:51] [PASSED] 5 VFs
[16:23:51] [PASSED] 6 VFs
[16:23:51] [PASSED] 7 VFs
[16:23:51] [PASSED] 8 VFs
[16:23:51] [PASSED] 9 VFs
[16:23:51] [PASSED] 10 VFs
[16:23:51] [PASSED] 11 VFs
[16:23:51] [PASSED] 12 VFs
[16:23:51] [PASSED] 13 VFs
[16:23:51] [PASSED] 14 VFs
[16:23:51] [PASSED] 15 VFs
[16:23:51] [PASSED] 16 VFs
[16:23:51] [PASSED] 17 VFs
[16:23:51] [PASSED] 18 VFs
[16:23:51] [PASSED] 19 VFs
[16:23:51] [PASSED] 20 VFs
[16:23:51] [PASSED] 21 VFs
[16:23:51] [PASSED] 22 VFs
[16:23:51] [PASSED] 23 VFs
[16:23:51] [PASSED] 24 VFs
[16:23:51] [PASSED] 25 VFs
[16:23:51] [PASSED] 26 VFs
[16:23:51] [PASSED] 27 VFs
[16:23:51] [PASSED] 28 VFs
[16:23:51] [PASSED] 29 VFs
[16:23:51] [PASSED] 30 VFs
[16:23:51] [PASSED] 31 VFs
[16:23:51] [PASSED] 32 VFs
[16:23:51] [PASSED] 33 VFs
[16:23:51] [PASSED] 34 VFs
[16:23:51] [PASSED] 35 VFs
[16:23:51] [PASSED] 36 VFs
[16:23:51] [PASSED] 37 VFs
[16:23:51] [PASSED] 38 VFs
[16:23:51] [PASSED] 39 VFs
[16:23:51] [PASSED] 40 VFs
[16:23:51] [PASSED] 41 VFs
[16:23:51] [PASSED] 42 VFs
[16:23:51] [PASSED] 43 VFs
[16:23:51] [PASSED] 44 VFs
[16:23:51] [PASSED] 45 VFs
[16:23:51] [PASSED] 46 VFs
[16:23:51] [PASSED] 47 VFs
[16:23:51] [PASSED] 48 VFs
[16:23:51] [PASSED] 49 VFs
[16:23:51] [PASSED] 50 VFs
[16:23:51] [PASSED] 51 VFs
[16:23:51] [PASSED] 52 VFs
[16:23:51] [PASSED] 53 VFs
[16:23:51] [PASSED] 54 VFs
[16:23:51] [PASSED] 55 VFs
[16:23:51] [PASSED] 56 VFs
[16:23:51] [PASSED] 57 VFs
[16:23:51] [PASSED] 58 VFs
[16:23:51] [PASSED] 59 VFs
[16:23:51] [PASSED] 60 VFs
[16:23:51] [PASSED] 61 VFs
[16:23:51] [PASSED] 62 VFs
[16:23:51] [PASSED] 63 VFs
[16:23:51] ================== [PASSED] fair_contexts ==================
[16:23:51] ===================== fair_doorbells  ======================
[16:23:51] [PASSED] 1 VF
[16:23:51] [PASSED] 2 VFs
[16:23:51] [PASSED] 3 VFs
[16:23:51] [PASSED] 4 VFs
[16:23:51] [PASSED] 5 VFs
[16:23:51] [PASSED] 6 VFs
[16:23:51] [PASSED] 7 VFs
[16:23:51] [PASSED] 8 VFs
[16:23:51] [PASSED] 9 VFs
[16:23:51] [PASSED] 10 VFs
[16:23:51] [PASSED] 11 VFs
[16:23:51] [PASSED] 12 VFs
[16:23:51] [PASSED] 13 VFs
[16:23:51] [PASSED] 14 VFs
[16:23:52] [PASSED] 15 VFs
[16:23:52] [PASSED] 16 VFs
[16:23:52] [PASSED] 17 VFs
[16:23:52] [PASSED] 18 VFs
[16:23:52] [PASSED] 19 VFs
[16:23:52] [PASSED] 20 VFs
[16:23:52] [PASSED] 21 VFs
[16:23:52] [PASSED] 22 VFs
[16:23:52] [PASSED] 23 VFs
[16:23:52] [PASSED] 24 VFs
[16:23:52] [PASSED] 25 VFs
[16:23:52] [PASSED] 26 VFs
[16:23:52] [PASSED] 27 VFs
[16:23:52] [PASSED] 28 VFs
[16:23:52] [PASSED] 29 VFs
[16:23:52] [PASSED] 30 VFs
[16:23:52] [PASSED] 31 VFs
[16:23:52] [PASSED] 32 VFs
[16:23:52] [PASSED] 33 VFs
[16:23:52] [PASSED] 34 VFs
[16:23:52] [PASSED] 35 VFs
[16:23:52] [PASSED] 36 VFs
[16:23:52] [PASSED] 37 VFs
[16:23:52] [PASSED] 38 VFs
[16:23:52] [PASSED] 39 VFs
[16:23:52] [PASSED] 40 VFs
[16:23:52] [PASSED] 41 VFs
[16:23:52] [PASSED] 42 VFs
[16:23:52] [PASSED] 43 VFs
[16:23:52] [PASSED] 44 VFs
[16:23:52] [PASSED] 45 VFs
[16:23:52] [PASSED] 46 VFs
[16:23:52] [PASSED] 47 VFs
[16:23:52] [PASSED] 48 VFs
[16:23:52] [PASSED] 49 VFs
[16:23:52] [PASSED] 50 VFs
[16:23:52] [PASSED] 51 VFs
[16:23:52] [PASSED] 52 VFs
[16:23:52] [PASSED] 53 VFs
[16:23:52] [PASSED] 54 VFs
[16:23:52] [PASSED] 55 VFs
[16:23:52] [PASSED] 56 VFs
[16:23:52] [PASSED] 57 VFs
[16:23:52] [PASSED] 58 VFs
[16:23:52] [PASSED] 59 VFs
[16:23:52] [PASSED] 60 VFs
[16:23:52] [PASSED] 61 VFs
[16:23:52] [PASSED] 62 VFs
[16:23:52] [PASSED] 63 VFs
[16:23:52] ================= [PASSED] fair_doorbells ==================
[16:23:52] ======================== fair_ggtt  ========================
[16:23:52] [PASSED] 1 VF
[16:23:52] [PASSED] 2 VFs
[16:23:52] [PASSED] 3 VFs
[16:23:52] [PASSED] 4 VFs
[16:23:52] [PASSED] 5 VFs
[16:23:52] [PASSED] 6 VFs
[16:23:52] [PASSED] 7 VFs
[16:23:52] [PASSED] 8 VFs
[16:23:52] [PASSED] 9 VFs
[16:23:52] [PASSED] 10 VFs
[16:23:52] [PASSED] 11 VFs
[16:23:52] [PASSED] 12 VFs
[16:23:52] [PASSED] 13 VFs
[16:23:52] [PASSED] 14 VFs
[16:23:52] [PASSED] 15 VFs
[16:23:52] [PASSED] 16 VFs
[16:23:52] [PASSED] 17 VFs
[16:23:52] [PASSED] 18 VFs
[16:23:52] [PASSED] 19 VFs
[16:23:52] [PASSED] 20 VFs
[16:23:52] [PASSED] 21 VFs
[16:23:52] [PASSED] 22 VFs
[16:23:52] [PASSED] 23 VFs
[16:23:52] [PASSED] 24 VFs
[16:23:52] [PASSED] 25 VFs
[16:23:52] [PASSED] 26 VFs
[16:23:52] [PASSED] 27 VFs
[16:23:52] [PASSED] 28 VFs
[16:23:52] [PASSED] 29 VFs
[16:23:52] [PASSED] 30 VFs
[16:23:52] [PASSED] 31 VFs
[16:23:52] [PASSED] 32 VFs
[16:23:52] [PASSED] 33 VFs
[16:23:52] [PASSED] 34 VFs
[16:23:52] [PASSED] 35 VFs
[16:23:52] [PASSED] 36 VFs
[16:23:52] [PASSED] 37 VFs
[16:23:52] [PASSED] 38 VFs
[16:23:52] [PASSED] 39 VFs
[16:23:52] [PASSED] 40 VFs
[16:23:52] [PASSED] 41 VFs
[16:23:52] [PASSED] 42 VFs
[16:23:52] [PASSED] 43 VFs
[16:23:52] [PASSED] 44 VFs
[16:23:52] [PASSED] 45 VFs
[16:23:52] [PASSED] 46 VFs
[16:23:52] [PASSED] 47 VFs
[16:23:52] [PASSED] 48 VFs
[16:23:52] [PASSED] 49 VFs
[16:23:52] [PASSED] 50 VFs
[16:23:52] [PASSED] 51 VFs
[16:23:52] [PASSED] 52 VFs
[16:23:52] [PASSED] 53 VFs
[16:23:52] [PASSED] 54 VFs
[16:23:52] [PASSED] 55 VFs
[16:23:52] [PASSED] 56 VFs
[16:23:52] [PASSED] 57 VFs
[16:23:52] [PASSED] 58 VFs
[16:23:52] [PASSED] 59 VFs
[16:23:52] [PASSED] 60 VFs
[16:23:52] [PASSED] 61 VFs
[16:23:52] [PASSED] 62 VFs
[16:23:52] [PASSED] 63 VFs
[16:23:52] ==================== [PASSED] fair_ggtt ====================
[16:23:52] ======================== fair_vram  ========================
[16:23:52] [PASSED] 1 VF
[16:23:52] [PASSED] 2 VFs
[16:23:52] [PASSED] 3 VFs
[16:23:52] [PASSED] 4 VFs
[16:23:52] [PASSED] 5 VFs
[16:23:52] [PASSED] 6 VFs
[16:23:52] [PASSED] 7 VFs
[16:23:52] [PASSED] 8 VFs
[16:23:52] [PASSED] 9 VFs
[16:23:52] [PASSED] 10 VFs
[16:23:52] [PASSED] 11 VFs
[16:23:52] [PASSED] 12 VFs
[16:23:52] [PASSED] 13 VFs
[16:23:52] [PASSED] 14 VFs
[16:23:52] [PASSED] 15 VFs
[16:23:52] [PASSED] 16 VFs
[16:23:52] [PASSED] 17 VFs
[16:23:52] [PASSED] 18 VFs
[16:23:52] [PASSED] 19 VFs
[16:23:52] [PASSED] 20 VFs
[16:23:52] [PASSED] 21 VFs
[16:23:52] [PASSED] 22 VFs
[16:23:52] [PASSED] 23 VFs
[16:23:52] [PASSED] 24 VFs
[16:23:52] [PASSED] 25 VFs
[16:23:52] [PASSED] 26 VFs
[16:23:52] [PASSED] 27 VFs
[16:23:52] [PASSED] 28 VFs
[16:23:52] [PASSED] 29 VFs
[16:23:52] [PASSED] 30 VFs
[16:23:52] [PASSED] 31 VFs
[16:23:52] [PASSED] 32 VFs
[16:23:52] [PASSED] 33 VFs
[16:23:52] [PASSED] 34 VFs
[16:23:52] [PASSED] 35 VFs
[16:23:52] [PASSED] 36 VFs
[16:23:52] [PASSED] 37 VFs
[16:23:52] [PASSED] 38 VFs
[16:23:52] [PASSED] 39 VFs
[16:23:52] [PASSED] 40 VFs
[16:23:52] [PASSED] 41 VFs
[16:23:52] [PASSED] 42 VFs
[16:23:52] [PASSED] 43 VFs
[16:23:52] [PASSED] 44 VFs
[16:23:52] [PASSED] 45 VFs
[16:23:52] [PASSED] 46 VFs
[16:23:52] [PASSED] 47 VFs
[16:23:52] [PASSED] 48 VFs
[16:23:52] [PASSED] 49 VFs
[16:23:52] [PASSED] 50 VFs
[16:23:52] [PASSED] 51 VFs
[16:23:52] [PASSED] 52 VFs
[16:23:52] [PASSED] 53 VFs
[16:23:52] [PASSED] 54 VFs
[16:23:52] [PASSED] 55 VFs
[16:23:52] [PASSED] 56 VFs
[16:23:52] [PASSED] 57 VFs
[16:23:52] [PASSED] 58 VFs
[16:23:52] [PASSED] 59 VFs
[16:23:52] [PASSED] 60 VFs
[16:23:52] [PASSED] 61 VFs
[16:23:52] [PASSED] 62 VFs
[16:23:52] [PASSED] 63 VFs
[16:23:52] ==================== [PASSED] fair_vram ====================
[16:23:52] ================== [PASSED] pf_gt_config ===================
[16:23:52] ===================== lmtt (1 subtest) =====================
[16:23:52] ======================== test_ops  =========================
[16:23:52] [PASSED] 2-level
[16:23:52] [PASSED] multi-level
[16:23:52] ==================== [PASSED] test_ops =====================
[16:23:52] ====================== [PASSED] lmtt =======================
[16:23:52] ================= sriov_packet (1 subtest) =================
[16:23:52] [PASSED] test_descriptor_init
[16:23:52] ================== [PASSED] sriov_packet ===================
[16:23:52] ================= pf_service (11 subtests) =================
[16:23:52] [PASSED] pf_negotiate_any
[16:23:52] [PASSED] pf_negotiate_base_match
[16:23:52] [PASSED] pf_negotiate_base_newer
[16:23:52] [PASSED] pf_negotiate_base_next
[16:23:52] [SKIPPED] pf_negotiate_base_older (no older minor)
[16:23:52] [PASSED] pf_negotiate_base_prev
[16:23:52] [PASSED] pf_negotiate_latest_match
[16:23:52] [PASSED] pf_negotiate_latest_newer
[16:23:52] [PASSED] pf_negotiate_latest_next
[16:23:52] [SKIPPED] pf_negotiate_latest_older (no older minor)
[16:23:52] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[16:23:52] =================== [PASSED] pf_service ====================
[16:23:52] ================= xe_guc_g2g (2 subtests) ==================
[16:23:52] ============== xe_live_guc_g2g_kunit_default  ==============
[16:23:52] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[16:23:52] ============== xe_live_guc_g2g_kunit_allmem  ===============
[16:23:52] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[16:23:52] =================== [SKIPPED] xe_guc_g2g ===================
[16:23:52] =================== xe_mocs (2 subtests) ===================
[16:23:52] ================ xe_live_mocs_kernel_kunit  ================
[16:23:52] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[16:23:52] ================ xe_live_mocs_reset_kunit  =================
[16:23:52] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[16:23:52] ==================== [SKIPPED] xe_mocs =====================
[16:23:52] ================= xe_migrate (2 subtests) ==================
[16:23:52] ================= xe_migrate_sanity_kunit  =================
[16:23:52] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[16:23:52] ================== xe_validate_ccs_kunit  ==================
[16:23:52] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[16:23:52] =================== [SKIPPED] xe_migrate ===================
[16:23:52] ================== xe_dma_buf (1 subtest) ==================
[16:23:52] ==================== xe_dma_buf_kunit  =====================
[16:23:52] ================ [SKIPPED] xe_dma_buf_kunit ================
[16:23:52] =================== [SKIPPED] xe_dma_buf ===================
[16:23:52] ================= xe_bo_shrink (1 subtest) =================
[16:23:52] =================== xe_bo_shrink_kunit  ====================
[16:23:52] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[16:23:52] ================== [SKIPPED] xe_bo_shrink ==================
[16:23:52] ==================== xe_bo (2 subtests) ====================
[16:23:52] ================== xe_ccs_migrate_kunit  ===================
[16:23:52] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[16:23:52] ==================== xe_bo_evict_kunit  ====================
[16:23:52] =============== [SKIPPED] xe_bo_evict_kunit ================
[16:23:52] ===================== [SKIPPED] xe_bo ======================
[16:23:52] =================== xe_any (9 subtests) ====================
[16:23:52] [PASSED] test_to_xe
[16:23:52] [PASSED] test_to_dev
[16:23:52] [PASSED] test_to_pdev
[16:23:52] [PASSED] test_to_drm
[16:23:52] [PASSED] test_if_pdev
[16:23:52] [PASSED] test_if_xe
[16:23:52] [PASSED] test_if_tile
[16:23:52] [PASSED] test_if_gt
[16:23:52] [PASSED] test_to_id
[16:23:52] ===================== [PASSED] xe_any ======================
[16:23:52] ==================== args (13 subtests) ====================
[16:23:52] [PASSED] count_args_test
[16:23:52] [PASSED] call_args_example
[16:23:52] [PASSED] call_args_test
[16:23:52] [PASSED] drop_first_arg_example
[16:23:52] [PASSED] drop_first_arg_test
[16:23:52] [PASSED] first_arg_example
[16:23:52] [PASSED] first_arg_test
[16:23:52] [PASSED] last_arg_example
[16:23:52] [PASSED] last_arg_test
[16:23:52] [PASSED] pick_arg_example
[16:23:52] [PASSED] if_args_example
[16:23:52] [PASSED] if_args_test
[16:23:52] [PASSED] sep_comma_example
[16:23:52] ====================== [PASSED] args =======================
[16:23:52] =================== xe_pci (3 subtests) ====================
[16:23:52] ==================== check_graphics_ip  ====================
[16:23:52] [PASSED] 12.00 Xe_LP
[16:23:52] [PASSED] 12.10 Xe_LP+
[16:23:52] [PASSED] 12.55 Xe_HPG
[16:23:52] [PASSED] 12.60 Xe_HPC
[16:23:52] [PASSED] 12.70 Xe_LPG
[16:23:52] [PASSED] 12.71 Xe_LPG
[16:23:52] [PASSED] 12.74 Xe_LPG+
[16:23:52] [PASSED] 20.01 Xe2_HPG
[16:23:52] [PASSED] 20.02 Xe2_HPG
[16:23:52] [PASSED] 20.04 Xe2_LPG
[16:23:52] [PASSED] 30.00 Xe3_LPG
[16:23:52] [PASSED] 30.01 Xe3_LPG
[16:23:52] [PASSED] 30.03 Xe3_LPG
[16:23:52] [PASSED] 30.04 Xe3_LPG
[16:23:52] [PASSED] 30.05 Xe3_LPG
[16:23:52] [PASSED] 35.10 Xe3p_LPG
[16:23:52] [PASSED] 35.11 Xe3p_XPC
[16:23:52] ================ [PASSED] check_graphics_ip ================
[16:23:52] ===================== check_media_ip  ======================
[16:23:52] [PASSED] 12.00 Xe_M
[16:23:52] [PASSED] 12.55 Xe_HPM
[16:23:52] [PASSED] 13.00 Xe_LPM+
[16:23:52] [PASSED] 13.01 Xe2_HPM
[16:23:52] [PASSED] 20.00 Xe2_LPM
[16:23:52] [PASSED] 30.00 Xe3_LPM
[16:23:52] [PASSED] 30.02 Xe3_LPM
[16:23:52] [PASSED] 35.00 Xe3p_LPM
[16:23:52] [PASSED] 35.03 Xe3p_HPM
[16:23:52] ================= [PASSED] check_media_ip ==================
[16:23:52] =================== check_platform_desc  ===================
[16:23:52] [PASSED] 0x9A60 (TIGERLAKE)
[16:23:52] [PASSED] 0x9A68 (TIGERLAKE)
[16:23:52] [PASSED] 0x9A70 (TIGERLAKE)
[16:23:52] [PASSED] 0x9A40 (TIGERLAKE)
[16:23:52] [PASSED] 0x9A49 (TIGERLAKE)
[16:23:52] [PASSED] 0x9A59 (TIGERLAKE)
[16:23:52] [PASSED] 0x9A78 (TIGERLAKE)
[16:23:52] [PASSED] 0x9AC0 (TIGERLAKE)
[16:23:52] [PASSED] 0x9AC9 (TIGERLAKE)
[16:23:52] [PASSED] 0x9AD9 (TIGERLAKE)
[16:23:52] [PASSED] 0x9AF8 (TIGERLAKE)
[16:23:52] [PASSED] 0x4C80 (ROCKETLAKE)
[16:23:52] [PASSED] 0x4C8A (ROCKETLAKE)
[16:23:52] [PASSED] 0x4C8B (ROCKETLAKE)
[16:23:52] [PASSED] 0x4C8C (ROCKETLAKE)
[16:23:52] [PASSED] 0x4C90 (ROCKETLAKE)
[16:23:52] [PASSED] 0x4C9A (ROCKETLAKE)
[16:23:52] [PASSED] 0x4680 (ALDERLAKE_S)
[16:23:52] [PASSED] 0x4682 (ALDERLAKE_S)
[16:23:52] [PASSED] 0x4688 (ALDERLAKE_S)
[16:23:52] [PASSED] 0x468A (ALDERLAKE_S)
[16:23:52] [PASSED] 0x468B (ALDERLAKE_S)
[16:23:52] [PASSED] 0x4690 (ALDERLAKE_S)
[16:23:52] [PASSED] 0x4692 (ALDERLAKE_S)
[16:23:52] [PASSED] 0x4693 (ALDERLAKE_S)
[16:23:52] [PASSED] 0x46A0 (ALDERLAKE_P)
[16:23:52] [PASSED] 0x46A1 (ALDERLAKE_P)
[16:23:52] [PASSED] 0x46A2 (ALDERLAKE_P)
[16:23:52] [PASSED] 0x46A3 (ALDERLAKE_P)
[16:23:52] [PASSED] 0x46A6 (ALDERLAKE_P)
[16:23:52] [PASSED] 0x46A8 (ALDERLAKE_P)
[16:23:52] [PASSED] 0x46AA (ALDERLAKE_P)
[16:23:52] [PASSED] 0x462A (ALDERLAKE_P)
[16:23:52] [PASSED] 0x4626 (ALDERLAKE_P)
[16:23:52] [PASSED] 0x4628 (ALDERLAKE_P)
[16:23:52] [PASSED] 0x46B0 (ALDERLAKE_P)
[16:23:52] [PASSED] 0x46B1 (ALDERLAKE_P)
[16:23:52] [PASSED] 0x46B2 (ALDERLAKE_P)
[16:23:52] [PASSED] 0x46B3 (ALDERLAKE_P)
[16:23:52] [PASSED] 0x46C0 (ALDERLAKE_P)
[16:23:52] [PASSED] 0x46C1 (ALDERLAKE_P)
[16:23:52] [PASSED] 0x46C2 (ALDERLAKE_P)
[16:23:52] [PASSED] 0x46C3 (ALDERLAKE_P)
[16:23:52] [PASSED] 0x46D0 (ALDERLAKE_N)
[16:23:52] [PASSED] 0x46D1 (ALDERLAKE_N)
[16:23:52] [PASSED] 0x46D2 (ALDERLAKE_N)
[16:23:52] [PASSED] 0x46D3 (ALDERLAKE_N)
[16:23:52] [PASSED] 0x46D4 (ALDERLAKE_N)
[16:23:52] [PASSED] 0xA721 (ALDERLAKE_P)
[16:23:52] [PASSED] 0xA7A1 (ALDERLAKE_P)
[16:23:52] [PASSED] 0xA7A9 (ALDERLAKE_P)
[16:23:52] [PASSED] 0xA7AC (ALDERLAKE_P)
[16:23:52] [PASSED] 0xA7AD (ALDERLAKE_P)
[16:23:52] [PASSED] 0xA720 (ALDERLAKE_P)
[16:23:52] [PASSED] 0xA7A0 (ALDERLAKE_P)
[16:23:52] [PASSED] 0xA7A8 (ALDERLAKE_P)
[16:23:52] [PASSED] 0xA7AA (ALDERLAKE_P)
[16:23:52] [PASSED] 0xA7AB (ALDERLAKE_P)
[16:23:52] [PASSED] 0xA780 (ALDERLAKE_S)
[16:23:52] [PASSED] 0xA781 (ALDERLAKE_S)
[16:23:52] [PASSED] 0xA782 (ALDERLAKE_S)
[16:23:52] [PASSED] 0xA783 (ALDERLAKE_S)
[16:23:52] [PASSED] 0xA788 (ALDERLAKE_S)
[16:23:52] [PASSED] 0xA789 (ALDERLAKE_S)
[16:23:52] [PASSED] 0xA78A (ALDERLAKE_S)
[16:23:52] [PASSED] 0xA78B (ALDERLAKE_S)
[16:23:52] [PASSED] 0x4905 (DG1)
[16:23:52] [PASSED] 0x4906 (DG1)
[16:23:52] [PASSED] 0x4907 (DG1)
[16:23:52] [PASSED] 0x4908 (DG1)
[16:23:52] [PASSED] 0x4909 (DG1)
[16:23:52] [PASSED] 0x56C0 (DG2)
[16:23:52] [PASSED] 0x56C2 (DG2)
[16:23:52] [PASSED] 0x56C1 (DG2)
[16:23:52] [PASSED] 0x7D51 (METEORLAKE)
[16:23:52] [PASSED] 0x7DD1 (METEORLAKE)
[16:23:52] [PASSED] 0x7D41 (METEORLAKE)
[16:23:52] [PASSED] 0x7D67 (METEORLAKE)
[16:23:52] [PASSED] 0xB640 (METEORLAKE)
[16:23:52] [PASSED] 0x56A0 (DG2)
[16:23:52] [PASSED] 0x56A1 (DG2)
[16:23:52] [PASSED] 0x56A2 (DG2)
[16:23:52] [PASSED] 0x56BE (DG2)
[16:23:52] [PASSED] 0x56BF (DG2)
[16:23:52] [PASSED] 0x5690 (DG2)
[16:23:52] [PASSED] 0x5691 (DG2)
[16:23:52] [PASSED] 0x5692 (DG2)
[16:23:52] [PASSED] 0x56A5 (DG2)
[16:23:52] [PASSED] 0x56A6 (DG2)
[16:23:52] [PASSED] 0x56B0 (DG2)
[16:23:52] [PASSED] 0x56B1 (DG2)
[16:23:52] [PASSED] 0x56BA (DG2)
[16:23:52] [PASSED] 0x56BB (DG2)
[16:23:52] [PASSED] 0x56BC (DG2)
[16:23:52] [PASSED] 0x56BD (DG2)
[16:23:52] [PASSED] 0x5693 (DG2)
[16:23:52] [PASSED] 0x5694 (DG2)
[16:23:52] [PASSED] 0x5695 (DG2)
[16:23:52] [PASSED] 0x56A3 (DG2)
[16:23:52] [PASSED] 0x56A4 (DG2)
[16:23:52] [PASSED] 0x56B2 (DG2)
[16:23:52] [PASSED] 0x56B3 (DG2)
[16:23:52] [PASSED] 0x5696 (DG2)
[16:23:52] [PASSED] 0x5697 (DG2)
[16:23:52] [PASSED] 0xB69 (PVC)
[16:23:52] [PASSED] 0xB6E (PVC)
[16:23:52] [PASSED] 0xBD4 (PVC)
[16:23:52] [PASSED] 0xBD5 (PVC)
[16:23:52] [PASSED] 0xBD6 (PVC)
[16:23:52] [PASSED] 0xBD7 (PVC)
[16:23:52] [PASSED] 0xBD8 (PVC)
[16:23:52] [PASSED] 0xBD9 (PVC)
[16:23:52] [PASSED] 0xBDA (PVC)
[16:23:52] [PASSED] 0xBDB (PVC)
[16:23:52] [PASSED] 0xBE0 (PVC)
[16:23:52] [PASSED] 0xBE1 (PVC)
[16:23:52] [PASSED] 0xBE5 (PVC)
[16:23:52] [PASSED] 0x7D40 (METEORLAKE)
[16:23:52] [PASSED] 0x7D45 (METEORLAKE)
[16:23:52] [PASSED] 0x7D55 (METEORLAKE)
[16:23:52] [PASSED] 0x7D60 (METEORLAKE)
[16:23:52] [PASSED] 0x7DD5 (METEORLAKE)
[16:23:52] [PASSED] 0x6420 (LUNARLAKE)
[16:23:52] [PASSED] 0x64A0 (LUNARLAKE)
[16:23:52] [PASSED] 0x64B0 (LUNARLAKE)
[16:23:52] [PASSED] 0xE202 (BATTLEMAGE)
[16:23:52] [PASSED] 0xE209 (BATTLEMAGE)
[16:23:52] [PASSED] 0xE20B (BATTLEMAGE)
[16:23:52] [PASSED] 0xE20C (BATTLEMAGE)
[16:23:52] [PASSED] 0xE20D (BATTLEMAGE)
[16:23:52] [PASSED] 0xE210 (BATTLEMAGE)
[16:23:52] [PASSED] 0xE211 (BATTLEMAGE)
[16:23:52] [PASSED] 0xE212 (BATTLEMAGE)
[16:23:52] [PASSED] 0xE216 (BATTLEMAGE)
[16:23:52] [PASSED] 0xE220 (BATTLEMAGE)
[16:23:52] [PASSED] 0xE221 (BATTLEMAGE)
[16:23:52] [PASSED] 0xE222 (BATTLEMAGE)
[16:23:52] [PASSED] 0xE223 (BATTLEMAGE)
[16:23:52] [PASSED] 0xB080 (PANTHERLAKE)
[16:23:52] [PASSED] 0xB081 (PANTHERLAKE)
[16:23:52] [PASSED] 0xB082 (PANTHERLAKE)
[16:23:52] [PASSED] 0xB083 (PANTHERLAKE)
[16:23:52] [PASSED] 0xB084 (PANTHERLAKE)
[16:23:52] [PASSED] 0xB085 (PANTHERLAKE)
[16:23:52] [PASSED] 0xB086 (PANTHERLAKE)
[16:23:52] [PASSED] 0xB087 (PANTHERLAKE)
[16:23:52] [PASSED] 0xB08F (PANTHERLAKE)
[16:23:52] [PASSED] 0xB090 (PANTHERLAKE)
[16:23:52] [PASSED] 0xB0A0 (PANTHERLAKE)
[16:23:52] [PASSED] 0xB0B0 (PANTHERLAKE)
[16:23:52] [PASSED] 0xFD80 (PANTHERLAKE)
[16:23:52] [PASSED] 0xFD81 (PANTHERLAKE)
[16:23:52] [PASSED] 0xD740 (NOVALAKE_S)
[16:23:52] [PASSED] 0xD741 (NOVALAKE_S)
[16:23:52] [PASSED] 0xD742 (NOVALAKE_S)
[16:23:52] [PASSED] 0xD743 (NOVALAKE_S)
[16:23:52] [PASSED] 0xD745 (NOVALAKE_S)
[16:23:52] [PASSED] 0xD74A (NOVALAKE_S)
[16:23:52] [PASSED] 0xD74B (NOVALAKE_S)
[16:23:52] [PASSED] 0x674C (CRESCENTISLAND)
[16:23:52] [PASSED] 0x674D (CRESCENTISLAND)
[16:23:52] [PASSED] 0x674E (CRESCENTISLAND)
[16:23:52] [PASSED] 0x674F (CRESCENTISLAND)
[16:23:52] [PASSED] 0x6750 (CRESCENTISLAND)
[16:23:52] [PASSED] 0xD750 (NOVALAKE_P)
[16:23:52] [PASSED] 0xD751 (NOVALAKE_P)
[16:23:52] [PASSED] 0xD752 (NOVALAKE_P)
[16:23:52] [PASSED] 0xD753 (NOVALAKE_P)
[16:23:52] [PASSED] 0xD754 (NOVALAKE_P)
[16:23:52] [PASSED] 0xD755 (NOVALAKE_P)
[16:23:52] [PASSED] 0xD756 (NOVALAKE_P)
[16:23:52] [PASSED] 0xD757 (NOVALAKE_P)
[16:23:52] [PASSED] 0xD75F (NOVALAKE_P)
[16:23:52] =============== [PASSED] check_platform_desc ===============
[16:23:52] ===================== [PASSED] xe_pci ======================
[16:23:52] ============= xe_rtp_tables_test (5 subtests) ==============
[16:23:52] ================== xe_rtp_table_gt_test  ===================
[16:23:52] [PASSED] gt_was/14011060649
[16:23:52] [PASSED] gt_was/14011059788
[16:23:52] [PASSED] gt_was/14015795083
[16:23:52] [PASSED] gt_was/16021867713
[16:23:52] [PASSED] gt_was/14019449301
[16:23:52] [PASSED] gt_was/16028005424
[16:23:52] [PASSED] gt_was/14026578760
[16:23:52] [PASSED] gt_was/1409420604
[16:23:52] [PASSED] gt_was/1408615072
[16:23:52] [PASSED] gt_was/22010523718
[16:23:52] [PASSED] gt_was/14011006942
[16:23:52] [PASSED] gt_was/14014830051
[16:23:52] [PASSED] gt_was/18018781329
[16:23:52] [PASSED] gt_was/1509235366
[16:23:52] [PASSED] gt_was/18018781329
[16:23:52] [PASSED] gt_was/16016694945
[16:23:52] [PASSED] gt_was/14018575942
[16:23:52] [PASSED] gt_was/22016670082
[16:23:52] [PASSED] gt_was/22016670082
[16:23:52] [PASSED] gt_was/14017421178
[16:23:52] [PASSED] gt_was/16025250150
[16:23:52] [PASSED] gt_was/14021871409
[16:23:52] [PASSED] gt_was/16021865536
[16:23:52] [PASSED] gt_was/14021486841
[16:23:52] [PASSED] gt_was/14025160223
[16:23:52] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[16:23:52] [PASSED] gt_was/14025635424
[16:23:52] [PASSED] gt_was/16028005424
[16:23:52] ============== [PASSED] xe_rtp_table_gt_test ===============
[16:23:52] ================== xe_rtp_table_gt_test  ===================
[16:23:52] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[16:23:52] [PASSED] gt_tunings/Tuning: 32B Access Enable
[16:23:52] [PASSED] gt_tunings/Tuning: L3 cache
[16:23:52] [PASSED] gt_tunings/Tuning: L3 cache - media
[16:23:52] [PASSED] gt_tunings/Tuning: Compression Overfetch
[16:23:52] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[16:23:52] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[16:23:52] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[16:23:52] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[16:23:52] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[16:23:52] [PASSED] gt_tunings/Tuning: Stateless compression control
[16:23:52] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[16:23:52] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[16:23:52] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[16:23:52] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[16:23:52] ============== [PASSED] xe_rtp_table_gt_test ===============
[16:23:52] ================== xe_rtp_table_oob_test  ==================
[16:23:52] [PASSED] oob_was/1607983814
[16:23:52] [PASSED] oob_was/16010904313
[16:23:52] [PASSED] oob_was/18022495364
[16:23:52] [PASSED] oob_was/22012773006
[16:23:52] [PASSED] oob_was/14014475959
[16:23:52] [PASSED] oob_was/22011391025
[16:23:52] [PASSED] oob_was/22012727170
[16:23:52] [PASSED] oob_was/22012727685
[16:23:52] [PASSED] oob_was/22016596838
[16:23:52] [PASSED] oob_was/18020744125
[16:23:52] [PASSED] oob_was/1409600907
[16:23:52] [PASSED] oob_was/22014953428
[16:23:52] [PASSED] oob_was/16017236439
[16:23:52] [PASSED] oob_was/14019821291
[16:23:52] [PASSED] oob_was/14015076503
[16:23:52] [PASSED] oob_was/14018913170
[16:23:52] [PASSED] oob_was/14018094691
[16:23:52] [PASSED] oob_was/18024947630
[16:23:52] [PASSED] oob_was/16022287689
[16:23:52] [PASSED] oob_was/13011645652
[16:23:52] [PASSED] oob_was/14022293748
[16:23:52] [PASSED] oob_was/22019794406
[16:23:52] [PASSED] oob_was/22019338487
[16:23:52] [PASSED] oob_was/16023588340
[16:23:52] [PASSED] oob_was/14019789679
[16:23:52] [PASSED] oob_was/14022866841
[16:23:52] [PASSED] oob_was/16021333562
[16:23:52] [PASSED] oob_was/14016712196
[16:23:52] [PASSED] oob_was/14015568240
[16:23:52] [PASSED] oob_was/18013179988
[16:23:52] [PASSED] oob_was/1508761755
[16:23:52] [PASSED] oob_was/16023105232
[16:23:52] [PASSED] oob_was/16026508708
[16:23:52] [PASSED] oob_was/14020001231
[16:23:52] [PASSED] oob_was/16023683509
[16:23:52] [PASSED] oob_was/14025515070
[16:23:52] [PASSED] oob_was/15015404425_disable
[16:23:52] [PASSED] oob_was/16026007364
[16:23:52] [PASSED] oob_was/14020316580
[16:23:52] [PASSED] oob_was/14025883347
[16:23:52] [PASSED] oob_was/16029380221
[16:23:52] [PASSED] oob_was/22022079272
[16:23:52] [PASSED] oob_was/16029897822
[16:23:52] [PASSED] oob_was/14027054324
[16:23:52] ============== [PASSED] xe_rtp_table_oob_test ==============
[16:23:52] ================ xe_rtp_table_dev_oob_test  ================
[16:23:52] [PASSED] device_oob_was/22010954014
[16:23:52] [PASSED] device_oob_was/15015404425
[16:23:52] [PASSED] device_oob_was/22019338487_display
[16:23:52] [PASSED] device_oob_was/14022085890
[16:23:52] [PASSED] device_oob_was/14026539277
[16:23:52] [PASSED] device_oob_was/14026633728
[16:23:52] [PASSED] device_oob_was/14026746987
[16:23:52] [PASSED] device_oob_was/14026779378
[16:23:52] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[16:23:52] ========== xe_rtp_table_missing_upper_bound_test  ==========
[16:23:52] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[16:23:52] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[16:23:52] [PASSED] register_whitelist/1806527549
[16:23:52] [PASSED] register_whitelist/allow_read_ctx_timestamp
[16:23:52] [PASSED] register_whitelist/allow_read_queue_timestamp
[16:23:52] [PASSED] register_whitelist/16014440446
[16:23:52] [PASSED] register_whitelist/16017236439
[16:23:52] [PASSED] register_whitelist/16020183090
[16:23:52] [PASSED] register_whitelist/14024997852
[16:23:52] [PASSED] register_whitelist/14024997852
[16:23:52] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[16:23:52] =============== [PASSED] xe_rtp_tables_test ================
[16:23:52] =================== xe_rtp (3 subtests) ====================
[16:23:52] =================== xe_rtp_rules_tests  ====================
[16:23:52] [PASSED] no
[16:23:52] [PASSED] yes
[16:23:52] [PASSED] no-and-no
[16:23:52] [PASSED] no-and-yes
[16:23:52] [PASSED] yes-and-no
[16:23:52] [PASSED] yes-and-yes
[16:23:52] [PASSED] no-or-no
[16:23:52] [PASSED] no-or-yes
[16:23:52] [PASSED] yes-or-no
[16:23:52] [PASSED] yes-or-yes
[16:23:52] [PASSED] no-yes-or-yes-no
[16:23:52] [PASSED] no-yes-or-yes-yes
[16:23:52] [PASSED] yes-yes-or-no-yes
[16:23:52] [PASSED] yes-yes-or-yes-yes
[16:23:52] [PASSED] no-no-or-yes-or-no
[16:23:52] [PASSED] or
[16:23:52] [PASSED] or-yes
[16:23:52] [PASSED] or-no
[16:23:52] [PASSED] yes-or
[16:23:52] [PASSED] no-or
[16:23:52] [PASSED] no-or-or-yes
[16:23:52] [PASSED] yes-or-or-no
[16:23:52] [PASSED] no-or-or-no
[16:23:52] [PASSED] missing-context-engine-class
[16:23:52] [PASSED] missing-context-engine-class-or-yes
[16:23:52] [PASSED] missing-context-engine-class-or-or-yes
[16:23:52] =============== [PASSED] xe_rtp_rules_tests ================
[16:23:52] =============== xe_rtp_process_to_sr_tests  ================
[16:23:52] [PASSED] coalesce-same-reg
[16:23:52] [PASSED] coalesce-same-reg-literal-and-func
[16:23:52] [PASSED] no-match-no-add
[16:23:52] [PASSED] two-regs-two-entries
[16:23:52] [PASSED] clr-one-set-other
[16:23:52] [PASSED] set-field
[16:23:52] [PASSED] conflict-duplicate
[16:23:52] [PASSED] conflict-not-disjoint
[16:23:52] [PASSED] conflict-not-disjoint-literal-and-func
[16:23:52] [PASSED] conflict-reg-type
[16:23:52] [PASSED] bad-mcr-reg-forced-to-regular
[16:23:52] [PASSED] bad-regular-reg-forced-to-mcr
[16:23:52] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[16:23:52] ================== xe_rtp_process_tests  ===================
[16:23:52] [PASSED] active1
[16:23:52] [PASSED] active2
[16:23:52] [PASSED] active-inactive
[16:23:52] [PASSED] inactive-active
[16:23:52] [PASSED] inactive-active-inactive
[16:23:52] [PASSED] inactive-inactive-inactive
[16:23:52] ============== [PASSED] xe_rtp_process_tests ===============
[16:23:52] ===================== [PASSED] xe_rtp ======================
[16:23:52] ==================== xe_wa (1 subtest) =====================
[16:23:52] ======================== xe_wa_gt  =========================
[16:23:52] [PASSED] TIGERLAKE B0
[16:23:52] [PASSED] DG1 A0
[16:23:52] [PASSED] DG1 B0
[16:23:52] [PASSED] ALDERLAKE_S A0
[16:23:52] [PASSED] ALDERLAKE_S B0
[16:23:52] [PASSED] ALDERLAKE_S C0
[16:23:52] [PASSED] ALDERLAKE_S D0
[16:23:52] [PASSED] ALDERLAKE_P A0
[16:23:52] [PASSED] ALDERLAKE_P B0
[16:23:52] [PASSED] ALDERLAKE_P C0
[16:23:52] [PASSED] ALDERLAKE_S RPLS D0
[16:23:52] [PASSED] ALDERLAKE_P RPLU E0
[16:23:52] [PASSED] DG2 G10 C0
[16:23:52] [PASSED] DG2 G11 B1
[16:23:52] [PASSED] DG2 G12 A1
[16:23:52] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[16:23:52] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[16:23:52] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[16:23:52] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[16:23:52] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[16:23:52] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[16:23:52] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[16:23:52] ==================== [PASSED] xe_wa_gt =====================
[16:23:52] ====================== [PASSED] xe_wa ======================
[16:23:52] ============================================================
[16:23:52] Testing complete. Ran 793 tests: passed: 765, skipped: 28
[16:23:52] Elapsed time: 36.524s total, 1.816s configuring, 33.992s building, 0.688s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[16:23:52] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:23:54] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[16:24:19] Starting KUnit Kernel (1/1)...
[16:24:19] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[16:24:19] ============= refcount_interrupt (4 subtests) ==============
[16:24:19] [PASSED] test_single_irq_change
[16:24:19] [PASSED] test_nested_irq_change
[16:24:19] [PASSED] test_multiple_irq_change
[16:24:19] [PASSED] test_irq_save
[16:24:19] =============== [PASSED] refcount_interrupt ================
[16:24:19] ============ drm_test_pick_cmdline (2 subtests) ============
[16:24:19] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[16:24:19] =============== drm_test_pick_cmdline_named  ===============
[16:24:19] [PASSED] NTSC
[16:24:19] [PASSED] NTSC-J
[16:24:19] [PASSED] PAL
[16:24:19] [PASSED] PAL-M
[16:24:19] =========== [PASSED] drm_test_pick_cmdline_named ===========
[16:24:19] ============== [PASSED] drm_test_pick_cmdline ==============
[16:24:19] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[16:24:19] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[16:24:19] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[16:24:19] =========== drm_validate_clone_mode (2 subtests) ===========
[16:24:19] ============== drm_test_check_in_clone_mode  ===============
[16:24:19] [PASSED] in_clone_mode
[16:24:19] [PASSED] not_in_clone_mode
[16:24:19] ========== [PASSED] drm_test_check_in_clone_mode ===========
[16:24:19] =============== drm_test_check_valid_clones  ===============
[16:24:19] [PASSED] not_in_clone_mode
[16:24:19] [PASSED] valid_clone
[16:24:19] [PASSED] invalid_clone
[16:24:19] =========== [PASSED] drm_test_check_valid_clones ===========
[16:24:19] ============= [PASSED] drm_validate_clone_mode =============
[16:24:19] ============= drm_validate_modeset (1 subtest) =============
[16:24:19] [PASSED] drm_test_check_connector_changed_modeset
[16:24:19] ============== [PASSED] drm_validate_modeset ===============
[16:24:19] ====== drm_test_bridge_get_current_state (1 subtest) =======
[16:24:19] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[16:24:19] ======== [PASSED] drm_test_bridge_get_current_state ========
[16:24:19] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[16:24:19] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[16:24:19] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[16:24:19] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[16:24:19] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[16:24:19] ============== drm_bridge_alloc (2 subtests) ===============
[16:24:19] [PASSED] drm_test_drm_bridge_alloc_basic
[16:24:19] [PASSED] drm_test_drm_bridge_alloc_get_put
[16:24:19] ================ [PASSED] drm_bridge_alloc =================
[16:24:19] ============= drm_bridge_bus_fmt (5 subtests) ==============
[16:24:19] [PASSED] drm_test_bridge_rgb_yuv_rgb
[16:24:19] [PASSED] drm_test_bridge_must_convert_to_yuv444
[16:24:19] [PASSED] drm_test_bridge_hdmi_auto_rgb
[16:24:19] [PASSED] drm_test_bridge_auto_first
[16:24:19] [PASSED] drm_test_bridge_rgb_yuv_no_path
[16:24:19] =============== [PASSED] drm_bridge_bus_fmt ================
[16:24:19] ============= drm_cmdline_parser (40 subtests) =============
[16:24:19] [PASSED] drm_test_cmdline_force_d_only
[16:24:19] [PASSED] drm_test_cmdline_force_D_only_dvi
[16:24:19] [PASSED] drm_test_cmdline_force_D_only_hdmi
[16:24:19] [PASSED] drm_test_cmdline_force_D_only_not_digital
[16:24:19] [PASSED] drm_test_cmdline_force_e_only
[16:24:19] [PASSED] drm_test_cmdline_res
[16:24:19] [PASSED] drm_test_cmdline_res_vesa
[16:24:19] [PASSED] drm_test_cmdline_res_vesa_rblank
[16:24:19] [PASSED] drm_test_cmdline_res_rblank
[16:24:19] [PASSED] drm_test_cmdline_res_bpp
[16:24:19] [PASSED] drm_test_cmdline_res_refresh
[16:24:19] [PASSED] drm_test_cmdline_res_bpp_refresh
[16:24:19] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[16:24:19] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[16:24:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[16:24:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[16:24:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[16:24:19] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[16:24:19] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[16:24:19] [PASSED] drm_test_cmdline_res_margins_force_on
[16:24:19] [PASSED] drm_test_cmdline_res_vesa_margins
[16:24:19] [PASSED] drm_test_cmdline_name
[16:24:19] [PASSED] drm_test_cmdline_name_bpp
[16:24:19] [PASSED] drm_test_cmdline_name_option
[16:24:19] [PASSED] drm_test_cmdline_name_bpp_option
[16:24:19] [PASSED] drm_test_cmdline_rotate_0
[16:24:19] [PASSED] drm_test_cmdline_rotate_90
[16:24:19] [PASSED] drm_test_cmdline_rotate_180
[16:24:19] [PASSED] drm_test_cmdline_rotate_270
[16:24:19] [PASSED] drm_test_cmdline_hmirror
[16:24:19] [PASSED] drm_test_cmdline_vmirror
[16:24:19] [PASSED] drm_test_cmdline_margin_options
[16:24:19] [PASSED] drm_test_cmdline_multiple_options
[16:24:19] [PASSED] drm_test_cmdline_bpp_extra_and_option
[16:24:19] [PASSED] drm_test_cmdline_extra_and_option
[16:24:19] [PASSED] drm_test_cmdline_freestanding_options
[16:24:19] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[16:24:19] [PASSED] drm_test_cmdline_panel_orientation
[16:24:19] ================ drm_test_cmdline_invalid  =================
[16:24:19] [PASSED] margin_only
[16:24:19] [PASSED] interlace_only
[16:24:19] [PASSED] res_missing_x
[16:24:19] [PASSED] res_missing_y
[16:24:19] [PASSED] res_bad_y
[16:24:19] [PASSED] res_missing_y_bpp
[16:24:19] [PASSED] res_bad_bpp
[16:24:19] [PASSED] res_bad_refresh
[16:24:19] [PASSED] res_bpp_refresh_force_on_off
[16:24:19] [PASSED] res_invalid_mode
[16:24:19] [PASSED] res_bpp_wrong_place_mode
[16:24:19] [PASSED] name_bpp_refresh
[16:24:19] [PASSED] name_refresh
[16:24:19] [PASSED] name_refresh_wrong_mode
[16:24:19] [PASSED] name_refresh_invalid_mode
[16:24:19] [PASSED] rotate_multiple
[16:24:19] [PASSED] rotate_invalid_val
[16:24:19] [PASSED] rotate_truncated
[16:24:19] [PASSED] invalid_option
[16:24:19] [PASSED] invalid_tv_option
[16:24:19] [PASSED] truncated_tv_option
[16:24:19] ============ [PASSED] drm_test_cmdline_invalid =============
[16:24:19] =============== drm_test_cmdline_tv_options  ===============
[16:24:19] [PASSED] NTSC
[16:24:19] [PASSED] NTSC_443
[16:24:19] [PASSED] NTSC_J
[16:24:19] [PASSED] PAL
[16:24:19] [PASSED] PAL_M
[16:24:19] [PASSED] PAL_N
[16:24:19] [PASSED] SECAM
[16:24:19] [PASSED] MONO_525
[16:24:19] [PASSED] MONO_625
[16:24:19] =========== [PASSED] drm_test_cmdline_tv_options ===========
[16:24:19] =============== [PASSED] drm_cmdline_parser ================
[16:24:19] ========== drmm_connector_hdmi_init (20 subtests) ==========
[16:24:19] [PASSED] drm_test_connector_hdmi_init_valid
[16:24:19] [PASSED] drm_test_connector_hdmi_init_bpc_8
[16:24:19] [PASSED] drm_test_connector_hdmi_init_bpc_10
[16:24:19] [PASSED] drm_test_connector_hdmi_init_bpc_12
[16:24:19] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[16:24:19] [PASSED] drm_test_connector_hdmi_init_bpc_null
[16:24:19] [PASSED] drm_test_connector_hdmi_init_formats_empty
[16:24:19] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[16:24:19] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[16:24:19] [PASSED] supported_formats=0x9 yuv420_allowed=1
[16:24:19] [PASSED] supported_formats=0x9 yuv420_allowed=0
[16:24:19] [PASSED] supported_formats=0x5 yuv420_allowed=1
[16:24:19] [PASSED] supported_formats=0x5 yuv420_allowed=0
[16:24:19] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[16:24:19] [PASSED] drm_test_connector_hdmi_init_null_ddc
[16:24:19] [PASSED] drm_test_connector_hdmi_init_null_product
[16:24:19] [PASSED] drm_test_connector_hdmi_init_null_vendor
[16:24:19] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[16:24:19] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[16:24:19] [PASSED] drm_test_connector_hdmi_init_product_valid
[16:24:19] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[16:24:19] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[16:24:19] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[16:24:19] ========= drm_test_connector_hdmi_init_type_valid  =========
[16:24:19] [PASSED] HDMI-A
[16:24:19] [PASSED] HDMI-B
[16:24:19] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[16:24:19] ======== drm_test_connector_hdmi_init_type_invalid  ========
[16:24:19] [PASSED] Unknown
[16:24:19] [PASSED] VGA
[16:24:19] [PASSED] DVI-I
[16:24:19] [PASSED] DVI-D
[16:24:19] [PASSED] DVI-A
[16:24:19] [PASSED] Composite
[16:24:19] [PASSED] SVIDEO
[16:24:19] [PASSED] LVDS
[16:24:19] [PASSED] Component
[16:24:19] [PASSED] DIN
[16:24:19] [PASSED] DP
[16:24:19] [PASSED] TV
[16:24:19] [PASSED] eDP
[16:24:19] [PASSED] Virtual
[16:24:19] [PASSED] DSI
[16:24:19] [PASSED] DPI
[16:24:19] [PASSED] Writeback
[16:24:19] [PASSED] SPI
[16:24:19] [PASSED] USB
[16:24:19] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[16:24:19] ============ [PASSED] drmm_connector_hdmi_init =============
[16:24:19] ============= drmm_connector_init (3 subtests) =============
[16:24:19] [PASSED] drm_test_drmm_connector_init
[16:24:19] [PASSED] drm_test_drmm_connector_init_null_ddc
[16:24:19] ========= drm_test_drmm_connector_init_type_valid  =========
[16:24:19] [PASSED] Unknown
[16:24:19] [PASSED] VGA
[16:24:19] [PASSED] DVI-I
[16:24:19] [PASSED] DVI-D
[16:24:19] [PASSED] DVI-A
[16:24:19] [PASSED] Composite
[16:24:19] [PASSED] SVIDEO
[16:24:19] [PASSED] LVDS
[16:24:19] [PASSED] Component
[16:24:19] [PASSED] DIN
[16:24:19] [PASSED] DP
[16:24:19] [PASSED] HDMI-A
[16:24:19] [PASSED] HDMI-B
[16:24:19] [PASSED] TV
[16:24:19] [PASSED] eDP
[16:24:19] [PASSED] Virtual
[16:24:19] [PASSED] DSI
[16:24:19] [PASSED] DPI
[16:24:19] [PASSED] Writeback
[16:24:19] [PASSED] SPI
[16:24:19] [PASSED] USB
[16:24:19] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[16:24:19] =============== [PASSED] drmm_connector_init ===============
[16:24:19] ========= drm_connector_dynamic_init (6 subtests) ==========
[16:24:19] [PASSED] drm_test_drm_connector_dynamic_init
[16:24:19] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[16:24:19] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[16:24:19] [PASSED] drm_test_drm_connector_dynamic_init_properties
[16:24:19] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[16:24:19] [PASSED] Unknown
[16:24:19] [PASSED] VGA
[16:24:19] [PASSED] DVI-I
[16:24:19] [PASSED] DVI-D
[16:24:19] [PASSED] DVI-A
[16:24:19] [PASSED] Composite
[16:24:19] [PASSED] SVIDEO
[16:24:19] [PASSED] LVDS
[16:24:19] [PASSED] Component
[16:24:19] [PASSED] DIN
[16:24:19] [PASSED] DP
[16:24:19] [PASSED] HDMI-A
[16:24:19] [PASSED] HDMI-B
[16:24:19] [PASSED] TV
[16:24:19] [PASSED] eDP
[16:24:19] [PASSED] Virtual
[16:24:19] [PASSED] DSI
[16:24:19] [PASSED] DPI
[16:24:19] [PASSED] Writeback
[16:24:19] [PASSED] SPI
[16:24:19] [PASSED] USB
[16:24:19] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[16:24:19] ======== drm_test_drm_connector_dynamic_init_name  =========
[16:24:19] [PASSED] Unknown
[16:24:19] [PASSED] VGA
[16:24:19] [PASSED] DVI-I
[16:24:19] [PASSED] DVI-D
[16:24:19] [PASSED] DVI-A
[16:24:19] [PASSED] Composite
[16:24:19] [PASSED] SVIDEO
[16:24:19] [PASSED] LVDS
[16:24:19] [PASSED] Component
[16:24:19] [PASSED] DIN
[16:24:19] [PASSED] DP
[16:24:19] [PASSED] HDMI-A
[16:24:19] [PASSED] HDMI-B
[16:24:19] [PASSED] TV
[16:24:19] [PASSED] eDP
[16:24:19] [PASSED] Virtual
[16:24:19] [PASSED] DSI
[16:24:19] [PASSED] DPI
[16:24:19] [PASSED] Writeback
[16:24:19] [PASSED] SPI
[16:24:19] [PASSED] USB
[16:24:19] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[16:24:19] =========== [PASSED] drm_connector_dynamic_init ============
[16:24:19] ==== drm_connector_dynamic_register_early (4 subtests) =====
[16:24:19] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[16:24:19] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[16:24:19] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[16:24:19] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[16:24:19] ====== [PASSED] drm_connector_dynamic_register_early =======
[16:24:19] ======= drm_connector_dynamic_register (7 subtests) ========
[16:24:19] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[16:24:19] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[16:24:19] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[16:24:19] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[16:24:19] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[16:24:19] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[16:24:19] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[16:24:19] ========= [PASSED] drm_connector_dynamic_register ==========
[16:24:19] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[16:24:19] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[16:24:19] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[16:24:19] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[16:24:19] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[16:24:19] ========== drm_test_get_tv_mode_from_name_valid  ===========
[16:24:19] [PASSED] NTSC
[16:24:19] [PASSED] NTSC-443
[16:24:19] [PASSED] NTSC-J
[16:24:19] [PASSED] PAL
[16:24:19] [PASSED] PAL-M
[16:24:19] [PASSED] PAL-N
[16:24:19] [PASSED] SECAM
[16:24:19] [PASSED] Mono
[16:24:19] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[16:24:19] [PASSED] drm_test_get_tv_mode_from_name_truncated
[16:24:19] ============ [PASSED] drm_get_tv_mode_from_name ============
[16:24:19] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[16:24:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[16:24:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[16:24:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[16:24:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[16:24:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[16:24:19] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[16:24:19] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[16:24:19] [PASSED] VIC 96
[16:24:19] [PASSED] VIC 97
[16:24:19] [PASSED] VIC 101
[16:24:19] [PASSED] VIC 102
[16:24:19] [PASSED] VIC 106
[16:24:19] [PASSED] VIC 107
[16:24:19] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[16:24:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[16:24:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[16:24:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[16:24:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[16:24:19] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[16:24:19] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[16:24:19] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[16:24:19] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[16:24:19] [PASSED] Automatic
[16:24:19] [PASSED] Full
[16:24:19] [PASSED] Limited 16:235
[16:24:19] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[16:24:19] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[16:24:19] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[16:24:19] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[16:24:19] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[16:24:19] [PASSED] RGB
[16:24:19] [PASSED] YUV 4:2:0
[16:24:19] [PASSED] YUV 4:2:2
[16:24:19] [PASSED] YUV 4:4:4
[16:24:19] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[16:24:19] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[16:24:19] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[16:24:19] ============= drm_damage_helper (21 subtests) ==============
[16:24:19] [PASSED] drm_test_damage_iter_no_damage
[16:24:19] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[16:24:19] [PASSED] drm_test_damage_iter_no_damage_src_moved
[16:24:19] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[16:24:19] [PASSED] drm_test_damage_iter_no_damage_not_visible
[16:24:19] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[16:24:19] [PASSED] drm_test_damage_iter_no_damage_no_fb
[16:24:19] [PASSED] drm_test_damage_iter_simple_damage
[16:24:19] [PASSED] drm_test_damage_iter_single_damage
[16:24:19] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[16:24:19] [PASSED] drm_test_damage_iter_single_damage_outside_src
[16:24:19] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[16:24:19] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[16:24:19] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[16:24:19] [PASSED] drm_test_damage_iter_single_damage_src_moved
[16:24:19] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[16:24:19] [PASSED] drm_test_damage_iter_damage
[16:24:19] [PASSED] drm_test_damage_iter_damage_one_intersect
[16:24:19] [PASSED] drm_test_damage_iter_damage_one_outside
[16:24:19] [PASSED] drm_test_damage_iter_damage_src_moved
[16:24:19] [PASSED] drm_test_damage_iter_damage_not_visible
[16:24:19] ================ [PASSED] drm_damage_helper ================
[16:24:19] ============== drm_dp_mst_helper (3 subtests) ==============
[16:24:19] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[16:24:19] [PASSED] Clock 154000 BPP 30 DSC disabled
[16:24:19] [PASSED] Clock 234000 BPP 30 DSC disabled
[16:24:19] [PASSED] Clock 297000 BPP 24 DSC disabled
[16:24:19] [PASSED] Clock 332880 BPP 24 DSC enabled
[16:24:19] [PASSED] Clock 324540 BPP 24 DSC enabled
[16:24:19] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[16:24:19] ============== drm_test_dp_mst_calc_pbn_div  ===============
[16:24:19] [PASSED] Link rate 2000000 lane count 4
[16:24:19] [PASSED] Link rate 2000000 lane count 2
[16:24:19] [PASSED] Link rate 2000000 lane count 1
[16:24:19] [PASSED] Link rate 1350000 lane count 4
[16:24:19] [PASSED] Link rate 1350000 lane count 2
[16:24:19] [PASSED] Link rate 1350000 lane count 1
[16:24:19] [PASSED] Link rate 1000000 lane count 4
[16:24:19] [PASSED] Link rate 1000000 lane count 2
[16:24:19] [PASSED] Link rate 1000000 lane count 1
[16:24:19] [PASSED] Link rate 810000 lane count 4
[16:24:19] [PASSED] Link rate 810000 lane count 2
[16:24:19] [PASSED] Link rate 810000 lane count 1
[16:24:19] [PASSED] Link rate 540000 lane count 4
[16:24:19] [PASSED] Link rate 540000 lane count 2
[16:24:19] [PASSED] Link rate 540000 lane count 1
[16:24:19] [PASSED] Link rate 270000 lane count 4
[16:24:19] [PASSED] Link rate 270000 lane count 2
[16:24:19] [PASSED] Link rate 270000 lane count 1
[16:24:19] [PASSED] Link rate 162000 lane count 4
[16:24:19] [PASSED] Link rate 162000 lane count 2
[16:24:19] [PASSED] Link rate 162000 lane count 1
[16:24:19] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[16:24:19] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[16:24:19] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[16:24:19] [PASSED] DP_POWER_UP_PHY with port number
[16:24:19] [PASSED] DP_POWER_DOWN_PHY with port number
[16:24:19] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[16:24:19] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[16:24:19] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[16:24:19] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[16:24:19] [PASSED] DP_QUERY_PAYLOAD with port number
[16:24:19] [PASSED] DP_QUERY_PAYLOAD with VCPI
[16:24:19] [PASSED] DP_REMOTE_DPCD_READ with port number
[16:24:19] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[16:24:19] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[16:24:19] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[16:24:19] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[16:24:19] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[16:24:19] [PASSED] DP_REMOTE_I2C_READ with port number
[16:24:19] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[16:24:19] [PASSED] DP_REMOTE_I2C_READ with transactions array
[16:24:19] [PASSED] DP_REMOTE_I2C_WRITE with port number
[16:24:19] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[16:24:19] [PASSED] DP_REMOTE_I2C_WRITE with data array
[16:24:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[16:24:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[16:24:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[16:24:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[16:24:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[16:24:19] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[16:24:19] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[16:24:19] ================ [PASSED] drm_dp_mst_helper ================
[16:24:19] ================== drm_exec (7 subtests) ===================
[16:24:19] [PASSED] sanitycheck
[16:24:19] [PASSED] test_lock
[16:24:19] [PASSED] test_lock_unlock
[16:24:19] [PASSED] test_duplicates
[16:24:19] [PASSED] test_prepare
[16:24:19] [PASSED] test_prepare_array
[16:24:19] [PASSED] test_multiple_loops
[16:24:19] ==================== [PASSED] drm_exec =====================
[16:24:19] =========== drm_format_helper_test (17 subtests) ===========
[16:24:19] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[16:24:19] [PASSED] single_pixel_source_buffer
[16:24:19] [PASSED] single_pixel_clip_rectangle
[16:24:19] [PASSED] well_known_colors
[16:24:19] [PASSED] destination_pitch
[16:24:19] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[16:24:19] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[16:24:19] [PASSED] single_pixel_source_buffer
[16:24:19] [PASSED] single_pixel_clip_rectangle
[16:24:19] [PASSED] well_known_colors
[16:24:19] [PASSED] destination_pitch
[16:24:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[16:24:19] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[16:24:19] [PASSED] single_pixel_source_buffer
[16:24:19] [PASSED] single_pixel_clip_rectangle
[16:24:19] [PASSED] well_known_colors
[16:24:19] [PASSED] destination_pitch
[16:24:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[16:24:19] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[16:24:19] [PASSED] single_pixel_source_buffer
[16:24:19] [PASSED] single_pixel_clip_rectangle
[16:24:19] [PASSED] well_known_colors
[16:24:19] [PASSED] destination_pitch
[16:24:19] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[16:24:19] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[16:24:19] [PASSED] single_pixel_source_buffer
[16:24:19] [PASSED] single_pixel_clip_rectangle
[16:24:19] [PASSED] well_known_colors
[16:24:19] [PASSED] destination_pitch
[16:24:19] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[16:24:19] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[16:24:19] [PASSED] single_pixel_source_buffer
[16:24:19] [PASSED] single_pixel_clip_rectangle
[16:24:19] [PASSED] well_known_colors
[16:24:19] [PASSED] destination_pitch
[16:24:19] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[16:24:19] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[16:24:19] [PASSED] single_pixel_source_buffer
[16:24:19] [PASSED] single_pixel_clip_rectangle
[16:24:19] [PASSED] well_known_colors
[16:24:19] [PASSED] destination_pitch
[16:24:19] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[16:24:19] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[16:24:19] [PASSED] single_pixel_source_buffer
[16:24:19] [PASSED] single_pixel_clip_rectangle
[16:24:19] [PASSED] well_known_colors
[16:24:19] [PASSED] destination_pitch
[16:24:19] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[16:24:19] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[16:24:19] [PASSED] single_pixel_source_buffer
[16:24:19] [PASSED] single_pixel_clip_rectangle
[16:24:19] [PASSED] well_known_colors
[16:24:19] [PASSED] destination_pitch
[16:24:19] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[16:24:19] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[16:24:19] [PASSED] single_pixel_source_buffer
[16:24:19] [PASSED] single_pixel_clip_rectangle
[16:24:19] [PASSED] well_known_colors
[16:24:19] [PASSED] destination_pitch
[16:24:19] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[16:24:19] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[16:24:19] [PASSED] single_pixel_source_buffer
[16:24:19] [PASSED] single_pixel_clip_rectangle
[16:24:19] [PASSED] well_known_colors
[16:24:19] [PASSED] destination_pitch
[16:24:19] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[16:24:19] ============== drm_test_fb_xrgb8888_to_mono  ===============
[16:24:19] [PASSED] single_pixel_source_buffer
[16:24:19] [PASSED] single_pixel_clip_rectangle
[16:24:19] [PASSED] well_known_colors
[16:24:19] [PASSED] destination_pitch
[16:24:19] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[16:24:19] ==================== drm_test_fb_swab  =====================
[16:24:19] [PASSED] single_pixel_source_buffer
[16:24:19] [PASSED] single_pixel_clip_rectangle
[16:24:19] [PASSED] well_known_colors
[16:24:19] [PASSED] destination_pitch
[16:24:19] ================ [PASSED] drm_test_fb_swab =================
[16:24:19] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[16:24:19] [PASSED] single_pixel_source_buffer
[16:24:19] [PASSED] single_pixel_clip_rectangle
[16:24:19] [PASSED] well_known_colors
[16:24:19] [PASSED] destination_pitch
[16:24:19] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[16:24:19] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[16:24:19] [PASSED] single_pixel_source_buffer
[16:24:19] [PASSED] single_pixel_clip_rectangle
[16:24:19] [PASSED] well_known_colors
[16:24:19] [PASSED] destination_pitch
[16:24:19] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[16:24:19] ================= drm_test_fb_clip_offset  =================
[16:24:19] [PASSED] pass through
[16:24:19] [PASSED] horizontal offset
[16:24:19] [PASSED] vertical offset
[16:24:19] [PASSED] horizontal and vertical offset
[16:24:19] [PASSED] horizontal offset (custom pitch)
[16:24:19] [PASSED] vertical offset (custom pitch)
[16:24:19] [PASSED] horizontal and vertical offset (custom pitch)
[16:24:19] ============= [PASSED] drm_test_fb_clip_offset =============
[16:24:19] =================== drm_test_fb_memcpy  ====================
[16:24:19] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[16:24:19] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[16:24:19] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[16:24:19] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[16:24:19] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[16:24:19] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[16:24:19] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[16:24:19] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[16:24:19] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[16:24:19] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[16:24:19] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[16:24:19] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[16:24:19] =============== [PASSED] drm_test_fb_memcpy ================
[16:24:19] ============= [PASSED] drm_format_helper_test ==============
[16:24:19] ================= drm_format (18 subtests) =================
[16:24:19] [PASSED] drm_test_format_block_width_invalid
[16:24:19] [PASSED] drm_test_format_block_width_one_plane
[16:24:19] [PASSED] drm_test_format_block_width_two_plane
[16:24:19] [PASSED] drm_test_format_block_width_three_plane
[16:24:19] [PASSED] drm_test_format_block_width_tiled
[16:24:19] [PASSED] drm_test_format_block_height_invalid
[16:24:19] [PASSED] drm_test_format_block_height_one_plane
[16:24:19] [PASSED] drm_test_format_block_height_two_plane
[16:24:19] [PASSED] drm_test_format_block_height_three_plane
[16:24:19] [PASSED] drm_test_format_block_height_tiled
[16:24:19] [PASSED] drm_test_format_min_pitch_invalid
[16:24:19] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[16:24:19] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[16:24:19] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[16:24:19] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[16:24:19] [PASSED] drm_test_format_min_pitch_two_plane
[16:24:19] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[16:24:19] [PASSED] drm_test_format_min_pitch_tiled
[16:24:19] =================== [PASSED] drm_format ====================
[16:24:19] ============== drm_framebuffer (10 subtests) ===============
[16:24:19] ========== drm_test_framebuffer_check_src_coords  ==========
[16:24:19] [PASSED] Success: source fits into fb
[16:24:19] [PASSED] Fail: overflowing fb with x-axis coordinate
[16:24:19] [PASSED] Fail: overflowing fb with y-axis coordinate
[16:24:19] [PASSED] Fail: overflowing fb with source width
[16:24:19] [PASSED] Fail: overflowing fb with source height
[16:24:19] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[16:24:19] [PASSED] drm_test_framebuffer_cleanup
[16:24:19] =============== drm_test_framebuffer_create  ===============
[16:24:19] [PASSED] ABGR8888 normal sizes
[16:24:19] [PASSED] ABGR8888 max sizes
[16:24:19] [PASSED] ABGR8888 pitch greater than min required
[16:24:19] [PASSED] ABGR8888 pitch less than min required
[16:24:19] [PASSED] ABGR8888 Invalid width
[16:24:19] [PASSED] ABGR8888 Invalid buffer handle
[16:24:19] [PASSED] No pixel format
[16:24:19] [PASSED] ABGR8888 Width 0
[16:24:19] [PASSED] ABGR8888 Height 0
[16:24:19] [PASSED] ABGR8888 Out of bound height * pitch combination
[16:24:19] [PASSED] ABGR8888 Large buffer offset
[16:24:19] [PASSED] ABGR8888 Buffer offset for inexistent plane
[16:24:19] [PASSED] ABGR8888 Invalid flag
[16:24:19] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[16:24:19] [PASSED] ABGR8888 Valid buffer modifier
[16:24:19] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[16:24:19] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[16:24:19] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[16:24:19] [PASSED] NV12 Normal sizes
[16:24:19] [PASSED] NV12 Max sizes
[16:24:19] [PASSED] NV12 Invalid pitch
[16:24:19] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[16:24:19] [PASSED] NV12 different  modifier per-plane
[16:24:19] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[16:24:19] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[16:24:19] [PASSED] NV12 Modifier for inexistent plane
[16:24:19] [PASSED] NV12 Handle for inexistent plane
[16:24:19] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[16:24:19] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[16:24:19] [PASSED] YVU420 Normal sizes
[16:24:19] [PASSED] YVU420 Max sizes
[16:24:19] [PASSED] YVU420 Invalid pitch
[16:24:19] [PASSED] YVU420 Different pitches
[16:24:19] [PASSED] YVU420 Different buffer offsets/pitches
[16:24:19] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[16:24:19] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[16:24:19] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[16:24:19] [PASSED] YVU420 Valid modifier
[16:24:19] [PASSED] YVU420 Different modifiers per plane
[16:24:19] [PASSED] YVU420 Modifier for inexistent plane
[16:24:19] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[16:24:19] [PASSED] X0L2 Normal sizes
[16:24:19] [PASSED] X0L2 Max sizes
[16:24:19] [PASSED] X0L2 Invalid pitch
[16:24:19] [PASSED] X0L2 Pitch greater than minimum required
[16:24:19] [PASSED] X0L2 Handle for inexistent plane
[16:24:19] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[16:24:19] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[16:24:19] [PASSED] X0L2 Valid modifier
[16:24:19] [PASSED] X0L2 Modifier for inexistent plane
[16:24:19] =========== [PASSED] drm_test_framebuffer_create ===========
[16:24:19] [PASSED] drm_test_framebuffer_free
[16:24:19] [PASSED] drm_test_framebuffer_init
[16:24:19] [PASSED] drm_test_framebuffer_init_bad_format
[16:24:19] [PASSED] drm_test_framebuffer_init_dev_mismatch
[16:24:19] [PASSED] drm_test_framebuffer_lookup
[16:24:19] [PASSED] drm_test_framebuffer_lookup_inexistent
[16:24:19] [PASSED] drm_test_framebuffer_modifiers_not_supported
[16:24:19] ================= [PASSED] drm_framebuffer =================
[16:24:19] ================ drm_gem_shmem (8 subtests) ================
[16:24:19] [PASSED] drm_gem_shmem_test_obj_create
[16:24:19] [PASSED] drm_gem_shmem_test_obj_create_private
[16:24:19] [PASSED] drm_gem_shmem_test_pin_pages
[16:24:19] [PASSED] drm_gem_shmem_test_vmap
[16:24:19] [PASSED] drm_gem_shmem_test_get_sg_table
[16:24:19] [PASSED] drm_gem_shmem_test_get_pages_sgt
[16:24:19] [PASSED] drm_gem_shmem_test_madvise
[16:24:19] [PASSED] drm_gem_shmem_test_purge
[16:24:19] ================== [PASSED] drm_gem_shmem ==================
[16:24:19] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[16:24:19] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[16:24:19] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[16:24:19] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[16:24:19] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[16:24:19] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[16:24:19] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[16:24:19] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[16:24:19] [PASSED] Automatic
[16:24:19] [PASSED] Full
[16:24:19] [PASSED] Limited 16:235
[16:24:19] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[16:24:19] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[16:24:19] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[16:24:19] [PASSED] drm_test_check_disable_connector
[16:24:19] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[16:24:19] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[16:24:19] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[16:24:19] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[16:24:19] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[16:24:19] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[16:24:19] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[16:24:19] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[16:24:19] [PASSED] drm_test_check_output_bpc_dvi
[16:24:19] [PASSED] drm_test_check_output_bpc_format_vic_1
[16:24:19] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[16:24:19] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[16:24:19] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[16:24:19] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[16:24:19] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[16:24:19] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[16:24:19] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[16:24:19] ============ drm_test_check_hdmi_color_format  =============
[16:24:19] [PASSED] AUTO -> RGB
[16:24:19] [PASSED] YCBCR422 -> YUV422
[16:24:19] [PASSED] YCBCR420 -> YUV420
[16:24:19] [PASSED] YCBCR444 -> YUV444
[16:24:19] [PASSED] RGB -> RGB
[16:24:19] ======== [PASSED] drm_test_check_hdmi_color_format =========
[16:24:19] ======== drm_test_check_hdmi_color_format_420_only  ========
[16:24:19] [PASSED] RGB should fail
[16:24:19] [PASSED] YUV444 should fail
[16:24:19] [PASSED] YUV422 should fail
[16:24:19] [PASSED] YUV420 should work
[16:24:19] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[16:24:19] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[16:24:19] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[16:24:19] [PASSED] drm_test_check_broadcast_rgb_value
[16:24:19] [PASSED] drm_test_check_bpc_8_value
[16:24:19] [PASSED] drm_test_check_bpc_10_value
[16:24:19] [PASSED] drm_test_check_bpc_12_value
[16:24:19] [PASSED] drm_test_check_format_value
[16:24:19] [PASSED] drm_test_check_tmds_char_value
[16:24:19] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[16:24:19] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[16:24:19] [PASSED] drm_test_check_mode_valid
[16:24:19] [PASSED] drm_test_check_mode_valid_reject
[16:24:19] [PASSED] drm_test_check_mode_valid_reject_rate
[16:24:19] [PASSED] drm_test_check_mode_valid_reject_max_clock
[16:24:19] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[16:24:19] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[16:24:19] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[16:24:19] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[16:24:19] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[16:24:19] [PASSED] drm_test_check_infoframes
[16:24:19] [PASSED] drm_test_check_reject_avi_infoframe
[16:24:19] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[16:24:19] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[16:24:19] [PASSED] drm_test_check_reject_audio_infoframe
[16:24:19] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[16:24:19] ================= drm_managed (2 subtests) =================
[16:24:19] [PASSED] drm_test_managed_release_action
[16:24:19] [PASSED] drm_test_managed_run_action
[16:24:19] =================== [PASSED] drm_managed ===================
[16:24:19] =================== drm_mm (6 subtests) ====================
[16:24:19] [PASSED] drm_test_mm_init
[16:24:19] [PASSED] drm_test_mm_debug
[16:24:19] [PASSED] drm_test_mm_align32
[16:24:19] [PASSED] drm_test_mm_align64
[16:24:19] [PASSED] drm_test_mm_lowest
[16:24:19] [PASSED] drm_test_mm_highest
[16:24:19] ===================== [PASSED] drm_mm ======================
[16:24:19] ============= drm_modes_analog_tv (5 subtests) =============
[16:24:19] [PASSED] drm_test_modes_analog_tv_mono_576i
[16:24:19] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[16:24:19] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[16:24:19] [PASSED] drm_test_modes_analog_tv_pal_576i
[16:24:19] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[16:24:19] =============== [PASSED] drm_modes_analog_tv ===============
[16:24:19] ============== drm_plane_helper (2 subtests) ===============
[16:24:19] =============== drm_test_check_plane_state  ================
[16:24:19] [PASSED] clipping_simple
[16:24:19] [PASSED] clipping_rotate_reflect
[16:24:19] [PASSED] positioning_simple
[16:24:19] [PASSED] upscaling
[16:24:19] [PASSED] downscaling
[16:24:19] [PASSED] rounding1
[16:24:19] [PASSED] rounding2
[16:24:19] [PASSED] rounding3
[16:24:19] [PASSED] rounding4
[16:24:19] =========== [PASSED] drm_test_check_plane_state ============
[16:24:19] =========== drm_test_check_invalid_plane_state  ============
[16:24:19] [PASSED] positioning_invalid
[16:24:19] [PASSED] upscaling_invalid
[16:24:19] [PASSED] downscaling_invalid
[16:24:19] ======= [PASSED] drm_test_check_invalid_plane_state ========
[16:24:19] ================ [PASSED] drm_plane_helper =================
[16:24:19] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[16:24:19] ====== drm_test_connector_helper_tv_get_modes_check  =======
[16:24:19] [PASSED] None
[16:24:19] [PASSED] PAL
[16:24:19] [PASSED] NTSC
[16:24:19] [PASSED] Both, NTSC Default
[16:24:19] [PASSED] Both, PAL Default
[16:24:19] [PASSED] Both, NTSC Default, with PAL on command-line
[16:24:19] [PASSED] Both, PAL Default, with NTSC on command-line
[16:24:19] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[16:24:19] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[16:24:19] ================== drm_rect (9 subtests) ===================
[16:24:19] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[16:24:19] [PASSED] drm_test_rect_clip_scaled_not_clipped
[16:24:19] [PASSED] drm_test_rect_clip_scaled_clipped
[16:24:19] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[16:24:19] ================= drm_test_rect_intersect  =================
[16:24:19] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[16:24:19] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[16:24:19] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[16:24:19] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[16:24:19] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[16:24:19] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[16:24:19] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[16:24:19] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[16:24:19] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[16:24:19] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[16:24:19] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[16:24:19] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[16:24:19] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[16:24:19] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[16:24:19] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[16:24:19] ============= [PASSED] drm_test_rect_intersect =============
[16:24:19] ================ drm_test_rect_calc_hscale  ================
[16:24:19] [PASSED] normal use
[16:24:19] [PASSED] out of max range
[16:24:19] [PASSED] out of min range
[16:24:19] [PASSED] zero dst
[16:24:19] [PASSED] negative src
[16:24:19] [PASSED] negative dst
[16:24:19] ============ [PASSED] drm_test_rect_calc_hscale ============
[16:24:19] ================ drm_test_rect_calc_vscale  ================
[16:24:19] [PASSED] normal use
[16:24:19] [PASSED] out of max range
[16:24:19] [PASSED] out of min range
[16:24:19] [PASSED] zero dst
[16:24:19] [PASSED] negative src
[16:24:19] [PASSED] negative dst
[16:24:19] ============ [PASSED] drm_test_rect_calc_vscale ============
[16:24:19] ================== drm_test_rect_rotate  ===================
[16:24:19] [PASSED] reflect-x
[16:24:19] [PASSED] reflect-y
[16:24:19] [PASSED] rotate-0
[16:24:19] [PASSED] rotate-90
[16:24:19] [PASSED] rotate-180
[16:24:19] [PASSED] rotate-270
[16:24:19] ============== [PASSED] drm_test_rect_rotate ===============
[16:24:19] ================ drm_test_rect_rotate_inv  =================
[16:24:19] [PASSED] reflect-x
[16:24:19] [PASSED] reflect-y
[16:24:19] [PASSED] rotate-0
[16:24:19] [PASSED] rotate-90
[16:24:19] [PASSED] rotate-180
[16:24:19] [PASSED] rotate-270
[16:24:19] ============ [PASSED] drm_test_rect_rotate_inv =============
[16:24:19] ==================== [PASSED] drm_rect =====================
[16:24:19] ============ drm_sysfb_modeset_test (1 subtest) ============
[16:24:19] ============ drm_test_sysfb_build_fourcc_list  =============
[16:24:19] [PASSED] no native formats
[16:24:19] [PASSED] XRGB8888 as native format
[16:24:19] [PASSED] remove duplicates
[16:24:19] [PASSED] convert alpha formats
[16:24:19] [PASSED] random formats
[16:24:19] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[16:24:19] ============= [PASSED] drm_sysfb_modeset_test ==============
[16:24:19] ================== drm_fixp (2 subtests) ===================
[16:24:19] [PASSED] drm_test_int2fixp
[16:24:19] [PASSED] drm_test_sm2fixp
[16:24:19] ==================== [PASSED] drm_fixp =====================
[16:24:19] ============================================================
[16:24:19] Testing complete. Ran 641 tests: passed: 641
[16:24:19] Elapsed time: 27.305s total, 1.772s configuring, 25.364s building, 0.151s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[16:24:19] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:24:21] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[16:24:31] Starting KUnit Kernel (1/1)...
[16:24:31] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[16:24:31] ============= refcount_interrupt (4 subtests) ==============
[16:24:31] [PASSED] test_single_irq_change
[16:24:31] [PASSED] test_nested_irq_change
[16:24:31] [PASSED] test_multiple_irq_change
[16:24:31] [PASSED] test_irq_save
[16:24:31] =============== [PASSED] refcount_interrupt ================
[16:24:31] ================= ttm_device (5 subtests) ==================
[16:24:31] [PASSED] ttm_device_init_basic
[16:24:31] [PASSED] ttm_device_init_multiple
[16:24:31] [PASSED] ttm_device_fini_basic
[16:24:31] [PASSED] ttm_device_init_no_vma_man
[16:24:31] ================== ttm_device_init_pools  ==================
[16:24:31] [PASSED] No DMA allocations, no DMA32 required
[16:24:31] [PASSED] DMA allocations, DMA32 required
[16:24:31] [PASSED] No DMA allocations, DMA32 required
[16:24:31] [PASSED] DMA allocations, no DMA32 required
[16:24:31] ============== [PASSED] ttm_device_init_pools ==============
[16:24:31] =================== [PASSED] ttm_device ====================
[16:24:31] ================== ttm_pool (8 subtests) ===================
[16:24:31] ================== ttm_pool_alloc_basic  ===================
[16:24:31] [PASSED] One page
[16:24:31] [PASSED] More than one page
[16:24:31] [PASSED] Above the allocation limit
[16:24:31] [PASSED] One page, with coherent DMA mappings enabled
[16:24:31] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[16:24:31] ============== [PASSED] ttm_pool_alloc_basic ===============
[16:24:31] ============== ttm_pool_alloc_basic_dma_addr  ==============
[16:24:31] [PASSED] One page
[16:24:31] [PASSED] More than one page
[16:24:31] [PASSED] Above the allocation limit
[16:24:31] [PASSED] One page, with coherent DMA mappings enabled
[16:24:31] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[16:24:31] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[16:24:31] [PASSED] ttm_pool_alloc_order_caching_match
[16:24:31] [PASSED] ttm_pool_alloc_caching_mismatch
[16:24:31] [PASSED] ttm_pool_alloc_order_mismatch
[16:24:31] [PASSED] ttm_pool_free_dma_alloc
[16:24:31] [PASSED] ttm_pool_free_no_dma_alloc
[16:24:31] [PASSED] ttm_pool_fini_basic
[16:24:31] ==================== [PASSED] ttm_pool =====================
[16:24:31] ================ ttm_resource (8 subtests) =================
[16:24:31] ================= ttm_resource_init_basic  =================
[16:24:31] [PASSED] Init resource in TTM_PL_SYSTEM
[16:24:31] [PASSED] Init resource in TTM_PL_VRAM
[16:24:31] [PASSED] Init resource in a private placement
[16:24:31] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[16:24:31] ============= [PASSED] ttm_resource_init_basic =============
[16:24:31] [PASSED] ttm_resource_init_pinned
[16:24:31] [PASSED] ttm_resource_fini_basic
[16:24:31] [PASSED] ttm_resource_manager_init_basic
[16:24:31] [PASSED] ttm_resource_manager_usage_basic
[16:24:31] [PASSED] ttm_resource_manager_set_used_basic
[16:24:31] [PASSED] ttm_sys_man_alloc_basic
[16:24:31] [PASSED] ttm_sys_man_free_basic
[16:24:31] ================== [PASSED] ttm_resource ===================
[16:24:31] =================== ttm_tt (15 subtests) ===================
[16:24:31] ==================== ttm_tt_init_basic  ====================
[16:24:31] [PASSED] Page-aligned size
[16:24:31] [PASSED] Extra pages requested
[16:24:31] ================ [PASSED] ttm_tt_init_basic ================
[16:24:31] [PASSED] ttm_tt_init_misaligned
[16:24:31] [PASSED] ttm_tt_fini_basic
[16:24:31] [PASSED] ttm_tt_fini_sg
[16:24:31] [PASSED] ttm_tt_fini_shmem
[16:24:31] [PASSED] ttm_tt_create_basic
[16:24:31] [PASSED] ttm_tt_create_invalid_bo_type
[16:24:31] [PASSED] ttm_tt_create_ttm_exists
[16:24:31] [PASSED] ttm_tt_create_failed
[16:24:31] [PASSED] ttm_tt_destroy_basic
[16:24:31] [PASSED] ttm_tt_populate_null_ttm
[16:24:31] [PASSED] ttm_tt_populate_populated_ttm
[16:24:31] [PASSED] ttm_tt_unpopulate_basic
[16:24:31] [PASSED] ttm_tt_unpopulate_empty_ttm
[16:24:31] [PASSED] ttm_tt_swapin_basic
[16:24:31] ===================== [PASSED] ttm_tt ======================
[16:24:31] =================== ttm_bo (14 subtests) ===================
[16:24:31] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[16:24:31] [PASSED] Cannot be interrupted and sleeps
[16:24:31] [PASSED] Cannot be interrupted, locks straight away
[16:24:31] [PASSED] Can be interrupted, sleeps
[16:24:31] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[16:24:31] [PASSED] ttm_bo_reserve_locked_no_sleep
[16:24:31] [PASSED] ttm_bo_reserve_no_wait_ticket
[16:24:32] [PASSED] ttm_bo_reserve_double_resv
[16:24:32] [PASSED] ttm_bo_reserve_interrupted
[16:24:32] [PASSED] ttm_bo_reserve_deadlock
[16:24:32] [PASSED] ttm_bo_unreserve_basic
[16:24:32] [PASSED] ttm_bo_unreserve_pinned
[16:24:32] [PASSED] ttm_bo_unreserve_bulk
[16:24:32] [PASSED] ttm_bo_fini_basic
[16:24:32] [PASSED] ttm_bo_fini_shared_resv
[16:24:32] [PASSED] ttm_bo_pin_basic
[16:24:32] [PASSED] ttm_bo_pin_unpin_resource
[16:24:32] [PASSED] ttm_bo_multiple_pin_one_unpin
[16:24:32] ===================== [PASSED] ttm_bo ======================
[16:24:32] ============== ttm_bo_validate (22 subtests) ===============
[16:24:32] ============== ttm_bo_init_reserved_sys_man  ===============
[16:24:32] [PASSED] Buffer object for userspace
[16:24:32] [PASSED] Kernel buffer object
[16:24:32] [PASSED] Shared buffer object
[16:24:32] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[16:24:32] ============== ttm_bo_init_reserved_mock_man  ==============
[16:24:32] [PASSED] Buffer object for userspace
[16:24:32] [PASSED] Kernel buffer object
[16:24:32] [PASSED] Shared buffer object
[16:24:32] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[16:24:32] [PASSED] ttm_bo_init_reserved_resv
[16:24:32] ================== ttm_bo_validate_basic  ==================
[16:24:32] [PASSED] Buffer object for userspace
[16:24:32] [PASSED] Kernel buffer object
[16:24:32] [PASSED] Shared buffer object
[16:24:32] ============== [PASSED] ttm_bo_validate_basic ==============
[16:24:32] [PASSED] ttm_bo_validate_invalid_placement
[16:24:32] ============= ttm_bo_validate_same_placement  ==============
[16:24:32] [PASSED] System manager
[16:24:32] [PASSED] VRAM manager
[16:24:32] ========= [PASSED] ttm_bo_validate_same_placement ==========
[16:24:32] [PASSED] ttm_bo_validate_failed_alloc
[16:24:32] [PASSED] ttm_bo_validate_pinned
[16:24:32] [PASSED] ttm_bo_validate_busy_placement
[16:24:32] ================ ttm_bo_validate_multihop  =================
[16:24:32] [PASSED] Buffer object for userspace
[16:24:32] [PASSED] Kernel buffer object
[16:24:32] [PASSED] Shared buffer object
[16:24:32] ============ [PASSED] ttm_bo_validate_multihop =============
[16:24:32] ========== ttm_bo_validate_no_placement_signaled  ==========
[16:24:32] [PASSED] Buffer object in system domain, no page vector
[16:24:32] [PASSED] Buffer object in system domain with an existing page vector
[16:24:32] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[16:24:32] ======== ttm_bo_validate_no_placement_not_signaled  ========
[16:24:32] [PASSED] Buffer object for userspace
[16:24:32] [PASSED] Kernel buffer object
[16:24:32] [PASSED] Shared buffer object
[16:24:32] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[16:24:32] [PASSED] ttm_bo_validate_move_fence_signaled
[16:24:32] ========= ttm_bo_validate_move_fence_not_signaled  =========
[16:24:32] [PASSED] Waits for GPU
[16:24:32] [PASSED] Tries to lock straight away
[16:24:32] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[16:24:32] [PASSED] ttm_bo_validate_swapout
[16:24:32] [PASSED] ttm_bo_validate_happy_evict
[16:24:32] [PASSED] ttm_bo_validate_all_pinned_evict
[16:24:32] [PASSED] ttm_bo_validate_allowed_only_evict
[16:24:32] [PASSED] ttm_bo_validate_deleted_evict
[16:24:32] [PASSED] ttm_bo_validate_busy_domain_evict
[16:24:32] [PASSED] ttm_bo_validate_evict_gutting
[16:24:32] [PASSED] ttm_bo_validate_recrusive_evict
[16:24:32] ================= [PASSED] ttm_bo_validate =================
[16:24:32] ============================================================
[16:24:32] Testing complete. Ran 106 tests: passed: 106
[16:24:32] Elapsed time: 12.242s total, 1.827s configuring, 10.200s building, 0.182s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/dma-buf/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[16:24:32] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:24:34] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[16:24:42] Starting KUnit Kernel (1/1)...
[16:24:42] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[16:24:42] ============= refcount_interrupt (4 subtests) ==============
[16:24:42] [PASSED] test_single_irq_change
[16:24:42] [PASSED] test_nested_irq_change
[16:24:42] [PASSED] test_multiple_irq_change
[16:24:42] [PASSED] test_irq_save
[16:24:42] =============== [PASSED] refcount_interrupt ================
[16:24:42] =============== dma-buf-fence (12 subtests) ================
[16:24:42] [PASSED] test_sanitycheck
[16:24:42] [PASSED] test_signaling
[16:24:42] [PASSED] test_add_callback
[16:24:42] [PASSED] test_late_add_callback
[16:24:42] [PASSED] test_rm_callback
[16:24:42] [PASSED] test_late_rm_callback
[16:24:42] [PASSED] test_status
[16:24:42] [PASSED] test_error
[16:24:42] [PASSED] test_wait
[16:24:42] [PASSED] test_wait_timeout
[16:24:42] [PASSED] test_stub
[16:24:42] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[16:24:42] ================== [PASSED] dma-buf-fence ==================
[16:24:42] ============ dma-buf-fence-chain (11 subtests) =============
[16:24:42] [PASSED] test_sanitycheck
[16:24:42] [PASSED] test_find_seqno
[16:24:42] [PASSED] test_find_signaled
[16:24:42] [PASSED] test_find_out_of_order
[16:24:48] [PASSED] test_find_gap
[16:24:48] [PASSED] test_find_race
[16:24:48] [PASSED] test_signal_forward
[16:24:48] [PASSED] test_signal_backward
[16:24:48] [PASSED] test_wait_forward
[16:24:48] [PASSED] test_wait_backward
[16:24:48] [PASSED] test_wait_random
[16:24:48] =============== [PASSED] dma-buf-fence-chain ===============
[16:24:48] ============ dma-buf-fence-unwrap (10 subtests) ============
[16:24:48] [PASSED] test_sanitycheck
[16:24:48] [PASSED] test_unwrap_array
[16:24:48] [PASSED] test_unwrap_chain
[16:24:48] [PASSED] test_unwrap_chain_array
[16:24:48] [PASSED] test_unwrap_merge
[16:24:48] [PASSED] test_unwrap_merge_duplicate
[16:24:48] [PASSED] test_unwrap_merge_seqno
[16:24:48] [PASSED] test_unwrap_merge_order
[16:24:48] [PASSED] test_unwrap_merge_complex
[16:24:48] [PASSED] test_unwrap_merge_complex_seqno
[16:24:48] ============== [PASSED] dma-buf-fence-unwrap ===============
[16:24:48] ================ dma-buf-resv (5 subtests) =================
[16:24:48] [PASSED] test_sanitycheck
[16:24:48] ===================== test_signaling  ======================
[16:24:48] [PASSED] kernel
[16:24:48] [PASSED] write
[16:24:48] [PASSED] read
[16:24:48] [PASSED] bookkeep
[16:24:48] ================= [PASSED] test_signaling ==================
[16:24:48] ====================== test_for_each  ======================
[16:24:48] [PASSED] kernel
[16:24:48] [PASSED] write
[16:24:48] [PASSED] read
[16:24:48] [PASSED] bookkeep
[16:24:48] ================== [PASSED] test_for_each ==================
[16:24:48] ================= test_for_each_unlocked  ==================
[16:24:48] [PASSED] kernel
[16:24:48] [PASSED] write
[16:24:48] [PASSED] read
[16:24:48] [PASSED] bookkeep
[16:24:48] ============= [PASSED] test_for_each_unlocked ==============
[16:24:48] ===================== test_get_fences  =====================
[16:24:48] [PASSED] kernel
[16:24:48] [PASSED] write
[16:24:48] [PASSED] read
[16:24:48] [PASSED] bookkeep
[16:24:48] ================= [PASSED] test_get_fences =================
[16:24:48] ================== [PASSED] dma-buf-resv ===================
[16:24:48] ============================================================
[16:24:48] Testing complete. Ran 54 tests: passed: 53, skipped: 1
[16:24:48] Elapsed time: 15.941s total, 1.811s configuring, 8.758s building, 5.344s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


