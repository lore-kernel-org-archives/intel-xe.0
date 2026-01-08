Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DCBD1D483
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 18:49:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2FA10E384;
	Thu,  8 Jan 2026 18:49:33 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F3F10E378;
 Thu,  8 Jan 2026 18:49:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/guc=3A_Bump_GUC_version?=
 =?utf-8?q?_for_NVL-S=2C_CRI_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Jan 2026 18:49:32 -0000
Message-ID: <176789817208.138403.15445884625478790174@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260108181956.1254908-6-julia.filipchuk@intel.com>
In-Reply-To: <20260108181956.1254908-6-julia.filipchuk@intel.com>
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

Series: drm/xe/guc: Bump GUC version for NVL-S, CRI (rev2)
URL   : https://patchwork.freedesktop.org/series/159711/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[18:48:12] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:48:16] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[18:48:48] Starting KUnit Kernel (1/1)...
[18:48:48] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[18:48:48] ================== guc_buf (11 subtests) ===================
[18:48:48] [PASSED] test_smallest
[18:48:48] [PASSED] test_largest
[18:48:48] [PASSED] test_granular
[18:48:48] [PASSED] test_unique
[18:48:48] [PASSED] test_overlap
[18:48:48] [PASSED] test_reusable
[18:48:48] [PASSED] test_too_big
[18:48:48] [PASSED] test_flush
[18:48:48] [PASSED] test_lookup
[18:48:48] [PASSED] test_data
[18:48:48] [PASSED] test_class
[18:48:48] ===================== [PASSED] guc_buf =====================
[18:48:48] =================== guc_dbm (7 subtests) ===================
[18:48:48] [PASSED] test_empty
[18:48:48] [PASSED] test_default
[18:48:48] ======================== test_size  ========================
[18:48:48] [PASSED] 4
[18:48:48] [PASSED] 8
[18:48:48] [PASSED] 32
[18:48:48] [PASSED] 256
[18:48:48] ==================== [PASSED] test_size ====================
[18:48:48] ======================= test_reuse  ========================
[18:48:48] [PASSED] 4
[18:48:48] [PASSED] 8
[18:48:48] [PASSED] 32
[18:48:48] [PASSED] 256
[18:48:48] =================== [PASSED] test_reuse ====================
[18:48:48] =================== test_range_overlap  ====================
[18:48:48] [PASSED] 4
[18:48:48] [PASSED] 8
[18:48:48] [PASSED] 32
[18:48:48] [PASSED] 256
[18:48:48] =============== [PASSED] test_range_overlap ================
[18:48:48] =================== test_range_compact  ====================
[18:48:48] [PASSED] 4
[18:48:48] [PASSED] 8
[18:48:48] [PASSED] 32
[18:48:48] [PASSED] 256
[18:48:48] =============== [PASSED] test_range_compact ================
[18:48:48] ==================== test_range_spare  =====================
[18:48:48] [PASSED] 4
[18:48:48] [PASSED] 8
[18:48:48] [PASSED] 32
[18:48:48] [PASSED] 256
[18:48:48] ================ [PASSED] test_range_spare =================
[18:48:48] ===================== [PASSED] guc_dbm =====================
[18:48:48] =================== guc_idm (6 subtests) ===================
[18:48:48] [PASSED] bad_init
[18:48:48] [PASSED] no_init
[18:48:48] [PASSED] init_fini
[18:48:48] [PASSED] check_used
[18:48:48] [PASSED] check_quota
[18:48:48] [PASSED] check_all
[18:48:48] ===================== [PASSED] guc_idm =====================
[18:48:48] ================== no_relay (3 subtests) ===================
[18:48:48] [PASSED] xe_drops_guc2pf_if_not_ready
[18:48:48] [PASSED] xe_drops_guc2vf_if_not_ready
[18:48:48] [PASSED] xe_rejects_send_if_not_ready
[18:48:48] ==================== [PASSED] no_relay =====================
[18:48:48] ================== pf_relay (14 subtests) ==================
[18:48:48] [PASSED] pf_rejects_guc2pf_too_short
[18:48:48] [PASSED] pf_rejects_guc2pf_too_long
[18:48:48] [PASSED] pf_rejects_guc2pf_no_payload
[18:48:48] [PASSED] pf_fails_no_payload
[18:48:48] [PASSED] pf_fails_bad_origin
[18:48:48] [PASSED] pf_fails_bad_type
[18:48:48] [PASSED] pf_txn_reports_error
[18:48:48] [PASSED] pf_txn_sends_pf2guc
[18:48:48] [PASSED] pf_sends_pf2guc
[18:48:48] [SKIPPED] pf_loopback_nop
[18:48:48] [SKIPPED] pf_loopback_echo
[18:48:48] [SKIPPED] pf_loopback_fail
[18:48:48] [SKIPPED] pf_loopback_busy
[18:48:48] [SKIPPED] pf_loopback_retry
[18:48:48] ==================== [PASSED] pf_relay =====================
[18:48:48] ================== vf_relay (3 subtests) ===================
[18:48:48] [PASSED] vf_rejects_guc2vf_too_short
[18:48:48] [PASSED] vf_rejects_guc2vf_too_long
[18:48:48] [PASSED] vf_rejects_guc2vf_no_payload
[18:48:48] ==================== [PASSED] vf_relay =====================
[18:48:48] ================ pf_gt_config (6 subtests) =================
[18:48:48] [PASSED] fair_contexts_1vf
[18:48:48] [PASSED] fair_doorbells_1vf
[18:48:48] [PASSED] fair_ggtt_1vf
[18:48:48] ====================== fair_contexts  ======================
[18:48:48] [PASSED] 1 VF
[18:48:48] [PASSED] 2 VFs
[18:48:48] [PASSED] 3 VFs
[18:48:48] [PASSED] 4 VFs
[18:48:48] [PASSED] 5 VFs
[18:48:48] [PASSED] 6 VFs
[18:48:48] [PASSED] 7 VFs
[18:48:48] [PASSED] 8 VFs
[18:48:48] [PASSED] 9 VFs
[18:48:48] [PASSED] 10 VFs
[18:48:48] [PASSED] 11 VFs
[18:48:48] [PASSED] 12 VFs
[18:48:48] [PASSED] 13 VFs
[18:48:48] [PASSED] 14 VFs
[18:48:48] [PASSED] 15 VFs
[18:48:48] [PASSED] 16 VFs
[18:48:48] [PASSED] 17 VFs
[18:48:48] [PASSED] 18 VFs
[18:48:48] [PASSED] 19 VFs
[18:48:48] [PASSED] 20 VFs
[18:48:48] [PASSED] 21 VFs
[18:48:48] [PASSED] 22 VFs
[18:48:48] [PASSED] 23 VFs
[18:48:48] [PASSED] 24 VFs
[18:48:48] [PASSED] 25 VFs
[18:48:48] [PASSED] 26 VFs
[18:48:48] [PASSED] 27 VFs
[18:48:48] [PASSED] 28 VFs
[18:48:48] [PASSED] 29 VFs
[18:48:48] [PASSED] 30 VFs
[18:48:48] [PASSED] 31 VFs
[18:48:48] [PASSED] 32 VFs
[18:48:48] [PASSED] 33 VFs
[18:48:48] [PASSED] 34 VFs
[18:48:48] [PASSED] 35 VFs
[18:48:48] [PASSED] 36 VFs
[18:48:48] [PASSED] 37 VFs
[18:48:48] [PASSED] 38 VFs
[18:48:48] [PASSED] 39 VFs
[18:48:48] [PASSED] 40 VFs
[18:48:48] [PASSED] 41 VFs
[18:48:48] [PASSED] 42 VFs
[18:48:48] [PASSED] 43 VFs
[18:48:48] [PASSED] 44 VFs
[18:48:48] [PASSED] 45 VFs
[18:48:48] [PASSED] 46 VFs
[18:48:48] [PASSED] 47 VFs
[18:48:48] [PASSED] 48 VFs
[18:48:48] [PASSED] 49 VFs
[18:48:48] [PASSED] 50 VFs
[18:48:48] [PASSED] 51 VFs
[18:48:48] [PASSED] 52 VFs
[18:48:48] [PASSED] 53 VFs
[18:48:48] [PASSED] 54 VFs
[18:48:48] [PASSED] 55 VFs
[18:48:48] [PASSED] 56 VFs
[18:48:48] [PASSED] 57 VFs
[18:48:48] [PASSED] 58 VFs
[18:48:48] [PASSED] 59 VFs
[18:48:48] [PASSED] 60 VFs
[18:48:48] [PASSED] 61 VFs
[18:48:48] [PASSED] 62 VFs
[18:48:48] [PASSED] 63 VFs
[18:48:48] ================== [PASSED] fair_contexts ==================
[18:48:48] ===================== fair_doorbells  ======================
[18:48:48] [PASSED] 1 VF
[18:48:48] [PASSED] 2 VFs
[18:48:48] [PASSED] 3 VFs
[18:48:48] [PASSED] 4 VFs
[18:48:48] [PASSED] 5 VFs
[18:48:48] [PASSED] 6 VFs
[18:48:48] [PASSED] 7 VFs
[18:48:48] [PASSED] 8 VFs
[18:48:48] [PASSED] 9 VFs
[18:48:48] [PASSED] 10 VFs
[18:48:48] [PASSED] 11 VFs
[18:48:48] [PASSED] 12 VFs
[18:48:48] [PASSED] 13 VFs
[18:48:48] [PASSED] 14 VFs
[18:48:48] [PASSED] 15 VFs
[18:48:48] [PASSED] 16 VFs
[18:48:48] [PASSED] 17 VFs
[18:48:48] [PASSED] 18 VFs
[18:48:48] [PASSED] 19 VFs
[18:48:48] [PASSED] 20 VFs
[18:48:48] [PASSED] 21 VFs
[18:48:48] [PASSED] 22 VFs
[18:48:48] [PASSED] 23 VFs
[18:48:48] [PASSED] 24 VFs
[18:48:48] [PASSED] 25 VFs
[18:48:48] [PASSED] 26 VFs
[18:48:48] [PASSED] 27 VFs
[18:48:48] [PASSED] 28 VFs
[18:48:48] [PASSED] 29 VFs
[18:48:48] [PASSED] 30 VFs
[18:48:48] [PASSED] 31 VFs
[18:48:48] [PASSED] 32 VFs
[18:48:48] [PASSED] 33 VFs
[18:48:48] [PASSED] 34 VFs
[18:48:48] [PASSED] 35 VFs
[18:48:48] [PASSED] 36 VFs
[18:48:48] [PASSED] 37 VFs
[18:48:48] [PASSED] 38 VFs
[18:48:48] [PASSED] 39 VFs
[18:48:48] [PASSED] 40 VFs
[18:48:48] [PASSED] 41 VFs
[18:48:48] [PASSED] 42 VFs
[18:48:48] [PASSED] 43 VFs
[18:48:48] [PASSED] 44 VFs
[18:48:48] [PASSED] 45 VFs
[18:48:48] [PASSED] 46 VFs
[18:48:48] [PASSED] 47 VFs
[18:48:48] [PASSED] 48 VFs
[18:48:48] [PASSED] 49 VFs
[18:48:48] [PASSED] 50 VFs
[18:48:48] [PASSED] 51 VFs
[18:48:48] [PASSED] 52 VFs
[18:48:48] [PASSED] 53 VFs
[18:48:48] [PASSED] 54 VFs
[18:48:48] [PASSED] 55 VFs
[18:48:48] [PASSED] 56 VFs
[18:48:48] [PASSED] 57 VFs
[18:48:48] [PASSED] 58 VFs
[18:48:48] [PASSED] 59 VFs
[18:48:48] [PASSED] 60 VFs
[18:48:48] [PASSED] 61 VFs
[18:48:48] [PASSED] 62 VFs
[18:48:48] [PASSED] 63 VFs
[18:48:48] ================= [PASSED] fair_doorbells ==================
[18:48:48] ======================== fair_ggtt  ========================
[18:48:48] [PASSED] 1 VF
[18:48:48] [PASSED] 2 VFs
[18:48:48] [PASSED] 3 VFs
[18:48:48] [PASSED] 4 VFs
[18:48:48] [PASSED] 5 VFs
[18:48:48] [PASSED] 6 VFs
[18:48:48] [PASSED] 7 VFs
[18:48:48] [PASSED] 8 VFs
[18:48:48] [PASSED] 9 VFs
[18:48:48] [PASSED] 10 VFs
[18:48:48] [PASSED] 11 VFs
[18:48:48] [PASSED] 12 VFs
[18:48:48] [PASSED] 13 VFs
[18:48:48] [PASSED] 14 VFs
[18:48:48] [PASSED] 15 VFs
[18:48:48] [PASSED] 16 VFs
[18:48:48] [PASSED] 17 VFs
[18:48:48] [PASSED] 18 VFs
[18:48:48] [PASSED] 19 VFs
[18:48:48] [PASSED] 20 VFs
[18:48:48] [PASSED] 21 VFs
[18:48:48] [PASSED] 22 VFs
[18:48:48] [PASSED] 23 VFs
[18:48:48] [PASSED] 24 VFs
[18:48:48] [PASSED] 25 VFs
[18:48:48] [PASSED] 26 VFs
[18:48:48] [PASSED] 27 VFs
[18:48:48] [PASSED] 28 VFs
[18:48:48] [PASSED] 29 VFs
[18:48:48] [PASSED] 30 VFs
[18:48:48] [PASSED] 31 VFs
[18:48:48] [PASSED] 32 VFs
[18:48:48] [PASSED] 33 VFs
[18:48:48] [PASSED] 34 VFs
[18:48:48] [PASSED] 35 VFs
[18:48:48] [PASSED] 36 VFs
[18:48:48] [PASSED] 37 VFs
[18:48:48] [PASSED] 38 VFs
[18:48:48] [PASSED] 39 VFs
[18:48:48] [PASSED] 40 VFs
[18:48:48] [PASSED] 41 VFs
[18:48:48] [PASSED] 42 VFs
[18:48:48] [PASSED] 43 VFs
[18:48:48] [PASSED] 44 VFs
[18:48:48] [PASSED] 45 VFs
[18:48:48] [PASSED] 46 VFs
[18:48:48] [PASSED] 47 VFs
[18:48:48] [PASSED] 48 VFs
[18:48:48] [PASSED] 49 VFs
[18:48:48] [PASSED] 50 VFs
[18:48:48] [PASSED] 51 VFs
[18:48:48] [PASSED] 52 VFs
[18:48:48] [PASSED] 53 VFs
[18:48:48] [PASSED] 54 VFs
[18:48:48] [PASSED] 55 VFs
[18:48:48] [PASSED] 56 VFs
[18:48:48] [PASSED] 57 VFs
[18:48:48] [PASSED] 58 VFs
[18:48:48] [PASSED] 59 VFs
[18:48:48] [PASSED] 60 VFs
[18:48:48] [PASSED] 61 VFs
[18:48:48] [PASSED] 62 VFs
[18:48:48] [PASSED] 63 VFs
[18:48:48] ==================== [PASSED] fair_ggtt ====================
[18:48:48] ================== [PASSED] pf_gt_config ===================
[18:48:48] ===================== lmtt (1 subtest) =====================
[18:48:48] ======================== test_ops  =========================
[18:48:48] [PASSED] 2-level
[18:48:48] [PASSED] multi-level
[18:48:48] ==================== [PASSED] test_ops =====================
[18:48:48] ====================== [PASSED] lmtt =======================
[18:48:48] ================= pf_service (11 subtests) =================
[18:48:48] [PASSED] pf_negotiate_any
[18:48:48] [PASSED] pf_negotiate_base_match
[18:48:48] [PASSED] pf_negotiate_base_newer
[18:48:48] [PASSED] pf_negotiate_base_next
[18:48:48] [SKIPPED] pf_negotiate_base_older
[18:48:48] [PASSED] pf_negotiate_base_prev
[18:48:48] [PASSED] pf_negotiate_latest_match
[18:48:48] [PASSED] pf_negotiate_latest_newer
[18:48:48] [PASSED] pf_negotiate_latest_next
[18:48:48] [SKIPPED] pf_negotiate_latest_older
[18:48:48] [SKIPPED] pf_negotiate_latest_prev
[18:48:48] =================== [PASSED] pf_service ====================
[18:48:48] ================= xe_guc_g2g (2 subtests) ==================
[18:48:48] ============== xe_live_guc_g2g_kunit_default  ==============
[18:48:48] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[18:48:48] ============== xe_live_guc_g2g_kunit_allmem  ===============
[18:48:48] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[18:48:48] =================== [SKIPPED] xe_guc_g2g ===================
[18:48:48] =================== xe_mocs (2 subtests) ===================
[18:48:48] ================ xe_live_mocs_kernel_kunit  ================
[18:48:48] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[18:48:48] ================ xe_live_mocs_reset_kunit  =================
[18:48:48] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[18:48:48] ==================== [SKIPPED] xe_mocs =====================
[18:48:48] ================= xe_migrate (2 subtests) ==================
[18:48:48] ================= xe_migrate_sanity_kunit  =================
[18:48:48] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[18:48:48] ================== xe_validate_ccs_kunit  ==================
[18:48:48] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[18:48:48] =================== [SKIPPED] xe_migrate ===================
[18:48:48] ================== xe_dma_buf (1 subtest) ==================
[18:48:48] ==================== xe_dma_buf_kunit  =====================
[18:48:48] ================ [SKIPPED] xe_dma_buf_kunit ================
[18:48:48] =================== [SKIPPED] xe_dma_buf ===================
[18:48:48] ================= xe_bo_shrink (1 subtest) =================
[18:48:48] =================== xe_bo_shrink_kunit  ====================
[18:48:48] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[18:48:48] ================== [SKIPPED] xe_bo_shrink ==================
[18:48:48] ==================== xe_bo (2 subtests) ====================
[18:48:48] ================== xe_ccs_migrate_kunit  ===================
[18:48:48] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[18:48:48] ==================== xe_bo_evict_kunit  ====================
[18:48:48] =============== [SKIPPED] xe_bo_evict_kunit ================
[18:48:48] ===================== [SKIPPED] xe_bo ======================
[18:48:48] ==================== args (13 subtests) ====================
[18:48:48] [PASSED] count_args_test
[18:48:48] [PASSED] call_args_example
[18:48:48] [PASSED] call_args_test
[18:48:48] [PASSED] drop_first_arg_example
[18:48:48] [PASSED] drop_first_arg_test
[18:48:48] [PASSED] first_arg_example
[18:48:48] [PASSED] first_arg_test
[18:48:48] [PASSED] last_arg_example
[18:48:48] [PASSED] last_arg_test
[18:48:48] [PASSED] pick_arg_example
[18:48:48] [PASSED] if_args_example
[18:48:48] [PASSED] if_args_test
[18:48:48] [PASSED] sep_comma_example
[18:48:48] ====================== [PASSED] args =======================
[18:48:48] =================== xe_pci (3 subtests) ====================
[18:48:48] ==================== check_graphics_ip  ====================
[18:48:48] [PASSED] 12.00 Xe_LP
[18:48:48] [PASSED] 12.10 Xe_LP+
[18:48:48] [PASSED] 12.55 Xe_HPG
[18:48:48] [PASSED] 12.60 Xe_HPC
[18:48:48] [PASSED] 12.70 Xe_LPG
[18:48:48] [PASSED] 12.71 Xe_LPG
[18:48:48] [PASSED] 12.74 Xe_LPG+
[18:48:48] [PASSED] 20.01 Xe2_HPG
[18:48:48] [PASSED] 20.02 Xe2_HPG
[18:48:48] [PASSED] 20.04 Xe2_LPG
[18:48:48] [PASSED] 30.00 Xe3_LPG
[18:48:48] [PASSED] 30.01 Xe3_LPG
[18:48:48] [PASSED] 30.03 Xe3_LPG
[18:48:48] [PASSED] 30.04 Xe3_LPG
[18:48:48] [PASSED] 30.05 Xe3_LPG
[18:48:48] [PASSED] 35.11 Xe3p_XPC
[18:48:48] ================ [PASSED] check_graphics_ip ================
[18:48:48] ===================== check_media_ip  ======================
[18:48:48] [PASSED] 12.00 Xe_M
[18:48:48] [PASSED] 12.55 Xe_HPM
[18:48:48] [PASSED] 13.00 Xe_LPM+
[18:48:48] [PASSED] 13.01 Xe2_HPM
[18:48:48] [PASSED] 20.00 Xe2_LPM
[18:48:48] [PASSED] 30.00 Xe3_LPM
[18:48:48] [PASSED] 30.02 Xe3_LPM
[18:48:48] [PASSED] 35.00 Xe3p_LPM
[18:48:48] [PASSED] 35.03 Xe3p_HPM
[18:48:48] ================= [PASSED] check_media_ip ==================
[18:48:48] =================== check_platform_desc  ===================
[18:48:48] [PASSED] 0x9A60 (TIGERLAKE)
[18:48:48] [PASSED] 0x9A68 (TIGERLAKE)
[18:48:48] [PASSED] 0x9A70 (TIGERLAKE)
[18:48:48] [PASSED] 0x9A40 (TIGERLAKE)
[18:48:48] [PASSED] 0x9A49 (TIGERLAKE)
[18:48:48] [PASSED] 0x9A59 (TIGERLAKE)
[18:48:48] [PASSED] 0x9A78 (TIGERLAKE)
[18:48:48] [PASSED] 0x9AC0 (TIGERLAKE)
[18:48:48] [PASSED] 0x9AC9 (TIGERLAKE)
[18:48:48] [PASSED] 0x9AD9 (TIGERLAKE)
[18:48:48] [PASSED] 0x9AF8 (TIGERLAKE)
[18:48:48] [PASSED] 0x4C80 (ROCKETLAKE)
[18:48:48] [PASSED] 0x4C8A (ROCKETLAKE)
[18:48:48] [PASSED] 0x4C8B (ROCKETLAKE)
[18:48:48] [PASSED] 0x4C8C (ROCKETLAKE)
[18:48:48] [PASSED] 0x4C90 (ROCKETLAKE)
[18:48:48] [PASSED] 0x4C9A (ROCKETLAKE)
[18:48:48] [PASSED] 0x4680 (ALDERLAKE_S)
[18:48:48] [PASSED] 0x4682 (ALDERLAKE_S)
[18:48:48] [PASSED] 0x4688 (ALDERLAKE_S)
[18:48:48] [PASSED] 0x468A (ALDERLAKE_S)
[18:48:48] [PASSED] 0x468B (ALDERLAKE_S)
[18:48:48] [PASSED] 0x4690 (ALDERLAKE_S)
[18:48:48] [PASSED] 0x4692 (ALDERLAKE_S)
[18:48:48] [PASSED] 0x4693 (ALDERLAKE_S)
[18:48:48] [PASSED] 0x46A0 (ALDERLAKE_P)
[18:48:48] [PASSED] 0x46A1 (ALDERLAKE_P)
[18:48:48] [PASSED] 0x46A2 (ALDERLAKE_P)
[18:48:48] [PASSED] 0x46A3 (ALDERLAKE_P)
[18:48:48] [PASSED] 0x46A6 (ALDERLAKE_P)
[18:48:48] [PASSED] 0x46A8 (ALDERLAKE_P)
[18:48:48] [PASSED] 0x46AA (ALDERLAKE_P)
[18:48:48] [PASSED] 0x462A (ALDERLAKE_P)
[18:48:48] [PASSED] 0x4626 (ALDERLAKE_P)
[18:48:48] [PASSED] 0x4628 (ALDERLAKE_P)
stty: 'standard input': Inappropriate ioctl for device
[18:48:48] [PASSED] 0x46B0 (ALDERLAKE_P)
[18:48:48] [PASSED] 0x46B1 (ALDERLAKE_P)
[18:48:48] [PASSED] 0x46B2 (ALDERLAKE_P)
[18:48:48] [PASSED] 0x46B3 (ALDERLAKE_P)
[18:48:48] [PASSED] 0x46C0 (ALDERLAKE_P)
[18:48:48] [PASSED] 0x46C1 (ALDERLAKE_P)
[18:48:48] [PASSED] 0x46C2 (ALDERLAKE_P)
[18:48:48] [PASSED] 0x46C3 (ALDERLAKE_P)
[18:48:48] [PASSED] 0x46D0 (ALDERLAKE_N)
[18:48:48] [PASSED] 0x46D1 (ALDERLAKE_N)
[18:48:48] [PASSED] 0x46D2 (ALDERLAKE_N)
[18:48:48] [PASSED] 0x46D3 (ALDERLAKE_N)
[18:48:48] [PASSED] 0x46D4 (ALDERLAKE_N)
[18:48:48] [PASSED] 0xA721 (ALDERLAKE_P)
[18:48:48] [PASSED] 0xA7A1 (ALDERLAKE_P)
[18:48:48] [PASSED] 0xA7A9 (ALDERLAKE_P)
[18:48:48] [PASSED] 0xA7AC (ALDERLAKE_P)
[18:48:48] [PASSED] 0xA7AD (ALDERLAKE_P)
[18:48:48] [PASSED] 0xA720 (ALDERLAKE_P)
[18:48:48] [PASSED] 0xA7A0 (ALDERLAKE_P)
[18:48:48] [PASSED] 0xA7A8 (ALDERLAKE_P)
[18:48:48] [PASSED] 0xA7AA (ALDERLAKE_P)
[18:48:48] [PASSED] 0xA7AB (ALDERLAKE_P)
[18:48:48] [PASSED] 0xA780 (ALDERLAKE_S)
[18:48:48] [PASSED] 0xA781 (ALDERLAKE_S)
[18:48:48] [PASSED] 0xA782 (ALDERLAKE_S)
[18:48:48] [PASSED] 0xA783 (ALDERLAKE_S)
[18:48:48] [PASSED] 0xA788 (ALDERLAKE_S)
[18:48:48] [PASSED] 0xA789 (ALDERLAKE_S)
[18:48:48] [PASSED] 0xA78A (ALDERLAKE_S)
[18:48:48] [PASSED] 0xA78B (ALDERLAKE_S)
[18:48:48] [PASSED] 0x4905 (DG1)
[18:48:48] [PASSED] 0x4906 (DG1)
[18:48:48] [PASSED] 0x4907 (DG1)
[18:48:48] [PASSED] 0x4908 (DG1)
[18:48:48] [PASSED] 0x4909 (DG1)
[18:48:48] [PASSED] 0x56C0 (DG2)
[18:48:48] [PASSED] 0x56C2 (DG2)
[18:48:48] [PASSED] 0x56C1 (DG2)
[18:48:48] [PASSED] 0x7D51 (METEORLAKE)
[18:48:48] [PASSED] 0x7DD1 (METEORLAKE)
[18:48:48] [PASSED] 0x7D41 (METEORLAKE)
[18:48:48] [PASSED] 0x7D67 (METEORLAKE)
[18:48:48] [PASSED] 0xB640 (METEORLAKE)
[18:48:48] [PASSED] 0x56A0 (DG2)
[18:48:48] [PASSED] 0x56A1 (DG2)
[18:48:48] [PASSED] 0x56A2 (DG2)
[18:48:48] [PASSED] 0x56BE (DG2)
[18:48:48] [PASSED] 0x56BF (DG2)
[18:48:48] [PASSED] 0x5690 (DG2)
[18:48:48] [PASSED] 0x5691 (DG2)
[18:48:48] [PASSED] 0x5692 (DG2)
[18:48:48] [PASSED] 0x56A5 (DG2)
[18:48:48] [PASSED] 0x56A6 (DG2)
[18:48:48] [PASSED] 0x56B0 (DG2)
[18:48:48] [PASSED] 0x56B1 (DG2)
[18:48:48] [PASSED] 0x56BA (DG2)
[18:48:48] [PASSED] 0x56BB (DG2)
[18:48:48] [PASSED] 0x56BC (DG2)
[18:48:48] [PASSED] 0x56BD (DG2)
[18:48:48] [PASSED] 0x5693 (DG2)
[18:48:48] [PASSED] 0x5694 (DG2)
[18:48:48] [PASSED] 0x5695 (DG2)
[18:48:48] [PASSED] 0x56A3 (DG2)
[18:48:48] [PASSED] 0x56A4 (DG2)
[18:48:48] [PASSED] 0x56B2 (DG2)
[18:48:48] [PASSED] 0x56B3 (DG2)
[18:48:48] [PASSED] 0x5696 (DG2)
[18:48:48] [PASSED] 0x5697 (DG2)
[18:48:48] [PASSED] 0xB69 (PVC)
[18:48:48] [PASSED] 0xB6E (PVC)
[18:48:48] [PASSED] 0xBD4 (PVC)
[18:48:48] [PASSED] 0xBD5 (PVC)
[18:48:48] [PASSED] 0xBD6 (PVC)
[18:48:48] [PASSED] 0xBD7 (PVC)
[18:48:48] [PASSED] 0xBD8 (PVC)
[18:48:48] [PASSED] 0xBD9 (PVC)
[18:48:48] [PASSED] 0xBDA (PVC)
[18:48:48] [PASSED] 0xBDB (PVC)
[18:48:48] [PASSED] 0xBE0 (PVC)
[18:48:48] [PASSED] 0xBE1 (PVC)
[18:48:48] [PASSED] 0xBE5 (PVC)
[18:48:48] [PASSED] 0x7D40 (METEORLAKE)
[18:48:48] [PASSED] 0x7D45 (METEORLAKE)
[18:48:48] [PASSED] 0x7D55 (METEORLAKE)
[18:48:48] [PASSED] 0x7D60 (METEORLAKE)
[18:48:48] [PASSED] 0x7DD5 (METEORLAKE)
[18:48:48] [PASSED] 0x6420 (LUNARLAKE)
[18:48:48] [PASSED] 0x64A0 (LUNARLAKE)
[18:48:48] [PASSED] 0x64B0 (LUNARLAKE)
[18:48:48] [PASSED] 0xE202 (BATTLEMAGE)
[18:48:48] [PASSED] 0xE209 (BATTLEMAGE)
[18:48:48] [PASSED] 0xE20B (BATTLEMAGE)
[18:48:48] [PASSED] 0xE20C (BATTLEMAGE)
[18:48:48] [PASSED] 0xE20D (BATTLEMAGE)
[18:48:48] [PASSED] 0xE210 (BATTLEMAGE)
[18:48:48] [PASSED] 0xE211 (BATTLEMAGE)
[18:48:48] [PASSED] 0xE212 (BATTLEMAGE)
[18:48:48] [PASSED] 0xE216 (BATTLEMAGE)
[18:48:48] [PASSED] 0xE220 (BATTLEMAGE)
[18:48:48] [PASSED] 0xE221 (BATTLEMAGE)
[18:48:48] [PASSED] 0xE222 (BATTLEMAGE)
[18:48:48] [PASSED] 0xE223 (BATTLEMAGE)
[18:48:48] [PASSED] 0xB080 (PANTHERLAKE)
[18:48:48] [PASSED] 0xB081 (PANTHERLAKE)
[18:48:48] [PASSED] 0xB082 (PANTHERLAKE)
[18:48:48] [PASSED] 0xB083 (PANTHERLAKE)
[18:48:48] [PASSED] 0xB084 (PANTHERLAKE)
[18:48:48] [PASSED] 0xB085 (PANTHERLAKE)
[18:48:48] [PASSED] 0xB086 (PANTHERLAKE)
[18:48:48] [PASSED] 0xB087 (PANTHERLAKE)
[18:48:48] [PASSED] 0xB08F (PANTHERLAKE)
[18:48:48] [PASSED] 0xB090 (PANTHERLAKE)
[18:48:48] [PASSED] 0xB0A0 (PANTHERLAKE)
[18:48:48] [PASSED] 0xB0B0 (PANTHERLAKE)
[18:48:48] [PASSED] 0xFD80 (PANTHERLAKE)
[18:48:48] [PASSED] 0xFD81 (PANTHERLAKE)
[18:48:48] [PASSED] 0xD740 (NOVALAKE_S)
[18:48:48] [PASSED] 0xD741 (NOVALAKE_S)
[18:48:48] [PASSED] 0xD742 (NOVALAKE_S)
[18:48:48] [PASSED] 0xD743 (NOVALAKE_S)
[18:48:48] [PASSED] 0xD744 (NOVALAKE_S)
[18:48:48] [PASSED] 0xD745 (NOVALAKE_S)
[18:48:48] [PASSED] 0x674C (CRESCENTISLAND)
[18:48:48] =============== [PASSED] check_platform_desc ===============
[18:48:48] ===================== [PASSED] xe_pci ======================
[18:48:48] =================== xe_rtp (2 subtests) ====================
[18:48:48] =============== xe_rtp_process_to_sr_tests  ================
[18:48:48] [PASSED] coalesce-same-reg
[18:48:48] [PASSED] no-match-no-add
[18:48:48] [PASSED] match-or
[18:48:48] [PASSED] match-or-xfail
[18:48:48] [PASSED] no-match-no-add-multiple-rules
[18:48:48] [PASSED] two-regs-two-entries
[18:48:48] [PASSED] clr-one-set-other
[18:48:48] [PASSED] set-field
[18:48:48] [PASSED] conflict-duplicate
[18:48:48] [PASSED] conflict-not-disjoint
[18:48:48] [PASSED] conflict-reg-type
[18:48:48] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[18:48:48] ================== xe_rtp_process_tests  ===================
[18:48:48] [PASSED] active1
[18:48:48] [PASSED] active2
[18:48:48] [PASSED] active-inactive
[18:48:48] [PASSED] inactive-active
[18:48:48] [PASSED] inactive-1st_or_active-inactive
[18:48:48] [PASSED] inactive-2nd_or_active-inactive
[18:48:48] [PASSED] inactive-last_or_active-inactive
[18:48:48] [PASSED] inactive-no_or_active-inactive
[18:48:48] ============== [PASSED] xe_rtp_process_tests ===============
[18:48:48] ===================== [PASSED] xe_rtp ======================
[18:48:48] ==================== xe_wa (1 subtest) =====================
[18:48:48] ======================== xe_wa_gt  =========================
[18:48:48] [PASSED] TIGERLAKE B0
[18:48:48] [PASSED] DG1 A0
[18:48:48] [PASSED] DG1 B0
[18:48:48] [PASSED] ALDERLAKE_S A0
[18:48:48] [PASSED] ALDERLAKE_S B0
[18:48:48] [PASSED] ALDERLAKE_S C0
[18:48:48] [PASSED] ALDERLAKE_S D0
[18:48:48] [PASSED] ALDERLAKE_P A0
[18:48:48] [PASSED] ALDERLAKE_P B0
[18:48:48] [PASSED] ALDERLAKE_P C0
[18:48:48] [PASSED] ALDERLAKE_S RPLS D0
[18:48:48] [PASSED] ALDERLAKE_P RPLU E0
[18:48:48] [PASSED] DG2 G10 C0
[18:48:48] [PASSED] DG2 G11 B1
[18:48:48] [PASSED] DG2 G12 A1
[18:48:48] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[18:48:48] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[18:48:48] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[18:48:48] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[18:48:48] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[18:48:48] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[18:48:48] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[18:48:48] ==================== [PASSED] xe_wa_gt =====================
[18:48:48] ====================== [PASSED] xe_wa ======================
[18:48:48] ============================================================
[18:48:48] Testing complete. Ran 512 tests: passed: 494, skipped: 18
[18:48:48] Elapsed time: 36.194s total, 4.197s configuring, 31.480s building, 0.463s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[18:48:48] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:48:50] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[18:49:16] Starting KUnit Kernel (1/1)...
[18:49:16] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[18:49:16] ============ drm_test_pick_cmdline (2 subtests) ============
[18:49:16] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[18:49:16] =============== drm_test_pick_cmdline_named  ===============
[18:49:16] [PASSED] NTSC
[18:49:16] [PASSED] NTSC-J
[18:49:16] [PASSED] PAL
[18:49:16] [PASSED] PAL-M
[18:49:16] =========== [PASSED] drm_test_pick_cmdline_named ===========
[18:49:16] ============== [PASSED] drm_test_pick_cmdline ==============
[18:49:16] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[18:49:16] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[18:49:16] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[18:49:16] =========== drm_validate_clone_mode (2 subtests) ===========
[18:49:16] ============== drm_test_check_in_clone_mode  ===============
[18:49:16] [PASSED] in_clone_mode
[18:49:16] [PASSED] not_in_clone_mode
[18:49:16] ========== [PASSED] drm_test_check_in_clone_mode ===========
[18:49:16] =============== drm_test_check_valid_clones  ===============
[18:49:16] [PASSED] not_in_clone_mode
[18:49:16] [PASSED] valid_clone
[18:49:16] [PASSED] invalid_clone
[18:49:16] =========== [PASSED] drm_test_check_valid_clones ===========
[18:49:16] ============= [PASSED] drm_validate_clone_mode =============
[18:49:16] ============= drm_validate_modeset (1 subtest) =============
[18:49:16] [PASSED] drm_test_check_connector_changed_modeset
[18:49:16] ============== [PASSED] drm_validate_modeset ===============
[18:49:16] ====== drm_test_bridge_get_current_state (2 subtests) ======
[18:49:16] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[18:49:16] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[18:49:16] ======== [PASSED] drm_test_bridge_get_current_state ========
[18:49:16] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[18:49:16] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[18:49:16] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[18:49:16] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[18:49:16] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[18:49:16] ============== drm_bridge_alloc (2 subtests) ===============
[18:49:16] [PASSED] drm_test_drm_bridge_alloc_basic
[18:49:16] [PASSED] drm_test_drm_bridge_alloc_get_put
[18:49:16] ================ [PASSED] drm_bridge_alloc =================
[18:49:16] ================== drm_buddy (8 subtests) ==================
[18:49:16] [PASSED] drm_test_buddy_alloc_limit
[18:49:16] [PASSED] drm_test_buddy_alloc_optimistic
[18:49:16] [PASSED] drm_test_buddy_alloc_pessimistic
[18:49:16] [PASSED] drm_test_buddy_alloc_pathological
[18:49:16] [PASSED] drm_test_buddy_alloc_contiguous
[18:49:16] [PASSED] drm_test_buddy_alloc_clear
[18:49:16] [PASSED] drm_test_buddy_alloc_range_bias
[18:49:16] [PASSED] drm_test_buddy_fragmentation_performance
[18:49:16] ==================== [PASSED] drm_buddy ====================
[18:49:16] ============= drm_cmdline_parser (40 subtests) =============
[18:49:16] [PASSED] drm_test_cmdline_force_d_only
[18:49:16] [PASSED] drm_test_cmdline_force_D_only_dvi
[18:49:16] [PASSED] drm_test_cmdline_force_D_only_hdmi
[18:49:16] [PASSED] drm_test_cmdline_force_D_only_not_digital
[18:49:16] [PASSED] drm_test_cmdline_force_e_only
[18:49:16] [PASSED] drm_test_cmdline_res
[18:49:16] [PASSED] drm_test_cmdline_res_vesa
[18:49:16] [PASSED] drm_test_cmdline_res_vesa_rblank
[18:49:16] [PASSED] drm_test_cmdline_res_rblank
[18:49:16] [PASSED] drm_test_cmdline_res_bpp
[18:49:16] [PASSED] drm_test_cmdline_res_refresh
[18:49:16] [PASSED] drm_test_cmdline_res_bpp_refresh
[18:49:16] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[18:49:16] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[18:49:16] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[18:49:16] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[18:49:16] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[18:49:16] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[18:49:16] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[18:49:16] [PASSED] drm_test_cmdline_res_margins_force_on
[18:49:16] [PASSED] drm_test_cmdline_res_vesa_margins
[18:49:16] [PASSED] drm_test_cmdline_name
[18:49:16] [PASSED] drm_test_cmdline_name_bpp
[18:49:16] [PASSED] drm_test_cmdline_name_option
[18:49:16] [PASSED] drm_test_cmdline_name_bpp_option
[18:49:16] [PASSED] drm_test_cmdline_rotate_0
[18:49:16] [PASSED] drm_test_cmdline_rotate_90
[18:49:16] [PASSED] drm_test_cmdline_rotate_180
[18:49:16] [PASSED] drm_test_cmdline_rotate_270
[18:49:16] [PASSED] drm_test_cmdline_hmirror
[18:49:16] [PASSED] drm_test_cmdline_vmirror
[18:49:16] [PASSED] drm_test_cmdline_margin_options
[18:49:16] [PASSED] drm_test_cmdline_multiple_options
[18:49:16] [PASSED] drm_test_cmdline_bpp_extra_and_option
[18:49:16] [PASSED] drm_test_cmdline_extra_and_option
[18:49:16] [PASSED] drm_test_cmdline_freestanding_options
[18:49:16] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[18:49:16] [PASSED] drm_test_cmdline_panel_orientation
[18:49:16] ================ drm_test_cmdline_invalid  =================
[18:49:16] [PASSED] margin_only
[18:49:16] [PASSED] interlace_only
[18:49:16] [PASSED] res_missing_x
[18:49:16] [PASSED] res_missing_y
[18:49:16] [PASSED] res_bad_y
[18:49:16] [PASSED] res_missing_y_bpp
[18:49:16] [PASSED] res_bad_bpp
[18:49:16] [PASSED] res_bad_refresh
[18:49:16] [PASSED] res_bpp_refresh_force_on_off
[18:49:16] [PASSED] res_invalid_mode
[18:49:16] [PASSED] res_bpp_wrong_place_mode
[18:49:16] [PASSED] name_bpp_refresh
[18:49:16] [PASSED] name_refresh
[18:49:16] [PASSED] name_refresh_wrong_mode
[18:49:16] [PASSED] name_refresh_invalid_mode
[18:49:16] [PASSED] rotate_multiple
[18:49:16] [PASSED] rotate_invalid_val
[18:49:16] [PASSED] rotate_truncated
[18:49:16] [PASSED] invalid_option
[18:49:16] [PASSED] invalid_tv_option
[18:49:16] [PASSED] truncated_tv_option
[18:49:16] ============ [PASSED] drm_test_cmdline_invalid =============
[18:49:16] =============== drm_test_cmdline_tv_options  ===============
[18:49:16] [PASSED] NTSC
[18:49:16] [PASSED] NTSC_443
[18:49:16] [PASSED] NTSC_J
[18:49:16] [PASSED] PAL
[18:49:16] [PASSED] PAL_M
[18:49:16] [PASSED] PAL_N
[18:49:16] [PASSED] SECAM
[18:49:16] [PASSED] MONO_525
[18:49:16] [PASSED] MONO_625
[18:49:16] =========== [PASSED] drm_test_cmdline_tv_options ===========
[18:49:16] =============== [PASSED] drm_cmdline_parser ================
[18:49:16] ========== drmm_connector_hdmi_init (20 subtests) ==========
[18:49:16] [PASSED] drm_test_connector_hdmi_init_valid
[18:49:16] [PASSED] drm_test_connector_hdmi_init_bpc_8
[18:49:16] [PASSED] drm_test_connector_hdmi_init_bpc_10
[18:49:16] [PASSED] drm_test_connector_hdmi_init_bpc_12
[18:49:16] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[18:49:16] [PASSED] drm_test_connector_hdmi_init_bpc_null
[18:49:16] [PASSED] drm_test_connector_hdmi_init_formats_empty
[18:49:16] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[18:49:16] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[18:49:16] [PASSED] supported_formats=0x9 yuv420_allowed=1
[18:49:16] [PASSED] supported_formats=0x9 yuv420_allowed=0
[18:49:16] [PASSED] supported_formats=0x3 yuv420_allowed=1
[18:49:16] [PASSED] supported_formats=0x3 yuv420_allowed=0
[18:49:16] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[18:49:16] [PASSED] drm_test_connector_hdmi_init_null_ddc
[18:49:16] [PASSED] drm_test_connector_hdmi_init_null_product
[18:49:16] [PASSED] drm_test_connector_hdmi_init_null_vendor
[18:49:16] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[18:49:16] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[18:49:16] [PASSED] drm_test_connector_hdmi_init_product_valid
[18:49:16] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[18:49:16] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[18:49:16] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[18:49:16] ========= drm_test_connector_hdmi_init_type_valid  =========
[18:49:16] [PASSED] HDMI-A
[18:49:16] [PASSED] HDMI-B
[18:49:16] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[18:49:16] ======== drm_test_connector_hdmi_init_type_invalid  ========
[18:49:16] [PASSED] Unknown
[18:49:16] [PASSED] VGA
[18:49:16] [PASSED] DVI-I
[18:49:16] [PASSED] DVI-D
[18:49:16] [PASSED] DVI-A
[18:49:16] [PASSED] Composite
[18:49:16] [PASSED] SVIDEO
[18:49:16] [PASSED] LVDS
[18:49:16] [PASSED] Component
[18:49:16] [PASSED] DIN
[18:49:16] [PASSED] DP
[18:49:16] [PASSED] TV
[18:49:16] [PASSED] eDP
[18:49:16] [PASSED] Virtual
[18:49:16] [PASSED] DSI
[18:49:16] [PASSED] DPI
[18:49:16] [PASSED] Writeback
[18:49:16] [PASSED] SPI
[18:49:16] [PASSED] USB
[18:49:16] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[18:49:16] ============ [PASSED] drmm_connector_hdmi_init =============
[18:49:16] ============= drmm_connector_init (3 subtests) =============
[18:49:16] [PASSED] drm_test_drmm_connector_init
[18:49:16] [PASSED] drm_test_drmm_connector_init_null_ddc
[18:49:16] ========= drm_test_drmm_connector_init_type_valid  =========
[18:49:16] [PASSED] Unknown
[18:49:16] [PASSED] VGA
[18:49:16] [PASSED] DVI-I
[18:49:16] [PASSED] DVI-D
[18:49:16] [PASSED] DVI-A
[18:49:16] [PASSED] Composite
[18:49:16] [PASSED] SVIDEO
[18:49:16] [PASSED] LVDS
[18:49:16] [PASSED] Component
[18:49:16] [PASSED] DIN
[18:49:16] [PASSED] DP
[18:49:16] [PASSED] HDMI-A
[18:49:16] [PASSED] HDMI-B
[18:49:16] [PASSED] TV
[18:49:16] [PASSED] eDP
[18:49:16] [PASSED] Virtual
[18:49:16] [PASSED] DSI
[18:49:16] [PASSED] DPI
[18:49:16] [PASSED] Writeback
[18:49:16] [PASSED] SPI
[18:49:16] [PASSED] USB
[18:49:16] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[18:49:16] =============== [PASSED] drmm_connector_init ===============
[18:49:16] ========= drm_connector_dynamic_init (6 subtests) ==========
[18:49:16] [PASSED] drm_test_drm_connector_dynamic_init
[18:49:16] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[18:49:16] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[18:49:16] [PASSED] drm_test_drm_connector_dynamic_init_properties
[18:49:16] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[18:49:16] [PASSED] Unknown
[18:49:16] [PASSED] VGA
[18:49:16] [PASSED] DVI-I
[18:49:16] [PASSED] DVI-D
[18:49:16] [PASSED] DVI-A
[18:49:16] [PASSED] Composite
[18:49:16] [PASSED] SVIDEO
[18:49:16] [PASSED] LVDS
[18:49:16] [PASSED] Component
[18:49:16] [PASSED] DIN
[18:49:16] [PASSED] DP
[18:49:16] [PASSED] HDMI-A
[18:49:16] [PASSED] HDMI-B
[18:49:16] [PASSED] TV
[18:49:16] [PASSED] eDP
[18:49:16] [PASSED] Virtual
[18:49:16] [PASSED] DSI
[18:49:16] [PASSED] DPI
[18:49:16] [PASSED] Writeback
[18:49:16] [PASSED] SPI
[18:49:16] [PASSED] USB
[18:49:16] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[18:49:16] ======== drm_test_drm_connector_dynamic_init_name  =========
[18:49:16] [PASSED] Unknown
[18:49:16] [PASSED] VGA
[18:49:16] [PASSED] DVI-I
[18:49:16] [PASSED] DVI-D
[18:49:16] [PASSED] DVI-A
[18:49:16] [PASSED] Composite
[18:49:16] [PASSED] SVIDEO
[18:49:16] [PASSED] LVDS
[18:49:16] [PASSED] Component
[18:49:16] [PASSED] DIN
[18:49:16] [PASSED] DP
[18:49:16] [PASSED] HDMI-A
[18:49:16] [PASSED] HDMI-B
[18:49:16] [PASSED] TV
[18:49:16] [PASSED] eDP
[18:49:16] [PASSED] Virtual
[18:49:16] [PASSED] DSI
[18:49:16] [PASSED] DPI
[18:49:16] [PASSED] Writeback
[18:49:16] [PASSED] SPI
[18:49:16] [PASSED] USB
[18:49:16] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[18:49:16] =========== [PASSED] drm_connector_dynamic_init ============
[18:49:16] ==== drm_connector_dynamic_register_early (4 subtests) =====
[18:49:16] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[18:49:16] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[18:49:16] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[18:49:16] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[18:49:16] ====== [PASSED] drm_connector_dynamic_register_early =======
[18:49:16] ======= drm_connector_dynamic_register (7 subtests) ========
[18:49:16] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[18:49:16] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[18:49:16] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[18:49:16] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[18:49:16] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[18:49:16] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[18:49:16] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[18:49:16] ========= [PASSED] drm_connector_dynamic_register ==========
[18:49:16] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[18:49:16] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[18:49:16] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[18:49:16] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[18:49:16] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[18:49:16] ========== drm_test_get_tv_mode_from_name_valid  ===========
[18:49:16] [PASSED] NTSC
[18:49:16] [PASSED] NTSC-443
[18:49:16] [PASSED] NTSC-J
[18:49:16] [PASSED] PAL
[18:49:16] [PASSED] PAL-M
[18:49:16] [PASSED] PAL-N
[18:49:16] [PASSED] SECAM
[18:49:16] [PASSED] Mono
[18:49:16] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[18:49:16] [PASSED] drm_test_get_tv_mode_from_name_truncated
[18:49:16] ============ [PASSED] drm_get_tv_mode_from_name ============
[18:49:16] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[18:49:16] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[18:49:16] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[18:49:16] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[18:49:16] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[18:49:16] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[18:49:16] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[18:49:16] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[18:49:16] [PASSED] VIC 96
[18:49:16] [PASSED] VIC 97
[18:49:16] [PASSED] VIC 101
[18:49:16] [PASSED] VIC 102
[18:49:16] [PASSED] VIC 106
[18:49:16] [PASSED] VIC 107
[18:49:16] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[18:49:16] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[18:49:16] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[18:49:16] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[18:49:16] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[18:49:16] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[18:49:16] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[18:49:16] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[18:49:16] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[18:49:16] [PASSED] Automatic
[18:49:16] [PASSED] Full
[18:49:16] [PASSED] Limited 16:235
[18:49:16] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[18:49:16] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[18:49:16] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[18:49:16] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[18:49:16] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[18:49:16] [PASSED] RGB
[18:49:16] [PASSED] YUV 4:2:0
[18:49:16] [PASSED] YUV 4:2:2
[18:49:16] [PASSED] YUV 4:4:4
[18:49:16] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[18:49:16] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[18:49:16] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[18:49:16] ============= drm_damage_helper (21 subtests) ==============
[18:49:16] [PASSED] drm_test_damage_iter_no_damage
[18:49:16] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[18:49:16] [PASSED] drm_test_damage_iter_no_damage_src_moved
[18:49:16] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[18:49:16] [PASSED] drm_test_damage_iter_no_damage_not_visible
[18:49:16] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[18:49:16] [PASSED] drm_test_damage_iter_no_damage_no_fb
[18:49:16] [PASSED] drm_test_damage_iter_simple_damage
[18:49:16] [PASSED] drm_test_damage_iter_single_damage
[18:49:16] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[18:49:16] [PASSED] drm_test_damage_iter_single_damage_outside_src
[18:49:16] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[18:49:16] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[18:49:16] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[18:49:16] [PASSED] drm_test_damage_iter_single_damage_src_moved
[18:49:16] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[18:49:16] [PASSED] drm_test_damage_iter_damage
[18:49:16] [PASSED] drm_test_damage_iter_damage_one_intersect
[18:49:16] [PASSED] drm_test_damage_iter_damage_one_outside
[18:49:16] [PASSED] drm_test_damage_iter_damage_src_moved
[18:49:16] [PASSED] drm_test_damage_iter_damage_not_visible
[18:49:16] ================ [PASSED] drm_damage_helper ================
[18:49:16] ============== drm_dp_mst_helper (3 subtests) ==============
[18:49:16] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[18:49:16] [PASSED] Clock 154000 BPP 30 DSC disabled
[18:49:16] [PASSED] Clock 234000 BPP 30 DSC disabled
[18:49:16] [PASSED] Clock 297000 BPP 24 DSC disabled
[18:49:16] [PASSED] Clock 332880 BPP 24 DSC enabled
[18:49:16] [PASSED] Clock 324540 BPP 24 DSC enabled
[18:49:16] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[18:49:16] ============== drm_test_dp_mst_calc_pbn_div  ===============
[18:49:16] [PASSED] Link rate 2000000 lane count 4
[18:49:16] [PASSED] Link rate 2000000 lane count 2
[18:49:16] [PASSED] Link rate 2000000 lane count 1
[18:49:16] [PASSED] Link rate 1350000 lane count 4
[18:49:16] [PASSED] Link rate 1350000 lane count 2
[18:49:16] [PASSED] Link rate 1350000 lane count 1
[18:49:16] [PASSED] Link rate 1000000 lane count 4
[18:49:16] [PASSED] Link rate 1000000 lane count 2
[18:49:16] [PASSED] Link rate 1000000 lane count 1
[18:49:16] [PASSED] Link rate 810000 lane count 4
[18:49:16] [PASSED] Link rate 810000 lane count 2
[18:49:16] [PASSED] Link rate 810000 lane count 1
[18:49:16] [PASSED] Link rate 540000 lane count 4
[18:49:16] [PASSED] Link rate 540000 lane count 2
[18:49:16] [PASSED] Link rate 540000 lane count 1
[18:49:16] [PASSED] Link rate 270000 lane count 4
[18:49:16] [PASSED] Link rate 270000 lane count 2
[18:49:16] [PASSED] Link rate 270000 lane count 1
[18:49:16] [PASSED] Link rate 162000 lane count 4
[18:49:16] [PASSED] Link rate 162000 lane count 2
[18:49:16] [PASSED] Link rate 162000 lane count 1
[18:49:16] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[18:49:16] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[18:49:16] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[18:49:16] [PASSED] DP_POWER_UP_PHY with port number
[18:49:16] [PASSED] DP_POWER_DOWN_PHY with port number
[18:49:16] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[18:49:16] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[18:49:16] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[18:49:16] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[18:49:16] [PASSED] DP_QUERY_PAYLOAD with port number
[18:49:16] [PASSED] DP_QUERY_PAYLOAD with VCPI
[18:49:16] [PASSED] DP_REMOTE_DPCD_READ with port number
[18:49:16] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[18:49:16] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[18:49:16] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[18:49:16] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[18:49:16] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[18:49:16] [PASSED] DP_REMOTE_I2C_READ with port number
[18:49:16] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[18:49:16] [PASSED] DP_REMOTE_I2C_READ with transactions array
[18:49:16] [PASSED] DP_REMOTE_I2C_WRITE with port number
[18:49:16] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[18:49:16] [PASSED] DP_REMOTE_I2C_WRITE with data array
[18:49:16] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[18:49:16] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[18:49:16] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[18:49:16] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[18:49:16] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[18:49:16] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[18:49:16] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[18:49:16] ================ [PASSED] drm_dp_mst_helper ================
[18:49:16] ================== drm_exec (7 subtests) ===================
[18:49:16] [PASSED] sanitycheck
[18:49:16] [PASSED] test_lock
[18:49:16] [PASSED] test_lock_unlock
[18:49:16] [PASSED] test_duplicates
[18:49:16] [PASSED] test_prepare
[18:49:16] [PASSED] test_prepare_array
[18:49:16] [PASSED] test_multiple_loops
[18:49:16] ==================== [PASSED] drm_exec =====================
[18:49:16] =========== drm_format_helper_test (17 subtests) ===========
[18:49:16] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[18:49:16] [PASSED] single_pixel_source_buffer
[18:49:16] [PASSED] single_pixel_clip_rectangle
[18:49:16] [PASSED] well_known_colors
[18:49:16] [PASSED] destination_pitch
[18:49:16] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[18:49:16] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[18:49:16] [PASSED] single_pixel_source_buffer
[18:49:16] [PASSED] single_pixel_clip_rectangle
[18:49:16] [PASSED] well_known_colors
[18:49:16] [PASSED] destination_pitch
[18:49:16] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[18:49:16] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[18:49:16] [PASSED] single_pixel_source_buffer
[18:49:16] [PASSED] single_pixel_clip_rectangle
[18:49:16] [PASSED] well_known_colors
[18:49:16] [PASSED] destination_pitch
[18:49:16] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[18:49:16] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[18:49:16] [PASSED] single_pixel_source_buffer
[18:49:16] [PASSED] single_pixel_clip_rectangle
[18:49:16] [PASSED] well_known_colors
[18:49:16] [PASSED] destination_pitch
[18:49:16] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[18:49:16] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[18:49:16] [PASSED] single_pixel_source_buffer
[18:49:16] [PASSED] single_pixel_clip_rectangle
[18:49:16] [PASSED] well_known_colors
[18:49:16] [PASSED] destination_pitch
[18:49:16] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[18:49:16] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[18:49:16] [PASSED] single_pixel_source_buffer
[18:49:16] [PASSED] single_pixel_clip_rectangle
[18:49:16] [PASSED] well_known_colors
[18:49:16] [PASSED] destination_pitch
[18:49:16] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[18:49:16] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[18:49:16] [PASSED] single_pixel_source_buffer
[18:49:16] [PASSED] single_pixel_clip_rectangle
[18:49:16] [PASSED] well_known_colors
[18:49:16] [PASSED] destination_pitch
[18:49:16] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[18:49:16] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[18:49:16] [PASSED] single_pixel_source_buffer
[18:49:16] [PASSED] single_pixel_clip_rectangle
[18:49:16] [PASSED] well_known_colors
[18:49:16] [PASSED] destination_pitch
[18:49:16] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[18:49:16] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[18:49:16] [PASSED] single_pixel_source_buffer
[18:49:16] [PASSED] single_pixel_clip_rectangle
[18:49:16] [PASSED] well_known_colors
[18:49:16] [PASSED] destination_pitch
[18:49:16] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[18:49:16] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[18:49:16] [PASSED] single_pixel_source_buffer
[18:49:16] [PASSED] single_pixel_clip_rectangle
[18:49:16] [PASSED] well_known_colors
[18:49:16] [PASSED] destination_pitch
[18:49:16] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[18:49:16] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[18:49:16] [PASSED] single_pixel_source_buffer
[18:49:16] [PASSED] single_pixel_clip_rectangle
[18:49:16] [PASSED] well_known_colors
[18:49:16] [PASSED] destination_pitch
[18:49:16] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[18:49:16] ============== drm_test_fb_xrgb8888_to_mono  ===============
[18:49:16] [PASSED] single_pixel_source_buffer
[18:49:16] [PASSED] single_pixel_clip_rectangle
[18:49:16] [PASSED] well_known_colors
[18:49:16] [PASSED] destination_pitch
[18:49:16] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[18:49:16] ==================== drm_test_fb_swab  =====================
[18:49:16] [PASSED] single_pixel_source_buffer
[18:49:16] [PASSED] single_pixel_clip_rectangle
[18:49:16] [PASSED] well_known_colors
[18:49:16] [PASSED] destination_pitch
[18:49:16] ================ [PASSED] drm_test_fb_swab =================
[18:49:16] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[18:49:16] [PASSED] single_pixel_source_buffer
[18:49:16] [PASSED] single_pixel_clip_rectangle
[18:49:16] [PASSED] well_known_colors
[18:49:16] [PASSED] destination_pitch
[18:49:16] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[18:49:16] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[18:49:16] [PASSED] single_pixel_source_buffer
[18:49:16] [PASSED] single_pixel_clip_rectangle
[18:49:16] [PASSED] well_known_colors
[18:49:16] [PASSED] destination_pitch
[18:49:16] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[18:49:16] ================= drm_test_fb_clip_offset  =================
[18:49:16] [PASSED] pass through
[18:49:16] [PASSED] horizontal offset
[18:49:16] [PASSED] vertical offset
[18:49:16] [PASSED] horizontal and vertical offset
[18:49:16] [PASSED] horizontal offset (custom pitch)
[18:49:16] [PASSED] vertical offset (custom pitch)
[18:49:16] [PASSED] horizontal and vertical offset (custom pitch)
[18:49:16] ============= [PASSED] drm_test_fb_clip_offset =============
[18:49:16] =================== drm_test_fb_memcpy  ====================
[18:49:16] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[18:49:16] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[18:49:16] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[18:49:16] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[18:49:16] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[18:49:16] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[18:49:16] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[18:49:16] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[18:49:16] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[18:49:16] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[18:49:16] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[18:49:16] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[18:49:16] =============== [PASSED] drm_test_fb_memcpy ================
[18:49:16] ============= [PASSED] drm_format_helper_test ==============
[18:49:16] ================= drm_format (18 subtests) =================
[18:49:16] [PASSED] drm_test_format_block_width_invalid
[18:49:16] [PASSED] drm_test_format_block_width_one_plane
[18:49:16] [PASSED] drm_test_format_block_width_two_plane
[18:49:16] [PASSED] drm_test_format_block_width_three_plane
[18:49:16] [PASSED] drm_test_format_block_width_tiled
[18:49:16] [PASSED] drm_test_format_block_height_invalid
[18:49:16] [PASSED] drm_test_format_block_height_one_plane
[18:49:16] [PASSED] drm_test_format_block_height_two_plane
[18:49:16] [PASSED] drm_test_format_block_height_three_plane
[18:49:16] [PASSED] drm_test_format_block_height_tiled
[18:49:16] [PASSED] drm_test_format_min_pitch_invalid
[18:49:16] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[18:49:16] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[18:49:16] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[18:49:16] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[18:49:16] [PASSED] drm_test_format_min_pitch_two_plane
[18:49:16] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[18:49:16] [PASSED] drm_test_format_min_pitch_tiled
[18:49:16] =================== [PASSED] drm_format ====================
[18:49:16] ============== drm_framebuffer (10 subtests) ===============
[18:49:16] ========== drm_test_framebuffer_check_src_coords  ==========
[18:49:16] [PASSED] Success: source fits into fb
[18:49:16] [PASSED] Fail: overflowing fb with x-axis coordinate
[18:49:16] [PASSED] Fail: overflowing fb with y-axis coordinate
[18:49:16] [PASSED] Fail: overflowing fb with source width
[18:49:16] [PASSED] Fail: overflowing fb with source height
[18:49:16] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[18:49:16] [PASSED] drm_test_framebuffer_cleanup
[18:49:16] =============== drm_test_framebuffer_create  ===============
[18:49:16] [PASSED] ABGR8888 normal sizes
[18:49:16] [PASSED] ABGR8888 max sizes
[18:49:16] [PASSED] ABGR8888 pitch greater than min required
[18:49:16] [PASSED] ABGR8888 pitch less than min required
[18:49:16] [PASSED] ABGR8888 Invalid width
[18:49:16] [PASSED] ABGR8888 Invalid buffer handle
[18:49:16] [PASSED] No pixel format
[18:49:16] [PASSED] ABGR8888 Width 0
[18:49:16] [PASSED] ABGR8888 Height 0
[18:49:16] [PASSED] ABGR8888 Out of bound height * pitch combination
[18:49:16] [PASSED] ABGR8888 Large buffer offset
[18:49:16] [PASSED] ABGR8888 Buffer offset for inexistent plane
[18:49:16] [PASSED] ABGR8888 Invalid flag
[18:49:16] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[18:49:16] [PASSED] ABGR8888 Valid buffer modifier
[18:49:16] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[18:49:16] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[18:49:16] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[18:49:16] [PASSED] NV12 Normal sizes
[18:49:16] [PASSED] NV12 Max sizes
[18:49:16] [PASSED] NV12 Invalid pitch
[18:49:16] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[18:49:16] [PASSED] NV12 different  modifier per-plane
[18:49:16] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[18:49:16] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[18:49:16] [PASSED] NV12 Modifier for inexistent plane
[18:49:16] [PASSED] NV12 Handle for inexistent plane
[18:49:16] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[18:49:16] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[18:49:16] [PASSED] YVU420 Normal sizes
[18:49:16] [PASSED] YVU420 Max sizes
[18:49:16] [PASSED] YVU420 Invalid pitch
[18:49:16] [PASSED] YVU420 Different pitches
[18:49:16] [PASSED] YVU420 Different buffer offsets/pitches
[18:49:16] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[18:49:16] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[18:49:16] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[18:49:16] [PASSED] YVU420 Valid modifier
[18:49:16] [PASSED] YVU420 Different modifiers per plane
[18:49:16] [PASSED] YVU420 Modifier for inexistent plane
[18:49:16] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[18:49:16] [PASSED] X0L2 Normal sizes
[18:49:16] [PASSED] X0L2 Max sizes
[18:49:16] [PASSED] X0L2 Invalid pitch
[18:49:16] [PASSED] X0L2 Pitch greater than minimum required
[18:49:16] [PASSED] X0L2 Handle for inexistent plane
[18:49:16] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[18:49:16] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[18:49:16] [PASSED] X0L2 Valid modifier
[18:49:16] [PASSED] X0L2 Modifier for inexistent plane
[18:49:16] =========== [PASSED] drm_test_framebuffer_create ===========
[18:49:16] [PASSED] drm_test_framebuffer_free
[18:49:16] [PASSED] drm_test_framebuffer_init
[18:49:16] [PASSED] drm_test_framebuffer_init_bad_format
[18:49:16] [PASSED] drm_test_framebuffer_init_dev_mismatch
[18:49:16] [PASSED] drm_test_framebuffer_lookup
[18:49:16] [PASSED] drm_test_framebuffer_lookup_inexistent
[18:49:16] [PASSED] drm_test_framebuffer_modifiers_not_supported
[18:49:16] ================= [PASSED] drm_framebuffer =================
[18:49:16] ================ drm_gem_shmem (8 subtests) ================
[18:49:16] [PASSED] drm_gem_shmem_test_obj_create
[18:49:16] [PASSED] drm_gem_shmem_test_obj_create_private
[18:49:16] [PASSED] drm_gem_shmem_test_pin_pages
[18:49:16] [PASSED] drm_gem_shmem_test_vmap
[18:49:16] [PASSED] drm_gem_shmem_test_get_sg_table
[18:49:16] [PASSED] drm_gem_shmem_test_get_pages_sgt
[18:49:16] [PASSED] drm_gem_shmem_test_madvise
[18:49:16] [PASSED] drm_gem_shmem_test_purge
[18:49:16] ================== [PASSED] drm_gem_shmem ==================
[18:49:16] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[18:49:16] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[18:49:16] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[18:49:16] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[18:49:16] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[18:49:16] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[18:49:16] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[18:49:16] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[18:49:16] [PASSED] Automatic
[18:49:16] [PASSED] Full
[18:49:16] [PASSED] Limited 16:235
[18:49:16] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[18:49:16] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[18:49:16] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[18:49:16] [PASSED] drm_test_check_disable_connector
[18:49:16] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[18:49:16] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[18:49:16] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[18:49:16] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[18:49:16] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[18:49:16] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[18:49:16] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[18:49:16] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[18:49:16] [PASSED] drm_test_check_output_bpc_dvi
[18:49:16] [PASSED] drm_test_check_output_bpc_format_vic_1
[18:49:16] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[18:49:16] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[18:49:16] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[18:49:16] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[18:49:16] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[18:49:16] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[18:49:16] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[18:49:16] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[18:49:16] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[18:49:16] [PASSED] drm_test_check_broadcast_rgb_value
[18:49:16] [PASSED] drm_test_check_bpc_8_value
[18:49:16] [PASSED] drm_test_check_bpc_10_value
[18:49:16] [PASSED] drm_test_check_bpc_12_value
[18:49:16] [PASSED] drm_test_check_format_value
[18:49:16] [PASSED] drm_test_check_tmds_char_value
[18:49:16] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[18:49:16] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[18:49:16] [PASSED] drm_test_check_mode_valid
[18:49:16] [PASSED] drm_test_check_mode_valid_reject
[18:49:16] [PASSED] drm_test_check_mode_valid_reject_rate
[18:49:16] [PASSED] drm_test_check_mode_valid_reject_max_clock
[18:49:16] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[18:49:16] ================= drm_managed (2 subtests) =================
[18:49:16] [PASSED] drm_test_managed_release_action
[18:49:16] [PASSED] drm_test_managed_run_action
[18:49:16] =================== [PASSED] drm_managed ===================
[18:49:16] =================== drm_mm (6 subtests) ====================
[18:49:16] [PASSED] drm_test_mm_init
[18:49:16] [PASSED] drm_test_mm_debug
[18:49:16] [PASSED] drm_test_mm_align32
[18:49:16] [PASSED] drm_test_mm_align64
[18:49:16] [PASSED] drm_test_mm_lowest
[18:49:16] [PASSED] drm_test_mm_highest
[18:49:16] ===================== [PASSED] drm_mm ======================
[18:49:16] ============= drm_modes_analog_tv (5 subtests) =============
[18:49:16] [PASSED] drm_test_modes_analog_tv_mono_576i
[18:49:16] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[18:49:16] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[18:49:16] [PASSED] drm_test_modes_analog_tv_pal_576i
[18:49:16] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[18:49:16] =============== [PASSED] drm_modes_analog_tv ===============
[18:49:16] ============== drm_plane_helper (2 subtests) ===============
[18:49:16] =============== drm_test_check_plane_state  ================
[18:49:16] [PASSED] clipping_simple
[18:49:16] [PASSED] clipping_rotate_reflect
[18:49:16] [PASSED] positioning_simple
[18:49:16] [PASSED] upscaling
[18:49:16] [PASSED] downscaling
[18:49:16] [PASSED] rounding1
[18:49:16] [PASSED] rounding2
[18:49:16] [PASSED] rounding3
[18:49:16] [PASSED] rounding4
[18:49:16] =========== [PASSED] drm_test_check_plane_state ============
[18:49:16] =========== drm_test_check_invalid_plane_state  ============
[18:49:16] [PASSED] positioning_invalid
[18:49:16] [PASSED] upscaling_invalid
[18:49:16] [PASSED] downscaling_invalid
[18:49:16] ======= [PASSED] drm_test_check_invalid_plane_state ========
[18:49:16] ================ [PASSED] drm_plane_helper =================
[18:49:16] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[18:49:16] ====== drm_test_connector_helper_tv_get_modes_check  =======
[18:49:16] [PASSED] None
[18:49:16] [PASSED] PAL
[18:49:16] [PASSED] NTSC
[18:49:16] [PASSED] Both, NTSC Default
[18:49:16] [PASSED] Both, PAL Default
[18:49:16] [PASSED] Both, NTSC Default, with PAL on command-line
[18:49:16] [PASSED] Both, PAL Default, with NTSC on command-line
[18:49:16] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[18:49:16] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[18:49:16] ================== drm_rect (9 subtests) ===================
[18:49:16] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[18:49:16] [PASSED] drm_test_rect_clip_scaled_not_clipped
[18:49:16] [PASSED] drm_test_rect_clip_scaled_clipped
[18:49:16] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[18:49:16] ================= drm_test_rect_intersect  =================
[18:49:16] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[18:49:16] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[18:49:16] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[18:49:16] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[18:49:16] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[18:49:16] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[18:49:16] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[18:49:16] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[18:49:16] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[18:49:16] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[18:49:16] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[18:49:16] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[18:49:16] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[18:49:16] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[18:49:16] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[18:49:16] ============= [PASSED] drm_test_rect_intersect =============
[18:49:16] ================ drm_test_rect_calc_hscale  ================
[18:49:16] [PASSED] normal use
[18:49:16] [PASSED] out of max range
[18:49:16] [PASSED] out of min range
[18:49:16] [PASSED] zero dst
[18:49:16] [PASSED] negative src
[18:49:16] [PASSED] negative dst
[18:49:16] ============ [PASSED] drm_test_rect_calc_hscale ============
[18:49:16] ================ drm_test_rect_calc_vscale  ================
[18:49:16] [PASSED] normal use
stty: 'standard input': Inappropriate ioctl for device
[18:49:16] [PASSED] out of max range
[18:49:16] [PASSED] out of min range
[18:49:16] [PASSED] zero dst
[18:49:16] [PASSED] negative src
[18:49:16] [PASSED] negative dst
[18:49:16] ============ [PASSED] drm_test_rect_calc_vscale ============
[18:49:16] ================== drm_test_rect_rotate  ===================
[18:49:16] [PASSED] reflect-x
[18:49:16] [PASSED] reflect-y
[18:49:16] [PASSED] rotate-0
[18:49:16] [PASSED] rotate-90
[18:49:16] [PASSED] rotate-180
[18:49:16] [PASSED] rotate-270
[18:49:16] ============== [PASSED] drm_test_rect_rotate ===============
[18:49:16] ================ drm_test_rect_rotate_inv  =================
[18:49:16] [PASSED] reflect-x
[18:49:16] [PASSED] reflect-y
[18:49:16] [PASSED] rotate-0
[18:49:16] [PASSED] rotate-90
[18:49:16] [PASSED] rotate-180
[18:49:16] [PASSED] rotate-270
[18:49:16] ============ [PASSED] drm_test_rect_rotate_inv =============
[18:49:16] ==================== [PASSED] drm_rect =====================
[18:49:16] ============ drm_sysfb_modeset_test (1 subtest) ============
[18:49:16] ============ drm_test_sysfb_build_fourcc_list  =============
[18:49:16] [PASSED] no native formats
[18:49:16] [PASSED] XRGB8888 as native format
[18:49:16] [PASSED] remove duplicates
[18:49:16] [PASSED] convert alpha formats
[18:49:16] [PASSED] random formats
[18:49:16] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[18:49:16] ============= [PASSED] drm_sysfb_modeset_test ==============
[18:49:16] ================== drm_fixp (2 subtests) ===================
[18:49:16] [PASSED] drm_test_int2fixp
[18:49:16] [PASSED] drm_test_sm2fixp
[18:49:16] ==================== [PASSED] drm_fixp =====================
[18:49:16] ============================================================
[18:49:16] Testing complete. Ran 624 tests: passed: 624
[18:49:16] Elapsed time: 27.783s total, 1.678s configuring, 25.635s building, 0.424s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[18:49:16] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:49:18] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[18:49:27] Starting KUnit Kernel (1/1)...
[18:49:27] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[18:49:27] ================= ttm_device (5 subtests) ==================
[18:49:27] [PASSED] ttm_device_init_basic
[18:49:27] [PASSED] ttm_device_init_multiple
[18:49:27] [PASSED] ttm_device_fini_basic
[18:49:27] [PASSED] ttm_device_init_no_vma_man
[18:49:27] ================== ttm_device_init_pools  ==================
[18:49:27] [PASSED] No DMA allocations, no DMA32 required
[18:49:27] [PASSED] DMA allocations, DMA32 required
[18:49:27] [PASSED] No DMA allocations, DMA32 required
[18:49:27] [PASSED] DMA allocations, no DMA32 required
[18:49:27] ============== [PASSED] ttm_device_init_pools ==============
[18:49:27] =================== [PASSED] ttm_device ====================
[18:49:27] ================== ttm_pool (8 subtests) ===================
[18:49:27] ================== ttm_pool_alloc_basic  ===================
[18:49:27] [PASSED] One page
[18:49:27] [PASSED] More than one page
[18:49:27] [PASSED] Above the allocation limit
[18:49:27] [PASSED] One page, with coherent DMA mappings enabled
[18:49:27] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[18:49:27] ============== [PASSED] ttm_pool_alloc_basic ===============
[18:49:27] ============== ttm_pool_alloc_basic_dma_addr  ==============
[18:49:27] [PASSED] One page
[18:49:27] [PASSED] More than one page
[18:49:27] [PASSED] Above the allocation limit
[18:49:27] [PASSED] One page, with coherent DMA mappings enabled
[18:49:27] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[18:49:27] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[18:49:27] [PASSED] ttm_pool_alloc_order_caching_match
[18:49:27] [PASSED] ttm_pool_alloc_caching_mismatch
[18:49:27] [PASSED] ttm_pool_alloc_order_mismatch
[18:49:27] [PASSED] ttm_pool_free_dma_alloc
[18:49:27] [PASSED] ttm_pool_free_no_dma_alloc
[18:49:27] [PASSED] ttm_pool_fini_basic
[18:49:27] ==================== [PASSED] ttm_pool =====================
[18:49:27] ================ ttm_resource (8 subtests) =================
[18:49:27] ================= ttm_resource_init_basic  =================
[18:49:27] [PASSED] Init resource in TTM_PL_SYSTEM
[18:49:27] [PASSED] Init resource in TTM_PL_VRAM
[18:49:27] [PASSED] Init resource in a private placement
[18:49:27] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[18:49:27] ============= [PASSED] ttm_resource_init_basic =============
[18:49:27] [PASSED] ttm_resource_init_pinned
[18:49:27] [PASSED] ttm_resource_fini_basic
[18:49:27] [PASSED] ttm_resource_manager_init_basic
[18:49:27] [PASSED] ttm_resource_manager_usage_basic
[18:49:27] [PASSED] ttm_resource_manager_set_used_basic
[18:49:27] [PASSED] ttm_sys_man_alloc_basic
[18:49:27] [PASSED] ttm_sys_man_free_basic
[18:49:27] ================== [PASSED] ttm_resource ===================
[18:49:27] =================== ttm_tt (15 subtests) ===================
[18:49:27] ==================== ttm_tt_init_basic  ====================
[18:49:27] [PASSED] Page-aligned size
[18:49:27] [PASSED] Extra pages requested
[18:49:27] ================ [PASSED] ttm_tt_init_basic ================
[18:49:27] [PASSED] ttm_tt_init_misaligned
[18:49:27] [PASSED] ttm_tt_fini_basic
[18:49:27] [PASSED] ttm_tt_fini_sg
[18:49:27] [PASSED] ttm_tt_fini_shmem
[18:49:27] [PASSED] ttm_tt_create_basic
[18:49:27] [PASSED] ttm_tt_create_invalid_bo_type
[18:49:27] [PASSED] ttm_tt_create_ttm_exists
[18:49:27] [PASSED] ttm_tt_create_failed
[18:49:27] [PASSED] ttm_tt_destroy_basic
[18:49:27] [PASSED] ttm_tt_populate_null_ttm
[18:49:27] [PASSED] ttm_tt_populate_populated_ttm
[18:49:27] [PASSED] ttm_tt_unpopulate_basic
[18:49:27] [PASSED] ttm_tt_unpopulate_empty_ttm
[18:49:27] [PASSED] ttm_tt_swapin_basic
[18:49:27] ===================== [PASSED] ttm_tt ======================
[18:49:27] =================== ttm_bo (14 subtests) ===================
[18:49:27] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[18:49:27] [PASSED] Cannot be interrupted and sleeps
[18:49:27] [PASSED] Cannot be interrupted, locks straight away
[18:49:27] [PASSED] Can be interrupted, sleeps
[18:49:27] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[18:49:27] [PASSED] ttm_bo_reserve_locked_no_sleep
[18:49:27] [PASSED] ttm_bo_reserve_no_wait_ticket
[18:49:27] [PASSED] ttm_bo_reserve_double_resv
[18:49:27] [PASSED] ttm_bo_reserve_interrupted
[18:49:27] [PASSED] ttm_bo_reserve_deadlock
[18:49:27] [PASSED] ttm_bo_unreserve_basic
[18:49:27] [PASSED] ttm_bo_unreserve_pinned
[18:49:27] [PASSED] ttm_bo_unreserve_bulk
[18:49:27] [PASSED] ttm_bo_fini_basic
[18:49:27] [PASSED] ttm_bo_fini_shared_resv
[18:49:27] [PASSED] ttm_bo_pin_basic
[18:49:27] [PASSED] ttm_bo_pin_unpin_resource
[18:49:27] [PASSED] ttm_bo_multiple_pin_one_unpin
[18:49:27] ===================== [PASSED] ttm_bo ======================
[18:49:27] ============== ttm_bo_validate (21 subtests) ===============
[18:49:27] ============== ttm_bo_init_reserved_sys_man  ===============
[18:49:27] [PASSED] Buffer object for userspace
[18:49:27] [PASSED] Kernel buffer object
[18:49:27] [PASSED] Shared buffer object
[18:49:27] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[18:49:27] ============== ttm_bo_init_reserved_mock_man  ==============
[18:49:27] [PASSED] Buffer object for userspace
[18:49:27] [PASSED] Kernel buffer object
[18:49:27] [PASSED] Shared buffer object
[18:49:27] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[18:49:27] [PASSED] ttm_bo_init_reserved_resv
[18:49:27] ================== ttm_bo_validate_basic  ==================
[18:49:27] [PASSED] Buffer object for userspace
[18:49:27] [PASSED] Kernel buffer object
[18:49:27] [PASSED] Shared buffer object
[18:49:27] ============== [PASSED] ttm_bo_validate_basic ==============
[18:49:27] [PASSED] ttm_bo_validate_invalid_placement
[18:49:27] ============= ttm_bo_validate_same_placement  ==============
[18:49:27] [PASSED] System manager
[18:49:27] [PASSED] VRAM manager
[18:49:27] ========= [PASSED] ttm_bo_validate_same_placement ==========
[18:49:27] [PASSED] ttm_bo_validate_failed_alloc
[18:49:27] [PASSED] ttm_bo_validate_pinned
[18:49:27] [PASSED] ttm_bo_validate_busy_placement
[18:49:27] ================ ttm_bo_validate_multihop  =================
[18:49:27] [PASSED] Buffer object for userspace
[18:49:27] [PASSED] Kernel buffer object
[18:49:27] [PASSED] Shared buffer object
[18:49:27] ============ [PASSED] ttm_bo_validate_multihop =============
[18:49:27] ========== ttm_bo_validate_no_placement_signaled  ==========
[18:49:27] [PASSED] Buffer object in system domain, no page vector
[18:49:27] [PASSED] Buffer object in system domain with an existing page vector
[18:49:27] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[18:49:27] ======== ttm_bo_validate_no_placement_not_signaled  ========
[18:49:27] [PASSED] Buffer object for userspace
[18:49:27] [PASSED] Kernel buffer object
[18:49:27] [PASSED] Shared buffer object
[18:49:27] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[18:49:27] [PASSED] ttm_bo_validate_move_fence_signaled
[18:49:27] ========= ttm_bo_validate_move_fence_not_signaled  =========
[18:49:27] [PASSED] Waits for GPU
[18:49:27] [PASSED] Tries to lock straight away
[18:49:27] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[18:49:27] [PASSED] ttm_bo_validate_happy_evict
[18:49:27] [PASSED] ttm_bo_validate_all_pinned_evict
[18:49:27] [PASSED] ttm_bo_validate_allowed_only_evict
[18:49:27] [PASSED] ttm_bo_validate_deleted_evict
[18:49:27] [PASSED] ttm_bo_validate_busy_domain_evict
[18:49:27] [PASSED] ttm_bo_validate_evict_gutting
[18:49:27] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[18:49:27] ================= [PASSED] ttm_bo_validate =================
[18:49:27] ============================================================
[18:49:27] Testing complete. Ran 101 tests: passed: 101
[18:49:27] Elapsed time: 11.362s total, 1.660s configuring, 9.486s building, 0.186s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


