Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1144D374A3
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 21:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DC510EBB8;
	Fri,  5 Dec 2025 21:25:49 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C4810EA83;
 Fri,  5 Dec 2025 21:25:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/uc=3A_Add_stop_on_hardw?=
 =?utf-8?q?are_initialization_error_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Dec 2025 21:25:48 -0000
Message-ID: <176496994887.62145.6533990554635333111@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251205180642.4005099-1-zhanjun.dong@intel.com>
In-Reply-To: <20251205180642.4005099-1-zhanjun.dong@intel.com>
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

Series: drm/xe/uc: Add stop on hardware initialization error (rev10)
URL   : https://patchwork.freedesktop.org/series/152100/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[21:24:31] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:24:35] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[21:25:06] Starting KUnit Kernel (1/1)...
[21:25:06] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[21:25:06] ================== guc_buf (11 subtests) ===================
[21:25:06] [PASSED] test_smallest
[21:25:06] [PASSED] test_largest
[21:25:06] [PASSED] test_granular
[21:25:06] [PASSED] test_unique
[21:25:06] [PASSED] test_overlap
[21:25:06] [PASSED] test_reusable
[21:25:06] [PASSED] test_too_big
[21:25:06] [PASSED] test_flush
[21:25:06] [PASSED] test_lookup
[21:25:06] [PASSED] test_data
[21:25:06] [PASSED] test_class
[21:25:06] ===================== [PASSED] guc_buf =====================
[21:25:06] =================== guc_dbm (7 subtests) ===================
[21:25:06] [PASSED] test_empty
[21:25:06] [PASSED] test_default
[21:25:06] ======================== test_size  ========================
[21:25:06] [PASSED] 4
[21:25:06] [PASSED] 8
[21:25:06] [PASSED] 32
[21:25:06] [PASSED] 256
[21:25:06] ==================== [PASSED] test_size ====================
[21:25:06] ======================= test_reuse  ========================
[21:25:06] [PASSED] 4
[21:25:06] [PASSED] 8
[21:25:06] [PASSED] 32
[21:25:06] [PASSED] 256
[21:25:06] =================== [PASSED] test_reuse ====================
[21:25:06] =================== test_range_overlap  ====================
[21:25:06] [PASSED] 4
[21:25:06] [PASSED] 8
[21:25:06] [PASSED] 32
[21:25:06] [PASSED] 256
[21:25:06] =============== [PASSED] test_range_overlap ================
[21:25:06] =================== test_range_compact  ====================
[21:25:06] [PASSED] 4
[21:25:06] [PASSED] 8
[21:25:06] [PASSED] 32
[21:25:06] [PASSED] 256
[21:25:06] =============== [PASSED] test_range_compact ================
[21:25:06] ==================== test_range_spare  =====================
[21:25:06] [PASSED] 4
[21:25:06] [PASSED] 8
[21:25:06] [PASSED] 32
[21:25:06] [PASSED] 256
[21:25:06] ================ [PASSED] test_range_spare =================
[21:25:06] ===================== [PASSED] guc_dbm =====================
[21:25:06] =================== guc_idm (6 subtests) ===================
[21:25:06] [PASSED] bad_init
[21:25:06] [PASSED] no_init
[21:25:06] [PASSED] init_fini
[21:25:06] [PASSED] check_used
[21:25:06] [PASSED] check_quota
[21:25:06] [PASSED] check_all
[21:25:06] ===================== [PASSED] guc_idm =====================
[21:25:06] ================== no_relay (3 subtests) ===================
[21:25:06] [PASSED] xe_drops_guc2pf_if_not_ready
[21:25:06] [PASSED] xe_drops_guc2vf_if_not_ready
[21:25:06] [PASSED] xe_rejects_send_if_not_ready
[21:25:06] ==================== [PASSED] no_relay =====================
[21:25:06] ================== pf_relay (14 subtests) ==================
[21:25:06] [PASSED] pf_rejects_guc2pf_too_short
[21:25:06] [PASSED] pf_rejects_guc2pf_too_long
[21:25:06] [PASSED] pf_rejects_guc2pf_no_payload
[21:25:06] [PASSED] pf_fails_no_payload
[21:25:06] [PASSED] pf_fails_bad_origin
[21:25:06] [PASSED] pf_fails_bad_type
[21:25:06] [PASSED] pf_txn_reports_error
[21:25:06] [PASSED] pf_txn_sends_pf2guc
[21:25:06] [PASSED] pf_sends_pf2guc
[21:25:06] [SKIPPED] pf_loopback_nop
[21:25:06] [SKIPPED] pf_loopback_echo
[21:25:06] [SKIPPED] pf_loopback_fail
[21:25:06] [SKIPPED] pf_loopback_busy
[21:25:06] [SKIPPED] pf_loopback_retry
[21:25:06] ==================== [PASSED] pf_relay =====================
[21:25:06] ================== vf_relay (3 subtests) ===================
[21:25:06] [PASSED] vf_rejects_guc2vf_too_short
[21:25:06] [PASSED] vf_rejects_guc2vf_too_long
[21:25:06] [PASSED] vf_rejects_guc2vf_no_payload
[21:25:06] ==================== [PASSED] vf_relay =====================
[21:25:06] ================ pf_gt_config (6 subtests) =================
[21:25:06] [PASSED] fair_contexts_1vf
[21:25:06] [PASSED] fair_doorbells_1vf
[21:25:06] [PASSED] fair_ggtt_1vf
[21:25:06] ====================== fair_contexts  ======================
[21:25:06] [PASSED] 1 VF
[21:25:06] [PASSED] 2 VFs
[21:25:06] [PASSED] 3 VFs
[21:25:06] [PASSED] 4 VFs
[21:25:06] [PASSED] 5 VFs
[21:25:06] [PASSED] 6 VFs
[21:25:06] [PASSED] 7 VFs
[21:25:06] [PASSED] 8 VFs
[21:25:06] [PASSED] 9 VFs
[21:25:06] [PASSED] 10 VFs
[21:25:06] [PASSED] 11 VFs
[21:25:06] [PASSED] 12 VFs
[21:25:06] [PASSED] 13 VFs
[21:25:06] [PASSED] 14 VFs
[21:25:06] [PASSED] 15 VFs
[21:25:06] [PASSED] 16 VFs
[21:25:06] [PASSED] 17 VFs
[21:25:06] [PASSED] 18 VFs
[21:25:06] [PASSED] 19 VFs
[21:25:06] [PASSED] 20 VFs
[21:25:06] [PASSED] 21 VFs
[21:25:06] [PASSED] 22 VFs
[21:25:06] [PASSED] 23 VFs
[21:25:06] [PASSED] 24 VFs
[21:25:06] [PASSED] 25 VFs
[21:25:06] [PASSED] 26 VFs
[21:25:06] [PASSED] 27 VFs
[21:25:06] [PASSED] 28 VFs
[21:25:06] [PASSED] 29 VFs
[21:25:06] [PASSED] 30 VFs
[21:25:06] [PASSED] 31 VFs
[21:25:06] [PASSED] 32 VFs
[21:25:06] [PASSED] 33 VFs
[21:25:06] [PASSED] 34 VFs
[21:25:06] [PASSED] 35 VFs
[21:25:06] [PASSED] 36 VFs
[21:25:06] [PASSED] 37 VFs
[21:25:06] [PASSED] 38 VFs
[21:25:06] [PASSED] 39 VFs
[21:25:06] [PASSED] 40 VFs
[21:25:06] [PASSED] 41 VFs
[21:25:06] [PASSED] 42 VFs
[21:25:06] [PASSED] 43 VFs
[21:25:06] [PASSED] 44 VFs
[21:25:06] [PASSED] 45 VFs
[21:25:06] [PASSED] 46 VFs
[21:25:06] [PASSED] 47 VFs
[21:25:06] [PASSED] 48 VFs
[21:25:06] [PASSED] 49 VFs
[21:25:06] [PASSED] 50 VFs
[21:25:06] [PASSED] 51 VFs
[21:25:06] [PASSED] 52 VFs
[21:25:06] [PASSED] 53 VFs
[21:25:06] [PASSED] 54 VFs
[21:25:06] [PASSED] 55 VFs
[21:25:06] [PASSED] 56 VFs
[21:25:06] [PASSED] 57 VFs
[21:25:06] [PASSED] 58 VFs
[21:25:06] [PASSED] 59 VFs
[21:25:06] [PASSED] 60 VFs
[21:25:06] [PASSED] 61 VFs
[21:25:06] [PASSED] 62 VFs
[21:25:06] [PASSED] 63 VFs
[21:25:06] ================== [PASSED] fair_contexts ==================
[21:25:06] ===================== fair_doorbells  ======================
[21:25:06] [PASSED] 1 VF
[21:25:06] [PASSED] 2 VFs
[21:25:06] [PASSED] 3 VFs
[21:25:06] [PASSED] 4 VFs
[21:25:06] [PASSED] 5 VFs
[21:25:06] [PASSED] 6 VFs
[21:25:06] [PASSED] 7 VFs
[21:25:06] [PASSED] 8 VFs
[21:25:06] [PASSED] 9 VFs
[21:25:06] [PASSED] 10 VFs
[21:25:06] [PASSED] 11 VFs
[21:25:06] [PASSED] 12 VFs
[21:25:06] [PASSED] 13 VFs
[21:25:06] [PASSED] 14 VFs
[21:25:06] [PASSED] 15 VFs
[21:25:06] [PASSED] 16 VFs
[21:25:06] [PASSED] 17 VFs
[21:25:06] [PASSED] 18 VFs
[21:25:06] [PASSED] 19 VFs
[21:25:06] [PASSED] 20 VFs
[21:25:06] [PASSED] 21 VFs
[21:25:06] [PASSED] 22 VFs
[21:25:06] [PASSED] 23 VFs
[21:25:06] [PASSED] 24 VFs
[21:25:06] [PASSED] 25 VFs
[21:25:06] [PASSED] 26 VFs
[21:25:06] [PASSED] 27 VFs
[21:25:06] [PASSED] 28 VFs
[21:25:06] [PASSED] 29 VFs
[21:25:06] [PASSED] 30 VFs
[21:25:06] [PASSED] 31 VFs
[21:25:06] [PASSED] 32 VFs
[21:25:06] [PASSED] 33 VFs
[21:25:06] [PASSED] 34 VFs
[21:25:06] [PASSED] 35 VFs
[21:25:06] [PASSED] 36 VFs
[21:25:06] [PASSED] 37 VFs
[21:25:06] [PASSED] 38 VFs
[21:25:06] [PASSED] 39 VFs
[21:25:06] [PASSED] 40 VFs
[21:25:06] [PASSED] 41 VFs
[21:25:06] [PASSED] 42 VFs
[21:25:06] [PASSED] 43 VFs
[21:25:06] [PASSED] 44 VFs
[21:25:06] [PASSED] 45 VFs
[21:25:06] [PASSED] 46 VFs
[21:25:06] [PASSED] 47 VFs
[21:25:06] [PASSED] 48 VFs
[21:25:06] [PASSED] 49 VFs
[21:25:06] [PASSED] 50 VFs
[21:25:06] [PASSED] 51 VFs
[21:25:06] [PASSED] 52 VFs
[21:25:06] [PASSED] 53 VFs
[21:25:06] [PASSED] 54 VFs
[21:25:06] [PASSED] 55 VFs
[21:25:06] [PASSED] 56 VFs
[21:25:06] [PASSED] 57 VFs
[21:25:06] [PASSED] 58 VFs
[21:25:06] [PASSED] 59 VFs
[21:25:06] [PASSED] 60 VFs
[21:25:06] [PASSED] 61 VFs
[21:25:06] [PASSED] 62 VFs
[21:25:06] [PASSED] 63 VFs
[21:25:06] ================= [PASSED] fair_doorbells ==================
[21:25:06] ======================== fair_ggtt  ========================
[21:25:06] [PASSED] 1 VF
[21:25:06] [PASSED] 2 VFs
[21:25:06] [PASSED] 3 VFs
[21:25:06] [PASSED] 4 VFs
[21:25:06] [PASSED] 5 VFs
[21:25:06] [PASSED] 6 VFs
[21:25:06] [PASSED] 7 VFs
[21:25:06] [PASSED] 8 VFs
[21:25:06] [PASSED] 9 VFs
[21:25:06] [PASSED] 10 VFs
[21:25:06] [PASSED] 11 VFs
[21:25:06] [PASSED] 12 VFs
[21:25:06] [PASSED] 13 VFs
[21:25:06] [PASSED] 14 VFs
[21:25:06] [PASSED] 15 VFs
[21:25:06] [PASSED] 16 VFs
[21:25:06] [PASSED] 17 VFs
[21:25:06] [PASSED] 18 VFs
[21:25:06] [PASSED] 19 VFs
[21:25:06] [PASSED] 20 VFs
[21:25:06] [PASSED] 21 VFs
[21:25:06] [PASSED] 22 VFs
[21:25:06] [PASSED] 23 VFs
[21:25:06] [PASSED] 24 VFs
[21:25:06] [PASSED] 25 VFs
[21:25:06] [PASSED] 26 VFs
[21:25:06] [PASSED] 27 VFs
[21:25:06] [PASSED] 28 VFs
[21:25:06] [PASSED] 29 VFs
[21:25:06] [PASSED] 30 VFs
[21:25:06] [PASSED] 31 VFs
[21:25:06] [PASSED] 32 VFs
[21:25:06] [PASSED] 33 VFs
[21:25:06] [PASSED] 34 VFs
[21:25:06] [PASSED] 35 VFs
[21:25:06] [PASSED] 36 VFs
[21:25:06] [PASSED] 37 VFs
[21:25:06] [PASSED] 38 VFs
[21:25:06] [PASSED] 39 VFs
[21:25:06] [PASSED] 40 VFs
[21:25:06] [PASSED] 41 VFs
[21:25:06] [PASSED] 42 VFs
[21:25:06] [PASSED] 43 VFs
[21:25:06] [PASSED] 44 VFs
[21:25:06] [PASSED] 45 VFs
[21:25:06] [PASSED] 46 VFs
[21:25:06] [PASSED] 47 VFs
[21:25:06] [PASSED] 48 VFs
[21:25:06] [PASSED] 49 VFs
[21:25:06] [PASSED] 50 VFs
[21:25:06] [PASSED] 51 VFs
[21:25:06] [PASSED] 52 VFs
[21:25:06] [PASSED] 53 VFs
[21:25:06] [PASSED] 54 VFs
[21:25:06] [PASSED] 55 VFs
[21:25:06] [PASSED] 56 VFs
[21:25:06] [PASSED] 57 VFs
[21:25:06] [PASSED] 58 VFs
[21:25:06] [PASSED] 59 VFs
[21:25:06] [PASSED] 60 VFs
[21:25:06] [PASSED] 61 VFs
[21:25:06] [PASSED] 62 VFs
[21:25:06] [PASSED] 63 VFs
[21:25:06] ==================== [PASSED] fair_ggtt ====================
[21:25:06] ================== [PASSED] pf_gt_config ===================
[21:25:06] ===================== lmtt (1 subtest) =====================
[21:25:06] ======================== test_ops  =========================
[21:25:06] [PASSED] 2-level
[21:25:06] [PASSED] multi-level
[21:25:06] ==================== [PASSED] test_ops =====================
[21:25:06] ====================== [PASSED] lmtt =======================
[21:25:06] ================= pf_service (11 subtests) =================
[21:25:06] [PASSED] pf_negotiate_any
[21:25:06] [PASSED] pf_negotiate_base_match
[21:25:06] [PASSED] pf_negotiate_base_newer
[21:25:06] [PASSED] pf_negotiate_base_next
[21:25:06] [SKIPPED] pf_negotiate_base_older
[21:25:06] [PASSED] pf_negotiate_base_prev
[21:25:06] [PASSED] pf_negotiate_latest_match
[21:25:06] [PASSED] pf_negotiate_latest_newer
[21:25:06] [PASSED] pf_negotiate_latest_next
[21:25:06] [SKIPPED] pf_negotiate_latest_older
[21:25:06] [SKIPPED] pf_negotiate_latest_prev
[21:25:06] =================== [PASSED] pf_service ====================
[21:25:06] ================= xe_guc_g2g (2 subtests) ==================
[21:25:06] ============== xe_live_guc_g2g_kunit_default  ==============
[21:25:06] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[21:25:06] ============== xe_live_guc_g2g_kunit_allmem  ===============
[21:25:06] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[21:25:06] =================== [SKIPPED] xe_guc_g2g ===================
[21:25:06] =================== xe_mocs (2 subtests) ===================
[21:25:06] ================ xe_live_mocs_kernel_kunit  ================
[21:25:06] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[21:25:06] ================ xe_live_mocs_reset_kunit  =================
[21:25:06] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[21:25:06] ==================== [SKIPPED] xe_mocs =====================
[21:25:06] ================= xe_migrate (2 subtests) ==================
[21:25:06] ================= xe_migrate_sanity_kunit  =================
[21:25:06] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[21:25:06] ================== xe_validate_ccs_kunit  ==================
[21:25:06] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[21:25:06] =================== [SKIPPED] xe_migrate ===================
[21:25:06] ================== xe_dma_buf (1 subtest) ==================
[21:25:06] ==================== xe_dma_buf_kunit  =====================
[21:25:06] ================ [SKIPPED] xe_dma_buf_kunit ================
[21:25:06] =================== [SKIPPED] xe_dma_buf ===================
[21:25:06] ================= xe_bo_shrink (1 subtest) =================
[21:25:06] =================== xe_bo_shrink_kunit  ====================
[21:25:06] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[21:25:06] ================== [SKIPPED] xe_bo_shrink ==================
[21:25:06] ==================== xe_bo (2 subtests) ====================
[21:25:06] ================== xe_ccs_migrate_kunit  ===================
[21:25:06] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[21:25:06] ==================== xe_bo_evict_kunit  ====================
[21:25:06] =============== [SKIPPED] xe_bo_evict_kunit ================
[21:25:06] ===================== [SKIPPED] xe_bo ======================
[21:25:06] ==================== args (11 subtests) ====================
[21:25:06] [PASSED] count_args_test
[21:25:06] [PASSED] call_args_example
[21:25:06] [PASSED] call_args_test
[21:25:06] [PASSED] drop_first_arg_example
[21:25:06] [PASSED] drop_first_arg_test
[21:25:06] [PASSED] first_arg_example
[21:25:06] [PASSED] first_arg_test
[21:25:06] [PASSED] last_arg_example
[21:25:06] [PASSED] last_arg_test
[21:25:06] [PASSED] pick_arg_example
[21:25:06] [PASSED] sep_comma_example
[21:25:06] ====================== [PASSED] args =======================
[21:25:06] =================== xe_pci (3 subtests) ====================
[21:25:06] ==================== check_graphics_ip  ====================
[21:25:06] [PASSED] 12.00 Xe_LP
[21:25:06] [PASSED] 12.10 Xe_LP+
[21:25:06] [PASSED] 12.55 Xe_HPG
[21:25:06] [PASSED] 12.60 Xe_HPC
[21:25:06] [PASSED] 12.70 Xe_LPG
[21:25:06] [PASSED] 12.71 Xe_LPG
[21:25:06] [PASSED] 12.74 Xe_LPG+
[21:25:06] [PASSED] 20.01 Xe2_HPG
[21:25:06] [PASSED] 20.02 Xe2_HPG
[21:25:06] [PASSED] 20.04 Xe2_LPG
[21:25:06] [PASSED] 30.00 Xe3_LPG
[21:25:06] [PASSED] 30.01 Xe3_LPG
[21:25:06] [PASSED] 30.03 Xe3_LPG
[21:25:06] [PASSED] 30.04 Xe3_LPG
[21:25:06] [PASSED] 30.05 Xe3_LPG
[21:25:06] [PASSED] 35.11 Xe3p_XPC
[21:25:06] ================ [PASSED] check_graphics_ip ================
[21:25:06] ===================== check_media_ip  ======================
[21:25:06] [PASSED] 12.00 Xe_M
[21:25:06] [PASSED] 12.55 Xe_HPM
[21:25:06] [PASSED] 13.00 Xe_LPM+
[21:25:06] [PASSED] 13.01 Xe2_HPM
[21:25:06] [PASSED] 20.00 Xe2_LPM
[21:25:06] [PASSED] 30.00 Xe3_LPM
[21:25:06] [PASSED] 30.02 Xe3_LPM
[21:25:06] [PASSED] 35.00 Xe3p_LPM
[21:25:06] [PASSED] 35.03 Xe3p_HPM
[21:25:06] ================= [PASSED] check_media_ip ==================
[21:25:06] =================== check_platform_desc  ===================
[21:25:06] [PASSED] 0x9A60 (TIGERLAKE)
[21:25:06] [PASSED] 0x9A68 (TIGERLAKE)
[21:25:06] [PASSED] 0x9A70 (TIGERLAKE)
[21:25:06] [PASSED] 0x9A40 (TIGERLAKE)
[21:25:06] [PASSED] 0x9A49 (TIGERLAKE)
[21:25:06] [PASSED] 0x9A59 (TIGERLAKE)
[21:25:06] [PASSED] 0x9A78 (TIGERLAKE)
[21:25:06] [PASSED] 0x9AC0 (TIGERLAKE)
[21:25:06] [PASSED] 0x9AC9 (TIGERLAKE)
[21:25:06] [PASSED] 0x9AD9 (TIGERLAKE)
[21:25:06] [PASSED] 0x9AF8 (TIGERLAKE)
[21:25:06] [PASSED] 0x4C80 (ROCKETLAKE)
[21:25:06] [PASSED] 0x4C8A (ROCKETLAKE)
[21:25:06] [PASSED] 0x4C8B (ROCKETLAKE)
[21:25:06] [PASSED] 0x4C8C (ROCKETLAKE)
[21:25:06] [PASSED] 0x4C90 (ROCKETLAKE)
[21:25:06] [PASSED] 0x4C9A (ROCKETLAKE)
[21:25:06] [PASSED] 0x4680 (ALDERLAKE_S)
[21:25:06] [PASSED] 0x4682 (ALDERLAKE_S)
[21:25:06] [PASSED] 0x4688 (ALDERLAKE_S)
[21:25:06] [PASSED] 0x468A (ALDERLAKE_S)
[21:25:06] [PASSED] 0x468B (ALDERLAKE_S)
[21:25:06] [PASSED] 0x4690 (ALDERLAKE_S)
[21:25:06] [PASSED] 0x4692 (ALDERLAKE_S)
[21:25:06] [PASSED] 0x4693 (ALDERLAKE_S)
[21:25:06] [PASSED] 0x46A0 (ALDERLAKE_P)
[21:25:06] [PASSED] 0x46A1 (ALDERLAKE_P)
[21:25:06] [PASSED] 0x46A2 (ALDERLAKE_P)
[21:25:06] [PASSED] 0x46A3 (ALDERLAKE_P)
[21:25:06] [PASSED] 0x46A6 (ALDERLAKE_P)
[21:25:06] [PASSED] 0x46A8 (ALDERLAKE_P)
[21:25:06] [PASSED] 0x46AA (ALDERLAKE_P)
[21:25:06] [PASSED] 0x462A (ALDERLAKE_P)
[21:25:06] [PASSED] 0x4626 (ALDERLAKE_P)
[21:25:06] [PASSED] 0x4628 (ALDERLAKE_P)
[21:25:06] [PASSED] 0x46B0 (ALDERLAKE_P)
stty: 'standard input': Inappropriate ioctl for device
[21:25:06] [PASSED] 0x46B1 (ALDERLAKE_P)
[21:25:06] [PASSED] 0x46B2 (ALDERLAKE_P)
[21:25:06] [PASSED] 0x46B3 (ALDERLAKE_P)
[21:25:06] [PASSED] 0x46C0 (ALDERLAKE_P)
[21:25:06] [PASSED] 0x46C1 (ALDERLAKE_P)
[21:25:06] [PASSED] 0x46C2 (ALDERLAKE_P)
[21:25:06] [PASSED] 0x46C3 (ALDERLAKE_P)
[21:25:06] [PASSED] 0x46D0 (ALDERLAKE_N)
[21:25:06] [PASSED] 0x46D1 (ALDERLAKE_N)
[21:25:06] [PASSED] 0x46D2 (ALDERLAKE_N)
[21:25:06] [PASSED] 0x46D3 (ALDERLAKE_N)
[21:25:06] [PASSED] 0x46D4 (ALDERLAKE_N)
[21:25:06] [PASSED] 0xA721 (ALDERLAKE_P)
[21:25:06] [PASSED] 0xA7A1 (ALDERLAKE_P)
[21:25:06] [PASSED] 0xA7A9 (ALDERLAKE_P)
[21:25:06] [PASSED] 0xA7AC (ALDERLAKE_P)
[21:25:06] [PASSED] 0xA7AD (ALDERLAKE_P)
[21:25:06] [PASSED] 0xA720 (ALDERLAKE_P)
[21:25:06] [PASSED] 0xA7A0 (ALDERLAKE_P)
[21:25:06] [PASSED] 0xA7A8 (ALDERLAKE_P)
[21:25:06] [PASSED] 0xA7AA (ALDERLAKE_P)
[21:25:06] [PASSED] 0xA7AB (ALDERLAKE_P)
[21:25:06] [PASSED] 0xA780 (ALDERLAKE_S)
[21:25:06] [PASSED] 0xA781 (ALDERLAKE_S)
[21:25:06] [PASSED] 0xA782 (ALDERLAKE_S)
[21:25:06] [PASSED] 0xA783 (ALDERLAKE_S)
[21:25:06] [PASSED] 0xA788 (ALDERLAKE_S)
[21:25:06] [PASSED] 0xA789 (ALDERLAKE_S)
[21:25:06] [PASSED] 0xA78A (ALDERLAKE_S)
[21:25:06] [PASSED] 0xA78B (ALDERLAKE_S)
[21:25:06] [PASSED] 0x4905 (DG1)
[21:25:06] [PASSED] 0x4906 (DG1)
[21:25:06] [PASSED] 0x4907 (DG1)
[21:25:06] [PASSED] 0x4908 (DG1)
[21:25:06] [PASSED] 0x4909 (DG1)
[21:25:06] [PASSED] 0x56C0 (DG2)
[21:25:06] [PASSED] 0x56C2 (DG2)
[21:25:06] [PASSED] 0x56C1 (DG2)
[21:25:06] [PASSED] 0x7D51 (METEORLAKE)
[21:25:06] [PASSED] 0x7DD1 (METEORLAKE)
[21:25:06] [PASSED] 0x7D41 (METEORLAKE)
[21:25:06] [PASSED] 0x7D67 (METEORLAKE)
[21:25:06] [PASSED] 0xB640 (METEORLAKE)
[21:25:06] [PASSED] 0x56A0 (DG2)
[21:25:06] [PASSED] 0x56A1 (DG2)
[21:25:06] [PASSED] 0x56A2 (DG2)
[21:25:06] [PASSED] 0x56BE (DG2)
[21:25:06] [PASSED] 0x56BF (DG2)
[21:25:06] [PASSED] 0x5690 (DG2)
[21:25:06] [PASSED] 0x5691 (DG2)
[21:25:06] [PASSED] 0x5692 (DG2)
[21:25:06] [PASSED] 0x56A5 (DG2)
[21:25:06] [PASSED] 0x56A6 (DG2)
[21:25:06] [PASSED] 0x56B0 (DG2)
[21:25:06] [PASSED] 0x56B1 (DG2)
[21:25:06] [PASSED] 0x56BA (DG2)
[21:25:06] [PASSED] 0x56BB (DG2)
[21:25:06] [PASSED] 0x56BC (DG2)
[21:25:06] [PASSED] 0x56BD (DG2)
[21:25:06] [PASSED] 0x5693 (DG2)
[21:25:06] [PASSED] 0x5694 (DG2)
[21:25:06] [PASSED] 0x5695 (DG2)
[21:25:06] [PASSED] 0x56A3 (DG2)
[21:25:06] [PASSED] 0x56A4 (DG2)
[21:25:06] [PASSED] 0x56B2 (DG2)
[21:25:06] [PASSED] 0x56B3 (DG2)
[21:25:06] [PASSED] 0x5696 (DG2)
[21:25:06] [PASSED] 0x5697 (DG2)
[21:25:06] [PASSED] 0xB69 (PVC)
[21:25:06] [PASSED] 0xB6E (PVC)
[21:25:06] [PASSED] 0xBD4 (PVC)
[21:25:06] [PASSED] 0xBD5 (PVC)
[21:25:06] [PASSED] 0xBD6 (PVC)
[21:25:06] [PASSED] 0xBD7 (PVC)
[21:25:06] [PASSED] 0xBD8 (PVC)
[21:25:06] [PASSED] 0xBD9 (PVC)
[21:25:06] [PASSED] 0xBDA (PVC)
[21:25:06] [PASSED] 0xBDB (PVC)
[21:25:06] [PASSED] 0xBE0 (PVC)
[21:25:06] [PASSED] 0xBE1 (PVC)
[21:25:06] [PASSED] 0xBE5 (PVC)
[21:25:06] [PASSED] 0x7D40 (METEORLAKE)
[21:25:06] [PASSED] 0x7D45 (METEORLAKE)
[21:25:06] [PASSED] 0x7D55 (METEORLAKE)
[21:25:06] [PASSED] 0x7D60 (METEORLAKE)
[21:25:06] [PASSED] 0x7DD5 (METEORLAKE)
[21:25:06] [PASSED] 0x6420 (LUNARLAKE)
[21:25:06] [PASSED] 0x64A0 (LUNARLAKE)
[21:25:06] [PASSED] 0x64B0 (LUNARLAKE)
[21:25:06] [PASSED] 0xE202 (BATTLEMAGE)
[21:25:06] [PASSED] 0xE209 (BATTLEMAGE)
[21:25:06] [PASSED] 0xE20B (BATTLEMAGE)
[21:25:06] [PASSED] 0xE20C (BATTLEMAGE)
[21:25:06] [PASSED] 0xE20D (BATTLEMAGE)
[21:25:06] [PASSED] 0xE210 (BATTLEMAGE)
[21:25:06] [PASSED] 0xE211 (BATTLEMAGE)
[21:25:06] [PASSED] 0xE212 (BATTLEMAGE)
[21:25:06] [PASSED] 0xE216 (BATTLEMAGE)
[21:25:06] [PASSED] 0xE220 (BATTLEMAGE)
[21:25:06] [PASSED] 0xE221 (BATTLEMAGE)
[21:25:06] [PASSED] 0xE222 (BATTLEMAGE)
[21:25:06] [PASSED] 0xE223 (BATTLEMAGE)
[21:25:06] [PASSED] 0xB080 (PANTHERLAKE)
[21:25:06] [PASSED] 0xB081 (PANTHERLAKE)
[21:25:06] [PASSED] 0xB082 (PANTHERLAKE)
[21:25:06] [PASSED] 0xB083 (PANTHERLAKE)
[21:25:06] [PASSED] 0xB084 (PANTHERLAKE)
[21:25:06] [PASSED] 0xB085 (PANTHERLAKE)
[21:25:06] [PASSED] 0xB086 (PANTHERLAKE)
[21:25:06] [PASSED] 0xB087 (PANTHERLAKE)
[21:25:06] [PASSED] 0xB08F (PANTHERLAKE)
[21:25:06] [PASSED] 0xB090 (PANTHERLAKE)
[21:25:06] [PASSED] 0xB0A0 (PANTHERLAKE)
[21:25:06] [PASSED] 0xB0B0 (PANTHERLAKE)
[21:25:06] [PASSED] 0xD740 (NOVALAKE_S)
[21:25:06] [PASSED] 0xD741 (NOVALAKE_S)
[21:25:06] [PASSED] 0xD742 (NOVALAKE_S)
[21:25:06] [PASSED] 0xD743 (NOVALAKE_S)
[21:25:06] [PASSED] 0xD744 (NOVALAKE_S)
[21:25:06] [PASSED] 0xD745 (NOVALAKE_S)
[21:25:06] [PASSED] 0x674C (CRESCENTISLAND)
[21:25:06] [PASSED] 0xFD80 (PANTHERLAKE)
[21:25:06] [PASSED] 0xFD81 (PANTHERLAKE)
[21:25:06] =============== [PASSED] check_platform_desc ===============
[21:25:06] ===================== [PASSED] xe_pci ======================
[21:25:06] =================== xe_rtp (2 subtests) ====================
[21:25:06] =============== xe_rtp_process_to_sr_tests  ================
[21:25:06] [PASSED] coalesce-same-reg
[21:25:06] [PASSED] no-match-no-add
[21:25:06] [PASSED] match-or
[21:25:06] [PASSED] match-or-xfail
[21:25:06] [PASSED] no-match-no-add-multiple-rules
[21:25:06] [PASSED] two-regs-two-entries
[21:25:06] [PASSED] clr-one-set-other
[21:25:06] [PASSED] set-field
[21:25:06] [PASSED] conflict-duplicate
[21:25:06] [PASSED] conflict-not-disjoint
[21:25:06] [PASSED] conflict-reg-type
[21:25:06] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[21:25:06] ================== xe_rtp_process_tests  ===================
[21:25:06] [PASSED] active1
[21:25:06] [PASSED] active2
[21:25:06] [PASSED] active-inactive
[21:25:06] [PASSED] inactive-active
[21:25:06] [PASSED] inactive-1st_or_active-inactive
[21:25:06] [PASSED] inactive-2nd_or_active-inactive
[21:25:06] [PASSED] inactive-last_or_active-inactive
[21:25:06] [PASSED] inactive-no_or_active-inactive
[21:25:06] ============== [PASSED] xe_rtp_process_tests ===============
[21:25:06] ===================== [PASSED] xe_rtp ======================
[21:25:06] ==================== xe_wa (1 subtest) =====================
[21:25:06] ======================== xe_wa_gt  =========================
[21:25:06] [PASSED] TIGERLAKE B0
[21:25:06] [PASSED] DG1 A0
[21:25:06] [PASSED] DG1 B0
[21:25:06] [PASSED] ALDERLAKE_S A0
[21:25:06] [PASSED] ALDERLAKE_S B0
[21:25:06] [PASSED] ALDERLAKE_S C0
[21:25:06] [PASSED] ALDERLAKE_S D0
[21:25:06] [PASSED] ALDERLAKE_P A0
[21:25:06] [PASSED] ALDERLAKE_P B0
[21:25:06] [PASSED] ALDERLAKE_P C0
[21:25:06] [PASSED] ALDERLAKE_S RPLS D0
[21:25:06] [PASSED] ALDERLAKE_P RPLU E0
[21:25:06] [PASSED] DG2 G10 C0
[21:25:06] [PASSED] DG2 G11 B1
[21:25:06] [PASSED] DG2 G12 A1
[21:25:06] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[21:25:06] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[21:25:06] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[21:25:06] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[21:25:06] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[21:25:06] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[21:25:06] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[21:25:06] ==================== [PASSED] xe_wa_gt =====================
[21:25:06] ====================== [PASSED] xe_wa ======================
[21:25:06] ============================================================
[21:25:06] Testing complete. Ran 510 tests: passed: 492, skipped: 18
[21:25:06] Elapsed time: 35.328s total, 4.274s configuring, 30.538s building, 0.466s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[21:25:06] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:25:08] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[21:25:33] Starting KUnit Kernel (1/1)...
[21:25:33] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[21:25:33] ============ drm_test_pick_cmdline (2 subtests) ============
[21:25:33] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[21:25:33] =============== drm_test_pick_cmdline_named  ===============
[21:25:33] [PASSED] NTSC
[21:25:33] [PASSED] NTSC-J
[21:25:33] [PASSED] PAL
[21:25:33] [PASSED] PAL-M
[21:25:33] =========== [PASSED] drm_test_pick_cmdline_named ===========
[21:25:33] ============== [PASSED] drm_test_pick_cmdline ==============
[21:25:33] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[21:25:33] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[21:25:33] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[21:25:33] =========== drm_validate_clone_mode (2 subtests) ===========
[21:25:33] ============== drm_test_check_in_clone_mode  ===============
[21:25:33] [PASSED] in_clone_mode
[21:25:33] [PASSED] not_in_clone_mode
[21:25:33] ========== [PASSED] drm_test_check_in_clone_mode ===========
[21:25:33] =============== drm_test_check_valid_clones  ===============
[21:25:33] [PASSED] not_in_clone_mode
[21:25:33] [PASSED] valid_clone
[21:25:33] [PASSED] invalid_clone
[21:25:33] =========== [PASSED] drm_test_check_valid_clones ===========
[21:25:33] ============= [PASSED] drm_validate_clone_mode =============
[21:25:33] ============= drm_validate_modeset (1 subtest) =============
[21:25:33] [PASSED] drm_test_check_connector_changed_modeset
[21:25:33] ============== [PASSED] drm_validate_modeset ===============
[21:25:33] ====== drm_test_bridge_get_current_state (2 subtests) ======
[21:25:33] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[21:25:33] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[21:25:33] ======== [PASSED] drm_test_bridge_get_current_state ========
[21:25:33] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[21:25:33] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[21:25:33] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[21:25:33] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[21:25:33] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[21:25:33] ============== drm_bridge_alloc (2 subtests) ===============
[21:25:33] [PASSED] drm_test_drm_bridge_alloc_basic
[21:25:33] [PASSED] drm_test_drm_bridge_alloc_get_put
[21:25:33] ================ [PASSED] drm_bridge_alloc =================
[21:25:33] ================== drm_buddy (8 subtests) ==================
[21:25:33] [PASSED] drm_test_buddy_alloc_limit
[21:25:33] [PASSED] drm_test_buddy_alloc_optimistic
[21:25:33] [PASSED] drm_test_buddy_alloc_pessimistic
[21:25:33] [PASSED] drm_test_buddy_alloc_pathological
[21:25:33] [PASSED] drm_test_buddy_alloc_contiguous
[21:25:33] [PASSED] drm_test_buddy_alloc_clear
[21:25:33] [PASSED] drm_test_buddy_alloc_range_bias
[21:25:33] [PASSED] drm_test_buddy_fragmentation_performance
[21:25:33] ==================== [PASSED] drm_buddy ====================
[21:25:33] ============= drm_cmdline_parser (40 subtests) =============
[21:25:33] [PASSED] drm_test_cmdline_force_d_only
[21:25:33] [PASSED] drm_test_cmdline_force_D_only_dvi
[21:25:33] [PASSED] drm_test_cmdline_force_D_only_hdmi
[21:25:33] [PASSED] drm_test_cmdline_force_D_only_not_digital
[21:25:33] [PASSED] drm_test_cmdline_force_e_only
[21:25:33] [PASSED] drm_test_cmdline_res
[21:25:33] [PASSED] drm_test_cmdline_res_vesa
[21:25:33] [PASSED] drm_test_cmdline_res_vesa_rblank
[21:25:33] [PASSED] drm_test_cmdline_res_rblank
[21:25:33] [PASSED] drm_test_cmdline_res_bpp
[21:25:33] [PASSED] drm_test_cmdline_res_refresh
[21:25:33] [PASSED] drm_test_cmdline_res_bpp_refresh
[21:25:33] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[21:25:33] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[21:25:33] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[21:25:33] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[21:25:33] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[21:25:33] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[21:25:33] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[21:25:33] [PASSED] drm_test_cmdline_res_margins_force_on
[21:25:33] [PASSED] drm_test_cmdline_res_vesa_margins
[21:25:33] [PASSED] drm_test_cmdline_name
[21:25:33] [PASSED] drm_test_cmdline_name_bpp
[21:25:33] [PASSED] drm_test_cmdline_name_option
[21:25:33] [PASSED] drm_test_cmdline_name_bpp_option
[21:25:33] [PASSED] drm_test_cmdline_rotate_0
[21:25:33] [PASSED] drm_test_cmdline_rotate_90
[21:25:33] [PASSED] drm_test_cmdline_rotate_180
[21:25:33] [PASSED] drm_test_cmdline_rotate_270
[21:25:33] [PASSED] drm_test_cmdline_hmirror
[21:25:33] [PASSED] drm_test_cmdline_vmirror
[21:25:33] [PASSED] drm_test_cmdline_margin_options
[21:25:33] [PASSED] drm_test_cmdline_multiple_options
[21:25:33] [PASSED] drm_test_cmdline_bpp_extra_and_option
[21:25:33] [PASSED] drm_test_cmdline_extra_and_option
[21:25:33] [PASSED] drm_test_cmdline_freestanding_options
[21:25:33] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[21:25:33] [PASSED] drm_test_cmdline_panel_orientation
[21:25:33] ================ drm_test_cmdline_invalid  =================
[21:25:33] [PASSED] margin_only
[21:25:33] [PASSED] interlace_only
[21:25:33] [PASSED] res_missing_x
[21:25:33] [PASSED] res_missing_y
[21:25:33] [PASSED] res_bad_y
[21:25:33] [PASSED] res_missing_y_bpp
[21:25:33] [PASSED] res_bad_bpp
[21:25:33] [PASSED] res_bad_refresh
[21:25:33] [PASSED] res_bpp_refresh_force_on_off
[21:25:33] [PASSED] res_invalid_mode
[21:25:33] [PASSED] res_bpp_wrong_place_mode
[21:25:33] [PASSED] name_bpp_refresh
[21:25:33] [PASSED] name_refresh
[21:25:33] [PASSED] name_refresh_wrong_mode
[21:25:33] [PASSED] name_refresh_invalid_mode
[21:25:33] [PASSED] rotate_multiple
[21:25:33] [PASSED] rotate_invalid_val
[21:25:33] [PASSED] rotate_truncated
[21:25:33] [PASSED] invalid_option
[21:25:33] [PASSED] invalid_tv_option
[21:25:33] [PASSED] truncated_tv_option
[21:25:33] ============ [PASSED] drm_test_cmdline_invalid =============
[21:25:33] =============== drm_test_cmdline_tv_options  ===============
[21:25:33] [PASSED] NTSC
[21:25:33] [PASSED] NTSC_443
[21:25:33] [PASSED] NTSC_J
[21:25:33] [PASSED] PAL
[21:25:33] [PASSED] PAL_M
[21:25:33] [PASSED] PAL_N
[21:25:33] [PASSED] SECAM
[21:25:33] [PASSED] MONO_525
[21:25:33] [PASSED] MONO_625
[21:25:33] =========== [PASSED] drm_test_cmdline_tv_options ===========
[21:25:33] =============== [PASSED] drm_cmdline_parser ================
[21:25:33] ========== drmm_connector_hdmi_init (20 subtests) ==========
[21:25:33] [PASSED] drm_test_connector_hdmi_init_valid
[21:25:33] [PASSED] drm_test_connector_hdmi_init_bpc_8
[21:25:33] [PASSED] drm_test_connector_hdmi_init_bpc_10
[21:25:33] [PASSED] drm_test_connector_hdmi_init_bpc_12
[21:25:33] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[21:25:33] [PASSED] drm_test_connector_hdmi_init_bpc_null
[21:25:33] [PASSED] drm_test_connector_hdmi_init_formats_empty
[21:25:33] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[21:25:33] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[21:25:33] [PASSED] supported_formats=0x9 yuv420_allowed=1
[21:25:33] [PASSED] supported_formats=0x9 yuv420_allowed=0
[21:25:33] [PASSED] supported_formats=0x3 yuv420_allowed=1
[21:25:33] [PASSED] supported_formats=0x3 yuv420_allowed=0
[21:25:33] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[21:25:33] [PASSED] drm_test_connector_hdmi_init_null_ddc
[21:25:33] [PASSED] drm_test_connector_hdmi_init_null_product
[21:25:33] [PASSED] drm_test_connector_hdmi_init_null_vendor
[21:25:33] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[21:25:33] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[21:25:33] [PASSED] drm_test_connector_hdmi_init_product_valid
[21:25:33] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[21:25:33] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[21:25:33] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[21:25:33] ========= drm_test_connector_hdmi_init_type_valid  =========
[21:25:33] [PASSED] HDMI-A
[21:25:33] [PASSED] HDMI-B
[21:25:33] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[21:25:33] ======== drm_test_connector_hdmi_init_type_invalid  ========
[21:25:33] [PASSED] Unknown
[21:25:33] [PASSED] VGA
[21:25:33] [PASSED] DVI-I
[21:25:33] [PASSED] DVI-D
[21:25:33] [PASSED] DVI-A
[21:25:33] [PASSED] Composite
[21:25:33] [PASSED] SVIDEO
[21:25:33] [PASSED] LVDS
[21:25:33] [PASSED] Component
[21:25:33] [PASSED] DIN
[21:25:33] [PASSED] DP
[21:25:33] [PASSED] TV
[21:25:33] [PASSED] eDP
[21:25:33] [PASSED] Virtual
[21:25:33] [PASSED] DSI
[21:25:33] [PASSED] DPI
[21:25:33] [PASSED] Writeback
[21:25:33] [PASSED] SPI
[21:25:33] [PASSED] USB
[21:25:33] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[21:25:33] ============ [PASSED] drmm_connector_hdmi_init =============
[21:25:33] ============= drmm_connector_init (3 subtests) =============
[21:25:33] [PASSED] drm_test_drmm_connector_init
[21:25:33] [PASSED] drm_test_drmm_connector_init_null_ddc
[21:25:33] ========= drm_test_drmm_connector_init_type_valid  =========
[21:25:33] [PASSED] Unknown
[21:25:33] [PASSED] VGA
[21:25:33] [PASSED] DVI-I
[21:25:33] [PASSED] DVI-D
[21:25:33] [PASSED] DVI-A
[21:25:33] [PASSED] Composite
[21:25:33] [PASSED] SVIDEO
[21:25:33] [PASSED] LVDS
[21:25:33] [PASSED] Component
[21:25:33] [PASSED] DIN
[21:25:33] [PASSED] DP
[21:25:33] [PASSED] HDMI-A
[21:25:33] [PASSED] HDMI-B
[21:25:33] [PASSED] TV
[21:25:33] [PASSED] eDP
[21:25:33] [PASSED] Virtual
[21:25:33] [PASSED] DSI
[21:25:33] [PASSED] DPI
[21:25:33] [PASSED] Writeback
[21:25:33] [PASSED] SPI
[21:25:33] [PASSED] USB
[21:25:33] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[21:25:33] =============== [PASSED] drmm_connector_init ===============
[21:25:33] ========= drm_connector_dynamic_init (6 subtests) ==========
[21:25:33] [PASSED] drm_test_drm_connector_dynamic_init
[21:25:33] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[21:25:33] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[21:25:33] [PASSED] drm_test_drm_connector_dynamic_init_properties
[21:25:33] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[21:25:33] [PASSED] Unknown
[21:25:33] [PASSED] VGA
[21:25:33] [PASSED] DVI-I
[21:25:33] [PASSED] DVI-D
[21:25:33] [PASSED] DVI-A
[21:25:33] [PASSED] Composite
[21:25:33] [PASSED] SVIDEO
[21:25:33] [PASSED] LVDS
[21:25:33] [PASSED] Component
[21:25:33] [PASSED] DIN
[21:25:33] [PASSED] DP
[21:25:33] [PASSED] HDMI-A
[21:25:33] [PASSED] HDMI-B
[21:25:33] [PASSED] TV
[21:25:33] [PASSED] eDP
[21:25:33] [PASSED] Virtual
[21:25:33] [PASSED] DSI
[21:25:33] [PASSED] DPI
[21:25:33] [PASSED] Writeback
[21:25:33] [PASSED] SPI
[21:25:33] [PASSED] USB
[21:25:33] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[21:25:33] ======== drm_test_drm_connector_dynamic_init_name  =========
[21:25:33] [PASSED] Unknown
[21:25:33] [PASSED] VGA
[21:25:33] [PASSED] DVI-I
[21:25:33] [PASSED] DVI-D
[21:25:33] [PASSED] DVI-A
[21:25:33] [PASSED] Composite
[21:25:33] [PASSED] SVIDEO
[21:25:33] [PASSED] LVDS
[21:25:33] [PASSED] Component
[21:25:33] [PASSED] DIN
[21:25:33] [PASSED] DP
[21:25:33] [PASSED] HDMI-A
[21:25:33] [PASSED] HDMI-B
[21:25:33] [PASSED] TV
[21:25:33] [PASSED] eDP
[21:25:33] [PASSED] Virtual
[21:25:33] [PASSED] DSI
[21:25:33] [PASSED] DPI
[21:25:33] [PASSED] Writeback
[21:25:33] [PASSED] SPI
[21:25:33] [PASSED] USB
[21:25:33] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[21:25:33] =========== [PASSED] drm_connector_dynamic_init ============
[21:25:33] ==== drm_connector_dynamic_register_early (4 subtests) =====
[21:25:33] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[21:25:33] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[21:25:33] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[21:25:33] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[21:25:33] ====== [PASSED] drm_connector_dynamic_register_early =======
[21:25:33] ======= drm_connector_dynamic_register (7 subtests) ========
[21:25:33] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[21:25:33] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[21:25:33] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[21:25:33] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[21:25:33] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[21:25:33] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[21:25:33] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[21:25:33] ========= [PASSED] drm_connector_dynamic_register ==========
[21:25:33] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[21:25:33] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[21:25:33] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[21:25:33] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[21:25:33] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[21:25:33] ========== drm_test_get_tv_mode_from_name_valid  ===========
[21:25:33] [PASSED] NTSC
[21:25:33] [PASSED] NTSC-443
[21:25:33] [PASSED] NTSC-J
[21:25:33] [PASSED] PAL
[21:25:33] [PASSED] PAL-M
[21:25:33] [PASSED] PAL-N
[21:25:33] [PASSED] SECAM
[21:25:33] [PASSED] Mono
[21:25:33] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[21:25:33] [PASSED] drm_test_get_tv_mode_from_name_truncated
[21:25:33] ============ [PASSED] drm_get_tv_mode_from_name ============
[21:25:33] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[21:25:33] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[21:25:33] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[21:25:33] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[21:25:33] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[21:25:33] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[21:25:33] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[21:25:33] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[21:25:33] [PASSED] VIC 96
[21:25:33] [PASSED] VIC 97
[21:25:33] [PASSED] VIC 101
[21:25:33] [PASSED] VIC 102
[21:25:33] [PASSED] VIC 106
[21:25:33] [PASSED] VIC 107
[21:25:33] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[21:25:33] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[21:25:33] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[21:25:33] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[21:25:33] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[21:25:33] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[21:25:33] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[21:25:33] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[21:25:33] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[21:25:33] [PASSED] Automatic
[21:25:33] [PASSED] Full
[21:25:33] [PASSED] Limited 16:235
[21:25:33] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[21:25:33] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[21:25:33] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[21:25:33] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[21:25:33] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[21:25:33] [PASSED] RGB
[21:25:33] [PASSED] YUV 4:2:0
[21:25:33] [PASSED] YUV 4:2:2
[21:25:33] [PASSED] YUV 4:4:4
[21:25:33] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[21:25:33] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[21:25:33] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[21:25:33] ============= drm_damage_helper (21 subtests) ==============
[21:25:33] [PASSED] drm_test_damage_iter_no_damage
[21:25:33] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[21:25:33] [PASSED] drm_test_damage_iter_no_damage_src_moved
[21:25:33] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[21:25:33] [PASSED] drm_test_damage_iter_no_damage_not_visible
[21:25:33] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[21:25:33] [PASSED] drm_test_damage_iter_no_damage_no_fb
[21:25:33] [PASSED] drm_test_damage_iter_simple_damage
[21:25:33] [PASSED] drm_test_damage_iter_single_damage
[21:25:33] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[21:25:33] [PASSED] drm_test_damage_iter_single_damage_outside_src
[21:25:33] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[21:25:33] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[21:25:33] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[21:25:33] [PASSED] drm_test_damage_iter_single_damage_src_moved
[21:25:33] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[21:25:33] [PASSED] drm_test_damage_iter_damage
[21:25:33] [PASSED] drm_test_damage_iter_damage_one_intersect
[21:25:33] [PASSED] drm_test_damage_iter_damage_one_outside
[21:25:33] [PASSED] drm_test_damage_iter_damage_src_moved
[21:25:33] [PASSED] drm_test_damage_iter_damage_not_visible
[21:25:33] ================ [PASSED] drm_damage_helper ================
[21:25:33] ============== drm_dp_mst_helper (3 subtests) ==============
[21:25:33] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[21:25:33] [PASSED] Clock 154000 BPP 30 DSC disabled
[21:25:33] [PASSED] Clock 234000 BPP 30 DSC disabled
[21:25:33] [PASSED] Clock 297000 BPP 24 DSC disabled
[21:25:33] [PASSED] Clock 332880 BPP 24 DSC enabled
[21:25:33] [PASSED] Clock 324540 BPP 24 DSC enabled
[21:25:33] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[21:25:33] ============== drm_test_dp_mst_calc_pbn_div  ===============
[21:25:33] [PASSED] Link rate 2000000 lane count 4
[21:25:33] [PASSED] Link rate 2000000 lane count 2
[21:25:33] [PASSED] Link rate 2000000 lane count 1
[21:25:33] [PASSED] Link rate 1350000 lane count 4
[21:25:33] [PASSED] Link rate 1350000 lane count 2
[21:25:33] [PASSED] Link rate 1350000 lane count 1
[21:25:33] [PASSED] Link rate 1000000 lane count 4
[21:25:33] [PASSED] Link rate 1000000 lane count 2
[21:25:33] [PASSED] Link rate 1000000 lane count 1
[21:25:33] [PASSED] Link rate 810000 lane count 4
[21:25:33] [PASSED] Link rate 810000 lane count 2
[21:25:33] [PASSED] Link rate 810000 lane count 1
[21:25:33] [PASSED] Link rate 540000 lane count 4
[21:25:33] [PASSED] Link rate 540000 lane count 2
[21:25:33] [PASSED] Link rate 540000 lane count 1
[21:25:33] [PASSED] Link rate 270000 lane count 4
[21:25:33] [PASSED] Link rate 270000 lane count 2
[21:25:33] [PASSED] Link rate 270000 lane count 1
[21:25:33] [PASSED] Link rate 162000 lane count 4
[21:25:33] [PASSED] Link rate 162000 lane count 2
[21:25:33] [PASSED] Link rate 162000 lane count 1
[21:25:33] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[21:25:33] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[21:25:33] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[21:25:33] [PASSED] DP_POWER_UP_PHY with port number
[21:25:33] [PASSED] DP_POWER_DOWN_PHY with port number
[21:25:33] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[21:25:33] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[21:25:33] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[21:25:33] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[21:25:33] [PASSED] DP_QUERY_PAYLOAD with port number
[21:25:33] [PASSED] DP_QUERY_PAYLOAD with VCPI
[21:25:33] [PASSED] DP_REMOTE_DPCD_READ with port number
[21:25:33] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[21:25:33] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[21:25:33] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[21:25:33] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[21:25:33] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[21:25:33] [PASSED] DP_REMOTE_I2C_READ with port number
[21:25:33] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[21:25:33] [PASSED] DP_REMOTE_I2C_READ with transactions array
[21:25:33] [PASSED] DP_REMOTE_I2C_WRITE with port number
[21:25:33] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[21:25:33] [PASSED] DP_REMOTE_I2C_WRITE with data array
[21:25:33] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[21:25:33] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[21:25:33] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[21:25:33] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[21:25:33] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[21:25:33] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[21:25:33] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[21:25:33] ================ [PASSED] drm_dp_mst_helper ================
[21:25:33] ================== drm_exec (7 subtests) ===================
[21:25:33] [PASSED] sanitycheck
[21:25:33] [PASSED] test_lock
[21:25:33] [PASSED] test_lock_unlock
[21:25:33] [PASSED] test_duplicates
[21:25:33] [PASSED] test_prepare
[21:25:33] [PASSED] test_prepare_array
[21:25:33] [PASSED] test_multiple_loops
[21:25:33] ==================== [PASSED] drm_exec =====================
[21:25:33] =========== drm_format_helper_test (17 subtests) ===========
[21:25:33] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[21:25:33] [PASSED] single_pixel_source_buffer
[21:25:33] [PASSED] single_pixel_clip_rectangle
[21:25:33] [PASSED] well_known_colors
[21:25:33] [PASSED] destination_pitch
[21:25:33] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[21:25:33] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[21:25:33] [PASSED] single_pixel_source_buffer
[21:25:33] [PASSED] single_pixel_clip_rectangle
[21:25:33] [PASSED] well_known_colors
[21:25:33] [PASSED] destination_pitch
[21:25:33] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[21:25:33] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[21:25:33] [PASSED] single_pixel_source_buffer
[21:25:33] [PASSED] single_pixel_clip_rectangle
[21:25:33] [PASSED] well_known_colors
[21:25:33] [PASSED] destination_pitch
[21:25:33] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[21:25:33] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[21:25:33] [PASSED] single_pixel_source_buffer
[21:25:33] [PASSED] single_pixel_clip_rectangle
[21:25:33] [PASSED] well_known_colors
[21:25:33] [PASSED] destination_pitch
[21:25:33] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[21:25:33] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[21:25:33] [PASSED] single_pixel_source_buffer
[21:25:33] [PASSED] single_pixel_clip_rectangle
[21:25:33] [PASSED] well_known_colors
[21:25:33] [PASSED] destination_pitch
[21:25:33] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[21:25:33] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[21:25:33] [PASSED] single_pixel_source_buffer
[21:25:33] [PASSED] single_pixel_clip_rectangle
[21:25:33] [PASSED] well_known_colors
[21:25:33] [PASSED] destination_pitch
[21:25:33] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[21:25:33] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[21:25:33] [PASSED] single_pixel_source_buffer
[21:25:33] [PASSED] single_pixel_clip_rectangle
[21:25:33] [PASSED] well_known_colors
[21:25:33] [PASSED] destination_pitch
[21:25:33] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[21:25:33] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[21:25:33] [PASSED] single_pixel_source_buffer
[21:25:33] [PASSED] single_pixel_clip_rectangle
[21:25:33] [PASSED] well_known_colors
[21:25:33] [PASSED] destination_pitch
[21:25:33] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[21:25:33] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[21:25:33] [PASSED] single_pixel_source_buffer
[21:25:33] [PASSED] single_pixel_clip_rectangle
[21:25:33] [PASSED] well_known_colors
[21:25:33] [PASSED] destination_pitch
[21:25:33] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[21:25:33] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[21:25:33] [PASSED] single_pixel_source_buffer
[21:25:33] [PASSED] single_pixel_clip_rectangle
[21:25:33] [PASSED] well_known_colors
[21:25:33] [PASSED] destination_pitch
[21:25:33] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[21:25:33] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[21:25:33] [PASSED] single_pixel_source_buffer
[21:25:33] [PASSED] single_pixel_clip_rectangle
[21:25:33] [PASSED] well_known_colors
[21:25:33] [PASSED] destination_pitch
[21:25:33] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[21:25:33] ============== drm_test_fb_xrgb8888_to_mono  ===============
[21:25:33] [PASSED] single_pixel_source_buffer
[21:25:33] [PASSED] single_pixel_clip_rectangle
[21:25:33] [PASSED] well_known_colors
[21:25:33] [PASSED] destination_pitch
[21:25:33] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[21:25:33] ==================== drm_test_fb_swab  =====================
[21:25:33] [PASSED] single_pixel_source_buffer
[21:25:33] [PASSED] single_pixel_clip_rectangle
[21:25:33] [PASSED] well_known_colors
[21:25:33] [PASSED] destination_pitch
[21:25:33] ================ [PASSED] drm_test_fb_swab =================
[21:25:33] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[21:25:33] [PASSED] single_pixel_source_buffer
[21:25:33] [PASSED] single_pixel_clip_rectangle
[21:25:33] [PASSED] well_known_colors
[21:25:33] [PASSED] destination_pitch
[21:25:33] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[21:25:33] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[21:25:33] [PASSED] single_pixel_source_buffer
[21:25:33] [PASSED] single_pixel_clip_rectangle
[21:25:33] [PASSED] well_known_colors
[21:25:33] [PASSED] destination_pitch
[21:25:33] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[21:25:33] ================= drm_test_fb_clip_offset  =================
[21:25:33] [PASSED] pass through
[21:25:33] [PASSED] horizontal offset
[21:25:33] [PASSED] vertical offset
[21:25:33] [PASSED] horizontal and vertical offset
[21:25:33] [PASSED] horizontal offset (custom pitch)
[21:25:33] [PASSED] vertical offset (custom pitch)
[21:25:33] [PASSED] horizontal and vertical offset (custom pitch)
[21:25:33] ============= [PASSED] drm_test_fb_clip_offset =============
[21:25:33] =================== drm_test_fb_memcpy  ====================
[21:25:33] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[21:25:33] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[21:25:33] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[21:25:33] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[21:25:33] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[21:25:33] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[21:25:33] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[21:25:33] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[21:25:33] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[21:25:33] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[21:25:33] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[21:25:33] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[21:25:33] =============== [PASSED] drm_test_fb_memcpy ================
[21:25:33] ============= [PASSED] drm_format_helper_test ==============
[21:25:33] ================= drm_format (18 subtests) =================
[21:25:33] [PASSED] drm_test_format_block_width_invalid
[21:25:33] [PASSED] drm_test_format_block_width_one_plane
[21:25:33] [PASSED] drm_test_format_block_width_two_plane
[21:25:33] [PASSED] drm_test_format_block_width_three_plane
[21:25:33] [PASSED] drm_test_format_block_width_tiled
[21:25:33] [PASSED] drm_test_format_block_height_invalid
[21:25:33] [PASSED] drm_test_format_block_height_one_plane
[21:25:33] [PASSED] drm_test_format_block_height_two_plane
[21:25:33] [PASSED] drm_test_format_block_height_three_plane
[21:25:33] [PASSED] drm_test_format_block_height_tiled
[21:25:33] [PASSED] drm_test_format_min_pitch_invalid
[21:25:33] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[21:25:33] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[21:25:33] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[21:25:33] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[21:25:33] [PASSED] drm_test_format_min_pitch_two_plane
[21:25:33] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[21:25:33] [PASSED] drm_test_format_min_pitch_tiled
[21:25:33] =================== [PASSED] drm_format ====================
[21:25:33] ============== drm_framebuffer (10 subtests) ===============
[21:25:33] ========== drm_test_framebuffer_check_src_coords  ==========
[21:25:33] [PASSED] Success: source fits into fb
[21:25:33] [PASSED] Fail: overflowing fb with x-axis coordinate
[21:25:33] [PASSED] Fail: overflowing fb with y-axis coordinate
[21:25:33] [PASSED] Fail: overflowing fb with source width
[21:25:33] [PASSED] Fail: overflowing fb with source height
[21:25:33] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[21:25:33] [PASSED] drm_test_framebuffer_cleanup
[21:25:33] =============== drm_test_framebuffer_create  ===============
[21:25:33] [PASSED] ABGR8888 normal sizes
[21:25:33] [PASSED] ABGR8888 max sizes
[21:25:33] [PASSED] ABGR8888 pitch greater than min required
[21:25:33] [PASSED] ABGR8888 pitch less than min required
[21:25:33] [PASSED] ABGR8888 Invalid width
[21:25:33] [PASSED] ABGR8888 Invalid buffer handle
[21:25:33] [PASSED] No pixel format
[21:25:33] [PASSED] ABGR8888 Width 0
[21:25:33] [PASSED] ABGR8888 Height 0
[21:25:33] [PASSED] ABGR8888 Out of bound height * pitch combination
[21:25:33] [PASSED] ABGR8888 Large buffer offset
[21:25:33] [PASSED] ABGR8888 Buffer offset for inexistent plane
[21:25:33] [PASSED] ABGR8888 Invalid flag
[21:25:33] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[21:25:33] [PASSED] ABGR8888 Valid buffer modifier
[21:25:33] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[21:25:33] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[21:25:33] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[21:25:33] [PASSED] NV12 Normal sizes
[21:25:33] [PASSED] NV12 Max sizes
[21:25:33] [PASSED] NV12 Invalid pitch
[21:25:33] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[21:25:33] [PASSED] NV12 different  modifier per-plane
[21:25:33] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[21:25:33] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[21:25:33] [PASSED] NV12 Modifier for inexistent plane
[21:25:33] [PASSED] NV12 Handle for inexistent plane
[21:25:33] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[21:25:33] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[21:25:33] [PASSED] YVU420 Normal sizes
[21:25:33] [PASSED] YVU420 Max sizes
[21:25:33] [PASSED] YVU420 Invalid pitch
[21:25:33] [PASSED] YVU420 Different pitches
[21:25:33] [PASSED] YVU420 Different buffer offsets/pitches
[21:25:33] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[21:25:33] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[21:25:33] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[21:25:33] [PASSED] YVU420 Valid modifier
[21:25:33] [PASSED] YVU420 Different modifiers per plane
[21:25:33] [PASSED] YVU420 Modifier for inexistent plane
[21:25:33] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[21:25:33] [PASSED] X0L2 Normal sizes
[21:25:33] [PASSED] X0L2 Max sizes
[21:25:33] [PASSED] X0L2 Invalid pitch
[21:25:33] [PASSED] X0L2 Pitch greater than minimum required
[21:25:33] [PASSED] X0L2 Handle for inexistent plane
[21:25:33] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[21:25:33] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[21:25:33] [PASSED] X0L2 Valid modifier
[21:25:33] [PASSED] X0L2 Modifier for inexistent plane
[21:25:33] =========== [PASSED] drm_test_framebuffer_create ===========
[21:25:33] [PASSED] drm_test_framebuffer_free
[21:25:33] [PASSED] drm_test_framebuffer_init
[21:25:33] [PASSED] drm_test_framebuffer_init_bad_format
[21:25:33] [PASSED] drm_test_framebuffer_init_dev_mismatch
[21:25:33] [PASSED] drm_test_framebuffer_lookup
[21:25:33] [PASSED] drm_test_framebuffer_lookup_inexistent
[21:25:33] [PASSED] drm_test_framebuffer_modifiers_not_supported
[21:25:33] ================= [PASSED] drm_framebuffer =================
[21:25:33] ================ drm_gem_shmem (8 subtests) ================
[21:25:33] [PASSED] drm_gem_shmem_test_obj_create
[21:25:33] [PASSED] drm_gem_shmem_test_obj_create_private
[21:25:33] [PASSED] drm_gem_shmem_test_pin_pages
[21:25:33] [PASSED] drm_gem_shmem_test_vmap
[21:25:33] [PASSED] drm_gem_shmem_test_get_pages_sgt
[21:25:33] [PASSED] drm_gem_shmem_test_get_sg_table
[21:25:33] [PASSED] drm_gem_shmem_test_madvise
[21:25:33] [PASSED] drm_gem_shmem_test_purge
[21:25:33] ================== [PASSED] drm_gem_shmem ==================
[21:25:33] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[21:25:33] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[21:25:33] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[21:25:33] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[21:25:33] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[21:25:33] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[21:25:33] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[21:25:33] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[21:25:33] [PASSED] Automatic
[21:25:33] [PASSED] Full
[21:25:33] [PASSED] Limited 16:235
[21:25:33] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[21:25:33] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[21:25:33] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[21:25:33] [PASSED] drm_test_check_disable_connector
[21:25:33] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[21:25:33] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[21:25:33] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[21:25:33] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[21:25:33] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[21:25:33] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[21:25:33] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[21:25:33] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[21:25:33] [PASSED] drm_test_check_output_bpc_dvi
[21:25:33] [PASSED] drm_test_check_output_bpc_format_vic_1
[21:25:33] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[21:25:33] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[21:25:33] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[21:25:33] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[21:25:33] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[21:25:33] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[21:25:33] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[21:25:33] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[21:25:33] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[21:25:33] [PASSED] drm_test_check_broadcast_rgb_value
[21:25:33] [PASSED] drm_test_check_bpc_8_value
[21:25:33] [PASSED] drm_test_check_bpc_10_value
[21:25:33] [PASSED] drm_test_check_bpc_12_value
[21:25:33] [PASSED] drm_test_check_format_value
[21:25:33] [PASSED] drm_test_check_tmds_char_value
[21:25:33] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[21:25:33] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[21:25:33] [PASSED] drm_test_check_mode_valid
[21:25:33] [PASSED] drm_test_check_mode_valid_reject
[21:25:33] [PASSED] drm_test_check_mode_valid_reject_rate
[21:25:33] [PASSED] drm_test_check_mode_valid_reject_max_clock
[21:25:33] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[21:25:33] ================= drm_managed (2 subtests) =================
[21:25:33] [PASSED] drm_test_managed_release_action
[21:25:33] [PASSED] drm_test_managed_run_action
[21:25:33] =================== [PASSED] drm_managed ===================
[21:25:33] =================== drm_mm (6 subtests) ====================
[21:25:33] [PASSED] drm_test_mm_init
[21:25:33] [PASSED] drm_test_mm_debug
[21:25:33] [PASSED] drm_test_mm_align32
[21:25:33] [PASSED] drm_test_mm_align64
[21:25:33] [PASSED] drm_test_mm_lowest
[21:25:33] [PASSED] drm_test_mm_highest
[21:25:33] ===================== [PASSED] drm_mm ======================
[21:25:33] ============= drm_modes_analog_tv (5 subtests) =============
[21:25:33] [PASSED] drm_test_modes_analog_tv_mono_576i
[21:25:33] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[21:25:33] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[21:25:33] [PASSED] drm_test_modes_analog_tv_pal_576i
[21:25:33] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[21:25:33] =============== [PASSED] drm_modes_analog_tv ===============
[21:25:33] ============== drm_plane_helper (2 subtests) ===============
[21:25:33] =============== drm_test_check_plane_state  ================
[21:25:33] [PASSED] clipping_simple
[21:25:33] [PASSED] clipping_rotate_reflect
[21:25:33] [PASSED] positioning_simple
[21:25:33] [PASSED] upscaling
[21:25:33] [PASSED] downscaling
[21:25:33] [PASSED] rounding1
[21:25:33] [PASSED] rounding2
[21:25:33] [PASSED] rounding3
[21:25:33] [PASSED] rounding4
[21:25:33] =========== [PASSED] drm_test_check_plane_state ============
[21:25:33] =========== drm_test_check_invalid_plane_state  ============
[21:25:33] [PASSED] positioning_invalid
[21:25:33] [PASSED] upscaling_invalid
[21:25:33] [PASSED] downscaling_invalid
[21:25:33] ======= [PASSED] drm_test_check_invalid_plane_state ========
[21:25:33] ================ [PASSED] drm_plane_helper =================
[21:25:33] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[21:25:33] ====== drm_test_connector_helper_tv_get_modes_check  =======
[21:25:33] [PASSED] None
[21:25:33] [PASSED] PAL
[21:25:33] [PASSED] NTSC
[21:25:33] [PASSED] Both, NTSC Default
[21:25:33] [PASSED] Both, PAL Default
[21:25:33] [PASSED] Both, NTSC Default, with PAL on command-line
[21:25:33] [PASSED] Both, PAL Default, with NTSC on command-line
[21:25:33] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[21:25:33] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[21:25:33] ================== drm_rect (9 subtests) ===================
[21:25:33] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[21:25:33] [PASSED] drm_test_rect_clip_scaled_not_clipped
[21:25:33] [PASSED] drm_test_rect_clip_scaled_clipped
[21:25:33] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[21:25:33] ================= drm_test_rect_intersect  =================
[21:25:33] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[21:25:33] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[21:25:33] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[21:25:33] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[21:25:33] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[21:25:33] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[21:25:33] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[21:25:33] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[21:25:33] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[21:25:33] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[21:25:33] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[21:25:33] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[21:25:33] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[21:25:33] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[21:25:33] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[21:25:33] ============= [PASSED] drm_test_rect_intersect =============
[21:25:33] ================ drm_test_rect_calc_hscale  ================
[21:25:33] [PASSED] normal use
[21:25:33] [PASSED] out of max range
[21:25:33] [PASSED] out of min range
[21:25:33] [PASSED] zero dst
[21:25:33] [PASSED] negative src
[21:25:33] [PASSED] negative dst
[21:25:33] ============ [PASSED] drm_test_rect_calc_hscale ============
[21:25:33] ================ drm_test_rect_calc_vscale  ================
[21:25:33] [PASSED] normal use
stty: 'standard input': Inappropriate ioctl for device
[21:25:33] [PASSED] out of max range
[21:25:33] [PASSED] out of min range
[21:25:33] [PASSED] zero dst
[21:25:33] [PASSED] negative src
[21:25:33] [PASSED] negative dst
[21:25:33] ============ [PASSED] drm_test_rect_calc_vscale ============
[21:25:33] ================== drm_test_rect_rotate  ===================
[21:25:33] [PASSED] reflect-x
[21:25:33] [PASSED] reflect-y
[21:25:33] [PASSED] rotate-0
[21:25:33] [PASSED] rotate-90
[21:25:33] [PASSED] rotate-180
[21:25:33] [PASSED] rotate-270
[21:25:33] ============== [PASSED] drm_test_rect_rotate ===============
[21:25:33] ================ drm_test_rect_rotate_inv  =================
[21:25:33] [PASSED] reflect-x
[21:25:33] [PASSED] reflect-y
[21:25:33] [PASSED] rotate-0
[21:25:33] [PASSED] rotate-90
[21:25:33] [PASSED] rotate-180
[21:25:33] [PASSED] rotate-270
[21:25:33] ============ [PASSED] drm_test_rect_rotate_inv =============
[21:25:33] ==================== [PASSED] drm_rect =====================
[21:25:33] ============ drm_sysfb_modeset_test (1 subtest) ============
[21:25:33] ============ drm_test_sysfb_build_fourcc_list  =============
[21:25:33] [PASSED] no native formats
[21:25:33] [PASSED] XRGB8888 as native format
[21:25:33] [PASSED] remove duplicates
[21:25:33] [PASSED] convert alpha formats
[21:25:33] [PASSED] random formats
[21:25:33] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[21:25:33] ============= [PASSED] drm_sysfb_modeset_test ==============
[21:25:33] ================== drm_fixp (2 subtests) ===================
[21:25:33] [PASSED] drm_test_int2fixp
[21:25:33] [PASSED] drm_test_sm2fixp
[21:25:33] ==================== [PASSED] drm_fixp =====================
[21:25:33] ============================================================
[21:25:33] Testing complete. Ran 624 tests: passed: 624
[21:25:33] Elapsed time: 26.906s total, 1.723s configuring, 24.708s building, 0.437s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[21:25:33] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:25:35] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[21:25:44] Starting KUnit Kernel (1/1)...
[21:25:44] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[21:25:44] ================= ttm_device (5 subtests) ==================
[21:25:44] [PASSED] ttm_device_init_basic
[21:25:44] [PASSED] ttm_device_init_multiple
[21:25:44] [PASSED] ttm_device_fini_basic
[21:25:44] [PASSED] ttm_device_init_no_vma_man
[21:25:44] ================== ttm_device_init_pools  ==================
[21:25:44] [PASSED] No DMA allocations, no DMA32 required
[21:25:44] [PASSED] DMA allocations, DMA32 required
[21:25:44] [PASSED] No DMA allocations, DMA32 required
[21:25:44] [PASSED] DMA allocations, no DMA32 required
[21:25:44] ============== [PASSED] ttm_device_init_pools ==============
[21:25:44] =================== [PASSED] ttm_device ====================
[21:25:44] ================== ttm_pool (8 subtests) ===================
[21:25:44] ================== ttm_pool_alloc_basic  ===================
[21:25:44] [PASSED] One page
[21:25:44] [PASSED] More than one page
[21:25:44] [PASSED] Above the allocation limit
[21:25:44] [PASSED] One page, with coherent DMA mappings enabled
[21:25:44] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[21:25:44] ============== [PASSED] ttm_pool_alloc_basic ===============
[21:25:44] ============== ttm_pool_alloc_basic_dma_addr  ==============
[21:25:44] [PASSED] One page
[21:25:44] [PASSED] More than one page
[21:25:44] [PASSED] Above the allocation limit
[21:25:44] [PASSED] One page, with coherent DMA mappings enabled
[21:25:44] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[21:25:44] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[21:25:44] [PASSED] ttm_pool_alloc_order_caching_match
[21:25:44] [PASSED] ttm_pool_alloc_caching_mismatch
[21:25:44] [PASSED] ttm_pool_alloc_order_mismatch
[21:25:44] [PASSED] ttm_pool_free_dma_alloc
[21:25:44] [PASSED] ttm_pool_free_no_dma_alloc
[21:25:44] [PASSED] ttm_pool_fini_basic
[21:25:44] ==================== [PASSED] ttm_pool =====================
[21:25:44] ================ ttm_resource (8 subtests) =================
[21:25:44] ================= ttm_resource_init_basic  =================
[21:25:44] [PASSED] Init resource in TTM_PL_SYSTEM
[21:25:44] [PASSED] Init resource in TTM_PL_VRAM
[21:25:44] [PASSED] Init resource in a private placement
[21:25:44] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[21:25:44] ============= [PASSED] ttm_resource_init_basic =============
[21:25:44] [PASSED] ttm_resource_init_pinned
[21:25:44] [PASSED] ttm_resource_fini_basic
[21:25:44] [PASSED] ttm_resource_manager_init_basic
[21:25:44] [PASSED] ttm_resource_manager_usage_basic
[21:25:44] [PASSED] ttm_resource_manager_set_used_basic
[21:25:44] [PASSED] ttm_sys_man_alloc_basic
[21:25:44] [PASSED] ttm_sys_man_free_basic
[21:25:44] ================== [PASSED] ttm_resource ===================
[21:25:44] =================== ttm_tt (15 subtests) ===================
[21:25:44] ==================== ttm_tt_init_basic  ====================
[21:25:44] [PASSED] Page-aligned size
[21:25:44] [PASSED] Extra pages requested
[21:25:44] ================ [PASSED] ttm_tt_init_basic ================
[21:25:44] [PASSED] ttm_tt_init_misaligned
[21:25:44] [PASSED] ttm_tt_fini_basic
[21:25:44] [PASSED] ttm_tt_fini_sg
[21:25:44] [PASSED] ttm_tt_fini_shmem
[21:25:44] [PASSED] ttm_tt_create_basic
[21:25:44] [PASSED] ttm_tt_create_invalid_bo_type
[21:25:44] [PASSED] ttm_tt_create_ttm_exists
[21:25:44] [PASSED] ttm_tt_create_failed
[21:25:44] [PASSED] ttm_tt_destroy_basic
[21:25:44] [PASSED] ttm_tt_populate_null_ttm
[21:25:44] [PASSED] ttm_tt_populate_populated_ttm
[21:25:44] [PASSED] ttm_tt_unpopulate_basic
[21:25:44] [PASSED] ttm_tt_unpopulate_empty_ttm
[21:25:44] [PASSED] ttm_tt_swapin_basic
[21:25:44] ===================== [PASSED] ttm_tt ======================
[21:25:44] =================== ttm_bo (14 subtests) ===================
[21:25:44] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[21:25:44] [PASSED] Cannot be interrupted and sleeps
[21:25:44] [PASSED] Cannot be interrupted, locks straight away
[21:25:44] [PASSED] Can be interrupted, sleeps
[21:25:44] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[21:25:44] [PASSED] ttm_bo_reserve_locked_no_sleep
[21:25:44] [PASSED] ttm_bo_reserve_no_wait_ticket
[21:25:45] [PASSED] ttm_bo_reserve_double_resv
[21:25:45] [PASSED] ttm_bo_reserve_interrupted
[21:25:45] [PASSED] ttm_bo_reserve_deadlock
[21:25:45] [PASSED] ttm_bo_unreserve_basic
[21:25:45] [PASSED] ttm_bo_unreserve_pinned
[21:25:45] [PASSED] ttm_bo_unreserve_bulk
[21:25:45] [PASSED] ttm_bo_fini_basic
[21:25:45] [PASSED] ttm_bo_fini_shared_resv
[21:25:45] [PASSED] ttm_bo_pin_basic
[21:25:45] [PASSED] ttm_bo_pin_unpin_resource
[21:25:45] [PASSED] ttm_bo_multiple_pin_one_unpin
[21:25:45] ===================== [PASSED] ttm_bo ======================
[21:25:45] ============== ttm_bo_validate (21 subtests) ===============
[21:25:45] ============== ttm_bo_init_reserved_sys_man  ===============
[21:25:45] [PASSED] Buffer object for userspace
[21:25:45] [PASSED] Kernel buffer object
[21:25:45] [PASSED] Shared buffer object
[21:25:45] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[21:25:45] ============== ttm_bo_init_reserved_mock_man  ==============
[21:25:45] [PASSED] Buffer object for userspace
[21:25:45] [PASSED] Kernel buffer object
[21:25:45] [PASSED] Shared buffer object
[21:25:45] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[21:25:45] [PASSED] ttm_bo_init_reserved_resv
[21:25:45] ================== ttm_bo_validate_basic  ==================
[21:25:45] [PASSED] Buffer object for userspace
[21:25:45] [PASSED] Kernel buffer object
[21:25:45] [PASSED] Shared buffer object
[21:25:45] ============== [PASSED] ttm_bo_validate_basic ==============
[21:25:45] [PASSED] ttm_bo_validate_invalid_placement
[21:25:45] ============= ttm_bo_validate_same_placement  ==============
[21:25:45] [PASSED] System manager
[21:25:45] [PASSED] VRAM manager
[21:25:45] ========= [PASSED] ttm_bo_validate_same_placement ==========
[21:25:45] [PASSED] ttm_bo_validate_failed_alloc
[21:25:45] [PASSED] ttm_bo_validate_pinned
[21:25:45] [PASSED] ttm_bo_validate_busy_placement
[21:25:45] ================ ttm_bo_validate_multihop  =================
[21:25:45] [PASSED] Buffer object for userspace
[21:25:45] [PASSED] Kernel buffer object
[21:25:45] [PASSED] Shared buffer object
[21:25:45] ============ [PASSED] ttm_bo_validate_multihop =============
[21:25:45] ========== ttm_bo_validate_no_placement_signaled  ==========
[21:25:45] [PASSED] Buffer object in system domain, no page vector
[21:25:45] [PASSED] Buffer object in system domain with an existing page vector
[21:25:45] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[21:25:45] ======== ttm_bo_validate_no_placement_not_signaled  ========
[21:25:45] [PASSED] Buffer object for userspace
[21:25:45] [PASSED] Kernel buffer object
[21:25:45] [PASSED] Shared buffer object
[21:25:45] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[21:25:45] [PASSED] ttm_bo_validate_move_fence_signaled
[21:25:45] ========= ttm_bo_validate_move_fence_not_signaled  =========
[21:25:45] [PASSED] Waits for GPU
[21:25:45] [PASSED] Tries to lock straight away
[21:25:45] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[21:25:45] [PASSED] ttm_bo_validate_happy_evict
[21:25:45] [PASSED] ttm_bo_validate_all_pinned_evict
[21:25:45] [PASSED] ttm_bo_validate_allowed_only_evict
[21:25:45] [PASSED] ttm_bo_validate_deleted_evict
[21:25:45] [PASSED] ttm_bo_validate_busy_domain_evict
[21:25:45] [PASSED] ttm_bo_validate_evict_gutting
[21:25:45] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[21:25:45] ================= [PASSED] ttm_bo_validate =================
[21:25:45] ============================================================
[21:25:45] Testing complete. Ran 101 tests: passed: 101
[21:25:45] Elapsed time: 11.180s total, 1.710s configuring, 9.205s building, 0.228s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


