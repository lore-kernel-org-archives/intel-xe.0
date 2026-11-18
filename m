Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E312606A32A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 01:34:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBA010E0AD;
	Wed, 18 Nov 2026 01:34:25 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1E810E0AD;
 Wed, 18 Nov 2026 01:34:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_series_starting_with_=5Bv3=2C1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Disallow_freq_changes_while_mert_cap_is_active?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Nov 2026 01:34:24 -0000
Message-ID: <179496566443.40567.10809091422469179816@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118012453.626087-3-vinay.belgaumkar@intel.com>
In-Reply-To: <20261118012453.626087-3-vinay.belgaumkar@intel.com>
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

Series: series starting with [v3,1/2] drm/xe: Disallow freq changes while mert cap is active
URL   : https://patchwork.freedesktop.org/series/178836/
State : success

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[01:32:11] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:32:16] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[01:32:36] Starting KUnit Kernel (1/1)...
[01:32:36] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:32:37] ================= gpu_buddy (15 subtests) ==================
[01:32:37] [PASSED] gpu_test_buddy_alloc_limit
[01:32:37] [PASSED] gpu_test_buddy_alloc_optimistic
[01:32:37] [PASSED] gpu_test_buddy_alloc_pessimistic
[01:32:37] [PASSED] gpu_test_buddy_alloc_pathological
[01:32:37] [PASSED] gpu_test_buddy_alloc_contiguous
[01:32:37] [PASSED] gpu_test_buddy_alloc_clear
[01:32:37] [PASSED] gpu_test_buddy_alloc_range
[01:32:37] [PASSED] gpu_test_buddy_alloc_range_bias
[01:32:37] [PASSED] gpu_test_buddy_alloc_range_clear_guard
[01:32:38] [PASSED] gpu_test_buddy_fragmentation_performance
[01:32:38] [PASSED] gpu_test_buddy_dirty_tracker_performance
[01:32:38] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[01:32:38] [PASSED] gpu_test_buddy_offset_aligned_allocation
[01:32:38] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[01:32:38] [PASSED] gpu_test_buddy_addr_to_block
[01:32:38] ==================== [PASSED] gpu_buddy ====================
[01:32:38] ============================================================
[01:32:38] Testing complete. Ran 15 tests: passed: 15
[01:32:38] Elapsed time: 27.803s total, 5.085s configuring, 20.800s building, 1.883s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[01:32:38] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:32:41] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[01:33:20] Starting KUnit Kernel (1/1)...
[01:33:20] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:33:20] ================= xe_ggtt_iov (9 subtests) =================
[01:33:20] [PASSED] init_shared_pf
[01:33:20] [PASSED] init_partial_overlap
[01:33:20] [PASSED] alloc_usable_pool_low
[01:33:20] [PASSED] alloc_shareable_pool_high
[01:33:20] [PASSED] alloc_partial_overlap
[01:33:20] [PASSED] alloc_partial_overlap_usable_full
[01:33:20] [PASSED] alloc_partial_overlap_shareable_full
[01:33:20] [PASSED] alloc_shareable_pool_unavailable
[01:33:20] [PASSED] alloc_shareable_pool_oversized
[01:33:20] =================== [PASSED] xe_ggtt_iov ===================
[01:33:20] =================== xe_ggtt (3 subtests) ===================
[01:33:20] [PASSED] init_native
[01:33:20] [PASSED] alloc_usable_pool_native
[01:33:20] [PASSED] alloc_usable_pool_oversized
[01:33:20] ===================== [PASSED] xe_ggtt =====================
[01:33:20] ================== guc_buf (11 subtests) ===================
[01:33:20] [PASSED] test_smallest
[01:33:20] [PASSED] test_largest
[01:33:20] [PASSED] test_granular
[01:33:20] [PASSED] test_unique
[01:33:20] [PASSED] test_overlap
[01:33:20] [PASSED] test_reusable
[01:33:20] [PASSED] test_too_big
[01:33:20] [PASSED] test_flush
[01:33:20] [PASSED] test_lookup
[01:33:20] [PASSED] test_data
[01:33:20] [PASSED] test_class
[01:33:20] ===================== [PASSED] guc_buf =====================
[01:33:20] =================== guc_dbm (7 subtests) ===================
[01:33:20] [PASSED] test_empty
[01:33:20] [PASSED] test_default
[01:33:20] ======================== test_size  ========================
[01:33:20] [PASSED] 4
[01:33:20] [PASSED] 8
[01:33:20] [PASSED] 32
[01:33:20] [PASSED] 256
[01:33:20] ==================== [PASSED] test_size ====================
[01:33:20] ======================= test_reuse  ========================
[01:33:20] [PASSED] 4
[01:33:20] [PASSED] 8
[01:33:20] [PASSED] 32
[01:33:20] [PASSED] 256
[01:33:20] =================== [PASSED] test_reuse ====================
[01:33:20] =================== test_range_overlap  ====================
[01:33:20] [PASSED] 4
[01:33:20] [PASSED] 8
[01:33:20] [PASSED] 32
[01:33:20] [PASSED] 256
[01:33:20] =============== [PASSED] test_range_overlap ================
[01:33:20] =================== test_range_compact  ====================
[01:33:20] [PASSED] 4
[01:33:20] [PASSED] 8
[01:33:20] [PASSED] 32
[01:33:20] [PASSED] 256
[01:33:20] =============== [PASSED] test_range_compact ================
[01:33:20] ==================== test_range_spare  =====================
[01:33:20] [PASSED] 4
[01:33:20] [PASSED] 8
[01:33:20] [PASSED] 32
[01:33:20] [PASSED] 256
[01:33:20] ================ [PASSED] test_range_spare =================
[01:33:20] ===================== [PASSED] guc_dbm =====================
[01:33:20] ================== guc_idm (22 subtests) ===================
[01:33:20] [PASSED] bad_init
[01:33:20] [PASSED] no_init
[01:33:20] [PASSED] init_fini
[01:33:20] [PASSED] check_init_small
[01:33:20] [PASSED] check_init_shared
[01:33:20] [PASSED] check_used
[01:33:20] [PASSED] check_quota
[01:33:20] [PASSED] check_all
[01:33:20] [PASSED] check_limits
[01:33:20] [PASSED] check_overlap
[01:33:20] [PASSED] check_overlap_alloc
[01:33:20] [PASSED] check_overlap_release
[01:33:20] [PASSED] check_overlap_partial_init
[01:33:20] [PASSED] check_overlap_partial_shared_range_blocking
[01:33:20] [PASSED] check_used_usable
[01:33:20] [PASSED] check_used_shareable
[01:33:20] [PASSED] check_used_mixed
[01:33:20] [PASSED] check_release_usable_range
[01:33:20] [PASSED] check_release_shareable_range
[01:33:20] [PASSED] check_split_boundaries
[01:33:20] [PASSED] check_shareable_spare
[01:33:20] [PASSED] check_shareable_spare_fragmented_tail
[01:33:20] ===================== [PASSED] guc_idm =====================
[01:33:20] ============== guc_klv_helpers (13 subtests) ===============
[01:33:20] [PASSED] test_count
[01:33:20] [PASSED] test_encode_u32
[01:33:20] [PASSED] test_encode_u64
[01:33:20] [PASSED] test_encode_string
[01:33:20] [PASSED] test_encode_object_raw
[01:33:20] [PASSED] test_encode_object_klv
[01:33:20] [PASSED] test_encode_object_nested
[01:33:20] [PASSED] test_encode_object_basic
[01:33:20] ===================== test_decode_u16  =====================
[01:33:20] [PASSED] empty
[01:33:20] [PASSED] valid
[01:33:20] [PASSED] max
[01:33:20] [PASSED] big
[01:33:20] [PASSED] long
[01:33:20] ================= [PASSED] test_decode_u16 =================
[01:33:20] ===================== test_decode_u32  =====================
[01:33:20] [PASSED] empty
[01:33:20] [PASSED] valid
[01:33:20] [PASSED] max
[01:33:20] [PASSED] long
[01:33:20] ================= [PASSED] test_decode_u32 =================
[01:33:20] ===================== test_decode_u64  =====================
[01:33:20] [PASSED] empty
[01:33:20] [PASSED] short
[01:33:20] [PASSED] valid
[01:33:20] [PASSED] max
[01:33:20] [PASSED] long
[01:33:20] ================= [PASSED] test_decode_u64 =================
[01:33:20] ===================== test_decode_str  =====================
[01:33:20] [PASSED] empty
[01:33:20] [PASSED] one
[01:33:20] [PASSED] one_trash
[01:33:20] [PASSED] two
[01:33:20] [PASSED] two_trash
[01:33:20] [PASSED] three
[01:33:20] [PASSED] dword
[01:33:20] [PASSED] four
[01:33:20] [PASSED] five
[01:33:20] [PASSED] six
[01:33:20] [PASSED] seven
[01:33:20] [PASSED] qword
[01:33:20] ================= [PASSED] test_decode_str =================
[01:33:20] [PASSED] test_print
[01:33:20] ================= [PASSED] guc_klv_helpers =================
[01:33:20] =================== xe_log (4 subtests) ====================
[01:33:20] [PASSED] demo_cper
[01:33:20] [PASSED] demo_dmesg
[01:33:20] ======================= test_dmesg  ========================
[01:33:20] [PASSED] test_fatal
[01:33:20] [PASSED] test_fatal_tile
[01:33:20] [PASSED] test_fatal_gt
[01:33:20] [PASSED] test_fatal_comp
[01:33:20] [PASSED] test_fatal_comp_tile
[01:33:20] [PASSED] test_fatal_comp_gt
[01:33:20] [PASSED] test_fatal_all
[01:33:20] [PASSED] test_recoverable
[01:33:20] [PASSED] test_recoverable_tile
[01:33:20] [PASSED] test_recoverable_gt
[01:33:20] [PASSED] test_recoverable_comp
[01:33:20] [PASSED] test_recoverable_comp_tile
[01:33:20] [PASSED] test_recoverable_comp_gt
[01:33:20] [PASSED] test_recoverable_all
[01:33:20] [PASSED] test_info
[01:33:20] [PASSED] test_info_tile
[01:33:20] [PASSED] test_info_gt
[01:33:20] [PASSED] test_info_err
[01:33:20] [PASSED] test_info_comp
[01:33:20] [PASSED] test_info_comp_tile
[01:33:20] [PASSED] test_info_comp_gt
[01:33:20] [PASSED] test_info_all
[01:33:20] [PASSED] test_hw_fatal
[01:33:20] [PASSED] test_hw_recoverable
[01:33:20] [PASSED] test_hw_corrected
[01:33:20] [PASSED] test_hw_informational
[01:33:20] =================== [PASSED] test_dmesg ====================
[01:33:20] ====================== test_invalid  =======================
[01:33:20] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[01:33:20] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[01:33:20] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[01:33:20] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[01:33:20] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[01:33:20] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[01:33:20] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[01:33:20] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[01:33:20] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[01:33:20] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[01:33:20] ================== [SKIPPED] test_invalid ==================
[01:33:20] ===================== [PASSED] xe_log ======================
[01:33:20] ================== no_relay (3 subtests) ===================
[01:33:20] [PASSED] xe_drops_guc2pf_if_not_ready
[01:33:20] [PASSED] xe_drops_guc2vf_if_not_ready
[01:33:20] [PASSED] xe_rejects_send_if_not_ready
[01:33:20] ==================== [PASSED] no_relay =====================
[01:33:20] ================== pf_relay (14 subtests) ==================
[01:33:20] [PASSED] pf_rejects_guc2pf_too_short
[01:33:20] [PASSED] pf_rejects_guc2pf_too_long
[01:33:20] [PASSED] pf_rejects_guc2pf_no_payload
[01:33:20] [PASSED] pf_fails_no_payload
[01:33:20] [PASSED] pf_fails_bad_origin
[01:33:20] [PASSED] pf_fails_bad_type
[01:33:20] [PASSED] pf_txn_reports_error
[01:33:20] [PASSED] pf_txn_sends_pf2guc
[01:33:20] [PASSED] pf_sends_pf2guc
[01:33:20] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[01:33:20] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[01:33:20] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[01:33:20] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[01:33:20] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[01:33:20] ==================== [PASSED] pf_relay =====================
[01:33:20] ================== vf_relay (3 subtests) ===================
[01:33:20] [PASSED] vf_rejects_guc2vf_too_short
[01:33:20] [PASSED] vf_rejects_guc2vf_too_long
[01:33:20] [PASSED] vf_rejects_guc2vf_no_payload
[01:33:20] ==================== [PASSED] vf_relay =====================
[01:33:20] ================ pf_gt_config (9 subtests) =================
[01:33:20] [PASSED] fair_contexts_1vf
[01:33:20] [PASSED] fair_doorbells_1vf
[01:33:20] [PASSED] fair_ggtt_1vf
[01:33:20] ====================== fair_vram_1vf  ======================
[01:33:20] [PASSED] 3.50 GiB
[01:33:20] [PASSED] 11.5 GiB
[01:33:20] [PASSED] 15.5 GiB
[01:33:20] [PASSED] 31.5 GiB
[01:33:20] [PASSED] 63.5 GiB
[01:33:20] [PASSED] 1.91 GiB
[01:33:20] ================== [PASSED] fair_vram_1vf ==================
[01:33:20] ================ fair_vram_1vf_admin_only  =================
[01:33:20] [PASSED] 3.50 GiB
[01:33:20] [PASSED] 11.5 GiB
[01:33:20] [PASSED] 15.5 GiB
[01:33:20] [PASSED] 31.5 GiB
[01:33:20] [PASSED] 63.5 GiB
[01:33:20] [PASSED] 1.91 GiB
[01:33:20] ============ [PASSED] fair_vram_1vf_admin_only =============
[01:33:20] ====================== fair_contexts  ======================
[01:33:20] [PASSED] 1 VF
[01:33:20] [PASSED] 2 VFs
[01:33:20] [PASSED] 3 VFs
[01:33:20] [PASSED] 4 VFs
[01:33:20] [PASSED] 5 VFs
[01:33:20] [PASSED] 6 VFs
[01:33:20] [PASSED] 7 VFs
[01:33:20] [PASSED] 8 VFs
[01:33:20] [PASSED] 9 VFs
[01:33:20] [PASSED] 10 VFs
[01:33:20] [PASSED] 11 VFs
[01:33:20] [PASSED] 12 VFs
[01:33:20] [PASSED] 13 VFs
[01:33:20] [PASSED] 14 VFs
[01:33:20] [PASSED] 15 VFs
[01:33:20] [PASSED] 16 VFs
[01:33:20] [PASSED] 17 VFs
[01:33:20] [PASSED] 18 VFs
[01:33:20] [PASSED] 19 VFs
[01:33:20] [PASSED] 20 VFs
[01:33:20] [PASSED] 21 VFs
[01:33:20] [PASSED] 22 VFs
[01:33:20] [PASSED] 23 VFs
[01:33:20] [PASSED] 24 VFs
[01:33:20] [PASSED] 25 VFs
[01:33:20] [PASSED] 26 VFs
[01:33:20] [PASSED] 27 VFs
[01:33:20] [PASSED] 28 VFs
[01:33:20] [PASSED] 29 VFs
[01:33:20] [PASSED] 30 VFs
[01:33:20] [PASSED] 31 VFs
[01:33:20] [PASSED] 32 VFs
[01:33:20] [PASSED] 33 VFs
[01:33:20] [PASSED] 34 VFs
[01:33:20] [PASSED] 35 VFs
[01:33:20] [PASSED] 36 VFs
[01:33:20] [PASSED] 37 VFs
[01:33:20] [PASSED] 38 VFs
[01:33:20] [PASSED] 39 VFs
[01:33:20] [PASSED] 40 VFs
[01:33:20] [PASSED] 41 VFs
[01:33:20] [PASSED] 42 VFs
[01:33:20] [PASSED] 43 VFs
[01:33:20] [PASSED] 44 VFs
[01:33:20] [PASSED] 45 VFs
[01:33:20] [PASSED] 46 VFs
[01:33:20] [PASSED] 47 VFs
[01:33:20] [PASSED] 48 VFs
[01:33:20] [PASSED] 49 VFs
[01:33:20] [PASSED] 50 VFs
[01:33:20] [PASSED] 51 VFs
[01:33:20] [PASSED] 52 VFs
[01:33:20] [PASSED] 53 VFs
[01:33:20] [PASSED] 54 VFs
[01:33:20] [PASSED] 55 VFs
[01:33:20] [PASSED] 56 VFs
[01:33:20] [PASSED] 57 VFs
[01:33:20] [PASSED] 58 VFs
[01:33:20] [PASSED] 59 VFs
[01:33:20] [PASSED] 60 VFs
[01:33:20] [PASSED] 61 VFs
[01:33:20] [PASSED] 62 VFs
[01:33:20] [PASSED] 63 VFs
[01:33:20] ================== [PASSED] fair_contexts ==================
[01:33:20] ===================== fair_doorbells  ======================
[01:33:20] [PASSED] 1 VF
[01:33:20] [PASSED] 2 VFs
[01:33:20] [PASSED] 3 VFs
[01:33:20] [PASSED] 4 VFs
[01:33:20] [PASSED] 5 VFs
[01:33:20] [PASSED] 6 VFs
[01:33:20] [PASSED] 7 VFs
[01:33:20] [PASSED] 8 VFs
[01:33:20] [PASSED] 9 VFs
[01:33:20] [PASSED] 10 VFs
[01:33:20] [PASSED] 11 VFs
[01:33:20] [PASSED] 12 VFs
[01:33:20] [PASSED] 13 VFs
[01:33:20] [PASSED] 14 VFs
[01:33:20] [PASSED] 15 VFs
[01:33:20] [PASSED] 16 VFs
[01:33:20] [PASSED] 17 VFs
[01:33:20] [PASSED] 18 VFs
[01:33:20] [PASSED] 19 VFs
[01:33:20] [PASSED] 20 VFs
[01:33:20] [PASSED] 21 VFs
[01:33:20] [PASSED] 22 VFs
[01:33:20] [PASSED] 23 VFs
[01:33:20] [PASSED] 24 VFs
[01:33:20] [PASSED] 25 VFs
[01:33:20] [PASSED] 26 VFs
[01:33:20] [PASSED] 27 VFs
[01:33:20] [PASSED] 28 VFs
[01:33:20] [PASSED] 29 VFs
[01:33:20] [PASSED] 30 VFs
[01:33:20] [PASSED] 31 VFs
[01:33:20] [PASSED] 32 VFs
[01:33:20] [PASSED] 33 VFs
[01:33:20] [PASSED] 34 VFs
[01:33:20] [PASSED] 35 VFs
[01:33:20] [PASSED] 36 VFs
[01:33:20] [PASSED] 37 VFs
[01:33:20] [PASSED] 38 VFs
[01:33:20] [PASSED] 39 VFs
[01:33:20] [PASSED] 40 VFs
[01:33:20] [PASSED] 41 VFs
[01:33:20] [PASSED] 42 VFs
[01:33:20] [PASSED] 43 VFs
[01:33:20] [PASSED] 44 VFs
[01:33:20] [PASSED] 45 VFs
[01:33:20] [PASSED] 46 VFs
[01:33:20] [PASSED] 47 VFs
[01:33:20] [PASSED] 48 VFs
[01:33:20] [PASSED] 49 VFs
[01:33:20] [PASSED] 50 VFs
[01:33:20] [PASSED] 51 VFs
[01:33:20] [PASSED] 52 VFs
[01:33:20] [PASSED] 53 VFs
[01:33:20] [PASSED] 54 VFs
[01:33:20] [PASSED] 55 VFs
[01:33:20] [PASSED] 56 VFs
[01:33:20] [PASSED] 57 VFs
[01:33:20] [PASSED] 58 VFs
[01:33:20] [PASSED] 59 VFs
[01:33:20] [PASSED] 60 VFs
[01:33:20] [PASSED] 61 VFs
[01:33:20] [PASSED] 62 VFs
[01:33:20] [PASSED] 63 VFs
[01:33:20] ================= [PASSED] fair_doorbells ==================
[01:33:20] ======================== fair_ggtt  ========================
[01:33:20] [PASSED] 1 VF
[01:33:20] [PASSED] 2 VFs
[01:33:20] [PASSED] 3 VFs
[01:33:20] [PASSED] 4 VFs
[01:33:20] [PASSED] 5 VFs
[01:33:20] [PASSED] 6 VFs
[01:33:20] [PASSED] 7 VFs
[01:33:20] [PASSED] 8 VFs
[01:33:20] [PASSED] 9 VFs
[01:33:20] [PASSED] 10 VFs
[01:33:20] [PASSED] 11 VFs
[01:33:20] [PASSED] 12 VFs
[01:33:20] [PASSED] 13 VFs
[01:33:20] [PASSED] 14 VFs
[01:33:20] [PASSED] 15 VFs
[01:33:20] [PASSED] 16 VFs
[01:33:20] [PASSED] 17 VFs
[01:33:20] [PASSED] 18 VFs
[01:33:20] [PASSED] 19 VFs
[01:33:20] [PASSED] 20 VFs
[01:33:20] [PASSED] 21 VFs
[01:33:20] [PASSED] 22 VFs
[01:33:20] [PASSED] 23 VFs
[01:33:20] [PASSED] 24 VFs
[01:33:20] [PASSED] 25 VFs
[01:33:20] [PASSED] 26 VFs
[01:33:20] [PASSED] 27 VFs
[01:33:21] [PASSED] 28 VFs
[01:33:21] [PASSED] 29 VFs
[01:33:21] [PASSED] 30 VFs
[01:33:21] [PASSED] 31 VFs
[01:33:21] [PASSED] 32 VFs
[01:33:21] [PASSED] 33 VFs
[01:33:21] [PASSED] 34 VFs
[01:33:21] [PASSED] 35 VFs
[01:33:21] [PASSED] 36 VFs
[01:33:21] [PASSED] 37 VFs
[01:33:21] [PASSED] 38 VFs
[01:33:21] [PASSED] 39 VFs
[01:33:21] [PASSED] 40 VFs
[01:33:21] [PASSED] 41 VFs
[01:33:21] [PASSED] 42 VFs
[01:33:21] [PASSED] 43 VFs
[01:33:21] [PASSED] 44 VFs
[01:33:21] [PASSED] 45 VFs
[01:33:21] [PASSED] 46 VFs
[01:33:21] [PASSED] 47 VFs
[01:33:21] [PASSED] 48 VFs
[01:33:21] [PASSED] 49 VFs
[01:33:21] [PASSED] 50 VFs
[01:33:21] [PASSED] 51 VFs
[01:33:21] [PASSED] 52 VFs
[01:33:21] [PASSED] 53 VFs
[01:33:21] [PASSED] 54 VFs
[01:33:21] [PASSED] 55 VFs
[01:33:21] [PASSED] 56 VFs
[01:33:21] [PASSED] 57 VFs
[01:33:21] [PASSED] 58 VFs
[01:33:21] [PASSED] 59 VFs
[01:33:21] [PASSED] 60 VFs
[01:33:21] [PASSED] 61 VFs
[01:33:21] [PASSED] 62 VFs
[01:33:21] [PASSED] 63 VFs
[01:33:21] ==================== [PASSED] fair_ggtt ====================
[01:33:21] ======================== fair_vram  ========================
[01:33:21] [PASSED] 1 VF
[01:33:21] [PASSED] 2 VFs
[01:33:21] [PASSED] 3 VFs
[01:33:21] [PASSED] 4 VFs
[01:33:21] [PASSED] 5 VFs
[01:33:21] [PASSED] 6 VFs
[01:33:21] [PASSED] 7 VFs
[01:33:21] [PASSED] 8 VFs
[01:33:21] [PASSED] 9 VFs
[01:33:21] [PASSED] 10 VFs
[01:33:21] [PASSED] 11 VFs
[01:33:21] [PASSED] 12 VFs
[01:33:21] [PASSED] 13 VFs
[01:33:21] [PASSED] 14 VFs
[01:33:21] [PASSED] 15 VFs
[01:33:21] [PASSED] 16 VFs
[01:33:21] [PASSED] 17 VFs
[01:33:21] [PASSED] 18 VFs
[01:33:21] [PASSED] 19 VFs
[01:33:21] [PASSED] 20 VFs
[01:33:21] [PASSED] 21 VFs
[01:33:21] [PASSED] 22 VFs
[01:33:21] [PASSED] 23 VFs
[01:33:21] [PASSED] 24 VFs
[01:33:21] [PASSED] 25 VFs
[01:33:21] [PASSED] 26 VFs
[01:33:21] [PASSED] 27 VFs
[01:33:21] [PASSED] 28 VFs
[01:33:21] [PASSED] 29 VFs
[01:33:21] [PASSED] 30 VFs
[01:33:21] [PASSED] 31 VFs
[01:33:21] [PASSED] 32 VFs
[01:33:21] [PASSED] 33 VFs
[01:33:21] [PASSED] 34 VFs
[01:33:21] [PASSED] 35 VFs
[01:33:21] [PASSED] 36 VFs
[01:33:21] [PASSED] 37 VFs
[01:33:21] [PASSED] 38 VFs
[01:33:21] [PASSED] 39 VFs
[01:33:21] [PASSED] 40 VFs
[01:33:21] [PASSED] 41 VFs
[01:33:21] [PASSED] 42 VFs
[01:33:21] [PASSED] 43 VFs
[01:33:21] [PASSED] 44 VFs
[01:33:21] [PASSED] 45 VFs
[01:33:21] [PASSED] 46 VFs
[01:33:21] [PASSED] 47 VFs
[01:33:21] [PASSED] 48 VFs
[01:33:21] [PASSED] 49 VFs
[01:33:21] [PASSED] 50 VFs
[01:33:21] [PASSED] 51 VFs
[01:33:21] [PASSED] 52 VFs
[01:33:21] [PASSED] 53 VFs
[01:33:21] [PASSED] 54 VFs
[01:33:21] [PASSED] 55 VFs
[01:33:21] [PASSED] 56 VFs
[01:33:21] [PASSED] 57 VFs
[01:33:21] [PASSED] 58 VFs
[01:33:21] [PASSED] 59 VFs
[01:33:21] [PASSED] 60 VFs
[01:33:21] [PASSED] 61 VFs
[01:33:21] [PASSED] 62 VFs
[01:33:21] [PASSED] 63 VFs
[01:33:21] ==================== [PASSED] fair_vram ====================
[01:33:21] ================== [PASSED] pf_gt_config ===================
[01:33:21] ===================== lmtt (1 subtest) =====================
[01:33:21] ======================== test_ops  =========================
[01:33:21] [PASSED] 2-level
[01:33:21] [PASSED] multi-level
[01:33:21] ==================== [PASSED] test_ops =====================
[01:33:21] ====================== [PASSED] lmtt =======================
[01:33:21] ================= sriov_packet (1 subtest) =================
[01:33:21] [PASSED] test_descriptor_init
[01:33:21] ================== [PASSED] sriov_packet ===================
[01:33:21] ================= pf_service (11 subtests) =================
[01:33:21] [PASSED] pf_negotiate_any
[01:33:21] [PASSED] pf_negotiate_base_match
[01:33:21] [PASSED] pf_negotiate_base_newer
[01:33:21] [PASSED] pf_negotiate_base_next
[01:33:21] [SKIPPED] pf_negotiate_base_older (no older minor)
[01:33:21] [PASSED] pf_negotiate_base_prev
[01:33:21] [PASSED] pf_negotiate_latest_match
[01:33:21] [PASSED] pf_negotiate_latest_newer
[01:33:21] [PASSED] pf_negotiate_latest_next
[01:33:21] [SKIPPED] pf_negotiate_latest_older (no older minor)
[01:33:21] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[01:33:21] =================== [PASSED] pf_service ====================
[01:33:21] ================= xe_guc_g2g (2 subtests) ==================
[01:33:21] ============== xe_live_guc_g2g_kunit_default  ==============
[01:33:21] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[01:33:21] ============== xe_live_guc_g2g_kunit_allmem  ===============
[01:33:21] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[01:33:21] =================== [SKIPPED] xe_guc_g2g ===================
[01:33:21] =================== xe_mocs (2 subtests) ===================
[01:33:21] ================ xe_live_mocs_kernel_kunit  ================
[01:33:21] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[01:33:21] ================ xe_live_mocs_reset_kunit  =================
[01:33:21] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[01:33:21] ==================== [SKIPPED] xe_mocs =====================
[01:33:21] ================= xe_migrate (3 subtests) ==================
[01:33:21] ================= xe_migrate_sanity_kunit  =================
[01:33:21] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[01:33:21] ================== xe_validate_ccs_kunit  ==================
[01:33:21] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[01:33:21] ============= xe_migrate_access_memory_kunit  ==============
[01:33:21] ========= [SKIPPED] xe_migrate_access_memory_kunit =========
[01:33:21] =================== [SKIPPED] xe_migrate ===================
[01:33:21] ================== xe_dma_buf (1 subtest) ==================
[01:33:21] ==================== xe_dma_buf_kunit  =====================
[01:33:21] ================ [SKIPPED] xe_dma_buf_kunit ================
[01:33:21] =================== [SKIPPED] xe_dma_buf ===================
[01:33:21] ================= xe_bo_shrink (1 subtest) =================
[01:33:21] =================== xe_bo_shrink_kunit  ====================
[01:33:21] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[01:33:21] ================== [SKIPPED] xe_bo_shrink ==================
[01:33:21] ==================== xe_bo (2 subtests) ====================
[01:33:21] ================== xe_ccs_migrate_kunit  ===================
[01:33:21] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[01:33:21] ==================== xe_bo_evict_kunit  ====================
[01:33:21] =============== [SKIPPED] xe_bo_evict_kunit ================
[01:33:21] ===================== [SKIPPED] xe_bo ======================
[01:33:21] =================== xe_any (9 subtests) ====================
[01:33:21] [PASSED] test_to_xe
[01:33:21] [PASSED] test_to_dev
[01:33:21] [PASSED] test_to_pdev
[01:33:21] [PASSED] test_to_drm
[01:33:21] [PASSED] test_if_pdev
[01:33:21] [PASSED] test_if_xe
[01:33:21] [PASSED] test_if_tile
[01:33:21] [PASSED] test_if_gt
[01:33:21] [PASSED] test_to_id
[01:33:21] ===================== [PASSED] xe_any ======================
[01:33:21] ==================== args (13 subtests) ====================
[01:33:21] [PASSED] count_args_test
[01:33:21] [PASSED] call_args_example
[01:33:21] [PASSED] call_args_test
[01:33:21] [PASSED] drop_first_arg_example
[01:33:21] [PASSED] drop_first_arg_test
[01:33:21] [PASSED] first_arg_example
[01:33:21] [PASSED] first_arg_test
[01:33:21] [PASSED] last_arg_example
[01:33:21] [PASSED] last_arg_test
[01:33:21] [PASSED] pick_arg_example
[01:33:21] [PASSED] if_args_example
[01:33:21] [PASSED] if_args_test
[01:33:21] [PASSED] sep_comma_example
[01:33:21] ====================== [PASSED] args =======================
[01:33:21] =================== xe_pci (3 subtests) ====================
[01:33:21] ==================== check_graphics_ip  ====================
[01:33:21] [PASSED] 12.00 Xe_LP
[01:33:21] [PASSED] 12.10 Xe_LP+
[01:33:21] [PASSED] 12.55 Xe_HPG
[01:33:21] [PASSED] 12.60 Xe_HPC
[01:33:21] [PASSED] 12.70 Xe_LPG
[01:33:21] [PASSED] 12.71 Xe_LPG
[01:33:21] [PASSED] 12.74 Xe_LPG+
[01:33:21] [PASSED] 20.01 Xe2_HPG
[01:33:21] [PASSED] 20.02 Xe2_HPG
[01:33:21] [PASSED] 20.04 Xe2_LPG
[01:33:21] [PASSED] 30.00 Xe3_LPG
[01:33:21] [PASSED] 30.01 Xe3_LPG
[01:33:21] [PASSED] 30.03 Xe3_LPG
[01:33:21] [PASSED] 30.04 Xe3_LPG
[01:33:21] [PASSED] 30.05 Xe3_LPG
[01:33:21] [PASSED] 35.10 Xe3p_LPG
[01:33:21] [PASSED] 35.11 Xe3p_XPC
[01:33:21] ================ [PASSED] check_graphics_ip ================
[01:33:21] ===================== check_media_ip  ======================
[01:33:21] [PASSED] 12.00 Xe_M
[01:33:21] [PASSED] 12.55 Xe_HPM
[01:33:21] [PASSED] 13.00 Xe_LPM+
[01:33:21] [PASSED] 13.01 Xe2_HPM
[01:33:21] [PASSED] 20.00 Xe2_LPM
[01:33:21] [PASSED] 30.00 Xe3_LPM
[01:33:21] [PASSED] 30.02 Xe3_LPM
[01:33:21] [PASSED] 35.00 Xe3p_LPM
[01:33:21] [PASSED] 35.03 Xe3p_HPM
[01:33:21] ================= [PASSED] check_media_ip ==================
[01:33:21] =================== check_platform_desc  ===================
[01:33:21] [PASSED] 0x9A60 (TIGERLAKE)
[01:33:21] [PASSED] 0x9A68 (TIGERLAKE)
[01:33:21] [PASSED] 0x9A70 (TIGERLAKE)
[01:33:21] [PASSED] 0x9A40 (TIGERLAKE)
[01:33:21] [PASSED] 0x9A49 (TIGERLAKE)
[01:33:21] [PASSED] 0x9A59 (TIGERLAKE)
[01:33:21] [PASSED] 0x9A78 (TIGERLAKE)
[01:33:21] [PASSED] 0x9AC0 (TIGERLAKE)
[01:33:21] [PASSED] 0x9AC9 (TIGERLAKE)
[01:33:21] [PASSED] 0x9AD9 (TIGERLAKE)
[01:33:21] [PASSED] 0x9AF8 (TIGERLAKE)
[01:33:21] [PASSED] 0x4C80 (ROCKETLAKE)
[01:33:21] [PASSED] 0x4C8A (ROCKETLAKE)
[01:33:21] [PASSED] 0x4C8B (ROCKETLAKE)
[01:33:21] [PASSED] 0x4C8C (ROCKETLAKE)
[01:33:21] [PASSED] 0x4C90 (ROCKETLAKE)
[01:33:21] [PASSED] 0x4C9A (ROCKETLAKE)
[01:33:21] [PASSED] 0x4680 (ALDERLAKE_S)
[01:33:21] [PASSED] 0x4682 (ALDERLAKE_S)
[01:33:21] [PASSED] 0x4688 (ALDERLAKE_S)
[01:33:21] [PASSED] 0x468A (ALDERLAKE_S)
[01:33:21] [PASSED] 0x468B (ALDERLAKE_S)
[01:33:21] [PASSED] 0x4690 (ALDERLAKE_S)
[01:33:21] [PASSED] 0x4692 (ALDERLAKE_S)
[01:33:21] [PASSED] 0x4693 (ALDERLAKE_S)
[01:33:21] [PASSED] 0x46A0 (ALDERLAKE_P)
[01:33:21] [PASSED] 0x46A1 (ALDERLAKE_P)
[01:33:21] [PASSED] 0x46A2 (ALDERLAKE_P)
[01:33:21] [PASSED] 0x46A3 (ALDERLAKE_P)
[01:33:21] [PASSED] 0x46A6 (ALDERLAKE_P)
[01:33:21] [PASSED] 0x46A8 (ALDERLAKE_P)
[01:33:21] [PASSED] 0x46AA (ALDERLAKE_P)
[01:33:21] [PASSED] 0x462A (ALDERLAKE_P)
[01:33:21] [PASSED] 0x4626 (ALDERLAKE_P)
[01:33:21] [PASSED] 0x4628 (ALDERLAKE_P)
[01:33:21] [PASSED] 0x46B0 (ALDERLAKE_P)
[01:33:21] [PASSED] 0x46B1 (ALDERLAKE_P)
[01:33:21] [PASSED] 0x46B2 (ALDERLAKE_P)
[01:33:21] [PASSED] 0x46B3 (ALDERLAKE_P)
[01:33:21] [PASSED] 0x46C0 (ALDERLAKE_P)
[01:33:21] [PASSED] 0x46C1 (ALDERLAKE_P)
[01:33:21] [PASSED] 0x46C2 (ALDERLAKE_P)
[01:33:21] [PASSED] 0x46C3 (ALDERLAKE_P)
[01:33:21] [PASSED] 0x46D0 (ALDERLAKE_N)
[01:33:21] [PASSED] 0x46D1 (ALDERLAKE_N)
[01:33:21] [PASSED] 0x46D2 (ALDERLAKE_N)
[01:33:21] [PASSED] 0x46D3 (ALDERLAKE_N)
[01:33:21] [PASSED] 0x46D4 (ALDERLAKE_N)
[01:33:21] [PASSED] 0xA721 (ALDERLAKE_P)
[01:33:21] [PASSED] 0xA7A1 (ALDERLAKE_P)
[01:33:21] [PASSED] 0xA7A9 (ALDERLAKE_P)
[01:33:21] [PASSED] 0xA7AC (ALDERLAKE_P)
[01:33:21] [PASSED] 0xA7AD (ALDERLAKE_P)
[01:33:21] [PASSED] 0xA720 (ALDERLAKE_P)
[01:33:21] [PASSED] 0xA7A0 (ALDERLAKE_P)
[01:33:21] [PASSED] 0xA7A8 (ALDERLAKE_P)
[01:33:21] [PASSED] 0xA7AA (ALDERLAKE_P)
[01:33:21] [PASSED] 0xA7AB (ALDERLAKE_P)
[01:33:21] [PASSED] 0xA780 (ALDERLAKE_S)
[01:33:21] [PASSED] 0xA781 (ALDERLAKE_S)
[01:33:21] [PASSED] 0xA782 (ALDERLAKE_S)
[01:33:21] [PASSED] 0xA783 (ALDERLAKE_S)
[01:33:21] [PASSED] 0xA788 (ALDERLAKE_S)
[01:33:21] [PASSED] 0xA789 (ALDERLAKE_S)
[01:33:21] [PASSED] 0xA78A (ALDERLAKE_S)
[01:33:21] [PASSED] 0xA78B (ALDERLAKE_S)
[01:33:21] [PASSED] 0x4905 (DG1)
[01:33:21] [PASSED] 0x4906 (DG1)
[01:33:21] [PASSED] 0x4907 (DG1)
[01:33:21] [PASSED] 0x4908 (DG1)
[01:33:21] [PASSED] 0x4909 (DG1)
[01:33:21] [PASSED] 0x56C0 (DG2)
[01:33:21] [PASSED] 0x56C2 (DG2)
[01:33:21] [PASSED] 0x56C1 (DG2)
[01:33:21] [PASSED] 0x7D51 (METEORLAKE)
[01:33:21] [PASSED] 0x7DD1 (METEORLAKE)
[01:33:21] [PASSED] 0x7D41 (METEORLAKE)
[01:33:21] [PASSED] 0x7D67 (METEORLAKE)
[01:33:21] [PASSED] 0xB640 (METEORLAKE)
[01:33:21] [PASSED] 0x56A0 (DG2)
[01:33:21] [PASSED] 0x56A1 (DG2)
[01:33:21] [PASSED] 0x56A2 (DG2)
[01:33:21] [PASSED] 0x56BE (DG2)
[01:33:21] [PASSED] 0x56BF (DG2)
[01:33:21] [PASSED] 0x5690 (DG2)
[01:33:21] [PASSED] 0x5691 (DG2)
[01:33:21] [PASSED] 0x5692 (DG2)
[01:33:21] [PASSED] 0x56A5 (DG2)
[01:33:21] [PASSED] 0x56A6 (DG2)
[01:33:21] [PASSED] 0x56B0 (DG2)
[01:33:21] [PASSED] 0x56B1 (DG2)
[01:33:21] [PASSED] 0x56BA (DG2)
[01:33:21] [PASSED] 0x56BB (DG2)
[01:33:21] [PASSED] 0x56BC (DG2)
[01:33:21] [PASSED] 0x56BD (DG2)
[01:33:21] [PASSED] 0x5693 (DG2)
[01:33:21] [PASSED] 0x5694 (DG2)
[01:33:21] [PASSED] 0x5695 (DG2)
[01:33:21] [PASSED] 0x56A3 (DG2)
[01:33:21] [PASSED] 0x56A4 (DG2)
[01:33:21] [PASSED] 0x56B2 (DG2)
[01:33:21] [PASSED] 0x56B3 (DG2)
[01:33:21] [PASSED] 0x5696 (DG2)
[01:33:21] [PASSED] 0x5697 (DG2)
[01:33:21] [PASSED] 0xB69 (PVC)
[01:33:21] [PASSED] 0xB6E (PVC)
[01:33:21] [PASSED] 0xBD4 (PVC)
[01:33:21] [PASSED] 0xBD5 (PVC)
[01:33:21] [PASSED] 0xBD6 (PVC)
[01:33:21] [PASSED] 0xBD7 (PVC)
[01:33:21] [PASSED] 0xBD8 (PVC)
[01:33:21] [PASSED] 0xBD9 (PVC)
[01:33:21] [PASSED] 0xBDA (PVC)
[01:33:21] [PASSED] 0xBDB (PVC)
[01:33:21] [PASSED] 0xBE0 (PVC)
[01:33:21] [PASSED] 0xBE1 (PVC)
[01:33:21] [PASSED] 0xBE5 (PVC)
[01:33:21] [PASSED] 0x7D40 (METEORLAKE)
[01:33:21] [PASSED] 0x7D45 (METEORLAKE)
[01:33:21] [PASSED] 0x7D55 (METEORLAKE)
[01:33:21] [PASSED] 0x7D60 (METEORLAKE)
[01:33:21] [PASSED] 0x7DD5 (METEORLAKE)
[01:33:21] [PASSED] 0x6420 (LUNARLAKE)
[01:33:21] [PASSED] 0x64A0 (LUNARLAKE)
[01:33:21] [PASSED] 0x64B0 (LUNARLAKE)
[01:33:21] [PASSED] 0xE202 (BATTLEMAGE)
[01:33:21] [PASSED] 0xE209 (BATTLEMAGE)
[01:33:21] [PASSED] 0xE20B (BATTLEMAGE)
[01:33:21] [PASSED] 0xE20C (BATTLEMAGE)
[01:33:21] [PASSED] 0xE20D (BATTLEMAGE)
[01:33:21] [PASSED] 0xE210 (BATTLEMAGE)
[01:33:21] [PASSED] 0xE211 (BATTLEMAGE)
[01:33:21] [PASSED] 0xE212 (BATTLEMAGE)
[01:33:21] [PASSED] 0xE216 (BATTLEMAGE)
[01:33:21] [PASSED] 0xE220 (BATTLEMAGE)
[01:33:21] [PASSED] 0xE221 (BATTLEMAGE)
[01:33:21] [PASSED] 0xE222 (BATTLEMAGE)
[01:33:21] [PASSED] 0xE223 (BATTLEMAGE)
[01:33:21] [PASSED] 0xB080 (PANTHERLAKE)
[01:33:21] [PASSED] 0xB081 (PANTHERLAKE)
[01:33:21] [PASSED] 0xB082 (PANTHERLAKE)
[01:33:21] [PASSED] 0xB083 (PANTHERLAKE)
[01:33:21] [PASSED] 0xB084 (PANTHERLAKE)
[01:33:21] [PASSED] 0xB085 (PANTHERLAKE)
[01:33:21] [PASSED] 0xB086 (PANTHERLAKE)
[01:33:21] [PASSED] 0xB087 (PANTHERLAKE)
[01:33:21] [PASSED] 0xB08F (PANTHERLAKE)
[01:33:21] [PASSED] 0xB090 (PANTHERLAKE)
[01:33:21] [PASSED] 0xB0A0 (PANTHERLAKE)
[01:33:21] [PASSED] 0xB0A1 (PANTHERLAKE)
[01:33:21] [PASSED] 0xB0B0 (PANTHERLAKE)
[01:33:21] [PASSED] 0xFD80 (PANTHERLAKE)
[01:33:21] [PASSED] 0xFD81 (PANTHERLAKE)
[01:33:21] [PASSED] 0xD740 (NOVALAKE_S)
[01:33:21] [PASSED] 0xD741 (NOVALAKE_S)
[01:33:21] [PASSED] 0xD742 (NOVALAKE_S)
[01:33:21] [PASSED] 0xD743 (NOVALAKE_S)
[01:33:21] [PASSED] 0xD745 (NOVALAKE_S)
[01:33:21] [PASSED] 0xD74A (NOVALAKE_S)
[01:33:21] [PASSED] 0xD74B (NOVALAKE_S)
[01:33:21] [PASSED] 0x674C (CRESCENTISLAND)
[01:33:21] [PASSED] 0x674D (CRESCENTISLAND)
[01:33:21] [PASSED] 0x674E (CRESCENTISLAND)
[01:33:21] [PASSED] 0x674F (CRESCENTISLAND)
[01:33:21] [PASSED] 0x6750 (CRESCENTISLAND)
[01:33:21] [PASSED] 0x6751 (CRESCENTISLAND)
[01:33:21] [PASSED] 0x6752 (CRESCENTISLAND)
[01:33:21] [PASSED] 0x6753 (CRESCENTISLAND)
[01:33:21] [PASSED] 0x6754 (CRESCENTISLAND)
[01:33:21] [PASSED] 0x6755 (CRESCENTISLAND)
[01:33:21] [PASSED] 0x6756 (CRESCENTISLAND)
[01:33:21] [PASSED] 0xD750 (NOVALAKE_P)
[01:33:21] [PASSED] 0xD751 (NOVALAKE_P)
[01:33:21] [PASSED] 0xD752 (NOVALAKE_P)
[01:33:21] [PASSED] 0xD753 (NOVALAKE_P)
[01:33:21] [PASSED] 0xD754 (NOVALAKE_P)
[01:33:21] [PASSED] 0xD755 (NOVALAKE_P)
[01:33:21] [PASSED] 0xD756 (NOVALAKE_P)
[01:33:21] [PASSED] 0xD757 (NOVALAKE_P)
[01:33:21] [PASSED] 0xD75F (NOVALAKE_P)
[01:33:21] =============== [PASSED] check_platform_desc ===============
[01:33:21] ===================== [PASSED] xe_pci ======================
[01:33:21] ============= xe_rtp_tables_test (5 subtests) ==============
[01:33:21] ================== xe_rtp_table_gt_test  ===================
[01:33:21] [PASSED] gt_was/14011060649
[01:33:21] [PASSED] gt_was/14011059788
[01:33:21] [PASSED] gt_was/14015795083
[01:33:21] [PASSED] gt_was/16021867713
[01:33:21] [PASSED] gt_was/14019449301
[01:33:21] [PASSED] gt_was/16028005424
[01:33:21] [PASSED] gt_was/14026578760
[01:33:21] [PASSED] gt_was/1409420604
[01:33:21] [PASSED] gt_was/1408615072
[01:33:21] [PASSED] gt_was/22010523718
[01:33:21] [PASSED] gt_was/14011006942
[01:33:21] [PASSED] gt_was/14014830051
[01:33:21] [PASSED] gt_was/18018781329
[01:33:21] [PASSED] gt_was/1509235366
[01:33:21] [PASSED] gt_was/18018781329
[01:33:21] [PASSED] gt_was/16016694945
[01:33:21] [PASSED] gt_was/14018575942
[01:33:21] [PASSED] gt_was/22016670082
[01:33:21] [PASSED] gt_was/22016670082
[01:33:21] [PASSED] gt_was/14017421178
[01:33:21] [PASSED] gt_was/16025250150
[01:33:21] [PASSED] gt_was/14021871409
[01:33:21] [PASSED] gt_was/16021865536
[01:33:21] [PASSED] gt_was/14021486841
[01:33:21] [PASSED] gt_was/14025160223
[01:33:21] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[01:33:21] [PASSED] gt_was/14025635424
[01:33:21] [PASSED] gt_was/16028005424
[01:33:21] ============== [PASSED] xe_rtp_table_gt_test ===============
[01:33:21] ================== xe_rtp_table_gt_test  ===================
[01:33:21] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[01:33:21] [PASSED] gt_tunings/Tuning: 32B Access Enable
[01:33:21] [PASSED] gt_tunings/Tuning: L3 cache
[01:33:21] [PASSED] gt_tunings/Tuning: L3 cache - media
[01:33:21] [PASSED] gt_tunings/Tuning: Compression Overfetch
[01:33:21] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[01:33:21] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[01:33:21] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[01:33:21] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[01:33:21] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[01:33:21] [PASSED] gt_tunings/Tuning: Stateless compression control
[01:33:21] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[01:33:21] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[01:33:21] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[01:33:21] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[01:33:21] [PASSED] gt_tunings/Tuning: Force All Non-Compressible Memory Reads to be 256B Overfetches
[01:33:21] ============== [PASSED] xe_rtp_table_gt_test ===============
[01:33:21] ================== xe_rtp_table_oob_test  ==================
[01:33:21] [PASSED] oob_was/1607983814
[01:33:21] [PASSED] oob_was/16010904313
[01:33:21] [PASSED] oob_was/18022495364
[01:33:21] [PASSED] oob_was/22012773006
[01:33:21] [PASSED] oob_was/14014475959
[01:33:21] [PASSED] oob_was/22011391025
[01:33:21] [PASSED] oob_was/22012727170
[01:33:21] [PASSED] oob_was/22012727685
[01:33:21] [PASSED] oob_was/22016596838
[01:33:21] [PASSED] oob_was/18020744125
[01:33:21] [PASSED] oob_was/1409600907
[01:33:21] [PASSED] oob_was/22014953428
[01:33:21] [PASSED] oob_was/16017236439
[01:33:21] [PASSED] oob_was/14019821291
[01:33:21] [PASSED] oob_was/14015076503
[01:33:21] [PASSED] oob_was/22016122933
[01:33:21] [PASSED] oob_was/14018913170
[01:33:21] [PASSED] oob_was/14018094691
[01:33:21] [PASSED] oob_was/18024947630
[01:33:21] [PASSED] oob_was/16022287689
[01:33:21] [PASSED] oob_was/13011645652
[01:33:21] [PASSED] oob_was/14022293748
[01:33:21] [PASSED] oob_was/22019794406
[01:33:21] [PASSED] oob_was/22019338487
[01:33:21] [PASSED] oob_was/16023588340
[01:33:21] [PASSED] oob_was/14019789679
[01:33:21] [PASSED] oob_was/14022866841
[01:33:21] [PASSED] oob_was/16021333562
[01:33:21] [PASSED] oob_was/14016712196
[01:33:21] [PASSED] oob_was/14015568240
[01:33:21] [PASSED] oob_was/18013179988
[01:33:21] [PASSED] oob_was/1508761755
[01:33:21] [PASSED] oob_was/16023105232
[01:33:21] [PASSED] oob_was/16026508708
[01:33:21] [PASSED] oob_was/14020001231
[01:33:21] [PASSED] oob_was/16023683509
[01:33:21] [PASSED] oob_was/14025515070
[01:33:21] [PASSED] oob_was/15015404425_disable
[01:33:21] [PASSED] oob_was/16026007364
[01:33:21] [PASSED] oob_was/14020316580
[01:33:21] [PASSED] oob_was/14025883347
[01:33:21] [PASSED] oob_was/16029380221
[01:33:21] [PASSED] oob_was/22022079272
[01:33:21] [PASSED] oob_was/16029897822
[01:33:21] [PASSED] oob_was/14026539277
[01:33:21] [PASSED] oob_was/14027054324
[01:33:21] [PASSED] oob_was/14025941587
[01:33:21] [PASSED] oob_was/16030224309
[01:33:21] [PASSED] oob_was/14028709524
[01:33:21] [PASSED] oob_was/14028250015
[01:33:21] [PASSED] oob_was/16031259911
[01:33:21] ============== [PASSED] xe_rtp_table_oob_test ==============
[01:33:21] ================ xe_rtp_table_dev_oob_test  ================
[01:33:21] [PASSED] device_oob_was/22010954014
[01:33:21] [PASSED] device_oob_was/15015404425
[01:33:21] [PASSED] device_oob_was/22019338487_display
[01:33:21] [PASSED] device_oob_was/14022085890
[01:33:21] [PASSED] device_oob_was/14026633728
[01:33:21] [PASSED] device_oob_was/14026746987
[01:33:21] [PASSED] device_oob_was/14026779378
[01:33:21] [PASSED] device_oob_was/14028586678
[01:33:21] [PASSED] device_oob_was/14028434957
[01:33:21] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[01:33:21] ========== xe_rtp_table_missing_upper_bound_test  ==========
[01:33:21] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[01:33:21] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[01:33:21] [PASSED] register_whitelist/1806527549
[01:33:21] [PASSED] register_whitelist/allow_read_ctx_timestamp
[01:33:21] [PASSED] register_whitelist/allow_read_queue_timestamp
[01:33:21] [PASSED] register_whitelist/16014440446
[01:33:21] [PASSED] register_whitelist/16017236439
[01:33:21] [PASSED] register_whitelist/16020183090
[01:33:21] [PASSED] register_whitelist/14024997852
[01:33:21] [PASSED] register_whitelist/14024997852
[01:33:21] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[01:33:21] =============== [PASSED] xe_rtp_tables_test ================
[01:33:21] =================== xe_rtp (3 subtests) ====================
[01:33:21] =================== xe_rtp_rules_tests  ====================
[01:33:21] [PASSED] no
[01:33:21] [PASSED] yes
[01:33:21] [PASSED] no-and-no
[01:33:21] [PASSED] no-and-yes
[01:33:21] [PASSED] yes-and-no
[01:33:21] [PASSED] yes-and-yes
[01:33:21] [PASSED] no-or-no
[01:33:21] [PASSED] no-or-yes
[01:33:21] [PASSED] yes-or-no
[01:33:21] [PASSED] yes-or-yes
[01:33:21] [PASSED] no-yes-or-yes-no
[01:33:21] [PASSED] no-yes-or-yes-yes
[01:33:21] [PASSED] yes-yes-or-no-yes
[01:33:21] [PASSED] yes-yes-or-yes-yes
[01:33:21] [PASSED] no-no-or-yes-or-no
[01:33:21] [PASSED] or
[01:33:21] [PASSED] or-yes
[01:33:21] [PASSED] or-no
[01:33:21] [PASSED] yes-or
[01:33:21] [PASSED] no-or
[01:33:21] [PASSED] no-or-or-yes
[01:33:21] [PASSED] yes-or-or-no
[01:33:21] [PASSED] no-or-or-no
[01:33:21] [PASSED] missing-context-engine-class
[01:33:21] [PASSED] missing-context-engine-class-or-yes
[01:33:21] [PASSED] missing-context-engine-class-or-or-yes
[01:33:21] =============== [PASSED] xe_rtp_rules_tests ================
[01:33:21] =============== xe_rtp_process_to_sr_tests  ================
[01:33:21] [PASSED] coalesce-same-reg
[01:33:21] [PASSED] coalesce-same-reg-literal-and-func
[01:33:21] [PASSED] no-match-no-add
[01:33:21] [PASSED] two-regs-two-entries
[01:33:21] [PASSED] clr-one-set-other
[01:33:21] [PASSED] set-field
[01:33:21] [PASSED] conflict-duplicate
[01:33:21] [PASSED] conflict-not-disjoint
[01:33:21] [PASSED] conflict-not-disjoint-literal-and-func
[01:33:21] [PASSED] conflict-reg-type
[01:33:21] [PASSED] bad-mcr-reg-forced-to-regular
[01:33:21] [PASSED] bad-regular-reg-forced-to-mcr
[01:33:21] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[01:33:21] ================== xe_rtp_process_tests  ===================
[01:33:21] [PASSED] active1
[01:33:21] [PASSED] active2
[01:33:21] [PASSED] active-inactive
[01:33:21] [PASSED] inactive-active
[01:33:21] [PASSED] inactive-active-inactive
[01:33:21] [PASSED] inactive-inactive-inactive
[01:33:21] ============== [PASSED] xe_rtp_process_tests ===============
[01:33:21] ===================== [PASSED] xe_rtp ======================
[01:33:21] ==================== xe_wa (1 subtest) =====================
[01:33:21] ======================== xe_wa_gt  =========================
[01:33:21] [PASSED] TIGERLAKE B0
[01:33:21] [PASSED] DG1 A0
[01:33:21] [PASSED] DG1 B0
[01:33:21] [PASSED] ALDERLAKE_S A0
[01:33:21] [PASSED] ALDERLAKE_S B0
[01:33:21] [PASSED] ALDERLAKE_S C0
[01:33:21] [PASSED] ALDERLAKE_S D0
[01:33:21] [PASSED] ALDERLAKE_P A0
[01:33:21] [PASSED] ALDERLAKE_P B0
[01:33:21] [PASSED] ALDERLAKE_P C0
[01:33:21] [PASSED] ALDERLAKE_S RPLS D0
[01:33:21] [PASSED] ALDERLAKE_P RPLU E0
[01:33:21] [PASSED] DG2 G10 C0
[01:33:21] [PASSED] DG2 G11 B1
[01:33:21] [PASSED] DG2 G12 A1
[01:33:21] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[01:33:21] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[01:33:21] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[01:33:21] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[01:33:21] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[01:33:21] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[01:33:21] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[01:33:21] ==================== [PASSED] xe_wa_gt =====================
[01:33:21] ====================== [PASSED] xe_wa ======================
[01:33:21] ============================================================
[01:33:21] Testing complete. Ran 860 tests: passed: 831, skipped: 29
[01:33:21] Elapsed time: 42.254s total, 2.512s configuring, 38.976s building, 0.736s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[01:33:21] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:33:23] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[01:33:49] Starting KUnit Kernel (1/1)...
[01:33:49] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:33:49] ============ drm_test_pick_cmdline (2 subtests) ============
[01:33:49] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[01:33:49] =============== drm_test_pick_cmdline_named  ===============
[01:33:49] [PASSED] NTSC
[01:33:49] [PASSED] NTSC-J
[01:33:49] [PASSED] PAL
[01:33:49] [PASSED] PAL-M
[01:33:49] =========== [PASSED] drm_test_pick_cmdline_named ===========
[01:33:49] ============== [PASSED] drm_test_pick_cmdline ==============
[01:33:49] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[01:33:49] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[01:33:49] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[01:33:49] =========== drm_validate_clone_mode (2 subtests) ===========
[01:33:49] ============== drm_test_check_in_clone_mode  ===============
[01:33:49] [PASSED] in_clone_mode
[01:33:49] [PASSED] not_in_clone_mode
[01:33:49] ========== [PASSED] drm_test_check_in_clone_mode ===========
[01:33:49] =============== drm_test_check_valid_clones  ===============
[01:33:49] [PASSED] not_in_clone_mode
[01:33:49] [PASSED] valid_clone
[01:33:49] [PASSED] invalid_clone
[01:33:49] =========== [PASSED] drm_test_check_valid_clones ===========
[01:33:49] ============= [PASSED] drm_validate_clone_mode =============
[01:33:49] ============= drm_validate_modeset (1 subtest) =============
[01:33:49] [PASSED] drm_test_check_connector_changed_modeset
[01:33:49] ============== [PASSED] drm_validate_modeset ===============
[01:33:49] ====== drm_test_bridge_get_current_state (1 subtest) =======
[01:33:49] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[01:33:49] ======== [PASSED] drm_test_bridge_get_current_state ========
[01:33:49] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[01:33:49] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[01:33:49] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[01:33:49] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[01:33:49] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[01:33:49] ============== drm_bridge_alloc (2 subtests) ===============
[01:33:49] [PASSED] drm_test_drm_bridge_alloc_basic
[01:33:49] [PASSED] drm_test_drm_bridge_alloc_get_put
[01:33:49] ================ [PASSED] drm_bridge_alloc =================
[01:33:49] ============= drm_bridge_bus_fmt (5 subtests) ==============
[01:33:49] [PASSED] drm_test_bridge_rgb_yuv_rgb
[01:33:49] [PASSED] drm_test_bridge_must_convert_to_yuv444
[01:33:49] [PASSED] drm_test_bridge_hdmi_auto_rgb
[01:33:49] [PASSED] drm_test_bridge_auto_first
[01:33:49] [PASSED] drm_test_bridge_rgb_yuv_no_path
[01:33:49] =============== [PASSED] drm_bridge_bus_fmt ================
[01:33:49] ============= drm_cmdline_parser (40 subtests) =============
[01:33:49] [PASSED] drm_test_cmdline_force_d_only
[01:33:49] [PASSED] drm_test_cmdline_force_D_only_dvi
[01:33:49] [PASSED] drm_test_cmdline_force_D_only_hdmi
[01:33:49] [PASSED] drm_test_cmdline_force_D_only_not_digital
[01:33:49] [PASSED] drm_test_cmdline_force_e_only
[01:33:49] [PASSED] drm_test_cmdline_res
[01:33:49] [PASSED] drm_test_cmdline_res_vesa
[01:33:49] [PASSED] drm_test_cmdline_res_vesa_rblank
[01:33:49] [PASSED] drm_test_cmdline_res_rblank
[01:33:49] [PASSED] drm_test_cmdline_res_bpp
[01:33:49] [PASSED] drm_test_cmdline_res_refresh
[01:33:49] [PASSED] drm_test_cmdline_res_bpp_refresh
[01:33:49] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[01:33:49] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[01:33:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[01:33:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[01:33:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[01:33:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[01:33:49] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[01:33:49] [PASSED] drm_test_cmdline_res_margins_force_on
[01:33:49] [PASSED] drm_test_cmdline_res_vesa_margins
[01:33:49] [PASSED] drm_test_cmdline_name
[01:33:49] [PASSED] drm_test_cmdline_name_bpp
[01:33:49] [PASSED] drm_test_cmdline_name_option
[01:33:49] [PASSED] drm_test_cmdline_name_bpp_option
[01:33:49] [PASSED] drm_test_cmdline_rotate_0
[01:33:49] [PASSED] drm_test_cmdline_rotate_90
[01:33:49] [PASSED] drm_test_cmdline_rotate_180
[01:33:49] [PASSED] drm_test_cmdline_rotate_270
[01:33:49] [PASSED] drm_test_cmdline_hmirror
[01:33:49] [PASSED] drm_test_cmdline_vmirror
[01:33:49] [PASSED] drm_test_cmdline_margin_options
[01:33:49] [PASSED] drm_test_cmdline_multiple_options
[01:33:49] [PASSED] drm_test_cmdline_bpp_extra_and_option
[01:33:49] [PASSED] drm_test_cmdline_extra_and_option
[01:33:49] [PASSED] drm_test_cmdline_freestanding_options
[01:33:49] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[01:33:49] [PASSED] drm_test_cmdline_panel_orientation
[01:33:49] ================ drm_test_cmdline_invalid  =================
[01:33:49] [PASSED] margin_only
[01:33:49] [PASSED] interlace_only
[01:33:49] [PASSED] res_missing_x
[01:33:49] [PASSED] res_missing_y
[01:33:49] [PASSED] res_bad_y
[01:33:49] [PASSED] res_missing_y_bpp
[01:33:49] [PASSED] res_bad_bpp
[01:33:49] [PASSED] res_bad_refresh
[01:33:49] [PASSED] res_bpp_refresh_force_on_off
[01:33:49] [PASSED] res_invalid_mode
[01:33:49] [PASSED] res_bpp_wrong_place_mode
[01:33:49] [PASSED] name_bpp_refresh
[01:33:49] [PASSED] name_refresh
[01:33:49] [PASSED] name_refresh_wrong_mode
[01:33:49] [PASSED] name_refresh_invalid_mode
[01:33:49] [PASSED] rotate_multiple
[01:33:49] [PASSED] rotate_invalid_val
[01:33:49] [PASSED] rotate_truncated
[01:33:49] [PASSED] invalid_option
[01:33:49] [PASSED] invalid_tv_option
[01:33:49] [PASSED] truncated_tv_option
[01:33:49] ============ [PASSED] drm_test_cmdline_invalid =============
[01:33:49] =============== drm_test_cmdline_tv_options  ===============
[01:33:49] [PASSED] NTSC
[01:33:49] [PASSED] NTSC_443
[01:33:49] [PASSED] NTSC_J
[01:33:49] [PASSED] PAL
[01:33:49] [PASSED] PAL_M
[01:33:49] [PASSED] PAL_N
[01:33:49] [PASSED] SECAM
[01:33:49] [PASSED] MONO_525
[01:33:49] [PASSED] MONO_625
[01:33:49] =========== [PASSED] drm_test_cmdline_tv_options ===========
[01:33:49] =============== [PASSED] drm_cmdline_parser ================
[01:33:49] ========== drmm_connector_hdmi_init (20 subtests) ==========
[01:33:49] [PASSED] drm_test_connector_hdmi_init_valid
[01:33:49] [PASSED] drm_test_connector_hdmi_init_bpc_8
[01:33:49] [PASSED] drm_test_connector_hdmi_init_bpc_10
[01:33:49] [PASSED] drm_test_connector_hdmi_init_bpc_12
[01:33:49] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[01:33:49] [PASSED] drm_test_connector_hdmi_init_bpc_null
[01:33:49] [PASSED] drm_test_connector_hdmi_init_formats_empty
[01:33:49] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[01:33:49] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[01:33:49] [PASSED] supported_formats=0x9 yuv420_allowed=1
[01:33:49] [PASSED] supported_formats=0x9 yuv420_allowed=0
[01:33:49] [PASSED] supported_formats=0x5 yuv420_allowed=1
[01:33:49] [PASSED] supported_formats=0x5 yuv420_allowed=0
[01:33:49] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[01:33:49] [PASSED] drm_test_connector_hdmi_init_null_ddc
[01:33:49] [PASSED] drm_test_connector_hdmi_init_null_product
[01:33:49] [PASSED] drm_test_connector_hdmi_init_null_vendor
[01:33:49] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[01:33:49] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[01:33:49] [PASSED] drm_test_connector_hdmi_init_product_valid
[01:33:49] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[01:33:49] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[01:33:49] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[01:33:49] ========= drm_test_connector_hdmi_init_type_valid  =========
[01:33:49] [PASSED] HDMI-A
[01:33:49] [PASSED] HDMI-B
[01:33:49] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[01:33:49] ======== drm_test_connector_hdmi_init_type_invalid  ========
[01:33:49] [PASSED] Unknown
[01:33:49] [PASSED] VGA
[01:33:49] [PASSED] DVI-I
[01:33:49] [PASSED] DVI-D
[01:33:49] [PASSED] DVI-A
[01:33:49] [PASSED] Composite
[01:33:49] [PASSED] SVIDEO
[01:33:49] [PASSED] LVDS
[01:33:49] [PASSED] Component
[01:33:49] [PASSED] DIN
[01:33:49] [PASSED] DP
[01:33:49] [PASSED] TV
[01:33:49] [PASSED] eDP
[01:33:49] [PASSED] Virtual
[01:33:49] [PASSED] DSI
[01:33:49] [PASSED] DPI
[01:33:49] [PASSED] Writeback
[01:33:49] [PASSED] SPI
[01:33:49] [PASSED] USB
[01:33:49] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[01:33:49] ============ [PASSED] drmm_connector_hdmi_init =============
[01:33:49] ============= drmm_connector_init (3 subtests) =============
[01:33:49] [PASSED] drm_test_drmm_connector_init
[01:33:49] [PASSED] drm_test_drmm_connector_init_null_ddc
[01:33:49] ========= drm_test_drmm_connector_init_type_valid  =========
[01:33:49] [PASSED] Unknown
[01:33:49] [PASSED] VGA
[01:33:49] [PASSED] DVI-I
[01:33:49] [PASSED] DVI-D
[01:33:49] [PASSED] DVI-A
[01:33:49] [PASSED] Composite
[01:33:49] [PASSED] SVIDEO
[01:33:49] [PASSED] LVDS
[01:33:49] [PASSED] Component
[01:33:49] [PASSED] DIN
[01:33:49] [PASSED] DP
[01:33:49] [PASSED] HDMI-A
[01:33:49] [PASSED] HDMI-B
[01:33:49] [PASSED] TV
[01:33:49] [PASSED] eDP
[01:33:49] [PASSED] Virtual
[01:33:49] [PASSED] DSI
[01:33:49] [PASSED] DPI
[01:33:49] [PASSED] Writeback
[01:33:49] [PASSED] SPI
[01:33:49] [PASSED] USB
[01:33:49] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[01:33:49] =============== [PASSED] drmm_connector_init ===============
[01:33:49] ========= drm_connector_dynamic_init (6 subtests) ==========
[01:33:49] [PASSED] drm_test_drm_connector_dynamic_init
[01:33:49] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[01:33:49] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[01:33:49] [PASSED] drm_test_drm_connector_dynamic_init_properties
[01:33:49] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[01:33:49] [PASSED] Unknown
[01:33:49] [PASSED] VGA
[01:33:49] [PASSED] DVI-I
[01:33:49] [PASSED] DVI-D
[01:33:49] [PASSED] DVI-A
[01:33:49] [PASSED] Composite
[01:33:49] [PASSED] SVIDEO
[01:33:49] [PASSED] LVDS
[01:33:49] [PASSED] Component
[01:33:49] [PASSED] DIN
[01:33:49] [PASSED] DP
[01:33:49] [PASSED] HDMI-A
[01:33:49] [PASSED] HDMI-B
[01:33:49] [PASSED] TV
[01:33:49] [PASSED] eDP
[01:33:49] [PASSED] Virtual
[01:33:49] [PASSED] DSI
[01:33:49] [PASSED] DPI
[01:33:49] [PASSED] Writeback
[01:33:49] [PASSED] SPI
[01:33:49] [PASSED] USB
[01:33:49] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[01:33:49] ======== drm_test_drm_connector_dynamic_init_name  =========
[01:33:49] [PASSED] Unknown
[01:33:49] [PASSED] VGA
[01:33:49] [PASSED] DVI-I
[01:33:49] [PASSED] DVI-D
[01:33:49] [PASSED] DVI-A
[01:33:49] [PASSED] Composite
[01:33:49] [PASSED] SVIDEO
[01:33:49] [PASSED] LVDS
[01:33:49] [PASSED] Component
[01:33:49] [PASSED] DIN
[01:33:49] [PASSED] DP
[01:33:49] [PASSED] HDMI-A
[01:33:49] [PASSED] HDMI-B
[01:33:49] [PASSED] TV
[01:33:49] [PASSED] eDP
[01:33:49] [PASSED] Virtual
[01:33:49] [PASSED] DSI
[01:33:49] [PASSED] DPI
[01:33:49] [PASSED] Writeback
[01:33:49] [PASSED] SPI
[01:33:49] [PASSED] USB
[01:33:49] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[01:33:49] =========== [PASSED] drm_connector_dynamic_init ============
[01:33:49] ==== drm_connector_dynamic_register_early (4 subtests) =====
[01:33:49] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[01:33:49] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[01:33:49] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[01:33:49] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[01:33:49] ====== [PASSED] drm_connector_dynamic_register_early =======
[01:33:49] ======= drm_connector_dynamic_register (7 subtests) ========
[01:33:49] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[01:33:49] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[01:33:49] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[01:33:49] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[01:33:49] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[01:33:49] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[01:33:49] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[01:33:49] ========= [PASSED] drm_connector_dynamic_register ==========
[01:33:49] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[01:33:49] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[01:33:49] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[01:33:49] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[01:33:49] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[01:33:49] ========== drm_test_get_tv_mode_from_name_valid  ===========
[01:33:49] [PASSED] NTSC
[01:33:49] [PASSED] NTSC-443
[01:33:49] [PASSED] NTSC-J
[01:33:49] [PASSED] PAL
[01:33:49] [PASSED] PAL-M
[01:33:49] [PASSED] PAL-N
[01:33:49] [PASSED] SECAM
[01:33:49] [PASSED] Mono
[01:33:49] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[01:33:49] [PASSED] drm_test_get_tv_mode_from_name_truncated
[01:33:49] ============ [PASSED] drm_get_tv_mode_from_name ============
[01:33:49] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[01:33:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[01:33:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[01:33:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[01:33:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[01:33:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[01:33:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[01:33:49] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[01:33:49] [PASSED] VIC 96
[01:33:49] [PASSED] VIC 97
[01:33:49] [PASSED] VIC 101
[01:33:49] [PASSED] VIC 102
[01:33:49] [PASSED] VIC 106
[01:33:49] [PASSED] VIC 107
[01:33:49] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[01:33:49] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[01:33:49] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[01:33:49] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[01:33:49] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[01:33:49] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[01:33:49] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[01:33:49] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[01:33:49] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[01:33:49] [PASSED] Automatic
[01:33:49] [PASSED] Full
[01:33:49] [PASSED] Limited 16:235
[01:33:49] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[01:33:49] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[01:33:49] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[01:33:49] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[01:33:49] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[01:33:49] [PASSED] RGB
[01:33:49] [PASSED] YUV 4:2:0
[01:33:49] [PASSED] YUV 4:2:2
[01:33:49] [PASSED] YUV 4:4:4
[01:33:49] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[01:33:49] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[01:33:49] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[01:33:49] ============= drm_damage_helper (21 subtests) ==============
[01:33:49] [PASSED] drm_test_damage_iter_no_damage
[01:33:49] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[01:33:49] [PASSED] drm_test_damage_iter_no_damage_src_moved
[01:33:49] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[01:33:49] [PASSED] drm_test_damage_iter_no_damage_not_visible
[01:33:49] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[01:33:49] [PASSED] drm_test_damage_iter_no_damage_no_fb
[01:33:49] [PASSED] drm_test_damage_iter_simple_damage
[01:33:49] [PASSED] drm_test_damage_iter_single_damage
[01:33:49] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[01:33:49] [PASSED] drm_test_damage_iter_single_damage_outside_src
[01:33:49] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[01:33:49] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[01:33:49] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[01:33:49] [PASSED] drm_test_damage_iter_single_damage_src_moved
[01:33:49] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[01:33:49] [PASSED] drm_test_damage_iter_damage
[01:33:49] [PASSED] drm_test_damage_iter_damage_one_intersect
[01:33:49] [PASSED] drm_test_damage_iter_damage_one_outside
[01:33:49] [PASSED] drm_test_damage_iter_damage_src_moved
[01:33:49] [PASSED] drm_test_damage_iter_damage_not_visible
[01:33:49] ================ [PASSED] drm_damage_helper ================
[01:33:49] ============== drm_dp_mst_helper (3 subtests) ==============
[01:33:49] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[01:33:49] [PASSED] Clock 154000 BPP 30 DSC disabled
[01:33:49] [PASSED] Clock 234000 BPP 30 DSC disabled
[01:33:49] [PASSED] Clock 297000 BPP 24 DSC disabled
[01:33:49] [PASSED] Clock 332880 BPP 24 DSC enabled
[01:33:49] [PASSED] Clock 324540 BPP 24 DSC enabled
[01:33:49] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[01:33:49] ============== drm_test_dp_mst_calc_pbn_div  ===============
[01:33:49] [PASSED] Link rate 2000000 lane count 4
[01:33:49] [PASSED] Link rate 2000000 lane count 2
[01:33:49] [PASSED] Link rate 2000000 lane count 1
[01:33:49] [PASSED] Link rate 1350000 lane count 4
[01:33:49] [PASSED] Link rate 1350000 lane count 2
[01:33:49] [PASSED] Link rate 1350000 lane count 1
[01:33:49] [PASSED] Link rate 1000000 lane count 4
[01:33:49] [PASSED] Link rate 1000000 lane count 2
[01:33:49] [PASSED] Link rate 1000000 lane count 1
[01:33:49] [PASSED] Link rate 810000 lane count 4
[01:33:49] [PASSED] Link rate 810000 lane count 2
[01:33:49] [PASSED] Link rate 810000 lane count 1
[01:33:49] [PASSED] Link rate 540000 lane count 4
[01:33:49] [PASSED] Link rate 540000 lane count 2
[01:33:49] [PASSED] Link rate 540000 lane count 1
[01:33:49] [PASSED] Link rate 270000 lane count 4
[01:33:49] [PASSED] Link rate 270000 lane count 2
[01:33:49] [PASSED] Link rate 270000 lane count 1
[01:33:49] [PASSED] Link rate 162000 lane count 4
[01:33:49] [PASSED] Link rate 162000 lane count 2
[01:33:49] [PASSED] Link rate 162000 lane count 1
[01:33:49] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[01:33:49] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[01:33:49] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[01:33:49] [PASSED] DP_POWER_UP_PHY with port number
[01:33:49] [PASSED] DP_POWER_DOWN_PHY with port number
[01:33:49] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[01:33:49] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[01:33:49] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[01:33:49] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[01:33:49] [PASSED] DP_QUERY_PAYLOAD with port number
[01:33:49] [PASSED] DP_QUERY_PAYLOAD with VCPI
[01:33:49] [PASSED] DP_REMOTE_DPCD_READ with port number
[01:33:49] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[01:33:49] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[01:33:49] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[01:33:49] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[01:33:49] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[01:33:49] [PASSED] DP_REMOTE_I2C_READ with port number
[01:33:49] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[01:33:49] [PASSED] DP_REMOTE_I2C_READ with transactions array
[01:33:49] [PASSED] DP_REMOTE_I2C_WRITE with port number
[01:33:49] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[01:33:49] [PASSED] DP_REMOTE_I2C_WRITE with data array
[01:33:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[01:33:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[01:33:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[01:33:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[01:33:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[01:33:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[01:33:49] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[01:33:49] ================ [PASSED] drm_dp_mst_helper ================
[01:33:49] ================== drm_exec (7 subtests) ===================
[01:33:49] [PASSED] sanitycheck
[01:33:49] [PASSED] test_lock
[01:33:49] [PASSED] test_lock_unlock
[01:33:49] [PASSED] test_duplicates
[01:33:49] [PASSED] test_prepare
[01:33:49] [PASSED] test_prepare_array
[01:33:49] [PASSED] test_multiple_loops
[01:33:49] ==================== [PASSED] drm_exec =====================
[01:33:49] =========== drm_format_helper_test (17 subtests) ===========
[01:33:49] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[01:33:49] [PASSED] single_pixel_source_buffer
[01:33:49] [PASSED] single_pixel_clip_rectangle
[01:33:49] [PASSED] well_known_colors
[01:33:49] [PASSED] destination_pitch
[01:33:49] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[01:33:49] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[01:33:49] [PASSED] single_pixel_source_buffer
[01:33:49] [PASSED] single_pixel_clip_rectangle
[01:33:49] [PASSED] well_known_colors
[01:33:49] [PASSED] destination_pitch
[01:33:49] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[01:33:49] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[01:33:49] [PASSED] single_pixel_source_buffer
[01:33:49] [PASSED] single_pixel_clip_rectangle
[01:33:49] [PASSED] well_known_colors
[01:33:49] [PASSED] destination_pitch
[01:33:49] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[01:33:49] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[01:33:49] [PASSED] single_pixel_source_buffer
[01:33:49] [PASSED] single_pixel_clip_rectangle
[01:33:49] [PASSED] well_known_colors
[01:33:49] [PASSED] destination_pitch
[01:33:49] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[01:33:49] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[01:33:49] [PASSED] single_pixel_source_buffer
[01:33:49] [PASSED] single_pixel_clip_rectangle
[01:33:49] [PASSED] well_known_colors
[01:33:49] [PASSED] destination_pitch
[01:33:49] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[01:33:49] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[01:33:49] [PASSED] single_pixel_source_buffer
[01:33:49] [PASSED] single_pixel_clip_rectangle
[01:33:49] [PASSED] well_known_colors
[01:33:49] [PASSED] destination_pitch
[01:33:49] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[01:33:49] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[01:33:49] [PASSED] single_pixel_source_buffer
[01:33:49] [PASSED] single_pixel_clip_rectangle
[01:33:49] [PASSED] well_known_colors
[01:33:49] [PASSED] destination_pitch
[01:33:49] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[01:33:49] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[01:33:49] [PASSED] single_pixel_source_buffer
[01:33:49] [PASSED] single_pixel_clip_rectangle
[01:33:49] [PASSED] well_known_colors
[01:33:49] [PASSED] destination_pitch
[01:33:49] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[01:33:49] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[01:33:49] [PASSED] single_pixel_source_buffer
[01:33:49] [PASSED] single_pixel_clip_rectangle
[01:33:49] [PASSED] well_known_colors
[01:33:49] [PASSED] destination_pitch
[01:33:49] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[01:33:49] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[01:33:49] [PASSED] single_pixel_source_buffer
[01:33:49] [PASSED] single_pixel_clip_rectangle
[01:33:49] [PASSED] well_known_colors
[01:33:49] [PASSED] destination_pitch
[01:33:49] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[01:33:49] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[01:33:49] [PASSED] single_pixel_source_buffer
[01:33:49] [PASSED] single_pixel_clip_rectangle
[01:33:49] [PASSED] well_known_colors
[01:33:49] [PASSED] destination_pitch
[01:33:49] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[01:33:49] ============== drm_test_fb_xrgb8888_to_mono  ===============
[01:33:49] [PASSED] single_pixel_source_buffer
[01:33:49] [PASSED] single_pixel_clip_rectangle
[01:33:49] [PASSED] well_known_colors
[01:33:49] [PASSED] destination_pitch
[01:33:49] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[01:33:49] ==================== drm_test_fb_swab  =====================
[01:33:49] [PASSED] single_pixel_source_buffer
[01:33:49] [PASSED] single_pixel_clip_rectangle
[01:33:49] [PASSED] well_known_colors
[01:33:49] [PASSED] destination_pitch
[01:33:49] ================ [PASSED] drm_test_fb_swab =================
[01:33:49] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[01:33:49] [PASSED] single_pixel_source_buffer
[01:33:49] [PASSED] single_pixel_clip_rectangle
[01:33:49] [PASSED] well_known_colors
[01:33:49] [PASSED] destination_pitch
[01:33:49] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[01:33:49] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[01:33:49] [PASSED] single_pixel_source_buffer
[01:33:49] [PASSED] single_pixel_clip_rectangle
[01:33:49] [PASSED] well_known_colors
[01:33:49] [PASSED] destination_pitch
[01:33:49] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[01:33:49] ================= drm_test_fb_clip_offset  =================
[01:33:49] [PASSED] pass through
[01:33:49] [PASSED] horizontal offset
[01:33:49] [PASSED] vertical offset
[01:33:49] [PASSED] horizontal and vertical offset
[01:33:49] [PASSED] horizontal offset (custom pitch)
[01:33:49] [PASSED] vertical offset (custom pitch)
[01:33:49] [PASSED] horizontal and vertical offset (custom pitch)
[01:33:49] ============= [PASSED] drm_test_fb_clip_offset =============
[01:33:49] =================== drm_test_fb_memcpy  ====================
[01:33:49] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[01:33:49] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[01:33:49] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[01:33:49] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[01:33:49] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[01:33:49] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[01:33:49] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[01:33:49] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[01:33:49] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[01:33:49] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[01:33:49] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[01:33:49] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[01:33:49] =============== [PASSED] drm_test_fb_memcpy ================
[01:33:49] ============= [PASSED] drm_format_helper_test ==============
[01:33:49] ================= drm_format (18 subtests) =================
[01:33:49] [PASSED] drm_test_format_block_width_invalid
[01:33:49] [PASSED] drm_test_format_block_width_one_plane
[01:33:49] [PASSED] drm_test_format_block_width_two_plane
[01:33:49] [PASSED] drm_test_format_block_width_three_plane
[01:33:49] [PASSED] drm_test_format_block_width_tiled
[01:33:49] [PASSED] drm_test_format_block_height_invalid
[01:33:49] [PASSED] drm_test_format_block_height_one_plane
[01:33:49] [PASSED] drm_test_format_block_height_two_plane
[01:33:49] [PASSED] drm_test_format_block_height_three_plane
[01:33:49] [PASSED] drm_test_format_block_height_tiled
[01:33:49] [PASSED] drm_test_format_min_pitch_invalid
[01:33:49] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[01:33:49] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[01:33:49] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[01:33:49] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[01:33:49] [PASSED] drm_test_format_min_pitch_two_plane
[01:33:49] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[01:33:49] [PASSED] drm_test_format_min_pitch_tiled
[01:33:49] =================== [PASSED] drm_format ====================
[01:33:49] ============== drm_framebuffer (10 subtests) ===============
[01:33:49] ========== drm_test_framebuffer_check_src_coords  ==========
[01:33:49] [PASSED] Success: source fits into fb
[01:33:49] [PASSED] Fail: overflowing fb with x-axis coordinate
[01:33:49] [PASSED] Fail: overflowing fb with y-axis coordinate
[01:33:49] [PASSED] Fail: overflowing fb with source width
[01:33:49] [PASSED] Fail: overflowing fb with source height
[01:33:49] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[01:33:49] [PASSED] drm_test_framebuffer_cleanup
[01:33:49] =============== drm_test_framebuffer_create  ===============
[01:33:49] [PASSED] ABGR8888 normal sizes
[01:33:49] [PASSED] ABGR8888 max sizes
[01:33:49] [PASSED] ABGR8888 pitch greater than min required
[01:33:49] [PASSED] ABGR8888 pitch less than min required
[01:33:49] [PASSED] ABGR8888 Invalid width
[01:33:49] [PASSED] ABGR8888 Invalid buffer handle
[01:33:49] [PASSED] No pixel format
[01:33:49] [PASSED] ABGR8888 Width 0
[01:33:49] [PASSED] ABGR8888 Height 0
[01:33:49] [PASSED] ABGR8888 Out of bound height * pitch combination
[01:33:49] [PASSED] ABGR8888 Large buffer offset
[01:33:49] [PASSED] ABGR8888 Buffer offset for inexistent plane
[01:33:49] [PASSED] ABGR8888 Invalid flag
[01:33:49] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[01:33:49] [PASSED] ABGR8888 Valid buffer modifier
[01:33:49] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[01:33:49] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[01:33:49] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[01:33:49] [PASSED] NV12 Normal sizes
[01:33:49] [PASSED] NV12 Max sizes
[01:33:49] [PASSED] NV12 Invalid pitch
[01:33:49] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[01:33:49] [PASSED] NV12 different  modifier per-plane
[01:33:49] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[01:33:49] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[01:33:49] [PASSED] NV12 Modifier for inexistent plane
[01:33:49] [PASSED] NV12 Handle for inexistent plane
[01:33:49] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[01:33:49] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[01:33:49] [PASSED] YVU420 Normal sizes
[01:33:49] [PASSED] YVU420 Max sizes
[01:33:49] [PASSED] YVU420 Invalid pitch
[01:33:49] [PASSED] YVU420 Different pitches
[01:33:49] [PASSED] YVU420 Different buffer offsets/pitches
[01:33:49] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[01:33:49] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[01:33:49] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[01:33:49] [PASSED] YVU420 Valid modifier
[01:33:49] [PASSED] YVU420 Different modifiers per plane
[01:33:49] [PASSED] YVU420 Modifier for inexistent plane
[01:33:49] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[01:33:49] [PASSED] X0L2 Normal sizes
[01:33:49] [PASSED] X0L2 Max sizes
[01:33:49] [PASSED] X0L2 Invalid pitch
[01:33:49] [PASSED] X0L2 Pitch greater than minimum required
[01:33:49] [PASSED] X0L2 Handle for inexistent plane
[01:33:49] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[01:33:49] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[01:33:49] [PASSED] X0L2 Valid modifier
[01:33:49] [PASSED] X0L2 Modifier for inexistent plane
[01:33:49] =========== [PASSED] drm_test_framebuffer_create ===========
[01:33:49] [PASSED] drm_test_framebuffer_free
[01:33:49] [PASSED] drm_test_framebuffer_init
[01:33:49] [PASSED] drm_test_framebuffer_init_bad_format
[01:33:49] [PASSED] drm_test_framebuffer_init_dev_mismatch
[01:33:49] [PASSED] drm_test_framebuffer_lookup
[01:33:49] [PASSED] drm_test_framebuffer_lookup_inexistent
[01:33:49] [PASSED] drm_test_framebuffer_modifiers_not_supported
[01:33:49] ================= [PASSED] drm_framebuffer =================
[01:33:49] ================ drm_gem_shmem (8 subtests) ================
[01:33:49] [PASSED] drm_gem_shmem_test_obj_create
[01:33:49] [PASSED] drm_gem_shmem_test_obj_create_private
[01:33:49] [PASSED] drm_gem_shmem_test_pin_pages
[01:33:49] [PASSED] drm_gem_shmem_test_vmap
[01:33:49] [PASSED] drm_gem_shmem_test_get_sg_table
[01:33:49] [PASSED] drm_gem_shmem_test_get_pages_sgt
[01:33:49] [PASSED] drm_gem_shmem_test_madvise
[01:33:49] [PASSED] drm_gem_shmem_test_purge
[01:33:49] ================== [PASSED] drm_gem_shmem ==================
[01:33:49] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[01:33:49] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[01:33:49] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[01:33:49] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[01:33:49] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[01:33:49] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[01:33:49] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[01:33:49] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[01:33:49] [PASSED] Automatic
[01:33:49] [PASSED] Full
[01:33:49] [PASSED] Limited 16:235
[01:33:49] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[01:33:49] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[01:33:49] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[01:33:49] [PASSED] drm_test_check_disable_connector
[01:33:49] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[01:33:49] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[01:33:49] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[01:33:49] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[01:33:49] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[01:33:49] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[01:33:49] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[01:33:49] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[01:33:49] [PASSED] drm_test_check_output_bpc_dvi
[01:33:49] [PASSED] drm_test_check_output_bpc_format_vic_1
[01:33:49] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[01:33:49] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[01:33:49] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[01:33:49] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[01:33:49] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[01:33:49] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[01:33:49] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[01:33:49] ============ drm_test_check_hdmi_color_format  =============
[01:33:49] [PASSED] AUTO -> RGB
[01:33:49] [PASSED] YCBCR422 -> YUV422
[01:33:49] [PASSED] YCBCR420 -> YUV420
[01:33:49] [PASSED] YCBCR444 -> YUV444
[01:33:49] [PASSED] RGB -> RGB
[01:33:49] ======== [PASSED] drm_test_check_hdmi_color_format =========
[01:33:49] ======== drm_test_check_hdmi_color_format_420_only  ========
[01:33:49] [PASSED] RGB should fail
[01:33:49] [PASSED] YUV444 should fail
[01:33:49] [PASSED] YUV422 should fail
[01:33:49] [PASSED] YUV420 should work
[01:33:49] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[01:33:49] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[01:33:49] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[01:33:49] [PASSED] drm_test_check_broadcast_rgb_value
[01:33:49] [PASSED] drm_test_check_bpc_8_value
[01:33:49] [PASSED] drm_test_check_bpc_10_value
[01:33:49] [PASSED] drm_test_check_bpc_12_value
[01:33:49] [PASSED] drm_test_check_format_value
[01:33:49] [PASSED] drm_test_check_tmds_char_value
[01:33:49] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[01:33:49] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[01:33:49] [PASSED] drm_test_check_mode_valid
[01:33:49] [PASSED] drm_test_check_mode_valid_reject
[01:33:49] [PASSED] drm_test_check_mode_valid_reject_rate
[01:33:49] [PASSED] drm_test_check_mode_valid_reject_max_clock
[01:33:49] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[01:33:49] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[01:33:49] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[01:33:49] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[01:33:49] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[01:33:49] [PASSED] drm_test_check_infoframes
[01:33:49] [PASSED] drm_test_check_reject_avi_infoframe
[01:33:49] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[01:33:49] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[01:33:49] [PASSED] drm_test_check_reject_audio_infoframe
[01:33:49] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[01:33:49] ================= drm_managed (2 subtests) =================
[01:33:49] [PASSED] drm_test_managed_release_action
[01:33:49] [PASSED] drm_test_managed_run_action
[01:33:49] =================== [PASSED] drm_managed ===================
[01:33:49] =================== drm_mm (6 subtests) ====================
[01:33:49] [PASSED] drm_test_mm_init
[01:33:49] [PASSED] drm_test_mm_debug
[01:33:49] [PASSED] drm_test_mm_align32
[01:33:49] [PASSED] drm_test_mm_align64
[01:33:49] [PASSED] drm_test_mm_lowest
[01:33:49] [PASSED] drm_test_mm_highest
[01:33:49] ===================== [PASSED] drm_mm ======================
[01:33:49] ============= drm_modes_analog_tv (5 subtests) =============
[01:33:49] [PASSED] drm_test_modes_analog_tv_mono_576i
[01:33:49] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[01:33:49] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[01:33:49] [PASSED] drm_test_modes_analog_tv_pal_576i
[01:33:49] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[01:33:49] =============== [PASSED] drm_modes_analog_tv ===============
[01:33:49] ============== drm_panic_helper (3 subtests) ===============
[01:33:49] ============= drm_test_panic_screen_user_map  ==============
[01:33:49] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[01:33:49] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[01:33:49] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[01:33:49] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[01:33:49] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[01:33:49] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[01:33:49] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[01:33:49] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[01:33:49] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[01:33:49] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[01:33:49] ========= [PASSED] drm_test_panic_screen_user_map ==========
[01:33:49] ============= drm_test_panic_screen_user_page  =============
[01:33:49] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[01:33:49] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[01:33:49] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[01:33:49] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[01:33:49] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[01:33:49] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[01:33:49] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[01:33:49] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[01:33:49] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[01:33:49] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[01:33:49] ========= [PASSED] drm_test_panic_screen_user_page =========
[01:33:49] ========== drm_test_panic_screen_user_set_pixel  ===========
[01:33:49] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[01:33:49] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[01:33:49] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[01:33:49] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[01:33:49] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[01:33:49] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[01:33:49] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[01:33:49] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[01:33:49] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[01:33:49] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[01:33:49] ====== [PASSED] drm_test_panic_screen_user_set_pixel =======
[01:33:49] ================ [PASSED] drm_panic_helper =================
[01:33:49] ============== drm_plane_helper (2 subtests) ===============
[01:33:49] =============== drm_test_check_plane_state  ================
[01:33:49] [PASSED] clipping_simple
[01:33:49] [PASSED] clipping_rotate_reflect
[01:33:49] [PASSED] positioning_simple
[01:33:49] [PASSED] upscaling
[01:33:49] [PASSED] downscaling
[01:33:49] [PASSED] rounding1
[01:33:49] [PASSED] rounding2
[01:33:49] [PASSED] rounding3
[01:33:49] [PASSED] rounding4
[01:33:49] =========== [PASSED] drm_test_check_plane_state ============
[01:33:49] =========== drm_test_check_invalid_plane_state  ============
[01:33:49] [PASSED] positioning_invalid
[01:33:49] [PASSED] upscaling_invalid
[01:33:49] [PASSED] downscaling_invalid
[01:33:49] ======= [PASSED] drm_test_check_invalid_plane_state ========
[01:33:49] ================ [PASSED] drm_plane_helper =================
[01:33:49] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[01:33:49] ====== drm_test_connector_helper_tv_get_modes_check  =======
[01:33:49] [PASSED] None
[01:33:49] [PASSED] PAL
[01:33:49] [PASSED] NTSC
[01:33:49] [PASSED] Both, NTSC Default
[01:33:49] [PASSED] Both, PAL Default
[01:33:49] [PASSED] Both, NTSC Default, with PAL on command-line
[01:33:49] [PASSED] Both, PAL Default, with NTSC on command-line
[01:33:49] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[01:33:49] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[01:33:49] ================== drm_rect (9 subtests) ===================
[01:33:49] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[01:33:49] [PASSED] drm_test_rect_clip_scaled_not_clipped
[01:33:49] [PASSED] drm_test_rect_clip_scaled_clipped
[01:33:49] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[01:33:49] ================= drm_test_rect_intersect  =================
[01:33:49] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[01:33:49] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[01:33:49] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[01:33:49] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[01:33:49] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[01:33:49] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[01:33:49] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[01:33:49] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[01:33:49] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[01:33:49] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[01:33:49] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[01:33:49] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[01:33:49] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[01:33:49] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[01:33:49] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[01:33:49] ============= [PASSED] drm_test_rect_intersect =============
[01:33:49] ================ drm_test_rect_calc_hscale  ================
[01:33:49] [PASSED] normal use
[01:33:49] [PASSED] out of max range
[01:33:49] [PASSED] out of min range
[01:33:49] [PASSED] zero dst
[01:33:49] [PASSED] negative src
[01:33:49] [PASSED] negative dst
[01:33:49] ============ [PASSED] drm_test_rect_calc_hscale ============
[01:33:49] ================ drm_test_rect_calc_vscale  ================
[01:33:49] [PASSED] normal use
[01:33:49] [PASSED] out of max range
[01:33:49] [PASSED] out of min range
[01:33:49] [PASSED] zero dst
[01:33:49] [PASSED] negative src
[01:33:49] [PASSED] negative dst
[01:33:49] ============ [PASSED] drm_test_rect_calc_vscale ============
[01:33:49] ================== drm_test_rect_rotate  ===================
[01:33:49] [PASSED] reflect-x
[01:33:49] [PASSED] reflect-y
[01:33:49] [PASSED] rotate-0
[01:33:49] [PASSED] rotate-90
[01:33:49] [PASSED] rotate-180
[01:33:49] [PASSED] rotate-270
[01:33:49] ============== [PASSED] drm_test_rect_rotate ===============
[01:33:49] ================ drm_test_rect_rotate_inv  =================
[01:33:49] [PASSED] reflect-x
[01:33:49] [PASSED] reflect-y
[01:33:49] [PASSED] rotate-0
[01:33:49] [PASSED] rotate-90
[01:33:49] [PASSED] rotate-180
[01:33:49] [PASSED] rotate-270
[01:33:49] ============ [PASSED] drm_test_rect_rotate_inv =============
[01:33:49] ==================== [PASSED] drm_rect =====================
[01:33:49] ============ drm_sysfb_modeset_test (1 subtest) ============
[01:33:49] ============ drm_test_sysfb_build_fourcc_list  =============
[01:33:49] [PASSED] no native formats
[01:33:49] [PASSED] XRGB8888 as native format
[01:33:49] [PASSED] remove duplicates
[01:33:49] [PASSED] convert alpha formats
[01:33:49] [PASSED] random formats
[01:33:49] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[01:33:49] ============= [PASSED] drm_sysfb_modeset_test ==============
[01:33:49] ================== drm_fixp (2 subtests) ===================
[01:33:49] [PASSED] drm_test_int2fixp
[01:33:49] [PASSED] drm_test_sm2fixp
[01:33:49] ==================== [PASSED] drm_fixp =====================
[01:33:49] ============================================================
[01:33:49] Testing complete. Ran 667 tests: passed: 667
[01:33:49] Elapsed time: 28.401s total, 2.534s configuring, 25.401s building, 0.441s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[01:33:49] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:33:52] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[01:34:03] Starting KUnit Kernel (1/1)...
[01:34:03] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:34:03] ================= ttm_device (5 subtests) ==================
[01:34:03] [PASSED] ttm_device_init_basic
[01:34:03] [PASSED] ttm_device_init_multiple
[01:34:03] [PASSED] ttm_device_fini_basic
[01:34:03] [PASSED] ttm_device_init_no_vma_man
[01:34:03] ================== ttm_device_init_pools  ==================
[01:34:03] [PASSED] No DMA allocations, no DMA32 required
[01:34:03] [PASSED] DMA allocations, DMA32 required
[01:34:03] [PASSED] No DMA allocations, DMA32 required
[01:34:03] [PASSED] DMA allocations, no DMA32 required
[01:34:03] ============== [PASSED] ttm_device_init_pools ==============
[01:34:03] =================== [PASSED] ttm_device ====================
[01:34:03] ================== ttm_pool (8 subtests) ===================
[01:34:03] ================== ttm_pool_alloc_basic  ===================
[01:34:03] [PASSED] One page
[01:34:03] [PASSED] More than one page
[01:34:03] [PASSED] Above the allocation limit
[01:34:03] [PASSED] One page, with coherent DMA mappings enabled
[01:34:03] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[01:34:03] ============== [PASSED] ttm_pool_alloc_basic ===============
[01:34:03] ============== ttm_pool_alloc_basic_dma_addr  ==============
[01:34:03] [PASSED] One page
[01:34:03] [PASSED] More than one page
[01:34:03] [PASSED] Above the allocation limit
[01:34:03] [PASSED] One page, with coherent DMA mappings enabled
[01:34:03] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[01:34:03] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[01:34:03] [PASSED] ttm_pool_alloc_order_caching_match
[01:34:03] [PASSED] ttm_pool_alloc_caching_mismatch
[01:34:03] [PASSED] ttm_pool_alloc_order_mismatch
[01:34:03] [PASSED] ttm_pool_free_dma_alloc
[01:34:03] [PASSED] ttm_pool_free_no_dma_alloc
[01:34:03] [PASSED] ttm_pool_fini_basic
[01:34:03] ==================== [PASSED] ttm_pool =====================
[01:34:03] ================ ttm_resource (8 subtests) =================
[01:34:03] ================= ttm_resource_init_basic  =================
[01:34:03] [PASSED] Init resource in TTM_PL_SYSTEM
[01:34:03] [PASSED] Init resource in TTM_PL_VRAM
[01:34:03] [PASSED] Init resource in a private placement
[01:34:03] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[01:34:03] ============= [PASSED] ttm_resource_init_basic =============
[01:34:03] [PASSED] ttm_resource_init_pinned
[01:34:03] [PASSED] ttm_resource_fini_basic
[01:34:03] [PASSED] ttm_resource_manager_init_basic
[01:34:03] [PASSED] ttm_resource_manager_usage_basic
[01:34:03] [PASSED] ttm_resource_manager_set_used_basic
[01:34:03] [PASSED] ttm_sys_man_alloc_basic
[01:34:03] [PASSED] ttm_sys_man_free_basic
[01:34:03] ================== [PASSED] ttm_resource ===================
[01:34:03] =================== ttm_tt (15 subtests) ===================
[01:34:03] ==================== ttm_tt_init_basic  ====================
[01:34:03] [PASSED] Page-aligned size
[01:34:03] [PASSED] Extra pages requested
[01:34:03] ================ [PASSED] ttm_tt_init_basic ================
[01:34:03] [PASSED] ttm_tt_init_misaligned
[01:34:03] [PASSED] ttm_tt_fini_basic
[01:34:03] [PASSED] ttm_tt_fini_sg
[01:34:03] [PASSED] ttm_tt_fini_shmem
[01:34:03] [PASSED] ttm_tt_create_basic
[01:34:03] [PASSED] ttm_tt_create_invalid_bo_type
[01:34:03] [PASSED] ttm_tt_create_ttm_exists
[01:34:03] [PASSED] ttm_tt_create_failed
[01:34:03] [PASSED] ttm_tt_destroy_basic
[01:34:03] [PASSED] ttm_tt_populate_null_ttm
[01:34:03] [PASSED] ttm_tt_populate_populated_ttm
[01:34:03] [PASSED] ttm_tt_unpopulate_basic
[01:34:03] [PASSED] ttm_tt_unpopulate_empty_ttm
[01:34:03] [PASSED] ttm_tt_swapin_basic
[01:34:03] ===================== [PASSED] ttm_tt ======================
[01:34:03] =================== ttm_bo (14 subtests) ===================
[01:34:03] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[01:34:03] [PASSED] Cannot be interrupted and sleeps
[01:34:03] [PASSED] Cannot be interrupted, locks straight away
[01:34:03] [PASSED] Can be interrupted, sleeps
[01:34:03] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[01:34:03] [PASSED] ttm_bo_reserve_locked_no_sleep
[01:34:03] [PASSED] ttm_bo_reserve_no_wait_ticket
[01:34:03] [PASSED] ttm_bo_reserve_double_resv
[01:34:03] [PASSED] ttm_bo_reserve_interrupted
[01:34:03] [PASSED] ttm_bo_reserve_deadlock
[01:34:03] [PASSED] ttm_bo_unreserve_basic
[01:34:03] [PASSED] ttm_bo_unreserve_pinned
[01:34:03] [PASSED] ttm_bo_unreserve_bulk
[01:34:03] [PASSED] ttm_bo_fini_basic
[01:34:03] [PASSED] ttm_bo_fini_shared_resv
[01:34:03] [PASSED] ttm_bo_pin_basic
[01:34:03] [PASSED] ttm_bo_pin_unpin_resource
[01:34:03] [PASSED] ttm_bo_multiple_pin_one_unpin
[01:34:03] ===================== [PASSED] ttm_bo ======================
[01:34:03] ============== ttm_bo_validate (22 subtests) ===============
[01:34:03] ============== ttm_bo_init_reserved_sys_man  ===============
[01:34:03] [PASSED] Buffer object for userspace
[01:34:03] [PASSED] Kernel buffer object
[01:34:03] [PASSED] Shared buffer object
[01:34:03] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[01:34:03] ============== ttm_bo_init_reserved_mock_man  ==============
[01:34:03] [PASSED] Buffer object for userspace
[01:34:03] [PASSED] Kernel buffer object
[01:34:03] [PASSED] Shared buffer object
[01:34:03] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[01:34:03] [PASSED] ttm_bo_init_reserved_resv
[01:34:03] ================== ttm_bo_validate_basic  ==================
[01:34:03] [PASSED] Buffer object for userspace
[01:34:03] [PASSED] Kernel buffer object
[01:34:03] [PASSED] Shared buffer object
[01:34:03] ============== [PASSED] ttm_bo_validate_basic ==============
[01:34:03] [PASSED] ttm_bo_validate_invalid_placement
[01:34:03] ============= ttm_bo_validate_same_placement  ==============
[01:34:03] [PASSED] System manager
[01:34:03] [PASSED] VRAM manager
[01:34:03] ========= [PASSED] ttm_bo_validate_same_placement ==========
[01:34:03] [PASSED] ttm_bo_validate_failed_alloc
[01:34:03] [PASSED] ttm_bo_validate_pinned
[01:34:03] [PASSED] ttm_bo_validate_busy_placement
[01:34:03] ================ ttm_bo_validate_multihop  =================
[01:34:03] [PASSED] Buffer object for userspace
[01:34:03] [PASSED] Kernel buffer object
[01:34:03] [PASSED] Shared buffer object
[01:34:03] ============ [PASSED] ttm_bo_validate_multihop =============
[01:34:03] ========== ttm_bo_validate_no_placement_signaled  ==========
[01:34:03] [PASSED] Buffer object in system domain, no page vector
[01:34:03] [PASSED] Buffer object in system domain with an existing page vector
[01:34:03] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[01:34:03] ======== ttm_bo_validate_no_placement_not_signaled  ========
[01:34:03] [PASSED] Buffer object for userspace
[01:34:03] [PASSED] Kernel buffer object
[01:34:03] [PASSED] Shared buffer object
[01:34:03] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[01:34:03] [PASSED] ttm_bo_validate_move_fence_signaled
[01:34:03] ========= ttm_bo_validate_move_fence_not_signaled  =========
[01:34:03] [PASSED] Waits for GPU
[01:34:03] [PASSED] Tries to lock straight away
[01:34:03] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[01:34:03] [PASSED] ttm_bo_validate_swapout
[01:34:03] [PASSED] ttm_bo_validate_happy_evict
[01:34:03] [PASSED] ttm_bo_validate_all_pinned_evict
[01:34:03] [PASSED] ttm_bo_validate_allowed_only_evict
[01:34:03] [PASSED] ttm_bo_validate_deleted_evict
[01:34:03] [PASSED] ttm_bo_validate_busy_domain_evict
[01:34:03] [PASSED] ttm_bo_validate_evict_gutting
[01:34:03] [PASSED] ttm_bo_validate_recrusive_evict
[01:34:03] ================= [PASSED] ttm_bo_validate =================
[01:34:03] ============================================================
[01:34:03] Testing complete. Ran 102 tests: passed: 102
[01:34:03] Elapsed time: 13.400s total, 2.429s configuring, 10.756s building, 0.185s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/dma-buf/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[01:34:03] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:34:05] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[01:34:15] Starting KUnit Kernel (1/1)...
[01:34:15] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:34:15] =============== dma-buf-fence (12 subtests) ================
[01:34:15] [PASSED] test_sanitycheck
[01:34:15] [PASSED] test_signaling
[01:34:15] [PASSED] test_add_callback
[01:34:15] [PASSED] test_late_add_callback
[01:34:15] [PASSED] test_rm_callback
[01:34:15] [PASSED] test_late_rm_callback
[01:34:15] [PASSED] test_status
[01:34:15] [PASSED] test_error
[01:34:15] [PASSED] test_wait
[01:34:15] [PASSED] test_wait_timeout
[01:34:15] [PASSED] test_stub
[01:34:15] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[01:34:15] ================== [PASSED] dma-buf-fence ==================
[01:34:15] ============ dma-buf-fence-chain (11 subtests) =============
[01:34:15] [PASSED] test_sanitycheck
[01:34:15] [PASSED] test_find_seqno
[01:34:15] [PASSED] test_find_signaled
[01:34:15] [PASSED] test_find_out_of_order
[01:34:20] [PASSED] test_find_gap
[01:34:20] [PASSED] test_find_race
[01:34:20] [PASSED] test_signal_forward
[01:34:20] [PASSED] test_signal_backward
[01:34:20] [PASSED] test_wait_forward
[01:34:20] [PASSED] test_wait_backward
[01:34:20] [PASSED] test_wait_random
[01:34:20] =============== [PASSED] dma-buf-fence-chain ===============
[01:34:20] ============ dma-buf-fence-unwrap (11 subtests) ============
[01:34:20] [PASSED] test_sanitycheck
[01:34:20] [PASSED] test_unwrap_array
[01:34:20] [PASSED] test_unwrap_chain
[01:34:20] [PASSED] test_unwrap_chain_array
[01:34:20] [PASSED] test_unwrap_merge
[01:34:20] [PASSED] test_unwrap_merge_duplicate
[01:34:20] [PASSED] test_unwrap_merge_seqno
[01:34:20] [PASSED] test_unwrap_merge_order
[01:34:20] [PASSED] test_unwrap_merge_complex
[01:34:20] [PASSED] test_unwrap_merge_complex_seqno
[01:34:20] [PASSED] test_dedup_empty
[01:34:20] ============== [PASSED] dma-buf-fence-unwrap ===============
[01:34:20] ================ dma-buf-resv (5 subtests) =================
[01:34:20] [PASSED] test_sanitycheck
[01:34:20] ===================== test_signaling  ======================
[01:34:20] [PASSED] kernel
[01:34:20] [PASSED] write
[01:34:20] [PASSED] read
[01:34:20] [PASSED] bookkeep
[01:34:20] ================= [PASSED] test_signaling ==================
[01:34:20] ====================== test_for_each  ======================
[01:34:20] [PASSED] kernel
[01:34:20] [PASSED] write
[01:34:20] [PASSED] read
[01:34:20] [PASSED] bookkeep
[01:34:20] ================== [PASSED] test_for_each ==================
[01:34:20] ================= test_for_each_unlocked  ==================
[01:34:20] [PASSED] kernel
[01:34:20] [PASSED] write
[01:34:20] [PASSED] read
[01:34:20] [PASSED] bookkeep
[01:34:20] ============= [PASSED] test_for_each_unlocked ==============
[01:34:20] ===================== test_get_fences  =====================
[01:34:20] [PASSED] kernel
[01:34:20] [PASSED] write
[01:34:20] [PASSED] read
[01:34:20] [PASSED] bookkeep
[01:34:20] ================= [PASSED] test_get_fences =================
[01:34:20] ================== [PASSED] dma-buf-resv ===================
[01:34:20] ============================================================
[01:34:20] Testing complete. Ran 51 tests: passed: 50, skipped: 1
[01:34:20] Elapsed time: 17.127s total, 2.511s configuring, 9.294s building, 5.274s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


