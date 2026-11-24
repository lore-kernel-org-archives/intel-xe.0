Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E361A606A322
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 05:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A78310E754;
	Tue, 24 Nov 2026 05:56:12 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA64C10E754;
 Tue, 24 Nov 2026 05:56:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/hwmon=3A_Add_fan_contro?=
 =?utf-8?q?l_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Nov 2026 05:56:10 -0000
Message-ID: <179549977092.74243.10519090423224738572@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261124054811.798763-1-karthik.poosa@intel.com>
In-Reply-To: <20261124054811.798763-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Add fan control support
URL   : https://patchwork.freedesktop.org/series/179435/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[05:54:14] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:54:19] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[05:54:40] Starting KUnit Kernel (1/1)...
[05:54:40] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:54:40] ================= gpu_buddy (15 subtests) ==================
[05:54:40] [PASSED] gpu_test_buddy_alloc_limit
[05:54:40] [PASSED] gpu_test_buddy_alloc_optimistic
[05:54:40] [PASSED] gpu_test_buddy_alloc_pessimistic
[05:54:40] [PASSED] gpu_test_buddy_alloc_pathological
[05:54:40] [PASSED] gpu_test_buddy_alloc_contiguous
[05:54:40] [PASSED] gpu_test_buddy_alloc_clear
[05:54:40] [PASSED] gpu_test_buddy_alloc_range
[05:54:40] [PASSED] gpu_test_buddy_alloc_range_bias
[05:54:40] [PASSED] gpu_test_buddy_alloc_range_clear_guard
[05:54:41] [PASSED] gpu_test_buddy_fragmentation_performance
[05:54:42] [PASSED] gpu_test_buddy_dirty_tracker_performance
[05:54:42] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[05:54:42] [PASSED] gpu_test_buddy_offset_aligned_allocation
[05:54:42] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[05:54:42] [PASSED] gpu_test_buddy_addr_to_block
[05:54:42] ==================== [PASSED] gpu_buddy ====================
[05:54:42] ============================================================
[05:54:42] Testing complete. Ran 15 tests: passed: 15
[05:54:42] Elapsed time: 28.214s total, 5.140s configuring, 20.754s building, 2.239s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[05:54:42] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:54:45] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[05:55:24] Starting KUnit Kernel (1/1)...
[05:55:24] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:55:24] ================= xe_ggtt_iov (9 subtests) =================
[05:55:24] [PASSED] init_shared_pf
[05:55:24] [PASSED] init_partial_overlap
[05:55:24] [PASSED] alloc_usable_pool_low
[05:55:24] [PASSED] alloc_shareable_pool_high
[05:55:24] [PASSED] alloc_partial_overlap
[05:55:24] [PASSED] alloc_partial_overlap_usable_full
[05:55:24] [PASSED] alloc_partial_overlap_shareable_full
[05:55:24] [PASSED] alloc_shareable_pool_unavailable
[05:55:24] [PASSED] alloc_shareable_pool_oversized
[05:55:24] =================== [PASSED] xe_ggtt_iov ===================
[05:55:24] =================== xe_ggtt (3 subtests) ===================
[05:55:24] [PASSED] init_native
[05:55:24] [PASSED] alloc_usable_pool_native
[05:55:24] [PASSED] alloc_usable_pool_oversized
[05:55:24] ===================== [PASSED] xe_ggtt =====================
[05:55:24] ================== guc_buf (11 subtests) ===================
[05:55:24] [PASSED] test_smallest
[05:55:24] [PASSED] test_largest
[05:55:24] [PASSED] test_granular
[05:55:24] [PASSED] test_unique
[05:55:24] [PASSED] test_overlap
[05:55:24] [PASSED] test_reusable
[05:55:24] [PASSED] test_too_big
[05:55:24] [PASSED] test_flush
[05:55:24] [PASSED] test_lookup
[05:55:24] [PASSED] test_data
[05:55:24] [PASSED] test_class
[05:55:24] ===================== [PASSED] guc_buf =====================
[05:55:24] =================== guc_dbm (7 subtests) ===================
[05:55:24] [PASSED] test_empty
[05:55:24] [PASSED] test_default
[05:55:24] ======================== test_size  ========================
[05:55:24] [PASSED] 4
[05:55:24] [PASSED] 8
[05:55:24] [PASSED] 32
[05:55:24] [PASSED] 256
[05:55:24] ==================== [PASSED] test_size ====================
[05:55:24] ======================= test_reuse  ========================
[05:55:24] [PASSED] 4
[05:55:24] [PASSED] 8
[05:55:24] [PASSED] 32
[05:55:24] [PASSED] 256
[05:55:24] =================== [PASSED] test_reuse ====================
[05:55:24] =================== test_range_overlap  ====================
[05:55:24] [PASSED] 4
[05:55:24] [PASSED] 8
[05:55:24] [PASSED] 32
[05:55:24] [PASSED] 256
[05:55:24] =============== [PASSED] test_range_overlap ================
[05:55:24] =================== test_range_compact  ====================
[05:55:24] [PASSED] 4
[05:55:24] [PASSED] 8
[05:55:24] [PASSED] 32
[05:55:24] [PASSED] 256
[05:55:24] =============== [PASSED] test_range_compact ================
[05:55:24] ==================== test_range_spare  =====================
[05:55:24] [PASSED] 4
[05:55:24] [PASSED] 8
[05:55:24] [PASSED] 32
[05:55:24] [PASSED] 256
[05:55:24] ================ [PASSED] test_range_spare =================
[05:55:24] ===================== [PASSED] guc_dbm =====================
[05:55:24] ================== guc_idm (22 subtests) ===================
[05:55:24] [PASSED] bad_init
[05:55:24] [PASSED] no_init
[05:55:24] [PASSED] init_fini
[05:55:24] [PASSED] check_init_small
[05:55:24] [PASSED] check_init_shared
[05:55:24] [PASSED] check_used
[05:55:24] [PASSED] check_quota
[05:55:24] [PASSED] check_all
[05:55:24] [PASSED] check_limits
[05:55:24] [PASSED] check_overlap
[05:55:24] [PASSED] check_overlap_alloc
[05:55:24] [PASSED] check_overlap_release
[05:55:24] [PASSED] check_overlap_partial_init
[05:55:24] [PASSED] check_overlap_partial_shared_range_blocking
[05:55:24] [PASSED] check_used_usable
[05:55:24] [PASSED] check_used_shareable
[05:55:24] [PASSED] check_used_mixed
[05:55:24] [PASSED] check_release_usable_range
[05:55:24] [PASSED] check_release_shareable_range
[05:55:24] [PASSED] check_split_boundaries
[05:55:24] [PASSED] check_shareable_spare
[05:55:24] [PASSED] check_shareable_spare_fragmented_tail
[05:55:24] ===================== [PASSED] guc_idm =====================
[05:55:24] ============== guc_klv_helpers (13 subtests) ===============
[05:55:24] [PASSED] test_count
[05:55:24] [PASSED] test_encode_u32
[05:55:24] [PASSED] test_encode_u64
[05:55:24] [PASSED] test_encode_string
[05:55:24] [PASSED] test_encode_object_raw
[05:55:24] [PASSED] test_encode_object_klv
[05:55:24] [PASSED] test_encode_object_nested
[05:55:24] [PASSED] test_encode_object_basic
[05:55:24] ===================== test_decode_u16  =====================
[05:55:24] [PASSED] empty
[05:55:24] [PASSED] valid
[05:55:24] [PASSED] max
[05:55:24] [PASSED] big
[05:55:24] [PASSED] long
[05:55:24] ================= [PASSED] test_decode_u16 =================
[05:55:24] ===================== test_decode_u32  =====================
[05:55:24] [PASSED] empty
[05:55:24] [PASSED] valid
[05:55:24] [PASSED] max
[05:55:24] [PASSED] long
[05:55:24] ================= [PASSED] test_decode_u32 =================
[05:55:24] ===================== test_decode_u64  =====================
[05:55:24] [PASSED] empty
[05:55:24] [PASSED] short
[05:55:24] [PASSED] valid
[05:55:24] [PASSED] max
[05:55:24] [PASSED] long
[05:55:24] ================= [PASSED] test_decode_u64 =================
[05:55:24] ===================== test_decode_str  =====================
[05:55:24] [PASSED] empty
[05:55:24] [PASSED] one
[05:55:24] [PASSED] one_trash
[05:55:24] [PASSED] two
[05:55:24] [PASSED] two_trash
[05:55:24] [PASSED] three
[05:55:24] [PASSED] dword
[05:55:24] [PASSED] four
[05:55:24] [PASSED] five
[05:55:24] [PASSED] six
[05:55:24] [PASSED] seven
[05:55:24] [PASSED] qword
[05:55:24] ================= [PASSED] test_decode_str =================
[05:55:24] [PASSED] test_print
[05:55:24] ================= [PASSED] guc_klv_helpers =================
[05:55:24] =================== xe_log (4 subtests) ====================
[05:55:24] [PASSED] demo_cper
[05:55:24] [PASSED] demo_dmesg
[05:55:24] ======================= test_dmesg  ========================
[05:55:24] [PASSED] test_fatal
[05:55:24] [PASSED] test_fatal_tile
[05:55:24] [PASSED] test_fatal_gt
[05:55:24] [PASSED] test_fatal_comp
[05:55:24] [PASSED] test_fatal_comp_tile
[05:55:24] [PASSED] test_fatal_comp_gt
[05:55:24] [PASSED] test_fatal_all
[05:55:24] [PASSED] test_recoverable
[05:55:24] [PASSED] test_recoverable_tile
[05:55:24] [PASSED] test_recoverable_gt
[05:55:24] [PASSED] test_recoverable_comp
[05:55:24] [PASSED] test_recoverable_comp_tile
[05:55:24] [PASSED] test_recoverable_comp_gt
[05:55:24] [PASSED] test_recoverable_all
[05:55:24] [PASSED] test_info
[05:55:24] [PASSED] test_info_tile
[05:55:24] [PASSED] test_info_gt
[05:55:24] [PASSED] test_info_err
[05:55:24] [PASSED] test_info_comp
[05:55:24] [PASSED] test_info_comp_tile
[05:55:24] [PASSED] test_info_comp_gt
[05:55:24] [PASSED] test_info_all
[05:55:24] [PASSED] test_hw_fatal
[05:55:24] [PASSED] test_hw_recoverable
[05:55:24] [PASSED] test_hw_corrected
[05:55:24] [PASSED] test_hw_informational
[05:55:24] =================== [PASSED] test_dmesg ====================
[05:55:24] ====================== test_invalid  =======================
[05:55:24] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[05:55:24] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[05:55:24] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[05:55:24] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[05:55:24] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[05:55:24] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[05:55:24] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[05:55:24] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[05:55:24] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[05:55:24] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[05:55:24] ================== [SKIPPED] test_invalid ==================
[05:55:24] ===================== [PASSED] xe_log ======================
[05:55:24] ================== no_relay (3 subtests) ===================
[05:55:24] [PASSED] xe_drops_guc2pf_if_not_ready
[05:55:24] [PASSED] xe_drops_guc2vf_if_not_ready
[05:55:24] [PASSED] xe_rejects_send_if_not_ready
[05:55:24] ==================== [PASSED] no_relay =====================
[05:55:24] ================== pf_relay (14 subtests) ==================
[05:55:24] [PASSED] pf_rejects_guc2pf_too_short
[05:55:24] [PASSED] pf_rejects_guc2pf_too_long
[05:55:24] [PASSED] pf_rejects_guc2pf_no_payload
[05:55:24] [PASSED] pf_fails_no_payload
[05:55:24] [PASSED] pf_fails_bad_origin
[05:55:24] [PASSED] pf_fails_bad_type
[05:55:24] [PASSED] pf_txn_reports_error
[05:55:24] [PASSED] pf_txn_sends_pf2guc
[05:55:24] [PASSED] pf_sends_pf2guc
[05:55:24] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[05:55:24] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[05:55:24] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[05:55:24] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[05:55:24] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[05:55:24] ==================== [PASSED] pf_relay =====================
[05:55:24] ================== vf_relay (3 subtests) ===================
[05:55:24] [PASSED] vf_rejects_guc2vf_too_short
[05:55:24] [PASSED] vf_rejects_guc2vf_too_long
[05:55:24] [PASSED] vf_rejects_guc2vf_no_payload
[05:55:24] ==================== [PASSED] vf_relay =====================
[05:55:24] ================ pf_gt_config (9 subtests) =================
[05:55:24] [PASSED] fair_contexts_1vf
[05:55:24] [PASSED] fair_doorbells_1vf
[05:55:24] [PASSED] fair_ggtt_1vf
[05:55:24] ====================== fair_vram_1vf  ======================
[05:55:24] [PASSED] 3.50 GiB
[05:55:24] [PASSED] 11.5 GiB
[05:55:24] [PASSED] 15.5 GiB
[05:55:24] [PASSED] 31.5 GiB
[05:55:24] [PASSED] 63.5 GiB
[05:55:24] [PASSED] 1.91 GiB
[05:55:24] ================== [PASSED] fair_vram_1vf ==================
[05:55:24] ================ fair_vram_1vf_admin_only  =================
[05:55:24] [PASSED] 3.50 GiB
[05:55:24] [PASSED] 11.5 GiB
[05:55:24] [PASSED] 15.5 GiB
[05:55:24] [PASSED] 31.5 GiB
[05:55:24] [PASSED] 63.5 GiB
[05:55:24] [PASSED] 1.91 GiB
[05:55:24] ============ [PASSED] fair_vram_1vf_admin_only =============
[05:55:24] ====================== fair_contexts  ======================
[05:55:24] [PASSED] 1 VF
[05:55:24] [PASSED] 2 VFs
[05:55:24] [PASSED] 3 VFs
[05:55:24] [PASSED] 4 VFs
[05:55:24] [PASSED] 5 VFs
[05:55:24] [PASSED] 6 VFs
[05:55:24] [PASSED] 7 VFs
[05:55:24] [PASSED] 8 VFs
[05:55:24] [PASSED] 9 VFs
[05:55:24] [PASSED] 10 VFs
[05:55:24] [PASSED] 11 VFs
[05:55:24] [PASSED] 12 VFs
[05:55:24] [PASSED] 13 VFs
[05:55:24] [PASSED] 14 VFs
[05:55:24] [PASSED] 15 VFs
[05:55:24] [PASSED] 16 VFs
[05:55:24] [PASSED] 17 VFs
[05:55:24] [PASSED] 18 VFs
[05:55:24] [PASSED] 19 VFs
[05:55:24] [PASSED] 20 VFs
[05:55:24] [PASSED] 21 VFs
[05:55:24] [PASSED] 22 VFs
[05:55:24] [PASSED] 23 VFs
[05:55:24] [PASSED] 24 VFs
[05:55:24] [PASSED] 25 VFs
[05:55:24] [PASSED] 26 VFs
[05:55:24] [PASSED] 27 VFs
[05:55:24] [PASSED] 28 VFs
[05:55:24] [PASSED] 29 VFs
[05:55:24] [PASSED] 30 VFs
[05:55:24] [PASSED] 31 VFs
[05:55:24] [PASSED] 32 VFs
[05:55:24] [PASSED] 33 VFs
[05:55:24] [PASSED] 34 VFs
[05:55:24] [PASSED] 35 VFs
[05:55:24] [PASSED] 36 VFs
[05:55:24] [PASSED] 37 VFs
[05:55:24] [PASSED] 38 VFs
[05:55:24] [PASSED] 39 VFs
[05:55:24] [PASSED] 40 VFs
[05:55:24] [PASSED] 41 VFs
[05:55:24] [PASSED] 42 VFs
[05:55:24] [PASSED] 43 VFs
[05:55:24] [PASSED] 44 VFs
[05:55:24] [PASSED] 45 VFs
[05:55:24] [PASSED] 46 VFs
[05:55:24] [PASSED] 47 VFs
[05:55:24] [PASSED] 48 VFs
[05:55:24] [PASSED] 49 VFs
[05:55:24] [PASSED] 50 VFs
[05:55:24] [PASSED] 51 VFs
[05:55:24] [PASSED] 52 VFs
[05:55:24] [PASSED] 53 VFs
[05:55:24] [PASSED] 54 VFs
[05:55:24] [PASSED] 55 VFs
[05:55:24] [PASSED] 56 VFs
[05:55:24] [PASSED] 57 VFs
[05:55:24] [PASSED] 58 VFs
[05:55:24] [PASSED] 59 VFs
[05:55:24] [PASSED] 60 VFs
[05:55:24] [PASSED] 61 VFs
[05:55:24] [PASSED] 62 VFs
[05:55:24] [PASSED] 63 VFs
[05:55:24] ================== [PASSED] fair_contexts ==================
[05:55:24] ===================== fair_doorbells  ======================
[05:55:24] [PASSED] 1 VF
[05:55:24] [PASSED] 2 VFs
[05:55:24] [PASSED] 3 VFs
[05:55:24] [PASSED] 4 VFs
[05:55:24] [PASSED] 5 VFs
[05:55:24] [PASSED] 6 VFs
[05:55:24] [PASSED] 7 VFs
[05:55:24] [PASSED] 8 VFs
[05:55:24] [PASSED] 9 VFs
[05:55:24] [PASSED] 10 VFs
[05:55:24] [PASSED] 11 VFs
[05:55:24] [PASSED] 12 VFs
[05:55:24] [PASSED] 13 VFs
[05:55:24] [PASSED] 14 VFs
[05:55:24] [PASSED] 15 VFs
[05:55:24] [PASSED] 16 VFs
[05:55:24] [PASSED] 17 VFs
[05:55:24] [PASSED] 18 VFs
[05:55:24] [PASSED] 19 VFs
[05:55:24] [PASSED] 20 VFs
[05:55:24] [PASSED] 21 VFs
[05:55:24] [PASSED] 22 VFs
[05:55:25] [PASSED] 23 VFs
[05:55:25] [PASSED] 24 VFs
[05:55:25] [PASSED] 25 VFs
[05:55:25] [PASSED] 26 VFs
[05:55:25] [PASSED] 27 VFs
[05:55:25] [PASSED] 28 VFs
[05:55:25] [PASSED] 29 VFs
[05:55:25] [PASSED] 30 VFs
[05:55:25] [PASSED] 31 VFs
[05:55:25] [PASSED] 32 VFs
[05:55:25] [PASSED] 33 VFs
[05:55:25] [PASSED] 34 VFs
[05:55:25] [PASSED] 35 VFs
[05:55:25] [PASSED] 36 VFs
[05:55:25] [PASSED] 37 VFs
[05:55:25] [PASSED] 38 VFs
[05:55:25] [PASSED] 39 VFs
[05:55:25] [PASSED] 40 VFs
[05:55:25] [PASSED] 41 VFs
[05:55:25] [PASSED] 42 VFs
[05:55:25] [PASSED] 43 VFs
[05:55:25] [PASSED] 44 VFs
[05:55:25] [PASSED] 45 VFs
[05:55:25] [PASSED] 46 VFs
[05:55:25] [PASSED] 47 VFs
[05:55:25] [PASSED] 48 VFs
[05:55:25] [PASSED] 49 VFs
[05:55:25] [PASSED] 50 VFs
[05:55:25] [PASSED] 51 VFs
[05:55:25] [PASSED] 52 VFs
[05:55:25] [PASSED] 53 VFs
[05:55:25] [PASSED] 54 VFs
[05:55:25] [PASSED] 55 VFs
[05:55:25] [PASSED] 56 VFs
[05:55:25] [PASSED] 57 VFs
[05:55:25] [PASSED] 58 VFs
[05:55:25] [PASSED] 59 VFs
[05:55:25] [PASSED] 60 VFs
[05:55:25] [PASSED] 61 VFs
[05:55:25] [PASSED] 62 VFs
[05:55:25] [PASSED] 63 VFs
[05:55:25] ================= [PASSED] fair_doorbells ==================
[05:55:25] ======================== fair_ggtt  ========================
[05:55:25] [PASSED] 1 VF
[05:55:25] [PASSED] 2 VFs
[05:55:25] [PASSED] 3 VFs
[05:55:25] [PASSED] 4 VFs
[05:55:25] [PASSED] 5 VFs
[05:55:25] [PASSED] 6 VFs
[05:55:25] [PASSED] 7 VFs
[05:55:25] [PASSED] 8 VFs
[05:55:25] [PASSED] 9 VFs
[05:55:25] [PASSED] 10 VFs
[05:55:25] [PASSED] 11 VFs
[05:55:25] [PASSED] 12 VFs
[05:55:25] [PASSED] 13 VFs
[05:55:25] [PASSED] 14 VFs
[05:55:25] [PASSED] 15 VFs
[05:55:25] [PASSED] 16 VFs
[05:55:25] [PASSED] 17 VFs
[05:55:25] [PASSED] 18 VFs
[05:55:25] [PASSED] 19 VFs
[05:55:25] [PASSED] 20 VFs
[05:55:25] [PASSED] 21 VFs
[05:55:25] [PASSED] 22 VFs
[05:55:25] [PASSED] 23 VFs
[05:55:25] [PASSED] 24 VFs
[05:55:25] [PASSED] 25 VFs
[05:55:25] [PASSED] 26 VFs
[05:55:25] [PASSED] 27 VFs
[05:55:25] [PASSED] 28 VFs
[05:55:25] [PASSED] 29 VFs
[05:55:25] [PASSED] 30 VFs
[05:55:25] [PASSED] 31 VFs
[05:55:25] [PASSED] 32 VFs
[05:55:25] [PASSED] 33 VFs
[05:55:25] [PASSED] 34 VFs
[05:55:25] [PASSED] 35 VFs
[05:55:25] [PASSED] 36 VFs
[05:55:25] [PASSED] 37 VFs
[05:55:25] [PASSED] 38 VFs
[05:55:25] [PASSED] 39 VFs
[05:55:25] [PASSED] 40 VFs
[05:55:25] [PASSED] 41 VFs
[05:55:25] [PASSED] 42 VFs
[05:55:25] [PASSED] 43 VFs
[05:55:25] [PASSED] 44 VFs
[05:55:25] [PASSED] 45 VFs
[05:55:25] [PASSED] 46 VFs
[05:55:25] [PASSED] 47 VFs
[05:55:25] [PASSED] 48 VFs
[05:55:25] [PASSED] 49 VFs
[05:55:25] [PASSED] 50 VFs
[05:55:25] [PASSED] 51 VFs
[05:55:25] [PASSED] 52 VFs
[05:55:25] [PASSED] 53 VFs
[05:55:25] [PASSED] 54 VFs
[05:55:25] [PASSED] 55 VFs
[05:55:25] [PASSED] 56 VFs
[05:55:25] [PASSED] 57 VFs
[05:55:25] [PASSED] 58 VFs
[05:55:25] [PASSED] 59 VFs
[05:55:25] [PASSED] 60 VFs
[05:55:25] [PASSED] 61 VFs
[05:55:25] [PASSED] 62 VFs
[05:55:25] [PASSED] 63 VFs
[05:55:25] ==================== [PASSED] fair_ggtt ====================
[05:55:25] ======================== fair_vram  ========================
[05:55:25] [PASSED] 1 VF
[05:55:25] [PASSED] 2 VFs
[05:55:25] [PASSED] 3 VFs
[05:55:25] [PASSED] 4 VFs
[05:55:25] [PASSED] 5 VFs
[05:55:25] [PASSED] 6 VFs
[05:55:25] [PASSED] 7 VFs
[05:55:25] [PASSED] 8 VFs
[05:55:25] [PASSED] 9 VFs
[05:55:25] [PASSED] 10 VFs
[05:55:25] [PASSED] 11 VFs
[05:55:25] [PASSED] 12 VFs
[05:55:25] [PASSED] 13 VFs
[05:55:25] [PASSED] 14 VFs
[05:55:25] [PASSED] 15 VFs
[05:55:25] [PASSED] 16 VFs
[05:55:25] [PASSED] 17 VFs
[05:55:25] [PASSED] 18 VFs
[05:55:25] [PASSED] 19 VFs
[05:55:25] [PASSED] 20 VFs
[05:55:25] [PASSED] 21 VFs
[05:55:25] [PASSED] 22 VFs
[05:55:25] [PASSED] 23 VFs
[05:55:25] [PASSED] 24 VFs
[05:55:25] [PASSED] 25 VFs
[05:55:25] [PASSED] 26 VFs
[05:55:25] [PASSED] 27 VFs
[05:55:25] [PASSED] 28 VFs
[05:55:25] [PASSED] 29 VFs
[05:55:25] [PASSED] 30 VFs
[05:55:25] [PASSED] 31 VFs
[05:55:25] [PASSED] 32 VFs
[05:55:25] [PASSED] 33 VFs
[05:55:25] [PASSED] 34 VFs
[05:55:25] [PASSED] 35 VFs
[05:55:25] [PASSED] 36 VFs
[05:55:25] [PASSED] 37 VFs
[05:55:25] [PASSED] 38 VFs
[05:55:25] [PASSED] 39 VFs
[05:55:25] [PASSED] 40 VFs
[05:55:25] [PASSED] 41 VFs
[05:55:25] [PASSED] 42 VFs
[05:55:25] [PASSED] 43 VFs
[05:55:25] [PASSED] 44 VFs
[05:55:25] [PASSED] 45 VFs
[05:55:25] [PASSED] 46 VFs
[05:55:25] [PASSED] 47 VFs
[05:55:25] [PASSED] 48 VFs
[05:55:25] [PASSED] 49 VFs
[05:55:25] [PASSED] 50 VFs
[05:55:25] [PASSED] 51 VFs
[05:55:25] [PASSED] 52 VFs
[05:55:25] [PASSED] 53 VFs
[05:55:25] [PASSED] 54 VFs
[05:55:25] [PASSED] 55 VFs
[05:55:25] [PASSED] 56 VFs
[05:55:25] [PASSED] 57 VFs
[05:55:25] [PASSED] 58 VFs
[05:55:25] [PASSED] 59 VFs
[05:55:25] [PASSED] 60 VFs
[05:55:25] [PASSED] 61 VFs
[05:55:25] [PASSED] 62 VFs
[05:55:25] [PASSED] 63 VFs
[05:55:25] ==================== [PASSED] fair_vram ====================
[05:55:25] ================== [PASSED] pf_gt_config ===================
[05:55:25] ===================== lmtt (1 subtest) =====================
[05:55:25] ======================== test_ops  =========================
[05:55:25] [PASSED] 2-level
[05:55:25] [PASSED] multi-level
[05:55:25] ==================== [PASSED] test_ops =====================
[05:55:25] ====================== [PASSED] lmtt =======================
[05:55:25] ================= sriov_packet (1 subtest) =================
[05:55:25] [PASSED] test_descriptor_init
[05:55:25] ================== [PASSED] sriov_packet ===================
[05:55:25] ================= pf_service (11 subtests) =================
[05:55:25] [PASSED] pf_negotiate_any
[05:55:25] [PASSED] pf_negotiate_base_match
[05:55:25] [PASSED] pf_negotiate_base_newer
[05:55:25] [PASSED] pf_negotiate_base_next
[05:55:25] [SKIPPED] pf_negotiate_base_older (no older minor)
[05:55:25] [PASSED] pf_negotiate_base_prev
[05:55:25] [PASSED] pf_negotiate_latest_match
[05:55:25] [PASSED] pf_negotiate_latest_newer
[05:55:25] [PASSED] pf_negotiate_latest_next
[05:55:25] [SKIPPED] pf_negotiate_latest_older (no older minor)
[05:55:25] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[05:55:25] =================== [PASSED] pf_service ====================
[05:55:25] ================= xe_guc_g2g (2 subtests) ==================
[05:55:25] ============== xe_live_guc_g2g_kunit_default  ==============
[05:55:25] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[05:55:25] ============== xe_live_guc_g2g_kunit_allmem  ===============
[05:55:25] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[05:55:25] =================== [SKIPPED] xe_guc_g2g ===================
[05:55:25] =================== xe_mocs (2 subtests) ===================
[05:55:25] ================ xe_live_mocs_kernel_kunit  ================
[05:55:25] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[05:55:25] ================ xe_live_mocs_reset_kunit  =================
[05:55:25] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[05:55:25] ==================== [SKIPPED] xe_mocs =====================
[05:55:25] ================= xe_migrate (3 subtests) ==================
[05:55:25] ================= xe_migrate_sanity_kunit  =================
[05:55:25] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[05:55:25] ================== xe_validate_ccs_kunit  ==================
[05:55:25] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[05:55:25] ============= xe_migrate_access_memory_kunit  ==============
[05:55:25] ========= [SKIPPED] xe_migrate_access_memory_kunit =========
[05:55:25] =================== [SKIPPED] xe_migrate ===================
[05:55:25] ================== xe_dma_buf (1 subtest) ==================
[05:55:25] ==================== xe_dma_buf_kunit  =====================
[05:55:25] ================ [SKIPPED] xe_dma_buf_kunit ================
[05:55:25] =================== [SKIPPED] xe_dma_buf ===================
[05:55:25] ================= xe_bo_shrink (1 subtest) =================
[05:55:25] =================== xe_bo_shrink_kunit  ====================
[05:55:25] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[05:55:25] ================== [SKIPPED] xe_bo_shrink ==================
[05:55:25] ==================== xe_bo (2 subtests) ====================
[05:55:25] ================== xe_ccs_migrate_kunit  ===================
[05:55:25] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[05:55:25] ==================== xe_bo_evict_kunit  ====================
[05:55:25] =============== [SKIPPED] xe_bo_evict_kunit ================
[05:55:25] ===================== [SKIPPED] xe_bo ======================
[05:55:25] =================== xe_any (9 subtests) ====================
[05:55:25] [PASSED] test_to_xe
[05:55:25] [PASSED] test_to_dev
[05:55:25] [PASSED] test_to_pdev
[05:55:25] [PASSED] test_to_drm
[05:55:25] [PASSED] test_if_pdev
[05:55:25] [PASSED] test_if_xe
[05:55:25] [PASSED] test_if_tile
[05:55:25] [PASSED] test_if_gt
[05:55:25] [PASSED] test_to_id
[05:55:25] ===================== [PASSED] xe_any ======================
[05:55:25] ==================== args (13 subtests) ====================
[05:55:25] [PASSED] count_args_test
[05:55:25] [PASSED] call_args_example
[05:55:25] [PASSED] call_args_test
[05:55:25] [PASSED] drop_first_arg_example
[05:55:25] [PASSED] drop_first_arg_test
[05:55:25] [PASSED] first_arg_example
[05:55:25] [PASSED] first_arg_test
[05:55:25] [PASSED] last_arg_example
[05:55:25] [PASSED] last_arg_test
[05:55:25] [PASSED] pick_arg_example
[05:55:25] [PASSED] if_args_example
[05:55:25] [PASSED] if_args_test
[05:55:25] [PASSED] sep_comma_example
[05:55:25] ====================== [PASSED] args =======================
[05:55:25] =================== xe_pci (3 subtests) ====================
[05:55:25] ==================== check_graphics_ip  ====================
[05:55:25] [PASSED] 12.00 Xe_LP
[05:55:25] [PASSED] 12.10 Xe_LP+
[05:55:25] [PASSED] 12.55 Xe_HPG
[05:55:25] [PASSED] 12.60 Xe_HPC
[05:55:25] [PASSED] 12.70 Xe_LPG
[05:55:25] [PASSED] 12.71 Xe_LPG
[05:55:25] [PASSED] 12.74 Xe_LPG+
[05:55:25] [PASSED] 20.01 Xe2_HPG
[05:55:25] [PASSED] 20.02 Xe2_HPG
[05:55:25] [PASSED] 20.04 Xe2_LPG
[05:55:25] [PASSED] 30.00 Xe3_LPG
[05:55:25] [PASSED] 30.01 Xe3_LPG
[05:55:25] [PASSED] 30.03 Xe3_LPG
[05:55:25] [PASSED] 30.04 Xe3_LPG
[05:55:25] [PASSED] 30.05 Xe3_LPG
[05:55:25] [PASSED] 35.10 Xe3p_LPG
[05:55:25] [PASSED] 35.11 Xe3p_XPC
[05:55:25] ================ [PASSED] check_graphics_ip ================
[05:55:25] ===================== check_media_ip  ======================
[05:55:25] [PASSED] 12.00 Xe_M
[05:55:25] [PASSED] 12.55 Xe_HPM
[05:55:25] [PASSED] 13.00 Xe_LPM+
[05:55:25] [PASSED] 13.01 Xe2_HPM
[05:55:25] [PASSED] 20.00 Xe2_LPM
[05:55:25] [PASSED] 30.00 Xe3_LPM
[05:55:25] [PASSED] 30.02 Xe3_LPM
[05:55:25] [PASSED] 35.00 Xe3p_LPM
[05:55:25] [PASSED] 35.03 Xe3p_HPM
[05:55:25] ================= [PASSED] check_media_ip ==================
[05:55:25] =================== check_platform_desc  ===================
[05:55:25] [PASSED] 0x9A60 (TIGERLAKE)
[05:55:25] [PASSED] 0x9A68 (TIGERLAKE)
[05:55:25] [PASSED] 0x9A70 (TIGERLAKE)
[05:55:25] [PASSED] 0x9A40 (TIGERLAKE)
[05:55:25] [PASSED] 0x9A49 (TIGERLAKE)
[05:55:25] [PASSED] 0x9A59 (TIGERLAKE)
[05:55:25] [PASSED] 0x9A78 (TIGERLAKE)
[05:55:25] [PASSED] 0x9AC0 (TIGERLAKE)
[05:55:25] [PASSED] 0x9AC9 (TIGERLAKE)
[05:55:25] [PASSED] 0x9AD9 (TIGERLAKE)
[05:55:25] [PASSED] 0x9AF8 (TIGERLAKE)
[05:55:25] [PASSED] 0x4C80 (ROCKETLAKE)
[05:55:25] [PASSED] 0x4C8A (ROCKETLAKE)
[05:55:25] [PASSED] 0x4C8B (ROCKETLAKE)
[05:55:25] [PASSED] 0x4C8C (ROCKETLAKE)
[05:55:25] [PASSED] 0x4C90 (ROCKETLAKE)
[05:55:25] [PASSED] 0x4C9A (ROCKETLAKE)
[05:55:25] [PASSED] 0x4680 (ALDERLAKE_S)
[05:55:25] [PASSED] 0x4682 (ALDERLAKE_S)
[05:55:25] [PASSED] 0x4688 (ALDERLAKE_S)
[05:55:25] [PASSED] 0x468A (ALDERLAKE_S)
[05:55:25] [PASSED] 0x468B (ALDERLAKE_S)
[05:55:25] [PASSED] 0x4690 (ALDERLAKE_S)
[05:55:25] [PASSED] 0x4692 (ALDERLAKE_S)
[05:55:25] [PASSED] 0x4693 (ALDERLAKE_S)
[05:55:25] [PASSED] 0x46A0 (ALDERLAKE_P)
[05:55:25] [PASSED] 0x46A1 (ALDERLAKE_P)
[05:55:25] [PASSED] 0x46A2 (ALDERLAKE_P)
[05:55:25] [PASSED] 0x46A3 (ALDERLAKE_P)
[05:55:25] [PASSED] 0x46A6 (ALDERLAKE_P)
[05:55:25] [PASSED] 0x46A8 (ALDERLAKE_P)
[05:55:25] [PASSED] 0x46AA (ALDERLAKE_P)
[05:55:25] [PASSED] 0x462A (ALDERLAKE_P)
[05:55:25] [PASSED] 0x4626 (ALDERLAKE_P)
[05:55:25] [PASSED] 0x4628 (ALDERLAKE_P)
[05:55:25] [PASSED] 0x46B0 (ALDERLAKE_P)
[05:55:25] [PASSED] 0x46B1 (ALDERLAKE_P)
[05:55:25] [PASSED] 0x46B2 (ALDERLAKE_P)
[05:55:25] [PASSED] 0x46B3 (ALDERLAKE_P)
[05:55:25] [PASSED] 0x46C0 (ALDERLAKE_P)
[05:55:25] [PASSED] 0x46C1 (ALDERLAKE_P)
[05:55:25] [PASSED] 0x46C2 (ALDERLAKE_P)
[05:55:25] [PASSED] 0x46C3 (ALDERLAKE_P)
[05:55:25] [PASSED] 0x46D0 (ALDERLAKE_N)
[05:55:25] [PASSED] 0x46D1 (ALDERLAKE_N)
[05:55:25] [PASSED] 0x46D2 (ALDERLAKE_N)
[05:55:25] [PASSED] 0x46D3 (ALDERLAKE_N)
[05:55:25] [PASSED] 0x46D4 (ALDERLAKE_N)
[05:55:25] [PASSED] 0xA721 (ALDERLAKE_P)
[05:55:25] [PASSED] 0xA7A1 (ALDERLAKE_P)
[05:55:25] [PASSED] 0xA7A9 (ALDERLAKE_P)
[05:55:25] [PASSED] 0xA7AC (ALDERLAKE_P)
[05:55:25] [PASSED] 0xA7AD (ALDERLAKE_P)
[05:55:25] [PASSED] 0xA720 (ALDERLAKE_P)
[05:55:25] [PASSED] 0xA7A0 (ALDERLAKE_P)
[05:55:25] [PASSED] 0xA7A8 (ALDERLAKE_P)
[05:55:25] [PASSED] 0xA7AA (ALDERLAKE_P)
[05:55:25] [PASSED] 0xA7AB (ALDERLAKE_P)
[05:55:25] [PASSED] 0xA780 (ALDERLAKE_S)
[05:55:25] [PASSED] 0xA781 (ALDERLAKE_S)
[05:55:25] [PASSED] 0xA782 (ALDERLAKE_S)
[05:55:25] [PASSED] 0xA783 (ALDERLAKE_S)
[05:55:25] [PASSED] 0xA788 (ALDERLAKE_S)
[05:55:25] [PASSED] 0xA789 (ALDERLAKE_S)
[05:55:25] [PASSED] 0xA78A (ALDERLAKE_S)
[05:55:25] [PASSED] 0xA78B (ALDERLAKE_S)
[05:55:25] [PASSED] 0x4905 (DG1)
[05:55:25] [PASSED] 0x4906 (DG1)
[05:55:25] [PASSED] 0x4907 (DG1)
[05:55:25] [PASSED] 0x4908 (DG1)
[05:55:25] [PASSED] 0x4909 (DG1)
[05:55:25] [PASSED] 0x56C0 (DG2)
[05:55:25] [PASSED] 0x56C2 (DG2)
[05:55:25] [PASSED] 0x56C1 (DG2)
[05:55:25] [PASSED] 0x7D51 (METEORLAKE)
[05:55:25] [PASSED] 0x7DD1 (METEORLAKE)
[05:55:25] [PASSED] 0x7D41 (METEORLAKE)
[05:55:25] [PASSED] 0x7D67 (METEORLAKE)
[05:55:25] [PASSED] 0xB640 (METEORLAKE)
[05:55:25] [PASSED] 0x56A0 (DG2)
[05:55:25] [PASSED] 0x56A1 (DG2)
[05:55:25] [PASSED] 0x56A2 (DG2)
[05:55:25] [PASSED] 0x56BE (DG2)
[05:55:25] [PASSED] 0x56BF (DG2)
[05:55:25] [PASSED] 0x5690 (DG2)
[05:55:25] [PASSED] 0x5691 (DG2)
[05:55:25] [PASSED] 0x5692 (DG2)
[05:55:25] [PASSED] 0x56A5 (DG2)
[05:55:25] [PASSED] 0x56A6 (DG2)
[05:55:25] [PASSED] 0x56B0 (DG2)
[05:55:25] [PASSED] 0x56B1 (DG2)
[05:55:25] [PASSED] 0x56BA (DG2)
[05:55:25] [PASSED] 0x56BB (DG2)
[05:55:25] [PASSED] 0x56BC (DG2)
[05:55:25] [PASSED] 0x56BD (DG2)
[05:55:25] [PASSED] 0x5693 (DG2)
[05:55:25] [PASSED] 0x5694 (DG2)
[05:55:25] [PASSED] 0x5695 (DG2)
[05:55:25] [PASSED] 0x56A3 (DG2)
[05:55:25] [PASSED] 0x56A4 (DG2)
[05:55:25] [PASSED] 0x56B2 (DG2)
[05:55:25] [PASSED] 0x56B3 (DG2)
[05:55:25] [PASSED] 0x5696 (DG2)
[05:55:25] [PASSED] 0x5697 (DG2)
[05:55:25] [PASSED] 0xB69 (PVC)
[05:55:25] [PASSED] 0xB6E (PVC)
[05:55:25] [PASSED] 0xBD4 (PVC)
[05:55:25] [PASSED] 0xBD5 (PVC)
[05:55:25] [PASSED] 0xBD6 (PVC)
[05:55:25] [PASSED] 0xBD7 (PVC)
[05:55:25] [PASSED] 0xBD8 (PVC)
[05:55:25] [PASSED] 0xBD9 (PVC)
[05:55:25] [PASSED] 0xBDA (PVC)
[05:55:25] [PASSED] 0xBDB (PVC)
[05:55:25] [PASSED] 0xBE0 (PVC)
[05:55:25] [PASSED] 0xBE1 (PVC)
[05:55:25] [PASSED] 0xBE5 (PVC)
[05:55:25] [PASSED] 0x7D40 (METEORLAKE)
[05:55:25] [PASSED] 0x7D45 (METEORLAKE)
[05:55:25] [PASSED] 0x7D55 (METEORLAKE)
[05:55:25] [PASSED] 0x7D60 (METEORLAKE)
[05:55:25] [PASSED] 0x7DD5 (METEORLAKE)
[05:55:25] [PASSED] 0x6420 (LUNARLAKE)
[05:55:25] [PASSED] 0x64A0 (LUNARLAKE)
[05:55:25] [PASSED] 0x64B0 (LUNARLAKE)
[05:55:25] [PASSED] 0xE202 (BATTLEMAGE)
[05:55:25] [PASSED] 0xE209 (BATTLEMAGE)
[05:55:25] [PASSED] 0xE20B (BATTLEMAGE)
[05:55:25] [PASSED] 0xE20C (BATTLEMAGE)
[05:55:25] [PASSED] 0xE20D (BATTLEMAGE)
[05:55:25] [PASSED] 0xE210 (BATTLEMAGE)
[05:55:25] [PASSED] 0xE211 (BATTLEMAGE)
[05:55:25] [PASSED] 0xE212 (BATTLEMAGE)
[05:55:25] [PASSED] 0xE216 (BATTLEMAGE)
[05:55:25] [PASSED] 0xE220 (BATTLEMAGE)
[05:55:25] [PASSED] 0xE221 (BATTLEMAGE)
[05:55:25] [PASSED] 0xE222 (BATTLEMAGE)
[05:55:25] [PASSED] 0xE223 (BATTLEMAGE)
[05:55:25] [PASSED] 0xB080 (PANTHERLAKE)
[05:55:25] [PASSED] 0xB081 (PANTHERLAKE)
[05:55:25] [PASSED] 0xB082 (PANTHERLAKE)
[05:55:25] [PASSED] 0xB083 (PANTHERLAKE)
[05:55:25] [PASSED] 0xB084 (PANTHERLAKE)
[05:55:25] [PASSED] 0xB085 (PANTHERLAKE)
[05:55:25] [PASSED] 0xB086 (PANTHERLAKE)
[05:55:25] [PASSED] 0xB087 (PANTHERLAKE)
[05:55:25] [PASSED] 0xB08F (PANTHERLAKE)
[05:55:25] [PASSED] 0xB090 (PANTHERLAKE)
[05:55:25] [PASSED] 0xB0A0 (PANTHERLAKE)
[05:55:25] [PASSED] 0xB0A1 (PANTHERLAKE)
[05:55:25] [PASSED] 0xB0B0 (PANTHERLAKE)
[05:55:25] [PASSED] 0xFD80 (PANTHERLAKE)
[05:55:25] [PASSED] 0xFD81 (PANTHERLAKE)
[05:55:25] [PASSED] 0xD740 (NOVALAKE_S)
[05:55:25] [PASSED] 0xD741 (NOVALAKE_S)
[05:55:25] [PASSED] 0xD742 (NOVALAKE_S)
[05:55:25] [PASSED] 0xD743 (NOVALAKE_S)
[05:55:25] [PASSED] 0xD745 (NOVALAKE_S)
[05:55:25] [PASSED] 0xD74A (NOVALAKE_S)
[05:55:25] [PASSED] 0xD74B (NOVALAKE_S)
[05:55:25] [PASSED] 0x674C (CRESCENTISLAND)
[05:55:25] [PASSED] 0x674D (CRESCENTISLAND)
[05:55:25] [PASSED] 0x674E (CRESCENTISLAND)
[05:55:25] [PASSED] 0x674F (CRESCENTISLAND)
[05:55:25] [PASSED] 0x6750 (CRESCENTISLAND)
[05:55:25] [PASSED] 0x6751 (CRESCENTISLAND)
[05:55:25] [PASSED] 0x6752 (CRESCENTISLAND)
[05:55:25] [PASSED] 0x6753 (CRESCENTISLAND)
[05:55:25] [PASSED] 0x6754 (CRESCENTISLAND)
[05:55:25] [PASSED] 0x6755 (CRESCENTISLAND)
[05:55:25] [PASSED] 0x6756 (CRESCENTISLAND)
[05:55:25] [PASSED] 0xD750 (NOVALAKE_P)
[05:55:25] [PASSED] 0xD751 (NOVALAKE_P)
[05:55:25] [PASSED] 0xD752 (NOVALAKE_P)
[05:55:25] [PASSED] 0xD753 (NOVALAKE_P)
[05:55:25] [PASSED] 0xD754 (NOVALAKE_P)
[05:55:25] [PASSED] 0xD755 (NOVALAKE_P)
[05:55:25] [PASSED] 0xD756 (NOVALAKE_P)
[05:55:25] [PASSED] 0xD757 (NOVALAKE_P)
[05:55:25] [PASSED] 0xD75F (NOVALAKE_P)
[05:55:25] =============== [PASSED] check_platform_desc ===============
[05:55:25] ===================== [PASSED] xe_pci ======================
[05:55:25] ============= xe_rtp_tables_test (5 subtests) ==============
[05:55:25] ================== xe_rtp_table_gt_test  ===================
[05:55:25] [PASSED] gt_was/14011060649
[05:55:25] [PASSED] gt_was/14011059788
[05:55:25] [PASSED] gt_was/14015795083
[05:55:25] [PASSED] gt_was/16021867713
[05:55:25] [PASSED] gt_was/14019449301
[05:55:25] [PASSED] gt_was/16028005424
[05:55:25] [PASSED] gt_was/14026578760
[05:55:25] [PASSED] gt_was/1409420604
[05:55:25] [PASSED] gt_was/1408615072
[05:55:25] [PASSED] gt_was/22010523718
[05:55:25] [PASSED] gt_was/14011006942
[05:55:25] [PASSED] gt_was/14014830051
[05:55:25] [PASSED] gt_was/18018781329
[05:55:25] [PASSED] gt_was/1509235366
[05:55:25] [PASSED] gt_was/18018781329
[05:55:25] [PASSED] gt_was/16016694945
[05:55:25] [PASSED] gt_was/14018575942
[05:55:25] [PASSED] gt_was/22016670082
[05:55:25] [PASSED] gt_was/22016670082
[05:55:25] [PASSED] gt_was/14017421178
[05:55:25] [PASSED] gt_was/16025250150
[05:55:25] [PASSED] gt_was/14021871409
[05:55:25] [PASSED] gt_was/16021865536
[05:55:25] [PASSED] gt_was/14021486841
[05:55:25] [PASSED] gt_was/14025160223
[05:55:25] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[05:55:25] [PASSED] gt_was/14025635424
[05:55:25] [PASSED] gt_was/16028005424
[05:55:25] ============== [PASSED] xe_rtp_table_gt_test ===============
[05:55:25] ================== xe_rtp_table_gt_test  ===================
[05:55:25] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[05:55:25] [PASSED] gt_tunings/Tuning: 32B Access Enable
[05:55:25] [PASSED] gt_tunings/Tuning: L3 cache
[05:55:25] [PASSED] gt_tunings/Tuning: L3 cache - media
[05:55:25] [PASSED] gt_tunings/Tuning: Compression Overfetch
[05:55:25] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[05:55:25] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[05:55:25] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[05:55:25] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[05:55:25] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[05:55:25] [PASSED] gt_tunings/Tuning: Stateless compression control
[05:55:25] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[05:55:25] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[05:55:25] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[05:55:25] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[05:55:25] [PASSED] gt_tunings/Tuning: Force All Non-Compressible Memory Reads to be 256B Overfetches
[05:55:25] ============== [PASSED] xe_rtp_table_gt_test ===============
[05:55:25] ================== xe_rtp_table_oob_test  ==================
[05:55:25] [PASSED] oob_was/1607983814
[05:55:25] [PASSED] oob_was/16010904313
[05:55:25] [PASSED] oob_was/18022495364
[05:55:25] [PASSED] oob_was/22012773006
[05:55:25] [PASSED] oob_was/14014475959
[05:55:25] [PASSED] oob_was/22011391025
[05:55:25] [PASSED] oob_was/22012727170
[05:55:25] [PASSED] oob_was/22012727685
[05:55:25] [PASSED] oob_was/22016596838
[05:55:25] [PASSED] oob_was/18020744125
[05:55:25] [PASSED] oob_was/1409600907
[05:55:25] [PASSED] oob_was/22014953428
[05:55:25] [PASSED] oob_was/16017236439
[05:55:25] [PASSED] oob_was/14019821291
[05:55:25] [PASSED] oob_was/14015076503
[05:55:25] [PASSED] oob_was/22016122933
[05:55:25] [PASSED] oob_was/14018913170
[05:55:25] [PASSED] oob_was/14018094691
[05:55:25] [PASSED] oob_was/18024947630
[05:55:25] [PASSED] oob_was/16022287689
[05:55:25] [PASSED] oob_was/13011645652
[05:55:25] [PASSED] oob_was/14022293748
[05:55:25] [PASSED] oob_was/22019794406
[05:55:25] [PASSED] oob_was/22019338487
[05:55:25] [PASSED] oob_was/16023588340
[05:55:25] [PASSED] oob_was/14019789679
[05:55:25] [PASSED] oob_was/14022866841
[05:55:25] [PASSED] oob_was/16021333562
[05:55:25] [PASSED] oob_was/14016712196
[05:55:25] [PASSED] oob_was/14015568240
[05:55:25] [PASSED] oob_was/18013179988
[05:55:25] [PASSED] oob_was/1508761755
[05:55:25] [PASSED] oob_was/16023105232
[05:55:25] [PASSED] oob_was/16026508708
[05:55:25] [PASSED] oob_was/14020001231
[05:55:25] [PASSED] oob_was/16023683509
[05:55:25] [PASSED] oob_was/14025515070
[05:55:25] [PASSED] oob_was/15015404425_disable
[05:55:25] [PASSED] oob_was/16026007364
[05:55:25] [PASSED] oob_was/14020316580
[05:55:25] [PASSED] oob_was/14025883347
[05:55:25] [PASSED] oob_was/16029380221
[05:55:25] [PASSED] oob_was/22022079272
[05:55:25] [PASSED] oob_was/16029897822
[05:55:25] [PASSED] oob_was/14026539277
[05:55:25] [PASSED] oob_was/14027054324
[05:55:25] [PASSED] oob_was/14025941587
[05:55:25] [PASSED] oob_was/16030224309
[05:55:25] [PASSED] oob_was/14028709524
[05:55:25] [PASSED] oob_was/14028250015
[05:55:25] [PASSED] oob_was/16031259911
[05:55:25] ============== [PASSED] xe_rtp_table_oob_test ==============
[05:55:25] ================ xe_rtp_table_dev_oob_test  ================
[05:55:25] [PASSED] device_oob_was/22010954014
[05:55:25] [PASSED] device_oob_was/15015404425
[05:55:25] [PASSED] device_oob_was/22019338487_display
[05:55:25] [PASSED] device_oob_was/14022085890
[05:55:25] [PASSED] device_oob_was/14026633728
[05:55:25] [PASSED] device_oob_was/14026746987
[05:55:25] [PASSED] device_oob_was/14026779378
[05:55:25] [PASSED] device_oob_was/14028586678
[05:55:25] [PASSED] device_oob_was/14028434957
[05:55:25] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[05:55:25] ========== xe_rtp_table_missing_upper_bound_test  ==========
[05:55:25] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[05:55:25] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[05:55:25] [PASSED] register_whitelist/1806527549
[05:55:25] [PASSED] register_whitelist/allow_read_ctx_timestamp
[05:55:25] [PASSED] register_whitelist/allow_read_queue_timestamp
[05:55:25] [PASSED] register_whitelist/16014440446
[05:55:25] [PASSED] register_whitelist/16017236439
[05:55:25] [PASSED] register_whitelist/16020183090
[05:55:25] [PASSED] register_whitelist/14024997852
[05:55:25] [PASSED] register_whitelist/14024997852
[05:55:25] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[05:55:25] =============== [PASSED] xe_rtp_tables_test ================
[05:55:25] =================== xe_rtp (3 subtests) ====================
[05:55:25] =================== xe_rtp_rules_tests  ====================
[05:55:25] [PASSED] no
[05:55:25] [PASSED] yes
[05:55:25] [PASSED] no-and-no
[05:55:25] [PASSED] no-and-yes
[05:55:25] [PASSED] yes-and-no
[05:55:25] [PASSED] yes-and-yes
[05:55:25] [PASSED] no-or-no
[05:55:25] [PASSED] no-or-yes
[05:55:25] [PASSED] yes-or-no
[05:55:25] [PASSED] yes-or-yes
[05:55:25] [PASSED] no-yes-or-yes-no
[05:55:25] [PASSED] no-yes-or-yes-yes
[05:55:25] [PASSED] yes-yes-or-no-yes
[05:55:25] [PASSED] yes-yes-or-yes-yes
[05:55:25] [PASSED] no-no-or-yes-or-no
[05:55:25] [PASSED] or
[05:55:25] [PASSED] or-yes
[05:55:25] [PASSED] or-no
[05:55:25] [PASSED] yes-or
[05:55:25] [PASSED] no-or
[05:55:25] [PASSED] no-or-or-yes
[05:55:25] [PASSED] yes-or-or-no
[05:55:25] [PASSED] no-or-or-no
[05:55:25] [PASSED] missing-context-engine-class
[05:55:25] [PASSED] missing-context-engine-class-or-yes
[05:55:25] [PASSED] missing-context-engine-class-or-or-yes
[05:55:25] =============== [PASSED] xe_rtp_rules_tests ================
[05:55:25] =============== xe_rtp_process_to_sr_tests  ================
[05:55:25] [PASSED] coalesce-same-reg
[05:55:25] [PASSED] coalesce-same-reg-literal-and-func
[05:55:25] [PASSED] no-match-no-add
[05:55:25] [PASSED] two-regs-two-entries
[05:55:25] [PASSED] clr-one-set-other
[05:55:25] [PASSED] set-field
[05:55:25] [PASSED] conflict-duplicate
[05:55:25] [PASSED] conflict-not-disjoint
[05:55:25] [PASSED] conflict-not-disjoint-literal-and-func
[05:55:25] [PASSED] conflict-reg-type
[05:55:25] [PASSED] bad-mcr-reg-forced-to-regular
[05:55:25] [PASSED] bad-regular-reg-forced-to-mcr
[05:55:25] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[05:55:25] ================== xe_rtp_process_tests  ===================
[05:55:25] [PASSED] active1
[05:55:25] [PASSED] active2
[05:55:25] [PASSED] active-inactive
[05:55:25] [PASSED] inactive-active
[05:55:25] [PASSED] inactive-active-inactive
[05:55:25] [PASSED] inactive-inactive-inactive
[05:55:25] ============== [PASSED] xe_rtp_process_tests ===============
[05:55:25] ===================== [PASSED] xe_rtp ======================
[05:55:25] ==================== xe_wa (1 subtest) =====================
[05:55:25] ======================== xe_wa_gt  =========================
[05:55:25] [PASSED] TIGERLAKE B0
[05:55:25] [PASSED] DG1 A0
[05:55:25] [PASSED] DG1 B0
[05:55:25] [PASSED] ALDERLAKE_S A0
[05:55:25] [PASSED] ALDERLAKE_S B0
[05:55:25] [PASSED] ALDERLAKE_S C0
[05:55:25] [PASSED] ALDERLAKE_S D0
[05:55:25] [PASSED] ALDERLAKE_P A0
[05:55:25] [PASSED] ALDERLAKE_P B0
[05:55:25] [PASSED] ALDERLAKE_P C0
[05:55:25] [PASSED] ALDERLAKE_S RPLS D0
[05:55:25] [PASSED] ALDERLAKE_P RPLU E0
[05:55:25] [PASSED] DG2 G10 C0
[05:55:25] [PASSED] DG2 G11 B1
[05:55:25] [PASSED] DG2 G12 A1
[05:55:25] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[05:55:25] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[05:55:25] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[05:55:25] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[05:55:25] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[05:55:25] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[05:55:25] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[05:55:25] ==================== [PASSED] xe_wa_gt =====================
[05:55:25] ====================== [PASSED] xe_wa ======================
[05:55:25] ============================================================
[05:55:25] Testing complete. Ran 860 tests: passed: 831, skipped: 29
[05:55:25] Elapsed time: 42.437s total, 2.607s configuring, 39.065s building, 0.747s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[05:55:25] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:55:27] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[05:55:53] Starting KUnit Kernel (1/1)...
[05:55:53] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:55:53] ============ drm_test_pick_cmdline (2 subtests) ============
[05:55:53] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[05:55:53] =============== drm_test_pick_cmdline_named  ===============
[05:55:53] [PASSED] NTSC
[05:55:53] [PASSED] NTSC-J
[05:55:53] [PASSED] PAL
[05:55:53] [PASSED] PAL-M
[05:55:53] =========== [PASSED] drm_test_pick_cmdline_named ===========
[05:55:53] ============== [PASSED] drm_test_pick_cmdline ==============
[05:55:53] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[05:55:53] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[05:55:53] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[05:55:53] =========== drm_validate_clone_mode (2 subtests) ===========
[05:55:53] ============== drm_test_check_in_clone_mode  ===============
[05:55:53] [PASSED] in_clone_mode
[05:55:53] [PASSED] not_in_clone_mode
[05:55:53] ========== [PASSED] drm_test_check_in_clone_mode ===========
[05:55:53] =============== drm_test_check_valid_clones  ===============
[05:55:53] [PASSED] not_in_clone_mode
[05:55:53] [PASSED] valid_clone
[05:55:53] [PASSED] invalid_clone
[05:55:53] =========== [PASSED] drm_test_check_valid_clones ===========
[05:55:53] ============= [PASSED] drm_validate_clone_mode =============
[05:55:53] ============= drm_validate_modeset (1 subtest) =============
[05:55:53] [PASSED] drm_test_check_connector_changed_modeset
[05:55:53] ============== [PASSED] drm_validate_modeset ===============
[05:55:53] ====== drm_test_bridge_get_current_state (1 subtest) =======
[05:55:53] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[05:55:53] ======== [PASSED] drm_test_bridge_get_current_state ========
[05:55:53] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[05:55:53] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[05:55:53] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[05:55:53] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[05:55:53] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[05:55:53] ============== drm_bridge_alloc (2 subtests) ===============
[05:55:53] [PASSED] drm_test_drm_bridge_alloc_basic
[05:55:53] [PASSED] drm_test_drm_bridge_alloc_get_put
[05:55:53] ================ [PASSED] drm_bridge_alloc =================
[05:55:53] ============= drm_bridge_bus_fmt (5 subtests) ==============
[05:55:53] [PASSED] drm_test_bridge_rgb_yuv_rgb
[05:55:53] [PASSED] drm_test_bridge_must_convert_to_yuv444
[05:55:54] [PASSED] drm_test_bridge_hdmi_auto_rgb
[05:55:54] [PASSED] drm_test_bridge_auto_first
[05:55:54] [PASSED] drm_test_bridge_rgb_yuv_no_path
[05:55:54] =============== [PASSED] drm_bridge_bus_fmt ================
[05:55:54] ============= drm_cmdline_parser (40 subtests) =============
[05:55:54] [PASSED] drm_test_cmdline_force_d_only
[05:55:54] [PASSED] drm_test_cmdline_force_D_only_dvi
[05:55:54] [PASSED] drm_test_cmdline_force_D_only_hdmi
[05:55:54] [PASSED] drm_test_cmdline_force_D_only_not_digital
[05:55:54] [PASSED] drm_test_cmdline_force_e_only
[05:55:54] [PASSED] drm_test_cmdline_res
[05:55:54] [PASSED] drm_test_cmdline_res_vesa
[05:55:54] [PASSED] drm_test_cmdline_res_vesa_rblank
[05:55:54] [PASSED] drm_test_cmdline_res_rblank
[05:55:54] [PASSED] drm_test_cmdline_res_bpp
[05:55:54] [PASSED] drm_test_cmdline_res_refresh
[05:55:54] [PASSED] drm_test_cmdline_res_bpp_refresh
[05:55:54] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[05:55:54] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[05:55:54] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[05:55:54] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[05:55:54] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[05:55:54] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[05:55:54] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[05:55:54] [PASSED] drm_test_cmdline_res_margins_force_on
[05:55:54] [PASSED] drm_test_cmdline_res_vesa_margins
[05:55:54] [PASSED] drm_test_cmdline_name
[05:55:54] [PASSED] drm_test_cmdline_name_bpp
[05:55:54] [PASSED] drm_test_cmdline_name_option
[05:55:54] [PASSED] drm_test_cmdline_name_bpp_option
[05:55:54] [PASSED] drm_test_cmdline_rotate_0
[05:55:54] [PASSED] drm_test_cmdline_rotate_90
[05:55:54] [PASSED] drm_test_cmdline_rotate_180
[05:55:54] [PASSED] drm_test_cmdline_rotate_270
[05:55:54] [PASSED] drm_test_cmdline_hmirror
[05:55:54] [PASSED] drm_test_cmdline_vmirror
[05:55:54] [PASSED] drm_test_cmdline_margin_options
[05:55:54] [PASSED] drm_test_cmdline_multiple_options
[05:55:54] [PASSED] drm_test_cmdline_bpp_extra_and_option
[05:55:54] [PASSED] drm_test_cmdline_extra_and_option
[05:55:54] [PASSED] drm_test_cmdline_freestanding_options
[05:55:54] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[05:55:54] [PASSED] drm_test_cmdline_panel_orientation
[05:55:54] ================ drm_test_cmdline_invalid  =================
[05:55:54] [PASSED] margin_only
[05:55:54] [PASSED] interlace_only
[05:55:54] [PASSED] res_missing_x
[05:55:54] [PASSED] res_missing_y
[05:55:54] [PASSED] res_bad_y
[05:55:54] [PASSED] res_missing_y_bpp
[05:55:54] [PASSED] res_bad_bpp
[05:55:54] [PASSED] res_bad_refresh
[05:55:54] [PASSED] res_bpp_refresh_force_on_off
[05:55:54] [PASSED] res_invalid_mode
[05:55:54] [PASSED] res_bpp_wrong_place_mode
[05:55:54] [PASSED] name_bpp_refresh
[05:55:54] [PASSED] name_refresh
[05:55:54] [PASSED] name_refresh_wrong_mode
[05:55:54] [PASSED] name_refresh_invalid_mode
[05:55:54] [PASSED] rotate_multiple
[05:55:54] [PASSED] rotate_invalid_val
[05:55:54] [PASSED] rotate_truncated
[05:55:54] [PASSED] invalid_option
[05:55:54] [PASSED] invalid_tv_option
[05:55:54] [PASSED] truncated_tv_option
[05:55:54] ============ [PASSED] drm_test_cmdline_invalid =============
[05:55:54] =============== drm_test_cmdline_tv_options  ===============
[05:55:54] [PASSED] NTSC
[05:55:54] [PASSED] NTSC_443
[05:55:54] [PASSED] NTSC_J
[05:55:54] [PASSED] PAL
[05:55:54] [PASSED] PAL_M
[05:55:54] [PASSED] PAL_N
[05:55:54] [PASSED] SECAM
[05:55:54] [PASSED] MONO_525
[05:55:54] [PASSED] MONO_625
[05:55:54] =========== [PASSED] drm_test_cmdline_tv_options ===========
[05:55:54] =============== [PASSED] drm_cmdline_parser ================
[05:55:54] ========== drmm_connector_hdmi_init (20 subtests) ==========
[05:55:54] [PASSED] drm_test_connector_hdmi_init_valid
[05:55:54] [PASSED] drm_test_connector_hdmi_init_bpc_8
[05:55:54] [PASSED] drm_test_connector_hdmi_init_bpc_10
[05:55:54] [PASSED] drm_test_connector_hdmi_init_bpc_12
[05:55:54] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[05:55:54] [PASSED] drm_test_connector_hdmi_init_bpc_null
[05:55:54] [PASSED] drm_test_connector_hdmi_init_formats_empty
[05:55:54] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[05:55:54] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[05:55:54] [PASSED] supported_formats=0x9 yuv420_allowed=1
[05:55:54] [PASSED] supported_formats=0x9 yuv420_allowed=0
[05:55:54] [PASSED] supported_formats=0x5 yuv420_allowed=1
[05:55:54] [PASSED] supported_formats=0x5 yuv420_allowed=0
[05:55:54] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[05:55:54] [PASSED] drm_test_connector_hdmi_init_null_ddc
[05:55:54] [PASSED] drm_test_connector_hdmi_init_null_product
[05:55:54] [PASSED] drm_test_connector_hdmi_init_null_vendor
[05:55:54] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[05:55:54] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[05:55:54] [PASSED] drm_test_connector_hdmi_init_product_valid
[05:55:54] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[05:55:54] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[05:55:54] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[05:55:54] ========= drm_test_connector_hdmi_init_type_valid  =========
[05:55:54] [PASSED] HDMI-A
[05:55:54] [PASSED] HDMI-B
[05:55:54] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[05:55:54] ======== drm_test_connector_hdmi_init_type_invalid  ========
[05:55:54] [PASSED] Unknown
[05:55:54] [PASSED] VGA
[05:55:54] [PASSED] DVI-I
[05:55:54] [PASSED] DVI-D
[05:55:54] [PASSED] DVI-A
[05:55:54] [PASSED] Composite
[05:55:54] [PASSED] SVIDEO
[05:55:54] [PASSED] LVDS
[05:55:54] [PASSED] Component
[05:55:54] [PASSED] DIN
[05:55:54] [PASSED] DP
[05:55:54] [PASSED] TV
[05:55:54] [PASSED] eDP
[05:55:54] [PASSED] Virtual
[05:55:54] [PASSED] DSI
[05:55:54] [PASSED] DPI
[05:55:54] [PASSED] Writeback
[05:55:54] [PASSED] SPI
[05:55:54] [PASSED] USB
[05:55:54] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[05:55:54] ============ [PASSED] drmm_connector_hdmi_init =============
[05:55:54] ============= drmm_connector_init (3 subtests) =============
[05:55:54] [PASSED] drm_test_drmm_connector_init
[05:55:54] [PASSED] drm_test_drmm_connector_init_null_ddc
[05:55:54] ========= drm_test_drmm_connector_init_type_valid  =========
[05:55:54] [PASSED] Unknown
[05:55:54] [PASSED] VGA
[05:55:54] [PASSED] DVI-I
[05:55:54] [PASSED] DVI-D
[05:55:54] [PASSED] DVI-A
[05:55:54] [PASSED] Composite
[05:55:54] [PASSED] SVIDEO
[05:55:54] [PASSED] LVDS
[05:55:54] [PASSED] Component
[05:55:54] [PASSED] DIN
[05:55:54] [PASSED] DP
[05:55:54] [PASSED] HDMI-A
[05:55:54] [PASSED] HDMI-B
[05:55:54] [PASSED] TV
[05:55:54] [PASSED] eDP
[05:55:54] [PASSED] Virtual
[05:55:54] [PASSED] DSI
[05:55:54] [PASSED] DPI
[05:55:54] [PASSED] Writeback
[05:55:54] [PASSED] SPI
[05:55:54] [PASSED] USB
[05:55:54] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[05:55:54] =============== [PASSED] drmm_connector_init ===============
[05:55:54] ========= drm_connector_dynamic_init (6 subtests) ==========
[05:55:54] [PASSED] drm_test_drm_connector_dynamic_init
[05:55:54] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[05:55:54] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[05:55:54] [PASSED] drm_test_drm_connector_dynamic_init_properties
[05:55:54] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[05:55:54] [PASSED] Unknown
[05:55:54] [PASSED] VGA
[05:55:54] [PASSED] DVI-I
[05:55:54] [PASSED] DVI-D
[05:55:54] [PASSED] DVI-A
[05:55:54] [PASSED] Composite
[05:55:54] [PASSED] SVIDEO
[05:55:54] [PASSED] LVDS
[05:55:54] [PASSED] Component
[05:55:54] [PASSED] DIN
[05:55:54] [PASSED] DP
[05:55:54] [PASSED] HDMI-A
[05:55:54] [PASSED] HDMI-B
[05:55:54] [PASSED] TV
[05:55:54] [PASSED] eDP
[05:55:54] [PASSED] Virtual
[05:55:54] [PASSED] DSI
[05:55:54] [PASSED] DPI
[05:55:54] [PASSED] Writeback
[05:55:54] [PASSED] SPI
[05:55:54] [PASSED] USB
[05:55:54] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[05:55:54] ======== drm_test_drm_connector_dynamic_init_name  =========
[05:55:54] [PASSED] Unknown
[05:55:54] [PASSED] VGA
[05:55:54] [PASSED] DVI-I
[05:55:54] [PASSED] DVI-D
[05:55:54] [PASSED] DVI-A
[05:55:54] [PASSED] Composite
[05:55:54] [PASSED] SVIDEO
[05:55:54] [PASSED] LVDS
[05:55:54] [PASSED] Component
[05:55:54] [PASSED] DIN
[05:55:54] [PASSED] DP
[05:55:54] [PASSED] HDMI-A
[05:55:54] [PASSED] HDMI-B
[05:55:54] [PASSED] TV
[05:55:54] [PASSED] eDP
[05:55:54] [PASSED] Virtual
[05:55:54] [PASSED] DSI
[05:55:54] [PASSED] DPI
[05:55:54] [PASSED] Writeback
[05:55:54] [PASSED] SPI
[05:55:54] [PASSED] USB
[05:55:54] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[05:55:54] =========== [PASSED] drm_connector_dynamic_init ============
[05:55:54] ==== drm_connector_dynamic_register_early (4 subtests) =====
[05:55:54] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[05:55:54] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[05:55:54] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[05:55:54] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[05:55:54] ====== [PASSED] drm_connector_dynamic_register_early =======
[05:55:54] ======= drm_connector_dynamic_register (7 subtests) ========
[05:55:54] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[05:55:54] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[05:55:54] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[05:55:54] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[05:55:54] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[05:55:54] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[05:55:54] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[05:55:54] ========= [PASSED] drm_connector_dynamic_register ==========
[05:55:54] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[05:55:54] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[05:55:54] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[05:55:54] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[05:55:54] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[05:55:54] ========== drm_test_get_tv_mode_from_name_valid  ===========
[05:55:54] [PASSED] NTSC
[05:55:54] [PASSED] NTSC-443
[05:55:54] [PASSED] NTSC-J
[05:55:54] [PASSED] PAL
[05:55:54] [PASSED] PAL-M
[05:55:54] [PASSED] PAL-N
[05:55:54] [PASSED] SECAM
[05:55:54] [PASSED] Mono
[05:55:54] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[05:55:54] [PASSED] drm_test_get_tv_mode_from_name_truncated
[05:55:54] ============ [PASSED] drm_get_tv_mode_from_name ============
[05:55:54] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[05:55:54] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[05:55:54] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[05:55:54] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[05:55:54] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[05:55:54] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[05:55:54] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[05:55:54] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[05:55:54] [PASSED] VIC 96
[05:55:54] [PASSED] VIC 97
[05:55:54] [PASSED] VIC 101
[05:55:54] [PASSED] VIC 102
[05:55:54] [PASSED] VIC 106
[05:55:54] [PASSED] VIC 107
[05:55:54] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[05:55:54] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[05:55:54] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[05:55:54] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[05:55:54] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[05:55:54] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[05:55:54] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[05:55:54] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[05:55:54] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[05:55:54] [PASSED] Automatic
[05:55:54] [PASSED] Full
[05:55:54] [PASSED] Limited 16:235
[05:55:54] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[05:55:54] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[05:55:54] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[05:55:54] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[05:55:54] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[05:55:54] [PASSED] RGB
[05:55:54] [PASSED] YUV 4:2:0
[05:55:54] [PASSED] YUV 4:2:2
[05:55:54] [PASSED] YUV 4:4:4
[05:55:54] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[05:55:54] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[05:55:54] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[05:55:54] ============= drm_damage_helper (21 subtests) ==============
[05:55:54] [PASSED] drm_test_damage_iter_no_damage
[05:55:54] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[05:55:54] [PASSED] drm_test_damage_iter_no_damage_src_moved
[05:55:54] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[05:55:54] [PASSED] drm_test_damage_iter_no_damage_not_visible
[05:55:54] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[05:55:54] [PASSED] drm_test_damage_iter_no_damage_no_fb
[05:55:54] [PASSED] drm_test_damage_iter_simple_damage
[05:55:54] [PASSED] drm_test_damage_iter_single_damage
[05:55:54] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[05:55:54] [PASSED] drm_test_damage_iter_single_damage_outside_src
[05:55:54] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[05:55:54] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[05:55:54] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[05:55:54] [PASSED] drm_test_damage_iter_single_damage_src_moved
[05:55:54] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[05:55:54] [PASSED] drm_test_damage_iter_damage
[05:55:54] [PASSED] drm_test_damage_iter_damage_one_intersect
[05:55:54] [PASSED] drm_test_damage_iter_damage_one_outside
[05:55:54] [PASSED] drm_test_damage_iter_damage_src_moved
[05:55:54] [PASSED] drm_test_damage_iter_damage_not_visible
[05:55:54] ================ [PASSED] drm_damage_helper ================
[05:55:54] ============== drm_dp_mst_helper (3 subtests) ==============
[05:55:54] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[05:55:54] [PASSED] Clock 154000 BPP 30 DSC disabled
[05:55:54] [PASSED] Clock 234000 BPP 30 DSC disabled
[05:55:54] [PASSED] Clock 297000 BPP 24 DSC disabled
[05:55:54] [PASSED] Clock 332880 BPP 24 DSC enabled
[05:55:54] [PASSED] Clock 324540 BPP 24 DSC enabled
[05:55:54] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[05:55:54] ============== drm_test_dp_mst_calc_pbn_div  ===============
[05:55:54] [PASSED] Link rate 2000000 lane count 4
[05:55:54] [PASSED] Link rate 2000000 lane count 2
[05:55:54] [PASSED] Link rate 2000000 lane count 1
[05:55:54] [PASSED] Link rate 1350000 lane count 4
[05:55:54] [PASSED] Link rate 1350000 lane count 2
[05:55:54] [PASSED] Link rate 1350000 lane count 1
[05:55:54] [PASSED] Link rate 1000000 lane count 4
[05:55:54] [PASSED] Link rate 1000000 lane count 2
[05:55:54] [PASSED] Link rate 1000000 lane count 1
[05:55:54] [PASSED] Link rate 810000 lane count 4
[05:55:54] [PASSED] Link rate 810000 lane count 2
[05:55:54] [PASSED] Link rate 810000 lane count 1
[05:55:54] [PASSED] Link rate 540000 lane count 4
[05:55:54] [PASSED] Link rate 540000 lane count 2
[05:55:54] [PASSED] Link rate 540000 lane count 1
[05:55:54] [PASSED] Link rate 270000 lane count 4
[05:55:54] [PASSED] Link rate 270000 lane count 2
[05:55:54] [PASSED] Link rate 270000 lane count 1
[05:55:54] [PASSED] Link rate 162000 lane count 4
[05:55:54] [PASSED] Link rate 162000 lane count 2
[05:55:54] [PASSED] Link rate 162000 lane count 1
[05:55:54] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[05:55:54] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[05:55:54] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[05:55:54] [PASSED] DP_POWER_UP_PHY with port number
[05:55:54] [PASSED] DP_POWER_DOWN_PHY with port number
[05:55:54] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[05:55:54] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[05:55:54] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[05:55:54] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[05:55:54] [PASSED] DP_QUERY_PAYLOAD with port number
[05:55:54] [PASSED] DP_QUERY_PAYLOAD with VCPI
[05:55:54] [PASSED] DP_REMOTE_DPCD_READ with port number
[05:55:54] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[05:55:54] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[05:55:54] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[05:55:54] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[05:55:54] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[05:55:54] [PASSED] DP_REMOTE_I2C_READ with port number
[05:55:54] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[05:55:54] [PASSED] DP_REMOTE_I2C_READ with transactions array
[05:55:54] [PASSED] DP_REMOTE_I2C_WRITE with port number
[05:55:54] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[05:55:54] [PASSED] DP_REMOTE_I2C_WRITE with data array
[05:55:54] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[05:55:54] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[05:55:54] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[05:55:54] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[05:55:54] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[05:55:54] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[05:55:54] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[05:55:54] ================ [PASSED] drm_dp_mst_helper ================
[05:55:54] ================== drm_exec (7 subtests) ===================
[05:55:54] [PASSED] sanitycheck
[05:55:54] [PASSED] test_lock
[05:55:54] [PASSED] test_lock_unlock
[05:55:54] [PASSED] test_duplicates
[05:55:54] [PASSED] test_prepare
[05:55:54] [PASSED] test_prepare_array
[05:55:54] [PASSED] test_multiple_loops
[05:55:54] ==================== [PASSED] drm_exec =====================
[05:55:54] =========== drm_format_helper_test (17 subtests) ===========
[05:55:54] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[05:55:54] [PASSED] single_pixel_source_buffer
[05:55:54] [PASSED] single_pixel_clip_rectangle
[05:55:54] [PASSED] well_known_colors
[05:55:54] [PASSED] destination_pitch
[05:55:54] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[05:55:54] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[05:55:54] [PASSED] single_pixel_source_buffer
[05:55:54] [PASSED] single_pixel_clip_rectangle
[05:55:54] [PASSED] well_known_colors
[05:55:54] [PASSED] destination_pitch
[05:55:54] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[05:55:54] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[05:55:54] [PASSED] single_pixel_source_buffer
[05:55:54] [PASSED] single_pixel_clip_rectangle
[05:55:54] [PASSED] well_known_colors
[05:55:54] [PASSED] destination_pitch
[05:55:54] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[05:55:54] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[05:55:54] [PASSED] single_pixel_source_buffer
[05:55:54] [PASSED] single_pixel_clip_rectangle
[05:55:54] [PASSED] well_known_colors
[05:55:54] [PASSED] destination_pitch
[05:55:54] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[05:55:54] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[05:55:54] [PASSED] single_pixel_source_buffer
[05:55:54] [PASSED] single_pixel_clip_rectangle
[05:55:54] [PASSED] well_known_colors
[05:55:54] [PASSED] destination_pitch
[05:55:54] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[05:55:54] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[05:55:54] [PASSED] single_pixel_source_buffer
[05:55:54] [PASSED] single_pixel_clip_rectangle
[05:55:54] [PASSED] well_known_colors
[05:55:54] [PASSED] destination_pitch
[05:55:54] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[05:55:54] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[05:55:54] [PASSED] single_pixel_source_buffer
[05:55:54] [PASSED] single_pixel_clip_rectangle
[05:55:54] [PASSED] well_known_colors
[05:55:54] [PASSED] destination_pitch
[05:55:54] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[05:55:54] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[05:55:54] [PASSED] single_pixel_source_buffer
[05:55:54] [PASSED] single_pixel_clip_rectangle
[05:55:54] [PASSED] well_known_colors
[05:55:54] [PASSED] destination_pitch
[05:55:54] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[05:55:54] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[05:55:54] [PASSED] single_pixel_source_buffer
[05:55:54] [PASSED] single_pixel_clip_rectangle
[05:55:54] [PASSED] well_known_colors
[05:55:54] [PASSED] destination_pitch
[05:55:54] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[05:55:54] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[05:55:54] [PASSED] single_pixel_source_buffer
[05:55:54] [PASSED] single_pixel_clip_rectangle
[05:55:54] [PASSED] well_known_colors
[05:55:54] [PASSED] destination_pitch
[05:55:54] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[05:55:54] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[05:55:54] [PASSED] single_pixel_source_buffer
[05:55:54] [PASSED] single_pixel_clip_rectangle
[05:55:54] [PASSED] well_known_colors
[05:55:54] [PASSED] destination_pitch
[05:55:54] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[05:55:54] ============== drm_test_fb_xrgb8888_to_mono  ===============
[05:55:54] [PASSED] single_pixel_source_buffer
[05:55:54] [PASSED] single_pixel_clip_rectangle
[05:55:54] [PASSED] well_known_colors
[05:55:54] [PASSED] destination_pitch
[05:55:54] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[05:55:54] ==================== drm_test_fb_swab  =====================
[05:55:54] [PASSED] single_pixel_source_buffer
[05:55:54] [PASSED] single_pixel_clip_rectangle
[05:55:54] [PASSED] well_known_colors
[05:55:54] [PASSED] destination_pitch
[05:55:54] ================ [PASSED] drm_test_fb_swab =================
[05:55:54] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[05:55:54] [PASSED] single_pixel_source_buffer
[05:55:54] [PASSED] single_pixel_clip_rectangle
[05:55:54] [PASSED] well_known_colors
[05:55:54] [PASSED] destination_pitch
[05:55:54] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[05:55:54] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[05:55:54] [PASSED] single_pixel_source_buffer
[05:55:54] [PASSED] single_pixel_clip_rectangle
[05:55:54] [PASSED] well_known_colors
[05:55:54] [PASSED] destination_pitch
[05:55:54] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[05:55:54] ================= drm_test_fb_clip_offset  =================
[05:55:54] [PASSED] pass through
[05:55:54] [PASSED] horizontal offset
[05:55:54] [PASSED] vertical offset
[05:55:54] [PASSED] horizontal and vertical offset
[05:55:54] [PASSED] horizontal offset (custom pitch)
[05:55:54] [PASSED] vertical offset (custom pitch)
[05:55:54] [PASSED] horizontal and vertical offset (custom pitch)
[05:55:54] ============= [PASSED] drm_test_fb_clip_offset =============
[05:55:54] =================== drm_test_fb_memcpy  ====================
[05:55:54] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[05:55:54] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[05:55:54] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[05:55:54] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[05:55:54] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[05:55:54] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[05:55:54] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[05:55:54] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[05:55:54] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[05:55:54] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[05:55:54] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[05:55:54] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[05:55:54] =============== [PASSED] drm_test_fb_memcpy ================
[05:55:54] ============= [PASSED] drm_format_helper_test ==============
[05:55:54] ================= drm_format (18 subtests) =================
[05:55:54] [PASSED] drm_test_format_block_width_invalid
[05:55:54] [PASSED] drm_test_format_block_width_one_plane
[05:55:54] [PASSED] drm_test_format_block_width_two_plane
[05:55:54] [PASSED] drm_test_format_block_width_three_plane
[05:55:54] [PASSED] drm_test_format_block_width_tiled
[05:55:54] [PASSED] drm_test_format_block_height_invalid
[05:55:54] [PASSED] drm_test_format_block_height_one_plane
[05:55:54] [PASSED] drm_test_format_block_height_two_plane
[05:55:54] [PASSED] drm_test_format_block_height_three_plane
[05:55:54] [PASSED] drm_test_format_block_height_tiled
[05:55:54] [PASSED] drm_test_format_min_pitch_invalid
[05:55:54] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[05:55:54] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[05:55:54] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[05:55:54] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[05:55:54] [PASSED] drm_test_format_min_pitch_two_plane
[05:55:54] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[05:55:54] [PASSED] drm_test_format_min_pitch_tiled
[05:55:54] =================== [PASSED] drm_format ====================
[05:55:54] ============== drm_framebuffer (10 subtests) ===============
[05:55:54] ========== drm_test_framebuffer_check_src_coords  ==========
[05:55:54] [PASSED] Success: source fits into fb
[05:55:54] [PASSED] Fail: overflowing fb with x-axis coordinate
[05:55:54] [PASSED] Fail: overflowing fb with y-axis coordinate
[05:55:54] [PASSED] Fail: overflowing fb with source width
[05:55:54] [PASSED] Fail: overflowing fb with source height
[05:55:54] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[05:55:54] [PASSED] drm_test_framebuffer_cleanup
[05:55:54] =============== drm_test_framebuffer_create  ===============
[05:55:54] [PASSED] ABGR8888 normal sizes
[05:55:54] [PASSED] ABGR8888 max sizes
[05:55:54] [PASSED] ABGR8888 pitch greater than min required
[05:55:54] [PASSED] ABGR8888 pitch less than min required
[05:55:54] [PASSED] ABGR8888 Invalid width
[05:55:54] [PASSED] ABGR8888 Invalid buffer handle
[05:55:54] [PASSED] No pixel format
[05:55:54] [PASSED] ABGR8888 Width 0
[05:55:54] [PASSED] ABGR8888 Height 0
[05:55:54] [PASSED] ABGR8888 Out of bound height * pitch combination
[05:55:54] [PASSED] ABGR8888 Large buffer offset
[05:55:54] [PASSED] ABGR8888 Buffer offset for inexistent plane
[05:55:54] [PASSED] ABGR8888 Invalid flag
[05:55:54] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[05:55:54] [PASSED] ABGR8888 Valid buffer modifier
[05:55:54] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[05:55:54] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[05:55:54] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[05:55:54] [PASSED] NV12 Normal sizes
[05:55:54] [PASSED] NV12 Max sizes
[05:55:54] [PASSED] NV12 Invalid pitch
[05:55:54] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[05:55:54] [PASSED] NV12 different  modifier per-plane
[05:55:54] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[05:55:54] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[05:55:54] [PASSED] NV12 Modifier for inexistent plane
[05:55:54] [PASSED] NV12 Handle for inexistent plane
[05:55:54] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[05:55:54] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[05:55:54] [PASSED] YVU420 Normal sizes
[05:55:54] [PASSED] YVU420 Max sizes
[05:55:54] [PASSED] YVU420 Invalid pitch
[05:55:54] [PASSED] YVU420 Different pitches
[05:55:54] [PASSED] YVU420 Different buffer offsets/pitches
[05:55:54] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[05:55:54] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[05:55:54] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[05:55:54] [PASSED] YVU420 Valid modifier
[05:55:54] [PASSED] YVU420 Different modifiers per plane
[05:55:54] [PASSED] YVU420 Modifier for inexistent plane
[05:55:54] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[05:55:54] [PASSED] X0L2 Normal sizes
[05:55:54] [PASSED] X0L2 Max sizes
[05:55:54] [PASSED] X0L2 Invalid pitch
[05:55:54] [PASSED] X0L2 Pitch greater than minimum required
[05:55:54] [PASSED] X0L2 Handle for inexistent plane
[05:55:54] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[05:55:54] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[05:55:54] [PASSED] X0L2 Valid modifier
[05:55:54] [PASSED] X0L2 Modifier for inexistent plane
[05:55:54] =========== [PASSED] drm_test_framebuffer_create ===========
[05:55:54] [PASSED] drm_test_framebuffer_free
[05:55:54] [PASSED] drm_test_framebuffer_init
[05:55:54] [PASSED] drm_test_framebuffer_init_bad_format
[05:55:54] [PASSED] drm_test_framebuffer_init_dev_mismatch
[05:55:54] [PASSED] drm_test_framebuffer_lookup
[05:55:54] [PASSED] drm_test_framebuffer_lookup_inexistent
[05:55:54] [PASSED] drm_test_framebuffer_modifiers_not_supported
[05:55:54] ================= [PASSED] drm_framebuffer =================
[05:55:54] ================ drm_gem_shmem (8 subtests) ================
[05:55:54] [PASSED] drm_gem_shmem_test_obj_create
[05:55:54] [PASSED] drm_gem_shmem_test_obj_create_private
[05:55:54] [PASSED] drm_gem_shmem_test_pin_pages
[05:55:54] [PASSED] drm_gem_shmem_test_vmap
[05:55:54] [PASSED] drm_gem_shmem_test_get_sg_table
[05:55:54] [PASSED] drm_gem_shmem_test_get_pages_sgt
[05:55:54] [PASSED] drm_gem_shmem_test_madvise
[05:55:54] [PASSED] drm_gem_shmem_test_purge
[05:55:54] ================== [PASSED] drm_gem_shmem ==================
[05:55:54] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[05:55:54] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[05:55:54] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[05:55:54] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[05:55:54] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[05:55:54] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[05:55:54] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[05:55:54] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[05:55:54] [PASSED] Automatic
[05:55:54] [PASSED] Full
[05:55:54] [PASSED] Limited 16:235
[05:55:54] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[05:55:54] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[05:55:54] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[05:55:54] [PASSED] drm_test_check_disable_connector
[05:55:54] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[05:55:54] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[05:55:54] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[05:55:54] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[05:55:54] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[05:55:54] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[05:55:54] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[05:55:54] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[05:55:54] [PASSED] drm_test_check_output_bpc_dvi
[05:55:54] [PASSED] drm_test_check_output_bpc_format_vic_1
[05:55:54] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[05:55:54] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[05:55:54] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[05:55:54] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[05:55:54] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[05:55:54] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[05:55:54] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[05:55:54] ============ drm_test_check_hdmi_color_format  =============
[05:55:54] [PASSED] AUTO -> RGB
[05:55:54] [PASSED] YCBCR422 -> YUV422
[05:55:54] [PASSED] YCBCR420 -> YUV420
[05:55:54] [PASSED] YCBCR444 -> YUV444
[05:55:54] [PASSED] RGB -> RGB
[05:55:54] ======== [PASSED] drm_test_check_hdmi_color_format =========
[05:55:54] ======== drm_test_check_hdmi_color_format_420_only  ========
[05:55:54] [PASSED] RGB should fail
[05:55:54] [PASSED] YUV444 should fail
[05:55:54] [PASSED] YUV422 should fail
[05:55:54] [PASSED] YUV420 should work
[05:55:54] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[05:55:54] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[05:55:54] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[05:55:54] [PASSED] drm_test_check_broadcast_rgb_value
[05:55:54] [PASSED] drm_test_check_bpc_8_value
[05:55:54] [PASSED] drm_test_check_bpc_10_value
[05:55:54] [PASSED] drm_test_check_bpc_12_value
[05:55:54] [PASSED] drm_test_check_format_value
[05:55:54] [PASSED] drm_test_check_tmds_char_value
[05:55:54] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[05:55:54] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[05:55:54] [PASSED] drm_test_check_mode_valid
[05:55:54] [PASSED] drm_test_check_mode_valid_reject
[05:55:54] [PASSED] drm_test_check_mode_valid_reject_rate
[05:55:54] [PASSED] drm_test_check_mode_valid_reject_max_clock
[05:55:54] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[05:55:54] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[05:55:54] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[05:55:54] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[05:55:54] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[05:55:54] [PASSED] drm_test_check_infoframes
[05:55:54] [PASSED] drm_test_check_reject_avi_infoframe
[05:55:54] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[05:55:54] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[05:55:54] [PASSED] drm_test_check_reject_audio_infoframe
[05:55:54] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[05:55:54] ================= drm_managed (2 subtests) =================
[05:55:54] [PASSED] drm_test_managed_release_action
[05:55:54] [PASSED] drm_test_managed_run_action
[05:55:54] =================== [PASSED] drm_managed ===================
[05:55:54] =================== drm_mm (6 subtests) ====================
[05:55:54] [PASSED] drm_test_mm_init
[05:55:54] [PASSED] drm_test_mm_debug
[05:55:54] [PASSED] drm_test_mm_align32
[05:55:54] [PASSED] drm_test_mm_align64
[05:55:54] [PASSED] drm_test_mm_lowest
[05:55:54] [PASSED] drm_test_mm_highest
[05:55:54] ===================== [PASSED] drm_mm ======================
[05:55:54] ============= drm_modes_analog_tv (5 subtests) =============
[05:55:54] [PASSED] drm_test_modes_analog_tv_mono_576i
[05:55:54] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[05:55:54] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[05:55:54] [PASSED] drm_test_modes_analog_tv_pal_576i
[05:55:54] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[05:55:54] =============== [PASSED] drm_modes_analog_tv ===============
[05:55:54] ============== drm_panic_helper (3 subtests) ===============
[05:55:54] ============= drm_test_panic_screen_user_map  ==============
[05:55:54] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[05:55:54] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[05:55:54] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[05:55:54] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[05:55:54] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[05:55:54] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[05:55:54] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[05:55:54] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[05:55:54] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[05:55:54] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[05:55:54] ========= [PASSED] drm_test_panic_screen_user_map ==========
[05:55:54] ============= drm_test_panic_screen_user_page  =============
[05:55:54] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[05:55:54] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[05:55:54] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[05:55:54] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[05:55:54] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[05:55:54] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[05:55:54] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[05:55:54] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[05:55:54] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[05:55:54] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[05:55:54] ========= [PASSED] drm_test_panic_screen_user_page =========
[05:55:54] ========== drm_test_panic_screen_user_set_pixel  ===========
[05:55:54] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[05:55:54] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[05:55:54] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[05:55:54] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[05:55:54] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[05:55:54] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[05:55:54] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[05:55:54] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[05:55:54] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[05:55:54] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[05:55:54] ====== [PASSED] drm_test_panic_screen_user_set_pixel =======
[05:55:54] ================ [PASSED] drm_panic_helper =================
[05:55:54] ============== drm_plane_helper (2 subtests) ===============
[05:55:54] =============== drm_test_check_plane_state  ================
[05:55:54] [PASSED] clipping_simple
[05:55:54] [PASSED] clipping_rotate_reflect
[05:55:54] [PASSED] positioning_simple
[05:55:54] [PASSED] upscaling
[05:55:54] [PASSED] downscaling
[05:55:54] [PASSED] rounding1
[05:55:54] [PASSED] rounding2
[05:55:54] [PASSED] rounding3
[05:55:54] [PASSED] rounding4
[05:55:54] =========== [PASSED] drm_test_check_plane_state ============
[05:55:54] =========== drm_test_check_invalid_plane_state  ============
[05:55:54] [PASSED] positioning_invalid
[05:55:54] [PASSED] upscaling_invalid
[05:55:54] [PASSED] downscaling_invalid
[05:55:54] ======= [PASSED] drm_test_check_invalid_plane_state ========
[05:55:54] ================ [PASSED] drm_plane_helper =================
[05:55:54] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[05:55:54] ====== drm_test_connector_helper_tv_get_modes_check  =======
[05:55:54] [PASSED] None
[05:55:54] [PASSED] PAL
[05:55:54] [PASSED] NTSC
[05:55:54] [PASSED] Both, NTSC Default
[05:55:54] [PASSED] Both, PAL Default
[05:55:54] [PASSED] Both, NTSC Default, with PAL on command-line
[05:55:54] [PASSED] Both, PAL Default, with NTSC on command-line
[05:55:54] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[05:55:54] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[05:55:54] ================== drm_rect (9 subtests) ===================
[05:55:54] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[05:55:54] [PASSED] drm_test_rect_clip_scaled_not_clipped
[05:55:54] [PASSED] drm_test_rect_clip_scaled_clipped
[05:55:54] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[05:55:54] ================= drm_test_rect_intersect  =================
[05:55:54] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[05:55:54] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[05:55:54] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[05:55:54] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[05:55:54] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[05:55:54] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[05:55:54] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[05:55:54] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[05:55:54] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[05:55:54] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[05:55:54] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[05:55:54] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[05:55:54] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[05:55:54] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[05:55:54] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[05:55:54] ============= [PASSED] drm_test_rect_intersect =============
[05:55:54] ================ drm_test_rect_calc_hscale  ================
[05:55:54] [PASSED] normal use
[05:55:54] [PASSED] out of max range
[05:55:54] [PASSED] out of min range
[05:55:54] [PASSED] zero dst
[05:55:54] [PASSED] negative src
[05:55:54] [PASSED] negative dst
[05:55:54] ============ [PASSED] drm_test_rect_calc_hscale ============
[05:55:54] ================ drm_test_rect_calc_vscale  ================
[05:55:54] [PASSED] normal use
[05:55:54] [PASSED] out of max range
[05:55:54] [PASSED] out of min range
[05:55:54] [PASSED] zero dst
[05:55:54] [PASSED] negative src
[05:55:54] [PASSED] negative dst
[05:55:54] ============ [PASSED] drm_test_rect_calc_vscale ============
[05:55:54] ================== drm_test_rect_rotate  ===================
[05:55:54] [PASSED] reflect-x
[05:55:54] [PASSED] reflect-y
[05:55:54] [PASSED] rotate-0
[05:55:54] [PASSED] rotate-90
[05:55:54] [PASSED] rotate-180
[05:55:54] [PASSED] rotate-270
[05:55:54] ============== [PASSED] drm_test_rect_rotate ===============
[05:55:54] ================ drm_test_rect_rotate_inv  =================
[05:55:54] [PASSED] reflect-x
[05:55:54] [PASSED] reflect-y
[05:55:54] [PASSED] rotate-0
[05:55:54] [PASSED] rotate-90
[05:55:54] [PASSED] rotate-180
[05:55:54] [PASSED] rotate-270
[05:55:54] ============ [PASSED] drm_test_rect_rotate_inv =============
[05:55:54] ==================== [PASSED] drm_rect =====================
[05:55:54] ============ drm_sysfb_modeset_test (1 subtest) ============
[05:55:54] ============ drm_test_sysfb_build_fourcc_list  =============
[05:55:54] [PASSED] no native formats
[05:55:54] [PASSED] XRGB8888 as native format
[05:55:54] [PASSED] remove duplicates
[05:55:54] [PASSED] convert alpha formats
[05:55:54] [PASSED] random formats
[05:55:54] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[05:55:54] ============= [PASSED] drm_sysfb_modeset_test ==============
[05:55:54] ================== drm_fixp (2 subtests) ===================
[05:55:54] [PASSED] drm_test_int2fixp
[05:55:54] [PASSED] drm_test_sm2fixp
[05:55:54] ==================== [PASSED] drm_fixp =====================
[05:55:54] ============================================================
[05:55:54] Testing complete. Ran 667 tests: passed: 667
[05:55:54] Elapsed time: 28.821s total, 2.581s configuring, 25.924s building, 0.301s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[05:55:54] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:55:56] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[05:56:06] Starting KUnit Kernel (1/1)...
[05:56:06] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[05:56:07] ================= ttm_device (5 subtests) ==================
[05:56:07] [PASSED] ttm_device_init_basic
[05:56:07] [PASSED] ttm_device_init_multiple
[05:56:07] [PASSED] ttm_device_fini_basic
[05:56:07] [PASSED] ttm_device_init_no_vma_man
[05:56:07] ================== ttm_device_init_pools  ==================
[05:56:07] [PASSED] No DMA allocations, no DMA32 required
[05:56:07] [PASSED] DMA allocations, DMA32 required
[05:56:07] [PASSED] No DMA allocations, DMA32 required
[05:56:07] [PASSED] DMA allocations, no DMA32 required
[05:56:07] ============== [PASSED] ttm_device_init_pools ==============
[05:56:07] =================== [PASSED] ttm_device ====================
[05:56:07] ================== ttm_pool (8 subtests) ===================
[05:56:07] ================== ttm_pool_alloc_basic  ===================
[05:56:07] [PASSED] One page
[05:56:07] [PASSED] More than one page
[05:56:07] [PASSED] Above the allocation limit
[05:56:07] [PASSED] One page, with coherent DMA mappings enabled
[05:56:07] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[05:56:07] ============== [PASSED] ttm_pool_alloc_basic ===============
[05:56:07] ============== ttm_pool_alloc_basic_dma_addr  ==============
[05:56:07] [PASSED] One page
[05:56:07] [PASSED] More than one page
[05:56:07] [PASSED] Above the allocation limit
[05:56:07] [PASSED] One page, with coherent DMA mappings enabled
[05:56:07] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[05:56:07] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[05:56:07] [PASSED] ttm_pool_alloc_order_caching_match
[05:56:07] [PASSED] ttm_pool_alloc_caching_mismatch
[05:56:07] [PASSED] ttm_pool_alloc_order_mismatch
[05:56:07] [PASSED] ttm_pool_free_dma_alloc
[05:56:07] [PASSED] ttm_pool_free_no_dma_alloc
[05:56:07] [ERROR] Test: ttm_pool: missing expected subtest!
[05:56:07] 
[05:56:07] Pid: 80, comm: kunit_try_catch Tainted: G        W        N  7.4.0-rc4-gd9cb1a6b53bb
[05:56:07] RIP: 0033:list_lru_count_node+0xe/0x20
[05:56:07] RSP: 00000000b18dbef8  EFLAGS: 00010246
[05:56:07] RAX: 0000000000000001 RBX: 00000000b1803c90 RCX: 0000000000000021
[05:56:07] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000071853030
[05:56:07] RBP: 0000000071853000 R08: 00000000b18dbe98 R09: 0000000000000000
[05:56:07] R10: 00000000b03e5a60 R11: 0000000000000000 R12: 0000000060121160
[05:56:07] R13: 0000000071853030 R14: 000000006046f0e0 R15: 00000000604ba488
[05:56:07] Kernel panic - not syncing: Segfault with no mm
[05:56:07] [CRASHED] 
[05:56:07] [ERROR] Test: ttm_pool: missing subtest result line!
[05:56:07] # module: ttm_pool_test
[05:56:07] ==================== [CRASHED] ttm_pool ====================
[05:56:07] [ERROR] Test: main: missing expected subtest!
[05:56:07] [CRASHED] 
[05:56:07] [ERROR] Test: main: missing expected subtest!
[05:56:07] [CRASHED] 
[05:56:07] [ERROR] Test: main: missing expected subtest!
[05:56:07] [CRASHED] 
[05:56:07] [ERROR] Test: main: missing expected subtest!
[05:56:07] [CRASHED] 
[05:56:07] ============================================================
[05:56:07] Testing complete. Ran 28 tests: passed: 23, crashed: 5, errors: 6
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
[05:56:07] Elapsed time: 12.929s total, 2.567s configuring, 10.046s building, 0.316s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


