Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AE1CD042B
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 01:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D5F10E02C;
	Tue,  6 Jan 2026 01:36:32 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA87F10E02C;
 Tue,  6 Jan 2026 01:36:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Remove_multi-queue_K?=
 =?utf-8?q?EEP=5FACTIVE_feature?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Jan 2026 01:36:30 -0000
Message-ID: <176766339075.127454.14033300613539038583@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260106012920.2850975-4-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260106012920.2850975-4-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe: Remove multi-queue KEEP_ACTIVE feature
URL   : https://patchwork.freedesktop.org/series/159666/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[01:35:11] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:35:15] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[01:35:46] Starting KUnit Kernel (1/1)...
[01:35:46] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:35:47] ================== guc_buf (11 subtests) ===================
[01:35:47] [PASSED] test_smallest
[01:35:47] [PASSED] test_largest
[01:35:47] [PASSED] test_granular
[01:35:47] [PASSED] test_unique
[01:35:47] [PASSED] test_overlap
[01:35:47] [PASSED] test_reusable
[01:35:47] [PASSED] test_too_big
[01:35:47] [PASSED] test_flush
[01:35:47] [PASSED] test_lookup
[01:35:47] [PASSED] test_data
[01:35:47] [PASSED] test_class
[01:35:47] ===================== [PASSED] guc_buf =====================
[01:35:47] =================== guc_dbm (7 subtests) ===================
[01:35:47] [PASSED] test_empty
[01:35:47] [PASSED] test_default
[01:35:47] ======================== test_size  ========================
[01:35:47] [PASSED] 4
[01:35:47] [PASSED] 8
[01:35:47] [PASSED] 32
[01:35:47] [PASSED] 256
[01:35:47] ==================== [PASSED] test_size ====================
[01:35:47] ======================= test_reuse  ========================
[01:35:47] [PASSED] 4
[01:35:47] [PASSED] 8
[01:35:47] [PASSED] 32
[01:35:47] [PASSED] 256
[01:35:47] =================== [PASSED] test_reuse ====================
[01:35:47] =================== test_range_overlap  ====================
[01:35:47] [PASSED] 4
[01:35:47] [PASSED] 8
[01:35:47] [PASSED] 32
[01:35:47] [PASSED] 256
[01:35:47] =============== [PASSED] test_range_overlap ================
[01:35:47] =================== test_range_compact  ====================
[01:35:47] [PASSED] 4
[01:35:47] [PASSED] 8
[01:35:47] [PASSED] 32
[01:35:47] [PASSED] 256
[01:35:47] =============== [PASSED] test_range_compact ================
[01:35:47] ==================== test_range_spare  =====================
[01:35:47] [PASSED] 4
[01:35:47] [PASSED] 8
[01:35:47] [PASSED] 32
[01:35:47] [PASSED] 256
[01:35:47] ================ [PASSED] test_range_spare =================
[01:35:47] ===================== [PASSED] guc_dbm =====================
[01:35:47] =================== guc_idm (6 subtests) ===================
[01:35:47] [PASSED] bad_init
[01:35:47] [PASSED] no_init
[01:35:47] [PASSED] init_fini
[01:35:47] [PASSED] check_used
[01:35:47] [PASSED] check_quota
[01:35:47] [PASSED] check_all
[01:35:47] ===================== [PASSED] guc_idm =====================
[01:35:47] ================== no_relay (3 subtests) ===================
[01:35:47] [PASSED] xe_drops_guc2pf_if_not_ready
[01:35:47] [PASSED] xe_drops_guc2vf_if_not_ready
[01:35:47] [PASSED] xe_rejects_send_if_not_ready
[01:35:47] ==================== [PASSED] no_relay =====================
[01:35:47] ================== pf_relay (14 subtests) ==================
[01:35:47] [PASSED] pf_rejects_guc2pf_too_short
[01:35:47] [PASSED] pf_rejects_guc2pf_too_long
[01:35:47] [PASSED] pf_rejects_guc2pf_no_payload
[01:35:47] [PASSED] pf_fails_no_payload
[01:35:47] [PASSED] pf_fails_bad_origin
[01:35:47] [PASSED] pf_fails_bad_type
[01:35:47] [PASSED] pf_txn_reports_error
[01:35:47] [PASSED] pf_txn_sends_pf2guc
[01:35:47] [PASSED] pf_sends_pf2guc
[01:35:47] [SKIPPED] pf_loopback_nop
[01:35:47] [SKIPPED] pf_loopback_echo
[01:35:47] [SKIPPED] pf_loopback_fail
[01:35:47] [SKIPPED] pf_loopback_busy
[01:35:47] [SKIPPED] pf_loopback_retry
[01:35:47] ==================== [PASSED] pf_relay =====================
[01:35:47] ================== vf_relay (3 subtests) ===================
[01:35:47] [PASSED] vf_rejects_guc2vf_too_short
[01:35:47] [PASSED] vf_rejects_guc2vf_too_long
[01:35:47] [PASSED] vf_rejects_guc2vf_no_payload
[01:35:47] ==================== [PASSED] vf_relay =====================
[01:35:47] ================ pf_gt_config (6 subtests) =================
[01:35:47] [PASSED] fair_contexts_1vf
[01:35:47] [PASSED] fair_doorbells_1vf
[01:35:47] [PASSED] fair_ggtt_1vf
[01:35:47] ====================== fair_contexts  ======================
[01:35:47] [PASSED] 1 VF
[01:35:47] [PASSED] 2 VFs
[01:35:47] [PASSED] 3 VFs
[01:35:47] [PASSED] 4 VFs
[01:35:47] [PASSED] 5 VFs
[01:35:47] [PASSED] 6 VFs
[01:35:47] [PASSED] 7 VFs
[01:35:47] [PASSED] 8 VFs
[01:35:47] [PASSED] 9 VFs
[01:35:47] [PASSED] 10 VFs
[01:35:47] [PASSED] 11 VFs
[01:35:47] [PASSED] 12 VFs
[01:35:47] [PASSED] 13 VFs
[01:35:47] [PASSED] 14 VFs
[01:35:47] [PASSED] 15 VFs
[01:35:47] [PASSED] 16 VFs
[01:35:47] [PASSED] 17 VFs
[01:35:47] [PASSED] 18 VFs
[01:35:47] [PASSED] 19 VFs
[01:35:47] [PASSED] 20 VFs
[01:35:47] [PASSED] 21 VFs
[01:35:47] [PASSED] 22 VFs
[01:35:47] [PASSED] 23 VFs
[01:35:47] [PASSED] 24 VFs
[01:35:47] [PASSED] 25 VFs
[01:35:47] [PASSED] 26 VFs
[01:35:47] [PASSED] 27 VFs
[01:35:47] [PASSED] 28 VFs
[01:35:47] [PASSED] 29 VFs
[01:35:47] [PASSED] 30 VFs
[01:35:47] [PASSED] 31 VFs
[01:35:47] [PASSED] 32 VFs
[01:35:47] [PASSED] 33 VFs
[01:35:47] [PASSED] 34 VFs
[01:35:47] [PASSED] 35 VFs
[01:35:47] [PASSED] 36 VFs
[01:35:47] [PASSED] 37 VFs
[01:35:47] [PASSED] 38 VFs
[01:35:47] [PASSED] 39 VFs
[01:35:47] [PASSED] 40 VFs
[01:35:47] [PASSED] 41 VFs
[01:35:47] [PASSED] 42 VFs
[01:35:47] [PASSED] 43 VFs
[01:35:47] [PASSED] 44 VFs
[01:35:47] [PASSED] 45 VFs
[01:35:47] [PASSED] 46 VFs
[01:35:47] [PASSED] 47 VFs
[01:35:47] [PASSED] 48 VFs
[01:35:47] [PASSED] 49 VFs
[01:35:47] [PASSED] 50 VFs
[01:35:47] [PASSED] 51 VFs
[01:35:47] [PASSED] 52 VFs
[01:35:47] [PASSED] 53 VFs
[01:35:47] [PASSED] 54 VFs
[01:35:47] [PASSED] 55 VFs
[01:35:47] [PASSED] 56 VFs
[01:35:47] [PASSED] 57 VFs
[01:35:47] [PASSED] 58 VFs
[01:35:47] [PASSED] 59 VFs
[01:35:47] [PASSED] 60 VFs
[01:35:47] [PASSED] 61 VFs
[01:35:47] [PASSED] 62 VFs
[01:35:47] [PASSED] 63 VFs
[01:35:47] ================== [PASSED] fair_contexts ==================
[01:35:47] ===================== fair_doorbells  ======================
[01:35:47] [PASSED] 1 VF
[01:35:47] [PASSED] 2 VFs
[01:35:47] [PASSED] 3 VFs
[01:35:47] [PASSED] 4 VFs
[01:35:47] [PASSED] 5 VFs
[01:35:47] [PASSED] 6 VFs
[01:35:47] [PASSED] 7 VFs
[01:35:47] [PASSED] 8 VFs
[01:35:47] [PASSED] 9 VFs
[01:35:47] [PASSED] 10 VFs
[01:35:47] [PASSED] 11 VFs
[01:35:47] [PASSED] 12 VFs
[01:35:47] [PASSED] 13 VFs
[01:35:47] [PASSED] 14 VFs
[01:35:47] [PASSED] 15 VFs
[01:35:47] [PASSED] 16 VFs
[01:35:47] [PASSED] 17 VFs
[01:35:47] [PASSED] 18 VFs
[01:35:47] [PASSED] 19 VFs
[01:35:47] [PASSED] 20 VFs
[01:35:47] [PASSED] 21 VFs
[01:35:47] [PASSED] 22 VFs
[01:35:47] [PASSED] 23 VFs
[01:35:47] [PASSED] 24 VFs
[01:35:47] [PASSED] 25 VFs
[01:35:47] [PASSED] 26 VFs
[01:35:47] [PASSED] 27 VFs
[01:35:47] [PASSED] 28 VFs
[01:35:47] [PASSED] 29 VFs
[01:35:47] [PASSED] 30 VFs
[01:35:47] [PASSED] 31 VFs
[01:35:47] [PASSED] 32 VFs
[01:35:47] [PASSED] 33 VFs
[01:35:47] [PASSED] 34 VFs
[01:35:47] [PASSED] 35 VFs
[01:35:47] [PASSED] 36 VFs
[01:35:47] [PASSED] 37 VFs
[01:35:47] [PASSED] 38 VFs
[01:35:47] [PASSED] 39 VFs
[01:35:47] [PASSED] 40 VFs
[01:35:47] [PASSED] 41 VFs
[01:35:47] [PASSED] 42 VFs
[01:35:47] [PASSED] 43 VFs
[01:35:47] [PASSED] 44 VFs
[01:35:47] [PASSED] 45 VFs
[01:35:47] [PASSED] 46 VFs
[01:35:47] [PASSED] 47 VFs
[01:35:47] [PASSED] 48 VFs
[01:35:47] [PASSED] 49 VFs
[01:35:47] [PASSED] 50 VFs
[01:35:47] [PASSED] 51 VFs
[01:35:47] [PASSED] 52 VFs
[01:35:47] [PASSED] 53 VFs
[01:35:47] [PASSED] 54 VFs
[01:35:47] [PASSED] 55 VFs
[01:35:47] [PASSED] 56 VFs
[01:35:47] [PASSED] 57 VFs
[01:35:47] [PASSED] 58 VFs
[01:35:47] [PASSED] 59 VFs
[01:35:47] [PASSED] 60 VFs
[01:35:47] [PASSED] 61 VFs
[01:35:47] [PASSED] 62 VFs
[01:35:47] [PASSED] 63 VFs
[01:35:47] ================= [PASSED] fair_doorbells ==================
[01:35:47] ======================== fair_ggtt  ========================
[01:35:47] [PASSED] 1 VF
[01:35:47] [PASSED] 2 VFs
[01:35:47] [PASSED] 3 VFs
[01:35:47] [PASSED] 4 VFs
[01:35:47] [PASSED] 5 VFs
[01:35:47] [PASSED] 6 VFs
[01:35:47] [PASSED] 7 VFs
[01:35:47] [PASSED] 8 VFs
[01:35:47] [PASSED] 9 VFs
[01:35:47] [PASSED] 10 VFs
[01:35:47] [PASSED] 11 VFs
[01:35:47] [PASSED] 12 VFs
[01:35:47] [PASSED] 13 VFs
[01:35:47] [PASSED] 14 VFs
[01:35:47] [PASSED] 15 VFs
[01:35:47] [PASSED] 16 VFs
[01:35:47] [PASSED] 17 VFs
[01:35:47] [PASSED] 18 VFs
[01:35:47] [PASSED] 19 VFs
[01:35:47] [PASSED] 20 VFs
[01:35:47] [PASSED] 21 VFs
[01:35:47] [PASSED] 22 VFs
[01:35:47] [PASSED] 23 VFs
[01:35:47] [PASSED] 24 VFs
[01:35:47] [PASSED] 25 VFs
[01:35:47] [PASSED] 26 VFs
[01:35:47] [PASSED] 27 VFs
[01:35:47] [PASSED] 28 VFs
[01:35:47] [PASSED] 29 VFs
[01:35:47] [PASSED] 30 VFs
[01:35:47] [PASSED] 31 VFs
[01:35:47] [PASSED] 32 VFs
[01:35:47] [PASSED] 33 VFs
[01:35:47] [PASSED] 34 VFs
[01:35:47] [PASSED] 35 VFs
[01:35:47] [PASSED] 36 VFs
[01:35:47] [PASSED] 37 VFs
[01:35:47] [PASSED] 38 VFs
[01:35:47] [PASSED] 39 VFs
[01:35:47] [PASSED] 40 VFs
[01:35:47] [PASSED] 41 VFs
[01:35:47] [PASSED] 42 VFs
[01:35:47] [PASSED] 43 VFs
[01:35:47] [PASSED] 44 VFs
[01:35:47] [PASSED] 45 VFs
[01:35:47] [PASSED] 46 VFs
[01:35:47] [PASSED] 47 VFs
[01:35:47] [PASSED] 48 VFs
[01:35:47] [PASSED] 49 VFs
[01:35:47] [PASSED] 50 VFs
[01:35:47] [PASSED] 51 VFs
[01:35:47] [PASSED] 52 VFs
[01:35:47] [PASSED] 53 VFs
[01:35:47] [PASSED] 54 VFs
[01:35:47] [PASSED] 55 VFs
[01:35:47] [PASSED] 56 VFs
[01:35:47] [PASSED] 57 VFs
[01:35:47] [PASSED] 58 VFs
[01:35:47] [PASSED] 59 VFs
[01:35:47] [PASSED] 60 VFs
[01:35:47] [PASSED] 61 VFs
[01:35:47] [PASSED] 62 VFs
[01:35:47] [PASSED] 63 VFs
[01:35:47] ==================== [PASSED] fair_ggtt ====================
[01:35:47] ================== [PASSED] pf_gt_config ===================
[01:35:47] ===================== lmtt (1 subtest) =====================
[01:35:47] ======================== test_ops  =========================
[01:35:47] [PASSED] 2-level
[01:35:47] [PASSED] multi-level
[01:35:47] ==================== [PASSED] test_ops =====================
[01:35:47] ====================== [PASSED] lmtt =======================
[01:35:47] ================= pf_service (11 subtests) =================
[01:35:47] [PASSED] pf_negotiate_any
[01:35:47] [PASSED] pf_negotiate_base_match
[01:35:47] [PASSED] pf_negotiate_base_newer
[01:35:47] [PASSED] pf_negotiate_base_next
[01:35:47] [SKIPPED] pf_negotiate_base_older
[01:35:47] [PASSED] pf_negotiate_base_prev
[01:35:47] [PASSED] pf_negotiate_latest_match
[01:35:47] [PASSED] pf_negotiate_latest_newer
[01:35:47] [PASSED] pf_negotiate_latest_next
[01:35:47] [SKIPPED] pf_negotiate_latest_older
[01:35:47] [SKIPPED] pf_negotiate_latest_prev
[01:35:47] =================== [PASSED] pf_service ====================
[01:35:47] ================= xe_guc_g2g (2 subtests) ==================
[01:35:47] ============== xe_live_guc_g2g_kunit_default  ==============
[01:35:47] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[01:35:47] ============== xe_live_guc_g2g_kunit_allmem  ===============
[01:35:47] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[01:35:47] =================== [SKIPPED] xe_guc_g2g ===================
[01:35:47] =================== xe_mocs (2 subtests) ===================
[01:35:47] ================ xe_live_mocs_kernel_kunit  ================
[01:35:47] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[01:35:47] ================ xe_live_mocs_reset_kunit  =================
[01:35:47] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[01:35:47] ==================== [SKIPPED] xe_mocs =====================
[01:35:47] ================= xe_migrate (2 subtests) ==================
[01:35:47] ================= xe_migrate_sanity_kunit  =================
[01:35:47] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[01:35:47] ================== xe_validate_ccs_kunit  ==================
[01:35:47] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[01:35:47] =================== [SKIPPED] xe_migrate ===================
[01:35:47] ================== xe_dma_buf (1 subtest) ==================
[01:35:47] ==================== xe_dma_buf_kunit  =====================
[01:35:47] ================ [SKIPPED] xe_dma_buf_kunit ================
[01:35:47] =================== [SKIPPED] xe_dma_buf ===================
[01:35:47] ================= xe_bo_shrink (1 subtest) =================
[01:35:47] =================== xe_bo_shrink_kunit  ====================
[01:35:47] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[01:35:47] ================== [SKIPPED] xe_bo_shrink ==================
[01:35:47] ==================== xe_bo (2 subtests) ====================
[01:35:47] ================== xe_ccs_migrate_kunit  ===================
[01:35:47] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[01:35:47] ==================== xe_bo_evict_kunit  ====================
[01:35:47] =============== [SKIPPED] xe_bo_evict_kunit ================
[01:35:47] ===================== [SKIPPED] xe_bo ======================
[01:35:47] ==================== args (13 subtests) ====================
[01:35:47] [PASSED] count_args_test
[01:35:47] [PASSED] call_args_example
[01:35:47] [PASSED] call_args_test
[01:35:47] [PASSED] drop_first_arg_example
[01:35:47] [PASSED] drop_first_arg_test
[01:35:47] [PASSED] first_arg_example
[01:35:47] [PASSED] first_arg_test
[01:35:47] [PASSED] last_arg_example
[01:35:47] [PASSED] last_arg_test
[01:35:47] [PASSED] pick_arg_example
[01:35:47] [PASSED] if_args_example
[01:35:47] [PASSED] if_args_test
[01:35:47] [PASSED] sep_comma_example
[01:35:47] ====================== [PASSED] args =======================
[01:35:47] =================== xe_pci (3 subtests) ====================
[01:35:47] ==================== check_graphics_ip  ====================
[01:35:47] [PASSED] 12.00 Xe_LP
[01:35:47] [PASSED] 12.10 Xe_LP+
[01:35:47] [PASSED] 12.55 Xe_HPG
[01:35:47] [PASSED] 12.60 Xe_HPC
[01:35:47] [PASSED] 12.70 Xe_LPG
[01:35:47] [PASSED] 12.71 Xe_LPG
[01:35:47] [PASSED] 12.74 Xe_LPG+
[01:35:47] [PASSED] 20.01 Xe2_HPG
[01:35:47] [PASSED] 20.02 Xe2_HPG
[01:35:47] [PASSED] 20.04 Xe2_LPG
[01:35:47] [PASSED] 30.00 Xe3_LPG
[01:35:47] [PASSED] 30.01 Xe3_LPG
[01:35:47] [PASSED] 30.03 Xe3_LPG
[01:35:47] [PASSED] 30.04 Xe3_LPG
[01:35:47] [PASSED] 30.05 Xe3_LPG
[01:35:47] [PASSED] 35.11 Xe3p_XPC
[01:35:47] ================ [PASSED] check_graphics_ip ================
[01:35:47] ===================== check_media_ip  ======================
[01:35:47] [PASSED] 12.00 Xe_M
[01:35:47] [PASSED] 12.55 Xe_HPM
[01:35:47] [PASSED] 13.00 Xe_LPM+
[01:35:47] [PASSED] 13.01 Xe2_HPM
[01:35:47] [PASSED] 20.00 Xe2_LPM
[01:35:47] [PASSED] 30.00 Xe3_LPM
[01:35:47] [PASSED] 30.02 Xe3_LPM
[01:35:47] [PASSED] 35.00 Xe3p_LPM
[01:35:47] [PASSED] 35.03 Xe3p_HPM
[01:35:47] ================= [PASSED] check_media_ip ==================
[01:35:47] =================== check_platform_desc  ===================
[01:35:47] [PASSED] 0x9A60 (TIGERLAKE)
[01:35:47] [PASSED] 0x9A68 (TIGERLAKE)
[01:35:47] [PASSED] 0x9A70 (TIGERLAKE)
[01:35:47] [PASSED] 0x9A40 (TIGERLAKE)
[01:35:47] [PASSED] 0x9A49 (TIGERLAKE)
[01:35:47] [PASSED] 0x9A59 (TIGERLAKE)
[01:35:47] [PASSED] 0x9A78 (TIGERLAKE)
[01:35:47] [PASSED] 0x9AC0 (TIGERLAKE)
[01:35:47] [PASSED] 0x9AC9 (TIGERLAKE)
[01:35:47] [PASSED] 0x9AD9 (TIGERLAKE)
[01:35:47] [PASSED] 0x9AF8 (TIGERLAKE)
[01:35:47] [PASSED] 0x4C80 (ROCKETLAKE)
[01:35:47] [PASSED] 0x4C8A (ROCKETLAKE)
[01:35:47] [PASSED] 0x4C8B (ROCKETLAKE)
[01:35:47] [PASSED] 0x4C8C (ROCKETLAKE)
[01:35:47] [PASSED] 0x4C90 (ROCKETLAKE)
[01:35:47] [PASSED] 0x4C9A (ROCKETLAKE)
[01:35:47] [PASSED] 0x4680 (ALDERLAKE_S)
[01:35:47] [PASSED] 0x4682 (ALDERLAKE_S)
[01:35:47] [PASSED] 0x4688 (ALDERLAKE_S)
[01:35:47] [PASSED] 0x468A (ALDERLAKE_S)
[01:35:47] [PASSED] 0x468B (ALDERLAKE_S)
[01:35:47] [PASSED] 0x4690 (ALDERLAKE_S)
[01:35:47] [PASSED] 0x4692 (ALDERLAKE_S)
[01:35:47] [PASSED] 0x4693 (ALDERLAKE_S)
[01:35:47] [PASSED] 0x46A0 (ALDERLAKE_P)
[01:35:47] [PASSED] 0x46A1 (ALDERLAKE_P)
[01:35:47] [PASSED] 0x46A2 (ALDERLAKE_P)
[01:35:47] [PASSED] 0x46A3 (ALDERLAKE_P)
[01:35:47] [PASSED] 0x46A6 (ALDERLAKE_P)
[01:35:47] [PASSED] 0x46A8 (ALDERLAKE_P)
[01:35:47] [PASSED] 0x46AA (ALDERLAKE_P)
[01:35:47] [PASSED] 0x462A (ALDERLAKE_P)
[01:35:47] [PASSED] 0x4626 (ALDERLAKE_P)
[01:35:47] [PASSED] 0x4628 (ALDERLAKE_P)
stty: 'standard input': Inappropriate ioctl for device
[01:35:47] [PASSED] 0x46B0 (ALDERLAKE_P)
[01:35:47] [PASSED] 0x46B1 (ALDERLAKE_P)
[01:35:47] [PASSED] 0x46B2 (ALDERLAKE_P)
[01:35:47] [PASSED] 0x46B3 (ALDERLAKE_P)
[01:35:47] [PASSED] 0x46C0 (ALDERLAKE_P)
[01:35:47] [PASSED] 0x46C1 (ALDERLAKE_P)
[01:35:47] [PASSED] 0x46C2 (ALDERLAKE_P)
[01:35:47] [PASSED] 0x46C3 (ALDERLAKE_P)
[01:35:47] [PASSED] 0x46D0 (ALDERLAKE_N)
[01:35:47] [PASSED] 0x46D1 (ALDERLAKE_N)
[01:35:47] [PASSED] 0x46D2 (ALDERLAKE_N)
[01:35:47] [PASSED] 0x46D3 (ALDERLAKE_N)
[01:35:47] [PASSED] 0x46D4 (ALDERLAKE_N)
[01:35:47] [PASSED] 0xA721 (ALDERLAKE_P)
[01:35:47] [PASSED] 0xA7A1 (ALDERLAKE_P)
[01:35:47] [PASSED] 0xA7A9 (ALDERLAKE_P)
[01:35:47] [PASSED] 0xA7AC (ALDERLAKE_P)
[01:35:47] [PASSED] 0xA7AD (ALDERLAKE_P)
[01:35:47] [PASSED] 0xA720 (ALDERLAKE_P)
[01:35:47] [PASSED] 0xA7A0 (ALDERLAKE_P)
[01:35:47] [PASSED] 0xA7A8 (ALDERLAKE_P)
[01:35:47] [PASSED] 0xA7AA (ALDERLAKE_P)
[01:35:47] [PASSED] 0xA7AB (ALDERLAKE_P)
[01:35:47] [PASSED] 0xA780 (ALDERLAKE_S)
[01:35:47] [PASSED] 0xA781 (ALDERLAKE_S)
[01:35:47] [PASSED] 0xA782 (ALDERLAKE_S)
[01:35:47] [PASSED] 0xA783 (ALDERLAKE_S)
[01:35:47] [PASSED] 0xA788 (ALDERLAKE_S)
[01:35:47] [PASSED] 0xA789 (ALDERLAKE_S)
[01:35:47] [PASSED] 0xA78A (ALDERLAKE_S)
[01:35:47] [PASSED] 0xA78B (ALDERLAKE_S)
[01:35:47] [PASSED] 0x4905 (DG1)
[01:35:47] [PASSED] 0x4906 (DG1)
[01:35:47] [PASSED] 0x4907 (DG1)
[01:35:47] [PASSED] 0x4908 (DG1)
[01:35:47] [PASSED] 0x4909 (DG1)
[01:35:47] [PASSED] 0x56C0 (DG2)
[01:35:47] [PASSED] 0x56C2 (DG2)
[01:35:47] [PASSED] 0x56C1 (DG2)
[01:35:47] [PASSED] 0x7D51 (METEORLAKE)
[01:35:47] [PASSED] 0x7DD1 (METEORLAKE)
[01:35:47] [PASSED] 0x7D41 (METEORLAKE)
[01:35:47] [PASSED] 0x7D67 (METEORLAKE)
[01:35:47] [PASSED] 0xB640 (METEORLAKE)
[01:35:47] [PASSED] 0x56A0 (DG2)
[01:35:47] [PASSED] 0x56A1 (DG2)
[01:35:47] [PASSED] 0x56A2 (DG2)
[01:35:47] [PASSED] 0x56BE (DG2)
[01:35:47] [PASSED] 0x56BF (DG2)
[01:35:47] [PASSED] 0x5690 (DG2)
[01:35:47] [PASSED] 0x5691 (DG2)
[01:35:47] [PASSED] 0x5692 (DG2)
[01:35:47] [PASSED] 0x56A5 (DG2)
[01:35:47] [PASSED] 0x56A6 (DG2)
[01:35:47] [PASSED] 0x56B0 (DG2)
[01:35:47] [PASSED] 0x56B1 (DG2)
[01:35:47] [PASSED] 0x56BA (DG2)
[01:35:47] [PASSED] 0x56BB (DG2)
[01:35:47] [PASSED] 0x56BC (DG2)
[01:35:47] [PASSED] 0x56BD (DG2)
[01:35:47] [PASSED] 0x5693 (DG2)
[01:35:47] [PASSED] 0x5694 (DG2)
[01:35:47] [PASSED] 0x5695 (DG2)
[01:35:47] [PASSED] 0x56A3 (DG2)
[01:35:47] [PASSED] 0x56A4 (DG2)
[01:35:47] [PASSED] 0x56B2 (DG2)
[01:35:47] [PASSED] 0x56B3 (DG2)
[01:35:47] [PASSED] 0x5696 (DG2)
[01:35:47] [PASSED] 0x5697 (DG2)
[01:35:47] [PASSED] 0xB69 (PVC)
[01:35:47] [PASSED] 0xB6E (PVC)
[01:35:47] [PASSED] 0xBD4 (PVC)
[01:35:47] [PASSED] 0xBD5 (PVC)
[01:35:47] [PASSED] 0xBD6 (PVC)
[01:35:47] [PASSED] 0xBD7 (PVC)
[01:35:47] [PASSED] 0xBD8 (PVC)
[01:35:47] [PASSED] 0xBD9 (PVC)
[01:35:47] [PASSED] 0xBDA (PVC)
[01:35:47] [PASSED] 0xBDB (PVC)
[01:35:47] [PASSED] 0xBE0 (PVC)
[01:35:47] [PASSED] 0xBE1 (PVC)
[01:35:47] [PASSED] 0xBE5 (PVC)
[01:35:47] [PASSED] 0x7D40 (METEORLAKE)
[01:35:47] [PASSED] 0x7D45 (METEORLAKE)
[01:35:47] [PASSED] 0x7D55 (METEORLAKE)
[01:35:47] [PASSED] 0x7D60 (METEORLAKE)
[01:35:47] [PASSED] 0x7DD5 (METEORLAKE)
[01:35:47] [PASSED] 0x6420 (LUNARLAKE)
[01:35:47] [PASSED] 0x64A0 (LUNARLAKE)
[01:35:47] [PASSED] 0x64B0 (LUNARLAKE)
[01:35:47] [PASSED] 0xE202 (BATTLEMAGE)
[01:35:47] [PASSED] 0xE209 (BATTLEMAGE)
[01:35:47] [PASSED] 0xE20B (BATTLEMAGE)
[01:35:47] [PASSED] 0xE20C (BATTLEMAGE)
[01:35:47] [PASSED] 0xE20D (BATTLEMAGE)
[01:35:47] [PASSED] 0xE210 (BATTLEMAGE)
[01:35:47] [PASSED] 0xE211 (BATTLEMAGE)
[01:35:47] [PASSED] 0xE212 (BATTLEMAGE)
[01:35:47] [PASSED] 0xE216 (BATTLEMAGE)
[01:35:47] [PASSED] 0xE220 (BATTLEMAGE)
[01:35:47] [PASSED] 0xE221 (BATTLEMAGE)
[01:35:47] [PASSED] 0xE222 (BATTLEMAGE)
[01:35:47] [PASSED] 0xE223 (BATTLEMAGE)
[01:35:47] [PASSED] 0xB080 (PANTHERLAKE)
[01:35:47] [PASSED] 0xB081 (PANTHERLAKE)
[01:35:47] [PASSED] 0xB082 (PANTHERLAKE)
[01:35:47] [PASSED] 0xB083 (PANTHERLAKE)
[01:35:47] [PASSED] 0xB084 (PANTHERLAKE)
[01:35:47] [PASSED] 0xB085 (PANTHERLAKE)
[01:35:47] [PASSED] 0xB086 (PANTHERLAKE)
[01:35:47] [PASSED] 0xB087 (PANTHERLAKE)
[01:35:47] [PASSED] 0xB08F (PANTHERLAKE)
[01:35:47] [PASSED] 0xB090 (PANTHERLAKE)
[01:35:47] [PASSED] 0xB0A0 (PANTHERLAKE)
[01:35:47] [PASSED] 0xB0B0 (PANTHERLAKE)
[01:35:47] [PASSED] 0xFD80 (PANTHERLAKE)
[01:35:47] [PASSED] 0xFD81 (PANTHERLAKE)
[01:35:47] [PASSED] 0xD740 (NOVALAKE_S)
[01:35:47] [PASSED] 0xD741 (NOVALAKE_S)
[01:35:47] [PASSED] 0xD742 (NOVALAKE_S)
[01:35:47] [PASSED] 0xD743 (NOVALAKE_S)
[01:35:47] [PASSED] 0xD744 (NOVALAKE_S)
[01:35:47] [PASSED] 0xD745 (NOVALAKE_S)
[01:35:47] [PASSED] 0x674C (CRESCENTISLAND)
[01:35:47] =============== [PASSED] check_platform_desc ===============
[01:35:47] ===================== [PASSED] xe_pci ======================
[01:35:47] =================== xe_rtp (2 subtests) ====================
[01:35:47] =============== xe_rtp_process_to_sr_tests  ================
[01:35:47] [PASSED] coalesce-same-reg
[01:35:47] [PASSED] no-match-no-add
[01:35:47] [PASSED] match-or
[01:35:47] [PASSED] match-or-xfail
[01:35:47] [PASSED] no-match-no-add-multiple-rules
[01:35:47] [PASSED] two-regs-two-entries
[01:35:47] [PASSED] clr-one-set-other
[01:35:47] [PASSED] set-field
[01:35:47] [PASSED] conflict-duplicate
[01:35:47] [PASSED] conflict-not-disjoint
[01:35:47] [PASSED] conflict-reg-type
[01:35:47] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[01:35:47] ================== xe_rtp_process_tests  ===================
[01:35:47] [PASSED] active1
[01:35:47] [PASSED] active2
[01:35:47] [PASSED] active-inactive
[01:35:47] [PASSED] inactive-active
[01:35:47] [PASSED] inactive-1st_or_active-inactive
[01:35:47] [PASSED] inactive-2nd_or_active-inactive
[01:35:47] [PASSED] inactive-last_or_active-inactive
[01:35:47] [PASSED] inactive-no_or_active-inactive
[01:35:47] ============== [PASSED] xe_rtp_process_tests ===============
[01:35:47] ===================== [PASSED] xe_rtp ======================
[01:35:47] ==================== xe_wa (1 subtest) =====================
[01:35:47] ======================== xe_wa_gt  =========================
[01:35:47] [PASSED] TIGERLAKE B0
[01:35:47] [PASSED] DG1 A0
[01:35:47] [PASSED] DG1 B0
[01:35:47] [PASSED] ALDERLAKE_S A0
[01:35:47] [PASSED] ALDERLAKE_S B0
[01:35:47] [PASSED] ALDERLAKE_S C0
[01:35:47] [PASSED] ALDERLAKE_S D0
[01:35:47] [PASSED] ALDERLAKE_P A0
[01:35:47] [PASSED] ALDERLAKE_P B0
[01:35:47] [PASSED] ALDERLAKE_P C0
[01:35:47] [PASSED] ALDERLAKE_S RPLS D0
[01:35:47] [PASSED] ALDERLAKE_P RPLU E0
[01:35:47] [PASSED] DG2 G10 C0
[01:35:47] [PASSED] DG2 G11 B1
[01:35:47] [PASSED] DG2 G12 A1
[01:35:47] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[01:35:47] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[01:35:47] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[01:35:47] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[01:35:47] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[01:35:47] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[01:35:47] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[01:35:47] ==================== [PASSED] xe_wa_gt =====================
[01:35:47] ====================== [PASSED] xe_wa ======================
[01:35:47] ============================================================
[01:35:47] Testing complete. Ran 512 tests: passed: 494, skipped: 18
[01:35:47] Elapsed time: 36.277s total, 4.251s configuring, 31.509s building, 0.465s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[01:35:47] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:35:49] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[01:36:14] Starting KUnit Kernel (1/1)...
[01:36:14] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:36:14] ============ drm_test_pick_cmdline (2 subtests) ============
[01:36:14] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[01:36:14] =============== drm_test_pick_cmdline_named  ===============
[01:36:14] [PASSED] NTSC
[01:36:14] [PASSED] NTSC-J
[01:36:14] [PASSED] PAL
[01:36:14] [PASSED] PAL-M
[01:36:14] =========== [PASSED] drm_test_pick_cmdline_named ===========
[01:36:14] ============== [PASSED] drm_test_pick_cmdline ==============
[01:36:14] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[01:36:14] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[01:36:14] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[01:36:14] =========== drm_validate_clone_mode (2 subtests) ===========
[01:36:14] ============== drm_test_check_in_clone_mode  ===============
[01:36:14] [PASSED] in_clone_mode
[01:36:14] [PASSED] not_in_clone_mode
[01:36:14] ========== [PASSED] drm_test_check_in_clone_mode ===========
[01:36:14] =============== drm_test_check_valid_clones  ===============
[01:36:14] [PASSED] not_in_clone_mode
[01:36:14] [PASSED] valid_clone
[01:36:14] [PASSED] invalid_clone
[01:36:14] =========== [PASSED] drm_test_check_valid_clones ===========
[01:36:14] ============= [PASSED] drm_validate_clone_mode =============
[01:36:14] ============= drm_validate_modeset (1 subtest) =============
[01:36:14] [PASSED] drm_test_check_connector_changed_modeset
[01:36:14] ============== [PASSED] drm_validate_modeset ===============
[01:36:14] ====== drm_test_bridge_get_current_state (2 subtests) ======
[01:36:14] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[01:36:14] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[01:36:14] ======== [PASSED] drm_test_bridge_get_current_state ========
[01:36:14] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[01:36:14] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[01:36:14] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[01:36:14] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[01:36:14] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[01:36:14] ============== drm_bridge_alloc (2 subtests) ===============
[01:36:14] [PASSED] drm_test_drm_bridge_alloc_basic
[01:36:14] [PASSED] drm_test_drm_bridge_alloc_get_put
[01:36:14] ================ [PASSED] drm_bridge_alloc =================
[01:36:14] ================== drm_buddy (8 subtests) ==================
[01:36:14] [PASSED] drm_test_buddy_alloc_limit
[01:36:14] [PASSED] drm_test_buddy_alloc_optimistic
[01:36:14] [PASSED] drm_test_buddy_alloc_pessimistic
[01:36:14] [PASSED] drm_test_buddy_alloc_pathological
[01:36:14] [PASSED] drm_test_buddy_alloc_contiguous
[01:36:14] [PASSED] drm_test_buddy_alloc_clear
[01:36:14] [PASSED] drm_test_buddy_alloc_range_bias
[01:36:14] [PASSED] drm_test_buddy_fragmentation_performance
[01:36:14] ==================== [PASSED] drm_buddy ====================
[01:36:14] ============= drm_cmdline_parser (40 subtests) =============
[01:36:14] [PASSED] drm_test_cmdline_force_d_only
[01:36:14] [PASSED] drm_test_cmdline_force_D_only_dvi
[01:36:14] [PASSED] drm_test_cmdline_force_D_only_hdmi
[01:36:14] [PASSED] drm_test_cmdline_force_D_only_not_digital
[01:36:14] [PASSED] drm_test_cmdline_force_e_only
[01:36:14] [PASSED] drm_test_cmdline_res
[01:36:14] [PASSED] drm_test_cmdline_res_vesa
[01:36:14] [PASSED] drm_test_cmdline_res_vesa_rblank
[01:36:14] [PASSED] drm_test_cmdline_res_rblank
[01:36:14] [PASSED] drm_test_cmdline_res_bpp
[01:36:14] [PASSED] drm_test_cmdline_res_refresh
[01:36:14] [PASSED] drm_test_cmdline_res_bpp_refresh
[01:36:14] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[01:36:14] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[01:36:14] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[01:36:14] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[01:36:14] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[01:36:14] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[01:36:14] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[01:36:14] [PASSED] drm_test_cmdline_res_margins_force_on
[01:36:14] [PASSED] drm_test_cmdline_res_vesa_margins
[01:36:14] [PASSED] drm_test_cmdline_name
[01:36:14] [PASSED] drm_test_cmdline_name_bpp
[01:36:14] [PASSED] drm_test_cmdline_name_option
[01:36:14] [PASSED] drm_test_cmdline_name_bpp_option
[01:36:14] [PASSED] drm_test_cmdline_rotate_0
[01:36:14] [PASSED] drm_test_cmdline_rotate_90
[01:36:14] [PASSED] drm_test_cmdline_rotate_180
[01:36:14] [PASSED] drm_test_cmdline_rotate_270
[01:36:14] [PASSED] drm_test_cmdline_hmirror
[01:36:14] [PASSED] drm_test_cmdline_vmirror
[01:36:14] [PASSED] drm_test_cmdline_margin_options
[01:36:14] [PASSED] drm_test_cmdline_multiple_options
[01:36:14] [PASSED] drm_test_cmdline_bpp_extra_and_option
[01:36:14] [PASSED] drm_test_cmdline_extra_and_option
[01:36:14] [PASSED] drm_test_cmdline_freestanding_options
[01:36:14] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[01:36:14] [PASSED] drm_test_cmdline_panel_orientation
[01:36:14] ================ drm_test_cmdline_invalid  =================
[01:36:14] [PASSED] margin_only
[01:36:14] [PASSED] interlace_only
[01:36:14] [PASSED] res_missing_x
[01:36:14] [PASSED] res_missing_y
[01:36:14] [PASSED] res_bad_y
[01:36:14] [PASSED] res_missing_y_bpp
[01:36:14] [PASSED] res_bad_bpp
[01:36:14] [PASSED] res_bad_refresh
[01:36:14] [PASSED] res_bpp_refresh_force_on_off
[01:36:14] [PASSED] res_invalid_mode
[01:36:14] [PASSED] res_bpp_wrong_place_mode
[01:36:14] [PASSED] name_bpp_refresh
[01:36:14] [PASSED] name_refresh
[01:36:14] [PASSED] name_refresh_wrong_mode
[01:36:14] [PASSED] name_refresh_invalid_mode
[01:36:14] [PASSED] rotate_multiple
[01:36:14] [PASSED] rotate_invalid_val
[01:36:14] [PASSED] rotate_truncated
[01:36:14] [PASSED] invalid_option
[01:36:14] [PASSED] invalid_tv_option
[01:36:14] [PASSED] truncated_tv_option
[01:36:14] ============ [PASSED] drm_test_cmdline_invalid =============
[01:36:14] =============== drm_test_cmdline_tv_options  ===============
[01:36:14] [PASSED] NTSC
[01:36:14] [PASSED] NTSC_443
[01:36:14] [PASSED] NTSC_J
[01:36:14] [PASSED] PAL
[01:36:14] [PASSED] PAL_M
[01:36:14] [PASSED] PAL_N
[01:36:14] [PASSED] SECAM
[01:36:14] [PASSED] MONO_525
[01:36:14] [PASSED] MONO_625
[01:36:14] =========== [PASSED] drm_test_cmdline_tv_options ===========
[01:36:14] =============== [PASSED] drm_cmdline_parser ================
[01:36:14] ========== drmm_connector_hdmi_init (20 subtests) ==========
[01:36:14] [PASSED] drm_test_connector_hdmi_init_valid
[01:36:14] [PASSED] drm_test_connector_hdmi_init_bpc_8
[01:36:14] [PASSED] drm_test_connector_hdmi_init_bpc_10
[01:36:14] [PASSED] drm_test_connector_hdmi_init_bpc_12
[01:36:14] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[01:36:14] [PASSED] drm_test_connector_hdmi_init_bpc_null
[01:36:14] [PASSED] drm_test_connector_hdmi_init_formats_empty
[01:36:14] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[01:36:14] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[01:36:14] [PASSED] supported_formats=0x9 yuv420_allowed=1
[01:36:14] [PASSED] supported_formats=0x9 yuv420_allowed=0
[01:36:14] [PASSED] supported_formats=0x3 yuv420_allowed=1
[01:36:14] [PASSED] supported_formats=0x3 yuv420_allowed=0
[01:36:14] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[01:36:14] [PASSED] drm_test_connector_hdmi_init_null_ddc
[01:36:14] [PASSED] drm_test_connector_hdmi_init_null_product
[01:36:14] [PASSED] drm_test_connector_hdmi_init_null_vendor
[01:36:14] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[01:36:14] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[01:36:14] [PASSED] drm_test_connector_hdmi_init_product_valid
[01:36:14] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[01:36:14] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[01:36:14] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[01:36:14] ========= drm_test_connector_hdmi_init_type_valid  =========
[01:36:14] [PASSED] HDMI-A
[01:36:14] [PASSED] HDMI-B
[01:36:14] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[01:36:14] ======== drm_test_connector_hdmi_init_type_invalid  ========
[01:36:14] [PASSED] Unknown
[01:36:14] [PASSED] VGA
[01:36:14] [PASSED] DVI-I
[01:36:14] [PASSED] DVI-D
[01:36:14] [PASSED] DVI-A
[01:36:14] [PASSED] Composite
[01:36:14] [PASSED] SVIDEO
[01:36:14] [PASSED] LVDS
[01:36:14] [PASSED] Component
[01:36:14] [PASSED] DIN
[01:36:14] [PASSED] DP
[01:36:14] [PASSED] TV
[01:36:14] [PASSED] eDP
[01:36:14] [PASSED] Virtual
[01:36:14] [PASSED] DSI
[01:36:14] [PASSED] DPI
[01:36:14] [PASSED] Writeback
[01:36:14] [PASSED] SPI
[01:36:14] [PASSED] USB
[01:36:14] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[01:36:14] ============ [PASSED] drmm_connector_hdmi_init =============
[01:36:14] ============= drmm_connector_init (3 subtests) =============
[01:36:14] [PASSED] drm_test_drmm_connector_init
[01:36:14] [PASSED] drm_test_drmm_connector_init_null_ddc
[01:36:14] ========= drm_test_drmm_connector_init_type_valid  =========
[01:36:14] [PASSED] Unknown
[01:36:14] [PASSED] VGA
[01:36:14] [PASSED] DVI-I
[01:36:14] [PASSED] DVI-D
[01:36:14] [PASSED] DVI-A
[01:36:14] [PASSED] Composite
[01:36:14] [PASSED] SVIDEO
[01:36:14] [PASSED] LVDS
[01:36:14] [PASSED] Component
[01:36:14] [PASSED] DIN
[01:36:14] [PASSED] DP
[01:36:14] [PASSED] HDMI-A
[01:36:14] [PASSED] HDMI-B
[01:36:14] [PASSED] TV
[01:36:14] [PASSED] eDP
[01:36:14] [PASSED] Virtual
[01:36:14] [PASSED] DSI
[01:36:14] [PASSED] DPI
[01:36:14] [PASSED] Writeback
[01:36:14] [PASSED] SPI
[01:36:14] [PASSED] USB
[01:36:14] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[01:36:14] =============== [PASSED] drmm_connector_init ===============
[01:36:14] ========= drm_connector_dynamic_init (6 subtests) ==========
[01:36:14] [PASSED] drm_test_drm_connector_dynamic_init
[01:36:14] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[01:36:14] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[01:36:14] [PASSED] drm_test_drm_connector_dynamic_init_properties
[01:36:14] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[01:36:14] [PASSED] Unknown
[01:36:14] [PASSED] VGA
[01:36:14] [PASSED] DVI-I
[01:36:14] [PASSED] DVI-D
[01:36:14] [PASSED] DVI-A
[01:36:14] [PASSED] Composite
[01:36:14] [PASSED] SVIDEO
[01:36:14] [PASSED] LVDS
[01:36:14] [PASSED] Component
[01:36:14] [PASSED] DIN
[01:36:14] [PASSED] DP
[01:36:14] [PASSED] HDMI-A
[01:36:14] [PASSED] HDMI-B
[01:36:14] [PASSED] TV
[01:36:14] [PASSED] eDP
[01:36:14] [PASSED] Virtual
[01:36:14] [PASSED] DSI
[01:36:14] [PASSED] DPI
[01:36:14] [PASSED] Writeback
[01:36:14] [PASSED] SPI
[01:36:14] [PASSED] USB
[01:36:14] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[01:36:14] ======== drm_test_drm_connector_dynamic_init_name  =========
[01:36:14] [PASSED] Unknown
[01:36:14] [PASSED] VGA
[01:36:14] [PASSED] DVI-I
[01:36:14] [PASSED] DVI-D
[01:36:14] [PASSED] DVI-A
[01:36:14] [PASSED] Composite
[01:36:14] [PASSED] SVIDEO
[01:36:14] [PASSED] LVDS
[01:36:14] [PASSED] Component
[01:36:14] [PASSED] DIN
[01:36:14] [PASSED] DP
[01:36:14] [PASSED] HDMI-A
[01:36:14] [PASSED] HDMI-B
[01:36:14] [PASSED] TV
[01:36:14] [PASSED] eDP
[01:36:14] [PASSED] Virtual
[01:36:14] [PASSED] DSI
[01:36:14] [PASSED] DPI
[01:36:14] [PASSED] Writeback
[01:36:14] [PASSED] SPI
[01:36:14] [PASSED] USB
[01:36:14] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[01:36:14] =========== [PASSED] drm_connector_dynamic_init ============
[01:36:14] ==== drm_connector_dynamic_register_early (4 subtests) =====
[01:36:14] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[01:36:14] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[01:36:14] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[01:36:14] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[01:36:14] ====== [PASSED] drm_connector_dynamic_register_early =======
[01:36:14] ======= drm_connector_dynamic_register (7 subtests) ========
[01:36:14] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[01:36:14] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[01:36:14] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[01:36:14] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[01:36:14] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[01:36:14] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[01:36:14] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[01:36:14] ========= [PASSED] drm_connector_dynamic_register ==========
[01:36:14] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[01:36:14] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[01:36:14] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[01:36:14] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[01:36:14] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[01:36:14] ========== drm_test_get_tv_mode_from_name_valid  ===========
[01:36:14] [PASSED] NTSC
[01:36:14] [PASSED] NTSC-443
[01:36:14] [PASSED] NTSC-J
[01:36:14] [PASSED] PAL
[01:36:14] [PASSED] PAL-M
[01:36:14] [PASSED] PAL-N
[01:36:14] [PASSED] SECAM
[01:36:14] [PASSED] Mono
[01:36:14] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[01:36:14] [PASSED] drm_test_get_tv_mode_from_name_truncated
[01:36:14] ============ [PASSED] drm_get_tv_mode_from_name ============
[01:36:14] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[01:36:14] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[01:36:14] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[01:36:14] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[01:36:14] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[01:36:14] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[01:36:14] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[01:36:14] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[01:36:14] [PASSED] VIC 96
[01:36:14] [PASSED] VIC 97
[01:36:14] [PASSED] VIC 101
[01:36:14] [PASSED] VIC 102
[01:36:14] [PASSED] VIC 106
[01:36:14] [PASSED] VIC 107
[01:36:14] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[01:36:14] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[01:36:14] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[01:36:14] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[01:36:14] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[01:36:14] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[01:36:14] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[01:36:14] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[01:36:14] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[01:36:14] [PASSED] Automatic
[01:36:14] [PASSED] Full
[01:36:14] [PASSED] Limited 16:235
[01:36:14] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[01:36:14] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[01:36:14] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[01:36:14] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[01:36:14] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[01:36:14] [PASSED] RGB
[01:36:14] [PASSED] YUV 4:2:0
[01:36:14] [PASSED] YUV 4:2:2
[01:36:14] [PASSED] YUV 4:4:4
[01:36:14] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[01:36:14] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[01:36:14] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[01:36:14] ============= drm_damage_helper (21 subtests) ==============
[01:36:14] [PASSED] drm_test_damage_iter_no_damage
[01:36:14] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[01:36:14] [PASSED] drm_test_damage_iter_no_damage_src_moved
[01:36:14] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[01:36:14] [PASSED] drm_test_damage_iter_no_damage_not_visible
[01:36:14] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[01:36:14] [PASSED] drm_test_damage_iter_no_damage_no_fb
[01:36:14] [PASSED] drm_test_damage_iter_simple_damage
[01:36:14] [PASSED] drm_test_damage_iter_single_damage
[01:36:14] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[01:36:14] [PASSED] drm_test_damage_iter_single_damage_outside_src
[01:36:14] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[01:36:14] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[01:36:14] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[01:36:14] [PASSED] drm_test_damage_iter_single_damage_src_moved
[01:36:14] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[01:36:14] [PASSED] drm_test_damage_iter_damage
[01:36:14] [PASSED] drm_test_damage_iter_damage_one_intersect
[01:36:14] [PASSED] drm_test_damage_iter_damage_one_outside
[01:36:14] [PASSED] drm_test_damage_iter_damage_src_moved
[01:36:14] [PASSED] drm_test_damage_iter_damage_not_visible
[01:36:14] ================ [PASSED] drm_damage_helper ================
[01:36:14] ============== drm_dp_mst_helper (3 subtests) ==============
[01:36:14] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[01:36:14] [PASSED] Clock 154000 BPP 30 DSC disabled
[01:36:14] [PASSED] Clock 234000 BPP 30 DSC disabled
[01:36:14] [PASSED] Clock 297000 BPP 24 DSC disabled
[01:36:14] [PASSED] Clock 332880 BPP 24 DSC enabled
[01:36:14] [PASSED] Clock 324540 BPP 24 DSC enabled
[01:36:14] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[01:36:14] ============== drm_test_dp_mst_calc_pbn_div  ===============
[01:36:14] [PASSED] Link rate 2000000 lane count 4
[01:36:14] [PASSED] Link rate 2000000 lane count 2
[01:36:14] [PASSED] Link rate 2000000 lane count 1
[01:36:14] [PASSED] Link rate 1350000 lane count 4
[01:36:14] [PASSED] Link rate 1350000 lane count 2
[01:36:14] [PASSED] Link rate 1350000 lane count 1
[01:36:14] [PASSED] Link rate 1000000 lane count 4
[01:36:14] [PASSED] Link rate 1000000 lane count 2
[01:36:14] [PASSED] Link rate 1000000 lane count 1
[01:36:14] [PASSED] Link rate 810000 lane count 4
[01:36:14] [PASSED] Link rate 810000 lane count 2
[01:36:14] [PASSED] Link rate 810000 lane count 1
[01:36:14] [PASSED] Link rate 540000 lane count 4
[01:36:14] [PASSED] Link rate 540000 lane count 2
[01:36:14] [PASSED] Link rate 540000 lane count 1
[01:36:14] [PASSED] Link rate 270000 lane count 4
[01:36:14] [PASSED] Link rate 270000 lane count 2
[01:36:14] [PASSED] Link rate 270000 lane count 1
[01:36:14] [PASSED] Link rate 162000 lane count 4
[01:36:14] [PASSED] Link rate 162000 lane count 2
[01:36:14] [PASSED] Link rate 162000 lane count 1
[01:36:14] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[01:36:14] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[01:36:14] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[01:36:14] [PASSED] DP_POWER_UP_PHY with port number
[01:36:14] [PASSED] DP_POWER_DOWN_PHY with port number
[01:36:14] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[01:36:14] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[01:36:14] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[01:36:14] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[01:36:14] [PASSED] DP_QUERY_PAYLOAD with port number
[01:36:14] [PASSED] DP_QUERY_PAYLOAD with VCPI
[01:36:14] [PASSED] DP_REMOTE_DPCD_READ with port number
[01:36:14] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[01:36:14] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[01:36:14] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[01:36:14] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[01:36:14] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[01:36:14] [PASSED] DP_REMOTE_I2C_READ with port number
[01:36:14] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[01:36:14] [PASSED] DP_REMOTE_I2C_READ with transactions array
[01:36:14] [PASSED] DP_REMOTE_I2C_WRITE with port number
[01:36:14] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[01:36:14] [PASSED] DP_REMOTE_I2C_WRITE with data array
[01:36:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[01:36:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[01:36:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[01:36:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[01:36:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[01:36:14] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[01:36:14] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[01:36:14] ================ [PASSED] drm_dp_mst_helper ================
[01:36:14] ================== drm_exec (7 subtests) ===================
[01:36:14] [PASSED] sanitycheck
[01:36:14] [PASSED] test_lock
[01:36:14] [PASSED] test_lock_unlock
[01:36:14] [PASSED] test_duplicates
[01:36:14] [PASSED] test_prepare
[01:36:14] [PASSED] test_prepare_array
[01:36:14] [PASSED] test_multiple_loops
[01:36:14] ==================== [PASSED] drm_exec =====================
[01:36:14] =========== drm_format_helper_test (17 subtests) ===========
[01:36:14] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[01:36:14] [PASSED] single_pixel_source_buffer
[01:36:14] [PASSED] single_pixel_clip_rectangle
[01:36:14] [PASSED] well_known_colors
[01:36:14] [PASSED] destination_pitch
[01:36:14] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[01:36:14] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[01:36:14] [PASSED] single_pixel_source_buffer
[01:36:14] [PASSED] single_pixel_clip_rectangle
[01:36:14] [PASSED] well_known_colors
[01:36:14] [PASSED] destination_pitch
[01:36:14] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[01:36:14] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[01:36:14] [PASSED] single_pixel_source_buffer
[01:36:14] [PASSED] single_pixel_clip_rectangle
[01:36:14] [PASSED] well_known_colors
[01:36:14] [PASSED] destination_pitch
[01:36:14] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[01:36:14] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[01:36:14] [PASSED] single_pixel_source_buffer
[01:36:14] [PASSED] single_pixel_clip_rectangle
[01:36:14] [PASSED] well_known_colors
[01:36:14] [PASSED] destination_pitch
[01:36:14] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[01:36:14] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[01:36:14] [PASSED] single_pixel_source_buffer
[01:36:14] [PASSED] single_pixel_clip_rectangle
[01:36:14] [PASSED] well_known_colors
[01:36:14] [PASSED] destination_pitch
[01:36:14] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[01:36:14] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[01:36:14] [PASSED] single_pixel_source_buffer
[01:36:14] [PASSED] single_pixel_clip_rectangle
[01:36:14] [PASSED] well_known_colors
[01:36:14] [PASSED] destination_pitch
[01:36:14] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[01:36:14] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[01:36:14] [PASSED] single_pixel_source_buffer
[01:36:14] [PASSED] single_pixel_clip_rectangle
[01:36:14] [PASSED] well_known_colors
[01:36:14] [PASSED] destination_pitch
[01:36:14] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[01:36:14] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[01:36:14] [PASSED] single_pixel_source_buffer
[01:36:14] [PASSED] single_pixel_clip_rectangle
[01:36:14] [PASSED] well_known_colors
[01:36:14] [PASSED] destination_pitch
[01:36:14] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[01:36:14] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[01:36:14] [PASSED] single_pixel_source_buffer
[01:36:14] [PASSED] single_pixel_clip_rectangle
[01:36:14] [PASSED] well_known_colors
[01:36:14] [PASSED] destination_pitch
[01:36:14] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[01:36:14] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[01:36:14] [PASSED] single_pixel_source_buffer
[01:36:14] [PASSED] single_pixel_clip_rectangle
[01:36:14] [PASSED] well_known_colors
[01:36:14] [PASSED] destination_pitch
[01:36:14] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[01:36:14] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[01:36:14] [PASSED] single_pixel_source_buffer
[01:36:14] [PASSED] single_pixel_clip_rectangle
[01:36:14] [PASSED] well_known_colors
[01:36:14] [PASSED] destination_pitch
[01:36:14] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[01:36:14] ============== drm_test_fb_xrgb8888_to_mono  ===============
[01:36:14] [PASSED] single_pixel_source_buffer
[01:36:14] [PASSED] single_pixel_clip_rectangle
[01:36:14] [PASSED] well_known_colors
[01:36:14] [PASSED] destination_pitch
[01:36:14] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[01:36:14] ==================== drm_test_fb_swab  =====================
[01:36:14] [PASSED] single_pixel_source_buffer
[01:36:14] [PASSED] single_pixel_clip_rectangle
[01:36:14] [PASSED] well_known_colors
[01:36:14] [PASSED] destination_pitch
[01:36:14] ================ [PASSED] drm_test_fb_swab =================
[01:36:14] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[01:36:14] [PASSED] single_pixel_source_buffer
[01:36:14] [PASSED] single_pixel_clip_rectangle
[01:36:14] [PASSED] well_known_colors
[01:36:14] [PASSED] destination_pitch
[01:36:14] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[01:36:14] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[01:36:14] [PASSED] single_pixel_source_buffer
[01:36:14] [PASSED] single_pixel_clip_rectangle
[01:36:14] [PASSED] well_known_colors
[01:36:14] [PASSED] destination_pitch
[01:36:14] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[01:36:14] ================= drm_test_fb_clip_offset  =================
[01:36:14] [PASSED] pass through
[01:36:14] [PASSED] horizontal offset
[01:36:14] [PASSED] vertical offset
[01:36:14] [PASSED] horizontal and vertical offset
[01:36:14] [PASSED] horizontal offset (custom pitch)
[01:36:14] [PASSED] vertical offset (custom pitch)
[01:36:14] [PASSED] horizontal and vertical offset (custom pitch)
[01:36:14] ============= [PASSED] drm_test_fb_clip_offset =============
[01:36:14] =================== drm_test_fb_memcpy  ====================
[01:36:14] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[01:36:14] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[01:36:14] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[01:36:14] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[01:36:14] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[01:36:14] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[01:36:14] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[01:36:14] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[01:36:14] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[01:36:14] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[01:36:14] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[01:36:14] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[01:36:14] =============== [PASSED] drm_test_fb_memcpy ================
[01:36:14] ============= [PASSED] drm_format_helper_test ==============
[01:36:14] ================= drm_format (18 subtests) =================
[01:36:14] [PASSED] drm_test_format_block_width_invalid
[01:36:14] [PASSED] drm_test_format_block_width_one_plane
[01:36:14] [PASSED] drm_test_format_block_width_two_plane
[01:36:14] [PASSED] drm_test_format_block_width_three_plane
[01:36:14] [PASSED] drm_test_format_block_width_tiled
[01:36:14] [PASSED] drm_test_format_block_height_invalid
[01:36:14] [PASSED] drm_test_format_block_height_one_plane
[01:36:14] [PASSED] drm_test_format_block_height_two_plane
[01:36:14] [PASSED] drm_test_format_block_height_three_plane
[01:36:14] [PASSED] drm_test_format_block_height_tiled
[01:36:14] [PASSED] drm_test_format_min_pitch_invalid
[01:36:14] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[01:36:14] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[01:36:14] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[01:36:14] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[01:36:14] [PASSED] drm_test_format_min_pitch_two_plane
[01:36:14] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[01:36:14] [PASSED] drm_test_format_min_pitch_tiled
[01:36:14] =================== [PASSED] drm_format ====================
[01:36:14] ============== drm_framebuffer (10 subtests) ===============
[01:36:14] ========== drm_test_framebuffer_check_src_coords  ==========
[01:36:14] [PASSED] Success: source fits into fb
[01:36:14] [PASSED] Fail: overflowing fb with x-axis coordinate
[01:36:14] [PASSED] Fail: overflowing fb with y-axis coordinate
[01:36:14] [PASSED] Fail: overflowing fb with source width
[01:36:14] [PASSED] Fail: overflowing fb with source height
[01:36:14] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[01:36:14] [PASSED] drm_test_framebuffer_cleanup
[01:36:14] =============== drm_test_framebuffer_create  ===============
[01:36:14] [PASSED] ABGR8888 normal sizes
[01:36:14] [PASSED] ABGR8888 max sizes
[01:36:14] [PASSED] ABGR8888 pitch greater than min required
[01:36:14] [PASSED] ABGR8888 pitch less than min required
[01:36:14] [PASSED] ABGR8888 Invalid width
[01:36:14] [PASSED] ABGR8888 Invalid buffer handle
[01:36:14] [PASSED] No pixel format
[01:36:14] [PASSED] ABGR8888 Width 0
[01:36:14] [PASSED] ABGR8888 Height 0
[01:36:14] [PASSED] ABGR8888 Out of bound height * pitch combination
[01:36:14] [PASSED] ABGR8888 Large buffer offset
[01:36:14] [PASSED] ABGR8888 Buffer offset for inexistent plane
[01:36:14] [PASSED] ABGR8888 Invalid flag
[01:36:14] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[01:36:14] [PASSED] ABGR8888 Valid buffer modifier
[01:36:14] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[01:36:14] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[01:36:14] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[01:36:14] [PASSED] NV12 Normal sizes
[01:36:14] [PASSED] NV12 Max sizes
[01:36:14] [PASSED] NV12 Invalid pitch
[01:36:14] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[01:36:14] [PASSED] NV12 different  modifier per-plane
[01:36:14] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[01:36:14] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[01:36:14] [PASSED] NV12 Modifier for inexistent plane
[01:36:14] [PASSED] NV12 Handle for inexistent plane
[01:36:14] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[01:36:14] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[01:36:14] [PASSED] YVU420 Normal sizes
[01:36:14] [PASSED] YVU420 Max sizes
[01:36:14] [PASSED] YVU420 Invalid pitch
[01:36:14] [PASSED] YVU420 Different pitches
[01:36:14] [PASSED] YVU420 Different buffer offsets/pitches
[01:36:14] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[01:36:14] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[01:36:14] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[01:36:14] [PASSED] YVU420 Valid modifier
[01:36:14] [PASSED] YVU420 Different modifiers per plane
[01:36:14] [PASSED] YVU420 Modifier for inexistent plane
[01:36:14] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[01:36:14] [PASSED] X0L2 Normal sizes
[01:36:14] [PASSED] X0L2 Max sizes
[01:36:14] [PASSED] X0L2 Invalid pitch
[01:36:14] [PASSED] X0L2 Pitch greater than minimum required
[01:36:14] [PASSED] X0L2 Handle for inexistent plane
[01:36:14] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[01:36:14] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[01:36:14] [PASSED] X0L2 Valid modifier
[01:36:14] [PASSED] X0L2 Modifier for inexistent plane
[01:36:14] =========== [PASSED] drm_test_framebuffer_create ===========
[01:36:14] [PASSED] drm_test_framebuffer_free
[01:36:14] [PASSED] drm_test_framebuffer_init
[01:36:14] [PASSED] drm_test_framebuffer_init_bad_format
[01:36:14] [PASSED] drm_test_framebuffer_init_dev_mismatch
[01:36:14] [PASSED] drm_test_framebuffer_lookup
[01:36:14] [PASSED] drm_test_framebuffer_lookup_inexistent
[01:36:14] [PASSED] drm_test_framebuffer_modifiers_not_supported
[01:36:14] ================= [PASSED] drm_framebuffer =================
[01:36:14] ================ drm_gem_shmem (8 subtests) ================
[01:36:14] [PASSED] drm_gem_shmem_test_obj_create
[01:36:14] [PASSED] drm_gem_shmem_test_obj_create_private
[01:36:14] [PASSED] drm_gem_shmem_test_pin_pages
[01:36:14] [PASSED] drm_gem_shmem_test_vmap
[01:36:14] [PASSED] drm_gem_shmem_test_get_sg_table
[01:36:14] [PASSED] drm_gem_shmem_test_get_pages_sgt
[01:36:14] [PASSED] drm_gem_shmem_test_madvise
[01:36:14] [PASSED] drm_gem_shmem_test_purge
[01:36:14] ================== [PASSED] drm_gem_shmem ==================
[01:36:14] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[01:36:14] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[01:36:14] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[01:36:14] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[01:36:14] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[01:36:14] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[01:36:14] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[01:36:14] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[01:36:14] [PASSED] Automatic
[01:36:14] [PASSED] Full
[01:36:14] [PASSED] Limited 16:235
[01:36:14] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[01:36:14] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[01:36:14] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[01:36:14] [PASSED] drm_test_check_disable_connector
[01:36:14] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[01:36:14] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[01:36:14] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[01:36:14] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[01:36:14] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[01:36:14] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[01:36:14] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[01:36:14] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[01:36:14] [PASSED] drm_test_check_output_bpc_dvi
[01:36:14] [PASSED] drm_test_check_output_bpc_format_vic_1
[01:36:14] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[01:36:14] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[01:36:14] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[01:36:14] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[01:36:14] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[01:36:14] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[01:36:14] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[01:36:14] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[01:36:14] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[01:36:14] [PASSED] drm_test_check_broadcast_rgb_value
[01:36:14] [PASSED] drm_test_check_bpc_8_value
[01:36:14] [PASSED] drm_test_check_bpc_10_value
[01:36:14] [PASSED] drm_test_check_bpc_12_value
[01:36:14] [PASSED] drm_test_check_format_value
[01:36:14] [PASSED] drm_test_check_tmds_char_value
[01:36:14] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[01:36:14] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[01:36:14] [PASSED] drm_test_check_mode_valid
[01:36:14] [PASSED] drm_test_check_mode_valid_reject
[01:36:14] [PASSED] drm_test_check_mode_valid_reject_rate
[01:36:14] [PASSED] drm_test_check_mode_valid_reject_max_clock
[01:36:14] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[01:36:14] ================= drm_managed (2 subtests) =================
[01:36:14] [PASSED] drm_test_managed_release_action
[01:36:14] [PASSED] drm_test_managed_run_action
[01:36:14] =================== [PASSED] drm_managed ===================
[01:36:14] =================== drm_mm (6 subtests) ====================
[01:36:14] [PASSED] drm_test_mm_init
[01:36:14] [PASSED] drm_test_mm_debug
[01:36:14] [PASSED] drm_test_mm_align32
[01:36:14] [PASSED] drm_test_mm_align64
[01:36:14] [PASSED] drm_test_mm_lowest
[01:36:14] [PASSED] drm_test_mm_highest
[01:36:14] ===================== [PASSED] drm_mm ======================
[01:36:14] ============= drm_modes_analog_tv (5 subtests) =============
[01:36:14] [PASSED] drm_test_modes_analog_tv_mono_576i
[01:36:14] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[01:36:14] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[01:36:14] [PASSED] drm_test_modes_analog_tv_pal_576i
[01:36:14] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[01:36:14] =============== [PASSED] drm_modes_analog_tv ===============
[01:36:14] ============== drm_plane_helper (2 subtests) ===============
[01:36:14] =============== drm_test_check_plane_state  ================
[01:36:14] [PASSED] clipping_simple
[01:36:14] [PASSED] clipping_rotate_reflect
[01:36:14] [PASSED] positioning_simple
[01:36:14] [PASSED] upscaling
[01:36:14] [PASSED] downscaling
[01:36:14] [PASSED] rounding1
[01:36:14] [PASSED] rounding2
[01:36:14] [PASSED] rounding3
[01:36:14] [PASSED] rounding4
[01:36:14] =========== [PASSED] drm_test_check_plane_state ============
[01:36:14] =========== drm_test_check_invalid_plane_state  ============
[01:36:14] [PASSED] positioning_invalid
[01:36:14] [PASSED] upscaling_invalid
[01:36:14] [PASSED] downscaling_invalid
[01:36:14] ======= [PASSED] drm_test_check_invalid_plane_state ========
[01:36:14] ================ [PASSED] drm_plane_helper =================
[01:36:14] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[01:36:14] ====== drm_test_connector_helper_tv_get_modes_check  =======
[01:36:14] [PASSED] None
[01:36:14] [PASSED] PAL
[01:36:14] [PASSED] NTSC
[01:36:14] [PASSED] Both, NTSC Default
[01:36:14] [PASSED] Both, PAL Default
[01:36:14] [PASSED] Both, NTSC Default, with PAL on command-line
[01:36:14] [PASSED] Both, PAL Default, with NTSC on command-line
[01:36:14] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[01:36:14] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[01:36:14] ================== drm_rect (9 subtests) ===================
[01:36:14] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[01:36:14] [PASSED] drm_test_rect_clip_scaled_not_clipped
[01:36:14] [PASSED] drm_test_rect_clip_scaled_clipped
[01:36:14] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[01:36:14] ================= drm_test_rect_intersect  =================
[01:36:14] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[01:36:14] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[01:36:14] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[01:36:14] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[01:36:14] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[01:36:14] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[01:36:14] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[01:36:14] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[01:36:14] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[01:36:14] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[01:36:14] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[01:36:14] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[01:36:14] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[01:36:14] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[01:36:14] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[01:36:14] ============= [PASSED] drm_test_rect_intersect =============
[01:36:14] ================ drm_test_rect_calc_hscale  ================
[01:36:14] [PASSED] normal use
[01:36:14] [PASSED] out of max range
[01:36:14] [PASSED] out of min range
[01:36:14] [PASSED] zero dst
[01:36:14] [PASSED] negative src
[01:36:14] [PASSED] negative dst
[01:36:14] ============ [PASSED] drm_test_rect_calc_hscale ============
[01:36:14] ================ drm_test_rect_calc_vscale  ================
[01:36:14] [PASSED] normal use
stty: 'standard input': Inappropriate ioctl for device
[01:36:14] [PASSED] out of max range
[01:36:14] [PASSED] out of min range
[01:36:14] [PASSED] zero dst
[01:36:14] [PASSED] negative src
[01:36:14] [PASSED] negative dst
[01:36:14] ============ [PASSED] drm_test_rect_calc_vscale ============
[01:36:14] ================== drm_test_rect_rotate  ===================
[01:36:14] [PASSED] reflect-x
[01:36:14] [PASSED] reflect-y
[01:36:14] [PASSED] rotate-0
[01:36:14] [PASSED] rotate-90
[01:36:14] [PASSED] rotate-180
[01:36:14] [PASSED] rotate-270
[01:36:14] ============== [PASSED] drm_test_rect_rotate ===============
[01:36:14] ================ drm_test_rect_rotate_inv  =================
[01:36:14] [PASSED] reflect-x
[01:36:14] [PASSED] reflect-y
[01:36:14] [PASSED] rotate-0
[01:36:14] [PASSED] rotate-90
[01:36:14] [PASSED] rotate-180
[01:36:14] [PASSED] rotate-270
[01:36:14] ============ [PASSED] drm_test_rect_rotate_inv =============
[01:36:14] ==================== [PASSED] drm_rect =====================
[01:36:14] ============ drm_sysfb_modeset_test (1 subtest) ============
[01:36:14] ============ drm_test_sysfb_build_fourcc_list  =============
[01:36:14] [PASSED] no native formats
[01:36:14] [PASSED] XRGB8888 as native format
[01:36:14] [PASSED] remove duplicates
[01:36:14] [PASSED] convert alpha formats
[01:36:14] [PASSED] random formats
[01:36:14] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[01:36:14] ============= [PASSED] drm_sysfb_modeset_test ==============
[01:36:14] ================== drm_fixp (2 subtests) ===================
[01:36:14] [PASSED] drm_test_int2fixp
[01:36:14] [PASSED] drm_test_sm2fixp
[01:36:14] ==================== [PASSED] drm_fixp =====================
[01:36:14] ============================================================
[01:36:14] Testing complete. Ran 624 tests: passed: 624
[01:36:14] Elapsed time: 27.396s total, 1.753s configuring, 25.225s building, 0.375s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[01:36:15] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:36:16] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[01:36:26] Starting KUnit Kernel (1/1)...
[01:36:26] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[01:36:26] ================= ttm_device (5 subtests) ==================
[01:36:26] [PASSED] ttm_device_init_basic
[01:36:26] [PASSED] ttm_device_init_multiple
[01:36:26] [PASSED] ttm_device_fini_basic
[01:36:26] [PASSED] ttm_device_init_no_vma_man
[01:36:26] ================== ttm_device_init_pools  ==================
[01:36:26] [PASSED] No DMA allocations, no DMA32 required
[01:36:26] [PASSED] DMA allocations, DMA32 required
[01:36:26] [PASSED] No DMA allocations, DMA32 required
[01:36:26] [PASSED] DMA allocations, no DMA32 required
[01:36:26] ============== [PASSED] ttm_device_init_pools ==============
[01:36:26] =================== [PASSED] ttm_device ====================
[01:36:26] ================== ttm_pool (8 subtests) ===================
[01:36:26] ================== ttm_pool_alloc_basic  ===================
[01:36:26] [PASSED] One page
[01:36:26] [PASSED] More than one page
[01:36:26] [PASSED] Above the allocation limit
[01:36:26] [PASSED] One page, with coherent DMA mappings enabled
[01:36:26] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[01:36:26] ============== [PASSED] ttm_pool_alloc_basic ===============
[01:36:26] ============== ttm_pool_alloc_basic_dma_addr  ==============
[01:36:26] [PASSED] One page
[01:36:26] [PASSED] More than one page
[01:36:26] [PASSED] Above the allocation limit
[01:36:26] [PASSED] One page, with coherent DMA mappings enabled
[01:36:26] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[01:36:26] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[01:36:26] [PASSED] ttm_pool_alloc_order_caching_match
[01:36:26] [PASSED] ttm_pool_alloc_caching_mismatch
[01:36:26] [PASSED] ttm_pool_alloc_order_mismatch
[01:36:26] [PASSED] ttm_pool_free_dma_alloc
[01:36:26] [PASSED] ttm_pool_free_no_dma_alloc
[01:36:26] [PASSED] ttm_pool_fini_basic
[01:36:26] ==================== [PASSED] ttm_pool =====================
[01:36:26] ================ ttm_resource (8 subtests) =================
[01:36:26] ================= ttm_resource_init_basic  =================
[01:36:26] [PASSED] Init resource in TTM_PL_SYSTEM
[01:36:26] [PASSED] Init resource in TTM_PL_VRAM
[01:36:26] [PASSED] Init resource in a private placement
[01:36:26] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[01:36:26] ============= [PASSED] ttm_resource_init_basic =============
[01:36:26] [PASSED] ttm_resource_init_pinned
[01:36:26] [PASSED] ttm_resource_fini_basic
[01:36:26] [PASSED] ttm_resource_manager_init_basic
[01:36:26] [PASSED] ttm_resource_manager_usage_basic
[01:36:26] [PASSED] ttm_resource_manager_set_used_basic
[01:36:26] [PASSED] ttm_sys_man_alloc_basic
[01:36:26] [PASSED] ttm_sys_man_free_basic
[01:36:26] ================== [PASSED] ttm_resource ===================
[01:36:26] =================== ttm_tt (15 subtests) ===================
[01:36:26] ==================== ttm_tt_init_basic  ====================
[01:36:26] [PASSED] Page-aligned size
[01:36:26] [PASSED] Extra pages requested
[01:36:26] ================ [PASSED] ttm_tt_init_basic ================
[01:36:26] [PASSED] ttm_tt_init_misaligned
[01:36:26] [PASSED] ttm_tt_fini_basic
[01:36:26] [PASSED] ttm_tt_fini_sg
[01:36:26] [PASSED] ttm_tt_fini_shmem
[01:36:26] [PASSED] ttm_tt_create_basic
[01:36:26] [PASSED] ttm_tt_create_invalid_bo_type
[01:36:26] [PASSED] ttm_tt_create_ttm_exists
[01:36:26] [PASSED] ttm_tt_create_failed
[01:36:26] [PASSED] ttm_tt_destroy_basic
[01:36:26] [PASSED] ttm_tt_populate_null_ttm
[01:36:26] [PASSED] ttm_tt_populate_populated_ttm
[01:36:26] [PASSED] ttm_tt_unpopulate_basic
[01:36:26] [PASSED] ttm_tt_unpopulate_empty_ttm
[01:36:26] [PASSED] ttm_tt_swapin_basic
[01:36:26] ===================== [PASSED] ttm_tt ======================
[01:36:26] =================== ttm_bo (14 subtests) ===================
[01:36:26] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[01:36:26] [PASSED] Cannot be interrupted and sleeps
[01:36:26] [PASSED] Cannot be interrupted, locks straight away
[01:36:26] [PASSED] Can be interrupted, sleeps
[01:36:26] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[01:36:26] [PASSED] ttm_bo_reserve_locked_no_sleep
[01:36:26] [PASSED] ttm_bo_reserve_no_wait_ticket
[01:36:26] [PASSED] ttm_bo_reserve_double_resv
[01:36:26] [PASSED] ttm_bo_reserve_interrupted
[01:36:26] [PASSED] ttm_bo_reserve_deadlock
[01:36:26] [PASSED] ttm_bo_unreserve_basic
[01:36:26] [PASSED] ttm_bo_unreserve_pinned
[01:36:26] [PASSED] ttm_bo_unreserve_bulk
[01:36:26] [PASSED] ttm_bo_fini_basic
[01:36:26] [PASSED] ttm_bo_fini_shared_resv
[01:36:26] [PASSED] ttm_bo_pin_basic
[01:36:26] [PASSED] ttm_bo_pin_unpin_resource
[01:36:26] [PASSED] ttm_bo_multiple_pin_one_unpin
[01:36:26] ===================== [PASSED] ttm_bo ======================
[01:36:26] ============== ttm_bo_validate (21 subtests) ===============
[01:36:26] ============== ttm_bo_init_reserved_sys_man  ===============
[01:36:26] [PASSED] Buffer object for userspace
[01:36:26] [PASSED] Kernel buffer object
[01:36:26] [PASSED] Shared buffer object
[01:36:26] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[01:36:26] ============== ttm_bo_init_reserved_mock_man  ==============
[01:36:26] [PASSED] Buffer object for userspace
[01:36:26] [PASSED] Kernel buffer object
[01:36:26] [PASSED] Shared buffer object
[01:36:26] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[01:36:26] [PASSED] ttm_bo_init_reserved_resv
[01:36:26] ================== ttm_bo_validate_basic  ==================
[01:36:26] [PASSED] Buffer object for userspace
[01:36:26] [PASSED] Kernel buffer object
[01:36:26] [PASSED] Shared buffer object
[01:36:26] ============== [PASSED] ttm_bo_validate_basic ==============
[01:36:26] [PASSED] ttm_bo_validate_invalid_placement
[01:36:26] ============= ttm_bo_validate_same_placement  ==============
[01:36:26] [PASSED] System manager
[01:36:26] [PASSED] VRAM manager
[01:36:26] ========= [PASSED] ttm_bo_validate_same_placement ==========
[01:36:26] [PASSED] ttm_bo_validate_failed_alloc
[01:36:26] [PASSED] ttm_bo_validate_pinned
[01:36:26] [PASSED] ttm_bo_validate_busy_placement
[01:36:26] ================ ttm_bo_validate_multihop  =================
[01:36:26] [PASSED] Buffer object for userspace
[01:36:26] [PASSED] Kernel buffer object
[01:36:26] [PASSED] Shared buffer object
[01:36:26] ============ [PASSED] ttm_bo_validate_multihop =============
[01:36:26] ========== ttm_bo_validate_no_placement_signaled  ==========
[01:36:26] [PASSED] Buffer object in system domain, no page vector
[01:36:26] [PASSED] Buffer object in system domain with an existing page vector
[01:36:26] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[01:36:26] ======== ttm_bo_validate_no_placement_not_signaled  ========
[01:36:26] [PASSED] Buffer object for userspace
[01:36:26] [PASSED] Kernel buffer object
[01:36:26] [PASSED] Shared buffer object
[01:36:26] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[01:36:26] [PASSED] ttm_bo_validate_move_fence_signaled
[01:36:26] ========= ttm_bo_validate_move_fence_not_signaled  =========
[01:36:26] [PASSED] Waits for GPU
[01:36:26] [PASSED] Tries to lock straight away
[01:36:26] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[01:36:26] [PASSED] ttm_bo_validate_happy_evict
[01:36:26] [PASSED] ttm_bo_validate_all_pinned_evict
[01:36:26] [PASSED] ttm_bo_validate_allowed_only_evict
[01:36:26] [PASSED] ttm_bo_validate_deleted_evict
[01:36:26] [PASSED] ttm_bo_validate_busy_domain_evict
[01:36:26] [PASSED] ttm_bo_validate_evict_gutting
[01:36:26] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[01:36:26] ================= [PASSED] ttm_bo_validate =================
[01:36:26] ============================================================
[01:36:26] Testing complete. Ran 101 tests: passed: 101
[01:36:26] Elapsed time: 11.522s total, 1.656s configuring, 9.600s building, 0.232s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


