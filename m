Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D237606A31B
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 01:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8F110E08E;
	Wed, 21 Oct 2026 01:02:53 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCEC10E08E;
 Wed, 21 Oct 2026 01:02:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/cri=3A_Set_downstream_a?=
 =?utf-8?q?ccess_to_L3_class_3_and_write-back_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Charles" <daniel.charles@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Oct 2026 01:02:52 -0000
Message-ID: <179254457230.48718.17414276238572475417@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261021002051.1784161-1-daniel.charles@intel.com>
In-Reply-To: <20261021002051.1784161-1-daniel.charles@intel.com>
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

Series: drm/xe/cri: Set downstream access to L3 class 3 and write-back (rev3)
URL   : https://patchwork.freedesktop.org/series/175785/
State : success

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[01:00:43] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:00:48] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[01:01:08] Starting KUnit Kernel (1/1)...
[01:01:08] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:01:08] ================= gpu_buddy (14 subtests) ==================
[01:01:08] [PASSED] gpu_test_buddy_alloc_limit
[01:01:08] [PASSED] gpu_test_buddy_alloc_optimistic
[01:01:08] [PASSED] gpu_test_buddy_alloc_pessimistic
[01:01:08] [PASSED] gpu_test_buddy_alloc_pathological
[01:01:08] [PASSED] gpu_test_buddy_alloc_contiguous
[01:01:08] [PASSED] gpu_test_buddy_alloc_clear
[01:01:08] [PASSED] gpu_test_buddy_alloc_range
[01:01:08] [PASSED] gpu_test_buddy_alloc_range_bias
[01:01:09] [PASSED] gpu_test_buddy_fragmentation_performance
[01:01:10] [PASSED] gpu_test_buddy_dirty_tracker_performance
[01:01:10] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[01:01:10] [PASSED] gpu_test_buddy_offset_aligned_allocation
[01:01:10] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[01:01:10] [PASSED] gpu_test_buddy_addr_to_block
[01:01:10] ==================== [PASSED] gpu_buddy ====================
[01:01:10] ============================================================
[01:01:10] Testing complete. Ran 14 tests: passed: 14
[01:01:10] Elapsed time: 26.571s total, 4.465s configuring, 20.237s building, 1.819s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[01:01:10] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:01:12] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[01:01:50] Starting KUnit Kernel (1/1)...
[01:01:50] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:01:51] ================== guc_buf (11 subtests) ===================
[01:01:51] [PASSED] test_smallest
[01:01:51] [PASSED] test_largest
[01:01:51] [PASSED] test_granular
[01:01:51] [PASSED] test_unique
[01:01:51] [PASSED] test_overlap
[01:01:51] [PASSED] test_reusable
[01:01:51] [PASSED] test_too_big
[01:01:51] [PASSED] test_flush
[01:01:51] [PASSED] test_lookup
[01:01:51] [PASSED] test_data
[01:01:51] [PASSED] test_class
[01:01:51] ===================== [PASSED] guc_buf =====================
[01:01:51] =================== guc_dbm (7 subtests) ===================
[01:01:51] [PASSED] test_empty
[01:01:51] [PASSED] test_default
[01:01:51] ======================== test_size  ========================
[01:01:51] [PASSED] 4
[01:01:51] [PASSED] 8
[01:01:51] [PASSED] 32
[01:01:51] [PASSED] 256
[01:01:51] ==================== [PASSED] test_size ====================
[01:01:51] ======================= test_reuse  ========================
[01:01:51] [PASSED] 4
[01:01:51] [PASSED] 8
[01:01:51] [PASSED] 32
[01:01:51] [PASSED] 256
[01:01:51] =================== [PASSED] test_reuse ====================
[01:01:51] =================== test_range_overlap  ====================
[01:01:51] [PASSED] 4
[01:01:51] [PASSED] 8
[01:01:51] [PASSED] 32
[01:01:51] [PASSED] 256
[01:01:51] =============== [PASSED] test_range_overlap ================
[01:01:51] =================== test_range_compact  ====================
[01:01:51] [PASSED] 4
[01:01:51] [PASSED] 8
[01:01:51] [PASSED] 32
[01:01:51] [PASSED] 256
[01:01:51] =============== [PASSED] test_range_compact ================
[01:01:51] ==================== test_range_spare  =====================
[01:01:51] [PASSED] 4
[01:01:51] [PASSED] 8
[01:01:51] [PASSED] 32
[01:01:51] [PASSED] 256
[01:01:51] ================ [PASSED] test_range_spare =================
[01:01:51] ===================== [PASSED] guc_dbm =====================
[01:01:51] ================== guc_idm (22 subtests) ===================
[01:01:51] [PASSED] bad_init
[01:01:51] [PASSED] no_init
[01:01:51] [PASSED] init_fini
[01:01:51] [PASSED] check_init_small
[01:01:51] [PASSED] check_init_shared
[01:01:51] [PASSED] check_used
[01:01:51] [PASSED] check_quota
[01:01:51] [PASSED] check_all
[01:01:51] [PASSED] check_limits
[01:01:51] [PASSED] check_overlap
[01:01:51] [PASSED] check_overlap_alloc
[01:01:51] [PASSED] check_overlap_release
[01:01:51] [PASSED] check_overlap_partial_init
[01:01:51] [PASSED] check_overlap_partial_shared_range_blocking
[01:01:51] [PASSED] check_used_usable
[01:01:51] [PASSED] check_used_shareable
[01:01:51] [PASSED] check_used_mixed
[01:01:51] [PASSED] check_release_usable_range
[01:01:51] [PASSED] check_release_shareable_range
[01:01:51] [PASSED] check_split_boundaries
[01:01:51] [PASSED] check_shareable_spare
[01:01:51] [PASSED] check_shareable_spare_fragmented_tail
[01:01:51] ===================== [PASSED] guc_idm =====================
[01:01:51] ============== guc_klv_helpers (13 subtests) ===============
[01:01:51] [PASSED] test_count
[01:01:51] [PASSED] test_encode_u32
[01:01:51] [PASSED] test_encode_u64
[01:01:51] [PASSED] test_encode_string
[01:01:51] [PASSED] test_encode_object_raw
[01:01:51] [PASSED] test_encode_object_klv
[01:01:51] [PASSED] test_encode_object_nested
[01:01:51] [PASSED] test_encode_object_basic
[01:01:51] ===================== test_decode_u16  =====================
[01:01:51] [PASSED] empty
[01:01:51] [PASSED] valid
[01:01:51] [PASSED] max
[01:01:51] [PASSED] big
[01:01:51] [PASSED] long
[01:01:51] ================= [PASSED] test_decode_u16 =================
[01:01:51] ===================== test_decode_u32  =====================
[01:01:51] [PASSED] empty
[01:01:51] [PASSED] valid
[01:01:51] [PASSED] max
[01:01:51] [PASSED] long
[01:01:51] ================= [PASSED] test_decode_u32 =================
[01:01:51] ===================== test_decode_u64  =====================
[01:01:51] [PASSED] empty
[01:01:51] [PASSED] short
[01:01:51] [PASSED] valid
[01:01:51] [PASSED] max
[01:01:51] [PASSED] long
[01:01:51] ================= [PASSED] test_decode_u64 =================
[01:01:51] ===================== test_decode_str  =====================
[01:01:51] [PASSED] empty
[01:01:51] [PASSED] one
[01:01:51] [PASSED] one_trash
[01:01:51] [PASSED] two
[01:01:51] [PASSED] two_trash
[01:01:51] [PASSED] three
[01:01:51] [PASSED] dword
[01:01:51] [PASSED] four
[01:01:51] [PASSED] five
[01:01:51] [PASSED] six
[01:01:51] [PASSED] seven
[01:01:51] [PASSED] qword
[01:01:51] ================= [PASSED] test_decode_str =================
[01:01:51] [PASSED] test_print
[01:01:51] ================= [PASSED] guc_klv_helpers =================
[01:01:51] =================== xe_log (4 subtests) ====================
[01:01:51] [PASSED] demo_cper
[01:01:51] [PASSED] demo_dmesg
[01:01:51] ======================= test_dmesg  ========================
[01:01:51] [PASSED] test_fatal
[01:01:51] [PASSED] test_fatal_tile
[01:01:51] [PASSED] test_fatal_gt
[01:01:51] [PASSED] test_fatal_comp
[01:01:51] [PASSED] test_fatal_comp_tile
[01:01:51] [PASSED] test_fatal_comp_gt
[01:01:51] [PASSED] test_fatal_all
[01:01:51] [PASSED] test_recoverable
[01:01:51] [PASSED] test_recoverable_tile
[01:01:51] [PASSED] test_recoverable_gt
[01:01:51] [PASSED] test_recoverable_comp
[01:01:51] [PASSED] test_recoverable_comp_tile
[01:01:51] [PASSED] test_recoverable_comp_gt
[01:01:51] [PASSED] test_recoverable_all
[01:01:51] [PASSED] test_info
[01:01:51] [PASSED] test_info_tile
[01:01:51] [PASSED] test_info_gt
[01:01:51] [PASSED] test_info_err
[01:01:51] [PASSED] test_info_comp
[01:01:51] [PASSED] test_info_comp_tile
[01:01:51] [PASSED] test_info_comp_gt
[01:01:51] [PASSED] test_info_all
[01:01:51] [PASSED] test_hw_fatal
[01:01:51] [PASSED] test_hw_recoverable
[01:01:51] [PASSED] test_hw_corrected
[01:01:51] [PASSED] test_hw_informational
[01:01:51] =================== [PASSED] test_dmesg ====================
[01:01:51] ====================== test_invalid  =======================
[01:01:51] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[01:01:51] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[01:01:51] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[01:01:51] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[01:01:51] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[01:01:51] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[01:01:51] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[01:01:51] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[01:01:51] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[01:01:51] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[01:01:51] ================== [SKIPPED] test_invalid ==================
[01:01:51] ===================== [PASSED] xe_log ======================
[01:01:51] ================== no_relay (3 subtests) ===================
[01:01:51] [PASSED] xe_drops_guc2pf_if_not_ready
[01:01:51] [PASSED] xe_drops_guc2vf_if_not_ready
[01:01:51] [PASSED] xe_rejects_send_if_not_ready
[01:01:51] ==================== [PASSED] no_relay =====================
[01:01:51] ================== pf_relay (14 subtests) ==================
[01:01:51] [PASSED] pf_rejects_guc2pf_too_short
[01:01:51] [PASSED] pf_rejects_guc2pf_too_long
[01:01:51] [PASSED] pf_rejects_guc2pf_no_payload
[01:01:51] [PASSED] pf_fails_no_payload
[01:01:51] [PASSED] pf_fails_bad_origin
[01:01:51] [PASSED] pf_fails_bad_type
[01:01:51] [PASSED] pf_txn_reports_error
[01:01:51] [PASSED] pf_txn_sends_pf2guc
[01:01:51] [PASSED] pf_sends_pf2guc
[01:01:51] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[01:01:51] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[01:01:51] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[01:01:51] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[01:01:51] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[01:01:51] ==================== [PASSED] pf_relay =====================
[01:01:51] ================== vf_relay (3 subtests) ===================
[01:01:51] [PASSED] vf_rejects_guc2vf_too_short
[01:01:51] [PASSED] vf_rejects_guc2vf_too_long
[01:01:51] [PASSED] vf_rejects_guc2vf_no_payload
[01:01:51] ==================== [PASSED] vf_relay =====================
[01:01:51] ================ pf_gt_config (9 subtests) =================
[01:01:51] [PASSED] fair_contexts_1vf
[01:01:51] [PASSED] fair_doorbells_1vf
[01:01:51] [PASSED] fair_ggtt_1vf
[01:01:51] ====================== fair_vram_1vf  ======================
[01:01:51] [PASSED] 3.50 GiB
[01:01:51] [PASSED] 11.5 GiB
[01:01:51] [PASSED] 15.5 GiB
[01:01:51] [PASSED] 31.5 GiB
[01:01:51] [PASSED] 63.5 GiB
[01:01:51] [PASSED] 1.91 GiB
[01:01:51] ================== [PASSED] fair_vram_1vf ==================
[01:01:51] ================ fair_vram_1vf_admin_only  =================
[01:01:51] [PASSED] 3.50 GiB
[01:01:51] [PASSED] 11.5 GiB
[01:01:51] [PASSED] 15.5 GiB
[01:01:51] [PASSED] 31.5 GiB
[01:01:51] [PASSED] 63.5 GiB
[01:01:51] [PASSED] 1.91 GiB
[01:01:51] ============ [PASSED] fair_vram_1vf_admin_only =============
[01:01:51] ====================== fair_contexts  ======================
[01:01:51] [PASSED] 1 VF
[01:01:51] [PASSED] 2 VFs
[01:01:51] [PASSED] 3 VFs
[01:01:51] [PASSED] 4 VFs
[01:01:51] [PASSED] 5 VFs
[01:01:51] [PASSED] 6 VFs
[01:01:51] [PASSED] 7 VFs
[01:01:51] [PASSED] 8 VFs
[01:01:51] [PASSED] 9 VFs
[01:01:51] [PASSED] 10 VFs
[01:01:51] [PASSED] 11 VFs
[01:01:51] [PASSED] 12 VFs
[01:01:51] [PASSED] 13 VFs
[01:01:51] [PASSED] 14 VFs
[01:01:51] [PASSED] 15 VFs
[01:01:51] [PASSED] 16 VFs
[01:01:51] [PASSED] 17 VFs
[01:01:51] [PASSED] 18 VFs
[01:01:51] [PASSED] 19 VFs
[01:01:51] [PASSED] 20 VFs
[01:01:51] [PASSED] 21 VFs
[01:01:51] [PASSED] 22 VFs
[01:01:51] [PASSED] 23 VFs
[01:01:51] [PASSED] 24 VFs
[01:01:51] [PASSED] 25 VFs
[01:01:51] [PASSED] 26 VFs
[01:01:51] [PASSED] 27 VFs
[01:01:51] [PASSED] 28 VFs
[01:01:51] [PASSED] 29 VFs
[01:01:51] [PASSED] 30 VFs
[01:01:51] [PASSED] 31 VFs
[01:01:51] [PASSED] 32 VFs
[01:01:51] [PASSED] 33 VFs
[01:01:51] [PASSED] 34 VFs
[01:01:51] [PASSED] 35 VFs
[01:01:51] [PASSED] 36 VFs
[01:01:51] [PASSED] 37 VFs
[01:01:51] [PASSED] 38 VFs
[01:01:51] [PASSED] 39 VFs
[01:01:51] [PASSED] 40 VFs
[01:01:51] [PASSED] 41 VFs
[01:01:51] [PASSED] 42 VFs
[01:01:51] [PASSED] 43 VFs
[01:01:51] [PASSED] 44 VFs
[01:01:51] [PASSED] 45 VFs
[01:01:51] [PASSED] 46 VFs
[01:01:51] [PASSED] 47 VFs
[01:01:51] [PASSED] 48 VFs
[01:01:51] [PASSED] 49 VFs
[01:01:51] [PASSED] 50 VFs
[01:01:51] [PASSED] 51 VFs
[01:01:51] [PASSED] 52 VFs
[01:01:51] [PASSED] 53 VFs
[01:01:51] [PASSED] 54 VFs
[01:01:51] [PASSED] 55 VFs
[01:01:51] [PASSED] 56 VFs
[01:01:51] [PASSED] 57 VFs
[01:01:51] [PASSED] 58 VFs
[01:01:51] [PASSED] 59 VFs
[01:01:51] [PASSED] 60 VFs
[01:01:51] [PASSED] 61 VFs
[01:01:51] [PASSED] 62 VFs
[01:01:51] [PASSED] 63 VFs
[01:01:51] ================== [PASSED] fair_contexts ==================
[01:01:51] ===================== fair_doorbells  ======================
[01:01:51] [PASSED] 1 VF
[01:01:51] [PASSED] 2 VFs
[01:01:51] [PASSED] 3 VFs
[01:01:51] [PASSED] 4 VFs
[01:01:51] [PASSED] 5 VFs
[01:01:51] [PASSED] 6 VFs
[01:01:51] [PASSED] 7 VFs
[01:01:51] [PASSED] 8 VFs
[01:01:51] [PASSED] 9 VFs
[01:01:51] [PASSED] 10 VFs
[01:01:51] [PASSED] 11 VFs
[01:01:51] [PASSED] 12 VFs
[01:01:51] [PASSED] 13 VFs
[01:01:51] [PASSED] 14 VFs
[01:01:51] [PASSED] 15 VFs
[01:01:51] [PASSED] 16 VFs
[01:01:51] [PASSED] 17 VFs
[01:01:51] [PASSED] 18 VFs
[01:01:51] [PASSED] 19 VFs
[01:01:51] [PASSED] 20 VFs
[01:01:51] [PASSED] 21 VFs
[01:01:51] [PASSED] 22 VFs
[01:01:51] [PASSED] 23 VFs
[01:01:51] [PASSED] 24 VFs
[01:01:51] [PASSED] 25 VFs
[01:01:51] [PASSED] 26 VFs
[01:01:51] [PASSED] 27 VFs
[01:01:51] [PASSED] 28 VFs
[01:01:51] [PASSED] 29 VFs
[01:01:51] [PASSED] 30 VFs
[01:01:51] [PASSED] 31 VFs
[01:01:51] [PASSED] 32 VFs
[01:01:51] [PASSED] 33 VFs
[01:01:51] [PASSED] 34 VFs
[01:01:51] [PASSED] 35 VFs
[01:01:51] [PASSED] 36 VFs
[01:01:51] [PASSED] 37 VFs
[01:01:51] [PASSED] 38 VFs
[01:01:51] [PASSED] 39 VFs
[01:01:51] [PASSED] 40 VFs
[01:01:51] [PASSED] 41 VFs
[01:01:51] [PASSED] 42 VFs
[01:01:51] [PASSED] 43 VFs
[01:01:51] [PASSED] 44 VFs
[01:01:51] [PASSED] 45 VFs
[01:01:51] [PASSED] 46 VFs
[01:01:51] [PASSED] 47 VFs
[01:01:51] [PASSED] 48 VFs
[01:01:51] [PASSED] 49 VFs
[01:01:51] [PASSED] 50 VFs
[01:01:51] [PASSED] 51 VFs
[01:01:51] [PASSED] 52 VFs
[01:01:51] [PASSED] 53 VFs
[01:01:51] [PASSED] 54 VFs
[01:01:51] [PASSED] 55 VFs
[01:01:51] [PASSED] 56 VFs
[01:01:51] [PASSED] 57 VFs
[01:01:51] [PASSED] 58 VFs
[01:01:51] [PASSED] 59 VFs
[01:01:51] [PASSED] 60 VFs
[01:01:51] [PASSED] 61 VFs
[01:01:51] [PASSED] 62 VFs
[01:01:51] [PASSED] 63 VFs
[01:01:51] ================= [PASSED] fair_doorbells ==================
[01:01:51] ======================== fair_ggtt  ========================
[01:01:51] [PASSED] 1 VF
[01:01:51] [PASSED] 2 VFs
[01:01:51] [PASSED] 3 VFs
[01:01:51] [PASSED] 4 VFs
[01:01:51] [PASSED] 5 VFs
[01:01:51] [PASSED] 6 VFs
[01:01:51] [PASSED] 7 VFs
[01:01:51] [PASSED] 8 VFs
[01:01:51] [PASSED] 9 VFs
[01:01:51] [PASSED] 10 VFs
[01:01:51] [PASSED] 11 VFs
[01:01:51] [PASSED] 12 VFs
[01:01:51] [PASSED] 13 VFs
[01:01:51] [PASSED] 14 VFs
[01:01:51] [PASSED] 15 VFs
[01:01:51] [PASSED] 16 VFs
[01:01:51] [PASSED] 17 VFs
[01:01:51] [PASSED] 18 VFs
[01:01:51] [PASSED] 19 VFs
[01:01:51] [PASSED] 20 VFs
[01:01:51] [PASSED] 21 VFs
[01:01:51] [PASSED] 22 VFs
[01:01:51] [PASSED] 23 VFs
[01:01:51] [PASSED] 24 VFs
[01:01:51] [PASSED] 25 VFs
[01:01:51] [PASSED] 26 VFs
[01:01:51] [PASSED] 27 VFs
[01:01:51] [PASSED] 28 VFs
[01:01:51] [PASSED] 29 VFs
[01:01:51] [PASSED] 30 VFs
[01:01:51] [PASSED] 31 VFs
[01:01:51] [PASSED] 32 VFs
[01:01:51] [PASSED] 33 VFs
[01:01:51] [PASSED] 34 VFs
[01:01:51] [PASSED] 35 VFs
[01:01:51] [PASSED] 36 VFs
[01:01:51] [PASSED] 37 VFs
[01:01:51] [PASSED] 38 VFs
[01:01:51] [PASSED] 39 VFs
[01:01:51] [PASSED] 40 VFs
[01:01:51] [PASSED] 41 VFs
[01:01:51] [PASSED] 42 VFs
[01:01:51] [PASSED] 43 VFs
[01:01:51] [PASSED] 44 VFs
[01:01:51] [PASSED] 45 VFs
[01:01:51] [PASSED] 46 VFs
[01:01:51] [PASSED] 47 VFs
[01:01:51] [PASSED] 48 VFs
[01:01:51] [PASSED] 49 VFs
[01:01:51] [PASSED] 50 VFs
[01:01:51] [PASSED] 51 VFs
[01:01:51] [PASSED] 52 VFs
[01:01:51] [PASSED] 53 VFs
[01:01:51] [PASSED] 54 VFs
[01:01:51] [PASSED] 55 VFs
[01:01:51] [PASSED] 56 VFs
[01:01:51] [PASSED] 57 VFs
[01:01:51] [PASSED] 58 VFs
[01:01:51] [PASSED] 59 VFs
[01:01:51] [PASSED] 60 VFs
[01:01:51] [PASSED] 61 VFs
[01:01:51] [PASSED] 62 VFs
[01:01:51] [PASSED] 63 VFs
[01:01:51] ==================== [PASSED] fair_ggtt ====================
[01:01:51] ======================== fair_vram  ========================
[01:01:51] [PASSED] 1 VF
[01:01:51] [PASSED] 2 VFs
[01:01:51] [PASSED] 3 VFs
[01:01:51] [PASSED] 4 VFs
[01:01:51] [PASSED] 5 VFs
[01:01:51] [PASSED] 6 VFs
[01:01:51] [PASSED] 7 VFs
[01:01:51] [PASSED] 8 VFs
[01:01:51] [PASSED] 9 VFs
[01:01:51] [PASSED] 10 VFs
[01:01:51] [PASSED] 11 VFs
[01:01:51] [PASSED] 12 VFs
[01:01:51] [PASSED] 13 VFs
[01:01:51] [PASSED] 14 VFs
[01:01:51] [PASSED] 15 VFs
[01:01:51] [PASSED] 16 VFs
[01:01:51] [PASSED] 17 VFs
[01:01:51] [PASSED] 18 VFs
[01:01:51] [PASSED] 19 VFs
[01:01:51] [PASSED] 20 VFs
[01:01:51] [PASSED] 21 VFs
[01:01:51] [PASSED] 22 VFs
[01:01:51] [PASSED] 23 VFs
[01:01:51] [PASSED] 24 VFs
[01:01:51] [PASSED] 25 VFs
[01:01:51] [PASSED] 26 VFs
[01:01:51] [PASSED] 27 VFs
[01:01:51] [PASSED] 28 VFs
[01:01:51] [PASSED] 29 VFs
[01:01:51] [PASSED] 30 VFs
[01:01:51] [PASSED] 31 VFs
[01:01:51] [PASSED] 32 VFs
[01:01:51] [PASSED] 33 VFs
[01:01:51] [PASSED] 34 VFs
[01:01:51] [PASSED] 35 VFs
[01:01:51] [PASSED] 36 VFs
[01:01:51] [PASSED] 37 VFs
[01:01:51] [PASSED] 38 VFs
[01:01:51] [PASSED] 39 VFs
[01:01:51] [PASSED] 40 VFs
[01:01:51] [PASSED] 41 VFs
[01:01:51] [PASSED] 42 VFs
[01:01:51] [PASSED] 43 VFs
[01:01:51] [PASSED] 44 VFs
[01:01:51] [PASSED] 45 VFs
[01:01:51] [PASSED] 46 VFs
[01:01:51] [PASSED] 47 VFs
[01:01:51] [PASSED] 48 VFs
[01:01:51] [PASSED] 49 VFs
[01:01:51] [PASSED] 50 VFs
[01:01:51] [PASSED] 51 VFs
[01:01:51] [PASSED] 52 VFs
[01:01:51] [PASSED] 53 VFs
[01:01:51] [PASSED] 54 VFs
[01:01:51] [PASSED] 55 VFs
[01:01:51] [PASSED] 56 VFs
[01:01:51] [PASSED] 57 VFs
[01:01:51] [PASSED] 58 VFs
[01:01:51] [PASSED] 59 VFs
[01:01:51] [PASSED] 60 VFs
[01:01:51] [PASSED] 61 VFs
[01:01:51] [PASSED] 62 VFs
[01:01:51] [PASSED] 63 VFs
[01:01:51] ==================== [PASSED] fair_vram ====================
[01:01:51] ================== [PASSED] pf_gt_config ===================
[01:01:51] ===================== lmtt (1 subtest) =====================
[01:01:51] ======================== test_ops  =========================
[01:01:51] [PASSED] 2-level
[01:01:51] [PASSED] multi-level
[01:01:51] ==================== [PASSED] test_ops =====================
[01:01:51] ====================== [PASSED] lmtt =======================
[01:01:51] ================= sriov_packet (1 subtest) =================
[01:01:51] [PASSED] test_descriptor_init
[01:01:51] ================== [PASSED] sriov_packet ===================
[01:01:51] ================= pf_service (11 subtests) =================
[01:01:51] [PASSED] pf_negotiate_any
[01:01:51] [PASSED] pf_negotiate_base_match
[01:01:51] [PASSED] pf_negotiate_base_newer
[01:01:51] [PASSED] pf_negotiate_base_next
[01:01:51] [SKIPPED] pf_negotiate_base_older (no older minor)
[01:01:51] [PASSED] pf_negotiate_base_prev
[01:01:51] [PASSED] pf_negotiate_latest_match
[01:01:51] [PASSED] pf_negotiate_latest_newer
[01:01:51] [PASSED] pf_negotiate_latest_next
[01:01:51] [SKIPPED] pf_negotiate_latest_older (no older minor)
[01:01:51] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[01:01:51] =================== [PASSED] pf_service ====================
[01:01:51] ================= xe_guc_g2g (2 subtests) ==================
[01:01:51] ============== xe_live_guc_g2g_kunit_default  ==============
[01:01:51] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[01:01:51] ============== xe_live_guc_g2g_kunit_allmem  ===============
[01:01:51] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[01:01:51] =================== [SKIPPED] xe_guc_g2g ===================
[01:01:51] =================== xe_mocs (2 subtests) ===================
[01:01:51] ================ xe_live_mocs_kernel_kunit  ================
[01:01:51] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[01:01:51] ================ xe_live_mocs_reset_kunit  =================
[01:01:51] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[01:01:51] ==================== [SKIPPED] xe_mocs =====================
[01:01:51] ================= xe_migrate (2 subtests) ==================
[01:01:51] ================= xe_migrate_sanity_kunit  =================
[01:01:51] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[01:01:51] ================== xe_validate_ccs_kunit  ==================
[01:01:51] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[01:01:51] =================== [SKIPPED] xe_migrate ===================
[01:01:51] ================== xe_dma_buf (1 subtest) ==================
[01:01:51] ==================== xe_dma_buf_kunit  =====================
[01:01:51] ================ [SKIPPED] xe_dma_buf_kunit ================
[01:01:51] =================== [SKIPPED] xe_dma_buf ===================
[01:01:51] ================= xe_bo_shrink (1 subtest) =================
[01:01:51] =================== xe_bo_shrink_kunit  ====================
[01:01:51] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[01:01:51] ================== [SKIPPED] xe_bo_shrink ==================
[01:01:51] ==================== xe_bo (2 subtests) ====================
[01:01:51] ================== xe_ccs_migrate_kunit  ===================
[01:01:51] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[01:01:51] ==================== xe_bo_evict_kunit  ====================
[01:01:51] =============== [SKIPPED] xe_bo_evict_kunit ================
[01:01:51] ===================== [SKIPPED] xe_bo ======================
[01:01:51] =================== xe_any (9 subtests) ====================
[01:01:51] [PASSED] test_to_xe
[01:01:51] [PASSED] test_to_dev
[01:01:51] [PASSED] test_to_pdev
[01:01:51] [PASSED] test_to_drm
[01:01:51] [PASSED] test_if_pdev
[01:01:51] [PASSED] test_if_xe
[01:01:51] [PASSED] test_if_tile
[01:01:51] [PASSED] test_if_gt
[01:01:51] [PASSED] test_to_id
[01:01:51] ===================== [PASSED] xe_any ======================
[01:01:51] ==================== args (13 subtests) ====================
[01:01:51] [PASSED] count_args_test
[01:01:51] [PASSED] call_args_example
[01:01:51] [PASSED] call_args_test
[01:01:51] [PASSED] drop_first_arg_example
[01:01:51] [PASSED] drop_first_arg_test
[01:01:51] [PASSED] first_arg_example
[01:01:51] [PASSED] first_arg_test
[01:01:51] [PASSED] last_arg_example
[01:01:51] [PASSED] last_arg_test
[01:01:51] [PASSED] pick_arg_example
[01:01:51] [PASSED] if_args_example
[01:01:51] [PASSED] if_args_test
[01:01:51] [PASSED] sep_comma_example
[01:01:51] ====================== [PASSED] args =======================
[01:01:51] =================== xe_pci (3 subtests) ====================
[01:01:51] ==================== check_graphics_ip  ====================
[01:01:51] [PASSED] 12.00 Xe_LP
[01:01:51] [PASSED] 12.10 Xe_LP+
[01:01:51] [PASSED] 12.55 Xe_HPG
[01:01:51] [PASSED] 12.60 Xe_HPC
[01:01:51] [PASSED] 12.70 Xe_LPG
[01:01:51] [PASSED] 12.71 Xe_LPG
[01:01:51] [PASSED] 12.74 Xe_LPG+
[01:01:51] [PASSED] 20.01 Xe2_HPG
[01:01:51] [PASSED] 20.02 Xe2_HPG
[01:01:51] [PASSED] 20.04 Xe2_LPG
[01:01:51] [PASSED] 30.00 Xe3_LPG
[01:01:51] [PASSED] 30.01 Xe3_LPG
[01:01:51] [PASSED] 30.03 Xe3_LPG
[01:01:51] [PASSED] 30.04 Xe3_LPG
[01:01:51] [PASSED] 30.05 Xe3_LPG
[01:01:51] [PASSED] 35.10 Xe3p_LPG
[01:01:51] [PASSED] 35.11 Xe3p_XPC
[01:01:51] ================ [PASSED] check_graphics_ip ================
[01:01:51] ===================== check_media_ip  ======================
[01:01:51] [PASSED] 12.00 Xe_M
[01:01:51] [PASSED] 12.55 Xe_HPM
[01:01:51] [PASSED] 13.00 Xe_LPM+
[01:01:51] [PASSED] 13.01 Xe2_HPM
[01:01:51] [PASSED] 20.00 Xe2_LPM
[01:01:51] [PASSED] 30.00 Xe3_LPM
[01:01:51] [PASSED] 30.02 Xe3_LPM
[01:01:51] [PASSED] 35.00 Xe3p_LPM
[01:01:51] [PASSED] 35.03 Xe3p_HPM
[01:01:51] ================= [PASSED] check_media_ip ==================
[01:01:51] =================== check_platform_desc  ===================
[01:01:51] [PASSED] 0x9A60 (TIGERLAKE)
[01:01:51] [PASSED] 0x9A68 (TIGERLAKE)
[01:01:51] [PASSED] 0x9A70 (TIGERLAKE)
[01:01:51] [PASSED] 0x9A40 (TIGERLAKE)
[01:01:51] [PASSED] 0x9A49 (TIGERLAKE)
[01:01:51] [PASSED] 0x9A59 (TIGERLAKE)
[01:01:51] [PASSED] 0x9A78 (TIGERLAKE)
[01:01:51] [PASSED] 0x9AC0 (TIGERLAKE)
[01:01:51] [PASSED] 0x9AC9 (TIGERLAKE)
[01:01:51] [PASSED] 0x9AD9 (TIGERLAKE)
[01:01:51] [PASSED] 0x9AF8 (TIGERLAKE)
[01:01:51] [PASSED] 0x4C80 (ROCKETLAKE)
[01:01:51] [PASSED] 0x4C8A (ROCKETLAKE)
[01:01:51] [PASSED] 0x4C8B (ROCKETLAKE)
[01:01:51] [PASSED] 0x4C8C (ROCKETLAKE)
[01:01:51] [PASSED] 0x4C90 (ROCKETLAKE)
[01:01:51] [PASSED] 0x4C9A (ROCKETLAKE)
[01:01:51] [PASSED] 0x4680 (ALDERLAKE_S)
[01:01:51] [PASSED] 0x4682 (ALDERLAKE_S)
[01:01:51] [PASSED] 0x4688 (ALDERLAKE_S)
[01:01:51] [PASSED] 0x468A (ALDERLAKE_S)
[01:01:51] [PASSED] 0x468B (ALDERLAKE_S)
[01:01:51] [PASSED] 0x4690 (ALDERLAKE_S)
[01:01:51] [PASSED] 0x4692 (ALDERLAKE_S)
[01:01:51] [PASSED] 0x4693 (ALDERLAKE_S)
[01:01:51] [PASSED] 0x46A0 (ALDERLAKE_P)
[01:01:51] [PASSED] 0x46A1 (ALDERLAKE_P)
[01:01:51] [PASSED] 0x46A2 (ALDERLAKE_P)
[01:01:51] [PASSED] 0x46A3 (ALDERLAKE_P)
[01:01:51] [PASSED] 0x46A6 (ALDERLAKE_P)
[01:01:51] [PASSED] 0x46A8 (ALDERLAKE_P)
[01:01:51] [PASSED] 0x46AA (ALDERLAKE_P)
[01:01:51] [PASSED] 0x462A (ALDERLAKE_P)
[01:01:51] [PASSED] 0x4626 (ALDERLAKE_P)
[01:01:51] [PASSED] 0x4628 (ALDERLAKE_P)
[01:01:51] [PASSED] 0x46B0 (ALDERLAKE_P)
[01:01:51] [PASSED] 0x46B1 (ALDERLAKE_P)
[01:01:51] [PASSED] 0x46B2 (ALDERLAKE_P)
[01:01:51] [PASSED] 0x46B3 (ALDERLAKE_P)
[01:01:51] [PASSED] 0x46C0 (ALDERLAKE_P)
[01:01:51] [PASSED] 0x46C1 (ALDERLAKE_P)
[01:01:51] [PASSED] 0x46C2 (ALDERLAKE_P)
[01:01:51] [PASSED] 0x46C3 (ALDERLAKE_P)
[01:01:51] [PASSED] 0x46D0 (ALDERLAKE_N)
[01:01:51] [PASSED] 0x46D1 (ALDERLAKE_N)
[01:01:51] [PASSED] 0x46D2 (ALDERLAKE_N)
[01:01:51] [PASSED] 0x46D3 (ALDERLAKE_N)
[01:01:51] [PASSED] 0x46D4 (ALDERLAKE_N)
[01:01:51] [PASSED] 0xA721 (ALDERLAKE_P)
[01:01:51] [PASSED] 0xA7A1 (ALDERLAKE_P)
[01:01:51] [PASSED] 0xA7A9 (ALDERLAKE_P)
[01:01:51] [PASSED] 0xA7AC (ALDERLAKE_P)
[01:01:51] [PASSED] 0xA7AD (ALDERLAKE_P)
[01:01:51] [PASSED] 0xA720 (ALDERLAKE_P)
[01:01:51] [PASSED] 0xA7A0 (ALDERLAKE_P)
[01:01:51] [PASSED] 0xA7A8 (ALDERLAKE_P)
[01:01:51] [PASSED] 0xA7AA (ALDERLAKE_P)
[01:01:51] [PASSED] 0xA7AB (ALDERLAKE_P)
[01:01:51] [PASSED] 0xA780 (ALDERLAKE_S)
[01:01:51] [PASSED] 0xA781 (ALDERLAKE_S)
[01:01:51] [PASSED] 0xA782 (ALDERLAKE_S)
[01:01:51] [PASSED] 0xA783 (ALDERLAKE_S)
[01:01:51] [PASSED] 0xA788 (ALDERLAKE_S)
[01:01:51] [PASSED] 0xA789 (ALDERLAKE_S)
[01:01:51] [PASSED] 0xA78A (ALDERLAKE_S)
[01:01:51] [PASSED] 0xA78B (ALDERLAKE_S)
[01:01:51] [PASSED] 0x4905 (DG1)
[01:01:51] [PASSED] 0x4906 (DG1)
[01:01:51] [PASSED] 0x4907 (DG1)
[01:01:51] [PASSED] 0x4908 (DG1)
[01:01:51] [PASSED] 0x4909 (DG1)
[01:01:51] [PASSED] 0x56C0 (DG2)
[01:01:51] [PASSED] 0x56C2 (DG2)
[01:01:51] [PASSED] 0x56C1 (DG2)
[01:01:51] [PASSED] 0x7D51 (METEORLAKE)
[01:01:51] [PASSED] 0x7DD1 (METEORLAKE)
[01:01:51] [PASSED] 0x7D41 (METEORLAKE)
[01:01:51] [PASSED] 0x7D67 (METEORLAKE)
[01:01:51] [PASSED] 0xB640 (METEORLAKE)
[01:01:51] [PASSED] 0x56A0 (DG2)
[01:01:51] [PASSED] 0x56A1 (DG2)
[01:01:51] [PASSED] 0x56A2 (DG2)
[01:01:51] [PASSED] 0x56BE (DG2)
[01:01:51] [PASSED] 0x56BF (DG2)
[01:01:51] [PASSED] 0x5690 (DG2)
[01:01:51] [PASSED] 0x5691 (DG2)
[01:01:51] [PASSED] 0x5692 (DG2)
[01:01:51] [PASSED] 0x56A5 (DG2)
[01:01:51] [PASSED] 0x56A6 (DG2)
[01:01:51] [PASSED] 0x56B0 (DG2)
[01:01:51] [PASSED] 0x56B1 (DG2)
[01:01:51] [PASSED] 0x56BA (DG2)
[01:01:51] [PASSED] 0x56BB (DG2)
[01:01:51] [PASSED] 0x56BC (DG2)
[01:01:51] [PASSED] 0x56BD (DG2)
[01:01:51] [PASSED] 0x5693 (DG2)
[01:01:51] [PASSED] 0x5694 (DG2)
[01:01:51] [PASSED] 0x5695 (DG2)
[01:01:51] [PASSED] 0x56A3 (DG2)
[01:01:51] [PASSED] 0x56A4 (DG2)
[01:01:51] [PASSED] 0x56B2 (DG2)
[01:01:51] [PASSED] 0x56B3 (DG2)
[01:01:51] [PASSED] 0x5696 (DG2)
[01:01:51] [PASSED] 0x5697 (DG2)
[01:01:51] [PASSED] 0xB69 (PVC)
[01:01:51] [PASSED] 0xB6E (PVC)
[01:01:51] [PASSED] 0xBD4 (PVC)
[01:01:51] [PASSED] 0xBD5 (PVC)
[01:01:51] [PASSED] 0xBD6 (PVC)
[01:01:51] [PASSED] 0xBD7 (PVC)
[01:01:51] [PASSED] 0xBD8 (PVC)
[01:01:51] [PASSED] 0xBD9 (PVC)
[01:01:51] [PASSED] 0xBDA (PVC)
[01:01:51] [PASSED] 0xBDB (PVC)
[01:01:51] [PASSED] 0xBE0 (PVC)
[01:01:51] [PASSED] 0xBE1 (PVC)
[01:01:51] [PASSED] 0xBE5 (PVC)
[01:01:51] [PASSED] 0x7D40 (METEORLAKE)
[01:01:51] [PASSED] 0x7D45 (METEORLAKE)
[01:01:51] [PASSED] 0x7D55 (METEORLAKE)
[01:01:51] [PASSED] 0x7D60 (METEORLAKE)
[01:01:51] [PASSED] 0x7DD5 (METEORLAKE)
[01:01:51] [PASSED] 0x6420 (LUNARLAKE)
[01:01:51] [PASSED] 0x64A0 (LUNARLAKE)
[01:01:51] [PASSED] 0x64B0 (LUNARLAKE)
[01:01:51] [PASSED] 0xE202 (BATTLEMAGE)
[01:01:51] [PASSED] 0xE209 (BATTLEMAGE)
[01:01:51] [PASSED] 0xE20B (BATTLEMAGE)
[01:01:51] [PASSED] 0xE20C (BATTLEMAGE)
[01:01:51] [PASSED] 0xE20D (BATTLEMAGE)
[01:01:51] [PASSED] 0xE210 (BATTLEMAGE)
[01:01:51] [PASSED] 0xE211 (BATTLEMAGE)
[01:01:51] [PASSED] 0xE212 (BATTLEMAGE)
[01:01:51] [PASSED] 0xE216 (BATTLEMAGE)
[01:01:51] [PASSED] 0xE220 (BATTLEMAGE)
[01:01:51] [PASSED] 0xE221 (BATTLEMAGE)
[01:01:51] [PASSED] 0xE222 (BATTLEMAGE)
[01:01:51] [PASSED] 0xE223 (BATTLEMAGE)
[01:01:51] [PASSED] 0xB080 (PANTHERLAKE)
[01:01:51] [PASSED] 0xB081 (PANTHERLAKE)
[01:01:51] [PASSED] 0xB082 (PANTHERLAKE)
[01:01:51] [PASSED] 0xB083 (PANTHERLAKE)
[01:01:51] [PASSED] 0xB084 (PANTHERLAKE)
[01:01:51] [PASSED] 0xB085 (PANTHERLAKE)
[01:01:51] [PASSED] 0xB086 (PANTHERLAKE)
[01:01:51] [PASSED] 0xB087 (PANTHERLAKE)
[01:01:51] [PASSED] 0xB08F (PANTHERLAKE)
[01:01:51] [PASSED] 0xB090 (PANTHERLAKE)
[01:01:51] [PASSED] 0xB0A0 (PANTHERLAKE)
[01:01:51] [PASSED] 0xB0A1 (PANTHERLAKE)
[01:01:51] [PASSED] 0xB0B0 (PANTHERLAKE)
[01:01:51] [PASSED] 0xFD80 (PANTHERLAKE)
[01:01:51] [PASSED] 0xFD81 (PANTHERLAKE)
[01:01:51] [PASSED] 0xD740 (NOVALAKE_S)
[01:01:51] [PASSED] 0xD741 (NOVALAKE_S)
[01:01:51] [PASSED] 0xD742 (NOVALAKE_S)
[01:01:51] [PASSED] 0xD743 (NOVALAKE_S)
[01:01:51] [PASSED] 0xD745 (NOVALAKE_S)
[01:01:51] [PASSED] 0xD74A (NOVALAKE_S)
[01:01:51] [PASSED] 0xD74B (NOVALAKE_S)
[01:01:51] [PASSED] 0x674C (CRESCENTISLAND)
[01:01:51] [PASSED] 0x674D (CRESCENTISLAND)
[01:01:51] [PASSED] 0x674E (CRESCENTISLAND)
[01:01:51] [PASSED] 0x674F (CRESCENTISLAND)
[01:01:51] [PASSED] 0x6750 (CRESCENTISLAND)
[01:01:51] [PASSED] 0x6751 (CRESCENTISLAND)
[01:01:51] [PASSED] 0xD750 (NOVALAKE_P)
[01:01:51] [PASSED] 0xD751 (NOVALAKE_P)
[01:01:51] [PASSED] 0xD752 (NOVALAKE_P)
[01:01:51] [PASSED] 0xD753 (NOVALAKE_P)
[01:01:51] [PASSED] 0xD754 (NOVALAKE_P)
[01:01:51] [PASSED] 0xD755 (NOVALAKE_P)
[01:01:51] [PASSED] 0xD756 (NOVALAKE_P)
[01:01:51] [PASSED] 0xD757 (NOVALAKE_P)
[01:01:51] [PASSED] 0xD75F (NOVALAKE_P)
[01:01:51] =============== [PASSED] check_platform_desc ===============
[01:01:51] ===================== [PASSED] xe_pci ======================
[01:01:51] ============= xe_rtp_tables_test (5 subtests) ==============
[01:01:51] ================== xe_rtp_table_gt_test  ===================
[01:01:51] [PASSED] gt_was/14011060649
[01:01:51] [PASSED] gt_was/14011059788
[01:01:51] [PASSED] gt_was/14015795083
[01:01:51] [PASSED] gt_was/16021867713
[01:01:51] [PASSED] gt_was/14019449301
[01:01:51] [PASSED] gt_was/16028005424
[01:01:51] [PASSED] gt_was/14026578760
[01:01:51] [PASSED] gt_was/1409420604
[01:01:51] [PASSED] gt_was/1408615072
[01:01:51] [PASSED] gt_was/22010523718
[01:01:51] [PASSED] gt_was/14011006942
[01:01:51] [PASSED] gt_was/14014830051
[01:01:51] [PASSED] gt_was/18018781329
[01:01:51] [PASSED] gt_was/1509235366
[01:01:51] [PASSED] gt_was/18018781329
[01:01:51] [PASSED] gt_was/16016694945
[01:01:51] [PASSED] gt_was/14018575942
[01:01:51] [PASSED] gt_was/22016670082
[01:01:51] [PASSED] gt_was/22016670082
[01:01:51] [PASSED] gt_was/14017421178
[01:01:51] [PASSED] gt_was/16025250150
[01:01:51] [PASSED] gt_was/14021871409
[01:01:51] [PASSED] gt_was/16021865536
[01:01:51] [PASSED] gt_was/14021486841
[01:01:51] [PASSED] gt_was/14025160223
[01:01:51] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[01:01:51] [PASSED] gt_was/14025635424
[01:01:51] [PASSED] gt_was/16028005424
[01:01:51] ============== [PASSED] xe_rtp_table_gt_test ===============
[01:01:51] ================== xe_rtp_table_gt_test  ===================
[01:01:51] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[01:01:51] [PASSED] gt_tunings/Tuning: 32B Access Enable
[01:01:51] [PASSED] gt_tunings/Tuning: L3 cache
[01:01:51] [PASSED] gt_tunings/Tuning: L3 cache - media
[01:01:51] [PASSED] gt_tunings/Tuning: Compression Overfetch
[01:01:51] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[01:01:51] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[01:01:51] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[01:01:51] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[01:01:51] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[01:01:51] [PASSED] gt_tunings/Tuning: Stateless compression control
[01:01:51] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[01:01:51] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[01:01:51] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[01:01:51] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[01:01:51] [PASSED] gt_tunings/Tuning: Force All Non-Compressible Memory Reads to be 256B Overfetches
[01:01:51] ============== [PASSED] xe_rtp_table_gt_test ===============
[01:01:51] ================== xe_rtp_table_oob_test  ==================
[01:01:51] [PASSED] oob_was/1607983814
[01:01:51] [PASSED] oob_was/16010904313
[01:01:51] [PASSED] oob_was/18022495364
[01:01:51] [PASSED] oob_was/22012773006
[01:01:51] [PASSED] oob_was/14014475959
[01:01:51] [PASSED] oob_was/22011391025
[01:01:51] [PASSED] oob_was/22012727170
[01:01:51] [PASSED] oob_was/22012727685
[01:01:51] [PASSED] oob_was/22016596838
[01:01:51] [PASSED] oob_was/18020744125
[01:01:51] [PASSED] oob_was/1409600907
[01:01:51] [PASSED] oob_was/22014953428
[01:01:51] [PASSED] oob_was/16017236439
[01:01:51] [PASSED] oob_was/14019821291
[01:01:51] [PASSED] oob_was/14015076503
[01:01:51] [PASSED] oob_was/22016122933
[01:01:51] [PASSED] oob_was/14018913170
[01:01:51] [PASSED] oob_was/14018094691
[01:01:51] [PASSED] oob_was/18024947630
[01:01:51] [PASSED] oob_was/16022287689
[01:01:51] [PASSED] oob_was/13011645652
[01:01:51] [PASSED] oob_was/14022293748
[01:01:51] [PASSED] oob_was/22019794406
[01:01:51] [PASSED] oob_was/22019338487
[01:01:51] [PASSED] oob_was/16023588340
[01:01:51] [PASSED] oob_was/14019789679
[01:01:51] [PASSED] oob_was/14022866841
[01:01:51] [PASSED] oob_was/16021333562
[01:01:51] [PASSED] oob_was/14016712196
[01:01:51] [PASSED] oob_was/14015568240
[01:01:51] [PASSED] oob_was/18013179988
[01:01:51] [PASSED] oob_was/1508761755
[01:01:51] [PASSED] oob_was/16023105232
[01:01:51] [PASSED] oob_was/16026508708
[01:01:51] [PASSED] oob_was/14020001231
[01:01:51] [PASSED] oob_was/16023683509
[01:01:51] [PASSED] oob_was/14025515070
[01:01:51] [PASSED] oob_was/15015404425_disable
[01:01:51] [PASSED] oob_was/16026007364
[01:01:51] [PASSED] oob_was/14020316580
[01:01:51] [PASSED] oob_was/14025883347
[01:01:51] [PASSED] oob_was/16029380221
[01:01:51] [PASSED] oob_was/22022079272
[01:01:51] [PASSED] oob_was/16029897822
[01:01:51] [PASSED] oob_was/14027054324
[01:01:51] [PASSED] oob_was/14025941587
[01:01:51] [PASSED] oob_was/16030224309
[01:01:51] ============== [PASSED] xe_rtp_table_oob_test ==============
[01:01:51] ================ xe_rtp_table_dev_oob_test  ================
[01:01:51] [PASSED] device_oob_was/22010954014
[01:01:51] [PASSED] device_oob_was/15015404425
[01:01:51] [PASSED] device_oob_was/22019338487_display
[01:01:51] [PASSED] device_oob_was/14022085890
[01:01:51] [PASSED] device_oob_was/14026539277
[01:01:51] [PASSED] device_oob_was/14026633728
[01:01:51] [PASSED] device_oob_was/14026746987
[01:01:51] [PASSED] device_oob_was/14026779378
[01:01:51] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[01:01:51] ========== xe_rtp_table_missing_upper_bound_test  ==========
[01:01:51] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[01:01:51] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[01:01:51] [PASSED] register_whitelist/1806527549
[01:01:51] [PASSED] register_whitelist/allow_read_ctx_timestamp
[01:01:51] [PASSED] register_whitelist/allow_read_queue_timestamp
[01:01:51] [PASSED] register_whitelist/16014440446
[01:01:51] [PASSED] register_whitelist/16017236439
[01:01:51] [PASSED] register_whitelist/16020183090
[01:01:51] [PASSED] register_whitelist/14024997852
[01:01:51] [PASSED] register_whitelist/14024997852
[01:01:51] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[01:01:51] =============== [PASSED] xe_rtp_tables_test ================
[01:01:51] =================== xe_rtp (3 subtests) ====================
[01:01:51] =================== xe_rtp_rules_tests  ====================
[01:01:51] [PASSED] no
[01:01:51] [PASSED] yes
[01:01:51] [PASSED] no-and-no
[01:01:51] [PASSED] no-and-yes
[01:01:51] [PASSED] yes-and-no
[01:01:51] [PASSED] yes-and-yes
[01:01:51] [PASSED] no-or-no
[01:01:51] [PASSED] no-or-yes
[01:01:51] [PASSED] yes-or-no
[01:01:51] [PASSED] yes-or-yes
[01:01:51] [PASSED] no-yes-or-yes-no
[01:01:51] [PASSED] no-yes-or-yes-yes
[01:01:51] [PASSED] yes-yes-or-no-yes
[01:01:51] [PASSED] yes-yes-or-yes-yes
[01:01:51] [PASSED] no-no-or-yes-or-no
[01:01:51] [PASSED] or
[01:01:51] [PASSED] or-yes
[01:01:51] [PASSED] or-no
[01:01:51] [PASSED] yes-or
[01:01:51] [PASSED] no-or
[01:01:51] [PASSED] no-or-or-yes
[01:01:51] [PASSED] yes-or-or-no
[01:01:51] [PASSED] no-or-or-no
[01:01:51] [PASSED] missing-context-engine-class
[01:01:51] [PASSED] missing-context-engine-class-or-yes
[01:01:51] [PASSED] missing-context-engine-class-or-or-yes
[01:01:51] =============== [PASSED] xe_rtp_rules_tests ================
[01:01:51] =============== xe_rtp_process_to_sr_tests  ================
[01:01:51] [PASSED] coalesce-same-reg
[01:01:51] [PASSED] coalesce-same-reg-literal-and-func
[01:01:51] [PASSED] no-match-no-add
[01:01:51] [PASSED] two-regs-two-entries
[01:01:51] [PASSED] clr-one-set-other
[01:01:51] [PASSED] set-field
[01:01:51] [PASSED] conflict-duplicate
[01:01:51] [PASSED] conflict-not-disjoint
[01:01:51] [PASSED] conflict-not-disjoint-literal-and-func
[01:01:51] [PASSED] conflict-reg-type
[01:01:51] [PASSED] bad-mcr-reg-forced-to-regular
[01:01:51] [PASSED] bad-regular-reg-forced-to-mcr
[01:01:51] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[01:01:51] ================== xe_rtp_process_tests  ===================
[01:01:51] [PASSED] active1
[01:01:51] [PASSED] active2
[01:01:51] [PASSED] active-inactive
[01:01:51] [PASSED] inactive-active
[01:01:51] [PASSED] inactive-active-inactive
[01:01:51] [PASSED] inactive-inactive-inactive
[01:01:51] ============== [PASSED] xe_rtp_process_tests ===============
[01:01:51] ===================== [PASSED] xe_rtp ======================
[01:01:51] ==================== xe_wa (1 subtest) =====================
[01:01:51] ======================== xe_wa_gt  =========================
[01:01:51] [PASSED] TIGERLAKE B0
[01:01:51] [PASSED] DG1 A0
[01:01:51] [PASSED] DG1 B0
[01:01:51] [PASSED] ALDERLAKE_S A0
[01:01:51] [PASSED] ALDERLAKE_S B0
[01:01:51] [PASSED] ALDERLAKE_S C0
[01:01:51] [PASSED] ALDERLAKE_S D0
[01:01:51] [PASSED] ALDERLAKE_P A0
[01:01:51] [PASSED] ALDERLAKE_P B0
[01:01:51] [PASSED] ALDERLAKE_P C0
[01:01:51] [PASSED] ALDERLAKE_S RPLS D0
[01:01:51] [PASSED] ALDERLAKE_P RPLU E0
[01:01:51] [PASSED] DG2 G10 C0
[01:01:51] [PASSED] DG2 G11 B1
[01:01:51] [PASSED] DG2 G12 A1
[01:01:51] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[01:01:51] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[01:01:51] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[01:01:51] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[01:01:51] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[01:01:51] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[01:01:51] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[01:01:51] ==================== [PASSED] xe_wa_gt =====================
[01:01:51] ====================== [PASSED] xe_wa ======================
[01:01:51] ============================================================
[01:01:51] Testing complete. Ran 837 tests: passed: 809, skipped: 28
[01:01:51] Elapsed time: 41.074s total, 1.889s configuring, 38.420s building, 0.717s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[01:01:51] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:01:53] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[01:02:18] Starting KUnit Kernel (1/1)...
[01:02:18] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:02:18] ============ drm_test_pick_cmdline (2 subtests) ============
[01:02:18] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[01:02:18] =============== drm_test_pick_cmdline_named  ===============
[01:02:18] [PASSED] NTSC
[01:02:18] [PASSED] NTSC-J
[01:02:18] [PASSED] PAL
[01:02:18] [PASSED] PAL-M
[01:02:18] =========== [PASSED] drm_test_pick_cmdline_named ===========
[01:02:18] ============== [PASSED] drm_test_pick_cmdline ==============
[01:02:18] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[01:02:18] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[01:02:18] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[01:02:18] =========== drm_validate_clone_mode (2 subtests) ===========
[01:02:18] ============== drm_test_check_in_clone_mode  ===============
[01:02:18] [PASSED] in_clone_mode
[01:02:18] [PASSED] not_in_clone_mode
[01:02:18] ========== [PASSED] drm_test_check_in_clone_mode ===========
[01:02:18] =============== drm_test_check_valid_clones  ===============
[01:02:18] [PASSED] not_in_clone_mode
[01:02:18] [PASSED] valid_clone
[01:02:18] [PASSED] invalid_clone
[01:02:18] =========== [PASSED] drm_test_check_valid_clones ===========
[01:02:18] ============= [PASSED] drm_validate_clone_mode =============
[01:02:18] ============= drm_validate_modeset (1 subtest) =============
[01:02:18] [PASSED] drm_test_check_connector_changed_modeset
[01:02:18] ============== [PASSED] drm_validate_modeset ===============
[01:02:18] ====== drm_test_bridge_get_current_state (1 subtest) =======
[01:02:18] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[01:02:18] ======== [PASSED] drm_test_bridge_get_current_state ========
[01:02:18] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[01:02:18] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[01:02:18] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[01:02:18] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[01:02:18] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[01:02:18] ============== drm_bridge_alloc (2 subtests) ===============
[01:02:18] [PASSED] drm_test_drm_bridge_alloc_basic
[01:02:18] [PASSED] drm_test_drm_bridge_alloc_get_put
[01:02:18] ================ [PASSED] drm_bridge_alloc =================
[01:02:18] ============= drm_bridge_bus_fmt (5 subtests) ==============
[01:02:18] [PASSED] drm_test_bridge_rgb_yuv_rgb
[01:02:18] [PASSED] drm_test_bridge_must_convert_to_yuv444
[01:02:18] [PASSED] drm_test_bridge_hdmi_auto_rgb
[01:02:18] [PASSED] drm_test_bridge_auto_first
[01:02:18] [PASSED] drm_test_bridge_rgb_yuv_no_path
[01:02:18] =============== [PASSED] drm_bridge_bus_fmt ================
[01:02:18] ============= drm_cmdline_parser (40 subtests) =============
[01:02:18] [PASSED] drm_test_cmdline_force_d_only
[01:02:18] [PASSED] drm_test_cmdline_force_D_only_dvi
[01:02:18] [PASSED] drm_test_cmdline_force_D_only_hdmi
[01:02:18] [PASSED] drm_test_cmdline_force_D_only_not_digital
[01:02:18] [PASSED] drm_test_cmdline_force_e_only
[01:02:18] [PASSED] drm_test_cmdline_res
[01:02:18] [PASSED] drm_test_cmdline_res_vesa
[01:02:18] [PASSED] drm_test_cmdline_res_vesa_rblank
[01:02:18] [PASSED] drm_test_cmdline_res_rblank
[01:02:18] [PASSED] drm_test_cmdline_res_bpp
[01:02:18] [PASSED] drm_test_cmdline_res_refresh
[01:02:18] [PASSED] drm_test_cmdline_res_bpp_refresh
[01:02:18] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[01:02:18] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[01:02:18] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[01:02:18] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[01:02:18] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[01:02:18] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[01:02:18] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[01:02:18] [PASSED] drm_test_cmdline_res_margins_force_on
[01:02:18] [PASSED] drm_test_cmdline_res_vesa_margins
[01:02:18] [PASSED] drm_test_cmdline_name
[01:02:18] [PASSED] drm_test_cmdline_name_bpp
[01:02:18] [PASSED] drm_test_cmdline_name_option
[01:02:18] [PASSED] drm_test_cmdline_name_bpp_option
[01:02:18] [PASSED] drm_test_cmdline_rotate_0
[01:02:18] [PASSED] drm_test_cmdline_rotate_90
[01:02:18] [PASSED] drm_test_cmdline_rotate_180
[01:02:18] [PASSED] drm_test_cmdline_rotate_270
[01:02:18] [PASSED] drm_test_cmdline_hmirror
[01:02:18] [PASSED] drm_test_cmdline_vmirror
[01:02:18] [PASSED] drm_test_cmdline_margin_options
[01:02:18] [PASSED] drm_test_cmdline_multiple_options
[01:02:18] [PASSED] drm_test_cmdline_bpp_extra_and_option
[01:02:18] [PASSED] drm_test_cmdline_extra_and_option
[01:02:18] [PASSED] drm_test_cmdline_freestanding_options
[01:02:18] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[01:02:18] [PASSED] drm_test_cmdline_panel_orientation
[01:02:18] ================ drm_test_cmdline_invalid  =================
[01:02:18] [PASSED] margin_only
[01:02:18] [PASSED] interlace_only
[01:02:18] [PASSED] res_missing_x
[01:02:18] [PASSED] res_missing_y
[01:02:18] [PASSED] res_bad_y
[01:02:18] [PASSED] res_missing_y_bpp
[01:02:18] [PASSED] res_bad_bpp
[01:02:18] [PASSED] res_bad_refresh
[01:02:18] [PASSED] res_bpp_refresh_force_on_off
[01:02:18] [PASSED] res_invalid_mode
[01:02:18] [PASSED] res_bpp_wrong_place_mode
[01:02:18] [PASSED] name_bpp_refresh
[01:02:18] [PASSED] name_refresh
[01:02:18] [PASSED] name_refresh_wrong_mode
[01:02:18] [PASSED] name_refresh_invalid_mode
[01:02:18] [PASSED] rotate_multiple
[01:02:18] [PASSED] rotate_invalid_val
[01:02:18] [PASSED] rotate_truncated
[01:02:18] [PASSED] invalid_option
[01:02:18] [PASSED] invalid_tv_option
[01:02:18] [PASSED] truncated_tv_option
[01:02:18] ============ [PASSED] drm_test_cmdline_invalid =============
[01:02:18] =============== drm_test_cmdline_tv_options  ===============
[01:02:18] [PASSED] NTSC
[01:02:18] [PASSED] NTSC_443
[01:02:18] [PASSED] NTSC_J
[01:02:18] [PASSED] PAL
[01:02:18] [PASSED] PAL_M
[01:02:18] [PASSED] PAL_N
[01:02:18] [PASSED] SECAM
[01:02:18] [PASSED] MONO_525
[01:02:18] [PASSED] MONO_625
[01:02:18] =========== [PASSED] drm_test_cmdline_tv_options ===========
[01:02:18] =============== [PASSED] drm_cmdline_parser ================
[01:02:18] ========== drmm_connector_hdmi_init (20 subtests) ==========
[01:02:18] [PASSED] drm_test_connector_hdmi_init_valid
[01:02:18] [PASSED] drm_test_connector_hdmi_init_bpc_8
[01:02:18] [PASSED] drm_test_connector_hdmi_init_bpc_10
[01:02:18] [PASSED] drm_test_connector_hdmi_init_bpc_12
[01:02:18] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[01:02:18] [PASSED] drm_test_connector_hdmi_init_bpc_null
[01:02:18] [PASSED] drm_test_connector_hdmi_init_formats_empty
[01:02:18] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[01:02:18] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[01:02:18] [PASSED] supported_formats=0x9 yuv420_allowed=1
[01:02:18] [PASSED] supported_formats=0x9 yuv420_allowed=0
[01:02:18] [PASSED] supported_formats=0x5 yuv420_allowed=1
[01:02:18] [PASSED] supported_formats=0x5 yuv420_allowed=0
[01:02:18] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[01:02:18] [PASSED] drm_test_connector_hdmi_init_null_ddc
[01:02:18] [PASSED] drm_test_connector_hdmi_init_null_product
[01:02:18] [PASSED] drm_test_connector_hdmi_init_null_vendor
[01:02:18] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[01:02:18] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[01:02:18] [PASSED] drm_test_connector_hdmi_init_product_valid
[01:02:18] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[01:02:18] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[01:02:18] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[01:02:18] ========= drm_test_connector_hdmi_init_type_valid  =========
[01:02:18] [PASSED] HDMI-A
[01:02:18] [PASSED] HDMI-B
[01:02:18] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[01:02:18] ======== drm_test_connector_hdmi_init_type_invalid  ========
[01:02:18] [PASSED] Unknown
[01:02:18] [PASSED] VGA
[01:02:18] [PASSED] DVI-I
[01:02:18] [PASSED] DVI-D
[01:02:18] [PASSED] DVI-A
[01:02:18] [PASSED] Composite
[01:02:18] [PASSED] SVIDEO
[01:02:18] [PASSED] LVDS
[01:02:18] [PASSED] Component
[01:02:18] [PASSED] DIN
[01:02:18] [PASSED] DP
[01:02:18] [PASSED] TV
[01:02:18] [PASSED] eDP
[01:02:18] [PASSED] Virtual
[01:02:18] [PASSED] DSI
[01:02:18] [PASSED] DPI
[01:02:18] [PASSED] Writeback
[01:02:18] [PASSED] SPI
[01:02:18] [PASSED] USB
[01:02:18] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[01:02:18] ============ [PASSED] drmm_connector_hdmi_init =============
[01:02:18] ============= drmm_connector_init (3 subtests) =============
[01:02:18] [PASSED] drm_test_drmm_connector_init
[01:02:18] [PASSED] drm_test_drmm_connector_init_null_ddc
[01:02:18] ========= drm_test_drmm_connector_init_type_valid  =========
[01:02:18] [PASSED] Unknown
[01:02:18] [PASSED] VGA
[01:02:18] [PASSED] DVI-I
[01:02:18] [PASSED] DVI-D
[01:02:18] [PASSED] DVI-A
[01:02:18] [PASSED] Composite
[01:02:18] [PASSED] SVIDEO
[01:02:18] [PASSED] LVDS
[01:02:18] [PASSED] Component
[01:02:18] [PASSED] DIN
[01:02:18] [PASSED] DP
[01:02:18] [PASSED] HDMI-A
[01:02:18] [PASSED] HDMI-B
[01:02:18] [PASSED] TV
[01:02:18] [PASSED] eDP
[01:02:18] [PASSED] Virtual
[01:02:18] [PASSED] DSI
[01:02:18] [PASSED] DPI
[01:02:18] [PASSED] Writeback
[01:02:18] [PASSED] SPI
[01:02:18] [PASSED] USB
[01:02:18] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[01:02:18] =============== [PASSED] drmm_connector_init ===============
[01:02:18] ========= drm_connector_dynamic_init (6 subtests) ==========
[01:02:18] [PASSED] drm_test_drm_connector_dynamic_init
[01:02:18] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[01:02:18] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[01:02:18] [PASSED] drm_test_drm_connector_dynamic_init_properties
[01:02:18] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[01:02:18] [PASSED] Unknown
[01:02:18] [PASSED] VGA
[01:02:18] [PASSED] DVI-I
[01:02:18] [PASSED] DVI-D
[01:02:18] [PASSED] DVI-A
[01:02:18] [PASSED] Composite
[01:02:18] [PASSED] SVIDEO
[01:02:18] [PASSED] LVDS
[01:02:18] [PASSED] Component
[01:02:18] [PASSED] DIN
[01:02:18] [PASSED] DP
[01:02:18] [PASSED] HDMI-A
[01:02:18] [PASSED] HDMI-B
[01:02:18] [PASSED] TV
[01:02:18] [PASSED] eDP
[01:02:18] [PASSED] Virtual
[01:02:18] [PASSED] DSI
[01:02:18] [PASSED] DPI
[01:02:18] [PASSED] Writeback
[01:02:18] [PASSED] SPI
[01:02:18] [PASSED] USB
[01:02:18] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[01:02:18] ======== drm_test_drm_connector_dynamic_init_name  =========
[01:02:18] [PASSED] Unknown
[01:02:18] [PASSED] VGA
[01:02:18] [PASSED] DVI-I
[01:02:18] [PASSED] DVI-D
[01:02:18] [PASSED] DVI-A
[01:02:18] [PASSED] Composite
[01:02:18] [PASSED] SVIDEO
[01:02:18] [PASSED] LVDS
[01:02:18] [PASSED] Component
[01:02:18] [PASSED] DIN
[01:02:18] [PASSED] DP
[01:02:18] [PASSED] HDMI-A
[01:02:18] [PASSED] HDMI-B
[01:02:18] [PASSED] TV
[01:02:18] [PASSED] eDP
[01:02:18] [PASSED] Virtual
[01:02:18] [PASSED] DSI
[01:02:18] [PASSED] DPI
[01:02:18] [PASSED] Writeback
[01:02:18] [PASSED] SPI
[01:02:18] [PASSED] USB
[01:02:18] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[01:02:18] =========== [PASSED] drm_connector_dynamic_init ============
[01:02:18] ==== drm_connector_dynamic_register_early (4 subtests) =====
[01:02:18] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[01:02:18] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[01:02:18] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[01:02:18] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[01:02:18] ====== [PASSED] drm_connector_dynamic_register_early =======
[01:02:18] ======= drm_connector_dynamic_register (7 subtests) ========
[01:02:18] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[01:02:18] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[01:02:18] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[01:02:18] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[01:02:18] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[01:02:18] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[01:02:18] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[01:02:18] ========= [PASSED] drm_connector_dynamic_register ==========
[01:02:18] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[01:02:18] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[01:02:18] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[01:02:18] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[01:02:18] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[01:02:18] ========== drm_test_get_tv_mode_from_name_valid  ===========
[01:02:18] [PASSED] NTSC
[01:02:18] [PASSED] NTSC-443
[01:02:18] [PASSED] NTSC-J
[01:02:18] [PASSED] PAL
[01:02:18] [PASSED] PAL-M
[01:02:18] [PASSED] PAL-N
[01:02:18] [PASSED] SECAM
[01:02:18] [PASSED] Mono
[01:02:18] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[01:02:18] [PASSED] drm_test_get_tv_mode_from_name_truncated
[01:02:18] ============ [PASSED] drm_get_tv_mode_from_name ============
[01:02:18] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[01:02:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[01:02:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[01:02:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[01:02:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[01:02:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[01:02:18] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[01:02:18] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[01:02:18] [PASSED] VIC 96
[01:02:18] [PASSED] VIC 97
[01:02:18] [PASSED] VIC 101
[01:02:18] [PASSED] VIC 102
[01:02:18] [PASSED] VIC 106
[01:02:18] [PASSED] VIC 107
[01:02:18] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[01:02:18] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[01:02:18] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[01:02:18] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[01:02:18] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[01:02:18] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[01:02:18] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[01:02:18] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[01:02:18] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[01:02:18] [PASSED] Automatic
[01:02:18] [PASSED] Full
[01:02:18] [PASSED] Limited 16:235
[01:02:18] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[01:02:18] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[01:02:18] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[01:02:18] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[01:02:18] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[01:02:18] [PASSED] RGB
[01:02:18] [PASSED] YUV 4:2:0
[01:02:18] [PASSED] YUV 4:2:2
[01:02:18] [PASSED] YUV 4:4:4
[01:02:18] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[01:02:18] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[01:02:18] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[01:02:18] ============= drm_damage_helper (21 subtests) ==============
[01:02:18] [PASSED] drm_test_damage_iter_no_damage
[01:02:18] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[01:02:18] [PASSED] drm_test_damage_iter_no_damage_src_moved
[01:02:18] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[01:02:18] [PASSED] drm_test_damage_iter_no_damage_not_visible
[01:02:18] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[01:02:18] [PASSED] drm_test_damage_iter_no_damage_no_fb
[01:02:18] [PASSED] drm_test_damage_iter_simple_damage
[01:02:18] [PASSED] drm_test_damage_iter_single_damage
[01:02:18] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[01:02:18] [PASSED] drm_test_damage_iter_single_damage_outside_src
[01:02:18] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[01:02:18] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[01:02:18] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[01:02:18] [PASSED] drm_test_damage_iter_single_damage_src_moved
[01:02:18] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[01:02:18] [PASSED] drm_test_damage_iter_damage
[01:02:18] [PASSED] drm_test_damage_iter_damage_one_intersect
[01:02:18] [PASSED] drm_test_damage_iter_damage_one_outside
[01:02:18] [PASSED] drm_test_damage_iter_damage_src_moved
[01:02:18] [PASSED] drm_test_damage_iter_damage_not_visible
[01:02:18] ================ [PASSED] drm_damage_helper ================
[01:02:18] ============== drm_dp_mst_helper (3 subtests) ==============
[01:02:18] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[01:02:18] [PASSED] Clock 154000 BPP 30 DSC disabled
[01:02:18] [PASSED] Clock 234000 BPP 30 DSC disabled
[01:02:18] [PASSED] Clock 297000 BPP 24 DSC disabled
[01:02:18] [PASSED] Clock 332880 BPP 24 DSC enabled
[01:02:18] [PASSED] Clock 324540 BPP 24 DSC enabled
[01:02:18] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[01:02:18] ============== drm_test_dp_mst_calc_pbn_div  ===============
[01:02:18] [PASSED] Link rate 2000000 lane count 4
[01:02:18] [PASSED] Link rate 2000000 lane count 2
[01:02:18] [PASSED] Link rate 2000000 lane count 1
[01:02:18] [PASSED] Link rate 1350000 lane count 4
[01:02:18] [PASSED] Link rate 1350000 lane count 2
[01:02:18] [PASSED] Link rate 1350000 lane count 1
[01:02:18] [PASSED] Link rate 1000000 lane count 4
[01:02:18] [PASSED] Link rate 1000000 lane count 2
[01:02:18] [PASSED] Link rate 1000000 lane count 1
[01:02:18] [PASSED] Link rate 810000 lane count 4
[01:02:18] [PASSED] Link rate 810000 lane count 2
[01:02:18] [PASSED] Link rate 810000 lane count 1
[01:02:18] [PASSED] Link rate 540000 lane count 4
[01:02:18] [PASSED] Link rate 540000 lane count 2
[01:02:18] [PASSED] Link rate 540000 lane count 1
[01:02:18] [PASSED] Link rate 270000 lane count 4
[01:02:18] [PASSED] Link rate 270000 lane count 2
[01:02:18] [PASSED] Link rate 270000 lane count 1
[01:02:18] [PASSED] Link rate 162000 lane count 4
[01:02:18] [PASSED] Link rate 162000 lane count 2
[01:02:18] [PASSED] Link rate 162000 lane count 1
[01:02:18] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[01:02:18] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[01:02:18] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[01:02:18] [PASSED] DP_POWER_UP_PHY with port number
[01:02:18] [PASSED] DP_POWER_DOWN_PHY with port number
[01:02:18] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[01:02:18] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[01:02:18] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[01:02:18] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[01:02:18] [PASSED] DP_QUERY_PAYLOAD with port number
[01:02:18] [PASSED] DP_QUERY_PAYLOAD with VCPI
[01:02:18] [PASSED] DP_REMOTE_DPCD_READ with port number
[01:02:18] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[01:02:18] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[01:02:18] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[01:02:18] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[01:02:18] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[01:02:18] [PASSED] DP_REMOTE_I2C_READ with port number
[01:02:18] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[01:02:18] [PASSED] DP_REMOTE_I2C_READ with transactions array
[01:02:18] [PASSED] DP_REMOTE_I2C_WRITE with port number
[01:02:18] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[01:02:18] [PASSED] DP_REMOTE_I2C_WRITE with data array
[01:02:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[01:02:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[01:02:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[01:02:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[01:02:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[01:02:18] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[01:02:18] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[01:02:18] ================ [PASSED] drm_dp_mst_helper ================
[01:02:18] ================== drm_exec (7 subtests) ===================
[01:02:18] [PASSED] sanitycheck
[01:02:18] [PASSED] test_lock
[01:02:18] [PASSED] test_lock_unlock
[01:02:18] [PASSED] test_duplicates
[01:02:18] [PASSED] test_prepare
[01:02:18] [PASSED] test_prepare_array
[01:02:18] [PASSED] test_multiple_loops
[01:02:18] ==================== [PASSED] drm_exec =====================
[01:02:18] =========== drm_format_helper_test (17 subtests) ===========
[01:02:18] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[01:02:18] [PASSED] single_pixel_source_buffer
[01:02:18] [PASSED] single_pixel_clip_rectangle
[01:02:18] [PASSED] well_known_colors
[01:02:18] [PASSED] destination_pitch
[01:02:18] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[01:02:18] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[01:02:18] [PASSED] single_pixel_source_buffer
[01:02:18] [PASSED] single_pixel_clip_rectangle
[01:02:18] [PASSED] well_known_colors
[01:02:18] [PASSED] destination_pitch
[01:02:18] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[01:02:18] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[01:02:18] [PASSED] single_pixel_source_buffer
[01:02:18] [PASSED] single_pixel_clip_rectangle
[01:02:18] [PASSED] well_known_colors
[01:02:18] [PASSED] destination_pitch
[01:02:18] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[01:02:18] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[01:02:18] [PASSED] single_pixel_source_buffer
[01:02:18] [PASSED] single_pixel_clip_rectangle
[01:02:18] [PASSED] well_known_colors
[01:02:18] [PASSED] destination_pitch
[01:02:18] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[01:02:18] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[01:02:18] [PASSED] single_pixel_source_buffer
[01:02:18] [PASSED] single_pixel_clip_rectangle
[01:02:18] [PASSED] well_known_colors
[01:02:18] [PASSED] destination_pitch
[01:02:18] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[01:02:18] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[01:02:18] [PASSED] single_pixel_source_buffer
[01:02:18] [PASSED] single_pixel_clip_rectangle
[01:02:18] [PASSED] well_known_colors
[01:02:18] [PASSED] destination_pitch
[01:02:18] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[01:02:18] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[01:02:18] [PASSED] single_pixel_source_buffer
[01:02:18] [PASSED] single_pixel_clip_rectangle
[01:02:18] [PASSED] well_known_colors
[01:02:18] [PASSED] destination_pitch
[01:02:18] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[01:02:18] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[01:02:18] [PASSED] single_pixel_source_buffer
[01:02:18] [PASSED] single_pixel_clip_rectangle
[01:02:18] [PASSED] well_known_colors
[01:02:18] [PASSED] destination_pitch
[01:02:18] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[01:02:18] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[01:02:18] [PASSED] single_pixel_source_buffer
[01:02:18] [PASSED] single_pixel_clip_rectangle
[01:02:18] [PASSED] well_known_colors
[01:02:18] [PASSED] destination_pitch
[01:02:18] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[01:02:18] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[01:02:18] [PASSED] single_pixel_source_buffer
[01:02:18] [PASSED] single_pixel_clip_rectangle
[01:02:18] [PASSED] well_known_colors
[01:02:18] [PASSED] destination_pitch
[01:02:18] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[01:02:18] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[01:02:18] [PASSED] single_pixel_source_buffer
[01:02:18] [PASSED] single_pixel_clip_rectangle
[01:02:18] [PASSED] well_known_colors
[01:02:18] [PASSED] destination_pitch
[01:02:18] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[01:02:18] ============== drm_test_fb_xrgb8888_to_mono  ===============
[01:02:18] [PASSED] single_pixel_source_buffer
[01:02:18] [PASSED] single_pixel_clip_rectangle
[01:02:18] [PASSED] well_known_colors
[01:02:18] [PASSED] destination_pitch
[01:02:18] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[01:02:18] ==================== drm_test_fb_swab  =====================
[01:02:18] [PASSED] single_pixel_source_buffer
[01:02:18] [PASSED] single_pixel_clip_rectangle
[01:02:18] [PASSED] well_known_colors
[01:02:18] [PASSED] destination_pitch
[01:02:18] ================ [PASSED] drm_test_fb_swab =================
[01:02:18] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[01:02:18] [PASSED] single_pixel_source_buffer
[01:02:18] [PASSED] single_pixel_clip_rectangle
[01:02:18] [PASSED] well_known_colors
[01:02:18] [PASSED] destination_pitch
[01:02:18] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[01:02:18] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[01:02:18] [PASSED] single_pixel_source_buffer
[01:02:18] [PASSED] single_pixel_clip_rectangle
[01:02:18] [PASSED] well_known_colors
[01:02:18] [PASSED] destination_pitch
[01:02:18] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[01:02:18] ================= drm_test_fb_clip_offset  =================
[01:02:18] [PASSED] pass through
[01:02:18] [PASSED] horizontal offset
[01:02:18] [PASSED] vertical offset
[01:02:18] [PASSED] horizontal and vertical offset
[01:02:18] [PASSED] horizontal offset (custom pitch)
[01:02:18] [PASSED] vertical offset (custom pitch)
[01:02:18] [PASSED] horizontal and vertical offset (custom pitch)
[01:02:18] ============= [PASSED] drm_test_fb_clip_offset =============
[01:02:18] =================== drm_test_fb_memcpy  ====================
[01:02:18] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[01:02:18] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[01:02:18] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[01:02:18] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[01:02:18] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[01:02:18] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[01:02:18] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[01:02:18] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[01:02:18] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[01:02:18] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[01:02:18] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[01:02:18] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[01:02:18] =============== [PASSED] drm_test_fb_memcpy ================
[01:02:18] ============= [PASSED] drm_format_helper_test ==============
[01:02:18] ================= drm_format (18 subtests) =================
[01:02:18] [PASSED] drm_test_format_block_width_invalid
[01:02:18] [PASSED] drm_test_format_block_width_one_plane
[01:02:18] [PASSED] drm_test_format_block_width_two_plane
[01:02:18] [PASSED] drm_test_format_block_width_three_plane
[01:02:18] [PASSED] drm_test_format_block_width_tiled
[01:02:18] [PASSED] drm_test_format_block_height_invalid
[01:02:18] [PASSED] drm_test_format_block_height_one_plane
[01:02:18] [PASSED] drm_test_format_block_height_two_plane
[01:02:18] [PASSED] drm_test_format_block_height_three_plane
[01:02:18] [PASSED] drm_test_format_block_height_tiled
[01:02:18] [PASSED] drm_test_format_min_pitch_invalid
[01:02:18] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[01:02:18] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[01:02:18] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[01:02:18] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[01:02:18] [PASSED] drm_test_format_min_pitch_two_plane
[01:02:18] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[01:02:18] [PASSED] drm_test_format_min_pitch_tiled
[01:02:18] =================== [PASSED] drm_format ====================
[01:02:18] ============== drm_framebuffer (10 subtests) ===============
[01:02:18] ========== drm_test_framebuffer_check_src_coords  ==========
[01:02:18] [PASSED] Success: source fits into fb
[01:02:18] [PASSED] Fail: overflowing fb with x-axis coordinate
[01:02:18] [PASSED] Fail: overflowing fb with y-axis coordinate
[01:02:18] [PASSED] Fail: overflowing fb with source width
[01:02:18] [PASSED] Fail: overflowing fb with source height
[01:02:18] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[01:02:18] [PASSED] drm_test_framebuffer_cleanup
[01:02:18] =============== drm_test_framebuffer_create  ===============
[01:02:18] [PASSED] ABGR8888 normal sizes
[01:02:18] [PASSED] ABGR8888 max sizes
[01:02:18] [PASSED] ABGR8888 pitch greater than min required
[01:02:18] [PASSED] ABGR8888 pitch less than min required
[01:02:18] [PASSED] ABGR8888 Invalid width
[01:02:18] [PASSED] ABGR8888 Invalid buffer handle
[01:02:18] [PASSED] No pixel format
[01:02:18] [PASSED] ABGR8888 Width 0
[01:02:18] [PASSED] ABGR8888 Height 0
[01:02:18] [PASSED] ABGR8888 Out of bound height * pitch combination
[01:02:18] [PASSED] ABGR8888 Large buffer offset
[01:02:18] [PASSED] ABGR8888 Buffer offset for inexistent plane
[01:02:18] [PASSED] ABGR8888 Invalid flag
[01:02:18] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[01:02:18] [PASSED] ABGR8888 Valid buffer modifier
[01:02:18] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[01:02:18] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[01:02:18] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[01:02:18] [PASSED] NV12 Normal sizes
[01:02:18] [PASSED] NV12 Max sizes
[01:02:18] [PASSED] NV12 Invalid pitch
[01:02:18] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[01:02:18] [PASSED] NV12 different  modifier per-plane
[01:02:18] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[01:02:18] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[01:02:18] [PASSED] NV12 Modifier for inexistent plane
[01:02:18] [PASSED] NV12 Handle for inexistent plane
[01:02:18] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[01:02:18] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[01:02:18] [PASSED] YVU420 Normal sizes
[01:02:18] [PASSED] YVU420 Max sizes
[01:02:18] [PASSED] YVU420 Invalid pitch
[01:02:18] [PASSED] YVU420 Different pitches
[01:02:18] [PASSED] YVU420 Different buffer offsets/pitches
[01:02:18] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[01:02:18] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[01:02:18] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[01:02:18] [PASSED] YVU420 Valid modifier
[01:02:18] [PASSED] YVU420 Different modifiers per plane
[01:02:18] [PASSED] YVU420 Modifier for inexistent plane
[01:02:18] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[01:02:18] [PASSED] X0L2 Normal sizes
[01:02:18] [PASSED] X0L2 Max sizes
[01:02:18] [PASSED] X0L2 Invalid pitch
[01:02:18] [PASSED] X0L2 Pitch greater than minimum required
[01:02:18] [PASSED] X0L2 Handle for inexistent plane
[01:02:18] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[01:02:18] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[01:02:18] [PASSED] X0L2 Valid modifier
[01:02:18] [PASSED] X0L2 Modifier for inexistent plane
[01:02:18] =========== [PASSED] drm_test_framebuffer_create ===========
[01:02:18] [PASSED] drm_test_framebuffer_free
[01:02:18] [PASSED] drm_test_framebuffer_init
[01:02:18] [PASSED] drm_test_framebuffer_init_bad_format
[01:02:18] [PASSED] drm_test_framebuffer_init_dev_mismatch
[01:02:18] [PASSED] drm_test_framebuffer_lookup
[01:02:18] [PASSED] drm_test_framebuffer_lookup_inexistent
[01:02:18] [PASSED] drm_test_framebuffer_modifiers_not_supported
[01:02:18] ================= [PASSED] drm_framebuffer =================
[01:02:18] ================ drm_gem_shmem (8 subtests) ================
[01:02:18] [PASSED] drm_gem_shmem_test_obj_create
[01:02:18] [PASSED] drm_gem_shmem_test_obj_create_private
[01:02:18] [PASSED] drm_gem_shmem_test_pin_pages
[01:02:18] [PASSED] drm_gem_shmem_test_vmap
[01:02:18] [PASSED] drm_gem_shmem_test_get_sg_table
[01:02:18] [PASSED] drm_gem_shmem_test_get_pages_sgt
[01:02:18] [PASSED] drm_gem_shmem_test_madvise
[01:02:18] [PASSED] drm_gem_shmem_test_purge
[01:02:18] ================== [PASSED] drm_gem_shmem ==================
[01:02:18] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[01:02:18] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[01:02:18] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[01:02:18] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[01:02:18] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[01:02:18] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[01:02:18] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[01:02:18] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[01:02:18] [PASSED] Automatic
[01:02:18] [PASSED] Full
[01:02:18] [PASSED] Limited 16:235
[01:02:18] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[01:02:18] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[01:02:18] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[01:02:18] [PASSED] drm_test_check_disable_connector
[01:02:18] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[01:02:18] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[01:02:18] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[01:02:18] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[01:02:18] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[01:02:18] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[01:02:18] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[01:02:18] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[01:02:18] [PASSED] drm_test_check_output_bpc_dvi
[01:02:18] [PASSED] drm_test_check_output_bpc_format_vic_1
[01:02:18] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[01:02:18] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[01:02:18] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[01:02:18] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[01:02:18] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[01:02:18] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[01:02:18] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[01:02:18] ============ drm_test_check_hdmi_color_format  =============
[01:02:18] [PASSED] AUTO -> RGB
[01:02:18] [PASSED] YCBCR422 -> YUV422
[01:02:18] [PASSED] YCBCR420 -> YUV420
[01:02:18] [PASSED] YCBCR444 -> YUV444
[01:02:18] [PASSED] RGB -> RGB
[01:02:18] ======== [PASSED] drm_test_check_hdmi_color_format =========
[01:02:18] ======== drm_test_check_hdmi_color_format_420_only  ========
[01:02:18] [PASSED] RGB should fail
[01:02:18] [PASSED] YUV444 should fail
[01:02:18] [PASSED] YUV422 should fail
[01:02:18] [PASSED] YUV420 should work
[01:02:18] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[01:02:18] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[01:02:18] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[01:02:18] [PASSED] drm_test_check_broadcast_rgb_value
[01:02:18] [PASSED] drm_test_check_bpc_8_value
[01:02:18] [PASSED] drm_test_check_bpc_10_value
[01:02:18] [PASSED] drm_test_check_bpc_12_value
[01:02:18] [PASSED] drm_test_check_format_value
[01:02:18] [PASSED] drm_test_check_tmds_char_value
[01:02:18] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[01:02:18] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[01:02:18] [PASSED] drm_test_check_mode_valid
[01:02:18] [PASSED] drm_test_check_mode_valid_reject
[01:02:18] [PASSED] drm_test_check_mode_valid_reject_rate
[01:02:18] [PASSED] drm_test_check_mode_valid_reject_max_clock
[01:02:18] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[01:02:18] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[01:02:18] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[01:02:18] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[01:02:18] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[01:02:18] [PASSED] drm_test_check_infoframes
[01:02:18] [PASSED] drm_test_check_reject_avi_infoframe
[01:02:18] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[01:02:18] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[01:02:18] [PASSED] drm_test_check_reject_audio_infoframe
[01:02:18] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[01:02:18] ================= drm_managed (2 subtests) =================
[01:02:18] [PASSED] drm_test_managed_release_action
[01:02:18] [PASSED] drm_test_managed_run_action
[01:02:18] =================== [PASSED] drm_managed ===================
[01:02:18] =================== drm_mm (6 subtests) ====================
[01:02:18] [PASSED] drm_test_mm_init
[01:02:18] [PASSED] drm_test_mm_debug
[01:02:18] [PASSED] drm_test_mm_align32
[01:02:18] [PASSED] drm_test_mm_align64
[01:02:18] [PASSED] drm_test_mm_lowest
[01:02:18] [PASSED] drm_test_mm_highest
[01:02:18] ===================== [PASSED] drm_mm ======================
[01:02:18] ============= drm_modes_analog_tv (5 subtests) =============
[01:02:18] [PASSED] drm_test_modes_analog_tv_mono_576i
[01:02:18] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[01:02:18] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[01:02:18] [PASSED] drm_test_modes_analog_tv_pal_576i
[01:02:18] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[01:02:18] =============== [PASSED] drm_modes_analog_tv ===============
[01:02:18] ============== drm_panic_helper (3 subtests) ===============
[01:02:18] ============= drm_test_panic_screen_user_map  ==============
[01:02:18] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[01:02:18] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[01:02:18] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[01:02:18] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[01:02:18] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[01:02:18] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[01:02:18] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[01:02:18] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[01:02:18] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[01:02:18] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[01:02:18] ========= [PASSED] drm_test_panic_screen_user_map ==========
[01:02:18] ============= drm_test_panic_screen_user_page  =============
[01:02:18] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[01:02:18] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[01:02:18] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[01:02:18] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[01:02:18] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[01:02:18] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[01:02:18] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[01:02:18] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[01:02:18] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[01:02:18] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[01:02:18] ========= [PASSED] drm_test_panic_screen_user_page =========
[01:02:18] ========== drm_test_panic_screen_user_set_pixel  ===========
[01:02:18] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[01:02:18] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[01:02:18] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[01:02:18] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[01:02:18] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[01:02:18] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[01:02:18] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[01:02:18] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[01:02:18] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[01:02:18] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[01:02:18] ====== [PASSED] drm_test_panic_screen_user_set_pixel =======
[01:02:18] ================ [PASSED] drm_panic_helper =================
[01:02:18] ============== drm_plane_helper (2 subtests) ===============
[01:02:18] =============== drm_test_check_plane_state  ================
[01:02:18] [PASSED] clipping_simple
[01:02:18] [PASSED] clipping_rotate_reflect
[01:02:18] [PASSED] positioning_simple
[01:02:18] [PASSED] upscaling
[01:02:18] [PASSED] downscaling
[01:02:18] [PASSED] rounding1
[01:02:18] [PASSED] rounding2
[01:02:18] [PASSED] rounding3
[01:02:18] [PASSED] rounding4
[01:02:18] =========== [PASSED] drm_test_check_plane_state ============
[01:02:18] =========== drm_test_check_invalid_plane_state  ============
[01:02:18] [PASSED] positioning_invalid
[01:02:18] [PASSED] upscaling_invalid
[01:02:18] [PASSED] downscaling_invalid
[01:02:18] ======= [PASSED] drm_test_check_invalid_plane_state ========
[01:02:18] ================ [PASSED] drm_plane_helper =================
[01:02:18] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[01:02:18] ====== drm_test_connector_helper_tv_get_modes_check  =======
[01:02:18] [PASSED] None
[01:02:18] [PASSED] PAL
[01:02:18] [PASSED] NTSC
[01:02:18] [PASSED] Both, NTSC Default
[01:02:18] [PASSED] Both, PAL Default
[01:02:18] [PASSED] Both, NTSC Default, with PAL on command-line
[01:02:18] [PASSED] Both, PAL Default, with NTSC on command-line
[01:02:18] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[01:02:18] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[01:02:18] ================== drm_rect (9 subtests) ===================
[01:02:18] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[01:02:18] [PASSED] drm_test_rect_clip_scaled_not_clipped
[01:02:18] [PASSED] drm_test_rect_clip_scaled_clipped
[01:02:18] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[01:02:18] ================= drm_test_rect_intersect  =================
[01:02:18] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[01:02:18] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[01:02:18] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[01:02:18] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[01:02:18] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[01:02:18] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[01:02:18] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[01:02:18] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[01:02:18] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[01:02:18] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[01:02:18] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[01:02:18] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[01:02:18] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[01:02:18] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[01:02:18] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[01:02:18] ============= [PASSED] drm_test_rect_intersect =============
[01:02:18] ================ drm_test_rect_calc_hscale  ================
[01:02:18] [PASSED] normal use
[01:02:18] [PASSED] out of max range
[01:02:18] [PASSED] out of min range
[01:02:18] [PASSED] zero dst
[01:02:18] [PASSED] negative src
[01:02:18] [PASSED] negative dst
[01:02:18] ============ [PASSED] drm_test_rect_calc_hscale ============
[01:02:18] ================ drm_test_rect_calc_vscale  ================
[01:02:18] [PASSED] normal use
[01:02:18] [PASSED] out of max range
[01:02:18] [PASSED] out of min range
[01:02:18] [PASSED] zero dst
[01:02:18] [PASSED] negative src
[01:02:18] [PASSED] negative dst
[01:02:18] ============ [PASSED] drm_test_rect_calc_vscale ============
[01:02:18] ================== drm_test_rect_rotate  ===================
[01:02:18] [PASSED] reflect-x
[01:02:18] [PASSED] reflect-y
[01:02:18] [PASSED] rotate-0
[01:02:18] [PASSED] rotate-90
[01:02:18] [PASSED] rotate-180
[01:02:18] [PASSED] rotate-270
[01:02:18] ============== [PASSED] drm_test_rect_rotate ===============
[01:02:18] ================ drm_test_rect_rotate_inv  =================
[01:02:18] [PASSED] reflect-x
[01:02:18] [PASSED] reflect-y
[01:02:18] [PASSED] rotate-0
[01:02:18] [PASSED] rotate-90
[01:02:18] [PASSED] rotate-180
[01:02:18] [PASSED] rotate-270
[01:02:18] ============ [PASSED] drm_test_rect_rotate_inv =============
[01:02:18] ==================== [PASSED] drm_rect =====================
[01:02:18] ============ drm_sysfb_modeset_test (1 subtest) ============
[01:02:18] ============ drm_test_sysfb_build_fourcc_list  =============
[01:02:18] [PASSED] no native formats
[01:02:18] [PASSED] XRGB8888 as native format
[01:02:18] [PASSED] remove duplicates
[01:02:18] [PASSED] convert alpha formats
[01:02:18] [PASSED] random formats
[01:02:18] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[01:02:18] ============= [PASSED] drm_sysfb_modeset_test ==============
[01:02:18] ================== drm_fixp (2 subtests) ===================
[01:02:18] [PASSED] drm_test_int2fixp
[01:02:18] [PASSED] drm_test_sm2fixp
[01:02:18] ==================== [PASSED] drm_fixp =====================
[01:02:18] ============================================================
[01:02:18] Testing complete. Ran 667 tests: passed: 667
[01:02:18] Elapsed time: 27.148s total, 1.898s configuring, 24.783s building, 0.446s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[01:02:19] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:02:21] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[01:02:31] Starting KUnit Kernel (1/1)...
[01:02:31] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:02:31] ================= ttm_device (5 subtests) ==================
[01:02:31] [PASSED] ttm_device_init_basic
[01:02:31] [PASSED] ttm_device_init_multiple
[01:02:31] [PASSED] ttm_device_fini_basic
[01:02:31] [PASSED] ttm_device_init_no_vma_man
[01:02:31] ================== ttm_device_init_pools  ==================
[01:02:31] [PASSED] No DMA allocations, no DMA32 required
[01:02:31] [PASSED] DMA allocations, DMA32 required
[01:02:31] [PASSED] No DMA allocations, DMA32 required
[01:02:31] [PASSED] DMA allocations, no DMA32 required
[01:02:31] ============== [PASSED] ttm_device_init_pools ==============
[01:02:31] =================== [PASSED] ttm_device ====================
[01:02:31] ================== ttm_pool (8 subtests) ===================
[01:02:31] ================== ttm_pool_alloc_basic  ===================
[01:02:31] [PASSED] One page
[01:02:31] [PASSED] More than one page
[01:02:31] [PASSED] Above the allocation limit
[01:02:31] [PASSED] One page, with coherent DMA mappings enabled
[01:02:31] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[01:02:31] ============== [PASSED] ttm_pool_alloc_basic ===============
[01:02:31] ============== ttm_pool_alloc_basic_dma_addr  ==============
[01:02:31] [PASSED] One page
[01:02:31] [PASSED] More than one page
[01:02:31] [PASSED] Above the allocation limit
[01:02:31] [PASSED] One page, with coherent DMA mappings enabled
[01:02:31] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[01:02:31] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[01:02:31] [PASSED] ttm_pool_alloc_order_caching_match
[01:02:31] [PASSED] ttm_pool_alloc_caching_mismatch
[01:02:31] [PASSED] ttm_pool_alloc_order_mismatch
[01:02:31] [PASSED] ttm_pool_free_dma_alloc
[01:02:31] [PASSED] ttm_pool_free_no_dma_alloc
[01:02:31] [PASSED] ttm_pool_fini_basic
[01:02:31] ==================== [PASSED] ttm_pool =====================
[01:02:31] ================ ttm_resource (8 subtests) =================
[01:02:31] ================= ttm_resource_init_basic  =================
[01:02:31] [PASSED] Init resource in TTM_PL_SYSTEM
[01:02:31] [PASSED] Init resource in TTM_PL_VRAM
[01:02:31] [PASSED] Init resource in a private placement
[01:02:31] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[01:02:31] ============= [PASSED] ttm_resource_init_basic =============
[01:02:31] [PASSED] ttm_resource_init_pinned
[01:02:31] [PASSED] ttm_resource_fini_basic
[01:02:31] [PASSED] ttm_resource_manager_init_basic
[01:02:31] [PASSED] ttm_resource_manager_usage_basic
[01:02:31] [PASSED] ttm_resource_manager_set_used_basic
[01:02:31] [PASSED] ttm_sys_man_alloc_basic
[01:02:31] [PASSED] ttm_sys_man_free_basic
[01:02:31] ================== [PASSED] ttm_resource ===================
[01:02:31] =================== ttm_tt (15 subtests) ===================
[01:02:31] ==================== ttm_tt_init_basic  ====================
[01:02:31] [PASSED] Page-aligned size
[01:02:31] [PASSED] Extra pages requested
[01:02:31] ================ [PASSED] ttm_tt_init_basic ================
[01:02:31] [PASSED] ttm_tt_init_misaligned
[01:02:31] [PASSED] ttm_tt_fini_basic
[01:02:31] [PASSED] ttm_tt_fini_sg
[01:02:31] [PASSED] ttm_tt_fini_shmem
[01:02:31] [PASSED] ttm_tt_create_basic
[01:02:31] [PASSED] ttm_tt_create_invalid_bo_type
[01:02:31] [PASSED] ttm_tt_create_ttm_exists
[01:02:31] [PASSED] ttm_tt_create_failed
[01:02:31] [PASSED] ttm_tt_destroy_basic
[01:02:31] [PASSED] ttm_tt_populate_null_ttm
[01:02:31] [PASSED] ttm_tt_populate_populated_ttm
[01:02:31] [PASSED] ttm_tt_unpopulate_basic
[01:02:31] [PASSED] ttm_tt_unpopulate_empty_ttm
[01:02:31] [PASSED] ttm_tt_swapin_basic
[01:02:31] ===================== [PASSED] ttm_tt ======================
[01:02:31] =================== ttm_bo (14 subtests) ===================
[01:02:31] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[01:02:31] [PASSED] Cannot be interrupted and sleeps
[01:02:31] [PASSED] Cannot be interrupted, locks straight away
[01:02:31] [PASSED] Can be interrupted, sleeps
[01:02:31] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[01:02:31] [PASSED] ttm_bo_reserve_locked_no_sleep
[01:02:31] [PASSED] ttm_bo_reserve_no_wait_ticket
[01:02:31] [PASSED] ttm_bo_reserve_double_resv
[01:02:31] [PASSED] ttm_bo_reserve_interrupted
[01:02:31] [PASSED] ttm_bo_reserve_deadlock
[01:02:31] [PASSED] ttm_bo_unreserve_basic
[01:02:31] [PASSED] ttm_bo_unreserve_pinned
[01:02:31] [PASSED] ttm_bo_unreserve_bulk
[01:02:31] [PASSED] ttm_bo_fini_basic
[01:02:31] [PASSED] ttm_bo_fini_shared_resv
[01:02:31] [PASSED] ttm_bo_pin_basic
[01:02:31] [PASSED] ttm_bo_pin_unpin_resource
[01:02:31] [PASSED] ttm_bo_multiple_pin_one_unpin
[01:02:31] ===================== [PASSED] ttm_bo ======================
[01:02:31] ============== ttm_bo_validate (22 subtests) ===============
[01:02:31] ============== ttm_bo_init_reserved_sys_man  ===============
[01:02:31] [PASSED] Buffer object for userspace
[01:02:31] [PASSED] Kernel buffer object
[01:02:31] [PASSED] Shared buffer object
[01:02:31] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[01:02:31] ============== ttm_bo_init_reserved_mock_man  ==============
[01:02:31] [PASSED] Buffer object for userspace
[01:02:31] [PASSED] Kernel buffer object
[01:02:31] [PASSED] Shared buffer object
[01:02:31] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[01:02:31] [PASSED] ttm_bo_init_reserved_resv
[01:02:31] ================== ttm_bo_validate_basic  ==================
[01:02:31] [PASSED] Buffer object for userspace
[01:02:31] [PASSED] Kernel buffer object
[01:02:31] [PASSED] Shared buffer object
[01:02:31] ============== [PASSED] ttm_bo_validate_basic ==============
[01:02:31] [PASSED] ttm_bo_validate_invalid_placement
[01:02:31] ============= ttm_bo_validate_same_placement  ==============
[01:02:31] [PASSED] System manager
[01:02:31] [PASSED] VRAM manager
[01:02:31] ========= [PASSED] ttm_bo_validate_same_placement ==========
[01:02:31] [PASSED] ttm_bo_validate_failed_alloc
[01:02:31] [PASSED] ttm_bo_validate_pinned
[01:02:31] [PASSED] ttm_bo_validate_busy_placement
[01:02:31] ================ ttm_bo_validate_multihop  =================
[01:02:31] [PASSED] Buffer object for userspace
[01:02:31] [PASSED] Kernel buffer object
[01:02:31] [PASSED] Shared buffer object
[01:02:31] ============ [PASSED] ttm_bo_validate_multihop =============
[01:02:31] ========== ttm_bo_validate_no_placement_signaled  ==========
[01:02:31] [PASSED] Buffer object in system domain, no page vector
[01:02:31] [PASSED] Buffer object in system domain with an existing page vector
[01:02:31] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[01:02:31] ======== ttm_bo_validate_no_placement_not_signaled  ========
[01:02:31] [PASSED] Buffer object for userspace
[01:02:31] [PASSED] Kernel buffer object
[01:02:31] [PASSED] Shared buffer object
[01:02:31] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[01:02:31] [PASSED] ttm_bo_validate_move_fence_signaled
[01:02:31] ========= ttm_bo_validate_move_fence_not_signaled  =========
[01:02:31] [PASSED] Waits for GPU
[01:02:31] [PASSED] Tries to lock straight away
[01:02:31] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[01:02:31] [PASSED] ttm_bo_validate_swapout
[01:02:31] [PASSED] ttm_bo_validate_happy_evict
[01:02:31] [PASSED] ttm_bo_validate_all_pinned_evict
[01:02:31] [PASSED] ttm_bo_validate_allowed_only_evict
[01:02:31] [PASSED] ttm_bo_validate_deleted_evict
[01:02:31] [PASSED] ttm_bo_validate_busy_domain_evict
[01:02:31] [PASSED] ttm_bo_validate_evict_gutting
[01:02:31] [PASSED] ttm_bo_validate_recrusive_evict
[01:02:31] ================= [PASSED] ttm_bo_validate =================
[01:02:31] ============================================================
[01:02:31] Testing complete. Ran 102 tests: passed: 102
[01:02:31] Elapsed time: 12.398s total, 1.920s configuring, 10.263s building, 0.184s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/dma-buf/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[01:02:31] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:02:33] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[01:02:42] Starting KUnit Kernel (1/1)...
[01:02:42] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:02:42] =============== dma-buf-fence (12 subtests) ================
[01:02:42] [PASSED] test_sanitycheck
[01:02:42] [PASSED] test_signaling
[01:02:42] [PASSED] test_add_callback
[01:02:42] [PASSED] test_late_add_callback
[01:02:42] [PASSED] test_rm_callback
[01:02:42] [PASSED] test_late_rm_callback
[01:02:42] [PASSED] test_status
[01:02:42] [PASSED] test_error
[01:02:42] [PASSED] test_wait
[01:02:42] [PASSED] test_wait_timeout
[01:02:42] [PASSED] test_stub
[01:02:42] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[01:02:42] ================== [PASSED] dma-buf-fence ==================
[01:02:42] ============ dma-buf-fence-chain (11 subtests) =============
[01:02:42] [PASSED] test_sanitycheck
[01:02:42] [PASSED] test_find_seqno
[01:02:42] [PASSED] test_find_signaled
[01:02:42] [PASSED] test_find_out_of_order
[01:02:47] [PASSED] test_find_gap
[01:02:47] [PASSED] test_find_race
[01:02:47] [PASSED] test_signal_forward
[01:02:47] [PASSED] test_signal_backward
[01:02:47] [PASSED] test_wait_forward
[01:02:47] [PASSED] test_wait_backward
[01:02:47] [PASSED] test_wait_random
[01:02:47] =============== [PASSED] dma-buf-fence-chain ===============
[01:02:47] ============ dma-buf-fence-unwrap (11 subtests) ============
[01:02:47] [PASSED] test_sanitycheck
[01:02:47] [PASSED] test_unwrap_array
[01:02:47] [PASSED] test_unwrap_chain
[01:02:47] [PASSED] test_unwrap_chain_array
[01:02:47] [PASSED] test_unwrap_merge
[01:02:47] [PASSED] test_unwrap_merge_duplicate
[01:02:47] [PASSED] test_unwrap_merge_seqno
[01:02:47] [PASSED] test_unwrap_merge_order
[01:02:47] [PASSED] test_unwrap_merge_complex
[01:02:47] [PASSED] test_unwrap_merge_complex_seqno
[01:02:47] [PASSED] test_dedup_empty
[01:02:47] ============== [PASSED] dma-buf-fence-unwrap ===============
[01:02:47] ================ dma-buf-resv (5 subtests) =================
[01:02:47] [PASSED] test_sanitycheck
[01:02:47] ===================== test_signaling  ======================
[01:02:47] [PASSED] kernel
[01:02:47] [PASSED] write
[01:02:47] [PASSED] read
[01:02:47] [PASSED] bookkeep
[01:02:47] ================= [PASSED] test_signaling ==================
[01:02:47] ====================== test_for_each  ======================
[01:02:47] [PASSED] kernel
[01:02:47] [PASSED] write
[01:02:47] [PASSED] read
[01:02:47] [PASSED] bookkeep
[01:02:47] ================== [PASSED] test_for_each ==================
[01:02:47] ================= test_for_each_unlocked  ==================
[01:02:47] [PASSED] kernel
[01:02:47] [PASSED] write
[01:02:47] [PASSED] read
[01:02:47] [PASSED] bookkeep
[01:02:47] ============= [PASSED] test_for_each_unlocked ==============
[01:02:47] ===================== test_get_fences  =====================
[01:02:47] [PASSED] kernel
[01:02:47] [PASSED] write
[01:02:47] [PASSED] read
[01:02:47] [PASSED] bookkeep
[01:02:47] ================= [PASSED] test_get_fences =================
[01:02:47] ================== [PASSED] dma-buf-resv ===================
[01:02:47] ============================================================
[01:02:47] Testing complete. Ran 51 tests: passed: 50, skipped: 1
[01:02:47] Elapsed time: 15.990s total, 1.877s configuring, 8.841s building, 5.265s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


