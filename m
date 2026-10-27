Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704E4606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 20:40:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3022710E484;
	Tue, 27 Oct 2026 20:40:09 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E48810E484;
 Tue, 27 Oct 2026 20:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Add_a_minimum_age_gate_to_the_?=
 =?utf-8?q?shrinker_+_LRU_fixes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Oct 2026 20:40:07 -0000
Message-ID: <179313360763.78757.13146132696638277410@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261027203107.1065800-1-matthew.brost@intel.com>
In-Reply-To: <20261027203107.1065800-1-matthew.brost@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: Add a minimum age gate to the shrinker + LRU fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/176975/
State : success

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[20:37:59] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:38:03] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[20:38:24] Starting KUnit Kernel (1/1)...
[20:38:24] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[20:38:24] ================= gpu_buddy (14 subtests) ==================
[20:38:24] [PASSED] gpu_test_buddy_alloc_limit
[20:38:24] [PASSED] gpu_test_buddy_alloc_optimistic
[20:38:24] [PASSED] gpu_test_buddy_alloc_pessimistic
[20:38:24] [PASSED] gpu_test_buddy_alloc_pathological
[20:38:24] [PASSED] gpu_test_buddy_alloc_contiguous
[20:38:24] [PASSED] gpu_test_buddy_alloc_clear
[20:38:24] [PASSED] gpu_test_buddy_alloc_range
[20:38:24] [PASSED] gpu_test_buddy_alloc_range_bias
[20:38:25] [PASSED] gpu_test_buddy_fragmentation_performance
[20:38:26] [PASSED] gpu_test_buddy_dirty_tracker_performance
[20:38:26] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[20:38:26] [PASSED] gpu_test_buddy_offset_aligned_allocation
[20:38:26] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[20:38:26] [PASSED] gpu_test_buddy_addr_to_block
[20:38:26] ==================== [PASSED] gpu_buddy ====================
[20:38:26] ============================================================
[20:38:26] Testing complete. Ran 14 tests: passed: 14
[20:38:26] Elapsed time: 26.987s total, 4.450s configuring, 20.619s building, 1.853s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[20:38:26] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:38:28] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[20:39:07] Starting KUnit Kernel (1/1)...
[20:39:07] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[20:39:07] ================== guc_buf (11 subtests) ===================
[20:39:07] [PASSED] test_smallest
[20:39:07] [PASSED] test_largest
[20:39:07] [PASSED] test_granular
[20:39:07] [PASSED] test_unique
[20:39:07] [PASSED] test_overlap
[20:39:07] [PASSED] test_reusable
[20:39:07] [PASSED] test_too_big
[20:39:07] [PASSED] test_flush
[20:39:07] [PASSED] test_lookup
[20:39:07] [PASSED] test_data
[20:39:07] [PASSED] test_class
[20:39:07] ===================== [PASSED] guc_buf =====================
[20:39:07] =================== guc_dbm (7 subtests) ===================
[20:39:07] [PASSED] test_empty
[20:39:07] [PASSED] test_default
[20:39:07] ======================== test_size  ========================
[20:39:07] [PASSED] 4
[20:39:07] [PASSED] 8
[20:39:07] [PASSED] 32
[20:39:07] [PASSED] 256
[20:39:07] ==================== [PASSED] test_size ====================
[20:39:07] ======================= test_reuse  ========================
[20:39:07] [PASSED] 4
[20:39:07] [PASSED] 8
[20:39:07] [PASSED] 32
[20:39:07] [PASSED] 256
[20:39:07] =================== [PASSED] test_reuse ====================
[20:39:07] =================== test_range_overlap  ====================
[20:39:07] [PASSED] 4
[20:39:07] [PASSED] 8
[20:39:07] [PASSED] 32
[20:39:07] [PASSED] 256
[20:39:07] =============== [PASSED] test_range_overlap ================
[20:39:07] =================== test_range_compact  ====================
[20:39:07] [PASSED] 4
[20:39:07] [PASSED] 8
[20:39:07] [PASSED] 32
[20:39:07] [PASSED] 256
[20:39:07] =============== [PASSED] test_range_compact ================
[20:39:07] ==================== test_range_spare  =====================
[20:39:07] [PASSED] 4
[20:39:07] [PASSED] 8
[20:39:07] [PASSED] 32
[20:39:07] [PASSED] 256
[20:39:07] ================ [PASSED] test_range_spare =================
[20:39:07] ===================== [PASSED] guc_dbm =====================
[20:39:07] ================== guc_idm (22 subtests) ===================
[20:39:07] [PASSED] bad_init
[20:39:07] [PASSED] no_init
[20:39:07] [PASSED] init_fini
[20:39:07] [PASSED] check_init_small
[20:39:07] [PASSED] check_init_shared
[20:39:07] [PASSED] check_used
[20:39:07] [PASSED] check_quota
[20:39:07] [PASSED] check_all
[20:39:07] [PASSED] check_limits
[20:39:07] [PASSED] check_overlap
[20:39:07] [PASSED] check_overlap_alloc
[20:39:07] [PASSED] check_overlap_release
[20:39:07] [PASSED] check_overlap_partial_init
[20:39:07] [PASSED] check_overlap_partial_shared_range_blocking
[20:39:07] [PASSED] check_used_usable
[20:39:07] [PASSED] check_used_shareable
[20:39:07] [PASSED] check_used_mixed
[20:39:07] [PASSED] check_release_usable_range
[20:39:07] [PASSED] check_release_shareable_range
[20:39:07] [PASSED] check_split_boundaries
[20:39:07] [PASSED] check_shareable_spare
[20:39:07] [PASSED] check_shareable_spare_fragmented_tail
[20:39:07] ===================== [PASSED] guc_idm =====================
[20:39:07] ============== guc_klv_helpers (13 subtests) ===============
[20:39:07] [PASSED] test_count
[20:39:07] [PASSED] test_encode_u32
[20:39:07] [PASSED] test_encode_u64
[20:39:07] [PASSED] test_encode_string
[20:39:07] [PASSED] test_encode_object_raw
[20:39:07] [PASSED] test_encode_object_klv
[20:39:07] [PASSED] test_encode_object_nested
[20:39:07] [PASSED] test_encode_object_basic
[20:39:07] ===================== test_decode_u16  =====================
[20:39:07] [PASSED] empty
[20:39:07] [PASSED] valid
[20:39:07] [PASSED] max
[20:39:07] [PASSED] big
[20:39:07] [PASSED] long
[20:39:07] ================= [PASSED] test_decode_u16 =================
[20:39:07] ===================== test_decode_u32  =====================
[20:39:07] [PASSED] empty
[20:39:07] [PASSED] valid
[20:39:07] [PASSED] max
[20:39:07] [PASSED] long
[20:39:07] ================= [PASSED] test_decode_u32 =================
[20:39:07] ===================== test_decode_u64  =====================
[20:39:07] [PASSED] empty
[20:39:07] [PASSED] short
[20:39:07] [PASSED] valid
[20:39:07] [PASSED] max
[20:39:07] [PASSED] long
[20:39:07] ================= [PASSED] test_decode_u64 =================
[20:39:07] ===================== test_decode_str  =====================
[20:39:07] [PASSED] empty
[20:39:07] [PASSED] one
[20:39:07] [PASSED] one_trash
[20:39:07] [PASSED] two
[20:39:07] [PASSED] two_trash
[20:39:07] [PASSED] three
[20:39:07] [PASSED] dword
[20:39:07] [PASSED] four
[20:39:07] [PASSED] five
[20:39:07] [PASSED] six
[20:39:07] [PASSED] seven
[20:39:07] [PASSED] qword
[20:39:07] ================= [PASSED] test_decode_str =================
[20:39:07] [PASSED] test_print
[20:39:07] ================= [PASSED] guc_klv_helpers =================
[20:39:07] =================== xe_log (4 subtests) ====================
[20:39:07] [PASSED] demo_cper
[20:39:07] [PASSED] demo_dmesg
[20:39:07] ======================= test_dmesg  ========================
[20:39:07] [PASSED] test_fatal
[20:39:07] [PASSED] test_fatal_tile
[20:39:07] [PASSED] test_fatal_gt
[20:39:07] [PASSED] test_fatal_comp
[20:39:07] [PASSED] test_fatal_comp_tile
[20:39:07] [PASSED] test_fatal_comp_gt
[20:39:07] [PASSED] test_fatal_all
[20:39:07] [PASSED] test_recoverable
[20:39:07] [PASSED] test_recoverable_tile
[20:39:07] [PASSED] test_recoverable_gt
[20:39:07] [PASSED] test_recoverable_comp
[20:39:07] [PASSED] test_recoverable_comp_tile
[20:39:07] [PASSED] test_recoverable_comp_gt
[20:39:07] [PASSED] test_recoverable_all
[20:39:07] [PASSED] test_info
[20:39:07] [PASSED] test_info_tile
[20:39:07] [PASSED] test_info_gt
[20:39:07] [PASSED] test_info_err
[20:39:07] [PASSED] test_info_comp
[20:39:07] [PASSED] test_info_comp_tile
[20:39:07] [PASSED] test_info_comp_gt
[20:39:07] [PASSED] test_info_all
[20:39:07] [PASSED] test_hw_fatal
[20:39:07] [PASSED] test_hw_recoverable
[20:39:07] [PASSED] test_hw_corrected
[20:39:07] [PASSED] test_hw_informational
[20:39:07] =================== [PASSED] test_dmesg ====================
[20:39:07] ====================== test_invalid  =======================
[20:39:07] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[20:39:07] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[20:39:07] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[20:39:07] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[20:39:07] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[20:39:07] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[20:39:07] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[20:39:07] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[20:39:07] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[20:39:07] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[20:39:07] ================== [SKIPPED] test_invalid ==================
[20:39:07] ===================== [PASSED] xe_log ======================
[20:39:07] ================== no_relay (3 subtests) ===================
[20:39:07] [PASSED] xe_drops_guc2pf_if_not_ready
[20:39:07] [PASSED] xe_drops_guc2vf_if_not_ready
[20:39:07] [PASSED] xe_rejects_send_if_not_ready
[20:39:07] ==================== [PASSED] no_relay =====================
[20:39:07] ================== pf_relay (14 subtests) ==================
[20:39:07] [PASSED] pf_rejects_guc2pf_too_short
[20:39:07] [PASSED] pf_rejects_guc2pf_too_long
[20:39:07] [PASSED] pf_rejects_guc2pf_no_payload
[20:39:07] [PASSED] pf_fails_no_payload
[20:39:07] [PASSED] pf_fails_bad_origin
[20:39:07] [PASSED] pf_fails_bad_type
[20:39:07] [PASSED] pf_txn_reports_error
[20:39:07] [PASSED] pf_txn_sends_pf2guc
[20:39:07] [PASSED] pf_sends_pf2guc
[20:39:07] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[20:39:07] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[20:39:07] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[20:39:07] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[20:39:07] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[20:39:07] ==================== [PASSED] pf_relay =====================
[20:39:07] ================== vf_relay (3 subtests) ===================
[20:39:07] [PASSED] vf_rejects_guc2vf_too_short
[20:39:07] [PASSED] vf_rejects_guc2vf_too_long
[20:39:07] [PASSED] vf_rejects_guc2vf_no_payload
[20:39:07] ==================== [PASSED] vf_relay =====================
[20:39:07] ================ pf_gt_config (9 subtests) =================
[20:39:07] [PASSED] fair_contexts_1vf
[20:39:07] [PASSED] fair_doorbells_1vf
[20:39:07] [PASSED] fair_ggtt_1vf
[20:39:07] ====================== fair_vram_1vf  ======================
[20:39:07] [PASSED] 3.50 GiB
[20:39:07] [PASSED] 11.5 GiB
[20:39:07] [PASSED] 15.5 GiB
[20:39:07] [PASSED] 31.5 GiB
[20:39:07] [PASSED] 63.5 GiB
[20:39:07] [PASSED] 1.91 GiB
[20:39:07] ================== [PASSED] fair_vram_1vf ==================
[20:39:07] ================ fair_vram_1vf_admin_only  =================
[20:39:07] [PASSED] 3.50 GiB
[20:39:07] [PASSED] 11.5 GiB
[20:39:07] [PASSED] 15.5 GiB
[20:39:07] [PASSED] 31.5 GiB
[20:39:07] [PASSED] 63.5 GiB
[20:39:07] [PASSED] 1.91 GiB
[20:39:07] ============ [PASSED] fair_vram_1vf_admin_only =============
[20:39:07] ====================== fair_contexts  ======================
[20:39:07] [PASSED] 1 VF
[20:39:07] [PASSED] 2 VFs
[20:39:07] [PASSED] 3 VFs
[20:39:07] [PASSED] 4 VFs
[20:39:07] [PASSED] 5 VFs
[20:39:07] [PASSED] 6 VFs
[20:39:07] [PASSED] 7 VFs
[20:39:07] [PASSED] 8 VFs
[20:39:07] [PASSED] 9 VFs
[20:39:07] [PASSED] 10 VFs
[20:39:07] [PASSED] 11 VFs
[20:39:07] [PASSED] 12 VFs
[20:39:07] [PASSED] 13 VFs
[20:39:07] [PASSED] 14 VFs
[20:39:07] [PASSED] 15 VFs
[20:39:07] [PASSED] 16 VFs
[20:39:07] [PASSED] 17 VFs
[20:39:07] [PASSED] 18 VFs
[20:39:07] [PASSED] 19 VFs
[20:39:07] [PASSED] 20 VFs
[20:39:07] [PASSED] 21 VFs
[20:39:07] [PASSED] 22 VFs
[20:39:07] [PASSED] 23 VFs
[20:39:07] [PASSED] 24 VFs
[20:39:07] [PASSED] 25 VFs
[20:39:07] [PASSED] 26 VFs
[20:39:07] [PASSED] 27 VFs
[20:39:07] [PASSED] 28 VFs
[20:39:07] [PASSED] 29 VFs
[20:39:07] [PASSED] 30 VFs
[20:39:07] [PASSED] 31 VFs
[20:39:07] [PASSED] 32 VFs
[20:39:07] [PASSED] 33 VFs
[20:39:07] [PASSED] 34 VFs
[20:39:07] [PASSED] 35 VFs
[20:39:07] [PASSED] 36 VFs
[20:39:07] [PASSED] 37 VFs
[20:39:07] [PASSED] 38 VFs
[20:39:07] [PASSED] 39 VFs
[20:39:07] [PASSED] 40 VFs
[20:39:07] [PASSED] 41 VFs
[20:39:07] [PASSED] 42 VFs
[20:39:07] [PASSED] 43 VFs
[20:39:07] [PASSED] 44 VFs
[20:39:07] [PASSED] 45 VFs
[20:39:07] [PASSED] 46 VFs
[20:39:07] [PASSED] 47 VFs
[20:39:07] [PASSED] 48 VFs
[20:39:07] [PASSED] 49 VFs
[20:39:07] [PASSED] 50 VFs
[20:39:07] [PASSED] 51 VFs
[20:39:07] [PASSED] 52 VFs
[20:39:07] [PASSED] 53 VFs
[20:39:07] [PASSED] 54 VFs
[20:39:07] [PASSED] 55 VFs
[20:39:07] [PASSED] 56 VFs
[20:39:07] [PASSED] 57 VFs
[20:39:07] [PASSED] 58 VFs
[20:39:07] [PASSED] 59 VFs
[20:39:07] [PASSED] 60 VFs
[20:39:07] [PASSED] 61 VFs
[20:39:07] [PASSED] 62 VFs
[20:39:07] [PASSED] 63 VFs
[20:39:07] ================== [PASSED] fair_contexts ==================
[20:39:07] ===================== fair_doorbells  ======================
[20:39:07] [PASSED] 1 VF
[20:39:07] [PASSED] 2 VFs
[20:39:07] [PASSED] 3 VFs
[20:39:07] [PASSED] 4 VFs
[20:39:07] [PASSED] 5 VFs
[20:39:07] [PASSED] 6 VFs
[20:39:07] [PASSED] 7 VFs
[20:39:07] [PASSED] 8 VFs
[20:39:07] [PASSED] 9 VFs
[20:39:07] [PASSED] 10 VFs
[20:39:07] [PASSED] 11 VFs
[20:39:07] [PASSED] 12 VFs
[20:39:07] [PASSED] 13 VFs
[20:39:07] [PASSED] 14 VFs
[20:39:07] [PASSED] 15 VFs
[20:39:07] [PASSED] 16 VFs
[20:39:07] [PASSED] 17 VFs
[20:39:07] [PASSED] 18 VFs
[20:39:07] [PASSED] 19 VFs
[20:39:07] [PASSED] 20 VFs
[20:39:07] [PASSED] 21 VFs
[20:39:07] [PASSED] 22 VFs
[20:39:07] [PASSED] 23 VFs
[20:39:07] [PASSED] 24 VFs
[20:39:07] [PASSED] 25 VFs
[20:39:07] [PASSED] 26 VFs
[20:39:07] [PASSED] 27 VFs
[20:39:07] [PASSED] 28 VFs
[20:39:07] [PASSED] 29 VFs
[20:39:07] [PASSED] 30 VFs
[20:39:07] [PASSED] 31 VFs
[20:39:07] [PASSED] 32 VFs
[20:39:07] [PASSED] 33 VFs
[20:39:07] [PASSED] 34 VFs
[20:39:07] [PASSED] 35 VFs
[20:39:07] [PASSED] 36 VFs
[20:39:07] [PASSED] 37 VFs
[20:39:07] [PASSED] 38 VFs
[20:39:07] [PASSED] 39 VFs
[20:39:07] [PASSED] 40 VFs
[20:39:07] [PASSED] 41 VFs
[20:39:07] [PASSED] 42 VFs
[20:39:07] [PASSED] 43 VFs
[20:39:07] [PASSED] 44 VFs
[20:39:07] [PASSED] 45 VFs
[20:39:07] [PASSED] 46 VFs
[20:39:07] [PASSED] 47 VFs
[20:39:07] [PASSED] 48 VFs
[20:39:07] [PASSED] 49 VFs
[20:39:07] [PASSED] 50 VFs
[20:39:07] [PASSED] 51 VFs
[20:39:07] [PASSED] 52 VFs
[20:39:07] [PASSED] 53 VFs
[20:39:07] [PASSED] 54 VFs
[20:39:07] [PASSED] 55 VFs
[20:39:07] [PASSED] 56 VFs
[20:39:07] [PASSED] 57 VFs
[20:39:07] [PASSED] 58 VFs
[20:39:07] [PASSED] 59 VFs
[20:39:07] [PASSED] 60 VFs
[20:39:07] [PASSED] 61 VFs
[20:39:07] [PASSED] 62 VFs
[20:39:07] [PASSED] 63 VFs
[20:39:07] ================= [PASSED] fair_doorbells ==================
[20:39:07] ======================== fair_ggtt  ========================
[20:39:07] [PASSED] 1 VF
[20:39:07] [PASSED] 2 VFs
[20:39:07] [PASSED] 3 VFs
[20:39:07] [PASSED] 4 VFs
[20:39:07] [PASSED] 5 VFs
[20:39:07] [PASSED] 6 VFs
[20:39:07] [PASSED] 7 VFs
[20:39:07] [PASSED] 8 VFs
[20:39:07] [PASSED] 9 VFs
[20:39:07] [PASSED] 10 VFs
[20:39:07] [PASSED] 11 VFs
[20:39:07] [PASSED] 12 VFs
[20:39:07] [PASSED] 13 VFs
[20:39:07] [PASSED] 14 VFs
[20:39:07] [PASSED] 15 VFs
[20:39:07] [PASSED] 16 VFs
[20:39:07] [PASSED] 17 VFs
[20:39:07] [PASSED] 18 VFs
[20:39:07] [PASSED] 19 VFs
[20:39:07] [PASSED] 20 VFs
[20:39:07] [PASSED] 21 VFs
[20:39:07] [PASSED] 22 VFs
[20:39:07] [PASSED] 23 VFs
[20:39:07] [PASSED] 24 VFs
[20:39:07] [PASSED] 25 VFs
[20:39:07] [PASSED] 26 VFs
[20:39:07] [PASSED] 27 VFs
[20:39:07] [PASSED] 28 VFs
[20:39:07] [PASSED] 29 VFs
[20:39:07] [PASSED] 30 VFs
[20:39:07] [PASSED] 31 VFs
[20:39:07] [PASSED] 32 VFs
[20:39:07] [PASSED] 33 VFs
[20:39:07] [PASSED] 34 VFs
[20:39:07] [PASSED] 35 VFs
[20:39:07] [PASSED] 36 VFs
[20:39:07] [PASSED] 37 VFs
[20:39:07] [PASSED] 38 VFs
[20:39:07] [PASSED] 39 VFs
[20:39:07] [PASSED] 40 VFs
[20:39:07] [PASSED] 41 VFs
[20:39:07] [PASSED] 42 VFs
[20:39:07] [PASSED] 43 VFs
[20:39:07] [PASSED] 44 VFs
[20:39:07] [PASSED] 45 VFs
[20:39:07] [PASSED] 46 VFs
[20:39:07] [PASSED] 47 VFs
[20:39:07] [PASSED] 48 VFs
[20:39:07] [PASSED] 49 VFs
[20:39:07] [PASSED] 50 VFs
[20:39:07] [PASSED] 51 VFs
[20:39:07] [PASSED] 52 VFs
[20:39:07] [PASSED] 53 VFs
[20:39:07] [PASSED] 54 VFs
[20:39:07] [PASSED] 55 VFs
[20:39:07] [PASSED] 56 VFs
[20:39:07] [PASSED] 57 VFs
[20:39:07] [PASSED] 58 VFs
[20:39:07] [PASSED] 59 VFs
[20:39:07] [PASSED] 60 VFs
[20:39:07] [PASSED] 61 VFs
[20:39:07] [PASSED] 62 VFs
[20:39:07] [PASSED] 63 VFs
[20:39:07] ==================== [PASSED] fair_ggtt ====================
[20:39:07] ======================== fair_vram  ========================
[20:39:07] [PASSED] 1 VF
[20:39:07] [PASSED] 2 VFs
[20:39:07] [PASSED] 3 VFs
[20:39:07] [PASSED] 4 VFs
[20:39:07] [PASSED] 5 VFs
[20:39:07] [PASSED] 6 VFs
[20:39:07] [PASSED] 7 VFs
[20:39:07] [PASSED] 8 VFs
[20:39:07] [PASSED] 9 VFs
[20:39:07] [PASSED] 10 VFs
[20:39:07] [PASSED] 11 VFs
[20:39:07] [PASSED] 12 VFs
[20:39:07] [PASSED] 13 VFs
[20:39:07] [PASSED] 14 VFs
[20:39:07] [PASSED] 15 VFs
[20:39:07] [PASSED] 16 VFs
[20:39:07] [PASSED] 17 VFs
[20:39:07] [PASSED] 18 VFs
[20:39:07] [PASSED] 19 VFs
[20:39:07] [PASSED] 20 VFs
[20:39:07] [PASSED] 21 VFs
[20:39:07] [PASSED] 22 VFs
[20:39:07] [PASSED] 23 VFs
[20:39:07] [PASSED] 24 VFs
[20:39:07] [PASSED] 25 VFs
[20:39:07] [PASSED] 26 VFs
[20:39:07] [PASSED] 27 VFs
[20:39:07] [PASSED] 28 VFs
[20:39:07] [PASSED] 29 VFs
[20:39:07] [PASSED] 30 VFs
[20:39:07] [PASSED] 31 VFs
[20:39:07] [PASSED] 32 VFs
[20:39:07] [PASSED] 33 VFs
[20:39:07] [PASSED] 34 VFs
[20:39:07] [PASSED] 35 VFs
[20:39:07] [PASSED] 36 VFs
[20:39:07] [PASSED] 37 VFs
[20:39:07] [PASSED] 38 VFs
[20:39:07] [PASSED] 39 VFs
[20:39:07] [PASSED] 40 VFs
[20:39:07] [PASSED] 41 VFs
[20:39:07] [PASSED] 42 VFs
[20:39:07] [PASSED] 43 VFs
[20:39:07] [PASSED] 44 VFs
[20:39:07] [PASSED] 45 VFs
[20:39:07] [PASSED] 46 VFs
[20:39:07] [PASSED] 47 VFs
[20:39:07] [PASSED] 48 VFs
[20:39:07] [PASSED] 49 VFs
[20:39:07] [PASSED] 50 VFs
[20:39:07] [PASSED] 51 VFs
[20:39:07] [PASSED] 52 VFs
[20:39:07] [PASSED] 53 VFs
[20:39:07] [PASSED] 54 VFs
[20:39:07] [PASSED] 55 VFs
[20:39:07] [PASSED] 56 VFs
[20:39:07] [PASSED] 57 VFs
[20:39:07] [PASSED] 58 VFs
[20:39:07] [PASSED] 59 VFs
[20:39:07] [PASSED] 60 VFs
[20:39:07] [PASSED] 61 VFs
[20:39:07] [PASSED] 62 VFs
[20:39:07] [PASSED] 63 VFs
[20:39:07] ==================== [PASSED] fair_vram ====================
[20:39:07] ================== [PASSED] pf_gt_config ===================
[20:39:07] ===================== lmtt (1 subtest) =====================
[20:39:07] ======================== test_ops  =========================
[20:39:07] [PASSED] 2-level
[20:39:07] [PASSED] multi-level
[20:39:07] ==================== [PASSED] test_ops =====================
[20:39:07] ====================== [PASSED] lmtt =======================
[20:39:07] ================= sriov_packet (1 subtest) =================
[20:39:07] [PASSED] test_descriptor_init
[20:39:07] ================== [PASSED] sriov_packet ===================
[20:39:07] ================= pf_service (11 subtests) =================
[20:39:07] [PASSED] pf_negotiate_any
[20:39:07] [PASSED] pf_negotiate_base_match
[20:39:07] [PASSED] pf_negotiate_base_newer
[20:39:07] [PASSED] pf_negotiate_base_next
[20:39:07] [SKIPPED] pf_negotiate_base_older (no older minor)
[20:39:07] [PASSED] pf_negotiate_base_prev
[20:39:07] [PASSED] pf_negotiate_latest_match
[20:39:07] [PASSED] pf_negotiate_latest_newer
[20:39:07] [PASSED] pf_negotiate_latest_next
[20:39:07] [SKIPPED] pf_negotiate_latest_older (no older minor)
[20:39:07] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[20:39:07] =================== [PASSED] pf_service ====================
[20:39:07] ================= xe_guc_g2g (2 subtests) ==================
[20:39:07] ============== xe_live_guc_g2g_kunit_default  ==============
[20:39:07] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[20:39:07] ============== xe_live_guc_g2g_kunit_allmem  ===============
[20:39:07] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[20:39:07] =================== [SKIPPED] xe_guc_g2g ===================
[20:39:07] =================== xe_mocs (2 subtests) ===================
[20:39:07] ================ xe_live_mocs_kernel_kunit  ================
[20:39:07] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[20:39:07] ================ xe_live_mocs_reset_kunit  =================
[20:39:07] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[20:39:07] ==================== [SKIPPED] xe_mocs =====================
[20:39:07] ================= xe_migrate (3 subtests) ==================
[20:39:07] ================= xe_migrate_sanity_kunit  =================
[20:39:07] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[20:39:07] ================== xe_validate_ccs_kunit  ==================
[20:39:07] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[20:39:07] ============= xe_migrate_access_memory_kunit  ==============
[20:39:07] ========= [SKIPPED] xe_migrate_access_memory_kunit =========
[20:39:07] =================== [SKIPPED] xe_migrate ===================
[20:39:07] ================== xe_dma_buf (1 subtest) ==================
[20:39:07] ==================== xe_dma_buf_kunit  =====================
[20:39:07] ================ [SKIPPED] xe_dma_buf_kunit ================
[20:39:07] =================== [SKIPPED] xe_dma_buf ===================
[20:39:07] ================= xe_bo_shrink (1 subtest) =================
[20:39:07] =================== xe_bo_shrink_kunit  ====================
[20:39:07] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[20:39:07] ================== [SKIPPED] xe_bo_shrink ==================
[20:39:07] ==================== xe_bo (2 subtests) ====================
[20:39:07] ================== xe_ccs_migrate_kunit  ===================
[20:39:07] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[20:39:07] ==================== xe_bo_evict_kunit  ====================
[20:39:07] =============== [SKIPPED] xe_bo_evict_kunit ================
[20:39:07] ===================== [SKIPPED] xe_bo ======================
[20:39:07] =================== xe_any (9 subtests) ====================
[20:39:07] [PASSED] test_to_xe
[20:39:07] [PASSED] test_to_dev
[20:39:07] [PASSED] test_to_pdev
[20:39:07] [PASSED] test_to_drm
[20:39:07] [PASSED] test_if_pdev
[20:39:07] [PASSED] test_if_xe
[20:39:07] [PASSED] test_if_tile
[20:39:07] [PASSED] test_if_gt
[20:39:07] [PASSED] test_to_id
[20:39:07] ===================== [PASSED] xe_any ======================
[20:39:07] ==================== args (13 subtests) ====================
[20:39:07] [PASSED] count_args_test
[20:39:07] [PASSED] call_args_example
[20:39:07] [PASSED] call_args_test
[20:39:07] [PASSED] drop_first_arg_example
[20:39:07] [PASSED] drop_first_arg_test
[20:39:07] [PASSED] first_arg_example
[20:39:07] [PASSED] first_arg_test
[20:39:07] [PASSED] last_arg_example
[20:39:07] [PASSED] last_arg_test
[20:39:07] [PASSED] pick_arg_example
[20:39:07] [PASSED] if_args_example
[20:39:07] [PASSED] if_args_test
[20:39:07] [PASSED] sep_comma_example
[20:39:07] ====================== [PASSED] args =======================
[20:39:07] =================== xe_pci (3 subtests) ====================
[20:39:07] ==================== check_graphics_ip  ====================
[20:39:07] [PASSED] 12.00 Xe_LP
[20:39:07] [PASSED] 12.10 Xe_LP+
[20:39:07] [PASSED] 12.55 Xe_HPG
[20:39:07] [PASSED] 12.60 Xe_HPC
[20:39:07] [PASSED] 12.70 Xe_LPG
[20:39:07] [PASSED] 12.71 Xe_LPG
[20:39:07] [PASSED] 12.74 Xe_LPG+
[20:39:07] [PASSED] 20.01 Xe2_HPG
[20:39:07] [PASSED] 20.02 Xe2_HPG
[20:39:07] [PASSED] 20.04 Xe2_LPG
[20:39:07] [PASSED] 30.00 Xe3_LPG
[20:39:07] [PASSED] 30.01 Xe3_LPG
[20:39:07] [PASSED] 30.03 Xe3_LPG
[20:39:07] [PASSED] 30.04 Xe3_LPG
[20:39:07] [PASSED] 30.05 Xe3_LPG
[20:39:07] [PASSED] 35.10 Xe3p_LPG
[20:39:07] [PASSED] 35.11 Xe3p_XPC
[20:39:07] ================ [PASSED] check_graphics_ip ================
[20:39:07] ===================== check_media_ip  ======================
[20:39:07] [PASSED] 12.00 Xe_M
[20:39:07] [PASSED] 12.55 Xe_HPM
[20:39:07] [PASSED] 13.00 Xe_LPM+
[20:39:07] [PASSED] 13.01 Xe2_HPM
[20:39:07] [PASSED] 20.00 Xe2_LPM
[20:39:07] [PASSED] 30.00 Xe3_LPM
[20:39:07] [PASSED] 30.02 Xe3_LPM
[20:39:07] [PASSED] 35.00 Xe3p_LPM
[20:39:07] [PASSED] 35.03 Xe3p_HPM
[20:39:07] ================= [PASSED] check_media_ip ==================
[20:39:07] =================== check_platform_desc  ===================
[20:39:07] [PASSED] 0x9A60 (TIGERLAKE)
[20:39:07] [PASSED] 0x9A68 (TIGERLAKE)
[20:39:07] [PASSED] 0x9A70 (TIGERLAKE)
[20:39:07] [PASSED] 0x9A40 (TIGERLAKE)
[20:39:07] [PASSED] 0x9A49 (TIGERLAKE)
[20:39:07] [PASSED] 0x9A59 (TIGERLAKE)
[20:39:07] [PASSED] 0x9A78 (TIGERLAKE)
[20:39:07] [PASSED] 0x9AC0 (TIGERLAKE)
[20:39:07] [PASSED] 0x9AC9 (TIGERLAKE)
[20:39:07] [PASSED] 0x9AD9 (TIGERLAKE)
[20:39:07] [PASSED] 0x9AF8 (TIGERLAKE)
[20:39:07] [PASSED] 0x4C80 (ROCKETLAKE)
[20:39:07] [PASSED] 0x4C8A (ROCKETLAKE)
[20:39:07] [PASSED] 0x4C8B (ROCKETLAKE)
[20:39:07] [PASSED] 0x4C8C (ROCKETLAKE)
[20:39:07] [PASSED] 0x4C90 (ROCKETLAKE)
[20:39:07] [PASSED] 0x4C9A (ROCKETLAKE)
[20:39:07] [PASSED] 0x4680 (ALDERLAKE_S)
[20:39:07] [PASSED] 0x4682 (ALDERLAKE_S)
[20:39:07] [PASSED] 0x4688 (ALDERLAKE_S)
[20:39:07] [PASSED] 0x468A (ALDERLAKE_S)
[20:39:07] [PASSED] 0x468B (ALDERLAKE_S)
[20:39:07] [PASSED] 0x4690 (ALDERLAKE_S)
[20:39:07] [PASSED] 0x4692 (ALDERLAKE_S)
[20:39:07] [PASSED] 0x4693 (ALDERLAKE_S)
[20:39:07] [PASSED] 0x46A0 (ALDERLAKE_P)
[20:39:07] [PASSED] 0x46A1 (ALDERLAKE_P)
[20:39:07] [PASSED] 0x46A2 (ALDERLAKE_P)
[20:39:07] [PASSED] 0x46A3 (ALDERLAKE_P)
[20:39:07] [PASSED] 0x46A6 (ALDERLAKE_P)
[20:39:07] [PASSED] 0x46A8 (ALDERLAKE_P)
[20:39:07] [PASSED] 0x46AA (ALDERLAKE_P)
[20:39:07] [PASSED] 0x462A (ALDERLAKE_P)
[20:39:07] [PASSED] 0x4626 (ALDERLAKE_P)
[20:39:07] [PASSED] 0x4628 (ALDERLAKE_P)
[20:39:07] [PASSED] 0x46B0 (ALDERLAKE_P)
[20:39:07] [PASSED] 0x46B1 (ALDERLAKE_P)
[20:39:07] [PASSED] 0x46B2 (ALDERLAKE_P)
[20:39:07] [PASSED] 0x46B3 (ALDERLAKE_P)
[20:39:07] [PASSED] 0x46C0 (ALDERLAKE_P)
[20:39:07] [PASSED] 0x46C1 (ALDERLAKE_P)
[20:39:07] [PASSED] 0x46C2 (ALDERLAKE_P)
[20:39:07] [PASSED] 0x46C3 (ALDERLAKE_P)
[20:39:07] [PASSED] 0x46D0 (ALDERLAKE_N)
[20:39:07] [PASSED] 0x46D1 (ALDERLAKE_N)
[20:39:07] [PASSED] 0x46D2 (ALDERLAKE_N)
[20:39:07] [PASSED] 0x46D3 (ALDERLAKE_N)
[20:39:07] [PASSED] 0x46D4 (ALDERLAKE_N)
[20:39:07] [PASSED] 0xA721 (ALDERLAKE_P)
[20:39:07] [PASSED] 0xA7A1 (ALDERLAKE_P)
[20:39:07] [PASSED] 0xA7A9 (ALDERLAKE_P)
[20:39:07] [PASSED] 0xA7AC (ALDERLAKE_P)
[20:39:07] [PASSED] 0xA7AD (ALDERLAKE_P)
[20:39:07] [PASSED] 0xA720 (ALDERLAKE_P)
[20:39:07] [PASSED] 0xA7A0 (ALDERLAKE_P)
[20:39:07] [PASSED] 0xA7A8 (ALDERLAKE_P)
[20:39:07] [PASSED] 0xA7AA (ALDERLAKE_P)
[20:39:07] [PASSED] 0xA7AB (ALDERLAKE_P)
[20:39:07] [PASSED] 0xA780 (ALDERLAKE_S)
[20:39:07] [PASSED] 0xA781 (ALDERLAKE_S)
[20:39:07] [PASSED] 0xA782 (ALDERLAKE_S)
[20:39:07] [PASSED] 0xA783 (ALDERLAKE_S)
[20:39:07] [PASSED] 0xA788 (ALDERLAKE_S)
[20:39:07] [PASSED] 0xA789 (ALDERLAKE_S)
[20:39:07] [PASSED] 0xA78A (ALDERLAKE_S)
[20:39:07] [PASSED] 0xA78B (ALDERLAKE_S)
[20:39:07] [PASSED] 0x4905 (DG1)
[20:39:07] [PASSED] 0x4906 (DG1)
[20:39:07] [PASSED] 0x4907 (DG1)
[20:39:07] [PASSED] 0x4908 (DG1)
[20:39:07] [PASSED] 0x4909 (DG1)
[20:39:07] [PASSED] 0x56C0 (DG2)
[20:39:07] [PASSED] 0x56C2 (DG2)
[20:39:07] [PASSED] 0x56C1 (DG2)
[20:39:07] [PASSED] 0x7D51 (METEORLAKE)
[20:39:07] [PASSED] 0x7DD1 (METEORLAKE)
[20:39:07] [PASSED] 0x7D41 (METEORLAKE)
[20:39:07] [PASSED] 0x7D67 (METEORLAKE)
[20:39:07] [PASSED] 0xB640 (METEORLAKE)
[20:39:07] [PASSED] 0x56A0 (DG2)
[20:39:07] [PASSED] 0x56A1 (DG2)
[20:39:07] [PASSED] 0x56A2 (DG2)
[20:39:07] [PASSED] 0x56BE (DG2)
[20:39:07] [PASSED] 0x56BF (DG2)
[20:39:07] [PASSED] 0x5690 (DG2)
[20:39:07] [PASSED] 0x5691 (DG2)
[20:39:07] [PASSED] 0x5692 (DG2)
[20:39:07] [PASSED] 0x56A5 (DG2)
[20:39:07] [PASSED] 0x56A6 (DG2)
[20:39:07] [PASSED] 0x56B0 (DG2)
[20:39:07] [PASSED] 0x56B1 (DG2)
[20:39:07] [PASSED] 0x56BA (DG2)
[20:39:07] [PASSED] 0x56BB (DG2)
[20:39:07] [PASSED] 0x56BC (DG2)
[20:39:07] [PASSED] 0x56BD (DG2)
[20:39:07] [PASSED] 0x5693 (DG2)
[20:39:07] [PASSED] 0x5694 (DG2)
[20:39:07] [PASSED] 0x5695 (DG2)
[20:39:07] [PASSED] 0x56A3 (DG2)
[20:39:07] [PASSED] 0x56A4 (DG2)
[20:39:07] [PASSED] 0x56B2 (DG2)
[20:39:07] [PASSED] 0x56B3 (DG2)
[20:39:07] [PASSED] 0x5696 (DG2)
[20:39:07] [PASSED] 0x5697 (DG2)
[20:39:07] [PASSED] 0xB69 (PVC)
[20:39:07] [PASSED] 0xB6E (PVC)
[20:39:07] [PASSED] 0xBD4 (PVC)
[20:39:07] [PASSED] 0xBD5 (PVC)
[20:39:07] [PASSED] 0xBD6 (PVC)
[20:39:07] [PASSED] 0xBD7 (PVC)
[20:39:07] [PASSED] 0xBD8 (PVC)
[20:39:07] [PASSED] 0xBD9 (PVC)
[20:39:07] [PASSED] 0xBDA (PVC)
[20:39:07] [PASSED] 0xBDB (PVC)
[20:39:07] [PASSED] 0xBE0 (PVC)
[20:39:07] [PASSED] 0xBE1 (PVC)
[20:39:07] [PASSED] 0xBE5 (PVC)
[20:39:07] [PASSED] 0x7D40 (METEORLAKE)
[20:39:07] [PASSED] 0x7D45 (METEORLAKE)
[20:39:07] [PASSED] 0x7D55 (METEORLAKE)
[20:39:07] [PASSED] 0x7D60 (METEORLAKE)
[20:39:07] [PASSED] 0x7DD5 (METEORLAKE)
[20:39:07] [PASSED] 0x6420 (LUNARLAKE)
[20:39:07] [PASSED] 0x64A0 (LUNARLAKE)
[20:39:07] [PASSED] 0x64B0 (LUNARLAKE)
[20:39:07] [PASSED] 0xE202 (BATTLEMAGE)
[20:39:07] [PASSED] 0xE209 (BATTLEMAGE)
[20:39:07] [PASSED] 0xE20B (BATTLEMAGE)
[20:39:07] [PASSED] 0xE20C (BATTLEMAGE)
[20:39:07] [PASSED] 0xE20D (BATTLEMAGE)
[20:39:07] [PASSED] 0xE210 (BATTLEMAGE)
[20:39:07] [PASSED] 0xE211 (BATTLEMAGE)
[20:39:07] [PASSED] 0xE212 (BATTLEMAGE)
[20:39:07] [PASSED] 0xE216 (BATTLEMAGE)
[20:39:07] [PASSED] 0xE220 (BATTLEMAGE)
[20:39:07] [PASSED] 0xE221 (BATTLEMAGE)
[20:39:07] [PASSED] 0xE222 (BATTLEMAGE)
[20:39:07] [PASSED] 0xE223 (BATTLEMAGE)
[20:39:07] [PASSED] 0xB080 (PANTHERLAKE)
[20:39:07] [PASSED] 0xB081 (PANTHERLAKE)
[20:39:07] [PASSED] 0xB082 (PANTHERLAKE)
[20:39:07] [PASSED] 0xB083 (PANTHERLAKE)
[20:39:07] [PASSED] 0xB084 (PANTHERLAKE)
[20:39:07] [PASSED] 0xB085 (PANTHERLAKE)
[20:39:07] [PASSED] 0xB086 (PANTHERLAKE)
[20:39:07] [PASSED] 0xB087 (PANTHERLAKE)
[20:39:07] [PASSED] 0xB08F (PANTHERLAKE)
[20:39:07] [PASSED] 0xB090 (PANTHERLAKE)
[20:39:07] [PASSED] 0xB0A0 (PANTHERLAKE)
[20:39:07] [PASSED] 0xB0A1 (PANTHERLAKE)
[20:39:07] [PASSED] 0xB0B0 (PANTHERLAKE)
[20:39:07] [PASSED] 0xFD80 (PANTHERLAKE)
[20:39:07] [PASSED] 0xFD81 (PANTHERLAKE)
[20:39:07] [PASSED] 0xD740 (NOVALAKE_S)
[20:39:07] [PASSED] 0xD741 (NOVALAKE_S)
[20:39:07] [PASSED] 0xD742 (NOVALAKE_S)
[20:39:07] [PASSED] 0xD743 (NOVALAKE_S)
[20:39:07] [PASSED] 0xD745 (NOVALAKE_S)
[20:39:07] [PASSED] 0xD74A (NOVALAKE_S)
[20:39:07] [PASSED] 0xD74B (NOVALAKE_S)
[20:39:07] [PASSED] 0x674C (CRESCENTISLAND)
[20:39:07] [PASSED] 0x674D (CRESCENTISLAND)
[20:39:07] [PASSED] 0x674E (CRESCENTISLAND)
[20:39:07] [PASSED] 0x674F (CRESCENTISLAND)
[20:39:07] [PASSED] 0x6750 (CRESCENTISLAND)
[20:39:07] [PASSED] 0x6751 (CRESCENTISLAND)
[20:39:07] [PASSED] 0xD750 (NOVALAKE_P)
[20:39:07] [PASSED] 0xD751 (NOVALAKE_P)
[20:39:07] [PASSED] 0xD752 (NOVALAKE_P)
[20:39:07] [PASSED] 0xD753 (NOVALAKE_P)
[20:39:07] [PASSED] 0xD754 (NOVALAKE_P)
[20:39:07] [PASSED] 0xD755 (NOVALAKE_P)
[20:39:07] [PASSED] 0xD756 (NOVALAKE_P)
[20:39:07] [PASSED] 0xD757 (NOVALAKE_P)
[20:39:07] [PASSED] 0xD75F (NOVALAKE_P)
[20:39:07] =============== [PASSED] check_platform_desc ===============
[20:39:07] ===================== [PASSED] xe_pci ======================
[20:39:07] ============= xe_rtp_tables_test (5 subtests) ==============
[20:39:07] ================== xe_rtp_table_gt_test  ===================
[20:39:07] [PASSED] gt_was/14011060649
[20:39:07] [PASSED] gt_was/14011059788
[20:39:07] [PASSED] gt_was/14015795083
[20:39:07] [PASSED] gt_was/16021867713
[20:39:07] [PASSED] gt_was/14019449301
[20:39:07] [PASSED] gt_was/16028005424
[20:39:07] [PASSED] gt_was/14026578760
[20:39:07] [PASSED] gt_was/1409420604
[20:39:07] [PASSED] gt_was/1408615072
[20:39:07] [PASSED] gt_was/22010523718
[20:39:07] [PASSED] gt_was/14011006942
[20:39:07] [PASSED] gt_was/14014830051
[20:39:07] [PASSED] gt_was/18018781329
[20:39:07] [PASSED] gt_was/1509235366
[20:39:07] [PASSED] gt_was/18018781329
[20:39:07] [PASSED] gt_was/16016694945
[20:39:07] [PASSED] gt_was/14018575942
[20:39:07] [PASSED] gt_was/22016670082
[20:39:07] [PASSED] gt_was/22016670082
[20:39:07] [PASSED] gt_was/14017421178
[20:39:07] [PASSED] gt_was/16025250150
[20:39:07] [PASSED] gt_was/14021871409
[20:39:07] [PASSED] gt_was/16021865536
[20:39:07] [PASSED] gt_was/14021486841
[20:39:07] [PASSED] gt_was/14025160223
[20:39:07] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[20:39:07] [PASSED] gt_was/14025635424
[20:39:07] [PASSED] gt_was/16028005424
[20:39:07] ============== [PASSED] xe_rtp_table_gt_test ===============
[20:39:07] ================== xe_rtp_table_gt_test  ===================
[20:39:07] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[20:39:07] [PASSED] gt_tunings/Tuning: 32B Access Enable
[20:39:07] [PASSED] gt_tunings/Tuning: L3 cache
[20:39:07] [PASSED] gt_tunings/Tuning: L3 cache - media
[20:39:07] [PASSED] gt_tunings/Tuning: Compression Overfetch
[20:39:07] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[20:39:07] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[20:39:07] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[20:39:07] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[20:39:07] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[20:39:07] [PASSED] gt_tunings/Tuning: Stateless compression control
[20:39:07] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[20:39:07] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[20:39:07] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[20:39:07] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[20:39:07] [PASSED] gt_tunings/Tuning: Force All Non-Compressible Memory Reads to be 256B Overfetches
[20:39:07] ============== [PASSED] xe_rtp_table_gt_test ===============
[20:39:07] ================== xe_rtp_table_oob_test  ==================
[20:39:07] [PASSED] oob_was/1607983814
[20:39:07] [PASSED] oob_was/16010904313
[20:39:07] [PASSED] oob_was/18022495364
[20:39:07] [PASSED] oob_was/22012773006
[20:39:07] [PASSED] oob_was/14014475959
[20:39:07] [PASSED] oob_was/22011391025
[20:39:07] [PASSED] oob_was/22012727170
[20:39:07] [PASSED] oob_was/22012727685
[20:39:07] [PASSED] oob_was/22016596838
[20:39:07] [PASSED] oob_was/18020744125
[20:39:07] [PASSED] oob_was/1409600907
[20:39:07] [PASSED] oob_was/22014953428
[20:39:07] [PASSED] oob_was/16017236439
[20:39:07] [PASSED] oob_was/14019821291
[20:39:07] [PASSED] oob_was/14015076503
[20:39:07] [PASSED] oob_was/22016122933
[20:39:07] [PASSED] oob_was/14018913170
[20:39:07] [PASSED] oob_was/14018094691
[20:39:07] [PASSED] oob_was/18024947630
[20:39:07] [PASSED] oob_was/16022287689
[20:39:07] [PASSED] oob_was/13011645652
[20:39:07] [PASSED] oob_was/14022293748
[20:39:07] [PASSED] oob_was/22019794406
[20:39:07] [PASSED] oob_was/22019338487
[20:39:07] [PASSED] oob_was/16023588340
[20:39:07] [PASSED] oob_was/14019789679
[20:39:07] [PASSED] oob_was/14022866841
[20:39:07] [PASSED] oob_was/16021333562
[20:39:07] [PASSED] oob_was/14016712196
[20:39:07] [PASSED] oob_was/14015568240
[20:39:07] [PASSED] oob_was/18013179988
[20:39:07] [PASSED] oob_was/1508761755
[20:39:07] [PASSED] oob_was/16023105232
[20:39:07] [PASSED] oob_was/16026508708
[20:39:07] [PASSED] oob_was/14020001231
[20:39:07] [PASSED] oob_was/16023683509
[20:39:07] [PASSED] oob_was/14025515070
[20:39:07] [PASSED] oob_was/15015404425_disable
[20:39:07] [PASSED] oob_was/16026007364
[20:39:07] [PASSED] oob_was/14020316580
[20:39:07] [PASSED] oob_was/14025883347
[20:39:07] [PASSED] oob_was/16029380221
[20:39:07] [PASSED] oob_was/22022079272
[20:39:07] [PASSED] oob_was/16029897822
[20:39:07] [PASSED] oob_was/14027054324
[20:39:07] [PASSED] oob_was/14025941587
[20:39:07] [PASSED] oob_was/16030224309
[20:39:07] ============== [PASSED] xe_rtp_table_oob_test ==============
[20:39:07] ================ xe_rtp_table_dev_oob_test  ================
[20:39:07] [PASSED] device_oob_was/22010954014
[20:39:07] [PASSED] device_oob_was/15015404425
[20:39:07] [PASSED] device_oob_was/22019338487_display
[20:39:07] [PASSED] device_oob_was/14022085890
[20:39:07] [PASSED] device_oob_was/14026539277
[20:39:07] [PASSED] device_oob_was/14026633728
[20:39:07] [PASSED] device_oob_was/14026746987
[20:39:07] [PASSED] device_oob_was/14026779378
[20:39:07] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[20:39:07] ========== xe_rtp_table_missing_upper_bound_test  ==========
[20:39:07] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[20:39:07] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[20:39:07] [PASSED] register_whitelist/1806527549
[20:39:07] [PASSED] register_whitelist/allow_read_ctx_timestamp
[20:39:07] [PASSED] register_whitelist/allow_read_queue_timestamp
[20:39:07] [PASSED] register_whitelist/16014440446
[20:39:07] [PASSED] register_whitelist/16017236439
[20:39:07] [PASSED] register_whitelist/16020183090
[20:39:07] [PASSED] register_whitelist/14024997852
[20:39:07] [PASSED] register_whitelist/14024997852
[20:39:07] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[20:39:07] =============== [PASSED] xe_rtp_tables_test ================
[20:39:07] =================== xe_rtp (3 subtests) ====================
[20:39:07] =================== xe_rtp_rules_tests  ====================
[20:39:07] [PASSED] no
[20:39:07] [PASSED] yes
[20:39:07] [PASSED] no-and-no
[20:39:07] [PASSED] no-and-yes
[20:39:07] [PASSED] yes-and-no
[20:39:07] [PASSED] yes-and-yes
[20:39:07] [PASSED] no-or-no
[20:39:07] [PASSED] no-or-yes
[20:39:07] [PASSED] yes-or-no
[20:39:07] [PASSED] yes-or-yes
[20:39:07] [PASSED] no-yes-or-yes-no
[20:39:07] [PASSED] no-yes-or-yes-yes
[20:39:07] [PASSED] yes-yes-or-no-yes
[20:39:07] [PASSED] yes-yes-or-yes-yes
[20:39:07] [PASSED] no-no-or-yes-or-no
[20:39:07] [PASSED] or
[20:39:07] [PASSED] or-yes
[20:39:07] [PASSED] or-no
[20:39:07] [PASSED] yes-or
[20:39:07] [PASSED] no-or
[20:39:07] [PASSED] no-or-or-yes
[20:39:07] [PASSED] yes-or-or-no
[20:39:07] [PASSED] no-or-or-no
[20:39:07] [PASSED] missing-context-engine-class
[20:39:07] [PASSED] missing-context-engine-class-or-yes
[20:39:07] [PASSED] missing-context-engine-class-or-or-yes
[20:39:07] =============== [PASSED] xe_rtp_rules_tests ================
[20:39:07] =============== xe_rtp_process_to_sr_tests  ================
[20:39:07] [PASSED] coalesce-same-reg
[20:39:07] [PASSED] coalesce-same-reg-literal-and-func
[20:39:07] [PASSED] no-match-no-add
[20:39:07] [PASSED] two-regs-two-entries
[20:39:07] [PASSED] clr-one-set-other
[20:39:07] [PASSED] set-field
[20:39:07] [PASSED] conflict-duplicate
[20:39:07] [PASSED] conflict-not-disjoint
[20:39:07] [PASSED] conflict-not-disjoint-literal-and-func
[20:39:07] [PASSED] conflict-reg-type
[20:39:07] [PASSED] bad-mcr-reg-forced-to-regular
[20:39:07] [PASSED] bad-regular-reg-forced-to-mcr
[20:39:07] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[20:39:07] ================== xe_rtp_process_tests  ===================
[20:39:07] [PASSED] active1
[20:39:07] [PASSED] active2
[20:39:07] [PASSED] active-inactive
[20:39:07] [PASSED] inactive-active
[20:39:07] [PASSED] inactive-active-inactive
[20:39:07] [PASSED] inactive-inactive-inactive
[20:39:07] ============== [PASSED] xe_rtp_process_tests ===============
[20:39:07] ===================== [PASSED] xe_rtp ======================
[20:39:07] ==================== xe_wa (1 subtest) =====================
[20:39:07] ======================== xe_wa_gt  =========================
[20:39:07] [PASSED] TIGERLAKE B0
[20:39:07] [PASSED] DG1 A0
[20:39:07] [PASSED] DG1 B0
[20:39:07] [PASSED] ALDERLAKE_S A0
[20:39:07] [PASSED] ALDERLAKE_S B0
[20:39:07] [PASSED] ALDERLAKE_S C0
[20:39:07] [PASSED] ALDERLAKE_S D0
[20:39:07] [PASSED] ALDERLAKE_P A0
[20:39:07] [PASSED] ALDERLAKE_P B0
[20:39:07] [PASSED] ALDERLAKE_P C0
[20:39:07] [PASSED] ALDERLAKE_S RPLS D0
[20:39:07] [PASSED] ALDERLAKE_P RPLU E0
[20:39:07] [PASSED] DG2 G10 C0
[20:39:07] [PASSED] DG2 G11 B1
[20:39:07] [PASSED] DG2 G12 A1
[20:39:07] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[20:39:07] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[20:39:07] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[20:39:07] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[20:39:07] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[20:39:07] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[20:39:07] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[20:39:07] ==================== [PASSED] xe_wa_gt =====================
[20:39:07] ====================== [PASSED] xe_wa ======================
[20:39:07] ============================================================
[20:39:07] Testing complete. Ran 838 tests: passed: 809, skipped: 29
[20:39:07] Elapsed time: 41.349s total, 1.917s configuring, 38.665s building, 0.724s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[20:39:08] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:39:09] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[20:39:35] Starting KUnit Kernel (1/1)...
[20:39:35] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[20:39:35] ============ drm_test_pick_cmdline (2 subtests) ============
[20:39:35] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[20:39:35] =============== drm_test_pick_cmdline_named  ===============
[20:39:35] [PASSED] NTSC
[20:39:35] [PASSED] NTSC-J
[20:39:35] [PASSED] PAL
[20:39:35] [PASSED] PAL-M
[20:39:35] =========== [PASSED] drm_test_pick_cmdline_named ===========
[20:39:35] ============== [PASSED] drm_test_pick_cmdline ==============
[20:39:35] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[20:39:35] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[20:39:35] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[20:39:35] =========== drm_validate_clone_mode (2 subtests) ===========
[20:39:35] ============== drm_test_check_in_clone_mode  ===============
[20:39:35] [PASSED] in_clone_mode
[20:39:35] [PASSED] not_in_clone_mode
[20:39:35] ========== [PASSED] drm_test_check_in_clone_mode ===========
[20:39:35] =============== drm_test_check_valid_clones  ===============
[20:39:35] [PASSED] not_in_clone_mode
[20:39:35] [PASSED] valid_clone
[20:39:35] [PASSED] invalid_clone
[20:39:35] =========== [PASSED] drm_test_check_valid_clones ===========
[20:39:35] ============= [PASSED] drm_validate_clone_mode =============
[20:39:35] ============= drm_validate_modeset (1 subtest) =============
[20:39:35] [PASSED] drm_test_check_connector_changed_modeset
[20:39:35] ============== [PASSED] drm_validate_modeset ===============
[20:39:35] ====== drm_test_bridge_get_current_state (1 subtest) =======
[20:39:35] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[20:39:35] ======== [PASSED] drm_test_bridge_get_current_state ========
[20:39:35] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[20:39:35] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[20:39:35] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[20:39:35] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[20:39:35] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[20:39:35] ============== drm_bridge_alloc (2 subtests) ===============
[20:39:35] [PASSED] drm_test_drm_bridge_alloc_basic
[20:39:35] [PASSED] drm_test_drm_bridge_alloc_get_put
[20:39:35] ================ [PASSED] drm_bridge_alloc =================
[20:39:35] ============= drm_bridge_bus_fmt (5 subtests) ==============
[20:39:35] [PASSED] drm_test_bridge_rgb_yuv_rgb
[20:39:35] [PASSED] drm_test_bridge_must_convert_to_yuv444
[20:39:35] [PASSED] drm_test_bridge_hdmi_auto_rgb
[20:39:35] [PASSED] drm_test_bridge_auto_first
[20:39:35] [PASSED] drm_test_bridge_rgb_yuv_no_path
[20:39:35] =============== [PASSED] drm_bridge_bus_fmt ================
[20:39:35] ============= drm_cmdline_parser (40 subtests) =============
[20:39:35] [PASSED] drm_test_cmdline_force_d_only
[20:39:35] [PASSED] drm_test_cmdline_force_D_only_dvi
[20:39:35] [PASSED] drm_test_cmdline_force_D_only_hdmi
[20:39:35] [PASSED] drm_test_cmdline_force_D_only_not_digital
[20:39:35] [PASSED] drm_test_cmdline_force_e_only
[20:39:35] [PASSED] drm_test_cmdline_res
[20:39:35] [PASSED] drm_test_cmdline_res_vesa
[20:39:35] [PASSED] drm_test_cmdline_res_vesa_rblank
[20:39:35] [PASSED] drm_test_cmdline_res_rblank
[20:39:35] [PASSED] drm_test_cmdline_res_bpp
[20:39:35] [PASSED] drm_test_cmdline_res_refresh
[20:39:35] [PASSED] drm_test_cmdline_res_bpp_refresh
[20:39:35] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[20:39:35] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[20:39:35] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[20:39:35] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[20:39:35] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[20:39:35] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[20:39:35] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[20:39:35] [PASSED] drm_test_cmdline_res_margins_force_on
[20:39:35] [PASSED] drm_test_cmdline_res_vesa_margins
[20:39:35] [PASSED] drm_test_cmdline_name
[20:39:35] [PASSED] drm_test_cmdline_name_bpp
[20:39:35] [PASSED] drm_test_cmdline_name_option
[20:39:35] [PASSED] drm_test_cmdline_name_bpp_option
[20:39:35] [PASSED] drm_test_cmdline_rotate_0
[20:39:35] [PASSED] drm_test_cmdline_rotate_90
[20:39:35] [PASSED] drm_test_cmdline_rotate_180
[20:39:35] [PASSED] drm_test_cmdline_rotate_270
[20:39:35] [PASSED] drm_test_cmdline_hmirror
[20:39:35] [PASSED] drm_test_cmdline_vmirror
[20:39:35] [PASSED] drm_test_cmdline_margin_options
[20:39:35] [PASSED] drm_test_cmdline_multiple_options
[20:39:35] [PASSED] drm_test_cmdline_bpp_extra_and_option
[20:39:35] [PASSED] drm_test_cmdline_extra_and_option
[20:39:35] [PASSED] drm_test_cmdline_freestanding_options
[20:39:35] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[20:39:35] [PASSED] drm_test_cmdline_panel_orientation
[20:39:35] ================ drm_test_cmdline_invalid  =================
[20:39:35] [PASSED] margin_only
[20:39:35] [PASSED] interlace_only
[20:39:35] [PASSED] res_missing_x
[20:39:35] [PASSED] res_missing_y
[20:39:35] [PASSED] res_bad_y
[20:39:35] [PASSED] res_missing_y_bpp
[20:39:35] [PASSED] res_bad_bpp
[20:39:35] [PASSED] res_bad_refresh
[20:39:35] [PASSED] res_bpp_refresh_force_on_off
[20:39:35] [PASSED] res_invalid_mode
[20:39:35] [PASSED] res_bpp_wrong_place_mode
[20:39:35] [PASSED] name_bpp_refresh
[20:39:35] [PASSED] name_refresh
[20:39:35] [PASSED] name_refresh_wrong_mode
[20:39:35] [PASSED] name_refresh_invalid_mode
[20:39:35] [PASSED] rotate_multiple
[20:39:35] [PASSED] rotate_invalid_val
[20:39:35] [PASSED] rotate_truncated
[20:39:35] [PASSED] invalid_option
[20:39:35] [PASSED] invalid_tv_option
[20:39:35] [PASSED] truncated_tv_option
[20:39:35] ============ [PASSED] drm_test_cmdline_invalid =============
[20:39:35] =============== drm_test_cmdline_tv_options  ===============
[20:39:35] [PASSED] NTSC
[20:39:35] [PASSED] NTSC_443
[20:39:35] [PASSED] NTSC_J
[20:39:35] [PASSED] PAL
[20:39:35] [PASSED] PAL_M
[20:39:35] [PASSED] PAL_N
[20:39:35] [PASSED] SECAM
[20:39:35] [PASSED] MONO_525
[20:39:35] [PASSED] MONO_625
[20:39:35] =========== [PASSED] drm_test_cmdline_tv_options ===========
[20:39:35] =============== [PASSED] drm_cmdline_parser ================
[20:39:35] ========== drmm_connector_hdmi_init (20 subtests) ==========
[20:39:35] [PASSED] drm_test_connector_hdmi_init_valid
[20:39:35] [PASSED] drm_test_connector_hdmi_init_bpc_8
[20:39:35] [PASSED] drm_test_connector_hdmi_init_bpc_10
[20:39:35] [PASSED] drm_test_connector_hdmi_init_bpc_12
[20:39:35] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[20:39:35] [PASSED] drm_test_connector_hdmi_init_bpc_null
[20:39:35] [PASSED] drm_test_connector_hdmi_init_formats_empty
[20:39:35] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[20:39:35] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[20:39:35] [PASSED] supported_formats=0x9 yuv420_allowed=1
[20:39:35] [PASSED] supported_formats=0x9 yuv420_allowed=0
[20:39:35] [PASSED] supported_formats=0x5 yuv420_allowed=1
[20:39:35] [PASSED] supported_formats=0x5 yuv420_allowed=0
[20:39:35] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[20:39:35] [PASSED] drm_test_connector_hdmi_init_null_ddc
[20:39:35] [PASSED] drm_test_connector_hdmi_init_null_product
[20:39:35] [PASSED] drm_test_connector_hdmi_init_null_vendor
[20:39:35] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[20:39:35] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[20:39:35] [PASSED] drm_test_connector_hdmi_init_product_valid
[20:39:35] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[20:39:35] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[20:39:35] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[20:39:35] ========= drm_test_connector_hdmi_init_type_valid  =========
[20:39:35] [PASSED] HDMI-A
[20:39:35] [PASSED] HDMI-B
[20:39:35] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[20:39:35] ======== drm_test_connector_hdmi_init_type_invalid  ========
[20:39:35] [PASSED] Unknown
[20:39:35] [PASSED] VGA
[20:39:35] [PASSED] DVI-I
[20:39:35] [PASSED] DVI-D
[20:39:35] [PASSED] DVI-A
[20:39:35] [PASSED] Composite
[20:39:35] [PASSED] SVIDEO
[20:39:35] [PASSED] LVDS
[20:39:35] [PASSED] Component
[20:39:35] [PASSED] DIN
[20:39:35] [PASSED] DP
[20:39:35] [PASSED] TV
[20:39:35] [PASSED] eDP
[20:39:35] [PASSED] Virtual
[20:39:35] [PASSED] DSI
[20:39:35] [PASSED] DPI
[20:39:35] [PASSED] Writeback
[20:39:35] [PASSED] SPI
[20:39:35] [PASSED] USB
[20:39:35] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[20:39:35] ============ [PASSED] drmm_connector_hdmi_init =============
[20:39:35] ============= drmm_connector_init (3 subtests) =============
[20:39:35] [PASSED] drm_test_drmm_connector_init
[20:39:35] [PASSED] drm_test_drmm_connector_init_null_ddc
[20:39:35] ========= drm_test_drmm_connector_init_type_valid  =========
[20:39:35] [PASSED] Unknown
[20:39:35] [PASSED] VGA
[20:39:35] [PASSED] DVI-I
[20:39:35] [PASSED] DVI-D
[20:39:35] [PASSED] DVI-A
[20:39:35] [PASSED] Composite
[20:39:35] [PASSED] SVIDEO
[20:39:35] [PASSED] LVDS
[20:39:35] [PASSED] Component
[20:39:35] [PASSED] DIN
[20:39:35] [PASSED] DP
[20:39:35] [PASSED] HDMI-A
[20:39:35] [PASSED] HDMI-B
[20:39:35] [PASSED] TV
[20:39:35] [PASSED] eDP
[20:39:35] [PASSED] Virtual
[20:39:35] [PASSED] DSI
[20:39:35] [PASSED] DPI
[20:39:35] [PASSED] Writeback
[20:39:35] [PASSED] SPI
[20:39:35] [PASSED] USB
[20:39:35] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[20:39:35] =============== [PASSED] drmm_connector_init ===============
[20:39:35] ========= drm_connector_dynamic_init (6 subtests) ==========
[20:39:35] [PASSED] drm_test_drm_connector_dynamic_init
[20:39:35] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[20:39:35] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[20:39:35] [PASSED] drm_test_drm_connector_dynamic_init_properties
[20:39:35] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[20:39:35] [PASSED] Unknown
[20:39:35] [PASSED] VGA
[20:39:35] [PASSED] DVI-I
[20:39:35] [PASSED] DVI-D
[20:39:35] [PASSED] DVI-A
[20:39:35] [PASSED] Composite
[20:39:35] [PASSED] SVIDEO
[20:39:35] [PASSED] LVDS
[20:39:35] [PASSED] Component
[20:39:35] [PASSED] DIN
[20:39:35] [PASSED] DP
[20:39:35] [PASSED] HDMI-A
[20:39:35] [PASSED] HDMI-B
[20:39:35] [PASSED] TV
[20:39:35] [PASSED] eDP
[20:39:35] [PASSED] Virtual
[20:39:35] [PASSED] DSI
[20:39:35] [PASSED] DPI
[20:39:35] [PASSED] Writeback
[20:39:35] [PASSED] SPI
[20:39:35] [PASSED] USB
[20:39:35] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[20:39:35] ======== drm_test_drm_connector_dynamic_init_name  =========
[20:39:35] [PASSED] Unknown
[20:39:35] [PASSED] VGA
[20:39:35] [PASSED] DVI-I
[20:39:35] [PASSED] DVI-D
[20:39:35] [PASSED] DVI-A
[20:39:35] [PASSED] Composite
[20:39:35] [PASSED] SVIDEO
[20:39:35] [PASSED] LVDS
[20:39:35] [PASSED] Component
[20:39:35] [PASSED] DIN
[20:39:35] [PASSED] DP
[20:39:35] [PASSED] HDMI-A
[20:39:35] [PASSED] HDMI-B
[20:39:35] [PASSED] TV
[20:39:35] [PASSED] eDP
[20:39:35] [PASSED] Virtual
[20:39:35] [PASSED] DSI
[20:39:35] [PASSED] DPI
[20:39:35] [PASSED] Writeback
[20:39:35] [PASSED] SPI
[20:39:35] [PASSED] USB
[20:39:35] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[20:39:35] =========== [PASSED] drm_connector_dynamic_init ============
[20:39:35] ==== drm_connector_dynamic_register_early (4 subtests) =====
[20:39:35] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[20:39:35] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[20:39:35] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[20:39:35] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[20:39:35] ====== [PASSED] drm_connector_dynamic_register_early =======
[20:39:35] ======= drm_connector_dynamic_register (7 subtests) ========
[20:39:35] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[20:39:35] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[20:39:35] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[20:39:35] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[20:39:35] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[20:39:35] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[20:39:35] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[20:39:35] ========= [PASSED] drm_connector_dynamic_register ==========
[20:39:35] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[20:39:35] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[20:39:35] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[20:39:35] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[20:39:35] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[20:39:35] ========== drm_test_get_tv_mode_from_name_valid  ===========
[20:39:35] [PASSED] NTSC
[20:39:35] [PASSED] NTSC-443
[20:39:35] [PASSED] NTSC-J
[20:39:35] [PASSED] PAL
[20:39:35] [PASSED] PAL-M
[20:39:35] [PASSED] PAL-N
[20:39:35] [PASSED] SECAM
[20:39:35] [PASSED] Mono
[20:39:35] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[20:39:35] [PASSED] drm_test_get_tv_mode_from_name_truncated
[20:39:35] ============ [PASSED] drm_get_tv_mode_from_name ============
[20:39:35] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[20:39:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[20:39:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[20:39:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[20:39:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[20:39:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[20:39:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[20:39:35] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[20:39:35] [PASSED] VIC 96
[20:39:35] [PASSED] VIC 97
[20:39:35] [PASSED] VIC 101
[20:39:35] [PASSED] VIC 102
[20:39:35] [PASSED] VIC 106
[20:39:35] [PASSED] VIC 107
[20:39:35] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[20:39:35] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[20:39:35] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[20:39:35] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[20:39:35] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[20:39:35] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[20:39:35] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[20:39:35] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[20:39:35] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[20:39:35] [PASSED] Automatic
[20:39:35] [PASSED] Full
[20:39:35] [PASSED] Limited 16:235
[20:39:35] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[20:39:35] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[20:39:35] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[20:39:35] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[20:39:35] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[20:39:35] [PASSED] RGB
[20:39:35] [PASSED] YUV 4:2:0
[20:39:35] [PASSED] YUV 4:2:2
[20:39:35] [PASSED] YUV 4:4:4
[20:39:35] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[20:39:35] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[20:39:35] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[20:39:35] ============= drm_damage_helper (21 subtests) ==============
[20:39:35] [PASSED] drm_test_damage_iter_no_damage
[20:39:35] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[20:39:35] [PASSED] drm_test_damage_iter_no_damage_src_moved
[20:39:35] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[20:39:35] [PASSED] drm_test_damage_iter_no_damage_not_visible
[20:39:35] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[20:39:35] [PASSED] drm_test_damage_iter_no_damage_no_fb
[20:39:35] [PASSED] drm_test_damage_iter_simple_damage
[20:39:35] [PASSED] drm_test_damage_iter_single_damage
[20:39:35] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[20:39:35] [PASSED] drm_test_damage_iter_single_damage_outside_src
[20:39:35] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[20:39:35] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[20:39:35] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[20:39:35] [PASSED] drm_test_damage_iter_single_damage_src_moved
[20:39:35] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[20:39:35] [PASSED] drm_test_damage_iter_damage
[20:39:35] [PASSED] drm_test_damage_iter_damage_one_intersect
[20:39:35] [PASSED] drm_test_damage_iter_damage_one_outside
[20:39:35] [PASSED] drm_test_damage_iter_damage_src_moved
[20:39:35] [PASSED] drm_test_damage_iter_damage_not_visible
[20:39:35] ================ [PASSED] drm_damage_helper ================
[20:39:35] ============== drm_dp_mst_helper (3 subtests) ==============
[20:39:35] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[20:39:35] [PASSED] Clock 154000 BPP 30 DSC disabled
[20:39:35] [PASSED] Clock 234000 BPP 30 DSC disabled
[20:39:35] [PASSED] Clock 297000 BPP 24 DSC disabled
[20:39:35] [PASSED] Clock 332880 BPP 24 DSC enabled
[20:39:35] [PASSED] Clock 324540 BPP 24 DSC enabled
[20:39:35] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[20:39:35] ============== drm_test_dp_mst_calc_pbn_div  ===============
[20:39:35] [PASSED] Link rate 2000000 lane count 4
[20:39:35] [PASSED] Link rate 2000000 lane count 2
[20:39:35] [PASSED] Link rate 2000000 lane count 1
[20:39:35] [PASSED] Link rate 1350000 lane count 4
[20:39:35] [PASSED] Link rate 1350000 lane count 2
[20:39:35] [PASSED] Link rate 1350000 lane count 1
[20:39:35] [PASSED] Link rate 1000000 lane count 4
[20:39:35] [PASSED] Link rate 1000000 lane count 2
[20:39:35] [PASSED] Link rate 1000000 lane count 1
[20:39:35] [PASSED] Link rate 810000 lane count 4
[20:39:35] [PASSED] Link rate 810000 lane count 2
[20:39:35] [PASSED] Link rate 810000 lane count 1
[20:39:35] [PASSED] Link rate 540000 lane count 4
[20:39:35] [PASSED] Link rate 540000 lane count 2
[20:39:35] [PASSED] Link rate 540000 lane count 1
[20:39:35] [PASSED] Link rate 270000 lane count 4
[20:39:35] [PASSED] Link rate 270000 lane count 2
[20:39:35] [PASSED] Link rate 270000 lane count 1
[20:39:35] [PASSED] Link rate 162000 lane count 4
[20:39:35] [PASSED] Link rate 162000 lane count 2
[20:39:35] [PASSED] Link rate 162000 lane count 1
[20:39:35] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[20:39:35] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[20:39:35] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[20:39:35] [PASSED] DP_POWER_UP_PHY with port number
[20:39:35] [PASSED] DP_POWER_DOWN_PHY with port number
[20:39:35] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[20:39:35] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[20:39:35] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[20:39:35] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[20:39:35] [PASSED] DP_QUERY_PAYLOAD with port number
[20:39:35] [PASSED] DP_QUERY_PAYLOAD with VCPI
[20:39:35] [PASSED] DP_REMOTE_DPCD_READ with port number
[20:39:35] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[20:39:35] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[20:39:35] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[20:39:35] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[20:39:35] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[20:39:35] [PASSED] DP_REMOTE_I2C_READ with port number
[20:39:35] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[20:39:35] [PASSED] DP_REMOTE_I2C_READ with transactions array
[20:39:35] [PASSED] DP_REMOTE_I2C_WRITE with port number
[20:39:35] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[20:39:35] [PASSED] DP_REMOTE_I2C_WRITE with data array
[20:39:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[20:39:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[20:39:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[20:39:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[20:39:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[20:39:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[20:39:35] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[20:39:35] ================ [PASSED] drm_dp_mst_helper ================
[20:39:35] ================== drm_exec (7 subtests) ===================
[20:39:35] [PASSED] sanitycheck
[20:39:35] [PASSED] test_lock
[20:39:35] [PASSED] test_lock_unlock
[20:39:35] [PASSED] test_duplicates
[20:39:35] [PASSED] test_prepare
[20:39:35] [PASSED] test_prepare_array
[20:39:35] [PASSED] test_multiple_loops
[20:39:35] ==================== [PASSED] drm_exec =====================
[20:39:35] =========== drm_format_helper_test (17 subtests) ===========
[20:39:35] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[20:39:35] [PASSED] single_pixel_source_buffer
[20:39:35] [PASSED] single_pixel_clip_rectangle
[20:39:35] [PASSED] well_known_colors
[20:39:35] [PASSED] destination_pitch
[20:39:35] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[20:39:35] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[20:39:35] [PASSED] single_pixel_source_buffer
[20:39:35] [PASSED] single_pixel_clip_rectangle
[20:39:35] [PASSED] well_known_colors
[20:39:35] [PASSED] destination_pitch
[20:39:35] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[20:39:35] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[20:39:35] [PASSED] single_pixel_source_buffer
[20:39:35] [PASSED] single_pixel_clip_rectangle
[20:39:35] [PASSED] well_known_colors
[20:39:35] [PASSED] destination_pitch
[20:39:35] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[20:39:35] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[20:39:35] [PASSED] single_pixel_source_buffer
[20:39:35] [PASSED] single_pixel_clip_rectangle
[20:39:35] [PASSED] well_known_colors
[20:39:35] [PASSED] destination_pitch
[20:39:35] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[20:39:35] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[20:39:35] [PASSED] single_pixel_source_buffer
[20:39:35] [PASSED] single_pixel_clip_rectangle
[20:39:35] [PASSED] well_known_colors
[20:39:35] [PASSED] destination_pitch
[20:39:35] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[20:39:35] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[20:39:35] [PASSED] single_pixel_source_buffer
[20:39:35] [PASSED] single_pixel_clip_rectangle
[20:39:35] [PASSED] well_known_colors
[20:39:35] [PASSED] destination_pitch
[20:39:35] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[20:39:35] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[20:39:35] [PASSED] single_pixel_source_buffer
[20:39:35] [PASSED] single_pixel_clip_rectangle
[20:39:35] [PASSED] well_known_colors
[20:39:35] [PASSED] destination_pitch
[20:39:35] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[20:39:35] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[20:39:35] [PASSED] single_pixel_source_buffer
[20:39:35] [PASSED] single_pixel_clip_rectangle
[20:39:35] [PASSED] well_known_colors
[20:39:35] [PASSED] destination_pitch
[20:39:35] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[20:39:35] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[20:39:35] [PASSED] single_pixel_source_buffer
[20:39:35] [PASSED] single_pixel_clip_rectangle
[20:39:35] [PASSED] well_known_colors
[20:39:35] [PASSED] destination_pitch
[20:39:35] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[20:39:35] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[20:39:35] [PASSED] single_pixel_source_buffer
[20:39:35] [PASSED] single_pixel_clip_rectangle
[20:39:35] [PASSED] well_known_colors
[20:39:35] [PASSED] destination_pitch
[20:39:35] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[20:39:35] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[20:39:35] [PASSED] single_pixel_source_buffer
[20:39:35] [PASSED] single_pixel_clip_rectangle
[20:39:35] [PASSED] well_known_colors
[20:39:35] [PASSED] destination_pitch
[20:39:35] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[20:39:35] ============== drm_test_fb_xrgb8888_to_mono  ===============
[20:39:35] [PASSED] single_pixel_source_buffer
[20:39:35] [PASSED] single_pixel_clip_rectangle
[20:39:35] [PASSED] well_known_colors
[20:39:35] [PASSED] destination_pitch
[20:39:35] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[20:39:35] ==================== drm_test_fb_swab  =====================
[20:39:35] [PASSED] single_pixel_source_buffer
[20:39:35] [PASSED] single_pixel_clip_rectangle
[20:39:35] [PASSED] well_known_colors
[20:39:35] [PASSED] destination_pitch
[20:39:35] ================ [PASSED] drm_test_fb_swab =================
[20:39:35] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[20:39:35] [PASSED] single_pixel_source_buffer
[20:39:35] [PASSED] single_pixel_clip_rectangle
[20:39:35] [PASSED] well_known_colors
[20:39:35] [PASSED] destination_pitch
[20:39:35] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[20:39:35] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[20:39:35] [PASSED] single_pixel_source_buffer
[20:39:35] [PASSED] single_pixel_clip_rectangle
[20:39:35] [PASSED] well_known_colors
[20:39:35] [PASSED] destination_pitch
[20:39:35] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[20:39:35] ================= drm_test_fb_clip_offset  =================
[20:39:35] [PASSED] pass through
[20:39:35] [PASSED] horizontal offset
[20:39:35] [PASSED] vertical offset
[20:39:35] [PASSED] horizontal and vertical offset
[20:39:35] [PASSED] horizontal offset (custom pitch)
[20:39:35] [PASSED] vertical offset (custom pitch)
[20:39:35] [PASSED] horizontal and vertical offset (custom pitch)
[20:39:35] ============= [PASSED] drm_test_fb_clip_offset =============
[20:39:35] =================== drm_test_fb_memcpy  ====================
[20:39:35] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[20:39:35] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[20:39:35] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[20:39:35] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[20:39:35] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[20:39:35] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[20:39:35] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[20:39:35] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[20:39:35] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[20:39:35] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[20:39:35] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[20:39:35] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[20:39:35] =============== [PASSED] drm_test_fb_memcpy ================
[20:39:35] ============= [PASSED] drm_format_helper_test ==============
[20:39:35] ================= drm_format (18 subtests) =================
[20:39:35] [PASSED] drm_test_format_block_width_invalid
[20:39:35] [PASSED] drm_test_format_block_width_one_plane
[20:39:35] [PASSED] drm_test_format_block_width_two_plane
[20:39:35] [PASSED] drm_test_format_block_width_three_plane
[20:39:35] [PASSED] drm_test_format_block_width_tiled
[20:39:35] [PASSED] drm_test_format_block_height_invalid
[20:39:35] [PASSED] drm_test_format_block_height_one_plane
[20:39:35] [PASSED] drm_test_format_block_height_two_plane
[20:39:35] [PASSED] drm_test_format_block_height_three_plane
[20:39:35] [PASSED] drm_test_format_block_height_tiled
[20:39:35] [PASSED] drm_test_format_min_pitch_invalid
[20:39:35] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[20:39:35] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[20:39:35] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[20:39:35] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[20:39:35] [PASSED] drm_test_format_min_pitch_two_plane
[20:39:35] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[20:39:35] [PASSED] drm_test_format_min_pitch_tiled
[20:39:35] =================== [PASSED] drm_format ====================
[20:39:35] ============== drm_framebuffer (10 subtests) ===============
[20:39:35] ========== drm_test_framebuffer_check_src_coords  ==========
[20:39:35] [PASSED] Success: source fits into fb
[20:39:35] [PASSED] Fail: overflowing fb with x-axis coordinate
[20:39:35] [PASSED] Fail: overflowing fb with y-axis coordinate
[20:39:35] [PASSED] Fail: overflowing fb with source width
[20:39:35] [PASSED] Fail: overflowing fb with source height
[20:39:35] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[20:39:35] [PASSED] drm_test_framebuffer_cleanup
[20:39:35] =============== drm_test_framebuffer_create  ===============
[20:39:35] [PASSED] ABGR8888 normal sizes
[20:39:35] [PASSED] ABGR8888 max sizes
[20:39:35] [PASSED] ABGR8888 pitch greater than min required
[20:39:35] [PASSED] ABGR8888 pitch less than min required
[20:39:35] [PASSED] ABGR8888 Invalid width
[20:39:35] [PASSED] ABGR8888 Invalid buffer handle
[20:39:35] [PASSED] No pixel format
[20:39:35] [PASSED] ABGR8888 Width 0
[20:39:35] [PASSED] ABGR8888 Height 0
[20:39:35] [PASSED] ABGR8888 Out of bound height * pitch combination
[20:39:35] [PASSED] ABGR8888 Large buffer offset
[20:39:35] [PASSED] ABGR8888 Buffer offset for inexistent plane
[20:39:35] [PASSED] ABGR8888 Invalid flag
[20:39:35] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[20:39:35] [PASSED] ABGR8888 Valid buffer modifier
[20:39:35] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[20:39:35] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[20:39:35] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[20:39:35] [PASSED] NV12 Normal sizes
[20:39:35] [PASSED] NV12 Max sizes
[20:39:35] [PASSED] NV12 Invalid pitch
[20:39:35] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[20:39:35] [PASSED] NV12 different  modifier per-plane
[20:39:35] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[20:39:35] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[20:39:35] [PASSED] NV12 Modifier for inexistent plane
[20:39:35] [PASSED] NV12 Handle for inexistent plane
[20:39:35] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[20:39:35] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[20:39:35] [PASSED] YVU420 Normal sizes
[20:39:35] [PASSED] YVU420 Max sizes
[20:39:35] [PASSED] YVU420 Invalid pitch
[20:39:35] [PASSED] YVU420 Different pitches
[20:39:35] [PASSED] YVU420 Different buffer offsets/pitches
[20:39:35] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[20:39:35] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[20:39:35] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[20:39:35] [PASSED] YVU420 Valid modifier
[20:39:35] [PASSED] YVU420 Different modifiers per plane
[20:39:35] [PASSED] YVU420 Modifier for inexistent plane
[20:39:35] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[20:39:35] [PASSED] X0L2 Normal sizes
[20:39:35] [PASSED] X0L2 Max sizes
[20:39:35] [PASSED] X0L2 Invalid pitch
[20:39:35] [PASSED] X0L2 Pitch greater than minimum required
[20:39:35] [PASSED] X0L2 Handle for inexistent plane
[20:39:35] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[20:39:35] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[20:39:35] [PASSED] X0L2 Valid modifier
[20:39:35] [PASSED] X0L2 Modifier for inexistent plane
[20:39:35] =========== [PASSED] drm_test_framebuffer_create ===========
[20:39:35] [PASSED] drm_test_framebuffer_free
[20:39:35] [PASSED] drm_test_framebuffer_init
[20:39:35] [PASSED] drm_test_framebuffer_init_bad_format
[20:39:35] [PASSED] drm_test_framebuffer_init_dev_mismatch
[20:39:35] [PASSED] drm_test_framebuffer_lookup
[20:39:35] [PASSED] drm_test_framebuffer_lookup_inexistent
[20:39:35] [PASSED] drm_test_framebuffer_modifiers_not_supported
[20:39:35] ================= [PASSED] drm_framebuffer =================
[20:39:35] ================ drm_gem_shmem (8 subtests) ================
[20:39:35] [PASSED] drm_gem_shmem_test_obj_create
[20:39:35] [PASSED] drm_gem_shmem_test_obj_create_private
[20:39:35] [PASSED] drm_gem_shmem_test_pin_pages
[20:39:35] [PASSED] drm_gem_shmem_test_vmap
[20:39:35] [PASSED] drm_gem_shmem_test_get_sg_table
[20:39:35] [PASSED] drm_gem_shmem_test_get_pages_sgt
[20:39:35] [PASSED] drm_gem_shmem_test_madvise
[20:39:35] [PASSED] drm_gem_shmem_test_purge
[20:39:35] ================== [PASSED] drm_gem_shmem ==================
[20:39:35] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[20:39:35] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[20:39:35] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[20:39:35] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[20:39:35] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[20:39:35] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[20:39:35] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[20:39:35] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[20:39:35] [PASSED] Automatic
[20:39:35] [PASSED] Full
[20:39:35] [PASSED] Limited 16:235
[20:39:35] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[20:39:35] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[20:39:35] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[20:39:35] [PASSED] drm_test_check_disable_connector
[20:39:35] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[20:39:35] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[20:39:35] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[20:39:35] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[20:39:35] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[20:39:35] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[20:39:35] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[20:39:35] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[20:39:35] [PASSED] drm_test_check_output_bpc_dvi
[20:39:35] [PASSED] drm_test_check_output_bpc_format_vic_1
[20:39:35] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[20:39:35] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[20:39:35] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[20:39:35] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[20:39:35] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[20:39:35] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[20:39:35] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[20:39:35] ============ drm_test_check_hdmi_color_format  =============
[20:39:35] [PASSED] AUTO -> RGB
[20:39:35] [PASSED] YCBCR422 -> YUV422
[20:39:35] [PASSED] YCBCR420 -> YUV420
[20:39:35] [PASSED] YCBCR444 -> YUV444
[20:39:35] [PASSED] RGB -> RGB
[20:39:35] ======== [PASSED] drm_test_check_hdmi_color_format =========
[20:39:35] ======== drm_test_check_hdmi_color_format_420_only  ========
[20:39:35] [PASSED] RGB should fail
[20:39:35] [PASSED] YUV444 should fail
[20:39:35] [PASSED] YUV422 should fail
[20:39:35] [PASSED] YUV420 should work
[20:39:35] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[20:39:35] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[20:39:35] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[20:39:35] [PASSED] drm_test_check_broadcast_rgb_value
[20:39:35] [PASSED] drm_test_check_bpc_8_value
[20:39:35] [PASSED] drm_test_check_bpc_10_value
[20:39:35] [PASSED] drm_test_check_bpc_12_value
[20:39:35] [PASSED] drm_test_check_format_value
[20:39:35] [PASSED] drm_test_check_tmds_char_value
[20:39:35] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[20:39:35] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[20:39:35] [PASSED] drm_test_check_mode_valid
[20:39:35] [PASSED] drm_test_check_mode_valid_reject
[20:39:35] [PASSED] drm_test_check_mode_valid_reject_rate
[20:39:35] [PASSED] drm_test_check_mode_valid_reject_max_clock
[20:39:35] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[20:39:35] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[20:39:35] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[20:39:35] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[20:39:35] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[20:39:35] [PASSED] drm_test_check_infoframes
[20:39:35] [PASSED] drm_test_check_reject_avi_infoframe
[20:39:35] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[20:39:35] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[20:39:35] [PASSED] drm_test_check_reject_audio_infoframe
[20:39:35] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[20:39:35] ================= drm_managed (2 subtests) =================
[20:39:35] [PASSED] drm_test_managed_release_action
[20:39:35] [PASSED] drm_test_managed_run_action
[20:39:35] =================== [PASSED] drm_managed ===================
[20:39:35] =================== drm_mm (6 subtests) ====================
[20:39:35] [PASSED] drm_test_mm_init
[20:39:35] [PASSED] drm_test_mm_debug
[20:39:35] [PASSED] drm_test_mm_align32
[20:39:35] [PASSED] drm_test_mm_align64
[20:39:35] [PASSED] drm_test_mm_lowest
[20:39:35] [PASSED] drm_test_mm_highest
[20:39:35] ===================== [PASSED] drm_mm ======================
[20:39:35] ============= drm_modes_analog_tv (5 subtests) =============
[20:39:35] [PASSED] drm_test_modes_analog_tv_mono_576i
[20:39:35] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[20:39:35] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[20:39:35] [PASSED] drm_test_modes_analog_tv_pal_576i
[20:39:35] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[20:39:35] =============== [PASSED] drm_modes_analog_tv ===============
[20:39:35] ============== drm_panic_helper (3 subtests) ===============
[20:39:35] ============= drm_test_panic_screen_user_map  ==============
[20:39:35] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[20:39:35] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[20:39:35] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[20:39:35] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[20:39:35] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[20:39:35] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[20:39:35] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[20:39:35] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[20:39:35] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[20:39:35] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[20:39:35] ========= [PASSED] drm_test_panic_screen_user_map ==========
[20:39:35] ============= drm_test_panic_screen_user_page  =============
[20:39:35] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[20:39:35] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[20:39:35] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[20:39:35] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[20:39:35] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[20:39:35] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[20:39:35] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[20:39:35] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[20:39:35] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[20:39:35] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[20:39:35] ========= [PASSED] drm_test_panic_screen_user_page =========
[20:39:35] ========== drm_test_panic_screen_user_set_pixel  ===========
[20:39:35] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[20:39:35] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[20:39:35] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[20:39:35] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[20:39:35] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[20:39:35] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[20:39:35] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[20:39:35] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[20:39:35] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[20:39:35] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[20:39:35] ====== [PASSED] drm_test_panic_screen_user_set_pixel =======
[20:39:35] ================ [PASSED] drm_panic_helper =================
[20:39:35] ============== drm_plane_helper (2 subtests) ===============
[20:39:35] =============== drm_test_check_plane_state  ================
[20:39:35] [PASSED] clipping_simple
[20:39:35] [PASSED] clipping_rotate_reflect
[20:39:35] [PASSED] positioning_simple
[20:39:35] [PASSED] upscaling
[20:39:35] [PASSED] downscaling
[20:39:35] [PASSED] rounding1
[20:39:35] [PASSED] rounding2
[20:39:35] [PASSED] rounding3
[20:39:35] [PASSED] rounding4
[20:39:35] =========== [PASSED] drm_test_check_plane_state ============
[20:39:35] =========== drm_test_check_invalid_plane_state  ============
[20:39:35] [PASSED] positioning_invalid
[20:39:35] [PASSED] upscaling_invalid
[20:39:35] [PASSED] downscaling_invalid
[20:39:35] ======= [PASSED] drm_test_check_invalid_plane_state ========
[20:39:35] ================ [PASSED] drm_plane_helper =================
[20:39:35] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[20:39:35] ====== drm_test_connector_helper_tv_get_modes_check  =======
[20:39:35] [PASSED] None
[20:39:35] [PASSED] PAL
[20:39:35] [PASSED] NTSC
[20:39:35] [PASSED] Both, NTSC Default
[20:39:35] [PASSED] Both, PAL Default
[20:39:35] [PASSED] Both, NTSC Default, with PAL on command-line
[20:39:35] [PASSED] Both, PAL Default, with NTSC on command-line
[20:39:35] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[20:39:35] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[20:39:35] ================== drm_rect (9 subtests) ===================
[20:39:35] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[20:39:35] [PASSED] drm_test_rect_clip_scaled_not_clipped
[20:39:35] [PASSED] drm_test_rect_clip_scaled_clipped
[20:39:35] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[20:39:35] ================= drm_test_rect_intersect  =================
[20:39:35] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[20:39:35] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[20:39:35] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[20:39:35] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[20:39:35] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[20:39:35] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[20:39:35] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[20:39:35] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[20:39:35] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[20:39:35] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[20:39:35] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[20:39:35] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[20:39:35] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[20:39:35] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[20:39:35] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[20:39:35] ============= [PASSED] drm_test_rect_intersect =============
[20:39:35] ================ drm_test_rect_calc_hscale  ================
[20:39:35] [PASSED] normal use
[20:39:35] [PASSED] out of max range
[20:39:35] [PASSED] out of min range
[20:39:35] [PASSED] zero dst
[20:39:35] [PASSED] negative src
[20:39:35] [PASSED] negative dst
[20:39:35] ============ [PASSED] drm_test_rect_calc_hscale ============
[20:39:35] ================ drm_test_rect_calc_vscale  ================
[20:39:35] [PASSED] normal use
[20:39:35] [PASSED] out of max range
[20:39:35] [PASSED] out of min range
[20:39:35] [PASSED] zero dst
[20:39:35] [PASSED] negative src
[20:39:35] [PASSED] negative dst
[20:39:35] ============ [PASSED] drm_test_rect_calc_vscale ============
[20:39:35] ================== drm_test_rect_rotate  ===================
[20:39:35] [PASSED] reflect-x
[20:39:35] [PASSED] reflect-y
[20:39:35] [PASSED] rotate-0
[20:39:35] [PASSED] rotate-90
[20:39:35] [PASSED] rotate-180
[20:39:35] [PASSED] rotate-270
[20:39:35] ============== [PASSED] drm_test_rect_rotate ===============
[20:39:35] ================ drm_test_rect_rotate_inv  =================
[20:39:35] [PASSED] reflect-x
[20:39:35] [PASSED] reflect-y
[20:39:35] [PASSED] rotate-0
[20:39:35] [PASSED] rotate-90
[20:39:35] [PASSED] rotate-180
[20:39:35] [PASSED] rotate-270
[20:39:35] ============ [PASSED] drm_test_rect_rotate_inv =============
[20:39:35] ==================== [PASSED] drm_rect =====================
[20:39:35] ============ drm_sysfb_modeset_test (1 subtest) ============
[20:39:35] ============ drm_test_sysfb_build_fourcc_list  =============
[20:39:35] [PASSED] no native formats
[20:39:35] [PASSED] XRGB8888 as native format
[20:39:35] [PASSED] remove duplicates
[20:39:35] [PASSED] convert alpha formats
[20:39:35] [PASSED] random formats
[20:39:35] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[20:39:35] ============= [PASSED] drm_sysfb_modeset_test ==============
[20:39:35] ================== drm_fixp (2 subtests) ===================
[20:39:35] [PASSED] drm_test_int2fixp
[20:39:35] [PASSED] drm_test_sm2fixp
[20:39:35] ==================== [PASSED] drm_fixp =====================
[20:39:35] ============================================================
[20:39:35] Testing complete. Ran 667 tests: passed: 667
[20:39:35] Elapsed time: 27.418s total, 1.858s configuring, 25.144s building, 0.412s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[20:39:35] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:39:37] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[20:39:47] Starting KUnit Kernel (1/1)...
[20:39:47] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[20:39:47] ================= ttm_device (5 subtests) ==================
[20:39:47] [PASSED] ttm_device_init_basic
[20:39:47] [PASSED] ttm_device_init_multiple
[20:39:47] [PASSED] ttm_device_fini_basic
[20:39:47] [PASSED] ttm_device_init_no_vma_man
[20:39:47] ================== ttm_device_init_pools  ==================
[20:39:47] [PASSED] No DMA allocations, no DMA32 required
[20:39:47] [PASSED] DMA allocations, DMA32 required
[20:39:47] [PASSED] No DMA allocations, DMA32 required
[20:39:47] [PASSED] DMA allocations, no DMA32 required
[20:39:47] ============== [PASSED] ttm_device_init_pools ==============
[20:39:47] =================== [PASSED] ttm_device ====================
[20:39:47] ================== ttm_pool (8 subtests) ===================
[20:39:47] ================== ttm_pool_alloc_basic  ===================
[20:39:47] [PASSED] One page
[20:39:47] [PASSED] More than one page
[20:39:47] [PASSED] Above the allocation limit
[20:39:47] [PASSED] One page, with coherent DMA mappings enabled
[20:39:47] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[20:39:47] ============== [PASSED] ttm_pool_alloc_basic ===============
[20:39:47] ============== ttm_pool_alloc_basic_dma_addr  ==============
[20:39:47] [PASSED] One page
[20:39:47] [PASSED] More than one page
[20:39:47] [PASSED] Above the allocation limit
[20:39:47] [PASSED] One page, with coherent DMA mappings enabled
[20:39:47] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[20:39:47] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[20:39:47] [PASSED] ttm_pool_alloc_order_caching_match
[20:39:47] [PASSED] ttm_pool_alloc_caching_mismatch
[20:39:47] [PASSED] ttm_pool_alloc_order_mismatch
[20:39:47] [PASSED] ttm_pool_free_dma_alloc
[20:39:47] [PASSED] ttm_pool_free_no_dma_alloc
[20:39:47] [PASSED] ttm_pool_fini_basic
[20:39:47] ==================== [PASSED] ttm_pool =====================
[20:39:47] ================ ttm_resource (8 subtests) =================
[20:39:47] ================= ttm_resource_init_basic  =================
[20:39:47] [PASSED] Init resource in TTM_PL_SYSTEM
[20:39:47] [PASSED] Init resource in TTM_PL_VRAM
[20:39:47] [PASSED] Init resource in a private placement
[20:39:47] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[20:39:47] ============= [PASSED] ttm_resource_init_basic =============
[20:39:47] [PASSED] ttm_resource_init_pinned
[20:39:47] [PASSED] ttm_resource_fini_basic
[20:39:47] [PASSED] ttm_resource_manager_init_basic
[20:39:47] [PASSED] ttm_resource_manager_usage_basic
[20:39:47] [PASSED] ttm_resource_manager_set_used_basic
[20:39:47] [PASSED] ttm_sys_man_alloc_basic
[20:39:47] [PASSED] ttm_sys_man_free_basic
[20:39:47] ================== [PASSED] ttm_resource ===================
[20:39:47] =================== ttm_tt (15 subtests) ===================
[20:39:47] ==================== ttm_tt_init_basic  ====================
[20:39:47] [PASSED] Page-aligned size
[20:39:47] [PASSED] Extra pages requested
[20:39:47] ================ [PASSED] ttm_tt_init_basic ================
[20:39:47] [PASSED] ttm_tt_init_misaligned
[20:39:47] [PASSED] ttm_tt_fini_basic
[20:39:47] [PASSED] ttm_tt_fini_sg
[20:39:47] [PASSED] ttm_tt_fini_shmem
[20:39:47] [PASSED] ttm_tt_create_basic
[20:39:47] [PASSED] ttm_tt_create_invalid_bo_type
[20:39:47] [PASSED] ttm_tt_create_ttm_exists
[20:39:47] [PASSED] ttm_tt_create_failed
[20:39:47] [PASSED] ttm_tt_destroy_basic
[20:39:47] [PASSED] ttm_tt_populate_null_ttm
[20:39:47] [PASSED] ttm_tt_populate_populated_ttm
[20:39:47] [PASSED] ttm_tt_unpopulate_basic
[20:39:47] [PASSED] ttm_tt_unpopulate_empty_ttm
[20:39:47] [PASSED] ttm_tt_swapin_basic
[20:39:47] ===================== [PASSED] ttm_tt ======================
[20:39:47] =================== ttm_bo (14 subtests) ===================
[20:39:47] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[20:39:47] [PASSED] Cannot be interrupted and sleeps
[20:39:47] [PASSED] Cannot be interrupted, locks straight away
[20:39:47] [PASSED] Can be interrupted, sleeps
[20:39:47] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[20:39:47] [PASSED] ttm_bo_reserve_locked_no_sleep
[20:39:47] [PASSED] ttm_bo_reserve_no_wait_ticket
[20:39:47] [PASSED] ttm_bo_reserve_double_resv
[20:39:47] [PASSED] ttm_bo_reserve_interrupted
[20:39:47] [PASSED] ttm_bo_reserve_deadlock
[20:39:47] [PASSED] ttm_bo_unreserve_basic
[20:39:47] [PASSED] ttm_bo_unreserve_pinned
[20:39:47] [PASSED] ttm_bo_unreserve_bulk
[20:39:47] [PASSED] ttm_bo_fini_basic
[20:39:47] [PASSED] ttm_bo_fini_shared_resv
[20:39:47] [PASSED] ttm_bo_pin_basic
[20:39:47] [PASSED] ttm_bo_pin_unpin_resource
[20:39:47] [PASSED] ttm_bo_multiple_pin_one_unpin
[20:39:47] ===================== [PASSED] ttm_bo ======================
[20:39:47] ============== ttm_bo_validate (22 subtests) ===============
[20:39:47] ============== ttm_bo_init_reserved_sys_man  ===============
[20:39:47] [PASSED] Buffer object for userspace
[20:39:47] [PASSED] Kernel buffer object
[20:39:47] [PASSED] Shared buffer object
[20:39:47] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[20:39:47] ============== ttm_bo_init_reserved_mock_man  ==============
[20:39:47] [PASSED] Buffer object for userspace
[20:39:47] [PASSED] Kernel buffer object
[20:39:47] [PASSED] Shared buffer object
[20:39:47] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[20:39:47] [PASSED] ttm_bo_init_reserved_resv
[20:39:47] ================== ttm_bo_validate_basic  ==================
[20:39:47] [PASSED] Buffer object for userspace
[20:39:47] [PASSED] Kernel buffer object
[20:39:47] [PASSED] Shared buffer object
[20:39:47] ============== [PASSED] ttm_bo_validate_basic ==============
[20:39:47] [PASSED] ttm_bo_validate_invalid_placement
[20:39:47] ============= ttm_bo_validate_same_placement  ==============
[20:39:47] [PASSED] System manager
[20:39:47] [PASSED] VRAM manager
[20:39:47] ========= [PASSED] ttm_bo_validate_same_placement ==========
[20:39:47] [PASSED] ttm_bo_validate_failed_alloc
[20:39:47] [PASSED] ttm_bo_validate_pinned
[20:39:47] [PASSED] ttm_bo_validate_busy_placement
[20:39:47] ================ ttm_bo_validate_multihop  =================
[20:39:47] [PASSED] Buffer object for userspace
[20:39:47] [PASSED] Kernel buffer object
[20:39:47] [PASSED] Shared buffer object
[20:39:47] ============ [PASSED] ttm_bo_validate_multihop =============
[20:39:47] ========== ttm_bo_validate_no_placement_signaled  ==========
[20:39:47] [PASSED] Buffer object in system domain, no page vector
[20:39:47] [PASSED] Buffer object in system domain with an existing page vector
[20:39:47] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[20:39:47] ======== ttm_bo_validate_no_placement_not_signaled  ========
[20:39:47] [PASSED] Buffer object for userspace
[20:39:47] [PASSED] Kernel buffer object
[20:39:47] [PASSED] Shared buffer object
[20:39:47] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[20:39:47] [PASSED] ttm_bo_validate_move_fence_signaled
[20:39:47] ========= ttm_bo_validate_move_fence_not_signaled  =========
[20:39:47] [PASSED] Waits for GPU
[20:39:47] [PASSED] Tries to lock straight away
[20:39:47] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[20:39:47] [PASSED] ttm_bo_validate_swapout
[20:39:47] [PASSED] ttm_bo_validate_happy_evict
[20:39:47] [PASSED] ttm_bo_validate_all_pinned_evict
[20:39:47] [PASSED] ttm_bo_validate_allowed_only_evict
[20:39:47] [PASSED] ttm_bo_validate_deleted_evict
[20:39:47] [PASSED] ttm_bo_validate_busy_domain_evict
[20:39:47] [PASSED] ttm_bo_validate_evict_gutting
[20:39:47] [PASSED] ttm_bo_validate_recrusive_evict
[20:39:47] ================= [PASSED] ttm_bo_validate =================
[20:39:47] ============================================================
[20:39:47] Testing complete. Ran 102 tests: passed: 102
[20:39:47] Elapsed time: 12.203s total, 1.930s configuring, 10.008s building, 0.226s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/dma-buf/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[20:39:47] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:39:49] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[20:39:58] Starting KUnit Kernel (1/1)...
[20:39:58] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[20:39:58] =============== dma-buf-fence (12 subtests) ================
[20:39:58] [PASSED] test_sanitycheck
[20:39:58] [PASSED] test_signaling
[20:39:58] [PASSED] test_add_callback
[20:39:58] [PASSED] test_late_add_callback
[20:39:58] [PASSED] test_rm_callback
[20:39:58] [PASSED] test_late_rm_callback
[20:39:58] [PASSED] test_status
[20:39:58] [PASSED] test_error
[20:39:58] [PASSED] test_wait
[20:39:58] [PASSED] test_wait_timeout
[20:39:58] [PASSED] test_stub
[20:39:58] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[20:39:58] ================== [PASSED] dma-buf-fence ==================
[20:39:58] ============ dma-buf-fence-chain (11 subtests) =============
[20:39:58] [PASSED] test_sanitycheck
[20:39:58] [PASSED] test_find_seqno
[20:39:58] [PASSED] test_find_signaled
[20:39:58] [PASSED] test_find_out_of_order
[20:40:03] [PASSED] test_find_gap
[20:40:03] [PASSED] test_find_race
[20:40:03] [PASSED] test_signal_forward
[20:40:04] [PASSED] test_signal_backward
[20:40:04] [PASSED] test_wait_forward
[20:40:04] [PASSED] test_wait_backward
[20:40:04] [PASSED] test_wait_random
[20:40:04] =============== [PASSED] dma-buf-fence-chain ===============
[20:40:04] ============ dma-buf-fence-unwrap (11 subtests) ============
[20:40:04] [PASSED] test_sanitycheck
[20:40:04] [PASSED] test_unwrap_array
[20:40:04] [PASSED] test_unwrap_chain
[20:40:04] [PASSED] test_unwrap_chain_array
[20:40:04] [PASSED] test_unwrap_merge
[20:40:04] [PASSED] test_unwrap_merge_duplicate
[20:40:04] [PASSED] test_unwrap_merge_seqno
[20:40:04] [PASSED] test_unwrap_merge_order
[20:40:04] [PASSED] test_unwrap_merge_complex
[20:40:04] [PASSED] test_unwrap_merge_complex_seqno
[20:40:04] [PASSED] test_dedup_empty
[20:40:04] ============== [PASSED] dma-buf-fence-unwrap ===============
[20:40:04] ================ dma-buf-resv (5 subtests) =================
[20:40:04] [PASSED] test_sanitycheck
[20:40:04] ===================== test_signaling  ======================
[20:40:04] [PASSED] kernel
[20:40:04] [PASSED] write
[20:40:04] [PASSED] read
[20:40:04] [PASSED] bookkeep
[20:40:04] ================= [PASSED] test_signaling ==================
[20:40:04] ====================== test_for_each  ======================
[20:40:04] [PASSED] kernel
[20:40:04] [PASSED] write
[20:40:04] [PASSED] read
[20:40:04] [PASSED] bookkeep
[20:40:04] ================== [PASSED] test_for_each ==================
[20:40:04] ================= test_for_each_unlocked  ==================
[20:40:04] [PASSED] kernel
[20:40:04] [PASSED] write
[20:40:04] [PASSED] read
[20:40:04] [PASSED] bookkeep
[20:40:04] ============= [PASSED] test_for_each_unlocked ==============
[20:40:04] ===================== test_get_fences  =====================
[20:40:04] [PASSED] kernel
[20:40:04] [PASSED] write
[20:40:04] [PASSED] read
[20:40:04] [PASSED] bookkeep
[20:40:04] ================= [PASSED] test_get_fences =================
[20:40:04] ================== [PASSED] dma-buf-resv ===================
[20:40:04] ============================================================
[20:40:04] Testing complete. Ran 51 tests: passed: 50, skipped: 1
[20:40:04] Elapsed time: 16.161s total, 1.928s configuring, 8.860s building, 5.335s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


