Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEEB606A326
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 08:52:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797A110F399;
	Tue, 24 Nov 2026 08:52:11 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FBA10F391;
 Tue, 24 Nov 2026 08:52:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/i915/display=3A_Handle_str?=
 =?utf-8?q?uct_drm=5Fplane=5Fstate=2Eignore=5Fdamage=5Fclips_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Nov 2026 08:52:10 -0000
Message-ID: <179551033021.75823.11966666033641831636@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261124084108.528317-1-tzimmermann@suse.de>
In-Reply-To: <20261124084108.528317-1-tzimmermann@suse.de>
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

Series: drm/i915/display: Handle struct drm_plane_state.ignore_damage_clips (rev4)
URL   : https://patchwork.freedesktop.org/series/169626/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[08:50:14] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:50:19] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[08:50:40] Starting KUnit Kernel (1/1)...
[08:50:40] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[08:50:40] ================= gpu_buddy (15 subtests) ==================
[08:50:40] [PASSED] gpu_test_buddy_alloc_limit
[08:50:40] [PASSED] gpu_test_buddy_alloc_optimistic
[08:50:40] [PASSED] gpu_test_buddy_alloc_pessimistic
[08:50:40] [PASSED] gpu_test_buddy_alloc_pathological
[08:50:40] [PASSED] gpu_test_buddy_alloc_contiguous
[08:50:40] [PASSED] gpu_test_buddy_alloc_clear
[08:50:40] [PASSED] gpu_test_buddy_alloc_range
[08:50:40] [PASSED] gpu_test_buddy_alloc_range_bias
[08:50:40] [PASSED] gpu_test_buddy_alloc_range_clear_guard
[08:50:41] [PASSED] gpu_test_buddy_fragmentation_performance
[08:50:42] [PASSED] gpu_test_buddy_dirty_tracker_performance
[08:50:42] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[08:50:42] [PASSED] gpu_test_buddy_offset_aligned_allocation
[08:50:42] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[08:50:42] [PASSED] gpu_test_buddy_addr_to_block
[08:50:42] ==================== [PASSED] gpu_buddy ====================
[08:50:42] ============================================================
[08:50:42] Testing complete. Ran 15 tests: passed: 15
[08:50:42] Elapsed time: 28.156s total, 5.116s configuring, 21.023s building, 1.969s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[08:50:42] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:50:45] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[08:51:23] Starting KUnit Kernel (1/1)...
[08:51:23] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[08:51:24] ================= xe_ggtt_iov (9 subtests) =================
[08:51:24] [PASSED] init_shared_pf
[08:51:24] [PASSED] init_partial_overlap
[08:51:24] [PASSED] alloc_usable_pool_low
[08:51:24] [PASSED] alloc_shareable_pool_high
[08:51:24] [PASSED] alloc_partial_overlap
[08:51:24] [PASSED] alloc_partial_overlap_usable_full
[08:51:24] [PASSED] alloc_partial_overlap_shareable_full
[08:51:24] [PASSED] alloc_shareable_pool_unavailable
[08:51:24] [PASSED] alloc_shareable_pool_oversized
[08:51:24] =================== [PASSED] xe_ggtt_iov ===================
[08:51:24] =================== xe_ggtt (3 subtests) ===================
[08:51:24] [PASSED] init_native
[08:51:24] [PASSED] alloc_usable_pool_native
[08:51:24] [PASSED] alloc_usable_pool_oversized
[08:51:24] ===================== [PASSED] xe_ggtt =====================
[08:51:24] ================== guc_buf (11 subtests) ===================
[08:51:24] [PASSED] test_smallest
[08:51:24] [PASSED] test_largest
[08:51:24] [PASSED] test_granular
[08:51:24] [PASSED] test_unique
[08:51:24] [PASSED] test_overlap
[08:51:24] [PASSED] test_reusable
[08:51:24] [PASSED] test_too_big
[08:51:24] [PASSED] test_flush
[08:51:24] [PASSED] test_lookup
[08:51:24] [PASSED] test_data
[08:51:24] [PASSED] test_class
[08:51:24] ===================== [PASSED] guc_buf =====================
[08:51:24] =================== guc_dbm (7 subtests) ===================
[08:51:24] [PASSED] test_empty
[08:51:24] [PASSED] test_default
[08:51:24] ======================== test_size  ========================
[08:51:24] [PASSED] 4
[08:51:24] [PASSED] 8
[08:51:24] [PASSED] 32
[08:51:24] [PASSED] 256
[08:51:24] ==================== [PASSED] test_size ====================
[08:51:24] ======================= test_reuse  ========================
[08:51:24] [PASSED] 4
[08:51:24] [PASSED] 8
[08:51:24] [PASSED] 32
[08:51:24] [PASSED] 256
[08:51:24] =================== [PASSED] test_reuse ====================
[08:51:24] =================== test_range_overlap  ====================
[08:51:24] [PASSED] 4
[08:51:24] [PASSED] 8
[08:51:24] [PASSED] 32
[08:51:24] [PASSED] 256
[08:51:24] =============== [PASSED] test_range_overlap ================
[08:51:24] =================== test_range_compact  ====================
[08:51:24] [PASSED] 4
[08:51:24] [PASSED] 8
[08:51:24] [PASSED] 32
[08:51:24] [PASSED] 256
[08:51:24] =============== [PASSED] test_range_compact ================
[08:51:24] ==================== test_range_spare  =====================
[08:51:24] [PASSED] 4
[08:51:24] [PASSED] 8
[08:51:24] [PASSED] 32
[08:51:24] [PASSED] 256
[08:51:24] ================ [PASSED] test_range_spare =================
[08:51:24] ===================== [PASSED] guc_dbm =====================
[08:51:24] ================== guc_idm (22 subtests) ===================
[08:51:24] [PASSED] bad_init
[08:51:24] [PASSED] no_init
[08:51:24] [PASSED] init_fini
[08:51:24] [PASSED] check_init_small
[08:51:24] [PASSED] check_init_shared
[08:51:24] [PASSED] check_used
[08:51:24] [PASSED] check_quota
[08:51:24] [PASSED] check_all
[08:51:24] [PASSED] check_limits
[08:51:24] [PASSED] check_overlap
[08:51:24] [PASSED] check_overlap_alloc
[08:51:24] [PASSED] check_overlap_release
[08:51:24] [PASSED] check_overlap_partial_init
[08:51:24] [PASSED] check_overlap_partial_shared_range_blocking
[08:51:24] [PASSED] check_used_usable
[08:51:24] [PASSED] check_used_shareable
[08:51:24] [PASSED] check_used_mixed
[08:51:24] [PASSED] check_release_usable_range
[08:51:24] [PASSED] check_release_shareable_range
[08:51:24] [PASSED] check_split_boundaries
[08:51:24] [PASSED] check_shareable_spare
[08:51:24] [PASSED] check_shareable_spare_fragmented_tail
[08:51:24] ===================== [PASSED] guc_idm =====================
[08:51:24] ============== guc_klv_helpers (13 subtests) ===============
[08:51:24] [PASSED] test_count
[08:51:24] [PASSED] test_encode_u32
[08:51:24] [PASSED] test_encode_u64
[08:51:24] [PASSED] test_encode_string
[08:51:24] [PASSED] test_encode_object_raw
[08:51:24] [PASSED] test_encode_object_klv
[08:51:24] [PASSED] test_encode_object_nested
[08:51:24] [PASSED] test_encode_object_basic
[08:51:24] ===================== test_decode_u16  =====================
[08:51:24] [PASSED] empty
[08:51:24] [PASSED] valid
[08:51:24] [PASSED] max
[08:51:24] [PASSED] big
[08:51:24] [PASSED] long
[08:51:24] ================= [PASSED] test_decode_u16 =================
[08:51:24] ===================== test_decode_u32  =====================
[08:51:24] [PASSED] empty
[08:51:24] [PASSED] valid
[08:51:24] [PASSED] max
[08:51:24] [PASSED] long
[08:51:24] ================= [PASSED] test_decode_u32 =================
[08:51:24] ===================== test_decode_u64  =====================
[08:51:24] [PASSED] empty
[08:51:24] [PASSED] short
[08:51:24] [PASSED] valid
[08:51:24] [PASSED] max
[08:51:24] [PASSED] long
[08:51:24] ================= [PASSED] test_decode_u64 =================
[08:51:24] ===================== test_decode_str  =====================
[08:51:24] [PASSED] empty
[08:51:24] [PASSED] one
[08:51:24] [PASSED] one_trash
[08:51:24] [PASSED] two
[08:51:24] [PASSED] two_trash
[08:51:24] [PASSED] three
[08:51:24] [PASSED] dword
[08:51:24] [PASSED] four
[08:51:24] [PASSED] five
[08:51:24] [PASSED] six
[08:51:24] [PASSED] seven
[08:51:24] [PASSED] qword
[08:51:24] ================= [PASSED] test_decode_str =================
[08:51:24] [PASSED] test_print
[08:51:24] ================= [PASSED] guc_klv_helpers =================
[08:51:24] =================== xe_log (4 subtests) ====================
[08:51:24] [PASSED] demo_cper
[08:51:24] [PASSED] demo_dmesg
[08:51:24] ======================= test_dmesg  ========================
[08:51:24] [PASSED] test_fatal
[08:51:24] [PASSED] test_fatal_tile
[08:51:24] [PASSED] test_fatal_gt
[08:51:24] [PASSED] test_fatal_comp
[08:51:24] [PASSED] test_fatal_comp_tile
[08:51:24] [PASSED] test_fatal_comp_gt
[08:51:24] [PASSED] test_fatal_all
[08:51:24] [PASSED] test_recoverable
[08:51:24] [PASSED] test_recoverable_tile
[08:51:24] [PASSED] test_recoverable_gt
[08:51:24] [PASSED] test_recoverable_comp
[08:51:24] [PASSED] test_recoverable_comp_tile
[08:51:24] [PASSED] test_recoverable_comp_gt
[08:51:24] [PASSED] test_recoverable_all
[08:51:24] [PASSED] test_info
[08:51:24] [PASSED] test_info_tile
[08:51:24] [PASSED] test_info_gt
[08:51:24] [PASSED] test_info_err
[08:51:24] [PASSED] test_info_comp
[08:51:24] [PASSED] test_info_comp_tile
[08:51:24] [PASSED] test_info_comp_gt
[08:51:24] [PASSED] test_info_all
[08:51:24] [PASSED] test_hw_fatal
[08:51:24] [PASSED] test_hw_recoverable
[08:51:24] [PASSED] test_hw_corrected
[08:51:24] [PASSED] test_hw_informational
[08:51:24] =================== [PASSED] test_dmesg ====================
[08:51:24] ====================== test_invalid  =======================
[08:51:24] [SKIPPED] no-component no-location no-warn (requires CONFIG_DRM_XE_DEBUG)
[08:51:24] [SKIPPED] reserved location (requires CONFIG_DRM_XE_DEBUG)
[08:51:24] [SKIPPED] unknown location (requires CONFIG_DRM_XE_DEBUG)
[08:51:24] [SKIPPED] nonzero-device-id location (requires CONFIG_DRM_XE_DEBUG)
[08:51:24] [SKIPPED] invalid-tile-id location (requires CONFIG_DRM_XE_DEBUG)
[08:51:24] [SKIPPED] invalid-gt-id location (requires CONFIG_DRM_XE_DEBUG)
[08:51:24] [SKIPPED] unknown component class (requires CONFIG_DRM_XE_DEBUG)
[08:51:24] [SKIPPED] unknown system component (requires CONFIG_DRM_XE_DEBUG)
[08:51:24] [SKIPPED] unknown hardware component (requires CONFIG_DRM_XE_DEBUG)
[08:51:24] [SKIPPED] unknown component and location (requires CONFIG_DRM_XE_DEBUG)
[08:51:24] ================== [SKIPPED] test_invalid ==================
[08:51:24] ===================== [PASSED] xe_log ======================
[08:51:24] ================== no_relay (3 subtests) ===================
[08:51:24] [PASSED] xe_drops_guc2pf_if_not_ready
[08:51:24] [PASSED] xe_drops_guc2vf_if_not_ready
[08:51:24] [PASSED] xe_rejects_send_if_not_ready
[08:51:24] ==================== [PASSED] no_relay =====================
[08:51:24] ================== pf_relay (14 subtests) ==================
[08:51:24] [PASSED] pf_rejects_guc2pf_too_short
[08:51:24] [PASSED] pf_rejects_guc2pf_too_long
[08:51:24] [PASSED] pf_rejects_guc2pf_no_payload
[08:51:24] [PASSED] pf_fails_no_payload
[08:51:24] [PASSED] pf_fails_bad_origin
[08:51:24] [PASSED] pf_fails_bad_type
[08:51:24] [PASSED] pf_txn_reports_error
[08:51:24] [PASSED] pf_txn_sends_pf2guc
[08:51:24] [PASSED] pf_sends_pf2guc
[08:51:24] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[08:51:24] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[08:51:24] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[08:51:24] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[08:51:24] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[08:51:24] ==================== [PASSED] pf_relay =====================
[08:51:24] ================== vf_relay (3 subtests) ===================
[08:51:24] [PASSED] vf_rejects_guc2vf_too_short
[08:51:24] [PASSED] vf_rejects_guc2vf_too_long
[08:51:24] [PASSED] vf_rejects_guc2vf_no_payload
[08:51:24] ==================== [PASSED] vf_relay =====================
[08:51:24] ================ pf_gt_config (9 subtests) =================
[08:51:24] [PASSED] fair_contexts_1vf
[08:51:24] [PASSED] fair_doorbells_1vf
[08:51:24] [PASSED] fair_ggtt_1vf
[08:51:24] ====================== fair_vram_1vf  ======================
[08:51:24] [PASSED] 3.50 GiB
[08:51:24] [PASSED] 11.5 GiB
[08:51:24] [PASSED] 15.5 GiB
[08:51:24] [PASSED] 31.5 GiB
[08:51:24] [PASSED] 63.5 GiB
[08:51:24] [PASSED] 1.91 GiB
[08:51:24] ================== [PASSED] fair_vram_1vf ==================
[08:51:24] ================ fair_vram_1vf_admin_only  =================
[08:51:24] [PASSED] 3.50 GiB
[08:51:24] [PASSED] 11.5 GiB
[08:51:24] [PASSED] 15.5 GiB
[08:51:24] [PASSED] 31.5 GiB
[08:51:24] [PASSED] 63.5 GiB
[08:51:24] [PASSED] 1.91 GiB
[08:51:24] ============ [PASSED] fair_vram_1vf_admin_only =============
[08:51:24] ====================== fair_contexts  ======================
[08:51:24] [PASSED] 1 VF
[08:51:24] [PASSED] 2 VFs
[08:51:24] [PASSED] 3 VFs
[08:51:24] [PASSED] 4 VFs
[08:51:24] [PASSED] 5 VFs
[08:51:24] [PASSED] 6 VFs
[08:51:24] [PASSED] 7 VFs
[08:51:24] [PASSED] 8 VFs
[08:51:24] [PASSED] 9 VFs
[08:51:24] [PASSED] 10 VFs
[08:51:24] [PASSED] 11 VFs
[08:51:24] [PASSED] 12 VFs
[08:51:24] [PASSED] 13 VFs
[08:51:24] [PASSED] 14 VFs
[08:51:24] [PASSED] 15 VFs
[08:51:24] [PASSED] 16 VFs
[08:51:24] [PASSED] 17 VFs
[08:51:24] [PASSED] 18 VFs
[08:51:24] [PASSED] 19 VFs
[08:51:24] [PASSED] 20 VFs
[08:51:24] [PASSED] 21 VFs
[08:51:24] [PASSED] 22 VFs
[08:51:24] [PASSED] 23 VFs
[08:51:24] [PASSED] 24 VFs
[08:51:24] [PASSED] 25 VFs
[08:51:24] [PASSED] 26 VFs
[08:51:24] [PASSED] 27 VFs
[08:51:24] [PASSED] 28 VFs
[08:51:24] [PASSED] 29 VFs
[08:51:24] [PASSED] 30 VFs
[08:51:24] [PASSED] 31 VFs
[08:51:24] [PASSED] 32 VFs
[08:51:24] [PASSED] 33 VFs
[08:51:24] [PASSED] 34 VFs
[08:51:24] [PASSED] 35 VFs
[08:51:24] [PASSED] 36 VFs
[08:51:24] [PASSED] 37 VFs
[08:51:24] [PASSED] 38 VFs
[08:51:24] [PASSED] 39 VFs
[08:51:24] [PASSED] 40 VFs
[08:51:24] [PASSED] 41 VFs
[08:51:24] [PASSED] 42 VFs
[08:51:24] [PASSED] 43 VFs
[08:51:24] [PASSED] 44 VFs
[08:51:24] [PASSED] 45 VFs
[08:51:24] [PASSED] 46 VFs
[08:51:24] [PASSED] 47 VFs
[08:51:24] [PASSED] 48 VFs
[08:51:24] [PASSED] 49 VFs
[08:51:24] [PASSED] 50 VFs
[08:51:24] [PASSED] 51 VFs
[08:51:24] [PASSED] 52 VFs
[08:51:24] [PASSED] 53 VFs
[08:51:24] [PASSED] 54 VFs
[08:51:24] [PASSED] 55 VFs
[08:51:24] [PASSED] 56 VFs
[08:51:24] [PASSED] 57 VFs
[08:51:24] [PASSED] 58 VFs
[08:51:24] [PASSED] 59 VFs
[08:51:24] [PASSED] 60 VFs
[08:51:24] [PASSED] 61 VFs
[08:51:24] [PASSED] 62 VFs
[08:51:24] [PASSED] 63 VFs
[08:51:24] ================== [PASSED] fair_contexts ==================
[08:51:24] ===================== fair_doorbells  ======================
[08:51:24] [PASSED] 1 VF
[08:51:24] [PASSED] 2 VFs
[08:51:24] [PASSED] 3 VFs
[08:51:24] [PASSED] 4 VFs
[08:51:24] [PASSED] 5 VFs
[08:51:24] [PASSED] 6 VFs
[08:51:24] [PASSED] 7 VFs
[08:51:24] [PASSED] 8 VFs
[08:51:24] [PASSED] 9 VFs
[08:51:24] [PASSED] 10 VFs
[08:51:24] [PASSED] 11 VFs
[08:51:24] [PASSED] 12 VFs
[08:51:24] [PASSED] 13 VFs
[08:51:24] [PASSED] 14 VFs
[08:51:24] [PASSED] 15 VFs
[08:51:24] [PASSED] 16 VFs
[08:51:24] [PASSED] 17 VFs
[08:51:24] [PASSED] 18 VFs
[08:51:24] [PASSED] 19 VFs
[08:51:24] [PASSED] 20 VFs
[08:51:24] [PASSED] 21 VFs
[08:51:24] [PASSED] 22 VFs
[08:51:24] [PASSED] 23 VFs
[08:51:24] [PASSED] 24 VFs
[08:51:24] [PASSED] 25 VFs
[08:51:24] [PASSED] 26 VFs
[08:51:24] [PASSED] 27 VFs
[08:51:24] [PASSED] 28 VFs
[08:51:24] [PASSED] 29 VFs
[08:51:24] [PASSED] 30 VFs
[08:51:24] [PASSED] 31 VFs
[08:51:24] [PASSED] 32 VFs
[08:51:24] [PASSED] 33 VFs
[08:51:24] [PASSED] 34 VFs
[08:51:24] [PASSED] 35 VFs
[08:51:24] [PASSED] 36 VFs
[08:51:24] [PASSED] 37 VFs
[08:51:24] [PASSED] 38 VFs
[08:51:24] [PASSED] 39 VFs
[08:51:24] [PASSED] 40 VFs
[08:51:24] [PASSED] 41 VFs
[08:51:24] [PASSED] 42 VFs
[08:51:24] [PASSED] 43 VFs
[08:51:24] [PASSED] 44 VFs
[08:51:24] [PASSED] 45 VFs
[08:51:24] [PASSED] 46 VFs
[08:51:24] [PASSED] 47 VFs
[08:51:24] [PASSED] 48 VFs
[08:51:24] [PASSED] 49 VFs
[08:51:24] [PASSED] 50 VFs
[08:51:24] [PASSED] 51 VFs
[08:51:24] [PASSED] 52 VFs
[08:51:24] [PASSED] 53 VFs
[08:51:24] [PASSED] 54 VFs
[08:51:24] [PASSED] 55 VFs
[08:51:24] [PASSED] 56 VFs
[08:51:24] [PASSED] 57 VFs
[08:51:24] [PASSED] 58 VFs
[08:51:24] [PASSED] 59 VFs
[08:51:24] [PASSED] 60 VFs
[08:51:24] [PASSED] 61 VFs
[08:51:24] [PASSED] 62 VFs
[08:51:24] [PASSED] 63 VFs
[08:51:24] ================= [PASSED] fair_doorbells ==================
[08:51:24] ======================== fair_ggtt  ========================
[08:51:24] [PASSED] 1 VF
[08:51:24] [PASSED] 2 VFs
[08:51:24] [PASSED] 3 VFs
[08:51:24] [PASSED] 4 VFs
[08:51:24] [PASSED] 5 VFs
[08:51:24] [PASSED] 6 VFs
[08:51:24] [PASSED] 7 VFs
[08:51:24] [PASSED] 8 VFs
[08:51:24] [PASSED] 9 VFs
[08:51:24] [PASSED] 10 VFs
[08:51:24] [PASSED] 11 VFs
[08:51:24] [PASSED] 12 VFs
[08:51:24] [PASSED] 13 VFs
[08:51:24] [PASSED] 14 VFs
[08:51:24] [PASSED] 15 VFs
[08:51:24] [PASSED] 16 VFs
[08:51:24] [PASSED] 17 VFs
[08:51:24] [PASSED] 18 VFs
[08:51:24] [PASSED] 19 VFs
[08:51:24] [PASSED] 20 VFs
[08:51:24] [PASSED] 21 VFs
[08:51:24] [PASSED] 22 VFs
[08:51:24] [PASSED] 23 VFs
[08:51:24] [PASSED] 24 VFs
[08:51:24] [PASSED] 25 VFs
[08:51:24] [PASSED] 26 VFs
[08:51:24] [PASSED] 27 VFs
[08:51:24] [PASSED] 28 VFs
[08:51:24] [PASSED] 29 VFs
[08:51:24] [PASSED] 30 VFs
[08:51:24] [PASSED] 31 VFs
[08:51:24] [PASSED] 32 VFs
[08:51:24] [PASSED] 33 VFs
[08:51:24] [PASSED] 34 VFs
[08:51:24] [PASSED] 35 VFs
[08:51:24] [PASSED] 36 VFs
[08:51:24] [PASSED] 37 VFs
[08:51:24] [PASSED] 38 VFs
[08:51:24] [PASSED] 39 VFs
[08:51:24] [PASSED] 40 VFs
[08:51:24] [PASSED] 41 VFs
[08:51:24] [PASSED] 42 VFs
[08:51:24] [PASSED] 43 VFs
[08:51:24] [PASSED] 44 VFs
[08:51:24] [PASSED] 45 VFs
[08:51:24] [PASSED] 46 VFs
[08:51:24] [PASSED] 47 VFs
[08:51:24] [PASSED] 48 VFs
[08:51:24] [PASSED] 49 VFs
[08:51:24] [PASSED] 50 VFs
[08:51:24] [PASSED] 51 VFs
[08:51:24] [PASSED] 52 VFs
[08:51:24] [PASSED] 53 VFs
[08:51:24] [PASSED] 54 VFs
[08:51:24] [PASSED] 55 VFs
[08:51:24] [PASSED] 56 VFs
[08:51:24] [PASSED] 57 VFs
[08:51:24] [PASSED] 58 VFs
[08:51:24] [PASSED] 59 VFs
[08:51:24] [PASSED] 60 VFs
[08:51:24] [PASSED] 61 VFs
[08:51:24] [PASSED] 62 VFs
[08:51:24] [PASSED] 63 VFs
[08:51:24] ==================== [PASSED] fair_ggtt ====================
[08:51:24] ======================== fair_vram  ========================
[08:51:24] [PASSED] 1 VF
[08:51:24] [PASSED] 2 VFs
[08:51:24] [PASSED] 3 VFs
[08:51:24] [PASSED] 4 VFs
[08:51:24] [PASSED] 5 VFs
[08:51:24] [PASSED] 6 VFs
[08:51:24] [PASSED] 7 VFs
[08:51:24] [PASSED] 8 VFs
[08:51:24] [PASSED] 9 VFs
[08:51:24] [PASSED] 10 VFs
[08:51:24] [PASSED] 11 VFs
[08:51:24] [PASSED] 12 VFs
[08:51:24] [PASSED] 13 VFs
[08:51:24] [PASSED] 14 VFs
[08:51:24] [PASSED] 15 VFs
[08:51:24] [PASSED] 16 VFs
[08:51:24] [PASSED] 17 VFs
[08:51:24] [PASSED] 18 VFs
[08:51:24] [PASSED] 19 VFs
[08:51:24] [PASSED] 20 VFs
[08:51:24] [PASSED] 21 VFs
[08:51:24] [PASSED] 22 VFs
[08:51:24] [PASSED] 23 VFs
[08:51:24] [PASSED] 24 VFs
[08:51:24] [PASSED] 25 VFs
[08:51:24] [PASSED] 26 VFs
[08:51:24] [PASSED] 27 VFs
[08:51:24] [PASSED] 28 VFs
[08:51:24] [PASSED] 29 VFs
[08:51:24] [PASSED] 30 VFs
[08:51:24] [PASSED] 31 VFs
[08:51:24] [PASSED] 32 VFs
[08:51:24] [PASSED] 33 VFs
[08:51:24] [PASSED] 34 VFs
[08:51:24] [PASSED] 35 VFs
[08:51:24] [PASSED] 36 VFs
[08:51:24] [PASSED] 37 VFs
[08:51:24] [PASSED] 38 VFs
[08:51:24] [PASSED] 39 VFs
[08:51:24] [PASSED] 40 VFs
[08:51:24] [PASSED] 41 VFs
[08:51:24] [PASSED] 42 VFs
[08:51:24] [PASSED] 43 VFs
[08:51:24] [PASSED] 44 VFs
[08:51:24] [PASSED] 45 VFs
[08:51:24] [PASSED] 46 VFs
[08:51:24] [PASSED] 47 VFs
[08:51:24] [PASSED] 48 VFs
[08:51:24] [PASSED] 49 VFs
[08:51:24] [PASSED] 50 VFs
[08:51:24] [PASSED] 51 VFs
[08:51:24] [PASSED] 52 VFs
[08:51:24] [PASSED] 53 VFs
[08:51:24] [PASSED] 54 VFs
[08:51:24] [PASSED] 55 VFs
[08:51:24] [PASSED] 56 VFs
[08:51:24] [PASSED] 57 VFs
[08:51:24] [PASSED] 58 VFs
[08:51:24] [PASSED] 59 VFs
[08:51:24] [PASSED] 60 VFs
[08:51:24] [PASSED] 61 VFs
[08:51:24] [PASSED] 62 VFs
[08:51:24] [PASSED] 63 VFs
[08:51:24] ==================== [PASSED] fair_vram ====================
[08:51:24] ================== [PASSED] pf_gt_config ===================
[08:51:24] ===================== lmtt (1 subtest) =====================
[08:51:24] ======================== test_ops  =========================
[08:51:24] [PASSED] 2-level
[08:51:24] [PASSED] multi-level
[08:51:24] ==================== [PASSED] test_ops =====================
[08:51:24] ====================== [PASSED] lmtt =======================
[08:51:24] ================= sriov_packet (1 subtest) =================
[08:51:24] [PASSED] test_descriptor_init
[08:51:24] ================== [PASSED] sriov_packet ===================
[08:51:24] ================= pf_service (11 subtests) =================
[08:51:24] [PASSED] pf_negotiate_any
[08:51:24] [PASSED] pf_negotiate_base_match
[08:51:24] [PASSED] pf_negotiate_base_newer
[08:51:24] [PASSED] pf_negotiate_base_next
[08:51:24] [SKIPPED] pf_negotiate_base_older (no older minor)
[08:51:24] [PASSED] pf_negotiate_base_prev
[08:51:24] [PASSED] pf_negotiate_latest_match
[08:51:24] [PASSED] pf_negotiate_latest_newer
[08:51:24] [PASSED] pf_negotiate_latest_next
[08:51:24] [SKIPPED] pf_negotiate_latest_older (no older minor)
[08:51:24] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[08:51:24] =================== [PASSED] pf_service ====================
[08:51:24] ================= xe_guc_g2g (2 subtests) ==================
[08:51:24] ============== xe_live_guc_g2g_kunit_default  ==============
[08:51:24] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[08:51:24] ============== xe_live_guc_g2g_kunit_allmem  ===============
[08:51:24] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[08:51:24] =================== [SKIPPED] xe_guc_g2g ===================
[08:51:24] =================== xe_mocs (2 subtests) ===================
[08:51:24] ================ xe_live_mocs_kernel_kunit  ================
[08:51:24] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[08:51:24] ================ xe_live_mocs_reset_kunit  =================
[08:51:24] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[08:51:24] ==================== [SKIPPED] xe_mocs =====================
[08:51:24] ================= xe_migrate (3 subtests) ==================
[08:51:24] ================= xe_migrate_sanity_kunit  =================
[08:51:24] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[08:51:24] ================== xe_validate_ccs_kunit  ==================
[08:51:24] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[08:51:24] ============= xe_migrate_access_memory_kunit  ==============
[08:51:24] ========= [SKIPPED] xe_migrate_access_memory_kunit =========
[08:51:24] =================== [SKIPPED] xe_migrate ===================
[08:51:24] ================== xe_dma_buf (1 subtest) ==================
[08:51:24] ==================== xe_dma_buf_kunit  =====================
[08:51:24] ================ [SKIPPED] xe_dma_buf_kunit ================
[08:51:24] =================== [SKIPPED] xe_dma_buf ===================
[08:51:24] ================= xe_bo_shrink (1 subtest) =================
[08:51:24] =================== xe_bo_shrink_kunit  ====================
[08:51:24] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[08:51:24] ================== [SKIPPED] xe_bo_shrink ==================
[08:51:24] ==================== xe_bo (2 subtests) ====================
[08:51:24] ================== xe_ccs_migrate_kunit  ===================
[08:51:24] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[08:51:24] ==================== xe_bo_evict_kunit  ====================
[08:51:24] =============== [SKIPPED] xe_bo_evict_kunit ================
[08:51:24] ===================== [SKIPPED] xe_bo ======================
[08:51:24] =================== xe_any (9 subtests) ====================
[08:51:24] [PASSED] test_to_xe
[08:51:24] [PASSED] test_to_dev
[08:51:24] [PASSED] test_to_pdev
[08:51:24] [PASSED] test_to_drm
[08:51:24] [PASSED] test_if_pdev
[08:51:24] [PASSED] test_if_xe
[08:51:24] [PASSED] test_if_tile
[08:51:24] [PASSED] test_if_gt
[08:51:24] [PASSED] test_to_id
[08:51:24] ===================== [PASSED] xe_any ======================
[08:51:24] ==================== args (13 subtests) ====================
[08:51:24] [PASSED] count_args_test
[08:51:24] [PASSED] call_args_example
[08:51:24] [PASSED] call_args_test
[08:51:24] [PASSED] drop_first_arg_example
[08:51:24] [PASSED] drop_first_arg_test
[08:51:24] [PASSED] first_arg_example
[08:51:24] [PASSED] first_arg_test
[08:51:24] [PASSED] last_arg_example
[08:51:24] [PASSED] last_arg_test
[08:51:24] [PASSED] pick_arg_example
[08:51:24] [PASSED] if_args_example
[08:51:24] [PASSED] if_args_test
[08:51:24] [PASSED] sep_comma_example
[08:51:24] ====================== [PASSED] args =======================
[08:51:24] =================== xe_pci (3 subtests) ====================
[08:51:24] ==================== check_graphics_ip  ====================
[08:51:24] [PASSED] 12.00 Xe_LP
[08:51:24] [PASSED] 12.10 Xe_LP+
[08:51:24] [PASSED] 12.55 Xe_HPG
[08:51:24] [PASSED] 12.60 Xe_HPC
[08:51:24] [PASSED] 12.70 Xe_LPG
[08:51:24] [PASSED] 12.71 Xe_LPG
[08:51:24] [PASSED] 12.74 Xe_LPG+
[08:51:24] [PASSED] 20.01 Xe2_HPG
[08:51:24] [PASSED] 20.02 Xe2_HPG
[08:51:24] [PASSED] 20.04 Xe2_LPG
[08:51:24] [PASSED] 30.00 Xe3_LPG
[08:51:24] [PASSED] 30.01 Xe3_LPG
[08:51:24] [PASSED] 30.03 Xe3_LPG
[08:51:24] [PASSED] 30.04 Xe3_LPG
[08:51:24] [PASSED] 30.05 Xe3_LPG
[08:51:24] [PASSED] 35.10 Xe3p_LPG
[08:51:24] [PASSED] 35.11 Xe3p_XPC
[08:51:24] ================ [PASSED] check_graphics_ip ================
[08:51:24] ===================== check_media_ip  ======================
[08:51:24] [PASSED] 12.00 Xe_M
[08:51:24] [PASSED] 12.55 Xe_HPM
[08:51:24] [PASSED] 13.00 Xe_LPM+
[08:51:24] [PASSED] 13.01 Xe2_HPM
[08:51:24] [PASSED] 20.00 Xe2_LPM
[08:51:24] [PASSED] 30.00 Xe3_LPM
[08:51:24] [PASSED] 30.02 Xe3_LPM
[08:51:24] [PASSED] 35.00 Xe3p_LPM
[08:51:24] [PASSED] 35.03 Xe3p_HPM
[08:51:24] ================= [PASSED] check_media_ip ==================
[08:51:24] =================== check_platform_desc  ===================
[08:51:24] [PASSED] 0x9A60 (TIGERLAKE)
[08:51:24] [PASSED] 0x9A68 (TIGERLAKE)
[08:51:24] [PASSED] 0x9A70 (TIGERLAKE)
[08:51:24] [PASSED] 0x9A40 (TIGERLAKE)
[08:51:24] [PASSED] 0x9A49 (TIGERLAKE)
[08:51:24] [PASSED] 0x9A59 (TIGERLAKE)
[08:51:24] [PASSED] 0x9A78 (TIGERLAKE)
[08:51:24] [PASSED] 0x9AC0 (TIGERLAKE)
[08:51:24] [PASSED] 0x9AC9 (TIGERLAKE)
[08:51:24] [PASSED] 0x9AD9 (TIGERLAKE)
[08:51:24] [PASSED] 0x9AF8 (TIGERLAKE)
[08:51:24] [PASSED] 0x4C80 (ROCKETLAKE)
[08:51:24] [PASSED] 0x4C8A (ROCKETLAKE)
[08:51:24] [PASSED] 0x4C8B (ROCKETLAKE)
[08:51:24] [PASSED] 0x4C8C (ROCKETLAKE)
[08:51:24] [PASSED] 0x4C90 (ROCKETLAKE)
[08:51:24] [PASSED] 0x4C9A (ROCKETLAKE)
[08:51:24] [PASSED] 0x4680 (ALDERLAKE_S)
[08:51:24] [PASSED] 0x4682 (ALDERLAKE_S)
[08:51:24] [PASSED] 0x4688 (ALDERLAKE_S)
[08:51:24] [PASSED] 0x468A (ALDERLAKE_S)
[08:51:24] [PASSED] 0x468B (ALDERLAKE_S)
[08:51:24] [PASSED] 0x4690 (ALDERLAKE_S)
[08:51:24] [PASSED] 0x4692 (ALDERLAKE_S)
[08:51:24] [PASSED] 0x4693 (ALDERLAKE_S)
[08:51:24] [PASSED] 0x46A0 (ALDERLAKE_P)
[08:51:24] [PASSED] 0x46A1 (ALDERLAKE_P)
[08:51:24] [PASSED] 0x46A2 (ALDERLAKE_P)
[08:51:24] [PASSED] 0x46A3 (ALDERLAKE_P)
[08:51:24] [PASSED] 0x46A6 (ALDERLAKE_P)
[08:51:24] [PASSED] 0x46A8 (ALDERLAKE_P)
[08:51:24] [PASSED] 0x46AA (ALDERLAKE_P)
[08:51:24] [PASSED] 0x462A (ALDERLAKE_P)
[08:51:24] [PASSED] 0x4626 (ALDERLAKE_P)
[08:51:24] [PASSED] 0x4628 (ALDERLAKE_P)
[08:51:24] [PASSED] 0x46B0 (ALDERLAKE_P)
[08:51:24] [PASSED] 0x46B1 (ALDERLAKE_P)
[08:51:24] [PASSED] 0x46B2 (ALDERLAKE_P)
[08:51:24] [PASSED] 0x46B3 (ALDERLAKE_P)
[08:51:24] [PASSED] 0x46C0 (ALDERLAKE_P)
[08:51:24] [PASSED] 0x46C1 (ALDERLAKE_P)
[08:51:24] [PASSED] 0x46C2 (ALDERLAKE_P)
[08:51:24] [PASSED] 0x46C3 (ALDERLAKE_P)
[08:51:24] [PASSED] 0x46D0 (ALDERLAKE_N)
[08:51:24] [PASSED] 0x46D1 (ALDERLAKE_N)
[08:51:24] [PASSED] 0x46D2 (ALDERLAKE_N)
[08:51:24] [PASSED] 0x46D3 (ALDERLAKE_N)
[08:51:24] [PASSED] 0x46D4 (ALDERLAKE_N)
[08:51:24] [PASSED] 0xA721 (ALDERLAKE_P)
[08:51:24] [PASSED] 0xA7A1 (ALDERLAKE_P)
[08:51:24] [PASSED] 0xA7A9 (ALDERLAKE_P)
[08:51:24] [PASSED] 0xA7AC (ALDERLAKE_P)
[08:51:24] [PASSED] 0xA7AD (ALDERLAKE_P)
[08:51:24] [PASSED] 0xA720 (ALDERLAKE_P)
[08:51:24] [PASSED] 0xA7A0 (ALDERLAKE_P)
[08:51:24] [PASSED] 0xA7A8 (ALDERLAKE_P)
[08:51:24] [PASSED] 0xA7AA (ALDERLAKE_P)
[08:51:24] [PASSED] 0xA7AB (ALDERLAKE_P)
[08:51:24] [PASSED] 0xA780 (ALDERLAKE_S)
[08:51:24] [PASSED] 0xA781 (ALDERLAKE_S)
[08:51:24] [PASSED] 0xA782 (ALDERLAKE_S)
[08:51:24] [PASSED] 0xA783 (ALDERLAKE_S)
[08:51:24] [PASSED] 0xA788 (ALDERLAKE_S)
[08:51:24] [PASSED] 0xA789 (ALDERLAKE_S)
[08:51:24] [PASSED] 0xA78A (ALDERLAKE_S)
[08:51:24] [PASSED] 0xA78B (ALDERLAKE_S)
[08:51:24] [PASSED] 0x4905 (DG1)
[08:51:24] [PASSED] 0x4906 (DG1)
[08:51:24] [PASSED] 0x4907 (DG1)
[08:51:24] [PASSED] 0x4908 (DG1)
[08:51:24] [PASSED] 0x4909 (DG1)
[08:51:24] [PASSED] 0x56C0 (DG2)
[08:51:24] [PASSED] 0x56C2 (DG2)
[08:51:24] [PASSED] 0x56C1 (DG2)
[08:51:24] [PASSED] 0x7D51 (METEORLAKE)
[08:51:24] [PASSED] 0x7DD1 (METEORLAKE)
[08:51:24] [PASSED] 0x7D41 (METEORLAKE)
[08:51:24] [PASSED] 0x7D67 (METEORLAKE)
[08:51:24] [PASSED] 0xB640 (METEORLAKE)
[08:51:24] [PASSED] 0x56A0 (DG2)
[08:51:24] [PASSED] 0x56A1 (DG2)
[08:51:24] [PASSED] 0x56A2 (DG2)
[08:51:24] [PASSED] 0x56BE (DG2)
[08:51:24] [PASSED] 0x56BF (DG2)
[08:51:24] [PASSED] 0x5690 (DG2)
[08:51:24] [PASSED] 0x5691 (DG2)
[08:51:24] [PASSED] 0x5692 (DG2)
[08:51:24] [PASSED] 0x56A5 (DG2)
[08:51:24] [PASSED] 0x56A6 (DG2)
[08:51:24] [PASSED] 0x56B0 (DG2)
[08:51:24] [PASSED] 0x56B1 (DG2)
[08:51:24] [PASSED] 0x56BA (DG2)
[08:51:24] [PASSED] 0x56BB (DG2)
[08:51:24] [PASSED] 0x56BC (DG2)
[08:51:24] [PASSED] 0x56BD (DG2)
[08:51:24] [PASSED] 0x5693 (DG2)
[08:51:24] [PASSED] 0x5694 (DG2)
[08:51:24] [PASSED] 0x5695 (DG2)
[08:51:24] [PASSED] 0x56A3 (DG2)
[08:51:24] [PASSED] 0x56A4 (DG2)
[08:51:24] [PASSED] 0x56B2 (DG2)
[08:51:24] [PASSED] 0x56B3 (DG2)
[08:51:24] [PASSED] 0x5696 (DG2)
[08:51:24] [PASSED] 0x5697 (DG2)
[08:51:24] [PASSED] 0xB69 (PVC)
[08:51:24] [PASSED] 0xB6E (PVC)
[08:51:24] [PASSED] 0xBD4 (PVC)
[08:51:24] [PASSED] 0xBD5 (PVC)
[08:51:24] [PASSED] 0xBD6 (PVC)
[08:51:24] [PASSED] 0xBD7 (PVC)
[08:51:24] [PASSED] 0xBD8 (PVC)
[08:51:24] [PASSED] 0xBD9 (PVC)
[08:51:24] [PASSED] 0xBDA (PVC)
[08:51:24] [PASSED] 0xBDB (PVC)
[08:51:24] [PASSED] 0xBE0 (PVC)
[08:51:24] [PASSED] 0xBE1 (PVC)
[08:51:24] [PASSED] 0xBE5 (PVC)
[08:51:24] [PASSED] 0x7D40 (METEORLAKE)
[08:51:24] [PASSED] 0x7D45 (METEORLAKE)
[08:51:24] [PASSED] 0x7D55 (METEORLAKE)
[08:51:24] [PASSED] 0x7D60 (METEORLAKE)
[08:51:24] [PASSED] 0x7DD5 (METEORLAKE)
[08:51:24] [PASSED] 0x6420 (LUNARLAKE)
[08:51:24] [PASSED] 0x64A0 (LUNARLAKE)
[08:51:24] [PASSED] 0x64B0 (LUNARLAKE)
[08:51:24] [PASSED] 0xE202 (BATTLEMAGE)
[08:51:24] [PASSED] 0xE209 (BATTLEMAGE)
[08:51:24] [PASSED] 0xE20B (BATTLEMAGE)
[08:51:24] [PASSED] 0xE20C (BATTLEMAGE)
[08:51:24] [PASSED] 0xE20D (BATTLEMAGE)
[08:51:24] [PASSED] 0xE210 (BATTLEMAGE)
[08:51:24] [PASSED] 0xE211 (BATTLEMAGE)
[08:51:24] [PASSED] 0xE212 (BATTLEMAGE)
[08:51:24] [PASSED] 0xE216 (BATTLEMAGE)
[08:51:24] [PASSED] 0xE220 (BATTLEMAGE)
[08:51:24] [PASSED] 0xE221 (BATTLEMAGE)
[08:51:24] [PASSED] 0xE222 (BATTLEMAGE)
[08:51:24] [PASSED] 0xE223 (BATTLEMAGE)
[08:51:24] [PASSED] 0xB080 (PANTHERLAKE)
[08:51:24] [PASSED] 0xB081 (PANTHERLAKE)
[08:51:24] [PASSED] 0xB082 (PANTHERLAKE)
[08:51:24] [PASSED] 0xB083 (PANTHERLAKE)
[08:51:24] [PASSED] 0xB084 (PANTHERLAKE)
[08:51:24] [PASSED] 0xB085 (PANTHERLAKE)
[08:51:24] [PASSED] 0xB086 (PANTHERLAKE)
[08:51:24] [PASSED] 0xB087 (PANTHERLAKE)
[08:51:24] [PASSED] 0xB08F (PANTHERLAKE)
[08:51:24] [PASSED] 0xB090 (PANTHERLAKE)
[08:51:24] [PASSED] 0xB0A0 (PANTHERLAKE)
[08:51:24] [PASSED] 0xB0A1 (PANTHERLAKE)
[08:51:24] [PASSED] 0xB0B0 (PANTHERLAKE)
[08:51:24] [PASSED] 0xFD80 (PANTHERLAKE)
[08:51:24] [PASSED] 0xFD81 (PANTHERLAKE)
[08:51:24] [PASSED] 0xD740 (NOVALAKE_S)
[08:51:24] [PASSED] 0xD741 (NOVALAKE_S)
[08:51:24] [PASSED] 0xD742 (NOVALAKE_S)
[08:51:24] [PASSED] 0xD743 (NOVALAKE_S)
[08:51:24] [PASSED] 0xD745 (NOVALAKE_S)
[08:51:24] [PASSED] 0xD74A (NOVALAKE_S)
[08:51:24] [PASSED] 0xD74B (NOVALAKE_S)
[08:51:24] [PASSED] 0x674C (CRESCENTISLAND)
[08:51:24] [PASSED] 0x674D (CRESCENTISLAND)
[08:51:24] [PASSED] 0x674E (CRESCENTISLAND)
[08:51:24] [PASSED] 0x674F (CRESCENTISLAND)
[08:51:24] [PASSED] 0x6750 (CRESCENTISLAND)
[08:51:24] [PASSED] 0x6751 (CRESCENTISLAND)
[08:51:24] [PASSED] 0x6752 (CRESCENTISLAND)
[08:51:24] [PASSED] 0x6753 (CRESCENTISLAND)
[08:51:24] [PASSED] 0x6754 (CRESCENTISLAND)
[08:51:24] [PASSED] 0x6755 (CRESCENTISLAND)
[08:51:24] [PASSED] 0x6756 (CRESCENTISLAND)
[08:51:24] [PASSED] 0xD750 (NOVALAKE_P)
[08:51:24] [PASSED] 0xD751 (NOVALAKE_P)
[08:51:24] [PASSED] 0xD752 (NOVALAKE_P)
[08:51:24] [PASSED] 0xD753 (NOVALAKE_P)
[08:51:24] [PASSED] 0xD754 (NOVALAKE_P)
[08:51:24] [PASSED] 0xD755 (NOVALAKE_P)
[08:51:24] [PASSED] 0xD756 (NOVALAKE_P)
[08:51:24] [PASSED] 0xD757 (NOVALAKE_P)
[08:51:24] [PASSED] 0xD75F (NOVALAKE_P)
[08:51:24] =============== [PASSED] check_platform_desc ===============
[08:51:24] ===================== [PASSED] xe_pci ======================
[08:51:24] ============= xe_rtp_tables_test (5 subtests) ==============
[08:51:24] ================== xe_rtp_table_gt_test  ===================
[08:51:24] [PASSED] gt_was/14011060649
[08:51:24] [PASSED] gt_was/14011059788
[08:51:24] [PASSED] gt_was/14015795083
[08:51:24] [PASSED] gt_was/16021867713
[08:51:24] [PASSED] gt_was/14019449301
[08:51:24] [PASSED] gt_was/16028005424
[08:51:24] [PASSED] gt_was/14026578760
[08:51:24] [PASSED] gt_was/1409420604
[08:51:24] [PASSED] gt_was/1408615072
[08:51:24] [PASSED] gt_was/22010523718
[08:51:24] [PASSED] gt_was/14011006942
[08:51:24] [PASSED] gt_was/14014830051
[08:51:24] [PASSED] gt_was/18018781329
[08:51:24] [PASSED] gt_was/1509235366
[08:51:24] [PASSED] gt_was/18018781329
[08:51:24] [PASSED] gt_was/16016694945
[08:51:24] [PASSED] gt_was/14018575942
[08:51:24] [PASSED] gt_was/22016670082
[08:51:24] [PASSED] gt_was/22016670082
[08:51:24] [PASSED] gt_was/14017421178
[08:51:24] [PASSED] gt_was/16025250150
[08:51:24] [PASSED] gt_was/14021871409
[08:51:24] [PASSED] gt_was/16021865536
[08:51:24] [PASSED] gt_was/14021486841
[08:51:24] [PASSED] gt_was/14025160223
[08:51:24] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[08:51:24] [PASSED] gt_was/14025635424
[08:51:24] [PASSED] gt_was/16028005424
[08:51:24] ============== [PASSED] xe_rtp_table_gt_test ===============
[08:51:24] ================== xe_rtp_table_gt_test  ===================
[08:51:24] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[08:51:24] [PASSED] gt_tunings/Tuning: 32B Access Enable
[08:51:24] [PASSED] gt_tunings/Tuning: L3 cache
[08:51:24] [PASSED] gt_tunings/Tuning: L3 cache - media
[08:51:24] [PASSED] gt_tunings/Tuning: Compression Overfetch
[08:51:24] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[08:51:24] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[08:51:24] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[08:51:24] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[08:51:24] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[08:51:24] [PASSED] gt_tunings/Tuning: Stateless compression control
[08:51:24] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[08:51:24] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[08:51:24] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[08:51:24] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[08:51:24] [PASSED] gt_tunings/Tuning: Force All Non-Compressible Memory Reads to be 256B Overfetches
[08:51:24] ============== [PASSED] xe_rtp_table_gt_test ===============
[08:51:24] ================== xe_rtp_table_oob_test  ==================
[08:51:24] [PASSED] oob_was/1607983814
[08:51:24] [PASSED] oob_was/16010904313
[08:51:24] [PASSED] oob_was/18022495364
[08:51:24] [PASSED] oob_was/22012773006
[08:51:24] [PASSED] oob_was/14014475959
[08:51:24] [PASSED] oob_was/22011391025
[08:51:24] [PASSED] oob_was/22012727170
[08:51:24] [PASSED] oob_was/22012727685
[08:51:24] [PASSED] oob_was/22016596838
[08:51:24] [PASSED] oob_was/18020744125
[08:51:24] [PASSED] oob_was/1409600907
[08:51:24] [PASSED] oob_was/22014953428
[08:51:24] [PASSED] oob_was/16017236439
[08:51:24] [PASSED] oob_was/14019821291
[08:51:24] [PASSED] oob_was/14015076503
[08:51:24] [PASSED] oob_was/22016122933
[08:51:24] [PASSED] oob_was/14018913170
[08:51:24] [PASSED] oob_was/14018094691
[08:51:24] [PASSED] oob_was/18024947630
[08:51:24] [PASSED] oob_was/16022287689
[08:51:24] [PASSED] oob_was/13011645652
[08:51:24] [PASSED] oob_was/14022293748
[08:51:24] [PASSED] oob_was/22019794406
[08:51:24] [PASSED] oob_was/22019338487
[08:51:24] [PASSED] oob_was/16023588340
[08:51:24] [PASSED] oob_was/14019789679
[08:51:24] [PASSED] oob_was/14022866841
[08:51:24] [PASSED] oob_was/16021333562
[08:51:24] [PASSED] oob_was/14016712196
[08:51:24] [PASSED] oob_was/14015568240
[08:51:24] [PASSED] oob_was/18013179988
[08:51:24] [PASSED] oob_was/1508761755
[08:51:24] [PASSED] oob_was/16023105232
[08:51:24] [PASSED] oob_was/16026508708
[08:51:24] [PASSED] oob_was/14020001231
[08:51:24] [PASSED] oob_was/16023683509
[08:51:24] [PASSED] oob_was/14025515070
[08:51:24] [PASSED] oob_was/15015404425_disable
[08:51:24] [PASSED] oob_was/16026007364
[08:51:24] [PASSED] oob_was/14020316580
[08:51:24] [PASSED] oob_was/14025883347
[08:51:24] [PASSED] oob_was/16029380221
[08:51:24] [PASSED] oob_was/22022079272
[08:51:24] [PASSED] oob_was/16029897822
[08:51:24] [PASSED] oob_was/14026539277
[08:51:24] [PASSED] oob_was/14027054324
[08:51:24] [PASSED] oob_was/14025941587
[08:51:24] [PASSED] oob_was/16030224309
[08:51:24] [PASSED] oob_was/14028709524
[08:51:24] [PASSED] oob_was/14028250015
[08:51:24] [PASSED] oob_was/16031259911
[08:51:24] ============== [PASSED] xe_rtp_table_oob_test ==============
[08:51:24] ================ xe_rtp_table_dev_oob_test  ================
[08:51:24] [PASSED] device_oob_was/22010954014
[08:51:24] [PASSED] device_oob_was/15015404425
[08:51:24] [PASSED] device_oob_was/22019338487_display
[08:51:24] [PASSED] device_oob_was/14022085890
[08:51:24] [PASSED] device_oob_was/14026633728
[08:51:24] [PASSED] device_oob_was/14026746987
[08:51:24] [PASSED] device_oob_was/14026779378
[08:51:24] [PASSED] device_oob_was/14028586678
[08:51:24] [PASSED] device_oob_was/14028434957
[08:51:24] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[08:51:24] ========== xe_rtp_table_missing_upper_bound_test  ==========
[08:51:24] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[08:51:24] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[08:51:24] [PASSED] register_whitelist/1806527549
[08:51:24] [PASSED] register_whitelist/allow_read_ctx_timestamp
[08:51:24] [PASSED] register_whitelist/allow_read_queue_timestamp
[08:51:24] [PASSED] register_whitelist/16014440446
[08:51:24] [PASSED] register_whitelist/16017236439
[08:51:24] [PASSED] register_whitelist/16020183090
[08:51:24] [PASSED] register_whitelist/14024997852
[08:51:24] [PASSED] register_whitelist/14024997852
[08:51:24] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[08:51:24] =============== [PASSED] xe_rtp_tables_test ================
[08:51:24] =================== xe_rtp (3 subtests) ====================
[08:51:24] =================== xe_rtp_rules_tests  ====================
[08:51:24] [PASSED] no
[08:51:24] [PASSED] yes
[08:51:24] [PASSED] no-and-no
[08:51:24] [PASSED] no-and-yes
[08:51:24] [PASSED] yes-and-no
[08:51:24] [PASSED] yes-and-yes
[08:51:24] [PASSED] no-or-no
[08:51:24] [PASSED] no-or-yes
[08:51:24] [PASSED] yes-or-no
[08:51:24] [PASSED] yes-or-yes
[08:51:24] [PASSED] no-yes-or-yes-no
[08:51:24] [PASSED] no-yes-or-yes-yes
[08:51:24] [PASSED] yes-yes-or-no-yes
[08:51:24] [PASSED] yes-yes-or-yes-yes
[08:51:24] [PASSED] no-no-or-yes-or-no
[08:51:24] [PASSED] or
[08:51:24] [PASSED] or-yes
[08:51:24] [PASSED] or-no
[08:51:24] [PASSED] yes-or
[08:51:24] [PASSED] no-or
[08:51:24] [PASSED] no-or-or-yes
[08:51:24] [PASSED] yes-or-or-no
[08:51:24] [PASSED] no-or-or-no
[08:51:24] [PASSED] missing-context-engine-class
[08:51:24] [PASSED] missing-context-engine-class-or-yes
[08:51:24] [PASSED] missing-context-engine-class-or-or-yes
[08:51:24] =============== [PASSED] xe_rtp_rules_tests ================
[08:51:24] =============== xe_rtp_process_to_sr_tests  ================
[08:51:24] [PASSED] coalesce-same-reg
[08:51:24] [PASSED] coalesce-same-reg-literal-and-func
[08:51:24] [PASSED] no-match-no-add
[08:51:24] [PASSED] two-regs-two-entries
[08:51:24] [PASSED] clr-one-set-other
[08:51:24] [PASSED] set-field
[08:51:24] [PASSED] conflict-duplicate
[08:51:24] [PASSED] conflict-not-disjoint
[08:51:24] [PASSED] conflict-not-disjoint-literal-and-func
[08:51:24] [PASSED] conflict-reg-type
[08:51:24] [PASSED] bad-mcr-reg-forced-to-regular
[08:51:24] [PASSED] bad-regular-reg-forced-to-mcr
[08:51:24] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[08:51:24] ================== xe_rtp_process_tests  ===================
[08:51:24] [PASSED] active1
[08:51:24] [PASSED] active2
[08:51:24] [PASSED] active-inactive
[08:51:24] [PASSED] inactive-active
[08:51:24] [PASSED] inactive-active-inactive
[08:51:24] [PASSED] inactive-inactive-inactive
[08:51:24] ============== [PASSED] xe_rtp_process_tests ===============
[08:51:24] ===================== [PASSED] xe_rtp ======================
[08:51:24] ==================== xe_wa (1 subtest) =====================
[08:51:24] ======================== xe_wa_gt  =========================
[08:51:24] [PASSED] TIGERLAKE B0
[08:51:24] [PASSED] DG1 A0
[08:51:24] [PASSED] DG1 B0
[08:51:24] [PASSED] ALDERLAKE_S A0
[08:51:24] [PASSED] ALDERLAKE_S B0
[08:51:24] [PASSED] ALDERLAKE_S C0
[08:51:24] [PASSED] ALDERLAKE_S D0
[08:51:24] [PASSED] ALDERLAKE_P A0
[08:51:24] [PASSED] ALDERLAKE_P B0
[08:51:24] [PASSED] ALDERLAKE_P C0
[08:51:24] [PASSED] ALDERLAKE_S RPLS D0
[08:51:24] [PASSED] ALDERLAKE_P RPLU E0
[08:51:24] [PASSED] DG2 G10 C0
[08:51:24] [PASSED] DG2 G11 B1
[08:51:24] [PASSED] DG2 G12 A1
[08:51:24] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[08:51:24] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[08:51:24] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[08:51:24] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[08:51:24] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[08:51:24] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[08:51:24] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[08:51:24] ==================== [PASSED] xe_wa_gt =====================
[08:51:24] ====================== [PASSED] xe_wa ======================
[08:51:24] ============================================================
[08:51:24] Testing complete. Ran 860 tests: passed: 831, skipped: 29
[08:51:24] Elapsed time: 42.219s total, 2.563s configuring, 38.890s building, 0.744s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[08:51:24] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:51:27] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[08:51:53] Starting KUnit Kernel (1/1)...
[08:51:53] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[08:51:53] ============ drm_test_pick_cmdline (2 subtests) ============
[08:51:53] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[08:51:53] =============== drm_test_pick_cmdline_named  ===============
[08:51:53] [PASSED] NTSC
[08:51:53] [PASSED] NTSC-J
[08:51:53] [PASSED] PAL
[08:51:53] [PASSED] PAL-M
[08:51:53] =========== [PASSED] drm_test_pick_cmdline_named ===========
[08:51:53] ============== [PASSED] drm_test_pick_cmdline ==============
[08:51:53] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[08:51:53] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[08:51:53] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[08:51:53] =========== drm_validate_clone_mode (2 subtests) ===========
[08:51:53] ============== drm_test_check_in_clone_mode  ===============
[08:51:53] [PASSED] in_clone_mode
[08:51:53] [PASSED] not_in_clone_mode
[08:51:53] ========== [PASSED] drm_test_check_in_clone_mode ===========
[08:51:53] =============== drm_test_check_valid_clones  ===============
[08:51:53] [PASSED] not_in_clone_mode
[08:51:53] [PASSED] valid_clone
[08:51:53] [PASSED] invalid_clone
[08:51:53] =========== [PASSED] drm_test_check_valid_clones ===========
[08:51:53] ============= [PASSED] drm_validate_clone_mode =============
[08:51:53] ============= drm_validate_modeset (1 subtest) =============
[08:51:53] [PASSED] drm_test_check_connector_changed_modeset
[08:51:53] ============== [PASSED] drm_validate_modeset ===============
[08:51:53] ====== drm_test_bridge_get_current_state (1 subtest) =======
[08:51:53] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[08:51:53] ======== [PASSED] drm_test_bridge_get_current_state ========
[08:51:53] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[08:51:53] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[08:51:53] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[08:51:53] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[08:51:53] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[08:51:53] ============== drm_bridge_alloc (2 subtests) ===============
[08:51:53] [PASSED] drm_test_drm_bridge_alloc_basic
[08:51:53] [PASSED] drm_test_drm_bridge_alloc_get_put
[08:51:53] ================ [PASSED] drm_bridge_alloc =================
[08:51:53] ============= drm_bridge_bus_fmt (5 subtests) ==============
[08:51:53] [PASSED] drm_test_bridge_rgb_yuv_rgb
[08:51:53] [PASSED] drm_test_bridge_must_convert_to_yuv444
[08:51:53] [PASSED] drm_test_bridge_hdmi_auto_rgb
[08:51:53] [PASSED] drm_test_bridge_auto_first
[08:51:53] [PASSED] drm_test_bridge_rgb_yuv_no_path
[08:51:53] =============== [PASSED] drm_bridge_bus_fmt ================
[08:51:53] ============= drm_cmdline_parser (40 subtests) =============
[08:51:53] [PASSED] drm_test_cmdline_force_d_only
[08:51:53] [PASSED] drm_test_cmdline_force_D_only_dvi
[08:51:53] [PASSED] drm_test_cmdline_force_D_only_hdmi
[08:51:53] [PASSED] drm_test_cmdline_force_D_only_not_digital
[08:51:53] [PASSED] drm_test_cmdline_force_e_only
[08:51:53] [PASSED] drm_test_cmdline_res
[08:51:53] [PASSED] drm_test_cmdline_res_vesa
[08:51:53] [PASSED] drm_test_cmdline_res_vesa_rblank
[08:51:53] [PASSED] drm_test_cmdline_res_rblank
[08:51:53] [PASSED] drm_test_cmdline_res_bpp
[08:51:53] [PASSED] drm_test_cmdline_res_refresh
[08:51:53] [PASSED] drm_test_cmdline_res_bpp_refresh
[08:51:53] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[08:51:53] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[08:51:53] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[08:51:53] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[08:51:53] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[08:51:53] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[08:51:53] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[08:51:53] [PASSED] drm_test_cmdline_res_margins_force_on
[08:51:53] [PASSED] drm_test_cmdline_res_vesa_margins
[08:51:53] [PASSED] drm_test_cmdline_name
[08:51:53] [PASSED] drm_test_cmdline_name_bpp
[08:51:53] [PASSED] drm_test_cmdline_name_option
[08:51:53] [PASSED] drm_test_cmdline_name_bpp_option
[08:51:53] [PASSED] drm_test_cmdline_rotate_0
[08:51:53] [PASSED] drm_test_cmdline_rotate_90
[08:51:53] [PASSED] drm_test_cmdline_rotate_180
[08:51:53] [PASSED] drm_test_cmdline_rotate_270
[08:51:53] [PASSED] drm_test_cmdline_hmirror
[08:51:53] [PASSED] drm_test_cmdline_vmirror
[08:51:53] [PASSED] drm_test_cmdline_margin_options
[08:51:53] [PASSED] drm_test_cmdline_multiple_options
[08:51:53] [PASSED] drm_test_cmdline_bpp_extra_and_option
[08:51:53] [PASSED] drm_test_cmdline_extra_and_option
[08:51:53] [PASSED] drm_test_cmdline_freestanding_options
[08:51:53] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[08:51:53] [PASSED] drm_test_cmdline_panel_orientation
[08:51:53] ================ drm_test_cmdline_invalid  =================
[08:51:53] [PASSED] margin_only
[08:51:53] [PASSED] interlace_only
[08:51:53] [PASSED] res_missing_x
[08:51:53] [PASSED] res_missing_y
[08:51:53] [PASSED] res_bad_y
[08:51:53] [PASSED] res_missing_y_bpp
[08:51:53] [PASSED] res_bad_bpp
[08:51:53] [PASSED] res_bad_refresh
[08:51:53] [PASSED] res_bpp_refresh_force_on_off
[08:51:53] [PASSED] res_invalid_mode
[08:51:53] [PASSED] res_bpp_wrong_place_mode
[08:51:53] [PASSED] name_bpp_refresh
[08:51:53] [PASSED] name_refresh
[08:51:53] [PASSED] name_refresh_wrong_mode
[08:51:53] [PASSED] name_refresh_invalid_mode
[08:51:53] [PASSED] rotate_multiple
[08:51:53] [PASSED] rotate_invalid_val
[08:51:53] [PASSED] rotate_truncated
[08:51:53] [PASSED] invalid_option
[08:51:53] [PASSED] invalid_tv_option
[08:51:53] [PASSED] truncated_tv_option
[08:51:53] ============ [PASSED] drm_test_cmdline_invalid =============
[08:51:53] =============== drm_test_cmdline_tv_options  ===============
[08:51:53] [PASSED] NTSC
[08:51:53] [PASSED] NTSC_443
[08:51:53] [PASSED] NTSC_J
[08:51:53] [PASSED] PAL
[08:51:53] [PASSED] PAL_M
[08:51:53] [PASSED] PAL_N
[08:51:53] [PASSED] SECAM
[08:51:53] [PASSED] MONO_525
[08:51:53] [PASSED] MONO_625
[08:51:53] =========== [PASSED] drm_test_cmdline_tv_options ===========
[08:51:53] =============== [PASSED] drm_cmdline_parser ================
[08:51:53] ========== drmm_connector_hdmi_init (20 subtests) ==========
[08:51:53] [PASSED] drm_test_connector_hdmi_init_valid
[08:51:53] [PASSED] drm_test_connector_hdmi_init_bpc_8
[08:51:53] [PASSED] drm_test_connector_hdmi_init_bpc_10
[08:51:53] [PASSED] drm_test_connector_hdmi_init_bpc_12
[08:51:53] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[08:51:53] [PASSED] drm_test_connector_hdmi_init_bpc_null
[08:51:53] [PASSED] drm_test_connector_hdmi_init_formats_empty
[08:51:53] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[08:51:53] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[08:51:53] [PASSED] supported_formats=0x9 yuv420_allowed=1
[08:51:53] [PASSED] supported_formats=0x9 yuv420_allowed=0
[08:51:53] [PASSED] supported_formats=0x5 yuv420_allowed=1
[08:51:53] [PASSED] supported_formats=0x5 yuv420_allowed=0
[08:51:53] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[08:51:53] [PASSED] drm_test_connector_hdmi_init_null_ddc
[08:51:53] [PASSED] drm_test_connector_hdmi_init_null_product
[08:51:53] [PASSED] drm_test_connector_hdmi_init_null_vendor
[08:51:53] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[08:51:53] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[08:51:53] [PASSED] drm_test_connector_hdmi_init_product_valid
[08:51:53] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[08:51:53] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[08:51:53] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[08:51:53] ========= drm_test_connector_hdmi_init_type_valid  =========
[08:51:53] [PASSED] HDMI-A
[08:51:53] [PASSED] HDMI-B
[08:51:53] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[08:51:53] ======== drm_test_connector_hdmi_init_type_invalid  ========
[08:51:53] [PASSED] Unknown
[08:51:53] [PASSED] VGA
[08:51:53] [PASSED] DVI-I
[08:51:53] [PASSED] DVI-D
[08:51:53] [PASSED] DVI-A
[08:51:53] [PASSED] Composite
[08:51:53] [PASSED] SVIDEO
[08:51:53] [PASSED] LVDS
[08:51:53] [PASSED] Component
[08:51:53] [PASSED] DIN
[08:51:53] [PASSED] DP
[08:51:53] [PASSED] TV
[08:51:53] [PASSED] eDP
[08:51:53] [PASSED] Virtual
[08:51:53] [PASSED] DSI
[08:51:53] [PASSED] DPI
[08:51:53] [PASSED] Writeback
[08:51:53] [PASSED] SPI
[08:51:53] [PASSED] USB
[08:51:53] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[08:51:53] ============ [PASSED] drmm_connector_hdmi_init =============
[08:51:53] ============= drmm_connector_init (3 subtests) =============
[08:51:53] [PASSED] drm_test_drmm_connector_init
[08:51:53] [PASSED] drm_test_drmm_connector_init_null_ddc
[08:51:53] ========= drm_test_drmm_connector_init_type_valid  =========
[08:51:53] [PASSED] Unknown
[08:51:53] [PASSED] VGA
[08:51:53] [PASSED] DVI-I
[08:51:53] [PASSED] DVI-D
[08:51:53] [PASSED] DVI-A
[08:51:53] [PASSED] Composite
[08:51:53] [PASSED] SVIDEO
[08:51:53] [PASSED] LVDS
[08:51:53] [PASSED] Component
[08:51:53] [PASSED] DIN
[08:51:53] [PASSED] DP
[08:51:53] [PASSED] HDMI-A
[08:51:53] [PASSED] HDMI-B
[08:51:53] [PASSED] TV
[08:51:53] [PASSED] eDP
[08:51:53] [PASSED] Virtual
[08:51:53] [PASSED] DSI
[08:51:53] [PASSED] DPI
[08:51:53] [PASSED] Writeback
[08:51:53] [PASSED] SPI
[08:51:53] [PASSED] USB
[08:51:53] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[08:51:53] =============== [PASSED] drmm_connector_init ===============
[08:51:53] ========= drm_connector_dynamic_init (6 subtests) ==========
[08:51:53] [PASSED] drm_test_drm_connector_dynamic_init
[08:51:53] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[08:51:53] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[08:51:53] [PASSED] drm_test_drm_connector_dynamic_init_properties
[08:51:53] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[08:51:53] [PASSED] Unknown
[08:51:53] [PASSED] VGA
[08:51:53] [PASSED] DVI-I
[08:51:53] [PASSED] DVI-D
[08:51:53] [PASSED] DVI-A
[08:51:53] [PASSED] Composite
[08:51:53] [PASSED] SVIDEO
[08:51:53] [PASSED] LVDS
[08:51:53] [PASSED] Component
[08:51:53] [PASSED] DIN
[08:51:53] [PASSED] DP
[08:51:53] [PASSED] HDMI-A
[08:51:53] [PASSED] HDMI-B
[08:51:53] [PASSED] TV
[08:51:53] [PASSED] eDP
[08:51:53] [PASSED] Virtual
[08:51:53] [PASSED] DSI
[08:51:53] [PASSED] DPI
[08:51:53] [PASSED] Writeback
[08:51:53] [PASSED] SPI
[08:51:53] [PASSED] USB
[08:51:53] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[08:51:53] ======== drm_test_drm_connector_dynamic_init_name  =========
[08:51:53] [PASSED] Unknown
[08:51:53] [PASSED] VGA
[08:51:53] [PASSED] DVI-I
[08:51:53] [PASSED] DVI-D
[08:51:53] [PASSED] DVI-A
[08:51:53] [PASSED] Composite
[08:51:53] [PASSED] SVIDEO
[08:51:53] [PASSED] LVDS
[08:51:53] [PASSED] Component
[08:51:53] [PASSED] DIN
[08:51:53] [PASSED] DP
[08:51:53] [PASSED] HDMI-A
[08:51:53] [PASSED] HDMI-B
[08:51:53] [PASSED] TV
[08:51:53] [PASSED] eDP
[08:51:53] [PASSED] Virtual
[08:51:53] [PASSED] DSI
[08:51:53] [PASSED] DPI
[08:51:53] [PASSED] Writeback
[08:51:53] [PASSED] SPI
[08:51:53] [PASSED] USB
[08:51:53] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[08:51:53] =========== [PASSED] drm_connector_dynamic_init ============
[08:51:53] ==== drm_connector_dynamic_register_early (4 subtests) =====
[08:51:53] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[08:51:53] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[08:51:53] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[08:51:53] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[08:51:53] ====== [PASSED] drm_connector_dynamic_register_early =======
[08:51:53] ======= drm_connector_dynamic_register (7 subtests) ========
[08:51:53] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[08:51:53] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[08:51:53] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[08:51:53] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[08:51:53] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[08:51:53] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[08:51:53] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[08:51:53] ========= [PASSED] drm_connector_dynamic_register ==========
[08:51:53] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[08:51:53] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[08:51:53] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[08:51:53] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[08:51:53] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[08:51:53] ========== drm_test_get_tv_mode_from_name_valid  ===========
[08:51:53] [PASSED] NTSC
[08:51:53] [PASSED] NTSC-443
[08:51:53] [PASSED] NTSC-J
[08:51:53] [PASSED] PAL
[08:51:53] [PASSED] PAL-M
[08:51:53] [PASSED] PAL-N
[08:51:53] [PASSED] SECAM
[08:51:53] [PASSED] Mono
[08:51:53] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[08:51:53] [PASSED] drm_test_get_tv_mode_from_name_truncated
[08:51:53] ============ [PASSED] drm_get_tv_mode_from_name ============
[08:51:53] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[08:51:53] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[08:51:53] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[08:51:53] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[08:51:53] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[08:51:53] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[08:51:53] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[08:51:53] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[08:51:53] [PASSED] VIC 96
[08:51:53] [PASSED] VIC 97
[08:51:53] [PASSED] VIC 101
[08:51:53] [PASSED] VIC 102
[08:51:53] [PASSED] VIC 106
[08:51:53] [PASSED] VIC 107
[08:51:53] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[08:51:53] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[08:51:53] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[08:51:53] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[08:51:53] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[08:51:53] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[08:51:53] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[08:51:53] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[08:51:53] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[08:51:53] [PASSED] Automatic
[08:51:53] [PASSED] Full
[08:51:53] [PASSED] Limited 16:235
[08:51:53] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[08:51:53] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[08:51:53] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[08:51:53] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[08:51:53] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[08:51:53] [PASSED] RGB
[08:51:53] [PASSED] YUV 4:2:0
[08:51:53] [PASSED] YUV 4:2:2
[08:51:53] [PASSED] YUV 4:4:4
[08:51:53] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[08:51:53] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[08:51:53] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[08:51:53] ============= drm_damage_helper (21 subtests) ==============
[08:51:53] [PASSED] drm_test_damage_iter_no_damage
[08:51:53] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[08:51:53] [PASSED] drm_test_damage_iter_no_damage_src_moved
[08:51:53] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[08:51:53] [PASSED] drm_test_damage_iter_no_damage_not_visible
[08:51:53] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[08:51:53] [PASSED] drm_test_damage_iter_no_damage_no_fb
[08:51:53] [PASSED] drm_test_damage_iter_simple_damage
[08:51:53] [PASSED] drm_test_damage_iter_single_damage
[08:51:53] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[08:51:53] [PASSED] drm_test_damage_iter_single_damage_outside_src
[08:51:53] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[08:51:53] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[08:51:53] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[08:51:53] [PASSED] drm_test_damage_iter_single_damage_src_moved
[08:51:53] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[08:51:53] [PASSED] drm_test_damage_iter_damage
[08:51:53] [PASSED] drm_test_damage_iter_damage_one_intersect
[08:51:53] [PASSED] drm_test_damage_iter_damage_one_outside
[08:51:53] [PASSED] drm_test_damage_iter_damage_src_moved
[08:51:53] [PASSED] drm_test_damage_iter_damage_not_visible
[08:51:53] ================ [PASSED] drm_damage_helper ================
[08:51:53] ============== drm_dp_mst_helper (3 subtests) ==============
[08:51:53] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[08:51:53] [PASSED] Clock 154000 BPP 30 DSC disabled
[08:51:53] [PASSED] Clock 234000 BPP 30 DSC disabled
[08:51:53] [PASSED] Clock 297000 BPP 24 DSC disabled
[08:51:53] [PASSED] Clock 332880 BPP 24 DSC enabled
[08:51:53] [PASSED] Clock 324540 BPP 24 DSC enabled
[08:51:53] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[08:51:53] ============== drm_test_dp_mst_calc_pbn_div  ===============
[08:51:53] [PASSED] Link rate 2000000 lane count 4
[08:51:53] [PASSED] Link rate 2000000 lane count 2
[08:51:53] [PASSED] Link rate 2000000 lane count 1
[08:51:53] [PASSED] Link rate 1350000 lane count 4
[08:51:53] [PASSED] Link rate 1350000 lane count 2
[08:51:53] [PASSED] Link rate 1350000 lane count 1
[08:51:53] [PASSED] Link rate 1000000 lane count 4
[08:51:53] [PASSED] Link rate 1000000 lane count 2
[08:51:53] [PASSED] Link rate 1000000 lane count 1
[08:51:53] [PASSED] Link rate 810000 lane count 4
[08:51:53] [PASSED] Link rate 810000 lane count 2
[08:51:53] [PASSED] Link rate 810000 lane count 1
[08:51:53] [PASSED] Link rate 540000 lane count 4
[08:51:53] [PASSED] Link rate 540000 lane count 2
[08:51:53] [PASSED] Link rate 540000 lane count 1
[08:51:53] [PASSED] Link rate 270000 lane count 4
[08:51:53] [PASSED] Link rate 270000 lane count 2
[08:51:53] [PASSED] Link rate 270000 lane count 1
[08:51:53] [PASSED] Link rate 162000 lane count 4
[08:51:53] [PASSED] Link rate 162000 lane count 2
[08:51:53] [PASSED] Link rate 162000 lane count 1
[08:51:53] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[08:51:53] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[08:51:53] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[08:51:53] [PASSED] DP_POWER_UP_PHY with port number
[08:51:53] [PASSED] DP_POWER_DOWN_PHY with port number
[08:51:53] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[08:51:53] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[08:51:53] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[08:51:53] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[08:51:53] [PASSED] DP_QUERY_PAYLOAD with port number
[08:51:53] [PASSED] DP_QUERY_PAYLOAD with VCPI
[08:51:53] [PASSED] DP_REMOTE_DPCD_READ with port number
[08:51:53] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[08:51:53] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[08:51:53] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[08:51:53] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[08:51:53] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[08:51:53] [PASSED] DP_REMOTE_I2C_READ with port number
[08:51:53] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[08:51:53] [PASSED] DP_REMOTE_I2C_READ with transactions array
[08:51:53] [PASSED] DP_REMOTE_I2C_WRITE with port number
[08:51:53] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[08:51:53] [PASSED] DP_REMOTE_I2C_WRITE with data array
[08:51:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[08:51:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[08:51:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[08:51:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[08:51:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[08:51:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[08:51:53] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[08:51:53] ================ [PASSED] drm_dp_mst_helper ================
[08:51:53] ================== drm_exec (7 subtests) ===================
[08:51:53] [PASSED] sanitycheck
[08:51:53] [PASSED] test_lock
[08:51:53] [PASSED] test_lock_unlock
[08:51:53] [PASSED] test_duplicates
[08:51:53] [PASSED] test_prepare
[08:51:53] [PASSED] test_prepare_array
[08:51:53] [PASSED] test_multiple_loops
[08:51:53] ==================== [PASSED] drm_exec =====================
[08:51:53] =========== drm_format_helper_test (17 subtests) ===========
[08:51:53] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[08:51:53] [PASSED] single_pixel_source_buffer
[08:51:53] [PASSED] single_pixel_clip_rectangle
[08:51:53] [PASSED] well_known_colors
[08:51:53] [PASSED] destination_pitch
[08:51:53] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[08:51:53] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[08:51:53] [PASSED] single_pixel_source_buffer
[08:51:53] [PASSED] single_pixel_clip_rectangle
[08:51:53] [PASSED] well_known_colors
[08:51:53] [PASSED] destination_pitch
[08:51:53] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[08:51:53] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[08:51:53] [PASSED] single_pixel_source_buffer
[08:51:53] [PASSED] single_pixel_clip_rectangle
[08:51:53] [PASSED] well_known_colors
[08:51:53] [PASSED] destination_pitch
[08:51:53] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[08:51:53] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[08:51:53] [PASSED] single_pixel_source_buffer
[08:51:53] [PASSED] single_pixel_clip_rectangle
[08:51:53] [PASSED] well_known_colors
[08:51:53] [PASSED] destination_pitch
[08:51:53] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[08:51:53] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[08:51:53] [PASSED] single_pixel_source_buffer
[08:51:53] [PASSED] single_pixel_clip_rectangle
[08:51:53] [PASSED] well_known_colors
[08:51:53] [PASSED] destination_pitch
[08:51:53] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[08:51:53] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[08:51:53] [PASSED] single_pixel_source_buffer
[08:51:53] [PASSED] single_pixel_clip_rectangle
[08:51:53] [PASSED] well_known_colors
[08:51:53] [PASSED] destination_pitch
[08:51:53] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[08:51:53] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[08:51:53] [PASSED] single_pixel_source_buffer
[08:51:53] [PASSED] single_pixel_clip_rectangle
[08:51:53] [PASSED] well_known_colors
[08:51:53] [PASSED] destination_pitch
[08:51:53] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[08:51:53] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[08:51:53] [PASSED] single_pixel_source_buffer
[08:51:53] [PASSED] single_pixel_clip_rectangle
[08:51:53] [PASSED] well_known_colors
[08:51:53] [PASSED] destination_pitch
[08:51:53] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[08:51:53] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[08:51:53] [PASSED] single_pixel_source_buffer
[08:51:53] [PASSED] single_pixel_clip_rectangle
[08:51:53] [PASSED] well_known_colors
[08:51:53] [PASSED] destination_pitch
[08:51:53] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[08:51:53] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[08:51:53] [PASSED] single_pixel_source_buffer
[08:51:53] [PASSED] single_pixel_clip_rectangle
[08:51:53] [PASSED] well_known_colors
[08:51:53] [PASSED] destination_pitch
[08:51:53] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[08:51:53] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[08:51:53] [PASSED] single_pixel_source_buffer
[08:51:53] [PASSED] single_pixel_clip_rectangle
[08:51:53] [PASSED] well_known_colors
[08:51:53] [PASSED] destination_pitch
[08:51:53] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[08:51:53] ============== drm_test_fb_xrgb8888_to_mono  ===============
[08:51:53] [PASSED] single_pixel_source_buffer
[08:51:53] [PASSED] single_pixel_clip_rectangle
[08:51:53] [PASSED] well_known_colors
[08:51:53] [PASSED] destination_pitch
[08:51:53] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[08:51:53] ==================== drm_test_fb_swab  =====================
[08:51:53] [PASSED] single_pixel_source_buffer
[08:51:53] [PASSED] single_pixel_clip_rectangle
[08:51:53] [PASSED] well_known_colors
[08:51:53] [PASSED] destination_pitch
[08:51:53] ================ [PASSED] drm_test_fb_swab =================
[08:51:53] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[08:51:53] [PASSED] single_pixel_source_buffer
[08:51:53] [PASSED] single_pixel_clip_rectangle
[08:51:53] [PASSED] well_known_colors
[08:51:53] [PASSED] destination_pitch
[08:51:53] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[08:51:53] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[08:51:53] [PASSED] single_pixel_source_buffer
[08:51:53] [PASSED] single_pixel_clip_rectangle
[08:51:53] [PASSED] well_known_colors
[08:51:53] [PASSED] destination_pitch
[08:51:53] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[08:51:53] ================= drm_test_fb_clip_offset  =================
[08:51:53] [PASSED] pass through
[08:51:53] [PASSED] horizontal offset
[08:51:53] [PASSED] vertical offset
[08:51:53] [PASSED] horizontal and vertical offset
[08:51:53] [PASSED] horizontal offset (custom pitch)
[08:51:53] [PASSED] vertical offset (custom pitch)
[08:51:53] [PASSED] horizontal and vertical offset (custom pitch)
[08:51:53] ============= [PASSED] drm_test_fb_clip_offset =============
[08:51:53] =================== drm_test_fb_memcpy  ====================
[08:51:53] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[08:51:53] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[08:51:53] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[08:51:53] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[08:51:53] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[08:51:53] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[08:51:53] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[08:51:53] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[08:51:53] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[08:51:53] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[08:51:53] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[08:51:53] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[08:51:53] =============== [PASSED] drm_test_fb_memcpy ================
[08:51:53] ============= [PASSED] drm_format_helper_test ==============
[08:51:53] ================= drm_format (18 subtests) =================
[08:51:53] [PASSED] drm_test_format_block_width_invalid
[08:51:53] [PASSED] drm_test_format_block_width_one_plane
[08:51:53] [PASSED] drm_test_format_block_width_two_plane
[08:51:53] [PASSED] drm_test_format_block_width_three_plane
[08:51:53] [PASSED] drm_test_format_block_width_tiled
[08:51:53] [PASSED] drm_test_format_block_height_invalid
[08:51:53] [PASSED] drm_test_format_block_height_one_plane
[08:51:53] [PASSED] drm_test_format_block_height_two_plane
[08:51:53] [PASSED] drm_test_format_block_height_three_plane
[08:51:53] [PASSED] drm_test_format_block_height_tiled
[08:51:53] [PASSED] drm_test_format_min_pitch_invalid
[08:51:53] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[08:51:53] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[08:51:53] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[08:51:53] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[08:51:53] [PASSED] drm_test_format_min_pitch_two_plane
[08:51:53] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[08:51:53] [PASSED] drm_test_format_min_pitch_tiled
[08:51:53] =================== [PASSED] drm_format ====================
[08:51:53] ============== drm_framebuffer (10 subtests) ===============
[08:51:53] ========== drm_test_framebuffer_check_src_coords  ==========
[08:51:53] [PASSED] Success: source fits into fb
[08:51:53] [PASSED] Fail: overflowing fb with x-axis coordinate
[08:51:53] [PASSED] Fail: overflowing fb with y-axis coordinate
[08:51:53] [PASSED] Fail: overflowing fb with source width
[08:51:53] [PASSED] Fail: overflowing fb with source height
[08:51:53] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[08:51:53] [PASSED] drm_test_framebuffer_cleanup
[08:51:53] =============== drm_test_framebuffer_create  ===============
[08:51:53] [PASSED] ABGR8888 normal sizes
[08:51:53] [PASSED] ABGR8888 max sizes
[08:51:53] [PASSED] ABGR8888 pitch greater than min required
[08:51:53] [PASSED] ABGR8888 pitch less than min required
[08:51:53] [PASSED] ABGR8888 Invalid width
[08:51:53] [PASSED] ABGR8888 Invalid buffer handle
[08:51:53] [PASSED] No pixel format
[08:51:53] [PASSED] ABGR8888 Width 0
[08:51:53] [PASSED] ABGR8888 Height 0
[08:51:53] [PASSED] ABGR8888 Out of bound height * pitch combination
[08:51:53] [PASSED] ABGR8888 Large buffer offset
[08:51:53] [PASSED] ABGR8888 Buffer offset for inexistent plane
[08:51:53] [PASSED] ABGR8888 Invalid flag
[08:51:53] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[08:51:53] [PASSED] ABGR8888 Valid buffer modifier
[08:51:53] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[08:51:53] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[08:51:53] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[08:51:53] [PASSED] NV12 Normal sizes
[08:51:53] [PASSED] NV12 Max sizes
[08:51:53] [PASSED] NV12 Invalid pitch
[08:51:53] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[08:51:53] [PASSED] NV12 different  modifier per-plane
[08:51:53] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[08:51:53] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[08:51:53] [PASSED] NV12 Modifier for inexistent plane
[08:51:53] [PASSED] NV12 Handle for inexistent plane
[08:51:53] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[08:51:53] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[08:51:53] [PASSED] YVU420 Normal sizes
[08:51:53] [PASSED] YVU420 Max sizes
[08:51:53] [PASSED] YVU420 Invalid pitch
[08:51:53] [PASSED] YVU420 Different pitches
[08:51:53] [PASSED] YVU420 Different buffer offsets/pitches
[08:51:53] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[08:51:53] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[08:51:53] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[08:51:53] [PASSED] YVU420 Valid modifier
[08:51:53] [PASSED] YVU420 Different modifiers per plane
[08:51:53] [PASSED] YVU420 Modifier for inexistent plane
[08:51:53] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[08:51:53] [PASSED] X0L2 Normal sizes
[08:51:53] [PASSED] X0L2 Max sizes
[08:51:53] [PASSED] X0L2 Invalid pitch
[08:51:53] [PASSED] X0L2 Pitch greater than minimum required
[08:51:53] [PASSED] X0L2 Handle for inexistent plane
[08:51:53] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[08:51:53] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[08:51:53] [PASSED] X0L2 Valid modifier
[08:51:53] [PASSED] X0L2 Modifier for inexistent plane
[08:51:53] =========== [PASSED] drm_test_framebuffer_create ===========
[08:51:53] [PASSED] drm_test_framebuffer_free
[08:51:53] [PASSED] drm_test_framebuffer_init
[08:51:53] [PASSED] drm_test_framebuffer_init_bad_format
[08:51:53] [PASSED] drm_test_framebuffer_init_dev_mismatch
[08:51:53] [PASSED] drm_test_framebuffer_lookup
[08:51:53] [PASSED] drm_test_framebuffer_lookup_inexistent
[08:51:53] [PASSED] drm_test_framebuffer_modifiers_not_supported
[08:51:53] ================= [PASSED] drm_framebuffer =================
[08:51:53] ================ drm_gem_shmem (8 subtests) ================
[08:51:53] [PASSED] drm_gem_shmem_test_obj_create
[08:51:53] [PASSED] drm_gem_shmem_test_obj_create_private
[08:51:53] [PASSED] drm_gem_shmem_test_pin_pages
[08:51:53] [PASSED] drm_gem_shmem_test_vmap
[08:51:53] [PASSED] drm_gem_shmem_test_get_sg_table
[08:51:53] [PASSED] drm_gem_shmem_test_get_pages_sgt
[08:51:53] [PASSED] drm_gem_shmem_test_madvise
[08:51:53] [PASSED] drm_gem_shmem_test_purge
[08:51:53] ================== [PASSED] drm_gem_shmem ==================
[08:51:53] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[08:51:53] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[08:51:53] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[08:51:53] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[08:51:53] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[08:51:53] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[08:51:53] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[08:51:53] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[08:51:53] [PASSED] Automatic
[08:51:53] [PASSED] Full
[08:51:53] [PASSED] Limited 16:235
[08:51:53] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[08:51:53] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[08:51:53] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[08:51:53] [PASSED] drm_test_check_disable_connector
[08:51:53] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[08:51:53] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[08:51:53] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[08:51:53] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[08:51:53] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[08:51:53] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[08:51:53] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[08:51:53] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[08:51:53] [PASSED] drm_test_check_output_bpc_dvi
[08:51:53] [PASSED] drm_test_check_output_bpc_format_vic_1
[08:51:53] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[08:51:53] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[08:51:53] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[08:51:53] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[08:51:53] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[08:51:53] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[08:51:53] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[08:51:53] ============ drm_test_check_hdmi_color_format  =============
[08:51:53] [PASSED] AUTO -> RGB
[08:51:53] [PASSED] YCBCR422 -> YUV422
[08:51:53] [PASSED] YCBCR420 -> YUV420
[08:51:53] [PASSED] YCBCR444 -> YUV444
[08:51:53] [PASSED] RGB -> RGB
[08:51:53] ======== [PASSED] drm_test_check_hdmi_color_format =========
[08:51:53] ======== drm_test_check_hdmi_color_format_420_only  ========
[08:51:53] [PASSED] RGB should fail
[08:51:53] [PASSED] YUV444 should fail
[08:51:53] [PASSED] YUV422 should fail
[08:51:53] [PASSED] YUV420 should work
[08:51:53] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[08:51:53] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[08:51:53] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[08:51:53] [PASSED] drm_test_check_broadcast_rgb_value
[08:51:53] [PASSED] drm_test_check_bpc_8_value
[08:51:53] [PASSED] drm_test_check_bpc_10_value
[08:51:53] [PASSED] drm_test_check_bpc_12_value
[08:51:53] [PASSED] drm_test_check_format_value
[08:51:53] [PASSED] drm_test_check_tmds_char_value
[08:51:53] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[08:51:53] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[08:51:53] [PASSED] drm_test_check_mode_valid
[08:51:53] [PASSED] drm_test_check_mode_valid_reject
[08:51:53] [PASSED] drm_test_check_mode_valid_reject_rate
[08:51:53] [PASSED] drm_test_check_mode_valid_reject_max_clock
[08:51:53] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[08:51:53] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[08:51:53] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[08:51:53] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[08:51:53] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[08:51:53] [PASSED] drm_test_check_infoframes
[08:51:53] [PASSED] drm_test_check_reject_avi_infoframe
[08:51:53] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[08:51:53] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[08:51:53] [PASSED] drm_test_check_reject_audio_infoframe
[08:51:53] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[08:51:53] ================= drm_managed (2 subtests) =================
[08:51:53] [PASSED] drm_test_managed_release_action
[08:51:53] [PASSED] drm_test_managed_run_action
[08:51:53] =================== [PASSED] drm_managed ===================
[08:51:53] =================== drm_mm (6 subtests) ====================
[08:51:53] [PASSED] drm_test_mm_init
[08:51:53] [PASSED] drm_test_mm_debug
[08:51:53] [PASSED] drm_test_mm_align32
[08:51:53] [PASSED] drm_test_mm_align64
[08:51:53] [PASSED] drm_test_mm_lowest
[08:51:53] [PASSED] drm_test_mm_highest
[08:51:53] ===================== [PASSED] drm_mm ======================
[08:51:53] ============= drm_modes_analog_tv (5 subtests) =============
[08:51:53] [PASSED] drm_test_modes_analog_tv_mono_576i
[08:51:53] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[08:51:53] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[08:51:53] [PASSED] drm_test_modes_analog_tv_pal_576i
[08:51:53] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[08:51:53] =============== [PASSED] drm_modes_analog_tv ===============
[08:51:53] ============== drm_panic_helper (3 subtests) ===============
[08:51:53] ============= drm_test_panic_screen_user_map  ==============
[08:51:53] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[08:51:53] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[08:51:53] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[08:51:53] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[08:51:53] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[08:51:53] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[08:51:53] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[08:51:53] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[08:51:53] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[08:51:53] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[08:51:53] ========= [PASSED] drm_test_panic_screen_user_map ==========
[08:51:53] ============= drm_test_panic_screen_user_page  =============
[08:51:53] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[08:51:53] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[08:51:53] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[08:51:53] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[08:51:53] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[08:51:53] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[08:51:53] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[08:51:53] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[08:51:53] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[08:51:53] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[08:51:53] ========= [PASSED] drm_test_panic_screen_user_page =========
[08:51:53] ========== drm_test_panic_screen_user_set_pixel  ===========
[08:51:53] [PASSED] Panic screen user, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[08:51:53] [PASSED] Panic screen user, mode: 494 x 494 	XR24 little-endian (0x34325258)
[08:51:53] [PASSED] Panic screen user, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[08:51:53] [PASSED] Panic screen user, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[08:51:53] [PASSED] Panic screen user, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[08:51:53] [PASSED] Panic screen kmsg, mode: 1024 x 768 	XR24 little-endian (0x34325258)
[08:51:53] [PASSED] Panic screen kmsg, mode: 494 x 494 	XR24 little-endian (0x34325258)
[08:51:53] [PASSED] Panic screen kmsg, mode: 1920 x 1080 	XR24 little-endian (0x34325258)
[08:51:53] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG16 little-endian (0x36314752)
[08:51:53] [PASSED] Panic screen kmsg, mode: 1024 x 768 	RG24 little-endian (0x34324752)
[08:51:53] ====== [PASSED] drm_test_panic_screen_user_set_pixel =======
[08:51:53] ================ [PASSED] drm_panic_helper =================
[08:51:53] ============== drm_plane_helper (2 subtests) ===============
[08:51:53] =============== drm_test_check_plane_state  ================
[08:51:53] [PASSED] clipping_simple
[08:51:53] [PASSED] clipping_rotate_reflect
[08:51:53] [PASSED] positioning_simple
[08:51:53] [PASSED] upscaling
[08:51:53] [PASSED] downscaling
[08:51:53] [PASSED] rounding1
[08:51:53] [PASSED] rounding2
[08:51:53] [PASSED] rounding3
[08:51:53] [PASSED] rounding4
[08:51:53] =========== [PASSED] drm_test_check_plane_state ============
[08:51:53] =========== drm_test_check_invalid_plane_state  ============
[08:51:53] [PASSED] positioning_invalid
[08:51:53] [PASSED] upscaling_invalid
[08:51:53] [PASSED] downscaling_invalid
[08:51:53] ======= [PASSED] drm_test_check_invalid_plane_state ========
[08:51:53] ================ [PASSED] drm_plane_helper =================
[08:51:53] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[08:51:53] ====== drm_test_connector_helper_tv_get_modes_check  =======
[08:51:53] [PASSED] None
[08:51:53] [PASSED] PAL
[08:51:53] [PASSED] NTSC
[08:51:53] [PASSED] Both, NTSC Default
[08:51:53] [PASSED] Both, PAL Default
[08:51:53] [PASSED] Both, NTSC Default, with PAL on command-line
[08:51:53] [PASSED] Both, PAL Default, with NTSC on command-line
[08:51:53] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[08:51:53] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[08:51:53] ================== drm_rect (9 subtests) ===================
[08:51:53] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[08:51:53] [PASSED] drm_test_rect_clip_scaled_not_clipped
[08:51:53] [PASSED] drm_test_rect_clip_scaled_clipped
[08:51:53] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[08:51:53] ================= drm_test_rect_intersect  =================
[08:51:53] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[08:51:53] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[08:51:53] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[08:51:53] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[08:51:53] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[08:51:53] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[08:51:53] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[08:51:53] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[08:51:53] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[08:51:53] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[08:51:53] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[08:51:53] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[08:51:53] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[08:51:53] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[08:51:53] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[08:51:53] ============= [PASSED] drm_test_rect_intersect =============
[08:51:53] ================ drm_test_rect_calc_hscale  ================
[08:51:53] [PASSED] normal use
[08:51:53] [PASSED] out of max range
[08:51:53] [PASSED] out of min range
[08:51:53] [PASSED] zero dst
[08:51:53] [PASSED] negative src
[08:51:53] [PASSED] negative dst
[08:51:53] ============ [PASSED] drm_test_rect_calc_hscale ============
[08:51:53] ================ drm_test_rect_calc_vscale  ================
[08:51:53] [PASSED] normal use
[08:51:53] [PASSED] out of max range
[08:51:53] [PASSED] out of min range
[08:51:53] [PASSED] zero dst
[08:51:53] [PASSED] negative src
[08:51:53] [PASSED] negative dst
[08:51:53] ============ [PASSED] drm_test_rect_calc_vscale ============
[08:51:53] ================== drm_test_rect_rotate  ===================
[08:51:53] [PASSED] reflect-x
[08:51:53] [PASSED] reflect-y
[08:51:53] [PASSED] rotate-0
[08:51:53] [PASSED] rotate-90
[08:51:53] [PASSED] rotate-180
[08:51:53] [PASSED] rotate-270
[08:51:53] ============== [PASSED] drm_test_rect_rotate ===============
[08:51:53] ================ drm_test_rect_rotate_inv  =================
[08:51:53] [PASSED] reflect-x
[08:51:53] [PASSED] reflect-y
[08:51:53] [PASSED] rotate-0
[08:51:53] [PASSED] rotate-90
[08:51:53] [PASSED] rotate-180
[08:51:53] [PASSED] rotate-270
[08:51:53] ============ [PASSED] drm_test_rect_rotate_inv =============
[08:51:53] ==================== [PASSED] drm_rect =====================
[08:51:53] ============ drm_sysfb_modeset_test (1 subtest) ============
[08:51:53] ============ drm_test_sysfb_build_fourcc_list  =============
[08:51:53] [PASSED] no native formats
[08:51:53] [PASSED] XRGB8888 as native format
[08:51:53] [PASSED] remove duplicates
[08:51:53] [PASSED] convert alpha formats
[08:51:53] [PASSED] random formats
[08:51:53] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[08:51:53] ============= [PASSED] drm_sysfb_modeset_test ==============
[08:51:53] ================== drm_fixp (2 subtests) ===================
[08:51:53] [PASSED] drm_test_int2fixp
[08:51:53] [PASSED] drm_test_sm2fixp
[08:51:53] ==================== [PASSED] drm_fixp =====================
[08:51:53] ============================================================
[08:51:53] Testing complete. Ran 667 tests: passed: 667
[08:51:53] Elapsed time: 28.653s total, 2.558s configuring, 25.729s building, 0.339s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[08:51:53] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:51:56] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[08:52:06] Starting KUnit Kernel (1/1)...
[08:52:06] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[08:52:06] ================= ttm_device (5 subtests) ==================
[08:52:06] [PASSED] ttm_device_init_basic
[08:52:06] [PASSED] ttm_device_init_multiple
[08:52:06] [PASSED] ttm_device_fini_basic
[08:52:06] [PASSED] ttm_device_init_no_vma_man
[08:52:06] ================== ttm_device_init_pools  ==================
[08:52:06] [PASSED] No DMA allocations, no DMA32 required
[08:52:06] [PASSED] DMA allocations, DMA32 required
[08:52:06] [PASSED] No DMA allocations, DMA32 required
[08:52:06] [PASSED] DMA allocations, no DMA32 required
[08:52:06] ============== [PASSED] ttm_device_init_pools ==============
[08:52:06] =================== [PASSED] ttm_device ====================
[08:52:06] ================== ttm_pool (8 subtests) ===================
[08:52:06] ================== ttm_pool_alloc_basic  ===================
[08:52:06] [PASSED] One page
[08:52:06] [PASSED] More than one page
[08:52:06] [PASSED] Above the allocation limit
[08:52:06] [PASSED] One page, with coherent DMA mappings enabled
[08:52:06] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[08:52:06] ============== [PASSED] ttm_pool_alloc_basic ===============
[08:52:06] ============== ttm_pool_alloc_basic_dma_addr  ==============
[08:52:06] [PASSED] One page
[08:52:06] [PASSED] More than one page
[08:52:06] [PASSED] Above the allocation limit
[08:52:06] [PASSED] One page, with coherent DMA mappings enabled
[08:52:06] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[08:52:06] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[08:52:06] [PASSED] ttm_pool_alloc_order_caching_match
[08:52:06] [PASSED] ttm_pool_alloc_caching_mismatch
[08:52:06] [PASSED] ttm_pool_alloc_order_mismatch
[08:52:06] [PASSED] ttm_pool_free_dma_alloc
[08:52:06] [PASSED] ttm_pool_free_no_dma_alloc
[08:52:06] [ERROR] Test: ttm_pool: missing expected subtest!
[08:52:06] 
[08:52:06] Pid: 80, comm: kunit_try_catch Tainted: G        W        N  7.4.0-rc4-gde404f459a0b
[08:52:06] RIP: 0033:list_lru_count_node+0xe/0x20
[08:52:06] RSP: 00000000c40dbef8  EFLAGS: 00010246
[08:52:06] RAX: 0000000000000001 RBX: 00000000c4003c90 RCX: 0000000000000021
[08:52:06] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000084453030
[08:52:06] RBP: 0000000084453000 R08: 00000000c40dbe98 R09: 0000000000000000
[08:52:06] R10: 00000000c2e16a60 R11: 0000000000000000 R12: 0000000060121160
[08:52:06] R13: 0000000084453030 R14: 000000006046f0e0 R15: 00000000604ba488
[08:52:06] Kernel panic - not syncing: Segfault with no mm
[08:52:06] [CRASHED] 
[08:52:06] [ERROR] Test: ttm_pool: missing subtest result line!
[08:52:06] # module: ttm_pool_test
[08:52:06] ==================== [CRASHED] ttm_pool ====================
[08:52:06] [ERROR] Test: main: missing expected subtest!
[08:52:06] [CRASHED] 
[08:52:06] [ERROR] Test: main: missing expected subtest!
[08:52:06] [CRASHED] 
[08:52:06] [ERROR] Test: main: missing expected subtest!
[08:52:06] [CRASHED] 
[08:52:06] [ERROR] Test: main: missing expected subtest!
[08:52:06] [CRASHED] 
[08:52:06] ============================================================
[08:52:06] Testing complete. Ran 28 tests: passed: 23, crashed: 5, errors: 6
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
[08:52:06] Elapsed time: 13.086s total, 2.523s configuring, 10.297s building, 0.265s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


