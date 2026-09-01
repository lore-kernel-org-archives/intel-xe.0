Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5D8C61DD3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 09:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D1F10EC36;
	Tue,  1 Sep 2026 09:09:36 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE75E10EC31;
 Tue,  1 Sep 2026 09:09:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/gpusvm=3A_share_one_HMM_fa?=
 =?utf-8?q?ult_across_per-device_DMA_mappings_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Honglei Huang" <honghuan@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Sep 2026 09:09:34 -0000
Message-ID: <178825377470.106842.7049459441648245102@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260901090100.2024933-1-honghuan@amd.com>
In-Reply-To: <20260901090100.2024933-1-honghuan@amd.com>
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

Series: drm/gpusvm: share one HMM fault across per-device DMA mappings (rev2)
URL   : https://patchwork.freedesktop.org/series/172838/
State : success

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[09:07:33] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:07:37] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[09:07:58] Starting KUnit Kernel (1/1)...
[09:07:58] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[09:07:58] ============= refcount_interrupt (4 subtests) ==============
[09:07:58] [PASSED] test_single_irq_change
[09:07:58] [PASSED] test_nested_irq_change
[09:07:58] [PASSED] test_multiple_irq_change
[09:07:58] [PASSED] test_irq_save
[09:07:58] =============== [PASSED] refcount_interrupt ================
[09:07:58] ================= gpu_buddy (14 subtests) ==================
[09:07:58] [PASSED] gpu_test_buddy_alloc_limit
[09:07:58] [PASSED] gpu_test_buddy_alloc_optimistic
[09:07:58] [PASSED] gpu_test_buddy_alloc_pessimistic
[09:07:58] [PASSED] gpu_test_buddy_alloc_pathological
[09:07:58] [PASSED] gpu_test_buddy_alloc_contiguous
[09:07:58] [PASSED] gpu_test_buddy_alloc_clear
[09:07:58] [PASSED] gpu_test_buddy_alloc_range
[09:07:58] [PASSED] gpu_test_buddy_alloc_range_bias
[09:07:59] [PASSED] gpu_test_buddy_fragmentation_performance
[09:08:00] [PASSED] gpu_test_buddy_dirty_tracker_performance
[09:08:00] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[09:08:00] [PASSED] gpu_test_buddy_offset_aligned_allocation
[09:08:00] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[09:08:00] [PASSED] gpu_test_buddy_addr_to_block
[09:08:00] ==================== [PASSED] gpu_buddy ====================
[09:08:00] ============================================================
[09:08:00] Testing complete. Ran 18 tests: passed: 18
[09:08:00] Elapsed time: 26.775s total, 4.437s configuring, 20.371s building, 1.893s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[09:08:00] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:08:02] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[09:08:35] Starting KUnit Kernel (1/1)...
[09:08:35] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[09:08:36] ============= refcount_interrupt (4 subtests) ==============
[09:08:36] [PASSED] test_single_irq_change
[09:08:36] [PASSED] test_nested_irq_change
[09:08:36] [PASSED] test_multiple_irq_change
[09:08:36] [PASSED] test_irq_save
[09:08:36] =============== [PASSED] refcount_interrupt ================
[09:08:36] ================== guc_buf (11 subtests) ===================
[09:08:36] [PASSED] test_smallest
[09:08:36] [PASSED] test_largest
[09:08:36] [PASSED] test_granular
[09:08:36] [PASSED] test_unique
[09:08:36] [PASSED] test_overlap
[09:08:36] [PASSED] test_reusable
[09:08:36] [PASSED] test_too_big
[09:08:36] [PASSED] test_flush
[09:08:36] [PASSED] test_lookup
[09:08:36] [PASSED] test_data
[09:08:36] [PASSED] test_class
[09:08:36] ===================== [PASSED] guc_buf =====================
[09:08:36] =================== guc_dbm (7 subtests) ===================
[09:08:36] [PASSED] test_empty
[09:08:36] [PASSED] test_default
[09:08:36] ======================== test_size  ========================
[09:08:36] [PASSED] 4
[09:08:36] [PASSED] 8
[09:08:36] [PASSED] 32
[09:08:36] [PASSED] 256
[09:08:36] ==================== [PASSED] test_size ====================
[09:08:36] ======================= test_reuse  ========================
[09:08:36] [PASSED] 4
[09:08:36] [PASSED] 8
[09:08:36] [PASSED] 32
[09:08:36] [PASSED] 256
[09:08:36] =================== [PASSED] test_reuse ====================
[09:08:36] =================== test_range_overlap  ====================
[09:08:36] [PASSED] 4
[09:08:36] [PASSED] 8
[09:08:36] [PASSED] 32
[09:08:36] [PASSED] 256
[09:08:36] =============== [PASSED] test_range_overlap ================
[09:08:36] =================== test_range_compact  ====================
[09:08:36] [PASSED] 4
[09:08:36] [PASSED] 8
[09:08:36] [PASSED] 32
[09:08:36] [PASSED] 256
[09:08:36] =============== [PASSED] test_range_compact ================
[09:08:36] ==================== test_range_spare  =====================
[09:08:36] [PASSED] 4
[09:08:36] [PASSED] 8
[09:08:36] [PASSED] 32
[09:08:36] [PASSED] 256
[09:08:36] ================ [PASSED] test_range_spare =================
[09:08:36] ===================== [PASSED] guc_dbm =====================
[09:08:36] =================== guc_idm (6 subtests) ===================
[09:08:36] [PASSED] bad_init
[09:08:36] [PASSED] no_init
[09:08:36] [PASSED] init_fini
[09:08:36] [PASSED] check_used
[09:08:36] [PASSED] check_quota
[09:08:36] [PASSED] check_all
[09:08:36] ===================== [PASSED] guc_idm =====================
[09:08:36] =============== guc_klv_helpers (9 subtests) ===============
[09:08:36] [PASSED] test_count
[09:08:36] [PASSED] test_encode_u32
[09:08:36] [PASSED] test_encode_u64
[09:08:36] [PASSED] test_encode_string
[09:08:36] [PASSED] test_encode_object_raw
[09:08:36] [PASSED] test_encode_object_klv
[09:08:36] [PASSED] test_encode_object_nested
[09:08:36] [PASSED] test_encode_object_basic
[09:08:36] [PASSED] test_print
[09:08:36] ================= [PASSED] guc_klv_helpers =================
[09:08:36] =================== xe_log (4 subtests) ====================
[09:08:36] [PASSED] demo_cper
[09:08:36] [PASSED] demo_dmesg
[09:08:36] ======================= test_dmesg  ========================
[09:08:36] [PASSED] test_fatal
[09:08:36] [PASSED] test_fatal_tile
[09:08:36] [PASSED] test_fatal_gt
[09:08:36] [PASSED] test_fatal_comp
[09:08:36] [PASSED] test_fatal_comp_tile
[09:08:36] [PASSED] test_fatal_comp_gt
[09:08:36] [PASSED] test_fatal_all
[09:08:36] [PASSED] test_recoverable
[09:08:36] [PASSED] test_recoverable_tile
[09:08:36] [PASSED] test_recoverable_gt
[09:08:36] [PASSED] test_recoverable_comp
[09:08:36] [PASSED] test_recoverable_comp_tile
[09:08:36] [PASSED] test_recoverable_comp_gt
[09:08:36] [PASSED] test_recoverable_all
[09:08:36] [PASSED] test_info
[09:08:36] [PASSED] test_info_tile
[09:08:36] [PASSED] test_info_gt
[09:08:36] [PASSED] test_info_err
[09:08:36] [PASSED] test_info_comp
[09:08:36] [PASSED] test_info_comp_tile
[09:08:36] [PASSED] test_info_comp_gt
[09:08:36] [PASSED] test_info_all
[09:08:36] [PASSED] test_hw_fatal
[09:08:36] [PASSED] test_hw_recoverable
[09:08:36] [PASSED] test_hw_corrected
[09:08:36] [PASSED] test_hw_informational
[09:08:36] =================== [PASSED] test_dmesg ====================
[09:08:36] ====================== test_invalid  =======================
[09:08:36] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[09:08:36] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[09:08:36] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[09:08:36] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[09:08:36] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[09:08:36] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[09:08:36] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[09:08:36] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[09:08:36] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[09:08:36] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[09:08:36] ================== [SKIPPED] test_invalid ==================
[09:08:36] ===================== [PASSED] xe_log ======================
[09:08:36] ================== no_relay (3 subtests) ===================
[09:08:36] [PASSED] xe_drops_guc2pf_if_not_ready
[09:08:36] [PASSED] xe_drops_guc2vf_if_not_ready
[09:08:36] [PASSED] xe_rejects_send_if_not_ready
[09:08:36] ==================== [PASSED] no_relay =====================
[09:08:36] ================== pf_relay (14 subtests) ==================
[09:08:36] [PASSED] pf_rejects_guc2pf_too_short
[09:08:36] [PASSED] pf_rejects_guc2pf_too_long
[09:08:36] [PASSED] pf_rejects_guc2pf_no_payload
[09:08:36] [PASSED] pf_fails_no_payload
[09:08:36] [PASSED] pf_fails_bad_origin
[09:08:36] [PASSED] pf_fails_bad_type
[09:08:36] [PASSED] pf_txn_reports_error
[09:08:36] [PASSED] pf_txn_sends_pf2guc
[09:08:36] [PASSED] pf_sends_pf2guc
[09:08:36] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[09:08:36] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[09:08:36] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[09:08:36] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[09:08:36] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[09:08:36] ==================== [PASSED] pf_relay =====================
[09:08:36] ================== vf_relay (3 subtests) ===================
[09:08:36] [PASSED] vf_rejects_guc2vf_too_short
[09:08:36] [PASSED] vf_rejects_guc2vf_too_long
[09:08:36] [PASSED] vf_rejects_guc2vf_no_payload
[09:08:36] ==================== [PASSED] vf_relay =====================
[09:08:36] ================ pf_gt_config (9 subtests) =================
[09:08:36] [PASSED] fair_contexts_1vf
[09:08:36] [PASSED] fair_doorbells_1vf
[09:08:36] [PASSED] fair_ggtt_1vf
[09:08:36] ====================== fair_vram_1vf  ======================
[09:08:36] [PASSED] 3.50 GiB
[09:08:36] [PASSED] 11.5 GiB
[09:08:36] [PASSED] 15.5 GiB
[09:08:36] [PASSED] 31.5 GiB
[09:08:36] [PASSED] 63.5 GiB
[09:08:36] [PASSED] 1.91 GiB
[09:08:36] ================== [PASSED] fair_vram_1vf ==================
[09:08:36] ================ fair_vram_1vf_admin_only  =================
[09:08:36] [PASSED] 3.50 GiB
[09:08:36] [PASSED] 11.5 GiB
[09:08:36] [PASSED] 15.5 GiB
[09:08:36] [PASSED] 31.5 GiB
[09:08:36] [PASSED] 63.5 GiB
[09:08:36] [PASSED] 1.91 GiB
[09:08:36] ============ [PASSED] fair_vram_1vf_admin_only =============
[09:08:36] ====================== fair_contexts  ======================
[09:08:36] [PASSED] 1 VF
[09:08:36] [PASSED] 2 VFs
[09:08:36] [PASSED] 3 VFs
[09:08:36] [PASSED] 4 VFs
[09:08:36] [PASSED] 5 VFs
[09:08:36] [PASSED] 6 VFs
[09:08:36] [PASSED] 7 VFs
[09:08:36] [PASSED] 8 VFs
[09:08:36] [PASSED] 9 VFs
[09:08:36] [PASSED] 10 VFs
[09:08:36] [PASSED] 11 VFs
[09:08:36] [PASSED] 12 VFs
[09:08:36] [PASSED] 13 VFs
[09:08:36] [PASSED] 14 VFs
[09:08:36] [PASSED] 15 VFs
[09:08:36] [PASSED] 16 VFs
[09:08:36] [PASSED] 17 VFs
[09:08:36] [PASSED] 18 VFs
[09:08:36] [PASSED] 19 VFs
[09:08:36] [PASSED] 20 VFs
[09:08:36] [PASSED] 21 VFs
[09:08:36] [PASSED] 22 VFs
[09:08:36] [PASSED] 23 VFs
[09:08:36] [PASSED] 24 VFs
[09:08:36] [PASSED] 25 VFs
[09:08:36] [PASSED] 26 VFs
[09:08:36] [PASSED] 27 VFs
[09:08:36] [PASSED] 28 VFs
[09:08:36] [PASSED] 29 VFs
[09:08:36] [PASSED] 30 VFs
[09:08:36] [PASSED] 31 VFs
[09:08:36] [PASSED] 32 VFs
[09:08:36] [PASSED] 33 VFs
[09:08:36] [PASSED] 34 VFs
[09:08:36] [PASSED] 35 VFs
[09:08:36] [PASSED] 36 VFs
[09:08:36] [PASSED] 37 VFs
[09:08:36] [PASSED] 38 VFs
[09:08:36] [PASSED] 39 VFs
[09:08:36] [PASSED] 40 VFs
[09:08:36] [PASSED] 41 VFs
[09:08:36] [PASSED] 42 VFs
[09:08:36] [PASSED] 43 VFs
[09:08:36] [PASSED] 44 VFs
[09:08:36] [PASSED] 45 VFs
[09:08:36] [PASSED] 46 VFs
[09:08:36] [PASSED] 47 VFs
[09:08:36] [PASSED] 48 VFs
[09:08:36] [PASSED] 49 VFs
[09:08:36] [PASSED] 50 VFs
[09:08:36] [PASSED] 51 VFs
[09:08:36] [PASSED] 52 VFs
[09:08:36] [PASSED] 53 VFs
[09:08:36] [PASSED] 54 VFs
[09:08:36] [PASSED] 55 VFs
[09:08:36] [PASSED] 56 VFs
[09:08:36] [PASSED] 57 VFs
[09:08:36] [PASSED] 58 VFs
[09:08:36] [PASSED] 59 VFs
[09:08:36] [PASSED] 60 VFs
[09:08:36] [PASSED] 61 VFs
[09:08:36] [PASSED] 62 VFs
[09:08:36] [PASSED] 63 VFs
[09:08:36] ================== [PASSED] fair_contexts ==================
[09:08:36] ===================== fair_doorbells  ======================
[09:08:36] [PASSED] 1 VF
[09:08:36] [PASSED] 2 VFs
[09:08:36] [PASSED] 3 VFs
[09:08:36] [PASSED] 4 VFs
[09:08:36] [PASSED] 5 VFs
[09:08:36] [PASSED] 6 VFs
[09:08:36] [PASSED] 7 VFs
[09:08:36] [PASSED] 8 VFs
[09:08:36] [PASSED] 9 VFs
[09:08:36] [PASSED] 10 VFs
[09:08:36] [PASSED] 11 VFs
[09:08:36] [PASSED] 12 VFs
[09:08:36] [PASSED] 13 VFs
[09:08:36] [PASSED] 14 VFs
[09:08:36] [PASSED] 15 VFs
[09:08:36] [PASSED] 16 VFs
[09:08:36] [PASSED] 17 VFs
[09:08:36] [PASSED] 18 VFs
[09:08:36] [PASSED] 19 VFs
[09:08:36] [PASSED] 20 VFs
[09:08:36] [PASSED] 21 VFs
[09:08:36] [PASSED] 22 VFs
[09:08:36] [PASSED] 23 VFs
[09:08:36] [PASSED] 24 VFs
[09:08:36] [PASSED] 25 VFs
[09:08:36] [PASSED] 26 VFs
[09:08:36] [PASSED] 27 VFs
[09:08:36] [PASSED] 28 VFs
[09:08:36] [PASSED] 29 VFs
[09:08:36] [PASSED] 30 VFs
[09:08:36] [PASSED] 31 VFs
[09:08:36] [PASSED] 32 VFs
[09:08:36] [PASSED] 33 VFs
[09:08:36] [PASSED] 34 VFs
[09:08:36] [PASSED] 35 VFs
[09:08:36] [PASSED] 36 VFs
[09:08:36] [PASSED] 37 VFs
[09:08:36] [PASSED] 38 VFs
[09:08:36] [PASSED] 39 VFs
[09:08:36] [PASSED] 40 VFs
[09:08:36] [PASSED] 41 VFs
[09:08:36] [PASSED] 42 VFs
[09:08:36] [PASSED] 43 VFs
[09:08:36] [PASSED] 44 VFs
[09:08:36] [PASSED] 45 VFs
[09:08:36] [PASSED] 46 VFs
[09:08:36] [PASSED] 47 VFs
[09:08:36] [PASSED] 48 VFs
[09:08:36] [PASSED] 49 VFs
[09:08:36] [PASSED] 50 VFs
[09:08:36] [PASSED] 51 VFs
[09:08:36] [PASSED] 52 VFs
[09:08:36] [PASSED] 53 VFs
[09:08:36] [PASSED] 54 VFs
[09:08:36] [PASSED] 55 VFs
[09:08:36] [PASSED] 56 VFs
[09:08:36] [PASSED] 57 VFs
[09:08:36] [PASSED] 58 VFs
[09:08:36] [PASSED] 59 VFs
[09:08:36] [PASSED] 60 VFs
[09:08:36] [PASSED] 61 VFs
[09:08:36] [PASSED] 62 VFs
[09:08:36] [PASSED] 63 VFs
[09:08:36] ================= [PASSED] fair_doorbells ==================
[09:08:36] ======================== fair_ggtt  ========================
[09:08:36] [PASSED] 1 VF
[09:08:36] [PASSED] 2 VFs
[09:08:36] [PASSED] 3 VFs
[09:08:36] [PASSED] 4 VFs
[09:08:36] [PASSED] 5 VFs
[09:08:36] [PASSED] 6 VFs
[09:08:36] [PASSED] 7 VFs
[09:08:36] [PASSED] 8 VFs
[09:08:36] [PASSED] 9 VFs
[09:08:36] [PASSED] 10 VFs
[09:08:36] [PASSED] 11 VFs
[09:08:36] [PASSED] 12 VFs
[09:08:36] [PASSED] 13 VFs
[09:08:36] [PASSED] 14 VFs
[09:08:36] [PASSED] 15 VFs
[09:08:36] [PASSED] 16 VFs
[09:08:36] [PASSED] 17 VFs
[09:08:36] [PASSED] 18 VFs
[09:08:36] [PASSED] 19 VFs
[09:08:36] [PASSED] 20 VFs
[09:08:36] [PASSED] 21 VFs
[09:08:36] [PASSED] 22 VFs
[09:08:36] [PASSED] 23 VFs
[09:08:36] [PASSED] 24 VFs
[09:08:36] [PASSED] 25 VFs
[09:08:36] [PASSED] 26 VFs
[09:08:36] [PASSED] 27 VFs
[09:08:36] [PASSED] 28 VFs
[09:08:36] [PASSED] 29 VFs
[09:08:36] [PASSED] 30 VFs
[09:08:36] [PASSED] 31 VFs
[09:08:36] [PASSED] 32 VFs
[09:08:36] [PASSED] 33 VFs
[09:08:36] [PASSED] 34 VFs
[09:08:36] [PASSED] 35 VFs
[09:08:36] [PASSED] 36 VFs
[09:08:36] [PASSED] 37 VFs
[09:08:36] [PASSED] 38 VFs
[09:08:36] [PASSED] 39 VFs
[09:08:36] [PASSED] 40 VFs
[09:08:36] [PASSED] 41 VFs
[09:08:36] [PASSED] 42 VFs
[09:08:36] [PASSED] 43 VFs
[09:08:36] [PASSED] 44 VFs
[09:08:36] [PASSED] 45 VFs
[09:08:36] [PASSED] 46 VFs
[09:08:36] [PASSED] 47 VFs
[09:08:36] [PASSED] 48 VFs
[09:08:36] [PASSED] 49 VFs
[09:08:36] [PASSED] 50 VFs
[09:08:36] [PASSED] 51 VFs
[09:08:36] [PASSED] 52 VFs
[09:08:36] [PASSED] 53 VFs
[09:08:36] [PASSED] 54 VFs
[09:08:36] [PASSED] 55 VFs
[09:08:36] [PASSED] 56 VFs
[09:08:36] [PASSED] 57 VFs
[09:08:36] [PASSED] 58 VFs
[09:08:36] [PASSED] 59 VFs
[09:08:36] [PASSED] 60 VFs
[09:08:36] [PASSED] 61 VFs
[09:08:36] [PASSED] 62 VFs
[09:08:36] [PASSED] 63 VFs
[09:08:36] ==================== [PASSED] fair_ggtt ====================
[09:08:36] ======================== fair_vram  ========================
[09:08:36] [PASSED] 1 VF
[09:08:36] [PASSED] 2 VFs
[09:08:36] [PASSED] 3 VFs
[09:08:36] [PASSED] 4 VFs
[09:08:36] [PASSED] 5 VFs
[09:08:36] [PASSED] 6 VFs
[09:08:36] [PASSED] 7 VFs
[09:08:36] [PASSED] 8 VFs
[09:08:36] [PASSED] 9 VFs
[09:08:36] [PASSED] 10 VFs
[09:08:36] [PASSED] 11 VFs
[09:08:36] [PASSED] 12 VFs
[09:08:36] [PASSED] 13 VFs
[09:08:36] [PASSED] 14 VFs
[09:08:36] [PASSED] 15 VFs
[09:08:36] [PASSED] 16 VFs
[09:08:36] [PASSED] 17 VFs
[09:08:36] [PASSED] 18 VFs
[09:08:36] [PASSED] 19 VFs
[09:08:36] [PASSED] 20 VFs
[09:08:36] [PASSED] 21 VFs
[09:08:36] [PASSED] 22 VFs
[09:08:36] [PASSED] 23 VFs
[09:08:36] [PASSED] 24 VFs
[09:08:36] [PASSED] 25 VFs
[09:08:36] [PASSED] 26 VFs
[09:08:36] [PASSED] 27 VFs
[09:08:36] [PASSED] 28 VFs
[09:08:36] [PASSED] 29 VFs
[09:08:36] [PASSED] 30 VFs
[09:08:36] [PASSED] 31 VFs
[09:08:36] [PASSED] 32 VFs
[09:08:36] [PASSED] 33 VFs
[09:08:36] [PASSED] 34 VFs
[09:08:36] [PASSED] 35 VFs
[09:08:36] [PASSED] 36 VFs
[09:08:36] [PASSED] 37 VFs
[09:08:36] [PASSED] 38 VFs
[09:08:36] [PASSED] 39 VFs
[09:08:36] [PASSED] 40 VFs
[09:08:36] [PASSED] 41 VFs
[09:08:36] [PASSED] 42 VFs
[09:08:36] [PASSED] 43 VFs
[09:08:36] [PASSED] 44 VFs
[09:08:36] [PASSED] 45 VFs
[09:08:36] [PASSED] 46 VFs
[09:08:36] [PASSED] 47 VFs
[09:08:36] [PASSED] 48 VFs
[09:08:36] [PASSED] 49 VFs
[09:08:36] [PASSED] 50 VFs
[09:08:36] [PASSED] 51 VFs
[09:08:36] [PASSED] 52 VFs
[09:08:36] [PASSED] 53 VFs
[09:08:36] [PASSED] 54 VFs
[09:08:36] [PASSED] 55 VFs
[09:08:36] [PASSED] 56 VFs
[09:08:36] [PASSED] 57 VFs
[09:08:36] [PASSED] 58 VFs
[09:08:36] [PASSED] 59 VFs
[09:08:36] [PASSED] 60 VFs
[09:08:36] [PASSED] 61 VFs
[09:08:36] [PASSED] 62 VFs
[09:08:36] [PASSED] 63 VFs
[09:08:36] ==================== [PASSED] fair_vram ====================
[09:08:36] ================== [PASSED] pf_gt_config ===================
[09:08:36] ===================== lmtt (1 subtest) =====================
[09:08:36] ======================== test_ops  =========================
[09:08:36] [PASSED] 2-level
[09:08:36] [PASSED] multi-level
[09:08:36] ==================== [PASSED] test_ops =====================
[09:08:36] ====================== [PASSED] lmtt =======================
[09:08:36] ================= sriov_packet (1 subtest) =================
[09:08:36] [PASSED] test_descriptor_init
[09:08:36] ================== [PASSED] sriov_packet ===================
[09:08:36] ================= pf_service (11 subtests) =================
[09:08:36] [PASSED] pf_negotiate_any
[09:08:36] [PASSED] pf_negotiate_base_match
[09:08:36] [PASSED] pf_negotiate_base_newer
[09:08:36] [PASSED] pf_negotiate_base_next
[09:08:36] [SKIPPED] pf_negotiate_base_older (no older minor)
[09:08:36] [PASSED] pf_negotiate_base_prev
[09:08:36] [PASSED] pf_negotiate_latest_match
[09:08:36] [PASSED] pf_negotiate_latest_newer
[09:08:36] [PASSED] pf_negotiate_latest_next
[09:08:36] [SKIPPED] pf_negotiate_latest_older (no older minor)
[09:08:36] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[09:08:36] =================== [PASSED] pf_service ====================
[09:08:36] ================= xe_guc_g2g (2 subtests) ==================
[09:08:36] ============== xe_live_guc_g2g_kunit_default  ==============
[09:08:36] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[09:08:36] ============== xe_live_guc_g2g_kunit_allmem  ===============
[09:08:36] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[09:08:36] =================== [SKIPPED] xe_guc_g2g ===================
[09:08:36] =================== xe_mocs (2 subtests) ===================
[09:08:36] ================ xe_live_mocs_kernel_kunit  ================
[09:08:36] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[09:08:36] ================ xe_live_mocs_reset_kunit  =================
[09:08:36] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[09:08:36] ==================== [SKIPPED] xe_mocs =====================
[09:08:36] ================= xe_migrate (2 subtests) ==================
[09:08:36] ================= xe_migrate_sanity_kunit  =================
[09:08:36] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[09:08:36] ================== xe_validate_ccs_kunit  ==================
[09:08:36] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[09:08:36] =================== [SKIPPED] xe_migrate ===================
[09:08:36] ================== xe_dma_buf (1 subtest) ==================
[09:08:36] ==================== xe_dma_buf_kunit  =====================
[09:08:36] ================ [SKIPPED] xe_dma_buf_kunit ================
[09:08:36] =================== [SKIPPED] xe_dma_buf ===================
[09:08:36] ================= xe_bo_shrink (1 subtest) =================
[09:08:36] =================== xe_bo_shrink_kunit  ====================
[09:08:36] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[09:08:36] ================== [SKIPPED] xe_bo_shrink ==================
[09:08:36] ==================== xe_bo (2 subtests) ====================
[09:08:36] ================== xe_ccs_migrate_kunit  ===================
[09:08:36] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[09:08:36] ==================== xe_bo_evict_kunit  ====================
[09:08:36] =============== [SKIPPED] xe_bo_evict_kunit ================
[09:08:36] ===================== [SKIPPED] xe_bo ======================
[09:08:36] =================== xe_any (9 subtests) ====================
[09:08:36] [PASSED] test_to_xe
[09:08:36] [PASSED] test_to_dev
[09:08:36] [PASSED] test_to_pdev
[09:08:36] [PASSED] test_to_drm
[09:08:36] [PASSED] test_if_pdev
[09:08:36] [PASSED] test_if_xe
[09:08:36] [PASSED] test_if_tile
[09:08:36] [PASSED] test_if_gt
[09:08:36] [PASSED] test_to_id
[09:08:36] ===================== [PASSED] xe_any ======================
[09:08:36] ==================== args (13 subtests) ====================
[09:08:36] [PASSED] count_args_test
[09:08:36] [PASSED] call_args_example
[09:08:36] [PASSED] call_args_test
[09:08:36] [PASSED] drop_first_arg_example
[09:08:36] [PASSED] drop_first_arg_test
[09:08:36] [PASSED] first_arg_example
[09:08:36] [PASSED] first_arg_test
[09:08:36] [PASSED] last_arg_example
[09:08:36] [PASSED] last_arg_test
[09:08:36] [PASSED] pick_arg_example
[09:08:36] [PASSED] if_args_example
[09:08:36] [PASSED] if_args_test
[09:08:36] [PASSED] sep_comma_example
[09:08:36] ====================== [PASSED] args =======================
[09:08:36] =================== xe_pci (3 subtests) ====================
[09:08:36] ==================== check_graphics_ip  ====================
[09:08:36] [PASSED] 12.00 Xe_LP
[09:08:36] [PASSED] 12.10 Xe_LP+
[09:08:36] [PASSED] 12.55 Xe_HPG
[09:08:36] [PASSED] 12.60 Xe_HPC
[09:08:36] [PASSED] 12.70 Xe_LPG
[09:08:36] [PASSED] 12.71 Xe_LPG
[09:08:36] [PASSED] 12.74 Xe_LPG+
[09:08:36] [PASSED] 20.01 Xe2_HPG
[09:08:36] [PASSED] 20.02 Xe2_HPG
[09:08:36] [PASSED] 20.04 Xe2_LPG
[09:08:36] [PASSED] 30.00 Xe3_LPG
[09:08:36] [PASSED] 30.01 Xe3_LPG
[09:08:36] [PASSED] 30.03 Xe3_LPG
[09:08:36] [PASSED] 30.04 Xe3_LPG
[09:08:36] [PASSED] 30.05 Xe3_LPG
[09:08:36] [PASSED] 35.10 Xe3p_LPG
[09:08:36] [PASSED] 35.11 Xe3p_XPC
[09:08:36] ================ [PASSED] check_graphics_ip ================
[09:08:36] ===================== check_media_ip  ======================
[09:08:36] [PASSED] 12.00 Xe_M
[09:08:36] [PASSED] 12.55 Xe_HPM
[09:08:36] [PASSED] 13.00 Xe_LPM+
[09:08:36] [PASSED] 13.01 Xe2_HPM
[09:08:36] [PASSED] 20.00 Xe2_LPM
[09:08:36] [PASSED] 30.00 Xe3_LPM
[09:08:36] [PASSED] 30.02 Xe3_LPM
[09:08:36] [PASSED] 35.00 Xe3p_LPM
[09:08:36] [PASSED] 35.03 Xe3p_HPM
[09:08:36] ================= [PASSED] check_media_ip ==================
[09:08:36] =================== check_platform_desc  ===================
[09:08:36] [PASSED] 0x9A60 (TIGERLAKE)
[09:08:36] [PASSED] 0x9A68 (TIGERLAKE)
[09:08:36] [PASSED] 0x9A70 (TIGERLAKE)
[09:08:36] [PASSED] 0x9A40 (TIGERLAKE)
[09:08:36] [PASSED] 0x9A49 (TIGERLAKE)
[09:08:36] [PASSED] 0x9A59 (TIGERLAKE)
[09:08:36] [PASSED] 0x9A78 (TIGERLAKE)
[09:08:36] [PASSED] 0x9AC0 (TIGERLAKE)
[09:08:36] [PASSED] 0x9AC9 (TIGERLAKE)
[09:08:36] [PASSED] 0x9AD9 (TIGERLAKE)
[09:08:36] [PASSED] 0x9AF8 (TIGERLAKE)
[09:08:36] [PASSED] 0x4C80 (ROCKETLAKE)
[09:08:36] [PASSED] 0x4C8A (ROCKETLAKE)
[09:08:36] [PASSED] 0x4C8B (ROCKETLAKE)
[09:08:36] [PASSED] 0x4C8C (ROCKETLAKE)
[09:08:36] [PASSED] 0x4C90 (ROCKETLAKE)
[09:08:36] [PASSED] 0x4C9A (ROCKETLAKE)
[09:08:36] [PASSED] 0x4680 (ALDERLAKE_S)
[09:08:36] [PASSED] 0x4682 (ALDERLAKE_S)
[09:08:36] [PASSED] 0x4688 (ALDERLAKE_S)
[09:08:36] [PASSED] 0x468A (ALDERLAKE_S)
[09:08:36] [PASSED] 0x468B (ALDERLAKE_S)
[09:08:36] [PASSED] 0x4690 (ALDERLAKE_S)
[09:08:36] [PASSED] 0x4692 (ALDERLAKE_S)
[09:08:36] [PASSED] 0x4693 (ALDERLAKE_S)
[09:08:36] [PASSED] 0x46A0 (ALDERLAKE_P)
[09:08:36] [PASSED] 0x46A1 (ALDERLAKE_P)
[09:08:36] [PASSED] 0x46A2 (ALDERLAKE_P)
[09:08:36] [PASSED] 0x46A3 (ALDERLAKE_P)
[09:08:36] [PASSED] 0x46A6 (ALDERLAKE_P)
[09:08:36] [PASSED] 0x46A8 (ALDERLAKE_P)
[09:08:36] [PASSED] 0x46AA (ALDERLAKE_P)
[09:08:36] [PASSED] 0x462A (ALDERLAKE_P)
[09:08:36] [PASSED] 0x4626 (ALDERLAKE_P)
[09:08:36] [PASSED] 0x4628 (ALDERLAKE_P)
[09:08:36] [PASSED] 0x46B0 (ALDERLAKE_P)
[09:08:36] [PASSED] 0x46B1 (ALDERLAKE_P)
[09:08:36] [PASSED] 0x46B2 (ALDERLAKE_P)
[09:08:36] [PASSED] 0x46B3 (ALDERLAKE_P)
[09:08:36] [PASSED] 0x46C0 (ALDERLAKE_P)
[09:08:36] [PASSED] 0x46C1 (ALDERLAKE_P)
[09:08:36] [PASSED] 0x46C2 (ALDERLAKE_P)
[09:08:36] [PASSED] 0x46C3 (ALDERLAKE_P)
[09:08:36] [PASSED] 0x46D0 (ALDERLAKE_N)
[09:08:36] [PASSED] 0x46D1 (ALDERLAKE_N)
[09:08:36] [PASSED] 0x46D2 (ALDERLAKE_N)
[09:08:36] [PASSED] 0x46D3 (ALDERLAKE_N)
[09:08:36] [PASSED] 0x46D4 (ALDERLAKE_N)
[09:08:36] [PASSED] 0xA721 (ALDERLAKE_P)
[09:08:36] [PASSED] 0xA7A1 (ALDERLAKE_P)
[09:08:36] [PASSED] 0xA7A9 (ALDERLAKE_P)
[09:08:36] [PASSED] 0xA7AC (ALDERLAKE_P)
[09:08:36] [PASSED] 0xA7AD (ALDERLAKE_P)
[09:08:36] [PASSED] 0xA720 (ALDERLAKE_P)
[09:08:36] [PASSED] 0xA7A0 (ALDERLAKE_P)
[09:08:36] [PASSED] 0xA7A8 (ALDERLAKE_P)
[09:08:36] [PASSED] 0xA7AA (ALDERLAKE_P)
[09:08:36] [PASSED] 0xA7AB (ALDERLAKE_P)
[09:08:36] [PASSED] 0xA780 (ALDERLAKE_S)
[09:08:36] [PASSED] 0xA781 (ALDERLAKE_S)
[09:08:36] [PASSED] 0xA782 (ALDERLAKE_S)
[09:08:36] [PASSED] 0xA783 (ALDERLAKE_S)
[09:08:36] [PASSED] 0xA788 (ALDERLAKE_S)
[09:08:36] [PASSED] 0xA789 (ALDERLAKE_S)
[09:08:36] [PASSED] 0xA78A (ALDERLAKE_S)
[09:08:36] [PASSED] 0xA78B (ALDERLAKE_S)
[09:08:36] [PASSED] 0x4905 (DG1)
[09:08:36] [PASSED] 0x4906 (DG1)
[09:08:36] [PASSED] 0x4907 (DG1)
[09:08:36] [PASSED] 0x4908 (DG1)
[09:08:36] [PASSED] 0x4909 (DG1)
[09:08:36] [PASSED] 0x56C0 (DG2)
[09:08:36] [PASSED] 0x56C2 (DG2)
[09:08:36] [PASSED] 0x56C1 (DG2)
[09:08:36] [PASSED] 0x7D51 (METEORLAKE)
[09:08:36] [PASSED] 0x7DD1 (METEORLAKE)
[09:08:36] [PASSED] 0x7D41 (METEORLAKE)
[09:08:36] [PASSED] 0x7D67 (METEORLAKE)
[09:08:36] [PASSED] 0xB640 (METEORLAKE)
[09:08:36] [PASSED] 0x56A0 (DG2)
[09:08:36] [PASSED] 0x56A1 (DG2)
[09:08:36] [PASSED] 0x56A2 (DG2)
[09:08:36] [PASSED] 0x56BE (DG2)
[09:08:36] [PASSED] 0x56BF (DG2)
[09:08:36] [PASSED] 0x5690 (DG2)
[09:08:36] [PASSED] 0x5691 (DG2)
[09:08:36] [PASSED] 0x5692 (DG2)
[09:08:36] [PASSED] 0x56A5 (DG2)
[09:08:36] [PASSED] 0x56A6 (DG2)
[09:08:36] [PASSED] 0x56B0 (DG2)
[09:08:36] [PASSED] 0x56B1 (DG2)
[09:08:36] [PASSED] 0x56BA (DG2)
[09:08:36] [PASSED] 0x56BB (DG2)
[09:08:36] [PASSED] 0x56BC (DG2)
[09:08:36] [PASSED] 0x56BD (DG2)
[09:08:36] [PASSED] 0x5693 (DG2)
[09:08:36] [PASSED] 0x5694 (DG2)
[09:08:36] [PASSED] 0x5695 (DG2)
[09:08:36] [PASSED] 0x56A3 (DG2)
[09:08:36] [PASSED] 0x56A4 (DG2)
[09:08:36] [PASSED] 0x56B2 (DG2)
[09:08:36] [PASSED] 0x56B3 (DG2)
[09:08:36] [PASSED] 0x5696 (DG2)
[09:08:36] [PASSED] 0x5697 (DG2)
[09:08:36] [PASSED] 0xB69 (PVC)
[09:08:36] [PASSED] 0xB6E (PVC)
[09:08:36] [PASSED] 0xBD4 (PVC)
[09:08:36] [PASSED] 0xBD5 (PVC)
[09:08:36] [PASSED] 0xBD6 (PVC)
[09:08:36] [PASSED] 0xBD7 (PVC)
[09:08:36] [PASSED] 0xBD8 (PVC)
[09:08:36] [PASSED] 0xBD9 (PVC)
[09:08:36] [PASSED] 0xBDA (PVC)
[09:08:36] [PASSED] 0xBDB (PVC)
[09:08:36] [PASSED] 0xBE0 (PVC)
[09:08:36] [PASSED] 0xBE1 (PVC)
[09:08:36] [PASSED] 0xBE5 (PVC)
[09:08:36] [PASSED] 0x7D40 (METEORLAKE)
[09:08:36] [PASSED] 0x7D45 (METEORLAKE)
[09:08:36] [PASSED] 0x7D55 (METEORLAKE)
[09:08:36] [PASSED] 0x7D60 (METEORLAKE)
[09:08:36] [PASSED] 0x7DD5 (METEORLAKE)
[09:08:36] [PASSED] 0x6420 (LUNARLAKE)
[09:08:36] [PASSED] 0x64A0 (LUNARLAKE)
[09:08:36] [PASSED] 0x64B0 (LUNARLAKE)
[09:08:36] [PASSED] 0xE202 (BATTLEMAGE)
[09:08:36] [PASSED] 0xE209 (BATTLEMAGE)
[09:08:36] [PASSED] 0xE20B (BATTLEMAGE)
[09:08:36] [PASSED] 0xE20C (BATTLEMAGE)
[09:08:36] [PASSED] 0xE20D (BATTLEMAGE)
[09:08:36] [PASSED] 0xE210 (BATTLEMAGE)
[09:08:36] [PASSED] 0xE211 (BATTLEMAGE)
[09:08:36] [PASSED] 0xE212 (BATTLEMAGE)
[09:08:36] [PASSED] 0xE216 (BATTLEMAGE)
[09:08:36] [PASSED] 0xE220 (BATTLEMAGE)
[09:08:36] [PASSED] 0xE221 (BATTLEMAGE)
[09:08:36] [PASSED] 0xE222 (BATTLEMAGE)
[09:08:36] [PASSED] 0xE223 (BATTLEMAGE)
[09:08:36] [PASSED] 0xB080 (PANTHERLAKE)
[09:08:36] [PASSED] 0xB081 (PANTHERLAKE)
[09:08:36] [PASSED] 0xB082 (PANTHERLAKE)
[09:08:36] [PASSED] 0xB083 (PANTHERLAKE)
[09:08:36] [PASSED] 0xB084 (PANTHERLAKE)
[09:08:36] [PASSED] 0xB085 (PANTHERLAKE)
[09:08:36] [PASSED] 0xB086 (PANTHERLAKE)
[09:08:36] [PASSED] 0xB087 (PANTHERLAKE)
[09:08:36] [PASSED] 0xB08F (PANTHERLAKE)
[09:08:36] [PASSED] 0xB090 (PANTHERLAKE)
[09:08:36] [PASSED] 0xB0A0 (PANTHERLAKE)
[09:08:36] [PASSED] 0xB0B0 (PANTHERLAKE)
[09:08:36] [PASSED] 0xFD80 (PANTHERLAKE)
[09:08:36] [PASSED] 0xFD81 (PANTHERLAKE)
[09:08:36] [PASSED] 0xD740 (NOVALAKE_S)
[09:08:36] [PASSED] 0xD741 (NOVALAKE_S)
[09:08:36] [PASSED] 0xD742 (NOVALAKE_S)
[09:08:36] [PASSED] 0xD743 (NOVALAKE_S)
[09:08:36] [PASSED] 0xD745 (NOVALAKE_S)
[09:08:36] [PASSED] 0xD74A (NOVALAKE_S)
[09:08:36] [PASSED] 0xD74B (NOVALAKE_S)
[09:08:36] [PASSED] 0x674C (CRESCENTISLAND)
[09:08:36] [PASSED] 0x674D (CRESCENTISLAND)
[09:08:36] [PASSED] 0x674E (CRESCENTISLAND)
[09:08:36] [PASSED] 0x674F (CRESCENTISLAND)
[09:08:36] [PASSED] 0x6750 (CRESCENTISLAND)
[09:08:36] [PASSED] 0xD750 (NOVALAKE_P)
[09:08:36] [PASSED] 0xD751 (NOVALAKE_P)
[09:08:36] [PASSED] 0xD752 (NOVALAKE_P)
[09:08:36] [PASSED] 0xD753 (NOVALAKE_P)
[09:08:36] [PASSED] 0xD754 (NOVALAKE_P)
[09:08:36] [PASSED] 0xD755 (NOVALAKE_P)
[09:08:36] [PASSED] 0xD756 (NOVALAKE_P)
[09:08:36] [PASSED] 0xD757 (NOVALAKE_P)
[09:08:36] [PASSED] 0xD75F (NOVALAKE_P)
[09:08:36] =============== [PASSED] check_platform_desc ===============
[09:08:36] ===================== [PASSED] xe_pci ======================
[09:08:36] ============= xe_rtp_tables_test (5 subtests) ==============
[09:08:36] ================== xe_rtp_table_gt_test  ===================
[09:08:36] [PASSED] gt_was/14011060649
[09:08:36] [PASSED] gt_was/14011059788
[09:08:36] [PASSED] gt_was/14015795083
[09:08:36] [PASSED] gt_was/16021867713
[09:08:36] [PASSED] gt_was/14019449301
[09:08:36] [PASSED] gt_was/16028005424
[09:08:36] [PASSED] gt_was/14026578760
[09:08:36] [PASSED] gt_was/1409420604
[09:08:36] [PASSED] gt_was/1408615072
[09:08:36] [PASSED] gt_was/22010523718
[09:08:36] [PASSED] gt_was/14011006942
[09:08:36] [PASSED] gt_was/14014830051
[09:08:36] [PASSED] gt_was/18018781329
[09:08:36] [PASSED] gt_was/1509235366
[09:08:36] [PASSED] gt_was/18018781329
[09:08:36] [PASSED] gt_was/16016694945
[09:08:36] [PASSED] gt_was/14018575942
[09:08:36] [PASSED] gt_was/22016670082
[09:08:36] [PASSED] gt_was/22016670082
[09:08:36] [PASSED] gt_was/14017421178
[09:08:36] [PASSED] gt_was/16025250150
[09:08:36] [PASSED] gt_was/14021871409
[09:08:36] [PASSED] gt_was/16021865536
[09:08:36] [PASSED] gt_was/14021486841
[09:08:36] [PASSED] gt_was/14025160223
[09:08:36] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[09:08:36] [PASSED] gt_was/14025635424
[09:08:36] [PASSED] gt_was/16028005424
[09:08:36] ============== [PASSED] xe_rtp_table_gt_test ===============
[09:08:36] ================== xe_rtp_table_gt_test  ===================
[09:08:36] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[09:08:36] [PASSED] gt_tunings/Tuning: 32B Access Enable
[09:08:36] [PASSED] gt_tunings/Tuning: L3 cache
[09:08:36] [PASSED] gt_tunings/Tuning: L3 cache - media
[09:08:36] [PASSED] gt_tunings/Tuning: Compression Overfetch
[09:08:36] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[09:08:36] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[09:08:36] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[09:08:36] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[09:08:36] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[09:08:36] [PASSED] gt_tunings/Tuning: Stateless compression control
[09:08:36] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[09:08:36] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[09:08:36] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[09:08:36] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[09:08:36] ============== [PASSED] xe_rtp_table_gt_test ===============
[09:08:36] ================== xe_rtp_table_oob_test  ==================
[09:08:36] [PASSED] oob_was/1607983814
[09:08:36] [PASSED] oob_was/16010904313
[09:08:36] [PASSED] oob_was/18022495364
[09:08:36] [PASSED] oob_was/22012773006
[09:08:36] [PASSED] oob_was/14014475959
[09:08:36] [PASSED] oob_was/22011391025
[09:08:36] [PASSED] oob_was/22012727170
[09:08:36] [PASSED] oob_was/22012727685
[09:08:36] [PASSED] oob_was/22016596838
[09:08:36] [PASSED] oob_was/18020744125
[09:08:36] [PASSED] oob_was/1409600907
[09:08:36] [PASSED] oob_was/22014953428
[09:08:36] [PASSED] oob_was/16017236439
[09:08:36] [PASSED] oob_was/14019821291
[09:08:36] [PASSED] oob_was/14015076503
[09:08:36] [PASSED] oob_was/14018913170
[09:08:36] [PASSED] oob_was/14018094691
[09:08:36] [PASSED] oob_was/18024947630
[09:08:36] [PASSED] oob_was/16022287689
[09:08:36] [PASSED] oob_was/13011645652
[09:08:36] [PASSED] oob_was/14022293748
[09:08:36] [PASSED] oob_was/22019794406
[09:08:36] [PASSED] oob_was/22019338487
[09:08:36] [PASSED] oob_was/16023588340
[09:08:36] [PASSED] oob_was/14019789679
[09:08:36] [PASSED] oob_was/14022866841
[09:08:36] [PASSED] oob_was/16021333562
[09:08:36] [PASSED] oob_was/14016712196
[09:08:36] [PASSED] oob_was/14015568240
[09:08:36] [PASSED] oob_was/18013179988
[09:08:36] [PASSED] oob_was/1508761755
[09:08:36] [PASSED] oob_was/16023105232
[09:08:36] [PASSED] oob_was/16026508708
[09:08:36] [PASSED] oob_was/14020001231
[09:08:36] [PASSED] oob_was/16023683509
[09:08:36] [PASSED] oob_was/14025515070
[09:08:36] [PASSED] oob_was/15015404425_disable
[09:08:36] [PASSED] oob_was/16026007364
[09:08:36] [PASSED] oob_was/14020316580
[09:08:36] [PASSED] oob_was/14025883347
[09:08:36] [PASSED] oob_was/16029380221
[09:08:36] [PASSED] oob_was/22022079272
[09:08:36] [PASSED] oob_was/16029897822
[09:08:36] [PASSED] oob_was/14027054324
[09:08:36] ============== [PASSED] xe_rtp_table_oob_test ==============
[09:08:36] ================ xe_rtp_table_dev_oob_test  ================
[09:08:36] [PASSED] device_oob_was/22010954014
[09:08:36] [PASSED] device_oob_was/15015404425
[09:08:36] [PASSED] device_oob_was/22019338487_display
[09:08:36] [PASSED] device_oob_was/14022085890
[09:08:36] [PASSED] device_oob_was/14026539277
[09:08:36] [PASSED] device_oob_was/14026633728
[09:08:36] [PASSED] device_oob_was/14026746987
[09:08:36] [PASSED] device_oob_was/14026779378
[09:08:36] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[09:08:36] ========== xe_rtp_table_missing_upper_bound_test  ==========
[09:08:36] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[09:08:36] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[09:08:36] [PASSED] register_whitelist/1806527549
[09:08:36] [PASSED] register_whitelist/allow_read_ctx_timestamp
[09:08:36] [PASSED] register_whitelist/allow_read_queue_timestamp
[09:08:36] [PASSED] register_whitelist/16014440446
[09:08:36] [PASSED] register_whitelist/16017236439
[09:08:36] [PASSED] register_whitelist/16020183090
[09:08:36] [PASSED] register_whitelist/14024997852
[09:08:36] [PASSED] register_whitelist/14024997852
[09:08:36] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[09:08:36] =============== [PASSED] xe_rtp_tables_test ================
[09:08:36] =================== xe_rtp (3 subtests) ====================
[09:08:36] =================== xe_rtp_rules_tests  ====================
[09:08:36] [PASSED] no
[09:08:36] [PASSED] yes
[09:08:36] [PASSED] no-and-no
[09:08:36] [PASSED] no-and-yes
[09:08:36] [PASSED] yes-and-no
[09:08:36] [PASSED] yes-and-yes
[09:08:36] [PASSED] no-or-no
[09:08:36] [PASSED] no-or-yes
[09:08:36] [PASSED] yes-or-no
[09:08:36] [PASSED] yes-or-yes
[09:08:36] [PASSED] no-yes-or-yes-no
[09:08:36] [PASSED] no-yes-or-yes-yes
[09:08:36] [PASSED] yes-yes-or-no-yes
[09:08:36] [PASSED] yes-yes-or-yes-yes
[09:08:36] [PASSED] no-no-or-yes-or-no
[09:08:36] [PASSED] or
[09:08:36] [PASSED] or-yes
[09:08:36] [PASSED] or-no
[09:08:36] [PASSED] yes-or
[09:08:36] [PASSED] no-or
[09:08:36] [PASSED] no-or-or-yes
[09:08:36] [PASSED] yes-or-or-no
[09:08:36] [PASSED] no-or-or-no
[09:08:36] [PASSED] missing-context-engine-class
[09:08:36] [PASSED] missing-context-engine-class-or-yes
[09:08:36] [PASSED] missing-context-engine-class-or-or-yes
[09:08:36] =============== [PASSED] xe_rtp_rules_tests ================
[09:08:36] =============== xe_rtp_process_to_sr_tests  ================
[09:08:36] [PASSED] coalesce-same-reg
[09:08:36] [PASSED] coalesce-same-reg-literal-and-func
[09:08:36] [PASSED] no-match-no-add
[09:08:36] [PASSED] two-regs-two-entries
[09:08:36] [PASSED] clr-one-set-other
[09:08:36] [PASSED] set-field
[09:08:36] [PASSED] conflict-duplicate
[09:08:36] [PASSED] conflict-not-disjoint
[09:08:36] [PASSED] conflict-not-disjoint-literal-and-func
[09:08:36] [PASSED] conflict-reg-type
[09:08:36] [PASSED] bad-mcr-reg-forced-to-regular
[09:08:36] [PASSED] bad-regular-reg-forced-to-mcr
[09:08:36] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[09:08:36] ================== xe_rtp_process_tests  ===================
[09:08:36] [PASSED] active1
[09:08:36] [PASSED] active2
[09:08:36] [PASSED] active-inactive
[09:08:36] [PASSED] inactive-active
[09:08:36] [PASSED] inactive-active-inactive
[09:08:36] [PASSED] inactive-inactive-inactive
[09:08:36] ============== [PASSED] xe_rtp_process_tests ===============
[09:08:36] ===================== [PASSED] xe_rtp ======================
[09:08:36] ==================== xe_wa (1 subtest) =====================
[09:08:36] ======================== xe_wa_gt  =========================
[09:08:36] [PASSED] TIGERLAKE B0
[09:08:36] [PASSED] DG1 A0
[09:08:36] [PASSED] DG1 B0
[09:08:36] [PASSED] ALDERLAKE_S A0
[09:08:36] [PASSED] ALDERLAKE_S B0
[09:08:36] [PASSED] ALDERLAKE_S C0
[09:08:36] [PASSED] ALDERLAKE_S D0
[09:08:36] [PASSED] ALDERLAKE_P A0
[09:08:36] [PASSED] ALDERLAKE_P B0
[09:08:36] [PASSED] ALDERLAKE_P C0
[09:08:36] [PASSED] ALDERLAKE_S RPLS D0
[09:08:36] [PASSED] ALDERLAKE_P RPLU E0
[09:08:36] [PASSED] DG2 G10 C0
[09:08:36] [PASSED] DG2 G11 B1
[09:08:36] [PASSED] DG2 G12 A1
[09:08:36] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[09:08:36] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[09:08:36] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[09:08:36] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[09:08:36] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[09:08:36] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[09:08:36] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[09:08:36] ==================== [PASSED] xe_wa_gt =====================
[09:08:36] ====================== [PASSED] xe_wa ======================
[09:08:36] ============================================================
[09:08:36] Testing complete. Ran 793 tests: passed: 765, skipped: 28
[09:08:36] Elapsed time: 36.223s total, 1.810s configuring, 33.697s building, 0.683s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[09:08:36] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:08:38] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[09:09:03] Starting KUnit Kernel (1/1)...
[09:09:03] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[09:09:03] ============= refcount_interrupt (4 subtests) ==============
[09:09:03] [PASSED] test_single_irq_change
[09:09:03] [PASSED] test_nested_irq_change
[09:09:03] [PASSED] test_multiple_irq_change
[09:09:03] [PASSED] test_irq_save
[09:09:03] =============== [PASSED] refcount_interrupt ================
[09:09:03] ============ drm_test_pick_cmdline (2 subtests) ============
[09:09:03] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[09:09:03] =============== drm_test_pick_cmdline_named  ===============
[09:09:03] [PASSED] NTSC
[09:09:03] [PASSED] NTSC-J
[09:09:03] [PASSED] PAL
[09:09:03] [PASSED] PAL-M
[09:09:03] =========== [PASSED] drm_test_pick_cmdline_named ===========
[09:09:03] ============== [PASSED] drm_test_pick_cmdline ==============
[09:09:03] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[09:09:03] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[09:09:03] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[09:09:03] =========== drm_validate_clone_mode (2 subtests) ===========
[09:09:03] ============== drm_test_check_in_clone_mode  ===============
[09:09:03] [PASSED] in_clone_mode
[09:09:03] [PASSED] not_in_clone_mode
[09:09:03] ========== [PASSED] drm_test_check_in_clone_mode ===========
[09:09:03] =============== drm_test_check_valid_clones  ===============
[09:09:03] [PASSED] not_in_clone_mode
[09:09:03] [PASSED] valid_clone
[09:09:03] [PASSED] invalid_clone
[09:09:03] =========== [PASSED] drm_test_check_valid_clones ===========
[09:09:03] ============= [PASSED] drm_validate_clone_mode =============
[09:09:03] ============= drm_validate_modeset (1 subtest) =============
[09:09:03] [PASSED] drm_test_check_connector_changed_modeset
[09:09:03] ============== [PASSED] drm_validate_modeset ===============
[09:09:03] ====== drm_test_bridge_get_current_state (1 subtest) =======
[09:09:03] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[09:09:03] ======== [PASSED] drm_test_bridge_get_current_state ========
[09:09:03] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[09:09:03] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[09:09:03] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[09:09:03] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[09:09:03] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[09:09:03] ============== drm_bridge_alloc (2 subtests) ===============
[09:09:03] [PASSED] drm_test_drm_bridge_alloc_basic
[09:09:03] [PASSED] drm_test_drm_bridge_alloc_get_put
[09:09:03] ================ [PASSED] drm_bridge_alloc =================
[09:09:03] ============= drm_bridge_bus_fmt (5 subtests) ==============
[09:09:03] [PASSED] drm_test_bridge_rgb_yuv_rgb
[09:09:03] [PASSED] drm_test_bridge_must_convert_to_yuv444
[09:09:03] [PASSED] drm_test_bridge_hdmi_auto_rgb
[09:09:03] [PASSED] drm_test_bridge_auto_first
[09:09:03] [PASSED] drm_test_bridge_rgb_yuv_no_path
[09:09:03] =============== [PASSED] drm_bridge_bus_fmt ================
[09:09:03] ============= drm_cmdline_parser (40 subtests) =============
[09:09:03] [PASSED] drm_test_cmdline_force_d_only
[09:09:03] [PASSED] drm_test_cmdline_force_D_only_dvi
[09:09:03] [PASSED] drm_test_cmdline_force_D_only_hdmi
[09:09:03] [PASSED] drm_test_cmdline_force_D_only_not_digital
[09:09:03] [PASSED] drm_test_cmdline_force_e_only
[09:09:03] [PASSED] drm_test_cmdline_res
[09:09:03] [PASSED] drm_test_cmdline_res_vesa
[09:09:03] [PASSED] drm_test_cmdline_res_vesa_rblank
[09:09:03] [PASSED] drm_test_cmdline_res_rblank
[09:09:03] [PASSED] drm_test_cmdline_res_bpp
[09:09:03] [PASSED] drm_test_cmdline_res_refresh
[09:09:03] [PASSED] drm_test_cmdline_res_bpp_refresh
[09:09:03] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[09:09:03] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[09:09:03] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[09:09:03] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[09:09:03] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[09:09:03] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[09:09:03] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[09:09:03] [PASSED] drm_test_cmdline_res_margins_force_on
[09:09:03] [PASSED] drm_test_cmdline_res_vesa_margins
[09:09:03] [PASSED] drm_test_cmdline_name
[09:09:03] [PASSED] drm_test_cmdline_name_bpp
[09:09:03] [PASSED] drm_test_cmdline_name_option
[09:09:03] [PASSED] drm_test_cmdline_name_bpp_option
[09:09:03] [PASSED] drm_test_cmdline_rotate_0
[09:09:03] [PASSED] drm_test_cmdline_rotate_90
[09:09:03] [PASSED] drm_test_cmdline_rotate_180
[09:09:03] [PASSED] drm_test_cmdline_rotate_270
[09:09:03] [PASSED] drm_test_cmdline_hmirror
[09:09:03] [PASSED] drm_test_cmdline_vmirror
[09:09:03] [PASSED] drm_test_cmdline_margin_options
[09:09:03] [PASSED] drm_test_cmdline_multiple_options
[09:09:03] [PASSED] drm_test_cmdline_bpp_extra_and_option
[09:09:03] [PASSED] drm_test_cmdline_extra_and_option
[09:09:03] [PASSED] drm_test_cmdline_freestanding_options
[09:09:03] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[09:09:03] [PASSED] drm_test_cmdline_panel_orientation
[09:09:03] ================ drm_test_cmdline_invalid  =================
[09:09:03] [PASSED] margin_only
[09:09:03] [PASSED] interlace_only
[09:09:03] [PASSED] res_missing_x
[09:09:03] [PASSED] res_missing_y
[09:09:03] [PASSED] res_bad_y
[09:09:03] [PASSED] res_missing_y_bpp
[09:09:03] [PASSED] res_bad_bpp
[09:09:03] [PASSED] res_bad_refresh
[09:09:03] [PASSED] res_bpp_refresh_force_on_off
[09:09:03] [PASSED] res_invalid_mode
[09:09:03] [PASSED] res_bpp_wrong_place_mode
[09:09:03] [PASSED] name_bpp_refresh
[09:09:03] [PASSED] name_refresh
[09:09:03] [PASSED] name_refresh_wrong_mode
[09:09:03] [PASSED] name_refresh_invalid_mode
[09:09:03] [PASSED] rotate_multiple
[09:09:03] [PASSED] rotate_invalid_val
[09:09:03] [PASSED] rotate_truncated
[09:09:03] [PASSED] invalid_option
[09:09:03] [PASSED] invalid_tv_option
[09:09:03] [PASSED] truncated_tv_option
[09:09:03] ============ [PASSED] drm_test_cmdline_invalid =============
[09:09:03] =============== drm_test_cmdline_tv_options  ===============
[09:09:03] [PASSED] NTSC
[09:09:03] [PASSED] NTSC_443
[09:09:03] [PASSED] NTSC_J
[09:09:03] [PASSED] PAL
[09:09:03] [PASSED] PAL_M
[09:09:03] [PASSED] PAL_N
[09:09:03] [PASSED] SECAM
[09:09:03] [PASSED] MONO_525
[09:09:03] [PASSED] MONO_625
[09:09:03] =========== [PASSED] drm_test_cmdline_tv_options ===========
[09:09:03] =============== [PASSED] drm_cmdline_parser ================
[09:09:03] ========== drmm_connector_hdmi_init (20 subtests) ==========
[09:09:03] [PASSED] drm_test_connector_hdmi_init_valid
[09:09:03] [PASSED] drm_test_connector_hdmi_init_bpc_8
[09:09:03] [PASSED] drm_test_connector_hdmi_init_bpc_10
[09:09:03] [PASSED] drm_test_connector_hdmi_init_bpc_12
[09:09:03] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[09:09:03] [PASSED] drm_test_connector_hdmi_init_bpc_null
[09:09:03] [PASSED] drm_test_connector_hdmi_init_formats_empty
[09:09:03] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[09:09:03] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[09:09:03] [PASSED] supported_formats=0x9 yuv420_allowed=1
[09:09:03] [PASSED] supported_formats=0x9 yuv420_allowed=0
[09:09:03] [PASSED] supported_formats=0x5 yuv420_allowed=1
[09:09:03] [PASSED] supported_formats=0x5 yuv420_allowed=0
[09:09:03] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[09:09:03] [PASSED] drm_test_connector_hdmi_init_null_ddc
[09:09:03] [PASSED] drm_test_connector_hdmi_init_null_product
[09:09:03] [PASSED] drm_test_connector_hdmi_init_null_vendor
[09:09:03] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[09:09:03] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[09:09:03] [PASSED] drm_test_connector_hdmi_init_product_valid
[09:09:03] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[09:09:03] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[09:09:03] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[09:09:03] ========= drm_test_connector_hdmi_init_type_valid  =========
[09:09:03] [PASSED] HDMI-A
[09:09:03] [PASSED] HDMI-B
[09:09:03] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[09:09:03] ======== drm_test_connector_hdmi_init_type_invalid  ========
[09:09:03] [PASSED] Unknown
[09:09:03] [PASSED] VGA
[09:09:03] [PASSED] DVI-I
[09:09:03] [PASSED] DVI-D
[09:09:03] [PASSED] DVI-A
[09:09:03] [PASSED] Composite
[09:09:03] [PASSED] SVIDEO
[09:09:03] [PASSED] LVDS
[09:09:03] [PASSED] Component
[09:09:03] [PASSED] DIN
[09:09:03] [PASSED] DP
[09:09:03] [PASSED] TV
[09:09:03] [PASSED] eDP
[09:09:03] [PASSED] Virtual
[09:09:03] [PASSED] DSI
[09:09:03] [PASSED] DPI
[09:09:03] [PASSED] Writeback
[09:09:03] [PASSED] SPI
[09:09:03] [PASSED] USB
[09:09:03] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[09:09:03] ============ [PASSED] drmm_connector_hdmi_init =============
[09:09:03] ============= drmm_connector_init (3 subtests) =============
[09:09:03] [PASSED] drm_test_drmm_connector_init
[09:09:03] [PASSED] drm_test_drmm_connector_init_null_ddc
[09:09:03] ========= drm_test_drmm_connector_init_type_valid  =========
[09:09:03] [PASSED] Unknown
[09:09:03] [PASSED] VGA
[09:09:03] [PASSED] DVI-I
[09:09:03] [PASSED] DVI-D
[09:09:03] [PASSED] DVI-A
[09:09:03] [PASSED] Composite
[09:09:03] [PASSED] SVIDEO
[09:09:03] [PASSED] LVDS
[09:09:03] [PASSED] Component
[09:09:03] [PASSED] DIN
[09:09:03] [PASSED] DP
[09:09:03] [PASSED] HDMI-A
[09:09:03] [PASSED] HDMI-B
[09:09:03] [PASSED] TV
[09:09:03] [PASSED] eDP
[09:09:03] [PASSED] Virtual
[09:09:03] [PASSED] DSI
[09:09:03] [PASSED] DPI
[09:09:03] [PASSED] Writeback
[09:09:03] [PASSED] SPI
[09:09:03] [PASSED] USB
[09:09:03] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[09:09:03] =============== [PASSED] drmm_connector_init ===============
[09:09:03] ========= drm_connector_dynamic_init (6 subtests) ==========
[09:09:03] [PASSED] drm_test_drm_connector_dynamic_init
[09:09:03] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[09:09:03] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[09:09:03] [PASSED] drm_test_drm_connector_dynamic_init_properties
[09:09:03] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[09:09:03] [PASSED] Unknown
[09:09:03] [PASSED] VGA
[09:09:03] [PASSED] DVI-I
[09:09:03] [PASSED] DVI-D
[09:09:03] [PASSED] DVI-A
[09:09:03] [PASSED] Composite
[09:09:03] [PASSED] SVIDEO
[09:09:03] [PASSED] LVDS
[09:09:03] [PASSED] Component
[09:09:03] [PASSED] DIN
[09:09:03] [PASSED] DP
[09:09:03] [PASSED] HDMI-A
[09:09:03] [PASSED] HDMI-B
[09:09:03] [PASSED] TV
[09:09:03] [PASSED] eDP
[09:09:03] [PASSED] Virtual
[09:09:03] [PASSED] DSI
[09:09:03] [PASSED] DPI
[09:09:03] [PASSED] Writeback
[09:09:03] [PASSED] SPI
[09:09:03] [PASSED] USB
[09:09:03] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[09:09:03] ======== drm_test_drm_connector_dynamic_init_name  =========
[09:09:03] [PASSED] Unknown
[09:09:03] [PASSED] VGA
[09:09:03] [PASSED] DVI-I
[09:09:03] [PASSED] DVI-D
[09:09:03] [PASSED] DVI-A
[09:09:03] [PASSED] Composite
[09:09:03] [PASSED] SVIDEO
[09:09:03] [PASSED] LVDS
[09:09:03] [PASSED] Component
[09:09:03] [PASSED] DIN
[09:09:03] [PASSED] DP
[09:09:03] [PASSED] HDMI-A
[09:09:03] [PASSED] HDMI-B
[09:09:03] [PASSED] TV
[09:09:03] [PASSED] eDP
[09:09:03] [PASSED] Virtual
[09:09:03] [PASSED] DSI
[09:09:03] [PASSED] DPI
[09:09:03] [PASSED] Writeback
[09:09:03] [PASSED] SPI
[09:09:03] [PASSED] USB
[09:09:03] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[09:09:03] =========== [PASSED] drm_connector_dynamic_init ============
[09:09:03] ==== drm_connector_dynamic_register_early (4 subtests) =====
[09:09:03] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[09:09:03] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[09:09:03] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[09:09:03] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[09:09:03] ====== [PASSED] drm_connector_dynamic_register_early =======
[09:09:03] ======= drm_connector_dynamic_register (7 subtests) ========
[09:09:03] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[09:09:03] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[09:09:03] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[09:09:03] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[09:09:03] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[09:09:03] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[09:09:03] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[09:09:03] ========= [PASSED] drm_connector_dynamic_register ==========
[09:09:03] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[09:09:03] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[09:09:03] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[09:09:03] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[09:09:03] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[09:09:03] ========== drm_test_get_tv_mode_from_name_valid  ===========
[09:09:03] [PASSED] NTSC
[09:09:03] [PASSED] NTSC-443
[09:09:03] [PASSED] NTSC-J
[09:09:03] [PASSED] PAL
[09:09:03] [PASSED] PAL-M
[09:09:03] [PASSED] PAL-N
[09:09:03] [PASSED] SECAM
[09:09:03] [PASSED] Mono
[09:09:03] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[09:09:03] [PASSED] drm_test_get_tv_mode_from_name_truncated
[09:09:03] ============ [PASSED] drm_get_tv_mode_from_name ============
[09:09:03] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[09:09:03] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[09:09:03] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[09:09:03] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[09:09:03] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[09:09:03] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[09:09:03] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[09:09:03] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[09:09:03] [PASSED] VIC 96
[09:09:03] [PASSED] VIC 97
[09:09:03] [PASSED] VIC 101
[09:09:03] [PASSED] VIC 102
[09:09:03] [PASSED] VIC 106
[09:09:03] [PASSED] VIC 107
[09:09:03] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[09:09:03] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[09:09:03] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[09:09:03] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[09:09:03] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[09:09:03] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[09:09:03] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[09:09:03] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[09:09:03] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[09:09:03] [PASSED] Automatic
[09:09:03] [PASSED] Full
[09:09:03] [PASSED] Limited 16:235
[09:09:03] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[09:09:03] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[09:09:03] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[09:09:03] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[09:09:03] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[09:09:03] [PASSED] RGB
[09:09:03] [PASSED] YUV 4:2:0
[09:09:03] [PASSED] YUV 4:2:2
[09:09:03] [PASSED] YUV 4:4:4
[09:09:03] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[09:09:03] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[09:09:03] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[09:09:03] ============= drm_damage_helper (21 subtests) ==============
[09:09:03] [PASSED] drm_test_damage_iter_no_damage
[09:09:03] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[09:09:03] [PASSED] drm_test_damage_iter_no_damage_src_moved
[09:09:03] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[09:09:03] [PASSED] drm_test_damage_iter_no_damage_not_visible
[09:09:03] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[09:09:03] [PASSED] drm_test_damage_iter_no_damage_no_fb
[09:09:03] [PASSED] drm_test_damage_iter_simple_damage
[09:09:03] [PASSED] drm_test_damage_iter_single_damage
[09:09:03] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[09:09:03] [PASSED] drm_test_damage_iter_single_damage_outside_src
[09:09:03] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[09:09:03] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[09:09:03] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[09:09:03] [PASSED] drm_test_damage_iter_single_damage_src_moved
[09:09:03] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[09:09:03] [PASSED] drm_test_damage_iter_damage
[09:09:03] [PASSED] drm_test_damage_iter_damage_one_intersect
[09:09:03] [PASSED] drm_test_damage_iter_damage_one_outside
[09:09:03] [PASSED] drm_test_damage_iter_damage_src_moved
[09:09:03] [PASSED] drm_test_damage_iter_damage_not_visible
[09:09:03] ================ [PASSED] drm_damage_helper ================
[09:09:03] ============== drm_dp_mst_helper (3 subtests) ==============
[09:09:03] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[09:09:03] [PASSED] Clock 154000 BPP 30 DSC disabled
[09:09:03] [PASSED] Clock 234000 BPP 30 DSC disabled
[09:09:03] [PASSED] Clock 297000 BPP 24 DSC disabled
[09:09:03] [PASSED] Clock 332880 BPP 24 DSC enabled
[09:09:03] [PASSED] Clock 324540 BPP 24 DSC enabled
[09:09:03] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[09:09:03] ============== drm_test_dp_mst_calc_pbn_div  ===============
[09:09:03] [PASSED] Link rate 2000000 lane count 4
[09:09:03] [PASSED] Link rate 2000000 lane count 2
[09:09:03] [PASSED] Link rate 2000000 lane count 1
[09:09:03] [PASSED] Link rate 1350000 lane count 4
[09:09:03] [PASSED] Link rate 1350000 lane count 2
[09:09:03] [PASSED] Link rate 1350000 lane count 1
[09:09:03] [PASSED] Link rate 1000000 lane count 4
[09:09:03] [PASSED] Link rate 1000000 lane count 2
[09:09:03] [PASSED] Link rate 1000000 lane count 1
[09:09:03] [PASSED] Link rate 810000 lane count 4
[09:09:03] [PASSED] Link rate 810000 lane count 2
[09:09:03] [PASSED] Link rate 810000 lane count 1
[09:09:03] [PASSED] Link rate 540000 lane count 4
[09:09:03] [PASSED] Link rate 540000 lane count 2
[09:09:03] [PASSED] Link rate 540000 lane count 1
[09:09:03] [PASSED] Link rate 270000 lane count 4
[09:09:03] [PASSED] Link rate 270000 lane count 2
[09:09:03] [PASSED] Link rate 270000 lane count 1
[09:09:03] [PASSED] Link rate 162000 lane count 4
[09:09:03] [PASSED] Link rate 162000 lane count 2
[09:09:03] [PASSED] Link rate 162000 lane count 1
[09:09:03] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[09:09:03] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[09:09:03] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[09:09:03] [PASSED] DP_POWER_UP_PHY with port number
[09:09:03] [PASSED] DP_POWER_DOWN_PHY with port number
[09:09:03] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[09:09:03] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[09:09:03] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[09:09:03] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[09:09:03] [PASSED] DP_QUERY_PAYLOAD with port number
[09:09:03] [PASSED] DP_QUERY_PAYLOAD with VCPI
[09:09:03] [PASSED] DP_REMOTE_DPCD_READ with port number
[09:09:03] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[09:09:03] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[09:09:03] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[09:09:03] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[09:09:03] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[09:09:03] [PASSED] DP_REMOTE_I2C_READ with port number
[09:09:03] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[09:09:03] [PASSED] DP_REMOTE_I2C_READ with transactions array
[09:09:03] [PASSED] DP_REMOTE_I2C_WRITE with port number
[09:09:03] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[09:09:03] [PASSED] DP_REMOTE_I2C_WRITE with data array
[09:09:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[09:09:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[09:09:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[09:09:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[09:09:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[09:09:03] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[09:09:03] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[09:09:03] ================ [PASSED] drm_dp_mst_helper ================
[09:09:03] ================== drm_exec (7 subtests) ===================
[09:09:03] [PASSED] sanitycheck
[09:09:03] [PASSED] test_lock
[09:09:03] [PASSED] test_lock_unlock
[09:09:03] [PASSED] test_duplicates
[09:09:03] [PASSED] test_prepare
[09:09:03] [PASSED] test_prepare_array
[09:09:03] [PASSED] test_multiple_loops
[09:09:03] ==================== [PASSED] drm_exec =====================
[09:09:03] =========== drm_format_helper_test (17 subtests) ===========
[09:09:03] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[09:09:03] [PASSED] single_pixel_source_buffer
[09:09:03] [PASSED] single_pixel_clip_rectangle
[09:09:03] [PASSED] well_known_colors
[09:09:03] [PASSED] destination_pitch
[09:09:03] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[09:09:03] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[09:09:03] [PASSED] single_pixel_source_buffer
[09:09:03] [PASSED] single_pixel_clip_rectangle
[09:09:03] [PASSED] well_known_colors
[09:09:03] [PASSED] destination_pitch
[09:09:03] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[09:09:03] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[09:09:03] [PASSED] single_pixel_source_buffer
[09:09:03] [PASSED] single_pixel_clip_rectangle
[09:09:03] [PASSED] well_known_colors
[09:09:03] [PASSED] destination_pitch
[09:09:03] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[09:09:03] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[09:09:03] [PASSED] single_pixel_source_buffer
[09:09:03] [PASSED] single_pixel_clip_rectangle
[09:09:03] [PASSED] well_known_colors
[09:09:03] [PASSED] destination_pitch
[09:09:03] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[09:09:03] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[09:09:03] [PASSED] single_pixel_source_buffer
[09:09:03] [PASSED] single_pixel_clip_rectangle
[09:09:03] [PASSED] well_known_colors
[09:09:03] [PASSED] destination_pitch
[09:09:03] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[09:09:03] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[09:09:03] [PASSED] single_pixel_source_buffer
[09:09:03] [PASSED] single_pixel_clip_rectangle
[09:09:03] [PASSED] well_known_colors
[09:09:03] [PASSED] destination_pitch
[09:09:03] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[09:09:03] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[09:09:03] [PASSED] single_pixel_source_buffer
[09:09:03] [PASSED] single_pixel_clip_rectangle
[09:09:03] [PASSED] well_known_colors
[09:09:03] [PASSED] destination_pitch
[09:09:03] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[09:09:03] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[09:09:03] [PASSED] single_pixel_source_buffer
[09:09:03] [PASSED] single_pixel_clip_rectangle
[09:09:03] [PASSED] well_known_colors
[09:09:03] [PASSED] destination_pitch
[09:09:03] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[09:09:03] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[09:09:03] [PASSED] single_pixel_source_buffer
[09:09:03] [PASSED] single_pixel_clip_rectangle
[09:09:03] [PASSED] well_known_colors
[09:09:03] [PASSED] destination_pitch
[09:09:03] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[09:09:03] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[09:09:03] [PASSED] single_pixel_source_buffer
[09:09:03] [PASSED] single_pixel_clip_rectangle
[09:09:03] [PASSED] well_known_colors
[09:09:03] [PASSED] destination_pitch
[09:09:03] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[09:09:03] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[09:09:03] [PASSED] single_pixel_source_buffer
[09:09:03] [PASSED] single_pixel_clip_rectangle
[09:09:03] [PASSED] well_known_colors
[09:09:03] [PASSED] destination_pitch
[09:09:03] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[09:09:03] ============== drm_test_fb_xrgb8888_to_mono  ===============
[09:09:03] [PASSED] single_pixel_source_buffer
[09:09:03] [PASSED] single_pixel_clip_rectangle
[09:09:03] [PASSED] well_known_colors
[09:09:03] [PASSED] destination_pitch
[09:09:03] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[09:09:03] ==================== drm_test_fb_swab  =====================
[09:09:03] [PASSED] single_pixel_source_buffer
[09:09:03] [PASSED] single_pixel_clip_rectangle
[09:09:03] [PASSED] well_known_colors
[09:09:03] [PASSED] destination_pitch
[09:09:03] ================ [PASSED] drm_test_fb_swab =================
[09:09:03] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[09:09:03] [PASSED] single_pixel_source_buffer
[09:09:03] [PASSED] single_pixel_clip_rectangle
[09:09:03] [PASSED] well_known_colors
[09:09:03] [PASSED] destination_pitch
[09:09:03] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[09:09:03] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[09:09:03] [PASSED] single_pixel_source_buffer
[09:09:03] [PASSED] single_pixel_clip_rectangle
[09:09:03] [PASSED] well_known_colors
[09:09:03] [PASSED] destination_pitch
[09:09:03] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[09:09:03] ================= drm_test_fb_clip_offset  =================
[09:09:03] [PASSED] pass through
[09:09:03] [PASSED] horizontal offset
[09:09:03] [PASSED] vertical offset
[09:09:03] [PASSED] horizontal and vertical offset
[09:09:03] [PASSED] horizontal offset (custom pitch)
[09:09:03] [PASSED] vertical offset (custom pitch)
[09:09:03] [PASSED] horizontal and vertical offset (custom pitch)
[09:09:03] ============= [PASSED] drm_test_fb_clip_offset =============
[09:09:03] =================== drm_test_fb_memcpy  ====================
[09:09:03] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[09:09:03] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[09:09:03] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[09:09:03] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[09:09:03] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[09:09:03] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[09:09:03] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[09:09:03] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[09:09:03] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[09:09:03] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[09:09:03] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[09:09:03] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[09:09:03] =============== [PASSED] drm_test_fb_memcpy ================
[09:09:03] ============= [PASSED] drm_format_helper_test ==============
[09:09:03] ================= drm_format (18 subtests) =================
[09:09:03] [PASSED] drm_test_format_block_width_invalid
[09:09:03] [PASSED] drm_test_format_block_width_one_plane
[09:09:03] [PASSED] drm_test_format_block_width_two_plane
[09:09:03] [PASSED] drm_test_format_block_width_three_plane
[09:09:03] [PASSED] drm_test_format_block_width_tiled
[09:09:03] [PASSED] drm_test_format_block_height_invalid
[09:09:03] [PASSED] drm_test_format_block_height_one_plane
[09:09:03] [PASSED] drm_test_format_block_height_two_plane
[09:09:03] [PASSED] drm_test_format_block_height_three_plane
[09:09:03] [PASSED] drm_test_format_block_height_tiled
[09:09:03] [PASSED] drm_test_format_min_pitch_invalid
[09:09:03] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[09:09:03] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[09:09:03] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[09:09:03] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[09:09:03] [PASSED] drm_test_format_min_pitch_two_plane
[09:09:03] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[09:09:03] [PASSED] drm_test_format_min_pitch_tiled
[09:09:03] =================== [PASSED] drm_format ====================
[09:09:03] ============== drm_framebuffer (10 subtests) ===============
[09:09:03] ========== drm_test_framebuffer_check_src_coords  ==========
[09:09:03] [PASSED] Success: source fits into fb
[09:09:03] [PASSED] Fail: overflowing fb with x-axis coordinate
[09:09:03] [PASSED] Fail: overflowing fb with y-axis coordinate
[09:09:03] [PASSED] Fail: overflowing fb with source width
[09:09:03] [PASSED] Fail: overflowing fb with source height
[09:09:03] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[09:09:03] [PASSED] drm_test_framebuffer_cleanup
[09:09:03] =============== drm_test_framebuffer_create  ===============
[09:09:03] [PASSED] ABGR8888 normal sizes
[09:09:03] [PASSED] ABGR8888 max sizes
[09:09:03] [PASSED] ABGR8888 pitch greater than min required
[09:09:03] [PASSED] ABGR8888 pitch less than min required
[09:09:03] [PASSED] ABGR8888 Invalid width
[09:09:03] [PASSED] ABGR8888 Invalid buffer handle
[09:09:03] [PASSED] No pixel format
[09:09:03] [PASSED] ABGR8888 Width 0
[09:09:03] [PASSED] ABGR8888 Height 0
[09:09:03] [PASSED] ABGR8888 Out of bound height * pitch combination
[09:09:03] [PASSED] ABGR8888 Large buffer offset
[09:09:03] [PASSED] ABGR8888 Buffer offset for inexistent plane
[09:09:03] [PASSED] ABGR8888 Invalid flag
[09:09:03] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[09:09:03] [PASSED] ABGR8888 Valid buffer modifier
[09:09:03] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[09:09:03] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[09:09:03] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[09:09:03] [PASSED] NV12 Normal sizes
[09:09:03] [PASSED] NV12 Max sizes
[09:09:03] [PASSED] NV12 Invalid pitch
[09:09:03] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[09:09:03] [PASSED] NV12 different  modifier per-plane
[09:09:03] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[09:09:03] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[09:09:03] [PASSED] NV12 Modifier for inexistent plane
[09:09:03] [PASSED] NV12 Handle for inexistent plane
[09:09:03] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[09:09:03] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[09:09:03] [PASSED] YVU420 Normal sizes
[09:09:03] [PASSED] YVU420 Max sizes
[09:09:03] [PASSED] YVU420 Invalid pitch
[09:09:03] [PASSED] YVU420 Different pitches
[09:09:03] [PASSED] YVU420 Different buffer offsets/pitches
[09:09:03] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[09:09:03] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[09:09:03] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[09:09:03] [PASSED] YVU420 Valid modifier
[09:09:03] [PASSED] YVU420 Different modifiers per plane
[09:09:03] [PASSED] YVU420 Modifier for inexistent plane
[09:09:03] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[09:09:03] [PASSED] X0L2 Normal sizes
[09:09:03] [PASSED] X0L2 Max sizes
[09:09:03] [PASSED] X0L2 Invalid pitch
[09:09:03] [PASSED] X0L2 Pitch greater than minimum required
[09:09:03] [PASSED] X0L2 Handle for inexistent plane
[09:09:03] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[09:09:03] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[09:09:03] [PASSED] X0L2 Valid modifier
[09:09:03] [PASSED] X0L2 Modifier for inexistent plane
[09:09:03] =========== [PASSED] drm_test_framebuffer_create ===========
[09:09:03] [PASSED] drm_test_framebuffer_free
[09:09:03] [PASSED] drm_test_framebuffer_init
[09:09:03] [PASSED] drm_test_framebuffer_init_bad_format
[09:09:03] [PASSED] drm_test_framebuffer_init_dev_mismatch
[09:09:03] [PASSED] drm_test_framebuffer_lookup
[09:09:03] [PASSED] drm_test_framebuffer_lookup_inexistent
[09:09:03] [PASSED] drm_test_framebuffer_modifiers_not_supported
[09:09:03] ================= [PASSED] drm_framebuffer =================
[09:09:03] ================ drm_gem_shmem (8 subtests) ================
[09:09:03] [PASSED] drm_gem_shmem_test_obj_create
[09:09:03] [PASSED] drm_gem_shmem_test_obj_create_private
[09:09:03] [PASSED] drm_gem_shmem_test_pin_pages
[09:09:03] [PASSED] drm_gem_shmem_test_vmap
[09:09:03] [PASSED] drm_gem_shmem_test_get_sg_table
[09:09:03] [PASSED] drm_gem_shmem_test_get_pages_sgt
[09:09:03] [PASSED] drm_gem_shmem_test_madvise
[09:09:03] [PASSED] drm_gem_shmem_test_purge
[09:09:03] ================== [PASSED] drm_gem_shmem ==================
[09:09:03] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[09:09:03] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[09:09:03] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[09:09:03] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[09:09:03] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[09:09:03] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[09:09:03] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[09:09:03] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[09:09:03] [PASSED] Automatic
[09:09:03] [PASSED] Full
[09:09:03] [PASSED] Limited 16:235
[09:09:03] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[09:09:03] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[09:09:03] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[09:09:03] [PASSED] drm_test_check_disable_connector
[09:09:03] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[09:09:03] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[09:09:03] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[09:09:03] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[09:09:03] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[09:09:03] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[09:09:03] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[09:09:03] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[09:09:03] [PASSED] drm_test_check_output_bpc_dvi
[09:09:03] [PASSED] drm_test_check_output_bpc_format_vic_1
[09:09:03] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[09:09:03] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[09:09:03] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[09:09:03] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[09:09:03] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[09:09:03] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[09:09:03] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[09:09:03] ============ drm_test_check_hdmi_color_format  =============
[09:09:03] [PASSED] AUTO -> RGB
[09:09:03] [PASSED] YCBCR422 -> YUV422
[09:09:03] [PASSED] YCBCR420 -> YUV420
[09:09:03] [PASSED] YCBCR444 -> YUV444
[09:09:03] [PASSED] RGB -> RGB
[09:09:03] ======== [PASSED] drm_test_check_hdmi_color_format =========
[09:09:03] ======== drm_test_check_hdmi_color_format_420_only  ========
[09:09:03] [PASSED] RGB should fail
[09:09:03] [PASSED] YUV444 should fail
[09:09:03] [PASSED] YUV422 should fail
[09:09:03] [PASSED] YUV420 should work
[09:09:03] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[09:09:03] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[09:09:03] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[09:09:03] [PASSED] drm_test_check_broadcast_rgb_value
[09:09:03] [PASSED] drm_test_check_bpc_8_value
[09:09:03] [PASSED] drm_test_check_bpc_10_value
[09:09:03] [PASSED] drm_test_check_bpc_12_value
[09:09:03] [PASSED] drm_test_check_format_value
[09:09:03] [PASSED] drm_test_check_tmds_char_value
[09:09:03] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[09:09:03] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[09:09:03] [PASSED] drm_test_check_mode_valid
[09:09:03] [PASSED] drm_test_check_mode_valid_reject
[09:09:03] [PASSED] drm_test_check_mode_valid_reject_rate
[09:09:03] [PASSED] drm_test_check_mode_valid_reject_max_clock
[09:09:03] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[09:09:03] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[09:09:03] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[09:09:03] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[09:09:03] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[09:09:03] [PASSED] drm_test_check_infoframes
[09:09:03] [PASSED] drm_test_check_reject_avi_infoframe
[09:09:03] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[09:09:03] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[09:09:03] [PASSED] drm_test_check_reject_audio_infoframe
[09:09:03] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[09:09:03] ================= drm_managed (2 subtests) =================
[09:09:03] [PASSED] drm_test_managed_release_action
[09:09:03] [PASSED] drm_test_managed_run_action
[09:09:03] =================== [PASSED] drm_managed ===================
[09:09:03] =================== drm_mm (6 subtests) ====================
[09:09:03] [PASSED] drm_test_mm_init
[09:09:03] [PASSED] drm_test_mm_debug
[09:09:03] [PASSED] drm_test_mm_align32
[09:09:03] [PASSED] drm_test_mm_align64
[09:09:03] [PASSED] drm_test_mm_lowest
[09:09:03] [PASSED] drm_test_mm_highest
[09:09:03] ===================== [PASSED] drm_mm ======================
[09:09:03] ============= drm_modes_analog_tv (5 subtests) =============
[09:09:03] [PASSED] drm_test_modes_analog_tv_mono_576i
[09:09:03] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[09:09:03] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[09:09:03] [PASSED] drm_test_modes_analog_tv_pal_576i
[09:09:03] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[09:09:03] =============== [PASSED] drm_modes_analog_tv ===============
[09:09:03] ============== drm_plane_helper (2 subtests) ===============
[09:09:03] =============== drm_test_check_plane_state  ================
[09:09:03] [PASSED] clipping_simple
[09:09:03] [PASSED] clipping_rotate_reflect
[09:09:03] [PASSED] positioning_simple
[09:09:03] [PASSED] upscaling
[09:09:03] [PASSED] downscaling
[09:09:03] [PASSED] rounding1
[09:09:03] [PASSED] rounding2
[09:09:03] [PASSED] rounding3
[09:09:03] [PASSED] rounding4
[09:09:03] =========== [PASSED] drm_test_check_plane_state ============
[09:09:03] =========== drm_test_check_invalid_plane_state  ============
[09:09:03] [PASSED] positioning_invalid
[09:09:03] [PASSED] upscaling_invalid
[09:09:03] [PASSED] downscaling_invalid
[09:09:03] ======= [PASSED] drm_test_check_invalid_plane_state ========
[09:09:03] ================ [PASSED] drm_plane_helper =================
[09:09:03] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[09:09:03] ====== drm_test_connector_helper_tv_get_modes_check  =======
[09:09:03] [PASSED] None
[09:09:03] [PASSED] PAL
[09:09:03] [PASSED] NTSC
[09:09:03] [PASSED] Both, NTSC Default
[09:09:03] [PASSED] Both, PAL Default
[09:09:03] [PASSED] Both, NTSC Default, with PAL on command-line
[09:09:03] [PASSED] Both, PAL Default, with NTSC on command-line
[09:09:03] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[09:09:03] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[09:09:03] ================== drm_rect (9 subtests) ===================
[09:09:03] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[09:09:03] [PASSED] drm_test_rect_clip_scaled_not_clipped
[09:09:03] [PASSED] drm_test_rect_clip_scaled_clipped
[09:09:03] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[09:09:03] ================= drm_test_rect_intersect  =================
[09:09:03] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[09:09:03] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[09:09:03] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[09:09:03] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[09:09:03] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[09:09:03] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[09:09:03] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[09:09:03] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[09:09:03] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[09:09:03] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[09:09:03] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[09:09:03] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[09:09:03] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[09:09:03] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[09:09:03] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[09:09:03] ============= [PASSED] drm_test_rect_intersect =============
[09:09:03] ================ drm_test_rect_calc_hscale  ================
[09:09:03] [PASSED] normal use
[09:09:03] [PASSED] out of max range
[09:09:03] [PASSED] out of min range
[09:09:03] [PASSED] zero dst
[09:09:03] [PASSED] negative src
[09:09:03] [PASSED] negative dst
[09:09:03] ============ [PASSED] drm_test_rect_calc_hscale ============
[09:09:03] ================ drm_test_rect_calc_vscale  ================
[09:09:03] [PASSED] normal use
[09:09:03] [PASSED] out of max range
[09:09:03] [PASSED] out of min range
[09:09:03] [PASSED] zero dst
[09:09:03] [PASSED] negative src
[09:09:03] [PASSED] negative dst
[09:09:03] ============ [PASSED] drm_test_rect_calc_vscale ============
[09:09:03] ================== drm_test_rect_rotate  ===================
[09:09:03] [PASSED] reflect-x
[09:09:03] [PASSED] reflect-y
[09:09:03] [PASSED] rotate-0
[09:09:03] [PASSED] rotate-90
[09:09:03] [PASSED] rotate-180
[09:09:03] [PASSED] rotate-270
[09:09:03] ============== [PASSED] drm_test_rect_rotate ===============
[09:09:03] ================ drm_test_rect_rotate_inv  =================
[09:09:03] [PASSED] reflect-x
[09:09:03] [PASSED] reflect-y
[09:09:03] [PASSED] rotate-0
[09:09:03] [PASSED] rotate-90
[09:09:03] [PASSED] rotate-180
[09:09:03] [PASSED] rotate-270
[09:09:03] ============ [PASSED] drm_test_rect_rotate_inv =============
[09:09:03] ==================== [PASSED] drm_rect =====================
[09:09:03] ============ drm_sysfb_modeset_test (1 subtest) ============
[09:09:03] ============ drm_test_sysfb_build_fourcc_list  =============
[09:09:03] [PASSED] no native formats
[09:09:03] [PASSED] XRGB8888 as native format
[09:09:03] [PASSED] remove duplicates
[09:09:03] [PASSED] convert alpha formats
[09:09:03] [PASSED] random formats
[09:09:03] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[09:09:03] ============= [PASSED] drm_sysfb_modeset_test ==============
[09:09:03] ================== drm_fixp (2 subtests) ===================
[09:09:03] [PASSED] drm_test_int2fixp
[09:09:03] [PASSED] drm_test_sm2fixp
[09:09:03] ==================== [PASSED] drm_fixp =====================
[09:09:03] ============================================================
[09:09:03] Testing complete. Ran 641 tests: passed: 641
[09:09:03] Elapsed time: 26.768s total, 1.783s configuring, 24.768s building, 0.196s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[09:09:03] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:09:05] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[09:09:15] Starting KUnit Kernel (1/1)...
[09:09:15] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[09:09:15] ============= refcount_interrupt (4 subtests) ==============
[09:09:15] [PASSED] test_single_irq_change
[09:09:15] [PASSED] test_nested_irq_change
[09:09:15] [PASSED] test_multiple_irq_change
[09:09:15] [PASSED] test_irq_save
[09:09:15] =============== [PASSED] refcount_interrupt ================
[09:09:15] ================= ttm_device (5 subtests) ==================
[09:09:15] [PASSED] ttm_device_init_basic
[09:09:15] [PASSED] ttm_device_init_multiple
[09:09:15] [PASSED] ttm_device_fini_basic
[09:09:15] [PASSED] ttm_device_init_no_vma_man
[09:09:15] ================== ttm_device_init_pools  ==================
[09:09:15] [PASSED] No DMA allocations, no DMA32 required
[09:09:15] [PASSED] DMA allocations, DMA32 required
[09:09:15] [PASSED] No DMA allocations, DMA32 required
[09:09:15] [PASSED] DMA allocations, no DMA32 required
[09:09:15] ============== [PASSED] ttm_device_init_pools ==============
[09:09:15] =================== [PASSED] ttm_device ====================
[09:09:15] ================== ttm_pool (8 subtests) ===================
[09:09:15] ================== ttm_pool_alloc_basic  ===================
[09:09:15] [PASSED] One page
[09:09:15] [PASSED] More than one page
[09:09:15] [PASSED] Above the allocation limit
[09:09:15] [PASSED] One page, with coherent DMA mappings enabled
[09:09:15] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[09:09:15] ============== [PASSED] ttm_pool_alloc_basic ===============
[09:09:15] ============== ttm_pool_alloc_basic_dma_addr  ==============
[09:09:15] [PASSED] One page
[09:09:15] [PASSED] More than one page
[09:09:15] [PASSED] Above the allocation limit
[09:09:15] [PASSED] One page, with coherent DMA mappings enabled
[09:09:15] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[09:09:15] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[09:09:15] [PASSED] ttm_pool_alloc_order_caching_match
[09:09:15] [PASSED] ttm_pool_alloc_caching_mismatch
[09:09:15] [PASSED] ttm_pool_alloc_order_mismatch
[09:09:15] [PASSED] ttm_pool_free_dma_alloc
[09:09:15] [PASSED] ttm_pool_free_no_dma_alloc
[09:09:15] [PASSED] ttm_pool_fini_basic
[09:09:15] ==================== [PASSED] ttm_pool =====================
[09:09:15] ================ ttm_resource (8 subtests) =================
[09:09:15] ================= ttm_resource_init_basic  =================
[09:09:15] [PASSED] Init resource in TTM_PL_SYSTEM
[09:09:15] [PASSED] Init resource in TTM_PL_VRAM
[09:09:15] [PASSED] Init resource in a private placement
[09:09:15] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[09:09:15] ============= [PASSED] ttm_resource_init_basic =============
[09:09:15] [PASSED] ttm_resource_init_pinned
[09:09:15] [PASSED] ttm_resource_fini_basic
[09:09:15] [PASSED] ttm_resource_manager_init_basic
[09:09:15] [PASSED] ttm_resource_manager_usage_basic
[09:09:15] [PASSED] ttm_resource_manager_set_used_basic
[09:09:15] [PASSED] ttm_sys_man_alloc_basic
[09:09:15] [PASSED] ttm_sys_man_free_basic
[09:09:15] ================== [PASSED] ttm_resource ===================
[09:09:15] =================== ttm_tt (15 subtests) ===================
[09:09:15] ==================== ttm_tt_init_basic  ====================
[09:09:15] [PASSED] Page-aligned size
[09:09:15] [PASSED] Extra pages requested
[09:09:15] ================ [PASSED] ttm_tt_init_basic ================
[09:09:15] [PASSED] ttm_tt_init_misaligned
[09:09:15] [PASSED] ttm_tt_fini_basic
[09:09:15] [PASSED] ttm_tt_fini_sg
[09:09:15] [PASSED] ttm_tt_fini_shmem
[09:09:15] [PASSED] ttm_tt_create_basic
[09:09:15] [PASSED] ttm_tt_create_invalid_bo_type
[09:09:15] [PASSED] ttm_tt_create_ttm_exists
[09:09:15] [PASSED] ttm_tt_create_failed
[09:09:15] [PASSED] ttm_tt_destroy_basic
[09:09:15] [PASSED] ttm_tt_populate_null_ttm
[09:09:15] [PASSED] ttm_tt_populate_populated_ttm
[09:09:15] [PASSED] ttm_tt_unpopulate_basic
[09:09:15] [PASSED] ttm_tt_unpopulate_empty_ttm
[09:09:15] [PASSED] ttm_tt_swapin_basic
[09:09:15] ===================== [PASSED] ttm_tt ======================
[09:09:15] =================== ttm_bo (14 subtests) ===================
[09:09:15] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[09:09:15] [PASSED] Cannot be interrupted and sleeps
[09:09:15] [PASSED] Cannot be interrupted, locks straight away
[09:09:15] [PASSED] Can be interrupted, sleeps
[09:09:15] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[09:09:15] [PASSED] ttm_bo_reserve_locked_no_sleep
[09:09:15] [PASSED] ttm_bo_reserve_no_wait_ticket
[09:09:15] [PASSED] ttm_bo_reserve_double_resv
[09:09:15] [PASSED] ttm_bo_reserve_interrupted
[09:09:15] [PASSED] ttm_bo_reserve_deadlock
[09:09:15] [PASSED] ttm_bo_unreserve_basic
[09:09:15] [PASSED] ttm_bo_unreserve_pinned
[09:09:15] [PASSED] ttm_bo_unreserve_bulk
[09:09:15] [PASSED] ttm_bo_fini_basic
[09:09:15] [PASSED] ttm_bo_fini_shared_resv
[09:09:15] [PASSED] ttm_bo_pin_basic
[09:09:15] [PASSED] ttm_bo_pin_unpin_resource
[09:09:15] [PASSED] ttm_bo_multiple_pin_one_unpin
[09:09:15] ===================== [PASSED] ttm_bo ======================
[09:09:15] ============== ttm_bo_validate (22 subtests) ===============
[09:09:15] ============== ttm_bo_init_reserved_sys_man  ===============
[09:09:15] [PASSED] Buffer object for userspace
[09:09:15] [PASSED] Kernel buffer object
[09:09:15] [PASSED] Shared buffer object
[09:09:15] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[09:09:15] ============== ttm_bo_init_reserved_mock_man  ==============
[09:09:15] [PASSED] Buffer object for userspace
[09:09:15] [PASSED] Kernel buffer object
[09:09:15] [PASSED] Shared buffer object
[09:09:15] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[09:09:15] [PASSED] ttm_bo_init_reserved_resv
[09:09:15] ================== ttm_bo_validate_basic  ==================
[09:09:15] [PASSED] Buffer object for userspace
[09:09:15] [PASSED] Kernel buffer object
[09:09:15] [PASSED] Shared buffer object
[09:09:15] ============== [PASSED] ttm_bo_validate_basic ==============
[09:09:15] [PASSED] ttm_bo_validate_invalid_placement
[09:09:15] ============= ttm_bo_validate_same_placement  ==============
[09:09:15] [PASSED] System manager
[09:09:15] [PASSED] VRAM manager
[09:09:15] ========= [PASSED] ttm_bo_validate_same_placement ==========
[09:09:15] [PASSED] ttm_bo_validate_failed_alloc
[09:09:15] [PASSED] ttm_bo_validate_pinned
[09:09:15] [PASSED] ttm_bo_validate_busy_placement
[09:09:15] ================ ttm_bo_validate_multihop  =================
[09:09:15] [PASSED] Buffer object for userspace
[09:09:15] [PASSED] Kernel buffer object
[09:09:15] [PASSED] Shared buffer object
[09:09:15] ============ [PASSED] ttm_bo_validate_multihop =============
[09:09:15] ========== ttm_bo_validate_no_placement_signaled  ==========
[09:09:15] [PASSED] Buffer object in system domain, no page vector
[09:09:15] [PASSED] Buffer object in system domain with an existing page vector
[09:09:15] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[09:09:15] ======== ttm_bo_validate_no_placement_not_signaled  ========
[09:09:15] [PASSED] Buffer object for userspace
[09:09:15] [PASSED] Kernel buffer object
[09:09:15] [PASSED] Shared buffer object
[09:09:15] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[09:09:15] [PASSED] ttm_bo_validate_move_fence_signaled
[09:09:15] ========= ttm_bo_validate_move_fence_not_signaled  =========
[09:09:15] [PASSED] Waits for GPU
[09:09:15] [PASSED] Tries to lock straight away
[09:09:15] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[09:09:15] [PASSED] ttm_bo_validate_swapout
[09:09:15] [PASSED] ttm_bo_validate_happy_evict
[09:09:15] [PASSED] ttm_bo_validate_all_pinned_evict
[09:09:15] [PASSED] ttm_bo_validate_allowed_only_evict
[09:09:15] [PASSED] ttm_bo_validate_deleted_evict
[09:09:15] [PASSED] ttm_bo_validate_busy_domain_evict
[09:09:15] [PASSED] ttm_bo_validate_evict_gutting
[09:09:15] [PASSED] ttm_bo_validate_recrusive_evict
[09:09:15] ================= [PASSED] ttm_bo_validate =================
[09:09:15] ============================================================
[09:09:15] Testing complete. Ran 106 tests: passed: 106
[09:09:15] Elapsed time: 11.954s total, 1.785s configuring, 9.904s building, 0.227s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/dma-buf/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[09:09:15] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:09:17] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[09:09:26] Starting KUnit Kernel (1/1)...
[09:09:26] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[09:09:26] ============= refcount_interrupt (4 subtests) ==============
[09:09:26] [PASSED] test_single_irq_change
[09:09:26] [PASSED] test_nested_irq_change
[09:09:26] [PASSED] test_multiple_irq_change
[09:09:26] [PASSED] test_irq_save
[09:09:26] =============== [PASSED] refcount_interrupt ================
[09:09:26] =============== dma-buf-fence (12 subtests) ================
[09:09:26] [PASSED] test_sanitycheck
[09:09:26] [PASSED] test_signaling
[09:09:26] [PASSED] test_add_callback
[09:09:26] [PASSED] test_late_add_callback
[09:09:26] [PASSED] test_rm_callback
[09:09:26] [PASSED] test_late_rm_callback
[09:09:26] [PASSED] test_status
[09:09:26] [PASSED] test_error
[09:09:26] [PASSED] test_wait
[09:09:26] [PASSED] test_wait_timeout
[09:09:26] [PASSED] test_stub
[09:09:26] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[09:09:26] ================== [PASSED] dma-buf-fence ==================
[09:09:26] ============ dma-buf-fence-chain (11 subtests) =============
[09:09:26] [PASSED] test_sanitycheck
[09:09:26] [PASSED] test_find_seqno
[09:09:26] [PASSED] test_find_signaled
[09:09:26] [PASSED] test_find_out_of_order
[09:09:31] [PASSED] test_find_gap
[09:09:31] [PASSED] test_find_race
[09:09:31] [PASSED] test_signal_forward
[09:09:31] [PASSED] test_signal_backward
[09:09:31] [PASSED] test_wait_forward
[09:09:31] [PASSED] test_wait_backward
[09:09:31] [PASSED] test_wait_random
[09:09:31] =============== [PASSED] dma-buf-fence-chain ===============
[09:09:31] ============ dma-buf-fence-unwrap (10 subtests) ============
[09:09:31] [PASSED] test_sanitycheck
[09:09:31] [PASSED] test_unwrap_array
[09:09:31] [PASSED] test_unwrap_chain
[09:09:31] [PASSED] test_unwrap_chain_array
[09:09:31] [PASSED] test_unwrap_merge
[09:09:31] [PASSED] test_unwrap_merge_duplicate
[09:09:31] [PASSED] test_unwrap_merge_seqno
[09:09:31] [PASSED] test_unwrap_merge_order
[09:09:31] [PASSED] test_unwrap_merge_complex
[09:09:31] [PASSED] test_unwrap_merge_complex_seqno
[09:09:31] ============== [PASSED] dma-buf-fence-unwrap ===============
[09:09:31] ================ dma-buf-resv (5 subtests) =================
[09:09:31] [PASSED] test_sanitycheck
[09:09:31] ===================== test_signaling  ======================
[09:09:31] [PASSED] kernel
[09:09:31] [PASSED] write
[09:09:31] [PASSED] read
[09:09:31] [PASSED] bookkeep
[09:09:31] ================= [PASSED] test_signaling ==================
[09:09:31] ====================== test_for_each  ======================
[09:09:31] [PASSED] kernel
[09:09:31] [PASSED] write
[09:09:31] [PASSED] read
[09:09:31] [PASSED] bookkeep
[09:09:31] ================== [PASSED] test_for_each ==================
[09:09:31] ================= test_for_each_unlocked  ==================
[09:09:31] [PASSED] kernel
[09:09:31] [PASSED] write
[09:09:31] [PASSED] read
[09:09:31] [PASSED] bookkeep
[09:09:31] ============= [PASSED] test_for_each_unlocked ==============
[09:09:31] ===================== test_get_fences  =====================
[09:09:31] [PASSED] kernel
[09:09:31] [PASSED] write
[09:09:31] [PASSED] read
[09:09:31] [PASSED] bookkeep
[09:09:31] ================= [PASSED] test_get_fences =================
[09:09:31] ================== [PASSED] dma-buf-resv ===================
[09:09:31] ============================================================
[09:09:31] Testing complete. Ran 54 tests: passed: 53, skipped: 1
[09:09:31] Elapsed time: 15.844s total, 1.802s configuring, 8.720s building, 5.272s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


