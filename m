Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A28D6100C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 12:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5EB10E853;
	Thu, 29 Jan 2026 12:45:06 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A75D10E853;
 Thu, 29 Jan 2026 12:45:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/sysctrl=3A_Add_system_c?=
 =?utf-8?q?ontroller_component_for_Xe3p_dGPU_platforms_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Jan 2026 12:45:05 -0000
Message-ID: <176969070523.205866.10765735419336474035@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260129121044.3670780-8-anoop.c.vijay@intel.com>
In-Reply-To: <20260129121044.3670780-8-anoop.c.vijay@intel.com>
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

Series: drm/xe/sysctrl: Add system controller component for Xe3p dGPU platforms (rev7)
URL   : https://patchwork.freedesktop.org/series/159554/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[12:43:47] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:43:51] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[12:44:22] Starting KUnit Kernel (1/1)...
[12:44:22] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[12:44:23] ================== guc_buf (11 subtests) ===================
[12:44:23] [PASSED] test_smallest
[12:44:23] [PASSED] test_largest
[12:44:23] [PASSED] test_granular
[12:44:23] [PASSED] test_unique
[12:44:23] [PASSED] test_overlap
[12:44:23] [PASSED] test_reusable
[12:44:23] [PASSED] test_too_big
[12:44:23] [PASSED] test_flush
[12:44:23] [PASSED] test_lookup
[12:44:23] [PASSED] test_data
[12:44:23] [PASSED] test_class
[12:44:23] ===================== [PASSED] guc_buf =====================
[12:44:23] =================== guc_dbm (7 subtests) ===================
[12:44:23] [PASSED] test_empty
[12:44:23] [PASSED] test_default
[12:44:23] ======================== test_size  ========================
[12:44:23] [PASSED] 4
[12:44:23] [PASSED] 8
[12:44:23] [PASSED] 32
[12:44:23] [PASSED] 256
[12:44:23] ==================== [PASSED] test_size ====================
[12:44:23] ======================= test_reuse  ========================
[12:44:23] [PASSED] 4
[12:44:23] [PASSED] 8
[12:44:23] [PASSED] 32
[12:44:23] [PASSED] 256
[12:44:23] =================== [PASSED] test_reuse ====================
[12:44:23] =================== test_range_overlap  ====================
[12:44:23] [PASSED] 4
[12:44:23] [PASSED] 8
[12:44:23] [PASSED] 32
[12:44:23] [PASSED] 256
[12:44:23] =============== [PASSED] test_range_overlap ================
[12:44:23] =================== test_range_compact  ====================
[12:44:23] [PASSED] 4
[12:44:23] [PASSED] 8
[12:44:23] [PASSED] 32
[12:44:23] [PASSED] 256
[12:44:23] =============== [PASSED] test_range_compact ================
[12:44:23] ==================== test_range_spare  =====================
[12:44:23] [PASSED] 4
[12:44:23] [PASSED] 8
[12:44:23] [PASSED] 32
[12:44:23] [PASSED] 256
[12:44:23] ================ [PASSED] test_range_spare =================
[12:44:23] ===================== [PASSED] guc_dbm =====================
[12:44:23] =================== guc_idm (6 subtests) ===================
[12:44:23] [PASSED] bad_init
[12:44:23] [PASSED] no_init
[12:44:23] [PASSED] init_fini
[12:44:23] [PASSED] check_used
[12:44:23] [PASSED] check_quota
[12:44:23] [PASSED] check_all
[12:44:23] ===================== [PASSED] guc_idm =====================
[12:44:23] ================== no_relay (3 subtests) ===================
[12:44:23] [PASSED] xe_drops_guc2pf_if_not_ready
[12:44:23] [PASSED] xe_drops_guc2vf_if_not_ready
[12:44:23] [PASSED] xe_rejects_send_if_not_ready
[12:44:23] ==================== [PASSED] no_relay =====================
[12:44:23] ================== pf_relay (14 subtests) ==================
[12:44:23] [PASSED] pf_rejects_guc2pf_too_short
[12:44:23] [PASSED] pf_rejects_guc2pf_too_long
[12:44:23] [PASSED] pf_rejects_guc2pf_no_payload
[12:44:23] [PASSED] pf_fails_no_payload
[12:44:23] [PASSED] pf_fails_bad_origin
[12:44:23] [PASSED] pf_fails_bad_type
[12:44:23] [PASSED] pf_txn_reports_error
[12:44:23] [PASSED] pf_txn_sends_pf2guc
[12:44:23] [PASSED] pf_sends_pf2guc
[12:44:23] [SKIPPED] pf_loopback_nop
[12:44:23] [SKIPPED] pf_loopback_echo
[12:44:23] [SKIPPED] pf_loopback_fail
[12:44:23] [SKIPPED] pf_loopback_busy
[12:44:23] [SKIPPED] pf_loopback_retry
[12:44:23] ==================== [PASSED] pf_relay =====================
[12:44:23] ================== vf_relay (3 subtests) ===================
[12:44:23] [PASSED] vf_rejects_guc2vf_too_short
[12:44:23] [PASSED] vf_rejects_guc2vf_too_long
[12:44:23] [PASSED] vf_rejects_guc2vf_no_payload
[12:44:23] ==================== [PASSED] vf_relay =====================
[12:44:23] ================ pf_gt_config (6 subtests) =================
[12:44:23] [PASSED] fair_contexts_1vf
[12:44:23] [PASSED] fair_doorbells_1vf
[12:44:23] [PASSED] fair_ggtt_1vf
[12:44:23] ====================== fair_contexts  ======================
[12:44:23] [PASSED] 1 VF
[12:44:23] [PASSED] 2 VFs
[12:44:23] [PASSED] 3 VFs
[12:44:23] [PASSED] 4 VFs
[12:44:23] [PASSED] 5 VFs
[12:44:23] [PASSED] 6 VFs
[12:44:23] [PASSED] 7 VFs
[12:44:23] [PASSED] 8 VFs
[12:44:23] [PASSED] 9 VFs
[12:44:23] [PASSED] 10 VFs
[12:44:23] [PASSED] 11 VFs
[12:44:23] [PASSED] 12 VFs
[12:44:23] [PASSED] 13 VFs
[12:44:23] [PASSED] 14 VFs
[12:44:23] [PASSED] 15 VFs
[12:44:23] [PASSED] 16 VFs
[12:44:23] [PASSED] 17 VFs
[12:44:23] [PASSED] 18 VFs
[12:44:23] [PASSED] 19 VFs
[12:44:23] [PASSED] 20 VFs
[12:44:23] [PASSED] 21 VFs
[12:44:23] [PASSED] 22 VFs
[12:44:23] [PASSED] 23 VFs
[12:44:23] [PASSED] 24 VFs
[12:44:23] [PASSED] 25 VFs
[12:44:23] [PASSED] 26 VFs
[12:44:23] [PASSED] 27 VFs
[12:44:23] [PASSED] 28 VFs
[12:44:23] [PASSED] 29 VFs
[12:44:23] [PASSED] 30 VFs
[12:44:23] [PASSED] 31 VFs
[12:44:23] [PASSED] 32 VFs
[12:44:23] [PASSED] 33 VFs
[12:44:23] [PASSED] 34 VFs
[12:44:23] [PASSED] 35 VFs
[12:44:23] [PASSED] 36 VFs
[12:44:23] [PASSED] 37 VFs
[12:44:23] [PASSED] 38 VFs
[12:44:23] [PASSED] 39 VFs
[12:44:23] [PASSED] 40 VFs
[12:44:23] [PASSED] 41 VFs
[12:44:23] [PASSED] 42 VFs
[12:44:23] [PASSED] 43 VFs
[12:44:23] [PASSED] 44 VFs
[12:44:23] [PASSED] 45 VFs
[12:44:23] [PASSED] 46 VFs
[12:44:23] [PASSED] 47 VFs
[12:44:23] [PASSED] 48 VFs
[12:44:23] [PASSED] 49 VFs
[12:44:23] [PASSED] 50 VFs
[12:44:23] [PASSED] 51 VFs
[12:44:23] [PASSED] 52 VFs
[12:44:23] [PASSED] 53 VFs
[12:44:23] [PASSED] 54 VFs
[12:44:23] [PASSED] 55 VFs
[12:44:23] [PASSED] 56 VFs
[12:44:23] [PASSED] 57 VFs
[12:44:23] [PASSED] 58 VFs
[12:44:23] [PASSED] 59 VFs
[12:44:23] [PASSED] 60 VFs
[12:44:23] [PASSED] 61 VFs
[12:44:23] [PASSED] 62 VFs
[12:44:23] [PASSED] 63 VFs
[12:44:23] ================== [PASSED] fair_contexts ==================
[12:44:23] ===================== fair_doorbells  ======================
[12:44:23] [PASSED] 1 VF
[12:44:23] [PASSED] 2 VFs
[12:44:23] [PASSED] 3 VFs
[12:44:23] [PASSED] 4 VFs
[12:44:23] [PASSED] 5 VFs
[12:44:23] [PASSED] 6 VFs
[12:44:23] [PASSED] 7 VFs
[12:44:23] [PASSED] 8 VFs
[12:44:23] [PASSED] 9 VFs
[12:44:23] [PASSED] 10 VFs
[12:44:23] [PASSED] 11 VFs
[12:44:23] [PASSED] 12 VFs
[12:44:23] [PASSED] 13 VFs
[12:44:23] [PASSED] 14 VFs
[12:44:23] [PASSED] 15 VFs
[12:44:23] [PASSED] 16 VFs
[12:44:23] [PASSED] 17 VFs
[12:44:23] [PASSED] 18 VFs
[12:44:23] [PASSED] 19 VFs
[12:44:23] [PASSED] 20 VFs
[12:44:23] [PASSED] 21 VFs
[12:44:23] [PASSED] 22 VFs
[12:44:23] [PASSED] 23 VFs
[12:44:23] [PASSED] 24 VFs
[12:44:23] [PASSED] 25 VFs
[12:44:23] [PASSED] 26 VFs
[12:44:23] [PASSED] 27 VFs
[12:44:23] [PASSED] 28 VFs
[12:44:23] [PASSED] 29 VFs
[12:44:23] [PASSED] 30 VFs
[12:44:23] [PASSED] 31 VFs
[12:44:23] [PASSED] 32 VFs
[12:44:23] [PASSED] 33 VFs
[12:44:23] [PASSED] 34 VFs
[12:44:23] [PASSED] 35 VFs
[12:44:23] [PASSED] 36 VFs
[12:44:23] [PASSED] 37 VFs
[12:44:23] [PASSED] 38 VFs
[12:44:23] [PASSED] 39 VFs
[12:44:23] [PASSED] 40 VFs
[12:44:23] [PASSED] 41 VFs
[12:44:23] [PASSED] 42 VFs
[12:44:23] [PASSED] 43 VFs
[12:44:23] [PASSED] 44 VFs
[12:44:23] [PASSED] 45 VFs
[12:44:23] [PASSED] 46 VFs
[12:44:23] [PASSED] 47 VFs
[12:44:23] [PASSED] 48 VFs
[12:44:23] [PASSED] 49 VFs
[12:44:23] [PASSED] 50 VFs
[12:44:23] [PASSED] 51 VFs
[12:44:23] [PASSED] 52 VFs
[12:44:23] [PASSED] 53 VFs
[12:44:23] [PASSED] 54 VFs
[12:44:23] [PASSED] 55 VFs
[12:44:23] [PASSED] 56 VFs
[12:44:23] [PASSED] 57 VFs
[12:44:23] [PASSED] 58 VFs
[12:44:23] [PASSED] 59 VFs
[12:44:23] [PASSED] 60 VFs
[12:44:23] [PASSED] 61 VFs
[12:44:23] [PASSED] 62 VFs
[12:44:23] [PASSED] 63 VFs
[12:44:23] ================= [PASSED] fair_doorbells ==================
[12:44:23] ======================== fair_ggtt  ========================
[12:44:23] [PASSED] 1 VF
[12:44:23] [PASSED] 2 VFs
[12:44:23] [PASSED] 3 VFs
[12:44:23] [PASSED] 4 VFs
[12:44:23] [PASSED] 5 VFs
[12:44:23] [PASSED] 6 VFs
[12:44:23] [PASSED] 7 VFs
[12:44:23] [PASSED] 8 VFs
[12:44:23] [PASSED] 9 VFs
[12:44:23] [PASSED] 10 VFs
[12:44:23] [PASSED] 11 VFs
[12:44:23] [PASSED] 12 VFs
[12:44:23] [PASSED] 13 VFs
[12:44:23] [PASSED] 14 VFs
[12:44:23] [PASSED] 15 VFs
[12:44:23] [PASSED] 16 VFs
[12:44:23] [PASSED] 17 VFs
[12:44:23] [PASSED] 18 VFs
[12:44:23] [PASSED] 19 VFs
[12:44:23] [PASSED] 20 VFs
[12:44:23] [PASSED] 21 VFs
[12:44:23] [PASSED] 22 VFs
[12:44:23] [PASSED] 23 VFs
[12:44:23] [PASSED] 24 VFs
[12:44:23] [PASSED] 25 VFs
[12:44:23] [PASSED] 26 VFs
[12:44:23] [PASSED] 27 VFs
[12:44:23] [PASSED] 28 VFs
[12:44:23] [PASSED] 29 VFs
[12:44:23] [PASSED] 30 VFs
[12:44:23] [PASSED] 31 VFs
[12:44:23] [PASSED] 32 VFs
[12:44:23] [PASSED] 33 VFs
[12:44:23] [PASSED] 34 VFs
[12:44:23] [PASSED] 35 VFs
[12:44:23] [PASSED] 36 VFs
[12:44:23] [PASSED] 37 VFs
[12:44:23] [PASSED] 38 VFs
[12:44:23] [PASSED] 39 VFs
[12:44:23] [PASSED] 40 VFs
[12:44:23] [PASSED] 41 VFs
[12:44:23] [PASSED] 42 VFs
[12:44:23] [PASSED] 43 VFs
[12:44:23] [PASSED] 44 VFs
[12:44:23] [PASSED] 45 VFs
[12:44:23] [PASSED] 46 VFs
[12:44:23] [PASSED] 47 VFs
[12:44:23] [PASSED] 48 VFs
[12:44:23] [PASSED] 49 VFs
[12:44:23] [PASSED] 50 VFs
[12:44:23] [PASSED] 51 VFs
[12:44:23] [PASSED] 52 VFs
[12:44:23] [PASSED] 53 VFs
[12:44:23] [PASSED] 54 VFs
[12:44:23] [PASSED] 55 VFs
[12:44:23] [PASSED] 56 VFs
[12:44:23] [PASSED] 57 VFs
[12:44:23] [PASSED] 58 VFs
[12:44:23] [PASSED] 59 VFs
[12:44:23] [PASSED] 60 VFs
[12:44:23] [PASSED] 61 VFs
[12:44:23] [PASSED] 62 VFs
[12:44:23] [PASSED] 63 VFs
[12:44:23] ==================== [PASSED] fair_ggtt ====================
[12:44:23] ================== [PASSED] pf_gt_config ===================
[12:44:23] ===================== lmtt (1 subtest) =====================
[12:44:23] ======================== test_ops  =========================
[12:44:23] [PASSED] 2-level
[12:44:23] [PASSED] multi-level
[12:44:23] ==================== [PASSED] test_ops =====================
[12:44:23] ====================== [PASSED] lmtt =======================
[12:44:23] ================= pf_service (11 subtests) =================
[12:44:23] [PASSED] pf_negotiate_any
[12:44:23] [PASSED] pf_negotiate_base_match
[12:44:23] [PASSED] pf_negotiate_base_newer
[12:44:23] [PASSED] pf_negotiate_base_next
[12:44:23] [SKIPPED] pf_negotiate_base_older
[12:44:23] [PASSED] pf_negotiate_base_prev
[12:44:23] [PASSED] pf_negotiate_latest_match
[12:44:23] [PASSED] pf_negotiate_latest_newer
[12:44:23] [PASSED] pf_negotiate_latest_next
[12:44:23] [SKIPPED] pf_negotiate_latest_older
[12:44:23] [SKIPPED] pf_negotiate_latest_prev
[12:44:23] =================== [PASSED] pf_service ====================
[12:44:23] ================= xe_guc_g2g (2 subtests) ==================
[12:44:23] ============== xe_live_guc_g2g_kunit_default  ==============
[12:44:23] ========= [SKIPPED] xe_live_guc_g2g_kunit_default ==========
[12:44:23] ============== xe_live_guc_g2g_kunit_allmem  ===============
[12:44:23] ========== [SKIPPED] xe_live_guc_g2g_kunit_allmem ==========
[12:44:23] =================== [SKIPPED] xe_guc_g2g ===================
[12:44:23] =================== xe_mocs (2 subtests) ===================
[12:44:23] ================ xe_live_mocs_kernel_kunit  ================
[12:44:23] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[12:44:23] ================ xe_live_mocs_reset_kunit  =================
[12:44:23] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[12:44:23] ==================== [SKIPPED] xe_mocs =====================
[12:44:23] ================= xe_migrate (2 subtests) ==================
[12:44:23] ================= xe_migrate_sanity_kunit  =================
[12:44:23] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[12:44:23] ================== xe_validate_ccs_kunit  ==================
[12:44:23] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[12:44:23] =================== [SKIPPED] xe_migrate ===================
[12:44:23] ================== xe_dma_buf (1 subtest) ==================
[12:44:23] ==================== xe_dma_buf_kunit  =====================
[12:44:23] ================ [SKIPPED] xe_dma_buf_kunit ================
[12:44:23] =================== [SKIPPED] xe_dma_buf ===================
[12:44:23] ================= xe_bo_shrink (1 subtest) =================
[12:44:23] =================== xe_bo_shrink_kunit  ====================
[12:44:23] =============== [SKIPPED] xe_bo_shrink_kunit ===============
[12:44:23] ================== [SKIPPED] xe_bo_shrink ==================
[12:44:23] ==================== xe_bo (2 subtests) ====================
[12:44:23] ================== xe_ccs_migrate_kunit  ===================
[12:44:23] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[12:44:23] ==================== xe_bo_evict_kunit  ====================
[12:44:23] =============== [SKIPPED] xe_bo_evict_kunit ================
[12:44:23] ===================== [SKIPPED] xe_bo ======================
[12:44:23] ==================== args (13 subtests) ====================
[12:44:23] [PASSED] count_args_test
[12:44:23] [PASSED] call_args_example
[12:44:23] [PASSED] call_args_test
[12:44:23] [PASSED] drop_first_arg_example
[12:44:23] [PASSED] drop_first_arg_test
[12:44:23] [PASSED] first_arg_example
[12:44:23] [PASSED] first_arg_test
[12:44:23] [PASSED] last_arg_example
[12:44:23] [PASSED] last_arg_test
[12:44:23] [PASSED] pick_arg_example
[12:44:23] [PASSED] if_args_example
[12:44:23] [PASSED] if_args_test
[12:44:23] [PASSED] sep_comma_example
[12:44:23] ====================== [PASSED] args =======================
[12:44:23] =================== xe_pci (3 subtests) ====================
[12:44:23] ==================== check_graphics_ip  ====================
[12:44:23] [PASSED] 12.00 Xe_LP
[12:44:23] [PASSED] 12.10 Xe_LP+
[12:44:23] [PASSED] 12.55 Xe_HPG
[12:44:23] [PASSED] 12.60 Xe_HPC
[12:44:23] [PASSED] 12.70 Xe_LPG
[12:44:23] [PASSED] 12.71 Xe_LPG
[12:44:23] [PASSED] 12.74 Xe_LPG+
[12:44:23] [PASSED] 20.01 Xe2_HPG
[12:44:23] [PASSED] 20.02 Xe2_HPG
[12:44:23] [PASSED] 20.04 Xe2_LPG
[12:44:23] [PASSED] 30.00 Xe3_LPG
[12:44:23] [PASSED] 30.01 Xe3_LPG
[12:44:23] [PASSED] 30.03 Xe3_LPG
[12:44:23] [PASSED] 30.04 Xe3_LPG
[12:44:23] [PASSED] 30.05 Xe3_LPG
[12:44:23] [PASSED] 35.11 Xe3p_XPC
[12:44:23] ================ [PASSED] check_graphics_ip ================
[12:44:23] ===================== check_media_ip  ======================
[12:44:23] [PASSED] 12.00 Xe_M
[12:44:23] [PASSED] 12.55 Xe_HPM
[12:44:23] [PASSED] 13.00 Xe_LPM+
[12:44:23] [PASSED] 13.01 Xe2_HPM
[12:44:23] [PASSED] 20.00 Xe2_LPM
[12:44:23] [PASSED] 30.00 Xe3_LPM
[12:44:23] [PASSED] 30.02 Xe3_LPM
[12:44:23] [PASSED] 35.00 Xe3p_LPM
[12:44:23] [PASSED] 35.03 Xe3p_HPM
[12:44:23] ================= [PASSED] check_media_ip ==================
[12:44:23] =================== check_platform_desc  ===================
[12:44:23] [PASSED] 0x9A60 (TIGERLAKE)
[12:44:23] [PASSED] 0x9A68 (TIGERLAKE)
[12:44:23] [PASSED] 0x9A70 (TIGERLAKE)
[12:44:23] [PASSED] 0x9A40 (TIGERLAKE)
[12:44:23] [PASSED] 0x9A49 (TIGERLAKE)
[12:44:23] [PASSED] 0x9A59 (TIGERLAKE)
[12:44:23] [PASSED] 0x9A78 (TIGERLAKE)
[12:44:23] [PASSED] 0x9AC0 (TIGERLAKE)
[12:44:23] [PASSED] 0x9AC9 (TIGERLAKE)
[12:44:23] [PASSED] 0x9AD9 (TIGERLAKE)
[12:44:23] [PASSED] 0x9AF8 (TIGERLAKE)
[12:44:23] [PASSED] 0x4C80 (ROCKETLAKE)
[12:44:23] [PASSED] 0x4C8A (ROCKETLAKE)
[12:44:23] [PASSED] 0x4C8B (ROCKETLAKE)
[12:44:23] [PASSED] 0x4C8C (ROCKETLAKE)
[12:44:23] [PASSED] 0x4C90 (ROCKETLAKE)
[12:44:23] [PASSED] 0x4C9A (ROCKETLAKE)
[12:44:23] [PASSED] 0x4680 (ALDERLAKE_S)
[12:44:23] [PASSED] 0x4682 (ALDERLAKE_S)
[12:44:23] [PASSED] 0x4688 (ALDERLAKE_S)
[12:44:23] [PASSED] 0x468A (ALDERLAKE_S)
[12:44:23] [PASSED] 0x468B (ALDERLAKE_S)
[12:44:23] [PASSED] 0x4690 (ALDERLAKE_S)
[12:44:23] [PASSED] 0x4692 (ALDERLAKE_S)
[12:44:23] [PASSED] 0x4693 (ALDERLAKE_S)
[12:44:23] [PASSED] 0x46A0 (ALDERLAKE_P)
[12:44:23] [PASSED] 0x46A1 (ALDERLAKE_P)
[12:44:23] [PASSED] 0x46A2 (ALDERLAKE_P)
[12:44:23] [PASSED] 0x46A3 (ALDERLAKE_P)
[12:44:23] [PASSED] 0x46A6 (ALDERLAKE_P)
[12:44:23] [PASSED] 0x46A8 (ALDERLAKE_P)
[12:44:23] [PASSED] 0x46AA (ALDERLAKE_P)
[12:44:23] [PASSED] 0x462A (ALDERLAKE_P)
[12:44:23] [PASSED] 0x4626 (ALDERLAKE_P)
[12:44:23] [PASSED] 0x4628 (ALDERLAKE_P)
stty: 'standard input': Inappropriate ioctl for device
[12:44:23] [PASSED] 0x46B0 (ALDERLAKE_P)
[12:44:23] [PASSED] 0x46B1 (ALDERLAKE_P)
[12:44:23] [PASSED] 0x46B2 (ALDERLAKE_P)
[12:44:23] [PASSED] 0x46B3 (ALDERLAKE_P)
[12:44:23] [PASSED] 0x46C0 (ALDERLAKE_P)
[12:44:23] [PASSED] 0x46C1 (ALDERLAKE_P)
[12:44:23] [PASSED] 0x46C2 (ALDERLAKE_P)
[12:44:23] [PASSED] 0x46C3 (ALDERLAKE_P)
[12:44:23] [PASSED] 0x46D0 (ALDERLAKE_N)
[12:44:23] [PASSED] 0x46D1 (ALDERLAKE_N)
[12:44:23] [PASSED] 0x46D2 (ALDERLAKE_N)
[12:44:23] [PASSED] 0x46D3 (ALDERLAKE_N)
[12:44:23] [PASSED] 0x46D4 (ALDERLAKE_N)
[12:44:23] [PASSED] 0xA721 (ALDERLAKE_P)
[12:44:23] [PASSED] 0xA7A1 (ALDERLAKE_P)
[12:44:23] [PASSED] 0xA7A9 (ALDERLAKE_P)
[12:44:23] [PASSED] 0xA7AC (ALDERLAKE_P)
[12:44:23] [PASSED] 0xA7AD (ALDERLAKE_P)
[12:44:23] [PASSED] 0xA720 (ALDERLAKE_P)
[12:44:23] [PASSED] 0xA7A0 (ALDERLAKE_P)
[12:44:23] [PASSED] 0xA7A8 (ALDERLAKE_P)
[12:44:23] [PASSED] 0xA7AA (ALDERLAKE_P)
[12:44:23] [PASSED] 0xA7AB (ALDERLAKE_P)
[12:44:23] [PASSED] 0xA780 (ALDERLAKE_S)
[12:44:23] [PASSED] 0xA781 (ALDERLAKE_S)
[12:44:23] [PASSED] 0xA782 (ALDERLAKE_S)
[12:44:23] [PASSED] 0xA783 (ALDERLAKE_S)
[12:44:23] [PASSED] 0xA788 (ALDERLAKE_S)
[12:44:23] [PASSED] 0xA789 (ALDERLAKE_S)
[12:44:23] [PASSED] 0xA78A (ALDERLAKE_S)
[12:44:23] [PASSED] 0xA78B (ALDERLAKE_S)
[12:44:23] [PASSED] 0x4905 (DG1)
[12:44:23] [PASSED] 0x4906 (DG1)
[12:44:23] [PASSED] 0x4907 (DG1)
[12:44:23] [PASSED] 0x4908 (DG1)
[12:44:23] [PASSED] 0x4909 (DG1)
[12:44:23] [PASSED] 0x56C0 (DG2)
[12:44:23] [PASSED] 0x56C2 (DG2)
[12:44:23] [PASSED] 0x56C1 (DG2)
[12:44:23] [PASSED] 0x7D51 (METEORLAKE)
[12:44:23] [PASSED] 0x7DD1 (METEORLAKE)
[12:44:23] [PASSED] 0x7D41 (METEORLAKE)
[12:44:23] [PASSED] 0x7D67 (METEORLAKE)
[12:44:23] [PASSED] 0xB640 (METEORLAKE)
[12:44:23] [PASSED] 0x56A0 (DG2)
[12:44:23] [PASSED] 0x56A1 (DG2)
[12:44:23] [PASSED] 0x56A2 (DG2)
[12:44:23] [PASSED] 0x56BE (DG2)
[12:44:23] [PASSED] 0x56BF (DG2)
[12:44:23] [PASSED] 0x5690 (DG2)
[12:44:23] [PASSED] 0x5691 (DG2)
[12:44:23] [PASSED] 0x5692 (DG2)
[12:44:23] [PASSED] 0x56A5 (DG2)
[12:44:23] [PASSED] 0x56A6 (DG2)
[12:44:23] [PASSED] 0x56B0 (DG2)
[12:44:23] [PASSED] 0x56B1 (DG2)
[12:44:23] [PASSED] 0x56BA (DG2)
[12:44:23] [PASSED] 0x56BB (DG2)
[12:44:23] [PASSED] 0x56BC (DG2)
[12:44:23] [PASSED] 0x56BD (DG2)
[12:44:23] [PASSED] 0x5693 (DG2)
[12:44:23] [PASSED] 0x5694 (DG2)
[12:44:23] [PASSED] 0x5695 (DG2)
[12:44:23] [PASSED] 0x56A3 (DG2)
[12:44:23] [PASSED] 0x56A4 (DG2)
[12:44:23] [PASSED] 0x56B2 (DG2)
[12:44:23] [PASSED] 0x56B3 (DG2)
[12:44:23] [PASSED] 0x5696 (DG2)
[12:44:23] [PASSED] 0x5697 (DG2)
[12:44:23] [PASSED] 0xB69 (PVC)
[12:44:23] [PASSED] 0xB6E (PVC)
[12:44:23] [PASSED] 0xBD4 (PVC)
[12:44:23] [PASSED] 0xBD5 (PVC)
[12:44:23] [PASSED] 0xBD6 (PVC)
[12:44:23] [PASSED] 0xBD7 (PVC)
[12:44:23] [PASSED] 0xBD8 (PVC)
[12:44:23] [PASSED] 0xBD9 (PVC)
[12:44:23] [PASSED] 0xBDA (PVC)
[12:44:23] [PASSED] 0xBDB (PVC)
[12:44:23] [PASSED] 0xBE0 (PVC)
[12:44:23] [PASSED] 0xBE1 (PVC)
[12:44:23] [PASSED] 0xBE5 (PVC)
[12:44:23] [PASSED] 0x7D40 (METEORLAKE)
[12:44:23] [PASSED] 0x7D45 (METEORLAKE)
[12:44:23] [PASSED] 0x7D55 (METEORLAKE)
[12:44:23] [PASSED] 0x7D60 (METEORLAKE)
[12:44:23] [PASSED] 0x7DD5 (METEORLAKE)
[12:44:23] [PASSED] 0x6420 (LUNARLAKE)
[12:44:23] [PASSED] 0x64A0 (LUNARLAKE)
[12:44:23] [PASSED] 0x64B0 (LUNARLAKE)
[12:44:23] [PASSED] 0xE202 (BATTLEMAGE)
[12:44:23] [PASSED] 0xE209 (BATTLEMAGE)
[12:44:23] [PASSED] 0xE20B (BATTLEMAGE)
[12:44:23] [PASSED] 0xE20C (BATTLEMAGE)
[12:44:23] [PASSED] 0xE20D (BATTLEMAGE)
[12:44:23] [PASSED] 0xE210 (BATTLEMAGE)
[12:44:23] [PASSED] 0xE211 (BATTLEMAGE)
[12:44:23] [PASSED] 0xE212 (BATTLEMAGE)
[12:44:23] [PASSED] 0xE216 (BATTLEMAGE)
[12:44:23] [PASSED] 0xE220 (BATTLEMAGE)
[12:44:23] [PASSED] 0xE221 (BATTLEMAGE)
[12:44:23] [PASSED] 0xE222 (BATTLEMAGE)
[12:44:23] [PASSED] 0xE223 (BATTLEMAGE)
[12:44:23] [PASSED] 0xB080 (PANTHERLAKE)
[12:44:23] [PASSED] 0xB081 (PANTHERLAKE)
[12:44:23] [PASSED] 0xB082 (PANTHERLAKE)
[12:44:23] [PASSED] 0xB083 (PANTHERLAKE)
[12:44:23] [PASSED] 0xB084 (PANTHERLAKE)
[12:44:23] [PASSED] 0xB085 (PANTHERLAKE)
[12:44:23] [PASSED] 0xB086 (PANTHERLAKE)
[12:44:23] [PASSED] 0xB087 (PANTHERLAKE)
[12:44:23] [PASSED] 0xB08F (PANTHERLAKE)
[12:44:23] [PASSED] 0xB090 (PANTHERLAKE)
[12:44:23] [PASSED] 0xB0A0 (PANTHERLAKE)
[12:44:23] [PASSED] 0xB0B0 (PANTHERLAKE)
[12:44:23] [PASSED] 0xFD80 (PANTHERLAKE)
[12:44:23] [PASSED] 0xFD81 (PANTHERLAKE)
[12:44:23] [PASSED] 0xD740 (NOVALAKE_S)
[12:44:23] [PASSED] 0xD741 (NOVALAKE_S)
[12:44:23] [PASSED] 0xD742 (NOVALAKE_S)
[12:44:23] [PASSED] 0xD743 (NOVALAKE_S)
[12:44:23] [PASSED] 0xD744 (NOVALAKE_S)
[12:44:23] [PASSED] 0xD745 (NOVALAKE_S)
[12:44:23] [PASSED] 0x674C (CRESCENTISLAND)
[12:44:23] =============== [PASSED] check_platform_desc ===============
[12:44:23] ===================== [PASSED] xe_pci ======================
[12:44:23] =================== xe_rtp (2 subtests) ====================
[12:44:23] =============== xe_rtp_process_to_sr_tests  ================
[12:44:23] [PASSED] coalesce-same-reg
[12:44:23] [PASSED] no-match-no-add
[12:44:23] [PASSED] match-or
[12:44:23] [PASSED] match-or-xfail
[12:44:23] [PASSED] no-match-no-add-multiple-rules
[12:44:23] [PASSED] two-regs-two-entries
[12:44:23] [PASSED] clr-one-set-other
[12:44:23] [PASSED] set-field
[12:44:23] [PASSED] conflict-duplicate
[12:44:23] [PASSED] conflict-not-disjoint
[12:44:23] [PASSED] conflict-reg-type
[12:44:23] =========== [PASSED] xe_rtp_process_to_sr_tests ============
[12:44:23] ================== xe_rtp_process_tests  ===================
[12:44:23] [PASSED] active1
[12:44:23] [PASSED] active2
[12:44:23] [PASSED] active-inactive
[12:44:23] [PASSED] inactive-active
[12:44:23] [PASSED] inactive-1st_or_active-inactive
[12:44:23] [PASSED] inactive-2nd_or_active-inactive
[12:44:23] [PASSED] inactive-last_or_active-inactive
[12:44:23] [PASSED] inactive-no_or_active-inactive
[12:44:23] ============== [PASSED] xe_rtp_process_tests ===============
[12:44:23] ===================== [PASSED] xe_rtp ======================
[12:44:23] ==================== xe_wa (1 subtest) =====================
[12:44:23] ======================== xe_wa_gt  =========================
[12:44:23] [PASSED] TIGERLAKE B0
[12:44:23] [PASSED] DG1 A0
[12:44:23] [PASSED] DG1 B0
[12:44:23] [PASSED] ALDERLAKE_S A0
[12:44:23] [PASSED] ALDERLAKE_S B0
[12:44:23] [PASSED] ALDERLAKE_S C0
[12:44:23] [PASSED] ALDERLAKE_S D0
[12:44:23] [PASSED] ALDERLAKE_P A0
[12:44:23] [PASSED] ALDERLAKE_P B0
[12:44:23] [PASSED] ALDERLAKE_P C0
[12:44:23] [PASSED] ALDERLAKE_S RPLS D0
[12:44:23] [PASSED] ALDERLAKE_P RPLU E0
[12:44:23] [PASSED] DG2 G10 C0
[12:44:23] [PASSED] DG2 G11 B1
[12:44:23] [PASSED] DG2 G12 A1
[12:44:23] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
[12:44:23] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
[12:44:23] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
[12:44:23] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
[12:44:23] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
[12:44:23] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
[12:44:23] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
[12:44:23] ==================== [PASSED] xe_wa_gt =====================
[12:44:23] ====================== [PASSED] xe_wa ======================
[12:44:23] ============================================================
[12:44:23] Testing complete. Ran 512 tests: passed: 494, skipped: 18
[12:44:23] Elapsed time: 36.319s total, 4.179s configuring, 31.622s building, 0.469s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[12:44:23] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:44:25] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[12:44:50] Starting KUnit Kernel (1/1)...
[12:44:50] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[12:44:50] ============ drm_test_pick_cmdline (2 subtests) ============
[12:44:50] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[12:44:50] =============== drm_test_pick_cmdline_named  ===============
[12:44:50] [PASSED] NTSC
[12:44:50] [PASSED] NTSC-J
[12:44:50] [PASSED] PAL
[12:44:50] [PASSED] PAL-M
[12:44:50] =========== [PASSED] drm_test_pick_cmdline_named ===========
[12:44:50] ============== [PASSED] drm_test_pick_cmdline ==============
[12:44:50] == drm_test_atomic_get_connector_for_encoder (1 subtest) ===
[12:44:50] [PASSED] drm_test_drm_atomic_get_connector_for_encoder
[12:44:50] ==== [PASSED] drm_test_atomic_get_connector_for_encoder ====
[12:44:50] =========== drm_validate_clone_mode (2 subtests) ===========
[12:44:50] ============== drm_test_check_in_clone_mode  ===============
[12:44:50] [PASSED] in_clone_mode
[12:44:50] [PASSED] not_in_clone_mode
[12:44:50] ========== [PASSED] drm_test_check_in_clone_mode ===========
[12:44:50] =============== drm_test_check_valid_clones  ===============
[12:44:50] [PASSED] not_in_clone_mode
[12:44:50] [PASSED] valid_clone
[12:44:50] [PASSED] invalid_clone
[12:44:50] =========== [PASSED] drm_test_check_valid_clones ===========
[12:44:50] ============= [PASSED] drm_validate_clone_mode =============
[12:44:50] ============= drm_validate_modeset (1 subtest) =============
[12:44:50] [PASSED] drm_test_check_connector_changed_modeset
[12:44:50] ============== [PASSED] drm_validate_modeset ===============
[12:44:50] ====== drm_test_bridge_get_current_state (2 subtests) ======
[12:44:50] [PASSED] drm_test_drm_bridge_get_current_state_atomic
[12:44:50] [PASSED] drm_test_drm_bridge_get_current_state_legacy
[12:44:50] ======== [PASSED] drm_test_bridge_get_current_state ========
[12:44:50] ====== drm_test_bridge_helper_reset_crtc (3 subtests) ======
[12:44:50] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic
[12:44:50] [PASSED] drm_test_drm_bridge_helper_reset_crtc_atomic_disabled
[12:44:50] [PASSED] drm_test_drm_bridge_helper_reset_crtc_legacy
[12:44:50] ======== [PASSED] drm_test_bridge_helper_reset_crtc ========
[12:44:50] ============== drm_bridge_alloc (2 subtests) ===============
[12:44:50] [PASSED] drm_test_drm_bridge_alloc_basic
[12:44:50] [PASSED] drm_test_drm_bridge_alloc_get_put
[12:44:50] ================ [PASSED] drm_bridge_alloc =================
[12:44:50] ================== drm_buddy (9 subtests) ==================
[12:44:50] [PASSED] drm_test_buddy_alloc_limit
[12:44:50] [PASSED] drm_test_buddy_alloc_optimistic
[12:44:50] [PASSED] drm_test_buddy_alloc_pessimistic
[12:44:50] [PASSED] drm_test_buddy_alloc_pathological
[12:44:50] [PASSED] drm_test_buddy_alloc_contiguous
[12:44:50] [PASSED] drm_test_buddy_alloc_clear
[12:44:50] [PASSED] drm_test_buddy_alloc_range_bias
[12:44:50] [PASSED] drm_test_buddy_fragmentation_performance
[12:44:50] [PASSED] drm_test_buddy_alloc_exceeds_max_order
[12:44:50] ==================== [PASSED] drm_buddy ====================
[12:44:50] ============= drm_cmdline_parser (40 subtests) =============
[12:44:50] [PASSED] drm_test_cmdline_force_d_only
[12:44:50] [PASSED] drm_test_cmdline_force_D_only_dvi
[12:44:50] [PASSED] drm_test_cmdline_force_D_only_hdmi
[12:44:50] [PASSED] drm_test_cmdline_force_D_only_not_digital
[12:44:50] [PASSED] drm_test_cmdline_force_e_only
[12:44:50] [PASSED] drm_test_cmdline_res
[12:44:50] [PASSED] drm_test_cmdline_res_vesa
[12:44:50] [PASSED] drm_test_cmdline_res_vesa_rblank
[12:44:50] [PASSED] drm_test_cmdline_res_rblank
[12:44:50] [PASSED] drm_test_cmdline_res_bpp
[12:44:50] [PASSED] drm_test_cmdline_res_refresh
[12:44:50] [PASSED] drm_test_cmdline_res_bpp_refresh
[12:44:50] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[12:44:50] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[12:44:50] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[12:44:50] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[12:44:50] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[12:44:50] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[12:44:50] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[12:44:50] [PASSED] drm_test_cmdline_res_margins_force_on
[12:44:50] [PASSED] drm_test_cmdline_res_vesa_margins
[12:44:50] [PASSED] drm_test_cmdline_name
[12:44:50] [PASSED] drm_test_cmdline_name_bpp
[12:44:50] [PASSED] drm_test_cmdline_name_option
[12:44:50] [PASSED] drm_test_cmdline_name_bpp_option
[12:44:50] [PASSED] drm_test_cmdline_rotate_0
[12:44:50] [PASSED] drm_test_cmdline_rotate_90
[12:44:50] [PASSED] drm_test_cmdline_rotate_180
[12:44:50] [PASSED] drm_test_cmdline_rotate_270
[12:44:50] [PASSED] drm_test_cmdline_hmirror
[12:44:50] [PASSED] drm_test_cmdline_vmirror
[12:44:50] [PASSED] drm_test_cmdline_margin_options
[12:44:50] [PASSED] drm_test_cmdline_multiple_options
[12:44:50] [PASSED] drm_test_cmdline_bpp_extra_and_option
[12:44:50] [PASSED] drm_test_cmdline_extra_and_option
[12:44:50] [PASSED] drm_test_cmdline_freestanding_options
[12:44:50] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[12:44:50] [PASSED] drm_test_cmdline_panel_orientation
[12:44:50] ================ drm_test_cmdline_invalid  =================
[12:44:50] [PASSED] margin_only
[12:44:50] [PASSED] interlace_only
[12:44:50] [PASSED] res_missing_x
[12:44:50] [PASSED] res_missing_y
[12:44:50] [PASSED] res_bad_y
[12:44:50] [PASSED] res_missing_y_bpp
[12:44:50] [PASSED] res_bad_bpp
[12:44:50] [PASSED] res_bad_refresh
[12:44:50] [PASSED] res_bpp_refresh_force_on_off
[12:44:50] [PASSED] res_invalid_mode
[12:44:50] [PASSED] res_bpp_wrong_place_mode
[12:44:50] [PASSED] name_bpp_refresh
[12:44:50] [PASSED] name_refresh
[12:44:50] [PASSED] name_refresh_wrong_mode
[12:44:50] [PASSED] name_refresh_invalid_mode
[12:44:50] [PASSED] rotate_multiple
[12:44:50] [PASSED] rotate_invalid_val
[12:44:50] [PASSED] rotate_truncated
[12:44:50] [PASSED] invalid_option
[12:44:50] [PASSED] invalid_tv_option
[12:44:50] [PASSED] truncated_tv_option
[12:44:50] ============ [PASSED] drm_test_cmdline_invalid =============
[12:44:50] =============== drm_test_cmdline_tv_options  ===============
[12:44:50] [PASSED] NTSC
[12:44:50] [PASSED] NTSC_443
[12:44:50] [PASSED] NTSC_J
[12:44:50] [PASSED] PAL
[12:44:50] [PASSED] PAL_M
[12:44:50] [PASSED] PAL_N
[12:44:50] [PASSED] SECAM
[12:44:50] [PASSED] MONO_525
[12:44:50] [PASSED] MONO_625
[12:44:50] =========== [PASSED] drm_test_cmdline_tv_options ===========
[12:44:50] =============== [PASSED] drm_cmdline_parser ================
[12:44:50] ========== drmm_connector_hdmi_init (20 subtests) ==========
[12:44:50] [PASSED] drm_test_connector_hdmi_init_valid
[12:44:50] [PASSED] drm_test_connector_hdmi_init_bpc_8
[12:44:50] [PASSED] drm_test_connector_hdmi_init_bpc_10
[12:44:50] [PASSED] drm_test_connector_hdmi_init_bpc_12
[12:44:50] [PASSED] drm_test_connector_hdmi_init_bpc_invalid
[12:44:50] [PASSED] drm_test_connector_hdmi_init_bpc_null
[12:44:50] [PASSED] drm_test_connector_hdmi_init_formats_empty
[12:44:50] [PASSED] drm_test_connector_hdmi_init_formats_no_rgb
[12:44:50] === drm_test_connector_hdmi_init_formats_yuv420_allowed  ===
[12:44:50] [PASSED] supported_formats=0x9 yuv420_allowed=1
[12:44:50] [PASSED] supported_formats=0x9 yuv420_allowed=0
[12:44:50] [PASSED] supported_formats=0x3 yuv420_allowed=1
[12:44:50] [PASSED] supported_formats=0x3 yuv420_allowed=0
[12:44:50] === [PASSED] drm_test_connector_hdmi_init_formats_yuv420_allowed ===
[12:44:50] [PASSED] drm_test_connector_hdmi_init_null_ddc
[12:44:50] [PASSED] drm_test_connector_hdmi_init_null_product
[12:44:50] [PASSED] drm_test_connector_hdmi_init_null_vendor
[12:44:50] [PASSED] drm_test_connector_hdmi_init_product_length_exact
[12:44:50] [PASSED] drm_test_connector_hdmi_init_product_length_too_long
[12:44:50] [PASSED] drm_test_connector_hdmi_init_product_valid
[12:44:50] [PASSED] drm_test_connector_hdmi_init_vendor_length_exact
[12:44:50] [PASSED] drm_test_connector_hdmi_init_vendor_length_too_long
[12:44:50] [PASSED] drm_test_connector_hdmi_init_vendor_valid
[12:44:50] ========= drm_test_connector_hdmi_init_type_valid  =========
[12:44:50] [PASSED] HDMI-A
[12:44:50] [PASSED] HDMI-B
[12:44:50] ===== [PASSED] drm_test_connector_hdmi_init_type_valid =====
[12:44:50] ======== drm_test_connector_hdmi_init_type_invalid  ========
[12:44:50] [PASSED] Unknown
[12:44:50] [PASSED] VGA
[12:44:50] [PASSED] DVI-I
[12:44:50] [PASSED] DVI-D
[12:44:50] [PASSED] DVI-A
[12:44:50] [PASSED] Composite
[12:44:50] [PASSED] SVIDEO
[12:44:50] [PASSED] LVDS
[12:44:50] [PASSED] Component
[12:44:50] [PASSED] DIN
[12:44:50] [PASSED] DP
[12:44:50] [PASSED] TV
[12:44:50] [PASSED] eDP
[12:44:50] [PASSED] Virtual
[12:44:50] [PASSED] DSI
[12:44:50] [PASSED] DPI
[12:44:50] [PASSED] Writeback
[12:44:50] [PASSED] SPI
[12:44:50] [PASSED] USB
[12:44:50] ==== [PASSED] drm_test_connector_hdmi_init_type_invalid ====
[12:44:50] ============ [PASSED] drmm_connector_hdmi_init =============
[12:44:50] ============= drmm_connector_init (3 subtests) =============
[12:44:50] [PASSED] drm_test_drmm_connector_init
[12:44:50] [PASSED] drm_test_drmm_connector_init_null_ddc
[12:44:50] ========= drm_test_drmm_connector_init_type_valid  =========
[12:44:50] [PASSED] Unknown
[12:44:50] [PASSED] VGA
[12:44:50] [PASSED] DVI-I
[12:44:50] [PASSED] DVI-D
[12:44:50] [PASSED] DVI-A
[12:44:50] [PASSED] Composite
[12:44:50] [PASSED] SVIDEO
[12:44:50] [PASSED] LVDS
[12:44:50] [PASSED] Component
[12:44:50] [PASSED] DIN
[12:44:50] [PASSED] DP
[12:44:50] [PASSED] HDMI-A
[12:44:50] [PASSED] HDMI-B
[12:44:50] [PASSED] TV
[12:44:50] [PASSED] eDP
[12:44:50] [PASSED] Virtual
[12:44:50] [PASSED] DSI
[12:44:50] [PASSED] DPI
[12:44:50] [PASSED] Writeback
[12:44:50] [PASSED] SPI
[12:44:50] [PASSED] USB
[12:44:50] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[12:44:50] =============== [PASSED] drmm_connector_init ===============
[12:44:50] ========= drm_connector_dynamic_init (6 subtests) ==========
[12:44:50] [PASSED] drm_test_drm_connector_dynamic_init
[12:44:50] [PASSED] drm_test_drm_connector_dynamic_init_null_ddc
[12:44:50] [PASSED] drm_test_drm_connector_dynamic_init_not_added
[12:44:50] [PASSED] drm_test_drm_connector_dynamic_init_properties
[12:44:50] ===== drm_test_drm_connector_dynamic_init_type_valid  ======
[12:44:50] [PASSED] Unknown
[12:44:50] [PASSED] VGA
[12:44:50] [PASSED] DVI-I
[12:44:50] [PASSED] DVI-D
[12:44:50] [PASSED] DVI-A
[12:44:50] [PASSED] Composite
[12:44:50] [PASSED] SVIDEO
[12:44:50] [PASSED] LVDS
[12:44:50] [PASSED] Component
[12:44:50] [PASSED] DIN
[12:44:50] [PASSED] DP
[12:44:50] [PASSED] HDMI-A
[12:44:50] [PASSED] HDMI-B
[12:44:50] [PASSED] TV
[12:44:50] [PASSED] eDP
[12:44:50] [PASSED] Virtual
[12:44:50] [PASSED] DSI
[12:44:50] [PASSED] DPI
[12:44:50] [PASSED] Writeback
[12:44:50] [PASSED] SPI
[12:44:50] [PASSED] USB
[12:44:50] = [PASSED] drm_test_drm_connector_dynamic_init_type_valid ==
[12:44:50] ======== drm_test_drm_connector_dynamic_init_name  =========
[12:44:50] [PASSED] Unknown
[12:44:50] [PASSED] VGA
[12:44:50] [PASSED] DVI-I
[12:44:50] [PASSED] DVI-D
[12:44:50] [PASSED] DVI-A
[12:44:50] [PASSED] Composite
[12:44:50] [PASSED] SVIDEO
[12:44:50] [PASSED] LVDS
[12:44:50] [PASSED] Component
[12:44:50] [PASSED] DIN
[12:44:50] [PASSED] DP
[12:44:50] [PASSED] HDMI-A
[12:44:50] [PASSED] HDMI-B
[12:44:50] [PASSED] TV
[12:44:50] [PASSED] eDP
[12:44:50] [PASSED] Virtual
[12:44:50] [PASSED] DSI
[12:44:50] [PASSED] DPI
[12:44:50] [PASSED] Writeback
[12:44:50] [PASSED] SPI
[12:44:50] [PASSED] USB
[12:44:50] ==== [PASSED] drm_test_drm_connector_dynamic_init_name =====
[12:44:50] =========== [PASSED] drm_connector_dynamic_init ============
[12:44:50] ==== drm_connector_dynamic_register_early (4 subtests) =====
[12:44:50] [PASSED] drm_test_drm_connector_dynamic_register_early_on_list
[12:44:50] [PASSED] drm_test_drm_connector_dynamic_register_early_defer
[12:44:50] [PASSED] drm_test_drm_connector_dynamic_register_early_no_init
[12:44:50] [PASSED] drm_test_drm_connector_dynamic_register_early_no_mode_object
[12:44:50] ====== [PASSED] drm_connector_dynamic_register_early =======
[12:44:50] ======= drm_connector_dynamic_register (7 subtests) ========
[12:44:50] [PASSED] drm_test_drm_connector_dynamic_register_on_list
[12:44:50] [PASSED] drm_test_drm_connector_dynamic_register_no_defer
[12:44:50] [PASSED] drm_test_drm_connector_dynamic_register_no_init
[12:44:50] [PASSED] drm_test_drm_connector_dynamic_register_mode_object
[12:44:50] [PASSED] drm_test_drm_connector_dynamic_register_sysfs
[12:44:50] [PASSED] drm_test_drm_connector_dynamic_register_sysfs_name
[12:44:50] [PASSED] drm_test_drm_connector_dynamic_register_debugfs
[12:44:50] ========= [PASSED] drm_connector_dynamic_register ==========
[12:44:50] = drm_connector_attach_broadcast_rgb_property (2 subtests) =
[12:44:50] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property
[12:44:50] [PASSED] drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector
[12:44:50] === [PASSED] drm_connector_attach_broadcast_rgb_property ===
[12:44:50] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[12:44:50] ========== drm_test_get_tv_mode_from_name_valid  ===========
[12:44:50] [PASSED] NTSC
[12:44:50] [PASSED] NTSC-443
[12:44:50] [PASSED] NTSC-J
[12:44:50] [PASSED] PAL
[12:44:50] [PASSED] PAL-M
[12:44:50] [PASSED] PAL-N
[12:44:50] [PASSED] SECAM
[12:44:50] [PASSED] Mono
[12:44:50] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[12:44:50] [PASSED] drm_test_get_tv_mode_from_name_truncated
[12:44:50] ============ [PASSED] drm_get_tv_mode_from_name ============
[12:44:50] = drm_test_connector_hdmi_compute_mode_clock (12 subtests) =
[12:44:50] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb
[12:44:50] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc
[12:44:50] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1
[12:44:50] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc
[12:44:50] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1
[12:44:50] [PASSED] drm_test_drm_hdmi_compute_mode_clock_rgb_double
[12:44:50] = drm_test_connector_hdmi_compute_mode_clock_yuv420_valid  =
[12:44:50] [PASSED] VIC 96
[12:44:50] [PASSED] VIC 97
[12:44:50] [PASSED] VIC 101
[12:44:50] [PASSED] VIC 102
[12:44:50] [PASSED] VIC 106
[12:44:50] [PASSED] VIC 107
[12:44:50] === [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_valid ===
[12:44:50] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc
[12:44:50] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc
[12:44:50] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc
[12:44:50] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc
[12:44:50] [PASSED] drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc
[12:44:50] === [PASSED] drm_test_connector_hdmi_compute_mode_clock ====
[12:44:50] == drm_hdmi_connector_get_broadcast_rgb_name (2 subtests) ==
[12:44:50] === drm_test_drm_hdmi_connector_get_broadcast_rgb_name  ====
[12:44:50] [PASSED] Automatic
[12:44:50] [PASSED] Full
[12:44:50] [PASSED] Limited 16:235
[12:44:50] === [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name ===
[12:44:50] [PASSED] drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid
[12:44:50] ==== [PASSED] drm_hdmi_connector_get_broadcast_rgb_name ====
[12:44:50] == drm_hdmi_connector_get_output_format_name (2 subtests) ==
[12:44:50] === drm_test_drm_hdmi_connector_get_output_format_name  ====
[12:44:50] [PASSED] RGB
[12:44:50] [PASSED] YUV 4:2:0
[12:44:50] [PASSED] YUV 4:2:2
[12:44:50] [PASSED] YUV 4:4:4
[12:44:50] === [PASSED] drm_test_drm_hdmi_connector_get_output_format_name ===
[12:44:50] [PASSED] drm_test_drm_hdmi_connector_get_output_format_name_invalid
[12:44:50] ==== [PASSED] drm_hdmi_connector_get_output_format_name ====
[12:44:50] ============= drm_damage_helper (21 subtests) ==============
[12:44:50] [PASSED] drm_test_damage_iter_no_damage
[12:44:50] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[12:44:50] [PASSED] drm_test_damage_iter_no_damage_src_moved
[12:44:50] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[12:44:50] [PASSED] drm_test_damage_iter_no_damage_not_visible
[12:44:50] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[12:44:50] [PASSED] drm_test_damage_iter_no_damage_no_fb
[12:44:50] [PASSED] drm_test_damage_iter_simple_damage
[12:44:50] [PASSED] drm_test_damage_iter_single_damage
[12:44:50] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[12:44:50] [PASSED] drm_test_damage_iter_single_damage_outside_src
[12:44:50] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[12:44:50] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[12:44:50] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[12:44:50] [PASSED] drm_test_damage_iter_single_damage_src_moved
[12:44:50] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[12:44:50] [PASSED] drm_test_damage_iter_damage
[12:44:50] [PASSED] drm_test_damage_iter_damage_one_intersect
[12:44:50] [PASSED] drm_test_damage_iter_damage_one_outside
[12:44:50] [PASSED] drm_test_damage_iter_damage_src_moved
[12:44:50] [PASSED] drm_test_damage_iter_damage_not_visible
[12:44:50] ================ [PASSED] drm_damage_helper ================
[12:44:50] ============== drm_dp_mst_helper (3 subtests) ==============
[12:44:50] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[12:44:50] [PASSED] Clock 154000 BPP 30 DSC disabled
[12:44:50] [PASSED] Clock 234000 BPP 30 DSC disabled
[12:44:50] [PASSED] Clock 297000 BPP 24 DSC disabled
[12:44:50] [PASSED] Clock 332880 BPP 24 DSC enabled
[12:44:50] [PASSED] Clock 324540 BPP 24 DSC enabled
[12:44:50] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[12:44:50] ============== drm_test_dp_mst_calc_pbn_div  ===============
[12:44:50] [PASSED] Link rate 2000000 lane count 4
[12:44:50] [PASSED] Link rate 2000000 lane count 2
[12:44:50] [PASSED] Link rate 2000000 lane count 1
[12:44:50] [PASSED] Link rate 1350000 lane count 4
[12:44:50] [PASSED] Link rate 1350000 lane count 2
[12:44:50] [PASSED] Link rate 1350000 lane count 1
[12:44:50] [PASSED] Link rate 1000000 lane count 4
[12:44:50] [PASSED] Link rate 1000000 lane count 2
[12:44:50] [PASSED] Link rate 1000000 lane count 1
[12:44:50] [PASSED] Link rate 810000 lane count 4
[12:44:50] [PASSED] Link rate 810000 lane count 2
[12:44:50] [PASSED] Link rate 810000 lane count 1
[12:44:50] [PASSED] Link rate 540000 lane count 4
[12:44:50] [PASSED] Link rate 540000 lane count 2
[12:44:50] [PASSED] Link rate 540000 lane count 1
[12:44:50] [PASSED] Link rate 270000 lane count 4
[12:44:50] [PASSED] Link rate 270000 lane count 2
[12:44:50] [PASSED] Link rate 270000 lane count 1
[12:44:50] [PASSED] Link rate 162000 lane count 4
[12:44:50] [PASSED] Link rate 162000 lane count 2
[12:44:50] [PASSED] Link rate 162000 lane count 1
[12:44:50] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[12:44:50] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[12:44:50] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[12:44:50] [PASSED] DP_POWER_UP_PHY with port number
[12:44:50] [PASSED] DP_POWER_DOWN_PHY with port number
[12:44:50] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[12:44:50] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[12:44:50] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[12:44:50] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[12:44:50] [PASSED] DP_QUERY_PAYLOAD with port number
[12:44:50] [PASSED] DP_QUERY_PAYLOAD with VCPI
[12:44:50] [PASSED] DP_REMOTE_DPCD_READ with port number
[12:44:50] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[12:44:50] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[12:44:50] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[12:44:50] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[12:44:50] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[12:44:50] [PASSED] DP_REMOTE_I2C_READ with port number
[12:44:50] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[12:44:50] [PASSED] DP_REMOTE_I2C_READ with transactions array
[12:44:50] [PASSED] DP_REMOTE_I2C_WRITE with port number
[12:44:50] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[12:44:50] [PASSED] DP_REMOTE_I2C_WRITE with data array
[12:44:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[12:44:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[12:44:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[12:44:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[12:44:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[12:44:50] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[12:44:50] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[12:44:50] ================ [PASSED] drm_dp_mst_helper ================
[12:44:50] ================== drm_exec (7 subtests) ===================
[12:44:50] [PASSED] sanitycheck
[12:44:50] [PASSED] test_lock
[12:44:50] [PASSED] test_lock_unlock
[12:44:50] [PASSED] test_duplicates
[12:44:50] [PASSED] test_prepare
[12:44:50] [PASSED] test_prepare_array
[12:44:50] [PASSED] test_multiple_loops
[12:44:50] ==================== [PASSED] drm_exec =====================
[12:44:50] =========== drm_format_helper_test (17 subtests) ===========
[12:44:50] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[12:44:50] [PASSED] single_pixel_source_buffer
[12:44:50] [PASSED] single_pixel_clip_rectangle
[12:44:50] [PASSED] well_known_colors
[12:44:50] [PASSED] destination_pitch
[12:44:50] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[12:44:50] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[12:44:50] [PASSED] single_pixel_source_buffer
[12:44:50] [PASSED] single_pixel_clip_rectangle
[12:44:50] [PASSED] well_known_colors
[12:44:50] [PASSED] destination_pitch
[12:44:50] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[12:44:50] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[12:44:50] [PASSED] single_pixel_source_buffer
[12:44:50] [PASSED] single_pixel_clip_rectangle
[12:44:50] [PASSED] well_known_colors
[12:44:50] [PASSED] destination_pitch
[12:44:50] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[12:44:50] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[12:44:50] [PASSED] single_pixel_source_buffer
[12:44:50] [PASSED] single_pixel_clip_rectangle
[12:44:50] [PASSED] well_known_colors
[12:44:50] [PASSED] destination_pitch
[12:44:50] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[12:44:50] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[12:44:50] [PASSED] single_pixel_source_buffer
[12:44:50] [PASSED] single_pixel_clip_rectangle
[12:44:50] [PASSED] well_known_colors
[12:44:50] [PASSED] destination_pitch
[12:44:50] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[12:44:50] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[12:44:50] [PASSED] single_pixel_source_buffer
[12:44:50] [PASSED] single_pixel_clip_rectangle
[12:44:50] [PASSED] well_known_colors
[12:44:50] [PASSED] destination_pitch
[12:44:50] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[12:44:50] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[12:44:50] [PASSED] single_pixel_source_buffer
[12:44:50] [PASSED] single_pixel_clip_rectangle
[12:44:50] [PASSED] well_known_colors
[12:44:50] [PASSED] destination_pitch
[12:44:50] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[12:44:50] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
[12:44:50] [PASSED] single_pixel_source_buffer
[12:44:50] [PASSED] single_pixel_clip_rectangle
[12:44:50] [PASSED] well_known_colors
[12:44:50] [PASSED] destination_pitch
[12:44:50] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
[12:44:50] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[12:44:50] [PASSED] single_pixel_source_buffer
[12:44:50] [PASSED] single_pixel_clip_rectangle
[12:44:50] [PASSED] well_known_colors
[12:44:50] [PASSED] destination_pitch
[12:44:50] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[12:44:50] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[12:44:50] [PASSED] single_pixel_source_buffer
[12:44:50] [PASSED] single_pixel_clip_rectangle
[12:44:50] [PASSED] well_known_colors
[12:44:50] [PASSED] destination_pitch
[12:44:50] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[12:44:50] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[12:44:50] [PASSED] single_pixel_source_buffer
[12:44:50] [PASSED] single_pixel_clip_rectangle
[12:44:50] [PASSED] well_known_colors
[12:44:50] [PASSED] destination_pitch
[12:44:50] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[12:44:50] ============== drm_test_fb_xrgb8888_to_mono  ===============
[12:44:50] [PASSED] single_pixel_source_buffer
[12:44:50] [PASSED] single_pixel_clip_rectangle
[12:44:50] [PASSED] well_known_colors
[12:44:50] [PASSED] destination_pitch
[12:44:50] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[12:44:50] ==================== drm_test_fb_swab  =====================
[12:44:50] [PASSED] single_pixel_source_buffer
[12:44:50] [PASSED] single_pixel_clip_rectangle
[12:44:50] [PASSED] well_known_colors
[12:44:50] [PASSED] destination_pitch
[12:44:50] ================ [PASSED] drm_test_fb_swab =================
[12:44:50] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[12:44:50] [PASSED] single_pixel_source_buffer
[12:44:50] [PASSED] single_pixel_clip_rectangle
[12:44:50] [PASSED] well_known_colors
[12:44:50] [PASSED] destination_pitch
[12:44:50] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[12:44:50] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[12:44:50] [PASSED] single_pixel_source_buffer
[12:44:50] [PASSED] single_pixel_clip_rectangle
[12:44:50] [PASSED] well_known_colors
[12:44:50] [PASSED] destination_pitch
[12:44:50] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[12:44:50] ================= drm_test_fb_clip_offset  =================
[12:44:50] [PASSED] pass through
[12:44:50] [PASSED] horizontal offset
[12:44:50] [PASSED] vertical offset
[12:44:50] [PASSED] horizontal and vertical offset
[12:44:50] [PASSED] horizontal offset (custom pitch)
[12:44:50] [PASSED] vertical offset (custom pitch)
[12:44:50] [PASSED] horizontal and vertical offset (custom pitch)
[12:44:50] ============= [PASSED] drm_test_fb_clip_offset =============
[12:44:50] =================== drm_test_fb_memcpy  ====================
[12:44:50] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[12:44:50] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[12:44:50] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[12:44:50] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[12:44:50] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[12:44:50] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[12:44:50] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[12:44:50] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[12:44:50] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[12:44:50] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[12:44:50] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[12:44:50] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[12:44:50] =============== [PASSED] drm_test_fb_memcpy ================
[12:44:50] ============= [PASSED] drm_format_helper_test ==============
[12:44:50] ================= drm_format (18 subtests) =================
[12:44:50] [PASSED] drm_test_format_block_width_invalid
[12:44:50] [PASSED] drm_test_format_block_width_one_plane
[12:44:50] [PASSED] drm_test_format_block_width_two_plane
[12:44:50] [PASSED] drm_test_format_block_width_three_plane
[12:44:50] [PASSED] drm_test_format_block_width_tiled
[12:44:50] [PASSED] drm_test_format_block_height_invalid
[12:44:50] [PASSED] drm_test_format_block_height_one_plane
[12:44:50] [PASSED] drm_test_format_block_height_two_plane
[12:44:50] [PASSED] drm_test_format_block_height_three_plane
[12:44:50] [PASSED] drm_test_format_block_height_tiled
[12:44:50] [PASSED] drm_test_format_min_pitch_invalid
[12:44:50] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[12:44:50] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[12:44:50] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[12:44:50] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[12:44:50] [PASSED] drm_test_format_min_pitch_two_plane
[12:44:50] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[12:44:50] [PASSED] drm_test_format_min_pitch_tiled
[12:44:50] =================== [PASSED] drm_format ====================
[12:44:50] ============== drm_framebuffer (10 subtests) ===============
[12:44:50] ========== drm_test_framebuffer_check_src_coords  ==========
[12:44:50] [PASSED] Success: source fits into fb
[12:44:50] [PASSED] Fail: overflowing fb with x-axis coordinate
[12:44:50] [PASSED] Fail: overflowing fb with y-axis coordinate
[12:44:50] [PASSED] Fail: overflowing fb with source width
[12:44:50] [PASSED] Fail: overflowing fb with source height
[12:44:50] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
[12:44:50] [PASSED] drm_test_framebuffer_cleanup
[12:44:50] =============== drm_test_framebuffer_create  ===============
[12:44:50] [PASSED] ABGR8888 normal sizes
[12:44:50] [PASSED] ABGR8888 max sizes
[12:44:50] [PASSED] ABGR8888 pitch greater than min required
[12:44:50] [PASSED] ABGR8888 pitch less than min required
[12:44:50] [PASSED] ABGR8888 Invalid width
[12:44:50] [PASSED] ABGR8888 Invalid buffer handle
[12:44:50] [PASSED] No pixel format
[12:44:50] [PASSED] ABGR8888 Width 0
[12:44:50] [PASSED] ABGR8888 Height 0
[12:44:50] [PASSED] ABGR8888 Out of bound height * pitch combination
[12:44:50] [PASSED] ABGR8888 Large buffer offset
[12:44:50] [PASSED] ABGR8888 Buffer offset for inexistent plane
[12:44:50] [PASSED] ABGR8888 Invalid flag
[12:44:50] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[12:44:50] [PASSED] ABGR8888 Valid buffer modifier
[12:44:50] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[12:44:50] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[12:44:50] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[12:44:50] [PASSED] NV12 Normal sizes
[12:44:50] [PASSED] NV12 Max sizes
[12:44:50] [PASSED] NV12 Invalid pitch
[12:44:50] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[12:44:50] [PASSED] NV12 different  modifier per-plane
[12:44:50] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[12:44:50] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[12:44:50] [PASSED] NV12 Modifier for inexistent plane
[12:44:50] [PASSED] NV12 Handle for inexistent plane
[12:44:50] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[12:44:50] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[12:44:50] [PASSED] YVU420 Normal sizes
[12:44:50] [PASSED] YVU420 Max sizes
[12:44:50] [PASSED] YVU420 Invalid pitch
[12:44:50] [PASSED] YVU420 Different pitches
[12:44:50] [PASSED] YVU420 Different buffer offsets/pitches
[12:44:50] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[12:44:50] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[12:44:50] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[12:44:50] [PASSED] YVU420 Valid modifier
[12:44:50] [PASSED] YVU420 Different modifiers per plane
[12:44:50] [PASSED] YVU420 Modifier for inexistent plane
[12:44:50] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[12:44:50] [PASSED] X0L2 Normal sizes
[12:44:50] [PASSED] X0L2 Max sizes
[12:44:50] [PASSED] X0L2 Invalid pitch
[12:44:50] [PASSED] X0L2 Pitch greater than minimum required
[12:44:50] [PASSED] X0L2 Handle for inexistent plane
[12:44:50] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[12:44:50] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[12:44:50] [PASSED] X0L2 Valid modifier
[12:44:50] [PASSED] X0L2 Modifier for inexistent plane
[12:44:50] =========== [PASSED] drm_test_framebuffer_create ===========
[12:44:50] [PASSED] drm_test_framebuffer_free
[12:44:50] [PASSED] drm_test_framebuffer_init
[12:44:50] [PASSED] drm_test_framebuffer_init_bad_format
[12:44:50] [PASSED] drm_test_framebuffer_init_dev_mismatch
[12:44:50] [PASSED] drm_test_framebuffer_lookup
[12:44:50] [PASSED] drm_test_framebuffer_lookup_inexistent
[12:44:50] [PASSED] drm_test_framebuffer_modifiers_not_supported
[12:44:50] ================= [PASSED] drm_framebuffer =================
[12:44:50] ================ drm_gem_shmem (8 subtests) ================
[12:44:50] [PASSED] drm_gem_shmem_test_obj_create
[12:44:50] [PASSED] drm_gem_shmem_test_obj_create_private
[12:44:50] [PASSED] drm_gem_shmem_test_pin_pages
[12:44:50] [PASSED] drm_gem_shmem_test_vmap
[12:44:50] [PASSED] drm_gem_shmem_test_get_sg_table
[12:44:50] [PASSED] drm_gem_shmem_test_get_pages_sgt
[12:44:50] [PASSED] drm_gem_shmem_test_madvise
[12:44:50] [PASSED] drm_gem_shmem_test_purge
[12:44:50] ================== [PASSED] drm_gem_shmem ==================
[12:44:50] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
[12:44:50] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
[12:44:50] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
[12:44:50] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
[12:44:50] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
[12:44:50] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
[12:44:50] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
[12:44:50] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
[12:44:50] [PASSED] Automatic
[12:44:50] [PASSED] Full
[12:44:50] [PASSED] Limited 16:235
[12:44:50] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
[12:44:50] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
[12:44:50] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
[12:44:50] [PASSED] drm_test_check_disable_connector
[12:44:50] [PASSED] drm_test_check_hdmi_funcs_reject_rate
[12:44:50] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
[12:44:50] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
[12:44:50] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
[12:44:50] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
[12:44:50] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
[12:44:50] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
[12:44:50] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
[12:44:50] [PASSED] drm_test_check_output_bpc_dvi
[12:44:50] [PASSED] drm_test_check_output_bpc_format_vic_1
[12:44:50] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
[12:44:50] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
[12:44:50] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
[12:44:50] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
[12:44:50] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
[12:44:50] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
[12:44:50] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
[12:44:50] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
[12:44:50] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
[12:44:50] [PASSED] drm_test_check_broadcast_rgb_value
[12:44:50] [PASSED] drm_test_check_bpc_8_value
[12:44:50] [PASSED] drm_test_check_bpc_10_value
[12:44:50] [PASSED] drm_test_check_bpc_12_value
[12:44:50] [PASSED] drm_test_check_format_value
[12:44:50] [PASSED] drm_test_check_tmds_char_value
[12:44:50] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
[12:44:50] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
[12:44:50] [PASSED] drm_test_check_mode_valid
[12:44:50] [PASSED] drm_test_check_mode_valid_reject
[12:44:50] [PASSED] drm_test_check_mode_valid_reject_rate
[12:44:50] [PASSED] drm_test_check_mode_valid_reject_max_clock
[12:44:50] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
[12:44:50] = drm_atomic_helper_connector_hdmi_infoframes (5 subtests) =
[12:44:50] [PASSED] drm_test_check_infoframes
[12:44:50] [PASSED] drm_test_check_reject_avi_infoframe
[12:44:50] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_8
[12:44:50] [PASSED] drm_test_check_reject_hdr_infoframe_bpc_10
[12:44:50] [PASSED] drm_test_check_reject_audio_infoframe
[12:44:50] === [PASSED] drm_atomic_helper_connector_hdmi_infoframes ===
[12:44:50] ================= drm_managed (2 subtests) =================
[12:44:50] [PASSED] drm_test_managed_release_action
[12:44:50] [PASSED] drm_test_managed_run_action
[12:44:50] =================== [PASSED] drm_managed ===================
[12:44:50] =================== drm_mm (6 subtests) ====================
[12:44:50] [PASSED] drm_test_mm_init
[12:44:50] [PASSED] drm_test_mm_debug
[12:44:50] [PASSED] drm_test_mm_align32
[12:44:50] [PASSED] drm_test_mm_align64
[12:44:50] [PASSED] drm_test_mm_lowest
[12:44:50] [PASSED] drm_test_mm_highest
[12:44:50] ===================== [PASSED] drm_mm ======================
[12:44:50] ============= drm_modes_analog_tv (5 subtests) =============
[12:44:50] [PASSED] drm_test_modes_analog_tv_mono_576i
[12:44:50] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[12:44:50] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[12:44:50] [PASSED] drm_test_modes_analog_tv_pal_576i
[12:44:50] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[12:44:50] =============== [PASSED] drm_modes_analog_tv ===============
[12:44:50] ============== drm_plane_helper (2 subtests) ===============
[12:44:50] =============== drm_test_check_plane_state  ================
[12:44:50] [PASSED] clipping_simple
[12:44:50] [PASSED] clipping_rotate_reflect
[12:44:50] [PASSED] positioning_simple
[12:44:50] [PASSED] upscaling
[12:44:50] [PASSED] downscaling
[12:44:50] [PASSED] rounding1
[12:44:50] [PASSED] rounding2
[12:44:50] [PASSED] rounding3
[12:44:50] [PASSED] rounding4
[12:44:50] =========== [PASSED] drm_test_check_plane_state ============
[12:44:50] =========== drm_test_check_invalid_plane_state  ============
[12:44:50] [PASSED] positioning_invalid
[12:44:50] [PASSED] upscaling_invalid
[12:44:50] [PASSED] downscaling_invalid
[12:44:50] ======= [PASSED] drm_test_check_invalid_plane_state ========
[12:44:50] ================ [PASSED] drm_plane_helper =================
[12:44:50] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[12:44:50] ====== drm_test_connector_helper_tv_get_modes_check  =======
[12:44:50] [PASSED] None
[12:44:50] [PASSED] PAL
[12:44:50] [PASSED] NTSC
[12:44:50] [PASSED] Both, NTSC Default
[12:44:50] [PASSED] Both, PAL Default
[12:44:50] [PASSED] Both, NTSC Default, with PAL on command-line
[12:44:50] [PASSED] Both, PAL Default, with NTSC on command-line
[12:44:50] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[12:44:50] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[12:44:50] ================== drm_rect (9 subtests) ===================
[12:44:50] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[12:44:50] [PASSED] drm_test_rect_clip_scaled_not_clipped
[12:44:50] [PASSED] drm_test_rect_clip_scaled_clipped
[12:44:50] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[12:44:50] ================= drm_test_rect_intersect  =================
[12:44:50] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[12:44:50] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[12:44:50] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[12:44:50] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[12:44:50] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[12:44:50] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[12:44:50] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[12:44:50] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[12:44:50] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[12:44:50] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[12:44:50] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[12:44:50] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[12:44:50] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[12:44:50] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[12:44:50] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
stty: 'standard input': Inappropriate ioctl for device
[12:44:50] ============= [PASSED] drm_test_rect_intersect =============
[12:44:50] ================ drm_test_rect_calc_hscale  ================
[12:44:50] [PASSED] normal use
[12:44:50] [PASSED] out of max range
[12:44:50] [PASSED] out of min range
[12:44:50] [PASSED] zero dst
[12:44:50] [PASSED] negative src
[12:44:50] [PASSED] negative dst
[12:44:50] ============ [PASSED] drm_test_rect_calc_hscale ============
[12:44:50] ================ drm_test_rect_calc_vscale  ================
[12:44:50] [PASSED] normal use
[12:44:50] [PASSED] out of max range
[12:44:50] [PASSED] out of min range
[12:44:50] [PASSED] zero dst
[12:44:50] [PASSED] negative src
[12:44:50] [PASSED] negative dst
[12:44:50] ============ [PASSED] drm_test_rect_calc_vscale ============
[12:44:50] ================== drm_test_rect_rotate  ===================
[12:44:50] [PASSED] reflect-x
[12:44:50] [PASSED] reflect-y
[12:44:50] [PASSED] rotate-0
[12:44:50] [PASSED] rotate-90
[12:44:50] [PASSED] rotate-180
[12:44:50] [PASSED] rotate-270
[12:44:50] ============== [PASSED] drm_test_rect_rotate ===============
[12:44:50] ================ drm_test_rect_rotate_inv  =================
[12:44:50] [PASSED] reflect-x
[12:44:50] [PASSED] reflect-y
[12:44:50] [PASSED] rotate-0
[12:44:50] [PASSED] rotate-90
[12:44:50] [PASSED] rotate-180
[12:44:50] [PASSED] rotate-270
[12:44:50] ============ [PASSED] drm_test_rect_rotate_inv =============
[12:44:50] ==================== [PASSED] drm_rect =====================
[12:44:50] ============ drm_sysfb_modeset_test (1 subtest) ============
[12:44:50] ============ drm_test_sysfb_build_fourcc_list  =============
[12:44:50] [PASSED] no native formats
[12:44:50] [PASSED] XRGB8888 as native format
[12:44:50] [PASSED] remove duplicates
[12:44:50] [PASSED] convert alpha formats
[12:44:50] [PASSED] random formats
[12:44:50] ======== [PASSED] drm_test_sysfb_build_fourcc_list =========
[12:44:50] ============= [PASSED] drm_sysfb_modeset_test ==============
[12:44:50] ================== drm_fixp (2 subtests) ===================
[12:44:50] [PASSED] drm_test_int2fixp
[12:44:50] [PASSED] drm_test_sm2fixp
[12:44:50] ==================== [PASSED] drm_fixp =====================
[12:44:50] ============================================================
[12:44:50] Testing complete. Ran 630 tests: passed: 630
[12:44:50] Elapsed time: 27.380s total, 1.717s configuring, 25.245s building, 0.385s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
[12:44:50] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[12:44:52] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[12:45:02] Starting KUnit Kernel (1/1)...
[12:45:02] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[12:45:02] ================= ttm_device (5 subtests) ==================
[12:45:02] [PASSED] ttm_device_init_basic
[12:45:02] [PASSED] ttm_device_init_multiple
[12:45:02] [PASSED] ttm_device_fini_basic
[12:45:02] [PASSED] ttm_device_init_no_vma_man
[12:45:02] ================== ttm_device_init_pools  ==================
[12:45:02] [PASSED] No DMA allocations, no DMA32 required
[12:45:02] [PASSED] DMA allocations, DMA32 required
[12:45:02] [PASSED] No DMA allocations, DMA32 required
[12:45:02] [PASSED] DMA allocations, no DMA32 required
[12:45:02] ============== [PASSED] ttm_device_init_pools ==============
[12:45:02] =================== [PASSED] ttm_device ====================
[12:45:02] ================== ttm_pool (8 subtests) ===================
[12:45:02] ================== ttm_pool_alloc_basic  ===================
[12:45:02] [PASSED] One page
[12:45:02] [PASSED] More than one page
[12:45:02] [PASSED] Above the allocation limit
[12:45:02] [PASSED] One page, with coherent DMA mappings enabled
[12:45:02] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[12:45:02] ============== [PASSED] ttm_pool_alloc_basic ===============
[12:45:02] ============== ttm_pool_alloc_basic_dma_addr  ==============
[12:45:02] [PASSED] One page
[12:45:02] [PASSED] More than one page
[12:45:02] [PASSED] Above the allocation limit
[12:45:02] [PASSED] One page, with coherent DMA mappings enabled
[12:45:02] [PASSED] Above the allocation limit, with coherent DMA mappings enabled
[12:45:02] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[12:45:02] [PASSED] ttm_pool_alloc_order_caching_match
[12:45:02] [PASSED] ttm_pool_alloc_caching_mismatch
[12:45:02] [PASSED] ttm_pool_alloc_order_mismatch
[12:45:02] [PASSED] ttm_pool_free_dma_alloc
[12:45:02] [PASSED] ttm_pool_free_no_dma_alloc
[12:45:02] [PASSED] ttm_pool_fini_basic
[12:45:02] ==================== [PASSED] ttm_pool =====================
[12:45:02] ================ ttm_resource (8 subtests) =================
[12:45:02] ================= ttm_resource_init_basic  =================
[12:45:02] [PASSED] Init resource in TTM_PL_SYSTEM
[12:45:02] [PASSED] Init resource in TTM_PL_VRAM
[12:45:02] [PASSED] Init resource in a private placement
[12:45:02] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[12:45:02] ============= [PASSED] ttm_resource_init_basic =============
[12:45:02] [PASSED] ttm_resource_init_pinned
[12:45:02] [PASSED] ttm_resource_fini_basic
[12:45:02] [PASSED] ttm_resource_manager_init_basic
[12:45:02] [PASSED] ttm_resource_manager_usage_basic
[12:45:02] [PASSED] ttm_resource_manager_set_used_basic
[12:45:02] [PASSED] ttm_sys_man_alloc_basic
[12:45:02] [PASSED] ttm_sys_man_free_basic
[12:45:02] ================== [PASSED] ttm_resource ===================
[12:45:02] =================== ttm_tt (15 subtests) ===================
[12:45:02] ==================== ttm_tt_init_basic  ====================
[12:45:02] [PASSED] Page-aligned size
[12:45:02] [PASSED] Extra pages requested
[12:45:02] ================ [PASSED] ttm_tt_init_basic ================
[12:45:02] [PASSED] ttm_tt_init_misaligned
[12:45:02] [PASSED] ttm_tt_fini_basic
[12:45:02] [PASSED] ttm_tt_fini_sg
[12:45:02] [PASSED] ttm_tt_fini_shmem
[12:45:02] [PASSED] ttm_tt_create_basic
[12:45:02] [PASSED] ttm_tt_create_invalid_bo_type
[12:45:02] [PASSED] ttm_tt_create_ttm_exists
[12:45:02] [PASSED] ttm_tt_create_failed
[12:45:02] [PASSED] ttm_tt_destroy_basic
[12:45:02] [PASSED] ttm_tt_populate_null_ttm
[12:45:02] [PASSED] ttm_tt_populate_populated_ttm
[12:45:02] [PASSED] ttm_tt_unpopulate_basic
[12:45:02] [PASSED] ttm_tt_unpopulate_empty_ttm
[12:45:02] [PASSED] ttm_tt_swapin_basic
[12:45:02] ===================== [PASSED] ttm_tt ======================
[12:45:02] =================== ttm_bo (14 subtests) ===================
[12:45:02] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[12:45:02] [PASSED] Cannot be interrupted and sleeps
[12:45:02] [PASSED] Cannot be interrupted, locks straight away
[12:45:02] [PASSED] Can be interrupted, sleeps
[12:45:02] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[12:45:02] [PASSED] ttm_bo_reserve_locked_no_sleep
[12:45:02] [PASSED] ttm_bo_reserve_no_wait_ticket
[12:45:02] [PASSED] ttm_bo_reserve_double_resv
[12:45:02] [PASSED] ttm_bo_reserve_interrupted
[12:45:02] [PASSED] ttm_bo_reserve_deadlock
[12:45:02] [PASSED] ttm_bo_unreserve_basic
[12:45:02] [PASSED] ttm_bo_unreserve_pinned
[12:45:02] [PASSED] ttm_bo_unreserve_bulk
[12:45:02] [PASSED] ttm_bo_fini_basic
[12:45:02] [PASSED] ttm_bo_fini_shared_resv
[12:45:02] [PASSED] ttm_bo_pin_basic
[12:45:02] [PASSED] ttm_bo_pin_unpin_resource
[12:45:02] [PASSED] ttm_bo_multiple_pin_one_unpin
[12:45:02] ===================== [PASSED] ttm_bo ======================
[12:45:02] ============== ttm_bo_validate (21 subtests) ===============
[12:45:02] ============== ttm_bo_init_reserved_sys_man  ===============
[12:45:02] [PASSED] Buffer object for userspace
[12:45:02] [PASSED] Kernel buffer object
[12:45:02] [PASSED] Shared buffer object
[12:45:02] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[12:45:02] ============== ttm_bo_init_reserved_mock_man  ==============
[12:45:02] [PASSED] Buffer object for userspace
[12:45:02] [PASSED] Kernel buffer object
[12:45:02] [PASSED] Shared buffer object
[12:45:02] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[12:45:02] [PASSED] ttm_bo_init_reserved_resv
[12:45:02] ================== ttm_bo_validate_basic  ==================
[12:45:02] [PASSED] Buffer object for userspace
[12:45:02] [PASSED] Kernel buffer object
[12:45:02] [PASSED] Shared buffer object
[12:45:02] ============== [PASSED] ttm_bo_validate_basic ==============
[12:45:02] [PASSED] ttm_bo_validate_invalid_placement
[12:45:02] ============= ttm_bo_validate_same_placement  ==============
[12:45:02] [PASSED] System manager
[12:45:02] [PASSED] VRAM manager
[12:45:02] ========= [PASSED] ttm_bo_validate_same_placement ==========
[12:45:02] [PASSED] ttm_bo_validate_failed_alloc
[12:45:02] [PASSED] ttm_bo_validate_pinned
[12:45:02] [PASSED] ttm_bo_validate_busy_placement
[12:45:02] ================ ttm_bo_validate_multihop  =================
[12:45:02] [PASSED] Buffer object for userspace
[12:45:02] [PASSED] Kernel buffer object
[12:45:02] [PASSED] Shared buffer object
[12:45:02] ============ [PASSED] ttm_bo_validate_multihop =============
[12:45:02] ========== ttm_bo_validate_no_placement_signaled  ==========
[12:45:02] [PASSED] Buffer object in system domain, no page vector
[12:45:02] [PASSED] Buffer object in system domain with an existing page vector
[12:45:02] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[12:45:02] ======== ttm_bo_validate_no_placement_not_signaled  ========
[12:45:02] [PASSED] Buffer object for userspace
[12:45:02] [PASSED] Kernel buffer object
[12:45:02] [PASSED] Shared buffer object
[12:45:02] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[12:45:02] [PASSED] ttm_bo_validate_move_fence_signaled
[12:45:02] ========= ttm_bo_validate_move_fence_not_signaled  =========
[12:45:02] [PASSED] Waits for GPU
[12:45:02] [PASSED] Tries to lock straight away
[12:45:02] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[12:45:02] [PASSED] ttm_bo_validate_happy_evict
[12:45:02] [PASSED] ttm_bo_validate_all_pinned_evict
[12:45:02] [PASSED] ttm_bo_validate_allowed_only_evict
[12:45:02] [PASSED] ttm_bo_validate_deleted_evict
[12:45:02] [PASSED] ttm_bo_validate_busy_domain_evict
[12:45:02] [PASSED] ttm_bo_validate_evict_gutting
[12:45:02] [PASSED] ttm_bo_validate_recrusive_evict
stty: 'standard input': Inappropriate ioctl for device
[12:45:02] ================= [PASSED] ttm_bo_validate =================
[12:45:02] ============================================================
[12:45:02] Testing complete. Ran 101 tests: passed: 101
[12:45:02] Elapsed time: 11.421s total, 1.684s configuring, 9.470s building, 0.238s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


