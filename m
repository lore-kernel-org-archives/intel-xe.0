Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D25EC5CFCF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 02:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8BA10E48C;
	Thu, 13 Aug 2026 02:39:10 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D1B10E48C;
 Thu, 13 Aug 2026 02:39:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_fix_GuC_TLB_invalida?=
 =?utf-8?q?tion_ack_stalls_on_ARL_=28Wa=5F22016122933=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Tales_A=2E_Mendon=C3=A7a?= <talesam@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Aug 2026 02:39:10 -0000
Message-ID: <178658875008.46288.17476753153766428687@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260813023016.805573-1-talesam@gmail.com>
In-Reply-To: <20260813023016.805573-1-talesam@gmail.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: fix GuC TLB invalidation ack stalls on ARL (Wa_22016122933)
URL   : https://patchwork.freedesktop.org/series/172110/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[02:37:09] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:37:13] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[02:37:33] Starting KUnit Kernel (1/1)...
[02:37:33] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[02:37:34] ================= gpu_buddy (13 subtests) ==================
[02:37:34] [PASSED] gpu_test_buddy_alloc_limit
[02:37:34] [PASSED] gpu_test_buddy_alloc_optimistic
[02:37:34] [PASSED] gpu_test_buddy_alloc_pessimistic
[02:37:34] [PASSED] gpu_test_buddy_alloc_pathological
[02:37:34] [PASSED] gpu_test_buddy_alloc_contiguous
[02:37:34] [PASSED] gpu_test_buddy_alloc_clear
[02:37:34] [PASSED] gpu_test_buddy_alloc_range
[02:37:34] [PASSED] gpu_test_buddy_alloc_range_bias
[02:37:34] [PASSED] gpu_test_buddy_fragmentation_performance
[02:37:34] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[02:37:34] [PASSED] gpu_test_buddy_offset_aligned_allocation
[02:37:34] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[02:37:34] [PASSED] gpu_test_buddy_addr_to_block
[02:37:34] ==================== [PASSED] gpu_buddy ====================
[02:37:34] ============================================================
[02:37:34] Testing complete. Ran 13 tests: passed: 13
[02:37:34] Elapsed time: 24.836s total, 4.326s configuring, 20.095s building, 0.391s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[02:37:34] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:37:36] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[02:38:09] Starting KUnit Kernel (1/1)...
[02:38:09] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[02:38:09] ================== guc_buf (11 subtests) ===================
[02:38:09] [PASSED] test_smallest
[02:38:09] [PASSED] test_largest
[02:38:09] [PASSED] test_granular
[02:38:09] [PASSED] test_unique
[02:38:09] [PASSED] test_overlap
[02:38:09] [PASSED] test_reusable
[02:38:09] [PASSED] test_too_big
[02:38:09] [PASSED] test_flush
[02:38:09] [PASSED] test_lookup
[02:38:09] [PASSED] test_data
[02:38:09] [PASSED] test_class
[02:38:09] ===================== [PASSED] guc_buf =====================
[02:38:09] =================== guc_dbm (7 subtests) ===================
[02:38:09] [PASSED] test_empty
[02:38:09] [PASSED] test_default
[02:38:09] ======================== test_size  ========================
[02:38:09] [PASSED] 4
[02:38:09] [PASSED] 8
[02:38:09] [PASSED] 32
[02:38:09] [PASSED] 256
[02:38:09] ==================== [PASSED] test_size ====================
[02:38:09] ======================= test_reuse  ========================
[02:38:09] [PASSED] 4
[02:38:09] [PASSED] 8
[02:38:09] [PASSED] 32
[02:38:09] [PASSED] 256
[02:38:09] =================== [PASSED] test_reuse ====================
[02:38:09] =================== test_range_overlap  ====================
[02:38:09] [PASSED] 4
[02:38:09] [PASSED] 8
[02:38:09] [PASSED] 32
[02:38:09] [PASSED] 256
[02:38:09] =============== [PASSED] test_range_overlap ================
[02:38:09] =================== test_range_compact  ====================
[02:38:09] [PASSED] 4
[02:38:09] [PASSED] 8
[02:38:09] [PASSED] 32
[02:38:09] [PASSED] 256
[02:38:09] =============== [PASSED] test_range_compact ================
[02:38:09] ==================== test_range_spare  =====================
[02:38:09] [PASSED] 4
[02:38:09] [PASSED] 8
[02:38:09] [PASSED] 32
[02:38:09] [PASSED] 256
[02:38:09] ================ [PASSED] test_range_spare =================
[02:38:09] ===================== [PASSED] guc_dbm =====================
[02:38:09] =================== guc_idm (6 subtests) ===================
[02:38:09] [PASSED] bad_init
[02:38:09] [PASSED] no_init
[02:38:09] [PASSED] init_fini
[02:38:09] [PASSED] check_used
[02:38:09] [PASSED] check_quota
[02:38:09] [PASSED] check_all
[02:38:09] ===================== [PASSED] guc_idm =====================
[02:38:09] =============== guc_klv_helpers (9 subtests) ===============
[02:38:09] [PASSED] test_count
[02:38:09] [PASSED] test_encode_u32
[02:38:09] [PASSED] test_encode_u64
[02:38:09] [PASSED] test_encode_string
[02:38:09] [PASSED] test_encode_object_raw
[02:38:09] [PASSED] test_encode_object_klv
[02:38:09] [PASSED] test_encode_object_nested
[02:38:09] [PASSED] test_encode_object_basic
[02:38:09] [PASSED] test_print
[02:38:09] ================= [PASSED] guc_klv_helpers =================
[02:38:09] ================== no_relay (3 subtests) ===================
[02:38:09] [PASSED] xe_drops_guc2pf_if_not_ready
[02:38:09] [PASSED] xe_drops_guc2vf_if_not_ready
[02:38:09] [PASSED] xe_rejects_send_if_not_ready
[02:38:09] ==================== [PASSED] no_relay =====================
[02:38:09] ================== pf_relay (14 subtests) ==================
[02:38:09] [PASSED] pf_rejects_guc2pf_too_short
[02:38:09] [PASSED] pf_rejects_guc2pf_too_long
[02:38:09] [PASSED] pf_rejects_guc2pf_no_payload
[02:38:09] [PASSED] pf_fails_no_payload
[02:38:09] [PASSED] pf_fails_bad_origin
[02:38:09] [PASSED] pf_fails_bad_type
[02:38:09] [PASSED] pf_txn_reports_error
[02:38:09] [PASSED] pf_txn_sends_pf2guc
[02:38:09] [PASSED] pf_sends_pf2guc
[02:38:09] [SKIPPED] pf_loopback_nop (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[02:38:09] [SKIPPED] pf_loopback_echo (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[02:38:09] [SKIPPED] pf_loopback_fail (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[02:38:09] [SKIPPED] pf_loopback_busy (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[02:38:09] [SKIPPED] pf_loopback_retry (requires CONFIG_DRM_XE_DEBUG_SRIOV)
[02:38:09] ==================== [PASSED] pf_relay =====================
[02:38:09] ================== vf_relay (3 subtests) ===================
[02:38:09] [PASSED] vf_rejects_guc2vf_too_short
[02:38:09] [PASSED] vf_rejects_guc2vf_too_long
[02:38:09] [PASSED] vf_rejects_guc2vf_no_payload
[02:38:09] ==================== [PASSED] vf_relay =====================
[02:38:09] ================ pf_gt_config (9 subtests) =================
[02:38:09] [PASSED] fair_contexts_1vf
[02:38:09] [PASSED] fair_doorbells_1vf
[02:38:09] [PASSED] fair_ggtt_1vf
[02:38:09] ====================== fair_vram_1vf  ======================
[02:38:09] [PASSED] 3.50 GiB
[02:38:09] [PASSED] 11.5 GiB
[02:38:09] [PASSED] 15.5 GiB
[02:38:09] [PASSED] 31.5 GiB
[02:38:09] [PASSED] 63.5 GiB
[02:38:09] [PASSED] 1.91 GiB
[02:38:09] ================== [PASSED] fair_vram_1vf ==================
[02:38:09] ================ fair_vram_1vf_admin_only  =================
[02:38:09] [PASSED] 3.50 GiB
[02:38:09] [PASSED] 11.5 GiB
[02:38:09] [PASSED] 15.5 GiB
[02:38:09] [PASSED] 31.5 GiB
[02:38:09] [PASSED] 63.5 GiB
[02:38:09] [PASSED] 1.91 GiB
[02:38:09] ============ [PASSED] fair_vram_1vf_admin_only =============
[02:38:09] ====================== fair_contexts  ======================
[02:38:09] [PASSED] 1 VF
[02:38:09] [PASSED] 2 VFs
[02:38:09] [PASSED] 3 VFs
[02:38:09] [PASSED] 4 VFs
[02:38:09] [PASSED] 5 VFs
[02:38:09] [PASSED] 6 VFs
[02:38:09] [PASSED] 7 VFs
[02:38:09] [PASSED] 8 VFs
[02:38:09] [PASSED] 9 VFs
[02:38:09] [PASSED] 10 VFs
[02:38:09] [PASSED] 11 VFs
[02:38:09] [PASSED] 12 VFs
[02:38:09] [PASSED] 13 VFs
[02:38:09] [PASSED] 14 VFs
[02:38:09] [PASSED] 15 VFs
[02:38:09] [PASSED] 16 VFs
[02:38:09] [PASSED] 17 VFs
[02:38:09] [PASSED] 18 VFs
[02:38:09] [PASSED] 19 VFs
[02:38:09] [PASSED] 20 VFs
[02:38:09] [PASSED] 21 VFs
[02:38:09] [PASSED] 22 VFs
[02:38:09] [PASSED] 23 VFs
[02:38:09] [PASSED] 24 VFs
[02:38:09] [PASSED] 25 VFs
[02:38:09] [PASSED] 26 VFs
[02:38:09] [PASSED] 27 VFs
[02:38:09] [PASSED] 28 VFs
[02:38:09] [PASSED] 29 VFs
[02:38:09] [PASSED] 30 VFs
[02:38:09] [PASSED] 31 VFs
[02:38:09] [PASSED] 32 VFs
[02:38:09] [PASSED] 33 VFs
[02:38:09] [PASSED] 34 VFs
[02:38:09] [PASSED] 35 VFs
[02:38:09] [PASSED] 36 VFs
[02:38:09] [PASSED] 37 VFs
[02:38:09] [PASSED] 38 VFs
[02:38:09] [PASSED] 39 VFs
[02:38:09] [PASSED] 40 VFs
[02:38:09] [PASSED] 41 VFs
[02:38:09] [PASSED] 42 VFs
[02:38:09] [PASSED] 43 VFs
[02:38:09] [PASSED] 44 VFs
[02:38:09] [PASSED] 45 VFs
[02:38:09] [PASSED] 46 VFs
[02:38:09] [PASSED] 47 VFs
[02:38:09] [PASSED] 48 VFs
[02:38:09] [PASSED] 49 VFs
[02:38:09] [PASSED] 50 VFs
[02:38:09] [PASSED] 51 VFs
[02:38:09] [PASSED] 52 VFs
[02:38:09] [PASSED] 53 VFs
[02:38:09] [PASSED] 54 VFs
[02:38:09] [PASSED] 55 VFs
[02:38:09] [PASSED] 56 VFs
[02:38:09] [PASSED] 57 VFs
[02:38:09] [PASSED] 58 VFs
[02:38:09] [PASSED] 59 VFs
[02:38:09] [PASSED] 60 VFs
[02:38:09] [PASSED] 61 VFs
[02:38:09] [PASSED] 62 VFs
[02:38:09] [PASSED] 63 VFs
[02:38:09] ================== [PASSED] fair_contexts ==================
[02:38:09] ===================== fair_doorbells  ======================
[02:38:09] [PASSED] 1 VF
[02:38:09] [PASSED] 2 VFs
[02:38:09] [PASSED] 3 VFs
[02:38:09] [PASSED] 4 VFs
[02:38:09] [PASSED] 5 VFs
[02:38:09] [PASSED] 6 VFs
[02:38:09] [PASSED] 7 VFs
[02:38:09] [PASSED] 8 VFs
[02:38:09] [PASSED] 9 VFs
[02:38:09] [PASSED] 10 VFs
[02:38:09] [PASSED] 11 VFs
[02:38:09] [PASSED] 12 VFs
[02:38:09] [PASSED] 13 VFs
[02:38:09] [PASSED] 14 VFs
[02:38:09] [PASSED] 15 VFs
[02:38:09] [PASSED] 16 VFs
[02:38:09] [PASSED] 17 VFs
[02:38:09] [PASSED] 18 VFs
[02:38:09] [PASSED] 19 VFs
[02:38:09] [PASSED] 20 VFs
[02:38:09] [PASSED] 21 VFs
[02:38:09] [PASSED] 22 VFs
[02:38:09] [PASSED] 23 VFs
[02:38:09] [PASSED] 24 VFs
[02:38:09] [PASSED] 25 VFs
[02:38:09] [PASSED] 26 VFs
[02:38:09] [PASSED] 27 VFs
[02:38:09] [PASSED] 28 VFs
[02:38:09] [PASSED] 29 VFs
[02:38:09] [PASSED] 30 VFs
[02:38:09] [PASSED] 31 VFs
[02:38:09] [PASSED] 32 VFs
[02:38:09] [PASSED] 33 VFs
[02:38:09] [PASSED] 34 VFs
[02:38:09] [PASSED] 35 VFs
[02:38:09] [PASSED] 36 VFs
[02:38:09] [PASSED] 37 VFs
[02:38:09] [PASSED] 38 VFs
[02:38:09] [PASSED] 39 VFs
[02:38:09] [PASSED] 40 VFs
[02:38:09] [PASSED] 41 VFs
[02:38:09] [PASSED] 42 VFs
[02:38:09] [PASSED] 43 VFs
[02:38:09] [PASSED] 44 VFs
[02:38:09] [PASSED] 45 VFs
[02:38:09] [PASSED] 46 VFs
[02:38:09] [PASSED] 47 VFs
[02:38:09] [PASSED] 48 VFs
[02:38:09] [PASSED] 49 VFs
[02:38:09] [PASSED] 50 VFs
[02:38:09] [PASSED] 51 VFs
[02:38:09] [PASSED] 52 VFs
[02:38:09] [PASSED] 53 VFs
[02:38:09] [PASSED] 54 VFs
[02:38:09] [PASSED] 55 VFs
[02:38:09] [PASSED] 56 VFs
[02:38:09] [PASSED] 57 VFs
[02:38:09] [PASSED] 58 VFs
[02:38:09] [PASSED] 59 VFs
[02:38:09] [PASSED] 60 VFs
[02:38:09] [PASSED] 61 VFs
[02:38:09] [PASSED] 62 VFs
[02:38:09] [PASSED] 63 VFs
[02:38:09] ================= [PASSED] fair_doorbells ==================
[02:38:09] ======================== fair_ggtt  ========================
[02:38:09] [PASSED] 1 VF
[02:38:09] [PASSED] 2 VFs
[02:38:09] [PASSED] 3 VFs
[02:38:09] [PASSED] 4 VFs
[02:38:09] [PASSED] 5 VFs
[02:38:09] [PASSED] 6 VFs
[02:38:09] [PASSED] 7 VFs
[02:38:09] [PASSED] 8 VFs
[02:38:09] [PASSED] 9 VFs
[02:38:09] [PASSED] 10 VFs
[02:38:09] [PASSED] 11 VFs
[02:38:09] [PASSED] 12 VFs
[02:38:09] [PASSED] 13 VFs
[02:38:09] [PASSED] 14 VFs
[02:38:09] [PASSED] 15 VFs
[02:38:09] [PASSED] 16 VFs
[02:38:09] [PASSED] 17 VFs
[02:38:09] [PASSED] 18 VFs
[02:38:09] [PASSED] 19 VFs
[02:38:09] [PASSED] 20 VFs
[02:38:09] [PASSED] 21 VFs
[02:38:09] [PASSED] 22 VFs
[02:38:09] [PASSED] 23 VFs
[02:38:09] [PASSED] 24 VFs
[02:38:09] [PASSED] 25 VFs
[02:38:09] [PASSED] 26 VFs
[02:38:09] [PASSED] 27 VFs
[02:38:09] [PASSED] 28 VFs
[02:38:09] [PASSED] 29 VFs
[02:38:09] [PASSED] 30 VFs
[02:38:09] [PASSED] 31 VFs
[02:38:09] [PASSED] 32 VFs
[02:38:09] [PASSED] 33 VFs
[02:38:09] [PASSED] 34 VFs
[02:38:10] [PASSED] 35 VFs
[02:38:10] [PASSED] 36 VFs
[02:38:10] [PASSED] 37 VFs
[02:38:10] [PASSED] 38 VFs
[02:38:10] [PASSED] 39 VFs
[02:38:10] [PASSED] 40 VFs
[02:38:10] [PASSED] 41 VFs
[02:38:10] [PASSED] 42 VFs
[02:38:10] [PASSED] 43 VFs
[02:38:10] [PASSED] 44 VFs
[02:38:10] [PASSED] 45 VFs
[02:38:10] [PASSED] 46 VFs
[02:38:10] [PASSED] 47 VFs
[02:38:10] [PASSED] 48 VFs
[02:38:10] [PASSED] 49 VFs
[02:38:10] [PASSED] 50 VFs
[02:38:10] [PASSED] 51 VFs
[02:38:10] [PASSED] 52 VFs
[02:38:10] [PASSED] 53 VFs
[02:38:10] [PASSED] 54 VFs
[02:38:10] [PASSED] 55 VFs
[02:38:10] [PASSED] 56 VFs
[02:38:10] [PASSED] 57 VFs
[02:38:10] [PASSED] 58 VFs
[02:38:10] [PASSED] 59 VFs
[02:38:10] [PASSED] 60 VFs
[02:38:10] [PASSED] 61 VFs
[02:38:10] [PASSED] 62 VFs
[02:38:10] [PASSED] 63 VFs
[02:38:10] ==================== [PASSED] fair_ggtt ====================
[02:38:10] ======================== fair_vram  ========================
[02:38:10] [PASSED] 1 VF
[02:38:10] [PASSED] 2 VFs
[02:38:10] [PASSED] 3 VFs
[02:38:10] [PASSED] 4 VFs
[02:38:10] [PASSED] 5 VFs
[02:38:10] [PASSED] 6 VFs
[02:38:10] [PASSED] 7 VFs
[02:38:10] [PASSED] 8 VFs
[02:38:10] [PASSED] 9 VFs
[02:38:10] [PASSED] 10 VFs
[02:38:10] [PASSED] 11 VFs
[02:38:10] [PASSED] 12 VFs
[02:38:10] [PASSED] 13 VFs
[02:38:10] [PASSED] 14 VFs
[02:38:10] [PASSED] 15 VFs
[02:38:10] [PASSED] 16 VFs
[02:38:10] [PASSED] 17 VFs
[02:38:10] [PASSED] 18 VFs
[02:38:10] [PASSED] 19 VFs
[02:38:10] [PASSED] 20 VFs
[02:38:10] [PASSED] 21 VFs
[02:38:10] [PASSED] 22 VFs
[02:38:10] [PASSED] 23 VFs
[02:38:10] [PASSED] 24 VFs
[02:38:10] [PASSED] 25 VFs
[02:38:10] [PASSED] 26 VFs
[02:38:10] [PASSED] 27 VFs
[02:38:10] [PASSED] 28 VFs
[02:38:10] [PASSED] 29 VFs
[02:38:10] [PASSED] 30 VFs
[02:38:10] [PASSED] 31 VFs
[02:38:10] [PASSED] 32 VFs
[02:38:10] [PASSED] 33 VFs
[02:38:10] [PASSED] 34 VFs
[02:38:10] [PASSED] 35 VFs
[02:38:10] [PASSED] 36 VFs
[02:38:10] [PASSED] 37 VFs
[02:38:10] [PASSED] 38 VFs
[02:38:10] [PASSED] 39 VFs
[02:38:10] [PASSED] 40 VFs
[02:38:10] [PASSED] 41 VFs
[02:38:10] [PASSED] 42 VFs
[02:38:10] [PASSED] 43 VFs
[02:38:10] [PASSED] 44 VFs
[02:38:10] [PASSED] 45 VFs
[02:38:10] [PASSED] 46 VFs
[02:38:10] [PASSED] 47 VFs
[02:38:10] [PASSED] 48 VFs
[02:38:10] [PASSED] 49 VFs
[02:38:10] [PASSED] 50 VFs
[02:38:10] [PASSED] 51 VFs
[02:38:10] [PASSED] 52 VFs
[02:38:10] [PASSED] 53 VFs
[02:38:10] [PASSED] 54 VFs
[02:38:10] [PASSED] 55 VFs
[02:38:10] [PASSED] 56 VFs
[02:38:10] [PASSED] 57 VFs
[02:38:10] [PASSED] 58 VFs
[02:38:10] [PASSED] 59 VFs
[02:38:10] [PASSED] 60 VFs
[02:38:10] [PASSED] 61 VFs
[02:38:10] [PASSED] 62 VFs
[02:38:10] [PASSED] 63 VFs
[02:38:10] ==================== [PASSED] fair_vram ====================
[02:38:10] ================== [PASSED] pf_gt_config ===================
[02:38:10] ===================== lmtt (1 subtest) =====================
[02:38:10] ======================== test_ops  =========================
[02:38:10] [PASSED] 2-level
[02:38:10] [PASSED] multi-level
[02:38:10] ==================== [PASSED] test_ops =====================
[02:38:10] ====================== [PASSED] lmtt =======================
[02:38:10] ================= sriov_packet (1 subtest) =================
[02:38:10] [PASSED] test_descriptor_init
[02:38:10] ================== [PASSED] sriov_packet ===================
[02:38:10] ================= pf_service (11 subtests) =================
[02:38:10] [PASSED] pf_negotiate_any
[02:38:10] [PASSED] pf_negotiate_base_match
[02:38:10] [PASSED] pf_negotiate_base_newer
[02:38:10] [PASSED] pf_negotiate_base_next
[02:38:10] [SKIPPED] pf_negotiate_base_older (no older minor)
[02:38:10] [PASSED] pf_negotiate_base_prev
[02:38:10] [PASSED] pf_negotiate_latest_match
[02:38:10] [PASSED] pf_negotiate_latest_newer
[02:38:10] [PASSED] pf_negotiate_latest_next
[02:38:10] [SKIPPED] pf_negotiate_latest_older (no older minor)
[02:38:10] [SKIPPED] pf_negotiate_latest_prev (no prev major)
[02:38:10] =================== [PASSED] pf_service ====================
[02:38:10] ================= xe_guc_g2g (2 subtests) ==================
[02:38:10] ============== xe_live_guc_g2g_kunit_default  ==============
[02:38:10] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[02:38:10] ============== xe_live_guc_g2g_kunit_allmem  ===============
[02:38:10] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[02:38:10] =================== [SKIPPED] xe_guc_g2g ===================
[02:38:10] =================== xe_mocs (2 subtests) ===================
[02:38:10] ================ xe_live_mocs_kernel_kunit  ================
[02:38:10] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[02:38:10] ================ xe_live_mocs_reset_kunit  =================
[02:38:10] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[02:38:10] ==================== [SKIPPED] xe_mocs =====================
[02:38:10] ================= xe_migrate (2 subtests) ==================
[02:38:10] ================= xe_migrate_sanity_kunit  =================
[02:38:10] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[02:38:10] ================== xe_validate_ccs_kunit  ==================
[02:38:10] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[02:38:10] =================== [SKIPPED] xe_migrate ===================
[02:38:10] ================== xe_dma_buf (1 subtest) ==================
[02:38:10] ==================== xe_dma_buf_kunit  =====================
[02:38:10] ================ [SKIPPED] xe_dma_buf_kunit ================
[02:38:10] =================== [SKIPPED] xe_dma_buf ===================
[02:38:10] ================= xe_bo_shrink (1 subtest) =================
[02:38:10] =================== xe_bo_shrink_kunit  ====================
[02:38:10] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[02:38:10] ================== [SKIPPED] xe_bo_shrink ==================
[02:38:10] ==================== xe_bo (2 subtests) ====================
[02:38:10] ================== xe_ccs_migrate_kunit  ===================
[02:38:10] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[02:38:10] ==================== xe_bo_evict_kunit  ====================
[02:38:10] =============== [SKIPPED] xe_bo_evict_kunit ================
[02:38:10] ===================== [SKIPPED] xe_bo ======================
[02:38:10] ==================== args (13 subtests) ====================
[02:38:10] [PASSED] count_args_test
[02:38:10] [PASSED] call_args_example
[02:38:10] [PASSED] call_args_test
[02:38:10] [PASSED] drop_first_arg_example
[02:38:10] [PASSED] drop_first_arg_test
[02:38:10] [PASSED] first_arg_example
[02:38:10] [PASSED] first_arg_test
[02:38:10] [PASSED] last_arg_example
[02:38:10] [PASSED] last_arg_test
[02:38:10] [PASSED] pick_arg_example
[02:38:10] [PASSED] if_args_example
[02:38:10] [PASSED] if_args_test
[02:38:10] [PASSED] sep_comma_example
[02:38:10] ====================== [PASSED] args =======================
[02:38:10] =================== xe_pci (3 subtests) ====================
[02:38:10] ==================== check_graphics_ip  ====================
[02:38:10] [PASSED] 12.00 Xe_LP
[02:38:10] [PASSED] 12.10 Xe_LP+
[02:38:10] [PASSED] 12.55 Xe_HPG
[02:38:10] [PASSED] 12.60 Xe_HPC
[02:38:10] [PASSED] 12.70 Xe_LPG
[02:38:10] [PASSED] 12.71 Xe_LPG
[02:38:10] [PASSED] 12.74 Xe_LPG+
[02:38:10] [PASSED] 20.01 Xe2_HPG
[02:38:10] [PASSED] 20.02 Xe2_HPG
[02:38:10] [PASSED] 20.04 Xe2_LPG
[02:38:10] [PASSED] 30.00 Xe3_LPG
[02:38:10] [PASSED] 30.01 Xe3_LPG
[02:38:10] [PASSED] 30.03 Xe3_LPG
[02:38:10] [PASSED] 30.04 Xe3_LPG
[02:38:10] [PASSED] 30.05 Xe3_LPG
[02:38:10] [PASSED] 35.10 Xe3p_LPG
[02:38:10] [PASSED] 35.11 Xe3p_XPC
[02:38:10] ================ [PASSED] check_graphics_ip ================
[02:38:10] ===================== check_media_ip  ======================
[02:38:10] [PASSED] 12.00 Xe_M
[02:38:10] [PASSED] 12.55 Xe_HPM
[02:38:10] [PASSED] 13.00 Xe_LPM+
[02:38:10] [PASSED] 13.01 Xe2_HPM
[02:38:10] [PASSED] 20.00 Xe2_LPM
[02:38:10] [PASSED] 30.00 Xe3_LPM
[02:38:10] [PASSED] 30.02 Xe3_LPM
[02:38:10] [PASSED] 35.00 Xe3p_LPM
[02:38:10] [PASSED] 35.03 Xe3p_HPM
[02:38:10] ================= [PASSED] check_media_ip ==================
[02:38:10] =================== check_platform_desc  ===================
[02:38:10] [PASSED] 0x9A60 (TIGERLAKE)
[02:38:10] [PASSED] 0x9A68 (TIGERLAKE)
[02:38:10] [PASSED] 0x9A70 (TIGERLAKE)
[02:38:10] [PASSED] 0x9A40 (TIGERLAKE)
[02:38:10] [PASSED] 0x9A49 (TIGERLAKE)
[02:38:10] [PASSED] 0x9A59 (TIGERLAKE)
[02:38:10] [PASSED] 0x9A78 (TIGERLAKE)
[02:38:10] [PASSED] 0x9AC0 (TIGERLAKE)
[02:38:10] [PASSED] 0x9AC9 (TIGERLAKE)
[02:38:10] [PASSED] 0x9AD9 (TIGERLAKE)
[02:38:10] [PASSED] 0x9AF8 (TIGERLAKE)
[02:38:10] [PASSED] 0x4C80 (ROCKETLAKE)
[02:38:10] [PASSED] 0x4C8A (ROCKETLAKE)
[02:38:10] [PASSED] 0x4C8B (ROCKETLAKE)
[02:38:10] [PASSED] 0x4C8C (ROCKETLAKE)
[02:38:10] [PASSED] 0x4C90 (ROCKETLAKE)
[02:38:10] [PASSED] 0x4C9A (ROCKETLAKE)
[02:38:10] [PASSED] 0x4680 (ALDERLAKE_S)
[02:38:10] [PASSED] 0x4682 (ALDERLAKE_S)
[02:38:10] [PASSED] 0x4688 (ALDERLAKE_S)
[02:38:10] [PASSED] 0x468A (ALDERLAKE_S)
[02:38:10] [PASSED] 0x468B (ALDERLAKE_S)
[02:38:10] [PASSED] 0x4690 (ALDERLAKE_S)
[02:38:10] [PASSED] 0x4692 (ALDERLAKE_S)
[02:38:10] [PASSED] 0x4693 (ALDERLAKE_S)
[02:38:10] [PASSED] 0x46A0 (ALDERLAKE_P)
[02:38:10] [PASSED] 0x46A1 (ALDERLAKE_P)
[02:38:10] [PASSED] 0x46A2 (ALDERLAKE_P)
[02:38:10] [PASSED] 0x46A3 (ALDERLAKE_P)
[02:38:10] [PASSED] 0x46A6 (ALDERLAKE_P)
[02:38:10] [PASSED] 0x46A8 (ALDERLAKE_P)
[02:38:10] [PASSED] 0x46AA (ALDERLAKE_P)
[02:38:10] [PASSED] 0x462A (ALDERLAKE_P)
[02:38:10] [PASSED] 0x4626 (ALDERLAKE_P)
[02:38:10] [PASSED] 0x4628 (ALDERLAKE_P)
[02:38:10] [PASSED] 0x46B0 (ALDERLAKE_P)
[02:38:10] [PASSED] 0x46B1 (ALDERLAKE_P)
[02:38:10] [PASSED] 0x46B2 (ALDERLAKE_P)
[02:38:10] [PASSED] 0x46B3 (ALDERLAKE_P)
[02:38:10] [PASSED] 0x46C0 (ALDERLAKE_P)
[02:38:10] [PASSED] 0x46C1 (ALDERLAKE_P)
[02:38:10] [PASSED] 0x46C2 (ALDERLAKE_P)
[02:38:10] [PASSED] 0x46C3 (ALDERLAKE_P)
[02:38:10] [PASSED] 0x46D0 (ALDERLAKE_N)
[02:38:10] [PASSED] 0x46D1 (ALDERLAKE_N)
[02:38:10] [PASSED] 0x46D2 (ALDERLAKE_N)
[02:38:10] [PASSED] 0x46D3 (ALDERLAKE_N)
[02:38:10] [PASSED] 0x46D4 (ALDERLAKE_N)
[02:38:10] [PASSED] 0xA721 (ALDERLAKE_P)
[02:38:10] [PASSED] 0xA7A1 (ALDERLAKE_P)
[02:38:10] [PASSED] 0xA7A9 (ALDERLAKE_P)
[02:38:10] [PASSED] 0xA7AC (ALDERLAKE_P)
[02:38:10] [PASSED] 0xA7AD (ALDERLAKE_P)
[02:38:10] [PASSED] 0xA720 (ALDERLAKE_P)
[02:38:10] [PASSED] 0xA7A0 (ALDERLAKE_P)
[02:38:10] [PASSED] 0xA7A8 (ALDERLAKE_P)
[02:38:10] [PASSED] 0xA7AA (ALDERLAKE_P)
[02:38:10] [PASSED] 0xA7AB (ALDERLAKE_P)
[02:38:10] [PASSED] 0xA780 (ALDERLAKE_S)
[02:38:10] [PASSED] 0xA781 (ALDERLAKE_S)
[02:38:10] [PASSED] 0xA782 (ALDERLAKE_S)
[02:38:10] [PASSED] 0xA783 (ALDERLAKE_S)
[02:38:10] [PASSED] 0xA788 (ALDERLAKE_S)
[02:38:10] [PASSED] 0xA789 (ALDERLAKE_S)
[02:38:10] [PASSED] 0xA78A (ALDERLAKE_S)
[02:38:10] [PASSED] 0xA78B (ALDERLAKE_S)
[02:38:10] [PASSED] 0x4905 (DG1)
[02:38:10] [PASSED] 0x4906 (DG1)
[02:38:10] [PASSED] 0x4907 (DG1)
[02:38:10] [PASSED] 0x4908 (DG1)
[02:38:10] [PASSED] 0x4909 (DG1)
[02:38:10] [PASSED] 0x56C0 (DG2)
[02:38:10] [PASSED] 0x56C2 (DG2)
[02:38:10] [PASSED] 0x56C1 (DG2)
[02:38:10] [PASSED] 0x7D51 (METEORLAKE)
[02:38:10] [PASSED] 0x7DD1 (METEORLAKE)
[02:38:10] [PASSED] 0x7D41 (METEORLAKE)
[02:38:10] [PASSED] 0x7D67 (METEORLAKE)
[02:38:10] [PASSED] 0xB640 (METEORLAKE)
[02:38:10] [PASSED] 0x56A0 (DG2)
[02:38:10] [PASSED] 0x56A1 (DG2)
[02:38:10] [PASSED] 0x56A2 (DG2)
[02:38:10] [PASSED] 0x56BE (DG2)
[02:38:10] [PASSED] 0x56BF (DG2)
[02:38:10] [PASSED] 0x5690 (DG2)
[02:38:10] [PASSED] 0x5691 (DG2)
[02:38:10] [PASSED] 0x5692 (DG2)
[02:38:10] [PASSED] 0x56A5 (DG2)
[02:38:10] [PASSED] 0x56A6 (DG2)
[02:38:10] [PASSED] 0x56B0 (DG2)
[02:38:10] [PASSED] 0x56B1 (DG2)
[02:38:10] [PASSED] 0x56BA (DG2)
[02:38:10] [PASSED] 0x56BB (DG2)
[02:38:10] [PASSED] 0x56BC (DG2)
[02:38:10] [PASSED] 0x56BD (DG2)
[02:38:10] [PASSED] 0x5693 (DG2)
[02:38:10] [PASSED] 0x5694 (DG2)
[02:38:10] [PASSED] 0x5695 (DG2)
[02:38:10] [PASSED] 0x56A3 (DG2)
[02:38:10] [PASSED] 0x56A4 (DG2)
[02:38:10] [PASSED] 0x56B2 (DG2)
[02:38:10] [PASSED] 0x56B3 (DG2)
[02:38:10] [PASSED] 0x5696 (DG2)
[02:38:10] [PASSED] 0x5697 (DG2)
[02:38:10] [PASSED] 0xB69 (PVC)
[02:38:10] [PASSED] 0xB6E (PVC)
[02:38:10] [PASSED] 0xBD4 (PVC)
[02:38:10] [PASSED] 0xBD5 (PVC)
[02:38:10] [PASSED] 0xBD6 (PVC)
[02:38:10] [PASSED] 0xBD7 (PVC)
[02:38:10] [PASSED] 0xBD8 (PVC)
[02:38:10] [PASSED] 0xBD9 (PVC)
[02:38:10] [PASSED] 0xBDA (PVC)
[02:38:10] [PASSED] 0xBDB (PVC)
[02:38:10] [PASSED] 0xBE0 (PVC)
[02:38:10] [PASSED] 0xBE1 (PVC)
[02:38:10] [PASSED] 0xBE5 (PVC)
[02:38:10] [PASSED] 0x7D40 (METEORLAKE)
[02:38:10] [PASSED] 0x7D45 (METEORLAKE)
[02:38:10] [PASSED] 0x7D55 (METEORLAKE)
[02:38:10] [PASSED] 0x7D60 (METEORLAKE)
[02:38:10] [PASSED] 0x7DD5 (METEORLAKE)
[02:38:10] [PASSED] 0x6420 (LUNARLAKE)
[02:38:10] [PASSED] 0x64A0 (LUNARLAKE)
[02:38:10] [PASSED] 0x64B0 (LUNARLAKE)
[02:38:10] [PASSED] 0xE202 (BATTLEMAGE)
[02:38:10] [PASSED] 0xE209 (BATTLEMAGE)
[02:38:10] [PASSED] 0xE20B (BATTLEMAGE)
[02:38:10] [PASSED] 0xE20C (BATTLEMAGE)
[02:38:10] [PASSED] 0xE20D (BATTLEMAGE)
[02:38:10] [PASSED] 0xE210 (BATTLEMAGE)
[02:38:10] [PASSED] 0xE211 (BATTLEMAGE)
[02:38:10] [PASSED] 0xE212 (BATTLEMAGE)
[02:38:10] [PASSED] 0xE216 (BATTLEMAGE)
[02:38:10] [PASSED] 0xE220 (BATTLEMAGE)
[02:38:10] [PASSED] 0xE221 (BATTLEMAGE)
[02:38:10] [PASSED] 0xE222 (BATTLEMAGE)
[02:38:10] [PASSED] 0xE223 (BATTLEMAGE)
[02:38:10] [PASSED] 0xB080 (PANTHERLAKE)
[02:38:10] [PASSED] 0xB081 (PANTHERLAKE)
[02:38:10] [PASSED] 0xB082 (PANTHERLAKE)
[02:38:10] [PASSED] 0xB083 (PANTHERLAKE)
[02:38:10] [PASSED] 0xB084 (PANTHERLAKE)
[02:38:10] [PASSED] 0xB085 (PANTHERLAKE)
[02:38:10] [PASSED] 0xB086 (PANTHERLAKE)
[02:38:10] [PASSED] 0xB087 (PANTHERLAKE)
[02:38:10] [PASSED] 0xB08F (PANTHERLAKE)
[02:38:10] [PASSED] 0xB090 (PANTHERLAKE)
[02:38:10] [PASSED] 0xB0A0 (PANTHERLAKE)
[02:38:10] [PASSED] 0xB0B0 (PANTHERLAKE)
[02:38:10] [PASSED] 0xFD80 (PANTHERLAKE)
[02:38:10] [PASSED] 0xFD81 (PANTHERLAKE)
[02:38:10] [PASSED] 0xD740 (NOVALAKE_S)
[02:38:10] [PASSED] 0xD741 (NOVALAKE_S)
[02:38:10] [PASSED] 0xD742 (NOVALAKE_S)
[02:38:10] [PASSED] 0xD743 (NOVALAKE_S)
[02:38:10] [PASSED] 0xD745 (NOVALAKE_S)
[02:38:10] [PASSED] 0xD74A (NOVALAKE_S)
[02:38:10] [PASSED] 0xD74B (NOVALAKE_S)
[02:38:10] [PASSED] 0x674C (CRESCENTISLAND)
[02:38:10] [PASSED] 0x674D (CRESCENTISLAND)
[02:38:10] [PASSED] 0x674E (CRESCENTISLAND)
[02:38:10] [PASSED] 0x674F (CRESCENTISLAND)
[02:38:10] [PASSED] 0x6750 (CRESCENTISLAND)
[02:38:10] [PASSED] 0xD750 (NOVALAKE_P)
[02:38:10] [PASSED] 0xD751 (NOVALAKE_P)
[02:38:10] [PASSED] 0xD752 (NOVALAKE_P)
[02:38:10] [PASSED] 0xD753 (NOVALAKE_P)
[02:38:10] [PASSED] 0xD754 (NOVALAKE_P)
[02:38:10] [PASSED] 0xD755 (NOVALAKE_P)
[02:38:10] [PASSED] 0xD756 (NOVALAKE_P)
[02:38:10] [PASSED] 0xD757 (NOVALAKE_P)
[02:38:10] [PASSED] 0xD75F (NOVALAKE_P)
[02:38:10] =============== [PASSED] check_platform_desc ===============
[02:38:10] ===================== [PASSED] xe_pci ======================
[02:38:10] ============= xe_rtp_tables_test (5 subtests) ==============
[02:38:10] ================== xe_rtp_table_gt_test  ===================
[02:38:10] [PASSED] gt_was/14011060649
[02:38:10] [PASSED] gt_was/14011059788
[02:38:10] [PASSED] gt_was/14015795083
[02:38:10] [PASSED] gt_was/16021867713
[02:38:10] [PASSED] gt_was/14019449301
[02:38:10] [PASSED] gt_was/16028005424
[02:38:10] [PASSED] gt_was/14026578760
[02:38:10] [PASSED] gt_was/1409420604
[02:38:10] [PASSED] gt_was/1408615072
[02:38:10] [PASSED] gt_was/22010523718
[02:38:10] [PASSED] gt_was/14011006942
[02:38:10] [PASSED] gt_was/14014830051
[02:38:10] [PASSED] gt_was/18018781329
[02:38:10] [PASSED] gt_was/1509235366
[02:38:10] [PASSED] gt_was/18018781329
[02:38:10] [PASSED] gt_was/16016694945
[02:38:10] [PASSED] gt_was/14018575942
[02:38:10] [PASSED] gt_was/22016670082
[02:38:10] [PASSED] gt_was/22016670082
[02:38:10] [PASSED] gt_was/14017421178
[02:38:10] [PASSED] gt_was/16025250150
[02:38:10] [PASSED] gt_was/14021871409
[02:38:10] [PASSED] gt_was/16021865536
[02:38:10] [PASSED] gt_was/14021486841
[02:38:10] [PASSED] gt_was/14025160223
[02:38:10] [PASSED] gt_was/14026144927, 16029437861, 14026127056
[02:38:10] [PASSED] gt_was/14025635424
[02:38:10] [PASSED] gt_was/16028005424
[02:38:10] ============== [PASSED] xe_rtp_table_gt_test ===============
[02:38:10] ================== xe_rtp_table_gt_test  ===================
[02:38:10] [PASSED] gt_tunings/Tuning: Blend Fill Caching Optimization Disable
[02:38:10] [PASSED] gt_tunings/Tuning: 32B Access Enable
[02:38:10] [PASSED] gt_tunings/Tuning: L3 cache
[02:38:10] [PASSED] gt_tunings/Tuning: L3 cache - media
[02:38:10] [PASSED] gt_tunings/Tuning: Compression Overfetch
[02:38:10] [PASSED] gt_tunings/Tuning: Compression Overfetch - media
[02:38:10] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3
[02:38:10] [PASSED] gt_tunings/Tuning: Enable compressible partial write overfetch in L3 - media
[02:38:10] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only
[02:38:10] [PASSED] gt_tunings/Tuning: L2 Overfetch Compressible Only - media
[02:38:10] [PASSED] gt_tunings/Tuning: Stateless compression control
[02:38:10] [PASSED] gt_tunings/Tuning: Stateless compression control - media
[02:38:10] [PASSED] gt_tunings/Tuning: L3 RW flush all Cache
[02:38:10] [PASSED] gt_tunings/Tuning: L3 RW flush all cache - media
[02:38:10] [PASSED] gt_tunings/Tuning: Set STLB Bank Hash Mode to 4KB
[02:38:10] ============== [PASSED] xe_rtp_table_gt_test ===============
[02:38:10] ================== xe_rtp_table_oob_test  ==================
[02:38:10] [PASSED] oob_was/1607983814
[02:38:10] [PASSED] oob_was/16010904313
[02:38:10] [PASSED] oob_was/18022495364
[02:38:10] [PASSED] oob_was/22012773006
[02:38:10] [PASSED] oob_was/14014475959
[02:38:10] [PASSED] oob_was/22011391025
[02:38:10] [PASSED] oob_was/22012727170
[02:38:10] [PASSED] oob_was/22012727685
[02:38:10] [PASSED] oob_was/22016596838
[02:38:10] [PASSED] oob_was/18020744125
[02:38:10] [PASSED] oob_was/1409600907
[02:38:10] [PASSED] oob_was/22014953428
[02:38:10] [PASSED] oob_was/16017236439
[02:38:10] [PASSED] oob_was/14019821291
[02:38:10] [PASSED] oob_was/14015076503
[02:38:10] [PASSED] oob_was/22016122933
[02:38:10] [PASSED] oob_was/14018913170
[02:38:10] [PASSED] oob_was/14018094691
[02:38:10] [PASSED] oob_was/18024947630
[02:38:10] [PASSED] oob_was/16022287689
[02:38:10] [PASSED] oob_was/13011645652
[02:38:10] [PASSED] oob_was/14022293748
[02:38:10] [PASSED] oob_was/22019794406
[02:38:10] [PASSED] oob_was/22019338487
[02:38:10] [PASSED] oob_was/16023588340
[02:38:10] [PASSED] oob_was/14019789679
[02:38:10] [PASSED] oob_was/14022866841
[02:38:10] [PASSED] oob_was/16021333562
[02:38:10] [PASSED] oob_was/14016712196
[02:38:10] [PASSED] oob_was/14015568240
[02:38:10] [PASSED] oob_was/18013179988
[02:38:10] [PASSED] oob_was/1508761755
[02:38:10] [PASSED] oob_was/16023105232
[02:38:10] [PASSED] oob_was/16026508708
[02:38:10] [PASSED] oob_was/14020001231
[02:38:10] [PASSED] oob_was/16023683509
[02:38:10] [PASSED] oob_was/14025515070
[02:38:10] [PASSED] oob_was/15015404425_disable
[02:38:10] [PASSED] oob_was/16026007364
[02:38:10] [PASSED] oob_was/14020316580
[02:38:10] [PASSED] oob_was/14025883347
[02:38:10] [PASSED] oob_was/16029380221
[02:38:10] [PASSED] oob_was/22022079272
[02:38:10] [PASSED] oob_was/16029897822
[02:38:10] [PASSED] oob_was/14027054324
[02:38:10] ============== [PASSED] xe_rtp_table_oob_test ==============
[02:38:10] ================ xe_rtp_table_dev_oob_test  ================
[02:38:10] [PASSED] device_oob_was/22010954014
[02:38:10] [PASSED] device_oob_was/15015404425
[02:38:10] [PASSED] device_oob_was/22019338487_display
[02:38:10] [PASSED] device_oob_was/14022085890
[02:38:10] [PASSED] device_oob_was/14026539277
[02:38:10] [PASSED] device_oob_was/14026633728
[02:38:10] [PASSED] device_oob_was/14026746987
[02:38:10] [PASSED] device_oob_was/14026779378
[02:38:10] ============ [PASSED] xe_rtp_table_dev_oob_test ============
[02:38:10] ========== xe_rtp_table_missing_upper_bound_test  ==========
[02:38:10] [PASSED] register_whitelist/WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865
[02:38:10] [PASSED] register_whitelist/1508744258, 14012131227, 1808121037
[02:38:10] [PASSED] register_whitelist/1806527549
[02:38:10] [PASSED] register_whitelist/allow_read_ctx_timestamp
[02:38:10] [PASSED] register_whitelist/allow_read_queue_timestamp
[02:38:10] [PASSED] register_whitelist/16014440446
[02:38:10] [PASSED] register_whitelist/16017236439
[02:38:10] [PASSED] register_whitelist/16020183090
[02:38:10] [PASSED] register_whitelist/14024997852
[02:38:10] [PASSED] register_whitelist/14024997852
[02:38:10] ====== [PASSED] xe_rtp_table_missing_upper_bound_test ======
[02:38:10] =============== [PASSED] xe_rtp_tables_test ================
[02:38:10] =================== xe_rtp (3 subtests) ====================
[02:38:10] =================== xe_rtp_rules_tests  ====================
[02:38:10] [PASSED] no
[02:38:10] [PASSED] yes
[02:38:10] [PASSED] no-and-no
[02:38:10] [PASSED] no-and-yes
[02:38:10] [PASSED] yes-and-no
[02:38:10] [PASSED] yes-and-yes
[02:38:10] [PASSED] no-or-no
[02:38:10] [PASSED] no-or-yes
[02:38:10] [PASSED] yes-or-no
[02:38:10] [PASSED] yes-or-yes
[02:38:10] [PASSED] no-yes-or-yes-no
[02:38:10] [PASSED] no-yes-or-yes-yes
[02:38:10] [PASSED] yes-yes-or-no-yes
[02:38:10] [PASSED] yes-yes-or-yes-yes
[02:38:10] [PASSED] no-no-or-yes-or-no
[02:38:10] [PASSED] or
[02:38:10] [PASSED] or-yes
[02:38:10] [PASSED] or-no
[02:38:10] [PASSED] yes-or
[02:38:10] [PASSED] no-or
[02:38:10] [PASSED] no-or-or-yes
[02:38:10] [PASSED] yes-or-or-no
[02:38:10] [PASSED] no-or-or-no
[02:38:10] [PASSED] missing-context-engine-class
[02:38:10] [PASSED] missing-context-engine-class-or-yes
[02:38:10] [PASSED] missing-context-engine-class-or-or-yes
[02:38:10] =============== [PASSED] xe_rtp_rules_tests ================
[02:38:10] =============== xe_rtp_process_to_sr_tests  ================
[02:38:10] [PASSED] coalesce-same-reg
[02:38:10] [PASSED] coalesce-same-reg-literal-and-func
[02:38:10] [PASSED] no-match-no-add
[02:38:10] [PASSED] two-regs-two-entries
[02:38:10] [PASSED] clr-one-set-other
[02:38:10] [PASSED] set-field
[02:38:10] [PASSED] conflict-duplicate
[02:38:10] [PASSED] conflict-not-disjoint
[02:38:10] [PASSED] conflict-not-disjoint-literal-and-func
[02:38:10] [PASSED] conflict-reg-type
[02:38:10] [PASSED] bad-mcr-reg-forced-to-regular
[02:38:10] [PASSED] bad-regular-reg-forced-to-mcr
[02:38:10] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[02:38:10] ================== xe_rtp_process_tests  ===================
[02:38:10] [PASSED] active1
[02:38:10] [PASSED] active2
[02:38:10] [PASSED] active-inactive
[02:38:10] [PASSED] inactive-active
[02:38:10] [PASSED] inactive-active-inactive
[02:38:10] [PASSED] inactive-inactive-inactive
[02:38:10] ============== [PASSED] xe_rtp_process_tests ===============
[02:38:10] ===================== [PASSED] xe_rtp ======================
[02:38:10] ==================== xe_wa (1 subtest) =====================
[02:38:10] ======================== xe_wa_gt  =========================
[02:38:10] [PASSED] TIGERLAKE B0
[02:38:10] [PASSED] DG1 A0
[02:38:10] [PASSED] DG1 B0
[02:38:10] [PASSED] ALDERLAKE_S A0
[02:38:10] [PASSED] ALDERLAKE_S B0
[02:38:10] [PASSED] ALDERLAKE_S C0
[02:38:10] [PASSED] ALDERLAKE_S D0
[02:38:10] [PASSED] ALDERLAKE_P A0
[02:38:10] [PASSED] ALDERLAKE_P B0
[02:38:10] [PASSED] ALDERLAKE_P C0
[02:38:10] [PASSED] ALDERLAKE_S RPLS D0
[02:38:10] [PASSED] ALDERLAKE_P RPLU E0
[02:38:10] [PASSED] DG2 G10 C0
[02:38:10] [PASSED] DG2 G11 B1
[02:38:10] [PASSED] DG2 G12 A1
[02:38:10] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[02:38:10] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[02:38:10] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[02:38:10] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[02:38:10] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[02:38:10] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[02:38:10] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[02:38:10] ==================== [PASSED] xe_wa_gt =====================
[02:38:10] ====================== [PASSED] xe_wa ======================
[02:38:10] ============================================================
[02:38:10] Testing complete. Ran 743 tests: passed: 725, skipped: 18
[02:38:10] Elapsed time: 35.714s total, 1.738s configuring, 33.310s building, 0.631s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[02:38:10] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:38:12] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[02:38:36] Starting KUnit Kernel (1/1)...
[02:38:36] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[02:38:36] ============ drm_test_pick_cmdline (2 subtests) ============
[02:38:36] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[02:38:36] =============== drm_test_pick_cmdline_named  ===============
[02:38:36] [PASSED] NTSC
[02:38:36] [PASSED] NTSC-J
[02:38:36] [PASSED] PAL
[02:38:36] [PASSED] PAL-M
[02:38:36] =========== [PASSED] drm_test_pick_cmdline_named ===========
[02:38:36] ============== [PASSED] drm_test_pick_cmdline ==============
[02:38:36] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[02:38:36] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[02:38:36] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[02:38:36] =========== drm_validate_clone_mode (2 subtests) ===========
[02:38:36] ============== drm_test_check_in_clone_mode  ===============
[02:38:36] [PASSED] in_clone_mode
[02:38:36] [PASSED] not_in_clone_mode
[02:38:36] ========== [PASSED] drm_test_check_in_clone_mode ===========
[02:38:36] =============== drm_test_check_valid_clones  ===============
[02:38:36] [PASSED] not_in_clone_mode
[02:38:36] [PASSED] valid_clone
[02:38:36] [PASSED] invalid_clone
[02:38:36] =========== [PASSED] drm_test_check_valid_clones ===========
[02:38:36] ============= [PASSED] drm_validate_clone_mode =============
[02:38:36] ============= drm_validate_modeset (1 subtest) =============
[02:38:36] [PASSED] drm_test_check_connector_changed_modeset
[02:38:36] ============== [PASSED] drm_validate_modeset ===============
[02:38:36] ====== drm_test_bridge_get_current_state (1 subtest) =======
[02:38:36] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[02:38:36] ======== [PASSED] drm_test_bridge_get_current_state ========
[02:38:36] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[02:38:36] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[02:38:36] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[02:38:36] [PASSED] drm_test_drm_bridge_helper_hdmi_output_bus_fmts
[02:38:36] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[02:38:36] ============== drm_bridge_alloc (2 subtests) ===============
[02:38:36] [PASSED] drm_test_drm_bridge_alloc_basic
[02:38:36] [PASSED] drm_test_drm_bridge_alloc_get_put
[02:38:36] ================ [PASSED] drm_bridge_alloc =================
[02:38:36] ============= drm_bridge_bus_fmt (5 subtests) ==============
[02:38:36] [PASSED] drm_test_bridge_rgb_yuv_rgb
[02:38:36] [PASSED] drm_test_bridge_must_convert_to_yuv444
[02:38:36] [PASSED] drm_test_bridge_hdmi_auto_rgb
[02:38:36] [PASSED] drm_test_bridge_auto_first
[02:38:36] [PASSED] drm_test_bridge_rgb_yuv_no_path
[02:38:36] =============== [PASSED] drm_bridge_bus_fmt ================
[02:38:36] ============= drm_cmdline_parser (40 subtests) =============
[02:38:36] [PASSED] drm_test_cmdline_force_d_only
[02:38:36] [PASSED] drm_test_cmdline_force_D_only_dvi
[02:38:36] [PASSED] drm_test_cmdline_force_D_only_hdmi
[02:38:36] [PASSED] drm_test_cmdline_force_D_only_not_digital
[02:38:36] [PASSED] drm_test_cmdline_force_e_only
[02:38:36] [PASSED] drm_test_cmdline_res
[02:38:36] [PASSED] drm_test_cmdline_res_vesa
[02:38:36] [PASSED] drm_test_cmdline_res_vesa_rblank
[02:38:36] [PASSED] drm_test_cmdline_res_rblank
[02:38:36] [PASSED] drm_test_cmdline_res_bpp
[02:38:36] [PASSED] drm_test_cmdline_res_refresh
[02:38:36] [PASSED] drm_test_cmdline_res_bpp_refresh
[02:38:36] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[02:38:36] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[02:38:36] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[02:38:36] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[02:38:36] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[02:38:36] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[02:38:36] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[02:38:36] [PASSED] drm_test_cmdline_res_margins_force_on
[02:38:36] [PASSED] drm_test_cmdline_res_vesa_margins
[02:38:36] [PASSED] drm_test_cmdline_name
[02:38:36] [PASSED] drm_test_cmdline_name_bpp
[02:38:36] [PASSED] drm_test_cmdline_name_option
[02:38:36] [PASSED] drm_test_cmdline_name_bpp_option
[02:38:36] [PASSED] drm_test_cmdline_rotate_0
[02:38:36] [PASSED] drm_test_cmdline_rotate_90
[02:38:36] [PASSED] drm_test_cmdline_rotate_180
[02:38:36] [PASSED] drm_test_cmdline_rotate_270
[02:38:36] [PASSED] drm_test_cmdline_hmirror
[02:38:36] [PASSED] drm_test_cmdline_vmirror
[02:38:36] [PASSED] drm_test_cmdline_margin_options
[02:38:36] [PASSED] drm_test_cmdline_multiple_options
[02:38:36] [PASSED] drm_test_cmdline_bpp_extra_and_option
[02:38:36] [PASSED] drm_test_cmdline_extra_and_option
[02:38:36] [PASSED] drm_test_cmdline_freestanding_options
[02:38:36] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[02:38:36] [PASSED] drm_test_cmdline_panel_orientation
[02:38:36] ================ drm_test_cmdline_invalid  =================
[02:38:36] [PASSED] margin_only
[02:38:36] [PASSED] interlace_only
[02:38:36] [PASSED] res_missing_x
[02:38:36] [PASSED] res_missing_y
[02:38:36] [PASSED] res_bad_y
[02:38:36] [PASSED] res_missing_y_bpp
[02:38:36] [PASSED] res_bad_bpp
[02:38:36] [PASSED] res_bad_refresh
[02:38:36] [PASSED] res_bpp_refresh_force_on_off
[02:38:36] [PASSED] res_invalid_mode
[02:38:36] [PASSED] res_bpp_wrong_place_mode
[02:38:36] [PASSED] name_bpp_refresh
[02:38:36] [PASSED] name_refresh
[02:38:36] [PASSED] name_refresh_wrong_mode
[02:38:36] [PASSED] name_refresh_invalid_mode
[02:38:36] [PASSED] rotate_multiple
[02:38:36] [PASSED] rotate_invalid_val
[02:38:36] [PASSED] rotate_truncated
[02:38:36] [PASSED] invalid_option
[02:38:36] [PASSED] invalid_tv_option
[02:38:36] [PASSED] truncated_tv_option
[02:38:36] ============ [PASSED] drm_test_cmdline_invalid =============
[02:38:36] =============== drm_test_cmdline_tv_options  ===============
[02:38:36] [PASSED] NTSC
[02:38:36] [PASSED] NTSC_443
[02:38:36] [PASSED] NTSC_J
[02:38:36] [PASSED] PAL
[02:38:36] [PASSED] PAL_M
[02:38:36] [PASSED] PAL_N
[02:38:36] [PASSED] SECAM
[02:38:36] [PASSED] MONO_525
[02:38:36] [PASSED] MONO_625
[02:38:36] =========== [PASSED] drm_test_cmdline_tv_options ===========
[02:38:36] =============== [PASSED] drm_cmdline_parser ================
[02:38:36] ========== drmm_connector_hdmi_init (20 subtests) ==========
[02:38:36] [PASSED] drm_test_connector_hdmi_init_valid
[02:38:36] [PASSED] drm_test_connector_hdmi_init_bpc_8
[02:38:36] [PASSED] drm_test_connector_hdmi_init_bpc_10
[02:38:36] [PASSED] drm_test_connector_hdmi_init_bpc_12
[02:38:36] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[02:38:36] [PASSED] drm_test_connector_hdmi_init_bpc_null
[02:38:36] [PASSED] drm_test_connector_hdmi_init_formats_empty
[02:38:36] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[02:38:36] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[02:38:36] [PASSED] supported_formats=0x9 yuv420_allowed=1
[02:38:36] [PASSED] supported_formats=0x9 yuv420_allowed=0
[02:38:36] [PASSED] supported_formats=0x5 yuv420_allowed=1
[02:38:36] [PASSED] supported_formats=0x5 yuv420_allowed=0
[02:38:36] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[02:38:36] [PASSED] drm_test_connector_hdmi_init_null_ddc
[02:38:36] [PASSED] drm_test_connector_hdmi_init_null_product
[02:38:36] [PASSED] drm_test_connector_hdmi_init_null_vendor
[02:38:36] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[02:38:36] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[02:38:36] [PASSED] drm_test_connector_hdmi_init_product_valid
[02:38:36] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[02:38:36] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[02:38:36] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[02:38:36] ========= drm_test_connector_hdmi_init_type_valid  =========
[02:38:36] [PASSED] HDMI-A
[02:38:36] [PASSED] HDMI-B
[02:38:36] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[02:38:36] ======== drm_test_connector_hdmi_init_type_invalid  ========
[02:38:36] [PASSED] Unknown
[02:38:36] [PASSED] VGA
[02:38:36] [PASSED] DVI-I
[02:38:36] [PASSED] DVI-D
[02:38:36] [PASSED] DVI-A
[02:38:36] [PASSED] Composite
[02:38:36] [PASSED] SVIDEO
[02:38:36] [PASSED] LVDS
[02:38:36] [PASSED] Component
[02:38:36] [PASSED] DIN
[02:38:36] [PASSED] DP
[02:38:36] [PASSED] TV
[02:38:36] [PASSED] eDP
[02:38:36] [PASSED] Virtual
[02:38:36] [PASSED] DSI
[02:38:36] [PASSED] DPI
[02:38:36] [PASSED] Writeback
[02:38:36] [PASSED] SPI
[02:38:36] [PASSED] USB
[02:38:36] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[02:38:36] ============ [PASSED] drmm_connector_hdmi_init =============
[02:38:36] ============= drmm_connector_init (3 subtests) =============
[02:38:36] [PASSED] drm_test_drmm_connector_init
[02:38:36] [PASSED] drm_test_drmm_connector_init_null_ddc
[02:38:36] ========= drm_test_drmm_connector_init_type_valid  =========
[02:38:36] [PASSED] Unknown
[02:38:36] [PASSED] VGA
[02:38:36] [PASSED] DVI-I
[02:38:36] [PASSED] DVI-D
[02:38:36] [PASSED] DVI-A
[02:38:36] [PASSED] Composite
[02:38:36] [PASSED] SVIDEO
[02:38:36] [PASSED] LVDS
[02:38:36] [PASSED] Component
[02:38:36] [PASSED] DIN
[02:38:36] [PASSED] DP
[02:38:36] [PASSED] HDMI-A
[02:38:36] [PASSED] HDMI-B
[02:38:36] [PASSED] TV
[02:38:36] [PASSED] eDP
[02:38:36] [PASSED] Virtual
[02:38:36] [PASSED] DSI
[02:38:36] [PASSED] DPI
[02:38:36] [PASSED] Writeback
[02:38:36] [PASSED] SPI
[02:38:36] [PASSED] USB
[02:38:36] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[02:38:36] =============== [PASSED] drmm_connector_init ===============
[02:38:36] ========= drm_connector_dynamic_init (6 subtests) ==========
[02:38:36] [PASSED] drm_test_drm_connector_dynamic_init
[02:38:36] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[02:38:36] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[02:38:36] [PASSED] drm_test_drm_connector_dynamic_init_properties
[02:38:36] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[02:38:36] [PASSED] Unknown
[02:38:36] [PASSED] VGA
[02:38:36] [PASSED] DVI-I
[02:38:36] [PASSED] DVI-D
[02:38:36] [PASSED] DVI-A
[02:38:36] [PASSED] Composite
[02:38:36] [PASSED] SVIDEO
[02:38:36] [PASSED] LVDS
[02:38:36] [PASSED] Component
[02:38:36] [PASSED] DIN
[02:38:36] [PASSED] DP
[02:38:36] [PASSED] HDMI-A
[02:38:36] [PASSED] HDMI-B
[02:38:36] [PASSED] TV
[02:38:36] [PASSED] eDP
[02:38:36] [PASSED] Virtual
[02:38:36] [PASSED] DSI
[02:38:36] [PASSED] DPI
[02:38:36] [PASSED] Writeback
[02:38:36] [PASSED] SPI
[02:38:36] [PASSED] USB
[02:38:36] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[02:38:36] ======== drm_test_drm_connector_dynamic_init_name  =========
[02:38:36] [PASSED] Unknown
[02:38:36] [PASSED] VGA
[02:38:36] [PASSED] DVI-I
[02:38:36] [PASSED] DVI-D
[02:38:36] [PASSED] DVI-A
[02:38:36] [PASSED] Composite
[02:38:36] [PASSED] SVIDEO
[02:38:36] [PASSED] LVDS
[02:38:36] [PASSED] Component
[02:38:36] [PASSED] DIN
[02:38:36] [PASSED] DP
[02:38:36] [PASSED] HDMI-A
[02:38:36] [PASSED] HDMI-B
[02:38:36] [PASSED] TV
[02:38:36] [PASSED] eDP
[02:38:36] [PASSED] Virtual
[02:38:36] [PASSED] DSI
[02:38:36] [PASSED] DPI
[02:38:36] [PASSED] Writeback
[02:38:36] [PASSED] SPI
[02:38:36] [PASSED] USB
[02:38:36] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[02:38:36] =========== [PASSED] drm_connector_dynamic_init ============
[02:38:36] ==== drm_connector_dynamic_register_early (4 subtests) =====
[02:38:36] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[02:38:36] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[02:38:36] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[02:38:36] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[02:38:36] ====== [PASSED] drm_connector_dynamic_register_early =======
[02:38:36] ======= drm_connector_dynamic_register (7 subtests) ========
[02:38:36] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[02:38:36] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[02:38:36] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[02:38:36] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[02:38:36] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[02:38:36] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[02:38:36] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[02:38:36] ========= [PASSED] drm_connector_dynamic_register ==========
[02:38:36] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[02:38:36] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[02:38:36] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[02:38:36] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[02:38:36] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[02:38:36] ========== drm_test_get_tv_mode_from_name_valid  ===========
[02:38:36] [PASSED] NTSC
[02:38:36] [PASSED] NTSC-443
[02:38:36] [PASSED] NTSC-J
[02:38:36] [PASSED] PAL
[02:38:36] [PASSED] PAL-M
[02:38:36] [PASSED] PAL-N
[02:38:36] [PASSED] SECAM
[02:38:36] [PASSED] Mono
[02:38:36] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[02:38:36] [PASSED] drm_test_get_tv_mode_from_name_truncated
[02:38:36] ============ [PASSED] drm_get_tv_mode_from_name ============
[02:38:36] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[02:38:36] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[02:38:36] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[02:38:36] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[02:38:36] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[02:38:36] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[02:38:36] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[02:38:36] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[02:38:36] [PASSED] VIC 96
[02:38:36] [PASSED] VIC 97
[02:38:36] [PASSED] VIC 101
[02:38:36] [PASSED] VIC 102
[02:38:36] [PASSED] VIC 106
[02:38:36] [PASSED] VIC 107
[02:38:36] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[02:38:36] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[02:38:36] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[02:38:36] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[02:38:36] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[02:38:36] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[02:38:36] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[02:38:36] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[02:38:36] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[02:38:36] [PASSED] Automatic
[02:38:36] [PASSED] Full
[02:38:36] [PASSED] Limited 16:235
[02:38:36] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[02:38:36] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[02:38:36] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[02:38:36] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[02:38:36] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[02:38:36] [PASSED] RGB
[02:38:36] [PASSED] YUV 4:2:0
[02:38:36] [PASSED] YUV 4:2:2
[02:38:36] [PASSED] YUV 4:4:4
[02:38:36] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[02:38:36] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[02:38:36] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[02:38:36] ============= drm_damage_helper (21 subtests) ==============
[02:38:36] [PASSED] drm_test_damage_iter_no_damage
[02:38:36] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[02:38:36] [PASSED] drm_test_damage_iter_no_damage_src_moved
[02:38:36] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[02:38:36] [PASSED] drm_test_damage_iter_no_damage_not_visible
[02:38:36] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[02:38:36] [PASSED] drm_test_damage_iter_no_damage_no_fb
[02:38:36] [PASSED] drm_test_damage_iter_simple_damage
[02:38:36] [PASSED] drm_test_damage_iter_single_damage
[02:38:36] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[02:38:36] [PASSED] drm_test_damage_iter_single_damage_outside_src
[02:38:36] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[02:38:36] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[02:38:36] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[02:38:36] [PASSED] drm_test_damage_iter_single_damage_src_moved
[02:38:36] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[02:38:36] [PASSED] drm_test_damage_iter_damage
[02:38:36] [PASSED] drm_test_damage_iter_damage_one_intersect
[02:38:36] [PASSED] drm_test_damage_iter_damage_one_outside
[02:38:36] [PASSED] drm_test_damage_iter_damage_src_moved
[02:38:36] [PASSED] drm_test_damage_iter_damage_not_visible
[02:38:36] ================ [PASSED] drm_damage_helper ================
[02:38:36] ============== drm_dp_mst_helper (3 subtests) ==============
[02:38:36] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[02:38:36] [PASSED] Clock 154000 BPP 30 DSC disabled
[02:38:36] [PASSED] Clock 234000 BPP 30 DSC disabled
[02:38:36] [PASSED] Clock 297000 BPP 24 DSC disabled
[02:38:36] [PASSED] Clock 332880 BPP 24 DSC enabled
[02:38:36] [PASSED] Clock 324540 BPP 24 DSC enabled
[02:38:36] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[02:38:36] ============== drm_test_dp_mst_calc_pbn_div  ===============
[02:38:36] [PASSED] Link rate 2000000 lane count 4
[02:38:36] [PASSED] Link rate 2000000 lane count 2
[02:38:36] [PASSED] Link rate 2000000 lane count 1
[02:38:36] [PASSED] Link rate 1350000 lane count 4
[02:38:36] [PASSED] Link rate 1350000 lane count 2
[02:38:36] [PASSED] Link rate 1350000 lane count 1
[02:38:36] [PASSED] Link rate 1000000 lane count 4
[02:38:36] [PASSED] Link rate 1000000 lane count 2
[02:38:36] [PASSED] Link rate 1000000 lane count 1
[02:38:36] [PASSED] Link rate 810000 lane count 4
[02:38:36] [PASSED] Link rate 810000 lane count 2
[02:38:36] [PASSED] Link rate 810000 lane count 1
[02:38:36] [PASSED] Link rate 540000 lane count 4
[02:38:36] [PASSED] Link rate 540000 lane count 2
[02:38:36] [PASSED] Link rate 540000 lane count 1
[02:38:36] [PASSED] Link rate 270000 lane count 4
[02:38:36] [PASSED] Link rate 270000 lane count 2
[02:38:36] [PASSED] Link rate 270000 lane count 1
[02:38:36] [PASSED] Link rate 162000 lane count 4
[02:38:36] [PASSED] Link rate 162000 lane count 2
[02:38:36] [PASSED] Link rate 162000 lane count 1
[02:38:36] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[02:38:36] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[02:38:36] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[02:38:36] [PASSED] DP_POWER_UP_PHY with port number
[02:38:36] [PASSED] DP_POWER_DOWN_PHY with port number
[02:38:36] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[02:38:36] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[02:38:36] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[02:38:36] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[02:38:36] [PASSED] DP_QUERY_PAYLOAD with port number
[02:38:36] [PASSED] DP_QUERY_PAYLOAD with VCPI
[02:38:36] [PASSED] DP_REMOTE_DPCD_READ with port number
[02:38:36] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[02:38:36] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[02:38:36] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[02:38:36] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[02:38:36] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[02:38:36] [PASSED] DP_REMOTE_I2C_READ with port number
[02:38:36] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[02:38:36] [PASSED] DP_REMOTE_I2C_READ with transactions array
[02:38:36] [PASSED] DP_REMOTE_I2C_WRITE with port number
[02:38:36] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[02:38:36] [PASSED] DP_REMOTE_I2C_WRITE with data array
[02:38:36] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[02:38:36] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[02:38:36] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[02:38:36] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[02:38:36] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[02:38:36] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[02:38:36] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[02:38:36] ================ [PASSED] drm_dp_mst_helper ================
[02:38:36] ================== drm_exec (7 subtests) ===================
[02:38:36] [PASSED] sanitycheck
[02:38:36] [PASSED] test_lock
[02:38:36] [PASSED] test_lock_unlock
[02:38:36] [PASSED] test_duplicates
[02:38:36] [PASSED] test_prepare
[02:38:36] [PASSED] test_prepare_array
[02:38:36] [PASSED] test_multiple_loops
[02:38:36] ==================== [PASSED] drm_exec =====================
[02:38:36] =========== drm_format_helper_test (17 subtests) ===========
[02:38:36] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[02:38:36] [PASSED] single_pixel_source_buffer
[02:38:36] [PASSED] single_pixel_clip_rectangle
[02:38:36] [PASSED] well_known_colors
[02:38:36] [PASSED] destination_pitch
[02:38:36] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[02:38:36] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[02:38:36] [PASSED] single_pixel_source_buffer
[02:38:36] [PASSED] single_pixel_clip_rectangle
[02:38:36] [PASSED] well_known_colors
[02:38:36] [PASSED] destination_pitch
[02:38:36] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[02:38:36] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[02:38:36] [PASSED] single_pixel_source_buffer
[02:38:36] [PASSED] single_pixel_clip_rectangle
[02:38:36] [PASSED] well_known_colors
[02:38:36] [PASSED] destination_pitch
[02:38:36] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[02:38:36] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[02:38:36] [PASSED] single_pixel_source_buffer
[02:38:36] [PASSED] single_pixel_clip_rectangle
[02:38:36] [PASSED] well_known_colors
[02:38:36] [PASSED] destination_pitch
[02:38:36] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[02:38:36] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[02:38:36] [PASSED] single_pixel_source_buffer
[02:38:36] [PASSED] single_pixel_clip_rectangle
[02:38:36] [PASSED] well_known_colors
[02:38:36] [PASSED] destination_pitch
[02:38:36] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[02:38:36] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[02:38:36] [PASSED] single_pixel_source_buffer
[02:38:36] [PASSED] single_pixel_clip_rectangle
[02:38:36] [PASSED] well_known_colors
[02:38:36] [PASSED] destination_pitch
[02:38:36] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[02:38:36] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[02:38:36] [PASSED] single_pixel_source_buffer
[02:38:36] [PASSED] single_pixel_clip_rectangle
[02:38:36] [PASSED] well_known_colors
[02:38:36] [PASSED] destination_pitch
[02:38:36] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[02:38:36] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[02:38:36] [PASSED] single_pixel_source_buffer
[02:38:36] [PASSED] single_pixel_clip_rectangle
[02:38:36] [PASSED] well_known_colors
[02:38:36] [PASSED] destination_pitch
[02:38:36] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[02:38:36] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[02:38:36] [PASSED] single_pixel_source_buffer
[02:38:36] [PASSED] single_pixel_clip_rectangle
[02:38:36] [PASSED] well_known_colors
[02:38:36] [PASSED] destination_pitch
[02:38:36] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[02:38:36] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[02:38:36] [PASSED] single_pixel_source_buffer
[02:38:36] [PASSED] single_pixel_clip_rectangle
[02:38:36] [PASSED] well_known_colors
[02:38:36] [PASSED] destination_pitch
[02:38:36] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[02:38:36] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[02:38:36] [PASSED] single_pixel_source_buffer
[02:38:36] [PASSED] single_pixel_clip_rectangle
[02:38:36] [PASSED] well_known_colors
[02:38:36] [PASSED] destination_pitch
[02:38:36] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[02:38:36] ============== drm_test_fb_xrgb8888_to_mono  ===============
[02:38:36] [PASSED] single_pixel_source_buffer
[02:38:36] [PASSED] single_pixel_clip_rectangle
[02:38:36] [PASSED] well_known_colors
[02:38:36] [PASSED] destination_pitch
[02:38:36] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[02:38:36] ==================== drm_test_fb_swab  =====================
[02:38:36] [PASSED] single_pixel_source_buffer
[02:38:36] [PASSED] single_pixel_clip_rectangle
[02:38:36] [PASSED] well_known_colors
[02:38:36] [PASSED] destination_pitch
[02:38:36] ================ [PASSED] drm_test_fb_swab =================
[02:38:36] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[02:38:36] [PASSED] single_pixel_source_buffer
[02:38:36] [PASSED] single_pixel_clip_rectangle
[02:38:36] [PASSED] well_known_colors
[02:38:36] [PASSED] destination_pitch
[02:38:36] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[02:38:36] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[02:38:36] [PASSED] single_pixel_source_buffer
[02:38:36] [PASSED] single_pixel_clip_rectangle
[02:38:36] [PASSED] well_known_colors
[02:38:36] [PASSED] destination_pitch
[02:38:36] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[02:38:36] ================= drm_test_fb_clip_offset  =================
[02:38:36] [PASSED] pass through
[02:38:36] [PASSED] horizontal offset
[02:38:36] [PASSED] vertical offset
[02:38:36] [PASSED] horizontal and vertical offset
[02:38:36] [PASSED] horizontal offset (custom pitch)
[02:38:36] [PASSED] vertical offset (custom pitch)
[02:38:36] [PASSED] horizontal and vertical offset (custom pitch)
[02:38:36] ============= [PASSED] drm_test_fb_clip_offset =============
[02:38:36] =================== drm_test_fb_memcpy  ====================
[02:38:36] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[02:38:36] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[02:38:36] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[02:38:36] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[02:38:36] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[02:38:36] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[02:38:36] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[02:38:36] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[02:38:36] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[02:38:36] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[02:38:36] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[02:38:36] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[02:38:36] =============== [PASSED] drm_test_fb_memcpy ================
[02:38:36] ============= [PASSED] drm_format_helper_test ==============
[02:38:36] ================= drm_format (18 subtests) =================
[02:38:36] [PASSED] drm_test_format_block_width_invalid
[02:38:36] [PASSED] drm_test_format_block_width_one_plane
[02:38:36] [PASSED] drm_test_format_block_width_two_plane
[02:38:36] [PASSED] drm_test_format_block_width_three_plane
[02:38:36] [PASSED] drm_test_format_block_width_tiled
[02:38:36] [PASSED] drm_test_format_block_height_invalid
[02:38:36] [PASSED] drm_test_format_block_height_one_plane
[02:38:36] [PASSED] drm_test_format_block_height_two_plane
[02:38:36] [PASSED] drm_test_format_block_height_three_plane
[02:38:36] [PASSED] drm_test_format_block_height_tiled
[02:38:36] [PASSED] drm_test_format_min_pitch_invalid
[02:38:36] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[02:38:36] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[02:38:36] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[02:38:36] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[02:38:36] [PASSED] drm_test_format_min_pitch_two_plane
[02:38:36] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[02:38:36] [PASSED] drm_test_format_min_pitch_tiled
[02:38:36] =================== [PASSED] drm_format ====================
[02:38:36] ============== drm_framebuffer (10 subtests) ===============
[02:38:36] ========== drm_test_framebuffer_check_src_coords  ==========
[02:38:36] [PASSED] Success: source fits into fb
[02:38:36] [PASSED] Fail: overflowing fb with x-axis coordinate
[02:38:36] [PASSED] Fail: overflowing fb with y-axis coordinate
[02:38:36] [PASSED] Fail: overflowing fb with source width
[02:38:36] [PASSED] Fail: overflowing fb with source height
[02:38:36] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[02:38:36] [PASSED] drm_test_framebuffer_cleanup
[02:38:36] =============== drm_test_framebuffer_create  ===============
[02:38:36] [PASSED] ABGR8888 normal sizes
[02:38:36] [PASSED] ABGR8888 max sizes
[02:38:36] [PASSED] ABGR8888 pitch greater than min required
[02:38:36] [PASSED] ABGR8888 pitch less than min required
[02:38:36] [PASSED] ABGR8888 Invalid width
[02:38:36] [PASSED] ABGR8888 Invalid buffer handle
[02:38:36] [PASSED] No pixel format
[02:38:36] [PASSED] ABGR8888 Width 0
[02:38:36] [PASSED] ABGR8888 Height 0
[02:38:36] [PASSED] ABGR8888 Out of bound height * pitch combination
[02:38:36] [PASSED] ABGR8888 Large buffer offset
[02:38:36] [PASSED] ABGR8888 Buffer offset for inexistent plane
[02:38:36] [PASSED] ABGR8888 Invalid flag
[02:38:36] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[02:38:36] [PASSED] ABGR8888 Valid buffer modifier
[02:38:36] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[02:38:36] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[02:38:36] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[02:38:36] [PASSED] NV12 Normal sizes
[02:38:36] [PASSED] NV12 Max sizes
[02:38:36] [PASSED] NV12 Invalid pitch
[02:38:36] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[02:38:36] [PASSED] NV12 different  modifier per-plane
[02:38:36] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[02:38:36] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[02:38:36] [PASSED] NV12 Modifier for inexistent plane
[02:38:36] [PASSED] NV12 Handle for inexistent plane
[02:38:36] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[02:38:36] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[02:38:36] [PASSED] YVU420 Normal sizes
[02:38:36] [PASSED] YVU420 Max sizes
[02:38:36] [PASSED] YVU420 Invalid pitch
[02:38:36] [PASSED] YVU420 Different pitches
[02:38:36] [PASSED] YVU420 Different buffer offsets/pitches
[02:38:36] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[02:38:36] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[02:38:36] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[02:38:36] [PASSED] YVU420 Valid modifier
[02:38:36] [PASSED] YVU420 Different modifiers per plane
[02:38:36] [PASSED] YVU420 Modifier for inexistent plane
[02:38:36] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[02:38:36] [PASSED] X0L2 Normal sizes
[02:38:36] [PASSED] X0L2 Max sizes
[02:38:36] [PASSED] X0L2 Invalid pitch
[02:38:36] [PASSED] X0L2 Pitch greater than minimum required
[02:38:36] [PASSED] X0L2 Handle for inexistent plane
[02:38:36] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[02:38:36] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[02:38:36] [PASSED] X0L2 Valid modifier
[02:38:36] [PASSED] X0L2 Modifier for inexistent plane
[02:38:36] =========== [PASSED] drm_test_framebuffer_create ===========
[02:38:36] [PASSED] drm_test_framebuffer_free
[02:38:36] [PASSED] drm_test_framebuffer_init
[02:38:36] [PASSED] drm_test_framebuffer_init_bad_format
[02:38:36] [PASSED] drm_test_framebuffer_init_dev_mismatch
[02:38:36] [PASSED] drm_test_framebuffer_lookup
[02:38:36] [PASSED] drm_test_framebuffer_lookup_inexistent
[02:38:36] [PASSED] drm_test_framebuffer_modifiers_not_supported
[02:38:36] ================= [PASSED] drm_framebuffer =================
[02:38:36] ================ drm_gem_shmem (8 subtests) ================
[02:38:36] [PASSED] drm_gem_shmem_test_obj_create
[02:38:36] [PASSED] drm_gem_shmem_test_obj_create_private
[02:38:36] [PASSED] drm_gem_shmem_test_pin_pages
[02:38:36] [PASSED] drm_gem_shmem_test_vmap
[02:38:36] [PASSED] drm_gem_shmem_test_get_sg_table
[02:38:36] [PASSED] drm_gem_shmem_test_get_pages_sgt
[02:38:36] [PASSED] drm_gem_shmem_test_madvise
[02:38:36] [PASSED] drm_gem_shmem_test_purge
[02:38:36] ================== [PASSED] drm_gem_shmem ==================
[02:38:36] === drm_atomic_helper_connector_hdmi_check (29 subtests) ===
[02:38:36] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[02:38:36] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[02:38:36] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[02:38:36] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[02:38:36] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[02:38:36] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[02:38:36] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[02:38:36] [PASSED] Automatic
[02:38:36] [PASSED] Full
[02:38:36] [PASSED] Limited 16:235
[02:38:36] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[02:38:36] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[02:38:36] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[02:38:36] [PASSED] drm_test_check_disable_connector
[02:38:36] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[02:38:36] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[02:38:36] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[02:38:36] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[02:38:36] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[02:38:36] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[02:38:36] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[02:38:36] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[02:38:36] [PASSED] drm_test_check_output_bpc_dvi
[02:38:36] [PASSED] drm_test_check_output_bpc_format_vic_1
[02:38:36] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[02:38:36] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[02:38:36] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[02:38:36] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[02:38:36] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[02:38:36] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[02:38:36] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[02:38:36] ============ drm_test_check_hdmi_color_format  =============
[02:38:36] [PASSED] AUTO -> RGB
[02:38:36] [PASSED] YCBCR422 -> YUV422
[02:38:36] [PASSED] YCBCR420 -> YUV420
[02:38:36] [PASSED] YCBCR444 -> YUV444
[02:38:36] [PASSED] RGB -> RGB
[02:38:36] ======== [PASSED] drm_test_check_hdmi_color_format =========
[02:38:36] ======== drm_test_check_hdmi_color_format_420_only  ========
[02:38:36] [PASSED] RGB should fail
[02:38:36] [PASSED] YUV444 should fail
[02:38:36] [PASSED] YUV422 should fail
[02:38:36] [PASSED] YUV420 should work
[02:38:36] ==== [PASSED] drm_test_check_hdmi_color_format_420_only ====
[02:38:36] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[02:38:36] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[02:38:36] [PASSED] drm_test_check_broadcast_rgb_value
[02:38:36] [PASSED] drm_test_check_bpc_8_value
[02:38:36] [PASSED] drm_test_check_bpc_10_value
[02:38:36] [PASSED] drm_test_check_bpc_12_value
[02:38:36] [PASSED] drm_test_check_format_value
[02:38:36] [PASSED] drm_test_check_tmds_char_value
[02:38:36] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[02:38:36] = drm_atomic_helper_connector_hdmi_mode_valid (7 subtests) =
[02:38:36] [PASSED] drm_test_check_mode_valid
[02:38:36] [PASSED] drm_test_check_mode_valid_reject
[02:38:36] [PASSED] drm_test_check_mode_valid_reject_rate
[02:38:36] [PASSED] drm_test_check_mode_valid_reject_max_clock
[02:38:36] [PASSED] drm_test_check_mode_valid_yuv420_only_max_clock
[02:38:36] [PASSED] drm_test_check_mode_valid_reject_yuv420_only_connector
[02:38:36] [PASSED] drm_test_check_mode_valid_accept_yuv420_also_connector_rgb
[02:38:36] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[02:38:36] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[02:38:36] [PASSED] drm_test_check_infoframes
[02:38:36] [PASSED] drm_test_check_reject_avi_infoframe
[02:38:36] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[02:38:36] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[02:38:36] [PASSED] drm_test_check_reject_audio_infoframe
[02:38:36] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[02:38:36] ================= drm_managed (2 subtests) =================
[02:38:36] [PASSED] drm_test_managed_release_action
[02:38:36] [PASSED] drm_test_managed_run_action
[02:38:36] =================== [PASSED] drm_managed ===================
[02:38:36] =================== drm_mm (6 subtests) ====================
[02:38:36] [PASSED] drm_test_mm_init
[02:38:36] [PASSED] drm_test_mm_debug
[02:38:36] [PASSED] drm_test_mm_align32
[02:38:36] [PASSED] drm_test_mm_align64
[02:38:36] [PASSED] drm_test_mm_lowest
[02:38:36] [PASSED] drm_test_mm_highest
[02:38:36] ===================== [PASSED] drm_mm ======================
[02:38:36] ============= drm_modes_analog_tv (5 subtests) =============
[02:38:36] [PASSED] drm_test_modes_analog_tv_mono_576i
[02:38:36] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[02:38:36] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[02:38:36] [PASSED] drm_test_modes_analog_tv_pal_576i
[02:38:36] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[02:38:36] =============== [PASSED] drm_modes_analog_tv ===============
[02:38:36] ============== drm_plane_helper (2 subtests) ===============
[02:38:36] =============== drm_test_check_plane_state  ================
[02:38:36] [PASSED] clipping_simple
[02:38:36] [PASSED] clipping_rotate_reflect
[02:38:36] [PASSED] positioning_simple
[02:38:36] [PASSED] upscaling
[02:38:36] [PASSED] downscaling
[02:38:36] [PASSED] rounding1
[02:38:36] [PASSED] rounding2
[02:38:36] [PASSED] rounding3
[02:38:36] [PASSED] rounding4
[02:38:36] =========== [PASSED] drm_test_check_plane_state ============
[02:38:36] =========== drm_test_check_invalid_plane_state  ============
[02:38:36] [PASSED] positioning_invalid
[02:38:36] [PASSED] upscaling_invalid
[02:38:36] [PASSED] downscaling_invalid
[02:38:36] ======= [PASSED] drm_test_check_invalid_plane_state ========
[02:38:36] ================ [PASSED] drm_plane_helper =================
[02:38:36] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[02:38:36] ====== drm_test_connector_helper_tv_get_modes_check  =======
[02:38:36] [PASSED] None
[02:38:36] [PASSED] PAL
[02:38:36] [PASSED] NTSC
[02:38:36] [PASSED] Both, NTSC Default
[02:38:36] [PASSED] Both, PAL Default
[02:38:36] [PASSED] Both, NTSC Default, with PAL on command-line
[02:38:36] [PASSED] Both, PAL Default, with NTSC on command-line
[02:38:36] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[02:38:36] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[02:38:36] ================== drm_rect (9 subtests) ===================
[02:38:36] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[02:38:36] [PASSED] drm_test_rect_clip_scaled_not_clipped
[02:38:36] [PASSED] drm_test_rect_clip_scaled_clipped
[02:38:36] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[02:38:36] ================= drm_test_rect_intersect  =================
[02:38:36] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[02:38:36] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[02:38:36] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[02:38:36] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[02:38:36] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[02:38:36] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[02:38:36] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[02:38:36] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[02:38:36] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[02:38:36] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[02:38:36] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[02:38:36] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[02:38:36] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[02:38:36] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[02:38:36] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[02:38:36] ============= [PASSED] drm_test_rect_intersect =============
[02:38:36] ================ drm_test_rect_calc_hscale  ================
[02:38:36] [PASSED] normal use
[02:38:36] [PASSED] out of max range
[02:38:36] [PASSED] out of min range
[02:38:36] [PASSED] zero dst
[02:38:36] [PASSED] negative src
[02:38:36] [PASSED] negative dst
[02:38:36] ============ [PASSED] drm_test_rect_calc_hscale ============
[02:38:36] ================ drm_test_rect_calc_vscale  ================
[02:38:36] [PASSED] normal use
[02:38:36] [PASSED] out of max range
[02:38:36] [PASSED] out of min range
[02:38:36] [PASSED] zero dst
[02:38:36] [PASSED] negative src
[02:38:36] [PASSED] negative dst
[02:38:36] ============ [PASSED] drm_test_rect_calc_vscale ============
[02:38:36] ================== drm_test_rect_rotate  ===================
[02:38:36] [PASSED] reflect-x
[02:38:36] [PASSED] reflect-y
[02:38:36] [PASSED] rotate-0
[02:38:36] [PASSED] rotate-90
[02:38:36] [PASSED] rotate-180
[02:38:36] [PASSED] rotate-270
[02:38:36] ============== [PASSED] drm_test_rect_rotate ===============
[02:38:36] ================ drm_test_rect_rotate_inv  =================
[02:38:36] [PASSED] reflect-x
[02:38:36] [PASSED] reflect-y
[02:38:36] [PASSED] rotate-0
[02:38:36] [PASSED] rotate-90
[02:38:36] [PASSED] rotate-180
[02:38:36] [PASSED] rotate-270
[02:38:36] ============ [PASSED] drm_test_rect_rotate_inv =============
[02:38:36] ==================== [PASSED] drm_rect =====================
[02:38:36] ============ drm_sysfb_modeset_test (1 subtest) ============
[02:38:36] ============ drm_test_sysfb_build_fourcc_list  =============
[02:38:36] [PASSED] no native formats
[02:38:36] [PASSED] XRGB8888 as native format
[02:38:36] [PASSED] remove duplicates
[02:38:36] [PASSED] convert alpha formats
[02:38:36] [PASSED] random formats
[02:38:36] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[02:38:36] ============= [PASSED] drm_sysfb_modeset_test ==============
[02:38:36] ================== drm_fixp (2 subtests) ===================
[02:38:36] [PASSED] drm_test_int2fixp
[02:38:36] [PASSED] drm_test_sm2fixp
[02:38:36] ==================== [PASSED] drm_fixp =====================
[02:38:36] ============================================================
[02:38:36] Testing complete. Ran 637 tests: passed: 637
[02:38:36] Elapsed time: 26.603s total, 1.826s configuring, 24.609s building, 0.151s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[02:38:37] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:38:38] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[02:38:48] Starting KUnit Kernel (1/1)...
[02:38:48] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[02:38:48] ================= ttm_device (5 subtests) ==================
[02:38:48] [PASSED] ttm_device_init_basic
[02:38:48] [PASSED] ttm_device_init_multiple
[02:38:48] [PASSED] ttm_device_fini_basic
[02:38:48] [PASSED] ttm_device_init_no_vma_man
[02:38:48] ================== ttm_device_init_pools  ==================
[02:38:48] [PASSED] No DMA allocations, no DMA32 required
[02:38:48] [PASSED] DMA allocations, DMA32 required
[02:38:48] [PASSED] No DMA allocations, DMA32 required
[02:38:48] [PASSED] DMA allocations, no DMA32 required
[02:38:48] ============== [PASSED] ttm_device_init_pools ==============
[02:38:48] =================== [PASSED] ttm_device ====================
[02:38:48] ================== ttm_pool (8 subtests) ===================
[02:38:48] ================== ttm_pool_alloc_basic  ===================
[02:38:48] [PASSED] One page
[02:38:48] [PASSED] More than one page
[02:38:48] [PASSED] Above the allocation limit
[02:38:48] [PASSED] One page, with coherent DMA mappings enabled
[02:38:48] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[02:38:48] ============== [PASSED] ttm_pool_alloc_basic ===============
[02:38:48] ============== ttm_pool_alloc_basic_dma_addr  ==============
[02:38:48] [PASSED] One page
[02:38:48] [PASSED] More than one page
[02:38:48] [PASSED] Above the allocation limit
[02:38:48] [PASSED] One page, with coherent DMA mappings enabled
[02:38:48] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[02:38:48] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[02:38:48] [PASSED] ttm_pool_alloc_order_caching_match
[02:38:48] [PASSED] ttm_pool_alloc_caching_mismatch
[02:38:48] [PASSED] ttm_pool_alloc_order_mismatch
[02:38:48] [PASSED] ttm_pool_free_dma_alloc
[02:38:48] [PASSED] ttm_pool_free_no_dma_alloc
[02:38:48] [PASSED] ttm_pool_fini_basic
[02:38:48] ==================== [PASSED] ttm_pool =====================
[02:38:48] ================ ttm_resource (8 subtests) =================
[02:38:48] ================= ttm_resource_init_basic  =================
[02:38:48] [PASSED] Init resource in TTM_PL_SYSTEM
[02:38:48] [PASSED] Init resource in TTM_PL_VRAM
[02:38:48] [PASSED] Init resource in a private placement
[02:38:48] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[02:38:48] ============= [PASSED] ttm_resource_init_basic =============
[02:38:48] [PASSED] ttm_resource_init_pinned
[02:38:48] [PASSED] ttm_resource_fini_basic
[02:38:48] [PASSED] ttm_resource_manager_init_basic
[02:38:48] [PASSED] ttm_resource_manager_usage_basic
[02:38:48] [PASSED] ttm_resource_manager_set_used_basic
[02:38:48] [PASSED] ttm_sys_man_alloc_basic
[02:38:48] [PASSED] ttm_sys_man_free_basic
[02:38:48] ================== [PASSED] ttm_resource ===================
[02:38:48] =================== ttm_tt (15 subtests) ===================
[02:38:48] ==================== ttm_tt_init_basic  ====================
[02:38:48] [PASSED] Page-aligned size
[02:38:48] [PASSED] Extra pages requested
[02:38:48] ================ [PASSED] ttm_tt_init_basic ================
[02:38:48] [PASSED] ttm_tt_init_misaligned
[02:38:48] [PASSED] ttm_tt_fini_basic
[02:38:48] [PASSED] ttm_tt_fini_sg
[02:38:48] [PASSED] ttm_tt_fini_shmem
[02:38:48] [PASSED] ttm_tt_create_basic
[02:38:48] [PASSED] ttm_tt_create_invalid_bo_type
[02:38:48] [PASSED] ttm_tt_create_ttm_exists
[02:38:48] [PASSED] ttm_tt_create_failed
[02:38:48] [PASSED] ttm_tt_destroy_basic
[02:38:48] [PASSED] ttm_tt_populate_null_ttm
[02:38:48] [PASSED] ttm_tt_populate_populated_ttm
[02:38:48] [PASSED] ttm_tt_unpopulate_basic
[02:38:48] [PASSED] ttm_tt_unpopulate_empty_ttm
[02:38:48] [PASSED] ttm_tt_swapin_basic
[02:38:48] ===================== [PASSED] ttm_tt ======================
[02:38:48] =================== ttm_bo (14 subtests) ===================
[02:38:48] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[02:38:48] [PASSED] Cannot be interrupted and sleeps
[02:38:48] [PASSED] Cannot be interrupted, locks straight away
[02:38:48] [PASSED] Can be interrupted, sleeps
[02:38:48] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[02:38:48] [PASSED] ttm_bo_reserve_locked_no_sleep
[02:38:48] [PASSED] ttm_bo_reserve_no_wait_ticket
[02:38:49] [PASSED] ttm_bo_reserve_double_resv
[02:38:49] [PASSED] ttm_bo_reserve_interrupted
[02:38:49] [PASSED] ttm_bo_reserve_deadlock
[02:38:49] [PASSED] ttm_bo_unreserve_basic
[02:38:49] [PASSED] ttm_bo_unreserve_pinned
[02:38:49] [PASSED] ttm_bo_unreserve_bulk
[02:38:49] [PASSED] ttm_bo_fini_basic
[02:38:49] [PASSED] ttm_bo_fini_shared_resv
[02:38:49] [PASSED] ttm_bo_pin_basic
[02:38:49] [PASSED] ttm_bo_pin_unpin_resource
[02:38:49] [PASSED] ttm_bo_multiple_pin_one_unpin
[02:38:49] ===================== [PASSED] ttm_bo ======================
[02:38:49] ============== ttm_bo_validate (22 subtests) ===============
[02:38:49] ============== ttm_bo_init_reserved_sys_man  ===============
[02:38:49] [PASSED] Buffer object for userspace
[02:38:49] [PASSED] Kernel buffer object
[02:38:49] [PASSED] Shared buffer object
[02:38:49] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[02:38:49] ============== ttm_bo_init_reserved_mock_man  ==============
[02:38:49] [PASSED] Buffer object for userspace
[02:38:49] [PASSED] Kernel buffer object
[02:38:49] [PASSED] Shared buffer object
[02:38:49] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[02:38:49] [PASSED] ttm_bo_init_reserved_resv
[02:38:49] ================== ttm_bo_validate_basic  ==================
[02:38:49] [PASSED] Buffer object for userspace
[02:38:49] [PASSED] Kernel buffer object
[02:38:49] [PASSED] Shared buffer object
[02:38:49] ============== [PASSED] ttm_bo_validate_basic ==============
[02:38:49] [PASSED] ttm_bo_validate_invalid_placement
[02:38:49] ============= ttm_bo_validate_same_placement  ==============
[02:38:49] [PASSED] System manager
[02:38:49] [PASSED] VRAM manager
[02:38:49] ========= [PASSED] ttm_bo_validate_same_placement ==========
[02:38:49] [PASSED] ttm_bo_validate_failed_alloc
[02:38:49] [PASSED] ttm_bo_validate_pinned
[02:38:49] [PASSED] ttm_bo_validate_busy_placement
[02:38:49] ================ ttm_bo_validate_multihop  =================
[02:38:49] [PASSED] Buffer object for userspace
[02:38:49] [PASSED] Kernel buffer object
[02:38:49] [PASSED] Shared buffer object
[02:38:49] ============ [PASSED] ttm_bo_validate_multihop =============
[02:38:49] ========== ttm_bo_validate_no_placement_signaled  ==========
[02:38:49] [PASSED] Buffer object in system domain, no page vector
[02:38:49] [PASSED] Buffer object in system domain with an existing page vector
[02:38:49] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[02:38:49] ======== ttm_bo_validate_no_placement_not_signaled  ========
[02:38:49] [PASSED] Buffer object for userspace
[02:38:49] [PASSED] Kernel buffer object
[02:38:49] [PASSED] Shared buffer object
[02:38:49] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[02:38:49] [PASSED] ttm_bo_validate_move_fence_signaled
[02:38:49] ========= ttm_bo_validate_move_fence_not_signaled  =========
[02:38:49] [PASSED] Waits for GPU
[02:38:49] [PASSED] Tries to lock straight away
[02:38:49] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[02:38:49] [PASSED] ttm_bo_validate_swapout
[02:38:49] [PASSED] ttm_bo_validate_happy_evict
[02:38:49] [PASSED] ttm_bo_validate_all_pinned_evict
[02:38:49] [PASSED] ttm_bo_validate_allowed_only_evict
[02:38:49] [PASSED] ttm_bo_validate_deleted_evict
[02:38:49] [PASSED] ttm_bo_validate_busy_domain_evict
[02:38:49] [PASSED] ttm_bo_validate_evict_gutting
[02:38:49] [PASSED] ttm_bo_validate_recrusive_evict
[02:38:49] ================= [PASSED] ttm_bo_validate =================
[02:38:49] ============================================================
[02:38:49] Testing complete. Ran 102 tests: passed: 102
[02:38:49] Elapsed time: 12.014s total, 1.847s configuring, 9.952s building, 0.178s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/dma-buf/.kunitconfig
[02:38:49] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:38:51] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[02:38:59] Starting KUnit Kernel (1/1)...
[02:38:59] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[02:38:59] =============== dma-buf-fence (12 subtests) ================
[02:38:59] [PASSED] test_sanitycheck
[02:38:59] [PASSED] test_signaling
[02:38:59] [PASSED] test_add_callback
[02:38:59] [PASSED] test_late_add_callback
[02:38:59] [PASSED] test_rm_callback
[02:38:59] [PASSED] test_late_rm_callback
[02:38:59] [PASSED] test_status
[02:38:59] [PASSED] test_error
[02:38:59] [PASSED] test_wait
[02:38:59] [PASSED] test_wait_timeout
[02:38:59] [PASSED] test_stub
[02:38:59] [SKIPPED] test_race_signal_callback (requires at least 2 CPUs)
[02:38:59] ================== [PASSED] dma-buf-fence ==================
[02:38:59] ============ dma-buf-fence-chain (11 subtests) =============
[02:38:59] [PASSED] test_sanitycheck
[02:38:59] [PASSED] test_find_seqno
[02:38:59] [PASSED] test_find_signaled
[02:38:59] [PASSED] test_find_out_of_order
[02:39:04] [PASSED] test_find_gap
[02:39:04] [PASSED] test_find_race
[02:39:04] [PASSED] test_signal_forward
[02:39:04] [PASSED] test_signal_backward
[02:39:04] [PASSED] test_wait_forward
[02:39:05] [PASSED] test_wait_backward
[02:39:05] [PASSED] test_wait_random
[02:39:05] =============== [PASSED] dma-buf-fence-chain ===============
[02:39:05] ============ dma-buf-fence-unwrap (10 subtests) ============
[02:39:05] [PASSED] test_sanitycheck
[02:39:05] [PASSED] test_unwrap_array
[02:39:05] [PASSED] test_unwrap_chain
[02:39:05] [PASSED] test_unwrap_chain_array
[02:39:05] [PASSED] test_unwrap_merge
[02:39:05] [PASSED] test_unwrap_merge_duplicate
[02:39:05] [PASSED] test_unwrap_merge_seqno
[02:39:05] [PASSED] test_unwrap_merge_order
[02:39:05] [PASSED] test_unwrap_merge_complex
[02:39:05] [PASSED] test_unwrap_merge_complex_seqno
[02:39:05] ============== [PASSED] dma-buf-fence-unwrap ===============
[02:39:05] ================ dma-buf-resv (5 subtests) =================
[02:39:05] [PASSED] test_sanitycheck
[02:39:05] ===================== test_signaling  ======================
[02:39:05] [PASSED] kernel
[02:39:05] [PASSED] write
[02:39:05] [PASSED] read
[02:39:05] [PASSED] bookkeep
[02:39:05] ================= [PASSED] test_signaling ==================
[02:39:05] ====================== test_for_each  ======================
[02:39:05] [PASSED] kernel
[02:39:05] [PASSED] write
[02:39:05] [PASSED] read
[02:39:05] [PASSED] bookkeep
[02:39:05] ================== [PASSED] test_for_each ==================
[02:39:05] ================= test_for_each_unlocked  ==================
[02:39:05] [PASSED] kernel
[02:39:05] [PASSED] write
[02:39:05] [PASSED] read
[02:39:05] [PASSED] bookkeep
[02:39:05] ============= [PASSED] test_for_each_unlocked ==============
[02:39:05] ===================== test_get_fences  =====================
[02:39:05] [PASSED] kernel
[02:39:05] [PASSED] write
[02:39:05] [PASSED] read
[02:39:05] [PASSED] bookkeep
[02:39:05] ================= [PASSED] test_get_fences =================
[02:39:05] ================== [PASSED] dma-buf-resv ===================
[02:39:05] ============================================================
[02:39:05] Testing complete. Ran 50 tests: passed: 49, skipped: 1
[02:39:05] Elapsed time: 15.801s total, 1.804s configuring, 8.675s building, 5.282s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


