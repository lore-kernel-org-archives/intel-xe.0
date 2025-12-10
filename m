Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFDAD3C928
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 17:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34A910E74D;
	Wed, 10 Dec 2025 17:15:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1406510E74D;
 Wed, 10 Dec 2025 17:15:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/hw=5Fengine=5Fgroup=3A_?=
 =?utf-8?q?Add_stats_for_mode_switching_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Dec 2025 17:15:14 -0000
Message-ID: <176538691407.74583.1015617944256574727@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251210165000.60789-1-francois.dugast@intel.com>
In-Reply-To: <20251210165000.60789-1-francois.dugast@intel.com>
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

Series: drm/xe/hw_engine_group: Add stats for mode switching (rev2)
URL   : https://patchwork.freedesktop.org/series/158708/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[17:13:56] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:14:00] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:14:31] Starting KUnit Kernel (1/1)...
[17:14:31] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:14:31] ================== guc_buf (11 subtests) ===================
[17:14:31] [PASSED] test_smallest
[17:14:31] [PASSED] test_largest
[17:14:31] [PASSED] test_granular
[17:14:31] [PASSED] test_unique
[17:14:31] [PASSED] test_overlap
[17:14:31] [PASSED] test_reusable
[17:14:31] [PASSED] test_too_big
[17:14:31] [PASSED] test_flush
[17:14:31] [PASSED] test_lookup
[17:14:31] [PASSED] test_data
[17:14:31] [PASSED] test_class
[17:14:31] ===================== [PASSED] guc_buf =====================
[17:14:31] =================== guc_dbm (7 subtests) ===================
[17:14:31] [PASSED] test_empty
[17:14:31] [PASSED] test_default
[17:14:31] ======================== test_size  ========================
[17:14:31] [PASSED] 4
[17:14:31] [PASSED] 8
[17:14:31] [PASSED] 32
[17:14:31] [PASSED] 256
[17:14:31] ==================== [PASSED] test_size ====================
[17:14:31] ======================= test_reuse  ========================
[17:14:31] [PASSED] 4
[17:14:31] [PASSED] 8
[17:14:31] [PASSED] 32
[17:14:31] [PASSED] 256
[17:14:31] =================== [PASSED] test_reuse ====================
[17:14:31] =================== test_range_overlap  ====================
[17:14:31] [PASSED] 4
[17:14:31] [PASSED] 8
[17:14:31] [PASSED] 32
[17:14:31] [PASSED] 256
[17:14:31] =============== [PASSED] test_range_overlap ================
[17:14:31] =================== test_range_compact  ====================
[17:14:31] [PASSED] 4
[17:14:31] [PASSED] 8
[17:14:31] [PASSED] 32
[17:14:31] [PASSED] 256
[17:14:31] =============== [PASSED] test_range_compact ================
[17:14:31] ==================== test_range_spare  =====================
[17:14:31] [PASSED] 4
[17:14:31] [PASSED] 8
[17:14:31] [PASSED] 32
[17:14:31] [PASSED] 256
[17:14:31] ================ [PASSED] test_range_spare =================
[17:14:31] ===================== [PASSED] guc_dbm =====================
[17:14:31] =================== guc_idm (6 subtests) ===================
[17:14:31] [PASSED] bad_init
[17:14:31] [PASSED] no_init
[17:14:31] [PASSED] init_fini
[17:14:31] [PASSED] check_used
[17:14:31] [PASSED] check_quota
[17:14:31] [PASSED] check_all
[17:14:31] ===================== [PASSED] guc_idm =====================
[17:14:31] ================== no_relay (3 subtests) ===================
[17:14:31] [PASSED] xe_drops_guc2pf_if_not_ready
[17:14:31] [PASSED] xe_drops_guc2vf_if_not_ready
[17:14:31] [PASSED] xe_rejects_send_if_not_ready
[17:14:31] ==================== [PASSED] no_relay =====================
[17:14:31] ================== pf_relay (14 subtests) ==================
[17:14:31] [PASSED] pf_rejects_guc2pf_too_short
[17:14:31] [PASSED] pf_rejects_guc2pf_too_long
[17:14:31] [PASSED] pf_rejects_guc2pf_no_payload
[17:14:31] [PASSED] pf_fails_no_payload
[17:14:31] [PASSED] pf_fails_bad_origin
[17:14:31] [PASSED] pf_fails_bad_type
[17:14:31] [PASSED] pf_txn_reports_error
[17:14:31] [PASSED] pf_txn_sends_pf2guc
[17:14:31] [PASSED] pf_sends_pf2guc
[17:14:31] [SKIPPED] pf_loopback_nop
[17:14:31] [SKIPPED] pf_loopback_echo
[17:14:31] [SKIPPED] pf_loopback_fail
[17:14:31] [SKIPPED] pf_loopback_busy
[17:14:31] [SKIPPED] pf_loopback_retry
[17:14:31] ==================== [PASSED] pf_relay =====================
[17:14:31] ================== vf_relay (3 subtests) ===================
[17:14:31] [PASSED] vf_rejects_guc2vf_too_short
[17:14:31] [PASSED] vf_rejects_guc2vf_too_long
[17:14:31] [PASSED] vf_rejects_guc2vf_no_payload
[17:14:31] ==================== [PASSED] vf_relay =====================
[17:14:31] ================ pf_gt_config (6 subtests) =================
[17:14:31] [PASSED] fair_contexts_1vf
[17:14:31] [PASSED] fair_doorbells_1vf
[17:14:31] [PASSED] fair_ggtt_1vf
[17:14:31] ====================== fair_contexts  ======================
[17:14:31] [PASSED] 1 VF
[17:14:31] [PASSED] 2 VFs
[17:14:31] [PASSED] 3 VFs
[17:14:31] [PASSED] 4 VFs
[17:14:31] [PASSED] 5 VFs
[17:14:31] [PASSED] 6 VFs
[17:14:31] [PASSED] 7 VFs
[17:14:31] [PASSED] 8 VFs
[17:14:31] [PASSED] 9 VFs
[17:14:31] [PASSED] 10 VFs
[17:14:31] [PASSED] 11 VFs
[17:14:31] [PASSED] 12 VFs
[17:14:31] [PASSED] 13 VFs
[17:14:31] [PASSED] 14 VFs
[17:14:31] [PASSED] 15 VFs
[17:14:31] [PASSED] 16 VFs
[17:14:31] [PASSED] 17 VFs
[17:14:31] [PASSED] 18 VFs
[17:14:31] [PASSED] 19 VFs
[17:14:31] [PASSED] 20 VFs
[17:14:31] [PASSED] 21 VFs
[17:14:31] [PASSED] 22 VFs
[17:14:31] [PASSED] 23 VFs
[17:14:31] [PASSED] 24 VFs
[17:14:31] [PASSED] 25 VFs
[17:14:31] [PASSED] 26 VFs
[17:14:31] [PASSED] 27 VFs
[17:14:31] [PASSED] 28 VFs
[17:14:31] [PASSED] 29 VFs
[17:14:31] [PASSED] 30 VFs
[17:14:31] [PASSED] 31 VFs
[17:14:31] [PASSED] 32 VFs
[17:14:31] [PASSED] 33 VFs
[17:14:31] [PASSED] 34 VFs
[17:14:31] [PASSED] 35 VFs
[17:14:31] [PASSED] 36 VFs
[17:14:31] [PASSED] 37 VFs
[17:14:31] [PASSED] 38 VFs
[17:14:31] [PASSED] 39 VFs
[17:14:31] [PASSED] 40 VFs
[17:14:31] [PASSED] 41 VFs
[17:14:31] [PASSED] 42 VFs
[17:14:31] [PASSED] 43 VFs
[17:14:31] [PASSED] 44 VFs
[17:14:31] [PASSED] 45 VFs
[17:14:31] [PASSED] 46 VFs
[17:14:31] [PASSED] 47 VFs
[17:14:31] [PASSED] 48 VFs
[17:14:31] [PASSED] 49 VFs
[17:14:31] [PASSED] 50 VFs
[17:14:31] [PASSED] 51 VFs
[17:14:31] [PASSED] 52 VFs
[17:14:31] [PASSED] 53 VFs
[17:14:31] [PASSED] 54 VFs
[17:14:31] [PASSED] 55 VFs
[17:14:31] [PASSED] 56 VFs
[17:14:31] [PASSED] 57 VFs
[17:14:31] [PASSED] 58 VFs
[17:14:31] [PASSED] 59 VFs
[17:14:31] [PASSED] 60 VFs
[17:14:31] [PASSED] 61 VFs
[17:14:31] [PASSED] 62 VFs
[17:14:31] [PASSED] 63 VFs
[17:14:31] ================== [PASSED] fair_contexts ==================
[17:14:31] ===================== fair_doorbells  ======================
[17:14:31] [PASSED] 1 VF
[17:14:31] [PASSED] 2 VFs
[17:14:31] [PASSED] 3 VFs
[17:14:31] [PASSED] 4 VFs
[17:14:31] [PASSED] 5 VFs
[17:14:31] [PASSED] 6 VFs
[17:14:31] [PASSED] 7 VFs
[17:14:31] [PASSED] 8 VFs
[17:14:31] [PASSED] 9 VFs
[17:14:31] [PASSED] 10 VFs
[17:14:31] [PASSED] 11 VFs
[17:14:31] [PASSED] 12 VFs
[17:14:31] [PASSED] 13 VFs
[17:14:31] [PASSED] 14 VFs
[17:14:31] [PASSED] 15 VFs
[17:14:31] [PASSED] 16 VFs
[17:14:31] [PASSED] 17 VFs
[17:14:31] [PASSED] 18 VFs
[17:14:31] [PASSED] 19 VFs
[17:14:31] [PASSED] 20 VFs
[17:14:31] [PASSED] 21 VFs
[17:14:31] [PASSED] 22 VFs
[17:14:31] [PASSED] 23 VFs
[17:14:31] [PASSED] 24 VFs
[17:14:31] [PASSED] 25 VFs
[17:14:31] [PASSED] 26 VFs
[17:14:31] [PASSED] 27 VFs
[17:14:31] [PASSED] 28 VFs
[17:14:31] [PASSED] 29 VFs
[17:14:31] [PASSED] 30 VFs
[17:14:31] [PASSED] 31 VFs
[17:14:31] [PASSED] 32 VFs
[17:14:31] [PASSED] 33 VFs
[17:14:31] [PASSED] 34 VFs
[17:14:31] [PASSED] 35 VFs
[17:14:31] [PASSED] 36 VFs
[17:14:31] [PASSED] 37 VFs
[17:14:31] [PASSED] 38 VFs
[17:14:31] [PASSED] 39 VFs
[17:14:31] [PASSED] 40 VFs
[17:14:31] [PASSED] 41 VFs
[17:14:31] [PASSED] 42 VFs
[17:14:31] [PASSED] 43 VFs
[17:14:31] [PASSED] 44 VFs
[17:14:31] [PASSED] 45 VFs
[17:14:31] [PASSED] 46 VFs
[17:14:31] [PASSED] 47 VFs
[17:14:31] [PASSED] 48 VFs
[17:14:31] [PASSED] 49 VFs
[17:14:31] [PASSED] 50 VFs
[17:14:31] [PASSED] 51 VFs
[17:14:31] [PASSED] 52 VFs
[17:14:31] [PASSED] 53 VFs
[17:14:31] [PASSED] 54 VFs
[17:14:31] [PASSED] 55 VFs
[17:14:31] [PASSED] 56 VFs
[17:14:31] [PASSED] 57 VFs
[17:14:31] [PASSED] 58 VFs
[17:14:31] [PASSED] 59 VFs
[17:14:31] [PASSED] 60 VFs
[17:14:31] [PASSED] 61 VFs
[17:14:31] [PASSED] 62 VFs
[17:14:31] [PASSED] 63 VFs
[17:14:31] ================= [PASSED] fair_doorbells ==================
[17:14:31] ======================== fair_ggtt  ========================
[17:14:31] [PASSED] 1 VF
[17:14:31] [PASSED] 2 VFs
[17:14:31] [PASSED] 3 VFs
[17:14:31] [PASSED] 4 VFs
[17:14:31] [PASSED] 5 VFs
[17:14:31] [PASSED] 6 VFs
[17:14:31] [PASSED] 7 VFs
[17:14:31] [PASSED] 8 VFs
[17:14:31] [PASSED] 9 VFs
[17:14:31] [PASSED] 10 VFs
[17:14:31] [PASSED] 11 VFs
[17:14:31] [PASSED] 12 VFs
[17:14:31] [PASSED] 13 VFs
[17:14:31] [PASSED] 14 VFs
[17:14:31] [PASSED] 15 VFs
[17:14:31] [PASSED] 16 VFs
[17:14:31] [PASSED] 17 VFs
[17:14:31] [PASSED] 18 VFs
[17:14:31] [PASSED] 19 VFs
[17:14:31] [PASSED] 20 VFs
[17:14:31] [PASSED] 21 VFs
[17:14:31] [PASSED] 22 VFs
[17:14:31] [PASSED] 23 VFs
[17:14:31] [PASSED] 24 VFs
[17:14:31] [PASSED] 25 VFs
[17:14:31] [PASSED] 26 VFs
[17:14:31] [PASSED] 27 VFs
[17:14:31] [PASSED] 28 VFs
[17:14:31] [PASSED] 29 VFs
[17:14:31] [PASSED] 30 VFs
[17:14:31] [PASSED] 31 VFs
[17:14:31] [PASSED] 32 VFs
[17:14:31] [PASSED] 33 VFs
[17:14:31] [PASSED] 34 VFs
[17:14:31] [PASSED] 35 VFs
[17:14:31] [PASSED] 36 VFs
[17:14:31] [PASSED] 37 VFs
[17:14:31] [PASSED] 38 VFs
[17:14:31] [PASSED] 39 VFs
[17:14:31] [PASSED] 40 VFs
[17:14:31] [PASSED] 41 VFs
[17:14:31] [PASSED] 42 VFs
[17:14:31] [PASSED] 43 VFs
[17:14:31] [PASSED] 44 VFs
[17:14:31] [PASSED] 45 VFs
[17:14:31] [PASSED] 46 VFs
[17:14:31] [PASSED] 47 VFs
[17:14:31] [PASSED] 48 VFs
[17:14:31] [PASSED] 49 VFs
[17:14:31] [PASSED] 50 VFs
[17:14:31] [PASSED] 51 VFs
[17:14:31] [PASSED] 52 VFs
[17:14:31] [PASSED] 53 VFs
[17:14:31] [PASSED] 54 VFs
[17:14:31] [PASSED] 55 VFs
[17:14:31] [PASSED] 56 VFs
[17:14:31] [PASSED] 57 VFs
[17:14:31] [PASSED] 58 VFs
[17:14:31] [PASSED] 59 VFs
[17:14:31] [PASSED] 60 VFs
[17:14:31] [PASSED] 61 VFs
[17:14:31] [PASSED] 62 VFs
[17:14:31] [PASSED] 63 VFs
[17:14:31] ==================== [PASSED] fair_ggtt ====================
[17:14:31] ================== [PASSED] pf_gt_config ===================
[17:14:31] ===================== lmtt (1 subtest) =====================
[17:14:31] ======================== test_ops  =========================
[17:14:31] [PASSED] 2-level
[17:14:31] [PASSED] multi-level
[17:14:31] ==================== [PASSED] test_ops =====================
[17:14:31] ====================== [PASSED] lmtt =======================
[17:14:31] ================= pf_service (11 subtests) =================
[17:14:31] [PASSED] pf_negotiate_any
[17:14:31] [PASSED] pf_negotiate_base_match
[17:14:31] [PASSED] pf_negotiate_base_newer
[17:14:31] [PASSED] pf_negotiate_base_next
[17:14:31] [SKIPPED] pf_negotiate_base_older
[17:14:31] [PASSED] pf_negotiate_base_prev
[17:14:31] [PASSED] pf_negotiate_latest_match
[17:14:31] [PASSED] pf_negotiate_latest_newer
[17:14:31] [PASSED] pf_negotiate_latest_next
[17:14:31] [SKIPPED] pf_negotiate_latest_older
[17:14:31] [SKIPPED] pf_negotiate_latest_prev
[17:14:31] =================== [PASSED] pf_service ====================
[17:14:31] ================= xe_guc_g2g (2 subtests) ==================
[17:14:31] ============== xe_live_guc_g2g_kunit_default  ==============
[17:14:31] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[17:14:31] ============== xe_live_guc_g2g_kunit_allmem  ===============
[17:14:31] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[17:14:31] =================== [SKIPPED] xe_guc_g2g ===================
[17:14:31] =================== xe_mocs (2 subtests) ===================
[17:14:31] ================ xe_live_mocs_kernel_kunit  ================
[17:14:31] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[17:14:31] ================ xe_live_mocs_reset_kunit  =================
[17:14:31] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[17:14:31] ==================== [SKIPPED] xe_mocs =====================
[17:14:31] ================= xe_migrate (2 subtests) ==================
[17:14:31] ================= xe_migrate_sanity_kunit  =================
[17:14:31] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[17:14:31] ================== xe_validate_ccs_kunit  ==================
[17:14:31] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[17:14:31] =================== [SKIPPED] xe_migrate ===================
[17:14:31] ================== xe_dma_buf (1 subtest) ==================
[17:14:31] ==================== xe_dma_buf_kunit  =====================
[17:14:31] ================ [SKIPPED] xe_dma_buf_kunit ================
[17:14:31] =================== [SKIPPED] xe_dma_buf ===================
[17:14:31] ================= xe_bo_shrink (1 subtest) =================
[17:14:31] =================== xe_bo_shrink_kunit  ====================
[17:14:31] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[17:14:31] ================== [SKIPPED] xe_bo_shrink ==================
[17:14:31] ==================== xe_bo (2 subtests) ====================
[17:14:31] ================== xe_ccs_migrate_kunit  ===================
[17:14:31] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[17:14:31] ==================== xe_bo_evict_kunit  ====================
[17:14:31] =============== [SKIPPED] xe_bo_evict_kunit ================
[17:14:31] ===================== [SKIPPED] xe_bo ======================
[17:14:31] ==================== args (11 subtests) ====================
[17:14:31] [PASSED] count_args_test
[17:14:31] [PASSED] call_args_example
[17:14:31] [PASSED] call_args_test
[17:14:31] [PASSED] drop_first_arg_example
[17:14:31] [PASSED] drop_first_arg_test
[17:14:31] [PASSED] first_arg_example
[17:14:31] [PASSED] first_arg_test
[17:14:31] [PASSED] last_arg_example
[17:14:31] [PASSED] last_arg_test
[17:14:31] [PASSED] pick_arg_example
[17:14:31] [PASSED] sep_comma_example
[17:14:31] ====================== [PASSED] args =======================
[17:14:31] =================== xe_pci (3 subtests) ====================
[17:14:31] ==================== check_graphics_ip  ====================
[17:14:31] [PASSED] 12.00 Xe_LP
[17:14:31] [PASSED] 12.10 Xe_LP+
[17:14:31] [PASSED] 12.55 Xe_HPG
[17:14:31] [PASSED] 12.60 Xe_HPC
[17:14:31] [PASSED] 12.70 Xe_LPG
[17:14:31] [PASSED] 12.71 Xe_LPG
[17:14:31] [PASSED] 12.74 Xe_LPG+
[17:14:31] [PASSED] 20.01 Xe2_HPG
[17:14:31] [PASSED] 20.02 Xe2_HPG
[17:14:31] [PASSED] 20.04 Xe2_LPG
[17:14:31] [PASSED] 30.00 Xe3_LPG
[17:14:31] [PASSED] 30.01 Xe3_LPG
[17:14:31] [PASSED] 30.03 Xe3_LPG
[17:14:31] [PASSED] 30.04 Xe3_LPG
[17:14:31] [PASSED] 30.05 Xe3_LPG
[17:14:31] [PASSED] 35.11 Xe3p_XPC
[17:14:31] ================ [PASSED] check_graphics_ip ================
[17:14:31] ===================== check_media_ip  ======================
[17:14:31] [PASSED] 12.00 Xe_M
[17:14:31] [PASSED] 12.55 Xe_HPM
[17:14:31] [PASSED] 13.00 Xe_LPM+
[17:14:31] [PASSED] 13.01 Xe2_HPM
[17:14:31] [PASSED] 20.00 Xe2_LPM
[17:14:31] [PASSED] 30.00 Xe3_LPM
[17:14:31] [PASSED] 30.02 Xe3_LPM
[17:14:31] [PASSED] 35.00 Xe3p_LPM
[17:14:31] [PASSED] 35.03 Xe3p_HPM
[17:14:31] ================= [PASSED] check_media_ip ==================
[17:14:31] =================== check_platform_desc  ===================
[17:14:31] [PASSED] 0x9A60 (TIGERLAKE)
[17:14:31] [PASSED] 0x9A68 (TIGERLAKE)
[17:14:31] [PASSED] 0x9A70 (TIGERLAKE)
[17:14:31] [PASSED] 0x9A40 (TIGERLAKE)
[17:14:31] [PASSED] 0x9A49 (TIGERLAKE)
[17:14:31] [PASSED] 0x9A59 (TIGERLAKE)
[17:14:31] [PASSED] 0x9A78 (TIGERLAKE)
[17:14:31] [PASSED] 0x9AC0 (TIGERLAKE)
[17:14:31] [PASSED] 0x9AC9 (TIGERLAKE)
[17:14:31] [PASSED] 0x9AD9 (TIGERLAKE)
[17:14:31] [PASSED] 0x9AF8 (TIGERLAKE)
[17:14:31] [PASSED] 0x4C80 (ROCKETLAKE)
[17:14:31] [PASSED] 0x4C8A (ROCKETLAKE)
[17:14:31] [PASSED] 0x4C8B (ROCKETLAKE)
[17:14:31] [PASSED] 0x4C8C (ROCKETLAKE)
[17:14:31] [PASSED] 0x4C90 (ROCKETLAKE)
[17:14:31] [PASSED] 0x4C9A (ROCKETLAKE)
[17:14:31] [PASSED] 0x4680 (ALDERLAKE_S)
[17:14:31] [PASSED] 0x4682 (ALDERLAKE_S)
[17:14:31] [PASSED] 0x4688 (ALDERLAKE_S)
[17:14:31] [PASSED] 0x468A (ALDERLAKE_S)
[17:14:31] [PASSED] 0x468B (ALDERLAKE_S)
[17:14:31] [PASSED] 0x4690 (ALDERLAKE_S)
[17:14:31] [PASSED] 0x4692 (ALDERLAKE_S)
[17:14:31] [PASSED] 0x4693 (ALDERLAKE_S)
[17:14:31] [PASSED] 0x46A0 (ALDERLAKE_P)
[17:14:31] [PASSED] 0x46A1 (ALDERLAKE_P)
[17:14:31] [PASSED] 0x46A2 (ALDERLAKE_P)
[17:14:31] [PASSED] 0x46A3 (ALDERLAKE_P)
[17:14:31] [PASSED] 0x46A6 (ALDERLAKE_P)
[17:14:31] [PASSED] 0x46A8 (ALDERLAKE_P)
[17:14:31] [PASSED] 0x46AA (ALDERLAKE_P)
[17:14:31] [PASSED] 0x462A (ALDERLAKE_P)
[17:14:31] [PASSED] 0x4626 (ALDERLAKE_P)
[17:14:31] [PASSED] 0x4628 (ALDERLAKE_P)
[17:14:31] [PASSED] 0x46B0 (ALDERLAKE_P)
stty: 'standard input': Inappropriate ioctl for device
[17:14:31] [PASSED] 0x46B1 (ALDERLAKE_P)
[17:14:31] [PASSED] 0x46B2 (ALDERLAKE_P)
[17:14:31] [PASSED] 0x46B3 (ALDERLAKE_P)
[17:14:31] [PASSED] 0x46C0 (ALDERLAKE_P)
[17:14:31] [PASSED] 0x46C1 (ALDERLAKE_P)
[17:14:31] [PASSED] 0x46C2 (ALDERLAKE_P)
[17:14:31] [PASSED] 0x46C3 (ALDERLAKE_P)
[17:14:31] [PASSED] 0x46D0 (ALDERLAKE_N)
[17:14:31] [PASSED] 0x46D1 (ALDERLAKE_N)
[17:14:31] [PASSED] 0x46D2 (ALDERLAKE_N)
[17:14:31] [PASSED] 0x46D3 (ALDERLAKE_N)
[17:14:31] [PASSED] 0x46D4 (ALDERLAKE_N)
[17:14:31] [PASSED] 0xA721 (ALDERLAKE_P)
[17:14:31] [PASSED] 0xA7A1 (ALDERLAKE_P)
[17:14:31] [PASSED] 0xA7A9 (ALDERLAKE_P)
[17:14:31] [PASSED] 0xA7AC (ALDERLAKE_P)
[17:14:31] [PASSED] 0xA7AD (ALDERLAKE_P)
[17:14:31] [PASSED] 0xA720 (ALDERLAKE_P)
[17:14:31] [PASSED] 0xA7A0 (ALDERLAKE_P)
[17:14:31] [PASSED] 0xA7A8 (ALDERLAKE_P)
[17:14:31] [PASSED] 0xA7AA (ALDERLAKE_P)
[17:14:31] [PASSED] 0xA7AB (ALDERLAKE_P)
[17:14:31] [PASSED] 0xA780 (ALDERLAKE_S)
[17:14:31] [PASSED] 0xA781 (ALDERLAKE_S)
[17:14:31] [PASSED] 0xA782 (ALDERLAKE_S)
[17:14:31] [PASSED] 0xA783 (ALDERLAKE_S)
[17:14:31] [PASSED] 0xA788 (ALDERLAKE_S)
[17:14:31] [PASSED] 0xA789 (ALDERLAKE_S)
[17:14:31] [PASSED] 0xA78A (ALDERLAKE_S)
[17:14:31] [PASSED] 0xA78B (ALDERLAKE_S)
[17:14:31] [PASSED] 0x4905 (DG1)
[17:14:31] [PASSED] 0x4906 (DG1)
[17:14:31] [PASSED] 0x4907 (DG1)
[17:14:31] [PASSED] 0x4908 (DG1)
[17:14:31] [PASSED] 0x4909 (DG1)
[17:14:31] [PASSED] 0x56C0 (DG2)
[17:14:31] [PASSED] 0x56C2 (DG2)
[17:14:31] [PASSED] 0x56C1 (DG2)
[17:14:31] [PASSED] 0x7D51 (METEORLAKE)
[17:14:31] [PASSED] 0x7DD1 (METEORLAKE)
[17:14:31] [PASSED] 0x7D41 (METEORLAKE)
[17:14:31] [PASSED] 0x7D67 (METEORLAKE)
[17:14:31] [PASSED] 0xB640 (METEORLAKE)
[17:14:31] [PASSED] 0x56A0 (DG2)
[17:14:31] [PASSED] 0x56A1 (DG2)
[17:14:31] [PASSED] 0x56A2 (DG2)
[17:14:31] [PASSED] 0x56BE (DG2)
[17:14:31] [PASSED] 0x56BF (DG2)
[17:14:31] [PASSED] 0x5690 (DG2)
[17:14:31] [PASSED] 0x5691 (DG2)
[17:14:31] [PASSED] 0x5692 (DG2)
[17:14:31] [PASSED] 0x56A5 (DG2)
[17:14:31] [PASSED] 0x56A6 (DG2)
[17:14:31] [PASSED] 0x56B0 (DG2)
[17:14:31] [PASSED] 0x56B1 (DG2)
[17:14:31] [PASSED] 0x56BA (DG2)
[17:14:31] [PASSED] 0x56BB (DG2)
[17:14:31] [PASSED] 0x56BC (DG2)
[17:14:31] [PASSED] 0x56BD (DG2)
[17:14:31] [PASSED] 0x5693 (DG2)
[17:14:31] [PASSED] 0x5694 (DG2)
[17:14:31] [PASSED] 0x5695 (DG2)
[17:14:31] [PASSED] 0x56A3 (DG2)
[17:14:31] [PASSED] 0x56A4 (DG2)
[17:14:31] [PASSED] 0x56B2 (DG2)
[17:14:31] [PASSED] 0x56B3 (DG2)
[17:14:31] [PASSED] 0x5696 (DG2)
[17:14:31] [PASSED] 0x5697 (DG2)
[17:14:31] [PASSED] 0xB69 (PVC)
[17:14:31] [PASSED] 0xB6E (PVC)
[17:14:31] [PASSED] 0xBD4 (PVC)
[17:14:31] [PASSED] 0xBD5 (PVC)
[17:14:31] [PASSED] 0xBD6 (PVC)
[17:14:31] [PASSED] 0xBD7 (PVC)
[17:14:31] [PASSED] 0xBD8 (PVC)
[17:14:31] [PASSED] 0xBD9 (PVC)
[17:14:31] [PASSED] 0xBDA (PVC)
[17:14:31] [PASSED] 0xBDB (PVC)
[17:14:31] [PASSED] 0xBE0 (PVC)
[17:14:31] [PASSED] 0xBE1 (PVC)
[17:14:31] [PASSED] 0xBE5 (PVC)
[17:14:31] [PASSED] 0x7D40 (METEORLAKE)
[17:14:31] [PASSED] 0x7D45 (METEORLAKE)
[17:14:31] [PASSED] 0x7D55 (METEORLAKE)
[17:14:31] [PASSED] 0x7D60 (METEORLAKE)
[17:14:31] [PASSED] 0x7DD5 (METEORLAKE)
[17:14:31] [PASSED] 0x6420 (LUNARLAKE)
[17:14:31] [PASSED] 0x64A0 (LUNARLAKE)
[17:14:31] [PASSED] 0x64B0 (LUNARLAKE)
[17:14:31] [PASSED] 0xE202 (BATTLEMAGE)
[17:14:31] [PASSED] 0xE209 (BATTLEMAGE)
[17:14:31] [PASSED] 0xE20B (BATTLEMAGE)
[17:14:31] [PASSED] 0xE20C (BATTLEMAGE)
[17:14:31] [PASSED] 0xE20D (BATTLEMAGE)
[17:14:31] [PASSED] 0xE210 (BATTLEMAGE)
[17:14:31] [PASSED] 0xE211 (BATTLEMAGE)
[17:14:31] [PASSED] 0xE212 (BATTLEMAGE)
[17:14:31] [PASSED] 0xE216 (BATTLEMAGE)
[17:14:31] [PASSED] 0xE220 (BATTLEMAGE)
[17:14:31] [PASSED] 0xE221 (BATTLEMAGE)
[17:14:31] [PASSED] 0xE222 (BATTLEMAGE)
[17:14:31] [PASSED] 0xE223 (BATTLEMAGE)
[17:14:31] [PASSED] 0xB080 (PANTHERLAKE)
[17:14:31] [PASSED] 0xB081 (PANTHERLAKE)
[17:14:31] [PASSED] 0xB082 (PANTHERLAKE)
[17:14:31] [PASSED] 0xB083 (PANTHERLAKE)
[17:14:31] [PASSED] 0xB084 (PANTHERLAKE)
[17:14:31] [PASSED] 0xB085 (PANTHERLAKE)
[17:14:31] [PASSED] 0xB086 (PANTHERLAKE)
[17:14:31] [PASSED] 0xB087 (PANTHERLAKE)
[17:14:31] [PASSED] 0xB08F (PANTHERLAKE)
[17:14:31] [PASSED] 0xB090 (PANTHERLAKE)
[17:14:31] [PASSED] 0xB0A0 (PANTHERLAKE)
[17:14:31] [PASSED] 0xB0B0 (PANTHERLAKE)
[17:14:31] [PASSED] 0xD740 (NOVALAKE_S)
[17:14:31] [PASSED] 0xD741 (NOVALAKE_S)
[17:14:31] [PASSED] 0xD742 (NOVALAKE_S)
[17:14:31] [PASSED] 0xD743 (NOVALAKE_S)
[17:14:31] [PASSED] 0xD744 (NOVALAKE_S)
[17:14:31] [PASSED] 0xD745 (NOVALAKE_S)
[17:14:31] [PASSED] 0x674C (CRESCENTISLAND)
[17:14:31] [PASSED] 0xFD80 (PANTHERLAKE)
[17:14:31] [PASSED] 0xFD81 (PANTHERLAKE)
[17:14:31] =============== [PASSED] check_platform_desc ===============
[17:14:31] ===================== [PASSED] xe_pci ======================
[17:14:31] =================== xe_rtp (2 subtests) ====================
[17:14:31] =============== xe_rtp_process_to_sr_tests  ================
[17:14:31] [PASSED] coalesce-same-reg
[17:14:31] [PASSED] no-match-no-add
[17:14:31] [PASSED] match-or
[17:14:31] [PASSED] match-or-xfail
[17:14:31] [PASSED] no-match-no-add-multiple-rules
[17:14:31] [PASSED] two-regs-two-entries
[17:14:31] [PASSED] clr-one-set-other
[17:14:31] [PASSED] set-field
[17:14:31] [PASSED] conflict-duplicate
[17:14:31] [PASSED] conflict-not-disjoint
[17:14:31] [PASSED] conflict-reg-type
[17:14:31] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[17:14:31] ================== xe_rtp_process_tests  ===================
[17:14:31] [PASSED] active1
[17:14:31] [PASSED] active2
[17:14:31] [PASSED] active-inactive
[17:14:31] [PASSED] inactive-active
[17:14:31] [PASSED] inactive-1st_or_active-inactive
[17:14:31] [PASSED] inactive-2nd_or_active-inactive
[17:14:31] [PASSED] inactive-last_or_active-inactive
[17:14:31] [PASSED] inactive-no_or_active-inactive
[17:14:31] ============== [PASSED] xe_rtp_process_tests ===============
[17:14:31] ===================== [PASSED] xe_rtp ======================
[17:14:31] ==================== xe_wa (1 subtest) =====================
[17:14:31] ======================== xe_wa_gt  =========================
[17:14:31] [PASSED] TIGERLAKE B0
[17:14:31] [PASSED] DG1 A0
[17:14:31] [PASSED] DG1 B0
[17:14:31] [PASSED] ALDERLAKE_S A0
[17:14:31] [PASSED] ALDERLAKE_S B0
[17:14:31] [PASSED] ALDERLAKE_S C0
[17:14:31] [PASSED] ALDERLAKE_S D0
[17:14:31] [PASSED] ALDERLAKE_P A0
[17:14:31] [PASSED] ALDERLAKE_P B0
[17:14:31] [PASSED] ALDERLAKE_P C0
[17:14:31] [PASSED] ALDERLAKE_S RPLS D0
[17:14:31] [PASSED] ALDERLAKE_P RPLU E0
[17:14:31] [PASSED] DG2 G10 C0
[17:14:31] [PASSED] DG2 G11 B1
[17:14:31] [PASSED] DG2 G12 A1
[17:14:31] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[17:14:31] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[17:14:31] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[17:14:31] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[17:14:31] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[17:14:31] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[17:14:31] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[17:14:31] ==================== [PASSED] xe_wa_gt =====================
[17:14:31] ====================== [PASSED] xe_wa ======================
[17:14:31] ============================================================
[17:14:31] Testing complete. Ran 510 tests: passed: 492, skipped: 18
[17:14:31] Elapsed time: 35.271s total, 4.228s configuring, 30.525s building, 0.467s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[17:14:32] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:14:33] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:14:58] Starting KUnit Kernel (1/1)...
[17:14:58] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:14:58] ============ drm_test_pick_cmdline (2 subtests) ============
[17:14:58] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[17:14:58] =============== drm_test_pick_cmdline_named  ===============
[17:14:58] [PASSED] NTSC
[17:14:58] [PASSED] NTSC-J
[17:14:58] [PASSED] PAL
[17:14:58] [PASSED] PAL-M
[17:14:58] =========== [PASSED] drm_test_pick_cmdline_named ===========
[17:14:58] ============== [PASSED] drm_test_pick_cmdline ==============
[17:14:58] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[17:14:58] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[17:14:58] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[17:14:58] =========== drm_validate_clone_mode (2 subtests) ===========
[17:14:58] ============== drm_test_check_in_clone_mode  ===============
[17:14:58] [PASSED] in_clone_mode
[17:14:58] [PASSED] not_in_clone_mode
[17:14:58] ========== [PASSED] drm_test_check_in_clone_mode ===========
[17:14:58] =============== drm_test_check_valid_clones  ===============
[17:14:58] [PASSED] not_in_clone_mode
[17:14:58] [PASSED] valid_clone
[17:14:58] [PASSED] invalid_clone
[17:14:58] =========== [PASSED] drm_test_check_valid_clones ===========
[17:14:58] ============= [PASSED] drm_validate_clone_mode =============
[17:14:58] ============= drm_validate_modeset (1 subtest) =============
[17:14:58] [PASSED] drm_test_check_connector_changed_modeset
[17:14:58] ============== [PASSED] drm_validate_modeset ===============
[17:14:58] ====== drm_test_bridge_get_current_state (2 subtests) ======
[17:14:58] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[17:14:58] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[17:14:58] ======== [PASSED] drm_test_bridge_get_current_state ========
[17:14:58] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[17:14:58] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[17:14:58] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[17:14:58] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[17:14:58] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[17:14:58] ============== drm_bridge_alloc (2 subtests) ===============
[17:14:58] [PASSED] drm_test_drm_bridge_alloc_basic
[17:14:58] [PASSED] drm_test_drm_bridge_alloc_get_put
[17:14:58] ================ [PASSED] drm_bridge_alloc =================
[17:14:58] ================== drm_buddy (8 subtests) ==================
[17:14:58] [PASSED] drm_test_buddy_alloc_limit
[17:14:58] [PASSED] drm_test_buddy_alloc_optimistic
[17:14:58] [PASSED] drm_test_buddy_alloc_pessimistic
[17:14:58] [PASSED] drm_test_buddy_alloc_pathological
[17:14:58] [PASSED] drm_test_buddy_alloc_contiguous
[17:14:58] [PASSED] drm_test_buddy_alloc_clear
[17:14:58] [PASSED] drm_test_buddy_alloc_range_bias
[17:14:58] [PASSED] drm_test_buddy_fragmentation_performance
[17:14:58] ==================== [PASSED] drm_buddy ====================
[17:14:58] ============= drm_cmdline_parser (40 subtests) =============
[17:14:58] [PASSED] drm_test_cmdline_force_d_only
[17:14:58] [PASSED] drm_test_cmdline_force_D_only_dvi
[17:14:58] [PASSED] drm_test_cmdline_force_D_only_hdmi
[17:14:58] [PASSED] drm_test_cmdline_force_D_only_not_digital
[17:14:58] [PASSED] drm_test_cmdline_force_e_only
[17:14:58] [PASSED] drm_test_cmdline_res
[17:14:58] [PASSED] drm_test_cmdline_res_vesa
[17:14:58] [PASSED] drm_test_cmdline_res_vesa_rblank
[17:14:58] [PASSED] drm_test_cmdline_res_rblank
[17:14:58] [PASSED] drm_test_cmdline_res_bpp
[17:14:58] [PASSED] drm_test_cmdline_res_refresh
[17:14:58] [PASSED] drm_test_cmdline_res_bpp_refresh
[17:14:58] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[17:14:58] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[17:14:58] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[17:14:58] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[17:14:58] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[17:14:58] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[17:14:58] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[17:14:58] [PASSED] drm_test_cmdline_res_margins_force_on
[17:14:58] [PASSED] drm_test_cmdline_res_vesa_margins
[17:14:58] [PASSED] drm_test_cmdline_name
[17:14:58] [PASSED] drm_test_cmdline_name_bpp
[17:14:58] [PASSED] drm_test_cmdline_name_option
[17:14:58] [PASSED] drm_test_cmdline_name_bpp_option
[17:14:58] [PASSED] drm_test_cmdline_rotate_0
[17:14:58] [PASSED] drm_test_cmdline_rotate_90
[17:14:58] [PASSED] drm_test_cmdline_rotate_180
[17:14:58] [PASSED] drm_test_cmdline_rotate_270
[17:14:58] [PASSED] drm_test_cmdline_hmirror
[17:14:58] [PASSED] drm_test_cmdline_vmirror
[17:14:58] [PASSED] drm_test_cmdline_margin_options
[17:14:58] [PASSED] drm_test_cmdline_multiple_options
[17:14:58] [PASSED] drm_test_cmdline_bpp_extra_and_option
[17:14:58] [PASSED] drm_test_cmdline_extra_and_option
[17:14:58] [PASSED] drm_test_cmdline_freestanding_options
[17:14:58] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[17:14:58] [PASSED] drm_test_cmdline_panel_orientation
[17:14:58] ================ drm_test_cmdline_invalid  =================
[17:14:58] [PASSED] margin_only
[17:14:58] [PASSED] interlace_only
[17:14:58] [PASSED] res_missing_x
[17:14:58] [PASSED] res_missing_y
[17:14:58] [PASSED] res_bad_y
[17:14:58] [PASSED] res_missing_y_bpp
[17:14:58] [PASSED] res_bad_bpp
[17:14:58] [PASSED] res_bad_refresh
[17:14:58] [PASSED] res_bpp_refresh_force_on_off
[17:14:58] [PASSED] res_invalid_mode
[17:14:58] [PASSED] res_bpp_wrong_place_mode
[17:14:58] [PASSED] name_bpp_refresh
[17:14:58] [PASSED] name_refresh
[17:14:58] [PASSED] name_refresh_wrong_mode
[17:14:58] [PASSED] name_refresh_invalid_mode
[17:14:58] [PASSED] rotate_multiple
[17:14:58] [PASSED] rotate_invalid_val
[17:14:58] [PASSED] rotate_truncated
[17:14:58] [PASSED] invalid_option
[17:14:58] [PASSED] invalid_tv_option
[17:14:58] [PASSED] truncated_tv_option
[17:14:58] ============ [PASSED] drm_test_cmdline_invalid =============
[17:14:58] =============== drm_test_cmdline_tv_options  ===============
[17:14:58] [PASSED] NTSC
[17:14:58] [PASSED] NTSC_443
[17:14:58] [PASSED] NTSC_J
[17:14:58] [PASSED] PAL
[17:14:58] [PASSED] PAL_M
[17:14:58] [PASSED] PAL_N
[17:14:58] [PASSED] SECAM
[17:14:58] [PASSED] MONO_525
[17:14:58] [PASSED] MONO_625
[17:14:58] =========== [PASSED] drm_test_cmdline_tv_options ===========
[17:14:58] =============== [PASSED] drm_cmdline_parser ================
[17:14:58] ========== drmm_connector_hdmi_init (20 subtests) ==========
[17:14:58] [PASSED] drm_test_connector_hdmi_init_valid
[17:14:58] [PASSED] drm_test_connector_hdmi_init_bpc_8
[17:14:58] [PASSED] drm_test_connector_hdmi_init_bpc_10
[17:14:58] [PASSED] drm_test_connector_hdmi_init_bpc_12
[17:14:58] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[17:14:58] [PASSED] drm_test_connector_hdmi_init_bpc_null
[17:14:58] [PASSED] drm_test_connector_hdmi_init_formats_empty
[17:14:58] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[17:14:58] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[17:14:58] [PASSED] supported_formats=0x9 yuv420_allowed=1
[17:14:58] [PASSED] supported_formats=0x9 yuv420_allowed=0
[17:14:58] [PASSED] supported_formats=0x3 yuv420_allowed=1
[17:14:58] [PASSED] supported_formats=0x3 yuv420_allowed=0
[17:14:58] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[17:14:58] [PASSED] drm_test_connector_hdmi_init_null_ddc
[17:14:58] [PASSED] drm_test_connector_hdmi_init_null_product
[17:14:58] [PASSED] drm_test_connector_hdmi_init_null_vendor
[17:14:58] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[17:14:58] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[17:14:58] [PASSED] drm_test_connector_hdmi_init_product_valid
[17:14:58] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[17:14:58] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[17:14:58] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[17:14:58] ========= drm_test_connector_hdmi_init_type_valid  =========
[17:14:58] [PASSED] HDMI-A
[17:14:58] [PASSED] HDMI-B
[17:14:58] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[17:14:58] ======== drm_test_connector_hdmi_init_type_invalid  ========
[17:14:58] [PASSED] Unknown
[17:14:58] [PASSED] VGA
[17:14:58] [PASSED] DVI-I
[17:14:58] [PASSED] DVI-D
[17:14:58] [PASSED] DVI-A
[17:14:58] [PASSED] Composite
[17:14:58] [PASSED] SVIDEO
[17:14:58] [PASSED] LVDS
[17:14:58] [PASSED] Component
[17:14:58] [PASSED] DIN
[17:14:58] [PASSED] DP
[17:14:58] [PASSED] TV
[17:14:58] [PASSED] eDP
[17:14:58] [PASSED] Virtual
[17:14:58] [PASSED] DSI
[17:14:58] [PASSED] DPI
[17:14:58] [PASSED] Writeback
[17:14:58] [PASSED] SPI
[17:14:58] [PASSED] USB
[17:14:58] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[17:14:58] ============ [PASSED] drmm_connector_hdmi_init =============
[17:14:58] ============= drmm_connector_init (3 subtests) =============
[17:14:58] [PASSED] drm_test_drmm_connector_init
[17:14:58] [PASSED] drm_test_drmm_connector_init_null_ddc
[17:14:58] ========= drm_test_drmm_connector_init_type_valid  =========
[17:14:58] [PASSED] Unknown
[17:14:58] [PASSED] VGA
[17:14:58] [PASSED] DVI-I
[17:14:58] [PASSED] DVI-D
[17:14:58] [PASSED] DVI-A
[17:14:58] [PASSED] Composite
[17:14:58] [PASSED] SVIDEO
[17:14:58] [PASSED] LVDS
[17:14:58] [PASSED] Component
[17:14:58] [PASSED] DIN
[17:14:58] [PASSED] DP
[17:14:58] [PASSED] HDMI-A
[17:14:58] [PASSED] HDMI-B
[17:14:58] [PASSED] TV
[17:14:58] [PASSED] eDP
[17:14:58] [PASSED] Virtual
[17:14:58] [PASSED] DSI
[17:14:58] [PASSED] DPI
[17:14:58] [PASSED] Writeback
[17:14:58] [PASSED] SPI
[17:14:58] [PASSED] USB
[17:14:58] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[17:14:58] =============== [PASSED] drmm_connector_init ===============
[17:14:58] ========= drm_connector_dynamic_init (6 subtests) ==========
[17:14:58] [PASSED] drm_test_drm_connector_dynamic_init
[17:14:58] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[17:14:58] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[17:14:58] [PASSED] drm_test_drm_connector_dynamic_init_properties
[17:14:58] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[17:14:58] [PASSED] Unknown
[17:14:58] [PASSED] VGA
[17:14:58] [PASSED] DVI-I
[17:14:58] [PASSED] DVI-D
[17:14:58] [PASSED] DVI-A
[17:14:58] [PASSED] Composite
[17:14:58] [PASSED] SVIDEO
[17:14:58] [PASSED] LVDS
[17:14:58] [PASSED] Component
[17:14:58] [PASSED] DIN
[17:14:58] [PASSED] DP
[17:14:58] [PASSED] HDMI-A
[17:14:58] [PASSED] HDMI-B
[17:14:58] [PASSED] TV
[17:14:58] [PASSED] eDP
[17:14:58] [PASSED] Virtual
[17:14:58] [PASSED] DSI
[17:14:58] [PASSED] DPI
[17:14:58] [PASSED] Writeback
[17:14:58] [PASSED] SPI
[17:14:58] [PASSED] USB
[17:14:58] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[17:14:58] ======== drm_test_drm_connector_dynamic_init_name  =========
[17:14:58] [PASSED] Unknown
[17:14:58] [PASSED] VGA
[17:14:58] [PASSED] DVI-I
[17:14:58] [PASSED] DVI-D
[17:14:58] [PASSED] DVI-A
[17:14:58] [PASSED] Composite
[17:14:58] [PASSED] SVIDEO
[17:14:58] [PASSED] LVDS
[17:14:58] [PASSED] Component
[17:14:58] [PASSED] DIN
[17:14:58] [PASSED] DP
[17:14:58] [PASSED] HDMI-A
[17:14:58] [PASSED] HDMI-B
[17:14:58] [PASSED] TV
[17:14:58] [PASSED] eDP
[17:14:58] [PASSED] Virtual
[17:14:58] [PASSED] DSI
[17:14:58] [PASSED] DPI
[17:14:58] [PASSED] Writeback
[17:14:58] [PASSED] SPI
[17:14:58] [PASSED] USB
[17:14:58] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[17:14:58] =========== [PASSED] drm_connector_dynamic_init ============
[17:14:58] ==== drm_connector_dynamic_register_early (4 subtests) =====
[17:14:58] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[17:14:58] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[17:14:58] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[17:14:58] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[17:14:58] ====== [PASSED] drm_connector_dynamic_register_early =======
[17:14:58] ======= drm_connector_dynamic_register (7 subtests) ========
[17:14:58] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[17:14:58] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[17:14:58] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[17:14:58] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[17:14:58] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[17:14:58] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[17:14:58] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[17:14:58] ========= [PASSED] drm_connector_dynamic_register ==========
[17:14:58] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[17:14:58] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[17:14:58] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[17:14:58] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[17:14:58] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[17:14:58] ========== drm_test_get_tv_mode_from_name_valid  ===========
[17:14:58] [PASSED] NTSC
[17:14:58] [PASSED] NTSC-443
[17:14:58] [PASSED] NTSC-J
[17:14:58] [PASSED] PAL
[17:14:58] [PASSED] PAL-M
[17:14:58] [PASSED] PAL-N
[17:14:58] [PASSED] SECAM
[17:14:58] [PASSED] Mono
[17:14:58] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[17:14:58] [PASSED] drm_test_get_tv_mode_from_name_truncated
[17:14:58] ============ [PASSED] drm_get_tv_mode_from_name ============
[17:14:58] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[17:14:58] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[17:14:58] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[17:14:58] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[17:14:58] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[17:14:58] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[17:14:58] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[17:14:58] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[17:14:58] [PASSED] VIC 96
[17:14:58] [PASSED] VIC 97
[17:14:58] [PASSED] VIC 101
[17:14:58] [PASSED] VIC 102
[17:14:58] [PASSED] VIC 106
[17:14:58] [PASSED] VIC 107
[17:14:58] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[17:14:58] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[17:14:58] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[17:14:58] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[17:14:58] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[17:14:58] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[17:14:58] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[17:14:58] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[17:14:58] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[17:14:58] [PASSED] Automatic
[17:14:58] [PASSED] Full
[17:14:58] [PASSED] Limited 16:235
[17:14:58] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[17:14:58] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[17:14:58] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[17:14:58] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[17:14:58] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[17:14:58] [PASSED] RGB
[17:14:58] [PASSED] YUV 4:2:0
[17:14:58] [PASSED] YUV 4:2:2
[17:14:58] [PASSED] YUV 4:4:4
[17:14:58] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[17:14:58] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[17:14:58] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[17:14:58] ============= drm_damage_helper (21 subtests) ==============
[17:14:58] [PASSED] drm_test_damage_iter_no_damage
[17:14:58] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[17:14:58] [PASSED] drm_test_damage_iter_no_damage_src_moved
[17:14:58] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[17:14:58] [PASSED] drm_test_damage_iter_no_damage_not_visible
[17:14:58] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[17:14:58] [PASSED] drm_test_damage_iter_no_damage_no_fb
[17:14:58] [PASSED] drm_test_damage_iter_simple_damage
[17:14:58] [PASSED] drm_test_damage_iter_single_damage
[17:14:58] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[17:14:58] [PASSED] drm_test_damage_iter_single_damage_outside_src
[17:14:58] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[17:14:58] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[17:14:58] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[17:14:58] [PASSED] drm_test_damage_iter_single_damage_src_moved
[17:14:58] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[17:14:58] [PASSED] drm_test_damage_iter_damage
[17:14:58] [PASSED] drm_test_damage_iter_damage_one_intersect
[17:14:58] [PASSED] drm_test_damage_iter_damage_one_outside
[17:14:58] [PASSED] drm_test_damage_iter_damage_src_moved
[17:14:58] [PASSED] drm_test_damage_iter_damage_not_visible
[17:14:58] ================ [PASSED] drm_damage_helper ================
[17:14:58] ============== drm_dp_mst_helper (3 subtests) ==============
[17:14:58] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[17:14:58] [PASSED] Clock 154000 BPP 30 DSC disabled
[17:14:58] [PASSED] Clock 234000 BPP 30 DSC disabled
[17:14:58] [PASSED] Clock 297000 BPP 24 DSC disabled
[17:14:58] [PASSED] Clock 332880 BPP 24 DSC enabled
[17:14:58] [PASSED] Clock 324540 BPP 24 DSC enabled
[17:14:58] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[17:14:58] ============== drm_test_dp_mst_calc_pbn_div  ===============
[17:14:58] [PASSED] Link rate 2000000 lane count 4
[17:14:58] [PASSED] Link rate 2000000 lane count 2
[17:14:58] [PASSED] Link rate 2000000 lane count 1
[17:14:58] [PASSED] Link rate 1350000 lane count 4
[17:14:58] [PASSED] Link rate 1350000 lane count 2
[17:14:58] [PASSED] Link rate 1350000 lane count 1
[17:14:58] [PASSED] Link rate 1000000 lane count 4
[17:14:58] [PASSED] Link rate 1000000 lane count 2
[17:14:58] [PASSED] Link rate 1000000 lane count 1
[17:14:58] [PASSED] Link rate 810000 lane count 4
[17:14:58] [PASSED] Link rate 810000 lane count 2
[17:14:58] [PASSED] Link rate 810000 lane count 1
[17:14:58] [PASSED] Link rate 540000 lane count 4
[17:14:58] [PASSED] Link rate 540000 lane count 2
[17:14:58] [PASSED] Link rate 540000 lane count 1
[17:14:58] [PASSED] Link rate 270000 lane count 4
[17:14:58] [PASSED] Link rate 270000 lane count 2
[17:14:58] [PASSED] Link rate 270000 lane count 1
[17:14:58] [PASSED] Link rate 162000 lane count 4
[17:14:58] [PASSED] Link rate 162000 lane count 2
[17:14:58] [PASSED] Link rate 162000 lane count 1
[17:14:58] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[17:14:58] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[17:14:58] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[17:14:58] [PASSED] DP_POWER_UP_PHY with port number
[17:14:58] [PASSED] DP_POWER_DOWN_PHY with port number
[17:14:58] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[17:14:58] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[17:14:58] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[17:14:58] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[17:14:58] [PASSED] DP_QUERY_PAYLOAD with port number
[17:14:58] [PASSED] DP_QUERY_PAYLOAD with VCPI
[17:14:58] [PASSED] DP_REMOTE_DPCD_READ with port number
[17:14:58] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[17:14:58] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[17:14:58] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[17:14:58] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[17:14:58] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[17:14:58] [PASSED] DP_REMOTE_I2C_READ with port number
[17:14:58] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[17:14:58] [PASSED] DP_REMOTE_I2C_READ with transactions array
[17:14:58] [PASSED] DP_REMOTE_I2C_WRITE with port number
[17:14:58] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[17:14:58] [PASSED] DP_REMOTE_I2C_WRITE with data array
[17:14:58] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[17:14:58] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[17:14:58] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[17:14:58] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[17:14:58] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[17:14:58] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[17:14:58] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[17:14:58] ================ [PASSED] drm_dp_mst_helper ================
[17:14:58] ================== drm_exec (7 subtests) ===================
[17:14:58] [PASSED] sanitycheck
[17:14:58] [PASSED] test_lock
[17:14:58] [PASSED] test_lock_unlock
[17:14:58] [PASSED] test_duplicates
[17:14:58] [PASSED] test_prepare
[17:14:58] [PASSED] test_prepare_array
[17:14:58] [PASSED] test_multiple_loops
[17:14:58] ==================== [PASSED] drm_exec =====================
[17:14:58] =========== drm_format_helper_test (17 subtests) ===========
[17:14:58] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[17:14:58] [PASSED] single_pixel_source_buffer
[17:14:58] [PASSED] single_pixel_clip_rectangle
[17:14:58] [PASSED] well_known_colors
[17:14:58] [PASSED] destination_pitch
[17:14:58] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[17:14:58] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[17:14:58] [PASSED] single_pixel_source_buffer
[17:14:58] [PASSED] single_pixel_clip_rectangle
[17:14:58] [PASSED] well_known_colors
[17:14:58] [PASSED] destination_pitch
[17:14:58] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[17:14:58] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[17:14:58] [PASSED] single_pixel_source_buffer
[17:14:58] [PASSED] single_pixel_clip_rectangle
[17:14:58] [PASSED] well_known_colors
[17:14:58] [PASSED] destination_pitch
[17:14:58] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[17:14:58] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[17:14:58] [PASSED] single_pixel_source_buffer
[17:14:58] [PASSED] single_pixel_clip_rectangle
[17:14:58] [PASSED] well_known_colors
[17:14:58] [PASSED] destination_pitch
[17:14:58] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[17:14:58] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[17:14:58] [PASSED] single_pixel_source_buffer
[17:14:58] [PASSED] single_pixel_clip_rectangle
[17:14:58] [PASSED] well_known_colors
[17:14:58] [PASSED] destination_pitch
[17:14:58] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[17:14:58] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[17:14:58] [PASSED] single_pixel_source_buffer
[17:14:58] [PASSED] single_pixel_clip_rectangle
[17:14:58] [PASSED] well_known_colors
[17:14:58] [PASSED] destination_pitch
[17:14:58] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[17:14:58] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[17:14:58] [PASSED] single_pixel_source_buffer
[17:14:58] [PASSED] single_pixel_clip_rectangle
[17:14:58] [PASSED] well_known_colors
[17:14:58] [PASSED] destination_pitch
[17:14:58] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[17:14:58] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[17:14:58] [PASSED] single_pixel_source_buffer
[17:14:58] [PASSED] single_pixel_clip_rectangle
[17:14:58] [PASSED] well_known_colors
[17:14:58] [PASSED] destination_pitch
[17:14:58] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[17:14:58] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[17:14:58] [PASSED] single_pixel_source_buffer
[17:14:58] [PASSED] single_pixel_clip_rectangle
[17:14:58] [PASSED] well_known_colors
[17:14:58] [PASSED] destination_pitch
[17:14:58] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[17:14:58] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[17:14:58] [PASSED] single_pixel_source_buffer
[17:14:58] [PASSED] single_pixel_clip_rectangle
[17:14:58] [PASSED] well_known_colors
[17:14:58] [PASSED] destination_pitch
[17:14:58] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[17:14:58] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[17:14:58] [PASSED] single_pixel_source_buffer
[17:14:58] [PASSED] single_pixel_clip_rectangle
[17:14:58] [PASSED] well_known_colors
[17:14:58] [PASSED] destination_pitch
[17:14:58] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[17:14:58] ============== drm_test_fb_xrgb8888_to_mono  ===============
[17:14:58] [PASSED] single_pixel_source_buffer
[17:14:58] [PASSED] single_pixel_clip_rectangle
[17:14:58] [PASSED] well_known_colors
[17:14:58] [PASSED] destination_pitch
[17:14:59] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[17:14:59] ==================== drm_test_fb_swab  =====================
[17:14:59] [PASSED] single_pixel_source_buffer
[17:14:59] [PASSED] single_pixel_clip_rectangle
[17:14:59] [PASSED] well_known_colors
[17:14:59] [PASSED] destination_pitch
[17:14:59] ================ [PASSED] drm_test_fb_swab =================
[17:14:59] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[17:14:59] [PASSED] single_pixel_source_buffer
[17:14:59] [PASSED] single_pixel_clip_rectangle
[17:14:59] [PASSED] well_known_colors
[17:14:59] [PASSED] destination_pitch
[17:14:59] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[17:14:59] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[17:14:59] [PASSED] single_pixel_source_buffer
[17:14:59] [PASSED] single_pixel_clip_rectangle
[17:14:59] [PASSED] well_known_colors
[17:14:59] [PASSED] destination_pitch
[17:14:59] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[17:14:59] ================= drm_test_fb_clip_offset  =================
[17:14:59] [PASSED] pass through
[17:14:59] [PASSED] horizontal offset
[17:14:59] [PASSED] vertical offset
[17:14:59] [PASSED] horizontal and vertical offset
[17:14:59] [PASSED] horizontal offset (custom pitch)
[17:14:59] [PASSED] vertical offset (custom pitch)
[17:14:59] [PASSED] horizontal and vertical offset (custom pitch)
[17:14:59] ============= [PASSED] drm_test_fb_clip_offset =============
[17:14:59] =================== drm_test_fb_memcpy  ====================
[17:14:59] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[17:14:59] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[17:14:59] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[17:14:59] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[17:14:59] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[17:14:59] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[17:14:59] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[17:14:59] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[17:14:59] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[17:14:59] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[17:14:59] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[17:14:59] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[17:14:59] =============== [PASSED] drm_test_fb_memcpy ================
[17:14:59] ============= [PASSED] drm_format_helper_test ==============
[17:14:59] ================= drm_format (18 subtests) =================
[17:14:59] [PASSED] drm_test_format_block_width_invalid
[17:14:59] [PASSED] drm_test_format_block_width_one_plane
[17:14:59] [PASSED] drm_test_format_block_width_two_plane
[17:14:59] [PASSED] drm_test_format_block_width_three_plane
[17:14:59] [PASSED] drm_test_format_block_width_tiled
[17:14:59] [PASSED] drm_test_format_block_height_invalid
[17:14:59] [PASSED] drm_test_format_block_height_one_plane
[17:14:59] [PASSED] drm_test_format_block_height_two_plane
[17:14:59] [PASSED] drm_test_format_block_height_three_plane
[17:14:59] [PASSED] drm_test_format_block_height_tiled
[17:14:59] [PASSED] drm_test_format_min_pitch_invalid
[17:14:59] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[17:14:59] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[17:14:59] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[17:14:59] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[17:14:59] [PASSED] drm_test_format_min_pitch_two_plane
[17:14:59] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[17:14:59] [PASSED] drm_test_format_min_pitch_tiled
[17:14:59] =================== [PASSED] drm_format ====================
[17:14:59] ============== drm_framebuffer (10 subtests) ===============
[17:14:59] ========== drm_test_framebuffer_check_src_coords  ==========
[17:14:59] [PASSED] Success: source fits into fb
[17:14:59] [PASSED] Fail: overflowing fb with x-axis coordinate
[17:14:59] [PASSED] Fail: overflowing fb with y-axis coordinate
[17:14:59] [PASSED] Fail: overflowing fb with source width
[17:14:59] [PASSED] Fail: overflowing fb with source height
[17:14:59] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[17:14:59] [PASSED] drm_test_framebuffer_cleanup
[17:14:59] =============== drm_test_framebuffer_create  ===============
[17:14:59] [PASSED] ABGR8888 normal sizes
[17:14:59] [PASSED] ABGR8888 max sizes
[17:14:59] [PASSED] ABGR8888 pitch greater than min required
[17:14:59] [PASSED] ABGR8888 pitch less than min required
[17:14:59] [PASSED] ABGR8888 Invalid width
[17:14:59] [PASSED] ABGR8888 Invalid buffer handle
[17:14:59] [PASSED] No pixel format
[17:14:59] [PASSED] ABGR8888 Width 0
[17:14:59] [PASSED] ABGR8888 Height 0
[17:14:59] [PASSED] ABGR8888 Out of bound height * pitch combination
[17:14:59] [PASSED] ABGR8888 Large buffer offset
[17:14:59] [PASSED] ABGR8888 Buffer offset for inexistent plane
[17:14:59] [PASSED] ABGR8888 Invalid flag
[17:14:59] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[17:14:59] [PASSED] ABGR8888 Valid buffer modifier
[17:14:59] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[17:14:59] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[17:14:59] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[17:14:59] [PASSED] NV12 Normal sizes
[17:14:59] [PASSED] NV12 Max sizes
[17:14:59] [PASSED] NV12 Invalid pitch
[17:14:59] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[17:14:59] [PASSED] NV12 different  modifier per-plane
[17:14:59] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[17:14:59] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[17:14:59] [PASSED] NV12 Modifier for inexistent plane
[17:14:59] [PASSED] NV12 Handle for inexistent plane
[17:14:59] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[17:14:59] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[17:14:59] [PASSED] YVU420 Normal sizes
[17:14:59] [PASSED] YVU420 Max sizes
[17:14:59] [PASSED] YVU420 Invalid pitch
[17:14:59] [PASSED] YVU420 Different pitches
[17:14:59] [PASSED] YVU420 Different buffer offsets/pitches
[17:14:59] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[17:14:59] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[17:14:59] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[17:14:59] [PASSED] YVU420 Valid modifier
[17:14:59] [PASSED] YVU420 Different modifiers per plane
[17:14:59] [PASSED] YVU420 Modifier for inexistent plane
[17:14:59] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[17:14:59] [PASSED] X0L2 Normal sizes
[17:14:59] [PASSED] X0L2 Max sizes
[17:14:59] [PASSED] X0L2 Invalid pitch
[17:14:59] [PASSED] X0L2 Pitch greater than minimum required
[17:14:59] [PASSED] X0L2 Handle for inexistent plane
[17:14:59] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[17:14:59] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[17:14:59] [PASSED] X0L2 Valid modifier
[17:14:59] [PASSED] X0L2 Modifier for inexistent plane
[17:14:59] =========== [PASSED] drm_test_framebuffer_create ===========
[17:14:59] [PASSED] drm_test_framebuffer_free
[17:14:59] [PASSED] drm_test_framebuffer_init
[17:14:59] [PASSED] drm_test_framebuffer_init_bad_format
[17:14:59] [PASSED] drm_test_framebuffer_init_dev_mismatch
[17:14:59] [PASSED] drm_test_framebuffer_lookup
[17:14:59] [PASSED] drm_test_framebuffer_lookup_inexistent
[17:14:59] [PASSED] drm_test_framebuffer_modifiers_not_supported
[17:14:59] ================= [PASSED] drm_framebuffer =================
[17:14:59] ================ drm_gem_shmem (8 subtests) ================
[17:14:59] [PASSED] drm_gem_shmem_test_obj_create
[17:14:59] [PASSED] drm_gem_shmem_test_obj_create_private
[17:14:59] [PASSED] drm_gem_shmem_test_pin_pages
[17:14:59] [PASSED] drm_gem_shmem_test_vmap
[17:14:59] [PASSED] drm_gem_shmem_test_get_pages_sgt
[17:14:59] [PASSED] drm_gem_shmem_test_get_sg_table
[17:14:59] [PASSED] drm_gem_shmem_test_madvise
[17:14:59] [PASSED] drm_gem_shmem_test_purge
[17:14:59] ================== [PASSED] drm_gem_shmem ==================
[17:14:59] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[17:14:59] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[17:14:59] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[17:14:59] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[17:14:59] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[17:14:59] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[17:14:59] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[17:14:59] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[17:14:59] [PASSED] Automatic
[17:14:59] [PASSED] Full
[17:14:59] [PASSED] Limited 16:235
[17:14:59] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[17:14:59] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[17:14:59] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[17:14:59] [PASSED] drm_test_check_disable_connector
[17:14:59] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[17:14:59] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[17:14:59] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[17:14:59] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[17:14:59] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[17:14:59] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[17:14:59] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[17:14:59] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[17:14:59] [PASSED] drm_test_check_output_bpc_dvi
[17:14:59] [PASSED] drm_test_check_output_bpc_format_vic_1
[17:14:59] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[17:14:59] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[17:14:59] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[17:14:59] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[17:14:59] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[17:14:59] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[17:14:59] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[17:14:59] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[17:14:59] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[17:14:59] [PASSED] drm_test_check_broadcast_rgb_value
[17:14:59] [PASSED] drm_test_check_bpc_8_value
[17:14:59] [PASSED] drm_test_check_bpc_10_value
[17:14:59] [PASSED] drm_test_check_bpc_12_value
[17:14:59] [PASSED] drm_test_check_format_value
[17:14:59] [PASSED] drm_test_check_tmds_char_value
[17:14:59] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[17:14:59] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[17:14:59] [PASSED] drm_test_check_mode_valid
[17:14:59] [PASSED] drm_test_check_mode_valid_reject
[17:14:59] [PASSED] drm_test_check_mode_valid_reject_rate
[17:14:59] [PASSED] drm_test_check_mode_valid_reject_max_clock
[17:14:59] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[17:14:59] ================= drm_managed (2 subtests) =================
[17:14:59] [PASSED] drm_test_managed_release_action
[17:14:59] [PASSED] drm_test_managed_run_action
[17:14:59] =================== [PASSED] drm_managed ===================
[17:14:59] =================== drm_mm (6 subtests) ====================
[17:14:59] [PASSED] drm_test_mm_init
[17:14:59] [PASSED] drm_test_mm_debug
[17:14:59] [PASSED] drm_test_mm_align32
[17:14:59] [PASSED] drm_test_mm_align64
[17:14:59] [PASSED] drm_test_mm_lowest
[17:14:59] [PASSED] drm_test_mm_highest
[17:14:59] ===================== [PASSED] drm_mm ======================
[17:14:59] ============= drm_modes_analog_tv (5 subtests) =============
[17:14:59] [PASSED] drm_test_modes_analog_tv_mono_576i
[17:14:59] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[17:14:59] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[17:14:59] [PASSED] drm_test_modes_analog_tv_pal_576i
[17:14:59] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[17:14:59] =============== [PASSED] drm_modes_analog_tv ===============
[17:14:59] ============== drm_plane_helper (2 subtests) ===============
[17:14:59] =============== drm_test_check_plane_state  ================
[17:14:59] [PASSED] clipping_simple
[17:14:59] [PASSED] clipping_rotate_reflect
[17:14:59] [PASSED] positioning_simple
[17:14:59] [PASSED] upscaling
[17:14:59] [PASSED] downscaling
[17:14:59] [PASSED] rounding1
[17:14:59] [PASSED] rounding2
[17:14:59] [PASSED] rounding3
[17:14:59] [PASSED] rounding4
[17:14:59] =========== [PASSED] drm_test_check_plane_state ============
[17:14:59] =========== drm_test_check_invalid_plane_state  ============
[17:14:59] [PASSED] positioning_invalid
[17:14:59] [PASSED] upscaling_invalid
[17:14:59] [PASSED] downscaling_invalid
[17:14:59] ======= [PASSED] drm_test_check_invalid_plane_state ========
[17:14:59] ================ [PASSED] drm_plane_helper =================
[17:14:59] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[17:14:59] ====== drm_test_connector_helper_tv_get_modes_check  =======
[17:14:59] [PASSED] None
[17:14:59] [PASSED] PAL
[17:14:59] [PASSED] NTSC
[17:14:59] [PASSED] Both, NTSC Default
[17:14:59] [PASSED] Both, PAL Default
[17:14:59] [PASSED] Both, NTSC Default, with PAL on command-line
[17:14:59] [PASSED] Both, PAL Default, with NTSC on command-line
[17:14:59] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[17:14:59] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[17:14:59] ================== drm_rect (9 subtests) ===================
[17:14:59] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[17:14:59] [PASSED] drm_test_rect_clip_scaled_not_clipped
[17:14:59] [PASSED] drm_test_rect_clip_scaled_clipped
[17:14:59] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[17:14:59] ================= drm_test_rect_intersect  =================
[17:14:59] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[17:14:59] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[17:14:59] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[17:14:59] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[17:14:59] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[17:14:59] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[17:14:59] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[17:14:59] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[17:14:59] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[17:14:59] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[17:14:59] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[17:14:59] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[17:14:59] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[17:14:59] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[17:14:59] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[17:14:59] ============= [PASSED] drm_test_rect_intersect =============
[17:14:59] ================ drm_test_rect_calc_hscale  ================
[17:14:59] [PASSED] normal use
[17:14:59] [PASSED] out of max range
[17:14:59] [PASSED] out of min range
[17:14:59] [PASSED] zero dst
[17:14:59] [PASSED] negative src
[17:14:59] [PASSED] negative dst
[17:14:59] ============ [PASSED] drm_test_rect_calc_hscale ============
[17:14:59] ================ drm_test_rect_calc_vscale  ================
[17:14:59] [PASSED] normal use
stty: 'standard input': Inappropriate ioctl for device
[17:14:59] [PASSED] out of max range
[17:14:59] [PASSED] out of min range
[17:14:59] [PASSED] zero dst
[17:14:59] [PASSED] negative src
[17:14:59] [PASSED] negative dst
[17:14:59] ============ [PASSED] drm_test_rect_calc_vscale ============
[17:14:59] ================== drm_test_rect_rotate  ===================
[17:14:59] [PASSED] reflect-x
[17:14:59] [PASSED] reflect-y
[17:14:59] [PASSED] rotate-0
[17:14:59] [PASSED] rotate-90
[17:14:59] [PASSED] rotate-180
[17:14:59] [PASSED] rotate-270
[17:14:59] ============== [PASSED] drm_test_rect_rotate ===============
[17:14:59] ================ drm_test_rect_rotate_inv  =================
[17:14:59] [PASSED] reflect-x
[17:14:59] [PASSED] reflect-y
[17:14:59] [PASSED] rotate-0
[17:14:59] [PASSED] rotate-90
[17:14:59] [PASSED] rotate-180
[17:14:59] [PASSED] rotate-270
[17:14:59] ============ [PASSED] drm_test_rect_rotate_inv =============
[17:14:59] ==================== [PASSED] drm_rect =====================
[17:14:59] ============ drm_sysfb_modeset_test (1 subtest) ============
[17:14:59] ============ drm_test_sysfb_build_fourcc_list  =============
[17:14:59] [PASSED] no native formats
[17:14:59] [PASSED] XRGB8888 as native format
[17:14:59] [PASSED] remove duplicates
[17:14:59] [PASSED] convert alpha formats
[17:14:59] [PASSED] random formats
[17:14:59] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[17:14:59] ============= [PASSED] drm_sysfb_modeset_test ==============
[17:14:59] ================== drm_fixp (2 subtests) ===================
[17:14:59] [PASSED] drm_test_int2fixp
[17:14:59] [PASSED] drm_test_sm2fixp
[17:14:59] ==================== [PASSED] drm_fixp =====================
[17:14:59] ============================================================
[17:14:59] Testing complete. Ran 624 tests: passed: 624
[17:14:59] Elapsed time: 26.970s total, 1.722s configuring, 24.776s building, 0.435s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[17:14:59] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:15:00] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:15:10] Starting KUnit Kernel (1/1)...
[17:15:10] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:15:10] ================= ttm_device (5 subtests) ==================
[17:15:10] [PASSED] ttm_device_init_basic
[17:15:10] [PASSED] ttm_device_init_multiple
[17:15:10] [PASSED] ttm_device_fini_basic
[17:15:10] [PASSED] ttm_device_init_no_vma_man
[17:15:10] ================== ttm_device_init_pools  ==================
[17:15:10] [PASSED] No DMA allocations, no DMA32 required
[17:15:10] [PASSED] DMA allocations, DMA32 required
[17:15:10] [PASSED] No DMA allocations, DMA32 required
[17:15:10] [PASSED] DMA allocations, no DMA32 required
[17:15:10] ============== [PASSED] ttm_device_init_pools ==============
[17:15:10] =================== [PASSED] ttm_device ====================
[17:15:10] ================== ttm_pool (8 subtests) ===================
[17:15:10] ================== ttm_pool_alloc_basic  ===================
[17:15:10] [PASSED] One page
[17:15:10] [PASSED] More than one page
[17:15:10] [PASSED] Above the allocation limit
[17:15:10] [PASSED] One page, with coherent DMA mappings enabled
[17:15:10] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[17:15:10] ============== [PASSED] ttm_pool_alloc_basic ===============
[17:15:10] ============== ttm_pool_alloc_basic_dma_addr  ==============
[17:15:10] [PASSED] One page
[17:15:10] [PASSED] More than one page
[17:15:10] [PASSED] Above the allocation limit
[17:15:10] [PASSED] One page, with coherent DMA mappings enabled
[17:15:10] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[17:15:10] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[17:15:10] [PASSED] ttm_pool_alloc_order_caching_match
[17:15:10] [PASSED] ttm_pool_alloc_caching_mismatch
[17:15:10] [PASSED] ttm_pool_alloc_order_mismatch
[17:15:10] [PASSED] ttm_pool_free_dma_alloc
[17:15:10] [PASSED] ttm_pool_free_no_dma_alloc
[17:15:10] [PASSED] ttm_pool_fini_basic
[17:15:10] ==================== [PASSED] ttm_pool =====================
[17:15:10] ================ ttm_resource (8 subtests) =================
[17:15:10] ================= ttm_resource_init_basic  =================
[17:15:10] [PASSED] Init resource in TTM_PL_SYSTEM
[17:15:10] [PASSED] Init resource in TTM_PL_VRAM
[17:15:10] [PASSED] Init resource in a private placement
[17:15:10] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[17:15:10] ============= [PASSED] ttm_resource_init_basic =============
[17:15:10] [PASSED] ttm_resource_init_pinned
[17:15:10] [PASSED] ttm_resource_fini_basic
[17:15:10] [PASSED] ttm_resource_manager_init_basic
[17:15:10] [PASSED] ttm_resource_manager_usage_basic
[17:15:10] [PASSED] ttm_resource_manager_set_used_basic
[17:15:10] [PASSED] ttm_sys_man_alloc_basic
[17:15:10] [PASSED] ttm_sys_man_free_basic
[17:15:10] ================== [PASSED] ttm_resource ===================
[17:15:10] =================== ttm_tt (15 subtests) ===================
[17:15:10] ==================== ttm_tt_init_basic  ====================
[17:15:10] [PASSED] Page-aligned size
[17:15:10] [PASSED] Extra pages requested
[17:15:10] ================ [PASSED] ttm_tt_init_basic ================
[17:15:10] [PASSED] ttm_tt_init_misaligned
[17:15:10] [PASSED] ttm_tt_fini_basic
[17:15:10] [PASSED] ttm_tt_fini_sg
[17:15:10] [PASSED] ttm_tt_fini_shmem
[17:15:10] [PASSED] ttm_tt_create_basic
[17:15:10] [PASSED] ttm_tt_create_invalid_bo_type
[17:15:10] [PASSED] ttm_tt_create_ttm_exists
[17:15:10] [PASSED] ttm_tt_create_failed
[17:15:10] [PASSED] ttm_tt_destroy_basic
[17:15:10] [PASSED] ttm_tt_populate_null_ttm
[17:15:10] [PASSED] ttm_tt_populate_populated_ttm
[17:15:10] [PASSED] ttm_tt_unpopulate_basic
[17:15:10] [PASSED] ttm_tt_unpopulate_empty_ttm
[17:15:10] [PASSED] ttm_tt_swapin_basic
[17:15:10] ===================== [PASSED] ttm_tt ======================
[17:15:10] =================== ttm_bo (14 subtests) ===================
[17:15:10] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[17:15:10] [PASSED] Cannot be interrupted and sleeps
[17:15:10] [PASSED] Cannot be interrupted, locks straight away
[17:15:10] [PASSED] Can be interrupted, sleeps
[17:15:10] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[17:15:10] [PASSED] ttm_bo_reserve_locked_no_sleep
[17:15:10] [PASSED] ttm_bo_reserve_no_wait_ticket
[17:15:10] [PASSED] ttm_bo_reserve_double_resv
[17:15:10] [PASSED] ttm_bo_reserve_interrupted
[17:15:10] [PASSED] ttm_bo_reserve_deadlock
[17:15:10] [PASSED] ttm_bo_unreserve_basic
[17:15:10] [PASSED] ttm_bo_unreserve_pinned
[17:15:10] [PASSED] ttm_bo_unreserve_bulk
[17:15:10] [PASSED] ttm_bo_fini_basic
[17:15:10] [PASSED] ttm_bo_fini_shared_resv
[17:15:10] [PASSED] ttm_bo_pin_basic
[17:15:10] [PASSED] ttm_bo_pin_unpin_resource
[17:15:10] [PASSED] ttm_bo_multiple_pin_one_unpin
[17:15:10] ===================== [PASSED] ttm_bo ======================
[17:15:10] ============== ttm_bo_validate (21 subtests) ===============
[17:15:10] ============== ttm_bo_init_reserved_sys_man  ===============
[17:15:10] [PASSED] Buffer object for userspace
[17:15:10] [PASSED] Kernel buffer object
[17:15:10] [PASSED] Shared buffer object
[17:15:10] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[17:15:10] ============== ttm_bo_init_reserved_mock_man  ==============
[17:15:10] [PASSED] Buffer object for userspace
[17:15:10] [PASSED] Kernel buffer object
[17:15:10] [PASSED] Shared buffer object
[17:15:10] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[17:15:10] [PASSED] ttm_bo_init_reserved_resv
[17:15:10] ================== ttm_bo_validate_basic  ==================
[17:15:10] [PASSED] Buffer object for userspace
[17:15:10] [PASSED] Kernel buffer object
[17:15:10] [PASSED] Shared buffer object
[17:15:10] ============== [PASSED] ttm_bo_validate_basic ==============
[17:15:10] [PASSED] ttm_bo_validate_invalid_placement
[17:15:10] ============= ttm_bo_validate_same_placement  ==============
[17:15:10] [PASSED] System manager
[17:15:10] [PASSED] VRAM manager
[17:15:10] ========= [PASSED] ttm_bo_validate_same_placement ==========
[17:15:10] [PASSED] ttm_bo_validate_failed_alloc
[17:15:10] [PASSED] ttm_bo_validate_pinned
[17:15:10] [PASSED] ttm_bo_validate_busy_placement
[17:15:10] ================ ttm_bo_validate_multihop  =================
[17:15:10] [PASSED] Buffer object for userspace
[17:15:10] [PASSED] Kernel buffer object
[17:15:10] [PASSED] Shared buffer object
[17:15:10] ============ [PASSED] ttm_bo_validate_multihop =============
[17:15:10] ========== ttm_bo_validate_no_placement_signaled  ==========
[17:15:10] [PASSED] Buffer object in system domain, no page vector
[17:15:10] [PASSED] Buffer object in system domain with an existing page vector
[17:15:10] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[17:15:10] ======== ttm_bo_validate_no_placement_not_signaled  ========
[17:15:10] [PASSED] Buffer object for userspace
[17:15:10] [PASSED] Kernel buffer object
[17:15:10] [PASSED] Shared buffer object
[17:15:10] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[17:15:10] [PASSED] ttm_bo_validate_move_fence_signaled
[17:15:10] ========= ttm_bo_validate_move_fence_not_signaled  =========
[17:15:10] [PASSED] Waits for GPU
[17:15:10] [PASSED] Tries to lock straight away
[17:15:10] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[17:15:10] [PASSED] ttm_bo_validate_happy_evict
[17:15:10] [PASSED] ttm_bo_validate_all_pinned_evict
[17:15:10] [PASSED] ttm_bo_validate_allowed_only_evict
[17:15:10] [PASSED] ttm_bo_validate_deleted_evict
[17:15:10] [PASSED] ttm_bo_validate_busy_domain_evict
[17:15:10] [PASSED] ttm_bo_validate_evict_gutting
[17:15:10] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[17:15:10] ================= [PASSED] ttm_bo_validate =================
[17:15:10] ============================================================
[17:15:10] Testing complete. Ran 101 tests: passed: 101
[17:15:10] Elapsed time: 11.141s total, 1.614s configuring, 9.311s building, 0.188s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


