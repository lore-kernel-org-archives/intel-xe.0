Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E79C606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 23:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C7210E4B4;
	Mon, 23 Nov 2026 23:43:53 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B68B10E4B4;
 Mon, 23 Nov 2026 23:43:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/ras=3A_core_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Nov 2026 23:43:52 -0000
Message-ID: <179547743248.72794.16169052832081498860@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261123233326.2882114-5-rodrigo.vivi@intel.com>
In-Reply-To: <20261123233326.2882114-5-rodrigo.vivi@intel.com>
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

Series: drm/ras: core fixes
URL   : https://patchwork.freedesktop.org/series/179415/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[23:41:57] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:42:02] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[23:42:23] Starting KUnit Kernel (1/1)...
[23:42:23] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:42:23] ================= gpu_buddy (15 subtests) ==================
[23:42:23] [PASSED] gpu_test_buddy_alloc_limit
[23:42:23] [PASSED] gpu_test_buddy_alloc_optimistic
[23:42:23] [PASSED] gpu_test_buddy_alloc_pessimistic
[23:42:23] [PASSED] gpu_test_buddy_alloc_pathological
[23:42:23] [PASSED] gpu_test_buddy_alloc_contiguous
[23:42:23] [PASSED] gpu_test_buddy_alloc_clear
[23:42:23] [PASSED] gpu_test_buddy_alloc_range
[23:42:23] [PASSED] gpu_test_buddy_alloc_range_bias
[23:42:23] [PASSED] gpu_test_buddy_alloc_range_clear_guard
[23:42:24] [PASSED] gpu_test_buddy_fragmentation_performance
[23:42:25] [PASSED] gpu_test_buddy_dirty_tracker_performance
[23:42:25] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[23:42:25] [PASSED] gpu_test_buddy_offset_aligned_allocation
[23:42:25] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[23:42:25] [PASSED] gpu_test_buddy_addr_to_block
[23:42:25] ==================== [PASSED] gpu_buddy ====================
[23:42:25] ============================================================
[23:42:25] Testing complete. Ran 15 tests: passed: 15
[23:42:25] Elapsed time: 27.808s total, 5.157s configuring, 20.633s building, 1.974s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[23:42:25] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:42:27] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[23:43:06] Starting KUnit Kernel (1/1)...
[23:43:06] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:43:06] ================= xe_ggtt_iov (9 subtests) =================
[23:43:06] [PASSED] init_shared_pf
[23:43:06] [PASSED] init_partial_overlap
[23:43:06] [PASSED] alloc_usable_pool_low
[23:43:06] [PASSED] alloc_shareable_pool_high
[23:43:06] [PASSED] alloc_partial_overlap
[23:43:06] [PASSED] alloc_partial_overlap_usable_full
[23:43:06] [PASSED] alloc_partial_overlap_shareable_full
[23:43:06] [PASSED] alloc_shareable_pool_unavailable
[23:43:06] [PASSED] alloc_shareable_pool_oversized
[23:43:06] =================== [PASSED] xe_ggtt_iov ===================
[23:43:06] =================== xe_ggtt (3 subtests) ===================
[23:43:06] [PASSED] init_native
[23:43:06] [PASSED] alloc_usable_pool_native
[23:43:06] [PASSED] alloc_usable_pool_oversized
[23:43:06] ===================== [PASSED] xe_ggtt =====================
[23:43:06] ================== guc_buf (11 subtests) ===================
[23:43:06] [PASSED] test_smallest
[23:43:06] [PASSED] test_largest
[23:43:06] [PASSED] test_granular
[23:43:06] [PASSED] test_unique
[23:43:06] [PASSED] test_overlap
[23:43:06] [PASSED] test_reusable
[23:43:06] [PASSED] test_too_big
[23:43:06] [PASSED] test_flush
[23:43:06] [PASSED] test_lookup
[23:43:06] [PASSED] test_data
[23:43:06] [PASSED] test_class
[23:43:06] ===================== [PASSED] guc_buf =====================
[23:43:06] =================== guc_dbm (7 subtests) ===================
[23:43:06] [PASSED] test_empty
[23:43:06] [PASSED] test_default
[23:43:06] ======================== test_size  ========================
[23:43:06] [PASSED] 4
[23:43:06] [PASSED] 8
[23:43:06] [PASSED] 32
[23:43:06] [PASSED] 256
[23:43:06] ==================== [PASSED] test_size ====================
[23:43:06] ======================= test_reuse  ========================
[23:43:06] [PASSED] 4
[23:43:06] [PASSED] 8
[23:43:06] [PASSED] 32
[23:43:06] [PASSED] 256
[23:43:06] =================== [PASSED] test_reuse ====================
[23:43:06] =================== test_range_overlap  ====================
[23:43:06] [PASSED] 4
[23:43:06] [PASSED] 8
[23:43:06] [PASSED] 32
[23:43:06] [PASSED] 256
[23:43:06] =============== [PASSED] test_range_overlap ================
[23:43:06] =================== test_range_compact  ====================
[23:43:06] [PASSED] 4
[23:43:06] [PASSED] 8
[23:43:06] [PASSED] 32
[23:43:06] [PASSED] 256
[23:43:06] =============== [PASSED] test_range_compact ================
[23:43:06] ==================== test_range_spare  =====================
[23:43:06] [PASSED] 4
[23:43:06] [PASSED] 8
[23:43:06] [PASSED] 32
[23:43:06] [PASSED] 256
[23:43:06] ================ [PASSED] test_range_spare =================
[23:43:06] ===================== [PASSED] guc_dbm =====================
[23:43:06] ================== guc_idm (22 subtests) ===================
[23:43:06] [PASSED] bad_init
[23:43:06] [PASSED] no_init
[23:43:06] [PASSED] init_fini
[23:43:06] [PASSED] check_init_small
[23:43:06] [PASSED] check_init_shared
[23:43:06] [PASSED] check_used
[23:43:06] [PASSED] check_quota
[23:43:06] [PASSED] check_all
[23:43:06] [PASSED] check_limits
[23:43:06] [PASSED] check_overlap
[23:43:06] [PASSED] check_overlap_alloc
[23:43:06] [PASSED] check_overlap_release
[23:43:06] [PASSED] check_overlap_partial_init
[23:43:06] [PASSED] check_overlap_partial_shared_range_blocking
[23:43:06] [PASSED] check_used_usable
[23:43:06] [PASSED] check_used_shareable
[23:43:06] [PASSED] check_used_mixed
[23:43:06] [PASSED] check_release_usable_range
[23:43:06] [PASSED] check_release_shareable_range
[23:43:06] [PASSED] check_split_boundaries
[23:43:06] [PASSED] check_shareable_spare
[23:43:06] [PASSED] check_shareable_spare_fragmented_tail
[23:43:06] ===================== [PASSED] guc_idm =====================
[23:43:06] ============== guc_klv_helpers (13 subtests) ===============
[23:43:06] [PASSED] test_count
[23:43:06] [PASSED] test_encode_u32
[23:43:06] [PASSED] test_encode_u64
[23:43:06] [PASSED] test_encode_string
[23:43:06] [PASSED] test_encode_object_raw
[23:43:06] [PASSED] test_encode_object_klv
[23:43:06] [PASSED] test_encode_object_nested
[23:43:06] [PASSED] test_encode_object_basic
[23:43:06] ===================== test_decode_u16  =====================
[23:43:06] [PASSED] empty
[23:43:06] [PASSED] valid
[23:43:06] [PASSED] max
[23:43:06] [PASSED] big
[23:43:06] [PASSED] long
[23:43:06] ================= [PASSED] test_decode_u16 =================
[23:43:06] ===================== test_decode_u32  =====================
[23:43:06] [PASSED] empty
[23:43:06] [PASSED] valid
[23:43:06] [PASSED] max
[23:43:06] [PASSED] long
[23:43:06] ================= [PASSED] test_decode_u32 =================
[23:43:06] ===================== test_decode_u64  =====================
[23:43:06] [PASSED] empty
[23:43:06] [PASSED] short
[23:43:06] [PASSED] valid
[23:43:06] [PASSED] max
[23:43:06] [PASSED] long
[23:43:06] ================= [PASSED] test_decode_u64 =================
[23:43:06] ===================== test_decode_str  =====================
[23:43:06] [PASSED] empty
[23:43:06] [PASSED] one
[23:43:06] [PASSED] one_trash
[23:43:06] [PASSED] two
[23:43:06] [PASSED] two_trash
[23:43:06] [PASSED] three
[23:43:06] [PASSED] dword
[23:43:06] [PASSED] four
[23:43:06] [PASSED] five
[23:43:06] [PASSED] six
[23:43:06] [PASSED] seven
[23:43:06] [PASSED] qword
[23:43:06] ================= [PASSED] test_decode_str =================
[23:43:06] [PASSED] test_print
[23:43:06] ================= [PASSED] guc_klv_helpers =================
[23:43:06] =================== xe_log (4 subtests) ====================
[23:43:06] [PASSED] demo_cper
[23:43:06] [PASSED] demo_dmesg
[23:43:06] ======================= test_dmesg  ========================
[23:43:06] [PASSED] test_fatal
[23:43:06] [PASSED] test_fatal_tile
[23:43:06] [PASSED] test_fatal_gt
[23:43:06] [PASSED] test_fatal_comp
[23:43:06] [PASSED] test_fatal_comp_tile
[23:43:06] [PASSED] test_fatal_comp_gt
[23:43:06] [PASSED] test_fatal_all
[23:43:06] [PASSED] test_recoverable
[23:43:06] [PASSED] test_recoverable_tile
[23:43:06] [PASSED] test_recoverable_gt
[23:43:06] [PASSED] test_recoverable_comp
[23:43:06] [PASSED] test_recoverable_comp_tile
[23:43:06] [PASSED] test_recoverable_comp_gt
[23:43:06] [PASSED] test_recoverable_all
[23:43:06] [PASSED] test_info
[23:43:06] [PASSED] test_info_tile
[23:43:06] [PASSED] test_info_gt
[23:43:06] [PASSED] test_info_err
[23:43:06] [PASSED] test_info_comp
[23:43:06] [PASSED] test_info_comp_tile
[23:43:06] [PASSED] test_info_comp_gt
[23:43:06] [PASSED] test_info_all
[23:43:06] [PASSED] test_hw_fatal
[23:43:06] [PASSED] test_hw_recoverable
[23:43:06] [PASSED] test_hw_corrected
[23:43:06] [PASSED] test_hw_informational
[23:43:06] =================== [PASSED] test_dmesg ====================
[23:43:06] ====================== test_invalid  =======================
[23:43:06] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[23:43:06] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[23:43:06] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[23:43:06] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[23:43:06] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[23:43:06] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[23:43:06] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[23:43:06] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[23:43:06] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[23:43:06] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[23:43:06] ================== [SKIPPED] test_invalid ==================
[23:43:06] ===================== [PASSED] xe_log ======================
[23:43:06] ================== no_relay (3 subtests) ===================
[23:43:06] [PASSED] xe_drops_guc2pf_if_not_ready
[23:43:06] [PASSED] xe_drops_guc2vf_if_not_ready
[23:43:06] [PASSED] xe_rejects_send_if_not_ready
[23:43:06] ==================== [PASSED] no_relay =====================
[23:43:06] ================== pf_relay (14 subtests) ==================
[23:43:06] [PASSED] pf_rejects_guc2pf_too_short
[23:43:06] [PASSED] pf_rejects_guc2pf_too_long
[23:43:06] [PASSED] pf_rejects_guc2pf_no_payload
[23:43:06] [PASSED] pf_fails_no_payload
[23:43:06] [PASSED] pf_fails_bad_origin
[23:43:06] [PASSED] pf_fails_bad_type
[23:43:06] [PASSED] pf_txn_reports_error
[23:43:06] [PASSED] pf_txn_sends_pf2guc
[23:43:06] [PASSED] pf_sends_pf2guc
[23:43:06] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[23:43:06] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[23:43:06] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[23:43:06] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[23:43:06] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[23:43:06] ==================== [PASSED] pf_relay =====================
[23:43:06] ================== vf_relay (3 subtests) ===================
[23:43:06] [PASSED] vf_rejects_guc2vf_too_short
[23:43:06] [PASSED] vf_rejects_guc2vf_too_long
[23:43:06] [PASSED] vf_rejects_guc2vf_no_payload
[23:43:06] ==================== [PASSED] vf_relay =====================
[23:43:06] ================ pf_gt_config (9 subtests) =================
[23:43:06] [PASSED] fair_contexts_1vf
[23:43:06] [PASSED] fair_doorbells_1vf
[23:43:06] [PASSED] fair_ggtt_1vf
[23:43:06] ====================== fair_vram_1vf  ======================
[23:43:06] [PASSED] 3.50 GiB
[23:43:06] [PASSED] 11.5 GiB
[23:43:06] [PASSED] 15.5 GiB
[23:43:06] [PASSED] 31.5 GiB
[23:43:06] [PASSED] 63.5 GiB
[23:43:06] [PASSED] 1.91 GiB
[23:43:06] ================== [PASSED] fair_vram_1vf ==================
[23:43:06] ================ fair_vram_1vf_admin_only  =================
[23:43:06] [PASSED] 3.50 GiB
[23:43:06] [PASSED] 11.5 GiB
[23:43:06] [PASSED] 15.5 GiB
[23:43:06] [PASSED] 31.5 GiB
[23:43:06] [PASSED] 63.5 GiB
[23:43:06] [PASSED] 1.91 GiB
[23:43:06] ============ [PASSED] fair_vram_1vf_admin_only =============
[23:43:06] ====================== fair_contexts  ======================
[23:43:06] [PASSED] 1 VF
[23:43:06] [PASSED] 2 VFs
[23:43:06] [PASSED] 3 VFs
[23:43:06] [PASSED] 4 VFs
[23:43:06] [PASSED] 5 VFs
[23:43:06] [PASSED] 6 VFs
[23:43:06] [PASSED] 7 VFs
[23:43:06] [PASSED] 8 VFs
[23:43:06] [PASSED] 9 VFs
[23:43:06] [PASSED] 10 VFs
[23:43:06] [PASSED] 11 VFs
[23:43:06] [PASSED] 12 VFs
[23:43:06] [PASSED] 13 VFs
[23:43:06] [PASSED] 14 VFs
[23:43:06] [PASSED] 15 VFs
[23:43:06] [PASSED] 16 VFs
[23:43:06] [PASSED] 17 VFs
[23:43:06] [PASSED] 18 VFs
[23:43:06] [PASSED] 19 VFs
[23:43:06] [PASSED] 20 VFs
[23:43:06] [PASSED] 21 VFs
[23:43:06] [PASSED] 22 VFs
[23:43:06] [PASSED] 23 VFs
[23:43:06] [PASSED] 24 VFs
[23:43:06] [PASSED] 25 VFs
[23:43:06] [PASSED] 26 VFs
[23:43:06] [PASSED] 27 VFs
[23:43:06] [PASSED] 28 VFs
[23:43:06] [PASSED] 29 VFs
[23:43:06] [PASSED] 30 VFs
[23:43:06] [PASSED] 31 VFs
[23:43:06] [PASSED] 32 VFs
[23:43:06] [PASSED] 33 VFs
[23:43:06] [PASSED] 34 VFs
[23:43:06] [PASSED] 35 VFs
[23:43:06] [PASSED] 36 VFs
[23:43:06] [PASSED] 37 VFs
[23:43:06] [PASSED] 38 VFs
[23:43:06] [PASSED] 39 VFs
[23:43:06] [PASSED] 40 VFs
[23:43:06] [PASSED] 41 VFs
[23:43:06] [PASSED] 42 VFs
[23:43:06] [PASSED] 43 VFs
[23:43:06] [PASSED] 44 VFs
[23:43:06] [PASSED] 45 VFs
[23:43:06] [PASSED] 46 VFs
[23:43:06] [PASSED] 47 VFs
[23:43:06] [PASSED] 48 VFs
[23:43:06] [PASSED] 49 VFs
[23:43:06] [PASSED] 50 VFs
[23:43:06] [PASSED] 51 VFs
[23:43:06] [PASSED] 52 VFs
[23:43:06] [PASSED] 53 VFs
[23:43:06] [PASSED] 54 VFs
[23:43:06] [PASSED] 55 VFs
[23:43:06] [PASSED] 56 VFs
[23:43:06] [PASSED] 57 VFs
[23:43:06] [PASSED] 58 VFs
[23:43:06] [PASSED] 59 VFs
[23:43:06] [PASSED] 60 VFs
[23:43:06] [PASSED] 61 VFs
[23:43:06] [PASSED] 62 VFs
[23:43:06] [PASSED] 63 VFs
[23:43:06] ================== [PASSED] fair_contexts ==================
[23:43:06] ===================== fair_doorbells  ======================
[23:43:06] [PASSED] 1 VF
[23:43:06] [PASSED] 2 VFs
[23:43:06] [PASSED] 3 VFs
[23:43:06] [PASSED] 4 VFs
[23:43:06] [PASSED] 5 VFs
[23:43:06] [PASSED] 6 VFs
[23:43:06] [PASSED] 7 VFs
[23:43:06] [PASSED] 8 VFs
[23:43:06] [PASSED] 9 VFs
[23:43:06] [PASSED] 10 VFs
[23:43:06] [PASSED] 11 VFs
[23:43:06] [PASSED] 12 VFs
[23:43:06] [PASSED] 13 VFs
[23:43:06] [PASSED] 14 VFs
[23:43:06] [PASSED] 15 VFs
[23:43:06] [PASSED] 16 VFs
[23:43:06] [PASSED] 17 VFs
[23:43:06] [PASSED] 18 VFs
[23:43:06] [PASSED] 19 VFs
[23:43:06] [PASSED] 20 VFs
[23:43:06] [PASSED] 21 VFs
[23:43:06] [PASSED] 22 VFs
[23:43:06] [PASSED] 23 VFs
[23:43:06] [PASSED] 24 VFs
[23:43:06] [PASSED] 25 VFs
[23:43:06] [PASSED] 26 VFs
[23:43:06] [PASSED] 27 VFs
[23:43:06] [PASSED] 28 VFs
[23:43:06] [PASSED] 29 VFs
[23:43:06] [PASSED] 30 VFs
[23:43:06] [PASSED] 31 VFs
[23:43:06] [PASSED] 32 VFs
[23:43:06] [PASSED] 33 VFs
[23:43:06] [PASSED] 34 VFs
[23:43:06] [PASSED] 35 VFs
[23:43:06] [PASSED] 36 VFs
[23:43:06] [PASSED] 37 VFs
[23:43:06] [PASSED] 38 VFs
[23:43:06] [PASSED] 39 VFs
[23:43:06] [PASSED] 40 VFs
[23:43:06] [PASSED] 41 VFs
[23:43:06] [PASSED] 42 VFs
[23:43:06] [PASSED] 43 VFs
[23:43:06] [PASSED] 44 VFs
[23:43:06] [PASSED] 45 VFs
[23:43:06] [PASSED] 46 VFs
[23:43:06] [PASSED] 47 VFs
[23:43:06] [PASSED] 48 VFs
[23:43:06] [PASSED] 49 VFs
[23:43:06] [PASSED] 50 VFs
[23:43:06] [PASSED] 51 VFs
[23:43:06] [PASSED] 52 VFs
[23:43:06] [PASSED] 53 VFs
[23:43:06] [PASSED] 54 VFs
[23:43:06] [PASSED] 55 VFs
[23:43:06] [PASSED] 56 VFs
[23:43:06] [PASSED] 57 VFs
[23:43:06] [PASSED] 58 VFs
[23:43:06] [PASSED] 59 VFs
[23:43:06] [PASSED] 60 VFs
[23:43:06] [PASSED] 61 VFs
[23:43:06] [PASSED] 62 VFs
[23:43:06] [PASSED] 63 VFs
[23:43:06] ================= [PASSED] fair_doorbells ==================
[23:43:06] ======================== fair_ggtt  ========================
[23:43:06] [PASSED] 1 VF
[23:43:06] [PASSED] 2 VFs
[23:43:06] [PASSED] 3 VFs
[23:43:06] [PASSED] 4 VFs
[23:43:06] [PASSED] 5 VFs
[23:43:06] [PASSED] 6 VFs
[23:43:06] [PASSED] 7 VFs
[23:43:06] [PASSED] 8 VFs
[23:43:06] [PASSED] 9 VFs
[23:43:06] [PASSED] 10 VFs
[23:43:06] [PASSED] 11 VFs
[23:43:06] [PASSED] 12 VFs
[23:43:06] [PASSED] 13 VFs
[23:43:06] [PASSED] 14 VFs
[23:43:06] [PASSED] 15 VFs
[23:43:06] [PASSED] 16 VFs
[23:43:06] [PASSED] 17 VFs
[23:43:06] [PASSED] 18 VFs
[23:43:06] [PASSED] 19 VFs
[23:43:06] [PASSED] 20 VFs
[23:43:06] [PASSED] 21 VFs
[23:43:06] [PASSED] 22 VFs
[23:43:06] [PASSED] 23 VFs
[23:43:06] [PASSED] 24 VFs
[23:43:06] [PASSED] 25 VFs
[23:43:06] [PASSED] 26 VFs
[23:43:06] [PASSED] 27 VFs
[23:43:06] [PASSED] 28 VFs
[23:43:06] [PASSED] 29 VFs
[23:43:06] [PASSED] 30 VFs
[23:43:06] [PASSED] 31 VFs
[23:43:06] [PASSED] 32 VFs
[23:43:06] [PASSED] 33 VFs
[23:43:06] [PASSED] 34 VFs
[23:43:06] [PASSED] 35 VFs
[23:43:06] [PASSED] 36 VFs
[23:43:06] [PASSED] 37 VFs
[23:43:06] [PASSED] 38 VFs
[23:43:06] [PASSED] 39 VFs
[23:43:06] [PASSED] 40 VFs
[23:43:06] [PASSED] 41 VFs
[23:43:06] [PASSED] 42 VFs
[23:43:06] [PASSED] 43 VFs
[23:43:06] [PASSED] 44 VFs
[23:43:06] [PASSED] 45 VFs
[23:43:06] [PASSED] 46 VFs
[23:43:06] [PASSED] 47 VFs
[23:43:06] [PASSED] 48 VFs
[23:43:06] [PASSED] 49 VFs
[23:43:06] [PASSED] 50 VFs
[23:43:06] [PASSED] 51 VFs
[23:43:06] [PASSED] 52 VFs
[23:43:06] [PASSED] 53 VFs
[23:43:06] [PASSED] 54 VFs
[23:43:06] [PASSED] 55 VFs
[23:43:06] [PASSED] 56 VFs
[23:43:06] [PASSED] 57 VFs
[23:43:06] [PASSED] 58 VFs
[23:43:06] [PASSED] 59 VFs
[23:43:06] [PASSED] 60 VFs
[23:43:06] [PASSED] 61 VFs
[23:43:06] [PASSED] 62 VFs
[23:43:06] [PASSED] 63 VFs
[23:43:06] ==================== [PASSED] fair_ggtt ====================
[23:43:06] ======================== fair_vram  ========================
[23:43:06] [PASSED] 1 VF
[23:43:06] [PASSED] 2 VFs
[23:43:06] [PASSED] 3 VFs
[23:43:06] [PASSED] 4 VFs
[23:43:06] [PASSED] 5 VFs
[23:43:06] [PASSED] 6 VFs
[23:43:06] [PASSED] 7 VFs
[23:43:06] [PASSED] 8 VFs
[23:43:06] [PASSED] 9 VFs
[23:43:06] [PASSED] 10 VFs
[23:43:06] [PASSED] 11 VFs
[23:43:06] [PASSED] 12 VFs
[23:43:06] [PASSED] 13 VFs
[23:43:06] [PASSED] 14 VFs
[23:43:06] [PASSED] 15 VFs
[23:43:06] [PASSED] 16 VFs
[23:43:06] [PASSED] 17 VFs
[23:43:06] [PASSED] 18 VFs
[23:43:06] [PASSED] 19 VFs
[23:43:06] [PASSED] 20 VFs
[23:43:06] [PASSED] 21 VFs
[23:43:06] [PASSED] 22 VFs
[23:43:06] [PASSED] 23 VFs
[23:43:06] [PASSED] 24 VFs
[23:43:06] [PASSED] 25 VFs
[23:43:06] [PASSED] 26 VFs
[23:43:06] [PASSED] 27 VFs
[23:43:06] [PASSED] 28 VFs
[23:43:06] [PASSED] 29 VFs
[23:43:06] [PASSED] 30 VFs
[23:43:06] [PASSED] 31 VFs
[23:43:06] [PASSED] 32 VFs
[23:43:06] [PASSED] 33 VFs
[23:43:06] [PASSED] 34 VFs
[23:43:06] [PASSED] 35 VFs
[23:43:06] [PASSED] 36 VFs
[23:43:06] [PASSED] 37 VFs
[23:43:06] [PASSED] 38 VFs
[23:43:06] [PASSED] 39 VFs
[23:43:06] [PASSED] 40 VFs
[23:43:06] [PASSED] 41 VFs
[23:43:06] [PASSED] 42 VFs
[23:43:06] [PASSED] 43 VFs
[23:43:06] [PASSED] 44 VFs
[23:43:06] [PASSED] 45 VFs
[23:43:06] [PASSED] 46 VFs
[23:43:06] [PASSED] 47 VFs
[23:43:06] [PASSED] 48 VFs
[23:43:06] [PASSED] 49 VFs
[23:43:06] [PASSED] 50 VFs
[23:43:06] [PASSED] 51 VFs
[23:43:06] [PASSED] 52 VFs
[23:43:06] [PASSED] 53 VFs
[23:43:07] [PASSED] 54 VFs
[23:43:07] [PASSED] 55 VFs
[23:43:07] [PASSED] 56 VFs
[23:43:07] [PASSED] 57 VFs
[23:43:07] [PASSED] 58 VFs
[23:43:07] [PASSED] 59 VFs
[23:43:07] [PASSED] 60 VFs
[23:43:07] [PASSED] 61 VFs
[23:43:07] [PASSED] 62 VFs
[23:43:07] [PASSED] 63 VFs
[23:43:07] ==================== [PASSED] fair_vram ====================
[23:43:07] ================== [PASSED] pf_gt_config ===================
[23:43:07] ===================== lmtt (1 subtest) =====================
[23:43:07] ======================== test_ops  =========================
[23:43:07] [PASSED] 2-level
[23:43:07] [PASSED] multi-level
[23:43:07] ==================== [PASSED] test_ops =====================
[23:43:07] ====================== [PASSED] lmtt =======================
[23:43:07] ================= sriov_packet (1 subtest) =================
[23:43:07] [PASSED] test_descriptor_init
[23:43:07] ================== [PASSED] sriov_packet ===================
[23:43:07] ================= pf_service (11 subtests) =================
[23:43:07] [PASSED] pf_negotiate_any
[23:43:07] [PASSED] pf_negotiate_base_match
[23:43:07] [PASSED] pf_negotiate_base_newer
[23:43:07] [PASSED] pf_negotiate_base_next
[23:43:07] [SKIPPED] pf_negotiate_base_older (no older minor)
[23:43:07] [PASSED] pf_negotiate_base_prev
[23:43:07] [PASSED] pf_negotiate_latest_match
[23:43:07] [PASSED] pf_negotiate_latest_newer
[23:43:07] [PASSED] pf_negotiate_latest_next
[23:43:07] [SKIPPED] pf_negotiate_latest_older (no older minor)
[23:43:07] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[23:43:07] =================== [PASSED] pf_service ====================
[23:43:07] ================= xe_guc_g2g (2 subtests) ==================
[23:43:07] ============== xe_live_guc_g2g_kunit_default  ==============
[23:43:07] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[23:43:07] ============== xe_live_guc_g2g_kunit_allmem  ===============
[23:43:07] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[23:43:07] =================== [SKIPPED] xe_guc_g2g ===================
[23:43:07] =================== xe_mocs (2 subtests) ===================
[23:43:07] ================ xe_live_mocs_kernel_kunit  ================
[23:43:07] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[23:43:07] ================ xe_live_mocs_reset_kunit  =================
[23:43:07] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[23:43:07] ==================== [SKIPPED] xe_mocs =====================
[23:43:07] ================= xe_migrate (3 subtests) ==================
[23:43:07] ================= xe_migrate_sanity_kunit  =================
[23:43:07] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[23:43:07] ================== xe_validate_ccs_kunit  ==================
[23:43:07] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[23:43:07] ============= xe_migrate_access_memory_kunit  ==============
[23:43:07] ========= [SKIPPED] xe_migrate_access_memory_kunit =========
[23:43:07] =================== [SKIPPED] xe_migrate ===================
[23:43:07] ================== xe_dma_buf (1 subtest) ==================
[23:43:07] ==================== xe_dma_buf_kunit  =====================
[23:43:07] ================ [SKIPPED] xe_dma_buf_kunit ================
[23:43:07] =================== [SKIPPED] xe_dma_buf ===================
[23:43:07] ================= xe_bo_shrink (1 subtest) =================
[23:43:07] =================== xe_bo_shrink_kunit  ====================
[23:43:07] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[23:43:07] ================== [SKIPPED] xe_bo_shrink ==================
[23:43:07] ==================== xe_bo (2 subtests) ====================
[23:43:07] ================== xe_ccs_migrate_kunit  ===================
[23:43:07] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[23:43:07] ==================== xe_bo_evict_kunit  ====================
[23:43:07] =============== [SKIPPED] xe_bo_evict_kunit ================
[23:43:07] ===================== [SKIPPED] xe_bo ======================
[23:43:07] =================== xe_any (9 subtests) ====================
[23:43:07] [PASSED] test_to_xe
[23:43:07] [PASSED] test_to_dev
[23:43:07] [PASSED] test_to_pdev
[23:43:07] [PASSED] test_to_drm
[23:43:07] [PASSED] test_if_pdev
[23:43:07] [PASSED] test_if_xe
[23:43:07] [PASSED] test_if_tile
[23:43:07] [PASSED] test_if_gt
[23:43:07] [PASSED] test_to_id
[23:43:07] ===================== [PASSED] xe_any ======================
[23:43:07] ==================== args (13 subtests) ====================
[23:43:07] [PASSED] count_args_test
[23:43:07] [PASSED] call_args_example
[23:43:07] [PASSED] call_args_test
[23:43:07] [PASSED] drop_first_arg_example
[23:43:07] [PASSED] drop_first_arg_test
[23:43:07] [PASSED] first_arg_example
[23:43:07] [PASSED] first_arg_test
[23:43:07] [PASSED] last_arg_example
[23:43:07] [PASSED] last_arg_test
[23:43:07] [PASSED] pick_arg_example
[23:43:07] [PASSED] if_args_example
[23:43:07] [PASSED] if_args_test
[23:43:07] [PASSED] sep_comma_example
[23:43:07] ====================== [PASSED] args =======================
[23:43:07] =================== xe_pci (3 subtests) ====================
[23:43:07] ==================== check_graphics_ip  ====================
[23:43:07] [PASSED] 12.00 Xe_LP
[23:43:07] [PASSED] 12.10 Xe_LP+
[23:43:07] [PASSED] 12.55 Xe_HPG
[23:43:07] [PASSED] 12.60 Xe_HPC
[23:43:07] [PASSED] 12.70 Xe_LPG
[23:43:07] [PASSED] 12.71 Xe_LPG
[23:43:07] [PASSED] 12.74 Xe_LPG+
[23:43:07] [PASSED] 20.01 Xe2_HPG
[23:43:07] [PASSED] 20.02 Xe2_HPG
[23:43:07] [PASSED] 20.04 Xe2_LPG
[23:43:07] [PASSED] 30.00 Xe3_LPG
[23:43:07] [PASSED] 30.01 Xe3_LPG
[23:43:07] [PASSED] 30.03 Xe3_LPG
[23:43:07] [PASSED] 30.04 Xe3_LPG
[23:43:07] [PASSED] 30.05 Xe3_LPG
[23:43:07] [PASSED] 35.10 Xe3p_LPG
[23:43:07] [PASSED] 35.11 Xe3p_XPC
[23:43:07] ================ [PASSED] check_graphics_ip ================
[23:43:07] ===================== check_media_ip  ======================
[23:43:07] [PASSED] 12.00 Xe_M
[23:43:07] [PASSED] 12.55 Xe_HPM
[23:43:07] [PASSED] 13.00 Xe_LPM+
[23:43:07] [PASSED] 13.01 Xe2_HPM
[23:43:07] [PASSED] 20.00 Xe2_LPM
[23:43:07] [PASSED] 30.00 Xe3_LPM
[23:43:07] [PASSED] 30.02 Xe3_LPM
[23:43:07] [PASSED] 35.00 Xe3p_LPM
[23:43:07] [PASSED] 35.03 Xe3p_HPM
[23:43:07] ================= [PASSED] check_media_ip ==================
[23:43:07] =================== check_platform_desc  ===================
[23:43:07] [PASSED] 0x9A60 (TIGERLAKE)
[23:43:07] [PASSED] 0x9A68 (TIGERLAKE)
[23:43:07] [PASSED] 0x9A70 (TIGERLAKE)
[23:43:07] [PASSED] 0x9A40 (TIGERLAKE)
[23:43:07] [PASSED] 0x9A49 (TIGERLAKE)
[23:43:07] [PASSED] 0x9A59 (TIGERLAKE)
[23:43:07] [PASSED] 0x9A78 (TIGERLAKE)
[23:43:07] [PASSED] 0x9AC0 (TIGERLAKE)
[23:43:07] [PASSED] 0x9AC9 (TIGERLAKE)
[23:43:07] [PASSED] 0x9AD9 (TIGERLAKE)
[23:43:07] [PASSED] 0x9AF8 (TIGERLAKE)
[23:43:07] [PASSED] 0x4C80 (ROCKETLAKE)
[23:43:07] [PASSED] 0x4C8A (ROCKETLAKE)
[23:43:07] [PASSED] 0x4C8B (ROCKETLAKE)
[23:43:07] [PASSED] 0x4C8C (ROCKETLAKE)
[23:43:07] [PASSED] 0x4C90 (ROCKETLAKE)
[23:43:07] [PASSED] 0x4C9A (ROCKETLAKE)
[23:43:07] [PASSED] 0x4680 (ALDERLAKE_S)
[23:43:07] [PASSED] 0x4682 (ALDERLAKE_S)
[23:43:07] [PASSED] 0x4688 (ALDERLAKE_S)
[23:43:07] [PASSED] 0x468A (ALDERLAKE_S)
[23:43:07] [PASSED] 0x468B (ALDERLAKE_S)
[23:43:07] [PASSED] 0x4690 (ALDERLAKE_S)
[23:43:07] [PASSED] 0x4692 (ALDERLAKE_S)
[23:43:07] [PASSED] 0x4693 (ALDERLAKE_S)
[23:43:07] [PASSED] 0x46A0 (ALDERLAKE_P)
[23:43:07] [PASSED] 0x46A1 (ALDERLAKE_P)
[23:43:07] [PASSED] 0x46A2 (ALDERLAKE_P)
[23:43:07] [PASSED] 0x46A3 (ALDERLAKE_P)
[23:43:07] [PASSED] 0x46A6 (ALDERLAKE_P)
[23:43:07] [PASSED] 0x46A8 (ALDERLAKE_P)
[23:43:07] [PASSED] 0x46AA (ALDERLAKE_P)
[23:43:07] [PASSED] 0x462A (ALDERLAKE_P)
[23:43:07] [PASSED] 0x4626 (ALDERLAKE_P)
[23:43:07] [PASSED] 0x4628 (ALDERLAKE_P)
[23:43:07] [PASSED] 0x46B0 (ALDERLAKE_P)
[23:43:07] [PASSED] 0x46B1 (ALDERLAKE_P)
[23:43:07] [PASSED] 0x46B2 (ALDERLAKE_P)
[23:43:07] [PASSED] 0x46B3 (ALDERLAKE_P)
[23:43:07] [PASSED] 0x46C0 (ALDERLAKE_P)
[23:43:07] [PASSED] 0x46C1 (ALDERLAKE_P)
[23:43:07] [PASSED] 0x46C2 (ALDERLAKE_P)
[23:43:07] [PASSED] 0x46C3 (ALDERLAKE_P)
[23:43:07] [PASSED] 0x46D0 (ALDERLAKE_N)
[23:43:07] [PASSED] 0x46D1 (ALDERLAKE_N)
[23:43:07] [PASSED] 0x46D2 (ALDERLAKE_N)
[23:43:07] [PASSED] 0x46D3 (ALDERLAKE_N)
[23:43:07] [PASSED] 0x46D4 (ALDERLAKE_N)
[23:43:07] [PASSED] 0xA721 (ALDERLAKE_P)
[23:43:07] [PASSED] 0xA7A1 (ALDERLAKE_P)
[23:43:07] [PASSED] 0xA7A9 (ALDERLAKE_P)
[23:43:07] [PASSED] 0xA7AC (ALDERLAKE_P)
[23:43:07] [PASSED] 0xA7AD (ALDERLAKE_P)
[23:43:07] [PASSED] 0xA720 (ALDERLAKE_P)
[23:43:07] [PASSED] 0xA7A0 (ALDERLAKE_P)
[23:43:07] [PASSED] 0xA7A8 (ALDERLAKE_P)
[23:43:07] [PASSED] 0xA7AA (ALDERLAKE_P)
[23:43:07] [PASSED] 0xA7AB (ALDERLAKE_P)
[23:43:07] [PASSED] 0xA780 (ALDERLAKE_S)
[23:43:07] [PASSED] 0xA781 (ALDERLAKE_S)
[23:43:07] [PASSED] 0xA782 (ALDERLAKE_S)
[23:43:07] [PASSED] 0xA783 (ALDERLAKE_S)
[23:43:07] [PASSED] 0xA788 (ALDERLAKE_S)
[23:43:07] [PASSED] 0xA789 (ALDERLAKE_S)
[23:43:07] [PASSED] 0xA78A (ALDERLAKE_S)
[23:43:07] [PASSED] 0xA78B (ALDERLAKE_S)
[23:43:07] [PASSED] 0x4905 (DG1)
[23:43:07] [PASSED] 0x4906 (DG1)
[23:43:07] [PASSED] 0x4907 (DG1)
[23:43:07] [PASSED] 0x4908 (DG1)
[23:43:07] [PASSED] 0x4909 (DG1)
[23:43:07] [PASSED] 0x56C0 (DG2)
[23:43:07] [PASSED] 0x56C2 (DG2)
[23:43:07] [PASSED] 0x56C1 (DG2)
[23:43:07] [PASSED] 0x7D51 (METEORLAKE)
[23:43:07] [PASSED] 0x7DD1 (METEORLAKE)
[23:43:07] [PASSED] 0x7D41 (METEORLAKE)
[23:43:07] [PASSED] 0x7D67 (METEORLAKE)
[23:43:07] [PASSED] 0xB640 (METEORLAKE)
[23:43:07] [PASSED] 0x56A0 (DG2)
[23:43:07] [PASSED] 0x56A1 (DG2)
[23:43:07] [PASSED] 0x56A2 (DG2)
[23:43:07] [PASSED] 0x56BE (DG2)
[23:43:07] [PASSED] 0x56BF (DG2)
[23:43:07] [PASSED] 0x5690 (DG2)
[23:43:07] [PASSED] 0x5691 (DG2)
[23:43:07] [PASSED] 0x5692 (DG2)
[23:43:07] [PASSED] 0x56A5 (DG2)
[23:43:07] [PASSED] 0x56A6 (DG2)
[23:43:07] [PASSED] 0x56B0 (DG2)
[23:43:07] [PASSED] 0x56B1 (DG2)
[23:43:07] [PASSED] 0x56BA (DG2)
[23:43:07] [PASSED] 0x56BB (DG2)
[23:43:07] [PASSED] 0x56BC (DG2)
[23:43:07] [PASSED] 0x56BD (DG2)
[23:43:07] [PASSED] 0x5693 (DG2)
[23:43:07] [PASSED] 0x5694 (DG2)
[23:43:07] [PASSED] 0x5695 (DG2)
[23:43:07] [PASSED] 0x56A3 (DG2)
[23:43:07] [PASSED] 0x56A4 (DG2)
[23:43:07] [PASSED] 0x56B2 (DG2)
[23:43:07] [PASSED] 0x56B3 (DG2)
[23:43:07] [PASSED] 0x5696 (DG2)
[23:43:07] [PASSED] 0x5697 (DG2)
[23:43:07] [PASSED] 0xB69 (PVC)
[23:43:07] [PASSED] 0xB6E (PVC)
[23:43:07] [PASSED] 0xBD4 (PVC)
[23:43:07] [PASSED] 0xBD5 (PVC)
[23:43:07] [PASSED] 0xBD6 (PVC)
[23:43:07] [PASSED] 0xBD7 (PVC)
[23:43:07] [PASSED] 0xBD8 (PVC)
[23:43:07] [PASSED] 0xBD9 (PVC)
[23:43:07] [PASSED] 0xBDA (PVC)
[23:43:07] [PASSED] 0xBDB (PVC)
[23:43:07] [PASSED] 0xBE0 (PVC)
[23:43:07] [PASSED] 0xBE1 (PVC)
[23:43:07] [PASSED] 0xBE5 (PVC)
[23:43:07] [PASSED] 0x7D40 (METEORLAKE)
[23:43:07] [PASSED] 0x7D45 (METEORLAKE)
[23:43:07] [PASSED] 0x7D55 (METEORLAKE)
[23:43:07] [PASSED] 0x7D60 (METEORLAKE)
[23:43:07] [PASSED] 0x7DD5 (METEORLAKE)
[23:43:07] [PASSED] 0x6420 (LUNARLAKE)
[23:43:07] [PASSED] 0x64A0 (LUNARLAKE)
[23:43:07] [PASSED] 0x64B0 (LUNARLAKE)
[23:43:07] [PASSED] 0xE202 (BATTLEMAGE)
[23:43:07] [PASSED] 0xE209 (BATTLEMAGE)
[23:43:07] [PASSED] 0xE20B (BATTLEMAGE)
[23:43:07] [PASSED] 0xE20C (BATTLEMAGE)
[23:43:07] [PASSED] 0xE20D (BATTLEMAGE)
[23:43:07] [PASSED] 0xE210 (BATTLEMAGE)
[23:43:07] [PASSED] 0xE211 (BATTLEMAGE)
[23:43:07] [PASSED] 0xE212 (BATTLEMAGE)
[23:43:07] [PASSED] 0xE216 (BATTLEMAGE)
[23:43:07] [PASSED] 0xE220 (BATTLEMAGE)
[23:43:07] [PASSED] 0xE221 (BATTLEMAGE)
[23:43:07] [PASSED] 0xE222 (BATTLEMAGE)
[23:43:07] [PASSED] 0xE223 (BATTLEMAGE)
[23:43:07] [PASSED] 0xB080 (PANTHERLAKE)
[23:43:07] [PASSED] 0xB081 (PANTHERLAKE)
[23:43:07] [PASSED] 0xB082 (PANTHERLAKE)
[23:43:07] [PASSED] 0xB083 (PANTHERLAKE)
[23:43:07] [PASSED] 0xB084 (PANTHERLAKE)
[23:43:07] [PASSED] 0xB085 (PANTHERLAKE)
[23:43:07] [PASSED] 0xB086 (PANTHERLAKE)
[23:43:07] [PASSED] 0xB087 (PANTHERLAKE)
[23:43:07] [PASSED] 0xB08F (PANTHERLAKE)
[23:43:07] [PASSED] 0xB090 (PANTHERLAKE)
[23:43:07] [PASSED] 0xB0A0 (PANTHERLAKE)
[23:43:07] [PASSED] 0xB0A1 (PANTHERLAKE)
[23:43:07] [PASSED] 0xB0B0 (PANTHERLAKE)
[23:43:07] [PASSED] 0xFD80 (PANTHERLAKE)
[23:43:07] [PASSED] 0xFD81 (PANTHERLAKE)
[23:43:07] [PASSED] 0xD740 (NOVALAKE_S)
[23:43:07] [PASSED] 0xD741 (NOVALAKE_S)
[23:43:07] [PASSED] 0xD742 (NOVALAKE_S)
[23:43:07] [PASSED] 0xD743 (NOVALAKE_S)
[23:43:07] [PASSED] 0xD745 (NOVALAKE_S)
[23:43:07] [PASSED] 0xD74A (NOVALAKE_S)
[23:43:07] [PASSED] 0xD74B (NOVALAKE_S)
[23:43:07] [PASSED] 0x674C (CRESCENTISLAND)
[23:43:07] [PASSED] 0x674D (CRESCENTISLAND)
[23:43:07] [PASSED] 0x674E (CRESCENTISLAND)
[23:43:07] [PASSED] 0x674F (CRESCENTISLAND)
[23:43:07] [PASSED] 0x6750 (CRESCENTISLAND)
[23:43:07] [PASSED] 0x6751 (CRESCENTISLAND)
[23:43:07] [PASSED] 0x6752 (CRESCENTISLAND)
[23:43:07] [PASSED] 0x6753 (CRESCENTISLAND)
[23:43:07] [PASSED] 0x6754 (CRESCENTISLAND)
[23:43:07] [PASSED] 0x6755 (CRESCENTISLAND)
[23:43:07] [PASSED] 0x6756 (CRESCENTISLAND)
[23:43:07] [PASSED] 0xD750 (NOVALAKE_P)
[23:43:07] [PASSED] 0xD751 (NOVALAKE_P)
[23:43:07] [PASSED] 0xD752 (NOVALAKE_P)
[23:43:07] [PASSED] 0xD753 (NOVALAKE_P)
[23:43:07] [PASSED] 0xD754 (NOVALAKE_P)
[23:43:07] [PASSED] 0xD755 (NOVALAKE_P)
[23:43:07] [PASSED] 0xD756 (NOVALAKE_P)
[23:43:07] [PASSED] 0xD757 (NOVALAKE_P)
[23:43:07] [PASSED] 0xD75F (NOVALAKE_P)
[23:43:07] =============== [PASSED] check_platform_desc ===============
[23:43:07] ===================== [PASSED] xe_pci ======================
[23:43:07] ============= xe_rtp_tables_test (5 subtests) ==============
[23:43:07] ================== xe_rtp_table_gt_test  ===================
[23:43:07] [PASSED] gt_was/14011060649
[23:43:07] [PASSED] gt_was/14011059788
[23:43:07] [PASSED] gt_was/14015795083
[23:43:07] [PASSED] gt_was/16021867713
[23:43:07] [PASSED] gt_was/14019449301
[23:43:07] [PASSED] gt_was/16028005424
[23:43:07] [PASSED] gt_was/14026578760
[23:43:07] [PASSED] gt_was/1409420604
[23:43:07] [PASSED] gt_was/1408615072
[23:43:07] [PASSED] gt_was/22010523718
[23:43:07] [PASSED] gt_was/14011006942
[23:43:07] [PASSED] gt_was/14014830051
[23:43:07] [PASSED] gt_was/18018781329
[23:43:07] [PASSED] gt_was/1509235366
[23:43:07] [PASSED] gt_was/18018781329
[23:43:07] [PASSED] gt_was/16016694945
[23:43:07] [PASSED] gt_was/14018575942
[23:43:07] [PASSED] gt_was/22016670082
[23:43:07] [PASSED] gt_was/22016670082
[23:43:07] [PASSED] gt_was/14017421178
[23:43:07] [PASSED] gt_was/16025250150
[23:43:07] [PASSED] gt_was/14021871409
[23:43:07] [PASSED] gt_was/16021865536
[23:43:07] [PASSED] gt_was/14021486841
[23:43:07] [PASSED] gt_was/14025160223
[23:43:07] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[23:43:07] [PASSED] gt_was/14025635424
[23:43:07] [PASSED] gt_was/16028005424
[23:43:07] ============== [PASSED] xe_rtp_table_gt_test ===============
[23:43:07] ================== xe_rtp_table_gt_test  ===================
[23:43:07] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[23:43:07] [PASSED] gt_tunings/Tuning: 32B Access Enable
[23:43:07] [PASSED] gt_tunings/Tuning: L3 cache
[23:43:07] [PASSED] gt_tunings/Tuning: L3 cache - media
[23:43:07] [PASSED] gt_tunings/Tuning: Compression Overfetch
[23:43:07] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[23:43:07] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[23:43:07] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[23:43:07] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[23:43:07] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[23:43:07] [PASSED] gt_tunings/Tuning: Stateless compression control
[23:43:07] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[23:43:07] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[23:43:07] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[23:43:07] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[23:43:07] [PASSED] gt_tunings/Tuning: Force All Non-Compressible Memory Reads to be 256B Overfetches
[23:43:07] ============== [PASSED] xe_rtp_table_gt_test ===============
[23:43:07] ================== xe_rtp_table_oob_test  ==================
[23:43:07] [PASSED] oob_was/1607983814
[23:43:07] [PASSED] oob_was/16010904313
[23:43:07] [PASSED] oob_was/18022495364
[23:43:07] [PASSED] oob_was/22012773006
[23:43:07] [PASSED] oob_was/14014475959
[23:43:07] [PASSED] oob_was/22011391025
[23:43:07] [PASSED] oob_was/22012727170
[23:43:07] [PASSED] oob_was/22012727685
[23:43:07] [PASSED] oob_was/22016596838
[23:43:07] [PASSED] oob_was/18020744125
[23:43:07] [PASSED] oob_was/1409600907
[23:43:07] [PASSED] oob_was/22014953428
[23:43:07] [PASSED] oob_was/16017236439
[23:43:07] [PASSED] oob_was/14019821291
[23:43:07] [PASSED] oob_was/14015076503
[23:43:07] [PASSED] oob_was/22016122933
[23:43:07] [PASSED] oob_was/14018913170
[23:43:07] [PASSED] oob_was/14018094691
[23:43:07] [PASSED] oob_was/18024947630
[23:43:07] [PASSED] oob_was/16022287689
[23:43:07] [PASSED] oob_was/13011645652
[23:43:07] [PASSED] oob_was/14022293748
[23:43:07] [PASSED] oob_was/22019794406
[23:43:07] [PASSED] oob_was/22019338487
[23:43:07] [PASSED] oob_was/16023588340
[23:43:07] [PASSED] oob_was/14019789679
[23:43:07] [PASSED] oob_was/14022866841
[23:43:07] [PASSED] oob_was/16021333562
[23:43:07] [PASSED] oob_was/14016712196
[23:43:07] [PASSED] oob_was/14015568240
[23:43:07] [PASSED] oob_was/18013179988
[23:43:07] [PASSED] oob_was/1508761755
[23:43:07] [PASSED] oob_was/16023105232
[23:43:07] [PASSED] oob_was/16026508708
[23:43:07] [PASSED] oob_was/14020001231
[23:43:07] [PASSED] oob_was/16023683509
[23:43:07] [PASSED] oob_was/14025515070
[23:43:07] [PASSED] oob_was/15015404425_disable
[23:43:07] [PASSED] oob_was/16026007364
[23:43:07] [PASSED] oob_was/14020316580
[23:43:07] [PASSED] oob_was/14025883347
[23:43:07] [PASSED] oob_was/16029380221
[23:43:07] [PASSED] oob_was/22022079272
[23:43:07] [PASSED] oob_was/16029897822
[23:43:07] [PASSED] oob_was/14026539277
[23:43:07] [PASSED] oob_was/14027054324
[23:43:07] [PASSED] oob_was/14025941587
[23:43:07] [PASSED] oob_was/16030224309
[23:43:07] [PASSED] oob_was/14028709524
[23:43:07] [PASSED] oob_was/14028250015
[23:43:07] [PASSED] oob_was/16031259911
[23:43:07] ============== [PASSED] xe_rtp_table_oob_test ==============
[23:43:07] ================ xe_rtp_table_dev_oob_test  ================
[23:43:07] [PASSED] device_oob_was/22010954014
[23:43:07] [PASSED] device_oob_was/15015404425
[23:43:07] [PASSED] device_oob_was/22019338487_display
[23:43:07] [PASSED] device_oob_was/14022085890
[23:43:07] [PASSED] device_oob_was/14026633728
[23:43:07] [PASSED] device_oob_was/14026746987
[23:43:07] [PASSED] device_oob_was/14026779378
[23:43:07] [PASSED] device_oob_was/14028586678
[23:43:07] [PASSED] device_oob_was/14028434957
[23:43:07] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[23:43:07] ========== xe_rtp_table_missing_upper_bound_test  ==========
[23:43:07] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[23:43:07] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[23:43:07] [PASSED] register_whitelist/1806527549
[23:43:07] [PASSED] register_whitelist/allow_read_ctx_timestamp
[23:43:07] [PASSED] register_whitelist/allow_read_queue_timestamp
[23:43:07] [PASSED] register_whitelist/16014440446
[23:43:07] [PASSED] register_whitelist/16017236439
[23:43:07] [PASSED] register_whitelist/16020183090
[23:43:07] [PASSED] register_whitelist/14024997852
[23:43:07] [PASSED] register_whitelist/14024997852
[23:43:07] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[23:43:07] =============== [PASSED] xe_rtp_tables_test ================
[23:43:07] =================== xe_rtp (3 subtests) ====================
[23:43:07] =================== xe_rtp_rules_tests  ====================
[23:43:07] [PASSED] no
[23:43:07] [PASSED] yes
[23:43:07] [PASSED] no-and-no
[23:43:07] [PASSED] no-and-yes
[23:43:07] [PASSED] yes-and-no
[23:43:07] [PASSED] yes-and-yes
[23:43:07] [PASSED] no-or-no
[23:43:07] [PASSED] no-or-yes
[23:43:07] [PASSED] yes-or-no
[23:43:07] [PASSED] yes-or-yes
[23:43:07] [PASSED] no-yes-or-yes-no
[23:43:07] [PASSED] no-yes-or-yes-yes
[23:43:07] [PASSED] yes-yes-or-no-yes
[23:43:07] [PASSED] yes-yes-or-yes-yes
[23:43:07] [PASSED] no-no-or-yes-or-no
[23:43:07] [PASSED] or
[23:43:07] [PASSED] or-yes
[23:43:07] [PASSED] or-no
[23:43:07] [PASSED] yes-or
[23:43:07] [PASSED] no-or
[23:43:07] [PASSED] no-or-or-yes
[23:43:07] [PASSED] yes-or-or-no
[23:43:07] [PASSED] no-or-or-no
[23:43:07] [PASSED] missing-context-engine-class
[23:43:07] [PASSED] missing-context-engine-class-or-yes
[23:43:07] [PASSED] missing-context-engine-class-or-or-yes
[23:43:07] =============== [PASSED] xe_rtp_rules_tests ================
[23:43:07] =============== xe_rtp_process_to_sr_tests  ================
[23:43:07] [PASSED] coalesce-same-reg
[23:43:07] [PASSED] coalesce-same-reg-literal-and-func
[23:43:07] [PASSED] no-match-no-add
[23:43:07] [PASSED] two-regs-two-entries
[23:43:07] [PASSED] clr-one-set-other
[23:43:07] [PASSED] set-field
[23:43:07] [PASSED] conflict-duplicate
[23:43:07] [PASSED] conflict-not-disjoint
[23:43:07] [PASSED] conflict-not-disjoint-literal-and-func
[23:43:07] [PASSED] conflict-reg-type
[23:43:07] [PASSED] bad-mcr-reg-forced-to-regular
[23:43:07] [PASSED] bad-regular-reg-forced-to-mcr
[23:43:07] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[23:43:07] ================== xe_rtp_process_tests  ===================
[23:43:07] [PASSED] active1
[23:43:07] [PASSED] active2
[23:43:07] [PASSED] active-inactive
[23:43:07] [PASSED] inactive-active
[23:43:07] [PASSED] inactive-active-inactive
[23:43:07] [PASSED] inactive-inactive-inactive
[23:43:07] ============== [PASSED] xe_rtp_process_tests ===============
[23:43:07] ===================== [PASSED] xe_rtp ======================
[23:43:07] ==================== xe_wa (1 subtest) =====================
[23:43:07] ======================== xe_wa_gt  =========================
[23:43:07] [PASSED] TIGERLAKE B0
[23:43:07] [PASSED] DG1 A0
[23:43:07] [PASSED] DG1 B0
[23:43:07] [PASSED] ALDERLAKE_S A0
[23:43:07] [PASSED] ALDERLAKE_S B0
[23:43:07] [PASSED] ALDERLAKE_S C0
[23:43:07] [PASSED] ALDERLAKE_S D0
[23:43:07] [PASSED] ALDERLAKE_P A0
[23:43:07] [PASSED] ALDERLAKE_P B0
[23:43:07] [PASSED] ALDERLAKE_P C0
[23:43:07] [PASSED] ALDERLAKE_S RPLS D0
[23:43:07] [PASSED] ALDERLAKE_P RPLU E0
[23:43:07] [PASSED] DG2 G10 C0
[23:43:07] [PASSED] DG2 G11 B1
[23:43:07] [PASSED] DG2 G12 A1
[23:43:07] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[23:43:07] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[23:43:07] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[23:43:07] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[23:43:07] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[23:43:07] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[23:43:07] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[23:43:07] ==================== [PASSED] xe_wa_gt =====================
[23:43:07] ====================== [PASSED] xe_wa ======================
[23:43:07] ============================================================
[23:43:07] Testing complete. Ran 860 tests: passed: 831, skipped: 29
[23:43:07] Elapsed time: 41.809s total, 2.578s configuring, 38.465s building, 0.733s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[23:43:07] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:43:09] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[23:43:34] Starting KUnit Kernel (1/1)...
[23:43:34] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:43:35] ============ drm_test_pick_cmdline (2 subtests) ============
[23:43:35] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[23:43:35] =============== drm_test_pick_cmdline_named  ===============
[23:43:35] [PASSED] NTSC
[23:43:35] [PASSED] NTSC-J
[23:43:35] [PASSED] PAL
[23:43:35] [PASSED] PAL-M
[23:43:35] =========== [PASSED] drm_test_pick_cmdline_named ===========
[23:43:35] ============== [PASSED] drm_test_pick_cmdline ==============
[23:43:35] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[23:43:35] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[23:43:35] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[23:43:35] =========== drm_validate_clone_mode (2 subtests) ===========
[23:43:35] ============== drm_test_check_in_clone_mode  ===============
[23:43:35] [PASSED] in_clone_mode
[23:43:35] [PASSED] not_in_clone_mode
[23:43:35] ========== [PASSED] drm_test_check_in_clone_mode ===========
[23:43:35] =============== drm_test_check_valid_clones  ===============
[23:43:35] [PASSED] not_in_clone_mode
[23:43:35] [PASSED] valid_clone
[23:43:35] [PASSED] invalid_clone
[23:43:35] =========== [PASSED] drm_test_check_valid_clones ===========
[23:43:35] ============= [PASSED] drm_validate_clone_mode =============
[23:43:35] ============= drm_validate_modeset (1 subtest) =============
[23:43:35] [PASSED] drm_test_check_connector_changed_modeset
[23:43:35] ============== [PASSED] drm_validate_modeset ===============
[23:43:35] ====== drm_test_bridge_get_current_state (1 subtest) =======
[23:43:35] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[23:43:35] ======== [PASSED] drm_test_bridge_get_current_state ========
[23:43:35] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[23:43:35] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[23:43:35] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[23:43:35] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[23:43:35] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[23:43:35] ============== drm_bridge_alloc (2 subtests) ===============
[23:43:35] [PASSED] drm_test_drm_bridge_alloc_basic
[23:43:35] [PASSED] drm_test_drm_bridge_alloc_get_put
[23:43:35] ================ [PASSED] drm_bridge_alloc =================
[23:43:35] ============= drm_bridge_bus_fmt (5 subtests) ==============
[23:43:35] [PASSED] drm_test_bridge_rgb_yuv_rgb
[23:43:35] [PASSED] drm_test_bridge_must_convert_to_yuv444
[23:43:35] [PASSED] drm_test_bridge_hdmi_auto_rgb
[23:43:35] [PASSED] drm_test_bridge_auto_first
[23:43:35] [PASSED] drm_test_bridge_rgb_yuv_no_path
[23:43:35] =============== [PASSED] drm_bridge_bus_fmt ================
[23:43:35] ============= drm_cmdline_parser (40 subtests) =============
[23:43:35] [PASSED] drm_test_cmdline_force_d_only
[23:43:35] [PASSED] drm_test_cmdline_force_D_only_dvi
[23:43:35] [PASSED] drm_test_cmdline_force_D_only_hdmi
[23:43:35] [PASSED] drm_test_cmdline_force_D_only_not_digital
[23:43:35] [PASSED] drm_test_cmdline_force_e_only
[23:43:35] [PASSED] drm_test_cmdline_res
[23:43:35] [PASSED] drm_test_cmdline_res_vesa
[23:43:35] [PASSED] drm_test_cmdline_res_vesa_rblank
[23:43:35] [PASSED] drm_test_cmdline_res_rblank
[23:43:35] [PASSED] drm_test_cmdline_res_bpp
[23:43:35] [PASSED] drm_test_cmdline_res_refresh
[23:43:35] [PASSED] drm_test_cmdline_res_bpp_refresh
[23:43:35] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[23:43:35] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[23:43:35] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[23:43:35] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[23:43:35] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[23:43:35] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[23:43:35] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[23:43:35] [PASSED] drm_test_cmdline_res_margins_force_on
[23:43:35] [PASSED] drm_test_cmdline_res_vesa_margins
[23:43:35] [PASSED] drm_test_cmdline_name
[23:43:35] [PASSED] drm_test_cmdline_name_bpp
[23:43:35] [PASSED] drm_test_cmdline_name_option
[23:43:35] [PASSED] drm_test_cmdline_name_bpp_option
[23:43:35] [PASSED] drm_test_cmdline_rotate_0
[23:43:35] [PASSED] drm_test_cmdline_rotate_90
[23:43:35] [PASSED] drm_test_cmdline_rotate_180
[23:43:35] [PASSED] drm_test_cmdline_rotate_270
[23:43:35] [PASSED] drm_test_cmdline_hmirror
[23:43:35] [PASSED] drm_test_cmdline_vmirror
[23:43:35] [PASSED] drm_test_cmdline_margin_options
[23:43:35] [PASSED] drm_test_cmdline_multiple_options
[23:43:35] [PASSED] drm_test_cmdline_bpp_extra_and_option
[23:43:35] [PASSED] drm_test_cmdline_extra_and_option
[23:43:35] [PASSED] drm_test_cmdline_freestanding_options
[23:43:35] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[23:43:35] [PASSED] drm_test_cmdline_panel_orientation
[23:43:35] ================ drm_test_cmdline_invalid  =================
[23:43:35] [PASSED] margin_only
[23:43:35] [PASSED] interlace_only
[23:43:35] [PASSED] res_missing_x
[23:43:35] [PASSED] res_missing_y
[23:43:35] [PASSED] res_bad_y
[23:43:35] [PASSED] res_missing_y_bpp
[23:43:35] [PASSED] res_bad_bpp
[23:43:35] [PASSED] res_bad_refresh
[23:43:35] [PASSED] res_bpp_refresh_force_on_off
[23:43:35] [PASSED] res_invalid_mode
[23:43:35] [PASSED] res_bpp_wrong_place_mode
[23:43:35] [PASSED] name_bpp_refresh
[23:43:35] [PASSED] name_refresh
[23:43:35] [PASSED] name_refresh_wrong_mode
[23:43:35] [PASSED] name_refresh_invalid_mode
[23:43:35] [PASSED] rotate_multiple
[23:43:35] [PASSED] rotate_invalid_val
[23:43:35] [PASSED] rotate_truncated
[23:43:35] [PASSED] invalid_option
[23:43:35] [PASSED] invalid_tv_option
[23:43:35] [PASSED] truncated_tv_option
[23:43:35] ============ [PASSED] drm_test_cmdline_invalid =============
[23:43:35] =============== drm_test_cmdline_tv_options  ===============
[23:43:35] [PASSED] NTSC
[23:43:35] [PASSED] NTSC_443
[23:43:35] [PASSED] NTSC_J
[23:43:35] [PASSED] PAL
[23:43:35] [PASSED] PAL_M
[23:43:35] [PASSED] PAL_N
[23:43:35] [PASSED] SECAM
[23:43:35] [PASSED] MONO_525
[23:43:35] [PASSED] MONO_625
[23:43:35] =========== [PASSED] drm_test_cmdline_tv_options ===========
[23:43:35] =============== [PASSED] drm_cmdline_parser ================
[23:43:35] ========== drmm_connector_hdmi_init (20 subtests) ==========
[23:43:35] [PASSED] drm_test_connector_hdmi_init_valid
[23:43:35] [PASSED] drm_test_connector_hdmi_init_bpc_8
[23:43:35] [PASSED] drm_test_connector_hdmi_init_bpc_10
[23:43:35] [PASSED] drm_test_connector_hdmi_init_bpc_12
[23:43:35] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[23:43:35] [PASSED] drm_test_connector_hdmi_init_bpc_null
[23:43:35] [PASSED] drm_test_connector_hdmi_init_formats_empty
[23:43:35] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[23:43:35] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[23:43:35] [PASSED] supported_formats=0x9 yuv420_allowed=1
[23:43:35] [PASSED] supported_formats=0x9 yuv420_allowed=0
[23:43:35] [PASSED] supported_formats=0x5 yuv420_allowed=1
[23:43:35] [PASSED] supported_formats=0x5 yuv420_allowed=0
[23:43:35] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[23:43:35] [PASSED] drm_test_connector_hdmi_init_null_ddc
[23:43:35] [PASSED] drm_test_connector_hdmi_init_null_product
[23:43:35] [PASSED] drm_test_connector_hdmi_init_null_vendor
[23:43:35] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[23:43:35] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[23:43:35] [PASSED] drm_test_connector_hdmi_init_product_valid
[23:43:35] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[23:43:35] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[23:43:35] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[23:43:35] ========= drm_test_connector_hdmi_init_type_valid  =========
[23:43:35] [PASSED] HDMI-A
[23:43:35] [PASSED] HDMI-B
[23:43:35] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[23:43:35] ======== drm_test_connector_hdmi_init_type_invalid  ========
[23:43:35] [PASSED] Unknown
[23:43:35] [PASSED] VGA
[23:43:35] [PASSED] DVI-I
[23:43:35] [PASSED] DVI-D
[23:43:35] [PASSED] DVI-A
[23:43:35] [PASSED] Composite
[23:43:35] [PASSED] SVIDEO
[23:43:35] [PASSED] LVDS
[23:43:35] [PASSED] Component
[23:43:35] [PASSED] DIN
[23:43:35] [PASSED] DP
[23:43:35] [PASSED] TV
[23:43:35] [PASSED] eDP
[23:43:35] [PASSED] Virtual
[23:43:35] [PASSED] DSI
[23:43:35] [PASSED] DPI
[23:43:35] [PASSED] Writeback
[23:43:35] [PASSED] SPI
[23:43:35] [PASSED] USB
[23:43:35] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[23:43:35] ============ [PASSED] drmm_connector_hdmi_init =============
[23:43:35] ============= drmm_connector_init (3 subtests) =============
[23:43:35] [PASSED] drm_test_drmm_connector_init
[23:43:35] [PASSED] drm_test_drmm_connector_init_null_ddc
[23:43:35] ========= drm_test_drmm_connector_init_type_valid  =========
[23:43:35] [PASSED] Unknown
[23:43:35] [PASSED] VGA
[23:43:35] [PASSED] DVI-I
[23:43:35] [PASSED] DVI-D
[23:43:35] [PASSED] DVI-A
[23:43:35] [PASSED] Composite
[23:43:35] [PASSED] SVIDEO
[23:43:35] [PASSED] LVDS
[23:43:35] [PASSED] Component
[23:43:35] [PASSED] DIN
[23:43:35] [PASSED] DP
[23:43:35] [PASSED] HDMI-A
[23:43:35] [PASSED] HDMI-B
[23:43:35] [PASSED] TV
[23:43:35] [PASSED] eDP
[23:43:35] [PASSED] Virtual
[23:43:35] [PASSED] DSI
[23:43:35] [PASSED] DPI
[23:43:35] [PASSED] Writeback
[23:43:35] [PASSED] SPI
[23:43:35] [PASSED] USB
[23:43:35] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[23:43:35] =============== [PASSED] drmm_connector_init ===============
[23:43:35] ========= drm_connector_dynamic_init (6 subtests) ==========
[23:43:35] [PASSED] drm_test_drm_connector_dynamic_init
[23:43:35] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[23:43:35] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[23:43:35] [PASSED] drm_test_drm_connector_dynamic_init_properties
[23:43:35] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[23:43:35] [PASSED] Unknown
[23:43:35] [PASSED] VGA
[23:43:35] [PASSED] DVI-I
[23:43:35] [PASSED] DVI-D
[23:43:35] [PASSED] DVI-A
[23:43:35] [PASSED] Composite
[23:43:35] [PASSED] SVIDEO
[23:43:35] [PASSED] LVDS
[23:43:35] [PASSED] Component
[23:43:35] [PASSED] DIN
[23:43:35] [PASSED] DP
[23:43:35] [PASSED] HDMI-A
[23:43:35] [PASSED] HDMI-B
[23:43:35] [PASSED] TV
[23:43:35] [PASSED] eDP
[23:43:35] [PASSED] Virtual
[23:43:35] [PASSED] DSI
[23:43:35] [PASSED] DPI
[23:43:35] [PASSED] Writeback
[23:43:35] [PASSED] SPI
[23:43:35] [PASSED] USB
[23:43:35] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[23:43:35] ======== drm_test_drm_connector_dynamic_init_name  =========
[23:43:35] [PASSED] Unknown
[23:43:35] [PASSED] VGA
[23:43:35] [PASSED] DVI-I
[23:43:35] [PASSED] DVI-D
[23:43:35] [PASSED] DVI-A
[23:43:35] [PASSED] Composite
[23:43:35] [PASSED] SVIDEO
[23:43:35] [PASSED] LVDS
[23:43:35] [PASSED] Component
[23:43:35] [PASSED] DIN
[23:43:35] [PASSED] DP
[23:43:35] [PASSED] HDMI-A
[23:43:35] [PASSED] HDMI-B
[23:43:35] [PASSED] TV
[23:43:35] [PASSED] eDP
[23:43:35] [PASSED] Virtual
[23:43:35] [PASSED] DSI
[23:43:35] [PASSED] DPI
[23:43:35] [PASSED] Writeback
[23:43:35] [PASSED] SPI
[23:43:35] [PASSED] USB
[23:43:35] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[23:43:35] =========== [PASSED] drm_connector_dynamic_init ============
[23:43:35] ==== drm_connector_dynamic_register_early (4 subtests) =====
[23:43:35] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[23:43:35] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[23:43:35] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[23:43:35] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[23:43:35] ====== [PASSED] drm_connector_dynamic_register_early =======
[23:43:35] ======= drm_connector_dynamic_register (7 subtests) ========
[23:43:35] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[23:43:35] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[23:43:35] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[23:43:35] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[23:43:35] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[23:43:35] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[23:43:35] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[23:43:35] ========= [PASSED] drm_connector_dynamic_register ==========
[23:43:35] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[23:43:35] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[23:43:35] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[23:43:35] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[23:43:35] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[23:43:35] ========== drm_test_get_tv_mode_from_name_valid  ===========
[23:43:35] [PASSED] NTSC
[23:43:35] [PASSED] NTSC-443
[23:43:35] [PASSED] NTSC-J
[23:43:35] [PASSED] PAL
[23:43:35] [PASSED] PAL-M
[23:43:35] [PASSED] PAL-N
[23:43:35] [PASSED] SECAM
[23:43:35] [PASSED] Mono
[23:43:35] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[23:43:35] [PASSED] drm_test_get_tv_mode_from_name_truncated
[23:43:35] ============ [PASSED] drm_get_tv_mode_from_name ============
[23:43:35] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[23:43:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[23:43:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[23:43:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[23:43:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[23:43:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[23:43:35] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[23:43:35] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[23:43:35] [PASSED] VIC 96
[23:43:35] [PASSED] VIC 97
[23:43:35] [PASSED] VIC 101
[23:43:35] [PASSED] VIC 102
[23:43:35] [PASSED] VIC 106
[23:43:35] [PASSED] VIC 107
[23:43:35] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[23:43:35] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[23:43:35] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[23:43:35] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[23:43:35] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[23:43:35] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[23:43:35] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[23:43:35] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[23:43:35] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[23:43:35] [PASSED] Automatic
[23:43:35] [PASSED] Full
[23:43:35] [PASSED] Limited 16:235
[23:43:35] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[23:43:35] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[23:43:35] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[23:43:35] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[23:43:35] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[23:43:35] [PASSED] RGB
[23:43:35] [PASSED] YUV 4:2:0
[23:43:35] [PASSED] YUV 4:2:2
[23:43:35] [PASSED] YUV 4:4:4
[23:43:35] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[23:43:35] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[23:43:35] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[23:43:35] ============= drm_damage_helper (21 subtests) ==============
[23:43:35] [PASSED] drm_test_damage_iter_no_damage
[23:43:35] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[23:43:35] [PASSED] drm_test_damage_iter_no_damage_src_moved
[23:43:35] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[23:43:35] [PASSED] drm_test_damage_iter_no_damage_not_visible
[23:43:35] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[23:43:35] [PASSED] drm_test_damage_iter_no_damage_no_fb
[23:43:35] [PASSED] drm_test_damage_iter_simple_damage
[23:43:35] [PASSED] drm_test_damage_iter_single_damage
[23:43:35] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[23:43:35] [PASSED] drm_test_damage_iter_single_damage_outside_src
[23:43:35] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[23:43:35] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[23:43:35] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[23:43:35] [PASSED] drm_test_damage_iter_single_damage_src_moved
[23:43:35] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[23:43:35] [PASSED] drm_test_damage_iter_damage
[23:43:35] [PASSED] drm_test_damage_iter_damage_one_intersect
[23:43:35] [PASSED] drm_test_damage_iter_damage_one_outside
[23:43:35] [PASSED] drm_test_damage_iter_damage_src_moved
[23:43:35] [PASSED] drm_test_damage_iter_damage_not_visible
[23:43:35] ================ [PASSED] drm_damage_helper ================
[23:43:35] ============== drm_dp_mst_helper (3 subtests) ==============
[23:43:35] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[23:43:35] [PASSED] Clock 154000 BPP 30 DSC disabled
[23:43:35] [PASSED] Clock 234000 BPP 30 DSC disabled
[23:43:35] [PASSED] Clock 297000 BPP 24 DSC disabled
[23:43:35] [PASSED] Clock 332880 BPP 24 DSC enabled
[23:43:35] [PASSED] Clock 324540 BPP 24 DSC enabled
[23:43:35] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[23:43:35] ============== drm_test_dp_mst_calc_pbn_div  ===============
[23:43:35] [PASSED] Link rate 2000000 lane count 4
[23:43:35] [PASSED] Link rate 2000000 lane count 2
[23:43:35] [PASSED] Link rate 2000000 lane count 1
[23:43:35] [PASSED] Link rate 1350000 lane count 4
[23:43:35] [PASSED] Link rate 1350000 lane count 2
[23:43:35] [PASSED] Link rate 1350000 lane count 1
[23:43:35] [PASSED] Link rate 1000000 lane count 4
[23:43:35] [PASSED] Link rate 1000000 lane count 2
[23:43:35] [PASSED] Link rate 1000000 lane count 1
[23:43:35] [PASSED] Link rate 810000 lane count 4
[23:43:35] [PASSED] Link rate 810000 lane count 2
[23:43:35] [PASSED] Link rate 810000 lane count 1
[23:43:35] [PASSED] Link rate 540000 lane count 4
[23:43:35] [PASSED] Link rate 540000 lane count 2
[23:43:35] [PASSED] Link rate 540000 lane count 1
[23:43:35] [PASSED] Link rate 270000 lane count 4
[23:43:35] [PASSED] Link rate 270000 lane count 2
[23:43:35] [PASSED] Link rate 270000 lane count 1
[23:43:35] [PASSED] Link rate 162000 lane count 4
[23:43:35] [PASSED] Link rate 162000 lane count 2
[23:43:35] [PASSED] Link rate 162000 lane count 1
[23:43:35] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[23:43:35] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[23:43:35] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[23:43:35] [PASSED] DP_POWER_UP_PHY with port number
[23:43:35] [PASSED] DP_POWER_DOWN_PHY with port number
[23:43:35] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[23:43:35] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[23:43:35] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[23:43:35] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[23:43:35] [PASSED] DP_QUERY_PAYLOAD with port number
[23:43:35] [PASSED] DP_QUERY_PAYLOAD with VCPI
[23:43:35] [PASSED] DP_REMOTE_DPCD_READ with port number
[23:43:35] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[23:43:35] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[23:43:35] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[23:43:35] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[23:43:35] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[23:43:35] [PASSED] DP_REMOTE_I2C_READ with port number
[23:43:35] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[23:43:35] [PASSED] DP_REMOTE_I2C_READ with transactions array
[23:43:35] [PASSED] DP_REMOTE_I2C_WRITE with port number
[23:43:35] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[23:43:35] [PASSED] DP_REMOTE_I2C_WRITE with data array
[23:43:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[23:43:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[23:43:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[23:43:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[23:43:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[23:43:35] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[23:43:35] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[23:43:35] ================ [PASSED] drm_dp_mst_helper ================
[23:43:35] ================== drm_exec (7 subtests) ===================
[23:43:35] [PASSED] sanitycheck
[23:43:35] [PASSED] test_lock
[23:43:35] [PASSED] test_lock_unlock
[23:43:35] [PASSED] test_duplicates
[23:43:35] [PASSED] test_prepare
[23:43:35] [PASSED] test_prepare_array
[23:43:35] [PASSED] test_multiple_loops
[23:43:35] ==================== [PASSED] drm_exec =====================
[23:43:35] =========== drm_format_helper_test (17 subtests) ===========
[23:43:35] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[23:43:35] [PASSED] single_pixel_source_buffer
[23:43:35] [PASSED] single_pixel_clip_rectangle
[23:43:35] [PASSED] well_known_colors
[23:43:35] [PASSED] destination_pitch
[23:43:35] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[23:43:35] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[23:43:35] [PASSED] single_pixel_source_buffer
[23:43:35] [PASSED] single_pixel_clip_rectangle
[23:43:35] [PASSED] well_known_colors
[23:43:35] [PASSED] destination_pitch
[23:43:35] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[23:43:35] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[23:43:35] [PASSED] single_pixel_source_buffer
[23:43:35] [PASSED] single_pixel_clip_rectangle
[23:43:35] [PASSED] well_known_colors
[23:43:35] [PASSED] destination_pitch
[23:43:35] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[23:43:35] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[23:43:35] [PASSED] single_pixel_source_buffer
[23:43:35] [PASSED] single_pixel_clip_rectangle
[23:43:35] [PASSED] well_known_colors
[23:43:35] [PASSED] destination_pitch
[23:43:35] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[23:43:35] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[23:43:35] [PASSED] single_pixel_source_buffer
[23:43:35] [PASSED] single_pixel_clip_rectangle
[23:43:35] [PASSED] well_known_colors
[23:43:35] [PASSED] destination_pitch
[23:43:35] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[23:43:35] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[23:43:35] [PASSED] single_pixel_source_buffer
[23:43:35] [PASSED] single_pixel_clip_rectangle
[23:43:35] [PASSED] well_known_colors
[23:43:35] [PASSED] destination_pitch
[23:43:35] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[23:43:35] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[23:43:35] [PASSED] single_pixel_source_buffer
[23:43:35] [PASSED] single_pixel_clip_rectangle
[23:43:35] [PASSED] well_known_colors
[23:43:35] [PASSED] destination_pitch
[23:43:35] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[23:43:35] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[23:43:35] [PASSED] single_pixel_source_buffer
[23:43:35] [PASSED] single_pixel_clip_rectangle
[23:43:35] [PASSED] well_known_colors
[23:43:35] [PASSED] destination_pitch
[23:43:35] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[23:43:35] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[23:43:35] [PASSED] single_pixel_source_buffer
[23:43:35] [PASSED] single_pixel_clip_rectangle
[23:43:35] [PASSED] well_known_colors
[23:43:35] [PASSED] destination_pitch
[23:43:35] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[23:43:35] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[23:43:35] [PASSED] single_pixel_source_buffer
[23:43:35] [PASSED] single_pixel_clip_rectangle
[23:43:35] [PASSED] well_known_colors
[23:43:35] [PASSED] destination_pitch
[23:43:35] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[23:43:35] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[23:43:35] [PASSED] single_pixel_source_buffer
[23:43:35] [PASSED] single_pixel_clip_rectangle
[23:43:35] [PASSED] well_known_colors
[23:43:35] [PASSED] destination_pitch
[23:43:35] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[23:43:35] ============== drm_test_fb_xrgb8888_to_mono  ===============
[23:43:35] [PASSED] single_pixel_source_buffer
[23:43:35] [PASSED] single_pixel_clip_rectangle
[23:43:35] [PASSED] well_known_colors
[23:43:35] [PASSED] destination_pitch
[23:43:35] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[23:43:35] ==================== drm_test_fb_swab  =====================
[23:43:35] [PASSED] single_pixel_source_buffer
[23:43:35] [PASSED] single_pixel_clip_rectangle
[23:43:35] [PASSED] well_known_colors
[23:43:35] [PASSED] destination_pitch
[23:43:35] ================ [PASSED] drm_test_fb_swab =================
[23:43:35] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[23:43:35] [PASSED] single_pixel_source_buffer
[23:43:35] [PASSED] single_pixel_clip_rectangle
[23:43:35] [PASSED] well_known_colors
[23:43:35] [PASSED] destination_pitch
[23:43:35] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[23:43:35] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[23:43:35] [PASSED] single_pixel_source_buffer
[23:43:35] [PASSED] single_pixel_clip_rectangle
[23:43:35] [PASSED] well_known_colors
[23:43:35] [PASSED] destination_pitch
[23:43:35] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[23:43:35] ================= drm_test_fb_clip_offset  =================
[23:43:35] [PASSED] pass through
[23:43:35] [PASSED] horizontal offset
[23:43:35] [PASSED] vertical offset
[23:43:35] [PASSED] horizontal and vertical offset
[23:43:35] [PASSED] horizontal offset (custom pitch)
[23:43:35] [PASSED] vertical offset (custom pitch)
[23:43:35] [PASSED] horizontal and vertical offset (custom pitch)
[23:43:35] ============= [PASSED] drm_test_fb_clip_offset =============
[23:43:35] =================== drm_test_fb_memcpy  ====================
[23:43:35] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[23:43:35] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[23:43:35] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[23:43:35] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[23:43:35] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[23:43:35] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[23:43:35] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[23:43:35] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[23:43:35] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[23:43:35] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[23:43:35] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[23:43:35] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[23:43:35] =============== [PASSED] drm_test_fb_memcpy ================
[23:43:35] ============= [PASSED] drm_format_helper_test ==============
[23:43:35] ================= drm_format (18 subtests) =================
[23:43:35] [PASSED] drm_test_format_block_width_invalid
[23:43:35] [PASSED] drm_test_format_block_width_one_plane
[23:43:35] [PASSED] drm_test_format_block_width_two_plane
[23:43:35] [PASSED] drm_test_format_block_width_three_plane
[23:43:35] [PASSED] drm_test_format_block_width_tiled
[23:43:35] [PASSED] drm_test_format_block_height_invalid
[23:43:35] [PASSED] drm_test_format_block_height_one_plane
[23:43:35] [PASSED] drm_test_format_block_height_two_plane
[23:43:35] [PASSED] drm_test_format_block_height_three_plane
[23:43:35] [PASSED] drm_test_format_block_height_tiled
[23:43:35] [PASSED] drm_test_format_min_pitch_invalid
[23:43:35] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[23:43:35] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[23:43:35] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[23:43:35] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[23:43:35] [PASSED] drm_test_format_min_pitch_two_plane
[23:43:35] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[23:43:35] [PASSED] drm_test_format_min_pitch_tiled
[23:43:35] =================== [PASSED] drm_format ====================
[23:43:35] ============== drm_framebuffer (10 subtests) ===============
[23:43:35] ========== drm_test_framebuffer_check_src_coords  ==========
[23:43:35] [PASSED] Success: source fits into fb
[23:43:35] [PASSED] Fail: overflowing fb with x-axis coordinate
[23:43:35] [PASSED] Fail: overflowing fb with y-axis coordinate
[23:43:35] [PASSED] Fail: overflowing fb with source width
[23:43:35] [PASSED] Fail: overflowing fb with source height
[23:43:35] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[23:43:35] [PASSED] drm_test_framebuffer_cleanup
[23:43:35] =============== drm_test_framebuffer_create  ===============
[23:43:35] [PASSED] ABGR8888 normal sizes
[23:43:35] [PASSED] ABGR8888 max sizes
[23:43:35] [PASSED] ABGR8888 pitch greater than min required
[23:43:35] [PASSED] ABGR8888 pitch less than min required
[23:43:35] [PASSED] ABGR8888 Invalid width
[23:43:35] [PASSED] ABGR8888 Invalid buffer handle
[23:43:35] [PASSED] No pixel format
[23:43:35] [PASSED] ABGR8888 Width 0
[23:43:35] [PASSED] ABGR8888 Height 0
[23:43:35] [PASSED] ABGR8888 Out of bound height * pitch combination
[23:43:35] [PASSED] ABGR8888 Large buffer offset
[23:43:35] [PASSED] ABGR8888 Buffer offset for inexistent plane
[23:43:35] [PASSED] ABGR8888 Invalid flag
[23:43:35] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[23:43:35] [PASSED] ABGR8888 Valid buffer modifier
[23:43:35] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[23:43:35] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[23:43:35] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[23:43:35] [PASSED] NV12 Normal sizes
[23:43:35] [PASSED] NV12 Max sizes
[23:43:35] [PASSED] NV12 Invalid pitch
[23:43:35] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[23:43:35] [PASSED] NV12 different  modifier per-plane
[23:43:35] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[23:43:35] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[23:43:35] [PASSED] NV12 Modifier for inexistent plane
[23:43:35] [PASSED] NV12 Handle for inexistent plane
[23:43:35] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[23:43:35] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[23:43:35] [PASSED] YVU420 Normal sizes
[23:43:35] [PASSED] YVU420 Max sizes
[23:43:35] [PASSED] YVU420 Invalid pitch
[23:43:35] [PASSED] YVU420 Different pitches
[23:43:35] [PASSED] YVU420 Different buffer offsets/pitches
[23:43:35] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[23:43:35] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[23:43:35] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[23:43:35] [PASSED] YVU420 Valid modifier
[23:43:35] [PASSED] YVU420 Different modifiers per plane
[23:43:35] [PASSED] YVU420 Modifier for inexistent plane
[23:43:35] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[23:43:35] [PASSED] X0L2 Normal sizes
[23:43:35] [PASSED] X0L2 Max sizes
[23:43:35] [PASSED] X0L2 Invalid pitch
[23:43:35] [PASSED] X0L2 Pitch greater than minimum required
[23:43:35] [PASSED] X0L2 Handle for inexistent plane
[23:43:35] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[23:43:35] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[23:43:35] [PASSED] X0L2 Valid modifier
[23:43:35] [PASSED] X0L2 Modifier for inexistent plane
[23:43:35] =========== [PASSED] drm_test_framebuffer_create ===========
[23:43:35] [PASSED] drm_test_framebuffer_free
[23:43:35] [PASSED] drm_test_framebuffer_init
[23:43:35] [PASSED] drm_test_framebuffer_init_bad_format
[23:43:35] [PASSED] drm_test_framebuffer_init_dev_mismatch
[23:43:35] [PASSED] drm_test_framebuffer_lookup
[23:43:35] [PASSED] drm_test_framebuffer_lookup_inexistent
[23:43:35] [PASSED] drm_test_framebuffer_modifiers_not_supported
[23:43:35] ================= [PASSED] drm_framebuffer =================
[23:43:35] ================ drm_gem_shmem (8 subtests) ================
[23:43:35] [PASSED] drm_gem_shmem_test_obj_create
[23:43:35] [PASSED] drm_gem_shmem_test_obj_create_private
[23:43:35] [PASSED] drm_gem_shmem_test_pin_pages
[23:43:35] [PASSED] drm_gem_shmem_test_vmap
[23:43:35] [PASSED] drm_gem_shmem_test_get_sg_table
[23:43:35] [PASSED] drm_gem_shmem_test_get_pages_sgt
[23:43:35] [PASSED] drm_gem_shmem_test_madvise
[23:43:35] [PASSED] drm_gem_shmem_test_purge
[23:43:35] ================== [PASSED] drm_gem_shmem ==================
[23:43:35] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[23:43:35] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[23:43:35] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[23:43:35] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[23:43:35] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[23:43:35] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[23:43:35] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[23:43:35] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[23:43:35] [PASSED] Automatic
[23:43:35] [PASSED] Full
[23:43:35] [PASSED] Limited 16:235
[23:43:35] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[23:43:35] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[23:43:35] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[23:43:35] [PASSED] drm_test_check_disable_connector
[23:43:35] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[23:43:35] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[23:43:35] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[23:43:35] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[23:43:35] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[23:43:35] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[23:43:35] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[23:43:35] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[23:43:35] [PASSED] drm_test_check_output_bpc_dvi
[23:43:35] [PASSED] drm_test_check_output_bpc_format_vic_1
[23:43:35] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[23:43:35] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[23:43:35] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[23:43:35] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[23:43:35] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[23:43:35] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[23:43:35] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[23:43:35] ============ drm_test_check_hdmi_color_format  =============
[23:43:35] [PASSED] AUTO -> RGB
[23:43:35] [PASSED] YCBCR422 -> YUV422
[23:43:35] [PASSED] YCBCR420 -> YUV420
[23:43:35] [PASSED] YCBCR444 -> YUV444
[23:43:35] [PASSED] RGB -> RGB
[23:43:35] ======== [PASSED] drm_test_check_hdmi_color_format =========
[23:43:35] ======== drm_test_check_hdmi_color_format_420_only  ========
[23:43:35] [PASSED] RGB should fail
[23:43:35] [PASSED] YUV444 should fail
[23:43:35] [PASSED] YUV422 should fail
[23:43:35] [PASSED] YUV420 should work
[23:43:35] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[23:43:35] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[23:43:35] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[23:43:35] [PASSED] drm_test_check_broadcast_rgb_value
[23:43:35] [PASSED] drm_test_check_bpc_8_value
[23:43:35] [PASSED] drm_test_check_bpc_10_value
[23:43:35] [PASSED] drm_test_check_bpc_12_value
[23:43:35] [PASSED] drm_test_check_format_value
[23:43:35] [PASSED] drm_test_check_tmds_char_value
[23:43:35] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[23:43:35] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[23:43:35] [PASSED] drm_test_check_mode_valid
[23:43:35] [PASSED] drm_test_check_mode_valid_reject
[23:43:35] [PASSED] drm_test_check_mode_valid_reject_rate
[23:43:35] [PASSED] drm_test_check_mode_valid_reject_max_clock
[23:43:35] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[23:43:35] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[23:43:35] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[23:43:35] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[23:43:35] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[23:43:35] [PASSED] drm_test_check_infoframes
[23:43:35] [PASSED] drm_test_check_reject_avi_infoframe
[23:43:35] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[23:43:35] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[23:43:35] [PASSED] drm_test_check_reject_audio_infoframe
[23:43:35] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[23:43:35] ================= drm_managed (2 subtests) =================
[23:43:35] [PASSED] drm_test_managed_release_action
[23:43:35] [PASSED] drm_test_managed_run_action
[23:43:35] =================== [PASSED] drm_managed ===================
[23:43:35] =================== drm_mm (6 subtests) ====================
[23:43:35] [PASSED] drm_test_mm_init
[23:43:35] [PASSED] drm_test_mm_debug
[23:43:35] [PASSED] drm_test_mm_align32
[23:43:35] [PASSED] drm_test_mm_align64
[23:43:35] [PASSED] drm_test_mm_lowest
[23:43:35] [PASSED] drm_test_mm_highest
[23:43:35] ===================== [PASSED] drm_mm ======================
[23:43:35] ============= drm_modes_analog_tv (5 subtests) =============
[23:43:35] [PASSED] drm_test_modes_analog_tv_mono_576i
[23:43:35] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[23:43:35] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[23:43:35] [PASSED] drm_test_modes_analog_tv_pal_576i
[23:43:35] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[23:43:35] =============== [PASSED] drm_modes_analog_tv ===============
[23:43:35] ============== drm_panic_helper (3 subtests) ===============
[23:43:35] ============= drm_test_panic_screen_user_map  ==============
[23:43:35] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[23:43:35] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[23:43:35] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[23:43:35] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[23:43:35] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[23:43:35] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[23:43:35] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[23:43:35] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[23:43:35] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[23:43:35] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[23:43:35] ========= [PASSED] drm_test_panic_screen_user_map ==========
[23:43:35] ============= drm_test_panic_screen_user_page  =============
[23:43:35] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[23:43:35] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[23:43:35] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[23:43:35] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[23:43:35] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[23:43:35] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[23:43:35] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[23:43:35] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[23:43:35] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[23:43:35] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[23:43:35] ========= [PASSED] drm_test_panic_screen_user_page =========
[23:43:35] ========== drm_test_panic_screen_user_set_pixel  ===========
[23:43:35] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[23:43:35] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[23:43:35] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[23:43:35] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[23:43:35] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[23:43:35] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[23:43:35] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[23:43:35] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[23:43:35] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[23:43:35] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[23:43:35] ====== [PASSED] drm_test_panic_screen_user_set_pixel =======
[23:43:35] ================ [PASSED] drm_panic_helper =================
[23:43:35] ============== drm_plane_helper (2 subtests) ===============
[23:43:35] =============== drm_test_check_plane_state  ================
[23:43:35] [PASSED] clipping_simple
[23:43:35] [PASSED] clipping_rotate_reflect
[23:43:35] [PASSED] positioning_simple
[23:43:35] [PASSED] upscaling
[23:43:35] [PASSED] downscaling
[23:43:35] [PASSED] rounding1
[23:43:35] [PASSED] rounding2
[23:43:35] [PASSED] rounding3
[23:43:35] [PASSED] rounding4
[23:43:35] =========== [PASSED] drm_test_check_plane_state ============
[23:43:35] =========== drm_test_check_invalid_plane_state  ============
[23:43:35] [PASSED] positioning_invalid
[23:43:35] [PASSED] upscaling_invalid
[23:43:35] [PASSED] downscaling_invalid
[23:43:35] ======= [PASSED] drm_test_check_invalid_plane_state ========
[23:43:35] ================ [PASSED] drm_plane_helper =================
[23:43:35] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[23:43:35] ====== drm_test_connector_helper_tv_get_modes_check  =======
[23:43:35] [PASSED] None
[23:43:35] [PASSED] PAL
[23:43:35] [PASSED] NTSC
[23:43:35] [PASSED] Both, NTSC Default
[23:43:35] [PASSED] Both, PAL Default
[23:43:35] [PASSED] Both, NTSC Default, with PAL on command-line
[23:43:35] [PASSED] Both, PAL Default, with NTSC on command-line
[23:43:35] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[23:43:35] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[23:43:35] ================== drm_rect (9 subtests) ===================
[23:43:35] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[23:43:35] [PASSED] drm_test_rect_clip_scaled_not_clipped
[23:43:35] [PASSED] drm_test_rect_clip_scaled_clipped
[23:43:35] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[23:43:35] ================= drm_test_rect_intersect  =================
[23:43:35] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[23:43:35] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[23:43:35] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[23:43:35] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[23:43:35] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[23:43:35] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[23:43:35] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[23:43:35] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[23:43:35] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[23:43:35] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[23:43:35] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[23:43:35] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[23:43:35] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[23:43:35] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[23:43:35] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[23:43:35] ============= [PASSED] drm_test_rect_intersect =============
[23:43:35] ================ drm_test_rect_calc_hscale  ================
[23:43:35] [PASSED] normal use
[23:43:35] [PASSED] out of max range
[23:43:35] [PASSED] out of min range
[23:43:35] [PASSED] zero dst
[23:43:35] [PASSED] negative src
[23:43:35] [PASSED] negative dst
[23:43:35] ============ [PASSED] drm_test_rect_calc_hscale ============
[23:43:35] ================ drm_test_rect_calc_vscale  ================
[23:43:35] [PASSED] normal use
[23:43:35] [PASSED] out of max range
[23:43:35] [PASSED] out of min range
[23:43:35] [PASSED] zero dst
[23:43:35] [PASSED] negative src
[23:43:35] [PASSED] negative dst
[23:43:35] ============ [PASSED] drm_test_rect_calc_vscale ============
[23:43:35] ================== drm_test_rect_rotate  ===================
[23:43:35] [PASSED] reflect-x
[23:43:35] [PASSED] reflect-y
[23:43:35] [PASSED] rotate-0
[23:43:35] [PASSED] rotate-90
[23:43:35] [PASSED] rotate-180
[23:43:35] [PASSED] rotate-270
[23:43:35] ============== [PASSED] drm_test_rect_rotate ===============
[23:43:35] ================ drm_test_rect_rotate_inv  =================
[23:43:35] [PASSED] reflect-x
[23:43:35] [PASSED] reflect-y
[23:43:35] [PASSED] rotate-0
[23:43:35] [PASSED] rotate-90
[23:43:35] [PASSED] rotate-180
[23:43:35] [PASSED] rotate-270
[23:43:35] ============ [PASSED] drm_test_rect_rotate_inv =============
[23:43:35] ==================== [PASSED] drm_rect =====================
[23:43:35] ============ drm_sysfb_modeset_test (1 subtest) ============
[23:43:35] ============ drm_test_sysfb_build_fourcc_list  =============
[23:43:35] [PASSED] no native formats
[23:43:35] [PASSED] XRGB8888 as native format
[23:43:35] [PASSED] remove duplicates
[23:43:35] [PASSED] convert alpha formats
[23:43:35] [PASSED] random formats
[23:43:35] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[23:43:35] ============= [PASSED] drm_sysfb_modeset_test ==============
[23:43:35] ================== drm_fixp (2 subtests) ===================
[23:43:35] [PASSED] drm_test_int2fixp
[23:43:35] [PASSED] drm_test_sm2fixp
[23:43:35] ==================== [PASSED] drm_fixp =====================
[23:43:35] ============================================================
[23:43:35] Testing complete. Ran 667 tests: passed: 667
[23:43:35] Elapsed time: 28.020s total, 2.506s configuring, 25.199s building, 0.292s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[23:43:35] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:43:37] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[23:43:48] Starting KUnit Kernel (1/1)...
[23:43:48] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:43:48] ================= ttm_device (5 subtests) ==================
[23:43:48] [PASSED] ttm_device_init_basic
[23:43:48] [PASSED] ttm_device_init_multiple
[23:43:48] [PASSED] ttm_device_fini_basic
[23:43:48] [PASSED] ttm_device_init_no_vma_man
[23:43:48] ================== ttm_device_init_pools  ==================
[23:43:48] [PASSED] No DMA allocations, no DMA32 required
[23:43:48] [PASSED] DMA allocations, DMA32 required
[23:43:48] [PASSED] No DMA allocations, DMA32 required
[23:43:48] [PASSED] DMA allocations, no DMA32 required
[23:43:48] ============== [PASSED] ttm_device_init_pools ==============
[23:43:48] =================== [PASSED] ttm_device ====================
[23:43:48] ================== ttm_pool (8 subtests) ===================
[23:43:48] ================== ttm_pool_alloc_basic  ===================
[23:43:48] [PASSED] One page
[23:43:48] [PASSED] More than one page
[23:43:48] [PASSED] Above the allocation limit
[23:43:48] [PASSED] One page, with coherent DMA mappings enabled
[23:43:48] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[23:43:48] ============== [PASSED] ttm_pool_alloc_basic ===============
[23:43:48] ============== ttm_pool_alloc_basic_dma_addr  ==============
[23:43:48] [PASSED] One page
[23:43:48] [PASSED] More than one page
[23:43:48] [PASSED] Above the allocation limit
[23:43:48] [PASSED] One page, with coherent DMA mappings enabled
[23:43:48] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[23:43:48] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[23:43:48] [PASSED] ttm_pool_alloc_order_caching_match
[23:43:48] [PASSED] ttm_pool_alloc_caching_mismatch
[23:43:48] [PASSED] ttm_pool_alloc_order_mismatch
[23:43:48] [PASSED] ttm_pool_free_dma_alloc
[23:43:48] [PASSED] ttm_pool_free_no_dma_alloc
[23:43:48] [ERROR] Test: ttm_pool: missing expected subtest!
[23:43:48] 
[23:43:48] Pid: 80, comm: kunit_try_catch Tainted: G        W        N  7.4.0-rc4-ge4c090671b17
[23:43:48] RIP: 0033:list_lru_count_node+0xe/0x20
[23:43:48] RSP: 00000000cb0dbef8  EFLAGS: 00010246
[23:43:48] RAX: 0000000000000001 RBX: 00000000cb003c90 RCX: 0000000000000021
[23:43:48] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 000000008b053030
[23:43:48] RBP: 000000008b053000 R08: 00000000cb0dbe98 R09: 0000000000000000
[23:43:48] R10: 00000000c9b51a60 R11: 0000000000000000 R12: 0000000060121160
[23:43:48] R13: 000000008b053030 R14: 000000006046f0e0 R15: 00000000604ba488
[23:43:48] Kernel panic - not syncing: Segfault with no mm
[23:43:48] [CRASHED] 
[23:43:48] [ERROR] Test: ttm_pool: missing subtest result line!
[23:43:48] # module: ttm_pool_test
[23:43:48] ==================== [CRASHED] ttm_pool ====================
[23:43:48] [ERROR] Test: main: missing expected subtest!
[23:43:48] [CRASHED] 
[23:43:48] [ERROR] Test: main: missing expected subtest!
[23:43:48] [CRASHED] 
[23:43:48] [ERROR] Test: main: missing expected subtest!
[23:43:48] [CRASHED] 
[23:43:48] [ERROR] Test: main: missing expected subtest!
[23:43:48] [CRASHED] 
[23:43:48] ============================================================
[23:43:48] Testing complete. Ran 28 tests: passed: 23, crashed: 5, errors: 6
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
[23:43:48] Elapsed time: 12.937s total, 2.532s configuring, 10.139s building, 0.266s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


