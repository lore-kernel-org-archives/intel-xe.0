Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001FF606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 19:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A662210E146;
	Mon, 23 Nov 2026 19:03:55 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B7D10E3A8;
 Mon, 23 Nov 2026 19:03:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe=3A_Skip_OCODE_late_bind?=
 =?utf-8?q?_if_already_running?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Nov 2026 19:03:54 -0000
Message-ID: <179546063441.71919.13694119966196768378@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261123183740.4002390-4-sk.anirban@intel.com>
In-Reply-To: <20261123183740.4002390-4-sk.anirban@intel.com>
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

Series: drm/xe: Skip OCODE late bind if already running
URL   : https://patchwork.freedesktop.org/series/179405/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[19:02:00] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:02:05] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[19:02:25] Starting KUnit Kernel (1/1)...
[19:02:25] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[19:02:25] ================= gpu_buddy (15 subtests) ==================
[19:02:25] [PASSED] gpu_test_buddy_alloc_limit
[19:02:25] [PASSED] gpu_test_buddy_alloc_optimistic
[19:02:25] [PASSED] gpu_test_buddy_alloc_pessimistic
[19:02:25] [PASSED] gpu_test_buddy_alloc_pathological
[19:02:25] [PASSED] gpu_test_buddy_alloc_contiguous
[19:02:25] [PASSED] gpu_test_buddy_alloc_clear
[19:02:25] [PASSED] gpu_test_buddy_alloc_range
[19:02:25] [PASSED] gpu_test_buddy_alloc_range_bias
[19:02:26] [PASSED] gpu_test_buddy_alloc_range_clear_guard
[19:02:27] [PASSED] gpu_test_buddy_fragmentation_performance
[19:02:27] [PASSED] gpu_test_buddy_dirty_tracker_performance
[19:02:27] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[19:02:27] [PASSED] gpu_test_buddy_offset_aligned_allocation
[19:02:27] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[19:02:27] [PASSED] gpu_test_buddy_addr_to_block
[19:02:27] ==================== [PASSED] gpu_buddy ====================
[19:02:27] ============================================================
[19:02:27] Testing complete. Ran 15 tests: passed: 15
[19:02:27] Elapsed time: 27.729s total, 5.098s configuring, 20.614s building, 1.976s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[19:02:28] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:02:30] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[19:03:08] Starting KUnit Kernel (1/1)...
[19:03:08] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[19:03:08] ================= xe_ggtt_iov (9 subtests) =================
[19:03:08] [PASSED] init_shared_pf
[19:03:08] [PASSED] init_partial_overlap
[19:03:08] [PASSED] alloc_usable_pool_low
[19:03:08] [PASSED] alloc_shareable_pool_high
[19:03:08] [PASSED] alloc_partial_overlap
[19:03:08] [PASSED] alloc_partial_overlap_usable_full
[19:03:08] [PASSED] alloc_partial_overlap_shareable_full
[19:03:08] [PASSED] alloc_shareable_pool_unavailable
[19:03:08] [PASSED] alloc_shareable_pool_oversized
[19:03:08] =================== [PASSED] xe_ggtt_iov ===================
[19:03:08] =================== xe_ggtt (3 subtests) ===================
[19:03:08] [PASSED] init_native
[19:03:08] [PASSED] alloc_usable_pool_native
[19:03:08] [PASSED] alloc_usable_pool_oversized
[19:03:08] ===================== [PASSED] xe_ggtt =====================
[19:03:08] ================== guc_buf (11 subtests) ===================
[19:03:08] [PASSED] test_smallest
[19:03:08] [PASSED] test_largest
[19:03:08] [PASSED] test_granular
[19:03:08] [PASSED] test_unique
[19:03:08] [PASSED] test_overlap
[19:03:08] [PASSED] test_reusable
[19:03:08] [PASSED] test_too_big
[19:03:08] [PASSED] test_flush
[19:03:08] [PASSED] test_lookup
[19:03:08] [PASSED] test_data
[19:03:08] [PASSED] test_class
[19:03:08] ===================== [PASSED] guc_buf =====================
[19:03:08] =================== guc_dbm (7 subtests) ===================
[19:03:08] [PASSED] test_empty
[19:03:08] [PASSED] test_default
[19:03:08] ======================== test_size  ========================
[19:03:08] [PASSED] 4
[19:03:08] [PASSED] 8
[19:03:08] [PASSED] 32
[19:03:08] [PASSED] 256
[19:03:08] ==================== [PASSED] test_size ====================
[19:03:08] ======================= test_reuse  ========================
[19:03:08] [PASSED] 4
[19:03:09] [PASSED] 8
[19:03:09] [PASSED] 32
[19:03:09] [PASSED] 256
[19:03:09] =================== [PASSED] test_reuse ====================
[19:03:09] =================== test_range_overlap  ====================
[19:03:09] [PASSED] 4
[19:03:09] [PASSED] 8
[19:03:09] [PASSED] 32
[19:03:09] [PASSED] 256
[19:03:09] =============== [PASSED] test_range_overlap ================
[19:03:09] =================== test_range_compact  ====================
[19:03:09] [PASSED] 4
[19:03:09] [PASSED] 8
[19:03:09] [PASSED] 32
[19:03:09] [PASSED] 256
[19:03:09] =============== [PASSED] test_range_compact ================
[19:03:09] ==================== test_range_spare  =====================
[19:03:09] [PASSED] 4
[19:03:09] [PASSED] 8
[19:03:09] [PASSED] 32
[19:03:09] [PASSED] 256
[19:03:09] ================ [PASSED] test_range_spare =================
[19:03:09] ===================== [PASSED] guc_dbm =====================
[19:03:09] ================== guc_idm (22 subtests) ===================
[19:03:09] [PASSED] bad_init
[19:03:09] [PASSED] no_init
[19:03:09] [PASSED] init_fini
[19:03:09] [PASSED] check_init_small
[19:03:09] [PASSED] check_init_shared
[19:03:09] [PASSED] check_used
[19:03:09] [PASSED] check_quota
[19:03:09] [PASSED] check_all
[19:03:09] [PASSED] check_limits
[19:03:09] [PASSED] check_overlap
[19:03:09] [PASSED] check_overlap_alloc
[19:03:09] [PASSED] check_overlap_release
[19:03:09] [PASSED] check_overlap_partial_init
[19:03:09] [PASSED] check_overlap_partial_shared_range_blocking
[19:03:09] [PASSED] check_used_usable
[19:03:09] [PASSED] check_used_shareable
[19:03:09] [PASSED] check_used_mixed
[19:03:09] [PASSED] check_release_usable_range
[19:03:09] [PASSED] check_release_shareable_range
[19:03:09] [PASSED] check_split_boundaries
[19:03:09] [PASSED] check_shareable_spare
[19:03:09] [PASSED] check_shareable_spare_fragmented_tail
[19:03:09] ===================== [PASSED] guc_idm =====================
[19:03:09] ============== guc_klv_helpers (13 subtests) ===============
[19:03:09] [PASSED] test_count
[19:03:09] [PASSED] test_encode_u32
[19:03:09] [PASSED] test_encode_u64
[19:03:09] [PASSED] test_encode_string
[19:03:09] [PASSED] test_encode_object_raw
[19:03:09] [PASSED] test_encode_object_klv
[19:03:09] [PASSED] test_encode_object_nested
[19:03:09] [PASSED] test_encode_object_basic
[19:03:09] ===================== test_decode_u16  =====================
[19:03:09] [PASSED] empty
[19:03:09] [PASSED] valid
[19:03:09] [PASSED] max
[19:03:09] [PASSED] big
[19:03:09] [PASSED] long
[19:03:09] ================= [PASSED] test_decode_u16 =================
[19:03:09] ===================== test_decode_u32  =====================
[19:03:09] [PASSED] empty
[19:03:09] [PASSED] valid
[19:03:09] [PASSED] max
[19:03:09] [PASSED] long
[19:03:09] ================= [PASSED] test_decode_u32 =================
[19:03:09] ===================== test_decode_u64  =====================
[19:03:09] [PASSED] empty
[19:03:09] [PASSED] short
[19:03:09] [PASSED] valid
[19:03:09] [PASSED] max
[19:03:09] [PASSED] long
[19:03:09] ================= [PASSED] test_decode_u64 =================
[19:03:09] ===================== test_decode_str  =====================
[19:03:09] [PASSED] empty
[19:03:09] [PASSED] one
[19:03:09] [PASSED] one_trash
[19:03:09] [PASSED] two
[19:03:09] [PASSED] two_trash
[19:03:09] [PASSED] three
[19:03:09] [PASSED] dword
[19:03:09] [PASSED] four
[19:03:09] [PASSED] five
[19:03:09] [PASSED] six
[19:03:09] [PASSED] seven
[19:03:09] [PASSED] qword
[19:03:09] ================= [PASSED] test_decode_str =================
[19:03:09] [PASSED] test_print
[19:03:09] ================= [PASSED] guc_klv_helpers =================
[19:03:09] =================== xe_log (4 subtests) ====================
[19:03:09] [PASSED] demo_cper
[19:03:09] [PASSED] demo_dmesg
[19:03:09] ======================= test_dmesg  ========================
[19:03:09] [PASSED] test_fatal
[19:03:09] [PASSED] test_fatal_tile
[19:03:09] [PASSED] test_fatal_gt
[19:03:09] [PASSED] test_fatal_comp
[19:03:09] [PASSED] test_fatal_comp_tile
[19:03:09] [PASSED] test_fatal_comp_gt
[19:03:09] [PASSED] test_fatal_all
[19:03:09] [PASSED] test_recoverable
[19:03:09] [PASSED] test_recoverable_tile
[19:03:09] [PASSED] test_recoverable_gt
[19:03:09] [PASSED] test_recoverable_comp
[19:03:09] [PASSED] test_recoverable_comp_tile
[19:03:09] [PASSED] test_recoverable_comp_gt
[19:03:09] [PASSED] test_recoverable_all
[19:03:09] [PASSED] test_info
[19:03:09] [PASSED] test_info_tile
[19:03:09] [PASSED] test_info_gt
[19:03:09] [PASSED] test_info_err
[19:03:09] [PASSED] test_info_comp
[19:03:09] [PASSED] test_info_comp_tile
[19:03:09] [PASSED] test_info_comp_gt
[19:03:09] [PASSED] test_info_all
[19:03:09] [PASSED] test_hw_fatal
[19:03:09] [PASSED] test_hw_recoverable
[19:03:09] [PASSED] test_hw_corrected
[19:03:09] [PASSED] test_hw_informational
[19:03:09] =================== [PASSED] test_dmesg ====================
[19:03:09] ====================== test_invalid  =======================
[19:03:09] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[19:03:09] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[19:03:09] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[19:03:09] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[19:03:09] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[19:03:09] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[19:03:09] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[19:03:09] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[19:03:09] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[19:03:09] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[19:03:09] ================== [SKIPPED] test_invalid ==================
[19:03:09] ===================== [PASSED] xe_log ======================
[19:03:09] ================== no_relay (3 subtests) ===================
[19:03:09] [PASSED] xe_drops_guc2pf_if_not_ready
[19:03:09] [PASSED] xe_drops_guc2vf_if_not_ready
[19:03:09] [PASSED] xe_rejects_send_if_not_ready
[19:03:09] ==================== [PASSED] no_relay =====================
[19:03:09] ================== pf_relay (14 subtests) ==================
[19:03:09] [PASSED] pf_rejects_guc2pf_too_short
[19:03:09] [PASSED] pf_rejects_guc2pf_too_long
[19:03:09] [PASSED] pf_rejects_guc2pf_no_payload
[19:03:09] [PASSED] pf_fails_no_payload
[19:03:09] [PASSED] pf_fails_bad_origin
[19:03:09] [PASSED] pf_fails_bad_type
[19:03:09] [PASSED] pf_txn_reports_error
[19:03:09] [PASSED] pf_txn_sends_pf2guc
[19:03:09] [PASSED] pf_sends_pf2guc
[19:03:09] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[19:03:09] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[19:03:09] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[19:03:09] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[19:03:09] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[19:03:09] ==================== [PASSED] pf_relay =====================
[19:03:09] ================== vf_relay (3 subtests) ===================
[19:03:09] [PASSED] vf_rejects_guc2vf_too_short
[19:03:09] [PASSED] vf_rejects_guc2vf_too_long
[19:03:09] [PASSED] vf_rejects_guc2vf_no_payload
[19:03:09] ==================== [PASSED] vf_relay =====================
[19:03:09] ================ pf_gt_config (9 subtests) =================
[19:03:09] [PASSED] fair_contexts_1vf
[19:03:09] [PASSED] fair_doorbells_1vf
[19:03:09] [PASSED] fair_ggtt_1vf
[19:03:09] ====================== fair_vram_1vf  ======================
[19:03:09] [PASSED] 3.50 GiB
[19:03:09] [PASSED] 11.5 GiB
[19:03:09] [PASSED] 15.5 GiB
[19:03:09] [PASSED] 31.5 GiB
[19:03:09] [PASSED] 63.5 GiB
[19:03:09] [PASSED] 1.91 GiB
[19:03:09] ================== [PASSED] fair_vram_1vf ==================
[19:03:09] ================ fair_vram_1vf_admin_only  =================
[19:03:09] [PASSED] 3.50 GiB
[19:03:09] [PASSED] 11.5 GiB
[19:03:09] [PASSED] 15.5 GiB
[19:03:09] [PASSED] 31.5 GiB
[19:03:09] [PASSED] 63.5 GiB
[19:03:09] [PASSED] 1.91 GiB
[19:03:09] ============ [PASSED] fair_vram_1vf_admin_only =============
[19:03:09] ====================== fair_contexts  ======================
[19:03:09] [PASSED] 1 VF
[19:03:09] [PASSED] 2 VFs
[19:03:09] [PASSED] 3 VFs
[19:03:09] [PASSED] 4 VFs
[19:03:09] [PASSED] 5 VFs
[19:03:09] [PASSED] 6 VFs
[19:03:09] [PASSED] 7 VFs
[19:03:09] [PASSED] 8 VFs
[19:03:09] [PASSED] 9 VFs
[19:03:09] [PASSED] 10 VFs
[19:03:09] [PASSED] 11 VFs
[19:03:09] [PASSED] 12 VFs
[19:03:09] [PASSED] 13 VFs
[19:03:09] [PASSED] 14 VFs
[19:03:09] [PASSED] 15 VFs
[19:03:09] [PASSED] 16 VFs
[19:03:09] [PASSED] 17 VFs
[19:03:09] [PASSED] 18 VFs
[19:03:09] [PASSED] 19 VFs
[19:03:09] [PASSED] 20 VFs
[19:03:09] [PASSED] 21 VFs
[19:03:09] [PASSED] 22 VFs
[19:03:09] [PASSED] 23 VFs
[19:03:09] [PASSED] 24 VFs
[19:03:09] [PASSED] 25 VFs
[19:03:09] [PASSED] 26 VFs
[19:03:09] [PASSED] 27 VFs
[19:03:09] [PASSED] 28 VFs
[19:03:09] [PASSED] 29 VFs
[19:03:09] [PASSED] 30 VFs
[19:03:09] [PASSED] 31 VFs
[19:03:09] [PASSED] 32 VFs
[19:03:09] [PASSED] 33 VFs
[19:03:09] [PASSED] 34 VFs
[19:03:09] [PASSED] 35 VFs
[19:03:09] [PASSED] 36 VFs
[19:03:09] [PASSED] 37 VFs
[19:03:09] [PASSED] 38 VFs
[19:03:09] [PASSED] 39 VFs
[19:03:09] [PASSED] 40 VFs
[19:03:09] [PASSED] 41 VFs
[19:03:09] [PASSED] 42 VFs
[19:03:09] [PASSED] 43 VFs
[19:03:09] [PASSED] 44 VFs
[19:03:09] [PASSED] 45 VFs
[19:03:09] [PASSED] 46 VFs
[19:03:09] [PASSED] 47 VFs
[19:03:09] [PASSED] 48 VFs
[19:03:09] [PASSED] 49 VFs
[19:03:09] [PASSED] 50 VFs
[19:03:09] [PASSED] 51 VFs
[19:03:09] [PASSED] 52 VFs
[19:03:09] [PASSED] 53 VFs
[19:03:09] [PASSED] 54 VFs
[19:03:09] [PASSED] 55 VFs
[19:03:09] [PASSED] 56 VFs
[19:03:09] [PASSED] 57 VFs
[19:03:09] [PASSED] 58 VFs
[19:03:09] [PASSED] 59 VFs
[19:03:09] [PASSED] 60 VFs
[19:03:09] [PASSED] 61 VFs
[19:03:09] [PASSED] 62 VFs
[19:03:09] [PASSED] 63 VFs
[19:03:09] ================== [PASSED] fair_contexts ==================
[19:03:09] ===================== fair_doorbells  ======================
[19:03:09] [PASSED] 1 VF
[19:03:09] [PASSED] 2 VFs
[19:03:09] [PASSED] 3 VFs
[19:03:09] [PASSED] 4 VFs
[19:03:09] [PASSED] 5 VFs
[19:03:09] [PASSED] 6 VFs
[19:03:09] [PASSED] 7 VFs
[19:03:09] [PASSED] 8 VFs
[19:03:09] [PASSED] 9 VFs
[19:03:09] [PASSED] 10 VFs
[19:03:09] [PASSED] 11 VFs
[19:03:09] [PASSED] 12 VFs
[19:03:09] [PASSED] 13 VFs
[19:03:09] [PASSED] 14 VFs
[19:03:09] [PASSED] 15 VFs
[19:03:09] [PASSED] 16 VFs
[19:03:09] [PASSED] 17 VFs
[19:03:09] [PASSED] 18 VFs
[19:03:09] [PASSED] 19 VFs
[19:03:09] [PASSED] 20 VFs
[19:03:09] [PASSED] 21 VFs
[19:03:09] [PASSED] 22 VFs
[19:03:09] [PASSED] 23 VFs
[19:03:09] [PASSED] 24 VFs
[19:03:09] [PASSED] 25 VFs
[19:03:09] [PASSED] 26 VFs
[19:03:09] [PASSED] 27 VFs
[19:03:09] [PASSED] 28 VFs
[19:03:09] [PASSED] 29 VFs
[19:03:09] [PASSED] 30 VFs
[19:03:09] [PASSED] 31 VFs
[19:03:09] [PASSED] 32 VFs
[19:03:09] [PASSED] 33 VFs
[19:03:09] [PASSED] 34 VFs
[19:03:09] [PASSED] 35 VFs
[19:03:09] [PASSED] 36 VFs
[19:03:09] [PASSED] 37 VFs
[19:03:09] [PASSED] 38 VFs
[19:03:09] [PASSED] 39 VFs
[19:03:09] [PASSED] 40 VFs
[19:03:09] [PASSED] 41 VFs
[19:03:09] [PASSED] 42 VFs
[19:03:09] [PASSED] 43 VFs
[19:03:09] [PASSED] 44 VFs
[19:03:09] [PASSED] 45 VFs
[19:03:09] [PASSED] 46 VFs
[19:03:09] [PASSED] 47 VFs
[19:03:09] [PASSED] 48 VFs
[19:03:09] [PASSED] 49 VFs
[19:03:09] [PASSED] 50 VFs
[19:03:09] [PASSED] 51 VFs
[19:03:09] [PASSED] 52 VFs
[19:03:09] [PASSED] 53 VFs
[19:03:09] [PASSED] 54 VFs
[19:03:09] [PASSED] 55 VFs
[19:03:09] [PASSED] 56 VFs
[19:03:09] [PASSED] 57 VFs
[19:03:09] [PASSED] 58 VFs
[19:03:09] [PASSED] 59 VFs
[19:03:09] [PASSED] 60 VFs
[19:03:09] [PASSED] 61 VFs
[19:03:09] [PASSED] 62 VFs
[19:03:09] [PASSED] 63 VFs
[19:03:09] ================= [PASSED] fair_doorbells ==================
[19:03:09] ======================== fair_ggtt  ========================
[19:03:09] [PASSED] 1 VF
[19:03:09] [PASSED] 2 VFs
[19:03:09] [PASSED] 3 VFs
[19:03:09] [PASSED] 4 VFs
[19:03:09] [PASSED] 5 VFs
[19:03:09] [PASSED] 6 VFs
[19:03:09] [PASSED] 7 VFs
[19:03:09] [PASSED] 8 VFs
[19:03:09] [PASSED] 9 VFs
[19:03:09] [PASSED] 10 VFs
[19:03:09] [PASSED] 11 VFs
[19:03:09] [PASSED] 12 VFs
[19:03:09] [PASSED] 13 VFs
[19:03:09] [PASSED] 14 VFs
[19:03:09] [PASSED] 15 VFs
[19:03:09] [PASSED] 16 VFs
[19:03:09] [PASSED] 17 VFs
[19:03:09] [PASSED] 18 VFs
[19:03:09] [PASSED] 19 VFs
[19:03:09] [PASSED] 20 VFs
[19:03:09] [PASSED] 21 VFs
[19:03:09] [PASSED] 22 VFs
[19:03:09] [PASSED] 23 VFs
[19:03:09] [PASSED] 24 VFs
[19:03:09] [PASSED] 25 VFs
[19:03:09] [PASSED] 26 VFs
[19:03:09] [PASSED] 27 VFs
[19:03:09] [PASSED] 28 VFs
[19:03:09] [PASSED] 29 VFs
[19:03:09] [PASSED] 30 VFs
[19:03:09] [PASSED] 31 VFs
[19:03:09] [PASSED] 32 VFs
[19:03:09] [PASSED] 33 VFs
[19:03:09] [PASSED] 34 VFs
[19:03:09] [PASSED] 35 VFs
[19:03:09] [PASSED] 36 VFs
[19:03:09] [PASSED] 37 VFs
[19:03:09] [PASSED] 38 VFs
[19:03:09] [PASSED] 39 VFs
[19:03:09] [PASSED] 40 VFs
[19:03:09] [PASSED] 41 VFs
[19:03:09] [PASSED] 42 VFs
[19:03:09] [PASSED] 43 VFs
[19:03:09] [PASSED] 44 VFs
[19:03:09] [PASSED] 45 VFs
[19:03:09] [PASSED] 46 VFs
[19:03:09] [PASSED] 47 VFs
[19:03:09] [PASSED] 48 VFs
[19:03:09] [PASSED] 49 VFs
[19:03:09] [PASSED] 50 VFs
[19:03:09] [PASSED] 51 VFs
[19:03:09] [PASSED] 52 VFs
[19:03:09] [PASSED] 53 VFs
[19:03:09] [PASSED] 54 VFs
[19:03:09] [PASSED] 55 VFs
[19:03:09] [PASSED] 56 VFs
[19:03:09] [PASSED] 57 VFs
[19:03:09] [PASSED] 58 VFs
[19:03:09] [PASSED] 59 VFs
[19:03:09] [PASSED] 60 VFs
[19:03:09] [PASSED] 61 VFs
[19:03:09] [PASSED] 62 VFs
[19:03:09] [PASSED] 63 VFs
[19:03:09] ==================== [PASSED] fair_ggtt ====================
[19:03:09] ======================== fair_vram  ========================
[19:03:09] [PASSED] 1 VF
[19:03:09] [PASSED] 2 VFs
[19:03:09] [PASSED] 3 VFs
[19:03:09] [PASSED] 4 VFs
[19:03:09] [PASSED] 5 VFs
[19:03:09] [PASSED] 6 VFs
[19:03:09] [PASSED] 7 VFs
[19:03:09] [PASSED] 8 VFs
[19:03:09] [PASSED] 9 VFs
[19:03:09] [PASSED] 10 VFs
[19:03:09] [PASSED] 11 VFs
[19:03:09] [PASSED] 12 VFs
[19:03:09] [PASSED] 13 VFs
[19:03:09] [PASSED] 14 VFs
[19:03:09] [PASSED] 15 VFs
[19:03:09] [PASSED] 16 VFs
[19:03:09] [PASSED] 17 VFs
[19:03:09] [PASSED] 18 VFs
[19:03:09] [PASSED] 19 VFs
[19:03:09] [PASSED] 20 VFs
[19:03:09] [PASSED] 21 VFs
[19:03:09] [PASSED] 22 VFs
[19:03:09] [PASSED] 23 VFs
[19:03:09] [PASSED] 24 VFs
[19:03:09] [PASSED] 25 VFs
[19:03:09] [PASSED] 26 VFs
[19:03:09] [PASSED] 27 VFs
[19:03:09] [PASSED] 28 VFs
[19:03:09] [PASSED] 29 VFs
[19:03:09] [PASSED] 30 VFs
[19:03:09] [PASSED] 31 VFs
[19:03:09] [PASSED] 32 VFs
[19:03:09] [PASSED] 33 VFs
[19:03:09] [PASSED] 34 VFs
[19:03:09] [PASSED] 35 VFs
[19:03:09] [PASSED] 36 VFs
[19:03:09] [PASSED] 37 VFs
[19:03:09] [PASSED] 38 VFs
[19:03:09] [PASSED] 39 VFs
[19:03:09] [PASSED] 40 VFs
[19:03:09] [PASSED] 41 VFs
[19:03:09] [PASSED] 42 VFs
[19:03:09] [PASSED] 43 VFs
[19:03:09] [PASSED] 44 VFs
[19:03:09] [PASSED] 45 VFs
[19:03:09] [PASSED] 46 VFs
[19:03:09] [PASSED] 47 VFs
[19:03:09] [PASSED] 48 VFs
[19:03:09] [PASSED] 49 VFs
[19:03:09] [PASSED] 50 VFs
[19:03:09] [PASSED] 51 VFs
[19:03:09] [PASSED] 52 VFs
[19:03:09] [PASSED] 53 VFs
[19:03:09] [PASSED] 54 VFs
[19:03:09] [PASSED] 55 VFs
[19:03:09] [PASSED] 56 VFs
[19:03:09] [PASSED] 57 VFs
[19:03:09] [PASSED] 58 VFs
[19:03:09] [PASSED] 59 VFs
[19:03:09] [PASSED] 60 VFs
[19:03:09] [PASSED] 61 VFs
[19:03:09] [PASSED] 62 VFs
[19:03:09] [PASSED] 63 VFs
[19:03:09] ==================== [PASSED] fair_vram ====================
[19:03:09] ================== [PASSED] pf_gt_config ===================
[19:03:09] ===================== lmtt (1 subtest) =====================
[19:03:09] ======================== test_ops  =========================
[19:03:09] [PASSED] 2-level
[19:03:09] [PASSED] multi-level
[19:03:09] ==================== [PASSED] test_ops =====================
[19:03:09] ====================== [PASSED] lmtt =======================
[19:03:09] ================= sriov_packet (1 subtest) =================
[19:03:09] [PASSED] test_descriptor_init
[19:03:09] ================== [PASSED] sriov_packet ===================
[19:03:09] ================= pf_service (11 subtests) =================
[19:03:09] [PASSED] pf_negotiate_any
[19:03:09] [PASSED] pf_negotiate_base_match
[19:03:09] [PASSED] pf_negotiate_base_newer
[19:03:09] [PASSED] pf_negotiate_base_next
[19:03:09] [SKIPPED] pf_negotiate_base_older (no older minor)
[19:03:09] [PASSED] pf_negotiate_base_prev
[19:03:09] [PASSED] pf_negotiate_latest_match
[19:03:09] [PASSED] pf_negotiate_latest_newer
[19:03:09] [PASSED] pf_negotiate_latest_next
[19:03:09] [SKIPPED] pf_negotiate_latest_older (no older minor)
[19:03:09] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[19:03:09] =================== [PASSED] pf_service ====================
[19:03:09] ================= xe_guc_g2g (2 subtests) ==================
[19:03:09] ============== xe_live_guc_g2g_kunit_default  ==============
[19:03:09] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[19:03:09] ============== xe_live_guc_g2g_kunit_allmem  ===============
[19:03:09] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[19:03:09] =================== [SKIPPED] xe_guc_g2g ===================
[19:03:09] =================== xe_mocs (2 subtests) ===================
[19:03:09] ================ xe_live_mocs_kernel_kunit  ================
[19:03:09] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[19:03:09] ================ xe_live_mocs_reset_kunit  =================
[19:03:09] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[19:03:09] ==================== [SKIPPED] xe_mocs =====================
[19:03:09] ================= xe_migrate (3 subtests) ==================
[19:03:09] ================= xe_migrate_sanity_kunit  =================
[19:03:09] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[19:03:09] ================== xe_validate_ccs_kunit  ==================
[19:03:09] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[19:03:09] ============= xe_migrate_access_memory_kunit  ==============
[19:03:09] ========= [SKIPPED] xe_migrate_access_memory_kunit =========
[19:03:09] =================== [SKIPPED] xe_migrate ===================
[19:03:09] ================== xe_dma_buf (1 subtest) ==================
[19:03:09] ==================== xe_dma_buf_kunit  =====================
[19:03:09] ================ [SKIPPED] xe_dma_buf_kunit ================
[19:03:09] =================== [SKIPPED] xe_dma_buf ===================
[19:03:09] ================= xe_bo_shrink (1 subtest) =================
[19:03:09] =================== xe_bo_shrink_kunit  ====================
[19:03:09] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[19:03:09] ================== [SKIPPED] xe_bo_shrink ==================
[19:03:09] ==================== xe_bo (2 subtests) ====================
[19:03:09] ================== xe_ccs_migrate_kunit  ===================
[19:03:09] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[19:03:09] ==================== xe_bo_evict_kunit  ====================
[19:03:09] =============== [SKIPPED] xe_bo_evict_kunit ================
[19:03:09] ===================== [SKIPPED] xe_bo ======================
[19:03:09] =================== xe_any (9 subtests) ====================
[19:03:09] [PASSED] test_to_xe
[19:03:09] [PASSED] test_to_dev
[19:03:09] [PASSED] test_to_pdev
[19:03:09] [PASSED] test_to_drm
[19:03:09] [PASSED] test_if_pdev
[19:03:09] [PASSED] test_if_xe
[19:03:09] [PASSED] test_if_tile
[19:03:09] [PASSED] test_if_gt
[19:03:09] [PASSED] test_to_id
[19:03:09] ===================== [PASSED] xe_any ======================
[19:03:09] ==================== args (13 subtests) ====================
[19:03:09] [PASSED] count_args_test
[19:03:09] [PASSED] call_args_example
[19:03:09] [PASSED] call_args_test
[19:03:09] [PASSED] drop_first_arg_example
[19:03:09] [PASSED] drop_first_arg_test
[19:03:09] [PASSED] first_arg_example
[19:03:09] [PASSED] first_arg_test
[19:03:09] [PASSED] last_arg_example
[19:03:09] [PASSED] last_arg_test
[19:03:09] [PASSED] pick_arg_example
[19:03:09] [PASSED] if_args_example
[19:03:09] [PASSED] if_args_test
[19:03:09] [PASSED] sep_comma_example
[19:03:09] ====================== [PASSED] args =======================
[19:03:09] =================== xe_pci (3 subtests) ====================
[19:03:09] ==================== check_graphics_ip  ====================
[19:03:09] [PASSED] 12.00 Xe_LP
[19:03:09] [PASSED] 12.10 Xe_LP+
[19:03:09] [PASSED] 12.55 Xe_HPG
[19:03:09] [PASSED] 12.60 Xe_HPC
[19:03:09] [PASSED] 12.70 Xe_LPG
[19:03:09] [PASSED] 12.71 Xe_LPG
[19:03:09] [PASSED] 12.74 Xe_LPG+
[19:03:09] [PASSED] 20.01 Xe2_HPG
[19:03:09] [PASSED] 20.02 Xe2_HPG
[19:03:09] [PASSED] 20.04 Xe2_LPG
[19:03:09] [PASSED] 30.00 Xe3_LPG
[19:03:09] [PASSED] 30.01 Xe3_LPG
[19:03:09] [PASSED] 30.03 Xe3_LPG
[19:03:09] [PASSED] 30.04 Xe3_LPG
[19:03:09] [PASSED] 30.05 Xe3_LPG
[19:03:09] [PASSED] 35.10 Xe3p_LPG
[19:03:09] [PASSED] 35.11 Xe3p_XPC
[19:03:09] ================ [PASSED] check_graphics_ip ================
[19:03:09] ===================== check_media_ip  ======================
[19:03:09] [PASSED] 12.00 Xe_M
[19:03:09] [PASSED] 12.55 Xe_HPM
[19:03:09] [PASSED] 13.00 Xe_LPM+
[19:03:09] [PASSED] 13.01 Xe2_HPM
[19:03:09] [PASSED] 20.00 Xe2_LPM
[19:03:09] [PASSED] 30.00 Xe3_LPM
[19:03:09] [PASSED] 30.02 Xe3_LPM
[19:03:09] [PASSED] 35.00 Xe3p_LPM
[19:03:09] [PASSED] 35.03 Xe3p_HPM
[19:03:09] ================= [PASSED] check_media_ip ==================
[19:03:09] =================== check_platform_desc  ===================
[19:03:09] [PASSED] 0x9A60 (TIGERLAKE)
[19:03:09] [PASSED] 0x9A68 (TIGERLAKE)
[19:03:09] [PASSED] 0x9A70 (TIGERLAKE)
[19:03:09] [PASSED] 0x9A40 (TIGERLAKE)
[19:03:09] [PASSED] 0x9A49 (TIGERLAKE)
[19:03:09] [PASSED] 0x9A59 (TIGERLAKE)
[19:03:09] [PASSED] 0x9A78 (TIGERLAKE)
[19:03:09] [PASSED] 0x9AC0 (TIGERLAKE)
[19:03:09] [PASSED] 0x9AC9 (TIGERLAKE)
[19:03:09] [PASSED] 0x9AD9 (TIGERLAKE)
[19:03:09] [PASSED] 0x9AF8 (TIGERLAKE)
[19:03:09] [PASSED] 0x4C80 (ROCKETLAKE)
[19:03:09] [PASSED] 0x4C8A (ROCKETLAKE)
[19:03:09] [PASSED] 0x4C8B (ROCKETLAKE)
[19:03:09] [PASSED] 0x4C8C (ROCKETLAKE)
[19:03:09] [PASSED] 0x4C90 (ROCKETLAKE)
[19:03:09] [PASSED] 0x4C9A (ROCKETLAKE)
[19:03:09] [PASSED] 0x4680 (ALDERLAKE_S)
[19:03:09] [PASSED] 0x4682 (ALDERLAKE_S)
[19:03:09] [PASSED] 0x4688 (ALDERLAKE_S)
[19:03:09] [PASSED] 0x468A (ALDERLAKE_S)
[19:03:09] [PASSED] 0x468B (ALDERLAKE_S)
[19:03:09] [PASSED] 0x4690 (ALDERLAKE_S)
[19:03:09] [PASSED] 0x4692 (ALDERLAKE_S)
[19:03:09] [PASSED] 0x4693 (ALDERLAKE_S)
[19:03:09] [PASSED] 0x46A0 (ALDERLAKE_P)
[19:03:09] [PASSED] 0x46A1 (ALDERLAKE_P)
[19:03:09] [PASSED] 0x46A2 (ALDERLAKE_P)
[19:03:09] [PASSED] 0x46A3 (ALDERLAKE_P)
[19:03:09] [PASSED] 0x46A6 (ALDERLAKE_P)
[19:03:09] [PASSED] 0x46A8 (ALDERLAKE_P)
[19:03:09] [PASSED] 0x46AA (ALDERLAKE_P)
[19:03:09] [PASSED] 0x462A (ALDERLAKE_P)
[19:03:09] [PASSED] 0x4626 (ALDERLAKE_P)
[19:03:09] [PASSED] 0x4628 (ALDERLAKE_P)
[19:03:09] [PASSED] 0x46B0 (ALDERLAKE_P)
[19:03:09] [PASSED] 0x46B1 (ALDERLAKE_P)
[19:03:09] [PASSED] 0x46B2 (ALDERLAKE_P)
[19:03:09] [PASSED] 0x46B3 (ALDERLAKE_P)
[19:03:09] [PASSED] 0x46C0 (ALDERLAKE_P)
[19:03:09] [PASSED] 0x46C1 (ALDERLAKE_P)
[19:03:09] [PASSED] 0x46C2 (ALDERLAKE_P)
[19:03:09] [PASSED] 0x46C3 (ALDERLAKE_P)
[19:03:09] [PASSED] 0x46D0 (ALDERLAKE_N)
[19:03:09] [PASSED] 0x46D1 (ALDERLAKE_N)
[19:03:09] [PASSED] 0x46D2 (ALDERLAKE_N)
[19:03:09] [PASSED] 0x46D3 (ALDERLAKE_N)
[19:03:09] [PASSED] 0x46D4 (ALDERLAKE_N)
[19:03:09] [PASSED] 0xA721 (ALDERLAKE_P)
[19:03:09] [PASSED] 0xA7A1 (ALDERLAKE_P)
[19:03:09] [PASSED] 0xA7A9 (ALDERLAKE_P)
[19:03:09] [PASSED] 0xA7AC (ALDERLAKE_P)
[19:03:09] [PASSED] 0xA7AD (ALDERLAKE_P)
[19:03:09] [PASSED] 0xA720 (ALDERLAKE_P)
[19:03:09] [PASSED] 0xA7A0 (ALDERLAKE_P)
[19:03:09] [PASSED] 0xA7A8 (ALDERLAKE_P)
[19:03:09] [PASSED] 0xA7AA (ALDERLAKE_P)
[19:03:09] [PASSED] 0xA7AB (ALDERLAKE_P)
[19:03:09] [PASSED] 0xA780 (ALDERLAKE_S)
[19:03:09] [PASSED] 0xA781 (ALDERLAKE_S)
[19:03:09] [PASSED] 0xA782 (ALDERLAKE_S)
[19:03:09] [PASSED] 0xA783 (ALDERLAKE_S)
[19:03:09] [PASSED] 0xA788 (ALDERLAKE_S)
[19:03:09] [PASSED] 0xA789 (ALDERLAKE_S)
[19:03:09] [PASSED] 0xA78A (ALDERLAKE_S)
[19:03:09] [PASSED] 0xA78B (ALDERLAKE_S)
[19:03:09] [PASSED] 0x4905 (DG1)
[19:03:09] [PASSED] 0x4906 (DG1)
[19:03:09] [PASSED] 0x4907 (DG1)
[19:03:09] [PASSED] 0x4908 (DG1)
[19:03:09] [PASSED] 0x4909 (DG1)
[19:03:09] [PASSED] 0x56C0 (DG2)
[19:03:09] [PASSED] 0x56C2 (DG2)
[19:03:09] [PASSED] 0x56C1 (DG2)
[19:03:09] [PASSED] 0x7D51 (METEORLAKE)
[19:03:09] [PASSED] 0x7DD1 (METEORLAKE)
[19:03:09] [PASSED] 0x7D41 (METEORLAKE)
[19:03:09] [PASSED] 0x7D67 (METEORLAKE)
[19:03:09] [PASSED] 0xB640 (METEORLAKE)
[19:03:09] [PASSED] 0x56A0 (DG2)
[19:03:09] [PASSED] 0x56A1 (DG2)
[19:03:09] [PASSED] 0x56A2 (DG2)
[19:03:09] [PASSED] 0x56BE (DG2)
[19:03:09] [PASSED] 0x56BF (DG2)
[19:03:09] [PASSED] 0x5690 (DG2)
[19:03:09] [PASSED] 0x5691 (DG2)
[19:03:09] [PASSED] 0x5692 (DG2)
[19:03:09] [PASSED] 0x56A5 (DG2)
[19:03:09] [PASSED] 0x56A6 (DG2)
[19:03:09] [PASSED] 0x56B0 (DG2)
[19:03:09] [PASSED] 0x56B1 (DG2)
[19:03:09] [PASSED] 0x56BA (DG2)
[19:03:09] [PASSED] 0x56BB (DG2)
[19:03:09] [PASSED] 0x56BC (DG2)
[19:03:09] [PASSED] 0x56BD (DG2)
[19:03:09] [PASSED] 0x5693 (DG2)
[19:03:09] [PASSED] 0x5694 (DG2)
[19:03:09] [PASSED] 0x5695 (DG2)
[19:03:09] [PASSED] 0x56A3 (DG2)
[19:03:09] [PASSED] 0x56A4 (DG2)
[19:03:09] [PASSED] 0x56B2 (DG2)
[19:03:09] [PASSED] 0x56B3 (DG2)
[19:03:09] [PASSED] 0x5696 (DG2)
[19:03:09] [PASSED] 0x5697 (DG2)
[19:03:09] [PASSED] 0xB69 (PVC)
[19:03:09] [PASSED] 0xB6E (PVC)
[19:03:09] [PASSED] 0xBD4 (PVC)
[19:03:09] [PASSED] 0xBD5 (PVC)
[19:03:09] [PASSED] 0xBD6 (PVC)
[19:03:09] [PASSED] 0xBD7 (PVC)
[19:03:09] [PASSED] 0xBD8 (PVC)
[19:03:09] [PASSED] 0xBD9 (PVC)
[19:03:09] [PASSED] 0xBDA (PVC)
[19:03:09] [PASSED] 0xBDB (PVC)
[19:03:09] [PASSED] 0xBE0 (PVC)
[19:03:09] [PASSED] 0xBE1 (PVC)
[19:03:09] [PASSED] 0xBE5 (PVC)
[19:03:09] [PASSED] 0x7D40 (METEORLAKE)
[19:03:09] [PASSED] 0x7D45 (METEORLAKE)
[19:03:09] [PASSED] 0x7D55 (METEORLAKE)
[19:03:09] [PASSED] 0x7D60 (METEORLAKE)
[19:03:09] [PASSED] 0x7DD5 (METEORLAKE)
[19:03:09] [PASSED] 0x6420 (LUNARLAKE)
[19:03:09] [PASSED] 0x64A0 (LUNARLAKE)
[19:03:09] [PASSED] 0x64B0 (LUNARLAKE)
[19:03:09] [PASSED] 0xE202 (BATTLEMAGE)
[19:03:09] [PASSED] 0xE209 (BATTLEMAGE)
[19:03:09] [PASSED] 0xE20B (BATTLEMAGE)
[19:03:09] [PASSED] 0xE20C (BATTLEMAGE)
[19:03:09] [PASSED] 0xE20D (BATTLEMAGE)
[19:03:09] [PASSED] 0xE210 (BATTLEMAGE)
[19:03:09] [PASSED] 0xE211 (BATTLEMAGE)
[19:03:09] [PASSED] 0xE212 (BATTLEMAGE)
[19:03:09] [PASSED] 0xE216 (BATTLEMAGE)
[19:03:09] [PASSED] 0xE220 (BATTLEMAGE)
[19:03:09] [PASSED] 0xE221 (BATTLEMAGE)
[19:03:09] [PASSED] 0xE222 (BATTLEMAGE)
[19:03:09] [PASSED] 0xE223 (BATTLEMAGE)
[19:03:09] [PASSED] 0xB080 (PANTHERLAKE)
[19:03:09] [PASSED] 0xB081 (PANTHERLAKE)
[19:03:09] [PASSED] 0xB082 (PANTHERLAKE)
[19:03:09] [PASSED] 0xB083 (PANTHERLAKE)
[19:03:09] [PASSED] 0xB084 (PANTHERLAKE)
[19:03:09] [PASSED] 0xB085 (PANTHERLAKE)
[19:03:09] [PASSED] 0xB086 (PANTHERLAKE)
[19:03:09] [PASSED] 0xB087 (PANTHERLAKE)
[19:03:09] [PASSED] 0xB08F (PANTHERLAKE)
[19:03:09] [PASSED] 0xB090 (PANTHERLAKE)
[19:03:09] [PASSED] 0xB0A0 (PANTHERLAKE)
[19:03:09] [PASSED] 0xB0A1 (PANTHERLAKE)
[19:03:09] [PASSED] 0xB0B0 (PANTHERLAKE)
[19:03:09] [PASSED] 0xFD80 (PANTHERLAKE)
[19:03:09] [PASSED] 0xFD81 (PANTHERLAKE)
[19:03:09] [PASSED] 0xD740 (NOVALAKE_S)
[19:03:09] [PASSED] 0xD741 (NOVALAKE_S)
[19:03:09] [PASSED] 0xD742 (NOVALAKE_S)
[19:03:09] [PASSED] 0xD743 (NOVALAKE_S)
[19:03:09] [PASSED] 0xD745 (NOVALAKE_S)
[19:03:09] [PASSED] 0xD74A (NOVALAKE_S)
[19:03:09] [PASSED] 0xD74B (NOVALAKE_S)
[19:03:09] [PASSED] 0x674C (CRESCENTISLAND)
[19:03:09] [PASSED] 0x674D (CRESCENTISLAND)
[19:03:09] [PASSED] 0x674E (CRESCENTISLAND)
[19:03:09] [PASSED] 0x674F (CRESCENTISLAND)
[19:03:09] [PASSED] 0x6750 (CRESCENTISLAND)
[19:03:09] [PASSED] 0x6751 (CRESCENTISLAND)
[19:03:09] [PASSED] 0x6752 (CRESCENTISLAND)
[19:03:09] [PASSED] 0x6753 (CRESCENTISLAND)
[19:03:09] [PASSED] 0x6754 (CRESCENTISLAND)
[19:03:09] [PASSED] 0x6755 (CRESCENTISLAND)
[19:03:09] [PASSED] 0x6756 (CRESCENTISLAND)
[19:03:09] [PASSED] 0xD750 (NOVALAKE_P)
[19:03:09] [PASSED] 0xD751 (NOVALAKE_P)
[19:03:09] [PASSED] 0xD752 (NOVALAKE_P)
[19:03:09] [PASSED] 0xD753 (NOVALAKE_P)
[19:03:09] [PASSED] 0xD754 (NOVALAKE_P)
[19:03:09] [PASSED] 0xD755 (NOVALAKE_P)
[19:03:09] [PASSED] 0xD756 (NOVALAKE_P)
[19:03:09] [PASSED] 0xD757 (NOVALAKE_P)
[19:03:09] [PASSED] 0xD75F (NOVALAKE_P)
[19:03:09] =============== [PASSED] check_platform_desc ===============
[19:03:09] ===================== [PASSED] xe_pci ======================
[19:03:09] ============= xe_rtp_tables_test (5 subtests) ==============
[19:03:09] ================== xe_rtp_table_gt_test  ===================
[19:03:09] [PASSED] gt_was/14011060649
[19:03:09] [PASSED] gt_was/14011059788
[19:03:09] [PASSED] gt_was/14015795083
[19:03:09] [PASSED] gt_was/16021867713
[19:03:09] [PASSED] gt_was/14019449301
[19:03:09] [PASSED] gt_was/16028005424
[19:03:09] [PASSED] gt_was/14026578760
[19:03:09] [PASSED] gt_was/1409420604
[19:03:09] [PASSED] gt_was/1408615072
[19:03:09] [PASSED] gt_was/22010523718
[19:03:09] [PASSED] gt_was/14011006942
[19:03:09] [PASSED] gt_was/14014830051
[19:03:09] [PASSED] gt_was/18018781329
[19:03:09] [PASSED] gt_was/1509235366
[19:03:09] [PASSED] gt_was/18018781329
[19:03:09] [PASSED] gt_was/16016694945
[19:03:09] [PASSED] gt_was/14018575942
[19:03:09] [PASSED] gt_was/22016670082
[19:03:09] [PASSED] gt_was/22016670082
[19:03:09] [PASSED] gt_was/14017421178
[19:03:09] [PASSED] gt_was/16025250150
[19:03:09] [PASSED] gt_was/14021871409
[19:03:09] [PASSED] gt_was/16021865536
[19:03:09] [PASSED] gt_was/14021486841
[19:03:09] [PASSED] gt_was/14025160223
[19:03:09] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[19:03:09] [PASSED] gt_was/14025635424
[19:03:09] [PASSED] gt_was/16028005424
[19:03:09] ============== [PASSED] xe_rtp_table_gt_test ===============
[19:03:09] ================== xe_rtp_table_gt_test  ===================
[19:03:09] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[19:03:09] [PASSED] gt_tunings/Tuning: 32B Access Enable
[19:03:09] [PASSED] gt_tunings/Tuning: L3 cache
[19:03:09] [PASSED] gt_tunings/Tuning: L3 cache - media
[19:03:09] [PASSED] gt_tunings/Tuning: Compression Overfetch
[19:03:09] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[19:03:09] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[19:03:09] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[19:03:09] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[19:03:09] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[19:03:09] [PASSED] gt_tunings/Tuning: Stateless compression control
[19:03:09] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[19:03:09] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[19:03:09] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[19:03:09] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[19:03:09] [PASSED] gt_tunings/Tuning: Force All Non-Compressible Memory Reads to be 256B Overfetches
[19:03:09] ============== [PASSED] xe_rtp_table_gt_test ===============
[19:03:09] ================== xe_rtp_table_oob_test  ==================
[19:03:09] [PASSED] oob_was/1607983814
[19:03:09] [PASSED] oob_was/16010904313
[19:03:09] [PASSED] oob_was/18022495364
[19:03:09] [PASSED] oob_was/22012773006
[19:03:09] [PASSED] oob_was/14014475959
[19:03:09] [PASSED] oob_was/22011391025
[19:03:09] [PASSED] oob_was/22012727170
[19:03:09] [PASSED] oob_was/22012727685
[19:03:09] [PASSED] oob_was/22016596838
[19:03:09] [PASSED] oob_was/18020744125
[19:03:09] [PASSED] oob_was/1409600907
[19:03:09] [PASSED] oob_was/22014953428
[19:03:09] [PASSED] oob_was/16017236439
[19:03:09] [PASSED] oob_was/14019821291
[19:03:09] [PASSED] oob_was/14015076503
[19:03:09] [PASSED] oob_was/22016122933
[19:03:09] [PASSED] oob_was/14018913170
[19:03:09] [PASSED] oob_was/14018094691
[19:03:09] [PASSED] oob_was/18024947630
[19:03:09] [PASSED] oob_was/16022287689
[19:03:09] [PASSED] oob_was/13011645652
[19:03:09] [PASSED] oob_was/14022293748
[19:03:09] [PASSED] oob_was/22019794406
[19:03:09] [PASSED] oob_was/22019338487
[19:03:09] [PASSED] oob_was/16023588340
[19:03:09] [PASSED] oob_was/14019789679
[19:03:09] [PASSED] oob_was/14022866841
[19:03:09] [PASSED] oob_was/16021333562
[19:03:09] [PASSED] oob_was/14016712196
[19:03:09] [PASSED] oob_was/14015568240
[19:03:09] [PASSED] oob_was/18013179988
[19:03:09] [PASSED] oob_was/1508761755
[19:03:09] [PASSED] oob_was/16023105232
[19:03:09] [PASSED] oob_was/16026508708
[19:03:09] [PASSED] oob_was/14020001231
[19:03:09] [PASSED] oob_was/16023683509
[19:03:09] [PASSED] oob_was/14025515070
[19:03:09] [PASSED] oob_was/15015404425_disable
[19:03:09] [PASSED] oob_was/16026007364
[19:03:09] [PASSED] oob_was/14020316580
[19:03:09] [PASSED] oob_was/14025883347
[19:03:09] [PASSED] oob_was/16029380221
[19:03:09] [PASSED] oob_was/22022079272
[19:03:09] [PASSED] oob_was/16029897822
[19:03:09] [PASSED] oob_was/14026539277
[19:03:09] [PASSED] oob_was/14027054324
[19:03:09] [PASSED] oob_was/14025941587
[19:03:09] [PASSED] oob_was/16030224309
[19:03:09] [PASSED] oob_was/14028709524
[19:03:09] [PASSED] oob_was/14028250015
[19:03:09] [PASSED] oob_was/16031259911
[19:03:09] ============== [PASSED] xe_rtp_table_oob_test ==============
[19:03:09] ================ xe_rtp_table_dev_oob_test  ================
[19:03:09] [PASSED] device_oob_was/22010954014
[19:03:09] [PASSED] device_oob_was/15015404425
[19:03:09] [PASSED] device_oob_was/22019338487_display
[19:03:09] [PASSED] device_oob_was/14022085890
[19:03:09] [PASSED] device_oob_was/14026633728
[19:03:09] [PASSED] device_oob_was/14026746987
[19:03:09] [PASSED] device_oob_was/14026779378
[19:03:09] [PASSED] device_oob_was/14028586678
[19:03:09] [PASSED] device_oob_was/14028434957
[19:03:09] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[19:03:09] ========== xe_rtp_table_missing_upper_bound_test  ==========
[19:03:09] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[19:03:09] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[19:03:09] [PASSED] register_whitelist/1806527549
[19:03:09] [PASSED] register_whitelist/allow_read_ctx_timestamp
[19:03:09] [PASSED] register_whitelist/allow_read_queue_timestamp
[19:03:09] [PASSED] register_whitelist/16014440446
[19:03:09] [PASSED] register_whitelist/16017236439
[19:03:09] [PASSED] register_whitelist/16020183090
[19:03:09] [PASSED] register_whitelist/14024997852
[19:03:09] [PASSED] register_whitelist/14024997852
[19:03:09] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[19:03:09] =============== [PASSED] xe_rtp_tables_test ================
[19:03:09] =================== xe_rtp (3 subtests) ====================
[19:03:09] =================== xe_rtp_rules_tests  ====================
[19:03:09] [PASSED] no
[19:03:09] [PASSED] yes
[19:03:09] [PASSED] no-and-no
[19:03:09] [PASSED] no-and-yes
[19:03:09] [PASSED] yes-and-no
[19:03:09] [PASSED] yes-and-yes
[19:03:09] [PASSED] no-or-no
[19:03:09] [PASSED] no-or-yes
[19:03:09] [PASSED] yes-or-no
[19:03:09] [PASSED] yes-or-yes
[19:03:09] [PASSED] no-yes-or-yes-no
[19:03:09] [PASSED] no-yes-or-yes-yes
[19:03:09] [PASSED] yes-yes-or-no-yes
[19:03:09] [PASSED] yes-yes-or-yes-yes
[19:03:09] [PASSED] no-no-or-yes-or-no
[19:03:09] [PASSED] or
[19:03:09] [PASSED] or-yes
[19:03:09] [PASSED] or-no
[19:03:09] [PASSED] yes-or
[19:03:09] [PASSED] no-or
[19:03:09] [PASSED] no-or-or-yes
[19:03:09] [PASSED] yes-or-or-no
[19:03:09] [PASSED] no-or-or-no
[19:03:09] [PASSED] missing-context-engine-class
[19:03:09] [PASSED] missing-context-engine-class-or-yes
[19:03:09] [PASSED] missing-context-engine-class-or-or-yes
[19:03:09] =============== [PASSED] xe_rtp_rules_tests ================
[19:03:09] =============== xe_rtp_process_to_sr_tests  ================
[19:03:09] [PASSED] coalesce-same-reg
[19:03:09] [PASSED] coalesce-same-reg-literal-and-func
[19:03:09] [PASSED] no-match-no-add
[19:03:09] [PASSED] two-regs-two-entries
[19:03:09] [PASSED] clr-one-set-other
[19:03:09] [PASSED] set-field
[19:03:09] [PASSED] conflict-duplicate
[19:03:09] [PASSED] conflict-not-disjoint
[19:03:09] [PASSED] conflict-not-disjoint-literal-and-func
[19:03:09] [PASSED] conflict-reg-type
[19:03:09] [PASSED] bad-mcr-reg-forced-to-regular
[19:03:09] [PASSED] bad-regular-reg-forced-to-mcr
[19:03:09] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[19:03:09] ================== xe_rtp_process_tests  ===================
[19:03:09] [PASSED] active1
[19:03:09] [PASSED] active2
[19:03:09] [PASSED] active-inactive
[19:03:09] [PASSED] inactive-active
[19:03:09] [PASSED] inactive-active-inactive
[19:03:09] [PASSED] inactive-inactive-inactive
[19:03:09] ============== [PASSED] xe_rtp_process_tests ===============
[19:03:09] ===================== [PASSED] xe_rtp ======================
[19:03:09] ==================== xe_wa (1 subtest) =====================
[19:03:09] ======================== xe_wa_gt  =========================
[19:03:09] [PASSED] TIGERLAKE B0
[19:03:09] [PASSED] DG1 A0
[19:03:09] [PASSED] DG1 B0
[19:03:09] [PASSED] ALDERLAKE_S A0
[19:03:09] [PASSED] ALDERLAKE_S B0
[19:03:09] [PASSED] ALDERLAKE_S C0
[19:03:09] [PASSED] ALDERLAKE_S D0
[19:03:09] [PASSED] ALDERLAKE_P A0
[19:03:09] [PASSED] ALDERLAKE_P B0
[19:03:09] [PASSED] ALDERLAKE_P C0
[19:03:09] [PASSED] ALDERLAKE_S RPLS D0
[19:03:09] [PASSED] ALDERLAKE_P RPLU E0
[19:03:09] [PASSED] DG2 G10 C0
[19:03:09] [PASSED] DG2 G11 B1
[19:03:09] [PASSED] DG2 G12 A1
[19:03:09] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[19:03:09] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[19:03:09] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[19:03:09] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[19:03:09] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[19:03:09] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[19:03:09] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[19:03:09] ==================== [PASSED] xe_wa_gt =====================
[19:03:09] ====================== [PASSED] xe_wa ======================
[19:03:09] ============================================================
[19:03:09] Testing complete. Ran 860 tests: passed: 831, skipped: 29
[19:03:09] Elapsed time: 41.503s total, 2.612s configuring, 38.175s building, 0.674s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[19:03:09] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:03:12] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[19:03:37] Starting KUnit Kernel (1/1)...
[19:03:37] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[19:03:37] ============ drm_test_pick_cmdline (2 subtests) ============
[19:03:37] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[19:03:37] =============== drm_test_pick_cmdline_named  ===============
[19:03:37] [PASSED] NTSC
[19:03:37] [PASSED] NTSC-J
[19:03:37] [PASSED] PAL
[19:03:37] [PASSED] PAL-M
[19:03:37] =========== [PASSED] drm_test_pick_cmdline_named ===========
[19:03:37] ============== [PASSED] drm_test_pick_cmdline ==============
[19:03:37] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[19:03:37] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[19:03:37] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[19:03:37] =========== drm_validate_clone_mode (2 subtests) ===========
[19:03:37] ============== drm_test_check_in_clone_mode  ===============
[19:03:37] [PASSED] in_clone_mode
[19:03:37] [PASSED] not_in_clone_mode
[19:03:37] ========== [PASSED] drm_test_check_in_clone_mode ===========
[19:03:37] =============== drm_test_check_valid_clones  ===============
[19:03:37] [PASSED] not_in_clone_mode
[19:03:37] [PASSED] valid_clone
[19:03:37] [PASSED] invalid_clone
[19:03:37] =========== [PASSED] drm_test_check_valid_clones ===========
[19:03:37] ============= [PASSED] drm_validate_clone_mode =============
[19:03:37] ============= drm_validate_modeset (1 subtest) =============
[19:03:37] [PASSED] drm_test_check_connector_changed_modeset
[19:03:37] ============== [PASSED] drm_validate_modeset ===============
[19:03:37] ====== drm_test_bridge_get_current_state (1 subtest) =======
[19:03:37] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[19:03:37] ======== [PASSED] drm_test_bridge_get_current_state ========
[19:03:37] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[19:03:37] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[19:03:37] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[19:03:37] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[19:03:37] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[19:03:37] ============== drm_bridge_alloc (2 subtests) ===============
[19:03:37] [PASSED] drm_test_drm_bridge_alloc_basic
[19:03:37] [PASSED] drm_test_drm_bridge_alloc_get_put
[19:03:37] ================ [PASSED] drm_bridge_alloc =================
[19:03:37] ============= drm_bridge_bus_fmt (5 subtests) ==============
[19:03:37] [PASSED] drm_test_bridge_rgb_yuv_rgb
[19:03:37] [PASSED] drm_test_bridge_must_convert_to_yuv444
[19:03:37] [PASSED] drm_test_bridge_hdmi_auto_rgb
[19:03:37] [PASSED] drm_test_bridge_auto_first
[19:03:37] [PASSED] drm_test_bridge_rgb_yuv_no_path
[19:03:37] =============== [PASSED] drm_bridge_bus_fmt ================
[19:03:37] ============= drm_cmdline_parser (40 subtests) =============
[19:03:37] [PASSED] drm_test_cmdline_force_d_only
[19:03:37] [PASSED] drm_test_cmdline_force_D_only_dvi
[19:03:37] [PASSED] drm_test_cmdline_force_D_only_hdmi
[19:03:37] [PASSED] drm_test_cmdline_force_D_only_not_digital
[19:03:37] [PASSED] drm_test_cmdline_force_e_only
[19:03:37] [PASSED] drm_test_cmdline_res
[19:03:37] [PASSED] drm_test_cmdline_res_vesa
[19:03:37] [PASSED] drm_test_cmdline_res_vesa_rblank
[19:03:37] [PASSED] drm_test_cmdline_res_rblank
[19:03:37] [PASSED] drm_test_cmdline_res_bpp
[19:03:37] [PASSED] drm_test_cmdline_res_refresh
[19:03:37] [PASSED] drm_test_cmdline_res_bpp_refresh
[19:03:37] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[19:03:37] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[19:03:37] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[19:03:37] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[19:03:37] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[19:03:37] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[19:03:37] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[19:03:37] [PASSED] drm_test_cmdline_res_margins_force_on
[19:03:37] [PASSED] drm_test_cmdline_res_vesa_margins
[19:03:37] [PASSED] drm_test_cmdline_name
[19:03:37] [PASSED] drm_test_cmdline_name_bpp
[19:03:37] [PASSED] drm_test_cmdline_name_option
[19:03:37] [PASSED] drm_test_cmdline_name_bpp_option
[19:03:37] [PASSED] drm_test_cmdline_rotate_0
[19:03:37] [PASSED] drm_test_cmdline_rotate_90
[19:03:37] [PASSED] drm_test_cmdline_rotate_180
[19:03:37] [PASSED] drm_test_cmdline_rotate_270
[19:03:37] [PASSED] drm_test_cmdline_hmirror
[19:03:37] [PASSED] drm_test_cmdline_vmirror
[19:03:37] [PASSED] drm_test_cmdline_margin_options
[19:03:37] [PASSED] drm_test_cmdline_multiple_options
[19:03:37] [PASSED] drm_test_cmdline_bpp_extra_and_option
[19:03:37] [PASSED] drm_test_cmdline_extra_and_option
[19:03:37] [PASSED] drm_test_cmdline_freestanding_options
[19:03:37] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[19:03:37] [PASSED] drm_test_cmdline_panel_orientation
[19:03:37] ================ drm_test_cmdline_invalid  =================
[19:03:37] [PASSED] margin_only
[19:03:37] [PASSED] interlace_only
[19:03:37] [PASSED] res_missing_x
[19:03:37] [PASSED] res_missing_y
[19:03:37] [PASSED] res_bad_y
[19:03:37] [PASSED] res_missing_y_bpp
[19:03:37] [PASSED] res_bad_bpp
[19:03:37] [PASSED] res_bad_refresh
[19:03:37] [PASSED] res_bpp_refresh_force_on_off
[19:03:37] [PASSED] res_invalid_mode
[19:03:37] [PASSED] res_bpp_wrong_place_mode
[19:03:37] [PASSED] name_bpp_refresh
[19:03:37] [PASSED] name_refresh
[19:03:37] [PASSED] name_refresh_wrong_mode
[19:03:37] [PASSED] name_refresh_invalid_mode
[19:03:37] [PASSED] rotate_multiple
[19:03:37] [PASSED] rotate_invalid_val
[19:03:37] [PASSED] rotate_truncated
[19:03:37] [PASSED] invalid_option
[19:03:37] [PASSED] invalid_tv_option
[19:03:37] [PASSED] truncated_tv_option
[19:03:37] ============ [PASSED] drm_test_cmdline_invalid =============
[19:03:37] =============== drm_test_cmdline_tv_options  ===============
[19:03:37] [PASSED] NTSC
[19:03:37] [PASSED] NTSC_443
[19:03:37] [PASSED] NTSC_J
[19:03:37] [PASSED] PAL
[19:03:37] [PASSED] PAL_M
[19:03:37] [PASSED] PAL_N
[19:03:37] [PASSED] SECAM
[19:03:37] [PASSED] MONO_525
[19:03:37] [PASSED] MONO_625
[19:03:37] =========== [PASSED] drm_test_cmdline_tv_options ===========
[19:03:37] =============== [PASSED] drm_cmdline_parser ================
[19:03:37] ========== drmm_connector_hdmi_init (20 subtests) ==========
[19:03:37] [PASSED] drm_test_connector_hdmi_init_valid
[19:03:37] [PASSED] drm_test_connector_hdmi_init_bpc_8
[19:03:37] [PASSED] drm_test_connector_hdmi_init_bpc_10
[19:03:37] [PASSED] drm_test_connector_hdmi_init_bpc_12
[19:03:37] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[19:03:37] [PASSED] drm_test_connector_hdmi_init_bpc_null
[19:03:37] [PASSED] drm_test_connector_hdmi_init_formats_empty
[19:03:37] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[19:03:37] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[19:03:37] [PASSED] supported_formats=0x9 yuv420_allowed=1
[19:03:37] [PASSED] supported_formats=0x9 yuv420_allowed=0
[19:03:37] [PASSED] supported_formats=0x5 yuv420_allowed=1
[19:03:37] [PASSED] supported_formats=0x5 yuv420_allowed=0
[19:03:37] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[19:03:37] [PASSED] drm_test_connector_hdmi_init_null_ddc
[19:03:37] [PASSED] drm_test_connector_hdmi_init_null_product
[19:03:37] [PASSED] drm_test_connector_hdmi_init_null_vendor
[19:03:37] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[19:03:37] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[19:03:37] [PASSED] drm_test_connector_hdmi_init_product_valid
[19:03:37] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[19:03:37] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[19:03:37] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[19:03:37] ========= drm_test_connector_hdmi_init_type_valid  =========
[19:03:37] [PASSED] HDMI-A
[19:03:37] [PASSED] HDMI-B
[19:03:37] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[19:03:37] ======== drm_test_connector_hdmi_init_type_invalid  ========
[19:03:37] [PASSED] Unknown
[19:03:37] [PASSED] VGA
[19:03:37] [PASSED] DVI-I
[19:03:37] [PASSED] DVI-D
[19:03:37] [PASSED] DVI-A
[19:03:37] [PASSED] Composite
[19:03:37] [PASSED] SVIDEO
[19:03:37] [PASSED] LVDS
[19:03:37] [PASSED] Component
[19:03:37] [PASSED] DIN
[19:03:37] [PASSED] DP
[19:03:37] [PASSED] TV
[19:03:37] [PASSED] eDP
[19:03:37] [PASSED] Virtual
[19:03:37] [PASSED] DSI
[19:03:37] [PASSED] DPI
[19:03:37] [PASSED] Writeback
[19:03:37] [PASSED] SPI
[19:03:37] [PASSED] USB
[19:03:37] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[19:03:37] ============ [PASSED] drmm_connector_hdmi_init =============
[19:03:37] ============= drmm_connector_init (3 subtests) =============
[19:03:37] [PASSED] drm_test_drmm_connector_init
[19:03:37] [PASSED] drm_test_drmm_connector_init_null_ddc
[19:03:37] ========= drm_test_drmm_connector_init_type_valid  =========
[19:03:37] [PASSED] Unknown
[19:03:37] [PASSED] VGA
[19:03:37] [PASSED] DVI-I
[19:03:37] [PASSED] DVI-D
[19:03:37] [PASSED] DVI-A
[19:03:37] [PASSED] Composite
[19:03:37] [PASSED] SVIDEO
[19:03:37] [PASSED] LVDS
[19:03:37] [PASSED] Component
[19:03:37] [PASSED] DIN
[19:03:37] [PASSED] DP
[19:03:37] [PASSED] HDMI-A
[19:03:37] [PASSED] HDMI-B
[19:03:37] [PASSED] TV
[19:03:37] [PASSED] eDP
[19:03:37] [PASSED] Virtual
[19:03:37] [PASSED] DSI
[19:03:37] [PASSED] DPI
[19:03:37] [PASSED] Writeback
[19:03:37] [PASSED] SPI
[19:03:37] [PASSED] USB
[19:03:37] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[19:03:37] =============== [PASSED] drmm_connector_init ===============
[19:03:37] ========= drm_connector_dynamic_init (6 subtests) ==========
[19:03:37] [PASSED] drm_test_drm_connector_dynamic_init
[19:03:37] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[19:03:37] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[19:03:37] [PASSED] drm_test_drm_connector_dynamic_init_properties
[19:03:37] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[19:03:37] [PASSED] Unknown
[19:03:37] [PASSED] VGA
[19:03:37] [PASSED] DVI-I
[19:03:37] [PASSED] DVI-D
[19:03:37] [PASSED] DVI-A
[19:03:37] [PASSED] Composite
[19:03:37] [PASSED] SVIDEO
[19:03:37] [PASSED] LVDS
[19:03:37] [PASSED] Component
[19:03:37] [PASSED] DIN
[19:03:37] [PASSED] DP
[19:03:37] [PASSED] HDMI-A
[19:03:37] [PASSED] HDMI-B
[19:03:37] [PASSED] TV
[19:03:37] [PASSED] eDP
[19:03:37] [PASSED] Virtual
[19:03:37] [PASSED] DSI
[19:03:37] [PASSED] DPI
[19:03:37] [PASSED] Writeback
[19:03:37] [PASSED] SPI
[19:03:37] [PASSED] USB
[19:03:37] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[19:03:37] ======== drm_test_drm_connector_dynamic_init_name  =========
[19:03:37] [PASSED] Unknown
[19:03:37] [PASSED] VGA
[19:03:37] [PASSED] DVI-I
[19:03:37] [PASSED] DVI-D
[19:03:37] [PASSED] DVI-A
[19:03:37] [PASSED] Composite
[19:03:37] [PASSED] SVIDEO
[19:03:37] [PASSED] LVDS
[19:03:37] [PASSED] Component
[19:03:37] [PASSED] DIN
[19:03:37] [PASSED] DP
[19:03:37] [PASSED] HDMI-A
[19:03:37] [PASSED] HDMI-B
[19:03:37] [PASSED] TV
[19:03:37] [PASSED] eDP
[19:03:37] [PASSED] Virtual
[19:03:37] [PASSED] DSI
[19:03:37] [PASSED] DPI
[19:03:37] [PASSED] Writeback
[19:03:37] [PASSED] SPI
[19:03:37] [PASSED] USB
[19:03:37] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[19:03:37] =========== [PASSED] drm_connector_dynamic_init ============
[19:03:37] ==== drm_connector_dynamic_register_early (4 subtests) =====
[19:03:37] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[19:03:37] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[19:03:37] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[19:03:37] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[19:03:37] ====== [PASSED] drm_connector_dynamic_register_early =======
[19:03:37] ======= drm_connector_dynamic_register (7 subtests) ========
[19:03:37] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[19:03:37] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[19:03:37] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[19:03:37] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[19:03:37] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[19:03:37] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[19:03:37] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[19:03:37] ========= [PASSED] drm_connector_dynamic_register ==========
[19:03:37] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[19:03:37] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[19:03:37] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[19:03:37] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[19:03:37] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[19:03:37] ========== drm_test_get_tv_mode_from_name_valid  ===========
[19:03:37] [PASSED] NTSC
[19:03:37] [PASSED] NTSC-443
[19:03:37] [PASSED] NTSC-J
[19:03:37] [PASSED] PAL
[19:03:37] [PASSED] PAL-M
[19:03:37] [PASSED] PAL-N
[19:03:37] [PASSED] SECAM
[19:03:37] [PASSED] Mono
[19:03:37] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[19:03:37] [PASSED] drm_test_get_tv_mode_from_name_truncated
[19:03:37] ============ [PASSED] drm_get_tv_mode_from_name ============
[19:03:37] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[19:03:37] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[19:03:37] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[19:03:37] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[19:03:37] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[19:03:37] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[19:03:37] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[19:03:37] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[19:03:37] [PASSED] VIC 96
[19:03:37] [PASSED] VIC 97
[19:03:37] [PASSED] VIC 101
[19:03:37] [PASSED] VIC 102
[19:03:37] [PASSED] VIC 106
[19:03:37] [PASSED] VIC 107
[19:03:37] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[19:03:37] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[19:03:37] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[19:03:37] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[19:03:37] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[19:03:37] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[19:03:37] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[19:03:37] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[19:03:37] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[19:03:37] [PASSED] Automatic
[19:03:37] [PASSED] Full
[19:03:37] [PASSED] Limited 16:235
[19:03:37] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[19:03:37] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[19:03:37] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[19:03:37] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[19:03:37] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[19:03:37] [PASSED] RGB
[19:03:37] [PASSED] YUV 4:2:0
[19:03:37] [PASSED] YUV 4:2:2
[19:03:37] [PASSED] YUV 4:4:4
[19:03:37] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[19:03:37] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[19:03:37] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[19:03:37] ============= drm_damage_helper (21 subtests) ==============
[19:03:37] [PASSED] drm_test_damage_iter_no_damage
[19:03:37] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[19:03:37] [PASSED] drm_test_damage_iter_no_damage_src_moved
[19:03:37] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[19:03:37] [PASSED] drm_test_damage_iter_no_damage_not_visible
[19:03:37] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[19:03:37] [PASSED] drm_test_damage_iter_no_damage_no_fb
[19:03:37] [PASSED] drm_test_damage_iter_simple_damage
[19:03:37] [PASSED] drm_test_damage_iter_single_damage
[19:03:37] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[19:03:37] [PASSED] drm_test_damage_iter_single_damage_outside_src
[19:03:37] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[19:03:37] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[19:03:37] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[19:03:37] [PASSED] drm_test_damage_iter_single_damage_src_moved
[19:03:37] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[19:03:37] [PASSED] drm_test_damage_iter_damage
[19:03:37] [PASSED] drm_test_damage_iter_damage_one_intersect
[19:03:37] [PASSED] drm_test_damage_iter_damage_one_outside
[19:03:37] [PASSED] drm_test_damage_iter_damage_src_moved
[19:03:37] [PASSED] drm_test_damage_iter_damage_not_visible
[19:03:37] ================ [PASSED] drm_damage_helper ================
[19:03:37] ============== drm_dp_mst_helper (3 subtests) ==============
[19:03:37] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[19:03:37] [PASSED] Clock 154000 BPP 30 DSC disabled
[19:03:37] [PASSED] Clock 234000 BPP 30 DSC disabled
[19:03:37] [PASSED] Clock 297000 BPP 24 DSC disabled
[19:03:37] [PASSED] Clock 332880 BPP 24 DSC enabled
[19:03:37] [PASSED] Clock 324540 BPP 24 DSC enabled
[19:03:37] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[19:03:37] ============== drm_test_dp_mst_calc_pbn_div  ===============
[19:03:37] [PASSED] Link rate 2000000 lane count 4
[19:03:37] [PASSED] Link rate 2000000 lane count 2
[19:03:37] [PASSED] Link rate 2000000 lane count 1
[19:03:37] [PASSED] Link rate 1350000 lane count 4
[19:03:37] [PASSED] Link rate 1350000 lane count 2
[19:03:37] [PASSED] Link rate 1350000 lane count 1
[19:03:37] [PASSED] Link rate 1000000 lane count 4
[19:03:37] [PASSED] Link rate 1000000 lane count 2
[19:03:37] [PASSED] Link rate 1000000 lane count 1
[19:03:37] [PASSED] Link rate 810000 lane count 4
[19:03:37] [PASSED] Link rate 810000 lane count 2
[19:03:37] [PASSED] Link rate 810000 lane count 1
[19:03:37] [PASSED] Link rate 540000 lane count 4
[19:03:37] [PASSED] Link rate 540000 lane count 2
[19:03:37] [PASSED] Link rate 540000 lane count 1
[19:03:37] [PASSED] Link rate 270000 lane count 4
[19:03:37] [PASSED] Link rate 270000 lane count 2
[19:03:37] [PASSED] Link rate 270000 lane count 1
[19:03:37] [PASSED] Link rate 162000 lane count 4
[19:03:37] [PASSED] Link rate 162000 lane count 2
[19:03:37] [PASSED] Link rate 162000 lane count 1
[19:03:37] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[19:03:37] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[19:03:37] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[19:03:37] [PASSED] DP_POWER_UP_PHY with port number
[19:03:37] [PASSED] DP_POWER_DOWN_PHY with port number
[19:03:37] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[19:03:37] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[19:03:37] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[19:03:37] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[19:03:37] [PASSED] DP_QUERY_PAYLOAD with port number
[19:03:37] [PASSED] DP_QUERY_PAYLOAD with VCPI
[19:03:37] [PASSED] DP_REMOTE_DPCD_READ with port number
[19:03:37] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[19:03:37] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[19:03:37] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[19:03:37] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[19:03:37] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[19:03:37] [PASSED] DP_REMOTE_I2C_READ with port number
[19:03:37] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[19:03:37] [PASSED] DP_REMOTE_I2C_READ with transactions array
[19:03:37] [PASSED] DP_REMOTE_I2C_WRITE with port number
[19:03:37] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[19:03:37] [PASSED] DP_REMOTE_I2C_WRITE with data array
[19:03:37] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[19:03:37] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[19:03:37] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[19:03:37] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[19:03:37] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[19:03:37] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[19:03:37] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[19:03:37] ================ [PASSED] drm_dp_mst_helper ================
[19:03:37] ================== drm_exec (7 subtests) ===================
[19:03:37] [PASSED] sanitycheck
[19:03:37] [PASSED] test_lock
[19:03:37] [PASSED] test_lock_unlock
[19:03:37] [PASSED] test_duplicates
[19:03:37] [PASSED] test_prepare
[19:03:37] [PASSED] test_prepare_array
[19:03:37] [PASSED] test_multiple_loops
[19:03:37] ==================== [PASSED] drm_exec =====================
[19:03:37] =========== drm_format_helper_test (17 subtests) ===========
[19:03:37] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[19:03:37] [PASSED] single_pixel_source_buffer
[19:03:37] [PASSED] single_pixel_clip_rectangle
[19:03:37] [PASSED] well_known_colors
[19:03:37] [PASSED] destination_pitch
[19:03:37] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[19:03:37] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[19:03:37] [PASSED] single_pixel_source_buffer
[19:03:37] [PASSED] single_pixel_clip_rectangle
[19:03:37] [PASSED] well_known_colors
[19:03:37] [PASSED] destination_pitch
[19:03:37] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[19:03:37] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[19:03:37] [PASSED] single_pixel_source_buffer
[19:03:37] [PASSED] single_pixel_clip_rectangle
[19:03:37] [PASSED] well_known_colors
[19:03:37] [PASSED] destination_pitch
[19:03:37] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[19:03:37] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[19:03:37] [PASSED] single_pixel_source_buffer
[19:03:37] [PASSED] single_pixel_clip_rectangle
[19:03:37] [PASSED] well_known_colors
[19:03:37] [PASSED] destination_pitch
[19:03:37] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[19:03:37] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[19:03:37] [PASSED] single_pixel_source_buffer
[19:03:37] [PASSED] single_pixel_clip_rectangle
[19:03:37] [PASSED] well_known_colors
[19:03:37] [PASSED] destination_pitch
[19:03:37] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[19:03:37] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[19:03:37] [PASSED] single_pixel_source_buffer
[19:03:37] [PASSED] single_pixel_clip_rectangle
[19:03:37] [PASSED] well_known_colors
[19:03:37] [PASSED] destination_pitch
[19:03:37] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[19:03:37] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[19:03:37] [PASSED] single_pixel_source_buffer
[19:03:37] [PASSED] single_pixel_clip_rectangle
[19:03:37] [PASSED] well_known_colors
[19:03:37] [PASSED] destination_pitch
[19:03:37] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[19:03:37] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[19:03:37] [PASSED] single_pixel_source_buffer
[19:03:37] [PASSED] single_pixel_clip_rectangle
[19:03:37] [PASSED] well_known_colors
[19:03:37] [PASSED] destination_pitch
[19:03:37] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[19:03:37] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[19:03:37] [PASSED] single_pixel_source_buffer
[19:03:37] [PASSED] single_pixel_clip_rectangle
[19:03:37] [PASSED] well_known_colors
[19:03:37] [PASSED] destination_pitch
[19:03:37] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[19:03:37] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[19:03:37] [PASSED] single_pixel_source_buffer
[19:03:37] [PASSED] single_pixel_clip_rectangle
[19:03:37] [PASSED] well_known_colors
[19:03:37] [PASSED] destination_pitch
[19:03:37] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[19:03:37] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[19:03:37] [PASSED] single_pixel_source_buffer
[19:03:37] [PASSED] single_pixel_clip_rectangle
[19:03:37] [PASSED] well_known_colors
[19:03:37] [PASSED] destination_pitch
[19:03:37] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[19:03:37] ============== drm_test_fb_xrgb8888_to_mono  ===============
[19:03:37] [PASSED] single_pixel_source_buffer
[19:03:37] [PASSED] single_pixel_clip_rectangle
[19:03:37] [PASSED] well_known_colors
[19:03:37] [PASSED] destination_pitch
[19:03:37] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[19:03:37] ==================== drm_test_fb_swab  =====================
[19:03:37] [PASSED] single_pixel_source_buffer
[19:03:37] [PASSED] single_pixel_clip_rectangle
[19:03:37] [PASSED] well_known_colors
[19:03:37] [PASSED] destination_pitch
[19:03:37] ================ [PASSED] drm_test_fb_swab =================
[19:03:37] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[19:03:37] [PASSED] single_pixel_source_buffer
[19:03:37] [PASSED] single_pixel_clip_rectangle
[19:03:37] [PASSED] well_known_colors
[19:03:37] [PASSED] destination_pitch
[19:03:37] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[19:03:37] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[19:03:37] [PASSED] single_pixel_source_buffer
[19:03:37] [PASSED] single_pixel_clip_rectangle
[19:03:37] [PASSED] well_known_colors
[19:03:37] [PASSED] destination_pitch
[19:03:37] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[19:03:37] ================= drm_test_fb_clip_offset  =================
[19:03:37] [PASSED] pass through
[19:03:37] [PASSED] horizontal offset
[19:03:37] [PASSED] vertical offset
[19:03:37] [PASSED] horizontal and vertical offset
[19:03:37] [PASSED] horizontal offset (custom pitch)
[19:03:37] [PASSED] vertical offset (custom pitch)
[19:03:37] [PASSED] horizontal and vertical offset (custom pitch)
[19:03:37] ============= [PASSED] drm_test_fb_clip_offset =============
[19:03:37] =================== drm_test_fb_memcpy  ====================
[19:03:37] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[19:03:37] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[19:03:37] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[19:03:37] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[19:03:37] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[19:03:37] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[19:03:37] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[19:03:37] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[19:03:37] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[19:03:37] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[19:03:37] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[19:03:37] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[19:03:37] =============== [PASSED] drm_test_fb_memcpy ================
[19:03:37] ============= [PASSED] drm_format_helper_test ==============
[19:03:37] ================= drm_format (18 subtests) =================
[19:03:37] [PASSED] drm_test_format_block_width_invalid
[19:03:37] [PASSED] drm_test_format_block_width_one_plane
[19:03:37] [PASSED] drm_test_format_block_width_two_plane
[19:03:37] [PASSED] drm_test_format_block_width_three_plane
[19:03:37] [PASSED] drm_test_format_block_width_tiled
[19:03:37] [PASSED] drm_test_format_block_height_invalid
[19:03:37] [PASSED] drm_test_format_block_height_one_plane
[19:03:37] [PASSED] drm_test_format_block_height_two_plane
[19:03:37] [PASSED] drm_test_format_block_height_three_plane
[19:03:37] [PASSED] drm_test_format_block_height_tiled
[19:03:37] [PASSED] drm_test_format_min_pitch_invalid
[19:03:37] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[19:03:37] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[19:03:37] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[19:03:37] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[19:03:37] [PASSED] drm_test_format_min_pitch_two_plane
[19:03:37] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[19:03:37] [PASSED] drm_test_format_min_pitch_tiled
[19:03:37] =================== [PASSED] drm_format ====================
[19:03:37] ============== drm_framebuffer (10 subtests) ===============
[19:03:37] ========== drm_test_framebuffer_check_src_coords  ==========
[19:03:37] [PASSED] Success: source fits into fb
[19:03:37] [PASSED] Fail: overflowing fb with x-axis coordinate
[19:03:37] [PASSED] Fail: overflowing fb with y-axis coordinate
[19:03:37] [PASSED] Fail: overflowing fb with source width
[19:03:37] [PASSED] Fail: overflowing fb with source height
[19:03:37] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[19:03:37] [PASSED] drm_test_framebuffer_cleanup
[19:03:37] =============== drm_test_framebuffer_create  ===============
[19:03:37] [PASSED] ABGR8888 normal sizes
[19:03:37] [PASSED] ABGR8888 max sizes
[19:03:37] [PASSED] ABGR8888 pitch greater than min required
[19:03:37] [PASSED] ABGR8888 pitch less than min required
[19:03:37] [PASSED] ABGR8888 Invalid width
[19:03:37] [PASSED] ABGR8888 Invalid buffer handle
[19:03:37] [PASSED] No pixel format
[19:03:37] [PASSED] ABGR8888 Width 0
[19:03:37] [PASSED] ABGR8888 Height 0
[19:03:37] [PASSED] ABGR8888 Out of bound height * pitch combination
[19:03:37] [PASSED] ABGR8888 Large buffer offset
[19:03:37] [PASSED] ABGR8888 Buffer offset for inexistent plane
[19:03:37] [PASSED] ABGR8888 Invalid flag
[19:03:37] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[19:03:37] [PASSED] ABGR8888 Valid buffer modifier
[19:03:37] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[19:03:37] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[19:03:37] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[19:03:37] [PASSED] NV12 Normal sizes
[19:03:37] [PASSED] NV12 Max sizes
[19:03:37] [PASSED] NV12 Invalid pitch
[19:03:37] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[19:03:37] [PASSED] NV12 different  modifier per-plane
[19:03:37] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[19:03:37] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[19:03:37] [PASSED] NV12 Modifier for inexistent plane
[19:03:37] [PASSED] NV12 Handle for inexistent plane
[19:03:37] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[19:03:37] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[19:03:37] [PASSED] YVU420 Normal sizes
[19:03:37] [PASSED] YVU420 Max sizes
[19:03:37] [PASSED] YVU420 Invalid pitch
[19:03:37] [PASSED] YVU420 Different pitches
[19:03:37] [PASSED] YVU420 Different buffer offsets/pitches
[19:03:37] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[19:03:37] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[19:03:37] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[19:03:37] [PASSED] YVU420 Valid modifier
[19:03:37] [PASSED] YVU420 Different modifiers per plane
[19:03:37] [PASSED] YVU420 Modifier for inexistent plane
[19:03:37] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[19:03:37] [PASSED] X0L2 Normal sizes
[19:03:37] [PASSED] X0L2 Max sizes
[19:03:37] [PASSED] X0L2 Invalid pitch
[19:03:37] [PASSED] X0L2 Pitch greater than minimum required
[19:03:37] [PASSED] X0L2 Handle for inexistent plane
[19:03:37] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[19:03:37] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[19:03:37] [PASSED] X0L2 Valid modifier
[19:03:37] [PASSED] X0L2 Modifier for inexistent plane
[19:03:37] =========== [PASSED] drm_test_framebuffer_create ===========
[19:03:37] [PASSED] drm_test_framebuffer_free
[19:03:37] [PASSED] drm_test_framebuffer_init
[19:03:37] [PASSED] drm_test_framebuffer_init_bad_format
[19:03:37] [PASSED] drm_test_framebuffer_init_dev_mismatch
[19:03:37] [PASSED] drm_test_framebuffer_lookup
[19:03:37] [PASSED] drm_test_framebuffer_lookup_inexistent
[19:03:37] [PASSED] drm_test_framebuffer_modifiers_not_supported
[19:03:37] ================= [PASSED] drm_framebuffer =================
[19:03:37] ================ drm_gem_shmem (8 subtests) ================
[19:03:37] [PASSED] drm_gem_shmem_test_obj_create
[19:03:37] [PASSED] drm_gem_shmem_test_obj_create_private
[19:03:37] [PASSED] drm_gem_shmem_test_pin_pages
[19:03:37] [PASSED] drm_gem_shmem_test_vmap
[19:03:37] [PASSED] drm_gem_shmem_test_get_sg_table
[19:03:37] [PASSED] drm_gem_shmem_test_get_pages_sgt
[19:03:37] [PASSED] drm_gem_shmem_test_madvise
[19:03:37] [PASSED] drm_gem_shmem_test_purge
[19:03:37] ================== [PASSED] drm_gem_shmem ==================
[19:03:37] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[19:03:37] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[19:03:37] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[19:03:37] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[19:03:37] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[19:03:37] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[19:03:37] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[19:03:37] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[19:03:37] [PASSED] Automatic
[19:03:37] [PASSED] Full
[19:03:37] [PASSED] Limited 16:235
[19:03:37] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[19:03:37] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[19:03:37] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[19:03:37] [PASSED] drm_test_check_disable_connector
[19:03:37] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[19:03:37] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[19:03:37] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[19:03:37] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[19:03:37] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[19:03:37] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[19:03:37] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[19:03:37] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[19:03:37] [PASSED] drm_test_check_output_bpc_dvi
[19:03:37] [PASSED] drm_test_check_output_bpc_format_vic_1
[19:03:37] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[19:03:37] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[19:03:37] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[19:03:37] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[19:03:37] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[19:03:37] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[19:03:37] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[19:03:37] ============ drm_test_check_hdmi_color_format  =============
[19:03:37] [PASSED] AUTO -> RGB
[19:03:37] [PASSED] YCBCR422 -> YUV422
[19:03:37] [PASSED] YCBCR420 -> YUV420
[19:03:37] [PASSED] YCBCR444 -> YUV444
[19:03:37] [PASSED] RGB -> RGB
[19:03:37] ======== [PASSED] drm_test_check_hdmi_color_format =========
[19:03:37] ======== drm_test_check_hdmi_color_format_420_only  ========
[19:03:37] [PASSED] RGB should fail
[19:03:37] [PASSED] YUV444 should fail
[19:03:37] [PASSED] YUV422 should fail
[19:03:37] [PASSED] YUV420 should work
[19:03:37] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[19:03:37] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[19:03:37] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[19:03:37] [PASSED] drm_test_check_broadcast_rgb_value
[19:03:37] [PASSED] drm_test_check_bpc_8_value
[19:03:37] [PASSED] drm_test_check_bpc_10_value
[19:03:37] [PASSED] drm_test_check_bpc_12_value
[19:03:37] [PASSED] drm_test_check_format_value
[19:03:37] [PASSED] drm_test_check_tmds_char_value
[19:03:37] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[19:03:37] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[19:03:37] [PASSED] drm_test_check_mode_valid
[19:03:37] [PASSED] drm_test_check_mode_valid_reject
[19:03:37] [PASSED] drm_test_check_mode_valid_reject_rate
[19:03:37] [PASSED] drm_test_check_mode_valid_reject_max_clock
[19:03:37] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[19:03:37] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[19:03:37] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[19:03:37] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[19:03:37] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[19:03:37] [PASSED] drm_test_check_infoframes
[19:03:37] [PASSED] drm_test_check_reject_avi_infoframe
[19:03:37] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[19:03:37] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[19:03:37] [PASSED] drm_test_check_reject_audio_infoframe
[19:03:37] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[19:03:37] ================= drm_managed (2 subtests) =================
[19:03:37] [PASSED] drm_test_managed_release_action
[19:03:37] [PASSED] drm_test_managed_run_action
[19:03:37] =================== [PASSED] drm_managed ===================
[19:03:37] =================== drm_mm (6 subtests) ====================
[19:03:37] [PASSED] drm_test_mm_init
[19:03:37] [PASSED] drm_test_mm_debug
[19:03:37] [PASSED] drm_test_mm_align32
[19:03:37] [PASSED] drm_test_mm_align64
[19:03:37] [PASSED] drm_test_mm_lowest
[19:03:37] [PASSED] drm_test_mm_highest
[19:03:37] ===================== [PASSED] drm_mm ======================
[19:03:37] ============= drm_modes_analog_tv (5 subtests) =============
[19:03:37] [PASSED] drm_test_modes_analog_tv_mono_576i
[19:03:37] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[19:03:37] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[19:03:37] [PASSED] drm_test_modes_analog_tv_pal_576i
[19:03:37] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[19:03:37] =============== [PASSED] drm_modes_analog_tv ===============
[19:03:37] ============== drm_panic_helper (3 subtests) ===============
[19:03:37] ============= drm_test_panic_screen_user_map  ==============
[19:03:37] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[19:03:37] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[19:03:37] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[19:03:37] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[19:03:37] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[19:03:37] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[19:03:37] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[19:03:37] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[19:03:37] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[19:03:37] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[19:03:37] ========= [PASSED] drm_test_panic_screen_user_map ==========
[19:03:37] ============= drm_test_panic_screen_user_page  =============
[19:03:37] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[19:03:37] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[19:03:37] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[19:03:37] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[19:03:37] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[19:03:37] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[19:03:37] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[19:03:37] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[19:03:37] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[19:03:37] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[19:03:37] ========= [PASSED] drm_test_panic_screen_user_page =========
[19:03:37] ========== drm_test_panic_screen_user_set_pixel  ===========
[19:03:37] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[19:03:37] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[19:03:37] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[19:03:37] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[19:03:37] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[19:03:37] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[19:03:37] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[19:03:37] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[19:03:37] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[19:03:37] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[19:03:37] ====== [PASSED] drm_test_panic_screen_user_set_pixel =======
[19:03:37] ================ [PASSED] drm_panic_helper =================
[19:03:37] ============== drm_plane_helper (2 subtests) ===============
[19:03:37] =============== drm_test_check_plane_state  ================
[19:03:37] [PASSED] clipping_simple
[19:03:37] [PASSED] clipping_rotate_reflect
[19:03:37] [PASSED] positioning_simple
[19:03:37] [PASSED] upscaling
[19:03:37] [PASSED] downscaling
[19:03:37] [PASSED] rounding1
[19:03:37] [PASSED] rounding2
[19:03:37] [PASSED] rounding3
[19:03:37] [PASSED] rounding4
[19:03:37] =========== [PASSED] drm_test_check_plane_state ============
[19:03:37] =========== drm_test_check_invalid_plane_state  ============
[19:03:37] [PASSED] positioning_invalid
[19:03:37] [PASSED] upscaling_invalid
[19:03:37] [PASSED] downscaling_invalid
[19:03:37] ======= [PASSED] drm_test_check_invalid_plane_state ========
[19:03:37] ================ [PASSED] drm_plane_helper =================
[19:03:37] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[19:03:37] ====== drm_test_connector_helper_tv_get_modes_check  =======
[19:03:37] [PASSED] None
[19:03:37] [PASSED] PAL
[19:03:37] [PASSED] NTSC
[19:03:37] [PASSED] Both, NTSC Default
[19:03:37] [PASSED] Both, PAL Default
[19:03:37] [PASSED] Both, NTSC Default, with PAL on command-line
[19:03:37] [PASSED] Both, PAL Default, with NTSC on command-line
[19:03:37] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[19:03:37] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[19:03:37] ================== drm_rect (9 subtests) ===================
[19:03:37] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[19:03:37] [PASSED] drm_test_rect_clip_scaled_not_clipped
[19:03:37] [PASSED] drm_test_rect_clip_scaled_clipped
[19:03:37] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[19:03:37] ================= drm_test_rect_intersect  =================
[19:03:37] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[19:03:37] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[19:03:37] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[19:03:37] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[19:03:37] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[19:03:37] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[19:03:37] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[19:03:37] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[19:03:37] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[19:03:37] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[19:03:37] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[19:03:37] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[19:03:37] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[19:03:37] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[19:03:37] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[19:03:37] ============= [PASSED] drm_test_rect_intersect =============
[19:03:37] ================ drm_test_rect_calc_hscale  ================
[19:03:37] [PASSED] normal use
[19:03:37] [PASSED] out of max range
[19:03:37] [PASSED] out of min range
[19:03:37] [PASSED] zero dst
[19:03:37] [PASSED] negative src
[19:03:37] [PASSED] negative dst
[19:03:37] ============ [PASSED] drm_test_rect_calc_hscale ============
[19:03:37] ================ drm_test_rect_calc_vscale  ================
[19:03:37] [PASSED] normal use
[19:03:37] [PASSED] out of max range
[19:03:37] [PASSED] out of min range
[19:03:37] [PASSED] zero dst
[19:03:37] [PASSED] negative src
[19:03:37] [PASSED] negative dst
[19:03:37] ============ [PASSED] drm_test_rect_calc_vscale ============
[19:03:37] ================== drm_test_rect_rotate  ===================
[19:03:37] [PASSED] reflect-x
[19:03:37] [PASSED] reflect-y
[19:03:37] [PASSED] rotate-0
[19:03:37] [PASSED] rotate-90
[19:03:37] [PASSED] rotate-180
[19:03:37] [PASSED] rotate-270
[19:03:37] ============== [PASSED] drm_test_rect_rotate ===============
[19:03:37] ================ drm_test_rect_rotate_inv  =================
[19:03:37] [PASSED] reflect-x
[19:03:37] [PASSED] reflect-y
[19:03:37] [PASSED] rotate-0
[19:03:37] [PASSED] rotate-90
[19:03:37] [PASSED] rotate-180
[19:03:37] [PASSED] rotate-270
[19:03:37] ============ [PASSED] drm_test_rect_rotate_inv =============
[19:03:37] ==================== [PASSED] drm_rect =====================
[19:03:37] ============ drm_sysfb_modeset_test (1 subtest) ============
[19:03:37] ============ drm_test_sysfb_build_fourcc_list  =============
[19:03:37] [PASSED] no native formats
[19:03:37] [PASSED] XRGB8888 as native format
[19:03:37] [PASSED] remove duplicates
[19:03:37] [PASSED] convert alpha formats
[19:03:37] [PASSED] random formats
[19:03:37] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[19:03:37] ============= [PASSED] drm_sysfb_modeset_test ==============
[19:03:37] ================== drm_fixp (2 subtests) ===================
[19:03:37] [PASSED] drm_test_int2fixp
[19:03:37] [PASSED] drm_test_sm2fixp
[19:03:37] ==================== [PASSED] drm_fixp =====================
[19:03:37] ============================================================
[19:03:37] Testing complete. Ran 667 tests: passed: 667
[19:03:37] Elapsed time: 28.168s total, 2.530s configuring, 25.323s building, 0.294s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[19:03:37] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:03:40] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[19:03:50] Starting KUnit Kernel (1/1)...
[19:03:50] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[19:03:50] ================= ttm_device (5 subtests) ==================
[19:03:50] [PASSED] ttm_device_init_basic
[19:03:50] [PASSED] ttm_device_init_multiple
[19:03:50] [PASSED] ttm_device_fini_basic
[19:03:50] [PASSED] ttm_device_init_no_vma_man
[19:03:50] ================== ttm_device_init_pools  ==================
[19:03:50] [PASSED] No DMA allocations, no DMA32 required
[19:03:50] [PASSED] DMA allocations, DMA32 required
[19:03:50] [PASSED] No DMA allocations, DMA32 required
[19:03:50] [PASSED] DMA allocations, no DMA32 required
[19:03:50] ============== [PASSED] ttm_device_init_pools ==============
[19:03:50] =================== [PASSED] ttm_device ====================
[19:03:50] ================== ttm_pool (8 subtests) ===================
[19:03:50] ================== ttm_pool_alloc_basic  ===================
[19:03:50] [PASSED] One page
[19:03:50] [PASSED] More than one page
[19:03:50] [PASSED] Above the allocation limit
[19:03:50] [PASSED] One page, with coherent DMA mappings enabled
[19:03:50] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[19:03:50] ============== [PASSED] ttm_pool_alloc_basic ===============
[19:03:50] ============== ttm_pool_alloc_basic_dma_addr  ==============
[19:03:50] [PASSED] One page
[19:03:50] [PASSED] More than one page
[19:03:50] [PASSED] Above the allocation limit
[19:03:50] [PASSED] One page, with coherent DMA mappings enabled
[19:03:50] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[19:03:50] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[19:03:50] [PASSED] ttm_pool_alloc_order_caching_match
[19:03:50] [PASSED] ttm_pool_alloc_caching_mismatch
[19:03:50] [PASSED] ttm_pool_alloc_order_mismatch
[19:03:50] [PASSED] ttm_pool_free_dma_alloc
[19:03:50] [PASSED] ttm_pool_free_no_dma_alloc
[19:03:50] [ERROR] Test: ttm_pool: missing expected subtest!
[19:03:50] 
[19:03:50] Pid: 80, comm: kunit_try_catch Tainted: G        W        N  7.4.0-rc4-gcac9841a24d6
[19:03:50] RIP: 0033:list_lru_count_node+0xe/0x20
[19:03:50] RSP: 00000000aa0dbef8  EFLAGS: 00010246
[19:03:50] RAX: 0000000000000001 RBX: 00000000aa003c90 RCX: 0000000000000021
[19:03:50] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 000000006a853030
[19:03:50] RBP: 000000006a853000 R08: 00000000aa0dbe98 R09: 0000000000000000
[19:03:50] R10: 00000000a91dba60 R11: 0000000000000000 R12: 0000000060121160
[19:03:50] R13: 000000006a853030 R14: 000000006046f0e0 R15: 00000000604ba488
[19:03:50] Kernel panic - not syncing: Segfault with no mm
[19:03:50] [CRASHED] 
[19:03:50] [ERROR] Test: ttm_pool: missing subtest result line!
[19:03:50] # module: ttm_pool_test
[19:03:50] ==================== [CRASHED] ttm_pool ====================
[19:03:50] [ERROR] Test: main: missing expected subtest!
[19:03:50] [CRASHED] 
[19:03:50] [ERROR] Test: main: missing expected subtest!
[19:03:50] [CRASHED] 
[19:03:50] [ERROR] Test: main: missing expected subtest!
[19:03:50] [CRASHED] 
[19:03:50] [ERROR] Test: main: missing expected subtest!
[19:03:50] [CRASHED] 
[19:03:50] ============================================================
[19:03:50] Testing complete. Ran 28 tests: passed: 23, crashed: 5, errors: 6
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
[19:03:50] Elapsed time: 12.854s total, 2.406s configuring, 10.232s building, 0.215s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


