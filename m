Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0466D41D50
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 15:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF0F10E243;
	Thu, 11 Dec 2025 15:19:46 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B58610E097;
 Thu, 11 Dec 2025 15:19:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_auxccs_dpt_wc_no_stolen_=28rev?=
 =?utf-8?q?3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Dec 2025 15:19:45 -0000
Message-ID: <176546638549.77464.16014580935489736518@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251211091712.19151-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251211091712.19151-1-tvrtko.ursulin@igalia.com>
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

Series: auxccs dpt wc no stolen (rev3)
URL   : https://patchwork.freedesktop.org/series/158764/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[15:18:11] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:18:15] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=25
[15:18:54] Starting KUnit Kernel (1/1)...
[15:18:54] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[15:18:54] ================== guc_buf (11 subtests) ===================
[15:18:54] [PASSED] test_smallest
[15:18:54] [PASSED] test_largest
[15:18:54] [PASSED] test_granular
[15:18:54] [PASSED] test_unique
[15:18:54] [PASSED] test_overlap
[15:18:54] [PASSED] test_reusable
[15:18:54] [PASSED] test_too_big
[15:18:54] [PASSED] test_flush
[15:18:54] [PASSED] test_lookup
[15:18:54] [PASSED] test_data
[15:18:54] [PASSED] test_class
[15:18:54] ===================== [PASSED] guc_buf =====================
[15:18:54] =================== guc_dbm (7 subtests) ===================
[15:18:54] [PASSED] test_empty
[15:18:54] [PASSED] test_default
[15:18:54] ======================== test_size  ========================
[15:18:54] [PASSED] 4
[15:18:54] [PASSED] 8
[15:18:54] [PASSED] 32
[15:18:54] [PASSED] 256
[15:18:54] ==================== [PASSED] test_size ====================
[15:18:54] ======================= test_reuse  ========================
[15:18:54] [PASSED] 4
[15:18:54] [PASSED] 8
[15:18:54] [PASSED] 32
[15:18:54] [PASSED] 256
[15:18:54] =================== [PASSED] test_reuse ====================
[15:18:54] =================== test_range_overlap  ====================
[15:18:54] [PASSED] 4
[15:18:54] [PASSED] 8
[15:18:54] [PASSED] 32
[15:18:54] [PASSED] 256
[15:18:54] =============== [PASSED] test_range_overlap ================
[15:18:54] =================== test_range_compact  ====================
[15:18:54] [PASSED] 4
[15:18:54] [PASSED] 8
[15:18:54] [PASSED] 32
[15:18:54] [PASSED] 256
[15:18:54] =============== [PASSED] test_range_compact ================
[15:18:54] ==================== test_range_spare  =====================
[15:18:54] [PASSED] 4
[15:18:54] [PASSED] 8
[15:18:54] [PASSED] 32
[15:18:54] [PASSED] 256
[15:18:54] ================ [PASSED] test_range_spare =================
[15:18:54] ===================== [PASSED] guc_dbm =====================
[15:18:54] =================== guc_idm (6 subtests) ===================
[15:18:54] [PASSED] bad_init
[15:18:54] [PASSED] no_init
[15:18:54] [PASSED] init_fini
[15:18:54] [PASSED] check_used
[15:18:54] [PASSED] check_quota
[15:18:54] [PASSED] check_all
[15:18:54] ===================== [PASSED] guc_idm =====================
[15:18:54] ================== no_relay (3 subtests) ===================
[15:18:54] [PASSED] xe_drops_guc2pf_if_not_ready
[15:18:54] [PASSED] xe_drops_guc2vf_if_not_ready
[15:18:54] [PASSED] xe_rejects_send_if_not_ready
[15:18:54] ==================== [PASSED] no_relay =====================
[15:18:54] ================== pf_relay (14 subtests) ==================
[15:18:54] [PASSED] pf_rejects_guc2pf_too_short
[15:18:54] [PASSED] pf_rejects_guc2pf_too_long
[15:18:54] [PASSED] pf_rejects_guc2pf_no_payload
[15:18:54] [PASSED] pf_fails_no_payload
[15:18:54] [PASSED] pf_fails_bad_origin
[15:18:54] [PASSED] pf_fails_bad_type
[15:18:54] [PASSED] pf_txn_reports_error
[15:18:54] [PASSED] pf_txn_sends_pf2guc
[15:18:54] [PASSED] pf_sends_pf2guc
[15:18:54] [SKIPPED] pf_loopback_nop
[15:18:54] [SKIPPED] pf_loopback_echo
[15:18:54] [SKIPPED] pf_loopback_fail
[15:18:54] [SKIPPED] pf_loopback_busy
[15:18:54] [SKIPPED] pf_loopback_retry
[15:18:54] ==================== [PASSED] pf_relay =====================
[15:18:54] ================== vf_relay (3 subtests) ===================
[15:18:54] [PASSED] vf_rejects_guc2vf_too_short
[15:18:54] [PASSED] vf_rejects_guc2vf_too_long
[15:18:54] [PASSED] vf_rejects_guc2vf_no_payload
[15:18:54] ==================== [PASSED] vf_relay =====================
[15:18:54] ================ pf_gt_config (6 subtests) =================
[15:18:54] [PASSED] fair_contexts_1vf
[15:18:54] [PASSED] fair_doorbells_1vf
[15:18:54] [PASSED] fair_ggtt_1vf
[15:18:54] ====================== fair_contexts  ======================
[15:18:54] [PASSED] 1 VF
[15:18:54] [PASSED] 2 VFs
[15:18:54] [PASSED] 3 VFs
[15:18:54] [PASSED] 4 VFs
[15:18:54] [PASSED] 5 VFs
[15:18:54] [PASSED] 6 VFs
[15:18:54] [PASSED] 7 VFs
[15:18:54] [PASSED] 8 VFs
[15:18:54] [PASSED] 9 VFs
[15:18:54] [PASSED] 10 VFs
[15:18:54] [PASSED] 11 VFs
[15:18:54] [PASSED] 12 VFs
[15:18:54] [PASSED] 13 VFs
[15:18:54] [PASSED] 14 VFs
[15:18:54] [PASSED] 15 VFs
[15:18:54] [PASSED] 16 VFs
[15:18:54] [PASSED] 17 VFs
[15:18:54] [PASSED] 18 VFs
[15:18:54] [PASSED] 19 VFs
[15:18:54] [PASSED] 20 VFs
[15:18:54] [PASSED] 21 VFs
[15:18:54] [PASSED] 22 VFs
[15:18:54] [PASSED] 23 VFs
[15:18:54] [PASSED] 24 VFs
[15:18:54] [PASSED] 25 VFs
[15:18:54] [PASSED] 26 VFs
[15:18:54] [PASSED] 27 VFs
[15:18:54] [PASSED] 28 VFs
[15:18:54] [PASSED] 29 VFs
[15:18:54] [PASSED] 30 VFs
[15:18:54] [PASSED] 31 VFs
[15:18:54] [PASSED] 32 VFs
[15:18:54] [PASSED] 33 VFs
[15:18:54] [PASSED] 34 VFs
[15:18:54] [PASSED] 35 VFs
[15:18:54] [PASSED] 36 VFs
[15:18:54] [PASSED] 37 VFs
[15:18:54] [PASSED] 38 VFs
[15:18:54] [PASSED] 39 VFs
[15:18:54] [PASSED] 40 VFs
[15:18:54] [PASSED] 41 VFs
[15:18:54] [PASSED] 42 VFs
[15:18:54] [PASSED] 43 VFs
[15:18:54] [PASSED] 44 VFs
[15:18:54] [PASSED] 45 VFs
[15:18:54] [PASSED] 46 VFs
[15:18:54] [PASSED] 47 VFs
[15:18:54] [PASSED] 48 VFs
[15:18:54] [PASSED] 49 VFs
[15:18:54] [PASSED] 50 VFs
[15:18:54] [PASSED] 51 VFs
[15:18:54] [PASSED] 52 VFs
[15:18:54] [PASSED] 53 VFs
[15:18:54] [PASSED] 54 VFs
[15:18:54] [PASSED] 55 VFs
[15:18:54] [PASSED] 56 VFs
[15:18:54] [PASSED] 57 VFs
[15:18:54] [PASSED] 58 VFs
[15:18:54] [PASSED] 59 VFs
[15:18:54] [PASSED] 60 VFs
[15:18:54] [PASSED] 61 VFs
[15:18:54] [PASSED] 62 VFs
[15:18:54] [PASSED] 63 VFs
[15:18:54] ================== [PASSED] fair_contexts ==================
[15:18:54] ===================== fair_doorbells  ======================
[15:18:54] [PASSED] 1 VF
[15:18:54] [PASSED] 2 VFs
[15:18:54] [PASSED] 3 VFs
[15:18:54] [PASSED] 4 VFs
[15:18:54] [PASSED] 5 VFs
[15:18:54] [PASSED] 6 VFs
[15:18:54] [PASSED] 7 VFs
[15:18:54] [PASSED] 8 VFs
[15:18:54] [PASSED] 9 VFs
[15:18:54] [PASSED] 10 VFs
[15:18:54] [PASSED] 11 VFs
[15:18:54] [PASSED] 12 VFs
[15:18:54] [PASSED] 13 VFs
[15:18:54] [PASSED] 14 VFs
[15:18:54] [PASSED] 15 VFs
[15:18:54] [PASSED] 16 VFs
[15:18:54] [PASSED] 17 VFs
[15:18:54] [PASSED] 18 VFs
[15:18:54] [PASSED] 19 VFs
[15:18:54] [PASSED] 20 VFs
[15:18:54] [PASSED] 21 VFs
[15:18:54] [PASSED] 22 VFs
[15:18:54] [PASSED] 23 VFs
[15:18:54] [PASSED] 24 VFs
[15:18:54] [PASSED] 25 VFs
[15:18:54] [PASSED] 26 VFs
[15:18:54] [PASSED] 27 VFs
[15:18:54] [PASSED] 28 VFs
[15:18:54] [PASSED] 29 VFs
[15:18:54] [PASSED] 30 VFs
[15:18:54] [PASSED] 31 VFs
[15:18:54] [PASSED] 32 VFs
[15:18:54] [PASSED] 33 VFs
[15:18:54] [PASSED] 34 VFs
[15:18:54] [PASSED] 35 VFs
[15:18:54] [PASSED] 36 VFs
[15:18:54] [PASSED] 37 VFs
[15:18:54] [PASSED] 38 VFs
[15:18:54] [PASSED] 39 VFs
[15:18:54] [PASSED] 40 VFs
[15:18:54] [PASSED] 41 VFs
[15:18:54] [PASSED] 42 VFs
[15:18:54] [PASSED] 43 VFs
[15:18:54] [PASSED] 44 VFs
[15:18:54] [PASSED] 45 VFs
[15:18:54] [PASSED] 46 VFs
[15:18:54] [PASSED] 47 VFs
[15:18:54] [PASSED] 48 VFs
[15:18:54] [PASSED] 49 VFs
[15:18:54] [PASSED] 50 VFs
[15:18:54] [PASSED] 51 VFs
[15:18:54] [PASSED] 52 VFs
[15:18:54] [PASSED] 53 VFs
[15:18:54] [PASSED] 54 VFs
[15:18:54] [PASSED] 55 VFs
[15:18:54] [PASSED] 56 VFs
[15:18:54] [PASSED] 57 VFs
[15:18:54] [PASSED] 58 VFs
[15:18:54] [PASSED] 59 VFs
[15:18:54] [PASSED] 60 VFs
[15:18:54] [PASSED] 61 VFs
[15:18:54] [PASSED] 62 VFs
[15:18:54] [PASSED] 63 VFs
[15:18:54] ================= [PASSED] fair_doorbells ==================
[15:18:54] ======================== fair_ggtt  ========================
[15:18:54] [PASSED] 1 VF
[15:18:54] [PASSED] 2 VFs
[15:18:54] [PASSED] 3 VFs
[15:18:54] [PASSED] 4 VFs
[15:18:54] [PASSED] 5 VFs
[15:18:54] [PASSED] 6 VFs
[15:18:54] [PASSED] 7 VFs
[15:18:54] [PASSED] 8 VFs
[15:18:54] [PASSED] 9 VFs
[15:18:54] [PASSED] 10 VFs
[15:18:54] [PASSED] 11 VFs
[15:18:54] [PASSED] 12 VFs
[15:18:54] [PASSED] 13 VFs
[15:18:54] [PASSED] 14 VFs
[15:18:54] [PASSED] 15 VFs
[15:18:54] [PASSED] 16 VFs
[15:18:54] [PASSED] 17 VFs
[15:18:54] [PASSED] 18 VFs
[15:18:54] [PASSED] 19 VFs
[15:18:54] [PASSED] 20 VFs
[15:18:54] [PASSED] 21 VFs
[15:18:54] [PASSED] 22 VFs
[15:18:54] [PASSED] 23 VFs
[15:18:54] [PASSED] 24 VFs
[15:18:54] [PASSED] 25 VFs
[15:18:54] [PASSED] 26 VFs
[15:18:54] [PASSED] 27 VFs
[15:18:54] [PASSED] 28 VFs
[15:18:54] [PASSED] 29 VFs
[15:18:54] [PASSED] 30 VFs
[15:18:54] [PASSED] 31 VFs
[15:18:54] [PASSED] 32 VFs
[15:18:54] [PASSED] 33 VFs
[15:18:54] [PASSED] 34 VFs
[15:18:54] [PASSED] 35 VFs
[15:18:54] [PASSED] 36 VFs
[15:18:54] [PASSED] 37 VFs
[15:18:54] [PASSED] 38 VFs
[15:18:54] [PASSED] 39 VFs
[15:18:54] [PASSED] 40 VFs
[15:18:54] [PASSED] 41 VFs
[15:18:54] [PASSED] 42 VFs
[15:18:54] [PASSED] 43 VFs
[15:18:54] [PASSED] 44 VFs
[15:18:54] [PASSED] 45 VFs
[15:18:54] [PASSED] 46 VFs
[15:18:54] [PASSED] 47 VFs
[15:18:54] [PASSED] 48 VFs
[15:18:54] [PASSED] 49 VFs
[15:18:54] [PASSED] 50 VFs
[15:18:54] [PASSED] 51 VFs
[15:18:54] [PASSED] 52 VFs
[15:18:54] [PASSED] 53 VFs
[15:18:54] [PASSED] 54 VFs
[15:18:54] [PASSED] 55 VFs
[15:18:54] [PASSED] 56 VFs
[15:18:54] [PASSED] 57 VFs
[15:18:54] [PASSED] 58 VFs
[15:18:54] [PASSED] 59 VFs
[15:18:54] [PASSED] 60 VFs
[15:18:54] [PASSED] 61 VFs
[15:18:54] [PASSED] 62 VFs
[15:18:54] [PASSED] 63 VFs
[15:18:54] ==================== [PASSED] fair_ggtt ====================
[15:18:54] ================== [PASSED] pf_gt_config ===================
[15:18:54] ===================== lmtt (1 subtest) =====================
[15:18:54] ======================== test_ops  =========================
[15:18:54] [PASSED] 2-level
[15:18:54] [PASSED] multi-level
[15:18:54] ==================== [PASSED] test_ops =====================
[15:18:54] ====================== [PASSED] lmtt =======================
[15:18:54] ================= pf_service (11 subtests) =================
[15:18:54] [PASSED] pf_negotiate_any
[15:18:54] [PASSED] pf_negotiate_base_match
[15:18:54] [PASSED] pf_negotiate_base_newer
[15:18:54] [PASSED] pf_negotiate_base_next
[15:18:54] [SKIPPED] pf_negotiate_base_older
[15:18:54] [PASSED] pf_negotiate_base_prev
[15:18:54] [PASSED] pf_negotiate_latest_match
[15:18:54] [PASSED] pf_negotiate_latest_newer
[15:18:54] [PASSED] pf_negotiate_latest_next
[15:18:54] [SKIPPED] pf_negotiate_latest_older
[15:18:54] [SKIPPED] pf_negotiate_latest_prev
[15:18:54] =================== [PASSED] pf_service ====================
[15:18:54] ================= xe_guc_g2g (2 subtests) ==================
[15:18:54] ============== xe_live_guc_g2g_kunit_default  ==============
[15:18:54] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[15:18:54] ============== xe_live_guc_g2g_kunit_allmem  ===============
[15:18:54] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[15:18:54] =================== [SKIPPED] xe_guc_g2g ===================
[15:18:54] =================== xe_mocs (2 subtests) ===================
[15:18:54] ================ xe_live_mocs_kernel_kunit  ================
[15:18:54] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[15:18:54] ================ xe_live_mocs_reset_kunit  =================
[15:18:54] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[15:18:54] ==================== [SKIPPED] xe_mocs =====================
[15:18:54] ================= xe_migrate (2 subtests) ==================
[15:18:54] ================= xe_migrate_sanity_kunit  =================
[15:18:54] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[15:18:54] ================== xe_validate_ccs_kunit  ==================
[15:18:54] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[15:18:54] =================== [SKIPPED] xe_migrate ===================
[15:18:54] ================== xe_dma_buf (1 subtest) ==================
[15:18:54] ==================== xe_dma_buf_kunit  =====================
[15:18:54] ================ [SKIPPED] xe_dma_buf_kunit ================
[15:18:54] =================== [SKIPPED] xe_dma_buf ===================
[15:18:54] ================= xe_bo_shrink (1 subtest) =================
[15:18:54] =================== xe_bo_shrink_kunit  ====================
[15:18:54] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[15:18:54] ================== [SKIPPED] xe_bo_shrink ==================
[15:18:54] ==================== xe_bo (2 subtests) ====================
[15:18:54] ================== xe_ccs_migrate_kunit  ===================
[15:18:54] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[15:18:54] ==================== xe_bo_evict_kunit  ====================
[15:18:54] =============== [SKIPPED] xe_bo_evict_kunit ================
[15:18:54] ===================== [SKIPPED] xe_bo ======================
[15:18:54] ==================== args (11 subtests) ====================
[15:18:54] [PASSED] count_args_test
[15:18:54] [PASSED] call_args_example
[15:18:54] [PASSED] call_args_test
[15:18:54] [PASSED] drop_first_arg_example
[15:18:54] [PASSED] drop_first_arg_test
[15:18:54] [PASSED] first_arg_example
[15:18:54] [PASSED] first_arg_test
[15:18:54] [PASSED] last_arg_example
[15:18:54] [PASSED] last_arg_test
[15:18:54] [PASSED] pick_arg_example
[15:18:54] [PASSED] sep_comma_example
[15:18:54] ====================== [PASSED] args =======================
[15:18:54] =================== xe_pci (3 subtests) ====================
[15:18:54] ==================== check_graphics_ip  ====================
[15:18:54] [PASSED] 12.00 Xe_LP
[15:18:54] [PASSED] 12.10 Xe_LP+
[15:18:54] [PASSED] 12.55 Xe_HPG
[15:18:54] [PASSED] 12.60 Xe_HPC
[15:18:54] [PASSED] 12.70 Xe_LPG
[15:18:54] [PASSED] 12.71 Xe_LPG
[15:18:54] [PASSED] 12.74 Xe_LPG+
[15:18:54] [PASSED] 20.01 Xe2_HPG
[15:18:54] [PASSED] 20.02 Xe2_HPG
[15:18:54] [PASSED] 20.04 Xe2_LPG
[15:18:54] [PASSED] 30.00 Xe3_LPG
[15:18:54] [PASSED] 30.01 Xe3_LPG
[15:18:54] [PASSED] 30.03 Xe3_LPG
[15:18:54] [PASSED] 30.04 Xe3_LPG
[15:18:54] [PASSED] 30.05 Xe3_LPG
[15:18:54] [PASSED] 35.11 Xe3p_XPC
[15:18:54] ================ [PASSED] check_graphics_ip ================
[15:18:54] ===================== check_media_ip  ======================
[15:18:54] [PASSED] 12.00 Xe_M
[15:18:54] [PASSED] 12.55 Xe_HPM
[15:18:54] [PASSED] 13.00 Xe_LPM+
[15:18:54] [PASSED] 13.01 Xe2_HPM
[15:18:54] [PASSED] 20.00 Xe2_LPM
[15:18:54] [PASSED] 30.00 Xe3_LPM
[15:18:54] [PASSED] 30.02 Xe3_LPM
[15:18:54] [PASSED] 35.00 Xe3p_LPM
[15:18:54] [PASSED] 35.03 Xe3p_HPM
[15:18:54] ================= [PASSED] check_media_ip ==================
[15:18:54] =================== check_platform_desc  ===================
[15:18:54] [PASSED] 0x9A60 (TIGERLAKE)
[15:18:54] [PASSED] 0x9A68 (TIGERLAKE)
[15:18:54] [PASSED] 0x9A70 (TIGERLAKE)
[15:18:54] [PASSED] 0x9A40 (TIGERLAKE)
[15:18:54] [PASSED] 0x9A49 (TIGERLAKE)
[15:18:54] [PASSED] 0x9A59 (TIGERLAKE)
[15:18:54] [PASSED] 0x9A78 (TIGERLAKE)
[15:18:54] [PASSED] 0x9AC0 (TIGERLAKE)
[15:18:54] [PASSED] 0x9AC9 (TIGERLAKE)
[15:18:54] [PASSED] 0x9AD9 (TIGERLAKE)
[15:18:54] [PASSED] 0x9AF8 (TIGERLAKE)
[15:18:54] [PASSED] 0x4C80 (ROCKETLAKE)
[15:18:54] [PASSED] 0x4C8A (ROCKETLAKE)
[15:18:54] [PASSED] 0x4C8B (ROCKETLAKE)
[15:18:54] [PASSED] 0x4C8C (ROCKETLAKE)
[15:18:54] [PASSED] 0x4C90 (ROCKETLAKE)
[15:18:54] [PASSED] 0x4C9A (ROCKETLAKE)
[15:18:54] [PASSED] 0x4680 (ALDERLAKE_S)
[15:18:54] [PASSED] 0x4682 (ALDERLAKE_S)
[15:18:54] [PASSED] 0x4688 (ALDERLAKE_S)
[15:18:54] [PASSED] 0x468A (ALDERLAKE_S)
[15:18:54] [PASSED] 0x468B (ALDERLAKE_S)
[15:18:54] [PASSED] 0x4690 (ALDERLAKE_S)
[15:18:54] [PASSED] 0x4692 (ALDERLAKE_S)
[15:18:54] [PASSED] 0x4693 (ALDERLAKE_S)
[15:18:54] [PASSED] 0x46A0 (ALDERLAKE_P)
[15:18:54] [PASSED] 0x46A1 (ALDERLAKE_P)
[15:18:54] [PASSED] 0x46A2 (ALDERLAKE_P)
[15:18:54] [PASSED] 0x46A3 (ALDERLAKE_P)
[15:18:54] [PASSED] 0x46A6 (ALDERLAKE_P)
[15:18:54] [PASSED] 0x46A8 (ALDERLAKE_P)
[15:18:54] [PASSED] 0x46AA (ALDERLAKE_P)
[15:18:54] [PASSED] 0x462A (ALDERLAKE_P)
[15:18:54] [PASSED] 0x4626 (ALDERLAKE_P)
[15:18:54] [PASSED] 0x4628 (ALDERLAKE_P)
[15:18:54] [PASSED] 0x46B0 (ALDERLAKE_P)
stty: 'standard input': Inappropriate ioctl for device
[15:18:54] [PASSED] 0x46B1 (ALDERLAKE_P)
[15:18:54] [PASSED] 0x46B2 (ALDERLAKE_P)
[15:18:54] [PASSED] 0x46B3 (ALDERLAKE_P)
[15:18:54] [PASSED] 0x46C0 (ALDERLAKE_P)
[15:18:54] [PASSED] 0x46C1 (ALDERLAKE_P)
[15:18:54] [PASSED] 0x46C2 (ALDERLAKE_P)
[15:18:54] [PASSED] 0x46C3 (ALDERLAKE_P)
[15:18:54] [PASSED] 0x46D0 (ALDERLAKE_N)
[15:18:54] [PASSED] 0x46D1 (ALDERLAKE_N)
[15:18:54] [PASSED] 0x46D2 (ALDERLAKE_N)
[15:18:54] [PASSED] 0x46D3 (ALDERLAKE_N)
[15:18:54] [PASSED] 0x46D4 (ALDERLAKE_N)
[15:18:54] [PASSED] 0xA721 (ALDERLAKE_P)
[15:18:54] [PASSED] 0xA7A1 (ALDERLAKE_P)
[15:18:54] [PASSED] 0xA7A9 (ALDERLAKE_P)
[15:18:54] [PASSED] 0xA7AC (ALDERLAKE_P)
[15:18:54] [PASSED] 0xA7AD (ALDERLAKE_P)
[15:18:54] [PASSED] 0xA720 (ALDERLAKE_P)
[15:18:54] [PASSED] 0xA7A0 (ALDERLAKE_P)
[15:18:54] [PASSED] 0xA7A8 (ALDERLAKE_P)
[15:18:54] [PASSED] 0xA7AA (ALDERLAKE_P)
[15:18:54] [PASSED] 0xA7AB (ALDERLAKE_P)
[15:18:54] [PASSED] 0xA780 (ALDERLAKE_S)
[15:18:54] [PASSED] 0xA781 (ALDERLAKE_S)
[15:18:54] [PASSED] 0xA782 (ALDERLAKE_S)
[15:18:54] [PASSED] 0xA783 (ALDERLAKE_S)
[15:18:54] [PASSED] 0xA788 (ALDERLAKE_S)
[15:18:54] [PASSED] 0xA789 (ALDERLAKE_S)
[15:18:54] [PASSED] 0xA78A (ALDERLAKE_S)
[15:18:54] [PASSED] 0xA78B (ALDERLAKE_S)
[15:18:54] [PASSED] 0x4905 (DG1)
[15:18:54] [PASSED] 0x4906 (DG1)
[15:18:54] [PASSED] 0x4907 (DG1)
[15:18:54] [PASSED] 0x4908 (DG1)
[15:18:54] [PASSED] 0x4909 (DG1)
[15:18:54] [PASSED] 0x56C0 (DG2)
[15:18:54] [PASSED] 0x56C2 (DG2)
[15:18:54] [PASSED] 0x56C1 (DG2)
[15:18:54] [PASSED] 0x7D51 (METEORLAKE)
[15:18:54] [PASSED] 0x7DD1 (METEORLAKE)
[15:18:54] [PASSED] 0x7D41 (METEORLAKE)
[15:18:54] [PASSED] 0x7D67 (METEORLAKE)
[15:18:54] [PASSED] 0xB640 (METEORLAKE)
[15:18:54] [PASSED] 0x56A0 (DG2)
[15:18:54] [PASSED] 0x56A1 (DG2)
[15:18:54] [PASSED] 0x56A2 (DG2)
[15:18:54] [PASSED] 0x56BE (DG2)
[15:18:54] [PASSED] 0x56BF (DG2)
[15:18:54] [PASSED] 0x5690 (DG2)
[15:18:54] [PASSED] 0x5691 (DG2)
[15:18:54] [PASSED] 0x5692 (DG2)
[15:18:54] [PASSED] 0x56A5 (DG2)
[15:18:54] [PASSED] 0x56A6 (DG2)
[15:18:54] [PASSED] 0x56B0 (DG2)
[15:18:54] [PASSED] 0x56B1 (DG2)
[15:18:54] [PASSED] 0x56BA (DG2)
[15:18:54] [PASSED] 0x56BB (DG2)
[15:18:54] [PASSED] 0x56BC (DG2)
[15:18:54] [PASSED] 0x56BD (DG2)
[15:18:54] [PASSED] 0x5693 (DG2)
[15:18:54] [PASSED] 0x5694 (DG2)
[15:18:54] [PASSED] 0x5695 (DG2)
[15:18:54] [PASSED] 0x56A3 (DG2)
[15:18:54] [PASSED] 0x56A4 (DG2)
[15:18:54] [PASSED] 0x56B2 (DG2)
[15:18:54] [PASSED] 0x56B3 (DG2)
[15:18:54] [PASSED] 0x5696 (DG2)
[15:18:54] [PASSED] 0x5697 (DG2)
[15:18:54] [PASSED] 0xB69 (PVC)
[15:18:54] [PASSED] 0xB6E (PVC)
[15:18:54] [PASSED] 0xBD4 (PVC)
[15:18:54] [PASSED] 0xBD5 (PVC)
[15:18:54] [PASSED] 0xBD6 (PVC)
[15:18:54] [PASSED] 0xBD7 (PVC)
[15:18:54] [PASSED] 0xBD8 (PVC)
[15:18:54] [PASSED] 0xBD9 (PVC)
[15:18:54] [PASSED] 0xBDA (PVC)
[15:18:54] [PASSED] 0xBDB (PVC)
[15:18:54] [PASSED] 0xBE0 (PVC)
[15:18:54] [PASSED] 0xBE1 (PVC)
[15:18:54] [PASSED] 0xBE5 (PVC)
[15:18:54] [PASSED] 0x7D40 (METEORLAKE)
[15:18:54] [PASSED] 0x7D45 (METEORLAKE)
[15:18:54] [PASSED] 0x7D55 (METEORLAKE)
[15:18:54] [PASSED] 0x7D60 (METEORLAKE)
[15:18:54] [PASSED] 0x7DD5 (METEORLAKE)
[15:18:54] [PASSED] 0x6420 (LUNARLAKE)
[15:18:54] [PASSED] 0x64A0 (LUNARLAKE)
[15:18:54] [PASSED] 0x64B0 (LUNARLAKE)
[15:18:54] [PASSED] 0xE202 (BATTLEMAGE)
[15:18:54] [PASSED] 0xE209 (BATTLEMAGE)
[15:18:54] [PASSED] 0xE20B (BATTLEMAGE)
[15:18:54] [PASSED] 0xE20C (BATTLEMAGE)
[15:18:54] [PASSED] 0xE20D (BATTLEMAGE)
[15:18:54] [PASSED] 0xE210 (BATTLEMAGE)
[15:18:54] [PASSED] 0xE211 (BATTLEMAGE)
[15:18:54] [PASSED] 0xE212 (BATTLEMAGE)
[15:18:54] [PASSED] 0xE216 (BATTLEMAGE)
[15:18:54] [PASSED] 0xE220 (BATTLEMAGE)
[15:18:54] [PASSED] 0xE221 (BATTLEMAGE)
[15:18:54] [PASSED] 0xE222 (BATTLEMAGE)
[15:18:54] [PASSED] 0xE223 (BATTLEMAGE)
[15:18:54] [PASSED] 0xB080 (PANTHERLAKE)
[15:18:54] [PASSED] 0xB081 (PANTHERLAKE)
[15:18:54] [PASSED] 0xB082 (PANTHERLAKE)
[15:18:54] [PASSED] 0xB083 (PANTHERLAKE)
[15:18:54] [PASSED] 0xB084 (PANTHERLAKE)
[15:18:54] [PASSED] 0xB085 (PANTHERLAKE)
[15:18:54] [PASSED] 0xB086 (PANTHERLAKE)
[15:18:54] [PASSED] 0xB087 (PANTHERLAKE)
[15:18:54] [PASSED] 0xB08F (PANTHERLAKE)
[15:18:54] [PASSED] 0xB090 (PANTHERLAKE)
[15:18:54] [PASSED] 0xB0A0 (PANTHERLAKE)
[15:18:54] [PASSED] 0xB0B0 (PANTHERLAKE)
[15:18:54] [PASSED] 0xD740 (NOVALAKE_S)
[15:18:54] [PASSED] 0xD741 (NOVALAKE_S)
[15:18:54] [PASSED] 0xD742 (NOVALAKE_S)
[15:18:54] [PASSED] 0xD743 (NOVALAKE_S)
[15:18:54] [PASSED] 0xD744 (NOVALAKE_S)
[15:18:54] [PASSED] 0xD745 (NOVALAKE_S)
[15:18:54] [PASSED] 0x674C (CRESCENTISLAND)
[15:18:54] [PASSED] 0xFD80 (PANTHERLAKE)
[15:18:54] [PASSED] 0xFD81 (PANTHERLAKE)
[15:18:54] =============== [PASSED] check_platform_desc ===============
[15:18:54] ===================== [PASSED] xe_pci ======================
[15:18:54] =================== xe_rtp (2 subtests) ====================
[15:18:54] =============== xe_rtp_process_to_sr_tests  ================
[15:18:54] [PASSED] coalesce-same-reg
[15:18:54] [PASSED] no-match-no-add
[15:18:54] [PASSED] match-or
[15:18:54] [PASSED] match-or-xfail
[15:18:54] [PASSED] no-match-no-add-multiple-rules
[15:18:54] [PASSED] two-regs-two-entries
[15:18:54] [PASSED] clr-one-set-other
[15:18:54] [PASSED] set-field
[15:18:54] [PASSED] conflict-duplicate
[15:18:54] [PASSED] conflict-not-disjoint
[15:18:54] [PASSED] conflict-reg-type
[15:18:54] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[15:18:54] ================== xe_rtp_process_tests  ===================
[15:18:54] [PASSED] active1
[15:18:54] [PASSED] active2
[15:18:54] [PASSED] active-inactive
[15:18:54] [PASSED] inactive-active
[15:18:54] [PASSED] inactive-1st_or_active-inactive
[15:18:54] [PASSED] inactive-2nd_or_active-inactive
[15:18:54] [PASSED] inactive-last_or_active-inactive
[15:18:54] [PASSED] inactive-no_or_active-inactive
[15:18:54] ============== [PASSED] xe_rtp_process_tests ===============
[15:18:54] ===================== [PASSED] xe_rtp ======================
[15:18:54] ==================== xe_wa (1 subtest) =====================
[15:18:54] ======================== xe_wa_gt  =========================
[15:18:54] [PASSED] TIGERLAKE B0
[15:18:54] [PASSED] DG1 A0
[15:18:54] [PASSED] DG1 B0
[15:18:54] [PASSED] ALDERLAKE_S A0
[15:18:54] [PASSED] ALDERLAKE_S B0
[15:18:54] [PASSED] ALDERLAKE_S C0
[15:18:54] [PASSED] ALDERLAKE_S D0
[15:18:54] [PASSED] ALDERLAKE_P A0
[15:18:54] [PASSED] ALDERLAKE_P B0
[15:18:54] [PASSED] ALDERLAKE_P C0
[15:18:54] [PASSED] ALDERLAKE_S RPLS D0
[15:18:54] [PASSED] ALDERLAKE_P RPLU E0
[15:18:54] [PASSED] DG2 G10 C0
[15:18:54] [PASSED] DG2 G11 B1
[15:18:54] [PASSED] DG2 G12 A1
[15:18:54] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[15:18:54] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[15:18:54] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[15:18:54] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[15:18:54] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[15:18:54] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[15:18:54] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[15:18:54] ==================== [PASSED] xe_wa_gt =====================
[15:18:54] ====================== [PASSED] xe_wa ======================
[15:18:54] ============================================================
[15:18:54] Testing complete. Ran 510 tests: passed: 492, skipped: 18
[15:18:54] Elapsed time: 43.231s total, 4.335s configuring, 38.378s building, 0.471s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[15:18:54] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:18:56] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=25
[15:19:26] Starting KUnit Kernel (1/1)...
[15:19:26] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[15:19:26] ============ drm_test_pick_cmdline (2 subtests) ============
[15:19:26] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[15:19:26] =============== drm_test_pick_cmdline_named  ===============
[15:19:26] [PASSED] NTSC
[15:19:26] [PASSED] NTSC-J
[15:19:26] [PASSED] PAL
[15:19:26] [PASSED] PAL-M
[15:19:26] =========== [PASSED] drm_test_pick_cmdline_named ===========
[15:19:26] ============== [PASSED] drm_test_pick_cmdline ==============
[15:19:26] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[15:19:26] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[15:19:26] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[15:19:26] =========== drm_validate_clone_mode (2 subtests) ===========
[15:19:26] ============== drm_test_check_in_clone_mode  ===============
[15:19:26] [PASSED] in_clone_mode
[15:19:26] [PASSED] not_in_clone_mode
[15:19:26] ========== [PASSED] drm_test_check_in_clone_mode ===========
[15:19:26] =============== drm_test_check_valid_clones  ===============
[15:19:26] [PASSED] not_in_clone_mode
[15:19:26] [PASSED] valid_clone
[15:19:26] [PASSED] invalid_clone
[15:19:26] =========== [PASSED] drm_test_check_valid_clones ===========
[15:19:26] ============= [PASSED] drm_validate_clone_mode =============
[15:19:26] ============= drm_validate_modeset (1 subtest) =============
[15:19:26] [PASSED] drm_test_check_connector_changed_modeset
[15:19:26] ============== [PASSED] drm_validate_modeset ===============
[15:19:26] ====== drm_test_bridge_get_current_state (2 subtests) ======
[15:19:26] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[15:19:26] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[15:19:26] ======== [PASSED] drm_test_bridge_get_current_state ========
[15:19:26] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[15:19:26] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[15:19:26] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[15:19:26] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[15:19:26] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[15:19:26] ============== drm_bridge_alloc (2 subtests) ===============
[15:19:26] [PASSED] drm_test_drm_bridge_alloc_basic
[15:19:26] [PASSED] drm_test_drm_bridge_alloc_get_put
[15:19:26] ================ [PASSED] drm_bridge_alloc =================
[15:19:26] ================== drm_buddy (8 subtests) ==================
[15:19:26] [PASSED] drm_test_buddy_alloc_limit
[15:19:26] [PASSED] drm_test_buddy_alloc_optimistic
[15:19:26] [PASSED] drm_test_buddy_alloc_pessimistic
[15:19:26] [PASSED] drm_test_buddy_alloc_pathological
[15:19:26] [PASSED] drm_test_buddy_alloc_contiguous
[15:19:26] [PASSED] drm_test_buddy_alloc_clear
[15:19:27] [PASSED] drm_test_buddy_alloc_range_bias
[15:19:27] [PASSED] drm_test_buddy_fragmentation_performance
[15:19:27] ==================== [PASSED] drm_buddy ====================
[15:19:27] ============= drm_cmdline_parser (40 subtests) =============
[15:19:27] [PASSED] drm_test_cmdline_force_d_only
[15:19:27] [PASSED] drm_test_cmdline_force_D_only_dvi
[15:19:27] [PASSED] drm_test_cmdline_force_D_only_hdmi
[15:19:27] [PASSED] drm_test_cmdline_force_D_only_not_digital
[15:19:27] [PASSED] drm_test_cmdline_force_e_only
[15:19:27] [PASSED] drm_test_cmdline_res
[15:19:27] [PASSED] drm_test_cmdline_res_vesa
[15:19:27] [PASSED] drm_test_cmdline_res_vesa_rblank
[15:19:27] [PASSED] drm_test_cmdline_res_rblank
[15:19:27] [PASSED] drm_test_cmdline_res_bpp
[15:19:27] [PASSED] drm_test_cmdline_res_refresh
[15:19:27] [PASSED] drm_test_cmdline_res_bpp_refresh
[15:19:27] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[15:19:27] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[15:19:27] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[15:19:27] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[15:19:27] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[15:19:27] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[15:19:27] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[15:19:27] [PASSED] drm_test_cmdline_res_margins_force_on
[15:19:27] [PASSED] drm_test_cmdline_res_vesa_margins
[15:19:27] [PASSED] drm_test_cmdline_name
[15:19:27] [PASSED] drm_test_cmdline_name_bpp
[15:19:27] [PASSED] drm_test_cmdline_name_option
[15:19:27] [PASSED] drm_test_cmdline_name_bpp_option
[15:19:27] [PASSED] drm_test_cmdline_rotate_0
[15:19:27] [PASSED] drm_test_cmdline_rotate_90
[15:19:27] [PASSED] drm_test_cmdline_rotate_180
[15:19:27] [PASSED] drm_test_cmdline_rotate_270
[15:19:27] [PASSED] drm_test_cmdline_hmirror
[15:19:27] [PASSED] drm_test_cmdline_vmirror
[15:19:27] [PASSED] drm_test_cmdline_margin_options
[15:19:27] [PASSED] drm_test_cmdline_multiple_options
[15:19:27] [PASSED] drm_test_cmdline_bpp_extra_and_option
[15:19:27] [PASSED] drm_test_cmdline_extra_and_option
[15:19:27] [PASSED] drm_test_cmdline_freestanding_options
[15:19:27] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[15:19:27] [PASSED] drm_test_cmdline_panel_orientation
[15:19:27] ================ drm_test_cmdline_invalid  =================
[15:19:27] [PASSED] margin_only
[15:19:27] [PASSED] interlace_only
[15:19:27] [PASSED] res_missing_x
[15:19:27] [PASSED] res_missing_y
[15:19:27] [PASSED] res_bad_y
[15:19:27] [PASSED] res_missing_y_bpp
[15:19:27] [PASSED] res_bad_bpp
[15:19:27] [PASSED] res_bad_refresh
[15:19:27] [PASSED] res_bpp_refresh_force_on_off
[15:19:27] [PASSED] res_invalid_mode
[15:19:27] [PASSED] res_bpp_wrong_place_mode
[15:19:27] [PASSED] name_bpp_refresh
[15:19:27] [PASSED] name_refresh
[15:19:27] [PASSED] name_refresh_wrong_mode
[15:19:27] [PASSED] name_refresh_invalid_mode
[15:19:27] [PASSED] rotate_multiple
[15:19:27] [PASSED] rotate_invalid_val
[15:19:27] [PASSED] rotate_truncated
[15:19:27] [PASSED] invalid_option
[15:19:27] [PASSED] invalid_tv_option
[15:19:27] [PASSED] truncated_tv_option
[15:19:27] ============ [PASSED] drm_test_cmdline_invalid =============
[15:19:27] =============== drm_test_cmdline_tv_options  ===============
[15:19:27] [PASSED] NTSC
[15:19:27] [PASSED] NTSC_443
[15:19:27] [PASSED] NTSC_J
[15:19:27] [PASSED] PAL
[15:19:27] [PASSED] PAL_M
[15:19:27] [PASSED] PAL_N
[15:19:27] [PASSED] SECAM
[15:19:27] [PASSED] MONO_525
[15:19:27] [PASSED] MONO_625
[15:19:27] =========== [PASSED] drm_test_cmdline_tv_options ===========
[15:19:27] =============== [PASSED] drm_cmdline_parser ================
[15:19:27] ========== drmm_connector_hdmi_init (20 subtests) ==========
[15:19:27] [PASSED] drm_test_connector_hdmi_init_valid
[15:19:27] [PASSED] drm_test_connector_hdmi_init_bpc_8
[15:19:27] [PASSED] drm_test_connector_hdmi_init_bpc_10
[15:19:27] [PASSED] drm_test_connector_hdmi_init_bpc_12
[15:19:27] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[15:19:27] [PASSED] drm_test_connector_hdmi_init_bpc_null
[15:19:27] [PASSED] drm_test_connector_hdmi_init_formats_empty
[15:19:27] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[15:19:27] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[15:19:27] [PASSED] supported_formats=0x9 yuv420_allowed=1
[15:19:27] [PASSED] supported_formats=0x9 yuv420_allowed=0
[15:19:27] [PASSED] supported_formats=0x3 yuv420_allowed=1
[15:19:27] [PASSED] supported_formats=0x3 yuv420_allowed=0
[15:19:27] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[15:19:27] [PASSED] drm_test_connector_hdmi_init_null_ddc
[15:19:27] [PASSED] drm_test_connector_hdmi_init_null_product
[15:19:27] [PASSED] drm_test_connector_hdmi_init_null_vendor
[15:19:27] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[15:19:27] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[15:19:27] [PASSED] drm_test_connector_hdmi_init_product_valid
[15:19:27] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[15:19:27] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[15:19:27] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[15:19:27] ========= drm_test_connector_hdmi_init_type_valid  =========
[15:19:27] [PASSED] HDMI-A
[15:19:27] [PASSED] HDMI-B
[15:19:27] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[15:19:27] ======== drm_test_connector_hdmi_init_type_invalid  ========
[15:19:27] [PASSED] Unknown
[15:19:27] [PASSED] VGA
[15:19:27] [PASSED] DVI-I
[15:19:27] [PASSED] DVI-D
[15:19:27] [PASSED] DVI-A
[15:19:27] [PASSED] Composite
[15:19:27] [PASSED] SVIDEO
[15:19:27] [PASSED] LVDS
[15:19:27] [PASSED] Component
[15:19:27] [PASSED] DIN
[15:19:27] [PASSED] DP
[15:19:27] [PASSED] TV
[15:19:27] [PASSED] eDP
[15:19:27] [PASSED] Virtual
[15:19:27] [PASSED] DSI
[15:19:27] [PASSED] DPI
[15:19:27] [PASSED] Writeback
[15:19:27] [PASSED] SPI
[15:19:27] [PASSED] USB
[15:19:27] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[15:19:27] ============ [PASSED] drmm_connector_hdmi_init =============
[15:19:27] ============= drmm_connector_init (3 subtests) =============
[15:19:27] [PASSED] drm_test_drmm_connector_init
[15:19:27] [PASSED] drm_test_drmm_connector_init_null_ddc
[15:19:27] ========= drm_test_drmm_connector_init_type_valid  =========
[15:19:27] [PASSED] Unknown
[15:19:27] [PASSED] VGA
[15:19:27] [PASSED] DVI-I
[15:19:27] [PASSED] DVI-D
[15:19:27] [PASSED] DVI-A
[15:19:27] [PASSED] Composite
[15:19:27] [PASSED] SVIDEO
[15:19:27] [PASSED] LVDS
[15:19:27] [PASSED] Component
[15:19:27] [PASSED] DIN
[15:19:27] [PASSED] DP
[15:19:27] [PASSED] HDMI-A
[15:19:27] [PASSED] HDMI-B
[15:19:27] [PASSED] TV
[15:19:27] [PASSED] eDP
[15:19:27] [PASSED] Virtual
[15:19:27] [PASSED] DSI
[15:19:27] [PASSED] DPI
[15:19:27] [PASSED] Writeback
[15:19:27] [PASSED] SPI
[15:19:27] [PASSED] USB
[15:19:27] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[15:19:27] =============== [PASSED] drmm_connector_init ===============
[15:19:27] ========= drm_connector_dynamic_init (6 subtests) ==========
[15:19:27] [PASSED] drm_test_drm_connector_dynamic_init
[15:19:27] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[15:19:27] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[15:19:27] [PASSED] drm_test_drm_connector_dynamic_init_properties
[15:19:27] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[15:19:27] [PASSED] Unknown
[15:19:27] [PASSED] VGA
[15:19:27] [PASSED] DVI-I
[15:19:27] [PASSED] DVI-D
[15:19:27] [PASSED] DVI-A
[15:19:27] [PASSED] Composite
[15:19:27] [PASSED] SVIDEO
[15:19:27] [PASSED] LVDS
[15:19:27] [PASSED] Component
[15:19:27] [PASSED] DIN
[15:19:27] [PASSED] DP
[15:19:27] [PASSED] HDMI-A
[15:19:27] [PASSED] HDMI-B
[15:19:27] [PASSED] TV
[15:19:27] [PASSED] eDP
[15:19:27] [PASSED] Virtual
[15:19:27] [PASSED] DSI
[15:19:27] [PASSED] DPI
[15:19:27] [PASSED] Writeback
[15:19:27] [PASSED] SPI
[15:19:27] [PASSED] USB
[15:19:27] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[15:19:27] ======== drm_test_drm_connector_dynamic_init_name  =========
[15:19:27] [PASSED] Unknown
[15:19:27] [PASSED] VGA
[15:19:27] [PASSED] DVI-I
[15:19:27] [PASSED] DVI-D
[15:19:27] [PASSED] DVI-A
[15:19:27] [PASSED] Composite
[15:19:27] [PASSED] SVIDEO
[15:19:27] [PASSED] LVDS
[15:19:27] [PASSED] Component
[15:19:27] [PASSED] DIN
[15:19:27] [PASSED] DP
[15:19:27] [PASSED] HDMI-A
[15:19:27] [PASSED] HDMI-B
[15:19:27] [PASSED] TV
[15:19:27] [PASSED] eDP
[15:19:27] [PASSED] Virtual
[15:19:27] [PASSED] DSI
[15:19:27] [PASSED] DPI
[15:19:27] [PASSED] Writeback
[15:19:27] [PASSED] SPI
[15:19:27] [PASSED] USB
[15:19:27] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[15:19:27] =========== [PASSED] drm_connector_dynamic_init ============
[15:19:27] ==== drm_connector_dynamic_register_early (4 subtests) =====
[15:19:27] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[15:19:27] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[15:19:27] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[15:19:27] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[15:19:27] ====== [PASSED] drm_connector_dynamic_register_early =======
[15:19:27] ======= drm_connector_dynamic_register (7 subtests) ========
[15:19:27] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[15:19:27] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[15:19:27] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[15:19:27] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[15:19:27] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[15:19:27] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[15:19:27] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[15:19:27] ========= [PASSED] drm_connector_dynamic_register ==========
[15:19:27] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[15:19:27] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[15:19:27] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[15:19:27] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[15:19:27] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[15:19:27] ========== drm_test_get_tv_mode_from_name_valid  ===========
[15:19:27] [PASSED] NTSC
[15:19:27] [PASSED] NTSC-443
[15:19:27] [PASSED] NTSC-J
[15:19:27] [PASSED] PAL
[15:19:27] [PASSED] PAL-M
[15:19:27] [PASSED] PAL-N
[15:19:27] [PASSED] SECAM
[15:19:27] [PASSED] Mono
[15:19:27] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[15:19:27] [PASSED] drm_test_get_tv_mode_from_name_truncated
[15:19:27] ============ [PASSED] drm_get_tv_mode_from_name ============
[15:19:27] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[15:19:27] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[15:19:27] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[15:19:27] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[15:19:27] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[15:19:27] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[15:19:27] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[15:19:27] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[15:19:27] [PASSED] VIC 96
[15:19:27] [PASSED] VIC 97
[15:19:27] [PASSED] VIC 101
[15:19:27] [PASSED] VIC 102
[15:19:27] [PASSED] VIC 106
[15:19:27] [PASSED] VIC 107
[15:19:27] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[15:19:27] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[15:19:27] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[15:19:27] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[15:19:27] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[15:19:27] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[15:19:27] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[15:19:27] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[15:19:27] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[15:19:27] [PASSED] Automatic
[15:19:27] [PASSED] Full
[15:19:27] [PASSED] Limited 16:235
[15:19:27] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[15:19:27] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[15:19:27] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[15:19:27] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[15:19:27] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[15:19:27] [PASSED] RGB
[15:19:27] [PASSED] YUV 4:2:0
[15:19:27] [PASSED] YUV 4:2:2
[15:19:27] [PASSED] YUV 4:4:4
[15:19:27] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[15:19:27] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[15:19:27] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[15:19:27] ============= drm_damage_helper (21 subtests) ==============
[15:19:27] [PASSED] drm_test_damage_iter_no_damage
[15:19:27] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[15:19:27] [PASSED] drm_test_damage_iter_no_damage_src_moved
[15:19:27] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[15:19:27] [PASSED] drm_test_damage_iter_no_damage_not_visible
[15:19:27] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[15:19:27] [PASSED] drm_test_damage_iter_no_damage_no_fb
[15:19:27] [PASSED] drm_test_damage_iter_simple_damage
[15:19:27] [PASSED] drm_test_damage_iter_single_damage
[15:19:27] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[15:19:27] [PASSED] drm_test_damage_iter_single_damage_outside_src
[15:19:27] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[15:19:27] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[15:19:27] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[15:19:27] [PASSED] drm_test_damage_iter_single_damage_src_moved
[15:19:27] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[15:19:27] [PASSED] drm_test_damage_iter_damage
[15:19:27] [PASSED] drm_test_damage_iter_damage_one_intersect
[15:19:27] [PASSED] drm_test_damage_iter_damage_one_outside
[15:19:27] [PASSED] drm_test_damage_iter_damage_src_moved
[15:19:27] [PASSED] drm_test_damage_iter_damage_not_visible
[15:19:27] ================ [PASSED] drm_damage_helper ================
[15:19:27] ============== drm_dp_mst_helper (3 subtests) ==============
[15:19:27] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[15:19:27] [PASSED] Clock 154000 BPP 30 DSC disabled
[15:19:27] [PASSED] Clock 234000 BPP 30 DSC disabled
[15:19:27] [PASSED] Clock 297000 BPP 24 DSC disabled
[15:19:27] [PASSED] Clock 332880 BPP 24 DSC enabled
[15:19:27] [PASSED] Clock 324540 BPP 24 DSC enabled
[15:19:27] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[15:19:27] ============== drm_test_dp_mst_calc_pbn_div  ===============
[15:19:27] [PASSED] Link rate 2000000 lane count 4
[15:19:27] [PASSED] Link rate 2000000 lane count 2
[15:19:27] [PASSED] Link rate 2000000 lane count 1
[15:19:27] [PASSED] Link rate 1350000 lane count 4
[15:19:27] [PASSED] Link rate 1350000 lane count 2
[15:19:27] [PASSED] Link rate 1350000 lane count 1
[15:19:27] [PASSED] Link rate 1000000 lane count 4
[15:19:27] [PASSED] Link rate 1000000 lane count 2
[15:19:27] [PASSED] Link rate 1000000 lane count 1
[15:19:27] [PASSED] Link rate 810000 lane count 4
[15:19:27] [PASSED] Link rate 810000 lane count 2
[15:19:27] [PASSED] Link rate 810000 lane count 1
[15:19:27] [PASSED] Link rate 540000 lane count 4
[15:19:27] [PASSED] Link rate 540000 lane count 2
[15:19:27] [PASSED] Link rate 540000 lane count 1
[15:19:27] [PASSED] Link rate 270000 lane count 4
[15:19:27] [PASSED] Link rate 270000 lane count 2
[15:19:27] [PASSED] Link rate 270000 lane count 1
[15:19:27] [PASSED] Link rate 162000 lane count 4
[15:19:27] [PASSED] Link rate 162000 lane count 2
[15:19:27] [PASSED] Link rate 162000 lane count 1
[15:19:27] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[15:19:27] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[15:19:27] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[15:19:27] [PASSED] DP_POWER_UP_PHY with port number
[15:19:27] [PASSED] DP_POWER_DOWN_PHY with port number
[15:19:27] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[15:19:27] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[15:19:27] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[15:19:27] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[15:19:27] [PASSED] DP_QUERY_PAYLOAD with port number
[15:19:27] [PASSED] DP_QUERY_PAYLOAD with VCPI
[15:19:27] [PASSED] DP_REMOTE_DPCD_READ with port number
[15:19:27] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[15:19:27] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[15:19:27] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[15:19:27] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[15:19:27] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[15:19:27] [PASSED] DP_REMOTE_I2C_READ with port number
[15:19:27] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[15:19:27] [PASSED] DP_REMOTE_I2C_READ with transactions array
[15:19:27] [PASSED] DP_REMOTE_I2C_WRITE with port number
[15:19:27] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[15:19:27] [PASSED] DP_REMOTE_I2C_WRITE with data array
[15:19:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[15:19:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[15:19:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[15:19:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[15:19:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[15:19:27] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[15:19:27] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[15:19:27] ================ [PASSED] drm_dp_mst_helper ================
[15:19:27] ================== drm_exec (7 subtests) ===================
[15:19:27] [PASSED] sanitycheck
[15:19:27] [PASSED] test_lock
[15:19:27] [PASSED] test_lock_unlock
[15:19:27] [PASSED] test_duplicates
[15:19:27] [PASSED] test_prepare
[15:19:27] [PASSED] test_prepare_array
[15:19:27] [PASSED] test_multiple_loops
[15:19:27] ==================== [PASSED] drm_exec =====================
[15:19:27] =========== drm_format_helper_test (17 subtests) ===========
[15:19:27] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[15:19:27] [PASSED] single_pixel_source_buffer
[15:19:27] [PASSED] single_pixel_clip_rectangle
[15:19:27] [PASSED] well_known_colors
[15:19:27] [PASSED] destination_pitch
[15:19:27] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[15:19:27] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[15:19:27] [PASSED] single_pixel_source_buffer
[15:19:27] [PASSED] single_pixel_clip_rectangle
[15:19:27] [PASSED] well_known_colors
[15:19:27] [PASSED] destination_pitch
[15:19:27] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[15:19:27] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[15:19:27] [PASSED] single_pixel_source_buffer
[15:19:27] [PASSED] single_pixel_clip_rectangle
[15:19:27] [PASSED] well_known_colors
[15:19:27] [PASSED] destination_pitch
[15:19:27] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[15:19:27] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[15:19:27] [PASSED] single_pixel_source_buffer
[15:19:27] [PASSED] single_pixel_clip_rectangle
[15:19:27] [PASSED] well_known_colors
[15:19:27] [PASSED] destination_pitch
[15:19:27] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[15:19:27] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[15:19:27] [PASSED] single_pixel_source_buffer
[15:19:27] [PASSED] single_pixel_clip_rectangle
[15:19:27] [PASSED] well_known_colors
[15:19:27] [PASSED] destination_pitch
[15:19:27] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[15:19:27] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[15:19:27] [PASSED] single_pixel_source_buffer
[15:19:27] [PASSED] single_pixel_clip_rectangle
[15:19:27] [PASSED] well_known_colors
[15:19:27] [PASSED] destination_pitch
[15:19:27] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[15:19:27] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[15:19:27] [PASSED] single_pixel_source_buffer
[15:19:27] [PASSED] single_pixel_clip_rectangle
[15:19:27] [PASSED] well_known_colors
[15:19:27] [PASSED] destination_pitch
[15:19:27] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[15:19:27] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[15:19:27] [PASSED] single_pixel_source_buffer
[15:19:27] [PASSED] single_pixel_clip_rectangle
[15:19:27] [PASSED] well_known_colors
[15:19:27] [PASSED] destination_pitch
[15:19:27] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[15:19:27] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[15:19:27] [PASSED] single_pixel_source_buffer
[15:19:27] [PASSED] single_pixel_clip_rectangle
[15:19:27] [PASSED] well_known_colors
[15:19:27] [PASSED] destination_pitch
[15:19:27] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[15:19:27] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[15:19:27] [PASSED] single_pixel_source_buffer
[15:19:27] [PASSED] single_pixel_clip_rectangle
[15:19:27] [PASSED] well_known_colors
[15:19:27] [PASSED] destination_pitch
[15:19:27] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[15:19:27] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[15:19:27] [PASSED] single_pixel_source_buffer
[15:19:27] [PASSED] single_pixel_clip_rectangle
[15:19:27] [PASSED] well_known_colors
[15:19:27] [PASSED] destination_pitch
[15:19:27] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[15:19:27] ============== drm_test_fb_xrgb8888_to_mono  ===============
[15:19:27] [PASSED] single_pixel_source_buffer
[15:19:27] [PASSED] single_pixel_clip_rectangle
[15:19:27] [PASSED] well_known_colors
[15:19:27] [PASSED] destination_pitch
[15:19:27] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[15:19:27] ==================== drm_test_fb_swab  =====================
[15:19:27] [PASSED] single_pixel_source_buffer
[15:19:27] [PASSED] single_pixel_clip_rectangle
[15:19:27] [PASSED] well_known_colors
[15:19:27] [PASSED] destination_pitch
[15:19:27] ================ [PASSED] drm_test_fb_swab =================
[15:19:27] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[15:19:27] [PASSED] single_pixel_source_buffer
[15:19:27] [PASSED] single_pixel_clip_rectangle
[15:19:27] [PASSED] well_known_colors
[15:19:27] [PASSED] destination_pitch
[15:19:27] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[15:19:27] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[15:19:27] [PASSED] single_pixel_source_buffer
[15:19:27] [PASSED] single_pixel_clip_rectangle
[15:19:27] [PASSED] well_known_colors
[15:19:27] [PASSED] destination_pitch
[15:19:27] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[15:19:27] ================= drm_test_fb_clip_offset  =================
[15:19:27] [PASSED] pass through
[15:19:27] [PASSED] horizontal offset
[15:19:27] [PASSED] vertical offset
[15:19:27] [PASSED] horizontal and vertical offset
[15:19:27] [PASSED] horizontal offset (custom pitch)
[15:19:27] [PASSED] vertical offset (custom pitch)
[15:19:27] [PASSED] horizontal and vertical offset (custom pitch)
[15:19:27] ============= [PASSED] drm_test_fb_clip_offset =============
[15:19:27] =================== drm_test_fb_memcpy  ====================
[15:19:27] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[15:19:27] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[15:19:27] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[15:19:27] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[15:19:27] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[15:19:27] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[15:19:27] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[15:19:27] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[15:19:27] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[15:19:27] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[15:19:27] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[15:19:27] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[15:19:27] =============== [PASSED] drm_test_fb_memcpy ================
[15:19:27] ============= [PASSED] drm_format_helper_test ==============
[15:19:27] ================= drm_format (18 subtests) =================
[15:19:27] [PASSED] drm_test_format_block_width_invalid
[15:19:27] [PASSED] drm_test_format_block_width_one_plane
[15:19:27] [PASSED] drm_test_format_block_width_two_plane
[15:19:27] [PASSED] drm_test_format_block_width_three_plane
[15:19:27] [PASSED] drm_test_format_block_width_tiled
[15:19:27] [PASSED] drm_test_format_block_height_invalid
[15:19:27] [PASSED] drm_test_format_block_height_one_plane
[15:19:27] [PASSED] drm_test_format_block_height_two_plane
[15:19:27] [PASSED] drm_test_format_block_height_three_plane
[15:19:27] [PASSED] drm_test_format_block_height_tiled
[15:19:27] [PASSED] drm_test_format_min_pitch_invalid
[15:19:27] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[15:19:27] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[15:19:27] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[15:19:27] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[15:19:27] [PASSED] drm_test_format_min_pitch_two_plane
[15:19:27] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[15:19:27] [PASSED] drm_test_format_min_pitch_tiled
[15:19:27] =================== [PASSED] drm_format ====================
[15:19:27] ============== drm_framebuffer (10 subtests) ===============
[15:19:27] ========== drm_test_framebuffer_check_src_coords  ==========
[15:19:27] [PASSED] Success: source fits into fb
[15:19:27] [PASSED] Fail: overflowing fb with x-axis coordinate
[15:19:27] [PASSED] Fail: overflowing fb with y-axis coordinate
[15:19:27] [PASSED] Fail: overflowing fb with source width
[15:19:27] [PASSED] Fail: overflowing fb with source height
[15:19:27] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[15:19:27] [PASSED] drm_test_framebuffer_cleanup
[15:19:27] =============== drm_test_framebuffer_create  ===============
[15:19:27] [PASSED] ABGR8888 normal sizes
[15:19:27] [PASSED] ABGR8888 max sizes
[15:19:27] [PASSED] ABGR8888 pitch greater than min required
[15:19:27] [PASSED] ABGR8888 pitch less than min required
[15:19:27] [PASSED] ABGR8888 Invalid width
[15:19:27] [PASSED] ABGR8888 Invalid buffer handle
[15:19:27] [PASSED] No pixel format
[15:19:27] [PASSED] ABGR8888 Width 0
[15:19:27] [PASSED] ABGR8888 Height 0
[15:19:27] [PASSED] ABGR8888 Out of bound height * pitch combination
[15:19:27] [PASSED] ABGR8888 Large buffer offset
[15:19:27] [PASSED] ABGR8888 Buffer offset for inexistent plane
[15:19:27] [PASSED] ABGR8888 Invalid flag
[15:19:27] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[15:19:27] [PASSED] ABGR8888 Valid buffer modifier
[15:19:27] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[15:19:27] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[15:19:27] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[15:19:27] [PASSED] NV12 Normal sizes
[15:19:27] [PASSED] NV12 Max sizes
[15:19:27] [PASSED] NV12 Invalid pitch
[15:19:27] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[15:19:27] [PASSED] NV12 different  modifier per-plane
[15:19:27] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[15:19:27] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[15:19:27] [PASSED] NV12 Modifier for inexistent plane
[15:19:27] [PASSED] NV12 Handle for inexistent plane
[15:19:27] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[15:19:27] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[15:19:27] [PASSED] YVU420 Normal sizes
[15:19:27] [PASSED] YVU420 Max sizes
[15:19:27] [PASSED] YVU420 Invalid pitch
[15:19:27] [PASSED] YVU420 Different pitches
[15:19:27] [PASSED] YVU420 Different buffer offsets/pitches
[15:19:27] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[15:19:27] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[15:19:27] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[15:19:27] [PASSED] YVU420 Valid modifier
[15:19:27] [PASSED] YVU420 Different modifiers per plane
[15:19:27] [PASSED] YVU420 Modifier for inexistent plane
[15:19:27] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[15:19:27] [PASSED] X0L2 Normal sizes
[15:19:27] [PASSED] X0L2 Max sizes
[15:19:27] [PASSED] X0L2 Invalid pitch
[15:19:27] [PASSED] X0L2 Pitch greater than minimum required
[15:19:27] [PASSED] X0L2 Handle for inexistent plane
[15:19:27] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[15:19:27] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[15:19:27] [PASSED] X0L2 Valid modifier
[15:19:27] [PASSED] X0L2 Modifier for inexistent plane
[15:19:27] =========== [PASSED] drm_test_framebuffer_create ===========
[15:19:27] [PASSED] drm_test_framebuffer_free
[15:19:27] [PASSED] drm_test_framebuffer_init
[15:19:27] [PASSED] drm_test_framebuffer_init_bad_format
[15:19:27] [PASSED] drm_test_framebuffer_init_dev_mismatch
[15:19:27] [PASSED] drm_test_framebuffer_lookup
[15:19:27] [PASSED] drm_test_framebuffer_lookup_inexistent
[15:19:27] [PASSED] drm_test_framebuffer_modifiers_not_supported
[15:19:27] ================= [PASSED] drm_framebuffer =================
[15:19:27] ================ drm_gem_shmem (8 subtests) ================
[15:19:27] [PASSED] drm_gem_shmem_test_obj_create
[15:19:27] [PASSED] drm_gem_shmem_test_obj_create_private
[15:19:27] [PASSED] drm_gem_shmem_test_pin_pages
[15:19:27] [PASSED] drm_gem_shmem_test_vmap
[15:19:27] [PASSED] drm_gem_shmem_test_get_pages_sgt
[15:19:27] [PASSED] drm_gem_shmem_test_get_sg_table
[15:19:27] [PASSED] drm_gem_shmem_test_madvise
[15:19:27] [PASSED] drm_gem_shmem_test_purge
[15:19:27] ================== [PASSED] drm_gem_shmem ==================
[15:19:27] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[15:19:27] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[15:19:27] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[15:19:27] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[15:19:27] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[15:19:27] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[15:19:27] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[15:19:27] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[15:19:27] [PASSED] Automatic
[15:19:27] [PASSED] Full
[15:19:27] [PASSED] Limited 16:235
[15:19:27] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[15:19:27] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[15:19:27] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[15:19:27] [PASSED] drm_test_check_disable_connector
[15:19:27] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[15:19:27] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[15:19:27] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[15:19:27] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[15:19:27] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[15:19:27] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[15:19:27] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[15:19:27] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[15:19:27] [PASSED] drm_test_check_output_bpc_dvi
[15:19:27] [PASSED] drm_test_check_output_bpc_format_vic_1
[15:19:27] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[15:19:27] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[15:19:27] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[15:19:27] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[15:19:27] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[15:19:27] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[15:19:27] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[15:19:27] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[15:19:27] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[15:19:27] [PASSED] drm_test_check_broadcast_rgb_value
[15:19:27] [PASSED] drm_test_check_bpc_8_value
[15:19:27] [PASSED] drm_test_check_bpc_10_value
[15:19:27] [PASSED] drm_test_check_bpc_12_value
[15:19:27] [PASSED] drm_test_check_format_value
[15:19:27] [PASSED] drm_test_check_tmds_char_value
[15:19:27] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[15:19:27] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[15:19:27] [PASSED] drm_test_check_mode_valid
[15:19:27] [PASSED] drm_test_check_mode_valid_reject
[15:19:27] [PASSED] drm_test_check_mode_valid_reject_rate
[15:19:27] [PASSED] drm_test_check_mode_valid_reject_max_clock
[15:19:27] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[15:19:27] ================= drm_managed (2 subtests) =================
[15:19:27] [PASSED] drm_test_managed_release_action
[15:19:27] [PASSED] drm_test_managed_run_action
[15:19:27] =================== [PASSED] drm_managed ===================
[15:19:27] =================== drm_mm (6 subtests) ====================
[15:19:27] [PASSED] drm_test_mm_init
[15:19:27] [PASSED] drm_test_mm_debug
[15:19:27] [PASSED] drm_test_mm_align32
[15:19:27] [PASSED] drm_test_mm_align64
[15:19:27] [PASSED] drm_test_mm_lowest
[15:19:27] [PASSED] drm_test_mm_highest
[15:19:27] ===================== [PASSED] drm_mm ======================
[15:19:27] ============= drm_modes_analog_tv (5 subtests) =============
[15:19:27] [PASSED] drm_test_modes_analog_tv_mono_576i
[15:19:27] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[15:19:27] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[15:19:27] [PASSED] drm_test_modes_analog_tv_pal_576i
[15:19:27] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[15:19:27] =============== [PASSED] drm_modes_analog_tv ===============
[15:19:27] ============== drm_plane_helper (2 subtests) ===============
[15:19:27] =============== drm_test_check_plane_state  ================
[15:19:27] [PASSED] clipping_simple
[15:19:27] [PASSED] clipping_rotate_reflect
[15:19:27] [PASSED] positioning_simple
[15:19:27] [PASSED] upscaling
[15:19:27] [PASSED] downscaling
[15:19:27] [PASSED] rounding1
[15:19:27] [PASSED] rounding2
[15:19:27] [PASSED] rounding3
[15:19:27] [PASSED] rounding4
[15:19:27] =========== [PASSED] drm_test_check_plane_state ============
[15:19:27] =========== drm_test_check_invalid_plane_state  ============
[15:19:27] [PASSED] positioning_invalid
[15:19:27] [PASSED] upscaling_invalid
[15:19:27] [PASSED] downscaling_invalid
[15:19:27] ======= [PASSED] drm_test_check_invalid_plane_state ========
[15:19:27] ================ [PASSED] drm_plane_helper =================
[15:19:27] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[15:19:27] ====== drm_test_connector_helper_tv_get_modes_check  =======
[15:19:27] [PASSED] None
[15:19:27] [PASSED] PAL
[15:19:27] [PASSED] NTSC
[15:19:27] [PASSED] Both, NTSC Default
[15:19:27] [PASSED] Both, PAL Default
[15:19:27] [PASSED] Both, NTSC Default, with PAL on command-line
[15:19:27] [PASSED] Both, PAL Default, with NTSC on command-line
[15:19:27] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[15:19:27] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[15:19:27] ================== drm_rect (9 subtests) ===================
[15:19:27] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[15:19:27] [PASSED] drm_test_rect_clip_scaled_not_clipped
[15:19:27] [PASSED] drm_test_rect_clip_scaled_clipped
[15:19:27] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[15:19:27] ================= drm_test_rect_intersect  =================
[15:19:27] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[15:19:27] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[15:19:27] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[15:19:27] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[15:19:27] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[15:19:27] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[15:19:27] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[15:19:27] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[15:19:27] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[15:19:27] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[15:19:27] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[15:19:27] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[15:19:27] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[15:19:27] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[15:19:27] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[15:19:27] ============= [PASSED] drm_test_rect_intersect =============
[15:19:27] ================ drm_test_rect_calc_hscale  ================
[15:19:27] [PASSED] normal use
[15:19:27] [PASSED] out of max range
[15:19:27] [PASSED] out of min range
[15:19:27] [PASSED] zero dst
[15:19:27] [PASSED] negative src
[15:19:27] [PASSED] negative dst
[15:19:27] ============ [PASSED] drm_test_rect_calc_hscale ============
[15:19:27] ================ drm_test_rect_calc_vscale  ================
[15:19:27] [PASSED] normal use
stty: 'standard input': Inappropriate ioctl for device
[15:19:27] [PASSED] out of max range
[15:19:27] [PASSED] out of min range
[15:19:27] [PASSED] zero dst
[15:19:27] [PASSED] negative src
[15:19:27] [PASSED] negative dst
[15:19:27] ============ [PASSED] drm_test_rect_calc_vscale ============
[15:19:27] ================== drm_test_rect_rotate  ===================
[15:19:27] [PASSED] reflect-x
[15:19:27] [PASSED] reflect-y
[15:19:27] [PASSED] rotate-0
[15:19:27] [PASSED] rotate-90
[15:19:27] [PASSED] rotate-180
[15:19:27] [PASSED] rotate-270
[15:19:27] ============== [PASSED] drm_test_rect_rotate ===============
[15:19:27] ================ drm_test_rect_rotate_inv  =================
[15:19:27] [PASSED] reflect-x
[15:19:27] [PASSED] reflect-y
[15:19:27] [PASSED] rotate-0
[15:19:27] [PASSED] rotate-90
[15:19:27] [PASSED] rotate-180
[15:19:27] [PASSED] rotate-270
[15:19:27] ============ [PASSED] drm_test_rect_rotate_inv =============
[15:19:27] ==================== [PASSED] drm_rect =====================
[15:19:27] ============ drm_sysfb_modeset_test (1 subtest) ============
[15:19:27] ============ drm_test_sysfb_build_fourcc_list  =============
[15:19:27] [PASSED] no native formats
[15:19:27] [PASSED] XRGB8888 as native format
[15:19:27] [PASSED] remove duplicates
[15:19:27] [PASSED] convert alpha formats
[15:19:27] [PASSED] random formats
[15:19:27] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[15:19:27] ============= [PASSED] drm_sysfb_modeset_test ==============
[15:19:27] ================== drm_fixp (2 subtests) ===================
[15:19:27] [PASSED] drm_test_int2fixp
[15:19:27] [PASSED] drm_test_sm2fixp
[15:19:27] ==================== [PASSED] drm_fixp =====================
[15:19:27] ============================================================
[15:19:27] Testing complete. Ran 624 tests: passed: 624
[15:19:27] Elapsed time: 32.212s total, 1.659s configuring, 30.086s building, 0.447s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[15:19:27] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:19:28] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=25
[15:19:38] Starting KUnit Kernel (1/1)...
[15:19:38] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[15:19:38] ================= ttm_device (5 subtests) ==================
[15:19:38] [PASSED] ttm_device_init_basic
[15:19:38] [PASSED] ttm_device_init_multiple
[15:19:38] [PASSED] ttm_device_fini_basic
[15:19:38] [PASSED] ttm_device_init_no_vma_man
[15:19:38] ================== ttm_device_init_pools  ==================
[15:19:38] [PASSED] No DMA allocations, no DMA32 required
[15:19:38] [PASSED] DMA allocations, DMA32 required
[15:19:38] [PASSED] No DMA allocations, DMA32 required
[15:19:38] [PASSED] DMA allocations, no DMA32 required
[15:19:38] ============== [PASSED] ttm_device_init_pools ==============
[15:19:38] =================== [PASSED] ttm_device ====================
[15:19:38] ================== ttm_pool (8 subtests) ===================
[15:19:38] ================== ttm_pool_alloc_basic  ===================
[15:19:38] [PASSED] One page
[15:19:38] [PASSED] More than one page
[15:19:38] [PASSED] Above the allocation limit
[15:19:38] [PASSED] One page, with coherent DMA mappings enabled
[15:19:38] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[15:19:38] ============== [PASSED] ttm_pool_alloc_basic ===============
[15:19:38] ============== ttm_pool_alloc_basic_dma_addr  ==============
[15:19:38] [PASSED] One page
[15:19:38] [PASSED] More than one page
[15:19:38] [PASSED] Above the allocation limit
[15:19:38] [PASSED] One page, with coherent DMA mappings enabled
[15:19:38] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[15:19:38] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[15:19:38] [PASSED] ttm_pool_alloc_order_caching_match
[15:19:38] [PASSED] ttm_pool_alloc_caching_mismatch
[15:19:38] [PASSED] ttm_pool_alloc_order_mismatch
[15:19:38] [PASSED] ttm_pool_free_dma_alloc
[15:19:38] [PASSED] ttm_pool_free_no_dma_alloc
[15:19:38] [PASSED] ttm_pool_fini_basic
[15:19:38] ==================== [PASSED] ttm_pool =====================
[15:19:38] ================ ttm_resource (8 subtests) =================
[15:19:38] ================= ttm_resource_init_basic  =================
[15:19:38] [PASSED] Init resource in TTM_PL_SYSTEM
[15:19:38] [PASSED] Init resource in TTM_PL_VRAM
[15:19:38] [PASSED] Init resource in a private placement
[15:19:38] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[15:19:38] ============= [PASSED] ttm_resource_init_basic =============
[15:19:38] [PASSED] ttm_resource_init_pinned
[15:19:38] [PASSED] ttm_resource_fini_basic
[15:19:38] [PASSED] ttm_resource_manager_init_basic
[15:19:38] [PASSED] ttm_resource_manager_usage_basic
[15:19:38] [PASSED] ttm_resource_manager_set_used_basic
[15:19:38] [PASSED] ttm_sys_man_alloc_basic
[15:19:38] [PASSED] ttm_sys_man_free_basic
[15:19:38] ================== [PASSED] ttm_resource ===================
[15:19:38] =================== ttm_tt (15 subtests) ===================
[15:19:38] ==================== ttm_tt_init_basic  ====================
[15:19:38] [PASSED] Page-aligned size
[15:19:38] [PASSED] Extra pages requested
[15:19:38] ================ [PASSED] ttm_tt_init_basic ================
[15:19:38] [PASSED] ttm_tt_init_misaligned
[15:19:38] [PASSED] ttm_tt_fini_basic
[15:19:38] [PASSED] ttm_tt_fini_sg
[15:19:38] [PASSED] ttm_tt_fini_shmem
[15:19:38] [PASSED] ttm_tt_create_basic
[15:19:38] [PASSED] ttm_tt_create_invalid_bo_type
[15:19:38] [PASSED] ttm_tt_create_ttm_exists
[15:19:38] [PASSED] ttm_tt_create_failed
[15:19:38] [PASSED] ttm_tt_destroy_basic
[15:19:38] [PASSED] ttm_tt_populate_null_ttm
[15:19:38] [PASSED] ttm_tt_populate_populated_ttm
[15:19:38] [PASSED] ttm_tt_unpopulate_basic
[15:19:38] [PASSED] ttm_tt_unpopulate_empty_ttm
[15:19:38] [PASSED] ttm_tt_swapin_basic
[15:19:38] ===================== [PASSED] ttm_tt ======================
[15:19:38] =================== ttm_bo (14 subtests) ===================
[15:19:38] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[15:19:38] [PASSED] Cannot be interrupted and sleeps
[15:19:38] [PASSED] Cannot be interrupted, locks straight away
[15:19:38] [PASSED] Can be interrupted, sleeps
[15:19:38] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[15:19:38] [PASSED] ttm_bo_reserve_locked_no_sleep
[15:19:38] [PASSED] ttm_bo_reserve_no_wait_ticket
[15:19:38] [PASSED] ttm_bo_reserve_double_resv
[15:19:38] [PASSED] ttm_bo_reserve_interrupted
[15:19:38] [PASSED] ttm_bo_reserve_deadlock
[15:19:38] [PASSED] ttm_bo_unreserve_basic
[15:19:38] [PASSED] ttm_bo_unreserve_pinned
[15:19:38] [PASSED] ttm_bo_unreserve_bulk
[15:19:38] [PASSED] ttm_bo_fini_basic
[15:19:38] [PASSED] ttm_bo_fini_shared_resv
[15:19:38] [PASSED] ttm_bo_pin_basic
[15:19:38] [PASSED] ttm_bo_pin_unpin_resource
[15:19:38] [PASSED] ttm_bo_multiple_pin_one_unpin
[15:19:38] ===================== [PASSED] ttm_bo ======================
[15:19:38] ============== ttm_bo_validate (21 subtests) ===============
[15:19:38] ============== ttm_bo_init_reserved_sys_man  ===============
[15:19:38] [PASSED] Buffer object for userspace
[15:19:38] [PASSED] Kernel buffer object
[15:19:38] [PASSED] Shared buffer object
[15:19:38] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[15:19:38] ============== ttm_bo_init_reserved_mock_man  ==============
[15:19:38] [PASSED] Buffer object for userspace
[15:19:38] [PASSED] Kernel buffer object
[15:19:38] [PASSED] Shared buffer object
[15:19:38] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[15:19:38] [PASSED] ttm_bo_init_reserved_resv
[15:19:38] ================== ttm_bo_validate_basic  ==================
[15:19:38] [PASSED] Buffer object for userspace
[15:19:38] [PASSED] Kernel buffer object
[15:19:38] [PASSED] Shared buffer object
[15:19:38] ============== [PASSED] ttm_bo_validate_basic ==============
[15:19:38] [PASSED] ttm_bo_validate_invalid_placement
[15:19:38] ============= ttm_bo_validate_same_placement  ==============
[15:19:38] [PASSED] System manager
[15:19:38] [PASSED] VRAM manager
[15:19:38] ========= [PASSED] ttm_bo_validate_same_placement ==========
[15:19:38] [PASSED] ttm_bo_validate_failed_alloc
[15:19:38] [PASSED] ttm_bo_validate_pinned
[15:19:38] [PASSED] ttm_bo_validate_busy_placement
[15:19:38] ================ ttm_bo_validate_multihop  =================
[15:19:38] [PASSED] Buffer object for userspace
[15:19:38] [PASSED] Kernel buffer object
[15:19:38] [PASSED] Shared buffer object
[15:19:38] ============ [PASSED] ttm_bo_validate_multihop =============
[15:19:38] ========== ttm_bo_validate_no_placement_signaled  ==========
[15:19:38] [PASSED] Buffer object in system domain, no page vector
[15:19:38] [PASSED] Buffer object in system domain with an existing page vector
[15:19:38] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[15:19:38] ======== ttm_bo_validate_no_placement_not_signaled  ========
[15:19:38] [PASSED] Buffer object for userspace
[15:19:38] [PASSED] Kernel buffer object
[15:19:38] [PASSED] Shared buffer object
[15:19:38] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[15:19:38] [PASSED] ttm_bo_validate_move_fence_signaled
[15:19:38] ========= ttm_bo_validate_move_fence_not_signaled  =========
[15:19:38] [PASSED] Waits for GPU
[15:19:38] [PASSED] Tries to lock straight away
[15:19:38] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[15:19:38] [PASSED] ttm_bo_validate_happy_evict
[15:19:38] [PASSED] ttm_bo_validate_all_pinned_evict
[15:19:38] [PASSED] ttm_bo_validate_allowed_only_evict
[15:19:38] [PASSED] ttm_bo_validate_deleted_evict
[15:19:38] [PASSED] ttm_bo_validate_busy_domain_evict
[15:19:38] [PASSED] ttm_bo_validate_evict_gutting
[15:19:38] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[15:19:38] ================= [PASSED] ttm_bo_validate =================
[15:19:38] ============================================================
[15:19:38] Testing complete. Ran 101 tests: passed: 101
[15:19:38] Elapsed time: 11.105s total, 1.662s configuring, 9.226s building, 0.178s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


