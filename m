Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A464FC982C1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 22:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E0810E2DD;
	Wed, 16 Sep 2026 22:15:02 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D87210E2DD;
 Wed, 16 Sep 2026 22:15:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/pf=3A_Move_locking_to_x?=
 =?utf-8?q?e=5Fsriov=5Fpf=5Freprovision=5Fdefault?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Sep 2026 22:15:00 -0000
Message-ID: <178959690044.174773.12454141585569997827@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260916212949.13120-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260916212949.13120-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Move locking to xe_sriov_pf_reprovision_default
URL   : https://patchwork.freedesktop.org/series/174369/
State : success

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[22:12:58] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:13:02] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[22:13:22] Starting KUnit Kernel (1/1)...
[22:13:22] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:13:22] ============= refcount_interrupt (4 subtests) ==============
[22:13:22] [PASSED] test_single_irq_change
[22:13:22] [PASSED] test_nested_irq_change
[22:13:22] [PASSED] test_multiple_irq_change
[22:13:22] [PASSED] test_irq_save
[22:13:22] =============== [PASSED] refcount_interrupt ================
[22:13:22] ================= gpu_buddy (14 subtests) ==================
[22:13:22] [PASSED] gpu_test_buddy_alloc_limit
[22:13:22] [PASSED] gpu_test_buddy_alloc_optimistic
[22:13:22] [PASSED] gpu_test_buddy_alloc_pessimistic
[22:13:22] [PASSED] gpu_test_buddy_alloc_pathological
[22:13:22] [PASSED] gpu_test_buddy_alloc_contiguous
[22:13:22] [PASSED] gpu_test_buddy_alloc_clear
[22:13:22] [PASSED] gpu_test_buddy_alloc_range
[22:13:22] [PASSED] gpu_test_buddy_alloc_range_bias
[22:13:23] [PASSED] gpu_test_buddy_fragmentation_performance
[22:13:24] [PASSED] gpu_test_buddy_dirty_tracker_performance
[22:13:24] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[22:13:24] [PASSED] gpu_test_buddy_offset_aligned_allocation
[22:13:24] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[22:13:24] [PASSED] gpu_test_buddy_addr_to_block
[22:13:24] ==================== [PASSED] gpu_buddy ====================
[22:13:24] ============================================================
[22:13:24] Testing complete. Ran 18 tests: passed: 18
[22:13:24] Elapsed time: 26.197s total, 4.357s configuring, 19.873s building, 1.920s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[22:13:24] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:13:26] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[22:13:59] Starting KUnit Kernel (1/1)...
[22:13:59] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:14:00] ============= refcount_interrupt (4 subtests) ==============
[22:14:00] [PASSED] test_single_irq_change
[22:14:00] [PASSED] test_nested_irq_change
[22:14:00] [PASSED] test_multiple_irq_change
[22:14:00] [PASSED] test_irq_save
[22:14:00] =============== [PASSED] refcount_interrupt ================
[22:14:00] ================== guc_buf (11 subtests) ===================
[22:14:00] [PASSED] test_smallest
[22:14:00] [PASSED] test_largest
[22:14:00] [PASSED] test_granular
[22:14:00] [PASSED] test_unique
[22:14:00] [PASSED] test_overlap
[22:14:00] [PASSED] test_reusable
[22:14:00] [PASSED] test_too_big
[22:14:00] [PASSED] test_flush
[22:14:00] [PASSED] test_lookup
[22:14:00] [PASSED] test_data
[22:14:00] [PASSED] test_class
[22:14:00] ===================== [PASSED] guc_buf =====================
[22:14:00] =================== guc_dbm (7 subtests) ===================
[22:14:00] [PASSED] test_empty
[22:14:00] [PASSED] test_default
[22:14:00] ======================== test_size  ========================
[22:14:00] [PASSED] 4
[22:14:00] [PASSED] 8
[22:14:00] [PASSED] 32
[22:14:00] [PASSED] 256
[22:14:00] ==================== [PASSED] test_size ====================
[22:14:00] ======================= test_reuse  ========================
[22:14:00] [PASSED] 4
[22:14:00] [PASSED] 8
[22:14:00] [PASSED] 32
[22:14:00] [PASSED] 256
[22:14:00] =================== [PASSED] test_reuse ====================
[22:14:00] =================== test_range_overlap  ====================
[22:14:00] [PASSED] 4
[22:14:00] [PASSED] 8
[22:14:00] [PASSED] 32
[22:14:00] [PASSED] 256
[22:14:00] =============== [PASSED] test_range_overlap ================
[22:14:00] =================== test_range_compact  ====================
[22:14:00] [PASSED] 4
[22:14:00] [PASSED] 8
[22:14:00] [PASSED] 32
[22:14:00] [PASSED] 256
[22:14:00] =============== [PASSED] test_range_compact ================
[22:14:00] ==================== test_range_spare  =====================
[22:14:00] [PASSED] 4
[22:14:00] [PASSED] 8
[22:14:00] [PASSED] 32
[22:14:00] [PASSED] 256
[22:14:00] ================ [PASSED] test_range_spare =================
[22:14:00] ===================== [PASSED] guc_dbm =====================
[22:14:00] =================== guc_idm (6 subtests) ===================
[22:14:00] [PASSED] bad_init
[22:14:00] [PASSED] no_init
[22:14:00] [PASSED] init_fini
[22:14:00] [PASSED] check_used
[22:14:00] [PASSED] check_quota
[22:14:00] [PASSED] check_all
[22:14:00] ===================== [PASSED] guc_idm =====================
[22:14:00] =============== guc_klv_helpers (9 subtests) ===============
[22:14:00] [PASSED] test_count
[22:14:00] [PASSED] test_encode_u32
[22:14:00] [PASSED] test_encode_u64
[22:14:00] [PASSED] test_encode_string
[22:14:00] [PASSED] test_encode_object_raw
[22:14:00] [PASSED] test_encode_object_klv
[22:14:00] [PASSED] test_encode_object_nested
[22:14:00] [PASSED] test_encode_object_basic
[22:14:00] [PASSED] test_print
[22:14:00] ================= [PASSED] guc_klv_helpers =================
[22:14:00] =================== xe_log (4 subtests) ====================
[22:14:00] [PASSED] demo_cper
[22:14:00] [PASSED] demo_dmesg
[22:14:00] ======================= test_dmesg  ========================
[22:14:00] [PASSED] test_fatal
[22:14:00] [PASSED] test_fatal_tile
[22:14:00] [PASSED] test_fatal_gt
[22:14:00] [PASSED] test_fatal_comp
[22:14:00] [PASSED] test_fatal_comp_tile
[22:14:00] [PASSED] test_fatal_comp_gt
[22:14:00] [PASSED] test_fatal_all
[22:14:00] [PASSED] test_recoverable
[22:14:00] [PASSED] test_recoverable_tile
[22:14:00] [PASSED] test_recoverable_gt
[22:14:00] [PASSED] test_recoverable_comp
[22:14:00] [PASSED] test_recoverable_comp_tile
[22:14:00] [PASSED] test_recoverable_comp_gt
[22:14:00] [PASSED] test_recoverable_all
[22:14:00] [PASSED] test_info
[22:14:00] [PASSED] test_info_tile
[22:14:00] [PASSED] test_info_gt
[22:14:00] [PASSED] test_info_err
[22:14:00] [PASSED] test_info_comp
[22:14:00] [PASSED] test_info_comp_tile
[22:14:00] [PASSED] test_info_comp_gt
[22:14:00] [PASSED] test_info_all
[22:14:00] [PASSED] test_hw_fatal
[22:14:00] [PASSED] test_hw_recoverable
[22:14:00] [PASSED] test_hw_corrected
[22:14:00] [PASSED] test_hw_informational
[22:14:00] =================== [PASSED] test_dmesg ====================
[22:14:00] ====================== test_invalid  =======================
[22:14:00] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[22:14:00] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[22:14:00] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[22:14:00] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[22:14:00] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[22:14:00] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[22:14:00] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[22:14:00] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[22:14:00] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[22:14:00] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[22:14:00] ================== [SKIPPED] test_invalid ==================
[22:14:00] ===================== [PASSED] xe_log ======================
[22:14:00] ================== no_relay (3 subtests) ===================
[22:14:00] [PASSED] xe_drops_guc2pf_if_not_ready
[22:14:00] [PASSED] xe_drops_guc2vf_if_not_ready
[22:14:00] [PASSED] xe_rejects_send_if_not_ready
[22:14:00] ==================== [PASSED] no_relay =====================
[22:14:00] ================== pf_relay (14 subtests) ==================
[22:14:00] [PASSED] pf_rejects_guc2pf_too_short
[22:14:00] [PASSED] pf_rejects_guc2pf_too_long
[22:14:00] [PASSED] pf_rejects_guc2pf_no_payload
[22:14:00] [PASSED] pf_fails_no_payload
[22:14:00] [PASSED] pf_fails_bad_origin
[22:14:00] [PASSED] pf_fails_bad_type
[22:14:00] [PASSED] pf_txn_reports_error
[22:14:00] [PASSED] pf_txn_sends_pf2guc
[22:14:00] [PASSED] pf_sends_pf2guc
[22:14:00] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[22:14:00] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[22:14:00] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[22:14:00] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[22:14:00] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[22:14:00] ==================== [PASSED] pf_relay =====================
[22:14:00] ================== vf_relay (3 subtests) ===================
[22:14:00] [PASSED] vf_rejects_guc2vf_too_short
[22:14:00] [PASSED] vf_rejects_guc2vf_too_long
[22:14:00] [PASSED] vf_rejects_guc2vf_no_payload
[22:14:00] ==================== [PASSED] vf_relay =====================
[22:14:00] ================ pf_gt_config (9 subtests) =================
[22:14:00] [PASSED] fair_contexts_1vf
[22:14:00] [PASSED] fair_doorbells_1vf
[22:14:00] [PASSED] fair_ggtt_1vf
[22:14:00] ====================== fair_vram_1vf  ======================
[22:14:00] [PASSED] 3.50 GiB
[22:14:00] [PASSED] 11.5 GiB
[22:14:00] [PASSED] 15.5 GiB
[22:14:00] [PASSED] 31.5 GiB
[22:14:00] [PASSED] 63.5 GiB
[22:14:00] [PASSED] 1.91 GiB
[22:14:00] ================== [PASSED] fair_vram_1vf ==================
[22:14:00] ================ fair_vram_1vf_admin_only  =================
[22:14:00] [PASSED] 3.50 GiB
[22:14:00] [PASSED] 11.5 GiB
[22:14:00] [PASSED] 15.5 GiB
[22:14:00] [PASSED] 31.5 GiB
[22:14:00] [PASSED] 63.5 GiB
[22:14:00] [PASSED] 1.91 GiB
[22:14:00] ============ [PASSED] fair_vram_1vf_admin_only =============
[22:14:00] ====================== fair_contexts  ======================
[22:14:00] [PASSED] 1 VF
[22:14:00] [PASSED] 2 VFs
[22:14:00] [PASSED] 3 VFs
[22:14:00] [PASSED] 4 VFs
[22:14:00] [PASSED] 5 VFs
[22:14:00] [PASSED] 6 VFs
[22:14:00] [PASSED] 7 VFs
[22:14:00] [PASSED] 8 VFs
[22:14:00] [PASSED] 9 VFs
[22:14:00] [PASSED] 10 VFs
[22:14:00] [PASSED] 11 VFs
[22:14:00] [PASSED] 12 VFs
[22:14:00] [PASSED] 13 VFs
[22:14:00] [PASSED] 14 VFs
[22:14:00] [PASSED] 15 VFs
[22:14:00] [PASSED] 16 VFs
[22:14:00] [PASSED] 17 VFs
[22:14:00] [PASSED] 18 VFs
[22:14:00] [PASSED] 19 VFs
[22:14:00] [PASSED] 20 VFs
[22:14:00] [PASSED] 21 VFs
[22:14:00] [PASSED] 22 VFs
[22:14:00] [PASSED] 23 VFs
[22:14:00] [PASSED] 24 VFs
[22:14:00] [PASSED] 25 VFs
[22:14:00] [PASSED] 26 VFs
[22:14:00] [PASSED] 27 VFs
[22:14:00] [PASSED] 28 VFs
[22:14:00] [PASSED] 29 VFs
[22:14:00] [PASSED] 30 VFs
[22:14:00] [PASSED] 31 VFs
[22:14:00] [PASSED] 32 VFs
[22:14:00] [PASSED] 33 VFs
[22:14:00] [PASSED] 34 VFs
[22:14:00] [PASSED] 35 VFs
[22:14:00] [PASSED] 36 VFs
[22:14:00] [PASSED] 37 VFs
[22:14:00] [PASSED] 38 VFs
[22:14:00] [PASSED] 39 VFs
[22:14:00] [PASSED] 40 VFs
[22:14:00] [PASSED] 41 VFs
[22:14:00] [PASSED] 42 VFs
[22:14:00] [PASSED] 43 VFs
[22:14:00] [PASSED] 44 VFs
[22:14:00] [PASSED] 45 VFs
[22:14:00] [PASSED] 46 VFs
[22:14:00] [PASSED] 47 VFs
[22:14:00] [PASSED] 48 VFs
[22:14:00] [PASSED] 49 VFs
[22:14:00] [PASSED] 50 VFs
[22:14:00] [PASSED] 51 VFs
[22:14:00] [PASSED] 52 VFs
[22:14:00] [PASSED] 53 VFs
[22:14:00] [PASSED] 54 VFs
[22:14:00] [PASSED] 55 VFs
[22:14:00] [PASSED] 56 VFs
[22:14:00] [PASSED] 57 VFs
[22:14:00] [PASSED] 58 VFs
[22:14:00] [PASSED] 59 VFs
[22:14:00] [PASSED] 60 VFs
[22:14:00] [PASSED] 61 VFs
[22:14:00] [PASSED] 62 VFs
[22:14:00] [PASSED] 63 VFs
[22:14:00] ================== [PASSED] fair_contexts ==================
[22:14:00] ===================== fair_doorbells  ======================
[22:14:00] [PASSED] 1 VF
[22:14:00] [PASSED] 2 VFs
[22:14:00] [PASSED] 3 VFs
[22:14:00] [PASSED] 4 VFs
[22:14:00] [PASSED] 5 VFs
[22:14:00] [PASSED] 6 VFs
[22:14:00] [PASSED] 7 VFs
[22:14:00] [PASSED] 8 VFs
[22:14:00] [PASSED] 9 VFs
[22:14:00] [PASSED] 10 VFs
[22:14:00] [PASSED] 11 VFs
[22:14:00] [PASSED] 12 VFs
[22:14:00] [PASSED] 13 VFs
[22:14:00] [PASSED] 14 VFs
[22:14:00] [PASSED] 15 VFs
[22:14:00] [PASSED] 16 VFs
[22:14:00] [PASSED] 17 VFs
[22:14:00] [PASSED] 18 VFs
[22:14:00] [PASSED] 19 VFs
[22:14:00] [PASSED] 20 VFs
[22:14:00] [PASSED] 21 VFs
[22:14:00] [PASSED] 22 VFs
[22:14:00] [PASSED] 23 VFs
[22:14:00] [PASSED] 24 VFs
[22:14:00] [PASSED] 25 VFs
[22:14:00] [PASSED] 26 VFs
[22:14:00] [PASSED] 27 VFs
[22:14:00] [PASSED] 28 VFs
[22:14:00] [PASSED] 29 VFs
[22:14:00] [PASSED] 30 VFs
[22:14:00] [PASSED] 31 VFs
[22:14:00] [PASSED] 32 VFs
[22:14:00] [PASSED] 33 VFs
[22:14:00] [PASSED] 34 VFs
[22:14:00] [PASSED] 35 VFs
[22:14:00] [PASSED] 36 VFs
[22:14:00] [PASSED] 37 VFs
[22:14:00] [PASSED] 38 VFs
[22:14:00] [PASSED] 39 VFs
[22:14:00] [PASSED] 40 VFs
[22:14:00] [PASSED] 41 VFs
[22:14:00] [PASSED] 42 VFs
[22:14:00] [PASSED] 43 VFs
[22:14:00] [PASSED] 44 VFs
[22:14:00] [PASSED] 45 VFs
[22:14:00] [PASSED] 46 VFs
[22:14:00] [PASSED] 47 VFs
[22:14:00] [PASSED] 48 VFs
[22:14:00] [PASSED] 49 VFs
[22:14:00] [PASSED] 50 VFs
[22:14:00] [PASSED] 51 VFs
[22:14:00] [PASSED] 52 VFs
[22:14:00] [PASSED] 53 VFs
[22:14:00] [PASSED] 54 VFs
[22:14:00] [PASSED] 55 VFs
[22:14:00] [PASSED] 56 VFs
[22:14:00] [PASSED] 57 VFs
[22:14:00] [PASSED] 58 VFs
[22:14:00] [PASSED] 59 VFs
[22:14:00] [PASSED] 60 VFs
[22:14:00] [PASSED] 61 VFs
[22:14:00] [PASSED] 62 VFs
[22:14:00] [PASSED] 63 VFs
[22:14:00] ================= [PASSED] fair_doorbells ==================
[22:14:00] ======================== fair_ggtt  ========================
[22:14:00] [PASSED] 1 VF
[22:14:00] [PASSED] 2 VFs
[22:14:00] [PASSED] 3 VFs
[22:14:00] [PASSED] 4 VFs
[22:14:00] [PASSED] 5 VFs
[22:14:00] [PASSED] 6 VFs
[22:14:00] [PASSED] 7 VFs
[22:14:00] [PASSED] 8 VFs
[22:14:00] [PASSED] 9 VFs
[22:14:00] [PASSED] 10 VFs
[22:14:00] [PASSED] 11 VFs
[22:14:00] [PASSED] 12 VFs
[22:14:00] [PASSED] 13 VFs
[22:14:00] [PASSED] 14 VFs
[22:14:00] [PASSED] 15 VFs
[22:14:00] [PASSED] 16 VFs
[22:14:00] [PASSED] 17 VFs
[22:14:00] [PASSED] 18 VFs
[22:14:00] [PASSED] 19 VFs
[22:14:00] [PASSED] 20 VFs
[22:14:00] [PASSED] 21 VFs
[22:14:00] [PASSED] 22 VFs
[22:14:00] [PASSED] 23 VFs
[22:14:00] [PASSED] 24 VFs
[22:14:00] [PASSED] 25 VFs
[22:14:00] [PASSED] 26 VFs
[22:14:00] [PASSED] 27 VFs
[22:14:00] [PASSED] 28 VFs
[22:14:00] [PASSED] 29 VFs
[22:14:00] [PASSED] 30 VFs
[22:14:00] [PASSED] 31 VFs
[22:14:00] [PASSED] 32 VFs
[22:14:00] [PASSED] 33 VFs
[22:14:00] [PASSED] 34 VFs
[22:14:00] [PASSED] 35 VFs
[22:14:00] [PASSED] 36 VFs
[22:14:00] [PASSED] 37 VFs
[22:14:00] [PASSED] 38 VFs
[22:14:00] [PASSED] 39 VFs
[22:14:00] [PASSED] 40 VFs
[22:14:00] [PASSED] 41 VFs
[22:14:00] [PASSED] 42 VFs
[22:14:00] [PASSED] 43 VFs
[22:14:00] [PASSED] 44 VFs
[22:14:00] [PASSED] 45 VFs
[22:14:00] [PASSED] 46 VFs
[22:14:00] [PASSED] 47 VFs
[22:14:00] [PASSED] 48 VFs
[22:14:00] [PASSED] 49 VFs
[22:14:00] [PASSED] 50 VFs
[22:14:00] [PASSED] 51 VFs
[22:14:00] [PASSED] 52 VFs
[22:14:00] [PASSED] 53 VFs
[22:14:00] [PASSED] 54 VFs
[22:14:00] [PASSED] 55 VFs
[22:14:00] [PASSED] 56 VFs
[22:14:00] [PASSED] 57 VFs
[22:14:00] [PASSED] 58 VFs
[22:14:00] [PASSED] 59 VFs
[22:14:00] [PASSED] 60 VFs
[22:14:00] [PASSED] 61 VFs
[22:14:00] [PASSED] 62 VFs
[22:14:00] [PASSED] 63 VFs
[22:14:00] ==================== [PASSED] fair_ggtt ====================
[22:14:00] ======================== fair_vram  ========================
[22:14:00] [PASSED] 1 VF
[22:14:00] [PASSED] 2 VFs
[22:14:00] [PASSED] 3 VFs
[22:14:00] [PASSED] 4 VFs
[22:14:00] [PASSED] 5 VFs
[22:14:00] [PASSED] 6 VFs
[22:14:00] [PASSED] 7 VFs
[22:14:00] [PASSED] 8 VFs
[22:14:00] [PASSED] 9 VFs
[22:14:00] [PASSED] 10 VFs
[22:14:00] [PASSED] 11 VFs
[22:14:00] [PASSED] 12 VFs
[22:14:00] [PASSED] 13 VFs
[22:14:00] [PASSED] 14 VFs
[22:14:00] [PASSED] 15 VFs
[22:14:00] [PASSED] 16 VFs
[22:14:00] [PASSED] 17 VFs
[22:14:00] [PASSED] 18 VFs
[22:14:00] [PASSED] 19 VFs
[22:14:00] [PASSED] 20 VFs
[22:14:00] [PASSED] 21 VFs
[22:14:00] [PASSED] 22 VFs
[22:14:00] [PASSED] 23 VFs
[22:14:00] [PASSED] 24 VFs
[22:14:00] [PASSED] 25 VFs
[22:14:00] [PASSED] 26 VFs
[22:14:00] [PASSED] 27 VFs
[22:14:00] [PASSED] 28 VFs
[22:14:00] [PASSED] 29 VFs
[22:14:00] [PASSED] 30 VFs
[22:14:00] [PASSED] 31 VFs
[22:14:00] [PASSED] 32 VFs
[22:14:00] [PASSED] 33 VFs
[22:14:00] [PASSED] 34 VFs
[22:14:00] [PASSED] 35 VFs
[22:14:00] [PASSED] 36 VFs
[22:14:00] [PASSED] 37 VFs
[22:14:00] [PASSED] 38 VFs
[22:14:00] [PASSED] 39 VFs
[22:14:00] [PASSED] 40 VFs
[22:14:00] [PASSED] 41 VFs
[22:14:00] [PASSED] 42 VFs
[22:14:00] [PASSED] 43 VFs
[22:14:00] [PASSED] 44 VFs
[22:14:00] [PASSED] 45 VFs
[22:14:00] [PASSED] 46 VFs
[22:14:00] [PASSED] 47 VFs
[22:14:00] [PASSED] 48 VFs
[22:14:00] [PASSED] 49 VFs
[22:14:00] [PASSED] 50 VFs
[22:14:00] [PASSED] 51 VFs
[22:14:00] [PASSED] 52 VFs
[22:14:00] [PASSED] 53 VFs
[22:14:00] [PASSED] 54 VFs
[22:14:00] [PASSED] 55 VFs
[22:14:00] [PASSED] 56 VFs
[22:14:00] [PASSED] 57 VFs
[22:14:00] [PASSED] 58 VFs
[22:14:00] [PASSED] 59 VFs
[22:14:00] [PASSED] 60 VFs
[22:14:00] [PASSED] 61 VFs
[22:14:00] [PASSED] 62 VFs
[22:14:00] [PASSED] 63 VFs
[22:14:00] ==================== [PASSED] fair_vram ====================
[22:14:00] ================== [PASSED] pf_gt_config ===================
[22:14:00] ===================== lmtt (1 subtest) =====================
[22:14:00] ======================== test_ops  =========================
[22:14:00] [PASSED] 2-level
[22:14:00] [PASSED] multi-level
[22:14:00] ==================== [PASSED] test_ops =====================
[22:14:00] ====================== [PASSED] lmtt =======================
[22:14:00] ================= sriov_packet (1 subtest) =================
[22:14:00] [PASSED] test_descriptor_init
[22:14:00] ================== [PASSED] sriov_packet ===================
[22:14:00] ================= pf_service (11 subtests) =================
[22:14:00] [PASSED] pf_negotiate_any
[22:14:00] [PASSED] pf_negotiate_base_match
[22:14:00] [PASSED] pf_negotiate_base_newer
[22:14:00] [PASSED] pf_negotiate_base_next
[22:14:00] [SKIPPED] pf_negotiate_base_older (no older minor)
[22:14:00] [PASSED] pf_negotiate_base_prev
[22:14:00] [PASSED] pf_negotiate_latest_match
[22:14:00] [PASSED] pf_negotiate_latest_newer
[22:14:00] [PASSED] pf_negotiate_latest_next
[22:14:00] [SKIPPED] pf_negotiate_latest_older (no older minor)
[22:14:00] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[22:14:00] =================== [PASSED] pf_service ====================
[22:14:00] ================= xe_guc_g2g (2 subtests) ==================
[22:14:00] ============== xe_live_guc_g2g_kunit_default  ==============
[22:14:00] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[22:14:00] ============== xe_live_guc_g2g_kunit_allmem  ===============
[22:14:00] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[22:14:00] =================== [SKIPPED] xe_guc_g2g ===================
[22:14:00] =================== xe_mocs (2 subtests) ===================
[22:14:00] ================ xe_live_mocs_kernel_kunit  ================
[22:14:00] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[22:14:00] ================ xe_live_mocs_reset_kunit  =================
[22:14:00] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[22:14:00] ==================== [SKIPPED] xe_mocs =====================
[22:14:00] ================= xe_migrate (2 subtests) ==================
[22:14:00] ================= xe_migrate_sanity_kunit  =================
[22:14:00] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[22:14:00] ================== xe_validate_ccs_kunit  ==================
[22:14:00] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[22:14:00] =================== [SKIPPED] xe_migrate ===================
[22:14:00] ================== xe_dma_buf (1 subtest) ==================
[22:14:00] ==================== xe_dma_buf_kunit  =====================
[22:14:00] ================ [SKIPPED] xe_dma_buf_kunit ================
[22:14:00] =================== [SKIPPED] xe_dma_buf ===================
[22:14:00] ================= xe_bo_shrink (1 subtest) =================
[22:14:00] =================== xe_bo_shrink_kunit  ====================
[22:14:00] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[22:14:00] ================== [SKIPPED] xe_bo_shrink ==================
[22:14:00] ==================== xe_bo (2 subtests) ====================
[22:14:00] ================== xe_ccs_migrate_kunit  ===================
[22:14:00] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[22:14:00] ==================== xe_bo_evict_kunit  ====================
[22:14:00] =============== [SKIPPED] xe_bo_evict_kunit ================
[22:14:00] ===================== [SKIPPED] xe_bo ======================
[22:14:00] =================== xe_any (9 subtests) ====================
[22:14:00] [PASSED] test_to_xe
[22:14:00] [PASSED] test_to_dev
[22:14:00] [PASSED] test_to_pdev
[22:14:00] [PASSED] test_to_drm
[22:14:00] [PASSED] test_if_pdev
[22:14:00] [PASSED] test_if_xe
[22:14:00] [PASSED] test_if_tile
[22:14:00] [PASSED] test_if_gt
[22:14:00] [PASSED] test_to_id
[22:14:00] ===================== [PASSED] xe_any ======================
[22:14:00] ==================== args (13 subtests) ====================
[22:14:00] [PASSED] count_args_test
[22:14:00] [PASSED] call_args_example
[22:14:00] [PASSED] call_args_test
[22:14:00] [PASSED] drop_first_arg_example
[22:14:00] [PASSED] drop_first_arg_test
[22:14:00] [PASSED] first_arg_example
[22:14:00] [PASSED] first_arg_test
[22:14:00] [PASSED] last_arg_example
[22:14:00] [PASSED] last_arg_test
[22:14:00] [PASSED] pick_arg_example
[22:14:00] [PASSED] if_args_example
[22:14:00] [PASSED] if_args_test
[22:14:00] [PASSED] sep_comma_example
[22:14:00] ====================== [PASSED] args =======================
[22:14:00] =================== xe_pci (3 subtests) ====================
[22:14:00] ==================== check_graphics_ip  ====================
[22:14:00] [PASSED] 12.00 Xe_LP
[22:14:00] [PASSED] 12.10 Xe_LP+
[22:14:00] [PASSED] 12.55 Xe_HPG
[22:14:00] [PASSED] 12.60 Xe_HPC
[22:14:00] [PASSED] 12.70 Xe_LPG
[22:14:00] [PASSED] 12.71 Xe_LPG
[22:14:00] [PASSED] 12.74 Xe_LPG+
[22:14:00] [PASSED] 20.01 Xe2_HPG
[22:14:00] [PASSED] 20.02 Xe2_HPG
[22:14:00] [PASSED] 20.04 Xe2_LPG
[22:14:00] [PASSED] 30.00 Xe3_LPG
[22:14:00] [PASSED] 30.01 Xe3_LPG
[22:14:00] [PASSED] 30.03 Xe3_LPG
[22:14:00] [PASSED] 30.04 Xe3_LPG
[22:14:00] [PASSED] 30.05 Xe3_LPG
[22:14:00] [PASSED] 35.10 Xe3p_LPG
[22:14:00] [PASSED] 35.11 Xe3p_XPC
[22:14:00] ================ [PASSED] check_graphics_ip ================
[22:14:00] ===================== check_media_ip  ======================
[22:14:00] [PASSED] 12.00 Xe_M
[22:14:00] [PASSED] 12.55 Xe_HPM
[22:14:00] [PASSED] 13.00 Xe_LPM+
[22:14:00] [PASSED] 13.01 Xe2_HPM
[22:14:00] [PASSED] 20.00 Xe2_LPM
[22:14:00] [PASSED] 30.00 Xe3_LPM
[22:14:00] [PASSED] 30.02 Xe3_LPM
[22:14:00] [PASSED] 35.00 Xe3p_LPM
[22:14:00] [PASSED] 35.03 Xe3p_HPM
[22:14:00] ================= [PASSED] check_media_ip ==================
[22:14:00] =================== check_platform_desc  ===================
[22:14:00] [PASSED] 0x9A60 (TIGERLAKE)
[22:14:00] [PASSED] 0x9A68 (TIGERLAKE)
[22:14:00] [PASSED] 0x9A70 (TIGERLAKE)
[22:14:00] [PASSED] 0x9A40 (TIGERLAKE)
[22:14:00] [PASSED] 0x9A49 (TIGERLAKE)
[22:14:00] [PASSED] 0x9A59 (TIGERLAKE)
[22:14:00] [PASSED] 0x9A78 (TIGERLAKE)
[22:14:00] [PASSED] 0x9AC0 (TIGERLAKE)
[22:14:00] [PASSED] 0x9AC9 (TIGERLAKE)
[22:14:00] [PASSED] 0x9AD9 (TIGERLAKE)
[22:14:00] [PASSED] 0x9AF8 (TIGERLAKE)
[22:14:00] [PASSED] 0x4C80 (ROCKETLAKE)
[22:14:00] [PASSED] 0x4C8A (ROCKETLAKE)
[22:14:00] [PASSED] 0x4C8B (ROCKETLAKE)
[22:14:00] [PASSED] 0x4C8C (ROCKETLAKE)
[22:14:00] [PASSED] 0x4C90 (ROCKETLAKE)
[22:14:00] [PASSED] 0x4C9A (ROCKETLAKE)
[22:14:00] [PASSED] 0x4680 (ALDERLAKE_S)
[22:14:00] [PASSED] 0x4682 (ALDERLAKE_S)
[22:14:00] [PASSED] 0x4688 (ALDERLAKE_S)
[22:14:00] [PASSED] 0x468A (ALDERLAKE_S)
[22:14:00] [PASSED] 0x468B (ALDERLAKE_S)
[22:14:00] [PASSED] 0x4690 (ALDERLAKE_S)
[22:14:00] [PASSED] 0x4692 (ALDERLAKE_S)
[22:14:00] [PASSED] 0x4693 (ALDERLAKE_S)
[22:14:00] [PASSED] 0x46A0 (ALDERLAKE_P)
[22:14:00] [PASSED] 0x46A1 (ALDERLAKE_P)
[22:14:00] [PASSED] 0x46A2 (ALDERLAKE_P)
[22:14:00] [PASSED] 0x46A3 (ALDERLAKE_P)
[22:14:00] [PASSED] 0x46A6 (ALDERLAKE_P)
[22:14:00] [PASSED] 0x46A8 (ALDERLAKE_P)
[22:14:00] [PASSED] 0x46AA (ALDERLAKE_P)
[22:14:00] [PASSED] 0x462A (ALDERLAKE_P)
[22:14:00] [PASSED] 0x4626 (ALDERLAKE_P)
[22:14:00] [PASSED] 0x4628 (ALDERLAKE_P)
[22:14:00] [PASSED] 0x46B0 (ALDERLAKE_P)
[22:14:00] [PASSED] 0x46B1 (ALDERLAKE_P)
[22:14:00] [PASSED] 0x46B2 (ALDERLAKE_P)
[22:14:00] [PASSED] 0x46B3 (ALDERLAKE_P)
[22:14:00] [PASSED] 0x46C0 (ALDERLAKE_P)
[22:14:00] [PASSED] 0x46C1 (ALDERLAKE_P)
[22:14:00] [PASSED] 0x46C2 (ALDERLAKE_P)
[22:14:00] [PASSED] 0x46C3 (ALDERLAKE_P)
[22:14:00] [PASSED] 0x46D0 (ALDERLAKE_N)
[22:14:00] [PASSED] 0x46D1 (ALDERLAKE_N)
[22:14:00] [PASSED] 0x46D2 (ALDERLAKE_N)
[22:14:00] [PASSED] 0x46D3 (ALDERLAKE_N)
[22:14:00] [PASSED] 0x46D4 (ALDERLAKE_N)
[22:14:00] [PASSED] 0xA721 (ALDERLAKE_P)
[22:14:00] [PASSED] 0xA7A1 (ALDERLAKE_P)
[22:14:00] [PASSED] 0xA7A9 (ALDERLAKE_P)
[22:14:00] [PASSED] 0xA7AC (ALDERLAKE_P)
[22:14:00] [PASSED] 0xA7AD (ALDERLAKE_P)
[22:14:00] [PASSED] 0xA720 (ALDERLAKE_P)
[22:14:00] [PASSED] 0xA7A0 (ALDERLAKE_P)
[22:14:00] [PASSED] 0xA7A8 (ALDERLAKE_P)
[22:14:00] [PASSED] 0xA7AA (ALDERLAKE_P)
[22:14:00] [PASSED] 0xA7AB (ALDERLAKE_P)
[22:14:00] [PASSED] 0xA780 (ALDERLAKE_S)
[22:14:00] [PASSED] 0xA781 (ALDERLAKE_S)
[22:14:00] [PASSED] 0xA782 (ALDERLAKE_S)
[22:14:00] [PASSED] 0xA783 (ALDERLAKE_S)
[22:14:00] [PASSED] 0xA788 (ALDERLAKE_S)
[22:14:00] [PASSED] 0xA789 (ALDERLAKE_S)
[22:14:00] [PASSED] 0xA78A (ALDERLAKE_S)
[22:14:00] [PASSED] 0xA78B (ALDERLAKE_S)
[22:14:00] [PASSED] 0x4905 (DG1)
[22:14:00] [PASSED] 0x4906 (DG1)
[22:14:00] [PASSED] 0x4907 (DG1)
[22:14:00] [PASSED] 0x4908 (DG1)
[22:14:00] [PASSED] 0x4909 (DG1)
[22:14:00] [PASSED] 0x56C0 (DG2)
[22:14:00] [PASSED] 0x56C2 (DG2)
[22:14:00] [PASSED] 0x56C1 (DG2)
[22:14:00] [PASSED] 0x7D51 (METEORLAKE)
[22:14:00] [PASSED] 0x7DD1 (METEORLAKE)
[22:14:00] [PASSED] 0x7D41 (METEORLAKE)
[22:14:00] [PASSED] 0x7D67 (METEORLAKE)
[22:14:00] [PASSED] 0xB640 (METEORLAKE)
[22:14:00] [PASSED] 0x56A0 (DG2)
[22:14:00] [PASSED] 0x56A1 (DG2)
[22:14:00] [PASSED] 0x56A2 (DG2)
[22:14:00] [PASSED] 0x56BE (DG2)
[22:14:00] [PASSED] 0x56BF (DG2)
[22:14:00] [PASSED] 0x5690 (DG2)
[22:14:00] [PASSED] 0x5691 (DG2)
[22:14:00] [PASSED] 0x5692 (DG2)
[22:14:00] [PASSED] 0x56A5 (DG2)
[22:14:00] [PASSED] 0x56A6 (DG2)
[22:14:00] [PASSED] 0x56B0 (DG2)
[22:14:00] [PASSED] 0x56B1 (DG2)
[22:14:00] [PASSED] 0x56BA (DG2)
[22:14:00] [PASSED] 0x56BB (DG2)
[22:14:00] [PASSED] 0x56BC (DG2)
[22:14:00] [PASSED] 0x56BD (DG2)
[22:14:00] [PASSED] 0x5693 (DG2)
[22:14:00] [PASSED] 0x5694 (DG2)
[22:14:00] [PASSED] 0x5695 (DG2)
[22:14:00] [PASSED] 0x56A3 (DG2)
[22:14:00] [PASSED] 0x56A4 (DG2)
[22:14:00] [PASSED] 0x56B2 (DG2)
[22:14:00] [PASSED] 0x56B3 (DG2)
[22:14:00] [PASSED] 0x5696 (DG2)
[22:14:00] [PASSED] 0x5697 (DG2)
[22:14:00] [PASSED] 0xB69 (PVC)
[22:14:00] [PASSED] 0xB6E (PVC)
[22:14:00] [PASSED] 0xBD4 (PVC)
[22:14:00] [PASSED] 0xBD5 (PVC)
[22:14:00] [PASSED] 0xBD6 (PVC)
[22:14:00] [PASSED] 0xBD7 (PVC)
[22:14:00] [PASSED] 0xBD8 (PVC)
[22:14:00] [PASSED] 0xBD9 (PVC)
[22:14:00] [PASSED] 0xBDA (PVC)
[22:14:00] [PASSED] 0xBDB (PVC)
[22:14:00] [PASSED] 0xBE0 (PVC)
[22:14:00] [PASSED] 0xBE1 (PVC)
[22:14:00] [PASSED] 0xBE5 (PVC)
[22:14:00] [PASSED] 0x7D40 (METEORLAKE)
[22:14:00] [PASSED] 0x7D45 (METEORLAKE)
[22:14:00] [PASSED] 0x7D55 (METEORLAKE)
[22:14:00] [PASSED] 0x7D60 (METEORLAKE)
[22:14:00] [PASSED] 0x7DD5 (METEORLAKE)
[22:14:00] [PASSED] 0x6420 (LUNARLAKE)
[22:14:00] [PASSED] 0x64A0 (LUNARLAKE)
[22:14:00] [PASSED] 0x64B0 (LUNARLAKE)
[22:14:00] [PASSED] 0xE202 (BATTLEMAGE)
[22:14:00] [PASSED] 0xE209 (BATTLEMAGE)
[22:14:00] [PASSED] 0xE20B (BATTLEMAGE)
[22:14:00] [PASSED] 0xE20C (BATTLEMAGE)
[22:14:00] [PASSED] 0xE20D (BATTLEMAGE)
[22:14:00] [PASSED] 0xE210 (BATTLEMAGE)
[22:14:00] [PASSED] 0xE211 (BATTLEMAGE)
[22:14:00] [PASSED] 0xE212 (BATTLEMAGE)
[22:14:00] [PASSED] 0xE216 (BATTLEMAGE)
[22:14:00] [PASSED] 0xE220 (BATTLEMAGE)
[22:14:00] [PASSED] 0xE221 (BATTLEMAGE)
[22:14:00] [PASSED] 0xE222 (BATTLEMAGE)
[22:14:00] [PASSED] 0xE223 (BATTLEMAGE)
[22:14:00] [PASSED] 0xB080 (PANTHERLAKE)
[22:14:00] [PASSED] 0xB081 (PANTHERLAKE)
[22:14:00] [PASSED] 0xB082 (PANTHERLAKE)
[22:14:00] [PASSED] 0xB083 (PANTHERLAKE)
[22:14:00] [PASSED] 0xB084 (PANTHERLAKE)
[22:14:00] [PASSED] 0xB085 (PANTHERLAKE)
[22:14:00] [PASSED] 0xB086 (PANTHERLAKE)
[22:14:00] [PASSED] 0xB087 (PANTHERLAKE)
[22:14:00] [PASSED] 0xB08F (PANTHERLAKE)
[22:14:00] [PASSED] 0xB090 (PANTHERLAKE)
[22:14:00] [PASSED] 0xB0A0 (PANTHERLAKE)
[22:14:00] [PASSED] 0xB0B0 (PANTHERLAKE)
[22:14:00] [PASSED] 0xFD80 (PANTHERLAKE)
[22:14:00] [PASSED] 0xFD81 (PANTHERLAKE)
[22:14:00] [PASSED] 0xD740 (NOVALAKE_S)
[22:14:00] [PASSED] 0xD741 (NOVALAKE_S)
[22:14:00] [PASSED] 0xD742 (NOVALAKE_S)
[22:14:00] [PASSED] 0xD743 (NOVALAKE_S)
[22:14:00] [PASSED] 0xD745 (NOVALAKE_S)
[22:14:00] [PASSED] 0xD74A (NOVALAKE_S)
[22:14:00] [PASSED] 0xD74B (NOVALAKE_S)
[22:14:00] [PASSED] 0x674C (CRESCENTISLAND)
[22:14:00] [PASSED] 0x674D (CRESCENTISLAND)
[22:14:00] [PASSED] 0x674E (CRESCENTISLAND)
[22:14:00] [PASSED] 0x674F (CRESCENTISLAND)
[22:14:00] [PASSED] 0x6750 (CRESCENTISLAND)
[22:14:00] [PASSED] 0xD750 (NOVALAKE_P)
[22:14:00] [PASSED] 0xD751 (NOVALAKE_P)
[22:14:00] [PASSED] 0xD752 (NOVALAKE_P)
[22:14:00] [PASSED] 0xD753 (NOVALAKE_P)
[22:14:00] [PASSED] 0xD754 (NOVALAKE_P)
[22:14:00] [PASSED] 0xD755 (NOVALAKE_P)
[22:14:00] [PASSED] 0xD756 (NOVALAKE_P)
[22:14:00] [PASSED] 0xD757 (NOVALAKE_P)
[22:14:00] [PASSED] 0xD75F (NOVALAKE_P)
[22:14:00] =============== [PASSED] check_platform_desc ===============
[22:14:00] ===================== [PASSED] xe_pci ======================
[22:14:00] ============= xe_rtp_tables_test (5 subtests) ==============
[22:14:00] ================== xe_rtp_table_gt_test  ===================
[22:14:00] [PASSED] gt_was/14011060649
[22:14:00] [PASSED] gt_was/14011059788
[22:14:00] [PASSED] gt_was/14015795083
[22:14:00] [PASSED] gt_was/16021867713
[22:14:00] [PASSED] gt_was/14019449301
[22:14:00] [PASSED] gt_was/16028005424
[22:14:00] [PASSED] gt_was/14026578760
[22:14:00] [PASSED] gt_was/1409420604
[22:14:00] [PASSED] gt_was/1408615072
[22:14:00] [PASSED] gt_was/22010523718
[22:14:00] [PASSED] gt_was/14011006942
[22:14:00] [PASSED] gt_was/14014830051
[22:14:00] [PASSED] gt_was/18018781329
[22:14:00] [PASSED] gt_was/1509235366
[22:14:00] [PASSED] gt_was/18018781329
[22:14:00] [PASSED] gt_was/16016694945
[22:14:00] [PASSED] gt_was/14018575942
[22:14:00] [PASSED] gt_was/22016670082
[22:14:00] [PASSED] gt_was/22016670082
[22:14:00] [PASSED] gt_was/14017421178
[22:14:00] [PASSED] gt_was/16025250150
[22:14:00] [PASSED] gt_was/14021871409
[22:14:00] [PASSED] gt_was/16021865536
[22:14:00] [PASSED] gt_was/14021486841
[22:14:00] [PASSED] gt_was/14025160223
[22:14:00] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[22:14:00] [PASSED] gt_was/14025635424
[22:14:00] [PASSED] gt_was/16028005424
[22:14:00] ============== [PASSED] xe_rtp_table_gt_test ===============
[22:14:00] ================== xe_rtp_table_gt_test  ===================
[22:14:00] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[22:14:00] [PASSED] gt_tunings/Tuning: 32B Access Enable
[22:14:00] [PASSED] gt_tunings/Tuning: L3 cache
[22:14:00] [PASSED] gt_tunings/Tuning: L3 cache - media
[22:14:00] [PASSED] gt_tunings/Tuning: Compression Overfetch
[22:14:00] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[22:14:00] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[22:14:00] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[22:14:00] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[22:14:00] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[22:14:00] [PASSED] gt_tunings/Tuning: Stateless compression control
[22:14:00] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[22:14:00] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[22:14:00] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[22:14:00] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[22:14:00] ============== [PASSED] xe_rtp_table_gt_test ===============
[22:14:00] ================== xe_rtp_table_oob_test  ==================
[22:14:00] [PASSED] oob_was/1607983814
[22:14:00] [PASSED] oob_was/16010904313
[22:14:00] [PASSED] oob_was/18022495364
[22:14:00] [PASSED] oob_was/22012773006
[22:14:00] [PASSED] oob_was/14014475959
[22:14:00] [PASSED] oob_was/22011391025
[22:14:00] [PASSED] oob_was/22012727170
[22:14:00] [PASSED] oob_was/22012727685
[22:14:00] [PASSED] oob_was/22016596838
[22:14:00] [PASSED] oob_was/18020744125
[22:14:00] [PASSED] oob_was/1409600907
[22:14:00] [PASSED] oob_was/22014953428
[22:14:00] [PASSED] oob_was/16017236439
[22:14:00] [PASSED] oob_was/14019821291
[22:14:00] [PASSED] oob_was/14015076503
[22:14:00] [PASSED] oob_was/14018913170
[22:14:00] [PASSED] oob_was/14018094691
[22:14:00] [PASSED] oob_was/18024947630
[22:14:00] [PASSED] oob_was/16022287689
[22:14:00] [PASSED] oob_was/13011645652
[22:14:00] [PASSED] oob_was/14022293748
[22:14:00] [PASSED] oob_was/22019794406
[22:14:00] [PASSED] oob_was/22019338487
[22:14:00] [PASSED] oob_was/16023588340
[22:14:00] [PASSED] oob_was/14019789679
[22:14:00] [PASSED] oob_was/14022866841
[22:14:00] [PASSED] oob_was/16021333562
[22:14:00] [PASSED] oob_was/14016712196
[22:14:00] [PASSED] oob_was/14015568240
[22:14:00] [PASSED] oob_was/18013179988
[22:14:00] [PASSED] oob_was/1508761755
[22:14:00] [PASSED] oob_was/16023105232
[22:14:00] [PASSED] oob_was/16026508708
[22:14:00] [PASSED] oob_was/14020001231
[22:14:00] [PASSED] oob_was/16023683509
[22:14:00] [PASSED] oob_was/14025515070
[22:14:00] [PASSED] oob_was/15015404425_disable
[22:14:00] [PASSED] oob_was/16026007364
[22:14:00] [PASSED] oob_was/14020316580
[22:14:00] [PASSED] oob_was/14025883347
[22:14:00] [PASSED] oob_was/16029380221
[22:14:00] [PASSED] oob_was/22022079272
[22:14:00] [PASSED] oob_was/16029897822
[22:14:00] [PASSED] oob_was/14027054324
[22:14:00] ============== [PASSED] xe_rtp_table_oob_test ==============
[22:14:00] ================ xe_rtp_table_dev_oob_test  ================
[22:14:00] [PASSED] device_oob_was/22010954014
[22:14:00] [PASSED] device_oob_was/15015404425
[22:14:00] [PASSED] device_oob_was/22019338487_display
[22:14:00] [PASSED] device_oob_was/14022085890
[22:14:00] [PASSED] device_oob_was/14026539277
[22:14:00] [PASSED] device_oob_was/14026633728
[22:14:00] [PASSED] device_oob_was/14026746987
[22:14:00] [PASSED] device_oob_was/14026779378
[22:14:00] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[22:14:00] ========== xe_rtp_table_missing_upper_bound_test  ==========
[22:14:00] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[22:14:00] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[22:14:00] [PASSED] register_whitelist/1806527549
[22:14:00] [PASSED] register_whitelist/allow_read_ctx_timestamp
[22:14:00] [PASSED] register_whitelist/allow_read_queue_timestamp
[22:14:00] [PASSED] register_whitelist/16014440446
[22:14:00] [PASSED] register_whitelist/16017236439
[22:14:00] [PASSED] register_whitelist/16020183090
[22:14:00] [PASSED] register_whitelist/14024997852
[22:14:00] [PASSED] register_whitelist/14024997852
[22:14:00] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[22:14:00] =============== [PASSED] xe_rtp_tables_test ================
[22:14:00] =================== xe_rtp (3 subtests) ====================
[22:14:00] =================== xe_rtp_rules_tests  ====================
[22:14:00] [PASSED] no
[22:14:00] [PASSED] yes
[22:14:00] [PASSED] no-and-no
[22:14:00] [PASSED] no-and-yes
[22:14:00] [PASSED] yes-and-no
[22:14:00] [PASSED] yes-and-yes
[22:14:00] [PASSED] no-or-no
[22:14:00] [PASSED] no-or-yes
[22:14:00] [PASSED] yes-or-no
[22:14:00] [PASSED] yes-or-yes
[22:14:00] [PASSED] no-yes-or-yes-no
[22:14:00] [PASSED] no-yes-or-yes-yes
[22:14:00] [PASSED] yes-yes-or-no-yes
[22:14:00] [PASSED] yes-yes-or-yes-yes
[22:14:00] [PASSED] no-no-or-yes-or-no
[22:14:00] [PASSED] or
[22:14:00] [PASSED] or-yes
[22:14:00] [PASSED] or-no
[22:14:00] [PASSED] yes-or
[22:14:00] [PASSED] no-or
[22:14:00] [PASSED] no-or-or-yes
[22:14:00] [PASSED] yes-or-or-no
[22:14:00] [PASSED] no-or-or-no
[22:14:00] [PASSED] missing-context-engine-class
[22:14:00] [PASSED] missing-context-engine-class-or-yes
[22:14:00] [PASSED] missing-context-engine-class-or-or-yes
[22:14:00] =============== [PASSED] xe_rtp_rules_tests ================
[22:14:00] =============== xe_rtp_process_to_sr_tests  ================
[22:14:00] [PASSED] coalesce-same-reg
[22:14:00] [PASSED] coalesce-same-reg-literal-and-func
[22:14:00] [PASSED] no-match-no-add
[22:14:00] [PASSED] two-regs-two-entries
[22:14:00] [PASSED] clr-one-set-other
[22:14:00] [PASSED] set-field
[22:14:00] [PASSED] conflict-duplicate
[22:14:00] [PASSED] conflict-not-disjoint
[22:14:00] [PASSED] conflict-not-disjoint-literal-and-func
[22:14:00] [PASSED] conflict-reg-type
[22:14:00] [PASSED] bad-mcr-reg-forced-to-regular
[22:14:00] [PASSED] bad-regular-reg-forced-to-mcr
[22:14:00] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[22:14:00] ================== xe_rtp_process_tests  ===================
[22:14:00] [PASSED] active1
[22:14:00] [PASSED] active2
[22:14:00] [PASSED] active-inactive
[22:14:00] [PASSED] inactive-active
[22:14:00] [PASSED] inactive-active-inactive
[22:14:00] [PASSED] inactive-inactive-inactive
[22:14:00] ============== [PASSED] xe_rtp_process_tests ===============
[22:14:00] ===================== [PASSED] xe_rtp ======================
[22:14:00] ==================== xe_wa (1 subtest) =====================
[22:14:00] ======================== xe_wa_gt  =========================
[22:14:00] [PASSED] TIGERLAKE B0
[22:14:00] [PASSED] DG1 A0
[22:14:00] [PASSED] DG1 B0
[22:14:00] [PASSED] ALDERLAKE_S A0
[22:14:00] [PASSED] ALDERLAKE_S B0
[22:14:00] [PASSED] ALDERLAKE_S C0
[22:14:00] [PASSED] ALDERLAKE_S D0
[22:14:00] [PASSED] ALDERLAKE_P A0
[22:14:00] [PASSED] ALDERLAKE_P B0
[22:14:00] [PASSED] ALDERLAKE_P C0
[22:14:00] [PASSED] ALDERLAKE_S RPLS D0
[22:14:00] [PASSED] ALDERLAKE_P RPLU E0
[22:14:00] [PASSED] DG2 G10 C0
[22:14:00] [PASSED] DG2 G11 B1
[22:14:00] [PASSED] DG2 G12 A1
[22:14:00] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[22:14:00] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[22:14:00] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[22:14:00] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[22:14:00] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[22:14:00] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[22:14:00] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[22:14:00] ==================== [PASSED] xe_wa_gt =====================
[22:14:00] ====================== [PASSED] xe_wa ======================
[22:14:00] ============================================================
[22:14:00] Testing complete. Ran 793 tests: passed: 765, skipped: 28
[22:14:00] Elapsed time: 36.228s total, 1.851s configuring, 33.661s building, 0.704s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[22:14:00] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:14:02] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[22:14:27] Starting KUnit Kernel (1/1)...
[22:14:27] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:14:27] ============= refcount_interrupt (4 subtests) ==============
[22:14:27] [PASSED] test_single_irq_change
[22:14:27] [PASSED] test_nested_irq_change
[22:14:27] [PASSED] test_multiple_irq_change
[22:14:27] [PASSED] test_irq_save
[22:14:27] =============== [PASSED] refcount_interrupt ================
[22:14:27] ============ drm_test_pick_cmdline (2 subtests) ============
[22:14:27] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[22:14:27] =============== drm_test_pick_cmdline_named  ===============
[22:14:27] [PASSED] NTSC
[22:14:27] [PASSED] NTSC-J
[22:14:27] [PASSED] PAL
[22:14:27] [PASSED] PAL-M
[22:14:27] =========== [PASSED] drm_test_pick_cmdline_named ===========
[22:14:27] ============== [PASSED] drm_test_pick_cmdline ==============
[22:14:27] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[22:14:27] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[22:14:27] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[22:14:27] =========== drm_validate_clone_mode (2 subtests) ===========
[22:14:27] ============== drm_test_check_in_clone_mode  ===============
[22:14:27] [PASSED] in_clone_mode
[22:14:27] [PASSED] not_in_clone_mode
[22:14:27] ========== [PASSED] drm_test_check_in_clone_mode ===========
[22:14:27] =============== drm_test_check_valid_clones  ===============
[22:14:27] [PASSED] not_in_clone_mode
[22:14:27] [PASSED] valid_clone
[22:14:27] [PASSED] invalid_clone
[22:14:27] =========== [PASSED] drm_test_check_valid_clones ===========
[22:14:27] ============= [PASSED] drm_validate_clone_mode =============
[22:14:27] ============= drm_validate_modeset (1 subtest) =============
[22:14:27] [PASSED] drm_test_check_connector_changed_modeset
[22:14:27] ============== [PASSED] drm_validate_modeset ===============
[22:14:27] ====== drm_test_bridge_get_current_state (1 subtest) =======
[22:14:27] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[22:14:27] ======== [PASSED] drm_test_bridge_get_current_state ========
[22:14:27] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[22:14:27] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[22:14:27] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[22:14:27] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[22:14:27] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[22:14:27] ============== drm_bridge_alloc (2 subtests) ===============
[22:14:27] [PASSED] drm_test_drm_bridge_alloc_basic
[22:14:27] [PASSED] drm_test_drm_bridge_alloc_get_put
[22:14:27] ================ [PASSED] drm_bridge_alloc =================
[22:14:27] ============= drm_bridge_bus_fmt (5 subtests) ==============
[22:14:27] [PASSED] drm_test_bridge_rgb_yuv_rgb
[22:14:27] [PASSED] drm_test_bridge_must_convert_to_yuv444
[22:14:27] [PASSED] drm_test_bridge_hdmi_auto_rgb
[22:14:27] [PASSED] drm_test_bridge_auto_first
[22:14:27] [PASSED] drm_test_bridge_rgb_yuv_no_path
[22:14:27] =============== [PASSED] drm_bridge_bus_fmt ================
[22:14:27] ============= drm_cmdline_parser (40 subtests) =============
[22:14:27] [PASSED] drm_test_cmdline_force_d_only
[22:14:27] [PASSED] drm_test_cmdline_force_D_only_dvi
[22:14:27] [PASSED] drm_test_cmdline_force_D_only_hdmi
[22:14:27] [PASSED] drm_test_cmdline_force_D_only_not_digital
[22:14:27] [PASSED] drm_test_cmdline_force_e_only
[22:14:27] [PASSED] drm_test_cmdline_res
[22:14:27] [PASSED] drm_test_cmdline_res_vesa
[22:14:27] [PASSED] drm_test_cmdline_res_vesa_rblank
[22:14:27] [PASSED] drm_test_cmdline_res_rblank
[22:14:27] [PASSED] drm_test_cmdline_res_bpp
[22:14:27] [PASSED] drm_test_cmdline_res_refresh
[22:14:27] [PASSED] drm_test_cmdline_res_bpp_refresh
[22:14:27] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[22:14:27] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[22:14:27] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[22:14:27] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[22:14:27] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[22:14:27] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[22:14:27] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[22:14:27] [PASSED] drm_test_cmdline_res_margins_force_on
[22:14:27] [PASSED] drm_test_cmdline_res_vesa_margins
[22:14:27] [PASSED] drm_test_cmdline_name
[22:14:27] [PASSED] drm_test_cmdline_name_bpp
[22:14:27] [PASSED] drm_test_cmdline_name_option
[22:14:27] [PASSED] drm_test_cmdline_name_bpp_option
[22:14:27] [PASSED] drm_test_cmdline_rotate_0
[22:14:27] [PASSED] drm_test_cmdline_rotate_90
[22:14:27] [PASSED] drm_test_cmdline_rotate_180
[22:14:27] [PASSED] drm_test_cmdline_rotate_270
[22:14:27] [PASSED] drm_test_cmdline_hmirror
[22:14:27] [PASSED] drm_test_cmdline_vmirror
[22:14:27] [PASSED] drm_test_cmdline_margin_options
[22:14:27] [PASSED] drm_test_cmdline_multiple_options
[22:14:27] [PASSED] drm_test_cmdline_bpp_extra_and_option
[22:14:27] [PASSED] drm_test_cmdline_extra_and_option
[22:14:27] [PASSED] drm_test_cmdline_freestanding_options
[22:14:27] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[22:14:27] [PASSED] drm_test_cmdline_panel_orientation
[22:14:27] ================ drm_test_cmdline_invalid  =================
[22:14:27] [PASSED] margin_only
[22:14:27] [PASSED] interlace_only
[22:14:27] [PASSED] res_missing_x
[22:14:27] [PASSED] res_missing_y
[22:14:27] [PASSED] res_bad_y
[22:14:27] [PASSED] res_missing_y_bpp
[22:14:27] [PASSED] res_bad_bpp
[22:14:27] [PASSED] res_bad_refresh
[22:14:27] [PASSED] res_bpp_refresh_force_on_off
[22:14:27] [PASSED] res_invalid_mode
[22:14:27] [PASSED] res_bpp_wrong_place_mode
[22:14:27] [PASSED] name_bpp_refresh
[22:14:27] [PASSED] name_refresh
[22:14:27] [PASSED] name_refresh_wrong_mode
[22:14:27] [PASSED] name_refresh_invalid_mode
[22:14:27] [PASSED] rotate_multiple
[22:14:27] [PASSED] rotate_invalid_val
[22:14:27] [PASSED] rotate_truncated
[22:14:27] [PASSED] invalid_option
[22:14:27] [PASSED] invalid_tv_option
[22:14:27] [PASSED] truncated_tv_option
[22:14:27] ============ [PASSED] drm_test_cmdline_invalid =============
[22:14:27] =============== drm_test_cmdline_tv_options  ===============
[22:14:27] [PASSED] NTSC
[22:14:27] [PASSED] NTSC_443
[22:14:27] [PASSED] NTSC_J
[22:14:27] [PASSED] PAL
[22:14:27] [PASSED] PAL_M
[22:14:27] [PASSED] PAL_N
[22:14:27] [PASSED] SECAM
[22:14:27] [PASSED] MONO_525
[22:14:27] [PASSED] MONO_625
[22:14:27] =========== [PASSED] drm_test_cmdline_tv_options ===========
[22:14:27] =============== [PASSED] drm_cmdline_parser ================
[22:14:27] ========== drmm_connector_hdmi_init (20 subtests) ==========
[22:14:27] [PASSED] drm_test_connector_hdmi_init_valid
[22:14:27] [PASSED] drm_test_connector_hdmi_init_bpc_8
[22:14:27] [PASSED] drm_test_connector_hdmi_init_bpc_10
[22:14:27] [PASSED] drm_test_connector_hdmi_init_bpc_12
[22:14:27] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[22:14:27] [PASSED] drm_test_connector_hdmi_init_bpc_null
[22:14:27] [PASSED] drm_test_connector_hdmi_init_formats_empty
[22:14:27] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[22:14:27] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[22:14:27] [PASSED] supported_formats=0x9 yuv420_allowed=1
[22:14:27] [PASSED] supported_formats=0x9 yuv420_allowed=0
[22:14:27] [PASSED] supported_formats=0x5 yuv420_allowed=1
[22:14:27] [PASSED] supported_formats=0x5 yuv420_allowed=0
[22:14:27] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[22:14:27] [PASSED] drm_test_connector_hdmi_init_null_ddc
[22:14:27] [PASSED] drm_test_connector_hdmi_init_null_product
[22:14:27] [PASSED] drm_test_connector_hdmi_init_null_vendor
[22:14:27] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[22:14:27] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[22:14:27] [PASSED] drm_test_connector_hdmi_init_product_valid
[22:14:27] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[22:14:27] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[22:14:27] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[22:14:27] ========= drm_test_connector_hdmi_init_type_valid  =========
[22:14:27] [PASSED] HDMI-A
[22:14:27] [PASSED] HDMI-B
[22:14:27] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[22:14:27] ======== drm_test_connector_hdmi_init_type_invalid  ========
[22:14:27] [PASSED] Unknown
[22:14:27] [PASSED] VGA
[22:14:27] [PASSED] DVI-I
[22:14:27] [PASSED] DVI-D
[22:14:27] [PASSED] DVI-A
[22:14:27] [PASSED] Composite
[22:14:27] [PASSED] SVIDEO
[22:14:27] [PASSED] LVDS
[22:14:27] [PASSED] Component
[22:14:27] [PASSED] DIN
[22:14:27] [PASSED] DP
[22:14:27] [PASSED] TV
[22:14:27] [PASSED] eDP
[22:14:27] [PASSED] Virtual
[22:14:27] [PASSED] DSI
[22:14:27] [PASSED] DPI
[22:14:27] [PASSED] Writeback
[22:14:27] [PASSED] SPI
[22:14:27] [PASSED] USB
[22:14:27] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[22:14:27] ============ [PASSED] drmm_connector_hdmi_init =============
[22:14:27] ============= drmm_connector_init (3 subtests) =============
[22:14:27] [PASSED] drm_test_drmm_connector_init
[22:14:27] [PASSED] drm_test_drmm_connector_init_null_ddc
[22:14:27] ========= drm_test_drmm_connector_init_type_valid  =========
[22:14:27] [PASSED] Unknown
[22:14:27] [PASSED] VGA
[22:14:27] [PASSED] DVI-I
[22:14:27] [PASSED] DVI-D
[22:14:27] [PASSED] DVI-A
[22:14:27] [PASSED] Composite
[22:14:27] [PASSED] SVIDEO
[22:14:27] [PASSED] LVDS
[22:14:27] [PASSED] Component
[22:14:27] [PASSED] DIN
[22:14:27] [PASSED] DP
[22:14:27] [PASSED] HDMI-A
[22:14:27] [PASSED] HDMI-B
[22:14:27] [PASSED] TV
[22:14:27] [PASSED] eDP
[22:14:27] [PASSED] Virtual
[22:14:27] [PASSED] DSI
[22:14:27] [PASSED] DPI
[22:14:27] [PASSED] Writeback
[22:14:27] [PASSED] SPI
[22:14:27] [PASSED] USB
[22:14:27] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[22:14:27] =============== [PASSED] drmm_connector_init ===============
[22:14:27] ========= drm_connector_dynamic_init (6 subtests) ==========
[22:14:27] [PASSED] drm_test_drm_connector_dynamic_init
[22:14:27] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[22:14:27] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[22:14:27] [PASSED] drm_test_drm_connector_dynamic_init_properties
[22:14:27] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[22:14:27] [PASSED] Unknown
[22:14:27] [PASSED] VGA
[22:14:27] [PASSED] DVI-I
[22:14:27] [PASSED] DVI-D
[22:14:27] [PASSED] DVI-A
[22:14:27] [PASSED] Composite
[22:14:27] [PASSED] SVIDEO
[22:14:27] [PASSED] LVDS
[22:14:27] [PASSED] Component
[22:14:27] [PASSED] DIN
[22:14:27] [PASSED] DP
[22:14:27] [PASSED] HDMI-A
[22:14:27] [PASSED] HDMI-B
[22:14:27] [PASSED] TV
[22:14:27] [PASSED] eDP
[22:14:27] [PASSED] Virtual
[22:14:27] [PASSED] DSI
[22:14:27] [PASSED] DPI
[22:14:27] [PASSED] Writeback
[22:14:27] [PASSED] SPI
[22:14:27] [PASSED] USB
[22:14:27] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[22:14:27] ======== drm_test_drm_connector_dynamic_init_name  =========
[22:14:27] [PASSED] Unknown
[22:14:27] [PASSED] VGA
[22:14:27] [PASSED] DVI-I
[22:14:27] [PASSED] DVI-D
[22:14:27] [PASSED] DVI-A
[22:14:27] [PASSED] Composite
[22:14:27] [PASSED] SVIDEO
[22:14:27] [PASSED] LVDS
[22:14:27] [PASSED] Component
[22:14:27] [PASSED] DIN
[22:14:27] [PASSED] DP
[22:14:27] [PASSED] HDMI-A
[22:14:27] [PASSED] HDMI-B
[22:14:27] [PASSED] TV
[22:14:27] [PASSED] eDP
[22:14:27] [PASSED] Virtual
[22:14:27] [PASSED] DSI
[22:14:27] [PASSED] DPI
[22:14:27] [PASSED] Writeback
[22:14:27] [PASSED] SPI
[22:14:27] [PASSED] USB
[22:14:27] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[22:14:27] =========== [PASSED] drm_connector_dynamic_init ============
[22:14:27] ==== drm_connector_dynamic_register_early (4 subtests) =====
[22:14:27] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[22:14:27] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[22:14:27] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[22:14:27] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[22:14:27] ====== [PASSED] drm_connector_dynamic_register_early =======
[22:14:27] ======= drm_connector_dynamic_register (7 subtests) ========
[22:14:27] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[22:14:27] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[22:14:27] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[22:14:27] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[22:14:27] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[22:14:27] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[22:14:27] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[22:14:27] ========= [PASSED] drm_connector_dynamic_register ==========
[22:14:27] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[22:14:27] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[22:14:27] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[22:14:27] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[22:14:27] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[22:14:27] ========== drm_test_get_tv_mode_from_name_valid  ===========
[22:14:27] [PASSED] NTSC
[22:14:27] [PASSED] NTSC-443
[22:14:27] [PASSED] NTSC-J
[22:14:27] [PASSED] PAL
[22:14:27] [PASSED] PAL-M
[22:14:27] [PASSED] PAL-N
[22:14:27] [PASSED] SECAM
[22:14:27] [PASSED] Mono
[22:14:27] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[22:14:27] [PASSED] drm_test_get_tv_mode_from_name_truncated
[22:14:27] ============ [PASSED] drm_get_tv_mode_from_name ============
[22:14:27] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[22:14:27] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[22:14:27] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[22:14:27] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[22:14:27] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[22:14:27] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[22:14:27] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[22:14:27] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[22:14:27] [PASSED] VIC 96
[22:14:27] [PASSED] VIC 97
[22:14:27] [PASSED] VIC 101
[22:14:27] [PASSED] VIC 102
[22:14:27] [PASSED] VIC 106
[22:14:27] [PASSED] VIC 107
[22:14:27] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[22:14:27] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[22:14:27] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[22:14:27] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[22:14:27] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[22:14:27] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[22:14:27] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[22:14:27] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[22:14:27] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[22:14:27] [PASSED] Automatic
[22:14:27] [PASSED] Full
[22:14:27] [PASSED] Limited 16:235
[22:14:27] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[22:14:27] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[22:14:27] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[22:14:27] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[22:14:27] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[22:14:27] [PASSED] RGB
[22:14:27] [PASSED] YUV 4:2:0
[22:14:27] [PASSED] YUV 4:2:2
[22:14:27] [PASSED] YUV 4:4:4
[22:14:27] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[22:14:27] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[22:14:27] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[22:14:27] ============= drm_damage_helper (21 subtests) ==============
[22:14:27] [PASSED] drm_test_damage_iter_no_damage
[22:14:27] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[22:14:27] [PASSED] drm_test_damage_iter_no_damage_src_moved
[22:14:27] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[22:14:27] [PASSED] drm_test_damage_iter_no_damage_not_visible
[22:14:27] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[22:14:27] [PASSED] drm_test_damage_iter_no_damage_no_fb
[22:14:27] [PASSED] drm_test_damage_iter_simple_damage
[22:14:27] [PASSED] drm_test_damage_iter_single_damage
[22:14:27] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[22:14:27] [PASSED] drm_test_damage_iter_single_damage_outside_src
[22:14:27] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[22:14:27] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[22:14:27] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[22:14:27] [PASSED] drm_test_damage_iter_single_damage_src_moved
[22:14:27] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[22:14:27] [PASSED] drm_test_damage_iter_damage
[22:14:27] [PASSED] drm_test_damage_iter_damage_one_intersect
[22:14:27] [PASSED] drm_test_damage_iter_damage_one_outside
[22:14:27] [PASSED] drm_test_damage_iter_damage_src_moved
[22:14:27] [PASSED] drm_test_damage_iter_damage_not_visible
[22:14:27] ================ [PASSED] drm_damage_helper ================
[22:14:27] ============== drm_dp_mst_helper (3 subtests) ==============
[22:14:27] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[22:14:27] [PASSED] Clock 154000 BPP 30 DSC disabled
[22:14:27] [PASSED] Clock 234000 BPP 30 DSC disabled
[22:14:27] [PASSED] Clock 297000 BPP 24 DSC disabled
[22:14:27] [PASSED] Clock 332880 BPP 24 DSC enabled
[22:14:27] [PASSED] Clock 324540 BPP 24 DSC enabled
[22:14:27] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[22:14:27] ============== drm_test_dp_mst_calc_pbn_div  ===============
[22:14:27] [PASSED] Link rate 2000000 lane count 4
[22:14:27] [PASSED] Link rate 2000000 lane count 2
[22:14:27] [PASSED] Link rate 2000000 lane count 1
[22:14:27] [PASSED] Link rate 1350000 lane count 4
[22:14:27] [PASSED] Link rate 1350000 lane count 2
[22:14:27] [PASSED] Link rate 1350000 lane count 1
[22:14:27] [PASSED] Link rate 1000000 lane count 4
[22:14:27] [PASSED] Link rate 1000000 lane count 2
[22:14:27] [PASSED] Link rate 1000000 lane count 1
[22:14:27] [PASSED] Link rate 810000 lane count 4
[22:14:27] [PASSED] Link rate 810000 lane count 2
[22:14:27] [PASSED] Link rate 810000 lane count 1
[22:14:27] [PASSED] Link rate 540000 lane count 4
[22:14:27] [PASSED] Link rate 540000 lane count 2
[22:14:27] [PASSED] Link rate 540000 lane count 1
[22:14:27] [PASSED] Link rate 270000 lane count 4
[22:14:27] [PASSED] Link rate 270000 lane count 2
[22:14:27] [PASSED] Link rate 270000 lane count 1
[22:14:27] [PASSED] Link rate 162000 lane count 4
[22:14:27] [PASSED] Link rate 162000 lane count 2
[22:14:27] [PASSED] Link rate 162000 lane count 1
[22:14:27] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[22:14:27] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[22:14:27] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[22:14:27] [PASSED] DP_POWER_UP_PHY with port number
[22:14:27] [PASSED] DP_POWER_DOWN_PHY with port number
[22:14:27] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[22:14:27] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[22:14:27] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[22:14:27] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[22:14:27] [PASSED] DP_QUERY_PAYLOAD with port number
[22:14:27] [PASSED] DP_QUERY_PAYLOAD with VCPI
[22:14:27] [PASSED] DP_REMOTE_DPCD_READ with port number
[22:14:27] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[22:14:27] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[22:14:27] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[22:14:27] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[22:14:27] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[22:14:27] [PASSED] DP_REMOTE_I2C_READ with port number
[22:14:27] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[22:14:27] [PASSED] DP_REMOTE_I2C_READ with transactions array
[22:14:27] [PASSED] DP_REMOTE_I2C_WRITE with port number
[22:14:27] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[22:14:27] [PASSED] DP_REMOTE_I2C_WRITE with data array
[22:14:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[22:14:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[22:14:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[22:14:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[22:14:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[22:14:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[22:14:27] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[22:14:27] ================ [PASSED] drm_dp_mst_helper ================
[22:14:27] ================== drm_exec (7 subtests) ===================
[22:14:27] [PASSED] sanitycheck
[22:14:27] [PASSED] test_lock
[22:14:27] [PASSED] test_lock_unlock
[22:14:27] [PASSED] test_duplicates
[22:14:27] [PASSED] test_prepare
[22:14:27] [PASSED] test_prepare_array
[22:14:27] [PASSED] test_multiple_loops
[22:14:27] ==================== [PASSED] drm_exec =====================
[22:14:27] =========== drm_format_helper_test (17 subtests) ===========
[22:14:27] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[22:14:27] [PASSED] single_pixel_source_buffer
[22:14:27] [PASSED] single_pixel_clip_rectangle
[22:14:27] [PASSED] well_known_colors
[22:14:27] [PASSED] destination_pitch
[22:14:27] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[22:14:27] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[22:14:27] [PASSED] single_pixel_source_buffer
[22:14:27] [PASSED] single_pixel_clip_rectangle
[22:14:27] [PASSED] well_known_colors
[22:14:27] [PASSED] destination_pitch
[22:14:27] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[22:14:27] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[22:14:27] [PASSED] single_pixel_source_buffer
[22:14:27] [PASSED] single_pixel_clip_rectangle
[22:14:27] [PASSED] well_known_colors
[22:14:27] [PASSED] destination_pitch
[22:14:27] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[22:14:27] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[22:14:27] [PASSED] single_pixel_source_buffer
[22:14:27] [PASSED] single_pixel_clip_rectangle
[22:14:27] [PASSED] well_known_colors
[22:14:27] [PASSED] destination_pitch
[22:14:27] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[22:14:27] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[22:14:27] [PASSED] single_pixel_source_buffer
[22:14:27] [PASSED] single_pixel_clip_rectangle
[22:14:27] [PASSED] well_known_colors
[22:14:27] [PASSED] destination_pitch
[22:14:27] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[22:14:27] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[22:14:27] [PASSED] single_pixel_source_buffer
[22:14:27] [PASSED] single_pixel_clip_rectangle
[22:14:27] [PASSED] well_known_colors
[22:14:27] [PASSED] destination_pitch
[22:14:27] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[22:14:27] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[22:14:27] [PASSED] single_pixel_source_buffer
[22:14:27] [PASSED] single_pixel_clip_rectangle
[22:14:27] [PASSED] well_known_colors
[22:14:27] [PASSED] destination_pitch
[22:14:27] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[22:14:27] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[22:14:27] [PASSED] single_pixel_source_buffer
[22:14:27] [PASSED] single_pixel_clip_rectangle
[22:14:27] [PASSED] well_known_colors
[22:14:27] [PASSED] destination_pitch
[22:14:27] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[22:14:27] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[22:14:27] [PASSED] single_pixel_source_buffer
[22:14:27] [PASSED] single_pixel_clip_rectangle
[22:14:27] [PASSED] well_known_colors
[22:14:27] [PASSED] destination_pitch
[22:14:27] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[22:14:27] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[22:14:27] [PASSED] single_pixel_source_buffer
[22:14:27] [PASSED] single_pixel_clip_rectangle
[22:14:27] [PASSED] well_known_colors
[22:14:27] [PASSED] destination_pitch
[22:14:27] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[22:14:27] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[22:14:27] [PASSED] single_pixel_source_buffer
[22:14:27] [PASSED] single_pixel_clip_rectangle
[22:14:27] [PASSED] well_known_colors
[22:14:27] [PASSED] destination_pitch
[22:14:27] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[22:14:27] ============== drm_test_fb_xrgb8888_to_mono  ===============
[22:14:27] [PASSED] single_pixel_source_buffer
[22:14:27] [PASSED] single_pixel_clip_rectangle
[22:14:27] [PASSED] well_known_colors
[22:14:27] [PASSED] destination_pitch
[22:14:27] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[22:14:27] ==================== drm_test_fb_swab  =====================
[22:14:27] [PASSED] single_pixel_source_buffer
[22:14:27] [PASSED] single_pixel_clip_rectangle
[22:14:27] [PASSED] well_known_colors
[22:14:27] [PASSED] destination_pitch
[22:14:27] ================ [PASSED] drm_test_fb_swab =================
[22:14:27] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[22:14:27] [PASSED] single_pixel_source_buffer
[22:14:27] [PASSED] single_pixel_clip_rectangle
[22:14:27] [PASSED] well_known_colors
[22:14:27] [PASSED] destination_pitch
[22:14:27] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[22:14:27] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[22:14:27] [PASSED] single_pixel_source_buffer
[22:14:27] [PASSED] single_pixel_clip_rectangle
[22:14:27] [PASSED] well_known_colors
[22:14:27] [PASSED] destination_pitch
[22:14:27] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[22:14:27] ================= drm_test_fb_clip_offset  =================
[22:14:27] [PASSED] pass through
[22:14:27] [PASSED] horizontal offset
[22:14:27] [PASSED] vertical offset
[22:14:27] [PASSED] horizontal and vertical offset
[22:14:27] [PASSED] horizontal offset (custom pitch)
[22:14:27] [PASSED] vertical offset (custom pitch)
[22:14:27] [PASSED] horizontal and vertical offset (custom pitch)
[22:14:27] ============= [PASSED] drm_test_fb_clip_offset =============
[22:14:27] =================== drm_test_fb_memcpy  ====================
[22:14:27] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[22:14:27] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[22:14:27] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[22:14:27] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[22:14:27] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[22:14:27] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[22:14:27] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[22:14:27] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[22:14:27] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[22:14:27] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[22:14:27] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[22:14:27] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[22:14:27] =============== [PASSED] drm_test_fb_memcpy ================
[22:14:27] ============= [PASSED] drm_format_helper_test ==============
[22:14:27] ================= drm_format (18 subtests) =================
[22:14:27] [PASSED] drm_test_format_block_width_invalid
[22:14:27] [PASSED] drm_test_format_block_width_one_plane
[22:14:27] [PASSED] drm_test_format_block_width_two_plane
[22:14:27] [PASSED] drm_test_format_block_width_three_plane
[22:14:27] [PASSED] drm_test_format_block_width_tiled
[22:14:27] [PASSED] drm_test_format_block_height_invalid
[22:14:27] [PASSED] drm_test_format_block_height_one_plane
[22:14:27] [PASSED] drm_test_format_block_height_two_plane
[22:14:27] [PASSED] drm_test_format_block_height_three_plane
[22:14:27] [PASSED] drm_test_format_block_height_tiled
[22:14:27] [PASSED] drm_test_format_min_pitch_invalid
[22:14:27] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[22:14:27] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[22:14:27] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[22:14:27] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[22:14:27] [PASSED] drm_test_format_min_pitch_two_plane
[22:14:27] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[22:14:27] [PASSED] drm_test_format_min_pitch_tiled
[22:14:27] =================== [PASSED] drm_format ====================
[22:14:27] ============== drm_framebuffer (10 subtests) ===============
[22:14:27] ========== drm_test_framebuffer_check_src_coords  ==========
[22:14:27] [PASSED] Success: source fits into fb
[22:14:27] [PASSED] Fail: overflowing fb with x-axis coordinate
[22:14:27] [PASSED] Fail: overflowing fb with y-axis coordinate
[22:14:27] [PASSED] Fail: overflowing fb with source width
[22:14:27] [PASSED] Fail: overflowing fb with source height
[22:14:27] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[22:14:27] [PASSED] drm_test_framebuffer_cleanup
[22:14:27] =============== drm_test_framebuffer_create  ===============
[22:14:27] [PASSED] ABGR8888 normal sizes
[22:14:27] [PASSED] ABGR8888 max sizes
[22:14:27] [PASSED] ABGR8888 pitch greater than min required
[22:14:27] [PASSED] ABGR8888 pitch less than min required
[22:14:27] [PASSED] ABGR8888 Invalid width
[22:14:27] [PASSED] ABGR8888 Invalid buffer handle
[22:14:27] [PASSED] No pixel format
[22:14:27] [PASSED] ABGR8888 Width 0
[22:14:27] [PASSED] ABGR8888 Height 0
[22:14:27] [PASSED] ABGR8888 Out of bound height * pitch combination
[22:14:27] [PASSED] ABGR8888 Large buffer offset
[22:14:27] [PASSED] ABGR8888 Buffer offset for inexistent plane
[22:14:27] [PASSED] ABGR8888 Invalid flag
[22:14:27] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[22:14:27] [PASSED] ABGR8888 Valid buffer modifier
[22:14:27] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[22:14:27] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[22:14:27] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[22:14:27] [PASSED] NV12 Normal sizes
[22:14:27] [PASSED] NV12 Max sizes
[22:14:27] [PASSED] NV12 Invalid pitch
[22:14:27] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[22:14:27] [PASSED] NV12 different  modifier per-plane
[22:14:27] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[22:14:27] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[22:14:27] [PASSED] NV12 Modifier for inexistent plane
[22:14:27] [PASSED] NV12 Handle for inexistent plane
[22:14:27] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[22:14:27] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[22:14:27] [PASSED] YVU420 Normal sizes
[22:14:27] [PASSED] YVU420 Max sizes
[22:14:27] [PASSED] YVU420 Invalid pitch
[22:14:27] [PASSED] YVU420 Different pitches
[22:14:27] [PASSED] YVU420 Different buffer offsets/pitches
[22:14:27] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[22:14:27] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[22:14:27] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[22:14:27] [PASSED] YVU420 Valid modifier
[22:14:27] [PASSED] YVU420 Different modifiers per plane
[22:14:27] [PASSED] YVU420 Modifier for inexistent plane
[22:14:27] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[22:14:27] [PASSED] X0L2 Normal sizes
[22:14:27] [PASSED] X0L2 Max sizes
[22:14:27] [PASSED] X0L2 Invalid pitch
[22:14:27] [PASSED] X0L2 Pitch greater than minimum required
[22:14:27] [PASSED] X0L2 Handle for inexistent plane
[22:14:27] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[22:14:27] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[22:14:27] [PASSED] X0L2 Valid modifier
[22:14:27] [PASSED] X0L2 Modifier for inexistent plane
[22:14:27] =========== [PASSED] drm_test_framebuffer_create ===========
[22:14:27] [PASSED] drm_test_framebuffer_free
[22:14:27] [PASSED] drm_test_framebuffer_init
[22:14:27] [PASSED] drm_test_framebuffer_init_bad_format
[22:14:27] [PASSED] drm_test_framebuffer_init_dev_mismatch
[22:14:27] [PASSED] drm_test_framebuffer_lookup
[22:14:27] [PASSED] drm_test_framebuffer_lookup_inexistent
[22:14:27] [PASSED] drm_test_framebuffer_modifiers_not_supported
[22:14:27] ================= [PASSED] drm_framebuffer =================
[22:14:27] ================ drm_gem_shmem (8 subtests) ================
[22:14:27] [PASSED] drm_gem_shmem_test_obj_create
[22:14:27] [PASSED] drm_gem_shmem_test_obj_create_private
[22:14:27] [PASSED] drm_gem_shmem_test_pin_pages
[22:14:27] [PASSED] drm_gem_shmem_test_vmap
[22:14:27] [PASSED] drm_gem_shmem_test_get_sg_table
[22:14:27] [PASSED] drm_gem_shmem_test_get_pages_sgt
[22:14:27] [PASSED] drm_gem_shmem_test_madvise
[22:14:27] [PASSED] drm_gem_shmem_test_purge
[22:14:27] ================== [PASSED] drm_gem_shmem ==================
[22:14:27] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[22:14:27] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[22:14:27] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[22:14:27] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[22:14:27] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[22:14:27] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[22:14:27] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[22:14:27] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[22:14:27] [PASSED] Automatic
[22:14:27] [PASSED] Full
[22:14:27] [PASSED] Limited 16:235
[22:14:27] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[22:14:27] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[22:14:27] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[22:14:27] [PASSED] drm_test_check_disable_connector
[22:14:27] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[22:14:27] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[22:14:27] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[22:14:27] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[22:14:27] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[22:14:27] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[22:14:27] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[22:14:27] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[22:14:27] [PASSED] drm_test_check_output_bpc_dvi
[22:14:27] [PASSED] drm_test_check_output_bpc_format_vic_1
[22:14:27] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[22:14:27] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[22:14:27] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[22:14:27] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[22:14:27] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[22:14:27] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[22:14:27] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[22:14:27] ============ drm_test_check_hdmi_color_format  =============
[22:14:27] [PASSED] AUTO -> RGB
[22:14:27] [PASSED] YCBCR422 -> YUV422
[22:14:27] [PASSED] YCBCR420 -> YUV420
[22:14:27] [PASSED] YCBCR444 -> YUV444
[22:14:27] [PASSED] RGB -> RGB
[22:14:27] ======== [PASSED] drm_test_check_hdmi_color_format =========
[22:14:27] ======== drm_test_check_hdmi_color_format_420_only  ========
[22:14:27] [PASSED] RGB should fail
[22:14:27] [PASSED] YUV444 should fail
[22:14:27] [PASSED] YUV422 should fail
[22:14:27] [PASSED] YUV420 should work
[22:14:27] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[22:14:27] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[22:14:27] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[22:14:27] [PASSED] drm_test_check_broadcast_rgb_value
[22:14:27] [PASSED] drm_test_check_bpc_8_value
[22:14:27] [PASSED] drm_test_check_bpc_10_value
[22:14:27] [PASSED] drm_test_check_bpc_12_value
[22:14:27] [PASSED] drm_test_check_format_value
[22:14:27] [PASSED] drm_test_check_tmds_char_value
[22:14:27] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[22:14:27] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[22:14:27] [PASSED] drm_test_check_mode_valid
[22:14:27] [PASSED] drm_test_check_mode_valid_reject
[22:14:27] [PASSED] drm_test_check_mode_valid_reject_rate
[22:14:27] [PASSED] drm_test_check_mode_valid_reject_max_clock
[22:14:27] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[22:14:27] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[22:14:27] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[22:14:27] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[22:14:27] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[22:14:27] [PASSED] drm_test_check_infoframes
[22:14:27] [PASSED] drm_test_check_reject_avi_infoframe
[22:14:27] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[22:14:27] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[22:14:27] [PASSED] drm_test_check_reject_audio_infoframe
[22:14:27] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[22:14:27] ================= drm_managed (2 subtests) =================
[22:14:27] [PASSED] drm_test_managed_release_action
[22:14:27] [PASSED] drm_test_managed_run_action
[22:14:27] =================== [PASSED] drm_managed ===================
[22:14:27] =================== drm_mm (6 subtests) ====================
[22:14:27] [PASSED] drm_test_mm_init
[22:14:27] [PASSED] drm_test_mm_debug
[22:14:27] [PASSED] drm_test_mm_align32
[22:14:27] [PASSED] drm_test_mm_align64
[22:14:27] [PASSED] drm_test_mm_lowest
[22:14:27] [PASSED] drm_test_mm_highest
[22:14:27] ===================== [PASSED] drm_mm ======================
[22:14:27] ============= drm_modes_analog_tv (5 subtests) =============
[22:14:27] [PASSED] drm_test_modes_analog_tv_mono_576i
[22:14:27] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[22:14:27] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[22:14:27] [PASSED] drm_test_modes_analog_tv_pal_576i
[22:14:27] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[22:14:27] =============== [PASSED] drm_modes_analog_tv ===============
[22:14:27] ============== drm_plane_helper (2 subtests) ===============
[22:14:27] =============== drm_test_check_plane_state  ================
[22:14:27] [PASSED] clipping_simple
[22:14:27] [PASSED] clipping_rotate_reflect
[22:14:27] [PASSED] positioning_simple
[22:14:27] [PASSED] upscaling
[22:14:27] [PASSED] downscaling
[22:14:27] [PASSED] rounding1
[22:14:27] [PASSED] rounding2
[22:14:27] [PASSED] rounding3
[22:14:27] [PASSED] rounding4
[22:14:27] =========== [PASSED] drm_test_check_plane_state ============
[22:14:27] =========== drm_test_check_invalid_plane_state  ============
[22:14:27] [PASSED] positioning_invalid
[22:14:27] [PASSED] upscaling_invalid
[22:14:27] [PASSED] downscaling_invalid
[22:14:27] ======= [PASSED] drm_test_check_invalid_plane_state ========
[22:14:27] ================ [PASSED] drm_plane_helper =================
[22:14:27] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[22:14:27] ====== drm_test_connector_helper_tv_get_modes_check  =======
[22:14:27] [PASSED] None
[22:14:27] [PASSED] PAL
[22:14:27] [PASSED] NTSC
[22:14:27] [PASSED] Both, NTSC Default
[22:14:27] [PASSED] Both, PAL Default
[22:14:27] [PASSED] Both, NTSC Default, with PAL on command-line
[22:14:27] [PASSED] Both, PAL Default, with NTSC on command-line
[22:14:27] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[22:14:27] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[22:14:27] ================== drm_rect (9 subtests) ===================
[22:14:27] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[22:14:27] [PASSED] drm_test_rect_clip_scaled_not_clipped
[22:14:27] [PASSED] drm_test_rect_clip_scaled_clipped
[22:14:27] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[22:14:27] ================= drm_test_rect_intersect  =================
[22:14:27] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[22:14:27] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[22:14:27] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[22:14:27] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[22:14:27] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[22:14:27] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[22:14:27] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[22:14:27] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[22:14:27] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[22:14:27] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[22:14:27] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[22:14:27] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[22:14:27] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[22:14:27] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[22:14:27] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[22:14:27] ============= [PASSED] drm_test_rect_intersect =============
[22:14:27] ================ drm_test_rect_calc_hscale  ================
[22:14:27] [PASSED] normal use
[22:14:27] [PASSED] out of max range
[22:14:27] [PASSED] out of min range
[22:14:27] [PASSED] zero dst
[22:14:27] [PASSED] negative src
[22:14:27] [PASSED] negative dst
[22:14:27] ============ [PASSED] drm_test_rect_calc_hscale ============
[22:14:27] ================ drm_test_rect_calc_vscale  ================
[22:14:27] [PASSED] normal use
[22:14:27] [PASSED] out of max range
[22:14:27] [PASSED] out of min range
[22:14:27] [PASSED] zero dst
[22:14:27] [PASSED] negative src
[22:14:27] [PASSED] negative dst
[22:14:27] ============ [PASSED] drm_test_rect_calc_vscale ============
[22:14:27] ================== drm_test_rect_rotate  ===================
[22:14:27] [PASSED] reflect-x
[22:14:27] [PASSED] reflect-y
[22:14:27] [PASSED] rotate-0
[22:14:27] [PASSED] rotate-90
[22:14:27] [PASSED] rotate-180
[22:14:27] [PASSED] rotate-270
[22:14:27] ============== [PASSED] drm_test_rect_rotate ===============
[22:14:27] ================ drm_test_rect_rotate_inv  =================
[22:14:27] [PASSED] reflect-x
[22:14:27] [PASSED] reflect-y
[22:14:27] [PASSED] rotate-0
[22:14:27] [PASSED] rotate-90
[22:14:27] [PASSED] rotate-180
[22:14:27] [PASSED] rotate-270
[22:14:27] ============ [PASSED] drm_test_rect_rotate_inv =============
[22:14:27] ==================== [PASSED] drm_rect =====================
[22:14:27] ============ drm_sysfb_modeset_test (1 subtest) ============
[22:14:27] ============ drm_test_sysfb_build_fourcc_list  =============
[22:14:27] [PASSED] no native formats
[22:14:27] [PASSED] XRGB8888 as native format
[22:14:27] [PASSED] remove duplicates
[22:14:27] [PASSED] convert alpha formats
[22:14:27] [PASSED] random formats
[22:14:27] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[22:14:27] ============= [PASSED] drm_sysfb_modeset_test ==============
[22:14:27] ================== drm_fixp (2 subtests) ===================
[22:14:27] [PASSED] drm_test_int2fixp
[22:14:27] [PASSED] drm_test_sm2fixp
[22:14:27] ==================== [PASSED] drm_fixp =====================
[22:14:27] ============================================================
[22:14:27] Testing complete. Ran 641 tests: passed: 641
[22:14:27] Elapsed time: 27.011s total, 1.860s configuring, 24.983s building, 0.144s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[22:14:27] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:14:29] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[22:14:39] Starting KUnit Kernel (1/1)...
[22:14:39] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:14:39] ============= refcount_interrupt (4 subtests) ==============
[22:14:39] [PASSED] test_single_irq_change
[22:14:39] [PASSED] test_nested_irq_change
[22:14:39] [PASSED] test_multiple_irq_change
[22:14:39] [PASSED] test_irq_save
[22:14:39] =============== [PASSED] refcount_interrupt ================
[22:14:39] ================= ttm_device (5 subtests) ==================
[22:14:39] [PASSED] ttm_device_init_basic
[22:14:39] [PASSED] ttm_device_init_multiple
[22:14:39] [PASSED] ttm_device_fini_basic
[22:14:39] [PASSED] ttm_device_init_no_vma_man
[22:14:39] ================== ttm_device_init_pools  ==================
[22:14:39] [PASSED] No DMA allocations, no DMA32 required
[22:14:39] [PASSED] DMA allocations, DMA32 required
[22:14:39] [PASSED] No DMA allocations, DMA32 required
[22:14:39] [PASSED] DMA allocations, no DMA32 required
[22:14:39] ============== [PASSED] ttm_device_init_pools ==============
[22:14:39] =================== [PASSED] ttm_device ====================
[22:14:39] ================== ttm_pool (8 subtests) ===================
[22:14:39] ================== ttm_pool_alloc_basic  ===================
[22:14:39] [PASSED] One page
[22:14:39] [PASSED] More than one page
[22:14:39] [PASSED] Above the allocation limit
[22:14:39] [PASSED] One page, with coherent DMA mappings enabled
[22:14:39] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[22:14:39] ============== [PASSED] ttm_pool_alloc_basic ===============
[22:14:39] ============== ttm_pool_alloc_basic_dma_addr  ==============
[22:14:39] [PASSED] One page
[22:14:39] [PASSED] More than one page
[22:14:39] [PASSED] Above the allocation limit
[22:14:39] [PASSED] One page, with coherent DMA mappings enabled
[22:14:39] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[22:14:39] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[22:14:39] [PASSED] ttm_pool_alloc_order_caching_match
[22:14:39] [PASSED] ttm_pool_alloc_caching_mismatch
[22:14:39] [PASSED] ttm_pool_alloc_order_mismatch
[22:14:39] [PASSED] ttm_pool_free_dma_alloc
[22:14:39] [PASSED] ttm_pool_free_no_dma_alloc
[22:14:39] [PASSED] ttm_pool_fini_basic
[22:14:39] ==================== [PASSED] ttm_pool =====================
[22:14:39] ================ ttm_resource (8 subtests) =================
[22:14:39] ================= ttm_resource_init_basic  =================
[22:14:39] [PASSED] Init resource in TTM_PL_SYSTEM
[22:14:39] [PASSED] Init resource in TTM_PL_VRAM
[22:14:39] [PASSED] Init resource in a private placement
[22:14:39] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[22:14:39] ============= [PASSED] ttm_resource_init_basic =============
[22:14:39] [PASSED] ttm_resource_init_pinned
[22:14:39] [PASSED] ttm_resource_fini_basic
[22:14:39] [PASSED] ttm_resource_manager_init_basic
[22:14:39] [PASSED] ttm_resource_manager_usage_basic
[22:14:39] [PASSED] ttm_resource_manager_set_used_basic
[22:14:39] [PASSED] ttm_sys_man_alloc_basic
[22:14:39] [PASSED] ttm_sys_man_free_basic
[22:14:39] ================== [PASSED] ttm_resource ===================
[22:14:39] =================== ttm_tt (15 subtests) ===================
[22:14:39] ==================== ttm_tt_init_basic  ====================
[22:14:39] [PASSED] Page-aligned size
[22:14:39] [PASSED] Extra pages requested
[22:14:39] ================ [PASSED] ttm_tt_init_basic ================
[22:14:39] [PASSED] ttm_tt_init_misaligned
[22:14:39] [PASSED] ttm_tt_fini_basic
[22:14:39] [PASSED] ttm_tt_fini_sg
[22:14:39] [PASSED] ttm_tt_fini_shmem
[22:14:39] [PASSED] ttm_tt_create_basic
[22:14:39] [PASSED] ttm_tt_create_invalid_bo_type
[22:14:39] [PASSED] ttm_tt_create_ttm_exists
[22:14:39] [PASSED] ttm_tt_create_failed
[22:14:39] [PASSED] ttm_tt_destroy_basic
[22:14:39] [PASSED] ttm_tt_populate_null_ttm
[22:14:39] [PASSED] ttm_tt_populate_populated_ttm
[22:14:39] [PASSED] ttm_tt_unpopulate_basic
[22:14:39] [PASSED] ttm_tt_unpopulate_empty_ttm
[22:14:39] [PASSED] ttm_tt_swapin_basic
[22:14:39] ===================== [PASSED] ttm_tt ======================
[22:14:39] =================== ttm_bo (14 subtests) ===================
[22:14:39] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[22:14:39] [PASSED] Cannot be interrupted and sleeps
[22:14:39] [PASSED] Cannot be interrupted, locks straight away
[22:14:39] [PASSED] Can be interrupted, sleeps
[22:14:39] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[22:14:39] [PASSED] ttm_bo_reserve_locked_no_sleep
[22:14:39] [PASSED] ttm_bo_reserve_no_wait_ticket
[22:14:39] [PASSED] ttm_bo_reserve_double_resv
[22:14:39] [PASSED] ttm_bo_reserve_interrupted
[22:14:39] [PASSED] ttm_bo_reserve_deadlock
[22:14:39] [PASSED] ttm_bo_unreserve_basic
[22:14:39] [PASSED] ttm_bo_unreserve_pinned
[22:14:39] [PASSED] ttm_bo_unreserve_bulk
[22:14:39] [PASSED] ttm_bo_fini_basic
[22:14:39] [PASSED] ttm_bo_fini_shared_resv
[22:14:39] [PASSED] ttm_bo_pin_basic
[22:14:39] [PASSED] ttm_bo_pin_unpin_resource
[22:14:39] [PASSED] ttm_bo_multiple_pin_one_unpin
[22:14:39] ===================== [PASSED] ttm_bo ======================
[22:14:39] ============== ttm_bo_validate (22 subtests) ===============
[22:14:39] ============== ttm_bo_init_reserved_sys_man  ===============
[22:14:39] [PASSED] Buffer object for userspace
[22:14:39] [PASSED] Kernel buffer object
[22:14:39] [PASSED] Shared buffer object
[22:14:39] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[22:14:39] ============== ttm_bo_init_reserved_mock_man  ==============
[22:14:39] [PASSED] Buffer object for userspace
[22:14:39] [PASSED] Kernel buffer object
[22:14:39] [PASSED] Shared buffer object
[22:14:39] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[22:14:39] [PASSED] ttm_bo_init_reserved_resv
[22:14:39] ================== ttm_bo_validate_basic  ==================
[22:14:39] [PASSED] Buffer object for userspace
[22:14:39] [PASSED] Kernel buffer object
[22:14:39] [PASSED] Shared buffer object
[22:14:39] ============== [PASSED] ttm_bo_validate_basic ==============
[22:14:39] [PASSED] ttm_bo_validate_invalid_placement
[22:14:39] ============= ttm_bo_validate_same_placement  ==============
[22:14:39] [PASSED] System manager
[22:14:39] [PASSED] VRAM manager
[22:14:39] ========= [PASSED] ttm_bo_validate_same_placement ==========
[22:14:39] [PASSED] ttm_bo_validate_failed_alloc
[22:14:39] [PASSED] ttm_bo_validate_pinned
[22:14:39] [PASSED] ttm_bo_validate_busy_placement
[22:14:39] ================ ttm_bo_validate_multihop  =================
[22:14:39] [PASSED] Buffer object for userspace
[22:14:39] [PASSED] Kernel buffer object
[22:14:39] [PASSED] Shared buffer object
[22:14:39] ============ [PASSED] ttm_bo_validate_multihop =============
[22:14:39] ========== ttm_bo_validate_no_placement_signaled  ==========
[22:14:39] [PASSED] Buffer object in system domain, no page vector
[22:14:39] [PASSED] Buffer object in system domain with an existing page vector
[22:14:39] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[22:14:39] ======== ttm_bo_validate_no_placement_not_signaled  ========
[22:14:39] [PASSED] Buffer object for userspace
[22:14:39] [PASSED] Kernel buffer object
[22:14:39] [PASSED] Shared buffer object
[22:14:39] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[22:14:39] [PASSED] ttm_bo_validate_move_fence_signaled
[22:14:39] ========= ttm_bo_validate_move_fence_not_signaled  =========
[22:14:39] [PASSED] Waits for GPU
[22:14:39] [PASSED] Tries to lock straight away
[22:14:39] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[22:14:39] [PASSED] ttm_bo_validate_swapout
[22:14:39] [PASSED] ttm_bo_validate_happy_evict
[22:14:39] [PASSED] ttm_bo_validate_all_pinned_evict
[22:14:39] [PASSED] ttm_bo_validate_allowed_only_evict
[22:14:39] [PASSED] ttm_bo_validate_deleted_evict
[22:14:39] [PASSED] ttm_bo_validate_busy_domain_evict
[22:14:39] [PASSED] ttm_bo_validate_evict_gutting
[22:14:39] [PASSED] ttm_bo_validate_recrusive_evict
[22:14:39] ================= [PASSED] ttm_bo_validate =================
[22:14:39] ============================================================
[22:14:39] Testing complete. Ran 106 tests: passed: 106
[22:14:39] Elapsed time: 12.118s total, 1.826s configuring, 10.027s building, 0.229s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/dma-buf/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[22:14:40] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:14:41] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[22:14:50] Starting KUnit Kernel (1/1)...
[22:14:50] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:14:50] ============= refcount_interrupt (4 subtests) ==============
[22:14:50] [PASSED] test_single_irq_change
[22:14:50] [PASSED] test_nested_irq_change
[22:14:50] [PASSED] test_multiple_irq_change
[22:14:50] [PASSED] test_irq_save
[22:14:50] =============== [PASSED] refcount_interrupt ================
[22:14:50] =============== dma-buf-fence (12 subtests) ================
[22:14:50] [PASSED] test_sanitycheck
[22:14:50] [PASSED] test_signaling
[22:14:50] [PASSED] test_add_callback
[22:14:50] [PASSED] test_late_add_callback
[22:14:50] [PASSED] test_rm_callback
[22:14:50] [PASSED] test_late_rm_callback
[22:14:50] [PASSED] test_status
[22:14:50] [PASSED] test_error
[22:14:50] [PASSED] test_wait
[22:14:50] [PASSED] test_wait_timeout
[22:14:50] [PASSED] test_stub
[22:14:50] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[22:14:50] ================== [PASSED] dma-buf-fence ==================
[22:14:50] ============ dma-buf-fence-chain (11 subtests) =============
[22:14:50] [PASSED] test_sanitycheck
[22:14:50] [PASSED] test_find_seqno
[22:14:50] [PASSED] test_find_signaled
[22:14:50] [PASSED] test_find_out_of_order
[22:14:55] [PASSED] test_find_gap
[22:14:55] [PASSED] test_find_race
[22:14:55] [PASSED] test_signal_forward
[22:14:55] [PASSED] test_signal_backward
[22:14:55] [PASSED] test_wait_forward
[22:14:55] [PASSED] test_wait_backward
[22:14:55] [PASSED] test_wait_random
[22:14:55] =============== [PASSED] dma-buf-fence-chain ===============
[22:14:55] ============ dma-buf-fence-unwrap (10 subtests) ============
[22:14:55] [PASSED] test_sanitycheck
[22:14:55] [PASSED] test_unwrap_array
[22:14:55] [PASSED] test_unwrap_chain
[22:14:55] [PASSED] test_unwrap_chain_array
[22:14:55] [PASSED] test_unwrap_merge
[22:14:55] [PASSED] test_unwrap_merge_duplicate
[22:14:55] [PASSED] test_unwrap_merge_seqno
[22:14:55] [PASSED] test_unwrap_merge_order
[22:14:55] [PASSED] test_unwrap_merge_complex
[22:14:55] [PASSED] test_unwrap_merge_complex_seqno
[22:14:55] ============== [PASSED] dma-buf-fence-unwrap ===============
[22:14:55] ================ dma-buf-resv (5 subtests) =================
[22:14:55] [PASSED] test_sanitycheck
[22:14:55] ===================== test_signaling  ======================
[22:14:55] [PASSED] kernel
[22:14:55] [PASSED] write
[22:14:55] [PASSED] read
[22:14:55] [PASSED] bookkeep
[22:14:55] ================= [PASSED] test_signaling ==================
[22:14:55] ====================== test_for_each  ======================
[22:14:55] [PASSED] kernel
[22:14:55] [PASSED] write
[22:14:55] [PASSED] read
[22:14:55] [PASSED] bookkeep
[22:14:55] ================== [PASSED] test_for_each ==================
[22:14:55] ================= test_for_each_unlocked  ==================
[22:14:55] [PASSED] kernel
[22:14:55] [PASSED] write
[22:14:55] [PASSED] read
[22:14:55] [PASSED] bookkeep
[22:14:55] ============= [PASSED] test_for_each_unlocked ==============
[22:14:55] ===================== test_get_fences  =====================
[22:14:55] [PASSED] kernel
[22:14:55] [PASSED] write
[22:14:55] [PASSED] read
[22:14:55] [PASSED] bookkeep
[22:14:55] ================= [PASSED] test_get_fences =================
[22:14:55] ================== [PASSED] dma-buf-resv ===================
[22:14:55] ============================================================
[22:14:55] Testing complete. Ran 54 tests: passed: 53, skipped: 1
[22:14:56] Elapsed time: 15.871s total, 1.829s configuring, 8.771s building, 5.260s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


