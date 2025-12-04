Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD50ED20698
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 13:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F5310E1F7;
	Thu,  4 Dec 2025 13:55:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E3810E1F7;
 Thu,  4 Dec 2025 13:55:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/vblank=3A_refactoring_and_?=
 =?utf-8?q?cleanups_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Dec 2025 13:55:15 -0000
Message-ID: <176485651558.56855.5927371532743017283@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1764845757.git.jani.nikula@intel.com>
In-Reply-To: <cover.1764845757.git.jani.nikula@intel.com>
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

Series: drm/vblank: refactoring and cleanups (rev2)
URL   : https://patchwork.freedesktop.org/series/157332/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[13:53:52] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:53:56] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=25
[13:54:33] Starting KUnit Kernel (1/1)...
[13:54:33] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[13:54:33] ================== guc_buf (11 subtests) ===================
[13:54:33] [PASSED] test_smallest
[13:54:33] [PASSED] test_largest
[13:54:34] [PASSED] test_granular
[13:54:34] [PASSED] test_unique
[13:54:34] [PASSED] test_overlap
[13:54:34] [PASSED] test_reusable
[13:54:34] [PASSED] test_too_big
[13:54:34] [PASSED] test_flush
[13:54:34] [PASSED] test_lookup
[13:54:34] [PASSED] test_data
[13:54:34] [PASSED] test_class
[13:54:34] ===================== [PASSED] guc_buf =====================
[13:54:34] =================== guc_dbm (7 subtests) ===================
[13:54:34] [PASSED] test_empty
[13:54:34] [PASSED] test_default
[13:54:34] ======================== test_size  ========================
[13:54:34] [PASSED] 4
[13:54:34] [PASSED] 8
[13:54:34] [PASSED] 32
[13:54:34] [PASSED] 256
[13:54:34] ==================== [PASSED] test_size ====================
[13:54:34] ======================= test_reuse  ========================
[13:54:34] [PASSED] 4
[13:54:34] [PASSED] 8
[13:54:34] [PASSED] 32
[13:54:34] [PASSED] 256
[13:54:34] =================== [PASSED] test_reuse ====================
[13:54:34] =================== test_range_overlap  ====================
[13:54:34] [PASSED] 4
[13:54:34] [PASSED] 8
[13:54:34] [PASSED] 32
[13:54:34] [PASSED] 256
[13:54:34] =============== [PASSED] test_range_overlap ================
[13:54:34] =================== test_range_compact  ====================
[13:54:34] [PASSED] 4
[13:54:34] [PASSED] 8
[13:54:34] [PASSED] 32
[13:54:34] [PASSED] 256
[13:54:34] =============== [PASSED] test_range_compact ================
[13:54:34] ==================== test_range_spare  =====================
[13:54:34] [PASSED] 4
[13:54:34] [PASSED] 8
[13:54:34] [PASSED] 32
[13:54:34] [PASSED] 256
[13:54:34] ================ [PASSED] test_range_spare =================
[13:54:34] ===================== [PASSED] guc_dbm =====================
[13:54:34] =================== guc_idm (6 subtests) ===================
[13:54:34] [PASSED] bad_init
[13:54:34] [PASSED] no_init
[13:54:34] [PASSED] init_fini
[13:54:34] [PASSED] check_used
[13:54:34] [PASSED] check_quota
[13:54:34] [PASSED] check_all
[13:54:34] ===================== [PASSED] guc_idm =====================
[13:54:34] ================== no_relay (3 subtests) ===================
[13:54:34] [PASSED] xe_drops_guc2pf_if_not_ready
[13:54:34] [PASSED] xe_drops_guc2vf_if_not_ready
[13:54:34] [PASSED] xe_rejects_send_if_not_ready
[13:54:34] ==================== [PASSED] no_relay =====================
[13:54:34] ================== pf_relay (14 subtests) ==================
[13:54:34] [PASSED] pf_rejects_guc2pf_too_short
[13:54:34] [PASSED] pf_rejects_guc2pf_too_long
[13:54:34] [PASSED] pf_rejects_guc2pf_no_payload
[13:54:34] [PASSED] pf_fails_no_payload
[13:54:34] [PASSED] pf_fails_bad_origin
[13:54:34] [PASSED] pf_fails_bad_type
[13:54:34] [PASSED] pf_txn_reports_error
[13:54:34] [PASSED] pf_txn_sends_pf2guc
[13:54:34] [PASSED] pf_sends_pf2guc
[13:54:34] [SKIPPED] pf_loopback_nop
[13:54:34] [SKIPPED] pf_loopback_echo
[13:54:34] [SKIPPED] pf_loopback_fail
[13:54:34] [SKIPPED] pf_loopback_busy
[13:54:34] [SKIPPED] pf_loopback_retry
[13:54:34] ==================== [PASSED] pf_relay =====================
[13:54:34] ================== vf_relay (3 subtests) ===================
[13:54:34] [PASSED] vf_rejects_guc2vf_too_short
[13:54:34] [PASSED] vf_rejects_guc2vf_too_long
[13:54:34] [PASSED] vf_rejects_guc2vf_no_payload
[13:54:34] ==================== [PASSED] vf_relay =====================
[13:54:34] ================ pf_gt_config (6 subtests) =================
[13:54:34] [PASSED] fair_contexts_1vf
[13:54:34] [PASSED] fair_doorbells_1vf
[13:54:34] [PASSED] fair_ggtt_1vf
[13:54:34] ====================== fair_contexts  ======================
[13:54:34] [PASSED] 1 VF
[13:54:34] [PASSED] 2 VFs
[13:54:34] [PASSED] 3 VFs
[13:54:34] [PASSED] 4 VFs
[13:54:34] [PASSED] 5 VFs
[13:54:34] [PASSED] 6 VFs
[13:54:34] [PASSED] 7 VFs
[13:54:34] [PASSED] 8 VFs
[13:54:34] [PASSED] 9 VFs
[13:54:34] [PASSED] 10 VFs
[13:54:34] [PASSED] 11 VFs
[13:54:34] [PASSED] 12 VFs
[13:54:34] [PASSED] 13 VFs
[13:54:34] [PASSED] 14 VFs
[13:54:34] [PASSED] 15 VFs
[13:54:34] [PASSED] 16 VFs
[13:54:34] [PASSED] 17 VFs
[13:54:34] [PASSED] 18 VFs
[13:54:34] [PASSED] 19 VFs
[13:54:34] [PASSED] 20 VFs
[13:54:34] [PASSED] 21 VFs
[13:54:34] [PASSED] 22 VFs
[13:54:34] [PASSED] 23 VFs
[13:54:34] [PASSED] 24 VFs
[13:54:34] [PASSED] 25 VFs
[13:54:34] [PASSED] 26 VFs
[13:54:34] [PASSED] 27 VFs
[13:54:34] [PASSED] 28 VFs
[13:54:34] [PASSED] 29 VFs
[13:54:34] [PASSED] 30 VFs
[13:54:34] [PASSED] 31 VFs
[13:54:34] [PASSED] 32 VFs
[13:54:34] [PASSED] 33 VFs
[13:54:34] [PASSED] 34 VFs
[13:54:34] [PASSED] 35 VFs
[13:54:34] [PASSED] 36 VFs
[13:54:34] [PASSED] 37 VFs
[13:54:34] [PASSED] 38 VFs
[13:54:34] [PASSED] 39 VFs
[13:54:34] [PASSED] 40 VFs
[13:54:34] [PASSED] 41 VFs
[13:54:34] [PASSED] 42 VFs
[13:54:34] [PASSED] 43 VFs
[13:54:34] [PASSED] 44 VFs
[13:54:34] [PASSED] 45 VFs
[13:54:34] [PASSED] 46 VFs
[13:54:34] [PASSED] 47 VFs
[13:54:34] [PASSED] 48 VFs
[13:54:34] [PASSED] 49 VFs
[13:54:34] [PASSED] 50 VFs
[13:54:34] [PASSED] 51 VFs
[13:54:34] [PASSED] 52 VFs
[13:54:34] [PASSED] 53 VFs
[13:54:34] [PASSED] 54 VFs
[13:54:34] [PASSED] 55 VFs
[13:54:34] [PASSED] 56 VFs
[13:54:34] [PASSED] 57 VFs
[13:54:34] [PASSED] 58 VFs
[13:54:34] [PASSED] 59 VFs
[13:54:34] [PASSED] 60 VFs
[13:54:34] [PASSED] 61 VFs
[13:54:34] [PASSED] 62 VFs
[13:54:34] [PASSED] 63 VFs
[13:54:34] ================== [PASSED] fair_contexts ==================
[13:54:34] ===================== fair_doorbells  ======================
[13:54:34] [PASSED] 1 VF
[13:54:34] [PASSED] 2 VFs
[13:54:34] [PASSED] 3 VFs
[13:54:34] [PASSED] 4 VFs
[13:54:34] [PASSED] 5 VFs
[13:54:34] [PASSED] 6 VFs
[13:54:34] [PASSED] 7 VFs
[13:54:34] [PASSED] 8 VFs
[13:54:34] [PASSED] 9 VFs
[13:54:34] [PASSED] 10 VFs
[13:54:34] [PASSED] 11 VFs
[13:54:34] [PASSED] 12 VFs
[13:54:34] [PASSED] 13 VFs
[13:54:34] [PASSED] 14 VFs
[13:54:34] [PASSED] 15 VFs
[13:54:34] [PASSED] 16 VFs
[13:54:34] [PASSED] 17 VFs
[13:54:34] [PASSED] 18 VFs
[13:54:34] [PASSED] 19 VFs
[13:54:34] [PASSED] 20 VFs
[13:54:34] [PASSED] 21 VFs
[13:54:34] [PASSED] 22 VFs
[13:54:34] [PASSED] 23 VFs
[13:54:34] [PASSED] 24 VFs
[13:54:34] [PASSED] 25 VFs
[13:54:34] [PASSED] 26 VFs
[13:54:34] [PASSED] 27 VFs
[13:54:34] [PASSED] 28 VFs
[13:54:34] [PASSED] 29 VFs
[13:54:34] [PASSED] 30 VFs
[13:54:34] [PASSED] 31 VFs
[13:54:34] [PASSED] 32 VFs
[13:54:34] [PASSED] 33 VFs
[13:54:34] [PASSED] 34 VFs
[13:54:34] [PASSED] 35 VFs
[13:54:34] [PASSED] 36 VFs
[13:54:34] [PASSED] 37 VFs
[13:54:34] [PASSED] 38 VFs
[13:54:34] [PASSED] 39 VFs
[13:54:34] [PASSED] 40 VFs
[13:54:34] [PASSED] 41 VFs
[13:54:34] [PASSED] 42 VFs
[13:54:34] [PASSED] 43 VFs
[13:54:34] [PASSED] 44 VFs
[13:54:34] [PASSED] 45 VFs
[13:54:34] [PASSED] 46 VFs
[13:54:34] [PASSED] 47 VFs
[13:54:34] [PASSED] 48 VFs
[13:54:34] [PASSED] 49 VFs
[13:54:34] [PASSED] 50 VFs
[13:54:34] [PASSED] 51 VFs
[13:54:34] [PASSED] 52 VFs
[13:54:34] [PASSED] 53 VFs
[13:54:34] [PASSED] 54 VFs
[13:54:34] [PASSED] 55 VFs
[13:54:34] [PASSED] 56 VFs
[13:54:34] [PASSED] 57 VFs
[13:54:34] [PASSED] 58 VFs
[13:54:34] [PASSED] 59 VFs
[13:54:34] [PASSED] 60 VFs
[13:54:34] [PASSED] 61 VFs
[13:54:34] [PASSED] 62 VFs
[13:54:34] [PASSED] 63 VFs
[13:54:34] ================= [PASSED] fair_doorbells ==================
[13:54:34] ======================== fair_ggtt  ========================
[13:54:34] [PASSED] 1 VF
[13:54:34] [PASSED] 2 VFs
[13:54:34] [PASSED] 3 VFs
[13:54:34] [PASSED] 4 VFs
[13:54:34] [PASSED] 5 VFs
[13:54:34] [PASSED] 6 VFs
[13:54:34] [PASSED] 7 VFs
[13:54:34] [PASSED] 8 VFs
[13:54:34] [PASSED] 9 VFs
[13:54:34] [PASSED] 10 VFs
[13:54:34] [PASSED] 11 VFs
[13:54:34] [PASSED] 12 VFs
[13:54:34] [PASSED] 13 VFs
[13:54:34] [PASSED] 14 VFs
[13:54:34] [PASSED] 15 VFs
[13:54:34] [PASSED] 16 VFs
[13:54:34] [PASSED] 17 VFs
[13:54:34] [PASSED] 18 VFs
[13:54:34] [PASSED] 19 VFs
[13:54:34] [PASSED] 20 VFs
[13:54:34] [PASSED] 21 VFs
[13:54:34] [PASSED] 22 VFs
[13:54:34] [PASSED] 23 VFs
[13:54:34] [PASSED] 24 VFs
[13:54:34] [PASSED] 25 VFs
[13:54:34] [PASSED] 26 VFs
[13:54:34] [PASSED] 27 VFs
[13:54:34] [PASSED] 28 VFs
[13:54:34] [PASSED] 29 VFs
[13:54:34] [PASSED] 30 VFs
[13:54:34] [PASSED] 31 VFs
[13:54:34] [PASSED] 32 VFs
[13:54:34] [PASSED] 33 VFs
[13:54:34] [PASSED] 34 VFs
[13:54:34] [PASSED] 35 VFs
[13:54:34] [PASSED] 36 VFs
[13:54:34] [PASSED] 37 VFs
[13:54:34] [PASSED] 38 VFs
[13:54:34] [PASSED] 39 VFs
[13:54:34] [PASSED] 40 VFs
[13:54:34] [PASSED] 41 VFs
[13:54:34] [PASSED] 42 VFs
[13:54:34] [PASSED] 43 VFs
[13:54:34] [PASSED] 44 VFs
[13:54:34] [PASSED] 45 VFs
[13:54:34] [PASSED] 46 VFs
[13:54:34] [PASSED] 47 VFs
[13:54:34] [PASSED] 48 VFs
[13:54:34] [PASSED] 49 VFs
[13:54:34] [PASSED] 50 VFs
[13:54:34] [PASSED] 51 VFs
[13:54:34] [PASSED] 52 VFs
[13:54:34] [PASSED] 53 VFs
[13:54:34] [PASSED] 54 VFs
[13:54:34] [PASSED] 55 VFs
[13:54:34] [PASSED] 56 VFs
[13:54:34] [PASSED] 57 VFs
[13:54:34] [PASSED] 58 VFs
[13:54:34] [PASSED] 59 VFs
[13:54:34] [PASSED] 60 VFs
[13:54:34] [PASSED] 61 VFs
[13:54:34] [PASSED] 62 VFs
[13:54:34] [PASSED] 63 VFs
[13:54:34] ==================== [PASSED] fair_ggtt ====================
[13:54:34] ================== [PASSED] pf_gt_config ===================
[13:54:34] ===================== lmtt (1 subtest) =====================
[13:54:34] ======================== test_ops  =========================
[13:54:34] [PASSED] 2-level
[13:54:34] [PASSED] multi-level
[13:54:34] ==================== [PASSED] test_ops =====================
[13:54:34] ====================== [PASSED] lmtt =======================
[13:54:34] ================= pf_service (11 subtests) =================
[13:54:34] [PASSED] pf_negotiate_any
[13:54:34] [PASSED] pf_negotiate_base_match
[13:54:34] [PASSED] pf_negotiate_base_newer
[13:54:34] [PASSED] pf_negotiate_base_next
[13:54:34] [SKIPPED] pf_negotiate_base_older
[13:54:34] [PASSED] pf_negotiate_base_prev
[13:54:34] [PASSED] pf_negotiate_latest_match
[13:54:34] [PASSED] pf_negotiate_latest_newer
[13:54:34] [PASSED] pf_negotiate_latest_next
[13:54:34] [SKIPPED] pf_negotiate_latest_older
[13:54:34] [SKIPPED] pf_negotiate_latest_prev
[13:54:34] =================== [PASSED] pf_service ====================
[13:54:34] ================= xe_guc_g2g (2 subtests) ==================
[13:54:34] ============== xe_live_guc_g2g_kunit_default  ==============
[13:54:34] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[13:54:34] ============== xe_live_guc_g2g_kunit_allmem  ===============
[13:54:34] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[13:54:34] =================== [SKIPPED] xe_guc_g2g ===================
[13:54:34] =================== xe_mocs (2 subtests) ===================
[13:54:34] ================ xe_live_mocs_kernel_kunit  ================
[13:54:34] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[13:54:34] ================ xe_live_mocs_reset_kunit  =================
[13:54:34] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[13:54:34] ==================== [SKIPPED] xe_mocs =====================
[13:54:34] ================= xe_migrate (2 subtests) ==================
[13:54:34] ================= xe_migrate_sanity_kunit  =================
[13:54:34] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[13:54:34] ================== xe_validate_ccs_kunit  ==================
[13:54:34] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[13:54:34] =================== [SKIPPED] xe_migrate ===================
[13:54:34] ================== xe_dma_buf (1 subtest) ==================
[13:54:34] ==================== xe_dma_buf_kunit  =====================
[13:54:34] ================ [SKIPPED] xe_dma_buf_kunit ================
[13:54:34] =================== [SKIPPED] xe_dma_buf ===================
[13:54:34] ================= xe_bo_shrink (1 subtest) =================
[13:54:34] =================== xe_bo_shrink_kunit  ====================
[13:54:34] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[13:54:34] ================== [SKIPPED] xe_bo_shrink ==================
[13:54:34] ==================== xe_bo (2 subtests) ====================
[13:54:34] ================== xe_ccs_migrate_kunit  ===================
[13:54:34] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[13:54:34] ==================== xe_bo_evict_kunit  ====================
[13:54:34] =============== [SKIPPED] xe_bo_evict_kunit ================
[13:54:34] ===================== [SKIPPED] xe_bo ======================
[13:54:34] ==================== args (11 subtests) ====================
[13:54:34] [PASSED] count_args_test
[13:54:34] [PASSED] call_args_example
[13:54:34] [PASSED] call_args_test
[13:54:34] [PASSED] drop_first_arg_example
[13:54:34] [PASSED] drop_first_arg_test
[13:54:34] [PASSED] first_arg_example
[13:54:34] [PASSED] first_arg_test
[13:54:34] [PASSED] last_arg_example
[13:54:34] [PASSED] last_arg_test
[13:54:34] [PASSED] pick_arg_example
[13:54:34] [PASSED] sep_comma_example
[13:54:34] ====================== [PASSED] args =======================
[13:54:34] =================== xe_pci (3 subtests) ====================
[13:54:34] ==================== check_graphics_ip  ====================
[13:54:34] [PASSED] 12.00 Xe_LP
[13:54:34] [PASSED] 12.10 Xe_LP+
[13:54:34] [PASSED] 12.55 Xe_HPG
[13:54:34] [PASSED] 12.60 Xe_HPC
[13:54:34] [PASSED] 12.70 Xe_LPG
[13:54:34] [PASSED] 12.71 Xe_LPG
[13:54:34] [PASSED] 12.74 Xe_LPG+
[13:54:34] [PASSED] 20.01 Xe2_HPG
[13:54:34] [PASSED] 20.02 Xe2_HPG
[13:54:34] [PASSED] 20.04 Xe2_LPG
[13:54:34] [PASSED] 30.00 Xe3_LPG
[13:54:34] [PASSED] 30.01 Xe3_LPG
[13:54:34] [PASSED] 30.03 Xe3_LPG
[13:54:34] [PASSED] 30.04 Xe3_LPG
[13:54:34] [PASSED] 30.05 Xe3_LPG
[13:54:34] [PASSED] 35.11 Xe3p_XPC
[13:54:34] ================ [PASSED] check_graphics_ip ================
[13:54:34] ===================== check_media_ip  ======================
[13:54:34] [PASSED] 12.00 Xe_M
[13:54:34] [PASSED] 12.55 Xe_HPM
[13:54:34] [PASSED] 13.00 Xe_LPM+
[13:54:34] [PASSED] 13.01 Xe2_HPM
[13:54:34] [PASSED] 20.00 Xe2_LPM
[13:54:34] [PASSED] 30.00 Xe3_LPM
[13:54:34] [PASSED] 30.02 Xe3_LPM
[13:54:34] [PASSED] 35.00 Xe3p_LPM
[13:54:34] [PASSED] 35.03 Xe3p_HPM
[13:54:34] ================= [PASSED] check_media_ip ==================
[13:54:34] =================== check_platform_desc  ===================
[13:54:34] [PASSED] 0x9A60 (TIGERLAKE)
[13:54:34] [PASSED] 0x9A68 (TIGERLAKE)
[13:54:34] [PASSED] 0x9A70 (TIGERLAKE)
[13:54:34] [PASSED] 0x9A40 (TIGERLAKE)
[13:54:34] [PASSED] 0x9A49 (TIGERLAKE)
[13:54:34] [PASSED] 0x9A59 (TIGERLAKE)
[13:54:34] [PASSED] 0x9A78 (TIGERLAKE)
[13:54:34] [PASSED] 0x9AC0 (TIGERLAKE)
[13:54:34] [PASSED] 0x9AC9 (TIGERLAKE)
[13:54:34] [PASSED] 0x9AD9 (TIGERLAKE)
[13:54:34] [PASSED] 0x9AF8 (TIGERLAKE)
[13:54:34] [PASSED] 0x4C80 (ROCKETLAKE)
[13:54:34] [PASSED] 0x4C8A (ROCKETLAKE)
[13:54:34] [PASSED] 0x4C8B (ROCKETLAKE)
[13:54:34] [PASSED] 0x4C8C (ROCKETLAKE)
[13:54:34] [PASSED] 0x4C90 (ROCKETLAKE)
[13:54:34] [PASSED] 0x4C9A (ROCKETLAKE)
[13:54:34] [PASSED] 0x4680 (ALDERLAKE_S)
[13:54:34] [PASSED] 0x4682 (ALDERLAKE_S)
[13:54:34] [PASSED] 0x4688 (ALDERLAKE_S)
[13:54:34] [PASSED] 0x468A (ALDERLAKE_S)
[13:54:34] [PASSED] 0x468B (ALDERLAKE_S)
[13:54:34] [PASSED] 0x4690 (ALDERLAKE_S)
[13:54:34] [PASSED] 0x4692 (ALDERLAKE_S)
[13:54:34] [PASSED] 0x4693 (ALDERLAKE_S)
[13:54:34] [PASSED] 0x46A0 (ALDERLAKE_P)
[13:54:34] [PASSED] 0x46A1 (ALDERLAKE_P)
[13:54:34] [PASSED] 0x46A2 (ALDERLAKE_P)
[13:54:34] [PASSED] 0x46A3 (ALDERLAKE_P)
[13:54:34] [PASSED] 0x46A6 (ALDERLAKE_P)
[13:54:34] [PASSED] 0x46A8 (ALDERLAKE_P)
[13:54:34] [PASSED] 0x46AA (ALDERLAKE_P)
[13:54:34] [PASSED] 0x462A (ALDERLAKE_P)
[13:54:34] [PASSED] 0x4626 (ALDERLAKE_P)
[13:54:34] [PASSED] 0x4628 (ALDERLAKE_P)
[13:54:34] [PASSED] 0x46B0 (ALDERLAKE_P)
stty: 'standard input': Inappropriate ioctl for device
[13:54:34] [PASSED] 0x46B1 (ALDERLAKE_P)
[13:54:34] [PASSED] 0x46B2 (ALDERLAKE_P)
[13:54:34] [PASSED] 0x46B3 (ALDERLAKE_P)
[13:54:34] [PASSED] 0x46C0 (ALDERLAKE_P)
[13:54:34] [PASSED] 0x46C1 (ALDERLAKE_P)
[13:54:34] [PASSED] 0x46C2 (ALDERLAKE_P)
[13:54:34] [PASSED] 0x46C3 (ALDERLAKE_P)
[13:54:34] [PASSED] 0x46D0 (ALDERLAKE_N)
[13:54:34] [PASSED] 0x46D1 (ALDERLAKE_N)
[13:54:34] [PASSED] 0x46D2 (ALDERLAKE_N)
[13:54:34] [PASSED] 0x46D3 (ALDERLAKE_N)
[13:54:34] [PASSED] 0x46D4 (ALDERLAKE_N)
[13:54:34] [PASSED] 0xA721 (ALDERLAKE_P)
[13:54:34] [PASSED] 0xA7A1 (ALDERLAKE_P)
[13:54:34] [PASSED] 0xA7A9 (ALDERLAKE_P)
[13:54:34] [PASSED] 0xA7AC (ALDERLAKE_P)
[13:54:34] [PASSED] 0xA7AD (ALDERLAKE_P)
[13:54:34] [PASSED] 0xA720 (ALDERLAKE_P)
[13:54:34] [PASSED] 0xA7A0 (ALDERLAKE_P)
[13:54:34] [PASSED] 0xA7A8 (ALDERLAKE_P)
[13:54:34] [PASSED] 0xA7AA (ALDERLAKE_P)
[13:54:34] [PASSED] 0xA7AB (ALDERLAKE_P)
[13:54:34] [PASSED] 0xA780 (ALDERLAKE_S)
[13:54:34] [PASSED] 0xA781 (ALDERLAKE_S)
[13:54:34] [PASSED] 0xA782 (ALDERLAKE_S)
[13:54:34] [PASSED] 0xA783 (ALDERLAKE_S)
[13:54:34] [PASSED] 0xA788 (ALDERLAKE_S)
[13:54:34] [PASSED] 0xA789 (ALDERLAKE_S)
[13:54:34] [PASSED] 0xA78A (ALDERLAKE_S)
[13:54:34] [PASSED] 0xA78B (ALDERLAKE_S)
[13:54:34] [PASSED] 0x4905 (DG1)
[13:54:34] [PASSED] 0x4906 (DG1)
[13:54:34] [PASSED] 0x4907 (DG1)
[13:54:34] [PASSED] 0x4908 (DG1)
[13:54:34] [PASSED] 0x4909 (DG1)
[13:54:34] [PASSED] 0x56C0 (DG2)
[13:54:34] [PASSED] 0x56C2 (DG2)
[13:54:34] [PASSED] 0x56C1 (DG2)
[13:54:34] [PASSED] 0x7D51 (METEORLAKE)
[13:54:34] [PASSED] 0x7DD1 (METEORLAKE)
[13:54:34] [PASSED] 0x7D41 (METEORLAKE)
[13:54:34] [PASSED] 0x7D67 (METEORLAKE)
[13:54:34] [PASSED] 0xB640 (METEORLAKE)
[13:54:34] [PASSED] 0x56A0 (DG2)
[13:54:34] [PASSED] 0x56A1 (DG2)
[13:54:34] [PASSED] 0x56A2 (DG2)
[13:54:34] [PASSED] 0x56BE (DG2)
[13:54:34] [PASSED] 0x56BF (DG2)
[13:54:34] [PASSED] 0x5690 (DG2)
[13:54:34] [PASSED] 0x5691 (DG2)
[13:54:34] [PASSED] 0x5692 (DG2)
[13:54:34] [PASSED] 0x56A5 (DG2)
[13:54:34] [PASSED] 0x56A6 (DG2)
[13:54:34] [PASSED] 0x56B0 (DG2)
[13:54:34] [PASSED] 0x56B1 (DG2)
[13:54:34] [PASSED] 0x56BA (DG2)
[13:54:34] [PASSED] 0x56BB (DG2)
[13:54:34] [PASSED] 0x56BC (DG2)
[13:54:34] [PASSED] 0x56BD (DG2)
[13:54:34] [PASSED] 0x5693 (DG2)
[13:54:34] [PASSED] 0x5694 (DG2)
[13:54:34] [PASSED] 0x5695 (DG2)
[13:54:34] [PASSED] 0x56A3 (DG2)
[13:54:34] [PASSED] 0x56A4 (DG2)
[13:54:34] [PASSED] 0x56B2 (DG2)
[13:54:34] [PASSED] 0x56B3 (DG2)
[13:54:34] [PASSED] 0x5696 (DG2)
[13:54:34] [PASSED] 0x5697 (DG2)
[13:54:34] [PASSED] 0xB69 (PVC)
[13:54:34] [PASSED] 0xB6E (PVC)
[13:54:34] [PASSED] 0xBD4 (PVC)
[13:54:34] [PASSED] 0xBD5 (PVC)
[13:54:34] [PASSED] 0xBD6 (PVC)
[13:54:34] [PASSED] 0xBD7 (PVC)
[13:54:34] [PASSED] 0xBD8 (PVC)
[13:54:34] [PASSED] 0xBD9 (PVC)
[13:54:34] [PASSED] 0xBDA (PVC)
[13:54:34] [PASSED] 0xBDB (PVC)
[13:54:34] [PASSED] 0xBE0 (PVC)
[13:54:34] [PASSED] 0xBE1 (PVC)
[13:54:34] [PASSED] 0xBE5 (PVC)
[13:54:34] [PASSED] 0x7D40 (METEORLAKE)
[13:54:34] [PASSED] 0x7D45 (METEORLAKE)
[13:54:34] [PASSED] 0x7D55 (METEORLAKE)
[13:54:34] [PASSED] 0x7D60 (METEORLAKE)
[13:54:34] [PASSED] 0x7DD5 (METEORLAKE)
[13:54:34] [PASSED] 0x6420 (LUNARLAKE)
[13:54:34] [PASSED] 0x64A0 (LUNARLAKE)
[13:54:34] [PASSED] 0x64B0 (LUNARLAKE)
[13:54:34] [PASSED] 0xE202 (BATTLEMAGE)
[13:54:34] [PASSED] 0xE209 (BATTLEMAGE)
[13:54:34] [PASSED] 0xE20B (BATTLEMAGE)
[13:54:34] [PASSED] 0xE20C (BATTLEMAGE)
[13:54:34] [PASSED] 0xE20D (BATTLEMAGE)
[13:54:34] [PASSED] 0xE210 (BATTLEMAGE)
[13:54:34] [PASSED] 0xE211 (BATTLEMAGE)
[13:54:34] [PASSED] 0xE212 (BATTLEMAGE)
[13:54:34] [PASSED] 0xE216 (BATTLEMAGE)
[13:54:34] [PASSED] 0xE220 (BATTLEMAGE)
[13:54:34] [PASSED] 0xE221 (BATTLEMAGE)
[13:54:34] [PASSED] 0xE222 (BATTLEMAGE)
[13:54:34] [PASSED] 0xE223 (BATTLEMAGE)
[13:54:34] [PASSED] 0xB080 (PANTHERLAKE)
[13:54:34] [PASSED] 0xB081 (PANTHERLAKE)
[13:54:34] [PASSED] 0xB082 (PANTHERLAKE)
[13:54:34] [PASSED] 0xB083 (PANTHERLAKE)
[13:54:34] [PASSED] 0xB084 (PANTHERLAKE)
[13:54:34] [PASSED] 0xB085 (PANTHERLAKE)
[13:54:34] [PASSED] 0xB086 (PANTHERLAKE)
[13:54:34] [PASSED] 0xB087 (PANTHERLAKE)
[13:54:34] [PASSED] 0xB08F (PANTHERLAKE)
[13:54:34] [PASSED] 0xB090 (PANTHERLAKE)
[13:54:34] [PASSED] 0xB0A0 (PANTHERLAKE)
[13:54:34] [PASSED] 0xB0B0 (PANTHERLAKE)
[13:54:34] [PASSED] 0xD740 (NOVALAKE_S)
[13:54:34] [PASSED] 0xD741 (NOVALAKE_S)
[13:54:34] [PASSED] 0xD742 (NOVALAKE_S)
[13:54:34] [PASSED] 0xD743 (NOVALAKE_S)
[13:54:34] [PASSED] 0xD744 (NOVALAKE_S)
[13:54:34] [PASSED] 0xD745 (NOVALAKE_S)
[13:54:34] [PASSED] 0x674C (CRESCENTISLAND)
[13:54:34] [PASSED] 0xFD80 (PANTHERLAKE)
[13:54:34] [PASSED] 0xFD81 (PANTHERLAKE)
[13:54:34] =============== [PASSED] check_platform_desc ===============
[13:54:34] ===================== [PASSED] xe_pci ======================
[13:54:34] =================== xe_rtp (2 subtests) ====================
[13:54:34] =============== xe_rtp_process_to_sr_tests  ================
[13:54:34] [PASSED] coalesce-same-reg
[13:54:34] [PASSED] no-match-no-add
[13:54:34] [PASSED] match-or
[13:54:34] [PASSED] match-or-xfail
[13:54:34] [PASSED] no-match-no-add-multiple-rules
[13:54:34] [PASSED] two-regs-two-entries
[13:54:34] [PASSED] clr-one-set-other
[13:54:34] [PASSED] set-field
[13:54:34] [PASSED] conflict-duplicate
[13:54:34] [PASSED] conflict-not-disjoint
[13:54:34] [PASSED] conflict-reg-type
[13:54:34] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[13:54:34] ================== xe_rtp_process_tests  ===================
[13:54:34] [PASSED] active1
[13:54:34] [PASSED] active2
[13:54:34] [PASSED] active-inactive
[13:54:34] [PASSED] inactive-active
[13:54:34] [PASSED] inactive-1st_or_active-inactive
[13:54:34] [PASSED] inactive-2nd_or_active-inactive
[13:54:34] [PASSED] inactive-last_or_active-inactive
[13:54:34] [PASSED] inactive-no_or_active-inactive
[13:54:34] ============== [PASSED] xe_rtp_process_tests ===============
[13:54:34] ===================== [PASSED] xe_rtp ======================
[13:54:34] ==================== xe_wa (1 subtest) =====================
[13:54:34] ======================== xe_wa_gt  =========================
[13:54:34] [PASSED] TIGERLAKE B0
[13:54:34] [PASSED] DG1 A0
[13:54:34] [PASSED] DG1 B0
[13:54:34] [PASSED] ALDERLAKE_S A0
[13:54:34] [PASSED] ALDERLAKE_S B0
[13:54:34] [PASSED] ALDERLAKE_S C0
[13:54:34] [PASSED] ALDERLAKE_S D0
[13:54:34] [PASSED] ALDERLAKE_P A0
[13:54:34] [PASSED] ALDERLAKE_P B0
[13:54:34] [PASSED] ALDERLAKE_P C0
[13:54:34] [PASSED] ALDERLAKE_S RPLS D0
[13:54:34] [PASSED] ALDERLAKE_P RPLU E0
[13:54:34] [PASSED] DG2 G10 C0
[13:54:34] [PASSED] DG2 G11 B1
[13:54:34] [PASSED] DG2 G12 A1
[13:54:34] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[13:54:34] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[13:54:34] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[13:54:34] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[13:54:34] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[13:54:34] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[13:54:34] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[13:54:34] ==================== [PASSED] xe_wa_gt =====================
[13:54:34] ====================== [PASSED] xe_wa ======================
[13:54:34] ============================================================
[13:54:34] Testing complete. Ran 510 tests: passed: 492, skipped: 18
[13:54:34] Elapsed time: 42.133s total, 4.292s configuring, 37.374s building, 0.458s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[13:54:34] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:54:35] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=25
[13:55:06] Starting KUnit Kernel (1/1)...
[13:55:06] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[13:55:06] ============ drm_test_pick_cmdline (2 subtests) ============
[13:55:06] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[13:55:06] =============== drm_test_pick_cmdline_named  ===============
[13:55:06] [PASSED] NTSC
[13:55:06] [PASSED] NTSC-J
[13:55:06] [PASSED] PAL
[13:55:06] [PASSED] PAL-M
[13:55:06] =========== [PASSED] drm_test_pick_cmdline_named ===========
[13:55:06] ============== [PASSED] drm_test_pick_cmdline ==============
[13:55:06] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[13:55:06] [ERROR] Test: drm_test_atomic_get_connector_for_encoder: missing expected subtest!
[13:55:06] ------------[ cut here ]------------
[13:55:06] WARNING: CPU: 0 PID: 28 at drivers/gpu/drm/drm_vblank.c:193 drm_crtc_vblank_crtc+0x94/0xa0
[13:55:06] drm-kunit-mock-device drm_test_drm_atomic_get_connector_for_encoder.drm-kunit-mock-device: [drm] drm_WARN_ON(!vblank)
[13:55:06] CPU: 0 UID: 0 PID: 28 Comm: kunit_try_catch Tainted: G        W        N  6.18.0-ge807bd2ceb31 #2 NONE
[13:55:06] Tainted: [W]=WARN, [N]=TEST
[13:55:06] Stack:
[13:55:06]  604c4d93 00000000 00000000 00000001
[13:55:06]  ffffff00 604c4d93 602dc1a4 00000009
[13:55:06]  000000c1 60047084 600237b9 d238bc20
[13:55:06] Call Trace:
[13:55:06]  [<602dc1a4>] ? drm_crtc_vblank_crtc+0x94/0xa0
[13:55:06]  [<60047084>] ? dump_stack_lvl+0x5b/0x77
[13:55:06]  [<600237b9>] ? _printk+0x0/0x65
[13:55:06]  [<6001f07a>] ? __warn.cold+0x71/0x10b
[13:55:06]  [<6001f1a8>] ? warn_slowpath_fmt+0x94/0xa1
[13:55:06]  [<602a2f50>] ? drm_atomic_get_connector_state+0x0/0x2f0
[13:55:06]  [<60055bf9>] ? um_set_signals+0x59/0x70
[13:55:06]  [<602d5720>] ? __drm_dev_dbg+0x0/0xb0
[13:55:06]  [<602dc1a4>] ? drm_crtc_vblank_crtc+0x94/0xa0
[13:55:06]  [<602dc162>] ? drm_crtc_vblank_crtc+0x52/0xa0
[13:55:06]  [<602dc3d7>] ? drm_calc_timestamping_constants+0x27/0x170
[13:55:06]  [<60055ba0>] ? um_set_signals+0x0/0x70
[13:55:06]  [<602dc3b0>] ? drm_calc_timestamping_constants+0x0/0x170
[13:55:06]  [<602d5720>] ? __drm_dev_dbg+0x0/0xb0
[13:55:06]  [<602ec9ac>] ? drm_atomic_helper_calc_timestamping_constants+0x6c/0x90
[13:55:06]  [<602efb8c>] ? drm_atomic_helper_commit_modeset_disables+0x43c/0x7f0
[13:55:06]  [<600ced00>] ? ktime_get+0x0/0x150
[13:55:06]  [<602cfe70>] ? drm_modeset_backoff+0x0/0x1d0
[13:55:06]  [<602f0853>] ? drm_atomic_helper_commit_tail+0x23/0xa0
[13:55:06]  [<602f1a94>] ? commit_tail+0xf4/0x180
[13:55:06]  [<60300b50>] ? drm_kunit_helper_enable_crtc_connector+0x0/0x140
[13:55:06]  [<602f1ccf>] ? drm_atomic_helper_commit+0x18f/0x1d0
[13:55:06]  [<602a5179>] ? drm_atomic_commit+0xb9/0xe0
[13:55:06]  [<6003dbfc>] ? __drm_printfn_info+0x0/0x23
[13:55:06]  [<60300eb0>] ? drm_test_drm_atomic_get_connector_for_encoder+0x220/0x590
[13:55:06]  [<6008b2c6>] ? finish_task_switch.isra.0+0x76/0x1b0
[13:55:06]  [<600cf280>] ? ktime_get_ts64+0x0/0x1a0
[13:55:06]  [<60082650>] ? to_kthread+0x0/0x40
[13:55:06]  [<6025306f>] ? kunit_try_run_case+0x7f/0x100
[13:55:06]  [<60082650>] ? to_kthread+0x0/0x40
[13:55:06]  [<602553c0>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[13:55:06]  [<602553d6>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[13:55:06]  [<60083035>] ? kthread+0xf5/0x270
[13:55:06]  [<60049595>] ? new_thread_handler+0x45/0x60
[13:55:06] ---[ end trace 0000000000000000 ]---
[13:55:06] ------------[ cut here ]------------
[13:55:06] WARNING: CPU: 0 PID: 28 at drivers/gpu/drm/drm_vblank.c:193 drm_crtc_vblank_crtc+0x94/0xa0
[13:55:06] drm-kunit-mock-device drm_test_drm_atomic_get_connector_for_encoder.drm-kunit-mock-device: [drm] drm_WARN_ON(!vblank)
[13:55:06] CPU: 0 UID: 0 PID: 28 Comm: kunit_try_catch Tainted: G        W        N  6.18.0-ge807bd2ceb31 #2 NONE
[13:55:06] Tainted: [W]=WARN, [N]=TEST
[13:55:06] Stack:
[13:55:06]  604c4d93 00000000 00000000 00000000
[13:55:06]  ffffff00 604c4d93 602dc1a4 00000009
[13:55:06]  000000c1 60047084 600237b9 d238bc90
[13:55:06] Call Trace:
[13:55:06]  [<602dc1a4>] ? drm_crtc_vblank_crtc+0x94/0xa0
[13:55:06]  [<60047084>] ? dump_stack_lvl+0x5b/0x77
[13:55:06]  [<600237b9>] ? _printk+0x0/0x65
[13:55:06]  [<6001f07a>] ? __warn.cold+0x71/0x10b
[13:55:06]  [<6001f1a8>] ? warn_slowpath_fmt+0x94/0xa1
[13:55:06]  [<602dc3d7>] ? drm_calc_timestamping_constants+0x27/0x170
[13:55:06]  [<60055ba0>] ? um_set_signals+0x0/0x70
[13:55:06]  [<602dc1a4>] ? drm_crtc_vblank_crtc+0x94/0xa0
[13:55:06]  [<602dc162>] ? drm_crtc_vblank_crtc+0x52/0xa0
[13:55:06]  [<602dc64a>] ? drm_crtc_send_vblank_event+0x1a/0x80
[13:55:06]  [<60055ba0>] ? um_set_signals+0x0/0x70
[13:55:06]  [<602ecffc>] ? drm_atomic_helper_fake_vblank+0x8c/0xd0
[13:55:06]  [<600ced00>] ? ktime_get+0x0/0x150
[13:55:06]  [<602cfe70>] ? drm_modeset_backoff+0x0/0x1d0
[13:55:06]  [<602f0888>] ? drm_atomic_helper_commit_tail+0x58/0xa0
[13:55:06]  [<602f1a94>] ? commit_tail+0xf4/0x180
[13:55:06]  [<60300b50>] ? drm_kunit_helper_enable_crtc_connector+0x0/0x140
[13:55:06]  [<602f1ccf>] ? drm_atomic_helper_commit+0x18f/0x1d0
[13:55:06]  [<602a5179>] ? drm_atomic_commit+0xb9/0xe0
[13:55:06]  [<6003dbfc>] ? __drm_printfn_info+0x0/0x23
[13:55:06]  [<60300eb0>] ? drm_test_drm_atomic_get_connector_for_encoder+0x220/0x590
[13:55:06]  [<6008b2c6>] ? finish_task_switch.isra.0+0x76/0x1b0
[13:55:06]  [<600cf280>] ? ktime_get_ts64+0x0/0x1a0
[13:55:06]  [<60082650>] ? to_kthread+0x0/0x40
[13:55:06]  [<6025306f>] ? kunit_try_run_case+0x7f/0x100
[13:55:06]  [<60082650>] ? to_kthread+0x0/0x40
[13:55:06]  [<602553c0>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[13:55:06]  [<602553d6>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[13:55:06]  [<60083035>] ? kthread+0xf5/0x270
[13:55:06]  [<60049595>] ? new_thread_handler+0x45/0x60
[13:55:06] ---[ end trace 0000000000000000 ]---
[13:55:06] 
[13:55:06] Pid: 28, comm: kunit_try_catch Tainted: G        W        N  6.18.0-ge807bd2ceb31
[13:55:06] RIP: 0033:drm_crtc_send_vblank_event+0x3f/0x80
[13:55:06] RSP: 00000000d238bd30  EFLAGS: 00010246
[13:55:06] RAX: 00000000061fb280 RBX: 0000000000000000 RCX: 00000000061fb280
[13:55:06] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[13:55:06] RBP: 0000000092aecd80 R08: 0000000000000000 R09: 0000000000000000
[13:55:06] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000092a48000
[13:55:06] R13: 0000000092aece00 R14: 0000000092880828 R15: 0000000000000001
[13:55:06] Kernel panic - not syncing: Segfault with no mm
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: drm_test_atomic_get_connector_for_encoder: missing subtest result line!
[13:55:06] # module: drm_atomic_test
[13:55:06] === [CRASHED] drm_test_atomic_get_connector_for_encoder ====
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] [ERROR] Test: main: missing expected subtest!
[13:55:06] [CRASHED] 
[13:55:06] ============================================================
[13:55:06] Testing complete. Ran 41 tests: passed: 5, crashed: 36, errors: 37
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
[13:55:06] Elapsed time: 32.044s total, 1.631s configuring, 30.095s building, 0.318s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


