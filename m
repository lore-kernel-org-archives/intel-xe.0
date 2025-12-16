Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E9CD637DF
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 22:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E313710E4B8;
	Tue, 16 Dec 2025 22:30:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A5F10E12C;
 Tue, 16 Dec 2025 22:30:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_AuxCCS_handling_and_render_com?=
 =?utf-8?q?pression_modifiers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Dec 2025 22:30:00 -0000
Message-ID: <176592420068.95623.10533910625919224284@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251216153805.96056-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251216153805.96056-1-tvrtko.ursulin@igalia.com>
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

Series: AuxCCS handling and render compression modifiers
URL   : https://patchwork.freedesktop.org/series/159112/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[22:28:43] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:28:47] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[22:29:18] Starting KUnit Kernel (1/1)...
[22:29:18] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:29:18] ================== guc_buf (11 subtests) ===================
[22:29:18] [PASSED] test_smallest
[22:29:18] [PASSED] test_largest
[22:29:18] [PASSED] test_granular
[22:29:18] [PASSED] test_unique
[22:29:18] [PASSED] test_overlap
[22:29:18] [PASSED] test_reusable
[22:29:18] [PASSED] test_too_big
[22:29:18] [PASSED] test_flush
[22:29:18] [PASSED] test_lookup
[22:29:18] [PASSED] test_data
[22:29:18] [PASSED] test_class
[22:29:18] ===================== [PASSED] guc_buf =====================
[22:29:18] =================== guc_dbm (7 subtests) ===================
[22:29:18] [PASSED] test_empty
[22:29:18] [PASSED] test_default
[22:29:18] ======================== test_size  ========================
[22:29:18] [PASSED] 4
[22:29:18] [PASSED] 8
[22:29:18] [PASSED] 32
[22:29:18] [PASSED] 256
[22:29:18] ==================== [PASSED] test_size ====================
[22:29:18] ======================= test_reuse  ========================
[22:29:18] [PASSED] 4
[22:29:18] [PASSED] 8
[22:29:18] [PASSED] 32
[22:29:18] [PASSED] 256
[22:29:18] =================== [PASSED] test_reuse ====================
[22:29:18] =================== test_range_overlap  ====================
[22:29:18] [PASSED] 4
[22:29:18] [PASSED] 8
[22:29:18] [PASSED] 32
[22:29:18] [PASSED] 256
[22:29:18] =============== [PASSED] test_range_overlap ================
[22:29:18] =================== test_range_compact  ====================
[22:29:18] [PASSED] 4
[22:29:18] [PASSED] 8
[22:29:18] [PASSED] 32
[22:29:18] [PASSED] 256
[22:29:18] =============== [PASSED] test_range_compact ================
[22:29:18] ==================== test_range_spare  =====================
[22:29:18] [PASSED] 4
[22:29:18] [PASSED] 8
[22:29:18] [PASSED] 32
[22:29:18] [PASSED] 256
[22:29:18] ================ [PASSED] test_range_spare =================
[22:29:18] ===================== [PASSED] guc_dbm =====================
[22:29:18] =================== guc_idm (6 subtests) ===================
[22:29:18] [PASSED] bad_init
[22:29:18] [PASSED] no_init
[22:29:18] [PASSED] init_fini
[22:29:18] [PASSED] check_used
[22:29:19] [PASSED] check_quota
[22:29:19] [PASSED] check_all
[22:29:19] ===================== [PASSED] guc_idm =====================
[22:29:19] ================== no_relay (3 subtests) ===================
[22:29:19] [PASSED] xe_drops_guc2pf_if_not_ready
[22:29:19] [PASSED] xe_drops_guc2vf_if_not_ready
[22:29:19] [PASSED] xe_rejects_send_if_not_ready
[22:29:19] ==================== [PASSED] no_relay =====================
[22:29:19] ================== pf_relay (14 subtests) ==================
[22:29:19] [PASSED] pf_rejects_guc2pf_too_short
[22:29:19] [PASSED] pf_rejects_guc2pf_too_long
[22:29:19] [PASSED] pf_rejects_guc2pf_no_payload
[22:29:19] [PASSED] pf_fails_no_payload
[22:29:19] [PASSED] pf_fails_bad_origin
[22:29:19] [PASSED] pf_fails_bad_type
[22:29:19] [PASSED] pf_txn_reports_error
[22:29:19] [PASSED] pf_txn_sends_pf2guc
[22:29:19] [PASSED] pf_sends_pf2guc
[22:29:19] [SKIPPED] pf_loopback_nop
[22:29:19] [SKIPPED] pf_loopback_echo
[22:29:19] [SKIPPED] pf_loopback_fail
[22:29:19] [SKIPPED] pf_loopback_busy
[22:29:19] [SKIPPED] pf_loopback_retry
[22:29:19] ==================== [PASSED] pf_relay =====================
[22:29:19] ================== vf_relay (3 subtests) ===================
[22:29:19] [PASSED] vf_rejects_guc2vf_too_short
[22:29:19] [PASSED] vf_rejects_guc2vf_too_long
[22:29:19] [PASSED] vf_rejects_guc2vf_no_payload
[22:29:19] ==================== [PASSED] vf_relay =====================
[22:29:19] ================ pf_gt_config (6 subtests) =================
[22:29:19] [PASSED] fair_contexts_1vf
[22:29:19] [PASSED] fair_doorbells_1vf
[22:29:19] [PASSED] fair_ggtt_1vf
[22:29:19] ====================== fair_contexts  ======================
[22:29:19] [PASSED] 1 VF
[22:29:19] [PASSED] 2 VFs
[22:29:19] [PASSED] 3 VFs
[22:29:19] [PASSED] 4 VFs
[22:29:19] [PASSED] 5 VFs
[22:29:19] [PASSED] 6 VFs
[22:29:19] [PASSED] 7 VFs
[22:29:19] [PASSED] 8 VFs
[22:29:19] [PASSED] 9 VFs
[22:29:19] [PASSED] 10 VFs
[22:29:19] [PASSED] 11 VFs
[22:29:19] [PASSED] 12 VFs
[22:29:19] [PASSED] 13 VFs
[22:29:19] [PASSED] 14 VFs
[22:29:19] [PASSED] 15 VFs
[22:29:19] [PASSED] 16 VFs
[22:29:19] [PASSED] 17 VFs
[22:29:19] [PASSED] 18 VFs
[22:29:19] [PASSED] 19 VFs
[22:29:19] [PASSED] 20 VFs
[22:29:19] [PASSED] 21 VFs
[22:29:19] [PASSED] 22 VFs
[22:29:19] [PASSED] 23 VFs
[22:29:19] [PASSED] 24 VFs
[22:29:19] [PASSED] 25 VFs
[22:29:19] [PASSED] 26 VFs
[22:29:19] [PASSED] 27 VFs
[22:29:19] [PASSED] 28 VFs
[22:29:19] [PASSED] 29 VFs
[22:29:19] [PASSED] 30 VFs
[22:29:19] [PASSED] 31 VFs
[22:29:19] [PASSED] 32 VFs
[22:29:19] [PASSED] 33 VFs
[22:29:19] [PASSED] 34 VFs
[22:29:19] [PASSED] 35 VFs
[22:29:19] [PASSED] 36 VFs
[22:29:19] [PASSED] 37 VFs
[22:29:19] [PASSED] 38 VFs
[22:29:19] [PASSED] 39 VFs
[22:29:19] [PASSED] 40 VFs
[22:29:19] [PASSED] 41 VFs
[22:29:19] [PASSED] 42 VFs
[22:29:19] [PASSED] 43 VFs
[22:29:19] [PASSED] 44 VFs
[22:29:19] [PASSED] 45 VFs
[22:29:19] [PASSED] 46 VFs
[22:29:19] [PASSED] 47 VFs
[22:29:19] [PASSED] 48 VFs
[22:29:19] [PASSED] 49 VFs
[22:29:19] [PASSED] 50 VFs
[22:29:19] [PASSED] 51 VFs
[22:29:19] [PASSED] 52 VFs
[22:29:19] [PASSED] 53 VFs
[22:29:19] [PASSED] 54 VFs
[22:29:19] [PASSED] 55 VFs
[22:29:19] [PASSED] 56 VFs
[22:29:19] [PASSED] 57 VFs
[22:29:19] [PASSED] 58 VFs
[22:29:19] [PASSED] 59 VFs
[22:29:19] [PASSED] 60 VFs
[22:29:19] [PASSED] 61 VFs
[22:29:19] [PASSED] 62 VFs
[22:29:19] [PASSED] 63 VFs
[22:29:19] ================== [PASSED] fair_contexts ==================
[22:29:19] ===================== fair_doorbells  ======================
[22:29:19] [PASSED] 1 VF
[22:29:19] [PASSED] 2 VFs
[22:29:19] [PASSED] 3 VFs
[22:29:19] [PASSED] 4 VFs
[22:29:19] [PASSED] 5 VFs
[22:29:19] [PASSED] 6 VFs
[22:29:19] [PASSED] 7 VFs
[22:29:19] [PASSED] 8 VFs
[22:29:19] [PASSED] 9 VFs
[22:29:19] [PASSED] 10 VFs
[22:29:19] [PASSED] 11 VFs
[22:29:19] [PASSED] 12 VFs
[22:29:19] [PASSED] 13 VFs
[22:29:19] [PASSED] 14 VFs
[22:29:19] [PASSED] 15 VFs
[22:29:19] [PASSED] 16 VFs
[22:29:19] [PASSED] 17 VFs
[22:29:19] [PASSED] 18 VFs
[22:29:19] [PASSED] 19 VFs
[22:29:19] [PASSED] 20 VFs
[22:29:19] [PASSED] 21 VFs
[22:29:19] [PASSED] 22 VFs
[22:29:19] [PASSED] 23 VFs
[22:29:19] [PASSED] 24 VFs
[22:29:19] [PASSED] 25 VFs
[22:29:19] [PASSED] 26 VFs
[22:29:19] [PASSED] 27 VFs
[22:29:19] [PASSED] 28 VFs
[22:29:19] [PASSED] 29 VFs
[22:29:19] [PASSED] 30 VFs
[22:29:19] [PASSED] 31 VFs
[22:29:19] [PASSED] 32 VFs
[22:29:19] [PASSED] 33 VFs
[22:29:19] [PASSED] 34 VFs
[22:29:19] [PASSED] 35 VFs
[22:29:19] [PASSED] 36 VFs
[22:29:19] [PASSED] 37 VFs
[22:29:19] [PASSED] 38 VFs
[22:29:19] [PASSED] 39 VFs
[22:29:19] [PASSED] 40 VFs
[22:29:19] [PASSED] 41 VFs
[22:29:19] [PASSED] 42 VFs
[22:29:19] [PASSED] 43 VFs
[22:29:19] [PASSED] 44 VFs
[22:29:19] [PASSED] 45 VFs
[22:29:19] [PASSED] 46 VFs
[22:29:19] [PASSED] 47 VFs
[22:29:19] [PASSED] 48 VFs
[22:29:19] [PASSED] 49 VFs
[22:29:19] [PASSED] 50 VFs
[22:29:19] [PASSED] 51 VFs
[22:29:19] [PASSED] 52 VFs
[22:29:19] [PASSED] 53 VFs
[22:29:19] [PASSED] 54 VFs
[22:29:19] [PASSED] 55 VFs
[22:29:19] [PASSED] 56 VFs
[22:29:19] [PASSED] 57 VFs
[22:29:19] [PASSED] 58 VFs
[22:29:19] [PASSED] 59 VFs
[22:29:19] [PASSED] 60 VFs
[22:29:19] [PASSED] 61 VFs
[22:29:19] [PASSED] 62 VFs
[22:29:19] [PASSED] 63 VFs
[22:29:19] ================= [PASSED] fair_doorbells ==================
[22:29:19] ======================== fair_ggtt  ========================
[22:29:19] [PASSED] 1 VF
[22:29:19] [PASSED] 2 VFs
[22:29:19] [PASSED] 3 VFs
[22:29:19] [PASSED] 4 VFs
[22:29:19] [PASSED] 5 VFs
[22:29:19] [PASSED] 6 VFs
[22:29:19] [PASSED] 7 VFs
[22:29:19] [PASSED] 8 VFs
[22:29:19] [PASSED] 9 VFs
[22:29:19] [PASSED] 10 VFs
[22:29:19] [PASSED] 11 VFs
[22:29:19] [PASSED] 12 VFs
[22:29:19] [PASSED] 13 VFs
[22:29:19] [PASSED] 14 VFs
[22:29:19] [PASSED] 15 VFs
[22:29:19] [PASSED] 16 VFs
[22:29:19] [PASSED] 17 VFs
[22:29:19] [PASSED] 18 VFs
[22:29:19] [PASSED] 19 VFs
[22:29:19] [PASSED] 20 VFs
[22:29:19] [PASSED] 21 VFs
[22:29:19] [PASSED] 22 VFs
[22:29:19] [PASSED] 23 VFs
[22:29:19] [PASSED] 24 VFs
[22:29:19] [PASSED] 25 VFs
[22:29:19] [PASSED] 26 VFs
[22:29:19] [PASSED] 27 VFs
[22:29:19] [PASSED] 28 VFs
[22:29:19] [PASSED] 29 VFs
[22:29:19] [PASSED] 30 VFs
[22:29:19] [PASSED] 31 VFs
[22:29:19] [PASSED] 32 VFs
[22:29:19] [PASSED] 33 VFs
[22:29:19] [PASSED] 34 VFs
[22:29:19] [PASSED] 35 VFs
[22:29:19] [PASSED] 36 VFs
[22:29:19] [PASSED] 37 VFs
[22:29:19] [PASSED] 38 VFs
[22:29:19] [PASSED] 39 VFs
[22:29:19] [PASSED] 40 VFs
[22:29:19] [PASSED] 41 VFs
[22:29:19] [PASSED] 42 VFs
[22:29:19] [PASSED] 43 VFs
[22:29:19] [PASSED] 44 VFs
[22:29:19] [PASSED] 45 VFs
[22:29:19] [PASSED] 46 VFs
[22:29:19] [PASSED] 47 VFs
[22:29:19] [PASSED] 48 VFs
[22:29:19] [PASSED] 49 VFs
[22:29:19] [PASSED] 50 VFs
[22:29:19] [PASSED] 51 VFs
[22:29:19] [PASSED] 52 VFs
[22:29:19] [PASSED] 53 VFs
[22:29:19] [PASSED] 54 VFs
[22:29:19] [PASSED] 55 VFs
[22:29:19] [PASSED] 56 VFs
[22:29:19] [PASSED] 57 VFs
[22:29:19] [PASSED] 58 VFs
[22:29:19] [PASSED] 59 VFs
[22:29:19] [PASSED] 60 VFs
[22:29:19] [PASSED] 61 VFs
[22:29:19] [PASSED] 62 VFs
[22:29:19] [PASSED] 63 VFs
[22:29:19] ==================== [PASSED] fair_ggtt ====================
[22:29:19] ================== [PASSED] pf_gt_config ===================
[22:29:19] ===================== lmtt (1 subtest) =====================
[22:29:19] ======================== test_ops  =========================
[22:29:19] [PASSED] 2-level
[22:29:19] [PASSED] multi-level
[22:29:19] ==================== [PASSED] test_ops =====================
[22:29:19] ====================== [PASSED] lmtt =======================
[22:29:19] ================= pf_service (11 subtests) =================
[22:29:19] [PASSED] pf_negotiate_any
[22:29:19] [PASSED] pf_negotiate_base_match
[22:29:19] [PASSED] pf_negotiate_base_newer
[22:29:19] [PASSED] pf_negotiate_base_next
[22:29:19] [SKIPPED] pf_negotiate_base_older
[22:29:19] [PASSED] pf_negotiate_base_prev
[22:29:19] [PASSED] pf_negotiate_latest_match
[22:29:19] [PASSED] pf_negotiate_latest_newer
[22:29:19] [PASSED] pf_negotiate_latest_next
[22:29:19] [SKIPPED] pf_negotiate_latest_older
[22:29:19] [SKIPPED] pf_negotiate_latest_prev
[22:29:19] =================== [PASSED] pf_service ====================
[22:29:19] ================= xe_guc_g2g (2 subtests) ==================
[22:29:19] ============== xe_live_guc_g2g_kunit_default  ==============
[22:29:19] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[22:29:19] ============== xe_live_guc_g2g_kunit_allmem  ===============
[22:29:19] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[22:29:19] =================== [SKIPPED] xe_guc_g2g ===================
[22:29:19] =================== xe_mocs (2 subtests) ===================
[22:29:19] ================ xe_live_mocs_kernel_kunit  ================
[22:29:19] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[22:29:19] ================ xe_live_mocs_reset_kunit  =================
[22:29:19] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[22:29:19] ==================== [SKIPPED] xe_mocs =====================
[22:29:19] ================= xe_migrate (2 subtests) ==================
[22:29:19] ================= xe_migrate_sanity_kunit  =================
[22:29:19] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[22:29:19] ================== xe_validate_ccs_kunit  ==================
[22:29:19] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[22:29:19] =================== [SKIPPED] xe_migrate ===================
[22:29:19] ================== xe_dma_buf (1 subtest) ==================
[22:29:19] ==================== xe_dma_buf_kunit  =====================
[22:29:19] ================ [SKIPPED] xe_dma_buf_kunit ================
[22:29:19] =================== [SKIPPED] xe_dma_buf ===================
[22:29:19] ================= xe_bo_shrink (1 subtest) =================
[22:29:19] =================== xe_bo_shrink_kunit  ====================
[22:29:19] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[22:29:19] ================== [SKIPPED] xe_bo_shrink ==================
[22:29:19] ==================== xe_bo (2 subtests) ====================
[22:29:19] ================== xe_ccs_migrate_kunit  ===================
[22:29:19] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[22:29:19] ==================== xe_bo_evict_kunit  ====================
[22:29:19] =============== [SKIPPED] xe_bo_evict_kunit ================
[22:29:19] ===================== [SKIPPED] xe_bo ======================
[22:29:19] ==================== args (11 subtests) ====================
[22:29:19] [PASSED] count_args_test
[22:29:19] [PASSED] call_args_example
[22:29:19] [PASSED] call_args_test
[22:29:19] [PASSED] drop_first_arg_example
[22:29:19] [PASSED] drop_first_arg_test
[22:29:19] [PASSED] first_arg_example
[22:29:19] [PASSED] first_arg_test
[22:29:19] [PASSED] last_arg_example
[22:29:19] [PASSED] last_arg_test
[22:29:19] [PASSED] pick_arg_example
[22:29:19] [PASSED] sep_comma_example
[22:29:19] ====================== [PASSED] args =======================
[22:29:19] =================== xe_pci (3 subtests) ====================
[22:29:19] ==================== check_graphics_ip  ====================
[22:29:19] [PASSED] 12.00 Xe_LP
[22:29:19] [PASSED] 12.10 Xe_LP+
[22:29:19] [PASSED] 12.55 Xe_HPG
[22:29:19] [PASSED] 12.60 Xe_HPC
[22:29:19] [PASSED] 12.70 Xe_LPG
[22:29:19] [PASSED] 12.71 Xe_LPG
[22:29:19] [PASSED] 12.74 Xe_LPG+
[22:29:19] [PASSED] 20.01 Xe2_HPG
[22:29:19] [PASSED] 20.02 Xe2_HPG
[22:29:19] [PASSED] 20.04 Xe2_LPG
[22:29:19] [PASSED] 30.00 Xe3_LPG
[22:29:19] [PASSED] 30.01 Xe3_LPG
[22:29:19] [PASSED] 30.03 Xe3_LPG
[22:29:19] [PASSED] 30.04 Xe3_LPG
[22:29:19] [PASSED] 30.05 Xe3_LPG
[22:29:19] [PASSED] 35.11 Xe3p_XPC
[22:29:19] ================ [PASSED] check_graphics_ip ================
[22:29:19] ===================== check_media_ip  ======================
[22:29:19] [PASSED] 12.00 Xe_M
[22:29:19] [PASSED] 12.55 Xe_HPM
[22:29:19] [PASSED] 13.00 Xe_LPM+
[22:29:19] [PASSED] 13.01 Xe2_HPM
[22:29:19] [PASSED] 20.00 Xe2_LPM
[22:29:19] [PASSED] 30.00 Xe3_LPM
[22:29:19] [PASSED] 30.02 Xe3_LPM
[22:29:19] [PASSED] 35.00 Xe3p_LPM
[22:29:19] [PASSED] 35.03 Xe3p_HPM
[22:29:19] ================= [PASSED] check_media_ip ==================
[22:29:19] =================== check_platform_desc  ===================
[22:29:19] [PASSED] 0x9A60 (TIGERLAKE)
[22:29:19] [PASSED] 0x9A68 (TIGERLAKE)
[22:29:19] [PASSED] 0x9A70 (TIGERLAKE)
[22:29:19] [PASSED] 0x9A40 (TIGERLAKE)
[22:29:19] [PASSED] 0x9A49 (TIGERLAKE)
[22:29:19] [PASSED] 0x9A59 (TIGERLAKE)
[22:29:19] [PASSED] 0x9A78 (TIGERLAKE)
[22:29:19] [PASSED] 0x9AC0 (TIGERLAKE)
[22:29:19] [PASSED] 0x9AC9 (TIGERLAKE)
[22:29:19] [PASSED] 0x9AD9 (TIGERLAKE)
[22:29:19] [PASSED] 0x9AF8 (TIGERLAKE)
[22:29:19] [PASSED] 0x4C80 (ROCKETLAKE)
[22:29:19] [PASSED] 0x4C8A (ROCKETLAKE)
[22:29:19] [PASSED] 0x4C8B (ROCKETLAKE)
[22:29:19] [PASSED] 0x4C8C (ROCKETLAKE)
[22:29:19] [PASSED] 0x4C90 (ROCKETLAKE)
[22:29:19] [PASSED] 0x4C9A (ROCKETLAKE)
[22:29:19] [PASSED] 0x4680 (ALDERLAKE_S)
[22:29:19] [PASSED] 0x4682 (ALDERLAKE_S)
[22:29:19] [PASSED] 0x4688 (ALDERLAKE_S)
[22:29:19] [PASSED] 0x468A (ALDERLAKE_S)
[22:29:19] [PASSED] 0x468B (ALDERLAKE_S)
[22:29:19] [PASSED] 0x4690 (ALDERLAKE_S)
[22:29:19] [PASSED] 0x4692 (ALDERLAKE_S)
[22:29:19] [PASSED] 0x4693 (ALDERLAKE_S)
[22:29:19] [PASSED] 0x46A0 (ALDERLAKE_P)
[22:29:19] [PASSED] 0x46A1 (ALDERLAKE_P)
[22:29:19] [PASSED] 0x46A2 (ALDERLAKE_P)
[22:29:19] [PASSED] 0x46A3 (ALDERLAKE_P)
[22:29:19] [PASSED] 0x46A6 (ALDERLAKE_P)
[22:29:19] [PASSED] 0x46A8 (ALDERLAKE_P)
[22:29:19] [PASSED] 0x46AA (ALDERLAKE_P)
[22:29:19] [PASSED] 0x462A (ALDERLAKE_P)
[22:29:19] [PASSED] 0x4626 (ALDERLAKE_P)
[22:29:19] [PASSED] 0x4628 (ALDERLAKE_P)
[22:29:19] [PASSED] 0x46B0 (ALDERLAKE_P)
stty: 'standard input': Inappropriate ioctl for device
[22:29:19] [PASSED] 0x46B1 (ALDERLAKE_P)
[22:29:19] [PASSED] 0x46B2 (ALDERLAKE_P)
[22:29:19] [PASSED] 0x46B3 (ALDERLAKE_P)
[22:29:19] [PASSED] 0x46C0 (ALDERLAKE_P)
[22:29:19] [PASSED] 0x46C1 (ALDERLAKE_P)
[22:29:19] [PASSED] 0x46C2 (ALDERLAKE_P)
[22:29:19] [PASSED] 0x46C3 (ALDERLAKE_P)
[22:29:19] [PASSED] 0x46D0 (ALDERLAKE_N)
[22:29:19] [PASSED] 0x46D1 (ALDERLAKE_N)
[22:29:19] [PASSED] 0x46D2 (ALDERLAKE_N)
[22:29:19] [PASSED] 0x46D3 (ALDERLAKE_N)
[22:29:19] [PASSED] 0x46D4 (ALDERLAKE_N)
[22:29:19] [PASSED] 0xA721 (ALDERLAKE_P)
[22:29:19] [PASSED] 0xA7A1 (ALDERLAKE_P)
[22:29:19] [PASSED] 0xA7A9 (ALDERLAKE_P)
[22:29:19] [PASSED] 0xA7AC (ALDERLAKE_P)
[22:29:19] [PASSED] 0xA7AD (ALDERLAKE_P)
[22:29:19] [PASSED] 0xA720 (ALDERLAKE_P)
[22:29:19] [PASSED] 0xA7A0 (ALDERLAKE_P)
[22:29:19] [PASSED] 0xA7A8 (ALDERLAKE_P)
[22:29:19] [PASSED] 0xA7AA (ALDERLAKE_P)
[22:29:19] [PASSED] 0xA7AB (ALDERLAKE_P)
[22:29:19] [PASSED] 0xA780 (ALDERLAKE_S)
[22:29:19] [PASSED] 0xA781 (ALDERLAKE_S)
[22:29:19] [PASSED] 0xA782 (ALDERLAKE_S)
[22:29:19] [PASSED] 0xA783 (ALDERLAKE_S)
[22:29:19] [PASSED] 0xA788 (ALDERLAKE_S)
[22:29:19] [PASSED] 0xA789 (ALDERLAKE_S)
[22:29:19] [PASSED] 0xA78A (ALDERLAKE_S)
[22:29:19] [PASSED] 0xA78B (ALDERLAKE_S)
[22:29:19] [PASSED] 0x4905 (DG1)
[22:29:19] [PASSED] 0x4906 (DG1)
[22:29:19] [PASSED] 0x4907 (DG1)
[22:29:19] [PASSED] 0x4908 (DG1)
[22:29:19] [PASSED] 0x4909 (DG1)
[22:29:19] [PASSED] 0x56C0 (DG2)
[22:29:19] [PASSED] 0x56C2 (DG2)
[22:29:19] [PASSED] 0x56C1 (DG2)
[22:29:19] [PASSED] 0x7D51 (METEORLAKE)
[22:29:19] [PASSED] 0x7DD1 (METEORLAKE)
[22:29:19] [PASSED] 0x7D41 (METEORLAKE)
[22:29:19] [PASSED] 0x7D67 (METEORLAKE)
[22:29:19] [PASSED] 0xB640 (METEORLAKE)
[22:29:19] [PASSED] 0x56A0 (DG2)
[22:29:19] [PASSED] 0x56A1 (DG2)
[22:29:19] [PASSED] 0x56A2 (DG2)
[22:29:19] [PASSED] 0x56BE (DG2)
[22:29:19] [PASSED] 0x56BF (DG2)
[22:29:19] [PASSED] 0x5690 (DG2)
[22:29:19] [PASSED] 0x5691 (DG2)
[22:29:19] [PASSED] 0x5692 (DG2)
[22:29:19] [PASSED] 0x56A5 (DG2)
[22:29:19] [PASSED] 0x56A6 (DG2)
[22:29:19] [PASSED] 0x56B0 (DG2)
[22:29:19] [PASSED] 0x56B1 (DG2)
[22:29:19] [PASSED] 0x56BA (DG2)
[22:29:19] [PASSED] 0x56BB (DG2)
[22:29:19] [PASSED] 0x56BC (DG2)
[22:29:19] [PASSED] 0x56BD (DG2)
[22:29:19] [PASSED] 0x5693 (DG2)
[22:29:19] [PASSED] 0x5694 (DG2)
[22:29:19] [PASSED] 0x5695 (DG2)
[22:29:19] [PASSED] 0x56A3 (DG2)
[22:29:19] [PASSED] 0x56A4 (DG2)
[22:29:19] [PASSED] 0x56B2 (DG2)
[22:29:19] [PASSED] 0x56B3 (DG2)
[22:29:19] [PASSED] 0x5696 (DG2)
[22:29:19] [PASSED] 0x5697 (DG2)
[22:29:19] [PASSED] 0xB69 (PVC)
[22:29:19] [PASSED] 0xB6E (PVC)
[22:29:19] [PASSED] 0xBD4 (PVC)
[22:29:19] [PASSED] 0xBD5 (PVC)
[22:29:19] [PASSED] 0xBD6 (PVC)
[22:29:19] [PASSED] 0xBD7 (PVC)
[22:29:19] [PASSED] 0xBD8 (PVC)
[22:29:19] [PASSED] 0xBD9 (PVC)
[22:29:19] [PASSED] 0xBDA (PVC)
[22:29:19] [PASSED] 0xBDB (PVC)
[22:29:19] [PASSED] 0xBE0 (PVC)
[22:29:19] [PASSED] 0xBE1 (PVC)
[22:29:19] [PASSED] 0xBE5 (PVC)
[22:29:19] [PASSED] 0x7D40 (METEORLAKE)
[22:29:19] [PASSED] 0x7D45 (METEORLAKE)
[22:29:19] [PASSED] 0x7D55 (METEORLAKE)
[22:29:19] [PASSED] 0x7D60 (METEORLAKE)
[22:29:19] [PASSED] 0x7DD5 (METEORLAKE)
[22:29:19] [PASSED] 0x6420 (LUNARLAKE)
[22:29:19] [PASSED] 0x64A0 (LUNARLAKE)
[22:29:19] [PASSED] 0x64B0 (LUNARLAKE)
[22:29:19] [PASSED] 0xE202 (BATTLEMAGE)
[22:29:19] [PASSED] 0xE209 (BATTLEMAGE)
[22:29:19] [PASSED] 0xE20B (BATTLEMAGE)
[22:29:19] [PASSED] 0xE20C (BATTLEMAGE)
[22:29:19] [PASSED] 0xE20D (BATTLEMAGE)
[22:29:19] [PASSED] 0xE210 (BATTLEMAGE)
[22:29:19] [PASSED] 0xE211 (BATTLEMAGE)
[22:29:19] [PASSED] 0xE212 (BATTLEMAGE)
[22:29:19] [PASSED] 0xE216 (BATTLEMAGE)
[22:29:19] [PASSED] 0xE220 (BATTLEMAGE)
[22:29:19] [PASSED] 0xE221 (BATTLEMAGE)
[22:29:19] [PASSED] 0xE222 (BATTLEMAGE)
[22:29:19] [PASSED] 0xE223 (BATTLEMAGE)
[22:29:19] [PASSED] 0xB080 (PANTHERLAKE)
[22:29:19] [PASSED] 0xB081 (PANTHERLAKE)
[22:29:19] [PASSED] 0xB082 (PANTHERLAKE)
[22:29:19] [PASSED] 0xB083 (PANTHERLAKE)
[22:29:19] [PASSED] 0xB084 (PANTHERLAKE)
[22:29:19] [PASSED] 0xB085 (PANTHERLAKE)
[22:29:19] [PASSED] 0xB086 (PANTHERLAKE)
[22:29:19] [PASSED] 0xB087 (PANTHERLAKE)
[22:29:19] [PASSED] 0xB08F (PANTHERLAKE)
[22:29:19] [PASSED] 0xB090 (PANTHERLAKE)
[22:29:19] [PASSED] 0xB0A0 (PANTHERLAKE)
[22:29:19] [PASSED] 0xB0B0 (PANTHERLAKE)
[22:29:19] [PASSED] 0xFD80 (PANTHERLAKE)
[22:29:19] [PASSED] 0xFD81 (PANTHERLAKE)
[22:29:19] [PASSED] 0xD740 (NOVALAKE_S)
[22:29:19] [PASSED] 0xD741 (NOVALAKE_S)
[22:29:19] [PASSED] 0xD742 (NOVALAKE_S)
[22:29:19] [PASSED] 0xD743 (NOVALAKE_S)
[22:29:19] [PASSED] 0xD744 (NOVALAKE_S)
[22:29:19] [PASSED] 0xD745 (NOVALAKE_S)
[22:29:19] [PASSED] 0x674C (CRESCENTISLAND)
[22:29:19] =============== [PASSED] check_platform_desc ===============
[22:29:19] ===================== [PASSED] xe_pci ======================
[22:29:19] =================== xe_rtp (2 subtests) ====================
[22:29:19] =============== xe_rtp_process_to_sr_tests  ================
[22:29:19] [PASSED] coalesce-same-reg
[22:29:19] [PASSED] no-match-no-add
[22:29:19] [PASSED] match-or
[22:29:19] [PASSED] match-or-xfail
[22:29:19] [PASSED] no-match-no-add-multiple-rules
[22:29:19] [PASSED] two-regs-two-entries
[22:29:19] [PASSED] clr-one-set-other
[22:29:19] [PASSED] set-field
[22:29:19] [PASSED] conflict-duplicate
[22:29:19] [PASSED] conflict-not-disjoint
[22:29:19] [PASSED] conflict-reg-type
[22:29:19] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[22:29:19] ================== xe_rtp_process_tests  ===================
[22:29:19] [PASSED] active1
[22:29:19] [PASSED] active2
[22:29:19] [PASSED] active-inactive
[22:29:19] [PASSED] inactive-active
[22:29:19] [PASSED] inactive-1st_or_active-inactive
[22:29:19] [PASSED] inactive-2nd_or_active-inactive
[22:29:19] [PASSED] inactive-last_or_active-inactive
[22:29:19] [PASSED] inactive-no_or_active-inactive
[22:29:19] ============== [PASSED] xe_rtp_process_tests ===============
[22:29:19] ===================== [PASSED] xe_rtp ======================
[22:29:19] ==================== xe_wa (1 subtest) =====================
[22:29:19] ======================== xe_wa_gt  =========================
[22:29:19] [PASSED] TIGERLAKE B0
[22:29:19] [PASSED] DG1 A0
[22:29:19] [PASSED] DG1 B0
[22:29:19] [PASSED] ALDERLAKE_S A0
[22:29:19] [PASSED] ALDERLAKE_S B0
[22:29:19] [PASSED] ALDERLAKE_S C0
[22:29:19] [PASSED] ALDERLAKE_S D0
[22:29:19] [PASSED] ALDERLAKE_P A0
[22:29:19] [PASSED] ALDERLAKE_P B0
[22:29:19] [PASSED] ALDERLAKE_P C0
[22:29:19] [PASSED] ALDERLAKE_S RPLS D0
[22:29:19] [PASSED] ALDERLAKE_P RPLU E0
[22:29:19] [PASSED] DG2 G10 C0
[22:29:19] [PASSED] DG2 G11 B1
[22:29:19] [PASSED] DG2 G12 A1
[22:29:19] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[22:29:19] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[22:29:19] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[22:29:19] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[22:29:19] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[22:29:19] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[22:29:19] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[22:29:19] ==================== [PASSED] xe_wa_gt =====================
[22:29:19] ====================== [PASSED] xe_wa ======================
[22:29:19] ============================================================
[22:29:19] Testing complete. Ran 510 tests: passed: 492, skipped: 18
[22:29:19] Elapsed time: 36.184s total, 4.198s configuring, 31.469s building, 0.473s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[22:29:19] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:29:20] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[22:29:46] Starting KUnit Kernel (1/1)...
[22:29:46] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:29:46] ============ drm_test_pick_cmdline (2 subtests) ============
[22:29:46] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[22:29:46] =============== drm_test_pick_cmdline_named  ===============
[22:29:46] [PASSED] NTSC
[22:29:46] [PASSED] NTSC-J
[22:29:46] [PASSED] PAL
[22:29:46] [PASSED] PAL-M
[22:29:46] =========== [PASSED] drm_test_pick_cmdline_named ===========
[22:29:46] ============== [PASSED] drm_test_pick_cmdline ==============
[22:29:46] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[22:29:46] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[22:29:46] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[22:29:46] =========== drm_validate_clone_mode (2 subtests) ===========
[22:29:46] ============== drm_test_check_in_clone_mode  ===============
[22:29:46] [PASSED] in_clone_mode
[22:29:46] [PASSED] not_in_clone_mode
[22:29:46] ========== [PASSED] drm_test_check_in_clone_mode ===========
[22:29:46] =============== drm_test_check_valid_clones  ===============
[22:29:46] [PASSED] not_in_clone_mode
[22:29:46] [PASSED] valid_clone
[22:29:46] [PASSED] invalid_clone
[22:29:46] =========== [PASSED] drm_test_check_valid_clones ===========
[22:29:46] ============= [PASSED] drm_validate_clone_mode =============
[22:29:46] ============= drm_validate_modeset (1 subtest) =============
[22:29:46] [PASSED] drm_test_check_connector_changed_modeset
[22:29:46] ============== [PASSED] drm_validate_modeset ===============
[22:29:46] ====== drm_test_bridge_get_current_state (2 subtests) ======
[22:29:46] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[22:29:46] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[22:29:46] ======== [PASSED] drm_test_bridge_get_current_state ========
[22:29:46] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[22:29:46] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[22:29:46] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[22:29:46] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[22:29:46] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[22:29:46] ============== drm_bridge_alloc (2 subtests) ===============
[22:29:46] [PASSED] drm_test_drm_bridge_alloc_basic
[22:29:46] [PASSED] drm_test_drm_bridge_alloc_get_put
[22:29:46] ================ [PASSED] drm_bridge_alloc =================
[22:29:46] ================== drm_buddy (8 subtests) ==================
[22:29:46] [PASSED] drm_test_buddy_alloc_limit
[22:29:46] [PASSED] drm_test_buddy_alloc_optimistic
[22:29:46] [PASSED] drm_test_buddy_alloc_pessimistic
[22:29:46] [PASSED] drm_test_buddy_alloc_pathological
[22:29:46] [PASSED] drm_test_buddy_alloc_contiguous
[22:29:46] [PASSED] drm_test_buddy_alloc_clear
[22:29:46] [PASSED] drm_test_buddy_alloc_range_bias
[22:29:46] [PASSED] drm_test_buddy_fragmentation_performance
[22:29:46] ==================== [PASSED] drm_buddy ====================
[22:29:46] ============= drm_cmdline_parser (40 subtests) =============
[22:29:46] [PASSED] drm_test_cmdline_force_d_only
[22:29:46] [PASSED] drm_test_cmdline_force_D_only_dvi
[22:29:46] [PASSED] drm_test_cmdline_force_D_only_hdmi
[22:29:46] [PASSED] drm_test_cmdline_force_D_only_not_digital
[22:29:46] [PASSED] drm_test_cmdline_force_e_only
[22:29:46] [PASSED] drm_test_cmdline_res
[22:29:46] [PASSED] drm_test_cmdline_res_vesa
[22:29:46] [PASSED] drm_test_cmdline_res_vesa_rblank
[22:29:46] [PASSED] drm_test_cmdline_res_rblank
[22:29:46] [PASSED] drm_test_cmdline_res_bpp
[22:29:46] [PASSED] drm_test_cmdline_res_refresh
[22:29:46] [PASSED] drm_test_cmdline_res_bpp_refresh
[22:29:46] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[22:29:46] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[22:29:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[22:29:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[22:29:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[22:29:46] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[22:29:46] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[22:29:46] [PASSED] drm_test_cmdline_res_margins_force_on
[22:29:46] [PASSED] drm_test_cmdline_res_vesa_margins
[22:29:46] [PASSED] drm_test_cmdline_name
[22:29:46] [PASSED] drm_test_cmdline_name_bpp
[22:29:46] [PASSED] drm_test_cmdline_name_option
[22:29:46] [PASSED] drm_test_cmdline_name_bpp_option
[22:29:46] [PASSED] drm_test_cmdline_rotate_0
[22:29:46] [PASSED] drm_test_cmdline_rotate_90
[22:29:46] [PASSED] drm_test_cmdline_rotate_180
[22:29:46] [PASSED] drm_test_cmdline_rotate_270
[22:29:46] [PASSED] drm_test_cmdline_hmirror
[22:29:46] [PASSED] drm_test_cmdline_vmirror
[22:29:46] [PASSED] drm_test_cmdline_margin_options
[22:29:46] [PASSED] drm_test_cmdline_multiple_options
[22:29:46] [PASSED] drm_test_cmdline_bpp_extra_and_option
[22:29:46] [PASSED] drm_test_cmdline_extra_and_option
[22:29:46] [PASSED] drm_test_cmdline_freestanding_options
[22:29:46] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[22:29:46] [PASSED] drm_test_cmdline_panel_orientation
[22:29:46] ================ drm_test_cmdline_invalid  =================
[22:29:46] [PASSED] margin_only
[22:29:46] [PASSED] interlace_only
[22:29:46] [PASSED] res_missing_x
[22:29:46] [PASSED] res_missing_y
[22:29:46] [PASSED] res_bad_y
[22:29:46] [PASSED] res_missing_y_bpp
[22:29:46] [PASSED] res_bad_bpp
[22:29:46] [PASSED] res_bad_refresh
[22:29:46] [PASSED] res_bpp_refresh_force_on_off
[22:29:46] [PASSED] res_invalid_mode
[22:29:46] [PASSED] res_bpp_wrong_place_mode
[22:29:46] [PASSED] name_bpp_refresh
[22:29:46] [PASSED] name_refresh
[22:29:46] [PASSED] name_refresh_wrong_mode
[22:29:46] [PASSED] name_refresh_invalid_mode
[22:29:46] [PASSED] rotate_multiple
[22:29:46] [PASSED] rotate_invalid_val
[22:29:46] [PASSED] rotate_truncated
[22:29:46] [PASSED] invalid_option
[22:29:46] [PASSED] invalid_tv_option
[22:29:46] [PASSED] truncated_tv_option
[22:29:46] ============ [PASSED] drm_test_cmdline_invalid =============
[22:29:46] =============== drm_test_cmdline_tv_options  ===============
[22:29:46] [PASSED] NTSC
[22:29:46] [PASSED] NTSC_443
[22:29:46] [PASSED] NTSC_J
[22:29:46] [PASSED] PAL
[22:29:46] [PASSED] PAL_M
[22:29:46] [PASSED] PAL_N
[22:29:46] [PASSED] SECAM
[22:29:46] [PASSED] MONO_525
[22:29:46] [PASSED] MONO_625
[22:29:46] =========== [PASSED] drm_test_cmdline_tv_options ===========
[22:29:46] =============== [PASSED] drm_cmdline_parser ================
[22:29:46] ========== drmm_connector_hdmi_init (20 subtests) ==========
[22:29:46] [PASSED] drm_test_connector_hdmi_init_valid
[22:29:46] [PASSED] drm_test_connector_hdmi_init_bpc_8
[22:29:46] [PASSED] drm_test_connector_hdmi_init_bpc_10
[22:29:46] [PASSED] drm_test_connector_hdmi_init_bpc_12
[22:29:46] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[22:29:46] [PASSED] drm_test_connector_hdmi_init_bpc_null
[22:29:46] [PASSED] drm_test_connector_hdmi_init_formats_empty
[22:29:46] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[22:29:46] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[22:29:46] [PASSED] supported_formats=0x9 yuv420_allowed=1
[22:29:46] [PASSED] supported_formats=0x9 yuv420_allowed=0
[22:29:46] [PASSED] supported_formats=0x3 yuv420_allowed=1
[22:29:46] [PASSED] supported_formats=0x3 yuv420_allowed=0
[22:29:46] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[22:29:46] [PASSED] drm_test_connector_hdmi_init_null_ddc
[22:29:46] [PASSED] drm_test_connector_hdmi_init_null_product
[22:29:46] [PASSED] drm_test_connector_hdmi_init_null_vendor
[22:29:46] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[22:29:46] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[22:29:46] [PASSED] drm_test_connector_hdmi_init_product_valid
[22:29:46] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[22:29:46] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[22:29:46] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[22:29:46] ========= drm_test_connector_hdmi_init_type_valid  =========
[22:29:46] [PASSED] HDMI-A
[22:29:46] [PASSED] HDMI-B
[22:29:46] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[22:29:46] ======== drm_test_connector_hdmi_init_type_invalid  ========
[22:29:46] [PASSED] Unknown
[22:29:46] [PASSED] VGA
[22:29:46] [PASSED] DVI-I
[22:29:46] [PASSED] DVI-D
[22:29:46] [PASSED] DVI-A
[22:29:46] [PASSED] Composite
[22:29:46] [PASSED] SVIDEO
[22:29:46] [PASSED] LVDS
[22:29:46] [PASSED] Component
[22:29:46] [PASSED] DIN
[22:29:46] [PASSED] DP
[22:29:46] [PASSED] TV
[22:29:46] [PASSED] eDP
[22:29:46] [PASSED] Virtual
[22:29:46] [PASSED] DSI
[22:29:46] [PASSED] DPI
[22:29:46] [PASSED] Writeback
[22:29:46] [PASSED] SPI
[22:29:46] [PASSED] USB
[22:29:46] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[22:29:46] ============ [PASSED] drmm_connector_hdmi_init =============
[22:29:46] ============= drmm_connector_init (3 subtests) =============
[22:29:46] [PASSED] drm_test_drmm_connector_init
[22:29:46] [PASSED] drm_test_drmm_connector_init_null_ddc
[22:29:46] ========= drm_test_drmm_connector_init_type_valid  =========
[22:29:46] [PASSED] Unknown
[22:29:46] [PASSED] VGA
[22:29:46] [PASSED] DVI-I
[22:29:46] [PASSED] DVI-D
[22:29:46] [PASSED] DVI-A
[22:29:46] [PASSED] Composite
[22:29:46] [PASSED] SVIDEO
[22:29:46] [PASSED] LVDS
[22:29:46] [PASSED] Component
[22:29:46] [PASSED] DIN
[22:29:46] [PASSED] DP
[22:29:46] [PASSED] HDMI-A
[22:29:46] [PASSED] HDMI-B
[22:29:46] [PASSED] TV
[22:29:46] [PASSED] eDP
[22:29:46] [PASSED] Virtual
[22:29:46] [PASSED] DSI
[22:29:46] [PASSED] DPI
[22:29:46] [PASSED] Writeback
[22:29:46] [PASSED] SPI
[22:29:46] [PASSED] USB
[22:29:46] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[22:29:46] =============== [PASSED] drmm_connector_init ===============
[22:29:46] ========= drm_connector_dynamic_init (6 subtests) ==========
[22:29:46] [PASSED] drm_test_drm_connector_dynamic_init
[22:29:46] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[22:29:46] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[22:29:46] [PASSED] drm_test_drm_connector_dynamic_init_properties
[22:29:46] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[22:29:46] [PASSED] Unknown
[22:29:46] [PASSED] VGA
[22:29:46] [PASSED] DVI-I
[22:29:46] [PASSED] DVI-D
[22:29:46] [PASSED] DVI-A
[22:29:46] [PASSED] Composite
[22:29:46] [PASSED] SVIDEO
[22:29:46] [PASSED] LVDS
[22:29:46] [PASSED] Component
[22:29:46] [PASSED] DIN
[22:29:46] [PASSED] DP
[22:29:46] [PASSED] HDMI-A
[22:29:46] [PASSED] HDMI-B
[22:29:46] [PASSED] TV
[22:29:46] [PASSED] eDP
[22:29:46] [PASSED] Virtual
[22:29:46] [PASSED] DSI
[22:29:46] [PASSED] DPI
[22:29:46] [PASSED] Writeback
[22:29:46] [PASSED] SPI
[22:29:46] [PASSED] USB
[22:29:46] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[22:29:46] ======== drm_test_drm_connector_dynamic_init_name  =========
[22:29:46] [PASSED] Unknown
[22:29:46] [PASSED] VGA
[22:29:46] [PASSED] DVI-I
[22:29:46] [PASSED] DVI-D
[22:29:46] [PASSED] DVI-A
[22:29:46] [PASSED] Composite
[22:29:46] [PASSED] SVIDEO
[22:29:46] [PASSED] LVDS
[22:29:46] [PASSED] Component
[22:29:46] [PASSED] DIN
[22:29:46] [PASSED] DP
[22:29:46] [PASSED] HDMI-A
[22:29:46] [PASSED] HDMI-B
[22:29:46] [PASSED] TV
[22:29:46] [PASSED] eDP
[22:29:46] [PASSED] Virtual
[22:29:46] [PASSED] DSI
[22:29:46] [PASSED] DPI
[22:29:46] [PASSED] Writeback
[22:29:46] [PASSED] SPI
[22:29:46] [PASSED] USB
[22:29:46] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[22:29:46] =========== [PASSED] drm_connector_dynamic_init ============
[22:29:46] ==== drm_connector_dynamic_register_early (4 subtests) =====
[22:29:46] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[22:29:46] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[22:29:46] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[22:29:46] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[22:29:46] ====== [PASSED] drm_connector_dynamic_register_early =======
[22:29:46] ======= drm_connector_dynamic_register (7 subtests) ========
[22:29:46] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[22:29:46] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[22:29:46] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[22:29:46] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[22:29:46] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[22:29:46] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[22:29:46] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[22:29:46] ========= [PASSED] drm_connector_dynamic_register ==========
[22:29:46] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[22:29:46] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[22:29:46] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[22:29:46] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[22:29:46] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[22:29:46] ========== drm_test_get_tv_mode_from_name_valid  ===========
[22:29:46] [PASSED] NTSC
[22:29:46] [PASSED] NTSC-443
[22:29:46] [PASSED] NTSC-J
[22:29:46] [PASSED] PAL
[22:29:46] [PASSED] PAL-M
[22:29:46] [PASSED] PAL-N
[22:29:46] [PASSED] SECAM
[22:29:46] [PASSED] Mono
[22:29:46] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[22:29:46] [PASSED] drm_test_get_tv_mode_from_name_truncated
[22:29:46] ============ [PASSED] drm_get_tv_mode_from_name ============
[22:29:46] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[22:29:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[22:29:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[22:29:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[22:29:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[22:29:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[22:29:46] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[22:29:46] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[22:29:46] [PASSED] VIC 96
[22:29:46] [PASSED] VIC 97
[22:29:46] [PASSED] VIC 101
[22:29:46] [PASSED] VIC 102
[22:29:46] [PASSED] VIC 106
[22:29:46] [PASSED] VIC 107
[22:29:46] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[22:29:46] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[22:29:46] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[22:29:46] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[22:29:46] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[22:29:46] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[22:29:46] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[22:29:46] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[22:29:46] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[22:29:46] [PASSED] Automatic
[22:29:46] [PASSED] Full
[22:29:46] [PASSED] Limited 16:235
[22:29:46] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[22:29:46] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[22:29:46] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[22:29:46] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[22:29:46] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[22:29:46] [PASSED] RGB
[22:29:46] [PASSED] YUV 4:2:0
[22:29:46] [PASSED] YUV 4:2:2
[22:29:46] [PASSED] YUV 4:4:4
[22:29:46] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[22:29:46] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[22:29:46] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[22:29:46] ============= drm_damage_helper (21 subtests) ==============
[22:29:46] [PASSED] drm_test_damage_iter_no_damage
[22:29:46] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[22:29:46] [PASSED] drm_test_damage_iter_no_damage_src_moved
[22:29:46] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[22:29:46] [PASSED] drm_test_damage_iter_no_damage_not_visible
[22:29:46] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[22:29:46] [PASSED] drm_test_damage_iter_no_damage_no_fb
[22:29:46] [PASSED] drm_test_damage_iter_simple_damage
[22:29:46] [PASSED] drm_test_damage_iter_single_damage
[22:29:46] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[22:29:46] [PASSED] drm_test_damage_iter_single_damage_outside_src
[22:29:46] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[22:29:46] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[22:29:46] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[22:29:46] [PASSED] drm_test_damage_iter_single_damage_src_moved
[22:29:46] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[22:29:46] [PASSED] drm_test_damage_iter_damage
[22:29:46] [PASSED] drm_test_damage_iter_damage_one_intersect
[22:29:46] [PASSED] drm_test_damage_iter_damage_one_outside
[22:29:46] [PASSED] drm_test_damage_iter_damage_src_moved
[22:29:46] [PASSED] drm_test_damage_iter_damage_not_visible
[22:29:46] ================ [PASSED] drm_damage_helper ================
[22:29:46] ============== drm_dp_mst_helper (3 subtests) ==============
[22:29:46] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[22:29:46] [PASSED] Clock 154000 BPP 30 DSC disabled
[22:29:46] [PASSED] Clock 234000 BPP 30 DSC disabled
[22:29:46] [PASSED] Clock 297000 BPP 24 DSC disabled
[22:29:46] [PASSED] Clock 332880 BPP 24 DSC enabled
[22:29:46] [PASSED] Clock 324540 BPP 24 DSC enabled
[22:29:46] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[22:29:46] ============== drm_test_dp_mst_calc_pbn_div  ===============
[22:29:46] [PASSED] Link rate 2000000 lane count 4
[22:29:46] [PASSED] Link rate 2000000 lane count 2
[22:29:46] [PASSED] Link rate 2000000 lane count 1
[22:29:46] [PASSED] Link rate 1350000 lane count 4
[22:29:46] [PASSED] Link rate 1350000 lane count 2
[22:29:46] [PASSED] Link rate 1350000 lane count 1
[22:29:46] [PASSED] Link rate 1000000 lane count 4
[22:29:46] [PASSED] Link rate 1000000 lane count 2
[22:29:46] [PASSED] Link rate 1000000 lane count 1
[22:29:46] [PASSED] Link rate 810000 lane count 4
[22:29:46] [PASSED] Link rate 810000 lane count 2
[22:29:46] [PASSED] Link rate 810000 lane count 1
[22:29:46] [PASSED] Link rate 540000 lane count 4
[22:29:46] [PASSED] Link rate 540000 lane count 2
[22:29:46] [PASSED] Link rate 540000 lane count 1
[22:29:46] [PASSED] Link rate 270000 lane count 4
[22:29:46] [PASSED] Link rate 270000 lane count 2
[22:29:46] [PASSED] Link rate 270000 lane count 1
[22:29:46] [PASSED] Link rate 162000 lane count 4
[22:29:46] [PASSED] Link rate 162000 lane count 2
[22:29:46] [PASSED] Link rate 162000 lane count 1
[22:29:46] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[22:29:46] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[22:29:46] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[22:29:46] [PASSED] DP_POWER_UP_PHY with port number
[22:29:46] [PASSED] DP_POWER_DOWN_PHY with port number
[22:29:46] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[22:29:46] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[22:29:46] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[22:29:46] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[22:29:46] [PASSED] DP_QUERY_PAYLOAD with port number
[22:29:46] [PASSED] DP_QUERY_PAYLOAD with VCPI
[22:29:46] [PASSED] DP_REMOTE_DPCD_READ with port number
[22:29:46] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[22:29:46] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[22:29:46] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[22:29:46] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[22:29:46] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[22:29:46] [PASSED] DP_REMOTE_I2C_READ with port number
[22:29:46] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[22:29:46] [PASSED] DP_REMOTE_I2C_READ with transactions array
[22:29:46] [PASSED] DP_REMOTE_I2C_WRITE with port number
[22:29:46] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[22:29:46] [PASSED] DP_REMOTE_I2C_WRITE with data array
[22:29:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[22:29:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[22:29:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[22:29:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[22:29:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[22:29:46] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[22:29:46] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[22:29:46] ================ [PASSED] drm_dp_mst_helper ================
[22:29:46] ================== drm_exec (7 subtests) ===================
[22:29:46] [PASSED] sanitycheck
[22:29:46] [PASSED] test_lock
[22:29:46] [PASSED] test_lock_unlock
[22:29:46] [PASSED] test_duplicates
[22:29:46] [PASSED] test_prepare
[22:29:46] [PASSED] test_prepare_array
[22:29:46] [PASSED] test_multiple_loops
[22:29:46] ==================== [PASSED] drm_exec =====================
[22:29:46] =========== drm_format_helper_test (17 subtests) ===========
[22:29:46] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[22:29:46] [PASSED] single_pixel_source_buffer
[22:29:46] [PASSED] single_pixel_clip_rectangle
[22:29:46] [PASSED] well_known_colors
[22:29:46] [PASSED] destination_pitch
[22:29:46] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[22:29:46] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[22:29:46] [PASSED] single_pixel_source_buffer
[22:29:46] [PASSED] single_pixel_clip_rectangle
[22:29:46] [PASSED] well_known_colors
[22:29:46] [PASSED] destination_pitch
[22:29:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[22:29:46] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[22:29:46] [PASSED] single_pixel_source_buffer
[22:29:46] [PASSED] single_pixel_clip_rectangle
[22:29:46] [PASSED] well_known_colors
[22:29:46] [PASSED] destination_pitch
[22:29:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[22:29:46] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[22:29:46] [PASSED] single_pixel_source_buffer
[22:29:46] [PASSED] single_pixel_clip_rectangle
[22:29:46] [PASSED] well_known_colors
[22:29:46] [PASSED] destination_pitch
[22:29:46] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[22:29:46] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[22:29:46] [PASSED] single_pixel_source_buffer
[22:29:46] [PASSED] single_pixel_clip_rectangle
[22:29:46] [PASSED] well_known_colors
[22:29:46] [PASSED] destination_pitch
[22:29:46] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[22:29:46] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[22:29:46] [PASSED] single_pixel_source_buffer
[22:29:46] [PASSED] single_pixel_clip_rectangle
[22:29:46] [PASSED] well_known_colors
[22:29:46] [PASSED] destination_pitch
[22:29:46] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[22:29:46] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[22:29:46] [PASSED] single_pixel_source_buffer
[22:29:46] [PASSED] single_pixel_clip_rectangle
[22:29:46] [PASSED] well_known_colors
[22:29:46] [PASSED] destination_pitch
[22:29:46] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[22:29:46] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[22:29:46] [PASSED] single_pixel_source_buffer
[22:29:46] [PASSED] single_pixel_clip_rectangle
[22:29:46] [PASSED] well_known_colors
[22:29:46] [PASSED] destination_pitch
[22:29:46] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[22:29:46] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[22:29:46] [PASSED] single_pixel_source_buffer
[22:29:46] [PASSED] single_pixel_clip_rectangle
[22:29:46] [PASSED] well_known_colors
[22:29:46] [PASSED] destination_pitch
[22:29:46] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[22:29:46] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[22:29:46] [PASSED] single_pixel_source_buffer
[22:29:46] [PASSED] single_pixel_clip_rectangle
[22:29:46] [PASSED] well_known_colors
[22:29:46] [PASSED] destination_pitch
[22:29:46] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[22:29:46] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[22:29:46] [PASSED] single_pixel_source_buffer
[22:29:46] [PASSED] single_pixel_clip_rectangle
[22:29:46] [PASSED] well_known_colors
[22:29:46] [PASSED] destination_pitch
[22:29:46] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[22:29:46] ============== drm_test_fb_xrgb8888_to_mono  ===============
[22:29:46] [PASSED] single_pixel_source_buffer
[22:29:46] [PASSED] single_pixel_clip_rectangle
[22:29:46] [PASSED] well_known_colors
[22:29:46] [PASSED] destination_pitch
[22:29:46] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[22:29:46] ==================== drm_test_fb_swab  =====================
[22:29:46] [PASSED] single_pixel_source_buffer
[22:29:46] [PASSED] single_pixel_clip_rectangle
[22:29:46] [PASSED] well_known_colors
[22:29:46] [PASSED] destination_pitch
[22:29:46] ================ [PASSED] drm_test_fb_swab =================
[22:29:46] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[22:29:46] [PASSED] single_pixel_source_buffer
[22:29:46] [PASSED] single_pixel_clip_rectangle
[22:29:46] [PASSED] well_known_colors
[22:29:46] [PASSED] destination_pitch
[22:29:46] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[22:29:46] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[22:29:46] [PASSED] single_pixel_source_buffer
[22:29:46] [PASSED] single_pixel_clip_rectangle
[22:29:46] [PASSED] well_known_colors
[22:29:46] [PASSED] destination_pitch
[22:29:46] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[22:29:46] ================= drm_test_fb_clip_offset  =================
[22:29:46] [PASSED] pass through
[22:29:46] [PASSED] horizontal offset
[22:29:46] [PASSED] vertical offset
[22:29:46] [PASSED] horizontal and vertical offset
[22:29:46] [PASSED] horizontal offset (custom pitch)
[22:29:46] [PASSED] vertical offset (custom pitch)
[22:29:46] [PASSED] horizontal and vertical offset (custom pitch)
[22:29:46] ============= [PASSED] drm_test_fb_clip_offset =============
[22:29:46] =================== drm_test_fb_memcpy  ====================
[22:29:46] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[22:29:46] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[22:29:46] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[22:29:46] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[22:29:46] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[22:29:46] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[22:29:46] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[22:29:46] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[22:29:46] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[22:29:46] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[22:29:46] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[22:29:46] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[22:29:46] =============== [PASSED] drm_test_fb_memcpy ================
[22:29:46] ============= [PASSED] drm_format_helper_test ==============
[22:29:46] ================= drm_format (18 subtests) =================
[22:29:46] [PASSED] drm_test_format_block_width_invalid
[22:29:46] [PASSED] drm_test_format_block_width_one_plane
[22:29:46] [PASSED] drm_test_format_block_width_two_plane
[22:29:46] [PASSED] drm_test_format_block_width_three_plane
[22:29:46] [PASSED] drm_test_format_block_width_tiled
[22:29:46] [PASSED] drm_test_format_block_height_invalid
[22:29:46] [PASSED] drm_test_format_block_height_one_plane
[22:29:46] [PASSED] drm_test_format_block_height_two_plane
[22:29:46] [PASSED] drm_test_format_block_height_three_plane
[22:29:46] [PASSED] drm_test_format_block_height_tiled
[22:29:46] [PASSED] drm_test_format_min_pitch_invalid
[22:29:46] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[22:29:46] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[22:29:46] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[22:29:46] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[22:29:46] [PASSED] drm_test_format_min_pitch_two_plane
[22:29:46] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[22:29:46] [PASSED] drm_test_format_min_pitch_tiled
[22:29:46] =================== [PASSED] drm_format ====================
[22:29:46] ============== drm_framebuffer (10 subtests) ===============
[22:29:46] ========== drm_test_framebuffer_check_src_coords  ==========
[22:29:46] [PASSED] Success: source fits into fb
[22:29:46] [PASSED] Fail: overflowing fb with x-axis coordinate
[22:29:46] [PASSED] Fail: overflowing fb with y-axis coordinate
[22:29:46] [PASSED] Fail: overflowing fb with source width
[22:29:46] [PASSED] Fail: overflowing fb with source height
[22:29:46] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[22:29:46] [PASSED] drm_test_framebuffer_cleanup
[22:29:46] =============== drm_test_framebuffer_create  ===============
[22:29:46] [PASSED] ABGR8888 normal sizes
[22:29:46] [PASSED] ABGR8888 max sizes
[22:29:46] [PASSED] ABGR8888 pitch greater than min required
[22:29:46] [PASSED] ABGR8888 pitch less than min required
[22:29:46] [PASSED] ABGR8888 Invalid width
[22:29:46] [PASSED] ABGR8888 Invalid buffer handle
[22:29:46] [PASSED] No pixel format
[22:29:46] [PASSED] ABGR8888 Width 0
[22:29:46] [PASSED] ABGR8888 Height 0
[22:29:46] [PASSED] ABGR8888 Out of bound height * pitch combination
[22:29:46] [PASSED] ABGR8888 Large buffer offset
[22:29:46] [PASSED] ABGR8888 Buffer offset for inexistent plane
[22:29:46] [PASSED] ABGR8888 Invalid flag
[22:29:46] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[22:29:46] [PASSED] ABGR8888 Valid buffer modifier
[22:29:46] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[22:29:46] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[22:29:46] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[22:29:46] [PASSED] NV12 Normal sizes
[22:29:46] [PASSED] NV12 Max sizes
[22:29:46] [PASSED] NV12 Invalid pitch
[22:29:46] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[22:29:46] [PASSED] NV12 different  modifier per-plane
[22:29:46] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[22:29:46] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[22:29:46] [PASSED] NV12 Modifier for inexistent plane
[22:29:46] [PASSED] NV12 Handle for inexistent plane
[22:29:46] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[22:29:46] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[22:29:46] [PASSED] YVU420 Normal sizes
[22:29:46] [PASSED] YVU420 Max sizes
[22:29:46] [PASSED] YVU420 Invalid pitch
[22:29:46] [PASSED] YVU420 Different pitches
[22:29:46] [PASSED] YVU420 Different buffer offsets/pitches
[22:29:46] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[22:29:46] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[22:29:46] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[22:29:46] [PASSED] YVU420 Valid modifier
[22:29:46] [PASSED] YVU420 Different modifiers per plane
[22:29:46] [PASSED] YVU420 Modifier for inexistent plane
[22:29:46] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[22:29:46] [PASSED] X0L2 Normal sizes
[22:29:46] [PASSED] X0L2 Max sizes
[22:29:46] [PASSED] X0L2 Invalid pitch
[22:29:46] [PASSED] X0L2 Pitch greater than minimum required
[22:29:46] [PASSED] X0L2 Handle for inexistent plane
[22:29:46] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[22:29:46] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[22:29:46] [PASSED] X0L2 Valid modifier
[22:29:46] [PASSED] X0L2 Modifier for inexistent plane
[22:29:46] =========== [PASSED] drm_test_framebuffer_create ===========
[22:29:46] [PASSED] drm_test_framebuffer_free
[22:29:46] [PASSED] drm_test_framebuffer_init
[22:29:46] [PASSED] drm_test_framebuffer_init_bad_format
[22:29:46] [PASSED] drm_test_framebuffer_init_dev_mismatch
[22:29:46] [PASSED] drm_test_framebuffer_lookup
[22:29:46] [PASSED] drm_test_framebuffer_lookup_inexistent
[22:29:46] [PASSED] drm_test_framebuffer_modifiers_not_supported
[22:29:46] ================= [PASSED] drm_framebuffer =================
[22:29:46] ================ drm_gem_shmem (8 subtests) ================
[22:29:46] [PASSED] drm_gem_shmem_test_obj_create
[22:29:46] [PASSED] drm_gem_shmem_test_obj_create_private
[22:29:46] [PASSED] drm_gem_shmem_test_pin_pages
[22:29:46] [PASSED] drm_gem_shmem_test_vmap
[22:29:46] [PASSED] drm_gem_shmem_test_get_pages_sgt
[22:29:46] [PASSED] drm_gem_shmem_test_get_sg_table
[22:29:46] [PASSED] drm_gem_shmem_test_madvise
[22:29:46] [PASSED] drm_gem_shmem_test_purge
[22:29:46] ================== [PASSED] drm_gem_shmem ==================
[22:29:46] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[22:29:46] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[22:29:46] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[22:29:46] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[22:29:46] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[22:29:46] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[22:29:46] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[22:29:46] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[22:29:46] [PASSED] Automatic
[22:29:46] [PASSED] Full
[22:29:46] [PASSED] Limited 16:235
[22:29:46] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[22:29:46] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[22:29:46] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[22:29:46] [PASSED] drm_test_check_disable_connector
[22:29:46] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[22:29:46] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[22:29:46] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[22:29:46] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[22:29:46] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[22:29:46] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[22:29:46] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[22:29:46] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[22:29:46] [PASSED] drm_test_check_output_bpc_dvi
[22:29:46] [PASSED] drm_test_check_output_bpc_format_vic_1
[22:29:46] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[22:29:46] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[22:29:46] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[22:29:46] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[22:29:46] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[22:29:46] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[22:29:46] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[22:29:46] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[22:29:46] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[22:29:46] [PASSED] drm_test_check_broadcast_rgb_value
[22:29:46] [PASSED] drm_test_check_bpc_8_value
[22:29:46] [PASSED] drm_test_check_bpc_10_value
[22:29:46] [PASSED] drm_test_check_bpc_12_value
[22:29:46] [PASSED] drm_test_check_format_value
[22:29:46] [PASSED] drm_test_check_tmds_char_value
[22:29:46] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[22:29:46] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[22:29:46] [PASSED] drm_test_check_mode_valid
[22:29:46] [PASSED] drm_test_check_mode_valid_reject
[22:29:46] [PASSED] drm_test_check_mode_valid_reject_rate
[22:29:46] [PASSED] drm_test_check_mode_valid_reject_max_clock
[22:29:46] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[22:29:46] ================= drm_managed (2 subtests) =================
[22:29:46] [PASSED] drm_test_managed_release_action
[22:29:46] [PASSED] drm_test_managed_run_action
[22:29:46] =================== [PASSED] drm_managed ===================
[22:29:46] =================== drm_mm (6 subtests) ====================
[22:29:46] [PASSED] drm_test_mm_init
[22:29:46] [PASSED] drm_test_mm_debug
[22:29:46] [PASSED] drm_test_mm_align32
[22:29:46] [PASSED] drm_test_mm_align64
[22:29:46] [PASSED] drm_test_mm_lowest
[22:29:46] [PASSED] drm_test_mm_highest
[22:29:46] ===================== [PASSED] drm_mm ======================
[22:29:46] ============= drm_modes_analog_tv (5 subtests) =============
[22:29:46] [PASSED] drm_test_modes_analog_tv_mono_576i
[22:29:46] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[22:29:46] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[22:29:46] [PASSED] drm_test_modes_analog_tv_pal_576i
[22:29:46] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[22:29:46] =============== [PASSED] drm_modes_analog_tv ===============
[22:29:46] ============== drm_plane_helper (2 subtests) ===============
[22:29:46] =============== drm_test_check_plane_state  ================
[22:29:46] [PASSED] clipping_simple
[22:29:46] [PASSED] clipping_rotate_reflect
[22:29:46] [PASSED] positioning_simple
[22:29:46] [PASSED] upscaling
[22:29:46] [PASSED] downscaling
[22:29:46] [PASSED] rounding1
[22:29:46] [PASSED] rounding2
[22:29:46] [PASSED] rounding3
[22:29:46] [PASSED] rounding4
[22:29:46] =========== [PASSED] drm_test_check_plane_state ============
[22:29:46] =========== drm_test_check_invalid_plane_state  ============
[22:29:46] [PASSED] positioning_invalid
[22:29:46] [PASSED] upscaling_invalid
[22:29:46] [PASSED] downscaling_invalid
[22:29:46] ======= [PASSED] drm_test_check_invalid_plane_state ========
[22:29:46] ================ [PASSED] drm_plane_helper =================
[22:29:46] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[22:29:46] ====== drm_test_connector_helper_tv_get_modes_check  =======
[22:29:46] [PASSED] None
[22:29:46] [PASSED] PAL
[22:29:46] [PASSED] NTSC
[22:29:46] [PASSED] Both, NTSC Default
[22:29:46] [PASSED] Both, PAL Default
[22:29:46] [PASSED] Both, NTSC Default, with PAL on command-line
[22:29:46] [PASSED] Both, PAL Default, with NTSC on command-line
[22:29:46] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[22:29:46] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[22:29:46] ================== drm_rect (9 subtests) ===================
[22:29:46] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[22:29:46] [PASSED] drm_test_rect_clip_scaled_not_clipped
[22:29:46] [PASSED] drm_test_rect_clip_scaled_clipped
[22:29:46] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[22:29:46] ================= drm_test_rect_intersect  =================
[22:29:46] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[22:29:46] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[22:29:46] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[22:29:46] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[22:29:46] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[22:29:46] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[22:29:46] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[22:29:46] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[22:29:46] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[22:29:46] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[22:29:46] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[22:29:46] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[22:29:46] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[22:29:46] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[22:29:46] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[22:29:46] ============= [PASSED] drm_test_rect_intersect =============
[22:29:46] ================ drm_test_rect_calc_hscale  ================
[22:29:46] [PASSED] normal use
[22:29:46] [PASSED] out of max range
[22:29:46] [PASSED] out of min range
[22:29:46] [PASSED] zero dst
[22:29:46] [PASSED] negative src
[22:29:46] [PASSED] negative dst
[22:29:46] ============ [PASSED] drm_test_rect_calc_hscale ============
[22:29:46] ================ drm_test_rect_calc_vscale  ================
[22:29:46] [PASSED] normal use
stty: 'standard input': Inappropriate ioctl for device
[22:29:46] [PASSED] out of max range
[22:29:46] [PASSED] out of min range
[22:29:46] [PASSED] zero dst
[22:29:46] [PASSED] negative src
[22:29:46] [PASSED] negative dst
[22:29:46] ============ [PASSED] drm_test_rect_calc_vscale ============
[22:29:46] ================== drm_test_rect_rotate  ===================
[22:29:46] [PASSED] reflect-x
[22:29:46] [PASSED] reflect-y
[22:29:46] [PASSED] rotate-0
[22:29:46] [PASSED] rotate-90
[22:29:46] [PASSED] rotate-180
[22:29:46] [PASSED] rotate-270
[22:29:46] ============== [PASSED] drm_test_rect_rotate ===============
[22:29:46] ================ drm_test_rect_rotate_inv  =================
[22:29:46] [PASSED] reflect-x
[22:29:46] [PASSED] reflect-y
[22:29:46] [PASSED] rotate-0
[22:29:46] [PASSED] rotate-90
[22:29:46] [PASSED] rotate-180
[22:29:46] [PASSED] rotate-270
[22:29:46] ============ [PASSED] drm_test_rect_rotate_inv =============
[22:29:46] ==================== [PASSED] drm_rect =====================
[22:29:46] ============ drm_sysfb_modeset_test (1 subtest) ============
[22:29:46] ============ drm_test_sysfb_build_fourcc_list  =============
[22:29:46] [PASSED] no native formats
[22:29:46] [PASSED] XRGB8888 as native format
[22:29:46] [PASSED] remove duplicates
[22:29:46] [PASSED] convert alpha formats
[22:29:46] [PASSED] random formats
[22:29:46] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[22:29:46] ============= [PASSED] drm_sysfb_modeset_test ==============
[22:29:46] ================== drm_fixp (2 subtests) ===================
[22:29:46] [PASSED] drm_test_int2fixp
[22:29:46] [PASSED] drm_test_sm2fixp
[22:29:46] ==================== [PASSED] drm_fixp =====================
[22:29:46] ============================================================
[22:29:46] Testing complete. Ran 624 tests: passed: 624
[22:29:46] Elapsed time: 27.210s total, 1.604s configuring, 25.185s building, 0.376s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[22:29:46] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:29:48] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[22:29:57] Starting KUnit Kernel (1/1)...
[22:29:57] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[22:29:57] ================= ttm_device (5 subtests) ==================
[22:29:57] [PASSED] ttm_device_init_basic
[22:29:57] [PASSED] ttm_device_init_multiple
[22:29:57] [PASSED] ttm_device_fini_basic
[22:29:57] [PASSED] ttm_device_init_no_vma_man
[22:29:57] ================== ttm_device_init_pools  ==================
[22:29:57] [PASSED] No DMA allocations, no DMA32 required
[22:29:57] [PASSED] DMA allocations, DMA32 required
[22:29:57] [PASSED] No DMA allocations, DMA32 required
[22:29:57] [PASSED] DMA allocations, no DMA32 required
[22:29:57] ============== [PASSED] ttm_device_init_pools ==============
[22:29:57] =================== [PASSED] ttm_device ====================
[22:29:57] ================== ttm_pool (8 subtests) ===================
[22:29:57] ================== ttm_pool_alloc_basic  ===================
[22:29:57] [PASSED] One page
[22:29:57] [PASSED] More than one page
[22:29:57] [PASSED] Above the allocation limit
[22:29:57] [PASSED] One page, with coherent DMA mappings enabled
[22:29:57] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[22:29:57] ============== [PASSED] ttm_pool_alloc_basic ===============
[22:29:57] ============== ttm_pool_alloc_basic_dma_addr  ==============
[22:29:57] [PASSED] One page
[22:29:57] [PASSED] More than one page
[22:29:57] [PASSED] Above the allocation limit
[22:29:57] [PASSED] One page, with coherent DMA mappings enabled
[22:29:57] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[22:29:57] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[22:29:57] [PASSED] ttm_pool_alloc_order_caching_match
[22:29:57] [PASSED] ttm_pool_alloc_caching_mismatch
[22:29:57] [PASSED] ttm_pool_alloc_order_mismatch
[22:29:57] [PASSED] ttm_pool_free_dma_alloc
[22:29:57] [PASSED] ttm_pool_free_no_dma_alloc
[22:29:57] [PASSED] ttm_pool_fini_basic
[22:29:57] ==================== [PASSED] ttm_pool =====================
[22:29:57] ================ ttm_resource (8 subtests) =================
[22:29:57] ================= ttm_resource_init_basic  =================
[22:29:57] [PASSED] Init resource in TTM_PL_SYSTEM
[22:29:57] [PASSED] Init resource in TTM_PL_VRAM
[22:29:57] [PASSED] Init resource in a private placement
[22:29:57] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[22:29:57] ============= [PASSED] ttm_resource_init_basic =============
[22:29:57] [PASSED] ttm_resource_init_pinned
[22:29:57] [PASSED] ttm_resource_fini_basic
[22:29:57] [PASSED] ttm_resource_manager_init_basic
[22:29:57] [PASSED] ttm_resource_manager_usage_basic
[22:29:57] [PASSED] ttm_resource_manager_set_used_basic
[22:29:57] [PASSED] ttm_sys_man_alloc_basic
[22:29:57] [PASSED] ttm_sys_man_free_basic
[22:29:57] ================== [PASSED] ttm_resource ===================
[22:29:57] =================== ttm_tt (15 subtests) ===================
[22:29:57] ==================== ttm_tt_init_basic  ====================
[22:29:57] [PASSED] Page-aligned size
[22:29:57] [PASSED] Extra pages requested
[22:29:57] ================ [PASSED] ttm_tt_init_basic ================
[22:29:57] [PASSED] ttm_tt_init_misaligned
[22:29:57] [PASSED] ttm_tt_fini_basic
[22:29:57] [PASSED] ttm_tt_fini_sg
[22:29:57] [PASSED] ttm_tt_fini_shmem
[22:29:57] [PASSED] ttm_tt_create_basic
[22:29:57] [PASSED] ttm_tt_create_invalid_bo_type
[22:29:57] [PASSED] ttm_tt_create_ttm_exists
[22:29:57] [PASSED] ttm_tt_create_failed
[22:29:57] [PASSED] ttm_tt_destroy_basic
[22:29:57] [PASSED] ttm_tt_populate_null_ttm
[22:29:57] [PASSED] ttm_tt_populate_populated_ttm
[22:29:57] [PASSED] ttm_tt_unpopulate_basic
[22:29:57] [PASSED] ttm_tt_unpopulate_empty_ttm
[22:29:57] [PASSED] ttm_tt_swapin_basic
[22:29:57] ===================== [PASSED] ttm_tt ======================
[22:29:57] =================== ttm_bo (14 subtests) ===================
[22:29:57] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[22:29:57] [PASSED] Cannot be interrupted and sleeps
[22:29:57] [PASSED] Cannot be interrupted, locks straight away
[22:29:57] [PASSED] Can be interrupted, sleeps
[22:29:57] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[22:29:57] [PASSED] ttm_bo_reserve_locked_no_sleep
[22:29:57] [PASSED] ttm_bo_reserve_no_wait_ticket
[22:29:57] [PASSED] ttm_bo_reserve_double_resv
[22:29:57] [PASSED] ttm_bo_reserve_interrupted
[22:29:57] [PASSED] ttm_bo_reserve_deadlock
[22:29:57] [PASSED] ttm_bo_unreserve_basic
[22:29:57] [PASSED] ttm_bo_unreserve_pinned
[22:29:57] [PASSED] ttm_bo_unreserve_bulk
[22:29:57] [PASSED] ttm_bo_fini_basic
[22:29:57] [PASSED] ttm_bo_fini_shared_resv
[22:29:57] [PASSED] ttm_bo_pin_basic
[22:29:57] [PASSED] ttm_bo_pin_unpin_resource
[22:29:57] [PASSED] ttm_bo_multiple_pin_one_unpin
[22:29:57] ===================== [PASSED] ttm_bo ======================
[22:29:57] ============== ttm_bo_validate (21 subtests) ===============
[22:29:57] ============== ttm_bo_init_reserved_sys_man  ===============
[22:29:57] [PASSED] Buffer object for userspace
[22:29:57] [PASSED] Kernel buffer object
[22:29:57] [PASSED] Shared buffer object
[22:29:57] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[22:29:57] ============== ttm_bo_init_reserved_mock_man  ==============
[22:29:57] [PASSED] Buffer object for userspace
[22:29:57] [PASSED] Kernel buffer object
[22:29:57] [PASSED] Shared buffer object
[22:29:57] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[22:29:57] [PASSED] ttm_bo_init_reserved_resv
[22:29:57] ================== ttm_bo_validate_basic  ==================
[22:29:57] [PASSED] Buffer object for userspace
[22:29:57] [PASSED] Kernel buffer object
[22:29:57] [PASSED] Shared buffer object
[22:29:57] ============== [PASSED] ttm_bo_validate_basic ==============
[22:29:57] [PASSED] ttm_bo_validate_invalid_placement
[22:29:57] ============= ttm_bo_validate_same_placement  ==============
[22:29:57] [PASSED] System manager
[22:29:57] [PASSED] VRAM manager
[22:29:57] ========= [PASSED] ttm_bo_validate_same_placement ==========
[22:29:57] [PASSED] ttm_bo_validate_failed_alloc
[22:29:57] [PASSED] ttm_bo_validate_pinned
[22:29:57] [PASSED] ttm_bo_validate_busy_placement
[22:29:57] ================ ttm_bo_validate_multihop  =================
[22:29:57] [PASSED] Buffer object for userspace
[22:29:57] [PASSED] Kernel buffer object
[22:29:57] [PASSED] Shared buffer object
[22:29:57] ============ [PASSED] ttm_bo_validate_multihop =============
[22:29:57] ========== ttm_bo_validate_no_placement_signaled  ==========
[22:29:57] [PASSED] Buffer object in system domain, no page vector
[22:29:57] [PASSED] Buffer object in system domain with an existing page vector
[22:29:57] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[22:29:57] ======== ttm_bo_validate_no_placement_not_signaled  ========
[22:29:57] [PASSED] Buffer object for userspace
[22:29:57] [PASSED] Kernel buffer object
[22:29:57] [PASSED] Shared buffer object
[22:29:57] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[22:29:57] [PASSED] ttm_bo_validate_move_fence_signaled
[22:29:57] ========= ttm_bo_validate_move_fence_not_signaled  =========
[22:29:57] [PASSED] Waits for GPU
[22:29:57] [PASSED] Tries to lock straight away
[22:29:57] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[22:29:57] [PASSED] ttm_bo_validate_happy_evict
[22:29:57] [PASSED] ttm_bo_validate_all_pinned_evict
[22:29:57] [PASSED] ttm_bo_validate_allowed_only_evict
[22:29:57] [PASSED] ttm_bo_validate_deleted_evict
[22:29:57] [PASSED] ttm_bo_validate_busy_domain_evict
[22:29:57] [PASSED] ttm_bo_validate_evict_gutting
[22:29:57] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[22:29:57] ================= [PASSED] ttm_bo_validate =================
[22:29:57] ============================================================
[22:29:57] Testing complete. Ran 101 tests: passed: 101
[22:29:57] Elapsed time: 11.184s total, 1.661s configuring, 9.307s building, 0.184s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


