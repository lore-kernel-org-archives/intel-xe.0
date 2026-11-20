Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB1960A2604
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 03:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C00D10E705;
	Fri, 20 Nov 2026 03:19:20 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD6710E5E3;
 Fri, 20 Nov 2026 03:19:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Add_support_for_a_DRM_backligh?=
 =?utf-8?q?t_capability?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mario Limonciello" <mario.limonciello@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Nov 2026 03:19:15 -0000
Message-ID: <179514475570.56288.14531078399487264699@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261119-superm1-backlight-property-v12-0-89d5217d3618@amd.com>
In-Reply-To: <20261119-superm1-backlight-property-v12-0-89d5217d3618@amd.com>
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

Series: Add support for a DRM backlight capability
URL   : https://patchwork.freedesktop.org/series/179150/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[03:17:36] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[03:17:41] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[03:18:02] Starting KUnit Kernel (1/1)...
[03:18:02] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[03:18:02] ================= gpu_buddy (15 subtests) ==================
[03:18:02] [PASSED] gpu_test_buddy_alloc_limit
[03:18:02] [PASSED] gpu_test_buddy_alloc_optimistic
[03:18:02] [PASSED] gpu_test_buddy_alloc_pessimistic
[03:18:02] [PASSED] gpu_test_buddy_alloc_pathological
[03:18:02] [PASSED] gpu_test_buddy_alloc_contiguous
[03:18:02] [PASSED] gpu_test_buddy_alloc_clear
[03:18:02] [PASSED] gpu_test_buddy_alloc_range
[03:18:02] [PASSED] gpu_test_buddy_alloc_range_bias
[03:18:02] [PASSED] gpu_test_buddy_alloc_range_clear_guard
[03:18:03] [PASSED] gpu_test_buddy_fragmentation_performance
[03:18:04] [PASSED] gpu_test_buddy_dirty_tracker_performance
[03:18:04] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[03:18:04] [PASSED] gpu_test_buddy_offset_aligned_allocation
[03:18:04] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[03:18:04] [PASSED] gpu_test_buddy_addr_to_block
[03:18:04] ==================== [PASSED] gpu_buddy ====================
[03:18:04] ============================================================
[03:18:04] Testing complete. Ran 15 tests: passed: 15
[03:18:04] Elapsed time: 27.985s total, 5.186s configuring, 20.731s building, 1.992s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[03:18:04] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[03:18:06] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[03:18:45] Starting KUnit Kernel (1/1)...
[03:18:45] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[03:18:45] ================= xe_ggtt_iov (9 subtests) =================
[03:18:45] [PASSED] init_shared_pf
[03:18:45] [PASSED] init_partial_overlap
[03:18:45] [PASSED] alloc_usable_pool_low
[03:18:45] [PASSED] alloc_shareable_pool_high
[03:18:45] [PASSED] alloc_partial_overlap
[03:18:45] [PASSED] alloc_partial_overlap_usable_full
[03:18:45] [PASSED] alloc_partial_overlap_shareable_full
[03:18:45] [PASSED] alloc_shareable_pool_unavailable
[03:18:45] [PASSED] alloc_shareable_pool_oversized
[03:18:45] =================== [PASSED] xe_ggtt_iov ===================
[03:18:45] =================== xe_ggtt (3 subtests) ===================
[03:18:45] [PASSED] init_native
[03:18:45] [PASSED] alloc_usable_pool_native
[03:18:45] [PASSED] alloc_usable_pool_oversized
[03:18:45] ===================== [PASSED] xe_ggtt =====================
[03:18:45] ================== guc_buf (11 subtests) ===================
[03:18:45] [PASSED] test_smallest
[03:18:45] [PASSED] test_largest
[03:18:45] [PASSED] test_granular
[03:18:45] [PASSED] test_unique
[03:18:45] [PASSED] test_overlap
[03:18:45] [PASSED] test_reusable
[03:18:45] [PASSED] test_too_big
[03:18:45] [PASSED] test_flush
[03:18:45] [PASSED] test_lookup
[03:18:45] [PASSED] test_data
[03:18:45] [PASSED] test_class
[03:18:45] ===================== [PASSED] guc_buf =====================
[03:18:45] =================== guc_dbm (7 subtests) ===================
[03:18:45] [PASSED] test_empty
[03:18:45] [PASSED] test_default
[03:18:45] ======================== test_size  ========================
[03:18:45] [PASSED] 4
[03:18:45] [PASSED] 8
[03:18:45] [PASSED] 32
[03:18:45] [PASSED] 256
[03:18:45] ==================== [PASSED] test_size ====================
[03:18:45] ======================= test_reuse  ========================
[03:18:45] [PASSED] 4
[03:18:45] [PASSED] 8
[03:18:45] [PASSED] 32
[03:18:45] [PASSED] 256
[03:18:45] =================== [PASSED] test_reuse ====================
[03:18:45] =================== test_range_overlap  ====================
[03:18:45] [PASSED] 4
[03:18:45] [PASSED] 8
[03:18:45] [PASSED] 32
[03:18:45] [PASSED] 256
[03:18:45] =============== [PASSED] test_range_overlap ================
[03:18:45] =================== test_range_compact  ====================
[03:18:45] [PASSED] 4
[03:18:45] [PASSED] 8
[03:18:45] [PASSED] 32
[03:18:45] [PASSED] 256
[03:18:45] =============== [PASSED] test_range_compact ================
[03:18:45] ==================== test_range_spare  =====================
[03:18:45] [PASSED] 4
[03:18:45] [PASSED] 8
[03:18:45] [PASSED] 32
[03:18:45] [PASSED] 256
[03:18:45] ================ [PASSED] test_range_spare =================
[03:18:45] ===================== [PASSED] guc_dbm =====================
[03:18:45] ================== guc_idm (22 subtests) ===================
[03:18:45] [PASSED] bad_init
[03:18:45] [PASSED] no_init
[03:18:45] [PASSED] init_fini
[03:18:45] [PASSED] check_init_small
[03:18:45] [PASSED] check_init_shared
[03:18:45] [PASSED] check_used
[03:18:45] [PASSED] check_quota
[03:18:45] [PASSED] check_all
[03:18:45] [PASSED] check_limits
[03:18:45] [PASSED] check_overlap
[03:18:45] [PASSED] check_overlap_alloc
[03:18:45] [PASSED] check_overlap_release
[03:18:45] [PASSED] check_overlap_partial_init
[03:18:45] [PASSED] check_overlap_partial_shared_range_blocking
[03:18:45] [PASSED] check_used_usable
[03:18:45] [PASSED] check_used_shareable
[03:18:45] [PASSED] check_used_mixed
[03:18:45] [PASSED] check_release_usable_range
[03:18:45] [PASSED] check_release_shareable_range
[03:18:45] [PASSED] check_split_boundaries
[03:18:45] [PASSED] check_shareable_spare
[03:18:45] [PASSED] check_shareable_spare_fragmented_tail
[03:18:45] ===================== [PASSED] guc_idm =====================
[03:18:45] ============== guc_klv_helpers (13 subtests) ===============
[03:18:45] [PASSED] test_count
[03:18:45] [PASSED] test_encode_u32
[03:18:45] [PASSED] test_encode_u64
[03:18:45] [PASSED] test_encode_string
[03:18:45] [PASSED] test_encode_object_raw
[03:18:45] [PASSED] test_encode_object_klv
[03:18:45] [PASSED] test_encode_object_nested
[03:18:45] [PASSED] test_encode_object_basic
[03:18:45] ===================== test_decode_u16  =====================
[03:18:45] [PASSED] empty
[03:18:45] [PASSED] valid
[03:18:45] [PASSED] max
[03:18:45] [PASSED] big
[03:18:45] [PASSED] long
[03:18:45] ================= [PASSED] test_decode_u16 =================
[03:18:45] ===================== test_decode_u32  =====================
[03:18:45] [PASSED] empty
[03:18:45] [PASSED] valid
[03:18:45] [PASSED] max
[03:18:45] [PASSED] long
[03:18:45] ================= [PASSED] test_decode_u32 =================
[03:18:45] ===================== test_decode_u64  =====================
[03:18:45] [PASSED] empty
[03:18:45] [PASSED] short
[03:18:45] [PASSED] valid
[03:18:45] [PASSED] max
[03:18:45] [PASSED] long
[03:18:45] ================= [PASSED] test_decode_u64 =================
[03:18:45] ===================== test_decode_str  =====================
[03:18:45] [PASSED] empty
[03:18:45] [PASSED] one
[03:18:45] [PASSED] one_trash
[03:18:45] [PASSED] two
[03:18:45] [PASSED] two_trash
[03:18:45] [PASSED] three
[03:18:45] [PASSED] dword
[03:18:45] [PASSED] four
[03:18:45] [PASSED] five
[03:18:45] [PASSED] six
[03:18:45] [PASSED] seven
[03:18:45] [PASSED] qword
[03:18:45] ================= [PASSED] test_decode_str =================
[03:18:45] [PASSED] test_print
[03:18:45] ================= [PASSED] guc_klv_helpers =================
[03:18:45] =================== xe_log (4 subtests) ====================
[03:18:45] [PASSED] demo_cper
[03:18:45] [PASSED] demo_dmesg
[03:18:45] ======================= test_dmesg  ========================
[03:18:45] [PASSED] test_fatal
[03:18:45] [PASSED] test_fatal_tile
[03:18:45] [PASSED] test_fatal_gt
[03:18:45] [PASSED] test_fatal_comp
[03:18:45] [PASSED] test_fatal_comp_tile
[03:18:45] [PASSED] test_fatal_comp_gt
[03:18:45] [PASSED] test_fatal_all
[03:18:45] [PASSED] test_recoverable
[03:18:45] [PASSED] test_recoverable_tile
[03:18:45] [PASSED] test_recoverable_gt
[03:18:45] [PASSED] test_recoverable_comp
[03:18:45] [PASSED] test_recoverable_comp_tile
[03:18:45] [PASSED] test_recoverable_comp_gt
[03:18:45] [PASSED] test_recoverable_all
[03:18:45] [PASSED] test_info
[03:18:45] [PASSED] test_info_tile
[03:18:45] [PASSED] test_info_gt
[03:18:45] [PASSED] test_info_err
[03:18:45] [PASSED] test_info_comp
[03:18:45] [PASSED] test_info_comp_tile
[03:18:45] [PASSED] test_info_comp_gt
[03:18:45] [PASSED] test_info_all
[03:18:45] [PASSED] test_hw_fatal
[03:18:45] [PASSED] test_hw_recoverable
[03:18:45] [PASSED] test_hw_corrected
[03:18:45] [PASSED] test_hw_informational
[03:18:45] =================== [PASSED] test_dmesg ====================
[03:18:45] ====================== test_invalid  =======================
[03:18:45] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[03:18:45] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[03:18:45] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[03:18:45] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[03:18:45] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[03:18:45] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[03:18:45] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[03:18:45] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[03:18:45] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[03:18:45] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[03:18:45] ================== [SKIPPED] test_invalid ==================
[03:18:45] ===================== [PASSED] xe_log ======================
[03:18:45] ================== no_relay (3 subtests) ===================
[03:18:45] [PASSED] xe_drops_guc2pf_if_not_ready
[03:18:45] [PASSED] xe_drops_guc2vf_if_not_ready
[03:18:45] [PASSED] xe_rejects_send_if_not_ready
[03:18:45] ==================== [PASSED] no_relay =====================
[03:18:45] ================== pf_relay (14 subtests) ==================
[03:18:45] [PASSED] pf_rejects_guc2pf_too_short
[03:18:45] [PASSED] pf_rejects_guc2pf_too_long
[03:18:45] [PASSED] pf_rejects_guc2pf_no_payload
[03:18:45] [PASSED] pf_fails_no_payload
[03:18:45] [PASSED] pf_fails_bad_origin
[03:18:45] [PASSED] pf_fails_bad_type
[03:18:45] [PASSED] pf_txn_reports_error
[03:18:45] [PASSED] pf_txn_sends_pf2guc
[03:18:45] [PASSED] pf_sends_pf2guc
[03:18:45] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[03:18:45] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[03:18:45] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[03:18:45] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[03:18:45] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[03:18:45] ==================== [PASSED] pf_relay =====================
[03:18:45] ================== vf_relay (3 subtests) ===================
[03:18:45] [PASSED] vf_rejects_guc2vf_too_short
[03:18:45] [PASSED] vf_rejects_guc2vf_too_long
[03:18:45] [PASSED] vf_rejects_guc2vf_no_payload
[03:18:45] ==================== [PASSED] vf_relay =====================
[03:18:45] ================ pf_gt_config (9 subtests) =================
[03:18:45] [PASSED] fair_contexts_1vf
[03:18:45] [PASSED] fair_doorbells_1vf
[03:18:45] [PASSED] fair_ggtt_1vf
[03:18:45] ====================== fair_vram_1vf  ======================
[03:18:45] [PASSED] 3.50 GiB
[03:18:45] [PASSED] 11.5 GiB
[03:18:45] [PASSED] 15.5 GiB
[03:18:45] [PASSED] 31.5 GiB
[03:18:45] [PASSED] 63.5 GiB
[03:18:45] [PASSED] 1.91 GiB
[03:18:45] ================== [PASSED] fair_vram_1vf ==================
[03:18:45] ================ fair_vram_1vf_admin_only  =================
[03:18:45] [PASSED] 3.50 GiB
[03:18:45] [PASSED] 11.5 GiB
[03:18:45] [PASSED] 15.5 GiB
[03:18:45] [PASSED] 31.5 GiB
[03:18:45] [PASSED] 63.5 GiB
[03:18:45] [PASSED] 1.91 GiB
[03:18:45] ============ [PASSED] fair_vram_1vf_admin_only =============
[03:18:45] ====================== fair_contexts  ======================
[03:18:45] [PASSED] 1 VF
[03:18:45] [PASSED] 2 VFs
[03:18:45] [PASSED] 3 VFs
[03:18:45] [PASSED] 4 VFs
[03:18:45] [PASSED] 5 VFs
[03:18:45] [PASSED] 6 VFs
[03:18:45] [PASSED] 7 VFs
[03:18:45] [PASSED] 8 VFs
[03:18:45] [PASSED] 9 VFs
[03:18:45] [PASSED] 10 VFs
[03:18:45] [PASSED] 11 VFs
[03:18:45] [PASSED] 12 VFs
[03:18:45] [PASSED] 13 VFs
[03:18:45] [PASSED] 14 VFs
[03:18:45] [PASSED] 15 VFs
[03:18:45] [PASSED] 16 VFs
[03:18:45] [PASSED] 17 VFs
[03:18:45] [PASSED] 18 VFs
[03:18:45] [PASSED] 19 VFs
[03:18:45] [PASSED] 20 VFs
[03:18:45] [PASSED] 21 VFs
[03:18:45] [PASSED] 22 VFs
[03:18:45] [PASSED] 23 VFs
[03:18:45] [PASSED] 24 VFs
[03:18:45] [PASSED] 25 VFs
[03:18:45] [PASSED] 26 VFs
[03:18:45] [PASSED] 27 VFs
[03:18:45] [PASSED] 28 VFs
[03:18:45] [PASSED] 29 VFs
[03:18:45] [PASSED] 30 VFs
[03:18:45] [PASSED] 31 VFs
[03:18:45] [PASSED] 32 VFs
[03:18:45] [PASSED] 33 VFs
[03:18:45] [PASSED] 34 VFs
[03:18:45] [PASSED] 35 VFs
[03:18:45] [PASSED] 36 VFs
[03:18:45] [PASSED] 37 VFs
[03:18:45] [PASSED] 38 VFs
[03:18:45] [PASSED] 39 VFs
[03:18:45] [PASSED] 40 VFs
[03:18:45] [PASSED] 41 VFs
[03:18:45] [PASSED] 42 VFs
[03:18:45] [PASSED] 43 VFs
[03:18:45] [PASSED] 44 VFs
[03:18:45] [PASSED] 45 VFs
[03:18:45] [PASSED] 46 VFs
[03:18:45] [PASSED] 47 VFs
[03:18:45] [PASSED] 48 VFs
[03:18:45] [PASSED] 49 VFs
[03:18:45] [PASSED] 50 VFs
[03:18:45] [PASSED] 51 VFs
[03:18:45] [PASSED] 52 VFs
[03:18:45] [PASSED] 53 VFs
[03:18:45] [PASSED] 54 VFs
[03:18:45] [PASSED] 55 VFs
[03:18:45] [PASSED] 56 VFs
[03:18:45] [PASSED] 57 VFs
[03:18:45] [PASSED] 58 VFs
[03:18:45] [PASSED] 59 VFs
[03:18:45] [PASSED] 60 VFs
[03:18:45] [PASSED] 61 VFs
[03:18:45] [PASSED] 62 VFs
[03:18:45] [PASSED] 63 VFs
[03:18:45] ================== [PASSED] fair_contexts ==================
[03:18:45] ===================== fair_doorbells  ======================
[03:18:45] [PASSED] 1 VF
[03:18:45] [PASSED] 2 VFs
[03:18:45] [PASSED] 3 VFs
[03:18:45] [PASSED] 4 VFs
[03:18:45] [PASSED] 5 VFs
[03:18:45] [PASSED] 6 VFs
[03:18:45] [PASSED] 7 VFs
[03:18:45] [PASSED] 8 VFs
[03:18:45] [PASSED] 9 VFs
[03:18:45] [PASSED] 10 VFs
[03:18:45] [PASSED] 11 VFs
[03:18:45] [PASSED] 12 VFs
[03:18:45] [PASSED] 13 VFs
[03:18:45] [PASSED] 14 VFs
[03:18:45] [PASSED] 15 VFs
[03:18:45] [PASSED] 16 VFs
[03:18:45] [PASSED] 17 VFs
[03:18:45] [PASSED] 18 VFs
[03:18:45] [PASSED] 19 VFs
[03:18:45] [PASSED] 20 VFs
[03:18:45] [PASSED] 21 VFs
[03:18:45] [PASSED] 22 VFs
[03:18:45] [PASSED] 23 VFs
[03:18:45] [PASSED] 24 VFs
[03:18:45] [PASSED] 25 VFs
[03:18:45] [PASSED] 26 VFs
[03:18:45] [PASSED] 27 VFs
[03:18:45] [PASSED] 28 VFs
[03:18:45] [PASSED] 29 VFs
[03:18:45] [PASSED] 30 VFs
[03:18:45] [PASSED] 31 VFs
[03:18:45] [PASSED] 32 VFs
[03:18:45] [PASSED] 33 VFs
[03:18:45] [PASSED] 34 VFs
[03:18:45] [PASSED] 35 VFs
[03:18:45] [PASSED] 36 VFs
[03:18:45] [PASSED] 37 VFs
[03:18:45] [PASSED] 38 VFs
[03:18:45] [PASSED] 39 VFs
[03:18:45] [PASSED] 40 VFs
[03:18:45] [PASSED] 41 VFs
[03:18:45] [PASSED] 42 VFs
[03:18:45] [PASSED] 43 VFs
[03:18:45] [PASSED] 44 VFs
[03:18:45] [PASSED] 45 VFs
[03:18:46] [PASSED] 46 VFs
[03:18:46] [PASSED] 47 VFs
[03:18:46] [PASSED] 48 VFs
[03:18:46] [PASSED] 49 VFs
[03:18:46] [PASSED] 50 VFs
[03:18:46] [PASSED] 51 VFs
[03:18:46] [PASSED] 52 VFs
[03:18:46] [PASSED] 53 VFs
[03:18:46] [PASSED] 54 VFs
[03:18:46] [PASSED] 55 VFs
[03:18:46] [PASSED] 56 VFs
[03:18:46] [PASSED] 57 VFs
[03:18:46] [PASSED] 58 VFs
[03:18:46] [PASSED] 59 VFs
[03:18:46] [PASSED] 60 VFs
[03:18:46] [PASSED] 61 VFs
[03:18:46] [PASSED] 62 VFs
[03:18:46] [PASSED] 63 VFs
[03:18:46] ================= [PASSED] fair_doorbells ==================
[03:18:46] ======================== fair_ggtt  ========================
[03:18:46] [PASSED] 1 VF
[03:18:46] [PASSED] 2 VFs
[03:18:46] [PASSED] 3 VFs
[03:18:46] [PASSED] 4 VFs
[03:18:46] [PASSED] 5 VFs
[03:18:46] [PASSED] 6 VFs
[03:18:46] [PASSED] 7 VFs
[03:18:46] [PASSED] 8 VFs
[03:18:46] [PASSED] 9 VFs
[03:18:46] [PASSED] 10 VFs
[03:18:46] [PASSED] 11 VFs
[03:18:46] [PASSED] 12 VFs
[03:18:46] [PASSED] 13 VFs
[03:18:46] [PASSED] 14 VFs
[03:18:46] [PASSED] 15 VFs
[03:18:46] [PASSED] 16 VFs
[03:18:46] [PASSED] 17 VFs
[03:18:46] [PASSED] 18 VFs
[03:18:46] [PASSED] 19 VFs
[03:18:46] [PASSED] 20 VFs
[03:18:46] [PASSED] 21 VFs
[03:18:46] [PASSED] 22 VFs
[03:18:46] [PASSED] 23 VFs
[03:18:46] [PASSED] 24 VFs
[03:18:46] [PASSED] 25 VFs
[03:18:46] [PASSED] 26 VFs
[03:18:46] [PASSED] 27 VFs
[03:18:46] [PASSED] 28 VFs
[03:18:46] [PASSED] 29 VFs
[03:18:46] [PASSED] 30 VFs
[03:18:46] [PASSED] 31 VFs
[03:18:46] [PASSED] 32 VFs
[03:18:46] [PASSED] 33 VFs
[03:18:46] [PASSED] 34 VFs
[03:18:46] [PASSED] 35 VFs
[03:18:46] [PASSED] 36 VFs
[03:18:46] [PASSED] 37 VFs
[03:18:46] [PASSED] 38 VFs
[03:18:46] [PASSED] 39 VFs
[03:18:46] [PASSED] 40 VFs
[03:18:46] [PASSED] 41 VFs
[03:18:46] [PASSED] 42 VFs
[03:18:46] [PASSED] 43 VFs
[03:18:46] [PASSED] 44 VFs
[03:18:46] [PASSED] 45 VFs
[03:18:46] [PASSED] 46 VFs
[03:18:46] [PASSED] 47 VFs
[03:18:46] [PASSED] 48 VFs
[03:18:46] [PASSED] 49 VFs
[03:18:46] [PASSED] 50 VFs
[03:18:46] [PASSED] 51 VFs
[03:18:46] [PASSED] 52 VFs
[03:18:46] [PASSED] 53 VFs
[03:18:46] [PASSED] 54 VFs
[03:18:46] [PASSED] 55 VFs
[03:18:46] [PASSED] 56 VFs
[03:18:46] [PASSED] 57 VFs
[03:18:46] [PASSED] 58 VFs
[03:18:46] [PASSED] 59 VFs
[03:18:46] [PASSED] 60 VFs
[03:18:46] [PASSED] 61 VFs
[03:18:46] [PASSED] 62 VFs
[03:18:46] [PASSED] 63 VFs
[03:18:46] ==================== [PASSED] fair_ggtt ====================
[03:18:46] ======================== fair_vram  ========================
[03:18:46] [PASSED] 1 VF
[03:18:46] [PASSED] 2 VFs
[03:18:46] [PASSED] 3 VFs
[03:18:46] [PASSED] 4 VFs
[03:18:46] [PASSED] 5 VFs
[03:18:46] [PASSED] 6 VFs
[03:18:46] [PASSED] 7 VFs
[03:18:46] [PASSED] 8 VFs
[03:18:46] [PASSED] 9 VFs
[03:18:46] [PASSED] 10 VFs
[03:18:46] [PASSED] 11 VFs
[03:18:46] [PASSED] 12 VFs
[03:18:46] [PASSED] 13 VFs
[03:18:46] [PASSED] 14 VFs
[03:18:46] [PASSED] 15 VFs
[03:18:46] [PASSED] 16 VFs
[03:18:46] [PASSED] 17 VFs
[03:18:46] [PASSED] 18 VFs
[03:18:46] [PASSED] 19 VFs
[03:18:46] [PASSED] 20 VFs
[03:18:46] [PASSED] 21 VFs
[03:18:46] [PASSED] 22 VFs
[03:18:46] [PASSED] 23 VFs
[03:18:46] [PASSED] 24 VFs
[03:18:46] [PASSED] 25 VFs
[03:18:46] [PASSED] 26 VFs
[03:18:46] [PASSED] 27 VFs
[03:18:46] [PASSED] 28 VFs
[03:18:46] [PASSED] 29 VFs
[03:18:46] [PASSED] 30 VFs
[03:18:46] [PASSED] 31 VFs
[03:18:46] [PASSED] 32 VFs
[03:18:46] [PASSED] 33 VFs
[03:18:46] [PASSED] 34 VFs
[03:18:46] [PASSED] 35 VFs
[03:18:46] [PASSED] 36 VFs
[03:18:46] [PASSED] 37 VFs
[03:18:46] [PASSED] 38 VFs
[03:18:46] [PASSED] 39 VFs
[03:18:46] [PASSED] 40 VFs
[03:18:46] [PASSED] 41 VFs
[03:18:46] [PASSED] 42 VFs
[03:18:46] [PASSED] 43 VFs
[03:18:46] [PASSED] 44 VFs
[03:18:46] [PASSED] 45 VFs
[03:18:46] [PASSED] 46 VFs
[03:18:46] [PASSED] 47 VFs
[03:18:46] [PASSED] 48 VFs
[03:18:46] [PASSED] 49 VFs
[03:18:46] [PASSED] 50 VFs
[03:18:46] [PASSED] 51 VFs
[03:18:46] [PASSED] 52 VFs
[03:18:46] [PASSED] 53 VFs
[03:18:46] [PASSED] 54 VFs
[03:18:46] [PASSED] 55 VFs
[03:18:46] [PASSED] 56 VFs
[03:18:46] [PASSED] 57 VFs
[03:18:46] [PASSED] 58 VFs
[03:18:46] [PASSED] 59 VFs
[03:18:46] [PASSED] 60 VFs
[03:18:46] [PASSED] 61 VFs
[03:18:46] [PASSED] 62 VFs
[03:18:46] [PASSED] 63 VFs
[03:18:46] ==================== [PASSED] fair_vram ====================
[03:18:46] ================== [PASSED] pf_gt_config ===================
[03:18:46] ===================== lmtt (1 subtest) =====================
[03:18:46] ======================== test_ops  =========================
[03:18:46] [PASSED] 2-level
[03:18:46] [PASSED] multi-level
[03:18:46] ==================== [PASSED] test_ops =====================
[03:18:46] ====================== [PASSED] lmtt =======================
[03:18:46] ================= sriov_packet (1 subtest) =================
[03:18:46] [PASSED] test_descriptor_init
[03:18:46] ================== [PASSED] sriov_packet ===================
[03:18:46] ================= pf_service (11 subtests) =================
[03:18:46] [PASSED] pf_negotiate_any
[03:18:46] [PASSED] pf_negotiate_base_match
[03:18:46] [PASSED] pf_negotiate_base_newer
[03:18:46] [PASSED] pf_negotiate_base_next
[03:18:46] [SKIPPED] pf_negotiate_base_older (no older minor)
[03:18:46] [PASSED] pf_negotiate_base_prev
[03:18:46] [PASSED] pf_negotiate_latest_match
[03:18:46] [PASSED] pf_negotiate_latest_newer
[03:18:46] [PASSED] pf_negotiate_latest_next
[03:18:46] [SKIPPED] pf_negotiate_latest_older (no older minor)
[03:18:46] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[03:18:46] =================== [PASSED] pf_service ====================
[03:18:46] ================= xe_guc_g2g (2 subtests) ==================
[03:18:46] ============== xe_live_guc_g2g_kunit_default  ==============
[03:18:46] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[03:18:46] ============== xe_live_guc_g2g_kunit_allmem  ===============
[03:18:46] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[03:18:46] =================== [SKIPPED] xe_guc_g2g ===================
[03:18:46] =================== xe_mocs (2 subtests) ===================
[03:18:46] ================ xe_live_mocs_kernel_kunit  ================
[03:18:46] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[03:18:46] ================ xe_live_mocs_reset_kunit  =================
[03:18:46] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[03:18:46] ==================== [SKIPPED] xe_mocs =====================
[03:18:46] ================= xe_migrate (3 subtests) ==================
[03:18:46] ================= xe_migrate_sanity_kunit  =================
[03:18:46] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[03:18:46] ================== xe_validate_ccs_kunit  ==================
[03:18:46] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[03:18:46] ============= xe_migrate_access_memory_kunit  ==============
[03:18:46] ========= [SKIPPED] xe_migrate_access_memory_kunit =========
[03:18:46] =================== [SKIPPED] xe_migrate ===================
[03:18:46] ================== xe_dma_buf (1 subtest) ==================
[03:18:46] ==================== xe_dma_buf_kunit  =====================
[03:18:46] ================ [SKIPPED] xe_dma_buf_kunit ================
[03:18:46] =================== [SKIPPED] xe_dma_buf ===================
[03:18:46] ================= xe_bo_shrink (1 subtest) =================
[03:18:46] =================== xe_bo_shrink_kunit  ====================
[03:18:46] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[03:18:46] ================== [SKIPPED] xe_bo_shrink ==================
[03:18:46] ==================== xe_bo (2 subtests) ====================
[03:18:46] ================== xe_ccs_migrate_kunit  ===================
[03:18:46] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[03:18:46] ==================== xe_bo_evict_kunit  ====================
[03:18:46] =============== [SKIPPED] xe_bo_evict_kunit ================
[03:18:46] ===================== [SKIPPED] xe_bo ======================
[03:18:46] =================== xe_any (9 subtests) ====================
[03:18:46] [PASSED] test_to_xe
[03:18:46] [PASSED] test_to_dev
[03:18:46] [PASSED] test_to_pdev
[03:18:46] [PASSED] test_to_drm
[03:18:46] [PASSED] test_if_pdev
[03:18:46] [PASSED] test_if_xe
[03:18:46] [PASSED] test_if_tile
[03:18:46] [PASSED] test_if_gt
[03:18:46] [PASSED] test_to_id
[03:18:46] ===================== [PASSED] xe_any ======================
[03:18:46] ==================== args (13 subtests) ====================
[03:18:46] [PASSED] count_args_test
[03:18:46] [PASSED] call_args_example
[03:18:46] [PASSED] call_args_test
[03:18:46] [PASSED] drop_first_arg_example
[03:18:46] [PASSED] drop_first_arg_test
[03:18:46] [PASSED] first_arg_example
[03:18:46] [PASSED] first_arg_test
[03:18:46] [PASSED] last_arg_example
[03:18:46] [PASSED] last_arg_test
[03:18:46] [PASSED] pick_arg_example
[03:18:46] [PASSED] if_args_example
[03:18:46] [PASSED] if_args_test
[03:18:46] [PASSED] sep_comma_example
[03:18:46] ====================== [PASSED] args =======================
[03:18:46] =================== xe_pci (3 subtests) ====================
[03:18:46] ==================== check_graphics_ip  ====================
[03:18:46] [PASSED] 12.00 Xe_LP
[03:18:46] [PASSED] 12.10 Xe_LP+
[03:18:46] [PASSED] 12.55 Xe_HPG
[03:18:46] [PASSED] 12.60 Xe_HPC
[03:18:46] [PASSED] 12.70 Xe_LPG
[03:18:46] [PASSED] 12.71 Xe_LPG
[03:18:46] [PASSED] 12.74 Xe_LPG+
[03:18:46] [PASSED] 20.01 Xe2_HPG
[03:18:46] [PASSED] 20.02 Xe2_HPG
[03:18:46] [PASSED] 20.04 Xe2_LPG
[03:18:46] [PASSED] 30.00 Xe3_LPG
[03:18:46] [PASSED] 30.01 Xe3_LPG
[03:18:46] [PASSED] 30.03 Xe3_LPG
[03:18:46] [PASSED] 30.04 Xe3_LPG
[03:18:46] [PASSED] 30.05 Xe3_LPG
[03:18:46] [PASSED] 35.10 Xe3p_LPG
[03:18:46] [PASSED] 35.11 Xe3p_XPC
[03:18:46] ================ [PASSED] check_graphics_ip ================
[03:18:46] ===================== check_media_ip  ======================
[03:18:46] [PASSED] 12.00 Xe_M
[03:18:46] [PASSED] 12.55 Xe_HPM
[03:18:46] [PASSED] 13.00 Xe_LPM+
[03:18:46] [PASSED] 13.01 Xe2_HPM
[03:18:46] [PASSED] 20.00 Xe2_LPM
[03:18:46] [PASSED] 30.00 Xe3_LPM
[03:18:46] [PASSED] 30.02 Xe3_LPM
[03:18:46] [PASSED] 35.00 Xe3p_LPM
[03:18:46] [PASSED] 35.03 Xe3p_HPM
[03:18:46] ================= [PASSED] check_media_ip ==================
[03:18:46] =================== check_platform_desc  ===================
[03:18:46] [PASSED] 0x9A60 (TIGERLAKE)
[03:18:46] [PASSED] 0x9A68 (TIGERLAKE)
[03:18:46] [PASSED] 0x9A70 (TIGERLAKE)
[03:18:46] [PASSED] 0x9A40 (TIGERLAKE)
[03:18:46] [PASSED] 0x9A49 (TIGERLAKE)
[03:18:46] [PASSED] 0x9A59 (TIGERLAKE)
[03:18:46] [PASSED] 0x9A78 (TIGERLAKE)
[03:18:46] [PASSED] 0x9AC0 (TIGERLAKE)
[03:18:46] [PASSED] 0x9AC9 (TIGERLAKE)
[03:18:46] [PASSED] 0x9AD9 (TIGERLAKE)
[03:18:46] [PASSED] 0x9AF8 (TIGERLAKE)
[03:18:46] [PASSED] 0x4C80 (ROCKETLAKE)
[03:18:46] [PASSED] 0x4C8A (ROCKETLAKE)
[03:18:46] [PASSED] 0x4C8B (ROCKETLAKE)
[03:18:46] [PASSED] 0x4C8C (ROCKETLAKE)
[03:18:46] [PASSED] 0x4C90 (ROCKETLAKE)
[03:18:46] [PASSED] 0x4C9A (ROCKETLAKE)
[03:18:46] [PASSED] 0x4680 (ALDERLAKE_S)
[03:18:46] [PASSED] 0x4682 (ALDERLAKE_S)
[03:18:46] [PASSED] 0x4688 (ALDERLAKE_S)
[03:18:46] [PASSED] 0x468A (ALDERLAKE_S)
[03:18:46] [PASSED] 0x468B (ALDERLAKE_S)
[03:18:46] [PASSED] 0x4690 (ALDERLAKE_S)
[03:18:46] [PASSED] 0x4692 (ALDERLAKE_S)
[03:18:46] [PASSED] 0x4693 (ALDERLAKE_S)
[03:18:46] [PASSED] 0x46A0 (ALDERLAKE_P)
[03:18:46] [PASSED] 0x46A1 (ALDERLAKE_P)
[03:18:46] [PASSED] 0x46A2 (ALDERLAKE_P)
[03:18:46] [PASSED] 0x46A3 (ALDERLAKE_P)
[03:18:46] [PASSED] 0x46A6 (ALDERLAKE_P)
[03:18:46] [PASSED] 0x46A8 (ALDERLAKE_P)
[03:18:46] [PASSED] 0x46AA (ALDERLAKE_P)
[03:18:46] [PASSED] 0x462A (ALDERLAKE_P)
[03:18:46] [PASSED] 0x4626 (ALDERLAKE_P)
[03:18:46] [PASSED] 0x4628 (ALDERLAKE_P)
[03:18:46] [PASSED] 0x46B0 (ALDERLAKE_P)
[03:18:46] [PASSED] 0x46B1 (ALDERLAKE_P)
[03:18:46] [PASSED] 0x46B2 (ALDERLAKE_P)
[03:18:46] [PASSED] 0x46B3 (ALDERLAKE_P)
[03:18:46] [PASSED] 0x46C0 (ALDERLAKE_P)
[03:18:46] [PASSED] 0x46C1 (ALDERLAKE_P)
[03:18:46] [PASSED] 0x46C2 (ALDERLAKE_P)
[03:18:46] [PASSED] 0x46C3 (ALDERLAKE_P)
[03:18:46] [PASSED] 0x46D0 (ALDERLAKE_N)
[03:18:46] [PASSED] 0x46D1 (ALDERLAKE_N)
[03:18:46] [PASSED] 0x46D2 (ALDERLAKE_N)
[03:18:46] [PASSED] 0x46D3 (ALDERLAKE_N)
[03:18:46] [PASSED] 0x46D4 (ALDERLAKE_N)
[03:18:46] [PASSED] 0xA721 (ALDERLAKE_P)
[03:18:46] [PASSED] 0xA7A1 (ALDERLAKE_P)
[03:18:46] [PASSED] 0xA7A9 (ALDERLAKE_P)
[03:18:46] [PASSED] 0xA7AC (ALDERLAKE_P)
[03:18:46] [PASSED] 0xA7AD (ALDERLAKE_P)
[03:18:46] [PASSED] 0xA720 (ALDERLAKE_P)
[03:18:46] [PASSED] 0xA7A0 (ALDERLAKE_P)
[03:18:46] [PASSED] 0xA7A8 (ALDERLAKE_P)
[03:18:46] [PASSED] 0xA7AA (ALDERLAKE_P)
[03:18:46] [PASSED] 0xA7AB (ALDERLAKE_P)
[03:18:46] [PASSED] 0xA780 (ALDERLAKE_S)
[03:18:46] [PASSED] 0xA781 (ALDERLAKE_S)
[03:18:46] [PASSED] 0xA782 (ALDERLAKE_S)
[03:18:46] [PASSED] 0xA783 (ALDERLAKE_S)
[03:18:46] [PASSED] 0xA788 (ALDERLAKE_S)
[03:18:46] [PASSED] 0xA789 (ALDERLAKE_S)
[03:18:46] [PASSED] 0xA78A (ALDERLAKE_S)
[03:18:46] [PASSED] 0xA78B (ALDERLAKE_S)
[03:18:46] [PASSED] 0x4905 (DG1)
[03:18:46] [PASSED] 0x4906 (DG1)
[03:18:46] [PASSED] 0x4907 (DG1)
[03:18:46] [PASSED] 0x4908 (DG1)
[03:18:46] [PASSED] 0x4909 (DG1)
[03:18:46] [PASSED] 0x56C0 (DG2)
[03:18:46] [PASSED] 0x56C2 (DG2)
[03:18:46] [PASSED] 0x56C1 (DG2)
[03:18:46] [PASSED] 0x7D51 (METEORLAKE)
[03:18:46] [PASSED] 0x7DD1 (METEORLAKE)
[03:18:46] [PASSED] 0x7D41 (METEORLAKE)
[03:18:46] [PASSED] 0x7D67 (METEORLAKE)
[03:18:46] [PASSED] 0xB640 (METEORLAKE)
[03:18:46] [PASSED] 0x56A0 (DG2)
[03:18:46] [PASSED] 0x56A1 (DG2)
[03:18:46] [PASSED] 0x56A2 (DG2)
[03:18:46] [PASSED] 0x56BE (DG2)
[03:18:46] [PASSED] 0x56BF (DG2)
[03:18:46] [PASSED] 0x5690 (DG2)
[03:18:46] [PASSED] 0x5691 (DG2)
[03:18:46] [PASSED] 0x5692 (DG2)
[03:18:46] [PASSED] 0x56A5 (DG2)
[03:18:46] [PASSED] 0x56A6 (DG2)
[03:18:46] [PASSED] 0x56B0 (DG2)
[03:18:46] [PASSED] 0x56B1 (DG2)
[03:18:46] [PASSED] 0x56BA (DG2)
[03:18:46] [PASSED] 0x56BB (DG2)
[03:18:46] [PASSED] 0x56BC (DG2)
[03:18:46] [PASSED] 0x56BD (DG2)
[03:18:46] [PASSED] 0x5693 (DG2)
[03:18:46] [PASSED] 0x5694 (DG2)
[03:18:46] [PASSED] 0x5695 (DG2)
[03:18:46] [PASSED] 0x56A3 (DG2)
[03:18:46] [PASSED] 0x56A4 (DG2)
[03:18:46] [PASSED] 0x56B2 (DG2)
[03:18:46] [PASSED] 0x56B3 (DG2)
[03:18:46] [PASSED] 0x5696 (DG2)
[03:18:46] [PASSED] 0x5697 (DG2)
[03:18:46] [PASSED] 0xB69 (PVC)
[03:18:46] [PASSED] 0xB6E (PVC)
[03:18:46] [PASSED] 0xBD4 (PVC)
[03:18:46] [PASSED] 0xBD5 (PVC)
[03:18:46] [PASSED] 0xBD6 (PVC)
[03:18:46] [PASSED] 0xBD7 (PVC)
[03:18:46] [PASSED] 0xBD8 (PVC)
[03:18:46] [PASSED] 0xBD9 (PVC)
[03:18:46] [PASSED] 0xBDA (PVC)
[03:18:46] [PASSED] 0xBDB (PVC)
[03:18:46] [PASSED] 0xBE0 (PVC)
[03:18:46] [PASSED] 0xBE1 (PVC)
[03:18:46] [PASSED] 0xBE5 (PVC)
[03:18:46] [PASSED] 0x7D40 (METEORLAKE)
[03:18:46] [PASSED] 0x7D45 (METEORLAKE)
[03:18:46] [PASSED] 0x7D55 (METEORLAKE)
[03:18:46] [PASSED] 0x7D60 (METEORLAKE)
[03:18:46] [PASSED] 0x7DD5 (METEORLAKE)
[03:18:46] [PASSED] 0x6420 (LUNARLAKE)
[03:18:46] [PASSED] 0x64A0 (LUNARLAKE)
[03:18:46] [PASSED] 0x64B0 (LUNARLAKE)
[03:18:46] [PASSED] 0xE202 (BATTLEMAGE)
[03:18:46] [PASSED] 0xE209 (BATTLEMAGE)
[03:18:46] [PASSED] 0xE20B (BATTLEMAGE)
[03:18:46] [PASSED] 0xE20C (BATTLEMAGE)
[03:18:46] [PASSED] 0xE20D (BATTLEMAGE)
[03:18:46] [PASSED] 0xE210 (BATTLEMAGE)
[03:18:46] [PASSED] 0xE211 (BATTLEMAGE)
[03:18:46] [PASSED] 0xE212 (BATTLEMAGE)
[03:18:46] [PASSED] 0xE216 (BATTLEMAGE)
[03:18:46] [PASSED] 0xE220 (BATTLEMAGE)
[03:18:46] [PASSED] 0xE221 (BATTLEMAGE)
[03:18:46] [PASSED] 0xE222 (BATTLEMAGE)
[03:18:46] [PASSED] 0xE223 (BATTLEMAGE)
[03:18:46] [PASSED] 0xB080 (PANTHERLAKE)
[03:18:46] [PASSED] 0xB081 (PANTHERLAKE)
[03:18:46] [PASSED] 0xB082 (PANTHERLAKE)
[03:18:46] [PASSED] 0xB083 (PANTHERLAKE)
[03:18:46] [PASSED] 0xB084 (PANTHERLAKE)
[03:18:46] [PASSED] 0xB085 (PANTHERLAKE)
[03:18:46] [PASSED] 0xB086 (PANTHERLAKE)
[03:18:46] [PASSED] 0xB087 (PANTHERLAKE)
[03:18:46] [PASSED] 0xB08F (PANTHERLAKE)
[03:18:46] [PASSED] 0xB090 (PANTHERLAKE)
[03:18:46] [PASSED] 0xB0A0 (PANTHERLAKE)
[03:18:46] [PASSED] 0xB0A1 (PANTHERLAKE)
[03:18:46] [PASSED] 0xB0B0 (PANTHERLAKE)
[03:18:46] [PASSED] 0xFD80 (PANTHERLAKE)
[03:18:46] [PASSED] 0xFD81 (PANTHERLAKE)
[03:18:46] [PASSED] 0xD740 (NOVALAKE_S)
[03:18:46] [PASSED] 0xD741 (NOVALAKE_S)
[03:18:46] [PASSED] 0xD742 (NOVALAKE_S)
[03:18:46] [PASSED] 0xD743 (NOVALAKE_S)
[03:18:46] [PASSED] 0xD745 (NOVALAKE_S)
[03:18:46] [PASSED] 0xD74A (NOVALAKE_S)
[03:18:46] [PASSED] 0xD74B (NOVALAKE_S)
[03:18:46] [PASSED] 0x674C (CRESCENTISLAND)
[03:18:46] [PASSED] 0x674D (CRESCENTISLAND)
[03:18:46] [PASSED] 0x674E (CRESCENTISLAND)
[03:18:46] [PASSED] 0x674F (CRESCENTISLAND)
[03:18:46] [PASSED] 0x6750 (CRESCENTISLAND)
[03:18:46] [PASSED] 0x6751 (CRESCENTISLAND)
[03:18:46] [PASSED] 0x6752 (CRESCENTISLAND)
[03:18:46] [PASSED] 0x6753 (CRESCENTISLAND)
[03:18:46] [PASSED] 0x6754 (CRESCENTISLAND)
[03:18:46] [PASSED] 0x6755 (CRESCENTISLAND)
[03:18:46] [PASSED] 0x6756 (CRESCENTISLAND)
[03:18:46] [PASSED] 0xD750 (NOVALAKE_P)
[03:18:46] [PASSED] 0xD751 (NOVALAKE_P)
[03:18:46] [PASSED] 0xD752 (NOVALAKE_P)
[03:18:46] [PASSED] 0xD753 (NOVALAKE_P)
[03:18:46] [PASSED] 0xD754 (NOVALAKE_P)
[03:18:46] [PASSED] 0xD755 (NOVALAKE_P)
[03:18:46] [PASSED] 0xD756 (NOVALAKE_P)
[03:18:46] [PASSED] 0xD757 (NOVALAKE_P)
[03:18:46] [PASSED] 0xD75F (NOVALAKE_P)
[03:18:46] =============== [PASSED] check_platform_desc ===============
[03:18:46] ===================== [PASSED] xe_pci ======================
[03:18:46] ============= xe_rtp_tables_test (5 subtests) ==============
[03:18:46] ================== xe_rtp_table_gt_test  ===================
[03:18:46] [PASSED] gt_was/14011060649
[03:18:46] [PASSED] gt_was/14011059788
[03:18:46] [PASSED] gt_was/14015795083
[03:18:46] [PASSED] gt_was/16021867713
[03:18:46] [PASSED] gt_was/14019449301
[03:18:46] [PASSED] gt_was/16028005424
[03:18:46] [PASSED] gt_was/14026578760
[03:18:46] [PASSED] gt_was/1409420604
[03:18:46] [PASSED] gt_was/1408615072
[03:18:46] [PASSED] gt_was/22010523718
[03:18:46] [PASSED] gt_was/14011006942
[03:18:46] [PASSED] gt_was/14014830051
[03:18:46] [PASSED] gt_was/18018781329
[03:18:46] [PASSED] gt_was/1509235366
[03:18:46] [PASSED] gt_was/18018781329
[03:18:46] [PASSED] gt_was/16016694945
[03:18:46] [PASSED] gt_was/14018575942
[03:18:46] [PASSED] gt_was/22016670082
[03:18:46] [PASSED] gt_was/22016670082
[03:18:46] [PASSED] gt_was/14017421178
[03:18:46] [PASSED] gt_was/16025250150
[03:18:46] [PASSED] gt_was/14021871409
[03:18:46] [PASSED] gt_was/16021865536
[03:18:46] [PASSED] gt_was/14021486841
[03:18:46] [PASSED] gt_was/14025160223
[03:18:46] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[03:18:46] [PASSED] gt_was/14025635424
[03:18:46] [PASSED] gt_was/16028005424
[03:18:46] ============== [PASSED] xe_rtp_table_gt_test ===============
[03:18:46] ================== xe_rtp_table_gt_test  ===================
[03:18:46] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[03:18:46] [PASSED] gt_tunings/Tuning: 32B Access Enable
[03:18:46] [PASSED] gt_tunings/Tuning: L3 cache
[03:18:46] [PASSED] gt_tunings/Tuning: L3 cache - media
[03:18:46] [PASSED] gt_tunings/Tuning: Compression Overfetch
[03:18:46] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[03:18:46] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[03:18:46] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[03:18:46] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[03:18:46] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[03:18:46] [PASSED] gt_tunings/Tuning: Stateless compression control
[03:18:46] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[03:18:46] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[03:18:46] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[03:18:46] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[03:18:46] [PASSED] gt_tunings/Tuning: Force All Non-Compressible Memory Reads to be 256B Overfetches
[03:18:46] ============== [PASSED] xe_rtp_table_gt_test ===============
[03:18:46] ================== xe_rtp_table_oob_test  ==================
[03:18:46] [PASSED] oob_was/1607983814
[03:18:46] [PASSED] oob_was/16010904313
[03:18:46] [PASSED] oob_was/18022495364
[03:18:46] [PASSED] oob_was/22012773006
[03:18:46] [PASSED] oob_was/14014475959
[03:18:46] [PASSED] oob_was/22011391025
[03:18:46] [PASSED] oob_was/22012727170
[03:18:46] [PASSED] oob_was/22012727685
[03:18:46] [PASSED] oob_was/22016596838
[03:18:46] [PASSED] oob_was/18020744125
[03:18:46] [PASSED] oob_was/1409600907
[03:18:46] [PASSED] oob_was/22014953428
[03:18:46] [PASSED] oob_was/16017236439
[03:18:46] [PASSED] oob_was/14019821291
[03:18:46] [PASSED] oob_was/14015076503
[03:18:46] [PASSED] oob_was/22016122933
[03:18:46] [PASSED] oob_was/14018913170
[03:18:46] [PASSED] oob_was/14018094691
[03:18:46] [PASSED] oob_was/18024947630
[03:18:46] [PASSED] oob_was/16022287689
[03:18:46] [PASSED] oob_was/13011645652
[03:18:46] [PASSED] oob_was/14022293748
[03:18:46] [PASSED] oob_was/22019794406
[03:18:46] [PASSED] oob_was/22019338487
[03:18:46] [PASSED] oob_was/16023588340
[03:18:46] [PASSED] oob_was/14019789679
[03:18:46] [PASSED] oob_was/14022866841
[03:18:46] [PASSED] oob_was/16021333562
[03:18:46] [PASSED] oob_was/14016712196
[03:18:46] [PASSED] oob_was/14015568240
[03:18:46] [PASSED] oob_was/18013179988
[03:18:46] [PASSED] oob_was/1508761755
[03:18:46] [PASSED] oob_was/16023105232
[03:18:46] [PASSED] oob_was/16026508708
[03:18:46] [PASSED] oob_was/14020001231
[03:18:46] [PASSED] oob_was/16023683509
[03:18:46] [PASSED] oob_was/14025515070
[03:18:46] [PASSED] oob_was/15015404425_disable
[03:18:46] [PASSED] oob_was/16026007364
[03:18:46] [PASSED] oob_was/14020316580
[03:18:46] [PASSED] oob_was/14025883347
[03:18:46] [PASSED] oob_was/16029380221
[03:18:46] [PASSED] oob_was/22022079272
[03:18:46] [PASSED] oob_was/16029897822
[03:18:46] [PASSED] oob_was/14026539277
[03:18:46] [PASSED] oob_was/14027054324
[03:18:46] [PASSED] oob_was/14025941587
[03:18:46] [PASSED] oob_was/16030224309
[03:18:46] [PASSED] oob_was/14028709524
[03:18:46] [PASSED] oob_was/14028250015
[03:18:46] [PASSED] oob_was/16031259911
[03:18:46] ============== [PASSED] xe_rtp_table_oob_test ==============
[03:18:46] ================ xe_rtp_table_dev_oob_test  ================
[03:18:46] [PASSED] device_oob_was/22010954014
[03:18:46] [PASSED] device_oob_was/15015404425
[03:18:46] [PASSED] device_oob_was/22019338487_display
[03:18:46] [PASSED] device_oob_was/14022085890
[03:18:46] [PASSED] device_oob_was/14026633728
[03:18:46] [PASSED] device_oob_was/14026746987
[03:18:46] [PASSED] device_oob_was/14026779378
[03:18:46] [PASSED] device_oob_was/14028586678
[03:18:46] [PASSED] device_oob_was/14028434957
[03:18:46] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[03:18:46] ========== xe_rtp_table_missing_upper_bound_test  ==========
[03:18:46] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[03:18:46] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[03:18:46] [PASSED] register_whitelist/1806527549
[03:18:46] [PASSED] register_whitelist/allow_read_ctx_timestamp
[03:18:46] [PASSED] register_whitelist/allow_read_queue_timestamp
[03:18:46] [PASSED] register_whitelist/16014440446
[03:18:46] [PASSED] register_whitelist/16017236439
[03:18:46] [PASSED] register_whitelist/16020183090
[03:18:46] [PASSED] register_whitelist/14024997852
[03:18:46] [PASSED] register_whitelist/14024997852
[03:18:46] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[03:18:46] =============== [PASSED] xe_rtp_tables_test ================
[03:18:46] =================== xe_rtp (3 subtests) ====================
[03:18:46] =================== xe_rtp_rules_tests  ====================
[03:18:46] [PASSED] no
[03:18:46] [PASSED] yes
[03:18:46] [PASSED] no-and-no
[03:18:46] [PASSED] no-and-yes
[03:18:46] [PASSED] yes-and-no
[03:18:46] [PASSED] yes-and-yes
[03:18:46] [PASSED] no-or-no
[03:18:46] [PASSED] no-or-yes
[03:18:46] [PASSED] yes-or-no
[03:18:46] [PASSED] yes-or-yes
[03:18:46] [PASSED] no-yes-or-yes-no
[03:18:46] [PASSED] no-yes-or-yes-yes
[03:18:46] [PASSED] yes-yes-or-no-yes
[03:18:46] [PASSED] yes-yes-or-yes-yes
[03:18:46] [PASSED] no-no-or-yes-or-no
[03:18:46] [PASSED] or
[03:18:46] [PASSED] or-yes
[03:18:46] [PASSED] or-no
[03:18:46] [PASSED] yes-or
[03:18:46] [PASSED] no-or
[03:18:46] [PASSED] no-or-or-yes
[03:18:46] [PASSED] yes-or-or-no
[03:18:46] [PASSED] no-or-or-no
[03:18:46] [PASSED] missing-context-engine-class
[03:18:46] [PASSED] missing-context-engine-class-or-yes
[03:18:46] [PASSED] missing-context-engine-class-or-or-yes
[03:18:46] =============== [PASSED] xe_rtp_rules_tests ================
[03:18:46] =============== xe_rtp_process_to_sr_tests  ================
[03:18:46] [PASSED] coalesce-same-reg
[03:18:46] [PASSED] coalesce-same-reg-literal-and-func
[03:18:46] [PASSED] no-match-no-add
[03:18:46] [PASSED] two-regs-two-entries
[03:18:46] [PASSED] clr-one-set-other
[03:18:46] [PASSED] set-field
[03:18:46] [PASSED] conflict-duplicate
[03:18:46] [PASSED] conflict-not-disjoint
[03:18:46] [PASSED] conflict-not-disjoint-literal-and-func
[03:18:46] [PASSED] conflict-reg-type
[03:18:46] [PASSED] bad-mcr-reg-forced-to-regular
[03:18:46] [PASSED] bad-regular-reg-forced-to-mcr
[03:18:46] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[03:18:46] ================== xe_rtp_process_tests  ===================
[03:18:46] [PASSED] active1
[03:18:46] [PASSED] active2
[03:18:46] [PASSED] active-inactive
[03:18:46] [PASSED] inactive-active
[03:18:46] [PASSED] inactive-active-inactive
[03:18:46] [PASSED] inactive-inactive-inactive
[03:18:46] ============== [PASSED] xe_rtp_process_tests ===============
[03:18:46] ===================== [PASSED] xe_rtp ======================
[03:18:46] ==================== xe_wa (1 subtest) =====================
[03:18:46] ======================== xe_wa_gt  =========================
[03:18:46] [PASSED] TIGERLAKE B0
[03:18:46] [PASSED] DG1 A0
[03:18:46] [PASSED] DG1 B0
[03:18:46] [PASSED] ALDERLAKE_S A0
[03:18:46] [PASSED] ALDERLAKE_S B0
[03:18:46] [PASSED] ALDERLAKE_S C0
[03:18:46] [PASSED] ALDERLAKE_S D0
[03:18:46] [PASSED] ALDERLAKE_P A0
[03:18:46] [PASSED] ALDERLAKE_P B0
[03:18:46] [PASSED] ALDERLAKE_P C0
[03:18:46] [PASSED] ALDERLAKE_S RPLS D0
[03:18:46] [PASSED] ALDERLAKE_P RPLU E0
[03:18:46] [PASSED] DG2 G10 C0
[03:18:46] [PASSED] DG2 G11 B1
[03:18:46] [PASSED] DG2 G12 A1
[03:18:46] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[03:18:46] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[03:18:46] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[03:18:46] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[03:18:46] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[03:18:46] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[03:18:46] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[03:18:46] ==================== [PASSED] xe_wa_gt =====================
[03:18:46] ====================== [PASSED] xe_wa ======================
[03:18:46] ============================================================
[03:18:46] Testing complete. Ran 860 tests: passed: 831, skipped: 29
[03:18:46] Elapsed time: 42.057s total, 2.541s configuring, 38.750s building, 0.736s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
ERROR:root:../drivers/gpu/drm/tests/drm_connector_test.c: In function ‘drm_test_connector_attach_luminance_property’:
../drivers/gpu/drm/tests/drm_connector_test.c:162:9: error: implicit declaration of function ‘drm_atomic_helper_connector_reset’; did you mean ‘drm_atomic_helper_connector_tv_check’? [-Werror=implicit-function-declaration]
  162 |         drm_atomic_helper_connector_reset(connector);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |         drm_atomic_helper_connector_tv_check
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:290: drivers/gpu/drm/tests/drm_connector_test.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:572: drivers/gpu/drm/tests] Error 2
make[5]: *** [../scripts/Makefile.build:572: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:572: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:572: drivers] Error 2
make[2]: *** [/kernel/Makefile:2244: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[03:18:46] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[03:18:48] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


