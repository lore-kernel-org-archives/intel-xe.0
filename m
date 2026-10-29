Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3C9606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 17:40:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FCF10E56D;
	Thu, 29 Oct 2026 17:40:24 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC09E10E56D;
 Thu, 29 Oct 2026 17:40:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Capture_additional_H?=
 =?utf-8?q?W_register_state_in_devcoredump_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Oct 2026 17:40:22 -0000
Message-ID: <179329562295.90165.1425599910170124079@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261029172800.2150325-1-naresh.kumar.g@intel.com>
In-Reply-To: <20261029172800.2150325-1-naresh.kumar.g@intel.com>
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

Series: drm/xe: Capture additional HW register state in devcoredump (rev8)
URL   : https://patchwork.freedesktop.org/series/172150/
State : success

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[17:38:14] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:38:19] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:38:39] Starting KUnit Kernel (1/1)...
[17:38:39] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:38:39] ================= gpu_buddy (14 subtests) ==================
[17:38:39] [PASSED] gpu_test_buddy_alloc_limit
[17:38:39] [PASSED] gpu_test_buddy_alloc_optimistic
[17:38:39] [PASSED] gpu_test_buddy_alloc_pessimistic
[17:38:39] [PASSED] gpu_test_buddy_alloc_pathological
[17:38:39] [PASSED] gpu_test_buddy_alloc_contiguous
[17:38:39] [PASSED] gpu_test_buddy_alloc_clear
[17:38:39] [PASSED] gpu_test_buddy_alloc_range
[17:38:40] [PASSED] gpu_test_buddy_alloc_range_bias
[17:38:40] [PASSED] gpu_test_buddy_fragmentation_performance
[17:38:41] [PASSED] gpu_test_buddy_dirty_tracker_performance
[17:38:41] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[17:38:41] [PASSED] gpu_test_buddy_offset_aligned_allocation
[17:38:41] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[17:38:41] [PASSED] gpu_test_buddy_addr_to_block
[17:38:41] ==================== [PASSED] gpu_buddy ====================
[17:38:41] ============================================================
[17:38:41] Testing complete. Ran 14 tests: passed: 14
[17:38:41] Elapsed time: 26.691s total, 4.403s configuring, 20.421s building, 1.817s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[17:38:41] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:38:43] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:39:21] Starting KUnit Kernel (1/1)...
[17:39:21] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:39:21] ================== guc_buf (11 subtests) ===================
[17:39:21] [PASSED] test_smallest
[17:39:21] [PASSED] test_largest
[17:39:21] [PASSED] test_granular
[17:39:21] [PASSED] test_unique
[17:39:21] [PASSED] test_overlap
[17:39:21] [PASSED] test_reusable
[17:39:21] [PASSED] test_too_big
[17:39:21] [PASSED] test_flush
[17:39:21] [PASSED] test_lookup
[17:39:21] [PASSED] test_data
[17:39:21] [PASSED] test_class
[17:39:21] ===================== [PASSED] guc_buf =====================
[17:39:21] =================== guc_dbm (7 subtests) ===================
[17:39:21] [PASSED] test_empty
[17:39:21] [PASSED] test_default
[17:39:21] ======================== test_size  ========================
[17:39:21] [PASSED] 4
[17:39:21] [PASSED] 8
[17:39:21] [PASSED] 32
[17:39:21] [PASSED] 256
[17:39:21] ==================== [PASSED] test_size ====================
[17:39:21] ======================= test_reuse  ========================
[17:39:21] [PASSED] 4
[17:39:21] [PASSED] 8
[17:39:21] [PASSED] 32
[17:39:21] [PASSED] 256
[17:39:21] =================== [PASSED] test_reuse ====================
[17:39:21] =================== test_range_overlap  ====================
[17:39:21] [PASSED] 4
[17:39:21] [PASSED] 8
[17:39:21] [PASSED] 32
[17:39:21] [PASSED] 256
[17:39:21] =============== [PASSED] test_range_overlap ================
[17:39:21] =================== test_range_compact  ====================
[17:39:21] [PASSED] 4
[17:39:21] [PASSED] 8
[17:39:21] [PASSED] 32
[17:39:21] [PASSED] 256
[17:39:21] =============== [PASSED] test_range_compact ================
[17:39:21] ==================== test_range_spare  =====================
[17:39:21] [PASSED] 4
[17:39:21] [PASSED] 8
[17:39:21] [PASSED] 32
[17:39:21] [PASSED] 256
[17:39:21] ================ [PASSED] test_range_spare =================
[17:39:21] ===================== [PASSED] guc_dbm =====================
[17:39:21] ================== guc_idm (22 subtests) ===================
[17:39:21] [PASSED] bad_init
[17:39:21] [PASSED] no_init
[17:39:21] [PASSED] init_fini
[17:39:21] [PASSED] check_init_small
[17:39:21] [PASSED] check_init_shared
[17:39:21] [PASSED] check_used
[17:39:21] [PASSED] check_quota
[17:39:21] [PASSED] check_all
[17:39:21] [PASSED] check_limits
[17:39:21] [PASSED] check_overlap
[17:39:21] [PASSED] check_overlap_alloc
[17:39:21] [PASSED] check_overlap_release
[17:39:21] [PASSED] check_overlap_partial_init
[17:39:21] [PASSED] check_overlap_partial_shared_range_blocking
[17:39:21] [PASSED] check_used_usable
[17:39:21] [PASSED] check_used_shareable
[17:39:21] [PASSED] check_used_mixed
[17:39:21] [PASSED] check_release_usable_range
[17:39:21] [PASSED] check_release_shareable_range
[17:39:21] [PASSED] check_split_boundaries
[17:39:21] [PASSED] check_shareable_spare
[17:39:21] [PASSED] check_shareable_spare_fragmented_tail
[17:39:21] ===================== [PASSED] guc_idm =====================
[17:39:21] ============== guc_klv_helpers (13 subtests) ===============
[17:39:21] [PASSED] test_count
[17:39:21] [PASSED] test_encode_u32
[17:39:21] [PASSED] test_encode_u64
[17:39:21] [PASSED] test_encode_string
[17:39:21] [PASSED] test_encode_object_raw
[17:39:21] [PASSED] test_encode_object_klv
[17:39:21] [PASSED] test_encode_object_nested
[17:39:21] [PASSED] test_encode_object_basic
[17:39:21] ===================== test_decode_u16  =====================
[17:39:21] [PASSED] empty
[17:39:21] [PASSED] valid
[17:39:21] [PASSED] max
[17:39:21] [PASSED] big
[17:39:21] [PASSED] long
[17:39:21] ================= [PASSED] test_decode_u16 =================
[17:39:21] ===================== test_decode_u32  =====================
[17:39:21] [PASSED] empty
[17:39:21] [PASSED] valid
[17:39:21] [PASSED] max
[17:39:21] [PASSED] long
[17:39:21] ================= [PASSED] test_decode_u32 =================
[17:39:21] ===================== test_decode_u64  =====================
[17:39:21] [PASSED] empty
[17:39:21] [PASSED] short
[17:39:21] [PASSED] valid
[17:39:21] [PASSED] max
[17:39:21] [PASSED] long
[17:39:21] ================= [PASSED] test_decode_u64 =================
[17:39:21] ===================== test_decode_str  =====================
[17:39:21] [PASSED] empty
[17:39:21] [PASSED] one
[17:39:21] [PASSED] one_trash
[17:39:21] [PASSED] two
[17:39:21] [PASSED] two_trash
[17:39:21] [PASSED] three
[17:39:21] [PASSED] dword
[17:39:21] [PASSED] four
[17:39:21] [PASSED] five
[17:39:21] [PASSED] six
[17:39:21] [PASSED] seven
[17:39:21] [PASSED] qword
[17:39:21] ================= [PASSED] test_decode_str =================
[17:39:21] [PASSED] test_print
[17:39:21] ================= [PASSED] guc_klv_helpers =================
[17:39:21] =================== xe_log (4 subtests) ====================
[17:39:21] [PASSED] demo_cper
[17:39:21] [PASSED] demo_dmesg
[17:39:21] ======================= test_dmesg  ========================
[17:39:21] [PASSED] test_fatal
[17:39:21] [PASSED] test_fatal_tile
[17:39:21] [PASSED] test_fatal_gt
[17:39:21] [PASSED] test_fatal_comp
[17:39:21] [PASSED] test_fatal_comp_tile
[17:39:21] [PASSED] test_fatal_comp_gt
[17:39:21] [PASSED] test_fatal_all
[17:39:21] [PASSED] test_recoverable
[17:39:21] [PASSED] test_recoverable_tile
[17:39:21] [PASSED] test_recoverable_gt
[17:39:21] [PASSED] test_recoverable_comp
[17:39:21] [PASSED] test_recoverable_comp_tile
[17:39:21] [PASSED] test_recoverable_comp_gt
[17:39:21] [PASSED] test_recoverable_all
[17:39:21] [PASSED] test_info
[17:39:21] [PASSED] test_info_tile
[17:39:21] [PASSED] test_info_gt
[17:39:21] [PASSED] test_info_err
[17:39:21] [PASSED] test_info_comp
[17:39:21] [PASSED] test_info_comp_tile
[17:39:21] [PASSED] test_info_comp_gt
[17:39:21] [PASSED] test_info_all
[17:39:21] [PASSED] test_hw_fatal
[17:39:21] [PASSED] test_hw_recoverable
[17:39:21] [PASSED] test_hw_corrected
[17:39:21] [PASSED] test_hw_informational
[17:39:21] =================== [PASSED] test_dmesg ====================
[17:39:21] ====================== test_invalid  =======================
[17:39:21] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[17:39:21] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[17:39:21] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[17:39:21] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[17:39:21] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[17:39:21] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[17:39:21] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[17:39:21] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[17:39:21] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[17:39:21] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[17:39:21] ================== [SKIPPED] test_invalid ==================
[17:39:21] ===================== [PASSED] xe_log ======================
[17:39:22] ================== no_relay (3 subtests) ===================
[17:39:22] [PASSED] xe_drops_guc2pf_if_not_ready
[17:39:22] [PASSED] xe_drops_guc2vf_if_not_ready
[17:39:22] [PASSED] xe_rejects_send_if_not_ready
[17:39:22] ==================== [PASSED] no_relay =====================
[17:39:22] ================== pf_relay (14 subtests) ==================
[17:39:22] [PASSED] pf_rejects_guc2pf_too_short
[17:39:22] [PASSED] pf_rejects_guc2pf_too_long
[17:39:22] [PASSED] pf_rejects_guc2pf_no_payload
[17:39:22] [PASSED] pf_fails_no_payload
[17:39:22] [PASSED] pf_fails_bad_origin
[17:39:22] [PASSED] pf_fails_bad_type
[17:39:22] [PASSED] pf_txn_reports_error
[17:39:22] [PASSED] pf_txn_sends_pf2guc
[17:39:22] [PASSED] pf_sends_pf2guc
[17:39:22] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[17:39:22] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[17:39:22] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[17:39:22] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[17:39:22] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[17:39:22] ==================== [PASSED] pf_relay =====================
[17:39:22] ================== vf_relay (3 subtests) ===================
[17:39:22] [PASSED] vf_rejects_guc2vf_too_short
[17:39:22] [PASSED] vf_rejects_guc2vf_too_long
[17:39:22] [PASSED] vf_rejects_guc2vf_no_payload
[17:39:22] ==================== [PASSED] vf_relay =====================
[17:39:22] ================ pf_gt_config (9 subtests) =================
[17:39:22] [PASSED] fair_contexts_1vf
[17:39:22] [PASSED] fair_doorbells_1vf
[17:39:22] [PASSED] fair_ggtt_1vf
[17:39:22] ====================== fair_vram_1vf  ======================
[17:39:22] [PASSED] 3.50 GiB
[17:39:22] [PASSED] 11.5 GiB
[17:39:22] [PASSED] 15.5 GiB
[17:39:22] [PASSED] 31.5 GiB
[17:39:22] [PASSED] 63.5 GiB
[17:39:22] [PASSED] 1.91 GiB
[17:39:22] ================== [PASSED] fair_vram_1vf ==================
[17:39:22] ================ fair_vram_1vf_admin_only  =================
[17:39:22] [PASSED] 3.50 GiB
[17:39:22] [PASSED] 11.5 GiB
[17:39:22] [PASSED] 15.5 GiB
[17:39:22] [PASSED] 31.5 GiB
[17:39:22] [PASSED] 63.5 GiB
[17:39:22] [PASSED] 1.91 GiB
[17:39:22] ============ [PASSED] fair_vram_1vf_admin_only =============
[17:39:22] ====================== fair_contexts  ======================
[17:39:22] [PASSED] 1 VF
[17:39:22] [PASSED] 2 VFs
[17:39:22] [PASSED] 3 VFs
[17:39:22] [PASSED] 4 VFs
[17:39:22] [PASSED] 5 VFs
[17:39:22] [PASSED] 6 VFs
[17:39:22] [PASSED] 7 VFs
[17:39:22] [PASSED] 8 VFs
[17:39:22] [PASSED] 9 VFs
[17:39:22] [PASSED] 10 VFs
[17:39:22] [PASSED] 11 VFs
[17:39:22] [PASSED] 12 VFs
[17:39:22] [PASSED] 13 VFs
[17:39:22] [PASSED] 14 VFs
[17:39:22] [PASSED] 15 VFs
[17:39:22] [PASSED] 16 VFs
[17:39:22] [PASSED] 17 VFs
[17:39:22] [PASSED] 18 VFs
[17:39:22] [PASSED] 19 VFs
[17:39:22] [PASSED] 20 VFs
[17:39:22] [PASSED] 21 VFs
[17:39:22] [PASSED] 22 VFs
[17:39:22] [PASSED] 23 VFs
[17:39:22] [PASSED] 24 VFs
[17:39:22] [PASSED] 25 VFs
[17:39:22] [PASSED] 26 VFs
[17:39:22] [PASSED] 27 VFs
[17:39:22] [PASSED] 28 VFs
[17:39:22] [PASSED] 29 VFs
[17:39:22] [PASSED] 30 VFs
[17:39:22] [PASSED] 31 VFs
[17:39:22] [PASSED] 32 VFs
[17:39:22] [PASSED] 33 VFs
[17:39:22] [PASSED] 34 VFs
[17:39:22] [PASSED] 35 VFs
[17:39:22] [PASSED] 36 VFs
[17:39:22] [PASSED] 37 VFs
[17:39:22] [PASSED] 38 VFs
[17:39:22] [PASSED] 39 VFs
[17:39:22] [PASSED] 40 VFs
[17:39:22] [PASSED] 41 VFs
[17:39:22] [PASSED] 42 VFs
[17:39:22] [PASSED] 43 VFs
[17:39:22] [PASSED] 44 VFs
[17:39:22] [PASSED] 45 VFs
[17:39:22] [PASSED] 46 VFs
[17:39:22] [PASSED] 47 VFs
[17:39:22] [PASSED] 48 VFs
[17:39:22] [PASSED] 49 VFs
[17:39:22] [PASSED] 50 VFs
[17:39:22] [PASSED] 51 VFs
[17:39:22] [PASSED] 52 VFs
[17:39:22] [PASSED] 53 VFs
[17:39:22] [PASSED] 54 VFs
[17:39:22] [PASSED] 55 VFs
[17:39:22] [PASSED] 56 VFs
[17:39:22] [PASSED] 57 VFs
[17:39:22] [PASSED] 58 VFs
[17:39:22] [PASSED] 59 VFs
[17:39:22] [PASSED] 60 VFs
[17:39:22] [PASSED] 61 VFs
[17:39:22] [PASSED] 62 VFs
[17:39:22] [PASSED] 63 VFs
[17:39:22] ================== [PASSED] fair_contexts ==================
[17:39:22] ===================== fair_doorbells  ======================
[17:39:22] [PASSED] 1 VF
[17:39:22] [PASSED] 2 VFs
[17:39:22] [PASSED] 3 VFs
[17:39:22] [PASSED] 4 VFs
[17:39:22] [PASSED] 5 VFs
[17:39:22] [PASSED] 6 VFs
[17:39:22] [PASSED] 7 VFs
[17:39:22] [PASSED] 8 VFs
[17:39:22] [PASSED] 9 VFs
[17:39:22] [PASSED] 10 VFs
[17:39:22] [PASSED] 11 VFs
[17:39:22] [PASSED] 12 VFs
[17:39:22] [PASSED] 13 VFs
[17:39:22] [PASSED] 14 VFs
[17:39:22] [PASSED] 15 VFs
[17:39:22] [PASSED] 16 VFs
[17:39:22] [PASSED] 17 VFs
[17:39:22] [PASSED] 18 VFs
[17:39:22] [PASSED] 19 VFs
[17:39:22] [PASSED] 20 VFs
[17:39:22] [PASSED] 21 VFs
[17:39:22] [PASSED] 22 VFs
[17:39:22] [PASSED] 23 VFs
[17:39:22] [PASSED] 24 VFs
[17:39:22] [PASSED] 25 VFs
[17:39:22] [PASSED] 26 VFs
[17:39:22] [PASSED] 27 VFs
[17:39:22] [PASSED] 28 VFs
[17:39:22] [PASSED] 29 VFs
[17:39:22] [PASSED] 30 VFs
[17:39:22] [PASSED] 31 VFs
[17:39:22] [PASSED] 32 VFs
[17:39:22] [PASSED] 33 VFs
[17:39:22] [PASSED] 34 VFs
[17:39:22] [PASSED] 35 VFs
[17:39:22] [PASSED] 36 VFs
[17:39:22] [PASSED] 37 VFs
[17:39:22] [PASSED] 38 VFs
[17:39:22] [PASSED] 39 VFs
[17:39:22] [PASSED] 40 VFs
[17:39:22] [PASSED] 41 VFs
[17:39:22] [PASSED] 42 VFs
[17:39:22] [PASSED] 43 VFs
[17:39:22] [PASSED] 44 VFs
[17:39:22] [PASSED] 45 VFs
[17:39:22] [PASSED] 46 VFs
[17:39:22] [PASSED] 47 VFs
[17:39:22] [PASSED] 48 VFs
[17:39:22] [PASSED] 49 VFs
[17:39:22] [PASSED] 50 VFs
[17:39:22] [PASSED] 51 VFs
[17:39:22] [PASSED] 52 VFs
[17:39:22] [PASSED] 53 VFs
[17:39:22] [PASSED] 54 VFs
[17:39:22] [PASSED] 55 VFs
[17:39:22] [PASSED] 56 VFs
[17:39:22] [PASSED] 57 VFs
[17:39:22] [PASSED] 58 VFs
[17:39:22] [PASSED] 59 VFs
[17:39:22] [PASSED] 60 VFs
[17:39:22] [PASSED] 61 VFs
[17:39:22] [PASSED] 62 VFs
[17:39:22] [PASSED] 63 VFs
[17:39:22] ================= [PASSED] fair_doorbells ==================
[17:39:22] ======================== fair_ggtt  ========================
[17:39:22] [PASSED] 1 VF
[17:39:22] [PASSED] 2 VFs
[17:39:22] [PASSED] 3 VFs
[17:39:22] [PASSED] 4 VFs
[17:39:22] [PASSED] 5 VFs
[17:39:22] [PASSED] 6 VFs
[17:39:22] [PASSED] 7 VFs
[17:39:22] [PASSED] 8 VFs
[17:39:22] [PASSED] 9 VFs
[17:39:22] [PASSED] 10 VFs
[17:39:22] [PASSED] 11 VFs
[17:39:22] [PASSED] 12 VFs
[17:39:22] [PASSED] 13 VFs
[17:39:22] [PASSED] 14 VFs
[17:39:22] [PASSED] 15 VFs
[17:39:22] [PASSED] 16 VFs
[17:39:22] [PASSED] 17 VFs
[17:39:22] [PASSED] 18 VFs
[17:39:22] [PASSED] 19 VFs
[17:39:22] [PASSED] 20 VFs
[17:39:22] [PASSED] 21 VFs
[17:39:22] [PASSED] 22 VFs
[17:39:22] [PASSED] 23 VFs
[17:39:22] [PASSED] 24 VFs
[17:39:22] [PASSED] 25 VFs
[17:39:22] [PASSED] 26 VFs
[17:39:22] [PASSED] 27 VFs
[17:39:22] [PASSED] 28 VFs
[17:39:22] [PASSED] 29 VFs
[17:39:22] [PASSED] 30 VFs
[17:39:22] [PASSED] 31 VFs
[17:39:22] [PASSED] 32 VFs
[17:39:22] [PASSED] 33 VFs
[17:39:22] [PASSED] 34 VFs
[17:39:22] [PASSED] 35 VFs
[17:39:22] [PASSED] 36 VFs
[17:39:22] [PASSED] 37 VFs
[17:39:22] [PASSED] 38 VFs
[17:39:22] [PASSED] 39 VFs
[17:39:22] [PASSED] 40 VFs
[17:39:22] [PASSED] 41 VFs
[17:39:22] [PASSED] 42 VFs
[17:39:22] [PASSED] 43 VFs
[17:39:22] [PASSED] 44 VFs
[17:39:22] [PASSED] 45 VFs
[17:39:22] [PASSED] 46 VFs
[17:39:22] [PASSED] 47 VFs
[17:39:22] [PASSED] 48 VFs
[17:39:22] [PASSED] 49 VFs
[17:39:22] [PASSED] 50 VFs
[17:39:22] [PASSED] 51 VFs
[17:39:22] [PASSED] 52 VFs
[17:39:22] [PASSED] 53 VFs
[17:39:22] [PASSED] 54 VFs
[17:39:22] [PASSED] 55 VFs
[17:39:22] [PASSED] 56 VFs
[17:39:22] [PASSED] 57 VFs
[17:39:22] [PASSED] 58 VFs
[17:39:22] [PASSED] 59 VFs
[17:39:22] [PASSED] 60 VFs
[17:39:22] [PASSED] 61 VFs
[17:39:22] [PASSED] 62 VFs
[17:39:22] [PASSED] 63 VFs
[17:39:22] ==================== [PASSED] fair_ggtt ====================
[17:39:22] ======================== fair_vram  ========================
[17:39:22] [PASSED] 1 VF
[17:39:22] [PASSED] 2 VFs
[17:39:22] [PASSED] 3 VFs
[17:39:22] [PASSED] 4 VFs
[17:39:22] [PASSED] 5 VFs
[17:39:22] [PASSED] 6 VFs
[17:39:22] [PASSED] 7 VFs
[17:39:22] [PASSED] 8 VFs
[17:39:22] [PASSED] 9 VFs
[17:39:22] [PASSED] 10 VFs
[17:39:22] [PASSED] 11 VFs
[17:39:22] [PASSED] 12 VFs
[17:39:22] [PASSED] 13 VFs
[17:39:22] [PASSED] 14 VFs
[17:39:22] [PASSED] 15 VFs
[17:39:22] [PASSED] 16 VFs
[17:39:22] [PASSED] 17 VFs
[17:39:22] [PASSED] 18 VFs
[17:39:22] [PASSED] 19 VFs
[17:39:22] [PASSED] 20 VFs
[17:39:22] [PASSED] 21 VFs
[17:39:22] [PASSED] 22 VFs
[17:39:22] [PASSED] 23 VFs
[17:39:22] [PASSED] 24 VFs
[17:39:22] [PASSED] 25 VFs
[17:39:22] [PASSED] 26 VFs
[17:39:22] [PASSED] 27 VFs
[17:39:22] [PASSED] 28 VFs
[17:39:22] [PASSED] 29 VFs
[17:39:22] [PASSED] 30 VFs
[17:39:22] [PASSED] 31 VFs
[17:39:22] [PASSED] 32 VFs
[17:39:22] [PASSED] 33 VFs
[17:39:22] [PASSED] 34 VFs
[17:39:22] [PASSED] 35 VFs
[17:39:22] [PASSED] 36 VFs
[17:39:22] [PASSED] 37 VFs
[17:39:22] [PASSED] 38 VFs
[17:39:22] [PASSED] 39 VFs
[17:39:22] [PASSED] 40 VFs
[17:39:22] [PASSED] 41 VFs
[17:39:22] [PASSED] 42 VFs
[17:39:22] [PASSED] 43 VFs
[17:39:22] [PASSED] 44 VFs
[17:39:22] [PASSED] 45 VFs
[17:39:22] [PASSED] 46 VFs
[17:39:22] [PASSED] 47 VFs
[17:39:22] [PASSED] 48 VFs
[17:39:22] [PASSED] 49 VFs
[17:39:22] [PASSED] 50 VFs
[17:39:22] [PASSED] 51 VFs
[17:39:22] [PASSED] 52 VFs
[17:39:22] [PASSED] 53 VFs
[17:39:22] [PASSED] 54 VFs
[17:39:22] [PASSED] 55 VFs
[17:39:22] [PASSED] 56 VFs
[17:39:22] [PASSED] 57 VFs
[17:39:22] [PASSED] 58 VFs
[17:39:22] [PASSED] 59 VFs
[17:39:22] [PASSED] 60 VFs
[17:39:22] [PASSED] 61 VFs
[17:39:22] [PASSED] 62 VFs
[17:39:22] [PASSED] 63 VFs
[17:39:22] ==================== [PASSED] fair_vram ====================
[17:39:22] ================== [PASSED] pf_gt_config ===================
[17:39:22] ===================== lmtt (1 subtest) =====================
[17:39:22] ======================== test_ops  =========================
[17:39:22] [PASSED] 2-level
[17:39:22] [PASSED] multi-level
[17:39:22] ==================== [PASSED] test_ops =====================
[17:39:22] ====================== [PASSED] lmtt =======================
[17:39:22] ================= sriov_packet (1 subtest) =================
[17:39:22] [PASSED] test_descriptor_init
[17:39:22] ================== [PASSED] sriov_packet ===================
[17:39:22] ================= pf_service (11 subtests) =================
[17:39:22] [PASSED] pf_negotiate_any
[17:39:22] [PASSED] pf_negotiate_base_match
[17:39:22] [PASSED] pf_negotiate_base_newer
[17:39:22] [PASSED] pf_negotiate_base_next
[17:39:22] [SKIPPED] pf_negotiate_base_older (no older minor)
[17:39:22] [PASSED] pf_negotiate_base_prev
[17:39:22] [PASSED] pf_negotiate_latest_match
[17:39:22] [PASSED] pf_negotiate_latest_newer
[17:39:22] [PASSED] pf_negotiate_latest_next
[17:39:22] [SKIPPED] pf_negotiate_latest_older (no older minor)
[17:39:22] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[17:39:22] =================== [PASSED] pf_service ====================
[17:39:22] ================= xe_guc_g2g (2 subtests) ==================
[17:39:22] ============== xe_live_guc_g2g_kunit_default  ==============
[17:39:22] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[17:39:22] ============== xe_live_guc_g2g_kunit_allmem  ===============
[17:39:22] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[17:39:22] =================== [SKIPPED] xe_guc_g2g ===================
[17:39:22] =================== xe_mocs (2 subtests) ===================
[17:39:22] ================ xe_live_mocs_kernel_kunit  ================
[17:39:22] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[17:39:22] ================ xe_live_mocs_reset_kunit  =================
[17:39:22] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[17:39:22] ==================== [SKIPPED] xe_mocs =====================
[17:39:22] ================= xe_migrate (3 subtests) ==================
[17:39:22] ================= xe_migrate_sanity_kunit  =================
[17:39:22] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[17:39:22] ================== xe_validate_ccs_kunit  ==================
[17:39:22] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[17:39:22] ============= xe_migrate_access_memory_kunit  ==============
[17:39:22] ========= [SKIPPED] xe_migrate_access_memory_kunit =========
[17:39:22] =================== [SKIPPED] xe_migrate ===================
[17:39:22] ================== xe_dma_buf (1 subtest) ==================
[17:39:22] ==================== xe_dma_buf_kunit  =====================
[17:39:22] ================ [SKIPPED] xe_dma_buf_kunit ================
[17:39:22] =================== [SKIPPED] xe_dma_buf ===================
[17:39:22] ================= xe_bo_shrink (1 subtest) =================
[17:39:22] =================== xe_bo_shrink_kunit  ====================
[17:39:22] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[17:39:22] ================== [SKIPPED] xe_bo_shrink ==================
[17:39:22] ==================== xe_bo (2 subtests) ====================
[17:39:22] ================== xe_ccs_migrate_kunit  ===================
[17:39:22] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[17:39:22] ==================== xe_bo_evict_kunit  ====================
[17:39:22] =============== [SKIPPED] xe_bo_evict_kunit ================
[17:39:22] ===================== [SKIPPED] xe_bo ======================
[17:39:22] =================== xe_any (9 subtests) ====================
[17:39:22] [PASSED] test_to_xe
[17:39:22] [PASSED] test_to_dev
[17:39:22] [PASSED] test_to_pdev
[17:39:22] [PASSED] test_to_drm
[17:39:22] [PASSED] test_if_pdev
[17:39:22] [PASSED] test_if_xe
[17:39:22] [PASSED] test_if_tile
[17:39:22] [PASSED] test_if_gt
[17:39:22] [PASSED] test_to_id
[17:39:22] ===================== [PASSED] xe_any ======================
[17:39:22] ==================== args (13 subtests) ====================
[17:39:22] [PASSED] count_args_test
[17:39:22] [PASSED] call_args_example
[17:39:22] [PASSED] call_args_test
[17:39:22] [PASSED] drop_first_arg_example
[17:39:22] [PASSED] drop_first_arg_test
[17:39:22] [PASSED] first_arg_example
[17:39:22] [PASSED] first_arg_test
[17:39:22] [PASSED] last_arg_example
[17:39:22] [PASSED] last_arg_test
[17:39:22] [PASSED] pick_arg_example
[17:39:22] [PASSED] if_args_example
[17:39:22] [PASSED] if_args_test
[17:39:22] [PASSED] sep_comma_example
[17:39:22] ====================== [PASSED] args =======================
[17:39:22] =================== xe_pci (3 subtests) ====================
[17:39:22] ==================== check_graphics_ip  ====================
[17:39:22] [PASSED] 12.00 Xe_LP
[17:39:22] [PASSED] 12.10 Xe_LP+
[17:39:22] [PASSED] 12.55 Xe_HPG
[17:39:22] [PASSED] 12.60 Xe_HPC
[17:39:22] [PASSED] 12.70 Xe_LPG
[17:39:22] [PASSED] 12.71 Xe_LPG
[17:39:22] [PASSED] 12.74 Xe_LPG+
[17:39:22] [PASSED] 20.01 Xe2_HPG
[17:39:22] [PASSED] 20.02 Xe2_HPG
[17:39:22] [PASSED] 20.04 Xe2_LPG
[17:39:22] [PASSED] 30.00 Xe3_LPG
[17:39:22] [PASSED] 30.01 Xe3_LPG
[17:39:22] [PASSED] 30.03 Xe3_LPG
[17:39:22] [PASSED] 30.04 Xe3_LPG
[17:39:22] [PASSED] 30.05 Xe3_LPG
[17:39:22] [PASSED] 35.10 Xe3p_LPG
[17:39:22] [PASSED] 35.11 Xe3p_XPC
[17:39:22] ================ [PASSED] check_graphics_ip ================
[17:39:22] ===================== check_media_ip  ======================
[17:39:22] [PASSED] 12.00 Xe_M
[17:39:22] [PASSED] 12.55 Xe_HPM
[17:39:22] [PASSED] 13.00 Xe_LPM+
[17:39:22] [PASSED] 13.01 Xe2_HPM
[17:39:22] [PASSED] 20.00 Xe2_LPM
[17:39:22] [PASSED] 30.00 Xe3_LPM
[17:39:22] [PASSED] 30.02 Xe3_LPM
[17:39:22] [PASSED] 35.00 Xe3p_LPM
[17:39:22] [PASSED] 35.03 Xe3p_HPM
[17:39:22] ================= [PASSED] check_media_ip ==================
[17:39:22] =================== check_platform_desc  ===================
[17:39:22] [PASSED] 0x9A60 (TIGERLAKE)
[17:39:22] [PASSED] 0x9A68 (TIGERLAKE)
[17:39:22] [PASSED] 0x9A70 (TIGERLAKE)
[17:39:22] [PASSED] 0x9A40 (TIGERLAKE)
[17:39:22] [PASSED] 0x9A49 (TIGERLAKE)
[17:39:22] [PASSED] 0x9A59 (TIGERLAKE)
[17:39:22] [PASSED] 0x9A78 (TIGERLAKE)
[17:39:22] [PASSED] 0x9AC0 (TIGERLAKE)
[17:39:22] [PASSED] 0x9AC9 (TIGERLAKE)
[17:39:22] [PASSED] 0x9AD9 (TIGERLAKE)
[17:39:22] [PASSED] 0x9AF8 (TIGERLAKE)
[17:39:22] [PASSED] 0x4C80 (ROCKETLAKE)
[17:39:22] [PASSED] 0x4C8A (ROCKETLAKE)
[17:39:22] [PASSED] 0x4C8B (ROCKETLAKE)
[17:39:22] [PASSED] 0x4C8C (ROCKETLAKE)
[17:39:22] [PASSED] 0x4C90 (ROCKETLAKE)
[17:39:22] [PASSED] 0x4C9A (ROCKETLAKE)
[17:39:22] [PASSED] 0x4680 (ALDERLAKE_S)
[17:39:22] [PASSED] 0x4682 (ALDERLAKE_S)
[17:39:22] [PASSED] 0x4688 (ALDERLAKE_S)
[17:39:22] [PASSED] 0x468A (ALDERLAKE_S)
[17:39:22] [PASSED] 0x468B (ALDERLAKE_S)
[17:39:22] [PASSED] 0x4690 (ALDERLAKE_S)
[17:39:22] [PASSED] 0x4692 (ALDERLAKE_S)
[17:39:22] [PASSED] 0x4693 (ALDERLAKE_S)
[17:39:22] [PASSED] 0x46A0 (ALDERLAKE_P)
[17:39:22] [PASSED] 0x46A1 (ALDERLAKE_P)
[17:39:22] [PASSED] 0x46A2 (ALDERLAKE_P)
[17:39:22] [PASSED] 0x46A3 (ALDERLAKE_P)
[17:39:22] [PASSED] 0x46A6 (ALDERLAKE_P)
[17:39:22] [PASSED] 0x46A8 (ALDERLAKE_P)
[17:39:22] [PASSED] 0x46AA (ALDERLAKE_P)
[17:39:22] [PASSED] 0x462A (ALDERLAKE_P)
[17:39:22] [PASSED] 0x4626 (ALDERLAKE_P)
[17:39:22] [PASSED] 0x4628 (ALDERLAKE_P)
[17:39:22] [PASSED] 0x46B0 (ALDERLAKE_P)
[17:39:22] [PASSED] 0x46B1 (ALDERLAKE_P)
[17:39:22] [PASSED] 0x46B2 (ALDERLAKE_P)
[17:39:22] [PASSED] 0x46B3 (ALDERLAKE_P)
[17:39:22] [PASSED] 0x46C0 (ALDERLAKE_P)
[17:39:22] [PASSED] 0x46C1 (ALDERLAKE_P)
[17:39:22] [PASSED] 0x46C2 (ALDERLAKE_P)
[17:39:22] [PASSED] 0x46C3 (ALDERLAKE_P)
[17:39:22] [PASSED] 0x46D0 (ALDERLAKE_N)
[17:39:22] [PASSED] 0x46D1 (ALDERLAKE_N)
[17:39:22] [PASSED] 0x46D2 (ALDERLAKE_N)
[17:39:22] [PASSED] 0x46D3 (ALDERLAKE_N)
[17:39:22] [PASSED] 0x46D4 (ALDERLAKE_N)
[17:39:22] [PASSED] 0xA721 (ALDERLAKE_P)
[17:39:22] [PASSED] 0xA7A1 (ALDERLAKE_P)
[17:39:22] [PASSED] 0xA7A9 (ALDERLAKE_P)
[17:39:22] [PASSED] 0xA7AC (ALDERLAKE_P)
[17:39:22] [PASSED] 0xA7AD (ALDERLAKE_P)
[17:39:22] [PASSED] 0xA720 (ALDERLAKE_P)
[17:39:22] [PASSED] 0xA7A0 (ALDERLAKE_P)
[17:39:22] [PASSED] 0xA7A8 (ALDERLAKE_P)
[17:39:22] [PASSED] 0xA7AA (ALDERLAKE_P)
[17:39:22] [PASSED] 0xA7AB (ALDERLAKE_P)
[17:39:22] [PASSED] 0xA780 (ALDERLAKE_S)
[17:39:22] [PASSED] 0xA781 (ALDERLAKE_S)
[17:39:22] [PASSED] 0xA782 (ALDERLAKE_S)
[17:39:22] [PASSED] 0xA783 (ALDERLAKE_S)
[17:39:22] [PASSED] 0xA788 (ALDERLAKE_S)
[17:39:22] [PASSED] 0xA789 (ALDERLAKE_S)
[17:39:22] [PASSED] 0xA78A (ALDERLAKE_S)
[17:39:22] [PASSED] 0xA78B (ALDERLAKE_S)
[17:39:22] [PASSED] 0x4905 (DG1)
[17:39:22] [PASSED] 0x4906 (DG1)
[17:39:22] [PASSED] 0x4907 (DG1)
[17:39:22] [PASSED] 0x4908 (DG1)
[17:39:22] [PASSED] 0x4909 (DG1)
[17:39:22] [PASSED] 0x56C0 (DG2)
[17:39:22] [PASSED] 0x56C2 (DG2)
[17:39:22] [PASSED] 0x56C1 (DG2)
[17:39:22] [PASSED] 0x7D51 (METEORLAKE)
[17:39:22] [PASSED] 0x7DD1 (METEORLAKE)
[17:39:22] [PASSED] 0x7D41 (METEORLAKE)
[17:39:22] [PASSED] 0x7D67 (METEORLAKE)
[17:39:22] [PASSED] 0xB640 (METEORLAKE)
[17:39:22] [PASSED] 0x56A0 (DG2)
[17:39:22] [PASSED] 0x56A1 (DG2)
[17:39:22] [PASSED] 0x56A2 (DG2)
[17:39:22] [PASSED] 0x56BE (DG2)
[17:39:22] [PASSED] 0x56BF (DG2)
[17:39:22] [PASSED] 0x5690 (DG2)
[17:39:22] [PASSED] 0x5691 (DG2)
[17:39:22] [PASSED] 0x5692 (DG2)
[17:39:22] [PASSED] 0x56A5 (DG2)
[17:39:22] [PASSED] 0x56A6 (DG2)
[17:39:22] [PASSED] 0x56B0 (DG2)
[17:39:22] [PASSED] 0x56B1 (DG2)
[17:39:22] [PASSED] 0x56BA (DG2)
[17:39:22] [PASSED] 0x56BB (DG2)
[17:39:22] [PASSED] 0x56BC (DG2)
[17:39:22] [PASSED] 0x56BD (DG2)
[17:39:22] [PASSED] 0x5693 (DG2)
[17:39:22] [PASSED] 0x5694 (DG2)
[17:39:22] [PASSED] 0x5695 (DG2)
[17:39:22] [PASSED] 0x56A3 (DG2)
[17:39:22] [PASSED] 0x56A4 (DG2)
[17:39:22] [PASSED] 0x56B2 (DG2)
[17:39:22] [PASSED] 0x56B3 (DG2)
[17:39:22] [PASSED] 0x5696 (DG2)
[17:39:22] [PASSED] 0x5697 (DG2)
[17:39:22] [PASSED] 0xB69 (PVC)
[17:39:22] [PASSED] 0xB6E (PVC)
[17:39:22] [PASSED] 0xBD4 (PVC)
[17:39:22] [PASSED] 0xBD5 (PVC)
[17:39:22] [PASSED] 0xBD6 (PVC)
[17:39:22] [PASSED] 0xBD7 (PVC)
[17:39:22] [PASSED] 0xBD8 (PVC)
[17:39:22] [PASSED] 0xBD9 (PVC)
[17:39:22] [PASSED] 0xBDA (PVC)
[17:39:22] [PASSED] 0xBDB (PVC)
[17:39:22] [PASSED] 0xBE0 (PVC)
[17:39:22] [PASSED] 0xBE1 (PVC)
[17:39:22] [PASSED] 0xBE5 (PVC)
[17:39:22] [PASSED] 0x7D40 (METEORLAKE)
[17:39:22] [PASSED] 0x7D45 (METEORLAKE)
[17:39:22] [PASSED] 0x7D55 (METEORLAKE)
[17:39:22] [PASSED] 0x7D60 (METEORLAKE)
[17:39:22] [PASSED] 0x7DD5 (METEORLAKE)
[17:39:22] [PASSED] 0x6420 (LUNARLAKE)
[17:39:22] [PASSED] 0x64A0 (LUNARLAKE)
[17:39:22] [PASSED] 0x64B0 (LUNARLAKE)
[17:39:22] [PASSED] 0xE202 (BATTLEMAGE)
[17:39:22] [PASSED] 0xE209 (BATTLEMAGE)
[17:39:22] [PASSED] 0xE20B (BATTLEMAGE)
[17:39:22] [PASSED] 0xE20C (BATTLEMAGE)
[17:39:22] [PASSED] 0xE20D (BATTLEMAGE)
[17:39:22] [PASSED] 0xE210 (BATTLEMAGE)
[17:39:22] [PASSED] 0xE211 (BATTLEMAGE)
[17:39:22] [PASSED] 0xE212 (BATTLEMAGE)
[17:39:22] [PASSED] 0xE216 (BATTLEMAGE)
[17:39:22] [PASSED] 0xE220 (BATTLEMAGE)
[17:39:22] [PASSED] 0xE221 (BATTLEMAGE)
[17:39:22] [PASSED] 0xE222 (BATTLEMAGE)
[17:39:22] [PASSED] 0xE223 (BATTLEMAGE)
[17:39:22] [PASSED] 0xB080 (PANTHERLAKE)
[17:39:22] [PASSED] 0xB081 (PANTHERLAKE)
[17:39:22] [PASSED] 0xB082 (PANTHERLAKE)
[17:39:22] [PASSED] 0xB083 (PANTHERLAKE)
[17:39:22] [PASSED] 0xB084 (PANTHERLAKE)
[17:39:22] [PASSED] 0xB085 (PANTHERLAKE)
[17:39:22] [PASSED] 0xB086 (PANTHERLAKE)
[17:39:22] [PASSED] 0xB087 (PANTHERLAKE)
[17:39:22] [PASSED] 0xB08F (PANTHERLAKE)
[17:39:22] [PASSED] 0xB090 (PANTHERLAKE)
[17:39:22] [PASSED] 0xB0A0 (PANTHERLAKE)
[17:39:22] [PASSED] 0xB0A1 (PANTHERLAKE)
[17:39:22] [PASSED] 0xB0B0 (PANTHERLAKE)
[17:39:22] [PASSED] 0xFD80 (PANTHERLAKE)
[17:39:22] [PASSED] 0xFD81 (PANTHERLAKE)
[17:39:22] [PASSED] 0xD740 (NOVALAKE_S)
[17:39:22] [PASSED] 0xD741 (NOVALAKE_S)
[17:39:22] [PASSED] 0xD742 (NOVALAKE_S)
[17:39:22] [PASSED] 0xD743 (NOVALAKE_S)
[17:39:22] [PASSED] 0xD745 (NOVALAKE_S)
[17:39:22] [PASSED] 0xD74A (NOVALAKE_S)
[17:39:22] [PASSED] 0xD74B (NOVALAKE_S)
[17:39:22] [PASSED] 0x674C (CRESCENTISLAND)
[17:39:22] [PASSED] 0x674D (CRESCENTISLAND)
[17:39:22] [PASSED] 0x674E (CRESCENTISLAND)
[17:39:22] [PASSED] 0x674F (CRESCENTISLAND)
[17:39:22] [PASSED] 0x6750 (CRESCENTISLAND)
[17:39:22] [PASSED] 0x6751 (CRESCENTISLAND)
[17:39:22] [PASSED] 0x6752 (CRESCENTISLAND)
[17:39:22] [PASSED] 0xD750 (NOVALAKE_P)
[17:39:22] [PASSED] 0xD751 (NOVALAKE_P)
[17:39:22] [PASSED] 0xD752 (NOVALAKE_P)
[17:39:22] [PASSED] 0xD753 (NOVALAKE_P)
[17:39:22] [PASSED] 0xD754 (NOVALAKE_P)
[17:39:22] [PASSED] 0xD755 (NOVALAKE_P)
[17:39:22] [PASSED] 0xD756 (NOVALAKE_P)
[17:39:22] [PASSED] 0xD757 (NOVALAKE_P)
[17:39:22] [PASSED] 0xD75F (NOVALAKE_P)
[17:39:22] =============== [PASSED] check_platform_desc ===============
[17:39:22] ===================== [PASSED] xe_pci ======================
[17:39:22] ============= xe_rtp_tables_test (5 subtests) ==============
[17:39:22] ================== xe_rtp_table_gt_test  ===================
[17:39:22] [PASSED] gt_was/14011060649
[17:39:22] [PASSED] gt_was/14011059788
[17:39:22] [PASSED] gt_was/14015795083
[17:39:22] [PASSED] gt_was/16021867713
[17:39:22] [PASSED] gt_was/14019449301
[17:39:22] [PASSED] gt_was/16028005424
[17:39:22] [PASSED] gt_was/14026578760
[17:39:22] [PASSED] gt_was/1409420604
[17:39:22] [PASSED] gt_was/1408615072
[17:39:22] [PASSED] gt_was/22010523718
[17:39:22] [PASSED] gt_was/14011006942
[17:39:22] [PASSED] gt_was/14014830051
[17:39:22] [PASSED] gt_was/18018781329
[17:39:22] [PASSED] gt_was/1509235366
[17:39:22] [PASSED] gt_was/18018781329
[17:39:22] [PASSED] gt_was/16016694945
[17:39:22] [PASSED] gt_was/14018575942
[17:39:22] [PASSED] gt_was/22016670082
[17:39:22] [PASSED] gt_was/22016670082
[17:39:22] [PASSED] gt_was/14017421178
[17:39:22] [PASSED] gt_was/16025250150
[17:39:22] [PASSED] gt_was/14021871409
[17:39:22] [PASSED] gt_was/16021865536
[17:39:22] [PASSED] gt_was/14021486841
[17:39:22] [PASSED] gt_was/14025160223
[17:39:22] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[17:39:22] [PASSED] gt_was/14025635424
[17:39:22] [PASSED] gt_was/16028005424
[17:39:22] ============== [PASSED] xe_rtp_table_gt_test ===============
[17:39:22] ================== xe_rtp_table_gt_test  ===================
[17:39:22] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[17:39:22] [PASSED] gt_tunings/Tuning: 32B Access Enable
[17:39:22] [PASSED] gt_tunings/Tuning: L3 cache
[17:39:22] [PASSED] gt_tunings/Tuning: L3 cache - media
[17:39:22] [PASSED] gt_tunings/Tuning: Compression Overfetch
[17:39:22] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[17:39:22] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[17:39:22] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[17:39:22] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[17:39:22] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[17:39:22] [PASSED] gt_tunings/Tuning: Stateless compression control
[17:39:22] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[17:39:22] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[17:39:22] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[17:39:22] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[17:39:22] [PASSED] gt_tunings/Tuning: Force All Non-Compressible Memory Reads to be 256B Overfetches
[17:39:22] ============== [PASSED] xe_rtp_table_gt_test ===============
[17:39:22] ================== xe_rtp_table_oob_test  ==================
[17:39:22] [PASSED] oob_was/1607983814
[17:39:22] [PASSED] oob_was/16010904313
[17:39:22] [PASSED] oob_was/18022495364
[17:39:22] [PASSED] oob_was/22012773006
[17:39:22] [PASSED] oob_was/14014475959
[17:39:22] [PASSED] oob_was/22011391025
[17:39:22] [PASSED] oob_was/22012727170
[17:39:22] [PASSED] oob_was/22012727685
[17:39:22] [PASSED] oob_was/22016596838
[17:39:22] [PASSED] oob_was/18020744125
[17:39:22] [PASSED] oob_was/1409600907
[17:39:22] [PASSED] oob_was/22014953428
[17:39:22] [PASSED] oob_was/16017236439
[17:39:22] [PASSED] oob_was/14019821291
[17:39:22] [PASSED] oob_was/14015076503
[17:39:22] [PASSED] oob_was/22016122933
[17:39:22] [PASSED] oob_was/14018913170
[17:39:22] [PASSED] oob_was/14018094691
[17:39:22] [PASSED] oob_was/18024947630
[17:39:22] [PASSED] oob_was/16022287689
[17:39:22] [PASSED] oob_was/13011645652
[17:39:22] [PASSED] oob_was/14022293748
[17:39:22] [PASSED] oob_was/22019794406
[17:39:22] [PASSED] oob_was/22019338487
[17:39:22] [PASSED] oob_was/16023588340
[17:39:22] [PASSED] oob_was/14019789679
[17:39:22] [PASSED] oob_was/14022866841
[17:39:22] [PASSED] oob_was/16021333562
[17:39:22] [PASSED] oob_was/14016712196
[17:39:22] [PASSED] oob_was/14015568240
[17:39:22] [PASSED] oob_was/18013179988
[17:39:22] [PASSED] oob_was/1508761755
[17:39:22] [PASSED] oob_was/16023105232
[17:39:22] [PASSED] oob_was/16026508708
[17:39:22] [PASSED] oob_was/14020001231
[17:39:22] [PASSED] oob_was/16023683509
[17:39:22] [PASSED] oob_was/14025515070
[17:39:22] [PASSED] oob_was/15015404425_disable
[17:39:22] [PASSED] oob_was/16026007364
[17:39:22] [PASSED] oob_was/14020316580
[17:39:22] [PASSED] oob_was/14025883347
[17:39:22] [PASSED] oob_was/16029380221
[17:39:22] [PASSED] oob_was/22022079272
[17:39:22] [PASSED] oob_was/16029897822
[17:39:22] [PASSED] oob_was/14026539277
[17:39:22] [PASSED] oob_was/14027054324
[17:39:22] [PASSED] oob_was/14025941587
[17:39:22] [PASSED] oob_was/16030224309
[17:39:22] ============== [PASSED] xe_rtp_table_oob_test ==============
[17:39:22] ================ xe_rtp_table_dev_oob_test  ================
[17:39:22] [PASSED] device_oob_was/22010954014
[17:39:22] [PASSED] device_oob_was/15015404425
[17:39:22] [PASSED] device_oob_was/22019338487_display
[17:39:22] [PASSED] device_oob_was/14022085890
[17:39:22] [PASSED] device_oob_was/14026633728
[17:39:22] [PASSED] device_oob_was/14026746987
[17:39:22] [PASSED] device_oob_was/14026779378
[17:39:22] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[17:39:22] ========== xe_rtp_table_missing_upper_bound_test  ==========
[17:39:22] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[17:39:22] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[17:39:22] [PASSED] register_whitelist/1806527549
[17:39:22] [PASSED] register_whitelist/allow_read_ctx_timestamp
[17:39:22] [PASSED] register_whitelist/allow_read_queue_timestamp
[17:39:22] [PASSED] register_whitelist/16014440446
[17:39:22] [PASSED] register_whitelist/16017236439
[17:39:22] [PASSED] register_whitelist/16020183090
[17:39:22] [PASSED] register_whitelist/14024997852
[17:39:22] [PASSED] register_whitelist/14024997852
[17:39:22] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[17:39:22] =============== [PASSED] xe_rtp_tables_test ================
[17:39:22] =================== xe_rtp (3 subtests) ====================
[17:39:22] =================== xe_rtp_rules_tests  ====================
[17:39:22] [PASSED] no
[17:39:22] [PASSED] yes
[17:39:22] [PASSED] no-and-no
[17:39:22] [PASSED] no-and-yes
[17:39:22] [PASSED] yes-and-no
[17:39:22] [PASSED] yes-and-yes
[17:39:22] [PASSED] no-or-no
[17:39:22] [PASSED] no-or-yes
[17:39:22] [PASSED] yes-or-no
[17:39:22] [PASSED] yes-or-yes
[17:39:22] [PASSED] no-yes-or-yes-no
[17:39:22] [PASSED] no-yes-or-yes-yes
[17:39:22] [PASSED] yes-yes-or-no-yes
[17:39:22] [PASSED] yes-yes-or-yes-yes
[17:39:22] [PASSED] no-no-or-yes-or-no
[17:39:22] [PASSED] or
[17:39:22] [PASSED] or-yes
[17:39:22] [PASSED] or-no
[17:39:22] [PASSED] yes-or
[17:39:22] [PASSED] no-or
[17:39:22] [PASSED] no-or-or-yes
[17:39:22] [PASSED] yes-or-or-no
[17:39:22] [PASSED] no-or-or-no
[17:39:22] [PASSED] missing-context-engine-class
[17:39:22] [PASSED] missing-context-engine-class-or-yes
[17:39:22] [PASSED] missing-context-engine-class-or-or-yes
[17:39:22] =============== [PASSED] xe_rtp_rules_tests ================
[17:39:22] =============== xe_rtp_process_to_sr_tests  ================
[17:39:22] [PASSED] coalesce-same-reg
[17:39:22] [PASSED] coalesce-same-reg-literal-and-func
[17:39:22] [PASSED] no-match-no-add
[17:39:22] [PASSED] two-regs-two-entries
[17:39:22] [PASSED] clr-one-set-other
[17:39:22] [PASSED] set-field
[17:39:22] [PASSED] conflict-duplicate
[17:39:22] [PASSED] conflict-not-disjoint
[17:39:22] [PASSED] conflict-not-disjoint-literal-and-func
[17:39:22] [PASSED] conflict-reg-type
[17:39:22] [PASSED] bad-mcr-reg-forced-to-regular
[17:39:22] [PASSED] bad-regular-reg-forced-to-mcr
[17:39:22] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[17:39:22] ================== xe_rtp_process_tests  ===================
[17:39:22] [PASSED] active1
[17:39:22] [PASSED] active2
[17:39:22] [PASSED] active-inactive
[17:39:22] [PASSED] inactive-active
[17:39:22] [PASSED] inactive-active-inactive
[17:39:22] [PASSED] inactive-inactive-inactive
[17:39:22] ============== [PASSED] xe_rtp_process_tests ===============
[17:39:22] ===================== [PASSED] xe_rtp ======================
[17:39:22] ==================== xe_wa (1 subtest) =====================
[17:39:22] ======================== xe_wa_gt  =========================
[17:39:22] [PASSED] TIGERLAKE B0
[17:39:22] [PASSED] DG1 A0
[17:39:22] [PASSED] DG1 B0
[17:39:22] [PASSED] ALDERLAKE_S A0
[17:39:22] [PASSED] ALDERLAKE_S B0
[17:39:22] [PASSED] ALDERLAKE_S C0
[17:39:22] [PASSED] ALDERLAKE_S D0
[17:39:22] [PASSED] ALDERLAKE_P A0
[17:39:22] [PASSED] ALDERLAKE_P B0
[17:39:22] [PASSED] ALDERLAKE_P C0
[17:39:22] [PASSED] ALDERLAKE_S RPLS D0
[17:39:22] [PASSED] ALDERLAKE_P RPLU E0
[17:39:22] [PASSED] DG2 G10 C0
[17:39:22] [PASSED] DG2 G11 B1
[17:39:22] [PASSED] DG2 G12 A1
[17:39:22] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[17:39:22] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[17:39:22] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[17:39:22] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[17:39:22] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[17:39:22] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[17:39:22] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[17:39:22] ==================== [PASSED] xe_wa_gt =====================
[17:39:22] ====================== [PASSED] xe_wa ======================
[17:39:22] ============================================================
[17:39:22] Testing complete. Ran 839 tests: passed: 810, skipped: 29
[17:39:22] Elapsed time: 40.745s total, 1.890s configuring, 38.089s building, 0.715s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[17:39:22] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:39:24] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:39:49] Starting KUnit Kernel (1/1)...
[17:39:49] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:39:49] ============ drm_test_pick_cmdline (2 subtests) ============
[17:39:49] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[17:39:49] =============== drm_test_pick_cmdline_named  ===============
[17:39:49] [PASSED] NTSC
[17:39:49] [PASSED] NTSC-J
[17:39:49] [PASSED] PAL
[17:39:49] [PASSED] PAL-M
[17:39:49] =========== [PASSED] drm_test_pick_cmdline_named ===========
[17:39:49] ============== [PASSED] drm_test_pick_cmdline ==============
[17:39:49] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[17:39:49] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[17:39:49] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[17:39:49] =========== drm_validate_clone_mode (2 subtests) ===========
[17:39:49] ============== drm_test_check_in_clone_mode  ===============
[17:39:49] [PASSED] in_clone_mode
[17:39:49] [PASSED] not_in_clone_mode
[17:39:49] ========== [PASSED] drm_test_check_in_clone_mode ===========
[17:39:49] =============== drm_test_check_valid_clones  ===============
[17:39:49] [PASSED] not_in_clone_mode
[17:39:49] [PASSED] valid_clone
[17:39:49] [PASSED] invalid_clone
[17:39:49] =========== [PASSED] drm_test_check_valid_clones ===========
[17:39:49] ============= [PASSED] drm_validate_clone_mode =============
[17:39:49] ============= drm_validate_modeset (1 subtest) =============
[17:39:49] [PASSED] drm_test_check_connector_changed_modeset
[17:39:49] ============== [PASSED] drm_validate_modeset ===============
[17:39:49] ====== drm_test_bridge_get_current_state (1 subtest) =======
[17:39:49] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[17:39:49] ======== [PASSED] drm_test_bridge_get_current_state ========
[17:39:49] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[17:39:49] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[17:39:49] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[17:39:49] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[17:39:49] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[17:39:49] ============== drm_bridge_alloc (2 subtests) ===============
[17:39:49] [PASSED] drm_test_drm_bridge_alloc_basic
[17:39:49] [PASSED] drm_test_drm_bridge_alloc_get_put
[17:39:49] ================ [PASSED] drm_bridge_alloc =================
[17:39:49] ============= drm_bridge_bus_fmt (5 subtests) ==============
[17:39:49] [PASSED] drm_test_bridge_rgb_yuv_rgb
[17:39:49] [PASSED] drm_test_bridge_must_convert_to_yuv444
[17:39:49] [PASSED] drm_test_bridge_hdmi_auto_rgb
[17:39:49] [PASSED] drm_test_bridge_auto_first
[17:39:49] [PASSED] drm_test_bridge_rgb_yuv_no_path
[17:39:49] =============== [PASSED] drm_bridge_bus_fmt ================
[17:39:49] ============= drm_cmdline_parser (40 subtests) =============
[17:39:49] [PASSED] drm_test_cmdline_force_d_only
[17:39:49] [PASSED] drm_test_cmdline_force_D_only_dvi
[17:39:49] [PASSED] drm_test_cmdline_force_D_only_hdmi
[17:39:49] [PASSED] drm_test_cmdline_force_D_only_not_digital
[17:39:49] [PASSED] drm_test_cmdline_force_e_only
[17:39:49] [PASSED] drm_test_cmdline_res
[17:39:49] [PASSED] drm_test_cmdline_res_vesa
[17:39:49] [PASSED] drm_test_cmdline_res_vesa_rblank
[17:39:49] [PASSED] drm_test_cmdline_res_rblank
[17:39:49] [PASSED] drm_test_cmdline_res_bpp
[17:39:49] [PASSED] drm_test_cmdline_res_refresh
[17:39:49] [PASSED] drm_test_cmdline_res_bpp_refresh
[17:39:49] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[17:39:49] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[17:39:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[17:39:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[17:39:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[17:39:49] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[17:39:49] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[17:39:49] [PASSED] drm_test_cmdline_res_margins_force_on
[17:39:49] [PASSED] drm_test_cmdline_res_vesa_margins
[17:39:49] [PASSED] drm_test_cmdline_name
[17:39:49] [PASSED] drm_test_cmdline_name_bpp
[17:39:49] [PASSED] drm_test_cmdline_name_option
[17:39:49] [PASSED] drm_test_cmdline_name_bpp_option
[17:39:49] [PASSED] drm_test_cmdline_rotate_0
[17:39:49] [PASSED] drm_test_cmdline_rotate_90
[17:39:49] [PASSED] drm_test_cmdline_rotate_180
[17:39:49] [PASSED] drm_test_cmdline_rotate_270
[17:39:49] [PASSED] drm_test_cmdline_hmirror
[17:39:49] [PASSED] drm_test_cmdline_vmirror
[17:39:49] [PASSED] drm_test_cmdline_margin_options
[17:39:49] [PASSED] drm_test_cmdline_multiple_options
[17:39:49] [PASSED] drm_test_cmdline_bpp_extra_and_option
[17:39:49] [PASSED] drm_test_cmdline_extra_and_option
[17:39:49] [PASSED] drm_test_cmdline_freestanding_options
[17:39:49] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[17:39:49] [PASSED] drm_test_cmdline_panel_orientation
[17:39:49] ================ drm_test_cmdline_invalid  =================
[17:39:49] [PASSED] margin_only
[17:39:49] [PASSED] interlace_only
[17:39:49] [PASSED] res_missing_x
[17:39:49] [PASSED] res_missing_y
[17:39:49] [PASSED] res_bad_y
[17:39:49] [PASSED] res_missing_y_bpp
[17:39:49] [PASSED] res_bad_bpp
[17:39:49] [PASSED] res_bad_refresh
[17:39:49] [PASSED] res_bpp_refresh_force_on_off
[17:39:49] [PASSED] res_invalid_mode
[17:39:49] [PASSED] res_bpp_wrong_place_mode
[17:39:49] [PASSED] name_bpp_refresh
[17:39:49] [PASSED] name_refresh
[17:39:49] [PASSED] name_refresh_wrong_mode
[17:39:49] [PASSED] name_refresh_invalid_mode
[17:39:49] [PASSED] rotate_multiple
[17:39:49] [PASSED] rotate_invalid_val
[17:39:49] [PASSED] rotate_truncated
[17:39:49] [PASSED] invalid_option
[17:39:49] [PASSED] invalid_tv_option
[17:39:49] [PASSED] truncated_tv_option
[17:39:49] ============ [PASSED] drm_test_cmdline_invalid =============
[17:39:49] =============== drm_test_cmdline_tv_options  ===============
[17:39:49] [PASSED] NTSC
[17:39:49] [PASSED] NTSC_443
[17:39:49] [PASSED] NTSC_J
[17:39:49] [PASSED] PAL
[17:39:49] [PASSED] PAL_M
[17:39:49] [PASSED] PAL_N
[17:39:49] [PASSED] SECAM
[17:39:49] [PASSED] MONO_525
[17:39:49] [PASSED] MONO_625
[17:39:49] =========== [PASSED] drm_test_cmdline_tv_options ===========
[17:39:49] =============== [PASSED] drm_cmdline_parser ================
[17:39:49] ========== drmm_connector_hdmi_init (20 subtests) ==========
[17:39:49] [PASSED] drm_test_connector_hdmi_init_valid
[17:39:49] [PASSED] drm_test_connector_hdmi_init_bpc_8
[17:39:49] [PASSED] drm_test_connector_hdmi_init_bpc_10
[17:39:49] [PASSED] drm_test_connector_hdmi_init_bpc_12
[17:39:49] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[17:39:49] [PASSED] drm_test_connector_hdmi_init_bpc_null
[17:39:49] [PASSED] drm_test_connector_hdmi_init_formats_empty
[17:39:49] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[17:39:49] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[17:39:49] [PASSED] supported_formats=0x9 yuv420_allowed=1
[17:39:49] [PASSED] supported_formats=0x9 yuv420_allowed=0
[17:39:49] [PASSED] supported_formats=0x5 yuv420_allowed=1
[17:39:49] [PASSED] supported_formats=0x5 yuv420_allowed=0
[17:39:49] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[17:39:49] [PASSED] drm_test_connector_hdmi_init_null_ddc
[17:39:49] [PASSED] drm_test_connector_hdmi_init_null_product
[17:39:49] [PASSED] drm_test_connector_hdmi_init_null_vendor
[17:39:49] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[17:39:49] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[17:39:49] [PASSED] drm_test_connector_hdmi_init_product_valid
[17:39:49] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[17:39:49] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[17:39:49] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[17:39:49] ========= drm_test_connector_hdmi_init_type_valid  =========
[17:39:49] [PASSED] HDMI-A
[17:39:49] [PASSED] HDMI-B
[17:39:49] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[17:39:49] ======== drm_test_connector_hdmi_init_type_invalid  ========
[17:39:49] [PASSED] Unknown
[17:39:49] [PASSED] VGA
[17:39:49] [PASSED] DVI-I
[17:39:49] [PASSED] DVI-D
[17:39:49] [PASSED] DVI-A
[17:39:49] [PASSED] Composite
[17:39:49] [PASSED] SVIDEO
[17:39:49] [PASSED] LVDS
[17:39:49] [PASSED] Component
[17:39:49] [PASSED] DIN
[17:39:49] [PASSED] DP
[17:39:49] [PASSED] TV
[17:39:49] [PASSED] eDP
[17:39:49] [PASSED] Virtual
[17:39:49] [PASSED] DSI
[17:39:49] [PASSED] DPI
[17:39:49] [PASSED] Writeback
[17:39:49] [PASSED] SPI
[17:39:49] [PASSED] USB
[17:39:49] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[17:39:49] ============ [PASSED] drmm_connector_hdmi_init =============
[17:39:49] ============= drmm_connector_init (3 subtests) =============
[17:39:49] [PASSED] drm_test_drmm_connector_init
[17:39:49] [PASSED] drm_test_drmm_connector_init_null_ddc
[17:39:49] ========= drm_test_drmm_connector_init_type_valid  =========
[17:39:49] [PASSED] Unknown
[17:39:49] [PASSED] VGA
[17:39:49] [PASSED] DVI-I
[17:39:49] [PASSED] DVI-D
[17:39:49] [PASSED] DVI-A
[17:39:49] [PASSED] Composite
[17:39:49] [PASSED] SVIDEO
[17:39:49] [PASSED] LVDS
[17:39:49] [PASSED] Component
[17:39:49] [PASSED] DIN
[17:39:49] [PASSED] DP
[17:39:49] [PASSED] HDMI-A
[17:39:49] [PASSED] HDMI-B
[17:39:49] [PASSED] TV
[17:39:49] [PASSED] eDP
[17:39:49] [PASSED] Virtual
[17:39:49] [PASSED] DSI
[17:39:49] [PASSED] DPI
[17:39:49] [PASSED] Writeback
[17:39:49] [PASSED] SPI
[17:39:49] [PASSED] USB
[17:39:49] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[17:39:49] =============== [PASSED] drmm_connector_init ===============
[17:39:49] ========= drm_connector_dynamic_init (6 subtests) ==========
[17:39:49] [PASSED] drm_test_drm_connector_dynamic_init
[17:39:49] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[17:39:49] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[17:39:49] [PASSED] drm_test_drm_connector_dynamic_init_properties
[17:39:49] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[17:39:49] [PASSED] Unknown
[17:39:49] [PASSED] VGA
[17:39:49] [PASSED] DVI-I
[17:39:49] [PASSED] DVI-D
[17:39:49] [PASSED] DVI-A
[17:39:49] [PASSED] Composite
[17:39:49] [PASSED] SVIDEO
[17:39:49] [PASSED] LVDS
[17:39:49] [PASSED] Component
[17:39:49] [PASSED] DIN
[17:39:49] [PASSED] DP
[17:39:49] [PASSED] HDMI-A
[17:39:49] [PASSED] HDMI-B
[17:39:49] [PASSED] TV
[17:39:49] [PASSED] eDP
[17:39:49] [PASSED] Virtual
[17:39:49] [PASSED] DSI
[17:39:49] [PASSED] DPI
[17:39:49] [PASSED] Writeback
[17:39:49] [PASSED] SPI
[17:39:49] [PASSED] USB
[17:39:49] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[17:39:49] ======== drm_test_drm_connector_dynamic_init_name  =========
[17:39:49] [PASSED] Unknown
[17:39:49] [PASSED] VGA
[17:39:49] [PASSED] DVI-I
[17:39:49] [PASSED] DVI-D
[17:39:49] [PASSED] DVI-A
[17:39:49] [PASSED] Composite
[17:39:49] [PASSED] SVIDEO
[17:39:49] [PASSED] LVDS
[17:39:49] [PASSED] Component
[17:39:49] [PASSED] DIN
[17:39:49] [PASSED] DP
[17:39:49] [PASSED] HDMI-A
[17:39:49] [PASSED] HDMI-B
[17:39:49] [PASSED] TV
[17:39:49] [PASSED] eDP
[17:39:49] [PASSED] Virtual
[17:39:49] [PASSED] DSI
[17:39:49] [PASSED] DPI
[17:39:49] [PASSED] Writeback
[17:39:49] [PASSED] SPI
[17:39:49] [PASSED] USB
[17:39:49] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[17:39:49] =========== [PASSED] drm_connector_dynamic_init ============
[17:39:49] ==== drm_connector_dynamic_register_early (4 subtests) =====
[17:39:49] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[17:39:49] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[17:39:49] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[17:39:49] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[17:39:49] ====== [PASSED] drm_connector_dynamic_register_early =======
[17:39:49] ======= drm_connector_dynamic_register (7 subtests) ========
[17:39:49] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[17:39:49] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[17:39:49] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[17:39:49] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[17:39:49] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[17:39:49] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[17:39:49] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[17:39:49] ========= [PASSED] drm_connector_dynamic_register ==========
[17:39:49] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[17:39:49] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[17:39:49] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[17:39:49] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[17:39:49] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[17:39:49] ========== drm_test_get_tv_mode_from_name_valid  ===========
[17:39:49] [PASSED] NTSC
[17:39:49] [PASSED] NTSC-443
[17:39:49] [PASSED] NTSC-J
[17:39:49] [PASSED] PAL
[17:39:49] [PASSED] PAL-M
[17:39:49] [PASSED] PAL-N
[17:39:49] [PASSED] SECAM
[17:39:49] [PASSED] Mono
[17:39:49] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[17:39:49] [PASSED] drm_test_get_tv_mode_from_name_truncated
[17:39:49] ============ [PASSED] drm_get_tv_mode_from_name ============
[17:39:49] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[17:39:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[17:39:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[17:39:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[17:39:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[17:39:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[17:39:49] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[17:39:49] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[17:39:49] [PASSED] VIC 96
[17:39:49] [PASSED] VIC 97
[17:39:49] [PASSED] VIC 101
[17:39:49] [PASSED] VIC 102
[17:39:49] [PASSED] VIC 106
[17:39:49] [PASSED] VIC 107
[17:39:49] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[17:39:49] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[17:39:49] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[17:39:49] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[17:39:49] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[17:39:49] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[17:39:49] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[17:39:49] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[17:39:49] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[17:39:49] [PASSED] Automatic
[17:39:49] [PASSED] Full
[17:39:49] [PASSED] Limited 16:235
[17:39:49] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[17:39:49] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[17:39:49] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[17:39:49] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[17:39:49] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[17:39:49] [PASSED] RGB
[17:39:49] [PASSED] YUV 4:2:0
[17:39:49] [PASSED] YUV 4:2:2
[17:39:49] [PASSED] YUV 4:4:4
[17:39:49] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[17:39:49] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[17:39:49] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[17:39:49] ============= drm_damage_helper (21 subtests) ==============
[17:39:49] [PASSED] drm_test_damage_iter_no_damage
[17:39:49] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[17:39:49] [PASSED] drm_test_damage_iter_no_damage_src_moved
[17:39:49] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[17:39:49] [PASSED] drm_test_damage_iter_no_damage_not_visible
[17:39:49] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[17:39:49] [PASSED] drm_test_damage_iter_no_damage_no_fb
[17:39:49] [PASSED] drm_test_damage_iter_simple_damage
[17:39:49] [PASSED] drm_test_damage_iter_single_damage
[17:39:49] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[17:39:49] [PASSED] drm_test_damage_iter_single_damage_outside_src
[17:39:49] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[17:39:49] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[17:39:49] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[17:39:49] [PASSED] drm_test_damage_iter_single_damage_src_moved
[17:39:49] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[17:39:49] [PASSED] drm_test_damage_iter_damage
[17:39:49] [PASSED] drm_test_damage_iter_damage_one_intersect
[17:39:49] [PASSED] drm_test_damage_iter_damage_one_outside
[17:39:49] [PASSED] drm_test_damage_iter_damage_src_moved
[17:39:49] [PASSED] drm_test_damage_iter_damage_not_visible
[17:39:49] ================ [PASSED] drm_damage_helper ================
[17:39:49] ============== drm_dp_mst_helper (3 subtests) ==============
[17:39:49] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[17:39:49] [PASSED] Clock 154000 BPP 30 DSC disabled
[17:39:49] [PASSED] Clock 234000 BPP 30 DSC disabled
[17:39:49] [PASSED] Clock 297000 BPP 24 DSC disabled
[17:39:49] [PASSED] Clock 332880 BPP 24 DSC enabled
[17:39:49] [PASSED] Clock 324540 BPP 24 DSC enabled
[17:39:49] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[17:39:49] ============== drm_test_dp_mst_calc_pbn_div  ===============
[17:39:49] [PASSED] Link rate 2000000 lane count 4
[17:39:49] [PASSED] Link rate 2000000 lane count 2
[17:39:49] [PASSED] Link rate 2000000 lane count 1
[17:39:49] [PASSED] Link rate 1350000 lane count 4
[17:39:49] [PASSED] Link rate 1350000 lane count 2
[17:39:49] [PASSED] Link rate 1350000 lane count 1
[17:39:49] [PASSED] Link rate 1000000 lane count 4
[17:39:49] [PASSED] Link rate 1000000 lane count 2
[17:39:49] [PASSED] Link rate 1000000 lane count 1
[17:39:49] [PASSED] Link rate 810000 lane count 4
[17:39:49] [PASSED] Link rate 810000 lane count 2
[17:39:49] [PASSED] Link rate 810000 lane count 1
[17:39:49] [PASSED] Link rate 540000 lane count 4
[17:39:49] [PASSED] Link rate 540000 lane count 2
[17:39:49] [PASSED] Link rate 540000 lane count 1
[17:39:49] [PASSED] Link rate 270000 lane count 4
[17:39:49] [PASSED] Link rate 270000 lane count 2
[17:39:49] [PASSED] Link rate 270000 lane count 1
[17:39:49] [PASSED] Link rate 162000 lane count 4
[17:39:49] [PASSED] Link rate 162000 lane count 2
[17:39:49] [PASSED] Link rate 162000 lane count 1
[17:39:49] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[17:39:49] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[17:39:49] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[17:39:49] [PASSED] DP_POWER_UP_PHY with port number
[17:39:49] [PASSED] DP_POWER_DOWN_PHY with port number
[17:39:49] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[17:39:49] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[17:39:49] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[17:39:49] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[17:39:49] [PASSED] DP_QUERY_PAYLOAD with port number
[17:39:49] [PASSED] DP_QUERY_PAYLOAD with VCPI
[17:39:49] [PASSED] DP_REMOTE_DPCD_READ with port number
[17:39:49] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[17:39:49] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[17:39:49] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[17:39:49] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[17:39:49] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[17:39:49] [PASSED] DP_REMOTE_I2C_READ with port number
[17:39:49] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[17:39:49] [PASSED] DP_REMOTE_I2C_READ with transactions array
[17:39:49] [PASSED] DP_REMOTE_I2C_WRITE with port number
[17:39:49] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[17:39:49] [PASSED] DP_REMOTE_I2C_WRITE with data array
[17:39:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[17:39:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[17:39:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[17:39:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[17:39:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[17:39:49] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[17:39:49] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[17:39:49] ================ [PASSED] drm_dp_mst_helper ================
[17:39:49] ================== drm_exec (7 subtests) ===================
[17:39:49] [PASSED] sanitycheck
[17:39:49] [PASSED] test_lock
[17:39:49] [PASSED] test_lock_unlock
[17:39:49] [PASSED] test_duplicates
[17:39:49] [PASSED] test_prepare
[17:39:49] [PASSED] test_prepare_array
[17:39:49] [PASSED] test_multiple_loops
[17:39:49] ==================== [PASSED] drm_exec =====================
[17:39:49] =========== drm_format_helper_test (17 subtests) ===========
[17:39:49] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[17:39:49] [PASSED] single_pixel_source_buffer
[17:39:49] [PASSED] single_pixel_clip_rectangle
[17:39:49] [PASSED] well_known_colors
[17:39:49] [PASSED] destination_pitch
[17:39:49] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[17:39:49] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[17:39:49] [PASSED] single_pixel_source_buffer
[17:39:49] [PASSED] single_pixel_clip_rectangle
[17:39:49] [PASSED] well_known_colors
[17:39:49] [PASSED] destination_pitch
[17:39:49] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[17:39:49] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[17:39:49] [PASSED] single_pixel_source_buffer
[17:39:49] [PASSED] single_pixel_clip_rectangle
[17:39:49] [PASSED] well_known_colors
[17:39:49] [PASSED] destination_pitch
[17:39:49] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[17:39:49] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[17:39:49] [PASSED] single_pixel_source_buffer
[17:39:49] [PASSED] single_pixel_clip_rectangle
[17:39:49] [PASSED] well_known_colors
[17:39:49] [PASSED] destination_pitch
[17:39:49] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[17:39:49] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[17:39:49] [PASSED] single_pixel_source_buffer
[17:39:49] [PASSED] single_pixel_clip_rectangle
[17:39:49] [PASSED] well_known_colors
[17:39:49] [PASSED] destination_pitch
[17:39:49] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[17:39:49] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[17:39:49] [PASSED] single_pixel_source_buffer
[17:39:49] [PASSED] single_pixel_clip_rectangle
[17:39:49] [PASSED] well_known_colors
[17:39:49] [PASSED] destination_pitch
[17:39:49] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[17:39:49] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[17:39:49] [PASSED] single_pixel_source_buffer
[17:39:49] [PASSED] single_pixel_clip_rectangle
[17:39:49] [PASSED] well_known_colors
[17:39:49] [PASSED] destination_pitch
[17:39:49] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[17:39:49] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[17:39:49] [PASSED] single_pixel_source_buffer
[17:39:49] [PASSED] single_pixel_clip_rectangle
[17:39:49] [PASSED] well_known_colors
[17:39:49] [PASSED] destination_pitch
[17:39:49] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[17:39:49] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[17:39:49] [PASSED] single_pixel_source_buffer
[17:39:49] [PASSED] single_pixel_clip_rectangle
[17:39:49] [PASSED] well_known_colors
[17:39:49] [PASSED] destination_pitch
[17:39:49] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[17:39:49] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[17:39:49] [PASSED] single_pixel_source_buffer
[17:39:49] [PASSED] single_pixel_clip_rectangle
[17:39:49] [PASSED] well_known_colors
[17:39:49] [PASSED] destination_pitch
[17:39:49] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[17:39:49] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[17:39:49] [PASSED] single_pixel_source_buffer
[17:39:49] [PASSED] single_pixel_clip_rectangle
[17:39:49] [PASSED] well_known_colors
[17:39:49] [PASSED] destination_pitch
[17:39:49] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[17:39:49] ============== drm_test_fb_xrgb8888_to_mono  ===============
[17:39:49] [PASSED] single_pixel_source_buffer
[17:39:49] [PASSED] single_pixel_clip_rectangle
[17:39:49] [PASSED] well_known_colors
[17:39:49] [PASSED] destination_pitch
[17:39:49] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[17:39:49] ==================== drm_test_fb_swab  =====================
[17:39:49] [PASSED] single_pixel_source_buffer
[17:39:49] [PASSED] single_pixel_clip_rectangle
[17:39:49] [PASSED] well_known_colors
[17:39:49] [PASSED] destination_pitch
[17:39:49] ================ [PASSED] drm_test_fb_swab =================
[17:39:49] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[17:39:49] [PASSED] single_pixel_source_buffer
[17:39:49] [PASSED] single_pixel_clip_rectangle
[17:39:49] [PASSED] well_known_colors
[17:39:49] [PASSED] destination_pitch
[17:39:49] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[17:39:49] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[17:39:49] [PASSED] single_pixel_source_buffer
[17:39:49] [PASSED] single_pixel_clip_rectangle
[17:39:49] [PASSED] well_known_colors
[17:39:49] [PASSED] destination_pitch
[17:39:49] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[17:39:49] ================= drm_test_fb_clip_offset  =================
[17:39:49] [PASSED] pass through
[17:39:49] [PASSED] horizontal offset
[17:39:49] [PASSED] vertical offset
[17:39:49] [PASSED] horizontal and vertical offset
[17:39:49] [PASSED] horizontal offset (custom pitch)
[17:39:49] [PASSED] vertical offset (custom pitch)
[17:39:49] [PASSED] horizontal and vertical offset (custom pitch)
[17:39:49] ============= [PASSED] drm_test_fb_clip_offset =============
[17:39:49] =================== drm_test_fb_memcpy  ====================
[17:39:49] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[17:39:49] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[17:39:49] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[17:39:49] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[17:39:49] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[17:39:49] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[17:39:49] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[17:39:49] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[17:39:49] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[17:39:49] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[17:39:49] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[17:39:49] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[17:39:49] =============== [PASSED] drm_test_fb_memcpy ================
[17:39:49] ============= [PASSED] drm_format_helper_test ==============
[17:39:49] ================= drm_format (18 subtests) =================
[17:39:49] [PASSED] drm_test_format_block_width_invalid
[17:39:49] [PASSED] drm_test_format_block_width_one_plane
[17:39:49] [PASSED] drm_test_format_block_width_two_plane
[17:39:49] [PASSED] drm_test_format_block_width_three_plane
[17:39:49] [PASSED] drm_test_format_block_width_tiled
[17:39:49] [PASSED] drm_test_format_block_height_invalid
[17:39:49] [PASSED] drm_test_format_block_height_one_plane
[17:39:49] [PASSED] drm_test_format_block_height_two_plane
[17:39:49] [PASSED] drm_test_format_block_height_three_plane
[17:39:49] [PASSED] drm_test_format_block_height_tiled
[17:39:49] [PASSED] drm_test_format_min_pitch_invalid
[17:39:49] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[17:39:49] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[17:39:49] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[17:39:49] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[17:39:49] [PASSED] drm_test_format_min_pitch_two_plane
[17:39:49] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[17:39:49] [PASSED] drm_test_format_min_pitch_tiled
[17:39:49] =================== [PASSED] drm_format ====================
[17:39:49] ============== drm_framebuffer (10 subtests) ===============
[17:39:49] ========== drm_test_framebuffer_check_src_coords  ==========
[17:39:49] [PASSED] Success: source fits into fb
[17:39:49] [PASSED] Fail: overflowing fb with x-axis coordinate
[17:39:49] [PASSED] Fail: overflowing fb with y-axis coordinate
[17:39:49] [PASSED] Fail: overflowing fb with source width
[17:39:49] [PASSED] Fail: overflowing fb with source height
[17:39:49] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[17:39:49] [PASSED] drm_test_framebuffer_cleanup
[17:39:49] =============== drm_test_framebuffer_create  ===============
[17:39:49] [PASSED] ABGR8888 normal sizes
[17:39:49] [PASSED] ABGR8888 max sizes
[17:39:49] [PASSED] ABGR8888 pitch greater than min required
[17:39:49] [PASSED] ABGR8888 pitch less than min required
[17:39:49] [PASSED] ABGR8888 Invalid width
[17:39:49] [PASSED] ABGR8888 Invalid buffer handle
[17:39:49] [PASSED] No pixel format
[17:39:49] [PASSED] ABGR8888 Width 0
[17:39:49] [PASSED] ABGR8888 Height 0
[17:39:49] [PASSED] ABGR8888 Out of bound height * pitch combination
[17:39:49] [PASSED] ABGR8888 Large buffer offset
[17:39:49] [PASSED] ABGR8888 Buffer offset for inexistent plane
[17:39:49] [PASSED] ABGR8888 Invalid flag
[17:39:49] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[17:39:49] [PASSED] ABGR8888 Valid buffer modifier
[17:39:49] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[17:39:49] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[17:39:49] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[17:39:49] [PASSED] NV12 Normal sizes
[17:39:49] [PASSED] NV12 Max sizes
[17:39:49] [PASSED] NV12 Invalid pitch
[17:39:49] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[17:39:49] [PASSED] NV12 different  modifier per-plane
[17:39:49] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[17:39:49] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[17:39:49] [PASSED] NV12 Modifier for inexistent plane
[17:39:49] [PASSED] NV12 Handle for inexistent plane
[17:39:49] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[17:39:49] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[17:39:49] [PASSED] YVU420 Normal sizes
[17:39:49] [PASSED] YVU420 Max sizes
[17:39:49] [PASSED] YVU420 Invalid pitch
[17:39:49] [PASSED] YVU420 Different pitches
[17:39:49] [PASSED] YVU420 Different buffer offsets/pitches
[17:39:49] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[17:39:49] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[17:39:49] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[17:39:49] [PASSED] YVU420 Valid modifier
[17:39:49] [PASSED] YVU420 Different modifiers per plane
[17:39:49] [PASSED] YVU420 Modifier for inexistent plane
[17:39:49] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[17:39:49] [PASSED] X0L2 Normal sizes
[17:39:49] [PASSED] X0L2 Max sizes
[17:39:49] [PASSED] X0L2 Invalid pitch
[17:39:49] [PASSED] X0L2 Pitch greater than minimum required
[17:39:49] [PASSED] X0L2 Handle for inexistent plane
[17:39:49] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[17:39:49] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[17:39:49] [PASSED] X0L2 Valid modifier
[17:39:49] [PASSED] X0L2 Modifier for inexistent plane
[17:39:49] =========== [PASSED] drm_test_framebuffer_create ===========
[17:39:49] [PASSED] drm_test_framebuffer_free
[17:39:49] [PASSED] drm_test_framebuffer_init
[17:39:49] [PASSED] drm_test_framebuffer_init_bad_format
[17:39:49] [PASSED] drm_test_framebuffer_init_dev_mismatch
[17:39:49] [PASSED] drm_test_framebuffer_lookup
[17:39:49] [PASSED] drm_test_framebuffer_lookup_inexistent
[17:39:49] [PASSED] drm_test_framebuffer_modifiers_not_supported
[17:39:49] ================= [PASSED] drm_framebuffer =================
[17:39:49] ================ drm_gem_shmem (8 subtests) ================
[17:39:49] [PASSED] drm_gem_shmem_test_obj_create
[17:39:49] [PASSED] drm_gem_shmem_test_obj_create_private
[17:39:49] [PASSED] drm_gem_shmem_test_pin_pages
[17:39:49] [PASSED] drm_gem_shmem_test_vmap
[17:39:49] [PASSED] drm_gem_shmem_test_get_sg_table
[17:39:49] [PASSED] drm_gem_shmem_test_get_pages_sgt
[17:39:49] [PASSED] drm_gem_shmem_test_madvise
[17:39:49] [PASSED] drm_gem_shmem_test_purge
[17:39:49] ================== [PASSED] drm_gem_shmem ==================
[17:39:49] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[17:39:49] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[17:39:49] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[17:39:49] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[17:39:49] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[17:39:49] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[17:39:49] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[17:39:49] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[17:39:49] [PASSED] Automatic
[17:39:49] [PASSED] Full
[17:39:49] [PASSED] Limited 16:235
[17:39:49] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[17:39:49] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[17:39:49] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[17:39:49] [PASSED] drm_test_check_disable_connector
[17:39:49] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[17:39:49] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[17:39:49] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[17:39:49] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[17:39:49] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[17:39:49] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[17:39:49] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[17:39:49] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[17:39:49] [PASSED] drm_test_check_output_bpc_dvi
[17:39:49] [PASSED] drm_test_check_output_bpc_format_vic_1
[17:39:49] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[17:39:49] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[17:39:49] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[17:39:49] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[17:39:49] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[17:39:49] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[17:39:49] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[17:39:49] ============ drm_test_check_hdmi_color_format  =============
[17:39:49] [PASSED] AUTO -> RGB
[17:39:49] [PASSED] YCBCR422 -> YUV422
[17:39:49] [PASSED] YCBCR420 -> YUV420
[17:39:49] [PASSED] YCBCR444 -> YUV444
[17:39:49] [PASSED] RGB -> RGB
[17:39:49] ======== [PASSED] drm_test_check_hdmi_color_format =========
[17:39:49] ======== drm_test_check_hdmi_color_format_420_only  ========
[17:39:49] [PASSED] RGB should fail
[17:39:49] [PASSED] YUV444 should fail
[17:39:49] [PASSED] YUV422 should fail
[17:39:49] [PASSED] YUV420 should work
[17:39:49] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[17:39:49] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[17:39:49] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[17:39:49] [PASSED] drm_test_check_broadcast_rgb_value
[17:39:49] [PASSED] drm_test_check_bpc_8_value
[17:39:49] [PASSED] drm_test_check_bpc_10_value
[17:39:49] [PASSED] drm_test_check_bpc_12_value
[17:39:49] [PASSED] drm_test_check_format_value
[17:39:49] [PASSED] drm_test_check_tmds_char_value
[17:39:49] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[17:39:49] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[17:39:49] [PASSED] drm_test_check_mode_valid
[17:39:49] [PASSED] drm_test_check_mode_valid_reject
[17:39:49] [PASSED] drm_test_check_mode_valid_reject_rate
[17:39:49] [PASSED] drm_test_check_mode_valid_reject_max_clock
[17:39:49] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[17:39:49] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[17:39:49] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[17:39:49] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[17:39:49] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[17:39:49] [PASSED] drm_test_check_infoframes
[17:39:49] [PASSED] drm_test_check_reject_avi_infoframe
[17:39:49] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[17:39:49] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[17:39:49] [PASSED] drm_test_check_reject_audio_infoframe
[17:39:49] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[17:39:49] ================= drm_managed (2 subtests) =================
[17:39:49] [PASSED] drm_test_managed_release_action
[17:39:49] [PASSED] drm_test_managed_run_action
[17:39:49] =================== [PASSED] drm_managed ===================
[17:39:49] =================== drm_mm (6 subtests) ====================
[17:39:49] [PASSED] drm_test_mm_init
[17:39:49] [PASSED] drm_test_mm_debug
[17:39:49] [PASSED] drm_test_mm_align32
[17:39:49] [PASSED] drm_test_mm_align64
[17:39:49] [PASSED] drm_test_mm_lowest
[17:39:49] [PASSED] drm_test_mm_highest
[17:39:49] ===================== [PASSED] drm_mm ======================
[17:39:49] ============= drm_modes_analog_tv (5 subtests) =============
[17:39:49] [PASSED] drm_test_modes_analog_tv_mono_576i
[17:39:49] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[17:39:49] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[17:39:49] [PASSED] drm_test_modes_analog_tv_pal_576i
[17:39:49] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[17:39:49] =============== [PASSED] drm_modes_analog_tv ===============
[17:39:49] ============== drm_panic_helper (3 subtests) ===============
[17:39:49] ============= drm_test_panic_screen_user_map  ==============
[17:39:49] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[17:39:49] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[17:39:49] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[17:39:49] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[17:39:49] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[17:39:49] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[17:39:49] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[17:39:49] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[17:39:49] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[17:39:49] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[17:39:49] ========= [PASSED] drm_test_panic_screen_user_map ==========
[17:39:49] ============= drm_test_panic_screen_user_page  =============
[17:39:49] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[17:39:49] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[17:39:49] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[17:39:49] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[17:39:49] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[17:39:49] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[17:39:49] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[17:39:49] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[17:39:49] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[17:39:49] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[17:39:49] ========= [PASSED] drm_test_panic_screen_user_page =========
[17:39:49] ========== drm_test_panic_screen_user_set_pixel  ===========
[17:39:49] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[17:39:49] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[17:39:49] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[17:39:49] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[17:39:49] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[17:39:49] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[17:39:49] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[17:39:49] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[17:39:49] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[17:39:49] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[17:39:49] ====== [PASSED] drm_test_panic_screen_user_set_pixel =======
[17:39:49] ================ [PASSED] drm_panic_helper =================
[17:39:49] ============== drm_plane_helper (2 subtests) ===============
[17:39:49] =============== drm_test_check_plane_state  ================
[17:39:49] [PASSED] clipping_simple
[17:39:49] [PASSED] clipping_rotate_reflect
[17:39:49] [PASSED] positioning_simple
[17:39:49] [PASSED] upscaling
[17:39:49] [PASSED] downscaling
[17:39:49] [PASSED] rounding1
[17:39:49] [PASSED] rounding2
[17:39:49] [PASSED] rounding3
[17:39:49] [PASSED] rounding4
[17:39:49] =========== [PASSED] drm_test_check_plane_state ============
[17:39:49] =========== drm_test_check_invalid_plane_state  ============
[17:39:49] [PASSED] positioning_invalid
[17:39:49] [PASSED] upscaling_invalid
[17:39:49] [PASSED] downscaling_invalid
[17:39:49] ======= [PASSED] drm_test_check_invalid_plane_state ========
[17:39:49] ================ [PASSED] drm_plane_helper =================
[17:39:49] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[17:39:49] ====== drm_test_connector_helper_tv_get_modes_check  =======
[17:39:49] [PASSED] None
[17:39:49] [PASSED] PAL
[17:39:49] [PASSED] NTSC
[17:39:49] [PASSED] Both, NTSC Default
[17:39:49] [PASSED] Both, PAL Default
[17:39:49] [PASSED] Both, NTSC Default, with PAL on command-line
[17:39:49] [PASSED] Both, PAL Default, with NTSC on command-line
[17:39:49] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[17:39:49] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[17:39:49] ================== drm_rect (9 subtests) ===================
[17:39:49] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[17:39:49] [PASSED] drm_test_rect_clip_scaled_not_clipped
[17:39:49] [PASSED] drm_test_rect_clip_scaled_clipped
[17:39:49] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[17:39:49] ================= drm_test_rect_intersect  =================
[17:39:49] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[17:39:49] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[17:39:49] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[17:39:49] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[17:39:49] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[17:39:49] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[17:39:49] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[17:39:49] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[17:39:49] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[17:39:49] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[17:39:49] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[17:39:49] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[17:39:49] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[17:39:49] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[17:39:49] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[17:39:49] ============= [PASSED] drm_test_rect_intersect =============
[17:39:49] ================ drm_test_rect_calc_hscale  ================
[17:39:49] [PASSED] normal use
[17:39:49] [PASSED] out of max range
[17:39:49] [PASSED] out of min range
[17:39:49] [PASSED] zero dst
[17:39:49] [PASSED] negative src
[17:39:49] [PASSED] negative dst
[17:39:49] ============ [PASSED] drm_test_rect_calc_hscale ============
[17:39:49] ================ drm_test_rect_calc_vscale  ================
[17:39:49] [PASSED] normal use
[17:39:49] [PASSED] out of max range
[17:39:49] [PASSED] out of min range
[17:39:49] [PASSED] zero dst
[17:39:49] [PASSED] negative src
[17:39:49] [PASSED] negative dst
[17:39:49] ============ [PASSED] drm_test_rect_calc_vscale ============
[17:39:49] ================== drm_test_rect_rotate  ===================
[17:39:49] [PASSED] reflect-x
[17:39:49] [PASSED] reflect-y
[17:39:49] [PASSED] rotate-0
[17:39:49] [PASSED] rotate-90
[17:39:49] [PASSED] rotate-180
[17:39:49] [PASSED] rotate-270
[17:39:49] ============== [PASSED] drm_test_rect_rotate ===============
[17:39:49] ================ drm_test_rect_rotate_inv  =================
[17:39:49] [PASSED] reflect-x
[17:39:49] [PASSED] reflect-y
[17:39:49] [PASSED] rotate-0
[17:39:49] [PASSED] rotate-90
[17:39:49] [PASSED] rotate-180
[17:39:49] [PASSED] rotate-270
[17:39:49] ============ [PASSED] drm_test_rect_rotate_inv =============
[17:39:49] ==================== [PASSED] drm_rect =====================
[17:39:49] ============ drm_sysfb_modeset_test (1 subtest) ============
[17:39:49] ============ drm_test_sysfb_build_fourcc_list  =============
[17:39:49] [PASSED] no native formats
[17:39:49] [PASSED] XRGB8888 as native format
[17:39:49] [PASSED] remove duplicates
[17:39:49] [PASSED] convert alpha formats
[17:39:49] [PASSED] random formats
[17:39:49] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[17:39:49] ============= [PASSED] drm_sysfb_modeset_test ==============
[17:39:49] ================== drm_fixp (2 subtests) ===================
[17:39:49] [PASSED] drm_test_int2fixp
[17:39:49] [PASSED] drm_test_sm2fixp
[17:39:49] ==================== [PASSED] drm_fixp =====================
[17:39:49] ============================================================
[17:39:49] Testing complete. Ran 667 tests: passed: 667
[17:39:49] Elapsed time: 27.149s total, 1.865s configuring, 24.864s building, 0.413s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[17:39:49] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:39:51] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:40:01] Starting KUnit Kernel (1/1)...
[17:40:01] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:40:01] ================= ttm_device (5 subtests) ==================
[17:40:01] [PASSED] ttm_device_init_basic
[17:40:01] [PASSED] ttm_device_init_multiple
[17:40:01] [PASSED] ttm_device_fini_basic
[17:40:01] [PASSED] ttm_device_init_no_vma_man
[17:40:01] ================== ttm_device_init_pools  ==================
[17:40:01] [PASSED] No DMA allocations, no DMA32 required
[17:40:01] [PASSED] DMA allocations, DMA32 required
[17:40:01] [PASSED] No DMA allocations, DMA32 required
[17:40:01] [PASSED] DMA allocations, no DMA32 required
[17:40:01] ============== [PASSED] ttm_device_init_pools ==============
[17:40:01] =================== [PASSED] ttm_device ====================
[17:40:01] ================== ttm_pool (8 subtests) ===================
[17:40:01] ================== ttm_pool_alloc_basic  ===================
[17:40:01] [PASSED] One page
[17:40:01] [PASSED] More than one page
[17:40:01] [PASSED] Above the allocation limit
[17:40:01] [PASSED] One page, with coherent DMA mappings enabled
[17:40:01] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[17:40:01] ============== [PASSED] ttm_pool_alloc_basic ===============
[17:40:01] ============== ttm_pool_alloc_basic_dma_addr  ==============
[17:40:01] [PASSED] One page
[17:40:01] [PASSED] More than one page
[17:40:01] [PASSED] Above the allocation limit
[17:40:01] [PASSED] One page, with coherent DMA mappings enabled
[17:40:01] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[17:40:01] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[17:40:01] [PASSED] ttm_pool_alloc_order_caching_match
[17:40:01] [PASSED] ttm_pool_alloc_caching_mismatch
[17:40:01] [PASSED] ttm_pool_alloc_order_mismatch
[17:40:01] [PASSED] ttm_pool_free_dma_alloc
[17:40:01] [PASSED] ttm_pool_free_no_dma_alloc
[17:40:01] [PASSED] ttm_pool_fini_basic
[17:40:01] ==================== [PASSED] ttm_pool =====================
[17:40:01] ================ ttm_resource (8 subtests) =================
[17:40:01] ================= ttm_resource_init_basic  =================
[17:40:01] [PASSED] Init resource in TTM_PL_SYSTEM
[17:40:01] [PASSED] Init resource in TTM_PL_VRAM
[17:40:01] [PASSED] Init resource in a private placement
[17:40:01] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[17:40:01] ============= [PASSED] ttm_resource_init_basic =============
[17:40:01] [PASSED] ttm_resource_init_pinned
[17:40:01] [PASSED] ttm_resource_fini_basic
[17:40:01] [PASSED] ttm_resource_manager_init_basic
[17:40:01] [PASSED] ttm_resource_manager_usage_basic
[17:40:01] [PASSED] ttm_resource_manager_set_used_basic
[17:40:01] [PASSED] ttm_sys_man_alloc_basic
[17:40:01] [PASSED] ttm_sys_man_free_basic
[17:40:01] ================== [PASSED] ttm_resource ===================
[17:40:01] =================== ttm_tt (15 subtests) ===================
[17:40:01] ==================== ttm_tt_init_basic  ====================
[17:40:01] [PASSED] Page-aligned size
[17:40:01] [PASSED] Extra pages requested
[17:40:01] ================ [PASSED] ttm_tt_init_basic ================
[17:40:01] [PASSED] ttm_tt_init_misaligned
[17:40:01] [PASSED] ttm_tt_fini_basic
[17:40:01] [PASSED] ttm_tt_fini_sg
[17:40:01] [PASSED] ttm_tt_fini_shmem
[17:40:01] [PASSED] ttm_tt_create_basic
[17:40:01] [PASSED] ttm_tt_create_invalid_bo_type
[17:40:01] [PASSED] ttm_tt_create_ttm_exists
[17:40:01] [PASSED] ttm_tt_create_failed
[17:40:01] [PASSED] ttm_tt_destroy_basic
[17:40:01] [PASSED] ttm_tt_populate_null_ttm
[17:40:01] [PASSED] ttm_tt_populate_populated_ttm
[17:40:01] [PASSED] ttm_tt_unpopulate_basic
[17:40:01] [PASSED] ttm_tt_unpopulate_empty_ttm
[17:40:01] [PASSED] ttm_tt_swapin_basic
[17:40:01] ===================== [PASSED] ttm_tt ======================
[17:40:01] =================== ttm_bo (14 subtests) ===================
[17:40:01] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[17:40:01] [PASSED] Cannot be interrupted and sleeps
[17:40:01] [PASSED] Cannot be interrupted, locks straight away
[17:40:01] [PASSED] Can be interrupted, sleeps
[17:40:01] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[17:40:01] [PASSED] ttm_bo_reserve_locked_no_sleep
[17:40:01] [PASSED] ttm_bo_reserve_no_wait_ticket
[17:40:01] [PASSED] ttm_bo_reserve_double_resv
[17:40:01] [PASSED] ttm_bo_reserve_interrupted
[17:40:01] [PASSED] ttm_bo_reserve_deadlock
[17:40:01] [PASSED] ttm_bo_unreserve_basic
[17:40:01] [PASSED] ttm_bo_unreserve_pinned
[17:40:01] [PASSED] ttm_bo_unreserve_bulk
[17:40:01] [PASSED] ttm_bo_fini_basic
[17:40:01] [PASSED] ttm_bo_fini_shared_resv
[17:40:01] [PASSED] ttm_bo_pin_basic
[17:40:01] [PASSED] ttm_bo_pin_unpin_resource
[17:40:01] [PASSED] ttm_bo_multiple_pin_one_unpin
[17:40:01] ===================== [PASSED] ttm_bo ======================
[17:40:01] ============== ttm_bo_validate (22 subtests) ===============
[17:40:01] ============== ttm_bo_init_reserved_sys_man  ===============
[17:40:01] [PASSED] Buffer object for userspace
[17:40:01] [PASSED] Kernel buffer object
[17:40:01] [PASSED] Shared buffer object
[17:40:01] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[17:40:01] ============== ttm_bo_init_reserved_mock_man  ==============
[17:40:01] [PASSED] Buffer object for userspace
[17:40:01] [PASSED] Kernel buffer object
[17:40:01] [PASSED] Shared buffer object
[17:40:01] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[17:40:01] [PASSED] ttm_bo_init_reserved_resv
[17:40:01] ================== ttm_bo_validate_basic  ==================
[17:40:01] [PASSED] Buffer object for userspace
[17:40:01] [PASSED] Kernel buffer object
[17:40:01] [PASSED] Shared buffer object
[17:40:01] ============== [PASSED] ttm_bo_validate_basic ==============
[17:40:01] [PASSED] ttm_bo_validate_invalid_placement
[17:40:01] ============= ttm_bo_validate_same_placement  ==============
[17:40:01] [PASSED] System manager
[17:40:01] [PASSED] VRAM manager
[17:40:01] ========= [PASSED] ttm_bo_validate_same_placement ==========
[17:40:01] [PASSED] ttm_bo_validate_failed_alloc
[17:40:01] [PASSED] ttm_bo_validate_pinned
[17:40:01] [PASSED] ttm_bo_validate_busy_placement
[17:40:01] ================ ttm_bo_validate_multihop  =================
[17:40:01] [PASSED] Buffer object for userspace
[17:40:01] [PASSED] Kernel buffer object
[17:40:01] [PASSED] Shared buffer object
[17:40:01] ============ [PASSED] ttm_bo_validate_multihop =============
[17:40:01] ========== ttm_bo_validate_no_placement_signaled  ==========
[17:40:01] [PASSED] Buffer object in system domain, no page vector
[17:40:01] [PASSED] Buffer object in system domain with an existing page vector
[17:40:01] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[17:40:01] ======== ttm_bo_validate_no_placement_not_signaled  ========
[17:40:01] [PASSED] Buffer object for userspace
[17:40:01] [PASSED] Kernel buffer object
[17:40:01] [PASSED] Shared buffer object
[17:40:01] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[17:40:01] [PASSED] ttm_bo_validate_move_fence_signaled
[17:40:01] ========= ttm_bo_validate_move_fence_not_signaled  =========
[17:40:01] [PASSED] Waits for GPU
[17:40:01] [PASSED] Tries to lock straight away
[17:40:01] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[17:40:01] [PASSED] ttm_bo_validate_swapout
[17:40:01] [PASSED] ttm_bo_validate_happy_evict
[17:40:01] [PASSED] ttm_bo_validate_all_pinned_evict
[17:40:01] [PASSED] ttm_bo_validate_allowed_only_evict
[17:40:01] [PASSED] ttm_bo_validate_deleted_evict
[17:40:01] [PASSED] ttm_bo_validate_busy_domain_evict
[17:40:01] [PASSED] ttm_bo_validate_evict_gutting
[17:40:01] [PASSED] ttm_bo_validate_recrusive_evict
[17:40:01] ================= [PASSED] ttm_bo_validate =================
[17:40:01] ============================================================
[17:40:01] Testing complete. Ran 102 tests: passed: 102
[17:40:02] Elapsed time: 12.140s total, 1.841s configuring, 10.034s building, 0.231s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/dma-buf/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[17:40:02] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:40:03] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:40:12] Starting KUnit Kernel (1/1)...
[17:40:12] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:40:12] =============== dma-buf-fence (12 subtests) ================
[17:40:12] [PASSED] test_sanitycheck
[17:40:12] [PASSED] test_signaling
[17:40:12] [PASSED] test_add_callback
[17:40:12] [PASSED] test_late_add_callback
[17:40:12] [PASSED] test_rm_callback
[17:40:12] [PASSED] test_late_rm_callback
[17:40:12] [PASSED] test_status
[17:40:12] [PASSED] test_error
[17:40:12] [PASSED] test_wait
[17:40:12] [PASSED] test_wait_timeout
[17:40:12] [PASSED] test_stub
[17:40:12] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[17:40:12] ================== [PASSED] dma-buf-fence ==================
[17:40:12] ============ dma-buf-fence-chain (11 subtests) =============
[17:40:12] [PASSED] test_sanitycheck
[17:40:12] [PASSED] test_find_seqno
[17:40:12] [PASSED] test_find_signaled
[17:40:12] [PASSED] test_find_out_of_order
[17:40:17] [PASSED] test_find_gap
[17:40:17] [PASSED] test_find_race
[17:40:17] [PASSED] test_signal_forward
[17:40:18] [PASSED] test_signal_backward
[17:40:18] [PASSED] test_wait_forward
[17:40:18] [PASSED] test_wait_backward
[17:40:18] [PASSED] test_wait_random
[17:40:18] =============== [PASSED] dma-buf-fence-chain ===============
[17:40:18] ============ dma-buf-fence-unwrap (11 subtests) ============
[17:40:18] [PASSED] test_sanitycheck
[17:40:18] [PASSED] test_unwrap_array
[17:40:18] [PASSED] test_unwrap_chain
[17:40:18] [PASSED] test_unwrap_chain_array
[17:40:18] [PASSED] test_unwrap_merge
[17:40:18] [PASSED] test_unwrap_merge_duplicate
[17:40:18] [PASSED] test_unwrap_merge_seqno
[17:40:18] [PASSED] test_unwrap_merge_order
[17:40:18] [PASSED] test_unwrap_merge_complex
[17:40:18] [PASSED] test_unwrap_merge_complex_seqno
[17:40:18] [PASSED] test_dedup_empty
[17:40:18] ============== [PASSED] dma-buf-fence-unwrap ===============
[17:40:18] ================ dma-buf-resv (5 subtests) =================
[17:40:18] [PASSED] test_sanitycheck
[17:40:18] ===================== test_signaling  ======================
[17:40:18] [PASSED] kernel
[17:40:18] [PASSED] write
[17:40:18] [PASSED] read
[17:40:18] [PASSED] bookkeep
[17:40:18] ================= [PASSED] test_signaling ==================
[17:40:18] ====================== test_for_each  ======================
[17:40:18] [PASSED] kernel
[17:40:18] [PASSED] write
[17:40:18] [PASSED] read
[17:40:18] [PASSED] bookkeep
[17:40:18] ================== [PASSED] test_for_each ==================
[17:40:18] ================= test_for_each_unlocked  ==================
[17:40:18] [PASSED] kernel
[17:40:18] [PASSED] write
[17:40:18] [PASSED] read
[17:40:18] [PASSED] bookkeep
[17:40:18] ============= [PASSED] test_for_each_unlocked ==============
[17:40:18] ===================== test_get_fences  =====================
[17:40:18] [PASSED] kernel
[17:40:18] [PASSED] write
[17:40:18] [PASSED] read
[17:40:18] [PASSED] bookkeep
[17:40:18] ================= [PASSED] test_get_fences =================
[17:40:18] ================== [PASSED] dma-buf-resv ===================
[17:40:18] ============================================================
[17:40:18] Testing complete. Ran 51 tests: passed: 50, skipped: 1
[17:40:18] Elapsed time: 15.911s total, 1.828s configuring, 8.812s building, 5.266s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


