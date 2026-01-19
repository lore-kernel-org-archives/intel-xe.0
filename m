Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0FDD29C30
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 14:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAAC10E470;
	Mon, 19 Jan 2026 14:37:08 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17D010E470;
 Mon, 19 Jan 2026 14:37:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe=3A_derive_mem_copy_capa?=
 =?utf-8?q?bility_from_graphics_version_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 Jan 2026 14:37:06 -0000
Message-ID: <176883342691.167261.14187798180320694269@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260119150304.1739757-2-nitin.r.gote@intel.com>
In-Reply-To: <20260119150304.1739757-2-nitin.r.gote@intel.com>
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

Series: drm/xe: derive mem copy capability from graphics version (rev2)
URL   : https://patchwork.freedesktop.org/series/160286/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[14:35:59] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:36:03] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[14:36:35] Starting KUnit Kernel (1/1)...
[14:36:35] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[14:36:35] ================== guc_buf (11 subtests) ===================
[14:36:35] [PASSED] test_smallest
[14:36:35] [PASSED] test_largest
[14:36:35] [PASSED] test_granular
[14:36:35] [PASSED] test_unique
[14:36:35] [PASSED] test_overlap
[14:36:35] [PASSED] test_reusable
[14:36:35] [PASSED] test_too_big
[14:36:35] [PASSED] test_flush
[14:36:35] [PASSED] test_lookup
[14:36:35] [PASSED] test_data
[14:36:35] [PASSED] test_class
[14:36:35] ===================== [PASSED] guc_buf =====================
[14:36:35] =================== guc_dbm (7 subtests) ===================
[14:36:35] [PASSED] test_empty
[14:36:35] [PASSED] test_default
[14:36:35] ======================== test_size  ========================
[14:36:35] [PASSED] 4
[14:36:35] [PASSED] 8
[14:36:35] [PASSED] 32
[14:36:35] [PASSED] 256
[14:36:35] ==================== [PASSED] test_size ====================
[14:36:35] ======================= test_reuse  ========================
[14:36:35] [PASSED] 4
[14:36:35] [PASSED] 8
[14:36:35] [PASSED] 32
[14:36:35] [PASSED] 256
[14:36:35] =================== [PASSED] test_reuse ====================
[14:36:35] =================== test_range_overlap  ====================
[14:36:35] [PASSED] 4
[14:36:35] [PASSED] 8
[14:36:35] [PASSED] 32
[14:36:35] [PASSED] 256
[14:36:35] =============== [PASSED] test_range_overlap ================
[14:36:35] =================== test_range_compact  ====================
[14:36:35] [PASSED] 4
[14:36:35] [PASSED] 8
[14:36:35] [PASSED] 32
[14:36:35] [PASSED] 256
[14:36:35] =============== [PASSED] test_range_compact ================
[14:36:35] ==================== test_range_spare  =====================
[14:36:35] [PASSED] 4
[14:36:35] [PASSED] 8
[14:36:35] [PASSED] 32
[14:36:35] [PASSED] 256
[14:36:35] ================ [PASSED] test_range_spare =================
[14:36:35] ===================== [PASSED] guc_dbm =====================
[14:36:35] =================== guc_idm (6 subtests) ===================
[14:36:35] [PASSED] bad_init
[14:36:35] [PASSED] no_init
[14:36:35] [PASSED] init_fini
[14:36:35] [PASSED] check_used
[14:36:35] [PASSED] check_quota
[14:36:35] [PASSED] check_all
[14:36:35] ===================== [PASSED] guc_idm =====================
[14:36:35] ================== no_relay (3 subtests) ===================
[14:36:35] [PASSED] xe_drops_guc2pf_if_not_ready
[14:36:35] [PASSED] xe_drops_guc2vf_if_not_ready
[14:36:35] [PASSED] xe_rejects_send_if_not_ready
[14:36:35] ==================== [PASSED] no_relay =====================
[14:36:35] ================== pf_relay (14 subtests) ==================
[14:36:35] [PASSED] pf_rejects_guc2pf_too_short
[14:36:35] [PASSED] pf_rejects_guc2pf_too_long
[14:36:35] [PASSED] pf_rejects_guc2pf_no_payload
[14:36:35] [PASSED] pf_fails_no_payload
[14:36:35] [PASSED] pf_fails_bad_origin
[14:36:35] [PASSED] pf_fails_bad_type
[14:36:35] [PASSED] pf_txn_reports_error
[14:36:35] [PASSED] pf_txn_sends_pf2guc
[14:36:35] [PASSED] pf_sends_pf2guc
[14:36:35] [SKIPPED] pf_loopback_nop
[14:36:35] [SKIPPED] pf_loopback_echo
[14:36:35] [SKIPPED] pf_loopback_fail
[14:36:35] [SKIPPED] pf_loopback_busy
[14:36:35] [SKIPPED] pf_loopback_retry
[14:36:35] ==================== [PASSED] pf_relay =====================
[14:36:35] ================== vf_relay (3 subtests) ===================
[14:36:35] [PASSED] vf_rejects_guc2vf_too_short
[14:36:35] [PASSED] vf_rejects_guc2vf_too_long
[14:36:35] [PASSED] vf_rejects_guc2vf_no_payload
[14:36:35] ==================== [PASSED] vf_relay =====================
[14:36:35] ================ pf_gt_config (6 subtests) =================
[14:36:35] [PASSED] fair_contexts_1vf
[14:36:35] [PASSED] fair_doorbells_1vf
[14:36:35] [PASSED] fair_ggtt_1vf
[14:36:35] ====================== fair_contexts  ======================
[14:36:35] [PASSED] 1 VF
[14:36:35] [PASSED] 2 VFs
[14:36:35] [PASSED] 3 VFs
[14:36:35] [PASSED] 4 VFs
[14:36:35] [PASSED] 5 VFs
[14:36:35] [PASSED] 6 VFs
[14:36:35] [PASSED] 7 VFs
[14:36:35] [PASSED] 8 VFs
[14:36:35] [PASSED] 9 VFs
[14:36:35] [PASSED] 10 VFs
[14:36:35] [PASSED] 11 VFs
[14:36:35] [PASSED] 12 VFs
[14:36:35] [PASSED] 13 VFs
[14:36:35] [PASSED] 14 VFs
[14:36:35] [PASSED] 15 VFs
[14:36:35] [PASSED] 16 VFs
[14:36:35] [PASSED] 17 VFs
[14:36:35] [PASSED] 18 VFs
[14:36:35] [PASSED] 19 VFs
[14:36:35] [PASSED] 20 VFs
[14:36:35] [PASSED] 21 VFs
[14:36:35] [PASSED] 22 VFs
[14:36:35] [PASSED] 23 VFs
[14:36:35] [PASSED] 24 VFs
[14:36:35] [PASSED] 25 VFs
[14:36:35] [PASSED] 26 VFs
[14:36:35] [PASSED] 27 VFs
[14:36:35] [PASSED] 28 VFs
[14:36:35] [PASSED] 29 VFs
[14:36:35] [PASSED] 30 VFs
[14:36:35] [PASSED] 31 VFs
[14:36:35] [PASSED] 32 VFs
[14:36:35] [PASSED] 33 VFs
[14:36:35] [PASSED] 34 VFs
[14:36:35] [PASSED] 35 VFs
[14:36:35] [PASSED] 36 VFs
[14:36:35] [PASSED] 37 VFs
[14:36:35] [PASSED] 38 VFs
[14:36:35] [PASSED] 39 VFs
[14:36:35] [PASSED] 40 VFs
[14:36:35] [PASSED] 41 VFs
[14:36:35] [PASSED] 42 VFs
[14:36:35] [PASSED] 43 VFs
[14:36:35] [PASSED] 44 VFs
[14:36:35] [PASSED] 45 VFs
[14:36:35] [PASSED] 46 VFs
[14:36:35] [PASSED] 47 VFs
[14:36:35] [PASSED] 48 VFs
[14:36:35] [PASSED] 49 VFs
[14:36:35] [PASSED] 50 VFs
[14:36:35] [PASSED] 51 VFs
[14:36:35] [PASSED] 52 VFs
[14:36:35] [PASSED] 53 VFs
[14:36:35] [PASSED] 54 VFs
[14:36:35] [PASSED] 55 VFs
[14:36:35] [PASSED] 56 VFs
[14:36:35] [PASSED] 57 VFs
[14:36:35] [PASSED] 58 VFs
[14:36:35] [PASSED] 59 VFs
[14:36:35] [PASSED] 60 VFs
[14:36:35] [PASSED] 61 VFs
[14:36:35] [PASSED] 62 VFs
[14:36:35] [PASSED] 63 VFs
[14:36:35] ================== [PASSED] fair_contexts ==================
[14:36:35] ===================== fair_doorbells  ======================
[14:36:35] [PASSED] 1 VF
[14:36:35] [PASSED] 2 VFs
[14:36:35] [PASSED] 3 VFs
[14:36:35] [PASSED] 4 VFs
[14:36:35] [PASSED] 5 VFs
[14:36:35] [PASSED] 6 VFs
[14:36:35] [PASSED] 7 VFs
[14:36:35] [PASSED] 8 VFs
[14:36:35] [PASSED] 9 VFs
[14:36:35] [PASSED] 10 VFs
[14:36:35] [PASSED] 11 VFs
[14:36:35] [PASSED] 12 VFs
[14:36:35] [PASSED] 13 VFs
[14:36:35] [PASSED] 14 VFs
[14:36:35] [PASSED] 15 VFs
[14:36:35] [PASSED] 16 VFs
[14:36:35] [PASSED] 17 VFs
[14:36:35] [PASSED] 18 VFs
[14:36:35] [PASSED] 19 VFs
[14:36:35] [PASSED] 20 VFs
[14:36:35] [PASSED] 21 VFs
[14:36:35] [PASSED] 22 VFs
[14:36:35] [PASSED] 23 VFs
[14:36:35] [PASSED] 24 VFs
[14:36:35] [PASSED] 25 VFs
[14:36:35] [PASSED] 26 VFs
[14:36:35] [PASSED] 27 VFs
[14:36:35] [PASSED] 28 VFs
[14:36:35] [PASSED] 29 VFs
[14:36:35] [PASSED] 30 VFs
[14:36:35] [PASSED] 31 VFs
[14:36:35] [PASSED] 32 VFs
[14:36:35] [PASSED] 33 VFs
[14:36:35] [PASSED] 34 VFs
[14:36:35] [PASSED] 35 VFs
[14:36:35] [PASSED] 36 VFs
[14:36:35] [PASSED] 37 VFs
[14:36:35] [PASSED] 38 VFs
[14:36:35] [PASSED] 39 VFs
[14:36:35] [PASSED] 40 VFs
[14:36:35] [PASSED] 41 VFs
[14:36:35] [PASSED] 42 VFs
[14:36:35] [PASSED] 43 VFs
[14:36:35] [PASSED] 44 VFs
[14:36:35] [PASSED] 45 VFs
[14:36:35] [PASSED] 46 VFs
[14:36:35] [PASSED] 47 VFs
[14:36:35] [PASSED] 48 VFs
[14:36:35] [PASSED] 49 VFs
[14:36:35] [PASSED] 50 VFs
[14:36:35] [PASSED] 51 VFs
[14:36:35] [PASSED] 52 VFs
[14:36:35] [PASSED] 53 VFs
[14:36:35] [PASSED] 54 VFs
[14:36:35] [PASSED] 55 VFs
[14:36:35] [PASSED] 56 VFs
[14:36:35] [PASSED] 57 VFs
[14:36:35] [PASSED] 58 VFs
[14:36:35] [PASSED] 59 VFs
[14:36:35] [PASSED] 60 VFs
[14:36:35] [PASSED] 61 VFs
[14:36:35] [PASSED] 62 VFs
[14:36:35] [PASSED] 63 VFs
[14:36:35] ================= [PASSED] fair_doorbells ==================
[14:36:35] ======================== fair_ggtt  ========================
[14:36:35] [PASSED] 1 VF
[14:36:35] [PASSED] 2 VFs
[14:36:35] [PASSED] 3 VFs
[14:36:35] [PASSED] 4 VFs
[14:36:35] [PASSED] 5 VFs
[14:36:35] [PASSED] 6 VFs
[14:36:35] [PASSED] 7 VFs
[14:36:35] [PASSED] 8 VFs
[14:36:35] [PASSED] 9 VFs
[14:36:35] [PASSED] 10 VFs
[14:36:36] [PASSED] 11 VFs
[14:36:36] [PASSED] 12 VFs
[14:36:36] [PASSED] 13 VFs
[14:36:36] [PASSED] 14 VFs
[14:36:36] [PASSED] 15 VFs
[14:36:36] [PASSED] 16 VFs
[14:36:36] [PASSED] 17 VFs
[14:36:36] [PASSED] 18 VFs
[14:36:36] [PASSED] 19 VFs
[14:36:36] [PASSED] 20 VFs
[14:36:36] [PASSED] 21 VFs
[14:36:36] [PASSED] 22 VFs
[14:36:36] [PASSED] 23 VFs
[14:36:36] [PASSED] 24 VFs
[14:36:36] [PASSED] 25 VFs
[14:36:36] [PASSED] 26 VFs
[14:36:36] [PASSED] 27 VFs
[14:36:36] [PASSED] 28 VFs
[14:36:36] [PASSED] 29 VFs
[14:36:36] [PASSED] 30 VFs
[14:36:36] [PASSED] 31 VFs
[14:36:36] [PASSED] 32 VFs
[14:36:36] [PASSED] 33 VFs
[14:36:36] [PASSED] 34 VFs
[14:36:36] [PASSED] 35 VFs
[14:36:36] [PASSED] 36 VFs
[14:36:36] [PASSED] 37 VFs
[14:36:36] [PASSED] 38 VFs
[14:36:36] [PASSED] 39 VFs
[14:36:36] [PASSED] 40 VFs
[14:36:36] [PASSED] 41 VFs
[14:36:36] [PASSED] 42 VFs
[14:36:36] [PASSED] 43 VFs
[14:36:36] [PASSED] 44 VFs
[14:36:36] [PASSED] 45 VFs
[14:36:36] [PASSED] 46 VFs
[14:36:36] [PASSED] 47 VFs
[14:36:36] [PASSED] 48 VFs
[14:36:36] [PASSED] 49 VFs
[14:36:36] [PASSED] 50 VFs
[14:36:36] [PASSED] 51 VFs
[14:36:36] [PASSED] 52 VFs
[14:36:36] [PASSED] 53 VFs
[14:36:36] [PASSED] 54 VFs
[14:36:36] [PASSED] 55 VFs
[14:36:36] [PASSED] 56 VFs
[14:36:36] [PASSED] 57 VFs
[14:36:36] [PASSED] 58 VFs
[14:36:36] [PASSED] 59 VFs
[14:36:36] [PASSED] 60 VFs
[14:36:36] [PASSED] 61 VFs
[14:36:36] [PASSED] 62 VFs
[14:36:36] [PASSED] 63 VFs
[14:36:36] ==================== [PASSED] fair_ggtt ====================
[14:36:36] ================== [PASSED] pf_gt_config ===================
[14:36:36] ===================== lmtt (1 subtest) =====================
[14:36:36] ======================== test_ops  =========================
[14:36:36] [PASSED] 2-level
[14:36:36] [PASSED] multi-level
[14:36:36] ==================== [PASSED] test_ops =====================
[14:36:36] ====================== [PASSED] lmtt =======================
[14:36:36] ================= pf_service (11 subtests) =================
[14:36:36] [PASSED] pf_negotiate_any
[14:36:36] [PASSED] pf_negotiate_base_match
[14:36:36] [PASSED] pf_negotiate_base_newer
[14:36:36] [PASSED] pf_negotiate_base_next
[14:36:36] [SKIPPED] pf_negotiate_base_older
[14:36:36] [PASSED] pf_negotiate_base_prev
[14:36:36] [PASSED] pf_negotiate_latest_match
[14:36:36] [PASSED] pf_negotiate_latest_newer
[14:36:36] [PASSED] pf_negotiate_latest_next
[14:36:36] [SKIPPED] pf_negotiate_latest_older
[14:36:36] [SKIPPED] pf_negotiate_latest_prev
[14:36:36] =================== [PASSED] pf_service ====================
[14:36:36] ================= xe_guc_g2g (2 subtests) ==================
[14:36:36] ============== xe_live_guc_g2g_kunit_default  ==============
[14:36:36] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[14:36:36] ============== xe_live_guc_g2g_kunit_allmem  ===============
[14:36:36] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[14:36:36] =================== [SKIPPED] xe_guc_g2g ===================
[14:36:36] =================== xe_mocs (2 subtests) ===================
[14:36:36] ================ xe_live_mocs_kernel_kunit  ================
[14:36:36] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[14:36:36] ================ xe_live_mocs_reset_kunit  =================
[14:36:36] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[14:36:36] ==================== [SKIPPED] xe_mocs =====================
[14:36:36] ================= xe_migrate (2 subtests) ==================
[14:36:36] ================= xe_migrate_sanity_kunit  =================
[14:36:36] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[14:36:36] ================== xe_validate_ccs_kunit  ==================
[14:36:36] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[14:36:36] =================== [SKIPPED] xe_migrate ===================
[14:36:36] ================== xe_dma_buf (1 subtest) ==================
[14:36:36] ==================== xe_dma_buf_kunit  =====================
[14:36:36] ================ [SKIPPED] xe_dma_buf_kunit ================
[14:36:36] =================== [SKIPPED] xe_dma_buf ===================
[14:36:36] ================= xe_bo_shrink (1 subtest) =================
[14:36:36] =================== xe_bo_shrink_kunit  ====================
[14:36:36] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[14:36:36] ================== [SKIPPED] xe_bo_shrink ==================
[14:36:36] ==================== xe_bo (2 subtests) ====================
[14:36:36] ================== xe_ccs_migrate_kunit  ===================
[14:36:36] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[14:36:36] ==================== xe_bo_evict_kunit  ====================
[14:36:36] =============== [SKIPPED] xe_bo_evict_kunit ================
[14:36:36] ===================== [SKIPPED] xe_bo ======================
[14:36:36] ==================== args (13 subtests) ====================
[14:36:36] [PASSED] count_args_test
[14:36:36] [PASSED] call_args_example
[14:36:36] [PASSED] call_args_test
[14:36:36] [PASSED] drop_first_arg_example
[14:36:36] [PASSED] drop_first_arg_test
[14:36:36] [PASSED] first_arg_example
[14:36:36] [PASSED] first_arg_test
[14:36:36] [PASSED] last_arg_example
[14:36:36] [PASSED] last_arg_test
[14:36:36] [PASSED] pick_arg_example
[14:36:36] [PASSED] if_args_example
[14:36:36] [PASSED] if_args_test
[14:36:36] [PASSED] sep_comma_example
[14:36:36] ====================== [PASSED] args =======================
[14:36:36] =================== xe_pci (3 subtests) ====================
[14:36:36] ==================== check_graphics_ip  ====================
[14:36:36] [PASSED] 12.00 Xe_LP
[14:36:36] [PASSED] 12.10 Xe_LP+
[14:36:36] [PASSED] 12.55 Xe_HPG
[14:36:36] [PASSED] 12.60 Xe_HPC
[14:36:36] [PASSED] 12.70 Xe_LPG
[14:36:36] [PASSED] 12.71 Xe_LPG
[14:36:36] [PASSED] 12.74 Xe_LPG+
[14:36:36] [PASSED] 20.01 Xe2_HPG
[14:36:36] [PASSED] 20.02 Xe2_HPG
[14:36:36] [PASSED] 20.04 Xe2_LPG
[14:36:36] [PASSED] 30.00 Xe3_LPG
[14:36:36] [PASSED] 30.01 Xe3_LPG
[14:36:36] [PASSED] 30.03 Xe3_LPG
[14:36:36] [PASSED] 30.04 Xe3_LPG
[14:36:36] [PASSED] 30.05 Xe3_LPG
[14:36:36] [PASSED] 35.11 Xe3p_XPC
[14:36:36] ================ [PASSED] check_graphics_ip ================
[14:36:36] ===================== check_media_ip  ======================
[14:36:36] [PASSED] 12.00 Xe_M
[14:36:36] [PASSED] 12.55 Xe_HPM
[14:36:36] [PASSED] 13.00 Xe_LPM+
[14:36:36] [PASSED] 13.01 Xe2_HPM
[14:36:36] [PASSED] 20.00 Xe2_LPM
[14:36:36] [PASSED] 30.00 Xe3_LPM
[14:36:36] [PASSED] 30.02 Xe3_LPM
[14:36:36] [PASSED] 35.00 Xe3p_LPM
[14:36:36] [PASSED] 35.03 Xe3p_HPM
[14:36:36] ================= [PASSED] check_media_ip ==================
[14:36:36] =================== check_platform_desc  ===================
[14:36:36] [PASSED] 0x9A60 (TIGERLAKE)
[14:36:36] [PASSED] 0x9A68 (TIGERLAKE)
[14:36:36] [PASSED] 0x9A70 (TIGERLAKE)
[14:36:36] [PASSED] 0x9A40 (TIGERLAKE)
[14:36:36] [PASSED] 0x9A49 (TIGERLAKE)
[14:36:36] [PASSED] 0x9A59 (TIGERLAKE)
[14:36:36] [PASSED] 0x9A78 (TIGERLAKE)
[14:36:36] [PASSED] 0x9AC0 (TIGERLAKE)
[14:36:36] [PASSED] 0x9AC9 (TIGERLAKE)
[14:36:36] [PASSED] 0x9AD9 (TIGERLAKE)
[14:36:36] [PASSED] 0x9AF8 (TIGERLAKE)
[14:36:36] [PASSED] 0x4C80 (ROCKETLAKE)
[14:36:36] [PASSED] 0x4C8A (ROCKETLAKE)
[14:36:36] [PASSED] 0x4C8B (ROCKETLAKE)
[14:36:36] [PASSED] 0x4C8C (ROCKETLAKE)
[14:36:36] [PASSED] 0x4C90 (ROCKETLAKE)
[14:36:36] [PASSED] 0x4C9A (ROCKETLAKE)
[14:36:36] [PASSED] 0x4680 (ALDERLAKE_S)
[14:36:36] [PASSED] 0x4682 (ALDERLAKE_S)
[14:36:36] [PASSED] 0x4688 (ALDERLAKE_S)
[14:36:36] [PASSED] 0x468A (ALDERLAKE_S)
[14:36:36] [PASSED] 0x468B (ALDERLAKE_S)
[14:36:36] [PASSED] 0x4690 (ALDERLAKE_S)
[14:36:36] [PASSED] 0x4692 (ALDERLAKE_S)
[14:36:36] [PASSED] 0x4693 (ALDERLAKE_S)
[14:36:36] [PASSED] 0x46A0 (ALDERLAKE_P)
[14:36:36] [PASSED] 0x46A1 (ALDERLAKE_P)
[14:36:36] [PASSED] 0x46A2 (ALDERLAKE_P)
[14:36:36] [PASSED] 0x46A3 (ALDERLAKE_P)
[14:36:36] [PASSED] 0x46A6 (ALDERLAKE_P)
[14:36:36] [PASSED] 0x46A8 (ALDERLAKE_P)
[14:36:36] [PASSED] 0x46AA (ALDERLAKE_P)
[14:36:36] [PASSED] 0x462A (ALDERLAKE_P)
[14:36:36] [PASSED] 0x4626 (ALDERLAKE_P)
[14:36:36] [PASSED] 0x4628 (ALDERLAKE_P)
stty: 'standard input': Inappropriate ioctl for device
[14:36:36] [PASSED] 0x46B0 (ALDERLAKE_P)
[14:36:36] [PASSED] 0x46B1 (ALDERLAKE_P)
[14:36:36] [PASSED] 0x46B2 (ALDERLAKE_P)
[14:36:36] [PASSED] 0x46B3 (ALDERLAKE_P)
[14:36:36] [PASSED] 0x46C0 (ALDERLAKE_P)
[14:36:36] [PASSED] 0x46C1 (ALDERLAKE_P)
[14:36:36] [PASSED] 0x46C2 (ALDERLAKE_P)
[14:36:36] [PASSED] 0x46C3 (ALDERLAKE_P)
[14:36:36] [PASSED] 0x46D0 (ALDERLAKE_N)
[14:36:36] [PASSED] 0x46D1 (ALDERLAKE_N)
[14:36:36] [PASSED] 0x46D2 (ALDERLAKE_N)
[14:36:36] [PASSED] 0x46D3 (ALDERLAKE_N)
[14:36:36] [PASSED] 0x46D4 (ALDERLAKE_N)
[14:36:36] [PASSED] 0xA721 (ALDERLAKE_P)
[14:36:36] [PASSED] 0xA7A1 (ALDERLAKE_P)
[14:36:36] [PASSED] 0xA7A9 (ALDERLAKE_P)
[14:36:36] [PASSED] 0xA7AC (ALDERLAKE_P)
[14:36:36] [PASSED] 0xA7AD (ALDERLAKE_P)
[14:36:36] [PASSED] 0xA720 (ALDERLAKE_P)
[14:36:36] [PASSED] 0xA7A0 (ALDERLAKE_P)
[14:36:36] [PASSED] 0xA7A8 (ALDERLAKE_P)
[14:36:36] [PASSED] 0xA7AA (ALDERLAKE_P)
[14:36:36] [PASSED] 0xA7AB (ALDERLAKE_P)
[14:36:36] [PASSED] 0xA780 (ALDERLAKE_S)
[14:36:36] [PASSED] 0xA781 (ALDERLAKE_S)
[14:36:36] [PASSED] 0xA782 (ALDERLAKE_S)
[14:36:36] [PASSED] 0xA783 (ALDERLAKE_S)
[14:36:36] [PASSED] 0xA788 (ALDERLAKE_S)
[14:36:36] [PASSED] 0xA789 (ALDERLAKE_S)
[14:36:36] [PASSED] 0xA78A (ALDERLAKE_S)
[14:36:36] [PASSED] 0xA78B (ALDERLAKE_S)
[14:36:36] [PASSED] 0x4905 (DG1)
[14:36:36] [PASSED] 0x4906 (DG1)
[14:36:36] [PASSED] 0x4907 (DG1)
[14:36:36] [PASSED] 0x4908 (DG1)
[14:36:36] [PASSED] 0x4909 (DG1)
[14:36:36] [PASSED] 0x56C0 (DG2)
[14:36:36] [PASSED] 0x56C2 (DG2)
[14:36:36] [PASSED] 0x56C1 (DG2)
[14:36:36] [PASSED] 0x7D51 (METEORLAKE)
[14:36:36] [PASSED] 0x7DD1 (METEORLAKE)
[14:36:36] [PASSED] 0x7D41 (METEORLAKE)
[14:36:36] [PASSED] 0x7D67 (METEORLAKE)
[14:36:36] [PASSED] 0xB640 (METEORLAKE)
[14:36:36] [PASSED] 0x56A0 (DG2)
[14:36:36] [PASSED] 0x56A1 (DG2)
[14:36:36] [PASSED] 0x56A2 (DG2)
[14:36:36] [PASSED] 0x56BE (DG2)
[14:36:36] [PASSED] 0x56BF (DG2)
[14:36:36] [PASSED] 0x5690 (DG2)
[14:36:36] [PASSED] 0x5691 (DG2)
[14:36:36] [PASSED] 0x5692 (DG2)
[14:36:36] [PASSED] 0x56A5 (DG2)
[14:36:36] [PASSED] 0x56A6 (DG2)
[14:36:36] [PASSED] 0x56B0 (DG2)
[14:36:36] [PASSED] 0x56B1 (DG2)
[14:36:36] [PASSED] 0x56BA (DG2)
[14:36:36] [PASSED] 0x56BB (DG2)
[14:36:36] [PASSED] 0x56BC (DG2)
[14:36:36] [PASSED] 0x56BD (DG2)
[14:36:36] [PASSED] 0x5693 (DG2)
[14:36:36] [PASSED] 0x5694 (DG2)
[14:36:36] [PASSED] 0x5695 (DG2)
[14:36:36] [PASSED] 0x56A3 (DG2)
[14:36:36] [PASSED] 0x56A4 (DG2)
[14:36:36] [PASSED] 0x56B2 (DG2)
[14:36:36] [PASSED] 0x56B3 (DG2)
[14:36:36] [PASSED] 0x5696 (DG2)
[14:36:36] [PASSED] 0x5697 (DG2)
[14:36:36] [PASSED] 0xB69 (PVC)
[14:36:36] [PASSED] 0xB6E (PVC)
[14:36:36] [PASSED] 0xBD4 (PVC)
[14:36:36] [PASSED] 0xBD5 (PVC)
[14:36:36] [PASSED] 0xBD6 (PVC)
[14:36:36] [PASSED] 0xBD7 (PVC)
[14:36:36] [PASSED] 0xBD8 (PVC)
[14:36:36] [PASSED] 0xBD9 (PVC)
[14:36:36] [PASSED] 0xBDA (PVC)
[14:36:36] [PASSED] 0xBDB (PVC)
[14:36:36] [PASSED] 0xBE0 (PVC)
[14:36:36] [PASSED] 0xBE1 (PVC)
[14:36:36] [PASSED] 0xBE5 (PVC)
[14:36:36] [PASSED] 0x7D40 (METEORLAKE)
[14:36:36] [PASSED] 0x7D45 (METEORLAKE)
[14:36:36] [PASSED] 0x7D55 (METEORLAKE)
[14:36:36] [PASSED] 0x7D60 (METEORLAKE)
[14:36:36] [PASSED] 0x7DD5 (METEORLAKE)
[14:36:36] [PASSED] 0x6420 (LUNARLAKE)
[14:36:36] [PASSED] 0x64A0 (LUNARLAKE)
[14:36:36] [PASSED] 0x64B0 (LUNARLAKE)
[14:36:36] [PASSED] 0xE202 (BATTLEMAGE)
[14:36:36] [PASSED] 0xE209 (BATTLEMAGE)
[14:36:36] [PASSED] 0xE20B (BATTLEMAGE)
[14:36:36] [PASSED] 0xE20C (BATTLEMAGE)
[14:36:36] [PASSED] 0xE20D (BATTLEMAGE)
[14:36:36] [PASSED] 0xE210 (BATTLEMAGE)
[14:36:36] [PASSED] 0xE211 (BATTLEMAGE)
[14:36:36] [PASSED] 0xE212 (BATTLEMAGE)
[14:36:36] [PASSED] 0xE216 (BATTLEMAGE)
[14:36:36] [PASSED] 0xE220 (BATTLEMAGE)
[14:36:36] [PASSED] 0xE221 (BATTLEMAGE)
[14:36:36] [PASSED] 0xE222 (BATTLEMAGE)
[14:36:36] [PASSED] 0xE223 (BATTLEMAGE)
[14:36:36] [PASSED] 0xB080 (PANTHERLAKE)
[14:36:36] [PASSED] 0xB081 (PANTHERLAKE)
[14:36:36] [PASSED] 0xB082 (PANTHERLAKE)
[14:36:36] [PASSED] 0xB083 (PANTHERLAKE)
[14:36:36] [PASSED] 0xB084 (PANTHERLAKE)
[14:36:36] [PASSED] 0xB085 (PANTHERLAKE)
[14:36:36] [PASSED] 0xB086 (PANTHERLAKE)
[14:36:36] [PASSED] 0xB087 (PANTHERLAKE)
[14:36:36] [PASSED] 0xB08F (PANTHERLAKE)
[14:36:36] [PASSED] 0xB090 (PANTHERLAKE)
[14:36:36] [PASSED] 0xB0A0 (PANTHERLAKE)
[14:36:36] [PASSED] 0xB0B0 (PANTHERLAKE)
[14:36:36] [PASSED] 0xFD80 (PANTHERLAKE)
[14:36:36] [PASSED] 0xFD81 (PANTHERLAKE)
[14:36:36] [PASSED] 0xD740 (NOVALAKE_S)
[14:36:36] [PASSED] 0xD741 (NOVALAKE_S)
[14:36:36] [PASSED] 0xD742 (NOVALAKE_S)
[14:36:36] [PASSED] 0xD743 (NOVALAKE_S)
[14:36:36] [PASSED] 0xD744 (NOVALAKE_S)
[14:36:36] [PASSED] 0xD745 (NOVALAKE_S)
[14:36:36] [PASSED] 0x674C (CRESCENTISLAND)
[14:36:36] =============== [PASSED] check_platform_desc ===============
[14:36:36] ===================== [PASSED] xe_pci ======================
[14:36:36] =================== xe_rtp (2 subtests) ====================
[14:36:36] =============== xe_rtp_process_to_sr_tests  ================
[14:36:36] [PASSED] coalesce-same-reg
[14:36:36] [PASSED] no-match-no-add
[14:36:36] [PASSED] match-or
[14:36:36] [PASSED] match-or-xfail
[14:36:36] [PASSED] no-match-no-add-multiple-rules
[14:36:36] [PASSED] two-regs-two-entries
[14:36:36] [PASSED] clr-one-set-other
[14:36:36] [PASSED] set-field
[14:36:36] [PASSED] conflict-duplicate
[14:36:36] [PASSED] conflict-not-disjoint
[14:36:36] [PASSED] conflict-reg-type
[14:36:36] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[14:36:36] ================== xe_rtp_process_tests  ===================
[14:36:36] [PASSED] active1
[14:36:36] [PASSED] active2
[14:36:36] [PASSED] active-inactive
[14:36:36] [PASSED] inactive-active
[14:36:36] [PASSED] inactive-1st_or_active-inactive
[14:36:36] [PASSED] inactive-2nd_or_active-inactive
[14:36:36] [PASSED] inactive-last_or_active-inactive
[14:36:36] [PASSED] inactive-no_or_active-inactive
[14:36:36] ============== [PASSED] xe_rtp_process_tests ===============
[14:36:36] ===================== [PASSED] xe_rtp ======================
[14:36:36] ==================== xe_wa (1 subtest) =====================
[14:36:36] ======================== xe_wa_gt  =========================
[14:36:36] [PASSED] TIGERLAKE B0
[14:36:36] [PASSED] DG1 A0
[14:36:36] [PASSED] DG1 B0
[14:36:36] [PASSED] ALDERLAKE_S A0
[14:36:36] [PASSED] ALDERLAKE_S B0
[14:36:36] [PASSED] ALDERLAKE_S C0
[14:36:36] [PASSED] ALDERLAKE_S D0
[14:36:36] [PASSED] ALDERLAKE_P A0
[14:36:36] [PASSED] ALDERLAKE_P B0
[14:36:36] [PASSED] ALDERLAKE_P C0
[14:36:36] [PASSED] ALDERLAKE_S RPLS D0
[14:36:36] [PASSED] ALDERLAKE_P RPLU E0
[14:36:36] [PASSED] DG2 G10 C0
[14:36:36] [PASSED] DG2 G11 B1
[14:36:36] [PASSED] DG2 G12 A1
[14:36:36] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[14:36:36] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[14:36:36] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[14:36:36] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[14:36:36] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[14:36:36] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[14:36:36] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[14:36:36] ==================== [PASSED] xe_wa_gt =====================
[14:36:36] ====================== [PASSED] xe_wa ======================
[14:36:36] ============================================================
[14:36:36] Testing complete. Ran 512 tests: passed: 494, skipped: 18
[14:36:36] Elapsed time: 36.489s total, 4.303s configuring, 31.669s building, 0.462s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
ERROR:root:../drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c: In function ‘drm_test_check_reject_hdr_infoframe_bpc_10’:
../drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2926:49: warning: passing argument 6 of ‘drm_property_replace_blob_from_id’ makes integer from pointer without a cast [-Wint-conversion]
 2926 |                                                 &replaced);
      |                                                 ^~~~~~~~~
      |                                                 |
      |                                                 bool * {aka _Bool *}
In file included from ../include/drm/drm_connector.h:33,
                 from ../include/drm/drm_modes.h:33,
                 from ../include/drm/drm_crtc.h:32,
                 from ../include/drm/drm_atomic.h:31,
                 from ../drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:7:
../include/drm/drm_property.h:287:47: note: expected ‘ssize_t’ {aka ‘long int’} but argument is of type ‘bool *’ {aka ‘_Bool *’}
  287 |                                       ssize_t max_size,
      |                                       ~~~~~~~~^~~~~~~~
../drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2922:15: error: too few arguments to function ‘drm_property_replace_blob_from_id’
 2922 |         ret = drm_property_replace_blob_from_id(drm,
      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/drm/drm_property.h:282:5: note: declared here
  282 | int drm_property_replace_blob_from_id(struct drm_device *dev,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/tests/drm_hdmi_state_helper_test.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:544: drivers/gpu/drm/tests] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:544: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:544: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:544: drivers] Error 2
make[2]: *** [/kernel/Makefile:2054: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[14:36:36] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:36:37] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


