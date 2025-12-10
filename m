Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEADBD3C523
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 02:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A525D10E64D;
	Wed, 10 Dec 2025 02:45:41 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C19910E64C;
 Wed, 10 Dec 2025 02:45:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/hw=5Fengine=5Fgroup=3A_?=
 =?utf-8?q?Add_stats_for_mode_switching?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Dec 2025 02:45:41 -0000
Message-ID: <176533474117.71878.1433968053388868258@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251209164625.228826-1-francois.dugast@intel.com>
In-Reply-To: <20251209164625.228826-1-francois.dugast@intel.com>
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

Series: drm/xe/hw_engine_group: Add stats for mode switching
URL   : https://patchwork.freedesktop.org/series/158708/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[02:44:24] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:44:28] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[02:44:58] Starting KUnit Kernel (1/1)...
[02:44:58] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[02:44:58] ================== guc_buf (11 subtests) ===================
[02:44:58] [PASSED] test_smallest
[02:44:58] [PASSED] test_largest
[02:44:58] [PASSED] test_granular
[02:44:58] [PASSED] test_unique
[02:44:58] [PASSED] test_overlap
[02:44:58] [PASSED] test_reusable
[02:44:58] [PASSED] test_too_big
[02:44:58] [PASSED] test_flush
[02:44:58] [PASSED] test_lookup
[02:44:58] [PASSED] test_data
[02:44:58] [PASSED] test_class
[02:44:58] ===================== [PASSED] guc_buf =====================
[02:44:58] =================== guc_dbm (7 subtests) ===================
[02:44:58] [PASSED] test_empty
[02:44:58] [PASSED] test_default
[02:44:58] ======================== test_size  ========================
[02:44:58] [PASSED] 4
[02:44:58] [PASSED] 8
[02:44:58] [PASSED] 32
[02:44:58] [PASSED] 256
[02:44:58] ==================== [PASSED] test_size ====================
[02:44:58] ======================= test_reuse  ========================
[02:44:58] [PASSED] 4
[02:44:58] [PASSED] 8
[02:44:58] [PASSED] 32
[02:44:58] [PASSED] 256
[02:44:58] =================== [PASSED] test_reuse ====================
[02:44:58] =================== test_range_overlap  ====================
[02:44:58] [PASSED] 4
[02:44:58] [PASSED] 8
[02:44:58] [PASSED] 32
[02:44:58] [PASSED] 256
[02:44:58] =============== [PASSED] test_range_overlap ================
[02:44:58] =================== test_range_compact  ====================
[02:44:58] [PASSED] 4
[02:44:58] [PASSED] 8
[02:44:58] [PASSED] 32
[02:44:58] [PASSED] 256
[02:44:58] =============== [PASSED] test_range_compact ================
[02:44:58] ==================== test_range_spare  =====================
[02:44:58] [PASSED] 4
[02:44:58] [PASSED] 8
[02:44:58] [PASSED] 32
[02:44:58] [PASSED] 256
[02:44:58] ================ [PASSED] test_range_spare =================
[02:44:58] ===================== [PASSED] guc_dbm =====================
[02:44:58] =================== guc_idm (6 subtests) ===================
[02:44:58] [PASSED] bad_init
[02:44:58] [PASSED] no_init
[02:44:58] [PASSED] init_fini
[02:44:58] [PASSED] check_used
[02:44:58] [PASSED] check_quota
[02:44:58] [PASSED] check_all
[02:44:58] ===================== [PASSED] guc_idm =====================
[02:44:58] ================== no_relay (3 subtests) ===================
[02:44:58] [PASSED] xe_drops_guc2pf_if_not_ready
[02:44:58] [PASSED] xe_drops_guc2vf_if_not_ready
[02:44:58] [PASSED] xe_rejects_send_if_not_ready
[02:44:58] ==================== [PASSED] no_relay =====================
[02:44:58] ================== pf_relay (14 subtests) ==================
[02:44:58] [PASSED] pf_rejects_guc2pf_too_short
[02:44:58] [PASSED] pf_rejects_guc2pf_too_long
[02:44:58] [PASSED] pf_rejects_guc2pf_no_payload
[02:44:58] [PASSED] pf_fails_no_payload
[02:44:58] [PASSED] pf_fails_bad_origin
[02:44:58] [PASSED] pf_fails_bad_type
[02:44:58] [PASSED] pf_txn_reports_error
[02:44:58] [PASSED] pf_txn_sends_pf2guc
[02:44:58] [PASSED] pf_sends_pf2guc
[02:44:58] [SKIPPED] pf_loopback_nop
[02:44:58] [SKIPPED] pf_loopback_echo
[02:44:58] [SKIPPED] pf_loopback_fail
[02:44:58] [SKIPPED] pf_loopback_busy
[02:44:58] [SKIPPED] pf_loopback_retry
[02:44:58] ==================== [PASSED] pf_relay =====================
[02:44:58] ================== vf_relay (3 subtests) ===================
[02:44:58] [PASSED] vf_rejects_guc2vf_too_short
[02:44:58] [PASSED] vf_rejects_guc2vf_too_long
[02:44:58] [PASSED] vf_rejects_guc2vf_no_payload
[02:44:58] ==================== [PASSED] vf_relay =====================
[02:44:58] ================ pf_gt_config (6 subtests) =================
[02:44:58] [PASSED] fair_contexts_1vf
[02:44:58] [PASSED] fair_doorbells_1vf
[02:44:58] [PASSED] fair_ggtt_1vf
[02:44:58] ====================== fair_contexts  ======================
[02:44:58] [PASSED] 1 VF
[02:44:58] [PASSED] 2 VFs
[02:44:58] [PASSED] 3 VFs
[02:44:58] [PASSED] 4 VFs
[02:44:58] [PASSED] 5 VFs
[02:44:58] [PASSED] 6 VFs
[02:44:58] [PASSED] 7 VFs
[02:44:58] [PASSED] 8 VFs
[02:44:58] [PASSED] 9 VFs
[02:44:58] [PASSED] 10 VFs
[02:44:58] [PASSED] 11 VFs
[02:44:58] [PASSED] 12 VFs
[02:44:58] [PASSED] 13 VFs
[02:44:58] [PASSED] 14 VFs
[02:44:58] [PASSED] 15 VFs
[02:44:58] [PASSED] 16 VFs
[02:44:58] [PASSED] 17 VFs
[02:44:58] [PASSED] 18 VFs
[02:44:58] [PASSED] 19 VFs
[02:44:58] [PASSED] 20 VFs
[02:44:58] [PASSED] 21 VFs
[02:44:58] [PASSED] 22 VFs
[02:44:58] [PASSED] 23 VFs
[02:44:58] [PASSED] 24 VFs
[02:44:58] [PASSED] 25 VFs
[02:44:58] [PASSED] 26 VFs
[02:44:58] [PASSED] 27 VFs
[02:44:58] [PASSED] 28 VFs
[02:44:58] [PASSED] 29 VFs
[02:44:58] [PASSED] 30 VFs
[02:44:58] [PASSED] 31 VFs
[02:44:58] [PASSED] 32 VFs
[02:44:58] [PASSED] 33 VFs
[02:44:58] [PASSED] 34 VFs
[02:44:58] [PASSED] 35 VFs
[02:44:58] [PASSED] 36 VFs
[02:44:58] [PASSED] 37 VFs
[02:44:58] [PASSED] 38 VFs
[02:44:58] [PASSED] 39 VFs
[02:44:58] [PASSED] 40 VFs
[02:44:58] [PASSED] 41 VFs
[02:44:58] [PASSED] 42 VFs
[02:44:58] [PASSED] 43 VFs
[02:44:58] [PASSED] 44 VFs
[02:44:58] [PASSED] 45 VFs
[02:44:58] [PASSED] 46 VFs
[02:44:58] [PASSED] 47 VFs
[02:44:58] [PASSED] 48 VFs
[02:44:58] [PASSED] 49 VFs
[02:44:58] [PASSED] 50 VFs
[02:44:58] [PASSED] 51 VFs
[02:44:58] [PASSED] 52 VFs
[02:44:58] [PASSED] 53 VFs
[02:44:58] [PASSED] 54 VFs
[02:44:58] [PASSED] 55 VFs
[02:44:58] [PASSED] 56 VFs
[02:44:58] [PASSED] 57 VFs
[02:44:58] [PASSED] 58 VFs
[02:44:58] [PASSED] 59 VFs
[02:44:58] [PASSED] 60 VFs
[02:44:58] [PASSED] 61 VFs
[02:44:58] [PASSED] 62 VFs
[02:44:58] [PASSED] 63 VFs
[02:44:58] ================== [PASSED] fair_contexts ==================
[02:44:58] ===================== fair_doorbells  ======================
[02:44:58] [PASSED] 1 VF
[02:44:59] [PASSED] 2 VFs
[02:44:59] [PASSED] 3 VFs
[02:44:59] [PASSED] 4 VFs
[02:44:59] [PASSED] 5 VFs
[02:44:59] [PASSED] 6 VFs
[02:44:59] [PASSED] 7 VFs
[02:44:59] [PASSED] 8 VFs
[02:44:59] [PASSED] 9 VFs
[02:44:59] [PASSED] 10 VFs
[02:44:59] [PASSED] 11 VFs
[02:44:59] [PASSED] 12 VFs
[02:44:59] [PASSED] 13 VFs
[02:44:59] [PASSED] 14 VFs
[02:44:59] [PASSED] 15 VFs
[02:44:59] [PASSED] 16 VFs
[02:44:59] [PASSED] 17 VFs
[02:44:59] [PASSED] 18 VFs
[02:44:59] [PASSED] 19 VFs
[02:44:59] [PASSED] 20 VFs
[02:44:59] [PASSED] 21 VFs
[02:44:59] [PASSED] 22 VFs
[02:44:59] [PASSED] 23 VFs
[02:44:59] [PASSED] 24 VFs
[02:44:59] [PASSED] 25 VFs
[02:44:59] [PASSED] 26 VFs
[02:44:59] [PASSED] 27 VFs
[02:44:59] [PASSED] 28 VFs
[02:44:59] [PASSED] 29 VFs
[02:44:59] [PASSED] 30 VFs
[02:44:59] [PASSED] 31 VFs
[02:44:59] [PASSED] 32 VFs
[02:44:59] [PASSED] 33 VFs
[02:44:59] [PASSED] 34 VFs
[02:44:59] [PASSED] 35 VFs
[02:44:59] [PASSED] 36 VFs
[02:44:59] [PASSED] 37 VFs
[02:44:59] [PASSED] 38 VFs
[02:44:59] [PASSED] 39 VFs
[02:44:59] [PASSED] 40 VFs
[02:44:59] [PASSED] 41 VFs
[02:44:59] [PASSED] 42 VFs
[02:44:59] [PASSED] 43 VFs
[02:44:59] [PASSED] 44 VFs
[02:44:59] [PASSED] 45 VFs
[02:44:59] [PASSED] 46 VFs
[02:44:59] [PASSED] 47 VFs
[02:44:59] [PASSED] 48 VFs
[02:44:59] [PASSED] 49 VFs
[02:44:59] [PASSED] 50 VFs
[02:44:59] [PASSED] 51 VFs
[02:44:59] [PASSED] 52 VFs
[02:44:59] [PASSED] 53 VFs
[02:44:59] [PASSED] 54 VFs
[02:44:59] [PASSED] 55 VFs
[02:44:59] [PASSED] 56 VFs
[02:44:59] [PASSED] 57 VFs
[02:44:59] [PASSED] 58 VFs
[02:44:59] [PASSED] 59 VFs
[02:44:59] [PASSED] 60 VFs
[02:44:59] [PASSED] 61 VFs
[02:44:59] [PASSED] 62 VFs
[02:44:59] [PASSED] 63 VFs
[02:44:59] ================= [PASSED] fair_doorbells ==================
[02:44:59] ======================== fair_ggtt  ========================
[02:44:59] [PASSED] 1 VF
[02:44:59] [PASSED] 2 VFs
[02:44:59] [PASSED] 3 VFs
[02:44:59] [PASSED] 4 VFs
[02:44:59] [PASSED] 5 VFs
[02:44:59] [PASSED] 6 VFs
[02:44:59] [PASSED] 7 VFs
[02:44:59] [PASSED] 8 VFs
[02:44:59] [PASSED] 9 VFs
[02:44:59] [PASSED] 10 VFs
[02:44:59] [PASSED] 11 VFs
[02:44:59] [PASSED] 12 VFs
[02:44:59] [PASSED] 13 VFs
[02:44:59] [PASSED] 14 VFs
[02:44:59] [PASSED] 15 VFs
[02:44:59] [PASSED] 16 VFs
[02:44:59] [PASSED] 17 VFs
[02:44:59] [PASSED] 18 VFs
[02:44:59] [PASSED] 19 VFs
[02:44:59] [PASSED] 20 VFs
[02:44:59] [PASSED] 21 VFs
[02:44:59] [PASSED] 22 VFs
[02:44:59] [PASSED] 23 VFs
[02:44:59] [PASSED] 24 VFs
[02:44:59] [PASSED] 25 VFs
[02:44:59] [PASSED] 26 VFs
[02:44:59] [PASSED] 27 VFs
[02:44:59] [PASSED] 28 VFs
[02:44:59] [PASSED] 29 VFs
[02:44:59] [PASSED] 30 VFs
[02:44:59] [PASSED] 31 VFs
[02:44:59] [PASSED] 32 VFs
[02:44:59] [PASSED] 33 VFs
[02:44:59] [PASSED] 34 VFs
[02:44:59] [PASSED] 35 VFs
[02:44:59] [PASSED] 36 VFs
[02:44:59] [PASSED] 37 VFs
[02:44:59] [PASSED] 38 VFs
[02:44:59] [PASSED] 39 VFs
[02:44:59] [PASSED] 40 VFs
[02:44:59] [PASSED] 41 VFs
[02:44:59] [PASSED] 42 VFs
[02:44:59] [PASSED] 43 VFs
[02:44:59] [PASSED] 44 VFs
[02:44:59] [PASSED] 45 VFs
[02:44:59] [PASSED] 46 VFs
[02:44:59] [PASSED] 47 VFs
[02:44:59] [PASSED] 48 VFs
[02:44:59] [PASSED] 49 VFs
[02:44:59] [PASSED] 50 VFs
[02:44:59] [PASSED] 51 VFs
[02:44:59] [PASSED] 52 VFs
[02:44:59] [PASSED] 53 VFs
[02:44:59] [PASSED] 54 VFs
[02:44:59] [PASSED] 55 VFs
[02:44:59] [PASSED] 56 VFs
[02:44:59] [PASSED] 57 VFs
[02:44:59] [PASSED] 58 VFs
[02:44:59] [PASSED] 59 VFs
[02:44:59] [PASSED] 60 VFs
[02:44:59] [PASSED] 61 VFs
[02:44:59] [PASSED] 62 VFs
[02:44:59] [PASSED] 63 VFs
[02:44:59] ==================== [PASSED] fair_ggtt ====================
[02:44:59] ================== [PASSED] pf_gt_config ===================
[02:44:59] ===================== lmtt (1 subtest) =====================
[02:44:59] ======================== test_ops  =========================
[02:44:59] [PASSED] 2-level
[02:44:59] [PASSED] multi-level
[02:44:59] ==================== [PASSED] test_ops =====================
[02:44:59] ====================== [PASSED] lmtt =======================
[02:44:59] ================= pf_service (11 subtests) =================
[02:44:59] [PASSED] pf_negotiate_any
[02:44:59] [PASSED] pf_negotiate_base_match
[02:44:59] [PASSED] pf_negotiate_base_newer
[02:44:59] [PASSED] pf_negotiate_base_next
[02:44:59] [SKIPPED] pf_negotiate_base_older
[02:44:59] [PASSED] pf_negotiate_base_prev
[02:44:59] [PASSED] pf_negotiate_latest_match
[02:44:59] [PASSED] pf_negotiate_latest_newer
[02:44:59] [PASSED] pf_negotiate_latest_next
[02:44:59] [SKIPPED] pf_negotiate_latest_older
[02:44:59] [SKIPPED] pf_negotiate_latest_prev
[02:44:59] =================== [PASSED] pf_service ====================
[02:44:59] ================= xe_guc_g2g (2 subtests) ==================
[02:44:59] ============== xe_live_guc_g2g_kunit_default  ==============
[02:44:59] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[02:44:59] ============== xe_live_guc_g2g_kunit_allmem  ===============
[02:44:59] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[02:44:59] =================== [SKIPPED] xe_guc_g2g ===================
[02:44:59] =================== xe_mocs (2 subtests) ===================
[02:44:59] ================ xe_live_mocs_kernel_kunit  ================
[02:44:59] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[02:44:59] ================ xe_live_mocs_reset_kunit  =================
[02:44:59] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[02:44:59] ==================== [SKIPPED] xe_mocs =====================
[02:44:59] ================= xe_migrate (2 subtests) ==================
[02:44:59] ================= xe_migrate_sanity_kunit  =================
[02:44:59] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[02:44:59] ================== xe_validate_ccs_kunit  ==================
[02:44:59] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[02:44:59] =================== [SKIPPED] xe_migrate ===================
[02:44:59] ================== xe_dma_buf (1 subtest) ==================
[02:44:59] ==================== xe_dma_buf_kunit  =====================
[02:44:59] ================ [SKIPPED] xe_dma_buf_kunit ================
[02:44:59] =================== [SKIPPED] xe_dma_buf ===================
[02:44:59] ================= xe_bo_shrink (1 subtest) =================
[02:44:59] =================== xe_bo_shrink_kunit  ====================
[02:44:59] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[02:44:59] ================== [SKIPPED] xe_bo_shrink ==================
[02:44:59] ==================== xe_bo (2 subtests) ====================
[02:44:59] ================== xe_ccs_migrate_kunit  ===================
[02:44:59] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[02:44:59] ==================== xe_bo_evict_kunit  ====================
[02:44:59] =============== [SKIPPED] xe_bo_evict_kunit ================
[02:44:59] ===================== [SKIPPED] xe_bo ======================
[02:44:59] ==================== args (11 subtests) ====================
[02:44:59] [PASSED] count_args_test
[02:44:59] [PASSED] call_args_example
[02:44:59] [PASSED] call_args_test
[02:44:59] [PASSED] drop_first_arg_example
[02:44:59] [PASSED] drop_first_arg_test
[02:44:59] [PASSED] first_arg_example
[02:44:59] [PASSED] first_arg_test
[02:44:59] [PASSED] last_arg_example
[02:44:59] [PASSED] last_arg_test
[02:44:59] [PASSED] pick_arg_example
[02:44:59] [PASSED] sep_comma_example
[02:44:59] ====================== [PASSED] args =======================
[02:44:59] =================== xe_pci (3 subtests) ====================
[02:44:59] ==================== check_graphics_ip  ====================
[02:44:59] [PASSED] 12.00 Xe_LP
[02:44:59] [PASSED] 12.10 Xe_LP+
[02:44:59] [PASSED] 12.55 Xe_HPG
[02:44:59] [PASSED] 12.60 Xe_HPC
[02:44:59] [PASSED] 12.70 Xe_LPG
[02:44:59] [PASSED] 12.71 Xe_LPG
[02:44:59] [PASSED] 12.74 Xe_LPG+
[02:44:59] [PASSED] 20.01 Xe2_HPG
[02:44:59] [PASSED] 20.02 Xe2_HPG
[02:44:59] [PASSED] 20.04 Xe2_LPG
[02:44:59] [PASSED] 30.00 Xe3_LPG
[02:44:59] [PASSED] 30.01 Xe3_LPG
[02:44:59] [PASSED] 30.03 Xe3_LPG
[02:44:59] [PASSED] 30.04 Xe3_LPG
[02:44:59] [PASSED] 30.05 Xe3_LPG
[02:44:59] [PASSED] 35.11 Xe3p_XPC
[02:44:59] ================ [PASSED] check_graphics_ip ================
[02:44:59] ===================== check_media_ip  ======================
[02:44:59] [PASSED] 12.00 Xe_M
[02:44:59] [PASSED] 12.55 Xe_HPM
[02:44:59] [PASSED] 13.00 Xe_LPM+
[02:44:59] [PASSED] 13.01 Xe2_HPM
[02:44:59] [PASSED] 20.00 Xe2_LPM
[02:44:59] [PASSED] 30.00 Xe3_LPM
[02:44:59] [PASSED] 30.02 Xe3_LPM
[02:44:59] [PASSED] 35.00 Xe3p_LPM
[02:44:59] [PASSED] 35.03 Xe3p_HPM
[02:44:59] ================= [PASSED] check_media_ip ==================
[02:44:59] =================== check_platform_desc  ===================
[02:44:59] [PASSED] 0x9A60 (TIGERLAKE)
[02:44:59] [PASSED] 0x9A68 (TIGERLAKE)
[02:44:59] [PASSED] 0x9A70 (TIGERLAKE)
[02:44:59] [PASSED] 0x9A40 (TIGERLAKE)
[02:44:59] [PASSED] 0x9A49 (TIGERLAKE)
[02:44:59] [PASSED] 0x9A59 (TIGERLAKE)
[02:44:59] [PASSED] 0x9A78 (TIGERLAKE)
[02:44:59] [PASSED] 0x9AC0 (TIGERLAKE)
[02:44:59] [PASSED] 0x9AC9 (TIGERLAKE)
[02:44:59] [PASSED] 0x9AD9 (TIGERLAKE)
[02:44:59] [PASSED] 0x9AF8 (TIGERLAKE)
[02:44:59] [PASSED] 0x4C80 (ROCKETLAKE)
[02:44:59] [PASSED] 0x4C8A (ROCKETLAKE)
[02:44:59] [PASSED] 0x4C8B (ROCKETLAKE)
[02:44:59] [PASSED] 0x4C8C (ROCKETLAKE)
[02:44:59] [PASSED] 0x4C90 (ROCKETLAKE)
[02:44:59] [PASSED] 0x4C9A (ROCKETLAKE)
[02:44:59] [PASSED] 0x4680 (ALDERLAKE_S)
[02:44:59] [PASSED] 0x4682 (ALDERLAKE_S)
[02:44:59] [PASSED] 0x4688 (ALDERLAKE_S)
[02:44:59] [PASSED] 0x468A (ALDERLAKE_S)
[02:44:59] [PASSED] 0x468B (ALDERLAKE_S)
[02:44:59] [PASSED] 0x4690 (ALDERLAKE_S)
[02:44:59] [PASSED] 0x4692 (ALDERLAKE_S)
[02:44:59] [PASSED] 0x4693 (ALDERLAKE_S)
[02:44:59] [PASSED] 0x46A0 (ALDERLAKE_P)
[02:44:59] [PASSED] 0x46A1 (ALDERLAKE_P)
[02:44:59] [PASSED] 0x46A2 (ALDERLAKE_P)
[02:44:59] [PASSED] 0x46A3 (ALDERLAKE_P)
[02:44:59] [PASSED] 0x46A6 (ALDERLAKE_P)
[02:44:59] [PASSED] 0x46A8 (ALDERLAKE_P)
[02:44:59] [PASSED] 0x46AA (ALDERLAKE_P)
[02:44:59] [PASSED] 0x462A (ALDERLAKE_P)
[02:44:59] [PASSED] 0x4626 (ALDERLAKE_P)
[02:44:59] [PASSED] 0x4628 (ALDERLAKE_P)
[02:44:59] [PASSED] 0x46B0 (ALDERLAKE_P)
stty: 'standard input': Inappropriate ioctl for device
[02:44:59] [PASSED] 0x46B1 (ALDERLAKE_P)
[02:44:59] [PASSED] 0x46B2 (ALDERLAKE_P)
[02:44:59] [PASSED] 0x46B3 (ALDERLAKE_P)
[02:44:59] [PASSED] 0x46C0 (ALDERLAKE_P)
[02:44:59] [PASSED] 0x46C1 (ALDERLAKE_P)
[02:44:59] [PASSED] 0x46C2 (ALDERLAKE_P)
[02:44:59] [PASSED] 0x46C3 (ALDERLAKE_P)
[02:44:59] [PASSED] 0x46D0 (ALDERLAKE_N)
[02:44:59] [PASSED] 0x46D1 (ALDERLAKE_N)
[02:44:59] [PASSED] 0x46D2 (ALDERLAKE_N)
[02:44:59] [PASSED] 0x46D3 (ALDERLAKE_N)
[02:44:59] [PASSED] 0x46D4 (ALDERLAKE_N)
[02:44:59] [PASSED] 0xA721 (ALDERLAKE_P)
[02:44:59] [PASSED] 0xA7A1 (ALDERLAKE_P)
[02:44:59] [PASSED] 0xA7A9 (ALDERLAKE_P)
[02:44:59] [PASSED] 0xA7AC (ALDERLAKE_P)
[02:44:59] [PASSED] 0xA7AD (ALDERLAKE_P)
[02:44:59] [PASSED] 0xA720 (ALDERLAKE_P)
[02:44:59] [PASSED] 0xA7A0 (ALDERLAKE_P)
[02:44:59] [PASSED] 0xA7A8 (ALDERLAKE_P)
[02:44:59] [PASSED] 0xA7AA (ALDERLAKE_P)
[02:44:59] [PASSED] 0xA7AB (ALDERLAKE_P)
[02:44:59] [PASSED] 0xA780 (ALDERLAKE_S)
[02:44:59] [PASSED] 0xA781 (ALDERLAKE_S)
[02:44:59] [PASSED] 0xA782 (ALDERLAKE_S)
[02:44:59] [PASSED] 0xA783 (ALDERLAKE_S)
[02:44:59] [PASSED] 0xA788 (ALDERLAKE_S)
[02:44:59] [PASSED] 0xA789 (ALDERLAKE_S)
[02:44:59] [PASSED] 0xA78A (ALDERLAKE_S)
[02:44:59] [PASSED] 0xA78B (ALDERLAKE_S)
[02:44:59] [PASSED] 0x4905 (DG1)
[02:44:59] [PASSED] 0x4906 (DG1)
[02:44:59] [PASSED] 0x4907 (DG1)
[02:44:59] [PASSED] 0x4908 (DG1)
[02:44:59] [PASSED] 0x4909 (DG1)
[02:44:59] [PASSED] 0x56C0 (DG2)
[02:44:59] [PASSED] 0x56C2 (DG2)
[02:44:59] [PASSED] 0x56C1 (DG2)
[02:44:59] [PASSED] 0x7D51 (METEORLAKE)
[02:44:59] [PASSED] 0x7DD1 (METEORLAKE)
[02:44:59] [PASSED] 0x7D41 (METEORLAKE)
[02:44:59] [PASSED] 0x7D67 (METEORLAKE)
[02:44:59] [PASSED] 0xB640 (METEORLAKE)
[02:44:59] [PASSED] 0x56A0 (DG2)
[02:44:59] [PASSED] 0x56A1 (DG2)
[02:44:59] [PASSED] 0x56A2 (DG2)
[02:44:59] [PASSED] 0x56BE (DG2)
[02:44:59] [PASSED] 0x56BF (DG2)
[02:44:59] [PASSED] 0x5690 (DG2)
[02:44:59] [PASSED] 0x5691 (DG2)
[02:44:59] [PASSED] 0x5692 (DG2)
[02:44:59] [PASSED] 0x56A5 (DG2)
[02:44:59] [PASSED] 0x56A6 (DG2)
[02:44:59] [PASSED] 0x56B0 (DG2)
[02:44:59] [PASSED] 0x56B1 (DG2)
[02:44:59] [PASSED] 0x56BA (DG2)
[02:44:59] [PASSED] 0x56BB (DG2)
[02:44:59] [PASSED] 0x56BC (DG2)
[02:44:59] [PASSED] 0x56BD (DG2)
[02:44:59] [PASSED] 0x5693 (DG2)
[02:44:59] [PASSED] 0x5694 (DG2)
[02:44:59] [PASSED] 0x5695 (DG2)
[02:44:59] [PASSED] 0x56A3 (DG2)
[02:44:59] [PASSED] 0x56A4 (DG2)
[02:44:59] [PASSED] 0x56B2 (DG2)
[02:44:59] [PASSED] 0x56B3 (DG2)
[02:44:59] [PASSED] 0x5696 (DG2)
[02:44:59] [PASSED] 0x5697 (DG2)
[02:44:59] [PASSED] 0xB69 (PVC)
[02:44:59] [PASSED] 0xB6E (PVC)
[02:44:59] [PASSED] 0xBD4 (PVC)
[02:44:59] [PASSED] 0xBD5 (PVC)
[02:44:59] [PASSED] 0xBD6 (PVC)
[02:44:59] [PASSED] 0xBD7 (PVC)
[02:44:59] [PASSED] 0xBD8 (PVC)
[02:44:59] [PASSED] 0xBD9 (PVC)
[02:44:59] [PASSED] 0xBDA (PVC)
[02:44:59] [PASSED] 0xBDB (PVC)
[02:44:59] [PASSED] 0xBE0 (PVC)
[02:44:59] [PASSED] 0xBE1 (PVC)
[02:44:59] [PASSED] 0xBE5 (PVC)
[02:44:59] [PASSED] 0x7D40 (METEORLAKE)
[02:44:59] [PASSED] 0x7D45 (METEORLAKE)
[02:44:59] [PASSED] 0x7D55 (METEORLAKE)
[02:44:59] [PASSED] 0x7D60 (METEORLAKE)
[02:44:59] [PASSED] 0x7DD5 (METEORLAKE)
[02:44:59] [PASSED] 0x6420 (LUNARLAKE)
[02:44:59] [PASSED] 0x64A0 (LUNARLAKE)
[02:44:59] [PASSED] 0x64B0 (LUNARLAKE)
[02:44:59] [PASSED] 0xE202 (BATTLEMAGE)
[02:44:59] [PASSED] 0xE209 (BATTLEMAGE)
[02:44:59] [PASSED] 0xE20B (BATTLEMAGE)
[02:44:59] [PASSED] 0xE20C (BATTLEMAGE)
[02:44:59] [PASSED] 0xE20D (BATTLEMAGE)
[02:44:59] [PASSED] 0xE210 (BATTLEMAGE)
[02:44:59] [PASSED] 0xE211 (BATTLEMAGE)
[02:44:59] [PASSED] 0xE212 (BATTLEMAGE)
[02:44:59] [PASSED] 0xE216 (BATTLEMAGE)
[02:44:59] [PASSED] 0xE220 (BATTLEMAGE)
[02:44:59] [PASSED] 0xE221 (BATTLEMAGE)
[02:44:59] [PASSED] 0xE222 (BATTLEMAGE)
[02:44:59] [PASSED] 0xE223 (BATTLEMAGE)
[02:44:59] [PASSED] 0xB080 (PANTHERLAKE)
[02:44:59] [PASSED] 0xB081 (PANTHERLAKE)
[02:44:59] [PASSED] 0xB082 (PANTHERLAKE)
[02:44:59] [PASSED] 0xB083 (PANTHERLAKE)
[02:44:59] [PASSED] 0xB084 (PANTHERLAKE)
[02:44:59] [PASSED] 0xB085 (PANTHERLAKE)
[02:44:59] [PASSED] 0xB086 (PANTHERLAKE)
[02:44:59] [PASSED] 0xB087 (PANTHERLAKE)
[02:44:59] [PASSED] 0xB08F (PANTHERLAKE)
[02:44:59] [PASSED] 0xB090 (PANTHERLAKE)
[02:44:59] [PASSED] 0xB0A0 (PANTHERLAKE)
[02:44:59] [PASSED] 0xB0B0 (PANTHERLAKE)
[02:44:59] [PASSED] 0xD740 (NOVALAKE_S)
[02:44:59] [PASSED] 0xD741 (NOVALAKE_S)
[02:44:59] [PASSED] 0xD742 (NOVALAKE_S)
[02:44:59] [PASSED] 0xD743 (NOVALAKE_S)
[02:44:59] [PASSED] 0xD744 (NOVALAKE_S)
[02:44:59] [PASSED] 0xD745 (NOVALAKE_S)
[02:44:59] [PASSED] 0x674C (CRESCENTISLAND)
[02:44:59] [PASSED] 0xFD80 (PANTHERLAKE)
[02:44:59] [PASSED] 0xFD81 (PANTHERLAKE)
[02:44:59] =============== [PASSED] check_platform_desc ===============
[02:44:59] ===================== [PASSED] xe_pci ======================
[02:44:59] =================== xe_rtp (2 subtests) ====================
[02:44:59] =============== xe_rtp_process_to_sr_tests  ================
[02:44:59] [PASSED] coalesce-same-reg
[02:44:59] [PASSED] no-match-no-add
[02:44:59] [PASSED] match-or
[02:44:59] [PASSED] match-or-xfail
[02:44:59] [PASSED] no-match-no-add-multiple-rules
[02:44:59] [PASSED] two-regs-two-entries
[02:44:59] [PASSED] clr-one-set-other
[02:44:59] [PASSED] set-field
[02:44:59] [PASSED] conflict-duplicate
[02:44:59] [PASSED] conflict-not-disjoint
[02:44:59] [PASSED] conflict-reg-type
[02:44:59] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[02:44:59] ================== xe_rtp_process_tests  ===================
[02:44:59] [PASSED] active1
[02:44:59] [PASSED] active2
[02:44:59] [PASSED] active-inactive
[02:44:59] [PASSED] inactive-active
[02:44:59] [PASSED] inactive-1st_or_active-inactive
[02:44:59] [PASSED] inactive-2nd_or_active-inactive
[02:44:59] [PASSED] inactive-last_or_active-inactive
[02:44:59] [PASSED] inactive-no_or_active-inactive
[02:44:59] ============== [PASSED] xe_rtp_process_tests ===============
[02:44:59] ===================== [PASSED] xe_rtp ======================
[02:44:59] ==================== xe_wa (1 subtest) =====================
[02:44:59] ======================== xe_wa_gt  =========================
[02:44:59] [PASSED] TIGERLAKE B0
[02:44:59] [PASSED] DG1 A0
[02:44:59] [PASSED] DG1 B0
[02:44:59] [PASSED] ALDERLAKE_S A0
[02:44:59] [PASSED] ALDERLAKE_S B0
[02:44:59] [PASSED] ALDERLAKE_S C0
[02:44:59] [PASSED] ALDERLAKE_S D0
[02:44:59] [PASSED] ALDERLAKE_P A0
[02:44:59] [PASSED] ALDERLAKE_P B0
[02:44:59] [PASSED] ALDERLAKE_P C0
[02:44:59] [PASSED] ALDERLAKE_S RPLS D0
[02:44:59] [PASSED] ALDERLAKE_P RPLU E0
[02:44:59] [PASSED] DG2 G10 C0
[02:44:59] [PASSED] DG2 G11 B1
[02:44:59] [PASSED] DG2 G12 A1
[02:44:59] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[02:44:59] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[02:44:59] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[02:44:59] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[02:44:59] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[02:44:59] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[02:44:59] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[02:44:59] ==================== [PASSED] xe_wa_gt =====================
[02:44:59] ====================== [PASSED] xe_wa ======================
[02:44:59] ============================================================
[02:44:59] Testing complete. Ran 510 tests: passed: 492, skipped: 18
[02:44:59] Elapsed time: 35.007s total, 4.159s configuring, 30.331s building, 0.468s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[02:44:59] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:45:00] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[02:45:25] Starting KUnit Kernel (1/1)...
[02:45:25] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[02:45:25] ============ drm_test_pick_cmdline (2 subtests) ============
[02:45:25] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[02:45:25] =============== drm_test_pick_cmdline_named  ===============
[02:45:25] [PASSED] NTSC
[02:45:25] [PASSED] NTSC-J
[02:45:25] [PASSED] PAL
[02:45:25] [PASSED] PAL-M
[02:45:25] =========== [PASSED] drm_test_pick_cmdline_named ===========
[02:45:25] ============== [PASSED] drm_test_pick_cmdline ==============
[02:45:25] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[02:45:25] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[02:45:25] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[02:45:25] =========== drm_validate_clone_mode (2 subtests) ===========
[02:45:25] ============== drm_test_check_in_clone_mode  ===============
[02:45:25] [PASSED] in_clone_mode
[02:45:25] [PASSED] not_in_clone_mode
[02:45:25] ========== [PASSED] drm_test_check_in_clone_mode ===========
[02:45:25] =============== drm_test_check_valid_clones  ===============
[02:45:25] [PASSED] not_in_clone_mode
[02:45:25] [PASSED] valid_clone
[02:45:25] [PASSED] invalid_clone
[02:45:25] =========== [PASSED] drm_test_check_valid_clones ===========
[02:45:25] ============= [PASSED] drm_validate_clone_mode =============
[02:45:25] ============= drm_validate_modeset (1 subtest) =============
[02:45:25] [PASSED] drm_test_check_connector_changed_modeset
[02:45:25] ============== [PASSED] drm_validate_modeset ===============
[02:45:25] ====== drm_test_bridge_get_current_state (2 subtests) ======
[02:45:25] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[02:45:25] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[02:45:25] ======== [PASSED] drm_test_bridge_get_current_state ========
[02:45:25] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[02:45:25] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[02:45:25] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[02:45:25] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[02:45:25] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[02:45:25] ============== drm_bridge_alloc (2 subtests) ===============
[02:45:25] [PASSED] drm_test_drm_bridge_alloc_basic
[02:45:25] [PASSED] drm_test_drm_bridge_alloc_get_put
[02:45:25] ================ [PASSED] drm_bridge_alloc =================
[02:45:25] ================== drm_buddy (8 subtests) ==================
[02:45:25] [PASSED] drm_test_buddy_alloc_limit
[02:45:25] [PASSED] drm_test_buddy_alloc_optimistic
[02:45:25] [PASSED] drm_test_buddy_alloc_pessimistic
[02:45:25] [PASSED] drm_test_buddy_alloc_pathological
[02:45:25] [PASSED] drm_test_buddy_alloc_contiguous
[02:45:25] [PASSED] drm_test_buddy_alloc_clear
[02:45:25] [PASSED] drm_test_buddy_alloc_range_bias
[02:45:26] [PASSED] drm_test_buddy_fragmentation_performance
[02:45:26] ==================== [PASSED] drm_buddy ====================
[02:45:26] ============= drm_cmdline_parser (40 subtests) =============
[02:45:26] [PASSED] drm_test_cmdline_force_d_only
[02:45:26] [PASSED] drm_test_cmdline_force_D_only_dvi
[02:45:26] [PASSED] drm_test_cmdline_force_D_only_hdmi
[02:45:26] [PASSED] drm_test_cmdline_force_D_only_not_digital
[02:45:26] [PASSED] drm_test_cmdline_force_e_only
[02:45:26] [PASSED] drm_test_cmdline_res
[02:45:26] [PASSED] drm_test_cmdline_res_vesa
[02:45:26] [PASSED] drm_test_cmdline_res_vesa_rblank
[02:45:26] [PASSED] drm_test_cmdline_res_rblank
[02:45:26] [PASSED] drm_test_cmdline_res_bpp
[02:45:26] [PASSED] drm_test_cmdline_res_refresh
[02:45:26] [PASSED] drm_test_cmdline_res_bpp_refresh
[02:45:26] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[02:45:26] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[02:45:26] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[02:45:26] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[02:45:26] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[02:45:26] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[02:45:26] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[02:45:26] [PASSED] drm_test_cmdline_res_margins_force_on
[02:45:26] [PASSED] drm_test_cmdline_res_vesa_margins
[02:45:26] [PASSED] drm_test_cmdline_name
[02:45:26] [PASSED] drm_test_cmdline_name_bpp
[02:45:26] [PASSED] drm_test_cmdline_name_option
[02:45:26] [PASSED] drm_test_cmdline_name_bpp_option
[02:45:26] [PASSED] drm_test_cmdline_rotate_0
[02:45:26] [PASSED] drm_test_cmdline_rotate_90
[02:45:26] [PASSED] drm_test_cmdline_rotate_180
[02:45:26] [PASSED] drm_test_cmdline_rotate_270
[02:45:26] [PASSED] drm_test_cmdline_hmirror
[02:45:26] [PASSED] drm_test_cmdline_vmirror
[02:45:26] [PASSED] drm_test_cmdline_margin_options
[02:45:26] [PASSED] drm_test_cmdline_multiple_options
[02:45:26] [PASSED] drm_test_cmdline_bpp_extra_and_option
[02:45:26] [PASSED] drm_test_cmdline_extra_and_option
[02:45:26] [PASSED] drm_test_cmdline_freestanding_options
[02:45:26] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[02:45:26] [PASSED] drm_test_cmdline_panel_orientation
[02:45:26] ================ drm_test_cmdline_invalid  =================
[02:45:26] [PASSED] margin_only
[02:45:26] [PASSED] interlace_only
[02:45:26] [PASSED] res_missing_x
[02:45:26] [PASSED] res_missing_y
[02:45:26] [PASSED] res_bad_y
[02:45:26] [PASSED] res_missing_y_bpp
[02:45:26] [PASSED] res_bad_bpp
[02:45:26] [PASSED] res_bad_refresh
[02:45:26] [PASSED] res_bpp_refresh_force_on_off
[02:45:26] [PASSED] res_invalid_mode
[02:45:26] [PASSED] res_bpp_wrong_place_mode
[02:45:26] [PASSED] name_bpp_refresh
[02:45:26] [PASSED] name_refresh
[02:45:26] [PASSED] name_refresh_wrong_mode
[02:45:26] [PASSED] name_refresh_invalid_mode
[02:45:26] [PASSED] rotate_multiple
[02:45:26] [PASSED] rotate_invalid_val
[02:45:26] [PASSED] rotate_truncated
[02:45:26] [PASSED] invalid_option
[02:45:26] [PASSED] invalid_tv_option
[02:45:26] [PASSED] truncated_tv_option
[02:45:26] ============ [PASSED] drm_test_cmdline_invalid =============
[02:45:26] =============== drm_test_cmdline_tv_options  ===============
[02:45:26] [PASSED] NTSC
[02:45:26] [PASSED] NTSC_443
[02:45:26] [PASSED] NTSC_J
[02:45:26] [PASSED] PAL
[02:45:26] [PASSED] PAL_M
[02:45:26] [PASSED] PAL_N
[02:45:26] [PASSED] SECAM
[02:45:26] [PASSED] MONO_525
[02:45:26] [PASSED] MONO_625
[02:45:26] =========== [PASSED] drm_test_cmdline_tv_options ===========
[02:45:26] =============== [PASSED] drm_cmdline_parser ================
[02:45:26] ========== drmm_connector_hdmi_init (20 subtests) ==========
[02:45:26] [PASSED] drm_test_connector_hdmi_init_valid
[02:45:26] [PASSED] drm_test_connector_hdmi_init_bpc_8
[02:45:26] [PASSED] drm_test_connector_hdmi_init_bpc_10
[02:45:26] [PASSED] drm_test_connector_hdmi_init_bpc_12
[02:45:26] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[02:45:26] [PASSED] drm_test_connector_hdmi_init_bpc_null
[02:45:26] [PASSED] drm_test_connector_hdmi_init_formats_empty
[02:45:26] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[02:45:26] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[02:45:26] [PASSED] supported_formats=0x9 yuv420_allowed=1
[02:45:26] [PASSED] supported_formats=0x9 yuv420_allowed=0
[02:45:26] [PASSED] supported_formats=0x3 yuv420_allowed=1
[02:45:26] [PASSED] supported_formats=0x3 yuv420_allowed=0
[02:45:26] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[02:45:26] [PASSED] drm_test_connector_hdmi_init_null_ddc
[02:45:26] [PASSED] drm_test_connector_hdmi_init_null_product
[02:45:26] [PASSED] drm_test_connector_hdmi_init_null_vendor
[02:45:26] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[02:45:26] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[02:45:26] [PASSED] drm_test_connector_hdmi_init_product_valid
[02:45:26] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[02:45:26] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[02:45:26] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[02:45:26] ========= drm_test_connector_hdmi_init_type_valid  =========
[02:45:26] [PASSED] HDMI-A
[02:45:26] [PASSED] HDMI-B
[02:45:26] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[02:45:26] ======== drm_test_connector_hdmi_init_type_invalid  ========
[02:45:26] [PASSED] Unknown
[02:45:26] [PASSED] VGA
[02:45:26] [PASSED] DVI-I
[02:45:26] [PASSED] DVI-D
[02:45:26] [PASSED] DVI-A
[02:45:26] [PASSED] Composite
[02:45:26] [PASSED] SVIDEO
[02:45:26] [PASSED] LVDS
[02:45:26] [PASSED] Component
[02:45:26] [PASSED] DIN
[02:45:26] [PASSED] DP
[02:45:26] [PASSED] TV
[02:45:26] [PASSED] eDP
[02:45:26] [PASSED] Virtual
[02:45:26] [PASSED] DSI
[02:45:26] [PASSED] DPI
[02:45:26] [PASSED] Writeback
[02:45:26] [PASSED] SPI
[02:45:26] [PASSED] USB
[02:45:26] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[02:45:26] ============ [PASSED] drmm_connector_hdmi_init =============
[02:45:26] ============= drmm_connector_init (3 subtests) =============
[02:45:26] [PASSED] drm_test_drmm_connector_init
[02:45:26] [PASSED] drm_test_drmm_connector_init_null_ddc
[02:45:26] ========= drm_test_drmm_connector_init_type_valid  =========
[02:45:26] [PASSED] Unknown
[02:45:26] [PASSED] VGA
[02:45:26] [PASSED] DVI-I
[02:45:26] [PASSED] DVI-D
[02:45:26] [PASSED] DVI-A
[02:45:26] [PASSED] Composite
[02:45:26] [PASSED] SVIDEO
[02:45:26] [PASSED] LVDS
[02:45:26] [PASSED] Component
[02:45:26] [PASSED] DIN
[02:45:26] [PASSED] DP
[02:45:26] [PASSED] HDMI-A
[02:45:26] [PASSED] HDMI-B
[02:45:26] [PASSED] TV
[02:45:26] [PASSED] eDP
[02:45:26] [PASSED] Virtual
[02:45:26] [PASSED] DSI
[02:45:26] [PASSED] DPI
[02:45:26] [PASSED] Writeback
[02:45:26] [PASSED] SPI
[02:45:26] [PASSED] USB
[02:45:26] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[02:45:26] =============== [PASSED] drmm_connector_init ===============
[02:45:26] ========= drm_connector_dynamic_init (6 subtests) ==========
[02:45:26] [PASSED] drm_test_drm_connector_dynamic_init
[02:45:26] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[02:45:26] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[02:45:26] [PASSED] drm_test_drm_connector_dynamic_init_properties
[02:45:26] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[02:45:26] [PASSED] Unknown
[02:45:26] [PASSED] VGA
[02:45:26] [PASSED] DVI-I
[02:45:26] [PASSED] DVI-D
[02:45:26] [PASSED] DVI-A
[02:45:26] [PASSED] Composite
[02:45:26] [PASSED] SVIDEO
[02:45:26] [PASSED] LVDS
[02:45:26] [PASSED] Component
[02:45:26] [PASSED] DIN
[02:45:26] [PASSED] DP
[02:45:26] [PASSED] HDMI-A
[02:45:26] [PASSED] HDMI-B
[02:45:26] [PASSED] TV
[02:45:26] [PASSED] eDP
[02:45:26] [PASSED] Virtual
[02:45:26] [PASSED] DSI
[02:45:26] [PASSED] DPI
[02:45:26] [PASSED] Writeback
[02:45:26] [PASSED] SPI
[02:45:26] [PASSED] USB
[02:45:26] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[02:45:26] ======== drm_test_drm_connector_dynamic_init_name  =========
[02:45:26] [PASSED] Unknown
[02:45:26] [PASSED] VGA
[02:45:26] [PASSED] DVI-I
[02:45:26] [PASSED] DVI-D
[02:45:26] [PASSED] DVI-A
[02:45:26] [PASSED] Composite
[02:45:26] [PASSED] SVIDEO
[02:45:26] [PASSED] LVDS
[02:45:26] [PASSED] Component
[02:45:26] [PASSED] DIN
[02:45:26] [PASSED] DP
[02:45:26] [PASSED] HDMI-A
[02:45:26] [PASSED] HDMI-B
[02:45:26] [PASSED] TV
[02:45:26] [PASSED] eDP
[02:45:26] [PASSED] Virtual
[02:45:26] [PASSED] DSI
[02:45:26] [PASSED] DPI
[02:45:26] [PASSED] Writeback
[02:45:26] [PASSED] SPI
[02:45:26] [PASSED] USB
[02:45:26] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[02:45:26] =========== [PASSED] drm_connector_dynamic_init ============
[02:45:26] ==== drm_connector_dynamic_register_early (4 subtests) =====
[02:45:26] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[02:45:26] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[02:45:26] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[02:45:26] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[02:45:26] ====== [PASSED] drm_connector_dynamic_register_early =======
[02:45:26] ======= drm_connector_dynamic_register (7 subtests) ========
[02:45:26] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[02:45:26] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[02:45:26] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[02:45:26] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[02:45:26] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[02:45:26] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[02:45:26] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[02:45:26] ========= [PASSED] drm_connector_dynamic_register ==========
[02:45:26] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[02:45:26] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[02:45:26] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[02:45:26] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[02:45:26] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[02:45:26] ========== drm_test_get_tv_mode_from_name_valid  ===========
[02:45:26] [PASSED] NTSC
[02:45:26] [PASSED] NTSC-443
[02:45:26] [PASSED] NTSC-J
[02:45:26] [PASSED] PAL
[02:45:26] [PASSED] PAL-M
[02:45:26] [PASSED] PAL-N
[02:45:26] [PASSED] SECAM
[02:45:26] [PASSED] Mono
[02:45:26] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[02:45:26] [PASSED] drm_test_get_tv_mode_from_name_truncated
[02:45:26] ============ [PASSED] drm_get_tv_mode_from_name ============
[02:45:26] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[02:45:26] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[02:45:26] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[02:45:26] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[02:45:26] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[02:45:26] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[02:45:26] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[02:45:26] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[02:45:26] [PASSED] VIC 96
[02:45:26] [PASSED] VIC 97
[02:45:26] [PASSED] VIC 101
[02:45:26] [PASSED] VIC 102
[02:45:26] [PASSED] VIC 106
[02:45:26] [PASSED] VIC 107
[02:45:26] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[02:45:26] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[02:45:26] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[02:45:26] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[02:45:26] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[02:45:26] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[02:45:26] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[02:45:26] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[02:45:26] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[02:45:26] [PASSED] Automatic
[02:45:26] [PASSED] Full
[02:45:26] [PASSED] Limited 16:235
[02:45:26] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[02:45:26] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[02:45:26] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[02:45:26] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[02:45:26] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[02:45:26] [PASSED] RGB
[02:45:26] [PASSED] YUV 4:2:0
[02:45:26] [PASSED] YUV 4:2:2
[02:45:26] [PASSED] YUV 4:4:4
[02:45:26] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[02:45:26] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[02:45:26] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[02:45:26] ============= drm_damage_helper (21 subtests) ==============
[02:45:26] [PASSED] drm_test_damage_iter_no_damage
[02:45:26] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[02:45:26] [PASSED] drm_test_damage_iter_no_damage_src_moved
[02:45:26] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[02:45:26] [PASSED] drm_test_damage_iter_no_damage_not_visible
[02:45:26] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[02:45:26] [PASSED] drm_test_damage_iter_no_damage_no_fb
[02:45:26] [PASSED] drm_test_damage_iter_simple_damage
[02:45:26] [PASSED] drm_test_damage_iter_single_damage
[02:45:26] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[02:45:26] [PASSED] drm_test_damage_iter_single_damage_outside_src
[02:45:26] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[02:45:26] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[02:45:26] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[02:45:26] [PASSED] drm_test_damage_iter_single_damage_src_moved
[02:45:26] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[02:45:26] [PASSED] drm_test_damage_iter_damage
[02:45:26] [PASSED] drm_test_damage_iter_damage_one_intersect
[02:45:26] [PASSED] drm_test_damage_iter_damage_one_outside
[02:45:26] [PASSED] drm_test_damage_iter_damage_src_moved
[02:45:26] [PASSED] drm_test_damage_iter_damage_not_visible
[02:45:26] ================ [PASSED] drm_damage_helper ================
[02:45:26] ============== drm_dp_mst_helper (3 subtests) ==============
[02:45:26] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[02:45:26] [PASSED] Clock 154000 BPP 30 DSC disabled
[02:45:26] [PASSED] Clock 234000 BPP 30 DSC disabled
[02:45:26] [PASSED] Clock 297000 BPP 24 DSC disabled
[02:45:26] [PASSED] Clock 332880 BPP 24 DSC enabled
[02:45:26] [PASSED] Clock 324540 BPP 24 DSC enabled
[02:45:26] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[02:45:26] ============== drm_test_dp_mst_calc_pbn_div  ===============
[02:45:26] [PASSED] Link rate 2000000 lane count 4
[02:45:26] [PASSED] Link rate 2000000 lane count 2
[02:45:26] [PASSED] Link rate 2000000 lane count 1
[02:45:26] [PASSED] Link rate 1350000 lane count 4
[02:45:26] [PASSED] Link rate 1350000 lane count 2
[02:45:26] [PASSED] Link rate 1350000 lane count 1
[02:45:26] [PASSED] Link rate 1000000 lane count 4
[02:45:26] [PASSED] Link rate 1000000 lane count 2
[02:45:26] [PASSED] Link rate 1000000 lane count 1
[02:45:26] [PASSED] Link rate 810000 lane count 4
[02:45:26] [PASSED] Link rate 810000 lane count 2
[02:45:26] [PASSED] Link rate 810000 lane count 1
[02:45:26] [PASSED] Link rate 540000 lane count 4
[02:45:26] [PASSED] Link rate 540000 lane count 2
[02:45:26] [PASSED] Link rate 540000 lane count 1
[02:45:26] [PASSED] Link rate 270000 lane count 4
[02:45:26] [PASSED] Link rate 270000 lane count 2
[02:45:26] [PASSED] Link rate 270000 lane count 1
[02:45:26] [PASSED] Link rate 162000 lane count 4
[02:45:26] [PASSED] Link rate 162000 lane count 2
[02:45:26] [PASSED] Link rate 162000 lane count 1
[02:45:26] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[02:45:26] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[02:45:26] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[02:45:26] [PASSED] DP_POWER_UP_PHY with port number
[02:45:26] [PASSED] DP_POWER_DOWN_PHY with port number
[02:45:26] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[02:45:26] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[02:45:26] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[02:45:26] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[02:45:26] [PASSED] DP_QUERY_PAYLOAD with port number
[02:45:26] [PASSED] DP_QUERY_PAYLOAD with VCPI
[02:45:26] [PASSED] DP_REMOTE_DPCD_READ with port number
[02:45:26] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[02:45:26] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[02:45:26] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[02:45:26] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[02:45:26] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[02:45:26] [PASSED] DP_REMOTE_I2C_READ with port number
[02:45:26] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[02:45:26] [PASSED] DP_REMOTE_I2C_READ with transactions array
[02:45:26] [PASSED] DP_REMOTE_I2C_WRITE with port number
[02:45:26] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[02:45:26] [PASSED] DP_REMOTE_I2C_WRITE with data array
[02:45:26] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[02:45:26] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[02:45:26] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[02:45:26] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[02:45:26] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[02:45:26] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[02:45:26] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[02:45:26] ================ [PASSED] drm_dp_mst_helper ================
[02:45:26] ================== drm_exec (7 subtests) ===================
[02:45:26] [PASSED] sanitycheck
[02:45:26] [PASSED] test_lock
[02:45:26] [PASSED] test_lock_unlock
[02:45:26] [PASSED] test_duplicates
[02:45:26] [PASSED] test_prepare
[02:45:26] [PASSED] test_prepare_array
[02:45:26] [PASSED] test_multiple_loops
[02:45:26] ==================== [PASSED] drm_exec =====================
[02:45:26] =========== drm_format_helper_test (17 subtests) ===========
[02:45:26] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[02:45:26] [PASSED] single_pixel_source_buffer
[02:45:26] [PASSED] single_pixel_clip_rectangle
[02:45:26] [PASSED] well_known_colors
[02:45:26] [PASSED] destination_pitch
[02:45:26] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[02:45:26] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[02:45:26] [PASSED] single_pixel_source_buffer
[02:45:26] [PASSED] single_pixel_clip_rectangle
[02:45:26] [PASSED] well_known_colors
[02:45:26] [PASSED] destination_pitch
[02:45:26] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[02:45:26] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[02:45:26] [PASSED] single_pixel_source_buffer
[02:45:26] [PASSED] single_pixel_clip_rectangle
[02:45:26] [PASSED] well_known_colors
[02:45:26] [PASSED] destination_pitch
[02:45:26] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[02:45:26] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[02:45:26] [PASSED] single_pixel_source_buffer
[02:45:26] [PASSED] single_pixel_clip_rectangle
[02:45:26] [PASSED] well_known_colors
[02:45:26] [PASSED] destination_pitch
[02:45:26] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[02:45:26] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[02:45:26] [PASSED] single_pixel_source_buffer
[02:45:26] [PASSED] single_pixel_clip_rectangle
[02:45:26] [PASSED] well_known_colors
[02:45:26] [PASSED] destination_pitch
[02:45:26] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[02:45:26] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[02:45:26] [PASSED] single_pixel_source_buffer
[02:45:26] [PASSED] single_pixel_clip_rectangle
[02:45:26] [PASSED] well_known_colors
[02:45:26] [PASSED] destination_pitch
[02:45:26] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[02:45:26] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[02:45:26] [PASSED] single_pixel_source_buffer
[02:45:26] [PASSED] single_pixel_clip_rectangle
[02:45:26] [PASSED] well_known_colors
[02:45:26] [PASSED] destination_pitch
[02:45:26] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[02:45:26] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[02:45:26] [PASSED] single_pixel_source_buffer
[02:45:26] [PASSED] single_pixel_clip_rectangle
[02:45:26] [PASSED] well_known_colors
[02:45:26] [PASSED] destination_pitch
[02:45:26] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[02:45:26] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[02:45:26] [PASSED] single_pixel_source_buffer
[02:45:26] [PASSED] single_pixel_clip_rectangle
[02:45:26] [PASSED] well_known_colors
[02:45:26] [PASSED] destination_pitch
[02:45:26] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[02:45:26] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[02:45:26] [PASSED] single_pixel_source_buffer
[02:45:26] [PASSED] single_pixel_clip_rectangle
[02:45:26] [PASSED] well_known_colors
[02:45:26] [PASSED] destination_pitch
[02:45:26] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[02:45:26] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[02:45:26] [PASSED] single_pixel_source_buffer
[02:45:26] [PASSED] single_pixel_clip_rectangle
[02:45:26] [PASSED] well_known_colors
[02:45:26] [PASSED] destination_pitch
[02:45:26] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[02:45:26] ============== drm_test_fb_xrgb8888_to_mono  ===============
[02:45:26] [PASSED] single_pixel_source_buffer
[02:45:26] [PASSED] single_pixel_clip_rectangle
[02:45:26] [PASSED] well_known_colors
[02:45:26] [PASSED] destination_pitch
[02:45:26] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[02:45:26] ==================== drm_test_fb_swab  =====================
[02:45:26] [PASSED] single_pixel_source_buffer
[02:45:26] [PASSED] single_pixel_clip_rectangle
[02:45:26] [PASSED] well_known_colors
[02:45:26] [PASSED] destination_pitch
[02:45:26] ================ [PASSED] drm_test_fb_swab =================
[02:45:26] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[02:45:26] [PASSED] single_pixel_source_buffer
[02:45:26] [PASSED] single_pixel_clip_rectangle
[02:45:26] [PASSED] well_known_colors
[02:45:26] [PASSED] destination_pitch
[02:45:26] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[02:45:26] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[02:45:26] [PASSED] single_pixel_source_buffer
[02:45:26] [PASSED] single_pixel_clip_rectangle
[02:45:26] [PASSED] well_known_colors
[02:45:26] [PASSED] destination_pitch
[02:45:26] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[02:45:26] ================= drm_test_fb_clip_offset  =================
[02:45:26] [PASSED] pass through
[02:45:26] [PASSED] horizontal offset
[02:45:26] [PASSED] vertical offset
[02:45:26] [PASSED] horizontal and vertical offset
[02:45:26] [PASSED] horizontal offset (custom pitch)
[02:45:26] [PASSED] vertical offset (custom pitch)
[02:45:26] [PASSED] horizontal and vertical offset (custom pitch)
[02:45:26] ============= [PASSED] drm_test_fb_clip_offset =============
[02:45:26] =================== drm_test_fb_memcpy  ====================
[02:45:26] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[02:45:26] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[02:45:26] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[02:45:26] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[02:45:26] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[02:45:26] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[02:45:26] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[02:45:26] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[02:45:26] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[02:45:26] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[02:45:26] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[02:45:26] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[02:45:26] =============== [PASSED] drm_test_fb_memcpy ================
[02:45:26] ============= [PASSED] drm_format_helper_test ==============
[02:45:26] ================= drm_format (18 subtests) =================
[02:45:26] [PASSED] drm_test_format_block_width_invalid
[02:45:26] [PASSED] drm_test_format_block_width_one_plane
[02:45:26] [PASSED] drm_test_format_block_width_two_plane
[02:45:26] [PASSED] drm_test_format_block_width_three_plane
[02:45:26] [PASSED] drm_test_format_block_width_tiled
[02:45:26] [PASSED] drm_test_format_block_height_invalid
[02:45:26] [PASSED] drm_test_format_block_height_one_plane
[02:45:26] [PASSED] drm_test_format_block_height_two_plane
[02:45:26] [PASSED] drm_test_format_block_height_three_plane
[02:45:26] [PASSED] drm_test_format_block_height_tiled
[02:45:26] [PASSED] drm_test_format_min_pitch_invalid
[02:45:26] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[02:45:26] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[02:45:26] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[02:45:26] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[02:45:26] [PASSED] drm_test_format_min_pitch_two_plane
[02:45:26] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[02:45:26] [PASSED] drm_test_format_min_pitch_tiled
[02:45:26] =================== [PASSED] drm_format ====================
[02:45:26] ============== drm_framebuffer (10 subtests) ===============
[02:45:26] ========== drm_test_framebuffer_check_src_coords  ==========
[02:45:26] [PASSED] Success: source fits into fb
[02:45:26] [PASSED] Fail: overflowing fb with x-axis coordinate
[02:45:26] [PASSED] Fail: overflowing fb with y-axis coordinate
[02:45:26] [PASSED] Fail: overflowing fb with source width
[02:45:26] [PASSED] Fail: overflowing fb with source height
[02:45:26] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[02:45:26] [PASSED] drm_test_framebuffer_cleanup
[02:45:26] =============== drm_test_framebuffer_create  ===============
[02:45:26] [PASSED] ABGR8888 normal sizes
[02:45:26] [PASSED] ABGR8888 max sizes
[02:45:26] [PASSED] ABGR8888 pitch greater than min required
[02:45:26] [PASSED] ABGR8888 pitch less than min required
[02:45:26] [PASSED] ABGR8888 Invalid width
[02:45:26] [PASSED] ABGR8888 Invalid buffer handle
[02:45:26] [PASSED] No pixel format
[02:45:26] [PASSED] ABGR8888 Width 0
[02:45:26] [PASSED] ABGR8888 Height 0
[02:45:26] [PASSED] ABGR8888 Out of bound height * pitch combination
[02:45:26] [PASSED] ABGR8888 Large buffer offset
[02:45:26] [PASSED] ABGR8888 Buffer offset for inexistent plane
[02:45:26] [PASSED] ABGR8888 Invalid flag
[02:45:26] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[02:45:26] [PASSED] ABGR8888 Valid buffer modifier
[02:45:26] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[02:45:26] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[02:45:26] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[02:45:26] [PASSED] NV12 Normal sizes
[02:45:26] [PASSED] NV12 Max sizes
[02:45:26] [PASSED] NV12 Invalid pitch
[02:45:26] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[02:45:26] [PASSED] NV12 different  modifier per-plane
[02:45:26] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[02:45:26] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[02:45:26] [PASSED] NV12 Modifier for inexistent plane
[02:45:26] [PASSED] NV12 Handle for inexistent plane
[02:45:26] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[02:45:26] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[02:45:26] [PASSED] YVU420 Normal sizes
[02:45:26] [PASSED] YVU420 Max sizes
[02:45:26] [PASSED] YVU420 Invalid pitch
[02:45:26] [PASSED] YVU420 Different pitches
[02:45:26] [PASSED] YVU420 Different buffer offsets/pitches
[02:45:26] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[02:45:26] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[02:45:26] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[02:45:26] [PASSED] YVU420 Valid modifier
[02:45:26] [PASSED] YVU420 Different modifiers per plane
[02:45:26] [PASSED] YVU420 Modifier for inexistent plane
[02:45:26] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[02:45:26] [PASSED] X0L2 Normal sizes
[02:45:26] [PASSED] X0L2 Max sizes
[02:45:26] [PASSED] X0L2 Invalid pitch
[02:45:26] [PASSED] X0L2 Pitch greater than minimum required
[02:45:26] [PASSED] X0L2 Handle for inexistent plane
[02:45:26] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[02:45:26] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[02:45:26] [PASSED] X0L2 Valid modifier
[02:45:26] [PASSED] X0L2 Modifier for inexistent plane
[02:45:26] =========== [PASSED] drm_test_framebuffer_create ===========
[02:45:26] [PASSED] drm_test_framebuffer_free
[02:45:26] [PASSED] drm_test_framebuffer_init
[02:45:26] [PASSED] drm_test_framebuffer_init_bad_format
[02:45:26] [PASSED] drm_test_framebuffer_init_dev_mismatch
[02:45:26] [PASSED] drm_test_framebuffer_lookup
[02:45:26] [PASSED] drm_test_framebuffer_lookup_inexistent
[02:45:26] [PASSED] drm_test_framebuffer_modifiers_not_supported
[02:45:26] ================= [PASSED] drm_framebuffer =================
[02:45:26] ================ drm_gem_shmem (8 subtests) ================
[02:45:26] [PASSED] drm_gem_shmem_test_obj_create
[02:45:26] [PASSED] drm_gem_shmem_test_obj_create_private
[02:45:26] [PASSED] drm_gem_shmem_test_pin_pages
[02:45:26] [PASSED] drm_gem_shmem_test_vmap
[02:45:26] [PASSED] drm_gem_shmem_test_get_pages_sgt
[02:45:26] [PASSED] drm_gem_shmem_test_get_sg_table
[02:45:26] [PASSED] drm_gem_shmem_test_madvise
[02:45:26] [PASSED] drm_gem_shmem_test_purge
[02:45:26] ================== [PASSED] drm_gem_shmem ==================
[02:45:26] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[02:45:26] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[02:45:26] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[02:45:26] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[02:45:26] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[02:45:26] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[02:45:26] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[02:45:26] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[02:45:26] [PASSED] Automatic
[02:45:26] [PASSED] Full
[02:45:26] [PASSED] Limited 16:235
[02:45:26] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[02:45:26] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[02:45:26] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[02:45:26] [PASSED] drm_test_check_disable_connector
[02:45:26] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[02:45:26] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[02:45:26] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[02:45:26] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[02:45:26] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[02:45:26] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[02:45:26] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[02:45:26] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[02:45:26] [PASSED] drm_test_check_output_bpc_dvi
[02:45:26] [PASSED] drm_test_check_output_bpc_format_vic_1
[02:45:26] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[02:45:26] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[02:45:26] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[02:45:26] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[02:45:26] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[02:45:26] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[02:45:26] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[02:45:26] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[02:45:26] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[02:45:26] [PASSED] drm_test_check_broadcast_rgb_value
[02:45:26] [PASSED] drm_test_check_bpc_8_value
[02:45:26] [PASSED] drm_test_check_bpc_10_value
[02:45:26] [PASSED] drm_test_check_bpc_12_value
[02:45:26] [PASSED] drm_test_check_format_value
[02:45:26] [PASSED] drm_test_check_tmds_char_value
[02:45:26] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[02:45:26] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[02:45:26] [PASSED] drm_test_check_mode_valid
[02:45:26] [PASSED] drm_test_check_mode_valid_reject
[02:45:26] [PASSED] drm_test_check_mode_valid_reject_rate
[02:45:26] [PASSED] drm_test_check_mode_valid_reject_max_clock
[02:45:26] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[02:45:26] ================= drm_managed (2 subtests) =================
[02:45:26] [PASSED] drm_test_managed_release_action
[02:45:26] [PASSED] drm_test_managed_run_action
[02:45:26] =================== [PASSED] drm_managed ===================
[02:45:26] =================== drm_mm (6 subtests) ====================
[02:45:26] [PASSED] drm_test_mm_init
[02:45:26] [PASSED] drm_test_mm_debug
[02:45:26] [PASSED] drm_test_mm_align32
[02:45:26] [PASSED] drm_test_mm_align64
[02:45:26] [PASSED] drm_test_mm_lowest
[02:45:26] [PASSED] drm_test_mm_highest
[02:45:26] ===================== [PASSED] drm_mm ======================
[02:45:26] ============= drm_modes_analog_tv (5 subtests) =============
[02:45:26] [PASSED] drm_test_modes_analog_tv_mono_576i
[02:45:26] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[02:45:26] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[02:45:26] [PASSED] drm_test_modes_analog_tv_pal_576i
[02:45:26] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[02:45:26] =============== [PASSED] drm_modes_analog_tv ===============
[02:45:26] ============== drm_plane_helper (2 subtests) ===============
[02:45:26] =============== drm_test_check_plane_state  ================
[02:45:26] [PASSED] clipping_simple
[02:45:26] [PASSED] clipping_rotate_reflect
[02:45:26] [PASSED] positioning_simple
[02:45:26] [PASSED] upscaling
[02:45:26] [PASSED] downscaling
[02:45:26] [PASSED] rounding1
[02:45:26] [PASSED] rounding2
[02:45:26] [PASSED] rounding3
[02:45:26] [PASSED] rounding4
[02:45:26] =========== [PASSED] drm_test_check_plane_state ============
[02:45:26] =========== drm_test_check_invalid_plane_state  ============
[02:45:26] [PASSED] positioning_invalid
[02:45:26] [PASSED] upscaling_invalid
[02:45:26] [PASSED] downscaling_invalid
[02:45:26] ======= [PASSED] drm_test_check_invalid_plane_state ========
[02:45:26] ================ [PASSED] drm_plane_helper =================
[02:45:26] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[02:45:26] ====== drm_test_connector_helper_tv_get_modes_check  =======
[02:45:26] [PASSED] None
[02:45:26] [PASSED] PAL
[02:45:26] [PASSED] NTSC
[02:45:26] [PASSED] Both, NTSC Default
[02:45:26] [PASSED] Both, PAL Default
[02:45:26] [PASSED] Both, NTSC Default, with PAL on command-line
[02:45:26] [PASSED] Both, PAL Default, with NTSC on command-line
[02:45:26] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[02:45:26] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[02:45:26] ================== drm_rect (9 subtests) ===================
[02:45:26] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[02:45:26] [PASSED] drm_test_rect_clip_scaled_not_clipped
[02:45:26] [PASSED] drm_test_rect_clip_scaled_clipped
[02:45:26] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[02:45:26] ================= drm_test_rect_intersect  =================
[02:45:26] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[02:45:26] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[02:45:26] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[02:45:26] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[02:45:26] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[02:45:26] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[02:45:26] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[02:45:26] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[02:45:26] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[02:45:26] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[02:45:26] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[02:45:26] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[02:45:26] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[02:45:26] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[02:45:26] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[02:45:26] ============= [PASSED] drm_test_rect_intersect =============
[02:45:26] ================ drm_test_rect_calc_hscale  ================
[02:45:26] [PASSED] normal use
[02:45:26] [PASSED] out of max range
[02:45:26] [PASSED] out of min range
[02:45:26] [PASSED] zero dst
[02:45:26] [PASSED] negative src
[02:45:26] [PASSED] negative dst
[02:45:26] ============ [PASSED] drm_test_rect_calc_hscale ============
[02:45:26] ================ drm_test_rect_calc_vscale  ================
[02:45:26] [PASSED] normal use
stty: 'standard input': Inappropriate ioctl for device
[02:45:26] [PASSED] out of max range
[02:45:26] [PASSED] out of min range
[02:45:26] [PASSED] zero dst
[02:45:26] [PASSED] negative src
[02:45:26] [PASSED] negative dst
[02:45:26] ============ [PASSED] drm_test_rect_calc_vscale ============
[02:45:26] ================== drm_test_rect_rotate  ===================
[02:45:26] [PASSED] reflect-x
[02:45:26] [PASSED] reflect-y
[02:45:26] [PASSED] rotate-0
[02:45:26] [PASSED] rotate-90
[02:45:26] [PASSED] rotate-180
[02:45:26] [PASSED] rotate-270
[02:45:26] ============== [PASSED] drm_test_rect_rotate ===============
[02:45:26] ================ drm_test_rect_rotate_inv  =================
[02:45:26] [PASSED] reflect-x
[02:45:26] [PASSED] reflect-y
[02:45:26] [PASSED] rotate-0
[02:45:26] [PASSED] rotate-90
[02:45:26] [PASSED] rotate-180
[02:45:26] [PASSED] rotate-270
[02:45:26] ============ [PASSED] drm_test_rect_rotate_inv =============
[02:45:26] ==================== [PASSED] drm_rect =====================
[02:45:26] ============ drm_sysfb_modeset_test (1 subtest) ============
[02:45:26] ============ drm_test_sysfb_build_fourcc_list  =============
[02:45:26] [PASSED] no native formats
[02:45:26] [PASSED] XRGB8888 as native format
[02:45:26] [PASSED] remove duplicates
[02:45:26] [PASSED] convert alpha formats
[02:45:26] [PASSED] random formats
[02:45:26] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[02:45:26] ============= [PASSED] drm_sysfb_modeset_test ==============
[02:45:26] ================== drm_fixp (2 subtests) ===================
[02:45:26] [PASSED] drm_test_int2fixp
[02:45:26] [PASSED] drm_test_sm2fixp
[02:45:26] ==================== [PASSED] drm_fixp =====================
[02:45:26] ============================================================
[02:45:26] Testing complete. Ran 624 tests: passed: 624
[02:45:26] Elapsed time: 26.875s total, 1.703s configuring, 24.749s building, 0.392s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[02:45:26] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:45:27] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[02:45:37] Starting KUnit Kernel (1/1)...
[02:45:37] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[02:45:37] ================= ttm_device (5 subtests) ==================
[02:45:37] [PASSED] ttm_device_init_basic
[02:45:37] [PASSED] ttm_device_init_multiple
[02:45:37] [PASSED] ttm_device_fini_basic
[02:45:37] [PASSED] ttm_device_init_no_vma_man
[02:45:37] ================== ttm_device_init_pools  ==================
[02:45:37] [PASSED] No DMA allocations, no DMA32 required
[02:45:37] [PASSED] DMA allocations, DMA32 required
[02:45:37] [PASSED] No DMA allocations, DMA32 required
[02:45:37] [PASSED] DMA allocations, no DMA32 required
[02:45:37] ============== [PASSED] ttm_device_init_pools ==============
[02:45:37] =================== [PASSED] ttm_device ====================
[02:45:37] ================== ttm_pool (8 subtests) ===================
[02:45:37] ================== ttm_pool_alloc_basic  ===================
[02:45:37] [PASSED] One page
[02:45:37] [PASSED] More than one page
[02:45:37] [PASSED] Above the allocation limit
[02:45:37] [PASSED] One page, with coherent DMA mappings enabled
[02:45:37] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[02:45:37] ============== [PASSED] ttm_pool_alloc_basic ===============
[02:45:37] ============== ttm_pool_alloc_basic_dma_addr  ==============
[02:45:37] [PASSED] One page
[02:45:37] [PASSED] More than one page
[02:45:37] [PASSED] Above the allocation limit
[02:45:37] [PASSED] One page, with coherent DMA mappings enabled
[02:45:37] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[02:45:37] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[02:45:37] [PASSED] ttm_pool_alloc_order_caching_match
[02:45:37] [PASSED] ttm_pool_alloc_caching_mismatch
[02:45:37] [PASSED] ttm_pool_alloc_order_mismatch
[02:45:37] [PASSED] ttm_pool_free_dma_alloc
[02:45:37] [PASSED] ttm_pool_free_no_dma_alloc
[02:45:37] [PASSED] ttm_pool_fini_basic
[02:45:37] ==================== [PASSED] ttm_pool =====================
[02:45:37] ================ ttm_resource (8 subtests) =================
[02:45:37] ================= ttm_resource_init_basic  =================
[02:45:37] [PASSED] Init resource in TTM_PL_SYSTEM
[02:45:37] [PASSED] Init resource in TTM_PL_VRAM
[02:45:37] [PASSED] Init resource in a private placement
[02:45:37] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[02:45:37] ============= [PASSED] ttm_resource_init_basic =============
[02:45:37] [PASSED] ttm_resource_init_pinned
[02:45:37] [PASSED] ttm_resource_fini_basic
[02:45:37] [PASSED] ttm_resource_manager_init_basic
[02:45:37] [PASSED] ttm_resource_manager_usage_basic
[02:45:37] [PASSED] ttm_resource_manager_set_used_basic
[02:45:37] [PASSED] ttm_sys_man_alloc_basic
[02:45:37] [PASSED] ttm_sys_man_free_basic
[02:45:37] ================== [PASSED] ttm_resource ===================
[02:45:37] =================== ttm_tt (15 subtests) ===================
[02:45:37] ==================== ttm_tt_init_basic  ====================
[02:45:37] [PASSED] Page-aligned size
[02:45:37] [PASSED] Extra pages requested
[02:45:37] ================ [PASSED] ttm_tt_init_basic ================
[02:45:37] [PASSED] ttm_tt_init_misaligned
[02:45:37] [PASSED] ttm_tt_fini_basic
[02:45:37] [PASSED] ttm_tt_fini_sg
[02:45:37] [PASSED] ttm_tt_fini_shmem
[02:45:37] [PASSED] ttm_tt_create_basic
[02:45:37] [PASSED] ttm_tt_create_invalid_bo_type
[02:45:37] [PASSED] ttm_tt_create_ttm_exists
[02:45:37] [PASSED] ttm_tt_create_failed
[02:45:37] [PASSED] ttm_tt_destroy_basic
[02:45:37] [PASSED] ttm_tt_populate_null_ttm
[02:45:37] [PASSED] ttm_tt_populate_populated_ttm
[02:45:37] [PASSED] ttm_tt_unpopulate_basic
[02:45:37] [PASSED] ttm_tt_unpopulate_empty_ttm
[02:45:37] [PASSED] ttm_tt_swapin_basic
[02:45:37] ===================== [PASSED] ttm_tt ======================
[02:45:37] =================== ttm_bo (14 subtests) ===================
[02:45:37] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[02:45:37] [PASSED] Cannot be interrupted and sleeps
[02:45:37] [PASSED] Cannot be interrupted, locks straight away
[02:45:37] [PASSED] Can be interrupted, sleeps
[02:45:37] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[02:45:37] [PASSED] ttm_bo_reserve_locked_no_sleep
[02:45:37] [PASSED] ttm_bo_reserve_no_wait_ticket
[02:45:37] [PASSED] ttm_bo_reserve_double_resv
[02:45:37] [PASSED] ttm_bo_reserve_interrupted
[02:45:37] [PASSED] ttm_bo_reserve_deadlock
[02:45:37] [PASSED] ttm_bo_unreserve_basic
[02:45:37] [PASSED] ttm_bo_unreserve_pinned
[02:45:37] [PASSED] ttm_bo_unreserve_bulk
[02:45:37] [PASSED] ttm_bo_fini_basic
[02:45:37] [PASSED] ttm_bo_fini_shared_resv
[02:45:37] [PASSED] ttm_bo_pin_basic
[02:45:37] [PASSED] ttm_bo_pin_unpin_resource
[02:45:37] [PASSED] ttm_bo_multiple_pin_one_unpin
[02:45:37] ===================== [PASSED] ttm_bo ======================
[02:45:37] ============== ttm_bo_validate (21 subtests) ===============
[02:45:37] ============== ttm_bo_init_reserved_sys_man  ===============
[02:45:37] [PASSED] Buffer object for userspace
[02:45:37] [PASSED] Kernel buffer object
[02:45:37] [PASSED] Shared buffer object
[02:45:37] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[02:45:37] ============== ttm_bo_init_reserved_mock_man  ==============
[02:45:37] [PASSED] Buffer object for userspace
[02:45:37] [PASSED] Kernel buffer object
[02:45:37] [PASSED] Shared buffer object
[02:45:37] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[02:45:37] [PASSED] ttm_bo_init_reserved_resv
[02:45:37] ================== ttm_bo_validate_basic  ==================
[02:45:37] [PASSED] Buffer object for userspace
[02:45:37] [PASSED] Kernel buffer object
[02:45:37] [PASSED] Shared buffer object
[02:45:37] ============== [PASSED] ttm_bo_validate_basic ==============
[02:45:37] [PASSED] ttm_bo_validate_invalid_placement
[02:45:37] ============= ttm_bo_validate_same_placement  ==============
[02:45:37] [PASSED] System manager
[02:45:37] [PASSED] VRAM manager
[02:45:37] ========= [PASSED] ttm_bo_validate_same_placement ==========
[02:45:37] [PASSED] ttm_bo_validate_failed_alloc
[02:45:37] [PASSED] ttm_bo_validate_pinned
[02:45:37] [PASSED] ttm_bo_validate_busy_placement
[02:45:37] ================ ttm_bo_validate_multihop  =================
[02:45:37] [PASSED] Buffer object for userspace
[02:45:37] [PASSED] Kernel buffer object
[02:45:37] [PASSED] Shared buffer object
[02:45:37] ============ [PASSED] ttm_bo_validate_multihop =============
[02:45:37] ========== ttm_bo_validate_no_placement_signaled  ==========
[02:45:37] [PASSED] Buffer object in system domain, no page vector
[02:45:37] [PASSED] Buffer object in system domain with an existing page vector
[02:45:37] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[02:45:37] ======== ttm_bo_validate_no_placement_not_signaled  ========
[02:45:37] [PASSED] Buffer object for userspace
[02:45:37] [PASSED] Kernel buffer object
[02:45:37] [PASSED] Shared buffer object
[02:45:37] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[02:45:37] [PASSED] ttm_bo_validate_move_fence_signaled
[02:45:37] ========= ttm_bo_validate_move_fence_not_signaled  =========
[02:45:37] [PASSED] Waits for GPU
[02:45:37] [PASSED] Tries to lock straight away
[02:45:37] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[02:45:37] [PASSED] ttm_bo_validate_happy_evict
[02:45:37] [PASSED] ttm_bo_validate_all_pinned_evict
[02:45:37] [PASSED] ttm_bo_validate_allowed_only_evict
[02:45:37] [PASSED] ttm_bo_validate_deleted_evict
[02:45:37] [PASSED] ttm_bo_validate_busy_domain_evict
[02:45:37] [PASSED] ttm_bo_validate_evict_gutting
[02:45:37] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[02:45:37] ================= [PASSED] ttm_bo_validate =================
[02:45:37] ============================================================
[02:45:37] Testing complete. Ran 101 tests: passed: 101
[02:45:37] Elapsed time: 11.214s total, 1.686s configuring, 9.312s building, 0.177s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


