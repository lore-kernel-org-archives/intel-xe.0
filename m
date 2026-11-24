Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CD5606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 00:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1825210F2B1;
	Tue, 24 Nov 2026 00:50:00 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080B010F2B1;
 Tue, 24 Nov 2026 00:49:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Crescent_Island_PMT_support_?=
 =?utf-8?q?=28rev23=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Nov 2026 00:49:59 -0000
Message-ID: <179548139902.73112.6603354355835790216@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
In-Reply-To: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
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

Series: Crescent Island PMT support (rev23)
URL   : https://patchwork.freedesktop.org/series/160717/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[00:48:04] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:48:09] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[00:48:30] Starting KUnit Kernel (1/1)...
[00:48:30] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[00:48:30] ================= gpu_buddy (15 subtests) ==================
[00:48:30] [PASSED] gpu_test_buddy_alloc_limit
[00:48:30] [PASSED] gpu_test_buddy_alloc_optimistic
[00:48:30] [PASSED] gpu_test_buddy_alloc_pessimistic
[00:48:30] [PASSED] gpu_test_buddy_alloc_pathological
[00:48:30] [PASSED] gpu_test_buddy_alloc_contiguous
[00:48:30] [PASSED] gpu_test_buddy_alloc_clear
[00:48:30] [PASSED] gpu_test_buddy_alloc_range
[00:48:30] [PASSED] gpu_test_buddy_alloc_range_bias
[00:48:30] [PASSED] gpu_test_buddy_alloc_range_clear_guard
[00:48:31] [PASSED] gpu_test_buddy_fragmentation_performance
[00:48:32] [PASSED] gpu_test_buddy_dirty_tracker_performance
[00:48:32] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[00:48:32] [PASSED] gpu_test_buddy_offset_aligned_allocation
[00:48:32] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[00:48:32] [PASSED] gpu_test_buddy_addr_to_block
[00:48:32] ==================== [PASSED] gpu_buddy ====================
[00:48:32] ============================================================
[00:48:32] Testing complete. Ran 15 tests: passed: 15
[00:48:32] Elapsed time: 27.753s total, 5.193s configuring, 20.543s building, 1.980s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[00:48:32] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:48:34] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[00:49:13] Starting KUnit Kernel (1/1)...
[00:49:13] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[00:49:13] ================= xe_ggtt_iov (9 subtests) =================
[00:49:13] [PASSED] init_shared_pf
[00:49:13] [PASSED] init_partial_overlap
[00:49:13] [PASSED] alloc_usable_pool_low
[00:49:13] [PASSED] alloc_shareable_pool_high
[00:49:13] [PASSED] alloc_partial_overlap
[00:49:13] [PASSED] alloc_partial_overlap_usable_full
[00:49:13] [PASSED] alloc_partial_overlap_shareable_full
[00:49:13] [PASSED] alloc_shareable_pool_unavailable
[00:49:13] [PASSED] alloc_shareable_pool_oversized
[00:49:13] =================== [PASSED] xe_ggtt_iov ===================
[00:49:13] =================== xe_ggtt (3 subtests) ===================
[00:49:13] [PASSED] init_native
[00:49:13] [PASSED] alloc_usable_pool_native
[00:49:13] [PASSED] alloc_usable_pool_oversized
[00:49:13] ===================== [PASSED] xe_ggtt =====================
[00:49:13] ================== guc_buf (11 subtests) ===================
[00:49:13] [PASSED] test_smallest
[00:49:13] [PASSED] test_largest
[00:49:13] [PASSED] test_granular
[00:49:13] [PASSED] test_unique
[00:49:13] [PASSED] test_overlap
[00:49:13] [PASSED] test_reusable
[00:49:13] [PASSED] test_too_big
[00:49:13] [PASSED] test_flush
[00:49:13] [PASSED] test_lookup
[00:49:13] [PASSED] test_data
[00:49:13] [PASSED] test_class
[00:49:13] ===================== [PASSED] guc_buf =====================
[00:49:13] =================== guc_dbm (7 subtests) ===================
[00:49:13] [PASSED] test_empty
[00:49:13] [PASSED] test_default
[00:49:13] ======================== test_size  ========================
[00:49:13] [PASSED] 4
[00:49:13] [PASSED] 8
[00:49:13] [PASSED] 32
[00:49:13] [PASSED] 256
[00:49:13] ==================== [PASSED] test_size ====================
[00:49:13] ======================= test_reuse  ========================
[00:49:13] [PASSED] 4
[00:49:13] [PASSED] 8
[00:49:13] [PASSED] 32
[00:49:13] [PASSED] 256
[00:49:13] =================== [PASSED] test_reuse ====================
[00:49:13] =================== test_range_overlap  ====================
[00:49:13] [PASSED] 4
[00:49:13] [PASSED] 8
[00:49:13] [PASSED] 32
[00:49:13] [PASSED] 256
[00:49:13] =============== [PASSED] test_range_overlap ================
[00:49:13] =================== test_range_compact  ====================
[00:49:13] [PASSED] 4
[00:49:13] [PASSED] 8
[00:49:13] [PASSED] 32
[00:49:13] [PASSED] 256
[00:49:13] =============== [PASSED] test_range_compact ================
[00:49:13] ==================== test_range_spare  =====================
[00:49:13] [PASSED] 4
[00:49:13] [PASSED] 8
[00:49:13] [PASSED] 32
[00:49:13] [PASSED] 256
[00:49:13] ================ [PASSED] test_range_spare =================
[00:49:13] ===================== [PASSED] guc_dbm =====================
[00:49:13] ================== guc_idm (22 subtests) ===================
[00:49:13] [PASSED] bad_init
[00:49:13] [PASSED] no_init
[00:49:13] [PASSED] init_fini
[00:49:13] [PASSED] check_init_small
[00:49:13] [PASSED] check_init_shared
[00:49:13] [PASSED] check_used
[00:49:13] [PASSED] check_quota
[00:49:13] [PASSED] check_all
[00:49:13] [PASSED] check_limits
[00:49:13] [PASSED] check_overlap
[00:49:13] [PASSED] check_overlap_alloc
[00:49:13] [PASSED] check_overlap_release
[00:49:13] [PASSED] check_overlap_partial_init
[00:49:13] [PASSED] check_overlap_partial_shared_range_blocking
[00:49:13] [PASSED] check_used_usable
[00:49:13] [PASSED] check_used_shareable
[00:49:13] [PASSED] check_used_mixed
[00:49:13] [PASSED] check_release_usable_range
[00:49:13] [PASSED] check_release_shareable_range
[00:49:13] [PASSED] check_split_boundaries
[00:49:13] [PASSED] check_shareable_spare
[00:49:13] [PASSED] check_shareable_spare_fragmented_tail
[00:49:13] ===================== [PASSED] guc_idm =====================
[00:49:13] ============== guc_klv_helpers (13 subtests) ===============
[00:49:13] [PASSED] test_count
[00:49:13] [PASSED] test_encode_u32
[00:49:13] [PASSED] test_encode_u64
[00:49:13] [PASSED] test_encode_string
[00:49:13] [PASSED] test_encode_object_raw
[00:49:13] [PASSED] test_encode_object_klv
[00:49:13] [PASSED] test_encode_object_nested
[00:49:13] [PASSED] test_encode_object_basic
[00:49:13] ===================== test_decode_u16  =====================
[00:49:13] [PASSED] empty
[00:49:13] [PASSED] valid
[00:49:13] [PASSED] max
[00:49:13] [PASSED] big
[00:49:13] [PASSED] long
[00:49:13] ================= [PASSED] test_decode_u16 =================
[00:49:13] ===================== test_decode_u32  =====================
[00:49:13] [PASSED] empty
[00:49:13] [PASSED] valid
[00:49:13] [PASSED] max
[00:49:13] [PASSED] long
[00:49:13] ================= [PASSED] test_decode_u32 =================
[00:49:13] ===================== test_decode_u64  =====================
[00:49:13] [PASSED] empty
[00:49:13] [PASSED] short
[00:49:13] [PASSED] valid
[00:49:13] [PASSED] max
[00:49:13] [PASSED] long
[00:49:13] ================= [PASSED] test_decode_u64 =================
[00:49:13] ===================== test_decode_str  =====================
[00:49:13] [PASSED] empty
[00:49:13] [PASSED] one
[00:49:13] [PASSED] one_trash
[00:49:13] [PASSED] two
[00:49:13] [PASSED] two_trash
[00:49:13] [PASSED] three
[00:49:13] [PASSED] dword
[00:49:13] [PASSED] four
[00:49:13] [PASSED] five
[00:49:13] [PASSED] six
[00:49:13] [PASSED] seven
[00:49:13] [PASSED] qword
[00:49:13] ================= [PASSED] test_decode_str =================
[00:49:13] [PASSED] test_print
[00:49:13] ================= [PASSED] guc_klv_helpers =================
[00:49:13] =================== xe_log (4 subtests) ====================
[00:49:13] [PASSED] demo_cper
[00:49:13] [PASSED] demo_dmesg
[00:49:13] ======================= test_dmesg  ========================
[00:49:13] [PASSED] test_fatal
[00:49:13] [PASSED] test_fatal_tile
[00:49:13] [PASSED] test_fatal_gt
[00:49:13] [PASSED] test_fatal_comp
[00:49:13] [PASSED] test_fatal_comp_tile
[00:49:13] [PASSED] test_fatal_comp_gt
[00:49:13] [PASSED] test_fatal_all
[00:49:13] [PASSED] test_recoverable
[00:49:13] [PASSED] test_recoverable_tile
[00:49:13] [PASSED] test_recoverable_gt
[00:49:13] [PASSED] test_recoverable_comp
[00:49:13] [PASSED] test_recoverable_comp_tile
[00:49:13] [PASSED] test_recoverable_comp_gt
[00:49:13] [PASSED] test_recoverable_all
[00:49:13] [PASSED] test_info
[00:49:13] [PASSED] test_info_tile
[00:49:13] [PASSED] test_info_gt
[00:49:13] [PASSED] test_info_err
[00:49:13] [PASSED] test_info_comp
[00:49:13] [PASSED] test_info_comp_tile
[00:49:13] [PASSED] test_info_comp_gt
[00:49:13] [PASSED] test_info_all
[00:49:13] [PASSED] test_hw_fatal
[00:49:13] [PASSED] test_hw_recoverable
[00:49:13] [PASSED] test_hw_corrected
[00:49:13] [PASSED] test_hw_informational
[00:49:13] =================== [PASSED] test_dmesg ====================
[00:49:13] ====================== test_invalid  =======================
[00:49:13] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[00:49:13] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[00:49:13] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[00:49:13] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[00:49:13] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[00:49:13] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[00:49:13] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[00:49:13] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[00:49:13] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[00:49:13] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[00:49:13] ================== [SKIPPED] test_invalid ==================
[00:49:13] ===================== [PASSED] xe_log ======================
[00:49:13] ================== no_relay (3 subtests) ===================
[00:49:13] [PASSED] xe_drops_guc2pf_if_not_ready
[00:49:13] [PASSED] xe_drops_guc2vf_if_not_ready
[00:49:13] [PASSED] xe_rejects_send_if_not_ready
[00:49:13] ==================== [PASSED] no_relay =====================
[00:49:13] ================== pf_relay (14 subtests) ==================
[00:49:13] [PASSED] pf_rejects_guc2pf_too_short
[00:49:13] [PASSED] pf_rejects_guc2pf_too_long
[00:49:13] [PASSED] pf_rejects_guc2pf_no_payload
[00:49:13] [PASSED] pf_fails_no_payload
[00:49:13] [PASSED] pf_fails_bad_origin
[00:49:13] [PASSED] pf_fails_bad_type
[00:49:13] [PASSED] pf_txn_reports_error
[00:49:13] [PASSED] pf_txn_sends_pf2guc
[00:49:13] [PASSED] pf_sends_pf2guc
[00:49:13] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[00:49:13] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[00:49:13] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[00:49:13] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[00:49:13] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[00:49:13] ==================== [PASSED] pf_relay =====================
[00:49:13] ================== vf_relay (3 subtests) ===================
[00:49:13] [PASSED] vf_rejects_guc2vf_too_short
[00:49:13] [PASSED] vf_rejects_guc2vf_too_long
[00:49:13] [PASSED] vf_rejects_guc2vf_no_payload
[00:49:13] ==================== [PASSED] vf_relay =====================
[00:49:13] ================ pf_gt_config (9 subtests) =================
[00:49:13] [PASSED] fair_contexts_1vf
[00:49:13] [PASSED] fair_doorbells_1vf
[00:49:13] [PASSED] fair_ggtt_1vf
[00:49:13] ====================== fair_vram_1vf  ======================
[00:49:13] [PASSED] 3.50 GiB
[00:49:13] [PASSED] 11.5 GiB
[00:49:13] [PASSED] 15.5 GiB
[00:49:13] [PASSED] 31.5 GiB
[00:49:13] [PASSED] 63.5 GiB
[00:49:13] [PASSED] 1.91 GiB
[00:49:13] ================== [PASSED] fair_vram_1vf ==================
[00:49:13] ================ fair_vram_1vf_admin_only  =================
[00:49:13] [PASSED] 3.50 GiB
[00:49:13] [PASSED] 11.5 GiB
[00:49:13] [PASSED] 15.5 GiB
[00:49:13] [PASSED] 31.5 GiB
[00:49:13] [PASSED] 63.5 GiB
[00:49:13] [PASSED] 1.91 GiB
[00:49:13] ============ [PASSED] fair_vram_1vf_admin_only =============
[00:49:13] ====================== fair_contexts  ======================
[00:49:13] [PASSED] 1 VF
[00:49:13] [PASSED] 2 VFs
[00:49:13] [PASSED] 3 VFs
[00:49:13] [PASSED] 4 VFs
[00:49:13] [PASSED] 5 VFs
[00:49:13] [PASSED] 6 VFs
[00:49:13] [PASSED] 7 VFs
[00:49:13] [PASSED] 8 VFs
[00:49:13] [PASSED] 9 VFs
[00:49:13] [PASSED] 10 VFs
[00:49:13] [PASSED] 11 VFs
[00:49:13] [PASSED] 12 VFs
[00:49:13] [PASSED] 13 VFs
[00:49:13] [PASSED] 14 VFs
[00:49:13] [PASSED] 15 VFs
[00:49:13] [PASSED] 16 VFs
[00:49:13] [PASSED] 17 VFs
[00:49:13] [PASSED] 18 VFs
[00:49:13] [PASSED] 19 VFs
[00:49:13] [PASSED] 20 VFs
[00:49:13] [PASSED] 21 VFs
[00:49:13] [PASSED] 22 VFs
[00:49:13] [PASSED] 23 VFs
[00:49:13] [PASSED] 24 VFs
[00:49:13] [PASSED] 25 VFs
[00:49:13] [PASSED] 26 VFs
[00:49:13] [PASSED] 27 VFs
[00:49:13] [PASSED] 28 VFs
[00:49:13] [PASSED] 29 VFs
[00:49:13] [PASSED] 30 VFs
[00:49:13] [PASSED] 31 VFs
[00:49:13] [PASSED] 32 VFs
[00:49:13] [PASSED] 33 VFs
[00:49:13] [PASSED] 34 VFs
[00:49:13] [PASSED] 35 VFs
[00:49:13] [PASSED] 36 VFs
[00:49:13] [PASSED] 37 VFs
[00:49:13] [PASSED] 38 VFs
[00:49:13] [PASSED] 39 VFs
[00:49:13] [PASSED] 40 VFs
[00:49:13] [PASSED] 41 VFs
[00:49:13] [PASSED] 42 VFs
[00:49:13] [PASSED] 43 VFs
[00:49:13] [PASSED] 44 VFs
[00:49:13] [PASSED] 45 VFs
[00:49:13] [PASSED] 46 VFs
[00:49:13] [PASSED] 47 VFs
[00:49:13] [PASSED] 48 VFs
[00:49:13] [PASSED] 49 VFs
[00:49:13] [PASSED] 50 VFs
[00:49:13] [PASSED] 51 VFs
[00:49:13] [PASSED] 52 VFs
[00:49:13] [PASSED] 53 VFs
[00:49:13] [PASSED] 54 VFs
[00:49:13] [PASSED] 55 VFs
[00:49:13] [PASSED] 56 VFs
[00:49:13] [PASSED] 57 VFs
[00:49:13] [PASSED] 58 VFs
[00:49:13] [PASSED] 59 VFs
[00:49:13] [PASSED] 60 VFs
[00:49:13] [PASSED] 61 VFs
[00:49:13] [PASSED] 62 VFs
[00:49:13] [PASSED] 63 VFs
[00:49:13] ================== [PASSED] fair_contexts ==================
[00:49:13] ===================== fair_doorbells  ======================
[00:49:13] [PASSED] 1 VF
[00:49:13] [PASSED] 2 VFs
[00:49:13] [PASSED] 3 VFs
[00:49:13] [PASSED] 4 VFs
[00:49:13] [PASSED] 5 VFs
[00:49:13] [PASSED] 6 VFs
[00:49:13] [PASSED] 7 VFs
[00:49:13] [PASSED] 8 VFs
[00:49:13] [PASSED] 9 VFs
[00:49:13] [PASSED] 10 VFs
[00:49:13] [PASSED] 11 VFs
[00:49:13] [PASSED] 12 VFs
[00:49:13] [PASSED] 13 VFs
[00:49:13] [PASSED] 14 VFs
[00:49:13] [PASSED] 15 VFs
[00:49:13] [PASSED] 16 VFs
[00:49:13] [PASSED] 17 VFs
[00:49:13] [PASSED] 18 VFs
[00:49:13] [PASSED] 19 VFs
[00:49:13] [PASSED] 20 VFs
[00:49:13] [PASSED] 21 VFs
[00:49:13] [PASSED] 22 VFs
[00:49:13] [PASSED] 23 VFs
[00:49:13] [PASSED] 24 VFs
[00:49:13] [PASSED] 25 VFs
[00:49:13] [PASSED] 26 VFs
[00:49:13] [PASSED] 27 VFs
[00:49:13] [PASSED] 28 VFs
[00:49:13] [PASSED] 29 VFs
[00:49:13] [PASSED] 30 VFs
[00:49:13] [PASSED] 31 VFs
[00:49:13] [PASSED] 32 VFs
[00:49:13] [PASSED] 33 VFs
[00:49:13] [PASSED] 34 VFs
[00:49:13] [PASSED] 35 VFs
[00:49:13] [PASSED] 36 VFs
[00:49:13] [PASSED] 37 VFs
[00:49:13] [PASSED] 38 VFs
[00:49:13] [PASSED] 39 VFs
[00:49:13] [PASSED] 40 VFs
[00:49:13] [PASSED] 41 VFs
[00:49:13] [PASSED] 42 VFs
[00:49:13] [PASSED] 43 VFs
[00:49:13] [PASSED] 44 VFs
[00:49:13] [PASSED] 45 VFs
[00:49:13] [PASSED] 46 VFs
[00:49:13] [PASSED] 47 VFs
[00:49:13] [PASSED] 48 VFs
[00:49:13] [PASSED] 49 VFs
[00:49:13] [PASSED] 50 VFs
[00:49:13] [PASSED] 51 VFs
[00:49:13] [PASSED] 52 VFs
[00:49:13] [PASSED] 53 VFs
[00:49:13] [PASSED] 54 VFs
[00:49:13] [PASSED] 55 VFs
[00:49:13] [PASSED] 56 VFs
[00:49:13] [PASSED] 57 VFs
[00:49:13] [PASSED] 58 VFs
[00:49:13] [PASSED] 59 VFs
[00:49:13] [PASSED] 60 VFs
[00:49:13] [PASSED] 61 VFs
[00:49:13] [PASSED] 62 VFs
[00:49:13] [PASSED] 63 VFs
[00:49:13] ================= [PASSED] fair_doorbells ==================
[00:49:13] ======================== fair_ggtt  ========================
[00:49:13] [PASSED] 1 VF
[00:49:13] [PASSED] 2 VFs
[00:49:13] [PASSED] 3 VFs
[00:49:13] [PASSED] 4 VFs
[00:49:13] [PASSED] 5 VFs
[00:49:13] [PASSED] 6 VFs
[00:49:13] [PASSED] 7 VFs
[00:49:13] [PASSED] 8 VFs
[00:49:13] [PASSED] 9 VFs
[00:49:13] [PASSED] 10 VFs
[00:49:13] [PASSED] 11 VFs
[00:49:13] [PASSED] 12 VFs
[00:49:13] [PASSED] 13 VFs
[00:49:13] [PASSED] 14 VFs
[00:49:13] [PASSED] 15 VFs
[00:49:13] [PASSED] 16 VFs
[00:49:13] [PASSED] 17 VFs
[00:49:13] [PASSED] 18 VFs
[00:49:13] [PASSED] 19 VFs
[00:49:13] [PASSED] 20 VFs
[00:49:13] [PASSED] 21 VFs
[00:49:13] [PASSED] 22 VFs
[00:49:13] [PASSED] 23 VFs
[00:49:13] [PASSED] 24 VFs
[00:49:13] [PASSED] 25 VFs
[00:49:13] [PASSED] 26 VFs
[00:49:13] [PASSED] 27 VFs
[00:49:13] [PASSED] 28 VFs
[00:49:13] [PASSED] 29 VFs
[00:49:13] [PASSED] 30 VFs
[00:49:13] [PASSED] 31 VFs
[00:49:13] [PASSED] 32 VFs
[00:49:13] [PASSED] 33 VFs
[00:49:13] [PASSED] 34 VFs
[00:49:13] [PASSED] 35 VFs
[00:49:13] [PASSED] 36 VFs
[00:49:13] [PASSED] 37 VFs
[00:49:13] [PASSED] 38 VFs
[00:49:13] [PASSED] 39 VFs
[00:49:13] [PASSED] 40 VFs
[00:49:13] [PASSED] 41 VFs
[00:49:13] [PASSED] 42 VFs
[00:49:13] [PASSED] 43 VFs
[00:49:13] [PASSED] 44 VFs
[00:49:13] [PASSED] 45 VFs
[00:49:13] [PASSED] 46 VFs
[00:49:13] [PASSED] 47 VFs
[00:49:13] [PASSED] 48 VFs
[00:49:13] [PASSED] 49 VFs
[00:49:13] [PASSED] 50 VFs
[00:49:13] [PASSED] 51 VFs
[00:49:13] [PASSED] 52 VFs
[00:49:13] [PASSED] 53 VFs
[00:49:13] [PASSED] 54 VFs
[00:49:13] [PASSED] 55 VFs
[00:49:13] [PASSED] 56 VFs
[00:49:13] [PASSED] 57 VFs
[00:49:13] [PASSED] 58 VFs
[00:49:13] [PASSED] 59 VFs
[00:49:13] [PASSED] 60 VFs
[00:49:13] [PASSED] 61 VFs
[00:49:13] [PASSED] 62 VFs
[00:49:13] [PASSED] 63 VFs
[00:49:13] ==================== [PASSED] fair_ggtt ====================
[00:49:13] ======================== fair_vram  ========================
[00:49:13] [PASSED] 1 VF
[00:49:13] [PASSED] 2 VFs
[00:49:13] [PASSED] 3 VFs
[00:49:13] [PASSED] 4 VFs
[00:49:13] [PASSED] 5 VFs
[00:49:13] [PASSED] 6 VFs
[00:49:13] [PASSED] 7 VFs
[00:49:14] [PASSED] 8 VFs
[00:49:14] [PASSED] 9 VFs
[00:49:14] [PASSED] 10 VFs
[00:49:14] [PASSED] 11 VFs
[00:49:14] [PASSED] 12 VFs
[00:49:14] [PASSED] 13 VFs
[00:49:14] [PASSED] 14 VFs
[00:49:14] [PASSED] 15 VFs
[00:49:14] [PASSED] 16 VFs
[00:49:14] [PASSED] 17 VFs
[00:49:14] [PASSED] 18 VFs
[00:49:14] [PASSED] 19 VFs
[00:49:14] [PASSED] 20 VFs
[00:49:14] [PASSED] 21 VFs
[00:49:14] [PASSED] 22 VFs
[00:49:14] [PASSED] 23 VFs
[00:49:14] [PASSED] 24 VFs
[00:49:14] [PASSED] 25 VFs
[00:49:14] [PASSED] 26 VFs
[00:49:14] [PASSED] 27 VFs
[00:49:14] [PASSED] 28 VFs
[00:49:14] [PASSED] 29 VFs
[00:49:14] [PASSED] 30 VFs
[00:49:14] [PASSED] 31 VFs
[00:49:14] [PASSED] 32 VFs
[00:49:14] [PASSED] 33 VFs
[00:49:14] [PASSED] 34 VFs
[00:49:14] [PASSED] 35 VFs
[00:49:14] [PASSED] 36 VFs
[00:49:14] [PASSED] 37 VFs
[00:49:14] [PASSED] 38 VFs
[00:49:14] [PASSED] 39 VFs
[00:49:14] [PASSED] 40 VFs
[00:49:14] [PASSED] 41 VFs
[00:49:14] [PASSED] 42 VFs
[00:49:14] [PASSED] 43 VFs
[00:49:14] [PASSED] 44 VFs
[00:49:14] [PASSED] 45 VFs
[00:49:14] [PASSED] 46 VFs
[00:49:14] [PASSED] 47 VFs
[00:49:14] [PASSED] 48 VFs
[00:49:14] [PASSED] 49 VFs
[00:49:14] [PASSED] 50 VFs
[00:49:14] [PASSED] 51 VFs
[00:49:14] [PASSED] 52 VFs
[00:49:14] [PASSED] 53 VFs
[00:49:14] [PASSED] 54 VFs
[00:49:14] [PASSED] 55 VFs
[00:49:14] [PASSED] 56 VFs
[00:49:14] [PASSED] 57 VFs
[00:49:14] [PASSED] 58 VFs
[00:49:14] [PASSED] 59 VFs
[00:49:14] [PASSED] 60 VFs
[00:49:14] [PASSED] 61 VFs
[00:49:14] [PASSED] 62 VFs
[00:49:14] [PASSED] 63 VFs
[00:49:14] ==================== [PASSED] fair_vram ====================
[00:49:14] ================== [PASSED] pf_gt_config ===================
[00:49:14] ===================== lmtt (1 subtest) =====================
[00:49:14] ======================== test_ops  =========================
[00:49:14] [PASSED] 2-level
[00:49:14] [PASSED] multi-level
[00:49:14] ==================== [PASSED] test_ops =====================
[00:49:14] ====================== [PASSED] lmtt =======================
[00:49:14] ================= sriov_packet (1 subtest) =================
[00:49:14] [PASSED] test_descriptor_init
[00:49:14] ================== [PASSED] sriov_packet ===================
[00:49:14] ================= pf_service (11 subtests) =================
[00:49:14] [PASSED] pf_negotiate_any
[00:49:14] [PASSED] pf_negotiate_base_match
[00:49:14] [PASSED] pf_negotiate_base_newer
[00:49:14] [PASSED] pf_negotiate_base_next
[00:49:14] [SKIPPED] pf_negotiate_base_older (no older minor)
[00:49:14] [PASSED] pf_negotiate_base_prev
[00:49:14] [PASSED] pf_negotiate_latest_match
[00:49:14] [PASSED] pf_negotiate_latest_newer
[00:49:14] [PASSED] pf_negotiate_latest_next
[00:49:14] [SKIPPED] pf_negotiate_latest_older (no older minor)
[00:49:14] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[00:49:14] =================== [PASSED] pf_service ====================
[00:49:14] ================= xe_guc_g2g (2 subtests) ==================
[00:49:14] ============== xe_live_guc_g2g_kunit_default  ==============
[00:49:14] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[00:49:14] ============== xe_live_guc_g2g_kunit_allmem  ===============
[00:49:14] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[00:49:14] =================== [SKIPPED] xe_guc_g2g ===================
[00:49:14] =================== xe_mocs (2 subtests) ===================
[00:49:14] ================ xe_live_mocs_kernel_kunit  ================
[00:49:14] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[00:49:14] ================ xe_live_mocs_reset_kunit  =================
[00:49:14] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[00:49:14] ==================== [SKIPPED] xe_mocs =====================
[00:49:14] ================= xe_migrate (3 subtests) ==================
[00:49:14] ================= xe_migrate_sanity_kunit  =================
[00:49:14] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[00:49:14] ================== xe_validate_ccs_kunit  ==================
[00:49:14] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[00:49:14] ============= xe_migrate_access_memory_kunit  ==============
[00:49:14] ========= [SKIPPED] xe_migrate_access_memory_kunit =========
[00:49:14] =================== [SKIPPED] xe_migrate ===================
[00:49:14] ================== xe_dma_buf (1 subtest) ==================
[00:49:14] ==================== xe_dma_buf_kunit  =====================
[00:49:14] ================ [SKIPPED] xe_dma_buf_kunit ================
[00:49:14] =================== [SKIPPED] xe_dma_buf ===================
[00:49:14] ================= xe_bo_shrink (1 subtest) =================
[00:49:14] =================== xe_bo_shrink_kunit  ====================
[00:49:14] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[00:49:14] ================== [SKIPPED] xe_bo_shrink ==================
[00:49:14] ==================== xe_bo (2 subtests) ====================
[00:49:14] ================== xe_ccs_migrate_kunit  ===================
[00:49:14] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[00:49:14] ==================== xe_bo_evict_kunit  ====================
[00:49:14] =============== [SKIPPED] xe_bo_evict_kunit ================
[00:49:14] ===================== [SKIPPED] xe_bo ======================
[00:49:14] =================== xe_any (9 subtests) ====================
[00:49:14] [PASSED] test_to_xe
[00:49:14] [PASSED] test_to_dev
[00:49:14] [PASSED] test_to_pdev
[00:49:14] [PASSED] test_to_drm
[00:49:14] [PASSED] test_if_pdev
[00:49:14] [PASSED] test_if_xe
[00:49:14] [PASSED] test_if_tile
[00:49:14] [PASSED] test_if_gt
[00:49:14] [PASSED] test_to_id
[00:49:14] ===================== [PASSED] xe_any ======================
[00:49:14] ==================== args (13 subtests) ====================
[00:49:14] [PASSED] count_args_test
[00:49:14] [PASSED] call_args_example
[00:49:14] [PASSED] call_args_test
[00:49:14] [PASSED] drop_first_arg_example
[00:49:14] [PASSED] drop_first_arg_test
[00:49:14] [PASSED] first_arg_example
[00:49:14] [PASSED] first_arg_test
[00:49:14] [PASSED] last_arg_example
[00:49:14] [PASSED] last_arg_test
[00:49:14] [PASSED] pick_arg_example
[00:49:14] [PASSED] if_args_example
[00:49:14] [PASSED] if_args_test
[00:49:14] [PASSED] sep_comma_example
[00:49:14] ====================== [PASSED] args =======================
[00:49:14] =================== xe_pci (3 subtests) ====================
[00:49:14] ==================== check_graphics_ip  ====================
[00:49:14] [PASSED] 12.00 Xe_LP
[00:49:14] [PASSED] 12.10 Xe_LP+
[00:49:14] [PASSED] 12.55 Xe_HPG
[00:49:14] [PASSED] 12.60 Xe_HPC
[00:49:14] [PASSED] 12.70 Xe_LPG
[00:49:14] [PASSED] 12.71 Xe_LPG
[00:49:14] [PASSED] 12.74 Xe_LPG+
[00:49:14] [PASSED] 20.01 Xe2_HPG
[00:49:14] [PASSED] 20.02 Xe2_HPG
[00:49:14] [PASSED] 20.04 Xe2_LPG
[00:49:14] [PASSED] 30.00 Xe3_LPG
[00:49:14] [PASSED] 30.01 Xe3_LPG
[00:49:14] [PASSED] 30.03 Xe3_LPG
[00:49:14] [PASSED] 30.04 Xe3_LPG
[00:49:14] [PASSED] 30.05 Xe3_LPG
[00:49:14] [PASSED] 35.10 Xe3p_LPG
[00:49:14] [PASSED] 35.11 Xe3p_XPC
[00:49:14] ================ [PASSED] check_graphics_ip ================
[00:49:14] ===================== check_media_ip  ======================
[00:49:14] [PASSED] 12.00 Xe_M
[00:49:14] [PASSED] 12.55 Xe_HPM
[00:49:14] [PASSED] 13.00 Xe_LPM+
[00:49:14] [PASSED] 13.01 Xe2_HPM
[00:49:14] [PASSED] 20.00 Xe2_LPM
[00:49:14] [PASSED] 30.00 Xe3_LPM
[00:49:14] [PASSED] 30.02 Xe3_LPM
[00:49:14] [PASSED] 35.00 Xe3p_LPM
[00:49:14] [PASSED] 35.03 Xe3p_HPM
[00:49:14] ================= [PASSED] check_media_ip ==================
[00:49:14] =================== check_platform_desc  ===================
[00:49:14] [PASSED] 0x9A60 (TIGERLAKE)
[00:49:14] [PASSED] 0x9A68 (TIGERLAKE)
[00:49:14] [PASSED] 0x9A70 (TIGERLAKE)
[00:49:14] [PASSED] 0x9A40 (TIGERLAKE)
[00:49:14] [PASSED] 0x9A49 (TIGERLAKE)
[00:49:14] [PASSED] 0x9A59 (TIGERLAKE)
[00:49:14] [PASSED] 0x9A78 (TIGERLAKE)
[00:49:14] [PASSED] 0x9AC0 (TIGERLAKE)
[00:49:14] [PASSED] 0x9AC9 (TIGERLAKE)
[00:49:14] [PASSED] 0x9AD9 (TIGERLAKE)
[00:49:14] [PASSED] 0x9AF8 (TIGERLAKE)
[00:49:14] [PASSED] 0x4C80 (ROCKETLAKE)
[00:49:14] [PASSED] 0x4C8A (ROCKETLAKE)
[00:49:14] [PASSED] 0x4C8B (ROCKETLAKE)
[00:49:14] [PASSED] 0x4C8C (ROCKETLAKE)
[00:49:14] [PASSED] 0x4C90 (ROCKETLAKE)
[00:49:14] [PASSED] 0x4C9A (ROCKETLAKE)
[00:49:14] [PASSED] 0x4680 (ALDERLAKE_S)
[00:49:14] [PASSED] 0x4682 (ALDERLAKE_S)
[00:49:14] [PASSED] 0x4688 (ALDERLAKE_S)
[00:49:14] [PASSED] 0x468A (ALDERLAKE_S)
[00:49:14] [PASSED] 0x468B (ALDERLAKE_S)
[00:49:14] [PASSED] 0x4690 (ALDERLAKE_S)
[00:49:14] [PASSED] 0x4692 (ALDERLAKE_S)
[00:49:14] [PASSED] 0x4693 (ALDERLAKE_S)
[00:49:14] [PASSED] 0x46A0 (ALDERLAKE_P)
[00:49:14] [PASSED] 0x46A1 (ALDERLAKE_P)
[00:49:14] [PASSED] 0x46A2 (ALDERLAKE_P)
[00:49:14] [PASSED] 0x46A3 (ALDERLAKE_P)
[00:49:14] [PASSED] 0x46A6 (ALDERLAKE_P)
[00:49:14] [PASSED] 0x46A8 (ALDERLAKE_P)
[00:49:14] [PASSED] 0x46AA (ALDERLAKE_P)
[00:49:14] [PASSED] 0x462A (ALDERLAKE_P)
[00:49:14] [PASSED] 0x4626 (ALDERLAKE_P)
[00:49:14] [PASSED] 0x4628 (ALDERLAKE_P)
[00:49:14] [PASSED] 0x46B0 (ALDERLAKE_P)
[00:49:14] [PASSED] 0x46B1 (ALDERLAKE_P)
[00:49:14] [PASSED] 0x46B2 (ALDERLAKE_P)
[00:49:14] [PASSED] 0x46B3 (ALDERLAKE_P)
[00:49:14] [PASSED] 0x46C0 (ALDERLAKE_P)
[00:49:14] [PASSED] 0x46C1 (ALDERLAKE_P)
[00:49:14] [PASSED] 0x46C2 (ALDERLAKE_P)
[00:49:14] [PASSED] 0x46C3 (ALDERLAKE_P)
[00:49:14] [PASSED] 0x46D0 (ALDERLAKE_N)
[00:49:14] [PASSED] 0x46D1 (ALDERLAKE_N)
[00:49:14] [PASSED] 0x46D2 (ALDERLAKE_N)
[00:49:14] [PASSED] 0x46D3 (ALDERLAKE_N)
[00:49:14] [PASSED] 0x46D4 (ALDERLAKE_N)
[00:49:14] [PASSED] 0xA721 (ALDERLAKE_P)
[00:49:14] [PASSED] 0xA7A1 (ALDERLAKE_P)
[00:49:14] [PASSED] 0xA7A9 (ALDERLAKE_P)
[00:49:14] [PASSED] 0xA7AC (ALDERLAKE_P)
[00:49:14] [PASSED] 0xA7AD (ALDERLAKE_P)
[00:49:14] [PASSED] 0xA720 (ALDERLAKE_P)
[00:49:14] [PASSED] 0xA7A0 (ALDERLAKE_P)
[00:49:14] [PASSED] 0xA7A8 (ALDERLAKE_P)
[00:49:14] [PASSED] 0xA7AA (ALDERLAKE_P)
[00:49:14] [PASSED] 0xA7AB (ALDERLAKE_P)
[00:49:14] [PASSED] 0xA780 (ALDERLAKE_S)
[00:49:14] [PASSED] 0xA781 (ALDERLAKE_S)
[00:49:14] [PASSED] 0xA782 (ALDERLAKE_S)
[00:49:14] [PASSED] 0xA783 (ALDERLAKE_S)
[00:49:14] [PASSED] 0xA788 (ALDERLAKE_S)
[00:49:14] [PASSED] 0xA789 (ALDERLAKE_S)
[00:49:14] [PASSED] 0xA78A (ALDERLAKE_S)
[00:49:14] [PASSED] 0xA78B (ALDERLAKE_S)
[00:49:14] [PASSED] 0x4905 (DG1)
[00:49:14] [PASSED] 0x4906 (DG1)
[00:49:14] [PASSED] 0x4907 (DG1)
[00:49:14] [PASSED] 0x4908 (DG1)
[00:49:14] [PASSED] 0x4909 (DG1)
[00:49:14] [PASSED] 0x56C0 (DG2)
[00:49:14] [PASSED] 0x56C2 (DG2)
[00:49:14] [PASSED] 0x56C1 (DG2)
[00:49:14] [PASSED] 0x7D51 (METEORLAKE)
[00:49:14] [PASSED] 0x7DD1 (METEORLAKE)
[00:49:14] [PASSED] 0x7D41 (METEORLAKE)
[00:49:14] [PASSED] 0x7D67 (METEORLAKE)
[00:49:14] [PASSED] 0xB640 (METEORLAKE)
[00:49:14] [PASSED] 0x56A0 (DG2)
[00:49:14] [PASSED] 0x56A1 (DG2)
[00:49:14] [PASSED] 0x56A2 (DG2)
[00:49:14] [PASSED] 0x56BE (DG2)
[00:49:14] [PASSED] 0x56BF (DG2)
[00:49:14] [PASSED] 0x5690 (DG2)
[00:49:14] [PASSED] 0x5691 (DG2)
[00:49:14] [PASSED] 0x5692 (DG2)
[00:49:14] [PASSED] 0x56A5 (DG2)
[00:49:14] [PASSED] 0x56A6 (DG2)
[00:49:14] [PASSED] 0x56B0 (DG2)
[00:49:14] [PASSED] 0x56B1 (DG2)
[00:49:14] [PASSED] 0x56BA (DG2)
[00:49:14] [PASSED] 0x56BB (DG2)
[00:49:14] [PASSED] 0x56BC (DG2)
[00:49:14] [PASSED] 0x56BD (DG2)
[00:49:14] [PASSED] 0x5693 (DG2)
[00:49:14] [PASSED] 0x5694 (DG2)
[00:49:14] [PASSED] 0x5695 (DG2)
[00:49:14] [PASSED] 0x56A3 (DG2)
[00:49:14] [PASSED] 0x56A4 (DG2)
[00:49:14] [PASSED] 0x56B2 (DG2)
[00:49:14] [PASSED] 0x56B3 (DG2)
[00:49:14] [PASSED] 0x5696 (DG2)
[00:49:14] [PASSED] 0x5697 (DG2)
[00:49:14] [PASSED] 0xB69 (PVC)
[00:49:14] [PASSED] 0xB6E (PVC)
[00:49:14] [PASSED] 0xBD4 (PVC)
[00:49:14] [PASSED] 0xBD5 (PVC)
[00:49:14] [PASSED] 0xBD6 (PVC)
[00:49:14] [PASSED] 0xBD7 (PVC)
[00:49:14] [PASSED] 0xBD8 (PVC)
[00:49:14] [PASSED] 0xBD9 (PVC)
[00:49:14] [PASSED] 0xBDA (PVC)
[00:49:14] [PASSED] 0xBDB (PVC)
[00:49:14] [PASSED] 0xBE0 (PVC)
[00:49:14] [PASSED] 0xBE1 (PVC)
[00:49:14] [PASSED] 0xBE5 (PVC)
[00:49:14] [PASSED] 0x7D40 (METEORLAKE)
[00:49:14] [PASSED] 0x7D45 (METEORLAKE)
[00:49:14] [PASSED] 0x7D55 (METEORLAKE)
[00:49:14] [PASSED] 0x7D60 (METEORLAKE)
[00:49:14] [PASSED] 0x7DD5 (METEORLAKE)
[00:49:14] [PASSED] 0x6420 (LUNARLAKE)
[00:49:14] [PASSED] 0x64A0 (LUNARLAKE)
[00:49:14] [PASSED] 0x64B0 (LUNARLAKE)
[00:49:14] [PASSED] 0xE202 (BATTLEMAGE)
[00:49:14] [PASSED] 0xE209 (BATTLEMAGE)
[00:49:14] [PASSED] 0xE20B (BATTLEMAGE)
[00:49:14] [PASSED] 0xE20C (BATTLEMAGE)
[00:49:14] [PASSED] 0xE20D (BATTLEMAGE)
[00:49:14] [PASSED] 0xE210 (BATTLEMAGE)
[00:49:14] [PASSED] 0xE211 (BATTLEMAGE)
[00:49:14] [PASSED] 0xE212 (BATTLEMAGE)
[00:49:14] [PASSED] 0xE216 (BATTLEMAGE)
[00:49:14] [PASSED] 0xE220 (BATTLEMAGE)
[00:49:14] [PASSED] 0xE221 (BATTLEMAGE)
[00:49:14] [PASSED] 0xE222 (BATTLEMAGE)
[00:49:14] [PASSED] 0xE223 (BATTLEMAGE)
[00:49:14] [PASSED] 0xB080 (PANTHERLAKE)
[00:49:14] [PASSED] 0xB081 (PANTHERLAKE)
[00:49:14] [PASSED] 0xB082 (PANTHERLAKE)
[00:49:14] [PASSED] 0xB083 (PANTHERLAKE)
[00:49:14] [PASSED] 0xB084 (PANTHERLAKE)
[00:49:14] [PASSED] 0xB085 (PANTHERLAKE)
[00:49:14] [PASSED] 0xB086 (PANTHERLAKE)
[00:49:14] [PASSED] 0xB087 (PANTHERLAKE)
[00:49:14] [PASSED] 0xB08F (PANTHERLAKE)
[00:49:14] [PASSED] 0xB090 (PANTHERLAKE)
[00:49:14] [PASSED] 0xB0A0 (PANTHERLAKE)
[00:49:14] [PASSED] 0xB0A1 (PANTHERLAKE)
[00:49:14] [PASSED] 0xB0B0 (PANTHERLAKE)
[00:49:14] [PASSED] 0xFD80 (PANTHERLAKE)
[00:49:14] [PASSED] 0xFD81 (PANTHERLAKE)
[00:49:14] [PASSED] 0xD740 (NOVALAKE_S)
[00:49:14] [PASSED] 0xD741 (NOVALAKE_S)
[00:49:14] [PASSED] 0xD742 (NOVALAKE_S)
[00:49:14] [PASSED] 0xD743 (NOVALAKE_S)
[00:49:14] [PASSED] 0xD745 (NOVALAKE_S)
[00:49:14] [PASSED] 0xD74A (NOVALAKE_S)
[00:49:14] [PASSED] 0xD74B (NOVALAKE_S)
[00:49:14] [PASSED] 0x674C (CRESCENTISLAND)
[00:49:14] [PASSED] 0x674D (CRESCENTISLAND)
[00:49:14] [PASSED] 0x674E (CRESCENTISLAND)
[00:49:14] [PASSED] 0x674F (CRESCENTISLAND)
[00:49:14] [PASSED] 0x6750 (CRESCENTISLAND)
[00:49:14] [PASSED] 0x6751 (CRESCENTISLAND)
[00:49:14] [PASSED] 0x6752 (CRESCENTISLAND)
[00:49:14] [PASSED] 0x6753 (CRESCENTISLAND)
[00:49:14] [PASSED] 0x6754 (CRESCENTISLAND)
[00:49:14] [PASSED] 0x6755 (CRESCENTISLAND)
[00:49:14] [PASSED] 0x6756 (CRESCENTISLAND)
[00:49:14] [PASSED] 0xD750 (NOVALAKE_P)
[00:49:14] [PASSED] 0xD751 (NOVALAKE_P)
[00:49:14] [PASSED] 0xD752 (NOVALAKE_P)
[00:49:14] [PASSED] 0xD753 (NOVALAKE_P)
[00:49:14] [PASSED] 0xD754 (NOVALAKE_P)
[00:49:14] [PASSED] 0xD755 (NOVALAKE_P)
[00:49:14] [PASSED] 0xD756 (NOVALAKE_P)
[00:49:14] [PASSED] 0xD757 (NOVALAKE_P)
[00:49:14] [PASSED] 0xD75F (NOVALAKE_P)
[00:49:14] =============== [PASSED] check_platform_desc ===============
[00:49:14] ===================== [PASSED] xe_pci ======================
[00:49:14] ============= xe_rtp_tables_test (5 subtests) ==============
[00:49:14] ================== xe_rtp_table_gt_test  ===================
[00:49:14] [PASSED] gt_was/14011060649
[00:49:14] [PASSED] gt_was/14011059788
[00:49:14] [PASSED] gt_was/14015795083
[00:49:14] [PASSED] gt_was/16021867713
[00:49:14] [PASSED] gt_was/14019449301
[00:49:14] [PASSED] gt_was/16028005424
[00:49:14] [PASSED] gt_was/14026578760
[00:49:14] [PASSED] gt_was/1409420604
[00:49:14] [PASSED] gt_was/1408615072
[00:49:14] [PASSED] gt_was/22010523718
[00:49:14] [PASSED] gt_was/14011006942
[00:49:14] [PASSED] gt_was/14014830051
[00:49:14] [PASSED] gt_was/18018781329
[00:49:14] [PASSED] gt_was/1509235366
[00:49:14] [PASSED] gt_was/18018781329
[00:49:14] [PASSED] gt_was/16016694945
[00:49:14] [PASSED] gt_was/14018575942
[00:49:14] [PASSED] gt_was/22016670082
[00:49:14] [PASSED] gt_was/22016670082
[00:49:14] [PASSED] gt_was/14017421178
[00:49:14] [PASSED] gt_was/16025250150
[00:49:14] [PASSED] gt_was/14021871409
[00:49:14] [PASSED] gt_was/16021865536
[00:49:14] [PASSED] gt_was/14021486841
[00:49:14] [PASSED] gt_was/14025160223
[00:49:14] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[00:49:14] [PASSED] gt_was/14025635424
[00:49:14] [PASSED] gt_was/16028005424
[00:49:14] ============== [PASSED] xe_rtp_table_gt_test ===============
[00:49:14] ================== xe_rtp_table_gt_test  ===================
[00:49:14] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[00:49:14] [PASSED] gt_tunings/Tuning: 32B Access Enable
[00:49:14] [PASSED] gt_tunings/Tuning: L3 cache
[00:49:14] [PASSED] gt_tunings/Tuning: L3 cache - media
[00:49:14] [PASSED] gt_tunings/Tuning: Compression Overfetch
[00:49:14] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[00:49:14] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[00:49:14] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[00:49:14] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[00:49:14] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[00:49:14] [PASSED] gt_tunings/Tuning: Stateless compression control
[00:49:14] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[00:49:14] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[00:49:14] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[00:49:14] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[00:49:14] [PASSED] gt_tunings/Tuning: Force All Non-Compressible Memory Reads to be 256B Overfetches
[00:49:14] ============== [PASSED] xe_rtp_table_gt_test ===============
[00:49:14] ================== xe_rtp_table_oob_test  ==================
[00:49:14] [PASSED] oob_was/1607983814
[00:49:14] [PASSED] oob_was/16010904313
[00:49:14] [PASSED] oob_was/18022495364
[00:49:14] [PASSED] oob_was/22012773006
[00:49:14] [PASSED] oob_was/14014475959
[00:49:14] [PASSED] oob_was/22011391025
[00:49:14] [PASSED] oob_was/22012727170
[00:49:14] [PASSED] oob_was/22012727685
[00:49:14] [PASSED] oob_was/22016596838
[00:49:14] [PASSED] oob_was/18020744125
[00:49:14] [PASSED] oob_was/1409600907
[00:49:14] [PASSED] oob_was/22014953428
[00:49:14] [PASSED] oob_was/16017236439
[00:49:14] [PASSED] oob_was/14019821291
[00:49:14] [PASSED] oob_was/14015076503
[00:49:14] [PASSED] oob_was/22016122933
[00:49:14] [PASSED] oob_was/14018913170
[00:49:14] [PASSED] oob_was/14018094691
[00:49:14] [PASSED] oob_was/18024947630
[00:49:14] [PASSED] oob_was/16022287689
[00:49:14] [PASSED] oob_was/13011645652
[00:49:14] [PASSED] oob_was/14022293748
[00:49:14] [PASSED] oob_was/22019794406
[00:49:14] [PASSED] oob_was/22019338487
[00:49:14] [PASSED] oob_was/16023588340
[00:49:14] [PASSED] oob_was/14019789679
[00:49:14] [PASSED] oob_was/14022866841
[00:49:14] [PASSED] oob_was/16021333562
[00:49:14] [PASSED] oob_was/14016712196
[00:49:14] [PASSED] oob_was/14015568240
[00:49:14] [PASSED] oob_was/18013179988
[00:49:14] [PASSED] oob_was/1508761755
[00:49:14] [PASSED] oob_was/16023105232
[00:49:14] [PASSED] oob_was/16026508708
[00:49:14] [PASSED] oob_was/14020001231
[00:49:14] [PASSED] oob_was/16023683509
[00:49:14] [PASSED] oob_was/14025515070
[00:49:14] [PASSED] oob_was/15015404425_disable
[00:49:14] [PASSED] oob_was/16026007364
[00:49:14] [PASSED] oob_was/14020316580
[00:49:14] [PASSED] oob_was/14025883347
[00:49:14] [PASSED] oob_was/16029380221
[00:49:14] [PASSED] oob_was/22022079272
[00:49:14] [PASSED] oob_was/16029897822
[00:49:14] [PASSED] oob_was/14026539277
[00:49:14] [PASSED] oob_was/14027054324
[00:49:14] [PASSED] oob_was/14025941587
[00:49:14] [PASSED] oob_was/16030224309
[00:49:14] [PASSED] oob_was/14028709524
[00:49:14] [PASSED] oob_was/14028250015
[00:49:14] [PASSED] oob_was/16031259911
[00:49:14] ============== [PASSED] xe_rtp_table_oob_test ==============
[00:49:14] ================ xe_rtp_table_dev_oob_test  ================
[00:49:14] [PASSED] device_oob_was/22010954014
[00:49:14] [PASSED] device_oob_was/15015404425
[00:49:14] [PASSED] device_oob_was/22019338487_display
[00:49:14] [PASSED] device_oob_was/14022085890
[00:49:14] [PASSED] device_oob_was/14026633728
[00:49:14] [PASSED] device_oob_was/14026746987
[00:49:14] [PASSED] device_oob_was/14026779378
[00:49:14] [PASSED] device_oob_was/14028586678
[00:49:14] [PASSED] device_oob_was/14028434957
[00:49:14] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[00:49:14] ========== xe_rtp_table_missing_upper_bound_test  ==========
[00:49:14] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[00:49:14] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[00:49:14] [PASSED] register_whitelist/1806527549
[00:49:14] [PASSED] register_whitelist/allow_read_ctx_timestamp
[00:49:14] [PASSED] register_whitelist/allow_read_queue_timestamp
[00:49:14] [PASSED] register_whitelist/16014440446
[00:49:14] [PASSED] register_whitelist/16017236439
[00:49:14] [PASSED] register_whitelist/16020183090
[00:49:14] [PASSED] register_whitelist/14024997852
[00:49:14] [PASSED] register_whitelist/14024997852
[00:49:14] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[00:49:14] =============== [PASSED] xe_rtp_tables_test ================
[00:49:14] =================== xe_rtp (3 subtests) ====================
[00:49:14] =================== xe_rtp_rules_tests  ====================
[00:49:14] [PASSED] no
[00:49:14] [PASSED] yes
[00:49:14] [PASSED] no-and-no
[00:49:14] [PASSED] no-and-yes
[00:49:14] [PASSED] yes-and-no
[00:49:14] [PASSED] yes-and-yes
[00:49:14] [PASSED] no-or-no
[00:49:14] [PASSED] no-or-yes
[00:49:14] [PASSED] yes-or-no
[00:49:14] [PASSED] yes-or-yes
[00:49:14] [PASSED] no-yes-or-yes-no
[00:49:14] [PASSED] no-yes-or-yes-yes
[00:49:14] [PASSED] yes-yes-or-no-yes
[00:49:14] [PASSED] yes-yes-or-yes-yes
[00:49:14] [PASSED] no-no-or-yes-or-no
[00:49:14] [PASSED] or
[00:49:14] [PASSED] or-yes
[00:49:14] [PASSED] or-no
[00:49:14] [PASSED] yes-or
[00:49:14] [PASSED] no-or
[00:49:14] [PASSED] no-or-or-yes
[00:49:14] [PASSED] yes-or-or-no
[00:49:14] [PASSED] no-or-or-no
[00:49:14] [PASSED] missing-context-engine-class
[00:49:14] [PASSED] missing-context-engine-class-or-yes
[00:49:14] [PASSED] missing-context-engine-class-or-or-yes
[00:49:14] =============== [PASSED] xe_rtp_rules_tests ================
[00:49:14] =============== xe_rtp_process_to_sr_tests  ================
[00:49:14] [PASSED] coalesce-same-reg
[00:49:14] [PASSED] coalesce-same-reg-literal-and-func
[00:49:14] [PASSED] no-match-no-add
[00:49:14] [PASSED] two-regs-two-entries
[00:49:14] [PASSED] clr-one-set-other
[00:49:14] [PASSED] set-field
[00:49:14] [PASSED] conflict-duplicate
[00:49:14] [PASSED] conflict-not-disjoint
[00:49:14] [PASSED] conflict-not-disjoint-literal-and-func
[00:49:14] [PASSED] conflict-reg-type
[00:49:14] [PASSED] bad-mcr-reg-forced-to-regular
[00:49:14] [PASSED] bad-regular-reg-forced-to-mcr
[00:49:14] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[00:49:14] ================== xe_rtp_process_tests  ===================
[00:49:14] [PASSED] active1
[00:49:14] [PASSED] active2
[00:49:14] [PASSED] active-inactive
[00:49:14] [PASSED] inactive-active
[00:49:14] [PASSED] inactive-active-inactive
[00:49:14] [PASSED] inactive-inactive-inactive
[00:49:14] ============== [PASSED] xe_rtp_process_tests ===============
[00:49:14] ===================== [PASSED] xe_rtp ======================
[00:49:14] ==================== xe_wa (1 subtest) =====================
[00:49:14] ======================== xe_wa_gt  =========================
[00:49:14] [PASSED] TIGERLAKE B0
[00:49:14] [PASSED] DG1 A0
[00:49:14] [PASSED] DG1 B0
[00:49:14] [PASSED] ALDERLAKE_S A0
[00:49:14] [PASSED] ALDERLAKE_S B0
[00:49:14] [PASSED] ALDERLAKE_S C0
[00:49:14] [PASSED] ALDERLAKE_S D0
[00:49:14] [PASSED] ALDERLAKE_P A0
[00:49:14] [PASSED] ALDERLAKE_P B0
[00:49:14] [PASSED] ALDERLAKE_P C0
[00:49:14] [PASSED] ALDERLAKE_S RPLS D0
[00:49:14] [PASSED] ALDERLAKE_P RPLU E0
[00:49:14] [PASSED] DG2 G10 C0
[00:49:14] [PASSED] DG2 G11 B1
[00:49:14] [PASSED] DG2 G12 A1
[00:49:14] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[00:49:14] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[00:49:14] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[00:49:14] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[00:49:14] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[00:49:14] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[00:49:14] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[00:49:14] ==================== [PASSED] xe_wa_gt =====================
[00:49:14] ====================== [PASSED] xe_wa ======================
[00:49:14] ============================================================
[00:49:14] Testing complete. Ran 860 tests: passed: 831, skipped: 29
[00:49:14] Elapsed time: 41.829s total, 2.550s configuring, 38.514s building, 0.730s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[00:49:14] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:49:16] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[00:49:42] Starting KUnit Kernel (1/1)...
[00:49:42] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[00:49:42] ============ drm_test_pick_cmdline (2 subtests) ============
[00:49:42] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[00:49:42] =============== drm_test_pick_cmdline_named  ===============
[00:49:42] [PASSED] NTSC
[00:49:42] [PASSED] NTSC-J
[00:49:42] [PASSED] PAL
[00:49:42] [PASSED] PAL-M
[00:49:42] =========== [PASSED] drm_test_pick_cmdline_named ===========
[00:49:42] ============== [PASSED] drm_test_pick_cmdline ==============
[00:49:42] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[00:49:42] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[00:49:42] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[00:49:42] =========== drm_validate_clone_mode (2 subtests) ===========
[00:49:42] ============== drm_test_check_in_clone_mode  ===============
[00:49:42] [PASSED] in_clone_mode
[00:49:42] [PASSED] not_in_clone_mode
[00:49:42] ========== [PASSED] drm_test_check_in_clone_mode ===========
[00:49:42] =============== drm_test_check_valid_clones  ===============
[00:49:42] [PASSED] not_in_clone_mode
[00:49:42] [PASSED] valid_clone
[00:49:42] [PASSED] invalid_clone
[00:49:42] =========== [PASSED] drm_test_check_valid_clones ===========
[00:49:42] ============= [PASSED] drm_validate_clone_mode =============
[00:49:42] ============= drm_validate_modeset (1 subtest) =============
[00:49:42] [PASSED] drm_test_check_connector_changed_modeset
[00:49:42] ============== [PASSED] drm_validate_modeset ===============
[00:49:42] ====== drm_test_bridge_get_current_state (1 subtest) =======
[00:49:42] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[00:49:42] ======== [PASSED] drm_test_bridge_get_current_state ========
[00:49:42] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[00:49:42] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[00:49:42] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[00:49:42] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[00:49:42] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[00:49:42] ============== drm_bridge_alloc (2 subtests) ===============
[00:49:42] [PASSED] drm_test_drm_bridge_alloc_basic
[00:49:42] [PASSED] drm_test_drm_bridge_alloc_get_put
[00:49:42] ================ [PASSED] drm_bridge_alloc =================
[00:49:42] ============= drm_bridge_bus_fmt (5 subtests) ==============
[00:49:42] [PASSED] drm_test_bridge_rgb_yuv_rgb
[00:49:42] [PASSED] drm_test_bridge_must_convert_to_yuv444
[00:49:42] [PASSED] drm_test_bridge_hdmi_auto_rgb
[00:49:42] [PASSED] drm_test_bridge_auto_first
[00:49:42] [PASSED] drm_test_bridge_rgb_yuv_no_path
[00:49:42] =============== [PASSED] drm_bridge_bus_fmt ================
[00:49:42] ============= drm_cmdline_parser (40 subtests) =============
[00:49:42] [PASSED] drm_test_cmdline_force_d_only
[00:49:42] [PASSED] drm_test_cmdline_force_D_only_dvi
[00:49:42] [PASSED] drm_test_cmdline_force_D_only_hdmi
[00:49:42] [PASSED] drm_test_cmdline_force_D_only_not_digital
[00:49:42] [PASSED] drm_test_cmdline_force_e_only
[00:49:42] [PASSED] drm_test_cmdline_res
[00:49:42] [PASSED] drm_test_cmdline_res_vesa
[00:49:42] [PASSED] drm_test_cmdline_res_vesa_rblank
[00:49:42] [PASSED] drm_test_cmdline_res_rblank
[00:49:42] [PASSED] drm_test_cmdline_res_bpp
[00:49:42] [PASSED] drm_test_cmdline_res_refresh
[00:49:42] [PASSED] drm_test_cmdline_res_bpp_refresh
[00:49:42] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[00:49:42] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[00:49:42] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[00:49:42] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[00:49:42] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[00:49:42] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[00:49:42] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[00:49:42] [PASSED] drm_test_cmdline_res_margins_force_on
[00:49:42] [PASSED] drm_test_cmdline_res_vesa_margins
[00:49:42] [PASSED] drm_test_cmdline_name
[00:49:42] [PASSED] drm_test_cmdline_name_bpp
[00:49:42] [PASSED] drm_test_cmdline_name_option
[00:49:42] [PASSED] drm_test_cmdline_name_bpp_option
[00:49:42] [PASSED] drm_test_cmdline_rotate_0
[00:49:42] [PASSED] drm_test_cmdline_rotate_90
[00:49:42] [PASSED] drm_test_cmdline_rotate_180
[00:49:42] [PASSED] drm_test_cmdline_rotate_270
[00:49:42] [PASSED] drm_test_cmdline_hmirror
[00:49:42] [PASSED] drm_test_cmdline_vmirror
[00:49:42] [PASSED] drm_test_cmdline_margin_options
[00:49:42] [PASSED] drm_test_cmdline_multiple_options
[00:49:42] [PASSED] drm_test_cmdline_bpp_extra_and_option
[00:49:42] [PASSED] drm_test_cmdline_extra_and_option
[00:49:42] [PASSED] drm_test_cmdline_freestanding_options
[00:49:42] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[00:49:42] [PASSED] drm_test_cmdline_panel_orientation
[00:49:42] ================ drm_test_cmdline_invalid  =================
[00:49:42] [PASSED] margin_only
[00:49:42] [PASSED] interlace_only
[00:49:42] [PASSED] res_missing_x
[00:49:42] [PASSED] res_missing_y
[00:49:42] [PASSED] res_bad_y
[00:49:42] [PASSED] res_missing_y_bpp
[00:49:42] [PASSED] res_bad_bpp
[00:49:42] [PASSED] res_bad_refresh
[00:49:42] [PASSED] res_bpp_refresh_force_on_off
[00:49:42] [PASSED] res_invalid_mode
[00:49:42] [PASSED] res_bpp_wrong_place_mode
[00:49:42] [PASSED] name_bpp_refresh
[00:49:42] [PASSED] name_refresh
[00:49:42] [PASSED] name_refresh_wrong_mode
[00:49:42] [PASSED] name_refresh_invalid_mode
[00:49:42] [PASSED] rotate_multiple
[00:49:42] [PASSED] rotate_invalid_val
[00:49:42] [PASSED] rotate_truncated
[00:49:42] [PASSED] invalid_option
[00:49:42] [PASSED] invalid_tv_option
[00:49:42] [PASSED] truncated_tv_option
[00:49:42] ============ [PASSED] drm_test_cmdline_invalid =============
[00:49:42] =============== drm_test_cmdline_tv_options  ===============
[00:49:42] [PASSED] NTSC
[00:49:42] [PASSED] NTSC_443
[00:49:42] [PASSED] NTSC_J
[00:49:42] [PASSED] PAL
[00:49:42] [PASSED] PAL_M
[00:49:42] [PASSED] PAL_N
[00:49:42] [PASSED] SECAM
[00:49:42] [PASSED] MONO_525
[00:49:42] [PASSED] MONO_625
[00:49:42] =========== [PASSED] drm_test_cmdline_tv_options ===========
[00:49:42] =============== [PASSED] drm_cmdline_parser ================
[00:49:42] ========== drmm_connector_hdmi_init (20 subtests) ==========
[00:49:42] [PASSED] drm_test_connector_hdmi_init_valid
[00:49:42] [PASSED] drm_test_connector_hdmi_init_bpc_8
[00:49:42] [PASSED] drm_test_connector_hdmi_init_bpc_10
[00:49:42] [PASSED] drm_test_connector_hdmi_init_bpc_12
[00:49:42] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[00:49:42] [PASSED] drm_test_connector_hdmi_init_bpc_null
[00:49:42] [PASSED] drm_test_connector_hdmi_init_formats_empty
[00:49:42] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[00:49:42] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[00:49:42] [PASSED] supported_formats=0x9 yuv420_allowed=1
[00:49:42] [PASSED] supported_formats=0x9 yuv420_allowed=0
[00:49:42] [PASSED] supported_formats=0x5 yuv420_allowed=1
[00:49:42] [PASSED] supported_formats=0x5 yuv420_allowed=0
[00:49:42] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[00:49:42] [PASSED] drm_test_connector_hdmi_init_null_ddc
[00:49:42] [PASSED] drm_test_connector_hdmi_init_null_product
[00:49:42] [PASSED] drm_test_connector_hdmi_init_null_vendor
[00:49:42] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[00:49:42] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[00:49:42] [PASSED] drm_test_connector_hdmi_init_product_valid
[00:49:42] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[00:49:42] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[00:49:42] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[00:49:42] ========= drm_test_connector_hdmi_init_type_valid  =========
[00:49:42] [PASSED] HDMI-A
[00:49:42] [PASSED] HDMI-B
[00:49:42] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[00:49:42] ======== drm_test_connector_hdmi_init_type_invalid  ========
[00:49:42] [PASSED] Unknown
[00:49:42] [PASSED] VGA
[00:49:42] [PASSED] DVI-I
[00:49:42] [PASSED] DVI-D
[00:49:42] [PASSED] DVI-A
[00:49:42] [PASSED] Composite
[00:49:42] [PASSED] SVIDEO
[00:49:42] [PASSED] LVDS
[00:49:42] [PASSED] Component
[00:49:42] [PASSED] DIN
[00:49:42] [PASSED] DP
[00:49:42] [PASSED] TV
[00:49:42] [PASSED] eDP
[00:49:42] [PASSED] Virtual
[00:49:42] [PASSED] DSI
[00:49:42] [PASSED] DPI
[00:49:42] [PASSED] Writeback
[00:49:42] [PASSED] SPI
[00:49:42] [PASSED] USB
[00:49:42] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[00:49:42] ============ [PASSED] drmm_connector_hdmi_init =============
[00:49:42] ============= drmm_connector_init (3 subtests) =============
[00:49:42] [PASSED] drm_test_drmm_connector_init
[00:49:42] [PASSED] drm_test_drmm_connector_init_null_ddc
[00:49:42] ========= drm_test_drmm_connector_init_type_valid  =========
[00:49:42] [PASSED] Unknown
[00:49:42] [PASSED] VGA
[00:49:42] [PASSED] DVI-I
[00:49:42] [PASSED] DVI-D
[00:49:42] [PASSED] DVI-A
[00:49:42] [PASSED] Composite
[00:49:42] [PASSED] SVIDEO
[00:49:42] [PASSED] LVDS
[00:49:42] [PASSED] Component
[00:49:42] [PASSED] DIN
[00:49:42] [PASSED] DP
[00:49:42] [PASSED] HDMI-A
[00:49:42] [PASSED] HDMI-B
[00:49:42] [PASSED] TV
[00:49:42] [PASSED] eDP
[00:49:42] [PASSED] Virtual
[00:49:42] [PASSED] DSI
[00:49:42] [PASSED] DPI
[00:49:42] [PASSED] Writeback
[00:49:42] [PASSED] SPI
[00:49:42] [PASSED] USB
[00:49:42] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[00:49:42] =============== [PASSED] drmm_connector_init ===============
[00:49:42] ========= drm_connector_dynamic_init (6 subtests) ==========
[00:49:42] [PASSED] drm_test_drm_connector_dynamic_init
[00:49:42] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[00:49:42] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[00:49:42] [PASSED] drm_test_drm_connector_dynamic_init_properties
[00:49:42] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[00:49:42] [PASSED] Unknown
[00:49:42] [PASSED] VGA
[00:49:42] [PASSED] DVI-I
[00:49:42] [PASSED] DVI-D
[00:49:42] [PASSED] DVI-A
[00:49:42] [PASSED] Composite
[00:49:42] [PASSED] SVIDEO
[00:49:42] [PASSED] LVDS
[00:49:42] [PASSED] Component
[00:49:42] [PASSED] DIN
[00:49:42] [PASSED] DP
[00:49:42] [PASSED] HDMI-A
[00:49:42] [PASSED] HDMI-B
[00:49:42] [PASSED] TV
[00:49:42] [PASSED] eDP
[00:49:42] [PASSED] Virtual
[00:49:42] [PASSED] DSI
[00:49:42] [PASSED] DPI
[00:49:42] [PASSED] Writeback
[00:49:42] [PASSED] SPI
[00:49:42] [PASSED] USB
[00:49:42] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[00:49:42] ======== drm_test_drm_connector_dynamic_init_name  =========
[00:49:42] [PASSED] Unknown
[00:49:42] [PASSED] VGA
[00:49:42] [PASSED] DVI-I
[00:49:42] [PASSED] DVI-D
[00:49:42] [PASSED] DVI-A
[00:49:42] [PASSED] Composite
[00:49:42] [PASSED] SVIDEO
[00:49:42] [PASSED] LVDS
[00:49:42] [PASSED] Component
[00:49:42] [PASSED] DIN
[00:49:42] [PASSED] DP
[00:49:42] [PASSED] HDMI-A
[00:49:42] [PASSED] HDMI-B
[00:49:42] [PASSED] TV
[00:49:42] [PASSED] eDP
[00:49:42] [PASSED] Virtual
[00:49:42] [PASSED] DSI
[00:49:42] [PASSED] DPI
[00:49:42] [PASSED] Writeback
[00:49:42] [PASSED] SPI
[00:49:42] [PASSED] USB
[00:49:42] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[00:49:42] =========== [PASSED] drm_connector_dynamic_init ============
[00:49:42] ==== drm_connector_dynamic_register_early (4 subtests) =====
[00:49:42] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[00:49:42] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[00:49:42] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[00:49:42] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[00:49:42] ====== [PASSED] drm_connector_dynamic_register_early =======
[00:49:42] ======= drm_connector_dynamic_register (7 subtests) ========
[00:49:42] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[00:49:42] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[00:49:42] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[00:49:42] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[00:49:42] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[00:49:42] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[00:49:42] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[00:49:42] ========= [PASSED] drm_connector_dynamic_register ==========
[00:49:42] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[00:49:42] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[00:49:42] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[00:49:42] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[00:49:42] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[00:49:42] ========== drm_test_get_tv_mode_from_name_valid  ===========
[00:49:42] [PASSED] NTSC
[00:49:42] [PASSED] NTSC-443
[00:49:42] [PASSED] NTSC-J
[00:49:42] [PASSED] PAL
[00:49:42] [PASSED] PAL-M
[00:49:42] [PASSED] PAL-N
[00:49:42] [PASSED] SECAM
[00:49:42] [PASSED] Mono
[00:49:42] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[00:49:42] [PASSED] drm_test_get_tv_mode_from_name_truncated
[00:49:42] ============ [PASSED] drm_get_tv_mode_from_name ============
[00:49:42] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[00:49:42] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[00:49:42] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[00:49:42] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[00:49:42] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[00:49:42] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[00:49:42] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[00:49:42] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[00:49:42] [PASSED] VIC 96
[00:49:42] [PASSED] VIC 97
[00:49:42] [PASSED] VIC 101
[00:49:42] [PASSED] VIC 102
[00:49:42] [PASSED] VIC 106
[00:49:42] [PASSED] VIC 107
[00:49:42] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[00:49:42] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[00:49:42] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[00:49:42] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[00:49:42] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[00:49:42] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[00:49:42] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[00:49:42] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[00:49:42] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[00:49:42] [PASSED] Automatic
[00:49:42] [PASSED] Full
[00:49:42] [PASSED] Limited 16:235
[00:49:42] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[00:49:42] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[00:49:42] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[00:49:42] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[00:49:42] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[00:49:42] [PASSED] RGB
[00:49:42] [PASSED] YUV 4:2:0
[00:49:42] [PASSED] YUV 4:2:2
[00:49:42] [PASSED] YUV 4:4:4
[00:49:42] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[00:49:42] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[00:49:42] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[00:49:42] ============= drm_damage_helper (21 subtests) ==============
[00:49:42] [PASSED] drm_test_damage_iter_no_damage
[00:49:42] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[00:49:42] [PASSED] drm_test_damage_iter_no_damage_src_moved
[00:49:42] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[00:49:42] [PASSED] drm_test_damage_iter_no_damage_not_visible
[00:49:42] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[00:49:42] [PASSED] drm_test_damage_iter_no_damage_no_fb
[00:49:42] [PASSED] drm_test_damage_iter_simple_damage
[00:49:42] [PASSED] drm_test_damage_iter_single_damage
[00:49:42] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[00:49:42] [PASSED] drm_test_damage_iter_single_damage_outside_src
[00:49:42] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[00:49:42] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[00:49:42] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[00:49:42] [PASSED] drm_test_damage_iter_single_damage_src_moved
[00:49:42] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[00:49:42] [PASSED] drm_test_damage_iter_damage
[00:49:42] [PASSED] drm_test_damage_iter_damage_one_intersect
[00:49:42] [PASSED] drm_test_damage_iter_damage_one_outside
[00:49:42] [PASSED] drm_test_damage_iter_damage_src_moved
[00:49:42] [PASSED] drm_test_damage_iter_damage_not_visible
[00:49:42] ================ [PASSED] drm_damage_helper ================
[00:49:42] ============== drm_dp_mst_helper (3 subtests) ==============
[00:49:42] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[00:49:42] [PASSED] Clock 154000 BPP 30 DSC disabled
[00:49:42] [PASSED] Clock 234000 BPP 30 DSC disabled
[00:49:42] [PASSED] Clock 297000 BPP 24 DSC disabled
[00:49:42] [PASSED] Clock 332880 BPP 24 DSC enabled
[00:49:42] [PASSED] Clock 324540 BPP 24 DSC enabled
[00:49:42] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[00:49:42] ============== drm_test_dp_mst_calc_pbn_div  ===============
[00:49:42] [PASSED] Link rate 2000000 lane count 4
[00:49:42] [PASSED] Link rate 2000000 lane count 2
[00:49:42] [PASSED] Link rate 2000000 lane count 1
[00:49:42] [PASSED] Link rate 1350000 lane count 4
[00:49:42] [PASSED] Link rate 1350000 lane count 2
[00:49:42] [PASSED] Link rate 1350000 lane count 1
[00:49:42] [PASSED] Link rate 1000000 lane count 4
[00:49:42] [PASSED] Link rate 1000000 lane count 2
[00:49:42] [PASSED] Link rate 1000000 lane count 1
[00:49:42] [PASSED] Link rate 810000 lane count 4
[00:49:42] [PASSED] Link rate 810000 lane count 2
[00:49:42] [PASSED] Link rate 810000 lane count 1
[00:49:42] [PASSED] Link rate 540000 lane count 4
[00:49:42] [PASSED] Link rate 540000 lane count 2
[00:49:42] [PASSED] Link rate 540000 lane count 1
[00:49:42] [PASSED] Link rate 270000 lane count 4
[00:49:42] [PASSED] Link rate 270000 lane count 2
[00:49:42] [PASSED] Link rate 270000 lane count 1
[00:49:42] [PASSED] Link rate 162000 lane count 4
[00:49:42] [PASSED] Link rate 162000 lane count 2
[00:49:42] [PASSED] Link rate 162000 lane count 1
[00:49:42] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[00:49:42] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[00:49:42] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[00:49:42] [PASSED] DP_POWER_UP_PHY with port number
[00:49:42] [PASSED] DP_POWER_DOWN_PHY with port number
[00:49:42] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[00:49:42] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[00:49:42] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[00:49:42] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[00:49:42] [PASSED] DP_QUERY_PAYLOAD with port number
[00:49:42] [PASSED] DP_QUERY_PAYLOAD with VCPI
[00:49:42] [PASSED] DP_REMOTE_DPCD_READ with port number
[00:49:42] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[00:49:42] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[00:49:42] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[00:49:42] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[00:49:42] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[00:49:42] [PASSED] DP_REMOTE_I2C_READ with port number
[00:49:42] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[00:49:42] [PASSED] DP_REMOTE_I2C_READ with transactions array
[00:49:42] [PASSED] DP_REMOTE_I2C_WRITE with port number
[00:49:42] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[00:49:42] [PASSED] DP_REMOTE_I2C_WRITE with data array
[00:49:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[00:49:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[00:49:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[00:49:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[00:49:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[00:49:42] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[00:49:42] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[00:49:42] ================ [PASSED] drm_dp_mst_helper ================
[00:49:42] ================== drm_exec (7 subtests) ===================
[00:49:42] [PASSED] sanitycheck
[00:49:42] [PASSED] test_lock
[00:49:42] [PASSED] test_lock_unlock
[00:49:42] [PASSED] test_duplicates
[00:49:42] [PASSED] test_prepare
[00:49:42] [PASSED] test_prepare_array
[00:49:42] [PASSED] test_multiple_loops
[00:49:42] ==================== [PASSED] drm_exec =====================
[00:49:42] =========== drm_format_helper_test (17 subtests) ===========
[00:49:42] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[00:49:42] [PASSED] single_pixel_source_buffer
[00:49:42] [PASSED] single_pixel_clip_rectangle
[00:49:42] [PASSED] well_known_colors
[00:49:42] [PASSED] destination_pitch
[00:49:42] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[00:49:42] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[00:49:42] [PASSED] single_pixel_source_buffer
[00:49:42] [PASSED] single_pixel_clip_rectangle
[00:49:42] [PASSED] well_known_colors
[00:49:42] [PASSED] destination_pitch
[00:49:42] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[00:49:42] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[00:49:42] [PASSED] single_pixel_source_buffer
[00:49:42] [PASSED] single_pixel_clip_rectangle
[00:49:42] [PASSED] well_known_colors
[00:49:42] [PASSED] destination_pitch
[00:49:42] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[00:49:42] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[00:49:42] [PASSED] single_pixel_source_buffer
[00:49:42] [PASSED] single_pixel_clip_rectangle
[00:49:42] [PASSED] well_known_colors
[00:49:42] [PASSED] destination_pitch
[00:49:42] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[00:49:42] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[00:49:42] [PASSED] single_pixel_source_buffer
[00:49:42] [PASSED] single_pixel_clip_rectangle
[00:49:42] [PASSED] well_known_colors
[00:49:42] [PASSED] destination_pitch
[00:49:42] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[00:49:42] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[00:49:42] [PASSED] single_pixel_source_buffer
[00:49:42] [PASSED] single_pixel_clip_rectangle
[00:49:42] [PASSED] well_known_colors
[00:49:42] [PASSED] destination_pitch
[00:49:42] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[00:49:42] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[00:49:42] [PASSED] single_pixel_source_buffer
[00:49:42] [PASSED] single_pixel_clip_rectangle
[00:49:42] [PASSED] well_known_colors
[00:49:42] [PASSED] destination_pitch
[00:49:42] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[00:49:42] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[00:49:42] [PASSED] single_pixel_source_buffer
[00:49:42] [PASSED] single_pixel_clip_rectangle
[00:49:42] [PASSED] well_known_colors
[00:49:42] [PASSED] destination_pitch
[00:49:42] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[00:49:42] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[00:49:42] [PASSED] single_pixel_source_buffer
[00:49:42] [PASSED] single_pixel_clip_rectangle
[00:49:42] [PASSED] well_known_colors
[00:49:42] [PASSED] destination_pitch
[00:49:42] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[00:49:42] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[00:49:42] [PASSED] single_pixel_source_buffer
[00:49:42] [PASSED] single_pixel_clip_rectangle
[00:49:42] [PASSED] well_known_colors
[00:49:42] [PASSED] destination_pitch
[00:49:42] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[00:49:42] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[00:49:42] [PASSED] single_pixel_source_buffer
[00:49:42] [PASSED] single_pixel_clip_rectangle
[00:49:42] [PASSED] well_known_colors
[00:49:42] [PASSED] destination_pitch
[00:49:42] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[00:49:42] ============== drm_test_fb_xrgb8888_to_mono  ===============
[00:49:42] [PASSED] single_pixel_source_buffer
[00:49:42] [PASSED] single_pixel_clip_rectangle
[00:49:42] [PASSED] well_known_colors
[00:49:42] [PASSED] destination_pitch
[00:49:42] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[00:49:42] ==================== drm_test_fb_swab  =====================
[00:49:42] [PASSED] single_pixel_source_buffer
[00:49:42] [PASSED] single_pixel_clip_rectangle
[00:49:42] [PASSED] well_known_colors
[00:49:42] [PASSED] destination_pitch
[00:49:42] ================ [PASSED] drm_test_fb_swab =================
[00:49:42] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[00:49:42] [PASSED] single_pixel_source_buffer
[00:49:42] [PASSED] single_pixel_clip_rectangle
[00:49:42] [PASSED] well_known_colors
[00:49:42] [PASSED] destination_pitch
[00:49:42] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[00:49:42] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[00:49:42] [PASSED] single_pixel_source_buffer
[00:49:42] [PASSED] single_pixel_clip_rectangle
[00:49:42] [PASSED] well_known_colors
[00:49:42] [PASSED] destination_pitch
[00:49:42] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[00:49:42] ================= drm_test_fb_clip_offset  =================
[00:49:42] [PASSED] pass through
[00:49:42] [PASSED] horizontal offset
[00:49:42] [PASSED] vertical offset
[00:49:42] [PASSED] horizontal and vertical offset
[00:49:42] [PASSED] horizontal offset (custom pitch)
[00:49:42] [PASSED] vertical offset (custom pitch)
[00:49:42] [PASSED] horizontal and vertical offset (custom pitch)
[00:49:42] ============= [PASSED] drm_test_fb_clip_offset =============
[00:49:42] =================== drm_test_fb_memcpy  ====================
[00:49:42] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[00:49:42] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[00:49:42] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[00:49:42] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[00:49:42] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[00:49:42] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[00:49:42] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[00:49:42] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[00:49:42] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[00:49:42] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[00:49:42] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[00:49:42] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[00:49:42] =============== [PASSED] drm_test_fb_memcpy ================
[00:49:42] ============= [PASSED] drm_format_helper_test ==============
[00:49:42] ================= drm_format (18 subtests) =================
[00:49:42] [PASSED] drm_test_format_block_width_invalid
[00:49:42] [PASSED] drm_test_format_block_width_one_plane
[00:49:42] [PASSED] drm_test_format_block_width_two_plane
[00:49:42] [PASSED] drm_test_format_block_width_three_plane
[00:49:42] [PASSED] drm_test_format_block_width_tiled
[00:49:42] [PASSED] drm_test_format_block_height_invalid
[00:49:42] [PASSED] drm_test_format_block_height_one_plane
[00:49:42] [PASSED] drm_test_format_block_height_two_plane
[00:49:42] [PASSED] drm_test_format_block_height_three_plane
[00:49:42] [PASSED] drm_test_format_block_height_tiled
[00:49:42] [PASSED] drm_test_format_min_pitch_invalid
[00:49:42] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[00:49:42] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[00:49:42] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[00:49:42] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[00:49:42] [PASSED] drm_test_format_min_pitch_two_plane
[00:49:42] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[00:49:42] [PASSED] drm_test_format_min_pitch_tiled
[00:49:42] =================== [PASSED] drm_format ====================
[00:49:42] ============== drm_framebuffer (10 subtests) ===============
[00:49:42] ========== drm_test_framebuffer_check_src_coords  ==========
[00:49:42] [PASSED] Success: source fits into fb
[00:49:42] [PASSED] Fail: overflowing fb with x-axis coordinate
[00:49:42] [PASSED] Fail: overflowing fb with y-axis coordinate
[00:49:42] [PASSED] Fail: overflowing fb with source width
[00:49:42] [PASSED] Fail: overflowing fb with source height
[00:49:42] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[00:49:42] [PASSED] drm_test_framebuffer_cleanup
[00:49:42] =============== drm_test_framebuffer_create  ===============
[00:49:42] [PASSED] ABGR8888 normal sizes
[00:49:42] [PASSED] ABGR8888 max sizes
[00:49:42] [PASSED] ABGR8888 pitch greater than min required
[00:49:42] [PASSED] ABGR8888 pitch less than min required
[00:49:42] [PASSED] ABGR8888 Invalid width
[00:49:42] [PASSED] ABGR8888 Invalid buffer handle
[00:49:42] [PASSED] No pixel format
[00:49:42] [PASSED] ABGR8888 Width 0
[00:49:42] [PASSED] ABGR8888 Height 0
[00:49:42] [PASSED] ABGR8888 Out of bound height * pitch combination
[00:49:42] [PASSED] ABGR8888 Large buffer offset
[00:49:42] [PASSED] ABGR8888 Buffer offset for inexistent plane
[00:49:42] [PASSED] ABGR8888 Invalid flag
[00:49:42] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[00:49:42] [PASSED] ABGR8888 Valid buffer modifier
[00:49:42] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[00:49:42] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[00:49:42] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[00:49:42] [PASSED] NV12 Normal sizes
[00:49:42] [PASSED] NV12 Max sizes
[00:49:42] [PASSED] NV12 Invalid pitch
[00:49:42] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[00:49:42] [PASSED] NV12 different  modifier per-plane
[00:49:42] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[00:49:42] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[00:49:42] [PASSED] NV12 Modifier for inexistent plane
[00:49:42] [PASSED] NV12 Handle for inexistent plane
[00:49:42] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[00:49:42] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[00:49:42] [PASSED] YVU420 Normal sizes
[00:49:42] [PASSED] YVU420 Max sizes
[00:49:42] [PASSED] YVU420 Invalid pitch
[00:49:42] [PASSED] YVU420 Different pitches
[00:49:42] [PASSED] YVU420 Different buffer offsets/pitches
[00:49:42] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[00:49:42] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[00:49:42] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[00:49:42] [PASSED] YVU420 Valid modifier
[00:49:42] [PASSED] YVU420 Different modifiers per plane
[00:49:42] [PASSED] YVU420 Modifier for inexistent plane
[00:49:42] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[00:49:42] [PASSED] X0L2 Normal sizes
[00:49:42] [PASSED] X0L2 Max sizes
[00:49:42] [PASSED] X0L2 Invalid pitch
[00:49:42] [PASSED] X0L2 Pitch greater than minimum required
[00:49:42] [PASSED] X0L2 Handle for inexistent plane
[00:49:42] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[00:49:42] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[00:49:42] [PASSED] X0L2 Valid modifier
[00:49:42] [PASSED] X0L2 Modifier for inexistent plane
[00:49:42] =========== [PASSED] drm_test_framebuffer_create ===========
[00:49:42] [PASSED] drm_test_framebuffer_free
[00:49:42] [PASSED] drm_test_framebuffer_init
[00:49:42] [PASSED] drm_test_framebuffer_init_bad_format
[00:49:42] [PASSED] drm_test_framebuffer_init_dev_mismatch
[00:49:42] [PASSED] drm_test_framebuffer_lookup
[00:49:42] [PASSED] drm_test_framebuffer_lookup_inexistent
[00:49:42] [PASSED] drm_test_framebuffer_modifiers_not_supported
[00:49:42] ================= [PASSED] drm_framebuffer =================
[00:49:42] ================ drm_gem_shmem (8 subtests) ================
[00:49:42] [PASSED] drm_gem_shmem_test_obj_create
[00:49:42] [PASSED] drm_gem_shmem_test_obj_create_private
[00:49:42] [PASSED] drm_gem_shmem_test_pin_pages
[00:49:42] [PASSED] drm_gem_shmem_test_vmap
[00:49:42] [PASSED] drm_gem_shmem_test_get_sg_table
[00:49:42] [PASSED] drm_gem_shmem_test_get_pages_sgt
[00:49:42] [PASSED] drm_gem_shmem_test_madvise
[00:49:42] [PASSED] drm_gem_shmem_test_purge
[00:49:42] ================== [PASSED] drm_gem_shmem ==================
[00:49:42] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[00:49:42] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[00:49:42] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[00:49:42] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[00:49:42] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[00:49:42] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[00:49:42] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[00:49:42] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[00:49:42] [PASSED] Automatic
[00:49:42] [PASSED] Full
[00:49:42] [PASSED] Limited 16:235
[00:49:42] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[00:49:42] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[00:49:42] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[00:49:42] [PASSED] drm_test_check_disable_connector
[00:49:42] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[00:49:42] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[00:49:42] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[00:49:42] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[00:49:42] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[00:49:42] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[00:49:42] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[00:49:42] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[00:49:42] [PASSED] drm_test_check_output_bpc_dvi
[00:49:42] [PASSED] drm_test_check_output_bpc_format_vic_1
[00:49:42] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[00:49:42] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[00:49:42] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[00:49:42] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[00:49:42] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[00:49:42] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[00:49:42] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[00:49:42] ============ drm_test_check_hdmi_color_format  =============
[00:49:42] [PASSED] AUTO -> RGB
[00:49:42] [PASSED] YCBCR422 -> YUV422
[00:49:42] [PASSED] YCBCR420 -> YUV420
[00:49:42] [PASSED] YCBCR444 -> YUV444
[00:49:42] [PASSED] RGB -> RGB
[00:49:42] ======== [PASSED] drm_test_check_hdmi_color_format =========
[00:49:42] ======== drm_test_check_hdmi_color_format_420_only  ========
[00:49:42] [PASSED] RGB should fail
[00:49:42] [PASSED] YUV444 should fail
[00:49:42] [PASSED] YUV422 should fail
[00:49:42] [PASSED] YUV420 should work
[00:49:42] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[00:49:42] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[00:49:42] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[00:49:42] [PASSED] drm_test_check_broadcast_rgb_value
[00:49:42] [PASSED] drm_test_check_bpc_8_value
[00:49:42] [PASSED] drm_test_check_bpc_10_value
[00:49:42] [PASSED] drm_test_check_bpc_12_value
[00:49:42] [PASSED] drm_test_check_format_value
[00:49:42] [PASSED] drm_test_check_tmds_char_value
[00:49:42] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[00:49:42] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[00:49:42] [PASSED] drm_test_check_mode_valid
[00:49:42] [PASSED] drm_test_check_mode_valid_reject
[00:49:42] [PASSED] drm_test_check_mode_valid_reject_rate
[00:49:42] [PASSED] drm_test_check_mode_valid_reject_max_clock
[00:49:42] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[00:49:42] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[00:49:42] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[00:49:42] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[00:49:42] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[00:49:42] [PASSED] drm_test_check_infoframes
[00:49:42] [PASSED] drm_test_check_reject_avi_infoframe
[00:49:42] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[00:49:42] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[00:49:42] [PASSED] drm_test_check_reject_audio_infoframe
[00:49:42] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[00:49:42] ================= drm_managed (2 subtests) =================
[00:49:42] [PASSED] drm_test_managed_release_action
[00:49:42] [PASSED] drm_test_managed_run_action
[00:49:42] =================== [PASSED] drm_managed ===================
[00:49:42] =================== drm_mm (6 subtests) ====================
[00:49:42] [PASSED] drm_test_mm_init
[00:49:42] [PASSED] drm_test_mm_debug
[00:49:42] [PASSED] drm_test_mm_align32
[00:49:42] [PASSED] drm_test_mm_align64
[00:49:42] [PASSED] drm_test_mm_lowest
[00:49:42] [PASSED] drm_test_mm_highest
[00:49:42] ===================== [PASSED] drm_mm ======================
[00:49:42] ============= drm_modes_analog_tv (5 subtests) =============
[00:49:42] [PASSED] drm_test_modes_analog_tv_mono_576i
[00:49:42] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[00:49:42] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[00:49:42] [PASSED] drm_test_modes_analog_tv_pal_576i
[00:49:42] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[00:49:42] =============== [PASSED] drm_modes_analog_tv ===============
[00:49:42] ============== drm_panic_helper (3 subtests) ===============
[00:49:42] ============= drm_test_panic_screen_user_map  ==============
[00:49:42] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[00:49:42] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[00:49:42] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[00:49:42] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[00:49:42] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[00:49:42] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[00:49:42] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[00:49:42] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[00:49:42] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[00:49:42] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[00:49:42] ========= [PASSED] drm_test_panic_screen_user_map ==========
[00:49:42] ============= drm_test_panic_screen_user_page  =============
[00:49:42] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[00:49:42] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[00:49:42] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[00:49:42] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[00:49:42] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[00:49:42] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[00:49:42] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[00:49:42] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[00:49:42] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[00:49:42] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[00:49:42] ========= [PASSED] drm_test_panic_screen_user_page =========
[00:49:42] ========== drm_test_panic_screen_user_set_pixel  ===========
[00:49:42] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[00:49:42] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[00:49:42] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[00:49:42] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[00:49:42] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[00:49:42] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[00:49:42] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[00:49:42] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[00:49:42] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[00:49:42] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[00:49:42] ====== [PASSED] drm_test_panic_screen_user_set_pixel =======
[00:49:42] ================ [PASSED] drm_panic_helper =================
[00:49:42] ============== drm_plane_helper (2 subtests) ===============
[00:49:42] =============== drm_test_check_plane_state  ================
[00:49:42] [PASSED] clipping_simple
[00:49:42] [PASSED] clipping_rotate_reflect
[00:49:42] [PASSED] positioning_simple
[00:49:42] [PASSED] upscaling
[00:49:42] [PASSED] downscaling
[00:49:42] [PASSED] rounding1
[00:49:42] [PASSED] rounding2
[00:49:42] [PASSED] rounding3
[00:49:42] [PASSED] rounding4
[00:49:42] =========== [PASSED] drm_test_check_plane_state ============
[00:49:42] =========== drm_test_check_invalid_plane_state  ============
[00:49:42] [PASSED] positioning_invalid
[00:49:42] [PASSED] upscaling_invalid
[00:49:42] [PASSED] downscaling_invalid
[00:49:42] ======= [PASSED] drm_test_check_invalid_plane_state ========
[00:49:42] ================ [PASSED] drm_plane_helper =================
[00:49:42] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[00:49:42] ====== drm_test_connector_helper_tv_get_modes_check  =======
[00:49:42] [PASSED] None
[00:49:42] [PASSED] PAL
[00:49:42] [PASSED] NTSC
[00:49:42] [PASSED] Both, NTSC Default
[00:49:42] [PASSED] Both, PAL Default
[00:49:42] [PASSED] Both, NTSC Default, with PAL on command-line
[00:49:42] [PASSED] Both, PAL Default, with NTSC on command-line
[00:49:42] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[00:49:42] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[00:49:42] ================== drm_rect (9 subtests) ===================
[00:49:42] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[00:49:42] [PASSED] drm_test_rect_clip_scaled_not_clipped
[00:49:42] [PASSED] drm_test_rect_clip_scaled_clipped
[00:49:42] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[00:49:42] ================= drm_test_rect_intersect  =================
[00:49:42] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[00:49:42] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[00:49:42] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[00:49:42] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[00:49:42] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[00:49:42] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[00:49:42] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[00:49:42] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[00:49:42] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[00:49:42] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[00:49:42] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[00:49:42] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[00:49:42] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[00:49:42] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[00:49:42] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[00:49:42] ============= [PASSED] drm_test_rect_intersect =============
[00:49:42] ================ drm_test_rect_calc_hscale  ================
[00:49:42] [PASSED] normal use
[00:49:42] [PASSED] out of max range
[00:49:42] [PASSED] out of min range
[00:49:42] [PASSED] zero dst
[00:49:42] [PASSED] negative src
[00:49:42] [PASSED] negative dst
[00:49:42] ============ [PASSED] drm_test_rect_calc_hscale ============
[00:49:42] ================ drm_test_rect_calc_vscale  ================
[00:49:42] [PASSED] normal use
[00:49:42] [PASSED] out of max range
[00:49:42] [PASSED] out of min range
[00:49:42] [PASSED] zero dst
[00:49:42] [PASSED] negative src
[00:49:42] [PASSED] negative dst
[00:49:42] ============ [PASSED] drm_test_rect_calc_vscale ============
[00:49:42] ================== drm_test_rect_rotate  ===================
[00:49:42] [PASSED] reflect-x
[00:49:42] [PASSED] reflect-y
[00:49:42] [PASSED] rotate-0
[00:49:42] [PASSED] rotate-90
[00:49:42] [PASSED] rotate-180
[00:49:42] [PASSED] rotate-270
[00:49:42] ============== [PASSED] drm_test_rect_rotate ===============
[00:49:42] ================ drm_test_rect_rotate_inv  =================
[00:49:42] [PASSED] reflect-x
[00:49:42] [PASSED] reflect-y
[00:49:42] [PASSED] rotate-0
[00:49:42] [PASSED] rotate-90
[00:49:42] [PASSED] rotate-180
[00:49:42] [PASSED] rotate-270
[00:49:42] ============ [PASSED] drm_test_rect_rotate_inv =============
[00:49:42] ==================== [PASSED] drm_rect =====================
[00:49:42] ============ drm_sysfb_modeset_test (1 subtest) ============
[00:49:42] ============ drm_test_sysfb_build_fourcc_list  =============
[00:49:42] [PASSED] no native formats
[00:49:42] [PASSED] XRGB8888 as native format
[00:49:42] [PASSED] remove duplicates
[00:49:42] [PASSED] convert alpha formats
[00:49:42] [PASSED] random formats
[00:49:42] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[00:49:42] ============= [PASSED] drm_sysfb_modeset_test ==============
[00:49:42] ================== drm_fixp (2 subtests) ===================
[00:49:42] [PASSED] drm_test_int2fixp
[00:49:42] [PASSED] drm_test_sm2fixp
[00:49:42] ==================== [PASSED] drm_fixp =====================
[00:49:42] ============================================================
[00:49:42] Testing complete. Ran 667 tests: passed: 667
[00:49:42] Elapsed time: 28.161s total, 2.522s configuring, 25.274s building, 0.342s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[00:49:42] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:49:45] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[00:49:55] Starting KUnit Kernel (1/1)...
[00:49:55] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[00:49:55] ================= ttm_device (5 subtests) ==================
[00:49:55] [PASSED] ttm_device_init_basic
[00:49:55] [PASSED] ttm_device_init_multiple
[00:49:55] [PASSED] ttm_device_fini_basic
[00:49:55] [PASSED] ttm_device_init_no_vma_man
[00:49:55] ================== ttm_device_init_pools  ==================
[00:49:55] [PASSED] No DMA allocations, no DMA32 required
[00:49:55] [PASSED] DMA allocations, DMA32 required
[00:49:55] [PASSED] No DMA allocations, DMA32 required
[00:49:55] [PASSED] DMA allocations, no DMA32 required
[00:49:55] ============== [PASSED] ttm_device_init_pools ==============
[00:49:55] =================== [PASSED] ttm_device ====================
[00:49:55] ================== ttm_pool (8 subtests) ===================
[00:49:55] ================== ttm_pool_alloc_basic  ===================
[00:49:55] [PASSED] One page
[00:49:55] [PASSED] More than one page
[00:49:55] [PASSED] Above the allocation limit
[00:49:55] [PASSED] One page, with coherent DMA mappings enabled
[00:49:55] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[00:49:55] ============== [PASSED] ttm_pool_alloc_basic ===============
[00:49:55] ============== ttm_pool_alloc_basic_dma_addr  ==============
[00:49:55] [PASSED] One page
[00:49:55] [PASSED] More than one page
[00:49:55] [PASSED] Above the allocation limit
[00:49:55] [PASSED] One page, with coherent DMA mappings enabled
[00:49:55] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[00:49:55] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[00:49:55] [PASSED] ttm_pool_alloc_order_caching_match
[00:49:55] [PASSED] ttm_pool_alloc_caching_mismatch
[00:49:55] [PASSED] ttm_pool_alloc_order_mismatch
[00:49:55] [PASSED] ttm_pool_free_dma_alloc
[00:49:55] [PASSED] ttm_pool_free_no_dma_alloc
[00:49:55] [ERROR] Test: ttm_pool: missing expected subtest!
[00:49:55] 
[00:49:55] Pid: 80, comm: kunit_try_catch Tainted: G        W        N  7.4.0-rc4-g862aa7778ee9
[00:49:55] RIP: 0033:list_lru_count_node+0xe/0x20
[00:49:55] RSP: 00000000ab0dbef8  EFLAGS: 00010246
[00:49:55] RAX: 0000000000000001 RBX: 00000000ab003c90 RCX: 0000000000000021
[00:49:55] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 000000006b453030
[00:49:55] RBP: 000000006b453000 R08: 00000000ab0dbe98 R09: 0000000000000000
[00:49:55] R10: 00000000a9c98a60 R11: 0000000000000000 R12: 0000000060121160
[00:49:55] R13: 000000006b453030 R14: 000000006046f0e0 R15: 00000000604ba488
[00:49:55] Kernel panic - not syncing: Segfault with no mm
[00:49:55] [CRASHED] 
[00:49:55] [ERROR] Test: ttm_pool: missing subtest result line!
[00:49:55] # module: ttm_pool_test
[00:49:55] ==================== [CRASHED] ttm_pool ====================
[00:49:55] [ERROR] Test: main: missing expected subtest!
[00:49:55] [CRASHED] 
[00:49:55] [ERROR] Test: main: missing expected subtest!
[00:49:55] [CRASHED] 
[00:49:55] [ERROR] Test: main: missing expected subtest!
[00:49:55] [CRASHED] 
[00:49:55] [ERROR] Test: main: missing expected subtest!
[00:49:55] [CRASHED] 
[00:49:55] ============================================================
[00:49:55] Testing complete. Ran 28 tests: passed: 23, crashed: 5, errors: 6
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
[00:49:55] Elapsed time: 12.877s total, 2.540s configuring, 10.022s building, 0.315s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


